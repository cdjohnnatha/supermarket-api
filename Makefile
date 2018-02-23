DCMP = docker-compose
APP = supermarketapi
DCMP_EXEC_APP = ${DCMP} exec ${APP}
DCMP_RUN_APP = ${DCMP} run ${APP}

run:
	bundle install
	rm -f tmp/pids/server.pid
	bundle exec rails s -p 3000 -b '0.0.0.0'

up:
	${DCMP} up

down:
	${DCMP} down

bash:
	${DCMP_EXEC_APP} bash

console:
	${DCMP_EXEC_APP} rails c

restart-app:
	${DCMP} restart ${APP}

rebuild:
	make down
	${DCMP} build --no-cache

docker-createdb:
	${DCMP_RUN_APP} make createdb

createdb:
	bundle exec rails db:drop
	bundle exec rails db:create
	bundle exec rails db:migrate
	bundle exec rails db:seed
	bundle exec rails db:test:prepare

yarn-install:
	${DCMP_RUN_APP} npm install yarn --silent && \
	yarn install --modules-folder public/packs