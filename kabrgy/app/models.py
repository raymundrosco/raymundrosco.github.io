from django.db import models
from django.contrib.postgres.fields import ArrayField

class Requirement(models.Model):
    title=models.CharField(max_length=255)
    dueDate=models.DateTimeField()
    description=models.TextField(default=None, blank=True)
    TODO_STATUS = 1
    MISSING_STATUS = 2
    DONE_STATUS = 3
    STATUS_CHOICES = (
        (TODO_STATUS, "Todo"),
        (MISSING_STATUS, "Missing"),
        (DONE_STATUS, "Done")
    )
    status=models.IntegerField(choices=STATUS_CHOICES,default=TODO_STATUS)
    file=models.FileField(upload_to ='uploads/', blank=True)
    comments=ArrayField(models.TextField())

class SK(models.Model):
    username=models.CharField(max_length=36)
    name=models.CharField(max_length=50, default=None)
    email=models.EmailField()
    password=models.TextField()
    logo=models.ImageField(upload_to ='uploads/', blank=True)
    COMPLIANT_BADGE = 1
    EARLY_BADGE = 2
    TRANSPARENT_BADGE = 3
    IMPACT_BADGE = 4
    BADGE_CHOICES = (
        # (NO_BADGE, "No Badge"),
        (COMPLIANT_BADGE, "Compliant Badge"),
        (EARLY_BADGE, "Early Badge"),
        (TRANSPARENT_BADGE, "Transparent Badge"),
        (IMPACT_BADGE, "Impact Badge")
    )
    badge=ArrayField(models.IntegerField(choices=BADGE_CHOICES))
    xp=models.IntegerField(default=0)