FROM golang:alpine as builder

ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin:/go/src/github.com/hashicorp/terraform

RUN apk --no-cache add \
        curl \
        python \
        py-crcmod \
        bash \
        libc6-compat \
        openssh \
        openssh-client \
        git \
    && curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz \
    && mkdir -p /usr/local/gcloud \
    && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
    && /usr/local/gcloud/google-cloud-sdk/install.sh \
    && gcloud --version



# apk does not have the latest version of terraform
#RUN apk --update add terraform=0.11.1-r0

ENV TERRAFORM_VERSION=0.11.7

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

# copy a gcloud credentials file which is stripped out of sensitive info
# COPY credentials.json /

FROM alpine

ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin:/usr/local/terraform/bin
RUN apk --no-cache add python ca-certificates git

COPY --from=builder go/src/github.com/hashicorp/terraform /usr/local/terraform
COPY --from=builder /usr/local/gcloud /usr/local/gcloud



# Copy docker-entrypoint.sh to inject sensitive info into the credentials file from environment variables
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
