kind: autotools

sources:
- kind: tar
  url: https://github.com/snapcore/snapd/releases/download/2.54.2/snapd_2.54.2.vendor.tar.xz
- kind: patch
  path: files/snapd/fix-mount-dir.patch
- kind: local
  path: files/snapd/tmpfiles-snapd.conf
- kind: local
  path: files/snapd/snapd-user.preset
- kind: local
  path: files/snapd/snapd.preset

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/go.bst
- freedesktop-sdk.bst:components/git-minimal.bst
- freedesktop-sdk.bst:components/systemd.bst

depends:
- sdk/glib.bst
- freedesktop-sdk.bst:components/apparmor.bst
- freedesktop-sdk.bst:components/libseccomp.bst
- freedesktop-sdk.bst:snap-images/squashfs-tools.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/xfsprogs.bst
- freedesktop-sdk.bst:bootstrap-import.bst

environment:
  GOPATH: "%{build-root}"
  GO111MODULE: 'off'

variables:
  mount-dir: '%{localstatedir}/lib/snapd/snap'
  conf-local: >-
    --enable-merged-usr
    --enable-apparmor
    --disable-selinux
    --with-snap-mount-dir="%{mount-dir}"
    --without-unit-tests
  libexecdir: '%{indep-libdir}/snapd'
  go-flags: |
    -buildmode=pie \
    -ldflags "-s -linkmode external -extldflags '$LDFLAGS'"
  go-static-flags: |
    -buildmode=pie \
    -ldflags "-s -linkmode external -extldflags '$LDFLAGS -static'"

config:
  configure-commands:
  - |
    mkdir -p src/github.com/snapcore
    ln -sr . src/github.com/snapcore/snapd

  - |
    ./mkversion.sh 2.52

  - |
    cd cmd
    autoreconf -i -f

  - |
    cd cmd
    ./configure %{conf-args}

  build-commands:
  - go build -o bins/snapd %{go-flags} github.com/snapcore/snapd/cmd/snapd
  - go build -o bins/snap %{go-flags} github.com/snapcore/snapd/cmd/snap
  - go build -o bins/snap-failure %{go-flags} github.com/snapcore/snapd/cmd/snap-failure
  - go build -o bins/snap-seccomp %{go-flags} github.com/snapcore/snapd/cmd/snap-seccomp
  - go build -o bins/snap-update-ns %{go-static-flags} github.com/snapcore/snapd/cmd/snap-update-ns
  - |
    go build -o bins/snap-exec %{go-static-flags} github.com/snapcore/snapd/cmd/snap-exec
  - |
    go build -o bins/snapctl %{go-static-flags} github.com/snapcore/snapd/cmd/snapctl

  - |
    make -C cmd

  install-commands:
  - |
    install -Dm755 -t '%{install-root}%{libexecdir}' \
      bins/snapd \
      bins/snap \
      bins/snap-failure \
      bins/snap-seccomp \
      bins/snap-update-ns \
      bins/snap-exec \
      bins/snapctl

  - |
    install -Dm755 -d '%{install-root}%{bindir}'
    ln -sr '%{install-root}%{libexecdir}/snap' '%{install-root}%{bindir}/snap'

  - |
    make -C data -j1 install DESTDIR='%{install-root}' \
      SYSTEMDSYSTEMUNITDIR="$(pkg-config --variable=systemdsystemunitdir systemd)" \
      BINDIR="%{bindir}" \
      LIBEXECDIR="%{indep-libdir}" \
      SNAP_MOUNT_DIR="%{mount-dir}" \
      SNAPD_ENVIRONMENT_FILE="%{sysconfdir}/default/snapd"

  - |
    make -C cmd -j1 install DESTDIR='%{install-root}'

  - |
    rm -rf '%{install-root}/var'

  - |
    dir="$(pkg-config --variable=tmpfilesdir systemd)"
    install -Dm644 tmpfiles-snapd.conf "%{install-root}${dir}/snapd.conf"

  - |
    install -Dm644 -d "%{install-root}%{prefix}/src"

  - |
    install -Dm644 -t "%{install-root}%{datadir}/polkit-1/actions" data/polkit/io.snapcraft.snapd.policy

  - |
    systemdsystempresetdir="$(pkg-config --variable=systemdsystempresetdir systemd)"
    install -Dm644 snapd.preset "%{install-root}${systemdsystempresetdir}/50-snapd.preset"

  - |
    systemduserpresetdir="$(pkg-config --variable=systemduserpresetdir systemd)"
    install -Dm644 snapd-user.preset "%{install-root}${systemduserpresetdir}/50-snapd.preset"

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 4755 "${sysroot}%{indep-libdir}/snapd/snap-confine"
