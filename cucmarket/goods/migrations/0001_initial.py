# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2020-06-23 01:19
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.manager


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=20)),
                ('type', models.CharField(max_length=20)),
                ('picture', models.ImageField(upload_to='goods')),
                ('price', models.DecimalField(decimal_places=2, max_digits=5)),
                ('isDelete', models.BooleanField(default=False)),
                ('address', models.CharField(max_length=100)),
                ('description', models.CharField(max_length=200)),
            ],
            managers=[
                ('goods', django.db.models.manager.Manager()),
            ],
        ),
    ]
