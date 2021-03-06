
local consts = require("app.Games.HkFiveCard.constants")

local message = require("app.net.Message")

local GP_Audio = require("app.Games.GP.GP_Audio")
local MiddlePopBoxLayer = require("app.layers.MiddlePopBoxLayer")

local sound_common = require("app.Common.sound_common")

local PATH = consts.PATH


local scene = nil

local uiSettings = {}

function uiSettings:init(tableScene)
	scene = tableScene
    self.btn_settings = cc.uiloader:seekNodeByNameFast(scene.root, "btn_settings")
	self.con_settings = cc.uiloader:seekNodeByNameFast(scene.root, "container_settings")
	self.btn_sound = cc.uiloader:seekNodeByName(scene.root, "btn_sound")
	self.btn_exit = cc.uiloader:seekNodeByName(scene.root, "btn_exit")
    self.btn_settings:onButtonClicked(function() self:clickSettings() end)
    self.btn_sound:onButtonClicked(function() self:clickSound() end)
    self.btn_exit:onButtonClicked(function() self:clickExit() end)

    self.is_settings_upped = true
    self.out_of_screen = self.con_settings:getPositionY()
    				+ self.con_settings:getContentSize().height
    				- display.height
    self.settings_move_dis = self.con_settings:getContentSize().height 
					- self.btn_settings:getCascadeBoundingBox().size.height * 0.9
					- self.out_of_screen

	self:showSettings(false)
	return self
end

function uiSettings:clear()
	
end

function uiSettings:update()
	if GP_Audio.isAudioEnabled() then
		self.btn_sound:setButtonImage("normal", PATH.BTN_SOUND_NORMAL, true)
    	self.btn_sound:setButtonImage("pressed", PATH.BTN_SOUND_PRESSED, true)
    else
    	self.btn_sound:setButtonImage("normal", PATH.BTN_MUTE_NORMAL, true)
    	self.btn_sound:setButtonImage("pressed", PATH.BTN_MUTE_PRESSED, true)
	end

	if self.is_settings_upped then
		self.btn_settings:setButtonImage("normal", PATH.BTN_CCDOWN_NORMAL, true)
    	self.btn_settings:setButtonImage("pressed", PATH.BTN_CCDOWN_PRESSED, true)
	else
		self.btn_settings:setButtonImage("normal", PATH.BTN_CCUP_NORMAL, true)
    	self.btn_settings:setButtonImage("pressed", PATH.BTN_CCUP_PRESSED, true)
	end
end

function uiSettings:clickSettings() 
	self.is_settings_upped = not self.is_settings_upped
	self:showSettings(not self.is_settings_upped)
	self:update()
end

function uiSettings:clickSound()
	if self.btn_sound == nil then 
		return 
	end

	GP_Audio.switchAudioEnabled()
	self:update()
end

function uiSettings:clickExit()
	print("clickExit")

	-- exit reminder
    MiddlePopBoxLayer.new(app.lang.exit, app.lang.exit_tips,
        MiddlePopBoxLayer.ConfirmTable, true, nil, function ()
			-- send leave table msg to server then quit table
			message.dispatchGame("room.LeaveGame")
			sound_common.confirm()

        end)
    :addTo(scene)

end

function uiSettings:showSettings(flag)
	self.btn_sound:setVisible(flag)
	self.btn_sound:setButtonEnabled(flag)
	self.btn_exit:setVisible(flag)
	self.btn_exit:setButtonEnabled(flag)
	if flag then
		self.con_settings:setPositionY(self.con_settings:getPositionY() - self.settings_move_dis)
	else
		self.con_settings:setPositionY(self.con_settings:getPositionY() + self.settings_move_dis)
	end
end


return uiSettings
