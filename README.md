# PackmindHub/homebrew-cli

Homebrew tap for [Packmind CLI](https://github.com/PackmindHub/packmind).

## Installation

```bash
brew tap PackmindHub/cli
brew install packmind-cli
```

## Update

```bash
brew upgrade packmind-cli
```

## Supported platforms

| Platform     | Architecture |
|--------------|-------------|
| macOS        | arm64       |
| Linux        | arm64       |
| Linux        | x64         |

> **Linux prerequisite:** Homebrew requires a compiler to be present, even though the formula installs a pre-built binary. Run `brew install gcc` before installing if you don't have one (e.g. in Docker containers).

## Automated updates

This tap is automatically updated via GitHub Actions whenever a new CLI release is published.

### How it works

1. A new CLI release is published in `PackmindHub/packmind` (tag `release-cli/X.Y.Z`)
2. The release workflow sends a `repository_dispatch` event to this repo
3. The [`bump-packmind-formula`](.github/workflows/bump-packmind-formula.yml) workflow runs automatically:
   - Downloads all 3 platform binaries for the new version
   - Computes fresh SHA-256 checksums
   - Updates the version and checksums in `Formula/packmind-cli.rb`
   - Commits the change to `main`
4. Users get the new version on their next `brew upgrade packmind-cli`

### Setup required in PackmindHub/packmind

See [packmind_setup.md](packmind_setup.md) for the one-time setup steps needed in the `PackmindHub/packmind` repository.

### Manual trigger (fallback)

If the automatic dispatch fails, you can trigger the bump manually:

```bash
gh workflow run bump-packmind-formula.yml -f version=0.21.0 -R PackmindHub/homebrew-cli
```
