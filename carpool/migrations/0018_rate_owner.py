# Generated by Django 3.2.7 on 2021-12-06 09:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carpool', '0017_rate_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='rate',
            name='owner',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='carpool.ownerentry'),
        ),
    ]
