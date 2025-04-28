#!/bin/bash

echo "Creating aliases..."

alias gpu='git push --set-upstream origin $(git current-branch)'
