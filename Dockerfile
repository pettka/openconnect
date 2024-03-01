from ubuntu


RUN apt update \
    && apt install -y --allow-unauthenticated \
        zip \
        unzip \
	    curl \
	    ca-certificates \
        openconnect \
        openssh-client \
        netcat \
        ncat \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 22 3389
# ARG REMOTE_SSH 

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
