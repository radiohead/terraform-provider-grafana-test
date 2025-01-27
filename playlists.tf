resource "grafana_playlist_playlist_v0alpha1" "my_playlist" {
  metadata {
    uid = "my_playlist"
  }

  spec {
    title    = "My Playlist"
    interval = "1h"
    items = [
      {
        type  = "dashboard_by_uid",
        value = grafana_dashboard_dashboard_v0alpha1.my_dashboard.metadata.uid
      },
      {
        type  = "dashboard_by_uid",
        value = grafana_dashboard_dashboard_v0alpha1.new_dashboard.metadata.uid
      },
    ]
  }

  options {
    overwrite = true
  }
}
