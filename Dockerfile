FROM alejandrofcarrera/phusion.python
MAINTAINER Fernando Serena <fernando.serena@centeropenmiddleware.com>

ENV HOME /usr/lib/agora

# Create directories & virtual env for the Planner
RUN virtualenv $HOME/.env
WORKDIR /usr/lib/agora
RUN .env/bin/pip install Agora-Planner

# Configure runit
ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ADD ./my_init.d/ /etc/my_init.d/

CMD ["/sbin/my_init"]

VOLUME ["/usr/lib/agora"]
EXPOSE 5000
