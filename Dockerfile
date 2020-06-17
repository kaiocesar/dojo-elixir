FROM hexpm/elixir:1.10.1-erlang-22.2.4-alpine-3.11.3 AS otp-builder

ARG APP_NAME
ARG APP_VERSION

ENV APP_NAME=${APP_NAME}
    APP_VERSION=${APP_VERSION} \
    MIX_ENV=prod


WORKDIR /build

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache git

RUN mix local.rebar --force && \
    mix local.hex --force


COPY mix.* ./

RUN mix deps.get --only prod && \
    mix deps.compile

COPY . .

CMD["start"]




