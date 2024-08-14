// Sabrina: The Animated Series - Spooked!
// #ID = 3636

// $00C381: [8-bit] Debug Menu Flag
//          This flag is used with the Debug Menu to determine where to load into when the player chooses an option. It can also identify when the player is in the Debug Menu itself.
//          
//          0x63 = Debug Menu
function DebugMenuFlag() => byte(0x00C381)

// $00CA14: [16-bit BE] Pointer to active character being controlled
//          Offset +0x3FB1
function ActiveControllerCharacterPointer() => word_be(0x00CA14)

// $00CA94: [8-bit] In-Game Flag
//          Can be used to check if the game is in an in-game state where the player has control of a character.
//
//          0x00 = In Menus, Level Transition Screen, Password Display Screen, etc.
//          0x01 = In-Game
function InGameFlag() => byte(0x00CA94)

// $00CA6E: [8-bit] Number of lives
function NumberOfLives() => byte(0x00CA6E)

// $00CA6F: [8-bit] Number of hearts
//          Max of 0x03
//          Value can be 0x00 - a life is lost when a hit is taken when this value is 0
function NumberOfHearts() => byte(0x00CA6F)

// $00CA70: [8-bit] Number of crystals collected in current level
//          Max of 0x03
//          When this value reaches 0x03, the exit portal for the level appears
function CurrentCrystalCount() => byte(0x00CA70)

// $00CA71: [8-bit] Number of power stars collected in current level
//          Max of 0x03
//          When this value reaches 0x03, Sabrina can use her ranged zap attack
function CurrentPowerStarCount() => byte(0x00CA71)

// $00CAA3: [8-bit] Character Control Flag
//          Can be used to check which character is activly being controlled by the player.
//
//          0x00 = Sabrina
//          0x01 = Salem
function CharacterControlFlag() => byte(0x00CAA3)

// $00CAF1: [8-bit] Level ID
//          Keeps track of which level is currently loaded. The game uses this value to determine which level to load next when certain events happen that cause a level load to occur.
//          The value will increment to the next level when the password screen is shown, displaying the password for the next level.
//          
//          0x00 = Title Screens, Debug Menu, etc.
//          0x01 = Opening Cutscene / Level 1-1
//          0x02 = Level 1-2
//          0x03 = Level 1-3
//          0x04 = Level 1-4
//          0x05 = Level 2-1
//          0x06 = Level 2-2
//          0x07 = Level 2-3
//          0x08 = Level 2-4
//          0x09 = Level 3-1
//          0x0A = Level 3-2
//          0x0B = Level 3-3
//          0x0C = Level 3-4
//          0x0D = Level 4-1
//          0x0E = Level 4-2
//          0x0F = Level 4-3
//          0x10 = Level 4-4
//          0x15 = Debug Test Level
//          0x19 = W1 Boss Fight
//          0x1A = W2 Boss Fight
//          0x1B = W3 Boss Fight
//          0x1C = W4 Boss Fight
function LevelId() => byte(0x00CAF1)

// $00CB03: [8-bit] Crush Spell Collected Flag
//          0x00 = Spell not aquired
//          0x80 = Spell aquired
function CrushSpellCollectedFlag() => byte(0x00CB03)

// $00CB04: [8-bit] Whirlwind Spell Collected Flag
//          0x00 = Spell not aquired
//          0x80 = Spell aquired
function WhirlwindSpellCollectedFlag() => byte(0x00CB04)

// $00CB05: [8-bit] Tiny Spell Collected Flag
//          0x00 = Spell not aquired
//          0x80 = Spell aquired
function TinySpellCollectedFlag() => byte(0x00CB05)

// $00CB06: [8-bit] Bubble Spell Collected Flag
//          0x00 = Spell not aquired
//          0x80 = Spell aquired
function BubbleSpellCollectedFlag() => byte(0x00CB06)

// $00CB06: [8-bit] Game Paused Flag
//          This value can identify when the player has paused the game.
//
//          0x00 = Game Not Paused
//          0x01 = Game Paused
function GamePausedFlag() => byte(0x00CB0C)

