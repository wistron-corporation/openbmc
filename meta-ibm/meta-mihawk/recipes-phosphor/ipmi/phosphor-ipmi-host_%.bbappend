FILESEXTRAPATHS_append_mihawk := ":${THISDIR}/${PN}"
SRC_URI_append_mihawk = " \
	file://occ_sensors.hardcoded.yaml \
	file://hwmon_sensors.hardcoded.yaml \
	"
