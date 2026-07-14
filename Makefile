.PHONY: build
build: generate
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o test-harness-operator ./cmd/test-harness-operator
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o test-harness-ui ./cmd/test-harness-ui

.PHONY: generate
generate:
	controller-gen object paths="./pkg/api/..."

.PHONY: manifests
manifests:
	controller-gen crd paths="./pkg/api/..." output:crd:artifacts:config=pkg/api/reliabilitytest/v1alpha1
