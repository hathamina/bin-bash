#!/bin/bash

blague=$(curl -s https://api.chucknorris.io/jokes/random | jq -r '.value')

# -r pour enlver les guillaumé ou decoupé les ' '
# -s pour ne pas afficher les pourcentage

echo $blague