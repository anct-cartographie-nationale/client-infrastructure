# Client infrastructure

## À propos

Client infrastructure décrit par le code l'infrastructure à provisioner pour le bon fonctionnement du client de la cartographie nationale.

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

- [Github Actions](https://docs.github.com/en/actions) est l'outil d'intégration et de déploiement continue intégré à GitHub.
  - L'historique des déploiements est disponible [sous l'onglet Actions](https://github.com/anct-cartographie-nationale/client-infrastructure/actions/) 

#### Déploiement

- [Terraform Cloud](https://www.clever-cloud.com/) est la plateforme proposée par HasiCorp pour administrer les modifications d'infrastructure.
  - Organisation : [cartographie-nationale](https://app.terraform.io/app/cartographie-nationale/workspaces)
  - Workspaces : `client-*`
    - [client-production](https://app.terraform.io/app/cartographie-nationale/workspaces/client-production)
- [AWS](https://aws.amazon.com/) est la plateforme de services Cloud proposée par Amazon.
  - Utilisateur : `cartographie-nationale.client.infrastructure`
  - Groupe : `client-deployer`

## Licence

Voir le fichier [LICENSE](./LICENSE.md) du dépôt.
