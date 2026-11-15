local aZ="v23"local gW=game:GetService("Players")local r=gW.LocalPlayer or gW.PlayerAdded:Wait()
local function eh(lv)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..aZ,Text=lv,Duration=6})
end)end eh("script started")local function lw()local be=game:GetService("ReplicatedStorage")
local cJ=game:GetService("Workspace")local lx=game:GetService("UserInputService")local bf=(type(getgenv)=="function"and getgenv())or _G
if type(bf.SAB_KILL)=="function"then pcall(bf.SAB_KILL)end local j=(type(tick)=="function")and tick or os.clock
local ei=(function()local ly,lz=pcall(function()return game:GetService("VirtualUser")end)return ly and lz or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
}local a={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=j(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local z={name=nil,rar=nil,at=j(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local g={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}
local c={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,
ours=false,byYou=false,openedAt=0,win=nil}local ej={}local ek,cK,aF,a0={},{},{},{}local W=""
local function K(gX)ek[#ek+1]=gX return gX end local function aG(lA)task.wait(lA)if not a.alive then error(ej,0)end
end local function f(cL)cL=os.date("%H:%M:%S").." "..tostring(cL)table.insert(cK,1,cL)if#cK>6 then table.remove(cK)end
aF[#aF+1]=cL if#aF>80 then table.remove(aF,1)end end local function cM(gY)if type(gY)~="string"then return""end
return(gY:lower():gsub("[^%w]",""))end local function F(lB)local gZ=cM(lB)local el=gZ:gsub("butter$","")
if el==""then el=gZ end return el end local function aH(em)return type(em)=="string"and F(em)~=""and e.Targets[F(em)]==true end
local function lC(bK)bK=bK:lower()return bK:find("squishy",1,true)~=nil or bK:match("butter$")~=nil or bK:match("butter[^%a]")~=nil
end local en={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function an(bL)
if type(bL)~="number"then return"?"end local cN=1 while math.abs(bL)>=1000 and cN<#en do bL=bL/1000 cN=cN+1 end
local lD=string.format("%.2f",bL):gsub("%.?0+$","")return lD..en[cN]end local function lE(g0)
if type(g0)~="string"then return nil end local lF,g1=g0:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local eo=tonumber(lF)if not eo then return nil end if g1==""then return eo end for lG,lH in ipairs(en)do if lH:lower()==g1:lower()then return eo*1000^(lG-1)end end
return nil end local function aq()local g2=r:GetAttribute("BoardValueMoney")if type(g2)=="number"then return g2 end
local g3=r:FindFirstChild("leaderstats")if g3 then for qR,lI in ipairs({"Cash","Money","Coins"})do
local ep=g3:FindFirstChild(lI)if ep and type(ep.Value)=="number"then return ep.Value end
end end end local function ae(lJ)local eq=lJ:GetFullName()if a.plot then local er=a.plot:GetFullName()
if eq:sub(1,#er)==er then return eq:sub(#er+2)end end return eq end local function aI()
local cO=r.Character if cO and cO:FindFirstChild("HumanoidRootPart")then local g4=cO:FindFirstChildOfClass("Humanoid")
if g4 and g4 .Health>0 then return cO end end end local function aJ()local es=cJ:FindFirstChild("Plots")
if not es then return nil end local function g5(lK)local g6=lK:FindFirstChild("Plate")return g6~=nil and g6:FindFirstChild("EditStackAttachment",true)~=nil
end local g7=r:GetAttribute("PlotNumber")if g7~=nil then local et=es:FindFirstChild(tostring(g7))
if et and g5(et)then return et end end for qS,g8 in ipairs(es:GetChildren())do if g5(g8)then return g8 end
end end local function bM(g9)local aK=g9 and g9 .Parent for qT=1,6 do if not aK then return nil end
if aK:IsA("BasePart")then return aK end if aK:IsA("Model")then return aK.PrimaryPart or aK:FindFirstChildWhichIsA("BasePart",true)end
aK=aK.Parent end end local function g_(ha)local eu=ha.Parent if eu and eu:IsA("Attachment")then return eu.WorldPosition end
local hb=bM(ha)return hb and hb.Position end local function lL()local bh=a.plot and a.plot:FindFirstChild("Plate")
if not bh then return nil end if bh:IsA("BasePart")then return bh.Position end if bh:IsA("Model")then return bh:GetPivot().Position end
local hc=bh:FindFirstChildWhichIsA("BasePart",true)return hc and hc.Position end local function hd()
local ev={}local he=a.plot and a.plot:FindFirstChild("WaxStations")if he then for qU,lM in ipairs(he:GetChildren())do
local hf=lM:FindFirstChild("SquishyPlaceHolder")local ew=hf and hf:FindFirstChild("PlacePrompt")
if ew and ew:IsA("ProximityPrompt")then ev[#ev+1]=ew end end end return ev end local function ex()
local hg,ey=hd(),0 for qV,lN in ipairs(hg)do if lN.Enabled then ey=ey+1 end end local ez=#hg
local eA=r:GetAttribute("WaxStations")if type(eA)=="number"and eA>ez then ez=eA end return ey,ez
end local function lO()local hh=aI()local hi=hh and hh.HumanoidRootPart.Position local eB,hj
for qW,eC in ipairs(hd())do if eC.Enabled then local hk=g_(eC)local hl=(hk and hi)and(hk-hi).Magnitude or 1e9
if not eB or hl<hj then eB,hj=eC,hl end end end return eB end local function eD()local cP=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not cP then return nil end local hm=cP:FindFirstChild("BuyPromptAttachment")local cQ=(hm and hm:FindFirstChild("BuyPrompt"))or cP:FindFirstChild("BuyPrompt",true)
if cQ and cQ:IsA("ProximityPrompt")and cQ:IsDescendantOf(cP)then return cQ end end local hn={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local lP={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local C={order={},price={},dirty=false}local o={seen={},at=0,boxes={},built=0}local A={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local eE="SAB_order.txt"local function eF()if not C.dirty or type(writefile)~="function"then return end
local aa={}for lQ,lR in pairs(C.price)do aa[#aa+1]="P|"..lQ.."|"..string.format("%.0f",lR)end
for lS,lT in pairs(C.order)do aa[#aa+1]="O|"..lS.."|"..table.concat(lT,",")end if c.learned and c.enc then
aa[#aa+1]="M|mode|"..tostring(c.learned.mode or"")for lU,cR in ipairs(c.learned.seq)do local ho={}
for hp=1,cR.n do ho[hp]=c.enc(cR.args[hp])end aa[#aa+1]=("A|%d|%s|%d|%s"):format(lU,cR.m,cR.n,table.concat(ho,";"))
end end local function eG(lV,lW,cS)local hq={}for hr=1,cS.n do hq[hr]=c.enc(cS.args[hr])end
aa[#aa+1]=("R|%d|%s|%s|%d|%s"):format(lW,lV,cS.m,cS.n,table.concat(hq,";"))end if c.enc then
for lX,lY in ipairs(g.rec.rules)do eG("rules",lX,lY)end if g.rec.on then eG("on",0,g.rec.on)end
if g.rec.off then eG("off",0,g.rec.off)end end for qX,bN in pairs(o.seen)do aa[#aa+1]=("K|%s|%s|%s|%s"):format(bN.name,bN.title or"",bN.rar or"",bN.price and string.format("%.0f",bN.price)or"")
end if pcall(writefile,eE,table.concat(aa,"\n"))then C.dirty=false end end local function lZ()
if type(isfile)~="function"or type(readfile)~="function"then return end local l0,l1=pcall(isfile,eE)
if not(l0 and l1)then return end local l2,hs=pcall(readfile,eE)if not(l2 and type(hs)=="string")then return end
for l3 in hs:gmatch("[^\n]+")do local bi,bj,ar=l3:match("^(%a)|([^|]+)|(.*)$")if bi=="P"then
C.price[bj]=tonumber(ar)elseif bi=="M"then c.loadMode=(ar~=""and ar~="nil")and ar or nil
elseif bi=="A"and c.dec then local ht=tonumber(bj)local hu,cT,l4=ar:match("^([^|]+)|(%d+)|(.*)$")
if ht and hu then cT=tonumber(cT)local hv,cU={},0 for l5 in(l4 ..";"):gmatch("([^;]*);")do
cU=cU+1 if cU<=cT then hv[cU]=c.dec(l5)end end c.loadSeq=c.loadSeq or{}c.loadSeq[ht]={m=hu,n=cT,args=hv}
end elseif bi=="R"and c.dec then local hw=tonumber(bj)local cV,l6,cW,l7=ar:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")
if hw and cV then cW=tonumber(cW)local hx,cX={},0 for l8 in(l7 ..";"):gmatch("([^;]*);")do
cX=cX+1 if cX<=cW then hx[cX]=c.dec(l8)end end local eH={m=l6,n=cW,args=hx}if cV=="rules"then g.rec.rules[hw]=eH
elseif cV=="on"then g.rec.on=eH elseif cV=="off"then g.rec.off=eH end end elseif bi=="K"then
local hy,hz,l9=ar:match("^([^|]*)|([^|]*)|(.*)$")o.seen[o.key(bj)]={name=bj,title=hy~=""and hy or nil,
rar=hz~=""and hz or nil,price=tonumber(l9)}elseif bi=="O"and ar~=""then local cY={}for l_ in ar:gmatch("[^,]+")do cY[#cY+1]=l_ end
if#cY>0 then C.order[bj]=cY end end end end local function ma(cZ)if type(cZ)~="table"then return end
local a1,hA=cZ.rarity,cZ.contents if type(a1)~="string"or a1==""or type(hA)~="table"then return end
local bO={}for qY,c0 in ipairs(hA)do if type(c0)=="table"and type(c0 .butter)=="string"then
bO[#bO+1]={n=c0 .butter,ch=tonumber(c0 .chance)or 0}end end if#bO==0 then return end table.sort(bO,function(mb,mc)return mb.ch>mc.ch end)
local bP,bQ={},false for md,me in ipairs(bO)do bP[md]=me.n end local eI=C.order[a1]if not eI or#eI~=#bP then bQ=true end
if not bQ then for hB=1,#bP do if eI[hB]~=bP[hB]then bQ=true break end end end C.order[a1]=bP
local eJ=tonumber(cZ.price)if eJ and C.price[a1]~=eJ then C.price[a1]=eJ bQ=true end if bQ then
C.dirty=true A.at=0 f("learned the "..a1 .." order from its crate")end end local function bk(mf,mg)
local mh=mf:FindFirstChild(mg,true)local mi,eK=pcall(function()return mh.Text end)return(mi and type(eK)=="string"and eK~="")and eK or nil
end local function N(hC)return A.pretty[hC]or hC end o.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},
{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},
{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}
function o.key(mj)return cM(mj or"")end function o.learn(as)if type(as)~="table"or type(as.name)~="string"then return end
local eL=o.key(as.name)local au=o.seen[eL]or{}local mk=(o.seen[eL]==nil)or(tonumber(as.price)and au.price~=tonumber(as.price))
au.name,au.title=as.name,as.title or au.title au.rar,au.price=as.rarity or au.rar,tonumber(as.price)or au.price
o.seen[eL]=au if mk then o.at,C.dirty=j(),true end end function o.wanted(hD)return hD~=nil and e.CrateTicks[o.key(hD)]==true end
function o.list()local bl={}for ml,c1 in ipairs(o.base)do bl[o.key(c1[1])]={name=c1[1],title=c1[2],rar=c1[3],i=ml}end
for qZ,bR in ipairs(A.rarOrder)do local hE=false for q0,mm in pairs(bl)do if mm.rar==bR then hE=true break end end
if not hE and bR~="?"then local hF=bR:gsub("[^%w]","").."Crate"bl[o.key(hF)]={name=hF,title=bR.." Crate",rar=bR,i=50,guess=true}
end end for hG,c2 in pairs(o.seen)do local ao=bl[hG]or{i=100}ao.name,ao.title,ao.rar=c2 .name or ao.name,c2 .title or ao.title,c2 .rar or ao.rar
ao.price,ao.guess=c2 .price or ao.price,nil bl[hG]=ao end local bS,c3={},{}for mn,mo in ipairs(hn)do bS[mo]=mn end
for mp,hH in ipairs(A.rarOrder)do bS[hH]=bS[hH]or(20+mp)end for mq,bT in pairs(bl)do bT.k=mq
bT.price=bT.price or C.price[bT.rar or""]c3[#c3+1]=bT end table.sort(c3,function(a2,a3)
if a2 .price and a3 .price and a2 .price~=a3 .price then return a2 .price<a3 .price end
local hI,hJ=bS[a2 .rar or""]or 99,bS[a3 .rar or""]or 99 if hI~=hJ then return hI<hJ end
if(a2 .i or 100)~=(a3 .i or 100)then return(a2 .i or 100)<(a3 .i or 100)end return a2 .k<a3 .k
end)return c3 end local function mr()local hK=be:FindFirstChild("Assets")local hL=hK and hK:FindFirstChild("Squishies")
if not hL then return false end local eM,hM,bm={},{},{}local c4=0 for q1,c5 in ipairs(hL:GetChildren())do
local bU=F(c5 .Name)if bU~=""and not eM[bU]then local c6=bk(c5,"RarityText")or"?"eM[bU]=c6
hM[bU]=bk(c5,"NameText")or c5 .Name bm[c6]=bm[c6]or{}table.insert(bm[c6],bU)c4=c4+1 end
end if c4==0 then return false end for hN,ms in pairs(bm)do local hO=C.order[hN]or lP[hN]
local eN={}if hO then for mt,mu in ipairs(hO)do eN[F(mu)]=mt end end table.sort(ms,function(hP,hQ)
local eO,eP=eN[hP],eN[hQ]if eO and eP then return eO<eP end if eO then return true end if eP then return false end
return N(hP)<N(hQ)end)end local eQ={}for mv,mw in ipairs(hn)do eQ[mw]=mv end local c7={}
for mx in pairs(bm)do c7[#c7+1]=mx end table.sort(c7,function(eR,eS)local eT,eU=C.price[eR],C.price[eS]
if eT and eU and eT~=eU then return eT<eU end local eV,eW=eQ[eR],eQ[eS]if eV and eW then return eV<eW end
if eV then return true end if eW then return false end return eR<eS end)A.rar,A.pretty,A.members,A.rarOrder,A.n,A.at=eM,hM,bm,c7,c4,j()
return true end local function eX()if A.at==0 or(j()-A.at)>120 then pcall(mr)end return A.n>0
end local function my(mz)local hR=F(mz)return A.rar[hR]or(z.name and F(z.name)==hR and z.rar)or"?"
end local function hS()local c8={}for mA,mB in pairs(e.Targets)do if mB then c8[#c8+1]=N(mA)end end
table.sort(c8)return c8 end local O={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function hT()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function c9(hU)if type(makefolder)~="function"then return end local mC,mD=pcall(isfolder,hU)
if not(mC and mD)then pcall(makefolder,hU)end end local function eY(hV)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local mE,mF=pcall(isfile,hV)if not(mE and mF)then return nil end local mG,mH=pcall(readfile,hV)
return mG and mH or nil end local function c_(mI,mJ)if type(writefile)~="function"then return false end
return(pcall(writefile,mI,mJ))end local function hW(mK)local bV={}if type(listfiles)~="function"then return bV end
local mL,hX=pcall(listfiles,mK)if not mL or type(hX)~="table"then return bV end for q2,mM in ipairs(hX)do bV[#bV+1]=tostring(mM)end
return bV end local function eZ()local da={}for q3,mN in ipairs(hW(O.cfg))do local hY=mN:match("([^/\\]+)%.txt$")
if hY then da[#da+1]=hY end end table.sort(da)return da end local function mO()local L={"V|1"}
L[#L+1]="N|Every|"..tostring(e.Every)for q4,hZ in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll"})do
L[#L+1]="B|"..hZ.."|"..(e[hZ]and"1"or"0")end local e0=r:GetAttribute("AutoRollRules")if type(e0)=="string"and e0~=""then e.ARrules,e.ARstop=e0,tostring(r:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then L[#L+1]="S|rules|"..e.ARrules L[#L+1]="S|stop|"..e.ARstop end if a.winPos then L[#L+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then L[#L+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for q5,e1 in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local db={}for mP,mQ in pairs(e1[2])do if mQ then db[#db+1]=mP end end table.sort(db)L[#L+1]=e1[1].."|-"
for q6,mR in ipairs(db)do L[#L+1]=e1[1].."|"..mR end end return table.concat(L,"\n")end
local function mS(e2)if type(e2)~="string"or e2==""then return false end local h0,h1,h2,h3={},false,{},false
for mT in e2:gmatch("[^\n]+")do local aL,ab,bn=mT:match("^(%a)|([^|]*)|?(.*)$")if aL=="N"and ab=="Every"then
local e3=tonumber(bn)if e3 and e3>=1 then e.Every=math.floor(e3)end elseif aL=="B"then if e[ab]~=nil then e[ab]=(bn=="1")end
elseif aL=="S"and ab=="rules"then e.ARrules=bn elseif aL=="S"and ab=="stop"then e.ARstop=bn
elseif aL=="W"then a.winPos={tonumber(ab)or 10,tonumber(bn)or 44}elseif aL=="G"then a.togPos={tonumber(ab)or 10,tonumber(bn)or 300}
elseif aL=="T"and ab~=""then if ab~="-"then h0[ab]=true end h1=true elseif aL=="K"and ab~=""then
if ab~="-"then h2[ab]=true end h3=true end end if h1 then e.Targets=h0 end if h3 then e.CrateTicks=h2 end
return true end local function e4(bo)if not hT()then return false,"this executor cannot write files"end
bo=(bo or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if bo==""then return false,"give the config a name"end
c9(O.dir)c9(O.cfg)if not c_(O.cfg.."/"..bo..".txt",mO())then return false,"could not write the file"end
a.config=bo return true,bo end local function h4(dc)local h5=eY(O.cfg.."/"..dc..".txt")
if not h5 then return false,"no config called "..tostring(dc)end if not mS(h5)then return false,"that config looks empty"end
a.config=dc return true,dc end local function h6(e5)if e5 then c9(O.dir)c_(O.auto,e5)elseif type(delfile)=="function"then
pcall(delfile,O.auto)else c_(O.auto,"")end a.autoload=e5 end local function e6()if a.selfPath then return a.selfPath end
local dd for q7,mU in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",O.dir})do for q8,h7 in ipairs(hW(mU))do
local e7=h7:lower()if e7:sub(-4)==".lua"and(e7:find("sab_farm",1,true)or e7:find("sab farm",1,true))then
dd=dd or h7 end end end a.selfPath=dd return dd end O.stub=[[
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
local function mV()if not hT()then return false,"this executor cannot write files"end c9("autoexec")
if not c_(O.exec,O.stub)then return false,"could not write to the autoexec folder"end local h8=e6()
return true,h8 and("it will load "..h8)or"now save this script in Delta so the loader can find it"
end local de=(function()local mW,mX=pcall(function()return game:GetService("TeleportService")end)return mW and mX or nil end)()
local function h9()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local mY=queueonteleport or queue_on_teleport local h_=e6()if not h_ then return false end
return(pcall(mY,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(h_)))
end local function df(mZ)if a.rejoining then return end a.rejoining=true f("REJOIN ("..mZ..")")
pcall(eF)if a.autoload then pcall(e4,a.autoload)end local m0=h9()f(m0 and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for q9=1,30 do if not de then break end pcall(function()de:Teleport(game.PlaceId,r)end)
task.wait(10)end end)end local function m1()local m2,ia=pcall(function()return game:GetService("GuiService")end)
if m2 and ia then pcall(function()K(ia.ErrorMessageChanged:Connect(function()if e.Rejoin then df("roblox error message")end
end))end)end pcall(function()local ib=game:GetService("CoreGui")local ic=ib and ib:WaitForChild("RobloxPromptGui",15)
local id=ic and ic:WaitForChild("promptOverlay",15)if id then K(id.ChildAdded:Connect(function(m3)
if e.Rejoin and tostring(m3 .Name):lower():find("errorprompt",1,true)then df("disconnect prompt")end
end))end end)pcall(function()K(r.OnTeleport:Connect(function(m4)if tostring(m4):find("Started")then h9()end
end))end)if de then pcall(function()K(de.TeleportInitFailed:Connect(function()a.rejoining=false
if e.Rejoin then task.delay(5,function()df("teleport retry")end)end end))end)end end local function ie(m5)
local ig=a.plot and a.plot:FindFirstChild(m5)if not ig then return nil,false end for q_,e8 in ipairs(ig:GetChildren())do
if e8:IsA("Model")or e8:IsA("BasePart")then return e8,true end end return nil,true end local function bp()
local aM=ie("RolledSquishy")if not aM then return nil end return{model=aM,name=aM.Name,pretty=bk(aM,"NameText")or N(F(aM.Name)),
rar=bk(aM,"RarityText")or my(aM.Name),price=bk(aM,"PriceText")}end local function ih(e9)
return type(e9)=="string"and(A.rar[F(e9)]~=nil or lC(e9))end local function D()local e_=ie("SquishyEquipped")
if e_ then a.carrySrc,c.heldAt="model",j()return e_.Name,e_ end local ii=r.Character if ii then
for ra,bW in ipairs(ii:GetDescendants())do if(bW:IsA("Model")or bW:IsA("Tool"))and ih(bW.Name)then
a.carrySrc,c.heldAt="character",j()return bW.Name,bW end end end local dg=r:GetAttribute("SquishyEquipped")
if type(dg)=="string"and dg~=""and ih(dg)and j()>=(a.carryBlind or 0)then a.carrySrc="attribute"
return dg,nil end a.carrySrc=nil end local function rb()local rc,m6=D()return m6 end local function ij()
local ik=bp()local fa=ik and lE(ik.price)local fb=aq()if fa and fb and fb<fa*0.5 then return fb,fa end
end local function bq(m7)a0[#a0+1]=os.date("%H:%M:%S").." "..m7 if#a0>40 then table.remove(a0,1)end
end local function m8(a4,dh)if type(a4)~="string"then return end bq(("Roll(%s,%s)"):format(a4,tostring(dh)))
if a4:lower():find("crate",1,true)then c.rolled,c.rolledAt=a4,j()return end z.seq=z.seq+1
z.name,z.at=a4,j()z.rar=type(dh)=="string"and dh or nil a.rolls=a.rolls+1 if aH(a4)then f(("ROLL %s [%s] = TARGET"):format(a4,tostring(dh)))end
end local function m9(a5)if type(a5)~="table"then return end local di=a5 .butter or a5 .itemName
if type(di)~="string"then return end a.gifts=a.gifts+1 z.gift,z.giftAt=di,j()if type(a5 .giftId)=="string"then
local il=be:FindFirstChild("Remotes")local im=il and il:FindFirstChild("GiftThanks")if im then pcall(function()im:FireServer(a5 .giftId)end)end
end bq("Gift("..di.." from "..tostring(a5 .fromName)..")")f(("GIFT from %s: %s - it will not be waxed"):format(tostring(a5 .fromName),di))
end local function m_()local io=be:WaitForChild("Remotes",30)if not a.alive then return end
if not io then f("Remotes folder missing - no roll events")return end K(r:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local ip=r:GetAttribute("SquishyEquipped")if type(ip)=="string"and ip~=""then c.heldAt=j()end
end))local nf={SquishyRollAnimation=m8,InitSquishy=function(iq)z.init,z.initAt=tostring(iq),j()bq("Init("..tostring(iq)..")")end,
CrateUpdate=function(br,ir)pcall(ma,br)pcall(o.learn,br)if type(br)=="table"then local na=ir==true or(c.rolled~=nil and j()-c.rolledAt<15)or c.waiting
if not na then return end local nb=not c.waiting local nc=c.on c.waiting,c.data,c.at=true,br,j()
c.on=(ir==true)c.title=tostring(br.title or br.name or"crate")if c.on and not nc then c.openedAt,c.byYou=j(),not c.ours
if c.onShow then task.spawn(c.onShow)end end if c.on then bq("CrateWindow open("..c.title..")")
elseif nb then bq("Crate waiting("..c.title..")")f(c.title.." is waiting on your stand")
end else if c.waiting then bq("Crate gone")end c.on,c.waiting,c.data,c.prompt=false,false,nil,nil
local nd=c.byYou c.summonFails,c.ours,c.byYou=0,false,false if c.onGone then task.spawn(c.onGone,nd)end
if c.classify then local ne=j()task.spawn(function()pcall(c.classify,ne)end)end end end,
GiftReceived=m9,}for dj,ng in pairs(nf)do local fc=io:FindFirstChild(dj)if fc and fc:IsA("RemoteEvent")then K(fc.OnClientEvent:Connect(ng))
elseif dj~="CrateUpdate"and dj~="GiftReceived"then f("remote "..dj.." missing")end end end
local function fd()local a6=bp()if a6 then if aH(a6 .name)then return{state="match",shown=a6 .pretty,src="pad",info=a6}
end return{state="skip",info=a6,level="idle",text=("on pad: %s [%s] - not ticked"):format(a6 .pretty,tostring(a6 .rar))}
end if z.name and(j()-z.at)<4 then if aH(z.name)then return{state="match",shown=N(F(z.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(N(F(z.name)),tostring(z.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function is(nh,ni,nj,nk)
local dk=RaycastParams.new()dk.FilterType=Enum.RaycastFilterType.Exclude local fe={r.Character}
for rd,nl in ipairs(nk or{})do fe[#fe+1]=nl end dk.FilterDescendantsInstances=fe pcall(function()dk.RespectCanCollide=true end)
local it=cJ:Raycast(Vector3 .new(nh,ni+4,nj),Vector3 .new(0,-30,0),dk)return it and it.Position or nil
end local function ff(iu)local iv=iu:FindFirstChildOfClass("Humanoid")return((iv and iv.HipHeight)or 2)+iu.HumanoidRootPart.Size.Y/2+0.2
end local function fg(nm,nn)local iw=nm:FindFirstChildOfClass("Humanoid")local no=j()while j()-no<nn do
if iw and iw.FloorMaterial~=Enum.Material.Air then return true end aG(0.05)end return false
end local function dl(np,fh,fi)local ix=np.HumanoidRootPart ix.AssemblyLinearVelocity=Vector3 .new(0,0,0)
ix.CFrame=fi and CFrame.new(fh,Vector3 .new(fi.X,fh.Y,fi.Z))or CFrame.new(fh)end local function dm(av,iy)
local a7=aI()if not a7 or not av then return false end local aN=av.Position local dn=math.clamp(math.max(av.Size.X,av.Size.Z)/2+2.2,3,7)
local iz=(iy and iy.MaxActivationDistance)or 10 if dn>iz-2 then dn=math.max(2.5,iz-2)end
local bX={}local function a8(bY)bY=Vector3 .new(bY.X,0,bY.Z)if bY.Magnitude>0.05 then bX[#bX+1]=bY.Unit end
end local iA=lL()if iA then a8(iA-aN)end a8(av.CFrame.LookVector)a8(-av.CFrame.LookVector)
a8(av.CFrame.RightVector)a8(-av.CFrame.RightVector)a8(a7 .HumanoidRootPart.Position-aN)
if#bX==0 then a8(Vector3 .new(0,0,1))end local nq,dp=ff(a7),false for re,nr in ipairs(bX)do
local dq=aN+nr*dn local fj=is(dq.X,aN.Y,dq.Z,{av})if fj and math.abs(fj.Y-aN.Y)<14 then
dl(a7,Vector3 .new(dq.X,fj.Y+nq,dq.Z),aN)if fg(a7,0.7)then dp=true break end end end if not dp then
dl(a7,aN+bX[1]*dn+Vector3 .new(0,3,0),aN)dp=fg(a7,1)end aG(0.12)return dp end local function ns(bZ)
if not bZ.Parent or not bZ.Enabled then return false end pcall(function()bZ:InputHoldBegin()end)
aG(math.max(bZ.HoldDuration,0)+0.08)pcall(function()bZ:InputHoldEnd()end)return true end
local function T(iB,nt)local nu=j()while j()-nu<nt do if iB()then return true end aG(0.05)
end return iB()end local function dr(bs,nv,iC,nw)local nx=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for ny,fk in ipairs(nx)do if ny==2 and(nw or not(bs.Parent and bs.Enabled and(not iC or iC())))then break end
local fl if fk=="hold"then fl=ns(bs)else fl=type(fireproximityprompt)=="function"and bs.Parent~=nil and bs.Enabled and pcall(fireproximityprompt,bs)end
if fl and T(nv,1.2)then a.zapFirst=(fk=="zap")return true,fk end end return false end local function iD(fm)
local aO=eD()if not aO or not aO.Enabled then f("buy: nothing on the pad")return false end
local iE=bM(aO)if not iE then f("buy: pad part missing")return false end a.lastBuyAt=j()
local nz,iF=z.seq,aq()dm(iE,aO)if not aO.Enabled then f("buy aborted: pad emptied")return false end
local bt=fd()if not fm and bt.state~="match"then f("buy aborted: "..(bt.text or"pad changed"))
a.matchSince=nil return false end local fn=bt.info and bt.info.name or(bt.state=="match"and z.name)or nil
local function nA()return aO.Enabled and D()==nil and(fm or fd().state=="match")end local nB,nC=dr(aO,function()
return D()~=nil or((not aO.Enabled)and(fm or z.seq==nz))end,nA,ij()~=nil)if nB then T(function()return D()~=nil end,0.8)
local b0=D()local iG=aq()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
z.name,z.rar,z.at=nil,nil,j()f(("BOUGHT %s%s via %s"):format(b0 and N(F(b0))or(bt.shown or"?"),(iF and iG)and(" for $"..an(iF-iG))or"",nC))
if b0 and fn and F(b0)~=F(fn)then f(("note: picked up %s, not %s"):format(b0,fn))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=j()+math.min(8*2^(a.cashFails-1),60)local iH=bp()
f(("BUY REFUSED: cash short? have $%s, price %s"):format(an(aq()),(iH and iH.price)or"?"))
return false end local function iI()local ds=D()if not ds then a.holding=false f("place: hands are empty")
return false end if not aH(ds)then f(("REFUSED TO WAX %s - it is not ticked"):format(N(F(ds))))
return false end for rf=1,e.PlaceTries do local aP=lO()if not aP then f("place: no free station")break end
local iJ=bM(aP)if iJ then dm(iJ,aP)local iK=D()if not iK then a.holding=false f("place: hands emptied on the way")return false end
if not aH(iK)then f("place: what I carry changed, not waxing it")return false end if aP.Enabled then
local nD,nE=dr(aP,function()return not aP.Enabled end,function()return aP.Enabled end)if nD then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=j()+2.5,0 z.name,z.rar,z.at=nil,nil,j()
f(("WAXED %s #%d at %s via %s"):format(N(F(ds)),a.placed,aP.Parent.Parent.Name,nE))return true
end end end aG(0.25)end a.placeFails=a.placeFails+1 if D()==nil then a.holding=false end
f("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,j()
a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(D()))f(a.capMsg)end return false end local function iL(iM)return type(iM)=="string"and iM:lower():find("crate",1,true)~=nil
end local nF={SABFarmGui=1,SABToggle=1,SABError=1}local function dt(nG)local aQ=nG while aQ do
if nF[aQ.Name]then return false end if aQ:IsA("ScreenGui")then local nH,nI=pcall(function()return aQ.Enabled end)
return(not nH)or nI~=false end if aQ:IsA("GuiObject")and not aQ.Visible then return false end
aQ=aQ.Parent end return false end local function bu(du)local bv=""pcall(function()if du:IsA("TextButton")then bv=du.Text end end)
if not bv:find("%a")then for rg,dv in ipairs(du:GetDescendants())do if(dv:IsA("TextLabel")or dv:IsA("TextButton"))and dv.Text:find("%a")then bv=dv.Text break end
end end if not bv:find("%a")then bv=du.Name end return(bv:lower():gsub("[^%a]",""))end local function nJ()
local b1,b2 local iN=r:FindFirstChildOfClass("PlayerGui")if not iN then return nil,nil end
for rh,b3 in ipairs(iN:GetDescendants())do if b3:IsA("GuiButton")and dt(b3)then local fo=bu(b3)
if fo:sub(1,4)=="open"and not fo:find("shop",1,true)then b1=b1 or b3 end if fo:sub(1,7)=="discard"then b2=b2 or b3 end
end end if b1 and b2 then return b1,b2 end if c.on then return b1,b2 end return nil,nil
end local dw=(function()local nK,nL=pcall(function()return game:GetService("VirtualInputManager")end)return nK and nL or nil end)()
local function iO(aw,fp)local fq={}local function iP(nM)fq[#fq+1]=nM end if a.tapWay then iP(a.tapWay)end
for ri,iQ in ipairs({"touch","conn","signal"})do if iQ~=a.tapWay then iP(iQ)end end local function iR(nN,...)
local nO,fr=pcall(getconnections,nN)if not(nO and type(fr)=="table"and#fr>0)then return false end
local iS,nP,nQ=false,{...},select("#",...)for rj,nR in ipairs(fr)do if pcall(function()nR:Fire(table.unpack(nP,1,nQ))end)then iS=true end
end return iS end local function iT()local iU=Vector3 .new(0,0,0)pcall(function()local iV,iW=aw.AbsolutePosition,aw.AbsoluteSize
iU=Vector3 .new(iV.X+iW.X/2,iV.Y+iW.Y/2,0)end)local fs={Position=iU,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()fs.UserInputType=Enum.UserInputType.Touch end)pcall(function()fs.UserInputState=Enum.UserInputState.End end)
return fs end for rk,ax in ipairs(fq)do local b4=false if ax=="conn"and type(getconnections)=="function"then
if iR(aw.MouseButton1Click)then b4=true if T(fp,1.5)then a.tapWay=ax return true,ax end
end b4=iR(aw.Activated,iT(),1)elseif ax=="signal"and type(firesignal)=="function"then if pcall(firesignal,aw.MouseButton1Click)then
if T(fp,1.5)then a.tapWay=ax return true,ax end end b4=pcall(firesignal,aw.Activated,iT(),1)
elseif ax=="touch"and dw then b4=pcall(function()local iX,iY=aw.AbsolutePosition,aw.AbsoluteSize
local iZ=0 local i0=aw:FindFirstAncestorWhichIsA("ScreenGui")local nS,nT=pcall(function()return i0 and i0 .IgnoreGuiInset end)
if not(nS and nT)then pcall(function()iZ=game:GetService("GuiService"):GetGuiInset().Y end)
end local i1,i2=iX.X+iY.X/2,iX.Y+iY.Y/2+iZ dw:SendMouseButtonEvent(i1,i2,0,true,game,1)
task.wait(0.06)dw:SendMouseButtonEvent(i1,i2,0,false,game,1)end)end if b4 and T(fp,1.5)then
a.tapWay=ax return true,ax end end return false end local nU={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function dx(i3)local b5=i3 .Parent while b5 and b5~=a.plot do if nU[b5 .Name]then return false end
b5=b5 .Parent end local ft=(i3 .ActionText or""):lower()if ft:find("roll",1,true)or ft:find("place",1,true)or ft:find("sell",1,true)then return false end
return true end local function i4()if c.prompt and c.prompt.Parent and c.prompt.Enabled then return c.prompt end
if not a.plot then return nil end local i5=a.plot:FindFirstChild("CrateStand")local b6 if i5 then
for rl,dy in ipairs(i5:GetDescendants())do if dy:IsA("ProximityPrompt")and dy.Enabled and dx(dy)then b6=dy break end
end end if not b6 then for rm,aR in ipairs(a.plot:GetDescendants())do if aR:IsA("ProximityPrompt")and aR.Enabled and dx(aR)then
local i6=aR:FindFirstAncestorWhichIsA("Model")local nV=((aR.ActionText or"").." "..(aR.ObjectText or"").." "..aR.Name.." "..(i6 and i6 .Name or"")):lower()
if nV:find("crate",1,true)then b6=aR break end end end end c.prompt=b6 return b6 end local function fu()
if c.on then return true end local b7=i4()if not b7 then c.summonFails=c.summonFails+1 c.lastFail=j()
f("crate: cannot find where to open "..c.title.." - open it once by hand, then DUMP")return false
end local i7=bM(b7)if i7 then dm(i7,b7)end c.ours=true dr(b7,function()return c.on end)
if T(function()return c.on end,3)then c.summonFails=0 return true end c.ours=false c.summonFails=c.summonFails+1
c.lastFail=j()f("crate: pressed "..ae(b7).." but no window came up")return false end do
local function nW(i8)local bw=i8 .Parent while bw and bw:IsA("GuiObject")do local i9,i_=false,false
for rn,b8 in ipairs(bw:GetDescendants())do if b8~=i8 and b8:IsA("GuiButton")and bu(b8):sub(1,7)=="discard"then i9=true end
if b8:IsA("TextLabel")then local fv=b8 .Text:lower()if fv:find("crate",1,true)or fv:find("can contain",1,true)or fv:find("cost",1,true)then i_=true end
end if i9 and i_ then return bw end end bw=bw.Parent end end function c.findWin()if c.win and c.win.Parent then return c.win end
local ja=r:FindFirstChildOfClass("PlayerGui")if not ja then return nil end for ro,dz in ipairs(ja:GetDescendants())do
if dz:IsA("GuiButton")and not dz:FindFirstAncestor("SABFarmGui")and bu(dz):sub(1,4)=="open"then
local fw=nW(dz)if fw then c.win=fw return fw end end end end local function nX(nY)for rp,dA in ipairs(nY:GetDescendants())do
if dA:IsA("GuiButton")then local jb,fx=bu(dA),dA.Name:lower()if jb=="x"or jb=="close"or fx=="x"or fx:find("close",1,true)or fx:find("exit",1,true)then return dA end
end end end c.onShow=function()c.win=nil c.findWin()end c.onGone=function(nZ)task.wait(nZ and 4 or 1.2)
if c.on or c.waiting then return end local dB=c.findWin()if not dB or not dt(dB)then return end
local jc=nX(dB)if jc and iO(jc,function()return not dt(dB)end)then return end f("the crate window is still open - tap its X")
end end local function dC(dD)if not fu()then return false end local jd=j()-(c.openedAt or 0)
if jd<0.6 then aG(0.6-jd)end local fy=c.title local n0,n1=nJ()local je=dD and n0 or n1 if not je then
c.lastFail=j()a.crateFails=a.crateFails+1 f(("crate: no %s button found in %s"):format(dD and"Open"or"Discard",fy))
return false end local n2=D()local n3,rq=iO(je,function()return(not c.on)or(D()~=nil and D()~=n2)
end)if not n3 then c.lastFail=j()a.crateFails=a.crateFails+1 f("crate: could not press "..(dD and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if dD then a.crates=a.crates+1 T(function()return D()~=nil end,1.5)
local jf=D()f(("OPENED %s -> %s"):format(fy,jf and N(F(jf))or"?"))else f("discarded "..fy.." (nothing ticked in it)")
end return true end c.calls={}function c.saw(n4,...)local n5=select("#",...)c.calls[#c.calls+1]={t=j(),m=n4,n=n5,args={...},data=c.data,
crate=c.data and c.data.name,title=c.title,rar=c.data and c.data.rarity}if#c.calls>12 then table.remove(c.calls,1)end
end function c.slot(ac,ay)local aS=type(ac)if(aS=="string"or aS=="number")and type(ay.data)=="table"then
for jg,fz in pairs(ay.data)do if fz==ac and type(jg)=="string"and(type(fz)=="string"or type(fz)=="number")then
return{__slot="f:"..jg}end end end if aS=="string"then if ay.crate and ac==ay.crate then return{__slot="crate"}end
if ay.title and ac==ay.title then return{__slot="title"}end if ay.rar and ac==ay.rar then return{__slot="rarity"}end
return ac end if aS=="number"or aS=="boolean"or aS=="nil"then return ac end if aS=="table"then
local jh={}for n6,ji in pairs(ac)do if type(ji)=="table"then return nil,"nested table"end
local n7,jj=c.slot(ji,ay)if jj then return nil,jj end jh[n6]=n7 end return jh end local n8,n9=pcall(function()return ac:IsA("Instance")end)
if n8 and n9 then if ac==r then return{__slot="player"}end if a.plot and ac==a.plot then return{__slot="plot"}end
local dE=a.plot and a.plot:FindFirstChild("CrateStand")if dE and ac==dE then return{__slot="stand"}end
if dE and ac.Parent==dE then return{__slot="model"}end end return nil,"a value it cannot rebuild ("..aS..")"
end function c.resolve(dF)if type(dF)~="table"then return dF end local ai=dF.__slot if ai and ai:sub(1,2)=="f:"then return c.data and c.data[ai:sub(3)]end
if ai=="crate"then return c.data and c.data.name end if ai=="title"then return(c.data and c.data.title)or c.title end
if ai=="rarity"then return c.data and c.data.rarity end if ai=="player"then return r end
if ai=="plot"then return a.plot end if ai=="stand"or ai=="model"then local fA=a.plot and a.plot:FindFirstChild("CrateStand")
if ai=="stand"or not fA then return fA end for rr,jk in ipairs(fA:GetChildren())do if iL(jk.Name)then return jk end end
return nil end local jl={}for n_,oa in pairs(dF)do jl[n_]=c.resolve(oa)end return jl end
function c.classify(fB)if c.directOff then return end local dG={}for rs,fC in ipairs(c.calls)do
if fC.t<=fB+0.05 and fB-fC.t<=6 then dG[#dG+1]=fC end end if#dG==0 then return end if not T(function()return(c.heldAt or 0)>=fB-1 end,2.5)then return end
local b9={}for rt,b_ in ipairs(dG)do local jm={}for jn=1,b_.n do local ob,jo=c.slot(b_.args[jn],b_)
if jo then f("crate call has "..jo.." - keeping the button method")return end jm[jn]=ob
end b9[#b9+1]={m=b_.m,n=b_.n,args=jm}end local fD=c.learned c.learned={seq=b9,mode=fD and fD.mode or nil}
C.dirty=true if not fD then f(("learned how to open crates directly (%d call%s)"):format(#b9,#b9==1 and""or"s"))end
end function c.replay()local jp=c.learned local jq=be:FindFirstChild("Remotes")local fE=jq and jq:FindFirstChild("CrateAction")
if not(jp and fE)then return false end local jr=table.unpack or unpack c.replaying=true
for ru,ca in ipairs(jp.seq)do local fF={}for js=1,ca.n do fF[js]=c.resolve(ca.args[js])end
task.spawn(function()pcall(function()if ca.m=="InvokeServer"then fE:InvokeServer(jr(fF,1,ca.n))
else fE:FireServer(jr(fF,1,ca.n))end end)end)task.wait(0.2)end c.replaying=false return true
end function c.esc(oc)return(oc:gsub("[%%|;=,\n]",function(od)return("%%%02X"):format(od:byte())end))end
function c.enc(a9)local dH=type(a9)if dH=="string"then return"s"..c.esc(a9)end if dH=="number"then return"n"..tostring(a9)end
if dH=="boolean"then return a9 and"b1"or"b0"end if dH=="nil"then return"z"end if a9 .__slot then return"k"..a9 .__slot end
local fG={}for oe,of in pairs(a9)do fG[#fG+1]=c.enc(oe).."="..c.enc(of)end return"t"..table.concat(fG,",")
end function c.dec(jt)local cb,cc=jt:sub(1,1),jt:sub(2)local function og(oh)return(oh:gsub("%%(%x%x)",function(oi)return string.char(tonumber(oi,16))end))end
if cb=="s"then return og(cc)end if cb=="n"then return tonumber(cc)end if cb=="b"then return cc=="1"end
if cb=="k"then return{__slot=cc}end if cb=="t"then local ju={}for oj in cc:gmatch("[^,]+")do
local jv,ol=oj:match("^(.-)=(.*)$")if jv then local jw=c.dec(jv)if jw~=nil then ju[jw]=c.dec(ol)end
end end return ju end return nil end function c.goneOrNew(om)return function()if not c.waiting then return true end
local jx=D()return jx~=nil and jx~=om end end function c.smart()local fH=c.title local a_=c.learned
if a_ then local fI=D()if c.on then c.replay()if T(c.goneOrNew(fI),3.5)then a.crates=a.crates+1
f("OPENED "..fH.." (direct)")return true end else if a_.mode~="window"then c.replay()if T(c.goneOrNew(fI),3.5)then
a.crates,c.fails=a.crates+1,0 if a_.mode~="direct"then a_.mode,C.dirty="direct",true f("crates now open directly - the window never comes up")
end f("OPENED "..fH.." (direct, no window)")return true end end if fu()then c.replay()if T(c.goneOrNew(fI),3.5)then
a.crates,c.fails=a.crates+1,0 if a_.mode~="window"then a_.mode,C.dirty="window",true f("crates need their window up first - it shows briefly")
end f("OPENED "..fH.." (direct, window up)")return true end end end c.fails=(c.fails or 0)+1
c.lastBad,c.learned,C.dirty=a_,nil,true if c.fails>=3 then c.directOff=true f("direct crate opening failed 3 times - using the button for now (see DUMP)")
else f("the learned crate call did not work - back to pressing Open")end end return dC(true)
end function g.snap()return{rules=r:GetAttribute("AutoRollRules"),stop=r:GetAttribute("AutoRollStop"),
on=r:GetAttribute("AutoRollOn"),main=r:GetAttribute("AutoRoll")}end function g.isOn()return r:GetAttribute("AutoRollOn")==true end
function g.saw(oo,...)local op={m=oo,n=select("#",...),args={...},before=g.snap()}task.delay(1.5,function()
if a.alive then pcall(g.learnOne,op)end end)end function g.learnOne(cd)local P,ce=g.snap(),cd.before
local dI=(P.rules~=ce.rules)or(P.stop~=ce.stop)local jy=(P.on~=ce.on)or(P.main~=ce.main)
if not dI and not jy then return end local jz={}for jA=1,cd.n do local af=cd.args[jA]local ba=type(af)
if ba=="string"and af~=""and af==P.rules then af={__slot="rules"}elseif ba=="string"and af~=""and dI and af==P.stop and P.stop~=ce.stop then af={__slot="stop"}
elseif ba=="table"then local jB={}for oq,bx in pairs(af)do if type(bx)=="table"or(type(bx)=="userdata")then
g.msg="Auto Roll sends something I cannot repeat"return end jB[oq]=(type(bx)=="string"and bx~=""and bx==P.rules)and{__slot="rules"}or bx
end af=jB elseif ba~="string"and ba~="number"and ba~="boolean"and ba~="nil"then if af==r then af={__slot="player"}else g.msg="Auto Roll sends something I cannot repeat"return end
end jz[jA]=af end local by={m=cd.m,n=cd.n,args=jz}if dI then local fJ=false for ot=1,by.n do
local cf=by.args[ot]if type(cf)=="table"and cf.__slot=="rules"then fJ=true end if type(cf)=="table"and not cf.__slot then
for rv,jC in pairs(cf)do if type(jC)=="table"and jC.__slot=="rules"then fJ=true end end
end end if fJ then g.rec.rules={by}else table.insert(g.rec.rules,by)if#g.rec.rules>60 then table.remove(g.rec.rules,1)end
end end if jy then if P.on==true then g.rec.on=by else g.rec.off=by end e.AutoRoll=(P.on==true)
end if P.rules and P.rules~=""then e.ARrules,e.ARstop=P.rules,P.stop or""end C.dirty=true
g.msg=""f(("learned an Auto Roll %s message"):format(dI and"choices"or(P.on and"on"or"off")))
end function g.resolve(bz)if type(bz)~="table"then return bz end if bz.__slot=="rules"then return e.ARrules~=""and e.ARrules or r:GetAttribute("AutoRollRules")end
if bz.__slot=="stop"then return e.ARstop~=""and e.ARstop or r:GetAttribute("AutoRollStop")end
if bz.__slot=="player"then return r end local jD={}for ou,ov in pairs(bz)do jD[ou]=g.resolve(ov)end
return jD end function g.replay(jE,ow)local jF=table.unpack or unpack for rw,cg in ipairs(ow)do
local fK={}for jG=1,cg.n do fK[jG]=g.resolve(cg.args[jG])end g.replaying=true pcall(function()
if cg.m=="InvokeServer"then task.spawn(function()pcall(function()jE:InvokeServer(jF(fK,1,cg.n))end)end)
else jE:FireServer(jF(fK,1,cg.n))end end)g.replaying=false task.wait(0.25)end end function g.apply(jH,ox)
if g.busy or not a.alive then return end g.busy=true pcall(function()local jI=be:FindFirstChild("Remotes")
local fL=jI and jI:FindFirstChild("AutoRollAction")if not fL then g.msg="this game has no AutoRollAction"return end
local aT=e.AutoRoll if aT and e.ARrules~=""and r:GetAttribute("AutoRollRules")~=e.ARrules then
if#g.rec.rules==0 then g.msg="pick your Auto Roll choices once in the game's menu so I can learn them"
else g.replay(fL,g.rec.rules)if T(function()return r:GetAttribute("AutoRollRules")==e.ARrules end,4)then
f("Auto Roll choices put back")else g.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"
f(g.msg)end end end if aT==g.isOn()or(not aT and not ox)then return end local dJ=aT and g.rec.on or g.rec.off
if not dJ then local ci=aT and g.rec.off or g.rec.on local jJ=ci~=nil for oy=1,ci and ci.n or 0 do
if type(ci.args[oy])=="boolean"then jJ=false end end if jJ then dJ=ci end end if not dJ then
g.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(aT and"on"or"off")
return end g.replay(fL,{dJ})if T(function()return g.isOn()==aT end,4)then g.msg=""f(("Auto Roll switched %s%s"):format(aT and"ON"or"OFF",jH and(" ("..jH..")")or""))
else g.msg="Auto Roll did not switch - do it once in the game so I can relearn it"f(g.msg)
end end)g.busy=false end local oz={"sell","trash","discard","dispose","bin"}local function fM(dK)
if type(dK)~="string"then return false end dK=dK:lower()for rx,oA in ipairs(oz)do if dK:find(oA,1,true)then return true end end
return false end local function oB()local jK=be:FindFirstChild("Remotes")local fN=jK and jK:FindFirstChild("SellSquishy")
if not(fN and fN:IsA("RemoteEvent"))then return false end if not pcall(function()fN:FireServer()end)then return false end
return T(function()return D()==nil end,1.5)end local function oC()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if j()-a.sellSearchAt<20 then return nil end a.sellSearchAt=j()local jL=aI()local jM=jL and jL.HumanoidRootPart.Position
local cj,jN for ry,bA in ipairs((a.plot or cJ):GetDescendants())do if bA:IsA("ProximityPrompt")and(fM(bA.ActionText)or fM(bA.ObjectText)or fM(bA.Name))then
local jO=g_(bA)local fO=(jO and jM)and(jO-jM).Magnitude or 1e9 if fO<=400 and(not cj or fO<jN)then cj,jN=bA,fO end
end end a.sellSpot=cj a.noSellSpot=(cj==nil)return cj end local function jP()local fP=D()
if not fP then a.holding=false return false end if aH(fP)then return false end local fQ=N(F(fP))
if oB()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=j()+2.5,0
f("SOLD "..fQ)return true end local bB=oC()if bB then local jQ=bM(bB)if jQ then dm(jQ,bB)
local jR=D()if jR and not aH(jR)then local oD,oE=dr(bB,function()return D()==nil end,function()return bB.Enabled end)
if oD then a.sold,a.holding,a.sellFails=a.sold+1,false,0 f(("SOLD %s at %s via %s"):format(fQ,ae(bB),oE))
return true end end end end a.sellFails=a.sellFails+1 f("could not sell "..fQ.." ("..a.sellFails..")")
return false end local oF={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function oG(bC)local dL=ae(bC):lower()for rz,oH in ipairs(oF)do if dL:find(oH,1,true)then return 0 end end
local ap,I=bC.Name:lower(),0 local function aj(oI,oJ)return oI:find(oJ,1,true)~=nil end
if aj(ap,"collect")then I=I+60 end if aj(ap,"cash")or aj(ap,"money")then I=I+45 end if aj(ap,"income")or aj(ap,"claim")then I=I+35 end
if aj(ap,"coin")or aj(ap,"earn")or aj(ap,"green")then I=I+20 end if ap=="pad"or ap=="touch"then I=I+25 end
if I==0 and(aj(dL,"collect")or aj(dL,"cash")or aj(dL,"money"))then I=25 end if I==0 then return 0 end
local ck=bC.Color if ck.G>0.5 and ck.G>ck.R*1.4 and ck.G>ck.B*1.4 then I=I+15 end if math.min(bC.Size.X,bC.Size.Y,bC.Size.Z)<2 then I=I+5 end
return I end local function oK()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or j()-a.padSearchAt<20 then return nil end a.padSearchAt=j()local dM,cl,fR={},nil,29
for rA,dN in ipairs(a.plot:GetDescendants())do if dN:IsA("BasePart")then local dO=oG(dN)
if dO>0 then dM[#dM+1]={s=dO,p=dN}if dO>fR then cl,fR=dN,dO end end end end table.sort(dM,function(oL,oM)return oL.s>oM.s end)
a.padCands,a.padPart=dM,cl if cl then f("collect pad: "..ae(cl).." (score "..fR..")")end
return cl end local fS="SAB_pad_v1.txt"local function oN(oO)if type(writefile)=="function"then pcall(writefile,fS,table.concat({oO:GetComponents()},","))end
end local function oP()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local oQ,jS=pcall(function()if isfile(fS)then return readfile(fS)end end)if not oQ or type(jS)~="string"then return nil end
local dP={}for oR in jS:gmatch("[^,]+")do dP[#dP+1]=tonumber(oR)end if#dP==12 then return CFrame.new(unpack(dP))end
end local function oS(fT,dQ,oT)local oU=ff(fT)local fU=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local ak=(fU and fU:IsA("BasePart"))and(fU.Position-dQ)or Vector3 .new(1,0,0)ak=Vector3 .new(ak.X,0,ak.Z)
if ak.Magnitude<0.05 then ak=Vector3 .new(1,0,0)end ak=ak.Unit for oV=0,7 do local dR=oV*math.pi/4
local oW=Vector3 .new(ak.X*math.cos(dR)-ak.Z*math.sin(dR),0,ak.X*math.sin(dR)+ak.Z*math.cos(dR))
local dS=dQ+oW*(oT+5)local fV=is(dS.X,dQ.Y,dS.Z)if fV and math.abs(fV.Y-dQ.Y)<8 then dl(fT,Vector3 .new(dS.X,fV.Y+oU,dS.Z))
if fg(fT,0.7)then return true end end end return false end local function oX()a.lastCollect=j()
local cm=aI()if not cm then return end local jT,oY=cm.HumanoidRootPart,ff(cm)local cn,jU,co,fW=nil,4,nil,"?"
local fX=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and fX and fX:IsA("BasePart")then
cn,fW=(fX.CFrame*a.manualPad).Position,"manual pad"else local az=oK()if az then cn=Vector3 .new(az.Position.X,az.Position.Y+az.Size.Y/2+oY,az.Position.Z)
jU,co,fW=math.max(az.Size.X,az.Size.Z)/2,az,az.Name end end if not cn then f("COLLECT: pad not found - stand on it and tap SET PAD")return end
local fY=aq()dl(cm,cn)if co and type(firetouchinterest)=="function"then pcall(firetouchinterest,jT,co,0)end
aG(e.PadDwell)if co and type(firetouchinterest)=="function"then pcall(firetouchinterest,jT,co,1)end
aG(0.5)a.collected=a.collected+1 local fZ=aq()f(("COLLECTED (%s) %s"):format(fW,(fY and fZ and fZ>fY)and("+$"..an(fZ-fY))or"no cash change seen"))
oS(cm,cn,jU)end local cp local function jV()if a.capHit then if e.AutoStart and j()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 f("trying again after being stopped for 5 minutes")cp(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not aI()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aJ(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local f0,jW=ex()local dT=D()if dT then local cq=N(F(dT))if not aH(dT)then local f1=(z.gift and F(z.gift)==F(dT)and j()-z.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cq,f1),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cq,f1),"bad"
end return"sell",("selling %s (%s)"):format(cq,f1),"warn"end if f0<1 then return nil,("holding %s - 0 free stations"):format(cq),"wait"end
return"place",("waxing %s (%d free)"):format(cq,f0),"ok"end a.holding=false if e.Crates and not c.waiting and j()-(c.scanAt or 0)>1 then
c.scanAt=j()local f2=a.plot:FindFirstChild("CrateStand")if f2 then for rB,cr in ipairs(f2:GetDescendants())do
if cr:IsA("ProximityPrompt")and cr.Enabled and dx(cr)then local aA=cr.ObjectText if aA==""then aA=bk(f2,"TitleLabel")or""end
if aA~=""and o.wanted(aA)then local oZ=cM(aA):gsub("crate$","")local jX for jY in pairs(A.members)do if cM(jY)==oZ then jX=jY end end
c.waiting,c.at,c.title,c.prompt=true,j(),aA,cr c.data={name=(aA:gsub("%s","")),rarity=jX,title=aA}
f(aA.." found waiting on your stand")end break end end end end local jZ=o.wanted(c.data and c.data.name)or o.wanted(c.title)
if e.Crates and(c.on or c.waiting)and jZ then local aB=c.title if j()<(c.ignoreUntil or 0)then
return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aB),"bad"
end if c.on then if a.crateFails>=3 then c.ignoreUntil,a.crateFails=j()+120,0 f("could not press the "..aB.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aB),"bad"end if j()-c.lastFail<8 then
return nil,("%s window open - could not press its buttons"):format(aB),"bad"end if c.byYou and j()-c.openedAt<60 then
return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(aB,math.ceil(60-(j()-c.openedAt))),"idle"
end return"cratesmart",("opening %s"):format(aB),"ok"end if c.summonFails>=3 then return nil,("%s waiting - could not open it, open it by hand then DUMP"):format(aB),"bad"
end if j()-c.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aB),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aB,(c.learned and c.learned.mode~="window")and" directly"or""),"ok"
end if(c.on or c.waiting)and not jZ then local j0=c.title..tostring(c.rolledAt)if c.told~=j0 then
c.told=j0 f(c.title.." is not ticked - leaving it to the game")end end if c.rolled and not c.waiting and j()-c.rolledAt<6 and o.wanted(c.rolled)then
return nil,c.rolled.." rolled - waiting for it to land","wait"end if f0<1 then a.matchSince=nil
return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(jW,jW),"wait"end local f3=eD()
if not f3 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local cs=bp()
if cs and iL(cs.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(cs.name),"idle"end
if j()-c.lastFail<8 then return nil,("%s on the pad - could not open it"):format(cs.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(cs.name),"ok"end local aU=fd()
if aU.state~="match"then a.matchSince=nil if aU.state=="skip"and not f3 .Enabled then return nil,aU.text.." (sold out)","idle"end
return nil,aU.text,aU.level end if not f3 .Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local ct=j()if ct<a.noCashUntil then local j1,o0=ij()if j1 then return nil,("cash short: have $%s, price ~$%s"):format(an(j1),an(o0)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(an(aq()),math.ceil(a.noCashUntil-ct)),"bad"
end if ct-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or ct
local j2=ct-a.matchSince if j2<e.Confirm then return nil,("confirming %s (%.2fs)"):format(aU.shown,j2),"ok"end
return"buy",("buying %s via %s"):format(aU.shown,aU.src),"ok"end local function ag(o1,o2,...)
if a.busy then return end a.busy,a.busyText=true,o1 local o3,j3=pcall(o2,...)a.busy,a.busyText=false,""
if not o3 and j3~=ej then f("ERR "..tostring(j3))end end local function o4()local bb,o5,o6=jV()
a.reason,a.level=o5,o6 if bb=="place"then ag("waxing...",iI)elseif bb=="crate"then ag("opening crate...",dC,true)
elseif bb=="cratesmart"then ag("opening crate...",c.smart)elseif bb=="cratewin"then ag("opening the crate window...",fu)
elseif bb=="nocrate"then ag("discarding crate...",dC,false)elseif bb=="sell"then ag("selling...",jP)
elseif bb=="buy"then ag("buying...",iD,false)elseif e.Collect and not a.matchSince and j()-a.lastCollect>=e.Every then
ag("collecting money...",oX)end end function cp(dU,o7)if dU==a.running then return end a.running=dU
if not o7 then e.AutoStart=dU end if dU then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
c.lastFail,c.summonFails,c.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=j()
a.plot=aJ()or a.plot f("START")else a.reason="stopped"f("STOP")end end local function f4()
local f5={}local function l(o8)f5[#f5+1]=tostring(o8)end l("=== SAB "..aZ.." DUMP "..os.date("%H:%M:%S").." ===")
l(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
l("reason: "..tostring(a.reason))l("targets: "..table.concat(hS(),", "))l(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
l("cash="..an(aq()))local o9,j4=D()l("in hands: "..tostring(o9)..(j4 and(" ("..j4 .ClassName..")")or"")..
"  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-j())))
l("  attribute SquishyEquipped = "..tostring(r:GetAttribute("SquishyEquipped")))local j5=a.plot and a.plot:FindFirstChild("SquishyEquipped")
l("  plot.SquishyEquipped = "..(j5 and(#j5:GetChildren().." children")or"missing"))local f6=r.Character
if f6 then local f7={}for rC,cu in ipairs(f6:GetDescendants())do if(cu:IsA("Model")or cu:IsA("Tool"))and cu.Name~=f6 .Name then f7[#f7+1]=cu.ClassName..":"..cu.Name end
end l("  on the character: "..(table.concat(f7,", "):sub(1,300)))end local dV=bp()l("on pad: "..(dV and("%s [%s] %s"):format(dV.name,tostring(dV.rar),tostring(dV.price))or"nothing"))
l("sell spot: "..(a.sellSpot and ae(a.sellSpot)or"none found"))l("--- CRATES ---")l(("waiting=%s windowOpen=%s title=%s rolled=%s (%ss ago) opened=%d tapWay=%s fails=%d/%d"):format(
tostring(c.waiting),tostring(c.on),c.title,tostring(c.rolled),c.rolledAt>0 and string.format("%.0f",j()-c.rolledAt)or"-",
a.crates,tostring(a.tapWay),a.crateFails,c.summonFails))l("--- AUTO ROLL ---")local dW=g.snap()
l(("game: AutoRollOn=%s AutoRoll=%s stop=%s rules=%s"):format(tostring(dW.on),tostring(dW.main),
tostring(dW.stop),tostring(dW.rules)))l(("wanted: %s  choices to put back: %s (stop %s)  note: %s"):format(tostring(e.AutoRoll),
e.ARrules~=""and e.ARrules or"-",e.ARstop~=""and e.ARstop or"-",g.msg~=""and g.msg or"-"))
local function f8(f9)local j6={}for j7=1,f9 .n do local dX=f9 .args[j7]j6[j7]=type(dX)=="table"and(dX.__slot and("<"..dX.__slot..">")or"{table}")or("%q"):format(tostring(dX))
end return("AutoRollAction:%s(%s)"):format(f9 .m,table.concat(j6,", "))end for o_,pa in ipairs(g.rec.rules)do l(("  choices %d: %s"):format(o_,f8(pa)))end
if g.rec.on then l("  on:  "..f8(g.rec.on))end if g.rec.off then l("  off: "..f8(g.rec.off))end
if#g.rec.rules==0 and not g.rec.on and not g.rec.off then l("  nothing learned yet")end
l("--- CRATE OPENING ---")local function dY(aV,dZ)dZ=dZ or 0 local j8=type(aV)if j8=="string"then return("%q"):format(aV)end
if j8=="table"then if aV.__slot then return"<"..aV.__slot..">"end if dZ>1 then return"{...}"end
local f_={}for pb,pc in pairs(aV)do f_[#f_+1]=tostring(pb).."="..dY(pc,dZ+1)end return"{"..table.concat(f_,",").."}"
end local pd,j9=pcall(function()return aV.ClassName end)if pd and j9 then return"<"..j9 .." "..ae(aV)..">"end
return tostring(aV)end l("watching CrateAction: "..tostring(c.oldNC~=nil).."  hookmetamethod="..type(hookmetamethod))
if c.learned then l("learned (mode "..tostring(c.learned.mode or"untried").."):")for pe,ga in ipairs(c.learned.seq)do
local j_={}for ka=1,ga.n do j_[ka]=dY(ga.args[ka])end l(("  %d. CrateAction:%s(%s)"):format(pe,ga.m,table.concat(j_,", ")))
end else l("not learned yet - it learns from the next crate that opens")end if c.directOff then l("direct opening is OFF for this session after 3 failures")end
if c.lastBad then l("last call that failed:")for pf,gb in ipairs(c.lastBad.seq)do local kb={}
for kc=1,gb.n do kb[kc]=dY(gb.args[kc])end l(("  %d. CrateAction:%s(%s)"):format(pf,gb.m,table.concat(kb,", ")))
end end l("CrateAction calls seen:")for rD,cv in ipairs(c.calls or{})do local kd={}for ke=1,cv.n do kd[ke]=dY(cv.args[ke])end
l(("  %.0fs ago  %s(%s)  [crate=%s]"):format(j()-cv.t,cv.m,table.concat(kd,", "),tostring(cv.crate)))
end local bD=c.findWin()if bD and type(getconnections)=="function"then l("how the game wired its crate window buttons (handler counts):")
for rE,cw in ipairs(bD:GetDescendants())do if cw:IsA("GuiButton")then local gc={}for rF,kf in ipairs({"MouseButton1Click","MouseButton1Down","MouseButton1Up","Activated",
"InputBegan","InputEnded","TouchTap"})do local pg,kg=pcall(function()return getconnections(cw[kf])end)
local kh=(pg and type(kg)=="table")and#kg or-1 if kh~=0 then gc[#gc+1]=kf.."="..kh end end
l(("  %s %s %q: %s"):format(cw.ClassName,cw.Name,bu(cw),table.concat(gc," ")))end end end
l(("crate window: %s visible=%s mine=%s yours=%s"):format(bD and ae(bD)or"not found",tostring(bD and bD.Visible),tostring(c.ours),tostring(c.byYou)))
local d0=i4()l("crate prompt: "..(d0 and(ae(d0).." ["..d0 .ActionText.."|"..d0 .ObjectText.."]")or"none found"))
local ki=a.plot and a.plot:FindFirstChild("CrateStand")if ki then local gd=0 for rG,bc in ipairs(ki:GetDescendants())do
gd=gd+1 if gd>30 then l("  ...")break end local kj=""if bc:IsA("ProximityPrompt")then kj=(" [%s|%s|on=%s|hold=%.2f]"):format(bc.ActionText,bc.ObjectText,tostring(bc.Enabled),bc.HoldDuration)end
l("  CrateStand/"..ae(bc):gsub("^.-CrateStand%.","").." ("..bc.ClassName..")"..kj)end else
l("  no CrateStand in the plot")end l("enabled prompts in the plot:")if a.plot then for rH,bE in ipairs(a.plot:GetDescendants())do
if bE:IsA("ProximityPrompt")and bE.Enabled then l(("  %s [%s|%s] safe=%s"):format(ae(bE),bE.ActionText,bE.ObjectText,tostring(dx(bE))))
end end end local kk=r:FindFirstChildOfClass("PlayerGui")if kk then l("buttons on screen that say open/discard:")
for rI,cx in ipairs(kk:GetDescendants())do if cx:IsA("GuiButton")and dt(cx)then local ge=bu(cx)
if ge:find("open",1,true)or ge:find("discard",1,true)then l(("  %s %s -> %q"):format(cx.ClassName,ae(cx),ge))
end end end end l("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(dw~=nil))
l("--- CATALOG ("..A.n.." butters, worst rarity first) ---")for rJ,d1 in ipairs(A.rarOrder)do
local gf={}for rK,kl in ipairs(A.members[d1]or{})do gf[#gf+1]=(e.Targets[kl]and"*"or"")..N(kl)
end l(("  [%s]%s %s"):format(d1,C.price[d1]and(" crate $"..an(C.price[d1]))or"",table.concat(gf,", ")))
end l("learned orders: ")for ph,pj in pairs(C.order)do l("  "..ph..": "..table.concat(pj,", "))end
l("--- PLOT ---")l("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for rL,gg in ipairs(a.plot:GetChildren())do
l(("  %s %s (%d)"):format(gg.ClassName,gg.Name,#gg:GetChildren()))end local pk,pl=ex()l(("stations free %d / %d"):format(pk,pl))
local gh=eD()l("BuyPrompt: "..(gh and("enabled="..tostring(gh.Enabled).." hold="..gh.HoldDuration)or"MISSING"))
end l("autostart="..tostring(e.AutoStart).." rejoin="..tostring(e.Rejoin))l(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))l("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#eZ())l("--- COLLECT PAD ---")
l("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and ae(a.padPart)or"none"))
l("--- ATTRIBUTES ---")for rM,km in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
l(("  %s = %s"):format(km,tostring(r:GetAttribute(km))))end l("--- EVENTS ---")for pm=math.max(1,#a0-15),#a0 do l("  "..a0[pm])end
l("--- LOG ---")for pn=math.max(1,#aF-25),#aF do l("  "..aF[pn])end return table.concat(f5,"\n")
end do local aW=eY(O.auto)if type(aW)=="string"then aW=aW:gsub("%s+$","")if aW~=""then a.autoload=aW
local po=h4(aW)f(po and("loaded config "..aW)or("config "..aW.." could not be loaded"))
end end end local d={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local pp={ok=d.good,wait=d.warn,warn=d.warn,bad=d.bad,idle=d.dim}
local kn={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function x(pq,pr,ps)
local pt,gi=pcall(Instance.new,pq)if not pt then a.uiErrs=a.uiErrs+1 return nil end for pu,pv in pairs(pr)do
if not pcall(function()gi[pu]=pv end)then a.uiErrs=a.uiErrs+1 end end gi.Parent=ps return gi
end local function Q(pw,px)x("UICorner",{CornerRadius=UDim.new(0,px or 6)},pw)end local b={}
local gj=r:FindFirstChildOfClass("PlayerGui")or r:WaitForChild("PlayerGui")local ko=gj:FindFirstChild("SABFarmGui")
if ko then ko:Destroy()end local gk=x("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},gj)
local J={w=320,h=330,head=30,strip=38,tabs=26}b.root=x("Frame",{Name="Root",Size=UDim2 .new(0,J.w,0,J.h),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=d.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},gk)
Q(b.root,10)x("UIStroke",{Color=d.line,Thickness=1},b.root)local bd=UDim2 .new(1,0,1,0)
local function u(kp,kq)return UDim2 .new(kp,0,0,0),UDim2 .new(kq,(kp+kq>0.99)and 0 or-4,1,0)end
local function v(py,pz,pA,pB,pC,pD)local kr=x("TextButton",{Text=pz,Position=pC,Size=pD,BackgroundColor3=pA,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=pB,TextColor3=d.text,AutoButtonColor=true},py)Q(kr,6)
return kr end local function ks(pE,pF,pG,pH,pI)local gl=x("TextBox",{Text=pF,PlaceholderText=pG,Position=pH,Size=pI,BackgroundColor3=d.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=d.text,PlaceholderColor3=d.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},pE)Q(gl,6)x("UIPadding",{PaddingLeft=UDim.new(0,8)},gl)
return gl end local d2=cJ.CurrentCamera local function pJ()local pK,d3=pcall(function()return d2 and d2 .ViewportSize end)
if pK and d3 and d3 .X>50 and d3 .Y>50 then return d3 end end local function aX(cy)local gm=pJ()
if not(gm and cy and cy.Parent)then return end local pL=pcall(function()local d4,kt=cy.AbsolutePosition,cy.AbsoluteSize
local gn=70 local ku=math.clamp(d4 .X,gn-kt.X,gm.X-gn)local kv=math.clamp(d4 .Y,0,gm.Y-math.min(kt.Y,gn))
if math.abs(ku-d4 .X)>0.5 or math.abs(kv-d4 .Y)>0.5 then cy.Position=UDim2 .new(0,math.floor(ku),0,math.floor(kv))
end end)return pL end local function d5(pM)local pN,go=pcall(function()return pM.AbsolutePosition end)
if pN and go then return{math.floor(go.X),math.floor(go.Y)}end end local d6={}local function kw(d7,kx,ky)
K(d7 .InputBegan:Connect(function(cz)if cz.UserInputType~=Enum.UserInputType.MouseButton1 and cz.UserInputType~=Enum.UserInputType.Touch then return end
d6[d7]={start=cz.Position,from=kx.Position,moved=0,target=kx}local gp gp=cz.Changed:Connect(function()
if cz.UserInputState==Enum.UserInputState.End then local kz=d6[d7]d6[d7]=nil if gp then gp:Disconnect()end
if kz and ky then ky(kz.moved)end end end)end))end K(lx.InputChanged:Connect(function(d8)
if d8 .UserInputType~=Enum.UserInputType.MouseMovement and d8 .UserInputType~=Enum.UserInputType.Touch then return end
for rN,aC in pairs(d6)do local gq=aC.target if gq and gq.Parent then local kA,kB=d8 .Position.X-aC.start.X,d8 .Position.Y-aC.start.Y
aC.moved=math.max(aC.moved,math.abs(kA)+math.abs(kB))gq.Position=UDim2 .new(aC.from.X.Scale,aC.from.X.Offset+kA,aC.from.Y.Scale,aC.from.Y.Offset+kB)
end end end))local function E(pO,pP,pQ,pR,pS,pT,pU)return x("TextLabel",{Text=pP,Position=pT or UDim2 .new(0,0,0,0),Size=pU or bd,BackgroundTransparency=1,
Font=pS and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=pQ,TextColor3=pR,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},pO)
end b.title=x("Frame",{Size=UDim2 .new(1,0,0,J.head),BackgroundColor3=d.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=x("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=d.dim,BorderSizePixel=0},b.title)
Q(b.dot,5)E(b.title,"SAB  BUTTER FARM  "..aZ,12,d.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=v(b.title,"-",d.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=v(b.title,"X",d.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=x("Frame",{Position=UDim2 .new(0,0,0,J.head),Size=UDim2 .new(1,0,0,J.strip),BackgroundColor3=d.bg,BorderSizePixel=0},b.root)
b.bar=x("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=d.warn,BorderSizePixel=0},b.strip)
Q(b.bar,2)b.reason=E(b.strip,"starting",12,d.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=x("Frame",{Position=UDim2 .new(0,0,0,J.head+J.strip),Size=UDim2 .new(1,0,0,J.tabs),BackgroundTransparency=1},b.root)
b.tabFarm=v(b.tabs,"FARM",d.accent,10,UDim2 .new(0,8,0,0),UDim2 .new(0.25,-9,1,-4))b.tabBut=v(b.tabs,"BUTTERS",d.panel2,10,UDim2 .new(0.25,2,0,0),UDim2 .new(0.25,-4,1,-4))
b.tabCrt=v(b.tabs,"CRATES",d.panel2,10,UDim2 .new(0.5,2,0,0),UDim2 .new(0.25,-4,1,-4))b.tabSet=v(b.tabs,"SETUP",d.panel2,10,UDim2 .new(0.75,2,0,0),UDim2 .new(0.25,-10,1,-4))
local function d9()local gr=x("ScrollingFrame",{Position=UDim2 .new(0,0,0,J.head+J.strip+J.tabs),Size=UDim2 .new(1,0,1,-(J.head+J.strip+J.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=d.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)x("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},gr)
x("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},gr)
return gr end b.farm,b.but,b.set,b.crt=d9(),d9(),d9(),d9()b.but.Visible,b.set.Visible,b.crt.Visible=false,false,false
local d_,cA,q=0,12,nil local function V(kC,pV)d_,cA=d_+1,cA+kC+6 return x("Frame",{Size=UDim2 .new(1,0,0,kC),BackgroundTransparency=1,LayoutOrder=d_},pV or b.farm)
end local function bF(pW)E(V(14),pW,10,d.dim,true)end q=V(34)b.startB=v(q,"START",d.good,14,u(0,0.68))
b.killB=v(q,"KILL",d.bad,14,u(0.68,0.32))local pX=V(42)local function cB(kD,pY,gs)local gt=x("Frame",{Position=UDim2 .new((kD-1)/gs,0,0,0),Size=UDim2 .new(1/gs,kD<gs and-4 or 0,1,0),
BackgroundColor3=d.panel,BorderSizePixel=0},pX)Q(gt,6)local kE=E(gt,"0",15,d.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local pZ=E(gt,pY,9,d.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))kE.TextXAlignment,pZ.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return kE end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=cB(1,"BOUGHT",5),cB(2,"WAXED",5),cB(3,"SOLD",5),cB(4,"MONEY",5),cB(5,"FREE",5)
b.info=E(V(40),"",10,d.dim,false)b.tgt=E(V(26),"",10,d.good,false)bF("MONEY COLLECT")q=V(28)
b.secB=ks(q,tostring(e.Every),"60",u(0,0.2))E(q,"sec",11,d.dim,false,u(0.21,0.09))b.secSet=v(q,"SET",d.accent,12,u(0.3,0.2))
b.colT=v(q,"COLLECT: ON",d.accent,11,u(0.5,0.5))q=V(26)b.padB=v(q,"SET PAD (stand on it)",d.panel2,10,u(0,0.55))
b.padL=E(q,"",10,d.dim,false,u(0.56,0.44))bF("BUTTERS YOU DID NOT TICK, AND CRATES")q=V(28)
b.sellT=v(q,"SELL THEM: ON",d.accent,11,u(0,0.55))b.sellB=v(q,"SELL NOW",d.warn,11,u(0.55,0.45))
q=V(28)b.crateT=v(q,"OPEN CRATES: ON",d.accent,11,u(0,0.55))b.crateB=v(q,"OPEN NOW",d.warn,11,u(0.55,0.45))
bF("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")q=V(28)b.arT=v(q,"AUTO ROLL: OFF",d.panel2,11,u(0,0.5))
b.arL=E(q,"",9,d.dim,false,u(0.52,0.48))bF("TOOLS")q=V(30)b.buyB=v(q,"BUY",d.warn,10,u(0,0.2))
b.plB=v(q,"WAX",d.good,10,u(0.2,0.2))b.dumpB=v(q,"DUMP",d.accent,10,u(0.4,0.2))b.copyB=v(q,"COPY",d.panel2,10,u(0.6,0.2))
b.linkB=v(q,"LINK",d.good,10,u(0.8,0.2))bF("LOG")b.log=x("TextLabel",{Size=bd,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=d.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},V(84))Q(b.log,6)x("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},b.log)
bF("OUTPUT  (DUMP result)")b.out=x("TextBox",{Size=bd,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},V(110))Q(b.out,6)
b.farm.CanvasSize=UDim2 .new(0,0,0,cA)d_,cA=0,12 local function ah(p0)return V(p0,b.set)end
local function ea(p1)E(ah(14),p1,10,d.dim,true)end ea("SETTINGS FILE  (saved on your phone)")
q=ah(28)b.cfgName=ks(q,"default","config name",u(0,0.5))b.cfgSave=v(q,"SAVE",d.good,11,u(0.5,0.25))
b.cfgLoad=v(q,"LOAD",d.accent,11,u(0.75,0.25))q=ah(26)b.cfgPrev=v(q,"<",d.panel2,11,u(0,0.13))
b.cfgPick=v(q,"(none saved)",d.panel2,10,u(0.13,0.74))b.cfgNext=v(q,">",d.panel2,11,u(0.87,0.13))
q=ah(26)b.cfgAuto=v(q,"LOAD IT ON LAUNCH: OFF",d.panel2,10,u(0,1))b.cfgMsg=E(ah(26),"",10,d.dim,false)
ea("START BY ITSELF")q=ah(26)b.autoB=v(q,"INSTALL F.exec",d.accent,10,u(0,1))b.autoMsg=E(ah(30),"",10,d.dim,false)
q=ah(28)b.startT=v(q,"START FARMING ON LOAD: ON",d.accent,10,u(0,1))E(ah(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,d.dim,false)
ea("IF THE GAME DROPS ME")q=ah(28)b.rejT=v(q,"AUTO REJOIN: ON",d.accent,11,u(0,0.55))b.rejB=v(q,"REJOIN NOW",d.warn,11,u(0.55,0.45))
b.rejMsg=E(ah(30),"",10,d.dim,false)ea("THE ROUND SAB BUTTON")E(ah(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,d.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,cA)local kF=x("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},gj)
b.tgRoot=x("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=d.accent,BorderSizePixel=0,Active=true},kF)Q(b.tgRoot,26)x("UIStroke",{Color=d.line,Thickness=1},b.tgRoot)
b.tgBtn=x("TextButton",{Text="SAB",Size=bd,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=d.text,AutoButtonColor=false},b.tgRoot)b.tgDot=x("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=d.dim,
BorderSizePixel=0},b.tgRoot)Q(b.tgDot,4)local aD={built=false,boxes={},at=0}local function kG(kH,gu)
e.Targets[kH]=gu or nil local gv=aD.boxes[kH]if gv then gv.Text=gu and"X"or""gv.BackgroundColor3=gu and d.good or d.panel2
end end local function gw()for p2,kI in pairs(aD.boxes)do local kJ=e.Targets[p2]==true kI.Text=kJ and"X"or""
kI.BackgroundColor3=kJ and d.good or d.panel2 end end local cC local function p3()local p4=0
local gx=x("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=E(gx,"",10,d.dim,false,u(0,0.5))local p5=v(gx,"CLEAR",d.panel2,10,u(0.5,0.24))
local p6=v(gx,"REFRESH",d.panel2,10,u(0.74,0.26))p5 .MouseButton1Click:Connect(function()
for p7 in pairs(e.Targets)do e.Targets[p7]=nil end gw()end)p6 .MouseButton1Click:Connect(function()
A.at=0 eX()cC(true)end)return p4 end cC=function(p8)if not eX()then if not b.butEmpty then
b.butEmpty=E(x("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,d.warn,false)end return
end if aD.built and not p8 and aD.at==A.at then return end for rO,gy in ipairs(b.but:GetChildren())do
if gy:IsA("Frame")or gy:IsA("TextButton")then gy:Destroy()end end aD.boxes,b.butEmpty={},nil
p3()local gz,gA=36,1 local function kK(kL)gA=gA+1 local p9=x("Frame",{Size=UDim2 .new(1,0,0,kL),BackgroundTransparency=1,LayoutOrder=gA},b.but)
gz=gz+kL+6 return p9 end for rP,eb in ipairs(A.rarOrder)do local p_=kK(24)local qa=kn[eb]or d.text
local gB=x("Frame",{Size=bd,BackgroundColor3=d.panel,BorderSizePixel=0},p_)Q(gB,6)E(gB,"  "..eb:upper(),11,qa,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local qb=v(gB,"ALL",d.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local qc=eb
qb.MouseButton1Click:Connect(function()local kM=A.members[qc]or{}local kN=false for rQ,qd in ipairs(kM)do if not e.Targets[qd]then kN=true break end end
for rR,qe in ipairs(kM)do kG(qe,kN)end end)for rS,gC in ipairs(A.members[eb]or{})do local qf=kK(22)
local ec=x("TextButton",{Text="",Size=bd,BackgroundColor3=d.bg,BorderSizePixel=0,AutoButtonColor=true},qf)
Q(ec,5)E(ec,"   "..N(gC),11,d.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local gD=x("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},ec)
Q(gD,4)aD.boxes[gC]=gD local kO=gC local function kP()kG(kO,not e.Targets[kO])end ec.MouseButton1Click:Connect(kP)
gD.MouseButton1Click:Connect(kP)end end gw()b.but.CanvasSize=UDim2 .new(0,0,0,gz+10)aD.built,aD.at=true,A.at
end function o.paint()for qg,kQ in pairs(o.boxes)do local kR=e.CrateTicks[qg]==true kQ.Text=kR and"X"or""
kQ.BackgroundColor3=kR and d.good or d.panel2 end if b.crtInfo then local gE,gF=0,0 for rT in pairs(o.boxes)do gE=gE+1 end
for rU,qh in pairs(e.CrateTicks)do if qh then gF=gF+1 end end b.crtInfo.Text=("%d crates, %d ticked"):format(gE,gF)
end if b.crtAll then b.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"
b.crtAll.BackgroundColor3=e.Crates and d.accent or d.panel2 end end function o.build()for rV,gG in ipairs(b.crt:GetChildren())do
if gG:IsA("Frame")or gG:IsA("TextButton")then gG:Destroy()end end o.boxes={}local gH,gI=12,0
local function ed(kS)gI=gI+1 gH=gH+kS+6 return x("Frame",{Size=UDim2 .new(1,0,0,kS),BackgroundTransparency=1,LayoutOrder=gI},b.crt)
end local gJ=ed(28)b.crtInfo=E(gJ,"",10,d.dim,false,u(0,0.5))local qi=v(gJ,"CLEAR",d.panel2,10,u(0.5,0.24))
local qj=v(gJ,"REFRESH",d.panel2,10,u(0.74,0.26))K(qi.MouseButton1Click:Connect(function()e.CrateTicks={}o.paint()end))
K(qj.MouseButton1Click:Connect(function()o.build()end))b.crtAll=v(ed(28),"",d.accent,11,u(0,1))
K(b.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates o.paint()end))E(ed(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,d.dim,false)
for rW,aE in ipairs(o.list())do local qk=ed(24)local cD=x("TextButton",{Text="",Size=bd,BackgroundColor3=d.panel,BorderSizePixel=0,AutoButtonColor=true},qk)
Q(cD,5)E(cD,"  "..(aE.title or aE.name)..(aE.guess and"  (?)"or""),11,kn[aE.rar or""]or d.text,true,
UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))E(cD,aE.price and("$"..an(aE.price))or(aE.rar or""),9,d.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local gK=x("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},cD)
Q(gK,4)o.boxes[aE.k]=gK local kT=aE.k local function kU()e.CrateTicks[kT]=(not e.CrateTicks[kT])or nil
o.paint()end K(cD.MouseButton1Click:Connect(kU))K(gK.MouseButton1Click:Connect(kU))end b.crt.CanvasSize=UDim2 .new(0,0,0,gH+10)
o.built=o.at o.paint()end local kV="farm"local function bG(al)kV=al b.farm.Visible,b.but.Visible,b.set.Visible=(al=="farm"),(al=="but"),(al=="set")
b.crt.Visible=(al=="crt")b.tabCrt.BackgroundColor3=(al=="crt")and d.accent or d.panel2 if al=="crt"and(o.built~=o.at or not next(o.boxes))then o.build()end
b.tabFarm.BackgroundColor3=(al=="farm")and d.accent or d.panel2 b.tabBut.BackgroundColor3=(al=="but")and d.accent or d.panel2
b.tabSet.BackgroundColor3=(al=="set")and d.accent or d.panel2 if al=="but"then cC(false)end
end local function H(kW,kX,ql,qm)kW.Text=kX and ql or qm kW.BackgroundColor3=kX and d.accent or d.panel2
end local function qn()b.secB.Text=tostring(e.Every)H(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
H(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")H(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
H(b.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")H(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
H(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")if e.AutoStart~=a.running then cp(e.AutoStart,true)end
if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end
aX(b.root)aX(b.tgRoot)a.lastCollect=j()gw()o.paint()end local function qo(kY)task.spawn(function()
kY.TextColor3=d.bad task.wait(0.8)if a.alive then kY.TextColor3=d.text end end)end local function kZ()
local k0=b.secB.Text:match("^%s*(%d+)%s*$")local cE=k0 and tonumber(k0)if not cE or cE<1 then
b.secB.Text=tostring(e.Every)qo(b.secB)f("interval must be a whole number >= 1")return end
if cE==e.Every then return end e.Every,a.lastCollect=cE,j()f("collect every "..cE.."s")
end local function gL(qp)local k1=setclipboard or toclipboard return type(k1)=="function"and pcall(k1,qp)
end local function qq()local gM=W~=""and W or(a.reason.."\n"..table.concat(aF,"\n"))if gL(gM)then f("copied "..#gM.." chars")return end
b.out.Text=gM pcall(function()b.out:CaptureFocus()end)f("no clipboard here - select the text in OUTPUT")
end local function qr()local qs,k2=pcall(f4)W=qs and k2 or("DUMP ERROR "..tostring(k2))
local k3=gL(W)b.out.Text=(k3 and#W>7000)and(W:sub(1,7000).."\n... (full text is on your clipboard)")or W
f("DUMP "..#W.." chars"..(k3 and", copied"or""))end local function y(qt,qu)K(qt.MouseButton1Click:Connect(qu))end
y(b.secSet,kZ)K(b.secB.FocusLost:Connect(kZ))y(b.colT,function()e.Collect,a.lastCollect=not e.Collect,j()
H(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")end)y(b.sellT,function()e.SellJunk=not e.SellJunk
H(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)y(b.sellB,function()a.sellFails=0
task.spawn(ag,"selling...",jP)end)y(b.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(g.apply,"you asked",true)
end)y(b.crateT,function()e.Crates=not e.Crates H(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)y(b.crateB,function()c.lastFail,c.summonFails,c.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(ag,"opening crate...",dC,true)
end)y(b.padB,function()a.plot=aJ()or a.plot local k4,gN=aI(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(k4 and gN and gN:IsA("BasePart"))then f("SET PAD: need character and plot")return end
a.manualPad=gN.CFrame:ToObjectSpace(k4 .HumanoidRootPart.CFrame)oN(a.manualPad)f("collect pad saved at your position")
end)y(b.startB,function()cp(not a.running)end)y(b.buyB,function()a.plot=aJ()or a.plot task.spawn(ag,"buying (manual)...",iD,true)
end)y(b.plB,function()a.plot=aJ()or a.plot task.spawn(ag,"waxing (manual)...",iI)end)y(b.dumpB,qr)
y(b.copyB,qq)y(b.linkB,function()task.spawn(function()local qv,qw=pcall(f4)W=qv and qw or W
if W==""then W="(empty dump)"end local k5=(type(request)=="function"and request)or(type(http_request)=="function"and http_request)
or(syn and syn.request)or(http and http.request)if type(k5)~="function"then b.out.Text="this executor cannot upload - use COPY instead"return end
b.out.Text="uploading..."local k6,bH=pcall(k5,{Url="https://paste.rs/",Method="POST",Headers={["Content-Type"]="text/plain"},Body=W})
local gO=k6 and type(bH)=="table"and(bH.StatusCode or bH.status_code)or 0 local qx=k6 and type(bH)=="table"and(bH.Body or bH.body)or""
local gP=(gO>=200 and gO<300)and tostring(qx):match("https?://[%w%./%-_]+")or nil if not gP then
b.out.Text="upload failed ("..tostring(gO)..") - use COPY instead"f("LINK failed")return
end local k7=gL(gP)b.out.Text="SEND THIS LINK TO CLAUDE:\n"..gP..(k7 and"\n(copied)"or"")
f("dump uploaded"..(k7 and", link copied"or""))end)end)y(b.tabFarm,function()bG("farm")end)
y(b.tabBut,function()bG("but")end)y(b.tabSet,function()bG("set")end)y(b.tabCrt,function()bG("crt")end)
local function k8(gQ)a.hidden=gQ b.root.Visible=not gQ b.tgBtn.Text=gQ and"SAB+"or"SAB"
end kw(b.tgRoot,b.tgRoot,function(qy)aX(b.tgRoot)a.togPos=d5(b.tgRoot)or a.togPos if qy<8 then k8(not a.hidden)end
end)y(b.tgBtn,function()k8(not a.hidden)end)local ad,M={},0 local function aY()ad=eZ()if#ad==0 then
b.cfgPick.Text="(none saved)"M=0 return end if M<1 or M>#ad then M=1 end b.cfgPick.Text=ad[M]..("  (%d/%d)"):format(M,#ad)
end local function k9()local k_=a.autoload~=nil b.cfgAuto.Text=k_ and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
b.cfgAuto.BackgroundColor3=k_ and d.accent or d.panel2 end local function gR()local la=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if la~=""then return la end return(M>0 and ad[M])or""end y(b.cfgSave,function()a.winPos=d5(b.root)or a.winPos
a.togPos=d5(b.tgRoot)or a.togPos local lb,lc=e4(gR())b.cfgMsg.Text=lb and("saved as "..lc)or("could not save: "..lc)
b.cfgMsg.TextColor3=lb and d.good or d.bad aY()f(b.cfgMsg.Text)end)local function qz(gS)
local gT,ld=h4(gS)b.cfgMsg.Text=gT and("loaded "..ld)or("could not load: "..ld)b.cfgMsg.TextColor3=gT and d.good or d.bad
if gT then b.cfgName.Text=gS qn()task.spawn(g.apply,"config "..gS)end f(b.cfgMsg.Text)end
y(b.cfgLoad,function()qz(gR())end)y(b.cfgPick,function()aY()if M>0 then b.cfgName.Text=ad[M]end
end)y(b.cfgPrev,function()if#ad==0 then aY()return end M=(M-2)%#ad+1 aY()b.cfgName.Text=ad[M]
end)y(b.cfgNext,function()if#ad==0 then aY()return end M=M%#ad+1 aY()b.cfgName.Text=ad[M]
end)y(b.cfgAuto,function()if a.autoload then h6(nil)b.cfgMsg.Text="it will not load a config on launch"
else local cF=gR()local le=false for rX,qA in ipairs(eZ())do if qA==cF then le=true end end
local qB=le or e4(cF)if qB and cF~=""then h6(cF)aY()b.cfgMsg.Text=cF.." will load every time the script starts"
else b.cfgMsg.Text="name the config and save it first"end end b.cfgMsg.TextColor3=d.dim
k9()end)y(b.autoB,function()local lf,lg=mV()b.autoMsg.Text=lf and("installed. "..lg)or("failed: "..lg)
b.autoMsg.TextColor3=lf and d.good or d.bad f(b.autoMsg.Text)end)y(b.startT,function()e.AutoStart=not e.AutoStart
H(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)y(b.rejT,function()
e.Rejoin=not e.Rejoin H(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)y(b.rejB,function()df("you asked")end)
local bI=false y(b.minB,function()bI=not bI b.tabs.Visible=not bI if bI then b.farm.Visible,b.but.Visible,b.set.Visible,b.crt.Visible=false,false,false,false
else bG(kV)end b.root.Size=UDim2 .new(0,J.w,0,bI and(J.head+J.strip)or J.h)b.minB.Text=bI and"+"or"-"
end)local function ee()if not a.alive then return end a.alive,a.running=false,false pcall(eF)
for rY,qC in ipairs(ek)do pcall(function()qC:Disconnect()end)end if c.oldNC then pcall(function()hookmetamethod(game,"__namecall",c.oldNC)end)end
pcall(function()gk:Destroy()end)pcall(function()kF:Destroy()end)if bf.SAB_KILL==ee then bf.SAB_KILL=nil end
end bf.SAB_KILL=ee y(b.killB,ee)y(b.xB,ee)kw(b.title,b.root,function()aX(b.root)a.winPos=d5(b.root)or a.winPos
end)local function lh()local cG,cH=a.reason,a.level if a.busy then cG,cH=a.busyText,"ok"
elseif not a.running then local rZ,li,qD=jV()if a.capHit then cG,cH=li,"bad"else cG,cH="[stopped] "..li,(qD=="bad")and"bad"or"idle"end
a.reason,a.level=cG,cH end b.reason.Text=cG b.bar.BackgroundColor3=pp[cH]or d.dim b.dot.BackgroundColor3=a.running and d.good or(a.capHit and d.bad or d.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and d.panel2 or d.accent
b.startB.Text=a.running and"STOP"or"START"H(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and d.warn or d.good local qE,qF=ex()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),qE.."/"..qF local lj=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(j()-a.lastCollect)))or nil
local lk=D()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
an(aq()),a.rolls,a.gifts,a.crates,lk and N(F(lk))or"nothing",c.on and("   ["..c.title.." window open]")or"",
lj and("in "..lj.."s")or"off")local bJ=hS()b.tgt.Text=(#bJ==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#bJ<=3)and table.concat(bJ,", ")or(#bJ.." butters ticked")))b.tgt.TextColor3=(#bJ==0)and d.bad or d.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(cK,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(A.n,#A.rarOrder,#bJ)
end if b.but.Visible and aD.at~=A.at then cC(false)end if b.crt.Visible then if o.built~=o.at then o.build()else o.paint()end
end H(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")H(b.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local ll=(g.rec.on and"on"or"")..(g.rec.off and((g.rec.on and"/"or"").."off")or"")b.arL.Text=g.msg~=""and g.msg or("game: %s | learned: %s%s"):format(g.isOn()and"ON"or"off",
ll~=""and ll or"nothing yet",#g.rec.rules>0 and", choices"or"")b.arL.TextColor3=g.msg~=""and d.warn or d.dim
end bf.SAB={S=a,CFG=e,EV=z,U=b,sg=gk,dump=f4,CAT=A,LEARN=C,buildList=cC}f(aZ.." loaded")
if a.uiErrs>0 then f("UI: "..a.uiErrs.." properties skipped")end bG("farm")aX(b.root)aX(b.tgRoot)
if d2 then pcall(function()K(d2:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)aX(b.root)aX(b.tgRoot)end))end)end aY()k9()if a.config and a.config~=""then b.cfgName.Text=a.config end
H(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")H(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")
H(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")H(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
H(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")b.secB.Text=tostring(e.Every)
pcall(lh)task.spawn(function()local lm=e6()b.rejMsg.Text=lm and("after a rejoin it restarts from\n"..lm)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(eY(O.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(m1)end)task.spawn(function()while a.alive do local qG,qH=pcall(lh)if not qG then f("UI ERR "..tostring(qH))end
task.wait(0.25)end end)task.spawn(function()local qI,qJ=pcall(m_)if not qI then f("HOOK ERR "..tostring(qJ))end
end)task.spawn(function()pcall(lZ)if c.loadSeq and not c.learned then local ef={}for ln=1,20 do if c.loadSeq[ln]then ef[#ef+1]=c.loadSeq[ln]end end
if#ef>0 then c.learned={seq=ef,mode=c.loadMode}f("remembered how to open crates directly")
end end if eX()then f(("catalog: %d butters in %d rarities"):format(A.n,#A.rarOrder))end
local qK,lo=pcall(oP)if qK and lo and a.alive and not a.manualPad then a.manualPad=lo end
end)task.spawn(function()while a.alive do task.wait(20)pcall(eF)end end)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local qM=(type(newcclosure)=="function")and newcclosure or function(qL)return qL end
local gU gU=hookmetamethod(game,"__namecall",qM(function(lp,...)if a.alive then local eg=getnamecallmethod()
if eg=="InvokeServer"or eg=="FireServer"then local lq,lr=pcall(function()return lp.Name end)
if lq and lr=="CrateAction"and not c.replaying then pcall(c.saw,eg,...)elseif lq and lr=="AutoRollAction"and not g.replaying then pcall(g.saw,eg,...)end
end end return gU(lp,...)end))c.oldNC=gU end)end if ei then K(r.Idled:Connect(function()pcall(function()ei:CaptureController()ei:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for r0=1,90 do if not a.alive then return end if r:GetAttribute("AutoRollOn")~=nil and aI()and(a.plot or aJ())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then g.apply("joined")end while a.alive do task.wait(30)
if a.alive and e.AutoRoll and a.running and not g.isOn()and not bp()and not D()and not c.waiting and not c.on and not a.busy then
g.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for r1=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or aJ()if aI()and a.plot and next(e.Targets)then
cp(true,true)f("started by itself")return end task.wait(1)end if a.alive and not a.running then f("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=aJ()a.lastCollect=j()while a.alive do if a.running then
local qN,ls=pcall(o4)if not qN and ls~=ej then f("LOOP ERR "..tostring(ls))end end task.wait(0.1)
end end)eh("loaded - window is at the top left")end local qP,gV=xpcall(lw,function(qO)return tostring(qO).."\n"..debug.traceback()end)
if not qP then pcall(function()warn("SAB "..aZ.." ERROR: "..tostring(gV))end)eh("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..aZ.." ERROR: "..tostring(gV))end)pcall(function()local lt=(type(getgenv)=="function"and getgenv())or _G
if type(lt.SAB_KILL)=="function"then lt.SAB_KILL()end for r2,qQ in ipairs({"SABFarmGui","SABToggle"})do
local lu=r.PlayerGui:FindFirstChild(qQ)if lu then lu:Destroy()end end end)pcall(function()
local cI=Instance.new("ScreenGui")cI.Name="SABError"cI.ResetOnSpawn=false cI.DisplayOrder=1000
local am=Instance.new("TextBox")am.Size=UDim2 .new(0,340,0,170)am.Position=UDim2 .new(0,10,0,50)
am.BackgroundColor3=Color3 .fromRGB(90,20,20)am.TextColor3=Color3 .new(1,1,1)am.TextSize=11
am.TextWrapped=true am.ClearTextOnFocus=false am.TextXAlignment=Enum.TextXAlignment.Left
am.TextYAlignment=Enum.TextYAlignment.Top am.Text="SAB "..aZ.." failed to start. Send this text:\n"..tostring(gV)
am.Parent=cI cI.Parent=r:WaitForChild("PlayerGui")end)end
