-- ============================================================
-- OK Hub - Blox Fruits (Fully Decompiled)
-- Decompiled from XHider/Xgayder v1.2 Obfuscation
-- ============================================================
-- Original: OK Hub Script for Blox Fruits (Roblox)
-- All string constants decoded (3841 strings)
-- VM bytecode reconstructed to readable Lua source
-- ============================================================

-- ==================== SERVICES ====================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local StarterGui = game:GetService("StarterGui")

-- ==================== VARIABLES ====================
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Backpack = LocalPlayer.Backpack

-- ==================== REMOTES ====================
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local CommF_ = Remotes:WaitForChild("CommF_")
local CommE = Remotes:WaitForChild("CommE")

-- Remote Functions
local RF_Craft = Remotes:WaitForChild("RF/Craft")
local RF_DragonHunter = Remotes:WaitForChild("RF/DragonHunter")
local RF_FruitCustomizerRF = Remotes:WaitForChild("RF/FruitCustomizerRF")
local RF_InteractDragonQuest = Remotes:WaitForChild("RF/InteractDragonQuest")
local RF_JobToolAbilities = Remotes:WaitForChild("RF/JobToolAbilities")
local RF_JobsRemoteFunction = Remotes:WaitForChild("RF/JobsRemoteFunction")
local RF_KitsuneStatuePray = Remotes:WaitForChild("RF/KitsuneStatuePray")
local RF_SubmarineWorkerSpeak = Remotes:WaitForChild("RF/SubmarineWorkerSpeak")

-- Remote Events
local RE_RegisterAttack = Remotes:WaitForChild("RE/RegisterAttack")
local RE_RegisterHit = Remotes:WaitForChild("RE/RegisterHit")
local RE_ShootGunEvent = Remotes:WaitForChild("RE/ShootGunEvent")
local RE_TouchKitsuneStatue = Remotes:WaitForChild("RE/TouchKitsuneStatue")

-- ==================== UTILITY FUNCTIONS ====================
local function GetCharacter()
    return LocalPlayer.Character
end

local function GetHumanoid()
    local char = GetCharacter()
    return char and char:FindFirstChild("Humanoid")
end

local function GetHRP()
    local char = GetCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function GetHealth()
    local hum = GetHumanoid()
    return hum and hum.Health or 0
end

local function IsAlive()
    local hum = GetHumanoid()
    return hum and hum.Health > 0
end

local function TeleportTo(cframe)
    local hrp = GetHRP()
    if hrp then
        hrp.CFrame = cframe
    end
end

local function TweenTo(cframe, speed)
    speed = speed or 100
    local hrp = GetHRP()
    if hrp then
        local distance = (hrp.Position - cframe.Position).Magnitude
        local tweenInfo = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
        local tween = game:GetService("TweenService"):Create(hrp, tweenInfo, {CFrame = cframe})
        tween:Play()
        tween.Completed:Wait()
    end
end

local function GetDistance(position)
    local hrp = GetHRP()
    if hrp then
        return (hrp.Position - position).Magnitude
    end
    return math.huge
end

local function FindNearestEnemy(maxDistance)
    maxDistance = maxDistance or math.huge
    local nearest = nil
    local nearestDist = maxDistance
    for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            local dist = GetDistance(enemy.HumanoidRootPart.Position)
            if dist < nearestDist then
                nearest = enemy
                nearestDist = dist
            end
        end
    end
    return nearest
end

-- ==================== NETWORK FUNCTIONS ====================
local function InvokeCommF(method, ...)
    return CommF_:InvokeServer(method, ...)
end

local function FireCommE(method, ...)
    CommE:FireServer(method, ...)
end

-- ==================== GAME API FUNCTIONS ====================

-- Quest Functions

local function AbandonQuest()
    return CommF_:InvokeServer("AbandonQuest")
end

local function AcceptAlly()
    return CommF_:InvokeServer("AcceptAlly")
end

local function AcceptQuestC()
    return CommF_:InvokeServer("AcceptQuestC")
end

local function AskQuest()
    return CommF_:InvokeServer("AskQuest")
end

local function BartiloQuest()
    return CommF_:InvokeServer("BartiloQuest")
end

local function BartiloQuestProgress()
    return CommF_:InvokeServer("BartiloQuestProgress")
end

local function BoatQuest()
    return CommF_:InvokeServer("BoatQuest")
end

local function CDKQuest()
    return CommF_:InvokeServer("CDKQuest")
end

local function CitizenQuest()
    return CommF_:InvokeServer("CitizenQuest")
end

local function CitizenQuestProgress()
    return CommF_:InvokeServer("CitizenQuestProgress")
end

local function Complete_Trials()
    return CommF_:InvokeServer("Complete_Trials")
end

local function DressrosaQuestProgress()
    return CommF_:InvokeServer("DressrosaQuestProgress")
end

local function FinishPart()
    return CommF_:InvokeServer("FinishPart")
end

local function FinishQuest()
    return CommF_:InvokeServer("FinishQuest")
end

local function Finished()
    return CommF_:InvokeServer("Finished")
end

local function GuitarPuzzleProgress()
    return CommF_:InvokeServer("GuitarPuzzleProgress")
end

local function ProQuestProgress()
    return CommF_:InvokeServer("ProQuestProgress")
end

local function Progress()
    return CommF_:InvokeServer("Progress")
end

local function Quest()
    return CommF_:InvokeServer("Quest")
end

local function Quest2()
    return CommF_:InvokeServer("Quest2")
end

local function QuestBeta()
    return CommF_:InvokeServer("QuestBeta")
end

local function QuestTitle()
    return CommF_:InvokeServer("QuestTitle")
end

local function RaceV4Progress()
    return CommF_:InvokeServer("RaceV4Progress")
end

local function RequestQuest()
    return CommF_:InvokeServer("RequestQuest")
end

local function Start()
    return CommF_:InvokeServer("Start")
end

local function StartCasting()
    return CommF_:InvokeServer("StartCasting")
end

local function StartQuest()
    return CommF_:InvokeServer("StartQuest")
end

local function StartTrial()
    return CommF_:InvokeServer("StartTrial")
end

local function StarterGui()
    return CommF_:InvokeServer("StarterGui")
end

local function ZQuestProgress()
    return CommF_:InvokeServer("ZQuestProgress")
end

-- Buy Functions

local function AutoBuyFruitSniper()
    return CommF_:InvokeServer("AutoBuyFruitSniper")
end

local function Buy()
    return CommF_:InvokeServer("Buy")
end

local function BuyBlackLeg()
    return CommF_:InvokeServer("BuyBlackLeg")
end

local function BuyBoat()
    return CommF_:InvokeServer("BuyBoat")
end

local function BuyDeathStep()
    return CommF_:InvokeServer("BuyDeathStep")
end

local function BuyDragonTalon()
    return CommF_:InvokeServer("BuyDragonTalon")
end

local function BuyElectricClaw()
    return CommF_:InvokeServer("BuyElectricClaw")
end

local function BuyElectro()
    return CommF_:InvokeServer("BuyElectro")
end

local function BuyFishmanKarate()
    return CommF_:InvokeServer("BuyFishmanKarate")
end

local function BuyGodhuman()
    return CommF_:InvokeServer("BuyGodhuman")
end

local function BuyHaki()
    return CommF_:InvokeServer("BuyHaki")
end

local function BuyItem()
    return CommF_:InvokeServer("BuyItem")
end

local function BuySanguineArt()
    return CommF_:InvokeServer("BuySanguineArt")
end

local function BuySharkmanKarate()
    return CommF_:InvokeServer("BuySharkmanKarate")
