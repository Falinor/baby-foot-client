FROM node:latest

LABEL maintainer="Andrea Gueugnaut <andrea.gueugnaut@gmail.com>"

ENV APP /code
ENV PORT 3000
WORKDIR $APP

COPY package.json yarn.lock $APP/
RUN yarn

COPY . $APP
RUN yarn build

VOLUME [ "$APP/src"  ]

EXPOSE $PORT

ENTRYPOINT [ "yarn"  ]
CMD [ "start"  ]