// $011000: [8-bit] Entity 1 Active Status
//          This first entity is always Sabrina.
//          
//          This address is the start of the entity address space. Starting from here, adding 0x7B to this address will bring you to the start of the next entity address space.
//          Continuously adding 0x7B will bring you to the start of each available entity address space.
//          
//          The following offsets correspond to various properties for the entity when applied to the active status address:
//          +0x1B = Entity State (16-bit BE)
//          +0x27 = Entity Clear Bit (8-bit)
//          +0x2E = Entity ID (8-bit) ???
//          +0x2F = Sprite Index (16-bit BE)
//          +0x34 = X Position (16-bit)
//          +0x37 = Y Position (16-bit)
//          +0x63 = Enemy HP (8-bit)
function Entity1ActiveStatus() => byte(0x011000)

// $011002: [16-bit] Sabrina State
//          Changes value depending on what action Sabrina is currently taking.
//          
//          0x6F91 = Begin Enter Portal
//          0x5BEC = Activated Crush Spell
//          0x5AA8 = Activated Bubble Spell
//          0x6B14 = Activated Whirlwind Spell
//          0x4B3E = Activated Tiny Spell
function SabrinaState() => word(0x011002)

// $01102F: [16-bit BE] Sabrina Sprite Index
//          Unique identifier for the sprite being displayed
function SabrinaSpriteIndex() => word_be(0x01102F)

// $01124F: [8-bit] Boss Health
//          This value represents how many more times the boss must be damaged before it is defeated. This address is used for every boss in the game.
//
//          Max value of 0x06 for the bosses in worlds 1, 2, and 3.
//          Max value of 0x07 for the boss in world 4
//
//          Decreases by 1 each time the boss is damaged.
//          A value of 0x00 does not indicate the boss is defeated.
//          If the boss is damaged when this value is 0x00, it will change to 0xFF, indicating the boss is defeated.
function BossHealth() => byte(0x01124F)

// $011267: [8-bit] Entity 1 Active Status
//
//          0x00 = Active Entity
//          0xFF = Inactive Entity
//
//          This address is the start of the entity address space. Starting from here, adding 0x7B to this address will bring you to the start of the next entity address space.
//          Continuously adding 0x7B will bring you to the start of each available entity address space.
//
//          The following offsets correspond to various properties for the entity when applied to the active status address:
//          +0x1B = Entity State (16-bit BE)
//          +0x21 = Present Box Contents (8-bit)
//          +0x27 = Entity Clear Bit Offset (8-bit)
function Entity1ActiveStatus() => byte(ENTITY_ADDRESS_SPACE)

// $012000: [8-bit] Entity Clear Bit Address Space Marker
//          This address marks the start of an area in memory that tracks if an entity should spawn into the level when the player enters the area of the level where the entity is placed. Each entity address space will have an 8-bit value stored that when added to this address as an offset points to where that entity clear bit is loacated in memory.
//          
//          0x00 = Entity should spawn
//          0x01 = Entity should not spawn
//          
//          The bit will be flipped to 0x01 when the player enters the area of the level that causes the entity to spawn in. If the player leaves the area that the entity is loaded into, the bit will flip back to 0x00 when the entity de-spawns. If the player interacted with the entity such that it was removed from the level, the bit will stay flipped to 0x01 when the player leaves the area that the entity was placed in. This is how the game remembers to not spawn the entity back in if the player returns to that area again.
function EntityClearBitAddressSpaceMarker() => byte(0x012000)

// ---------------------------
// -------- Constants --------
// ---------------------------

SABRINA_STATE_ENTER_PORTAL = 0x6F91
SABRINA_STATE_CRUSH_SPELL = 0x5BEC
SABRINA_STATE_BUBBLE_SPELL = 0x5AA8
SABRINA_STATE_WHIRLWIND_SPELL = 0x6B14
SABRINA_STATE_TINY_SPELL = 0x4B3E

ENTITY_ADDRESS_SPACE = 0x011267
ENTITY_ADDRESS_SPACE_SIZE = 0x7B
ENTITY_SLOTS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]

ENTITY_OFFSET_STATE = 0x1B
ENTITY_OFFSET_PRESENT_BOX_CONTENTS = 0x21
ENTITY_OFFSET_CLEAR_BIT_OFFSET = 0x27

