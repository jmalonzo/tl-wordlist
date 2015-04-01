VERSION=0.5
LANGCODE=tl
LANGNAME=Tagalog
COUNTRY=PH
COUNTRYNAME=Philippines

BOTH=$(LANGCODE)_$(COUNTRY)
DICFILE=$(BOTH).dic
AFFFILE=$(BOTH).aff
README=README_$(BOTH).txt

all: $(DICFILE) $(AFFFILE) $(README)
	sed -i "s/^Version [^ ]*/Version ${VERSION}/" $(README)
	make-exts $(BOTH) '$(LANGNAME)' '$(COUNTRYNAME)' $(VERSION) '$(LANGNAME) spelling dictionary'
	@echo
	@echo
	@echo "LibreOffice extension:"
	@echo "http://borel.slu.edu/obair/hunspell-$(LANGCODE)-$(VERSION).oxt"
	@echo "Firefox addon:"
	@echo "http://borel.slu.edu/obair/$(LANGCODE)-dictionary.xpi"

SRC=./tl.wl
$(DICFILE): $(SRC)
	cp -f $(SRC) $@
	sed -i "1s/.*/`cat $@ | wc -l`\n&/" $@

$(AFFFILE): aspell-tl/tl_affix.dat
	cat aspell-tl/tl_affix.dat | iconv -f iso-8859-1 -t utf8 | sed "/SET ISO8859-1/s/.*/SET UTF-8\nWORDCHARS '-/" > $@

$(README): ispell-tl/README
	cat ispell-tl/README | iconv -f iso-8859-1 -t utf8 > $@

test: $(DICFILE) $(AFFFILE)
	cat tl.wl | hunspell -d ./tl_PH -l

clean:
	rm -f $(DICFILE) $(AFFFILE) $(README) *.zip *.oxt *.xpi
