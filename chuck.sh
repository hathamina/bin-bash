#!/bin/bash 
debutPage="<html><head><title>mes blagues</title></head><body>"
finPage="</body></html>"
baliseH2Ouvrante="<h2>"
baliseH2Fermante="</h2>"

recommence=true

declare -a listeDeBlague

while $recommence
    do
        echo "tu veux une blague au hasard sur chuck norris ? "
        read reponse

        if [ $reponse = oui ]
            then
                blague=$(curl -s https://api.chucknorris.io/jokes/random | jq -r '.value')

                #echo $blague
            else 
                echo "tien, voila la liste des catigories de blagues sur chuck norris"

                mesCategories=$(curl -s https://api.chucknorris.io/jokes/categories | jq -r '.[]')

                for Categorie in ${mesCategories[@]}
                    do
                        echo "$Categorie"
                    done 
                
            echo "-----------------------------------" 

            echo "du coup, tu veux une blague de quelle categorie ?"
            read reponseCategorie
            
            blague=$(curl -s https://api.chucknorris.io/jokes/random?category=$reponseCategorie | jq -r '.value')
                
        fi

           
            echo $blague
            echo "on la garde celle la ?"
            read onLaGarde

            if [ $onLaGarde = oui ]
                then 
                    listeDeBlague+=("$blague")
            fi  
                    
            echo "encore une ?"
            read encoreUne

            if [ $encoreUne != oui ]
                then
                    recommence=false
            
            fi   
    done 

echo "---------------"

#echo "ca te dirait de la noter dans un fichier texte Oui ? ou Non ?"
#read ouiOuNon
    #if [ $ouiOuNon = Oui ]   
         #printf [ / n ${listeDeBlague[@]}] >> blague.txt                               
    #fi
            #echo "tcha-tchao"


echo " ca te dirait de l'afficher sur une page web ? Oui? ou Non ?"
read afficherSurPageWeb

if [ $afficherSurPageWeb = oui ]
    then
        pageWeb=""
        pageWeb=$debutPage
            
            for blague in "${listeDeBlague[@]}"
                do
                    pageWebhtml=""
                    pageWebhtml+=$baliseH2Ouvrante
                    pageWebhtml+="$blague"
                    pageWebhtml+=$baliseH2Fermante

                    pageWeb+=$pageWebhtml


                done
            pageWeb+=$finPage

            echo $pageWeb
            echo $pageWeb > index.html
            cp index.html /var/www/html/index.html


fi
