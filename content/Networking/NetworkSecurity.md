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

## SNMP

### SNMP Messages (protocol data units)
Requests and responses exchanged between the SNMP manager (Get, GetBextm GetBuld, Set) and the SNMP agents (Trap, Response, Inform).
1. **Trap:** A trap is an alert message—for example, a trap might alert the SNMP manager to the failure of a device. SNMP trap monitoring is crucial, as it notifies you of issues so you can address them proactively.
1. **Get:** This is a basic information request. A Get message is the main way the SNMP manager gets information from an agent.
1. **GetNext:** As the name implies, a GetNext message sends for the next segment of information.
1. **GetBulk:** This lets the SNMP manager request an array of information via a sequence of GetNext requests, meaning a bigger segment of the MIB can be queried.
1. **Set:** Set messages allow the SNMP manager to give agent instructions regarding changes to settings on a monitored device.
1. **Response:** The response is simply the reply from the agent, acknowledging the request.
1. **Inform:** This is the SNMP manager’s version of the response message, acknowledging receipt of a trap.

[SNMP](https://blog.domotz.com/know-your-networks/snmp-port-number/) uses the `UDP` port `161` of the SNMP Agent for sending and receiving requests. On the other hand, SNMP uses also port `162` of the SNMP Manager for receiving traps from managed devices. 

[An Introduction to SNMP (Simple Network Management Protocol)](https://www.digitalocean.com/community/tutorials/an-introduction-to-snmp-simple-network-management-protocol)

[SNMP Community Strings](https://www.dnsstuff.com/snmp-community-string)

[SNMP v2 vs v3](https://blog.domotz.com/know-your-networks/snmp-v2-vs-v3/)

[SNMP v3](https://blog.domotz.com/know-your-networks/what-is-snmp-v3/)

[How to enable SNMP on your operating system](https://blog.paessler.com/how-to-enable-snmp-on-your-operating-system)

[Securing SNMP](https://www.redhat.com/sysadmin/securing-snmp)

### SNMP tools

[SNMP Tutorial](https://www.ionos.com/digitalguide/server/know-how/snmp-tutorial/)

[SNMP Command Examples Oracle](https://docs.oracle.com/cd/E19201-01/820-6413-13/SNMP_commands_reference_appendix.html)

[Awesome SNMP Github](https://github.com/eozer/awesome-snmp)

[SNMP Monitoring Tools](https://www.dnsstuff.com/snmp-monitoring-tools)