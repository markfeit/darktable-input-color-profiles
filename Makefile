#
# Makefile for color calibration images
#

default: install

# Make this non-empty to enable the sample profile.
#ENABLE_SAMPLE=1

DIRS := $(wildcard */)
ifeq ($(ENABLE_SAMPLE),)
  DIRS := $(filter-out sample/,$(DIRS))
endif

install uninstall clean::
	for DIR in $(DIRS); do $(MAKE) -C $$DIR $@ ; done


clean::
	make -C sample clean
	rm -rf $(TO_CLEAN) *~
