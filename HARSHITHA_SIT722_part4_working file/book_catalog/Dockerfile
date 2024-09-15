# Use an official Python runtime as the base image (Python 3.11 slim variant for minimal size)
FROM python:3.11-slim

# Set environment variables to prevent Python from writing pyc files and buffering stdout/stderr
 # Prevents Python from writing .pyc files to disk
 # Ensures that Python output is sent straight to the terminal without buffering
ENV PYTHONDONTWRITEBYTECODE=1 
ENV PYTHONUNBUFFERED=1  

# Set the working directory inside the container
WORKDIR /app

# Copy only the requirements file first to leverage Docker cache and avoid reinstalling dependencies unnecessarily
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r ./requirements.txt  # Avoid caching to keep the image size small

# Copy the entire app directory to the working directory inside the container
COPY ./app .

# Expose the port on which the application will run (can be set dynamically via an environment variable)
#Ensure this matches the application's port if hardcoded, or the default value
EXPOSE 8081  

# Run the application using Uvicorn, set the host and port to be configurable through environment variables
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]

# Optional: Add a HEALTHCHECK to monitor container health
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl --fail http://localhost:$PORT/health || exit 1