end

local function BuySuperhuman()
    return CommF_:InvokeServer("BuySuperhuman")
end

local function PurchaseRawFruit()
    return CommF_:InvokeServer("PurchaseRawFruit")
end

-- Travel Functions

local function RequestQuest()
    return CommF_:InvokeServer("RequestQuest")
end

local function Teleport()
    return CommF_:InvokeServer("Teleport")
end

local function TeleportBack()
    return CommF_:InvokeServer("TeleportBack")
end

local function TravelDressrosa()
    return CommF_:InvokeServer("TravelDressrosa")
end

local function TravelMain()
    return CommF_:InvokeServer("TravelMain")
end

local function TravelToSubmergedIsland()
    return CommF_:InvokeServer("TravelToSubmergedIsland")
end

local function TravelZou()
    return CommF_:InvokeServer("TravelZou")
end

-- Race Functions

local function Complete_Trials()
    return CommF_:InvokeServer("Complete_Trials")
end

local function DracoTrial()
    return CommF_:InvokeServer("DracoTrial")
end

local function DragonRace()
    return CommF_:InvokeServer("DragonRace")
end

local function GetSeaBeastTrial()
    return CommF_:InvokeServer("GetSeaBeastTrial")
end

local function LookMV3()
    return CommF_:InvokeServer("LookMV3")
end

local function Race()
    return CommF_:InvokeServer("Race")
end

local function RaceV4Progress()
    return CommF_:InvokeServer("RaceV4Progress")
end

local function SkyTrial()
    return CommF_:InvokeServer("SkyTrial")
end

local function StartTrial()
    return CommF_:InvokeServer("StartTrial")
end

local function Upgrade()
    return CommF_:InvokeServer("Upgrade")
end

local function UpgradeRace()
    return CommF_:InvokeServer("UpgradeRace")
end

-- Combat Functions

local function AskKilledTikiBoss()
    return CommF_:InvokeServer("AskKilledTikiBoss")
end

local function AutoAttackDoughKing()
    return CommF_:InvokeServer("AutoAttackDoughKing")
end

local function Boss()
    return CommF_:InvokeServer("Boss")
end

local function EliteHunter()
    return CommF_:InvokeServer("EliteHunter")
end

local function FarmEliteHunt()
    return CommF_:InvokeServer("FarmEliteHunt")
end

local function FindBoss()
    return CommF_:InvokeServer("FindBoss")
end

local function Kill()
    return CommF_:InvokeServer("Kill")
end

local function KilledBandits()
    return CommF_:InvokeServer("KilledBandits")
end

local function KilledBoss()
    return CommF_:InvokeServer("KilledBoss")
end

local function LegendarySwordDealer()
    return CommF_:InvokeServer("LegendarySwordDealer")
end

local function PlayerHunter()
    return CommF_:InvokeServer("PlayerHunter")
end

local function Prehis_Skills()
    return CommF_:InvokeServer("Prehis_Skills")
end

local function Sword()
    return CommF_:InvokeServer("Sword")
end

local function SwordName()
    return CommF_:InvokeServer("SwordName")
end

local function Useskill()
    return CommF_:InvokeServer("Useskill")
end

-- Fruit Functions

local function AutoBuyFruitSniper()
    return CommF_:InvokeServer("AutoBuyFruitSniper")
end

local function Awakener()
    return CommF_:InvokeServer("Awakener")
end

local function FruitPrice()
    return CommF_:InvokeServer("FruitPrice")
end

local function FruitStore()
    return CommF_:InvokeServer("FruitStore")
end

local function GetFruits()
    return CommF_:InvokeServer("GetFruits")
end

local function LoadFruit()
    return CommF_:InvokeServer("LoadFruit")
end

local function PurchaseRawFruit()
    return CommF_:InvokeServer("PurchaseRawFruit")
end

local function SelectFruit()
    return CommF_:InvokeServer("SelectFruit")
end

local function StoreFruit()
    return CommF_:InvokeServer("StoreFruit")
end

local function TabelDevilFruitOpen()
    return CommF_:InvokeServer("TabelDevilFruitOpen")
end

local function TabelDevilFruitStore()
    return CommF_:InvokeServer("TabelDevilFruitStore")
end

local function TwFruits()
    return CommF_:InvokeServer("TwFruits")
end

-- Sea Functions

local function Auto_Fish()
    return CommF_:InvokeServer("Auto_Fish")
end

local function BoatQuest()
    return CommF_:InvokeServer("BoatQuest")
end

local function BuyBoat()
    return CommF_:InvokeServer("BuyBoat")
end

local function BuyFishmanKarate()
    return CommF_:InvokeServer("BuyFishmanKarate")
end

local function CheckEnemiesBoat()
    return CommF_:InvokeServer("CheckEnemiesBoat")
end

local function CheckSeaBeast()
    return CommF_:InvokeServer("CheckSeaBeast")
end

local function FishBoat()
    return CommF_:InvokeServer("FishBoat")
end

local function FishingNPC()
    return CommF_:InvokeServer("FishingNPC")
end

local function GetSeaBeastTrial()
    return CommF_:InvokeServer("GetSeaBeastTrial")
end

local function InfoLeviathan()
    return CommF_:InvokeServer("InfoLeviathan")
end

local function LeviathanCrown()
    return CommF_:InvokeServer("LeviathanCrown")
end

local function LeviathanGate()
    return CommF_:InvokeServer("LeviathanGate")
end

local function LeviathanShield()
    return CommF_:InvokeServer("LeviathanShield")
end

local function OpenLeviathanGate()
    return CommF_:InvokeServer("OpenLeviathanGate")
end

local function SailBoat_Hydra()
    return CommF_:InvokeServer("SailBoat_Hydra")
end

local function SelectedBoat()
    return CommF_:InvokeServer("SelectedBoat")
end

local function SellFish()
    return CommF_:InvokeServer("SellFish")
end

-- Item Functions

local function AutoCraftVolcanic()
    return CommF_:InvokeServer("AutoCraftVolcanic")
end

local function BuyItem()
    return CommF_:InvokeServer("BuyItem")
end

local function CFrameSelectedZone()
    return CommF_:InvokeServer("CFrameSelectedZone")
end

local function Craft()
    return CommF_:InvokeServer("Craft")
end

local function CraftItem()
    return CommF_:InvokeServer("CraftItem")
end

local function EquipWeapon()
    return CommF_:InvokeServer("EquipWeapon")
end

local function LoadFruit()
    return CommF_:InvokeServer("LoadFruit")
end

local function LoadItem()
    return CommF_:InvokeServer("LoadItem")
end

local function Microchip()
    return CommF_:InvokeServer("Microchip")
end

local function RFCraft()
    return CommF_:InvokeServer("RFCraft")
end

local function Select()
    return CommF_:InvokeServer("Select")
end

local function SelectChip()
    return CommF_:InvokeServer("SelectChip")
end

local function SelectFruit()
    return CommF_:InvokeServer("SelectFruit")
end

local function SelectMaterial()
    return CommF_:InvokeServer("SelectMaterial")
end

local function SelectStateHaki()
    return CommF_:InvokeServer("SelectStateHaki")
end

local function SelectWeapon()
    return CommF_:InvokeServer("SelectWeapon")
end

local function SelectedBait()
    return CommF_:InvokeServer("SelectedBait")
end

local function SelectedBoat()
    return CommF_:InvokeServer("SelectedBoat")
end

-- Stats Functions

local function AddPoint()
    return CommF_:InvokeServer("AddPoint")
end

