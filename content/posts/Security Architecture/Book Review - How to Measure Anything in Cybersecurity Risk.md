+++
title = 'Book Review: How to Measure Anything in Cybersecurity Risk'
summary = '''How to Measure Anything in Cybersecurity Risk: key lessons on quantifying risk, uncertainty, and security investments.'''
date = 2026-08-22T08:00:00-00:00
draft = false
tags = ['CxOAgenda', 'SecurityStrategy', 'BusinessResilience', 'CyberSecurity', 'ROI', 'RiskManagement', 'EnterpriseArchitecture', 'BookReview']
+++

{{< figure src="/posts/_images_files/personas/woman_sitting_dark_siluette.jpeg" title="Persona" alt="Persona" width="auto" >}}

*How to Measure Anything in Cybersecurity Risk*[^1] challenges one of the most common practices in cybersecurity. Assessing risks with labels such as high, medium, and low. The authors argue that these labels, usually presented in colored risk matrices, create the appearance of disciplined analysis without giving leaders a reliable basis for making decisions.

Their proposed alternative is simple, describe cyber risk using probabilities, financial consequences, ranges, and evidence. The goal is not to predict the future perfectly, but to make better decisions under uncertainty.

## The central argument

The book’s central idea is that measurement does not require certainty. Measurement simply means reducing uncertainty.

An organization may not know exactly how likely a ransomware attack is or precisely how much it would cost. It can still estimate a reasonable probability and a plausible range of losses. For example:

- There is an estimated 10% chance of a ransomware incident during the next year.
- If it occurs, the financial loss is likely to fall between $500,000 and $8 million.
- There is a smaller possibility of a much more severe loss.

This is more informative than calling the risk high. It makes assumptions visible, allows risks to be compared, and gives management something meaningful to consider when approving budgets or choosing controls.

The book is also a persuasive response to the common claim that cybersecurity cannot be quantified because there is not enough data. Book show that organizations often have more evidence than they realize. Internal incidents, outages, penetration tests, phishing exercises, vulnerability records, insurance information, public breaches, and the experience of comparable organizations can all provide useful information.

Even when evidence is limited, informed expert judgment can serve as a starting point. Those estimates can then be updated as new observations become available.

## Why risk matrices are not good enough

I found chapter valuable the criticism of risk matrices, it is one of the book’s strongest arguments. Risk matrices are popular because they are easy to create and explain, but simplicity should not be confused with validity.

The authors identify several fundamental problems:

- Terms such as likely and unlikely mean different things to different people.
- Broad categories place very different risks in the same box.
- Arbitrary category boundaries can rank a lower financial risk above a higher one.
- Multiplying ordinal likelihood and impact scores produces numbers without a sound mathematical meaning.
- Heat maps conceal the range of possible losses, especially rare but catastrophic outcomes.

For example, one event might have a 50% chance of causing a $9 million loss, while another has a 60% chance of causing a $2 million loss. A poorly designed matrix could classify the second event as high and the first as medium, even though the first has a much greater expected loss.

The authors do not claim that quantitative models are perfect. Their point is that such models must be compared with the actual alternative, which is often an undocumented model inside someone’s head. Qualitative judgments also contain assumptions and errors, but they make those weaknesses harder to identify.

A quantitative model can be challenged, tested, and improved because its assumptions are explicit.

## A lesson from intelligence analysis

The book’s criticism of vague probability language is not unique to cybersecurity. It echoes a problem identified decades earlier by Sherman Kent in his essay *Words of Estimative Probability*[^2].

Kent describes an intelligence assessment that called an invasion of Yugoslavia a “serious possibility.” When he later asked what the expression meant, he discovered that the analysts involved had probabilities ranging from roughly 20% to 80% in mind. The policy audience interpreted the phrase differently again. The language created the appearance of agreement even though the participants did not share the same judgment.

Kent’s example reinforces one of Book's central arguments. A cybersecurity team may agree that an event is likely or high risk while its members hold very different beliefs about how often the event could occur and how serious its consequences would be. Agreement on a label does not necessarily mean agreement on the underlying risk.

Kent proposed connecting a limited set of probability expressions, such as probable and almost certain, to approximate numerical values. Intelligence Community Directive 203, *Analytic Standards*[^3], develops this approach into a formal standard. It connects verbal terms to numerical probability ranges. For example, it defines likely or probable as a probability between 55% and 80%, and almost certain as between 95% and 99%.

