FROM elixir:1.10

WORKDIR /app

RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools postgresql-client

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh

RUN bash nodesource_setup.sh

RUN apt-get install nodejs

EXPOSE 4000




