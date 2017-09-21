## Awesome Widget for Dropbox

### Requirements:
* This widget depends on dropbox-cli program, so you need one, if your linux distribution does not provide one read next section.
 
### Replacing status binary:
Some linux distribution have only *dropbox* program to get status, and if your linux in that class, you need to replace variable *status_bin_cmd*:
```lua
-- Old:
-- local status_bin_cmd    = "dropbox-cli status"
 
-- New:
local status_bin_cmd    = "dropbox status"
```

### Screenshot
![dropbox](dropbox.png)

### Icons

![logo](dropboxstatus-logo.png)![idle](dropboxstatus-idle.png)![busy1](dropboxstatus-busy1.png)![busy2](dropboxstatus-busy2.png)![x](dropboxstatus-x.png)
