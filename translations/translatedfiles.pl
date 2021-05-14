<!DOCTYPE html>
{% load static %}
<html lang="pl">
  {%block head%}
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{% static 'css/all.min.css' %}">
    <link rel="stylesheet" href="{% static 'css/bootstrap.css' %}">
    <link rel="stylesheet" href="{% static 'css/accounts.css' %}">
    
</head>
{%endblock head%}
<body>

    <div class="container-fluid">
        <nav class="navbar navbar-expand-sm navbar-dark bg-info justify-content-center">
            <ul class="navbar-nav">
              <li class="nav-item">
                <h3><a class="nav-link" href="{% url 'home' %}">Home</a></h3>
              </li>
              {% if user.is_authenticated %}
              <li class="nav-item">
                <h3><a class="nav-link" href="javascript:{document.getElementById('logout').submit()}">Logout</a></h3>
                <form id="logout" method="POST" action="{% url 'logout'%}">
                  {% csrf_token %}
                  <input type="hidden">
                </form>
              </li>
              {% else %}
              <li class="nav-item">
                <h3><a class="nav-link" href="{% url 'register' %}">Register</a></h3>
              </li>
              <li class="nav-item">
                <h3><a class="nav-link" href="{% url 'login' %}">Login</a></h3>
              </li>
              {% endif %}
              
            </ul>
         </nav>
          <br>
{%block content%} {%endblock content%}
    
<script src="{%static 'js/jquery.js' %}"></script>
<script src="{%static 'js/popper.js' %}"></script>
<script src="{%static 'js/all.min.js' %}"></script>
<script src="{%static 'js/bootstrap.js' %}"></script>
</body>
</html>
