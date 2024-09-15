// Sabrina: The Animated Series - Spooked!
// #ID = 3636

// $00C376: [8-bit] Game Over Flag
//          0x00 = Not On Game Over Screen
//          0x01 = On Game Over Screen
function GameOverFlag() => byte(0x00c376)

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

// $011207: [16-bit BE] Boss State
function BossState() => word_be(0x011207)

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

SABRINA_STATES_CRUSH_SPELL = [SABRINA_STATE_CRUSH_SPELL, 0x5BF2, 0x5BF8, 0x5BFE]
SABRINA_STATES_WHIRLWIND_SPELL = [SABRINA_STATE_WHIRLWIND_SPELL, 0x6B1A, 0x6B20, 0x6B26, 0x6B2C, 0x6B32]

SABRINA_STATES_PIG = [
    0x6671, 0x6677, 0x6665, 0x666B, // Idle
    0x684C, 0x6852, 0x6858, 0x685E, // In Air
    0x675F, 0x6765, 0x676B, 0x6759  // Walking
]

ENTITY_ADDRESS_SPACE = 0x011267
ENTITY_ADDRESS_SPACE_SIZE = 0x7B
ENTITY_SLOTS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]

ENTITY_OFFSET_STATE = 0x1B
ENTITY_OFFSET_PRESENT_BOX_CONTENTS = 0x21
ENTITY_OFFSET_CLEAR_BIT_OFFSET = 0x27

ENTITY_CLEAR_BIT_ADDRESS_SPACE = 0x012000

ENTITY_INACTIVE = 0xFF

SPELL_COLLECTED = 0x80

PRESENT_STATE_IDLE = 0xC040
PRESENT_STATE_OPENING = 0xA00C
PRESENT_STATE_OPENED_1UP = 0xF248

PRESENT_BOX_ITEM_STATES = [
    0x7749, // Power Star
    0x264A, // Recovery Heart
    0xF248, // 1UP
    0x7946, // Crush Spell
    0x1847, // Bubble Spell
    0xB747, // Whirlwind Spell
    0x5648  // Tiny Spell
]

W1_ENEMY_STATES = [
    0x1641, 0x7E42,         // Muffin Thrower
    0x1046, 0xD346,         // Cupcake
    0x2945, 0x8044, 0x8145, // Lips
    0x9549, 0x2E4A, 0x7F48  // Pogo
]

W2_ENEMY_STATES = [
    0xAC4B, 0x314C, 0xC44C, // Puffer Fish
    0x1453, 0xC653, 0x9055, // Pirate Mermaid
    0xA350, 0x8452, 0xBA52  // Baton Jumper
]

W3_ENEMY_STATES = [
    0x2257, 0xCA58, 0xA259, 0xD859,         // Frog
    0x5D63, 0x3463, 0xA661, 0x9962, 0x9363, // Ninja Beetle
    0x9265, 0xFF65, 0x4D66, 0xB768, 0x1669  // Pig Wizard
]

W3_PIG_WIZARD_STATES = [
    0x9265, 0xFF65, 0x4D66, 0xB768, 0x1669
]

W4_ENEMY_STATES = [
    0x9C6B, 0x816C, 0xF96C, 0x8D6E, 0xEC6E, // Knight
    0x9960, 0x2460, 0x915F, 0x055F, 0x805E, // Wall Dragon
    0x235D, 0x8C5D, 0xC25D                  // Flying Dragon
]

W4_LIGHTBULB_BUG_STATE = 0x5E5B

W4_BOSS_STATE_STUNNED = 0xC96B
W4_BOSS_STATE_DAMAGED = 0x3B6C

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

function GameOver() => GameOverFlag() == 0x01

function InGame() => InGameFlag() == 0x01

function StartedAnyLevelOnThisFrame() => prev(InGameFlag()) == 0x00 && InGame()

function StartedLevelOnThisFrame(levelId) => prev(InGameFlag()) == 0x00 && InGame() && LevelId() == levelId

function ResetIfNotInLevel(levelId) => never(!InGame()) && never(LevelId() != levelId)

function SabrinaStateTransition(newState) => prev(SabrinaState()) != newState && SabrinaState() == newState

function LevelTransitionOnThisFrame(beforeLevel, afterLevel) => prev(LevelId()) == beforeLevel && LevelId() == afterLevel

function EnterExitPortalOnThisFrame() => SabrinaStateTransition(SABRINA_STATE_ENTER_PORTAL)

function ClearLevelOnThisFrame(levelId) =>
    LockIfUsedDebugMenuInThisSession() && InGame() && LevelId() == levelId && EnterExitPortalOnThisFrame()
    
