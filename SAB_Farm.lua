local aS="v22"local gs=game:GetService("Players")local z=gs.LocalPlayer or gs.PlayerAdded:Wait()
local function dW(kI)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..aS,Text=kI,Duration=6})
end)end dW("script started")local function kJ()local bw=game:GetService("ReplicatedStorage")
local cv=game:GetService("Workspace")local kK=game:GetService("UserInputService")local a9=(type(getgenv)=="function"and getgenv())or _G
if type(a9 .SAB_KILL)=="function"then pcall(a9 .SAB_KILL)end local g=(type(tick)=="function")and tick or os.clock
local dX=(function()local kL,kM=pcall(function()return game:GetService("VirtualUser")end)return kL and kM or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,}local a={
alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=g(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local v={name=nil,rar=nil,at=g(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local c={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local dY={}local dZ,cw,aB,aT={},{},{},{}local O=""local function I(gt)dZ[#dZ+1]=gt return gt end
local function aC(kN)task.wait(kN)if not a.alive then error(dY,0)end end local function f(cx)
cx=os.date("%H:%M:%S").." "..tostring(cx)table.insert(cw,1,cx)if#cw>6 then table.remove(cw)end
aB[#aB+1]=cx if#aB>80 then table.remove(aB,1)end end local function cy(gu)if type(gu)~="string"then return""end
return(gu:lower():gsub("[^%w]",""))end local function E(kO)local gv=cy(kO)local d0=gv:gsub("butter$","")
if d0==""then d0=gv end return d0 end local function aD(d1)return type(d1)=="string"and E(d1)~=""and e.Targets[E(d1)]==true end
local function kP(bx)bx=bx:lower()return bx:find("squishy",1,true)~=nil or bx:match("butter$")~=nil or bx:match("butter[^%a]")~=nil
end local d2={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ak(by)
if type(by)~="number"then return"?"end local cz=1 while math.abs(by)>=1000 and cz<#d2 do by=by/1000 cz=cz+1 end
local kQ=string.format("%.2f",by):gsub("%.?0+$","")return kQ..d2[cz]end local function kR(gw)
if type(gw)~="string"then return nil end local kS,gx=gw:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local d3=tonumber(kS)if not d3 then return nil end if gx==""then return d3 end for kT,kU in ipairs(d2)do if kU:lower()==gx:lower()then return d3*1000^(kT-1)end end
return nil end local function an()local gy=z:GetAttribute("BoardValueMoney")if type(gy)=="number"then return gy end
local gz=z:FindFirstChild("leaderstats")if gz then for pO,kV in ipairs({"Cash","Money","Coins"})do
local d4=gz:FindFirstChild(kV)if d4 and type(d4 .Value)=="number"then return d4 .Value end
end end end local function W(kW)local d5=kW:GetFullName()if a.plot then local d6=a.plot:GetFullName()
if d5:sub(1,#d6)==d6 then return d5:sub(#d6+2)end end return d5 end local function aU()
local cA=z.Character if cA and cA:FindFirstChild("HumanoidRootPart")then local gA=cA:FindFirstChildOfClass("Humanoid")
if gA and gA.Health>0 then return cA end end end local function aV()local d7=cv:FindFirstChild("Plots")
if not d7 then return nil end local function gB(kX)local gC=kX:FindFirstChild("Plate")return gC~=nil and gC:FindFirstChild("EditStackAttachment",true)~=nil
end local gD=z:GetAttribute("PlotNumber")if gD~=nil then local d8=d7:FindFirstChild(tostring(gD))
if d8 and gB(d8)then return d8 end end for pP,gE in ipairs(d7:GetChildren())do if gB(gE)then return gE end
end end local function bz(gF)local aE=gF and gF.Parent for pQ=1,6 do if not aE then return nil end
if aE:IsA("BasePart")then return aE end if aE:IsA("Model")then return aE.PrimaryPart or aE:FindFirstChildWhichIsA("BasePart",true)end
aE=aE.Parent end end local function gG(gH)local d9=gH.Parent if d9 and d9:IsA("Attachment")then return d9 .WorldPosition end
local gI=bz(gH)return gI and gI.Position end local function kY()local a_=a.plot and a.plot:FindFirstChild("Plate")
if not a_ then return nil end if a_:IsA("BasePart")then return a_.Position end if a_:IsA("Model")then return a_:GetPivot().Position end
local gJ=a_:FindFirstChildWhichIsA("BasePart",true)return gJ and gJ.Position end local function gK()
local d_={}local gL=a.plot and a.plot:FindFirstChild("WaxStations")if gL then for pR,kZ in ipairs(gL:GetChildren())do
local gM=kZ:FindFirstChild("SquishyPlaceHolder")local ea=gM and gM:FindFirstChild("PlacePrompt")
if ea and ea:IsA("ProximityPrompt")then d_[#d_+1]=ea end end end return d_ end local function eb()
local gN,ec=gK(),0 for pS,k0 in ipairs(gN)do if k0 .Enabled then ec=ec+1 end end local ed=#gN
local ee=z:GetAttribute("WaxStations")if type(ee)=="number"and ee>ed then ed=ee end return ec,ed
end local function k1()local gO=aU()local gP=gO and gO.HumanoidRootPart.Position local ef,gQ
for pT,eg in ipairs(gK())do if eg.Enabled then local gR=gG(eg)local gS=(gR and gP)and(gR-gP).Magnitude or 1e9
if not ef or gS<gQ then ef,gQ=eg,gS end end end return ef end local function eh()local cB=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not cB then return nil end local gT=cB:FindFirstChild("BuyPromptAttachment")local cC=(gT and gT:FindFirstChild("BuyPrompt"))or cB:FindFirstChild("BuyPrompt",true)
if cC and cC:IsA("ProximityPrompt")and cC:IsDescendantOf(cB)then return cC end end local gU={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local k2={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local A={order={},price={},dirty=false}local l={seen={},at=0,boxes={},built=0}local x={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local ei="SAB_order.txt"local function ej()if not A.dirty or type(writefile)~="function"then return end
local ad={}for k3,k4 in pairs(A.price)do ad[#ad+1]="P|"..k3 .."|"..string.format("%.0f",k4)end
for k5,k6 in pairs(A.order)do ad[#ad+1]="O|"..k5 .."|"..table.concat(k6,",")end if c.learned and c.enc then
ad[#ad+1]="M|mode|"..tostring(c.learned.mode or"")for k7,cD in ipairs(c.learned.seq)do local gV={}
for gW=1,cD.n do gV[gW]=c.enc(cD.args[gW])end ad[#ad+1]=("A|%d|%s|%d|%s"):format(k7,cD.m,cD.n,table.concat(gV,";"))
end end for pU,bA in pairs(l.seen)do ad[#ad+1]=("K|%s|%s|%s|%s"):format(bA.name,bA.title or"",bA.rar or"",bA.price and string.format("%.0f",bA.price)or"")
end if pcall(writefile,ei,table.concat(ad,"\n"))then A.dirty=false end end local function k8()
if type(isfile)~="function"or type(readfile)~="function"then return end local k9,k_=pcall(isfile,ei)
if not(k9 and k_)then return end local la,gX=pcall(readfile,ei)if not(la and type(gX)=="string")then return end
for lb in gX:gmatch("[^\n]+")do local bB,bC,aF=lb:match("^(%a)|([^|]+)|(.*)$")if bB=="P"then
A.price[bC]=tonumber(aF)elseif bB=="M"then c.loadMode=(aF~=""and aF~="nil")and aF or nil
elseif bB=="A"and c.dec then local gY=tonumber(bC)local gZ,cE,lc=aF:match("^([^|]+)|(%d+)|(.*)$")
if gY and gZ then cE=tonumber(cE)local g0,cF={},0 for ld in(lc..";"):gmatch("([^;]*);")do
cF=cF+1 if cF<=cE then g0[cF]=c.dec(ld)end end c.loadSeq=c.loadSeq or{}c.loadSeq[gY]={m=gZ,n=cE,args=g0}
end elseif bB=="K"then local g1,g2,le=aF:match("^([^|]*)|([^|]*)|(.*)$")l.seen[l.key(bC)]={name=bC,title=g1~=""and g1 or nil,
rar=g2~=""and g2 or nil,price=tonumber(le)}elseif bB=="O"and aF~=""then local cG={}for lf in aF:gmatch("[^,]+")do cG[#cG+1]=lf end
if#cG>0 then A.order[bC]=cG end end end end local function lg(cH)if type(cH)~="table"then return end
local aW,g3=cH.rarity,cH.contents if type(aW)~="string"or aW==""or type(g3)~="table"then return end
local bD={}for pV,cI in ipairs(g3)do if type(cI)=="table"and type(cI.butter)=="string"then
bD[#bD+1]={n=cI.butter,ch=tonumber(cI.chance)or 0}end end if#bD==0 then return end table.sort(bD,function(lh,li)return lh.ch>li.ch end)
local bE,bF={},false for lj,lk in ipairs(bD)do bE[lj]=lk.n end local ek=A.order[aW]if not ek or#ek~=#bE then bF=true end
if not bF then for g4=1,#bE do if ek[g4]~=bE[g4]then bF=true break end end end A.order[aW]=bE
local el=tonumber(cH.price)if el and A.price[aW]~=el then A.price[aW]=el bF=true end if bF then
A.dirty=true x.at=0 f("learned the "..aW.." order from its crate")end end local function ba(ll,lm)
local ln=ll:FindFirstChild(lm,true)local lo,em=pcall(function()return ln.Text end)return(lo and type(em)=="string"and em~="")and em or nil
end local function L(g5)return x.pretty[g5]or g5 end l.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},
{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},
{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}
function l.key(lp)return cy(lp or"")end function l.learn(ao)if type(ao)~="table"or type(ao.name)~="string"then return end
local en=l.key(ao.name)local ap=l.seen[en]or{}local lq=(l.seen[en]==nil)or(tonumber(ao.price)and ap.price~=tonumber(ao.price))
ap.name,ap.title=ao.name,ao.title or ap.title ap.rar,ap.price=ao.rarity or ap.rar,tonumber(ao.price)or ap.price
l.seen[en]=ap if lq then l.at,A.dirty=g(),true end end function l.wanted(g6)return g6~=nil and e.CrateTicks[l.key(g6)]==true end
function l.list()local bb={}for lr,cJ in ipairs(l.base)do bb[l.key(cJ[1])]={name=cJ[1],title=cJ[2],rar=cJ[3],i=lr}end
for pW,bG in ipairs(x.rarOrder)do local g7=false for pX,ls in pairs(bb)do if ls.rar==bG then g7=true break end end
if not g7 and bG~="?"then local g8=bG:gsub("[^%w]","").."Crate"bb[l.key(g8)]={name=g8,title=bG.." Crate",rar=bG,i=50,guess=true}
end end for g9,cK in pairs(l.seen)do local al=bb[g9]or{i=100}al.name,al.title,al.rar=cK.name or al.name,cK.title or al.title,cK.rar or al.rar
al.price,al.guess=cK.price or al.price,nil bb[g9]=al end local bH,cL={},{}for lt,lu in ipairs(gU)do bH[lu]=lt end
for lv,g_ in ipairs(x.rarOrder)do bH[g_]=bH[g_]or(20+lv)end for lw,bI in pairs(bb)do bI.k=lw
bI.price=bI.price or A.price[bI.rar or""]cL[#cL+1]=bI end table.sort(cL,function(aX,aY)
if aX.price and aY.price and aX.price~=aY.price then return aX.price<aY.price end local ha,hb=bH[aX.rar or""]or 99,bH[aY.rar or""]or 99
if ha~=hb then return ha<hb end if(aX.i or 100)~=(aY.i or 100)then return(aX.i or 100)<(aY.i or 100)end
return aX.k<aY.k end)return cL end local function lx()local hc=bw:FindFirstChild("Assets")
local hd=hc and hc:FindFirstChild("Squishies")if not hd then return false end local eo,he,bc={},{},{}
local cM=0 for pY,cN in ipairs(hd:GetChildren())do local bJ=E(cN.Name)if bJ~=""and not eo[bJ]then
local cO=ba(cN,"RarityText")or"?"eo[bJ]=cO he[bJ]=ba(cN,"NameText")or cN.Name bc[cO]=bc[cO]or{}
table.insert(bc[cO],bJ)cM=cM+1 end end if cM==0 then return false end for hf,ly in pairs(bc)do
local hg=A.order[hf]or k2[hf]local ep={}if hg then for lz,lA in ipairs(hg)do ep[E(lA)]=lz end end
table.sort(ly,function(hh,hi)local eq,er=ep[hh],ep[hi]if eq and er then return eq<er end
if eq then return true end if er then return false end return L(hh)<L(hi)end)end local es={}
for lB,lC in ipairs(gU)do es[lC]=lB end local cP={}for lD in pairs(bc)do cP[#cP+1]=lD end
table.sort(cP,function(et,eu)local ev,ew=A.price[et],A.price[eu]if ev and ew and ev~=ew then return ev<ew end
local ex,ey=es[et],es[eu]if ex and ey then return ex<ey end if ex then return true end if ey then return false end
return et<eu end)x.rar,x.pretty,x.members,x.rarOrder,x.n,x.at=eo,he,bc,cP,cM,g()return true
end local function ez()if x.at==0 or(g()-x.at)>120 then pcall(lx)end return x.n>0 end local function lE(lF)
local hj=E(lF)return x.rar[hj]or(v.name and E(v.name)==hj and v.rar)or"?"end local function hk()
local cQ={}for lG,lH in pairs(e.Targets)do if lH then cQ[#cQ+1]=L(lG)end end table.sort(cQ)
return cQ end local M={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function hl()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function cR(hm)if type(makefolder)~="function"then return end local lI,lJ=pcall(isfolder,hm)
if not(lI and lJ)then pcall(makefolder,hm)end end local function eA(hn)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local lK,lL=pcall(isfile,hn)if not(lK and lL)then return nil end local lM,lN=pcall(readfile,hn)
return lM and lN or nil end local function cS(lO,lP)if type(writefile)~="function"then return false end
return(pcall(writefile,lO,lP))end local function ho(lQ)local bK={}if type(listfiles)~="function"then return bK end
local lR,hp=pcall(listfiles,lQ)if not lR or type(hp)~="table"then return bK end for pZ,lS in ipairs(hp)do bK[#bK+1]=tostring(lS)end
return bK end local function eB()local cT={}for p0,lT in ipairs(ho(M.cfg))do local hq=lT:match("([^/\\]+)%.txt$")
if hq then cT[#cT+1]=hq end end table.sort(cT)return cT end local function lU()local P={"V|1"}
P[#P+1]="N|Every|"..tostring(e.Every)for p1,hr in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart"})do
P[#P+1]="B|"..hr.."|"..(e[hr]and"1"or"0")end if a.winPos then P[#P+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then P[#P+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for p2,eC in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local cU={}for lV,lW in pairs(eC[2])do if lW then cU[#cU+1]=lV end end table.sort(cU)P[#P+1]=eC[1].."|-"
for p3,lX in ipairs(cU)do P[#P+1]=eC[1].."|"..lX end end return table.concat(P,"\n")end
local function lY(eD)if type(eD)~="string"or eD==""then return false end local hs,ht,hu,hv={},false,{},false
for lZ in eD:gmatch("[^\n]+")do local bd,ae,cV=lZ:match("^(%a)|([^|]*)|?(.*)$")if bd=="N"and ae=="Every"then
local eE=tonumber(cV)if eE and eE>=1 then e.Every=math.floor(eE)end elseif bd=="B"then if e[ae]~=nil then e[ae]=(cV=="1")end
elseif bd=="W"then a.winPos={tonumber(ae)or 10,tonumber(cV)or 44}elseif bd=="G"then a.togPos={tonumber(ae)or 10,tonumber(cV)or 300}
elseif bd=="T"and ae~=""then if ae~="-"then hs[ae]=true end ht=true elseif bd=="K"and ae~=""then
if ae~="-"then hu[ae]=true end hv=true end end if ht then e.Targets=hs end if hv then e.CrateTicks=hu end
return true end local function eF(be)if not hl()then return false,"this executor cannot write files"end
be=(be or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if be==""then return false,"give the config a name"end
cR(M.dir)cR(M.cfg)if not cS(M.cfg.."/"..be..".txt",lU())then return false,"could not write the file"end
a.config=be return true,be end local function hw(cW)local hx=eA(M.cfg.."/"..cW..".txt")
if not hx then return false,"no config called "..tostring(cW)end if not lY(hx)then return false,"that config looks empty"end
a.config=cW return true,cW end local function hy(eG)if eG then cR(M.dir)cS(M.auto,eG)elseif type(delfile)=="function"then
pcall(delfile,M.auto)else cS(M.auto,"")end a.autoload=eG end local function eH()if a.selfPath then return a.selfPath end
local cX for p4,l0 in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",M.dir})do for p5,hz in ipairs(ho(l0))do
local eI=hz:lower()if eI:sub(-4)==".lua"and(eI:find("sab_farm",1,true)or eI:find("sab farm",1,true))then
cX=cX or hz end end end a.selfPath=cX return cX end M.stub=[[
-- SAB autoloader: finds the saved SAB farm script and runs it on join.
task.spawn(function()
    task.wait(8)
    if type(listfiles) ~= "function" or type(readfile) ~= "function" then return end
    for _, d in ipairs({ "", "scripts", "Scripts", "Delta", "Delta/Scripts", "SAB" }) do
        local ok, fs = pcall(listfiles, d)
        if ok and type(fs) == "table" then
            for _, f in ipairs(fs) do
                local s, low = tostring(f), tostring(f):lower()
                if low:sub(-4) == ".lua" and low:find("sab_farm", 1, true) and not low:find("autoload", 1, true) then
                    local okr, src = pcall(readfile, s)
                    if okr and type(src) == "string" and #src > 1000 then
                        local fn = loadstring(src)
                        if fn then pcall(fn) return end
                    end
                end
            end
        end
    end
end)
]]
local function l1()if not hl()then return false,"this executor cannot write files"end cR("autoexec")
if not cS(M.exec,M.stub)then return false,"could not write to the autoexec folder"end local hA=eH()
return true,hA and("it will load "..hA)or"now save this script in Delta so the loader can find it"
end local cY=(function()local l2,l3=pcall(function()return game:GetService("TeleportService")end)return l2 and l3 or nil end)()
local function hB()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local l4=queueonteleport or queue_on_teleport local hC=eH()if not hC then return false end
return(pcall(l4,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(hC)))
end local function cZ(l5)if a.rejoining then return end a.rejoining=true f("REJOIN ("..l5 ..")")
pcall(ej)if a.autoload then pcall(eF,a.autoload)end local l6=hB()f(l6 and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for p6=1,30 do if not cY then break end pcall(function()cY:Teleport(game.PlaceId,z)end)
task.wait(10)end end)end local function l7()local l8,hD=pcall(function()return game:GetService("GuiService")end)
if l8 and hD then pcall(function()I(hD.ErrorMessageChanged:Connect(function()if e.Rejoin then cZ("roblox error message")end
end))end)end pcall(function()local hE=game:GetService("CoreGui")local hF=hE and hE:WaitForChild("RobloxPromptGui",15)
local hG=hF and hF:WaitForChild("promptOverlay",15)if hG then I(hG.ChildAdded:Connect(function(l9)
if e.Rejoin and tostring(l9 .Name):lower():find("errorprompt",1,true)then cZ("disconnect prompt")end
end))end end)pcall(function()I(z.OnTeleport:Connect(function(l_)if tostring(l_):find("Started")then hB()end
end))end)if cY then pcall(function()I(cY.TeleportInitFailed:Connect(function()a.rejoining=false
if e.Rejoin then task.delay(5,function()cZ("teleport retry")end)end end))end)end end local function hH(ma)
local hI=a.plot and a.plot:FindFirstChild(ma)if not hI then return nil,false end for p7,eJ in ipairs(hI:GetChildren())do
if eJ:IsA("Model")or eJ:IsA("BasePart")then return eJ,true end end return nil,true end local function bL()
local aG=hH("RolledSquishy")if not aG then return nil end return{model=aG,name=aG.Name,pretty=ba(aG,"NameText")or L(E(aG.Name)),
rar=ba(aG,"RarityText")or lE(aG.Name),price=ba(aG,"PriceText")}end local function hJ(eK)
return type(eK)=="string"and(x.rar[E(eK)]~=nil or kP(eK))end local function C()local eL=hH("SquishyEquipped")
if eL then a.carrySrc,c.heldAt="model",g()return eL.Name,eL end local hK=z.Character if hK then
for p8,bM in ipairs(hK:GetDescendants())do if(bM:IsA("Model")or bM:IsA("Tool"))and hJ(bM.Name)then
a.carrySrc,c.heldAt="character",g()return bM.Name,bM end end end local c0=z:GetAttribute("SquishyEquipped")
if type(c0)=="string"and c0~=""and hJ(c0)and g()>=(a.carryBlind or 0)then a.carrySrc="attribute"
return c0,nil end a.carrySrc=nil end local function p9()local p_,mb=C()return mb end local function hL()
local hM=bL()local eM=hM and kR(hM.price)local eN=an()if eM and eN and eN<eM*0.5 then return eN,eM end
end local function bf(mc)aT[#aT+1]=os.date("%H:%M:%S").." "..mc if#aT>40 then table.remove(aT,1)end
end local function md(aZ,c1)if type(aZ)~="string"then return end bf(("Roll(%s,%s)"):format(aZ,tostring(c1)))
if aZ:lower():find("crate",1,true)then c.rolled,c.rolledAt=aZ,g()return end v.seq=v.seq+1
v.name,v.at=aZ,g()v.rar=type(c1)=="string"and c1 or nil a.rolls=a.rolls+1 if aD(aZ)then f(("ROLL %s [%s] = TARGET"):format(aZ,tostring(c1)))end
end local function me(a0)if type(a0)~="table"then return end local c2=a0 .butter or a0 .itemName
if type(c2)~="string"then return end a.gifts=a.gifts+1 v.gift,v.giftAt=c2,g()if type(a0 .giftId)=="string"then
local hN=bw:FindFirstChild("Remotes")local hO=hN and hN:FindFirstChild("GiftThanks")if hO then pcall(function()hO:FireServer(a0 .giftId)end)end
end bf("Gift("..c2 .." from "..tostring(a0 .fromName)..")")f(("GIFT from %s: %s - it will not be waxed"):format(tostring(a0 .fromName),c2))
end local function mf()local hP=bw:WaitForChild("Remotes",30)if not a.alive then return end
if not hP then f("Remotes folder missing - no roll events")return end I(z:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local hQ=z:GetAttribute("SquishyEquipped")if type(hQ)=="string"and hQ~=""then c.heldAt=g()end
end))local ml={SquishyRollAnimation=md,InitSquishy=function(hR)v.init,v.initAt=tostring(hR),g()bf("Init("..tostring(hR)..")")end,
CrateUpdate=function(bh,hS)pcall(lg,bh)pcall(l.learn,bh)if type(bh)=="table"then local mg=hS==true or(c.rolled~=nil and g()-c.rolledAt<15)or c.waiting
if not mg then return end local mh=not c.waiting local mi=c.on c.waiting,c.data,c.at=true,bh,g()
c.on=(hS==true)c.title=tostring(bh.title or bh.name or"crate")if c.on and not mi then c.openedAt,c.byYou=g(),not c.ours
if c.onShow then task.spawn(c.onShow)end end if c.on then bf("CrateWindow open("..c.title..")")
elseif mh then bf("Crate waiting("..c.title..")")f(c.title.." is waiting on your stand")
end else if c.waiting then bf("Crate gone")end c.on,c.waiting,c.data,c.prompt=false,false,nil,nil
local mj=c.byYou c.summonFails,c.ours,c.byYou=0,false,false if c.onGone then task.spawn(c.onGone,mj)end
if c.classify then local mk=g()task.spawn(function()pcall(c.classify,mk)end)end end end,
GiftReceived=me,}for c3,mm in pairs(ml)do local eO=hP:FindFirstChild(c3)if eO and eO:IsA("RemoteEvent")then I(eO.OnClientEvent:Connect(mm))
elseif c3~="CrateUpdate"and c3~="GiftReceived"then f("remote "..c3 .." missing")end end
end local function eP()local a1=bL()if a1 then if aD(a1 .name)then return{state="match",shown=a1 .pretty,src="pad",info=a1}
end return{state="skip",info=a1,level="idle",text=("on pad: %s [%s] - not ticked"):format(a1 .pretty,tostring(a1 .rar))}
end if v.name and(g()-v.at)<4 then if aD(v.name)then return{state="match",shown=L(E(v.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(L(E(v.name)),tostring(v.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function hT(mn,mo,mp,mq)
local c4=RaycastParams.new()c4 .FilterType=Enum.RaycastFilterType.Exclude local eQ={z.Character}
for qa,mr in ipairs(mq or{})do eQ[#eQ+1]=mr end c4 .FilterDescendantsInstances=eQ pcall(function()c4 .RespectCanCollide=true end)
local hU=cv:Raycast(Vector3 .new(mn,mo+4,mp),Vector3 .new(0,-30,0),c4)return hU and hU.Position or nil
end local function eR(hV)local hW=hV:FindFirstChildOfClass("Humanoid")return((hW and hW.HipHeight)or 2)+hV.HumanoidRootPart.Size.Y/2+0.2
end local function eS(ms,mt)local hX=ms:FindFirstChildOfClass("Humanoid")local mu=g()while g()-mu<mt do
if hX and hX.FloorMaterial~=Enum.Material.Air then return true end aC(0.05)end return false
end local function c5(mv,eT,eU)local hY=mv.HumanoidRootPart hY.AssemblyLinearVelocity=Vector3 .new(0,0,0)
hY.CFrame=eU and CFrame.new(eT,Vector3 .new(eU.X,eT.Y,eU.Z))or CFrame.new(eT)end local function c6(aq,hZ)
local a2=aU()if not a2 or not aq then return false end local aH=aq.Position local c7=math.clamp(math.max(aq.Size.X,aq.Size.Z)/2+2.2,3,7)
local h0=(hZ and hZ.MaxActivationDistance)or 10 if c7>h0-2 then c7=math.max(2.5,h0-2)end
local bN={}local function a3(bO)bO=Vector3 .new(bO.X,0,bO.Z)if bO.Magnitude>0.05 then bN[#bN+1]=bO.Unit end
end local h1=kY()if h1 then a3(h1-aH)end a3(aq.CFrame.LookVector)a3(-aq.CFrame.LookVector)
a3(aq.CFrame.RightVector)a3(-aq.CFrame.RightVector)a3(a2 .HumanoidRootPart.Position-aH)
if#bN==0 then a3(Vector3 .new(0,0,1))end local mw,c8=eR(a2),false for qb,mx in ipairs(bN)do
local c9=aH+mx*c7 local eV=hT(c9 .X,aH.Y,c9 .Z,{aq})if eV and math.abs(eV.Y-aH.Y)<14 then
c5(a2,Vector3 .new(c9 .X,eV.Y+mw,c9 .Z),aH)if eS(a2,0.7)then c8=true break end end end if not c8 then
c5(a2,aH+bN[1]*c7+Vector3 .new(0,3,0),aH)c8=eS(a2,1)end aC(0.12)return c8 end local function my(bP)
if not bP.Parent or not bP.Enabled then return false end pcall(function()bP:InputHoldBegin()end)
aC(math.max(bP.HoldDuration,0)+0.08)pcall(function()bP:InputHoldEnd()end)return true end
local function aa(h2,mz)local mA=g()while g()-mA<mz do if h2()then return true end aC(0.05)
end return h2()end local function c_(bi,mB,h3,mC)local mD=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for mE,eW in ipairs(mD)do if mE==2 and(mC or not(bi.Parent and bi.Enabled and(not h3 or h3())))then break end
local eX if eW=="hold"then eX=my(bi)else eX=type(fireproximityprompt)=="function"and bi.Parent~=nil and bi.Enabled and pcall(fireproximityprompt,bi)end
if eX and aa(mB,1.2)then a.zapFirst=(eW=="zap")return true,eW end end return false end local function h4(eY)
local aI=eh()if not aI or not aI.Enabled then f("buy: nothing on the pad")return false end
local h5=bz(aI)if not h5 then f("buy: pad part missing")return false end a.lastBuyAt=g()
local mF,h6=v.seq,an()c6(h5,aI)if not aI.Enabled then f("buy aborted: pad emptied")return false end
local bj=eP()if not eY and bj.state~="match"then f("buy aborted: "..(bj.text or"pad changed"))
a.matchSince=nil return false end local eZ=bj.info and bj.info.name or(bj.state=="match"and v.name)or nil
local function mG()return aI.Enabled and C()==nil and(eY or eP().state=="match")end local mH,mI=c_(aI,function()
return C()~=nil or((not aI.Enabled)and(eY or v.seq==mF))end,mG,hL()~=nil)if mH then aa(function()return C()~=nil end,0.8)
local bQ=C()local h7=an()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
v.name,v.rar,v.at=nil,nil,g()f(("BOUGHT %s%s via %s"):format(bQ and L(E(bQ))or(bj.shown or"?"),(h6 and h7)and(" for $"..ak(h6-h7))or"",mI))
if bQ and eZ and E(bQ)~=E(eZ)then f(("note: picked up %s, not %s"):format(bQ,eZ))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=g()+math.min(8*2^(a.cashFails-1),60)local h8=bL()
f(("BUY REFUSED: cash short? have $%s, price %s"):format(ak(an()),(h8 and h8 .price)or"?"))
return false end local function h9()local da=C()if not da then a.holding=false f("place: hands are empty")
return false end if not aD(da)then f(("REFUSED TO WAX %s - it is not ticked"):format(L(E(da))))
return false end for qc=1,e.PlaceTries do local aJ=k1()if not aJ then f("place: no free station")break end
local h_=bz(aJ)if h_ then c6(h_,aJ)local ia=C()if not ia then a.holding=false f("place: hands emptied on the way")return false end
if not aD(ia)then f("place: what I carry changed, not waxing it")return false end if aJ.Enabled then
local mJ,mK=c_(aJ,function()return not aJ.Enabled end,function()return aJ.Enabled end)if mJ then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=g()+2.5,0 v.name,v.rar,v.at=nil,nil,g()
f(("WAXED %s #%d at %s via %s"):format(L(E(da)),a.placed,aJ.Parent.Parent.Name,mK))return true
end end end aC(0.25)end a.placeFails=a.placeFails+1 if C()==nil then a.holding=false end
f("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,g()
a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(C()))f(a.capMsg)end return false end local function ib(ic)return type(ic)=="string"and ic:lower():find("crate",1,true)~=nil
end local mL={SABFarmGui=1,SABToggle=1,SABError=1}local function db(mM)local aK=mM while aK do
if mL[aK.Name]then return false end if aK:IsA("ScreenGui")then local mN,mO=pcall(function()return aK.Enabled end)
return(not mN)or mO~=false end if aK:IsA("GuiObject")and not aK.Visible then return false end
aK=aK.Parent end return false end local function bk(dc)local bl=""pcall(function()if dc:IsA("TextButton")then bl=dc.Text end end)
if not bl:find("%a")then for qd,dd in ipairs(dc:GetDescendants())do if(dd:IsA("TextLabel")or dd:IsA("TextButton"))and dd.Text:find("%a")then bl=dd.Text break end
end end if not bl:find("%a")then bl=dc.Name end return(bl:lower():gsub("[^%a]",""))end local function mP()
local bR,bS local id=z:FindFirstChildOfClass("PlayerGui")if not id then return nil,nil end
for qe,bT in ipairs(id:GetDescendants())do if bT:IsA("GuiButton")and db(bT)then local e0=bk(bT)
if e0:sub(1,4)=="open"and not e0:find("shop",1,true)then bR=bR or bT end if e0:sub(1,7)=="discard"then bS=bS or bT end
end end if bR and bS then return bR,bS end if c.on then return bR,bS end return nil,nil
end local de=(function()local mQ,mR=pcall(function()return game:GetService("VirtualInputManager")end)return mQ and mR or nil end)()
local function ie(ar,e1)local e2={}local function ig(mS)e2[#e2+1]=mS end if a.tapWay then ig(a.tapWay)end
for qf,ih in ipairs({"touch","conn","signal"})do if ih~=a.tapWay then ig(ih)end end local function ii(mT,...)
local mU,e3=pcall(getconnections,mT)if not(mU and type(e3)=="table"and#e3>0)then return false end
local ij,mV,mW=false,{...},select("#",...)for qg,mX in ipairs(e3)do if pcall(function()mX:Fire(table.unpack(mV,1,mW))end)then ij=true end
end return ij end local function ik()local il=Vector3 .new(0,0,0)pcall(function()local im,io=ar.AbsolutePosition,ar.AbsoluteSize
il=Vector3 .new(im.X+io.X/2,im.Y+io.Y/2,0)end)local e4={Position=il,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()e4 .UserInputType=Enum.UserInputType.Touch end)pcall(function()e4 .UserInputState=Enum.UserInputState.End end)
return e4 end for qh,as in ipairs(e2)do local bU=false if as=="conn"and type(getconnections)=="function"then
if ii(ar.MouseButton1Click)then bU=true if aa(e1,1.5)then a.tapWay=as return true,as end
end bU=ii(ar.Activated,ik(),1)elseif as=="signal"and type(firesignal)=="function"then if pcall(firesignal,ar.MouseButton1Click)then
if aa(e1,1.5)then a.tapWay=as return true,as end end bU=pcall(firesignal,ar.Activated,ik(),1)
elseif as=="touch"and de then bU=pcall(function()local ip,iq=ar.AbsolutePosition,ar.AbsoluteSize
local ir=0 local is=ar:FindFirstAncestorWhichIsA("ScreenGui")local mY,mZ=pcall(function()return is and is.IgnoreGuiInset end)
if not(mY and mZ)then pcall(function()ir=game:GetService("GuiService"):GetGuiInset().Y end)
end local it,iu=ip.X+iq.X/2,ip.Y+iq.Y/2+ir de:SendMouseButtonEvent(it,iu,0,true,game,1)
task.wait(0.06)de:SendMouseButtonEvent(it,iu,0,false,game,1)end)end if bU and aa(e1,1.5)then
a.tapWay=as return true,as end end return false end local m0={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function df(iv)local bV=iv.Parent while bV and bV~=a.plot do if m0[bV.Name]then return false end
bV=bV.Parent end local e5=(iv.ActionText or""):lower()if e5:find("roll",1,true)or e5:find("place",1,true)or e5:find("sell",1,true)then return false end
return true end local function iw()if c.prompt and c.prompt.Parent and c.prompt.Enabled then return c.prompt end
if not a.plot then return nil end local ix=a.plot:FindFirstChild("CrateStand")local bW if ix then
for qi,dg in ipairs(ix:GetDescendants())do if dg:IsA("ProximityPrompt")and dg.Enabled and df(dg)then bW=dg break end
end end if not bW then for qj,aL in ipairs(a.plot:GetDescendants())do if aL:IsA("ProximityPrompt")and aL.Enabled and df(aL)then
local iy=aL:FindFirstAncestorWhichIsA("Model")local m1=((aL.ActionText or"").." "..(aL.ObjectText or"").." "..aL.Name.." "..(iy and iy.Name or"")):lower()
if m1:find("crate",1,true)then bW=aL break end end end end c.prompt=bW return bW end local function e6()
if c.on then return true end local bX=iw()if not bX then c.summonFails=c.summonFails+1 c.lastFail=g()
f("crate: cannot find where to open "..c.title.." - open it once by hand, then DUMP")return false
end local iz=bz(bX)if iz then c6(iz,bX)end c.ours=true c_(bX,function()return c.on end)
if aa(function()return c.on end,3)then c.summonFails=0 return true end c.ours=false c.summonFails=c.summonFails+1
c.lastFail=g()f("crate: pressed "..W(bX).." but no window came up")return false end do local function m2(iA)
local bm=iA.Parent while bm and bm:IsA("GuiObject")do local iB,iC=false,false for qk,bY in ipairs(bm:GetDescendants())do
if bY~=iA and bY:IsA("GuiButton")and bk(bY):sub(1,7)=="discard"then iB=true end if bY:IsA("TextLabel")then
local e7=bY.Text:lower()if e7:find("crate",1,true)or e7:find("can contain",1,true)or e7:find("cost",1,true)then iC=true end
end if iB and iC then return bm end end bm=bm.Parent end end function c.findWin()if c.win and c.win.Parent then return c.win end
local iD=z:FindFirstChildOfClass("PlayerGui")if not iD then return nil end for ql,dh in ipairs(iD:GetDescendants())do
if dh:IsA("GuiButton")and not dh:FindFirstAncestor("SABFarmGui")and bk(dh):sub(1,4)=="open"then
local e8=m2(dh)if e8 then c.win=e8 return e8 end end end end local function m3(m4)for qm,di in ipairs(m4:GetDescendants())do
if di:IsA("GuiButton")then local iE,e9=bk(di),di.Name:lower()if iE=="x"or iE=="close"or e9=="x"or e9:find("close",1,true)or e9:find("exit",1,true)then return di end
end end end c.onShow=function()c.win=nil c.findWin()end c.onGone=function(m5)task.wait(m5 and 4 or 1.2)
if c.on or c.waiting then return end local dj=c.findWin()if not dj or not db(dj)then return end
local iF=m3(dj)if iF and ie(iF,function()return not db(dj)end)then return end f("the crate window is still open - tap its X")
end end local function dk(dl)if not e6()then return false end local iG=g()-(c.openedAt or 0)
if iG<0.6 then aC(0.6-iG)end local e_=c.title local m6,m7=mP()local iH=dl and m6 or m7 if not iH then
c.lastFail=g()a.crateFails=a.crateFails+1 f(("crate: no %s button found in %s"):format(dl and"Open"or"Discard",e_))
return false end local m8=C()local m9,qn=ie(iH,function()return(not c.on)or(C()~=nil and C()~=m8)
end)if not m9 then c.lastFail=g()a.crateFails=a.crateFails+1 f("crate: could not press "..(dl and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if dl then a.crates=a.crates+1 aa(function()return C()~=nil end,1.5)
local iI=C()f(("OPENED %s -> %s"):format(e_,iI and L(E(iI))or"?"))else f("discarded "..e_.." (nothing ticked in it)")
end return true end c.calls={}function c.saw(m_,...)local na=select("#",...)c.calls[#c.calls+1]={t=g(),m=m_,n=na,args={...},data=c.data,
crate=c.data and c.data.name,title=c.title,rar=c.data and c.data.rarity}if#c.calls>12 then table.remove(c.calls,1)end
end function c.slot(Q,au)local aM=type(Q)if(aM=="string"or aM=="number")and type(au.data)=="table"then
for iJ,fa in pairs(au.data)do if fa==Q and type(iJ)=="string"and(type(fa)=="string"or type(fa)=="number")then
return{__slot="f:"..iJ}end end end if aM=="string"then if au.crate and Q==au.crate then return{__slot="crate"}end
if au.title and Q==au.title then return{__slot="title"}end if au.rar and Q==au.rar then return{__slot="rarity"}end
return Q end if aM=="number"or aM=="boolean"or aM=="nil"then return Q end if aM=="table"then
local iK={}for nb,iL in pairs(Q)do if type(iL)=="table"then return nil,"nested table"end
local nc,iM=c.slot(iL,au)if iM then return nil,iM end iK[nb]=nc end return iK end local nd,ne=pcall(function()return Q:IsA("Instance")end)
if nd and ne then if Q==z then return{__slot="player"}end if a.plot and Q==a.plot then return{__slot="plot"}end
local dm=a.plot and a.plot:FindFirstChild("CrateStand")if dm and Q==dm then return{__slot="stand"}end
if dm and Q.Parent==dm then return{__slot="model"}end end return nil,"a value it cannot rebuild ("..aM..")"
end function c.resolve(dn)if type(dn)~="table"then return dn end local af=dn.__slot if af and af:sub(1,2)=="f:"then return c.data and c.data[af:sub(3)]end
if af=="crate"then return c.data and c.data.name end if af=="title"then return(c.data and c.data.title)or c.title end
if af=="rarity"then return c.data and c.data.rarity end if af=="player"then return z end
if af=="plot"then return a.plot end if af=="stand"or af=="model"then local fb=a.plot and a.plot:FindFirstChild("CrateStand")
if af=="stand"or not fb then return fb end for qo,iN in ipairs(fb:GetChildren())do if ib(iN.Name)then return iN end end
return nil end local iO={}for nf,ng in pairs(dn)do iO[nf]=c.resolve(ng)end return iO end
function c.classify(fc)if c.directOff then return end local dp={}for qp,fd in ipairs(c.calls)do
if fd.t<=fc+0.05 and fc-fd.t<=6 then dp[#dp+1]=fd end end if#dp==0 then return end if not aa(function()return(c.heldAt or 0)>=fc-1 end,2.5)then return end
local bZ={}for qq,b0 in ipairs(dp)do local iP={}for iQ=1,b0 .n do local nh,iR=c.slot(b0 .args[iQ],b0)
if iR then f("crate call has "..iR.." - keeping the button method")return end iP[iQ]=nh
end bZ[#bZ+1]={m=b0 .m,n=b0 .n,args=iP}end local fe=c.learned c.learned={seq=bZ,mode=fe and fe.mode or nil}
A.dirty=true if not fe then f(("learned how to open crates directly (%d call%s)"):format(#bZ,#bZ==1 and""or"s"))end
end function c.replay()local iS=c.learned local iT=bw:FindFirstChild("Remotes")local ff=iT and iT:FindFirstChild("CrateAction")
if not(iS and ff)then return false end local iU=table.unpack or unpack c.replaying=true
for qr,b1 in ipairs(iS.seq)do local fg={}for iV=1,b1 .n do fg[iV]=c.resolve(b1 .args[iV])end
task.spawn(function()pcall(function()if b1 .m=="InvokeServer"then ff:InvokeServer(iU(fg,1,b1 .n))
else ff:FireServer(iU(fg,1,b1 .n))end end)end)task.wait(0.2)end c.replaying=false return true
end function c.esc(ni)return(ni:gsub("[%%|;=,\n]",function(nj)return("%%%02X"):format(nj:byte())end))end
function c.enc(a4)local dq=type(a4)if dq=="string"then return"s"..c.esc(a4)end if dq=="number"then return"n"..tostring(a4)end
if dq=="boolean"then return a4 and"b1"or"b0"end if dq=="nil"then return"z"end if a4 .__slot then return"k"..a4 .__slot end
local fh={}for nk,nl in pairs(a4)do fh[#fh+1]=c.enc(nk).."="..c.enc(nl)end return"t"..table.concat(fh,",")
end function c.dec(iW)local b2,b3=iW:sub(1,1),iW:sub(2)local function nm(nn)return(nn:gsub("%%(%x%x)",function(no)return string.char(tonumber(no,16))end))end
if b2=="s"then return nm(b3)end if b2=="n"then return tonumber(b3)end if b2=="b"then return b3=="1"end
if b2=="k"then return{__slot=b3}end if b2=="t"then local iX={}for np in b3:gmatch("[^,]+")do
local iY,nq=np:match("^(.-)=(.*)$")if iY then local iZ=c.dec(iY)if iZ~=nil then iX[iZ]=c.dec(nq)end
end end return iX end return nil end function c.goneOrNew(nr)return function()if not c.waiting then return true end
local i0=C()return i0~=nil and i0~=nr end end function c.smart()local fi=c.title local a5=c.learned
if a5 then local fj=C()if c.on then c.replay()if aa(c.goneOrNew(fj),3.5)then a.crates=a.crates+1
f("OPENED "..fi.." (direct)")return true end else if a5 .mode~="window"then c.replay()if aa(c.goneOrNew(fj),3.5)then
a.crates,c.fails=a.crates+1,0 if a5 .mode~="direct"then a5 .mode,A.dirty="direct",true f("crates now open directly - the window never comes up")
end f("OPENED "..fi.." (direct, no window)")return true end end if e6()then c.replay()if aa(c.goneOrNew(fj),3.5)then
a.crates,c.fails=a.crates+1,0 if a5 .mode~="window"then a5 .mode,A.dirty="window",true f("crates need their window up first - it shows briefly")
end f("OPENED "..fi.." (direct, window up)")return true end end end c.fails=(c.fails or 0)+1
c.lastBad,c.learned,A.dirty=a5,nil,true if c.fails>=3 then c.directOff=true f("direct crate opening failed 3 times - using the button for now (see DUMP)")
else f("the learned crate call did not work - back to pressing Open")end end return dk(true)
end local ns={"sell","trash","discard","dispose","bin"}local function fk(dr)if type(dr)~="string"then return false end
dr=dr:lower()for qs,nt in ipairs(ns)do if dr:find(nt,1,true)then return true end end return false
end local function nu()local i1=bw:FindFirstChild("Remotes")local fl=i1 and i1:FindFirstChild("SellSquishy")
if not(fl and fl:IsA("RemoteEvent"))then return false end if not pcall(function()fl:FireServer()end)then return false end
return aa(function()return C()==nil end,1.5)end local function nv()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if g()-a.sellSearchAt<20 then return nil end a.sellSearchAt=g()local i2=aU()local i3=i2 and i2 .HumanoidRootPart.Position
local b4,i4 for qt,bn in ipairs((a.plot or cv):GetDescendants())do if bn:IsA("ProximityPrompt")and(fk(bn.ActionText)or fk(bn.ObjectText)or fk(bn.Name))then
local i5=gG(bn)local fm=(i5 and i3)and(i5-i3).Magnitude or 1e9 if fm<=400 and(not b4 or fm<i4)then b4,i4=bn,fm end
end end a.sellSpot=b4 a.noSellSpot=(b4==nil)return b4 end local function i6()local fn=C()
if not fn then a.holding=false return false end if aD(fn)then return false end local fo=L(E(fn))
if nu()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=g()+2.5,0
f("SOLD "..fo)return true end local bo=nv()if bo then local i7=bz(bo)if i7 then c6(i7,bo)
local i8=C()if i8 and not aD(i8)then local nw,nx=c_(bo,function()return C()==nil end,function()return bo.Enabled end)
if nw then a.sold,a.holding,a.sellFails=a.sold+1,false,0 f(("SOLD %s at %s via %s"):format(fo,W(bo),nx))
return true end end end end a.sellFails=a.sellFails+1 f("could not sell "..fo.." ("..a.sellFails..")")
return false end local ny={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function nz(bp)local ds=W(bp):lower()for qu,nA in ipairs(ny)do if ds:find(nA,1,true)then return 0 end end
local am,F=bp.Name:lower(),0 local function ag(nB,nC)return nB:find(nC,1,true)~=nil end
if ag(am,"collect")then F=F+60 end if ag(am,"cash")or ag(am,"money")then F=F+45 end if ag(am,"income")or ag(am,"claim")then F=F+35 end
if ag(am,"coin")or ag(am,"earn")or ag(am,"green")then F=F+20 end if am=="pad"or am=="touch"then F=F+25 end
if F==0 and(ag(ds,"collect")or ag(ds,"cash")or ag(ds,"money"))then F=25 end if F==0 then return 0 end
local b5=bp.Color if b5 .G>0.5 and b5 .G>b5 .R*1.4 and b5 .G>b5 .B*1.4 then F=F+15 end if math.min(bp.Size.X,bp.Size.Y,bp.Size.Z)<2 then F=F+5 end
return F end local function nD()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or g()-a.padSearchAt<20 then return nil end a.padSearchAt=g()local dt,b6,fp={},nil,29
for qv,du in ipairs(a.plot:GetDescendants())do if du:IsA("BasePart")then local dv=nz(du)
if dv>0 then dt[#dt+1]={s=dv,p=du}if dv>fp then b6,fp=du,dv end end end end table.sort(dt,function(nE,nF)return nE.s>nF.s end)
a.padCands,a.padPart=dt,b6 if b6 then f("collect pad: "..W(b6).." (score "..fp..")")end
return b6 end local fq="SAB_pad_v1.txt"local function nG(nH)if type(writefile)=="function"then pcall(writefile,fq,table.concat({nH:GetComponents()},","))end
end local function nI()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local nJ,i9=pcall(function()if isfile(fq)then return readfile(fq)end end)if not nJ or type(i9)~="string"then return nil end
local dw={}for nK in i9:gmatch("[^,]+")do dw[#dw+1]=tonumber(nK)end if#dw==12 then return CFrame.new(unpack(dw))end
end local function nL(fr,dx,nM)local nN=eR(fr)local fs=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local ah=(fs and fs:IsA("BasePart"))and(fs.Position-dx)or Vector3 .new(1,0,0)ah=Vector3 .new(ah.X,0,ah.Z)
if ah.Magnitude<0.05 then ah=Vector3 .new(1,0,0)end ah=ah.Unit for nO=0,7 do local dy=nO*math.pi/4
local nP=Vector3 .new(ah.X*math.cos(dy)-ah.Z*math.sin(dy),0,ah.X*math.sin(dy)+ah.Z*math.cos(dy))
local dz=dx+nP*(nM+5)local ft=hT(dz.X,dx.Y,dz.Z)if ft and math.abs(ft.Y-dx.Y)<8 then c5(fr,Vector3 .new(dz.X,ft.Y+nN,dz.Z))
if eS(fr,0.7)then return true end end end return false end local function nQ()a.lastCollect=g()
local b7=aU()if not b7 then return end local i_,nR=b7 .HumanoidRootPart,eR(b7)local b8,ja,b9,fu=nil,4,nil,"?"
local fv=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and fv and fv:IsA("BasePart")then
b8,fu=(fv.CFrame*a.manualPad).Position,"manual pad"else local av=nD()if av then b8=Vector3 .new(av.Position.X,av.Position.Y+av.Size.Y/2+nR,av.Position.Z)
ja,b9,fu=math.max(av.Size.X,av.Size.Z)/2,av,av.Name end end if not b8 then f("COLLECT: pad not found - stand on it and tap SET PAD")return end
local fw=an()c5(b7,b8)if b9 and type(firetouchinterest)=="function"then pcall(firetouchinterest,i_,b9,0)end
aC(e.PadDwell)if b9 and type(firetouchinterest)=="function"then pcall(firetouchinterest,i_,b9,1)end
aC(0.5)a.collected=a.collected+1 local fx=an()f(("COLLECTED (%s) %s"):format(fu,(fw and fx and fx>fw)and("+$"..ak(fx-fw))or"no cash change seen"))
nL(b7,b8,ja)end local b_ local function jb()if a.capHit then if e.AutoStart and g()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 f("trying again after being stopped for 5 minutes")b_(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not aU()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aV(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local fy,jc=eb()local dA=C()if dA then local ca=L(E(dA))if not aD(dA)then local fz=(v.gift and E(v.gift)==E(dA)and g()-v.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(ca,fz),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(ca,fz),"bad"
end return"sell",("selling %s (%s)"):format(ca,fz),"warn"end if fy<1 then return nil,("holding %s - 0 free stations"):format(ca),"wait"end
return"place",("waxing %s (%d free)"):format(ca,fy),"ok"end a.holding=false if e.Crates and not c.waiting and g()-(c.scanAt or 0)>1 then
c.scanAt=g()local fA=a.plot:FindFirstChild("CrateStand")if fA then for qw,cb in ipairs(fA:GetDescendants())do
if cb:IsA("ProximityPrompt")and cb.Enabled and df(cb)then local aw=cb.ObjectText if aw==""then aw=ba(fA,"TitleLabel")or""end
if aw~=""and l.wanted(aw)then local nS=cy(aw):gsub("crate$","")local jd for je in pairs(x.members)do if cy(je)==nS then jd=je end end
c.waiting,c.at,c.title,c.prompt=true,g(),aw,cb c.data={name=(aw:gsub("%s","")),rarity=jd,title=aw}
f(aw.." found waiting on your stand")end break end end end end local jf=l.wanted(c.data and c.data.name)or l.wanted(c.title)
if e.Crates and(c.on or c.waiting)and jf then local ax=c.title if g()<(c.ignoreUntil or 0)then
return nil,("%s - its buttons do not respond to me, press Open yourself"):format(ax),"bad"
end if c.on then if a.crateFails>=3 then c.ignoreUntil,a.crateFails=g()+120,0 f("could not press the "..ax.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(ax),"bad"end if g()-c.lastFail<8 then
return nil,("%s window open - could not press its buttons"):format(ax),"bad"end if c.byYou and g()-c.openedAt<60 then
return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(ax,math.ceil(60-(g()-c.openedAt))),"idle"
end return"cratesmart",("opening %s"):format(ax),"ok"end if c.summonFails>=3 then return nil,("%s waiting - could not open it, open it by hand then DUMP"):format(ax),"bad"
end if g()-c.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(ax),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(ax,(c.learned and c.learned.mode~="window")and" directly"or""),"ok"
end if(c.on or c.waiting)and not jf then local jg=c.title..tostring(c.rolledAt)if c.told~=jg then
c.told=jg f(c.title.." is not ticked - leaving it to the game")end end if c.rolled and not c.waiting and g()-c.rolledAt<6 and l.wanted(c.rolled)then
return nil,c.rolled.." rolled - waiting for it to land","wait"end if fy<1 then a.matchSince=nil
return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(jc,jc),"wait"end local fB=eh()
if not fB then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local cc=bL()
if cc and ib(cc.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(cc.name),"idle"end
if g()-c.lastFail<8 then return nil,("%s on the pad - could not open it"):format(cc.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(cc.name),"ok"end local aN=eP()
if aN.state~="match"then a.matchSince=nil if aN.state=="skip"and not fB.Enabled then return nil,aN.text.." (sold out)","idle"end
return nil,aN.text,aN.level end if not fB.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local cd=g()if cd<a.noCashUntil then local jh,nT=hL()if jh then return nil,("cash short: have $%s, price ~$%s"):format(ak(jh),ak(nT)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ak(an()),math.ceil(a.noCashUntil-cd)),"bad"
end if cd-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or cd
local ji=cd-a.matchSince if ji<e.Confirm then return nil,("confirming %s (%.2fs)"):format(aN.shown,ji),"ok"end
return"buy",("buying %s via %s"):format(aN.shown,aN.src),"ok"end local function ab(nU,nV,...)
if a.busy then return end a.busy,a.busyText=true,nU local nW,jj=pcall(nV,...)a.busy,a.busyText=false,""
if not nW and jj~=dY then f("ERR "..tostring(jj))end end local function nX()local a6,nY,nZ=jb()
a.reason,a.level=nY,nZ if a6=="place"then ab("waxing...",h9)elseif a6=="crate"then ab("opening crate...",dk,true)
elseif a6=="cratesmart"then ab("opening crate...",c.smart)elseif a6=="cratewin"then ab("opening the crate window...",e6)
elseif a6=="nocrate"then ab("discarding crate...",dk,false)elseif a6=="sell"then ab("selling...",i6)
elseif a6=="buy"then ab("buying...",h4,false)elseif e.Collect and not a.matchSince and g()-a.lastCollect>=e.Every then
ab("collecting money...",nQ)end end function b_(dB,n0)if dB==a.running then return end a.running=dB
if not n0 then e.AutoStart=dB end if dB then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
c.lastFail,c.summonFails,c.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=g()
a.plot=aV()or a.plot f("START")else a.reason="stopped"f("STOP")end end local function fC()
local fD={}local function j(n1)fD[#fD+1]=tostring(n1)end j("=== SAB "..aS.." DUMP "..os.date("%H:%M:%S").." ===")
j(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
j("reason: "..tostring(a.reason))j("targets: "..table.concat(hk(),", "))j(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
j("cash="..ak(an()))local n2,jk=C()j("in hands: "..tostring(n2)..(jk and(" ("..jk.ClassName..")")or"")..
"  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-g())))
j("  attribute SquishyEquipped = "..tostring(z:GetAttribute("SquishyEquipped")))local jl=a.plot and a.plot:FindFirstChild("SquishyEquipped")
j("  plot.SquishyEquipped = "..(jl and(#jl:GetChildren().." children")or"missing"))local fE=z.Character
if fE then local fF={}for qx,ce in ipairs(fE:GetDescendants())do if(ce:IsA("Model")or ce:IsA("Tool"))and ce.Name~=fE.Name then fF[#fF+1]=ce.ClassName..":"..ce.Name end
end j("  on the character: "..(table.concat(fF,", "):sub(1,300)))end local dC=bL()j("on pad: "..(dC and("%s [%s] %s"):format(dC.name,tostring(dC.rar),tostring(dC.price))or"nothing"))
j("sell spot: "..(a.sellSpot and W(a.sellSpot)or"none found"))j("--- CRATES ---")j(("waiting=%s windowOpen=%s title=%s rolled=%s (%ss ago) opened=%d tapWay=%s fails=%d/%d"):format(
tostring(c.waiting),tostring(c.on),c.title,tostring(c.rolled),c.rolledAt>0 and string.format("%.0f",g()-c.rolledAt)or"-",
a.crates,tostring(a.tapWay),a.crateFails,c.summonFails))j("--- CRATE OPENING ---")local function dD(aO,dE)
dE=dE or 0 local jm=type(aO)if jm=="string"then return("%q"):format(aO)end if jm=="table"then
if aO.__slot then return"<"..aO.__slot..">"end if dE>1 then return"{...}"end local fG={}
for n3,n4 in pairs(aO)do fG[#fG+1]=tostring(n3).."="..dD(n4,dE+1)end return"{"..table.concat(fG,",").."}"
end local n5,jn=pcall(function()return aO.ClassName end)if n5 and jn then return"<"..jn.." "..W(aO)..">"end
return tostring(aO)end j("watching CrateAction: "..tostring(c.oldNC~=nil).."  hookmetamethod="..type(hookmetamethod))
if c.learned then j("learned (mode "..tostring(c.learned.mode or"untried").."):")for n6,fH in ipairs(c.learned.seq)do
local jo={}for jp=1,fH.n do jo[jp]=dD(fH.args[jp])end j(("  %d. CrateAction:%s(%s)"):format(n6,fH.m,table.concat(jo,", ")))
end else j("not learned yet - it learns from the next crate that opens")end if c.directOff then j("direct opening is OFF for this session after 3 failures")end
if c.lastBad then j("last call that failed:")for n7,fI in ipairs(c.lastBad.seq)do local jq={}
for jr=1,fI.n do jq[jr]=dD(fI.args[jr])end j(("  %d. CrateAction:%s(%s)"):format(n7,fI.m,table.concat(jq,", ")))
end end j("CrateAction calls seen:")for qy,cf in ipairs(c.calls or{})do local js={}for jt=1,cf.n do js[jt]=dD(cf.args[jt])end
j(("  %.0fs ago  %s(%s)  [crate=%s]"):format(g()-cf.t,cf.m,table.concat(js,", "),tostring(cf.crate)))
end local bq=c.findWin()if bq and type(getconnections)=="function"then j("how the game wired its crate window buttons (handler counts):")
for qz,cg in ipairs(bq:GetDescendants())do if cg:IsA("GuiButton")then local fJ={}for qA,ju in ipairs({"MouseButton1Click","MouseButton1Down","MouseButton1Up","Activated",
"InputBegan","InputEnded","TouchTap"})do local n8,jv=pcall(function()return getconnections(cg[ju])end)
local jw=(n8 and type(jv)=="table")and#jv or-1 if jw~=0 then fJ[#fJ+1]=ju.."="..jw end end
j(("  %s %s %q: %s"):format(cg.ClassName,cg.Name,bk(cg),table.concat(fJ," ")))end end end
j(("crate window: %s visible=%s mine=%s yours=%s"):format(bq and W(bq)or"not found",tostring(bq and bq.Visible),tostring(c.ours),tostring(c.byYou)))
local dF=iw()j("crate prompt: "..(dF and(W(dF).." ["..dF.ActionText.."|"..dF.ObjectText.."]")or"none found"))
local jx=a.plot and a.plot:FindFirstChild("CrateStand")if jx then local fK=0 for qB,a7 in ipairs(jx:GetDescendants())do
fK=fK+1 if fK>30 then j("  ...")break end local jy=""if a7:IsA("ProximityPrompt")then jy=(" [%s|%s|on=%s|hold=%.2f]"):format(a7 .ActionText,a7 .ObjectText,tostring(a7 .Enabled),a7 .HoldDuration)end
j("  CrateStand/"..W(a7):gsub("^.-CrateStand%.","").." ("..a7 .ClassName..")"..jy)end else
j("  no CrateStand in the plot")end j("enabled prompts in the plot:")if a.plot then for qC,br in ipairs(a.plot:GetDescendants())do
if br:IsA("ProximityPrompt")and br.Enabled then j(("  %s [%s|%s] safe=%s"):format(W(br),br.ActionText,br.ObjectText,tostring(df(br))))
end end end local jz=z:FindFirstChildOfClass("PlayerGui")if jz then j("buttons on screen that say open/discard:")
for qD,ci in ipairs(jz:GetDescendants())do if ci:IsA("GuiButton")and db(ci)then local fL=bk(ci)
if fL:find("open",1,true)or fL:find("discard",1,true)then j(("  %s %s -> %q"):format(ci.ClassName,W(ci),fL))
end end end end j("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(de~=nil))
j("--- CATALOG ("..x.n.." butters, worst rarity first) ---")for qE,dG in ipairs(x.rarOrder)do
local fM={}for qF,jA in ipairs(x.members[dG]or{})do fM[#fM+1]=(e.Targets[jA]and"*"or"")..L(jA)
end j(("  [%s]%s %s"):format(dG,A.price[dG]and(" crate $"..ak(A.price[dG]))or"",table.concat(fM,", ")))
end j("learned orders: ")for n9,n_ in pairs(A.order)do j("  "..n9 ..": "..table.concat(n_,", "))end
j("--- PLOT ---")j("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for qG,fN in ipairs(a.plot:GetChildren())do
j(("  %s %s (%d)"):format(fN.ClassName,fN.Name,#fN:GetChildren()))end local oa,ob=eb()j(("stations free %d / %d"):format(oa,ob))
local fO=eh()j("BuyPrompt: "..(fO and("enabled="..tostring(fO.Enabled).." hold="..fO.HoldDuration)or"MISSING"))
end j("autostart="..tostring(e.AutoStart).." rejoin="..tostring(e.Rejoin))j(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))j("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#eB())j("--- COLLECT PAD ---")
j("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and W(a.padPart)or"none"))
j("--- ATTRIBUTES ---")for qH,jB in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
j(("  %s = %s"):format(jB,tostring(z:GetAttribute(jB))))end j("--- EVENTS ---")for oc=math.max(1,#aT-15),#aT do j("  "..aT[oc])end
j("--- LOG ---")for od=math.max(1,#aB-25),#aB do j("  "..aB[od])end return table.concat(fD,"\n")
end do local aP=eA(M.auto)if type(aP)=="string"then aP=aP:gsub("%s+$","")if aP~=""then a.autoload=aP
local oe=hw(aP)f(oe and("loaded config "..aP)or("config "..aP.." could not be loaded"))
end end end local d={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local of={ok=d.good,wait=d.warn,warn=d.warn,bad=d.bad,idle=d.dim}
local jC={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function r(og,oh,oi)
local oj,fP=pcall(Instance.new,og)if not oj then a.uiErrs=a.uiErrs+1 return nil end for ol,om in pairs(oh)do
if not pcall(function()fP[ol]=om end)then a.uiErrs=a.uiErrs+1 end end fP.Parent=oi return fP
end local function N(oo,op)r("UICorner",{CornerRadius=UDim.new(0,op or 6)},oo)end local b={}
local fQ=z:FindFirstChildOfClass("PlayerGui")or z:WaitForChild("PlayerGui")local jD=fQ:FindFirstChild("SABFarmGui")
if jD then jD:Destroy()end local fR=r("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},fQ)
local H={w=320,h=330,head=30,strip=38,tabs=26}b.root=r("Frame",{Name="Root",Size=UDim2 .new(0,H.w,0,H.h),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=d.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},fR)
N(b.root,10)r("UIStroke",{Color=d.line,Thickness=1},b.root)local a8=UDim2 .new(1,0,1,0)
local function u(jE,jF)return UDim2 .new(jE,0,0,0),UDim2 .new(jF,(jE+jF>0.99)and 0 or-4,1,0)end
local function q(oq,ot,ou,ov,ow,ox)local jG=r("TextButton",{Text=ot,Position=ow,Size=ox,BackgroundColor3=ou,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=ov,TextColor3=d.text,AutoButtonColor=true},oq)N(jG,6)
return jG end local function jH(oy,oz,oA,oB,oC)local fS=r("TextBox",{Text=oz,PlaceholderText=oA,Position=oB,Size=oC,BackgroundColor3=d.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=d.text,PlaceholderColor3=d.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},oy)N(fS,6)r("UIPadding",{PaddingLeft=UDim.new(0,8)},fS)
return fS end local dH=cv.CurrentCamera local function oD()local oE,dI=pcall(function()return dH and dH.ViewportSize end)
if oE and dI and dI.X>50 and dI.Y>50 then return dI end end local function aQ(cj)local fT=oD()
if not(fT and cj and cj.Parent)then return end local oF=pcall(function()local dJ,jI=cj.AbsolutePosition,cj.AbsoluteSize
local fU=70 local jJ=math.clamp(dJ.X,fU-jI.X,fT.X-fU)local jK=math.clamp(dJ.Y,0,fT.Y-math.min(jI.Y,fU))
if math.abs(jJ-dJ.X)>0.5 or math.abs(jK-dJ.Y)>0.5 then cj.Position=UDim2 .new(0,math.floor(jJ),0,math.floor(jK))
end end)return oF end local function dK(oG)local oH,fV=pcall(function()return oG.AbsolutePosition end)
if oH and fV then return{math.floor(fV.X),math.floor(fV.Y)}end end local dL={}local function jL(dM,jM,jN)
I(dM.InputBegan:Connect(function(ck)if ck.UserInputType~=Enum.UserInputType.MouseButton1 and ck.UserInputType~=Enum.UserInputType.Touch then return end
dL[dM]={start=ck.Position,from=jM.Position,moved=0,target=jM}local fW fW=ck.Changed:Connect(function()
if ck.UserInputState==Enum.UserInputState.End then local jO=dL[dM]dL[dM]=nil if fW then fW:Disconnect()end
if jO and jN then jN(jO.moved)end end end)end))end I(kK.InputChanged:Connect(function(dN)
if dN.UserInputType~=Enum.UserInputType.MouseMovement and dN.UserInputType~=Enum.UserInputType.Touch then return end
for qI,ay in pairs(dL)do local fX=ay.target if fX and fX.Parent then local jP,jQ=dN.Position.X-ay.start.X,dN.Position.Y-ay.start.Y
ay.moved=math.max(ay.moved,math.abs(jP)+math.abs(jQ))fX.Position=UDim2 .new(ay.from.X.Scale,ay.from.X.Offset+jP,ay.from.Y.Scale,ay.from.Y.Offset+jQ)
end end end))local function D(oI,oJ,oK,oL,oM,oN,oO)return r("TextLabel",{Text=oJ,Position=oN or UDim2 .new(0,0,0,0),Size=oO or a8,BackgroundTransparency=1,
Font=oM and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=oK,TextColor3=oL,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},oI)
end b.title=r("Frame",{Size=UDim2 .new(1,0,0,H.head),BackgroundColor3=d.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=r("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=d.dim,BorderSizePixel=0},b.title)
N(b.dot,5)D(b.title,"SAB  BUTTER FARM  "..aS,12,d.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=q(b.title,"-",d.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=q(b.title,"X",d.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=r("Frame",{Position=UDim2 .new(0,0,0,H.head),Size=UDim2 .new(1,0,0,H.strip),BackgroundColor3=d.bg,BorderSizePixel=0},b.root)
b.bar=r("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=d.warn,BorderSizePixel=0},b.strip)
N(b.bar,2)b.reason=D(b.strip,"starting",12,d.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=r("Frame",{Position=UDim2 .new(0,0,0,H.head+H.strip),Size=UDim2 .new(1,0,0,H.tabs),BackgroundTransparency=1},b.root)
b.tabFarm=q(b.tabs,"FARM",d.accent,10,UDim2 .new(0,8,0,0),UDim2 .new(0.25,-9,1,-4))b.tabBut=q(b.tabs,"BUTTERS",d.panel2,10,UDim2 .new(0.25,2,0,0),UDim2 .new(0.25,-4,1,-4))
b.tabCrt=q(b.tabs,"CRATES",d.panel2,10,UDim2 .new(0.5,2,0,0),UDim2 .new(0.25,-4,1,-4))b.tabSet=q(b.tabs,"SETUP",d.panel2,10,UDim2 .new(0.75,2,0,0),UDim2 .new(0.25,-10,1,-4))
local function dO()local fY=r("ScrollingFrame",{Position=UDim2 .new(0,0,0,H.head+H.strip+H.tabs),Size=UDim2 .new(1,0,1,-(H.head+H.strip+H.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=d.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)r("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},fY)
r("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},fY)
return fY end b.farm,b.but,b.set,b.crt=dO(),dO(),dO(),dO()b.but.Visible,b.set.Visible,b.crt.Visible=false,false,false
local dP,cl,o=0,12,nil local function T(jR,oP)dP,cl=dP+1,cl+jR+6 return r("Frame",{Size=UDim2 .new(1,0,0,jR),BackgroundTransparency=1,LayoutOrder=dP},oP or b.farm)
end local function cm(oQ)D(T(14),oQ,10,d.dim,true)end o=T(34)b.startB=q(o,"START",d.good,14,u(0,0.68))
b.killB=q(o,"KILL",d.bad,14,u(0.68,0.32))local oR=T(42)local function cn(jS,oS,fZ)local f0=r("Frame",{Position=UDim2 .new((jS-1)/fZ,0,0,0),Size=UDim2 .new(1/fZ,jS<fZ and-4 or 0,1,0),
BackgroundColor3=d.panel,BorderSizePixel=0},oR)N(f0,6)local jT=D(f0,"0",15,d.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local oT=D(f0,oS,9,d.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))jT.TextXAlignment,oT.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return jT end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=cn(1,"BOUGHT",5),cn(2,"WAXED",5),cn(3,"SOLD",5),cn(4,"MONEY",5),cn(5,"FREE",5)
b.info=D(T(40),"",10,d.dim,false)b.tgt=D(T(26),"",10,d.good,false)cm("MONEY COLLECT")o=T(28)
b.secB=jH(o,tostring(e.Every),"60",u(0,0.2))D(o,"sec",11,d.dim,false,u(0.21,0.09))b.secSet=q(o,"SET",d.accent,12,u(0.3,0.2))
b.colT=q(o,"COLLECT: ON",d.accent,11,u(0.5,0.5))o=T(26)b.padB=q(o,"SET PAD (stand on it)",d.panel2,10,u(0,0.55))
b.padL=D(o,"",10,d.dim,false,u(0.56,0.44))cm("BUTTERS YOU DID NOT TICK, AND CRATES")o=T(28)
b.sellT=q(o,"SELL THEM: ON",d.accent,11,u(0,0.55))b.sellB=q(o,"SELL NOW",d.warn,11,u(0.55,0.45))
o=T(28)b.crateT=q(o,"OPEN CRATES: ON",d.accent,11,u(0,0.55))b.crateB=q(o,"OPEN NOW",d.warn,11,u(0.55,0.45))
cm("TOOLS")o=T(30)b.buyB=q(o,"BUY",d.warn,10,u(0,0.2))b.plB=q(o,"WAX",d.good,10,u(0.2,0.2))
b.dumpB=q(o,"DUMP",d.accent,10,u(0.4,0.2))b.copyB=q(o,"COPY",d.panel2,10,u(0.6,0.2))b.linkB=q(o,"LINK",d.good,10,u(0.8,0.2))
cm("LOG")b.log=r("TextLabel",{Size=a8,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=d.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},T(84))N(b.log,6)r("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},b.log)
cm("OUTPUT  (DUMP result)")b.out=r("TextBox",{Size=a8,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},T(110))N(b.out,6)
b.farm.CanvasSize=UDim2 .new(0,0,0,cl)dP,cl=0,12 local function ac(oU)return T(oU,b.set)end
local function dQ(oV)D(ac(14),oV,10,d.dim,true)end dQ("SETTINGS FILE  (saved on your phone)")
o=ac(28)b.cfgName=jH(o,"default","config name",u(0,0.5))b.cfgSave=q(o,"SAVE",d.good,11,u(0.5,0.25))
b.cfgLoad=q(o,"LOAD",d.accent,11,u(0.75,0.25))o=ac(26)b.cfgPrev=q(o,"<",d.panel2,11,u(0,0.13))
b.cfgPick=q(o,"(none saved)",d.panel2,10,u(0.13,0.74))b.cfgNext=q(o,">",d.panel2,11,u(0.87,0.13))
o=ac(26)b.cfgAuto=q(o,"LOAD IT ON LAUNCH: OFF",d.panel2,10,u(0,1))b.cfgMsg=D(ac(26),"",10,d.dim,false)
dQ("START BY ITSELF")o=ac(26)b.autoB=q(o,"INSTALL F.exec",d.accent,10,u(0,1))b.autoMsg=D(ac(30),"",10,d.dim,false)
o=ac(28)b.startT=q(o,"START FARMING ON LOAD: ON",d.accent,10,u(0,1))D(ac(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,d.dim,false)
dQ("IF THE GAME DROPS ME")o=ac(28)b.rejT=q(o,"AUTO REJOIN: ON",d.accent,11,u(0,0.55))b.rejB=q(o,"REJOIN NOW",d.warn,11,u(0.55,0.45))
b.rejMsg=D(ac(30),"",10,d.dim,false)dQ("THE ROUND SAB BUTTON")D(ac(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,d.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,cl)local jU=r("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},fQ)
b.tgRoot=r("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=d.accent,BorderSizePixel=0,Active=true},jU)N(b.tgRoot,26)r("UIStroke",{Color=d.line,Thickness=1},b.tgRoot)
b.tgBtn=r("TextButton",{Text="SAB",Size=a8,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=d.text,AutoButtonColor=false},b.tgRoot)b.tgDot=r("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=d.dim,
BorderSizePixel=0},b.tgRoot)N(b.tgDot,4)local az={built=false,boxes={},at=0}local function jV(jW,f1)
e.Targets[jW]=f1 or nil local f2=az.boxes[jW]if f2 then f2 .Text=f1 and"X"or""f2 .BackgroundColor3=f1 and d.good or d.panel2
end end local function f3()for oW,jX in pairs(az.boxes)do local jY=e.Targets[oW]==true jX.Text=jY and"X"or""
jX.BackgroundColor3=jY and d.good or d.panel2 end end local co local function oX()local oY=0
local f4=r("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=D(f4,"",10,d.dim,false,u(0,0.5))local oZ=q(f4,"CLEAR",d.panel2,10,u(0.5,0.24))
local o0=q(f4,"REFRESH",d.panel2,10,u(0.74,0.26))oZ.MouseButton1Click:Connect(function()
for o1 in pairs(e.Targets)do e.Targets[o1]=nil end f3()end)o0 .MouseButton1Click:Connect(function()
x.at=0 ez()co(true)end)return oY end co=function(o2)if not ez()then if not b.butEmpty then
b.butEmpty=D(r("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,d.warn,false)end return
end if az.built and not o2 and az.at==x.at then return end for qJ,f5 in ipairs(b.but:GetChildren())do
if f5:IsA("Frame")or f5:IsA("TextButton")then f5:Destroy()end end az.boxes,b.butEmpty={},nil
oX()local f6,f7=36,1 local function jZ(j0)f7=f7+1 local o3=r("Frame",{Size=UDim2 .new(1,0,0,j0),BackgroundTransparency=1,LayoutOrder=f7},b.but)
f6=f6+j0+6 return o3 end for qK,dR in ipairs(x.rarOrder)do local o4=jZ(24)local o5=jC[dR]or d.text
local f8=r("Frame",{Size=a8,BackgroundColor3=d.panel,BorderSizePixel=0},o4)N(f8,6)D(f8,"  "..dR:upper(),11,o5,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local o6=q(f8,"ALL",d.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local o7=dR
o6 .MouseButton1Click:Connect(function()local j1=x.members[o7]or{}local j2=false for qL,o8 in ipairs(j1)do if not e.Targets[o8]then j2=true break end end
for qM,o9 in ipairs(j1)do jV(o9,j2)end end)for qN,f9 in ipairs(x.members[dR]or{})do local o_=jZ(22)
local dS=r("TextButton",{Text="",Size=a8,BackgroundColor3=d.bg,BorderSizePixel=0,AutoButtonColor=true},o_)
N(dS,5)D(dS,"   "..L(f9),11,d.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local f_=r("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},dS)
N(f_,4)az.boxes[f9]=f_ local j3=f9 local function j4()jV(j3,not e.Targets[j3])end dS.MouseButton1Click:Connect(j4)
f_.MouseButton1Click:Connect(j4)end end f3()b.but.CanvasSize=UDim2 .new(0,0,0,f6+10)az.built,az.at=true,x.at
end function l.paint()for pa,j5 in pairs(l.boxes)do local j6=e.CrateTicks[pa]==true j5 .Text=j6 and"X"or""
j5 .BackgroundColor3=j6 and d.good or d.panel2 end if b.crtInfo then local ga,gb=0,0 for qO in pairs(l.boxes)do ga=ga+1 end
for qP,pb in pairs(e.CrateTicks)do if pb then gb=gb+1 end end b.crtInfo.Text=("%d crates, %d ticked"):format(ga,gb)
end if b.crtAll then b.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"
b.crtAll.BackgroundColor3=e.Crates and d.accent or d.panel2 end end function l.build()for qQ,gc in ipairs(b.crt:GetChildren())do
if gc:IsA("Frame")or gc:IsA("TextButton")then gc:Destroy()end end l.boxes={}local gd,ge=12,0
local function dT(j7)ge=ge+1 gd=gd+j7+6 return r("Frame",{Size=UDim2 .new(1,0,0,j7),BackgroundTransparency=1,LayoutOrder=ge},b.crt)
end local gf=dT(28)b.crtInfo=D(gf,"",10,d.dim,false,u(0,0.5))local pc=q(gf,"CLEAR",d.panel2,10,u(0.5,0.24))
local pd=q(gf,"REFRESH",d.panel2,10,u(0.74,0.26))I(pc.MouseButton1Click:Connect(function()e.CrateTicks={}l.paint()end))
I(pd.MouseButton1Click:Connect(function()l.build()end))b.crtAll=q(dT(28),"",d.accent,11,u(0,1))
I(b.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates l.paint()end))D(dT(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,d.dim,false)
for qR,aA in ipairs(l.list())do local pe=dT(24)local cp=r("TextButton",{Text="",Size=a8,BackgroundColor3=d.panel,BorderSizePixel=0,AutoButtonColor=true},pe)
N(cp,5)D(cp,"  "..(aA.title or aA.name)..(aA.guess and"  (?)"or""),11,jC[aA.rar or""]or d.text,true,
UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))D(cp,aA.price and("$"..ak(aA.price))or(aA.rar or""),9,d.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local gg=r("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},cp)
N(gg,4)l.boxes[aA.k]=gg local j8=aA.k local function j9()e.CrateTicks[j8]=(not e.CrateTicks[j8])or nil
l.paint()end I(cp.MouseButton1Click:Connect(j9))I(gg.MouseButton1Click:Connect(j9))end b.crt.CanvasSize=UDim2 .new(0,0,0,gd+10)
l.built=l.at l.paint()end local j_="farm"local function bs(ai)j_=ai b.farm.Visible,b.but.Visible,b.set.Visible=(ai=="farm"),(ai=="but"),(ai=="set")
b.crt.Visible=(ai=="crt")b.tabCrt.BackgroundColor3=(ai=="crt")and d.accent or d.panel2 if ai=="crt"and(l.built~=l.at or not next(l.boxes))then l.build()end
b.tabFarm.BackgroundColor3=(ai=="farm")and d.accent or d.panel2 b.tabBut.BackgroundColor3=(ai=="but")and d.accent or d.panel2
b.tabSet.BackgroundColor3=(ai=="set")and d.accent or d.panel2 if ai=="but"then co(false)end
end local function J(ka,kb,pf,pg)ka.Text=kb and pf or pg ka.BackgroundColor3=kb and d.accent or d.panel2
end local function ph()b.secB.Text=tostring(e.Every)J(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
J(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")J(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
J(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")J(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then b_(e.AutoStart,true)end if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end aQ(b.root)
aQ(b.tgRoot)a.lastCollect=g()f3()l.paint()end local function pj(kc)task.spawn(function()
kc.TextColor3=d.bad task.wait(0.8)if a.alive then kc.TextColor3=d.text end end)end local function kd()
local ke=b.secB.Text:match("^%s*(%d+)%s*$")local cq=ke and tonumber(ke)if not cq or cq<1 then
b.secB.Text=tostring(e.Every)pj(b.secB)f("interval must be a whole number >= 1")return end
if cq==e.Every then return end e.Every,a.lastCollect=cq,g()f("collect every "..cq.."s")
end local function gh(pk)local kf=setclipboard or toclipboard return type(kf)=="function"and pcall(kf,pk)
end local function pl()local gi=O~=""and O or(a.reason.."\n"..table.concat(aB,"\n"))if gh(gi)then f("copied "..#gi.." chars")return end
b.out.Text=gi pcall(function()b.out:CaptureFocus()end)f("no clipboard here - select the text in OUTPUT")
end local function pm()local pn,kg=pcall(fC)O=pn and kg or("DUMP ERROR "..tostring(kg))
local kh=gh(O)b.out.Text=(kh and#O>7000)and(O:sub(1,7000).."\n... (full text is on your clipboard)")or O
f("DUMP "..#O.." chars"..(kh and", copied"or""))end local function y(po,pp)I(po.MouseButton1Click:Connect(pp))end
y(b.secSet,kd)I(b.secB.FocusLost:Connect(kd))y(b.colT,function()e.Collect,a.lastCollect=not e.Collect,g()
J(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")end)y(b.sellT,function()e.SellJunk=not e.SellJunk
J(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)y(b.sellB,function()a.sellFails=0
task.spawn(ab,"selling...",i6)end)y(b.crateT,function()e.Crates=not e.Crates J(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)y(b.crateB,function()c.lastFail,c.summonFails,c.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(ab,"opening crate...",dk,true)
end)y(b.padB,function()a.plot=aV()or a.plot local ki,gj=aU(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(ki and gj and gj:IsA("BasePart"))then f("SET PAD: need character and plot")return end
a.manualPad=gj.CFrame:ToObjectSpace(ki.HumanoidRootPart.CFrame)nG(a.manualPad)f("collect pad saved at your position")
end)y(b.startB,function()b_(not a.running)end)y(b.buyB,function()a.plot=aV()or a.plot task.spawn(ab,"buying (manual)...",h4,true)
end)y(b.plB,function()a.plot=aV()or a.plot task.spawn(ab,"waxing (manual)...",h9)end)y(b.dumpB,pm)
y(b.copyB,pl)y(b.linkB,function()task.spawn(function()local pq,pr=pcall(fC)O=pq and pr or O
if O==""then O="(empty dump)"end local kj=(type(request)=="function"and request)or(type(http_request)=="function"and http_request)
or(syn and syn.request)or(http and http.request)if type(kj)~="function"then b.out.Text="this executor cannot upload - use COPY instead"return end
b.out.Text="uploading..."local kk,bt=pcall(kj,{Url="https://paste.rs/",Method="POST",Headers={["Content-Type"]="text/plain"},Body=O})
local gk=kk and type(bt)=="table"and(bt.StatusCode or bt.status_code)or 0 local ps=kk and type(bt)=="table"and(bt.Body or bt.body)or""
local gl=(gk>=200 and gk<300)and tostring(ps):match("https?://[%w%./%-_]+")or nil if not gl then
b.out.Text="upload failed ("..tostring(gk)..") - use COPY instead"f("LINK failed")return
end local kl=gh(gl)b.out.Text="SEND THIS LINK TO CLAUDE:\n"..gl..(kl and"\n(copied)"or"")
f("dump uploaded"..(kl and", link copied"or""))end)end)y(b.tabFarm,function()bs("farm")end)
y(b.tabBut,function()bs("but")end)y(b.tabSet,function()bs("set")end)y(b.tabCrt,function()bs("crt")end)
local function km(gm)a.hidden=gm b.root.Visible=not gm b.tgBtn.Text=gm and"SAB+"or"SAB"
end jL(b.tgRoot,b.tgRoot,function(pt)aQ(b.tgRoot)a.togPos=dK(b.tgRoot)or a.togPos if pt<8 then km(not a.hidden)end
end)y(b.tgBtn,function()km(not a.hidden)end)local V,K={},0 local function aR()V=eB()if#V==0 then
b.cfgPick.Text="(none saved)"K=0 return end if K<1 or K>#V then K=1 end b.cfgPick.Text=V[K]..("  (%d/%d)"):format(K,#V)
end local function kn()local ko=a.autoload~=nil b.cfgAuto.Text=ko and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
b.cfgAuto.BackgroundColor3=ko and d.accent or d.panel2 end local function gn()local kp=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if kp~=""then return kp end return(K>0 and V[K])or""end y(b.cfgSave,function()a.winPos=dK(b.root)or a.winPos
a.togPos=dK(b.tgRoot)or a.togPos local kq,kr=eF(gn())b.cfgMsg.Text=kq and("saved as "..kr)or("could not save: "..kr)
b.cfgMsg.TextColor3=kq and d.good or d.bad aR()f(b.cfgMsg.Text)end)local function pu(ks)
local go,kt=hw(ks)b.cfgMsg.Text=go and("loaded "..kt)or("could not load: "..kt)b.cfgMsg.TextColor3=go and d.good or d.bad
if go then b.cfgName.Text=ks ph()end f(b.cfgMsg.Text)end y(b.cfgLoad,function()pu(gn())end)
y(b.cfgPick,function()aR()if K>0 then b.cfgName.Text=V[K]end end)y(b.cfgPrev,function()
if#V==0 then aR()return end K=(K-2)%#V+1 aR()b.cfgName.Text=V[K]end)y(b.cfgNext,function()
if#V==0 then aR()return end K=K%#V+1 aR()b.cfgName.Text=V[K]end)y(b.cfgAuto,function()if a.autoload then
hy(nil)b.cfgMsg.Text="it will not load a config on launch"else local cr=gn()local ku=false
for qS,pv in ipairs(eB())do if pv==cr then ku=true end end local pw=ku or eF(cr)if pw and cr~=""then
hy(cr)aR()b.cfgMsg.Text=cr.." will load every time the script starts"else b.cfgMsg.Text="name the config and save it first"
end end b.cfgMsg.TextColor3=d.dim kn()end)y(b.autoB,function()local kv,kw=l1()b.autoMsg.Text=kv and("installed. "..kw)or("failed: "..kw)
b.autoMsg.TextColor3=kv and d.good or d.bad f(b.autoMsg.Text)end)y(b.startT,function()e.AutoStart=not e.AutoStart
J(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)y(b.rejT,function()
e.Rejoin=not e.Rejoin J(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)y(b.rejB,function()cZ("you asked")end)
local bu=false y(b.minB,function()bu=not bu b.tabs.Visible=not bu if bu then b.farm.Visible,b.but.Visible,b.set.Visible,b.crt.Visible=false,false,false,false
else bs(j_)end b.root.Size=UDim2 .new(0,H.w,0,bu and(H.head+H.strip)or H.h)b.minB.Text=bu and"+"or"-"
end)local function dU()if not a.alive then return end a.alive,a.running=false,false pcall(ej)
for qT,px in ipairs(dZ)do pcall(function()px:Disconnect()end)end if c.oldNC then pcall(function()hookmetamethod(game,"__namecall",c.oldNC)end)end
pcall(function()fR:Destroy()end)pcall(function()jU:Destroy()end)if a9 .SAB_KILL==dU then a9 .SAB_KILL=nil end
end a9 .SAB_KILL=dU y(b.killB,dU)y(b.xB,dU)jL(b.title,b.root,function()aQ(b.root)a.winPos=dK(b.root)or a.winPos
end)local function kx()local cs,ct=a.reason,a.level if a.busy then cs,ct=a.busyText,"ok"
elseif not a.running then local qU,ky,py=jb()if a.capHit then cs,ct=ky,"bad"else cs,ct="[stopped] "..ky,(py=="bad")and"bad"or"idle"end
a.reason,a.level=cs,ct end b.reason.Text=cs b.bar.BackgroundColor3=of[ct]or d.dim b.dot.BackgroundColor3=a.running and d.good or(a.capHit and d.bad or d.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and d.panel2 or d.accent
b.startB.Text=a.running and"STOP"or"START"J(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and d.warn or d.good local pz,pA=eb()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),pz.."/"..pA local kz=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(g()-a.lastCollect)))or nil
local kA=C()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ak(an()),a.rolls,a.gifts,a.crates,kA and L(E(kA))or"nothing",c.on and("   ["..c.title.." window open]")or"",
kz and("in "..kz.."s")or"off")local bv=hk()b.tgt.Text=(#bv==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#bv<=3)and table.concat(bv,", ")or(#bv.." butters ticked")))b.tgt.TextColor3=(#bv==0)and d.bad or d.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(cw,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(x.n,#x.rarOrder,#bv)
end if b.but.Visible and az.at~=x.at then co(false)end if b.crt.Visible then if l.built~=l.at then l.build()else l.paint()end
end J(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end a9 .SAB={S=a,CFG=e,EV=v,U=b,sg=fR,dump=fC,CAT=x,LEARN=A,buildList=co}
f(aS.." loaded")if a.uiErrs>0 then f("UI: "..a.uiErrs.." properties skipped")end bs("farm")
aQ(b.root)aQ(b.tgRoot)if dH then pcall(function()I(dH:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)aQ(b.root)aQ(b.tgRoot)end))end)end aR()kn()if a.config and a.config~=""then b.cfgName.Text=a.config end
J(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")J(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")
J(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")J(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
J(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")b.secB.Text=tostring(e.Every)
pcall(kx)task.spawn(function()local kB=eH()b.rejMsg.Text=kB and("after a rejoin it restarts from\n"..kB)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(eA(M.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(l7)end)task.spawn(function()while a.alive do local pB,pC=pcall(kx)if not pB then f("UI ERR "..tostring(pC))end
task.wait(0.25)end end)task.spawn(function()local pD,pE=pcall(mf)if not pD then f("HOOK ERR "..tostring(pE))end
end)task.spawn(function()pcall(k8)if c.loadSeq and not c.learned then local dV={}for kC=1,20 do if c.loadSeq[kC]then dV[#dV+1]=c.loadSeq[kC]end end
if#dV>0 then c.learned={seq=dV,mode=c.loadMode}f("remembered how to open crates directly")
end end if ez()then f(("catalog: %d butters in %d rarities"):format(x.n,#x.rarOrder))end
local pF,kD=pcall(nI)if pF and kD and a.alive and not a.manualPad then a.manualPad=kD end
end)task.spawn(function()while a.alive do task.wait(20)pcall(ej)end end)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local pH=(type(newcclosure)=="function")and newcclosure or function(pG)return pG end
local gp gp=hookmetamethod(game,"__namecall",pH(function(kE,...)if a.alive and not c.replaying then
local gq=getnamecallmethod()if gq=="InvokeServer"or gq=="FireServer"then local pI,pJ=pcall(function()return kE.Name end)
if pI and pJ=="CrateAction"then pcall(c.saw,gq,...)end end end return gp(kE,...)end))c.oldNC=gp
end)end if dX then I(z.Idled:Connect(function()pcall(function()dX:CaptureController()dX:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()if not e.AutoStart then return end a.reason,a.level="waiting for the game to load, then starting","wait"
for qV=1,120 do if not a.alive then return end if a.running then return end a.plot=a.plot or aV()
if aU()and a.plot and next(e.Targets)then b_(true,true)f("started by itself")return end
task.wait(1)end if a.alive and not a.running then f("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=aV()a.lastCollect=g()while a.alive do if a.running then
local pK,kF=pcall(nX)if not pK and kF~=dY then f("LOOP ERR "..tostring(kF))end end task.wait(0.1)
end end)dW("loaded - window is at the top left")end local pM,gr=xpcall(kJ,function(pL)return tostring(pL).."\n"..debug.traceback()end)
if not pM then pcall(function()warn("SAB "..aS.." ERROR: "..tostring(gr))end)dW("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..aS.." ERROR: "..tostring(gr))end)pcall(function()local kG=(type(getgenv)=="function"and getgenv())or _G
if type(kG.SAB_KILL)=="function"then kG.SAB_KILL()end for qW,pN in ipairs({"SABFarmGui","SABToggle"})do
local kH=z.PlayerGui:FindFirstChild(pN)if kH then kH:Destroy()end end end)pcall(function()
local cu=Instance.new("ScreenGui")cu.Name="SABError"cu.ResetOnSpawn=false cu.DisplayOrder=1000
local aj=Instance.new("TextBox")aj.Size=UDim2 .new(0,340,0,170)aj.Position=UDim2 .new(0,10,0,50)
aj.BackgroundColor3=Color3 .fromRGB(90,20,20)aj.TextColor3=Color3 .new(1,1,1)aj.TextSize=11
aj.TextWrapped=true aj.ClearTextOnFocus=false aj.TextXAlignment=Enum.TextXAlignment.Left
aj.TextYAlignment=Enum.TextYAlignment.Top aj.Text="SAB "..aS.." failed to start. Send this text:\n"..tostring(gr)
aj.Parent=cu cu.Parent=z:WaitForChild("PlayerGui")end)end
