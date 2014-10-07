DIST_DIR=dist
DEB_DIR=$(DIST_DIR)/deb
LIB_PATH=usr/lib

clean:
	rm internal/*.so

compile:
	cd ./internal && ./compile_libs.sh

package: compile
	mkdir -p $(DEB_DIR)/DEBIAN $(DEB_DIR)/$(LIB_PATH)
	cp control $(DEB_DIR)/DEBIAN
	cp internal/*.so $(DEB_DIR)/$(LIB_PATH)
	dpkg-deb --build $(DEB_DIR) $(DIST_DIR)
