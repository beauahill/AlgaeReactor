PARTS = base_acrylic base_sealed printed_tube printed_body lid lid_bayonet bayonet_ring bayonet_test deck_plate led_spine gasket
all: $(PARTS:%=stl/%.stl)
stl/%.stl: openscad/%.scad openscad/params.scad openscad/lib.scad
	mkdir -p stl && openscad -o $@ $<
clean:
	rm -f stl/*.stl
