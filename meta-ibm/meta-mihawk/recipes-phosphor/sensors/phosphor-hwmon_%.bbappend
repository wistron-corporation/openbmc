FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
EXTRA_OECONF_append_mihawk = " --enable-negative-errno-on-fail"
MIHAWK_CHIPS = " \
               bus@1e78a000/i2c-bus@100/power-supply@58 \
               bus@1e78a000/i2c-bus@100/power-supply@5b \
               bus@1e78a000/i2c-bus@140/ir35221@70 \
               bus@1e78a000/i2c-bus@140/ir35221@72 \
               bus@1e78a000/i2c-bus@180/ir35221@70 \
               bus@1e78a000/i2c-bus@180/ir35221@72 \
               bus@1e78a000/i2c-bus@400/tmp275@48 \
               bus@1e78a000/i2c-bus@400/tmp275@49 \
               pwm-tacho-controller@1e786000 \
               bus@1e78a000/i2c-bus@400/emc1403@4c \
               bus@1e78a000/i2c-bus@440/pca9545@70/i2c@3/tmp275@48 \
               "
MIHAWK_ITEMSFMT = "ahb/apb/{0}.conf"
MIHAWK_ITEMS = "${@compose_list(d, 'MIHAWK_ITEMSFMT', 'MIHAWK_CHIPS')}"
MIHAWK_ITEMS += "iio-hwmon-vdd0.conf"
MIHAWK_ITEMS += "iio-hwmon-vdd1.conf"
MIHAWK_ITEMS += "iio-hwmon-vcs0.conf"
MIHAWK_ITEMS += "iio-hwmon-vcs1.conf"
MIHAWK_ITEMS += "iio-hwmon-vdn0.conf"
MIHAWK_ITEMS += "iio-hwmon-vdn1.conf"
MIHAWK_ITEMS += "iio-hwmon-vio0.conf"
MIHAWK_ITEMS += "iio-hwmon-vio1.conf"
MIHAWK_ITEMS += "iio-hwmon-vddra.conf"
MIHAWK_ITEMS += "iio-hwmon-vddrb.conf"
MIHAWK_ITEMS += "iio-hwmon-vddrc.conf"
MIHAWK_ITEMS += "iio-hwmon-vddrd.conf"
MIHAWK_ITEMS += "iio-hwmon-12v.conf"
MIHAWK_ITEMS += "iio-hwmon-5v.conf"
MIHAWK_ITEMS += "iio-hwmon-3v.conf"
MIHAWK_ITEMS += "iio-hwmon-battery.conf"

MIHAWK_OCCS = " \
              00--00--00--06/sbefifo1-dev0/occ-hwmon.1 \
              00--00--00--0a/fsi1/slave@01--00/01--01--00--06/sbefifo2-dev0/occ-hwmon.2 \
              "
MIHAWK_OCCSFMT = "devices/platform/gpio-fsi/fsi0/slave@00--00/{0}.conf"
MIHAWK_OCCITEMS = "${@compose_list(d, 'MIHAWK_OCCSFMT', 'MIHAWK_OCCS')}"

ENVS = "obmc/hwmon/{0}"
SYSTEMD_ENVIRONMENT_FILE_${PN} += "${@compose_list(d, 'ENVS', 'MIHAWK_ITEMS')}"
SYSTEMD_ENVIRONMENT_FILE_${PN} += "${@compose_list(d, 'ENVS', 'MIHAWK_OCCITEMS')}"