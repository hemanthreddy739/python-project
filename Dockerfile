# Use official Python runtime as a parent image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Install the project and its dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -e .

# Install development dependencies (testing, linting, etc.)
RUN pip install --no-cache-dir \
    pytest \
    nox \
    flake8 \
    check-manifest \
    twine \
    build

# Run tests
RUN pytest tests/

# Set the default command to run the application
CMD ["python", "-m", "sample.simple"]