ICD 203 also requires analysts to:

- distinguish information, assumptions, and judgments
- explain the uncertainty associated with important conclusions
- assess the quality and credibility of sources
- consider plausible alternative explanations
- acknowledge significant supporting and contrary evidence
- identify information that could change an assessment
- explain changes from previous judgments

These principles closely support the book’s approach. Both insist that uncertainty should be made visible and that analysts should take responsibility for their judgments rather than hide behind vague language. Both also recognize that difficult judgments cannot be avoided merely because the available information is incomplete.

However, the comparison also shows where Book go further. Standardizing probability words improves communication, but it still compresses a wide range of estimates into a single category. A 56% probability and a 79% probability can both be described as likely, even though they may lead to different decisions. Verbal categories can also still be misunderstood unless the associated numerical range is made clear.

The book therefore offers a useful next step beyond Kent and ICD 203. Instead of relying mainly on standardized words, it recommends stating numerical probabilities or ranges directly, adding the potential financial consequences, and showing how proposed controls would change the risk. Intelligence standards improve the communication of uncertainty, the book use uncertainty as an input into investment and resource-allocation decisions.

ICD 203 also provides an important distinction between the likelihood of an event and the analyst’s confidence in the assessment. Likelihood concerns whether an event will occur. Confidence concerns the quality of the evidence, reasoning, and sources supporting that judgment. A strong cyber-risk assessment should preserve this distinction. It should not just state a probability but also explain why the range is wide or narrow and what evidence would cause it to change.

## The role of expert judgment

The book does not dismiss cybersecurity expertise. Specialists remain essential for understanding systems, defining scenarios, identifying relevant controls, and interpreting incomplete evidence.

However, unaided expert judgment is often inconsistent and overconfident. People may give different answers to the same question depending on how it is worded, when it is asked, or what information they encountered first. Group discussions can also produce agreement without improving accuracy, particularly when participants are influenced by seniority or confidence.

The book’s treatment of expert inconsistency connects directly with *Noise: A Flaw in Human Judgment*[^4]. *Noise* distinguishes systematic bias from unwanted variation in judgments that should be similar. In cybersecurity, this variation appears when different analysts assign very different probabilities to the same scenario, or when the same analyst changes an estimate despite receiving identical information. This suggests that many risk-assessment processes do not simply measure risk. They also capture which analyst happened to perform the assessment, when it was performed, and how the information was presented.

Seen through the framework of *Noise*, the book’s recommendations function as forms of decision hygiene. Clear scenario definitions, independent estimates, calibration training, decomposition, mathematical aggregation, and explicit quantitative models all reduce opportunities for irrelevant variation. Risk matrices may appear standardized, but their vague categories can conceal disagreement rather than remove it. Numerical estimates do not eliminate judgment, but they make inconsistency visible and allow the organization to test whether its process is stable, calibrated, and improving over time.

The book recommend treating experts as valuable but imperfect measurement instruments. Experts can improve their estimates through calibration exercises, repeated practice, and feedback. When several specialists are involved, they should usually provide their initial estimates independently before discussing their differences.

This approach has several advantages:

- It reduces the influence of dominant personalities.
- It limits anchoring on the first estimate mentioned.
- It exposes genuine differences in assumptions.
- It allows the organization to track forecasting performance over time.

Calibration does not necessarily give experts more knowledge. It helps them express more accurately how much they already know.

The intelligence standards add another useful discipline here. Expert estimates should identify the sources on which they rely, distinguish observed information from assumptions, and consider plausible alternatives. Calibration can improve how experts express uncertainty, but it cannot compensate for weak evidence, hidden assumptions, or failure to consider other explanations.

## The rapid risk audit as a practical alternative

One of the book’s strengths is that it does not require organizations to begin with a complex actuarial model. The authors propose a rapid risk audit that can replace a conventional risk matrix without demanding significantly more effort.

For each important scenario, the analyst defines:

- what event could occur
- which asset or business process would be affected
- the probability of the event during a stated period
- the likely range of financial consequences
- the controls that could reduce the probability or impact

This produces a basic quantitative model that can be expanded as the organization gains experience.

The emphasis on clearly defined scenarios is important. Broad labels such as cloud risk, third-party risk, or reputation risk”are too vague to support useful analysis. A better statement would be:

> *During the next 12 months, a compromise of our payroll provider exposes employee information and interrupts payroll processing for more than three days.*

A specific scenario makes it easier to identify evidence, estimate consequences, and compare controls. It also satisfies the broader analytic principle found in ICD 203 that judgments should address the likelihood, timing, and nature of an outcome as clearly as possible.

## Representing uncertainty properly

The authors repeatedly warn against hiding uncertainty behind precise-looking numbers. An estimate such as the loss will be $3.7 million may suggest a level of knowledge that does not exist. A range is often more honest and useful.

Difficult estimates can also be broken into smaller components. Instead of guessing the total cost of a breach, an analyst can estimate separate categories such as:

- investigation and recovery costs
- business interruption
- legal and regulatory expenses
- customer notification and compensation
- lost revenue or customer attrition

Downtime losses might be estimated by combining the duration of the outage, the number of employees or transactions affected, and the cost per unit of time. This decomposition makes the model easier to understand and allows different assumptions to be tested.

For important decisions, the book recommends Monte Carlo simulation. This technique generates thousands of plausible scenarios and produces a distribution of possible losses rather than one average value.

That distinction matters because two risks can have the same average loss but very different profiles. One may create frequent small losses, while another carries a remote chance of catastrophe.

The authors favor loss-exceedance curves, which allow leaders to see statements such as:

> *There is a 10% chance of losing more than $6 million and a 1% chance of losing more than $25 million.*

This is much more useful for decision-making than a red square on a heat map.

The comparison with ICD 203 suggests that such quantitative outputs should be accompanied by a short explanation of the evidence, assumptions, information gaps, and alternatives behind them. A probability distribution should not stand alone. Decision-makers need to understand why the model produced its result and what new information could materially change it.

## Connecting measurement to investment decisions

The book’s purpose is not quantification for its own sake. Measurement should help organizations decide where to allocate limited resources.

A significant security investment should be evaluated by comparing:

- risk before the control
- risk after the control
- expected reduction in losses
- implementation and operating costs
- uncertainty about the control’s effectiveness
- remaining exposure to severe losses

This changes the nature of the discussion. Instead of arguing that a product is necessary because it is considered best practice, the security team must explain what specific risk it addresses and how much reduction it is expected to produce.

For example, if a control costs $200,000 annually and is expected to reduce annual losses by $800,000, the business case is clear. If the reduction is highly uncertain, that uncertainty should be shown rather than ignored.

The book does not suggest that expected financial value should be the only consideration. Legal obligations, safety consequences, strategic damage, and severe tail risks may require explicit limits. However, those considerations should be presented clearly rather than buried inside an unexplained score.

## Learning from new evidence

The chapters on Bayesian methods explain how initial estimates can improve over time. Start with the organization’s current informed belief, collect new evidence, and revise the estimate by an amount justified by that evidence.

A penetration test, phishing exercise, control failure, vendor outage, or real incident does not have to provide a final answer to be useful. Even a small amount of evidence can reduce uncertainty.

This supports a more dynamic approach to risk management. A cyber-risk assessment should not be a static document updated only for an annual compliance exercise. It should evolve as the organization learns more about threats, systems, controls, and business consequences.

## Measurement should continue after implementation

Another major strength is the book’s insistence that the decision process does not end when a security control is purchased. The original business case is only a forecast. The organization must later determine whether the investment is performing as expected.

Useful operational measures include:

- how often security events occur
- how long weaknesses remain undiscovered
- time to detect, contain, and recover
- vulnerability-remediation time
- the percentage of weaknesses escaping into production
- the recurrence rate of previously addressed problems

These measurements should feed back into the risk model. If a control reduces phishing success, shortens outages, or performs worse than the vendor promised, the estimated risk should change accordingly.

This is a practical and important point. Security programs often measure activity like alerts processed, patches installed, or tickets closed, without establishing whether those activities materially reduce business risk.

## Strengths of the book

The book’s greatest strength is its change in perspective. It treats cybersecurity as a decision problem rather than just a technical or compliance problem. Organizations have limited resources, uncertain threats, and competing investment options. They therefore need a way to compare choices on a common and meaningful basis.

The book is especially strong in several areas:

- It explains why useful measurement is possible without perfect data
- It exposes the weaknesses of risk matrices and ordinal scoring
- It shows how expert judgment can be improved rather than simply accepted or rejected
- It connects strategic risk estimates with operational control performance
- It offers a practical starting point instead of requiring an immediate enterprise-wide transformation

