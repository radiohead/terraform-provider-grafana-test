# New playlist resource
# Follows the same format as the dashboard resource
resource "grafana_apps_playlist_playlist_v0alpha1" "test_playlist" {
  metadata {
    uid = "test_playlist"

    # Storing playlists in folders is not supported yet
    # but it will be supported in the near future.
    #
    # folder_uid = grafana_folder.test_folder_one.uid
  }

  spec {
    title    = "Test Playlist"
    interval = "1h"
    items = [
      {
        type  = "dashboard_by_uid"
        value = grafana_dashboard.test_dashboard_old.uid
      },
      {
        type  = "dashboard_by_uid"
        value = grafana_apps_dashboard_dashboard_v1beta1.test_dashboard_new.metadata.uid
      },
    ]
  }

  options {
    overwrite = true
  }
}
