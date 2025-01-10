#!/bin/bash

toAdd=(\
    "$HOME/perl5/bin" \
    "$HOME/flutter/bin" \
    "$HOME/.pub-cache/bin" \
    "$HOME/.local/bin" \
    "$HOME/bin" \
    # add here
)

for path in "${toAdd[@]}"; do
    PATH="$path:$PATH"
done

export PATH
