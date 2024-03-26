#!/bin/bash

# Répertoire de destination pour les captures d'écran
destination_dir="$PWD/ScreenShoot"

# Vérifier si le répertoire de destination existe, sinon le créer
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

# Nom du fichier pour la capture d'écran avec le chemin complet
file_name="$destination_dir/capture_$(date +"%Y-%m-%d_%H-%M-%S").png"

# Prendre la capture d'écran de la région sélectionnée
xfce4-screenshooter --region --save="$file_name"

# Vérifier si la capture d'écran a été réussie
if [ $? -eq 0 ]; then
    echo "Capture d'écran enregistrée dans $file_name"

    # Copier l'image dans le presse-papiers
    xclip -selection clipboard -t image/png -i "$file_name"
    echo "Image copiée dans le presse-papiers"
else
    echo "Erreur lors de la capture d'écran"
fi
