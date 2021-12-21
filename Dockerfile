FROM python:3.8-alpine

RUN apk update \
    && apk add --no-cache bash py3-virtualenv \
    && apk add --update docker openrc \
    && rc-update add docker boot \
    && mkdir -p /apps 
ADD requirements.txt /apps
ADD container_model.py /apps
ADD Service.py /apps
RUN rm -rf /tmp/* /var/cache/apk/*
WORKDIR /apps
EXPOSE 32111
RUN cd /apps \ 
    && pip3 install -r requirements.txt
ENTRYPOINT ["python3","Service.py"]