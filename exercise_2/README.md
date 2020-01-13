# Exercise 2

Modules and segregation

> terraform init

> terraform apply

## Access grafana
admin admin

## Adding a namespace

Task edit the module "monitoring" so that it creates a terraform kubernetes namespace,
and namespaces the resources in inside the module.

Verify that it works by checking resources.

> kubectl get pods -n "YOUR_NAMESPACE"


Delete everything again

> terraform destroy