<div align="center">

# 🛡️ Multi-Cloud Compliance & OPA Policy Engine

[![Open Policy Agent](https://img.shields.io/badge/OPA-Rego-7D9C7C?style=for-the-badge&logo=openpolicyagent&logoColor=white)](https://www.openpolicyagent.org/)
[![Conftest](https://img.shields.io/badge/Conftest-IaC_Compliance-2088FF?style=for-the-badge&logo=conftest&logoColor=white)](https://www.conftest.dev/)
[![CIS Benchmarks](https://img.shields.io/badge/Compliance-CIS_Benchmark_SOC2-success?style=for-the-badge&logo=shield&logoColor=white)](https://www.cisecurity.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](./LICENSE)

<p align="center">
  <b>Production Policy-as-Code (PaC) enforcement suite built with Open Policy Agent (OPA) and Rego to automate CIS Benchmarks and SOC2 compliance validation across Terraform plans and Kubernetes manifests.</b>
</p>

</div>

---

## 🏛️ Guardrail Architecture

```
Git Push (Terraform plan.json / K8s manifest)
                     │
                     ▼
       ┌───────────────────────────┐
       │ OPA / Conftest Engine     │
       └─────────────┬─────────────┘
                     │ Evaluates Rego Policies
       ┌─────────────┴─────────────┐
       ▼                           ▼
[ Terraform Guardrails ]    [ Kubernetes Guardrails ]
 - Mandatory Governance      - Deny Privileged Containers
 - TLS 1.2+ & HTTPS Only     - Enforce CPU/Memory Limits
 - Disk / Blob Encryption    - Enforce ReadOnly RootFS
                     │
                     ▼
  (Pass -> Deploy) OR (Violation -> Pipeline Break + Audit Log)
```

---

## 📁 Repository Layout

```
multi-cloud-compliance-opa-policy/
├── .github/workflows/
│   └── policy-ci.yml             # OPA unit tests in GitHub Actions
├── policies/
│   ├── terraform/                # Cloud IaC guardrails (Azure/AWS)
│   │   ├── azure_tags.rego       # Mandatory FinOps tag enforcement
│   │   └── storage_encryption.rego# TLS 1.2 & HTTPS encryption enforcement
│   └── kubernetes/               # Container & Pod runtime guardrails
│       └── pod_security.rego     # Privileged container & memory limit check
├── tests/                        # Comprehensive Rego unit test cases
│   └── azure_tags_test.rego
└── README.md
```

---

## ⚡ Testing & Execution

```bash
# Run unit tests across all Rego policies
opa test policies/ tests/ -v

# Run Conftest against a Terraform JSON plan
conftest test tfplan.json -p policies/terraform/
```

---

## 👤 Author

**Vishwjeet Kumar Mehta**  
Senior DevOps & DevSecOps Consultant | Cloud & Infrastructure Architect  
- **LinkedIn**: [linkedin.com/in/vishwjeetmehta](https://linkedin.com/in/vishwjeetmehta)  
- **GitHub**: [@vishwjeetmehta-bot](https://github.com/vishwjeetmehta-bot)
