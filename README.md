# Client infrastructure

## À propos
Average Client Infrastructure décrit par le code l'infrastructure à provisionner pour le bon fonctionnement [d'Average](https://github.com/romain-cambonie/average-client).
> Ce dépôt n'est pas utile pour faire fonctionner Average en local.

## Table des matières

- 🪧 [À propos](#à-propos)
- 📦 [Prérequis](#prérequis)
- 🚀 [Installation](#installation)
- 🛠️ [Utilisation](#utilisation)
- 🤝 [Contribution](#contribution)
- 🏗️ [Construit avec](#construit-avec)
- 📝 [Licence](#licence)

## Prérequis

- [Docker](https://www.docker.com/) ou [Terraform CLI](https://www.terraform.io/cli)

## Installation

La commande suivante permet d'utiliser la ligne de commande terraform via Docker :
```shell
docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light
```

Pour une utilisation simplifiée, il est possible de créer un alias :
```shell
alias terraform='docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light'
```

Avec cet alias, il n'y a plus de différence entre une commande terraform exécutée avec Docker ou avec Terraform CLI.

## Utilisation

### Vérifier et corriger la syntaxe des fichiers `.tf`

```shell
terraform fmt
```

### Vérifier la cohérence de l'infrastructure

```shell
terraform validate
```

### Récupérer un jeton d'authentification à Terraform Cloud en local

```shell
terraform login
```

### Initialiser l'état et les plugins en local

```shell
terraform init
```

### Planifier une exécution pour voir les différences avec l'état précédent de l'infrastructure

```shell
terraform plan
```

## Construit avec

### Langages & Frameworks
- [Terraform](https://www.terraform.io/) est un outil de description d'infrastructure par le code qui permet de créer et de maintenir une infrastructure de manière sûre et prévisible

### Outils

#### CI

- [Github Actions](https://docs.github.com/en/actions) est l'outil d'intégration et de déploiement continu intégré à GitHub
  - L'historique des déploiements est disponible [sous l'onglet Actions](https://github.com/anct-cartographie-nationale/client-infrastructure/actions/)
- Secrets du dépôt :
  - `TF_API_TOKEN` : Le token d'api Terraform Cloud qui permet à la CI d'opérer des actions sur Terraform Cloud

#### Déploiement
- [Terraform Cloud](https://www.terraform.io/cloud-docs) est la plateforme proposée par HasiCorp pour administrer les modifications d'infrastructure
- [AWS](https://aws.amazon.com/) est la plateforme de services Cloud proposée par Amazon.

## Licence

Voir le fichier [LICENSE.md](./doc/LICENSE.md) du dépôt.
