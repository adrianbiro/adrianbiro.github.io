+++
title = 'Book Review: A hard look at why so many IT transformations fail (and what to do about it)'
summary = '''Cut IT program failure: executive alignment, decisive governance, realistic plans, and day-two operating readiness.'''
date = 2026-05-03T00:00:00-00:00
draft = false
tags = ['Technology', 'EnterpriseArchitecture', 'DigitalTransformation', 'CxOAgenda', 'ROI', 'Procurement', 'CloudStrategy', 'AI']
+++

{{< figure src="/posts/_images_files/art_deco/retro‑futuristic_art_deco_concept_city_sepia.png" title="Art Deco" alt="Art Deco" width="auto" >}}

>_A review of Eric Kimberling’s latest book Welcome to the Machine: The Systemic Failures of Digital Transformation[^1], through the lens of real-world delivery experience_

There are business books that try to inspire, and there are business books that try to explain. Eric Kimberling’s new book sits firmly in the second category. It does not sugarcoat. It describes the technology implementation industry as a system that often produces predictable failure, not because people are incompetent, but because incentives are misaligned from the start.

What stood out most was how closely his perspective mirrors what I’ve observed across the industry. Even though much of his experience is rooted in ERP programs, the patterns he describes are not ERP-specific. They show up in cloud migrations, data platform modernizations, security transformations, CRM rollouts, identity programs, and yes, now AI initiatives. In other words, these are IT project dynamics in general.

Below is my take on the book’s core argument, why it resonates, and how to apply the insights in practice.

## The machine metaphor is uncomfortable, but accurate

Kimberling’s central claim is that the technology implementation market often behaves like a machine that is optimized for vendor revenue and ecosystem throughput, not for customer outcomes. That is a strong statement, but it is also a useful one because it forces you to stop treating project failure as a surprising exception.

When 55 to 75 percent of implementations fail (however you define “fail”), the rational assumption should be that failure modes are systemic, repeatable, and preventable. Kimberling’s machine metaphor gives a concrete way to examine those failure modes without turning the discussion into blame games.

## The three gears that drive failure

### I. Clients as the fuel

Clients supply budget, urgency, requirements, and political momentum. But Kimberling points out several patterns that consistently create risk before the first design workshop even starts:

- **No clear strategic purpose** Projects begin because leadership wants “new technology,” wants to “modernize,” or wants to “use AI,” without a measurable business goal. That produces a program that cannot prioritize, cannot make trade-offs, and cannot say no.

- **A leadership vacuum**  Executive misalignment is one of the fastest ways to doom a transformation. If leaders are not aligned on outcomes, constraints, and what must change in the operating model, the project becomes a negotiation arena rather than an execution engine.

- **Digitizing inefficiency**  Automating bad processes makes them faster, not better. This is a universal anti-pattern. It shows up in ticketing tool replacements, IAM redesigns, and security automation just as much as in ERP.

- **Change adoption is treated as secondary**  Resistance is treated as a nuisance instead of a design input. Teams focus on configuration and architecture, while adoption, incentives, training, and change impact are left for later.

- **The day two problem**  Go-live is celebrated as success even when it is merely deployment. Real success is stable operations, adoption, measurable business impact, and continuous improvement. That is day two, not day one.

In my experience, this is not theoretical. Better technology rarely fixes a struggling program. Clear purpose, strong governance, and early focus on process and adoption do.

### II. Technology vendors as the engine

Kimberling argues that modern software economics often conflict with customer interests. His critique is not that vendors are bad, but that the structure of the market pushes predictable behavior:

- **Recurring revenue incentives**  Subscription economics reward retention and expansion. That can be good when it aligns with customer value, but it can also create a bias toward selling more modules, more capacity, and longer commitments, even when a simpler approach would work.

- **Lock-in by design, especially in cloud models**  Switching becomes expensive through data gravity, proprietary integrations, and operational dependency. The result is reduced leverage for customers after initial contract signature.

- **Oversold capabilities and underestimated effort**  Sales narratives often highlight feature breadth while minimizing implementation complexity, organizational change, and data quality realities.

- **Data migration treated as an afterthought** In practice, data is where timelines go to die. Under-scoping data migration, cleansing, and ownership is one of the most reliable ways to create cost overruns.

- **Generic vanilla implementations**  Standardization is good when it reduces complexity, but it becomes harmful when it erases differentiators. Many organizations do not realize they are trading away competitive advantage until late in the program.

