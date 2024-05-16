#!/bin/bash

# If arguments are passed, execute them
if [ $# -gt 0 ]; then
  exec "$@"
else
  # Otherwise, run bash in interactive mode
  exec bash
fi