The authors also make an important methodological point that risk-assessment methods themselves should be tested. A framework should not be accepted simply because it is familiar, required by a standard, or supported by experienced professionals. It should demonstrate that it improves estimates and decisions.

## Limitations and cautions

The book is ambitious, and some sections are more technical than many executives will need. Readers unfamiliar with probability distributions, Bayesian updating, and simulation may need to work through the material slowly.

The authors also repeat their criticism of risk matrices frequently. Their argument is persuasive, but the repetition can make parts of the book feel more polemical than instructional.

There is also a practical danger in applying the book’s ideas poorly. Numbers do not automatically create rigor. A badly defined scenario, an unjustified probability, or an inappropriate statistical distribution does not become reliable simply because it appears in a spreadsheet.

The comparison with ICD 203 makes this limitation particularly important. Quantitative estimates are only one part of rigorous analysis. A model must also assess source quality, separate evidence from assumptions, consider plausible alternatives, acknowledge contrary information, and explain what would change the judgment. A model can be mathematically correct yet analytically weak if it relies on poor evidence or ignores competing explanations.

Organizations adopting these methods still need:

- transparent assumptions and credible sources
- sensitivity and alternative-scenario analysis
- independent review
- good model governance
- comparison of forecasts with actual outcomes

The objective is not to replace false confidence in colored categories with false confidence in decimal points. Nor should verbal expressions be rejected completely. In my consulting work I found that standardized terms, such as those used in ICD 203, can make analysis more accessible to nontechnical audiences. The strongest approach is often to combine plain language with numerical ranges and a clear explanation of the evidence.

## Practical implications

The best way to apply the book is not to quantify every cyber risk immediately. An organization should begin with a few decisions that matter, such as ransomware protection, multifactor authentication, privileged-access management, or dependence on a critical service provider.

For each case, the security team should define a specific scenario, estimate its annual probability and financial impact, compare control alternatives, and present both expected losses and severe-loss probabilities. Assumptions should be documented and updated as new evidence arrives.

Insights from Kent and ICD 203 suggest that each assessment should also answer several broader questions:

- Which statements are observations, and which are assumptions or judgments?
- How credible and complete are the underlying sources?
- What plausible alternative scenarios should be considered?
- What contrary evidence could weaken the main conclusion?
- Which indicators or new observations would change the estimate?
- Is the analysis communicating the judgment that the analyst actually intends?

Senior management and the board also need to define acceptable risk. Security teams cannot decide risk tolerance alone. Leaders should be asked concrete questions such as whether they would accept a 10% annual chance of losing more than $5 million or a 1% chance of losing more than $50 million.

The answers can then be compared with the organization’s current and residual risk.

## Overall assessment

*How to Measure Anything in Cybersecurity Risk* provides a compelling and practical direction for organizations that have become dissatisfied with heat maps but are unsure what should replace them.

Its greatest contribution is not a particular formula. It is the argument that cybersecurity should be managed through clearly defined scenarios, explicit uncertainty, evidence, and measurable decision outcomes. The authors demonstrate that useful quantitative analysis does not require perfect information, a large data-science team, or a mature actuarial model. It requires a willingness to state assumptions openly and improve them as evidence accumulates.

The book’s central recommendation can still be expressed plainly:

> *Stop asking whether a cyber risk is red, amber, or green. Ask what could happen, how likely it is, how much it could cost, what evidence supports the estimate, and which action provides the greatest reduction in risk for the resources spent.*

For CISOs, risk professionals, auditors, and senior leaders, this is a valuable challenge to conventional practice. The book is particularly useful for organizations seeking to move from compliance-driven reporting toward evidence-based cybersecurity decision-making.

[^1]: <https://www.amazon.com/How-Measure-Anything-Cybersecurity-Risk/dp/1119085292>

[^2]: <https://www.cia.gov/readingroom/docs/CIA-RDP93T01132R000100020036-3.pdf>

[^3]: <https://dn790009.ca.archive.org/0/items/6217544-ICD-203-Analytic-Standards/6217544-ICD-203-Analytic-Standards_text.pdf>

[^4]: <https://www.amazon.com/Noise-Human-Judgment-Daniel-Kahneman/dp/0316451401>
