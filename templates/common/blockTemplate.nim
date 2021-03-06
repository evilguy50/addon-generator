import os
import strformat
import folderExist
import nameReplace
import blockJson
import langFiles

proc blockTemplate*(name: string, root: string, works: string, nameCount: int,
 nameNumber: int, mainJson: string, soundJson: string, soundJsonEntry: string, function: bool)=
    var soundJson2 = soundJson
    var soundJsonEntry2 = soundJsonEntry
    case soundJson:
    of "stone":
       soundJson2 = "./templates/common/RP/stone_blockSound.txt"
    of "glass":
       soundJson2 = "./templates/common/RP/glass_blockSound.txt"
    case soundJsonEntry:
    of "stone":
       soundJsonEntry2 = "./templates/common/RP/stone_blockSound_entry.txt"
    of "glass":
       soundJsonEntry2 = "./templates/common/RP/glass_blockSound_entry.txt"


    #create BP folders
    folderExist("BP")
    folderExist("BP/blocks")
    folderExist("BP/texts")
    folderExist("BP/loot_tables")
    folderExist("BP/loot_tables/blocks")
    echo "generated behaviour folders"

    #create RP folders
    folderExist("RP")
    folderExist("RP/textures")
    folderExist("RP/textures/blocks")
    folderExist("RP/texts")
    echo "generated resource folders"

    #define blocks in BP
    os.setCurrentDir(root)
    var bpBlockName = fmt"./{works}/BP/blocks/{name}.json"
    nameReplace(mainJson, bpBlockName, name)
    echo name, " generated block as ", name, ".json"

    #generate loot tables
    var lootTemplate = "./templates/common/BP/blockLoot.txt"
    var lootFile = fmt"./{works}/BP/loot_tables/blocks/{name}.json"
    nameReplace(lootTemplate, lootFile, name)
    echo name, " generated loottable as ", name, ".json"

    if function == true:
       folderExist("BP/functions")
       var functionFile = fmt"./{works}/BP/functions/{name}.mcfunction"
       writeFile(functionFile, "")

    #generate block json for RP
    blockJson(works, name, nameNumber, nameCount, soundJsonEntry2, soundJson2)
    echo name, " generated block entry for ", name

    #generate texture json
    terrainJson(works, name, nameNumber, nameCount)
    echo name, " generated texture entry for ", name

    #generate language files
    var rpLang_entry = fmt"tile.evil:{name}.name={name}"
    bpLang(works, name)
    rpLang(works, name, rpLang_entry)
    echo name, " generated lang entries for ", name

    var blockTextureFile = "./templates/common/RP/textures/evil.png"
    var blockTextureString = fmt"./{works}/RP/textures/blocks/{name}.png"
    copyFile(blockTextureFile, blockTextureString)
    echo name, " generated texture as ", name, ".json"

    os.setCurrentDir(works)
    return

proc blockTemplate*(name: string, root: string, works: string, nameCount: int,
 nameNumber: int, mainJson: string, soundJson: string, soundJsonEntry: string, geometry: string, geometryTexture: string, function: bool)=
    var soundJson2 = soundJson
    var soundJsonEntry2 = soundJsonEntry
    case soundJson:
    of "stone":
       soundJson2 = "./templates/common/RP/stone_blockSound.txt"
    of "glass":
       soundJson2 = "./templates/common/RP/glass_blockSound.txt"
    case soundJsonEntry:
    of "stone":
       soundJsonEntry2 = "./templates/common/RP/stone_blockSound_entry.txt"
    of "glass":
       soundJsonEntry2 = "./templates/common/RP/glass_blockSound_entry.txt"
    var geometryTexture2 = geometryTexture
    if geometryTexture == "evil":
       geometryTexture2 = "./templates/common/RP/textures/evil.png"

    #create BP folders
    folderExist("BP")
    folderExist("BP/blocks")
    folderExist("BP/texts")
    folderExist("BP/loot_tables")
    folderExist("BP/loot_tables/blocks")
    echo "generated behaviour folders"

    #create RP folders
    folderExist("RP")
    folderExist("RP/textures")
    folderExist("RP/textures/blocks")
    folderExist("RP/models")
    folderExist("RP/models/entity")
    folderExist("RP/texts")
    echo "generated resource folders"

    #define blocks in BP
    os.setCurrentDir(root)
    var bpBlockName = fmt"./{works}/BP/blocks/{name}.json"
    nameReplace(mainJson, bpBlockName, name)
    echo name, " generated block as ", name, ".json"

    #generate loot tables
    var lootTemplate = "./templates/common/BP/blockLoot.txt"
    var lootFile = fmt"./{works}/BP/loot_tables/blocks/{name}.json"
    nameReplace(lootTemplate, lootFile, name)
    echo name, " generated loottable as ", name, ".json"

    if function == true:
       folderExist("BP/functions")
       var functionFile = fmt"./{works}/BP/functions/{name}.mcfunction"
       writeFile(functionFile, "")

    #generate block json for RP
    blockJson(works, name, nameNumber, nameCount, soundJsonEntry2, soundJson2)
    echo name, " generated block entry for ", name

    #generate texture json
    terrainJson(works, name, nameNumber, nameCount)
    echo name, " generated texture entry for ", name

    #generate language files
    var rpLang_entry = fmt"tile.evil:{name}.name={name}"
    bpLang(works, name)
    rpLang(works, name, rpLang_entry)
    echo name, " generated lang entries for ", name

    #generate block model
    var geoString = fmt"./{works}/RP/models/entity/{name}.json"
    nameReplace(geometry, geoString, name)
    
    var blockTextureString = fmt"./{works}/RP/textures/blocks/{name}.png"
    copyFile(geometryTexture2, blockTextureString)
    echo name, " generated texture as ", name, ".json"

    os.setCurrentDir(works)
    return