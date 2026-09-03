+++
title = 'Notes on a Realistic Enterprise Data Readiness Timeline for AI'
summary = '''Realistic timelines and actionable steps for enterprise data readiness, from focused AI use cases to organization-wide scale.'''
date = 2026-09-03T08:00:00-00:00
draft = false
tags = ['CxOAgenda', 'Technology', 'CyberSecurity', 'AI', 'ROI', 'DigitalTransformation', 'EnterpriseArchitecture', 'Data']
+++

{{< figure src="/posts/_images_files/coat_of_arms/coat_of_arms_owl_bees_roses.jpeg" title="Coat of Arms" alt="Coat of Arms" width="auto" >}}

Enterprise data readiness is not a one-time cleanup project. It is the ability to provide data that is accurate, timely, understandable, permitted, secure, and reliable enough for a defined business use.

A large enterprise may need **18 to 36 months or longer** to build reusable capabilities across multiple domains. A bounded AI use case can often reach sufficient readiness within **3 to 9 months**.

The enterprise does not become AI-ready all at once. Specific data, decisions, and workflows become ready to a defined level.

## Indicative timeline

These activities overlap. They should not be treated as sequential project phases.

| Activity | Indicative timing | Expected outcome |
| --- | ---: | --- |
| Use-case framing | Months 0 to 2 | Defined decision, baseline, required data, sponsor, and expected outcome |
| Data viability assessment | Months 1 to 4 | Confirmed access, quality profile, ownership, constraints, and material gaps |
| Minimum governed data product | Months 2 to 8 | Authoritative sources, definitions, pipeline, quality rules, access, lineage, and monitoring |
| Pilot and workflow evaluation | Months 4 to 10 | Measured technical and business performance using representative data |
| Production hardening | Months 7 to 15 | Security, privacy, resilience, support, cost control, and evidence |
| Domain scaling | Months 12 to 24 | Reusable data products and additional production use cases |
| Enterprise capability | Months 18 to 36+ | Cross-domain governance, master data, legacy remediation, and operating model |

## Start with a business decision

Do not begin with a general objective to become AI-ready.

Define:

- the decision or workflow to improve
- the current performance baseline
- the expected business outcome
- the users and affected parties
- the data required
- the action that will follow the output
- the accountable sponsor

“Improve customer service with AI” is too broad. “Recommend relevant knowledge articles to support agents and reduce handling time without lowering resolution quality” is testable.

## Assess data viability early

Before committing to the use case, confirm:

- whether the required data exists
- whether it can be accessed and used for the intended purpose
- which sources are authoritative
- whether historical data represents current operations
- which quality problems could materially affect the result
- whether sensitive data can be reduced
- who owns the data and its definitions

The first output should be a viability assessment, not an enterprise-wide catalog.

Not every defect must be fixed. Readiness should be evaluated against the intended use. A missing field that does not affect the decision may be acceptable. A small error rate in a safety or financial attribute may not be.

## Build a minimum governed data product

Create a supported data product for the bounded use case. It should include:

- authoritative sources
- governed definitions
- common identifiers
- an accountable owner
- quality expectations
- access conditions
- retention requirements
- sufficient lineage
- operational monitoring

Do not confuse centralization with a single source of truth. CRM, ERP, identity, and master-data systems may each be authoritative for different attributes.

Centralizing conflicting data does not resolve disagreement. It creates one location containing several versions of the truth.

## Correct the source of defects

Historical data may need correction, deduplication, mapping, enrichment, or migration. This is only part of the work.

Identify why the defects occur. Typical causes include weak validation, inconsistent business processes, conflicting identifiers, unclear ownership, legacy integration, and acquisition history.

Combine historical remediation with preventive controls such as:

- validation at entry
- data contracts
- source reconciliation
- exception handling
- quality monitoring
- accountable correction processes

Cleaning downstream data without correcting the source creates permanent remediation work.

## Develop the pilot in parallel

Do not wait until every data problem is resolved before testing the use case.

Run data engineering, model evaluation, workflow design, security, and governance in parallel. A narrow pilot often reveals problems that cataloging cannot find, including inconsistent fields, unrepresentative history, late-arriving data, and workflows unable to act on recommendations.

Data preparation is often the largest and least predictable part of an AI initiative. The repeated observation that every project spends around 80 percent of its time cleaning data should not be used as only planning assumption.

Measure how much effort is spent rebuilding the same mappings, extracts, identity matching, and corrections. Repeated manual preparation shows that reusable data capabilities have not been established.

## Evaluate the whole workflow

Model accuracy alone does not demonstrate business readiness.

Test whether:

- representative data is available at the required time
- the model improves an agreed baseline
- users understand and trust the output appropriately
- the result can be integrated into the workflow
- the organization can act safely on the recommendation
- latency and cost are acceptable
- security and privacy requirements are satisfied
- failures and uncertain outputs are handled safely

Include data, infrastructure, model, support, oversight, and change-management costs when measuring value.

A pilot should also be allowed to show that the use case is not viable. Avoiding an expensive production failure is a useful result.

## Harden the complete process

Production readiness requires more than a successful demonstration.

Add:

- stable and recoverable pipelines
- data and model versioning
- identity and access controls
- quality, drift, and outcome monitoring
- incident and exception handling
- fallback behavior
- human oversight for consequential actions
- operational ownership
- cost controls
- evidence and auditability

A pipeline can complete successfully while producing incomplete, duplicated, stale, or incorrectly transformed data. Monitor the business result, not only job completion.

## Scale through reuse

Scale into adjacent use cases that can reuse the same data products, definitions, quality controls, and access patterns.

Do not call ten unrelated pilots enterprise scaling. If each pilot creates separate pipelines and definitions, the organization is scaling technical debt rather than capability.

Over time, data remediation should become part of normal operations. Business owners and source-system teams must share responsibility with data and platform teams for preventing deterioration.

## Measure readiness with evidence

For each use case, demonstrate that:

- required data is known and accessible
- authoritative sources and definitions are established
- material quality conditions are measured
- use is permitted and access is controlled
- lineage is sufficient for the risk
- owners are accountable
- data and model performance are monitored
- failures are visible
- the workflow can act safely on the result

Moving data to cloud storage does not make it AI-ready. Readiness depends on fitness for use, not platform location.

## Planning ranges

Use these ranges as starting assumptions, not commitments:

- **3 to 9 months** for a bounded use case with accessible data and clear ownership
- **12 to 24 months** for reusable capabilities across a priority domain
- **18 to 36 months or longer** for broader enterprise transformation
- **Ongoing** for quality, ownership, controls, and fitness for use

---

Start with a valuable decision, not an enterprise-wide cleanup. Establish a minimum governed data product, test it through a real workflow, correct defects at their source, and scale through reuse.
The objective is not to make all enterprise data AI-ready, this is usually to costly, and unrealistic. Objective is to make priority data reliably fit for specific decisions while building capabilities that can be reused.
