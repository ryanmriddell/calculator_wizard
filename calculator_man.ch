#!/usr/local/bin/bash
# Want to Try Calculator Man? Put it in a directory and use the bash command chmod +x calculator_man.ch in that directory
YOUR_HP=10
WIZARD_HP=10
FIGHT_COMMAND=NO_COMMAND
DAMAGE_TO_WIZARD=0
DAMAGE_TO_PLAYER=0


function fight_the_wizard_main(){
  while [[ $YOUR_HP -gt 0 &&  $WIZARD_HP -gt 0 ]];
   do
    command_prompt
    attack_wizard
    allocate_damage_to_wizard
    attack_player
    allocate_damage_to_player
  done
  end_battle
  exit 0;    
}

function end_battle(){
  if [[ $YOUR_HP -le 0 && $WIZARD_HP -le 0 ]];then
    echo "You both hit each other at the same time and both knocked each other out. Way to be, nerds. GAME OVER"
  elif [[ $YOUR_HP -le 0 ]];then
    echo "You have been defeated by the Wizard even though you were only using this as a calculator...."
    echo "The Wizard says LOL I thought you wanted some calculations, it turns out I calculated kicking your butt! GAME OVER"
  elif [[ $WIZARD_HP -le 0 ]];then 
    echo "The Wizard was defeated! Your trip to use the calculator has ended with assault charges. Congratulations! GAME OVER"
  fi
}


function allocate_damage_to_wizard(){
  echo "DAMAGE TO WIZARD $DAMAGE_TO_WIZARD"
  if [[ $DAMAGE_TO_WIZARD -gt 0 ]];then 
     echo "YOU DEAL $DAMAGE_TO_WIZARD to the Wizard!"
     let $((WIZARD_HP-=$DAMAGE_TO_WIZARD));
     let $((DAMAGE_TO_WIZARD=DAMAGE_TO_WIZARD-=DAMAGE_TO_WIZARD));
     return 0;]
  fi
  return 0;
}

function allocate_damage_to_player(){
  if [[ $DAMAGE_TO_PLAYER -gt 0 ]];then
     echo "THE WIZARD DEALS $DAMAGE_TO_PLAYER DAMAGE"
     let $((YOUR_HP-=$DAMAGE_TO_PLAYER));
     let $((DAMAGE_TO_PLAYER=DAMAGE_TO_PLAYER-=DAMAGE_TO_PLAYER));
     return 0;]
  fi
  return 0;
}



function command_prompt(){
  display_prompt
  read -p "ENTER A COMMAND  " FIGHT_COMMAND
  FIGHT_COMMAND=${FIGHT_COMMAND^^}
  case $FIGHT_COMMAND in
    PUNCH|KICK|"DEFEAT WIZARD IN ONE SHOT"|COWER)COMMAND=$FIGHT_COMMAND;;
    *)$COMMAND=meh;;
  esac
}

function display_prompt(){
  echo '-----------------------------'
  echo '|   YOUR HP - '"$YOUR_HP"'            |'
  echo '|---------------------------|'
  echo '| WIZARD HP - '"$WIZARD_HP"'            |'
  echo '|---------------------------|'
  echo '| COMMANDS                  |'
  echo '|---------------------------|'
  echo '| PUNCH | KICK | COWER      |'
  echo '|---------------------------|'
  echo '|DEFEAT WIZARD IN ONE SHOT  |'
  echo '-----------------------------'
}

function attack_wizard(){
  ROLL=$(( (RANDOM % 6) + 1 ))
  echo "YOU PREPARE A $FIGHT_COMMAND ATTACK"
  echo "YOUR ATTACK ROLL IS $ROLL"
  case $FIGHT_COMMAND in 
  PUNCH)if [[ $ROLL -gt 3 ]];then let $((DAMAGE_TO_WIZARD+= 2)) && echo "You throw a righteous punch that connects!";fi;;
   KICK)if [[ $ROLL -gt 4 ]];then let $((DAMAGE_TO_WIZARD+= 4)) && echo "You mutter something you saw in a movie once and unleash a flying dragon kick!";fi;;
   "DEFEAT WIZARD IN ONE SHOT")one_shot_try;;
   COWER)echo "You have decided to cower. Good job $NAME. END PROGRAM"; exit 0;;
   meh)echo "Invalid command! You have wasted a turn!";;
  esac
}

