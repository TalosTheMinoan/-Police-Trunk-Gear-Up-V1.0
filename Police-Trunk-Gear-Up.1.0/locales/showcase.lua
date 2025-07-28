-- showcase.lua
--  Translation Tutorial (How to Add Your Own Language)

-- STEP 1: Create a new file in the same folder as other translations
-- Example: Copy 'en.lua' or 'gr.lua' and rename it to your language code (e.g. 'fr.lua' for French)

-- STEP 2: Use this format in the new file:

-- Locales = {}
-- Locales['fr'] = {
--     press_e_to_search = "~g~[E]~w~ Vérifier le coffre pour l'équipement",
--     equipped = "~g~Vous avez reçu les armes et le gilet pare-balles.",
--     not_police = "Vous n'êtes pas un officier de police.",
-- }

-- Keep the keys the same (like 'press_e_to_search'), just change the values (the translations).

-- STEP 3: In 'client.lua', make sure to set the language:
-- Example:
-- local lang = 'fr'
-- local Locale = Locales[lang]

--  That’s it! Your new language will be used in-game!

--  Tip: Avoid special symbols or non-UTF8 characters if your in-game font doesn’t support them.
