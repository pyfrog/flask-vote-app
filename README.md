# flask-vote-app
A sample web poll application written in Python (Flask).
Users will be prompted with a question and many options. They can vote preferred option(s) and see poll results as a chart. Poll question and options are loaded from a file called ``seed_data.json`` under the ``./data`` directory.

Poll results are then loaded into an internal DB based on sqlite. The data file is called ``app.db`` under the ``./data`` directory. As alternative, the application can store poll results in an external MySQL database.

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

By default, the application listen on port 5000.

To use an external MySQL database, use the environment variables by setting the ``flask.rc`` file under the application directory

    cat flask.rc
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





