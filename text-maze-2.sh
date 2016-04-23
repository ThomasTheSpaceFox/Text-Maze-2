#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI

V-LOOKUP-INT (){
   VLOOKxaxis=$1
   VLOOKyaxis=$VLOOKPOING
   #xaxis=2
   #yaxis=5
   #file=sample.MOD.txt
   #xaxis=$(sed '1q;d' lookup.txt)
   #yaxis=$(sed '2q;d' lookup.txt)
   #file=$(sed '3q;d' lookup.txt)
   VLOOKline=$(sed ''$VLOOKyaxis'q;d' $MODID)
   LINECACHE=$(echo "$VLOOKline" | grep -o .)
   VLOOKOUT=$(echo "$LINECACHE" | sed ''$VLOOKxaxis'q;d')
   echo "$VLOOKOUT"
}

source $WHEREAMI/text-maze.conf
  

echo "---------------------------------------------------------"
echo "|Thomas's Text-maze system                               |"
echo "|v 2.4                                                   |"
echo "---------------------------------------------------------"
echo ""
echo "these mazes were found:"
$WHEREAMI/MAZE/mazesearch.sh
echo ""
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
echo "enter name of valid .MAZE file"
echo "only type .MAZE files found above"
echo "MAZE files should be in MAZE directory in the script's directory"
#until [ "$FILEREAD" = "1" ]; do
#  read filed
#  file=$WHEREAMI/MAZE/$filed
#  if test -e "$file"; then
#    FILEREAD=1
#  else
#    echo "maze not found"
#  fi
#done
filenumcnt=0
until [ "$FNAMEVAL" = "1" ]; do
  ENTRY4=NULL
  echo "enter filename number found below"
  for f in $WHEREAMI/MAZE/*.MAZE
  do
    CNT1=$(($filenumcnt+1))
    filenumcnt=$CNT1
    echo "$filenumcnt | $f"
    eval $(echo FILELISTITEM${filenumcnt})="${f}"
  done
  read ENTRY4
  eval $(echo filenameselect)=$(echo '$'FILELISTITEM${ENTRY4})
  file=$filenameselect
  if test -f "$file"; then
    FNAMEVAL=1
  fi
done
LOOKUP=$WHEREAMI/lookup.sh
TIMG=source
CANTMOVE="cannot move in that direction."
FINISH="congradulations, you won."
START="Welcome to text-maze."
name="$(sed '1q;d' $file)"
MODID="$WHEREAMI/MAZE/$(sed '2q;d' $file)"
MODTABLE=$(cat $MODID)
sizey=$(sed '3q;d' $file)
sizex=$(sed '4q;d' $file)
starty=$(sed '5q;d' $file)
startx=$(sed '6q;d' $file)
endy=$(sed '7q;d' $file)
endx=$(sed '8q;d' $file)
Playy=$starty
Playx=$startx
echo "$START
$name"
until [[ "$end" = "1" || "$entry" = "$QUITKEY" ]]; do
  POVVIEW=$WHEREAMI/NULL.TC
  POVforwardx="$Playx"
  #POVforwardy=$(echo "$Playy+1" | bc)
  POVforwardy=$(($Playy+1))
  POVbackx="$Playx"
  #CNT1=$(($line+1))
  POVbacky=$(($Playy-1))
  POVleftx=$(($Playx+1))
  POVlefty=$Playy
  POVrightx=$(($Playx-1))
  POVrighty=$Playy
  VLOOKPOING=$POVforwardy
  FORWARD=$(V-LOOKUP-INT $POVforwardx)
  VLOOKPOING=$POVbacky
  BACK=$(V-LOOKUP-INT $POVbackx)
  VLOOKPOING=$POVrighty
  RIGHT=$(V-LOOKUP-INT $POVrightx)
  VLOOKPOING=$POVlefty
  LEFT=$(V-LOOKUP-INT $POVleftx)
  echo "$name"
  if [ "$DEBUG" = "1" ]; then
    echo "F: $FORWARD
B: $BACK
L: $LEFT
R: $RIGHT"
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "1" && "$RIGHT" = "1" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE0.TC
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "1" && "$RIGHT" = "1" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE1.TC
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "1" && "$RIGHT" = "0" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE2.TC
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "0" && "$RIGHT" = "0" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE3.TC
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "0" && "$RIGHT" = "1" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE4.TC
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "0" && "$RIGHT" = "1" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE5.TC
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "1" && "$RIGHT" = "0" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE6.TC
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "0" && "$RIGHT" = "0" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE7.TC
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "0" && "$RIGHT" = "0" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZE8.TC
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "0" && "$RIGHT" = "1" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZE9.TC
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "1" && "$RIGHT" = "0" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZEA.TC
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "0" && "$RIGHT" = "0" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZEB.TC
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "1" && "$RIGHT" = "0" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZEC.TC
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "0" && "$RIGHT" = "1" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZED.TC
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "1" && "$RIGHT" = "1" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZEE.TC
  fi
  $TIMG $POVVIEW
  entry=nullvalue
  until [[ "$entry" = "$UKEY" || "$entry" = "$DKEY" ||  "$entry" = "$LKEY" || "$entry" = "$RKEY" || "$entry" = "$QUITKEY" ]]; do
    echo "valid options: forward(${UKEY}), back(${DKEY}), left(${LKEY}), right(${RKEY}), quit(${QUITKEY})"
    read -n 1 entry
  done
  tput clear
  if [ "$entry" = "$DKEY" ]; then
    if [ "0" = "1" ]; then
      echo "$CANTMOVE"
    else
      #BIND1=$(echo "$Playy-1" | bc)
      BIND1=$(($Playy-1))
      VLOOKPOING=$BIND1
      #echo "$Playx" > lookup.txt
      #echo "$BIND1" >> lookup.txt
      #echo "$MODID" >> lookup.txt
      #bidle=$($LOOKUP)
      #if [ "$DEBUG" = "1" ]; then
      #  echo $bidle
      #fi
      #if [ "$($LOOKUP "$Playx\$BIND1\WHEREAMI/$MODID")" = "1" ]; then
      if [ "$(V-LOOKUP-INT "$Playx")" = "1" ]; then
        echo "$CANTMOVE"
      else
        #upcnt=$(echo "$Playy-1" | bc)
        upcnt=$(($Playy-1))
        Playy=$upcnt
      fi
    fi
  fi
  if [ "$entry" = "$UKEY" ]; then
    if [ "0" = "1" ]; then
      echo "$CANTMOVE"
    else
      #BIND2=$(echo "$Playy+1" | bc)
      BIND2=$(($Playy+1))
      VLOOKPOING=$BIND2
      #echo "$Playx" > lookup.txt
      #echo "$BIND2" >> lookup.txt
      #echo "$MODID" >> lookup.txt
      #bidle=$($LOOKUP)
      #if [ "$DEBUG" = "1" ]; then
      #  echo $bidle
      #fi
      #if [ "$(${LOOKUP} "$Playx\$BIND2\$MODID")" = "1" ]; then
      if [ "$(V-LOOKUP-INT "$Playx")" = "1" ]; then
        echo "$CANTMOVE"
      else
        downcnt=$(($Playy+1))
        Playy=$downcnt
      fi
    fi
  fi
  if [ "$entry" = "$RKEY" ]; then
    if [ "0" = "1" ]; then
      echo "$CANTMOVE"
    else
      BIND3=$(($Playx-1))
      VLOOKPOING=$Playy
      #echo "$BIND3" > lookup.txt
      #echo "$Playy" >> lookup.txt
      #echo "$MODID" >> lookup.txt
      #$LOOKUP
      #if [ "$(${LOOKUP} $Playy\$BIND3\$WHEREAMI/$MODID)" = "1" ]; then
      if [ "$(V-LOOKUP-INT "$BIND3")" = "1" ]; then
        echo "$CANTMOVE"
      else
        leftcnt=$(($Playx-1))
        Playx=$leftcnt
      fi
    fi
  fi
  if [ "$entry" = "$LKEY" ]; then
    if [ "0" = "1" ]; then
      echo "$CANTMOVE"
    else
      BIND4=$(($Playx+1))
      VLOOKPOING=$Playy
      #echo "$BIND4" > lookup.txt
      #echo "$Playy" >> lookup.txt
      #echo "$MODID" >> lookup.txt
      #$LOOKUP
      if [ "$(V-LOOKUP-INT "$BIND4")" = "1" ]; then
        echo "$CANTMOVE"
      else
        rightcnt=$(($Playx+1))
        Playx=$rightcnt
      fi
    fi
  fi
  if [ "${Playx},${Playy}" = "${endx},${endy}" ]; then
    echo "YOU WIN!!!"
    end=1
  fi
done
echo "press enter to exit"
read nullvaliue
