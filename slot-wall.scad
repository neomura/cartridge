use <measurements.scad>;

module cartridge_slot_wall(height, wall_thickness) {
  translate([
    cartridge_width() / -2 - wall_thickness - cartridge_slot_tolerance(),
    - wall_thickness - cartridge_slot_tolerance() - cartridge_engraving_depth() / 2 - cartridge_wall_thickness() - cartridge_pcb_front_clearance() - cartridge_pcb_tolerance() - cartridge_pcb_thickness() - cartridge_pcb_tolerance() - cartridge_connector_stand_height() - cartridge_connector_pin_height() / 2,
    0,
  ]) {
    cube([
      wall_thickness + cartridge_slot_tolerance() + cartridge_width() + cartridge_slot_tolerance() + wall_thickness,
      wall_thickness + cartridge_slot_tolerance() + cartridge_depth() + cartridge_slot_tolerance() + wall_thickness,
      height,
    ]);
  };
};
