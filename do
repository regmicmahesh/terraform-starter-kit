#!/bin/bash

CMD=$1

if [ -z "$CMD" ]; then
    echo "ERROR: You need to specify the command."
    exit 1
fi

if [ -z "$ENV" ]; then
    echo "ERROR: \$ENV must be set to one of the following:"
    terraform workspace list | grep -v default
    exit 1
fi

terraform workspace select $ENV

if [ $? -ne 0 ]; then
    exit 1
fi

shift 1

plan(){
    terraform plan -input=false -no-color -var-file=./env/${ENV}.tfvars $@
}

destroy(){
    terraform destroy -input=false -no-color -var-file=./env/${ENV}.tfvars $@ -auto-approve
}

init(){
    terraform init -input=false -no-color -var-file=./env/${ENV}.tfvars $@
}

apply(){
    terraform apply -input=false -no-color -var-file=./env/${ENV}.tfvars -auto-approve $@
}

gen(){
    terraform-docs tfvars hcl . > env/example.tfvars
}

new() {
    if [ -z "$1" ]; then
        echo "ERROR: You need to specify the name of the new environment."
        exit 1
    fi

    if [ -e "./env/$1.tfvars" ]; then
        echo "ERROR: Environment $1 already exists."
        exit 1
    fi

    terraform workspace new $1
    cp ./env/example.tfvars ./env/$1.tfvars
}

help(){
    echo "Usage: $0 <command> [<args>]"
    echo "Commands:"
    echo "  plan"
    echo "  destroy"
    echo "  init"
    echo "  apply"
    echo "  gen"
    echo "  new <name>"
    echo "  help"
}


$CMD $@
