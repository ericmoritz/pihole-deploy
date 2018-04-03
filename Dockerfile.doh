FROM base/archlinux

RUN mkdir /opt/dnscrypt-proxy
WORKDIR /opt/dnscrypt-proxy

RUN curl -L https://github.com/jedisct1/dnscrypt-proxy/releases/download/2.0.8/dnscrypt-proxy-linux_x86_64-2.0.8.tar.gz | tar xvz
ADD ./dnscrypt-proxy.toml ./
CMD ./linux-x86_64/dnscrypt-proxy
