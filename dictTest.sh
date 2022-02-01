#!/bin/bash -x

declare -A sounds
sounds[dog]="bark";
sounds[cow]="moo";
sounds[bird]="tweet";
sounds[wolf]="howl";

echo "Dog Sound " ${sounds[dog]}
echo "All Animal Sound " ${sounds[@]}
echo "Animals " ${!sounds[@]}
echo "Number of Animals " ${#sounds[@]}
unset sounds[dog]
echo "All Animal Sound " ${sounds[@]}