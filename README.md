![ArchLinux](https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Arch_Linux_logo.svg/375px-Arch_Linux_logo.svg.png)

My configurations for arch linux

## vimrc
- [Gruvbox Theme](https://github.com/morhetz/gruvbox/tree/master/colors)

## How to change Touchpad Settings
#### Requirements
- ibinput
- local/xf86-input-libinput
#### Steps
- List devices
`libinput list`
- Disable/Enable device to check if the device number is correct
`libinput disable device-number`
`libinput enable device-number`
- List properties
`libinput list-props`
- Set property
`libinput set-prop device-number prop-number value`
