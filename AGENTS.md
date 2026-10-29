# Data Insight Solutions website — instructions for coding agents

`CLAUDE.md` is a symlink to this file, so Claude Code, the Reckons.AI local deputy and any
`AGENTS.md`-reading agent load the same rules.

This is the public website of Data Insight Solutions, built and managed with
[Reckons.AI](https://reckons.ai). It is an **end-user site**: it contains no Reckons.AI source code.
The Reckons.AI app, its MCP server and its local agents work on this folder from outside, and the
site engine arrives as a package. A feature this site needs is built in Reckons.AI, not patched here.

## Public and private

- **This repository is public.** Everything committed, including history, is published.
- **`workspace/` is private and git-ignored**: the Reckons.AI spaces (`workspace/kbs/<space>/<space>.ttl`),
  ingested sources and the review queue. Never commit it, never `git add -f`, never paste its text into
  a committed file. Text reaches the public only by publishing an approved page into `content/`.
- **The public site space** (`workspace/kbs/dis-site/`) holds only what may be public. Business notes,
  clients and drafts go in other spaces: publishing a space can expose every fact in it.
- `scripts/guard-public.sh` refuses `workspace/`, `.ttl` and review-queue files, as a pre-commit hook
  (enable once per clone: `git config core.hooksPath .githooks`) and in CI. Never bypass it.

## How agents work here

- **Setup, once per machine:** `.mcp.json` starts the Reckons.AI MCP server from a local Reckons.AI
  checkout named by `RECKONS_HOME` (for example `export RECKONS_HOME="$HOME/Github/tripleNotes"` in
  `~/.profile`), serving only `./workspace`. The local deputy sets it for itself. The FIRST time the
  deputy runs here, start it interactively and accept Claude Code's trust prompt for this folder;
  until a person has trusted it, `.mcp.json` is not loaded and the `reckons` tools are absent.

- **Spaces: propose, never edit.** `workspace/` is not in git, so a direct edit cannot be reviewed or
  undone. Use the `reckons` MCP tools: `kb_add_note` puts a proposal in the review queue for the owner.
- **Pages:** draft with `kb_generate_page` (local model, proposal only) or `kb_entity_markdown` (no
  model, straight from the facts). A page is public only after the owner approves and publishes it.
- **Files in this repository:** on a branch, never on `main`. The owner merges.
- **The local deputy** runs here with `npm run local:claude -- --repo=<this folder>` from a Reckons.AI
  checkout. It cannot push or merge.

## Layout (grows as Reckons.AI F274 lands)

| Path | What | Public |
|---|---|---|
| `content/` | page markdown: published output, edited in Sveltia CMS | yes |
| `assets/` | images | yes |
| `admin/` | Sveltia CMS | yes |
| `workspace/` | spaces, sources, review queue | **no** (ignored) |

## License

Code: MIT (`LICENSE`). Text and images in `content/` and `assets/`: © Data Insight Solutions, all
rights reserved (`CONTENT-LICENSE`).
