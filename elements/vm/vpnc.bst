kind: make

sources:
- kind: git_repo
  url: github:streambinder/vpnc.git
  ref: 43780cecd7a61668002f73b6f8b9f9ba61af74ad

variables:
  make-args: >-
    PREFIX='%{prefix}'
    SCRIPT_PATH='/usr/share/vpnc-script'
  make: make %{make-args}
  make-install: make -j1 DESTDIR='%{install-root}' %{make-args}

build-depends:
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/perl.bst

depends:
- freedesktop-sdk.bst:components/libgcrypt.bst
- freedesktop-sdk.bst:components/gnutls.bst
- vm/vpnc-scripts.bst
