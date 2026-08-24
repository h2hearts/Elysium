local a={Options={},Folder="Maclib"}


local b=game:GetService"TweenService"
local c=game:GetService"RunService"
local d=game:GetService"HttpService"
local e=game:GetService"ContentProvider"
local f=game:GetService"UserInputService"
local g=game:GetService"Players"
game:GetService"Lighting"


local h=c:IsStudio()
local i=g.LocalPlayer

local j
local k
local l

local m={}
local n
local o=0
local p=false

local q={
interFont="rbxassetid://12187365364",
toggleBackground="rbxassetid://18772190202",
togglerHead="rbxassetid://18772309008",
buttonImage="rbxassetid://10709791437",
searchIcon="rbxassetid://86737463322606",
colorWheel="rbxassetid://2849458409",
colorTarget="rbxassetid://73265255323268",
grid="rbxassetid://121484455191370",
globe="rbxassetid://108952102602834",
transform="rbxassetid://90336395745819",
dropdown="rbxassetid://18865373378",
sliderbar="rbxassetid://18772615246",
sliderhead="rbxassetid://18772834246",

roundTop="rbxassetid://16287196357",
box="rbxassetid://16286719854",
roundBottom="rbxassetid://16287194510",
}

local r="https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"

local s
pcall(function()
s=loadstring(
game.HttpGetAsync and game:HttpGetAsync(r)
or d:GetAsync(r)
)()
if s and s.SetIconsType then
s.SetIconsType"lucide"
end
end)


local function Tween(t,u,v)
return b:Create(t,u,v)
end

local function Icon(t,u)
if s and typeof(s)=="table"and s.Icon then
return s.Icon(t,nil,u~=false)
end
return nil
end


function a.Window(t,u)
local v={Settings=u}
print"[Elysium] - UI Loaded"

local w=Instance.new"ScreenGui"
w.Name="MacLib"
w.ResetOnSpawn=false
w.DisplayOrder=100
w.IgnoreGuiInset=true
w.ScreenInsets=Enum.ScreenInsets.None
w.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
w.Parent=(h and i.PlayerGui)or game:GetService"CoreGui"

local x=Instance.new"Frame"
x.Name="Notifications"
x.BackgroundColor3=Color3.fromRGB(255,255,255)
x.BackgroundTransparency=1
x.BorderColor3=Color3.fromRGB(0,0,0)
x.BorderSizePixel=0
x.Size=UDim2.fromScale(1,1)
x.Parent=w
x.ZIndex=2

local y=Instance.new"UIListLayout"
y.Name="NotificationsUIListLayout"
y.Padding=UDim.new(0,10)
y.HorizontalAlignment=Enum.HorizontalAlignment.Right
y.SortOrder=Enum.SortOrder.LayoutOrder
y.VerticalAlignment=Enum.VerticalAlignment.Bottom
y.Parent=x

local z=Instance.new"UIPadding"
z.Name="NotificationsUIPadding"
z.PaddingBottom=UDim.new(0,10)
z.PaddingLeft=UDim.new(0,10)
z.PaddingRight=UDim.new(0,10)
z.PaddingTop=UDim.new(0,10)
z.Parent=x


local A
local B
local C

local function initAcrylic()
local D=game:GetService"Lighting"
local E=D:FindFirstChild"Elysium_AcrylicDOF"
if E then E:Destroy()end

B=Instance.new"DepthOfFieldEffect"
B.Name="Elysium_AcrylicDOF"
B.FarIntensity=0
B.InFocusRadius=0.1
B.NearIntensity=1
B.FocusDistance=0.45
B.Parent=D

local F=D:FindFirstChild"Elysium_UIBlur"
if F then F:Destroy()end

local G=Instance.new"BlurEffect"
G.Name="Elysium_UIBlur"
G.Size=24
G.Enabled=true
G.Parent=D

local H=workspace.CurrentCamera:FindFirstChild"Elysium_AcrylicFolder"
if H then H:Destroy()end

local I=Instance.new"Folder"
I.Name="Elysium_AcrylicFolder"
I.Parent=workspace.CurrentCamera

A=Instance.new"Part"
A.Name="AcrylicGlassPart"
A.Material=Enum.Material.Glass
A.Transparency=0.98
A.Color=Color3.fromRGB(240,240,255)
A.CastShadow=false
A.CanCollide=false
A.CanTouch=false
A.CanQuery=false
A.Anchored=true
A.Parent=I

local J=Instance.new"SpecialMesh"
J.MeshType=Enum.MeshType.Brick
J.Parent=A

local function updatePosition()
local K=workspace.CurrentCamera
local L=game:GetService"Lighting":FindFirstChild"Elysium_UIBlur"

if not K or not base or not base.Parent or not base.Visible or not j then
if A then A.Transparency=1 end
if B then B.Enabled=false end
if L then L.Enabled=false end
return
end

if B then B.Enabled=true end
if A then A.Transparency=0.98 end
if L then L.Enabled=true end

local M=base.AbsolutePosition
local N=base.AbsoluteSize
local O=0.45
local P=K.CFrame


local Q=3.5

local function get3DPosition(R,S)
local T=K:ViewportPointToRay(R,S)
local U=P:VectorToObjectSpace(T.Direction)
local V=-O/U.Z
return P*(U*V)
end

local R=get3DPosition(M.X+N.X/2,M.Y+N.Y/2)
local S=get3DPosition(M.X+Q,M.Y+Q)
local T=get3DPosition(M.X+N.X-Q,M.Y+N.Y-Q)

local U=P:PointToObjectSpace(S)
local V=P:PointToObjectSpace(T)

local W=math.abs(V.X-U.X)
local X=math.abs(V.Y-U.Y)

A.Size=Vector3.new(W,X,0.001)
A.CFrame=CFrame.new(R,R+P.LookVector)
end

C=c.RenderStepped:Connect(updatePosition)
end

local D=Instance.new"Frame"
D.Name="Base"
D.AnchorPoint=Vector2.new(0.5,0.5)
D.BackgroundColor3=Color3.fromRGB(35,33,44)
D.ClipsDescendants=true
D.BackgroundTransparency=0.32
D.BorderColor3=Color3.fromRGB(0,0,0)
D.BorderSizePixel=0
D.Position=UDim2.fromScale(0.5,0.5)
D.Size=u.Size or UDim2.fromOffset(868,650)
D.Visible=false

pcall(initAcrylic)


local E=Instance.new"UIGradient"
E.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(22,22,22)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(35,33,44)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(24,22,30)),
}
E.Rotation=135
E.Parent=D


local F=Instance.new"Frame"
F.Name="GlassSheen"
F.BackgroundColor3=Color3.fromRGB(255,255,255)
F.BackgroundTransparency=0.96
F.BorderSizePixel=0
F.Size=UDim2.fromScale(1,1)
F.ZIndex=0
F.Parent=D

local G=Instance.new"UICorner"
G.CornerRadius=UDim.new(0,12)
G.Parent=F

local H=Instance.new"UIGradient"
H.Rotation=90
H.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.82),
NumberSequenceKeypoint.new(0.3,0.98),
NumberSequenceKeypoint.new(1,1)
}
H.Parent=F

local function playBootAnimation()
local I=game:GetService"TweenService"


local J=Instance.new"Sound"
J.SoundId="rbxassetid://6230186752"
J.Volume=0.4
J.Parent=D
J:Play()

local K=game.Workspace.CurrentCamera
local L=K.FieldOfView
local M=30


D.Size=UDim2.fromScale(0,0)
D.Position=UDim2.fromScale(0.5,0.5)
D.Visible=true
D.BackgroundTransparency=1


local N=TweenInfo.new(
1.4,
Enum.EasingStyle.Sine,
Enum.EasingDirection.InOut
)

local O=I:Create(K,N,{
FieldOfView=M
})


O:Play()

task.wait(0.25)



local P=TweenInfo.new(
0.5,
Enum.EasingStyle.Quart,
Enum.EasingDirection.Out
)

local Q=I:Create(D,P,{
Size=UDim2.new(u.Size.X.Scale*1.02,u.Size.X.Offset,u.Size.Y.Scale*1.02,u.Size.Y.Offset)
})


local R=TweenInfo.new(
0.4,
Enum.EasingStyle.Quart,
Enum.EasingDirection.Out
)

local S=I:Create(D,R,{
BackgroundTransparency=0.32
})

Q:Play()
S:Play()

task.wait(0.5)


local T=TweenInfo.new(
0.35,
Enum.EasingStyle.Sine,
Enum.EasingDirection.InOut
)

local U=I:Create(D,T,{
Size=u.Size
})

U:Play()

task.wait(0.6)


local V=TweenInfo.new(
1.4,
Enum.EasingStyle.Sine,
Enum.EasingDirection.InOut
)

local W=I:Create(K,V,{
FieldOfView=L
})

W:Play()


task.wait(1.4)
J:Destroy()
end


local I=Instance.new"UIScale"
I.Name="BaseUIScale"
I.Parent=D

local J=Instance.new"UICorner"
J.Name="BaseUICorner"
J.CornerRadius=UDim.new(0,12)
J.Parent=D

local K=Instance.new"UIStroke"
K.Name="BaseUIStroke"
K.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
K.Color=Color3.fromRGB(80,75,95)
K.Transparency=0.55
K.Thickness=1.2
K.Parent=D

local L=Instance.new"Frame"
L.Name="Sidebar"
L.BackgroundColor3=Color3.fromRGB(28,25,36)
L.BackgroundTransparency=0.4
L.BorderColor3=Color3.fromRGB(0,0,0)
L.BorderSizePixel=0
L.Position=UDim2.fromScale(-3.5199999999999996E-8,4.69e-08)
L.Size=UDim2.fromScale(0.325,1)

local M=Instance.new"UICorner"
M.CornerRadius=UDim.new(0,12)
M.Parent=L

local N=Instance.new"Frame"
N.Name="CornerFix"
N.BackgroundColor3=L.BackgroundColor3
N.BackgroundTransparency=L.BackgroundTransparency
N.BorderSizePixel=0
N.Size=UDim2.new(0,12,1,0)
N.AnchorPoint=Vector2.new(1,0)
N.Position=UDim2.fromScale(1,0)
N.Parent=L

local O=Instance.new"Frame"
O.Name="Divider"
O.AnchorPoint=Vector2.new(1,0)
O.BackgroundColor3=Color3.fromRGB(90,80,115)
O.BackgroundTransparency=0.85
O.BorderColor3=Color3.fromRGB(0,0,0)
O.BorderSizePixel=0
O.Position=UDim2.fromScale(1,0)
O.Size=UDim2.new(0,1,1,0)
O.Parent=L

local P=Instance.new"TextButton"
P.Name="DividerInteract"
P.AnchorPoint=Vector2.new(0.5,0)
P.BackgroundColor3=Color3.fromRGB(255,255,255)
P.BackgroundTransparency=1
P.BorderColor3=Color3.fromRGB(0,0,0)
P.BorderSizePixel=0
P.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
P.Position=UDim2.fromScale(0.5,0)
P.Size=UDim2.new(1,6,1,0)
P.Text=""
P.TextColor3=Color3.fromRGB(0,0,0)
P.TextSize=14
P.Parent=O

local Q=Instance.new"Frame"
Q.Name="WindowControls"
Q.BackgroundColor3=Color3.fromRGB(255,255,255)
Q.BackgroundTransparency=1
Q.BorderColor3=Color3.fromRGB(0,0,0)
Q.BorderSizePixel=0
Q.Size=UDim2.new(1,0,0,31)
Q.Visible=true

local R=Instance.new"Frame"
R.Name="Controls"
R.BackgroundColor3=Color3.fromRGB(119,174,94)
R.BackgroundTransparency=1
R.BorderColor3=Color3.fromRGB(0,0,0)
R.BorderSizePixel=0
R.Size=UDim2.fromScale(1,1)

local S=Instance.new"UIListLayout"
S.Name="UIListLayout"
S.Padding=UDim.new(0,5)
S.FillDirection=Enum.FillDirection.Horizontal
S.SortOrder=Enum.SortOrder.LayoutOrder
S.VerticalAlignment=Enum.VerticalAlignment.Center
S.Parent=R

local T=Instance.new"UIPadding"
T.Name="UIPadding"
T.PaddingLeft=UDim.new(0,11)
T.Parent=R

local U={
sizes={enabled=UDim2.fromOffset(12,12),disabled=UDim2.fromOffset(11,11)},
transparencies={enabled=0,disabled=1},
strokeTransparency=0.9,
}

local V=Instance.new"UIStroke"
V.Name="BaseUIStroke"
V.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
V.Color=Color3.fromRGB(255,255,255)
V.Transparency=U.strokeTransparency

local W=Instance.new"TextButton"
W.Name="Exit"
W.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
W.Text=""
W.TextColor3=Color3.fromRGB(0,0,0)
W.TextSize=14
W.AutoButtonColor=false
W.BackgroundColor3=Color3.fromRGB(250,93,86)
W.BorderColor3=Color3.fromRGB(0,0,0)
W.BorderSizePixel=0

local X=Instance.new"UICorner"
X.Name="UICorner"
X.CornerRadius=UDim.new(1,0)
X.Parent=W

W.Parent=R

local Y=Instance.new"TextButton"
Y.Name="Minimize"
Y.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
Y.Text=""
Y.TextColor3=Color3.fromRGB(0,0,0)
Y.TextSize=14
Y.AutoButtonColor=false
Y.BackgroundColor3=Color3.fromRGB(252,190,57)
Y.BorderColor3=Color3.fromRGB(0,0,0)
Y.BorderSizePixel=0
Y.LayoutOrder=1

local Z=Instance.new"UICorner"
Z.Name="UICorner"
Z.CornerRadius=UDim.new(1,0)
Z.Parent=Y

Y.Parent=R

local _=Instance.new"TextButton"
_.Name="Maximize"
_.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
_.Text=""
_.TextColor3=Color3.fromRGB(0,0,0)
_.TextSize=14
_.AutoButtonColor=false
_.BackgroundColor3=Color3.fromRGB(119,174,94)
_.BorderColor3=Color3.fromRGB(0,0,0)
_.BorderSizePixel=0
_.LayoutOrder=1

local aa=Instance.new"UICorner"
aa.Name="UICorner"
aa.CornerRadius=UDim.new(1,0)
aa.Parent=_

_.Parent=R

local function applyState(ab,ac)
local ad=ac and U.sizes.enabled or U.sizes.disabled
local ae=ac and U.transparencies.enabled or U.transparencies.disabled

ab.Size=ad
ab.BackgroundTransparency=ae
ab.Active=ac
ab.Interactable=ac

for af,ag in ipairs(ab:GetChildren())do
if ag:IsA"UIStroke"then
ag.Transparency=ae
end
end
if not ac then
V:Clone().Parent=ab
end
end

applyState(_,true)

local ab={W,Y,_}
for ac,ad in pairs(ab)do
local ae=ad.Name
local af=true

if u.DisabledWindowControls and table.find(u.DisabledWindowControls,ae)then
af=false
end

applyState(ad,af)
end

R.Parent=Q

local ac=Instance.new"Frame"
ac.Name="Divider"
ac.AnchorPoint=Vector2.new(0,1)
ac.BackgroundColor3=Color3.fromRGB(255,255,255)
ac.BackgroundTransparency=0.9
ac.BorderColor3=Color3.fromRGB(0,0,0)
ac.BorderSizePixel=0
ac.Position=UDim2.fromScale(0,1)
ac.Size=UDim2.new(1,0,0,1)
ac.Parent=Q

Q.Parent=L

local ad=Instance.new"Frame"
ad.Name="Information"
ad.BackgroundColor3=Color3.fromRGB(255,255,255)
ad.BackgroundTransparency=1
ad.BorderColor3=Color3.fromRGB(0,0,0)
ad.BorderSizePixel=0
ad.Position=UDim2.fromOffset(0,30)
ad.Size=UDim2.new(1,0,0,60)

local ae=Instance.new"Frame"
ae.Name="Divider"
ae.AnchorPoint=Vector2.new(0,1)
ae.BackgroundColor3=Color3.fromRGB(255,255,255)
ae.BackgroundTransparency=0.9
ae.BorderColor3=Color3.fromRGB(0,0,0)
ae.BorderSizePixel=0
ae.Position=UDim2.fromScale(0,1)
ae.Size=UDim2.new(1,0,0,1)
ae.Parent=ad

local af=Instance.new"Frame"
af.Name="InformationHolder"
af.BackgroundColor3=Color3.fromRGB(255,255,255)
af.BackgroundTransparency=1
af.BorderColor3=Color3.fromRGB(0,0,0)
af.BorderSizePixel=0
af.Size=UDim2.fromScale(1,1)

local ag=Instance.new"UIPadding"
ag.Name="InformationHolderUIPadding"
ag.PaddingBottom=UDim.new(0,10)
ag.PaddingLeft=UDim.new(0,23)
ag.PaddingRight=UDim.new(0,22)
ag.PaddingTop=UDim.new(0,10)
ag.Parent=af

local ah=Instance.new"ImageButton"
ah.Name="GlobalSettingsButton"
ah.Image=q.globe
ah.ImageTransparency=0.5
ah.AnchorPoint=Vector2.new(1,0.5)
ah.BackgroundColor3=Color3.fromRGB(255,255,255)
ah.BackgroundTransparency=1
ah.BorderColor3=Color3.fromRGB(0,0,0)
ah.BorderSizePixel=0
ah.Position=UDim2.fromScale(1,0.5)
ah.Size=UDim2.fromOffset(16,16)
ah.Parent=af

local function ChangeGlobalSettingsButtonState(ai)
if ai=="Default"then
Tween(ah,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.5
}):Play()
elseif ai=="Hover"then
Tween(ah,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.3
}):Play()
end
end

ah.MouseEnter:Connect(function()
ChangeGlobalSettingsButtonState"Hover"
end)
ah.MouseLeave:Connect(function()
ChangeGlobalSettingsButtonState"Default"
end)

local ai=Instance.new"Frame"
ai.Name="TitleFrame"
ai.BackgroundColor3=Color3.fromRGB(255,255,255)
ai.BackgroundTransparency=1
ai.BorderColor3=Color3.fromRGB(0,0,0)
ai.BorderSizePixel=0
ai.Size=UDim2.fromScale(1,1)

local aj=Instance.new"TextLabel"
aj.Name="Title"
aj.FontFace=Font.new(
q.interFont,
Enum.FontWeight.SemiBold,
Enum.FontStyle.Normal
)
aj.Text=u.Title
aj.TextColor3=Color3.fromRGB(255,255,255)
aj.RichText=true
aj.TextSize=18
aj.TextTransparency=0.1
aj.TextTruncate=Enum.TextTruncate.SplitWord
aj.TextXAlignment=Enum.TextXAlignment.Left
aj.TextYAlignment=Enum.TextYAlignment.Top
aj.AutomaticSize=Enum.AutomaticSize.Y
aj.BackgroundColor3=Color3.fromRGB(255,255,255)
aj.BackgroundTransparency=1
aj.BorderColor3=Color3.fromRGB(0,0,0)
aj.BorderSizePixel=0
aj.Size=UDim2.new(1,-20,0,0)
aj.Parent=ai

local ak=Instance.new"TextLabel"
ak.Name="Subtitle"
ak.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
ak.RichText=true
ak.Text=u.Subtitle
ak.RichText=true
ak.TextColor3=Color3.fromRGB(255,255,255)
ak.TextSize=12
ak.TextTransparency=0.7
ak.TextTruncate=Enum.TextTruncate.SplitWord
ak.TextXAlignment=Enum.TextXAlignment.Left
ak.TextYAlignment=Enum.TextYAlignment.Top
ak.AutomaticSize=Enum.AutomaticSize.Y
ak.BackgroundColor3=Color3.fromRGB(255,255,255)
ak.BackgroundTransparency=1
ak.BorderColor3=Color3.fromRGB(0,0,0)
ak.BorderSizePixel=0
ak.LayoutOrder=1
ak.Size=UDim2.new(1,-20,0,0)
ak.Parent=ai

local al=Instance.new"UIListLayout"
al.Name="TitleFrameUIListLayout"
al.Padding=UDim.new(0,3)
al.SortOrder=Enum.SortOrder.LayoutOrder
al.VerticalAlignment=Enum.VerticalAlignment.Center
al.Parent=ai

ai.Parent=af

af.Parent=ad

ad.Parent=L

local am=Instance.new"Frame"
am.Name="SidebarGroup"
am.BackgroundColor3=Color3.fromRGB(255,255,255)
am.BackgroundTransparency=1
am.BorderColor3=Color3.fromRGB(0,0,0)
am.BorderSizePixel=0
am.Position=UDim2.fromOffset(0,90)
am.Size=UDim2.new(1,0,1,-90)

local an=Instance.new"Frame"
an.Name="UserInfo"
an.AnchorPoint=Vector2.new(0,1)
an.BackgroundColor3=Color3.fromRGB(255,255,255)
an.BackgroundTransparency=1
an.BorderColor3=Color3.fromRGB(0,0,0)
an.BorderSizePixel=0
an.Visible=false
an.Position=UDim2.fromScale(0,1)
an.Size=UDim2.new(1,0,0,50)

local ao=Instance.new"Frame"
ao.Name="InformationGroup"
ao.BackgroundColor3=Color3.fromRGB(255,255,255)
ao.BackgroundTransparency=1
ao.BorderColor3=Color3.fromRGB(0,0,0)
ao.BorderSizePixel=0
ao.Size=UDim2.fromScale(1,1)

local ap=Instance.new"UIPadding"
ap.Name="InformationGroupUIPadding"
ap.PaddingBottom=UDim.new(0,17)
ap.PaddingLeft=UDim.new(0,15)
ap.Parent=ao

local aq=Instance.new"UIListLayout"
aq.Name="InformationGroupUIListLayout"
aq.FillDirection=Enum.FillDirection.Horizontal
aq.SortOrder=Enum.SortOrder.LayoutOrder
aq.VerticalAlignment=Enum.VerticalAlignment.Center
aq.Parent=ao

local ar=i.UserId
local as=Enum.ThumbnailType.AvatarBust
local at=Enum.ThumbnailSize.Size48x48
local au,av=g:GetUserThumbnailAsync(ar,as,at)

local aw=Instance.new"ImageLabel"
aw.Name="Headshot"
aw.BackgroundColor3=Color3.fromRGB(255,255,255)
aw.BackgroundTransparency=1
aw.BorderColor3=Color3.fromRGB(0,0,0)
aw.BorderSizePixel=0
aw.Size=UDim2.fromOffset(32,32)
aw.Image=(av and au)or"rbxassetid://0"

local ax=Instance.new"UICorner"
ax.Name="UICorner"
ax.CornerRadius=UDim.new(1,0)
ax.Parent=aw

local ay=Instance.new"UIStroke"
ay.Name="BaseUIStroke"
ay.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
ay.Color=Color3.fromRGB(255,255,255)
ay.Transparency=0.9
ay.Parent=aw

aw.Parent=ao

local az=Instance.new"Frame"
az.Name="UserAndDisplayFrame"
az.BackgroundColor3=Color3.fromRGB(255,255,255)
az.BackgroundTransparency=1
az.BorderColor3=Color3.fromRGB(0,0,0)
az.BorderSizePixel=0
az.LayoutOrder=1
az.Size=UDim2.new(1,-42,0,32)

local aA=Instance.new"TextLabel"
aA.Name="DisplayName"
aA.FontFace=Font.new(
q.interFont,
Enum.FontWeight.SemiBold,
Enum.FontStyle.Normal
)
aA.Text=i.DisplayName
aA.TextColor3=Color3.fromRGB(255,255,255)
aA.TextSize=13
aA.TextTransparency=0.1
aA.TextTruncate=Enum.TextTruncate.SplitWord
aA.TextXAlignment=Enum.TextXAlignment.Left
aA.TextYAlignment=Enum.TextYAlignment.Top
aA.AutomaticSize=Enum.AutomaticSize.XY
aA.BackgroundColor3=Color3.fromRGB(255,255,255)
aA.BackgroundTransparency=1
aA.BorderColor3=Color3.fromRGB(0,0,0)
aA.BorderSizePixel=0
aA.Parent=az
aA.Size=UDim2.fromScale(1,0)

local aB=Instance.new"UIPadding"
aB.Name="UserAndDisplayFrameUIPadding"
aB.PaddingLeft=UDim.new(0,8)
aB.PaddingTop=UDim.new(0,3)
aB.Parent=az

local aC=Instance.new"UIListLayout"
aC.Name="UserAndDisplayFrameUIListLayout"
aC.Padding=UDim.new(0,1)
aC.SortOrder=Enum.SortOrder.LayoutOrder
aC.Parent=az

local aD=Instance.new"TextLabel"
aD.Name="Username"
aD.FontFace=Font.new(
q.interFont,
Enum.FontWeight.SemiBold,
Enum.FontStyle.Normal
)
aD.Text="@"..i.Name
aD.TextColor3=Color3.fromRGB(255,255,255)
aD.TextSize=12
aD.TextTransparency=0.7
aD.TextTruncate=Enum.TextTruncate.SplitWord
aD.TextXAlignment=Enum.TextXAlignment.Left
aD.TextYAlignment=Enum.TextYAlignment.Top
aD.AutomaticSize=Enum.AutomaticSize.XY
aD.BackgroundColor3=Color3.fromRGB(255,255,255)
aD.BackgroundTransparency=1
aD.BorderColor3=Color3.fromRGB(0,0,0)
aD.BorderSizePixel=0
aD.LayoutOrder=1
aD.Parent=az
aD.Size=UDim2.fromScale(1,0)

az.Parent=ao

ao.Parent=an

