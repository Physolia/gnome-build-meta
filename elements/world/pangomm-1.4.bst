kind: meson

sources:
- kind: git_repo
  url: gnome:pangomm.git
  track: pangomm-2-46
  ref: 2.46.3-13-gcc618e5ea7326eac1f8943c66fbe446ab460877a

build-depends:
- core-deps/graphviz.bst
- core-deps/mm-common.bst
- freedesktop-sdk.bst:components/doxygen.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/m4.bst
- freedesktop-sdk.bst:components/perl-xml-parser.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- sdk/pango.bst
- world/cairomm-1.0.bst
- world/glibmm-2.4.bst
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  meson-local: >-
    -Dmaintainer-mode=true
    -Dbuild-documentation=true
    -Dwarnings=min
