.PHONY: release  clean

DIST_NAME=MySample-Module
OREPAN_DIR=my-orepan-dir

release: Build
	./Build dist
	bash release-to-orepan.sh $(DIST_NAME) $(OREPAN_DIR)

Build: Build.PL
	perl Build.PL

clean: Build
	./Build realclean
