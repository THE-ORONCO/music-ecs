# Journey Through the Feywild

A Godot 4 game.

## CI/CD Pipeline

The workflow (`.github/workflows/ci-cd.yml`) runs on pushes to `main`/`release`, version tags (`v*`), and PRs to `main`.
When pushing new tags the build result is pushed to itch.io.

| Stage                 | Description                                                                                                                                                                                      |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Unit tests**        | Runs GdUnit4 unit tests (`test/unit/`). The `.godot/` import cache is persisted to speed up subsequent runs. Test reports are uploaded as artifacts.                                             |
| **Integration tests** | Runs GdUnit4 integration tests (`test/integration/`). Depends on unit tests passing first. Reports are uploaded as artifacts.                                                                    |
| **Build – Windows**   | Exports the game for Windows in debug and release configurations via `firebelley/godot-export`. Artifacts are uploaded.                                                                          |
| **Build – Linux**     | Same process for Linux. (macOS and Web builds are present but disabled.)                                                                                                                         |
| **Deploy – itch.io**  | Only on version tags. Downloads the Windows and Linux release artifacts, installs itch.io's `butler` CLI, and pushes both builds to the itch.io project page using the `ITCH_IO_API_KEY` secret. |

### Actions used

| Action | Purpose |
|---|---|
| [`actions/checkout`](https://github.com/actions/checkout) | Checks out the repository so the runner has access to the source code. |
| [`chickensoft-games/setup-godot`](https://github.com/chickensoft-games/setup-godot) | Downloads and installs the Godot engine on the runner. |
| [`actions/cache`](https://github.com/actions/cache) | Caches the `.godot/` import directory to speed up repeated runs. |
| [`actions/upload-artifact`](https://github.com/actions/upload-artifact) | Stores build outputs and test reports for later download. |
| [`actions/download-artifact`](https://github.com/actions/download-artifact) | Downloads previously uploaded artifacts (used in the deploy job). |
| [`firebelley/godot-export`](https://github.com/firebelley/godot-export) | Exports the Godot project to a target platform using export presets. |