ENTITY_CLEAR_BIT_ADDRESS_SPACE = 0x012000

ENTITY_INACTIVE = 0xFF

SPELL_COLLECTED = 0x80

W1_ENEMY_STATES = [
    0x1641, 0x7E42,         // Muffin Thrower
    0x1046, 0xD346,         // Cupcake
    0x2945, 0x8044, 0x8145, // Lips
    0x9549, 0x2E4A, 0x7F48  // Pogo
]

LEVEL_ID_W1L1 = 0x01
LEVEL_ID_W1L2 = 0x02
LEVEL_ID_W1L3 = 0x03
LEVEL_ID_W1L4 = 0x04
LEVEL_ID_W2L1 = 0x05
LEVEL_ID_W2L2 = 0x06
LEVEL_ID_W2L3 = 0x07
LEVEL_ID_W2L4 = 0x08
LEVEL_ID_W3L1 = 0x09
LEVEL_ID_W3L2 = 0x0A
LEVEL_ID_W3L3 = 0x0B
LEVEL_ID_W3L4 = 0x0C
LEVEL_ID_W4L1 = 0x0D
LEVEL_ID_W4L2 = 0x0E
LEVEL_ID_W4L3 = 0x0F
LEVEL_ID_W4L4 = 0x10
LEVEL_ID_DEBUG = 0x15
LEVEL_ID_W1BOSS = 0x19
LEVEL_ID_W2BOSS = 0x1A
LEVEL_ID_W3BOSS = 0x1B
LEVEL_ID_W4BOSS = 0x1C


// ---------------------------
// ----- Logic Functions -----
// ---------------------------

function InArray(value, array) {
    result = false
    for compare in array {
        result = result || compare == value
    }
    return result
}

function LockIfUsedDebugMenuInThisSession() => unless(once(DebugMenuFlag() == 0x63))

function InGame() => InGameFlag() == 0x01

function StartedLevelOnThisFrame(levelId) => prev(InGameFlag()) == 0x00 && InGame() && LevelId() == levelId

function ResetIfNotInLevel(levelId) => never(!InGame()) && never(LevelId() != levelId)

function SabrinaStateTransition(newState) => prev(SabrinaState()) != newState && SabrinaState() == newState

function LevelTransitionOnThisFrame(beforeLevel, afterLevel) => prev(LevelId()) == beforeLevel && LevelId() == afterLevel

function EnterExitPortalOnThisFrame() => SabrinaStateTransition(SABRINA_STATE_ENTER_PORTAL)

function ClearLevelOnThisFrame(levelId) =>
    LockIfUsedDebugMenuInThisSession() && InGame() && LevelId() == levelId &&
    trigger_when(EnterExitPortalOnThisFrame())
    
function DefeatBossOnThisFrame(levelId) =>
    LockIfUsedDebugMenuInThisSession() && InGame() && LevelId() == levelId &&
    trigger_when(prev(BossHealth()) == 0x00 && BossHealth() == 0xFF)
    
function EntityAddress(slot) => ENTITY_ADDRESS_SPACE + (ENTITY_ADDRESS_SPACE_SIZE * slot)

function EntityState(address) => word_be(address + ENTITY_OFFSET_STATE)

function EntityClearBitOffset(address) => byte(address + ENTITY_OFFSET_CLEAR_BIT_OFFSET)

function IsEntityActive(address) => byte(address) != ENTITY_INACTIVE

function IsEntityAnEnemy(address) {
    entityState = EntityState(address)
    return InArray(entityState, W1_ENEMY_STATES)
}

function IsEnemyDefeatedOnThisFrame(address) {
    entityState = byte(address)
    entityClearBit = byte(ENTITY_CLEAR_BIT_ADDRESS_SPACE + EntityClearBitOffset(address))
    return prev(entityState) != ENTITY_INACTIVE && entityState == ENTITY_INACTIVE && entityClearBit == 0x01
}

function ResetIfEnemyDefeatedOnThisFrame(levelId) {
    result = ResetIfNotInLevel(levelId)
    for slot in ENTITY_SLOTS {
        address = EntityAddress(slot)
        result = result && never(IsEntityAnEnemy(address) && IsEnemyDefeatedOnThisFrame(address))
    }
    return result
}


