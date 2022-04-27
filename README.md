# Client infrastructure

## À propos

Client infrastructure décrit par le code l'infrastructure à provisioner pour le bon fonctionnement du client de la cartographie nationale.

## Table des matières

- [À propos](#à-propos)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Contribution](#contribution)
- [Construit avec](#construit-avec)
- [Licence](#licence)

## Prérequis

- [Docker](https://www.docker.com/) ou [Terraform CLI](https://www.terraform.io/cli)

## Installation

La commande suivante permet d'utiliser la ligne de commande de terraform via Docker :
```shell
docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light
```

Pour une utilisation simplifiée, il est possible de créer un alias :
```shell
alias terraform='docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light'
```

Avec cet alias, il n'y a plus de différence entre une commande terraform exécutée avec Docker ou avec Terraform CLI.

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
- Secrets du dépôt :
  - `TF_API_TOKEN` : Le token d'api Terraform Cloud de l'équipe Cartographie Nationale qui permet à la CI d'opérer des actions sur Terraform Cloud

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
