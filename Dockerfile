FROM ruby:2.6.6
RUN apt-get update -qq \
    && apt-get install -y nodejs postgresql-client
RUN mkdir -p /shopping-list/api
WORKDIR /shopping-list/api
COPY Gemfile* /shopping-list/api/
RUN bundle install
COPY . /shopping-list/api

# Script to be executed every time the container starts.
COPY docker_scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