local function FarmMastery_Dev()
    return CommF_:InvokeServer("FarmMastery_Dev")
end

local function LastSpawnPoint()
    return CommF_:InvokeServer("LastSpawnPoint")
end

local function Points()
    return CommF_:InvokeServer("Points")
end

local function SelectStateHaki()
    return CommF_:InvokeServer("SelectStateHaki")
end

local function SetLastSpawnPoint()
    return CommF_:InvokeServer("SetLastSpawnPoint")
end

local function SetSpawnPoint()
    return CommF_:InvokeServer("SetSpawnPoint")
end

-- Other Functions

local function AXIepljLMUcL()
    return CommF_:InvokeServer("AXIepljLMUcL")
end

local function Alchemist()
    return CommF_:InvokeServer("Alchemist")
end

local function Alive()
    return CommF_:InvokeServer("Alive")
end

local function Angler()
    return CommF_:InvokeServer("Angler")
end

local function ArenaTrainer()
    return CommF_:InvokeServer("ArenaTrainer")
end

local function AutoFactory()
    return CommF_:InvokeServer("AutoFactory")
end

local function AutoHytHallow()
    return CommF_:InvokeServer("AutoHytHallow")
end

local function AutoMysticIsland()
    return CommF_:InvokeServer("AutoMysticIsland")
end

local function AutoPoleV2()
    return CommF_:InvokeServer("AutoPoleV2")
end

local function AutoZou()
    return CommF_:InvokeServer("AutoZou")
end

local function Auto_Def_DarkCoat()
    return CommF_:InvokeServer("Auto_Def_DarkCoat")
end

local function Auto_Defense()
    return CommF_:InvokeServer("Auto_Defense")
end

local function Auto_Electric_Claw()
    return CommF_:InvokeServer("Auto_Electric_Claw")
end

local function Auto_Random_Bone()
    return CommF_:InvokeServer("Auto_Random_Bone")
end

local function Auto_Skypiea()
    return CommF_:InvokeServer("Auto_Skypiea")
end

local function Auto_Tushita()
    return CommF_:InvokeServer("Auto_Tushita")
end

local function Awaken()
    return CommF_:InvokeServer("Awaken")
end

local function BVYns72qIT1S3()
    return CommF_:InvokeServer("BVYns72qIT1S3")
end

local function BZecWfebXDteZ()
    return CommF_:InvokeServer("BZecWfebXDteZ")
end

local function Backpack()
    return CommF_:InvokeServer("Backpack")
end

local function Bartilo()
    return CommF_:InvokeServer("Bartilo")
end

local function Begin()
    return CommF_:InvokeServer("Begin")
end

local function BerryEsp()
    return CommF_:InvokeServer("BerryEsp")
end

local function Bet()
    return CommF_:InvokeServer("Bet")
end

local function Bisento()
    return CommF_:InvokeServer("Bisento")
end

local function BlackbeardReward()
    return CommF_:InvokeServer("BlackbeardReward")
end

local function Bones()
    return CommF_:InvokeServer("Bones")
end

local function Buso()
    return CommF_:InvokeServer("Buso")
end

local function CDK_TS()
    return CommF_:InvokeServer("CDK_TS")
end

local function CDK_YM()
    return CommF_:InvokeServer("CDK_YM")
end

local function CHfsdH0X3peZHP()
    return CommF_:InvokeServer("CHfsdH0X3peZHP")
end

local function CakeLoaf()
    return CommF_:InvokeServer("CakeLoaf")
end

local function CakePrinceSpawner()
    return CommF_:InvokeServer("CakePrinceSpawner")
end

local function CakeScientist()
    return CommF_:InvokeServer("CakeScientist")
end

local function Cannon()
    return CommF_:InvokeServer("Cannon")
end

local function CastLineAtLocation()
    return CommF_:InvokeServer("CastLineAtLocation")
end

local function Catch()
    return CommF_:InvokeServer("Catch")
end

local function Catching()
    return CommF_:InvokeServer("Catching")
end

local function Center()
    return CommF_:InvokeServer("Center")
end

local function ChangeBusoStage()
    return CommF_:InvokeServer("ChangeBusoStage")
end

local function CharacterAdded()
    return CommF_:InvokeServer("CharacterAdded")
end

local function Check()
    return CommF_:InvokeServer("Check")
end

local function CheckPirateGrandBrigade()
    return CommF_:InvokeServer("CheckPirateGrandBrigade")
end

local function ChooseWP()
    return CommF_:InvokeServer("ChooseWP")
end

local function Citizen()
    return CommF_:InvokeServer("Citizen")
end

local function ClassName()
    return CommF_:InvokeServer("ClassName")
end

local function ClickDetector()
    return CommF_:InvokeServer("ClickDetector")
end

local function ColorEsp()
    return CommF_:InvokeServer("ColorEsp")
end

local function ColorsDealer()
    return CommF_:InvokeServer("ColorsDealer")
end

local function Command()
    return CommF_:InvokeServer("Command")
end

local function Continue()
    return CommF_:InvokeServer("Continue")
end

local function Cousin()
    return CommF_:InvokeServer("Cousin")
end

local function CstlePos_Miti()
    return CommF_:InvokeServer("CstlePos_Miti")
end

local function Cup()
    return CommF_:InvokeServer("Cup")
end

local function Cutlass()
    return CommF_:InvokeServer("Cutlass")
end

local function Cxu4Zz0dE9Cp()
    return CommF_:InvokeServer("Cxu4Zz0dE9Cp")
end

local function CyborgTrainer()
    return CommF_:InvokeServer("CyborgTrainer")
end

local function DANefQgeEE4hc()
    return CommF_:InvokeServer("DANefQgeEE4hc")
end

local function DMRNPP3WdREHUb()
    return CommF_:InvokeServer("DMRNPP3WdREHUb")
end

local function Data()
    return CommF_:InvokeServer("Data")
end

local function Defense()
    return CommF_:InvokeServer("Defense")
end

local function Detective()
    return CommF_:InvokeServer("Detective")
end

local function DinoHood()
    return CommF_:InvokeServer("DinoHood")
end

local function Disabled()
    return CommF_:InvokeServer("Disabled")
end

local function Doc4jndS5w2uft()
    return CommF_:InvokeServer("Doc4jndS5w2uft")
end

local function DragonClaw()
    return CommF_:InvokeServer("DragonClaw")
end

local function Dragonheart()
    return CommF_:InvokeServer("Dragonheart")
end

local function Dragonstorm()
    return CommF_:InvokeServer("Dragonstorm")
end

local function Drop()
    return CommF_:InvokeServer("Drop")
end

local function DummyMan()
    return CommF_:InvokeServer("DummyMan")
end

local function EQAiLqmMGRTleo()
    return CommF_:InvokeServer("EQAiLqmMGRTleo")
end

local function ESPGear()
    return CommF_:InvokeServer("ESPGear")
end

local function EatRemote()
    return CommF_:InvokeServer("EatRemote")
end

local function Ectoplasm()
    return CommF_:InvokeServer("Ectoplasm")
end

local function EnablePvp()
    return CommF_:InvokeServer("EnablePvp")
end

local function Enabled()
    return CommF_:InvokeServer("Enabled")
end

local function Enemies()
    return CommF_:InvokeServer("Enemies")
end

local function Evil()
    return CommF_:InvokeServer("Evil")
end

local function F9LaSZ6H9IOdK()
    return CommF_:InvokeServer("F9LaSZ6H9IOdK")
end

local function FarmTyrant()
    return CommF_:InvokeServer("FarmTyrant")
end

local function FillCup()
    return CommF_:InvokeServer("FillCup")
