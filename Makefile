lint:
	@find ./charts/* -type d -maxdepth 0 | xargs -I{} bash -c "helm lint {}"

template:
	# helm template ./charts/$(chart)
	helm install chart --dry-run ./charts/$(chart)
