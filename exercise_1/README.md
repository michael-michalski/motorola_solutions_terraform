# Exercise 1

Check that terraform works and that you can get the list of commands.
> terraform


Lets handle our first infrastructure

> terraform init

Terraform needs configuration files so lets give it some.

Create a main.tf file

And paste in the following contents.

```text
provider "kubernetes" {
  config_context_cluster   = "kind-moto-uni"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}
```

> terraform plan

This gets you a diff of your infrastructure when performing the action.
Also gives you a neat summary at the end.

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

> terraform apply

# So what happened ?
> terraform show

Hmm okay, but did it work ?

> kubectl config set-context kind-moto-uni

> kubectl get namespaces

# Lets clean up our workspace

> terraform destroy