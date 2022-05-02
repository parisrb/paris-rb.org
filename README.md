# Rubyparis.org
Read this in [English](README.en.md)

## Environnement de développement

Application Ruby on Rails avec base de données PostgreSQL, assets compilés avec asset pipeline **et** webpack.

Des fichiers de définition Docker docker-compose sont présents pour faciliter la mise en place de l'environnements de développement.

Build des images Docker :

```sh
docker-compose build
```

Installation des gems :

```sh
docker-compose run web bundle install
```

Cette commande doit être lancée dès qu'une nouvelle gem apparait.

Installation des packages Javascript :

```sh
docker-compose run web yarn install
```

Un fichier `.env` à la racine du projet local au développeur derait contenir les valeurs suivantes :

```sh
CLOUDINARY_URL=cloudinary://blablah
```

Créer la base de données :

```sh
docker-compose run web rails db:drop db:create db:schema:load db:seed
```

Lancement d'une migration de base :

```sh
docker-compose run web rails db:migrate
```

Démarrage des images :

```sh
docker-compose down && docker-compose up
```

## Workflow de développement

Le workflow de développement est basé sur le [GitHub flow](https://guides.github.com/introduction/flow/) :

* chaque changement de code (nouvelle fonctionnialité, bug fix, etc) devrait résulter d'un ticket (une *issue* GitHub)
* chaque changement de code devrait passer une *review* de code via une Pull Request

La bonne manière de créer une Pull Request est de :

* créer localement une nouvelle branche correspondant au ticket/issue qu'on veut traiter via ```git checkout master && git pull && git checkout -b fix/13```
* modifier le code et accumuler les commits dans cette nouvelle branch. Les commits devraient mentionner le ticket correspondant (utiliser les mot-clés *fix* or *see*)
* pousser le code vers GitHub ```git push origin fix/13```
* ouvrir une PUll Request
* attendre la review de code et éventuellement modifier son code en fonction des commentaires

## Déploiement en production

Actuellement, la branche master est autodéployée sur Scalingo.
