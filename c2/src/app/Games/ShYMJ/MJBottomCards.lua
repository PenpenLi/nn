local MJBottomCards = class("MJBottomCards",function()
    return display.newSprite()
end)

local sound = require("app.Games.ShYMJ.MJSound")

local cardsArray = {}

local flowerArray = {}

local outArray = {}

local combinArray = {}

local handLevel
local huaLevel
local outLevel
local arrangeLevel

local watchingGame
local animeArrange = false
--82, 129
function MJBottomCards:ctor()
    local texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_normal_card.png")
    local frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 90, 142))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_normal_card.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_normal_card_h.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 90, 142))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_normal_card_h.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_cardvalue_shoupai.png")
    for i = 1, 5 do
        for j = 1, 9 do
            frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(72*(j-1), 89*(i-1), 72, 89))
            cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, string.format("ShYMJ/img_cardvalue_shoupai_%d.png", i*16+j))
        end
    end
    
    --texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_paichiSX_Hua.png")
    -- texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_card.png")
    -- frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 59, 88))
    -- cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_paichiSX_Hua.png")

    -- texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_card_h.png")
    -- frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 59, 88))
    -- cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_paichiSX_Hua_h.png")
    -- texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_cardvaluePaichiSX_Hua.png")
    -- --124X111
    -- for i = 1, 3 do
    --     for j = 1, 4 do
    --         if i == 1 and j < 4 then
    --             frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(31*(j-1), 39*(i-1), 31, 39))
    --             cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, string.format("ShYMJ/img_cardvaluePaichiSX_Hua%d.png", 4*16+4+j))
    --         elseif i == 2 then
    --             frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(31*(j-1), 39*(i-1), 31, 39))
    --             cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, string.format("ShYMJ/img_cardvaluePaichiSX_Hua%d.png", 5*16+j))
    --         elseif i == 3 then
    --             frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(31*(j-1), 39*(i-1), 31, 39))
    --             cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, string.format("ShYMJ/img_cardvaluePaichiSX_Hua%d.png", 5*16+4+j))
    --         end
    --     end
    -- end
    
    --texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_paichiSX.png")
    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_card.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 59, 88))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_paichiSX.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_card_h.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 59, 88))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_paichiSX_h.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_cardvaluePaichiSX.png")
    for i = 1, 4 do
        for j = 1, 9 do
            frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(36*(j-1), 44.6*(i-1), 36, 44.6))
            cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, string.format("ShYMJ/img_cardvaluePaichiSX%d.png", i*16+j))
        end
    end
    
    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_mydaopai_cpg.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 78, 74))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_mydaopai_cpg.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_mydaopai_cpg_h.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 78, 74))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_mydaopai_cpg_h.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_cardvalue_daocpg.png")
    for i = 1, 4 do
        for j = 1, 9 do
            frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(60*(j-1), 48*(i-1), 60, 48))
            cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, string.format("ShYMJ/img_cardvalue_daocpg%d.png", i*16+j))
        end
    end
    
    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_backcard.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 59, 88))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_backcard.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_backcard_h.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 59, 88))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_backcard_h.png")


    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_card.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 59, 88))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_card.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_card_h.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 59, 88))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_card_h.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_cardvalue_cpg.png")
    for i = 1, 4 do
        for j = 1, 9 do
            frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(56*(j-1), 69.2*(i-1), 56, 69.2))
            cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, string.format("ShYMJ/img_cardvalue_cpg%d.png", i*16+j))
        end
    end
    
    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_tanpai_hun.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 74, 126))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_tanpai_hun.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_tanpai_hun_cai.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 74, 126))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_tanpai_hun_cai.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_up_card_hun.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 36, 56))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_up_card_hun.png")

    
    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_up_card_hun_cai.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 36, 56))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_up_card_hun_cai.png")


    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_spe_pangguan_card.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 61, 69))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_spe_pangguan_card.png")

    texture = cc.Director:getInstance():getTextureCache():addImage("ShYMJ/img_normal_card_shadow.png")
    frame = cc.SpriteFrame:createWithTexture(texture, cc.rect(0, 0, 90, 142))
    cc.SpriteFrameCache:getInstance():addSpriteFrame(frame, "ShYMJ/img_normal_card_shadow.png")

    outLevel = display.newSprite()
    :addTo(self)
    huaLevel = display.newSprite()
    :addTo(self)
    handLevel = display.newSprite()
    :addTo(self)
    arrangeLevel = display.newSprite()
    :addTo(self)
