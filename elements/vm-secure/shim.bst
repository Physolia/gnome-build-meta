kind: make

sources:
- kind: git_repo
  url: github:rhboot/shim.git
  track: main
  ref: 15.7-35-g7ba7440c49d32f911fb9e1c213307947a777085d
- kind: git_module
  path: gnu-efi
  url: github:rhboot/gnu-efi.git
  ref: 39d4b348e0aaee43a27602961b0281df99c06957
- kind: local
  path: files/boot-keys/VENDOR.crt
  directory: boot-keys

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/git-minimal.bst
- freedesktop-sdk.bst:components/openssl.bst
- vm-secure/efitools.bst

variables:
  (?):
  - arch == 'i686':
      efi-arch: ia32
  - arch == 'x86_64':
      efi-arch: x64
  - arch == 'aarch64':
      efi-arch: aa64
  - arch == 'riscv64':
      efi-arch: riscv64
  gnomeos-keys-uuid: 8dd6b2b4-3dc4-4ee2-a226-635467997f0e

  make-args: >-
    DEFAULT_LOADER='\\EFI\\systemd\\systemd-boot%{efi-arch}.efi'
    EFIDIR=org.gnome.os
    ESPROOTDIR=efi/
    VENDOR_DB_FILE=boot-keys/VENDOR.esl

  make: make %{make-args}
  make-install: make -j1 install %{make-args} DESTDIR='%{install-root}'

config:
  configure-commands:
  - |
    cert-to-efi-sig-list -g '%{gnomeos-keys-uuid}' boot-keys/VENDOR.crt boot-keys/VENDOR.esl
