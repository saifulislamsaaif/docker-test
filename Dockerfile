FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY app.py .

# Expose the port (Cloud Run defaults to 8080)
EXPOSE 8080

# Use Gunicorn to run the app in production 
# This binds to the PORT environment variable provided by Cloud Run
CMD exec gunicorn --bind 0.0.0.0:8080 --workers 1 --threads 8 --timeout 0 app:app