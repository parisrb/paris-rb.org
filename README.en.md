# Rubyparis.org

## Development environment

Ruby on Rails application with PostgreSQL database, assets compiled with asset pipeline and webpack.

Docker and docker-compose files are present to facilitate the setup of development environment.

Build Docker images:

```sh
docker-compose build
```

Install gems:

```sh
docker-compose run web bundle install

Run this command every time there is a new gem.
```

Install Javascript packages:

```sh
docker-compose run web yarn install
```

An `.env` file should be present in your local project with these values:

```sh
CLOUDINARY_URL=cloudinary://blablah
```

Create the database:

```sh
docker-compose run web rails db:drop db:create db:schema:load db:seed
```

Run migrations:

```sh
docker-compose run web rails db:migrate
```

Start docker images:

```sh
docker-compose down && docker-compose up
```

## Development workflow

The development workflow is based on [GitHub flow](https://guides.github.com/introduction/flow/):

* any code change (new feature, bug fix, etc) should come from a ticket (a GitHub *issue*)
* any code change should go through a code *review* in a Pull Request

A good way to create a Pull Request is to:

* create on your local a new branch that correspond to the ticket/issue using ```git checkout master && git pull && git checkout -b fix/13```
* modify code and add commits to your branch. Your commits should refer to the ticket you are working on (use keywords like *fix* or *see*)
* push code to GitHub ```git push origin fix/13```
* open a Pull Request
* wait for a code review and modify your code according to the comments you get

## Deploy to production

Currently, the master branch is automatically deployed on Scalingo.