end

function MJBottomCards:addFlower(card)
    local count = #flowerArray
    local scaleX = 0.644
    local scaleY = 0.727
    local num = 7
    local bPosX = 0
    local num2 = 9
    if max == 2 then
        bPosX = 38
        num2 = 16
        num = 6
    end

    local offX = 18
    local offY = 31

    local dis = math.floor(count/num)
    local imgName = "#ShYMJ/img_spe_paichiSX_Hua"
    imgName = getUsedSrc(imgName)
    local sprite = display.newSprite(imgName)
    :setScale(scaleX, scaleY)
    :pos(display.cx-37*num2/2-37*num+(count%num)*37.5-bPosX, display.bottom+ 289-58*2 +dis*48)
    :addTo(huaLevel,3-dis)
    display.newSprite(string.format("#ShYMJ/img_cardvaluePaichiSX_Hua%d.png", card))
    :pos(12+offX, 23+offY)
    :addTo(sprite)
    :setScale(1.2)
    table.insert(flowerArray, count+1, {val=card, sprite=sprite})
    return self
end

function MJBottomCards:addOut(card, max)
    local num = 9
    if max == 2 then
        num = 16
    end
    local val = self.callBack:getDragonCard()
    local count = #outArray
    -- if count > 2*num-1 then
    --     local flower = outArray[count].flower
    --     flower:setSpriteFrame(cc.SpriteFrameCache:getInstance():getSpriteFrame(string.format("ShYMJ/img_cardvaluePaichiSX%d.png", card)))
    --     local dragon = outArray[count].dragon
    --     if card == val then
    --         dragon:show()
    --     else
    --         dragon:hide()
    --     end
    -- else
    local scaleX = 0.644
    local scaleY = 0.727
    local offX = 8
    local offY = 16
    local bPosX = 0
    if max == 4 then
        bPosX = 0
    end
        local dis = math.floor(count/num)
        --dis = 47*(dis % 2) - 12*math.floor(dis/2)
        local imgName = "#ShYMJ/img_spe_paichiSX"
        imgName = getUsedSrc(imgName)
        local sprite = display.newSprite(imgName)
        :setScale(scaleX, scaleY)
        :pos(display.cx-37*num/2+18+ (count%num)*37+bPosX, display.bottom + 272 - dis*48)
        :addTo(outLevel)
        local flower=display.newSprite(string.format("#ShYMJ/img_cardvaluePaichiSX%d.png", card))
        :pos(21+offX, 37+offY)
        :setScale(1.4)
        :addTo(sprite)

        local icon = "#ShYMJ/img_up_card_hun.png"
        local majiang = self.callBack:getMajiang()
        if majiang == "shzhmj" then
            icon = "#ShYMJ/img_up_card_hun_cai.png"
        end
        local dragon=display.newSprite(icon)
        :pos(25-10+offX/2, 40+6+offY+offY/2)
        :setRotation(180)
        :addTo(sprite)
        if card == val then
            sprite:setColor(cc.c3b(235, 206, 134))
            sprite:setCascadeColorEnabled(false)
            dragon:show()
        else
            dragon:hide()
        end
        table.insert(outArray, count+1, {val=card, sprite=sprite, flower=flower, dragon=dragon})
    -- end
    
    return self
end

function MJBottomCards:removeCombin(combin, card)
    local count = #combinArray
    for i = 1, count do
        if card == combinArray[i].val and combin == combinArray[i].combin then
            local sp = table.remove(combinArray, i)
            sp.sprite:removeFromParent()
            break
        end
    end
    count = #combinArray
    for i = 1, count do
        local sp = combinArray[i].sprite
        sp:pos(display.left+30+3*36 + (i-1)*3*72, display.bottom+56)
    end
end

