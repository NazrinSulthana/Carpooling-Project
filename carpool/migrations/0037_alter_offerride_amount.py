# Generated by Django 3.2.7 on 2021-12-12 00:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carpool', '0036_auto_20211212_0004'),
    ]

    operations = [
        migrations.AlterField(
            model_name='offerride',
            name='amount',
            field=models.IntegerField(default=100, max_length=100),
        ),
    ]