function DefeatBossOnThisFrame(levelId) =>
    LockIfUsedDebugMenuInThisSession() && InGame() && LevelId() == levelId && prev(BossHealth()) == 0x00 && BossHealth() == 0xFF
    
function IsSabrinaInPigForm() {
    result = false
    for state in SABRINA_STATES_PIG {
        result = result || SabrinaState() == state
    }
    return result
}
    
function EntityAddress(slot) => ENTITY_ADDRESS_SPACE + (ENTITY_ADDRESS_SPACE_SIZE * slot)

function EntityState(address) => word_be(address + ENTITY_OFFSET_STATE)

function EntityClearBitOffset(address) => word(address + ENTITY_OFFSET_CLEAR_BIT_OFFSET) - 0xD000

function EntityClearBit(address) => byte(ENTITY_CLEAR_BIT_ADDRESS_SPACE + EntityClearBitOffset(address))

function IsEntityActive(address) => byte(address) != ENTITY_INACTIVE

function IsEntityAnEnemy(address, enemyStates) {
    entityState = EntityState(address)
    return InArray(entityState, enemyStates)
}

function PresentBoxOpenedOnThisFrame(address) {
    entityState = EntityState(address)
    return prev(entityState) == PRESENT_STATE_IDLE && entityState == PRESENT_STATE_OPENING
}

function PresentBoxReappearedOnThisFrame(address) {
    result = false
    entityState = EntityState(address)
    entityClearBit = EntityClearBit(address)
    for state in PRESENT_BOX_ITEM_STATES {
        result = result || (entityState == state && prev(entityClearBit) == 0x01 && entityClearBit == 0x00)
    }
    return result
}

function PresentBoxesOpenedOnThisFrame() {
    result = []
    for slot in ENTITY_SLOTS {
        address = EntityAddress(slot)
        array_push(result, PresentBoxOpenedOnThisFrame(address))
        array_push(result, deduct(PresentBoxReappearedOnThisFrame(address)))
    }
    return result
}

function IsEnemyDefeatedOnThisFrame(address) {
    entityState = byte(address)
    entityClearBit = EntityClearBit(address)
    return prev(entityState) != ENTITY_INACTIVE && entityState == ENTITY_INACTIVE && entityClearBit == 0x01
}

function EnemyTypesDefeatedOnThisFrame(enemyStates) {
    result = []
    for slot in ENTITY_SLOTS {
        address = EntityAddress(slot)
        array_push(result, IsEntityAnEnemy(address, enemyStates) && IsEnemyDefeatedOnThisFrame(address))
    }
    return result
}

function ResetIfEnemyDefeatedOnThisFrame(levelId, enemyStates) {
    result = ResetIfNotInLevel(levelId)
    for slot in ENTITY_SLOTS {
        address = EntityAddress(slot)
        result = result && never(IsEntityAnEnemy(address, enemyStates) && IsEnemyDefeatedOnThisFrame(address))
    }
    return result
}

function OpenedPresentBoxesInLevel(levelId, numberOfPresents) =>
    LockIfUsedDebugMenuInThisSession() &&
    never(InGameFlag() == 0x00) && never(LevelId() != levelId) && never(GameOver()) &&
    measured(tally(numberOfPresents, PresentBoxesOpenedOnThisFrame()), LevelId() == levelId)
    
function ClearLevelWithoutDefeatingEnemiesOnThisFrame(levelId, enemyStates) =>
    LockIfUsedDebugMenuInThisSession() &&
    once(StartedLevelOnThisFrame(levelId)) && never(InGameFlag() == 0x00) && never(LevelId() != levelId) && never(GameOver()) &&
    ResetIfEnemyDefeatedOnThisFrame(levelId, enemyStates) &&
    trigger_when(EnterExitPortalOnThisFrame())
    
function W4EnemyStatesPlusLightbulbBug() {
    result = []
    array_push(result, W4_LIGHTBULB_BUG_STATE)
    for state in W4_ENEMY_STATES {
        array_push(result, state)        
    }
    return result
}

function AllEnemyStates() {
    result = []
    array_push(result, W4_LIGHTBULB_BUG_STATE)
    for state in W1_ENEMY_STATES {
        array_push(result, state)
    }
    for state in W2_ENEMY_STATES {
        array_push(result, state)
    }
    for state in W3_ENEMY_STATES {
        array_push(result, state)
    }
    for state in W4_ENEMY_STATES {
        array_push(result, state)
    }
    return result
}

