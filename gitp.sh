##
## EPITECH PROJECT, 2023
## git_push_script
## File description:
## gitp
##

#!/bin/bash

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Fonction pour afficher un message en vert
print_success() {
  echo -e "${GREEN}$1${NC}"
}

# Fonction pour afficher un message en rouge
print_error() {
  echo -e "${RED}$1${NC}"
}

# Fonction pour afficher un message en bleu
print_message() {
  echo -e "${BLUE}$1${NC}"
}

# Demande du message de commit à l'utilisateur
print_message "Entrez le message de commit : "
read commit_message

# Vérification si un message de commit a été saisi
if [[ -z "$commit_message" ]]; then
  print_error "Aucun message de commit saisi."
  exit 1
fi

# Commit avec le message saisi
git commit -m "$commit_message"

# Vérification si le commit a réussi
if [[ $? -eq 0 ]]; then
  print_success "Commit effectué avec succès : $commit_message"
else
  print_error "Échec du commit."
  exit 1
fi

# Pousser les modifications vers le référentiel distant
git push origin

# Vérification si le push a réussi
if [[ $? -eq 0 ]]; then
  print_success "Push effectué avec succès."
else
  print_error "Échec du push."
  exit 1
fi
