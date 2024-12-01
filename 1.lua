function Tween(P1)
  local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
  if Distance >= 1 then
  Speed = 300
  end
  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
    CFrame = P1
  }):Play()
  if _G.CancelTween2 then
  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
    CFrame = P1
  }):Cancel()
  end
  _G.Clip2 = true
  wait(Distance/Speed)
  _G.Clip2 = false
end
function StopTween()
    pcall(function()
        Tween2(game.Players.LocalPlayer.Character.Head.CFrame)
    end)
end
function Function3()
    repeat
        wait()
    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        AllNPCS = getnilinstances()
        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for r, v in pairs(AllNPCS) do
            if v.Name == "Advanced Fruit Dealer" then
                Tween2(v.HumanoidRootPart.CFrame)
            end
        end
    end
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Blox Fruits Script",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl
})
local Tabs = {
    Main = Window:AddTab({ Title = "Mystic Islands", Icon = "" }),
}

spawn(function()
    while task.wait() do
        pcall(function()
            if TweenMystic or TweenGear or TweenMystic1 or AutoGatCan or LevelFarm or Farm then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if TweenMystic or TweenGear or TweenMystic1 or AutoGatCan or LevelFarm or Farm then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
Tabs.Main:AddButton({
    Title = "First Sea 1",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})



Tabs.Main:AddButton({
    Title = "Second Sea 2",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})



Tabs.Main:AddButton({
    Title = "Third Sea 3",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
Tabs.Main:AddButton({
    Title = "TP Mirage",
    Description = "",
    Callback = function()
        Tween2(workspace._WorldOrigin.Locations["Mirage Island"].CFrame * CFrame.new(0,500,0))
    end
})

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Tween Mystic", Default = false })

Toggle:OnChanged(function(Value)
    TweenMystic = Value
end)
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Tween Mystic", Default = false })

Toggle:OnChanged(function(Value)
    TweenMystic1 = Value
end)
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Tween Gear", Default = false })

Toggle:OnChanged(function(Value)
    TweenGear = Value
end)
spawn(function()
    while wait() do
        if TweenGear then
            local MysticIsland = game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
            if MysticIsland then
                for _, part in pairs(MysticIsland:GetChildren()) do 
                    if part:IsA("MeshPart") and part.Material == Enum.Material.Neon then  
                        Tween2(part.CFrame)
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if TweenMystic then
            Function3()
        end
    end
end)
function Function2()
    local MysticIsland = game.workspace.Map:FindFirstChild("MysticIsland")
    if not MysticIsland then return nil end

    for _, part in pairs(MysticIsland:GetDescendants()) do
        if part:IsA("MeshPart") and part.MeshId == "rbxassetid://6745037796" then
            return part
        end
    end
end

function Function1()
    local HighestPoint = Function2()
    if HighestPoint then
        Tween2(HighestPoint.CFrame * CFrame.new(0, 211.88, 0))
    end
end

spawn(function()
    while wait() do
        if TweenMystic1 then
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                local HighestPointRealCFrame = Function2().CFrame
                if HighestPointRealCFrame and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude > 10 then
                    Tween2(HighestPointRealCFrame * CFrame.new(0, 211.88, 0))
                end
            else

            end
        end
    end
end)
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto Gat Can [Beta]", Default = false })

Toggle:OnChanged(function(Value)
    AutoGatCan = Value
    LockFullMoon = false
end)
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Lock Moon", Default = false })

Toggle:OnChanged(function(Value)
    LockFullMoon1 = Value
end)
spawn(function()
    while wait() do
      if LockFullMoon1 then
       workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
      end
    end
   end)

function Noti(a,b,c)
    Fluent:Notify({
        Title = a,
        Content = b,
        SubContent = "Mystic Island Notication",
        Duration = c
    })
end
function GetItem(title)
    for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == title then
            return v
        end
    end
end
function TweenTempleLegit()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586))
    if getnilinstances then
    AllNPCS = getnilinstances()
    for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        table.insert(AllNPCS, v)
    end
    for r, v in pairs(AllNPCS) do
        if v.Name == "Mysterious Force" then
            TempleMysteriousNPC1 = v
        end
        if v.Name == "Mysterious Force3" then
            TempleMysteriousNPC2 = v
        end
    end
    else
        AllNPCS = {}
        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for r, v in pairs(AllNPCS) do
            if v.Name == "Mysterious Force" then
                TempleMysteriousNPC1 = v
            end
            if v.Name == "Mysterious Force3" then
                TempleMysteriousNPC2 = v
            end
        end
    end
    if not TempleMysteriousNPC2:FindFirstChild('HumanoidRootPart') then
    Tween2(CFrame.new(28558, 14897, 88))
    end
    Tween2(TempleMysteriousNPC2.HumanoidRootPart.CFrame)
    wait(0.5)
    if
        (TempleMysteriousNPC2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
            15
     then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
    end
    if TempleMysteriousNPC1:FindFirstChild('HumanoidRootPart') and (TempleMysteriousNPC1.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
            15
     then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
    end
end 
spawn(function()
 while wait() do
   if LockFullMoon then
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
   end
 end
end)
function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for r, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then
                return v
            end
        end
    end
end
spawn(function()
    while wait() do
       if AutoGatCan then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                Noti('Notication',"Đã Gạt Cần Hoặc Đã Gạt Cần Thành Công",3)
                wait(3)
            elseif not GetItem("Mirror Fractal") then
                Noti('Notication',"Không Tìm Thấy Mảnh Gương",3)
                wait(3)
            elseif not GetItem("Valkyrie Helm") then
                Noti('Notication',"Không Tìm Thấy Mũ",3)
                wait(3)
            else
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 1 then
                    Noti("Script Status", "Begin", 10)
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 2 then
                    Noti("Script Status", "Conitnue Time 1", 10)
                    TweenTempleLegit()
                elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") == 3 then
                    Noti("Script Status", "Continue Time 2", 10)
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
                elseif game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    local HighestPointRealCFrame = Function2().CFrame
                    if HighestPointRealCFrame and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude > 10 then
                        Tween2(HighestPointRealCFrame * CFrame.new(0, 211.88, 0))
                    else
                        BlueGear = getBlueGear()
                        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckTempleDoor") then
                        LockFullMoon = false
                        elseif BlueGear and not BlueGear.CanCollide and BlueGear.Transparency ~= 1 then
                            repeat
                                wait()
                                TweentoBlueGear()
                            until not getBlueGear() or getBlueGear().Transparency == 1
                            LockFullMoon = false
                            Noti('Notication',"Đã Gạt Cần",3)
                        else
                            LockFullMoon = true
                            game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                            task.wait()
                            game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                            task.wait(1.5)
                        end
                    end
                else
                    Noti('Notication',"Không Thể Tìm Thấy Đảo Bí Ẩn",3)
                    wait(3)
                end
            end
       end
    end
end)

local Tabs = {
    Main = Window:AddTab({ Title = "Farm", Icon = "" }),
}
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Select Weapon",
    Values = {"Melee", "Sword"},
    Multi = false,
    Default = 1,
})

Dropdown:OnChanged(function(Value)
    gafga = Value
end)
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Mob Aura", Default = false })

Toggle:OnChanged(function(Value)
    LevelFarm = Value
    Farm = Value
    StopTween()
end)
function Click()
    local bc = game:GetService("VirtualUser")
    bc:CaptureController()
    bc:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function EnableBuso()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        NoClip = true
        local args = {[1] = "Buso"}
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        NoClip = false
    end
    NoClip = false
end
function GetWeapon(bh)
    s = ""
    for r, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    for r, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v.ToolTip == bh then
            s = v.Name
        end
    end
    return s
end
function EquipWeapon(ToolSe)
    if gafga == "" or gafga == nil then
        gafga = "Melee"
    end
    ToolSe = GetWeapon(gafga)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        NoClip = true
        local bi = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(bi)
        NoClip = false
    end
end
spawn(function()
 while wait() do
   if LevelFarm then
      for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
         if v:FindFirstChild('Humanoid') and v.Humanoid.Health ~= 0 and v:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude < 1500 then
            repeat wait()
        if LevelFarm then
            Tween2(v.HumanoidRootPart.CFrame * CFrame.new(10,10,10))
            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
            PosLevelFarm = v.HumanoidRootPart.CFrame
            for i1,v1 in pairs(game.Workspace.Enemies:GetChildren()) do
                if v1:FindFirstChild('Humanoid') and v1:FindFirstChild('HumanoidRootPart') and (v1.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude < 170 then
                    v1.HumanoidRootPart.Size = Vector3.new(50,50,50)
                    v1.HumanoidRootPart.CanCollide = false
                    v1.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                end
            end    
            EquipWeapon()
            EnableBuso()
            Click()
        end
            until not LevelFarm or not v:FindFirstChild('Humanoid') or not v:FindFirstChild('HumanoidRootPart') or v.Humanoid.Health == 0
         end
      end 
   end
 end
end)
--[[
spawn(function()
 while wait(3) do
    if LevelFarm then
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v:FindFirstChild('Humanoid') and v:FindFirstChild('HumanoidRootPart') and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < 300 then
               if PosLevelFarm then
                v.HumanoidRootPart.CFrame = PosLevelFarm
                v.HumanoidRootPart.Size = Vector3.new(50,50,50)
               else
                PosLevelFarm = v.HumanoidRootPart.CFrame
               end
            end
        end
    end
 end
end)
]]
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Farm Bone", Default = false })

Toggle:OnChanged(function(Value)
    BoneFarm = Value
    Farm = Value
    StopTween()
end)
spawn(function()
    while wait() do
        if BoneFarm then
            if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild('Humanoid') and v.Humanoid.Health ~= 0 and v:FindFirstChild('HumanoidRootPart') and 
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude < 1500 then
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Sou" or v.Name == "Posessed Mummy" then
                            repeat wait()
                                if BoneFarm then
                                    Tween2(v.HumanoidRootPart.CFrame * CFrame.new(10, 10, 10))
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    PosLevelFarm = v.HumanoidRootPart.CFrame
                                    
                                    for i1, v1 in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v1:FindFirstChild('Humanoid') and v1:FindFirstChild('HumanoidRootPart') and 
                                        (v1.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude < 170 then
                                            v1.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            v1.HumanoidRootPart.CanCollide = false
                                            v1.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        end
                                    end    
                                    
                                    EquipWeapon()
                                    EnableBuso()
                                    Click()
                                end
                            until not BoneFarm or not v:FindFirstChild('Humanoid') or not v:FindFirstChild('HumanoidRootPart') or v.Humanoid.Health == 0
                        end
                    end
                end
            else
                Tween2(CFrame.new(-9359.453125, 141.32679748535156, 5446.81982421875))
            end
        end
    end
end)

function HopServer()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
     --[[
     local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
     end)
     if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
     end
     ]]
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end

    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end

    Teleport()
    wait(1)
end
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto Boss Sea 2", Default = false })

Toggle:OnChanged(function(Value)
    BossFarm = Value
    Farm = Value
    StopTween()
end)

spawn(function()
    while wait() do
        if BossFarm then
            local bossNames = {"Awakened Ice Admiral", "Diamond", "Don Swan", "Jeremy", "Tide Keeper"}

            local g = false
            for _, bossName in ipairs(bossNames) do
                local bossInReplicatedStorage = game:GetService("ReplicatedStorage"):FindFirstChild(bossName)
                local bossInWorkspace = game.workspace.Enemies:FindFirstChild(bossName)

                if bossInWorkspace then
                    local v = bossInWorkspace
                    g = true
                    repeat
                        wait()
                        Tween2(v.HumanoidRootPart.CFrame * CFrame.new(10, 10, 10))
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        EquipWeapon()
                        EnableBuso()
                        Click()
                    until not BossFarm or v.Humanoid.Health == 0 or not v:FindFirstChild('HumanoidRootPart')
                    break
                elseif bossInReplicatedStorage then
                    Tween2(bossInReplicatedStorage.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                    g = true
                    break 
                end
            end
            if not g then

            end
        end
    end
end)


local Tabs = {
    Main = Window:AddTab({ Title = "Race", Icon = "" }),
}


function GetFlower()
    if not game.Players.LocalPlayer.Backpack:FindFirstChild('Flower1') and game.Workspace:FindFirstChild('Flower1') and game.Workspace:FindFirstChild('Flower1').Transparency ~= 1 then
        local flower = game.Workspace:FindFirstChild('Flower1')
        if flower then
            Tween2(flower.CFrame)
        end
    elseif not game.Players.LocalPlayer.Backpack:FindFirstChild('Flower2')  and game.Workspace:FindFirstChild('Flower2') and game.Workspace:FindFirstChild('Flower2').Transparency ~= 1 then
        local flower = game.Workspace:FindFirstChild('Flower2')
        if flower then
            Tween2(flower.CFrame)
        end
    end
end
Tabs.Main:AddButton({
    Title = "Get Flower",
    Description = "Khi Bấm Sẽ Bay tới hoa 1 hoặc 2",
    Callback = function()
        GetFlower()
    end
})
