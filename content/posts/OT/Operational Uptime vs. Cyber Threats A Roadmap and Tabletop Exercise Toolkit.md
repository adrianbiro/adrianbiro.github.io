+++
title = 'Operational Uptime vs. Cyber Threats: A Roadmap and Tabletop Exercise Toolkit'
date = 2026-02-18T00:00:00-00:00
summary = 'Master OT security with this guide & toolkit: featuring the critical controls, a tabletop scenario, and an incident response kit for resilient.'
draft = false
tags = ['CyberSecurity', 'OTSecurity', 'OT', 'ICT', 'CyberResilience', 'CriticalInfrastructure', 'IndustrialCybersecurity', 'RiskManagement', 'SecurityArchitecture']
+++

{{< figure src="/posts/_images_files/tolkien/minas_tirith_abstract_night_carcoal.jpeg" title="Minas Tirith" alt="Minas Tirith" width="auto" >}}

> This guide transforms theoretical cybersecurity into operational reality through four functional segments. It begins with the **Strategic Pillars of OT Resilience** to align culture and visibility, followed by a **Starter Questions Checklist** to spark dialogue between IT and engineering. For crisis management, it provides a printable **First-Hour Incident Response Reference**, concluding with a **Table Top Scenario and After-Action Template** to pressure-test readiness and justify security investments.

For decades, the industrial world relied on a single, comforting myth: the air gap. The idea was simple: if the OT network wasn't connected to the internet or the corporate IT network, it was safe.

But in today’s landscape of remote vendor support, interconnected data, and sophisticated living off the land attacks, the air gap is effectively dead. Securing critical infrastructure requires a shift from theoretical isolation to threat-informed resilience.

To build a program that actually works, organizations must move away from overwhelming spreadsheets and focus on three pillars: culture, visibility, and the critical controls.

## Build Trust Before You Build Firewalls

The biggest hurdle in OT security isn't technical; it’s cultural. IT teams often prioritize data confidentiality and frequent patching, while Engineering teams prioritize safety and "nines" of uptime. When IT enters the plant floor with standard corporate policies, they are often met with resistance, rightfully so.

> **The Solution: The Engineering Champion.**

The most mature programs don't just hire IT security experts, but they deputize engineers. An engineer who understands the process flow and safety protocols carries more credibility on the plant floor than a remote analyst. By training an internal engineering champion in cybersecurity basics, you bridge the gap between "it’s secure" and "it’s operational."

## Prioritize the Critical Controls

Industrial environments are often filled with legacy systems, some of which have been running for 20 years. Trying to fix every vulnerability at once is a recipe for paralysis. Instead, focus on the controls that mitigate the highest percentage of real-world threats:

- **Secure Remote Access:** Many breaches occur because a vendor or employee used a simple, non-MFA dial-in to reach an HMI. Implement time-based access and jump hosts to ensure the door is only open when necessary.
- **Defensible Architecture:** Ensure there is a clear, hardened boundary between the business network (IT) and the process network (OT). Most attacks start in IT and pivot into the plant floor because of flat network designs.
- **ICS-Specific Response Plans:** A standard IT incident response plan usually says "disconnect and wipe." In OT, that could cause a catastrophic safety event. Your plan must be tailored to maintain the process while containing the threat.

## Move Visibility "East-West"

Most organizations focus their monitoring on the firewall (North-South traffic)[^1]. However, once an adversary is inside the network, they often live off the land using authorized engineering tools to change PLC logic.

To catch these movements, you need East-West visibility. You need to know what normal looks like between your Engineering Workstation and your Controllers. If a PLC is suddenly being reprogrammed at 2:00 AM on a Sunday, your system should flag it, even if no malware was ever detected.

## Use Tabletops as a Relationship Tool

The best time to meet the person responsible for the water pumps is not during a ransomware attack.

Tabletop Exercises (TTX) are often viewed as a compliance "check-the-box" activity, but their true value lies in relationship building. When you sit IT, Engineering, and Leadership in a room for a few hours to walk through a realistic scenario, you discover the gotchas that aren't in the manual.

> _Who actually has the password to the controller?_  _If we pull the plug on this switch, does the backup generator still kick in?_  _Who calls the regulator?_

Moving these exercises from an annual event to a quarterly, low-stress routine transforms security from a "department of no" into a core part of operational excellence.

## Final Thought

OT security is a marathon, not a sprint. You don't need a multi-million dollar AI solution to start. You need to understand your process, protect your boundaries, and most importantly to listen to the engineers who keep the lights on.

---

> _**Below is the complete OT Security Workshop kit**_

This checklist is designed to move beyond "What if a hacker gets in?" and focus on  operational realities of an OT incident. These questions are meant to trigger discussion between IT, Security, and Engineering.

## Discovery & Communication

The first hour of an incident determines the next 48. These questions test how information flows between the plant floor and the corporate office.

- **The "Who" Question:** If an operator notices a PLC behaving strangely, who is the first person they call? Is it a supervisor, a vendor, or the IT help desk?
- **The "Language" Question:** Does the IT/SOC team understand what a "loss of view" or "loss of control" means, or are they only looking for "malware detected"?
- **The Out-of-Band Question:** If the corporate email and VOIP phone systems are encrypted by ransomware, how do plant managers communicate with the C-suite? Do you have a physical "phone book" of emergency contacts?

