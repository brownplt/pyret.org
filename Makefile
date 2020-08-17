.Phony: all
all: pages

site/js/codemirror.js: node_modules/codemirror/lib/codemirror.js
	cp $< $@

site/js/pyret.js: node_modules/pyret-codemirror-mode/mode/pyret.js
	cp $< $@

site/js/runmode.js: node_modules/codemirror/addon/runmode/runmode.js
	cp $< $@

CM_JS = site/js/codemirror.js site/js/pyret.js site/js/runmode.js

.Phony: pages
pages: $(CM_JS)
	/Applications/Racket\ v7.6/bin/raco frog -b

.Phony: serve
serve:
	/Applications/Racket\ v7.6/bin/raco frog -s

.Phony: clean
clean:
	/Applications/Racket\ v7.6/bin/raco frog --clean
