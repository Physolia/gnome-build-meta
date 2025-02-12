kind: script

build-depends:
- freedesktop-sdk.bst:vm/prepare-image.bst
- boards/raspberrypi-4/initramfs/deps.bst
- boards/raspberrypi-4/initramfs/initial-scripts.bst

variables:
  uuidnamespace: aea54278-2587-4075-ae67-8688ace4ce3d

config:
  commands:
  - mkdir -p /tmp /var/tmp /efi
  - |
    prepare-image.sh \
       --seed "%{uuidnamespace}" \
       --rootsource LABEL=root \
       --efisource LABEL=EFI \
       --efipath /boot >/dev/null

  - |
    mkdir -p "%{install-root}/usr/lib/"
    cp -r /usr/lib/modules "%{install-root}/usr/lib/"

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    mkdir -p "%{install-root}/usr/lib/modules/${version}"
    dracut -v --fstab \
           --no-machineid \
           --kver "${version}" \
           --add ostree \
           --add plymouth \
           --add-drivers "rockchipdrm panfrost panel_simple analogix_dp pwm_bl drm_kms_helper" \
           --install 'fsck.ext4' \
           "%{install-root}/usr/lib/modules/${version}/initramfs"

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    cp /boot/vmlinuz "%{install-root}/usr/lib/modules/${version}/vmlinuz"

  - dbus-uuidgen >/etc/machine-id
  - SYSTEMD_ESP_PATH=/efi bootctl --no-variables install
  - rm /etc/machine-id

  - |
    cp -r /efi "%{install-root}/boot"

  - |
    cat <<EOF >"%{install-root}/boot/loader/loader.conf"
    timeout 3
    editor yes
    console-mode keep
    EOF
