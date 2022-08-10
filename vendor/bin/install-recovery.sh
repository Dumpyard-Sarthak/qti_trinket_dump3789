#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:59e720ffec7cdc9462fc51815c1644583d1a014a; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:33798a1d93e1ce55f4ce7a2461c44c35c5d5505d \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:59e720ffec7cdc9462fc51815c1644583d1a014a && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
