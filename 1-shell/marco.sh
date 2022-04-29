#!/usr/bin/env bash

marco () {
  echo "Starting program marco()"
  rm $HOME/marco.log
  echo "$(pwd)" > $HOME/marco.log
  echo "save $(pwd) on $HOME/marco.log"
}

polo () {
  echo "Starting program polo"
  cd "$(cat "$HOME/marco.log")"
}
