FROM ruby:2.6.4

RUN apt-get update
RUN apt-get install apt-transport-https

RUN apt-get update && apt-get install sudo && apt-get clean &&\
    sed -i s+secure_path=.*+secure_path="$PATH"+ /etc/sudoers

RUN curl -fsSL https://deb.nodesource.com/setup_8.x | sudo -E bash - &&\
    apt-cache policy nodejs &&\
    apt-get install -y nodejs=8.17.0-1nodesource1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y yarn
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
