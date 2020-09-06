<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
    <match target="font">
        <edit mode="assign" name="antialias">
            <bool>true</bool>
        </edit>
        <edit mode="assign" name="embeddedbitmap">
            <bool>false</bool>
        </edit>
        <edit mode="assign" name="hinting">
            <bool>true</bool>
        </edit>
        <edit mode="assign" name="hintstyle">
            <const>hintslight</const>
        </edit>
        <edit mode="assign" name="lcdfilter">
            <const>lcddefault</const>
        </edit>
        <edit mode="assign" name="rgba">
            <const>rgb</const>
        </edit>
    </match>
    <alias>
        <family>serif</family>
        <prefer>
            <family>Noto Serif</family>
            <family>Cantarell</family>
            <family>Inter</family>
            <family>Roboto</family>
            <family>Joy Pixels</family>
            <family>Noto Color Emoji</family>
        </prefer>
    </alias>
    <alias>
        <family>sans-serif</family>
        <prefer>
            <family>Noto Sans</family>
            <family>Inter</family>
            <family>Roboto</family>
            <family>Open Sans</family>
            <family>Joy Pixels</family>
            <family>Noto Color Emoji</family>
        </prefer>
    </alias>
    <alias>
        <family>monospace</family>
            <family>Iosevka</family>
            <family>Joy Pixels</family>
            <family>Noto Color Emoji</family>
        <prefer>
        </prefer>
    </alias>
</fontconfig>
