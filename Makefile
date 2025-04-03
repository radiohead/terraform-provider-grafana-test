.PHONY: clean
clean:
	@rm -rf .terraform
	@rm -rf .terraform.lock.hcl
	@rm -rf terraform.tfstate
	@rm -rf terraform.tfstate.backup

.PHONY: clean-data
clean-data:
	@kubectl --kubeconfig=testdata/grafana.kubeconfig delete dashboards --all
	@kubectl --kubeconfig=testdata/grafana.kubeconfig delete playlists --all
	@kubectl --kubeconfig=testdata/grafana.kubeconfig delete folders --all
