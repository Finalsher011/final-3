-- FINALMY | Interface inspirada na referencia MARIO HUB
-- LocalScript em StarterPlayer > StarterPlayerScripts.
-- Controles de Aimbot/Silent Aim/Trigger/Gun Mods sao apenas UI demonstrativa.
-- Nenhum controle automatiza mira, tiros, recoil, spread ou interage com jogos de terceiros.

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
if not player then return end
local pg = player:WaitForChild("PlayerGui")
local old = pg:FindFirstChild("FINALMY")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "FINALMY"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = pg

local K = {
    sky = Color3.fromRGB(112, 151, 207),
    skyLight = Color3.fromRGB(207, 224, 239),
    skyPage = Color3.fromRGB(211, 229, 244),
    brown = Color3.fromRGB(151, 83, 62),
    brownDark = Color3.fromRGB(112, 58, 47),
    cream = Color3.fromRGB(249, 244, 225),
    cream2 = Color3.fromRGB(239, 231, 207),
    ink = Color3.fromRGB(55, 48, 42),
    muted = Color3.fromRGB(127, 117, 105),
    red = Color3.fromRGB(198, 57, 65),
    yellow = Color3.fromRGB(247, 205, 75),
    white = Color3.fromRGB(255, 255, 255),
}

local function make(class, props, parent)
    local o = Instance.new(class)
    for k,v in pairs(props or {}) do o[k] = v end
    o.Parent = parent
    return o
end
local function corner(o, n)
    make("UICorner", {CornerRadius=UDim.new(0,n or 10)}, o)
end
local function border(o, color, thickness)
    make("UIStroke", {Color=color or K.ink, Thickness=thickness or 2}, o)
end
local function text(parent, value, size, pos, fontSize, color, font, align)
    return make("TextLabel", {
        BackgroundTransparency=1, Text=value, Size=size, Position=pos,
        Font=font or Enum.Font.GothamBold, TextSize=fontSize or 12,
        TextColor3=color or K.ink, TextXAlignment=align or Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Center
    }, parent)
end

local shell = make("Frame", {
    Name="FINALMY_Window", Size=UDim2.fromOffset(900,610),
    Position=UDim2.new(0.5,-450,0.5,-305),
    BackgroundColor3=K.skyLight, BorderSizePixel=0
}, gui)
corner(shell,16); border(shell,Color3.fromRGB(57,76,111),3)

local top = make("Frame",{Size=UDim2.new(1,0,0,60),BackgroundColor3=K.sky,BorderSizePixel=0},shell)
corner(top,14)
make("Frame",{Position=UDim2.new(0,0,1,-15),Size=UDim2.new(1,0,0,15),BackgroundColor3=K.sky,BorderSizePixel=0},top)
text(top,"FINALMY",UDim2.fromOffset(190,38),UDim2.fromOffset(18,5),25,K.white,Enum.Font.GothamBlack)
text(top,"TRAINING HUB",UDim2.fromOffset(160,15),UDim2.fromOffset(21,39),9,Color3.fromRGB(239,244,255),Enum.Font.GothamBold)
text(top,"☁",UDim2.fromOffset(35,30),UDim2.new(0.48,0,0,13),24,K.white)
text(top,"☁",UDim2.fromOffset(35,30),UDim2.new(0.62,0,0,10),20,K.white)

local lang = make("TextButton",{Size=UDim2.fromOffset(82,31),Position=UDim2.new(1,-190,0,14),Text="PT  ▾",BackgroundColor3=K.cream,TextColor3=K.ink,Font=Enum.Font.GothamBold,TextSize=11,BorderSizePixel=0},top)
corner(lang,14); border(lang,K.ink,1)
lang.Activated:Connect(function() lang.Text=lang.Text=="PT  ▾" and "EN  ▾" or "PT  ▾" end)
local minimize=make("TextButton",{Size=UDim2.fromOffset(32,32),Position=UDim2.new(1,-98,0,13),Text="−",BackgroundColor3=K.yellow,TextColor3=K.ink,Font=Enum.Font.GothamBlack,TextSize=20,BorderSizePixel=0},top)
corner(minimize,8); border(minimize,K.ink,2)
local close=make("TextButton",{Size=UDim2.fromOffset(32,32),Position=UDim2.new(1,-58,0,13),Text="×",BackgroundColor3=K.red,TextColor3=K.white,Font=Enum.Font.GothamBlack,TextSize=18,BorderSizePixel=0},top)
corner(close,8); border(close,K.ink,2)
close.Activated:Connect(function() gui:Destroy() end)
local minimized=false
minimize.Activated:Connect(function()
    minimized=not minimized
    shell.Size=minimized and UDim2.fromOffset(900,60) or UDim2.fromOffset(900,610)
    minimize.Text=minimized and "+" or "−"
end)

