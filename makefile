.SUFFIXES: .txt .mkd .xml

XML2RFC=xml2rfc
KRAMDOWN=kramdown-rfc2629
IDDIFF=iddiff

%.xml: %.mkd
	$(KRAMDOWN) $< >$@

%.txt: %.xml
	$(XML2RFC) $<

all:	draft-eckert-ietf-and-energy-overview.xml draft-eckert-ietf-and-energy-overview.txt diff


drafts_source := draft-eckert-ietf-and-energy-overview.mkd
draft_base := draft-eckert-ietf-and-energy-overview
versions_dir := versions

.PHONY: fix-lint-ws
fix-lint-ws::
	for f in $(drafts_source); do \
	  [  -z "$$(tail -c 1 "$$f")" ] || echo >>"$$f"; \
	done
	sed -i~ -e 's/ *$$//' $(drafts_source)

.PHONY: diff
diff: $(draft_base).txt
	@prev=$$(ls $(versions_dir)/$(draft_base)-*.txt 2>/dev/null | sort -V | tail -1); \
	if [ -z "$$prev" ]; then \
	  echo "No previous version found in $(versions_dir)/, skipping diff"; exit 0; \
	fi; \
	echo "Diffing $$prev -> $(draft_base).txt"; \
	$(IDDIFF) "$$prev" $(draft_base).txt > $(draft_base)-diff.html; \
	echo "Wrote $(draft_base)-diff.html"
