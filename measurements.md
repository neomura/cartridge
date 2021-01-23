# neomura > [cartridge](./readme.md) > measurements

neomura cartridges contain not only the game data, but also the cpu, ram and
audio/video generation electronics; by contrast, consoles are somewhat breakout
boards.

## physical dimensions

### pcb

the neomura cartridge format is intended to contain a 40.64x40.64mm pcb,
equivalent to 15x15 2.54mm pads with a 1.27mm margin on all sides (which must be
clear of components, except the pin headers).

note that the pcb is mounted with components facing the back of the cartridge.

### engravings

on the front are a "pill-shaped" "grip" area featuring the neomura logo, an area
for a label, and an arrow directing the user to insert it into the cartridge
slot.

```
          .-----------------------.
          |                       | -.
          |                       |  |-----------------.
          |                       | -'                  |
      .-{ |   .---------------.   |                     |
     |    |  |     neomura     |  | } logo height (3mm) |
     |.-{ |   '---------------'   |                     |
     |    |                       | -.                  |
     |    |                       |  |-----------------.|
     |    |                       | -'                  |
     |.-{ |   .---------------.   |                     |
     |    |  |                 |  |                     | engraving margin (2mm)
     |    |  |                 |  |                     |
     |    |  |                 |  |                     |
     |    |  |     (label)     |  |                     |
     |    |  |                 |  |                     |
     |    |  |                 |  |                     |
     |    |  |                 |  |                     |
     |.-{ |   '---------------'   |                     |
     |    |                       | -.                  |
     |    |                       |  |-----------------'|
     |    |                       | -'                  |
     |    |        .-----.        | -.                  |
     |    |         '. .'         |  | arrow height (3mm)
     |    |           '           | -'                  |
     |    |                       | -.                  |
     |    |                       |  |-----------------'
     |    |                       | -'
     |    '-----------------------'
     |             '-----'
     |        arrow width (6mm)
     |
      '- engraving radius (2mm)
```

## electrical contacts

two male 6-pin 2.54mm pin headers are present on the underside, spaced one
2.54mm pad apart.

physically, these resemble the following:

```
                            -.
------.       . . . . . .    | connector pin height (2.5mm)
       |      | | | | | |   -'
      .-.    .-----------.  -.
      | |    |           |   | connector stand height (2.5mm)
      | |    |           |  -'
   =======  ===============
       '      ' ' ' ' ' '
'-''-''-'    '-----------'
 |  |  |           |
 |  |  |           '- connector stand width (15.24mm)
 |  |  |
 |  |  '- connector stand length (2.54mm)
 |  |
 |  '- connector stand inset (1.27mm)
 |
 '- connector pin protrusion (3.81mm)
```

from the front, left to right, these pins are:

| position | description                                                     |
| -------- | --------------------------------------------------------------- |
| left 1   | ntsc composite video output (yellow); expects 75ohm impedence.  |
| left 2   | analog audio output (white); expects 75ohm impedence.           |
| left 3   | pad data 3 (see below).                                         |
| left 4   | pad data 2 (see below).                                         |
| left 5   | pad data 1 (see below).                                         |
| left 6   | pad data 0 (see below).                                         |
| right 1  | ground.                                                         |
| right 2  | +5v, max 100mA supply from console to cartridge.                |
| right 3  | pad clock (see below).                                          |
| right 4  | pad latch (see below).                                          |
| right 5  | reserved; intended for use with programming or debugging tools. |
| right 6  | short to ground to reset the game.                              |

### pads

compatible with up to 4 super nintendo entertainment system-like controllers.

the following buttons are defined:

- face down
- face left
- select
- start
- up
- down
- left
- right
- face right
- face up
- left shoulder
- right shoulder

```
  left shoulder                                                right shoulder


           up                                                 face up




left                 right      select   start      face left         face right




           down                                              face down

```

the latch output is pulled to ground most of the time.  once per 60th of a
second, it is pulled to +5v for 12μs.

the clock output is pulled to +5v most of the time.  6μs after the latch output
is pulled back to ground, the clock output is pulled to ground for 6μs and back
to +5v for 6μs, 11 times.

every time the clock output is pulled to ground, all attached controllers
advance to the next button, in the order defined above.

when the latch output is pulled to +5v, the first button is selected.

before the clock output is pulled to ground, pad data 0-3 will be pulled to
ground by the corresponding controller if the current button is down.

the cartridge is responsible for pull-up to +5v on pad data 0-3.
