# Temel olarak, rocker's R 4.1 sürümünü kullanıyoruz
FROM rocker/r-ver:4.1.0

LABEL maintainer="your-email@example.com"

# Gerekli bağımlılıkları kuruyoruz
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    gdebi-core \
    wget \
    && apt-get clean

# RStudio 4.4.0 sürümünü manuel olarak indiriyoruz
RUN wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-4.4.0-amd64.deb \
    && gdebi -n rstudio-4.4.0-amd64.deb \
    && rm rstudio-4.4.0-amd64.deb

# RStudio'yu doğru şekilde çalıştırabilmek için yolu ayarlıyoruz
RUN ln -s /usr/lib/rstudio/bin/rstudio /usr/local/bin/rstudio

# Çalıştırılacak komut
CMD ["rstudio"]