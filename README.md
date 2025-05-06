# Test Repo for new Grafana Terraform Provider resources

This repo contains the test setup for the new Grafana apps Terraform resources. Currently supports dashboards and playlists.

The repo defines a couple of folders and dashboards and a playlist (folders are still using the existing folders API):

* `folders.tf` defines the folders
* `dashboards.tf` defines the dashboards
* `playlists.tf` defines the playlist

To use this repo:

```console
# Clone it
git clone git@github.com:radiohead/terraform-provider-grafana-test.git
cd terraform-provider-grafana-test

# Start Grafana
docker compose up -d

# Create a service account & SA token
# By visiting https://localhost:3000/org/serviceaccounts/create

# Configure Terraform
cat <<EOF >> "terraform.tfvars"
grafana_url  = "https://localhost:3000/"
grafana_auth = "<your-service-account-token-here>"
EOF

# Initialize
terraform init

# Plan
terraform plan

# Apply
terraform apply -auto-approve
```
