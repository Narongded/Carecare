# Generated by Django 2.1.7 on 2019-05-04 14:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carcare', '0014_auto_20190504_2115'),
    ]

    operations = [
        migrations.AddField(
            model_name='reservationmodel',
            name='fininsh',
            field=models.BooleanField(default=False),
        ),
    ]