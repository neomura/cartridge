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

Compatible with up to 4 Nintendo Entertainment System-like controllers.

The following buttons are defined:

- Face right.
- Face left.
- Select.
- Start.
- Up.
- Down.
- Left.
- Right.

```

           up




left                 right      select   start      face left         face right




           down

```

The latch and clock outputs are initially pulled to 5V.

When the cartridge wishes to poll its pads for input, it:

- Pulls the the latch output to ground.
- Waits 6μs.
- Reads the state of the face right button from pad data 0, 1, 2 and 3.
- Pulls the clock output to ground.
- Waits 6μs.
- Pulls the clock output to 5V.
- Waits 6μs.
- Reads the state of the face left button from pad data 0, 1, 2 and 3.
- Pulls the clock output to ground.
- Waits 6μs.
- Pulls the clock output to 5V.
- Waits 6μs.
- Reads the state of the select button from pad data 0, 1, 2 and 3.
- Pulls the clock output to ground.
- Waits 6μs.
- Pulls the clock output to 5V.
- Waits 6μs.
- Reads the state of the start button from pad data 0, 1, 2 and 3.
- Pulls the clock output to ground.
- Waits 6μs.
- Pulls the clock output to 5V.
- Waits 6μs.
- Reads the state of the up button from pad data 0, 1, 2 and 3.
- Pulls the clock output to ground.
- Waits 6μs.
- Pulls the clock output to 5V.
- Waits 6μs.
- Reads the state of the down button from pad data 0, 1, 2 and 3.
- Pulls the clock output to ground.
- Waits 6μs.
- Pulls the clock output to 5V.
- Waits 6μs.
- Reads the state of the left button from pad data 0, 1, 2 and 3.
- Pulls the clock output to ground.
- Waits 6μs.
- Pulls the clock output to 5V.
- Waits 6μs.
- Reads the state of the right button from pad data 0, 1, 2 and 3.
- Pulls the latch output to 5V.

The cartridge is responsible for pull-up to 5V on pad data 0-3.
