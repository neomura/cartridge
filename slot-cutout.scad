use <measurements.scad>;

module cartridge_slot_cutout(height) {
  translate([
    cartridge_width() / -2 - cartridge_slot_tolerance(),
    - cartridge_slot_tolerance() - cartridge_engraving_depth() / 2 - cartridge_wall_thickness() - cartridge_pcb_front_clearance() - cartridge_pcb_tolerance() - cartridge_pcb_thickness() - cartridge_pcb_tolerance() - cartridge_connector_stand_height() - cartridge_connector_pin_height() / 2,
    0,
  ]) {
    cube([
      cartridge_slot_tolerance() + cartridge_width() + cartridge_slot_tolerance(),
      cartridge_slot_tolerance() + cartridge_depth() + cartridge_slot_tolerance(),
      height,
    ]);
  };
};
