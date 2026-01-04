+++
title = 'Phishing is not just about fake login pages anymore'
date = 2025-09-20T08:00:00-07:00
summary = 'Modern attacks are designed to overcome our most common defenses, including traditional MFA.'
draft = false
tags = ['CyberSecurity', 'SecurityStrategy', 'ROI', 'Phishing', 'Microsoft', 'SecurityArchitecture', 'EntraID', 'MFA']
+++

{{< figure src="/posts/_images_files/zerotrust.jpeg" title="IDC EDR 2025"title="IDC EDR 2025" alt="alt text string" width="auto" >}}

Phishing isn't just about fake login pages anymore. Modern attacks are designed to overcome our most common defenses, including traditional MFA.

A [recent whitepaper](https://pushsecurity.com/resources/phishing-evolution) on the evolution of phishing shows that attackers are now using Attacker-in-the-Middle (AitM) kits as a standard tool to bypass MFA. These threats have also expanded beyond the inbox, with malicious links being delivered through collaboration tools like Microsoft Teams, social media, and even paid ads.

The good news? If you're invested in the Microsoft security stack (like M365 E3/E5), you likely already own the tools to implement a defense-in-depth strategy. Now it's time to maximize your ROI by activating and integrating these capabilities.

Here’s how a layered security approach using your existing Microsoft tools can address those threats:
* Harden the Identity with Phishing-Resistant Authentication (Prevention)
This is your strongest defense. Windows Hello for Business is an enterprise-grade, passkey-based, phishing-resistant MFA method that, when coupled with proper conditional access policies, mitigates MFA downgrade attacks.
* Protect Where Users Work (Protection)
Attackers are bypassing legacy email security gateway-based solutions by sending links directly via Teams and other apps.
Microsoft Defender for Office 365, Defender for Cloud apps, and Defender for Endpoint address this by extending web content filtering, App-to-app protection, and safe links through time-of-click scanning and "web sandbox" analysis, providing a layer of protection across your entire collaboration suite.
* Assume a threat might eventually get through. (Detection & Response)
Microsoft Entra ID Identity Protection acts as an intelligent zero-trust safety net. It uses machine learning and threat intelligence to identify and block risky user activity across all connected platforms.

Stop thinking in terms of individual products and start building an integrated defense platform. If you're in the Microsoft ecosystem, you've already made the investment. Now, unlock the full value by ensuring these features are enabled and configured to create a resilient, layered security strategy against phishing attacks.