/// Some defines for items the daemon forge can create.
#define NARSIE_ARMOR "Nar'Sien Hardened Armor"
#define FLAGELLANT_ARMOR "Flagellant's Robe"
#define ELDRITCH_SWORD "Eldritch Longsword"
#define CURSED_BLADE "Cursed Ritual Blade"

// Cult forge. Gives out combat weapons.
/obj/structure/destructible/cult/item_dispenser/forge
	name = "daemon forge"
	desc = "A forge used in crafting the unholy weapons used by the armies of Nar'Sie."
	cult_examine_tip = "Can be used to create Nar'Sien hardened armor, flagellant's robes, and eldritch longswords."
	icon_state = "forge"
	light_range = 2
	light_color = LIGHT_COLOR_LAVA
	break_message = span_warning("The forge breaks apart into shards with a howling scream!")

/obj/structure/destructible/cult/item_dispenser/forge/setup_options()
	var/static/list/forge_items = list(
		NARSIE_ARMOR = list(
			PREVIEW_IMAGE = image(icon = 'icons/obj/clothing/suits/armor.dmi', icon_state = "cult_armor"),
			OUTPUT_ITEMS = list(/obj/item/clothing/suit/hooded/cultrobes/hardened),
			RADIAL_DESC = "Smiths a set of [/obj/item/clothing/suit/hooded/cultrobes/hardened::name], a robust suit of armor that can withstand space.",
			),
		FLAGELLANT_ARMOR = list(
			PREVIEW_IMAGE = image(icon = 'icons/obj/clothing/suits/armor.dmi', icon_state = "cultrobes"),
			OUTPUT_ITEMS = list(/obj/item/clothing/suit/hooded/cultrobes/berserker),
			RADIAL_DESC = "Smiths a set of [/obj/item/clothing/suit/hooded/cultrobes/berserker::name], a robe which makes you far more vulnerable to damage, but drastically increases your speed.",
			),
		ELDRITCH_SWORD = list(
			PREVIEW_IMAGE = image(icon = 'icons/obj/weapons/sword.dmi', icon_state = "cultblade"),
			OUTPUT_ITEMS = list(/obj/item/melee/cultblade),
			RADIAL_DESC = "Smiths \a [/obj/item/melee/cultblade::name], a powerful blade that can cleave through the toughest of armor.",
			),
	)

	var/extra_item = extra_options()

	options = forge_items
	if(!isnull(extra_item))
		options += extra_item

/obj/structure/destructible/cult/item_dispenser/forge/extra_options()
	return

/obj/structure/destructible/cult/item_dispenser/forge/succcess_message(mob/living/user, obj/item/spawned_item)
	to_chat(user, span_cult_italic("You work [src] as dark knowledge guides your hands, creating [spawned_item]!"))

/obj/structure/destructible/cult/item_dispenser/forge/engine
	name = "magma engine"
	desc = "An arcane engine used for powering a shuttle."
	debris = list()

#undef NARSIE_ARMOR
#undef FLAGELLANT_ARMOR
#undef ELDRITCH_SWORD
#undef CURSED_BLADE
