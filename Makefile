.PHONY: dist clean

all: Build

Build: Build.PL
	perl Build.PL

dist: my-orepan
	./Build dist
	@for file in $$(find ./ -name MySample-Module-*.tar.gz); do \
		orepan2-inject $$file my-orepan; \
	done

my-orepan:
	mkdir my-orepan

clean:
	./Build realclean
