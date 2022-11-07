# List audio devices

`pactl list`

You can obtain a list the playback devices (for an Audio Sink) using the `aplay` program. 

`aplay -L`

`arecord -L`

`arecord -l`


# How to build an ALSA monitor:


ALSA monitor source

To be able to record from a monitor source (a.k.a. "What-U-Hear", "Stereo Mix"), use pactl list to find out the name of the source in PulseAudio (e.g. alsa_output.pci-0000_00_1b.0.analog-stereo.monitor). Then add lines like the following to /etc/asound.conf or ~/.asoundrc:

<!-- pcm.pulse_monitor {
  type pulse
  device alsa_output.pci-0000_00_1b.0.analog-stereo.monitor
}

ctl.pulse_monitor {
  type pulse
  device alsa_output.pci-0000_00_1b.0.analog-stereo.monitor
} -->

Now you can select pulse_monitor as a recording source.

Alternatively, you can use pavucontrol to do this: make sure you have set up the display to "All input devices", then select "Monitor of [your sound card]" as the recording source. 

```
pcm.pulse_monitor {
  type pulse
  device alsa_output.pci-0000_0c_00.3.analog-stereo.monitor
}

ctl.pulse_monitor {
  type pulse
  device alsa_output.pci-0000_0c_00.3.analog-stereo.monitor
}
```