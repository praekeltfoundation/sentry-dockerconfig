FROM sentry:8.22

RUN pip install sentry-plugins
COPY sentry.conf.py /etc/sentry/
