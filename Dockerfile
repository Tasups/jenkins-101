FROM jenkins/jenkins:2.414.2-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"

# FROM python:3

# RUN pip install --no-cache-dir --upgrade pip && \
#    pip install --no-cache-dir nibabel pydicom matplotlib pillow med2image
#    # Note: we had to merge the two "pip install" package lists here, otherwise
#    # the last "pip install" command in the OP may break dependency resolution…

# CMD ["cat", "/etc/os-release"]
