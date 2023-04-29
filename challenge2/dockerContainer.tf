// webserver Container
resource "docker_container" "php-httpd" {
  name  = "webserver"
  hostname = "php-httpd"
  image = "php-httpd:challenge"

  labels {
    label = "challenge"
    value = "second"
  }

  networks_advanced{
    name = "my_network"
  }

  volumes{
    container_path = "/var/www/html"
    host_path = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
  }

  ports{
    internal = 80
    external = 80
  }

}


// db_dashboard Container
resource "docker_container" "phpmyadmin" {
  name  = "db_dashboard"
  hostname = "phpmyadmin"
  image = "phpmyadmin/phpmyadmin"

  labels {
    label = "challenge"
    value = "second"
  }

  networks_advanced{
    name = "my_network"
  }

  ports{
    internal = 80
    external = 8081
  }

  links = [
    docker_container.mariadb.name
  ]

  depends_on = [
    docker_container.mariadb
  ]

}


// db Container
resource "docker_container" "mariadb" {
  name  = "db"
  hostname = "db"
  image = "mariadb:challenge"

  labels {
    label = "challenge"
    value = "second"
  }

  networks_advanced{
    name = "my_network"
  }

  ports{
    internal = 3306
    external = 3306
  }

  env = [
    "MYSQL_ROOT_PASSWORD=1234", "MYSQL_DATABASE=simple-website"
  ]

  volumes{
    container_path = "/var/lib/mysql"
    volume_name = "mariadb-volume"
  }

}