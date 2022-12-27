SUMMARY = "Phosphor fan definition example data"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
PROVIDES += "virtual/phosphor-fan-control-fan-config"
PR = "r1"

SRC_URI = "file://fans.yaml"

S = "${WORKDIR}"

inherit allarch
inherit phosphor-fan

do_install() {
    install -D fans.yaml ${D}${control_datadir}/fans.yaml
}

FILES:${PN} += "${control_datadir}/fans.yaml"
