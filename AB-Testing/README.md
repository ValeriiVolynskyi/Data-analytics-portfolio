# A/B Testing Portfolio

This section of the portfolio includes two complete A/B testing case studies conducted using real-world product analytics methodology.  
Each case covers problem framing, hypotheses, metric selection, sample size calculation, statistical analysis, and final business recommendations.

The goal of this directory is to demonstrate practical skills in designing, running, and interpreting A/B tests using a structured, data-driven approach.


### **1. Test #1 — Onboarding Before Paywall (Mobile App)**
**Goal:**  
Evaluate whether adding onboarding screens before the paywall increases the overall conversion to first purchase among new app users.

**Techniques Used:**  
- Hypothesis formulation (H0/H1)  
- Metric design (CR_total, CR_to_paywall, CR_purchase, ARPU)  
- Evan Miller sample size calculation  
- Z-test / Chi-square statistical testing  
- Cohort split design (new users only, 50/50 randomization)

**Key Result:**  
The test showed **no statistically significant improvement** in total purchase conversion.  
ARPU did not increase, and onboarding reduced the number of users reaching the paywall.  
Final recommendation — **do not roll out the new onboarding**.

👉 **Open full case study:**  
`/AB-Testing/Test-1-Onboarding/README.md`  

### **2. Test #2 — Introducing a Cheaper $9.99 Subscription Tier**
**Goal:**  
Evaluate whether adding a lower-priced $9.99 subscription increases the conversion rate and ARPU compared to the existing $29.99 plan.

**Techniques Used:**  
- Hypothesis formulation  
- Metric design (CVR, ARPU, ARPPU, cannibalization analysis)  
- Evan Miller sample size calculation  
- Z-test for proportions  
- Revenue decomposition (per tariff)

**Key Result:**  
New pricing tier resulted in:  
- +54% increase in total CVR  
- +17.7% increase in ARPU  
- +20.9% increase in revenue  
- No negative impact on the $29.99 plan  

Final decision — **roll out the new pricing model**.

👉 **Open full case study:**  
`/AB-Testing/Test-2-Pricing/README.md`