local aE=Instance.new"UIPadding"
aE.Name="UserInfoUIPadding"
aE.PaddingLeft=UDim.new(0,0)
aE.PaddingRight=UDim.new(0,0)
aE.Parent=an

an.Parent=am

local aF=Instance.new"UIPadding"
aF.Name="SidebarGroupUIPadding"
aF.PaddingLeft=UDim.new(0,10)
aF.PaddingRight=UDim.new(0,10)
aF.PaddingTop=UDim.new(0,5)
aF.Parent=am

local aG=Instance.new"Frame"
aG.Name="TabSwitchers"
aG.BackgroundColor3=Color3.fromRGB(255,255,255)
aG.BackgroundTransparency=1
aG.BorderColor3=Color3.fromRGB(0,0,0)
aG.BorderSizePixel=0
aG.Size=UDim2.new(1,0,1,-10)
aG.ClipsDescendants=false

local aH=Instance.new"ScrollingFrame"
aH.Name="TabSwitchersScrollingFrame"
aH.AutomaticCanvasSize=Enum.AutomaticSize.Y
aH.BottomImage="rbxasset://textures/ui/Scroll/scroll-bottom.png"
aH.CanvasSize=UDim2.new()
aH.MidImage="rbxasset://textures/ui/Scroll/scroll-middle.png"
aH.ScrollBarImageColor3=Color3.fromRGB(90,80,115)
aH.ScrollBarImageTransparency=0.4
aH.ScrollBarThickness=6
aH.TopImage="rbxasset://textures/ui/Scroll/scroll-top.png"
aH.BackgroundColor3=Color3.fromRGB(255,255,255)
aH.BackgroundTransparency=1
aH.BorderColor3=Color3.fromRGB(0,0,0)
aH.BorderSizePixel=0
aH.Size=UDim2.fromScale(1,1.03)
aH.ClipsDescendants=true

local aI=Instance.new"UIListLayout"
aI.Name="TabSwitchersScrollingFrameUIListLayout"
aI.Padding=UDim.new(0,13)
aI.SortOrder=Enum.SortOrder.LayoutOrder
aI.Parent=aH

local aJ=Instance.new"UIPadding"
aJ.Name="TabSwitchersScrollingFrameUIPadding"
aJ.PaddingTop=UDim.new(0,1)
aJ.PaddingLeft=UDim.new(0,3)
aJ.PaddingRight=UDim.new(0,7)
aJ.Parent=aH

aH.Parent=aG

aG.Parent=am

am.Parent=L

L.Parent=D

local aK=Instance.new"Frame"
aK.Name="Content"
aK.AnchorPoint=Vector2.new(1,0)
aK.BackgroundColor3=Color3.fromRGB(255,255,255)
aK.BackgroundTransparency=1
aK.BorderColor3=Color3.fromRGB(0,0,0)
aK.BorderSizePixel=0
aK.Position=UDim2.fromScale(1,4.69e-08)
aK.Size=UDim2.new(0,(D.AbsoluteSize.X-L.AbsoluteSize.X),1,0)

local aL=false
local aM=L.AbsoluteSize.X
local aN,aO
local aP=20
local aQ=107
local aR=D.AbsoluteSize.X-aQ

local aS={
DefaultTransparency=0.9,
HoverTransparency=0.85,

EasingStyle=Enum.EasingStyle.Sine
}

local function ChangeState(aT)
Tween(O,TweenInfo.new(0.2,aS.EasingStyle),{
BackgroundTransparency=aT=="Idle"and aS.DefaultTransparency or aS.HoverTransparency
}):Play()
end

P.MouseEnter:Connect(function()
ChangeState"Hover"
end)
P.MouseLeave:Connect(function()
ChangeState"Idle"
end)

P.MouseButton1Down:Connect(function()
aL=true
aN=f:GetMouseLocation().X
aO=L.AbsoluteSize.X
end)

f.InputEnded:Connect(function(aT)
if aT.UserInputType==Enum.UserInputType.MouseButton1 then
aL=false
end
end)

f.InputChanged:Connect(function(aT)
if aL and aT.UserInputType==Enum.UserInputType.MouseMovement then
local aU=f:GetMouseLocation().X-aN
local aV=aO+aU

if math.abs(aV-aM)<aP then
aV=aM
else
aV=math.clamp(aV,aQ,aR)
end

L.Size=UDim2.new(0,aV,1,0)
aK.Size=UDim2.new(0,D.AbsoluteSize.X-aV,1,0)
end
end)

local aT=Instance.new"Frame"
aT.Name="Topbar"
aT.BackgroundColor3=Color3.fromRGB(255,255,255)
aT.BackgroundTransparency=1
aT.BorderColor3=Color3.fromRGB(0,0,0)
aT.BorderSizePixel=0
aT.Size=UDim2.new(1,0,0,50)

local aU=Instance.new"Frame"
aU.Name="Divider"
aU.AnchorPoint=Vector2.new(0,1)
aU.BackgroundColor3=Color3.fromRGB(255,255,255)
aU.BackgroundTransparency=0.9
aU.BorderColor3=Color3.fromRGB(0,0,0)
aU.BorderSizePixel=0
aU.Position=UDim2.fromScale(0,1)
aU.Size=UDim2.new(1,0,0,1)
aU.Parent=aT

local aV=Instance.new"Frame"
aV.Name="Elements"
aV.BackgroundColor3=Color3.fromRGB(255,255,255)
aV.BackgroundTransparency=1
aV.BorderColor3=Color3.fromRGB(0,0,0)
aV.BorderSizePixel=0
aV.Size=UDim2.fromScale(1,1)

local aW=Instance.new"UIPadding"
aW.Name="UIPadding"
aW.PaddingLeft=UDim.new(0,20)
aW.PaddingRight=UDim.new(0,20)
aW.Parent=aV

local aX=Instance.new"ImageButton"
aX.Name="MoveIcon"
aX.Image=q.transform
aX.ImageTransparency=0.7
aX.AnchorPoint=Vector2.new(1,0.5)
aX.BackgroundColor3=Color3.fromRGB(255,255,255)
aX.BackgroundTransparency=1
aX.BorderColor3=Color3.fromRGB(0,0,0)
aX.BorderSizePixel=0
aX.Position=UDim2.fromScale(1,0.5)
aX.Size=UDim2.fromOffset(15,15)
aX.Parent=aV
aX.Visible=true

local aY=Instance.new"TextButton"
aY.Name="Interact"
aY.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
aY.Text=""
aY.TextColor3=Color3.fromRGB(0,0,0)
aY.TextSize=14
aY.AnchorPoint=Vector2.new(0.5,0.5)
aY.BackgroundColor3=Color3.fromRGB(255,255,255)
aY.BackgroundTransparency=1
aY.BorderColor3=Color3.fromRGB(0,0,0)
aY.BorderSizePixel=0
aY.Position=UDim2.fromScale(0.5,0.5)
aY.Size=UDim2.fromOffset(40,40)
aY.Parent=aX

local function ChangemoveIconState(aZ)
if aZ=="Default"then
Tween(aX,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.7
}):Play()
elseif aZ=="Hover"then
Tween(aX,TweenInfo.new(0.2,Enum.EasingStyle.Sine),{
ImageTransparency=0.4
}):Play()
end
end

aY.MouseEnter:Connect(function()
ChangemoveIconState"Hover"
end)
aY.MouseLeave:Connect(function()
ChangemoveIconState"Default"
end)

local aZ=false
local a_
local a0
local a1

local function update(a2)
local a3=a2.Position-a0
D.Position=UDim2.new(a1.X.Scale,a1.X.Offset+a3.X,a1.Y.Scale,a1.Y.Offset+a3.Y)
end

local function onDragStart(a2)
if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then
aZ=true
a0=a2.Position
a1=D.Position

a2.Changed:Connect(function()
if a2.UserInputState==Enum.UserInputState.End then
aZ=false
end
end)
end
end

local function onDragUpdate(a2)
if aZ and(a2.UserInputType==Enum.UserInputType.MouseMovement or a2.UserInputType==Enum.UserInputType.Touch)then
a_=a2
end
end

aY.InputBegan:Connect(function(a2)
if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then
onDragStart(a2)
end
end)

aY.InputChanged:Connect(onDragUpdate)

f.InputChanged:Connect(function(a2)
if a2==a_ and aZ then
update(a2)
end
end)

aY.InputEnded:Connect(function(a2)
if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then
aZ=false
end
end)

if not u.DragStyle or u.DragStyle==1 then
aY.InputBegan:Connect(function(a2)
if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then
onDragStart(a2)
end
end)

aY.InputChanged:Connect(onDragUpdate)

f.InputChanged:Connect(function(a2)
if a2==a_ and aZ then
update(a2)
end
end)

aY.InputEnded:Connect(function(a2)
if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then
aZ=false
end
end)
elseif u.DragStyle==2 then
D.InputBegan:Connect(function(a2)
if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then
onDragStart(a2)
end
end)

D.InputChanged:Connect(onDragUpdate)

f.InputChanged:Connect(function(a2)
if a2==a_ and aZ then
update(a2)
end
end)

D.InputEnded:Connect(function(a2)
if a2.UserInputType==Enum.UserInputType.MouseButton1 or a2.UserInputType==Enum.UserInputType.Touch then
aZ=false
end
end)
end

local a2=Instance.new"TextLabel"
a2.Name="CurrentTab"
a2.FontFace=Font.new(q.interFont)
a2.RichText=true
a2.Text=""
a2.RichText=true
a2.TextColor3=Color3.fromRGB(255,255,255)
a2.TextSize=15
a2.TextTransparency=0.5
a2.TextTruncate=Enum.TextTruncate.SplitWord
a2.TextXAlignment=Enum.TextXAlignment.Left
a2.TextYAlignment=Enum.TextYAlignment.Top
a2.AnchorPoint=Vector2.new(0,0.5)
a2.AutomaticSize=Enum.AutomaticSize.Y
a2.BackgroundColor3=Color3.fromRGB(255,255,255)
a2.BackgroundTransparency=1
a2.BorderColor3=Color3.fromRGB(0,0,0)
a2.BorderSizePixel=0
a2.Position=UDim2.fromScale(0,0.5)
a2.Size=UDim2.fromScale(0.9,0)
a2.Parent=aV

aV.Parent=aT

aT.Parent=aK

aK.Parent=D

local a3=Instance.new"Frame"
a3.Name="GlobalSettings"
a3.AutomaticSize=Enum.AutomaticSize.XY
a3.BackgroundColor3=Color3.fromRGB(35,33,44)
a3.BackgroundTransparency=0.08
a3.BorderColor3=Color3.fromRGB(0,0,0)
a3.BorderSizePixel=0
a3.Position=UDim2.fromScale(0.298,0.104)

local a4=Instance.new"UIGradient"
a4.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(22,22,22)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(35,33,44)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(24,22,30)),
}
a4.Rotation=135
a4.Parent=a3

local a5=Instance.new"UIStroke"
a5.Name="GlobalSettingsUIStroke"
a5.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
a5.Color=Color3.fromRGB(65,62,75)
a5.Transparency=0.65
a5.Thickness=1.2
a5.Parent=a3

local a6=Instance.new"UICorner"
a6.Name="GlobalSettingsUICorner"
a6.CornerRadius=UDim.new(0,14)
a6.Parent=a3

local a7=Instance.new"UIPadding"
a7.Name="GlobalSettingsUIPadding"
a7.PaddingBottom=UDim.new(0,12)
a7.PaddingTop=UDim.new(0,12)
a7.PaddingLeft=UDim.new(0,4)
a7.PaddingRight=UDim.new(0,4)
a7.Parent=a3

local a8=Instance.new"UIListLayout"
a8.Name="GlobalSettingsUIListLayout"
a8.Padding=UDim.new(0,2)
a8.SortOrder=Enum.SortOrder.LayoutOrder
a8.Parent=a3

local a9=Instance.new"UIScale"
a9.Name="GlobalSettingsUIScale"
a9.Scale=1e-07
a9.Parent=a3
a3.Parent=D


local ba=Instance.new"TextButton"
ba.Name="ResizeHandle"
ba.AnchorPoint=Vector2.new(1,1)
ba.Position=UDim2.new(1,-6,1,-6)
ba.Size=UDim2.fromOffset(24,24)
ba.BackgroundTransparency=1
ba.Text=""
ba.ZIndex=1000
ba.Parent=D


local bb=Instance.new"ImageLabel"
bb.Name="ResizeIcon"
bb.AnchorPoint=Vector2.new(0.5,0.5)
bb.Position=UDim2.fromScale(0.5,0.5)
bb.Size=UDim2.fromOffset(16,16)
bb.BackgroundTransparency=1
bb.ImageColor3=Color3.fromRGB(150,150,160)
bb.ImageTransparency=0.5
bb.Parent=ba


local bc=Icon"scaling"or Icon"maximize-2"or Icon"expand"
if bc then
bb.Image=bc[1]
if bc[2]then
bb.ImageRectOffset=bc[2].ImageRectPosition or Vector2.zero
bb.ImageRectSize=bc[2].ImageRectSize or Vector2.zero
end
end


local bd=false
local be,bf

ba.MouseEnter:Connect(function()
Tween(bb,TweenInfo.new(0.15,Enum.EasingStyle.Quint),{
ImageTransparency=0.2,
ImageColor3=Color3.fromRGB(200,200,210)
}):Play()
end)

ba.MouseLeave:Connect(function()
if not bd then
Tween(bb,TweenInfo.new(0.15,Enum.EasingStyle.Quint),{
ImageTransparency=0.5,
ImageColor3=Color3.fromRGB(150,150,160)
}):Play()
end
end)

ba.MouseButton1Down:Connect(function()
bd=true
be=f:GetMouseLocation()
bf=D.AbsoluteSize
end)

f.InputEnded:Connect(function(bg)
if bg.UserInputType==Enum.UserInputType.MouseButton1 then
if bd then
bd=false
Tween(bb,TweenInfo.new(0.15,Enum.EasingStyle.Quint),{
ImageTransparency=0.5,
ImageColor3=Color3.fromRGB(150,150,160)
}):Play()
end
end
end)

f.InputChanged:Connect(function(bg)
if bd and bg.UserInputType==Enum.UserInputType.MouseMovement then
local bh=f:GetMouseLocation()
local bi=bh-be


local bj=423
local bk=285

local bl=math.max(bj,bf.X+bi.X)
local bm=math.max(bk,bf.Y+bi.Y)

D.Size=UDim2.fromOffset(bl,bm)


if aK and L then
aK.Size=UDim2.new(0,(D.AbsoluteSize.X-L.AbsoluteSize.X),1,0)
end
end
end)

D.Parent=w

spawn(function()
playBootAnimation()
end)

function v.UpdateTitle(bg,bh)
aj.Text=bh
end

function v.UpdateSubtitle(bg,bh)
ak.Text=bh
end

local bg
local bh=a9.Scale==1 and true or false
local function toggle()
if not bh then
local bi=Tween(a9,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Scale=1
})
bi:Play()
bi.Completed:Wait()
bh=true
elseif bh then
local bi=Tween(a9,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Scale=0
})
bi:Play()
bi.Completed:Wait()
bh=false
end
end
ah.MouseButton1Click:Connect(function()
if not l then return end
toggle()
end)
a3.MouseEnter:Connect(function()
bg=true
end)
a3.MouseLeave:Connect(function()
bg=false
end)
f.InputEnded:Connect(function(bi)
if bi.UserInputType==Enum.UserInputType.MouseButton1 and bh and not bg then
toggle()
end
end)

function v.GlobalSetting(bi,bj)
l=true
local bk={}
local bl=Instance.new"TextButton"
bl.Name="GlobalSetting"
bl.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
bl.Text=""
bl.TextColor3=Color3.fromRGB(0,0,0)
bl.TextSize=14
bl.BackgroundColor3=Color3.fromRGB(255,255,255)
bl.BackgroundTransparency=1
bl.BorderColor3=Color3.fromRGB(0,0,0)
bl.BorderSizePixel=0
bl.Size=UDim2.fromOffset(200,30)

local bm=Instance.new"UIPadding"
bm.Name="GlobalSettingToggleUIPadding"
bm.PaddingLeft=UDim.new(0,15)
bm.Parent=bl

local bn=Instance.new"TextLabel"
bn.Name="SettingName"
bn.FontFace=Font.new(q.interFont)
bn.Text=bj.Name
bn.RichText=true
bn.TextColor3=Color3.fromRGB(255,255,255)
bn.TextSize=13
bn.TextTransparency=0.5
bn.TextTruncate=Enum.TextTruncate.SplitWord
bn.TextXAlignment=Enum.TextXAlignment.Left
bn.TextYAlignment=Enum.TextYAlignment.Top
bn.AnchorPoint=Vector2.new(0,0.5)
bn.AutomaticSize=Enum.AutomaticSize.Y
bn.BackgroundColor3=Color3.fromRGB(255,255,255)
bn.BackgroundTransparency=1
bn.BorderColor3=Color3.fromRGB(0,0,0)
bn.BorderSizePixel=0
bn.Position=UDim2.fromScale(1.3e-07,0.5)
bn.Size=UDim2.new(1,-40,0,0)
bn.Parent=bl

local bo=Instance.new"UIListLayout"
bo.Name="GlobalSettingToggleUIListLayout"
bo.Padding=UDim.new(0,10)
bo.FillDirection=Enum.FillDirection.Horizontal
bo.SortOrder=Enum.SortOrder.LayoutOrder
bo.VerticalAlignment=Enum.VerticalAlignment.Center
bo.Parent=bl

local bp=Instance.new"TextLabel"
bp.Name="Checkmark"
bp.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
bp.Text="✓"
bp.TextColor3=Color3.fromRGB(255,255,255)
bp.TextSize=13
bp.TextTransparency=1
bp.TextXAlignment=Enum.TextXAlignment.Left
bp.TextYAlignment=Enum.TextYAlignment.Top
bp.AnchorPoint=Vector2.new(0,0.5)
bp.AutomaticSize=Enum.AutomaticSize.Y
bp.BackgroundColor3=Color3.fromRGB(255,255,255)
bp.BackgroundTransparency=1
bp.BorderColor3=Color3.fromRGB(0,0,0)
bp.BorderSizePixel=0
bp.LayoutOrder=-1
bp.Position=UDim2.fromScale(1.3e-07,0.5)
bp.Size=UDim2.fromOffset(-10,0)
bp.Parent=bl

bl.Parent=a3

local bq={
duration=0.2,
easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,
transparencyOut=0.5,
checkSizeIncrease=12,
checkSizeDecrease=-bo.Padding.Offset,
waitTime=1
}

local br={
checkIn=Tween(bp,TweenInfo.new(bq.duration,bq.easingStyle),{
Size=UDim2.new(bp.Size.X.Scale,bq.checkSizeIncrease,bp.Size.Y.Scale,bp.Size.Y.Offset)
}),
checkOut=Tween(bp,TweenInfo.new(bq.duration,bq.easingStyle),{
Size=UDim2.new(bp.Size.X.Scale,bq.checkSizeDecrease,bp.Size.Y.Scale,bp.Size.Y.Offset)
}),
nameIn=Tween(bn,TweenInfo.new(bq.duration,bq.easingStyle),{
TextTransparency=bq.transparencyIn
}),
nameOut=Tween(bn,TweenInfo.new(bq.duration,bq.easingStyle),{
TextTransparency=bq.transparencyOut
})
}

local function Toggle(bs)
if not bs then
br.checkOut:Play()
br.nameOut:Play()
bp:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
if bp.AbsoluteSize.X<=0 then
bp.TextTransparency=1
end
end)
else
br.checkIn:Play()
br.nameIn:Play()
bp:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
if bp.AbsoluteSize.X>0 then
bp.TextTransparency=0
end
end)
end
end

local bs=bj.Default
Toggle(bs)

bl.MouseButton1Click:Connect(function()
bs=not bs
Toggle(bs)

task.spawn(function()
if bj.Callback then
bj.Callback(bs)
end
end)
end)

function bk.UpdateName(bt,bu)
bn.Text=bu
end

function bk.UpdateState(bt,bu)
Toggle(bu)
bs=bu
end

return bk
end

function v.GlobalButton(bi,bj)
l=true
local bk={Settings=bj}

local bl=Instance.new"TextButton"
bl.Name="GlobalButton"
bl.FontFace=Font.new(q.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)
bl.Text=bj.Name
bl.RichText=true
bl.TextColor3=Color3.fromRGB(255,255,255)
bl.TextSize=13
bl.TextTransparency=0
bl.TextXAlignment=Enum.TextXAlignment.Center
bl.AutoButtonColor=false
bl.BackgroundColor3=Color3.fromRGB(82,82,91)
bl.BackgroundTransparency=0
bl.BorderColor3=Color3.fromRGB(0,0,0)
bl.BorderSizePixel=0
bl.Size=UDim2.fromOffset(200,32)
bl.Parent=a3

local bm=Instance.new"UICorner"
bm.Name="GlobalButtonUICorner"
bm.CornerRadius=UDim.new(0,8)
bm.Parent=bl

local bn=Instance.new"UIStroke"
bn.Name="GlobalButtonUIStroke"
bn.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
bn.Color=Color3.fromRGB(90,80,115)
bn.Transparency=0.6
bn.Thickness=1
bn.Parent=bl

local bo={
DefaultColor=Color3.fromRGB(82,82,91),
HoverColor=Color3.fromRGB(90,80,115),
PressColor=Color3.fromRGB(63,63,70),
EasingStyle=Enum.EasingStyle.Quint
}

local function ChangeState(bp)
if bp=="Idle"then
Tween(bl,TweenInfo.new(0.2,bo.EasingStyle),{
BackgroundColor3=bo.DefaultColor
}):Play()
elseif bp=="Hover"then
Tween(bl,TweenInfo.new(0.2,bo.EasingStyle),{
BackgroundColor3=bo.HoverColor
}):Play()
elseif bp=="Press"then
Tween(bl,TweenInfo.new(0.1,bo.EasingStyle),{
BackgroundColor3=bo.PressColor
}):Play()
end
end

bl.MouseEnter:Connect(function()
ChangeState"Hover"
end)
bl.MouseLeave:Connect(function()
ChangeState"Idle"
end)
bl.MouseButton1Down:Connect(function()
ChangeState"Press"
end)
bl.MouseButton1Up:Connect(function()
ChangeState"Hover"
end)

bl.MouseButton1Click:Connect(function()
task.spawn(function()
if bj.Callback then
bj.Callback()
end
end)
end)

function bk.UpdateName(bp,bq)
bl.Text=bq
end

return bk
end

function v.TabGroup(bi)
local bj={}

local bk=Instance.new"Frame"
bk.Name="Section"
bk.AutomaticSize=Enum.AutomaticSize.Y
bk.BackgroundColor3=Color3.fromRGB(255,255,255)
bk.BackgroundTransparency=1
bk.BorderColor3=Color3.fromRGB(0,0,0)
bk.BorderSizePixel=0
bk.Size=UDim2.fromScale(1,0)

local bl=Instance.new"Frame"
bl.Name="Divider"
bl.AnchorPoint=Vector2.new(0.5,1)
bl.BackgroundColor3=Color3.fromRGB(255,255,255)
bl.BackgroundTransparency=0.9
bl.BorderColor3=Color3.fromRGB(0,0,0)
bl.BorderSizePixel=0
bl.Position=UDim2.fromScale(0.5,1)
bl.Size=UDim2.new(1,-21,0,1)
bl.Parent=bk

local bm=Instance.new"Frame"
bm.Name="SectionTabSwitchers"
bm.BackgroundColor3=Color3.fromRGB(255,255,255)
bm.BackgroundTransparency=1
bm.BorderColor3=Color3.fromRGB(0,0,0)
bm.BorderSizePixel=0
bm.Size=UDim2.fromScale(1,1)

local bn=Instance.new"UIListLayout"
bn.Name="UIListLayout"
bn.Padding=UDim.new(0,7)
bn.HorizontalAlignment=Enum.HorizontalAlignment.Center
bn.SortOrder=Enum.SortOrder.LayoutOrder
bn.Parent=bm

local bo=Instance.new"UIPadding"
bo.Name="UIPadding"
bo.PaddingBottom=UDim.new(0,15)
bo.Parent=bm

bm.Parent=bk
bk.Parent=aH

function bj.Tab(bp,bq)
local br={Settings=bq}
local bs=Instance.new"TextButton"
bs.Name="TabSwitcher"
bs.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
bs.Text=""
bs.TextColor3=Color3.fromRGB(0,0,0)
bs.TextSize=14
bs.AutoButtonColor=false
bs.AnchorPoint=Vector2.new(0.5,0)
bs.BackgroundColor3=Color3.fromRGB(62,56,78)
bs.BackgroundTransparency=1
bs.BorderColor3=Color3.fromRGB(0,0,0)
bs.BorderSizePixel=0
bs.Position=UDim2.fromScale(0.5,0)
bs.Size=UDim2.new(1,0,0,34)
o+=1
bs.LayoutOrder=o

local bt=Instance.new"UICorner"
bt.Name="TabSwitcherUICorner"
bt.CornerRadius=UDim.new(0,10)
bt.Parent=bs

local bu=Instance.new"UIStroke"
bu.Name="TabSwitcherUIStroke"
bu.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
bu.Color=Color3.fromRGB(62,56,78)
bu.Transparency=1
bu.Thickness=1
bu.Parent=bs

local bv=Instance.new"UIListLayout"
bv.Name="TabSwitcherUIListLayout"
bv.Padding=UDim.new(0,9)
bv.FillDirection=Enum.FillDirection.Horizontal
bv.SortOrder=Enum.SortOrder.LayoutOrder
bv.VerticalAlignment=Enum.VerticalAlignment.Center
bv.Parent=bs

