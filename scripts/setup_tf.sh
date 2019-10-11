#!/usr/bin/env bash
# Vagrantbox Provison script for Terraform
# Warning : non-priviliged provision! for "vagrant" user

# 1. Terraform download 
TF_VERSION="0.12.10"

which wget || (
  sudo apt-get install wget
) 
# wget -nv - here nv to avoid clutter on screen when provisioning  
wget -nv --directory-prefix=/tmp "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
sudo tar -C /usr/local/bin/ -xvf /tmp/terraform_${TF_VERSION}_linux_amd64.zip

