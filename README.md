# flask-vote-app
A sample web poll application written in Python (Flask).
Users will be prompted with a poll question and related options. They can vote preferred option(s) and see poll results as a chart. Poll results are then loaded into an internal DB based on sqlite. As alternative, the application can store poll results in an external MySQL database.

This application is intended for demo only.

## Local deployment
This application can be deployed locally. On linux, install git and clone the reposistory

    [root@centos]# yum install -y git
    [root@centos]# git clone https://github.com/kalise/flask-vote-app
    [root@centos]# cd flask-vote-app

Install the dependencies

    pip install flask
    pip install flask-sqlalchemy
    pip install mysql-python

and start the application

    python app.py
    Check if a poll already exists into db
    * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)

Poll question and options are loaded from a JSON file called ``seed_data.json`` under the ``./seeds`` directory. This file is filled with default values, change it before to start the application.

The DB data file is called ``app.db`` and is located under the ``./data`` directory. To use an external MySQL database, set the environment variables by editing the ``flask.rc`` file under the application directory

    nano flask.rc
    export PS1='[\u(flask)]\> '
    export DB_HOST=centos
    export DB_PORT=3306
    export DB_NAME=votedb
    export DB_USER=voteuser
    export DB_PASS=password
    export DB_TYPE=mysql

Source the file and restart the application

    source flask.rc
    python app.py

Make sure an external MySQL database server is running according with the parameters above.

## Docker deployment
A Dockerfile is provided in the reposistory to build a docker image and run the application as linux container.

On Linux, install and start Docker

    [root@centos ~]# yum install -y docker
    [root@centos ~]# systemctl start docker

Install git and clone the reposistory

    [root@centos]# yum install -y git
    [root@centos]# git clone https://github.com/kalise/flask-vote-app
    [root@centos]# cd flask-vote-app

Build a Docker image

    [root@centos]# docker build -t flask-vote-app:latest .
    [root@centos]# docker images
    REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
    flask-vote-app        latest              e6e0578f5f2d        2 minutes ago       695.4 MB

Start the container

    docker run -d -p 80:5000 --name=vote flask-vote-app:latest

Seeds data directory containing the seed data file ``seed_data.json`` can be mounted as an external volume under the host ``/mnt`` directory

    cp flask-vote-app/seeds/seed_data.json /mnt
    docker run -d -p 80:5000 -v /mnt:/app/seeds --name=vote flask-vote-app:latest

An external MySQL database can be used instead of the internal sqlite by setting the desired env variables

    docker run -e DB_HOST=centos \
               -e DB_PORT=3306 \
               -e DB_NAME=votedb \
               -e DB_USER=voteuser \
               -e DB_PASS=password \
               -e DB_TYPE=mysql \
               -d -p 80:5000  --name=vote flask-vote-app:latest

 Happy polling!
