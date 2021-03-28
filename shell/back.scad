use <../measurements.scad>;
use <../submodules/neomura/logo/logo.scad>;

difference() {
  // Outer shell.
  translate([
    0,
    cartridge_depth() / 2,
    0,
  ]) {
    rotate([90, 0, 0]) {
      linear_extrude(cartridge_depth() - cartridge_wall_thickness() - cartridge_engraving_depth()) {
        hull() {
          // Bottom left.
          translate([
            cartridge_width() / -2 + cartridge_wall_thickness(),
            cartridge_wall_thickness() - cartridge_back_width_adjustment(),
          ]) {
            circle(
              r = cartridge_wall_thickness() - cartridge_back_width_adjustment() - cartridge_elephants_foot_adjustment_width(),
              $fn = cartridge_wall_sides()
            );
          };

          // Bottom right.
          translate([
            cartridge_width() / 2 - cartridge_wall_thickness(),
            cartridge_wall_thickness() - cartridge_back_width_adjustment(),
          ]) {
            circle(
              r = cartridge_wall_thickness() - cartridge_back_width_adjustment() - cartridge_elephants_foot_adjustment_width(),
              $fn = cartridge_wall_sides()
            );
          };

          // Top left.
          translate([
            cartridge_width() / -2 + cartridge_wall_thickness(),
            cartridge_height() - cartridge_wall_thickness(),
          ]) {
            circle(
              r = cartridge_wall_thickness() - cartridge_back_width_adjustment() - cartridge_elephants_foot_adjustment_width(),
              $fn = cartridge_wall_sides()
            );
          };

          // Top right.
          translate([
            cartridge_width() / 2 - cartridge_wall_thickness(),
            cartridge_height() - cartridge_wall_thickness(),
          ]) {
            circle(
              r = cartridge_wall_thickness() - cartridge_back_width_adjustment() - cartridge_elephants_foot_adjustment_width(),
              $fn = cartridge_wall_sides()
            );
          };
        };
      };

      translate([0, 0, cartridge_elephants_foot_adjustment_height()]) {
        linear_extrude(cartridge_depth() - cartridge_wall_thickness() - cartridge_engraving_depth() - cartridge_elephants_foot_adjustment_height()) {
          hull() {
            // Bottom left.
            translate([
              cartridge_width() / -2 + cartridge_wall_thickness(),
              cartridge_wall_thickness() - cartridge_back_width_adjustment(),
            ]) {
              circle(
                r = cartridge_wall_thickness() - cartridge_back_width_adjustment(),
                $fn = cartridge_wall_sides()
              );
            };

            // Bottom right.
            translate([
              cartridge_width() / 2 - cartridge_wall_thickness(),
              cartridge_wall_thickness() - cartridge_back_width_adjustment(),
            ]) {
              circle(
                r = cartridge_wall_thickness() - cartridge_back_width_adjustment(),
                $fn = cartridge_wall_sides()
              );
            };

            // Top left.
            translate([
              cartridge_width() / -2 + cartridge_wall_thickness(),
              cartridge_height() - cartridge_wall_thickness(),
            ]) {
              circle(
                r = cartridge_wall_thickness() - cartridge_back_width_adjustment(),
                $fn = cartridge_wall_sides()
              );
            };

            // Top right.
            translate([
              cartridge_width() / 2 - cartridge_wall_thickness(),
              cartridge_height() - cartridge_wall_thickness(),
            ]) {
              circle(
                r = cartridge_wall_thickness() - cartridge_back_width_adjustment(),
                $fn = cartridge_wall_sides()
              );
            };
          };
        };
      };
    };
  };

  // PCB back clearance cutout.
  translate([
    cartridge_width() / -2 + cartridge_wall_thickness() + cartridge_pcb_margin(),
    cartridge_depth() / 2 - cartridge_wall_thickness() - cartridge_pcb_back_clearance(),
    cartridge_pin_inset() + cartridge_pin_length() + cartridge_pcb_margin(),
  ]) {
    cube([
      cartridge_pcb_tolerance() - cartridge_pcb_margin() + cartridge_pcb_width() - cartridge_pcb_margin() + cartridge_pcb_tolerance(),
      cartridge_pcb_back_clearance(),
      cartridge_pcb_tolerance() - cartridge_pcb_margin() + cartridge_pcb_height() - cartridge_pcb_margin() + cartridge_pcb_tolerance()
    ]);
  };

  // PCB and front clearance cutout.
  translate([
    cartridge_width() / -2 + cartridge_wall_thickness(),
    cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() - 0.1,
    cartridge_pin_inset() + cartridge_pin_length(),
  ]) {
    cube([
      cartridge_pcb_tolerance() + cartridge_pcb_width() + cartridge_pcb_tolerance(),
      cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + 0.1,
      cartridge_pcb_tolerance() + cartridge_pcb_height() + cartridge_pcb_tolerance(),
    ]);
  };

  // Pin cutout.
  translate([
    - cartridge_pin_tolerance() - cartridge_pins_width() / 2,
    cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() - 0.1,
    0,
  ]) {
    cube([
      cartridge_pin_tolerance() + cartridge_pins_width() + cartridge_pin_tolerance(),
      cartridge_pcb_front_clearance() + cartridge_pin_tolerance() + 0.1,
      cartridge_pin_inset() + cartridge_pin_length(),
    ]);
  };

  // Cutout for front pin retainer.
  translate([
    cartridge_width() / -2 + cartridge_wall_thickness(),
    cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() - 0.1,
    cartridge_pin_inset() + cartridge_pin_length() - cartridge_pin_tolerance() - cartridge_wall_thickness() - cartridge_loose_fit_tolerance(),
  ]) {
    cube([
      cartridge_pcb_tolerance() + cartridge_pcb_width() + cartridge_pcb_tolerance(),
      cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + 0.1,
      cartridge_wall_thickness() + cartridge_pin_tolerance() + cartridge_loose_fit_tolerance(),
    ]);
  };
};

// Lower pin retainer.
translate([
  cartridge_pin_reinforcement_margin() + cartridge_loose_fit_tolerance() - cartridge_pins_width() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() - cartridge_pin_reinforcement_margin() + cartridge_pin_tolerance(),
  cartridge_pin_inset() + cartridge_pin_length() - cartridge_pin_tolerance() - cartridge_wall_thickness(),
]) {
  cube([
    - cartridge_loose_fit_tolerance() - cartridge_pin_reinforcement_margin() + cartridge_pins_width() - cartridge_pin_reinforcement_margin() - cartridge_loose_fit_tolerance(),
    cartridge_pin_reinforcement_margin(),
    cartridge_wall_thickness(),
  ]);
};

translate([
    0,
    cartridge_depth() / 2 - cartridge_wall_thickness(),
    cartridge_pin_inset() + cartridge_pin_length() + cartridge_pcb_height() / 2,
]) {
  rotate([90, 0, 0]) {
    cartridge_version_stamp("CARTRIDGE SHELL", "BACK V0.0.0");
  };
};
