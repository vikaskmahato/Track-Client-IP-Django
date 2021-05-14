{% extends 'base.html'%}
{% load static %}

{%block content%}
{% if user.is_authenticated %}
<div class="alert alert-success" role="alert">
    Your IP Address is :- {{client_ip}}
  </div>
{% else %}
<div class="alert alert-danger" role="alert">
    Login to see your IP Address  !
  </div>
{% endif %}
    
{%endblock content%}