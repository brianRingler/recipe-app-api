FROM python:3.7-alpine

# Setting the env this command will help reduce issues
ENV PYTHONUNBUFFERED 1

# copy from directory to image
COPY ./requirements.txt /requirements.txt
# this is install pip install into image
RUN pip install -r /requirements.txt

# make a app folder
RUN mkdir /app
# switches it as default directroy 
WORKDIR /app
# then copy from local machine to the docker image
COPY ./app /app

# adduser -D means a user that runs apps only
RUN adduser -D user
# this switches the user to docker 
USER user 

