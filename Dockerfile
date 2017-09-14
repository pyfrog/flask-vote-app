# Using official python runtime base image
FROM python:2.7

LABEL Version 1.0

MAINTAINER kalise <https://github.com/kalise/>

# By default, the app uses an internal sqlite db
# Use env variable to force an external SQL engine, e.g. MySQL
# ENV DB_TYPE "mysql"
# ENV DB_HOST "localhost"
# ENV DB_PORT "3306"
# ENV DB_NAME "votedb"
# ENV DB_USER "user"
# ENV DB_PASS "password"

# Set the application directory
WORKDIR /app

# Install requirements.txt
ADD requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy code from the current folder to /app inside the container
ADD . /app

# Mount external volumes for logs and data
VOLUME ["/app/data", "/app/seeds", "/app/logs"]

# Expose the port server listen to
EXPOSE 5000

# Define command to be run when launching the container
CMD ["python", "app.py"]
