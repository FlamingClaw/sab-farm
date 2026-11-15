local aQ="v21"local gr=game:GetService("Players")local z=gr.LocalPlayer or gr.PlayerAdded:Wait()
local function dU(kE)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..aQ,Text=kE,Duration=6})
end)end dU("script started")local function kF()local bv=game:GetService("ReplicatedStorage")
local cu=game:GetService("Workspace")local kG=game:GetService("UserInputService")local a8=(type(getgenv)=="function"and getgenv())or _G
if type(a8 .SAB_KILL)=="function"then pcall(a8 .SAB_KILL)end local g=(type(tick)=="function")and tick or os.clock
local dV=(function()local kH,kI=pcall(function()return game:GetService("VirtualUser")end)return kH and kI or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,}local a={
alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=g(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local v={name=nil,rar=nil,at=g(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local c={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local dW={}local dX,cv,az,aR={},{},{},{}local O=""local function I(gs)dX[#dX+1]=gs return gs end
local function aA(kJ)task.wait(kJ)if not a.alive then error(dW,0)end end local function f(cw)
cw=os.date("%H:%M:%S").." "..tostring(cw)table.insert(cv,1,cw)if#cv>6 then table.remove(cv)end
az[#az+1]=cw if#az>80 then table.remove(az,1)end end local function cx(gt)if type(gt)~="string"then return""end
return(gt:lower():gsub("[^%w]",""))end local function E(kK)local gu=cx(kK)local dY=gu:gsub("butter$","")
if dY==""then dY=gu end return dY end local function aB(dZ)return type(dZ)=="string"and E(dZ)~=""and e.Targets[E(dZ)]==true end
local function kL(bw)bw=bw:lower()return bw:find("squishy",1,true)~=nil or bw:match("butter$")~=nil or bw:match("butter[^%a]")~=nil
end local d0={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ak(bx)
if type(bx)~="number"then return"?"end local cy=1 while math.abs(bx)>=1000 and cy<#d0 do bx=bx/1000 cy=cy+1 end
local kM=string.format("%.2f",bx):gsub("%.?0+$","")return kM..d0[cy]end local function kN(gv)
if type(gv)~="string"then return nil end local kO,gw=gv:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local d1=tonumber(kO)if not d1 then return nil end if gw==""then return d1 end for kP,kQ in ipairs(d0)do if kQ:lower()==gw:lower()then return d1*1000^(kP-1)end end
return nil end local function an()local gx=z:GetAttribute("BoardValueMoney")if type(gx)=="number"then return gx end
local gy=z:FindFirstChild("leaderstats")if gy then for pG,kR in ipairs({"Cash","Money","Coins"})do
local d2=gy:FindFirstChild(kR)if d2 and type(d2 .Value)=="number"then return d2 .Value end
end end end local function W(kS)local d3=kS:GetFullName()if a.plot then local d4=a.plot:GetFullName()
if d3:sub(1,#d4)==d4 then return d3:sub(#d4+2)end end return d3 end local function aS()
local cz=z.Character if cz and cz:FindFirstChild("HumanoidRootPart")then local gz=cz:FindFirstChildOfClass("Humanoid")
if gz and gz.Health>0 then return cz end end end local function aT()local d5=cu:FindFirstChild("Plots")
if not d5 then return nil end local function gA(kT)local gB=kT:FindFirstChild("Plate")return gB~=nil and gB:FindFirstChild("EditStackAttachment",true)~=nil
end local gC=z:GetAttribute("PlotNumber")if gC~=nil then local d6=d5:FindFirstChild(tostring(gC))
if d6 and gA(d6)then return d6 end end for pH,gD in ipairs(d5:GetChildren())do if gA(gD)then return gD end
end end local function by(gE)local aC=gE and gE.Parent for pI=1,6 do if not aC then return nil end
if aC:IsA("BasePart")then return aC end if aC:IsA("Model")then return aC.PrimaryPart or aC:FindFirstChildWhichIsA("BasePart",true)end
aC=aC.Parent end end local function gF(gG)local d7=gG.Parent if d7 and d7:IsA("Attachment")then return d7 .WorldPosition end
local gH=by(gG)return gH and gH.Position end local function kU()local a9=a.plot and a.plot:FindFirstChild("Plate")
if not a9 then return nil end if a9:IsA("BasePart")then return a9 .Position end if a9:IsA("Model")then return a9:GetPivot().Position end
local gI=a9:FindFirstChildWhichIsA("BasePart",true)return gI and gI.Position end local function gJ()
local d8={}local gK=a.plot and a.plot:FindFirstChild("WaxStations")if gK then for pJ,kV in ipairs(gK:GetChildren())do
local gL=kV:FindFirstChild("SquishyPlaceHolder")local d9=gL and gL:FindFirstChild("PlacePrompt")
if d9 and d9:IsA("ProximityPrompt")then d8[#d8+1]=d9 end end end return d8 end local function d_()
local gM,ea=gJ(),0 for pK,kW in ipairs(gM)do if kW.Enabled then ea=ea+1 end end local eb=#gM
local ec=z:GetAttribute("WaxStations")if type(ec)=="number"and ec>eb then eb=ec end return ea,eb
end local function kX()local gN=aS()local gO=gN and gN.HumanoidRootPart.Position local ed,gP
for pL,ee in ipairs(gJ())do if ee.Enabled then local gQ=gF(ee)local gR=(gQ and gO)and(gQ-gO).Magnitude or 1e9
if not ed or gR<gP then ed,gP=ee,gR end end end return ed end local function ef()local cA=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not cA then return nil end local gS=cA:FindFirstChild("BuyPromptAttachment")local cB=(gS and gS:FindFirstChild("BuyPrompt"))or cA:FindFirstChild("BuyPrompt",true)
if cB and cB:IsA("ProximityPrompt")and cB:IsDescendantOf(cA)then return cB end end local gT={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local kY={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local A={order={},price={},dirty=false}local l={seen={},at=0,boxes={},built=0}local x={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local eg="SAB_order.txt"local function eh()if not A.dirty or type(writefile)~="function"then return end
local ad={}for kZ,k0 in pairs(A.price)do ad[#ad+1]="P|"..kZ.."|"..string.format("%.0f",k0)end
for k1,k2 in pairs(A.order)do ad[#ad+1]="O|"..k1 .."|"..table.concat(k2,",")end if c.learned and c.enc then
ad[#ad+1]="M|mode|"..tostring(c.learned.mode or"")for k3,cC in ipairs(c.learned.seq)do local gU={}
for gV=1,cC.n do gU[gV]=c.enc(cC.args[gV])end ad[#ad+1]=("A|%d|%s|%d|%s"):format(k3,cC.m,cC.n,table.concat(gU,";"))
end end for pM,bz in pairs(l.seen)do ad[#ad+1]=("K|%s|%s|%s|%s"):format(bz.name,bz.title or"",bz.rar or"",bz.price and string.format("%.0f",bz.price)or"")
end if pcall(writefile,eg,table.concat(ad,"\n"))then A.dirty=false end end local function k4()
if type(isfile)~="function"or type(readfile)~="function"then return end local k5,k6=pcall(isfile,eg)
if not(k5 and k6)then return end local k7,gW=pcall(readfile,eg)if not(k7 and type(gW)=="string")then return end
for k8 in gW:gmatch("[^\n]+")do local bA,bB,aD=k8:match("^(%a)|([^|]+)|(.*)$")if bA=="P"then
A.price[bB]=tonumber(aD)elseif bA=="M"then c.loadMode=(aD~=""and aD~="nil")and aD or nil
elseif bA=="A"and c.dec then local gX=tonumber(bB)local gY,cD,k9=aD:match("^([^|]+)|(%d+)|(.*)$")
if gX and gY then cD=tonumber(cD)local gZ,cE={},0 for k_ in(k9 ..";"):gmatch("([^;]*);")do
cE=cE+1 if cE<=cD then gZ[cE]=c.dec(k_)end end c.loadSeq=c.loadSeq or{}c.loadSeq[gX]={m=gY,n=cD,args=gZ}
end elseif bA=="K"then local g0,g1,la=aD:match("^([^|]*)|([^|]*)|(.*)$")l.seen[l.key(bB)]={name=bB,title=g0~=""and g0 or nil,
rar=g1~=""and g1 or nil,price=tonumber(la)}elseif bA=="O"and aD~=""then local cF={}for lb in aD:gmatch("[^,]+")do cF[#cF+1]=lb end
if#cF>0 then A.order[bB]=cF end end end end local function lc(cG)if type(cG)~="table"then return end
local aU,g2=cG.rarity,cG.contents if type(aU)~="string"or aU==""or type(g2)~="table"then return end
local bC={}for pN,cH in ipairs(g2)do if type(cH)=="table"and type(cH.butter)=="string"then
bC[#bC+1]={n=cH.butter,ch=tonumber(cH.chance)or 0}end end if#bC==0 then return end table.sort(bC,function(ld,le)return ld.ch>le.ch end)
local bD,bE={},false for lf,lg in ipairs(bC)do bD[lf]=lg.n end local ei=A.order[aU]if not ei or#ei~=#bD then bE=true end
if not bE then for g3=1,#bD do if ei[g3]~=bD[g3]then bE=true break end end end A.order[aU]=bD
local ej=tonumber(cG.price)if ej and A.price[aU]~=ej then A.price[aU]=ej bE=true end if bE then
A.dirty=true x.at=0 f("learned the "..aU.." order from its crate")end end local function bF(lh,li)
local lj=lh:FindFirstChild(li,true)local lk,ek=pcall(function()return lj.Text end)return(lk and type(ek)=="string"and ek~="")and ek or nil
end local function L(g4)return x.pretty[g4]or g4 end l.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},
{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},
{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}
function l.key(ll)return cx(ll or"")end function l.learn(ao)if type(ao)~="table"or type(ao.name)~="string"then return end
local el=l.key(ao.name)local ap=l.seen[el]or{}local lm=(l.seen[el]==nil)or(tonumber(ao.price)and ap.price~=tonumber(ao.price))
ap.name,ap.title=ao.name,ao.title or ap.title ap.rar,ap.price=ao.rarity or ap.rar,tonumber(ao.price)or ap.price
l.seen[el]=ap if lm then l.at,A.dirty=g(),true end end function l.wanted(g5)return g5~=nil and e.CrateTicks[l.key(g5)]==true end
function l.list()local a_={}for ln,cI in ipairs(l.base)do a_[l.key(cI[1])]={name=cI[1],title=cI[2],rar=cI[3],i=ln}end
for pO,bG in ipairs(x.rarOrder)do local g6=false for pP,lo in pairs(a_)do if lo.rar==bG then g6=true break end end
if not g6 and bG~="?"then local g7=bG:gsub("[^%w]","").."Crate"a_[l.key(g7)]={name=g7,title=bG.." Crate",rar=bG,i=50,guess=true}
end end for g8,cJ in pairs(l.seen)do local al=a_[g8]or{i=100}al.name,al.title,al.rar=cJ.name or al.name,cJ.title or al.title,cJ.rar or al.rar
al.price,al.guess=cJ.price or al.price,nil a_[g8]=al end local bH,cK={},{}for lp,lq in ipairs(gT)do bH[lq]=lp end
for lr,g9 in ipairs(x.rarOrder)do bH[g9]=bH[g9]or(20+lr)end for ls,bI in pairs(a_)do bI.k=ls
bI.price=bI.price or A.price[bI.rar or""]cK[#cK+1]=bI end table.sort(cK,function(aV,aW)
if aV.price and aW.price and aV.price~=aW.price then return aV.price<aW.price end local g_,ha=bH[aV.rar or""]or 99,bH[aW.rar or""]or 99
if g_~=ha then return g_<ha end if(aV.i or 100)~=(aW.i or 100)then return(aV.i or 100)<(aW.i or 100)end
return aV.k<aW.k end)return cK end local function lt()local hb=bv:FindFirstChild("Assets")
local hc=hb and hb:FindFirstChild("Squishies")if not hc then return false end local em,hd,ba={},{},{}
local cL=0 for pQ,cM in ipairs(hc:GetChildren())do local bJ=E(cM.Name)if bJ~=""and not em[bJ]then
local cN=bF(cM,"RarityText")or"?"em[bJ]=cN hd[bJ]=bF(cM,"NameText")or cM.Name ba[cN]=ba[cN]or{}
table.insert(ba[cN],bJ)cL=cL+1 end end if cL==0 then return false end for he,lu in pairs(ba)do
local hf=A.order[he]or kY[he]local en={}if hf then for lv,lw in ipairs(hf)do en[E(lw)]=lv end end
table.sort(lu,function(hg,hh)local eo,ep=en[hg],en[hh]if eo and ep then return eo<ep end
if eo then return true end if ep then return false end return L(hg)<L(hh)end)end local eq={}
for lx,ly in ipairs(gT)do eq[ly]=lx end local cO={}for lz in pairs(ba)do cO[#cO+1]=lz end
table.sort(cO,function(er,es)local et,eu=A.price[er],A.price[es]if et and eu and et~=eu then return et<eu end
local ev,ew=eq[er],eq[es]if ev and ew then return ev<ew end if ev then return true end if ew then return false end
return er<es end)x.rar,x.pretty,x.members,x.rarOrder,x.n,x.at=em,hd,ba,cO,cL,g()return true
end local function ex()if x.at==0 or(g()-x.at)>120 then pcall(lt)end return x.n>0 end local function lA(lB)
local hi=E(lB)return x.rar[hi]or(v.name and E(v.name)==hi and v.rar)or"?"end local function hj()
local cP={}for lC,lD in pairs(e.Targets)do if lD then cP[#cP+1]=L(lC)end end table.sort(cP)
return cP end local M={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function hk()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function cQ(hl)if type(makefolder)~="function"then return end local lE,lF=pcall(isfolder,hl)
if not(lE and lF)then pcall(makefolder,hl)end end local function ey(hm)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local lG,lH=pcall(isfile,hm)if not(lG and lH)then return nil end local lI,lJ=pcall(readfile,hm)
return lI and lJ or nil end local function cR(lK,lL)if type(writefile)~="function"then return false end
return(pcall(writefile,lK,lL))end local function hn(lM)local bK={}if type(listfiles)~="function"then return bK end
local lN,ho=pcall(listfiles,lM)if not lN or type(ho)~="table"then return bK end for pR,lO in ipairs(ho)do bK[#bK+1]=tostring(lO)end
return bK end local function ez()local cS={}for pS,lP in ipairs(hn(M.cfg))do local hp=lP:match("([^/\\]+)%.txt$")
if hp then cS[#cS+1]=hp end end table.sort(cS)return cS end local function lQ()local P={"V|1"}
P[#P+1]="N|Every|"..tostring(e.Every)for pT,hq in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart"})do
P[#P+1]="B|"..hq.."|"..(e[hq]and"1"or"0")end if a.winPos then P[#P+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then P[#P+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for pU,eA in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local cT={}for lR,lS in pairs(eA[2])do if lS then cT[#cT+1]=lR end end table.sort(cT)P[#P+1]=eA[1].."|-"
for pV,lT in ipairs(cT)do P[#P+1]=eA[1].."|"..lT end end return table.concat(P,"\n")end
local function lU(eB)if type(eB)~="string"or eB==""then return false end local hr,hs,ht,hu={},false,{},false
for lV in eB:gmatch("[^\n]+")do local bb,ae,cU=lV:match("^(%a)|([^|]*)|?(.*)$")if bb=="N"and ae=="Every"then
local eC=tonumber(cU)if eC and eC>=1 then e.Every=math.floor(eC)end elseif bb=="B"then if e[ae]~=nil then e[ae]=(cU=="1")end
elseif bb=="W"then a.winPos={tonumber(ae)or 10,tonumber(cU)or 44}elseif bb=="G"then a.togPos={tonumber(ae)or 10,tonumber(cU)or 300}
elseif bb=="T"and ae~=""then if ae~="-"then hr[ae]=true end hs=true elseif bb=="K"and ae~=""then
if ae~="-"then ht[ae]=true end hu=true end end if hs then e.Targets=hr end if hu then e.CrateTicks=ht end
return true end local function eD(bc)if not hk()then return false,"this executor cannot write files"end
bc=(bc or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if bc==""then return false,"give the config a name"end
cQ(M.dir)cQ(M.cfg)if not cR(M.cfg.."/"..bc..".txt",lQ())then return false,"could not write the file"end
a.config=bc return true,bc end local function hv(cV)local hw=ey(M.cfg.."/"..cV..".txt")
if not hw then return false,"no config called "..tostring(cV)end if not lU(hw)then return false,"that config looks empty"end
a.config=cV return true,cV end local function hx(eE)if eE then cQ(M.dir)cR(M.auto,eE)elseif type(delfile)=="function"then
pcall(delfile,M.auto)else cR(M.auto,"")end a.autoload=eE end local function eF()if a.selfPath then return a.selfPath end
local cW for pW,lW in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",M.dir})do for pX,hy in ipairs(hn(lW))do
local eG=hy:lower()if eG:sub(-4)==".lua"and(eG:find("sab_farm",1,true)or eG:find("sab farm",1,true))then
cW=cW or hy end end end a.selfPath=cW return cW end M.stub=[[
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
local function lX()if not hk()then return false,"this executor cannot write files"end cQ("autoexec")
if not cR(M.exec,M.stub)then return false,"could not write to the autoexec folder"end local hz=eF()
return true,hz and("it will load "..hz)or"now save this script in Delta so the loader can find it"
end local cX=(function()local lY,lZ=pcall(function()return game:GetService("TeleportService")end)return lY and lZ or nil end)()
local function hA()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local l0=queueonteleport or queue_on_teleport local hB=eF()if not hB then return false end
return(pcall(l0,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(hB)))
end local function cY(l1)if a.rejoining then return end a.rejoining=true f("REJOIN ("..l1 ..")")
pcall(eh)if a.autoload then pcall(eD,a.autoload)end local l2=hA()f(l2 and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for pY=1,30 do if not cX then break end pcall(function()cX:Teleport(game.PlaceId,z)end)
task.wait(10)end end)end local function l3()local l4,hC=pcall(function()return game:GetService("GuiService")end)
if l4 and hC then pcall(function()I(hC.ErrorMessageChanged:Connect(function()if e.Rejoin then cY("roblox error message")end
end))end)end pcall(function()local hD=game:GetService("CoreGui")local hE=hD and hD:WaitForChild("RobloxPromptGui",15)
local hF=hE and hE:WaitForChild("promptOverlay",15)if hF then I(hF.ChildAdded:Connect(function(l5)
if e.Rejoin and tostring(l5 .Name):lower():find("errorprompt",1,true)then cY("disconnect prompt")end
end))end end)pcall(function()I(z.OnTeleport:Connect(function(l6)if tostring(l6):find("Started")then hA()end
end))end)if cX then pcall(function()I(cX.TeleportInitFailed:Connect(function()a.rejoining=false
if e.Rejoin then task.delay(5,function()cY("teleport retry")end)end end))end)end end local function hG(l7)
local hH=a.plot and a.plot:FindFirstChild(l7)if not hH then return nil,false end for pZ,eH in ipairs(hH:GetChildren())do
if eH:IsA("Model")or eH:IsA("BasePart")then return eH,true end end return nil,true end local function bL()
local aE=hG("RolledSquishy")if not aE then return nil end return{model=aE,name=aE.Name,pretty=bF(aE,"NameText")or L(E(aE.Name)),
rar=bF(aE,"RarityText")or lA(aE.Name),price=bF(aE,"PriceText")}end local function hI(eI)
return type(eI)=="string"and(x.rar[E(eI)]~=nil or kL(eI))end local function C()local eJ=hG("SquishyEquipped")
if eJ then a.carrySrc,c.heldAt="model",g()return eJ.Name,eJ end local hJ=z.Character if hJ then
for p0,bM in ipairs(hJ:GetDescendants())do if(bM:IsA("Model")or bM:IsA("Tool"))and hI(bM.Name)then
a.carrySrc,c.heldAt="character",g()return bM.Name,bM end end end local cZ=z:GetAttribute("SquishyEquipped")
if type(cZ)=="string"and cZ~=""and hI(cZ)and g()>=(a.carryBlind or 0)then a.carrySrc="attribute"
return cZ,nil end a.carrySrc=nil end local function p1()local p2,l8=C()return l8 end local function hK()
local hL=bL()local eK=hL and kN(hL.price)local eL=an()if eK and eL and eL<eK*0.5 then return eL,eK end
end local function bd(l9)aR[#aR+1]=os.date("%H:%M:%S").." "..l9 if#aR>40 then table.remove(aR,1)end
end local function l_(aX,c0)if type(aX)~="string"then return end bd(("Roll(%s,%s)"):format(aX,tostring(c0)))
if aX:lower():find("crate",1,true)then c.rolled,c.rolledAt=aX,g()return end v.seq=v.seq+1
v.name,v.at=aX,g()v.rar=type(c0)=="string"and c0 or nil a.rolls=a.rolls+1 if aB(aX)then f(("ROLL %s [%s] = TARGET"):format(aX,tostring(c0)))end
end local function ma(aY)if type(aY)~="table"then return end local c1=aY.butter or aY.itemName
if type(c1)~="string"then return end a.gifts=a.gifts+1 v.gift,v.giftAt=c1,g()if type(aY.giftId)=="string"then
local hM=bv:FindFirstChild("Remotes")local hN=hM and hM:FindFirstChild("GiftThanks")if hN then pcall(function()hN:FireServer(aY.giftId)end)end
end bd("Gift("..c1 .." from "..tostring(aY.fromName)..")")f(("GIFT from %s: %s - it will not be waxed"):format(tostring(aY.fromName),c1))
end local function mb()local hO=bv:WaitForChild("Remotes",30)if not a.alive then return end
if not hO then f("Remotes folder missing - no roll events")return end I(z:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local hP=z:GetAttribute("SquishyEquipped")if type(hP)=="string"and hP~=""then c.heldAt=g()end
end))local mg={SquishyRollAnimation=l_,InitSquishy=function(hQ)v.init,v.initAt=tostring(hQ),g()bd("Init("..tostring(hQ)..")")end,
CrateUpdate=function(be,hR)pcall(lc,be)pcall(l.learn,be)if type(be)=="table"then local mc=hR==true or(c.rolled~=nil and g()-c.rolledAt<15)or c.waiting
if not mc then return end local md=not c.waiting local me=c.on c.waiting,c.data,c.at=true,be,g()
c.on=(hR==true)c.title=tostring(be.title or be.name or"crate")if c.on and not me then c.openedAt,c.byYou=g(),not c.ours
if c.onShow then task.spawn(c.onShow)end end if c.on then bd("CrateWindow open("..c.title..")")
elseif md then bd("Crate waiting("..c.title..")")f(c.title.." is waiting on your stand")
end else if c.waiting then bd("Crate gone")end c.on,c.waiting,c.data,c.prompt=false,false,nil,nil
c.summonFails,c.ours,c.byYou=0,false,false if c.onGone then task.spawn(c.onGone)end if c.classify then
local mf=g()task.spawn(function()pcall(c.classify,mf)end)end end end,GiftReceived=ma,}for c2,mh in pairs(mg)do
local eM=hO:FindFirstChild(c2)if eM and eM:IsA("RemoteEvent")then I(eM.OnClientEvent:Connect(mh))
elseif c2~="CrateUpdate"and c2~="GiftReceived"then f("remote "..c2 .." missing")end end
end local function eN()local aZ=bL()if aZ then if aB(aZ.name)then return{state="match",shown=aZ.pretty,src="pad",info=aZ}
end return{state="skip",info=aZ,level="idle",text=("on pad: %s [%s] - not ticked"):format(aZ.pretty,tostring(aZ.rar))}
end if v.name and(g()-v.at)<4 then if aB(v.name)then return{state="match",shown=L(E(v.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(L(E(v.name)),tostring(v.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function hS(mi,mj,mk,ml)
local c3=RaycastParams.new()c3 .FilterType=Enum.RaycastFilterType.Exclude local eO={z.Character}
for p3,mm in ipairs(ml or{})do eO[#eO+1]=mm end c3 .FilterDescendantsInstances=eO pcall(function()c3 .RespectCanCollide=true end)
local hT=cu:Raycast(Vector3 .new(mi,mj+4,mk),Vector3 .new(0,-30,0),c3)return hT and hT.Position or nil
end local function eP(hU)local hV=hU:FindFirstChildOfClass("Humanoid")return((hV and hV.HipHeight)or 2)+hU.HumanoidRootPart.Size.Y/2+0.2
end local function eQ(mn,mo)local hW=mn:FindFirstChildOfClass("Humanoid")local mp=g()while g()-mp<mo do
if hW and hW.FloorMaterial~=Enum.Material.Air then return true end aA(0.05)end return false
end local function c4(mq,eR,eS)local hX=mq.HumanoidRootPart hX.AssemblyLinearVelocity=Vector3 .new(0,0,0)
hX.CFrame=eS and CFrame.new(eR,Vector3 .new(eS.X,eR.Y,eS.Z))or CFrame.new(eR)end local function c5(aq,hY)
local a0=aS()if not a0 or not aq then return false end local aF=aq.Position local c6=math.clamp(math.max(aq.Size.X,aq.Size.Z)/2+2.2,3,7)
local hZ=(hY and hY.MaxActivationDistance)or 10 if c6>hZ-2 then c6=math.max(2.5,hZ-2)end
local bN={}local function a1(bO)bO=Vector3 .new(bO.X,0,bO.Z)if bO.Magnitude>0.05 then bN[#bN+1]=bO.Unit end
end local h0=kU()if h0 then a1(h0-aF)end a1(aq.CFrame.LookVector)a1(-aq.CFrame.LookVector)
a1(aq.CFrame.RightVector)a1(-aq.CFrame.RightVector)a1(a0 .HumanoidRootPart.Position-aF)
if#bN==0 then a1(Vector3 .new(0,0,1))end local mr,c7=eP(a0),false for p4,ms in ipairs(bN)do
local c8=aF+ms*c6 local eT=hS(c8 .X,aF.Y,c8 .Z,{aq})if eT and math.abs(eT.Y-aF.Y)<14 then
c4(a0,Vector3 .new(c8 .X,eT.Y+mr,c8 .Z),aF)if eQ(a0,0.7)then c7=true break end end end if not c7 then
c4(a0,aF+bN[1]*c6+Vector3 .new(0,3,0),aF)c7=eQ(a0,1)end aA(0.12)return c7 end local function mt(bP)
if not bP.Parent or not bP.Enabled then return false end pcall(function()bP:InputHoldBegin()end)
aA(math.max(bP.HoldDuration,0)+0.08)pcall(function()bP:InputHoldEnd()end)return true end
local function aa(h1,mu)local mv=g()while g()-mv<mu do if h1()then return true end aA(0.05)
end return h1()end local function c9(bf,mw,h2,mx)local my=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for mz,eU in ipairs(my)do if mz==2 and(mx or not(bf.Parent and bf.Enabled and(not h2 or h2())))then break end
local eV if eU=="hold"then eV=mt(bf)else eV=type(fireproximityprompt)=="function"and bf.Parent~=nil and bf.Enabled and pcall(fireproximityprompt,bf)end
if eV and aa(mw,1.2)then a.zapFirst=(eU=="zap")return true,eU end end return false end local function h3(eW)
local aG=ef()if not aG or not aG.Enabled then f("buy: nothing on the pad")return false end
local h4=by(aG)if not h4 then f("buy: pad part missing")return false end a.lastBuyAt=g()
local mA,h5=v.seq,an()c5(h4,aG)if not aG.Enabled then f("buy aborted: pad emptied")return false end
local bh=eN()if not eW and bh.state~="match"then f("buy aborted: "..(bh.text or"pad changed"))
a.matchSince=nil return false end local eX=bh.info and bh.info.name or(bh.state=="match"and v.name)or nil
local function mB()return aG.Enabled and C()==nil and(eW or eN().state=="match")end local mC,mD=c9(aG,function()
return C()~=nil or((not aG.Enabled)and(eW or v.seq==mA))end,mB,hK()~=nil)if mC then aa(function()return C()~=nil end,0.8)
local bQ=C()local h6=an()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
v.name,v.rar,v.at=nil,nil,g()f(("BOUGHT %s%s via %s"):format(bQ and L(E(bQ))or(bh.shown or"?"),(h5 and h6)and(" for $"..ak(h5-h6))or"",mD))
if bQ and eX and E(bQ)~=E(eX)then f(("note: picked up %s, not %s"):format(bQ,eX))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=g()+math.min(8*2^(a.cashFails-1),60)local h7=bL()
f(("BUY REFUSED: cash short? have $%s, price %s"):format(ak(an()),(h7 and h7 .price)or"?"))
return false end local function h8()local c_=C()if not c_ then a.holding=false f("place: hands are empty")
return false end if not aB(c_)then f(("REFUSED TO WAX %s - it is not ticked"):format(L(E(c_))))
return false end for p5=1,e.PlaceTries do local aH=kX()if not aH then f("place: no free station")break end
local h9=by(aH)if h9 then c5(h9,aH)local h_=C()if not h_ then a.holding=false f("place: hands emptied on the way")return false end
if not aB(h_)then f("place: what I carry changed, not waxing it")return false end if aH.Enabled then
local mE,mF=c9(aH,function()return not aH.Enabled end,function()return aH.Enabled end)if mE then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=g()+2.5,0 v.name,v.rar,v.at=nil,nil,g()
f(("WAXED %s #%d at %s via %s"):format(L(E(c_)),a.placed,aH.Parent.Parent.Name,mF))return true
end end end aA(0.25)end a.placeFails=a.placeFails+1 if C()==nil then a.holding=false end
f("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,g()
a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(C()))f(a.capMsg)end return false end local function eY(ia)return type(ia)=="string"and ia:lower():find("crate",1,true)~=nil
end local mG={SABFarmGui=1,SABToggle=1,SABError=1}local function da(mH)local aI=mH while aI do
if mG[aI.Name]then return false end if aI:IsA("ScreenGui")then local mI,mJ=pcall(function()return aI.Enabled end)
return(not mI)or mJ~=false end if aI:IsA("GuiObject")and not aI.Visible then return false end
aI=aI.Parent end return false end local function bi(db)local bj=""pcall(function()if db:IsA("TextButton")then bj=db.Text end end)
if not bj:find("%a")then for p6,dc in ipairs(db:GetDescendants())do if(dc:IsA("TextLabel")or dc:IsA("TextButton"))and dc.Text:find("%a")then bj=dc.Text break end
end end if not bj:find("%a")then bj=db.Name end return(bj:lower():gsub("[^%a]",""))end local function mK()
local bR,bS local ib=z:FindFirstChildOfClass("PlayerGui")if not ib then return nil,nil end
for p7,bT in ipairs(ib:GetDescendants())do if bT:IsA("GuiButton")and da(bT)then local eZ=bi(bT)
if eZ:sub(1,4)=="open"and not eZ:find("shop",1,true)then bR=bR or bT end if eZ:sub(1,7)=="discard"then bS=bS or bT end
end end if bR and bS then return bR,bS end if c.on then return bR,bS end return nil,nil
end local dd=(function()local mL,mM=pcall(function()return game:GetService("VirtualInputManager")end)return mL and mM or nil end)()
local function ic(a2,e0)local e1={}local function id(mN)e1[#e1+1]=mN end if a.tapWay then id(a.tapWay)end
for p8,ie in ipairs({"touch","conn","signal"})do if ie~=a.tapWay then id(ie)end end local function ig(mO)
local mP,e2=pcall(getconnections,mO)if not(mP and type(e2)=="table"and#e2>0)then return false end
local ih=false for p9,mQ in ipairs(e2)do if pcall(function()mQ:Fire()end)then ih=true end
end return ih end for p_,ar in ipairs(e1)do local bU=false if ar=="conn"and type(getconnections)=="function"then
if ig(a2 .MouseButton1Click)then bU=true if aa(e0,1.5)then a.tapWay=ar return true,ar end
end bU=ig(a2 .Activated)elseif ar=="signal"and type(firesignal)=="function"then if pcall(firesignal,a2 .MouseButton1Click)then
if aa(e0,1.5)then a.tapWay=ar return true,ar end end bU=pcall(firesignal,a2 .Activated)
elseif ar=="touch"and dd then bU=pcall(function()local ii,ij=a2 .AbsolutePosition,a2 .AbsoluteSize
local ik=0 local il=a2:FindFirstAncestorWhichIsA("ScreenGui")local mR,mS=pcall(function()return il and il.IgnoreGuiInset end)
if not(mR and mS)then pcall(function()ik=game:GetService("GuiService"):GetGuiInset().Y end)
end local im,io=ii.X+ij.X/2,ii.Y+ij.Y/2+ik dd:SendMouseButtonEvent(im,io,0,true,game,1)
task.wait(0.06)dd:SendMouseButtonEvent(im,io,0,false,game,1)end)end if bU and aa(e0,1.5)then
a.tapWay=ar return true,ar end end return false end local mT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function e3(ip)local bV=ip.Parent while bV and bV~=a.plot do if mT[bV.Name]then return false end
bV=bV.Parent end local e4=(ip.ActionText or""):lower()if e4:find("roll",1,true)or e4:find("place",1,true)or e4:find("sell",1,true)then return false end
return true end local function iq()if c.prompt and c.prompt.Parent and c.prompt.Enabled then return c.prompt end
if not a.plot then return nil end local ir=a.plot:FindFirstChild("CrateStand")local bW if ir then
for qa,de in ipairs(ir:GetDescendants())do if de:IsA("ProximityPrompt")and de.Enabled and e3(de)then bW=de break end
end end if not bW then for qb,aJ in ipairs(a.plot:GetDescendants())do if aJ:IsA("ProximityPrompt")and aJ.Enabled and e3(aJ)then
local is=aJ:FindFirstAncestorWhichIsA("Model")local mU=((aJ.ActionText or"").." "..(aJ.ObjectText or"").." "..aJ.Name.." "..(is and is.Name or"")):lower()
if mU:find("crate",1,true)then bW=aJ break end end end end c.prompt=bW return bW end local function e5()
if c.on then return true end local bX=iq()if not bX then c.summonFails=c.summonFails+1 c.lastFail=g()
f("crate: cannot find where to open "..c.title.." - open it once by hand, then DUMP")return false
end local it=by(bX)if it then c5(it,bX)end c.ours=true c9(bX,function()return c.on end)
if aa(function()return c.on end,3)then c.summonFails=0 return true end c.ours=false c.summonFails=c.summonFails+1
c.lastFail=g()f("crate: pressed "..W(bX).." but no window came up")return false end do local function mV(iu)
local bk=iu.Parent while bk and bk:IsA("GuiObject")do local iv,iw=false,false for qc,bY in ipairs(bk:GetDescendants())do
if bY~=iu and bY:IsA("GuiButton")and bi(bY):sub(1,7)=="discard"then iv=true end if bY:IsA("TextLabel")then
local e6=bY.Text:lower()if e6:find("crate",1,true)or e6:find("can contain",1,true)or e6:find("cost",1,true)then iw=true end
end if iv and iw then return bk end end bk=bk.Parent end end function c.findWin()if c.win and c.win.Parent then return c.win end
local ix=z:FindFirstChildOfClass("PlayerGui")if not ix then return nil end for qd,df in ipairs(ix:GetDescendants())do
if df:IsA("GuiButton")and not df:FindFirstAncestor("SABFarmGui")and bi(df):sub(1,4)=="open"then
local e7=mV(df)if e7 then c.win=e7 return e7 end end end end local function mW(mX)for qe,dg in ipairs(mX:GetDescendants())do
if dg:IsA("GuiButton")then local iy,e8=bi(dg),dg.Name:lower()if iy=="x"or iy=="close"or e8=="x"or e8:find("close",1,true)or e8:find("exit",1,true)then return dg end
end end end c.onShow=function()c.win=nil c.findWin()end c.onGone=function()task.wait(1.2)
if c.on or c.waiting then return end local dh=c.findWin()if not dh or not da(dh)then return end
local iz=mW(dh)if iz and ic(iz,function()return not da(dh)end)then return end f("the crate window is still open - tap its X")
end end local function di(dj)if not e5()then return false end local iA=g()-(c.openedAt or 0)
if iA<0.6 then aA(0.6-iA)end local e9=c.title local mY,mZ=mK()local iB=dj and mY or mZ if not iB then
c.lastFail=g()a.crateFails=a.crateFails+1 f(("crate: no %s button found in %s"):format(dj and"Open"or"Discard",e9))
return false end local m0=C()local m1,qf=ic(iB,function()return(not c.on)or(C()~=nil and C()~=m0)
end)if not m1 then c.lastFail=g()a.crateFails=a.crateFails+1 f("crate: could not press "..(dj and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if dj then a.crates=a.crates+1 aa(function()return C()~=nil end,1.5)
local iC=C()f(("OPENED %s -> %s"):format(e9,iC and L(E(iC))or"?"))else f("discarded "..e9 .." (nothing ticked in it)")
end return true end c.calls={}function c.saw(m2,...)local m3=select("#",...)c.calls[#c.calls+1]={t=g(),m=m2,n=m3,args={...},data=c.data,
crate=c.data and c.data.name,title=c.title,rar=c.data and c.data.rarity}if#c.calls>12 then table.remove(c.calls,1)end
end function c.slot(Q,as)local aK=type(Q)if(aK=="string"or aK=="number")and type(as.data)=="table"then
for iD,e_ in pairs(as.data)do if e_==Q and type(iD)=="string"and(type(e_)=="string"or type(e_)=="number")then
return{__slot="f:"..iD}end end end if aK=="string"then if as.crate and Q==as.crate then return{__slot="crate"}end
if as.title and Q==as.title then return{__slot="title"}end if as.rar and Q==as.rar then return{__slot="rarity"}end
return Q end if aK=="number"or aK=="boolean"or aK=="nil"then return Q end if aK=="table"then
local iE={}for m4,iF in pairs(Q)do if type(iF)=="table"then return nil,"nested table"end
local m5,iG=c.slot(iF,as)if iG then return nil,iG end iE[m4]=m5 end return iE end local m6,m7=pcall(function()return Q:IsA("Instance")end)
if m6 and m7 then if Q==z then return{__slot="player"}end if a.plot and Q==a.plot then return{__slot="plot"}end
local dk=a.plot and a.plot:FindFirstChild("CrateStand")if dk and Q==dk then return{__slot="stand"}end
if dk and Q.Parent==dk then return{__slot="model"}end end return nil,"a value it cannot rebuild ("..aK..")"
end function c.resolve(dl)if type(dl)~="table"then return dl end local af=dl.__slot if af and af:sub(1,2)=="f:"then return c.data and c.data[af:sub(3)]end
if af=="crate"then return c.data and c.data.name end if af=="title"then return(c.data and c.data.title)or c.title end
if af=="rarity"then return c.data and c.data.rarity end if af=="player"then return z end
if af=="plot"then return a.plot end if af=="stand"or af=="model"then local fa=a.plot and a.plot:FindFirstChild("CrateStand")
if af=="stand"or not fa then return fa end for qg,iH in ipairs(fa:GetChildren())do if eY(iH.Name)then return iH end end
return nil end local iI={}for m8,m9 in pairs(dl)do iI[m8]=c.resolve(m9)end return iI end
function c.classify(fb)if c.directOff then return end local dm={}for qh,fc in ipairs(c.calls)do
if fc.t<=fb+0.05 and fb-fc.t<=6 then dm[#dm+1]=fc end end if#dm==0 then return end if not aa(function()return(c.heldAt or 0)>=fb-1 end,2.5)then return end
local bZ={}for qi,b0 in ipairs(dm)do local iJ={}for iK=1,b0 .n do local m_,iL=c.slot(b0 .args[iK],b0)
if iL then f("crate call has "..iL.." - keeping the button method")return end iJ[iK]=m_
end bZ[#bZ+1]={m=b0 .m,n=b0 .n,args=iJ}end local fd=c.learned c.learned={seq=bZ,mode=fd and fd.mode or nil}
A.dirty=true if not fd then f(("learned how to open crates directly (%d call%s)"):format(#bZ,#bZ==1 and""or"s"))end
end function c.replay()local iM=c.learned local iN=bv:FindFirstChild("Remotes")local fe=iN and iN:FindFirstChild("CrateAction")
if not(iM and fe)then return false end local iO=table.unpack or unpack c.replaying=true
for qj,b1 in ipairs(iM.seq)do local ff={}for iP=1,b1 .n do ff[iP]=c.resolve(b1 .args[iP])end
task.spawn(function()pcall(function()if b1 .m=="InvokeServer"then fe:InvokeServer(iO(ff,1,b1 .n))
else fe:FireServer(iO(ff,1,b1 .n))end end)end)task.wait(0.2)end c.replaying=false return true
end function c.esc(na)return(na:gsub("[%%|;=,\n]",function(nb)return("%%%02X"):format(nb:byte())end))end
function c.enc(a3)local dn=type(a3)if dn=="string"then return"s"..c.esc(a3)end if dn=="number"then return"n"..tostring(a3)end
if dn=="boolean"then return a3 and"b1"or"b0"end if dn=="nil"then return"z"end if a3 .__slot then return"k"..a3 .__slot end
local fg={}for nc,nd in pairs(a3)do fg[#fg+1]=c.enc(nc).."="..c.enc(nd)end return"t"..table.concat(fg,",")
end function c.dec(iQ)local b2,b3=iQ:sub(1,1),iQ:sub(2)local function ne(nf)return(nf:gsub("%%(%x%x)",function(ng)return string.char(tonumber(ng,16))end))end
if b2=="s"then return ne(b3)end if b2=="n"then return tonumber(b3)end if b2=="b"then return b3=="1"end
if b2=="k"then return{__slot=b3}end if b2=="t"then local iR={}for nh in b3:gmatch("[^,]+")do
local iS,ni=nh:match("^(.-)=(.*)$")if iS then local iT=c.dec(iS)if iT~=nil then iR[iT]=c.dec(ni)end
end end return iR end return nil end function c.goneOrNew(nj)return function()if not c.waiting then return true end
local iU=C()return iU~=nil and iU~=nj end end function c.smart()local fh=c.title local a4=c.learned
if a4 then local fi=C()if c.on then c.replay()if aa(c.goneOrNew(fi),3.5)then a.crates=a.crates+1
f("OPENED "..fh.." (direct)")return true end else if a4 .mode~="window"then c.replay()if aa(c.goneOrNew(fi),3.5)then
a.crates,c.fails=a.crates+1,0 if a4 .mode~="direct"then a4 .mode,A.dirty="direct",true f("crates now open directly - the window never comes up")
end f("OPENED "..fh.." (direct, no window)")return true end end if e5()then c.replay()if aa(c.goneOrNew(fi),3.5)then
a.crates,c.fails=a.crates+1,0 if a4 .mode~="window"then a4 .mode,A.dirty="window",true f("crates need their window up first - it shows briefly")
end f("OPENED "..fh.." (direct, window up)")return true end end end c.fails=(c.fails or 0)+1
c.lastBad,c.learned,A.dirty=a4,nil,true if c.fails>=3 then c.directOff=true f("direct crate opening failed 3 times - using the button for now (see DUMP)")
else f("the learned crate call did not work - back to pressing Open")end end return di(true)
end local nk={"sell","trash","discard","dispose","bin"}local function fj(dp)if type(dp)~="string"then return false end
dp=dp:lower()for qk,nl in ipairs(nk)do if dp:find(nl,1,true)then return true end end return false
end local function nm()local iV=bv:FindFirstChild("Remotes")local fk=iV and iV:FindFirstChild("SellSquishy")
if not(fk and fk:IsA("RemoteEvent"))then return false end if not pcall(function()fk:FireServer()end)then return false end
return aa(function()return C()==nil end,1.5)end local function nn()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if g()-a.sellSearchAt<20 then return nil end a.sellSearchAt=g()local iW=aS()local iX=iW and iW.HumanoidRootPart.Position
local b4,iY for ql,bl in ipairs((a.plot or cu):GetDescendants())do if bl:IsA("ProximityPrompt")and(fj(bl.ActionText)or fj(bl.ObjectText)or fj(bl.Name))then
local iZ=gF(bl)local fl=(iZ and iX)and(iZ-iX).Magnitude or 1e9 if fl<=400 and(not b4 or fl<iY)then b4,iY=bl,fl end
end end a.sellSpot=b4 a.noSellSpot=(b4==nil)return b4 end local function i0()local fm=C()
if not fm then a.holding=false return false end if aB(fm)then return false end local fn=L(E(fm))
if nm()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=g()+2.5,0
f("SOLD "..fn)return true end local bm=nn()if bm then local i1=by(bm)if i1 then c5(i1,bm)
local i2=C()if i2 and not aB(i2)then local no,np=c9(bm,function()return C()==nil end,function()return bm.Enabled end)
if no then a.sold,a.holding,a.sellFails=a.sold+1,false,0 f(("SOLD %s at %s via %s"):format(fn,W(bm),np))
return true end end end end a.sellFails=a.sellFails+1 f("could not sell "..fn.." ("..a.sellFails..")")
return false end local nq={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function nr(bn)local dq=W(bn):lower()for qm,ns in ipairs(nq)do if dq:find(ns,1,true)then return 0 end end
local am,F=bn.Name:lower(),0 local function ag(nt,nu)return nt:find(nu,1,true)~=nil end
if ag(am,"collect")then F=F+60 end if ag(am,"cash")or ag(am,"money")then F=F+45 end if ag(am,"income")or ag(am,"claim")then F=F+35 end
if ag(am,"coin")or ag(am,"earn")or ag(am,"green")then F=F+20 end if am=="pad"or am=="touch"then F=F+25 end
if F==0 and(ag(dq,"collect")or ag(dq,"cash")or ag(dq,"money"))then F=25 end if F==0 then return 0 end
local b5=bn.Color if b5 .G>0.5 and b5 .G>b5 .R*1.4 and b5 .G>b5 .B*1.4 then F=F+15 end if math.min(bn.Size.X,bn.Size.Y,bn.Size.Z)<2 then F=F+5 end
return F end local function nv()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or g()-a.padSearchAt<20 then return nil end a.padSearchAt=g()local dr,b6,fo={},nil,29
for qn,ds in ipairs(a.plot:GetDescendants())do if ds:IsA("BasePart")then local dt=nr(ds)
if dt>0 then dr[#dr+1]={s=dt,p=ds}if dt>fo then b6,fo=ds,dt end end end end table.sort(dr,function(nw,nx)return nw.s>nx.s end)
a.padCands,a.padPart=dr,b6 if b6 then f("collect pad: "..W(b6).." (score "..fo..")")end
return b6 end local fp="SAB_pad_v1.txt"local function ny(nz)if type(writefile)=="function"then pcall(writefile,fp,table.concat({nz:GetComponents()},","))end
end local function nA()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local nB,i3=pcall(function()if isfile(fp)then return readfile(fp)end end)if not nB or type(i3)~="string"then return nil end
local du={}for nC in i3:gmatch("[^,]+")do du[#du+1]=tonumber(nC)end if#du==12 then return CFrame.new(unpack(du))end
end local function nD(fq,dv,nE)local nF=eP(fq)local fr=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local ah=(fr and fr:IsA("BasePart"))and(fr.Position-dv)or Vector3 .new(1,0,0)ah=Vector3 .new(ah.X,0,ah.Z)
if ah.Magnitude<0.05 then ah=Vector3 .new(1,0,0)end ah=ah.Unit for nG=0,7 do local dw=nG*math.pi/4
local nH=Vector3 .new(ah.X*math.cos(dw)-ah.Z*math.sin(dw),0,ah.X*math.sin(dw)+ah.Z*math.cos(dw))
local dx=dv+nH*(nE+5)local fs=hS(dx.X,dv.Y,dx.Z)if fs and math.abs(fs.Y-dv.Y)<8 then c4(fq,Vector3 .new(dx.X,fs.Y+nF,dx.Z))
if eQ(fq,0.7)then return true end end end return false end local function nI()a.lastCollect=g()
local b7=aS()if not b7 then return end local i4,nJ=b7 .HumanoidRootPart,eP(b7)local b8,i5,b9,ft=nil,4,nil,"?"
local fu=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and fu and fu:IsA("BasePart")then
b8,ft=(fu.CFrame*a.manualPad).Position,"manual pad"else local au=nv()if au then b8=Vector3 .new(au.Position.X,au.Position.Y+au.Size.Y/2+nJ,au.Position.Z)
i5,b9,ft=math.max(au.Size.X,au.Size.Z)/2,au,au.Name end end if not b8 then f("COLLECT: pad not found - stand on it and tap SET PAD")return end
local fv=an()c4(b7,b8)if b9 and type(firetouchinterest)=="function"then pcall(firetouchinterest,i4,b9,0)end
aA(e.PadDwell)if b9 and type(firetouchinterest)=="function"then pcall(firetouchinterest,i4,b9,1)end
aA(0.5)a.collected=a.collected+1 local fw=an()f(("COLLECTED (%s) %s"):format(ft,(fv and fw and fw>fv)and("+$"..ak(fw-fv))or"no cash change seen"))
nD(b7,b8,i5)end local b_ local function i6()if a.capHit then if e.AutoStart and g()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 f("trying again after being stopped for 5 minutes")b_(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not aS()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aT(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local fx,i7=d_()local dy=C()if dy then local ca=L(E(dy))if not aB(dy)then local fy=(v.gift and E(v.gift)==E(dy)and g()-v.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(ca,fy),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(ca,fy),"bad"
end return"sell",("selling %s (%s)"):format(ca,fy),"warn"end if fx<1 then return nil,("holding %s - 0 free stations"):format(ca),"wait"end
return"place",("waxing %s (%d free)"):format(ca,fx),"ok"end a.holding=false if e.Crates and not c.waiting and g()-(c.scanAt or 0)>1 then
c.scanAt=g()local i8=a.plot:FindFirstChild("CrateStand")if i8 then for qo,bo in ipairs(i8:GetChildren())do
if eY(bo.Name)and l.wanted(bo.Name)then local i9=false for qp,i_ in ipairs(bo:GetDescendants())do
if i_:IsA("ProximityPrompt")and i_.Enabled then i9=true break end end if i9 then local nK=cx(bo.Name):gsub("crate$","")
local fz for ja in pairs(x.members)do if cx(ja)==nK then fz=ja end end c.waiting,c.at=true,g()
c.title=(fz or bo.Name).." Crate"c.data={name=bo.Name,rarity=fz,title=c.title}f(c.title.." found sitting on your stand")
break end end end end end local jb=l.wanted(c.data and c.data.name)or l.wanted(c.title)
if e.Crates and(c.on or c.waiting)and jb then local av=c.title if g()<(c.ignoreUntil or 0)then
return nil,("%s - its buttons do not respond to me, press Open yourself"):format(av),"bad"
end if c.on then if a.crateFails>=3 then c.ignoreUntil,a.crateFails=g()+120,0 f("could not press the "..av.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(av),"bad"end if g()-c.lastFail<8 then
return nil,("%s window open - could not press its buttons"):format(av),"bad"end if c.byYou and g()-c.openedAt<60 then
return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(av,math.ceil(60-(g()-c.openedAt))),"idle"
end return"cratesmart",("opening %s"):format(av),"ok"end if c.summonFails>=3 then return nil,("%s waiting - could not open it, open it by hand then DUMP"):format(av),"bad"
end if g()-c.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(av),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(av,(c.learned and c.learned.mode~="window")and" directly"or""),"ok"
end if(c.on or c.waiting)and not jb then local jc=c.title..tostring(c.rolledAt)if c.told~=jc then
c.told=jc f(c.title.." is not ticked - leaving it to the game")end end if c.rolled and not c.waiting and g()-c.rolledAt<6 and l.wanted(c.rolled)then
return nil,c.rolled.." rolled - waiting for it to land","wait"end if fx<1 then a.matchSince=nil
return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(i7,i7),"wait"end local fA=ef()
if not fA then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local cb=bL()
if cb and eY(cb.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(cb.name),"idle"end
if g()-c.lastFail<8 then return nil,("%s on the pad - could not open it"):format(cb.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(cb.name),"ok"end local aL=eN()
if aL.state~="match"then a.matchSince=nil if aL.state=="skip"and not fA.Enabled then return nil,aL.text.." (sold out)","idle"end
return nil,aL.text,aL.level end if not fA.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local cc=g()if cc<a.noCashUntil then local jd,nL=hK()if jd then return nil,("cash short: have $%s, price ~$%s"):format(ak(jd),ak(nL)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ak(an()),math.ceil(a.noCashUntil-cc)),"bad"
end if cc-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or cc
local je=cc-a.matchSince if je<e.Confirm then return nil,("confirming %s (%.2fs)"):format(aL.shown,je),"ok"end
return"buy",("buying %s via %s"):format(aL.shown,aL.src),"ok"end local function ab(nM,nN,...)
if a.busy then return end a.busy,a.busyText=true,nM local nO,jf=pcall(nN,...)a.busy,a.busyText=false,""
if not nO and jf~=dW then f("ERR "..tostring(jf))end end local function nP()local a5,nQ,nR=i6()
a.reason,a.level=nQ,nR if a5=="place"then ab("waxing...",h8)elseif a5=="crate"then ab("opening crate...",di,true)
elseif a5=="cratesmart"then ab("opening crate...",c.smart)elseif a5=="cratewin"then ab("opening the crate window...",e5)
elseif a5=="nocrate"then ab("discarding crate...",di,false)elseif a5=="sell"then ab("selling...",i0)
elseif a5=="buy"then ab("buying...",h3,false)elseif e.Collect and not a.matchSince and g()-a.lastCollect>=e.Every then
ab("collecting money...",nI)end end function b_(dz,nS)if dz==a.running then return end a.running=dz
if not nS then e.AutoStart=dz end if dz then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
c.lastFail,c.summonFails,c.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=g()
a.plot=aT()or a.plot f("START")else a.reason="stopped"f("STOP")end end local function fB()
local fC={}local function j(nT)fC[#fC+1]=tostring(nT)end j("=== SAB "..aQ.." DUMP "..os.date("%H:%M:%S").." ===")
j(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
j("reason: "..tostring(a.reason))j("targets: "..table.concat(hj(),", "))j(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
j("cash="..ak(an()))local nU,jg=C()j("in hands: "..tostring(nU)..(jg and(" ("..jg.ClassName..")")or"")..
"  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-g())))
j("  attribute SquishyEquipped = "..tostring(z:GetAttribute("SquishyEquipped")))local jh=a.plot and a.plot:FindFirstChild("SquishyEquipped")
j("  plot.SquishyEquipped = "..(jh and(#jh:GetChildren().." children")or"missing"))local fD=z.Character
if fD then local fE={}for qq,cd in ipairs(fD:GetDescendants())do if(cd:IsA("Model")or cd:IsA("Tool"))and cd.Name~=fD.Name then fE[#fE+1]=cd.ClassName..":"..cd.Name end
end j("  on the character: "..(table.concat(fE,", "):sub(1,300)))end local dA=bL()j("on pad: "..(dA and("%s [%s] %s"):format(dA.name,tostring(dA.rar),tostring(dA.price))or"nothing"))
j("sell spot: "..(a.sellSpot and W(a.sellSpot)or"none found"))j("--- CRATES ---")j(("waiting=%s windowOpen=%s title=%s rolled=%s (%ss ago) opened=%d tapWay=%s fails=%d/%d"):format(
tostring(c.waiting),tostring(c.on),c.title,tostring(c.rolled),c.rolledAt>0 and string.format("%.0f",g()-c.rolledAt)or"-",
a.crates,tostring(a.tapWay),a.crateFails,c.summonFails))j("--- CRATE OPENING ---")local function dB(aM,dC)
dC=dC or 0 local ji=type(aM)if ji=="string"then return("%q"):format(aM)end if ji=="table"then
if aM.__slot then return"<"..aM.__slot..">"end if dC>1 then return"{...}"end local fF={}
for nV,nW in pairs(aM)do fF[#fF+1]=tostring(nV).."="..dB(nW,dC+1)end return"{"..table.concat(fF,",").."}"
end local nX,jj=pcall(function()return aM.ClassName end)if nX and jj then return"<"..jj.." "..W(aM)..">"end
return tostring(aM)end j("watching CrateAction: "..tostring(c.oldNC~=nil).."  hookmetamethod="..type(hookmetamethod))
if c.learned then j("learned (mode "..tostring(c.learned.mode or"untried").."):")for nY,fG in ipairs(c.learned.seq)do
local jk={}for jl=1,fG.n do jk[jl]=dB(fG.args[jl])end j(("  %d. CrateAction:%s(%s)"):format(nY,fG.m,table.concat(jk,", ")))
end else j("not learned yet - it learns from the next crate that opens")end if c.directOff then j("direct opening is OFF for this session after 3 failures")end
if c.lastBad then j("last call that failed:")for nZ,fH in ipairs(c.lastBad.seq)do local jm={}
for jn=1,fH.n do jm[jn]=dB(fH.args[jn])end j(("  %d. CrateAction:%s(%s)"):format(nZ,fH.m,table.concat(jm,", ")))
end end j("CrateAction calls seen:")for qr,ce in ipairs(c.calls or{})do local jo={}for jp=1,ce.n do jo[jp]=dB(ce.args[jp])end
j(("  %.0fs ago  %s(%s)  [crate=%s]"):format(g()-ce.t,ce.m,table.concat(jo,", "),tostring(ce.crate)))
end local bp=c.findWin()if bp and type(getconnections)=="function"then j("how the game wired its crate window buttons (handler counts):")
for qs,cf in ipairs(bp:GetDescendants())do if cf:IsA("GuiButton")then local fI={}for qt,jq in ipairs({"MouseButton1Click","MouseButton1Down","MouseButton1Up","Activated",
"InputBegan","InputEnded","TouchTap"})do local n0,jr=pcall(function()return getconnections(cf[jq])end)
local js=(n0 and type(jr)=="table")and#jr or-1 if js~=0 then fI[#fI+1]=jq.."="..js end end
j(("  %s %s %q: %s"):format(cf.ClassName,cf.Name,bi(cf),table.concat(fI," ")))end end end
j(("crate window: %s visible=%s mine=%s yours=%s"):format(bp and W(bp)or"not found",tostring(bp and bp.Visible),tostring(c.ours),tostring(c.byYou)))
local dD=iq()j("crate prompt: "..(dD and(W(dD).." ["..dD.ActionText.."|"..dD.ObjectText.."]")or"none found"))
local jt=a.plot and a.plot:FindFirstChild("CrateStand")if jt then local fJ=0 for qu,a6 in ipairs(jt:GetDescendants())do
fJ=fJ+1 if fJ>30 then j("  ...")break end local ju=""if a6:IsA("ProximityPrompt")then ju=(" [%s|%s|on=%s|hold=%.2f]"):format(a6 .ActionText,a6 .ObjectText,tostring(a6 .Enabled),a6 .HoldDuration)end
j("  CrateStand/"..W(a6):gsub("^.-CrateStand%.","").." ("..a6 .ClassName..")"..ju)end else
j("  no CrateStand in the plot")end j("enabled prompts in the plot:")if a.plot then for qv,bq in ipairs(a.plot:GetDescendants())do
if bq:IsA("ProximityPrompt")and bq.Enabled then j(("  %s [%s|%s] safe=%s"):format(W(bq),bq.ActionText,bq.ObjectText,tostring(e3(bq))))
end end end local jv=z:FindFirstChildOfClass("PlayerGui")if jv then j("buttons on screen that say open/discard:")
for qw,cg in ipairs(jv:GetDescendants())do if cg:IsA("GuiButton")and da(cg)then local fK=bi(cg)
if fK:find("open",1,true)or fK:find("discard",1,true)then j(("  %s %s -> %q"):format(cg.ClassName,W(cg),fK))
end end end end j("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(dd~=nil))
j("--- CATALOG ("..x.n.." butters, worst rarity first) ---")for qx,dE in ipairs(x.rarOrder)do
local fL={}for qy,jw in ipairs(x.members[dE]or{})do fL[#fL+1]=(e.Targets[jw]and"*"or"")..L(jw)
end j(("  [%s]%s %s"):format(dE,A.price[dE]and(" crate $"..ak(A.price[dE]))or"",table.concat(fL,", ")))
end j("learned orders: ")for n1,n2 in pairs(A.order)do j("  "..n1 ..": "..table.concat(n2,", "))end
j("--- PLOT ---")j("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for qz,fM in ipairs(a.plot:GetChildren())do
j(("  %s %s (%d)"):format(fM.ClassName,fM.Name,#fM:GetChildren()))end local n3,n4=d_()j(("stations free %d / %d"):format(n3,n4))
local fN=ef()j("BuyPrompt: "..(fN and("enabled="..tostring(fN.Enabled).." hold="..fN.HoldDuration)or"MISSING"))
end j("autostart="..tostring(e.AutoStart).." rejoin="..tostring(e.Rejoin))j(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))j("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#ez())j("--- COLLECT PAD ---")
j("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and W(a.padPart)or"none"))
j("--- ATTRIBUTES ---")for qA,jx in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
j(("  %s = %s"):format(jx,tostring(z:GetAttribute(jx))))end j("--- EVENTS ---")for n5=math.max(1,#aR-15),#aR do j("  "..aR[n5])end
j("--- LOG ---")for n6=math.max(1,#az-25),#az do j("  "..az[n6])end return table.concat(fC,"\n")
end do local aN=ey(M.auto)if type(aN)=="string"then aN=aN:gsub("%s+$","")if aN~=""then a.autoload=aN
local n7=hv(aN)f(n7 and("loaded config "..aN)or("config "..aN.." could not be loaded"))
end end end local d={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local n8={ok=d.good,wait=d.warn,warn=d.warn,bad=d.bad,idle=d.dim}
local jy={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function r(n9,n_,oa)
local ob,fO=pcall(Instance.new,n9)if not ob then a.uiErrs=a.uiErrs+1 return nil end for oc,od in pairs(n_)do
if not pcall(function()fO[oc]=od end)then a.uiErrs=a.uiErrs+1 end end fO.Parent=oa return fO
end local function N(oe,of)r("UICorner",{CornerRadius=UDim.new(0,of or 6)},oe)end local b={}
local fP=z:FindFirstChildOfClass("PlayerGui")or z:WaitForChild("PlayerGui")local jz=fP:FindFirstChild("SABFarmGui")
if jz then jz:Destroy()end local fQ=r("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},fP)
local H={w=320,h=330,head=30,strip=38,tabs=26}b.root=r("Frame",{Name="Root",Size=UDim2 .new(0,H.w,0,H.h),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=d.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},fQ)
N(b.root,10)r("UIStroke",{Color=d.line,Thickness=1},b.root)local a7=UDim2 .new(1,0,1,0)
local function u(jA,jB)return UDim2 .new(jA,0,0,0),UDim2 .new(jB,(jA+jB>0.99)and 0 or-4,1,0)end
local function q(og,oh,oi,oj,ol,om)local jC=r("TextButton",{Text=oh,Position=ol,Size=om,BackgroundColor3=oi,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=oj,TextColor3=d.text,AutoButtonColor=true},og)N(jC,6)
return jC end local function jD(oo,op,oq,ot,ou)local fR=r("TextBox",{Text=op,PlaceholderText=oq,Position=ot,Size=ou,BackgroundColor3=d.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=d.text,PlaceholderColor3=d.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},oo)N(fR,6)r("UIPadding",{PaddingLeft=UDim.new(0,8)},fR)
return fR end local dF=cu.CurrentCamera local function ov()local ow,dG=pcall(function()return dF and dF.ViewportSize end)
if ow and dG and dG.X>50 and dG.Y>50 then return dG end end local function aO(ci)local fS=ov()
if not(fS and ci and ci.Parent)then return end local ox=pcall(function()local dH,jE=ci.AbsolutePosition,ci.AbsoluteSize
local fT=70 local jF=math.clamp(dH.X,fT-jE.X,fS.X-fT)local jG=math.clamp(dH.Y,0,fS.Y-math.min(jE.Y,fT))
if math.abs(jF-dH.X)>0.5 or math.abs(jG-dH.Y)>0.5 then ci.Position=UDim2 .new(0,math.floor(jF),0,math.floor(jG))
end end)return ox end local function dI(oy)local oz,fU=pcall(function()return oy.AbsolutePosition end)
if oz and fU then return{math.floor(fU.X),math.floor(fU.Y)}end end local dJ={}local function jH(dK,jI,jJ)
I(dK.InputBegan:Connect(function(cj)if cj.UserInputType~=Enum.UserInputType.MouseButton1 and cj.UserInputType~=Enum.UserInputType.Touch then return end
dJ[dK]={start=cj.Position,from=jI.Position,moved=0,target=jI}local fV fV=cj.Changed:Connect(function()
if cj.UserInputState==Enum.UserInputState.End then local jK=dJ[dK]dJ[dK]=nil if fV then fV:Disconnect()end
if jK and jJ then jJ(jK.moved)end end end)end))end I(kG.InputChanged:Connect(function(dL)
if dL.UserInputType~=Enum.UserInputType.MouseMovement and dL.UserInputType~=Enum.UserInputType.Touch then return end
for qB,aw in pairs(dJ)do local fW=aw.target if fW and fW.Parent then local jL,jM=dL.Position.X-aw.start.X,dL.Position.Y-aw.start.Y
aw.moved=math.max(aw.moved,math.abs(jL)+math.abs(jM))fW.Position=UDim2 .new(aw.from.X.Scale,aw.from.X.Offset+jL,aw.from.Y.Scale,aw.from.Y.Offset+jM)
end end end))local function D(oA,oB,oC,oD,oE,oF,oG)return r("TextLabel",{Text=oB,Position=oF or UDim2 .new(0,0,0,0),Size=oG or a7,BackgroundTransparency=1,
Font=oE and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=oC,TextColor3=oD,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},oA)
end b.title=r("Frame",{Size=UDim2 .new(1,0,0,H.head),BackgroundColor3=d.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=r("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=d.dim,BorderSizePixel=0},b.title)
N(b.dot,5)D(b.title,"SAB  BUTTER FARM  "..aQ,12,d.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=q(b.title,"-",d.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=q(b.title,"X",d.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=r("Frame",{Position=UDim2 .new(0,0,0,H.head),Size=UDim2 .new(1,0,0,H.strip),BackgroundColor3=d.bg,BorderSizePixel=0},b.root)
b.bar=r("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=d.warn,BorderSizePixel=0},b.strip)
N(b.bar,2)b.reason=D(b.strip,"starting",12,d.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=r("Frame",{Position=UDim2 .new(0,0,0,H.head+H.strip),Size=UDim2 .new(1,0,0,H.tabs),BackgroundTransparency=1},b.root)
b.tabFarm=q(b.tabs,"FARM",d.accent,10,UDim2 .new(0,8,0,0),UDim2 .new(0.25,-9,1,-4))b.tabBut=q(b.tabs,"BUTTERS",d.panel2,10,UDim2 .new(0.25,2,0,0),UDim2 .new(0.25,-4,1,-4))
b.tabCrt=q(b.tabs,"CRATES",d.panel2,10,UDim2 .new(0.5,2,0,0),UDim2 .new(0.25,-4,1,-4))b.tabSet=q(b.tabs,"SETUP",d.panel2,10,UDim2 .new(0.75,2,0,0),UDim2 .new(0.25,-10,1,-4))
local function dM()local fX=r("ScrollingFrame",{Position=UDim2 .new(0,0,0,H.head+H.strip+H.tabs),Size=UDim2 .new(1,0,1,-(H.head+H.strip+H.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=d.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)r("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},fX)
r("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},fX)
return fX end b.farm,b.but,b.set,b.crt=dM(),dM(),dM(),dM()b.but.Visible,b.set.Visible,b.crt.Visible=false,false,false
local dN,ck,o=0,12,nil local function T(jN,oH)dN,ck=dN+1,ck+jN+6 return r("Frame",{Size=UDim2 .new(1,0,0,jN),BackgroundTransparency=1,LayoutOrder=dN},oH or b.farm)
end local function cl(oI)D(T(14),oI,10,d.dim,true)end o=T(34)b.startB=q(o,"START",d.good,14,u(0,0.68))
b.killB=q(o,"KILL",d.bad,14,u(0.68,0.32))local oJ=T(42)local function cm(jO,oK,fY)local fZ=r("Frame",{Position=UDim2 .new((jO-1)/fY,0,0,0),Size=UDim2 .new(1/fY,jO<fY and-4 or 0,1,0),
BackgroundColor3=d.panel,BorderSizePixel=0},oJ)N(fZ,6)local jP=D(fZ,"0",15,d.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local oL=D(fZ,oK,9,d.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))jP.TextXAlignment,oL.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return jP end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=cm(1,"BOUGHT",5),cm(2,"WAXED",5),cm(3,"SOLD",5),cm(4,"MONEY",5),cm(5,"FREE",5)
b.info=D(T(40),"",10,d.dim,false)b.tgt=D(T(26),"",10,d.good,false)cl("MONEY COLLECT")o=T(28)
b.secB=jD(o,tostring(e.Every),"60",u(0,0.2))D(o,"sec",11,d.dim,false,u(0.21,0.09))b.secSet=q(o,"SET",d.accent,12,u(0.3,0.2))
b.colT=q(o,"COLLECT: ON",d.accent,11,u(0.5,0.5))o=T(26)b.padB=q(o,"SET PAD (stand on it)",d.panel2,10,u(0,0.55))
b.padL=D(o,"",10,d.dim,false,u(0.56,0.44))cl("BUTTERS YOU DID NOT TICK, AND CRATES")o=T(28)
b.sellT=q(o,"SELL THEM: ON",d.accent,11,u(0,0.55))b.sellB=q(o,"SELL NOW",d.warn,11,u(0.55,0.45))
o=T(28)b.crateT=q(o,"OPEN CRATES: ON",d.accent,11,u(0,0.55))b.crateB=q(o,"OPEN NOW",d.warn,11,u(0.55,0.45))
cl("TOOLS")o=T(30)b.buyB=q(o,"BUY",d.warn,10,u(0,0.2))b.plB=q(o,"WAX",d.good,10,u(0.2,0.2))
b.dumpB=q(o,"DUMP",d.accent,10,u(0.4,0.2))b.copyB=q(o,"COPY",d.panel2,10,u(0.6,0.2))b.linkB=q(o,"LINK",d.good,10,u(0.8,0.2))
cl("LOG")b.log=r("TextLabel",{Size=a7,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=d.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},T(84))N(b.log,6)r("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},b.log)
cl("OUTPUT  (DUMP result)")b.out=r("TextBox",{Size=a7,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},T(110))N(b.out,6)
b.farm.CanvasSize=UDim2 .new(0,0,0,ck)dN,ck=0,12 local function ac(oM)return T(oM,b.set)end
local function dO(oN)D(ac(14),oN,10,d.dim,true)end dO("SETTINGS FILE  (saved on your phone)")
o=ac(28)b.cfgName=jD(o,"default","config name",u(0,0.5))b.cfgSave=q(o,"SAVE",d.good,11,u(0.5,0.25))
b.cfgLoad=q(o,"LOAD",d.accent,11,u(0.75,0.25))o=ac(26)b.cfgPrev=q(o,"<",d.panel2,11,u(0,0.13))
b.cfgPick=q(o,"(none saved)",d.panel2,10,u(0.13,0.74))b.cfgNext=q(o,">",d.panel2,11,u(0.87,0.13))
o=ac(26)b.cfgAuto=q(o,"LOAD IT ON LAUNCH: OFF",d.panel2,10,u(0,1))b.cfgMsg=D(ac(26),"",10,d.dim,false)
dO("START BY ITSELF")o=ac(26)b.autoB=q(o,"INSTALL F.exec",d.accent,10,u(0,1))b.autoMsg=D(ac(30),"",10,d.dim,false)
o=ac(28)b.startT=q(o,"START FARMING ON LOAD: ON",d.accent,10,u(0,1))D(ac(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,d.dim,false)
dO("IF THE GAME DROPS ME")o=ac(28)b.rejT=q(o,"AUTO REJOIN: ON",d.accent,11,u(0,0.55))b.rejB=q(o,"REJOIN NOW",d.warn,11,u(0.55,0.45))
b.rejMsg=D(ac(30),"",10,d.dim,false)dO("THE ROUND SAB BUTTON")D(ac(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,d.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,ck)local jQ=r("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},fP)
b.tgRoot=r("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=d.accent,BorderSizePixel=0,Active=true},jQ)N(b.tgRoot,26)r("UIStroke",{Color=d.line,Thickness=1},b.tgRoot)
b.tgBtn=r("TextButton",{Text="SAB",Size=a7,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=d.text,AutoButtonColor=false},b.tgRoot)b.tgDot=r("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=d.dim,
BorderSizePixel=0},b.tgRoot)N(b.tgDot,4)local ax={built=false,boxes={},at=0}local function jR(jS,f0)
e.Targets[jS]=f0 or nil local f1=ax.boxes[jS]if f1 then f1 .Text=f0 and"X"or""f1 .BackgroundColor3=f0 and d.good or d.panel2
end end local function f2()for oO,jT in pairs(ax.boxes)do local jU=e.Targets[oO]==true jT.Text=jU and"X"or""
jT.BackgroundColor3=jU and d.good or d.panel2 end end local cn local function oP()local oQ=0
local f3=r("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=D(f3,"",10,d.dim,false,u(0,0.5))local oR=q(f3,"CLEAR",d.panel2,10,u(0.5,0.24))
local oS=q(f3,"REFRESH",d.panel2,10,u(0.74,0.26))oR.MouseButton1Click:Connect(function()
for oT in pairs(e.Targets)do e.Targets[oT]=nil end f2()end)oS.MouseButton1Click:Connect(function()
x.at=0 ex()cn(true)end)return oQ end cn=function(oU)if not ex()then if not b.butEmpty then
b.butEmpty=D(r("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,d.warn,false)end return
end if ax.built and not oU and ax.at==x.at then return end for qC,f4 in ipairs(b.but:GetChildren())do
if f4:IsA("Frame")or f4:IsA("TextButton")then f4:Destroy()end end ax.boxes,b.butEmpty={},nil
oP()local f5,f6=36,1 local function jV(jW)f6=f6+1 local oV=r("Frame",{Size=UDim2 .new(1,0,0,jW),BackgroundTransparency=1,LayoutOrder=f6},b.but)
f5=f5+jW+6 return oV end for qD,dP in ipairs(x.rarOrder)do local oW=jV(24)local oX=jy[dP]or d.text
local f7=r("Frame",{Size=a7,BackgroundColor3=d.panel,BorderSizePixel=0},oW)N(f7,6)D(f7,"  "..dP:upper(),11,oX,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local oY=q(f7,"ALL",d.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local oZ=dP
oY.MouseButton1Click:Connect(function()local jX=x.members[oZ]or{}local jY=false for qE,o0 in ipairs(jX)do if not e.Targets[o0]then jY=true break end end
for qF,o1 in ipairs(jX)do jR(o1,jY)end end)for qG,f8 in ipairs(x.members[dP]or{})do local o2=jV(22)
local dQ=r("TextButton",{Text="",Size=a7,BackgroundColor3=d.bg,BorderSizePixel=0,AutoButtonColor=true},o2)
N(dQ,5)D(dQ,"   "..L(f8),11,d.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local f9=r("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},dQ)
N(f9,4)ax.boxes[f8]=f9 local jZ=f8 local function j0()jR(jZ,not e.Targets[jZ])end dQ.MouseButton1Click:Connect(j0)
f9 .MouseButton1Click:Connect(j0)end end f2()b.but.CanvasSize=UDim2 .new(0,0,0,f5+10)ax.built,ax.at=true,x.at
end function l.paint()for o3,j1 in pairs(l.boxes)do local j2=e.CrateTicks[o3]==true j1 .Text=j2 and"X"or""
j1 .BackgroundColor3=j2 and d.good or d.panel2 end if b.crtInfo then local f_,ga=0,0 for qH in pairs(l.boxes)do f_=f_+1 end
for qI,o4 in pairs(e.CrateTicks)do if o4 then ga=ga+1 end end b.crtInfo.Text=("%d crates, %d ticked"):format(f_,ga)
end if b.crtAll then b.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"
b.crtAll.BackgroundColor3=e.Crates and d.accent or d.panel2 end end function l.build()for qJ,gb in ipairs(b.crt:GetChildren())do
if gb:IsA("Frame")or gb:IsA("TextButton")then gb:Destroy()end end l.boxes={}local gc,gd=12,0
local function dR(j3)gd=gd+1 gc=gc+j3+6 return r("Frame",{Size=UDim2 .new(1,0,0,j3),BackgroundTransparency=1,LayoutOrder=gd},b.crt)
end local ge=dR(28)b.crtInfo=D(ge,"",10,d.dim,false,u(0,0.5))local o5=q(ge,"CLEAR",d.panel2,10,u(0.5,0.24))
local o6=q(ge,"REFRESH",d.panel2,10,u(0.74,0.26))I(o5 .MouseButton1Click:Connect(function()e.CrateTicks={}l.paint()end))
I(o6 .MouseButton1Click:Connect(function()l.build()end))b.crtAll=q(dR(28),"",d.accent,11,u(0,1))
I(b.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates l.paint()end))D(dR(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,d.dim,false)
for qK,ay in ipairs(l.list())do local o7=dR(24)local co=r("TextButton",{Text="",Size=a7,BackgroundColor3=d.panel,BorderSizePixel=0,AutoButtonColor=true},o7)
N(co,5)D(co,"  "..(ay.title or ay.name)..(ay.guess and"  (?)"or""),11,jy[ay.rar or""]or d.text,true,
UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))D(co,ay.price and("$"..ak(ay.price))or(ay.rar or""),9,d.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local gf=r("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},co)
N(gf,4)l.boxes[ay.k]=gf local j4=ay.k local function j5()e.CrateTicks[j4]=(not e.CrateTicks[j4])or nil
l.paint()end I(co.MouseButton1Click:Connect(j5))I(gf.MouseButton1Click:Connect(j5))end b.crt.CanvasSize=UDim2 .new(0,0,0,gc+10)
l.built=l.at l.paint()end local j6="farm"local function br(ai)j6=ai b.farm.Visible,b.but.Visible,b.set.Visible=(ai=="farm"),(ai=="but"),(ai=="set")
b.crt.Visible=(ai=="crt")b.tabCrt.BackgroundColor3=(ai=="crt")and d.accent or d.panel2 if ai=="crt"and(l.built~=l.at or not next(l.boxes))then l.build()end
b.tabFarm.BackgroundColor3=(ai=="farm")and d.accent or d.panel2 b.tabBut.BackgroundColor3=(ai=="but")and d.accent or d.panel2
b.tabSet.BackgroundColor3=(ai=="set")and d.accent or d.panel2 if ai=="but"then cn(false)end
end local function J(j7,j8,o8,o9)j7 .Text=j8 and o8 or o9 j7 .BackgroundColor3=j8 and d.accent or d.panel2
end local function o_()b.secB.Text=tostring(e.Every)J(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
J(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")J(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
J(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")J(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then b_(e.AutoStart,true)end if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end aO(b.root)
aO(b.tgRoot)a.lastCollect=g()f2()l.paint()end local function pa(j9)task.spawn(function()
j9 .TextColor3=d.bad task.wait(0.8)if a.alive then j9 .TextColor3=d.text end end)end local function j_()
local ka=b.secB.Text:match("^%s*(%d+)%s*$")local cp=ka and tonumber(ka)if not cp or cp<1 then
b.secB.Text=tostring(e.Every)pa(b.secB)f("interval must be a whole number >= 1")return end
if cp==e.Every then return end e.Every,a.lastCollect=cp,g()f("collect every "..cp.."s")
end local function gg(pb)local kb=setclipboard or toclipboard return type(kb)=="function"and pcall(kb,pb)
end local function pc()local gh=O~=""and O or(a.reason.."\n"..table.concat(az,"\n"))if gg(gh)then f("copied "..#gh.." chars")return end
b.out.Text=gh pcall(function()b.out:CaptureFocus()end)f("no clipboard here - select the text in OUTPUT")
end local function pd()local pe,kc=pcall(fB)O=pe and kc or("DUMP ERROR "..tostring(kc))
local kd=gg(O)b.out.Text=(kd and#O>7000)and(O:sub(1,7000).."\n... (full text is on your clipboard)")or O
f("DUMP "..#O.." chars"..(kd and", copied"or""))end local function y(pf,pg)I(pf.MouseButton1Click:Connect(pg))end
y(b.secSet,j_)I(b.secB.FocusLost:Connect(j_))y(b.colT,function()e.Collect,a.lastCollect=not e.Collect,g()
J(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")end)y(b.sellT,function()e.SellJunk=not e.SellJunk
J(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)y(b.sellB,function()a.sellFails=0
task.spawn(ab,"selling...",i0)end)y(b.crateT,function()e.Crates=not e.Crates J(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)y(b.crateB,function()c.lastFail,c.summonFails,c.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(ab,"opening crate...",di,true)
end)y(b.padB,function()a.plot=aT()or a.plot local ke,gi=aS(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(ke and gi and gi:IsA("BasePart"))then f("SET PAD: need character and plot")return end
a.manualPad=gi.CFrame:ToObjectSpace(ke.HumanoidRootPart.CFrame)ny(a.manualPad)f("collect pad saved at your position")
end)y(b.startB,function()b_(not a.running)end)y(b.buyB,function()a.plot=aT()or a.plot task.spawn(ab,"buying (manual)...",h3,true)
end)y(b.plB,function()a.plot=aT()or a.plot task.spawn(ab,"waxing (manual)...",h8)end)y(b.dumpB,pd)
y(b.copyB,pc)y(b.linkB,function()task.spawn(function()local ph,pj=pcall(fB)O=ph and pj or O
if O==""then O="(empty dump)"end local kf=(type(request)=="function"and request)or(type(http_request)=="function"and http_request)
or(syn and syn.request)or(http and http.request)if type(kf)~="function"then b.out.Text="this executor cannot upload - use COPY instead"return end
b.out.Text="uploading..."local kg,bs=pcall(kf,{Url="https://paste.rs/",Method="POST",Headers={["Content-Type"]="text/plain"},Body=O})
local gj=kg and type(bs)=="table"and(bs.StatusCode or bs.status_code)or 0 local pk=kg and type(bs)=="table"and(bs.Body or bs.body)or""
local gk=(gj>=200 and gj<300)and tostring(pk):match("https?://[%w%./%-_]+")or nil if not gk then
b.out.Text="upload failed ("..tostring(gj)..") - use COPY instead"f("LINK failed")return
end local kh=gg(gk)b.out.Text="SEND THIS LINK TO CLAUDE:\n"..gk..(kh and"\n(copied)"or"")
f("dump uploaded"..(kh and", link copied"or""))end)end)y(b.tabFarm,function()br("farm")end)
y(b.tabBut,function()br("but")end)y(b.tabSet,function()br("set")end)y(b.tabCrt,function()br("crt")end)
local function ki(gl)a.hidden=gl b.root.Visible=not gl b.tgBtn.Text=gl and"SAB+"or"SAB"
end jH(b.tgRoot,b.tgRoot,function(pl)aO(b.tgRoot)a.togPos=dI(b.tgRoot)or a.togPos if pl<8 then ki(not a.hidden)end
end)y(b.tgBtn,function()ki(not a.hidden)end)local V,K={},0 local function aP()V=ez()if#V==0 then
b.cfgPick.Text="(none saved)"K=0 return end if K<1 or K>#V then K=1 end b.cfgPick.Text=V[K]..("  (%d/%d)"):format(K,#V)
end local function kj()local kk=a.autoload~=nil b.cfgAuto.Text=kk and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
b.cfgAuto.BackgroundColor3=kk and d.accent or d.panel2 end local function gm()local kl=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if kl~=""then return kl end return(K>0 and V[K])or""end y(b.cfgSave,function()a.winPos=dI(b.root)or a.winPos
a.togPos=dI(b.tgRoot)or a.togPos local km,kn=eD(gm())b.cfgMsg.Text=km and("saved as "..kn)or("could not save: "..kn)
b.cfgMsg.TextColor3=km and d.good or d.bad aP()f(b.cfgMsg.Text)end)local function pm(ko)
local gn,kp=hv(ko)b.cfgMsg.Text=gn and("loaded "..kp)or("could not load: "..kp)b.cfgMsg.TextColor3=gn and d.good or d.bad
if gn then b.cfgName.Text=ko o_()end f(b.cfgMsg.Text)end y(b.cfgLoad,function()pm(gm())end)
y(b.cfgPick,function()aP()if K>0 then b.cfgName.Text=V[K]end end)y(b.cfgPrev,function()
if#V==0 then aP()return end K=(K-2)%#V+1 aP()b.cfgName.Text=V[K]end)y(b.cfgNext,function()
if#V==0 then aP()return end K=K%#V+1 aP()b.cfgName.Text=V[K]end)y(b.cfgAuto,function()if a.autoload then
hx(nil)b.cfgMsg.Text="it will not load a config on launch"else local cq=gm()local kq=false
for qL,pn in ipairs(ez())do if pn==cq then kq=true end end local po=kq or eD(cq)if po and cq~=""then
hx(cq)aP()b.cfgMsg.Text=cq.." will load every time the script starts"else b.cfgMsg.Text="name the config and save it first"
end end b.cfgMsg.TextColor3=d.dim kj()end)y(b.autoB,function()local kr,ks=lX()b.autoMsg.Text=kr and("installed. "..ks)or("failed: "..ks)
b.autoMsg.TextColor3=kr and d.good or d.bad f(b.autoMsg.Text)end)y(b.startT,function()e.AutoStart=not e.AutoStart
J(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)y(b.rejT,function()
e.Rejoin=not e.Rejoin J(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)y(b.rejB,function()cY("you asked")end)
local bt=false y(b.minB,function()bt=not bt b.tabs.Visible=not bt if bt then b.farm.Visible,b.but.Visible,b.set.Visible,b.crt.Visible=false,false,false,false
else br(j6)end b.root.Size=UDim2 .new(0,H.w,0,bt and(H.head+H.strip)or H.h)b.minB.Text=bt and"+"or"-"
end)local function dS()if not a.alive then return end a.alive,a.running=false,false pcall(eh)
for qM,pp in ipairs(dX)do pcall(function()pp:Disconnect()end)end if c.oldNC then pcall(function()hookmetamethod(game,"__namecall",c.oldNC)end)end
pcall(function()fQ:Destroy()end)pcall(function()jQ:Destroy()end)if a8 .SAB_KILL==dS then a8 .SAB_KILL=nil end
end a8 .SAB_KILL=dS y(b.killB,dS)y(b.xB,dS)jH(b.title,b.root,function()aO(b.root)a.winPos=dI(b.root)or a.winPos
end)local function kt()local cr,cs=a.reason,a.level if a.busy then cr,cs=a.busyText,"ok"
elseif not a.running then local qN,ku,pq=i6()if a.capHit then cr,cs=ku,"bad"else cr,cs="[stopped] "..ku,(pq=="bad")and"bad"or"idle"end
a.reason,a.level=cr,cs end b.reason.Text=cr b.bar.BackgroundColor3=n8[cs]or d.dim b.dot.BackgroundColor3=a.running and d.good or(a.capHit and d.bad or d.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and d.panel2 or d.accent
b.startB.Text=a.running and"STOP"or"START"J(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and d.warn or d.good local pr,ps=d_()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),pr.."/"..ps local kv=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(g()-a.lastCollect)))or nil
local kw=C()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ak(an()),a.rolls,a.gifts,a.crates,kw and L(E(kw))or"nothing",c.on and("   ["..c.title.." window open]")or"",
kv and("in "..kv.."s")or"off")local bu=hj()b.tgt.Text=(#bu==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#bu<=3)and table.concat(bu,", ")or(#bu.." butters ticked")))b.tgt.TextColor3=(#bu==0)and d.bad or d.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(cv,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(x.n,#x.rarOrder,#bu)
end if b.but.Visible and ax.at~=x.at then cn(false)end if b.crt.Visible then if l.built~=l.at then l.build()else l.paint()end
end J(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end a8 .SAB={S=a,CFG=e,EV=v,U=b,sg=fQ,dump=fB,CAT=x,LEARN=A,buildList=cn}
f(aQ.." loaded")if a.uiErrs>0 then f("UI: "..a.uiErrs.." properties skipped")end br("farm")
aO(b.root)aO(b.tgRoot)if dF then pcall(function()I(dF:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)aO(b.root)aO(b.tgRoot)end))end)end aP()kj()if a.config and a.config~=""then b.cfgName.Text=a.config end
J(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")J(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")
J(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")J(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
J(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")b.secB.Text=tostring(e.Every)
pcall(kt)task.spawn(function()local kx=eF()b.rejMsg.Text=kx and("after a rejoin it restarts from\n"..kx)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(ey(M.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(l3)end)task.spawn(function()while a.alive do local pt,pu=pcall(kt)if not pt then f("UI ERR "..tostring(pu))end
task.wait(0.25)end end)task.spawn(function()local pv,pw=pcall(mb)if not pv then f("HOOK ERR "..tostring(pw))end
end)task.spawn(function()pcall(k4)if c.loadSeq and not c.learned then local dT={}for ky=1,20 do if c.loadSeq[ky]then dT[#dT+1]=c.loadSeq[ky]end end
if#dT>0 then c.learned={seq=dT,mode=c.loadMode}f("remembered how to open crates directly")
end end if ex()then f(("catalog: %d butters in %d rarities"):format(x.n,#x.rarOrder))end
local px,kz=pcall(nA)if px and kz and a.alive and not a.manualPad then a.manualPad=kz end
end)task.spawn(function()while a.alive do task.wait(20)pcall(eh)end end)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local pz=(type(newcclosure)=="function")and newcclosure or function(py)return py end
local go go=hookmetamethod(game,"__namecall",pz(function(kA,...)if a.alive and not c.replaying then
local gp=getnamecallmethod()if gp=="InvokeServer"or gp=="FireServer"then local pA,pB=pcall(function()return kA.Name end)
if pA and pB=="CrateAction"then pcall(c.saw,gp,...)end end end return go(kA,...)end))c.oldNC=go
end)end if dV then I(z.Idled:Connect(function()pcall(function()dV:CaptureController()dV:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()if not e.AutoStart then return end a.reason,a.level="waiting for the game to load, then starting","wait"
for qO=1,120 do if not a.alive then return end if a.running then return end a.plot=a.plot or aT()
if aS()and a.plot and next(e.Targets)then b_(true,true)f("started by itself")return end
task.wait(1)end if a.alive and not a.running then f("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=aT()a.lastCollect=g()while a.alive do if a.running then
local pC,kB=pcall(nP)if not pC and kB~=dW then f("LOOP ERR "..tostring(kB))end end task.wait(0.1)
end end)dU("loaded - window is at the top left")end local pE,gq=xpcall(kF,function(pD)return tostring(pD).."\n"..debug.traceback()end)
if not pE then pcall(function()warn("SAB "..aQ.." ERROR: "..tostring(gq))end)dU("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..aQ.." ERROR: "..tostring(gq))end)pcall(function()local kC=(type(getgenv)=="function"and getgenv())or _G
if type(kC.SAB_KILL)=="function"then kC.SAB_KILL()end for qP,pF in ipairs({"SABFarmGui","SABToggle"})do
local kD=z.PlayerGui:FindFirstChild(pF)if kD then kD:Destroy()end end end)pcall(function()
local ct=Instance.new("ScreenGui")ct.Name="SABError"ct.ResetOnSpawn=false ct.DisplayOrder=1000
local aj=Instance.new("TextBox")aj.Size=UDim2 .new(0,340,0,170)aj.Position=UDim2 .new(0,10,0,50)
aj.BackgroundColor3=Color3 .fromRGB(90,20,20)aj.TextColor3=Color3 .new(1,1,1)aj.TextSize=11
aj.TextWrapped=true aj.ClearTextOnFocus=false aj.TextXAlignment=Enum.TextXAlignment.Left
aj.TextYAlignment=Enum.TextYAlignment.Top aj.Text="SAB "..aQ.." failed to start. Send this text:\n"..tostring(gq)
aj.Parent=ct ct.Parent=z:WaitForChild("PlayerGui")end)end
