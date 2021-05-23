FROM ubuntu:focal

# Update packages and install required packages.
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends wget gnupg software-properties-common

# Enable i386 architecture.
# https://wiki.winehq.org/Ubuntu
RUN dpkg --add-architecture i386

# Add winehq package repository.
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'

# Install winehq stable.
RUN apt-get update --yes
RUN apt-get install --yes --install-recommends winehq-stable

# Clean up installed packages.
RUN rm -rf /var/lib/apt/lists/*

# Disable virtual desktop.
RUN echo "[Desktop]\nHKCU,Software\Wine\Drivers,\"Graphics\",,\"null\"\n" >> /opt/wine-stable/share/wine/wine.inf

# Add wine user.
RUN adduser --disabled-password --gecos '' wine

# Change to wine user.
USER wine

# Set working directory to wine user.
WORKDIR /home/wine

# Configure wine for win32 architecture.
ENV WINEPREFIX="/home/wine/.wine32"
ENV WINEARCH="win32"

# Install winetricks.
# https://wiki.winehq.org/Winetricks
RUN wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
RUN chmod +x winetricks
