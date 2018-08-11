# fluentd-sandbox

You can try plugins easiler

## Getting Started

make dir as try and error name

```
mkdir -p ./<dir_name>/{conf.d|gemfiles}
```

1. write conf to `conf.d`
1. put `Gemfile` to gemfiles dir

And add new service to docker-compose like that:

```
  tail:
    build:
      context: .
    volumes:
      - bundler:/fluentd/vendor
      - ./tail/conf.d:/fluentd/etc/conf.d
      - ./tail/gemfiles:/fluentd/etc/gemfiles
      - ./log:/var/log/sandbox
    ports:
      - 24224:24224
```

## fleuntd tail

```
echo '{"log":"2014/09/25 03:42:05.658378       1 main.go:83] GCE config: {Project:threetreeslight Zone:us-west1-a Cluster:blog-cluster Instance:gke-blog-cluster-pool-1-767a6361-7t2r.c.threetreeslight.internal MetricsPrefix:container.googleapis.com/internal/addons}", "stream":"stderr","time":"2018-08-11T03:42:05.658698744Z"}' >> ./log/sample.log
echo '{"log":"2014/09/25 21:15:03 Got request with path wombat\\n", "stream":"stderr", "time":"2014-09-25T21:15:03.499185026Z"}' >> ./log/sample.log
echo '{ "foo": 1 }' >> log/foo
```
