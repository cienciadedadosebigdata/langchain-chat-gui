# Usar uma imagem base do Python
FROM python:3.12-slim

# Definir diretório de trabalho
WORKDIR /app

# Copiar os arquivos necessários para o contêiner
COPY . /app

# Atualizar a lista de pacotes e instalar gcc e outras ferramentas de compilação necessárias
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# Instalar as dependências
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expor a porta em que o Streamlit irá rodar
EXPOSE 8501

# Comando para iniciar a aplicação Streamlit
CMD ["streamlit", "run", "app.py", "--server.port", "8501", "--server.address", "0.0.0.0"]
