EXTRA_DIST = \
	Paper \
	COPYING \
	AUTHORS \
	README.md

themedir = $(datadir)/themes

install-data-hook:
	$(MKDIR_P) $(DESTDIR)/usr/share/themes
	cp -Rv Paper $(DESTDIR)/usr/share/themes/.

uninstall-hook:
	test -e $(DESTDIR)/usr/share/themes/Paper && rm -rfv $(DESTDIR)/usr/share/themes/Paper