local side=make("Frame",{Position=UDim2.fromOffset(0,60),Size=UDim2.new(0,210,1,-60),BackgroundColor3=K.brown,BorderSizePixel=0},shell)
local sideLine=make("Frame",{Position=UDim2.new(1,-5,0,0),Size=UDim2.new(0,5,1,0),BackgroundColor3=K.brownDark,BorderSizePixel=0},side)
text(side,"MENU",UDim2.new(1,-25,0,20),UDim2.fromOffset(15,13),10,Color3.fromRGB(255,219,190))
local nav=make("ScrollingFrame",{Position=UDim2.fromOffset(8,39),Size=UDim2.new(1,-16,1,-105),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=K.yellow,CanvasSize=UDim2.new(0,0,0,0)},side)
local navLayout=make("UIListLayout",{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder},nav)
navLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() nav.CanvasSize=UDim2.fromOffset(0,navLayout.AbsoluteContentSize.Y+8) end)
text(side,"●  FINALMY",UDim2.new(1,-20,0,22),UDim2.new(0,15,1,-52),11,K.cream,Enum.Font.GothamBlack)
text(side,"   Personal Training UI",UDim2.new(1,-20,0,16),UDim2.new(0,15,1,-31),8,Color3.fromRGB(238,202,183))

local body=make("Frame",{Position=UDim2.fromOffset(210,60),Size=UDim2.new(1,-210,1,-60),BackgroundColor3=K.skyPage,BorderSizePixel=0},shell)
local pageTitle=text(body,"AIMBOT",UDim2.new(0.5,0,0,28),UDim2.fromOffset(18,9),20,K.ink,Enum.Font.GothamBlack)
local pageDesc=text(body,"Configuracoes de treinamento",UDim2.new(0.6,0,0,18),UDim2.fromOffset(20,36),10,K.muted,Enum.Font.Gotham)
local search=make("TextBox",{Size=UDim2.fromOffset(210,35),Position=UDim2.new(1,-230,0,15),BackgroundColor3=K.cream,Text="",PlaceholderText="⌕  Pesquisar...",PlaceholderColor3=K.muted,TextColor3=K.ink,Font=Enum.Font.Gotham,TextSize=11,ClearTextOnFocus=false,BorderSizePixel=0},body)
corner(search,18); border(search,K.ink,2)

local pageNames={"Main","Aimbot","Silent Aim","Trigger & Rage","Gun Mods","Visuais","World","Skins","Gun Skins","Misc","Settings"}
local pages={}
local current="Aimbot"
for _,name in ipairs(pageNames) do
    local p=make("ScrollingFrame",{Name=name,Position=UDim2.fromOffset(14,64),Size=UDim2.new(1,-28,1,-78),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=K.red,CanvasSize=UDim2.new(0,0,0,0),Visible=false},body)
    local grid=make("UIGridLayout",{CellSize=UDim2.new(0.5,-8,0,390),CellPadding=UDim2.fromOffset(12,10),SortOrder=Enum.SortOrder.LayoutOrder},p)
    grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        p.CanvasSize=UDim2.fromOffset(0,grid.AbsoluteContentSize.Y+12)
    end)
    pages[name]=p
end

local function panel(parent,title,icon,order,height)
    local f=make("Frame",{BackgroundColor3=K.cream,BorderSizePixel=0,LayoutOrder=order or 1,Size=UDim2.new(1,0,0,height or 300)},parent)
    corner(f,15); border(f,K.ink,2)
    local bar=make("Frame",{Size=UDim2.new(1,0,0,38),BackgroundColor3=K.cream2,BorderSizePixel=0},f)
    corner(bar,13)
    make("Frame",{Position=UDim2.new(0,0,1,-9),Size=UDim2.new(1,0,0,9),BackgroundColor3=K.cream2,BorderSizePixel=0},bar)
    text(bar,(icon or "✦").."  "..title,UDim2.new(1,-35,1,0),UDim2.fromOffset(12,0),12,K.ink,Enum.Font.GothamBlack)
    text(bar,"⌄",UDim2.fromOffset(20,30),UDim2.new(1,-28,0,3),16,K.muted)
    return f
