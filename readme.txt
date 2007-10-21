Nauticus v2.2.0

http://drool.me.uk/naut

---
Nauticus tracks the precise location of boats and Zeppelins around 
Azeroth and displays them on the Mini-Map & World Map in real-time.

Look up arrival & departure schedules for any transport and know exactly 
when you need to be there. Less time waiting on platforms, more time at 
the AH or mailbox, less time duelling rogues or shammys who want you to 
take a seat while they crit you... or 'for fun'...

To track a transport requires that you (or someone else running this 
addon) have taken the route sometime earlier.

Nauticus uses hidden addon-addon communications to synchronise and share 
up-to-date schedule information between players automatically.

For usage options, type /nauticus or /naut in the command line.

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

- new icons, rotated in real-time to point in the direction of travel 
(cached matrix transformations ftw)
- support non-round mini maps (this is up to the author of Astrolabe)
- show multiple transport details in tooltip when mousing-over map icons 
which are too close together to pick out due to overlap
- detect closest platform to auto pop-up tooltip and/or sound 
arrival/departure alarm when nearby (i.e. Zep horn or boat bell)
- new compact UI window, listing schedules for all transports in the 
zone, highlighting closest platform when standing still and nearby
- more compact bar plugin tooltip to show schedules for all transports 
in the zone, highlighting closest

Note: Nauticus is in continual development [17th Oct 2007]. You should 
always try to keep your version up-to-date - not least because the addon 
interacts with other users and they rely on good quality data from you.

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
and comparing them to a known set of coords along the route - usually 
far out to sea, where they would otherwise not be seen.

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

Q. Can you add the Deeprun Tram?

Unfortunately not, since it's treated like an instance and we can't 
track player coords within an instance.

---
Nauticus is a rewrite of ZeppelinMaster which was authored and conceived 
by Sammysnake - he runs a DKP hosting service online, please support his 
work @ dkphosting.net. Dedicated to hosting for guilds in such games as 
WoW, Everquest, Everquest II and Dark Age of Camelot.

---
Changelog

v2.2.0
- NEW: icons plotted on world and mini maps in realtime with tooltips!
- NEW: goblin chat filter, blocks annoying zeppelin master yell spam
- integrated FuBar and Titan plugins into core folder
- added chinese traditional & simplified translation (thanks Juha)
- new slash command handler with more options
- new sync comms, uses hidden guild/raid instead of chat where possible
- rate quality of timer data by num reboots & swaps and promote best
- calc more accurate pos when trigger coords by extrapolating distance
- lots of performance improvements while testing for trigger coords
- detect and discard corrupt timers after system reboot/clock change
- FIX: recalibrated durotar-tirisfal route which changed in patch 2.2
- FIX: main gui window crawling to the left when minimised
- lots of little GUI fixes between bar plugins and core


v2.1.4
- FIX: ignore negative (future) timers when received from others (where
system bios/clocks reset between reboots, it can corrupt the time data)
- compensate for network lag when sending and receiving sync data


v2.1.3
- now using AceLocale properly for all localisations:
 - put remaining few hard-coded language strings into locale files
 - added complete German translations - many thanks to Alex6002!
stretched options window/buttons slightly to fit them
 - included bare-bones French localisation file - if anyone can provide
a full translation, please edit the local.frFR.lua and send it back to
me, it'd be much appreciated! (if anyone can provide translations for
other languages, go right ahead)
- cleaned up dropdown menu code, removing quite a few wasteful variables
etc. (think that was the last bit of untouched code since ZepMaster):
 - transport list in dropdowns is now consistent across main ui and
Titan/Fu bars - same ordering etc., clicking bar button now cycles in
correct order depending on what zone/faction filters you have
 - properly shows a tick beside the currently selected transport
- revamped main ui:
 - added tooltip info to widgets to make it clear what they do
 - layout changed to be in line with Titan/Fu bar tooltip display,
primarily to allow for longer strings in localisations that need them
 - dropdown button shrunk to save space, auto-hides when not needed
 - other funky fade thing going on when minimising main ui


v2.1.2
- removed MapLibrary from the package as optional dependency in favour
of embedded Astrolabe by Esamynn which does the same job but with more
up-to-date zone coordinates and better efficiency, it will also be used
in a later version to render icons on the world/mini maps. you should
remove the MapLibrary folder entirely if no other addons depend on it
- lots and lots of internal code cleanup:
 - more performance and memory improvements when accessing all-sorts of
