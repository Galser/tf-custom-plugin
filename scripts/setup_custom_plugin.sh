#!/usr/bin/env bash
# Vagrantbox Provison script for Terraform
# Warning : non-priviliged provision! for "vagrant" user


#  Build code, vagrant-specific
go build /vagrant/hello.go
ret_code=$?

# 4. Run it or print error
if [ $ret_code -ne 0 ]; then
    echo "Error while building hello.go"
    echo "Please review go compiler output above"
else
    echo "Compile and build were successful, executing our program : "
    ./hello
fi

