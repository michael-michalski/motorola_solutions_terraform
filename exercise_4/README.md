# Exercise 4

Create a Kubernetes Cluster

> kind create cluster --name moto_uni

Add the folowing to main.tf and grafana.tf

```text
variable "grafana_image" {
  type = string
  description = "The grafana image to be used"
}
```

Then change the module usage to

```text
module "monitoring" {
  source = "./monitoring"
  grafana_image = var.grafana_image
}
```

Actually use the variable by editing grafana.tf like so.

```text
 spec {
        container {
          image = var.grafana_image
          name  = "grafana"
```

Now terraform is going to ask for the grafana image.

> terraform apply

You can submit 5.4.3

## Using var files

Typing in all variables is tedious, so instead we pass them in with tfvars files.

create a new file called dev.tfvars and add the following:

```text
grafana_image="grafana/grafana:5.4.3"
```

## Using environment variables

```text
TF_VAR_grafana_image="grafana/grafana:5.4.3"
```