local bw

if bq.Image and Icon(bq.Image)then
local bx=Icon(bq.Image)

local by=Instance.new"ImageLabel"
by.Name="TabImage"
by.ImageTransparency=0.4
by.Image=bx[1]
by.ImageRectOffset=bx[2]and bx[2].ImageRectPosition or Vector2.zero
by.ImageRectSize=bx[2]and bx[2].ImageRectSize or Vector2.zero
by.Size=UDim2.new(0,18,0,18)
by.LayoutOrder=1
by.BackgroundTransparency=1
by.BackgroundColor3=Color3.fromRGB(255,255,255)
by.BorderSizePixel=0
by.Parent=bs
elseif bq.Image and string.find(bq.Image,"rbxassetid://")then
local bx=Instance.new"ImageLabel"
bx.Name="TabImage"
bx.ImageTransparency=0.4
bx.Image=bq.Image
bx.Size=UDim2.new(0,18,0,18)
bx.LayoutOrder=1
bx.BackgroundTransparency=1
bx.BackgroundColor3=Color3.fromRGB(255,255,255)
bx.BorderSizePixel=0
bx.Parent=bs
end

local bx=Instance.new"TextLabel"
bx.Name="TabSwitcherName"
bx.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
bx.TextWrapped=true
bx.Text=bq.Name
bx.RichText=true
bx.TextColor3=Color3.fromRGB(240,240,240)
bx.TextSize=15
bx.TextTransparency=0.4
bx.TextXAlignment=Enum.TextXAlignment.Left
bx.TextYAlignment=Enum.TextYAlignment.Top
bx.AutomaticSize=Enum.AutomaticSize.Y
bx.BackgroundColor3=Color3.fromRGB(255,255,255)
bx.BackgroundTransparency=1
bx.BorderColor3=Color3.fromRGB(0,0,0)
bx.BorderSizePixel=0
bx.Size=UDim2.fromScale(1,0)
bx.Parent=bs
bx.LayoutOrder=1

local by=Instance.new"UIPadding"
by.Name="TabSwitcherUIPadding"
by.PaddingLeft=UDim.new(0,10)
by.PaddingRight=UDim.new(0,35)
by.PaddingTop=UDim.new(0,2)
by.Parent=bs

bs.Parent=bm

local bz=Instance.new"Frame"
bz.Name="Elements"
bz.BackgroundColor3=Color3.fromRGB(255,255,255)
bz.BackgroundTransparency=1
bz.BorderColor3=Color3.fromRGB(0,0,0)
bz.BorderSizePixel=0
bz.Position=UDim2.fromOffset(0,50)
bz.Size=UDim2.new(1,0,1,-50)
bz.ClipsDescendants=true

local bA=Instance.new"UIPadding"
bA.Name="ElementsUIPadding"
bA.PaddingRight=UDim.new(0,0)
bA.PaddingTop=UDim.new(0,10)
bA.PaddingBottom=UDim.new(0,10)
bA.Parent=bz

local bB=Instance.new"ScrollingFrame"
bB.Name="ElementsScrolling"
bB.AutomaticCanvasSize=Enum.AutomaticSize.Y
bB.BottomImage="rbxasset://textures/ui/Scroll/scroll-bottom.png"
bB.CanvasSize=UDim2.new()
bB.MidImage="rbxasset://textures/ui/Scroll/scroll-middle.png"
bB.ScrollBarImageColor3=Color3.fromRGB(90,80,115)
bB.ScrollBarImageTransparency=0.4
bB.ScrollBarThickness=6
bB.TopImage="rbxasset://textures/ui/Scroll/scroll-top.png"
bB.BackgroundColor3=Color3.fromRGB(255,255,255)
bB.BackgroundTransparency=1
bB.BorderColor3=Color3.fromRGB(0,0,0)
bB.BorderSizePixel=0
bB.Size=UDim2.fromScale(1,1)
bB.ClipsDescendants=false

local bC=Instance.new"UIPadding"
bC.Name="ElementsScrollingUIPadding"
bC.PaddingBottom=UDim.new(0,5)
bC.PaddingLeft=UDim.new(0,11)
bC.PaddingRight=UDim.new(0,10)
bC.PaddingTop=UDim.new(0,5)
bC.Parent=bB

local bD=Instance.new"UIListLayout"
bD.Name="ElementsScrollingUIListLayout"
bD.Padding=UDim.new(0,15)
bD.FillDirection=Enum.FillDirection.Horizontal
bD.SortOrder=Enum.SortOrder.LayoutOrder
bD.Parent=bB

local bE=Instance.new"Frame"
bE.Name="HBGail"
bE.AutomaticSize=Enum.AutomaticSize.Y
bE.BackgroundColor3=Color3.fromRGB(0,0,0)
bE.BackgroundTransparency=1
bE.BorderColor3=Color3.fromRGB(0,0,0)
bE.BorderSizePixel=0
bE.Position=UDim2.fromScale(0.512,0)
bE.Size=UDim2.new(1,0,0,0)

local bF=Instance.new"UIListLayout"
bF.Name="LeftUIListLayout"
bF.Padding=UDim.new(0,15)
bF.SortOrder=Enum.SortOrder.LayoutOrder
bF.Parent=bE

bE.Parent=bB

bB.Parent=bz

function br.Section(bG,bH)
local bI={}
local bJ=Instance.new"Frame"
bJ.Name="Section"
bJ.AutomaticSize=Enum.AutomaticSize.Y
bJ.BackgroundColor3=Color3.fromRGB(26,24,34)
bJ.BackgroundTransparency=0.35
bJ.BorderColor3=Color3.fromRGB(0,0,0)
bJ.BorderSizePixel=0
bJ.Position=UDim2.fromScale(0,6.78e-08)
bJ.Size=UDim2.fromScale(1,0)
bJ.ClipsDescendants=true
bJ.Parent=bE

local bK=Instance.new"UICorner"
bK.Name="SectionUICorner"
bK.CornerRadius=UDim.new(0,16)
bK.Parent=bJ

local bL=Instance.new"UIStroke"
bL.Name="SectionUIStroke"
bL.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
bL.Color=Color3.fromRGB(75,70,95)
bL.Transparency=0.65
bL.Thickness=1
bL.Parent=bJ

local bM=Instance.new"UIListLayout"
bM.Name="SectionUIListLayout"
bM.Padding=UDim.new(0,14)
bM.SortOrder=Enum.SortOrder.LayoutOrder
bM.Parent=bJ

local bN=Instance.new"UIPadding"
bN.Name="SectionUIPadding"
bN.PaddingBottom=UDim.new(0,24)
bN.PaddingLeft=UDim.new(0,24)
bN.PaddingRight=UDim.new(0,24)
bN.PaddingTop=UDim.new(0,22)
bN.Parent=bJ

local bO=false
local bP
local bQ
local bR
local bS

local bT={down=nil,up=nil}
bT.down=Icon"arrow-down"or Icon"chevron-down"
bT.up=Icon"arrow-up"or Icon"chevron-up"

local function applyCollapseIcon()
if bQ then
local bU=bO and bT.down or bT.up
if bU then
bQ.Image=bU[1]
if bU[2]then
bQ.ImageRectOffset=bU[2].ImageRectPosition or Vector2.zero
bQ.ImageRectSize=bU[2].ImageRectSize or Vector2.zero
else
bQ.ImageRectOffset=Vector2.zero
bQ.ImageRectSize=Vector2.zero
end
bQ.ImageTransparency=0.1
bQ.Visible=true
if bR then
bR.Visible=false
end
else
bQ.Visible=false
if bR then
bR.Visible=true
bR.Text=bO and"▼"or"▲"
end
end
elseif bR then
bR.Text=bO and"▼"or"▲"
end
end

local function updateSectionChildren()
for bU,bV in ipairs(bJ:GetChildren())do
if bV~=bP and bV:IsA"GuiObject"then
bV.Visible=not bO
end
end
end

local function setCollapsed(bU)
bO=bU
bJ:SetAttribute("Collapsed",bU)
updateSectionChildren()
applyCollapseIcon()
end

bJ:SetAttribute("Collapsed",bO)

bJ.ChildAdded:Connect(function(bU)
if bU~=bP and bU:IsA"GuiObject"then
bU.Visible=not bO
end
end)

function bI.Button(bU,bV,bW)
local bX={Settings=bV}
local bY=Instance.new"Frame"
bY.Name="Button"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,44)
bY.Parent=bJ

local bZ=Instance.new"TextButton"
bZ.Name="ButtonInteract"
bZ.FontFace=Font.new(q.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)
bZ.RichText=true
bZ.TextColor3=Color3.fromRGB(255,255,255)
bZ.TextSize=14.5
bZ.TextTransparency=0
bZ.TextXAlignment=Enum.TextXAlignment.Center
bZ.BackgroundColor3=Color3.fromRGB(50,46,65)
bZ.BackgroundTransparency=0.2
bZ.TextStrokeTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Size=UDim2.new(1,0,1,0)
bZ.ClipsDescendants=false
bZ.AutoButtonColor=false
bZ.Parent=bY
bZ.Text=bX.Settings.Name


local b_=Instance.new"UICorner"
b_.CornerRadius=UDim.new(0,10)
b_.Parent=bZ


local b0=Instance.new"UIStroke"
b0.Color=Color3.fromRGB(75,70,95)
b0.Transparency=0.6
b0.Thickness=1
b0.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
b0.Parent=bZ

local b1=Instance.new"ImageLabel"
b1.Name="ButtonImage"
b1.Image=q.buttonImage
b1.ImageTransparency=0.3
b1.ImageColor3=Color3.fromRGB(250,250,250)
b1.AnchorPoint=Vector2.new(1,0.5)
b1.BackgroundColor3=Color3.fromRGB(255,255,255)
b1.BackgroundTransparency=1
b1.BorderColor3=Color3.fromRGB(0,0,0)
b1.BorderSizePixel=0
b1.Position=UDim2.new(1,-8,0.5,0)
b1.Size=UDim2.fromOffset(16,16)
b1.Parent=bZ

local b2={
DefaultColor=Color3.fromRGB(50,46,65),
HoverColor=Color3.fromRGB(62,56,78),
PressColor=Color3.fromRGB(40,36,52),

EasingStyle=Enum.EasingStyle.Quint
}

local function ChangeState(b3)
if b3=="Idle"then
Tween(bZ,TweenInfo.new(0.2,b2.EasingStyle),{
BackgroundColor3=b2.DefaultColor
}):Play()
elseif b3=="Hover"then
Tween(bZ,TweenInfo.new(0.2,b2.EasingStyle),{
BackgroundColor3=b2.HoverColor
}):Play()
elseif b3=="Press"then
Tween(bZ,TweenInfo.new(0.1,b2.EasingStyle),{
BackgroundColor3=b2.PressColor
}):Play()
end
end

local function Callback()
if bX.Settings.Callback then
bX.Settings.Callback()
end
end

bZ.MouseEnter:Connect(function()
ChangeState"Hover"
end)
bZ.MouseLeave:Connect(function()
ChangeState"Idle"
end)
bZ.MouseButton1Down:Connect(function()
ChangeState"Press"
end)
bZ.MouseButton1Up:Connect(function()
ChangeState"Hover"
end)

bZ.MouseButton1Click:Connect(Callback)
function bX.UpdateName(b3,b4)
bZ.Text=b4
end
function bX.SetVisibility(b3,b4)
bY.Visible=b4
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Toggle(bU,bV,bW)
local bX={Settings=bV,IgnoreConfig=false,Class="Toggle"}
local bY=Instance.new"Frame"
bY.Name="Toggle"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,38)
bY.Parent=bJ

local bZ=Instance.new"TextLabel"
bZ.Name="ToggleName"
bZ.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
bZ.Text=bX.Settings.Name
bZ.RichText=true
bZ.TextColor3=Color3.fromRGB(240,240,240)
bZ.TextSize=14
bZ.TextTransparency=0.1
bZ.TextTruncate=Enum.TextTruncate.AtEnd
bZ.TextXAlignment=Enum.TextXAlignment.Left
bZ.TextYAlignment=Enum.TextYAlignment.Top
bZ.AnchorPoint=Vector2.new(0,0.5)
bZ.AutomaticSize=Enum.AutomaticSize.Y
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Position=UDim2.fromScale(0,0.5)
bZ.Size=UDim2.new(1,-50,0,0)
bZ.Parent=bY

local b_=Instance.new"TextButton"
b_.Name="Toggle"
b_.Text=""
b_.AutoButtonColor=false
b_.AnchorPoint=Vector2.new(1,0.5)
b_.BackgroundColor3=Color3.fromRGB(63,63,70)
b_.BackgroundTransparency=0
b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0
b_.Position=UDim2.fromScale(1,0.5)
b_.Size=UDim2.fromOffset(48,26)


local b0=Instance.new"UICorner"
b0.CornerRadius=UDim.new(1,0)
b0.Parent=b_


local b1=Instance.new"UIStroke"
b1.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
b1.LineJoinMode=Enum.LineJoinMode.Round
b1.Color=Color3.fromRGB(90,80,115)
b1.Transparency=0.7
b1.Thickness=1
b1.Parent=b_

local b2=Instance.new"UIPadding"
b2.Name="ToggleUIPadding"
b2.PaddingBottom=UDim.new(0,3)
b2.PaddingLeft=UDim.new(0,3)
b2.PaddingRight=UDim.new(0,3)
b2.PaddingTop=UDim.new(0,3)
b2.Parent=b_

local b3=Instance.new"Frame"
b3.Name="TogglerHead"
b3.BackgroundColor3=Color3.fromRGB(255,255,255)
b3.AnchorPoint=Vector2.new(0,0.5)
b3.BorderSizePixel=0
b3.Position=UDim2.new(0,0,0.5,0)
b3.Size=UDim2.fromOffset(20,20)
b3.ZIndex=2
b3.Parent=b_


local b4=Instance.new"UICorner"
b4.CornerRadius=UDim.new(1,0)
b4.Parent=b3


local b5=Instance.new"UIStroke"
b5.Color=Color3.fromRGB(0,0,0)
b5.Transparency=0.9
b5.Thickness=1
b5.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
b5.Parent=b3

b_.Parent=bY

local b6={
Enabled=Color3.fromRGB(168,85,247),
Disabled=Color3.fromRGB(63,63,70)
}
local b7={
Enabled=UDim2.new(1,0,0.5,0),
Disabled=UDim2.new(0,0,0.5,0)
}

local b8={
Info=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
}

local function ToggleState(b9)
local ca=b9 and b6.Enabled or b6.Disabled
local cb=b9 and b7.Enabled or b7.Disabled


local cc=b:Create(b_,b8.Info,{
BackgroundColor3=ca
})
cc:Play()


local cd=b:Create(b3,b8.Info,{
Position=cb,
AnchorPoint=b9 and Vector2.new(1,0.5)or Vector2.new(0,0.5)
})
cd:Play()

bX.State=b9
end

local b9=bX.Settings.Default
local function Toggle(ca)
if not ca then
b9=not b9
end
ToggleState(b9)
if bX.Settings.Callback then
bX.Settings.Callback(b9)
end
end

Toggle(true)

b_.MouseButton1Click:Connect(function()
Toggle()
end)

function bX.Toggle(ca)
Toggle()
end

function bX.UpdateState(ca,cb)
b9=cb
Toggle(true)
end

function bX.GetState(ca)
return b9
end

function bX.UpdateName(ca,cb)
bZ.Text=cb
end
function bX.SetVisibility(ca,cb)
bY.Visible=cb
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Slider(bU,bV,bW)
local bX={Settings=bV,IgnoreConfig=false,Class="Slider"}
local bY=Instance.new"Frame"
bY.Name="Slider"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,38)
bY.Parent=bJ

local bZ=Instance.new"TextLabel"
bZ.Name="SliderName"
bZ.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
bZ.Text=bX.Settings.Name
bZ.RichText=true
bZ.TextColor3=Color3.fromRGB(240,240,240)
bZ.TextSize=14
bZ.TextTransparency=0.1
bZ.TextTruncate=Enum.TextTruncate.AtEnd
bZ.TextXAlignment=Enum.TextXAlignment.Left
bZ.TextYAlignment=Enum.TextYAlignment.Top
bZ.AnchorPoint=Vector2.new(0,0.5)
bZ.AutomaticSize=Enum.AutomaticSize.XY
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Position=UDim2.fromScale(1.3e-07,0.5)
bZ.Parent=bY

local b_=Instance.new"Frame"
b_.Name="SliderElements"
b_.AnchorPoint=Vector2.new(1,0)
b_.BackgroundColor3=Color3.fromRGB(255,255,255)
b_.BackgroundTransparency=1
b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0
b_.Position=UDim2.fromScale(1,0)
b_.Size=UDim2.fromScale(1,1)

local b0=Instance.new"TextBox"
b0.Name="SliderValue"
b0.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
b0.TextColor3=Color3.fromRGB(250,250,250)
b0.TextSize=12
b0.TextTransparency=0

b0.BackgroundColor3=Color3.fromRGB(39,39,42)
b0.BackgroundTransparency=0
b0.BorderColor3=Color3.fromRGB(0,0,0)
b0.BorderSizePixel=0
b0.LayoutOrder=1
b0.Position=UDim2.fromScale(-7.89E-2,0.171)
b0.Size=UDim2.fromOffset(45,24)
b0.ClipsDescendants=true

local b1=Instance.new"UICorner"
b1.Name="SliderValueUICorner"
b1.CornerRadius=UDim.new(0,6)
b1.Parent=b0

local b2=Instance.new"UIStroke"
b2.Name="SliderValueUIStroke"
b2.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
b2.Color=Color3.fromRGB(82,82,91)
b2.Transparency=0.6
b2.Thickness=1
b2.Parent=b0

local b3=Instance.new"UIPadding"
b3.Name="SliderValueUIPadding"
b3.PaddingLeft=UDim.new(0,4)
b3.PaddingRight=UDim.new(0,4)
b3.Parent=b0

b0.Parent=b_

local b4=Instance.new"UIListLayout"
b4.Name="SliderElementsUIListLayout"
b4.Padding=UDim.new(0,20)
b4.FillDirection=Enum.FillDirection.Horizontal
b4.HorizontalAlignment=Enum.HorizontalAlignment.Right
b4.SortOrder=Enum.SortOrder.LayoutOrder
b4.VerticalAlignment=Enum.VerticalAlignment.Center
b4.Parent=b_

local b5=Instance.new"ImageLabel"
b5.Name="SliderBar"
b5.Image=q.sliderbar
b5.ImageColor3=Color3.fromRGB(63,63,70)
b5.BackgroundColor3=Color3.fromRGB(255,255,255)
b5.BackgroundTransparency=1
b5.BorderColor3=Color3.fromRGB(0,0,0)
b5.BorderSizePixel=0
b5.Position=UDim2.fromScale(0.219,0.457)
b5.Size=UDim2.fromOffset(123,4)

local b6=Instance.new"ImageButton"
b6.Name="SliderHead"
b6.Image=q.sliderhead
b6.ImageColor3=Color3.fromRGB(139,92,246)
b6.AnchorPoint=Vector2.new(0.5,0.5)
b6.BackgroundColor3=Color3.fromRGB(255,255,255)
b6.BackgroundTransparency=1
b6.BorderColor3=Color3.fromRGB(0,0,0)
b6.BorderSizePixel=0
b6.Position=UDim2.fromScale(1,0.5)
b6.Size=UDim2.fromOffset(14,14)
b6.Parent=b5

b5.Parent=b_

local b7=Instance.new"UIPadding"
b7.Name="SliderElementsUIPadding"
b7.PaddingTop=UDim.new(0,3)
b7.Parent=b_

b_.Parent=bY

local b8=false

local b9={
Hundredths=function(b9)
return string.format("%.2f",b9)
end,
Tenths=function(b9)
return string.format("%.1f",b9)
end,
Round=function(b9,ca)
if ca then
return string.format("%."..ca.."f",b9)
else
return tostring(math.round(b9))
end
end,
Degrees=function(b9,ca)
local cb=ca and string.format("%."..ca.."f",b9)or tostring(b9)
return cb.."°"
end,
Percent=function(b9,ca)
local cb=(b9-bX.Settings.Minimum)/(bX.Settings.Maximum-bX.Settings.Minimum)*100
return ca and string.format("%."..ca.."f",cb).."%"or tostring(math.round(cb)).."%"
end,
Value=function(b9,ca)
return ca and string.format("%."..ca.."f",b9)or tostring(b9)
end
}

local ca=b9[bX.Settings.DisplayMethod]or b9.Value
local cb

local function SetValue(cc,cd)
local ce

if typeof(cc)=="Instance"then
local cf=cc
ce=math.clamp((cf.Position.X-b5.AbsolutePosition.X)/b5.AbsoluteSize.X,0,1)
else
local cf=cc
ce=(cf-bX.Settings.Minimum)/(bX.Settings.Maximum-bV.Minimum)
end

local cf=UDim2.new(ce,0,0.5,0)
b6.Position=cf

cb=ce*(bX.Settings.Maximum-bX.Settings.Minimum)+bV.Minimum

b0.Text=(bV.Prefix or"")..ca(cb,bX.Settings.Precision)..(bV.Suffix or"")

if not cd then
task.spawn(function()
if bX.Settings.Callback then
bX.Settings.Callback(cb)
end
end)
end

bX.Value=cb
end

SetValue(bX.Settings.Default,true)

b6.InputBegan:Connect(function(cc)
if cc.UserInputType==Enum.UserInputType.MouseButton1 or cc.UserInputType==Enum.UserInputType.Touch then
b8=true
SetValue(cc)
end
end)

b6.InputEnded:Connect(function(cc)
if cc.UserInputType==Enum.UserInputType.MouseButton1 or cc.UserInputType==Enum.UserInputType.Touch then
b8=false
if bX.Settings.onInputComplete then
bX.Settings.onInputComplete(cb)
end
end
end)

b0.FocusLost:Connect(function(cc)
local cd=b0.Text
local ce,cf=cd:match"^(%-?%d+%.?%d*)(%%?)$"

if ce then
ce=tonumber(ce)
cf=cf=="%"

if cf then
ce=bX.Settings.Minimum+(ce/100)*(bX.Settings.Maximum-bX.Settings.Minimum)
end

local cg=math.clamp(ce,bX.Settings.Minimum,bX.Settings.Maximum)
SetValue(cg)
else
b0.Text=ca(b0)
end

if bX.Settings.onInputComplete then
bX.Settings.onInputComplete(cb)
end
end)

f.InputChanged:Connect(function(cc)
if b8 and(cc.UserInputType==Enum.UserInputType.MouseMovement or cc.UserInputType==Enum.UserInputType.Touch)then
SetValue(cc)
end
end)

local function updateSliderBarSize()
local cc=b4.Padding.Offset
local cd=b0.AbsoluteSize.X
local ce=bZ.AbsoluteSize.X
local cf=b_.AbsoluteSize.X

local cg=(cf-(cc+cd+ce+20))/I.Scale
b5.Size=UDim2.new(b5.Size.X.Scale,cg,b5.Size.Y.Scale,b5.Size.Y.Offset)
end

updateSliderBarSize()

bZ:GetPropertyChangedSignal"AbsoluteSize":Connect(updateSliderBarSize)
bJ:GetPropertyChangedSignal"AbsoluteSize":Connect(updateSliderBarSize)

function bX.UpdateName(cc,cd)
bZ=cd
end
function bX.SetVisibility(cc,cd)
bY.Visible=cd
end
function bX.UpdateValue(cc,cd)
SetValue(tonumber(cd))
end
function bX.GetValue(cc)
return cb
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Progress(bU,bV,bW)
local bX={Settings=bV,IgnoreConfig=false,Class="ProgressSlider"}
local bY=Instance.new"Frame"
bY.Name="Progress"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,38)
bY.Parent=bJ

local bZ=Instance.new"TextLabel"
bZ.Name="SliderName"
bZ.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
bZ.Text=bX.Settings.Name
bZ.RichText=true
bZ.TextColor3=Color3.fromRGB(240,240,240)
bZ.TextSize=14
bZ.TextTransparency=0.1
bZ.TextTruncate=Enum.TextTruncate.AtEnd
bZ.TextXAlignment=Enum.TextXAlignment.Left
bZ.TextYAlignment=Enum.TextYAlignment.Top
bZ.AnchorPoint=Vector2.new(0,0.5)
bZ.AutomaticSize=Enum.AutomaticSize.XY
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Position=UDim2.fromScale(1.3e-07,0.5)
bZ.Parent=bY

local b_=Instance.new"Frame"
b_.Name="SliderElements"
b_.AnchorPoint=Vector2.new(1,0)
b_.BackgroundColor3=Color3.fromRGB(255,255,255)
b_.BackgroundTransparency=1
b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0
b_.Position=UDim2.fromScale(1,0)
b_.Size=UDim2.fromScale(1,1)

local b0=Instance.new"TextBox"
b0.Name="SliderValue"
b0.FontFace=Font.new(q.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)
b0.TextColor3=Color3.fromRGB(255,255,255)
b0.TextSize=12
b0.TextTransparency=0.1
b0.BackgroundColor3=Color3.fromRGB(255,255,255)
b0.BackgroundTransparency=0.95
b0.BorderColor3=Color3.fromRGB(0,0,0)
b0.BorderSizePixel=0
b0.LayoutOrder=1
b0.Position=UDim2.fromScale(-7.89E-2,0.171)
b0.Size=UDim2.fromOffset(41,21)
b0.ClipsDescendants=true

local b1=Instance.new"UICorner"
b1.Name="SliderValueUICorner"
b1.CornerRadius=UDim.new(0,4)
b1.Parent=b0

