ACODE   = Astro
DESIGN_LIB = 

LOG     = log
BACKUP  = BACKUP
;OPTIONS = -nullDisplay


backup:
	rm -rf $(BACKUP)
	mkdir -p $(BACKUP)
	cp -rf $(DESIGN_LIB) report $(LOG) $(BACKUP)

clean:
	rm  -f check_setup init_design place_opt clock_opt route_design post_route chip
	rm -rf $(DESIGN_LIB) report $(LOG) Astro.cmd.*_*_*_* Astro.log.*_*_*_* hdl2A.log.*_*_*_* \
               net.acts buffer.acts ECO_Route.rpt
	rm  -f preview_init_design preview_place_opt preview_clock_opt preview_route_design preview_post_route preview
	rm -rf preview_cmd

check_setup:
	mkdir -p report replay $(LOG)
	$(ACODE) -load cmd/check_setup.cmd -log $(LOG)/check_setup.log $(OPTIONS)
	touch check_setup
	./cmd/rcmd_toolbox/quickQoR check_setup >> check_setup &

init_design: check_setup
	mkdir -p report replay $(LOG)
	$(ACODE) -load cmd/init_design.cmd -log $(LOG)/init_design.log $(OPTIONS)
	touch init_design
	./cmd/rcmd_toolbox/quickQoR init_design >> init_design &

place_opt: init_design
	mkdir -p report replay $(LOG)
	$(ACODE) -load cmd/place_opt.cmd -log $(LOG)/place_opt.log $(OPTIONS)
	touch place_opt
	./cmd/rcmd_toolbox/quickQoR place_opt >> place_opt &

clock_opt: place_opt
	mkdir -p report replay $(LOG)
	$(ACODE) -load cmd/clock_opt.cmd -log $(LOG)/clock_opt.log $(OPTIONS)
	touch clock_opt
	./cmd/rcmd_toolbox/quickQoR clock_opt >> clock_opt &

route_design: clock_opt
	mkdir -p report replay $(LOG)
	$(ACODE) -load cmd/route_design.cmd -log $(LOG)/route_design.log $(OPTIONS)
	touch route_design
	./cmd/rcmd_toolbox/quickQoR route_design >> route_design  &

post_route: route_design
	mkdir -p report replay $(LOG)
	$(ACODE) -load cmd/post_route.cmd -log $(LOG)/post_route.log $(OPTIONS)
	touch post_route
	./cmd/rcmd_toolbox/quickQoR post_route >> post_route &

chip: post_route
	$(ACODE) -load cmd/dumpQoRItems.cmd -log $(LOG)/dumpQoRItems.log
	echo "*RCMD-INFO: The make process is done. Thanks for using Astro recommended flow."
	touch chip
	./cmd/rcmd_toolbox/completeQoR chip
	./cmd/rcmd_toolbox/quickQoR chip >> chip
	echo "Thank you for using OSU's Synopsys SoC design flow..."

################################################################################################################
# Execute "make preview" to generate Astro traditional scripts without real Astro execution.
#
################################################################################################################

preview_init_design:
	mkdir -p report preview_cmd $(LOG)
	$(ACODE) -load cmd/preview.cmd -replay cmd/init_design.cmd -log $(LOG)/preview_init_design.log $(OPTIONS)
	touch preview_init_design

preview_place_opt: preview_init_design
	mkdir -p report preview_cmd $(LOG)
	$(ACODE) -load cmd/preview.cmd -replay cmd/place_opt.cmd -log $(LOG)/preview_place_opt.log $(OPTIONS)
	touch preview_place_opt

preview_clock_opt: preview_place_opt
	mkdir -p report preview_cmd $(LOG)
	$(ACODE) -load cmd/preview.cmd -replay cmd/clock_opt.cmd -log $(LOG)/preview_clock_opt.log $(OPTIONS)
	touch preview_clock_opt

preview_route_design: preview_clock_opt
	mkdir -p report preview_cmd $(LOG)
	$(ACODE) -load cmd/preview.cmd -replay cmd/route_design.cmd -log $(LOG)/preview_route_design.log $(OPTIONS)
	touch preview_route_design 

preview_post_route: preview_route_design
	mkdir -p report preview_cmd $(LOG)
	$(ACODE) -load cmd/preview.cmd -replay cmd/post_route.cmd -log $(LOG)/preview_post_route.log $(OPTIONS)
	touch preview_post_route

preview: preview_post_route
	echo "*RCMD-INFO: The make preview process is done. Thanks for using Astro recommended flow."
	touch preview

