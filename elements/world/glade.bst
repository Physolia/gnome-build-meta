kind: meson

sources:
- kind: git_repo
  url: gnome:glade.git
  track: master

build-depends:
- sdk/gtk-doc.bst
- freedesktop-sdk.bst:components/itstool.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

runtime-depends:
- sdk/adwaita-icon-theme.bst
- sdk/cantarell-fonts.bst

depends:
- sdk/gjs.bst
- sdk/gtk+-3.bst
- sdk/pygobject.bst
- world/webkit2gtk-4.0.bst
