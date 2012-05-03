#!/usr/bin/env sh

#########################################################################
# This script is a wrapper for SSH that recognizes aliases. For instance,
# "./ssh-wrapper.sh advo:jurisnet" will SSH into jurisnet's dev server.
#########################################################################

if [[ $# == "0" ]]; then
	echo "Gimme an argument.";
	exit 1
fi

before_args=""; after_args="";
all_args=$*;

while (( "$#" )); do  

  if [[ $1 =~ advo\: ]]; then
    IFS=":"; token=$(echo $1 | awk '{print $2}'); IFS=" ";
    echo "Token recognized: $token";
  elif [[ -z $token ]]; then
    before_args="$before_args $1";
  else
    after_args="$after_args $1";
  fi

  shift

done

if [[ -n $token ]]; then
  ssh $before_args $token@$token.dev.advomatic.com $after_args;
else
  ssh $all_args;
fi