internal table data
 - split the code into separate file modules (suggest to delete your
previous Nauticus directory before extracting this version)
 - moved all remaining global functions into single Nauticus (Ace)
object (yes the main addon is now Ace'd, using the better event driver
for now - AceComm to follow, see below...)
- previous versions used the local system clock to keep track of the
times, resulting in wildly innaccurate timings due to drifting clocks
(some overclocked systems and where the clock is sync'd over the 'net etc.)
- now refreshes the main UI window flip direction while dragging
- zero-padded timers to be a bit more human readable
- recalibrated all transport round-trip-times (again, but using the
right formula to work it out properly this time - d'oh). accuracy should
be *significantly* improved now! i.e. assuming Blizzard's server clocks
don't drift much (which they rarely seem to do), our timers shouldn't
drift by more than a second or three for every coupla days without new
sync or trigger data
- completely rewritten sync logic, replacing request-response with
delayed differential tell mechanism. what this means is significantly
reduced bandwidth needed to exchange timers, by ensuring only new data
is broadcast and by one person instead of everyone who thinks they know
it all (thus it scales extremely well when lots of people are in the
sync channel). AceComm will be used in the next revision when the Ace
team have fixed a small bug.


v2.1.0
- fixed main gui crawl when toggling window with /naut or changing zone
when zone contains transport and option to show GUI when zone change is
enabled
- fixed cmd typo in chatlog when closing main GUI
- fixed timer readouts - would occasionally show 60s instead of 1m etc.
- removed tigger age debug info from fubar tooltip panel (was for my
purposes but in future will provide this kinda data once properly formatted)
- active transport selection now remembered between logons (per
character setting)
- the alt-click audio alarm can be changed from the default of 20secs
with '/naut alarm X' where X is number of seconds prior to departure
when you want the first bell to sound
- recalibrated auberdine and theramore transports - blizzard shortened
them significantly, by round-trip-times of ~29 and ~46s respectively
- timers are no longer dumped when a server reboot/shutdown is observed
- CHANGE: timer data now persists across reboots!


v2.0.0
- IMPORTANT: in the name of biaslessness (is that a word?), the addon's
name has been changed to *Nauticus*! you should DELETE your old
ZeppelinMaster folders (ZepShipMaster, FuBar_ZepMasterFu and
TitanZeppelinMaster) before you extract this package!
- fixed some bizarrely wrong round-trip-times made in the last update
- re-calibrated each route to provide vastly more accurate
platform-to-platform and docking times (may need a few more tweaks but
it's very very close now)
- main ui visibility settings (shown/minimised) now saved per character
- cycle time algorithm improvement yet again - is about as efficient as
it can possibly ever be now (i.e. very)
- NEW: route added - Feathermoon Stronghold (Sardor Isle) to The
Forgotten Coast (Feralas)
- NEW: route added - Azuremyst Isle (The Exodar) to Auberdine


v1.94
- major code cleanup. note: settings will be reset to defaults (except
Titan and Fu). removed all globals. removed all remaining non-language
code from localisation files - if anyone can help with translations for
fr, es and any other locales, please contact me (german and korea
locales also incomplete)
- MapLibrary's IsInInstance check was broken, now using Blizz's new(ish)
api call. this also fixes performance issues in instances if using
AlphaMap (thanks to Telic the author for working with me on this). also
an extra check is made if AlphaMap's frame is visible, to stop forcing
map zoom when getting coords. please note: transit coords may not
trigger if you're browsing the world map (or AlphaMap or MetaMap etc.)
at the moment of trigger - especially when you're looking at another
continent
- now detects if player is (not) swimming, so as not to trigger transit
coords (rare but was possible)
- improvement to main ui window:
 - options dialog now anchored to centre of screen by default instead
of main window
 - uses proper widgets, bigger, better
 - minimises into much smaller bar with new icon
 - NEW: if window is moved to bottom half of screen, the main body is
'flipped' above the title bar, making better space for when minimised
- fix word wrap in Titan tooltip hint text (was too long)
- cycle times have been re-calibrated (only the full round-trip lengths
for now). over a long period without sync from other players, times
should drift apart significantly less so. next revision (for TBC) will
see a) precise platform-to-platform and accurate docking times, b)
better positioned trigger coords and c) internally, ZM will know the
precise transport coords at any moment in time (for later use, see below)
- yet more optimisations to the cycle time algorithm. in future, the
algorithm will be efficient enough to potentially show times for all
routes at the same time (though, the plan is to show an icon for each
vessel on the world map, plus on the minimap for the current zone a la
Gatherer with tooltips).