// ---------------------------
// ------ Achievements -------
// ---------------------------

achievement(
    id = 450339, badge = "509542",
    title = "Candy Craze Level 1 Clear", points = 1,
    description = "Clear Level 1-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W1L1)
)

achievement(
    id = 450340, badge = "509543",
    title = "Candy Craze Level 2 Clear", points = 1,
    description = "Clear Level 1-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W1L2)
)

achievement(
    id = 450341, badge = "509544",
    title = "Candy Craze Level 3 Clear", points = 1,
    description = "Clear Level 1-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W1L3)
)

achievement(
    id = 450343, badge = "509545",
    title = "Candy Craze Level 4 Clear", points = 1,
    description = "Clear Level 1-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W1L4)
)

achievement(
    id = 450349, badge = "509547",
    title = "Candy Craze Spookie Trap Clear", points = 2,
    description = "Defeat the Spookie Trap at the end of World 1",
    type = "progression",
    trigger = DefeatBossOnThisFrame(LEVEL_ID_W1BOSS)
)

achievement(
    id = 450432, badge = "509659",
    title = "Float Zone Level 1 Clear", points = 2,
    description = "Clear Level 2-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L1)
)

achievement(
    id = 450433, badge = "509660",
    title = "Float Zone Level 2 Clear", points = 2,
    description = "Clear Level 2-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L2)
)

achievement(
    id = 450434, badge = "509661",
    title = "Float Zone Level 3 Clear", points = 2,
    description = "Clear Level 2-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L3)
)

achievement(
    id = 450435, badge = "509662",
    title = "Float Zone Level 4 Clear", points = 2,
    description = "Clear Level 2-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L4)
)

achievement(
    id = 450436, badge = "509663",
    title = "Float Zone Spookie Trap Clear", points = 3,
    description = "Defeat the Spookie Trap at the end of World 2",
    type = "progression",
    trigger = DefeatBossOnThisFrame(LEVEL_ID_W2BOSS)
)

achievement(
    id = 453098, badge = "512670",
    title = "Jewel Cave Level 1 Clear", points = 3,
    description = "Clear Level 3-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L1)
)

achievement(
    id = 453099, badge = "512671",
    title = "Jewel Cave Level 2 Clear", points = 3,
    description = "Clear Level 3-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L2)
)

achievement(
    id = 453100, badge = "512672",
    title = "Jewel Cave Level 3 Clear", points = 3,
    description = "Clear Level 3-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L3)
)

achievement(
    id = 453101, badge = "512673",
    title = "Jewel Cave Level 4 Clear", points = 3,
    description = "Clear Level 3-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L4)
)

achievement(
    id = 453102, badge = "512674",
    title = "Jewel Cave Spookie Trap Clear", points = 4,
    description = "Defeat the Spookie Trap at the end of World 3",
    type = "progression",
    trigger = DefeatBossOnThisFrame(LEVEL_ID_W3BOSS)
)

achievement(
    id = 455083, badge = "514331",
    title = "Nite Lite Land Level 1 Clear", points = 4,
    description = "Clear Level 4-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L1)
)

achievement(
    id = 455084, badge = "514332",
    title = "Nite Lite Land Level 2 Clear", points = 4,
    description = "Clear Level 4-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L2)
)

achievement(
    id = 455089, badge = "514336",
    title = "Nite Lite Land Level 3 Clear", points = 4,
    description = "Clear Level 4-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L3)
)

achievement(
    id = 455090, badge = "514346",
    title = "Nite Lite Land Level 4 Clear", points = 4,
    description = "Clear Level 4-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L4)
)

achievement(
    id = 455091, badge = "514341",
    title = "Never Touch The Spookie Jar", points = 25,
    description = "Defeat Spookie in Nite Lite Land to save aunt Hilda and Zelda",
    type = "win_condition",
    trigger = DefeatBossOnThisFrame(LEVEL_ID_W4BOSS)
)

