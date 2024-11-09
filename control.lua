local TrainJumper = require("scripts/train_jumper")

local function UpdatedTrainAvoidSetting()
    TrainJumper.SetTrainAvoidEvents()
end

local function UpdateSetting(settingName)
    if settingName == "train-avoid-mode" or settingName == nil then
        UpdatedTrainAvoidSetting()
    end
end

local function CreateStorages()
    if storage.State == nil then
        storage.State = {}
    end
end

local function OnStartup()
    CreateStorages()
    TrainJumper.PopulateStateDefaults()
    UpdateSetting(nil)
end

local function OnLoad()
    TrainJumper.SetTrainAvoidEvents()
end

local function OnSettingChanged(event)
    UpdateSetting(event.setting)
end

script.on_init(OnStartup)
script.on_load(OnLoad)
script.on_event(defines.events.on_runtime_mod_setting_changed, OnSettingChanged)
script.on_configuration_changed(OnStartup)
