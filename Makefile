setup: 
	chmod +x setup.sh
	./setup.sh

configure:
	chmod +x configure.sh
	./configure.sh

install: setup configure
