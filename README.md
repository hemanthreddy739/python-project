# Sample Flask Application

A simple Flask web application with health check API endpoints.

## Features

- Flask web server running on port 5000
- Health check endpoint at `/health`
- API version endpoint at `/api/version`
- Root welcome endpoint at `/`

## Installation

```bash
pip install -e .
```

## Running the Application

### Local Development

```bash
sample
```

The application will start on `http://localhost:5000`

### Using Docker

Build the Docker image:
```bash
docker build -t sample-flask-app:latest .
```

Run the container:
```bash
docker run -p 5000:5000 sample-flask-app:latest
```

## API Endpoints

### 1. Root Endpoint
- **URL**: `/`
- **Method**: `GET`
- **Response**:
```json
{
  "message": "Welcome to Sample Flask App",
  "endpoints": {
    "health": "/health",
    "version": "/api/version"
  }
}
```

### 2. Health Check
- **URL**: `/health`
- **Method**: `GET`
- **Response**:
```json
{
  "status": "healthy",
  "timestamp": "2026-02-05T09:55:39.508083",
  "service": "sample-app"
}
```

### 3. API Version
- **URL**: `/api/version`
- **Method**: `GET`
- **Response**:
```json
{
  "version": "1.0.0",
  "api_version": "v1"
}
```

## Testing the Application

Using curl:
```bash
# Test health endpoint
curl http://localhost:5000/health

# Test version endpoint
curl http://localhost:5000/api/version

# Test root endpoint
curl http://localhost:5000/
```

## Project Structure

```
.
├── Dockerfile           # Docker configuration
├── pyproject.toml       # Project configuration with Flask dependency
├── src/
│   └── sample/
│       ├── __init__.py  # Package initialization
│       ├── app.py       # Flask application code
│       └── simple.py    # Simple utility functions
└── tests/
    └── test_simple.py   # Tests
```

## Requirements

- Python 3.9+
- Flask 3.1+

## License

MIT License - See LICENSE.txt for details
