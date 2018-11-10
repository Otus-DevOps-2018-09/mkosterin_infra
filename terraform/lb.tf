resource "google_compute_instance_group" "reddit-apps" {
  name        = "reddit-apps"
  description = "Terraform instance group for reddit application"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]

  #"${google_compute_instance.test2.self_link}",

  named_port {
    name = "http"
    port = "9292"
  }
  zone = "${var.zone}"
}

resource "google_compute_health_check" "reddit-apps-health" {
  name               = "reddit-apps-health"
  timeout_sec        = 10
  check_interval_sec = 10

  tcp_health_check {
    port = "9292"
  }
}

resource "google_compute_backend_service" "reddit-apps-backend" {
  name          = "reddit-apps-backend"
  description   = "reddit-apps-backend"
  port_name     = "http"
  protocol      = "HTTP"
  timeout_sec   = 10
  enable_cdn    = false
  health_checks = ["${google_compute_health_check.reddit-apps-health.self_link}"]

  backend {
    group = "${google_compute_instance_group.reddit-apps.self_link}"
  }
}

resource "google_compute_url_map" "reddit-app-url" {
  name            = "reddit-app-url"
  description     = "url mapper for reddit-app"
  default_service = "${google_compute_backend_service.reddit-apps-backend.self_link}"
}

resource "google_compute_target_http_proxy" "reddit-app-proxy" {
  name    = "reddit-app-proxy"
  url_map = "${google_compute_url_map.reddit-app-url.self_link}"
}

resource "google_compute_global_forwarding_rule" "reddit-app-http-forwarding" {
  name       = "reddit-app-http-forwarding"
  target     = "${google_compute_target_http_proxy.reddit-app-proxy.self_link}"
  port_range = "80"
}
