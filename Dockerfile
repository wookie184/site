FROM pythondiscord/site-base:latest

ENV PIPENV_VENV_IN_PROJECT=1
ENV PIPENV_IGNORE_VIRTUALENVS=1
ENV PIPENV_NOSPIN=1
ENV PIPENV_HIDE_EMOJIS=1

RUN pip install pipenv

COPY . /site
WORKDIR /site
ENV PYTHONPATH=/site

RUN pipenv clean
RUN pipenv sync

EXPOSE 10012

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["pipenv", "run", "start"]
