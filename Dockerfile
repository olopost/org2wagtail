FROM python:3
ENV PYTHON_UNBUFFURED 1
RUN mkdir -p /code
RUN mkdir -p /static
RUN mkdir -p /media
WORKDIR /code
COPY requirements.txt /code
RUN pip install -r requirements.txt
COPY . /code
EXPOSE 8000
WORKDIR /code/meyn
ENV DJANGO_SETTINGS_MODULE=meyn.settings.container
RUN python manage.py migrate
RUN python manage.py initadmin
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
