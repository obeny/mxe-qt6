# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := mingw-w64
$(PKG)_WEBSITE  := https://mingw-w64.sourceforge.io/
$(PKG)_DESCR    := MinGW-w64 Runtime
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := master-dddccbc
$(PKG)_CHECKSUM := 16566222dd95c84f3d7e666229a91c3fbe8cae4bdb8819c8bdcfccfbb63601cc
$(PKG)_SUBDIR   := $(PKG)-master
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.bz2
$(PKG)_URL      := http://obeny.obeny.net/mxe/$($(PKG)_FILE)
$(PKG)_TYPE     := script
$(PKG)_DEPS     :=

# can't install headers here since dummy pthreads headers are installed
# and then clobbered by inline winpthreads build in gcc (see #958)

define $(PKG)_BUILD
    # create pkg-config files for OpenGL/GLU
    mkdir -p '$(PREFIX)/$(TARGET)/lib/pkgconfig'
    (echo 'Name: gl'; \
     echo 'Version: 0'; \
     echo 'Description: OpenGL'; \
     echo 'Libs: -lopengl32';) \
     > '$(PREFIX)/$(TARGET)/lib/pkgconfig/gl.pc'

    (echo 'Name: glu'; \
     echo 'Version: 0'; \
     echo 'Description: OpenGL'; \
     echo 'Libs: -lglu32';) \
     > '$(PREFIX)/$(TARGET)/lib/pkgconfig/glu.pc'
endef