local b2=Instance.new"UIStroke"
b2.Name="SliderValueUIStroke"
b2.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
b2.Color=Color3.fromRGB(255,255,255)
b2.Transparency=0.9
b2.Parent=b0

local b3=Instance.new"UIPadding"
b3.Name="SliderValueUIPadding"
b3.PaddingLeft=UDim.new(0,2)
b3.PaddingRight=UDim.new(0,2)
b3.Parent=b0

b0.Parent=b_

local b4=Instance.new"UIListLayout"
b4.Name="SliderElementsUIListLayout"
b4.Padding=UDim.new(0,20)
b4.FillDirection=Enum.FillDirection.Horizontal
b4.HorizontalAlignment=Enum.HorizontalAlignment.Right
b4.SortOrder=Enum.SortOrder.LayoutOrder
b4.VerticalAlignment=Enum.VerticalAlignment.Center
b4.Parent=b_

local b5=Instance.new"ImageLabel"
b5.Name="SliderBar"
b5.Image=q.sliderbar
b5.ImageColor3=Color3.fromRGB(87,86,86)
b5.BackgroundColor3=Color3.fromRGB(255,255,255)
b5.BackgroundTransparency=1
b5.BorderColor3=Color3.fromRGB(0,0,0)
b5.BorderSizePixel=0
b5.Position=UDim2.fromScale(0.219,0.457)
b5.Size=UDim2.fromOffset(123,3)

local b6=Instance.new"ImageButton"
b6.Name="SliderHead"
b6.Image=q.sliderhead
b6.AnchorPoint=Vector2.new(0.5,0.5)
b6.BackgroundColor3=Color3.fromRGB(255,255,255)
b6.BackgroundTransparency=1
b6.BorderColor3=Color3.fromRGB(0,0,0)
b6.BorderSizePixel=0
b6.Position=UDim2.fromScale(1,0.5)
b6.Size=UDim2.fromOffset(12,12)
b6.Parent=b5

b5.Parent=b_

local b7=Instance.new"UIPadding"
b7.Name="SliderElementsUIPadding"
b7.PaddingTop=UDim.new(0,3)
b7.Parent=b_

b_.Parent=bY

local b8={
Hundredths=function(b8)
return string.format("%.2f",b8)
end,
Tenths=function(b8)
return string.format("%.1f",b8)
end,
Round=function(b8,b9)
if b9 then
return string.format("%."..b9 .."f",b8)
else
return tostring(math.round(b8))
end
end,
Degrees=function(b8,b9)
local ca=b9 and string.format("%."..b9 .."f",b8)or tostring(b8)
return ca.."°"
end,
Percent=function(b8,b9)
local ca=(b8-bX.Settings.Minimum)/(bX.Settings.Maximum-bX.Settings.Minimum)*100
return b9 and string.format("%."..b9 .."f",ca).."%"or tostring(math.round(ca)).."%"
end,
Value=function(b8,b9)
return b9 and string.format("%."..b9 .."f",b8)or tostring(b8)
end
}

local b9=b8[bX.Settings.DisplayMethod]or b8.Value
local ca

local function SetValue(cb,cc)
local cd

if typeof(cb)=="Instance"then
local ce=cb
cd=math.clamp((ce.Position.X-b5.AbsolutePosition.X)/b5.AbsoluteSize.X,0,1)
else
local ce=cb
cd=(ce-bX.Settings.Minimum)/(bX.Settings.Maximum-bV.Minimum)
end

local ce=UDim2.new(cd,0,0.5,0)
local cf=TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
local cg=b:Create(b6,cf,{Position=ce})
cg:Play()

ca=cd*(bX.Settings.Maximum-bX.Settings.Minimum)+bV.Minimum

b0.Text=(bV.Prefix or"")..b9(ca,bX.Settings.Precision)..(bV.Suffix or"")

if not cc then
task.spawn(function()
if bX.Settings.Callback then
bX.Settings.Callback(ca)
end
end)
end

bX.Value=ca
end

SetValue(bX.Settings.Default,true)

local function updateSliderBarSize()
local cb=b4.Padding.Offset
local cc=b0.AbsoluteSize.X
local cd=bZ.AbsoluteSize.X
local ce=b_.AbsoluteSize.X

local cf=(ce-(cb+cc+cd+20))/I.Scale
b5.Size=UDim2.new(b5.Size.X.Scale,cf,b5.Size.Y.Scale,b5.Size.Y.Offset)
end

updateSliderBarSize()

bZ:GetPropertyChangedSignal"AbsoluteSize":Connect(updateSliderBarSize)
bJ:GetPropertyChangedSignal"AbsoluteSize":Connect(updateSliderBarSize)

function bX.UpdateName(cb,cc)
bZ=cc
end
function bX.SetVisibility(cb,cc)
bY.Visible=cc
end
function bX.UpdateValue(cb,cc)
SetValue(tonumber(cc),true)
end
function bX.GetValue(cb)
return ca
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Input(bU,bV,bW)
local bX={Settings=bV,IgnoreConfig=false,Class="Input"}
local bY=Instance.new"Frame"
bY.Name="Input"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,38)
bY.Parent=bJ

local bZ=Instance.new"TextLabel"
bZ.Name="InputName"
bZ.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
bZ.Text=bX.Settings.Name
bZ.RichText=true
bZ.TextColor3=Color3.fromRGB(240,240,240)
bZ.TextSize=14
bZ.TextTransparency=0.1
bZ.TextTruncate=Enum.TextTruncate.AtEnd
bZ.TextXAlignment=Enum.TextXAlignment.Left
bZ.TextYAlignment=Enum.TextYAlignment.Top
bZ.AnchorPoint=Vector2.new(0,0.5)
bZ.AutomaticSize=Enum.AutomaticSize.XY
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Position=UDim2.fromScale(0,0.5)
bZ.Parent=bY

local b_=Instance.new"TextBox"
b_.Name="InputBox"
b_.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
b_.Text="Hello world!"
b_.PlaceholderText="Enter text..."
b_.PlaceholderColor3=Color3.fromRGB(161,161,170)
b_.TextColor3=Color3.fromRGB(255,255,255)
b_.TextSize=13.5
b_.TextTransparency=0
b_.AnchorPoint=Vector2.new(1,0.5)
b_.AutomaticSize=Enum.AutomaticSize.X
b_.BackgroundColor3=Color3.fromRGB(52,52,57)
b_.BackgroundTransparency=0
b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0
b_.ClipsDescendants=true
b_.LayoutOrder=1
b_.Position=UDim2.fromScale(1,0.5)
b_.Size=UDim2.fromOffset(21,32)
b_.TextXAlignment=Enum.TextXAlignment.Right
b_.ClearTextOnFocus=false

local b0=Instance.new"UICorner"
b0.Name="InputBoxUICorner"
b0.CornerRadius=UDim.new(0,9)
b0.Parent=b_

local b1=Instance.new"UIStroke"
b1.Name="InputBoxUIStroke"
b1.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
b1.Color=Color3.fromRGB(82,82,91)
b1.Transparency=0.7
b1.Thickness=1
b1.Parent=b_

local b2=Instance.new"UIPadding"
b2.Name="InputBoxUIPadding"
b2.PaddingLeft=UDim.new(0,10)
b2.PaddingRight=UDim.new(0,10)
b2.PaddingTop=UDim.new(0,2)
b2.PaddingBottom=UDim.new(0,2)
b2.Parent=b_

local b3=Instance.new"UISizeConstraint"
b3.Name="InputBoxUISizeConstraint"
b3.Parent=b_

b_.Parent=bY

local b4=bY
local b5=b_
local b6=bZ
local b7=b3

local function applyCharacterLimit(b8)
if bX.Settings.CharacterLimit then
return b8:sub(1,bX.Settings.CharacterLimit)
end
return b8
end

local b8={
All=function(b8)
return applyCharacterLimit(b8)
end,
Numeric=function(b8)
local b9=b8:match"^%-?%d*$"and b8 or b8:gsub("[^%d-]",""):gsub("(%-)",function(b9,ca)
return ca==1 and b9 or""
end)
return applyCharacterLimit(b9)
end,
Alphabetic=function(b8)
return applyCharacterLimit(b8:gsub("[^a-zA-Z ]",""))
end,
AlphaNumeric=function(b8)
return applyCharacterLimit(b8:gsub("[^a-zA-Z0-9]",""))
end,
}

local b9

if type(bX.Settings.AcceptedCharacters)=="function"then
b9=bX.Settings.AcceptedCharacters
else
b9=b8[bX.Settings.AcceptedCharacters]or b8.All
end

b5.AutomaticSize=Enum.AutomaticSize.X

local function checkSize()
local ca=b6.AbsoluteSize.X
local cb=b4.AbsoluteSize.X

local cc=(cb-ca-20)/I.Scale
b7.MaxSize=Vector2.new(cc,9e9)
end

checkSize()
b6:GetPropertyChangedSignal"AbsoluteSize":Connect(checkSize)


b5.Focused:Connect(function()
Tween(b1,TweenInfo.new(0.2,Enum.EasingStyle.Quint),{
Color=Color3.fromRGB(168,85,247),
Transparency=0
}):Play()
Tween(b1,TweenInfo.new(0.2,Enum.EasingStyle.Quint),{
Thickness=2
}):Play()
end)

b5.FocusLost:Connect(function()
Tween(b1,TweenInfo.new(0.2,Enum.EasingStyle.Quint),{
Color=Color3.fromRGB(82,82,91),
Transparency=0.7,
Thickness=1
}):Play()

local ca=b5.Text
local cb=b9(ca)
b5.Text=cb
task.spawn(function()
if bX.Settings.Callback then
bX.Settings.Callback(cb)
end
end)
end)
b5.Text=bX.Settings.Default or""
b5.PlaceholderText=bX.Settings.Placeholder or""

b5:GetPropertyChangedSignal"Text":Connect(function()
b5.Text=b9(b5.Text)
if bX.Settings.onChanged then
bX.Settings.onChanged(b5.Text)
end
bX.Text=b5.Text
end)

function bX.UpdateName(ca,cb)
bZ.Text=cb
end
function bX.SetVisibility(ca,cb)
bY.Visible=cb
end
function bX.GetInput(ca)
return b5.Text
end
function bX.UpdatePlaceholder(ca,cb)
b_.PlaceholderText=cb
end
function bX.UpdateText(ca,cb)
local cc=b9(cb)
b5.Text=cc
bX.Text=cc
task.spawn(function()
if bX.Settings.Callback then
bX.Settings.Callback(cc)
end
end)
end

if bX.Settings.Default then
bX:UpdateText(bX.Settings.Default)
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Keybind(bU,bV,bW)
local bX={Settings=bV,IgnoreConfig=false,Class="Keybind"}
local bY=Instance.new"Frame"
bY.Name="Keybind"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,38)
bY.Parent=bJ

local bZ=Instance.new"TextLabel"
bZ.Name="KeybindName"
bZ.FontFace=Font.new(q.interFont)
bZ.Text=bX.Settings.Name
bZ.RichText=true
bZ.TextColor3=Color3.fromRGB(240,240,240)
bZ.TextSize=14
bZ.TextTransparency=0.1
bZ.TextTruncate=Enum.TextTruncate.AtEnd
bZ.TextXAlignment=Enum.TextXAlignment.Left
bZ.TextYAlignment=Enum.TextYAlignment.Top
bZ.AnchorPoint=Vector2.new(0,0.5)
bZ.AutomaticSize=Enum.AutomaticSize.XY
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Position=UDim2.fromScale(0,0.5)
bZ.Parent=bY

local b_=Instance.new"TextBox"
b_.Name="BinderBox"
b_.CursorPosition=-1
b_.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
b_.PlaceholderText="..."
b_.Text=""
b_.TextColor3=Color3.fromRGB(255,255,255)
b_.TextSize=12
b_.TextTransparency=0.1
b_.AnchorPoint=Vector2.new(1,0.5)
b_.AutomaticSize=Enum.AutomaticSize.X
b_.BackgroundColor3=Color3.fromRGB(255,255,255)
b_.BackgroundTransparency=0.95
b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0
b_.ClipsDescendants=true
b_.LayoutOrder=1
b_.Position=UDim2.fromScale(1,0.5)
b_.Size=UDim2.fromOffset(21,21)

local b0=Instance.new"UICorner"
b0.Name="BinderBoxUICorner"
b0.CornerRadius=UDim.new(0,4)
b0.Parent=b_

local b1=Instance.new"UIStroke"
b1.Name="BinderBoxUIStroke"
b1.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
b1.Color=Color3.fromRGB(255,255,255)
b1.Transparency=0.9
b1.Parent=b_

local b2=Instance.new"UIPadding"
b2.Name="BinderBoxUIPadding"
b2.PaddingLeft=UDim.new(0,5)
b2.PaddingRight=UDim.new(0,5)
b2.Parent=b_

local b3=Instance.new"UISizeConstraint"
b3.Name="BinderBoxUISizeConstraint"
b3.Parent=b_

b_.Parent=bY

local b4
local b5=false
local b6=false
local b7=bX.Settings.Default

local function resetFocusState()
b4=false
b5=false
b_:ReleaseFocus()
end

if b7 then
b_.Text=b7.Name
end

b_.Focused:Connect(function()
b4=true
end)

b_.FocusLost:Connect(function()
b4=false
end)

f.InputBegan:Connect(function(b8)
if b4 and not b5 then
b5=true

local b9
b9=f.InputBegan:Connect(function(ca)
if bX.Settings.Blacklist and(table.find(bX.KeybindFunctions.Settings.Blacklist,ca.KeyCode)or table.find(bX.Settings.Blacklist,ca.UserInputType))then
b_:ReleaseFocus()
resetFocusState()
b9:Disconnect()
return
end

if ca.UserInputType==Enum.UserInputType.Keyboard then
b7=ca.KeyCode
b_.Text=ca.KeyCode.Name
elseif ca.UserInputType==Enum.UserInputType.MouseButton1 or ca.UserInputType==Enum.UserInputType.MouseButton2 then
b7=ca.UserInputType
b_.Text=ca.UserInputType.Name
end

if bX.Settings.onBinded then
bX.Settings.onBinded(b7)
end
b6=true
resetFocusState()
b9:Disconnect()
end)
else
if not b6 and(b8.KeyCode==b7 or b8.UserInputType==b7)then
if bX.Settings.Callback then
bX.Settings.Callback(b7)
end
if bX.Settings.onBindHeld then
bX.Settings.onBindHeld(true,b7)
end
else
b6=false
end
end
end)

f.InputEnded:Connect(function(b8)
if not b4 and not b5 then
if b8.KeyCode==b7 or b8.UserInputType==b7 then
if bV.onBindHeld then
bV.onBindHeld(false,b7)
end
end
end
end)

function bX.Bind(b8,b9)
b7=b9
b_.Text=b9.Name
end

function bX.Unbind(b8)
b7=nil
b_.Text=""
end

function bX.GetBind(b8)
return b7
end

function bX.UpdateName(b8,b9)
bZ=b9
end

function bX.SetVisibility(b8,b9)
bY.Visible=b9
end

if bW then
a.Options[bW]=bX
end

return bX
end

function bI.Dropdown(bU,bV,bW)
local bX={Settings=bV,IgnoreConfig=false,Class="Dropdown"}
local bY={}
local bZ={}

local b_=Instance.new"Frame"
b_.Name="Dropdown"
b_.BackgroundColor3=Color3.fromRGB(52,52,57)
b_.BackgroundTransparency=0
b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0
b_.Size=UDim2.new(1,0,0,44)
b_.Parent=bJ
b_.ClipsDescendants=true

local b0=Instance.new"UIPadding"
b0.Name="DropdownUIPadding"
b0.PaddingLeft=UDim.new(0,14)
b0.PaddingRight=UDim.new(0,14)
b0.PaddingTop=UDim.new(0,2)
b0.PaddingBottom=UDim.new(0,2)
b0.Parent=b_

local b1=Instance.new"TextButton"
b1.Name="Interact"
b1.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
b1.Text=""
b1.TextColor3=Color3.fromRGB(0,0,0)
b1.TextSize=14
b1.BackgroundColor3=Color3.fromRGB(255,255,255)
b1.BackgroundTransparency=1
b1.BorderColor3=Color3.fromRGB(0,0,0)
b1.BorderSizePixel=0
b1.Size=UDim2.new(1,0,0,38)
b1.Parent=b_

local b2=Instance.new"TextLabel"
b2.Name="DropdownName"
b2.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
b2.Text=bV.Default and(bX.Settings.Name.." • "..table.concat(bY,", "))or(bX.Settings.Name.."...")
b2.RichText=true
b2.TextColor3=Color3.fromRGB(240,240,240)
b2.TextSize=14
b2.TextTransparency=0.1
b2.TextTruncate=Enum.TextTruncate.SplitWord
b2.TextXAlignment=Enum.TextXAlignment.Left
b2.AutomaticSize=Enum.AutomaticSize.Y
b2.BackgroundColor3=Color3.fromRGB(255,255,255)
b2.BackgroundTransparency=1
b2.BorderColor3=Color3.fromRGB(0,0,0)
b2.BorderSizePixel=0
b2.Size=UDim2.new(1,-20,0,38)
b2.Parent=b_

local b3=Instance.new"UIStroke"
b3.Name="DropdownUIStroke"
b3.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
b3.Color=Color3.fromRGB(82,82,91)
b3.Transparency=0.7
b3.Thickness=1
b3.Parent=b_

local b4=Instance.new"UICorner"
b4.Name="DropdownUICorner"
b4.CornerRadius=UDim.new(0,10)
b4.Parent=b_

local b5=Instance.new"ImageLabel"
b5.Name="DropdownImage"
b5.Image=q.dropdown
b5.ImageTransparency=0.2
b5.ImageColor3=Color3.fromRGB(161,161,170)
b5.AnchorPoint=Vector2.new(1,0)
b5.BackgroundColor3=Color3.fromRGB(255,255,255)
b5.BackgroundTransparency=1
b5.BorderColor3=Color3.fromRGB(0,0,0)
b5.BorderSizePixel=0
b5.Position=UDim2.new(1,0,0,13)
b5.Size=UDim2.fromOffset(16,16)
b5.Parent=b_

local b6=Instance.new"Frame"
b6.Name="DropdownFrame"
b6.BackgroundColor3=Color3.fromRGB(255,255,255)
b6.BackgroundTransparency=1
b6.BorderColor3=Color3.fromRGB(0,0,0)
b6.BorderSizePixel=0
b6.ClipsDescendants=false
b6.Size=UDim2.fromScale(1,1)
b6.Visible=false
b6.AutomaticSize=Enum.AutomaticSize.Y

local b7=Instance.new"UIPadding"
b7.Name="DropdownFrameUIPadding"
b7.PaddingTop=UDim.new(0,38)
b7.PaddingBottom=UDim.new(0,10)
b7.Parent=b6

local b8=Instance.new"UIListLayout"
b8.Name="DropdownFrameUIListLayout"
b8.Padding=UDim.new(0,5)
b8.SortOrder=Enum.SortOrder.LayoutOrder
b8.Parent=b6


local b9=Instance.new"ScrollingFrame"
b9.Name="OptionsScrollFrame"
b9.BackgroundTransparency=1
b9.BorderSizePixel=0
b9.Size=UDim2.new(1,0,0,170)
b9.CanvasSize=UDim2.new(0,0,0,0)
b9.AutomaticCanvasSize=Enum.AutomaticSize.Y
b9.ScrollBarThickness=6
b9.ScrollBarImageColor3=Color3.fromRGB(150,150,160)
b9.ScrollBarImageTransparency=0.2
b9.ScrollingDirection=Enum.ScrollingDirection.Y
b9.ClipsDescendants=true
b9.VerticalScrollBarInset=Enum.ScrollBarInset.ScrollBar
b9.ElasticBehavior=Enum.ElasticBehavior.Never
b9.Parent=b6

local ca=Instance.new"UIListLayout"
ca.Name="OptionsScrollFrameUIListLayout"
ca.Padding=UDim.new(0,5)
ca.SortOrder=Enum.SortOrder.LayoutOrder
ca.Parent=b9

local cb=Instance.new"UIPadding"
cb.Name="OptionsScrollFrameUIPadding"
cb.PaddingRight=UDim.new(0,8)
cb.Parent=b9

local cc=Instance.new"Frame"
cc.Name="Search"
cc.BackgroundColor3=Color3.fromRGB(255,255,255)
cc.BackgroundTransparency=0.95
cc.BorderColor3=Color3.fromRGB(0,0,0)
cc.BorderSizePixel=0
cc.LayoutOrder=-1
cc.Size=UDim2.new(1,0,0,30)
cc.Parent=b6
cc.Visible=bX.Settings.Search

local cd=Instance.new"UICorner"
cd.Name="SectionUICorner"
cd.Parent=cc

local ce=Instance.new"ImageLabel"
ce.Name="SearchIcon"
ce.Image=q.searchIcon
ce.ImageColor3=Color3.fromRGB(180,180,180)
ce.AnchorPoint=Vector2.new(0,0.5)
ce.BackgroundColor3=Color3.fromRGB(255,255,255)
ce.BackgroundTransparency=1
ce.BorderColor3=Color3.fromRGB(0,0,0)
ce.BorderSizePixel=0
ce.Position=UDim2.fromScale(0,0.5)
ce.Size=UDim2.fromOffset(12,12)
ce.Parent=cc

local cf=Instance.new"UIPadding"
cf.Name="UIPadding"
cf.PaddingLeft=UDim.new(0,15)
cf.Parent=cc

local cg=Instance.new"TextBox"
cg.Name="SearchBox"
cg.CursorPosition=-1
cg.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
cg.PlaceholderColor3=Color3.fromRGB(150,150,150)
cg.PlaceholderText="Search..."
cg.Text=""
cg.TextColor3=Color3.fromRGB(200,200,200)
cg.TextSize=14
cg.TextXAlignment=Enum.TextXAlignment.Left
cg.BackgroundColor3=Color3.fromRGB(255,255,255)
cg.BackgroundTransparency=1
cg.BorderColor3=Color3.fromRGB(0,0,0)
cg.BorderSizePixel=0
cg.Size=UDim2.fromScale(1,1)

local function CalculateDropdownSize()
local ch=b7.PaddingTop.Offset+b7.PaddingBottom.Offset


local ci=0
for cj,ck in pairs(b9:GetChildren())do
if not ck:IsA"UIComponent"and ck.Visible then
ci+=1
end
end


local cj=(bX.Settings.Search and cc.Visible)and(cc.AbsoluteSize.Y+b8.Padding.Offset)or 0


local ck=5
local cl=30
local cm=ca.Padding.Offset


local cn=math.min(ci,ck)
local co=cn*cl+(math.max(0,cn-1))*cm


b9.Size=UDim2.new(1,0,0,co)

local cp=cj+co+ch

return cp
end

local function findOption()
local ch=cg.Text:lower()

for ci,cj in pairs(bZ)do
local ck=cj.NameLabel.Text:lower()
local cl=string.find(ck,ch)~=nil

if cj.Button.Visible~=cl then
cj.Button.Visible=cl
end
end

b_.Size=UDim2.new(1,0,0,CalculateDropdownSize())
end

cg:GetPropertyChangedSignal"Text":Connect(findOption)

local ch=Instance.new"UIPadding"
ch.Name="UIPadding"
ch.PaddingLeft=UDim.new(0,23)
ch.Parent=cg

cg.Parent=cc

local ci={
duration=0.2,
easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,
transparencyOut=0.5,
checkSizeIncrease=12,
checkSizeDecrease=-13,
waitTime=1
}

local function Toggle(cj,ck)
local cl=bZ[cj]

if not cl then return end

local cm=cl.Checkmark
local cn=cl.NameLabel

if ck then
if bX.Settings.Multi then
if not table.find(bY,cj)then
table.insert(bY,cj)
bX.Value=bY
end
else
for co,cp in pairs(bZ)do
if co~=cj then
Tween(cp.Checkmark,TweenInfo.new(ci.duration,ci.easingStyle),{
Size=UDim2.new(cp.Checkmark.Size.X.Scale,ci.checkSizeDecrease,cp.Checkmark.Size.Y.Scale,cp.Checkmark.Size.Y.Offset)
}):Play()
Tween(cp.NameLabel,TweenInfo.new(ci.duration,ci.easingStyle),{
TextTransparency=ci.transparencyOut
}):Play()
cp.Checkmark.TextTransparency=1
end
end
bY={cj}
bX.Value=bY[1]
end
Tween(cm,TweenInfo.new(ci.duration,ci.easingStyle),{
Size=UDim2.new(cm.Size.X.Scale,ci.checkSizeIncrease,cm.Size.Y.Scale,cm.Size.Y.Offset)
}):Play()
Tween(cn,TweenInfo.new(ci.duration,ci.easingStyle),{
TextTransparency=ci.transparencyIn
}):Play()
cm.TextTransparency=0
else
if bX.Settings.Multi then
local co=table.find(bY,cj)
if co then
table.remove(bY,co)
end
else
bY={}
end
Tween(cm,TweenInfo.new(ci.duration,ci.easingStyle),{
Size=UDim2.new(cm.Size.X.Scale,ci.checkSizeDecrease,cm.Size.Y.Scale,cm.Size.Y.Offset)
}):Play()
Tween(cn,TweenInfo.new(ci.duration,ci.easingStyle),{
TextTransparency=ci.transparencyOut
}):Play()
cm.TextTransparency=1
end

if bV.Required and#bY==0 and not ck then
return
end

if#bY>0 then
b2.Text=bX.Settings.Name.." • "..table.concat(bY,", ")
else
b2.Text=bX.Settings.Name.."..."
end
end

local cj=false
local ck=false

