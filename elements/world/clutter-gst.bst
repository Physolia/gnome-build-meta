kind: autotools
sources:
- kind: tar
  url: gnome_downloads:clutter-gst/3.0/clutter-gst-3.0.27.tar.xz
  ref: fe69bd6c659d24ab30da3f091eb91cd1970026d431179b0724f13791e8ad9f9d
build-depends:
- sdk/gobject-introspection.bst
- sdk/gtk-doc.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
depends:
- world/clutter.bst
- world/cogl.bst
- sdk/gdk-pixbuf.bst
- freedesktop-sdk.bst:components/gstreamer.bst
- freedesktop-sdk.bst:components/gstreamer-plugins-base.bst
- freedesktop-sdk.bst:bootstrap-import.bst
public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libclutter-gst-3.0.so'
