# IETF and Energy

Source repository for the Internet-Draft **"An Overview of Energy-related
Efforts within the IETF, IRTF, and IAB"** (`draft-eckert-ietf-and-energy-overview`).

Datatracker: https://datatracker.ietf.org/doc/draft-eckert-ietf-and-energy-overview/

Authors: Toerless Eckert, Mohamed Boucadair, Pascal Thubert, Jeff Tantsura, Carlos Pignataro

Editors: Toerless Eckert, Carlos Pignataro

## Layout

- `draft-eckert-ietf-and-energy-overview.mkd` — draft source (kramdown-rfc)
- `draft-eckert-ietf-and-energy-overview.xml` / `.txt` — generated outputs (`make all`)
- `versions/` — snapshots of each submitted revision
- `presentations/` — related slide decks
- `makefile` — build rules (requires `kramdown-rfc2629`, `xml2rfc`, and `iddiff`)

## Building

- `make all` — build `.xml` and `.txt` from the `.mkd` source
- `make diff` — build the draft, then diff it against the latest revision in `versions/`, producing `draft-eckert-ietf-and-energy-overview-diff.html`