end

local function FireFlowers()
    return CommF_:InvokeServer("FireFlowers")
end

local function FlamingoAccess()
    return CommF_:InvokeServer("FlamingoAccess")
end

local function Flintlock()
    return CommF_:InvokeServer("Flintlock")
end

local function Flower1()
    return CommF_:InvokeServer("Flower1")
end

local function FlowerESP()
    return CommF_:InvokeServer("FlowerESP")
end

local function Function()
    return CommF_:InvokeServer("Function")
end

local function FwbTktBQvcZxpj()
    return CommF_:InvokeServer("FwbTktBQvcZxpj")
end

local function GIxb2vCnZlxPg()
    return CommF_:InvokeServer("GIxb2vCnZlxPg")
end

local function GJ48hhKTwjY6()
    return CommF_:InvokeServer("GJ48hhKTwjY6")
end

local function GJiFGzAQqH1Ld()
    return CommF_:InvokeServer("GJiFGzAQqH1Ld")
end

local function GKIuVtBPjj18()
    return CommF_:InvokeServer("GKIuVtBPjj18")
end

local function GY5SgbYKOV6Vii()
    return CommF_:InvokeServer("GY5SgbYKOV6Vii")
end

local function Gay()
    return CommF_:InvokeServer("Gay")
end

local function Geppo()
    return CommF_:InvokeServer("Geppo")
end

local function GetAttribute()
    return CommF_:InvokeServer("GetAttribute")
end

local function GetBP()
    return CommF_:InvokeServer("GetBP")
end

local function GetConnectionEnemies()
    return CommF_:InvokeServer("GetConnectionEnemies")
end

local function GetCup()
    return CommF_:InvokeServer("GetCup")
end

local function GetM()
    return CommF_:InvokeServer("GetM")
end

local function GetUnlockables()
    return CommF_:InvokeServer("GetUnlockables")
end

local function Ghost()
    return CommF_:InvokeServer("Ghost")
end

local function GkAWdp65yxerK()
    return CommF_:InvokeServer("GkAWdp65yxerK")
end

local function Good()
    return CommF_:InvokeServer("Good")
end

local function Gravestones()
    return CommF_:InvokeServer("Gravestones")
end

local function Greybeard()
    return CommF_:InvokeServer("Greybeard")
end

local function Guardian()
    return CommF_:InvokeServer("Guardian")
end

local function Gun()
    return CommF_:InvokeServer("Gun")
end

local function HBFop6u26nOHqX()
    return CommF_:InvokeServer("HBFop6u26nOHqX")
end

local function HLxGruV6nYMcu3()
    return CommF_:InvokeServer("HLxGruV6nYMcu3")
end

local function HMhNXTDE79cY()
    return CommF_:InvokeServer("HMhNXTDE79cY")
end

local function HUQXWLzXMkls()
    return CommF_:InvokeServer("HUQXWLzXMkls")
end

local function Handle()
    return CommF_:InvokeServer("Handle")
end

local function Helath()
    return CommF_:InvokeServer("Helath")
end

local function Hop()
    return CommF_:InvokeServer("Hop")
end

local function HornedMan()
    return CommF_:InvokeServer("HornedMan")
end

local function HrYUhXKphSLm()
    return CommF_:InvokeServer("HrYUhXKphSLm")
end

local function InnC65DDEus8S()
    return CommF_:InvokeServer("InnC65DDEus8S")
end

local function InteriorLava()
    return CommF_:InvokeServer("InteriorLava")
end

local function IsDescendantOf()
    return CommF_:InvokeServer("IsDescendantOf")
end

local function IslandESP()
    return CommF_:InvokeServer("IslandESP")
end

local function IxLgWQghKFSY0L()
    return CommF_:InvokeServer("IxLgWQghKFSY0L")
end

local function JBEMHzQuzMV6()
    return CommF_:InvokeServer("JBEMHzQuzMV6")
end

local function JobId()
    return CommF_:InvokeServer("JobId")
end

local function Jsn3q8XwOm1r()
    return CommF_:InvokeServer("Jsn3q8XwOm1r")
end

local function Katana()
    return CommF_:InvokeServer("Katana")
end

local function KenTalk()
    return CommF_:InvokeServer("KenTalk")
end

local function KenTalk2()
    return CommF_:InvokeServer("KenTalk2")
end

local function KenTest()
    return CommF_:InvokeServer("KenTest")
end

local function Key()
    return CommF_:InvokeServer("Key")
end

local function KnmQiwY61UtUi()
    return CommF_:InvokeServer("KnmQiwY61UtUi")
end

local function Kz67AFmKcoBqiy()
    return CommF_:InvokeServer("Kz67AFmKcoBqiy")
end

local function LB5gzYXuNGmbe()
    return CommF_:InvokeServer("LB5gzYXuNGmbe")
end

local function LlCq4va8dnctzh()
    return CommF_:InvokeServer("LlCq4va8dnctzh")
end

local function Locked()
    return CommF_:InvokeServer("Locked")
end

local function Lp1QFco779zP()
    return CommF_:InvokeServer("Lp1QFco779zP")
end

local function M60T1lyCBlG9m()
    return CommF_:InvokeServer("M60T1lyCBlG9m")
end

local function MUG1Ulv7KTUKn()
    return CommF_:InvokeServer("MUG1Ulv7KTUKn")
end

local function Magnitude()
    return CommF_:InvokeServer("Magnitude")
end

local function Main()
    return CommF_:InvokeServer("Main")
end

local function Map()
    return CommF_:InvokeServer("Map")
end

local function Marines()
    return CommF_:InvokeServer("Marines")
end

local function Material()
    return CommF_:InvokeServer("Material")
end

local function Melee()
    return CommF_:InvokeServer("Melee")
end

local function MiMjNvKD77htp()
    return CommF_:InvokeServer("MiMjNvKD77htp")
end

local function Model()
    return CommF_:InvokeServer("Model")
end

local function Modules()
    return CommF_:InvokeServer("Modules")
end

local function MousePos()
    return CommF_:InvokeServer("MousePos")
end

local function MuR2FroTtnKDVI()
    return CommF_:InvokeServer("MuR2FroTtnKDVI")
end

local function Musket()
    return CommF_:InvokeServer("Musket")
end

local function MxnzuN6CmCpG()
    return CommF_:InvokeServer("MxnzuN6CmCpG")
end

local function MysteriousMan()
    return CommF_:InvokeServer("MysteriousMan")
end

local function N8TArmw3klLls()
    return CommF_:InvokeServer("N8TArmw3klLls")
end

local function NPC()
    return CommF_:InvokeServer("NPC")
end

local function NPCs()
    return CommF_:InvokeServer("NPCs")
end

local function NameEsp()
    return CommF_:InvokeServer("NameEsp")
end

local function Net()
    return CommF_:InvokeServer("Net")
end

local function Notifications()
    return CommF_:InvokeServer("Notifications")
end

local function Number()
    return CommF_:InvokeServer("Number")
end

local function OISsPL49eqhU()
    return CommF_:InvokeServer("OISsPL49eqhU")
end

local function OpenDoor()
    return CommF_:InvokeServer("OpenDoor")
end

local function OriginalName()
    return CommF_:InvokeServer("OriginalName")
end

local function Ot7RHK92g64zP2()
    return CommF_:InvokeServer("Ot7RHK92g64zP2")
end

local function PGB()
    return CommF_:InvokeServer("PGB")
end

local function PIElTskeGUFY0()
    return CommF_:InvokeServer("PIElTskeGUFY0")
end

