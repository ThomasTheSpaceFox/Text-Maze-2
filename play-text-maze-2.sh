#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
source $WHEREAMI/text-maze.conf
$THETERMINATOLUSE --title "Text-Maze" -e $WHEREAMI/text-maze-2.sh