function MasterWorld(firstLevelId, bossLevelId) =>
    LockIfUsedDebugMenuInThisSession() && once(StartedLevelOnThisFrame(firstLevelId)) &&
    never(GameOver()) && never(prev(NumberOfLives()) > NumberOfLives()) &&
    trigger_when(LevelId() == bossLevelId && prev(BossHealth()) == 0x00 && BossHealth() == 0xFF)


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
    title = "Candy Craze Spookie Trap Clear", points = 1,
    description = "Defeat the Spookie Trap at the end of World 1",
    type = "progression",
    trigger = DefeatBossOnThisFrame(LEVEL_ID_W1BOSS)
)

achievement(
    id = 450432, badge = "509659",
    title = "Float Zone Level 1 Clear", points = 1,
    description = "Clear Level 2-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L1)
)

achievement(
    id = 450433, badge = "509660",
    title = "Float Zone Level 2 Clear", points = 1,
    description = "Clear Level 2-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L2)
)

achievement(
    id = 450434, badge = "509661",
    title = "Float Zone Level 3 Clear", points = 1,
    description = "Clear Level 2-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L3)
)

achievement(
    id = 450435, badge = "509662",
    title = "Float Zone Level 4 Clear", points = 1,
    description = "Clear Level 2-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W2L4)
)

achievement(
    id = 450436, badge = "509663",
    title = "Float Zone Spookie Trap Clear", points = 1,
    description = "Defeat the Spookie Trap at the end of World 2",
    type = "progression",
    trigger = DefeatBossOnThisFrame(LEVEL_ID_W2BOSS)
)

achievement(
    id = 453098, badge = "512670",
    title = "Jewel Cave Level 1 Clear", points = 2,
    description = "Clear Level 3-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L1)
)

achievement(
    id = 453099, badge = "512671",
    title = "Jewel Cave Level 2 Clear", points = 2,
    description = "Clear Level 3-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L2)
)

achievement(
    id = 453100, badge = "516670",
    title = "Jewel Cave Level 3 Clear", points = 2,
    description = "Clear Level 3-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L3)
)

achievement(
    id = 453101, badge = "512673",
    title = "Jewel Cave Level 4 Clear", points = 2,
    description = "Clear Level 3-4",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W3L4)
)

achievement(
    id = 453102, badge = "512674",
    title = "Jewel Cave Spookie Trap Clear", points = 2,
    description = "Defeat the Spookie Trap at the end of World 3",
    type = "progression",
    trigger = DefeatBossOnThisFrame(LEVEL_ID_W3BOSS)
)

achievement(
    id = 455083, badge = "514331",
    title = "Nite Lite Land Level 1 Clear", points = 2,
    description = "Clear Level 4-1",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L1)
)

achievement(
    id = 455084, badge = "514332",
    title = "Nite Lite Land Level 2 Clear", points = 2,
    description = "Clear Level 4-2",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L2)
)

achievement(
    id = 455089, badge = "514336",
    title = "Nite Lite Land Level 3 Clear", points = 2,
    description = "Clear Level 4-3",
    type = "progression",
    trigger = ClearLevelOnThisFrame(LEVEL_ID_W4L3)
)

achievement(
    id = 455090, badge = "514346",
    title = "Nite Lite Land Level 4 Clear", points = 2,
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
    id = 455675, badge = "522994",
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
    id = 456927, badge = "516644",
    title = "Merry Witchmas I", points = 5,
    description = "Open all present boxes in level 1-1",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W1L1, 5)
)

achievement(
    id = 456928, badge = "516645",
    title = "Merry Witchmas II", points = 5,
    description = "Open all present boxes in level 1-2",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W1L2, 7)
)

achievement(
    id = 456929, badge = "516646",
    title = "Merry Witchmas III", points = 5,
    description = "Open all present boxes in level 1-3",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W1L3, 8)
)

achievement(
    id = 456930, badge = "516647",
    title = "Merry Witchmas IV", points = 5,
    description = "Open all present boxes in level 1-4",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W1L4, 9)
)

achievement(
    id = 456931, badge = "516649",
    title = "Merry Witchmas V", points = 5,
    description = "Open all present boxes in level 2-1",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W2L1, 7)
)

achievement(
    id = 456932, badge = "516650",
    title = "Merry Witchmas VI", points = 5,
    description = "Open all present boxes in level 2-2",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W2L2, 9)
)

achievement(
    id = 456933, badge = "516651",
    title = "Merry Witchmas VII", points = 5,
    description = "Open all present boxes in level 2-3",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W2L3, 9)
)

achievement(
    id = 456934, badge = "516652",
    title = "Merry Witchmas VIII", points = 5,
    description = "Open all present boxes in level 2-4",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W2L4, 10)
)

