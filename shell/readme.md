# [neomura/cartridge](./readme.md)/Shell

Neomura cartridges contain not only the game data, but also the CPU, RAM and audio/video generation electronics; by contrast, consoles are somewhat breakout boards.

## Physical dimensions

### PCB

The Neomura cartridge format is intended to contain a 42x40.37mm PCB, a little more than 16.5x15.5 2.54mm pads with enough clearance for most common through-hole components.  0.68mm of margin on the left, top and right sides must be kept clear except for the pin headers.

### Engravings

On the front are a "pill-shaped" "grip" area featuring the Neomura logo, an area for a 40x30mm label, and an arrow directing the user to insert it into the cartridge slot.

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

A male 15-pin 2.54mm pin header is present on the underside.

From the front, left to right, its pins are:

- Ground.
- NTSC composite video output (yellow); expects 75ohm impedence.
- Left audio output (white); expects 75ohm impedence.
- Right audio output (red); expects 75ohm impedence.
- Reserved for future use.
- Reserved for future use.
- Pad latch (see below).
- Pad clock (see below).
- Pad data 0 (see below).
- Pad data 1 (see below).
- Pad data 2 (see below).
- Pad data 3 (see below).
- Reset A; connect with reset B to reset the game.
- Reset B.
- 5V, max 250mA supply from console to cartridge.

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
