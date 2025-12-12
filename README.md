# Medical Cost Prediction Web Application

This is a Flask-based web application that predicts medical insurance costs based on user inputs such as age, BMI, number of children, and other factors. The project is Dockerized and deployed with a CI/CD pipeline that integrates DockerHub and AWS ECR.

## Features

- **Flask Web Application**: A simple web interface to input data and get medical cost predictions.
- **Machine Learning Pipeline**: Uses a pre-trained model to predict insurance costs based on input data.
- **Dockerized**: The application is fully containerized using Docker, ensuring easy deployment and scalability.
- **CI/CD Pipelines**: Automated continuous integration and deployment to DockerHub and AWS ECR using GitHub Actions.
  
---

## Table of Contents

- [Technologies Used](#technologies-used)
- [How to Run Locally](#how-to-run-locally)
- [Docker Setup](#docker-setup)
- [CI/CD Pipelines](#ci-cd-pipelines)
- [AWS ECR Integration](#aws-ecr-integration)
  

---

## Technologies Used

- **Flask**: Python-based micro-framework for web applications.
- **scikit-learn**: Used for the pre-trained machine learning model.
- **Docker**: Containerization platform used to package the application.
- **AWS ECR**: Amazon Elastic Container Registry to store Docker images.
- **GitHub Actions**: CI/CD pipeline for continuous integration and deployment.
  
---

## How to Run Locally

### Prerequisites

- Python 3.9
- Docker
- Git

### Steps

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/your-repository.git
    cd your-repository
    ```

2. **Create and activate a virtual environment**:
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows: venv\Scripts\activate
    ```

3. **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Run the Flask app**:
    ```bash
    python app.py
    ```

5. **Access the app**: 
   - Open a browser and go to `http://127.0.0.1:5000`

---

## Docker Setup

To run the application using Docker:

1. **Build the Docker image**:
    ```bash
    docker build -t medicalcost-app .
    ```

2. **Run the Docker container**:
    ```bash
    docker run -p 5000:5000 medicalcost-app
    ```

3. **Access the app**: 
   - Go to `http://localhost:5000`

---

## CI/CD Pipelines

### Overview

This project has an automated CI/CD pipeline that performs the following steps:
  
1. **Build the Docker Image**: Every time changes are pushed to the `main` branch, the Docker image is built.
2. **Run Tests**: Pytest is used to run unit tests on the app before deployment.
3. **Push to DockerHub**: The Docker image is automatically pushed to DockerHub.
4. **Push to AWS ECR**: The same image is tagged and pushed to AWS ECR for deployment in the cloud.

### GitHub Actions Workflow

The pipeline is defined in `.github/workflows/main.yaml`, with these stages:
  
- **Build and Test**: Builds the Docker image and runs tests.
- **Push to DockerHub**: Pushes the image to your DockerHub repository.
- **Push to AWS ECR**: Tags the image and pushes it to AWS ECR for cloud deployment.

To configure the pipeline, you need to set the following GitHub secrets:
  
- `DOCKER_USERNAME`: Your DockerHub username.
- `DOCKER_PASSWORD`: Your DockerHub password or access token.
- `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `ECR_REPOSITORY`: The name of your ECR repository.

---

## AWS ECR Integration

The Docker image is pushed to **AWS Elastic Container Registry (ECR)**, which stores the container image for deployment. The repository used for this project is `medicalcost`.

To view the image in ECR:
1. Login to your AWS account.
2. Navigate to **ECR**.
3. Find the repository named `medicalcost`.
4. You should see the latest pushed image.

### Pushing to ECR Manually (if needed)

1. **Login to ECR**:
    ```bash
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com
    ```

2. **Tag the Docker Image**:
    ```bash
    docker tag medicalcost-app:latest <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/medicalcost:latest
    ```

3. **Push the Image to ECR**:
    ```bash
    docker push <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/medicalcost:latest
    ```

---

## Running Tests

To run the tests locally:

1. **Install pytest**:
    ```bash
    pip install pytest
    ```

2. **Run the tests**:
    ```bash
    pytest
    ```

Tests are located in `test_app.py`, and validate that the home page loads correctly.

---

## Conclusion

This project demonstrates how to build and deploy a Flask application for medical cost prediction using Docker and AWS. It also includes an automated CI/CD pipeline to ensure continuous integration and continuous delivery, making the deployment process smooth and efficient.

---

## License

This project is licensed under the MIT License.
