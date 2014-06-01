all:
	make pages
	make doc

pages:
	raco frog -b

doc:
	cd .. && make doc
	rm -rf pyret-frog/docs
	cp -r ../docs/lang/ pyret-frog/docs/

serve:
	raco frog -s

stage:
	scp -r site/* ssh.cs.brown.edu:/web/cs/web/sites/pyret.org/___staging/
	ssh ssh.cs.brown.edu chmod -R a+r /web/cs/web/sites/pyret.org/___staging/*

pub:
	scp -r site/* ssh.cs.brown.edu:/web/cs/web/sites/pyret.org/
	ssh ssh.cs.brown.edu chmod -R a+r /web/cs/web/sites/pyret.org/*

clean:
	git clean -fd
	raco frog --clean
