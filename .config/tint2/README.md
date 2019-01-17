# Tint2

* Read more about [tint2 here.](https://gitlab.com/o9000/tint2)
* Volume Indicator will be missing. Workaround with [PNMixer](https://github.com/nicklan/pnmixer), add PNMixer to autostart application.
* Add Tint2 to autostart system.
* Missing application indicators (Like Telegram, Slack, Albert!) in panel? Here is the fix:

```sh
$ sudo apt purge indicator-common indicator-application -y
# reload tint2 or simply reboot your server!
# Indicators should be shown in panel now.
```
