FROM fluent/fluentd:latest

COPY ./fluent.conf /fluentd/etc/fluent.conf

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
    && gem install bundler

CMD exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins $FLUENTD_OPT -g /fluentd/etc/gemfiles/Gemfile --gem-path /fluentd/etc/vendor