local function ToggleDropdown()
if ck then return end
ck=true
local cl=44
local cm=not cj
local cn=cm and UDim2.new(1,0,0,CalculateDropdownSize())or UDim2.new(1,0,0,cl)

local co=Tween(b_,TweenInfo.new(0.2,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Size=cn
})
local cp=Tween(b5,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
Rotation=cm and-90 or 0
})

co:Play()
cp:Play()

if cm then
b6.Visible=true
co.Completed:Connect(function()
ck=false
end)
else
co.Completed:Connect(function()
b6.Visible=false
ck=false
end)
end

cj=cm
end

b1.MouseButton1Click:Connect(ToggleDropdown)


local cl
local function setupClickOutside()
if cl then
cl:Disconnect()
end

cl=f.InputBegan:Connect(function(cm)
if cm.UserInputType==Enum.UserInputType.MouseButton1 and cj then
local cn=f:GetMouseLocation()
local co=D.AbsolutePosition
local cp=D.AbsoluteSize
local cq=b_.AbsolutePosition
local cr=b_.AbsoluteSize


local cs=cn.X>=cq.X and
cn.X<=cq.X+cr.X and
cn.Y>=cq.Y and
cn.Y<=cq.Y+cr.Y


local ct=cn.X<co.X or
cn.X>co.X+cp.X or
cn.Y<co.Y or
cn.Y>co.Y+cp.Y


if ct and not cs then
ToggleDropdown()
end
end
end)
end

setupClickOutside()

local function addOption(cm,cn)
local co=Instance.new"TextButton"
co.Name="Option"
co.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
co.Text=""
co.TextColor3=Color3.fromRGB(0,0,0)
co.TextSize=14
co.BackgroundColor3=Color3.fromRGB(255,255,255)
co.BackgroundTransparency=1
co.BorderColor3=Color3.fromRGB(0,0,0)
co.BorderSizePixel=0
co.Size=UDim2.new(1,0,0,30)

local cp=Instance.new"UIPadding"
cp.Name="OptionUIPadding"
cp.PaddingLeft=UDim.new(0,15)
cp.PaddingRight=UDim.new(0,10)
cp.Parent=co

local cq=Instance.new"TextLabel"
cq.Name="OptionName"
cq.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
cq.Text=cn
cq.RichText=true
cq.TextColor3=Color3.fromRGB(255,255,255)
cq.TextSize=13
cq.TextTransparency=0.5
cq.TextTruncate=Enum.TextTruncate.AtEnd
cq.TextXAlignment=Enum.TextXAlignment.Left
cq.TextYAlignment=Enum.TextYAlignment.Top
cq.AnchorPoint=Vector2.new(0,0.5)
cq.AutomaticSize=Enum.AutomaticSize.XY
cq.BackgroundColor3=Color3.fromRGB(255,255,255)
cq.BackgroundTransparency=1
cq.BorderColor3=Color3.fromRGB(0,0,0)
cq.BorderSizePixel=0
cq.Position=UDim2.fromScale(1.3e-07,0.5)
cq.Parent=co

local cr=Instance.new"UIListLayout"
cr.Name="OptionUIListLayout"
cr.Padding=UDim.new(0,10)
cr.FillDirection=Enum.FillDirection.Horizontal
cr.SortOrder=Enum.SortOrder.LayoutOrder
cr.VerticalAlignment=Enum.VerticalAlignment.Center
cr.Parent=co

local cs=Instance.new"TextLabel"
cs.Name="Checkmark"
cs.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
cs.Text="✓"
cs.TextColor3=Color3.fromRGB(255,255,255)
cs.TextSize=13
cs.TextTransparency=1
cs.TextXAlignment=Enum.TextXAlignment.Left
cs.TextYAlignment=Enum.TextYAlignment.Top
cs.AnchorPoint=Vector2.new(0,0.5)
cs.AutomaticSize=Enum.AutomaticSize.Y
cs.BackgroundColor3=Color3.fromRGB(255,255,255)
cs.BackgroundTransparency=1
cs.BorderColor3=Color3.fromRGB(0,0,0)
cs.BorderSizePixel=0
cs.LayoutOrder=-1
cs.Position=UDim2.fromScale(1.3e-07,0.5)
cs.Size=UDim2.fromOffset(-10,0)
cs.Parent=co

co.Parent=b9

b6.Parent=b_
bZ[cn]={
Index=cm,
Button=co,
NameLabel=cq,
Checkmark=cs
}

local ct={
duration=0.2,
easingStyle=Enum.EasingStyle.Quint,
transparencyIn=0.2,
transparencyOut=0.5,
checkSizeIncrease=12,
checkSizeDecrease=-cr.Padding.Offset,
waitTime=1
}local cu=
{
checkIn=Tween(cs,TweenInfo.new(ct.duration,ct.easingStyle),{
Size=UDim2.new(cs.Size.X.Scale,ct.checkSizeIncrease,cs.Size.Y.Scale,cs.Size.Y.Offset)
}),
checkOut=Tween(cs,TweenInfo.new(ct.duration,ct.easingStyle),{
Size=UDim2.new(cs.Size.X.Scale,ct.checkSizeDecrease,cs.Size.Y.Scale,cs.Size.Y.Offset)
}),
nameIn=Tween(cq,TweenInfo.new(ct.duration,ct.easingStyle),{
TextTransparency=ct.transparencyIn
}),
nameOut=Tween(cq,TweenInfo.new(ct.duration,ct.easingStyle),{
TextTransparency=ct.transparencyOut
})
}

local cv=false
if bX.Settings.Default then
if bX.Settings.Multi then
cv=table.find(bX.Settings.Default,cn)and true or false
else
cv=(bX.Settings.Default==cm)and true or false
end
end
Toggle(cn,cv)

local cw=bZ[cn].Button

cw.MouseButton1Click:Connect(function()
local cx=table.find(bY,cn)and true or false
local cy=not cx

if bX.Settings.Required and not cy and#bY<=1 then
return
end

Toggle(cn,cy)

task.spawn(function()
if bX.Settings.Multi then
local cz={}
for cA,cB in ipairs(bY)do
cz[cB]=true
end
if bX.Settings.Callback then
bX.Settings.Callback(cz)
end

else
if cy and bX.Settings.Callback then
bX.Settings.Callback(bY[1]or nil)
end
end
end)
end)

if cj then
b_.Size=UDim2.new(1,0,0,CalculateDropdownSize())
end
end

if bX.Settings.Options then
for cm,cn in pairs(bX.Settings.Options)do
addOption(cm,cn)
end
end

function bX.UpdateName(cm,cn)
b2.Text=cn
end
function bX.SetVisibility(cm,cn)
b_.Visible=cn
end
function bX.UpdateSelection(cm,cn,cp)
if not cn then return end

for cq,cr in pairs(bZ)do
Toggle(cq,false)
end

local cq={}
if type(cn)=="number"then
for cr,cs in pairs(bZ)do
local ct=cs.Index==cn
Toggle(cr,ct)
if ct then
table.insert(cq,cr)
end
end
elseif type(cn)=="string"then
for cr,cs in pairs(bZ)do
local ct=cr==cn
Toggle(cr,ct)
if ct then
table.insert(cq,cr)
end
end
elseif type(cn)=="table"then
for cr,cs in pairs(bZ)do
local ct=table.find(cn,cr)~=nil
Toggle(cr,ct)
if ct then
table.insert(cq,cr)
end
end
end

if not cp and bX.Settings.Callback then
task.spawn(function()
if bX.Settings.Multi then
local cr={}
for cs,ct in ipairs(cq)do
cr[ct]=true
end
bX.Settings.Callback(cr)
else
bX.Settings.Callback(cq[1]or nil)
end
end)
end
end
function bX.InsertOptions(cm,cn)
if not cn then return end
bX.Settings.Options=cn
for cp,cq in pairs(cn)do
addOption(cp,cq)
end
end
function bX.ClearOptions(cm)
for cn,cp in pairs(bZ)do
cp.Button:Destroy()
end
bZ={}
bY={}

if cj then
b_.Size=UDim2.new(1,0,0,CalculateDropdownSize())
end
end
function bX.GetOptions(cm)
local cn={}

for cp,cq in pairs(bZ)do
local cr=table.find(bY,cp)and true or false
cn[cp]=cr
end

return cn
end

function bX.RemoveOptions(cm,cn)
if not cn then return end
for cp,cq in ipairs(cn)do
local cr=bZ[cq]

if cr then
for cs=#bY,1,-1 do
if bY[cs]==cq then
table.remove(bY,cs)
end
end

cr.Button:Destroy()

bZ[cq]=nil
end
end

if cj then
b_.Size=UDim2.new(1,0,0,CalculateDropdownSize())
end
end
function bX.IsOption(cm,cn)
if not cn then return end
return bZ[cn]~=nil
end

if bX.Settings.Default then
bX:UpdateSelection(bX.Settings.Default)
end

if bW then
a.Options[bW]=bX
end

return bX
end

function bI.Colorpicker(bU,bV,bW)
local bX={Settings=bV,IgnoreConfig=false,Class="Colorpicker"}

local bY=bX.Settings.Alpha and true or false
bX.Color=bX.Settings.Default
bX.Alpha=bY and bX.Settings.Alpha

local bZ=Instance.new"Frame"
bZ.Name="Colorpicker"
bZ.AutomaticSize=Enum.AutomaticSize.Y
bZ.BackgroundColor3=Color3.fromRGB(0,0,0)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Size=UDim2.new(1,0,0,38)
bZ.Parent=bJ

local b_=Instance.new"TextLabel"
b_.Name="KeybindName"
b_.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
b_.Text=bV.Name
b_.TextColor3=Color3.fromRGB(240,240,240)
b_.TextSize=14
b_.TextTransparency=0.1
b_.RichText=true
b_.TextTruncate=Enum.TextTruncate.AtEnd
b_.TextXAlignment=Enum.TextXAlignment.Left
b_.TextYAlignment=Enum.TextYAlignment.Top
b_.AnchorPoint=Vector2.new(0,0.5)
b_.AutomaticSize=Enum.AutomaticSize.XY
b_.BackgroundColor3=Color3.fromRGB(255,255,255)
b_.BackgroundTransparency=1
b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0
b_.Position=UDim2.fromScale(0,0.5)
b_.Parent=bZ

local b0=Instance.new"ImageLabel"
b0.Name="NewColor"
b0.Image=q.grid
b0.ScaleType=Enum.ScaleType.Tile
b0.TileSize=UDim2.fromOffset(500,500)
b0.AnchorPoint=Vector2.new(1,0.5)
b0.BackgroundColor3=Color3.fromRGB(255,255,255)
b0.BackgroundTransparency=1
b0.BorderColor3=Color3.fromRGB(0,0,0)
b0.BorderSizePixel=0
b0.Position=UDim2.fromScale(1,0.5)
b0.Size=UDim2.fromOffset(21,21)

local b1=Instance.new"Frame"
b1.Name="Color"
b1.AnchorPoint=Vector2.new(0.5,0.5)
b1.BackgroundColor3=bX.Color
b1.BorderSizePixel=0
b1.Position=UDim2.fromScale(0.5,0.5)
b1.Size=UDim2.fromScale(1,1)
b1.BackgroundTransparency=bX.Alpha or 0

local b2=Instance.new"UICorner"
b2.Name="UICorner"
b2.CornerRadius=UDim.new(0,6)
b2.Parent=b1

local b3=Instance.new"TextButton"
b3.Name="Interact"
b3.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
b3.Text=""
b3.TextColor3=Color3.fromRGB(0,0,0)
b3.TextSize=14
b3.BackgroundColor3=Color3.fromRGB(255,255,255)
b3.BackgroundTransparency=1
b3.BorderColor3=Color3.fromRGB(0,0,0)
b3.BorderSizePixel=0
b3.Size=UDim2.fromScale(1,1)
b3.Parent=b1

b1.Parent=b0

local b4=Instance.new"UICorner"
b4.Name="UICorner"
b4.CornerRadius=UDim.new(0,8)
b4.Parent=b0

b0.Parent=bZ

local b5=Instance.new"Frame"
b5.Name="ColorPicker"
b5.BackgroundColor3=Color3.fromRGB(0,0,0)
b5.BackgroundTransparency=0.5
b5.BorderColor3=Color3.fromRGB(0,0,0)
b5.BorderSizePixel=0
b5.Size=UDim2.fromScale(1,1)
b5.Visible=false

local b6=Instance.new"UICorner"
b6.Name="BaseUICorner"
b6.CornerRadius=UDim.new(0,10)
b6.Parent=b5

local b7=Instance.new"Frame"
b7.Name="Prompt"
b7.AnchorPoint=Vector2.new(0.5,0.5)
b7.BackgroundColor3=Color3.fromRGB(255,255,255)
b7.BorderSizePixel=0
b7.Position=UDim2.fromScale(0.5,0.5)
b7.Size=UDim2.new(0,374,0,322)

local b8=Instance.new"UICorner"
b8.Name="GlobalSettingsUICorner"
b8.CornerRadius=UDim.new(0,10)
b8.Parent=b7

local b9=Instance.new"UIStroke"
b9.Name="GlobalSettingsUIStroke"
b9.ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual
b9.Color=Color3.fromRGB(255,255,255)
b9.Transparency=0.9
b9.Parent=b7

local ca=Instance.new"UIGradient"
ca.Color=ColorSequence.new(Color3.fromRGB(85,57,139),Color3.fromRGB(62,56,78))
ca.Rotation=90
ca.Parent=b7

local cb=Instance.new"UIScale"
cb.Name="BaseUIScale"
cb.Scale=0.95
cb.Parent=b7


local cc=Instance.new"UIListLayout"
cc.Name="UIListLayout"
cc.Padding=UDim.new(0,10)
cc.HorizontalAlignment=Enum.HorizontalAlignment.Left
cc.SortOrder=Enum.SortOrder.LayoutOrder
cc.Parent=b7

local cd=Instance.new"Frame"
cd.Name="ColorOptions"
cd.AutomaticSize=Enum.AutomaticSize.XY
cd.BackgroundColor3=Color3.fromRGB(255,255,255)
cd.BackgroundTransparency=1
cd.BorderColor3=Color3.fromRGB(0,0,0)
cd.BorderSizePixel=0
cd.LayoutOrder=1
cd.Size=UDim2.new(1,0,-0.581,0)

local ce=Instance.new"TextButton"
ce.Name="Value"
ce.FontFace=Font.new"rbxasset://fonts/families/SourceSansPro.json"
ce.Text=""
ce.TextColor3=Color3.fromRGB(0,0,0)
ce.TextSize=14
ce.AutoButtonColor=false
ce.BackgroundColor3=Color3.fromRGB(255,255,255)
ce.BorderColor3=Color3.fromRGB(0,0,0)
ce.BorderSizePixel=0
ce.LayoutOrder=1
ce.Position=UDim2.new(0,0,0.998,0)
ce.Size=UDim2.new(1,0,0,15)

local cf=Instance.new"UIGradient"
cf.Name="UIGradient"
cf.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0)),
}
cf.Parent=ce

local cg=Instance.new"Frame"
cg.Name="Slide"
cg.AnchorPoint=Vector2.new(0,0.5)
cg.BackgroundColor3=Color3.fromRGB(255,255,255)
cg.BorderColor3=Color3.fromRGB(27,42,53)
cg.BorderSizePixel=0
cg.Position=UDim2.fromScale(0,0.5)
cg.Size=UDim2.new(0,13,1,8)

local ch=Instance.new"UICorner"
ch.Name="UICorner"
ch.CornerRadius=UDim.new(1,0)
ch.Parent=cg

local ci=Instance.new"UIStroke"
ci.Name="UIStroke"
ci.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
ci.Transparency=0.5
ci.Parent=cg

cg.Parent=ce

local cj=Instance.new"UICorner"
cj.Name="UICorner"
cj.CornerRadius=UDim.new(0,6)
cj.Parent=ce

local ck=Instance.new"UIStroke"
ck.Name="UIStroke"
ck.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
ck.Color=Color3.fromRGB(255,255,255)
ck.Transparency=0.9

local cl=Instance.new"UIGradient"
cl.Name="UIGradient"
cl.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,0)),
}
cl.Rotation=180
cl.Parent=ck

ck.Parent=ce

ce.Parent=cd

local cm=Instance.new"Frame"
cm.Name="Wheel"
cm.AutomaticSize=Enum.AutomaticSize.Y
cm.BackgroundColor3=Color3.fromRGB(255,255,255)
cm.BackgroundTransparency=1
cm.BorderColor3=Color3.fromRGB(0,0,0)
cm.BorderSizePixel=0
cm.Size=UDim2.new(1,0,0,100)

local cn=Instance.new"ImageButton"
cn.Name="Wheel"
cn.Image=q.colorWheel
cn.AutoButtonColor=false
cn.Active=false
cn.BackgroundColor3=Color3.fromRGB(248,248,248)
cn.BackgroundTransparency=1
cn.BorderColor3=Color3.fromRGB(27,42,53)
cn.Selectable=false
cn.Position=UDim2.new(0.039,0,-9E-2,0)
cn.Size=UDim2.new(0,130,0,130)
cn.SizeConstraint=Enum.SizeConstraint.RelativeYY

local cp=Instance.new"ImageLabel"
cp.Name="Target"
cp.Image=q.colorTarget
cp.ImageColor3=Color3.fromRGB(0,0,0)
cp.AnchorPoint=Vector2.new(0.5,0.5)
cp.BackgroundColor3=Color3.fromRGB(255,255,255)
cp.BackgroundTransparency=1
cp.BorderColor3=Color3.fromRGB(27,42,53)
cp.Position=UDim2.fromScale(0.5,0.5)
cp.Size=UDim2.fromOffset(22,22)
cp.SizeConstraint=Enum.SizeConstraint.RelativeYY
cp.Parent=cn

cn.Parent=cm

local cq=Instance.new"Frame"
cq.Name="Inputs"
cq.AnchorPoint=Vector2.new(1,0.5)
cq.AutomaticSize=Enum.AutomaticSize.XY
cq.BackgroundColor3=Color3.fromRGB(255,255,255)
cq.BackgroundTransparency=1
cq.BorderColor3=Color3.fromRGB(0,0,0)
cq.BorderSizePixel=0
cq.LayoutOrder=1
cq.Position=UDim2.new(1.015,0,0.323,0)

local cr=Instance.new"UIListLayout"
cr.Name="UIListLayout"
cr.Padding=UDim.new(0,0)
cr.SortOrder=Enum.SortOrder.LayoutOrder
cr.Parent=cq

local cs=Instance.new"Frame"
cs.Name="Red"
cs.AutomaticSize=Enum.AutomaticSize.XY
cs.BackgroundColor3=Color3.fromRGB(0,0,0)
cs.BackgroundTransparency=1
cs.BorderColor3=Color3.fromRGB(0,0,0)
cs.BorderSizePixel=0
cs.LayoutOrder=1
cs.Size=UDim2.fromOffset(0,38)

local ct=Instance.new"TextLabel"
ct.Name="InputName"
ct.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
ct.Text="Red"
ct.TextColor3=Color3.fromRGB(255,255,255)
ct.TextSize=13
ct.TextTransparency=0.5
ct.TextTruncate=Enum.TextTruncate.AtEnd
ct.TextXAlignment=Enum.TextXAlignment.Left
ct.TextYAlignment=Enum.TextYAlignment.Top
ct.AnchorPoint=Vector2.new(0,0.5)
ct.AutomaticSize=Enum.AutomaticSize.XY
ct.BackgroundColor3=Color3.fromRGB(255,255,255)
ct.BackgroundTransparency=1
ct.BorderColor3=Color3.fromRGB(0,0,0)
ct.BorderSizePixel=0
ct.LayoutOrder=2
ct.Position=UDim2.fromScale(0,0.5)
ct.Parent=cs

local cu=Instance.new"UIListLayout"
cu.Name="UIListLayout"
cu.Padding=UDim.new(0,15)
cu.FillDirection=Enum.FillDirection.Horizontal
cu.SortOrder=Enum.SortOrder.LayoutOrder
cu.VerticalAlignment=Enum.VerticalAlignment.Center
cu.Parent=cs

local cv=Instance.new"TextBox"
cv.Name="InputBox"
cv.ClearTextOnFocus=false
cv.CursorPosition=-1
cv.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
cv.Text="255"
cv.TextColor3=Color3.fromRGB(255,255,255)
cv.TextSize=12
cv.TextTransparency=0.1
cv.TextXAlignment=Enum.TextXAlignment.Left
cv.AnchorPoint=Vector2.new(1,0.5)
cv.BackgroundColor3=Color3.fromRGB(255,255,255)
cv.BackgroundTransparency=0.95
cv.BorderColor3=Color3.fromRGB(0,0,0)
cv.BorderSizePixel=0
cv.ClipsDescendants=true
cv.LayoutOrder=1
cv.Position=UDim2.fromScale(1,0.5)
cv.Size=UDim2.new(0,100,0,25)

local cw=Instance.new"UICorner"
cw.Name="InputBoxUICorner"
cw.CornerRadius=UDim.new(0,4)
cw.Parent=cv

local cx=Instance.new"UIStroke"
cx.Name="InputBoxUIStroke"
cx.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
cx.Color=Color3.fromRGB(255,255,255)
cx.Transparency=0.9
cx.Parent=cv

local cy=Instance.new"UISizeConstraint"
cy.Name="InputBoxUISizeConstraint"
cy.Parent=cv

local cz=Instance.new"UIPadding"
cz.Name="InputBoxUIPadding"
cz.PaddingLeft=UDim.new(0,8)
cz.PaddingRight=UDim.new(0,10)
cz.Parent=cv

cv.Parent=cs

cs.Parent=cq

local cA=Instance.new"Frame"
cA.Name="Green"
cA.AutomaticSize=Enum.AutomaticSize.XY
cA.BackgroundColor3=Color3.fromRGB(0,0,0)
cA.BackgroundTransparency=1
cA.BorderColor3=Color3.fromRGB(0,0,0)
cA.BorderSizePixel=0
cA.LayoutOrder=2
cA.Size=UDim2.fromOffset(0,38)

local cB=Instance.new"TextLabel"
cB.Name="InputName"
cB.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
cB.Text="Green"
cB.TextColor3=Color3.fromRGB(255,255,255)
cB.TextSize=13
cB.TextTransparency=0.5
cB.TextTruncate=Enum.TextTruncate.AtEnd
cB.TextXAlignment=Enum.TextXAlignment.Left
cB.TextYAlignment=Enum.TextYAlignment.Top
cB.AnchorPoint=Vector2.new(0,0.5)
cB.AutomaticSize=Enum.AutomaticSize.XY
cB.BackgroundColor3=Color3.fromRGB(255,255,255)
cB.BackgroundTransparency=1
cB.BorderColor3=Color3.fromRGB(0,0,0)
cB.BorderSizePixel=0
cB.LayoutOrder=2
cB.Position=UDim2.fromScale(0,0.5)
cB.Parent=cA

local cC=Instance.new"UIListLayout"
cC.Name="UIListLayout"
cC.Padding=UDim.new(0,15)
cC.FillDirection=Enum.FillDirection.Horizontal
cC.SortOrder=Enum.SortOrder.LayoutOrder
cC.VerticalAlignment=Enum.VerticalAlignment.Center
cC.Parent=cA

local cD=Instance.new"TextBox"
cD.Name="InputBox"
cD.ClearTextOnFocus=false
cD.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
cD.Text="255"
cD.TextColor3=Color3.fromRGB(255,255,255)
cD.TextSize=12
cD.TextTransparency=0.1
cD.TextXAlignment=Enum.TextXAlignment.Left
cD.AnchorPoint=Vector2.new(1,0.5)
cD.BackgroundColor3=Color3.fromRGB(255,255,255)
cD.BackgroundTransparency=0.95
cD.BorderColor3=Color3.fromRGB(0,0,0)
cD.BorderSizePixel=0
cD.ClipsDescendants=true
cD.LayoutOrder=1
cD.Position=UDim2.fromScale(1,0.5)
cD.Size=UDim2.new(0,100,0,25)

local cE=Instance.new"UICorner"
cE.Name="InputBoxUICorner"
cE.CornerRadius=UDim.new(0,4)
cE.Parent=cD

local cF=Instance.new"UIStroke"
cF.Name="InputBoxUIStroke"
cF.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
cF.Color=Color3.fromRGB(255,255,255)
cF.Transparency=0.9
cF.Parent=cD

local cG=Instance.new"UISizeConstraint"
cG.Name="InputBoxUISizeConstraint"
cG.Parent=cD

local cH=Instance.new"UIPadding"
cH.Name="InputBoxUIPadding"
cH.PaddingLeft=UDim.new(0,8)
cH.PaddingRight=UDim.new(0,10)
cH.Parent=cD

cD.Parent=cA

cA.Parent=cq

local cI=Instance.new"Frame"
cI.Name="Blue"
cI.AutomaticSize=Enum.AutomaticSize.XY
cI.BackgroundColor3=Color3.fromRGB(0,0,0)
cI.BackgroundTransparency=1
cI.BorderColor3=Color3.fromRGB(0,0,0)
cI.BorderSizePixel=0
cI.LayoutOrder=3
cI.Size=UDim2.fromOffset(0,38)

local cJ=Instance.new"TextLabel"
cJ.Name="InputName"
cJ.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
cJ.Text="Blue"
cJ.TextColor3=Color3.fromRGB(255,255,255)
cJ.TextSize=13
cJ.TextTransparency=0.5
cJ.TextTruncate=Enum.TextTruncate.AtEnd
cJ.TextXAlignment=Enum.TextXAlignment.Left
cJ.TextYAlignment=Enum.TextYAlignment.Top
cJ.AnchorPoint=Vector2.new(0,0.5)
cJ.AutomaticSize=Enum.AutomaticSize.XY
cJ.BackgroundColor3=Color3.fromRGB(255,255,255)
cJ.BackgroundTransparency=1
cJ.BorderColor3=Color3.fromRGB(0,0,0)
cJ.BorderSizePixel=0
cJ.LayoutOrder=2
cJ.Position=UDim2.fromScale(0,0.5)
cJ.Parent=cI

