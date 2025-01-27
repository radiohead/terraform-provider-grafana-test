# Test folder.
resource "grafana_folder" "test_folder" {
  uid   = "test_folder"
  title = "Test Folder"
}

# Other test folder.
resource "grafana_folder" "other_test_folder" {
  uid   = "ceb91xv65exvkf"
  title = "Other Test Folder"
}
