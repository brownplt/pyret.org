.Phony: all
all: pages docs

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
