# AGENT-README

> Orientation for AI coding agents working in this repo. Human docs: README.md.

## Type

other/static-site+marketing-page

## Purpose

Static landing page for Fragmented Keys (fragmented-keys.noizu.com) — Noizu's tag-versioned composite cache-key library. Hand-authored HTML/CSS, no JS framework, no build step.

## Stack

Plain HTML/CSS (`index.html`, dark/light via `prefers-color-scheme`); nginx (gzip, cache/security headers, `/nginx-health` probe); `nginx:alpine` Dockerfile; vendored helm chart `helm/fragmented-keys-site/`.

## Dev mode

```bash
docker build -t fragmented-keys-site .   # nginx:alpine + COPY . /usr/share/nginx/html (Dockerfile)
```

## Ports / URLs

- Port 80 — nginx listener (`nginx.conf` `listen 80`); deployed via helm with TLS (`cloudflare-tls-synced`) and a Cloudflare source-range whitelist.

## Tests

```bash
none configured
```

## Gotchas

- Deploy is git-driven: merge to `main` → CI builds/pushes `sha-*` image → `bump-chart` job commits the tag to `helm/fragmented-keys-site/values.yaml` → ArgoCD syncs. Never hand-edit the image tag.
- Work happens on `develop` (PRs target it); `main` is CI/CD-only.
- Technical copy is sourced from the composite repo's README/`spec/` — do not invent API details, re-check against fragmented-keys when editing (README § Content provenance).
