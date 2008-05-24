Nauticus addon for World of Warcraft

Official Homepage: http://drool.me.uk/naut

---
Nauticus tracks the precise location of boats and Zeppelins around 
Azeroth and displays them on the Mini-Map & World Map in real-time.

Look up arrival & departure schedules for any transport and know exactly 
when you need to be there. Less time waiting on platforms, more time at 
the AH or mailbox, less time duelling rogues or shammys who want you to 
take a seat while they crit you... 'for fun'...

To track a transport requires that you (or someone else running this 
addon) have taken the route sometime earlier.

Nauticus uses hidden addon-addon communications to synchronise and share 
up-to-date schedule information between players automatically.

For usage options, type /nauticus or /naut in the command line.

If you don't use FuBar (e.g. you use Titan instead), you can right-click 
the Mini-Map button and 'Hide plugin' to get rid of it.

Uses the Ace2 framework (soon Ace3 when it becomes stable).

---
UPGRADING

If you're upgrading from previous Nauticus versions, please make sure to 
DELETE the old folders before extracting; Nauticus, FuBar_NauticusFu, 
TitanNauticus and MapLibrary. MapLibrary is no longer used and FuBar & 
Titan plugins are now integrated. You only need the one folder.

If you're upgrading from ZeppelinMaster, please DELETE the old folders; 
ZepShipMaster, FuBar_ZepMasterFu and TitanZeppelinMaster, before 
extracting this package.

---
TO DO

- auto pop-up tooltip and/or sound arrival/departure alarm (i.e. Zep 
horn or boat bell) when at platform
- new compact UI window, listing schedules for all transports in the
zone, highlighting closest platform when standing still and nearby

Note: Nauticus is in continual development [13th Jan 2008]. You should
always try to keep your version up-to-date - not least because the addon
interacts with other users and they rely on good quality data from you. 
The addon will notify you upon login when there's a new version 
available - after other users are seen using a later version. For this 
reason, please DON'T redistribute or include in a compilation pack!

---
Frequently Asked Questions

Q. I just installed Nauticus, why don't I see any timers?

A player with the addon will need to travel on the boat or Zeppelin 
before the timers come up. This could be you or someone else who may 
have taken the transport earlier - that day, or days ago.

The most recent timers are synchronised between other players who run 
the addon, so after a short while the data will most likely be available 
to you before you take any transport. So get your guild mates and 
friends to install Nauticus too, the more the merrier.

Q. Why are some of my timers wrong?

In rare conditions, timers can become corrupt due to big changes in your 
own system clock that may occur between WoW sessions/reboots. This can 
be caused by dodgy CMOS batteries and some over-clocked systems.

Also, while the realm servers appear to keep very precise clocks for 
running the transports - to generate their positions etc. - from time to 
time they may re-synchronise these clocks, sending the data out of wack 
slightly. (Note: I can only assume this, since I've only seen it happen 
once or twice, but I do know that transports are in sync across all 
realms in a particular geographical location - i.e EU, US Eastern).

Nauticus should quickly fix these timers, as it will gather more recent 
and better quality data from other users or from your own travels.

Q. How does Nauticus get the times?

There are no Blizzard-provided API methods to directly determine the 
transport schedule. Thus we do it indirectly by getting player coords 
and comparing them to a known set of coords along the route.

When the player triggers these coords, we know the cycle and can 
subsequently work out future cycles at any point in time.

Q. How accurate is it?

Round-trip times have been calculated to one millionth of a second (six 
decimal places) over a 4/5 day period, although in reality, accuracy is 
probably around ten thousandth or hundred thousandths of a second.

This is significantly better resolution than provided by the API, which 
only measures in milliseconds (three decimal places). So baring slight 
adjustments in Blizzard's clocks etc., 99.9% of the time there should be 
no observable drift of more than a second or two.

You should urge as many of your guild mates and friends to run the addon 
as possible - even if just in the background - even if they don't use 
transports because they're only ever in Outland. They can help store and 
transmit up-to-date timing data to everyone that needs it.

Q. Why does Nauticus have to use a chat channel?

Because Blizzard's SendAddonMessage() API alone - which was really 
designed and is effectively limited for guild and raid addon comms - is 
insufficient to get the times spread further across your server. This 
ultimately affects availability and accuracy of the times.

You shouldn't be concerned if you have the channel slot spare - we're 
extra careful not to mess up channel numbers. If you experience issues, 
please see http://www.wowwiki.com/Fix_Chat_Channels first.

Q. Can you add the Deeprun Tram?

Unfortunately not, since it's treated like an instance and we can't 
track player coords within an instance.

---
Nauticus is a rewrite of ZeppelinMaster which was authored and conceived 
by Sammysnake - he runs a DKP hosting service online, please support his 
work @ dkphosting.net. Dedicated to hosting for guilds in such games as 
WoW, Everquest, Everquest II and Dark Age of Camelot.

---
The End
