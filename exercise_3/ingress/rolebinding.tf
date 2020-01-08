resource "kubernetes_role_binding" "nginx-ingress-role-nisa-binding" {
  metadata {
    name = "nginx-ingress-role-nisa-binding"
    namespace = "nginx-ingress"
    labels = {
      "app.kuberentes.io/name" = "nginx-ingress"
      "app.kuberentes.io/part-of" = "nginx-ingress"
    }
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "nginx-ingress-role"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "nginx-ingress-serviceaccount"
    namespace = "nginx-ingress"
  }
}