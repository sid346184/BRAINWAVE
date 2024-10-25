# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/requirements.txt

# Install any dependencies
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the rest of the application code into the container
COPY . /app

# Set environment variables for Groq API key (you can provide this key during deployment)
ENV GROQ_API_KEY=${GROQ_API_KEY}

# Expose the port that FastAPI runs on
EXPOSE 8000

# Command to run the FastAPI application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
