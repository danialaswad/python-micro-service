FROM python:3.8-rc

MAINTAINER Danial Aswad 

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY ./src/ /app/src/

WORKDIR /app/src

CMD ["python", "main.py" ]
