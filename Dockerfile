#PHP 5.6.4
FROM webdevops/php-apache-dev:ubuntu-15.04

#PHP 7.0
#FROM webdevops/php-apache-dev:ubuntu-16.04

# Add IonCube Loaders
#RUN mkdir /tmp/ioncube_install
#WORKDIR /tmp/ioncube_install
#RUN wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz -O /tmp/ioncube_install/ioncube_loaders_lin_x86-64.tar.gz
#RUN tar zxf /tmp/ioncube_install/ioncube_loaders_lin_x86-64.tar.gz

# PHP 5.6.4
#RUN mv /tmp/ioncube_install/ioncube/ioncube_loader_lin_5.6.so /usr/lib/php5/20131226

# PHP 7.0
#RUN mv /tmp/ioncube_install/ioncube/ioncube_loader_lin_7.0.so /usr/lib/php/20151012

#RUN rm -rf /tmp/ioncube_install

# PHP 5.6.4
#ADD ioncube.ini /etc/php5/fpm/conf.d/01-ioncube.ini
#ADD ioncube.ini /etc/php5/cli/conf.d/01-ioncube.ini

# PHP 7.0
#ADD ioncube.ini /etc/php/7.0/fpm/conf.d/01-ioncube.ini
#ADD ioncube.ini /etc/php/7.0/cli/conf.d/01-ioncube.ini

# Cron Support 
COPY cron /etc/cron.d/cron.magento
RUN crontab /etc/cron.d/cron.magento

# Setup Xdebug 
ENV XDEBUG_CONFIG="idekey=docker"
