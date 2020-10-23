# geektechstuff
# using a lot of https://hub.docker.com/r/philm/ansible_playbook/dockerfile/

# Alpine is a lightweight version of Linux.
# apline:latest could also be used
FROM alpine:latest

RUN \
# apk add installs the following
  apk add \
    bash \
    curl \
    openssh-client \
    openssh \
    python3 \
    py3-boto \
    py3-dateutil \
    py3-httplib2 \
    py3-jinja2 \
    py3-paramiko \
    py3-pip \
    py3-setuptools \
    py3-yaml \
    sshpass \
    tar && \
  pip install --upgrade pip && \
  pip install ansible && \
  rm -rf /var/cache/apk/*

# Makes the Ansible directories
RUN mkdir /etc/ansible /ansible
RUN mkdir ~/.ssh

# Over rides SSH Hosts Checking
RUN echo "host *" >> ~/.ssh/config &&\
    echo "StrictHostKeyChecking no" >> ~/.ssh/config

# Downloads the Ansible tar (curl) and saves it (-o)
# RUN \
#   curl -fsSL https://releases.ansible.com/ansible/ansible-2.9.9.tar.gz -o ansible.tar.gz && \
# Extracts Ansible from the tar file
  # tar -xzf ansible.tar.gz -C ansible --strip-components 1 && \
  # rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

# Makes a directory for ansible playbooks
RUN mkdir -p /ansible/playbooks
# Makes the playbooks directory the working directory
WORKDIR /ansible/playbooks

# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
# ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /ansible/playbooks/roles
# ENV ANSIBLE_SSH_PIPELINING True
# ENV PATH /ansible/bin:$PATH
# ENV PYTHONPATH /ansible/lib

# Sets entry point (same as running ansible-playbook)
# ENTRYPOINT ["ansible-playbook"]
# Can also use ["ansible"] if wanting it to be an ad-hoc command version
#ENTRYPOINT ["ansible"]
