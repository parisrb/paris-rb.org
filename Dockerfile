FROM ruby:3.4.6

RUN apt-get update
RUN apt-get install apt-transport-https -y

RUN apt-get update && apt-get install sudo -y && apt-get clean &&\
    sed -i s+secure_path=.*+secure_path="$PATH"+ /etc/sudoers

# Node.js setup
RUN curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash -
RUN apt-get update
RUN apt-get install nodejs


RUN apt-get update
RUN apt-get install -y imagemagick
RUN apt-get install -y locales
RUN apt-get install -y postgresql-client

RUN node --version

ENV GEM_HOME="/usr/src/app/vendor/.bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

ENV PATH $PATH:/node_modules/.bin:/opt/node/bin

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

WORKDIR /usr/src/app

ENTRYPOINT ["/usr/src/app/bin/docker-entrypoint.sh"]
