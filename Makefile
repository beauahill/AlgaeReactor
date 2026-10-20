PARTS = base_acrylic base_sealed base_camlock printed_tube printed_tube_v2 printed_body lid lid_bayonet bayonet_ring bayonet_test camlock_test_tube camlock_test_base deck_plate led_spine gasket gasket_flat
all: $(PARTS:%=stl/%.stl)
stl/%.stl: openscad/%.scad openscad/params.scad openscad/lib.scad
	mkdir -p stl && openscad -o $@ $<
clean:
	rm -f stl/*.stl
