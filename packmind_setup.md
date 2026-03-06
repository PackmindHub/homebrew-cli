# Changes required in PackmindHub/packmind

These are one-time setup steps to enable automatic Homebrew formula updates when a new CLI release is published.

## 1. Create a fine-grained PAT

- Go to https://github.com/settings/personal-access-tokens/new
- Token name: e.g. `homebrew-tap-dispatch`
- Resource owner: `PackmindHub`
- Repository access: select **Only select repositories** > `PackmindHub/homebrew-cli`
- Permissions: **Contents: Read and write**
- Generate the token and copy it

## 2. Add the PAT as a secret in PackmindHub/packmind

- Go to https://github.com/PackmindHub/packmind/settings/secrets/actions
- Click **New repository secret**
- Name: `HOMEBREW_TAP_PAT`
- Value: paste the PAT from step 1

## 3. Add a dispatch step to your CLI release workflow

In the file that publishes CLI releases (e.g. `.github/workflows/publish-cli-release.yml`), add the following step **at the end**, after all binaries have been uploaded:

```yaml
- name: Notify Homebrew tap
  if: success()
  run: |
    curl -X POST \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer ${{ secrets.HOMEBREW_TAP_PAT }}" \
      https://api.github.com/repos/PackmindHub/homebrew-cli/dispatches \
      -d '{"event_type":"packmind-cli-release","client_payload":{"version":"'"$VERSION"'"}}'
```

> **Important:** `$VERSION` must be the bare semver string (e.g. `0.21.0`), not a tag like `release-cli/0.21.0`. Adjust the variable name to match whatever your workflow already uses for the version.

## Verification

After completing the steps above, test with a manual dispatch:

```bash
gh workflow run bump-packmind-formula.yml -f version=0.20.0 -R PackmindHub/homebrew-cli
```

Then verify the formula was updated and the full install works:

```bash
brew tap PackmindHub/cli
brew install packmind-cli
packmind-cli --version
```
