# Use the official slim Python 3.11 image as the base for smaller image size
FROM python:3.11-slim

# Set environment variables for Python to improve container performance and debugging
ENV PYTHONDONTWRITEBYTECODE=1  # Prevent Python from writing .pyc files (compiled bytecode)
ENV PYTHONUNBUFFERED=1  # Ensure that Python output is flushed directly (no buffering)

# Install necessary system dependencies to ensure smooth package installations
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \  # Essential for compiling any C-based Python packages
    libpq-dev \  # PostgreSQL client libraries (if using PostgreSQL)
    curl  # For making HTTP requests in health checks

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt first to leverage Docker cache for dependencies
COPY requirements.txt .

# Install Python dependencies specified in the requirements file
# --no-cache-dir flag helps reduce the image size by preventing pip from caching wheels
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY ./app .

# Expose the port your application will run on (change if using a different port)
EXPOSE 8081

# Add a health check to ensure the container is running properly
# This will check if the app is responding at the root endpoint (or replace with your health endpoint)
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl --fail http://localhost:$PORT/ || exit 1

# Command to run the application using Uvicorn, which serves the FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]
