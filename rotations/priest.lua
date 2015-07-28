--[[[
@module Priest
@description
Priest Spells and Environment Functions.
GENERATED FROM WOWHEAD SPELLS - DO NOT EDIT MANUALLY
]]--

kps.spells.priest = {}

kps.spells.priest.powerWordShield = kps.Spell.fromId(17)
kps.spells.priest.renew = kps.Spell.fromId(139)
kps.spells.priest.purify = kps.Spell.fromId(527)
kps.spells.priest.dispelMagic = kps.Spell.fromId(528)
kps.spells.priest.smite = kps.Spell.fromId(585)
kps.spells.priest.fade = kps.Spell.fromId(586)
kps.spells.priest.shadowWordPain = kps.Spell.fromId(589)
kps.spells.priest.prayerOfHealing = kps.Spell.fromId(596)
kps.spells.priest.dominateMind = kps.Spell.fromId(605)
kps.spells.priest.levitate = kps.Spell.fromId(1706)
kps.spells.priest.resurrection = kps.Spell.fromId(2006)
kps.spells.priest.heal = kps.Spell.fromId(2060)
kps.spells.priest.flashHeal = kps.Spell.fromId(2061)
kps.spells.priest.mindVision = kps.Spell.fromId(2096)
kps.spells.priest.devouringPlague = kps.Spell.fromId(2944)
kps.spells.priest.fearWard = kps.Spell.fromId(6346)
kps.spells.priest.mindBlast = kps.Spell.fromId(8092)
kps.spells.priest.psychicScream = kps.Spell.fromId(8122)
kps.spells.priest.shackleUndead = kps.Spell.fromId(9484)
kps.spells.priest.powerInfusion = kps.Spell.fromId(10060)
kps.spells.priest.holyFire = kps.Spell.fromId(14914)
kps.spells.priest.vampiricEmbrace = kps.Spell.fromId(15286)
kps.spells.priest.mindFlay = kps.Spell.fromId(15407)
kps.spells.priest.shadowform = kps.Spell.fromId(15473)
kps.spells.priest.silence = kps.Spell.fromId(15487)
kps.spells.priest.desperatePrayer = kps.Spell.fromId(19236)
kps.spells.priest.spiritOfRedemption = kps.Spell.fromId(20711)
kps.spells.priest.powerWordFortitude = kps.Spell.fromId(21562)
kps.spells.priest.massDispel = kps.Spell.fromId(32375)
kps.spells.priest.shadowWordDeath = kps.Spell.fromId(32379)
kps.spells.priest.bindingHeal = kps.Spell.fromId(32546)
kps.spells.priest.prayerOfMending = kps.Spell.fromId(33076)
kps.spells.priest.glyphOfReflectiveShield = kps.Spell.fromId(33202)
kps.spells.priest.painSuppression = kps.Spell.fromId(33206)
kps.spells.priest.glyphOfMindSpike = kps.Spell.fromId(33371)
kps.spells.priest.shadowfiend = kps.Spell.fromId(34433)
kps.spells.priest.circleOfHealing = kps.Spell.fromId(34861)
kps.spells.priest.vampiricTouch = kps.Spell.fromId(34914)
kps.spells.priest.focusedWill = kps.Spell.fromId(45243)
kps.spells.priest.rapture = kps.Spell.fromId(47536)
kps.spells.priest.penance = kps.Spell.fromId(47540)
kps.spells.priest.dispersion = kps.Spell.fromId(47585)
kps.spells.priest.guardianSpirit = kps.Spell.fromId(47788)
kps.spells.priest.mindSear = kps.Spell.fromId(48045)
kps.spells.priest.borrowedTime = kps.Spell.fromId(52798)
kps.spells.priest.glyphOfPowerWordShield = kps.Spell.fromId(55672)
kps.spells.priest.glyphOfDeepWells = kps.Spell.fromId(55673)
kps.spells.priest.glyphOfCircleOfHealing = kps.Spell.fromId(55675)
kps.spells.priest.glyphOfPsychicScream = kps.Spell.fromId(55676)
kps.spells.priest.glyphOfPurify = kps.Spell.fromId(55677)
kps.spells.priest.glyphOfFearWard = kps.Spell.fromId(55678)
kps.spells.priest.glyphOfFade = kps.Spell.fromId(55684)
kps.spells.priest.glyphOfPrayerOfMending = kps.Spell.fromId(55685)
kps.spells.priest.glyphOfPsychicHorror = kps.Spell.fromId(55688)
kps.spells.priest.glyphOfScourgeImprisonment = kps.Spell.fromId(55690)
kps.spells.priest.glyphOfMassDispel = kps.Spell.fromId(55691)
kps.spells.priest.glyphOfSmite = kps.Spell.fromId(55692)
kps.spells.priest.glyphOfShadowRavens = kps.Spell.fromId(57985)
kps.spells.priest.glyphOfShackleUndead = kps.Spell.fromId(57986)
kps.spells.priest.glyphOfBorrowedTime = kps.Spell.fromId(58009)
kps.spells.priest.glyphOfDarkArchangel = kps.Spell.fromId(58228)
kps.spells.priest.powerWordBarrier = kps.Spell.fromId(62618)
kps.spells.priest.glyphOfDispersion = kps.Spell.fromId(63229)
kps.spells.priest.glyphOfBindingHeal = kps.Spell.fromId(63248)
kps.spells.priest.serendipity = kps.Spell.fromId(63733)
kps.spells.priest.psychicHorror = kps.Spell.fromId(64044)
kps.spells.priest.bodyAndSoul = kps.Spell.fromId(64129)
kps.spells.priest.divineHymn = kps.Spell.fromId(64843)
kps.spells.priest.leapOfFaith = kps.Spell.fromId(73325)
kps.spells.priest.mindSpike = kps.Spell.fromId(73510)
kps.spells.priest.masteryShieldDiscipline = kps.Spell.fromId(77484)
kps.spells.priest.masteryEchoOfLight = kps.Spell.fromId(77485)
kps.spells.priest.masteryMentalAnguish = kps.Spell.fromId(77486)
kps.spells.priest.shadowyApparitions = kps.Spell.fromId(78203)
kps.spells.priest.chakraSanctuary = kps.Spell.fromId(81206)
kps.spells.priest.chakraSerenity = kps.Spell.fromId(81208)
kps.spells.priest.chakraChastise = kps.Spell.fromId(81209)
kps.spells.priest.evangelism = kps.Spell.fromId(81662)
kps.spells.priest.archangel = kps.Spell.fromId(81700)
kps.spells.priest.atonement = kps.Spell.fromId(81749)
kps.spells.priest.glyphOfMindBlast = kps.Spell.fromId(87195)
kps.spells.priest.spiritualHealing = kps.Spell.fromId(87336)
kps.spells.priest.holyWordChastise = kps.Spell.fromId(88625)
kps.spells.priest.holyWordSerenity = kps.Spell.fromId(88684)
kps.spells.priest.glyphOfWeakenedSoul = kps.Spell.fromId(89489)
kps.spells.priest.rapidRenewal = kps.Spell.fromId(95649)
kps.spells.priest.shadowOrbs = kps.Spell.fromId(95740)
kps.spells.priest.glyphOfShadow = kps.Spell.fromId(107906)
kps.spells.priest.voidTendrils = kps.Spell.fromId(108920)
kps.spells.priest.glyphOfLevitate = kps.Spell.fromId(108939)
kps.spells.priest.phantasm = kps.Spell.fromId(108942)
kps.spells.priest.angelicBulwark = kps.Spell.fromId(108945)
kps.spells.priest.twistOfFate = kps.Spell.fromId(109142)
kps.spells.priest.divineInsight = kps.Spell.fromId(109175)
kps.spells.priest.surgeOfLight = kps.Spell.fromId(109186)
kps.spells.priest.spiritShell = kps.Spell.fromId(109964)
kps.spells.priest.divineStar = kps.Spell.fromId(110744)
kps.spells.priest.spectralGuise = kps.Spell.fromId(112833)
kps.spells.priest.glyphOfLeapOfFaith = kps.Spell.fromId(119850)
kps.spells.priest.glyphOfHolyFire = kps.Spell.fromId(119853)
kps.spells.priest.glyphOfDispelMagic = kps.Spell.fromId(119864)
kps.spells.priest.glyphOfPenance = kps.Spell.fromId(119866)
kps.spells.priest.glyphOfRenew = kps.Spell.fromId(119872)
kps.spells.priest.glyphOfSpiritOfRedemption = kps.Spell.fromId(119873)
kps.spells.priest.halo = kps.Spell.fromId(120517)
kps.spells.priest.glyphOfTheHeavens = kps.Spell.fromId(120581)
kps.spells.priest.glyphOfShadowWordDeath = kps.Spell.fromId(120583)
kps.spells.priest.glyphOfVampiricEmbrace = kps.Spell.fromId(120584)
kps.spells.priest.glyphOfMindFlay = kps.Spell.fromId(120585)
kps.spells.priest.cascade = kps.Spell.fromId(121135)
kps.spells.priest.angelicFeather = kps.Spell.fromId(121536)
kps.spells.priest.mindbender = kps.Spell.fromId(123040)
kps.spells.priest.glyphOfTheValkyr = kps.Spell.fromId(126094)
kps.spells.priest.glyphOfLightwell = kps.Spell.fromId(126133)
kps.spells.priest.lightwell = kps.Spell.fromId(126135)
kps.spells.priest.glyphOfConfession = kps.Spell.fromId(126152)
kps.spells.priest.glyphOfHolyResurrection = kps.Spell.fromId(126174)
kps.spells.priest.glyphOfShadowyFriends = kps.Spell.fromId(126745)
kps.spells.priest.powerWordSolace = kps.Spell.fromId(129250)
kps.spells.priest.holyNova = kps.Spell.fromId(132157)
kps.spells.priest.insanity = kps.Spell.fromId(139139)
kps.spells.priest.glyphOfAngels = kps.Spell.fromId(145722)
kps.spells.priest.glyphOfInspiredHymns = kps.Spell.fromId(147072)
kps.spells.priest.glyphOfTheSha = kps.Spell.fromId(147776)
kps.spells.priest.glyphOfFocusedMending = kps.Spell.fromId(147778)
kps.spells.priest.savingGrace = kps.Spell.fromId(152116)
kps.spells.priest.wordsOfMending = kps.Spell.fromId(152117)
kps.spells.priest.clarityOfWill = kps.Spell.fromId(152118)
kps.spells.priest.clarityOfPurpose = kps.Spell.fromId(155245)
kps.spells.priest.clarityOfPower = kps.Spell.fromId(155246)
kps.spells.priest.auspiciousSpirits = kps.Spell.fromId(155271)
kps.spells.priest.voidEntropy = kps.Spell.fromId(155361)
kps.spells.priest.glyphOfFreeAction = kps.Spell.fromId(159596)
kps.spells.priest.glyphOfDelayedCoalescence = kps.Spell.fromId(159598)
kps.spells.priest.glyphOfGuardianSpirit = kps.Spell.fromId(159599)
kps.spells.priest.glyphOfRestoredFaith = kps.Spell.fromId(159606)
kps.spells.priest.glyphOfMiraculousDispelling = kps.Spell.fromId(159608)
kps.spells.priest.glyphOfTheInquisitor = kps.Spell.fromId(159624)
kps.spells.priest.glyphOfSilence = kps.Spell.fromId(159626)
kps.spells.priest.glyphOfTheRedeemer = kps.Spell.fromId(159627)
kps.spells.priest.glyphOfShadowMagic = kps.Spell.fromId(159628)
kps.spells.priest.surgeOfDarkness = kps.Spell.fromId(162448)
kps.spells.priest.shadowyInsight = kps.Spell.fromId(162452)
kps.spells.priest.glyphOfMindHarvest = kps.Spell.fromId(162532)
kps.spells.priest.divineProvidence = kps.Spell.fromId(165362)
kps.spells.priest.mastermind = kps.Spell.fromId(165370)
kps.spells.priest.enlightenment = kps.Spell.fromId(165376)
kps.spells.priest.glyphOfPurification = kps.Spell.fromId(171921)
kps.spells.priest.searingInsanity = kps.Spell.fromId(179337)
kps.spells.priest.mentalInstinct = kps.Spell.fromId(167254)

kps.env.priest = {}

kps.env.priest = {}