local cK=Instance.new"UIListLayout"
cK.Name="UIListLayout"
cK.Padding=UDim.new(0,15)
cK.FillDirection=Enum.FillDirection.Horizontal
cK.SortOrder=Enum.SortOrder.LayoutOrder
cK.VerticalAlignment=Enum.VerticalAlignment.Center
cK.Parent=cI

local cL=Instance.new"TextBox"
cL.Name="InputBox"
cL.ClearTextOnFocus=false
cL.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
cL.Text="255"
cL.TextColor3=Color3.fromRGB(255,255,255)
cL.TextSize=12
cL.TextTransparency=0.1
cL.TextXAlignment=Enum.TextXAlignment.Left
cL.AnchorPoint=Vector2.new(1,0.5)
cL.BackgroundColor3=Color3.fromRGB(255,255,255)
cL.BackgroundTransparency=0.95
cL.BorderColor3=Color3.fromRGB(0,0,0)
cL.BorderSizePixel=0
cL.ClipsDescendants=true
cL.LayoutOrder=1
cL.Position=UDim2.fromScale(1,0.5)
cL.Size=UDim2.new(0,100,0,25)

local cM=Instance.new"UICorner"
cM.Name="InputBoxUICorner"
cM.CornerRadius=UDim.new(0,4)
cM.Parent=cL

local cN=Instance.new"UIStroke"
cN.Name="InputBoxUIStroke"
cN.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
cN.Color=Color3.fromRGB(255,255,255)
cN.Transparency=0.9
cN.Parent=cL

local cO=Instance.new"UISizeConstraint"
cO.Name="InputBoxUISizeConstraint"
cO.Parent=cL

local cP=Instance.new"UIPadding"
cP.Name="InputBoxUIPadding"
cP.PaddingLeft=UDim.new(0,8)
cP.PaddingRight=UDim.new(0,10)
cP.Parent=cL

cL.Parent=cI

cI.Parent=cq

local cQ=Instance.new"Frame"
cQ.Name="Alpha"
cQ.AutomaticSize=Enum.AutomaticSize.XY
cQ.BackgroundColor3=Color3.fromRGB(0,0,0)
cQ.BackgroundTransparency=1
cQ.BorderColor3=Color3.fromRGB(0,0,0)
cQ.BorderSizePixel=0
cQ.LayoutOrder=4
cQ.Size=UDim2.fromOffset(0,38)
cQ.Visible=bY

local cR=Instance.new"TextLabel"
cR.Name="InputName"
cR.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
cR.Text="Alpha"
cR.TextColor3=Color3.fromRGB(255,255,255)
cR.TextSize=13
cR.TextTransparency=0.5
cR.TextTruncate=Enum.TextTruncate.AtEnd
cR.TextXAlignment=Enum.TextXAlignment.Left
cR.TextYAlignment=Enum.TextYAlignment.Top
cR.AnchorPoint=Vector2.new(0,0.5)
cR.AutomaticSize=Enum.AutomaticSize.XY
cR.BackgroundColor3=Color3.fromRGB(255,255,255)
cR.BackgroundTransparency=1
cR.BorderColor3=Color3.fromRGB(0,0,0)
cR.BorderSizePixel=0
cR.LayoutOrder=2
cR.Position=UDim2.fromScale(0,0.5)
cR.Parent=cQ

local cS=Instance.new"UIListLayout"
cS.Name="UIListLayout"
cS.Padding=UDim.new(0,15)
cS.FillDirection=Enum.FillDirection.Horizontal
cS.SortOrder=Enum.SortOrder.LayoutOrder
cS.VerticalAlignment=Enum.VerticalAlignment.Center
cS.Parent=cQ

local cT=Instance.new"TextBox"
cT.Name="InputBox"
cT.ClearTextOnFocus=false
cT.FontFace=Font.new(q.interFont)
cT.Text="0"
cT.TextColor3=Color3.fromRGB(255,255,255)
cT.TextSize=12
cT.TextTransparency=0.1
cT.TextXAlignment=Enum.TextXAlignment.Left
cT.AnchorPoint=Vector2.new(1,0.5)
cT.BackgroundColor3=Color3.fromRGB(255,255,255)
cT.BackgroundTransparency=0.95
cT.BorderColor3=Color3.fromRGB(0,0,0)
cT.BorderSizePixel=0
cT.ClipsDescendants=true
cT.LayoutOrder=1
cT.Position=UDim2.fromScale(1,0.5)
cT.Size=UDim2.new(0,100,0,25)

local cU=Instance.new"UICorner"
cU.Name="InputBoxUICorner"
cU.CornerRadius=UDim.new(0,4)
cU.Parent=cT

local cV=Instance.new"UIStroke"
cV.Name="InputBoxUIStroke"
cV.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
cV.Color=Color3.fromRGB(255,255,255)
cV.Transparency=0.9
cV.Parent=cT

local cW=Instance.new"UISizeConstraint"
cW.Name="InputBoxUISizeConstraint"
cW.Parent=cT

local cX=Instance.new"UIPadding"
cX.Name="InputBoxUIPadding"
cX.PaddingLeft=UDim.new(0,8)
cX.PaddingRight=UDim.new(0,10)
cX.Parent=cT

cT.Parent=cQ

cQ.Parent=cq

local cY=Instance.new"Frame"
cY.Name="Hex"
cY.AutomaticSize=Enum.AutomaticSize.XY
cY.BackgroundColor3=Color3.fromRGB(0,0,0)
cY.BackgroundTransparency=1
cY.BorderColor3=Color3.fromRGB(0,0,0)
cY.BorderSizePixel=0
cY.Size=UDim2.fromOffset(0,38)

local cZ=Instance.new"TextLabel"
cZ.Name="InputName"
cZ.FontFace=Font.new(q.interFont)
cZ.Text="Hex"
cZ.TextColor3=Color3.fromRGB(255,255,255)
cZ.TextSize=13
cZ.TextTransparency=0.5
cZ.TextTruncate=Enum.TextTruncate.AtEnd
cZ.TextXAlignment=Enum.TextXAlignment.Left
cZ.TextYAlignment=Enum.TextYAlignment.Top
cZ.AnchorPoint=Vector2.new(0,0.5)
cZ.AutomaticSize=Enum.AutomaticSize.XY
cZ.BackgroundColor3=Color3.fromRGB(255,255,255)
cZ.BackgroundTransparency=1
cZ.BorderColor3=Color3.fromRGB(0,0,0)
cZ.BorderSizePixel=0
cZ.LayoutOrder=2
cZ.Position=UDim2.fromScale(0,0.5)
cZ.Parent=cY

local c_=Instance.new"UIListLayout"
c_.Name="UIListLayout"
c_.Padding=UDim.new(0,15)
c_.FillDirection=Enum.FillDirection.Horizontal
c_.SortOrder=Enum.SortOrder.LayoutOrder
c_.VerticalAlignment=Enum.VerticalAlignment.Center
c_.Parent=cY

local c0=Instance.new"TextBox"
c0.Name="InputBox"
c0.ClearTextOnFocus=false
c0.CursorPosition=-1
c0.FontFace=Font.new(q.interFont)
c0.Text="255"
c0.TextColor3=Color3.fromRGB(255,255,255)
c0.TextSize=12
c0.TextTransparency=0.1
c0.TextXAlignment=Enum.TextXAlignment.Left
c0.AnchorPoint=Vector2.new(1,0.5)
c0.BackgroundColor3=Color3.fromRGB(255,255,255)
c0.BackgroundTransparency=0.95
c0.BorderColor3=Color3.fromRGB(0,0,0)
c0.BorderSizePixel=0
c0.ClipsDescendants=true
c0.LayoutOrder=1
c0.Position=UDim2.fromScale(1,0.5)
c0.Size=UDim2.new(0,100,0,25)

local c1=Instance.new"UICorner"
c1.Name="InputBoxUICorner"
c1.CornerRadius=UDim.new(0,4)
c1.Parent=c0

local c2=Instance.new"UIStroke"
c2.Name="InputBoxUIStroke"
c2.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
c2.Color=Color3.fromRGB(255,255,255)
c2.Transparency=0.9
c2.Parent=c0

local c3=Instance.new"UISizeConstraint"
c3.Name="InputBoxUISizeConstraint"
c3.Parent=c0

local c4=Instance.new"UIPadding"
c4.Name="InputBoxUIPadding"
c4.PaddingLeft=UDim.new(0,8)
c4.PaddingRight=UDim.new(0,10)
c4.Parent=c0

c0.Parent=cY

cY.Parent=cq

cq.Parent=cm

local c5=Instance.new"UIPadding"
c5.Name="UIPadding"
c5.PaddingRight=UDim.new(0,5)
c5.Parent=cm

cm.Parent=cd

local c6=Instance.new"Frame"
c6.Name="ColorWells"
c6.AutomaticSize=Enum.AutomaticSize.Y
c6.BackgroundColor3=Color3.fromRGB(255,255,255)
c6.BackgroundTransparency=1
c6.BorderColor3=Color3.fromRGB(0,0,0)
c6.BorderSizePixel=0
c6.LayoutOrder=2
c6.Position=UDim2.new(0,0,1.3,0)
c6.Size=UDim2.fromScale(1,0)

local c7=Instance.new"UIGridLayout"
c7.Name="UIGridLayout"
c7.CellPadding=UDim2.fromOffset(10,0)
c7.CellSize=UDim2.new(0.5,-5,0,30)
c7.SortOrder=Enum.SortOrder.LayoutOrder
c7.Parent=c6

local c8=Instance.new"ImageLabel"
c8.Name="NewColor"
c8.Image=q.grid
c8.ScaleType=Enum.ScaleType.Tile
c8.TileSize=UDim2.fromOffset(500,500)
c8.BackgroundColor3=Color3.fromRGB(255,255,255)
c8.BackgroundTransparency=1
c8.BorderColor3=Color3.fromRGB(0,0,0)
c8.BorderSizePixel=0
c8.Size=UDim2.fromOffset(100,100)

local c9=Instance.new"UICorner"
c9.Name="UICorner"
c9.Parent=c8

local da=Instance.new"Frame"
da.Name="Color"
da.AnchorPoint=Vector2.new(0.5,0.5)
da.BorderColor3=Color3.fromRGB(27,42,53)
da.BorderSizePixel=0
da.Position=UDim2.fromScale(0.5,0.5)
da.Size=UDim2.new(1,1,1,1)

local db=Instance.new"UICorner"
db.Name="UICorner"
db.Parent=da

da.Parent=c8

c8.Parent=c6

local dc=Instance.new"ImageLabel"
dc.Name="OldColor"
dc.Image=q.grid
dc.ScaleType=Enum.ScaleType.Tile
dc.TileSize=UDim2.fromOffset(500,500)
dc.BackgroundColor3=Color3.fromRGB(255,255,255)
dc.BackgroundTransparency=1
dc.BorderColor3=Color3.fromRGB(0,0,0)
dc.BorderSizePixel=0
dc.LayoutOrder=1
dc.Size=UDim2.fromOffset(100,100)

local dd=Instance.new"UICorner"
dd.Name="UICorner"
dd.Parent=dc

local de=Instance.new"Frame"
de.Name="Color"
de.AnchorPoint=Vector2.new(0.5,0.5)
de.BorderColor3=Color3.fromRGB(27,42,53)
de.BorderSizePixel=0
de.Position=UDim2.fromScale(0.5,0.5)
de.Size=UDim2.new(1,1,1,1)

local df=Instance.new"UICorner"
df.Name="UICorner"
df.Parent=de

de.Parent=dc

dc.Parent=c6

c6.Parent=cd

cd.Parent=b7

local dg=Instance.new"Frame"
dg.Name="Interactions"
dg.AutomaticSize=Enum.AutomaticSize.Y
dg.BackgroundColor3=Color3.fromRGB(0,0,0)
dg.BackgroundTransparency=1
dg.BorderColor3=Color3.fromRGB(0,0,0)
dg.BorderSizePixel=0
dg.LayoutOrder=2
dg.Size=UDim2.fromScale(1,0)

local dh=Instance.new"TextButton"
dh.Name="Confirm"
dh.FontFace=Font.new(
"rbxassetid://12187365364",
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
dh.Text="Confirm"
dh.TextColor3=Color3.fromRGB(255,255,255)
dh.TextSize=15
dh.TextTransparency=0.5
dh.TextTruncate=Enum.TextTruncate.AtEnd
dh.AutoButtonColor=false
dh.AutomaticSize=Enum.AutomaticSize.Y
dh.BackgroundColor3=Color3.fromRGB(85,57,139)
dh.BorderColor3=Color3.fromRGB(0,0,0)
dh.BorderSizePixel=0
dh.Position=UDim2.new(0,0,-0.333,0)
dh.Size=UDim2.new(0.485,0,1,0)

local di=Instance.new"UIPadding"
di.Name="UIPadding"
di.PaddingBottom=UDim.new(0,9)
di.PaddingLeft=UDim.new(0,10)
di.PaddingRight=UDim.new(0,10)
di.PaddingTop=UDim.new(0,9)
di.Parent=dh

local dj=Instance.new"UICorner"
dj.Name="BaseUICorner"
dj.CornerRadius=UDim.new(0,10)
dj.Parent=dh

dh.Parent=dg

local dk=Instance.new"TextButton"
dk.Name="Cancel"
dk.FontFace=Font.new(
"rbxassetid://12187365364",
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
dk.Text="Cancel"
dk.TextColor3=Color3.fromRGB(255,255,255)
dk.TextSize=15
dk.TextTransparency=0.5
dk.TextTruncate=Enum.TextTruncate.AtEnd
dk.AutoButtonColor=false
dk.AutomaticSize=Enum.AutomaticSize.Y
dk.BackgroundColor3=Color3.fromRGB(85,57,139)
dk.BorderColor3=Color3.fromRGB(0,0,0)
dk.BorderSizePixel=0
dk.Position=UDim2.new(0.516,0,-0.333,0)
dk.Size=UDim2.new(0.485,0,1,0)

local dl=Instance.new"UICorner"
dl.Name="BaseUICorner"
dl.CornerRadius=UDim.new(0,10)
dl.Parent=dk

local dm=Instance.new"UIPadding"
dm.Name="UIPadding"
dm.PaddingBottom=UDim.new(0,9)
dm.PaddingLeft=UDim.new(0,10)
dm.PaddingRight=UDim.new(0,10)
dm.PaddingTop=UDim.new(0,9)
dm.Parent=dk

dk.Parent=dg

local dn=Instance.new"UIPadding"
dn.Name="UIPadding"
dn.PaddingTop=UDim.new(0,10)
dn.Parent=dg

dg.Parent=b7

local dp=Instance.new"UIPadding"
dp.Name="GlobalSettingsUIPadding"
dp.PaddingBottom=UDim.new(0,20)
dp.PaddingLeft=UDim.new(0,20)
dp.PaddingRight=UDim.new(0,20)
dp.PaddingTop=UDim.new(0,20)
dp.Parent=b7

local dq=Instance.new"Frame"
dq.Name="Paragraph"
dq.BackgroundColor3=Color3.fromRGB(0,0,0)
dq.BackgroundTransparency=1
dq.BorderColor3=Color3.fromRGB(0,0,0)
dq.BorderSizePixel=0
dq.Size=UDim2.new(0.882,0,0.1,0)

local dr=Instance.new"TextLabel"
dr.Name="ParagraphHeader"
dr.FontFace=Font.new(
"rbxassetid://12187365364",
Enum.FontWeight.SemiBold,
Enum.FontStyle.Normal
)
dr.RichText=true
dr.Text=bX.Settings.Name
dr.TextColor3=Color3.fromRGB(255,255,255)
dr.TextSize=19
dr.TextTransparency=0.1
dr.TextWrapped=true
dr.TextYAlignment=Enum.TextYAlignment.Top
dr.TextXAlignment=Enum.TextXAlignment.Left
dr.AutomaticSize=Enum.AutomaticSize.XY
dr.BackgroundColor3=Color3.fromRGB(255,255,255)
dr.BackgroundTransparency=1
dr.BorderColor3=Color3.fromRGB(0,0,0)
dr.BorderSizePixel=0
dr.Size=UDim2.new(0.957,0,1,0)
dr.Parent=dq

local ds=Instance.new"UIListLayout"
ds.Name="UIListLayout"
ds.Padding=UDim.new(0,5)
ds.HorizontalAlignment=Enum.HorizontalAlignment.Center
ds.SortOrder=Enum.SortOrder.LayoutOrder
ds.Parent=dq

local dt=Instance.new"UIPadding"
dt.Name="UIPadding"
dt.PaddingBottom=UDim.new(0,15)
dt.Parent=dq

local du=Instance.new"Frame"
du.Name="Line"
du.BackgroundColor3=Color3.fromRGB(255,255,255)
du.BackgroundTransparency=1
du.BorderColor3=Color3.fromRGB(0,0,0)
du.BorderSizePixel=0
du.LayoutOrder=1
du.Size=UDim2.new(1,0,0,1)
du.Parent=dq

dq.Parent=b7

b7.Parent=b5

b5.Parent=D local

dv, dw, dx, dy=Color3.fromHSV, Color3.fromRGB, Vector2.new, UDim2.new

local dz=cn
local dA=cp
local dB=ce
local dC=da

local dD={
Hex=cY.InputBox,
Red=cs.InputBox,
Green=cA.InputBox,
Blue=cI.InputBox,
Alpha=cQ.InputBox
}

local dE=i:GetMouse()

local dF,dG=false,false
local dH,dI,dJ=0,0,1

local function toPolar(dK)
return math.atan2(dK.y,dK.x),dK.magnitude
end

local function radToDeg(dK)
return((dK+math.pi)/(2*math.pi))*360
end

local function degToRad(dK)
return dK*(math.pi/180)
end

local function hexToRGB(dK)
dK=dK:gsub("#","")
if#dK~=6 then return 0,0,0 end
local dL=tonumber(dK:sub(1,2),16)or 0
local dM=tonumber(dK:sub(3,4),16)or 0
local dN=tonumber(dK:sub(5,6),16)or 0
return dL,dM,dN
end

local function clampInput(dK,dL,dM)
local dN=tonumber(dK)
if dN then
return math.clamp(dN,dL,dM)
end
return dL
end

local function update()
local dK=dv(dH,dI,dJ)
dC.BackgroundColor3=dK
dC.BackgroundTransparency=clampInput(dD.Alpha.Text,0,1)

dD.Red.Text=tostring(math.floor(dK.r*255+0.5))
dD.Green.Text=tostring(math.floor(dK.g*255+0.5))
dD.Blue.Text=tostring(math.floor(dK.b*255+0.5))
dD.Alpha.Text=clampInput(dD.Alpha.Text,0,1)

local dL=string.format("#%02X%02X%02X",
math.floor(dK.r*255+0.5),
math.floor(dK.g*255+0.5),
math.floor(dK.b*255+0.5))
dD.Hex.Text=dL
end

local function UpdateSlide(dK)
local dL=dK-dB.AbsolutePosition.X
local dM=math.clamp(dL,0,dB.AbsoluteSize.X-cg.AbsoluteSize.X)
cg.Position=dy(0,dM,0.5,0)
dJ=1-(dM/(dB.AbsoluteSize.X-cg.AbsoluteSize.X))
update()
end

local function UpdateRing(dK,dL)
local dM=dz.AbsoluteSize.x/2
local dN=dx(dK,dL)-dz.AbsolutePosition-dz.AbsoluteSize/2

if dN:Dot(dN)>dM*dM then
dN=dN.unit*dM
end

dA.Position=dy(0.5,dN.x,0.5,dN.y)
local dO,dP=toPolar(dN*dx(1,-1))
dH,dI=radToDeg(dO)/360,math.clamp(dP/dM,0,1)
dB.BackgroundColor3=dv(dH,dI,1)
update()
end

local function UpdateSlideFromValue(dK)
local dL=(1-dK)*(dB.AbsoluteSize.X-cg.AbsoluteSize.X)
cg.Position=UDim2.new(0,dL,0.5,0)
end

local function UpdateRingFromHSV(dK,dL)
local dM=dz.AbsoluteSize.X/2
local dN=degToRad(dK*360)
local dO=dL*dM
local dP=dO*math.cos(dN)
local dQ=dO*math.sin(dN)

dA.Position=UDim2.new(0.5,-dP,0.5,dQ)
dB.BackgroundColor3=dv(dK,dL,1)
end

local function updateFromRGB()
local dK=clampInput(dD.Red.Text,0,255)
local dL=clampInput(dD.Green.Text,0,255)
local dM=clampInput(dD.Blue.Text,0,255)
dD.Red.Text=dK
dD.Green.Text=dL
dD.Blue.Text=dM

dH,dI,dJ=Color3.fromRGB(dK,dL,dM):ToHSV()

UpdateSlideFromValue(dJ)
UpdateRingFromHSV(dH,dI)
update()
end

local function updateFromHex()
local dK=dD.Hex.Text
local dL,dM,dN=hexToRGB(dK)

dL=clampInput(dL,0,255)
dM=clampInput(dM,0,255)
dN=clampInput(dN,0,255)

dD.Red.Text=dL
dD.Green.Text=dM
dD.Blue.Text=dN

dH,dI,dJ=Color3.fromRGB(dL,dM,dN):ToHSV()
UpdateSlideFromValue(dJ)
UpdateRingFromHSV(dH,dI)
update()
end

local function updateFromSettings()
local dK=math.floor(bX.Color.R*255+0.5)
local dL=math.floor(bX.Color.G*255+0.5)
local dM=math.floor(bX.Color.B*255+0.5)
dD.Red.Text=dK
dD.Green.Text=dL
dD.Blue.Text=dM
dD.Alpha.Text=bY and bX.Alpha or 0

local dN=string.format("#%02X%02X%02X",dK,dL,dM)
dD.Hex.Text=dN

dH,dI,dJ=Color3.fromRGB(dK,dL,dM):ToHSV()

de.BackgroundColor3=bX.Color
de.BackgroundTransparency=bY and bX.Alpha or 0

dC.BackgroundColor3=Color3.fromRGB(dK,dL,dM)
dC.BackgroundTransparency=bY and bX.Alpha or 0

UpdateSlideFromValue(dJ)
UpdateRingFromHSV(dH,dI)
end

dz.InputBegan:Connect(function(dK)
if dK.UserInputType==Enum.UserInputType.MouseButton1 or dK.UserInputType==Enum.UserInputType.Touch then
dF=true
UpdateRing(dE.X,dE.Y)
end
end)

dB.InputBegan:Connect(function(dK)
if dK.UserInputType==Enum.UserInputType.MouseButton1 or dK.UserInputType==Enum.UserInputType.Touch then
dG=true
UpdateSlide(dE.X)
end
end)

dB.InputEnded:Connect(function(dK)
if dK.UserInputType==Enum.UserInputType.MouseButton1 or dK.UserInputType==Enum.UserInputType.Touch then
dG=false
end
end)

dz.InputEnded:Connect(function(dK)
if dK.UserInputType==Enum.UserInputType.MouseButton1 or dK.UserInputType==Enum.UserInputType.Touch then
dF=false
end
end)

f.InputChanged:Connect(function(dK)
if dK.UserInputType==Enum.UserInputType.MouseMovement or dK.UserInputType==Enum.UserInputType.Touch then
if dG then
UpdateSlide(dE.X)
elseif dF then
UpdateRing(dE.X,dE.Y)
end
end
end)

local function onFocusEnter(dK)
local dL=dK.Text
dK.Text=""
dK.PlaceholderText=dL
end

dD.Hex.FocusLost:Connect(updateFromHex)
dD.Red.FocusLost:Connect(updateFromRGB)
dD.Green.FocusLost:Connect(updateFromRGB)
dD.Blue.FocusLost:Connect(updateFromRGB)
dD.Alpha.FocusLost:Connect(update)

dD.Hex.Focused:Connect(function()
onFocusEnter(dD.Hex)
end)
dD.Red.Focused:Connect(function()
onFocusEnter(dD.Red)
end)
dD.Green.Focused:Connect(function()
onFocusEnter(dD.Green)
end)
dD.Blue.Focused:Connect(function()
onFocusEnter(dD.Blue)
end)
dD.Alpha.Focused:Connect(function()
onFocusEnter(dD.Alpha)
end)

local function makeCanvas()
local dK=Instance.new"CanvasGroup"
dK.Name="ColorPickerCanvas"
dK.BackgroundTransparency=1
dK.BorderSizePixel=0
dK.Size=UDim2.fromScale(1,1)
dK.ZIndex=5
dK.GroupTransparency=1
dK.Parent=D
dK.Visible=false
return dK
end

local function transition(dK)
local dL=makeCanvas()
local dM=dK and 0 or 1
local dN=dK and 1 or 0.95
local dO=dK and 1 or 0
local dP=TweenInfo.new(0.1,Enum.EasingStyle.Sine)
local dQ=Tween(dL,dP,{GroupTransparency=dM})
local dR=Tween(cb,dP,{Scale=dN})

b5.Visible=true
b5.Parent=dL
dL.Visible=true
dL.GroupTransparency=dO
dQ:Play()
dR:Play()
dQ.Completed:Wait()

if not dK then
b5.Visible=false
dL.Visible=false
end

b5.Parent=D
dL:Destroy()
end

local function colorpickerIn()
transition(true)
end

local function colorpickerOut()
transition(false)
end

b3.MouseButton1Click:Connect(colorpickerIn)

dk.MouseButton1Click:Connect(colorpickerOut)
dh.MouseButton1Click:Connect(function()
colorpickerOut()
local dK=dv(dH,dI,dJ)
bX.Color=Color3.fromRGB(dK.r*255,dK.g*255,dK.b*255)
bX.Alpha=bY and clampInput(dD.Alpha.Text,0,1)

de.BackgroundColor3=bX.Color
de.BackgroundTransparency=bY and bX.Alpha or 0

b1.BackgroundColor3=bX.Color
b1.BackgroundTransparency=bY and bX.Alpha or 0

if bX.Settings.Callback then
task.spawn(function()
bX.Settings.Callback(bX.Color,bY and bX.Alpha)
end)
end
end)

updateFromSettings()

function bX.UpdateName(dK,dL)
b_.Text=dL
end
function bX.SetVisibility(dK,dL)
bZ.Visible=dL
end

function bX.SetColor(dK,dL)
bX.Color=dL
b1.BackgroundColor3=dL

local dM=math.floor(bX.Color.R*255+0.5)
local dN=math.floor(bX.Color.G*255+0.5)
local dO=math.floor(bX.Color.B*255+0.5)
dD.Red.Text=dM
dD.Green.Text=dN
dD.Blue.Text=dO

local dP=string.format("#%02X%02X%02X",dM,dN,dO)
dD.Hex.Text=dP

dH,dI,dJ=Color3.fromRGB(dM,dN,dO):ToHSV()

de.BackgroundColor3=bX.Color
dC.BackgroundColor3=Color3.fromRGB(dM,dN,dO)

UpdateSlideFromValue(dJ)
UpdateRingFromHSV(dH,dI)

if bX.Settings.Callback then
task.spawn(function()
bX.Settings.Callback(bX.Color,bY and bX.Alpha)
end)
end
end

function bX.SetAlpha(dK,dL)
bX.Alpha=dL
b1.Transparency=dL
updateFromSettings()
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Header(bU,bV,bW)
local bX={Settings=bV}
local bY=bP~=nil
local bZ=not bY




local b_=Instance.new"Frame"
b_.Name="Header"
b_.AutomaticSize=Enum.AutomaticSize.Y
b_.BackgroundColor3=Color3.fromRGB(0,0,0)
b_.BackgroundTransparency=1
b_.BorderColor3=Color3.fromRGB(0,0,0)
b_.BorderSizePixel=0
b_.LayoutOrder=0
b_.Size=UDim2.fromScale(1,0)
b_.Parent=bJ


if bZ then
bP=b_

local b0=Instance.new"UIPadding"
b0.Name="UIPadding"
b0.PaddingBottom=UDim.new(0,3)
b0.PaddingTop=UDim.new(0,0)
b0.Parent=b_

bS=Instance.new"TextButton"
bS.Name="HeaderButton"
bS.AutoButtonColor=false
bS.BackgroundColor3=Color3.fromRGB(255,255,255)
bS.BackgroundTransparency=1
bS.BorderColor3=Color3.fromRGB(0,0,0)
bS.BorderSizePixel=0
bS.LayoutOrder=0
bS.Size=UDim2.fromScale(1,0)
bS.AutomaticSize=Enum.AutomaticSize.Y
bS.Text=""
bS.Parent=b_

local b1=Instance.new"UIPadding"
b1.Name="HeaderButtonPadding"
b1.PaddingLeft=UDim.new(0,0)
b1.PaddingRight=UDim.new(0,0)
b1.Parent=bS

local b3=Instance.new"TextLabel"
b3.Name="HeaderText"
b3.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
b3.RichText=true
b3.Text=bX.Settings.Text or bX.Settings.Name
b3.TextColor3=Color3.fromRGB(240,240,240)
b3.TextSize=16
b3.TextTransparency=0.1
b3.TextWrapped=true
b3.TextXAlignment=Enum.TextXAlignment.Left
b3.AutomaticSize=Enum.AutomaticSize.Y
b3.BackgroundColor3=Color3.fromRGB(255,255,255)
b3.BackgroundTransparency=1
b3.BorderColor3=Color3.fromRGB(0,0,0)
b3.BorderSizePixel=0
b3.Size=UDim2.new(1,-28,0,0)
b3.Parent=bS


bQ=Instance.new"ImageLabel"
bQ.Name="CollapseIcon"
bQ.AnchorPoint=Vector2.new(1,0.5)
bQ.BackgroundColor3=Color3.fromRGB(255,255,255)
bQ.BackgroundTransparency=1
bQ.BorderColor3=Color3.fromRGB(0,0,0)
bQ.BorderSizePixel=0
bQ.Position=UDim2.new(1,-4,0.5,0)
bQ.Size=UDim2.fromOffset(16,16)
bQ.ImageTransparency=0.1
bQ.Parent=bS

bR=Instance.new"TextLabel"
bR.Name="CollapseText"
bR.Visible=false
bR.AnchorPoint=Vector2.new(1,0.5)
bR.BackgroundTransparency=1
bR.BorderSizePixel=0
bR.Position=UDim2.new(1,-2,0.5,0)
bR.Size=UDim2.fromOffset(14,14)
bR.FontFace=Font.new(q.interFont,Enum.FontWeight.SemiBold,Enum.FontStyle.Normal)
bR.TextColor3=Color3.fromRGB(200,200,200)
bR.TextSize=14
bR.TextTransparency=0.3
bR.Text=""
bR.Parent=bS

local b5=TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)

local function setHoverState(b7)
local b8=b7 and 0 or 0.1
Tween(b3,b5,{TextTransparency=b8}):Play()
if bQ and bQ.Visible then
Tween(bQ,b5,{
ImageTransparency=b7 and 0.1 or 0.3,
ImageColor3=b7 and Color3.fromRGB(255,255,255)or Color3.fromRGB(200,200,200)
}):Play()
end
if bR and bR.Visible then
Tween(bR,b5,{
TextTransparency=b7 and 0.1 or 0.3,
TextColor3=b7 and Color3.fromRGB(255,255,255)or Color3.fromRGB(200,200,200)
}):Play()
end
end

bS.MouseEnter:Connect(function()
setHoverState(true)
end)

bS.MouseLeave:Connect(function()
setHoverState(false)
end)

local function runToggleCallback()
local b7=bX.Settings.OnToggle or bX.Settings.ToggleCallback or bX.Settings.Callback
if typeof(b7)=="function"then
task.spawn(b7,bO)
end
end

bS.MouseButton1Click:Connect(function()

if not bZ then return end
if bX.Settings.Collapsible==false then
return
end
setCollapsed(not bO)
runToggleCallback()
end)

local b7=bO
if not bY and typeof(bX.Settings.Collapsed)=="boolean"then
b7=bX.Settings.Collapsed
end

setCollapsed(b7)

if bX.Settings.Collapsible==false then
if bO then
setCollapsed(false)
end
bS.Selectable=false
bS.Active=false
if bQ then
bQ.Visible=false
end
if bR then
bR.Visible=false
end
end

setHoverState(false)

function bX.UpdateName(b8,b9)
b3.Text=b9
end
function bX.SetVisibility(b8,b9)
b_.Visible=b9
updateSectionChildren()
end
function bX.SetCollapsed(b8,b9,ca)
setCollapsed(b9 and true or false)
if not ca then
runToggleCallback()
end
end
function bX.Toggle(b8)
bX:SetCollapsed(not bO)
end
function bX.IsCollapsed(b8)
return bO
end
else

local b0=Instance.new"TextLabel"
b0.Name="HeaderText"
b0.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
b0.RichText=true
b0.Text=bX.Settings.Text or bX.Settings.Name
b0.TextColor3=Color3.fromRGB(240,240,240)
b0.TextSize=16
b0.TextTransparency=0.1
b0.TextWrapped=true
b0.TextXAlignment=Enum.TextXAlignment.Left
b0.AutomaticSize=Enum.AutomaticSize.Y
b0.BackgroundColor3=Color3.fromRGB(255,255,255)
b0.BackgroundTransparency=1
b0.BorderColor3=Color3.fromRGB(0,0,0)
b0.BorderSizePixel=0
b0.Size=UDim2.fromScale(1,0)
b0.Parent=b_

local b1=Instance.new"UIPadding"
b1.Name="HeaderPadding"
b1.PaddingBottom=UDim.new(0,5)
b1.Parent=b_

function bX.UpdateName(b3,b5)
b0.Text=b5
end
function bX.SetVisibility(b3,b5)
b_.Visible=b5
end
function bX.SetCollapsed(b3,b5,b7)

end
function bX.Toggle(b3)

end
function bX.IsCollapsed(b3)
return false
end
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Label(bU,bV,bW)
local bX={Settings=bV}

local bY=Instance.new"Frame"
bY.Name="Label"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,20)
bY.Parent=bJ

