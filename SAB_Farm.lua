local b7="v25"local kQ=game:GetService("Players")local J=kQ.LocalPlayer or kQ.PlayerAdded:Wait()local function gM(rO)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..b7,Text=rO,Duration=6})
end)end gM("script started")local function rP()local aq=game:GetService("ReplicatedStorage")local au=game:GetService("Workspace")
local kR=game:GetService("UserInputService")local b8=(type(getgenv)=="function"and getgenv())or _G if type(b8 .SAB_KILL)=="function"then pcall(b8 .SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local gN=(function()local rQ,rR=pcall(function()return game:GetService("VirtualUser")end)return rQ and rR or nil end)()
local d={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,MemLimit=2000,Help=false,HelpGuild=false,Campfire=true,Ghost=false,
Quests=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=x(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local Q={name=nil,rar=nil,at=x(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local A={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local e={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local j,q,o,z,C,K,D={},{},{},{},{},{},{}local gO={}local gP,ep,cP,cQ={},{},{},{}local function T(kS)gP[#gP+1]=kS return kS end
local function ad(rS)task.wait(rS)if not c.alive then error(gO,0)end end local function y(eq)eq=os.date("%H:%M:%S").." "..tostring(eq)
table.insert(ep,1,eq)if#ep>6 then table.remove(ep)end cP[#cP+1]=eq if#cP>80 then table.remove(cP,1)end end local function er(kT)
if type(kT)~="string"then return""end return(kT:lower():gsub("[^%w]",""))end local function ab(rT)local kU=er(rT)
local gQ=kU:gsub("butter$","")if gQ==""then gQ=kU end return gQ end local function aQ(gR)return type(gR)=="string"and ab(gR)~=""and d.Targets[ab(gR)]==true end
local function rU(cR)cR=cR:lower()return cR:find("squishy",1,true)~=nil or cR:match("butter$")~=nil or cR:match("butter[^%a]")~=nil
end local gS={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aD(cS)if type(cS)~="number"then return"?"end
local es=1 while math.abs(cS)>=1000 and es<#gS do cS=cS/1000 es=es+1 end local rV=string.format("%.2f",cS):gsub("%.?0+$","")
return rV..gS[es]end local function rW(kV)if type(kV)~="string"then return nil end local rX,kW=kV:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local gT=tonumber(rX)if not gT then return nil end if kW==""then return gT end for rY,rZ in ipairs(gS)do if rZ:lower()==kW:lower()then return gT*1000^(rY-1)end end
return nil end local function aY()local kX=J:GetAttribute("BoardValueMoney")if type(kX)=="number"then return kX end
local kY=J:FindFirstChild("leaderstats")if kY then for zr,r0 in ipairs({"Cash","Money","Coins"})do local gU=kY:FindFirstChild(r0)
if gU and type(gU.Value)=="number"then return gU.Value end end end end local function et(r1)local gV=r1:GetFullName()
if c.plot then local gW=c.plot:GetFullName()if gV:sub(1,#gW)==gW then return gV:sub(#gW+2)end end return gV end
local function av()local eu=J.Character if eu and eu:FindFirstChild("HumanoidRootPart")then local kZ=eu:FindFirstChildOfClass("Humanoid")
if kZ and kZ.Health>0 then return eu end end end local function be()local gX=au:FindFirstChild("Plots")if not gX then return nil end
local function k0(r2)local k1=r2:FindFirstChild("Plate")return k1~=nil and k1:FindFirstChild("EditStackAttachment",true)~=nil
end local k2=J:GetAttribute("PlotNumber")if k2~=nil then local gY=gX:FindFirstChild(tostring(k2))if gY and k0(gY)then return gY end
end for zs,k3 in ipairs(gX:GetChildren())do if k0(k3)then return k3 end end end local function cT(k4)local bf=k4 and k4 .Parent
for zt=1,6 do if not bf then return nil end if bf:IsA("BasePart")then return bf end if bf:IsA("Model")then return bf.PrimaryPart or bf:FindFirstChildWhichIsA("BasePart",true)end
bf=bf.Parent end end local function k5(k6)local gZ=k6 .Parent if gZ and gZ:IsA("Attachment")then return gZ.WorldPosition end
local k7=cT(k6)return k7 and k7 .Position end local function r3()local b9=c.plot and c.plot:FindFirstChild("Plate")
if not b9 then return nil end if b9:IsA("BasePart")then return b9 .Position end if b9:IsA("Model")then return b9:GetPivot().Position end
local k8=b9:FindFirstChildWhichIsA("BasePart",true)return k8 and k8 .Position end local function k9()local g0={}
local k_=c.plot and c.plot:FindFirstChild("WaxStations")if k_ then for zu,r4 in ipairs(k_:GetChildren())do local la=r4:FindFirstChild("SquishyPlaceHolder")
local g1=la and la:FindFirstChild("PlacePrompt")if g1 and g1:IsA("ProximityPrompt")then g0[#g0+1]=g1 end end end
return g0 end local function ev()local lb,g2=k9(),0 for zv,r5 in ipairs(lb)do if r5 .Enabled then g2=g2+1 end end
local g3=#lb local g4=J:GetAttribute("WaxStations")if type(g4)=="number"and g4>g3 then g3=g4 end return g2,g3
end local function r6()local lc=av()local ld=lc and lc.HumanoidRootPart.Position local g5,le for zw,g6 in ipairs(k9())do
if g6 .Enabled then local lf=k5(g6)local lg=(lf and ld)and(lf-ld).Magnitude or 1e9 if not g5 or lg<le then g5,le=g6,lg end
end end return g5 end local function lh()local ew=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not ew then return nil end local li=ew:FindFirstChild("BuyPromptAttachment")local ex=(li and li:FindFirstChild("BuyPrompt"))or ew:FindFirstChild("BuyPrompt",true)
if ex and ex:IsA("ProximityPrompt")and ex:IsDescendantOf(ew)then return ex end end local lj={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local r7={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ae={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local W={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local g7="SAB_order.txt"local function ey()if not ae.dirty or type(writefile)~="function"then return end local ay={}
for r8,r9 in pairs(ae.price)do ay[#ay+1]="P|"..r8 .."|"..string.format("%.0f",r9)end for r_,sa in pairs(ae.order)do ay[#ay+1]="O|"..r_.."|"..table.concat(sa,",")end
if e.learned and e.enc then ay[#ay+1]="M|mode|"..tostring(e.learned.mode or"")for sb,ez in ipairs(e.learned.seq)do
local lk={}for ll=1,ez.n do lk[ll]=e.enc(ez.args[ll])end ay[#ay+1]=("A|%d|%s|%d|%s"):format(sb,ez.m,ez.n,table.concat(lk,";"))
end end local function g8(sc,sd,eA)local lm={}for ln=1,eA.n do lm[ln]=e.enc(eA.args[ln])end ay[#ay+1]=("R|%d|%s|%s|%d|%s"):format(sd,sc,eA.m,eA.n,table.concat(lm,";"))
end if e.enc then for se,sf in ipairs(A.rec.rules)do g8("rules",se,sf)end if A.rec.on then g8("on",0,A.rec.on)end
if A.rec.off then g8("off",0,A.rec.off)end end for zx,cU in pairs(L.seen)do ay[#ay+1]=("K|%s|%s|%s|%s"):format(cU.name,cU.title or"",cU.rar or"",cU.price and string.format("%.0f",cU.price)or"")
end if pcall(writefile,g7,table.concat(ay,"\n"))then ae.dirty=false end end local function sh()if type(isfile)~="function"or type(readfile)~="function"then return end
local si,sj=pcall(isfile,g7)if not(si and sj)then return end local sk,lo=pcall(readfile,g7)if not(sk and type(lo)=="string")then return end
for sl in lo:gmatch("[^\n]+")do local b_,ca,aZ=sl:match("^(%a)|([^|]+)|(.*)$")if b_=="P"then ae.price[ca]=tonumber(aZ)
elseif b_=="M"then e.loadMode=(aZ~=""and aZ~="nil")and aZ or nil elseif b_=="A"and e.dec then local lp=tonumber(ca)
local lq,eB,sm=aZ:match("^([^|]+)|(%d+)|(.*)$")if lp and lq then eB=tonumber(eB)local lr,eC={},0 for sn in(sm..";"):gmatch("([^;]*);")do
eC=eC+1 if eC<=eB then lr[eC]=e.dec(sn)end end e.loadSeq=e.loadSeq or{}e.loadSeq[lp]={m=lq,n=eB,args=lr}end elseif b_=="R"and e.dec then
local ls=tonumber(ca)local eD,so,eE,sp=aZ:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if ls and eD then eE=tonumber(eE)
local lt,eF={},0 for sq in(sp..";"):gmatch("([^;]*);")do eF=eF+1 if eF<=eE then lt[eF]=e.dec(sq)end end local g9={m=so,n=eE,args=lt}
if eD=="rules"then A.rec.rules[ls]=g9 elseif eD=="on"then A.rec.on=g9 elseif eD=="off"then A.rec.off=g9 end end
elseif b_=="K"then local lu,lv,sr=aZ:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(ca)]={name=ca,title=lu~=""and lu or nil,
rar=lv~=""and lv or nil,price=tonumber(sr)}elseif b_=="O"and aZ~=""then local eG={}for ss in aZ:gmatch("[^,]+")do eG[#eG+1]=ss end
if#eG>0 then ae.order[ca]=eG end end end end local function su(eH)if type(eH)~="table"then return end local bE,lw=eH.rarity,eH.contents
if type(bE)~="string"or bE==""or type(lw)~="table"then return end local cV={}for zy,eI in ipairs(lw)do if type(eI)=="table"and type(eI.butter)=="string"then
cV[#cV+1]={n=eI.butter,ch=tonumber(eI.chance)or 0}end end if#cV==0 then return end table.sort(cV,function(sv,sw)return sv.ch>sw.ch end)
local cW,cX={},false for sx,sy in ipairs(cV)do cW[sx]=sy.n end local g_=ae.order[bE]if not g_ or#g_~=#cW then cX=true end
if not cX then for lx=1,#cW do if g_[lx]~=cW[lx]then cX=true break end end end ae.order[bE]=cW local ha=tonumber(eH.price)
if ha and ae.price[bE]~=ha then ae.price[bE]=ha cX=true end if cX then ae.dirty=true W.at=0 y("learned the "..bE.." order from its crate")
end end local function cb(sz,sA)local sB=sz:FindFirstChild(sA,true)local sC,hb=pcall(function()return sB.Text end)
return(sC and type(hb)=="string"and hb~="")and hb or nil end local function ah(ly)return W.pretty[ly]or ly end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(sD)return er(sD or"")end
function L.learn(a0)if type(a0)~="table"or type(a0 .name)~="string"then return end local hc=L.key(a0 .name)local a1=L.seen[hc]or{}
local sE=(L.seen[hc]==nil)or(tonumber(a0 .price)and a1 .price~=tonumber(a0 .price))a1 .name,a1 .title=a0 .name,a0 .title or a1 .title
a1 .rar,a1 .price=a0 .rarity or a1 .rar,tonumber(a0 .price)or a1 .price L.seen[hc]=a1 if sE then L.at,ae.dirty=x(),true end
end function L.wanted(lz)return lz~=nil and d.CrateTicks[L.key(lz)]==true end function L.list()local cc={}for sF,eJ in ipairs(L.base)do cc[L.key(eJ[1])]={name=eJ[1],title=eJ[2],rar=eJ[3],i=sF}end
for zz,cY in ipairs(W.rarOrder)do local lA=false for zA,sG in pairs(cc)do if sG.rar==cY then lA=true break end end
if not lA and cY~="?"then local lB=cY:gsub("[^%w]","").."Crate"cc[L.key(lB)]={name=lB,title=cY.." Crate",rar=cY,i=50,guess=true}
end end for lC,eK in pairs(L.seen)do local aR=cc[lC]or{i=100}aR.name,aR.title,aR.rar=eK.name or aR.name,eK.title or aR.title,eK.rar or aR.rar
aR.price,aR.guess=eK.price or aR.price,nil cc[lC]=aR end local cZ,eL={},{}for sH,sI in ipairs(lj)do cZ[sI]=sH end
for sJ,lD in ipairs(W.rarOrder)do cZ[lD]=cZ[lD]or(20+sJ)end for sK,c0 in pairs(cc)do c0 .k=sK c0 .price=c0 .price or ae.price[c0 .rar or""]
eL[#eL+1]=c0 end table.sort(eL,function(bF,bG)if bF.price and bG.price and bF.price~=bG.price then return bF.price<bG.price end
local lE,lF=cZ[bF.rar or""]or 99,cZ[bG.rar or""]or 99 if lE~=lF then return lE<lF end if(bF.i or 100)~=(bG.i or 100)then return(bF.i or 100)<(bG.i or 100)end
return bF.k<bG.k end)return eL end local function sL()local lG=aq:FindFirstChild("Assets")local lH=lG and lG:FindFirstChild("Squishies")
if not lH then return false end local hd,lI,cd={},{},{}local eM=0 for zB,eN in ipairs(lH:GetChildren())do local c1=ab(eN.Name)
if c1~=""and not hd[c1]then local eO=cb(eN,"RarityText")or"?"hd[c1]=eO lI[c1]=cb(eN,"NameText")or eN.Name cd[eO]=cd[eO]or{}
table.insert(cd[eO],c1)eM=eM+1 end end if eM==0 then return false end for lJ,sM in pairs(cd)do local lK=ae.order[lJ]or r7[lJ]
local he={}if lK then for sN,sO in ipairs(lK)do he[ab(sO)]=sN end end table.sort(sM,function(lL,lM)local hf,hg=he[lL],he[lM]
if hf and hg then return hf<hg end if hf then return true end if hg then return false end return ah(lL)<ah(lM)
end)end local hh={}for sP,sQ in ipairs(lj)do hh[sQ]=sP end local eP={}for sR in pairs(cd)do eP[#eP+1]=sR end table.sort(eP,function(hi,hj)
local hk,hl=ae.price[hi],ae.price[hj]if hk and hl and hk~=hl then return hk<hl end local hm,hn=hh[hi],hh[hj]if hm and hn then return hm<hn end
if hm then return true end if hn then return false end return hi<hj end)W.rar,W.pretty,W.members,W.rarOrder,W.n,W.at=hd,lI,cd,eP,eM,x()
return true end local function ho()if W.at==0 or(x()-W.at)>120 then pcall(sL)end return W.n>0 end local function sS(sT)
local lN=ab(sT)return W.rar[lN]or(Q.name and ab(Q.name)==lN and Q.rar)or"?"end local function sU()local eQ={}
for sV,sW in pairs(d.Targets)do if sW then eQ[#eQ+1]=ah(sV)end end table.sort(eQ)return eQ end local af={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function lO()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function eR(lP)if type(makefolder)~="function"then return end local sX,sY=pcall(isfolder,lP)if not(sX and sY)then pcall(makefolder,lP)end
end local function eS(lQ)if type(isfile)~="function"or type(readfile)~="function"then return nil end local sZ,s0=pcall(isfile,lQ)
if not(sZ and s0)then return nil end local s1,s2=pcall(readfile,lQ)return s1 and s2 or nil end local function c2(s3,s4)
if type(writefile)~="function"then return false end return(pcall(writefile,s3,s4))end local function lR(s5)local c3={}
if type(listfiles)~="function"then return c3 end local s6,lS=pcall(listfiles,s5)if not s6 or type(lS)~="table"then return c3 end
for zC,s7 in ipairs(lS)do c3[#c3+1]=tostring(s7)end return c3 end local function lT()local eT={}for zD,s8 in ipairs(lR(af.cfg))do
local lU=s8:match("([^/\\]+)%.txt$")if lU then eT[#eT+1]=lU end end table.sort(eT)return eT end local function s9()
local V={"V|1"}V[#V+1]="N|Every|"..tostring(d.Every)V[#V+1]="N|GlazeLead|"..tostring(d.GlazeLead)V[#V+1]="N|FpsCap|"..tostring(d.FpsCap)
V[#V+1]="N|MemLimit|"..tostring(d.MemLimit)for zE,lV in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do V[#V+1]="S|"..lV.."|"..d[lV]end
do local eU={}for s_,c4 in pairs(d.Pets)do local lW=(c4 .b and"b"or"")..(c4 .g and"g"or"")..(c4 .w and"w"or"")..((tonumber(c4 .f)or 0)>0 and tostring(c4 .f)or"")
if lW~=""then eU[#eU+1]=s_.."|"..lW end end table.sort(eU)V[#V+1]="P|-"for zF,ta in ipairs(eU)do V[#V+1]="P|"..ta end
end for zG,lX in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","Quests"})do
V[#V+1]="B|"..lX.."|"..(d[lX]and"1"or"0")end local hp=J:GetAttribute("AutoRollRules")if type(hp)=="string"and hp~=""then d.ARrules,d.ARstop=hp,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then V[#V+1]="S|rules|"..d.ARrules V[#V+1]="S|stop|"..d.ARstop end if c.winPos then V[#V+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then V[#V+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for zH,hq in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local eV={}for tb,tc in pairs(hq[2])do if tc then eV[#eV+1]=tb end end table.sort(eV)V[#V+1]=hq[1].."|-"for zI,td in ipairs(eV)do V[#V+1]=hq[1].."|"..td end
end return table.concat(V,"\n")end local function te(hr)if type(hr)~="string"or hr==""then return false end local lY,lZ,l0,l1,c5={},false,{},false,nil
for tf in hr:gmatch("[^\n]+")do local aE,ac,aw=tf:match("^(%a)|([^|]*)|?(.*)$")if aE=="N"and ac=="Every"then local hs=tonumber(aw)
if hs and hs>=1 then d.Every=math.floor(hs)end elseif aE=="N"and(ac=="FpsCap"or ac=="MemLimit")then local ht=tonumber(aw)
if ht and ht>=0 then d[ac]=math.floor(ht)end elseif aE=="N"and ac=="GlazeLead"then local eW=tonumber(aw)if eW and eW>=5 and eW<=600 then d.GlazeLead=math.floor(eW)end
elseif aE=="S"and(ac=="TeamNormal"or ac=="TeamFull"or ac=="TeamGlaze"or ac=="TeamWax")then d[ac]=aw elseif aE=="P"and ac~=""then
if not c5 then c5={}end if ac~="-"and aw~=""then c5[ac]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aE=="B"then if d[ac]~=nil then d[ac]=(aw=="1")end
elseif aE=="S"and ac=="rules"then d.ARrules=aw elseif aE=="S"and ac=="stop"then d.ARstop=aw elseif aE=="W"then
c.winPos={tonumber(ac)or 10,tonumber(aw)or 44}elseif aE=="G"then c.togPos={tonumber(ac)or 10,tonumber(aw)or 300}
elseif aE=="T"and ac~=""then if ac~="-"then lY[ac]=true end lZ=true elseif aE=="K"and ac~=""then if ac~="-"then l0[ac]=true end
l1=true end end if lZ then d.Targets=lY end if l1 then d.CrateTicks=l0 end if c5 then d.Pets=c5 end return true
end local function eX(ce)if not lO()then return false,"this executor cannot write files"end ce=(ce or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if ce==""then return false,"give the config a name"end eR(af.dir)eR(af.cfg)if not c2(af.cfg.."/"..ce..".txt",s9())then return false,"could not write the file"end
c.config=ce return true,ce end local function l2(eY)local l3=eS(af.cfg.."/"..eY..".txt")if not l3 then return false,"no config called "..tostring(eY)end
if not te(l3)then return false,"that config looks empty"end c.config=eY return true,eY end local function l4(hu)
if hu then eR(af.dir)c2(af.auto,hu)elseif type(delfile)=="function"then pcall(delfile,af.auto)else c2(af.auto,"")
end c.autoload=hu end local function tg()if c.selfPath then return c.selfPath end local eZ for zJ,th in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",af.dir})do
for zK,l5 in ipairs(lR(th))do local hv=l5:lower()if hv:sub(-4)==".lua"and(hv:find("sab_farm",1,true)or hv:find("sab farm",1,true))then
eZ=eZ or l5 end end end c.selfPath=eZ return eZ end af.stub=[[
-- SAB autoloader v2: loads the newest SAB farm from GitHub on every join (a saved copy if GitHub is down).
task.spawn(function()
    task.wait(6)
    local G = (type(getgenv) == "function" and getgenv()) or _G
    if type(G.SAB) == "table" and type(G.SAB.S) == "table" and G.SAB.S.alive then return end -- already running
    local url, cache, src = "https://raw.githubusercontent.com/FlamingClaw/sab-farm/main/SAB_Farm.lua", "SAB/SAB_Farm_cache.lua", nil
    for _ = 1, 3 do
        local ok, s = pcall(function() return game:HttpGet(url .. "?t=" .. tostring(tick())) end)
        if ok and type(s) == "string" and #s > 1000 and s:find("SAB_KILL", 1, true) then src = s break end
        task.wait(3)
    end
    if src then
        pcall(function() if type(makefolder) == "function" then pcall(makefolder, "SAB") end writefile(cache, src) end)
    else
        local ok, s = pcall(readfile, cache)
        if ok and type(s) == "string" and #s > 1000 then src = s end
    end
    if not src and type(listfiles) == "function" then -- an older setup: a copy saved by hand
        for _, d in ipairs({ "", "scripts", "Scripts", "Delta", "Delta/Scripts", "SAB" }) do
            local ok, fs = pcall(listfiles, d)
            if ok and type(fs) == "table" then
                for _, f in ipairs(fs) do
                    local low = tostring(f):lower()
                    if not src and low:sub(-4) == ".lua" and low:find("sab_farm", 1, true) and not low:find("autoload", 1, true) then
                        local okr, s = pcall(readfile, tostring(f))
                        if okr and type(s) == "string" and #s > 1000 then src = s end
                    end
                end
            end
        end
    end
    if src then
        local fn = loadstring(src)
        if fn then pcall(fn) end
    end
end)
]]
local function ti()if not lO()then return false,"this executor cannot write files"end eR("autoexec")if not c2(af.exec,af.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local e0=(function()local tj,tk=pcall(function()return game:GetService("TeleportService")end)return tj and tk or nil end)()
local function hw()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local tl=queueonteleport or queue_on_teleport return(pcall(tl,af.stub))end local function c6(tm)if c.rejoining then return end
c.rejoining=true y("REJOIN ("..tm..")")pcall(ey)if c.autoload then pcall(eX,c.autoload)end local tn=hw()y(tn and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for zL=1,30 do if not e0 then break end pcall(function()e0:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function to()local tp,l6=pcall(function()return game:GetService("GuiService")end)if tp and l6 then
pcall(function()T(l6 .ErrorMessageChanged:Connect(function()if d.Rejoin then c6("roblox error message")end end))
end)end pcall(function()local l7=game:GetService("CoreGui")local l8=l7 and l7:WaitForChild("RobloxPromptGui",15)
local l9=l8 and l8:WaitForChild("promptOverlay",15)if l9 then T(l9 .ChildAdded:Connect(function(tq)if d.Rejoin and tostring(tq.Name):lower():find("errorprompt",1,true)then c6("disconnect prompt")end
end))end end)pcall(function()T(J.OnTeleport:Connect(function(tr)if tostring(tr):find("Started")then hw()end end))
end)if e0 then pcall(function()T(e0 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()c6("teleport retry")end)end
end))end)end end local function l_(ts)local ma=c.plot and c.plot:FindFirstChild(ts)if not ma then return nil,false end
for zM,hx in ipairs(ma:GetChildren())do if hx:IsA("Model")or hx:IsA("BasePart")then return hx,true end end return nil,true
end local function bH()local bh=l_("RolledSquishy")if not bh then return nil end return{model=bh,name=bh.Name,pretty=cb(bh,"NameText")or ah(ab(bh.Name)),
rar=cb(bh,"RarityText")or sS(bh.Name),price=cb(bh,"PriceText")}end local function mb(hy)return type(hy)=="string"and(W.rar[ab(hy)]~=nil or rU(hy))
end local function aa()local hz=l_("SquishyEquipped")if hz then c.carrySrc,e.heldAt="model",x()return hz.Name,hz end
local mc=J.Character if mc then for zN,c7 in ipairs(mc:GetDescendants())do if(c7:IsA("Model")or c7:IsA("Tool"))and mb(c7 .Name)then
c.carrySrc,e.heldAt="character",x()return c7 .Name,c7 end end end local e1=J:GetAttribute("SquishyEquipped")if type(e1)=="string"and e1~=""and mb(e1)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return e1,nil end c.carrySrc=nil end local function zO()local zP,tt=aa()return tt end local function md()
local me=bH()local hA=me and rW(me.price)local hB=aY()if hA and hB and hB<hA*0.5 then return hB,hA end end local function cf(tu)
cQ[#cQ+1]=os.date("%H:%M:%S").." "..tu if#cQ>40 then table.remove(cQ,1)end end local function tv(bI,e2)if type(bI)~="string"then return end
cf(("Roll(%s,%s)"):format(bI,tostring(e2)))if bI:lower():find("crate",1,true)then e.rolled,e.rolledAt=bI,x()return
end Q.seq=Q.seq+1 Q.name,Q.at=bI,x()Q.rar=type(e2)=="string"and e2 or nil c.rolls=c.rolls+1 if aQ(bI)then y(("ROLL %s [%s] = TARGET"):format(bI,tostring(e2)))end
end local function tw(bJ)if type(bJ)~="table"then return end local e3=bJ.butter or bJ.itemName if type(e3)~="string"then return end
c.gifts=c.gifts+1 Q.gift,Q.giftAt=e3,x()if type(bJ.giftId)=="string"then local mf=aq:FindFirstChild("Remotes")
local mg=mf and mf:FindFirstChild("GiftThanks")if mg then pcall(function()mg:FireServer(bJ.giftId)end)end end
cf("Gift("..e3 .." from "..tostring(bJ.fromName)..")")y(("GIFT from %s: %s - it will not be waxed"):format(tostring(bJ.fromName),e3))
end local function tx()local mh=aq:WaitForChild("Remotes",30)if not c.alive then return end if not mh then y("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local mi=J:GetAttribute("SquishyEquipped")
if type(mi)=="string"and mi~=""then e.heldAt=x()end end))local tD={SquishyRollAnimation=tv,InitSquishy=function(mj)Q.init,Q.initAt=tostring(mj),x()cf("Init("..tostring(mj)..")")end,
CrateUpdate=function(cg,mk)pcall(su,cg)pcall(L.learn,cg)if type(cg)=="table"then local ty=mk==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not ty then return end local tz=not e.waiting local tA=e.on e.waiting,e.data,e.at=true,cg,x()e.on=(mk==true)
e.title=tostring(cg.title or cg.name or"crate")if e.on and not tA then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then cf("CrateWindow open("..e.title..")")elseif tz then cf("Crate waiting("..e.title..")")y(e.title.." is waiting on your stand")
end else if e.waiting then cf("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local tB=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,tB)end if e.classify then local tC=x()
task.spawn(function()pcall(e.classify,tC)end)end end end,GiftReceived=tw,}for e4,tE in pairs(tD)do local hC=mh:FindFirstChild(e4)
if hC and hC:IsA("RemoteEvent")then T(hC.OnClientEvent:Connect(tE))elseif e4~="CrateUpdate"and e4~="GiftReceived"then y("remote "..e4 .." missing")end
end end local function hD()local bK=bH()if bK then if aQ(bK.name)then return{state="match",shown=bK.pretty,src="pad",info=bK}
end return{state="skip",info=bK,level="idle",text=("on pad: %s [%s] - not ticked"):format(bK.pretty,tostring(bK.rar))}
end if Q.name and(x()-Q.at)<4 then if aQ(Q.name)then return{state="match",shown=ah(ab(Q.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ah(ab(Q.name)),tostring(Q.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function hE(tF,tG,tH,tI)
local e5=RaycastParams.new()e5 .FilterType=Enum.RaycastFilterType.Exclude local hF={J.Character}for zQ,tJ in ipairs(tI or{})do hF[#hF+1]=tJ end
e5 .FilterDescendantsInstances=hF pcall(function()e5 .RespectCanCollide=true end)local ml=au:Raycast(Vector3 .new(tF,tG+4,tH),Vector3 .new(0,-30,0),e5)
return ml and ml.Position or nil end local function e6(mm)local mn=mm:FindFirstChildOfClass("Humanoid")return((mn and mn.HipHeight)or 2)+mm.HumanoidRootPart.Size.Y/2+0.2
end local function hG(tK,tL)local hH=tK:FindFirstChildOfClass("Humanoid")local tM=x()while x()-tM<tL do if hH and(hH.FloorMaterial~=Enum.Material.Air or hH.SeatPart)then return true end
ad(0.05)end return false end local function aI(tN,hI,hJ)local mo=tN.HumanoidRootPart mo.AssemblyLinearVelocity=Vector3 .new(0,0,0)
mo.CFrame=hJ and CFrame.new(hI,Vector3 .new(hJ.X,hI.Y,hJ.Z))or CFrame.new(hI)end local function ci(a2,mp)local bL=av()
if not bL or not a2 then return false end local bi=a2 .Position local e7=math.clamp(math.max(a2 .Size.X,a2 .Size.Z)/2+2.2,3,7)
local mq=(mp and mp.MaxActivationDistance)or 10 if e7>mq-2 then e7=math.max(2.5,mq-2)end local c8={}local function bM(c9)
c9=Vector3 .new(c9 .X,0,c9 .Z)if c9 .Magnitude>0.05 then c8[#c8+1]=c9 .Unit end end local mr=r3()if mr then bM(mr-bi)end
bM(a2 .CFrame.LookVector)bM(-a2 .CFrame.LookVector)bM(a2 .CFrame.RightVector)bM(-a2 .CFrame.RightVector)bM(bL.HumanoidRootPart.Position-bi)
if#c8==0 then bM(Vector3 .new(0,0,1))end local tO,e8=e6(bL),false for zR,tP in ipairs(c8)do local e9=bi+tP*e7
local hK=hE(e9 .X,bi.Y,e9 .Z,{a2})if hK and math.abs(hK.Y-bi.Y)<14 then aI(bL,Vector3 .new(e9 .X,hK.Y+tO,e9 .Z),bi)
if hG(bL,0.7)then e8=true break end end end if not e8 then aI(bL,bi+c8[1]*e7+Vector3 .new(0,3,0),bi)e8=hG(bL,1)
end ad(0.12)return e8 end local function ms(c_)if not c_.Parent or not c_.Enabled then return false end pcall(function()c_:InputHoldBegin()end)
ad(math.max(c_.HoldDuration,0)+0.08)pcall(function()c_:InputHoldEnd()end)return true end local function ak(mt,tQ)
local tR=x()while x()-tR<tQ do if mt()then return true end ad(0.05)end return mt()end local function da(cj,tS,mu,tT)
local tU=c.zapFirst and{"zap","hold"}or{"hold","zap"}for tV,hL in ipairs(tU)do if tV==2 and(tT or not(cj.Parent and cj.Enabled and(not mu or mu())))then break end
local hM if hL=="hold"then hM=ms(cj)else hM=type(fireproximityprompt)=="function"and cj.Parent~=nil and cj.Enabled and pcall(fireproximityprompt,cj)end
if hM and ak(tS,1.2)then c.zapFirst=(hL=="zap")return true,hL end end return false end local function mv(hN)local bj=lh()
if not bj or not bj.Enabled then y("buy: nothing on the pad")return false end local mw=cT(bj)if not mw then y("buy: pad part missing")return false end
c.lastBuyAt=x()local tW,mx=Q.seq,aY()ci(mw,bj)if not bj.Enabled then y("buy aborted: pad emptied")return false end
local ck=hD()if not hN and ck.state~="match"then y("buy aborted: "..(ck.text or"pad changed"))c.matchSince=nil
return false end local hO=ck.info and ck.info.name or(ck.state=="match"and Q.name)or nil local function tX()return bj.Enabled and aa()==nil and(hN or hD().state=="match")
end local tY,tZ=da(bj,function()return aa()~=nil or((not bj.Enabled)and(hN or Q.seq==tW))end,tX,md()~=nil)if tY then
ak(function()return aa()~=nil end,0.8)local db=aa()local my=aY()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil Q.name,Q.rar,Q.at=nil,nil,x()y(("BOUGHT %s%s via %s"):format(db and ah(ab(db))or(ck.shown or"?"),(mx and my)and(" for $"..aD(mx-my))or"",tZ))
if db and hO and ab(db)~=ab(hO)then y(("note: picked up %s, not %s"):format(db,hO))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local mz=bH()y(("BUY REFUSED: cash short? have $%s, price %s"):format(aD(aY()),(mz and mz.price)or"?"))
return false end local function mA()local e_=aa()if not e_ then c.holding=false y("place: hands are empty")return false
end if not aQ(e_)then y(("REFUSED TO WAX %s - it is not ticked"):format(ah(ab(e_))))return false end for zS=1,d.PlaceTries do
local bk=r6()if not bk then y("place: no free station")break end local mB=cT(bk)if mB then ci(mB,bk)local mC=aa()
if not mC then c.holding=false y("place: hands emptied on the way")return false end if not aQ(mC)then y("place: what I carry changed, not waxing it")return false end
if bk.Enabled then local t0,t1=da(bk,function()return not bk.Enabled end,function()return bk.Enabled end)if t0 then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 Q.name,Q.rar,Q.at=nil,nil,x()
y(("WAXED %s #%d at %s via %s"):format(ah(ab(e_)),c.placed,bk.Parent.Parent.Name,t1))return true end end end ad(0.25)
end c.placeFails=c.placeFails+1 if aa()==nil then c.holding=false end y("PLACE FAILED ("..c.placeFails..")")if c.placeFails>=2 then
c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(aa()))y(c.capMsg)end return false end function q.place()local t2=x()while c.alive and q.editing and x()-t2<25 do ad(0.2)end
if d.Teams and d.TeamWax~=""then q.placing=true local t3=x()while c.alive and q.current()~=d.TeamWax and x()-t3<5 do ad(0.1)end
if q.current()==d.TeamWax then ad(0.3)else y("wax team did not come on in time - placing anyway")end end local t4,mD=pcall(mA)
q.placing=false if not t4 then error(mD,0)end return mD end local function mE(mF)return type(mF)=="string"and mF:lower():find("crate",1,true)~=nil
end local t5={SABFarmGui=1,SABToggle=1,SABError=1}local function hP(t6)local bl=t6 while bl do if t5[bl.Name]then return false end
if bl:IsA("ScreenGui")then local t7,t8=pcall(function()return bl.Enabled end)return(not t7)or t8~=false end if bl:IsA("GuiObject")and not bl.Visible then return false end
bl=bl.Parent end return false end local function fa(fb)local cl=""pcall(function()if fb:IsA("TextButton")then cl=fb.Text end end)
if not cl:find("%a")then for zT,fc in ipairs(fb:GetDescendants())do if(fc:IsA("TextLabel")or fc:IsA("TextButton"))and fc.Text:find("%a")then cl=fc.Text break end
end end if not cl:find("%a")then cl=fb.Name end return(cl:lower():gsub("[^%a]",""))end local function t9()local dc,dd
local mG=J:FindFirstChildOfClass("PlayerGui")if not mG then return nil,nil end for zU,de in ipairs(mG:GetDescendants())do
if de:IsA("GuiButton")and hP(de)then local hQ=fa(de)if hQ:sub(1,4)=="open"and not hQ:find("shop",1,true)then dc=dc or de end
if hQ:sub(1,7)=="discard"then dd=dd or de end end end if dc and dd then return dc,dd end if e.on then return dc,dd end
return nil,nil end local hR=(function()local t_,ua=pcall(function()return game:GetService("VirtualInputManager")end)return t_ and ua or nil end)()
local function mH(a3,hS)local hT={}local function mI(ub)hT[#hT+1]=ub end if c.tapWay then mI(c.tapWay)end for zV,mJ in ipairs({"touch","conn","signal"})do
if mJ~=c.tapWay then mI(mJ)end end local function mK(uc,...)local ud,hU=pcall(getconnections,uc)if not(ud and type(hU)=="table"and#hU>0)then return false end
local mL,ue,uf=false,{...},select("#",...)for zW,ug in ipairs(hU)do if pcall(function()ug:Fire(table.unpack(ue,1,uf))end)then mL=true end
end return mL end local function mM()local mN=Vector3 .new(0,0,0)pcall(function()local mO,mP=a3 .AbsolutePosition,a3 .AbsoluteSize
mN=Vector3 .new(mO.X+mP.X/2,mO.Y+mP.Y/2,0)end)local hV={Position=mN,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()hV.UserInputType=Enum.UserInputType.Touch end)pcall(function()hV.UserInputState=Enum.UserInputState.End end)
return hV end for zX,a4 in ipairs(hT)do local df=false if a4=="conn"and type(getconnections)=="function"then if mK(a3 .MouseButton1Click)then
df=true if ak(hS,1.5)then c.tapWay=a4 return true,a4 end end df=mK(a3 .Activated,mM(),1)elseif a4=="signal"and type(firesignal)=="function"then
if pcall(firesignal,a3 .MouseButton1Click)then if ak(hS,1.5)then c.tapWay=a4 return true,a4 end end df=pcall(firesignal,a3 .Activated,mM(),1)
elseif a4=="touch"and hR then df=pcall(function()local mQ,mR=a3 .AbsolutePosition,a3 .AbsoluteSize local mS=0
local mT=a3:FindFirstAncestorWhichIsA("ScreenGui")local uh,ui=pcall(function()return mT and mT.IgnoreGuiInset end)
if not(uh and ui)then pcall(function()mS=game:GetService("GuiService"):GetGuiInset().Y end)end local mU,mV=mQ.X+mR.X/2,mQ.Y+mR.Y/2+mS
hR:SendMouseButtonEvent(mU,mV,0,true,game,1)task.wait(0.06)hR:SendMouseButtonEvent(mU,mV,0,false,game,1)end)end
if df and ak(hS,1.5)then c.tapWay=a4 return true,a4 end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function hW(mW)local dg=mW.Parent while dg and dg~=c.plot do if e.NOT[dg.Name]then return false end dg=dg.Parent
end local hX=(mW.ActionText or""):lower()if hX:find("roll",1,true)or hX:find("place",1,true)or hX:find("sell",1,true)then return false end
return true end local function uj()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local mX=c.plot:FindFirstChild("CrateStand")local dh if mX then for zY,fd in ipairs(mX:GetDescendants())do
if fd:IsA("ProximityPrompt")and fd.Enabled and hW(fd)then dh=fd break end end end if not dh then for zZ,bm in ipairs(c.plot:GetDescendants())do
if bm:IsA("ProximityPrompt")and bm.Enabled and hW(bm)then local mY=bm:FindFirstAncestorWhichIsA("Model")local uk=((bm.ActionText or"").." "..(bm.ObjectText or"").." "..bm.Name.." "..(mY and mY.Name or"")):lower()
if uk:find("crate",1,true)then dh=bm break end end end end e.prompt=dh return dh end local function hY()if e.on then return true end
local di=uj()if not di then e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local mZ=cT(di)if mZ then ci(mZ,di)end e.ours=true da(di,function()return e.on end)if ak(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: pressed "..et(di).." but no window came up")
return false end do local function ul(m0)local cm=m0 .Parent while cm and cm:IsA("GuiObject")do local m1,m2=false,false
for z0,dj in ipairs(cm:GetDescendants())do if dj~=m0 and dj:IsA("GuiButton")and fa(dj):sub(1,7)=="discard"then m1=true end
if dj:IsA("TextLabel")then local hZ=dj.Text:lower()if hZ:find("crate",1,true)or hZ:find("can contain",1,true)or hZ:find("cost",1,true)then m2=true end
end if m1 and m2 then return cm end end cm=cm.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local m3=J:FindFirstChildOfClass("PlayerGui")if not m3 then return nil end for z1,fe in ipairs(m3:GetDescendants())do
if fe:IsA("GuiButton")and not fe:FindFirstAncestor("SABFarmGui")and fa(fe):sub(1,4)=="open"then local h0=ul(fe)
if h0 then e.win=h0 return h0 end end end end local function um(uo)for z2,ff in ipairs(uo:GetDescendants())do
if ff:IsA("GuiButton")then local m4,h1=fa(ff),ff.Name:lower()if m4=="x"or m4=="close"or h1=="x"or h1:find("close",1,true)or h1:find("exit",1,true)then return ff end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(up)task.wait(up and 4 or 1.2)if e.on or e.waiting then return end
local fg=e.findWin()if not fg or not hP(fg)then return end local m5=um(fg)if m5 and mH(m5,function()return not hP(fg)end)then return end
y("the crate window is still open - tap its X")end end local function fh(fi)if not hY()then return false end local m6=x()-(e.openedAt or 0)
if m6<0.6 then ad(0.6-m6)end local h2=e.title local uq,ur=t9()local m7=fi and uq or ur if not m7 then e.lastFail=x()
c.crateFails=c.crateFails+1 y(("crate: no %s button found in %s"):format(fi and"Open"or"Discard",h2))return false
end local us=aa()local ut,z3=mH(m7,function()return(not e.on)or(aa()~=nil and aa()~=us)end)if not ut then e.lastFail=x()
c.crateFails=c.crateFails+1 y("crate: could not press "..(fi and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fi then c.crates=c.crates+1 ak(function()return aa()~=nil end,1.5)local m8=aa()
y(("OPENED %s -> %s"):format(h2,m8 and ah(ab(m8))or"?"))else y("discarded "..h2 .." (nothing ticked in it)")end
return true end e.calls={}function e.saw(uu,...)local uv=select("#",...)e.calls[#e.calls+1]={t=x(),m=uu,n=uv,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(az,a5)local bn=type(az)if(bn=="string"or bn=="number")and type(a5 .data)=="table"then for m9,h3 in pairs(a5 .data)do
if h3==az and type(m9)=="string"and(type(h3)=="string"or type(h3)=="number")then return{__slot="f:"..m9}end end
end if bn=="string"then if a5 .crate and az==a5 .crate then return{__slot="crate"}end if a5 .title and az==a5 .title then return{__slot="title"}end
if a5 .rar and az==a5 .rar then return{__slot="rarity"}end return az end if bn=="number"or bn=="boolean"or bn=="nil"then return az end
if bn=="table"then local m_={}for uw,na in pairs(az)do if type(na)=="table"then return nil,"nested table"end local ux,nb=e.slot(na,a5)
if nb then return nil,nb end m_[uw]=ux end return m_ end local uy,uz=pcall(function()return az:IsA("Instance")end)
if uy and uz then if az==J then return{__slot="player"}end if c.plot and az==c.plot then return{__slot="plot"}end
local fj=c.plot and c.plot:FindFirstChild("CrateStand")if fj and az==fj then return{__slot="stand"}end if fj and az.Parent==fj then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bn..")"end function e.resolve(fk)if type(fk)~="table"then return fk end
local aJ=fk.__slot if aJ and aJ:sub(1,2)=="f:"then return e.data and e.data[aJ:sub(3)]end if aJ=="crate"then return e.data and e.data.name end
if aJ=="title"then return(e.data and e.data.title)or e.title end if aJ=="rarity"then return e.data and e.data.rarity end
if aJ=="player"then return J end if aJ=="plot"then return c.plot end if aJ=="stand"or aJ=="model"then local h4=c.plot and c.plot:FindFirstChild("CrateStand")
if aJ=="stand"or not h4 then return h4 end for z4,nc in ipairs(h4:GetChildren())do if mE(nc.Name)then return nc end end
return nil end local nd={}for uA,uB in pairs(fk)do nd[uA]=e.resolve(uB)end return nd end function e.classify(h5)
if e.directOff then return end local fl={}for z5,h6 in ipairs(e.calls)do if h6 .t<=h5+0.05 and h5-h6 .t<=6 then fl[#fl+1]=h6 end
end if#fl==0 then return end if not ak(function()return(e.heldAt or 0)>=h5-1 end,2.5)then return end local dk={}
for z6,dl in ipairs(fl)do local ne={}for nf=1,dl.n do local uC,ng=e.slot(dl.args[nf],dl)if ng then y("crate call has "..ng.." - keeping the button method")
return end ne[nf]=uC end dk[#dk+1]={m=dl.m,n=dl.n,args=ne}end local h7=e.learned e.learned={seq=dk,mode=h7 and h7 .mode or nil}
ae.dirty=true if not h7 then y(("learned how to open crates directly (%d call%s)"):format(#dk,#dk==1 and""or"s"))end
end function e.replay()local nh=e.learned local ni=aq:FindFirstChild("Remotes")local h8=ni and ni:FindFirstChild("CrateAction")
if not(nh and h8)then return false end local nj=table.unpack or unpack e.replaying=true for z7,dm in ipairs(nh.seq)do
local h9={}for nk=1,dm.n do h9[nk]=e.resolve(dm.args[nk])end task.spawn(function()pcall(function()if dm.m=="InvokeServer"then h8:InvokeServer(nj(h9,1,dm.n))
else h8:FireServer(nj(h9,1,dm.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(uD)return(uD:gsub("[%%|;=,\n]",function(uE)return("%%%02X"):format(uE:byte())end))end
function e.enc(bN)local fm=type(bN)if fm=="string"then return"s"..e.esc(bN)end if fm=="number"then return"n"..tostring(bN)end
if fm=="boolean"then return bN and"b1"or"b0"end if fm=="nil"then return"z"end if bN.__slot then return"k"..bN.__slot end
local h_={}for uF,uG in pairs(bN)do h_[#h_+1]=e.enc(uF).."="..e.enc(uG)end return"t"..table.concat(h_,",")end
function e.dec(nl)local dn,dp=nl:sub(1,1),nl:sub(2)local function uH(uI)return(uI:gsub("%%(%x%x)",function(uJ)return string.char(tonumber(uJ,16))end))end
if dn=="s"then return uH(dp)end if dn=="n"then return tonumber(dp)end if dn=="b"then return dp=="1"end if dn=="k"then return{__slot=dp}end
if dn=="t"then local nm={}for uK in dp:gmatch("[^,]+")do local nn,uL=uK:match("^(.-)=(.*)$")if nn then local no=e.dec(nn)
if no~=nil then nm[no]=e.dec(uL)end end end return nm end return nil end function e.goneOrNew(uM)return function()
if not e.waiting then return true end local np=aa()return np~=nil and np~=uM end end function e.near()local nq=aq:FindFirstChild("Remotes")
local nr=nq and nq:FindFirstChild("CrateAction")local ia=av()local ib=c.plot and c.plot:FindFirstChild("CrateStand")
local ic=ib and ib:FindFirstChild("Spot")if not(nr and ia and ic)then return false,"no crate stand or remote"end
local ie=ia.HumanoidRootPart local fn=ie.CFrame local ns,ig=e.title,"no answer"local uN=aa()local nt=ib:FindFirstChild("Holder")
local function nu()if not nt then return e.waiting or e.on end for z8,uO in ipairs(nt:GetChildren())do if uO:IsA("Model")then return true end end
return false end for uP=1,3 do if not(e.waiting or e.on)or not nu()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(ie.Position-ic.Position).Magnitude>8 then ci(ic,e.prompt)end ad(0.12+0.15*uP)
local aS={}e.replaying=true task.spawn(function()aS.ok,aS.v=pcall(function()return nr:InvokeServer("open")end)
aS.done=true end)ak(function()return aS.done end,6)e.replaying=false local bO=aS.v if aS.done and aS.ok and type(bO)=="table"and bO.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 y(("OPENED %s -> %s (no window)"):format(ns,bO.prize and ah(ab(tostring(bO.prize)))or"?"))
ak(function()local nv=aa()return nv~=nil and nv~=uN end,1.5)if(ie.Position-fn.Position).Magnitude>8 then pcall(function()aI(ia,fn.Position,fn.Position+fn.LookVector)end)end
return true,"opened"end ig=(aS.done and aS.ok and type(bO)=="table")and tostring(bO.reason or"refused, no reason given")
or(aS.done and("error: "..tostring(bO))or"no answer in 6s")ad(0.3)if not nu()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 y(("crate: the server would not open %s next to the stand (%s)"):format(ns,ig))
return false,ig end function e.smart()local ih=e.title if(e.nearFails or 0)<3 then local uQ=e.near()if uQ then return true end
if e.nearFails>=3 then y("opening next to the stand failed 3 times - trying the older ways")end end local bP=e.learned
if bP then local ii=aa()if e.on then e.replay()if ak(e.goneOrNew(ii),3.5)then c.crates=c.crates+1 y("OPENED "..ih.." (direct)")
return true end else if bP.mode~="window"then e.replay()if ak(e.goneOrNew(ii),3.5)then c.crates,e.fails=c.crates+1,0
if bP.mode~="direct"then bP.mode,ae.dirty="direct",true y("crates now open directly - the window never comes up")
end y("OPENED "..ih.." (direct, no window)")return true end end if hY()then e.replay()if ak(e.goneOrNew(ii),3.5)then
c.crates,e.fails=c.crates+1,0 if bP.mode~="window"then bP.mode,ae.dirty="window",true y("crates need their window up first - it shows briefly")
end y("OPENED "..ih.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ae.dirty=bP,nil,true
if e.fails>=3 then e.directOff=true y("direct crate opening failed 3 times - using the button for now")else y("the learned crate call did not work - back to pressing Open")
end end return fh(true)end function A.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end A.cache={}function A.watchCache()A.cache=A.snap()
for uR,nw in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(nw):Connect(function()A.cache[uR]=J:GetAttribute(nw)end))
end end function A.isOn()return J:GetAttribute("AutoRollOn")==true end function A.saw(uS,...)local fo=A.cache
local uT={m=uS,n=select("#",...),args={...},before={rules=fo.rules,stop=fo.stop,on=fo.on,main=fo.main}}task.delay(1.5,function()
if c.alive then pcall(A.learnOne,uT)end end)end function A.learnOne(dq)local ar,dr=A.snap(),dq.before local fp=(ar.rules~=dr.rules)or(ar.stop~=dr.stop)
local nx=(ar.on~=dr.on)or(ar.main~=dr.main)if not fp and not nx then return end local ny={}for nz=1,dq.n do local aF=dq.args[nz]
local bQ=type(aF)if bQ=="string"and aF~=""and aF==ar.rules then aF={__slot="rules"}elseif bQ=="string"and aF~=""and fp and aF==ar.stop and ar.stop~=dr.stop then aF={__slot="stop"}
elseif bQ=="table"then local nA={}for uU,cn in pairs(aF)do if type(cn)=="table"or(type(cn)=="userdata")then A.msg="Auto Roll sends something I cannot repeat"return
end nA[uU]=(type(cn)=="string"and cn~=""and cn==ar.rules)and{__slot="rules"}or cn end aF=nA elseif bQ~="string"and bQ~="number"and bQ~="boolean"and bQ~="nil"then
if aF==J then aF={__slot="player"}else A.msg="Auto Roll sends something I cannot repeat"return end end ny[nz]=aF
end local co={m=dq.m,n=dq.n,args=ny}if fp then local ij=false for uV=1,co.n do local ds=co.args[uV]if type(ds)=="table"and ds.__slot=="rules"then ij=true end
if type(ds)=="table"and not ds.__slot then for z9,nB in pairs(ds)do if type(nB)=="table"and nB.__slot=="rules"then ij=true end end
end end if ij then A.rec.rules={co}else table.insert(A.rec.rules,co)if#A.rec.rules>60 then table.remove(A.rec.rules,1)end
end end if nx then if ar.on==true then A.rec.on=co else A.rec.off=co end d.AutoRoll=(ar.on==true)end if ar.rules and ar.rules~=""then d.ARrules,d.ARstop=ar.rules,ar.stop or""end
ae.dirty=true A.msg=""y(("learned an Auto Roll %s message"):format(fp and"choices"or(ar.on and"on"or"off")))end
function A.resolve(cp)if type(cp)~="table"then return cp end if cp.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cp.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cp.__slot=="player"then return J end
local nC={}for uW,uX in pairs(cp)do nC[uW]=A.resolve(uX)end return nC end function A.replay(nD,uY)local nE=table.unpack or unpack
for z_,dt in ipairs(uY)do local ik={}for nF=1,dt.n do ik[nF]=A.resolve(dt.args[nF])end A.replaying=true pcall(function()
if dt.m=="InvokeServer"then task.spawn(function()pcall(function()nD:InvokeServer(nE(ik,1,dt.n))end)end)else nD:FireServer(nE(ik,1,dt.n))end
end)A.replaying=false task.wait(0.25)end end function A.apply(nG,uZ)if A.busy or not c.alive then return end A.busy=true
pcall(function()local nH=aq:FindFirstChild("Remotes")local il=nH and nH:FindFirstChild("AutoRollAction")if not il then A.msg="this game has no AutoRollAction"return end
local bo=d.AutoRoll if bo and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#A.rec.rules==0 then
A.msg="pick your Auto Roll choices once in the game's menu so I can learn them"y(A.msg)else A.replay(il,A.rec.rules)
if ak(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then y("Auto Roll choices put back")else
A.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"y(A.msg)end end end if bo==A.isOn()or(not bo and not uZ)then return end
local fq=bo and A.rec.on or A.rec.off if not fq then local du=bo and A.rec.off or A.rec.on local nI=du~=nil for u0=1,du and du.n or 0 do
if type(du.args[u0])=="boolean"then nI=false end end if nI then fq=du end end if not fq then A.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bo and"on"or"off")
y(A.msg)return end A.replay(il,{fq})if ak(function()return A.isOn()==bo end,4)then A.msg=""y(("Auto Roll switched %s%s"):format(bo and"ON"or"OFF",nG and(" ("..nG..")")or""))
else A.msg="Auto Roll did not switch - do it once in the game so I can relearn it"y(A.msg)end end)A.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local u1,u2=pcall(function()return J.UserId end)return u1 and u2 or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local u3,im=pcall(function()return require(aq:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if u3 and type(im)=="table"and type(im.Pets)=="table"then j.I=im end return j.I end function j.order()if j.list then return j.list end
local bp=j.info()if not bp then return{}end local bR={}if type(bp.Order)=="table"and#bp.Order>0 then for Aa,nJ in ipairs(bp.Order)do if bp.Pets[nJ]then bR[#bR+1]=nJ end end
else for u4 in pairs(bp.Pets)do bR[#bR+1]=u4 end table.sort(bR,function(u5,u6)return(bp.Pets[u5].price or 0)<(bp.Pets[u6].price or 0)end)
end j.list=bR return bR end function j.nice(nK,io)local nL=j.info()local nM=nL and nL.Pets[nK]return((io and io~="")and(io.." ")or"")..(nM and nM.displayName or tostring(nK))
end function j.data()local fr=J:GetAttribute("PetsData")if type(fr)~="string"then return nil end if fr==j.rawD then return j.lastD end
local u7,dv=pcall(function()return j.HS:JSONDecode(fr)end)dv=(u7 and type(dv)=="table")and dv or nil j.rawD,j.lastD=fr,dv
return dv end function j.pen()return aq:FindFirstChild("PetMeadowSpawns")end function j.srv()return au:GetServerTimeNow()end
function j.money()local ip=J:FindFirstChild("MoneyValue")if ip and type(ip.Value)=="number"then return ip.Value end
return aY()or 0 end function j.wishes()local nN=j.pen()local nO=nN and nN:GetAttribute("Wishes")local iq,nP={},j.srv()
if type(nO)~="string"then return iq end local u8,nQ=pcall(function()return j.HS:JSONDecode(nO)end)if u8 and type(nQ)=="table"then
for u9,ir in pairs(nQ)do if type(ir)=="number"and ir>nP then iq[u9]=ir-nP end end end return iq end function j.call(...)
local nR=aq:FindFirstChild("Remotes")local nS=nR and nR:FindFirstChild("PetRequest")if not nS then return nil end
local nT=table.pack(...)local bS={}task.spawn(function()bS.ok,bS.v=pcall(function()return nS:InvokeServer(table.unpack(nT,1,nT.n))end)
bS.done=true end)local u_=x()while not bS.done and x()-u_<6 do task.wait(0.05)end if bS.done and bS.ok then return bS.v end
return nil end function j.want(va)return d.Pets[va]end function j.closeNaming(is)local nV=pcall(function()local nU=J:FindFirstChild("PlayerScripts")
local vb=nU and nU:FindFirstChild("Naming",true)require(vb).close()end)ad(0.5)if is.Visible then pcall(function()local nW=is:FindFirstChild("NameBox",true)if nW then nW:ReleaseFocus()end end)
is.Visible=false nV=false end return nV end function j.skipNaming()j.namingUntil=x()+10 if j.namingOn then return end
j.namingOn=true task.spawn(function()while c.alive and x()<j.namingUntil do local nX=J:FindFirstChildOfClass("PlayerGui")
local nY=nX and nX:FindFirstChild("MainGui")local fs=nY and nY:FindFirstChild("PetNameGui")if fs and fs.Visible then
ad(0.4)if fs.Visible then j.namingShut=(j.namingShut or 0)+1 pcall(j.closeNaming,fs)break end end ad(0.25)end
j.namingOn=false end)end function j.buyTick()if not d.PetBuy then j.buyMsg="auto adopt is off"return end local it,nZ,ft=j.info(),j.pen(),j.data()
if not(it and nZ and ft)then j.buyMsg="pet data not loaded yet"return end j.tryAt=j.tryAt or{}local dw,iu=#(ft.pets or{}),tonumber(ft.maxOwned)or 60
local vc,n0,dx=j.srv(),{},nil for Ab,aK in ipairs(nZ:GetChildren())do n0[aK.Name]=true local bT,fu=aK:GetAttribute("Pet"),aK:GetAttribute("Variant")or""
local iv=bT and j.want(bT)if iv and iv.b and it.Pets[bT]and(not iv.g or fu=="Big")and z.wantMore(bT,fu,ft)and not aK:GetAttribute("A_"..j.uid)
and(tonumber(aK:GetAttribute("ExpiresAt"))or 0)>vc+1 and x()>=(j.tryAt[aK.Name]or 0)then local dy,n1=j.nice(bT,fu),it.Pets[bT].price or 0
if dw>=iu then dx=("%s is in the pen, but you have %d/%d pets"):format(dy,dw,iu)j.tryAt[aK.Name]=x()+15 elseif j.money()<n1 then
dx=("%s is in the pen - need $%s"):format(dy,aD(n1))j.tryAt[aK.Name]=x()+5 else j.tryAt[aK.Name]=x()+8 local bq=j.call("adopt",aK.Name)
if type(bq)=="table"and bq.ok then dw=dw+1 j.buys=(j.buys or 0)+1 j.recent=j.recent or{}local vd=type(bq.pet)=="table"and bq.pet or{}
table.insert(j.recent,{id=tostring(vd.id or("?"..x())),name=bT,variant=fu,at=x()})if#j.recent>30 then table.remove(j.recent,1)end
y("ADOPTED "..dy)j.skipNaming()dx="adopted "..dy else local n2=type(bq)=="table"and tostring(bq.reason or"no reason given")or"no answer"
y(("adopt %s failed: %s"):format(dy,n2))dx="adopt failed: "..n2 if type(bq)=="table"and bq.bagFull then j.tryAt[aK.Name]=x()+60 end
end end end end for n3 in pairs(j.tryAt)do if not n0[n3]then j.tryAt[n3]=nil end end j.buyMsg=dx or("watching the pen (%d/%d pets)"):format(dw,iu)
end function j.wishTick()if not d.PetWish then j.wishMsg="auto wish is off"return end local fv=j.info()if not(fv and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local fw,iw,br=j.wishes(),0,nil local ve=(type(fv.Wish)=="table"and fv.Wish.cashShare)or 2
local vf=j.data()for Ac,ax in ipairs(j.order())do local n4=j.want(ax)if n4 and n4 .w and z.wantMore(ax,"",vf)then
iw=iw+1 if not fw[ax]and x()>=(j.wishTry[ax]or 0)then local ix=tonumber(J:GetAttribute("PetWishCredits"))or 0
local iy=math.floor((fv.Pets[ax].price or 0)*ve)if ix<=0 and j.money()<iy then j.wishTry[ax]=x()+10 br=("need $%s to wish for %s"):format(aD(iy),j.nice(ax))
j.wishWhy[ax]=br else j.wishTry[ax]=x()+3 local vg=ix>0 and"wishCredit"or"wish"local fy=j.call(vg,ax)if type(fy)=="table"and fy.ok then
j.wishN,j.wishWhy[ax]=j.wishN+1,nil y(("WISHED for %s (%s)"):format(j.nice(ax),ix>0 and"free wish"or("$"..aD(iy))))
else local iz=type(fy)=="table"and tostring(fy.reason or"no reason given")or"no answer"if iz:lower():find("already",1,true)then j.wishTry[ax]=x()+2
else y(("wish %s failed: %s"):format(j.nice(ax),iz))br="wish failed: "..iz end end end end end end if not br then
for Ad,fz in ipairs(j.order())do local n5=j.want(fz)if n5 and n5 .w and not fw[fz]and j.wishWhy[fz]then br=j.wishWhy[fz]break end
end end if not br then local fA={}for Ae,fB in ipairs(j.order())do local n6=j.want(fB)if n6 and n6 .w and fw[fB]then fA[#fA+1]=("%s %dm"):format(j.nice(fB),math.ceil(fw[fB]/60))end
end br=iw==0 and"no pet has WISH ticked"or("running: "..(#fA>0 and table.concat(fA,", ")or"none yet"))end j.wishMsg=br
end q.switches,q.glazed,q.finished=0,0,0 q.done,q.doneN,q.later={},0,{}function q.teams()local iA=j.data()return(iA and iA.teams)or{},iA
end function q.current(cq)cq=cq or j.data()if not cq then return""end local n7={}for Af,vh in ipairs(cq.equipped or{})do n7[tostring(vh)]=true end
for Ag,n8 in ipairs(cq.teams or{})do local n9=n8 .pets or{}local iB=#n9==#(cq.equipped or{})if iB then for Ah,vi in ipairs(n9)do if not n7[tostring(vi)]then iB=false break end end end
if iB then return n8 .name end end return""end function q.equip(iC)local vj,vk=q.teams()local iD for vl,vm in ipairs(vj)do if vm.name==iC then iD=vl break end end
if not iD then q.msg="no saved team called "..tostring(iC)return false end if q.current(vk)==iC then return true end
for Ai=1,4 do local n_=j.call("teamEquip",iD)if type(n_)=="table"and n_.ok then q.switches=q.switches+1 return true
end task.wait(0.4)end return false end function q.left(vn)local oa=vn:FindFirstChild("SquishyPlaceHolder")local ob=oa and oa:FindFirstChild("TimerGui")
local oc=ob and ob:FindFirstChildWhichIsA("TextLabel",true)local iE=oc and oc.Text if type(iE)~="string"or iE:find("-",1,true)then return nil end
local iF,od,oe=iE:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not iF then return nil end local of=oe~=""and(tonumber(iF)*3600+tonumber(od)*60+tonumber(oe))or(tonumber(iF)*60+tonumber(od))
return of>0 and of or nil end function q.waxes()local dz={}local og=c.plot and c.plot:FindFirstChild("WaxStations")
if not og then return dz end local oh=j.srv()for Aj,aT in ipairs(og:GetChildren())do local iG=tonumber(aT:GetAttribute("PourEnd"))
local oi=aT:GetAttribute("PourOwner")if aT:GetAttribute("HasSquishy")and aT:GetAttribute("PourId")and(oi==nil or oi==j.uid)then
local iH=q.left(aT)local oj=iH and(oh+iH)or((iG and iG>oh)and iG or nil)if oj then local ol,om=aT:FindFirstChild("SquishyPlaceHolder"),"?"
if ol then for Ak,oo in ipairs(ol:GetChildren())do if oo:IsA("Model")then om=oo.Name break end end end local vo=tostring(aT:GetAttribute("Helpers")or"")
local iI=0 for Al in vo:gmatch("%d+")do iI=iI+1 end dz[#dz+1]={st=aT,ends=oj,sure=iH~=nil,id=aT:GetAttribute("PourId"),name=om,helps=iI,
long=aT:GetAttribute("PourLong")==true}end end end table.sort(dz,function(vp,vq)return vp.ends<vq.ends end)return dz
end function q.glazeCount()local op=aq:FindFirstChild("Remotes")local oq=op and op:FindFirstChild("EditStack")
if not oq then return nil end local vr,dA=pcall(function()return oq:InvokeServer("State",nil)end)if not(vr and type(dA)=="table"and type(dA.state)=="table")then return nil end
local iJ,iK=0,{}for Am,fC in ipairs(dA.state.entries or{})do if fC.glaze and fC.glaze~=""then iJ=iJ+1 iK[fC.glaze]=(iK[fC.glaze]or 0)+1 end
end return iJ,iK,#(dA.state.entries or{}),dA.state.capacity end function q.finishedOne(fD,ot)q.finished=q.finished+1
task.wait(2)local iL,vs,ou,vt=q.glazeCount()if iL and ot and iL>ot then q.glazed=q.glazed+1 local iM={}for vu,vv in pairs(vs)do iM[#iM+1]=vu.." "..vv end
y(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ah(ab(fD.name)),fD.st.Name,iL,table.concat(iM,", ")))
else y(("wax done on station %s: %s, no glaze%s"):format(fD.st.Name,ah(ab(fD.name)),ou and(" (stack "..ou.."/"..tostring(vt)..")")or""))
end end function q.tick()q.list=q.waxes()if q.editing and x()-(q.editingSince or x())>120 then q.editing=false end
if q.editing then q.msg="rebuilding teams..."return end if not d.Teams then q.want,q.msg="","auto teams is off"return end
local cr=j.srv()local aA=q.glazeFor if aA then local dB=aA.st local ov=dB.Parent and dB:GetAttribute("HasSquishy")and dB:GetAttribute("PourId")==aA.id
local ow=ov and q.left(dB)if ow then aA.ends=cr+ow end if not ov then q.glazeFor,q.afterUntil=nil,x()+1.5 if not q.done[aA.id or"?"]then
q.done[aA.id or"?"],q.doneN=true,q.doneN+1 if q.doneN>400 then q.done,q.doneN={[aA.id or"?"]=true},1 end local vw=aA.before
task.spawn(function()pcall(q.finishedOne,aA,vw)end)end elseif aA.ends-cr>d.GlazeLead*3+60 or cr>aA.ends+90 then
q.glazeFor,q.afterUntil=nil,x()+1.5 q.later[aA.id or"?"]=x()+120 y(("station %s is not finishing yet (%s left) - glaze team off again"):format(dB.Name,q.clock(aA.ends-cr)))
end end if d.TeamGlaze~=""and not q.glazeFor then local vx=q.speedRatio(d.TeamGlaze)for An,bU in ipairs(q.list)do
if bU.sure and(bU.ends-cr)*vx[bU.long and 2 or 1]<=d.GlazeLead and x()>=(q.later[bU.id or"?"]or 0)and not q.done[bU.id or"?"]then
q.glazeFor=bU task.spawn(function()bU.before=q.glazeCount()end)break end end end local aG,fE="",""if d.TeamGlaze~=""and(q.glazeFor or x()<(q.afterUntil or 0))then
aG,fE=d.TeamGlaze,q.glazeFor and(" - station "..q.glazeFor.st.Name.." finishes soon")or""elseif d.TeamWax~=""and(q.placing or q.aboutToPlace())then
aG,fE=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and q.allBusy()then aG,fE=d.TeamFull," - every station is busy"
else aG=d.TeamNormal end q.want=aG local dC=q.current()q.cur=dC if aG~=""and dC~=aG and x()>=(q.nextTry or 0)then
q.nextTry=x()+1.1 if q.equip(aG)then y("team: "..aG..fE)else q.nextTry=x()+3 end end local iN=q.list[1]q.msg=("on: %s%s | next wax done %s"):format(dC~=""and dC or"(not a saved team)",(aG~=""and aG~=dC)and(" -> "..aG)or"",
iN and("in "..q.clock(iN.ends-cr).." (st "..iN.st.Name..")")or"- none running")end function q.clock(bs)bs=math.max(0,math.floor(bs))
if bs>=3600 then return("%d:%02d:%02d"):format(math.floor(bs/3600),math.floor((bs%3600)/60),bs%60)end return("%d:%02d"):format(math.floor(bs/60),bs%60)
end function q.allBusy()local vy,vz=ev()return vz>0 and vy==0 end function q.aboutToPlace()if not c.running then return false end
local ox=aa()if not(ox and aQ(ox))then return false end local vA=ev()return vA>0 end function q.mult(oy,vB,oz)return{(1+oy)*(1+oz),(1+oy+vB)*(1+oz)}end
function q.speedNow()local function iO(vC)return tonumber(J:GetAttribute(vC))or 0 end return q.mult(iO("PetWaxSpeed"),iO("PetLongWax"),iO("PetSocialWax"))
end function q.speedOf(vD)local vE,oA=q.teams()if not oA then return nil end for Ao,oB in ipairs(vE)do if oB.name==vD then
local iP={}for Ap,vF in ipairs(oB.pets or{})do for Aq,oC in ipairs(oA.pets or{})do if tostring(oC.id)==tostring(vF)then iP[#iP+1]=oC break end end
end local oD=z.caps()local oE,vG=z.stats(iP)return q.mult(math.min(oE.waxSpeed or 0,oD.waxSpeed or 0.25),math.min(oE.longWax or 0,oD.longWax or 0.3),vG.socialWax or 0)
end end return nil end function q.speedRatio(vH)local oF,iQ=q.speedNow(),q.speedOf(vH)if not iQ then return{1,1}end
return{oF[1]/iQ[1],oF[2]/iQ[2]}end function q.glazeSoon()return d.Teams and d.TeamGlaze~=""and(q.glazeFor~=nil or x()<(q.afterUntil or 0))
end z.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
z.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}z.buildMsg,z.fuseMsg,z.fused,z.builds="","",0,0
function z.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function z.caps()local iR=j.info()return(iR and type(iR.Caps)=="table")and iR.Caps or z.CAPS
end function z.value(oG,iS)local fF=j.info()local cs=fF and fF.Pets[oG]if not(cs and type(cs.boost)=="table")then return nil end
local bV if type(fF.boostValue)=="function"then local vI,vJ=pcall(fF.boostValue,oG,(iS~=""and iS)or nil)bV=vI and tonumber(vJ)or nil
end if not bV then bV=cs.boost.value or 0 if iS=="Big"then local oH=bV*1.5 bV=z.ROUND[cs.boost.kind]and math.max(bV+1,math.floor(oH+0.5))or oH
end end return cs.boost.kind,bV,cs.boost.every end function z.stats(vK)local bW,iT={},{}for Ar,oI in ipairs(vK)do
local aL,fG,oJ=z.value(oI.name,oI.variant or"")if aL then if aL:sub(1,6)=="social"then iT[aL]=math.max(iT[aL]or 0,fG)
elseif aL=="waxStir"or aL=="cashGift"then bW[aL]=(bW[aL]or 0)+fG*60/(oJ or 60)elseif aL=="luckyPull"then bW.luckyPull=(bW.luckyPull or 0)+fG/(oJ or 10)
else bW[aL]=(bW[aL]or 0)+fG end end end return bW,iT end function z.glazeGain(vL,fH)local dD,iU,As={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local vM=dD[1]+dD[2]+dD[3]local vN=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local ct={}for fI=1,3 do ct[fI]=dD[fI]+vL*dD[fI]/vM+(fI==1 and vN or 0)end
local iV={ct[1]*(1-fH),ct[2]*(1-fH)+ct[1]*fH,ct[3]+ct[2]*fH}return iV[1]*(iU[1]-1)+iV[2]*(iU[2]-1)+iV[3]*(iU[3]-1)
end function z.score(fJ,vO)local iW=z.caps()local fK,fL=z.stats(vO)local function bt(oK)return math.min(fK[oK]or 0,iW[oK]or math.huge)end
local vP=(1+bt("income"))*(1+(fL.socialIncome or 0))*(1+math.min(fK.cashGift or 0,iW.cashGiftPerMinute or 9)/60)
local vQ=1+bt("luck")+(fK.luckyPull or 0)+(fL.socialLuck or 0)local oL=vQ*(1+bt("newFind"))local dE=math.log(vP)
local vR=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local iX=(1+bt("waxSpeed")+bt("longWax"))*(1+(fL.socialWax or 0))
+math.min(fK.waxStir or 0,iW.waxStirPerMinute or 30)/60/vR local vS=1-(1-bt("headStart"))*(1-(fL.socialHeadStart or 0))
if fJ=="farm"then return dE+0.7*math.log(oL)+0.1*math.log(iX)end if fJ=="full"then return dE+0.4*math.log(iX)+0.02*math.log(oL)end
if fJ=="glaze"then return z.glazeGain(bt("glaze"),bt("glazeUp"))+0.001*dE end if fJ=="wax"then return-math.log(1-0.5*vS)+0.001*dE+0.001*math.log(iX)end
return dE end function z.best(oM,cu,vT,iY)iY=iY or{}local as,dF={},{}local function oN(vU)local oO={}for vV,vW in ipairs(vU)do oO[vV]=cu[vW]end return oO end
local function iZ(oP)local i0=z.score(oM,oN(oP))for At,vX in ipairs(oP)do if iY[cu[vX].id]then i0=i0+1e-7 end end
return i0 end for Au=1,math.min(vT,#cu)do local fM,i1 for i2=1,#cu do if not dF[i2]then as[#as+1]=i2 local oQ=iZ(as)
as[#as]=nil if not i1 or oQ>i1+1e-12 then fM,i1=i2,oQ end end end if not fM then break end dF[fM]=true as[#as+1]=fM
end for Av=1,6 do task.wait()local oR,oS=false,iZ(as)for i3=1,#as do for i4=1,#cu do if not dF[i4]then local oT=as[i3]
as[i3]=i4 local oU=iZ(as)if oU>oS+1e-9 then dF[oT],dF[i4],oS,oR=nil,true,oU,true else as[i3]=oT end end end end
if not oR then break end end local oV={}for vY,vZ in ipairs(as)do oV[vY]=tostring(cu[vZ].id)end return oV,z.score(oM,oN(as))
end function z.count(oW,oX,v0)local dG,dH={},0 local oY,oZ={},{}for Aw,v1 in ipairs(oX.arriving or{})do oY[tostring(v1)]=true end
for Ax,cv in ipairs(oX.pets or{})do oZ[tostring(cv.id)]=true if cv.name==oW and not oY[tostring(cv.id)]then if cv.variant=="Big"then dH=dH+1 elseif(cv.variant or"")==""then dG[#dG+1]=cv end
end end if not v0 then for Ay,dI in ipairs(j.recent or{})do if dI.name==oW and not oZ[dI.id]and x()-dI.at<20 then
if dI.variant=="Big"then dH=dH+1 else dG[#dG+1]=dI end end end end return dG,dH end function z.goal(v2)local o0=d.Pets[v2]return o0 and tonumber(o0 .f)or 0 end
function z.wantMore(o1,v3,o2)local i5=z.goal(o1)if i5<=0 or not o2 then return true end local v4,o3=z.count(o1,o2)
if o3>=i5 then return false end if v3=="Big"then return true end return#v4<z.need()*(i5-o3)end function z.status(o4,o5)
local fN=z.goal(o4)if fN<=0 or not o5 then return nil end local v5,i6=z.count(o4,o5)if i6>=fN then return("Big %d/%d done"):format(i6,fN)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#v5,z.need()),z.need(),i6,fN)end function z.wear(i7)local i8={}
for Az,v6 in ipairs(i7)do i8[tostring(v6)]=true end for AA=1,3 do local cw=j.data()if not cw then return false end
for AB,o6 in ipairs(cw.equipped or{})do if not i8[tostring(o6)]then j.call("unequip",o6)task.wait(0.3)end end
cw=j.data()local o7={}for AC,v7 in ipairs(cw.equipped or{})do o7[tostring(v7)]=true end for AD,o8 in ipairs(i7)do
if not o7[tostring(o8)]then j.call("equip",o8)task.wait(0.3)end end task.wait(0.4)cw=j.data()local i9,o9=0,true
for AE,v8 in ipairs(cw.equipped or{})do i9=i9+1 if not i8[tostring(v8)]then o9=false end end if o9 and i9==#i7 then return true end
end return false end function z.saveTeam(o_,pa)if not z.wear(pa)then return false,"could not put the pets on"end
local v9=q.teams()local bX for v_,wa in ipairs(v9)do if wa.name==o_ then bX=v_ break end end local cx if bX then
cx=j.call("teamSave",bX)else cx=j.call("teamNew")if type(cx)=="table"and cx.ok and cx.index then bX=cx.index task.wait(0.3)
j.call("teamRename",{index=bX,name=o_})end end task.wait(0.4)local i_=j.data()local pb=i_ and i_.teams and bX and i_.teams[bX]
if not pb then return false,"the game did not save it"end local pc={}for AF,wb in ipairs(pb.pets or{})do pc[tostring(wb)]=true end
for AG,wc in ipairs(pa)do if not pc[tostring(wc)]then return false,"saved, but not with these pets"end end return true
end z.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function z.quiet()
if q.placing or q.glazeSoon()then return false end local wd=j.srv()for AH,we in ipairs(q.list or{})do if we.ends-wd<(d.GlazeLead or 45)+90 then return false end end
return true end function z.plan()local dJ=j.data()if not dJ then return{}end local pd={}for AI,wf in ipairs(dJ.arriving or{})do pd[tostring(wf)]=true end
local dK={}for AJ,fO in ipairs(dJ.pets or{})do if not pd[tostring(fO.id)]then dK[#dK+1]={id=tostring(fO.id),name=fO.name,variant=fO.variant or""}end
end local pe={}for AK,pf in ipairs(dK)do pe[pf.id]=pf end local pg=tonumber(dJ.slots)or 3 local ja,ph={},{}for AL,fP in ipairs(z.ROLES)do
local dL=d[fP[1]]if dL~=""and not ph[dL]then ph[dL]=true local jb,dM,pj={},{},false for AM,pk in ipairs(dJ.teams or{})do
if pk.name==dL then for AN,wg in ipairs(pk.pets or{})do local jc=pe[tostring(wg)]if jc then jb[jc.id]=true dM[#dM+1]=jc else pj=true end
end end end local jd,pl=z.best(fP[2],dK,pg,jb)local pm=z.score(fP[2],dM)local pn=#jd==#dM for AO,wh in ipairs(jd)do if not jb[wh]then pn=false end end
if not pn and(pj or#dM<math.min(pg,#dK)or pl>pm+1e-4)then ja[#ja+1]={team=dL,role=fP[2],ids=jd,gain=pl-pm}end
end end return ja end function z.rebuild(wi)local po=z.plan()if#po==0 then z.buildMsg="teams are already the best your pets allow"return true end
if not z.quiet()then z.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end q.editing,q.editingSince=true,x()
local fQ=true local wm,wn=pcall(function()for AP,dN in ipairs(po)do local wj,wk=z.saveTeam(dN.team,dN.ids)local pp=j.data()
local je={}for AQ,wl in ipairs(dN.ids)do for AS,jf in ipairs(pp and pp.pets or{})do if tostring(jf.id)==wl then je[#je+1]=j.nice(jf.name,jf.variant)end
end end if wj then y(("TEAM %s rebuilt (%s): %s"):format(dN.team,wi or"pets changed",table.concat(je,", ")))else fQ=false y(("TEAM %s: %s"):format(dN.team,tostring(wk)))end
end end)q.editing,q.nextTry=false,0 if not wm then fQ=false y("TEAM BUILD ERR "..tostring(wn))end z.builds=z.builds+1
z.buildMsg=fQ and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fQ end
function z.fuseTick()if not d.AutoFuse or q.editing then return end local fR=j.data()if not fR then return end
local jg=z.need()local jh,fS={},{}for AT,wo in ipairs(fR.teams or{})do for AU,wp in ipairs(wo.pets or{})do jh[tostring(wp)]=true end end
for AV,wq in ipairs(fR.equipped or{})do fS[tostring(wq)]=true end z.failUntil=z.failUntil or{}for bY,wr in pairs(d.Pets)do
local pq=tonumber(wr.f)or 0 local ji,ws=z.count(bY,fR,true)if pq>0 and ws<pq and#ji>=jg and x()>=(z.failUntil[bY]or 0)then
table.sort(ji,function(fT,fU)local pr=(fS[tostring(fT.id)]and 4 or 0)+(jh[tostring(fT.id)]and 2 or 0)+(fT.named and 1 or 0)
local ps=(fS[tostring(fU.id)]and 4 or 0)+(jh[tostring(fU.id)]and 2 or 0)+(fU.named and 1 or 0)if pr~=ps then return pr<ps end
return tostring(fT.id)<tostring(fU.id)end)local fV,jj={},{}for fW=1,jg do fV[fW]=tostring(ji[fW].id)if fS[fV[fW]]then jj[#jj+1]=fV[fW]end
end q.editing,q.editingSince=true,x()for AW,wt in ipairs(jj)do j.call("unequip",wt)task.wait(0.3)end local fX=j.call("fuse",{ids=fV})
q.editing,q.nextTry=false,0 if type(fX)=="table"and fX.ok then z.fused=z.fused+1 z.dirtyAt=x()y(("FUSED %d %s -> Big %s"):format(jg,j.nice(bY),j.nice(bY)))
z.fuseMsg=("fused a Big %s %s"):format(j.nice(bY),os.date("%H:%M"))else z.failUntil[bY]=x()+120 y(("fuse %s failed: %s"):format(j.nice(bY),type(fX)=="table"and tostring(fX.reason or"no reason given")or"no answer"))
end return end end end function z.tick()pcall(z.fuseTick)if not d.AutoBuild or not d.Teams then return end local pt=j.data()
if not pt then return end local bZ={}for AX,wu in ipairs(pt.pets or{})do bZ[#bZ+1]=tostring(wu.id)end table.sort(bZ)
bZ=table.concat(bZ,",")if bZ~=z.sig then z.sig,z.dirtyAt=bZ,x()end local wv=(z.dirtyAt and x()-z.dirtyAt>8)or x()-(z.lastBuild or 0)>900
if wv and not q.editing then local ww=z.rebuild(z.dirtyAt and"pets changed"or"check")if ww then z.dirtyAt,z.lastBuild=nil,x()end
end end o.bb,o.fx,o.post,o.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}o.watch=setmetatable({},{__mode="k"})
o.mem,o.memPeak,o.fps=0,0,0 function o.isFx(b0)return b0:IsA("ParticleEmitter")or b0:IsA("Trail")or b0:IsA("Beam")or b0:IsA("Fire")or b0:IsA("Smoke")
or b0:IsA("Sparkles")or b0:IsA("Light")end function o.muteOne(aB)if not d.Lite or not aB.Parent then return end
local fY=(aB:IsA("BillboardGui")and o.bb)or(o.isFx(aB)and o.fx)or nil if not fY or fY[aB]~=nil then return end
fY[aB]=aB.Enabled if aB.Enabled then aB.Enabled=false end o.watch[aB]=aB:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aB.Enabled then fY[aB]=true aB.Enabled=false end end)end function o.lite(pu)d.Lite=pu if pu then
task.spawn(function()for wx,wy in ipairs(au:GetDescendants())do if not d.Lite then return end pcall(o.muteOne,wy)
if wx%600==0 then task.wait()end end end)if not o.addConn then o.queue={}o.addConn=T(au.DescendantAdded:Connect(function(jk)
if d.Lite and(jk:IsA("BillboardGui")or o.isFx(jk))then o.queue[#o.queue+1]=jk end end))end local jl=game:GetService("Lighting")
for AY,dO in ipairs(jl:GetChildren())do if dO:IsA("PostEffect")and dO.Enabled and o.post[dO]==nil then o.post[dO]=true dO.Enabled=false end
end pcall(function()o.oldShadows=o.oldShadows==nil and jl.GlobalShadows or o.oldShadows jl.GlobalShadows=false end)
pcall(function()o.oldDeco=o.oldDeco==nil and au.Terrain.Decoration or o.oldDeco au.Terrain.Decoration=false end)
else for AZ,wz in pairs(o.watch)do pcall(function()wz:Disconnect()end)end for pv,wA in pairs(o.bb)do pcall(function()if pv.Parent then pv.Enabled=wA end end)end
for pw,wB in pairs(o.fx)do pcall(function()if pw.Parent then pw.Enabled=wB end end)end for px in pairs(o.post)do pcall(function()if px.Parent then px.Enabled=true end end)end
o.bb,o.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})o.watch,o.post,o.queue=setmetatable({},{__mode="k"}),{},{}
local wC=game:GetService("Lighting")if o.oldShadows~=nil then pcall(function()wC.GlobalShadows=o.oldShadows end)o.oldShadows=nil end
if o.oldDeco~=nil then pcall(function()au.Terrain.Decoration=o.oldDeco end)o.oldDeco=nil end end end o.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function o.hideHud(py)d.HideHud=py local jm=J:FindFirstChildOfClass("PlayerGui")if not jm then return end if py then
for A0,dP in ipairs(jm:GetChildren())do if dP:IsA("ScreenGui")and not o.MINE[dP.Name]and dP.Enabled then o.hud[dP]=true dP.Enabled=false end
end if not o.hudConn then o.hudConn=T(jm.ChildAdded:Connect(function(dQ)if d.HideHud and dQ:IsA("ScreenGui")and not o.MINE[dQ.Name]then
task.defer(function()if d.HideHud and dQ.Enabled then o.hud[dQ]=true dQ.Enabled=false end end)end end))end else
for pz in pairs(o.hud)do pcall(function()if pz.Parent then pz.Enabled=true end end)end o.hud={}end end o.CAPS={0,30,15,10}
function o.cap(jn)d.FpsCap=jn local pA=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not pA then return false end return pcall(pA,jn==0 and 60 or jn)end function o.render(pB)d.NoRender=pB pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not pB)end)
end function o.restoreAll()pcall(o.unpin)if D.arPaused then pcall(D.resume,"script stopped")end pcall(o.lite,false)
pcall(o.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)if(d.FpsCap or 0)~=0 then pcall(o.cap,0)end
end function o.rejoinSame(pC)if c.rejoining then return end y("REJOIN this server ("..pC..")")pcall(ey)if c.autoload then pcall(eX,c.autoload)end
hw()local wD=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then c6(pC..", same server failed")end end)return wD end function o.tick()
local jo=o.queue if d.Lite and jo and#jo>0 then o.queue={}for wE,wF in ipairs(jo)do pcall(o.muteOne,wF)if wE%300==0 then task.wait()end end
end local pD=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if pD then for A1,wG in ipairs(pD:GetChildren())do
local pE=wG:FindFirstChild("SquishyPlaceHolder")local b1=pE and pE:FindFirstChild("TimerGui")if b1 and b1:IsA("BillboardGui")then
if o.bb[b1]==nil then pcall(o.muteOne,b1)elseif b1 .Enabled then o.bb[b1]=true b1 .Enabled=false end end end end
local wH,dR=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if wH and type(dR)=="number"then
o.mem=dR o.memPeak=math.max(o.memPeak,dR)if(d.MemLimit or 0)>0 and dR>d.MemLimit then o.over=(o.over or 0)+1 if o.over>=30 and not c.busy then
o.over=-600 o.rejoinSame(("memory %d MB > %d MB"):format(dR,d.MemLimit))end elseif(o.over or 0)>0 then o.over=0
end end if x()-(o.noteAt or 0)>1800 then o.noteAt=x()y(("health: %d fps, %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function jp(fZ)if type(fZ)~="string"then return false end
fZ=fZ:lower()for A2,wI in ipairs(c.sellWords)do if fZ:find(wI,1,true)then return true end end return false end
local function wJ()local pF=aq:FindFirstChild("Remotes")local jq=pF and pF:FindFirstChild("SellSquishy")if not(jq and jq:IsA("RemoteEvent"))then return false end
if not pcall(function()jq:FireServer()end)then return false end return ak(function()return aa()==nil end,1.5)
end local function wK()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local pG=av()local pH=pG and pG.HumanoidRootPart.Position local dS,pI for A3,cy in ipairs((c.plot or au):GetDescendants())do
if cy:IsA("ProximityPrompt")and(jp(cy.ActionText)or jp(cy.ObjectText)or jp(cy.Name))then local pJ=k5(cy)local jr=(pJ and pH)and(pJ-pH).Magnitude or 1e9
if jr<=400 and(not dS or jr<pI)then dS,pI=cy,jr end end end c.sellSpot=dS c.noSellSpot=(dS==nil)return dS end
local function pK()local js=aa()if not js then c.holding=false return false end if aQ(js)then return false end
local jt=ah(ab(js))if wJ()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
y("SOLD "..jt)return true end local cz=wK()if cz then local pL=cT(cz)if pL then ci(pL,cz)local pM=aa()if pM and not aQ(pM)then
local wL,wM=da(cz,function()return aa()==nil end,function()return cz.Enabled end)if wL then c.sold,c.holding,c.sellFails=c.sold+1,false,0
y(("SOLD %s at %s via %s"):format(jt,et(cz),wM))return true end end end end c.sellFails=c.sellFails+1 y("could not sell "..jt.." ("..c.sellFails..")")
return false end local wN={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function wO(cA)local f0=et(cA):lower()for A4,wP in ipairs(wN)do if f0:find(wP,1,true)then return 0 end end
local aU,ai=cA.Name:lower(),0 local function aM(wQ,wR)return wQ:find(wR,1,true)~=nil end if aM(aU,"collect")then ai=ai+60 end
if aM(aU,"cash")or aM(aU,"money")then ai=ai+45 end if aM(aU,"income")or aM(aU,"claim")then ai=ai+35 end if aM(aU,"coin")or aM(aU,"earn")or aM(aU,"green")then ai=ai+20 end
if aU=="pad"or aU=="touch"then ai=ai+25 end if ai==0 and(aM(f0,"collect")or aM(f0,"cash")or aM(f0,"money"))then ai=25 end
if ai==0 then return 0 end local dT=cA.Color if dT.G>0.5 and dT.G>dT.R*1.4 and dT.G>dT.B*1.4 then ai=ai+15 end
if math.min(cA.Size.X,cA.Size.Y,cA.Size.Z)<2 then ai=ai+5 end return ai end local function wS()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local f1,dU,ju={},nil,29 for A5,f2 in ipairs(c.plot:GetDescendants())do
if f2:IsA("BasePart")then local f3=wO(f2)if f3>0 then f1[#f1+1]={s=f3,p=f2}if f3>ju then dU,ju=f2,f3 end end end
end table.sort(f1,function(wT,wU)return wT.s>wU.s end)c.padCands,c.padPart=f1,dU if dU then y("collect pad: "..et(dU).." (score "..ju..")")end
return dU end local jv="SAB_pad_v1.txt"local function wV(wW)if type(writefile)=="function"then pcall(writefile,jv,table.concat({wW:GetComponents()},","))end
end local function wX()if type(isfile)~="function"or type(readfile)~="function"then return nil end local wY,pN=pcall(function()if isfile(jv)then return readfile(jv)end end)
if not wY or type(pN)~="string"then return nil end local f4={}for wZ in pN:gmatch("[^,]+")do f4[#f4+1]=tonumber(wZ)end
if#f4==12 then return CFrame.new(unpack(f4))end end local function w0(jw,f5,w1)local w2=e6(jw)local jx=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aN=(jx and jx:IsA("BasePart"))and(jx.Position-f5)or Vector3 .new(1,0,0)aN=Vector3 .new(aN.X,0,aN.Z)if aN.Magnitude<0.05 then aN=Vector3 .new(1,0,0)end
aN=aN.Unit for w3=0,7 do local f6=w3*math.pi/4 local w4=Vector3 .new(aN.X*math.cos(f6)-aN.Z*math.sin(f6),0,aN.X*math.sin(f6)+aN.Z*math.cos(f6))
local f7=f5+w4*(w1+5)local jy=hE(f7 .X,f5 .Y,f7 .Z)if jy and math.abs(jy.Y-f5 .Y)<8 then aI(jw,Vector3 .new(f7 .X,jy.Y+w2,f7 .Z))
if hG(jw,0.7)then return true end end end return false end local function w5()c.lastCollect=x()local dV=av()if not dV then return end
local pO,w6=dV.HumanoidRootPart,e6(dV)local dW,pP,dX,jz=nil,4,nil,"?"local jA=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and jA and jA:IsA("BasePart")then dW,jz=(jA.CFrame*c.manualPad).Position,"manual pad"else local a6=wS()
if a6 then dW=Vector3 .new(a6 .Position.X,a6 .Position.Y+a6 .Size.Y/2+w6,a6 .Position.Z)pP,dX,jz=math.max(a6 .Size.X,a6 .Size.Z)/2,a6,a6 .Name
end end if not dW then y("COLLECT: pad not found - stand on it and tap SET PAD")return end local jB=aY()aI(dV,dW)
if dX and type(firetouchinterest)=="function"then pcall(firetouchinterest,pO,dX,0)end ad(d.PadDwell)if dX and type(firetouchinterest)=="function"then pcall(firetouchinterest,pO,dX,1)end
ad(0.5)c.collected=c.collected+1 local jC=aY()y(("COLLECTED (%s) %s"):format(jz,(jB and jC and jC>jB)and("+$"..aD(jC-jB))or"no cash change seen"))
w0(dV,dW,pP)end local dY local function pQ()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then c.capHit,c.placeFails=false,0
y("trying again after being stopped for 5 minutes")dY(true,true)else return nil,c.capMsg,"bad"end end if c.busy then return nil,c.busyText,"ok"end
if not av()then return nil,"waiting for character","wait"end if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=be(),nil,nil
if not c.plot then return nil,"own plot not found yet","wait"end end if not next(d.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local jD,pR=ev()local f8=aa()if f8 then local cB=ah(ab(f8))if not aQ(f8)then local jE=(Q.gift and ab(Q.gift)==ab(f8)and x()-Q.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cB,jE),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cB,jE),"bad"end return"sell",("selling %s (%s)"):format(cB,jE),"warn"
end if jD<1 then return nil,("holding %s - 0 free stations"):format(cB),"wait"end if q.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cB),"wait"end
return"place",("waxing %s (%d free)"):format(cB,jD),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local jF=c.plot:FindFirstChild("CrateStand")if jF then for A6,dZ in ipairs(jF:GetDescendants())do
if dZ:IsA("ProximityPrompt")and dZ.Enabled and hW(dZ)then local a7=dZ.ObjectText if a7==""then a7=cb(jF,"TitleLabel")or""end
if a7~=""and L.wanted(a7)then local w7=er(a7):gsub("crate$","")local pS for pT in pairs(W.members)do if er(pT)==w7 then pS=pT end end
e.waiting,e.at,e.title,e.prompt=true,x(),a7,dZ e.data={name=(a7:gsub("%s","")),rarity=pS,title=a7}y(a7 .." found waiting on your stand")
end break end end end end local pU=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and pU then
local a8=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a8),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 y("could not press the "..a8 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a8),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a8),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a8,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a8),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(a8),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a8),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(a8,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not pU then local pV=e.title..tostring(e.rolledAt)if e.told~=pV then e.told=pV y(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if jD<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(pR,pR),"wait"
end local jG=lh()if not jG then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local d0=bH()
if d0 and mE(d0 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(d0 .name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(d0 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(d0 .name),"ok"
end local bu=hD()if bu.state~="match"then c.matchSince=nil if bu.state=="skip"and not jG.Enabled then return nil,bu.text.." (sold out)","idle"end
return nil,bu.text,bu.level end if not jG.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local d1=x()if d1<c.noCashUntil then local pW,w8=md()if pW then return nil,("cash short: have $%s, price ~$%s"):format(aD(pW),aD(w8)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aD(aY()),math.ceil(c.noCashUntil-d1)),"bad"end if d1-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or d1 local pX=d1-c.matchSince if pX<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bu.shown,pX),"ok"end
return"buy",("buying %s via %s"):format(bu.shown,bu.src),"ok"end o.DEPTH=11 function o.pinTick()local pY=o.hold
if not pY then return end local jH=J.Character local jI=jH and jH:FindFirstChild("HumanoidRootPart")if not jI then return end
jI.CFrame=pY jI.AssemblyLinearVelocity=Vector3 .new(0,0,0)for A7,f9 in ipairs(jH:GetChildren())do if f9:IsA("BasePart")and f9 .CanCollide then o.noclip[f9]=true f9 .CanCollide=false end
end end o.noclip=setmetatable({},{__mode="k"})function o.pin(w9,pZ)o.hold=w9 if pZ then o.surface=pZ end end function o.unpin(w_)
if not o.hold then return end o.hold=nil for p0 in pairs(o.noclip)do pcall(function()if p0 .Parent then p0 .CanCollide=true end end)end
o.noclip=setmetatable({},{__mode="k"})local p1=av()if p1 and o.surface and not w_ then aI(p1,o.surface.Position,o.surface.Position+o.surface.LookVector)
ad(0.1)end end function o.parkTick()if not(d.Ghost and c.running)or o.hold or c.busy then return end local p2=av()
if not p2 or K.seat()then return end local d2=p2 .HumanoidRootPart if d2 .Position.Y<(au.FallenPartsDestroyHeight or-500)+100 then return end
local f_=o.surface if f_ and d2 .Position.Y<f_.Position.Y-5 and(d2 .Position-f_.Position).Magnitude<40 then o.pin(f_-Vector3 .new(0,o.DEPTH,0))
else o.pin(d2 .CFrame-Vector3 .new(0,o.DEPTH,0),d2 .CFrame)end end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local p3=J.Character local p4=p3 and p3:FindFirstChildOfClass("Humanoid")local jJ=p4 and p4 .SeatPart
return(jJ and jJ.Name=="LogSeat")and jJ or nil end function K.due()if not(d.Campfire and c.running)or x()<K.nextAt then return false end
local xa=au:FindFirstChild("NightSeats")if not xa then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire right now (it comes with every weather event)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or x()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
y(K.msg)return false end end return true end function K.sit()local p5,ga=au:FindFirstChild("NightSeats"),av()
if not p5 or not ga then return end local p6,cC=ga.HumanoidRootPart.Position,{}for A8,gb in ipairs(p5:GetChildren())do
local p7=gb:IsA("Seat")and gb.Occupant==nil and gb:FindFirstChildOfClass("ProximityPrompt")if p7 then cC[#cC+1]={st=gb,p=p7}end
end if#cC==0 then K.nextAt,K.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cC,function(xb,xc)return(xb.st.Position-p6).Magnitude<(xc.st.Position-p6).Magnitude end)
local xd,xe=cC[1].st,cC[1].p o.unpin(true)local cD=xd.CFrame aI(ga,cD.Position+cD.LookVector*2+Vector3 .new(0,2.5,0),cD.Position)
ad(0.25)local xf=da(xe,function()return K.seat()~=nil end)if not xf then aI(ga,cD.Position+Vector3 .new(0,2,0),cD.Position+cD.LookVector)
ak(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,x()y(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=x()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then y(K.msg)end end end D.msg,D.nextAt,D.at,D.pulls,D.claims,D.pullLeft,D.collectLeft,D.events="",0,0,0,0,0,0,{}
function D.refresh()D.at=x()local jK=aq:FindFirstChild("Remotes")if not jK then return end local d3,jL,cE=0,0,{}
local xg,p8=pcall(function()return jK.ClanRequest:InvokeServer("state")end)local p9=xg and type(p8)=="table"and p8 .tasks
for A9,bv in ipairs(p9 and p9 .list or{})do if not bv.done and bv.kind=="pull"then d3=math.max(d3,(bv.goal or 0)-(bv.progress or 0))end
if not bv.done then cE[#cE+1]=("%s %d/%d"):format(tostring(bv.text),bv.progress or 0,bv.goal or 0)end end D.events={}
for A_,cF in ipairs(jK:GetChildren())do if cF:IsA("RemoteFunction")and cF.Name:match("^%u%a+Action$")and cF.Name~="CrateAction"and cF.Name~="AutoRollAction"then
local xh,d4=pcall(function()return cF:InvokeServer("state")end)if xh and type(d4)=="table"and d4 .live==true and type(d4 .quests)=="table"then
D.events[#D.events+1]={r=cF,st=d4}for Ba,aH in ipairs(d4 .quests)do if not aH.done and aH.kind=="pull"then d3=math.max(d3,(aH.goal or 0)-(aH.progress or 0))end
if not aH.done and aH.kind=="collect"then jL=math.max(jL,(aH.goal or 0)-(aH.progress or 0))end if not aH.done then cE[#cE+1]=("%s %d/%d"):format(tostring(aH.text),aH.progress or 0,aH.goal or 0)end
end end end end D.pullLeft,D.collectLeft=d3,jL D.msg=#cE>0 and("open: "..table.concat(cE,", "))or"all quests done for today"
end function D.claim()for Bb,d5 in ipairs(D.events)do local p_=d5 .r.Name:gsub("Action$","")for Bc,cG in ipairs(d5 .st.quests)do
if cG.done and not cG.claimed then local xi,qa=pcall(function()return d5 .r:InvokeServer("claimQuest",cG.id)end)
if xi and not(type(qa)=="table"and qa.ok==false)then D.claims=D.claims+1 y(("CLAIMED %s quest: %s (+%s)"):format(p_,tostring(cG.text),tostring(cG.points or cG.treats or"?")))
end ad(0.4)end end if d5 .st.bonusReady==true then local xj=pcall(function()return d5 .r:InvokeServer("claimBonus")end)
if xj then y(("CLAIMED %s daily quest bonus"):format(p_))end ad(0.4)end end end function D.tick()if not(d.Quests and c.running)then
if D.arPaused then D.resume("quests switched off")end return end if x()-D.at<(D.pullLeft>0 and 20 or 90)then return end
D.refresh()pcall(D.claim)if D.pullLeft<=0 and D.arPaused then D.resume("lever quests done")end end function D.pullDue()
return d.Quests and c.running and D.pullLeft>0 and x()>=D.nextAt and not A.busy end function D.lever()local qb=c.plot and c.plot:FindFirstChild("Lever")
local jM=qb and qb:FindFirstChild("Wheel")return jM and jM:FindFirstChildWhichIsA("ProximityPrompt"),jM end function D.resume(xk)
D.arPaused=false if D.arWas then D.arWas=false d.AutoRoll=true task.spawn(A.apply,xk)end end function D.pull()
local gc,jN=D.lever()if not gc or not jN or not jN:IsA("BasePart")then D.nextAt,D.msg=x()+300,"your lever was not found"return end
if not D.arPaused then D.arPaused=true D.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false A.apply("pulling the lever for a quest",true)
if A.isOn()then D.nextAt=x()+30 return end end y(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(D.pullLeft))
end if not gc.Enabled then D.nextAt=x()+1 return end ci(jN,gc)D.asked=nil ms(gc)D.pulls=D.pulls+1 D.pullLeft=D.pullLeft-1
ad(0.6)if D.asked then D.nextAt=x()+600 y(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(D.asked)))
D.resume("a butter the game wants kept is on the pad")return end D.nextAt=x()+2.5 if D.pullLeft<=0 then D.at=0 end
end C.skip,C.skipN,C.n,C.calls,C.fails,C.nextAt,C.msg,C.tries={},0,0,0,0,0,"off",{}function C.can(bw,xl)local jO=bw:GetAttribute("PourOwner")
if type(jO)~="number"or jO==j.uid or not bw:GetAttribute("HasSquishy")then return false end if bw:GetAttribute("PourLong")~=true or bw:GetAttribute("PourFull")==true then return false end
local jP=bw:GetAttribute("PourId")if jP==nil or C.skip[jP]then return false end local qc,jQ,xm=bw:GetAttribute("Helpers"),0,tostring(j.uid)
if type(qc)=="string"then for xn in qc:gmatch("[^,%s]+")do jQ=jQ+1 if xn==xm then return false end end end if jQ>=6 then return false end
local gd=q.left(bw)if not gd then local qd=tonumber(bw:GetAttribute("PourEnd"))gd=qd and(qd-xl)end if not gd or gd<=75 then return false end
local jR=game:GetService("Players"):GetPlayerByUserId(jO)if not jR or jR:GetAttribute("WaxHelpOff")==true then return false end
return true,jR,jP end function C.list()local jS,xo={},j.srv()local qe=au:FindFirstChild("Plots")for Bd,qf in ipairs(qe and qe:GetChildren()or{})do
local qg=qf~=c.plot and qf:FindFirstChild("WaxStations")for Be,jT in ipairs(qg and qg:GetChildren()or{})do local xp,xq,xr=C.can(jT,xo)
local jU=xp and jT:FindFirstChild("SquishyPlaceHolder")if jU and jU:IsA("BasePart")then jS[#jS+1]={st=jT,p=xq,id=xr,part=jU}end
end end return jS end function C.due()return d.Help and c.running and x()>=C.nextAt end function C.skipIt(qh,qi)
C.skip[qh],C.skipN=qi,C.skipN+1 if C.skipN>600 then C.skip,C.skipN,C.tries={[qh]=qi},1,{}end end function C.goHome()
local jV,b2=av(),C.home C.home=nil if not(jV and b2)then return end if d.Ghost and not K.seat()then o.unpin(true)
o.pin(b2-Vector3 .new(0,o.DEPTH,0),b2)elseif o.hold or(jV.HumanoidRootPart.Position-b2 .Position).Magnitude>20 then
o.unpin(true)pcall(aI,jV,b2 .Position,b2 .Position+b2 .LookVector)end end function C.step()local jW,d6=C.list(),av()
if#jW==0 or not d6 then C.nextAt=x()+15 C.msg=("helped %d waxes here%s | none to help right now"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")
C.goHome()return end local qj=d6 .HumanoidRootPart local qk=qj.Position table.sort(jW,function(xs,xt)return(xs.part.Position-qk).Magnitude<(xt.part.Position-qk).Magnitude end)
local aO=jW[1]C.home=C.home or(o.hold and o.surface)or qj.CFrame local bx=aO.part local b3=(bx.Position+aO.st:GetPivot().Position)/2
local ge=C.tries[aO.id]or 0 if d.Ghost and ge==0 and not K.seat()then o.pin(CFrame.new(b3 .X,bx.Position.Y-o.DEPTH,b3 .Z))
else o.unpin(true)local jX=ge==0 and hE(b3 .X,bx.Position.Y,b3 .Z,{bx})if jX and math.abs(jX.Y-bx.Position.Y)<8 then
aI(d6,Vector3 .new(b3 .X,jX.Y+e6(d6),b3 .Z),bx.Position)else aI(d6,bx.Position+Vector3 .new(0,bx.Size.Y/2+3,0),b3)
end end ad(0.3)local d7=aq:FindFirstChild("Remotes")d7=d7 and d7:FindFirstChild("ClanRequest")if not d7 then C.nextAt,C.msg=x()+60,"the game's help remote is missing"return end
local gf,a9=pcall(function()return d7:InvokeServer("help",aO.st:GetAttribute("PourOwner"),tonumber(aO.st.Name))end)
if gf and type(a9)=="table"and a9 .ok then C.n,C.fails=C.n+1,0 C.skipIt(aO.id,"helped")y(("HELPED %s's wax (station %s)"):format(aO.p.DisplayName,aO.st.Name))
C.msg=("helped %d waxes here%s"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")elseif gf and type(a9)=="table"and tostring(a9 .reason or""):lower():find("walk up",1,true)and ge<2 then
C.tries[aO.id]=ge+1 C.nextAt=x()+0.3 elseif gf and type(a9)=="table"and tostring(a9 .reason or""):lower():find("moment",1,true)then
C.waits=(C.waits or 0)+1 C.nextAt=x()+1.6 else local ql=(gf and type(a9)=="table"and tostring(a9 .reason or"refused"))or("error: "..tostring(a9))
C.skipIt(aO.id,ql)C.fails=C.fails+1 if C.fails<=3 then y(("help refused for %s's wax: %s"):format(aO.p.DisplayName,ql))end
if C.fails>=5 then C.fails,C.nextAt,C.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
C.goHome()end end C.nextAt=math.max(C.nextAt,x()+1.2)end function C.onCall(a_)if not d.HelpGuild or type(a_)~="table"or a_.p~="help"or a_.mine or a_.u==j.uid or not a_.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local d8=aq:FindFirstChild("Remotes")
d8=d8 and d8:FindFirstChild("ClanRequest")if not d8 then return end local qm,d9=pcall(function()return d8:InvokeServer("callHelp",a_.u)end)
local qn=tostring(a_.n or a_.un or a_.u)if qm and type(d9)=="table"and d9 .ok then C.calls=C.calls+1 y(("HELPED guildmate %s's wax from here (their call)"):format(qn))
else y(("guild call from %s: %s"):format(qn,(qm and type(d9)=="table"and tostring(d9 .reason or"refused"))or tostring(d9)))
end end)end local function ao(xu,qo,...)if c.busy then return end c.busy,c.busyText=true,xu if o.hold and qo~=C.step then pcall(o.unpin)end
local xv,qp=pcall(qo,...)c.busy,c.busyText=false,""if not xv and qp~=gO then y("ERR "..tostring(qp))end end local function xw()
local aV,xx,xy=pQ()c.reason,c.level=xx,xy if aV=="place"then ao("waxing...",q.place)elseif aV=="crate"then ao("opening crate...",fh,true)
elseif aV=="cratesmart"then ao("opening crate...",e.smart)elseif aV=="cratewin"then ao("opening the crate window...",hY)
elseif aV=="nocrate"then ao("discarding crate...",fh,false)elseif aV=="sell"then ao("selling...",pK)elseif aV=="buy"then ao("buying...",mv,false)
elseif not aV and not c.matchSince and K.due()then ao("sitting at the campfire...",K.sit)elseif not aV and not c.matchSince and D.pullDue()and not aa()and not(bH()and aQ(bH().name))then
ao("pulling the lever for a quest...",D.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(D.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ao("collecting money...",w5)elseif not aV and not c.matchSince and C.due()then ao("helping a wax...",C.step)elseif C.home and not d.Help then
ao("coming back...",C.goHome)elseif not c.busy then o.parkTick()end end function dY(gg,xz)if gg==c.running then return end
c.running=gg if not xz then d.AutoStart=gg end if gg then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=be()or c.plot
y("START")else c.reason="stopped"y("STOP")end end do local by=eS(af.auto)if type(by)=="string"then by=by:gsub("%s+$","")
if by~=""then c.autoload=by local xA=l2(by)y(xA and("loaded config "..by)or("config "..by.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local xC={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}local qq={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function N(xD,xE,xF)local xG,jY=pcall(Instance.new,xD)
if not xG then c.uiErrs=c.uiErrs+1 return nil end for xH,xI in pairs(xE)do if not pcall(function()jY[xH]=xI end)then c.uiErrs=c.uiErrs+1 end
end jY.Parent=xF return jY end local function al(xJ,xK)N("UICorner",{CornerRadius=UDim.new(0,xK or 6)},xJ)end
local a={}local jZ=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")local qr=jZ:FindFirstChild("SABFarmGui")
if qr then qr:Destroy()end local j0=N("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},jZ)
local aj={w=320,h=330,head=30,strip=38,tabs=26}a.root=N("Frame",{Name="Root",Size=UDim2 .new(0,aj.w,0,aj.h),Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),
BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},j0)al(a.root,10)N("UIStroke",{Color=l.line,Thickness=1},a.root)
local ba=UDim2 .new(1,0,1,0)local function F(qs,qt)return UDim2 .new(qs,0,0,0),UDim2 .new(qt,(qs+qt>0.99)and 0 or-4,1,0)end
local function E(xL,xM,xN,xO,xP,xQ)local qu=N("TextButton",{Text=xM,Position=xP,Size=xQ,BackgroundColor3=xN,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=xO,TextColor3=l.text,AutoButtonColor=true},xL)al(qu,6)return qu end local function gh(xR,xS,xT,xU,xV)
local j1=N("TextBox",{Text=xS,PlaceholderText=xT,Position=xU,Size=xV,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=l.text,PlaceholderColor3=l.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},xR)al(j1,6)N("UIPadding",{PaddingLeft=UDim.new(0,8)},j1)
return j1 end local gi=au.CurrentCamera local function xW()local xX,gj=pcall(function()return gi and gi.ViewportSize end)
if xX and gj and gj.X>50 and gj.Y>50 then return gj end end local function bz(d_)local j2=xW()if not(j2 and d_ and d_.Parent)then return end
local xY=pcall(function()local gk,qv=d_.AbsolutePosition,d_.AbsoluteSize local j3=70 local qw=math.clamp(gk.X,j3-qv.X,j2 .X-j3)
local qx=math.clamp(gk.Y,0,j2 .Y-math.min(qv.Y,j3))if math.abs(qw-gk.X)>0.5 or math.abs(qx-gk.Y)>0.5 then d_.Position=UDim2 .new(0,math.floor(qw),0,math.floor(qx))
end end)return xY end local function gl(xZ)local x0,j4=pcall(function()return xZ.AbsolutePosition end)if x0 and j4 then return{math.floor(j4 .X),math.floor(j4 .Y)}end
end local cH={}c.dragMoved={}local function qy(ea,qz,j5)T(ea.InputBegan:Connect(function(cI)if cI.UserInputType~=Enum.UserInputType.MouseButton1 and cI.UserInputType~=Enum.UserInputType.Touch then return end
local j6={start=cI.Position,from=qz.Position,moved=0,target=qz,input=cI,onDrop=j5}cH[ea],c.dragMoved[ea]=j6,0
local j7 j7=cI.Changed:Connect(function()if cI.UserInputState==Enum.UserInputState.End and cH[ea]==j6 then cH[ea]=nil
if j7 then j7:Disconnect()end if j5 then j5(j6 .moved)end end end)end))end T(kR.InputChanged:Connect(function(gm)
if gm.UserInputType~=Enum.UserInputType.MouseMovement and gm.UserInputType~=Enum.UserInputType.Touch then return end
for x1,aW in pairs(cH)do local j8=aW.target if j8 and j8 .Parent then local qA,qB=gm.Position.X-aW.start.X,gm.Position.Y-aW.start.Y
aW.moved=math.max(aW.moved,math.abs(qA)+math.abs(qB))c.dragMoved[x1]=aW.moved j8 .Position=UDim2 .new(aW.from.X.Scale,aW.from.X.Offset+qA,aW.from.Y.Scale,aW.from.Y.Offset+qB)
end end end))T(kR.InputEnded:Connect(function(gn)if gn.UserInputType~=Enum.UserInputType.MouseButton1 and gn.UserInputType~=Enum.UserInputType.Touch then return end
for x2,go in pairs(cH)do if go.input==gn or gn.UserInputType==Enum.UserInputType.MouseButton1 then cH[x2]=nil
if go.onDrop then go.onDrop(go.moved)end end end end))local function O(x3,x4,x5,x6,x7,x8,x9)return N("TextLabel",{Text=x4,Position=x8 or UDim2 .new(0,0,0,0),Size=x9 or ba,BackgroundTransparency=1,
Font=x7 and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=x5,TextColor3=x6,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},x3)
end a.title=N("Frame",{Size=UDim2 .new(1,0,0,aj.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=N("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.title)
al(a.dot,5)O(a.title,"SAB  BUTTER FARM  "..b7,12,l.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=E(a.title,"-",l.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=E(a.title,"X",l.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=N("Frame",{Position=UDim2 .new(0,0,0,aj.head),Size=UDim2 .new(1,0,0,aj.strip),BackgroundColor3=l.bg,BorderSizePixel=0},a.root)
a.bar=N("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
al(a.bar,2)a.reason=O(a.strip,"starting",12,l.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=N("Frame",{Position=UDim2 .new(0,0,0,aj.head+aj.strip),Size=UDim2 .new(1,0,0,aj.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=E(a.tabs,"FARM",l.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=E(a.tabs,"BUTTERS",l.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=E(a.tabs,"CRATES",l.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=E(a.tabs,"PETS",l.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=E(a.tabs,"TEAMS",l.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=E(a.tabs,"SETUP",l.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function cJ()local j9=N("ScrollingFrame",{Position=UDim2 .new(0,0,0,aj.head+aj.strip+aj.tabs),Size=UDim2 .new(1,0,1,-(aj.head+aj.strip+aj.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
N("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},j9)N("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},j9)
return j9 end a.farm,a.but,a.set,a.crt=cJ(),cJ(),cJ(),cJ()a.pet,a.team=cJ(),cJ()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local gp,eb,H=0,12,nil local function ag(qC,x_)gp,eb=gp+1,eb+qC+6 return N("Frame",{Size=UDim2 .new(1,0,0,qC),BackgroundTransparency=1,LayoutOrder=gp},x_ or a.farm)
end local function bA(ya)O(ag(14),ya,10,l.dim,true)end H=ag(34)a.startB=E(H,"START",l.good,14,F(0,0.68))a.killB=E(H,"KILL",l.bad,14,F(0.68,0.32))
local yb=ag(42)local function ec(qD,yc,j_)local ka=N("Frame",{Position=UDim2 .new((qD-1)/j_,0,0,0),Size=UDim2 .new(1/j_,qD<j_ and-4 or 0,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},yb)al(ka,6)local qE=O(ka,"0",15,l.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local yd=O(ka,yc,9,l.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))qE.TextXAlignment,yd.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return qE end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=ec(1,"BOUGHT",5),ec(2,"WAXED",5),ec(3,"SOLD",5),ec(4,"MONEY",5),ec(5,"FREE",5)
a.info=O(ag(40),"",10,l.dim,false)a.tgt=O(ag(26),"",10,l.good,false)bA("MONEY COLLECT")H=ag(28)a.secB=gh(H,tostring(d.Every),"60",F(0,0.2))
O(H,"sec",11,l.dim,false,F(0.21,0.09))a.secSet=E(H,"SET",l.accent,12,F(0.3,0.2))a.colT=E(H,"COLLECT: ON",l.accent,11,F(0.5,0.5))
H=ag(26)a.padB=E(H,"SET PAD (stand on it)",l.panel2,10,F(0,0.55))a.padL=O(H,"",10,l.dim,false,F(0.56,0.44))bA("BUTTERS YOU DID NOT TICK, AND CRATES")
H=ag(28)a.sellT=E(H,"SELL THEM: ON",l.accent,11,F(0,0.55))a.sellB=E(H,"SELL NOW",l.warn,11,F(0.55,0.45))H=ag(28)
a.crateT=E(H,"OPEN CRATES: ON",l.accent,11,F(0,0.55))a.crateB=E(H,"OPEN NOW",l.warn,11,F(0.55,0.45))bA("HELP OTHER PLAYERS' WAXES  (10% off their wax each)")
H=ag(28)a.helpT=E(H,"HELP WAXES: OFF",l.panel2,10,F(0,0.5))a.helpGT=E(H,"GUILD CALLS: OFF",l.panel2,10,F(0.5,0.5))
a.helpL=O(ag(14),"",9,l.dim,false)bA("EVENT CAMPFIRE  /  STAYING OUT OF SIGHT")H=ag(28)a.campT=E(H,"CAMPFIRE: OFF",l.panel2,10,F(0,0.5))
a.ghostT=E(H,"GHOST: OFF",l.panel2,10,F(0.5,0.5))a.campL=O(ag(14),"",9,l.dim,false)bA("QUESTS  (claims event quests; pulls the lever / collects for quests that ask)")
a.questT=E(ag(28),"QUESTS: OFF",l.panel2,10,F(0,1))a.questL=O(ag(28),"",9,l.dim,false)bA("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
H=ag(28)a.arT=E(H,"AUTO ROLL: OFF",l.panel2,11,F(0,0.5))a.arL=O(H,"",9,l.dim,false,F(0.52,0.48))bA("TOOLS")H=ag(30)
a.buyB=E(H,"BUY",l.warn,10,F(0,0.5))a.plB=E(H,"WAX",l.good,10,F(0.5,0.5))bA("LOG")a.log=N("TextLabel",{Size=ba,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},ag(84))al(a.log,6)N("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,eb)gp,eb=0,12 local function am(ye)return ag(ye,a.set)end local function ed(yf)O(am(14),yf,10,l.dim,true)end
ed("SETTINGS FILE  (saved on your phone)")H=am(28)a.cfgName=gh(H,"default","config name",F(0,0.5))a.cfgSave=E(H,"SAVE",l.good,11,F(0.5,0.25))
a.cfgLoad=E(H,"LOAD",l.accent,11,F(0.75,0.25))H=am(26)a.cfgPrev=E(H,"<",l.panel2,11,F(0,0.13))a.cfgPick=E(H,"(none saved)",l.panel2,10,F(0.13,0.74))
a.cfgNext=E(H,">",l.panel2,11,F(0.87,0.13))H=am(26)a.cfgAuto=E(H,"LOAD IT ON LAUNCH: OFF",l.panel2,10,F(0,1))
a.cfgMsg=O(am(26),"",10,l.dim,false)ed("START BY ITSELF")H=am(26)a.autoB=E(H,"INSTALL F.exec",l.accent,10,F(0,1))
a.autoMsg=O(am(30),"",10,l.dim,false)H=am(28)a.startT=E(H,"START FARMING ON LOAD: ON",l.accent,10,F(0,1))O(am(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,l.dim,false)
ed("IF THE GAME DROPS ME")H=am(28)a.rejT=E(H,"AUTO REJOIN: ON",l.accent,11,F(0,0.55))a.rejB=E(H,"REJOIN NOW",l.warn,11,F(0.55,0.45))
a.rejMsg=O(am(30),"",10,l.dim,false)ed("SMOOTHER RUNNING  (for long / overnight runs)")H=am(28)a.pfLite=E(H,"LITE MODE: OFF",l.panel2,10,F(0,0.5))
a.pfHud=E(H,"HIDE GAME HUD: OFF",l.panel2,10,F(0.5,0.5))H=am(28)a.pfFps=E(H,"FPS CAP: GAME",l.panel2,10,F(0,0.5))
a.pfRender=E(H,"STOP 3D: OFF",l.panel2,10,F(0.5,0.5))H=am(28)a.pfMem=gh(H,tostring(d.MemLimit),"2000",F(0,0.24))
O(H,"MB: rejoin this server above it (0 = never)",9,l.dim,false,F(0.26,0.52))a.pfMemSet=E(H,"SET",l.accent,11,F(0.8,0.2))
a.pfInfo=O(am(18),"",10,l.text,false)O(am(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,l.dim,false)
ed("THE ROUND SAB BUTTON")O(am(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,l.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,eb)local qF=N("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},jZ)
a.tgRoot=N("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},qF)al(a.tgRoot,20)N("UIStroke",{Color=l.line,Thickness=1},a.tgRoot)
a.tgBtn=N("TextButton",{Text="SAB",Size=ba,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=l.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=N("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
al(a.tgDot,4)local bc={built=false,boxes={},at=0}local function qG(qH,kb)d.Targets[qH]=kb or nil local kc=bc.boxes[qH]
if kc then kc.Text=kb and"X"or""kc.BackgroundColor3=kb and l.good or l.panel2 end end local function kd()for yg,qI in pairs(bc.boxes)do
local qJ=d.Targets[yg]==true qI.Text=qJ and"X"or""qI.BackgroundColor3=qJ and l.good or l.panel2 end end local ee
local function yh()local yi=0 local ke=N("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=O(ke,"",10,l.dim,false,F(0,0.5))local yj=E(ke,"CLEAR",l.panel2,10,F(0.5,0.24))local yk=E(ke,"REFRESH",l.panel2,10,F(0.74,0.26))
yj.MouseButton1Click:Connect(function()for yl in pairs(d.Targets)do d.Targets[yl]=nil end kd()end)yk.MouseButton1Click:Connect(function()
W.at=0 ho()ee(true)end)return yi end ee=function(ym)if not ho()then if not a.butEmpty then a.butEmpty=O(N("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)end return end if bc.built and not ym and bc.at==W.at then return end
for Bf,kf in ipairs(a.but:GetChildren())do if kf:IsA("Frame")or kf:IsA("TextButton")then kf:Destroy()end end bc.boxes,a.butEmpty={},nil
yh()local kg,kh=36,1 local function qK(qL)kh=kh+1 local yn=N("Frame",{Size=UDim2 .new(1,0,0,qL),BackgroundTransparency=1,LayoutOrder=kh},a.but)
kg=kg+qL+6 return yn end for Bg,gq in ipairs(W.rarOrder)do local yo=qK(24)local yp=qq[gq]or l.text local ki=N("Frame",{Size=ba,BackgroundColor3=l.panel,BorderSizePixel=0},yo)
al(ki,6)O(ki,"  "..gq:upper(),11,yp,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local yq=E(ki,"ALL",l.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local yr=gq yq.MouseButton1Click:Connect(function()local qM=W.members[yr]or{}local qN=false for Bh,ys in ipairs(qM)do if not d.Targets[ys]then qN=true break end end
for Bi,yt in ipairs(qM)do qG(yt,qN)end end)for Bj,kj in ipairs(W.members[gq]or{})do local yu=qK(22)local gr=N("TextButton",{Text="",Size=ba,BackgroundColor3=l.bg,BorderSizePixel=0,
AutoButtonColor=true},yu)al(gr,5)O(gr,"   "..ah(kj),11,l.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local kk=N("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},gr)al(kk,4)bc.boxes[kj]=kk local qO=kj local function qP()qG(qO,not d.Targets[qO])end
gr.MouseButton1Click:Connect(qP)kk.MouseButton1Click:Connect(qP)end end kd()a.but.CanvasSize=UDim2 .new(0,0,0,kg+10)
bc.built,bc.at=true,W.at end function L.paint()for yv,qQ in pairs(L.boxes)do local qR=d.CrateTicks[yv]==true qQ.Text=qR and"X"or""
qQ.BackgroundColor3=qR and l.good or l.panel2 end if a.crtInfo then local kl,km=0,0 for Bk in pairs(L.boxes)do kl=kl+1 end
for Bl,yw in pairs(d.CrateTicks)do if yw then km=km+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(kl,km)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and l.accent or l.panel2
end end function L.build()for Bm,kn in ipairs(a.crt:GetChildren())do if kn:IsA("Frame")or kn:IsA("TextButton")then kn:Destroy()end
end L.boxes={}local ko,kp=12,0 local function gs(qS)kp=kp+1 ko=ko+qS+6 return N("Frame",{Size=UDim2 .new(1,0,0,qS),BackgroundTransparency=1,LayoutOrder=kp},a.crt)
end local kq=gs(28)a.crtInfo=O(kq,"",10,l.dim,false,F(0,0.5))local yx=E(kq,"CLEAR",l.panel2,10,F(0.5,0.24))local yy=E(kq,"REFRESH",l.panel2,10,F(0.74,0.26))
T(yx.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(yy.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=E(gs(28),"",l.accent,11,F(0,1))T(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
O(gs(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,l.dim,false)
for Bn,bd in ipairs(L.list())do local yz=gs(24)local ef=N("TextButton",{Text="",Size=ba,BackgroundColor3=l.panel,BorderSizePixel=0,AutoButtonColor=true},yz)
al(ef,5)O(ef,"  "..(bd.title or bd.name)..(bd.guess and"  (?)"or""),11,qq[bd.rar or""]or l.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
O(ef,bd.price and("$"..aD(bd.price))or(bd.rar or""),9,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local kr=N("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},ef)al(kr,4)L.boxes[bd.k]=kr local qT=bd.k local function qU()d.CrateTicks[qT]=(not d.CrateTicks[qT])or nil
L.paint()end T(ef.MouseButton1Click:Connect(qU))T(kr.MouseButton1Click:Connect(qU))end a.crt.CanvasSize=UDim2 .new(0,0,0,ko+10)
L.built=L.at L.paint()end local qV="farm"local function bB(an)qV=an a.farm.Visible,a.but.Visible,a.set.Visible=(an=="farm"),(an=="but"),(an=="set")
a.crt.Visible=(an=="crt")a.pet.Visible,a.team.Visible=(an=="pet"),(an=="team")a.tabCrt.BackgroundColor3=(an=="crt")and l.accent or l.panel2
a.tabPet.BackgroundColor3=(an=="pet")and l.accent or l.panel2 a.tabTeam.BackgroundColor3=(an=="team")and l.accent or l.panel2
if an=="pet"and not j.built then pcall(j.build)end if an=="team"and not q.built then pcall(q.build)end if an=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(an=="farm")and l.accent or l.panel2 a.tabBut.BackgroundColor3=(an=="but")and l.accent or l.panel2
a.tabSet.BackgroundColor3=(an=="set")and l.accent or l.panel2 if an=="but"then ee(false)end end local function M(qW,qX,yA,yB)
qW.Text=qX and yA or yB qW.BackgroundColor3=qX and l.accent or l.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(qY)
local b4=j.rows and j.rows[qY]if not b4 then return end local eg=d.Pets[qY]or{}b4 .b.BackgroundColor3=eg.b and l.good or l.panel2
b4 .g.BackgroundColor3=eg.g and l.accent or l.panel2 b4 .g.Text=eg.g and"BIG"or"ANY"b4 .w.BackgroundColor3=eg.w and l.warn or l.panel2
local ks=tonumber(eg.f)or 0 b4 .f.Text=ks>0 and(ks.." BIG")or"FUSE"b4 .f.BackgroundColor3=ks>0 and l.good or l.panel2
end function j.flag(kt,gt)local aX=d.Pets[kt]or{}if gt=="f"then local qZ=((tonumber(aX.f)or 0)+1)%4 aX.f=qZ>0 and qZ or nil
elseif aX[gt]then aX[gt]=nil else aX[gt]=true end d.Pets[kt]=(aX.b or aX.g or aX.w or aX.f)and aX or nil j.paintRow(kt)
end function j.paintAll()for yC in pairs(j.rows or{})do j.paintRow(yC)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function j.live()if not j.built then j.build()return end if x()-(j.liveAt or 0)<1 then return end j.liveAt=x()
local q0=j.wishes()local eh=j.data()for gu,gv in pairs(j.rows)do gv.name.Text=j.nice(gu)..(q0[gu]and("   * wish %dm"):format(math.ceil(q0[gu]/60))or"")
local q1=z.status(gu,eh)gv.desc.Text=q1 and(q1 .." | "..gv.boostText)or gv.boostText end local q2=tonumber(J:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eh and#(eh.pets or{})or 0,eh and tonumber(eh.maxOwned)or 60,
aD(j.money()),q2>0 and(" | free wishes "..q2)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local gw=j.info()for Bo,ku in ipairs(a.pet:GetChildren())do if ku:IsA("Frame")or ku:IsA("TextLabel")then ku:Destroy()end
end j.rows={}local kv,gx=0,12 local function cK(q3)kv,gx=kv+1,gx+q3+6 return N("Frame",{Size=UDim2 .new(1,0,0,q3),BackgroundTransparency=1,LayoutOrder=kv},a.pet)
end local kw=cK(28)a.pbT=E(kw,"AUTO ADOPT: OFF",l.panel2,9,F(0,0.34))a.pwT=E(kw,"AUTO WISH: OFF",l.panel2,9,F(0.34,0.33))
a.pfT=E(kw,"AUTO FUSE: OFF",l.panel2,9,F(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy j.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish j.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse j.paintAll()end)
a.pInfo=O(cK(44),"",10,l.dim,false)O(cK(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,l.dim,false)
if not gw then O(cK(30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,gx)
j.built=false return end local cL={}for Bp,q4 in ipairs(j.order())do local kx=gw.Pets[q4].rarity or"?"cL[kx]=cL[kx]or{}
table.insert(cL[kx],q4)end local cM={}for Bq,q5 in ipairs(gw.Rarities or{})do if cL[q5]then cM[#cM+1]=q5 end end
for q6 in pairs(cL)do if not table.find(cM,q6)then cM[#cM+1]=q6 end end for Br,gy in ipairs(cM)do local q7=N("Frame",{Size=ba,BackgroundColor3=l.panel,BorderSizePixel=0},cK(22))
al(q7,6)O(q7,"  "..gy:upper(),11,j.RC[gy]or l.text,true)for Bs,gz in ipairs(cL[gy])do local b5=N("Frame",{Size=ba,BackgroundColor3=l.bg,BorderSizePixel=0},cK(38))
al(b5,5)local yD=O(b5,j.nice(gz),11,j.RC[gy]or l.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local yE,yF=pcall(function()return gw.describe(gz)end)
local q8=yE and tostring(yF)or""local yG=O(b5,q8,9,l.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local q9=E(b5,"BUY",l.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local q_=E(b5,"ANY",l.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local ra=E(b5,"WISH",l.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local rb=E(b5,"FUSE",l.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local gA=gz q9 .MouseButton1Click:Connect(function()j.flag(gA,"b")end)
q_.MouseButton1Click:Connect(function()j.flag(gA,"g")end)ra.MouseButton1Click:Connect(function()j.flag(gA,"w")end)
rb.MouseButton1Click:Connect(function()j.flag(gA,"f")end)j.rows[gz]={b=q9,g=q_,w=ra,f=rb,name=yD,desc=yG,boostText=q8}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,gx+10)j.built=true j.paintAll()end function o.paint()M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end
end function o.applyAll()if d.Lite then o.lite(true)end if d.HideHud then o.hideHud(true)end if d.NoRender then o.render(true)end
if(d.FpsCap or 0)~=0 then o.cap(d.FpsCap)end o.paint()end T(a.pfLite.MouseButton1Click:Connect(function()o.lite(not d.Lite)o.paint()end))
T(a.pfHud.MouseButton1Click:Connect(function()o.hideHud(not d.HideHud)o.paint()end))T(a.pfRender.MouseButton1Click:Connect(function()o.render(not d.NoRender)o.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local yH=table.find(o.CAPS,d.FpsCap or 0)or 1 local rc=o.CAPS[(yH%#o.CAPS)+1]
if not o.cap(rc)and rc~=0 then y("this executor cannot cap fps")end o.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local ky=tonumber(a.pfMem.Text)if ky and ky>=0 then d.MemLimit=math.floor(ky)end o.paint()end))function q.names()
local kz={"(none)"}for Bt,yI in ipairs((q.teams()))do kz[#kz+1]=yI.name end return kz end function q.cycle(kA,yJ)
local gB=q.names()local yK=d[kA]~=""and d[kA]or"(none)"local gC=table.find(gB,yK)or 1 gC=((gC-1+yJ)%#gB)+1 d[kA]=gB[gC]=="(none)"and""or gB[gC]
q.paint()end function q.paint()if not q.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local kB={}for Bu,yL in ipairs((q.teams()))do kB[yL.name]=true end
for yM,rd in pairs(q.pick)do local cN=d[yM]rd.Text=cN==""and"(none)"or(kB[cN]and cN or(cN.." (missing)"))rd.TextColor3=(cN~=""and not kB[cN])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(q.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(q.switches,q.finished,q.glazed,z.fused)
..(z.buildMsg~=""and("\n"..z.buildMsg)or"")local yN,gD=j.srv(),{}for Bv,gE in ipairs(q.list or{})do gD[#gD+1]=("st %-2s %-22s %9s  helps %d"):format(gE.st.Name,ah(ab(gE.name)):sub(1,22),q.clock(gE.ends-yN),gE.helps)
end a.tmList.Text=#gD>0 and table.concat(gD,"\n")or"no waxes running"end function q.build()for Bw,kC in ipairs(a.team:GetChildren())do
if kC:IsA("Frame")or kC:IsA("TextLabel")then kC:Destroy()end end q.pick={}local kD,kE=0,12 local function bC(re)
kD,kE=kD+1,kE+re+6 return N("Frame",{Size=UDim2 .new(1,0,0,re),BackgroundTransparency=1,LayoutOrder=kD},a.team)
end local function ei(yO)O(bC(14),yO,10,l.dim,true)end local function gF(gG)local kF=bC(26)local yP=E(kF,"<",l.panel2,11,F(0,0.14))
local rf=E(kF,"(none)",l.panel,10,F(0.14,0.72))local yQ=E(kF,">",l.panel2,11,F(0.86,0.14))yP.MouseButton1Click:Connect(function()q.cycle(gG,-1)end)
yQ.MouseButton1Click:Connect(function()q.cycle(gG,1)end)rf.MouseButton1Click:Connect(function()q.cycle(gG,1)end)
q.pick[gG]=rf end a.tmT=E(bC(28),"AUTO TEAMS: OFF",l.panel2,11,F(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=q.current()end q.paint()end)a.tmInfo=O(bC(42),"",10,l.dim,false)
local rg=bC(26)a.tmBuild=E(rg,"AUTO BUILD TEAMS: OFF",l.panel2,9,F(0,0.62))a.tmBuildNow=E(rg,"BUILD NOW",l.warn,9,F(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild q.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if q.editing then return end z.buildMsg="building..."task.spawn(function()local yR,yS=pcall(z.rebuild,"you asked")if not yR then y("BUILD ERR "..tostring(yS))end end)
end)ei("NORMAL TEAM  (worn the rest of the time)")gF("TeamNormal")ei("FULL TEAM  (every station busy: money + wax speed)")
gF("TeamFull")ei("GLAZE TEAM  (worn just before a wax finishes)")gF("TeamGlaze")local kG=bC(26)a.tmLead=gh(kG,tostring(d.GlazeLead),"45",F(0,0.2))
O(kG,"sec before it finishes",10,l.dim,false,F(0.22,0.5))local yT=E(kG,"SET",l.accent,11,F(0.75,0.25))yT.MouseButton1Click:Connect(function()
local gH=tonumber(a.tmLead.Text)if gH and gH>=5 and gH<=600 then d.GlazeLead=math.floor(gH)else a.tmLead.Text=tostring(d.GlazeLead)end
q.paint()end)ei("WAX TEAM  (worn while a butter is placed: head starts)")gF("TeamWax")ei("YOUR WAXES  (time left, helps)")
a.tmList=N("TextLabel",{Size=ba,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bC(150))al(a.tmList,6)N("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
O(bC(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,l.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,kE+10)q.built=true q.paint()end local function yU()a.secB.Text=tostring(d.Every)
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ad(0.1)end pcall(o.unpin)end)end M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then dY(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bz(a.root)bz(a.tgRoot)c.lastCollect=x()
kd()L.paint()pcall(j.paintAll)pcall(q.paint)pcall(o.applyAll)end local function yV(rh)task.spawn(function()rh.TextColor3=l.bad
task.wait(0.8)if c.alive then rh.TextColor3=l.text end end)end local function ri()local rj=a.secB.Text:match("^%s*(%d+)%s*$")
local ej=rj and tonumber(rj)if not ej or ej<1 then a.secB.Text=tostring(d.Every)yV(a.secB)y("interval must be a whole number >= 1")
return end if ej==d.Every then return end d.Every,c.lastCollect=ej,x()y("collect every "..ej.."s")end local function P(yW,yX)T(yW.MouseButton1Click:Connect(yX))end
P(a.secSet,ri)T(a.secB.FocusLost:Connect(ri))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(ao,"selling...",pK)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(A.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help C.nextAt,C.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests D.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,function()d.Ghost=not d.Ghost if not d.Ghost then task.spawn(function()while c.busy do ad(0.1)end pcall(o.unpin)end)end
M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")end)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(ao,"opening crate...",fh,true)end)P(a.padB,function()c.plot=be()or c.plot local rk,kH=av(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(rk and kH and kH:IsA("BasePart"))then y("SET PAD: need character and plot")return end c.manualPad=kH.CFrame:ToObjectSpace(rk.HumanoidRootPart.CFrame)
wV(c.manualPad)y("collect pad saved at your position")end)P(a.startB,function()dY(not c.running)end)P(a.buyB,function()
c.plot=be()or c.plot task.spawn(ao,"buying (manual)...",mv,true)end)P(a.plB,function()c.plot=be()or c.plot task.spawn(ao,"waxing (manual)...",mA)
end)P(a.tabFarm,function()bB("farm")end)P(a.tabBut,function()bB("but")end)P(a.tabSet,function()bB("set")end)P(a.tabCrt,function()bB("crt")end)
P(a.tabPet,function()bB("pet")end)P(a.tabTeam,function()bB("team")end)local function yY(kI)c.hidden=kI a.root.Visible=not kI
a.tgBtn.Text=kI and"SAB+"or"SAB"end qy(a.tgBtn,a.tgRoot,function()bz(a.tgRoot)c.togPos=gl(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then yY(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aC,ap={},0
local function bD()aC=lT()if#aC==0 then a.cfgPick.Text="(none saved)"ap=0 return end if ap<1 or ap>#aC then ap=1 end
a.cfgPick.Text=aC[ap]..("  (%d/%d)"):format(ap,#aC)end local function rl()local rm=c.autoload~=nil a.cfgAuto.Text=rm and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=rm and l.accent or l.panel2 end local function kJ()local rn=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if rn~=""then return rn end return(ap>0 and aC[ap])or""end P(a.cfgSave,function()c.winPos=gl(a.root)or c.winPos
c.togPos=gl(a.tgRoot)or c.togPos local ro,rp=eX(kJ())a.cfgMsg.Text=ro and("saved as "..rp)or("could not save: "..rp)
a.cfgMsg.TextColor3=ro and l.good or l.bad bD()y(a.cfgMsg.Text)end)local function yZ(kK)local kL,rq=l2(kK)a.cfgMsg.Text=kL and("loaded "..rq)or("could not load: "..rq)
a.cfgMsg.TextColor3=kL and l.good or l.bad if kL then a.cfgName.Text=kK yU()task.spawn(A.apply,"config "..kK)
end y(a.cfgMsg.Text)end P(a.cfgLoad,function()yZ(kJ())end)P(a.cfgPick,function()bD()if ap>0 then a.cfgName.Text=aC[ap]end
end)P(a.cfgPrev,function()if#aC==0 then bD()return end ap=(ap-2)%#aC+1 bD()a.cfgName.Text=aC[ap]end)P(a.cfgNext,function()
if#aC==0 then bD()return end ap=ap%#aC+1 bD()a.cfgName.Text=aC[ap]end)P(a.cfgAuto,function()if c.autoload then
l4(nil)a.cfgMsg.Text="it will not load a config on launch"else local ek=kJ()local rr=false for Bx,y0 in ipairs(lT())do if y0==ek then rr=true end end
local y1=rr or eX(ek)if y1 and ek~=""then l4(ek)bD()a.cfgMsg.Text=ek.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim rl()end)P(a.autoB,function()
local rs,rt=ti()a.autoMsg.Text=rs and("installed. "..rt)or("failed: "..rt)a.autoMsg.TextColor3=rs and l.good or l.bad
y(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()c6("you asked")end)
local b6=false P(a.minB,function()b6=not b6 a.tabs.Visible=not b6 if b6 then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bB(qV)end a.root.Size=UDim2 .new(0,aj.w,0,b6 and(aj.head+aj.strip)or aj.h)
a.minB.Text=b6 and"+"or"-"end)local function gI()if not c.alive then return end c.alive,c.running=false,false
pcall(o.restoreAll)pcall(ey)for By,y2 in ipairs(gP)do pcall(function()y2:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()j0:Destroy()end)pcall(function()qF:Destroy()end)if b8 .SAB_KILL==gI then b8 .SAB_KILL=nil end
end b8 .SAB_KILL=gI P(a.killB,gI)P(a.xB,gI)qy(a.title,a.root,function()bz(a.root)c.winPos=gl(a.root)or c.winPos
end)local function ru()local el,em=c.reason,c.level if c.busy then el,em=c.busyText,"ok"elseif not c.running then
local Bz,rv,y3=pQ()if c.capHit then el,em=rv,"bad"else el,em="[stopped] "..rv,(y3=="bad")and"bad"or"idle"end c.reason,c.level=el,em
end a.reason.Text=el a.bar.BackgroundColor3=xC[em]or l.dim a.dot.BackgroundColor3=c.running and l.good or(c.capHit and l.bad or l.dim)
a.tgDot.BackgroundColor3=a.dot.BackgroundColor3 a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent a.startB.Text=c.running and"STOP"or"START"
M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")a.startB.BackgroundColor3=c.running and l.warn or l.good
local y4,y5=ev()a.sBought.Text,a.sPlaced.Text,a.sSold.Text=tostring(c.bought),tostring(c.placed),tostring(c.sold)
a.sColl.Text,a.sFree.Text=tostring(c.collected),y4 .."/"..y5 local rw=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local rx=aa()a.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aD(aY()),c.rolls,c.gifts,c.crates,rx and ah(ab(rx))or"nothing",e.on and("   ["..e.title.." window open]")or"",
rw and("in "..rw.."s")or"off")local cO=sU()a.tgt.Text=(#cO==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#cO<=3)and table.concat(cO,", ")or(#cO.." butters ticked")))
a.tgt.TextColor3=(#cO==0)and l.bad or l.good a.padL.Text=c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found")
a.log.Text=table.concat(ep,"\n")if a.butInfo then a.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(W.n,#W.rarOrder,#cO)
end if a.but.Visible and bc.at~=W.at then ee(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then j.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak)
end if a.team.Visible then q.paint()end if a.farm.Visible then a.helpL.Text=(d.Help or d.HelpGuild)and C.msg or"off"
a.questL.Text=d.Quests and(D.msg~=""and D.msg or"checking...")or"off"a.campL.Text=(d.Campfire and K.msg or"campfire off")..(d.Ghost and(o.hold and" | ghost: under"or" | ghost: up")or"")
end M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local ry=(A.rec.on and"on"or"")..(A.rec.off and((A.rec.on and"/"or"").."off")or"")a.arL.Text=A.msg~=""and A.msg or("game: %s | learned: %s%s"):format(A.isOn()and"ON"or"off",
ry~=""and ry or"nothing yet",#A.rec.rules>0 and", choices"or"")a.arL.TextColor3=A.msg~=""and l.warn or l.dim end
b8 .SAB={S=c,CFG=d,EV=Q,U=a,sg=j0,CAT=W,LEARN=ae,buildList=ee,logAll=cP,evAll=cQ,AR=A,CR=L,PF=o,PX=j,TM=q,CRATE=e,FU=z,HX=C,CF=K,QX=D}
y(b7 .." loaded")if c.uiErrs>0 then y("UI: "..c.uiErrs.." properties skipped")end bB("farm")bz(a.root)bz(a.tgRoot)
if gi then pcall(function()T(gi:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bz(a.root)
bz(a.tgRoot)end))end)end bD()rl()if c.config and c.config~=""then a.cfgName.Text=c.config end M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(o.applyAll)pcall(ru)task.spawn(function()local rz=tg()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(rz and("\n(backup: "..rz..")")or"")
local rA=eS(af.exec)if rA and not rA:find("SAB autoloader v2",1,true)then c2(af.exec,af.stub)y("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(eS(af.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(to)end)task.spawn(function()while c.alive do local y6,y7=pcall(ru)if not y6 then y("UI ERR "..tostring(y7))end
task.wait((c.hidden or b6)and 1.5 or 0.25)end end)task.spawn(function()local y8,y9=pcall(tx)if not y8 then y("HOOK ERR "..tostring(y9))end
end)task.spawn(function()pcall(sh)if e.loadSeq and not e.learned then local gJ={}for rB=1,20 do if e.loadSeq[rB]then gJ[#gJ+1]=e.loadSeq[rB]end end
if#gJ>0 then e.learned={seq=gJ,mode=e.loadMode}y("remembered how to open crates directly")end end if ho()then y(("catalog: %d butters in %d rarities"):format(W.n,#W.rarOrder))end
local y_,rC=pcall(wX)if y_ and rC and c.alive and not c.manualPad then c.manualPad=rC end end)task.spawn(function()
while c.alive do local kM,kN=pcall(j.buyTick)if not kM then y("PET ERR "..tostring(kN))task.wait(5)end kM,kN=pcall(j.wishTick)
if not kM then y("WISH ERR "..tostring(kN))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local gK,rD=0,x()
T(game:GetService("RunService").Heartbeat:Connect(function()gK=gK+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if o.hold then pcall(o.pinTick)end end))
o.noteAt=x()while c.alive do task.wait(1)local rE=x()o.fps,gK,rD=gK/math.max(rE-rD,0.001),0,rE local za,zb=pcall(o.tick)
if not za then y("PERF ERR "..tostring(zb))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local zc,zd=pcall(z.tick)if not zc then y("FUSE ERR "..tostring(zd))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local ze,zf=pcall(q.tick)if not ze then y("TEAM ERR "..tostring(zf))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local gL=aq:WaitForChild("Remotes",30)local rF=gL and gL:WaitForChild("ClanEvent",30)
if rF and c.alive then T(rF.OnClientEvent:Connect(function(zg,zh)if zg=="call"then pcall(C.onCall,zh)end end))
end local rG=gL and gL:FindFirstChild("RollConfirmAsk")if rG and c.alive then T(rG.OnClientEvent:Connect(function(zi)D.asked=zi or"butter"end))end
end)task.spawn(function()task.wait(8)while c.alive do local zj,zk=pcall(D.tick)if not zj then y("QUEST ERR "..tostring(zk))task.wait(30)end
task.wait(3)end end)task.spawn(function()while c.alive do task.wait(20)pcall(ey)end end)pcall(A.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local zm=(type(newcclosure)=="function")and newcclosure or function(zl)return zl end local kO
local rH=(type(setnamecallmethod)=="function")and setnamecallmethod or nil kO=hookmetamethod(game,"__namecall",zm(function(rI,...)
local en=getnamecallmethod()if c.alive and(en=="InvokeServer"or en=="FireServer")then local rJ,rK=pcall(function()return rI.Name end)
if rJ and rK=="CrateAction"and not e.replaying then pcall(e.saw,en,...)elseif rJ and rK=="AutoRollAction"and not A.replaying then pcall(A.saw,en,...)end
if rH then rH(en)end end return kO(rI,...)end))e.oldNC=kO end)end if gN then T(J.Idled:Connect(function()pcall(function()gN:CaptureController()gN:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for BA=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and av()and(c.plot or be())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then A.apply("joined")end while c.alive do task.wait(30)if c.alive and d.AutoRoll and c.running and not A.isOn()and not bH()and not aa()
and not e.waiting and not e.on and not c.busy then A.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for BB=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or be()if av()and c.plot and next(d.Targets)then dY(true,true)y("started by itself")
return end task.wait(1)end if c.alive and not c.running then y("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=be()c.lastCollect=x()while c.alive do if c.running then local zn,rL=pcall(xw)if not zn and rL~=gO then y("LOOP ERR "..tostring(rL))end
end task.wait(0.1)end end)gM("loaded - window is at the top left")end local zp,kP=xpcall(rP,function(zo)return tostring(zo).."\n"..debug.traceback()end)
if not zp then pcall(function()warn("SAB "..b7 .." ERROR: "..tostring(kP))end)gM("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b7 .." ERROR: "..tostring(kP))end)pcall(function()local rM=(type(getgenv)=="function"and getgenv())or _G
if type(rM.SAB_KILL)=="function"then rM.SAB_KILL()end for BC,zq in ipairs({"SABFarmGui","SABToggle"})do local rN=J.PlayerGui:FindFirstChild(zq)
if rN then rN:Destroy()end end end)pcall(function()local eo=Instance.new("ScreenGui")eo.Name="SABError"eo.ResetOnSpawn=false
eo.DisplayOrder=1000 local aP=Instance.new("TextBox")aP.Size=UDim2 .new(0,340,0,170)aP.Position=UDim2 .new(0,10,0,50)
aP.BackgroundColor3=Color3 .fromRGB(90,20,20)aP.TextColor3=Color3 .new(1,1,1)aP.TextSize=11 aP.TextWrapped=true
aP.ClearTextOnFocus=false aP.TextXAlignment=Enum.TextXAlignment.Left aP.TextYAlignment=Enum.TextYAlignment.Top
aP.Text="SAB "..b7 .." failed to start. Send this text:\n"..tostring(kP)aP.Parent=eo eo.Parent=J:WaitForChild("PlayerGui")
end)end
