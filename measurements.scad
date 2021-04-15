use <submodules/neomura/logo/logo.scad>;

function cartridge_pad_spacing() = 2.54;

function cartridge_wall_sides() = 32;
function cartridge_pcb_width() = 42;
function cartridge_pcb_height() = 40.37;
function cartridge_pcb_thickness() = 1.6;
function cartridge_pcb_margin() = (cartridge_pcb_width() - cartridge_pad_spacing() * 16) / 2;
function cartridge_pcb_tolerance() = 0.25;
function cartridge_pcb_front_clearance() = cartridge_pad_spacing() * 2;
function cartridge_pcb_back_clearance() = 3;

function cartridge_pin_inset() = 1;
function cartridge_pin_length() = 6;
function cartridge_pin_tolerance() = 0.25;
function cartridge_pins() = 15;
function cartridge_pin_height() = cartridge_pad_spacing();
function cartridge_pins_width() = cartridge_pins() * cartridge_pad_spacing() + 0.25;
function cartridge_pin_reinforcement_margin() = 0.75;
function cartridge_pin_retainer_length() = 2.5;

function cartridge_engraving_margin() = 2;
function cartridge_logo_height() = 3;
function cartridge_engraving_radius() = 2;
function cartridge_arrow_width() = 6;
function cartridge_arrow_height() = 3;
function cartridge_engraving_depth() = 0.4;
function cartridge_engraving_sides() = 32;

function cartridge_wall_thickness() = 1.6;

function cartridge_friction_fit_tolerance() = 0;
function cartridge_loose_fit_tolerance() = 0.125;

function cartridge_width() = cartridge_wall_thickness() + cartridge_pcb_tolerance() + cartridge_pcb_width() + cartridge_pcb_tolerance() + cartridge_wall_thickness();
function cartridge_height() = cartridge_pin_inset() + cartridge_pin_length() + cartridge_pcb_height() + cartridge_pcb_tolerance() + cartridge_wall_thickness();
function cartridge_depth() = cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_pcb_back_clearance() + cartridge_wall_thickness();
function cartridge_back_width_adjustment() = 0.2;
function cartridge_elephants_foot_adjustment_width() = 0.2;
function cartridge_elephants_foot_adjustment_height() = 0.2;

function cartridge_slot_depth_tolerance() = 0.175;
function cartridge_slot_width_tolerance() = 0.225;

function cartridge_version_stamp_line_spacing() = 4;
function cartridge_version_stamp_size() = 3;
function cartridge_version_stamp_height() = 0.2;

module cartridge_version_stamp(first_line, second_line) {
  linear_extrude(cartridge_version_stamp_height()) {
    translate([0, cartridge_version_stamp_line_spacing() + 0.2]) {
      logo(cartridge_version_stamp_size(), 0.075);
    };

    text(
      first_line,
      cartridge_version_stamp_size(),
      "Liberation Mono:Bold",
      halign = "center",
      valign = "center"
    );

    translate([0, -cartridge_version_stamp_line_spacing()]) {
      text(
        second_line,
        cartridge_version_stamp_size(),
        "Liberation Mono:Bold",
        halign = "center",
        valign = "center"
      );
    };
  };
};
