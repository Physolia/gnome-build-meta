kind: autotools
sources:
- kind: tar
  url: github:libhangul/libhangul/archive/refs/tags/libhangul-0.1.0.tar.gz
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
depends:
- freedesktop-sdk.bst:bootstrap-import.bst
