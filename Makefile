.PHONY: orepan-master dist test clean

OREPAN_PATH=my-orepan-dir

all: Build
	./Build

Build: Build.PL
	perl Build.PL

dist: $(OREPAN_PATH) orepan-latest-master
	./Build dist
	@for file in $$(find . -maxdepth 1 -name "MySample-Module-*.tar.gz" | sed -e 's/^\.\///' | sort -r | head -n1); do \
		[ -z $$(find $(OREPAN_PATH) -name "$$file") ] && orepan2-inject $$file $(OREPAN_PATH); \
	done;
	cd $(OREPAN_PATH) && \
		git add . \
		&& git commit -m "Add new version of MySample-Module" \
		&& git push origin master

orepan-latest-master:
	cd $(OREPAN_PATH) && \
		git checkout master && \
		git pull origin master

$(OREPAN_PATH):
	git submodule update --init $@

test: Build
	./Build test

clean:
	./Build realclean
