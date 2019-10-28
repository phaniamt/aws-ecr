FROM alpine
RUN apk update
# Install base and dev packages
RUN apk add bash
# Install build packages
RUN apk add make && apk add curl && apk add openssh && apk add gettext && apk add vim
# Install yarn
RUN apk add yarn
# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime
# Install aws-cli
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*
# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl &&  mv ./kubectl /usr/local/bin/kubectl
CMD ["/bin/bash"]