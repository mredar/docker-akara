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
RUN git clone https://github.com/mredar/DPLA-ingestion --branch=ucldc ingestion
WORKDIR ingestion
RUN pip install --no-deps --ignore-installed -r requirements.txt

ADD ./akara.ini.tmpl /code/dpla/ingestion/akara.ini.tmpl

WORKDIR /
ADD ./run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 8889 

CMD ["/run.sh"]
