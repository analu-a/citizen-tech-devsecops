FROM alpine:latest AS preparo
RUN echo "citizen-tech-market" > /tmp/versao.txt

FROM python:3.7-slim-buster
MAINTAINER devops@citizen.tech
ENV API_TOKEN=78544aa99501cd63b38cd00091e008dcb5534b5c
ENV PORTA=8342
WORKDIR app
ADD . /app
COPY --from=preparo /tmp/versao.txt /app/versao.txt
RUN cd /app && pip install -r requirements.txt
RUN sudo chmod -R 777 /app || chmod -R 777 /app
EXPOSE 22 8342
USER root
CMD ["python", "-m", "http.server"]
CMD ["python", "app.py"]
