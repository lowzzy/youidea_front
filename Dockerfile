FROM node:12.18.3-alpine

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN apk update && npm install -g @vue/cli
RUN apk add vim curl

# プロジェクトの作成が完了したらfront/Dockerfileを下記の通りに変更する。2行追記しています。
# このおかげで再ビルドする時にパッケージを更新するようになります。
# Gitでバージョン管理する人は、まっさらな状態で再度docker-compose buildする際にはこの2行を消す事を忘れずに。
COPY package.json .
RUN npm install
