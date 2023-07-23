# Network Security

[Network WLAN AP-NIPR Platform Recomendations for Department of Defense](https://www.stigviewer.com/stig/_network_wlan_ap-nipr_platform/) 

* WLAN must use EAP-TLS.
* The WLAN inactive session timeout must be set for 30 minutes or less.
* The site must conduct continuous wireless Intrusion Detection System (IDS) scanning.
* Wireless access points and bridges must be placed in dedicated subnets outside the enclave's perimeter.
* The network device must be configured to only permit management traffic that ingresses and egresses the out-of-band management (OOBM) interface.
* The network device must not be configured to have any feature enabled that calls home to the vendor.
* WLAN components must be Wi-Fi Alliance certified with WPA2 or WPA3.
* WLAN components must be FIPS 140-2 or FIPS 140-3 certified.
* WLAN EAP-TLS implementation must use certificate-based PKI authentication to connect to DoD networks.
* WLAN SSIDs must be changed from the manufacturer's default to a pseudo random word that does not identify the unit, base, organization, etc.
* WLAN signals must not be intercepted outside areas authorized for WLAN access.

[OpenSSl WPA2-Enterprise with FreeRadius](https://forums.freebsd.org/threads/howto-wpa2-enterprise-with-freeradius.28467/)

[WLAN access point policy](https://www.stigviewer.com/stig/wlan_access_point_policy/2011-10-10/finding/V-18596) The site will conduct continuous wireless IDS scanning. Note: This requirement applies to all DoD sites that operate DoD computer networks, including sites that have no authorized WLAN systems. 

[Network Security Requirements Guide](https://www.stigviewer.com/stig/network_security_requirements_guide/)

[Network Infrastructure Policy Security Technical Implementation Guide](https://www.stigviewer.com/stig/network_infrastructure_policy/)

[Network Devices Security Technical Implementation Guide](https://www.stigviewer.com/stig/network_devices/)

## Firewall
[Linux and FreeBSD Firewalls](https://klarasystems.com/articles/freebsd-linux-and-freebsd-firewalls/)

[Firewall Security Requirements Guide](https://www.stigviewer.com/stig/firewall_security_requirements_guide/)

[Firewall Security Technical Implementation Guide](https://www.stigviewer.com/stig/firewall/)
