# MiniPinterest

Aplicação Rails para compartilhar e descobrir ideias por meio de posts.

## Requisitos

- Ruby 3.4+
- Bundler
- SQLite 3

## Instalação

```bash
bundle install
bin/rails db:prepare
```

## Executar a aplicação

Para iniciar o servidor Rails:

```bash
bin/rails server
```

A aplicação ficará disponível em `http://localhost:3000`.

Também é possível usar o comando de desenvolvimento, que inicia o servidor e os processos auxiliares configurados:

```bash
bin/dev
```

## Popular o banco com dados de exemplo

Opcionalmente, execute os seeders para criar usuários e posts de demonstração:

```bash
bin/rails db:seed
```

Os seeds são idempotentes e podem ser executados novamente sem duplicar os registros. Todos os usuários criados usam a senha `password123`:

- `ana.criativa` / `ana@example.com`
- `lucas.design` / `lucas@example.com`
- `bia.casa` / `bia@example.com`

## Testes

```bash
bin/rails test
```

## Banco de dados

Para recriar o banco local do zero:

```bash
bin/rails db:drop db:create db:migrate
```
