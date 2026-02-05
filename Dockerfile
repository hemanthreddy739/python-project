# Use official Python runtime as a parent image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Copy project files
COPY . /app

# Install the project and its dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -e .

# Expose port
EXPOSE 5000

# Set the default command to run the Flask application
CMD ["sample"]
