# Generated by Django 2.1.7 on 2019-05-04 14:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('carcare', '0015_reservationmodel_fininsh'),
    ]

    operations = [
        migrations.RenameField(
            model_name='reservationmodel',
            old_name='fininsh',
            new_name='finish',
        ),
    ]
