from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.models import User, Group
from django.shortcuts import render, redirect
from django.http import HttpResponse


# Create your views here.
from carcare.models import ReservationModel, QueueModel, ConfirmationModel, DeliveryModel, SatisfactionModel
from .forms import RegisterForm, ReservationForm, DeliveryForm, ConfirmationForm, SatisfactionForm


def my_register(request):
    # if this is a POST request we need to process the form data
    template = 'carcare/register.html'

    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form = RegisterForm(request.POST)
        # check whether it's valid:
        if form.is_valid():
            if User.objects.filter(username=form.cleaned_data['username']).exists():
                return render(request, template, {
                    'form': form,
                    'error_message': 'Username already exists.'
                })
            elif User.objects.filter(email=form.cleaned_data['email']).exists():
                return render(request, template, {
                    'form': form,
                    'error_message': 'Email already exists.'
                })
            elif form.cleaned_data['password'] != form.cleaned_data['password_repeat']:
                return render(request, template, {
                    'form': form,
                    'error_message': 'Passwords do not match.'
                })
            else:
                # Create the user:
                user = User.objects.create_user(
                    form.cleaned_data['username'],
                    form.cleaned_data['email'],
                    form.cleaned_data['password']
                )
                user.first_name = form.cleaned_data['first_name']
                user.last_name = form.cleaned_data['last_name']
                user.phone_number = form.cleaned_data['phone_number']
                user.save()
                group = Group.objects.get(name='Customers')
                user.groups.add(group)

                # Login the user
                login(request, user)

                # redirect to accounts page:
                return redirect('index')

    # No post data availabe, let's just show the page.
    else:
        form = RegisterForm()

    context = {'form': form}
    return render(request, template_name='carcare/register.html', context=context)


def my_login(request):
    context = {}

    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user:
            login(request, user)
            next_url = request.POST.get('next_url')
            if next_url:
                return redirect(next_url)
            else:
                if request.user.is_superuser:
                    return redirect('/admin/')
                return redirect('index')
        else:
            context['username'] = username
            context['password'] = password
            context['error'] = 'Wrong username or password!'

    return render(request, template_name='carcare/login.html', context=context)


@login_required
def my_logout(request):
    logout(request)
    return redirect('index')


def index(request):

    return render(request, template_name='carcare/index.html')


def about(request):

    return render(request, template_name='carcare/about.html')


@login_required
def reservation(request):
    if request.method == 'POST':
        form = ReservationForm(request.POST)

        if form.is_valid():
            check = form.save(commit=False)
            check.user = request.user
            model = form.save()
            model_id = model.pk
            QueueModel.objects.create(
                reservation_id=model_id,
                car_id=form.cleaned_data.get('car_id'),
                car_type=form.cleaned_data.get('car_type'),
                queue_desc=form.cleaned_data.get('car_desc'),
                serve_type=form.cleaned_data.get('serve_type'),
                reserve_time=form.cleaned_data.get('reserve_time'),
            )
            ConfirmationModel.objects.create(
                reservation_id=model_id,
                confirm_title=form.cleaned_data.get('car_id'),
            )
            SatisfactionModel.objects.create(
                reservation_id=model_id,
                satisfaction_title=form.cleaned_data.get('car_id'),
            )

            return redirect('status')

    else:
        form = ReservationForm()

    context = {'form': form}
    return render(request, template_name='carcare/services.html', context=context)


@login_required
def update(request):
    data = []
    data2 = []
    for detail in ReservationModel.objects.filter(user=request.user.id).order_by('-reserve_time'):
        data.append(
            {
                'id': detail.id,
                'car_id': detail.car_id,
                'car_desc': detail.car_desc,
                'car_type': detail.car_type,
                'serve_type': detail.serve_type,
                'receive_time': detail.receive_time,
                'reserve_time': detail.reserve_time,
                'serve_time': detail.serve_time,
                'finish': detail.finish
            }
        )
    for detail in DeliveryModel.objects.filter(user=request.user.id).order_by('serve_time'):
        data2.append(
            {
                'id': detail.id,
                'serve_time': detail.serve_time,
                'car_type': detail.car_type,
                'address': detail.address,
            }
        )
    form2 = data2
    form = data
    return render(request, 'carcare/update.html', {'reservation': form, 'delivery': form2})


@login_required
def delete(request, reservation_id):
    reserve = ReservationModel.objects.get(pk=reservation_id)

    if request.method == 'POST':
        reserve.delete()
        return redirect('update')

    return render(request, 'carcare/delete.html', {'reserve': reserve})


@login_required
def delivery(request):
    if request.method == 'POST':
        form = DeliveryForm(request.POST)

        if form.is_valid():
            check = form.save(commit=False)
            check.user = request.user
            form.save()

            return redirect('status')

    else:
        form = DeliveryForm()

    context = {'form': form}
    return render(request, template_name='carcare/delivery.html', context=context)


def status(request):
    data = []
    data2 = []
    for detail in QueueModel.objects.all().order_by('reserve_time'):
        data.append(
            {
                'car_id': detail.car_id,
                'queue_desc': detail.queue_desc,
                'car_type': detail.car_type,
                'serve_type': detail.serve_type,
                'receive_time': detail.receive_time,
                'reserve_time': detail.reserve_time,
                'serve_time': detail.serve_time
            }
        )
    form = data
    for detail in DeliveryModel.objects.all().order_by('serve_time'):
        data2.append(
            {
                'serve_time': detail.serve_time,
                'car_type': detail.car_type,
                'address': detail.address,
            }
        )
    form2 = data2

    context = {'form': form, 'form2': form2}
    return render(request, template_name='carcare/status.html', context=context)


@login_required
def confirmation(request, reservation_id):

    reserve = ConfirmationModel.objects.get(id=reservation_id)

    if request.method == 'POST':
        form = ConfirmationForm(request.POST, instance=reserve)

        if form.is_valid():
            check = form.save(commit=False)
            check.confirm_desc = form.cleaned_data.get('confirm_desc')
            check.confirm_bool = form.cleaned_data.get('confirm_bool')
            form.save()

            return redirect('update')

    else:
        form = ConfirmationForm(instance=reserve)

    return render(request, 'carcare/confirm.html', {'form': form, 'reservation': reserve})


@login_required
def satisfaction(request, reservation_id):

    reserve = SatisfactionModel.objects.get(id=reservation_id)

    if request.method == 'POST':
        form = SatisfactionForm(request.POST, instance=reserve)

        if form.is_valid():
            check = form.save(commit=False)
            check.satisfaction_desc = form.cleaned_data.get('satisfaction_desc')
            form.save()

            return redirect('update')

    else:
        form = SatisfactionForm(instance=reserve)

    return render(request, 'carcare/satisfaction.html', {'form': form, 'reservation': reserve})

