#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE teams CASCADE")

cat games.csv | while IFS=",", read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $WINNER == "winner"  ]]  
then
continue
fi

#Get winner_id and opponent_id
WINNER_ID=$($PSQL  "SELECT team_id FROM teams WHERE name = '$WINNER'")
OPPONENT_ID=$($PSQL  "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
#If not found in teams, add (both winner and opponent).
if [[ -z $WINNER_ID ]]
then
#INSERT team
INSERT_WID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
#GET NEW WINNER_ID
WINNER_ID=$($PSQL  "SELECT team_id FROM teams WHERE name = '$WINNER'")
fi

if [[ -z $OPPONENT_ID ]]
then
#INSERT team
INSERT_WID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
#GET NEW OPPONENT_ID
OPPONENT_ID=$($PSQL  "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
fi
GAMES_INSERT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND',  '$WINNER_ID', '$OPPONENT_ID' ,$WINNER_GOALS, $OPPONENT_GOALS)")
done
