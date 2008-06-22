# Makefile for ispell-tl
PREFIX=/usr/local
BUILDHASH=`which buildhash`
ISPELLDIR=${PREFIX}/lib/ispell
ISPELLBIN=${PREFIX}/bin
INSTALL=`which install`
SHELL=/bin/sh

INSTALL_DATA=$(INSTALL) -m 444

doc_files = COPYING Crawler.txt README NEWS Makefile

lang = tl
version = 0.3.1
distdir=ispell-${lang}-${version}

all: $(INSTALLATION).hash

.hash: $(lang).dic $(lang).aff
	$(BUILDHASH) $(lang).dic $(lang).aff $(lang).hash

install: $(lang).hash $(lang)
	$(INSTALL_DATA) $(lang).hash $(ISPELLDIR)
	$(INSTALL_DATA) $(lang).aff $(ISPELLDIR)

uninstall:
	rm -f $(ISPELLDIR)/$(lang).hash $(ISPELLDIR)/$(lang).aff

clean:
	rm -f *.cnt *.stat *.bak *.tar *.tar.gz

dist:
	-rm -r ${distdir}.tar.bz2 ${distdir}
	mkdir ${distdir}
	cp -p $(lang).dic $(lang).aff $(doc_files) $(distdir)/
	tar cf $(distdir).tar $(distdir)/
	bzip2 -9 $(distdir).tar
	rm -r $(distdir)/

distclean:
	@make clean
	rm -f *.hash
	rm -f $(distdir).tar.bz2

FORCE:
