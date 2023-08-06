#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n ~~ Number Guessing Game ~~ "

# Generate random number (1 and 1000)
RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ));
GUESS_COUNT=0;

 # If guessed, tell them how many guesses, what it was, and finish.
NUMBER_GUESSER () {    
  # Request number guess (1 - 1000).
  echo -e $1;
  read NUMBER_INPUT;

  if [[ "$NUMBER_INPUT" =~ ^[0-9]+$ ]]
  then
    ((GUESS_COUNT++))
    # Provide feedback on whether or not it's lower or higher.
    if [[ $NUMBER_INPUT -lt $RANDOM_NUMBER ]]
    then
      NUMBER_GUESSER "\nIt's higher than that, guess again:";   
    elif [[ $NUMBER_INPUT -gt $RANDOM_NUMBER ]]
    then
      NUMBER_GUESSER "\nIt's lower than that, guess again:";
    elif [[ $NUMBER_INPUT == $RANDOM_NUMBER ]]
    then
      echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"  
      USER_ID=$($PSQL "SELECT user_id FROM users where NAME='$TRIMMED_USER'")          
      GAMES_INSERT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESS_COUNT)");
    fi      
  else
    # If not an integer tell them.    
    NUMBER_GUESSER "\nThat is not an integer, guess again:"
  fi
}



# Request and Get username (22 characters)
echo -e "\nEnter your username:"
read USER_INPUT;
TRIMMED_USER=$( echo $USER_INPUT | sed -e 's/^[ \t]*//');

#if [[ $TRIMMED_USER =~ ^[a-zA-Z0-9]+$ ]]
#then
  # Check if user exists
  USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE name='$TRIMMED_USER'");

  if [[ -z $USER_ID_RESULT ]]
  then
    # If doesn't exist, add it + welcome it.    
    USER_NAME_INSERT_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USER_INPUT')");
    echo -e "\nWelcome, $TRIMMED_USER! It looks like this is your first time here.";  
    NUMBER_GUESSER "\nGuess the secret number between 1 and 1000:"
  else
    # If it exists, get stats, and welcome back.
    USER_STATS_RESULT=$($PSQL "SELECT COUNT(game_id) as total_games, MIN(guesses) as min_guesses FROM games WHERE user_id=$USER_ID_RESULT");
    echo $USER_STATS_RESULT | while IFS="|" read TOTAL MIN
    do
      echo -e "\nWelcome back, $TRIMMED_USER! You have played $TOTAL games, and your best game took $MIN guesses.";             
    done    
    NUMBER_GUESSER "\nGuess the secret number between 1 and 1000:"
  fi
#else
#  echo "Invalid characters, try another user.";
#fi
