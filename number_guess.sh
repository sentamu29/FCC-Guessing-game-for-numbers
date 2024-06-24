#!/bin/bash

# Set up the PSQL variable for querying the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for username
echo "Enter your username:"
read USERNAME

# Check if the username exists in the database
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]; then
  # If the username does not exist, insert it into the database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # If the username exists, parse the user data
  USER_ID=$(echo "$USER_DATA" | cut -d '|' -f 1)
  GAMES_PLAYED=$(echo "$USER_DATA" | cut -d '|' -f 2)
  BEST_GAME=$(echo "$USER_DATA" | cut -d '|' -f 3)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Randomly generate a number between 1 and 1000
TARGET=$((RANDOM % 1000 + 1))
GUESSES=0

# Function to prompt for a guess
prompt_for_guess() {
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
}

# Initial prompt
prompt_for_guess

# Validate input is an integer
while ! [[ $GUESS =~ ^[0-9]+$ ]]; do
  echo "That is not an integer, guess again:"
  prompt_for_guess
done

# Game loop
while [[ $GUESS -ne $TARGET ]]; do
  GUESSES=$((GUESSES + 1))
  if [[ $GUESS -lt $TARGET ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $TARGET ]]; then
    echo "It's lower than that, guess again:"
  fi
  prompt_for_guess
  while ! [[ $GUESS =~ ^[0-9]+$ ]]; do
    echo "That is not an integer, guess again:"
    prompt_for_guess
  done
done

# Increment the guesses count for the final correct guess
GUESSES=$((GUESSES + 1))
echo "You guessed it in $GUESSES tries. The secret number was $TARGET. Nice job!"
