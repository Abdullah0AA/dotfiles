# sops reads my age key from pass. See the deployment repo README.
set -gx SOPS_AGE_KEY_CMD "pass show infra/sops-age-key"
