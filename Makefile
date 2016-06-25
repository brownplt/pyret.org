.Phony: all
all: pages docs

.Phony: pages
pages:
	raco frog -b

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
