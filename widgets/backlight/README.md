## Awesome Widget to control backlight

### Requirements:
This widget depends on **xbacklight** or **acpilight** program, so you need one. You ask: What the difference? Let me explain below:
* **xbacklight** - desined to use with Intel video cards only, so it have enough problems with proprietary devices. I've recommended this one only if you don't have external monitor. If you have one, so after plug it in, your LapTop will be freezing from time to time, you need to disable this widget temporary.
* **acpilight**  - modern replacement for _xbacklight_. I recommend to use this one, if there no problems with maximum level of brightness, or at least you should use udev rules from here, to avoid permission lackness for _/sys/class/backlight/acpi_video0/brightness_

> I really don't know which one better, they both suck... 

### Acpilight

[Link](https://github.com/wavexx/acpilight/)

> As a bonus acpilight can control keyboard backlight too!

### For xbacklight you should chande widget code:

```bash
local brightness_bin_init         = "sudo bash -c 'echo 100 > /sys/class/backlight/acpi_video0/brightness'"
local brightness_level            = tonumber(string.format("%.0f", stdout))
``` 

### In case of permission problems:

```bash
local brightness_bin_init         = "sudo bash -c 'echo 100 > /sys/class/backlight/acpi_video0/brightness'"
local brightness_bin_set          = "sudo xbacklight -set "
local brightness_bin_get          = "sudo xbacklight -get"
local brightness_inc_level_to_10  = "sudo xbacklight -inc 10"
local brightness_dec_level_to_10  = "sudo xbacklight -dec 10"
```

> And don't forget to add you user in sudoers with NOPASSWD:ALL 
 
### Key bindings:
* **mouse left key**    - set brightness level to 100% and initialisation. Press this button in case of any problems with brightness level.
* **mouse right key**   - set brightness level to 10%.
* **mouse wheel up**    - Increase brightness level by 10%   
* **mouse wheel down**  - Increase brightness level by 10% 

### Screenshot
![backlight](backlight.png)

### Icons
![high](display-brightness-high.svg)![medium](display-brightness-medium.svg)![low](display-brightness-low.svg)![off](display-brightness-off.svg)
