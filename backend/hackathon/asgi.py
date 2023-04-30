"""
ASGI config for hackathon project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.1/howto/deployment/asgi/
"""

import os

from channels.auth import AuthMiddlewareStack
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter

from django.urls import re_path

from notification import consumers

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'hackathon.settings')

application = ProtocolTypeRouter({
    'http' : get_asgi_application(),
    'websocket' : AuthMiddlewareStack(
        URLRouter([
            re_path(r'ws/notification/$', consumers.NotificationConsumer.as_asgi())
        ])
    )
})
