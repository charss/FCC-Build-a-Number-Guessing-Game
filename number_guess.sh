#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

echo "Enter your username:"
read USERNAME

USERS=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")
if [[ -z $USERS ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo $INSERT_USER
else
  echo "$USERS" | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
    GAMES_PLAYED=$((GAMES_PLAYED+1))
    UPDATE_USER=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
  done
fi

CURRENT_USER=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
USER_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$CURRENT_USER")

MAX=1000
RAND_NUMBER=$(( $RANDOM % $MAX + 1 ))
GUESS_COUNT=0
GUESS=0
re='^[0-9]+$'

echo "Guess the secret number between 1 and $MAX:"
while (( $GUESS != $RAND_NUMBER ))
do
  GUESS_COUNT=$((GUESS_COUNT+1))
  read GUESS
  if [[ ! $GUESS =~ $re ]]
  then
    echo "That is not an integer, guess again:"
  elif (( $GUESS > $RAND_NUMBER )) 
  then 
    echo "It's lower than that, guess again:"
  elif (( $GUESS < $RAND_NUMBER )) 
  then
    echo "It's higher than that, guess again:"
  fi
done

echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $RAND_NUMBER. Nice job!"
if (( $USER_BEST_GAME > $GUESS_COUNT || $USER_BEST_GAME == 0 )) 
then
  UPDATE_USER=$($PSQL "UPDATE users SET best_game=$GUESS_COUNT WHERE user_id=$CURRENT_USER")
fi
