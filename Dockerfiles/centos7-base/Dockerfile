FROM centos/systemd:latest

ENV VERSION=0.0.5

# COPY bootstrap/etc/sudoers /etc/sudoers
RUN useradd -u 999 -ms /bin/bash ansible && \
    usermod -aG wheel ansible && \
    mkdir -p /home/ansible/.ssh

# Add .ssh and correct permissions.
ADD ansible/.ssh /home/ansible/.ssh
RUN chown -R ansible:wheel /home/ansible/.ssh/ && \
    chmod 700 /home/ansible/.ssh && \
    chmod 644 /home/ansible/.ssh/* && \
    chmod 600 /home/ansible/.ssh/id_rsa

# Install openssh* to run sshd server
RUN yum -y update && \
    yum -y install \
    openssh \
    openssh-server \
    openssh-clients \
    && \
    yum clean all && \
    rm -rf /var/cache/yum/*

# Add config and enable at start
# COPY bootstrap/etc/ssh/sshd_config /etc/ssh/sshd_config
# RUN systemctl enable sshd

RUN echo "$VERSION" >> VERSION && \
  chmod 444 VERSION
  
EXPOSE 22