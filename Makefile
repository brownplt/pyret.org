PYRET_REPO      ?= ../pyret-lang

# pyret-lang git refs for which we want to host docs
PYRET_RELEASES  ?= master

.Phony: pages
pages:
	raco frog -b

.Phony: docs
docs: $(PYRET_REPO)
	mkdir -p src/docs
	for ref in $(PYRET_RELEASES) ; do \
		$(MAKE) -C $(PYRET_REPO) docs ; \
		cd $(PYRET_REPO) && git checkout $$ref ; \
		cd $(CURDIR) ; \
		rm -rf src/docs/$$ref ;\
		cp -r $(PYRET_REPO)/docs src/docs/$$ref ; \
	done

.Phony: serve
serve:
	raco frog -s

.Phony: stage
stage:
	scp -r site/* ssh.cs.brown.edu:/web/cs/web/sites/pyret.org/___staging/
	ssh ssh.cs.brown.edu chmod -R a+r /web/cs/web/sites/pyret.org/___staging/*

.Phony: pub
pub:
	scp -r site/* ssh.cs.brown.edu:/web/cs/web/sites/pyret.org/
	ssh ssh.cs.brown.edu chmod -R a+r /web/cs/web/sites/pyret.org/*

.Phony: clean
clean:
	git clean -fd
	raco frog --clean