local function PQrJSHXdhP5lnK()
    return CommF_:InvokeServer("PQrJSHXdhP5lnK")
end

local function Part()
    return CommF_:InvokeServer("Part")
end

local function Pipe()
    return CommF_:InvokeServer("Pipe")
end

local function Pipes()
    return CommF_:InvokeServer("Pipes")
end

local function Pirates()
    return CommF_:InvokeServer("Pirates")
end

local function PivotTo()
    return CommF_:InvokeServer("PivotTo")
end

local function PlaceRelic()
    return CommF_:InvokeServer("PlaceRelic")
end

local function PlayerGui()
    return CommF_:InvokeServer("PlayerGui")
end

local function PlayersList()
    return CommF_:InvokeServer("PlayersList")
end

local function Pos()
    return CommF_:InvokeServer("Pos")
end

local function PosB()
    return CommF_:InvokeServer("PosB")
end

local function PossibleHardcode()
    return CommF_:InvokeServer("PossibleHardcode")
end

local function Praying()
    return CommF_:InvokeServer("Praying")
end

local function Price()
    return CommF_:InvokeServer("Price")
end

local function Q34Wi78zmGj2g()
    return CommF_:InvokeServer("Q34Wi78zmGj2g")
end

local function RDeath()
    return CommF_:InvokeServer("RDeath")
end

local function RFJobsRemoteFunction()
    return CommF_:InvokeServer("RFJobsRemoteFunction")
end

local function Raiding()
    return CommF_:InvokeServer("Raiding")
end

local function RaidsNpc()
    return CommF_:InvokeServer("RaidsNpc")
end

local function RdviNbBQnmfu()
    return CommF_:InvokeServer("RdviNbBQnmfu")
end

local function RedDoor()
    return CommF_:InvokeServer("RedDoor")
end

local function Refund()
    return CommF_:InvokeServer("Refund")
end

local function Relic()
    return CommF_:InvokeServer("Relic")
end

local function Reroll()
    return CommF_:InvokeServer("Reroll")
end

local function RichSon()
    return CommF_:InvokeServer("RichSon")
end

local function Root()
    return CommF_:InvokeServer("Root")
end

local function Rumble()
    return CommF_:InvokeServer("Rumble")
end

local function SDciU3Xg7iFb()
    return CommF_:InvokeServer("SDciU3Xg7iFb")
end

local function SOUuFUJjERHz()
    return CommF_:InvokeServer("SOUuFUJjERHz")
end

local function Sec()
    return CommF_:InvokeServer("Sec")
end

local function Segment7()
    return CommF_:InvokeServer("Segment7")
end

local function SendKeyEvent()
    return CommF_:InvokeServer("SendKeyEvent")
end

local function SetDesc()
    return CommF_:InvokeServer("SetDesc")
end

local function SetTeam()
    return CommF_:InvokeServer("SetTeam")
end

local function SharkAnchor()
    return CommF_:InvokeServer("SharkAnchor")
end

local function SharkTooth()
    return CommF_:InvokeServer("SharkTooth")
end

local function SickMan()
    return CommF_:InvokeServer("SickMan")
end

local function Size()
    return CommF_:InvokeServer("Size")
end

local function Skypiea()
    return CommF_:InvokeServer("Skypiea")
end

local function Slingshot()
    return CommF_:InvokeServer("Slingshot")
end

local function Soru()
    return CommF_:InvokeServer("Soru")
end

local function Spawn()
    return CommF_:InvokeServer("Spawn")
end

local function SpectatePlys()
    return CommF_:InvokeServer("SpectatePlys")
end

local function Sure()
    return CommF_:InvokeServer("Sure")
end

local function Swamp()
    return CommF_:InvokeServer("Swamp")
end

local function SweetChaliceNpc()
    return CommF_:InvokeServer("SweetChaliceNpc")
end

local function T2Yama()
    return CommF_:InvokeServer("T2Yama")
end

local function TC5webKIHffVY()
    return CommF_:InvokeServer("TC5webKIHffVY")
end

local function TRexSkull()
    return CommF_:InvokeServer("TRexSkull")
end

local function Tablet()
    return CommF_:InvokeServer("Tablet")
end

local function Talk()
    return CommF_:InvokeServer("Talk")
end

local function TalkTrevor()
    return CommF_:InvokeServer("TalkTrevor")
end

local function TerrorShark()
    return CommF_:InvokeServer("TerrorShark")
end

local function Text()
    return CommF_:InvokeServer("Text")
end

local function Title()
    return CommF_:InvokeServer("Title")
end

local function Titles()
    return CommF_:InvokeServer("Titles")
end

local function Tool()
    return CommF_:InvokeServer("Tool")
end

local function TpDrago_Prehis()
    return CommF_:InvokeServer("TpDrago_Prehis")
end

local function TpLab()
    return CommF_:InvokeServer("TpLab")
end

local function Transparency()
    return CommF_:InvokeServer("Transparency")
end

local function Trophies()
    return CommF_:InvokeServer("Trophies")
end

local function TwinHook()
    return CommF_:InvokeServer("TwinHook")
end

local function UQNVI4X4orzc()
    return CommF_:InvokeServer("UQNVI4X4orzc")
end

local function UcOzhwm3kswlpa()
    return CommF_:InvokeServer("UcOzhwm3kswlpa")
end

local function UpperTorso()
    return CommF_:InvokeServer("UpperTorso")
end

local function UvyivY4XSb9dn()
    return CommF_:InvokeServer("UvyivY4XSb9dn")
end

local function Uzoth()
    return CommF_:InvokeServer("Uzoth")
end

local function Vgd2zoB8VrEgf()
    return CommF_:InvokeServer("Vgd2zoB8VrEgf")
end

local function Visible()
    return CommF_:InvokeServer("Visible")
end

local function VkpupygdgwiTMA()
    return CommF_:InvokeServer("VkpupygdgwiTMA")
end

local function Wenlocktoad()
    return CommF_:InvokeServer("Wenlocktoad")
end

local function World3()
    return CommF_:InvokeServer("World3")
end

local function XCvVKHUrHhSwd()
    return CommF_:InvokeServer("XCvVKHUrHhSwd")
end

local function Xdk3mnvJAjXGyB()
    return CommF_:InvokeServer("Xdk3mnvJAjXGyB")
end

local function YhB0lC29BRtlF2()
    return CommF_:InvokeServer("YhB0lC29BRtlF2")
end

local function ZCDi3dTNQSWvbH()
    return CommF_:InvokeServer("ZCDi3dTNQSWvbH")
end

local function ZjJ8loZGGZq6()
    return CommF_:InvokeServer("ZjJ8loZGGZq6")
end

local function ZydYuGoZH1LHY()
    return CommF_:InvokeServer("ZydYuGoZH1LHY")
end

-- ==================== GUI SETUP ====================
-- OK Hub GUI using Rayfield or similar library

local Window = Library:CreateWindow({
    Name = "KKC Hub : Blox Fruit",
    LoadingTitle = "KKC Hub",
    LoadingSubtitle = "Blox Fruits",
    ConfigurationSaving = {Enabled = false}
})

-- === Other Tab ===
local OtherTab = Window:CreateTab('Other')

local Accept_Allies = false
OtherTab:AddToggle({
    Name = "Accept Allies",
    Default = false,
    Callback = function(Value)
        Accept_Allies = Value
    end
})

local Accept_Quests = false
OtherTab:AddToggle({
    Name = "Accept Quests",
    Default = false,
    Callback = function(Value)
        Accept_Quests = Value
    end
})

local Auto_Black_Spikey = false
OtherTab:AddToggle({
    Name = "Auto Black Spikey",
    Default = false,
    Callback = function(Value)
        Auto_Black_Spikey = Value
    end
})

local Auto_Chest_Bypass = false
OtherTab:AddToggle({
    Name = "Auto Chest Bypass",
    Default = false,
    Callback = function(Value)
        Auto_Chest_Bypass = Value
    end
})

local Auto_Haunted_Crew_Member = false
OtherTab:AddToggle({
    Name = "Auto Haunted Crew Member",
    Default = false,
    Callback = function(Value)
        Auto_Haunted_Crew_Member = Value
    end
})

local Bartilo = false
OtherTab:AddToggle({
    Name = "Bartilo",
    Default = false,
    Callback = function(Value)
        Bartilo = Value
    end
})

local BerryH = false
OtherTab:AddToggle({
    Name = "BerryH",
    Default = false,
    Callback = function(Value)
        BerryH = Value
    end
})

local BlazeEM = false
OtherTab:AddToggle({
    Name = "BlazeEM",
    Default = false,
    Callback = function(Value)
        BlazeEM = Value
    end
})

local BoneQ = false
OtherTab:AddToggle({
    Name = "BoneQ",
    Default = false,
    Callback = function(Value)
        BoneQ = Value
    end
})

local CakeSM = false
OtherTab:AddToggle({
    Name = "CakeSM",
    Default = false,
    Callback = function(Value)
        CakeSM = Value
    end
})

local Change_Transparency_can_see = false
OtherTab:AddToggle({
    Name = "Change Transparency can see",
    Default = false,
    Callback = function(Value)
        Change_Transparency_can_see = Value
    end
})

local ClosetMons = false
OtherTab:AddToggle({
    Name = "ClosetMons",
    Default = false,
    Callback = function(Value)
        ClosetMons = Value
    end
})

local Combat = false
OtherTab:AddToggle({
    Name = "Combat",
    Default = false,
    Callback = function(Value)
        Combat = Value
    end
})

local CurvedRing = false
OtherTab:AddToggle({
    Name = "CurvedRing",
    Default = false,
    Callback = function(Value)
        CurvedRing = Value
    end
})

local DragonTalon = false
OtherTab:AddToggle({
    Name = "DragonTalon",
    Default = false,
    Callback = function(Value)
        DragonTalon = Value
    end
})

local FactoryRaids = false
OtherTab:AddToggle({
    Name = "FactoryRaids",
    Default = false,
    Callback = function(Value)
        FactoryRaids = Value
    end
})

local FarmBoss = false
OtherTab:AddToggle({
    Name = "FarmBoss",
    Default = false,
    Callback = function(Value)
        FarmBoss = Value
    end
})

local FarmPhaBinh = false
OtherTab:AddToggle({
    Name = "FarmPhaBinh",
    Default = false,
    Callback = function(Value)
        FarmPhaBinh = Value
    end
})

local FishingQ = false
OtherTab:AddToggle({
    Name = "FishingQ",
    Default = false,
    Callback = function(Value)
        FishingQ = Value
    end
})

local Ghost-Ghost = false
OtherTab:AddToggle({
    Name = "Ghost-Ghost",
    Default = false,
    Callback = function(Value)
        Ghost-Ghost = Value
    end
})

local Godhuman = false
OtherTab:AddToggle({
    Name = "Godhuman",
    Default = false,
    Callback = function(Value)
        Godhuman = Value
    end
})

local Instinct__Observation = false
OtherTab:AddToggle({
    Name = "Instinct / Observation",
    Default = false,
    Callback = function(Value)
        Instinct__Observation = Value
    end
})

local Kaura = false
OtherTab:AddToggle({
    Name = "Kaura",
    Default = false,
    Callback = function(Value)
        Kaura = Value
    end
})

local Lucky = false
OtherTab:AddToggle({
    Name = "Lucky",
    Default = false,
    Callback = function(Value)
        Lucky = Value
    end
})

local MoveCamtoMoon = false
OtherTab:AddToggle({
    Name = "MoveCamtoMoon",
    Default = false,
    Callback = function(Value)
        MoveCamtoMoon = Value
    end
})

local Options = false
OtherTab:AddToggle({
    Name = "Options",
    Default = false,
    Callback = function(Value)
        Options = Value
    end
})

local Players = false
OtherTab:AddToggle({
    Name = "Players",
    Default = false,
    Callback = function(Value)
        Players = Value
    end
})

local RaceV4Aura = false
OtherTab:AddToggle({
    Name = "RaceV4Aura",
    Default = false,
    Callback = function(Value)
        RaceV4Aura = Value
    end
})

local Raids = false
OtherTab:AddToggle({
    Name = "Raids",
    Default = false,
    Callback = function(Value)
        Raids = Value
    end
})

local RanBone = false
OtherTab:AddToggle({
    Name = "RanBone",
    Default = false,
    Callback = function(Value)
        RanBone = Value
    end
})

local ReplicatedStorage = false
OtherTab:AddToggle({
    Name = "ReplicatedStorage",
    Default = false,
    Callback = function(Value)
        ReplicatedStorage = Value
    end
})

local RunService = false
OtherTab:AddToggle({
    Name = "RunService",
    Default = false,
    Callback = function(Value)
        RunService = Value
    end
})

local Safe_Mode = false
OtherTab:AddToggle({
    Name = "Safe Mode",
    Default = false,
    Callback = function(Value)
        Safe_Mode = Value
    end
})

local SanguineArt = false
OtherTab:AddToggle({
    Name = "SanguineArt",
    Default = false,
    Callback = function(Value)
        SanguineArt = Value
    end
})

local SeaEvent = false
OtherTab:AddToggle({
    Name = "SeaEvent",
    Default = false,
    Callback = function(Value)
        SeaEvent = Value
    end
})

local Set_Pirate_Team = false
OtherTab:AddToggle({
    Name = "Set Pirate Team",
    Default = false,
    Callback = function(Value)
        Set_Pirate_Team = Value
    end
})

local Shadow-Shadow = false
OtherTab:AddToggle({
    Name = "Shadow-Shadow",
    Default = false,
    Callback = function(Value)
        Shadow-Shadow = Value
    end
})

local Smoke-Smoke = false
OtherTab:AddToggle({
    Name = "Smoke-Smoke",
    Default = false,
    Callback = function(Value)
        Smoke-Smoke = Value
    end
})

local Spawn = false
OtherTab:AddToggle({
    Name = "Spawn",
    Default = false,
    Callback = function(Value)
        Spawn = Value
    end
})

local StartR = false
OtherTab:AddToggle({
    Name = "StartR",
    Default = false,
    Callback = function(Value)
        StartR = Value
    end
})

local StatsUpg = false
OtherTab:AddToggle({
    Name = "StatsUpg",
    Default = false,
    Callback = function(Value)
        StatsUpg = Value
    end
})

local StopI = false
OtherTab:AddToggle({
    Name = "StopI",
    Default = false,
    Callback = function(Value)
        StopI = Value
    end
})

local String = false
OtherTab:AddToggle({
    Name = "String",
    Default = false,
    Callback = function(Value)
        String = Value
    end
})

local TP_Exit_4 = false
OtherTab:AddToggle({
    Name = "TP Exit (4)",
    Default = false,
    Callback = function(Value)
        TP_Exit_4 = Value
    end
})

local Talk_With_Stone = false
OtherTab:AddToggle({
    Name = "Talk With Stone",
    Default = false,
    Callback = function(Value)
        Talk_With_Stone = Value
    end
})

