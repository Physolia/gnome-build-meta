kind: meson

sources:
- kind: git_repo
  url: gnome:eog.git
  track: master
  ref: 45.alpha-3-g8815052af92122f852f1775a91f61a9511263c82

build-depends:
- freedesktop-sdk.bst:components/itstool.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- core-deps/exempi.bst
- core-deps/libpeas-1.bst
- core-deps/libportal.bst
- core/gnome-desktop.bst
- sdk/adwaita-icon-theme.bst
- sdk/gdk-pixbuf.bst
- sdk/glib.bst
- sdk/gobject-introspection.bst
- sdk/gsettings-desktop-schemas.bst
- sdk/gtk+-3.bst
- sdk/libhandy.bst
- sdk/librsvg.bst
- freedesktop-sdk.bst:components/lcms.bst
- freedesktop-sdk.bst:components/libexif.bst
- freedesktop-sdk.bst:bootstrap-import.bst

runtime-depends:
- core-deps/webp-pixbuf-loader.bst