end
local state={}
local function toggle(parent,title,desc,key,y)
    text(parent,title,UDim2.new(1,-90,0,18),UDim2.fromOffset(14,y),11,K.ink,Enum.Font.GothamBold)
    if desc then text(parent,desc,UDim2.new(1,-90,0,16),UDim2.fromOffset(14,y+16),9,K.muted,Enum.Font.Gotham) end
    local b=make("TextButton",{Size=UDim2.fromOffset(42,24),Position=UDim2.new(1,-58,0,y+5),Text="",BackgroundColor3=K.cream2,BorderSizePixel=0},parent)
    corner(b,14); border(b,K.ink,1)
    local dot=make("Frame",{Size=UDim2.fromOffset(17,17),Position=UDim2.fromOffset(3,3),BackgroundColor3=K.white,BorderSizePixel=0},b)
    corner(dot,10); border(dot,K.ink,1)
    state[key]=false
    local function draw()
        b.BackgroundColor3=state[key] and K.red or K.cream2
        dot.Position=state[key] and UDim2.fromOffset(22,3) or UDim2.fromOffset(3,3)
    end
    b.Activated:Connect(function() state[key]=not state[key]; draw() end)
    draw()
end
local function slider(parent,title,desc,key,y,min,max,default,unit)
    text(parent,title,UDim2.new(1,-80,0,18),UDim2.fromOffset(14,y),11,K.ink,Enum.Font.GothamBold)
    local val=text(parent,tostring(default)..(unit or ""),UDim2.fromOffset(70,18),UDim2.new(1,-86,0,y),10,K.red,Enum.Font.GothamBold,Enum.TextXAlignment.Right)
    if desc then text(parent,desc,UDim2.new(1,-25,0,15),UDim2.fromOffset(14,y+17),9,K.muted,Enum.Font.Gotham) end
    local bar=make("Frame",{Size=UDim2.new(1,-30,0,8),Position=UDim2.fromOffset(14,y+39),BackgroundColor3=K.cream2,BorderSizePixel=0},parent)
    corner(bar,5); border(bar,K.ink,1)
    local fill=make("Frame",{Size=UDim2.new((default-min)/(max-min),0,1,0),BackgroundColor3=K.red,BorderSizePixel=0},bar)
    corner(fill,5)
    local knob=make("Frame",{Size=UDim2.fromOffset(17,17),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new((default-min)/(max-min),0,0.5,0),BackgroundColor3=K.yellow,BorderSizePixel=0},bar)
    corner(knob,10); border(knob,K.ink,1)
    local hit=make("TextButton",{Size=UDim2.new(1,0,0,26),Position=UDim2.new(0,0,0.5,-13),BackgroundTransparency=1,Text=""},bar)
    local function setAt(x)
        local r=math.clamp((x-bar.AbsolutePosition.X)/math.max(bar.AbsoluteSize.X,1),0,1)
        local v=math.floor(min+r*(max-min)+0.5)
        fill.Size=UDim2.new(r,0,1,0); knob.Position=UDim2.new(r,0,0.5,0)
        val.Text=tostring(v)..(unit or ""); state[key]=v
    end
    hit.Activated:Connect(function() setAt(UIS:GetMouseLocation().X) end)
    state[key]=default
