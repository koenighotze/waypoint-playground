project = "koenighotze-waypoint-project"

app "waypoint-test-app" {
  labels = {
      "service" = "test-service"
      "app.kubernetes.io/name" = "test-service"
      "app.kubernetes.io/version" = gitrefpretty()
  }

  build {
    use "pack" {
        builder = "gcr.io/buildpacks/builder:v1"
    }

    registry {
        use "docker" {
          image = "${DOCKER_REGISTRY}/test-service"
          tag = gitrefpretty()
        }
    }
 }

  deploy {
    use "kubernetes" {
      probe_path = "/readiness"
      replicas = 2
      namespace = "${NAMESPACE}"
      annotations = {
        "version" = gitrefpretty()
        "deployer" = "waypoint"
      }
    }

    hook {
      when    = "after"
      command = ["kubectl", "apply", "-f", "./deployment/ambassador.yaml"]
    }
  }

  release {
      use "kubernetes" {
        load_balancer = false
      }
  }
}
