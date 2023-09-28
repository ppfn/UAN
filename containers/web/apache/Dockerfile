FROM httpd:2.4-alpine


# Adapt the httpd.conf file to load the modules we need and include the vhosts file
RUN sed -i '/LoadModule\ deflate_module/s/^#//g' /usr/local/apache2/conf/httpd.conf \
    && sed -i '/LoadModule\ proxy_module/s/^#//g' /usr/local/apache2/conf/httpd.conf \
    && sed -i '/LoadModule\ proxy_fcgi_module/s/^#//g' /usr/local/apache2/conf/httpd.conf \
    && sed -i '/Include\ conf\/extra\/httpd-vhosts.conf/s/^#//g' /usr/local/apache2/conf/httpd.conf \
    && sed -i 's/#ServerName\ www.example.com/ServerName\ urbanappnet.com/g' /usr/local/apache2/conf/httpd.conf \
    && sed -i 's/ServerAdmin\ you@example.com/ServerAdmin\ admin@urbanappnet.com/g' /usr/local/apache2/conf/httpd.conf


# Copy vhost configs
COPY ./vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf