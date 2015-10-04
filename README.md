# My stupid little app

Development:

Create a development environment with the following command:

```
$ docker-compose up --force-recreate app
```

Run Unit tests with this command:

```
$ docker-compose run --rm app ./test
```

# Infrastructure

## DEIS

Terraform to create deis cluster on openstack

```
$ make discovery-url
$ terraform apply \
      -var "username=$OS_USERNAME" \
      -var "password=$OS_PASSWORD" \
      -var "tenant=$OS_TENANT_NAME" \
      -var "auth_url=$OS_AUTH_URL" \
      -var "image=coreos-stable-766.4.0" \
      -var "flavor=4" \
      contrib/openstack
```

## Jenkins

CoreOS box with a jenkins image.   lots of custom stuff added in there ( docker binary, deis binaries, etc).  Using `docker commit` to keep the image saved,  volume mount of `/home/core/jenkins:/var/jenkins_home`
