from django import forms
from django.db.models.functions import datetime
from django.utils.timezone import now, localtime, activate
from webcarcare import settings

activate(settings.TIME_ZONE)

from carcare.models import ReservationModel, DeliveryModel, ConfirmationModel, SatisfactionModel


class RegisterForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class': 'form-control'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password_repeat = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    first_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    phone_number = forms.CharField(widget=forms.NumberInput(attrs={'class': 'form-control'}))


class ReservationForm(forms.ModelForm):
    car_id = forms.CharField(label='หมายเลขทะเบียนรถยนต์', max_length=10, widget=forms.TextInput(attrs={'class': 'form-control'}))
    car_desc = forms.CharField(label='รายละเอียดรถยนต์', widget=forms.Textarea(attrs={'class': 'form-control'}), required=False)
    car_type = forms.ChoiceField(label='ประเภทรถยนต์', choices=ReservationModel.TYPES, initial='S')
    serve_type = forms.ChoiceField(label='ประเภทบริการ', choices=ReservationModel.TYPES2, initial='บริการล้างสี + ดูดฝุ่น')
    reserve_time = forms.TimeField(label='เวลาที่ต้องการมาใช้บริการ', widget=forms.TimeInput(format='%H:%M', attrs={'class': 'form-control'}), initial='HH:MM')

    class Meta:
        model = ReservationModel
        exclude = ['user', 'serve_time', 'receive_time', 'finish']

    def clean_reserve_time(self):
        data = self.cleaned_data['reserve_time']
        if data < localtime(now()).time():
            raise forms.ValidationError('ไม่สามารถเลือกเวลาในอดีตได้')
        print(data)
        return data


class DeliveryForm(forms.ModelForm):
    car_id = forms.CharField(label='หมายเลขทะเบียนรถยนต์', max_length=10,
                             widget=forms.TextInput(attrs={'class': 'form-control'}))
    car_type = forms.ChoiceField(label='ประเภทรถยนต์', choices=ReservationModel.TYPES, initial='S')
    address = forms.CharField(label='ที่อยู่', widget=forms.Textarea(attrs={'class': 'form-control'}))
    deliver_desc = forms.CharField(label='รายละเอียดรถยนต์', widget=forms.Textarea(attrs={'class': 'form-control'}),  required=False)
    serve_time = forms.DateTimeField(label='วัน/เวลาที่สะดวกรับบริการ',
                                     widget=forms.DateTimeInput(format='%d/%m/%Y %H:%M',
                                                                attrs={'class': 'form-control'}),
                                     initial='mm/dd/yyyy HH:MM')

    class Meta:
        model = DeliveryModel
        fields = ['car_id', 'deliver_desc', 'address', 'serve_time', 'car_type']

    def clean_serve_time(self):
        data = self.cleaned_data['serve_time']
        if data < datetime.timezone.now():
            raise forms.ValidationError('ไม่สามารถเลือกวันและเวลาในอดีตได้')
        return data


class ConfirmationForm(forms.ModelForm):
    confirm_title = forms.CharField(label='ทะเบียนรถยนต์ของคุณ', widget=forms.TextInput(attrs={'class': 'form-control'}))
    confirm_desc = forms.CharField(label='ปัญหาที่พบ', widget=forms.Textarea(attrs={'class': 'form-control'}), required=False)
    confirm_bool = forms.BooleanField(label='ยืนยันการรับรถยนต์', widget=forms.CheckboxInput(attrs={'class': 'form-control'}), required=False)

    class Meta:
        model = ConfirmationModel
        fields = ['confirm_title', 'confirm_desc', 'confirm_bool']


class SatisfactionForm(forms.ModelForm):
    satisfaction_title = forms.CharField(label='ทะเบียนรถยนต์ของคุณ', widget=forms.TextInput(attrs={'class': 'form-control'}))
    satisfaction_desc = forms.CharField(label='รายละเอียด', widget=forms.Textarea(attrs={'class': 'form-control'}))

    class Meta:
        model = SatisfactionModel
        fields = ['satisfaction_title', 'satisfaction_desc']


