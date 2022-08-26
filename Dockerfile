FROM ubuntu:latest
FROM python:3.9

RUN apt-get update
RUN apt-get install pip -y
RUN pip install django==1.11
RUN pip install --user pipenv

COPY . .

RUN pip install -r requirements.txt

RUN cd lets_quiz

WORKDIR lets_quiz

RUN python3 manage.py migrate
RUN python3 manage.py createsuperuser

COPY . .
EXPOSE 80
CMD ["python3", "manage.py", "runserver", "0.0.0.0:80"]
