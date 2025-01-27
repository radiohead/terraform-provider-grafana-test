resource "grafana_dashboard_dashboard_v0alpha1" "my_dashboard" {
  metadata {
    # [REQUIRED]
    # Specify UID.
    uid = "my_dashboard"

    # [OPTIONAL]
    # Customize folder.
    folder_uid = grafana_folder.test_folder.uid
  }

  spec {
    json = file("${path.module}/dashboards/my_dashboard.json")

    # [OPTIONAL]
    # Customize title.
    # If not set, the title will be derived from the JSON spec.
    title = "My Dashboard"

    # [OPTIONAL]
    # Customize tags.
    # If not set, the tags will be derived from the JSON spec.
    tags = [
      "one",
      "two",
      "three",
    ]
  }

  # [OPTIONAL]
  # These options are used to control the behaviour of the resource provisioning.
  options {
    # [OPTIONAL]
    # Overwrite regardless of resourceVersion in the state.
    overwrite = true

    # [OPTIONAL]
    # Use client-side validation if set to true.
    # Otherwise will use server-side validation only.
    validate = true

    # [OPTIONAL]
    # Lint the dashboard using https://github.com/grafana/dashboard-linter.
    lint_rules = [
      # "template-datasource-rule",
      # "template-job-rule",
      # "template-instance-rule",
      # "template-label-promql-rule",
      # "template-on-time-change-reload-rule",
      # "panel-datasource-rule",
      # "panel-title-description-rule",
      # "panel-units-rule",
      # "panel-no-targets-rule",
      # "target-logql-rule",
      # "target-logql-auto-rule",
      # "target-promql-rule",
      # "target-rate-interval-rule",
      # "target-job-rule",
      # "target-instance-rule",
      # "target-counter-agg-rule",
      "uneditable-dashboard"
    ]
  }
}

resource "grafana_dashboard_dashboard_v0alpha1" "new_dashboard" {
  metadata {
    uid        = "beao3u53hd3i8b"
    folder_uid = grafana_folder.other_test_folder.uid
  }

  spec {
    json = file("${path.module}/dashboards/new_dashboard.json")
  }

  options {
    overwrite = true
    validate  = true
  }
}

# Current dashboard resource.
resource "grafana_dashboard" "test" {
  # Read dashboard data from file.
  config_json = file("${path.module}/dashboards/test.json")

  # [OPTIONAL] Customize folder.
  folder = grafana_folder.test_folder.uid

  # [OPTIONAL] Overwrite if exists.
  overwrite = true
}
