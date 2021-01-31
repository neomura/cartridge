# [neomura/cartridge](./readme.md)/Documentation

Neomura cartridges contain not only the game data, but also the CPU, RAM and audio/video generation electronics; by contrast, consoles are somewhat breakout boards.

## Physical dimensions

### PCB

The Neomura cartridge format is intended to contain a 40.64x40.64mm PCB, equivalent to 15x15 2.54mm pads with a 1.27mm margin on all sides (which must be clear of components, except the pin headers).

Note that the PCB is mounted with components facing the back of the cartridge.

### Engravings

On the front are a "pill-shaped" "grip" area featuring the Neomura logo, an area for a label, and an arrow directing the user to insert it into the cartridge slot.

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

## Electrical contacts

Two male 6-pin 2.54mm pin headers are present on the underside, spaced one 2.54mm pad apart.

Physically, these resemble the following:

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

From the front, left to right, these pins are:

| Position | Description                                                     |
| -------- | --------------------------------------------------------------- |
| Left 1   | NTSC composite video output (yellow); expects 75ohm impedence.  |
| Left 2   | Analog audio output (white); expects 75ohm impedence.           |
| Left 3   | Pad data 3 (see below).                                         |
| Left 4   | Pad data 2 (see below).                                         |
| Left 5   | Pad data 1 (see below).                                         |
| Left 6   | Pad data 0 (see below).                                         |
| Right 1  | Ground.                                                         |
| Right 2  | 5V, max 100mA supply from console to cartridge.                 |
| Right 3  | Pad clock (see below).                                          |
| Right 4  | Pad latch (see below).                                          |
| Right 5  | Reserved; intended for use with programming or debugging tools. |
| Right 6  | Short to ground to reset the game.                              |

### Pads

Compatible with up to 4 Super Nintendo Entertainment System-like controllers.

The following buttons are defined:

- Face down.
- Face left.
- Select.
- Start.
- Up.
- Down.
- Left.
- Right.
- Face right.
- Face up.
- Left shoulder.
- Right shoulder.

```
  left shoulder                                                right shoulder


           up                                                 face up




left                 right      select   start      face left         face right




           down                                              face down

```

The latch output is pulled to ground most of the time.  Once per 60th of a second, it is pulled to 5V for 12μs.

The clock output is pulled to 5V most of the time.  6μs after the latch output is pulled back to ground, the clock output is pulled to ground for 6μs and back to 5V for 6μs, 11 times.

Every time the clock output is pulled to ground, all attached controllers advance to the next button, in the order defined above.

When the latch output is pulled to 5V, the first button is selected.

Before the clock output is pulled to ground, pad data 0-3 will be pulled to ground by the corresponding controller if the current button is down.

The cartridge is responsible for pull-up to 5V on pad data 0-3.
