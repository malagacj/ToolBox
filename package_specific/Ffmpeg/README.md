# Ffmpeg

## Installation
```
apt install ffmpeg
```

## Prerequisites
Login in to Debian Xorg

## Sample commands
### Record simple video
```
ffmpeg -f x11grab -i :0.0 out.mkv

ffmpeg -y -i /dev/video0 out.mkv
```

### Finding out audio device
```bash
$ arecord -l
**** List of CAPTURE Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC298 Analog [ALC298 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```
Take note of the device, in this case it is card 0!!

### Record video + audio at the same time
Use device 0 as the audio input device "hw:0"

```
ffmpeg -f x11grab -i :0.0 -f alsa -i hw:0 out.mkv
```
