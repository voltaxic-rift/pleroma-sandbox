ARG ELIXIR_VER=1.11.4
ARG ERLANG_VER=24.2.1
ARG ALPINE_VER=3.17.0

FROM hexpm/elixir:${ELIXIR_VER}-erlang-${ERLANG_VER}-alpine-${ALPINE_VER} as build

ARG PLEDIR=/opt/pleroma
ARG DATA=/var/lib/pleroma

ARG BUILD_DATE
ARG VCS_REF

COPY . ${PLEDIR}
WORKDIR ${PLEDIR}

ENV MIX_ENV=prod

RUN apk add git gcc g++ musl-dev make cmake file-dev exiftool ffmpeg imagemagick libmagic ncurses postgresql-client &&\
	echo "import Config" > config/prod.secret.exs &&\
	mix local.hex --force &&\
	mix local.rebar --force &&\
	mix deps.get &&\
	mix compile && \
	mkdir -p ${DATA}/uploads &&\
	mkdir -p ${DATA}/static &&\
	mkdir -p /etc/pleroma

WORKDIR ${PLEDIR}

EXPOSE 4000
ENTRYPOINT ["/opt/pleroma/docker-entrypoint.sh"]
