kind: autotools
sources:
- kind: git_repo
  url: github:TelepathyIM/telepathy-mission-control.git
  track: telepathy-mission-control-5.16
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- sdk/gtk-doc.bst
depends:
- core-deps/NetworkManager.bst
- sdk/glib.bst
- world/telepathy-glib.bst
- freedesktop-sdk.bst:bootstrap-import.bst
variables:
  conf-local: >-
    --disable-upower
