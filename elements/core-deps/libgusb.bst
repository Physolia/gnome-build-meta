kind: meson

sources:
- kind: tar
  url: freedesktop_people:~hughsient/releases/libgusb-0.4.2.tar.xz
  ref: 02d3a992a0cd16c46a346439334417617cd7cd5b2ccc5fe0fe998e9ffb8d5d8a

build-depends:
- sdk-deps/gi-docgen.bst
- sdk/gobject-introspection.bst
- sdk/vala.bst
- freedesktop-sdk.bst:components/python3-setuptools.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- sdk/glib.bst
- sdk/json-glib.bst
- freedesktop-sdk.bst:components/libusb.bst
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  meson-local: >-
    -Dumockdev=disabled
