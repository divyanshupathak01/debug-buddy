# Use a standard Python 3.9 image as the base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first
COPY requirements.txt ./

# Install all the libraries from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app's files from your computer into the container
COPY . .

# Tell the server which port to expose
EXPOSE 8501

# The command to run when the container starts
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]