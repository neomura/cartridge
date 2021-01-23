use <measurements.scad>;
use <submodules/neomura/logo/logo.scad>;

difference() {
  union() {
    difference() {
      // outer shell.
      translate([
        0,
        cartridge_depth() / 2,
        0,
      ]) {
        rotate([90, 0, 0]) {
          linear_extrude(cartridge_depth() - cartridge_wall_thickness() - cartridge_engraving_depth()) {
            hull() {
              // bottom left.
              translate([
                cartridge_width() / -2 + cartridge_wall_thickness(),
                cartridge_wall_thickness(),
              ]) {
                circle(r = cartridge_wall_thickness(), $fn = cartridge_wall_sides());
              }

              // bottom right.
              translate([
                cartridge_width() / 2 - cartridge_wall_thickness(),
                cartridge_wall_thickness(),
              ]) {
                circle(r = cartridge_wall_thickness(), $fn = cartridge_wall_sides());
              }

              // top left.
              translate([
                cartridge_width() / -2 + cartridge_wall_thickness(),
                cartridge_height() - cartridge_wall_thickness(),
              ]) {
                circle(r = cartridge_wall_thickness(), $fn = cartridge_wall_sides());
              }

              // top right.
              translate([
                cartridge_width() / 2 - cartridge_wall_thickness(),
                cartridge_height() - cartridge_wall_thickness(),
              ]) {
                circle(r = cartridge_wall_thickness(), $fn = cartridge_wall_sides());
              }
            };
          };
        };
      };

      // pcb back clearance cutout.
      translate([
        cartridge_width() / -2 + cartridge_wall_thickness() + cartridge_pcb_margin(),
        cartridge_depth() / 2 - cartridge_wall_thickness() - cartridge_pcb_back_clearance(),
        cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_pcb_margin(),
      ]) {
        cube([
          cartridge_pcb_tolerance() - cartridge_pcb_margin() + cartridge_pcb_width() - cartridge_pcb_margin() + cartridge_pcb_tolerance(),
          cartridge_pcb_back_clearance(),
          cartridge_pcb_tolerance() - cartridge_pcb_margin() + cartridge_pcb_height() - cartridge_pcb_margin() + cartridge_pcb_tolerance()
        ]);
      };

      // pcb and front clearance cutout.
      translate([
        cartridge_width() / -2 + cartridge_wall_thickness(),
        cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
        cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion(),
      ]) {
        cube([
          cartridge_pcb_tolerance() + cartridge_pcb_width() + cartridge_pcb_tolerance(),
          cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance(),
          cartridge_pcb_tolerance() + cartridge_pcb_height() + cartridge_pcb_tolerance(),
        ]);
      };
    };

    // wall around left connector.
    translate([
      cartridge_connector_spacing() / -2 - cartridge_connector_tolerance() - cartridge_wall_thickness() - cartridge_connector_stand_width(),
      cartridge_depth() / 2 - cartridge_wall_thickness() - cartridge_pcb_back_clearance(),
      cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_pcb_margin(),
    ]) {
      cube([
        cartridge_connector_tolerance() + cartridge_wall_thickness() + cartridge_connector_stand_width() + cartridge_wall_thickness() + cartridge_connector_tolerance(),
        cartridge_pcb_back_clearance(),
        - cartridge_pcb_margin() + cartridge_connector_stand_inset() + cartridge_connector_stand_length() + cartridge_wall_thickness(),
      ]);
    };

    // wall around right connector.
    translate([
      cartridge_connector_spacing() / 2 - cartridge_connector_tolerance() - cartridge_wall_thickness(),
      cartridge_depth() / 2 - cartridge_wall_thickness() - cartridge_pcb_back_clearance(),
      cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_pcb_margin(),
    ]) {
      cube([
        cartridge_connector_tolerance() + cartridge_wall_thickness() + cartridge_connector_stand_width() + cartridge_wall_thickness() + cartridge_connector_tolerance(),
        cartridge_pcb_back_clearance(),
        - cartridge_pcb_margin() + cartridge_connector_stand_inset() + cartridge_connector_stand_length() + cartridge_wall_thickness(),
      ]);
    };
  };

  // pin cutout for left connector.
  translate([
    cartridge_connector_spacing() / -2 - cartridge_connector_tolerance() - cartridge_connector_stand_width(),
    cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
    0,
  ]) {
    cube([
      cartridge_connector_tolerance() + cartridge_connector_stand_width() + cartridge_connector_tolerance(),
      cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_connector_stand_height() + cartridge_connector_pin_height() + cartridge_connector_tolerance(),
      cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_connector_stand_inset() + cartridge_connector_stand_length(),
    ]);
  };

  // pin cutout for right connector.
  translate([
    cartridge_connector_spacing() / 2 - cartridge_connector_tolerance(),
    cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
    0,
  ]) {
    cube([
      cartridge_connector_tolerance() + cartridge_connector_stand_width() + cartridge_connector_tolerance(),
      cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_connector_stand_height() + cartridge_connector_pin_height() + cartridge_connector_tolerance(),
      cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_connector_stand_inset() + cartridge_connector_stand_length(),
    ]);
  };
};
