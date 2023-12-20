#!/bin/bash

sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean
sudo deborphan | xargs sudo apt -y remove --purge
sudo snap refresh