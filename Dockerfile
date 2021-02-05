FROM ruby:2.7.2
ARG RAILS_ENV=production
ARG NODE_ENV=production
ENV BUNDLE_WITHOUT test:development

RUN apt-get update -qq && apt-get install -y postgresql-client vim && \
  apt-get install -y locales

RUN echo "en_ZA.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen en_ZA.UTF-8 && \
  /usr/sbin/update-locale LANG=en_ZA.UTF-8
ENV LC_ALL en_ZA.UTF-8

ENV APP_PATH=/app
RUN mkdir $APP_PATH
WORKDIR $APP_PATH

COPY Gemfile "${APP_PATH}/Gemfile"
COPY Gemfile.lock "${APP_PATH}/Gemfile.lock"

RUN gem install bundler:$(cat Gemfile.lock | tail -1 | tr -d " ")
RUN bundle install

COPY . /app

EXPOSE 3000
ENTRYPOINT [ "entrypoint.sh" ]
