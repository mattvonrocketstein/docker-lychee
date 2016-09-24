## Docker image for Lychee

### Details

Image for Lychee, using PHP 7.

The Mysql database is not included.

This image is loosely based on kdelfour/lychee-docker.

### Usage

First, start a mysql container. e.g :

    docker run -d --name lychee-mysql -v /your-path/mysql:/var/lib/mysql \
      -e MYSQL_ROOT_PASSWORD=lychee -e MYSQL_DATABASE=lychee -e MYSQL_USER=lychee -e MYSQL_PASSWORD=lychee mysql

Then reference it when starting the Lychee container :

    docker run -d -p 80:80 --link lychee-mysql -v /your-path/uploads/:/uploads/ -v /your-path/data/:/data/ \
       --name lychee jeanblanchard/lychee

