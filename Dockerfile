FROM tutum/debian-wheezy
MAINTAINER Mark Redar mredar@gmail.com

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y -q git
RUN apt-get install -y -q mercurial
RUN apt-get install -y -q python-dev
RUN apt-get install -y -q python-pip

RUN mkdir -p /code/dpla
WORKDIR /code/dpla
RUN git clone https://github.com/mredar/DPLA-ingestion ingestion
WORKDIR ingestion
RUN pip install --no-deps --ignore-installed -r requirements.txt

ADD ./akara.ini code/dpla/ingestion/akara.ini
RUN python setup.py install
RUN akara -f akara.conf setup

EXPOSE 8889 

CMD akara -f akara.conf start -X
