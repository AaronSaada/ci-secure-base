#!/bin/bash

echo "🔍 Lancement du scan Gitleaks..."

# Vérifier si Gitleaks est installé
if ! [ -x "$(command -v gitleaks)" ]; then
  echo "❌ Erreur : gitleaks n'est pas installé."
  echo "👉 Installe-le avec :"
  echo "   brew install gitleaks    # sur Mac"
  echo "   choco install gitleaks   # sur Windows"
  echo "   ou voir https://github.com/gitleaks/gitleaks#installation"
  exit 1
fi

# Lancer le scan avec le fichier de config
gitleaks detect --config .gitleaks.toml --source . --verbose

# Vérifier le code de retour
if [ $? -eq 0 ]; then
  echo "✅ Aucun secret détecté !"
else
  echo "🚨 Attention : secrets détectés ! Corrige avant de pousser ton code."
  exit 1
fi
