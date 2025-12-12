# Usa la imagen oficial de Python desde Docker Hub
FROM python:3.9-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el contenido del directorio actual al contenedor en /app
COPY . /app

# Instala las dependencias especificadas en requirements.txt
RUN pip install -r requirements.txt

# Expone el puerto 5000 para acceder desde fuera del contenedor
EXPOSE 5000

# Ejecuta app.py cuando el contenedor se inicie
CMD ["python", "app.py"]
