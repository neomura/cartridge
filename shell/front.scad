use <../measurements.scad>;
use <../submodules/neomura/logo/logo.scad>;

difference() {
  // Back plate.
  translate([
    0,
    cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
    0,
  ]) {
    rotate([90, 0, 0]) {
      linear_extrude(cartridge_engraving_depth() + cartridge_wall_thickness()) {
        hull() {
          // Bottom left.
          translate([
            cartridge_width() / -2 + cartridge_wall_thickness(),
            cartridge_wall_thickness(),
          ]) {
            circle(r = cartridge_wall_thickness(), $fn = cartridge_wall_sides());
          }

          // Bottom right.
          translate([
            cartridge_width() / 2 - cartridge_wall_thickness(),
            cartridge_wall_thickness(),
          ]) {
            circle(r = cartridge_wall_thickness(), $fn = cartridge_wall_sides());
          }

          // Top left.
          translate([
            cartridge_width() / -2 + cartridge_wall_thickness(),
            cartridge_height() - cartridge_wall_thickness(),
          ]) {
            circle(r = cartridge_wall_thickness(), $fn = cartridge_wall_sides());
          }

          // Top right.
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

  // Engraving.
  translate([
    0,
    cartridge_depth() / -2 + cartridge_engraving_depth(),
    0,
  ]) {
    rotate([90, 0, 0]) {
      linear_extrude(cartridge_engraving_depth()) {
        // Grip.
        difference() {
          hull() {
            // Top left.
            translate([
              - cartridge_width() / 2 + cartridge_engraving_margin() + cartridge_engraving_radius(),
              cartridge_height() - cartridge_engraving_margin() - cartridge_engraving_radius(),
            ]) {
              circle(r = cartridge_engraving_radius(), $fn = cartridge_engraving_sides());
            };

            // Top right.
            translate([
              cartridge_width() / 2 - cartridge_engraving_margin() - cartridge_engraving_radius(),
              cartridge_height() - cartridge_engraving_margin() - cartridge_engraving_radius(),
            ]) {
              circle(r = cartridge_engraving_radius(), $fn = cartridge_engraving_sides());
            };

            // Bottom left.
            translate([
              - cartridge_width() / 2 + cartridge_engraving_margin() + cartridge_engraving_radius(),
              cartridge_height() - cartridge_engraving_margin() - cartridge_engraving_radius() - cartridge_logo_height(),
            ]) {
              circle(r = cartridge_engraving_radius(), $fn = cartridge_engraving_sides());
            };

            // Bottom right.
            translate([
              cartridge_width() / 2 - cartridge_engraving_margin() - cartridge_engraving_radius(),
              cartridge_height() - cartridge_engraving_margin() - cartridge_engraving_radius() - cartridge_logo_height(),
            ]) {
              circle(r = cartridge_engraving_radius(), $fn = cartridge_engraving_sides());
            };
          };

          translate([
            0,
            cartridge_height() - cartridge_engraving_margin() - cartridge_engraving_radius() - cartridge_logo_height() / 2,
          ]) {
            logo(cartridge_logo_height(), 0.075);
          }
        };

        // Label.
        hull() {
          // Bottom left.
          translate([
            - cartridge_width() / 2 + cartridge_engraving_margin() + cartridge_engraving_radius(),
            cartridge_engraving_margin() + cartridge_arrow_height() + cartridge_engraving_margin() + cartridge_engraving_radius(),
          ]) {
            circle(r = cartridge_engraving_radius(), $fn = cartridge_engraving_sides());
          };

          // Bottom right.
          translate([
            cartridge_width() / 2 - cartridge_engraving_margin() - cartridge_engraving_radius(),
            cartridge_engraving_margin() + cartridge_arrow_height() + cartridge_engraving_margin() + cartridge_engraving_radius(),
          ]) {
            circle(r = cartridge_engraving_radius(), $fn = cartridge_engraving_sides());
          };

          // Top left.
          translate([
            - cartridge_width() / 2 + cartridge_engraving_margin() + cartridge_engraving_radius(),
            cartridge_height() - cartridge_engraving_margin() - cartridge_engraving_radius() - cartridge_logo_height() - cartridge_engraving_radius() - cartridge_engraving_margin() - cartridge_engraving_radius(),
          ]) {
            circle(r = cartridge_engraving_radius(), $fn = cartridge_engraving_sides());
          };

          // Top right.
          translate([
            cartridge_width() / 2 - cartridge_engraving_margin() - cartridge_engraving_radius(),
            cartridge_height() - cartridge_engraving_margin() - cartridge_engraving_radius() - cartridge_logo_height() - cartridge_engraving_radius() - cartridge_engraving_margin() - cartridge_engraving_radius(),
          ]) {
            circle(r = cartridge_engraving_radius(), $fn = cartridge_engraving_sides());
          };
        };

        // Arrow.
        polygon([
          [0, cartridge_engraving_margin()],
          [cartridge_arrow_width() / -2, cartridge_engraving_margin() + cartridge_arrow_height()],
          [cartridge_arrow_width() / 2, cartridge_engraving_margin() + cartridge_arrow_height()],
        ]);
      }
    };
  };
};

difference() {
  // Friction fit back pcb margin (outer).
  translate([
    cartridge_width() / -2 + cartridge_wall_thickness() + cartridge_friction_fit_tolerance(),
    cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
    cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_friction_fit_tolerance(),
  ]) {
    cube([
      - cartridge_friction_fit_tolerance() + cartridge_pcb_tolerance() + cartridge_pcb_width() + cartridge_pcb_tolerance() - cartridge_friction_fit_tolerance(),
      cartridge_pcb_front_clearance(),
      - cartridge_friction_fit_tolerance() + cartridge_pcb_tolerance() + cartridge_pcb_height() + cartridge_pcb_tolerance() - cartridge_friction_fit_tolerance(),
    ]);
  };

  // Friction fit back pcb margin (inner).
  translate([
    cartridge_width() / -2 + cartridge_wall_thickness() + cartridge_pcb_margin(),
    cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
    cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_pcb_margin(),
  ]) {
    cube([
      cartridge_pcb_tolerance() - cartridge_pcb_margin() + cartridge_pcb_width() - cartridge_pcb_margin() + cartridge_pcb_tolerance(),
      cartridge_pcb_front_clearance(),
      cartridge_pcb_tolerance() - cartridge_pcb_margin() + cartridge_pcb_height() - cartridge_pcb_margin() + cartridge_pcb_tolerance()
    ]);
  };
};

// Friction fit left connector.
translate([
  cartridge_connector_spacing() / -2 + cartridge_friction_fit_tolerance() - cartridge_connector_tolerance() - cartridge_connector_stand_width(),
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
  0,
]) {
  cube([
    - cartridge_friction_fit_tolerance() + cartridge_connector_tolerance() + cartridge_connector_stand_width() + cartridge_connector_tolerance() - cartridge_friction_fit_tolerance(),
     cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_connector_stand_height() - cartridge_connector_tolerance(),
    cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion(),
  ]);
};

// Friction fit right connector.
translate([
  cartridge_connector_spacing() / 2 + cartridge_friction_fit_tolerance() - cartridge_connector_tolerance(),
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
  0,
]) {
  cube([
    - cartridge_friction_fit_tolerance() + cartridge_connector_tolerance() + cartridge_connector_stand_width() + cartridge_connector_tolerance() - cartridge_friction_fit_tolerance(),
    cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_connector_stand_height() - cartridge_connector_tolerance(),
    cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion(),
  ]);
};

// Center pillar.
translate([
  - cartridge_connector_spacing() / 2,
  cartridge_depth() / -2 + cartridge_engraving_depth() + cartridge_wall_thickness(),
  0,
]) {
  cube([
    cartridge_connector_spacing(),
    cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_connector_stand_height() + cartridge_connector_pin_height() + cartridge_connector_tolerance() - cartridge_loose_fit_tolerance(),
    cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion(),
  ]);
};
