
# Introduction
This docker image is based on [tmaier/docker-compose](https://hub.docker.com/r/tmaier/docker-compose/). 

Primary use for this image is CI pipelines, allowing Comopser packages (such as Codeception) to be executed against a webapp.

# GitLab CI Usage
Below is a sample of the `gitlab-ci.yml` file may contain for a GitLab CI
```yml
stages:
  - test
  
services: 
  - docker:dind  

test-acceptance:
  image: micealgallagher/compose-with-php-composer
  stage: test
  services: 
    - docker:dind
  script:
    # Run your dockerized webapp
    - docker-compose -f docker-compose.yml up -d
    # Install dependencies
    - composer install
    # Execute codeception tests
    - ./vendor/bin/codecept run --steps

```

# Common Problems
**!.** Attempting to access `localhost` is not possible via `curl` or other tools  
**A.** Change references of `localhost` to `docker`  
  
**!.** Webapp is not accessible after running `docker-compose up (-d)`  
**A.** Add `sleep 5s` to give Docker 5 seconds to fully start a container with your image

**!.** Composer dependencies are not found  
**A.** Don't forget to run `composer install` to install your application's dependencies