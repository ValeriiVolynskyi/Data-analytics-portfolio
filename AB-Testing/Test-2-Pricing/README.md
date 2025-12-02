
---

### Test 2 (Pricing Tier $9.99)

```markdown
# A/B Test #2 — Introducing a $9.99 Pricing Tier
**Product:** Online education subscription platform  
**Focus:** Effect of a new lower-priced tier ($9.99/month for a single direction) on conversion and revenue

---

## Goal
Assess whether introducing a lower-priced subscription tier increases **first-purchase conversion (CVR)** and **ARPU** among new users, while monitoring cannibalization of the premium $29.99 tier.

Business goal: grow paying user base and revenue without materially damaging the premium tier economics.

---

## Technics Used
- Metric definitions:
  - **Primary:** `CVR = purchases / users` (first-purchase conversion)
  - **Secondary:** `ARPU`, `ARPPU`, revenue decomposition, cannibalization share
- Sample size calculation (Evan Miller calculator)
- Two-proportion Z-test for statistical significance
- Revenue & unit-economics computation
- Cannibalization and share analysis
- Experiment design: 50/50 split, new users only, traffic parity by channel

---

## Baseline & Sample Size
- Baseline CVR: **3.7%**
- MDE: **+10% relative** → absolute MDE = **0.37 percentage points** (3.7% → 4.07%)
- α = 0.05; Power = 0.80

**Sample size (Evan Miller)** → **≈ 41,500 users per group**  
- Total ≈ 83,000 users

Traffic & duration:
- New users per day: **3,000**
- Per-group per day: **1,500**
- Required duration ≈ **28 days**

Reference sample-size calculator: screenshot

---

## Results (experiment data)
**Traffic in the experiment (observed sample):**  
- Control users (A): **13,623**  
- Treatment users (B): **14,012**

**Purchases**
- Control: 411 purchases (only $29.99)
- Treatment: 652 total purchases = 420 at $29.99 + 232 at $9.99

**Conversions**
- Control CVR: `411 / 13,623 = 3.01%`
- Treatment CVR (29.99 only): `420 / 14,012 = 3.00%` (unchanged)
- Treatment CVR (total): `(420 + 232) / 14,012 = 652 / 14,012 = 4.65%`
- Uplift: `(4.65% - 3.01%) / 3.01% ≈ +54%` (large uplift)

**Revenue**
- Control revenue: `411 × 29.99 = $12,333.89`
- Treatment revenue: `420 × 29.99 + 232 × 9.99 = $14,913.48`
- Revenue uplift ≈ **+20.9%**

**ARPU**
- Control ARPU: `12,333.89 / 13,623 = $0.90`
- Treatment ARPU: `14,913.48 / 14,012 = $1.06`
- ARPU uplift ≈ **+17.7%**

**ARPPU (per-paying-user averages)**
- $29.99 ARPPU:
  - Control: $64.48
  - Treatment: $62.68 (small decrease)
- $9.99 ARPPU (Treatment): $27.27

**Cannibalization / share (Treatment)**
- $29.99 share: `420 / 652 = 64.4%`
- $9.99 share: `232 / 652 = 35.6%`
- Conclusion: **new tier attracted additional buyers** rather than fully cannibalizing premium purchases.

**Statistical test (two-proportion Z-test)**
- successes = [411, 652], totals = [13,623, 14,012]
- Z-stat ≈ **-7.07**, p-value ≈ **1.54 × 10⁻¹²**
- Conclusion: **statistically significant** improvement (p ≪ 0.05)

---

## Final Result (summary)
- Total CVR rose from **3.01%** → **4.65%** (+54%), statistically significant.  
- ARPU increased by **~17.7%**.  
- Total revenue increased by **~20.9%**.  
- Cannibalization exists but is moderate; the premium tier retention is stable.  
- **Business conclusion:** test is **successful**. Recommendation — **launch the $9.99 tier**.

---

## Interpretation & Recommendations
- The lower-priced tier effectively reduced the barrier to entry, converting a previously non-paying segment into buyers and increasing revenue per new user.
- Monitor the longer-term retention and lifetime value of $9.99 customers to validate durability of the uplift.
- Suggested follow-ups:
  1. Cohort LTV analysis for $9.99 vs $29.99 buyers (30/90/180-day retention & revenue)
  2. Price elasticity experiments (e.g., $7.99, $12.99) to find optimal price points
  3. Monitor mix and possible long-term cannibalization trends; adjust marketing to target non-overlapping segments
  4. Consider bundling or upgrade flows to migrate single-direction buyers to full access

---

## Placeholders for visual assets
Add screenshots to repository path: `AB-Testing/Test-2-Pricing/assets/`

Suggested filenames:
- `test2_tariff_breakdown.png` — tariff breakdown viz
- `test2_metrics_table.png` — table with CVR/ARPU/revenue
- `test2_stat_test.png` — statistical test output screenshot

Markdown embedding:
```md
![Tariff Breakdown](./assets/test2_tariff_breakdown.png)
![Metrics Table](./assets/test2_metrics_table.png)
![Statistical Test](./assets/test2_stat_test.png)

