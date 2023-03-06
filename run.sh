#!/bin/bash

# This script is used to run the terraform provisionning of this project

# SSH Key Generation for Ansible connection
eval `ssh-agent`
ssh-keygen -t rsa -a 100 -f ~/.ssh/aws_key

terraform apply