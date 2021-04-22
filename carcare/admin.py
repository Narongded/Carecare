from django.contrib import admin

# Register your models here.
from carcare.models import ReservationModel, QueueModel, ConfirmationModel, SatisfactionModel, DeliveryModel


class ReserveAdmin(admin.ModelAdmin):
    list_display = ['user', 'car_id', 'car_type', 'serve_type', 'reserve_time', 'serve_time', 'receive_time']
    list_per_page = 15

    list_filter = ['car_type', 'serve_type']
    search_fields = ['car_id', 'reserve_time', 'serve_time', 'receive_time']

    fieldsets = [
        ('Time', {'fields': ['reserve_time', 'serve_time', 'receive_time']}),
        ('Done', {'fields': ['finish']})
    ]


admin.site.register(ReservationModel, ReserveAdmin)


class DeliveryAdmin(admin.ModelAdmin):
    list_display = ['car_type', 'deliver_desc', 'serve_time', 'address']

    fieldsets = [
        ('Edit Form', {'fields': ['serve_time']}),
    ]


admin.site.register(DeliveryModel, DeliveryAdmin)


class QueueAdmin(admin.ModelAdmin):
    list_display = ['car_id', 'car_type', 'serve_type', 'reserve_time', 'serve_time', 'receive_time']
    list_per_page = 15

    list_filter = ['car_type', 'serve_type']
    search_fields = ['car_id', 'reserve_time', 'serve_time', 'receive_time']
    fieldsets = [
        ('Set Queue', {'fields': ['car_id', 'car_type', 'serve_type']}),
        ('Time', {'fields': ['serve_time', 'receive_time']})
    ]


admin.site.register(QueueModel, QueueAdmin)


class ConfirmAdmin(admin.ModelAdmin):
    list_display = ['confirm_title', 'confirm_bool']
    list_per_page = 15

    search_fields = ['confirm_title']

    fieldsets = [
        ('Edit Form', {'fields': ['confirm_title']}),
    ]


admin.site.register(ConfirmationModel, ConfirmAdmin)


class SatisfactionAdmin(admin.ModelAdmin):
    list_display = ['satisfaction_title', 'satisfaction_desc']
    list_per_page = 15

    search_fields = ['satisfaction_title']

    fieldsets = [
        ('Edit Form', {'fields': ['satisfaction_title']}),
    ]


admin.site.register(SatisfactionModel, SatisfactionAdmin)
