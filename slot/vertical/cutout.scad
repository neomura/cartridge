use <../../measurements.scad>;

module cartridge_slot_vertical_cutout() {
  hull() {
    translate([
      - cartridge_slot_width_tolerance() + cartridge_slot_depth_tolerance() - cartridge_width() / 2,
      - cartridge_engraving_depth() - cartridge_wall_thickness() - cartridge_pcb_front_clearance() - cartridge_pcb_tolerance() - cartridge_pcb_thickness() - cartridge_pcb_tolerance() - cartridge_connector_stand_height() - cartridge_connector_pin_height() / 2,
    ]) {
      circle(r = cartridge_slot_depth_tolerance(), $fn = cartridge_wall_sides());
    };

    translate([
      cartridge_width() / 2 - cartridge_slot_depth_tolerance() + cartridge_slot_width_tolerance(),
      - cartridge_engraving_depth() - cartridge_wall_thickness() - cartridge_pcb_front_clearance() - cartridge_pcb_tolerance() - cartridge_pcb_thickness() - cartridge_pcb_tolerance() - cartridge_connector_stand_height() - cartridge_connector_pin_height() / 2,
    ]) {
      circle(r = cartridge_slot_depth_tolerance(), $fn = cartridge_wall_sides());
    };

    translate([
      - cartridge_slot_width_tolerance() + cartridge_slot_depth_tolerance() - cartridge_width() / 2,
      - cartridge_connector_stand_height() - cartridge_connector_pin_height() / 2 + cartridge_pcb_back_clearance() + cartridge_wall_thickness(),
    ]) {
      circle(r = cartridge_slot_depth_tolerance(), $fn = cartridge_wall_sides());
    };

    translate([
      cartridge_width() / 2 - cartridge_slot_depth_tolerance() + cartridge_slot_width_tolerance(),
      - cartridge_connector_stand_height() - cartridge_connector_pin_height() / 2 + cartridge_pcb_back_clearance() + cartridge_wall_thickness(),
    ]) {
      circle(r = cartridge_slot_depth_tolerance(), $fn = cartridge_wall_sides());
    };
  };
};
