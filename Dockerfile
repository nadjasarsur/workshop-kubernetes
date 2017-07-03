FROM centos:7

ENV APP_HOME /app
COPY . $APP_HOME/
WORKDIR $APP_HOME
EXPOSE 9000

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install nodejs npm

RUN npm install
RUN npm run assets

CMD npm run start
