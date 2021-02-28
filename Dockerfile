FROM ubuntu:20.04

# Install wine
RUN apt-get update && apt-get install -y wget \
  gnupg2 software-properties-common && \
  dpkg --add-architecture i386 && \
  wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
  apt-key add winehq.key && rm winehq.key && \
  add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' && \
  apt-get update && apt-get install -y --install-recommends winehq-stable

# Download Adobe AIR
RUN wget https://airsdk.harman.com/assets/downloads/AdobeAIR.exe -O /root/air.exe

# Download StarShooter and StarLiner
RUN apt-get install -y unzip && \
  wget http://www.dokidokivisual.com/magic_of_stella/archive/starshooter_starliner_win.zip && \
  unzip starshooter_starliner_win.zip -d /root/star && rm starshooter_starliner_win.zip

# Install Noto Fonts
RUN apt-get install -y fonts-noto
