# Proxy

Proxy de autenticação INCUCA, servidor `interno.incuca.net`

## Certificados

Renovando certificados:

```bash
curl https://get.acme.sh | sh
./generate_wildcard_cert.sh
# Atualizar DNS do domínio interno.incuca.net com TXT informado
mv ~/.acme.sh/*.interno.incuca.net_ecc/* certs
git add --all
git commit -m "refresh certs"
git push
```
## Proxy Registrados

> [http://doc.incuca.com.br](http://doc.incuca.com.br) > http://doc:8080

Apenas para usuários @incuca.com.br

## Documentação

> [https://www.pomerium.io](https://www.pomerium.io)

### Configurar ambiente (Ubuntu 18.04)

### node and npm

```bash
sudo apt-get -y install nodejs npm
sudo npm i -g n
sudo n stable
sudo npm i -g npm
```

### docker

```bash
sudo apt-get -y remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo grep -qw ^docker /etc/group || sudo groupadd docker
sudo usermod -aG docker $USER
```

### docker-compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```