#!/bin/bash

# Vérifier si le répertoire ~/.ssh existe
if [ ! -d "$HOME/.ssh" ]; then
    echo "Le répertoire ~/.ssh n'existe pas."
    exit 1
fi

# Lister toutes les clés dans le répertoire ~/.ssh
echo "Recherche des clés SSH dans le répertoire ~/.ssh..."

for key in $HOME/.ssh/*; do
    if [ -f "$key" ] && [[ "$key" =~ \.(pub|private)$ ]]; then
        # Affichage du nom de la clé
        echo -e "\nClé trouvée: $key"
        
        # Si c'est une clé publique, afficher des informations
        if [[ "$key" == *.pub ]]; then
            # Afficher le contenu de la clé publique
            echo -e "\nContenu de la clé publique:"
            cat "$key"
            echo -e "\nType et longueur de la clé publique:"
            ssh-keygen -lf "$key"
        fi

        # Si c'est une clé privée, afficher son nom
        if [[ "$key" != *.pub ]]; then
            echo -e "\nClé privée : $key"
        fi

        # Espacement entre les clés
        echo -e "\n------------------------------------------\n"
    fi
done
