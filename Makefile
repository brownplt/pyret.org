.Phony: all
all: pages

.Phony: pages
pages:
	raco frog -b

.Phony: serve
serve:
	raco frog -s

.Phony: clean
clean:
	git clean -fd
	raco frog --clean