achievement(
    id = 456935, badge = "516653",
    title = "Merry Witchmas IX", points = 5,
    description = "Open all present boxes in level 3-1",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W3L1, 6)
)

achievement(
    id = 456936, badge = "516654",
    title = "Merry Witchmas X", points = 5,
    description = "Open all present boxes in level 3-2",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W3L2, 9)
)

achievement(
    id = 456945, badge = "516663",
    title = "Merry Witchmas XI", points = 5,
    description = "Open all present boxes in level 3-3",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W3L3, 10)
)

achievement(
    id = 456946, badge = "516665",
    title = "Merry Witchmas XII", points = 5,
    description = "Open all present boxes in level 3-4",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W3L4, 11)
)

achievement(
    id = 456947, badge = "516666",
    title = "Merry Witchmas XIII", points = 5,
    description = "Open all present boxes in level 4-1",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W4L1, 9)
)

achievement(
    id = 456948, badge = "516667",
    title = "Merry Witchmas XIV", points = 5,
    description = "Open all present boxes in level 4-2",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W4L2, 9)
)

achievement(
    id = 456949, badge = "516668",
    title = "Merry Witchmas XV", points = 5,
    description = "Open all obtainable present boxes in level 4-3",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W4L3, 12)
)

achievement(
    id = 456963, badge = "516669",
    title = "Merry Witchmas XVI", points = 5,
    description = "Open all present boxes in level 4-4",
    trigger = OpenedPresentBoxesInLevel(LEVEL_ID_W4L4, 11)
)

achievement(
    id = 459277, badge = "519971",
    title = "Pacifist I", points = 5,
    description = "Clear Level 1-1 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W1L1, W1_ENEMY_STATES)
)

achievement(
    id = 459278, badge = "519972",
    title = "Pacifist II", points = 5,
    description = "Clear Level 1-2 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W1L2, W1_ENEMY_STATES)
)

achievement(
    id = 459279, badge = "519981",
    title = "Pacifist III", points = 5,
    description = "Clear Level 1-3 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W1L3, W1_ENEMY_STATES)
)

achievement(
    id = 459280, badge = "519977",
    title = "Pacifist IV", points = 5,
    description = "Clear Level 1-4 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W1L4, W1_ENEMY_STATES)
)

achievement(
    id = 461712, badge = "522979",
    title = "Pacifist V", points = 5,
    description = "Clear Level 2-1 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W2L1, W2_ENEMY_STATES)
)

achievement(
    id = 461713, badge = "522975",
    title = "Pacifist VI", points = 5,
    description = "Clear Level 2-2 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W2L2, W2_ENEMY_STATES)
)

achievement(
    id = 461714, badge = "522976",
    title = "Pacifist VII", points = 5,
    description = "Clear Level 2-3 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W2L3, W2_ENEMY_STATES)
)

achievement(
    id = 461715, badge ="522977",
    title = "Pacifist VIII", points = 5,
    description = "Clear Level 2-4 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W2L4, W2_ENEMY_STATES)
)

achievement(
    id = 461717, badge = "522980",
    title = "Pacifist IX", points = 5,
    description = "Clear Level 3-1 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W3L1, W3_ENEMY_STATES)
)

achievement(
    id = 461718, badge = "522981",
    title = "Pacifist X", points = 5,
    description = "Clear Level 3-2 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W3L2, W3_ENEMY_STATES)
)

achievement(
    id = 461720, badge = "522982",
    title = "Pacifist XI", points = 5,
    description = "Clear Level 3-3 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W3L3, W3_ENEMY_STATES)
)

achievement(
    id = 461721, badge = "522983",
    title = "Pacifist XII", points = 5,
    description = "Clear Level 3-4 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W3L4, W3_ENEMY_STATES)
)

achievement(
    id = 461728, badge = "522990",
    title = "Pacifist XIII", points = 5,
    description = "Clear Level 4-1 without defeating any of the enemies (including lightbulb bugs)",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W4L1, W4EnemyStatesPlusLightbulbBug())
)

achievement(
    id = 461729, badge = "522991",
    title = "Pacifist XIV", points = 5,
    description = "Clear Level 4-2 without defeating any of the enemies (excluding lightbulb bugs)",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W4L2, W4_ENEMY_STATES)
)

achievement(
    id = 461730, badge = "522992",
    title = "Pacifist XV", points = 5,
    description = "Clear Level 4-3 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W4L3, W4EnemyStatesPlusLightbulbBug())
)

