from django.db import models
from django.contrib.auth.models import User

# Create your models here.


class ReservationModel(models.Model):
    user = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    car_id = models.CharField(max_length=10)
    car_desc = models.TextField(null=True, blank=True)

    car_type1 = 'S'
    car_type2 = 'M'
    car_type3 = 'L'
    car_type4 = 'XL'
    car_type5 = 'XXL'
    TYPES = (
        (car_type1, 'S'),
        (car_type2, 'M'),
        (car_type3, 'L'),
        (car_type4, 'XL'),
        (car_type5, 'XXL'),
    )

    car_type = models.CharField(max_length=20, choices=TYPES, default='S')

    serve_type1 = 'บริการล้างสี + ดูดฝุ่น'
    serve_type2 = 'บริการเคลือบสีด้วย Quick Wax'
    serve_type3 = 'บริการเคลือบสีด้วย Meguiar’s Synthetic Sealant 2.0 (เบอร์ 21)'
    serve_type4 = 'บริการเคลือบแก้ว'
    TYPES2 = (
        (serve_type1, 'บริการล้างสี + ดูดฝุ่น'),
        (serve_type2, 'บริการเคลือบสีด้วย Quick Wax'),
        (serve_type3, 'บริการเคลือบสีด้วย Meguiar’s Synthetic Sealant 2.0 (เบอร์ 21)'),
        (serve_type4, 'บริการเคลือบแก้ว'),
    )

    serve_type = models.CharField(max_length=255, choices=TYPES2, default='บริการล้างสี + ดูดฝุ่น')
    reserve_time = models.TimeField(null=True, blank=True)
    serve_time = models.TimeField(null=True, blank=True)
    receive_time = models.TimeField(null=True, blank=True)
    finish = models.BooleanField(default=False)

    def __str__(self):
        return '(%s) %s' % (self.car_id, self.user)


class DeliveryModel(models.Model):
    user = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    car_id = models.CharField(max_length=10, null=True)
    car_type = models.CharField(max_length=20)
    deliver_desc = models.TextField(null=True, blank=True)
    address = models.TextField()
    serve_time = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return '(%s) %s' % (self.user, self.car_id)


class QueueModel(models.Model):
    car_id = models.CharField(max_length=10, null=True)

    car_type1 = 'S'
    car_type2 = 'M'
    car_type3 = 'L'
    car_type4 = 'XL'
    car_type5 = 'XXL'
    TYPES = (
        (car_type1, 'S'),
        (car_type2, 'M'),
        (car_type3, 'L'),
        (car_type4, 'XL'),
        (car_type5, 'XXL'),
    )
    car_type = models.CharField(max_length=20, choices=TYPES, default='S')
    queue_desc = models.TextField(null=True, blank=True)

    serve_type1 = 'บริการล้างสี + ดูดฝุ่น'
    serve_type2 = 'บริการเคลือบสีด้วย Quick Wax'
    serve_type3 = 'บริการเคลือบสีด้วย Meguiar’s Synthetic Sealant 2.0 (เบอร์ 21)'
    serve_type4 = 'บริการเคลือบแก้ว'
    TYPES2 = (
        (serve_type1, 'บริการล้างสี + ดูดฝุ่น'),
        (serve_type2, 'บริการเคลือบสีด้วย Quick Wax'),
        (serve_type3, 'บริการเคลือบสีด้วย Meguiar’s Synthetic Sealant 2.0 (เบอร์ 21)'),
        (serve_type4, 'บริการเคลือบแก้ว'),
    )
    serve_type = models.CharField(max_length=255, choices=TYPES2, default='บริการล้างสี + ดูดฝุ่น')
    reserve_time = models.TimeField(null=True, blank=True)
    serve_time = models.TimeField(null=True, blank=True)
    receive_time = models.TimeField(null=True, blank=True)

    reservation = models.OneToOneField(ReservationModel, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return '%s' % (self.car_id)


class SatisfactionModel(models.Model):
    # user = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    satisfaction_title = models.CharField(max_length=100)
    satisfaction_desc = models.TextField(null=True, blank=True)

    reservation = models.OneToOneField(ReservationModel, on_delete=models.CASCADE)

    def __str__(self):
        return '(%s) %s' % (self.reservation.car_id, self.satisfaction_title)


class ConfirmationModel(models.Model):
    # user = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    confirm_title = models.CharField(max_length=100)
    confirm_desc = models.TextField(null=True, blank=True)
    confirm_bool = models.BooleanField(default=False)

    reservation = models.OneToOneField(ReservationModel, on_delete=models.CASCADE)

    def __str__(self):
        return '(%s) %s' % (self.reservation.car_id, self.confirm_title)


# class ServiceModel(models.Model):
#     service_name = models.CharField(max_length=100)
#     service_desc = models.TextField(null=True, blank=True)
#     cost = models.FloatField()
#
#     reservation = models.ManyToManyField(ReservationModel, through='ReserveServiceModel')
#
#     def __str__(self):
#         return '(%s) %s' % (self.reservation.car_id, self.service_name)
#
#
# class ReserveServiceModel(models.Model):
#     service = models.ForeignKey(ServiceModel, on_delete=models.CASCADE)
#     Reservation = models.ForeignKey(ReservationModel, on_delete=models.CASCADE)
#     cost = models.FloatField()
