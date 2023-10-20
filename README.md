<h2>cidadeEstadoMvcCrudRuby</h2>

<div style="display: inline_block">
  <h2>Tecnologias e Frameworks</H2>
  <img alt="Ruby" src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white" />
 <img alt="PostgreSQL" src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" />
</div>

<h2>
    Desenvolvimento de uma Aplicação MVC
    com Ruby on Rails, Sidekiq e PostgreSQL 
</h2>
<h2>Objetivo:</h2>
Desenvolver uma aplicação Ruby on Rails com CRUD para cidades e estados, além de uma
funcionalidade de importação assíncrona de dados da API do IBGE usando Sidekiq.<br>

<h2>Requisitos:</h2>
Configuração do Ambiente:<br>
• UGlize Docker e Docker Compose para configurar o ambiente de desenvolvimento.<br>
• UGlize Ruby on Rails, PostgreSQL e Sidekiq.<br>
<h2>Desenvolvimento da Aplicação MVC:</h2>
• Implemente uma aplicação Ruby on Rails com funcionalidades CRUD para cidades e
estados.<br>
• Crie modelos, controladores e views para "Cidade" e "Estado".<br>
• Implemente rotas para as operações de CRUD.<br>
<h2>Integração com API do IBGE:</h2>
• Crie um botão "importar" que cria um job no Sidekiq para importar informações de
cidades e estados da API do IBGE.<br>
• UGlize a API do  <a href="https://servicodados.ibge.gov.br/api/docs/localidades">IBGE</a></p> para obter os
dados.<br>
• Armazene as informações importadas no banco de dados.
<br><br>
Template da imagem Docker 
<a href="https://docs.docker.com/samples/rails/">docker.com/samples/rails</a><br>
<br>
<div style="display: inline_block">
  <h2>Comando para Build do Docker</H2>
</div>
<h2>docker compose run --no-deps web rails new . --force --database=postgresql</h2>
<h2>Subistitua o arquivo a config  do banco config/database.yml<h2><br>

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: db_development


test:
  <<: *default
  database: db_test
```
<br>
<h2>docker-compose run web rake db:create</h2>
<br>
<h2>docker compose build</h2>
<br>
<h2>docker compose up</h2>