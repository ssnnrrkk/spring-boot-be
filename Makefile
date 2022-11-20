.PHONY: help run build

help: ## Display this help screen
	@grep -h -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

mvn-tree: ## List dependency in tree level
	./mvnw dependency:tree

mvn-run: ## Run application
	./mvnw spring-boot:run -DskipTests

mvn-build: ## Build application
	./mvnw clean package -DskipTests

docker-run: ## Run apllication by docker container
	docker run -d -p 8080:8080 -t registry.gitlab.com/saraff1/ais/cio-portfolio-dashboard-system-service

docker-build: ## Build image docker
	docker build -t registry.gitlab.com/saraff1/ais/cio-portfolio-dashboard-system-service .

docker-push: ## Push image docker to registry
	docker push registry.gitlab.com/saraff1/ais/cio-portfolio-dashboard-system-service

release-dry: ## Bump App Version without auto push to repository
	npm run release:dry
push-release: ## Push release
	git pull
	git push --follow-tags
test: # run unit test
	./mvnw test -X -Dspring.profiles.active=local
cov: # generate jacoco report
	./mvnw jacoco:report
	#open target/site/jacoco/index.html
