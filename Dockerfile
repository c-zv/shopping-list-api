FROM ruby:2.6.6

ARG USER_ID
ARG GROUP_ID

# create new user and group
RUN addgroup --gid $GROUP_ID group
RUN adduser --disabled-password --uid $USER_ID --gid $GROUP_ID user

# install packages and updates
RUN apt-get update -qq \
    && apt-get install -y nodejs postgresql-client \
    && gem install bundler

# copy and install the project
RUN mkdir -p /usr/shopping-list/api
WORKDIR /usr/shopping-list/api
# COPY Gemfile* /usr/shopping-list/api/
COPY . /usr/shopping-list/api
RUN bundle install

# script to be executed every time the container starts.
COPY docker_scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# run the application with created user.
RUN chown -R user:group /usr/shopping-list
USER user

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
