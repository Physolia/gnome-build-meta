kind: meson

sources:
- kind: git_repo
  url: gnome:gedit.git
  track: master
- kind: git_module
  url: gnome:libgd.git
  path: subprojects/libgd

build-depends:
- sdk/gobject-introspection.bst
- sdk/vala.bst
- freedesktop-sdk.bst:components/itstool.bst
- freedesktop-sdk.bst:components/perl.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- core-deps/gspell.bst
- core-deps/gtksourceview-4.bst
- core-deps/libpeas-1.bst
- core-deps/libsoup-2.4.bst
- sdk/adwaita-icon-theme.bst
- sdk/gsettings-desktop-schemas.bst
- freedesktop-sdk.bst:bootstrap-import.bst
