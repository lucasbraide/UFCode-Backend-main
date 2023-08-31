# Use a imagem base do Node.js
FROM node:14

# Diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copie o package.json e o package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências
RUN npm install

RUN apt-get update && apt-get install -y python3 python3-pip

# Copie o restante dos arquivos do projeto
COPY . .

# Exponha a porta em que a aplicação irá escutar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD [ "node", "main.js" ]