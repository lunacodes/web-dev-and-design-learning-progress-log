# VVV Troubleshooting

For usual `scp` issue, the solution was either:

1. Installing Ruby
2. Going to `/etc/ssh/sshd_config/` and uncommenting the following lines:

```bash
Port 22
AddressFamily any
ListenAddress 0.0.0.0
ListenAddress ::
```
