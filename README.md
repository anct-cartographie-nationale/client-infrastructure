# Client infrastructure

## À propos

Client infrastructure décrit par le code l'infrastructure à provisioner pour le bon fonctionnement du client de la cartographie nationale.

Les déploiements sont opérés par [cette organisation dans Terraform Cloud](https://app.terraform.io/app/cartographie-nationale/workspaces) et agit sur tout espace de travail avec le préfixe `client-`.

## Table des matières

- [À propos](#à-propos)
- [Contribution](#contribution)
- [Construit avec](#construit-avec)
- [Licence](#licence)

## Contribution

### Appliquer la mise à jour de l'infrastructure

Pour que les modifications de la description de l'infrastructure soient appliquées en production, il suffit de publier les changements sur la branche `main`.

## Construit avec

### Langages & Frameworks

- [Terraform](https://www.terraform.io/) est un outil de description d'infrastructure par le code qui permet de créer et de maintenir une infrastructure de manière sûre et prévisible.

### Outils

#### CI

- [Github Actions](https://docs.github.com/en/actions)

#### Déploiement

- [Terraform Cloud](https://www.clever-cloud.com/)
- [AWS](https://aws.amazon.com/)

## Licence

Voir le fichier [LICENSE](./LICENSE.md) du dépôt.
