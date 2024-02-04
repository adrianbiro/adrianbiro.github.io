# Randomize IMEI Banana Phone (SK comments with EN links)

IMEI consists of 15 digits:

* The first 8 digits offer information regarding phone manufacturers and telephone models. These digits are also known as TAC ([Type Allocation Code](https://en.wikipedia.org/wiki/Type_Allocation_Code)). [List of TAC numbers](https://deviceatlas.com/blog/list-tac-numbers)
* The next six digits are the serial number of the device.
* The last digit is the checksum and is calculated based on the Luhn algorithm.

[Central Equipment Identity Register Wiki](https://en.m.wikipedia.org/wiki/Central_Equipment_Identity_Register)

[IMEI list](https://wiki.lunardao.net/imei_tables/imei_table.html)

[International Mobile Equipment Identity Wiki](https://en.m.wikipedia.org/wiki/International_Mobile_Equipment_Identity)

[Luhn algorithm to verify IMEI](https://en.m.wikipedia.org/wiki/Luhn_algorithm)

[Mobile Equipment Identifier](https://en.m.wikipedia.org/wiki/Mobile_equipment_identifier)

[Random IMEI Generator](https://randommer.io/imei-generator)

[Your Hardware Identifiers: Your IMEI and IMSI (and by extension, your phone number)](https://anonymousplanet.org/guide.html#your-imei-and-imsi-and-by-extension-your-phone-number)

[**(Do not work)** How to change IMEI on Snapdragon devices](https://gist.github.com/uragiristereo/7668e067e3b0525d6e4d4b12d9f71344)

**Zdroj je `Wilder`, ja som to len dal na kopu.**

[Randomize IMEI](https://wiki.lunardao.net/imei.html)

[Buy Phone Here](https://www.ebay.com/itm/334453181568?mkcid=16&mkevt=1&mkrid=711-127632-2357-0&ssspo=wbfpagljtyk&sssrc=2349624&ssuid=4oWDhqGLSUO&var=&widget_ver=artemis&media=MORE)

IMEI on android
> To show *IMEI*, *ICCID* and *SN* on android. <br>
> Go to **phone app** and write `*#06#`

Ten postup bol trochu komplikovany, takže v skratke - na zaciatku potrebujete [temporary root](https://sites.google.com/view/bananahackers/root/temporary-root?authuser=0).

Nasledne, ked vám to hodi root shell cez adb, tak cez ten Web IDE (eg. PaleMoon) [install omnisd](https://sites.google.com/view/bananahackers/install-omnisd?authuser=0)
(to vam ale nepojde na prvykrat):

Stlačíte `#` a rebootne sa vam to do režimu s developers options - tam zapnete dbugger `ADB a DevTools`.

Potom zopakujete celý postup po instalaciu `OmniSD` a máte to tam. A potom nainštalujete Wallace Toolbox:

[temp root](https://sites.google.com/view/bananahackers/root/temporary-root?authuser=0)
nezabudnite telefon hodit vždy do debug modu `*#*#33284#*#*` (on Qualcomm), or in addition `*#*#0574#*#*` (Spreadtrum)
to enable the USB debugging;
plus zapnut redirect portu `6000`:

`db forward tcp:6000` `localfilesystem:/data/local/debugger-socket`

Spustite `PaleMoon`, v `Tools / Web-developer / WebIDE`, remote runtime vpravo, do toho zadať `localhost:6000`,
vľavo najst appku, co chcete nainstalovat na telefon `Open Packaged App`, nájsť folder s appkou, a kliknut `Play`.
