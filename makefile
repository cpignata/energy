.SUFFIXES: .txt .mkd .xml

XML2RFC=xml2rfc
KRAMDOWN=kramdown-rfc2629

%.xml: %.mkd
	$(KRAMDOWN) $< >$@

%.txt: %.xml
	$(XML2RFC) $<

all:	draft-eckert-ietf-and-energy-overview.xml draft-eckert-ietf-and-energy-overview.txt


drafts_source := draft-eckert-ietf-and-energy-overview.mkd

.PHONY: fix-lint-ws
fix-lint-ws::
	for f in $(drafts_source); do \
	  [  -z "$$(tail -c 1 "$$f")" ] || echo >>"$$f"; \
	done
	sed -i~ -e 's/ *$$//' $(drafts_source)