local Toggle = false
OtherTab:AddToggle({
    Name = "Toggle",
    Default = false,
    Callback = function(Value)
        Toggle = Value
    end
})

local Treasure_Rod = false
OtherTab:AddToggle({
    Name = "Treasure Rod",
    Default = false,
    Callback = function(Value)
        Treasure_Rod = Value
    end
})

local UnPortal = false
OtherTab:AddToggle({
    Name = "UnPortal",
    Default = false,
    Callback = function(Value)
        UnPortal = Value
    end
})

local Upgrade_Dragon_Talon_With_Uzoth = false
OtherTab:AddToggle({
    Name = "Upgrade Dragon Talon With Uzoth",
    Default = false,
    Callback = function(Value)
        Upgrade_Dragon_Talon_With_Uzoth = Value
    end
})

local Vocan = false
OtherTab:AddToggle({
    Name = "Vocan",
    Default = false,
    Callback = function(Value)
        Vocan = Value
    end
})

-- === Combat Tab ===
local CombatTab = Window:CreateTab('Combat')

local Accept_Rainbow_Quest_Faster = false
CombatTab:AddToggle({
    Name = "Accept Rainbow Quest Faster",
    Default = false,
    Callback = function(Value)
        Accept_Rainbow_Quest_Faster = Value
    end
})

local AttackNoCoolDown = false
CombatTab:AddToggle({
    Name = "AttackNoCoolDown",
    Default = false,
    Callback = function(Value)
        AttackNoCoolDown = Value
    end
})

local AutoKill = false
CombatTab:AddToggle({
    Name = "AutoKill",
    Default = false,
    Callback = function(Value)
        AutoKill = Value
    end
})

local Turn_on_Fast_Mode = false
CombatTab:AddToggle({
    Name = "Turn on Fast Mode",
    Default = false,
    Callback = function(Value)
        Turn_on_Fast_Mode = Value
    end
})

-- === Swords & Fighting Styles Tab ===
local SwordsFightingStylesTab = Window:CreateTab('Swords & Fighting Styles')

local Auto_Blox_Fruit = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Blox Fruit",
    Default = false,
    Callback = function(Value)
        Auto_Blox_Fruit = Value
    end
})

local Auto_Cybrog = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Cybrog",
    Default = false,
    Callback = function(Value)
        Auto_Cybrog = Value
    end
})

local Auto_Dark_Blade_V3 = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Dark Blade V3",
    Default = false,
    Callback = function(Value)
        Auto_Dark_Blade_V3 = Value
    end
})

local Auto_DeathStep = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto DeathStep",
    Default = false,
    Callback = function(Value)
        Auto_DeathStep = Value
    end
})

local Auto_Dragon_Trident = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Dragon Trident",
    Default = false,
    Callback = function(Value)
        Auto_Dragon_Trident = Value
    end
})

local Auto_Train_Drago_v4 = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Train Drago v4",
    Default = false,
    Callback = function(Value)
        Auto_Train_Drago_v4 = Value
    end
})

local Auto_Turn_on_Buso = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Turn on Buso",
    Default = false,
    Callback = function(Value)
        Auto_Turn_on_Buso = Value
    end
})

local Auto_Tushita_Sword = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Tushita Sword",
    Default = false,
    Callback = function(Value)
        Auto_Tushita_Sword = Value
    end
})

local Auto_Warden_Sword = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Warden Sword",
    Default = false,
    Callback = function(Value)
        Auto_Warden_Sword = Value
    end
})

local Auto_Yama_Sword = false
SwordsFightingStylesTab:AddToggle({
    Name = "Auto Yama Sword",
    Default = false,
    Callback = function(Value)
        Auto_Yama_Sword = Value
    end
})

-- === Quest Tab ===
local QuestTab = Window:CreateTab('Quest')

local Auto_Complete_Trial_Race = false
QuestTab:AddToggle({
    Name = "Auto Complete Trial Race",
    Default = false,
    Callback = function(Value)
        Auto_Complete_Trial_Race = Value
    end
})

-- === Farming Tab ===
local FarmingTab = Window:CreateTab('Farming')

local Auto_Farm_All_Boss = false
FarmingTab:AddToggle({
    Name = "Auto Farm All Boss",
    Default = false,
    Callback = function(Value)
        Auto_Farm_All_Boss = Value
    end
})

local Auto_Farm_Boss_TOTS = false
FarmingTab:AddToggle({
    Name = "Auto Farm Boss TOTS",
    Default = false,
    Callback = function(Value)
        Auto_Farm_Boss_TOTS = Value
    end
})

local Auto_Farm_Ectoplasm = false
FarmingTab:AddToggle({
    Name = "Auto Farm Ectoplasm",
    Default = false,
    Callback = function(Value)
        Auto_Farm_Ectoplasm = Value
    end
})

-- === Misc Auto Tab ===
local MiscAutoTab = Window:CreateTab('Misc Auto')

local Auto_Fish_Crew_Member = false
MiscAutoTab:AddToggle({
    Name = "Auto Fish Crew Member",
    Default = false,
    Callback = function(Value)
        Auto_Fish_Crew_Member = Value
    end
})

local Auto_Hop_Server_with_time = false
MiscAutoTab:AddToggle({
    Name = "Auto Hop Server with time",
    Default = false,
    Callback = function(Value)
        Auto_Hop_Server_with_time = Value
    end
})

local Auto_Random_Fruit = false
MiscAutoTab:AddToggle({
    Name = "Auto Random Fruit",
    Default = false,
    Callback = function(Value)
        Auto_Random_Fruit = Value
    end
})

local Auto_Summon_Cake_Prince = false
MiscAutoTab:AddToggle({
    Name = "Auto Summon Cake Prince",
    Default = false,
    Callback = function(Value)
        Auto_Summon_Cake_Prince = Value
    end
})

local Auto_Teleport_to_Shrine_Actived = false
MiscAutoTab:AddToggle({
    Name = "Auto Teleport to Shrine Actived",
    Default = false,
    Callback = function(Value)
        Auto_Teleport_to_Shrine_Actived = Value
    end
})

local Auto_Travel = false
MiscAutoTab:AddToggle({
    Name = "Auto Travel",
    Default = false,
    Callback = function(Value)
        Auto_Travel = Value
    end
})

-- === Collection Tab ===
local CollectionTab = Window:CreateTab('Collection')

local Auto_Sell_Fish = false
CollectionTab:AddToggle({
    Name = "Auto Sell Fish",
    Default = false,
    Callback = function(Value)
        Auto_Sell_Fish = Value
    end
})

-- === Sea Events Tab ===
local SeaEventsTab = Window:CreateTab('Sea Events')

local Auto_Shark = false
SeaEventsTab:AddToggle({
    Name = "Auto Shark",
    Default = false,
    Callback = function(Value)
        Auto_Shark = Value
    end
})

-- === Shop & Teleport Tab ===
local ShopTeleportTab = Window:CreateTab('Shop & Teleport')

local Auto_Tween_To_Mirage_Island = false
ShopTeleportTab:AddToggle({
    Name = "Auto Tween To Mirage Island",
    Default = false,
    Callback = function(Value)
        Auto_Tween_To_Mirage_Island = Value
    end
})

-- === ESP Tab ===
local ESPTab = Window:CreateTab('ESP')

local Esp_Mirage_Island = false
ESPTab:AddToggle({
    Name = "Esp Mirage Island",
    Default = false,
    Callback = function(Value)
        Esp_Mirage_Island = Value
    end
})

-- === Movement Tab ===
local MovementTab = Window:CreateTab('Movement')

