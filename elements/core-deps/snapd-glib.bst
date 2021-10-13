kind: meson

sources:
- kind: tar
  url: github:snapcore/snapd-glib/releases/download/1.60/snapd-glib-1.60.tar.xz

build-depends:
- sdk/gobject-introspection.bst
- sdk/gtk-doc.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- sdk/json-glib.bst
- sdk/libsoup-2.4.bst
- sdk/vala.bst

variables:
  meson-local: >-
    -Dqt-bindings=false