end
local function dropdown(parent,title,desc,key,options,y)
    text(parent,title,UDim2.new(1,-20,0,18),UDim2.fromOffset(14,y),11,K.ink,Enum.Font.GothamBold)
    if desc then text(parent,desc,UDim2.new(1,-20,0,15),UDim2.fromOffset(14,y+17),9,K.muted,Enum.Font.Gotham) end
    local idx=1
    local b=make("TextButton",{Size=UDim2.new(1,-28,0,34),Position=UDim2.fromOffset(14,y+37),BackgroundColor3=K.white,Text=options[idx].."     ▾",TextColor3=K.ink,Font=Enum.Font.GothamBold,TextSize=11,BorderSizePixel=0},parent)
    corner(b,9); border(b,K.ink,2)
    state[key]=options[idx]
    b.Activated:Connect(function() idx=idx%#options+1; state[key]=options[idx]; b.Text=options[idx].."     ▾" end)
end

-- Aimbot: prototipo visual, sem direcionar a camera ou mirar automaticamente.
local p=pages["Aimbot"]
local a=panel(p,"Aimbot","🎯",1,290)
toggle(a,"Aimbot (demo)","Somente alterna o estado visual","aim_demo",48)
dropdown(a,"Key mode","Modo de tecla ilustrativo","aim_key",{"Toggle","Hold"},100)
slider(a,"Smoothness","1 = instant snap (apenas demo)","aim_smooth",165,1,100,1,"")
local sticky=panel(p,"Aimbot Targeting","🎯",2,370)
dropdown(sticky,"Aim part","Parte de referencia","aim_part",{"Head","Torso","HumanoidRootPart"},49)
dropdown(sticky,"Priority","Prioridade ilustrativa","aim_priority",{"Crosshair","Distance","Health"},133)
toggle(sticky,"Visible only","Preferencia visual","aim_visible",218)
slider(sticky,"FOV","Circulo de referencia","aim_fov",265,10,500,150,"px")
slider(sticky,"Max distance","Distancia de referencia","aim_dist",325,50,1500,1500,"m")

p=pages["Silent Aim"]
local s=panel(p,"Silent Aim","◉",1,310)
toggle(s,"Silent Aim (demo)","Nao redireciona tiros nem eventos","silent_demo",50)
dropdown(s,"Priority","Preferencia ilustrativa","silent_priority",{"Crosshair","Distance","Health"},105)
toggle(s,"Visible only","Preferencia visual","silent_visible",200)
slider(s,"Max distance","Valor demonstrativo","silent_dist",245,50,1500,500,"m")

p=pages["Trigger & Rage"]
local tr=panel(p,"Triggerbot","⚡",1,210)
toggle(tr,"Triggerbot (demo)","Nao dispara automaticamente","trigger_demo",54)
dropdown(tr,"Activation","Controle ilustrativo","trigger_mode",{"Hold","Toggle"},112)
local rg=panel(p,"Rage settings","☠",2,210)
toggle(rg,"Ragebot (demo)","Nao altera combate","rage_demo",54)
dropdown(rg,"Mode","Opcao demonstrativa","rage_mode",{"Default","Fast","Custom"},112)

p=pages["Gun Mods"]
local gm=panel(p,"Gun Mods","⚔",1,190)
toggle(gm,"No recoil (demo)","Nao altera armas ou camera","recoil_demo",55)
toggle(gm,"No spread (demo)","Nao altera projeteis","spread_demo",115)

p=pages["Visuais"]
local v1=panel(p,"Player / NPC ESP","👁",1,390)
toggle(v1,"NPC ESP","Destaque apenas em NPCs do seu jogo","npc_esp",48)
toggle(v1,"Line ESP","Opcao visual de demonstracao","line_esp",104)
toggle(v1,"Box ESP","Opcao visual de demonstracao","box_esp",160)
toggle(v1,"Health bar","Barra de vida demonstrativa","healthbar",216)
toggle(v1,"Distance","Distancia de NPCs","npc_distance",272)
toggle(v1,"Name","Nome de NPCs","npc_name",328)
local v2=panel(p,"ESP Extra","✧",2,300)
toggle(v2,"Team check (demo)","Nao identifica jogadores","team_check",48)
dropdown(v2,"ESP color","Cor de referencia","esp_color",{"Red","Green","Blue","Yellow"},105)
dropdown(v2,"Health position","Posicao da barra","health_pos",{"Above","Below","Side"},190)
toggle(v2,"Show NPC health","Vida de NPCs","npc_health",245)

p=pages["World"]
local w=panel(p,"World settings","▣",1,300)
toggle(w,"Fullbright (demo)","Nao altera partidas externas","fullbright",50)
toggle(w,"No Flash (demo)","Opcao visual ilustrativa","noflash",110)
toggle(w,"No Smoke (demo)","Opcao visual ilustrativa","nosmoke",170)
slider(w,"Brightness","Valor ilustrativo","brightness",235,0,100,50,"%")
local w2=panel(p,"Camera","◉",2,170)
slider(w2,"Camera FOV","Valor de referencia","camera_fov",50,50,120,70,"°")

p=pages["Skins"]
local sk=panel(p,"Skin Changer","✦",1,245)
dropdown(sk,"Character skin","Catalogo de exemplo","character_skin",{"Default","Classic","Neon","Gold"},50)
dropdown(sk,"Knife","Catalogo de exemplo","knife_skin",{"Default","Red","Blue","Gold"},135)
local sk2=panel(p,"Gloves","✦",2,170)
dropdown(sk2,"Glove style","Catalogo de exemplo","glove_skin",{"Default","Sport","Neon"},50)

p=pages["Gun Skins"]
local gs=panel(p,"Weapon appearance","⚔",1,245)
dropdown(gs,"Weapon","Item de exemplo","weapon",{"Rifle","Pistol","SMG","Shotgun"},50)
dropdown(gs,"Finish","Acabamento visual","finish",{"Default","Carbon","Neon","Gold"},135)
toggle(gs,"Preview (demo)","Somente estado de interface","skin_preview",195)

p=pages["Misc"]
local m=panel(p,"Utilities","⚙",1,260)
toggle(m,"Auto Buy (demo)","Nao realiza compras","autobuy",50)
toggle(m,"Show codes","Exibe controle ilustrativo","show_codes",110)
toggle(m,"Streamer mode","Preferencia de interface","streamer",170)
dropdown(m,"Language","Idioma do painel","language",{"Português","English","Español"},220)

p=pages["Settings"]
local st=panel(p,"Settings","⚙",1,300)
dropdown(st,"Theme","Tema de interface","theme",{"Mario Blue","Dark","Red"},50)
dropdown(st,"UI scale","Escala visual","scale",{"90%","100%","110%","120%"},135)
toggle(st,"Animations","Animacoes da interface","animations",220)

local navButtons={}
local sections={
    {"MAIN",{{"Main","🏠"}}},
    {"COMBAT",{{"Aimbot","🎯"},{"Silent Aim","👁"},{"Trigger & Rage","⚡"},{"Gun Mods","⚔"}}},
    {"VISUALS",{{"Visuais","👀"},{"World","🟩"},{"Skins","⭐"},{"Gun Skins","🔫"}}},
    {"OTHER",{{"Misc","🧰"},{"Settings","⚙"}}}
}
local order=0
for _,section in ipairs(sections) do
    local h=text(nav,section[1],UDim2.new(1,-10,0,18),UDim2.fromOffset(7,0),9,Color3.fromRGB(255,215,185),Enum.Font.GothamBlack)
    h.LayoutOrder=order; order+=1
    for _,entry in ipairs(section[2]) do
        local name,ico=entry[1],entry[2]
        local b=make("TextButton",{Size=UDim2.new(1,-4,0,38),BackgroundColor3=K.brown,Text="  "..ico.."   "..name,TextXAlignment=Enum.TextXAlignment.Left,TextColor3=K.cream,Font=Enum.Font.GothamBold,TextSize=11,BorderSizePixel=0,LayoutOrder=order},nav)
        corner(b,10)
        navButtons[name]=b
        b.Activated:Connect(function()
            if name=="Main" then name="Aimbot" end
            current=name
            for n,pg2 in pairs(pages) do pg2.Visible=(n==name) end
            pageTitle.Text=string.upper(name)
            pageDesc.Text="FINALMY  •  "..name
            for n,btn in pairs(navButtons) do
                btn.BackgroundColor3=(n==name) and K.cream or K.brown
                btn.TextColor3=(n==name) and K.red or K.cream
            end
        end)
        order+=1
    end
end

local function setPage(name)
    current=name
    for n,pg2 in pairs(pages) do pg2.Visible=(n==name) end
    pageTitle.Text=string.upper(name)
    pageDesc.Text="FINALMY  •  "..name
    for n,btn in pairs(navButtons) do
        btn.BackgroundColor3=(n==name) and K.cream or K.brown
        btn.TextColor3=(n==name) and K.red or K.cream
    end
end
setPage("Aimbot")

search:GetPropertyChangedSignal("Text"):Connect(function()
    local q=string.lower(search.Text)
    local pg=pages[current]
    if not pg then return end
    for _,child in ipairs(pg:GetChildren()) do
        if child:IsA("Frame") then
            local title=child:FindFirstChildWhichIsA("TextLabel",true)
            child.Visible=(q=="") or (title and string.find(string.lower(title.Text),q,1,true)~=nil)
        end
    end
end)

-- Drag da janela pela barra superior
local dragging,dragStart,startPos=false,nil,nil
top.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        dragging=true; dragStart=input.Position; startPos=shell.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
        local d=input.Position-dragStart
        shell.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then dragging=false end
end)
UIS.InputBegan:Connect(function(input,processed)
    if not processed and input.KeyCode==Enum.KeyCode.RightShift then gui.Enabled=not gui.Enabled end
end)

-- Main page menu entry maps to the default Aimbot preview page.
if navButtons["Main"] then
    navButtons["Main"].Activated:Connect(function() setPage("Aimbot") end)
end
print("[FINALMY] Interface inspirada na referencia carregada. RightShift abre/fecha.")
