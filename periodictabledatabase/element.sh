#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

PrintElement () {
  if [[ -z $1 ]]
  then
    echo "I could not find that element in the database."
  else
    echo $1 | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius.";
    done
  fi  
}

if [[ -z $1 ]] 
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_SEARCH_RESULT=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number='$1'");
    PrintElement $ELEMENT_SEARCH_RESULT;
  elif [[ $1 =~ ^[a-zA-Z]+$ ]]
  then
    if [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
    then
      #Between 1-2 characters, would be symbol lookup.
      ELEMENT_SEARCH_RESULT=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE symbol='$1'");
      PrintElement $ELEMENT_SEARCH_RESULT;
    else
      #More would be name lookup.
      ELEMENT_SEARCH_RESULT=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE name='$1'");
      PrintElement $ELEMENT_SEARCH_RESULT;
    fi
  else
    PrintElement
  fi
fi