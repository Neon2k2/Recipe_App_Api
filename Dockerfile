FROM python:3.9-alpine3.13
LABEL maintainer'neon'

# this will tell the python that you dont wanna buffer the output and print directly to the console
ENV PYTHONUNBUFFERED 1 

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \ 
    /py/bin/pip install --uprade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH='/py/bin:$PATH'

USER django-user
