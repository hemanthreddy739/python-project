"""Simple Flask application with health check API."""

from flask import Flask, jsonify
from datetime import datetime


def create_app():
    """Create and configure the Flask application."""
    app = Flask(__name__)

    @app.route("/health", methods=["GET"])
    def health_check():
        """Health check endpoint."""
        return jsonify({
            "status": "healthy",
            "timestamp": datetime.utcnow().isoformat(),
            "service": "sample-app"
        }), 200

    @app.route("/api/version", methods=["GET"])
    def get_version():
        """Get API version."""
        return jsonify({
            "version": "1.0.0",
            "api_version": "v1"
        }), 200

    @app.route("/", methods=["GET"])
    def index():
        """Root endpoint."""
        return jsonify({
            "message": "Welcome to Sample Flask App",
            "endpoints": {
                "health": "/health",
                "version": "/api/version"
            }
        }), 200

    return app


def run_app():
    """Run the Flask application."""
    app = create_app()
    app.run(host="0.0.0.0", port=5000, debug=False)


if __name__ == "__main__":
    run_app()
