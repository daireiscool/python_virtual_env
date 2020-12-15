# Install the base requirements for the app.
# This stage is to support development.
FROM python:3.8-slim-buster AS base
WORKDIR /home
COPY ./requirements.txt /home/requirements.txt

RUN apt-get update && apt-get install -y wget libsasl2-2 \
		libsasl2-dev python3-dev

RUN pip3 install -r requirements.txt

ADD ./app /home/app
ADD ./code_python /home/code_python
ADD ./README.md /home/README.md

# To run Jupyter-Notebook
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

# ENTRYPOINT ["python3", "gdelt_code/main.py"]
