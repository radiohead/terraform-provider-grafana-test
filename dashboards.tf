# Current dashboard resource
resource "grafana_dashboard" "test_dashboard_old" {
  # Unlike in the new dashboard resource, one cannot specify the uid.
  # uid         = "test_dashboard_old"

  # Also, the title cannot be specified in Terraform
  # But it's required, so it must be present in the JSON file.
  # title       = "Test Dashboard One"

  folder      = grafana_folder.test_folder_one.uid
  config_json = file("${path.module}/dashboards/test_dashboard_old.json")
  overwrite   = true
}

# New dashboard resource
resource "grafana_apps_dashboard_dashboard_v1beta1" "test_dashboard_new" {
  metadata {
    # In the new dashboard resource, the UID is required.
    # This makes it easier to use deterministic (e.g. human-readable) UIDs.
    # If the user doesn't care about the UID they can use a random UUID / string from Terraform.
    uid        = "test_dashboard_new"
    folder_uid = grafana_folder.test_folder_two.uid
  }

  spec {
    # Dashboard JSON
    json = file("${path.module}/dashboards/test_dashboard_new.json")

    # [OPTIONAL] Customize the title
    # In the new dashboard resource, the title can be specified in Terraform
    # (but it will be derived from the JSON file if not specified).
    title = "Test Dashboard New"

    # [OPTIONAL] The tags can also be customized in Terraform.
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
