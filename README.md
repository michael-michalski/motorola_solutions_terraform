## Installation 

You probably need to set it up for Linux. You will need a docker, kind, kubectl & terraform.

* Docker

Make sure you have a working docker setup.

* KIND

> curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.6.1/kind-$(uname)-amd64

> chmod +x ./kind

> mv ./kind /usr/local/bin/kind

* Kubectl

https://kubernetes.io/docs/tasks/tools/install-kubectl/

* Terraform 

Download terraform zip for you architecture on https://www.terraform.io/downloads.html

Unzip it and move it to /usr/local/bin/

## Editor Support
For people using VS Code i recommend the Terraform Extension created by Mikael Olenfalk.
