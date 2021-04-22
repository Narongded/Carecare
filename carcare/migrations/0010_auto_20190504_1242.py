# Generated by Django 2.1.7 on 2019-05-04 05:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carcare', '0009_auto_20190503_1813'),
    ]

    operations = [
        migrations.AddField(
            model_name='queuemodel',
            name='car_id',
            field=models.CharField(max_length=10, null=True),
        ),
        migrations.AddField(
            model_name='queuemodel',
            name='car_type',
            field=models.CharField(max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='queuemodel',
            name='queue_desc',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='queuemodel',
            name='receive_time',
            field=models.TimeField(null=True),
        ),
        migrations.AddField(
            model_name='queuemodel',
            name='reserve_time',
            field=models.TimeField(null=True),
        ),
        migrations.AddField(
            model_name='queuemodel',
            name='serve_type',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='reservationmodel',
            name='receive_time',
            field=models.TimeField(null=True),
        ),
        migrations.AddField(
            model_name='reservationmodel',
            name='serve_time',
            field=models.TimeField(null=True),
        ),
        migrations.AlterField(
            model_name='queuemodel',
            name='serve_time',
            field=models.TimeField(null=True),
        ),
    ]