# Jumpstart Pro Rails Template

All your Rails apps should start off with a bunch of great defaults.

## Getting Started

Jumpstart Pro is a preconfigured Rails application, so you can either
download the code or clone this repository and add your own repo as a
remote to merge in updates.

#### Requirements

You'll need the following installed to run the template successfully:

* Ruby 3.0 or higher
* bundler - `gem install bundler`
* Redis - For ActionCable support (and Sidekiq, caching, etc)
* PostgreSQL - `brew install postgresql`
* Libvips or Imagemagick - `brew install vips imagemagick`
* Yarn - `brew install yarn` or [Install Yarn](https://yarnpkg.com/en/docs/install)
* Foreman (optional) - `gem install foreman` - helps run all your
  processes in development
* If you install [Overmind](https://github.com/DarthSim/overmind) (optional), it will be used in place of Foreman - `brew install tmux overmind`
* [Stripe CLI](https://stripe.com/docs/stripe-cli) for Stripe webhooks in development - `brew install stripe/stripe-cli/stripe`

All Homebrew dependencies are listed in `Brewfile`, so you can install them all at once like this:

```bash
brew bundle install --no-upgrade
```

#### Initial Setup

First, edit `config/database.yml` and change the database name.

Next, run `bin/setup` to install Rubygem and Javascript dependencies. This will also install foreman system wide for you and setup your database.

```bash
bin/setup
```

Optionally, you can rename the application name in `config/application.rb`. This won't affect anything, so it's not too important.

You can also rename the app in the Jumpstart config UI which updates the app name in the navbar, footer, etc.

#### Running Jumpstart Pro

To run your application, you'll use the `bin/dev` command:

```bash
bin/dev
```

This starts up Overmind (or fallback to Foreman) running the Procfile.dev config.

We've configured this to run the Rails server, CSS bundling, and JS bundling out of the box. You can add background workers like Sidekiq, the Stripe CLI, etc to have them run at the same time.

Here's a couple of useful Overmind commands:

```sh
# Debugging with byebug: connect to the `web` process to be able to input commands:
overmind connect web
# Then disconnect by hitting [Ctrl+B] (or your tmux prefix) and then [D].

# Restart a process without restarting all the other ones:
overmind restart web

# If something goes wrong, you can kill all running processes:
overmind kill
```

#### Windows Support

If you'd like to run Jumpstart Pro on Windows, we recommend using WSL2. You can find instructions here: https://gorails.com/setup/windows

Alternatively, if you'd like to use Docker on Windows, you'll need to make sure you clone the repository and preserve the Linux line endings.

```bash
git clone git@github.com:username/myrepo.git --config core.autocrlf=input
```

#### Running with Docker Compose

We include a sample Docker Compose configuration that runs Rails, Postgresql, and Redis for you.

Simply run:
```
docker-compose up
```

Then open http://localhost:3000

#### Running with Docker

If you'd like to run Jumpstart Pro with Docker directly, you can run:

```bash
docker build --tag myapp .
docker run myapp
```

# Local setup

## Ubuntu 18.04

sudo service postgresql start
sudo service redis-server start

### On config/database.yml
Make sure the following lines are uncommented to run in your local PC:
26-27-28
  username: postgres
  password: 12345
  host: localhost


# Next changes

## 1. View that lists and creates only area-related actions


## NeXT STeps:
Fundo personalizado
Logo da Rural
Tela inicial: em dia, atrasado
Calendário: de todos os dias da semana,
processos rotineiros no calendario ( em dia )
processos atrasados
Critério: primeiro dia do mês seguinte fecha todos, e até dia 5 gera o relatório para o pasquini, gerar relatório no começo do mês seguinte

Feito ou não feito.
Resgatar a tela do sistema antigo. Missão, visão, valores, objetivos
O que stá em dia e o que está atrasado

Segunda tela é o que já temos

E terceira tela é o de auditoria.

Checklist de auditoria:
Definir um checklist por processo.
Área
Processo
Peso desse processo dentro da área
Checklist quantitativo e qualitativo
Meta
Pesos:
A definir nomenclatura:
0: Não conforme
50: Em andamento
100: Conforme

Recomendações (Campo de Observação)

Geração de relatórios

Nos valores de diagnóstico, explicar o que significa os valores

Checklist ideal e real não faz muito sentido

Visualização a partir de pesos (maior peso joga pra cima)

Separação por áreas

Automatização do processo de avaliação 

Avaliação é item
Verificação são n items

# Você já está logado(a) no sistema de descrição e auditoria de processos da Rural Soluções e Serviços -> Sistema de Descrição de Processos - Rural Soluções e Serviços

# Incluir foto fachada e "equipe"

# Remover link da página inicial

# Aproveitar texto e formato da página inicial (sem estar logado) -> Sistema de Auditoria de Processos

# company_areas: H1 Visão Geral da Rural
# Selecione área: H4

# Áreas

# Assinatura relatório: responsável da área, auditor e supervisor.

# Em verification, inserir responsável pela área e quem auditou (USER) e quando (DATETIME)