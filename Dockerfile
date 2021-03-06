FROM centos:7

RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install nodejs npm

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY package.json $APP_HOME/

RUN npm install

COPY . $APP_HOME/

RUN npm run assets

EXPOSE 9000
CMD npm run start
