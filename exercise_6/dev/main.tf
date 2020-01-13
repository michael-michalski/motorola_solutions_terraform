provider "kubernetes" {
  config_context_cluster    = ""
  config_context_auth_info  = ""
}

resource "kubernetes_service" "my-test-service" {
  metadata {
    name = "my-test-service"
    namespace = ""
  }
  spec {
    selector = {
      app = "my_app_is_selected_here"
    }
  }
}
