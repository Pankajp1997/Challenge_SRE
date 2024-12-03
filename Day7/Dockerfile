# use the python's Base image
FROM python:3.9-slim
# setting up the workdirectory for the application
WORKDIR /app
# Copying all the files into the workdirectory set by previous param
COPY . .
# Installing the flask using the requirements.txt
RUN pip install -r requirements.txt
# installing the flaskr 
RUN pip install -e .
# setting up the environements needed to run the application smootly 
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development
#Exposing the port 
EXPOSE 5000
# Running the command for initialising the databas as well as for the application to run
CMD ["/bin/sh", "-c", "flask init-db && flask run --host=0.0.0.0 --port=5000 --debug"]
