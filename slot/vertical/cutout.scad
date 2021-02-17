use <../../measurements.scad>;

module cartridge_slot_vertical_cutout() {
  hull() {
    translate([
      - cartridge_slot_width_tolerance() + cartridge_slot_depth_tolerance() - cartridge_width() / 2,
      cartridge_pin_height() / 2 + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_pcb_back_clearance() + cartridge_wall_thickness(),
    ]) {
      circle(r = cartridge_slot_depth_tolerance(), $fn = cartridge_wall_sides());
    };

    translate([
      cartridge_width() / 2 - cartridge_slot_depth_tolerance() + cartridge_slot_width_tolerance(),
      cartridge_pin_height() / 2 + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_pcb_back_clearance() + cartridge_wall_thickness(),
    ]) {
      circle(r = cartridge_slot_depth_tolerance(), $fn = cartridge_wall_sides());
    };

    translate([
      - cartridge_slot_width_tolerance() + cartridge_slot_depth_tolerance() - cartridge_width() / 2,
      cartridge_pin_height() / 2 - cartridge_pcb_front_clearance() - cartridge_engraving_depth() - cartridge_wall_thickness(),
    ]) {
      circle(r = cartridge_slot_depth_tolerance(), $fn = cartridge_wall_sides());
    };

    translate([
      cartridge_width() / 2 - cartridge_slot_depth_tolerance() + cartridge_slot_width_tolerance(),
      cartridge_pin_height() / 2 - cartridge_pcb_front_clearance() - cartridge_engraving_depth() - cartridge_wall_thickness(),
    ]) {
      circle(r = cartridge_slot_depth_tolerance(), $fn = cartridge_wall_sides());
    };
  };
};
