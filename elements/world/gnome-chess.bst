kind: meson
sources:
- kind: git_repo
  url: gnome:gnome-chess.git
  track: master

build-depends:
- sdk/appstream-glib.bst
- sdk/vala.bst
- sdk/yelp-tools.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- sdk/gtk.bst
- sdk/libadwaita.bst
- sdk/librsvg.bst
- freedesktop-sdk.bst:bootstrap-import.bst
