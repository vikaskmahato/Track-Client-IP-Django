from django.contrib.auth.signals import user_logged_in
from django.contrib.auth.models import User
from django.dispatch import receiver


@receiver(user_logged_in, sender=User)
def login(sender, request, user, **kwargs):
    client_ip=request.META.get('REMOTE_ADDR')
    request.session['client_ip']=client_ip
