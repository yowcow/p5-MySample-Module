.PHONY: orepan-master dist test clean

DIST_NAME=MySample-Module
OREPAN_PATH=my-orepan-dir

all: Build
	./Build

Build: Build.PL
	perl Build.PL

dist: $(OREPAN_PATH) orepan-latest-master
	./Build dist
	./release-to-orepan.sh $(DIST_NAME) $(OREPAN_PATH)

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
