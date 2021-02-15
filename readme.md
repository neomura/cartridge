# neomura/cartridge

Mechanical specification for the Neomura retro games console's cartridges and corresponding slots.

| Link                                                                                                   | Description                                                                                      |
| ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ |
| [License](./license.md)                                                                                | MIT License.                                                                                     |
| [Shell](./shell/readme.md)                                                                             | Documentation regarding the outer shell.                                                         |
| [measurements.scad](./measurements.scad)                                                               | OpenSCAD module for measurements.                                                                |
| [shell/back.scad](./shell/back.scad)                                                                   | OpenSCAD model for the back half of the shell.                                                   |
| [shell/front.scad](./shell/front.scad)                                                                 | OpenSCAD model for the front half of the shell.                                                  |
| [pcb.scad](./pcb.scad)                                                                                 | OpenSCAD model for the PCB (for reference purposes).                                             |
| [slot/vertical/cutout.scad](./slot/vertical/cutout.scad)                                               | OpenSCAD module for the vertical cartridge slot's cutout.                                        |
| [slot/vertical/solder-joint-cutout.scad](./slot/vertical/solder-joint-cutout.scad)                     | OpenSCAD module for the vertical cartridge slot's solder joints; used to create supports.        |
| [Neomura_Cartridge.pretty/Slot-Vertical.kicad_mod](./Neomura_Cartridge.pretty/Slot-Vertical.kicad_mod) | KiCad footprint for the cartridge slot, with the cartridge mounted vertically on the front side. |
| [Neomura_Cartridge.pretty/Cartridge.kicad_mod](./Neomura_Cartridge.pretty/Cartridge.kicad_mod)         | KiCad footprint for a cartridge with silkscreen; components to be mounted on back.               |
| [Neomura_Cartridge.lib](./Neomura_Cartridge.lib)                                                       | KiCad symbol for the cartridge connector.                                                        |
