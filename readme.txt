Nauticus @project-version@ - A World of Warcraft addon

Official Homepage: http://drool.me.uk/naut

---
Nauticus tracks the precise arrival & departure schedules of boats and Zeppelins 
around Azeroth and displays them on the Mini-Map and World Map in real-time.

Look up arrival & departure schedules for any transport and know exactly when 
you need to be there. Less time waiting on platforms, more time at the AH or 
mailbox, less duelling rogues or shamies who want you to take a seat while they 
crit you... 'for fun'...

To track a transport requires that you, or someone else running the addon, has 
taken the route sometime earlier. Nauticus uses hidden addon-to-addon 
communications to synchronise and share up-to-date schedules between players 
automatically.

Important: This addon works best the more players on your realm also using the 
addon. So get your friends and guild mates to install Nauticus - the more the 
merrier! Even if you don't use transports because you're only ever in Outland, 
you can help store and transmit up-to-date data to everyone that needs it. 
Nauticus performs well in the background and you can disable the map icons for 
zero interference.

---
Main Features

 * Plots all (16) Horde, Alliance and neutral transports on the World Map in
   real time
   * Displays the most relevant transports on the Mini-Map, based on your
     current zone
   * Map icons rotate to show their actual direction at any point in time
   * Shows arrival or departure schedule for each platform when you mouse-over
     any map icon
 * Discovers schedule by travelling a route in either direction
   * Calculates future schedules, based on precisely measured round-trip cycles
 * Automatically share schedules with other users of the addon on your realm
   * Differential delayed updates keep communication bandwidth low even with
     many users (O(1))
   * Ranks quality of data based on number of reboots and swaps, always picking
     the best
 * Remember schedule data even after computer reboot (see FAQ for caveat)
 * Select any transport for viewing in any LibDataBroker (LDB) display addon.†
   * Shows the next arrival or departure event in the button text.
   * Button icon changes colour to indicate status (yellow = docked, red = about
     to depart, green = in transit)
   * Auto-selects nearest transport when standing at a platform (optional)
   * Alt-click button to manually set audio alarm to warn you before next
     departure
 * Less spam: Filter ship crew talk and Zeppelin Master yells from your chat
   window (optional)

† If you're new to Broker plugins, they're a bit like FuBar plugins but 
displayed how you want. Try StatBlockCore, Button Bin or Fortress for display 
addons. Titan has LDB support built-in. FuBar requires the lightweight bridge 
addon Broker2FuBar (not to be confused with FuBar2Broker, which does the opposite).

---
Usage

Find out the status of a transport via World Map/Mini-Map or via an LDB button 
display.

For options, type /nauticus or /naut in the command line.

---
TO DO

 * Auto pop-up tooltip and/or sound arrival/departure alarm (i.e. Zeppelin horn
   or boats bell) when at platform

Nauticus is always in continual development. You should try to keep your version 
up-to-date, not least because the addon interacts with other users and they rely 
on good quality data from you. You'll be notified upon login when there's a new 
version available, after other users are seen using a later version. For this 
reason, please DON'T redistribute or include in a compilation pack!

---
Frequently Asked Questions

Q. I just installed Nauticus, why don't I see any schedules?
A player with the addon needs to travel on the boat/Zeppelin/turtle before the 
schedules come up. This could be you or someone else who may have taken the 
transport earlier. The most recent schedules are synchronised between other 
players running the addon, so after a short while the data will most likely be 
available to you before you take any transport. Get as many of your friends and 
guild mates to install Nauticus - the more the merrier.

Q. How does Nauticus get the schedules?
There are no Blizzard-provided API methods to directly determine the transport 
schedule. Thus we do it indirectly by getting player coords and comparing them 
to a known set of coords along the route. When the player 'triggers' these 
coords, we know the cycle and can subsequently work out future schedules at any 
point in time.

Q. How accurate is it?
Round-trip cycles have been calculated to one microsecond (six decimal places) 
over a 1-2 week period. This is significantly better resolution than provided by 
the API, which only measures in milliseconds (three decimal places). Baring 
slight adjustments in Blizzard's clocks etc., 99.9% of the time there should be 
no observable drift of more than a second or two.

Q. Why are some of my schedules wrong?
Rarely, schedules can become corrupted due to changes in your computer's system 
clock that may occur between WoW sessions/reboots. This can also be caused by 
dodgy CMOS batteries and some over-clocked systems. Otherwise, Nauticus can 
normally keep track of schedules between reboots. Additionally, while realm 
servers appear to keep very precise clocks for running the transports and to 
generate their positions, from time to time they may re-synchronise these 
clocks, sending the data slightly out of wack. Nauticus should quickly fix the 
schedules, as it will gather more recent and better quality data from other 
users or from your own travels.

Q. Doesn't weekly maintenance ruin the schedules?
It doesn't! We can only assume how Blizzard calculates transport schedules and 
their positions but it's probably based on the realm server's system clock, 
which is likely synchronised with a centralised ntp time server at each data 
centre. You can verify this by visiting another realm (at least, in the same 
geographical location - e.g. EU, US Eastern) to observe exactly the same 
schedules. This is another way to obtain accurate schedule data - from other 
realms. If there is one, an epoch is presently unknown - if any maths wiz can 
manage to reverse engineer it (simultaneous equations?), do let me know!

Q. Why does Nauticus have to use a chat channel?
Blizzard's SendAddonMessage() API is effectively limited to guild and raid addon 
communication, which is insufficient to get data spread furtherest across your 
realm. For maximum availability and accuracy of schedules, we need to use a chat 
channel. You shouldn't be concerned if you have the channel slot spare - we're 
extra careful not to mess up channel numbers.

Q. Where did the GUI disappear to?
The red window was removed in favour of map icons with tooltips. It became 
difficulty to maintain the rather clunky code necessary to provide this 
functionality and consumed more resources than desirable. Plus it didn't cater 
for other languages very well due to its fixed size. Native FuBar support was 
removed in favour of LibDataBroker (Broker/LDB) displays. Broker allows you to 
choose your method of displaying plugins. The lightweight bridge addon 
Broker2FuBar returns the old FuBar functionality, as well as allowing you to put 
it as a Mini-Map button (even if you don't use FuBar).

Q. Can you add the Deeprun Tram?
Unfortunately no, since it's treated as an instance and we can't properly track 
player coords within instances.

---
Nauticus is a complete rewrite of ZeppelinMaster which was originally conceived 
by Sammysnake. He runs a DKP hosting service @ dkphosting.net.

---
The End
