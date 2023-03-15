# ROMSplit
ROMSplit is a utility to create masked ROM binary files for vintage Macintosh computers.
Restoring a vintage Motorola 68000 family Macintosh computer to working order can be fun and profitable.
It can also be challenging and frustrating especially when hardware has been damaged and components are 
no longer being manufactured.

One critical component are the Mac's ROM chips which contain, among lots of other resources, the code 
needed to boot the machine.  It's not uncommon for these ICs, whether socketed, or solder to the motherboard
to become unreadable, and finding a set of ROMs from another machine is becoming increasingly difficult.

Fortunately, Macintosh ROM data is available on the internet at sites like Macintosh Repository.  These ROM 
files are typically used to emulate an obsolete Mac using programs like Basilisk II and SheepShaver.  Unfortunately, the 
ROM data is not separated or organized into the binary data that's contained on the Mac's masked ROMs.

I wrote ROMSplit to create the binary files needed to burn EEPROMs to replace damaged masked ROMs.
