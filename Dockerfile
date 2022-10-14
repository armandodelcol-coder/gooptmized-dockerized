##### Stage 1 #####

# Montar um container baseado na imagem go completa

### golang:1.19.2 para buildar a aplicação
FROM golang:1.19.2 as builder

### Criar um diretório app e setar como workdir
RUN mkdir /app
WORKDIR /app

### Copia os arquivos de dependencia do go.
COPY go.mod .
COPY go.sum .

### Define o proxy para downloads de modulos
# ENV GOPROXY https://proxy.golang.org,direct

### Faz Download dos modulos da aplicação
# RUN go mod download

### Copia o código fonte para ser buildado como aplicação
COPY app.go .

### CGO desabilitado para que tudo seja compilado somente com o próprio go
ENV CGO_ENABLED=0

### Buildando a aplicação
RUN GOOS=linux go build ./app.go

##### Stage 2 #####

# Montar um container com uma imagem totalmente enxuta com apenas o binário da aplicação

### Defininfo a imagem scratch (imagem docker vazia, totalmente limpa)
FROM scratch

### Seta wordir
WORKDIR /app

### Copia a aplicação buildada do stage 1
COPY --from=builder /app/app .

### Rodar a aplicação buildada
CMD ["/app/app"]