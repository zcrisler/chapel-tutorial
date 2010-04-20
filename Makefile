TARGETS = approx_pi

all: $(TARGETS)

%: %.chpl
	chpl --fast -o $* $<

clean:
	$(RM) $(TARGETS)
