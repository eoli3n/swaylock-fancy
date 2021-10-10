PRGM = swaylock-fancy
PREFIX ?= /usr
SHRDIR ?= $(PREFIX)/share
BINDIR ?= $(PREFIX)/bin

install:
	@install -Dm755 swaylock-fancy        -t $(DESTDIR)$(BINDIR)
	@install -Dm644 icons/*               -t $(DESTDIR)$(SHRDIR)/$(PRGM)/icons
	@install -Dm644 doc/swaylock-fancy.1  -t $(DESTDIR)$(SHRDIR)/man/man1
	@install -Dm644 LICENSE.md            -t $(DESTDIR)$(SHRDIR)/licenses/$(PRGM)
	@sed $(DESTDIR)$(BINDIR)/swaylock-fancy -i -e "s,^PREFIX=.*,PREFIX="$(DESTDIR)$(SHRDIR)/$(PRGM)",g"

uninstall:
	@unlink $(DESTDIR)$(BINDIR)/$(PRGM) # Remove binary
	@rm -Rf $(DESTDIR)$(SHRDIR)/$(PRGM) # Remove icons
	@unlink $(DESTDIR)$(SHRDIR)/man/man1/swaylock-fancy.1 # Remove man
	@rm -Rf $(DESTDIR)$(SHRDIR)/licenses/$(PRGM) # Remove license
