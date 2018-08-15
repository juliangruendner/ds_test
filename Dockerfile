FROM debian:latest

RUN apt-get update && \
apt-get install -y python && \
apt-get install -y gnupg && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 && \
echo 'deb https://dl.bintray.com/obiba/deb all main' | tee /etc/apt/sources.list.d/obiba.list && \
apt-get install -y apt-transport-https && \
apt-get update && \
apt-get install -y opal-python-client

RUN apt-get install -y r-recommended && \
apt-get install -y libcurl4-openssl-dev

RUN R -e 'install.packages("rjson", repos="https://ftp.fau.de/cran/")'
RUN R -e 'install.packages("RCurl", repos="https://ftp.fau.de/cran/")'
RUN R -e 'install.packages("opal", repos="http://cran.obiba.org", type="source")'
RUN R -e 'install.packages("mime", repos="https://ftp.fau.de/cran/")'
RUN R -e 'install.packages("opaladmin", repos="http://cran.obiba.org", type="source")'
RUN R -e "install.packages('datashieldclient', repos=c('https://cran.uni-muenster.de/', 'http://cran.obiba.org'), dependencies=TRUE)"