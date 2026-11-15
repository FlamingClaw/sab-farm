local aZ="v24"local gX=game:GetService("Players")local r=gX.LocalPlayer or gX.PlayerAdded:Wait()
local function ei(ly)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..aZ,Text=ly,Duration=6})
end)end ei("script started")local function lz()local be=game:GetService("ReplicatedStorage")
local cK=game:GetService("Workspace")local lA=game:GetService("UserInputService")local bf=(type(getgenv)=="function"and getgenv())or _G
if type(bf.SAB_KILL)=="function"then pcall(bf.SAB_KILL)end local j=(type(tick)=="function")and tick or os.clock
local ej=(function()local lB,lC=pcall(function()return game:GetService("VirtualUser")end)return lB and lC or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
}local a={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=j(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local z={name=nil,rar=nil,at=j(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local f={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}
local c={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,
ours=false,byYou=false,openedAt=0,win=nil}local ek={}local el,cL,aF,a0={},{},{},{}local W=""
local function I(gY)el[#el+1]=gY return gY end local function aG(lD)task.wait(lD)if not a.alive then error(ek,0)end
end local function g(cM)cM=os.date("%H:%M:%S").." "..tostring(cM)table.insert(cL,1,cM)if#cL>6 then table.remove(cL)end
aF[#aF+1]=cM if#aF>80 then table.remove(aF,1)end end local function cN(gZ)if type(gZ)~="string"then return""end
return(gZ:lower():gsub("[^%w]",""))end local function F(lE)local g0=cN(lE)local em=g0:gsub("butter$","")
if em==""then em=g0 end return em end local function aH(en)return type(en)=="string"and F(en)~=""and e.Targets[F(en)]==true end
local function lF(bK)bK=bK:lower()return bK:find("squishy",1,true)~=nil or bK:match("butter$")~=nil or bK:match("butter[^%a]")~=nil
end local eo={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function an(bL)
if type(bL)~="number"then return"?"end local cO=1 while math.abs(bL)>=1000 and cO<#eo do bL=bL/1000 cO=cO+1 end
local lG=string.format("%.2f",bL):gsub("%.?0+$","")return lG..eo[cO]end local function lH(g1)
if type(g1)~="string"then return nil end local lI,g2=g1:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local ep=tonumber(lI)if not ep then return nil end if g2==""then return ep end for lJ,lK in ipairs(eo)do if lK:lower()==g2:lower()then return ep*1000^(lJ-1)end end
return nil end local function aq()local g3=r:GetAttribute("BoardValueMoney")if type(g3)=="number"then return g3 end
local g4=r:FindFirstChild("leaderstats")if g4 then for qV,lL in ipairs({"Cash","Money","Coins"})do
local eq=g4:FindFirstChild(lL)if eq and type(eq.Value)=="number"then return eq.Value end
end end end local function ae(lM)local er=lM:GetFullName()if a.plot then local es=a.plot:GetFullName()
if er:sub(1,#es)==es then return er:sub(#es+2)end end return er end local function aI()
local cP=r.Character if cP and cP:FindFirstChild("HumanoidRootPart")then local g5=cP:FindFirstChildOfClass("Humanoid")
if g5 and g5 .Health>0 then return cP end end end local function aJ()local et=cK:FindFirstChild("Plots")
if not et then return nil end local function g6(lN)local g7=lN:FindFirstChild("Plate")return g7~=nil and g7:FindFirstChild("EditStackAttachment",true)~=nil
end local g8=r:GetAttribute("PlotNumber")if g8~=nil then local eu=et:FindFirstChild(tostring(g8))
if eu and g6(eu)then return eu end end for qW,g9 in ipairs(et:GetChildren())do if g6(g9)then return g9 end
end end local function bM(g_)local aK=g_ and g_.Parent for qX=1,6 do if not aK then return nil end
if aK:IsA("BasePart")then return aK end if aK:IsA("Model")then return aK.PrimaryPart or aK:FindFirstChildWhichIsA("BasePart",true)end
aK=aK.Parent end end local function ha(hb)local ev=hb.Parent if ev and ev:IsA("Attachment")then return ev.WorldPosition end
local hc=bM(hb)return hc and hc.Position end local function lO()local bh=a.plot and a.plot:FindFirstChild("Plate")
if not bh then return nil end if bh:IsA("BasePart")then return bh.Position end if bh:IsA("Model")then return bh:GetPivot().Position end
local hd=bh:FindFirstChildWhichIsA("BasePart",true)return hd and hd.Position end local function he()
local ew={}local hf=a.plot and a.plot:FindFirstChild("WaxStations")if hf then for qY,lP in ipairs(hf:GetChildren())do
local hg=lP:FindFirstChild("SquishyPlaceHolder")local ex=hg and hg:FindFirstChild("PlacePrompt")
if ex and ex:IsA("ProximityPrompt")then ew[#ew+1]=ex end end end return ew end local function ey()
local hh,ez=he(),0 for qZ,lQ in ipairs(hh)do if lQ.Enabled then ez=ez+1 end end local eA=#hh
local eB=r:GetAttribute("WaxStations")if type(eB)=="number"and eB>eA then eA=eB end return ez,eA
end local function lR()local hi=aI()local hj=hi and hi.HumanoidRootPart.Position local eC,hk
for q0,eD in ipairs(he())do if eD.Enabled then local hl=ha(eD)local hm=(hl and hj)and(hl-hj).Magnitude or 1e9
if not eC or hm<hk then eC,hk=eD,hm end end end return eC end local function eE()local cQ=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not cQ then return nil end local hn=cQ:FindFirstChild("BuyPromptAttachment")local cR=(hn and hn:FindFirstChild("BuyPrompt"))or cQ:FindFirstChild("BuyPrompt",true)
if cR and cR:IsA("ProximityPrompt")and cR:IsDescendantOf(cQ)then return cR end end local ho={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local lS={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local C={order={},price={},dirty=false}local o={seen={},at=0,boxes={},built=0}local A={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local eF="SAB_order.txt"local function eG()if not C.dirty or type(writefile)~="function"then return end
local aa={}for lT,lU in pairs(C.price)do aa[#aa+1]="P|"..lT.."|"..string.format("%.0f",lU)end
for lV,lW in pairs(C.order)do aa[#aa+1]="O|"..lV.."|"..table.concat(lW,",")end if c.learned and c.enc then
aa[#aa+1]="M|mode|"..tostring(c.learned.mode or"")for lX,cS in ipairs(c.learned.seq)do local hp={}
for hq=1,cS.n do hp[hq]=c.enc(cS.args[hq])end aa[#aa+1]=("A|%d|%s|%d|%s"):format(lX,cS.m,cS.n,table.concat(hp,";"))
end end local function eH(lY,lZ,cT)local hr={}for hs=1,cT.n do hr[hs]=c.enc(cT.args[hs])end
aa[#aa+1]=("R|%d|%s|%s|%d|%s"):format(lZ,lY,cT.m,cT.n,table.concat(hr,";"))end if c.enc then
for l0,l1 in ipairs(f.rec.rules)do eH("rules",l0,l1)end if f.rec.on then eH("on",0,f.rec.on)end
if f.rec.off then eH("off",0,f.rec.off)end end for q1,bN in pairs(o.seen)do aa[#aa+1]=("K|%s|%s|%s|%s"):format(bN.name,bN.title or"",bN.rar or"",bN.price and string.format("%.0f",bN.price)or"")
end if pcall(writefile,eF,table.concat(aa,"\n"))then C.dirty=false end end local function l2()
if type(isfile)~="function"or type(readfile)~="function"then return end local l3,l4=pcall(isfile,eF)
if not(l3 and l4)then return end local l5,ht=pcall(readfile,eF)if not(l5 and type(ht)=="string")then return end
for l6 in ht:gmatch("[^\n]+")do local bi,bj,ar=l6:match("^(%a)|([^|]+)|(.*)$")if bi=="P"then
C.price[bj]=tonumber(ar)elseif bi=="M"then c.loadMode=(ar~=""and ar~="nil")and ar or nil
elseif bi=="A"and c.dec then local hu=tonumber(bj)local hv,cU,l7=ar:match("^([^|]+)|(%d+)|(.*)$")
if hu and hv then cU=tonumber(cU)local hw,cV={},0 for l8 in(l7 ..";"):gmatch("([^;]*);")do
cV=cV+1 if cV<=cU then hw[cV]=c.dec(l8)end end c.loadSeq=c.loadSeq or{}c.loadSeq[hu]={m=hv,n=cU,args=hw}
end elseif bi=="R"and c.dec then local hx=tonumber(bj)local cW,l9,cX,l_=ar:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")
if hx and cW then cX=tonumber(cX)local hy,cY={},0 for ma in(l_..";"):gmatch("([^;]*);")do
cY=cY+1 if cY<=cX then hy[cY]=c.dec(ma)end end local eI={m=l9,n=cX,args=hy}if cW=="rules"then f.rec.rules[hx]=eI
elseif cW=="on"then f.rec.on=eI elseif cW=="off"then f.rec.off=eI end end elseif bi=="K"then
local hz,hA,mb=ar:match("^([^|]*)|([^|]*)|(.*)$")o.seen[o.key(bj)]={name=bj,title=hz~=""and hz or nil,
rar=hA~=""and hA or nil,price=tonumber(mb)}elseif bi=="O"and ar~=""then local cZ={}for mc in ar:gmatch("[^,]+")do cZ[#cZ+1]=mc end
if#cZ>0 then C.order[bj]=cZ end end end end local function md(c0)if type(c0)~="table"then return end
local a1,hB=c0 .rarity,c0 .contents if type(a1)~="string"or a1==""or type(hB)~="table"then return end
local bO={}for q2,c1 in ipairs(hB)do if type(c1)=="table"and type(c1 .butter)=="string"then
bO[#bO+1]={n=c1 .butter,ch=tonumber(c1 .chance)or 0}end end if#bO==0 then return end table.sort(bO,function(me,mf)return me.ch>mf.ch end)
local bP,bQ={},false for mg,mh in ipairs(bO)do bP[mg]=mh.n end local eJ=C.order[a1]if not eJ or#eJ~=#bP then bQ=true end
if not bQ then for hC=1,#bP do if eJ[hC]~=bP[hC]then bQ=true break end end end C.order[a1]=bP
local eK=tonumber(c0 .price)if eK and C.price[a1]~=eK then C.price[a1]=eK bQ=true end if bQ then
C.dirty=true A.at=0 g("learned the "..a1 .." order from its crate")end end local function bk(mi,mj)
local mk=mi:FindFirstChild(mj,true)local ml,eL=pcall(function()return mk.Text end)return(ml and type(eL)=="string"and eL~="")and eL or nil
end local function N(hD)return A.pretty[hD]or hD end o.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},
{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},
{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}
function o.key(mm)return cN(mm or"")end function o.learn(as)if type(as)~="table"or type(as.name)~="string"then return end
local eM=o.key(as.name)local au=o.seen[eM]or{}local mn=(o.seen[eM]==nil)or(tonumber(as.price)and au.price~=tonumber(as.price))
au.name,au.title=as.name,as.title or au.title au.rar,au.price=as.rarity or au.rar,tonumber(as.price)or au.price
o.seen[eM]=au if mn then o.at,C.dirty=j(),true end end function o.wanted(hE)return hE~=nil and e.CrateTicks[o.key(hE)]==true end
function o.list()local bl={}for mo,c2 in ipairs(o.base)do bl[o.key(c2[1])]={name=c2[1],title=c2[2],rar=c2[3],i=mo}end
for q3,bR in ipairs(A.rarOrder)do local hF=false for q4,mp in pairs(bl)do if mp.rar==bR then hF=true break end end
if not hF and bR~="?"then local hG=bR:gsub("[^%w]","").."Crate"bl[o.key(hG)]={name=hG,title=bR.." Crate",rar=bR,i=50,guess=true}
end end for hH,c3 in pairs(o.seen)do local ao=bl[hH]or{i=100}ao.name,ao.title,ao.rar=c3 .name or ao.name,c3 .title or ao.title,c3 .rar or ao.rar
ao.price,ao.guess=c3 .price or ao.price,nil bl[hH]=ao end local bS,c4={},{}for mq,mr in ipairs(ho)do bS[mr]=mq end
for ms,hI in ipairs(A.rarOrder)do bS[hI]=bS[hI]or(20+ms)end for mt,bT in pairs(bl)do bT.k=mt
bT.price=bT.price or C.price[bT.rar or""]c4[#c4+1]=bT end table.sort(c4,function(a2,a3)
if a2 .price and a3 .price and a2 .price~=a3 .price then return a2 .price<a3 .price end
local hJ,hK=bS[a2 .rar or""]or 99,bS[a3 .rar or""]or 99 if hJ~=hK then return hJ<hK end
if(a2 .i or 100)~=(a3 .i or 100)then return(a2 .i or 100)<(a3 .i or 100)end return a2 .k<a3 .k
end)return c4 end local function mu()local hL=be:FindFirstChild("Assets")local hM=hL and hL:FindFirstChild("Squishies")
if not hM then return false end local eN,hN,bm={},{},{}local c5=0 for q5,c6 in ipairs(hM:GetChildren())do
local bU=F(c6 .Name)if bU~=""and not eN[bU]then local c7=bk(c6,"RarityText")or"?"eN[bU]=c7
hN[bU]=bk(c6,"NameText")or c6 .Name bm[c7]=bm[c7]or{}table.insert(bm[c7],bU)c5=c5+1 end
end if c5==0 then return false end for hO,mv in pairs(bm)do local hP=C.order[hO]or lS[hO]
local eO={}if hP then for mw,mx in ipairs(hP)do eO[F(mx)]=mw end end table.sort(mv,function(hQ,hR)
local eP,eQ=eO[hQ],eO[hR]if eP and eQ then return eP<eQ end if eP then return true end if eQ then return false end
return N(hQ)<N(hR)end)end local eR={}for my,mz in ipairs(ho)do eR[mz]=my end local c8={}
for mA in pairs(bm)do c8[#c8+1]=mA end table.sort(c8,function(eS,eT)local eU,eV=C.price[eS],C.price[eT]
if eU and eV and eU~=eV then return eU<eV end local eW,eX=eR[eS],eR[eT]if eW and eX then return eW<eX end
if eW then return true end if eX then return false end return eS<eT end)A.rar,A.pretty,A.members,A.rarOrder,A.n,A.at=eN,hN,bm,c8,c5,j()
return true end local function eY()if A.at==0 or(j()-A.at)>120 then pcall(mu)end return A.n>0
end local function mB(mC)local hS=F(mC)return A.rar[hS]or(z.name and F(z.name)==hS and z.rar)or"?"
end local function hT()local c9={}for mD,mE in pairs(e.Targets)do if mE then c9[#c9+1]=N(mD)end end
table.sort(c9)return c9 end local O={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function hU()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function c_(hV)if type(makefolder)~="function"then return end local mF,mG=pcall(isfolder,hV)
if not(mF and mG)then pcall(makefolder,hV)end end local function eZ(hW)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local mH,mI=pcall(isfile,hW)if not(mH and mI)then return nil end local mJ,mK=pcall(readfile,hW)
return mJ and mK or nil end local function da(mL,mM)if type(writefile)~="function"then return false end
return(pcall(writefile,mL,mM))end local function hX(mN)local bV={}if type(listfiles)~="function"then return bV end
local mO,hY=pcall(listfiles,mN)if not mO or type(hY)~="table"then return bV end for q6,mP in ipairs(hY)do bV[#bV+1]=tostring(mP)end
return bV end local function e0()local db={}for q7,mQ in ipairs(hX(O.cfg))do local hZ=mQ:match("([^/\\]+)%.txt$")
if hZ then db[#db+1]=hZ end end table.sort(db)return db end local function mR()local L={"V|1"}
L[#L+1]="N|Every|"..tostring(e.Every)for q8,h0 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll"})do
L[#L+1]="B|"..h0 .."|"..(e[h0]and"1"or"0")end local e1=r:GetAttribute("AutoRollRules")if type(e1)=="string"and e1~=""then e.ARrules,e.ARstop=e1,tostring(r:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then L[#L+1]="S|rules|"..e.ARrules L[#L+1]="S|stop|"..e.ARstop end if a.winPos then L[#L+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then L[#L+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for q9,e2 in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local dc={}for mS,mT in pairs(e2[2])do if mT then dc[#dc+1]=mS end end table.sort(dc)L[#L+1]=e2[1].."|-"
for q_,mU in ipairs(dc)do L[#L+1]=e2[1].."|"..mU end end return table.concat(L,"\n")end
local function mV(e3)if type(e3)~="string"or e3==""then return false end local h1,h2,h3,h4={},false,{},false
for mW in e3:gmatch("[^\n]+")do local aL,ab,bn=mW:match("^(%a)|([^|]*)|?(.*)$")if aL=="N"and ab=="Every"then
local e4=tonumber(bn)if e4 and e4>=1 then e.Every=math.floor(e4)end elseif aL=="B"then if e[ab]~=nil then e[ab]=(bn=="1")end
elseif aL=="S"and ab=="rules"then e.ARrules=bn elseif aL=="S"and ab=="stop"then e.ARstop=bn
elseif aL=="W"then a.winPos={tonumber(ab)or 10,tonumber(bn)or 44}elseif aL=="G"then a.togPos={tonumber(ab)or 10,tonumber(bn)or 300}
elseif aL=="T"and ab~=""then if ab~="-"then h1[ab]=true end h2=true elseif aL=="K"and ab~=""then
if ab~="-"then h3[ab]=true end h4=true end end if h2 then e.Targets=h1 end if h4 then e.CrateTicks=h3 end
return true end local function e5(bo)if not hU()then return false,"this executor cannot write files"end
bo=(bo or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if bo==""then return false,"give the config a name"end
c_(O.dir)c_(O.cfg)if not da(O.cfg.."/"..bo..".txt",mR())then return false,"could not write the file"end
a.config=bo return true,bo end local function h5(dd)local h6=eZ(O.cfg.."/"..dd..".txt")
if not h6 then return false,"no config called "..tostring(dd)end if not mV(h6)then return false,"that config looks empty"end
a.config=dd return true,dd end local function h7(e6)if e6 then c_(O.dir)da(O.auto,e6)elseif type(delfile)=="function"then
pcall(delfile,O.auto)else da(O.auto,"")end a.autoload=e6 end local function e7()if a.selfPath then return a.selfPath end
local de for ra,mX in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",O.dir})do for rb,h8 in ipairs(hX(mX))do
local e8=h8:lower()if e8:sub(-4)==".lua"and(e8:find("sab_farm",1,true)or e8:find("sab farm",1,true))then
de=de or h8 end end end a.selfPath=de return de end O.stub=[[
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
local function mY()if not hU()then return false,"this executor cannot write files"end c_("autoexec")
if not da(O.exec,O.stub)then return false,"could not write to the autoexec folder"end local h9=e7()
return true,h9 and("it will load "..h9)or"now save this script in Delta so the loader can find it"
end local df=(function()local mZ,m0=pcall(function()return game:GetService("TeleportService")end)return mZ and m0 or nil end)()
local function h_()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local m1=queueonteleport or queue_on_teleport local ia=e7()if not ia then return false end
return(pcall(m1,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(ia)))
end local function dg(m2)if a.rejoining then return end a.rejoining=true g("REJOIN ("..m2 ..")")
pcall(eG)if a.autoload then pcall(e5,a.autoload)end local m3=h_()g(m3 and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for rc=1,30 do if not df then break end pcall(function()df:Teleport(game.PlaceId,r)end)
task.wait(10)end end)end local function m4()local m5,ib=pcall(function()return game:GetService("GuiService")end)
if m5 and ib then pcall(function()I(ib.ErrorMessageChanged:Connect(function()if e.Rejoin then dg("roblox error message")end
end))end)end pcall(function()local ic=game:GetService("CoreGui")local id=ic and ic:WaitForChild("RobloxPromptGui",15)
local ie=id and id:WaitForChild("promptOverlay",15)if ie then I(ie.ChildAdded:Connect(function(m6)
if e.Rejoin and tostring(m6 .Name):lower():find("errorprompt",1,true)then dg("disconnect prompt")end
end))end end)pcall(function()I(r.OnTeleport:Connect(function(m7)if tostring(m7):find("Started")then h_()end
end))end)if df then pcall(function()I(df.TeleportInitFailed:Connect(function()a.rejoining=false
if e.Rejoin then task.delay(5,function()dg("teleport retry")end)end end))end)end end local function ig(m8)
local ih=a.plot and a.plot:FindFirstChild(m8)if not ih then return nil,false end for rd,e9 in ipairs(ih:GetChildren())do
if e9:IsA("Model")or e9:IsA("BasePart")then return e9,true end end return nil,true end local function bp()
local aM=ig("RolledSquishy")if not aM then return nil end return{model=aM,name=aM.Name,pretty=bk(aM,"NameText")or N(F(aM.Name)),
rar=bk(aM,"RarityText")or mB(aM.Name),price=bk(aM,"PriceText")}end local function ii(e_)
return type(e_)=="string"and(A.rar[F(e_)]~=nil or lF(e_))end local function D()local fa=ig("SquishyEquipped")
if fa then a.carrySrc,c.heldAt="model",j()return fa.Name,fa end local ij=r.Character if ij then
for re,bW in ipairs(ij:GetDescendants())do if(bW:IsA("Model")or bW:IsA("Tool"))and ii(bW.Name)then
a.carrySrc,c.heldAt="character",j()return bW.Name,bW end end end local dh=r:GetAttribute("SquishyEquipped")
if type(dh)=="string"and dh~=""and ii(dh)and j()>=(a.carryBlind or 0)then a.carrySrc="attribute"
return dh,nil end a.carrySrc=nil end local function rf()local rg,m9=D()return m9 end local function ik()
local il=bp()local fb=il and lH(il.price)local fc=aq()if fb and fc and fc<fb*0.5 then return fc,fb end
end local function bq(m_)a0[#a0+1]=os.date("%H:%M:%S").." "..m_ if#a0>40 then table.remove(a0,1)end
end local function na(a4,di)if type(a4)~="string"then return end bq(("Roll(%s,%s)"):format(a4,tostring(di)))
if a4:lower():find("crate",1,true)then c.rolled,c.rolledAt=a4,j()return end z.seq=z.seq+1
z.name,z.at=a4,j()z.rar=type(di)=="string"and di or nil a.rolls=a.rolls+1 if aH(a4)then g(("ROLL %s [%s] = TARGET"):format(a4,tostring(di)))end
end local function nb(a5)if type(a5)~="table"then return end local dj=a5 .butter or a5 .itemName
if type(dj)~="string"then return end a.gifts=a.gifts+1 z.gift,z.giftAt=dj,j()if type(a5 .giftId)=="string"then
local im=be:FindFirstChild("Remotes")local io=im and im:FindFirstChild("GiftThanks")if io then pcall(function()io:FireServer(a5 .giftId)end)end
end bq("Gift("..dj.." from "..tostring(a5 .fromName)..")")g(("GIFT from %s: %s - it will not be waxed"):format(tostring(a5 .fromName),dj))
end local function nc()local ip=be:WaitForChild("Remotes",30)if not a.alive then return end
if not ip then g("Remotes folder missing - no roll events")return end I(r:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local iq=r:GetAttribute("SquishyEquipped")if type(iq)=="string"and iq~=""then c.heldAt=j()end
end))local ni={SquishyRollAnimation=na,InitSquishy=function(ir)z.init,z.initAt=tostring(ir),j()bq("Init("..tostring(ir)..")")end,
CrateUpdate=function(br,is)pcall(md,br)pcall(o.learn,br)if type(br)=="table"then local nd=is==true or(c.rolled~=nil and j()-c.rolledAt<15)or c.waiting
if not nd then return end local ne=not c.waiting local nf=c.on c.waiting,c.data,c.at=true,br,j()
c.on=(is==true)c.title=tostring(br.title or br.name or"crate")if c.on and not nf then c.openedAt,c.byYou=j(),not c.ours
if c.onShow then task.spawn(c.onShow)end end if c.on then bq("CrateWindow open("..c.title..")")
elseif ne then bq("Crate waiting("..c.title..")")g(c.title.." is waiting on your stand")
end else if c.waiting then bq("Crate gone")end c.on,c.waiting,c.data,c.prompt=false,false,nil,nil
local ng=c.byYou c.summonFails,c.ours,c.byYou=0,false,false if c.onGone then task.spawn(c.onGone,ng)end
if c.classify then local nh=j()task.spawn(function()pcall(c.classify,nh)end)end end end,
GiftReceived=nb,}for dk,nj in pairs(ni)do local fd=ip:FindFirstChild(dk)if fd and fd:IsA("RemoteEvent")then I(fd.OnClientEvent:Connect(nj))
elseif dk~="CrateUpdate"and dk~="GiftReceived"then g("remote "..dk.." missing")end end end
local function fe()local a6=bp()if a6 then if aH(a6 .name)then return{state="match",shown=a6 .pretty,src="pad",info=a6}
end return{state="skip",info=a6,level="idle",text=("on pad: %s [%s] - not ticked"):format(a6 .pretty,tostring(a6 .rar))}
end if z.name and(j()-z.at)<4 then if aH(z.name)then return{state="match",shown=N(F(z.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(N(F(z.name)),tostring(z.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function it(nk,nl,nm,nn)
local dl=RaycastParams.new()dl.FilterType=Enum.RaycastFilterType.Exclude local ff={r.Character}
for rh,no in ipairs(nn or{})do ff[#ff+1]=no end dl.FilterDescendantsInstances=ff pcall(function()dl.RespectCanCollide=true end)
local iu=cK:Raycast(Vector3 .new(nk,nl+4,nm),Vector3 .new(0,-30,0),dl)return iu and iu.Position or nil
end local function fg(iv)local iw=iv:FindFirstChildOfClass("Humanoid")return((iw and iw.HipHeight)or 2)+iv.HumanoidRootPart.Size.Y/2+0.2
end local function fh(np,nq)local ix=np:FindFirstChildOfClass("Humanoid")local nr=j()while j()-nr<nq do
if ix and ix.FloorMaterial~=Enum.Material.Air then return true end aG(0.05)end return false
end local function dm(ns,fi,fj)local iy=ns.HumanoidRootPart iy.AssemblyLinearVelocity=Vector3 .new(0,0,0)
iy.CFrame=fj and CFrame.new(fi,Vector3 .new(fj.X,fi.Y,fj.Z))or CFrame.new(fi)end local function dn(av,iz)
local a7=aI()if not a7 or not av then return false end local aN=av.Position local dp=math.clamp(math.max(av.Size.X,av.Size.Z)/2+2.2,3,7)
local iA=(iz and iz.MaxActivationDistance)or 10 if dp>iA-2 then dp=math.max(2.5,iA-2)end
local bX={}local function a8(bY)bY=Vector3 .new(bY.X,0,bY.Z)if bY.Magnitude>0.05 then bX[#bX+1]=bY.Unit end
end local iB=lO()if iB then a8(iB-aN)end a8(av.CFrame.LookVector)a8(-av.CFrame.LookVector)
a8(av.CFrame.RightVector)a8(-av.CFrame.RightVector)a8(a7 .HumanoidRootPart.Position-aN)
if#bX==0 then a8(Vector3 .new(0,0,1))end local nt,dq=fg(a7),false for ri,nu in ipairs(bX)do
local dr=aN+nu*dp local fk=it(dr.X,aN.Y,dr.Z,{av})if fk and math.abs(fk.Y-aN.Y)<14 then
dm(a7,Vector3 .new(dr.X,fk.Y+nt,dr.Z),aN)if fh(a7,0.7)then dq=true break end end end if not dq then
dm(a7,aN+bX[1]*dp+Vector3 .new(0,3,0),aN)dq=fh(a7,1)end aG(0.12)return dq end local function nv(bZ)
if not bZ.Parent or not bZ.Enabled then return false end pcall(function()bZ:InputHoldBegin()end)
aG(math.max(bZ.HoldDuration,0)+0.08)pcall(function()bZ:InputHoldEnd()end)return true end
local function T(iC,nw)local nx=j()while j()-nx<nw do if iC()then return true end aG(0.05)
end return iC()end local function ds(bs,ny,iD,nz)local nA=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for nB,fl in ipairs(nA)do if nB==2 and(nz or not(bs.Parent and bs.Enabled and(not iD or iD())))then break end
local fm if fl=="hold"then fm=nv(bs)else fm=type(fireproximityprompt)=="function"and bs.Parent~=nil and bs.Enabled and pcall(fireproximityprompt,bs)end
if fm and T(ny,1.2)then a.zapFirst=(fl=="zap")return true,fl end end return false end local function iE(fn)
local aO=eE()if not aO or not aO.Enabled then g("buy: nothing on the pad")return false end
local iF=bM(aO)if not iF then g("buy: pad part missing")return false end a.lastBuyAt=j()
local nC,iG=z.seq,aq()dn(iF,aO)if not aO.Enabled then g("buy aborted: pad emptied")return false end
local bt=fe()if not fn and bt.state~="match"then g("buy aborted: "..(bt.text or"pad changed"))
a.matchSince=nil return false end local fo=bt.info and bt.info.name or(bt.state=="match"and z.name)or nil
local function nD()return aO.Enabled and D()==nil and(fn or fe().state=="match")end local nE,nF=ds(aO,function()
return D()~=nil or((not aO.Enabled)and(fn or z.seq==nC))end,nD,ik()~=nil)if nE then T(function()return D()~=nil end,0.8)
local b0=D()local iH=aq()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
z.name,z.rar,z.at=nil,nil,j()g(("BOUGHT %s%s via %s"):format(b0 and N(F(b0))or(bt.shown or"?"),(iG and iH)and(" for $"..an(iG-iH))or"",nF))
if b0 and fo and F(b0)~=F(fo)then g(("note: picked up %s, not %s"):format(b0,fo))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=j()+math.min(8*2^(a.cashFails-1),60)local iI=bp()
g(("BUY REFUSED: cash short? have $%s, price %s"):format(an(aq()),(iI and iI.price)or"?"))
return false end local function iJ()local dt=D()if not dt then a.holding=false g("place: hands are empty")
return false end if not aH(dt)then g(("REFUSED TO WAX %s - it is not ticked"):format(N(F(dt))))
return false end for rj=1,e.PlaceTries do local aP=lR()if not aP then g("place: no free station")break end
local iK=bM(aP)if iK then dn(iK,aP)local iL=D()if not iL then a.holding=false g("place: hands emptied on the way")return false end
if not aH(iL)then g("place: what I carry changed, not waxing it")return false end if aP.Enabled then
local nG,nH=ds(aP,function()return not aP.Enabled end,function()return aP.Enabled end)if nG then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=j()+2.5,0 z.name,z.rar,z.at=nil,nil,j()
g(("WAXED %s #%d at %s via %s"):format(N(F(dt)),a.placed,aP.Parent.Parent.Name,nH))return true
end end end aG(0.25)end a.placeFails=a.placeFails+1 if D()==nil then a.holding=false end
g("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,j()
a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(D()))g(a.capMsg)end return false end local function iM(iN)return type(iN)=="string"and iN:lower():find("crate",1,true)~=nil
end local nI={SABFarmGui=1,SABToggle=1,SABError=1}local function du(nJ)local aQ=nJ while aQ do
if nI[aQ.Name]then return false end if aQ:IsA("ScreenGui")then local nK,nL=pcall(function()return aQ.Enabled end)
return(not nK)or nL~=false end if aQ:IsA("GuiObject")and not aQ.Visible then return false end
aQ=aQ.Parent end return false end local function bu(dv)local bv=""pcall(function()if dv:IsA("TextButton")then bv=dv.Text end end)
if not bv:find("%a")then for rk,dw in ipairs(dv:GetDescendants())do if(dw:IsA("TextLabel")or dw:IsA("TextButton"))and dw.Text:find("%a")then bv=dw.Text break end
end end if not bv:find("%a")then bv=dv.Name end return(bv:lower():gsub("[^%a]",""))end local function nM()
local b1,b2 local iO=r:FindFirstChildOfClass("PlayerGui")if not iO then return nil,nil end
for rl,b3 in ipairs(iO:GetDescendants())do if b3:IsA("GuiButton")and du(b3)then local fp=bu(b3)
if fp:sub(1,4)=="open"and not fp:find("shop",1,true)then b1=b1 or b3 end if fp:sub(1,7)=="discard"then b2=b2 or b3 end
end end if b1 and b2 then return b1,b2 end if c.on then return b1,b2 end return nil,nil
end local dx=(function()local nN,nO=pcall(function()return game:GetService("VirtualInputManager")end)return nN and nO or nil end)()
local function iP(aw,fq)local fr={}local function iQ(nP)fr[#fr+1]=nP end if a.tapWay then iQ(a.tapWay)end
for rm,iR in ipairs({"touch","conn","signal"})do if iR~=a.tapWay then iQ(iR)end end local function iS(nQ,...)
local nR,fs=pcall(getconnections,nQ)if not(nR and type(fs)=="table"and#fs>0)then return false end
local iT,nS,nT=false,{...},select("#",...)for rn,nU in ipairs(fs)do if pcall(function()nU:Fire(table.unpack(nS,1,nT))end)then iT=true end
end return iT end local function iU()local iV=Vector3 .new(0,0,0)pcall(function()local iW,iX=aw.AbsolutePosition,aw.AbsoluteSize
iV=Vector3 .new(iW.X+iX.X/2,iW.Y+iX.Y/2,0)end)local ft={Position=iV,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()ft.UserInputType=Enum.UserInputType.Touch end)pcall(function()ft.UserInputState=Enum.UserInputState.End end)
return ft end for ro,ax in ipairs(fr)do local b4=false if ax=="conn"and type(getconnections)=="function"then
if iS(aw.MouseButton1Click)then b4=true if T(fq,1.5)then a.tapWay=ax return true,ax end
end b4=iS(aw.Activated,iU(),1)elseif ax=="signal"and type(firesignal)=="function"then if pcall(firesignal,aw.MouseButton1Click)then
if T(fq,1.5)then a.tapWay=ax return true,ax end end b4=pcall(firesignal,aw.Activated,iU(),1)
elseif ax=="touch"and dx then b4=pcall(function()local iY,iZ=aw.AbsolutePosition,aw.AbsoluteSize
local i0=0 local i1=aw:FindFirstAncestorWhichIsA("ScreenGui")local nV,nW=pcall(function()return i1 and i1 .IgnoreGuiInset end)
if not(nV and nW)then pcall(function()i0=game:GetService("GuiService"):GetGuiInset().Y end)
end local i2,i3=iY.X+iZ.X/2,iY.Y+iZ.Y/2+i0 dx:SendMouseButtonEvent(i2,i3,0,true,game,1)
task.wait(0.06)dx:SendMouseButtonEvent(i2,i3,0,false,game,1)end)end if b4 and T(fq,1.5)then
a.tapWay=ax return true,ax end end return false end local nX={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function dy(i4)local b5=i4 .Parent while b5 and b5~=a.plot do if nX[b5 .Name]then return false end
b5=b5 .Parent end local fu=(i4 .ActionText or""):lower()if fu:find("roll",1,true)or fu:find("place",1,true)or fu:find("sell",1,true)then return false end
return true end local function i5()if c.prompt and c.prompt.Parent and c.prompt.Enabled then return c.prompt end
if not a.plot then return nil end local i6=a.plot:FindFirstChild("CrateStand")local b6 if i6 then
for rp,dz in ipairs(i6:GetDescendants())do if dz:IsA("ProximityPrompt")and dz.Enabled and dy(dz)then b6=dz break end
end end if not b6 then for rq,aR in ipairs(a.plot:GetDescendants())do if aR:IsA("ProximityPrompt")and aR.Enabled and dy(aR)then
local i7=aR:FindFirstAncestorWhichIsA("Model")local nY=((aR.ActionText or"").." "..(aR.ObjectText or"").." "..aR.Name.." "..(i7 and i7 .Name or"")):lower()
if nY:find("crate",1,true)then b6=aR break end end end end c.prompt=b6 return b6 end local function fv()
if c.on then return true end local b7=i5()if not b7 then c.summonFails=c.summonFails+1 c.lastFail=j()
g("crate: cannot find where to open "..c.title.." - open it once by hand, then DUMP")return false
end local i8=bM(b7)if i8 then dn(i8,b7)end c.ours=true ds(b7,function()return c.on end)
if T(function()return c.on end,3)then c.summonFails=0 return true end c.ours=false c.summonFails=c.summonFails+1
c.lastFail=j()g("crate: pressed "..ae(b7).." but no window came up")return false end do
local function nZ(i9)local bw=i9 .Parent while bw and bw:IsA("GuiObject")do local i_,ja=false,false
for rr,b8 in ipairs(bw:GetDescendants())do if b8~=i9 and b8:IsA("GuiButton")and bu(b8):sub(1,7)=="discard"then i_=true end
if b8:IsA("TextLabel")then local fw=b8 .Text:lower()if fw:find("crate",1,true)or fw:find("can contain",1,true)or fw:find("cost",1,true)then ja=true end
end if i_ and ja then return bw end end bw=bw.Parent end end function c.findWin()if c.win and c.win.Parent then return c.win end
local jb=r:FindFirstChildOfClass("PlayerGui")if not jb then return nil end for rs,dA in ipairs(jb:GetDescendants())do
if dA:IsA("GuiButton")and not dA:FindFirstAncestor("SABFarmGui")and bu(dA):sub(1,4)=="open"then
local fx=nZ(dA)if fx then c.win=fx return fx end end end end local function n0(n1)for rt,dB in ipairs(n1:GetDescendants())do
if dB:IsA("GuiButton")then local jc,fy=bu(dB),dB.Name:lower()if jc=="x"or jc=="close"or fy=="x"or fy:find("close",1,true)or fy:find("exit",1,true)then return dB end
end end end c.onShow=function()c.win=nil c.findWin()end c.onGone=function(n2)task.wait(n2 and 4 or 1.2)
if c.on or c.waiting then return end local dC=c.findWin()if not dC or not du(dC)then return end
local jd=n0(dC)if jd and iP(jd,function()return not du(dC)end)then return end g("the crate window is still open - tap its X")
end end local function dD(dE)if not fv()then return false end local je=j()-(c.openedAt or 0)
if je<0.6 then aG(0.6-je)end local fz=c.title local n3,n4=nM()local jf=dE and n3 or n4 if not jf then
c.lastFail=j()a.crateFails=a.crateFails+1 g(("crate: no %s button found in %s"):format(dE and"Open"or"Discard",fz))
return false end local n5=D()local n6,ru=iP(jf,function()return(not c.on)or(D()~=nil and D()~=n5)
end)if not n6 then c.lastFail=j()a.crateFails=a.crateFails+1 g("crate: could not press "..(dE and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if dE then a.crates=a.crates+1 T(function()return D()~=nil end,1.5)
local jg=D()g(("OPENED %s -> %s"):format(fz,jg and N(F(jg))or"?"))else g("discarded "..fz.." (nothing ticked in it)")
end return true end c.calls={}function c.saw(n7,...)local n8=select("#",...)c.calls[#c.calls+1]={t=j(),m=n7,n=n8,args={...},data=c.data,
crate=c.data and c.data.name,title=c.title,rar=c.data and c.data.rarity}if#c.calls>12 then table.remove(c.calls,1)end
end function c.slot(ac,ay)local aS=type(ac)if(aS=="string"or aS=="number")and type(ay.data)=="table"then
for jh,fA in pairs(ay.data)do if fA==ac and type(jh)=="string"and(type(fA)=="string"or type(fA)=="number")then
return{__slot="f:"..jh}end end end if aS=="string"then if ay.crate and ac==ay.crate then return{__slot="crate"}end
if ay.title and ac==ay.title then return{__slot="title"}end if ay.rar and ac==ay.rar then return{__slot="rarity"}end
return ac end if aS=="number"or aS=="boolean"or aS=="nil"then return ac end if aS=="table"then
local ji={}for n9,jj in pairs(ac)do if type(jj)=="table"then return nil,"nested table"end
local n_,jk=c.slot(jj,ay)if jk then return nil,jk end ji[n9]=n_ end return ji end local oa,ob=pcall(function()return ac:IsA("Instance")end)
if oa and ob then if ac==r then return{__slot="player"}end if a.plot and ac==a.plot then return{__slot="plot"}end
local dF=a.plot and a.plot:FindFirstChild("CrateStand")if dF and ac==dF then return{__slot="stand"}end
if dF and ac.Parent==dF then return{__slot="model"}end end return nil,"a value it cannot rebuild ("..aS..")"
end function c.resolve(dG)if type(dG)~="table"then return dG end local ai=dG.__slot if ai and ai:sub(1,2)=="f:"then return c.data and c.data[ai:sub(3)]end
if ai=="crate"then return c.data and c.data.name end if ai=="title"then return(c.data and c.data.title)or c.title end
if ai=="rarity"then return c.data and c.data.rarity end if ai=="player"then return r end
if ai=="plot"then return a.plot end if ai=="stand"or ai=="model"then local fB=a.plot and a.plot:FindFirstChild("CrateStand")
if ai=="stand"or not fB then return fB end for rv,jl in ipairs(fB:GetChildren())do if iM(jl.Name)then return jl end end
return nil end local jm={}for oc,od in pairs(dG)do jm[oc]=c.resolve(od)end return jm end
function c.classify(fC)if c.directOff then return end local dH={}for rw,fD in ipairs(c.calls)do
if fD.t<=fC+0.05 and fC-fD.t<=6 then dH[#dH+1]=fD end end if#dH==0 then return end if not T(function()return(c.heldAt or 0)>=fC-1 end,2.5)then return end
local b9={}for rx,b_ in ipairs(dH)do local jn={}for jo=1,b_.n do local oe,jp=c.slot(b_.args[jo],b_)
if jp then g("crate call has "..jp.." - keeping the button method")return end jn[jo]=oe
end b9[#b9+1]={m=b_.m,n=b_.n,args=jn}end local fE=c.learned c.learned={seq=b9,mode=fE and fE.mode or nil}
C.dirty=true if not fE then g(("learned how to open crates directly (%d call%s)"):format(#b9,#b9==1 and""or"s"))end
end function c.replay()local jq=c.learned local jr=be:FindFirstChild("Remotes")local fF=jr and jr:FindFirstChild("CrateAction")
if not(jq and fF)then return false end local js=table.unpack or unpack c.replaying=true
for ry,ca in ipairs(jq.seq)do local fG={}for jt=1,ca.n do fG[jt]=c.resolve(ca.args[jt])end
task.spawn(function()pcall(function()if ca.m=="InvokeServer"then fF:InvokeServer(js(fG,1,ca.n))
else fF:FireServer(js(fG,1,ca.n))end end)end)task.wait(0.2)end c.replaying=false return true
end function c.esc(of)return(of:gsub("[%%|;=,\n]",function(og)return("%%%02X"):format(og:byte())end))end
function c.enc(a9)local dI=type(a9)if dI=="string"then return"s"..c.esc(a9)end if dI=="number"then return"n"..tostring(a9)end
if dI=="boolean"then return a9 and"b1"or"b0"end if dI=="nil"then return"z"end if a9 .__slot then return"k"..a9 .__slot end
local fH={}for oh,oi in pairs(a9)do fH[#fH+1]=c.enc(oh).."="..c.enc(oi)end return"t"..table.concat(fH,",")
end function c.dec(ju)local cb,cc=ju:sub(1,1),ju:sub(2)local function oj(ol)return(ol:gsub("%%(%x%x)",function(om)return string.char(tonumber(om,16))end))end
if cb=="s"then return oj(cc)end if cb=="n"then return tonumber(cc)end if cb=="b"then return cc=="1"end
if cb=="k"then return{__slot=cc}end if cb=="t"then local jv={}for oo in cc:gmatch("[^,]+")do
local jw,op=oo:match("^(.-)=(.*)$")if jw then local jx=c.dec(jw)if jx~=nil then jv[jx]=c.dec(op)end
end end return jv end return nil end function c.goneOrNew(oq)return function()if not c.waiting then return true end
local jy=D()return jy~=nil and jy~=oq end end function c.smart()local fI=c.title local a_=c.learned
if a_ then local fJ=D()if c.on then c.replay()if T(c.goneOrNew(fJ),3.5)then a.crates=a.crates+1
g("OPENED "..fI.." (direct)")return true end else if a_.mode~="window"then c.replay()if T(c.goneOrNew(fJ),3.5)then
a.crates,c.fails=a.crates+1,0 if a_.mode~="direct"then a_.mode,C.dirty="direct",true g("crates now open directly - the window never comes up")
end g("OPENED "..fI.." (direct, no window)")return true end end if fv()then c.replay()if T(c.goneOrNew(fJ),3.5)then
a.crates,c.fails=a.crates+1,0 if a_.mode~="window"then a_.mode,C.dirty="window",true g("crates need their window up first - it shows briefly")
end g("OPENED "..fI.." (direct, window up)")return true end end end c.fails=(c.fails or 0)+1
c.lastBad,c.learned,C.dirty=a_,nil,true if c.fails>=3 then c.directOff=true g("direct crate opening failed 3 times - using the button for now (see DUMP)")
else g("the learned crate call did not work - back to pressing Open")end end return dD(true)
end function f.snap()return{rules=r:GetAttribute("AutoRollRules"),stop=r:GetAttribute("AutoRollStop"),
on=r:GetAttribute("AutoRollOn"),main=r:GetAttribute("AutoRoll")}end f.cache={}function f.watchCache()
f.cache=f.snap()for ot,jz in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do
I(r:GetAttributeChangedSignal(jz):Connect(function()f.cache[ot]=r:GetAttribute(jz)end))
end end function f.isOn()return r:GetAttribute("AutoRollOn")==true end function f.saw(ou,...)
local dJ=f.cache local ov={m=ou,n=select("#",...),args={...},before={rules=dJ.rules,stop=dJ.stop,on=dJ.on,main=dJ.main}}
task.delay(1.5,function()if a.alive then pcall(f.learnOne,ov)end end)end function f.learnOne(cd)
local P,ce=f.snap(),cd.before local dK=(P.rules~=ce.rules)or(P.stop~=ce.stop)local jA=(P.on~=ce.on)or(P.main~=ce.main)
if not dK and not jA then return end local jB={}for jC=1,cd.n do local af=cd.args[jC]local ba=type(af)
if ba=="string"and af~=""and af==P.rules then af={__slot="rules"}elseif ba=="string"and af~=""and dK and af==P.stop and P.stop~=ce.stop then af={__slot="stop"}
elseif ba=="table"then local jD={}for ow,bx in pairs(af)do if type(bx)=="table"or(type(bx)=="userdata")then
f.msg="Auto Roll sends something I cannot repeat"return end jD[ow]=(type(bx)=="string"and bx~=""and bx==P.rules)and{__slot="rules"}or bx
end af=jD elseif ba~="string"and ba~="number"and ba~="boolean"and ba~="nil"then if af==r then af={__slot="player"}else f.msg="Auto Roll sends something I cannot repeat"return end
end jB[jC]=af end local by={m=cd.m,n=cd.n,args=jB}if dK then local fK=false for ox=1,by.n do
local cf=by.args[ox]if type(cf)=="table"and cf.__slot=="rules"then fK=true end if type(cf)=="table"and not cf.__slot then
for rz,jE in pairs(cf)do if type(jE)=="table"and jE.__slot=="rules"then fK=true end end
end end if fK then f.rec.rules={by}else table.insert(f.rec.rules,by)if#f.rec.rules>60 then table.remove(f.rec.rules,1)end
end end if jA then if P.on==true then f.rec.on=by else f.rec.off=by end e.AutoRoll=(P.on==true)
end if P.rules and P.rules~=""then e.ARrules,e.ARstop=P.rules,P.stop or""end C.dirty=true
f.msg=""g(("learned an Auto Roll %s message"):format(dK and"choices"or(P.on and"on"or"off")))
end function f.resolve(bz)if type(bz)~="table"then return bz end if bz.__slot=="rules"then return e.ARrules~=""and e.ARrules or r:GetAttribute("AutoRollRules")end
if bz.__slot=="stop"then return e.ARstop~=""and e.ARstop or r:GetAttribute("AutoRollStop")end
if bz.__slot=="player"then return r end local jF={}for oy,oz in pairs(bz)do jF[oy]=f.resolve(oz)end
return jF end function f.replay(jG,oA)local jH=table.unpack or unpack for rA,cg in ipairs(oA)do
local fL={}for jI=1,cg.n do fL[jI]=f.resolve(cg.args[jI])end f.replaying=true pcall(function()
if cg.m=="InvokeServer"then task.spawn(function()pcall(function()jG:InvokeServer(jH(fL,1,cg.n))end)end)
else jG:FireServer(jH(fL,1,cg.n))end end)f.replaying=false task.wait(0.25)end end function f.apply(jJ,oB)
if f.busy or not a.alive then return end f.busy=true pcall(function()local jK=be:FindFirstChild("Remotes")
local fM=jK and jK:FindFirstChild("AutoRollAction")if not fM then f.msg="this game has no AutoRollAction"return end
local aT=e.AutoRoll if aT and e.ARrules~=""and r:GetAttribute("AutoRollRules")~=e.ARrules then
if#f.rec.rules==0 then f.msg="pick your Auto Roll choices once in the game's menu so I can learn them"
g(f.msg)else f.replay(fM,f.rec.rules)if T(function()return r:GetAttribute("AutoRollRules")==e.ARrules end,4)then
g("Auto Roll choices put back")else f.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"
g(f.msg)end end end if aT==f.isOn()or(not aT and not oB)then return end local dL=aT and f.rec.on or f.rec.off
if not dL then local ci=aT and f.rec.off or f.rec.on local jL=ci~=nil for oC=1,ci and ci.n or 0 do
if type(ci.args[oC])=="boolean"then jL=false end end if jL then dL=ci end end if not dL then
f.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(aT and"on"or"off")
g(f.msg)return end f.replay(fM,{dL})if T(function()return f.isOn()==aT end,4)then f.msg=""
g(("Auto Roll switched %s%s"):format(aT and"ON"or"OFF",jJ and(" ("..jJ..")")or""))else f.msg="Auto Roll did not switch - do it once in the game so I can relearn it"
g(f.msg)end end)f.busy=false end local oD={"sell","trash","discard","dispose","bin"}local function fN(dM)
if type(dM)~="string"then return false end dM=dM:lower()for rB,oE in ipairs(oD)do if dM:find(oE,1,true)then return true end end
return false end local function oF()local jM=be:FindFirstChild("Remotes")local fO=jM and jM:FindFirstChild("SellSquishy")
if not(fO and fO:IsA("RemoteEvent"))then return false end if not pcall(function()fO:FireServer()end)then return false end
return T(function()return D()==nil end,1.5)end local function oG()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if j()-a.sellSearchAt<20 then return nil end a.sellSearchAt=j()local jN=aI()local jO=jN and jN.HumanoidRootPart.Position
local cj,jP for rC,bA in ipairs((a.plot or cK):GetDescendants())do if bA:IsA("ProximityPrompt")and(fN(bA.ActionText)or fN(bA.ObjectText)or fN(bA.Name))then
local jQ=ha(bA)local fP=(jQ and jO)and(jQ-jO).Magnitude or 1e9 if fP<=400 and(not cj or fP<jP)then cj,jP=bA,fP end
end end a.sellSpot=cj a.noSellSpot=(cj==nil)return cj end local function jR()local fQ=D()
if not fQ then a.holding=false return false end if aH(fQ)then return false end local fR=N(F(fQ))
if oF()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=j()+2.5,0
g("SOLD "..fR)return true end local bB=oG()if bB then local jS=bM(bB)if jS then dn(jS,bB)
local jT=D()if jT and not aH(jT)then local oH,oI=ds(bB,function()return D()==nil end,function()return bB.Enabled end)
if oH then a.sold,a.holding,a.sellFails=a.sold+1,false,0 g(("SOLD %s at %s via %s"):format(fR,ae(bB),oI))
return true end end end end a.sellFails=a.sellFails+1 g("could not sell "..fR.." ("..a.sellFails..")")
return false end local oJ={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function oK(bC)local dN=ae(bC):lower()for rD,oL in ipairs(oJ)do if dN:find(oL,1,true)then return 0 end end
local ap,J=bC.Name:lower(),0 local function aj(oM,oN)return oM:find(oN,1,true)~=nil end
if aj(ap,"collect")then J=J+60 end if aj(ap,"cash")or aj(ap,"money")then J=J+45 end if aj(ap,"income")or aj(ap,"claim")then J=J+35 end
if aj(ap,"coin")or aj(ap,"earn")or aj(ap,"green")then J=J+20 end if ap=="pad"or ap=="touch"then J=J+25 end
if J==0 and(aj(dN,"collect")or aj(dN,"cash")or aj(dN,"money"))then J=25 end if J==0 then return 0 end
local ck=bC.Color if ck.G>0.5 and ck.G>ck.R*1.4 and ck.G>ck.B*1.4 then J=J+15 end if math.min(bC.Size.X,bC.Size.Y,bC.Size.Z)<2 then J=J+5 end
return J end local function oO()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or j()-a.padSearchAt<20 then return nil end a.padSearchAt=j()local dO,cl,fS={},nil,29
for rE,dP in ipairs(a.plot:GetDescendants())do if dP:IsA("BasePart")then local dQ=oK(dP)
if dQ>0 then dO[#dO+1]={s=dQ,p=dP}if dQ>fS then cl,fS=dP,dQ end end end end table.sort(dO,function(oP,oQ)return oP.s>oQ.s end)
a.padCands,a.padPart=dO,cl if cl then g("collect pad: "..ae(cl).." (score "..fS..")")end
return cl end local fT="SAB_pad_v1.txt"local function oR(oS)if type(writefile)=="function"then pcall(writefile,fT,table.concat({oS:GetComponents()},","))end
end local function oT()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local oU,jU=pcall(function()if isfile(fT)then return readfile(fT)end end)if not oU or type(jU)~="string"then return nil end
local dR={}for oV in jU:gmatch("[^,]+")do dR[#dR+1]=tonumber(oV)end if#dR==12 then return CFrame.new(unpack(dR))end
end local function oW(fU,dS,oX)local oY=fg(fU)local fV=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local ak=(fV and fV:IsA("BasePart"))and(fV.Position-dS)or Vector3 .new(1,0,0)ak=Vector3 .new(ak.X,0,ak.Z)
if ak.Magnitude<0.05 then ak=Vector3 .new(1,0,0)end ak=ak.Unit for oZ=0,7 do local dT=oZ*math.pi/4
local o0=Vector3 .new(ak.X*math.cos(dT)-ak.Z*math.sin(dT),0,ak.X*math.sin(dT)+ak.Z*math.cos(dT))
local dU=dS+o0*(oX+5)local fW=it(dU.X,dS.Y,dU.Z)if fW and math.abs(fW.Y-dS.Y)<8 then dm(fU,Vector3 .new(dU.X,fW.Y+oY,dU.Z))
if fh(fU,0.7)then return true end end end return false end local function o1()a.lastCollect=j()
local cm=aI()if not cm then return end local jV,o2=cm.HumanoidRootPart,fg(cm)local cn,jW,co,fX=nil,4,nil,"?"
local fY=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and fY and fY:IsA("BasePart")then
cn,fX=(fY.CFrame*a.manualPad).Position,"manual pad"else local az=oO()if az then cn=Vector3 .new(az.Position.X,az.Position.Y+az.Size.Y/2+o2,az.Position.Z)
jW,co,fX=math.max(az.Size.X,az.Size.Z)/2,az,az.Name end end if not cn then g("COLLECT: pad not found - stand on it and tap SET PAD")return end
local fZ=aq()dm(cm,cn)if co and type(firetouchinterest)=="function"then pcall(firetouchinterest,jV,co,0)end
aG(e.PadDwell)if co and type(firetouchinterest)=="function"then pcall(firetouchinterest,jV,co,1)end
aG(0.5)a.collected=a.collected+1 local f0=aq()g(("COLLECTED (%s) %s"):format(fX,(fZ and f0 and f0>fZ)and("+$"..an(f0-fZ))or"no cash change seen"))
oW(cm,cn,jW)end local cp local function jX()if a.capHit then if e.AutoStart and j()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 g("trying again after being stopped for 5 minutes")cp(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not aI()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aJ(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local f1,jY=ey()local dV=D()if dV then local cq=N(F(dV))if not aH(dV)then local f2=(z.gift and F(z.gift)==F(dV)and j()-z.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cq,f2),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cq,f2),"bad"
end return"sell",("selling %s (%s)"):format(cq,f2),"warn"end if f1<1 then return nil,("holding %s - 0 free stations"):format(cq),"wait"end
return"place",("waxing %s (%d free)"):format(cq,f1),"ok"end a.holding=false if e.Crates and not c.waiting and j()-(c.scanAt or 0)>1 then
c.scanAt=j()local f3=a.plot:FindFirstChild("CrateStand")if f3 then for rF,cr in ipairs(f3:GetDescendants())do
if cr:IsA("ProximityPrompt")and cr.Enabled and dy(cr)then local aA=cr.ObjectText if aA==""then aA=bk(f3,"TitleLabel")or""end
if aA~=""and o.wanted(aA)then local o3=cN(aA):gsub("crate$","")local jZ for j0 in pairs(A.members)do if cN(j0)==o3 then jZ=j0 end end
c.waiting,c.at,c.title,c.prompt=true,j(),aA,cr c.data={name=(aA:gsub("%s","")),rarity=jZ,title=aA}
g(aA.." found waiting on your stand")end break end end end end local j1=o.wanted(c.data and c.data.name)or o.wanted(c.title)
if e.Crates and(c.on or c.waiting)and j1 then local aB=c.title if j()<(c.ignoreUntil or 0)then
return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aB),"bad"
end if c.on then if a.crateFails>=3 then c.ignoreUntil,a.crateFails=j()+120,0 g("could not press the "..aB.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aB),"bad"end if j()-c.lastFail<8 then
return nil,("%s window open - could not press its buttons"):format(aB),"bad"end if c.byYou and j()-c.openedAt<60 then
return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(aB,math.ceil(60-(j()-c.openedAt))),"idle"
end return"cratesmart",("opening %s"):format(aB),"ok"end if c.summonFails>=3 then return nil,("%s waiting - could not open it, open it by hand then DUMP"):format(aB),"bad"
end if j()-c.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aB),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aB,(c.learned and c.learned.mode~="window")and" directly"or""),"ok"
end if(c.on or c.waiting)and not j1 then local j2=c.title..tostring(c.rolledAt)if c.told~=j2 then
c.told=j2 g(c.title.." is not ticked - leaving it to the game")end end if c.rolled and not c.waiting and j()-c.rolledAt<6 and o.wanted(c.rolled)then
return nil,c.rolled.." rolled - waiting for it to land","wait"end if f1<1 then a.matchSince=nil
return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(jY,jY),"wait"end local f4=eE()
if not f4 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local cs=bp()
if cs and iM(cs.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(cs.name),"idle"end
if j()-c.lastFail<8 then return nil,("%s on the pad - could not open it"):format(cs.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(cs.name),"ok"end local aU=fe()
if aU.state~="match"then a.matchSince=nil if aU.state=="skip"and not f4 .Enabled then return nil,aU.text.." (sold out)","idle"end
return nil,aU.text,aU.level end if not f4 .Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local ct=j()if ct<a.noCashUntil then local j3,o4=ik()if j3 then return nil,("cash short: have $%s, price ~$%s"):format(an(j3),an(o4)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(an(aq()),math.ceil(a.noCashUntil-ct)),"bad"
end if ct-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or ct
local j4=ct-a.matchSince if j4<e.Confirm then return nil,("confirming %s (%.2fs)"):format(aU.shown,j4),"ok"end
return"buy",("buying %s via %s"):format(aU.shown,aU.src),"ok"end local function ag(o5,o6,...)
if a.busy then return end a.busy,a.busyText=true,o5 local o7,j5=pcall(o6,...)a.busy,a.busyText=false,""
if not o7 and j5~=ek then g("ERR "..tostring(j5))end end local function o8()local bb,o9,o_=jX()
a.reason,a.level=o9,o_ if bb=="place"then ag("waxing...",iJ)elseif bb=="crate"then ag("opening crate...",dD,true)
elseif bb=="cratesmart"then ag("opening crate...",c.smart)elseif bb=="cratewin"then ag("opening the crate window...",fv)
elseif bb=="nocrate"then ag("discarding crate...",dD,false)elseif bb=="sell"then ag("selling...",jR)
elseif bb=="buy"then ag("buying...",iE,false)elseif e.Collect and not a.matchSince and j()-a.lastCollect>=e.Every then
ag("collecting money...",o1)end end function cp(dW,pa)if dW==a.running then return end a.running=dW
if not pa then e.AutoStart=dW end if dW then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
c.lastFail,c.summonFails,c.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=j()
a.plot=aJ()or a.plot g("START")else a.reason="stopped"g("STOP")end end local function f5()
local f6={}local function l(pb)f6[#f6+1]=tostring(pb)end l("=== SAB "..aZ.." DUMP "..os.date("%H:%M:%S").." ===")
l(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
l("reason: "..tostring(a.reason))l("targets: "..table.concat(hT(),", "))l(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
l("cash="..an(aq()))local pc,j6=D()l("in hands: "..tostring(pc)..(j6 and(" ("..j6 .ClassName..")")or"")..
"  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-j())))
l("  attribute SquishyEquipped = "..tostring(r:GetAttribute("SquishyEquipped")))local j7=a.plot and a.plot:FindFirstChild("SquishyEquipped")
l("  plot.SquishyEquipped = "..(j7 and(#j7:GetChildren().." children")or"missing"))local f7=r.Character
if f7 then local f8={}for rG,cu in ipairs(f7:GetDescendants())do if(cu:IsA("Model")or cu:IsA("Tool"))and cu.Name~=f7 .Name then f8[#f8+1]=cu.ClassName..":"..cu.Name end
end l("  on the character: "..(table.concat(f8,", "):sub(1,300)))end local dX=bp()l("on pad: "..(dX and("%s [%s] %s"):format(dX.name,tostring(dX.rar),tostring(dX.price))or"nothing"))
l("sell spot: "..(a.sellSpot and ae(a.sellSpot)or"none found"))l("--- CRATES ---")l(("waiting=%s windowOpen=%s title=%s rolled=%s (%ss ago) opened=%d tapWay=%s fails=%d/%d"):format(
tostring(c.waiting),tostring(c.on),c.title,tostring(c.rolled),c.rolledAt>0 and string.format("%.0f",j()-c.rolledAt)or"-",
a.crates,tostring(a.tapWay),a.crateFails,c.summonFails))l("--- AUTO ROLL ---")local dY=f.snap()
l(("game: AutoRollOn=%s AutoRoll=%s stop=%s rules=%s"):format(tostring(dY.on),tostring(dY.main),
tostring(dY.stop),tostring(dY.rules)))l(("wanted: %s  choices to put back: %s (stop %s)  note: %s"):format(tostring(e.AutoRoll),
e.ARrules~=""and e.ARrules or"-",e.ARstop~=""and e.ARstop or"-",f.msg~=""and f.msg or"-"))
local function f9(f_)local j8={}for j9=1,f_.n do local dZ=f_.args[j9]j8[j9]=type(dZ)=="table"and(dZ.__slot and("<"..dZ.__slot..">")or"{table}")or("%q"):format(tostring(dZ))
end return("AutoRollAction:%s(%s)"):format(f_.m,table.concat(j8,", "))end for pd,pe in ipairs(f.rec.rules)do l(("  choices %d: %s"):format(pd,f9(pe)))end
if f.rec.on then l("  on:  "..f9(f.rec.on))end if f.rec.off then l("  off: "..f9(f.rec.off))end
if#f.rec.rules==0 and not f.rec.on and not f.rec.off then l("  nothing learned yet")end
l("--- CRATE OPENING ---")local function d0(aV,d1)d1=d1 or 0 local j_=type(aV)if j_=="string"then return("%q"):format(aV)end
if j_=="table"then if aV.__slot then return"<"..aV.__slot..">"end if d1>1 then return"{...}"end
local ga={}for pf,pg in pairs(aV)do ga[#ga+1]=tostring(pf).."="..d0(pg,d1+1)end return"{"..table.concat(ga,",").."}"
end local ph,ka=pcall(function()return aV.ClassName end)if ph and ka then return"<"..ka.." "..ae(aV)..">"end
return tostring(aV)end l("watching CrateAction: "..tostring(c.oldNC~=nil).."  hookmetamethod="..type(hookmetamethod))
if c.learned then l("learned (mode "..tostring(c.learned.mode or"untried").."):")for pj,gb in ipairs(c.learned.seq)do
local kb={}for kc=1,gb.n do kb[kc]=d0(gb.args[kc])end l(("  %d. CrateAction:%s(%s)"):format(pj,gb.m,table.concat(kb,", ")))
end else l("not learned yet - it learns from the next crate that opens")end if c.directOff then l("direct opening is OFF for this session after 3 failures")end
if c.lastBad then l("last call that failed:")for pk,gc in ipairs(c.lastBad.seq)do local kd={}
for ke=1,gc.n do kd[ke]=d0(gc.args[ke])end l(("  %d. CrateAction:%s(%s)"):format(pk,gc.m,table.concat(kd,", ")))
end end l("CrateAction calls seen:")for rH,cv in ipairs(c.calls or{})do local kf={}for kg=1,cv.n do kf[kg]=d0(cv.args[kg])end
l(("  %.0fs ago  %s(%s)  [crate=%s]"):format(j()-cv.t,cv.m,table.concat(kf,", "),tostring(cv.crate)))
end local bD=c.findWin()if bD and type(getconnections)=="function"then l("how the game wired its crate window buttons (handler counts):")
for rI,cw in ipairs(bD:GetDescendants())do if cw:IsA("GuiButton")then local gd={}for rJ,kh in ipairs({"MouseButton1Click","MouseButton1Down","MouseButton1Up","Activated",
"InputBegan","InputEnded","TouchTap"})do local pl,ki=pcall(function()return getconnections(cw[kh])end)
local kj=(pl and type(ki)=="table")and#ki or-1 if kj~=0 then gd[#gd+1]=kh.."="..kj end end
l(("  %s %s %q: %s"):format(cw.ClassName,cw.Name,bu(cw),table.concat(gd," ")))end end end
l(("crate window: %s visible=%s mine=%s yours=%s"):format(bD and ae(bD)or"not found",tostring(bD and bD.Visible),tostring(c.ours),tostring(c.byYou)))
local d2=i5()l("crate prompt: "..(d2 and(ae(d2).." ["..d2 .ActionText.."|"..d2 .ObjectText.."]")or"none found"))
local kk=a.plot and a.plot:FindFirstChild("CrateStand")if kk then local ge=0 for rK,bc in ipairs(kk:GetDescendants())do
ge=ge+1 if ge>30 then l("  ...")break end local kl=""if bc:IsA("ProximityPrompt")then kl=(" [%s|%s|on=%s|hold=%.2f]"):format(bc.ActionText,bc.ObjectText,tostring(bc.Enabled),bc.HoldDuration)end
l("  CrateStand/"..ae(bc):gsub("^.-CrateStand%.","").." ("..bc.ClassName..")"..kl)end else
l("  no CrateStand in the plot")end l("enabled prompts in the plot:")if a.plot then for rL,bE in ipairs(a.plot:GetDescendants())do
if bE:IsA("ProximityPrompt")and bE.Enabled then l(("  %s [%s|%s] safe=%s"):format(ae(bE),bE.ActionText,bE.ObjectText,tostring(dy(bE))))
end end end local km=r:FindFirstChildOfClass("PlayerGui")if km then l("buttons on screen that say open/discard:")
for rM,cx in ipairs(km:GetDescendants())do if cx:IsA("GuiButton")and du(cx)then local gf=bu(cx)
if gf:find("open",1,true)or gf:find("discard",1,true)then l(("  %s %s -> %q"):format(cx.ClassName,ae(cx),gf))
end end end end l("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(dx~=nil))
l("--- CATALOG ("..A.n.." butters, worst rarity first) ---")for rN,d3 in ipairs(A.rarOrder)do
local gg={}for rO,kn in ipairs(A.members[d3]or{})do gg[#gg+1]=(e.Targets[kn]and"*"or"")..N(kn)
end l(("  [%s]%s %s"):format(d3,C.price[d3]and(" crate $"..an(C.price[d3]))or"",table.concat(gg,", ")))
end l("learned orders: ")for pm,pn in pairs(C.order)do l("  "..pm..": "..table.concat(pn,", "))end
l("--- PLOT ---")l("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for rP,gh in ipairs(a.plot:GetChildren())do
l(("  %s %s (%d)"):format(gh.ClassName,gh.Name,#gh:GetChildren()))end local po,pp=ey()l(("stations free %d / %d"):format(po,pp))
local gi=eE()l("BuyPrompt: "..(gi and("enabled="..tostring(gi.Enabled).." hold="..gi.HoldDuration)or"MISSING"))
end l("autostart="..tostring(e.AutoStart).." rejoin="..tostring(e.Rejoin))l(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))l("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#e0())l("--- COLLECT PAD ---")
l("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and ae(a.padPart)or"none"))
l("--- ATTRIBUTES ---")for rQ,ko in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
l(("  %s = %s"):format(ko,tostring(r:GetAttribute(ko))))end l("--- EVENTS ---")for pq=math.max(1,#a0-15),#a0 do l("  "..a0[pq])end
l("--- LOG ---")for pr=math.max(1,#aF-25),#aF do l("  "..aF[pr])end return table.concat(f6,"\n")
end do local aW=eZ(O.auto)if type(aW)=="string"then aW=aW:gsub("%s+$","")if aW~=""then a.autoload=aW
local ps=h5(aW)g(ps and("loaded config "..aW)or("config "..aW.." could not be loaded"))
end end end local d={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local pt={ok=d.good,wait=d.warn,warn=d.warn,bad=d.bad,idle=d.dim}
local kp={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function x(pu,pv,pw)
local px,gj=pcall(Instance.new,pu)if not px then a.uiErrs=a.uiErrs+1 return nil end for py,pz in pairs(pv)do
if not pcall(function()gj[py]=pz end)then a.uiErrs=a.uiErrs+1 end end gj.Parent=pw return gj
end local function Q(pA,pB)x("UICorner",{CornerRadius=UDim.new(0,pB or 6)},pA)end local b={}
local gk=r:FindFirstChildOfClass("PlayerGui")or r:WaitForChild("PlayerGui")local kq=gk:FindFirstChild("SABFarmGui")
if kq then kq:Destroy()end local gl=x("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},gk)
local K={w=320,h=330,head=30,strip=38,tabs=26}b.root=x("Frame",{Name="Root",Size=UDim2 .new(0,K.w,0,K.h),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=d.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},gl)
Q(b.root,10)x("UIStroke",{Color=d.line,Thickness=1},b.root)local bd=UDim2 .new(1,0,1,0)
local function u(kr,ks)return UDim2 .new(kr,0,0,0),UDim2 .new(ks,(kr+ks>0.99)and 0 or-4,1,0)end
local function v(pC,pD,pE,pF,pG,pH)local kt=x("TextButton",{Text=pD,Position=pG,Size=pH,BackgroundColor3=pE,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=pF,TextColor3=d.text,AutoButtonColor=true},pC)Q(kt,6)
return kt end local function ku(pI,pJ,pK,pL,pM)local gm=x("TextBox",{Text=pJ,PlaceholderText=pK,Position=pL,Size=pM,BackgroundColor3=d.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=d.text,PlaceholderColor3=d.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},pI)Q(gm,6)x("UIPadding",{PaddingLeft=UDim.new(0,8)},gm)
return gm end local d4=cK.CurrentCamera local function pN()local pO,d5=pcall(function()return d4 and d4 .ViewportSize end)
if pO and d5 and d5 .X>50 and d5 .Y>50 then return d5 end end local function aX(cy)local gn=pN()
if not(gn and cy and cy.Parent)then return end local pP=pcall(function()local d6,kv=cy.AbsolutePosition,cy.AbsoluteSize
local go=70 local kw=math.clamp(d6 .X,go-kv.X,gn.X-go)local kx=math.clamp(d6 .Y,0,gn.Y-math.min(kv.Y,go))
if math.abs(kw-d6 .X)>0.5 or math.abs(kx-d6 .Y)>0.5 then cy.Position=UDim2 .new(0,math.floor(kw),0,math.floor(kx))
end end)return pP end local function d7(pQ)local pR,gp=pcall(function()return pQ.AbsolutePosition end)
if pR and gp then return{math.floor(gp.X),math.floor(gp.Y)}end end local d8={}local function ky(d9,kz,kA)
I(d9 .InputBegan:Connect(function(cz)if cz.UserInputType~=Enum.UserInputType.MouseButton1 and cz.UserInputType~=Enum.UserInputType.Touch then return end
d8[d9]={start=cz.Position,from=kz.Position,moved=0,target=kz}local gq gq=cz.Changed:Connect(function()
if cz.UserInputState==Enum.UserInputState.End then local kB=d8[d9]d8[d9]=nil if gq then gq:Disconnect()end
if kB and kA then kA(kB.moved)end end end)end))end I(lA.InputChanged:Connect(function(d_)
if d_.UserInputType~=Enum.UserInputType.MouseMovement and d_.UserInputType~=Enum.UserInputType.Touch then return end
for rR,aC in pairs(d8)do local gr=aC.target if gr and gr.Parent then local kC,kD=d_.Position.X-aC.start.X,d_.Position.Y-aC.start.Y
aC.moved=math.max(aC.moved,math.abs(kC)+math.abs(kD))gr.Position=UDim2 .new(aC.from.X.Scale,aC.from.X.Offset+kC,aC.from.Y.Scale,aC.from.Y.Offset+kD)
end end end))local function E(pS,pT,pU,pV,pW,pX,pY)return x("TextLabel",{Text=pT,Position=pX or UDim2 .new(0,0,0,0),Size=pY or bd,BackgroundTransparency=1,
Font=pW and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=pU,TextColor3=pV,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},pS)
end b.title=x("Frame",{Size=UDim2 .new(1,0,0,K.head),BackgroundColor3=d.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=x("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=d.dim,BorderSizePixel=0},b.title)
Q(b.dot,5)E(b.title,"SAB  BUTTER FARM  "..aZ,12,d.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=v(b.title,"-",d.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=v(b.title,"X",d.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=x("Frame",{Position=UDim2 .new(0,0,0,K.head),Size=UDim2 .new(1,0,0,K.strip),BackgroundColor3=d.bg,BorderSizePixel=0},b.root)
b.bar=x("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=d.warn,BorderSizePixel=0},b.strip)
Q(b.bar,2)b.reason=E(b.strip,"starting",12,d.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=x("Frame",{Position=UDim2 .new(0,0,0,K.head+K.strip),Size=UDim2 .new(1,0,0,K.tabs),BackgroundTransparency=1},b.root)
b.tabFarm=v(b.tabs,"FARM",d.accent,10,UDim2 .new(0,8,0,0),UDim2 .new(0.25,-9,1,-4))b.tabBut=v(b.tabs,"BUTTERS",d.panel2,10,UDim2 .new(0.25,2,0,0),UDim2 .new(0.25,-4,1,-4))
b.tabCrt=v(b.tabs,"CRATES",d.panel2,10,UDim2 .new(0.5,2,0,0),UDim2 .new(0.25,-4,1,-4))b.tabSet=v(b.tabs,"SETUP",d.panel2,10,UDim2 .new(0.75,2,0,0),UDim2 .new(0.25,-10,1,-4))
local function ea()local gs=x("ScrollingFrame",{Position=UDim2 .new(0,0,0,K.head+K.strip+K.tabs),Size=UDim2 .new(1,0,1,-(K.head+K.strip+K.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=d.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)x("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},gs)
x("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},gs)
return gs end b.farm,b.but,b.set,b.crt=ea(),ea(),ea(),ea()b.but.Visible,b.set.Visible,b.crt.Visible=false,false,false
local eb,cA,q=0,12,nil local function V(kE,pZ)eb,cA=eb+1,cA+kE+6 return x("Frame",{Size=UDim2 .new(1,0,0,kE),BackgroundTransparency=1,LayoutOrder=eb},pZ or b.farm)
end local function bF(p0)E(V(14),p0,10,d.dim,true)end q=V(34)b.startB=v(q,"START",d.good,14,u(0,0.68))
b.killB=v(q,"KILL",d.bad,14,u(0.68,0.32))local p1=V(42)local function cB(kF,p2,gt)local gu=x("Frame",{Position=UDim2 .new((kF-1)/gt,0,0,0),Size=UDim2 .new(1/gt,kF<gt and-4 or 0,1,0),
BackgroundColor3=d.panel,BorderSizePixel=0},p1)Q(gu,6)local kG=E(gu,"0",15,d.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local p3=E(gu,p2,9,d.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))kG.TextXAlignment,p3 .TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return kG end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=cB(1,"BOUGHT",5),cB(2,"WAXED",5),cB(3,"SOLD",5),cB(4,"MONEY",5),cB(5,"FREE",5)
b.info=E(V(40),"",10,d.dim,false)b.tgt=E(V(26),"",10,d.good,false)bF("MONEY COLLECT")q=V(28)
b.secB=ku(q,tostring(e.Every),"60",u(0,0.2))E(q,"sec",11,d.dim,false,u(0.21,0.09))b.secSet=v(q,"SET",d.accent,12,u(0.3,0.2))
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
b.farm.CanvasSize=UDim2 .new(0,0,0,cA)eb,cA=0,12 local function ah(p4)return V(p4,b.set)end
local function ec(p5)E(ah(14),p5,10,d.dim,true)end ec("SETTINGS FILE  (saved on your phone)")
q=ah(28)b.cfgName=ku(q,"default","config name",u(0,0.5))b.cfgSave=v(q,"SAVE",d.good,11,u(0.5,0.25))
b.cfgLoad=v(q,"LOAD",d.accent,11,u(0.75,0.25))q=ah(26)b.cfgPrev=v(q,"<",d.panel2,11,u(0,0.13))
b.cfgPick=v(q,"(none saved)",d.panel2,10,u(0.13,0.74))b.cfgNext=v(q,">",d.panel2,11,u(0.87,0.13))
q=ah(26)b.cfgAuto=v(q,"LOAD IT ON LAUNCH: OFF",d.panel2,10,u(0,1))b.cfgMsg=E(ah(26),"",10,d.dim,false)
ec("START BY ITSELF")q=ah(26)b.autoB=v(q,"INSTALL F.exec",d.accent,10,u(0,1))b.autoMsg=E(ah(30),"",10,d.dim,false)
q=ah(28)b.startT=v(q,"START FARMING ON LOAD: ON",d.accent,10,u(0,1))E(ah(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,d.dim,false)
ec("IF THE GAME DROPS ME")q=ah(28)b.rejT=v(q,"AUTO REJOIN: ON",d.accent,11,u(0,0.55))b.rejB=v(q,"REJOIN NOW",d.warn,11,u(0.55,0.45))
b.rejMsg=E(ah(30),"",10,d.dim,false)ec("THE ROUND SAB BUTTON")E(ah(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,d.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,cA)local kH=x("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},gk)
b.tgRoot=x("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=d.accent,BorderSizePixel=0,Active=true},kH)Q(b.tgRoot,26)x("UIStroke",{Color=d.line,Thickness=1},b.tgRoot)
b.tgBtn=x("TextButton",{Text="SAB",Size=bd,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=d.text,AutoButtonColor=false},b.tgRoot)b.tgDot=x("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=d.dim,
BorderSizePixel=0},b.tgRoot)Q(b.tgDot,4)local aD={built=false,boxes={},at=0}local function kI(kJ,gv)
e.Targets[kJ]=gv or nil local gw=aD.boxes[kJ]if gw then gw.Text=gv and"X"or""gw.BackgroundColor3=gv and d.good or d.panel2
end end local function gx()for p6,kK in pairs(aD.boxes)do local kL=e.Targets[p6]==true kK.Text=kL and"X"or""
kK.BackgroundColor3=kL and d.good or d.panel2 end end local cC local function p7()local p8=0
local gy=x("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=E(gy,"",10,d.dim,false,u(0,0.5))local p9=v(gy,"CLEAR",d.panel2,10,u(0.5,0.24))
local p_=v(gy,"REFRESH",d.panel2,10,u(0.74,0.26))p9 .MouseButton1Click:Connect(function()
for qa in pairs(e.Targets)do e.Targets[qa]=nil end gx()end)p_.MouseButton1Click:Connect(function()
A.at=0 eY()cC(true)end)return p8 end cC=function(qb)if not eY()then if not b.butEmpty then
b.butEmpty=E(x("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,d.warn,false)end return
end if aD.built and not qb and aD.at==A.at then return end for rS,gz in ipairs(b.but:GetChildren())do
if gz:IsA("Frame")or gz:IsA("TextButton")then gz:Destroy()end end aD.boxes,b.butEmpty={},nil
p7()local gA,gB=36,1 local function kM(kN)gB=gB+1 local qc=x("Frame",{Size=UDim2 .new(1,0,0,kN),BackgroundTransparency=1,LayoutOrder=gB},b.but)
gA=gA+kN+6 return qc end for rT,ed in ipairs(A.rarOrder)do local qd=kM(24)local qe=kp[ed]or d.text
local gC=x("Frame",{Size=bd,BackgroundColor3=d.panel,BorderSizePixel=0},qd)Q(gC,6)E(gC,"  "..ed:upper(),11,qe,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local qf=v(gC,"ALL",d.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local qg=ed
qf.MouseButton1Click:Connect(function()local kO=A.members[qg]or{}local kP=false for rU,qh in ipairs(kO)do if not e.Targets[qh]then kP=true break end end
for rV,qi in ipairs(kO)do kI(qi,kP)end end)for rW,gD in ipairs(A.members[ed]or{})do local qj=kM(22)
local ee=x("TextButton",{Text="",Size=bd,BackgroundColor3=d.bg,BorderSizePixel=0,AutoButtonColor=true},qj)
Q(ee,5)E(ee,"   "..N(gD),11,d.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local gE=x("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},ee)
Q(gE,4)aD.boxes[gD]=gE local kQ=gD local function kR()kI(kQ,not e.Targets[kQ])end ee.MouseButton1Click:Connect(kR)
gE.MouseButton1Click:Connect(kR)end end gx()b.but.CanvasSize=UDim2 .new(0,0,0,gA+10)aD.built,aD.at=true,A.at
end function o.paint()for qk,kS in pairs(o.boxes)do local kT=e.CrateTicks[qk]==true kS.Text=kT and"X"or""
kS.BackgroundColor3=kT and d.good or d.panel2 end if b.crtInfo then local gF,gG=0,0 for rX in pairs(o.boxes)do gF=gF+1 end
for rY,ql in pairs(e.CrateTicks)do if ql then gG=gG+1 end end b.crtInfo.Text=("%d crates, %d ticked"):format(gF,gG)
end if b.crtAll then b.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"
b.crtAll.BackgroundColor3=e.Crates and d.accent or d.panel2 end end function o.build()for rZ,gH in ipairs(b.crt:GetChildren())do
if gH:IsA("Frame")or gH:IsA("TextButton")then gH:Destroy()end end o.boxes={}local gI,gJ=12,0
local function ef(kU)gJ=gJ+1 gI=gI+kU+6 return x("Frame",{Size=UDim2 .new(1,0,0,kU),BackgroundTransparency=1,LayoutOrder=gJ},b.crt)
end local gK=ef(28)b.crtInfo=E(gK,"",10,d.dim,false,u(0,0.5))local qm=v(gK,"CLEAR",d.panel2,10,u(0.5,0.24))
local qn=v(gK,"REFRESH",d.panel2,10,u(0.74,0.26))I(qm.MouseButton1Click:Connect(function()e.CrateTicks={}o.paint()end))
I(qn.MouseButton1Click:Connect(function()o.build()end))b.crtAll=v(ef(28),"",d.accent,11,u(0,1))
I(b.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates o.paint()end))E(ef(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,d.dim,false)
for r0,aE in ipairs(o.list())do local qo=ef(24)local cD=x("TextButton",{Text="",Size=bd,BackgroundColor3=d.panel,BorderSizePixel=0,AutoButtonColor=true},qo)
Q(cD,5)E(cD,"  "..(aE.title or aE.name)..(aE.guess and"  (?)"or""),11,kp[aE.rar or""]or d.text,true,
UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))E(cD,aE.price and("$"..an(aE.price))or(aE.rar or""),9,d.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local gL=x("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},cD)
Q(gL,4)o.boxes[aE.k]=gL local kV=aE.k local function kW()e.CrateTicks[kV]=(not e.CrateTicks[kV])or nil
o.paint()end I(cD.MouseButton1Click:Connect(kW))I(gL.MouseButton1Click:Connect(kW))end b.crt.CanvasSize=UDim2 .new(0,0,0,gI+10)
o.built=o.at o.paint()end local kX="farm"local function bG(al)kX=al b.farm.Visible,b.but.Visible,b.set.Visible=(al=="farm"),(al=="but"),(al=="set")
b.crt.Visible=(al=="crt")b.tabCrt.BackgroundColor3=(al=="crt")and d.accent or d.panel2 if al=="crt"and(o.built~=o.at or not next(o.boxes))then o.build()end
b.tabFarm.BackgroundColor3=(al=="farm")and d.accent or d.panel2 b.tabBut.BackgroundColor3=(al=="but")and d.accent or d.panel2
b.tabSet.BackgroundColor3=(al=="set")and d.accent or d.panel2 if al=="but"then cC(false)end
end local function H(kY,kZ,qp,qq)kY.Text=kZ and qp or qq kY.BackgroundColor3=kZ and d.accent or d.panel2
end local function qr()b.secB.Text=tostring(e.Every)H(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
H(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")H(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
H(b.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")H(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
H(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")if e.AutoStart~=a.running then cp(e.AutoStart,true)end
if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end
aX(b.root)aX(b.tgRoot)a.lastCollect=j()gx()o.paint()end local function qs(k0)task.spawn(function()
k0 .TextColor3=d.bad task.wait(0.8)if a.alive then k0 .TextColor3=d.text end end)end local function k1()
local k2=b.secB.Text:match("^%s*(%d+)%s*$")local cE=k2 and tonumber(k2)if not cE or cE<1 then
b.secB.Text=tostring(e.Every)qs(b.secB)g("interval must be a whole number >= 1")return end
if cE==e.Every then return end e.Every,a.lastCollect=cE,j()g("collect every "..cE.."s")
end local function gM(qt)local k3=setclipboard or toclipboard return type(k3)=="function"and pcall(k3,qt)
end local function qu()local gN=W~=""and W or(a.reason.."\n"..table.concat(aF,"\n"))if gM(gN)then g("copied "..#gN.." chars")return end
b.out.Text=gN pcall(function()b.out:CaptureFocus()end)g("no clipboard here - select the text in OUTPUT")
end local function qv()local qw,k4=pcall(f5)W=qw and k4 or("DUMP ERROR "..tostring(k4))
local k5=gM(W)b.out.Text=(k5 and#W>7000)and(W:sub(1,7000).."\n... (full text is on your clipboard)")or W
g("DUMP "..#W.." chars"..(k5 and", copied"or""))end local function y(qx,qy)I(qx.MouseButton1Click:Connect(qy))end
y(b.secSet,k1)I(b.secB.FocusLost:Connect(k1))y(b.colT,function()e.Collect,a.lastCollect=not e.Collect,j()
H(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")end)y(b.sellT,function()e.SellJunk=not e.SellJunk
H(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)y(b.sellB,function()a.sellFails=0
task.spawn(ag,"selling...",jR)end)y(b.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(f.apply,"you asked",true)
end)y(b.crateT,function()e.Crates=not e.Crates H(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)y(b.crateB,function()c.lastFail,c.summonFails,c.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(ag,"opening crate...",dD,true)
end)y(b.padB,function()a.plot=aJ()or a.plot local k6,gO=aI(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(k6 and gO and gO:IsA("BasePart"))then g("SET PAD: need character and plot")return end
a.manualPad=gO.CFrame:ToObjectSpace(k6 .HumanoidRootPart.CFrame)oR(a.manualPad)g("collect pad saved at your position")
end)y(b.startB,function()cp(not a.running)end)y(b.buyB,function()a.plot=aJ()or a.plot task.spawn(ag,"buying (manual)...",iE,true)
end)y(b.plB,function()a.plot=aJ()or a.plot task.spawn(ag,"waxing (manual)...",iJ)end)y(b.dumpB,qv)
y(b.copyB,qu)y(b.linkB,function()task.spawn(function()local qz,qA=pcall(f5)W=qz and qA or W
if W==""then W="(empty dump)"end local k7=(type(request)=="function"and request)or(type(http_request)=="function"and http_request)
or(syn and syn.request)or(http and http.request)if type(k7)~="function"then b.out.Text="this executor cannot upload - use COPY instead"return end
b.out.Text="uploading..."local k8,bH=pcall(k7,{Url="https://paste.rs/",Method="POST",Headers={["Content-Type"]="text/plain"},Body=W})
local gP=k8 and type(bH)=="table"and(bH.StatusCode or bH.status_code)or 0 local qB=k8 and type(bH)=="table"and(bH.Body or bH.body)or""
local gQ=(gP>=200 and gP<300)and tostring(qB):match("https?://[%w%./%-_]+")or nil if not gQ then
b.out.Text="upload failed ("..tostring(gP)..") - use COPY instead"g("LINK failed")return
end local k9=gM(gQ)b.out.Text="SEND THIS LINK TO CLAUDE:\n"..gQ..(k9 and"\n(copied)"or"")
g("dump uploaded"..(k9 and", link copied"or""))end)end)y(b.tabFarm,function()bG("farm")end)
y(b.tabBut,function()bG("but")end)y(b.tabSet,function()bG("set")end)y(b.tabCrt,function()bG("crt")end)
local function k_(gR)a.hidden=gR b.root.Visible=not gR b.tgBtn.Text=gR and"SAB+"or"SAB"
end ky(b.tgRoot,b.tgRoot,function(qC)aX(b.tgRoot)a.togPos=d7(b.tgRoot)or a.togPos if qC<8 then k_(not a.hidden)end
end)y(b.tgBtn,function()k_(not a.hidden)end)local ad,M={},0 local function aY()ad=e0()if#ad==0 then
b.cfgPick.Text="(none saved)"M=0 return end if M<1 or M>#ad then M=1 end b.cfgPick.Text=ad[M]..("  (%d/%d)"):format(M,#ad)
end local function la()local lb=a.autoload~=nil b.cfgAuto.Text=lb and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
b.cfgAuto.BackgroundColor3=lb and d.accent or d.panel2 end local function gS()local lc=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if lc~=""then return lc end return(M>0 and ad[M])or""end y(b.cfgSave,function()a.winPos=d7(b.root)or a.winPos
a.togPos=d7(b.tgRoot)or a.togPos local ld,le=e5(gS())b.cfgMsg.Text=ld and("saved as "..le)or("could not save: "..le)
b.cfgMsg.TextColor3=ld and d.good or d.bad aY()g(b.cfgMsg.Text)end)local function qD(gT)
local gU,lf=h5(gT)b.cfgMsg.Text=gU and("loaded "..lf)or("could not load: "..lf)b.cfgMsg.TextColor3=gU and d.good or d.bad
if gU then b.cfgName.Text=gT qr()task.spawn(f.apply,"config "..gT)end g(b.cfgMsg.Text)end
y(b.cfgLoad,function()qD(gS())end)y(b.cfgPick,function()aY()if M>0 then b.cfgName.Text=ad[M]end
end)y(b.cfgPrev,function()if#ad==0 then aY()return end M=(M-2)%#ad+1 aY()b.cfgName.Text=ad[M]
end)y(b.cfgNext,function()if#ad==0 then aY()return end M=M%#ad+1 aY()b.cfgName.Text=ad[M]
end)y(b.cfgAuto,function()if a.autoload then h7(nil)b.cfgMsg.Text="it will not load a config on launch"
else local cF=gS()local lg=false for r1,qE in ipairs(e0())do if qE==cF then lg=true end end
local qF=lg or e5(cF)if qF and cF~=""then h7(cF)aY()b.cfgMsg.Text=cF.." will load every time the script starts"
else b.cfgMsg.Text="name the config and save it first"end end b.cfgMsg.TextColor3=d.dim
la()end)y(b.autoB,function()local lh,li=mY()b.autoMsg.Text=lh and("installed. "..li)or("failed: "..li)
b.autoMsg.TextColor3=lh and d.good or d.bad g(b.autoMsg.Text)end)y(b.startT,function()e.AutoStart=not e.AutoStart
H(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)y(b.rejT,function()
e.Rejoin=not e.Rejoin H(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)y(b.rejB,function()dg("you asked")end)
local bI=false y(b.minB,function()bI=not bI b.tabs.Visible=not bI if bI then b.farm.Visible,b.but.Visible,b.set.Visible,b.crt.Visible=false,false,false,false
else bG(kX)end b.root.Size=UDim2 .new(0,K.w,0,bI and(K.head+K.strip)or K.h)b.minB.Text=bI and"+"or"-"
end)local function eg()if not a.alive then return end a.alive,a.running=false,false pcall(eG)
for r2,qG in ipairs(el)do pcall(function()qG:Disconnect()end)end if c.oldNC then pcall(function()hookmetamethod(game,"__namecall",c.oldNC)end)end
pcall(function()gl:Destroy()end)pcall(function()kH:Destroy()end)if bf.SAB_KILL==eg then bf.SAB_KILL=nil end
end bf.SAB_KILL=eg y(b.killB,eg)y(b.xB,eg)ky(b.title,b.root,function()aX(b.root)a.winPos=d7(b.root)or a.winPos
end)local function lj()local cG,cH=a.reason,a.level if a.busy then cG,cH=a.busyText,"ok"
elseif not a.running then local r3,lk,qH=jX()if a.capHit then cG,cH=lk,"bad"else cG,cH="[stopped] "..lk,(qH=="bad")and"bad"or"idle"end
a.reason,a.level=cG,cH end b.reason.Text=cG b.bar.BackgroundColor3=pt[cH]or d.dim b.dot.BackgroundColor3=a.running and d.good or(a.capHit and d.bad or d.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and d.panel2 or d.accent
b.startB.Text=a.running and"STOP"or"START"H(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and d.warn or d.good local qI,qJ=ey()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),qI.."/"..qJ local ll=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(j()-a.lastCollect)))or nil
local lm=D()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
an(aq()),a.rolls,a.gifts,a.crates,lm and N(F(lm))or"nothing",c.on and("   ["..c.title.." window open]")or"",
ll and("in "..ll.."s")or"off")local bJ=hT()b.tgt.Text=(#bJ==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#bJ<=3)and table.concat(bJ,", ")or(#bJ.." butters ticked")))b.tgt.TextColor3=(#bJ==0)and d.bad or d.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(cL,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(A.n,#A.rarOrder,#bJ)
end if b.but.Visible and aD.at~=A.at then cC(false)end if b.crt.Visible then if o.built~=o.at then o.build()else o.paint()end
end H(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")H(b.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local ln=(f.rec.on and"on"or"")..(f.rec.off and((f.rec.on and"/"or"").."off")or"")b.arL.Text=f.msg~=""and f.msg or("game: %s | learned: %s%s"):format(f.isOn()and"ON"or"off",
ln~=""and ln or"nothing yet",#f.rec.rules>0 and", choices"or"")b.arL.TextColor3=f.msg~=""and d.warn or d.dim
end bf.SAB={S=a,CFG=e,EV=z,U=b,sg=gl,dump=f5,CAT=A,LEARN=C,buildList=cC}g(aZ.." loaded")
if a.uiErrs>0 then g("UI: "..a.uiErrs.." properties skipped")end bG("farm")aX(b.root)aX(b.tgRoot)
if d4 then pcall(function()I(d4:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)aX(b.root)aX(b.tgRoot)end))end)end aY()la()if a.config and a.config~=""then b.cfgName.Text=a.config end
H(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")H(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")
H(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")H(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
H(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")b.secB.Text=tostring(e.Every)
pcall(lj)task.spawn(function()local lo=e7()b.rejMsg.Text=lo and("after a rejoin it restarts from\n"..lo)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(eZ(O.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(m4)end)task.spawn(function()while a.alive do local qK,qL=pcall(lj)if not qK then g("UI ERR "..tostring(qL))end
task.wait(0.25)end end)task.spawn(function()local qM,qN=pcall(nc)if not qM then g("HOOK ERR "..tostring(qN))end
end)task.spawn(function()pcall(l2)if c.loadSeq and not c.learned then local eh={}for lp=1,20 do if c.loadSeq[lp]then eh[#eh+1]=c.loadSeq[lp]end end
if#eh>0 then c.learned={seq=eh,mode=c.loadMode}g("remembered how to open crates directly")
end end if eY()then g(("catalog: %d butters in %d rarities"):format(A.n,#A.rarOrder))end
local qO,lq=pcall(oT)if qO and lq and a.alive and not a.manualPad then a.manualPad=lq end
end)task.spawn(function()while a.alive do task.wait(20)pcall(eG)end end)pcall(f.watchCache)
if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then pcall(function()
local qQ=(type(newcclosure)=="function")and newcclosure or function(qP)return qP end local gV
local lr=(type(setnamecallmethod)=="function")and setnamecallmethod or nil gV=hookmetamethod(game,"__namecall",qQ(function(ls,...)
local cI=getnamecallmethod()if a.alive and(cI=="InvokeServer"or cI=="FireServer")then local lt,lu=pcall(function()return ls.Name end)
if lt and lu=="CrateAction"and not c.replaying then pcall(c.saw,cI,...)elseif lt and lu=="AutoRollAction"and not f.replaying then pcall(f.saw,cI,...)end
if lr then lr(cI)end end return gV(ls,...)end))c.oldNC=gV end)end if ej then I(r.Idled:Connect(function()pcall(function()ej:CaptureController()ej:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for r4=1,90 do if not a.alive then return end if r:GetAttribute("AutoRollOn")~=nil and aI()and(a.plot or aJ())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then f.apply("joined")end while a.alive do task.wait(30)
if a.alive and e.AutoRoll and a.running and not f.isOn()and not bp()and not D()and not c.waiting and not c.on and not a.busy then
f.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for r5=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or aJ()if aI()and a.plot and next(e.Targets)then
cp(true,true)g("started by itself")return end task.wait(1)end if a.alive and not a.running then g("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=aJ()a.lastCollect=j()while a.alive do if a.running then
local qR,lv=pcall(o8)if not qR and lv~=ek then g("LOOP ERR "..tostring(lv))end end task.wait(0.1)
end end)ei("loaded - window is at the top left")end local qT,gW=xpcall(lz,function(qS)return tostring(qS).."\n"..debug.traceback()end)
if not qT then pcall(function()warn("SAB "..aZ.." ERROR: "..tostring(gW))end)ei("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..aZ.." ERROR: "..tostring(gW))end)pcall(function()local lw=(type(getgenv)=="function"and getgenv())or _G
if type(lw.SAB_KILL)=="function"then lw.SAB_KILL()end for r6,qU in ipairs({"SABFarmGui","SABToggle"})do
local lx=r.PlayerGui:FindFirstChild(qU)if lx then lx:Destroy()end end end)pcall(function()
local cJ=Instance.new("ScreenGui")cJ.Name="SABError"cJ.ResetOnSpawn=false cJ.DisplayOrder=1000
local am=Instance.new("TextBox")am.Size=UDim2 .new(0,340,0,170)am.Position=UDim2 .new(0,10,0,50)
am.BackgroundColor3=Color3 .fromRGB(90,20,20)am.TextColor3=Color3 .new(1,1,1)am.TextSize=11
am.TextWrapped=true am.ClearTextOnFocus=false am.TextXAlignment=Enum.TextXAlignment.Left
am.TextYAlignment=Enum.TextYAlignment.Top am.Text="SAB "..aZ.." failed to start. Send this text:\n"..tostring(gW)
am.Parent=cJ cJ.Parent=r:WaitForChild("PlayerGui")end)end
