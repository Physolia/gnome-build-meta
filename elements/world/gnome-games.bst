kind: meson
sources:
- kind: git_repo
  url: gnome:gnome-games.git
  track: master
build-depends:
- sdk/vala.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- core-deps/grilo-plugins.bst
- core-deps/grilo.bst
- core-deps/libsoup-2.4.bst
- core/gvfs-daemon.bst
- sdk/adwaita-icon-theme.bst
- sdk/glib.bst
- sdk/gtk+-3.bst
- sdk/libhandy.bst
- sdk/libmanette.bst
- sdk/librsvg.bst
- world/gnome-themes-extra.bst
- world/retro-gtk.bst
- world/tracker-2.bst
- world/tracker-miners-2.bst
- freedesktop-sdk.bst:components/hicolor-icon-theme.bst
- freedesktop-sdk.bst:bootstrap-import.bst
