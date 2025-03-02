FROM celtak/ubuntu-ping-ip
RUN apt-get update
RUN apt-get install -y nodejs
LABEL description="Ceci est un test"
LABEL version="42.42"
ENV NAME="ahuge"
ADD /test /test_local
#VOLUME /volume_test
WORKDIR /bin
EXPOSE 8000
ARG prenom=arnaud
RUN echo $prenom
