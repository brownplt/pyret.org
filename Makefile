.Phony: all
all: pages

site/js/codemirror.js: node_modules/codemirror/lib/codemirror.js
	cp $< $@

site/js/pyret.js: node_modules/pyret-codemirror-mode/mode/pyret.js
	cp $< $@

site/js/runmode.js: node_modules/codemirror/addon/runmode/runmode.js
	cp $< $@

docs/horizon:
	git clone --branch horizon https://github.com/brownplt/pyret-docs horizon-docs
	cd horizon-docs; npm install; make
	mkdir -p site/docs/
	cp -r horizon-docs/build/docs site/docs/horizon

docs/latest:
	git clone --branch master https://github.com/brownplt/pyret-docs latest-docs
	cd latest-docs; npm install; make
	mkdir -p site/docs/
	cp -r latest-docs/build/docs site/docs/latest

CM_JS = site/js/codemirror.js site/js/pyret.js site/js/runmode.js

.Phony: pages
pages: $(CM_JS)
	raco frog -b

.Phony: pages-and-docs
pages-and-docs: pages docs/horizon docs/latest

.Phony: serve
serve:
	raco frog -s

.Phony: clean
clean:
	raco frog --clean
