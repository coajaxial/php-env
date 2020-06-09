# PHP Docker development environment

## Usage

```shell script
docker run --rm -i -v $(pwd):/opt/project coajaxial/php-env [command]
```

## Features

- Alpine Linux
- PHP 7.3 including several extensions required for running Symfony 5+
- Composer
- Yarn

## Examples

### Create new Symfony project

```shell script
docker run --rm -i -v $(pwd):/opt/project coajaxial/php-env composer create-project symfony/website-skeleton [name]
# or
docker run --rm -i -v $(pwd):/opt/project coajaxial/php-env composer create-project symfony/skeleton [name]
```