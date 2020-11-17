lint:
	ct lint --config ct.yaml

template:
	# helm template ./charts/$(chart)
	helm install chart --dry-run ./charts/$(chart)

gendocs:
	helm-docs

test:
	trap "kind delete cluster" EXIT SIGINT; \
		kind create cluster; \
		ct install --config ct.yaml
