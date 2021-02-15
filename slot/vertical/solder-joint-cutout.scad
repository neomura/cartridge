use <../../measurements.scad>;

module cartridge_slot_vertical_solder_joint_cutout() {
  translate([
    cartridge_connector_spacing() / 2,
    - cartridge_connector_stand_length() / 2,
  ]) {
    square([
      cartridge_connector_stand_width(),
      cartridge_connector_stand_length(),
    ]);
  };

  translate([
    - cartridge_connector_stand_width() - cartridge_connector_spacing() / 2,
    - cartridge_connector_stand_length() / 2,
  ]) {
    square([
      cartridge_connector_stand_width(),
      cartridge_connector_stand_length(),
    ]);
  };
};