local bZ=Instance.new"TextLabel"
bZ.Name="LabelText"
bZ.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
bZ.RichText=true
bZ.Text=bX.Settings.Text or bX.Settings.Name
bZ.TextColor3=Color3.fromRGB(240,240,240)
bZ.TextSize=14
bZ.TextTransparency=0.4
bZ.TextWrapped=true
bZ.TextXAlignment=Enum.TextXAlignment.Left
bZ.AutomaticSize=Enum.AutomaticSize.Y
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Size=UDim2.fromScale(1,1)
bZ.Parent=bY

function bX.UpdateName(b_,b0)
bZ.Text=b0
end
function bX.SetVisibility(b_,b0)
bY.Visible=b0
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.SubLabel(bU,bV,bW)
local bX={Settings=bV}

local bY=Instance.new"Frame"
bY.Name="SubLabel"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,0)
bY.Parent=bJ

local bZ=Instance.new"TextLabel"
bZ.Name="SubLabelText"
bZ.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium,Enum.FontStyle.Normal)
bZ.RichText=true
bZ.Text=bX.Settings.Text or bX.Settings.Name
bZ.TextColor3=Color3.fromRGB(240,240,240)
bZ.TextSize=12
bZ.TextTransparency=0.5
bZ.TextWrapped=true
bZ.TextXAlignment=Enum.TextXAlignment.Left
bZ.AutomaticSize=Enum.AutomaticSize.Y
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Size=UDim2.fromScale(1,1)
bZ.Parent=bY

function bX.UpdateName(b_,b0)
bZ.Text=b0
end
function bX.SetVisibility(b_,b0)
bY.Visible=b0
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Paragraph(bU,bV,bW)
local bX={Settings=bV}

local bY=Instance.new"Frame"
bY.Name="Paragraph"
bY.AutomaticSize=Enum.AutomaticSize.Y
bY.BackgroundColor3=Color3.fromRGB(0,0,0)
bY.BackgroundTransparency=1
bY.BorderColor3=Color3.fromRGB(0,0,0)
bY.BorderSizePixel=0
bY.Size=UDim2.new(1,0,0,38)
bY.Parent=bJ

local bZ=Instance.new"TextLabel"
bZ.Name="ParagraphHeader"
bZ.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
bZ.RichText=true
bZ.Text=bX.Settings.Header
bZ.TextColor3=Color3.fromRGB(240,240,240)
bZ.TextSize=15
bZ.TextTransparency=0.1
bZ.TextWrapped=true
bZ.TextXAlignment=Enum.TextXAlignment.Left
bZ.AutomaticSize=Enum.AutomaticSize.Y
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=1
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Size=UDim2.fromScale(1,0)
bZ.Parent=bY

local b_=Instance.new"UIListLayout"
b_.Name="UIListLayout"
b_.Padding=UDim.new(0,5)
b_.SortOrder=Enum.SortOrder.LayoutOrder
b_.Parent=bY

local b0=Instance.new"TextLabel"
b0.Name="ParagraphBody"
b0.FontFace=Font.new(q.interFont)
b0.RichText=true
b0.Text=bX.Settings.Body
b0.TextColor3=Color3.fromRGB(240,240,240)
b0.TextSize=13
b0.TextTransparency=0.4
b0.TextWrapped=true
b0.TextXAlignment=Enum.TextXAlignment.Left
b0.AutomaticSize=Enum.AutomaticSize.Y
b0.BackgroundColor3=Color3.fromRGB(255,255,255)
b0.BackgroundTransparency=1
b0.BorderColor3=Color3.fromRGB(0,0,0)
b0.BorderSizePixel=0
b0.LayoutOrder=1
b0.Size=UDim2.fromScale(1,0)
b0.Parent=bY

function bX.UpdateHeader(b1,b3)
bZ.Text=b3
end
function bX.UpdateBody(b1,b3)
b0.Text=b3
end
function bX.SetVisibility(b1,b3)
bY.Visible=b3
end

if bW then
a.Options[bW]=bX
end
return bX
end

function bI.Divider(bU)
local bV={}

local bW=Instance.new"Frame"
bW.Name="Divider"
bW.AnchorPoint=Vector2.new(0,1)
bW.AutomaticSize=Enum.AutomaticSize.Y
bW.BackgroundColor3=Color3.fromRGB(255,255,255)
bW.BackgroundTransparency=1
bW.BorderColor3=Color3.fromRGB(0,0,0)
bW.BorderSizePixel=0
bW.Position=UDim2.fromScale(0,1)
bW.Size=UDim2.new(1,0,0,1)
bW.Parent=bJ

local bX=Instance.new"UIPadding"
bX.Name="UIPadding"
bX.PaddingBottom=UDim.new(0,8)
bX.PaddingTop=UDim.new(0,8)
bX.Parent=bW

local bY=Instance.new"UIListLayout"
bY.Name="UIListLayout"
bY.SortOrder=Enum.SortOrder.LayoutOrder
bY.Parent=bW

local bZ=Instance.new"Frame"
bZ.Name="Line"
bZ.BackgroundColor3=Color3.fromRGB(255,255,255)
bZ.BackgroundTransparency=0.9
bZ.BorderColor3=Color3.fromRGB(0,0,0)
bZ.BorderSizePixel=0
bZ.Size=UDim2.new(1,0,0,1)
bZ.Parent=bW

function bV.Remove(b_)
bW:Destroy()
end
function bV.SetVisibility(b_,b0)
bW.Visible=b0
end

return bV
end

function bI.Spacer(bU)
local bV={}

local bW=Instance.new"Frame"
bW.Name="Spacer"
bW.AnchorPoint=Vector2.new(0,1)
bW.BackgroundColor3=Color3.fromRGB(255,255,255)
bW.BackgroundTransparency=1
bW.BorderColor3=Color3.fromRGB(0,0,0)
bW.BorderSizePixel=0
bW.Position=UDim2.fromScale(0,1)
bW.Parent=bJ

function bV.Remove(bX)
bW:Destroy()
end
function bV.SetVisibility(bX,bY)
bW.Visible=bY
end

return bV
end

return bI
end

local function SelectCurrentTab()
local bG=0.25

if n then
n.Parent=nil
end

for bH,bI in pairs(m)do
Tween(bH,TweenInfo.new(bG,Enum.EasingStyle.Sine),{
BackgroundTransparency=(bH==bs and 0.55 or 1)
}):Play()

if bI.tabStroke then
Tween(bI.tabStroke,TweenInfo.new(bG,Enum.EasingStyle.Sine),{
Transparency=(bH==bs and 0.6 or 1)
}):Play()
end
if bI.switcherImage then
Tween(bI.switcherImage,TweenInfo.new(bG,Enum.EasingStyle.Sine),{
ImageTransparency=(bH==bs and 0.1 or 0.5)
}):Play()
end
if bI.switcherName then
Tween(bI.switcherName,TweenInfo.new(bG,Enum.EasingStyle.Sine),{
TextTransparency=(bH==bs and 0.1 or 0.5)
}):Play()
end
end

m[bs].tabContent.Parent=aK
n=m[bs].tabContent
a2.Text=bq.Name
end

bs.MouseButton1Click:Connect(function()
SelectCurrentTab()
end)

function br.Select(bG)
SelectCurrentTab()
end

function br.InsertConfigSection(bG,bH)
local bI=br:Section{Side="Left"}
bI:Header{Text="Configuration"}

if h then
bI:Label{Text="Config system unavailable. (Environment isStudio)"}
return"Config system unavailable."
end

local bJ
local bK

bI:Input{
Name="Config Name",
Placeholder="Name",
AcceptedCharacters="All",
Callback=function(bL)
bJ=bL
end,
}

local bL=bI:Dropdown{
Name="Select Config",
Multi=false,
Required=false,
Options=a:RefreshConfigList(),
Callback=function(bL)
bK=bL
end,
}

bI:Button{
Name="Create Config",
Callback=function()
if not bJ or string.gsub(bJ," ","")==""then
v:Notify{
Title="Interface",
Description="Config name cannot be empty."
}
return
end

local bM,bN=a:SaveConfig(bJ)
if not bM then
v:Notify{
Title="Interface",
Description="Unable to save config, return error: "..bN
}
end

v:Notify{
Title="Interface",
Description=string.format("Created config %q",bJ),
}

bL:ClearOptions()
bL:InsertOptions(a:RefreshConfigList())
end,
}

bI:Button{
Name="Load Config",
Callback=function()
local bM,bN=a:LoadConfig(bL.Value)
if not bM then
v:Notify{
Title="Interface",
Description="Unable to load config, return error: "..bN
}
return
end

v:Notify{
Title="Interface",
Description=string.format("Loaded config %q",bL.Value),
}
end,
}

bI:Button{
Name="Overwrite Config",
Callback=function()
local bM,bN=a:SaveConfig(bL.Value)
if not bM then
v:Notify{
Title="Interface",
Description="Unable to overwrite config, return error: "..bN
}
return
end

v:Notify{
Title="Interface",
Description=string.format("Overwrote config %q",bL.Value),
}
end,
}

bI:Button{
Name="Refresh Config List",
Callback=function()
bL:ClearOptions()
bL:InsertOptions(a:RefreshConfigList())
end,
}

bI:Divider()

bI:Button{
Name="Export Config to Clipboard",
Callback=function()
local bM,bN=a:ExportConfig()
if not bM then
v:Notify{
Title="Export Failed",
Description=bN or"Unknown error",
Lifetime=3
}
else
v:Notify{
Title="Export Success",
Description="Config copied to clipboard!",
Lifetime=3
}
end
end,
}

local bM

bI:Input{
Name="Import from Clipboard",
Placeholder="Paste config here",
AcceptedCharacters="All",
Callback=function(bN)
bM=bN
end,
}

bI:Button{
Name="Import Config",
Callback=function()
if not bM or bM==""then
v:Notify{
Title="Import Failed",
Description="Please paste config data first",
Lifetime=3
}
return
end

local bN,bO=a:ImportConfig(bM)
if not bN then
v:Notify{
Title="Import Failed",
Description=bO or"Unknown error",
Lifetime=3
}
else
v:Notify{
Title="Import Success",
Description="Config loaded successfully!",
Lifetime=3
}
end
end,
}

bI:Divider()

local bN

bI:Button{
Name="Set as autoload",
Callback=function()
local bO=bL.Value
writefile(a.Folder.."/settings/autoload.txt",bO)
bN:UpdateName("Autoload config: "..bO)
v:Notify{
Title="Interface",
Description=string.format("Set %q as autoload",bO),
}
end,
}

bN=bI:Label{Text="Autoload config: None"}

if isfile(a.Folder.."/settings/autoload.txt")then
local bO=readfile(a.Folder.."/settings/autoload.txt")
bN:UpdateName("Autoload config: "..bO)
end
end

m[bs]={
tabContent=bz,
tabStroke=bu,
switcherImage=bw,
switcherName=bx,
}

return br
end

return bj
end











function v.Notify(bi,bj)
local bk={}


local bl={
default={
bg=Color3.fromRGB(24,24,27),
border=Color3.fromRGB(63,63,70),
accent=Color3.fromRGB(90,80,115),
title=Color3.fromRGB(250,250,250),
desc=Color3.fromRGB(161,161,170)
},
success={
bg=Color3.fromRGB(20,83,45),
border=Color3.fromRGB(34,197,94),
accent=Color3.fromRGB(34,197,94),
title=Color3.fromRGB(240,253,244),
desc=Color3.fromRGB(134,239,172)
},
error={
bg=Color3.fromRGB(127,29,29),
border=Color3.fromRGB(239,68,68),
accent=Color3.fromRGB(239,68,68),
title=Color3.fromRGB(254,242,242),
desc=Color3.fromRGB(252,165,165)
},
warning={
bg=Color3.fromRGB(120,53,15),
border=Color3.fromRGB(249,115,22),
accent=Color3.fromRGB(249,115,22),
title=Color3.fromRGB(255,247,237),
desc=Color3.fromRGB(253,186,116)
},
info={
bg=Color3.fromRGB(12,74,110),
border=Color3.fromRGB(59,130,246),
accent=Color3.fromRGB(59,130,246),
title=Color3.fromRGB(239,246,255),
desc=Color3.fromRGB(147,197,253)
}
}

local bm=bl[bj.Variant or"default"]or bl.default

local bn=Instance.new"Frame"
bn.Name="Notification"
bn.AnchorPoint=Vector2.new(0.5,0.5)
bn.AutomaticSize=Enum.AutomaticSize.Y
bn.BackgroundColor3=bm.bg
bn.BackgroundTransparency=0.05
bn.BorderColor3=Color3.fromRGB(0,0,0)
bn.BorderSizePixel=0
bn.Position=UDim2.fromScale(0.5,0.5)
bn.Size=UDim2.fromOffset(bj.SizeX or 320,0)
bn.ClipsDescendants=false

bn.Parent=x


local bo=Instance.new"ImageLabel"
bo.Name="Shadow"
bo.Image="rbxassetid://5554236805"
bo.ImageColor3=Color3.fromRGB(0,0,0)
bo.ImageTransparency=0.7
bo.ScaleType=Enum.ScaleType.Slice
bo.SliceCenter=Rect.new(23,23,277,277)
bo.AnchorPoint=Vector2.new(0.5,0.5)
bo.BackgroundTransparency=1
bo.Position=UDim2.fromScale(0.5,0.5)
bo.Size=UDim2.new(1,30,1,30)
bo.ZIndex=0
bo.Parent=bn

local bp=Instance.new"UIStroke"
bp.Name="NotificationUIStroke"
bp.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
bp.Color=bm.border
bp.Transparency=0.5
bp.Thickness=1
bp.Parent=bn

local bq=Instance.new"UICorner"
bq.Name="NotificationUICorner"
bq.CornerRadius=UDim.new(0,12)
bq.Parent=bn

local br=Instance.new"UIScale"
br.Name="NotificationUIScale"
br.Parent=bn
br.Scale=0.8

local bs=Instance.new"Frame"
bs.Name="NotificationInformation"
bs.AutomaticSize=Enum.AutomaticSize.Y
bs.BackgroundColor3=Color3.fromRGB(255,255,255)
bs.BackgroundTransparency=1
bs.BorderColor3=Color3.fromRGB(0,0,0)
bs.BorderSizePixel=0
bs.Size=UDim2.new(1,0,0,0)
bs.Parent=bn

local bt=Instance.new"UIListLayout"
bt.Name="NotificationUIListLayout"
bt.Padding=UDim.new(0,4)
bt.SortOrder=Enum.SortOrder.LayoutOrder
bt.Parent=bs

local bu=Instance.new"TextLabel"
bu.Name="NotificationTitle"
bu.FontFace=Font.new(
q.interFont,
Enum.FontWeight.SemiBold,
Enum.FontStyle.Normal
)
bu.RichText=true
bu.Text=bj.Title
bu.TextColor3=bm.title
bu.TextSize=14
bu.TextTransparency=0
bu.TextTruncate=Enum.TextTruncate.SplitWord
bu.TextXAlignment=Enum.TextXAlignment.Left
bu.TextYAlignment=Enum.TextYAlignment.Top
bu.AutomaticSize=Enum.AutomaticSize.Y
bu.BackgroundColor3=Color3.fromRGB(255,255,255)
bu.BackgroundTransparency=1
bu.BorderColor3=Color3.fromRGB(0,0,0)
bu.BorderSizePixel=0
bu.Size=UDim2.new(1,0,0,0)
bu.LayoutOrder=1
bu.Parent=bs

local bv=Instance.new"TextLabel"
bv.Name="NotificationDescription"
bv.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
bv.Text=bj.Description
bv.TextColor3=bm.desc
bv.TextSize=12
bv.TextTransparency=0
bv.TextWrapped=true
bv.RichText=true
bv.TextXAlignment=Enum.TextXAlignment.Left
bv.TextYAlignment=Enum.TextYAlignment.Top
bv.AutomaticSize=Enum.AutomaticSize.Y
bv.BackgroundColor3=Color3.fromRGB(255,255,255)
bv.BackgroundTransparency=1
bv.BorderColor3=Color3.fromRGB(0,0,0)
bv.BorderSizePixel=0
bv.Size=UDim2.new(1,0,0,0)
bv.LayoutOrder=2
bv.Parent=bs

local bw=Instance.new"UIPadding"
bw.Name="NotificationUIPadding"
bw.PaddingBottom=UDim.new(0,14)
bw.PaddingLeft=UDim.new(0,16)
bw.PaddingRight=UDim.new(0,40)
bw.PaddingTop=UDim.new(0,14)
bw.Parent=bs

local bx=Instance.new"Frame"
bx.Name="NotificationControls"
bx.BackgroundColor3=Color3.fromRGB(255,255,255)
bx.BackgroundTransparency=1
bx.BorderColor3=Color3.fromRGB(0,0,0)
bx.BorderSizePixel=0
bx.Size=UDim2.fromScale(1,1)
bx.ZIndex=10

