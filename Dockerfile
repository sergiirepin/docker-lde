FROM webdevops/php-apache-dev:5.6

# Add IonCube Loaders
RUN mkdir /tmp/ioncube_install
WORKDIR /tmp/ioncube_install
RUN wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz -O /tmp/ioncube_install/ioncube_loaders_lin_x86-64.tar.gz
RUN tar zxf /tmp/ioncube_install/ioncube_loaders_lin_x86-64.tar.gz
RUN mv /tmp/ioncube_install/ioncube/ioncube_loader_lin_5.6.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226
RUN rm -rf /tmp/ioncube_install

ADD 20-ioncube.ini /usr/local/etc/php/conf.d/20-ioncube.ini