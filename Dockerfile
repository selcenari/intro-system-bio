# Başlangıç olarak rocker/verse:4.0.5 imajını kullan
FROM rocker/verse:4.0.5

# Sistem güncellemeleri ve RStudio kurulumu için gerekli paketlerin yüklenmesi
RUN apt-get update && \
    apt-get install -y \
    wget \
    gdebi-core

# RStudio kurulumu
RUN wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1106-amd64.deb && \
    gdebi -n rstudio-1.4.1106-amd64.deb && \
    rm rstudio-1.4.1106-amd64.deb

# GitHub reposundaki paketleri yüklemek
RUN R -e "install.packages('devtools')" && \
    R -e "devtools::install_github('selcenari/intro-system-bio', ref='main')"

# Çalışma dizini
WORKDIR /home/rstudio

# Komut satırını başlat
CMD ["rstudio"]
