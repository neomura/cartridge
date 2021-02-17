use <../../measurements.scad>;

module cartridge_slot_vertical_solder_joint_cutout() {
  square([
    cartridge_pins_width(),
    cartridge_pin_height(),
  ], center = true);
};
