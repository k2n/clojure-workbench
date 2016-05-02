FROM clojure
MAINTAINER Kenji Nakamura <kenjin@clazzsoft.com>

WORKDIR /usr/src/app

RUN apt-get update && apt-get install sudo net-tools && \
  rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' --uid 501 docker && \
  adduser docker sudo && \
  echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
  mkdir /home/docker/.m2 && \
  chown -R docker:docker /usr/src/app /home/docker/.m2

VOLUME /home/docker/.m2
USER docker
RUN lein

ENTRYPOINT ["lein"]