achievement(
    id = 455671, badge = "515170",
    title = "Pesky Blocks Beneath My Feet, Turn to Dust as I Take a Seat!", points = 2,
    description = "Activate the Crush Spell while playing as Sabrina",
    trigger = LockIfUsedDebugMenuInThisSession() && InGame() &&
              CrushSpellCollectedFlag() == SPELL_COLLECTED && SabrinaStateTransition(SABRINA_STATE_CRUSH_SPELL)
)

achievement(
    id = 455674, badge = "515173",
    title = "Going Up is Lots of Trouble, Chant This Spell, Become a Bubble!", points = 2,
    description = "Activate the Bubble Spell while playing as Sabrina",
    trigger = LockIfUsedDebugMenuInThisSession() && InGame() &&
              BubbleSpellCollectedFlag() == SPELL_COLLECTED && SabrinaStateTransition(SABRINA_STATE_BUBBLE_SPELL)
)

achievement(
    id = 455675, badge = "515174",
    title = "Path is Blocked, Not For Long! Spin Around, Become Real Strong!", points = 2,
    description = "Activate the Whirlwind Spell while playing as Sabrina",
    trigger = LockIfUsedDebugMenuInThisSession() && InGame() &&
              WhirlwindSpellCollectedFlag() == SPELL_COLLECTED && SabrinaStateTransition(SABRINA_STATE_WHIRLWIND_SPELL)
)

achievement(
    id = 455677, badge = "515175",
    title = "Tiny Passage Let Me Think, Chant This Spell, Then I'll Shrink!", points = 2,
    description = "Activate the Tiny Spell while playing as Sabrina",
    trigger = LockIfUsedDebugMenuInThisSession() && InGame() &&
              TinySpellCollectedFlag() == SPELL_COLLECTED && SabrinaStateTransition(SABRINA_STATE_TINY_SPELL)
)

achievement(
    title = "1-1 no enemies", points = 1,
    description = "Clear Level 1-1 without defeating any of the enemies",
    trigger = LockIfUsedDebugMenuInThisSession() &&
              once(StartedLevelOnThisFrame(LEVEL_ID_W1L1)) && ResetIfEnemyDefeatedOnThisFrame(LEVEL_ID_W1L1) &&
              trigger_when(EnterExitPortalOnThisFrame())
)


// -------------------------
// ----- Leaderboards ------
// -------------------------

function BossTimeTrialLeaderboardValue(levelId) => measured(tally(0, GamePausedFlag() != 0x01 && InGame() && LevelId() == levelId))

leaderboard(
    id=109670,
    title="Candy Craze Spookie Trap Time Trial",
    description="Defeat the boss of World 1 as fast as possible",
    start=LockIfUsedDebugMenuInThisSession() && StartedLevelOnThisFrame(LEVEL_ID_W1BOSS),
    cancel=LevelId() != LEVEL_ID_W1BOSS || (prev(InGameFlag()) == 0x01 && InGameFlag() == 0x00),
    submit=prev(BossHealth()) == 0x00 && BossHealth() == 0xFF,
    value=BossTimeTrialLeaderboardValue(LEVEL_ID_W1BOSS),
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    id=112107,
    title="Float Zone Spookie Trap Time Trial",
    description="Defeat the boss of World 2 as fast as possible",
    start=LockIfUsedDebugMenuInThisSession() && StartedLevelOnThisFrame(LEVEL_ID_W2BOSS),
    cancel=LevelId() != LEVEL_ID_W2BOSS || (prev(InGameFlag()) == 0x01 && InGameFlag() == 0x00),
    submit=prev(BossHealth()) == 0x00 && BossHealth() == 0xFF,
    value=BossTimeTrialLeaderboardValue(LEVEL_ID_W2BOSS),
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    id=112108,
    title="Jewel Cave Spookie Trap Time Trial",
    description="Defeat the boss of World 3 as fast as possible",
    start=LockIfUsedDebugMenuInThisSession() && StartedLevelOnThisFrame(LEVEL_ID_W3BOSS),
    cancel=LevelId() != LEVEL_ID_W3BOSS || (prev(InGameFlag()) == 0x01 && InGameFlag() == 0x00),
    submit=prev(BossHealth()) == 0x00 && BossHealth() == 0xFF,
    value=BossTimeTrialLeaderboardValue(LEVEL_ID_W3BOSS),
    format="FRAMES",
    lower_is_better=true
)

