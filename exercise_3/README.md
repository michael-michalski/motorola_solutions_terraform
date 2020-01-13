# Exercise 3: Lets do something a little cooler

Let us create a cluster with ingress

Run the following in a terminal

https://kind.sigs.k8s.io/docs/user/ingress/

```text
cat <<EOF | kind create cluster --name moto-uni-ingress --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    apiVersion: kubeadm.k8s.io/v1beta2
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
        authorization-mode: "AlwaysAllow"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
  - containerPort: 443
    hostPort: 443
EOF
```

> terraform init

> terraform apply

Have a look at what we deployed, keep in mind that some of the resources are hidden behind a namespace "ingress-nginx".

## Extend the ingress
You can do either task.

 * Find a web service of your liking, and add terraform resources so that you can access it.


 * Find / write a service that sends statsd metrics to graphitestatsd on port 8125, and deploy it with terraform.


Delete everything again
> terraform destroy