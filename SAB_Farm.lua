local b2="v25"local kz=game:GetService("Players")local F=kz.LocalPlayer or kz.PlayerAdded:Wait()local function gy(rr)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..b2,Text=rr,Duration=6})
end)end gy("script started")local function rs()local aq=game:GetService("ReplicatedStorage")local ar=game:GetService("Workspace")
local kA=game:GetService("UserInputService")local b3=(type(getgenv)=="function"and getgenv())or _G if type(b3 .SAB_KILL)=="function"then pcall(b3 .SAB_KILL)end
local r=(type(tick)=="function")and tick or os.clock local gz=(function()local rt,ru=pcall(function()return game:GetService("VirtualUser")end)return rt and ru or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,MemLimit=2000,Help=false,HelpGuild=false,Campfire=true,Ghost=false,
}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=r(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local O={name=nil,rar=nil,at=r(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local z={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local d={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local j,q,o,y,A,H={},{},{},{},{},{}local gA={}local gB,ee,cG,cH={},{},{},{}local function P(kB)gB[#gB+1]=kB return kB end
local function ac(rv)task.wait(rv)if not c.alive then error(gA,0)end end local function x(ef)ef=os.date("%H:%M:%S").." "..tostring(ef)
table.insert(ee,1,ef)if#ee>6 then table.remove(ee)end cG[#cG+1]=ef if#cG>80 then table.remove(cG,1)end end local function eg(kC)
if type(kC)~="string"then return""end return(kC:lower():gsub("[^%w]",""))end local function W(rw)local kD=eg(rw)
local gC=kD:gsub("butter$","")if gC==""then gC=kD end return gC end local function aT(gD)return type(gD)=="string"and W(gD)~=""and e.Targets[W(gD)]==true end
local function rx(cI)cI=cI:lower()return cI:find("squishy",1,true)~=nil or cI:match("butter$")~=nil or cI:match("butter[^%a]")~=nil
end local gE={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aB(cJ)if type(cJ)~="number"then return"?"end
local eh=1 while math.abs(cJ)>=1000 and eh<#gE do cJ=cJ/1000 eh=eh+1 end local ry=string.format("%.2f",cJ):gsub("%.?0+$","")
return ry..gE[eh]end local function rz(kE)if type(kE)~="string"then return nil end local rA,kF=kE:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local gF=tonumber(rA)if not gF then return nil end if kF==""then return gF end for rB,rC in ipairs(gE)do if rC:lower()==kF:lower()then return gF*1000^(rB-1)end end
return nil end local function aU()local kG=F:GetAttribute("BoardValueMoney")if type(kG)=="number"then return kG end
local kH=F:FindFirstChild("leaderstats")if kH then for yY,rD in ipairs({"Cash","Money","Coins"})do local gG=kH:FindFirstChild(rD)
if gG and type(gG.Value)=="number"then return gG.Value end end end end local function ei(rE)local gH=rE:GetFullName()
if c.plot then local gI=c.plot:GetFullName()if gH:sub(1,#gI)==gI then return gH:sub(#gI+2)end end return gH end
local function as()local ej=F.Character if ej and ej:FindFirstChild("HumanoidRootPart")then local kI=ej:FindFirstChildOfClass("Humanoid")
if kI and kI.Health>0 then return ej end end end local function ba()local gJ=ar:FindFirstChild("Plots")if not gJ then return nil end
local function kJ(rF)local kK=rF:FindFirstChild("Plate")return kK~=nil and kK:FindFirstChild("EditStackAttachment",true)~=nil
end local kL=F:GetAttribute("PlotNumber")if kL~=nil then local gK=gJ:FindFirstChild(tostring(kL))if gK and kJ(gK)then return gK end
end for yZ,kM in ipairs(gJ:GetChildren())do if kJ(kM)then return kM end end end local function cK(kN)local bc=kN and kN.Parent
for y0=1,6 do if not bc then return nil end if bc:IsA("BasePart")then return bc end if bc:IsA("Model")then return bc.PrimaryPart or bc:FindFirstChildWhichIsA("BasePart",true)end
bc=bc.Parent end end local function kO(kP)local gL=kP.Parent if gL and gL:IsA("Attachment")then return gL.WorldPosition end
local kQ=cK(kP)return kQ and kQ.Position end local function rG()local b4=c.plot and c.plot:FindFirstChild("Plate")
if not b4 then return nil end if b4:IsA("BasePart")then return b4 .Position end if b4:IsA("Model")then return b4:GetPivot().Position end
local kR=b4:FindFirstChildWhichIsA("BasePart",true)return kR and kR.Position end local function kS()local gM={}
local kT=c.plot and c.plot:FindFirstChild("WaxStations")if kT then for y1,rH in ipairs(kT:GetChildren())do local kU=rH:FindFirstChild("SquishyPlaceHolder")
local gN=kU and kU:FindFirstChild("PlacePrompt")if gN and gN:IsA("ProximityPrompt")then gM[#gM+1]=gN end end end
return gM end local function ek()local kV,gO=kS(),0 for y2,rI in ipairs(kV)do if rI.Enabled then gO=gO+1 end end
local gP=#kV local gQ=F:GetAttribute("WaxStations")if type(gQ)=="number"and gQ>gP then gP=gQ end return gO,gP
end local function rJ()local kW=as()local kX=kW and kW.HumanoidRootPart.Position local gR,kY for y3,gS in ipairs(kS())do
if gS.Enabled then local kZ=kO(gS)local k0=(kZ and kX)and(kZ-kX).Magnitude or 1e9 if not gR or k0<kY then gR,kY=gS,k0 end
end end return gR end local function k1()local el=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not el then return nil end local k2=el:FindFirstChild("BuyPromptAttachment")local em=(k2 and k2:FindFirstChild("BuyPrompt"))or el:FindFirstChild("BuyPrompt",true)
if em and em:IsA("ProximityPrompt")and em:IsDescendantOf(el)then return em end end local k3={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local rK={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ab={order={},price={},dirty=false}local J={seen={},at=0,boxes={},built=0}local T={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local gT="SAB_order.txt"local function en()if not ab.dirty or type(writefile)~="function"then return end local aw={}
for rL,rM in pairs(ab.price)do aw[#aw+1]="P|"..rL.."|"..string.format("%.0f",rM)end for rN,rO in pairs(ab.order)do aw[#aw+1]="O|"..rN.."|"..table.concat(rO,",")end
if d.learned and d.enc then aw[#aw+1]="M|mode|"..tostring(d.learned.mode or"")for rP,eo in ipairs(d.learned.seq)do
local k4={}for k5=1,eo.n do k4[k5]=d.enc(eo.args[k5])end aw[#aw+1]=("A|%d|%s|%d|%s"):format(rP,eo.m,eo.n,table.concat(k4,";"))
end end local function gU(rQ,rR,ep)local k6={}for k7=1,ep.n do k6[k7]=d.enc(ep.args[k7])end aw[#aw+1]=("R|%d|%s|%s|%d|%s"):format(rR,rQ,ep.m,ep.n,table.concat(k6,";"))
end if d.enc then for rS,rT in ipairs(z.rec.rules)do gU("rules",rS,rT)end if z.rec.on then gU("on",0,z.rec.on)end
if z.rec.off then gU("off",0,z.rec.off)end end for y4,cL in pairs(J.seen)do aw[#aw+1]=("K|%s|%s|%s|%s"):format(cL.name,cL.title or"",cL.rar or"",cL.price and string.format("%.0f",cL.price)or"")
end if pcall(writefile,gT,table.concat(aw,"\n"))then ab.dirty=false end end local function rU()if type(isfile)~="function"or type(readfile)~="function"then return end
local rV,rW=pcall(isfile,gT)if not(rV and rW)then return end local rX,k8=pcall(readfile,gT)if not(rX and type(k8)=="string")then return end
for rY in k8:gmatch("[^\n]+")do local b5,b6,aV=rY:match("^(%a)|([^|]+)|(.*)$")if b5=="P"then ab.price[b6]=tonumber(aV)
elseif b5=="M"then d.loadMode=(aV~=""and aV~="nil")and aV or nil elseif b5=="A"and d.dec then local k9=tonumber(b6)
local k_,eq,rZ=aV:match("^([^|]+)|(%d+)|(.*)$")if k9 and k_ then eq=tonumber(eq)local la,er={},0 for r0 in(rZ..";"):gmatch("([^;]*);")do
er=er+1 if er<=eq then la[er]=d.dec(r0)end end d.loadSeq=d.loadSeq or{}d.loadSeq[k9]={m=k_,n=eq,args=la}end elseif b5=="R"and d.dec then
local lb=tonumber(b6)local es,r1,et,r2=aV:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if lb and es then et=tonumber(et)
local lc,eu={},0 for r3 in(r2 ..";"):gmatch("([^;]*);")do eu=eu+1 if eu<=et then lc[eu]=d.dec(r3)end end local gV={m=r1,n=et,args=lc}
if es=="rules"then z.rec.rules[lb]=gV elseif es=="on"then z.rec.on=gV elseif es=="off"then z.rec.off=gV end end
elseif b5=="K"then local ld,le,r4=aV:match("^([^|]*)|([^|]*)|(.*)$")J.seen[J.key(b6)]={name=b6,title=ld~=""and ld or nil,
rar=le~=""and le or nil,price=tonumber(r4)}elseif b5=="O"and aV~=""then local ev={}for r5 in aV:gmatch("[^,]+")do ev[#ev+1]=r5 end
if#ev>0 then ab.order[b6]=ev end end end end local function r6(ew)if type(ew)~="table"then return end local bz,lf=ew.rarity,ew.contents
if type(bz)~="string"or bz==""or type(lf)~="table"then return end local cM={}for y5,ex in ipairs(lf)do if type(ex)=="table"and type(ex.butter)=="string"then
cM[#cM+1]={n=ex.butter,ch=tonumber(ex.chance)or 0}end end if#cM==0 then return end table.sort(cM,function(r7,r8)return r7 .ch>r8 .ch end)
local cN,cO={},false for r9,r_ in ipairs(cM)do cN[r9]=r_.n end local gW=ab.order[bz]if not gW or#gW~=#cN then cO=true end
if not cO then for lg=1,#cN do if gW[lg]~=cN[lg]then cO=true break end end end ab.order[bz]=cN local gX=tonumber(ew.price)
if gX and ab.price[bz]~=gX then ab.price[bz]=gX cO=true end if cO then ab.dirty=true T.at=0 x("learned the "..bz.." order from its crate")
end end local function b7(sa,sb)local sc=sa:FindFirstChild(sb,true)local sd,gY=pcall(function()return sc.Text end)
return(sd and type(gY)=="string"and gY~="")and gY or nil end local function ae(lh)return T.pretty[lh]or lh end
J.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function J.key(se)return eg(se or"")end
function J.learn(aW)if type(aW)~="table"or type(aW.name)~="string"then return end local gZ=J.key(aW.name)local aX=J.seen[gZ]or{}
local sf=(J.seen[gZ]==nil)or(tonumber(aW.price)and aX.price~=tonumber(aW.price))aX.name,aX.title=aW.name,aW.title or aX.title
aX.rar,aX.price=aW.rarity or aX.rar,tonumber(aW.price)or aX.price J.seen[gZ]=aX if sf then J.at,ab.dirty=r(),true end
end function J.wanted(li)return li~=nil and e.CrateTicks[J.key(li)]==true end function J.list()local b8={}for sh,ey in ipairs(J.base)do b8[J.key(ey[1])]={name=ey[1],title=ey[2],rar=ey[3],i=sh}end
for y6,cP in ipairs(T.rarOrder)do local lj=false for y7,si in pairs(b8)do if si.rar==cP then lj=true break end end
if not lj and cP~="?"then local lk=cP:gsub("[^%w]","").."Crate"b8[J.key(lk)]={name=lk,title=cP.." Crate",rar=cP,i=50,guess=true}
end end for ll,ez in pairs(J.seen)do local aN=b8[ll]or{i=100}aN.name,aN.title,aN.rar=ez.name or aN.name,ez.title or aN.title,ez.rar or aN.rar
aN.price,aN.guess=ez.price or aN.price,nil b8[ll]=aN end local cQ,eA={},{}for sj,sk in ipairs(k3)do cQ[sk]=sj end
for sl,lm in ipairs(T.rarOrder)do cQ[lm]=cQ[lm]or(20+sl)end for sm,cR in pairs(b8)do cR.k=sm cR.price=cR.price or ab.price[cR.rar or""]
eA[#eA+1]=cR end table.sort(eA,function(bA,bB)if bA.price and bB.price and bA.price~=bB.price then return bA.price<bB.price end
local ln,lo=cQ[bA.rar or""]or 99,cQ[bB.rar or""]or 99 if ln~=lo then return ln<lo end if(bA.i or 100)~=(bB.i or 100)then return(bA.i or 100)<(bB.i or 100)end
return bA.k<bB.k end)return eA end local function sn()local lp=aq:FindFirstChild("Assets")local lq=lp and lp:FindFirstChild("Squishies")
if not lq then return false end local g0,lr,b9={},{},{}local eB=0 for y8,eC in ipairs(lq:GetChildren())do local cS=W(eC.Name)
if cS~=""and not g0[cS]then local eD=b7(eC,"RarityText")or"?"g0[cS]=eD lr[cS]=b7(eC,"NameText")or eC.Name b9[eD]=b9[eD]or{}
table.insert(b9[eD],cS)eB=eB+1 end end if eB==0 then return false end for ls,so in pairs(b9)do local lt=ab.order[ls]or rK[ls]
local g1={}if lt then for sp,sq in ipairs(lt)do g1[W(sq)]=sp end end table.sort(so,function(lu,lv)local g2,g3=g1[lu],g1[lv]
if g2 and g3 then return g2<g3 end if g2 then return true end if g3 then return false end return ae(lu)<ae(lv)
end)end local g4={}for sr,ss in ipairs(k3)do g4[ss]=sr end local eE={}for su in pairs(b9)do eE[#eE+1]=su end table.sort(eE,function(g5,g6)
local g7,g8=ab.price[g5],ab.price[g6]if g7 and g8 and g7~=g8 then return g7<g8 end local g9,g_=g4[g5],g4[g6]if g9 and g_ then return g9<g_ end
if g9 then return true end if g_ then return false end return g5<g6 end)T.rar,T.pretty,T.members,T.rarOrder,T.n,T.at=g0,lr,b9,eE,eB,r()
return true end local function ha()if T.at==0 or(r()-T.at)>120 then pcall(sn)end return T.n>0 end local function sv(sw)
local lw=W(sw)return T.rar[lw]or(O.name and W(O.name)==lw and O.rar)or"?"end local function sx()local eF={}for sy,sz in pairs(e.Targets)do if sz then eF[#eF+1]=ae(sy)end end
table.sort(eF)return eF end local ad={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function lx()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function eG(ly)if type(makefolder)~="function"then return end local sA,sB=pcall(isfolder,ly)if not(sA and sB)then pcall(makefolder,ly)end
end local function eH(lz)if type(isfile)~="function"or type(readfile)~="function"then return nil end local sC,sD=pcall(isfile,lz)
if not(sC and sD)then return nil end local sE,sF=pcall(readfile,lz)return sE and sF or nil end local function cT(sG,sH)
if type(writefile)~="function"then return false end return(pcall(writefile,sG,sH))end local function lA(sI)local cU={}
if type(listfiles)~="function"then return cU end local sJ,lB=pcall(listfiles,sI)if not sJ or type(lB)~="table"then return cU end
for y9,sK in ipairs(lB)do cU[#cU+1]=tostring(sK)end return cU end local function lC()local eI={}for y_,sL in ipairs(lA(ad.cfg))do
local lD=sL:match("([^/\\]+)%.txt$")if lD then eI[#eI+1]=lD end end table.sort(eI)return eI end local function sM()
local Q={"V|1"}Q[#Q+1]="N|Every|"..tostring(e.Every)Q[#Q+1]="N|GlazeLead|"..tostring(e.GlazeLead)Q[#Q+1]="N|FpsCap|"..tostring(e.FpsCap)
Q[#Q+1]="N|MemLimit|"..tostring(e.MemLimit)for za,lE in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do Q[#Q+1]="S|"..lE.."|"..e[lE]end
do local eJ={}for sN,cV in pairs(e.Pets)do local lF=(cV.b and"b"or"")..(cV.g and"g"or"")..(cV.w and"w"or"")..((tonumber(cV.f)or 0)>0 and tostring(cV.f)or"")
if lF~=""then eJ[#eJ+1]=sN.."|"..lF end end table.sort(eJ)Q[#Q+1]="P|-"for zb,sO in ipairs(eJ)do Q[#Q+1]="P|"..sO end
end for zc,lG in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost"})do
Q[#Q+1]="B|"..lG.."|"..(e[lG]and"1"or"0")end local hb=F:GetAttribute("AutoRollRules")if type(hb)=="string"and hb~=""then e.ARrules,e.ARstop=hb,tostring(F:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then Q[#Q+1]="S|rules|"..e.ARrules Q[#Q+1]="S|stop|"..e.ARstop end if c.winPos then Q[#Q+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then Q[#Q+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for zd,hc in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local eK={}for sP,sQ in pairs(hc[2])do if sQ then eK[#eK+1]=sP end end table.sort(eK)Q[#Q+1]=hc[1].."|-"for ze,sR in ipairs(eK)do Q[#Q+1]=hc[1].."|"..sR end
end return table.concat(Q,"\n")end local function sS(hd)if type(hd)~="string"or hd==""then return false end local lH,lI,lJ,lK,cW={},false,{},false,nil
for sT in hd:gmatch("[^\n]+")do local aC,aa,au=sT:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and aa=="Every"then local he=tonumber(au)
if he and he>=1 then e.Every=math.floor(he)end elseif aC=="N"and(aa=="FpsCap"or aa=="MemLimit")then local hf=tonumber(au)
if hf and hf>=0 then e[aa]=math.floor(hf)end elseif aC=="N"and aa=="GlazeLead"then local eL=tonumber(au)if eL and eL>=5 and eL<=600 then e.GlazeLead=math.floor(eL)end
elseif aC=="S"and(aa=="TeamNormal"or aa=="TeamFull"or aa=="TeamGlaze"or aa=="TeamWax")then e[aa]=au elseif aC=="P"and aa~=""then
if not cW then cW={}end if aa~="-"and au~=""then cW[aa]={b=au:find("b",1,true)and true or nil,g=au:find("g",1,true)and true or nil,
w=au:find("w",1,true)and true or nil,f=tonumber(au:match("%d"))}end elseif aC=="B"then if e[aa]~=nil then e[aa]=(au=="1")end
elseif aC=="S"and aa=="rules"then e.ARrules=au elseif aC=="S"and aa=="stop"then e.ARstop=au elseif aC=="W"then
c.winPos={tonumber(aa)or 10,tonumber(au)or 44}elseif aC=="G"then c.togPos={tonumber(aa)or 10,tonumber(au)or 300}
elseif aC=="T"and aa~=""then if aa~="-"then lH[aa]=true end lI=true elseif aC=="K"and aa~=""then if aa~="-"then lJ[aa]=true end
lK=true end end if lI then e.Targets=lH end if lK then e.CrateTicks=lJ end if cW then e.Pets=cW end return true
end local function eM(b_)if not lx()then return false,"this executor cannot write files"end b_=(b_ or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if b_==""then return false,"give the config a name"end eG(ad.dir)eG(ad.cfg)if not cT(ad.cfg.."/"..b_..".txt",sM())then return false,"could not write the file"end
c.config=b_ return true,b_ end local function lL(eN)local lM=eH(ad.cfg.."/"..eN..".txt")if not lM then return false,"no config called "..tostring(eN)end
if not sS(lM)then return false,"that config looks empty"end c.config=eN return true,eN end local function lN(hg)
if hg then eG(ad.dir)cT(ad.auto,hg)elseif type(delfile)=="function"then pcall(delfile,ad.auto)else cT(ad.auto,"")
end c.autoload=hg end local function sU()if c.selfPath then return c.selfPath end local eO for zf,sV in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ad.dir})do
for zg,lO in ipairs(lA(sV))do local hh=lO:lower()if hh:sub(-4)==".lua"and(hh:find("sab_farm",1,true)or hh:find("sab farm",1,true))then
eO=eO or lO end end end c.selfPath=eO return eO end ad.stub=[[
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
local function sW()if not lx()then return false,"this executor cannot write files"end eG("autoexec")if not cT(ad.exec,ad.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local eP=(function()local sX,sY=pcall(function()return game:GetService("TeleportService")end)return sX and sY or nil end)()
local function hi()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local sZ=queueonteleport or queue_on_teleport return(pcall(sZ,ad.stub))end local function cX(s0)if c.rejoining then return end
c.rejoining=true x("REJOIN ("..s0 ..")")pcall(en)if c.autoload then pcall(eM,c.autoload)end local s1=hi()x(s1 and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for zh=1,30 do if not eP then break end pcall(function()eP:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function s2()local s3,lP=pcall(function()return game:GetService("GuiService")end)if s3 and lP then
pcall(function()P(lP.ErrorMessageChanged:Connect(function()if e.Rejoin then cX("roblox error message")end end))
end)end pcall(function()local lQ=game:GetService("CoreGui")local lR=lQ and lQ:WaitForChild("RobloxPromptGui",15)
local lS=lR and lR:WaitForChild("promptOverlay",15)if lS then P(lS.ChildAdded:Connect(function(s4)if e.Rejoin and tostring(s4 .Name):lower():find("errorprompt",1,true)then cX("disconnect prompt")end
end))end end)pcall(function()P(F.OnTeleport:Connect(function(s5)if tostring(s5):find("Started")then hi()end end))
end)if eP then pcall(function()P(eP.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()cX("teleport retry")end)end
end))end)end end local function lT(s6)local lU=c.plot and c.plot:FindFirstChild(s6)if not lU then return nil,false end
for zi,hj in ipairs(lU:GetChildren())do if hj:IsA("Model")or hj:IsA("BasePart")then return hj,true end end return nil,true
end local function cY()local bd=lT("RolledSquishy")if not bd then return nil end return{model=bd,name=bd.Name,pretty=b7(bd,"NameText")or ae(W(bd.Name)),
rar=b7(bd,"RarityText")or sv(bd.Name),price=b7(bd,"PriceText")}end local function lV(hk)return type(hk)=="string"and(T.rar[W(hk)]~=nil or rx(hk))
end local function V()local hl=lT("SquishyEquipped")if hl then c.carrySrc,d.heldAt="model",r()return hl.Name,hl end
local lW=F.Character if lW then for zj,cZ in ipairs(lW:GetDescendants())do if(cZ:IsA("Model")or cZ:IsA("Tool"))and lV(cZ.Name)then
c.carrySrc,d.heldAt="character",r()return cZ.Name,cZ end end end local eQ=F:GetAttribute("SquishyEquipped")if type(eQ)=="string"and eQ~=""and lV(eQ)and r()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return eQ,nil end c.carrySrc=nil end local function zk()local zl,s7=V()return s7 end local function lX()
local lY=cY()local hm=lY and rz(lY.price)local hn=aU()if hm and hn and hn<hm*0.5 then return hn,hm end end local function ca(s8)
cH[#cH+1]=os.date("%H:%M:%S").." "..s8 if#cH>40 then table.remove(cH,1)end end local function s9(bC,eR)if type(bC)~="string"then return end
ca(("Roll(%s,%s)"):format(bC,tostring(eR)))if bC:lower():find("crate",1,true)then d.rolled,d.rolledAt=bC,r()return
end O.seq=O.seq+1 O.name,O.at=bC,r()O.rar=type(eR)=="string"and eR or nil c.rolls=c.rolls+1 if aT(bC)then x(("ROLL %s [%s] = TARGET"):format(bC,tostring(eR)))end
end local function s_(bD)if type(bD)~="table"then return end local eS=bD.butter or bD.itemName if type(eS)~="string"then return end
c.gifts=c.gifts+1 O.gift,O.giftAt=eS,r()if type(bD.giftId)=="string"then local lZ=aq:FindFirstChild("Remotes")
local l0=lZ and lZ:FindFirstChild("GiftThanks")if l0 then pcall(function()l0:FireServer(bD.giftId)end)end end
ca("Gift("..eS.." from "..tostring(bD.fromName)..")")x(("GIFT from %s: %s - it will not be waxed"):format(tostring(bD.fromName),eS))
end local function ta()local l1=aq:WaitForChild("Remotes",30)if not c.alive then return end if not l1 then x("Remotes folder missing - no roll events")return end
P(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local l2=F:GetAttribute("SquishyEquipped")
if type(l2)=="string"and l2~=""then d.heldAt=r()end end))local tg={SquishyRollAnimation=s9,InitSquishy=function(l3)O.init,O.initAt=tostring(l3),r()ca("Init("..tostring(l3)..")")end,
CrateUpdate=function(cb,l4)pcall(r6,cb)pcall(J.learn,cb)if type(cb)=="table"then local tb=l4==true or(d.rolled~=nil and r()-d.rolledAt<15)or d.waiting
if not tb then return end local tc=not d.waiting local td=d.on d.waiting,d.data,d.at=true,cb,r()d.on=(l4==true)
d.title=tostring(cb.title or cb.name or"crate")if d.on and not td then d.openedAt,d.byYou=r(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then ca("CrateWindow open("..d.title..")")elseif tc then ca("Crate waiting("..d.title..")")x(d.title.." is waiting on your stand")
end else if d.waiting then ca("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local te=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,te)end if d.classify then local tf=r()
task.spawn(function()pcall(d.classify,tf)end)end end end,GiftReceived=s_,}for eT,th in pairs(tg)do local ho=l1:FindFirstChild(eT)
if ho and ho:IsA("RemoteEvent")then P(ho.OnClientEvent:Connect(th))elseif eT~="CrateUpdate"and eT~="GiftReceived"then x("remote "..eT.." missing")end
end end local function hp()local bE=cY()if bE then if aT(bE.name)then return{state="match",shown=bE.pretty,src="pad",info=bE}
end return{state="skip",info=bE,level="idle",text=("on pad: %s [%s] - not ticked"):format(bE.pretty,tostring(bE.rar))}
end if O.name and(r()-O.at)<4 then if aT(O.name)then return{state="match",shown=ae(W(O.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ae(W(O.name)),tostring(O.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function hq(ti,tj,tk,tl)
local eU=RaycastParams.new()eU.FilterType=Enum.RaycastFilterType.Exclude local hr={F.Character}for zm,tm in ipairs(tl or{})do hr[#hr+1]=tm end
eU.FilterDescendantsInstances=hr pcall(function()eU.RespectCanCollide=true end)local l5=ar:Raycast(Vector3 .new(ti,tj+4,tk),Vector3 .new(0,-30,0),eU)
return l5 and l5 .Position or nil end local function eV(l6)local l7=l6:FindFirstChildOfClass("Humanoid")return((l7 and l7 .HipHeight)or 2)+l6 .HumanoidRootPart.Size.Y/2+0.2
end local function hs(tn,to)local ht=tn:FindFirstChildOfClass("Humanoid")local tp=r()while r()-tp<to do if ht and(ht.FloorMaterial~=Enum.Material.Air or ht.SeatPart)then return true end
ac(0.05)end return false end local function aF(tq,hu,hv)local l8=tq.HumanoidRootPart l8 .AssemblyLinearVelocity=Vector3 .new(0,0,0)
l8 .CFrame=hv and CFrame.new(hu,Vector3 .new(hv.X,hu.Y,hv.Z))or CFrame.new(hu)end local function c0(aY,l9)local bF=as()
if not bF or not aY then return false end local be=aY.Position local eW=math.clamp(math.max(aY.Size.X,aY.Size.Z)/2+2.2,3,7)
local l_=(l9 and l9 .MaxActivationDistance)or 10 if eW>l_-2 then eW=math.max(2.5,l_-2)end local c1={}local function bG(c2)
c2=Vector3 .new(c2 .X,0,c2 .Z)if c2 .Magnitude>0.05 then c1[#c1+1]=c2 .Unit end end local ma=rG()if ma then bG(ma-be)end
bG(aY.CFrame.LookVector)bG(-aY.CFrame.LookVector)bG(aY.CFrame.RightVector)bG(-aY.CFrame.RightVector)bG(bF.HumanoidRootPart.Position-be)
if#c1==0 then bG(Vector3 .new(0,0,1))end local tr,eX=eV(bF),false for zn,ts in ipairs(c1)do local eY=be+ts*eW
local hw=hq(eY.X,be.Y,eY.Z,{aY})if hw and math.abs(hw.Y-be.Y)<14 then aF(bF,Vector3 .new(eY.X,hw.Y+tr,eY.Z),be)
if hs(bF,0.7)then eX=true break end end end if not eX then aF(bF,be+c1[1]*eW+Vector3 .new(0,3,0),be)eX=hs(bF,1)
end ac(0.12)return eX end local function tt(c3)if not c3 .Parent or not c3 .Enabled then return false end pcall(function()c3:InputHoldBegin()end)
ac(math.max(c3 .HoldDuration,0)+0.08)pcall(function()c3:InputHoldEnd()end)return true end local function ah(mb,tu)
local tv=r()while r()-tv<tu do if mb()then return true end ac(0.05)end return mb()end local function c4(cc,tw,mc,tx)
local ty=c.zapFirst and{"zap","hold"}or{"hold","zap"}for tz,hx in ipairs(ty)do if tz==2 and(tx or not(cc.Parent and cc.Enabled and(not mc or mc())))then break end
local hy if hx=="hold"then hy=tt(cc)else hy=type(fireproximityprompt)=="function"and cc.Parent~=nil and cc.Enabled and pcall(fireproximityprompt,cc)end
if hy and ah(tw,1.2)then c.zapFirst=(hx=="zap")return true,hx end end return false end local function md(hz)local bf=k1()
if not bf or not bf.Enabled then x("buy: nothing on the pad")return false end local me=cK(bf)if not me then x("buy: pad part missing")return false end
c.lastBuyAt=r()local tA,mf=O.seq,aU()c0(me,bf)if not bf.Enabled then x("buy aborted: pad emptied")return false end
local cd=hp()if not hz and cd.state~="match"then x("buy aborted: "..(cd.text or"pad changed"))c.matchSince=nil
return false end local hA=cd.info and cd.info.name or(cd.state=="match"and O.name)or nil local function tB()return bf.Enabled and V()==nil and(hz or hp().state=="match")
end local tC,tD=c4(bf,function()return V()~=nil or((not bf.Enabled)and(hz or O.seq==tA))end,tB,lX()~=nil)if tC then
ah(function()return V()~=nil end,0.8)local c5=V()local mg=aU()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil O.name,O.rar,O.at=nil,nil,r()x(("BOUGHT %s%s via %s"):format(c5 and ae(W(c5))or(cd.shown or"?"),(mf and mg)and(" for $"..aB(mf-mg))or"",tD))
if c5 and hA and W(c5)~=W(hA)then x(("note: picked up %s, not %s"):format(c5,hA))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=r()+math.min(8*2^(c.cashFails-1),60)local mh=cY()x(("BUY REFUSED: cash short? have $%s, price %s"):format(aB(aU()),(mh and mh.price)or"?"))
return false end local function mi()local eZ=V()if not eZ then c.holding=false x("place: hands are empty")return false
end if not aT(eZ)then x(("REFUSED TO WAX %s - it is not ticked"):format(ae(W(eZ))))return false end for zo=1,e.PlaceTries do
local bh=rJ()if not bh then x("place: no free station")break end local mj=cK(bh)if mj then c0(mj,bh)local mk=V()
if not mk then c.holding=false x("place: hands emptied on the way")return false end if not aT(mk)then x("place: what I carry changed, not waxing it")return false end
if bh.Enabled then local tE,tF=c4(bh,function()return not bh.Enabled end,function()return bh.Enabled end)if tE then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=r()+2.5,0 O.name,O.rar,O.at=nil,nil,r()
x(("WAXED %s #%d at %s via %s"):format(ae(W(eZ)),c.placed,bh.Parent.Parent.Name,tF))return true end end end ac(0.25)
end c.placeFails=c.placeFails+1 if V()==nil then c.holding=false end x("PLACE FAILED ("..c.placeFails..")")if c.placeFails>=2 then
c.capHit,c.running,c.capAt=true,false,r()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(V()))x(c.capMsg)end return false end function q.place()local tG=r()while c.alive and q.editing and r()-tG<25 do ac(0.2)end
if e.Teams and e.TeamWax~=""then q.placing=true local tH=r()while c.alive and q.current()~=e.TeamWax and r()-tH<5 do ac(0.1)end
if q.current()==e.TeamWax then ac(0.3)else x("wax team did not come on in time - placing anyway")end end local tI,ml=pcall(mi)
q.placing=false if not tI then error(ml,0)end return ml end local function mm(mn)return type(mn)=="string"and mn:lower():find("crate",1,true)~=nil
end local tJ={SABFarmGui=1,SABToggle=1,SABError=1}local function hB(tK)local bi=tK while bi do if tJ[bi.Name]then return false end
if bi:IsA("ScreenGui")then local tL,tM=pcall(function()return bi.Enabled end)return(not tL)or tM~=false end if bi:IsA("GuiObject")and not bi.Visible then return false end
bi=bi.Parent end return false end local function e0(e1)local ce=""pcall(function()if e1:IsA("TextButton")then ce=e1 .Text end end)
if not ce:find("%a")then for zp,e2 in ipairs(e1:GetDescendants())do if(e2:IsA("TextLabel")or e2:IsA("TextButton"))and e2 .Text:find("%a")then ce=e2 .Text break end
end end if not ce:find("%a")then ce=e1 .Name end return(ce:lower():gsub("[^%a]",""))end local function tN()local c6,c7
local mo=F:FindFirstChildOfClass("PlayerGui")if not mo then return nil,nil end for zq,c8 in ipairs(mo:GetDescendants())do
if c8:IsA("GuiButton")and hB(c8)then local hC=e0(c8)if hC:sub(1,4)=="open"and not hC:find("shop",1,true)then c6=c6 or c8 end
if hC:sub(1,7)=="discard"then c7=c7 or c8 end end end if c6 and c7 then return c6,c7 end if d.on then return c6,c7 end
return nil,nil end local hD=(function()local tO,tP=pcall(function()return game:GetService("VirtualInputManager")end)return tO and tP or nil end)()
local function mp(aZ,hE)local hF={}local function mq(tQ)hF[#hF+1]=tQ end if c.tapWay then mq(c.tapWay)end for zr,mr in ipairs({"touch","conn","signal"})do
if mr~=c.tapWay then mq(mr)end end local function ms(tR,...)local tS,hG=pcall(getconnections,tR)if not(tS and type(hG)=="table"and#hG>0)then return false end
local mt,tT,tU=false,{...},select("#",...)for zs,tV in ipairs(hG)do if pcall(function()tV:Fire(table.unpack(tT,1,tU))end)then mt=true end
end return mt end local function mu()local mv=Vector3 .new(0,0,0)pcall(function()local mw,mx=aZ.AbsolutePosition,aZ.AbsoluteSize
mv=Vector3 .new(mw.X+mx.X/2,mw.Y+mx.Y/2,0)end)local hH={Position=mv,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()hH.UserInputType=Enum.UserInputType.Touch end)pcall(function()hH.UserInputState=Enum.UserInputState.End end)
return hH end for zt,a0 in ipairs(hF)do local c9=false if a0=="conn"and type(getconnections)=="function"then if ms(aZ.MouseButton1Click)then
c9=true if ah(hE,1.5)then c.tapWay=a0 return true,a0 end end c9=ms(aZ.Activated,mu(),1)elseif a0=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aZ.MouseButton1Click)then if ah(hE,1.5)then c.tapWay=a0 return true,a0 end end c9=pcall(firesignal,aZ.Activated,mu(),1)
elseif a0=="touch"and hD then c9=pcall(function()local my,mz=aZ.AbsolutePosition,aZ.AbsoluteSize local mA=0 local mB=aZ:FindFirstAncestorWhichIsA("ScreenGui")
local tW,tX=pcall(function()return mB and mB.IgnoreGuiInset end)if not(tW and tX)then pcall(function()mA=game:GetService("GuiService"):GetGuiInset().Y end)
end local mC,mD=my.X+mz.X/2,my.Y+mz.Y/2+mA hD:SendMouseButtonEvent(mC,mD,0,true,game,1)task.wait(0.06)hD:SendMouseButtonEvent(mC,mD,0,false,game,1)
end)end if c9 and ah(hE,1.5)then c.tapWay=a0 return true,a0 end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function hI(mE)local c_=mE.Parent while c_ and c_~=c.plot do if d.NOT[c_.Name]then return false end c_=c_.Parent
end local hJ=(mE.ActionText or""):lower()if hJ:find("roll",1,true)or hJ:find("place",1,true)or hJ:find("sell",1,true)then return false end
return true end local function tY()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not c.plot then return nil end local mF=c.plot:FindFirstChild("CrateStand")local da if mF then for zu,e3 in ipairs(mF:GetDescendants())do
if e3:IsA("ProximityPrompt")and e3 .Enabled and hI(e3)then da=e3 break end end end if not da then for zv,bj in ipairs(c.plot:GetDescendants())do
if bj:IsA("ProximityPrompt")and bj.Enabled and hI(bj)then local mG=bj:FindFirstAncestorWhichIsA("Model")local tZ=((bj.ActionText or"").." "..(bj.ObjectText or"").." "..bj.Name.." "..(mG and mG.Name or"")):lower()
if tZ:find("crate",1,true)then da=bj break end end end end d.prompt=da return da end local function hK()if d.on then return true end
local db=tY()if not db then d.summonFails=d.summonFails+1 d.lastFail=r()x("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local mH=cK(db)if mH then c0(mH,db)end d.ours=true c4(db,function()return d.on end)if ah(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=r()x("crate: pressed "..ei(db).." but no window came up")
return false end do local function t0(mI)local cf=mI.Parent while cf and cf:IsA("GuiObject")do local mJ,mK=false,false
for zw,dc in ipairs(cf:GetDescendants())do if dc~=mI and dc:IsA("GuiButton")and e0(dc):sub(1,7)=="discard"then mJ=true end
if dc:IsA("TextLabel")then local hL=dc.Text:lower()if hL:find("crate",1,true)or hL:find("can contain",1,true)or hL:find("cost",1,true)then mK=true end
end if mJ and mK then return cf end end cf=cf.Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local mL=F:FindFirstChildOfClass("PlayerGui")if not mL then return nil end for zx,e4 in ipairs(mL:GetDescendants())do
if e4:IsA("GuiButton")and not e4:FindFirstAncestor("SABFarmGui")and e0(e4):sub(1,4)=="open"then local hM=t0(e4)
if hM then d.win=hM return hM end end end end local function t1(t2)for zy,e5 in ipairs(t2:GetDescendants())do
if e5:IsA("GuiButton")then local mM,hN=e0(e5),e5 .Name:lower()if mM=="x"or mM=="close"or hN=="x"or hN:find("close",1,true)or hN:find("exit",1,true)then return e5 end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(t3)task.wait(t3 and 4 or 1.2)if d.on or d.waiting then return end
local e6=d.findWin()if not e6 or not hB(e6)then return end local mN=t1(e6)if mN and mp(mN,function()return not hB(e6)end)then return end
x("the crate window is still open - tap its X")end end local function e7(e8)if not hK()then return false end local mO=r()-(d.openedAt or 0)
if mO<0.6 then ac(0.6-mO)end local hO=d.title local t4,t5=tN()local mP=e8 and t4 or t5 if not mP then d.lastFail=r()
c.crateFails=c.crateFails+1 x(("crate: no %s button found in %s"):format(e8 and"Open"or"Discard",hO))return false
end local t6=V()local t7,zz=mp(mP,function()return(not d.on)or(V()~=nil and V()~=t6)end)if not t7 then d.lastFail=r()
c.crateFails=c.crateFails+1 x("crate: could not press "..(e8 and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if e8 then c.crates=c.crates+1 ah(function()return V()~=nil end,1.5)local mQ=V()
x(("OPENED %s -> %s"):format(hO,mQ and ae(W(mQ))or"?"))else x("discarded "..hO.." (nothing ticked in it)")end
return true end d.calls={}function d.saw(t8,...)local t9=select("#",...)d.calls[#d.calls+1]={t=r(),m=t8,n=t9,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(ax,a1)local bk=type(ax)if(bk=="string"or bk=="number")and type(a1 .data)=="table"then for mR,hP in pairs(a1 .data)do
if hP==ax and type(mR)=="string"and(type(hP)=="string"or type(hP)=="number")then return{__slot="f:"..mR}end end
end if bk=="string"then if a1 .crate and ax==a1 .crate then return{__slot="crate"}end if a1 .title and ax==a1 .title then return{__slot="title"}end
if a1 .rar and ax==a1 .rar then return{__slot="rarity"}end return ax end if bk=="number"or bk=="boolean"or bk=="nil"then return ax end
if bk=="table"then local mS={}for t_,mT in pairs(ax)do if type(mT)=="table"then return nil,"nested table"end local ua,mU=d.slot(mT,a1)
if mU then return nil,mU end mS[t_]=ua end return mS end local ub,uc=pcall(function()return ax:IsA("Instance")end)
if ub and uc then if ax==F then return{__slot="player"}end if c.plot and ax==c.plot then return{__slot="plot"}end
local e9=c.plot and c.plot:FindFirstChild("CrateStand")if e9 and ax==e9 then return{__slot="stand"}end if e9 and ax.Parent==e9 then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bk..")"end function d.resolve(e_)if type(e_)~="table"then return e_ end
local aG=e_.__slot if aG and aG:sub(1,2)=="f:"then return d.data and d.data[aG:sub(3)]end if aG=="crate"then return d.data and d.data.name end
if aG=="title"then return(d.data and d.data.title)or d.title end if aG=="rarity"then return d.data and d.data.rarity end
if aG=="player"then return F end if aG=="plot"then return c.plot end if aG=="stand"or aG=="model"then local hQ=c.plot and c.plot:FindFirstChild("CrateStand")
if aG=="stand"or not hQ then return hQ end for zA,mV in ipairs(hQ:GetChildren())do if mm(mV.Name)then return mV end end
return nil end local mW={}for ud,ue in pairs(e_)do mW[ud]=d.resolve(ue)end return mW end function d.classify(hR)
if d.directOff then return end local fa={}for zB,hS in ipairs(d.calls)do if hS.t<=hR+0.05 and hR-hS.t<=6 then fa[#fa+1]=hS end
end if#fa==0 then return end if not ah(function()return(d.heldAt or 0)>=hR-1 end,2.5)then return end local dd={}
for zC,de in ipairs(fa)do local mX={}for mY=1,de.n do local uf,mZ=d.slot(de.args[mY],de)if mZ then x("crate call has "..mZ.." - keeping the button method")
return end mX[mY]=uf end dd[#dd+1]={m=de.m,n=de.n,args=mX}end local hT=d.learned d.learned={seq=dd,mode=hT and hT.mode or nil}
ab.dirty=true if not hT then x(("learned how to open crates directly (%d call%s)"):format(#dd,#dd==1 and""or"s"))end
end function d.replay()local m0=d.learned local m1=aq:FindFirstChild("Remotes")local hU=m1 and m1:FindFirstChild("CrateAction")
if not(m0 and hU)then return false end local m2=table.unpack or unpack d.replaying=true for zD,df in ipairs(m0 .seq)do
local hV={}for m3=1,df.n do hV[m3]=d.resolve(df.args[m3])end task.spawn(function()pcall(function()if df.m=="InvokeServer"then hU:InvokeServer(m2(hV,1,df.n))
else hU:FireServer(m2(hV,1,df.n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(ug)return(ug:gsub("[%%|;=,\n]",function(uh)return("%%%02X"):format(uh:byte())end))end
function d.enc(bH)local fb=type(bH)if fb=="string"then return"s"..d.esc(bH)end if fb=="number"then return"n"..tostring(bH)end
if fb=="boolean"then return bH and"b1"or"b0"end if fb=="nil"then return"z"end if bH.__slot then return"k"..bH.__slot end
local hW={}for ui,uj in pairs(bH)do hW[#hW+1]=d.enc(ui).."="..d.enc(uj)end return"t"..table.concat(hW,",")end
function d.dec(m4)local dg,dh=m4:sub(1,1),m4:sub(2)local function uk(ul)return(ul:gsub("%%(%x%x)",function(um)return string.char(tonumber(um,16))end))end
if dg=="s"then return uk(dh)end if dg=="n"then return tonumber(dh)end if dg=="b"then return dh=="1"end if dg=="k"then return{__slot=dh}end
if dg=="t"then local m5={}for uo in dh:gmatch("[^,]+")do local m6,up=uo:match("^(.-)=(.*)$")if m6 then local m7=d.dec(m6)
if m7~=nil then m5[m7]=d.dec(up)end end end return m5 end return nil end function d.goneOrNew(uq)return function()
if not d.waiting then return true end local m8=V()return m8~=nil and m8~=uq end end function d.near()local m9=aq:FindFirstChild("Remotes")
local m_=m9 and m9:FindFirstChild("CrateAction")local hX=as()local hY=c.plot and c.plot:FindFirstChild("CrateStand")
local hZ=hY and hY:FindFirstChild("Spot")if not(m_ and hX and hZ)then return false,"no crate stand or remote"end
local h0=hX.HumanoidRootPart local fc=h0 .CFrame local na,h1=d.title,"no answer"local ur=V()local nb=hY:FindFirstChild("Holder")
local function nc()if not nb then return d.waiting or d.on end for zE,us in ipairs(nb:GetChildren())do if us:IsA("Model")then return true end end
return false end for ut=1,3 do if not(d.waiting or d.on)or not nc()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end if(h0 .Position-hZ.Position).Magnitude>8 then c0(hZ,d.prompt)end ac(0.12+0.15*ut)
local aO={}d.replaying=true task.spawn(function()aO.ok,aO.v=pcall(function()return m_:InvokeServer("open")end)
aO.done=true end)ah(function()return aO.done end,6)d.replaying=false local bI=aO.v if aO.done and aO.ok and type(bI)=="table"and bI.ok then
c.crates,d.fails,d.nearFails=c.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,r()+4 x(("OPENED %s -> %s (no window)"):format(na,bI.prize and ae(W(tostring(bI.prize)))or"?"))
ah(function()local nd=V()return nd~=nil and nd~=ur end,1.5)if(h0 .Position-fc.Position).Magnitude>8 then pcall(function()aF(hX,fc.Position,fc.Position+fc.LookVector)end)end
return true,"opened"end h1=(aO.done and aO.ok and type(bI)=="table")and tostring(bI.reason or"refused, no reason given")
or(aO.done and("error: "..tostring(bI))or"no answer in 6s")ac(0.3)if not nc()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 x(("crate: the server would not open %s next to the stand (%s)"):format(na,h1))
return false,h1 end function d.smart()local h2=d.title if(d.nearFails or 0)<3 then local uu=d.near()if uu then return true end
if d.nearFails>=3 then x("opening next to the stand failed 3 times - trying the older ways")end end local bJ=d.learned
if bJ then local h3=V()if d.on then d.replay()if ah(d.goneOrNew(h3),3.5)then c.crates=c.crates+1 x("OPENED "..h2 .." (direct)")
return true end else if bJ.mode~="window"then d.replay()if ah(d.goneOrNew(h3),3.5)then c.crates,d.fails=c.crates+1,0
if bJ.mode~="direct"then bJ.mode,ab.dirty="direct",true x("crates now open directly - the window never comes up")
end x("OPENED "..h2 .." (direct, no window)")return true end end if hK()then d.replay()if ah(d.goneOrNew(h3),3.5)then
c.crates,d.fails=c.crates+1,0 if bJ.mode~="window"then bJ.mode,ab.dirty="window",true x("crates need their window up first - it shows briefly")
end x("OPENED "..h2 .." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,ab.dirty=bJ,nil,true
if d.fails>=3 then d.directOff=true x("direct crate opening failed 3 times - using the button for now")else x("the learned crate call did not work - back to pressing Open")
end end return e7(true)end function z.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end z.cache={}function z.watchCache()z.cache=z.snap()
for uv,ne in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do P(F:GetAttributeChangedSignal(ne):Connect(function()z.cache[uv]=F:GetAttribute(ne)end))
end end function z.isOn()return F:GetAttribute("AutoRollOn")==true end function z.saw(uw,...)local fd=z.cache
local ux={m=uw,n=select("#",...),args={...},before={rules=fd.rules,stop=fd.stop,on=fd.on,main=fd.main}}task.delay(1.5,function()
if c.alive then pcall(z.learnOne,ux)end end)end function z.learnOne(di)local an,dj=z.snap(),di.before local fe=(an.rules~=dj.rules)or(an.stop~=dj.stop)
local nf=(an.on~=dj.on)or(an.main~=dj.main)if not fe and not nf then return end local ng={}for nh=1,di.n do local aD=di.args[nh]
local bK=type(aD)if bK=="string"and aD~=""and aD==an.rules then aD={__slot="rules"}elseif bK=="string"and aD~=""and fe and aD==an.stop and an.stop~=dj.stop then aD={__slot="stop"}
elseif bK=="table"then local ni={}for uy,cg in pairs(aD)do if type(cg)=="table"or(type(cg)=="userdata")then z.msg="Auto Roll sends something I cannot repeat"return
end ni[uy]=(type(cg)=="string"and cg~=""and cg==an.rules)and{__slot="rules"}or cg end aD=ni elseif bK~="string"and bK~="number"and bK~="boolean"and bK~="nil"then
if aD==F then aD={__slot="player"}else z.msg="Auto Roll sends something I cannot repeat"return end end ng[nh]=aD
end local ci={m=di.m,n=di.n,args=ng}if fe then local h4=false for uz=1,ci.n do local dk=ci.args[uz]if type(dk)=="table"and dk.__slot=="rules"then h4=true end
if type(dk)=="table"and not dk.__slot then for zF,nj in pairs(dk)do if type(nj)=="table"and nj.__slot=="rules"then h4=true end end
end end if h4 then z.rec.rules={ci}else table.insert(z.rec.rules,ci)if#z.rec.rules>60 then table.remove(z.rec.rules,1)end
end end if nf then if an.on==true then z.rec.on=ci else z.rec.off=ci end e.AutoRoll=(an.on==true)end if an.rules and an.rules~=""then e.ARrules,e.ARstop=an.rules,an.stop or""end
ab.dirty=true z.msg=""x(("learned an Auto Roll %s message"):format(fe and"choices"or(an.on and"on"or"off")))end
function z.resolve(cj)if type(cj)~="table"then return cj end if cj.__slot=="rules"then return e.ARrules~=""and e.ARrules or F:GetAttribute("AutoRollRules")end
if cj.__slot=="stop"then return e.ARstop~=""and e.ARstop or F:GetAttribute("AutoRollStop")end if cj.__slot=="player"then return F end
local nk={}for uA,uB in pairs(cj)do nk[uA]=z.resolve(uB)end return nk end function z.replay(nl,uC)local nm=table.unpack or unpack
for zG,dl in ipairs(uC)do local h5={}for nn=1,dl.n do h5[nn]=z.resolve(dl.args[nn])end z.replaying=true pcall(function()
if dl.m=="InvokeServer"then task.spawn(function()pcall(function()nl:InvokeServer(nm(h5,1,dl.n))end)end)else nl:FireServer(nm(h5,1,dl.n))end
end)z.replaying=false task.wait(0.25)end end function z.apply(no,uD)if z.busy or not c.alive then return end z.busy=true
pcall(function()local np=aq:FindFirstChild("Remotes")local h6=np and np:FindFirstChild("AutoRollAction")if not h6 then z.msg="this game has no AutoRollAction"return end
local bl=e.AutoRoll if bl and e.ARrules~=""and F:GetAttribute("AutoRollRules")~=e.ARrules then if#z.rec.rules==0 then
z.msg="pick your Auto Roll choices once in the game's menu so I can learn them"x(z.msg)else z.replay(h6,z.rec.rules)
if ah(function()return F:GetAttribute("AutoRollRules")==e.ARrules end,4)then x("Auto Roll choices put back")else
z.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"x(z.msg)end end end if bl==z.isOn()or(not bl and not uD)then return end
local ff=bl and z.rec.on or z.rec.off if not ff then local dm=bl and z.rec.off or z.rec.on local nq=dm~=nil for uE=1,dm and dm.n or 0 do
if type(dm.args[uE])=="boolean"then nq=false end end if nq then ff=dm end end if not ff then z.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bl and"on"or"off")
x(z.msg)return end z.replay(h6,{ff})if ah(function()return z.isOn()==bl end,4)then z.msg=""x(("Auto Roll switched %s%s"):format(bl and"ON"or"OFF",no and(" ("..no..")")or""))
else z.msg="Auto Roll did not switch - do it once in the game so I can relearn it"x(z.msg)end end)z.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local uF,uG=pcall(function()return F.UserId end)return uF and uG or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local uH,h7=pcall(function()return require(aq:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if uH and type(h7)=="table"and type(h7 .Pets)=="table"then j.I=h7 end return j.I end function j.order()if j.list then return j.list end
local bm=j.info()if not bm then return{}end local bL={}if type(bm.Order)=="table"and#bm.Order>0 then for zH,nr in ipairs(bm.Order)do if bm.Pets[nr]then bL[#bL+1]=nr end end
else for uI in pairs(bm.Pets)do bL[#bL+1]=uI end table.sort(bL,function(uJ,uK)return(bm.Pets[uJ].price or 0)<(bm.Pets[uK].price or 0)end)
end j.list=bL return bL end function j.nice(ns,h8)local nt=j.info()local nu=nt and nt.Pets[ns]return((h8 and h8~="")and(h8 .." ")or"")..(nu and nu.displayName or tostring(ns))
end function j.data()local fg=F:GetAttribute("PetsData")if type(fg)~="string"then return nil end if fg==j.rawD then return j.lastD end
local uL,dn=pcall(function()return j.HS:JSONDecode(fg)end)dn=(uL and type(dn)=="table")and dn or nil j.rawD,j.lastD=fg,dn
return dn end function j.pen()return aq:FindFirstChild("PetMeadowSpawns")end function j.srv()return ar:GetServerTimeNow()end
function j.money()local h9=F:FindFirstChild("MoneyValue")if h9 and type(h9 .Value)=="number"then return h9 .Value end
return aU()or 0 end function j.wishes()local nv=j.pen()local nw=nv and nv:GetAttribute("Wishes")local h_,nx={},j.srv()
if type(nw)~="string"then return h_ end local uM,ny=pcall(function()return j.HS:JSONDecode(nw)end)if uM and type(ny)=="table"then
for uN,ia in pairs(ny)do if type(ia)=="number"and ia>nx then h_[uN]=ia-nx end end end return h_ end function j.call(...)
local nz=aq:FindFirstChild("Remotes")local nA=nz and nz:FindFirstChild("PetRequest")if not nA then return nil end
local nB=table.pack(...)local bM={}task.spawn(function()bM.ok,bM.v=pcall(function()return nA:InvokeServer(table.unpack(nB,1,nB.n))end)
bM.done=true end)local uO=r()while not bM.done and r()-uO<6 do task.wait(0.05)end if bM.done and bM.ok then return bM.v end
return nil end function j.want(uP)return e.Pets[uP]end function j.closeNaming(ib)local nD=pcall(function()local nC=F:FindFirstChild("PlayerScripts")
local uQ=nC and nC:FindFirstChild("Naming",true)require(uQ).close()end)ac(0.5)if ib.Visible then pcall(function()local nE=ib:FindFirstChild("NameBox",true)if nE then nE:ReleaseFocus()end end)
ib.Visible=false nD=false end return nD end function j.skipNaming()j.namingUntil=r()+10 if j.namingOn then return end
j.namingOn=true task.spawn(function()while c.alive and r()<j.namingUntil do local nF=F:FindFirstChildOfClass("PlayerGui")
local nG=nF and nF:FindFirstChild("MainGui")local fh=nG and nG:FindFirstChild("PetNameGui")if fh and fh.Visible then
ac(0.4)if fh.Visible then j.namingShut=(j.namingShut or 0)+1 pcall(j.closeNaming,fh)break end end ac(0.25)end
j.namingOn=false end)end function j.buyTick()if not e.PetBuy then j.buyMsg="auto adopt is off"return end local ic,nH,fi=j.info(),j.pen(),j.data()
if not(ic and nH and fi)then j.buyMsg="pet data not loaded yet"return end j.tryAt=j.tryAt or{}local dp,ie=#(fi.pets or{}),tonumber(fi.maxOwned)or 60
local uR,nI,dq=j.srv(),{},nil for zI,aH in ipairs(nH:GetChildren())do nI[aH.Name]=true local bN,fj=aH:GetAttribute("Pet"),aH:GetAttribute("Variant")or""
local ig=bN and j.want(bN)if ig and ig.b and ic.Pets[bN]and(not ig.g or fj=="Big")and y.wantMore(bN,fj,fi)and not aH:GetAttribute("A_"..j.uid)
and(tonumber(aH:GetAttribute("ExpiresAt"))or 0)>uR+1 and r()>=(j.tryAt[aH.Name]or 0)then local dr,nJ=j.nice(bN,fj),ic.Pets[bN].price or 0
if dp>=ie then dq=("%s is in the pen, but you have %d/%d pets"):format(dr,dp,ie)j.tryAt[aH.Name]=r()+15 elseif j.money()<nJ then
dq=("%s is in the pen - need $%s"):format(dr,aB(nJ))j.tryAt[aH.Name]=r()+5 else j.tryAt[aH.Name]=r()+8 local bn=j.call("adopt",aH.Name)
if type(bn)=="table"and bn.ok then dp=dp+1 j.buys=(j.buys or 0)+1 j.recent=j.recent or{}local uS=type(bn.pet)=="table"and bn.pet or{}
table.insert(j.recent,{id=tostring(uS.id or("?"..r())),name=bN,variant=fj,at=r()})if#j.recent>30 then table.remove(j.recent,1)end
x("ADOPTED "..dr)j.skipNaming()dq="adopted "..dr else local nK=type(bn)=="table"and tostring(bn.reason or"no reason given")or"no answer"
x(("adopt %s failed: %s"):format(dr,nK))dq="adopt failed: "..nK if type(bn)=="table"and bn.bagFull then j.tryAt[aH.Name]=r()+60 end
end end end end for nL in pairs(j.tryAt)do if not nI[nL]then j.tryAt[nL]=nil end end j.buyMsg=dq or("watching the pen (%d/%d pets)"):format(dp,ie)
end function j.wishTick()if not e.PetWish then j.wishMsg="auto wish is off"return end local fk=j.info()if not(fk and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local fl,ih,bo=j.wishes(),0,nil local uT=(type(fk.Wish)=="table"and fk.Wish.cashShare)or 2
local uU=j.data()for zJ,av in ipairs(j.order())do local nM=j.want(av)if nM and nM.w and y.wantMore(av,"",uU)then
ih=ih+1 if not fl[av]and r()>=(j.wishTry[av]or 0)then local ii=tonumber(F:GetAttribute("PetWishCredits"))or 0
local ij=math.floor((fk.Pets[av].price or 0)*uT)if ii<=0 and j.money()<ij then j.wishTry[av]=r()+10 bo=("need $%s to wish for %s"):format(aB(ij),j.nice(av))
j.wishWhy[av]=bo else j.wishTry[av]=r()+3 local uV=ii>0 and"wishCredit"or"wish"local fm=j.call(uV,av)if type(fm)=="table"and fm.ok then
j.wishN,j.wishWhy[av]=j.wishN+1,nil x(("WISHED for %s (%s)"):format(j.nice(av),ii>0 and"free wish"or("$"..aB(ij))))
else local ik=type(fm)=="table"and tostring(fm.reason or"no reason given")or"no answer"if ik:lower():find("already",1,true)then j.wishTry[av]=r()+2
else x(("wish %s failed: %s"):format(j.nice(av),ik))bo="wish failed: "..ik end end end end end end if not bo then
for zK,fn in ipairs(j.order())do local nN=j.want(fn)if nN and nN.w and not fl[fn]and j.wishWhy[fn]then bo=j.wishWhy[fn]break end
end end if not bo then local fo={}for zL,fp in ipairs(j.order())do local nO=j.want(fp)if nO and nO.w and fl[fp]then fo[#fo+1]=("%s %dm"):format(j.nice(fp),math.ceil(fl[fp]/60))end
end bo=ih==0 and"no pet has WISH ticked"or("running: "..(#fo>0 and table.concat(fo,", ")or"none yet"))end j.wishMsg=bo
end q.switches,q.glazed,q.finished=0,0,0 q.done,q.doneN,q.later={},0,{}function q.teams()local il=j.data()return(il and il.teams)or{},il
end function q.current(ck)ck=ck or j.data()if not ck then return""end local nP={}for zM,uW in ipairs(ck.equipped or{})do nP[tostring(uW)]=true end
for zN,nQ in ipairs(ck.teams or{})do local nR=nQ.pets or{}local im=#nR==#(ck.equipped or{})if im then for zO,uX in ipairs(nR)do if not nP[tostring(uX)]then im=false break end end end
if im then return nQ.name end end return""end function q.equip(io)local uY,uZ=q.teams()local ip for u0,u1 in ipairs(uY)do if u1 .name==io then ip=u0 break end end
if not ip then q.msg="no saved team called "..tostring(io)return false end if q.current(uZ)==io then return true end
for zP=1,4 do local nS=j.call("teamEquip",ip)if type(nS)=="table"and nS.ok then q.switches=q.switches+1 return true
end task.wait(0.4)end return false end function q.left(u2)local nT=u2:FindFirstChild("SquishyPlaceHolder")local nU=nT and nT:FindFirstChild("TimerGui")
local nV=nU and nU:FindFirstChildWhichIsA("TextLabel",true)local iq=nV and nV.Text if type(iq)~="string"or iq:find("-",1,true)then return nil end
local ir,nW,nX=iq:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not ir then return nil end local nY=nX~=""and(tonumber(ir)*3600+tonumber(nW)*60+tonumber(nX))or(tonumber(ir)*60+tonumber(nW))
return nY>0 and nY or nil end function q.waxes()local ds={}local nZ=c.plot and c.plot:FindFirstChild("WaxStations")
if not nZ then return ds end local n0=j.srv()for zQ,aP in ipairs(nZ:GetChildren())do local is=tonumber(aP:GetAttribute("PourEnd"))
local n1=aP:GetAttribute("PourOwner")if aP:GetAttribute("HasSquishy")and aP:GetAttribute("PourId")and(n1==nil or n1==j.uid)then
local it=q.left(aP)local n2=it and(n0+it)or((is and is>n0)and is or nil)if n2 then local n3,n4=aP:FindFirstChild("SquishyPlaceHolder"),"?"
if n3 then for zR,n5 in ipairs(n3:GetChildren())do if n5:IsA("Model")then n4=n5 .Name break end end end local u3=tostring(aP:GetAttribute("Helpers")or"")
local iu=0 for zS in u3:gmatch("%d+")do iu=iu+1 end ds[#ds+1]={st=aP,ends=n2,sure=it~=nil,id=aP:GetAttribute("PourId"),name=n4,helps=iu,
long=aP:GetAttribute("PourLong")==true}end end end table.sort(ds,function(u4,u5)return u4 .ends<u5 .ends end)
return ds end function q.glazeCount()local n6=aq:FindFirstChild("Remotes")local n7=n6 and n6:FindFirstChild("EditStack")
if not n7 then return nil end local u6,dt=pcall(function()return n7:InvokeServer("State",nil)end)if not(u6 and type(dt)=="table"and type(dt.state)=="table")then return nil end
local iv,iw=0,{}for zT,fq in ipairs(dt.state.entries or{})do if fq.glaze and fq.glaze~=""then iv=iv+1 iw[fq.glaze]=(iw[fq.glaze]or 0)+1 end
end return iv,iw,#(dt.state.entries or{}),dt.state.capacity end function q.finishedOne(fr,n8)q.finished=q.finished+1
task.wait(2)local ix,u7,n9,u8=q.glazeCount()if ix and n8 and ix>n8 then q.glazed=q.glazed+1 local iy={}for u9,u_ in pairs(u7)do iy[#iy+1]=u9 .." "..u_ end
x(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ae(W(fr.name)),fr.st.Name,ix,table.concat(iy,", ")))
else x(("wax done on station %s: %s, no glaze%s"):format(fr.st.Name,ae(W(fr.name)),n9 and(" (stack "..n9 .."/"..tostring(u8)..")")or""))
end end function q.tick()q.list=q.waxes()if q.editing and r()-(q.editingSince or r())>120 then q.editing=false end
if q.editing then q.msg="rebuilding teams..."return end if not e.Teams then q.want,q.msg="","auto teams is off"return end
local cl=j.srv()local ay=q.glazeFor if ay then local du=ay.st local n_=du.Parent and du:GetAttribute("HasSquishy")and du:GetAttribute("PourId")==ay.id
local oa=n_ and q.left(du)if oa then ay.ends=cl+oa end if not n_ then q.glazeFor,q.afterUntil=nil,r()+1.5 if not q.done[ay.id or"?"]then
q.done[ay.id or"?"],q.doneN=true,q.doneN+1 if q.doneN>400 then q.done,q.doneN={[ay.id or"?"]=true},1 end local va=ay.before
task.spawn(function()pcall(q.finishedOne,ay,va)end)end elseif ay.ends-cl>e.GlazeLead*3+60 or cl>ay.ends+90 then
q.glazeFor,q.afterUntil=nil,r()+1.5 q.later[ay.id or"?"]=r()+120 x(("station %s is not finishing yet (%s left) - glaze team off again"):format(du.Name,q.clock(ay.ends-cl)))
end end if e.TeamGlaze~=""and not q.glazeFor then local vb=q.speedRatio(e.TeamGlaze)for zU,bO in ipairs(q.list)do
if bO.sure and(bO.ends-cl)*vb[bO.long and 2 or 1]<=e.GlazeLead and r()>=(q.later[bO.id or"?"]or 0)and not q.done[bO.id or"?"]then
q.glazeFor=bO task.spawn(function()bO.before=q.glazeCount()end)break end end end local aE,fs="",""if e.TeamGlaze~=""and(q.glazeFor or r()<(q.afterUntil or 0))then
aE,fs=e.TeamGlaze,q.glazeFor and(" - station "..q.glazeFor.st.Name.." finishes soon")or""elseif e.TeamWax~=""and(q.placing or q.aboutToPlace())then
aE,fs=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and q.allBusy()then aE,fs=e.TeamFull," - every station is busy"
else aE=e.TeamNormal end q.want=aE local dv=q.current()q.cur=dv if aE~=""and dv~=aE and r()>=(q.nextTry or 0)then
q.nextTry=r()+1.1 if q.equip(aE)then x("team: "..aE..fs)else q.nextTry=r()+3 end end local iz=q.list[1]q.msg=("on: %s%s | next wax done %s"):format(dv~=""and dv or"(not a saved team)",(aE~=""and aE~=dv)and(" -> "..aE)or"",
iz and("in "..q.clock(iz.ends-cl).." (st "..iz.st.Name..")")or"- none running")end function q.clock(bp)bp=math.max(0,math.floor(bp))
if bp>=3600 then return("%d:%02d:%02d"):format(math.floor(bp/3600),math.floor((bp%3600)/60),bp%60)end return("%d:%02d"):format(math.floor(bp/60),bp%60)
end function q.allBusy()local vc,vd=ek()return vd>0 and vc==0 end function q.aboutToPlace()if not c.running then return false end
local ob=V()if not(ob and aT(ob))then return false end local ve=ek()return ve>0 end function q.mult(oc,vf,od)return{(1+oc)*(1+od),(1+oc+vf)*(1+od)}end
function q.speedNow()local function iA(vg)return tonumber(F:GetAttribute(vg))or 0 end return q.mult(iA("PetWaxSpeed"),iA("PetLongWax"),iA("PetSocialWax"))
end function q.speedOf(vh)local vi,oe=q.teams()if not oe then return nil end for zV,of in ipairs(vi)do if of.name==vh then
local iB={}for zW,vj in ipairs(of.pets or{})do for zX,og in ipairs(oe.pets or{})do if tostring(og.id)==tostring(vj)then iB[#iB+1]=og break end end
end local oh=y.caps()local oi,vk=y.stats(iB)return q.mult(math.min(oi.waxSpeed or 0,oh.waxSpeed or 0.25),math.min(oi.longWax or 0,oh.longWax or 0.3),vk.socialWax or 0)
end end return nil end function q.speedRatio(vl)local oj,iC=q.speedNow(),q.speedOf(vl)if not iC then return{1,1}end
return{oj[1]/iC[1],oj[2]/iC[2]}end function q.glazeSoon()return e.Teams and e.TeamGlaze~=""and(q.glazeFor~=nil or r()<(q.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function y.caps()local iD=j.info()return(iD and type(iD.Caps)=="table")and iD.Caps or y.CAPS
end function y.value(ol,iE)local ft=j.info()local cm=ft and ft.Pets[ol]if not(cm and type(cm.boost)=="table")then return nil end
local bP if type(ft.boostValue)=="function"then local vm,vn=pcall(ft.boostValue,ol,(iE~=""and iE)or nil)bP=vm and tonumber(vn)or nil
end if not bP then bP=cm.boost.value or 0 if iE=="Big"then local om=bP*1.5 bP=y.ROUND[cm.boost.kind]and math.max(bP+1,math.floor(om+0.5))or om
end end return cm.boost.kind,bP,cm.boost.every end function y.stats(vo)local bQ,iF={},{}for zY,oo in ipairs(vo)do
local aI,fu,op=y.value(oo.name,oo.variant or"")if aI then if aI:sub(1,6)=="social"then iF[aI]=math.max(iF[aI]or 0,fu)
elseif aI=="waxStir"or aI=="cashGift"then bQ[aI]=(bQ[aI]or 0)+fu*60/(op or 60)elseif aI=="luckyPull"then bQ.luckyPull=(bQ.luckyPull or 0)+fu/(op or 10)
else bQ[aI]=(bQ[aI]or 0)+fu end end end return bQ,iF end function y.glazeGain(vp,fv)local dw,iG,zZ={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local vq=dw[1]+dw[2]+dw[3]local vr=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local cn={}for fw=1,3 do cn[fw]=dw[fw]+vp*dw[fw]/vq+(fw==1 and vr or 0)end
local iH={cn[1]*(1-fv),cn[2]*(1-fv)+cn[1]*fv,cn[3]+cn[2]*fv}return iH[1]*(iG[1]-1)+iH[2]*(iG[2]-1)+iH[3]*(iG[3]-1)
end function y.score(fy,vs)local iI=y.caps()local fz,fA=y.stats(vs)local function bq(oq)return math.min(fz[oq]or 0,iI[oq]or math.huge)end
local vt=(1+bq("income"))*(1+(fA.socialIncome or 0))*(1+math.min(fz.cashGift or 0,iI.cashGiftPerMinute or 9)/60)
local vu=1+bq("luck")+(fz.luckyPull or 0)+(fA.socialLuck or 0)local ot=vu*(1+bq("newFind"))local dx=math.log(vt)
local vv=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local iJ=(1+bq("waxSpeed")+bq("longWax"))*(1+(fA.socialWax or 0))
+math.min(fz.waxStir or 0,iI.waxStirPerMinute or 30)/60/vv local vw=1-(1-bq("headStart"))*(1-(fA.socialHeadStart or 0))
if fy=="farm"then return dx+0.7*math.log(ot)+0.1*math.log(iJ)end if fy=="full"then return dx+0.4*math.log(iJ)+0.02*math.log(ot)end
if fy=="glaze"then return y.glazeGain(bq("glaze"),bq("glazeUp"))+0.001*dx end if fy=="wax"then return-math.log(1-0.5*vw)+0.001*dx+0.001*math.log(iJ)end
return dx end function y.best(ou,co,vx,iK)iK=iK or{}local ao,dy={},{}local function ov(vy)local ow={}for vz,vA in ipairs(vy)do ow[vz]=co[vA]end return ow end
local function iL(ox)local iM=y.score(ou,ov(ox))for z0,vB in ipairs(ox)do if iK[co[vB].id]then iM=iM+1e-7 end end
return iM end for z1=1,math.min(vx,#co)do local fB,iN for iO=1,#co do if not dy[iO]then ao[#ao+1]=iO local oy=iL(ao)
ao[#ao]=nil if not iN or oy>iN+1e-12 then fB,iN=iO,oy end end end if not fB then break end dy[fB]=true ao[#ao+1]=fB
end for z2=1,6 do task.wait()local oz,oA=false,iL(ao)for iP=1,#ao do for iQ=1,#co do if not dy[iQ]then local oB=ao[iP]
ao[iP]=iQ local oC=iL(ao)if oC>oA+1e-9 then dy[oB],dy[iQ],oA,oz=nil,true,oC,true else ao[iP]=oB end end end end
if not oz then break end end local oD={}for vC,vD in ipairs(ao)do oD[vC]=tostring(co[vD].id)end return oD,y.score(ou,ov(ao))
end function y.count(oE,oF,vE)local dz,dA={},0 local oG,oH={},{}for z3,vF in ipairs(oF.arriving or{})do oG[tostring(vF)]=true end
for z4,cp in ipairs(oF.pets or{})do oH[tostring(cp.id)]=true if cp.name==oE and not oG[tostring(cp.id)]then if cp.variant=="Big"then dA=dA+1 elseif(cp.variant or"")==""then dz[#dz+1]=cp end
end end if not vE then for z5,dB in ipairs(j.recent or{})do if dB.name==oE and not oH[dB.id]and r()-dB.at<20 then
if dB.variant=="Big"then dA=dA+1 else dz[#dz+1]=dB end end end end return dz,dA end function y.goal(vG)local oI=e.Pets[vG]return oI and tonumber(oI.f)or 0 end
function y.wantMore(oJ,vH,oK)local iR=y.goal(oJ)if iR<=0 or not oK then return true end local vI,oL=y.count(oJ,oK)
if oL>=iR then return false end if vH=="Big"then return true end return#vI<y.need()*(iR-oL)end function y.status(oM,oN)
local fC=y.goal(oM)if fC<=0 or not oN then return nil end local vJ,iS=y.count(oM,oN)if iS>=fC then return("Big %d/%d done"):format(iS,fC)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#vJ,y.need()),y.need(),iS,fC)end function y.wear(iT)local iU={}
for z6,vK in ipairs(iT)do iU[tostring(vK)]=true end for z7=1,3 do local cq=j.data()if not cq then return false end
for z8,oO in ipairs(cq.equipped or{})do if not iU[tostring(oO)]then j.call("unequip",oO)task.wait(0.3)end end
cq=j.data()local oP={}for z9,vL in ipairs(cq.equipped or{})do oP[tostring(vL)]=true end for z_,oQ in ipairs(iT)do
if not oP[tostring(oQ)]then j.call("equip",oQ)task.wait(0.3)end end task.wait(0.4)cq=j.data()local iV,oR=0,true
for Aa,vM in ipairs(cq.equipped or{})do iV=iV+1 if not iU[tostring(vM)]then oR=false end end if oR and iV==#iT then return true end
end return false end function y.saveTeam(oS,oT)if not y.wear(oT)then return false,"could not put the pets on"end
local vN=q.teams()local bR for vO,vP in ipairs(vN)do if vP.name==oS then bR=vO break end end local cr if bR then
cr=j.call("teamSave",bR)else cr=j.call("teamNew")if type(cr)=="table"and cr.ok and cr.index then bR=cr.index task.wait(0.3)
j.call("teamRename",{index=bR,name=oS})end end task.wait(0.4)local iW=j.data()local oU=iW and iW.teams and bR and iW.teams[bR]
if not oU then return false,"the game did not save it"end local oV={}for Ab,vQ in ipairs(oU.pets or{})do oV[tostring(vQ)]=true end
for Ac,vR in ipairs(oT)do if not oV[tostring(vR)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if q.placing or q.glazeSoon()then return false end local vS=j.srv()for Ad,vT in ipairs(q.list or{})do if vT.ends-vS<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local dC=j.data()if not dC then return{}end local oW={}for Ae,vU in ipairs(dC.arriving or{})do oW[tostring(vU)]=true end
local dD={}for Af,fD in ipairs(dC.pets or{})do if not oW[tostring(fD.id)]then dD[#dD+1]={id=tostring(fD.id),name=fD.name,variant=fD.variant or""}end
end local oX={}for Ag,oY in ipairs(dD)do oX[oY.id]=oY end local oZ=tonumber(dC.slots)or 3 local iX,o0={},{}for Ah,fE in ipairs(y.ROLES)do
local dE=e[fE[1]]if dE~=""and not o0[dE]then o0[dE]=true local iY,dF,o1={},{},false for Ai,o2 in ipairs(dC.teams or{})do
if o2 .name==dE then for Aj,vV in ipairs(o2 .pets or{})do local iZ=oX[tostring(vV)]if iZ then iY[iZ.id]=true dF[#dF+1]=iZ else o1=true end
end end end local i0,o3=y.best(fE[2],dD,oZ,iY)local o4=y.score(fE[2],dF)local o5=#i0==#dF for Ak,vW in ipairs(i0)do if not iY[vW]then o5=false end end
if not o5 and(o1 or#dF<math.min(oZ,#dD)or o3>o4+1e-4)then iX[#iX+1]={team=dE,role=fE[2],ids=i0,gain=o3-o4}end
end end return iX end function y.rebuild(vX)local o6=y.plan()if#o6==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end q.editing,q.editingSince=true,r()
local fF=true local v1,v2=pcall(function()for Al,dG in ipairs(o6)do local vY,vZ=y.saveTeam(dG.team,dG.ids)local o7=j.data()
local i1={}for Am,v0 in ipairs(dG.ids)do for An,i2 in ipairs(o7 and o7 .pets or{})do if tostring(i2 .id)==v0 then i1[#i1+1]=j.nice(i2 .name,i2 .variant)end
end end if vY then x(("TEAM %s rebuilt (%s): %s"):format(dG.team,vX or"pets changed",table.concat(i1,", ")))else fF=false x(("TEAM %s: %s"):format(dG.team,tostring(vZ)))end
end end)q.editing,q.nextTry=false,0 if not v1 then fF=false x("TEAM BUILD ERR "..tostring(v2))end y.builds=y.builds+1
y.buildMsg=fF and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fF end
function y.fuseTick()if not e.AutoFuse or q.editing then return end local fG=j.data()if not fG then return end
local i3=y.need()local i4,fH={},{}for Ao,v3 in ipairs(fG.teams or{})do for Ap,v4 in ipairs(v3 .pets or{})do i4[tostring(v4)]=true end end
for Aq,v5 in ipairs(fG.equipped or{})do fH[tostring(v5)]=true end y.failUntil=y.failUntil or{}for bS,v6 in pairs(e.Pets)do
local o8=tonumber(v6 .f)or 0 local i5,v7=y.count(bS,fG,true)if o8>0 and v7<o8 and#i5>=i3 and r()>=(y.failUntil[bS]or 0)then
table.sort(i5,function(fI,fJ)local o9=(fH[tostring(fI.id)]and 4 or 0)+(i4[tostring(fI.id)]and 2 or 0)+(fI.named and 1 or 0)
local o_=(fH[tostring(fJ.id)]and 4 or 0)+(i4[tostring(fJ.id)]and 2 or 0)+(fJ.named and 1 or 0)if o9~=o_ then return o9<o_ end
return tostring(fI.id)<tostring(fJ.id)end)local fK,i6={},{}for fL=1,i3 do fK[fL]=tostring(i5[fL].id)if fH[fK[fL]]then i6[#i6+1]=fK[fL]end
end q.editing,q.editingSince=true,r()for Ar,v8 in ipairs(i6)do j.call("unequip",v8)task.wait(0.3)end local fM=j.call("fuse",{ids=fK})
q.editing,q.nextTry=false,0 if type(fM)=="table"and fM.ok then y.fused=y.fused+1 y.dirtyAt=r()x(("FUSED %d %s -> Big %s"):format(i3,j.nice(bS),j.nice(bS)))
y.fuseMsg=("fused a Big %s %s"):format(j.nice(bS),os.date("%H:%M"))else y.failUntil[bS]=r()+120 x(("fuse %s failed: %s"):format(j.nice(bS),type(fM)=="table"and tostring(fM.reason or"no reason given")or"no answer"))
end return end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end local pa=j.data()
if not pa then return end local bT={}for As,v9 in ipairs(pa.pets or{})do bT[#bT+1]=tostring(v9 .id)end table.sort(bT)
bT=table.concat(bT,",")if bT~=y.sig then y.sig,y.dirtyAt=bT,r()end local v_=(y.dirtyAt and r()-y.dirtyAt>8)or r()-(y.lastBuild or 0)>900
if v_ and not q.editing then local wa=y.rebuild(y.dirtyAt and"pets changed"or"check")if wa then y.dirtyAt,y.lastBuild=nil,r()end
end end o.bb,o.fx,o.post,o.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}o.watch=setmetatable({},{__mode="k"})
o.mem,o.memPeak,o.fps=0,0,0 function o.isFx(bU)return bU:IsA("ParticleEmitter")or bU:IsA("Trail")or bU:IsA("Beam")or bU:IsA("Fire")or bU:IsA("Smoke")
or bU:IsA("Sparkles")or bU:IsA("Light")end function o.muteOne(az)if not e.Lite or not az.Parent then return end
local fN=(az:IsA("BillboardGui")and o.bb)or(o.isFx(az)and o.fx)or nil if not fN or fN[az]~=nil then return end
fN[az]=az.Enabled if az.Enabled then az.Enabled=false end o.watch[az]=az:GetPropertyChangedSignal("Enabled"):Connect(function()
if e.Lite and az.Enabled then fN[az]=true az.Enabled=false end end)end function o.lite(pb)e.Lite=pb if pb then
task.spawn(function()for wb,wc in ipairs(ar:GetDescendants())do if not e.Lite then return end pcall(o.muteOne,wc)
if wb%600==0 then task.wait()end end end)if not o.addConn then o.queue={}o.addConn=P(ar.DescendantAdded:Connect(function(i7)
if e.Lite and(i7:IsA("BillboardGui")or o.isFx(i7))then o.queue[#o.queue+1]=i7 end end))end local i8=game:GetService("Lighting")
for At,dH in ipairs(i8:GetChildren())do if dH:IsA("PostEffect")and dH.Enabled and o.post[dH]==nil then o.post[dH]=true dH.Enabled=false end
end pcall(function()o.oldShadows=o.oldShadows==nil and i8 .GlobalShadows or o.oldShadows i8 .GlobalShadows=false end)
pcall(function()o.oldDeco=o.oldDeco==nil and ar.Terrain.Decoration or o.oldDeco ar.Terrain.Decoration=false end)
else for Au,wd in pairs(o.watch)do pcall(function()wd:Disconnect()end)end for pc,we in pairs(o.bb)do pcall(function()if pc.Parent then pc.Enabled=we end end)end
for pd,wf in pairs(o.fx)do pcall(function()if pd.Parent then pd.Enabled=wf end end)end for pe in pairs(o.post)do pcall(function()if pe.Parent then pe.Enabled=true end end)end
o.bb,o.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})o.watch,o.post,o.queue=setmetatable({},{__mode="k"}),{},{}
local wg=game:GetService("Lighting")if o.oldShadows~=nil then pcall(function()wg.GlobalShadows=o.oldShadows end)o.oldShadows=nil end
if o.oldDeco~=nil then pcall(function()ar.Terrain.Decoration=o.oldDeco end)o.oldDeco=nil end end end o.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function o.hideHud(pf)e.HideHud=pf local i9=F:FindFirstChildOfClass("PlayerGui")if not i9 then return end if pf then
for Av,dI in ipairs(i9:GetChildren())do if dI:IsA("ScreenGui")and not o.MINE[dI.Name]and dI.Enabled then o.hud[dI]=true dI.Enabled=false end
end if not o.hudConn then o.hudConn=P(i9 .ChildAdded:Connect(function(dJ)if e.HideHud and dJ:IsA("ScreenGui")and not o.MINE[dJ.Name]then
task.defer(function()if e.HideHud and dJ.Enabled then o.hud[dJ]=true dJ.Enabled=false end end)end end))end else
for pg in pairs(o.hud)do pcall(function()if pg.Parent then pg.Enabled=true end end)end o.hud={}end end o.CAPS={0,30,15,10}
function o.cap(i_)e.FpsCap=i_ local ph=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not ph then return false end return pcall(ph,i_==0 and 60 or i_)end function o.render(pj)e.NoRender=pj pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not pj)end)
end function o.restoreAll()pcall(o.unpin)pcall(o.lite,false)pcall(o.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(o.cap,0)end end function o.rejoinSame(pk)if c.rejoining then return end x("REJOIN this server ("..pk..")")
pcall(en)if c.autoload then pcall(eM,c.autoload)end hi()local wh=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then cX(pk..", same server failed")end end)return wh end function o.tick()
local ja=o.queue if e.Lite and ja and#ja>0 then o.queue={}for wi,wj in ipairs(ja)do pcall(o.muteOne,wj)if wi%300==0 then task.wait()end end
end local pl=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if pl then for Aw,wk in ipairs(pl:GetChildren())do
local pm=wk:FindFirstChild("SquishyPlaceHolder")local bV=pm and pm:FindFirstChild("TimerGui")if bV and bV:IsA("BillboardGui")then
if o.bb[bV]==nil then pcall(o.muteOne,bV)elseif bV.Enabled then o.bb[bV]=true bV.Enabled=false end end end end
local wl,dK=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if wl and type(dK)=="number"then
o.mem=dK o.memPeak=math.max(o.memPeak,dK)if(e.MemLimit or 0)>0 and dK>e.MemLimit then o.over=(o.over or 0)+1 if o.over>=30 and not c.busy then
o.over=-600 o.rejoinSame(("memory %d MB > %d MB"):format(dK,e.MemLimit))end elseif(o.over or 0)>0 then o.over=0
end end if r()-(o.noteAt or 0)>1800 then o.noteAt=r()x(("health: %d fps, %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function jb(fO)if type(fO)~="string"then return false end
fO=fO:lower()for Ax,wm in ipairs(c.sellWords)do if fO:find(wm,1,true)then return true end end return false end
local function wn()local pn=aq:FindFirstChild("Remotes")local jc=pn and pn:FindFirstChild("SellSquishy")if not(jc and jc:IsA("RemoteEvent"))then return false end
if not pcall(function()jc:FireServer()end)then return false end return ah(function()return V()==nil end,1.5)end
local function wo()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if r()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=r()local po=as()local pp=po and po.HumanoidRootPart.Position local dL,pq for Ay,cs in ipairs((c.plot or ar):GetDescendants())do
if cs:IsA("ProximityPrompt")and(jb(cs.ActionText)or jb(cs.ObjectText)or jb(cs.Name))then local pr=kO(cs)local jd=(pr and pp)and(pr-pp).Magnitude or 1e9
if jd<=400 and(not dL or jd<pq)then dL,pq=cs,jd end end end c.sellSpot=dL c.noSellSpot=(dL==nil)return dL end
local function ps()local je=V()if not je then c.holding=false return false end if aT(je)then return false end
local jf=ae(W(je))if wn()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=r()+2.5,0
x("SOLD "..jf)return true end local ct=wo()if ct then local pt=cK(ct)if pt then c0(pt,ct)local pu=V()if pu and not aT(pu)then
local wp,wq=c4(ct,function()return V()==nil end,function()return ct.Enabled end)if wp then c.sold,c.holding,c.sellFails=c.sold+1,false,0
x(("SOLD %s at %s via %s"):format(jf,ei(ct),wq))return true end end end end c.sellFails=c.sellFails+1 x("could not sell "..jf.." ("..c.sellFails..")")
return false end local wr={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function ws(cu)local fP=ei(cu):lower()for Az,wt in ipairs(wr)do if fP:find(wt,1,true)then return 0 end end
local aQ,af=cu.Name:lower(),0 local function aJ(wu,wv)return wu:find(wv,1,true)~=nil end if aJ(aQ,"collect")then af=af+60 end
if aJ(aQ,"cash")or aJ(aQ,"money")then af=af+45 end if aJ(aQ,"income")or aJ(aQ,"claim")then af=af+35 end if aJ(aQ,"coin")or aJ(aQ,"earn")or aJ(aQ,"green")then af=af+20 end
if aQ=="pad"or aQ=="touch"then af=af+25 end if af==0 and(aJ(fP,"collect")or aJ(fP,"cash")or aJ(fP,"money"))then af=25 end
if af==0 then return 0 end local dM=cu.Color if dM.G>0.5 and dM.G>dM.R*1.4 and dM.G>dM.B*1.4 then af=af+15 end
if math.min(cu.Size.X,cu.Size.Y,cu.Size.Z)<2 then af=af+5 end return af end local function ww()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or r()-c.padSearchAt<20 then return nil end c.padSearchAt=r()local fQ,dN,jg={},nil,29 for AA,fR in ipairs(c.plot:GetDescendants())do
if fR:IsA("BasePart")then local fS=ws(fR)if fS>0 then fQ[#fQ+1]={s=fS,p=fR}if fS>jg then dN,jg=fR,fS end end end
end table.sort(fQ,function(wx,wy)return wx.s>wy.s end)c.padCands,c.padPart=fQ,dN if dN then x("collect pad: "..ei(dN).." (score "..jg..")")end
return dN end local jh="SAB_pad_v1.txt"local function wz(wA)if type(writefile)=="function"then pcall(writefile,jh,table.concat({wA:GetComponents()},","))end
end local function wB()if type(isfile)~="function"or type(readfile)~="function"then return nil end local wC,pv=pcall(function()if isfile(jh)then return readfile(jh)end end)
if not wC or type(pv)~="string"then return nil end local fT={}for wD in pv:gmatch("[^,]+")do fT[#fT+1]=tonumber(wD)end
if#fT==12 then return CFrame.new(unpack(fT))end end local function wE(ji,fU,wF)local wG=eV(ji)local jj=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aK=(jj and jj:IsA("BasePart"))and(jj.Position-fU)or Vector3 .new(1,0,0)aK=Vector3 .new(aK.X,0,aK.Z)if aK.Magnitude<0.05 then aK=Vector3 .new(1,0,0)end
aK=aK.Unit for wH=0,7 do local fV=wH*math.pi/4 local wI=Vector3 .new(aK.X*math.cos(fV)-aK.Z*math.sin(fV),0,aK.X*math.sin(fV)+aK.Z*math.cos(fV))
local fW=fU+wI*(wF+5)local jk=hq(fW.X,fU.Y,fW.Z)if jk and math.abs(jk.Y-fU.Y)<8 then aF(ji,Vector3 .new(fW.X,jk.Y+wG,fW.Z))
if hs(ji,0.7)then return true end end end return false end local function wJ()c.lastCollect=r()local dO=as()if not dO then return end
local pw,wK=dO.HumanoidRootPart,eV(dO)local dP,px,dQ,jl=nil,4,nil,"?"local jm=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and jm and jm:IsA("BasePart")then dP,jl=(jm.CFrame*c.manualPad).Position,"manual pad"else local a2=ww()
if a2 then dP=Vector3 .new(a2 .Position.X,a2 .Position.Y+a2 .Size.Y/2+wK,a2 .Position.Z)px,dQ,jl=math.max(a2 .Size.X,a2 .Size.Z)/2,a2,a2 .Name
end end if not dP then x("COLLECT: pad not found - stand on it and tap SET PAD")return end local jn=aU()aF(dO,dP)
if dQ and type(firetouchinterest)=="function"then pcall(firetouchinterest,pw,dQ,0)end ac(e.PadDwell)if dQ and type(firetouchinterest)=="function"then pcall(firetouchinterest,pw,dQ,1)end
ac(0.5)c.collected=c.collected+1 local jo=aU()x(("COLLECTED (%s) %s"):format(jl,(jn and jo and jo>jn)and("+$"..aB(jo-jn))or"no cash change seen"))
wE(dO,dP,px)end local dR local function py()if c.capHit then if e.AutoStart and r()-(c.capAt or 0)>300 then c.capHit,c.placeFails=false,0
x("trying again after being stopped for 5 minutes")dR(true,true)else return nil,c.capMsg,"bad"end end if c.busy then return nil,c.busyText,"ok"end
if not as()then return nil,"waiting for character","wait"end if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=ba(),nil,nil
if not c.plot then return nil,"own plot not found yet","wait"end end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local jp,pz=ek()local fX=V()if fX then local cv=ae(W(fX))if not aT(fX)then local jq=(O.gift and W(O.gift)==W(fX)and r()-O.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cv,jq),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cv,jq),"bad"end return"sell",("selling %s (%s)"):format(cv,jq),"warn"
end if jp<1 then return nil,("holding %s - 0 free stations"):format(cv),"wait"end if q.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cv),"wait"end
return"place",("waxing %s (%d free)"):format(cv,jp),"ok"end c.holding=false if e.Crates and not d.waiting and r()-(d.scanAt or 0)>1 and r()>(d.quietUntil or 0)then
d.scanAt=r()local jr=c.plot:FindFirstChild("CrateStand")if jr then for AB,dS in ipairs(jr:GetDescendants())do
if dS:IsA("ProximityPrompt")and dS.Enabled and hI(dS)then local a3=dS.ObjectText if a3==""then a3=b7(jr,"TitleLabel")or""end
if a3~=""and J.wanted(a3)then local wL=eg(a3):gsub("crate$","")local pA for pB in pairs(T.members)do if eg(pB)==wL then pA=pB end end
d.waiting,d.at,d.title,d.prompt=true,r(),a3,dS d.data={name=(a3:gsub("%s","")),rarity=pA,title=a3}x(a3 .." found waiting on your stand")
end break end end end end local pC=J.wanted(d.data and d.data.name)or J.wanted(d.title)if e.Crates and(d.on or d.waiting)and pC then
local a4=d.title if r()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a4),"bad"
end if d.on then if c.crateFails>=3 then d.ignoreUntil,c.crateFails=r()+120,0 x("could not press the "..a4 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a4),"bad"end if r()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a4),"bad"
end if d.byYou and r()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a4,math.ceil(60-(r()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a4),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(a4),"bad"end if r()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a4),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(a4,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not pC then local pD=d.title..tostring(d.rolledAt)if d.told~=pD then d.told=pD x(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and r()-d.rolledAt<6 and J.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if jp<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(pz,pz),"wait"
end local js=k1()if not js then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dT=cY()
if dT and mm(dT.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dT.name),"idle"end
if r()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dT.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(dT.name),"ok"
end local br=hp()if br.state~="match"then c.matchSince=nil if br.state=="skip"and not js.Enabled then return nil,br.text.." (sold out)","idle"end
return nil,br.text,br.level end if not js.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local dU=r()if dU<c.noCashUntil then local pE,wM=lX()if pE then return nil,("cash short: have $%s, price ~$%s"):format(aB(pE),aB(wM)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aB(aU()),math.ceil(c.noCashUntil-dU)),"bad"end if dU-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or dU local pF=dU-c.matchSince if pF<e.Confirm then return nil,("confirming %s (%.2fs)"):format(br.shown,pF),"ok"end
return"buy",("buying %s via %s"):format(br.shown,br.src),"ok"end o.DEPTH=11 function o.pinTick()local pG=o.hold
if not pG then return end local jt=F.Character local ju=jt and jt:FindFirstChild("HumanoidRootPart")if not ju then return end
ju.CFrame=pG ju.AssemblyLinearVelocity=Vector3 .new(0,0,0)for AC,fY in ipairs(jt:GetChildren())do if fY:IsA("BasePart")and fY.CanCollide then o.noclip[fY]=true fY.CanCollide=false end
end end o.noclip=setmetatable({},{__mode="k"})function o.pin(wN,pH)o.hold=wN if pH then o.surface=pH end end function o.unpin(wO)
if not o.hold then return end o.hold=nil for pI in pairs(o.noclip)do pcall(function()if pI.Parent then pI.CanCollide=true end end)end
o.noclip=setmetatable({},{__mode="k"})local pJ=as()if pJ and o.surface and not wO then aF(pJ,o.surface.Position,o.surface.Position+o.surface.LookVector)
ac(0.1)end end function o.parkTick()if not(e.Ghost and c.running)or o.hold or c.busy then return end local pK=as()
if not pK or H.seat()then return end local jv=pK.HumanoidRootPart if jv.Position.Y<(ar.FallenPartsDestroyHeight or-500)+100 then return end
o.pin(jv.CFrame-Vector3 .new(0,o.DEPTH,0),jv.CFrame)end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.seat()local pL=F.Character local pM=pL and pL:FindFirstChildOfClass("Humanoid")local jw=pM and pM.SeatPart
return(jw and jw.Name=="LogSeat")and jw or nil end function H.due()if not(e.Campfire and c.running)or r()<H.nextAt then return false end
local wP=ar:FindFirstChild("NightSeats")if not wP then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire right now (it comes with every weather event)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or r()H.msg=("sitting at the campfire: +%s%% cash"):format(tostring(F:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=r()+600,"kept losing the seat - leaving the campfire for 10 min"
x(H.msg)return false end end return true end function H.sit()local pN,fZ=ar:FindFirstChild("NightSeats"),as()
if not pN or not fZ then return end local pO,cw=fZ.HumanoidRootPart.Position,{}for AD,f0 in ipairs(pN:GetChildren())do
local pP=f0:IsA("Seat")and f0 .Occupant==nil and f0:FindFirstChildOfClass("ProximityPrompt")if pP then cw[#cw+1]={st=f0,p=pP}end
end if#cw==0 then H.nextAt,H.msg=r()+10,"the campfire is full - waiting for a seat"return end table.sort(cw,function(wQ,wR)return(wQ.st.Position-pO).Magnitude<(wR.st.Position-pO).Magnitude end)
local wS,wT=cw[1].st,cw[1].p o.unpin(true)local cx=wS.CFrame aF(fZ,cx.Position+cx.LookVector*2+Vector3 .new(0,2.5,0),cx.Position)
ac(0.25)local wU=c4(wT,function()return H.seat()~=nil end)if not wU then aF(fZ,cx.Position+Vector3 .new(0,2,0),cx.Position+cx.LookVector)
ah(function()return H.seat()~=nil end,1.5)end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,r()x(("SAT at the campfire (+%s%% cash)"):format(tostring(F:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=r()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then x(H.msg)end end end A.skip,A.skipN,A.n,A.calls,A.fails,A.nextAt,A.msg,A.tries={},0,0,0,0,0,"off",{}
function A.can(bs,wV)local jx=bs:GetAttribute("PourOwner")if type(jx)~="number"or jx==j.uid or not bs:GetAttribute("HasSquishy")then return false end
if bs:GetAttribute("PourLong")~=true or bs:GetAttribute("PourFull")==true then return false end local jy=bs:GetAttribute("PourId")
if jy==nil or A.skip[jy]then return false end local pQ,jz,wW=bs:GetAttribute("Helpers"),0,tostring(j.uid)if type(pQ)=="string"then
for wX in pQ:gmatch("[^,%s]+")do jz=jz+1 if wX==wW then return false end end end if jz>=6 then return false end
local f1=q.left(bs)if not f1 then local pR=tonumber(bs:GetAttribute("PourEnd"))f1=pR and(pR-wV)end if not f1 or f1<=75 then return false end
local jA=game:GetService("Players"):GetPlayerByUserId(jx)if not jA or jA:GetAttribute("WaxHelpOff")==true then return false end
return true,jA,jy end function A.list()local jB,wY={},j.srv()local pS=ar:FindFirstChild("Plots")for AE,pT in ipairs(pS and pS:GetChildren()or{})do
local pU=pT~=c.plot and pT:FindFirstChild("WaxStations")for AF,jC in ipairs(pU and pU:GetChildren()or{})do local wZ,w0,w1=A.can(jC,wY)
local jD=wZ and jC:FindFirstChild("SquishyPlaceHolder")if jD and jD:IsA("BasePart")then jB[#jB+1]={st=jC,p=w0,id=w1,part=jD}end
end end return jB end function A.due()return e.Help and c.running and r()>=A.nextAt end function A.skipIt(pV,pW)
A.skip[pV],A.skipN=pW,A.skipN+1 if A.skipN>600 then A.skip,A.skipN,A.tries={[pV]=pW},1,{}end end function A.goHome()
local jE,bW=as(),A.home A.home=nil if not(jE and bW)then o.unpin(true)return end if e.Ghost and not H.seat()then
o.unpin(true)o.pin(bW-Vector3 .new(0,o.DEPTH,0),bW)elseif o.hold or(jE.HumanoidRootPart.Position-bW.Position).Magnitude>20 then
o.unpin(true)pcall(aF,jE,bW.Position,bW.Position+bW.LookVector)end end function A.step()local jF,dV=A.list(),as()
if#jF==0 or not dV then A.nextAt=r()+15 A.msg=("helped %d waxes here%s | none to help right now"):format(A.n,A.calls>0 and(", "..A.calls.." for the guild")or"")
A.goHome()return end local pX=dV.HumanoidRootPart local pY=pX.Position table.sort(jF,function(w2,w3)return(w2 .part.Position-pY).Magnitude<(w3 .part.Position-pY).Magnitude end)
local aL=jF[1]A.home=A.home or(o.hold and o.surface)or pX.CFrame local bt=aL.part local bX=(bt.Position+aL.st:GetPivot().Position)/2
local f2=A.tries[aL.id]or 0 if e.Ghost and f2==0 and not H.seat()then o.pin(CFrame.new(bX.X,bt.Position.Y-o.DEPTH,bX.Z))
else o.unpin(true)local jG=f2==0 and hq(bX.X,bt.Position.Y,bX.Z,{bt})if jG and math.abs(jG.Y-bt.Position.Y)<8 then
aF(dV,Vector3 .new(bX.X,jG.Y+eV(dV),bX.Z),bt.Position)else aF(dV,bt.Position+Vector3 .new(0,bt.Size.Y/2+3,0),bX)
end end ac(0.3)local dW=aq:FindFirstChild("Remotes")dW=dW and dW:FindFirstChild("ClanRequest")if not dW then A.nextAt,A.msg=r()+60,"the game's help remote is missing"return end
local f3,a5=pcall(function()return dW:InvokeServer("help",aL.st:GetAttribute("PourOwner"),tonumber(aL.st.Name))end)
if f3 and type(a5)=="table"and a5 .ok then A.n,A.fails=A.n+1,0 A.skipIt(aL.id,"helped")x(("HELPED %s's wax (station %s)"):format(aL.p.DisplayName,aL.st.Name))
A.msg=("helped %d waxes here%s"):format(A.n,A.calls>0 and(", "..A.calls.." for the guild")or"")elseif f3 and type(a5)=="table"and tostring(a5 .reason or""):lower():find("walk up",1,true)and f2<2 then
A.tries[aL.id]=f2+1 A.nextAt=r()+0.3 elseif f3 and type(a5)=="table"and tostring(a5 .reason or""):lower():find("moment",1,true)then
A.waits=(A.waits or 0)+1 A.nextAt=r()+1.6 else local pZ=(f3 and type(a5)=="table"and tostring(a5 .reason or"refused"))or("error: "..tostring(a5))
A.skipIt(aL.id,pZ)A.fails=A.fails+1 if A.fails<=3 then x(("help refused for %s's wax: %s"):format(aL.p.DisplayName,pZ))end
if A.fails>=5 then A.fails,A.nextAt,A.msg=0,r()+60,"the server keeps refusing helps - trying again in a minute"
A.goHome()end end A.nextAt=math.max(A.nextAt,r()+1.2)end function A.onCall(a6)if not e.HelpGuild or type(a6)~="table"or a6 .p~="help"or a6 .mine or a6 .u==j.uid or not a6 .u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local dX=aq:FindFirstChild("Remotes")
dX=dX and dX:FindFirstChild("ClanRequest")if not dX then return end local p0,dY=pcall(function()return dX:InvokeServer("callHelp",a6 .u)end)
local p1=tostring(a6 .n or a6 .un or a6 .u)if p0 and type(dY)=="table"and dY.ok then A.calls=A.calls+1 x(("HELPED guildmate %s's wax from here (their call)"):format(p1))
else x(("guild call from %s: %s"):format(p1,(p0 and type(dY)=="table"and tostring(dY.reason or"refused"))or tostring(dY)))
end end)end local function ap(w4,p2,...)if c.busy then return end c.busy,c.busyText=true,w4 if o.hold and p2~=A.step then pcall(o.unpin)end
local w5,p3=pcall(p2,...)c.busy,c.busyText=false,""if not w5 and p3~=gA then x("ERR "..tostring(p3))end end local function w6()
local a7,w7,w8=py()c.reason,c.level=w7,w8 if a7=="place"then ap("waxing...",q.place)elseif a7=="crate"then ap("opening crate...",e7,true)
elseif a7=="cratesmart"then ap("opening crate...",d.smart)elseif a7=="cratewin"then ap("opening the crate window...",hK)
elseif a7=="nocrate"then ap("discarding crate...",e7,false)elseif a7=="sell"then ap("selling...",ps)elseif a7=="buy"then ap("buying...",md,false)
elseif not a7 and not c.matchSince and H.due()then ap("sitting at the campfire...",H.sit)elseif e.Collect and not c.matchSince and r()-c.lastCollect>=e.Every then
ap("collecting money...",wJ)elseif not a7 and not c.matchSince and A.due()then ap("helping a wax...",A.step)elseif A.home and not e.Help then
ap("coming back...",A.goHome)elseif not c.busy then o.parkTick()end end function dR(f4,w9)if f4==c.running then return end
c.running=f4 if not w9 then e.AutoStart=f4 end if f4 then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=r()c.plot=ba()or c.plot
x("START")else c.reason="stopped"x("STOP")end end do local bu=eH(ad.auto)if type(bu)=="string"then bu=bu:gsub("%s+$","")
if bu~=""then c.autoload=bu local w_=lL(bu)x(w_ and("loaded config "..bu)or("config "..bu.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local xa={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}local p4={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function K(xb,xc,xd)local xe,jH=pcall(Instance.new,xb)
if not xe then c.uiErrs=c.uiErrs+1 return nil end for xf,xg in pairs(xc)do if not pcall(function()jH[xf]=xg end)then c.uiErrs=c.uiErrs+1 end
end jH.Parent=xd return jH end local function ai(xh,xi)K("UICorner",{CornerRadius=UDim.new(0,xi or 6)},xh)end
local a={}local jI=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local p5=jI:FindFirstChild("SABFarmGui")
if p5 then p5:Destroy()end local jJ=K("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},jI)
local ag={w=320,h=330,head=30,strip=38,tabs=26}a.root=K("Frame",{Name="Root",Size=UDim2 .new(0,ag.w,0,ag.h),Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),
BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},jJ)ai(a.root,10)K("UIStroke",{Color=l.line,Thickness=1},a.root)
local a8=UDim2 .new(1,0,1,0)local function D(p6,p7)return UDim2 .new(p6,0,0,0),UDim2 .new(p7,(p6+p7>0.99)and 0 or-4,1,0)end
local function C(xj,xk,xl,xm,xn,xo)local p8=K("TextButton",{Text=xk,Position=xn,Size=xo,BackgroundColor3=xl,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=xm,TextColor3=l.text,AutoButtonColor=true},xj)ai(p8,6)return p8 end local function f5(xp,xq,xr,xs,xt)
local jK=K("TextBox",{Text=xq,PlaceholderText=xr,Position=xs,Size=xt,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=l.text,PlaceholderColor3=l.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},xp)ai(jK,6)K("UIPadding",{PaddingLeft=UDim.new(0,8)},jK)
return jK end local f6=ar.CurrentCamera local function xu()local xv,f7=pcall(function()return f6 and f6 .ViewportSize end)
if xv and f7 and f7 .X>50 and f7 .Y>50 then return f7 end end local function bv(dZ)local jL=xu()if not(jL and dZ and dZ.Parent)then return end
local xw=pcall(function()local f8,p9=dZ.AbsolutePosition,dZ.AbsoluteSize local jM=70 local p_=math.clamp(f8 .X,jM-p9 .X,jL.X-jM)
local qa=math.clamp(f8 .Y,0,jL.Y-math.min(p9 .Y,jM))if math.abs(p_-f8 .X)>0.5 or math.abs(qa-f8 .Y)>0.5 then dZ.Position=UDim2 .new(0,math.floor(p_),0,math.floor(qa))
end end)return xw end local function f9(xx)local xy,jN=pcall(function()return xx.AbsolutePosition end)if xy and jN then return{math.floor(jN.X),math.floor(jN.Y)}end
end local cy={}c.dragMoved={}local function qb(d0,qc,jO)P(d0 .InputBegan:Connect(function(cz)if cz.UserInputType~=Enum.UserInputType.MouseButton1 and cz.UserInputType~=Enum.UserInputType.Touch then return end
local jP={start=cz.Position,from=qc.Position,moved=0,target=qc,input=cz,onDrop=jO}cy[d0],c.dragMoved[d0]=jP,0
local jQ jQ=cz.Changed:Connect(function()if cz.UserInputState==Enum.UserInputState.End and cy[d0]==jP then cy[d0]=nil
if jQ then jQ:Disconnect()end if jO then jO(jP.moved)end end end)end))end P(kA.InputChanged:Connect(function(f_)
if f_.UserInputType~=Enum.UserInputType.MouseMovement and f_.UserInputType~=Enum.UserInputType.Touch then return end
for xz,aR in pairs(cy)do local jR=aR.target if jR and jR.Parent then local qd,qe=f_.Position.X-aR.start.X,f_.Position.Y-aR.start.Y
aR.moved=math.max(aR.moved,math.abs(qd)+math.abs(qe))c.dragMoved[xz]=aR.moved jR.Position=UDim2 .new(aR.from.X.Scale,aR.from.X.Offset+qd,aR.from.Y.Scale,aR.from.Y.Offset+qe)
end end end))P(kA.InputEnded:Connect(function(ga)if ga.UserInputType~=Enum.UserInputType.MouseButton1 and ga.UserInputType~=Enum.UserInputType.Touch then return end
for xA,gb in pairs(cy)do if gb.input==ga or ga.UserInputType==Enum.UserInputType.MouseButton1 then cy[xA]=nil
if gb.onDrop then gb.onDrop(gb.moved)end end end end))local function M(xC,xD,xE,xF,xG,xH,xI)return K("TextLabel",{Text=xD,Position=xH or UDim2 .new(0,0,0,0),Size=xI or a8,BackgroundTransparency=1,
Font=xG and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=xE,TextColor3=xF,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},xC)
end a.title=K("Frame",{Size=UDim2 .new(1,0,0,ag.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=K("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.title)
ai(a.dot,5)M(a.title,"SAB  BUTTER FARM  "..b2,12,l.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=C(a.title,"-",l.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=C(a.title,"X",l.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=K("Frame",{Position=UDim2 .new(0,0,0,ag.head),Size=UDim2 .new(1,0,0,ag.strip),BackgroundColor3=l.bg,BorderSizePixel=0},a.root)
a.bar=K("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
ai(a.bar,2)a.reason=M(a.strip,"starting",12,l.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=K("Frame",{Position=UDim2 .new(0,0,0,ag.head+ag.strip),Size=UDim2 .new(1,0,0,ag.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=C(a.tabs,"FARM",l.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=C(a.tabs,"BUTTERS",l.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=C(a.tabs,"CRATES",l.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=C(a.tabs,"PETS",l.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=C(a.tabs,"TEAMS",l.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=C(a.tabs,"SETUP",l.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function cA()local jS=K("ScrollingFrame",{Position=UDim2 .new(0,0,0,ag.head+ag.strip+ag.tabs),Size=UDim2 .new(1,0,1,-(ag.head+ag.strip+ag.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
K("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},jS)K("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},jS)
return jS end a.farm,a.but,a.set,a.crt=cA(),cA(),cA(),cA()a.pet,a.team=cA(),cA()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local gc,d1,E=0,12,nil local function aj(qf,xJ)gc,d1=gc+1,d1+qf+6 return K("Frame",{Size=UDim2 .new(1,0,0,qf),BackgroundTransparency=1,LayoutOrder=gc},xJ or a.farm)
end local function bY(xK)M(aj(14),xK,10,l.dim,true)end E=aj(34)a.startB=C(E,"START",l.good,14,D(0,0.68))a.killB=C(E,"KILL",l.bad,14,D(0.68,0.32))
local xL=aj(42)local function d2(qg,xM,jT)local jU=K("Frame",{Position=UDim2 .new((qg-1)/jT,0,0,0),Size=UDim2 .new(1/jT,qg<jT and-4 or 0,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},xL)ai(jU,6)local qh=M(jU,"0",15,l.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local xN=M(jU,xM,9,l.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))qh.TextXAlignment,xN.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return qh end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=d2(1,"BOUGHT",5),d2(2,"WAXED",5),d2(3,"SOLD",5),d2(4,"MONEY",5),d2(5,"FREE",5)
a.info=M(aj(40),"",10,l.dim,false)a.tgt=M(aj(26),"",10,l.good,false)bY("MONEY COLLECT")E=aj(28)a.secB=f5(E,tostring(e.Every),"60",D(0,0.2))
M(E,"sec",11,l.dim,false,D(0.21,0.09))a.secSet=C(E,"SET",l.accent,12,D(0.3,0.2))a.colT=C(E,"COLLECT: ON",l.accent,11,D(0.5,0.5))
E=aj(26)a.padB=C(E,"SET PAD (stand on it)",l.panel2,10,D(0,0.55))a.padL=M(E,"",10,l.dim,false,D(0.56,0.44))bY("BUTTERS YOU DID NOT TICK, AND CRATES")
E=aj(28)a.sellT=C(E,"SELL THEM: ON",l.accent,11,D(0,0.55))a.sellB=C(E,"SELL NOW",l.warn,11,D(0.55,0.45))E=aj(28)
a.crateT=C(E,"OPEN CRATES: ON",l.accent,11,D(0,0.55))a.crateB=C(E,"OPEN NOW",l.warn,11,D(0.55,0.45))bY("HELP OTHER PLAYERS' WAXES  (10% off their wax each)")
E=aj(28)a.helpT=C(E,"HELP WAXES: OFF",l.panel2,10,D(0,0.5))a.helpGT=C(E,"GUILD CALLS: OFF",l.panel2,10,D(0.5,0.5))
a.helpL=M(aj(14),"",9,l.dim,false)bY("EVENT CAMPFIRE  /  STAYING OUT OF SIGHT")E=aj(28)a.campT=C(E,"CAMPFIRE: OFF",l.panel2,10,D(0,0.5))
a.ghostT=C(E,"GHOST: OFF",l.panel2,10,D(0.5,0.5))a.campL=M(aj(14),"",9,l.dim,false)bY("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
E=aj(28)a.arT=C(E,"AUTO ROLL: OFF",l.panel2,11,D(0,0.5))a.arL=M(E,"",9,l.dim,false,D(0.52,0.48))bY("TOOLS")E=aj(30)
a.buyB=C(E,"BUY",l.warn,10,D(0,0.5))a.plB=C(E,"WAX",l.good,10,D(0.5,0.5))bY("LOG")a.log=K("TextLabel",{Size=a8,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},aj(84))ai(a.log,6)K("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,d1)gc,d1=0,12 local function ak(xO)return aj(xO,a.set)end local function d3(xP)M(ak(14),xP,10,l.dim,true)end
d3("SETTINGS FILE  (saved on your phone)")E=ak(28)a.cfgName=f5(E,"default","config name",D(0,0.5))a.cfgSave=C(E,"SAVE",l.good,11,D(0.5,0.25))
a.cfgLoad=C(E,"LOAD",l.accent,11,D(0.75,0.25))E=ak(26)a.cfgPrev=C(E,"<",l.panel2,11,D(0,0.13))a.cfgPick=C(E,"(none saved)",l.panel2,10,D(0.13,0.74))
a.cfgNext=C(E,">",l.panel2,11,D(0.87,0.13))E=ak(26)a.cfgAuto=C(E,"LOAD IT ON LAUNCH: OFF",l.panel2,10,D(0,1))
a.cfgMsg=M(ak(26),"",10,l.dim,false)d3("START BY ITSELF")E=ak(26)a.autoB=C(E,"INSTALL F.exec",l.accent,10,D(0,1))
a.autoMsg=M(ak(30),"",10,l.dim,false)E=ak(28)a.startT=C(E,"START FARMING ON LOAD: ON",l.accent,10,D(0,1))M(ak(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,l.dim,false)
d3("IF THE GAME DROPS ME")E=ak(28)a.rejT=C(E,"AUTO REJOIN: ON",l.accent,11,D(0,0.55))a.rejB=C(E,"REJOIN NOW",l.warn,11,D(0.55,0.45))
a.rejMsg=M(ak(30),"",10,l.dim,false)d3("SMOOTHER RUNNING  (for long / overnight runs)")E=ak(28)a.pfLite=C(E,"LITE MODE: OFF",l.panel2,10,D(0,0.5))
a.pfHud=C(E,"HIDE GAME HUD: OFF",l.panel2,10,D(0.5,0.5))E=ak(28)a.pfFps=C(E,"FPS CAP: GAME",l.panel2,10,D(0,0.5))
a.pfRender=C(E,"STOP 3D: OFF",l.panel2,10,D(0.5,0.5))E=ak(28)a.pfMem=f5(E,tostring(e.MemLimit),"2000",D(0,0.24))
M(E,"MB: rejoin this server above it (0 = never)",9,l.dim,false,D(0.26,0.52))a.pfMemSet=C(E,"SET",l.accent,11,D(0.8,0.2))
a.pfInfo=M(ak(18),"",10,l.text,false)M(ak(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,l.dim,false)
d3("THE ROUND SAB BUTTON")M(ak(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,l.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,d1)local qi=K("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},jI)
a.tgRoot=K("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},qi)ai(a.tgRoot,20)K("UIStroke",{Color=l.line,Thickness=1},a.tgRoot)
a.tgBtn=K("TextButton",{Text="SAB",Size=a8,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=l.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=K("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ai(a.tgDot,4)local a9={built=false,boxes={},at=0}local function qj(qk,jV)e.Targets[qk]=jV or nil local jW=a9 .boxes[qk]
if jW then jW.Text=jV and"X"or""jW.BackgroundColor3=jV and l.good or l.panel2 end end local function jX()for xQ,ql in pairs(a9 .boxes)do
local qm=e.Targets[xQ]==true ql.Text=qm and"X"or""ql.BackgroundColor3=qm and l.good or l.panel2 end end local d4
local function xR()local xS=0 local jY=K("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=M(jY,"",10,l.dim,false,D(0,0.5))local xT=C(jY,"CLEAR",l.panel2,10,D(0.5,0.24))local xU=C(jY,"REFRESH",l.panel2,10,D(0.74,0.26))
xT.MouseButton1Click:Connect(function()for xV in pairs(e.Targets)do e.Targets[xV]=nil end jX()end)xU.MouseButton1Click:Connect(function()
T.at=0 ha()d4(true)end)return xS end d4=function(xW)if not ha()then if not a.butEmpty then a.butEmpty=M(K("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)end return end if a9 .built and not xW and a9 .at==T.at then return end
for AG,jZ in ipairs(a.but:GetChildren())do if jZ:IsA("Frame")or jZ:IsA("TextButton")then jZ:Destroy()end end a9 .boxes,a.butEmpty={},nil
xR()local j0,j1=36,1 local function qn(qo)j1=j1+1 local xX=K("Frame",{Size=UDim2 .new(1,0,0,qo),BackgroundTransparency=1,LayoutOrder=j1},a.but)
j0=j0+qo+6 return xX end for AH,gd in ipairs(T.rarOrder)do local xY=qn(24)local xZ=p4[gd]or l.text local j2=K("Frame",{Size=a8,BackgroundColor3=l.panel,BorderSizePixel=0},xY)
ai(j2,6)M(j2,"  "..gd:upper(),11,xZ,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local x0=C(j2,"ALL",l.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local x1=gd x0 .MouseButton1Click:Connect(function()local qp=T.members[x1]or{}local qq=false for AI,x2 in ipairs(qp)do if not e.Targets[x2]then qq=true break end end
for AJ,x3 in ipairs(qp)do qj(x3,qq)end end)for AK,j3 in ipairs(T.members[gd]or{})do local x4=qn(22)local ge=K("TextButton",{Text="",Size=a8,BackgroundColor3=l.bg,BorderSizePixel=0,
AutoButtonColor=true},x4)ai(ge,5)M(ge,"   "..ae(j3),11,l.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local j4=K("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},ge)ai(j4,4)a9 .boxes[j3]=j4 local qr=j3 local function qs()qj(qr,not e.Targets[qr])end
ge.MouseButton1Click:Connect(qs)j4 .MouseButton1Click:Connect(qs)end end jX()a.but.CanvasSize=UDim2 .new(0,0,0,j0+10)
a9 .built,a9 .at=true,T.at end function J.paint()for x5,qt in pairs(J.boxes)do local qu=e.CrateTicks[x5]==true
qt.Text=qu and"X"or""qt.BackgroundColor3=qu and l.good or l.panel2 end if a.crtInfo then local j5,j6=0,0 for AL in pairs(J.boxes)do j5=j5+1 end
for AM,x6 in pairs(e.CrateTicks)do if x6 then j6=j6+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(j5,j6)
end if a.crtAll then a.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=e.Crates and l.accent or l.panel2
end end function J.build()for AN,j7 in ipairs(a.crt:GetChildren())do if j7:IsA("Frame")or j7:IsA("TextButton")then j7:Destroy()end
end J.boxes={}local j8,j9=12,0 local function gf(qv)j9=j9+1 j8=j8+qv+6 return K("Frame",{Size=UDim2 .new(1,0,0,qv),BackgroundTransparency=1,LayoutOrder=j9},a.crt)
end local j_=gf(28)a.crtInfo=M(j_,"",10,l.dim,false,D(0,0.5))local x7=C(j_,"CLEAR",l.panel2,10,D(0.5,0.24))local x8=C(j_,"REFRESH",l.panel2,10,D(0.74,0.26))
P(x7 .MouseButton1Click:Connect(function()e.CrateTicks={}J.paint()end))P(x8 .MouseButton1Click:Connect(function()J.build()end))
a.crtAll=C(gf(28),"",l.accent,11,D(0,1))P(a.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates J.paint()end))
M(gf(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,l.dim,false)
for AO,a_ in ipairs(J.list())do local x9=gf(24)local d5=K("TextButton",{Text="",Size=a8,BackgroundColor3=l.panel,BorderSizePixel=0,AutoButtonColor=true},x9)
ai(d5,5)M(d5,"  "..(a_.title or a_.name)..(a_.guess and"  (?)"or""),11,p4[a_.rar or""]or l.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
M(d5,a_.price and("$"..aB(a_.price))or(a_.rar or""),9,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local ka=K("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},d5)ai(ka,4)J.boxes[a_.k]=ka local qw=a_.k local function qx()e.CrateTicks[qw]=(not e.CrateTicks[qw])or nil
J.paint()end P(d5 .MouseButton1Click:Connect(qx))P(ka.MouseButton1Click:Connect(qx))end a.crt.CanvasSize=UDim2 .new(0,0,0,j8+10)
J.built=J.at J.paint()end local qy="farm"local function bw(al)qy=al a.farm.Visible,a.but.Visible,a.set.Visible=(al=="farm"),(al=="but"),(al=="set")
a.crt.Visible=(al=="crt")a.pet.Visible,a.team.Visible=(al=="pet"),(al=="team")a.tabCrt.BackgroundColor3=(al=="crt")and l.accent or l.panel2
a.tabPet.BackgroundColor3=(al=="pet")and l.accent or l.panel2 a.tabTeam.BackgroundColor3=(al=="team")and l.accent or l.panel2
if al=="pet"and not j.built then pcall(j.build)end if al=="team"and not q.built then pcall(q.build)end if al=="crt"and(J.built~=J.at or not next(J.boxes))then J.build()end
a.tabFarm.BackgroundColor3=(al=="farm")and l.accent or l.panel2 a.tabBut.BackgroundColor3=(al=="but")and l.accent or l.panel2
a.tabSet.BackgroundColor3=(al=="set")and l.accent or l.panel2 if al=="but"then d4(false)end end local function L(qz,qA,x_,ya)
qz.Text=qA and x_ or ya qz.BackgroundColor3=qA and l.accent or l.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(qB)
local bZ=j.rows and j.rows[qB]if not bZ then return end local d6=e.Pets[qB]or{}bZ.b.BackgroundColor3=d6 .b and l.good or l.panel2
bZ.g.BackgroundColor3=d6 .g and l.accent or l.panel2 bZ.g.Text=d6 .g and"BIG"or"ANY"bZ.w.BackgroundColor3=d6 .w and l.warn or l.panel2
local kb=tonumber(d6 .f)or 0 bZ.f.Text=kb>0 and(kb.." BIG")or"FUSE"bZ.f.BackgroundColor3=kb>0 and l.good or l.panel2
end function j.flag(kc,gg)local aS=e.Pets[kc]or{}if gg=="f"then local qC=((tonumber(aS.f)or 0)+1)%4 aS.f=qC>0 and qC or nil
elseif aS[gg]then aS[gg]=nil else aS[gg]=true end e.Pets[kc]=(aS.b or aS.g or aS.w or aS.f)and aS or nil j.paintRow(kc)
end function j.paintAll()for yb in pairs(j.rows or{})do j.paintRow(yb)end if a.pbT then L(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
L(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")L(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function j.live()if not j.built then j.build()return end if r()-(j.liveAt or 0)<1 then return end j.liveAt=r()
local qD=j.wishes()local d7=j.data()for gh,gi in pairs(j.rows)do gi.name.Text=j.nice(gh)..(qD[gh]and("   * wish %dm"):format(math.ceil(qD[gh]/60))or"")
local qE=y.status(gh,d7)gi.desc.Text=qE and(qE.." | "..gi.boostText)or gi.boostText end local qF=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(d7 and#(d7 .pets or{})or 0,d7 and tonumber(d7 .maxOwned)or 60,
aB(j.money()),qF>0 and(" | free wishes "..qF)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local gj=j.info()for AP,kd in ipairs(a.pet:GetChildren())do if kd:IsA("Frame")or kd:IsA("TextLabel")then kd:Destroy()end
end j.rows={}local ke,gk=0,12 local function cB(qG)ke,gk=ke+1,gk+qG+6 return K("Frame",{Size=UDim2 .new(1,0,0,qG),BackgroundTransparency=1,LayoutOrder=ke},a.pet)
end local kf=cB(28)a.pbT=C(kf,"AUTO ADOPT: OFF",l.panel2,9,D(0,0.34))a.pwT=C(kf,"AUTO WISH: OFF",l.panel2,9,D(0.34,0.33))
a.pfT=C(kf,"AUTO FUSE: OFF",l.panel2,9,D(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()e.PetBuy=not e.PetBuy j.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()e.PetWish=not e.PetWish j.paintAll()end)a.pfT.MouseButton1Click:Connect(function()e.AutoFuse=not e.AutoFuse j.paintAll()end)
a.pInfo=M(cB(44),"",10,l.dim,false)M(cB(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,l.dim,false)
if not gj then M(cB(30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,gk)
j.built=false return end local cC={}for AQ,qH in ipairs(j.order())do local kg=gj.Pets[qH].rarity or"?"cC[kg]=cC[kg]or{}
table.insert(cC[kg],qH)end local cD={}for AS,qI in ipairs(gj.Rarities or{})do if cC[qI]then cD[#cD+1]=qI end end
for qJ in pairs(cC)do if not table.find(cD,qJ)then cD[#cD+1]=qJ end end for AT,gl in ipairs(cD)do local qK=K("Frame",{Size=a8,BackgroundColor3=l.panel,BorderSizePixel=0},cB(22))
ai(qK,6)M(qK,"  "..gl:upper(),11,j.RC[gl]or l.text,true)for AU,gm in ipairs(cC[gl])do local b0=K("Frame",{Size=a8,BackgroundColor3=l.bg,BorderSizePixel=0},cB(38))
ai(b0,5)local yc=M(b0,j.nice(gm),11,j.RC[gl]or l.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local yd,ye=pcall(function()return gj.describe(gm)end)
local qL=yd and tostring(ye)or""local yf=M(b0,qL,9,l.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local qM=C(b0,"BUY",l.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local qN=C(b0,"ANY",l.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local qO=C(b0,"WISH",l.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local qP=C(b0,"FUSE",l.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local gn=gm qM.MouseButton1Click:Connect(function()j.flag(gn,"b")end)
qN.MouseButton1Click:Connect(function()j.flag(gn,"g")end)qO.MouseButton1Click:Connect(function()j.flag(gn,"w")end)
qP.MouseButton1Click:Connect(function()j.flag(gn,"f")end)j.rows[gm]={b=qM,g=qN,w=qO,f=qP,name=yc,desc=yf,boostText=qL}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,gk+10)j.built=true j.paintAll()end function o.paint()L(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")
L(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")L(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
L(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end
end function o.applyAll()if e.Lite then o.lite(true)end if e.HideHud then o.hideHud(true)end if e.NoRender then o.render(true)end
if(e.FpsCap or 0)~=0 then o.cap(e.FpsCap)end o.paint()end P(a.pfLite.MouseButton1Click:Connect(function()o.lite(not e.Lite)o.paint()end))
P(a.pfHud.MouseButton1Click:Connect(function()o.hideHud(not e.HideHud)o.paint()end))P(a.pfRender.MouseButton1Click:Connect(function()o.render(not e.NoRender)o.paint()end))
P(a.pfFps.MouseButton1Click:Connect(function()local yg=table.find(o.CAPS,e.FpsCap or 0)or 1 local qQ=o.CAPS[(yg%#o.CAPS)+1]
if not o.cap(qQ)and qQ~=0 then x("this executor cannot cap fps")end o.paint()end))P(a.pfMemSet.MouseButton1Click:Connect(function()
local kh=tonumber(a.pfMem.Text)if kh and kh>=0 then e.MemLimit=math.floor(kh)end o.paint()end))function q.names()
local ki={"(none)"}for AV,yh in ipairs((q.teams()))do ki[#ki+1]=yh.name end return ki end function q.cycle(kj,yi)
local go=q.names()local yj=e[kj]~=""and e[kj]or"(none)"local gp=table.find(go,yj)or 1 gp=((gp-1+yi)%#go)+1 e[kj]=go[gp]=="(none)"and""or go[gp]
q.paint()end function q.paint()if not q.built then return end L(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
L(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local kk={}for AW,yk in ipairs((q.teams()))do kk[yk.name]=true end
for yl,qR in pairs(q.pick)do local cE=e[yl]qR.Text=cE==""and"(none)"or(kk[cE]and cE or(cE.." (missing)"))qR.TextColor3=(cE~=""and not kk[cE])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(q.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(q.switches,q.finished,q.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local ym,gq=j.srv(),{}for AX,gr in ipairs(q.list or{})do gq[#gq+1]=("st %-2s %-22s %9s  helps %d"):format(gr.st.Name,ae(W(gr.name)):sub(1,22),q.clock(gr.ends-ym),gr.helps)
end a.tmList.Text=#gq>0 and table.concat(gq,"\n")or"no waxes running"end function q.build()for AY,kl in ipairs(a.team:GetChildren())do
if kl:IsA("Frame")or kl:IsA("TextLabel")then kl:Destroy()end end q.pick={}local km,kn=0,12 local function bx(qS)
km,kn=km+1,kn+qS+6 return K("Frame",{Size=UDim2 .new(1,0,0,qS),BackgroundTransparency=1,LayoutOrder=km},a.team)
end local function d8(yn)M(bx(14),yn,10,l.dim,true)end local function gs(gt)local ko=bx(26)local yo=C(ko,"<",l.panel2,11,D(0,0.14))
local qT=C(ko,"(none)",l.panel,10,D(0.14,0.72))local yp=C(ko,">",l.panel2,11,D(0.86,0.14))yo.MouseButton1Click:Connect(function()q.cycle(gt,-1)end)
yp.MouseButton1Click:Connect(function()q.cycle(gt,1)end)qT.MouseButton1Click:Connect(function()q.cycle(gt,1)end)
q.pick[gt]=qT end a.tmT=C(bx(28),"AUTO TEAMS: OFF",l.panel2,11,D(0,1))a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=q.current()end q.paint()end)a.tmInfo=M(bx(42),"",10,l.dim,false)
local qU=bx(26)a.tmBuild=C(qU,"AUTO BUILD TEAMS: OFF",l.panel2,9,D(0,0.62))a.tmBuildNow=C(qU,"BUILD NOW",l.warn,9,D(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild q.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if q.editing then return end y.buildMsg="building..."task.spawn(function()local yq,yr=pcall(y.rebuild,"you asked")if not yq then x("BUILD ERR "..tostring(yr))end end)
end)d8("NORMAL TEAM  (worn the rest of the time)")gs("TeamNormal")d8("FULL TEAM  (every station busy: money + wax speed)")
gs("TeamFull")d8("GLAZE TEAM  (worn just before a wax finishes)")gs("TeamGlaze")local kp=bx(26)a.tmLead=f5(kp,tostring(e.GlazeLead),"45",D(0,0.2))
M(kp,"sec before it finishes",10,l.dim,false,D(0.22,0.5))local ys=C(kp,"SET",l.accent,11,D(0.75,0.25))ys.MouseButton1Click:Connect(function()
local gu=tonumber(a.tmLead.Text)if gu and gu>=5 and gu<=600 then e.GlazeLead=math.floor(gu)else a.tmLead.Text=tostring(e.GlazeLead)end
q.paint()end)d8("WAX TEAM  (worn while a butter is placed: head starts)")gs("TeamWax")d8("YOUR WAXES  (time left, helps)")
a.tmList=K("TextLabel",{Size=a8,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bx(150))ai(a.tmList,6)K("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
M(bx(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,l.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,kn+10)q.built=true q.paint()end local function yt()a.secB.Text=tostring(e.Every)
L(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")L(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")L(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
L(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")L(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
L(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")L(a.ghostT,e.Ghost,"GHOST: ON","GHOST: OFF")if not e.Ghost then task.spawn(function()while c.busy do ac(0.1)end pcall(o.unpin)end)end
L(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")L(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")L(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then dR(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bv(a.root)bv(a.tgRoot)c.lastCollect=r()
jX()J.paint()pcall(j.paintAll)pcall(q.paint)pcall(o.applyAll)end local function yu(qV)task.spawn(function()qV.TextColor3=l.bad
task.wait(0.8)if c.alive then qV.TextColor3=l.text end end)end local function qW()local qX=a.secB.Text:match("^%s*(%d+)%s*$")
local d9=qX and tonumber(qX)if not d9 or d9<1 then a.secB.Text=tostring(e.Every)yu(a.secB)x("interval must be a whole number >= 1")
return end if d9==e.Every then return end e.Every,c.lastCollect=d9,r()x("collect every "..d9 .."s")end local function N(yv,yw)P(yv.MouseButton1Click:Connect(yw))end
N(a.secSet,qW)P(a.secB.FocusLost:Connect(qW))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,r()L(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk L(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(ap,"selling...",ps)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(z.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates L(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help A.nextAt,A.msg=0,e.Help and"looking for waxes to help"or"off"L(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild L(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.campT,function()e.Campfire=not e.Campfire H.nextAt,H.fails,H.lost=0,0,0 L(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")
end)N(a.ghostT,function()e.Ghost=not e.Ghost if not e.Ghost then task.spawn(function()while c.busy do ac(0.1)end pcall(o.unpin)end)end
L(a.ghostT,e.Ghost,"GHOST: ON","GHOST: OFF")end)N(a.crateB,function()d.lastFail,d.summonFails,d.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(ap,"opening crate...",e7,true)end)N(a.padB,function()c.plot=ba()or c.plot local qY,kq=as(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(qY and kq and kq:IsA("BasePart"))then x("SET PAD: need character and plot")return end c.manualPad=kq.CFrame:ToObjectSpace(qY.HumanoidRootPart.CFrame)
wz(c.manualPad)x("collect pad saved at your position")end)N(a.startB,function()dR(not c.running)end)N(a.buyB,function()
c.plot=ba()or c.plot task.spawn(ap,"buying (manual)...",md,true)end)N(a.plB,function()c.plot=ba()or c.plot task.spawn(ap,"waxing (manual)...",mi)
end)N(a.tabFarm,function()bw("farm")end)N(a.tabBut,function()bw("but")end)N(a.tabSet,function()bw("set")end)N(a.tabCrt,function()bw("crt")end)
N(a.tabPet,function()bw("pet")end)N(a.tabTeam,function()bw("team")end)local function yx(kr)c.hidden=kr a.root.Visible=not kr
a.tgBtn.Text=kr and"SAB+"or"SAB"end qb(a.tgBtn,a.tgRoot,function()bv(a.tgRoot)c.togPos=f9(a.tgRoot)or c.togPos
end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then yx(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aA,am={},0
local function by()aA=lC()if#aA==0 then a.cfgPick.Text="(none saved)"am=0 return end if am<1 or am>#aA then am=1 end
a.cfgPick.Text=aA[am]..("  (%d/%d)"):format(am,#aA)end local function qZ()local q0=c.autoload~=nil a.cfgAuto.Text=q0 and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=q0 and l.accent or l.panel2 end local function ks()local q1=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if q1~=""then return q1 end return(am>0 and aA[am])or""end N(a.cfgSave,function()c.winPos=f9(a.root)or c.winPos
c.togPos=f9(a.tgRoot)or c.togPos local q2,q3=eM(ks())a.cfgMsg.Text=q2 and("saved as "..q3)or("could not save: "..q3)
a.cfgMsg.TextColor3=q2 and l.good or l.bad by()x(a.cfgMsg.Text)end)local function yy(kt)local ku,q4=lL(kt)a.cfgMsg.Text=ku and("loaded "..q4)or("could not load: "..q4)
a.cfgMsg.TextColor3=ku and l.good or l.bad if ku then a.cfgName.Text=kt yt()task.spawn(z.apply,"config "..kt)
end x(a.cfgMsg.Text)end N(a.cfgLoad,function()yy(ks())end)N(a.cfgPick,function()by()if am>0 then a.cfgName.Text=aA[am]end
end)N(a.cfgPrev,function()if#aA==0 then by()return end am=(am-2)%#aA+1 by()a.cfgName.Text=aA[am]end)N(a.cfgNext,function()
if#aA==0 then by()return end am=am%#aA+1 by()a.cfgName.Text=aA[am]end)N(a.cfgAuto,function()if c.autoload then
lN(nil)a.cfgMsg.Text="it will not load a config on launch"else local d_=ks()local q5=false for AZ,yz in ipairs(lC())do if yz==d_ then q5=true end end
local yA=q5 or eM(d_)if yA and d_~=""then lN(d_)by()a.cfgMsg.Text=d_.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim qZ()end)N(a.autoB,function()
local q6,q7=sW()a.autoMsg.Text=q6 and("installed. "..q7)or("failed: "..q7)a.autoMsg.TextColor3=q6 and l.good or l.bad
x(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart L(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin L(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()cX("you asked")end)
local b1=false N(a.minB,function()b1=not b1 a.tabs.Visible=not b1 if b1 then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bw(qy)end a.root.Size=UDim2 .new(0,ag.w,0,b1 and(ag.head+ag.strip)or ag.h)
a.minB.Text=b1 and"+"or"-"end)local function gv()if not c.alive then return end c.alive,c.running=false,false
pcall(o.restoreAll)pcall(en)for A0,yB in ipairs(gB)do pcall(function()yB:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()jJ:Destroy()end)pcall(function()qi:Destroy()end)if b3 .SAB_KILL==gv then b3 .SAB_KILL=nil end
end b3 .SAB_KILL=gv N(a.killB,gv)N(a.xB,gv)qb(a.title,a.root,function()bv(a.root)c.winPos=f9(a.root)or c.winPos
end)local function q8()local ea,eb=c.reason,c.level if c.busy then ea,eb=c.busyText,"ok"elseif not c.running then
local A1,q9,yC=py()if c.capHit then ea,eb=q9,"bad"else ea,eb="[stopped] "..q9,(yC=="bad")and"bad"or"idle"end c.reason,c.level=ea,eb
end a.reason.Text=ea a.bar.BackgroundColor3=xa[eb]or l.dim a.dot.BackgroundColor3=c.running and l.good or(c.capHit and l.bad or l.dim)
a.tgDot.BackgroundColor3=a.dot.BackgroundColor3 a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent a.startB.Text=c.running and"STOP"or"START"
L(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")a.startB.BackgroundColor3=c.running and l.warn or l.good
local yD,yE=ek()a.sBought.Text,a.sPlaced.Text,a.sSold.Text=tostring(c.bought),tostring(c.placed),tostring(c.sold)
a.sColl.Text,a.sFree.Text=tostring(c.collected),yD.."/"..yE local q_=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(r()-c.lastCollect)))or nil
local ra=V()a.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aB(aU()),c.rolls,c.gifts,c.crates,ra and ae(W(ra))or"nothing",d.on and("   ["..d.title.." window open]")or"",
q_ and("in "..q_.."s")or"off")local cF=sx()a.tgt.Text=(#cF==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#cF<=3)and table.concat(cF,", ")or(#cF.." butters ticked")))
a.tgt.TextColor3=(#cF==0)and l.bad or l.good a.padL.Text=c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found")
a.log.Text=table.concat(ee,"\n")if a.butInfo then a.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(T.n,#T.rarOrder,#cF)
end if a.but.Visible and a9 .at~=T.at then d4(false)end if a.crt.Visible then if J.built~=J.at then J.build()else J.paint()end
end if a.pet.Visible then j.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak)
end if a.team.Visible then q.paint()end if a.farm.Visible then a.helpL.Text=(e.Help or e.HelpGuild)and A.msg or"off"
a.campL.Text=(e.Campfire and H.msg or"campfire off")..(e.Ghost and(o.hold and" | ghost: under"or" | ghost: up")or"")
end L(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")L(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local rb=(z.rec.on and"on"or"")..(z.rec.off and((z.rec.on and"/"or"").."off")or"")a.arL.Text=z.msg~=""and z.msg or("game: %s | learned: %s%s"):format(z.isOn()and"ON"or"off",
rb~=""and rb or"nothing yet",#z.rec.rules>0 and", choices"or"")a.arL.TextColor3=z.msg~=""and l.warn or l.dim end
b3 .SAB={S=c,CFG=e,EV=O,U=a,sg=jJ,CAT=T,LEARN=ab,buildList=d4,logAll=cG,evAll=cH,AR=z,CR=J,PF=o,PX=j,TM=q,CRATE=d,FU=y,HX=A,CF=H}
x(b2 .." loaded")if c.uiErrs>0 then x("UI: "..c.uiErrs.." properties skipped")end bw("farm")bv(a.root)bv(a.tgRoot)
if f6 then pcall(function()P(f6:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bv(a.root)
bv(a.tgRoot)end))end)end by()qZ()if c.config and c.config~=""then a.cfgName.Text=c.config end L(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
L(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")L(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
L(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")L(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
L(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")L(a.ghostT,e.Ghost,"GHOST: ON","GHOST: OFF")L(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
L(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")a.secB.Text=tostring(e.Every)
pcall(o.applyAll)pcall(q8)task.spawn(function()local rc=sU()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(rc and("\n(backup: "..rc..")")or"")
local rd=eH(ad.exec)if rd and not rd:find("SAB autoloader v2",1,true)then cT(ad.exec,ad.stub)x("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(eH(ad.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(s2)end)task.spawn(function()while c.alive do local yF,yG=pcall(q8)if not yF then x("UI ERR "..tostring(yG))end
task.wait((c.hidden or b1)and 1.5 or 0.25)end end)task.spawn(function()local yH,yI=pcall(ta)if not yH then x("HOOK ERR "..tostring(yI))end
end)task.spawn(function()pcall(rU)if d.loadSeq and not d.learned then local gw={}for re=1,20 do if d.loadSeq[re]then gw[#gw+1]=d.loadSeq[re]end end
if#gw>0 then d.learned={seq=gw,mode=d.loadMode}x("remembered how to open crates directly")end end if ha()then x(("catalog: %d butters in %d rarities"):format(T.n,#T.rarOrder))end
local yJ,rf=pcall(wB)if yJ and rf and c.alive and not c.manualPad then c.manualPad=rf end end)task.spawn(function()
while c.alive do local kv,kw=pcall(j.buyTick)if not kv then x("PET ERR "..tostring(kw))task.wait(5)end kv,kw=pcall(j.wishTick)
if not kv then x("WISH ERR "..tostring(kw))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local gx,rg=0,r()
P(game:GetService("RunService").Heartbeat:Connect(function()gx=gx+1 end))P(game:GetService("RunService").Heartbeat:Connect(function()if o.hold then pcall(o.pinTick)end end))
o.noteAt=r()while c.alive do task.wait(1)local rh=r()o.fps,gx,rg=gx/math.max(rh-rg,0.001),0,rh local yK,yL=pcall(o.tick)
if not yK then x("PERF ERR "..tostring(yL))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local yM,yN=pcall(y.tick)if not yM then x("FUSE ERR "..tostring(yN))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local yO,yP=pcall(q.tick)if not yO then x("TEAM ERR "..tostring(yP))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local ri=aq:WaitForChild("Remotes",30)local rj=ri and ri:WaitForChild("ClanEvent",30)
if rj and c.alive then P(rj.OnClientEvent:Connect(function(yQ,yR)if yQ=="call"then pcall(A.onCall,yR)end end))
end end)task.spawn(function()while c.alive do task.wait(20)pcall(en)end end)pcall(z.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local yT=(type(newcclosure)=="function")and newcclosure or function(yS)return yS end local kx
local rk=(type(setnamecallmethod)=="function")and setnamecallmethod or nil kx=hookmetamethod(game,"__namecall",yT(function(rl,...)
local ec=getnamecallmethod()if c.alive and(ec=="InvokeServer"or ec=="FireServer")then local rm,rn=pcall(function()return rl.Name end)
if rm and rn=="CrateAction"and not d.replaying then pcall(d.saw,ec,...)elseif rm and rn=="AutoRollAction"and not z.replaying then pcall(z.saw,ec,...)end
if rk then rk(ec)end end return kx(rl,...)end))d.oldNC=kx end)end if gz then P(F.Idled:Connect(function()pcall(function()gz:CaptureController()gz:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for A2=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and as()and(c.plot or ba())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then z.apply("joined")end while c.alive do task.wait(30)if c.alive and e.AutoRoll and c.running and not z.isOn()and not cY()and not V()
and not d.waiting and not d.on and not c.busy then z.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for A3=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or ba()if as()and c.plot and next(e.Targets)then dR(true,true)x("started by itself")
return end task.wait(1)end if c.alive and not c.running then x("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=ba()c.lastCollect=r()while c.alive do if c.running then local yU,ro=pcall(w6)if not yU and ro~=gA then x("LOOP ERR "..tostring(ro))end
end task.wait(0.1)end end)gy("loaded - window is at the top left")end local yW,ky=xpcall(rs,function(yV)return tostring(yV).."\n"..debug.traceback()end)
if not yW then pcall(function()warn("SAB "..b2 .." ERROR: "..tostring(ky))end)gy("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b2 .." ERROR: "..tostring(ky))end)pcall(function()local rp=(type(getgenv)=="function"and getgenv())or _G
if type(rp.SAB_KILL)=="function"then rp.SAB_KILL()end for A4,yX in ipairs({"SABFarmGui","SABToggle"})do local rq=F.PlayerGui:FindFirstChild(yX)
if rq then rq:Destroy()end end end)pcall(function()local ed=Instance.new("ScreenGui")ed.Name="SABError"ed.ResetOnSpawn=false
ed.DisplayOrder=1000 local aM=Instance.new("TextBox")aM.Size=UDim2 .new(0,340,0,170)aM.Position=UDim2 .new(0,10,0,50)
aM.BackgroundColor3=Color3 .fromRGB(90,20,20)aM.TextColor3=Color3 .new(1,1,1)aM.TextSize=11 aM.TextWrapped=true
aM.ClearTextOnFocus=false aM.TextXAlignment=Enum.TextXAlignment.Left aM.TextYAlignment=Enum.TextYAlignment.Top
aM.Text="SAB "..b2 .." failed to start. Send this text:\n"..tostring(ky)aM.Parent=ed ed.Parent=F:WaitForChild("PlayerGui")
end)end
