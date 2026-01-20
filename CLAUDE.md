# Claude Code Ultimate Guide - Project Context

## Purpose

This repository is the **comprehensive documentation for Claude Code** (Anthropic's CLI tool). It teaches users how to use Claude Code effectively through guides, examples, and templates.

**Meta-note**: This repo documents Claude Code, so its own configuration should be exemplary.

## Repository Structure

```
guide/                    # Core documentation
├── ultimate-guide.md     # Main guide (~9900 lines, the reference)
├── cheatsheet.md         # 1-page printable summary
├── architecture.md       # How Claude Code works internally
├── methodologies.md      # TDD, SDD, BDD workflows
├── data-privacy.md       # What data is sent to Anthropic
├── security-hardening.md # Security best practices
└── workflows/            # Step-by-step workflow guides

examples/                 # Production-ready templates
├── agents/               # Custom agent templates
├── commands/             # Slash command templates
├── hooks/                # Event hook examples (bash/powershell)
├── skills/               # Skill module templates
└── scripts/              # Utility scripts (audit, health check)

machine-readable/         # For LLM consumption
├── reference.yaml        # Condensed index (~2K tokens)
└── llms.txt              # AI indexation file

tools/                    # Interactive utilities
├── audit-prompt.md       # Setup audit prompt
└── onboarding-prompt.md  # Personalized learning prompt
```

## Key Files

| File | Purpose |
|------|---------|
| `VERSION` | Single source of truth for version (currently 3.8.2) |
| `guide/ultimate-guide.md` | The main reference (search here first) |
| `guide/cheatsheet.md` | Quick reference for daily use |
| `machine-readable/reference.yaml` | LLM-optimized index with line numbers |
| `CHANGELOG.md` | All changes with detailed descriptions |

## Commands

### Version Management
```bash
# Check version consistency across all docs
./scripts/sync-version.sh --check

# Fix version mismatches (updates from VERSION file)
./scripts/sync-version.sh

# Bump version
echo "3.7.0" > VERSION && ./scripts/sync-version.sh
```

### Before Committing
```bash
# Verify versions are synchronized
./scripts/sync-version.sh --check
```

## Conventions

### Documentation Style
- **Accuracy over marketing**: No invented percentages or unverified claims
- **Practical examples**: Every concept has a concrete example
- **Source attribution**: Credit community contributions with links
- **Version alignment**: All version numbers must match `VERSION` file

### File Organization
- New guides → `guide/`
- New templates → `examples/{agents,commands,hooks,skills}/`
- Navigation updates → Update both `README.md` and `guide/README.md`

### Versioning
- `VERSION` file is the single source of truth
- Run `./scripts/sync-version.sh` after changing version
- Files that contain version: README.md, cheatsheet.md, ultimate-guide.md, reference.yaml

## Current Focus

Check `IDEAS.md` for planned improvements and `CHANGELOG.md [Unreleased]` for work in progress.

## Model Configuration

**Recommended mode**: `/model opusplan`

**Rationale**: This documentation repository benefits from hybrid intelligence:
- **Planning phase** (Opus + thinking): Architecture decisions, research synthesis, multi-file analysis
- **Execution phase** (Sonnet): Doc updates, version syncing, template edits, formatting

**OpusPlan workflow**:
1. `/model opusplan` → Set hybrid mode
2. `/plan` or `Shift+Tab × 2` → Plan with Opus (thinking enabled)
3. `Shift+Tab` → Execute with Sonnet (faster, cheaper)

**Typical task breakdown**:
| Task Type | Model | Justification |
|-----------|-------|---------------|
| Doc edits, typo fixes | Sonnet | Straightforward, no deep reasoning |
| Version sync, formatting | Sonnet | Mechanical pattern matching |
| Guide restructuring | Opus (plan) → Sonnet (execute) | Needs architecture thinking first |
| Research synthesis | Opus (plan) → Sonnet (write) | Complex analysis, then clear writing |
| Multi-file consistency checks | Opus (plan) → Sonnet (fix) | Dependency analysis, then edits |

**Cost optimization**: OpusPlan pays Opus only for planning (typically 10-20% of tokens), Sonnet handles 80-90% of execution work.

## Landing Site Synchronization

**Important**: Ce guide a un site landing associé qui doit être mis à jour après certains changements.

**Landing repo**: `/Users/florianbruniaux/Sites/perso/claude-code-ultimate-guide-landing/`

### Éléments à synchroniser

| Élément | Source (guide) | Destination (landing) |
|---------|----------------|----------------------|
| Version | `VERSION` | index.html footer + FAQ |
| Templates count | Count `examples/` files | Badges, title, meta tags |
| Guide lines | `wc -l guide/ultimate-guide.md` | Badges |
| Golden Rules | README.md | index.html section |
| FAQ | README.md | index.html FAQ |

### Triggers de sync

Après ces modifications, **rappeler** de mettre à jour le landing:

1. **Version bump** → Modifier `VERSION` ici, puis landing
2. **Ajout/suppression templates** → Recalculer count, mettre à jour landing
3. **Modification Golden Rules ou FAQ** → Répercuter sur landing
4. **Changement significatif du guide** (>100 lignes)

### Commande de vérification

```bash
./scripts/check-landing-sync.sh
```

**Ce que fait le script (4 vérifications):**

| Check | Source | Comparaison |
|-------|--------|-------------|
| Version | `VERSION` | index.html (footer + FAQ) |
| Templates | `find examples/` | index.html + examples.html |
| Quiz questions | `questions.json` | index.html + quiz.html |
| Guide lines | `wc -l ultimate-guide.md` | index.html (tolérance ±500) |

**Output attendu (si synchronisé):**
```
=== Landing Site Sync Check ===

1. Version
   Guide:   3.8.1
   Landing: 3.8.1
   OK

2. Templates Count
   Guide:         53 files
   index.html:    53
   examples.html: 53
   OK

3. Quiz Questions
   questions.json: 159
   index.html:     159
   quiz.html:      159
   OK

4. Guide Lines
   Actual:  9881
   Landing: 9800+ (approximate)
   OK (within tolerance)

=== Summary ===
All synced!
```

**En cas de mismatch:**
- Le script indique quel fichier est désynchronisé
- Exit code = nombre d'issues trouvées
- Consulter `landing/CLAUDE.md` pour les numéros de ligne exacts à modifier

## Research Resources

**Perplexity Pro disponible**: Pour toute recherche nécessitant des sources fiables ou des informations récentes sur Claude Code, Anthropic, ou les pratiques de développement assisté par IA:
- Demande-moi de faire une recherche Perplexity (plus efficace que WebSearch basique)
- Je te fournirai les résultats avec les sources
- Utile pour: nouvelles features Claude Code, best practices communauté, comparaisons d'outils, documentation officielle mise à jour

## Claude Code Releases Tracking

Ce repo maintient un historique condensé des releases officielles de Claude Code.

### Fichiers

| Fichier | Rôle |
|---------|------|
| `machine-readable/claude-code-releases.yaml` | Source de vérité (YAML) |
| `guide/claude-code-releases.md` | Version lisible (Markdown) |
| `scripts/update-cc-releases.sh` | Script de vérification des nouvelles versions |

### Vérifier les nouvelles versions

```bash
./scripts/update-cc-releases.sh
```

Le script:
1. Fetch le CHANGELOG officiel depuis GitHub
2. Compare avec notre version trackée
3. Affiche les nouvelles releases à condenser

### Workflow de mise à jour

1. **Vérifier**: `./scripts/update-cc-releases.sh`
2. **MAJ YAML**: Ajouter nouvelle entrée dans `claude-code-releases.yaml`
   - Mettre à jour `latest` et `updated`
   - Ajouter l'entrée dans `releases` (condensée: 2-4 highlights max)
   - Ajouter aux `breaking_summary` si applicable
   - Ajouter aux `milestones` si feature majeure
3. **MAJ Markdown**: Mettre à jour `claude-code-releases.md` en cohérence
4. **Landing sync**: `./scripts/check-landing-sync.sh`
5. **Commit**: `docs: update Claude Code releases (vX.Y.Z)`

### Format des entrées YAML

```yaml
- version: "2.1.13"
  date: "2026-01-20"
  highlights:
    - "Feature principale"
    - "Autre feature notable"
  breaking:
    - "Description du breaking change (si applicable)"
```

## Quick Lookups

For answering questions about Claude Code:
1. Search `machine-readable/reference.yaml` first (has line numbers to full guide)
2. Use those line numbers to read relevant sections from `guide/ultimate-guide.md`
3. Check `examples/` for ready-to-use templates
4. Check `guide/claude-code-releases.md` for recent features/changes
5. Si info manquante ou incertaine → demander une recherche Perplexity