This applies far beyond ERP. Cloud platforms, security suites, and AI toolchains can all create similar dynamics. The default path is often optimized for adoption at scale, not for the specifics of your operating model. If you do not actively defend your requirements, you will end up implementing the vendor’s worldview.

### III. Integrators and consultants as the operators

The third gear is the delivery ecosystem. Kimberling challenges the assumption that external experts are always neutral guides. Again, the point is not to demonize consulting, but to highlight predictable incentive traps:

- **Overruns can be profitable**  Time and materials models can reward extended timelines and larger teams. Even in fixed-price arrangements, scope change mechanisms can recreate the same effect.

- **Partner economics compromise independence**  If advisory firms receive commissions, referral fees, or structured benefits from vendors, “independent” advice can quietly become vendor-aligned advice.

- **The 18-month lie**  Unrealistic timelines are proposed to win deals, even when experienced delivery teams know the true duration will be longer.

- **Knowledge hostage**  Skills transfer is delayed or underfunded, leaving the client dependent on external resources for years.

- **Analyst validation is not always neutral**  Third-party rankings can create a false sense of objectivity, especially when the ecosystem is financially intertwined.

The skill transfer point is one of the most important and most ignored. If the client cannot run the solution without the integrator, the transformation is incomplete. Sustainable operations should be treated as a core deliverable, not a nice-to-have.

## Why these insights apply to IT projects in general, not just ERP

It is tempting to treat ERP as a special case because it touches finance, procurement, HR, and core operations. But the same systemic forces exist in other transformations:

- **Cloud migrations** often start as lift and shift without a clear operating model change, then stall when costs rise and accountability is unclear.
- **Security transformations** fail when tooling is purchased without process redesign, staffing plans, and measurable risk outcomes.
- **Data platform programs** derail when ownership, quality, and governance are not solved early, and data migration becomes data discovery.
- **AI initiatives** amplify the same problems because the hype cycle encourages speed over purpose, and prototypes are mistaken for production readiness.

The common thread is not the technology category. It is incentive misalignment, weak governance, and underinvestment in change and data. Kimberling’s machine describes those patterns well.

## Practical ways to fight the machine to improve your odds

Kimberling’s recommendations can be summarized as: customers must lead, not follow. Here is how I would translate that into concrete actions for any major IT program.

**Treat the program like a capital investment, not an IT upgrade.** Run the same level of scrutiny you would apply to an acquisition or building a factory.

- Define measurable business outcomes and acceptable trade-offs.
- Establish clear decision rights and escalation paths.
- Require transparent cost models, including day two operations.

**Align executives before selecting software.** If leadership cannot agree on purpose and scope, vendor selection will only harden disagreements.

- One page on “why now,” “what changes,” and “what we will not do.”
- A small set of success metrics that cannot be gamed.
- Named accountable owners for process, data, security, and adoption.

**Do not outsource accountability.** External partners can help, but they cannot own your transformation.

- Keep architecture authority and key design decisions on the client side.
- Make skill transfer a contractual deliverable with acceptance criteria.
- Build an internal “day two” team early, not after go-live.

**Make data a first-class workstream.** If data is not resourced and governed, everything else becomes theater.

- Data owners, quality targets, and migration rehearsals.
- Explicit budget and timeline for cleansing and cutover.
- A plan for integration and master data, not just “move it.”

**Challenge incentives and demand transparency.** Assume misalignment exists until proven otherwise.

- Ask who benefits financially from vendor selection.
- Require realistic delivery plans with evidence from comparable projects.
- Use stage gates that allow you to stop or re-scope without political collapse.

## The book’s value is that it gives you a vocabulary for reality

The biggest benefit of this book is not a single framework. It is that it gives leaders and delivery teams a shared language to discuss what is usually discussed only privately: misaligned incentives, uncomfortable truths, and the difference between go-live and success.

If you lead transformations, the book will feel less like new ideas and more like someone finally describing the patterns you have already sensed but perhaps did not formalize. That alignment is exactly why I recommend it. It supports a more mature posture skeptical, outcome-driven, and disciplined.

And if there is one takeaway I would emphasize, it is this:

>_Technology projects rarely fail because teams cannot configure software. They fail because organizations do not govern change with enough clarity, courage, and accountability._

[^1]: <https://www.amazon.com/dp/B0GX32ZBX6>
