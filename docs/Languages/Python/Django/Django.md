---
title: Django
description: Diango is a high-level Python web framework that encourages rapid development and clean, pragmatic design
---

# Django

[Django](https://www.djangoproject.com/) is a high-level Python web framework that encourages rapid development and clean, pragmatic design. Built by experienced developers, it takes care of much of the hassle of web development, so you can focus on writing your app without needing to reinvent the wheel. It’s free and open source

1. Install virtualenv

   ```python
   pip install virtualenv
   ```

2. Create the virtual environment

   ```bash
   virtualenv --no-site-packages name
   ```

3. Activate the virtual environment

   ```bash
   source name_of_env_dir/bin/activate
   ```

4. Install Django if not install

   ```bash
   pip install Django
   ```

5. Start your project

   ```bash
   django-admin startproject project_name
   ```

6. Check if the project is created

   ```bash
   python manage.py runserver
   ```

7. Open the link given in the browser: `http://localhost:8000` or `http://127.0.0.1:8000`
