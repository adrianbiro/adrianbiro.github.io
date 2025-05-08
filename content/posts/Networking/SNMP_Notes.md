+++
title = 'SNMP Notes'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['networking']
+++
# SNMP Notes

* *Trap:* A trap is an alert message—for example, a trap might alert the SNMP manager to the failure of a device. SNMP trap monitoring is crucial, as it notifies you of issues so you can address them proactively.
* *Get:* This is a basic information request. A Get message is the main way the SNMP manager gets information from an agent.
* *GetNext:* As the name implies, a GetNext message sends for the next segment of information.
* *GetBulk:* This lets the SNMP manager request an array of information via a sequence of GetNext requests, meaning a bigger segment of the MIB can be queried.
* *Set:* Set messages allow the SNMP manager to give agent instructions regarding changes to settings on a monitored device.
* *Response:* The response is simply the reply from the agent, acknowledging the request.    Inform: This is the SNMP manager’s version of the response message, acknowledging receipt of a trap.

**Ports:** 162 for *trap*, 161 others.
