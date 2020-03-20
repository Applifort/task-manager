lint:
	yarn eslint app/
test:
	bundle exec rake test
prettier:
	yarn prettier --write app/**/*.js
