use <measurements.scad>;

module cartridge_slot_support(height) {
  difference() {
    translate([
      cartridge_width() / -2 - cartridge_slot_tolerance(),
      - cartridge_slot_tolerance() - cartridge_wall_thickness() - cartridge_pcb_front_clearance() - cartridge_pcb_tolerance() - cartridge_pcb_thickness() - cartridge_pcb_tolerance() - cartridge_connector_stand_height() - cartridge_connector_pin_height() / 2,
      - height,
    ]) {
      cube([
        cartridge_slot_tolerance() + cartridge_width() + cartridge_slot_tolerance(),
        cartridge_slot_tolerance() + cartridge_depth() + cartridge_slot_tolerance(),
        height,
      ]);
    };

    translate([
      cartridge_connector_spacing() / 2 - cartridge_connector_tolerance(),
      - cartridge_connector_tolerance() - cartridge_connector_pin_height() / 2,
      - height,
    ]) {
      cube([
        cartridge_connector_tolerance() + cartridge_connector_stand_width() + cartridge_connector_tolerance(),
        cartridge_connector_tolerance() + cartridge_connector_pin_height() + cartridge_connector_tolerance(),
        height,
      ]);
    };

    translate([
      - cartridge_connector_tolerance() - cartridge_connector_stand_width() - cartridge_connector_spacing() / 2,
      - cartridge_connector_tolerance() - cartridge_connector_pin_height() / 2,
      - height,
    ]) {
      cube([
        cartridge_connector_tolerance() + cartridge_connector_stand_width() + cartridge_connector_tolerance(),
        cartridge_connector_tolerance() + cartridge_connector_pin_height() + cartridge_connector_tolerance(),
        height,
      ]);
    };
  };
};
