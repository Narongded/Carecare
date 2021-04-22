# Generated by Django 2.1.7 on 2019-05-02 20:54

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('carcare', '0005_remove_deliverymodel_reservation'),
    ]

    operations = [
        migrations.AddField(
            model_name='deliverymodel',
            name='user',
            field=models.ForeignKey(default=2, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]