## Technical Context & Visibility

OT security is about the "East-West" movement inside the network. These questions challenge your technical assumptions.

- **The Remote Access Question:** How many vendors have "always-on" remote access to our systems? Do we have a way to kill all remote sessions instantly if we suspect a breach?
- **The "Living off the Land" Question:** If an attacker uses our own Engineering Workstation software to change a process setpoint, would our monitoring tools flag that as an alert, or would it just look like a normal update?
- **The Asset Inventory Question:** Do we have a verified list of every IP-connected device on the floor, or are there "shadow" switches and wireless APs installed by vendors for convenience?

## Operational Impact & Safety

In OT, the priority is always safety and reliability. These questions force a choice between "security" and "operations."

- **The "Kill Switch" Question:** Who has the authority to disconnect the plant from the network? Is it a security analyst in a different city, or the shift lead on the floor?
- **The Safety Instrumented System (SIS) Question:** Is our safety system (the logic that prevents explosions or over-pressurization) on the same network as the HMI? If the HMI is compromised, is the SIS still independent and functional?
- **The Manual Override Question:** If every computer screen in the facility goes black right now, can we still run the process manually? For how long?

## Recovery & Restoration

Restoring an OT environment is rarely as simple as "reimaging the drive."

- **The Backup Integrity Question:** When was the last time we tested a restore of a PLC configuration? Do we have those backups stored offline, or are they on a networked server that could be encrypted?
- **The "Clean Room" Question:** If we need to rebuild our HMI servers, do we have a "clean" environment to do it in, or would we be plugging new machines back into a potentially infected network?
- **The Vendor Dependency Question:** If we need the OEM[^2] to help us recover, what is the guaranteed response time in our contract? Does 24/7 support apply to a cyber-incident?

## Next Steps

A great way to start is to pick just three of these questions and spend 30 minutes discussing them with your lead engineer over coffee

---

> OT Incident Response Quick-Reference below is designed to be printed and kept in a physical binder on the plant floor and in the SOC. It bypasses the 50-page manual to provide immediate, actionable ground truths during the first hour of a crisis.

## OT Incident Response: The First Hour Reference

**Emergency Contacts (Physical Phone Numbers)**

- **Site Lead / Shift Supervisor:** _________________________
- **Lead Control Engineer:** _________________________
- **IT/SOC Emergency Line:** _________________________
- **OEM / Primary Vendor Support:** _________________________
- **External IR Firm (if retained):** _________________________

**Operational Ground Truths**

| **Question**                                                          | **Location / Answer**     |
| --------------------------------------------------------------------- | ------------------------- |
| **Manual Control:** Can the process be run manually if the HMI fails? | Yes / No                  |
| **Safety System:** Is the SIS physically/logically isolated?          | Isolated /Integrated      |
| **Backups:** Where is the physical location of offline PLC code?      | _________________________ |
| **Network Kill-Switch:** Where is the primary IT/OT firewall/gateway? | _________________________ |

**Decision Matrix: Who Authorized the Stop?**

- **Authority to Disconnect:** _________________________ _(e.g., Plant Manager)_
- **Authority to Shut Down Process:** _________________________ _(e.g., Shift Lead)_
- **Authority to Notify Regulators:** _________________________ _(e.g., Legal/CISO)_

**Immediate Action Checklist**

- **Safety First:** Confirm the status of the SIS. Ensure physical safety of personnel on the floor.
- **Verify Loss of View:** Is the HMI frozen, or is the process actually stopped? Check physical gauges.
- **Sever Remote Access:** Immediately disable all VPN/Vendor accounts and the IT/OT jump host.
- **Preserve Evidence:** **DO NOT REBOOT** compromised workstations yet. Disconnect the network cable instead to preserve volatile memory.
- **Initiate Out-of-Band Communications:** Move all coordination to the designated emergency channel (radio, satellite phone, or encrypted mobile app).

**Recovery Preparation**

- **Baseline Status:** Locate the most recent known-good configuration files for PLCs/HMIs.
- **Isolation:** Ensure the Restoration Zone (clean network) is physically disconnected from the infected segment before starting restores.

---

> To help you put that reference sheet to the test, here is a plug-and-play scenario script. This is designed for a 2-hour workshop involving both your IT and Engineering teams.

## Scenario: "The Ghost in the Machine"

**Sector:** General Manufacturing / Water Treatment **Estimated Time:** 90 - 120 Minutes

### Phase 1: The Subtle Shift (0–30 Mins)

- **The Inject:** It is 2:15 PM on a Tuesday. A junior operator notices that the HMI is lagging. Suddenly, a pump that was manually set to Off for maintenance toggles to Running on the screen.
- **The Complication:** The operator tries to click Stop, but the HMI is unresponsive. Physical gauges on the floor show the pump is indeed spinning, but the vibration sensors are starting to red-line.
- **Discussion Questions:**
  - Does the operator call IT or a Senior Engineer first?
  - Based on your Quick-Reference Sheet, who has the authority to hit the physical Stop right now?

