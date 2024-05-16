FROM alt:p10

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y \
    glibc \
    openssh \
    python3 \
    python3-module-pip && \
    pip3 install ansible jmespath && \
    ansible-galaxy collection install community.general && \
    ansible-galaxy collection install community.general --upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]