.PHONY: login setup run rebuild

login:
	docker exec -it rails24 bash
	cd Rails-application

setup:
	bundle install
	bin/rails db:migrate
	bin/rails db:seed

run:
	bin/rails s -b 0.0.0.0 &


rebuild:
	bin/rails db:rebuild
	