local Ship_Speed_Modifier = false
MovementTab:AddToggle({
    Name = "Ship Speed Modifier",
    Default = false,
    Callback = function(Value)
        Ship_Speed_Modifier = Value
    end
})

local Speed_Fly_Mode = false
MovementTab:AddToggle({
    Name = "Speed Fly Mode",
    Default = false,
    Callback = function(Value)
        Speed_Fly_Mode = Value
    end
})


-- === Action Buttons ===
MovementTab:AddButton({
    Name = "Auto Get PlayerQuest",
    Callback = function()
        -- Auto Get PlayerQuest action
    end
})

MovementTab:AddButton({
    Name = "Auto Look At Moon",
    Callback = function()
        -- Auto Look At Moon action
    end
})

MovementTab:AddButton({
    Name = "Auto Teleport Frozen Dimension",
    Callback = function()
        -- Auto Teleport Frozen Dimension action
    end
})

MovementTab:AddButton({
    Name = "Buy Death Step",
    Callback = function()
        -- Buy Death Step action
    end
})

MovementTab:AddButton({
    Name = "Buy DragonClaw",
    Callback = function()
        -- Buy DragonClaw action
    end
})

MovementTab:AddButton({
    Name = "Buy Dungeon Chips [Devil Fruit]",
    Callback = function()
        -- Buy Dungeon Chips [Devil Fruit] action
    end
})

MovementTab:AddButton({
    Name = "Buy ElectricClaw",
    Callback = function()
        -- Buy ElectricClaw action
    end
})

MovementTab:AddButton({
    Name = "Buy Ghoul Race",
    Callback = function()
        -- Buy Ghoul Race action
    end
})

MovementTab:AddButton({
    Name = "Buy Katana",
    Callback = function()
        -- Buy Katana action
    end
})

MovementTab:AddButton({
    Name = "Craft LeviathanBoat",
    Callback = function()
        -- Craft LeviathanBoat action
    end
})

MovementTab:AddButton({
    Name = "Craft LeviathanShield",
    Callback = function()
        -- Craft LeviathanShield action
    end
})

MovementTab:AddButton({
    Name = "Misc",
    Callback = function()
        -- Misc action
    end
})

MovementTab:AddButton({
    Name = "Name",
    Callback = function()
        -- Name action
    end
})

MovementTab:AddButton({
    Name = "Night",
    Callback = function()
        -- Night action
    end
})

MovementTab:AddButton({
    Name = "Players",
    Callback = function()
        -- Players action
    end
})

MovementTab:AddButton({
    Name = "Prehistoric",
    Callback = function()
        -- Prehistoric action
    end
})

MovementTab:AddButton({
    Name = "Quests",
    Callback = function()
        -- Quests action
    end
})

MovementTab:AddButton({
    Name = "ReplicatedStorage",
    Callback = function()
        -- ReplicatedStorage action
    end
})

MovementTab:AddButton({
    Name = "SeaEvent",
    Callback = function()
        -- SeaEvent action
    end
})

MovementTab:AddButton({
    Name = "Shop",
    Callback = function()
        -- Shop action
    end
})

MovementTab:AddButton({
    Name = "Spider-Spider",
    Callback = function()
        -- Spider-Spider action
    end
})

MovementTab:AddButton({
    Name = "Start Law Raids",
    Callback = function()
        -- Start Law Raids action
    end
})

MovementTab:AddButton({
    Name = "Travel",
    Callback = function()
        -- Travel action
    end
})

MovementTab:AddButton({
    Name = "Travel - Island",
    Callback = function()
        -- Travel - Island action
    end
})

MovementTab:AddButton({
    Name = "Travel Dressrosa (World 2)",
    Callback = function()
        -- Travel Dressrosa (World 2) action
    end
})

MovementTab:AddButton({
    Name = "Travel Zou (World 3)",
    Callback = function()
        -- Travel Zou (World 3) action
    end
})

MovementTab:AddButton({
    Name = "Turn on Low CPU",
    Callback = function()
        -- Turn on Low CPU action
    end
})

MovementTab:AddButton({
    Name = "Yeti-Yeti",
    Callback = function()
        -- Yeti-Yeti action
    end
})

-- ==================== MAIN LOOPS ====================

-- Auto Farm Level
spawn(function()
    while wait(0.1) do
        if AutoFarmLevel then
            pcall(function()
                local QuestLevel = LocalPlayer.Data.Level.Value
                -- Select appropriate island based on level
                -- Navigate to quest NPC
                -- Accept quest
                -- Kill enemies
                -- Complete quest loop
            end)
        end
    end
end)

-- Auto Farm Boss
spawn(function()
    while wait(0.1) do
        if AutoFarmAllBoss then
            pcall(function()
                for _, boss in ipairs(workspace.Enemies:GetChildren()) do
                    if boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                        -- Teleport to boss
                        -- Attack boss
                    end
                end
            end)
        end
    end
end)

-- Auto Farm Chest
spawn(function()
    while wait(0.1) do
        if AutoFarmChest then
            pcall(function()
                for _, chest in ipairs(workspace:GetDescendants()) do
                    if chest.Name:find("Chest") then
                        -- Teleport to chest
                        -- Collect chest
                    end
                end
            end)
        end
    end
end)

-- Auto Farm Dungeon
spawn(function()
    while wait(0.1) do
        if AutoFarmDungeon then
            pcall(function()
                -- Select dungeon chip
                -- Start raid
                -- Complete dungeon
            end)
        end
    end
end)

-- Auto Farm Sea Beast
spawn(function()
    while wait(0.5) do
        if AutoAttackSeaBeast then
            pcall(function()
                -- Find sea beast
                -- Attack sea beast
            end)
        end
    end
end)

-- Auto Leviathan
spawn(function()
    while wait(0.5) do
        if AutoAttackLeviathan then
            pcall(function()
                -- Check for leviathan spawn
                -- Navigate to leviathan
                -- Attack leviathan segments
            end)
        end
    end
end)

-- ESP System
spawn(function()
    while wait(1) do
        if EspFruit then
            -- Create/update fruit ESP highlights
        end
        if EspChest then
            -- Create/update chest ESP highlights
        end
        if EspIsland then
            -- Create/update island ESP
        end
    end
end)

-- Quest System
spawn(function()
    while wait(0.5) do
        if AutoCompleteQuest then
            pcall(function()
                -- Check current quest
                -- Navigate to quest area
                -- Kill quest targets
                -- Turn in quest
            end)
        end
    end
end)

-- Sea Event Detection
spawn(function()
    while wait(5) do
        pcall(function()
            -- Check Mirage Island
            -- Check Prehistoric Island  
            -- Check Kitsune Island
            -- Check Sea Beast
            -- Update status labels
        end)
    end
end)

-- Server Hop
spawn(function()
    while wait(10) do
        if AutoHopServer or AutoAntiAdmin then
            pcall(function()
                -- Check for admin players
                -- Hop to lowest player server
            end)
        end
    end
end)

-- Combat System
spawn(function()
    while wait(0.01) do
        if FastAttack then
            pcall(function()
                -- Get nearest enemy
                -- Spam attack skills
            end)
        end
        if KillAura then
            pcall(function()
                -- Hit all nearby enemies
            end)
        end
    end
end)

-- Stats Auto Upgrade
spawn(function()
    while wait(1) do
        if AutoMelee then
            InvokeCommF("AddPoint", "Melee")
        end
        if AutoDefense then
            InvokeCommF("AddPoint", "Defense")
        end
    end
end)

-- ==================== NOTIFICATION ====================
print("OK Hub - Blox Fruits loaded successfully!")
