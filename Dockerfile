FROM rstudio/plumber:v1.0.0

RUN apt-get update && apt-get install -y \
libxml2-dev \
libcairo2-dev \
libsodium-dev \
libcurl4-openssl-dev \
libssl-dev \
libfreetype6 \
libfreetype6-dev 

RUN mkdir /home/DSPD_project

COPY api /home/DSPD_project/api

WORKDIR /home/DSPD_project/api

#RUN R -e 'install.packages(c("plumber"))'

EXPOSE 80

ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/home/DSPD_project/api/forecast_2.R'); pr$run(host='0.0.0.0', port=80, swagger = TRUE)"]
