FROM python:3.8-slim
RUN pip install --trusted-host pypi.python.org streamlit pdfplumber openai gensim
# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
COPY . /app
# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt
# Make port 80 available to the world outside this container
EXPOSE 80
EXPOSE 5678
# Define environment variable
ENV NAME World
# Run app.py when the container launches
#CMD ["streamlit", "run", "app.py"]
CMD ["streamlit", "run", "--server.port", "80", "--server.address", "0.0.0.0", "app.py"]
