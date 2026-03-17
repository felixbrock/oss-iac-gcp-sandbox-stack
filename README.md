# oss-iac GCP Sandbox Stack

Minimal OpenTofu/Terraform stack for testing `oss-iac` against GCP.

What it creates:

- one GCS bucket with a random suffix

Defaults:

- project: `oss-iac`
- region: `europe-west3`

Local usage:

```bash
tofu init
tofu plan
tofu apply
```

The stack is intentionally cheap and safe for first-pass end-to-end testing of:

- cloud integration attachment
- GCP credential injection
- provider authentication
- run trigger and execution

