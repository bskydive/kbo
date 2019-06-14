# Маршрутизаторы

## Dd-wrt

```
mtu 1500 manual
vpn passthrought
reboot 
radio
disable telnet, ssh,web, spi firewall
```

### schedule reboot

```
administration--keep alive
http://192.168.1.1/Alive.asp
```

### remote access

```
administration -- management
http://192.168.1.1/Management.asp
maximum ports:32768
```

### disable internet

 * access restrictions

### disable radio

 * services--services

### vpn

 * security--vpn passthrought

 
