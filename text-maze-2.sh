#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI

V-LOOKUP-INT (){
   VLOOKxaxis=$1
   VLOOKyaxis=$VLOOKPOING
   #echo "VLOOK x: $VLOOKxaxis y: $VLOOKyaxis"
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


echo "---------------------------------------------------------"
echo "|Thomas's Text-maze system                               |"
echo "|v 2.1                                                  |"
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
until [ "$FILEREAD" = "1" ]; do
  read filed
  file=$WHEREAMI/MAZE/$filed
  if test -e "$file"; then
    FILEREAD=1
  else
    echo "maze not found"
  fi
done
LOOKUP=$WHEREAMI/lookup.sh
TIMG=$WHEREAMI/T-IMG.sh
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
until [[ "$end" = "1" || "$entry" = "quit" ]]; do
  POVVIEW=$WHEREAMI/NULL.TIMG
  POVforwardx="$Playx"
  POVforwardy=$(echo "$Playy+1" | bc)
  POVbackx="$Playx"
  POVbacky=$(echo "$Playy-1" | bc)
  POVleftx=$(echo "$Playx+1" | bc)
  POVlefty=$Playy
  POVrightx=$(echo "$Playx-1" | bc)
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
  #echo "F: $FORWARD
  #B: $BACK
  #L: $LEFT
  #R: $RIGHT"
  if [[ "$FORWARD" = "0" && "$LEFT" = "1" && "$RIGHT" = "1" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE0.TIMG
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "1" && "$RIGHT" = "1" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE1.TIMG
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "1" && "$RIGHT" = "0" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE2.TIMG
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "0" && "$RIGHT" = "0" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE3.TIMG
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "0" && "$RIGHT" = "1" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE4.TIMG
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "0" && "$RIGHT" = "1" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE5.TIMG
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "1" && "$RIGHT" = "0" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE6.TIMG
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "0" && "$RIGHT" = "0" && "$BACK" = "0" ]]; then
    POVVIEW=$WHEREAMI/MAZE7.TIMG
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "0" && "$RIGHT" = "0" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZE8.TIMG
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "0" && "$RIGHT" = "1" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZE9.TIMG
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "1" && "$RIGHT" = "0" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZEA.TIMG
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "0" && "$RIGHT" = "0" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZEB.TIMG
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "1" && "$RIGHT" = "0" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZEC.TIMG
  fi
  if [[ "$FORWARD" = "1" && "$LEFT" = "0" && "$RIGHT" = "1" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZED.TIMG
  fi
  if [[ "$FORWARD" = "0" && "$LEFT" = "1" && "$RIGHT" = "1" && "$BACK" = "1" ]]; then
    POVVIEW=$WHEREAMI/MAZEE.TIMG
  fi
  $TIMG $POVVIEW
  entry=nullvalue
  until [[ "$entry" = "forward" || "$entry" = "back" ||  "$entry" = "left" || "$entry" = "right" || "$entry" = "quit" ]]; do
    echo "valid options: forward, back, left, right, quit"
    read entry
  done
  tput clear
  if [ "$entry" = "back" ]; then
    if [ "$(echo "($Playy-1)<1" | bc)" = "1" ]; then
      echo "$CANTMOVE"
    else
      BIND1=$(echo "$Playy-1" | bc)
      echo "$Playx" > lookup.txt
      echo "$BIND1" >> lookup.txt
      echo "$MODID" >> lookup.txt
      bidle=$($LOOKUP)
      #echo $bidle
      if [ "$($LOOKUP "$Playx\$BIND1\WHEREAMI/$MODID")" = "1" ]; then
        echo "$CANTMOVE"
      else
        upcnt=$(echo "$Playy-1" | bc)
        Playy=$upcnt
      fi
    fi
  fi
  if [ "$entry" = "forward" ]; then
    if [ "$(echo "($Playy+1)>$sizey" | bc)" = "1" ]; then
      echo "$CANTMOVE"
    else
      BIND2=$(echo "$Playy+1" | bc)
      echo "$Playx" > lookup.txt
      echo "$BIND2" >> lookup.txt
      echo "$MODID" >> lookup.txt
      bidle=$($LOOKUP)
      #echo $bidle
      if [ "$(${LOOKUP} "$Playx\$BIND2\$MODID")" = "1" ]; then
        echo "$CANTMOVE"
      else
        downcnt=$(echo "$Playy+1" | bc)
        Playy=$downcnt
      fi
    fi
  fi
  if [ "$entry" = "right" ]; then
    if [ "$(echo "($Playx-1)<1" | bc)" = "1" ]; then
      echo "$CANTMOVE"
    else
      BIND3=$(echo "$Playx-1" | bc)
      echo "$BIND3" > lookup.txt
      echo "$Playy" >> lookup.txt
      echo "$MODID" >> lookup.txt
      #$LOOKUP
      if [ "$(${LOOKUP} $Playy\$BIND3\$WHEREAMI/$MODID)" = "1" ]; then
        echo "$CANTMOVE"
      else
        leftcnt=$(echo "$Playx-1" | bc)
        Playx=$leftcnt
      fi
    fi
  fi
  if [ "$entry" = "left" ]; then
    if [ "$(echo "($Playx+1)>$sizex" | bc)" = "1" ]; then
      echo "$CANTMOVE"
    else
      BIND4=$(echo "$Playx+1" | bc)
      echo "$BIND4" > lookup.txt
      echo "$Playy" >> lookup.txt
      echo "$MODID" >> lookup.txt
      #$LOOKUP
      if [ "$(${LOOKUP} $Playy\$BIND3\$WHEREAMI/$MODID)" = "1" ]; then
        echo "$CANTMOVE"
      else
        rightcnt=$(echo "$Playx+1" | bc)
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
