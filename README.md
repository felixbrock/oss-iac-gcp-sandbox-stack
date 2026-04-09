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

## Demo: simulating a destructive change

The bucket is gated on `var.enable_bucket` (default `true`). To simulate a
destroy in Scene 7 of the demo without breaking the OpenTofu config, flip the
default in `variables.tf` to `false`, commit, and push:

```bash
sed -i 's/default     = true$/default     = false/' variables.tf
git commit -am "simulate destroy: disable sandbox bucket"
git push origin main
```

The next plan emits a `delete` action for `google_storage_bucket.sandbox[0]`,
which the platform-space deny policy should block. To restore, flip the
default back to `true` (or `git revert HEAD`) and push.

