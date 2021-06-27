FROM nginx
 
#COPY ./udagram-rproxy/nginx.conf /etc/nginx/
COPY nginx.conf /etc/nginx/conf.d/default.conf
#RUN mkdir /etc/nginx/sites-available
#RUN mkdir /etc/nginx/sites-enabled
#COPY udagram-rproxy/udagram-aku.com.conf /etc/nginx/sites-available/
#RUN ln -s /etc/nginx/sites-available/udagram-aku.com.conf /etc/nginx/sites-enabled/

# Bind the port that the image will run on
EXPOSE 8080

CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]

WORKDIR /usr/share/nginx/html
