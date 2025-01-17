#! /bin/bash

# This script is used to manage the clacurse program.
# It has functions to add TODO, apts, and notes to the clacurse program.

# First check if calcurse is installed
if ! [ -x "$(command -v calcurse)" ]; then
  echo -e "\e[31m"
  echo 'Error: calcurse is not installed.' >&2
  echo "use 'sudo apt install calcurse' to install calcurse" >&2
  echo -e "\e[0m"
  exit 1
fi

# Check if the calcurse directory exists
CLACURSE_DIR="$HOME/.local/share/calcurse"

if [ ! -d "$CLACURSE_DIR" ]; then
  echo -e "\e[31m"
  echo "Error: calcurse directory: '${CLACURSE_DIR}' does not exist." >&2
  echo "Please check or create the directory and try again." >&2
  echo -e "\e[0m"
fi

# Add a TODO to calcurse
function todo() {
  local TODO
  local PRIORITY

  echo "Enter the TODO item: "
  read -r TODO

  echo "Enter the priority (0, 1, 2, 3): "
  read -r PRIORITY

  TODO="[${PRIORITY}] ${TODO}"

  echo "$TODO" >>"$CLACURSE_DIR/todo"

  echo -e "\e[32m"
  echo "TODO item added successfully."
  echo -e "\e[0m"
  }

# Add an appointment to calcurse
function add_apt() {
  local APT
  local DATE
  local iTIME
  local fTIME

  echo -e "\e[33m"
  echo "Enter the appointment:"
  echo -e "\e[0m"
  read -r APT

  echo -e "\e[33m"
  echo -e "Enter the date (MM/DD/YYYY | today | tomorrow): \e[0m"
  read -r DATE
  if [ ${DATE} == "today" ]; then
    DATE=$(date +"%m/%d/%Y")
    echo "set for today: ${DATE}"
  elif [ ${DATE} == "tomorrow" ]; then
    DATE=$(date --date="next day" +"%m/%d/%Y")
    echo "set for tomorrow: ${DATE}"
  fi

  echo -e "\e[33m"
  echo -e "When do you want to start (HH:MM): \e[0m"
  read -r iTIME

  echo -e "\e[33m"
  echo -e "When do you want to end (HH:MM): \e[0m"
  read -r fTIME


  APT="${DATE} @ ${iTIME} -> ${DATE} @ ${fTIME}|${APT}"

  echo "$APT" >>"$CLACURSE_DIR/apts"

  echo -e "\e[32m"
  echo "Appointment added successfully."
  echo -e "\e[0m"
  }
