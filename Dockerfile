FROM python:3.9-slim


WORKDIR /app
 
COPY . .

RUN pip install -r requirements.txt
 
RUN pip install -e . 

ENV FLASK_APP=flaskr
ENV FLASK_ENV=development

EXPOSE 5000

CMD ["/bin/sh", "-c", "flask init-db && flask run --host=0.0.0.0 --port=5000 --debug"]


