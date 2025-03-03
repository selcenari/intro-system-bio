FROM rocker/r-ver:4.4.0

LABEL maintainer="selcenarii@gmail.com"

# Install system dependencies and RStudio
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    gdebi-core \
    && apt-get clean

# Install RStudio
RUN apt-get install -y --no-install-recommends \
    rstudio

# Set up RStudio in the correct path
RUN ln -s /usr/lib/rstudio/bin/rstudio /usr/local/bin/rstudio
