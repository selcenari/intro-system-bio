# Başlangıç olarak rocker/verse:4.0.5 imajını kullan
FROM rocker/verse:4.0.5

# Git ve gerekli araçları yükle
RUN apt-get update && apt-get install -y git

# Repo'yu klonla
RUN git clone https://github.com/selcenari/intro-system-bio.git /home/rstudio/intro-system-bio

# Çalışma dizinini ayarla
WORKDIR /home/rstudio/intro-system-bio

# RStudio ayarları ve ortam değişkenlerini belirle
ENV NB_USER rstudio
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

# R environment ayarları
RUN echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron
ENV LD_LIBRARY_PATH /usr/local/lib/R/lib

# R session'ı başlatırken gerekli kütüphaneleri ayarla
RUN apt-get update && \
    apt-get -y install python3-venv python3-dev && \
    apt-get purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Python ortamı oluştur
RUN mkdir -p /srv/venv && chown -R rstudio /srv/venv

USER rstudio

# Çalışma dizini olarak repo dizinini seç
WORKDIR /home/rstudio/intro-system-bio

# RStudio'yu başlat
CMD ["/usr/lib/rstudio-server/bin/rserver"]