local by=Instance.new"TextButton"
by.Name="Interactable"
by.FontFace=Font.new(q.interFont,Enum.FontWeight.Medium)
by.Text="×"
by.TextColor3=bm.desc
by.TextSize=20
by.TextTransparency=0.3
by.AnchorPoint=Vector2.new(1,0)
by.AutomaticSize=Enum.AutomaticSize.XY
by.BackgroundColor3=Color3.fromRGB(255,255,255)
by.BackgroundTransparency=1
by.BorderColor3=Color3.fromRGB(0,0,0)
by.BorderSizePixel=0
by.Position=UDim2.new(1,-12,0,10)
by.ZIndex=11
by.Parent=bx


by.MouseEnter:Connect(function()
Tween(by,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{
TextTransparency=0
}):Play()
end)

by.MouseLeave:Connect(function()
Tween(by,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{
TextTransparency=0.3
}):Play()
end)

bx.Parent=bn

local bz={
In=Tween(br,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
Scale=bj.Scale or 1
}),
Out=Tween(br,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
Scale=0.8
}),
FadeOut=Tween(bn,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
BackgroundTransparency=1
}),
}

local bA={
None=function()by:Destroy()end,
Confirm=function()
by.Text="✓"
by.TextSize=18
end,
Cancel=function()
by.Text="×"
by.TextSize=20
end
}

local bB=bA[bj.Style]or function()by:Destroy()end
bB()

if by then
by.MouseButton1Click:Connect(function()
bk:Cancel()
if bj.Callback then
task.spawn(bj.Callback)
end
end)
end

local bC=task.spawn(function()
bz.In:Play()

bj.Lifetime=bj.Lifetime or 3

if bj.Lifetime~=0 then
task.wait(bj.Lifetime)


local bC=bz.Out
local bD=bz.FadeOut
bC:Play()
bD:Play()


Tween(bp,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
Transparency=1
}):Play()
Tween(bo,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
ImageTransparency=1
}):Play()

bC.Completed:Wait()
bn:Destroy()
end
end)

function bk.UpdateTitle(bD,bE)
bu.Text=bE
end

function bk.UpdateDescription(bD,bE)
bv.Text=bE
end

function bk.Resize(bD,bE)
local bF=bE or 250
bn.Size=UDim2.fromOffset(bF,0)
end

function bk.Cancel(bD)
task.cancel(bC)

local bE=bz.Out
local bF=bz.FadeOut
bE:Play()
bF:Play()


Tween(bp,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
Transparency=1
}):Play()
Tween(bo,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
ImageTransparency=1
}):Play()

bE.Completed:Wait()
bn:Destroy()
end

return bk
end

function v.Dialog(bi,bj)
local bk={}

local bl=Instance.new"CanvasGroup"
bl.Name="DialogCanvas"
bl.BackgroundColor3=Color3.fromRGB(255,255,255)
bl.BackgroundTransparency=1
bl.BorderColor3=Color3.fromRGB(0,0,0)
bl.BorderSizePixel=0
bl.Size=UDim2.fromScale(1,1)
bl.GroupTransparency=1
bl.Parent=D

local bm=Instance.new"Frame"
bm.Name="Dialog"
bm.BackgroundColor3=Color3.fromRGB(0,0,0)
bm.BackgroundTransparency=0.5
bm.BorderColor3=Color3.fromRGB(0,0,0)
bm.BorderSizePixel=0
bm.Size=UDim2.fromScale(1,1)

local bn=Instance.new"UICorner"
bn.Name="BaseUICorner"
bn.CornerRadius=UDim.new(0,10)
bn.Parent=bm

local bo=Instance.new"Frame"
bo.Name="Prompt"
bo.AnchorPoint=Vector2.new(0.5,0.5)
bo.AutomaticSize=Enum.AutomaticSize.Y
bo.BackgroundColor3=Color3.fromRGB(22,22,26)
bo.BorderColor3=Color3.fromRGB(0,0,0)
bo.BorderSizePixel=0
bo.Position=UDim2.fromScale(0.5,0.5)
bo.Size=UDim2.fromOffset(360,0)

local bp=Instance.new"UIScale"
bp.Name="BaseUIScale"
bp.Parent=bo
bp.Scale=0.95

local bq=Instance.new"UIStroke"
bq.Name="GlobalSettingsUIStroke"
bq.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
bq.Color=Color3.fromRGB(65,65,75)
bq.Transparency=0.4
bq.Thickness=1.5
bq.Parent=bo

local br=Instance.new"UICorner"
br.Name="GlobalSettingsUICorner"
br.CornerRadius=UDim.new(0,14)
br.Parent=bo

local bs=Instance.new"UIPadding"
bs.Name="GlobalSettingsUIPadding"
bs.PaddingBottom=UDim.new(0,24)
bs.PaddingLeft=UDim.new(0,24)
bs.PaddingRight=UDim.new(0,24)
bs.PaddingTop=UDim.new(0,24)
bs.Parent=bo

local bt=Instance.new"Frame"
bt.Name="Paragraph"
bt.AutomaticSize=Enum.AutomaticSize.Y
bt.BackgroundColor3=Color3.fromRGB(0,0,0)
bt.BackgroundTransparency=1
bt.BorderColor3=Color3.fromRGB(0,0,0)
bt.BorderSizePixel=0
bt.Size=UDim2.new(1,0,0,38)

local bu=Instance.new"TextLabel"
bu.Name="ParagraphHeader"
bu.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Bold,
Enum.FontStyle.Normal
)
bu.RichText=true
bu.Text=bj.Title
bu.TextColor3=Color3.fromRGB(245,245,250)
bu.TextSize=20
bu.TextTransparency=0.05
bu.TextWrapped=true
bu.TextXAlignment=Enum.TextXAlignment.Left
bu.AutomaticSize=Enum.AutomaticSize.Y
bu.BackgroundColor3=Color3.fromRGB(255,255,255)
bu.BackgroundTransparency=1
bu.BorderColor3=Color3.fromRGB(0,0,0)
bu.BorderSizePixel=0
bu.Size=UDim2.fromScale(1,0)
bu.Parent=bt

local bv=Instance.new"UIListLayout"
bv.Name="UIListLayout"
bv.Padding=UDim.new(0,12)
bv.SortOrder=Enum.SortOrder.LayoutOrder
bv.Parent=bt

local bw=Instance.new"TextLabel"
bw.Name="ParagraphBody"
bw.FontFace=Font.new(
q.interFont,
Enum.FontWeight.Medium,
Enum.FontStyle.Normal
)
bw.RichText=true
bw.Text=bj.Description
bw.TextColor3=Color3.fromRGB(180,180,195)
bw.TextSize=13
bw.TextTransparency=0.25
bw.TextWrapped=true
bw.TextXAlignment=Enum.TextXAlignment.Left
bw.AutomaticSize=Enum.AutomaticSize.Y
bw.BackgroundColor3=Color3.fromRGB(255,255,255)
bw.BackgroundTransparency=1
bw.BorderColor3=Color3.fromRGB(0,0,0)
bw.BorderSizePixel=0
bw.LayoutOrder=1
bw.Size=UDim2.fromScale(1,0)
bw.Parent=bt

bt.Parent=bo

local bx=Instance.new"Frame"
bx.Name="Interactions"
bx.AutomaticSize=Enum.AutomaticSize.Y
bx.BackgroundColor3=Color3.fromRGB(0,0,0)
bx.BackgroundTransparency=1
bx.BorderColor3=Color3.fromRGB(0,0,0)
bx.BorderSizePixel=0
bx.LayoutOrder=1
bx.Size=UDim2.fromScale(1,0)

local by=Instance.new"UIListLayout"
by.Name="UIListLayout"
by.Padding=UDim.new(0,8)
by.SortOrder=Enum.SortOrder.LayoutOrder
by.FillDirection=Enum.FillDirection.Horizontal
by.HorizontalAlignment=Enum.HorizontalAlignment.Left
by.Parent=bx

local bz=Instance.new"UIPadding"
bz.Name="UIPadding"
bz.PaddingTop=UDim.new(0,24)
bz.Parent=bx

bx.Parent=bo

local bA=Instance.new"UIListLayout"
bA.Name="UIListLayout"
bA.SortOrder=Enum.SortOrder.LayoutOrder
bA.Parent=bo

bo.Parent=bm

bm.Parent=bl

local bB=Tween(bl,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{GroupTransparency=0})
local bC=Tween(bl,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{GroupTransparency=1})

local bD=Tween(bp,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=1})
local bE=Tween(bp,TweenInfo.new(0.1,Enum.EasingStyle.Sine),{Scale=0.95})

local function dialogIn()
bB:Play()
bD:Play()
bB.Completed:Wait()
bm.Parent=D
end

local function dialogOut()
bm.Parent=bl
bC:Play()
bE:Play()
bC.Completed:Wait()
bl:Destroy()
end

for bF,bG in pairs(bj.Buttons)do
local bH=Instance.new"TextButton"
bH.Name="Button"
bH.FontFace=Font.new(
q.interFont,
Enum.FontWeight.SemiBold,
Enum.FontStyle.Normal
)
bH.Text=bG.Name
bH.TextColor3=Color3.fromRGB(240,240,245)
bH.TextSize=14
bH.TextTransparency=0.1
bH.TextTruncate=Enum.TextTruncate.AtEnd
bH.AutoButtonColor=false
bH.AutomaticSize=Enum.AutomaticSize.XY
bH.BackgroundColor3=Color3.fromRGB(55,55,65)
bH.BorderColor3=Color3.fromRGB(0,0,0)
bH.BorderSizePixel=0
bH.Size=UDim2.fromOffset(0,0)

local bI=Instance.new"UIPadding"
bI.Name="UIPadding"
bI.PaddingBottom=UDim.new(0,10)
bI.PaddingLeft=UDim.new(0,16)
bI.PaddingRight=UDim.new(0,16)
bI.PaddingTop=UDim.new(0,10)
bI.Parent=bH

local bJ=Instance.new"UICorner"
bJ.Name="BaseUICorner"
bJ.CornerRadius=UDim.new(0,8)
bJ.Parent=bH

local bK=Instance.new"UIStroke"
bK.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
bK.Color=Color3.fromRGB(70,70,80)
bK.Transparency=0.6
bK.Thickness=1
bK.Parent=bH

bH.Parent=bx

local bL={
EasingStyle=Enum.EasingStyle.Quint,
Duration=0.2
}

local function ChangeState(bM)
if bM=="Idle"then
Tween(bH,TweenInfo.new(bL.Duration,bL.EasingStyle),{
BackgroundColor3=Color3.fromRGB(55,55,65),
TextTransparency=0.1
}):Play()
Tween(bK,TweenInfo.new(bL.Duration,bL.EasingStyle),{
Transparency=0.6
}):Play()
elseif bM=="Hover"then
Tween(bH,TweenInfo.new(bL.Duration,bL.EasingStyle),{
BackgroundColor3=Color3.fromRGB(65,65,75),
TextTransparency=0
}):Play()
Tween(bK,TweenInfo.new(bL.Duration,bL.EasingStyle),{
Transparency=0.4
}):Play()
end
end

bH.MouseButton1Click:Connect(function()
if bl.GroupTransparency~=0 then return end
if bG.Callback then
bG.Callback()
end

bm.Parent=bl

dialogOut()
end)

bH.MouseEnter:Connect(function()
ChangeState"Hover"
end)
bH.MouseLeave:Connect(function()
ChangeState"Idle"
end)
end

dialogIn()

function bk.UpdateTitle(bF,bG)
bu.Text=bG
end
function bk.UpdateDescription(bF,bG)
bw.Text=bG
end

function bk.Cancel(bF)
dialogOut()
end

return bk
end

function v.SetNotificationsState(bi,bj)
x.Visible=bj
end

function v.GetNotificationsState(bi,bj)
return x.Visible
end

function v.SetState(bi,bj,bk)
j=bj
D.Visible=bj
if B then
B.Enabled=bj
end
if A then
A.Transparency=bj and 0.98 or 1
end
end

function v.GetState(bi)
return j
end

local bi

function v.Unload(bj)
if C then
C:Disconnect()
C=nil
end
if B then
B:Destroy()
B=nil
end
local bk=workspace.CurrentCamera:FindFirstChild"Elysium_AcrylicFolder"
if bk then
bk:Destroy()
end
local bl=game:GetService"Lighting":FindFirstChild"Elysium_AcrylicBlur"
if bl then
bl:Destroy()
end
if bi then
bi()
end
w:Destroy()
p=true
end

function v.onUnloaded(bj)
bi=bj
end

local bj=u.Keybind or Enum.KeyCode.RightControl

local function ToggleMenu()
local bk=not v:GetState()
v:SetState(bk,k)
v:Notify{
Title=u.Title,
Description=(bk and"Maximized "or"Minimized ").."the menu. Use "..tostring(bj.Name).." to toggle it.",
Lifetime=5
}
end

f.InputEnded:Connect(function(bk,bl)
if bl then return end
if bk.KeyCode==bj then
ToggleMenu()
end
end)

Y.MouseButton1Click:Connect(ToggleMenu)
W.MouseButton1Click:Connect(function()
v:Dialog{
Title=u.Title,
Description="Are you sure you want to exit the menu? You will lose any unsaved configurations.",
Buttons={
{
Name="Confirm",
Callback=function()
v:Unload()
end,
},
{
Name="Cancel"
}
}
}
end)

function v.SetKeybind(bk,bl)
bj=bl
end

local function _SetUserInfoState(bk)
if bk then
aw.Image=(av and au)or"rbxassetid://0"
aD.Text="@"..i.Name
aA.Text=i.DisplayName
else
aw.Image="rbxassetid://0"
local bl=#i.Name
local bm=#i.DisplayName
aD.Text="@"..string.rep(".",bl)
aA.Text=string.rep(".",bm)
end
end

local bk
if u.ShowUserInfo~=nil then
bk=u.ShowUserInfo
else
bk=true
end

_SetUserInfoState(bk)

function v.SetUserInfoState(bl,bm)
_SetUserInfoState(bm)
end
function v.GetUserInfoState(bl,bm)
return bk
end

function v.SetSize(bl,bm)
D.Size=bm
end
function v.GetSize(bl,bm)
return D.Size
end

function v.SetScale(bl,bm)
I.Scale=bm
end
function v.GetScale(bl)
return I.Scale
end

local bl={Toggle=
{
Save=function(bl,bm)
return{
type="Toggle",
flag=bl,
state=bm.State or false
}
end,
Load=function(bl,bm)
if a.Options[bl]then
if bm.state~=nil then
a.Options[bl]:UpdateState(bm.state)
else
print("State is nil for flag:",bl)
end
else
print("Flag not found:",bl)
end
end
},Slider=
{
Save=function(bl,bm)
return{
type="Slider",
flag=bl,
value=(bm.Value and tostring(bm.Value))or false
}
end,
Load=function(bl,bm)
if a.Options[bl]and bm.value then
a.Options[bl]:UpdateValue(bm.value)
end
end
},Input=
{
Save=function(bl,bm)
return{
type="Input",
flag=bl,
text=bm.Text
}
end,
Load=function(bl,bm)
if a.Options[bl]and bm.text and type(bm.text)=="string"then
a.Options[bl]:UpdateText(bm.text)
end
end
},Keybind=
{
Save=function(bl,bm)
return{
type="Keybind",
flag=bl,
bind=(typeof(bm.Bind)=="EnumItem"and bm.Bind.Name)or nil
}
end,
Load=function(bl,bm)
if a.Options[bl]and bm.bind then
a.Options[bl]:Bind(Enum.KeyCode[bm.bind])
end
end
},Dropdown=
{
Save=function(bl,bm)
return{
type="Dropdown",
flag=bl,
value=bm.Value
}
end,
Load=function(bl,bm)
if a.Options[bl]and bm.value then
a.Options[bl]:UpdateSelection(bm.value)
end
end
},Colorpicker=
{
Save=function(bl,bm)
local function Color3ToHex(bn)
return string.format("#%02X%02X%02X",math.floor(bn.R*255),math.floor(bn.G*255),math.floor(bn.B*255))
end

return{
type="Colorpicker",
flag=bl,
color=Color3ToHex(bm.Color)or nil,
alpha=bm.Alpha
}
end,
Load=function(bl,bm)
local function HexToColor3(bn)
local bo=tonumber(bn:sub(2,3),16)/255
local bp=tonumber(bn:sub(4,5),16)/255
local bq=tonumber(bn:sub(6,7),16)/255
return Color3.new(bo,bp,bq)
end

if a.Options[bl]and bm.color then
a.Options[bl]:SetColor(HexToColor3(bm.color))
if bm.alpha then
a.Options[bl]:SetAlpha(bm.alpha)
end
end
end
}
}

local function BuildFolderTree()
if h then return"Config system unavailable."end

local bm={
a.Folder,
a.Folder.."/settings"
}

for bn=1,#bm do
local bo=bm[bn]
if not isfolder(bo)then
makefolder(bo)
end
end
end

function a.LoadAutoLoadConfig(bm)
if h then return"Config system unavailable."end

if isfile(a.Folder.."/settings/autoload.txt")then
local bn=readfile(a.Folder.."/settings/autoload.txt")

local bo,bp=a:LoadConfig(bn)
if not bo then
v:Notify{
Title="Interface",
Description="Error loading autoload config: "..bp
}
end

v:Notify{
Title="Interface",
Description=string.format("Autoloaded config: %q",bn),
}
end
end

function a.SetFolder(bm,bn)
if h then return"Config system unavailable."end

a.Folder=bn;
BuildFolderTree()
end

function a.SaveConfig(bm,bn)
if h then return"Config system unavailable."end

if(not bn)then
return false,"Please select a config file."
end

local bo=a.Folder.."/settings/"..bn..".json"

local bp={
objects={}
}

for bq,br in next,a.Options do
if not bl[br.Class]then continue end
if br.IgnoreConfig then continue end

table.insert(bp.objects,bl[br.Class].Save(bq,br))
end

local bq,br=pcall(d.JSONEncode,d,bp)
if not bq then
return false,"Unable to encode into JSON data"
end

writefile(bo,br)
return true
end

function a.LoadConfig(bm,bn)
if h then return"Config system unavailable."end

if(not bn)then
return false,"Please select a config file."
end

local bo=a.Folder.."/settings/"..bn..".json"
if not isfile(bo)then return false,"Invalid file"end

local bp,bq=pcall(d.JSONDecode,d,readfile(bo))
if not bp then return false,"Unable to decode JSON data."end

for br,bs in next,bq.objects do
if bl[bs.type]then
task.spawn(function()
bl[bs.type].Load(bs.flag,bs)
end)
end
end

return true
end

function a.RefreshConfigList(bm)
if h then return"Config system unavailable."end

local bn=listfiles(a.Folder.."/settings")

local bo={}
for bp=1,#bn do
local bq=bn[bp]
if bq:sub(-5)==".json"then
local br=bq:find(".json",1,true)
local bs=br

local bt=bq:sub(br,br)
while bt~="/"and bt~="\\"and bt~=""do
br=br-1
bt=bq:sub(br,br)
end

if bt=="/"or bt=="\\"then
local bu=bq:sub(br+1,bs-1)
if bu~="options"then
table.insert(bo,bu)
end
end
end
end

return bo
end

function a.ExportConfig(bm)
if h then return false,"Config system unavailable in Studio."end

local bn={
objects={}
}

for bo,bp in next,a.Options do
if not bl[bp.Class]then continue end
if bp.IgnoreConfig then continue end

table.insert(bn.objects,bl[bp.Class].Save(bo,bp))
end

local bo,bp=pcall(d.JSONEncode,d,bn)
if not bo then
return false,"Unable to encode config data"
end


setclipboard(bp)

return true,bp
end

function a.ImportConfig(bm,bn)
if h then return false,"Config system unavailable in Studio."end

if not bn or bn==""then
return false,"No config data provided"
end

local bo,bp=pcall(d.JSONDecode,d,bn)
if not bo then
return false,"Invalid config data. Unable to decode JSON."
end

if not bp.objects then
return false,"Invalid config format"
end

for bq,br in next,bp.objects do
if bl[br.type]then
task.spawn(function()
bl[br.type].Load(br.flag,br)
end)
end
end

return true
end

w.Enabled=false

local bm={}
for bn,bo in pairs(q)do
table.insert(bm,bo)
end

e:PreloadAsync(bm)
w.Enabled=true
j=true

return v
end

function a.Demo(aa)
local ab=a:Window{
Title="Maclib Demo",
Subtitle="This is a subtitle.",
Size=UDim2.fromOffset(519,350),
DragStyle=2,
DisabledWindowControls={},
ShowUserInfo=true,
Keybind=Enum.KeyCode.RightControl,
}local ac=

{
NotificationToggler=ab:GlobalSetting{
Name="Notifications",
Default=ab:GetNotificationsState(),
Callback=function(ac)
ab:SetNotificationsState(ac)
ab:Notify{
Title=ab.Settings.Title,
Description=(ac and"Enabled"or"Disabled").." Notifications",
Lifetime=5
}
end,
},
ShowUserInfo=ab:GlobalSetting{
Name="Show User Info",
Default=ab:GetUserInfoState(),
Callback=function(ac)
ab:SetUserInfoState(ac)
ab:Notify{
Title=ab.Settings.Title,
Description=(ac and"Showing"or"Redacted").." User Info",
Lifetime=5
}
end,
},
Button
}

local ad={
TabGroup1=ab:TabGroup()
}

local ae={
Main=ad.TabGroup1:Tab{Name="Auto Farming",Image="house"},
Settings=ad.TabGroup1:Tab{Name="Settings",Image="rbxassetid://10734950309"}
}

local af={
MainSection1=ae.Main:Section{Side="Left",Collapsed=true},
}

af.MainSection1:Header{
Name="Header #1"
}

af.MainSection1:Button{
Name="Button",
Callback=function()
ab:Dialog{
Title=ab.Settings.Title,
Description="Lorem ipsum odor amet, consectetuer adipiscing elit. Eros vestibulum aliquet mattis, ex platea nunc.",
Buttons={
{
Name="Confirm",
Callback=function()
print"Confirmed!"
end,
},
{
Name="Cancel"
}
}
}
end,
}

af.MainSection1:Input({
Name="Input",
Placeholder="Input",
AcceptedCharacters="All",
Callback=function(ag)
ab:Notify{
Title=ab.Settings.Title,
Description="Successfully set input to "..ag
}
end,
onChanged=function(ag)
print("Input is now "..ag)
end,
},"Input")

af.MainSection1:Slider({
Name="Slider",
Default=50,
Minimum=0,
Maximum=100,
DisplayMethod="Percent",
Precision=0,
Callback=function(ag)
print("Changed to "..ag)
end
},"Slider")

af.MainSection1:Toggle({
Name="Toggle",
Default=false,
Callback=function(ag)
ab:Notify{
Title=ab.Settings.Title,
Description=(ag and"Enabled "or"Disabled ").."Toggle"
}
end,
},"Toggle")

af.MainSection1:Keybind({
Name="Keybind",
Blacklist=false,
Callback=function(ag)
ab:Notify{
Title="Demo Window",
Description="Pressed keybind - "..tostring(ag.Name),
Lifetime=3
}
end,
onBinded=function(ag)
ab:Notify{
Title="Demo Window",
Description="Successfully Binded Keybind to - "..tostring(ag.Name),
Lifetime=3
}
end,
},"Keybind")

af.MainSection1:Colorpicker({
Name="Colorpicker",
Default=Color3.fromRGB(0,255,255),
Callback=function(ag)
print("Color: ",ag)
end,
},"Colorpicker")

local ag=af.MainSection1:Colorpicker({
Name="Transparency Colorpicker",
Default=Color3.fromRGB(255,0,0),
Alpha=0,
Callback=function(ag,ah)
print("Color: ",ag," Alpha: ",ah)
end,
},"TransparencyColorpicker")

local ah
local ai
local aj=0

af.MainSection1:Toggle({
Name="Rainbow",
Default=false,
Callback=function(ak)
ah=ak

if ah then
ai=game:GetService"RunService".RenderStepped:Connect(function(al)
aj=(aj+al*0.1)%1
ag:SetColor(Color3.fromHSV(aj,1,1))
end)
elseif ai then
ai:Disconnect()
ai=nil
end
end,
},"RainbowToggle")

local ak={
"Apple",
"Banana",
"Orange",
"Grapes",
"Pineapple",
"Mango",
"Strawberry",
"Blueberry",
"Watermelon",
"Peach"
}

local al=af.MainSection1:Dropdown({
Name="Dropdown",
Multi=false,
Required=true,
Options=ak,
Default=1,
Callback=function(al)
print("Dropdown changed: "..al)
end,
},"Dropdown")

local am=af.MainSection1:Dropdown({
Name="Multi Dropdown",
Search=true,
Multi=true,
Required=false,
Options=ak,
Default={"Apple","Orange"},
Callback=function(am)
local an={}
for ao,ap in next,am do
table.insert(an,ao)
end
print("Mutlidropdown changed:",table.concat(an,", "))
end,
},"MultiDropdown")

af.MainSection1:Button{
Name="Update Selection",
Callback=function()
al:UpdateSelection"Grapes"
am:UpdateSelection{"Banana","Pineapple"}
end,
}

af.MainSection1:Divider()

af.MainSection1:Header{
Text="Header #2"
}

af.MainSection1:Paragraph{
Header="Paragraph",
Body="Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida."
}

af.MainSection1:Label{
Text="Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
}

af.MainSection1:SubLabel{
Text="Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
}

a:SetFolder"Maclib"
ae.Settings:InsertConfigSection"Left"

ab.onUnloaded(function()
print"Unloaded!"
end)

ae.Main:Select()
a:LoadAutoLoadConfig()
end

return a
