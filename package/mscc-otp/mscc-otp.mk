################################################################################
#
# mscc-otp
#
################################################################################

MSCC_OTP_VERSION = 2026.03
MSCC_OTP_SITE = https://github.com/novarq/mscc-otp.git
MSCC_OTP_SITE_METHOD = git
MSCC_OTP_INSTALL_STAGING = YES

MSCC_OTP_LICENSE = MIT
MSCC_OTP_LICENSE_FILES = COPYING

$(eval $(cmake-package))
