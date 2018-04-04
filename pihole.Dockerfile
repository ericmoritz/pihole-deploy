FROM diginc/pi-hole

WORKDIR /opt

RUN curl -L https://github.com/jedisct1/dnscrypt-proxy/releases/download/2.0.8/dnscrypt-proxy-linux_x86_64-2.0.8.tar.gz | tar xvz
RUN mv ./linux-x86_64 ./dnscrypt-proxy

WORKDIR /opt/dnscrypt-proxy/
ADD ./dnscrypt-proxy.toml ./
ADD ./services/ /etc/services.d/

SHELL ["/bin/bash", "-c"]
