-- Database and user for the GLPi application
CREATE DATABASE glpi;
CREATE USER 'glpi_user'@'%' IDENTIFIED BY 'glpi_password';
GRANT ALL PRIVILEGES ON glpi.* TO 'glpi_user'@'%';
FLUSH PRIVILEGES;