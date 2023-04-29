from django.db import models


class EventType(models.Model):
    name = models.CharField(max_length=255)


class Event(models.Model):
    eventtype = models.ForeignKey(EventType,
                                  null=True,
                                  on_delete=models.SET_NULL)

    text = models.TextField()