CREATE USER 'root'@'172.30.0.3' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.30.0.3';
FLUSH PRIVILEGES;

grant all on *.* to 'root'@'%';
flush privileges;
