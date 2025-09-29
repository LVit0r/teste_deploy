# Usa imagem Python enxuta
FROM python:3.12-slim

# Evita criação de arquivos .pyc e ativa logs sem buffer
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Define diretório de trabalho dentro do container
WORKDIR /app

# Instala dependências do sistema (builds e SQLite já vêm prontos)
RUN apt-get update && \
    apt-get install -y build-essential --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Copia e instala as dependências Python
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia o restante do projeto
COPY . .

# Expõe a porta usada pelo Gunicorn
EXPOSE 8000

# Comando padrão para iniciar o servidor WSGI
CMD ["gunicorn", "main.wsgi:application", "--bind", "0.0.0.0:8000"]
