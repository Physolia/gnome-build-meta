kind: make

sources:
- kind: tar
  url: github_files:git-lfs/git-lfs/releases/download/v2.13.3/git-lfs-v2.13.3.tar.gz
  ref: f8bd7a06e61e47417eb54c3a0db809ea864a9322629b5544b78661edab17b950

build-depends:
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:components/which.bst

depends:
- freedesktop-sdk.bst:components/git.bst

variables:
  optimize-debug: "false"

environment:
  MAKEFLAGS: -j%{max-jobs}
  GO111MODULE: on
  GOFLAGS: -mod=vendor
  LDFLAGS: ''

config:
  build-commands:
  - make VERSION=v2.11.0

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" bin/git-lfs

public:
  bst:
    integration-commands:
    - git lfs install --system
