FROM gamerxl/wine

# Change to root user.
USER root

# Update packages and install required packages.
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends make g++-mingw-w64-i686

# Clean up installed packages.
RUN rm -rf /var/lib/apt/lists/*

# Change to wine user.
USER wine

# Copy test files.
COPY test /test

# Set working directory.
WORKDIR /test

# Run test script.
CMD ["bash", "/test/test.sh"]
