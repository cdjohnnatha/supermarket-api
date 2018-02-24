# Base image:
FROM ruby:2.4.1
# MAINTAINER Claudio Djohnnatha Duarte Lourenco <cdjohnnatha@gmail.com>

# Install dependencies:
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update \
&& apt-get install -y yarn

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/supermarket_api
ENV BUNDLE_GEMFILE $RAILS_ROOT/Gemfile
ENV BUNDLE_PATH /var/www/bundle

# Set working directory, where the commands will be ran:
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Bundler:
RUN gem install bundler && bundle config --global path "$BUNDLE_PATH" && bundle config --global bin "$BUNDLE_PATH/bin"