### Phase 2: The Pivot (30–60 Mins)

- **The Inject:** IT reports that the corporate jump host used by vendors for remote maintenance has seen a massive spike in outbound data. At the same time, the Engineering Workstation in the control room begins a firmware update on a critical PLC, but no update was scheduled.
- **The Complication:** The corporate network is now experiencing a "Blue Screen of Death" on several accounting laptops. The IT/OT firewall is showing thousands of denied connection attempts per second.
- **Discussion Questions:**
  - Do we disconnect the IT/OT boundary firewall? Who makes that call?
  - How do we verify if the PLC firmware update is legitimate or malicious without crashing the process?

### Phase 3: The Ransom (60–90 Mins)

- **The Inject:** A text file appears on the HMI screen: _"Your infrastructure is encrypted. Pay 20 BTC to regain control."_ The process begins to cycle erratically, putting physical equipment at risk of permanent damage.
- **The Complication:** The Lead Engineer realizes the Known-Good backups were stored on a networked drive that is now encrypted by the ransomware.
- **Discussion Questions:**
  - Do we have a physical/offline copy of the PLC logic? If so, where is it kept?
  - If the OEM vendor is the one who usually handles restores, and their remote access is now blocked, how do they get on-site to help?

### Phase 4: The Recovery (90+ Mins)

- **The Inject:** The threat is contained by severing the IT/OT link. The plant is in a Safe State but is currently non-operational.
- **Discussion Questions:**
  - In what order do we bring systems back online? (e.g., Network, Servers, HMIs, PLCs?)
  - How do we prove the network is clean before we re-establish the link to the business office?

### Tips for Facilitating

- **Don't "Fight" the Scenario:** If a participant says "That wouldn't happen," ask them: _"Okay, what is a more realistic version of a total system failure here?"_ Use their expertise to refine the drill.
- **Invite "The Skeptic":** Ensure your most senior engineer is there. Their "I've seen it all" perspective is exactly what makes the exercise valuable.
- **Note the Gaps:** Every time someone says, _"I'm not sure who has that password,"_ write it down. That becomes your "To-Do" list for Monday morning.

---

> This After-Action Report template is designed to translate the chaos of a tabletop exercise into a professional business case. Use this to show leadership that cybersecurity isn't just an IT expense, it's an investment in operational uptime.

## After-Action Report: OT Cybersecurity Tabletop

**Date:** 

**Facilitator:**

**Participants:** IT/Security, Engineering, Plant Operations, Leadership

### Executive Summary

- **Scenario Tested:** e.g., Ransomware Pivot from IT to OT
- **Primary Objective:** To evaluate the coordination between IT and Engineering and the integrity of physical recovery procedures.
- **Overall Assessment:** High Readiness / Moderate Readiness / Critical Gaps Identified

### Key Findings & Gap Analysis

Use this section to highlight where the friction occurred during the drill.

|**Category**|**Discovery / Observation**|**Risk Level**|
|---|---|---|
|**Communication**|e.g., No out-of-band contact list for vendors.|High|
|**Visibility**|e.g., Could not detect unauthorized PLC logic changes.|Critical|
|**Authority**|e.g., Confusion over who can authorize a plant shutdown.|Medium|
|**Recovery**|e.g., Primary backups were networked and encrypted.|Critical|

### What Went Right

_It is vital to show management what is already working to maintain morale and support._

- _Example:_ "The shift lead successfully moved the process to a manual 'Safe State' within 10 minutes of the HMI failure."
- _Example:_ "The IT team successfully isolated the OT network segment within 5 minutes of notification."

### Technical Architecture Review

Document how the network handled the stress.

- **Observation:** Did the attack cross the purdue model[^3] levels unexpectedly?
- **Action Required:** e.g., Move Engineering Workstations to a more restricted VLAN.

### Required Budget & Resource Allocation

Translate the gaps into specific requests.

- **Priority 1: Offline Backup Solution.** Estimated Cost: _
  - _Justification:_ During the drill, we discovered that 100% of our digital backups were vulnerable to the simulated ransomware.
- **Priority 2: East-West Network Visibility Tool.** Estimated Cost: _
  - _Justification:_ We currently have a blind spot between the HMI and the PLC; we cannot detect Living off the Land attacks.
- **Priority 3: Quarterly Training.** Estimated Cost: _ (Man-hours)
  - _Justification:_ 50% of the delay in recovery was due to unfamiliarity with the Incident Response Quick-Reference sheet.

### Improvement Plan (30/60/90 Day)

- **30 Days:** Update physical emergency contact binders on the plant floor.
- **60 Days:** Conduct a physical walk-down to identify and label all network kill-switches.
- **90 Days:** Implement MFA for all 3rd-party vendor remote access.

[^1]: East-West traffic refers to data flow between devices within the same network, while North-South traffic involves data exchanges between internal devices and external networks.

[^2]: Original Equipment Manufacturer

[^3]: Purdue Enterprise Reference Architecture is a framework for organizing industrial control systems (ICS) and their data flows. It segments the network into different layers to enhance security and efficiency in computer-integrated manufacturing.
