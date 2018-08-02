#FROM ruby:2.5
#
## throw errors if Gemfile has been modified since Gemfile.lock
## RUN bundle config --global frozen 1
#
#RUN mkdir -p /usr/src/app
#WORKDIR /usr/src/app
#
#EXPOSE 3000
#CMD ["rails", "server", "-b", "0.0.0.0"]
#
#RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
#RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
#
#COPY Gemfile /usr/src/app/
#
## Uncomment the line below if Gemfile.lock is maintained outside of build process
## COPY Gemfile.lock /usr/src/app/
#
#
#RUN bundle install
#
#COPY . /usr/src/app

FROM ruby:2.5.1

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get clean \
    && gem install bundler
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install bundler

# Create /app and copy Gemfile{.lock} to it
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock


# Copy the rest of the application over. Allows Gemfile{.lock} to invalidate
# the cached layer if it is changed, without requiring a bundle install for
# every app change
COPY . /app