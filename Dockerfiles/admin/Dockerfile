# locally built image
FROM centos7-base:latest

ENV ADMIN_VERSION=0.0.3
ENV PATH=/home/ansible/src/bin:$PATH

# Install pip, ansible
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
  python get-pip.py && \
  pip install ansible

RUN echo "$ADMIN_VERSION" >> ADMIN_VERSION && \
  chmod 444 VERSION

# Switch to ansible user mount cwd code to /home/ansible/src
USER ansible

RUN mkdir -p /home/ansible/src

WORKDIR /home/ansible/src

VOLUME [ "/home/ansible/src" ]