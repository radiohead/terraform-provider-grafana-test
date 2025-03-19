resource "grafana_dashboard_dashboard_v1alpha1" "my_dashboard" {
  metadata {
    uid        = "my_dashboard"
    folder_uid = grafana_folder.test_folder.uid
  }

  spec {
    json  = file("${path.module}/dashboards/my_dashboard.json")
    title = "My Dashboard"
    tags = [
      "one",
      "two",
      "three",
    ]
  }

  options {
    overwrite = true
  }
}

resource "grafana_dashboard_dashboard_v1alpha1" "new_dashboard" {
  metadata {
    uid        = "beao3u53hd3i8b"
    folder_uid = grafana_folder.other_test_folder.uid
  }

  spec {
    json = file("${path.module}/dashboards/new_dashboard.json")
  }

  options {
    overwrite = true
  }
}
