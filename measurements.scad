function cartridge_pad_spacing() = 2.54;

function cartridge_wall_sides() = 32;
function cartridge_pcb_width() = cartridge_pad_spacing() * 16;
function cartridge_pcb_height() = cartridge_pad_spacing() * 16;
function cartridge_pcb_thickness() = 1.6;
function cartridge_pcb_margin() = 1.6;
function cartridge_pcb_tolerance() = 0.25;
function cartridge_pcb_front_clearance() = 3;
function cartridge_pcb_back_clearance() = 5;

function cartridge_connector_pin_height() = 2.5;
function cartridge_connector_stand_height() = 2.5;
function cartridge_connector_stand_width() = cartridge_pad_spacing() * 6 + 0.5;
function cartridge_connector_stand_length() = cartridge_pad_spacing();
function cartridge_connector_stand_inset() = cartridge_pad_spacing() / 2;
function cartridge_connector_pin_protrusion() = 4.4;
function cartridge_connector_pin_inset() = 4;
function cartridge_connector_tolerance() = 0.25;
function cartridge_connector_spacing() = cartridge_pad_spacing();

function cartridge_engraving_margin() = 2;
function cartridge_logo_height() = 3;
function cartridge_engraving_radius() = 2;
function cartridge_arrow_width() = 6;
function cartridge_arrow_height() = 3;
function cartridge_engraving_depth() = 0.4;
function cartridge_engraving_sides() = 32;

function cartridge_wall_thickness() = 1.6;

function cartridge_friction_fit_tolerance() = -0.05;

function cartridge_width() = cartridge_wall_thickness() + cartridge_pcb_tolerance() + cartridge_pcb_width() + cartridge_pcb_tolerance() + cartridge_wall_thickness();
function cartridge_height() = cartridge_connector_pin_inset() + cartridge_connector_pin_protrusion() + cartridge_pcb_height() + cartridge_pcb_tolerance() + cartridge_wall_thickness();
function cartridge_depth() = cartridge_engraving_depth() + cartridge_wall_thickness() + cartridge_pcb_front_clearance() + cartridge_pcb_tolerance() + cartridge_pcb_thickness() + cartridge_pcb_tolerance() + cartridge_pcb_back_clearance() + cartridge_wall_thickness();

function cartridge_slot_tolerance() = 0.175;
