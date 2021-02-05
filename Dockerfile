FROM python:3.7-alpine
MAINTAINER clintonruairi

# Tells Python to run unbuffered - doesn't allow Python
# to buffer output, prints them directly.
ENV PYTHONUNBUFFERED 1

# Dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt
# Make directory in Docker image to store app soure code.
RUN mkdir /app
# Switches to this as our default directory.
WORKDIR /app
# Copies from local machine to app on image.
COPY ./app /app
# create a user that'll run the application.
# -D = for running apps only.
RUN adduser -D user
# switches Docker to this user.
# for securirty. If we don't do this, Docker will run
# this using the root account. Not rec'd - if app compromised,
# can do malicious shit.
USER user
