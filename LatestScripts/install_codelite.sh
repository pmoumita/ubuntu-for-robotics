#!/bin/bash

# Removing any previous installation 
sudo apt-get purge codelite codelite-plugins

# Codelite Installation
sudo apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc
sudo apt-add-repository "deb http://repos.codelite.org/ubuntu/ $(lsb_release -sc) universe"
sudo apt-get update
sudo apt-get install codelite
