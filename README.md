# Logstash

# Getting Started

```shell
CWD=$(pwd $(dirname $0))
CONF=${CWD}/ls.conf.d

docker create \
  --name logstash \
  -v ${CONF}:/opt/logstash/conf.d \
  ermaker/logstash
```

# Usage

```shell
CWD=$(pwd $(dirname $0))
CONF=${CWD}/ls.conf.d
CRT=${CWD}/ls.crt.d

docker create \
  --name logstash \
  -v ${CONF}:/opt/logstash/conf.d \
  -v ${CRT}:/opt/logstash/crt.d \
  -e "LS_HEAP_SIZE=512m" \
  -p 5034:5034/udp \
  -p 5034:5034 \
  -p 5035:5035/udp \
  -p 5035:5035 \
  -p 5036:5036 \
  --restart=on-failure:5 \
  ermaker/logstash
```
