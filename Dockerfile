FROM registry.access.redhat.com/rhscl/nginx-110-rhel7:latest

COPY nginx.conf /etc/opt/rh/rh-nginx110/nginx/

# copy swagger files to the `/js` folder
COPY ./index.html $HOME
ADD ./dist/*.js $HOME/dist/
ADD ./dist/*.map $HOME/dist/
ADD ./dist/*.css $HOME/dist/
ADD ./dist/*.png $HOME/dist/
ADD ./docker-run.sh /opt/app-root

EXPOSE 8080

CMD ["sh", "/opt/app-root/docker-run.sh"]
