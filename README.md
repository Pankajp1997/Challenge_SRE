# Challenge_SRE
Today, you’ll explore the power of CI/CD automation by setting up a Jenkins pipeline for a Python Flask application. This hands-on challenge will help you understand the essentials of CI/CD practices, including testing, containerization, and automated deployment.



## Requirements:
Pipeline Setup:
Clone the Repository:

### Use the following GitHub repository for the Python Flask app:
Flask Example App.
Set Up the Environment:

Install dependencies using pip and create a Python virtual environment.
Run Unit Tests:

Execute unit tests using pytest to validate the app.
Build a Docker Image:

Use a Dockerfile to containerize the application.
Push Docker Image:

Push the image to a container registry (e.g., Docker Hub).
Deploy the Application:

Deploy the container locally, exposing it on port 5000.

Why This Matters:
CI/CD pipelines are the backbone of modern DevOps workflows, enabling rapid, reliable application development and deployment. By completing this challenge, you'll enhance your skills in setting up robust automation for Python-based applications.

![image](https://github.com/user-attachments/assets/d97b22c9-a69c-4010-b243-4522f86a2d2d)

Run the latest docker image to create a container. using 
docker run -it -p 5000:5000 <docker-image-name> 
Make sure you have opened the inbound rule 5000 for your instance. 
![image](https://github.com/user-attachments/assets/17efe56d-6f5d-4d42-a711-165f29c3e905)

