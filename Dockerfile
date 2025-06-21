# Usa la imagen oficial de MySQL como base
FROM mysql:8.0

# Copia tu script de inicialización al directorio que MySQL ejecuta automáticamente
# al iniciar el contenedor por primera vez.
COPY ./database/init_db.sql /docker-entrypoint-initdb.d/

# Opcional: Establece variables de entorno por defecto para MySQL si no las pones en docker-compose
# ENV MYSQL_ROOT_PASSWORD=your_secure_root_password
# ENV MYSQL_DATABASE=unir_db
# ENV MYSQL_USER=app_user
# ENV MYSQL_PASSWORD=app_password

# El ENTRYPOINT y CMD ya están definidos en la imagen base de MySQL.
# No necesitas redefinirlos a menos que quieras un comportamiento muy específico.