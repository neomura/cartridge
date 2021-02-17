use <measurements.scad>;

// PCB.
translate([
  cartridge_pcb_width() / -2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() + cartridge_pcb_tolerance(),
  cartridge_pin_inset() + cartridge_pin_length() + cartridge_pcb_tolerance(),
]) {
  cube([
    cartridge_pcb_width(),
    cartridge_pcb_thickness(),
    cartridge_pcb_height(),
  ]);
};

// Pins.
translate([
  - cartridge_pins_width() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() - cartridge_pin_height(),
  cartridge_pin_inset(),
]) {
  cube([
    cartridge_pins_width(),
    cartridge_pin_height(),
    cartridge_pin_length() + cartridge_pin_retainer_length(),
  ]);
};

// Pin joint.
translate([
  cartridge_pin_reinforcement_margin() - cartridge_pins_width() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() - cartridge_pin_height() + cartridge_pin_reinforcement_margin(),
  cartridge_pin_inset() + cartridge_pin_length() + cartridge_pin_retainer_length(),
]) {
  cube([
     - cartridge_pin_reinforcement_margin() + cartridge_pins_width() - cartridge_pin_reinforcement_margin(),
    - cartridge_pin_reinforcement_margin() + cartridge_pin_height() - cartridge_pin_reinforcement_margin(),
    cartridge_pcb_tolerance(),
  ]);
};

// Pin stand.
translate([
  cartridge_pin_reinforcement_margin() - cartridge_pins_width() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() - cartridge_pin_height() + cartridge_pin_reinforcement_margin(),
  cartridge_pin_inset() + cartridge_pin_length() + cartridge_pcb_tolerance() + cartridge_pin_retainer_length(),
]) {
  cube([
     - cartridge_pin_reinforcement_margin() + cartridge_pins_width() - cartridge_pin_reinforcement_margin(),
    cartridge_pin_height() - cartridge_pin_reinforcement_margin() + cartridge_pcb_tolerance(),
    cartridge_pad_spacing() - cartridge_pin_reinforcement_margin(),
  ]);
};
