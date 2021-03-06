# Class: ntp
#
# This module manages ntp
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class ntp($ntp_servers=undef) {

  if ($ntp_servers == undef) {
    $real_ntp_servers = ['0.pool.ntp.org','1.pool.ntp.org']
  } else {
    $real_ntp_servers = $ntp_servers
  }
  case $::operatingsystem {
    redhat, centos : { include ntp::redhat }
    debian, ubuntu : { include ntp::debian }
    default : { fail("Operatingsystem ${::operatingsystem} not supported")}
  }

}
