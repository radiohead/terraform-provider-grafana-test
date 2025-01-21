# Current dashboard resource.
resource "grafana_dashboard" "test" {
  # Read dashboard data from file.
  config_json = file("${path.module}/dashboards/test.json")

  # [OPTIONAL] Customize folder.
  folder = grafana_folder.test_folder.uid

  # [OPTIONAL] Overwrite if exists.
  overwrite = true
}

# New dashboard resource.
# TODO: add grafana_group_kind_version naming scheme
resource "grafana_dashboards_dashboard" "my_dashboard" {
  # TODO: Wrap into metadata
  # metadata = {

  # Specify UID.
  uid = "my_dashboard"

  # [OPTIONAL] Customize folder.
  folder_uid = grafana_folder.test_folder.uid
  # }

  # What else? Anything that goes to metadata and is customizable by the user can go here.

  # Read dashboard spec from file.
  spec = file("${path.module}/dashboards/my_dashboard.json")

  # Specify dashboard title.
  title = "My Other Dashboard"

  # [OPTIONAL] Customize tags.
  tags = [
    "one",
    "two",
    "three",
    "four"
  ]

  # Some options, to control the behaviour.
  options {
    # [OPTIONAL] Overwrite regardless of resourceVersion in the state.
    overwrite = true

    # [OPTIONAL]
    # Use client-side validation if true (by default).
    # If false, will use server-side validation only.
    validate = false

    # [OPTIONAL] Lint the dashboard using https://github.com/grafana/dashboard-linter.
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
      # "uneditable-dashboard"
    ]
  }
}
