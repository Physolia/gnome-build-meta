kind: meson
sources:
- kind: git_repo
  url: gnome:geary.git
  track: master

build-depends:
- sdk/vala.bst
- world/snowball.bst
- freedesktop-sdk.bst:components/itstool.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- core-deps/folks.bst
- core-deps/gmime.bst
- core-deps/gnome-online-accounts.bst
- core-deps/gsound.bst
- core-deps/gspell.bst
- core-deps/libpeas-1.bst
- core/gnome-desktop.bst
- sdk/adwaita-icon-theme.bst
- sdk/appstream-glib.bst
- sdk/enchant-2.bst
- sdk/gcr-3.bst
- sdk/glib.bst
- sdk/gsettings-desktop-schemas.bst
- sdk/gtk+-3.bst
- sdk/json-glib.bst
- sdk/libgee.bst
- sdk/libhandy.bst
- sdk/libsecret.bst
- sdk/libsoup.bst
- sdk/webkit2gtk-4.1.bst
- freedesktop-sdk.bst:components/iso-codes.bst
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/sqlite.bst
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  meson-local: >-
    -Dtnef=disabled
    -Dvaladoc=disabled
