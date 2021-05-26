FROM rocker/tidyverse:latest

RUN apt-get update && apt-get install -y \
libxml2-dev \
libcairo2-dev \
libsodium-dev \
libcurl4-openssl-dev \
libssl-dev \
libfreetype6 \
libfreetype6-dev \
libfontconfig1 \
libfontconfig1-dev

 

RUN mkdir /home/DSPD_project

COPY Web_Scrapper /home/DSPD_project/Web_Scrapper

WORKDIR /home/DSPD_project/Web_Scrapper

RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/

RUN ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin


CMD R -e "source('WS.R')"
