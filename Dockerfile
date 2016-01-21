FROM centos:7
RUN yum install -y epel-release
RUN yum install -y gcc automake autoconf libtool make
RUN yum install -y libxml2-devel gd-devel libmcrypt-devel libcurl-devel openssl-devel
RUN yum install -y unzip wget
RUN wget http://cn2.php.net/distributions/php-7.0.2.tar.gz
RUN tar zxvf php-7.0.2.tar.gz
RUN mv php-7.0.2 php-7.0.0
RUN cd php-7.0.0 && ls && ./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --enable-shared --with-libxml-dir --with--mysql --with-gd --with-openssl --enable-mbstring --with-mcrypt --with-mysqli --enable-opcache --enable-mysqlnd --enable-zip --with-zlib-dir --with-pdo-mysql --with-jpeg-dir --with-freetype-dir --with-curl --without-pdo-sqlite --without-sqlite3
RUN cd php-7.0.0 && make
RUN cd php-7.0.0 && make install
RUN ln -s /usr/local/php/sbin/php-fpm /usr/sbin/php-fpm
COPY php-fpm.conf /usr/local/php/etc/php-fpm.conf
EXPOSE 9000
CMD ["php-fpm"]
