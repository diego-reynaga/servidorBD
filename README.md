# INSTALACION Y CONFIGURACION DE UN SERVIDOR DE BASE DE DATOS EN FEDORA

### 1. Actualizamos los repositorios.
```bash
sudo dnf update -y
```

### 2. Instalar el servidor web Apache
```bash
sudo dnf install httpd -y
```
>[!NOTE]
>Inicia y habilita el servicio de Apache:
```bash
sudo systemctl start httpd
```
```bash
sudo systemctl enable httpd
```

### 3. Instalar PHP y módulos necesarios
```bash
sudo dnf install php php-mysqlnd php-json php-common php-zip php-gd php-mbstring php-curl php-intl php-bcmath php-xml -y
```
>[!NOTE]
>Verifica la instalación de PHP:
```bash
php -v
```

### 4. Instalar el servidor de base de datos MariaDB
```bash
sudo dnf install mariadb-server -y
```
#### Inicia y habilita el servicio de MariaDB:
```bash
sudo systemctl start mariadb
```
```bash
sudo systemctl enable mariadb
```
>[!NOTE]
>Configura la seguridad del servidor de MariaDB:
```bash
sudo mysql_secure_installation
```
>[!NOTE]
>Durante la configuración:
>1. Establece una contraseña para el usuario root
>2. Responde Y a todas las opciones para mejorar la seguridad.

### 5. Instalar phpMyAdmin phpMyAdmin no está incluido en los repositorios oficiales de Fedora, pero puedes instalarlo desde el repositorio de EPEL.

#### Habilita el repositorio de EPEL:
```bash
sudo dnf install epel-release -y
```
#### Instala phpMyAdmin:
```bash
sudo dnf install phpmyadmin -y
```

### 6. Configurar phpMyAdmin Edita el archivo de configuración de Apache para phpMyAdmin:

```bash
sudo nano /etc/httpd/conf.d/phpMyAdmin.conf
```
>[!NOTE]
>Busca las líneas relacionadas con las restricciones de acceso (por ejemplo, Require ip 127.0.0.1) y cámbialas si deseas acceder a phpMyAdmin desde otra máquina. Por ejemplo:
```bash
Require all granted
```
>[!NOTE]
>Esto permite acceso desde cualquier dirección IP

### 7. Reiniciar Apache Después de cualquier cambio en la configuración, reinicia Apache:

```bash
sudo systemctl restart httpd
```

### 8. Crear una base de datos

```bash
sudo mysql -u root -p
```

```sql
CREATE DATABASE prueba;
```
```sql
USE prueba;
```
```sql
CREATE TABLE usuarios (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100)
);
```
```sql
INSERT INTO usuarios (nombre) VALUES ('Maria'), ('Juan');
```
```sql
SELECT * FROM usuarios;
```
