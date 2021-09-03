#!/bin/bash
blague=$(curl -s https://api.chucknorris.io/jokes/random | jq -r '.value')
mesCategories=$(curl -s https://api.chucknorris.io/jokes/categories | jq -r '.[]')

echo "tu veux une blague au hasard sur chuck norris ? "
read repons
if  [ $repons = oui ]
then
    echo "tien la blague $blague"
else
    echo tiens, voila la liste des categories de blagues sur chuck norris $mesCategories

fi