function MJBottomCards:addCombin(combin, card, direct)
    local count = #combinArray
    local sprite = display.newSprite()
    :pos(display.left+30+3*36 + count*3*72, display.bottom+56)
    :addTo(handLevel)
    print("MJBottomCards-combin-direct",combin,direct)
    local img_mydaopai_cpg = "#ShYMJ/img_mydaopai_cpg"
    img_mydaopai_cpg = getUsedSrc(img_mydaopai_cpg)
    local scale = 0.9
    local img_spe_card = "#ShYMJ/img_spe_card"
    img_spe_card = getUsedSrc(img_spe_card)
    if combin == "left" then
        local temp =  display.newSprite(img_spe_card)
        :addTo(sprite)
        :pos(10, 0)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card+1))
        :pos(30, 54)
        :addTo(temp)
        temp =  display.newSprite(img_mydaopai_cpg)
        :pos(-60+4,-12+1)
        :setScale(scale)
        :addTo(sprite)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_daocpg%d.png", card))
        :pos(40, 48)
        :addTo(temp)
        temp =  display.newSprite(img_spe_card)
        :pos(70,0)
        :addTo(sprite)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card+2))
        :pos(30, 54)
        :addTo(temp)
    elseif combin == "center" then
        local temp =  display.newSprite(img_spe_card)
        :pos(10, 0)
        :addTo(sprite)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card-1))
        :pos(30, 54)
        :addTo(temp)
        temp =  display.newSprite(img_mydaopai_cpg)
        :pos(-60+4,-12+1)
        :setScale(scale)
        :addTo(sprite)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_daocpg%d.png", card))
        :pos(40, 48)
        :addTo(temp)
        temp =  display.newSprite(img_spe_card)
        :pos(70,0)
        :addTo(sprite)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card+1))
        :pos(30, 54)
        :addTo(temp)
    elseif combin == "right" then
        local temp =  display.newSprite(img_spe_card)
        :pos(10, 0)
        :addTo(sprite)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card-2))
        :pos(30, 54)
        :addTo(temp)
        temp =  display.newSprite(img_mydaopai_cpg)
        :pos(-60+4,-12+1)
        :setScale(scale)
        :addTo(sprite)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_daocpg%d.png", card))
        :pos(40, 48)
        :addTo(temp)
        temp =  display.newSprite(img_spe_card)
        :pos(70,0)
        :addTo(sprite)
        display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card-1))
        :pos(30, 54)
        :addTo(temp)
    elseif combin == "peng" then
        if direct == "left" then
            local temp =  display.newSprite(img_spe_card)
            :pos(10, 0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_mydaopai_cpg)
            :pos(-60+4,-12)
            :setScale(scale)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_daocpg%d.png", card))
            :pos(40+1, 48)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(70,0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
        elseif direct == "right" then
            local temp =  display.newSprite(img_spe_card)
            :pos(-10, 0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_mydaopai_cpg)
            :pos(57,-12)
            :setScale(scale)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_daocpg%d.png", card))
            :setRotation(180)
            :pos(40, 48)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(-70,0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
        else
            local temp =  display.newSprite(img_spe_card)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(-60,0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(60,0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
        end
    elseif combin == "gang" then
        if direct == "left" then
            local temp =  display.newSprite(img_spe_card)
            :pos(10, 0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_mydaopai_cpg)
            :pos(-56,-12)
            :setScale(scale)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_daocpg%d.png", card))
            :pos(40, 48)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(70,0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(10,15)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
        elseif direct == "right" then
            local temp =  display.newSprite(img_spe_card)
            :pos(-10, 0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_mydaopai_cpg)
            :pos(56,-12)
            :setScale(scale)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_daocpg%d.png", card))
            :setRotation(180)
            :pos(40, 48)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(-70,0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(-10,15)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
        elseif direct == "top" then
            local temp =  display.newSprite(img_spe_card)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(-60,0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(60,0)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
            temp =  display.newSprite(img_spe_card)
            :pos(0,15)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
        else
            local img_spe_backcard = "#ShYMJ/img_spe_backcard"
            img_spe_backcard = getUsedSrc(img_spe_backcard)
            local temp =  display.newSprite(img_spe_backcard)
            :addTo(sprite)
            temp =  display.newSprite(img_spe_backcard)
            :pos(-60,0)
            :addTo(sprite)
            temp =  display.newSprite(img_spe_backcard)
            :pos(60,0)
            :addTo(sprite)
            temp =  display.newSprite(img_spe_card)
            :pos(0,24)
            :addTo(sprite)
            display.newSprite(string.format("#ShYMJ/img_cardvalue_cpg%d.png", card))
            :pos(30, 54)
            :addTo(temp)
        end
    end
    table.insert(combinArray, count+1, {combin=combin, val=card, sprite=sprite})
    return self
end

function MJBottomCards:getClickCard(sprite)
    local count = #cardsArray
    for i = 1, count do
        if sprite == cardsArray[i].sprite then
            return cardsArray[i]
        end
    end
    return nil
end

function MJBottomCards:clearSelectCard()
    local count = #cardsArray
    for i = 1, count do
        if cardsArray[i].select > 0 then
            cardsArray[i].select = 0
            local x, y = cardsArray[i].sprite:getPosition()
            cardsArray[i].sprite:pos(x, display.bottom+80)
        end
    end
end

function MJBottomCards:onBeganCard(x, y)
    local count = #cardsArray
    for i = 1, count do
        if cardsArray[i].touch then
            if cardsArray[i].sprite:hitTest(cc.p(x, y), false) then
                if cardsArray[i].select > 0 then
                    cardsArray[i].select = cardsArray[i].select + 1
                    return 
                end

                self:clearSelectCard()
                cardsArray[i].select = 1
                local px, py = cardsArray[i].sprite:getPosition()
                cardsArray[i].sprite:pos(px, display.bottom+80 + 30)
                sound.selectCard()
                return
            end
        end
    end
end

function MJBottomCards:onSelectCard(x, y)
    local count = #cardsArray
    for i = 1, count do
        if cardsArray[i].touch then
            if cardsArray[i].sprite:hitTest(cc.p(x, y), false) then
                if cardsArray[i].select > 0 then
                    return 
                end

                self:clearSelectCard()
                cardsArray[i].select = 1
                local px, py = cardsArray[i].sprite:getPosition()
                cardsArray[i].sprite:pos(px, display.bottom+80 + 30)
                sound.selectCard()
                return
            end
        end
    end
end

function MJBottomCards:onClickCard(x, y)
    local count = #cardsArray
    for i = 1, count do
        if cardsArray[i].touch then
            if cardsArray[i].sprite:hitTest(cc.p(x, y), false) then
                if cardsArray[i].select > 1 then
                    cardsArray[i].select = 0
                    self:allowOut(false)
                    self.callBack:onOutCard(cardsArray[i].val)
                end
                return
            end
        end
    end

    for i = 1, count do
        if cardsArray[i].touch and cardsArray[i].select > 0 and y > display.bottom+200 then
            cardsArray[i].select = 0
            self:allowOut(false)
            self.callBack:onOutCard(cardsArray[i].val)
            return
        end
    end
end

function MJBottomCards:addCard(card)
    local imgName = "#ShYMJ/img_normal_card"
    imgName = getUsedSrc(imgName)
    local sprite = display.newSprite(imgName)
    :addTo(handLevel)

    local val = self.callBack:getDragonCard()
    
    if card > 0 then
        local cardSprite = display.newSprite(string.format("#ShYMJ/img_cardvalue_shoupai_%d.png", card))
        :pos(37+4+4, 56-3+6)
        :addTo(sprite)
        if card == val then
            sprite:setColor(cc.c3b(235, 206, 134))
            sprite:setCascadeColorEnabled(false)
        end
    else
         display.newSprite("#ShYMJ/img_spe_pangguan_card.png")
        :pos(38, 52)
        :addTo(sprite)
    end

    local icon = "#ShYMJ/img_tanpai_hun.png"
    local majiang = self.callBack:getMajiang()
    if majiang == "shzhmj" then
        icon = "#ShYMJ/img_tanpai_hun_cai.png"
    end
    local dragon = display.newSprite(icon)
    :pos(37+2, 63-1+14)
    :addTo(sprite)
    if card ~= val then
        dragon:hide()
    end
    
    local shadow = display.newSprite("#ShYMJ/img_normal_card_shadow.png")
    :pos(37+4+4, 58+13)
    :hide()
    :addTo(sprite)        

    sprite:addNodeEventListener(cc.NODE_TOUCH_EVENT, function (event)
        if event.name == "began" then
            if self.callBack then
                self.callBack:HideAllhua()
            end
            self:onBeganCard(event.x, event.y)
            return true
        elseif event.name == "moved" then
            self:onSelectCard(event.x, event.y)
        elseif event.name == "ended" then
            self:onClickCard(event.x, event.y)
        end
    end)
    table.insert(cardsArray, #cardsArray+1, {val=card, sprite=sprite, select=0, shadow=shadow, touch=false})
    return self
end

function MJBottomCards:removeAllCard()


end

function MJBottomCards:removeCard(card)
    if watchingGame then
        local count = 3 * #combinArray + #cardsArray
        if count > 13 then
            local out = table.remove(cardsArray, 1)
            if out ~= nil then
                out.sprite:removeFromParent()
            end
        end
    else
        local count = #cardsArray
        for i = 1, count do
            if card == cardsArray[i].val then
                local sp = table.remove(cardsArray, i)
                sp.sprite:removeFromParent()
                return
            end
        end
    end
end

function MJBottomCards:removeFlower()
    local count = #cardsArray
    for i = 1, count do
        if cardsArray[i].val > 16*4+4 then
            local sp = table.remove(cardsArray, i)
            sp.sprite:removeFromParent()
            return sp.val
        end
    end
    return 0
end

function MJBottomCards:sortCards(ignore)
    local dragon = self.callBack:getDragonCard()
    local count = #cardsArray
    if ignore then
        if count < 3 then
            return 
        end
        count = count - 1
    else
        if count < 2 then
            return 
        end
    end
    
    for i = 1, count-1 do
        for j = i + 1, count do
            if cardsArray[i].val > cardsArray[j].val then
                if cardsArray[i].val ~= dragon then
                    local temp = cardsArray[i]
                    cardsArray[i] = cardsArray[j]
                    cardsArray[j] = temp
                end
            elseif cardsArray[i].val < cardsArray[j].val then
                if cardsArray[j].val == dragon then
                    local temp = cardsArray[i]
                    cardsArray[i] = cardsArray[j]
                    cardsArray[j] = temp
                end
            end
        end
    end
end

function MJBottomCards:arrangeCards(mode)
    local count = #cardsArray
    local width = 88
    local offX = 25-10
    local offY = 12-3
    print("arrangeCards--mode = ",mode)
    if count > 0 then
        for pos = 1, count do
            local sprite = cardsArray[pos].sprite
            if mode == "center" then
                sprite:pos(display.cx - 37*(count+1) + pos*width+offX, display.bottom+80-offY)
            elseif mode == "right" then
                sprite:pos(display.right-115-37-(count-pos)*width+offX-15-7, display.bottom+80-offY)
            elseif mode == "link" then
                sprite:pos(display.right-115+37-(count-pos)*width+offX-8, display.bottom+80-offY)
            elseif mode == "single" then
                if pos == count then
                    sprite:pos(display.right-115+54+offX-10, display.bottom+80-offY)
                else
                    sprite:pos(display.right-115+37-(count-pos)*width+offX-8, display.bottom+80-offY)
                end
            end 
        end
    end
end

function MJBottomCards:distributeCards(cards)
    for i=1, #cards do
        self:addCard(cards[i])
    end
    local count = #cardsArray + 3*#combinArray
    if count > 13 then
        self:sortCards()
        self:arrangeCards("link")
        sound.arrangeCard()
    elseif count == 13 then
        self:sortCards()
        self:arrangeCards("right")
        sound.arrangeCard()
    else
        self:arrangeCards("center")
    end
    return self
end

function MJBottomCards:arrangeAnime(anime)
    if anime then
        animeArrange = true
        local count = #cardsArray
        local img_spe_backcard = "#ShYMJ/img_spe_backcard"
        img_spe_backcard = getUsedSrc(img_spe_backcard)
        for i = 1, count do
            local sprite = display.newSprite(img_spe_backcard)
            :pos(display.cx - 31*(count+1) + i*62, display.bottom+80)
            :addTo(arrangeLevel)
        end
        handLevel:hide()
    elseif animeArrange then
        animeArrange = false
        arrangeLevel:removeAllChildren()
        handLevel:show()
    end
end

function MJBottomCards:outCard(card)
    self:removeCard(card)
    self:sortCards()
    self:arrangeCards("right")
    -- self:addOut(card)
end

function MJBottomCards:drawCard(card)
    self:addCard(card)
    self:arrangeCards("single")
end

function MJBottomCards:complementCards(cards, del)
    local count = #cards
    for i = 1, count do
        if cards[i] < 16*4+5 then
            self:addCard(cards[i])
        else
            --self:addFlower(cards[i])
            if del and watchingGame then
                self:removeCard()
            end
        end
    end
    
    while true do
        local card = self:removeFlower()
        if card == 0 then
            break
        end
    end
 
    self:sortCards(true)
    self:arrangeCards("single")
end

function MJBottomCards:combinCard(combin, card, direct)
    self:addCombin(combin, card, direct)
    if combin == "left" then
        self:removeCard(card+1)
        self:removeCard(card+2)
    elseif combin == "center" then
        self:removeCard(card-1)
        self:removeCard(card+1)
    elseif combin == "right" then
        self:removeCard(card-2)
        self:removeCard(card-1)
    elseif combin == "peng" then
        self:removeCard(card)
        self:removeCard(card)
    elseif combin == "gang" then
        self:removeCombin("peng", card)
        self:removeCard(card)
        self:removeCard(card)
        self:removeCard(card)
        self:removeCard(card)
    end
    self:arrangeCards("link")
end

function MJBottomCards:allowOut(allow, card, mode)
    if not watchingGame then
        local count = #cardsArray
        for i = 1, count do
            if allow then
                local ignore = false
                if mode == 1 then
                    ignore = true
                end
                for j = 1, #card do
                    if cardsArray[i].val == card[j] then
                        if mode == 1 then
                            ignore = false
                        else
                            ignore = true
                        end
                        break
                    end
                end
                if ignore then
                    cardsArray[i].touch = false
                    cardsArray[i].shadow:show()
                    cardsArray[i].sprite:setTouchEnabled(false)
                else
                    cardsArray[i].touch = true
                    cardsArray[i].shadow:hide()
                    cardsArray[i].sprite:setTouchEnabled(true)
                end
            else
                cardsArray[i].touch = false
                cardsArray[i].sprite:setTouchEnabled(false)
                cardsArray[i].shadow:hide()
            end
        end
    end
end

function MJBottomCards:allowFlower(allow, card)
    if not watchingGame then
        local count = #cardsArray
        for i = 1, count do
            if allow then
                if cardsArray[i].val == card then
                    cardsArray[i].touch = true
                    cardsArray[i].sprite:setTouchEnabled(true)
                    cardsArray[i].shadow:hide()
                else
                    cardsArray[i].touch = false
                    cardsArray[i].sprite:setTouchEnabled(false)
                    cardsArray[i].shadow:show()
                end
            else
                cardsArray[i].touch = false
                cardsArray[i].sprite:setTouchEnabled(false)
                cardsArray[i].shadow:hide()
            end
        end
    end
end

function MJBottomCards:watching(watch)
    watchingGame = watch
end

function MJBottomCards:clear()
    cardsArray = {}
    flowerArray = {}
    outArray = {}
    combinArray = {}
    handLevel = nil
    huaLevel = nil
    outLevel = nil
    arrangeLevel = nil
end
function MJBottomCards:restart()
    handLevel:removeAllChildren()
    huaLevel:removeAllChildren()
    outLevel:removeAllChildren()
    arrangeLevel:removeAllChildren()
    cardsArray = {}
    flowerArray = {}
    outArray = {}
    combinArray = {}
end

function MJBottomCards:init(callback)
    self.callBack = callback
    return self
end

return MJBottomCards