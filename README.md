# docker-ubuntu-18.04
Docker Ubuntu 18.04 

Author: tungnt.blue@gmail.com

> docker-compose.yml

    version: '3'
    
    services:
    
      web1:
        container_name: web1
        build:
          context: ./web1
          dockerfile: Dockerfile
        command: 'bash'
        restart: always
        ports:
        - 1011:80
        volumes:
        - ./web1/webroot:/var/www/html
        tty: true
        networks:
        - app-network
    
    networks:
      app-network:
        driver: bridge
        
> Dockerfile

    FROM tungnt2411/ubuntu-18.04
    
    COPY vhost.conf /etc/nginx/sites-enabled/vhost.conf
    
    EXPOSE 80