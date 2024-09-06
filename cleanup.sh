#!/bin/bash

cd /workspaces/mir

mir dev update_compile_commands

mir tools free_space --all

docker system prune -a

echo "Finished system cleanup"
echo "Remember to run the 'clang: Restart language server' command"