leaderboard(
    id=112109,
    title="Nite Lite Land Spookie Time Trial",
    description="Defeat the boss of World 4 as fast as possible",
    start=LockIfUsedDebugMenuInThisSession() && StartedLevelOnThisFrame(LEVEL_ID_W4BOSS),
    cancel=LevelId() != LEVEL_ID_W4BOSS || (prev(InGameFlag()) == 0x01 && InGameFlag() == 0x00),
    submit=prev(BossHealth()) == 0x00 && BossHealth() == 0xFF,
    value=BossTimeTrialLeaderboardValue(LEVEL_ID_W4BOSS),
    format="FRAMES",
    lower_is_better=true
)


// -------------------------
// ----- Rich Presence -----
// -------------------------

CharacterLookup = {
    0x00: "Sabrina",
    0x01: "Salem"
}

LevelLookup = {
    LEVEL_ID_W1L1: "in Level 1-1",
    LEVEL_ID_W1L2: "in Level 1-2",
    LEVEL_ID_W1L3: "in Level 1-3",
    LEVEL_ID_W1L4: "in Level 1-4",
    LEVEL_ID_W2L1: "in Level 2-1",
    LEVEL_ID_W2L2: "in Level 2-2",
    LEVEL_ID_W2L3: "in Level 2-3",
    LEVEL_ID_W2L4: "in Level 2-4",
    LEVEL_ID_W3L1: "in Level 3-1",
    LEVEL_ID_W3L2: "in Level 3-2",
    LEVEL_ID_W3L3: "in Level 3-3",
    LEVEL_ID_W3L4: "in Level 3-4",
    LEVEL_ID_W4L1: "in Level 4-1",
    LEVEL_ID_W4L2: "in Level 4-2",
    LEVEL_ID_W4L3: "in Level 4-3",
    LEVEL_ID_W4L4: "in Level 4-4",
    LEVEL_ID_W1BOSS: "fighting the Spookie Trap in Candy Craze",
    LEVEL_ID_W2BOSS: "fighting the Spookie Trap in Float Zone",
    LEVEL_ID_W3BOSS: "fighting the Spookie Trap in Jewel Cave",
    LEVEL_ID_W4BOSS: "fighting Spookie in Nite Lite Land",
    LEVEL_ID_DEBUG: "messing around in the debug level"
}

HeartLookup = {
    0x00: "---",
    0x01: "♥--",
    0x02: "♥♥-",
    0x03: "♥♥♥"
}

StarLookup = {
    0x00: "---",
    0x01: "★--",
    0x02: "★★-",
    0x03: "★★★"
}

CrystalLookup = {
    0x00: "---",
    0x01: "◆--",
    0x02: "◆◆-",
    0x03: "◆◆◆"
}

rich_presence_conditional_display(InGameFlag() != 0x01, "In Menus")
rich_presence_conditional_display(LevelId() == LEVEL_ID_W1BOSS || LevelId() == LEVEL_ID_W2BOSS || LevelId() == LEVEL_ID_W3BOSS || LevelId() == LEVEL_ID_W4BOSS, "{0} is {1} | {2}",
    rich_presence_lookup("Character", CharacterControlFlag(), CharacterLookup, fallback="???"),
    rich_presence_lookup("Level", LevelId(), LevelLookup, fallback="lost in the underworld's hall of doors"),
    rich_presence_lookup("Hearts", NumberOfHearts(), HeartLookup, fallback="♥♥♥")
)
rich_presence_display("{0} is {1} | {2} | {3} | {4}",
    rich_presence_lookup("Character", CharacterControlFlag(), CharacterLookup, fallback="???"),
    rich_presence_lookup("Level", LevelId(), LevelLookup, fallback="lost in the underworld's hall of doors"),
    rich_presence_lookup("Hearts", NumberOfHearts(), HeartLookup, fallback="♥♥♥"),
    rich_presence_lookup("Stars", CurrentPowerStarCount(), StarLookup, fallback="---"),
    rich_presence_lookup("Crystals", CurrentCrystalCount(), CrystalLookup, fallback="---")
)