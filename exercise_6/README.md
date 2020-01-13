# Exercise 6
Using Terraform under a restricted environment.
You can make terraform provision from your kube context.

## Add necessary info

> cat ~/.kube/config

Fill in

config_context_auth_info - (Optional) Authentication info context of the kube config (name of the kubeconfig user, --user flag in kubectl). Can be sourced from KUBE_CTX_AUTH_INFO.

And

config_context_cluster - (Optional) Cluster context of the kube config (name of the kubeconfig cluster, --cluster flag in kubectl). Can be sourced from KUBE_CTX_CLUSTER.

And

```text
namespace = ""
```

And

```text
selector = {
  app = "my_app_is_selected_here"
}
```

## Check if it works

> cd dev

> terraform init

> terraform apply

Check that your service was added

> terraform destroy
