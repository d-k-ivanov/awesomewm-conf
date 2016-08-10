Shows memory status (in MiB) in a textbox.

```lua
mymem = lain.widgets.mem()
```

### input table

Variable | Meaning | Type | Default
--- | --- | --- | ---
`timeout` | Refresh timeout seconds | int | 2
`settings` | User settings | function | empty function

in `settings` you can use the following variables:

Variable | Meaning | Type
--- | --- | --- | ---
`mem_now.used` | Memory used (in MB) | string
`mem_now.swapused` | Swap memory used (in MB) | string
`mem_now.perc` | Memory percentage | int

### output

A textbox.
