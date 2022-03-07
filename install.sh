#!/bin/bash
## install script for the project
## install hashicorp repo for ubuntu
## install terraform
## install aws cli
## install packer
## install python3
## install ansible

## install hashicorp repo for ubuntu
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update

## install terraform
sudo apt-get install -y terraform

## install aws cli version 2.
sudo apt-get install -y awscli

## install packer
sudo apt-get install -y packer

## install python3
sudo apt-get install -y python3

## install ansible with pip3
pip3 install ansible

