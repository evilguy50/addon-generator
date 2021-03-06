import common/blockTemplate

proc stairBlock*(name: string, root: string, works: string, nameCount: int, nameNumber: int)=
    var mainJson = "./templates/stairBlock/BP/stairBlock.txt"
    var geometry = "./templates/stairBlock/RP/stairBlock.txt"
    var geometryTexture = "./templates/stairBlock/RP/textures/stairBlock.png"
    blockTemplate(name, root, works, nameCount, nameNumber, mainJson, "stone", "stone", geometry, geometryTexture, false)
    return