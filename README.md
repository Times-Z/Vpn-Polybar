# Vpn Polybar

VPN module for openfortivpn and openvpn to view status and toggle vpn
## Dependencies
- OpenVPN | OpenFortiVPN
- Yad (Yet Another Display)
- Polkit

## Configuration

You can set `VPN_PATH` in vpn.sh.
This is used for Yad started path

By default the script is set to `$HOME`

You can change color and icon displayed in vpn.sh.

## Usage

- No VPN connection : ![Demo gif](./.assets/no_vpn.png)
- Vpn connected (the name is config file name) : ![Demo gif](./.assets/vpn_connected.png)

Example module for polybar

```ini
[module/vpn]

type = custom/script
interval = 1
exec = ~/.config/polybar/scripts/vpn.sh --show
click-left = ~/.config/polybar/scripts/vpn.sh --toggle

```
## Demo
![Demo gif](./.assets/demo.gif)