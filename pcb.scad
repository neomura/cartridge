use <measurements.scad>;

// PCB.
translate([
  cartridge_pcb_width() / -2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() + cartridge_pcb_tolerance(),
  cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_pcb_tolerance(),
]) {
  cube([
    cartridge_pcb_width(),
    cartridge_pcb_thickness(),
    cartridge_pcb_height(),
  ]);
};

// Left connector stand.
translate([
  - cartridge_connector_stand_width() - cartridge_connector_spacing() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness(),
  cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_pcb_tolerance() + cartridge_connector_stand_inset(),
]) {
  cube([
    cartridge_connector_stand_width(),
    cartridge_connector_stand_length(),
    cartridge_connector_stand_length(),
  ]);
};

// Left connector pins.
translate([
  - cartridge_connector_stand_width() - cartridge_connector_spacing() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_connector_stand_height(),
  cartridge_connector_pin_inset(),
]) {
  cube([
    cartridge_connector_stand_width(),
    cartridge_connector_pin_height(),
    cartridge_connector_pin_protrusion() + cartridge_pcb_tolerance() + cartridge_connector_stand_inset() + cartridge_connector_stand_length(),
  ]);
};

// Right connector stand.
translate([
  cartridge_connector_spacing() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness(),
  cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_pcb_tolerance() + cartridge_connector_stand_inset(),
]) {
  cube([
    cartridge_connector_stand_width(),
    cartridge_connector_stand_length(),
    cartridge_connector_stand_length(),
  ]);
};

// Right connector pins.
translate([
  cartridge_connector_spacing() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_connector_stand_height(),
  cartridge_connector_pin_inset(),
]) {
  cube([
    cartridge_connector_stand_width(),
    cartridge_connector_pin_height(),
    cartridge_connector_pin_protrusion() + cartridge_pcb_tolerance() + cartridge_connector_stand_inset() + cartridge_connector_stand_length(),
  ]);
};