v1.93
- fixes some routes not triggering properly when using MapLibrary and
player position not visible on map i.e. far out to sea
- fix error after login when using detached FuBar tooltips
- corrected english non-alias name for wetlands (was menethil) <==> to
dustwallow route
- checks player position less frequently now
- sync protocol slightly different - most sync data is the same, but
triggered routes won't be sent between versions prior to 1.93. get your
friends to update! this was to remove hardcoded values, making it easier
to re-calibrate the times in a (very near) future update. data is also
much less spammy when players login (you won't notice it, but always
good on resources)
- NEW Titan/FuBar feature: Alt-click on button to set up a one-time-only
audio (trumpet) alarm 20 seconds (will make it configurable in next
version) from departure and a 'ding ding' at zero



v1.92a
- fixed stack overflow bug in MapLibrary when exiting bg if battlefield
map shown
- when not using the MapLibrary optional dependency, logging into WoW
directly inside an instance would give an error (however i highly
recommend you keep using MapLibrary with ZM!)


v1.92
- major performance improvement: finally fixed the long-standing memory
consumption issue, using new data structures. increasing rate reduced
from ~60Kb/s when active transport selected to less than 0.1Kb (normal
background radiation levels basically)


v1.91
- NEW FuBar plugin!
- compacted main ui options dialog
- merged duplicated transport coord data from several localisation
files, improving memory usage and startup times a bit
- stopped main ui text needlessly being updated every few frames and
some unnecessary calcs when no transport selected / no times avail..
(should now use practically zilch resources when no transport selected,
except for when sync'ing)
- many many optimisations to the cycle time calculation, removing some
unnecessary code
- Titan code revamp
 - moved artwork from Titan to main core folder for sharing with FuBar
plugin (please delete old folders before upgrading)
 - muchos performance increase: removed expensive (and duplicated)
cycle time calculations for both tooltip and button text, takes
pre-calc'd info from main core instead
 - fixed rare bug when sometimes showing tooltip for first time?
 - fixed city alias option not working for platform names in tooltip
 - added hint, much better formatted and coloured tooltip


v1.90 (new maintainer Drool)
- fixes for lua 5.1 code changes (patch 2.0)
- optional dependency MapLibrary (slightly modified with patch 2.0
fixes) included
- suppress chat spam when logging on / retrieving sync data
- fixes issue where player could only update own times for each
transport once per session(!)
- significant performance improvements:
 - only polls transport exit coords when player is moving and not in an
instance
 - faster and more accurate proximity check algorithm
 - player location polling: uses MapLibrary to get coords, without
needing to zoom the map and subsequently generating tonnes of
WORLD_MAP_UPDATE events, several every frame(!)
- Titan support: fixed UIDropDownMenu error, added version number,
rearranged menu


v1.86
- fix for some popup errors (maybe)
- fix for data being reset because bugged timestamp
- stopped gui from showing on zone by default (amazing how many people
couldn't find the options)


v1.83
- possible fix for Too many buttons in UIDropDownMenu
(not sure if fixed 100%)


v1.82
- bugfix: Loading error that occured if you didn't have titan panel
installed
- Titan: Icons replaced words Arrival(green arrow) +Departure (red arrow)
- Popup Error Fix


v1.8
- Better data sharing
- Support for titanbars (You need ZeppelinMaster base addon for titanbar
portion to work)


v1.74
- Popup error fix
- Fix for data being reset between sessions
- Timestamps fix


v1.7
- Timestamps fix


v1.5-v1.61
- GUI improvements
- Options Panel
- Coordinates fix for Titan
- fix for v1.6, dropdown list wasn't working properly


v1.4
- New improved syncronization and proper aging of data
- Metamap fix


v1.3 - Popup Error Fix
v1.2 - Better syncing functions
v1.1 - Channel fix + Ship tracking
v1.0 - Initial Release


---
The End