function attack_player(){
  CHOOSE_ROLL=$(( (RANDOM % 10) + 1))
  TO_HIT_ROLL=$(( (RANDOM % 6) + 1))
  echo "WIZARD ROLLS A $TO_HIT_ROLL to attack"
  case $CHOOSE_ROLL in
    1|2|3|4|5|6)if [[ $TO_HIT_ROLL -gt 2 ]];then let $((DAMAGE_TO_PLAYER+= 2)) && echo "The wizard throws a magical punch... it is a regular punch!";fi;;
    7|8|9)if [[ $TO_HIT_ROLL -gt 4 ]]; then let $((DAMAGE_TO_PLAYER+= 4)) && echo "The wizard pulls up his robe a little to free up some motion and does a sweet roundhouse kick!";fi;;
    10)if [[ $TO_HIT_ROLL -gt 5 ]]; then let $((DAMAGE_TO_PLAYER += 8)) && echo "The wizard uses POCKET SAND! What a cheap shot!";fi;;
  esac
}

function one_shot_try(){
  echo "You put it all on the line and go for a one shot victory!"
  ROLL_ONE=$(( (RANDOM % 6) + 1)); ROLL_TWO=$(( (RANDOM % 6) + 1));
  if [[ $ROLL_ONE -eq $ROLL_TWO ]];then let $((DAMAGE_TO_WIZARD+= 10)) && echo "You landed it, holy crap! That is hard to do!"; 
  else 
     echo "You missed! You practically wasted a turn! This is too risky!" && return 0; 
  fi
}

function actual_calculator(){
  case $CHOICE in
    ADD)calc=$(($FIRST_NUMBER + $SECOND_NUMBER));;
    SUBTRACT)calc=$(($FIRST_NUMBER - $SECOND_NUMBER));;
    MULTIPLY)calc=$(($FIRST_NUMBER * $SECOND_NUMBER));;
    DIVIDE)calc=$(bc <<< "scale=2 ; $FIRST_NUMBER / $SECOND_NUMBER");;
  esac
  echo ""
  echo "Are you ready for the result of your calculation, $NAME?!"
  echo "Well, hit enter to continue then"
  read hit_enter
  echo "THE RESULTS OF YOUR CALCULATION"
  echo ""
  echo ""
  echo ""
  echo "BY ME!"
  echo "    ^   \|/"
  echo "   / \   *"
  echo "  /   \  |"
  echo "  ('.')  |"
  echo "\__| |__/"
  echo " C A L C U L A T O R  W I Z A R D"
  echo ""
  echo '*~*~*~*~'
  echo " $calc <------------ MAGIC"
  echo '*~*~*~*~'
  exit 0
}

function choose_your_quest(){
  echo "$NAME! You have four choices, traveler. Would you like to: "
  echo ""
  echo "ADD"
  echo "SUBTRACT"
  echo "MULTIPLY"
  echo "DIVIDE"
  echo "FIX... my parents divorce... just write FIX there ok"
  echo "FIGHT"
  echo "Enter Your Choice"

  read CHOICE
  CHOICE=${CHOICE^^}

  case $CHOICE in
    ADD|SUBTRACT|MULTIPLY|DIVIDE)echo "EXCELLENT, IT IS MATH TIME FRIENDS" && lets_get_params "$NAME" "$CHOICE";;
    FIX)echo "that is very kind of you $NAME but alas... It is a break up because it is broken. Thanks tho END PROGRAM" && exit 0;;
    FIGHT)echo "OH YEAH? YOU WANT TO THROW DOWN? LETS GO" && fight_the_wizard_main;;
    *)echo "you could have just said you do not want to do this $NAME, but I guess you are smarter than ol CW.. END PROGRAM";;
  esac
}
function lets_get_params(){
  re='^[0-9]+$'
  echo "$NAME, please enter a NUMBER please"
  echo ""
  read FIRST_NUMBER
  if [[ $FIRST_NUMBER =~ $re ]]; then
    echo "Good! Calculator Wizard is pleased."
    echo "Now please, enter a second NUMBER"
    read SECOND_NUMBER
    if [[ $SECOND_NUMBER =~ $re ]]; then
      echo "AHAHAHA YES WE HAVE TWO NUMBERS TO CALCULATE NOW. LET US ABSCOND" && actual_calculator "$NAME" "$CHOICE" "$FIRST_NUMBER" "$SECOND_NUMBER"
    else
      echo "oooh you some sort of rebel deciding to add a non number to this. You are so cool. END PROGRAM"
    fi
  else
    echo "Could not take this seriously, eh? It is ok. This is just a program and this is your life. END PROGRAM"
  fi     
}
function intro_wizard(){

  echo "Hello I am the calculator wizard"
  echo "Why am I a wizard, you ask? Before I tell you..."
  read -p "Please enter your name " NAME

  echo "$NAME.. Interesting. My mother was going to name me that but she decided to name me Calculator Wizard instead.."
  echo "Anyways.. Oh yeah, the calculator thing."
  choose_your_quest "$NAME"
  }
intro_wizard


