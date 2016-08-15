.PHONY: orepan-master dist test clean

DIST_NAME=MySample-Module
OREPAN_DIR=my-orepan-dir

all: Build
	./Build

Build: Build.PL
	perl Build.PL

dist:
	./Build dist
	./release-to-orepan.sh $(DIST_NAME) $(OREPAN_DIR)

test: Build
	./Build test

clean:
	./Build realclean
