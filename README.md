# FullCycle 3.0 - Desafio Docker

## Descrição do desafio

Esse desafio é muito empolgante principalmente se você nunca trabalhou com a linguagem Go!
Você terá que publicar uma imagem no docker hub. Quando executarmos:

docker run <seu-user>/codeeducation

Temos que ter o seguinte resultado: Code.education Rocks!

Se você perceber, essa imagem apenas realiza um print da mensagem como resultado final, logo, vale a pena dar uma conferida no próprio site da Go Lang para aprender como fazer um "olá mundo".

Lembrando que a Go Lang possui imagens oficiais prontas, vale a pena consultar o Docker Hub.

Importante: A imagem de nosso projeto Go precisa ter menos de 2MB =)

Dica: No vídeo de introdução sobre o Docker quando falamos sobre o sistema de arquivos em camadas, apresento uma imagem "raiz", talvez seja uma boa utilizá-la.

Divirta-se

## Buildando e executando a imagem localmente

*Talvez precise rodar com o "sudo" afrente cada comando docker se estiver no linux e o docker não estiver no usuário*

`docker build -t optmized-goapp .`

`docker run --rm optmized-goapp`

**Se quiser limpar o ambiente local (remover as imagens e containers)**

`docker rm -f $(docker ps -a -q)`

`docker rmi -f $(docker images -a -q)`

## Executando a imagem a partir do DockerHub

*Dependenco de quando esse projeto for visualizado pode ser que o repositório tenha sido deletado do dockerhub devido a estar hospedado em um plano gratuito*

`docker run --rm adelcol/codeeducation`

link do repositório dockerhub: [adelcol/codeeducation](https://hub.docker.com/repository/docker/adelcol/codeeducation)

## Referências

- [scratch image](https://hub.docker.com/_/scratch)
- [golang image](https://hub.docker.com/_/golang)
- [artigo instruindo passo a passo para otimizar o app go](https://levelup.gitconnected.com/optimize-the-size-of-your-dockerized-go-application-down-to-2mb-7b826ecb062d)
- [entenda o go.mod e go.sum](https://aprendagolang.com.br/2022/06/17/entenda-o-que-sao-os-arquivos-go-mod-e-go-sum/)
- [uma pequena explicação sobre o CGO_ENABLED em uma parte do video](https://www.youtube.com/watch?v=kdPWsCTREY8)