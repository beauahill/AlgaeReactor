PARTS = base_acrylic printed_body printed_body_threaded lid lid_threaded thread_ring deck_plate led_spine
all: $(PARTS:%=stl/%.stl)
stl/%.stl: openscad/%.scad openscad/params.scad openscad/lib.scad
	mkdir -p stl && openscad -o $@ $<
clean:
	rm -f stl/*.stl
