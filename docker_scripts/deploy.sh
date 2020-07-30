#!/bin/bash

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

heroku container:push web --arg USER_ID=$USER_ID,GROUP_ID=$GROUP_ID,ENVIRONMENT_ARG=production
heroku container:release web
heroku run rake db:migrate

# drop the database and set it up again:
# heroku pg:reset --confirm c-zv-shop-list-api
# heroku run rake db:migrate db:seed