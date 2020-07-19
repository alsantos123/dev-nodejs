FROM ubuntu

# dev tools
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install zip
RUN apt-get -y install curl

# nodejs 12.x
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt -y install yarn

# pm2
RUN npm install pm2 -g

# PROJECT HOME
RUN mkdir -p /home/app
WORKDIR /home/app
# RUN git clone https://<seu usuario>:<sua senha>@bitbucket.org/<usuario dono do repositório>/<nome do repositório> <nome da aplicação>

# START

EXPOSE 3000

ADD ./init/iniciar.sh /
RUN chmod a+x /iniciar.sh

CMD /iniciar.sh
