# subclinical
## Target
current: target
-include target.mk

## Makestuff setup
Sources += Makefile README.md
msrepo = https://github.com/dushoff
ms = makestuff
-include $(ms)/os.mk

Ignore += $(ms)
Makefile: $(ms)/Makefile
$(ms)/Makefile:
	git clone $(msrepo)/$(ms)
	ls $@

######################################################################

Sources += $(wildcard *.R)

%.inc.Rout: %.sim.Rout inc.R
	$(run-R)
%.incplots.Rout: %.inc.Rout incplots.R
	$(run-R)
%.sim.Rout: %.Rout functions.Rout sim.R
	$(run-R)
%.tsplots.Rout: %.sim.Rout tsplots.R
	$(run-R)

## base.incplots.Rout: base.R
## base.tsplots.Rout: base.R

######################################################################

### Makestuff rules

-include $(ms)/wrapR.mk
-include $(ms)/git.mk
-include $(ms)/visual.mk