achievement(
    id = 461731, badge = "522993",
    title = "Pacifist XVI", points = 5,
    description = "Clear Level 4-4 without defeating any of the enemies",
    trigger = ClearLevelWithoutDefeatingEnemiesOnThisFrame(LEVEL_ID_W4L4, W4EnemyStatesPlusLightbulbBug())
)

achievement(
    id = 463588, badge = "525086",
    title = "Magic Insurance", points = 2,
    description = "Collect a 1-UP item",
    trigger = LockIfUsedDebugMenuInThisSession() && InGameFlag() == 0x01 &&
              tally(1, EnemyTypesDefeatedOnThisFrame([PRESENT_STATE_OPENED_1UP]))
)

achievement(
    id = 463788, badge = "525299",
    title = "Candy Craze Master", points = 10,
    description = "Clear all levels and defeat the boss in World 1 without losing a life",
    trigger = MasterWorld(LEVEL_ID_W1L1, LEVEL_ID_W1BOSS)
)

achievement(
    id = 463789, badge = "525300",
    title = "Float Zone Master", points = 10,
    description = "Clear all levels and defeat the boss in World 2 without losing a life",
    trigger = MasterWorld(LEVEL_ID_W2L1, LEVEL_ID_W2BOSS)
)

achievement(
    id = 463790, badge = "525301",
    title = "Jewel Cave Master", points = 10,
    description = "Clear all levels and defeat the boss in World 3 without losing a life",
    trigger = MasterWorld(LEVEL_ID_W3L1, LEVEL_ID_W3BOSS)
)

achievement(
    id = 463791, badge = "525302",
    title = "Nite Lite Land Master", points = 10,
    description = "Clear all levels and defeat the boss in World 4 without losing a life",
    trigger = MasterWorld(LEVEL_ID_W4L1, LEVEL_ID_W4BOSS)
)

achievement(
    id = 463786, badge = "525297",
    title = "Crushed To Dust", points = 4,
    description = "Defeat 5 enemies in a single level using the Crush Spell",
    trigger = LockIfUsedDebugMenuInThisSession() && never(InGameFlag() == 0x00) && never(GameOver()) &&
              disable_when(!InArray(SabrinaState(), SABRINA_STATES_CRUSH_SPELL), until=(InGameFlag() == 0x00 || GameOverFlag() == 0x01)) &&
              measured(tally(5, EnemyTypesDefeatedOnThisFrame(AllEnemyStates())))
)

achievement(
    id = 463787, badge = "525298",
    title = "Twister Blister", points = 4,
    description = "Defeat 5 enemies in a single level using the Whilwind Spell",
    trigger = LockIfUsedDebugMenuInThisSession() && never(InGameFlag() == 0x00) && never(GameOver()) &&
              disable_when(!InArray(SabrinaState(), SABRINA_STATES_WHIRLWIND_SPELL), until=(InGameFlag() == 0x00 || GameOverFlag() == 0x01)) &&
              measured(tally(5, EnemyTypesDefeatedOnThisFrame(AllEnemyStates())))
)

achievement(
    id = 463530, badge = "525063",
    title = "Hog Wild", points = 3,
    description = "Defeat a wizard while Sabrina is in pig form",
    trigger = LockIfUsedDebugMenuInThisSession() && InGameFlag() == 0x01 && IsSabrinaInPigForm() &&
              trigger_when(tally(1, EnemyTypesDefeatedOnThisFrame(W3_PIG_WIZARD_STATES)))
)

achievement(
    id = 463720, badge = "525234",
    title = "Spooked No More", points = 10,
    description = "Defeat Spookie in Nite Lite Land stunning him at most 2 times",
    trigger = LockIfUsedDebugMenuInThisSession() && once(StartedLevelOnThisFrame(LEVEL_ID_W4BOSS)) &&
              never(InGameFlag() == 0x00) && never(GameOver()) &&
              never(repeated(3, prev(BossState()) != W4_BOSS_STATE_STUNNED && prev(BossState()) != W4_BOSS_STATE_DAMAGED && BossState() == W4_BOSS_STATE_STUNNED)) &&
              trigger_when(prev(BossHealth()) == 0x00 && BossHealth() == 0xFF)
)

achievement(
    id = 463610, badge = "525088",
    title = "Something Is Missing...", points = 1,
    description = "Collect the only 2 power stars in level 2-3",
    trigger = LockIfUsedDebugMenuInThisSession() && InGameFlag() == 0x01 && LevelId() == LEVEL_ID_W2L3 && GameOverFlag() != 0x01 &&
              prev(CurrentPowerStarCount()) == 0x01 && CurrentPowerStarCount() == 0x02
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