# Sistema de Controle da Reserva

## Time de Desenvolvimento

* [Adeilson Silva](http://www.github.com/AdeilsonSilva)

## Como fazer o famoso "Scadolf"

```
$ scaffold -c -m -p db/schema.rb
```

Este comando copiará para o seu clipboard (caso esteja com o xclip instalado) o comando necessário para fazer o scaffold. Cole o comando no terminal e pronto! Exemplo:

```
$ rails generate scaffold User email:string login:string name:string password:string
```

## Como rodar o projeto

Após o clone, é necessário instalar as gems. Façamos utilizando o bundle:

```
$ bundle install
```

Gems instaladas, inicie o servidor interno do Rails e acesse a url indicada no terminal:

```
$ rails s
```
