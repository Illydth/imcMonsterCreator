# Illydth's Monster Creator (imcMonsterCreator)
A MapTool Drop in Monster Generation System for 5th Edition (5e) D&D

*NOTE: This system is only intended to support 5th Edition.  While there are definately ways to make this support different
systems (specifically other D&D Based Systems like 4th Edition or Pathfinder 1e/2e, the data JSON is all in a VERY specific
format built from 5th edition resources (namely 5eAPI and 5eTools which we'll get into later), so to generate 4th or 3.5 or
patfhinder monsters you would need to format the resources very specifically.  While the 5eAPI and 5eTools JSON formats are 
fairly standard enough that it's possible, it is WELL outside the socpe of this document or my support of this product to 
try to get it working with anything NOT coming explicitly from 5eAPI or 5eTools.

----
## What is imcMonsterCreator
imcMonsterCreator or Illydth's Monster Creator is a MapTool drop-in framework for creating monsters from JSON, whether pulled
in from an external site (via REST call to a web based API) or via direct import of JSON data via input boxes.  As of right
now, this project is VERY limited on it's imput capabibililties...if you are using 5eAPI and Free SRD Monsters, it is required
that the project be able to go out to either 5eAPI's website or another copy of 5eAPI's website to obtain that JSON.  If you 
are using 5eTools, it is expected that the JSON from 5eTools is being cut/copy/pasted directly into the input boxes provided.
NO other data input is accepted/expected and likely will not be processable since the code is VERY specific to a particular
input format of data.

From an expectations standpoint, I don't see this limitation changing any time in the near future.  I have both 5eAPI and
5eTools running on my own web servers on my own infrastructure and these formats are "good enough" for me.

So why do you want to use this?  Well, if you wish to generate your own monsters from a source like 5eAPI (SRD) or 5eTools
this creator will allow you to generate monsters "In Real Time".  While my recommendation is always for GMs to generate
monsters in between sessions, on that off chance your party runs into a random encounter, it's very much possible to
generate new monsters for combat as needed with just a few seconds worth of work.

What does this generate?  A fully fledged MapTool Token with portait Image and Token Image based around the monster you are 
generating with all abilities, attacks, and actions (such as legendary actions, spells or even lair actions if the JSON allows
for it) as macro buttons on the token.  This means that once generated, these tokens are exportable and usable for play
by exporting them to your Token Library and just dropping them into your campaign.  Does your Orc need to attack with his
Greataxe?  Generate an orc, Click the new Orc token, and click the "greataxe" macro button under attacks.  It will output the
attack information to you, the GM, in chat and give you links to roll the actual attacks and damage dice.

Finally, each token has an easy way to reset the token, modify the token (by modifying the underlying JSON) or to completely
reprocess the token, assuming an update to the underlying data has occured.

With imcMonsterCreator, YOU are in control of the monster.  Need to turn one Orc Token into a Mega-Orc with double the HP and
5 less AC?  You can DO that!

Creating a Homebrew monster based off of an existing monster is as easy as generating the base monster and modifying the things
that need modified.  Once the underlying data is modified you can export the token and forever have a copy of your new homebrew
monster!

----
## Installation
Installing imcMonsterCreator requires a few steps on your part.  These steps are the same regardless of wehther you're installing
this into your own campaign file or into a file specific to generating mosnters.

* First, drop the imcMonsterCreator library onto your Library Map.
* Then drop the "BasicMonster" token on the Library Map as well.
* Create 2 additional maps, one called "Tokens" and one called "Portraits".
* Populate your Tokens map with token images that match the names of the monsters you'll be creating.
* Populate your Portraits map with tokens with images that represent the monster portraits (the pictures that show up on hover over).
* Update your campaign properties to include a new "MonsterBlock" property set.
* Add the properties in the MonsterBlockProperties.txt file included with this archive to this new "MonsterBlock" properties set.
* Update your campaign properties to include a new "LibMonsterCreator" property set.
* Add the properties in the LibMonsterCreatorProperties.txt file to this new "LibMonsterCreator" property set.
* Next, Highlight the imcMonsterCreator library token, scroll down to "ZZZ-Utilities" and click the "setLibProperties" macro.
* Open the Lib:MonsterCreator library and drag the three Olive buttons at the top to your GM pannel.

You should now be ready to use imcMonsterCreator!

### Using the Campaign File and Additional Includes
Along with this archive is a base campaign file.  This file includes some pre-installed Token and Monster portraits for a handfull
of creatures with the Library already setup (with all campaign properties).  This makes for a good "base" Monster Generation
campaign that can be used as the start of your Monster Generator campaign.

Also, becuase I am the maintainer of issSpellStates as well, imcMonsterGenerator is interlinked with issSpellStates.  For those
with both issSpellStates and imcMonsterCreator libraries in their campaigns, the Monster Macros will hoook the Spell states 
code to do things like set conditions and open lookups for spells being cast.  The base campaign file includes issSpellStates
pre-installed as well to support FULL functionality.

----
## Usage

### A Recommended Use
While imcMonsterCreator CAN be used to generate monsters in a "JIT" (Just-In-Time) method, it is far superior/recommended to generate
monsters before you need them.  While it only takes a few seconds to generate a monster, having to generate more than a couple at a time
in the middle of your game session will slow down game play at your table.

Each monster that is generated by this Drop-In is it's own stand alone token with it's own macros and abilities.  Because an Orc is an 
Orc and a Storm Giant is a Storm Giant, once you've created the token for "Storm Giant" there's not really a reason to have to generate 
another one.  Simply Generate the Storm Giant, Export it, move it to your Resource Library, and then any time you need a Storm Giant 
open your Token LIbrary and drag it on to the playing field!

So the recommended way of doing this is to create a new Campaign File SPECIFC to generating mosters.  Create a monster generation 
campaign create the Tokens and Portraits maps, and then load those down with portait and token images for all the monsters you want
to generate!  You'll notice as you start adding token and portrait images to your monster generation campaign that it will start 
expanding the size of this campaign file GREATLY.  A really GOOD reason not to do this within your real game play campaign.

When you know you need a monster in your next session, come to the Monster Generator, generate the monsters you need, export them
to your token library, and they'll be ready to go for you in your next session!

The only requirement for your actual campaign is that the Lib:MonsterCreator library exist in the campaign somewhere.  The macros that
are generated for the creature do require some of the macros on the Library token to properly function.  So having a copy of the Library
in your game play campaign is required. 

This does mean, of course, that you can generate monsters on the fly, and in the case where you don't care about the token images and
where you have easy access to the JSON for the monster (because you have easy access through REST or the availability to cut/copy/paste
the monster JSON easily) this isn't a bad way of doing it...but if you like having a token and portrait images that match the monsters
you're generating, I strongly recommend doing the base monster generation in its own different campaign.

See the User_Manual.txt file for more information.

### Usage Basics

Using imcMonsterCreator is fairly simple all told:
* Open the campaign with Lib:MonsterCreator setup in it.
* Click the "Create New Monster" button in the GM macros.
* Type the full name of the monster into the text box.
* Select the Monster's JSON Source from the list of sources.
* Optionally input the Monster's JSON if needed.
* When the Chat text tells you the monster has been created and is ready to process click the "Process Monster" button.

That's it!  The new token that was generated should populate with bunches of macro buttons for each of it's attacks and abilities, and
it's stat block should show up on Mouse Over with all of the correct properties (such as Strength and Armor Class and HP) as set by
the input data soruce.

Right click the token and Save it, move it to your Token Library, and you now have a new D&D 5e creature to play with in your next
campaign!

(NOTE: Depending on the size of the the Monster (how many different abilities it has) the code can take anywhere from a few seconds to
many seconds (10 - 30?) to fully generate the monster.  If your campaign seems to "hang" after clicking the "Process Monster", give it 
a 20 count before you get concerned it's crashed.  A monster like an Illithilich can take a LONG time to process given it has somewhere
in the neighborhood of 20 - 40 individual abilities.

----
## Documentation, Support and Issues

This drop-in is mostly for my own use in creating mosnters for my campaign.  I am not intending to add sources, expand options or
otherwise enhance this beyond it's current capabilities.  I will be doing any periodic bug fixing I can so reporting issues with 
the code is useful.  That said, there is a LOT going on behind the scenes...and there may be a situation for which specific input JSON
for specific monsters in 5e aren't functioning properly.  If it's too much work, I may simply not support that monster, even though
it's much more likely I'll fix it.  The data sources in use by the drop-in can be...non-standard at times.

The best way of dealing with imcMonsterCreator is to open the "Using_imcMonsterCreator_by_Example.txt" file and just walking through it.
That will take you step-by-step through the campaign file and using it to generate a few different types of monsters from very basic to 
very complex.  It will walk through the base utility macros as well as the generated macros and how output works and a host of other
things that would take me way too long to detail here.

The User_Manual.txt file includes a full writeup on the application should the "by Example" text not cover something.

----
## Changelog
* 27-Jul-2020 Inital Creation of this ReadMe