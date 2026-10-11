# fragmented-keys.noizu.com

Static landing page for [Fragmented Keys](https://github.com/noizu-labs/fragmented-keys) —
Noizu's tag-versioned composite cache-key library. Hand-authored HTML/CSS served by
nginx; no JS framework, no build step, no third-party assets.

## Layout

- `index.html` — the page (dark/light via `prefers-color-scheme`)
- `nginx.conf` — gzip, cache headers, security headers, `/nginx-health` probe
- `Dockerfile` — `nginx:alpine` + `COPY . /usr/share/nginx/html`
- `helm/fragmented-keys-site/` — vendored chart (image
  `ops.noizu.com/fragmented-keys.noizu.com/frontend`, TLS `cloudflare-tls-synced`,
  Cloudflare source-range whitelist)

## Deploy

Git-driven release: merge to `main` → CI builds/pushes a `sha-*` image → bump-chart
job commits the new tag to `helm/fragmented-keys-site/values.yaml` → ArgoCD syncs.
Never hand-edit the image tag.

Branches: work happens on `develop` (PRs target it); `main` is CI/CD-only.

## Content provenance

Technical copy on the page is sourced from the composite repo's `README.md`,
`spec/ALGORITHM.md` and `spec/CONFORMANCE.md`, plus the per-language READMEs
(`elixir/`, `python/`, `go/`). Do not invent API details — re-check against the
composite when editing.

## License

Site content MIT — Noizu Labs, Inc.
