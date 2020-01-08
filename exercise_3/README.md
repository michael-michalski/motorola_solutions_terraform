# Lets do something a little cooler

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

Apply kind specific patches.
> kubectl patch deployments -n ingress-nginx -controller -p '{"spec":{"template":{"spec":{"containers":[{"name":"-controller","ports":[{"containerPort":80,"hostPort":80},{"containerPort":443,"hostPort":443}]}],"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

> terraform init

> terraform apply

Look at what we deployed. Let us try to make it usable one step at a time.

Delete everything again
> terraform destroy