local b8="v25"local kS=game:GetService("Players")local J=kS.LocalPlayer or kS.PlayerAdded:Wait()local function gP(rT)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..b8,Text=rT,Duration=6})
end)end gP("script started")local function rU()local aq=game:GetService("ReplicatedStorage")local ax=game:GetService("Workspace")
local kT=game:GetService("UserInputService")local b9=(type(getgenv)=="function"and getgenv())or _G if type(b9 .SAB_KILL)=="function"then pcall(b9 .SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local gQ=(function()local rV,rW=pcall(function()return game:GetService("VirtualUser")end)return rV and rW or nil end)()
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
local j,q,o,z,C,K,D={},{},{},{},{},{},{}local gR={}local gS,eq,cQ,cR={},{},{},{}local function T(kU)gS[#gS+1]=kU return kU end
local function ad(rX)task.wait(rX)if not c.alive then error(gR,0)end end local function y(er)er=os.date("%H:%M:%S").." "..tostring(er)
table.insert(eq,1,er)if#eq>6 then table.remove(eq)end cQ[#cQ+1]=er if#cQ>80 then table.remove(cQ,1)end end local function es(kV)
if type(kV)~="string"then return""end return(kV:lower():gsub("[^%w]",""))end local function ab(rY)local kW=es(rY)
local gT=kW:gsub("butter$","")if gT==""then gT=kW end return gT end local function aQ(gU)return type(gU)=="string"and ab(gU)~=""and d.Targets[ab(gU)]==true end
local function rZ(cS)cS=cS:lower()return cS:find("squishy",1,true)~=nil or cS:match("butter$")~=nil or cS:match("butter[^%a]")~=nil
end local gV={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aD(cT)if type(cT)~="number"then return"?"end
local et=1 while math.abs(cT)>=1000 and et<#gV do cT=cT/1000 et=et+1 end local r0=string.format("%.2f",cT):gsub("%.?0+$","")
return r0 ..gV[et]end local function r1(kX)if type(kX)~="string"then return nil end local r2,kY=kX:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local gW=tonumber(r2)if not gW then return nil end if kY==""then return gW end for r3,r4 in ipairs(gV)do if r4:lower()==kY:lower()then return gW*1000^(r3-1)end end
return nil end local function aY()local kZ=J:GetAttribute("BoardValueMoney")if type(kZ)=="number"then return kZ end
local k0=J:FindFirstChild("leaderstats")if k0 then for zw,r5 in ipairs({"Cash","Money","Coins"})do local gX=k0:FindFirstChild(r5)
if gX and type(gX.Value)=="number"then return gX.Value end end end end local function eu(r6)local gY=r6:GetFullName()
if c.plot then local gZ=c.plot:GetFullName()if gY:sub(1,#gZ)==gZ then return gY:sub(#gZ+2)end end return gY end
local function ar()local ev=J.Character if ev and ev:FindFirstChild("HumanoidRootPart")then local k1=ev:FindFirstChildOfClass("Humanoid")
if k1 and k1 .Health>0 then return ev end end end local function bf()local g0=ax:FindFirstChild("Plots")if not g0 then return nil end
local function k2(r7)local k3=r7:FindFirstChild("Plate")return k3~=nil and k3:FindFirstChild("EditStackAttachment",true)~=nil
end local k4=J:GetAttribute("PlotNumber")if k4~=nil then local g1=g0:FindFirstChild(tostring(k4))if g1 and k2(g1)then return g1 end
end for zx,k5 in ipairs(g0:GetChildren())do if k2(k5)then return k5 end end end local function cU(k6)local bh=k6 and k6 .Parent
for zy=1,6 do if not bh then return nil end if bh:IsA("BasePart")then return bh end if bh:IsA("Model")then return bh.PrimaryPart or bh:FindFirstChildWhichIsA("BasePart",true)end
bh=bh.Parent end end local function k7(k8)local g2=k8 .Parent if g2 and g2:IsA("Attachment")then return g2 .WorldPosition end
local k9=cU(k8)return k9 and k9 .Position end local function k_()local b_=c.plot and c.plot:FindFirstChild("Plate")
if not b_ then return nil end if b_:IsA("BasePart")then return b_.Position end if b_:IsA("Model")then return b_:GetPivot().Position end
local la=b_:FindFirstChildWhichIsA("BasePart",true)return la and la.Position end local function lb()local g3={}
local lc=c.plot and c.plot:FindFirstChild("WaxStations")if lc then for zz,r8 in ipairs(lc:GetChildren())do local ld=r8:FindFirstChild("SquishyPlaceHolder")
local g4=ld and ld:FindFirstChild("PlacePrompt")if g4 and g4:IsA("ProximityPrompt")then g3[#g3+1]=g4 end end end
return g3 end local function ew()local le,g5=lb(),0 for zA,r9 in ipairs(le)do if r9 .Enabled then g5=g5+1 end end
local g6=#le local g7=J:GetAttribute("WaxStations")if type(g7)=="number"and g7>g6 then g6=g7 end return g5,g6
end local function r_()local lf=ar()local lg=lf and lf.HumanoidRootPart.Position local g8,lh for zB,g9 in ipairs(lb())do
if g9 .Enabled then local li=k7(g9)local lj=(li and lg)and(li-lg).Magnitude or 1e9 if not g8 or lj<lh then g8,lh=g9,lj end
end end return g8 end local function lk()local ex=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not ex then return nil end local ll=ex:FindFirstChild("BuyPromptAttachment")local ey=(ll and ll:FindFirstChild("BuyPrompt"))or ex:FindFirstChild("BuyPrompt",true)
if ey and ey:IsA("ProximityPrompt")and ey:IsDescendantOf(ex)then return ey end end local lm={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local sa={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ae={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local W={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local g_="SAB_order.txt"local function ez()if not ae.dirty or type(writefile)~="function"then return end local ay={}
for sb,sc in pairs(ae.price)do ay[#ay+1]="P|"..sb.."|"..string.format("%.0f",sc)end for sd,se in pairs(ae.order)do ay[#ay+1]="O|"..sd.."|"..table.concat(se,",")end
if e.learned and e.enc then ay[#ay+1]="M|mode|"..tostring(e.learned.mode or"")for sf,eA in ipairs(e.learned.seq)do
local ln={}for lo=1,eA.n do ln[lo]=e.enc(eA.args[lo])end ay[#ay+1]=("A|%d|%s|%d|%s"):format(sf,eA.m,eA.n,table.concat(ln,";"))
end end local function ha(sh,si,eB)local lp={}for lq=1,eB.n do lp[lq]=e.enc(eB.args[lq])end ay[#ay+1]=("R|%d|%s|%s|%d|%s"):format(si,sh,eB.m,eB.n,table.concat(lp,";"))
end if e.enc then for sj,sk in ipairs(A.rec.rules)do ha("rules",sj,sk)end if A.rec.on then ha("on",0,A.rec.on)end
if A.rec.off then ha("off",0,A.rec.off)end end for zC,cV in pairs(L.seen)do ay[#ay+1]=("K|%s|%s|%s|%s"):format(cV.name,cV.title or"",cV.rar or"",cV.price and string.format("%.0f",cV.price)or"")
end if pcall(writefile,g_,table.concat(ay,"\n"))then ae.dirty=false end end local function sl()if type(isfile)~="function"or type(readfile)~="function"then return end
local sm,sn=pcall(isfile,g_)if not(sm and sn)then return end local so,lr=pcall(readfile,g_)if not(so and type(lr)=="string")then return end
for sp in lr:gmatch("[^\n]+")do local ca,cb,aZ=sp:match("^(%a)|([^|]+)|(.*)$")if ca=="P"then ae.price[cb]=tonumber(aZ)
elseif ca=="M"then e.loadMode=(aZ~=""and aZ~="nil")and aZ or nil elseif ca=="A"and e.dec then local ls=tonumber(cb)
local lt,eC,sq=aZ:match("^([^|]+)|(%d+)|(.*)$")if ls and lt then eC=tonumber(eC)local lu,eD={},0 for sr in(sq..";"):gmatch("([^;]*);")do
eD=eD+1 if eD<=eC then lu[eD]=e.dec(sr)end end e.loadSeq=e.loadSeq or{}e.loadSeq[ls]={m=lt,n=eC,args=lu}end elseif ca=="R"and e.dec then
local lv=tonumber(cb)local eE,ss,eF,su=aZ:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if lv and eE then eF=tonumber(eF)
local lw,eG={},0 for sv in(su..";"):gmatch("([^;]*);")do eG=eG+1 if eG<=eF then lw[eG]=e.dec(sv)end end local hb={m=ss,n=eF,args=lw}
if eE=="rules"then A.rec.rules[lv]=hb elseif eE=="on"then A.rec.on=hb elseif eE=="off"then A.rec.off=hb end end
elseif ca=="K"then local lx,ly,sw=aZ:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cb)]={name=cb,title=lx~=""and lx or nil,
rar=ly~=""and ly or nil,price=tonumber(sw)}elseif ca=="O"and aZ~=""then local eH={}for sx in aZ:gmatch("[^,]+")do eH[#eH+1]=sx end
if#eH>0 then ae.order[cb]=eH end end end end local function sy(eI)if type(eI)~="table"then return end local bG,lz=eI.rarity,eI.contents
if type(bG)~="string"or bG==""or type(lz)~="table"then return end local cW={}for zD,eJ in ipairs(lz)do if type(eJ)=="table"and type(eJ.butter)=="string"then
cW[#cW+1]={n=eJ.butter,ch=tonumber(eJ.chance)or 0}end end if#cW==0 then return end table.sort(cW,function(sz,sA)return sz.ch>sA.ch end)
local cX,cY={},false for sB,sC in ipairs(cW)do cX[sB]=sC.n end local hc=ae.order[bG]if not hc or#hc~=#cX then cY=true end
if not cY then for lA=1,#cX do if hc[lA]~=cX[lA]then cY=true break end end end ae.order[bG]=cX local hd=tonumber(eI.price)
if hd and ae.price[bG]~=hd then ae.price[bG]=hd cY=true end if cY then ae.dirty=true W.at=0 y("learned the "..bG.." order from its crate")
end end local function cc(sD,sE)local sF=sD:FindFirstChild(sE,true)local sG,he=pcall(function()return sF.Text end)
return(sG and type(he)=="string"and he~="")and he or nil end local function ah(lB)return W.pretty[lB]or lB end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(sH)return es(sH or"")end
function L.learn(a0)if type(a0)~="table"or type(a0 .name)~="string"then return end local hf=L.key(a0 .name)local a1=L.seen[hf]or{}
local sI=(L.seen[hf]==nil)or(tonumber(a0 .price)and a1 .price~=tonumber(a0 .price))a1 .name,a1 .title=a0 .name,a0 .title or a1 .title
a1 .rar,a1 .price=a0 .rarity or a1 .rar,tonumber(a0 .price)or a1 .price L.seen[hf]=a1 if sI then L.at,ae.dirty=x(),true end
end function L.wanted(lC)return lC~=nil and d.CrateTicks[L.key(lC)]==true end function L.list()local cd={}for sJ,eK in ipairs(L.base)do cd[L.key(eK[1])]={name=eK[1],title=eK[2],rar=eK[3],i=sJ}end
for zE,cZ in ipairs(W.rarOrder)do local lD=false for zF,sK in pairs(cd)do if sK.rar==cZ then lD=true break end end
if not lD and cZ~="?"then local lE=cZ:gsub("[^%w]","").."Crate"cd[L.key(lE)]={name=lE,title=cZ.." Crate",rar=cZ,i=50,guess=true}
end end for lF,eL in pairs(L.seen)do local aR=cd[lF]or{i=100}aR.name,aR.title,aR.rar=eL.name or aR.name,eL.title or aR.title,eL.rar or aR.rar
aR.price,aR.guess=eL.price or aR.price,nil cd[lF]=aR end local c0,eM={},{}for sL,sM in ipairs(lm)do c0[sM]=sL end
for sN,lG in ipairs(W.rarOrder)do c0[lG]=c0[lG]or(20+sN)end for sO,c1 in pairs(cd)do c1 .k=sO c1 .price=c1 .price or ae.price[c1 .rar or""]
eM[#eM+1]=c1 end table.sort(eM,function(bH,bI)if bH.price and bI.price and bH.price~=bI.price then return bH.price<bI.price end
local lH,lI=c0[bH.rar or""]or 99,c0[bI.rar or""]or 99 if lH~=lI then return lH<lI end if(bH.i or 100)~=(bI.i or 100)then return(bH.i or 100)<(bI.i or 100)end
return bH.k<bI.k end)return eM end local function sP()local lJ=aq:FindFirstChild("Assets")local lK=lJ and lJ:FindFirstChild("Squishies")
if not lK then return false end local hg,lL,ce={},{},{}local eN=0 for zG,eO in ipairs(lK:GetChildren())do local c2=ab(eO.Name)
if c2~=""and not hg[c2]then local eP=cc(eO,"RarityText")or"?"hg[c2]=eP lL[c2]=cc(eO,"NameText")or eO.Name ce[eP]=ce[eP]or{}
table.insert(ce[eP],c2)eN=eN+1 end end if eN==0 then return false end for lM,sQ in pairs(ce)do local lN=ae.order[lM]or sa[lM]
local hh={}if lN then for sR,sS in ipairs(lN)do hh[ab(sS)]=sR end end table.sort(sQ,function(lO,lP)local hi,hj=hh[lO],hh[lP]
if hi and hj then return hi<hj end if hi then return true end if hj then return false end return ah(lO)<ah(lP)
end)end local hk={}for sT,sU in ipairs(lm)do hk[sU]=sT end local eQ={}for sV in pairs(ce)do eQ[#eQ+1]=sV end table.sort(eQ,function(hl,hm)
local hn,ho=ae.price[hl],ae.price[hm]if hn and ho and hn~=ho then return hn<ho end local hp,hq=hk[hl],hk[hm]if hp and hq then return hp<hq end
if hp then return true end if hq then return false end return hl<hm end)W.rar,W.pretty,W.members,W.rarOrder,W.n,W.at=hg,lL,ce,eQ,eN,x()
return true end local function hr()if W.at==0 or(x()-W.at)>120 then pcall(sP)end return W.n>0 end local function sW(sX)
local lQ=ab(sX)return W.rar[lQ]or(Q.name and ab(Q.name)==lQ and Q.rar)or"?"end local function sY()local eR={}
for sZ,s0 in pairs(d.Targets)do if s0 then eR[#eR+1]=ah(sZ)end end table.sort(eR)return eR end local af={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function lR()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function eS(lS)if type(makefolder)~="function"then return end local s1,s2=pcall(isfolder,lS)if not(s1 and s2)then pcall(makefolder,lS)end
end local function eT(lT)if type(isfile)~="function"or type(readfile)~="function"then return nil end local s3,s4=pcall(isfile,lT)
if not(s3 and s4)then return nil end local s5,s6=pcall(readfile,lT)return s5 and s6 or nil end local function c3(s7,s8)
if type(writefile)~="function"then return false end return(pcall(writefile,s7,s8))end local function lU(s9)local c4={}
if type(listfiles)~="function"then return c4 end local s_,lV=pcall(listfiles,s9)if not s_ or type(lV)~="table"then return c4 end
for zH,ta in ipairs(lV)do c4[#c4+1]=tostring(ta)end return c4 end local function lW()local eU={}for zI,tb in ipairs(lU(af.cfg))do
local lX=tb:match("([^/\\]+)%.txt$")if lX then eU[#eU+1]=lX end end table.sort(eU)return eU end local function tc()
local V={"V|1"}V[#V+1]="N|Every|"..tostring(d.Every)V[#V+1]="N|GlazeLead|"..tostring(d.GlazeLead)V[#V+1]="N|FpsCap|"..tostring(d.FpsCap)
V[#V+1]="N|MemLimit|"..tostring(d.MemLimit)for zJ,lY in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do V[#V+1]="S|"..lY.."|"..d[lY]end
do local eV={}for td,c5 in pairs(d.Pets)do local lZ=(c5 .b and"b"or"")..(c5 .g and"g"or"")..(c5 .w and"w"or"")..((tonumber(c5 .f)or 0)>0 and tostring(c5 .f)or"")
if lZ~=""then eV[#eV+1]=td.."|"..lZ end end table.sort(eV)V[#V+1]="P|-"for zK,te in ipairs(eV)do V[#V+1]="P|"..te end
end for zL,l0 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","Quests"})do
V[#V+1]="B|"..l0 .."|"..(d[l0]and"1"or"0")end local hs=J:GetAttribute("AutoRollRules")if type(hs)=="string"and hs~=""then d.ARrules,d.ARstop=hs,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then V[#V+1]="S|rules|"..d.ARrules V[#V+1]="S|stop|"..d.ARstop end if c.winPos then V[#V+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then V[#V+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for zM,ht in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local eW={}for tf,tg in pairs(ht[2])do if tg then eW[#eW+1]=tf end end table.sort(eW)V[#V+1]=ht[1].."|-"for zN,th in ipairs(eW)do V[#V+1]=ht[1].."|"..th end
end return table.concat(V,"\n")end local function ti(hu)if type(hu)~="string"or hu==""then return false end local l1,l2,l3,l4,c6={},false,{},false,nil
for tj in hu:gmatch("[^\n]+")do local aE,ac,av=tj:match("^(%a)|([^|]*)|?(.*)$")if aE=="N"and ac=="Every"then local hv=tonumber(av)
if hv and hv>=1 then d.Every=math.floor(hv)end elseif aE=="N"and(ac=="FpsCap"or ac=="MemLimit")then local hw=tonumber(av)
if hw and hw>=0 then d[ac]=math.floor(hw)end elseif aE=="N"and ac=="GlazeLead"then local eX=tonumber(av)if eX and eX>=5 and eX<=600 then d.GlazeLead=math.floor(eX)end
elseif aE=="S"and(ac=="TeamNormal"or ac=="TeamFull"or ac=="TeamGlaze"or ac=="TeamWax")then d[ac]=av elseif aE=="P"and ac~=""then
if not c6 then c6={}end if ac~="-"and av~=""then c6[ac]={b=av:find("b",1,true)and true or nil,g=av:find("g",1,true)and true or nil,
w=av:find("w",1,true)and true or nil,f=tonumber(av:match("%d"))}end elseif aE=="B"then if d[ac]~=nil then d[ac]=(av=="1")end
elseif aE=="S"and ac=="rules"then d.ARrules=av elseif aE=="S"and ac=="stop"then d.ARstop=av elseif aE=="W"then
c.winPos={tonumber(ac)or 10,tonumber(av)or 44}elseif aE=="G"then c.togPos={tonumber(ac)or 10,tonumber(av)or 300}
elseif aE=="T"and ac~=""then if ac~="-"then l1[ac]=true end l2=true elseif aE=="K"and ac~=""then if ac~="-"then l3[ac]=true end
l4=true end end if l2 then d.Targets=l1 end if l4 then d.CrateTicks=l3 end if c6 then d.Pets=c6 end return true
end local function eY(cf)if not lR()then return false,"this executor cannot write files"end cf=(cf or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cf==""then return false,"give the config a name"end eS(af.dir)eS(af.cfg)if not c3(af.cfg.."/"..cf..".txt",tc())then return false,"could not write the file"end
c.config=cf return true,cf end local function l5(eZ)local l6=eT(af.cfg.."/"..eZ..".txt")if not l6 then return false,"no config called "..tostring(eZ)end
if not ti(l6)then return false,"that config looks empty"end c.config=eZ return true,eZ end local function l7(hx)
if hx then eS(af.dir)c3(af.auto,hx)elseif type(delfile)=="function"then pcall(delfile,af.auto)else c3(af.auto,"")
end c.autoload=hx end local function tk()if c.selfPath then return c.selfPath end local e0 for zO,tl in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",af.dir})do
for zP,l8 in ipairs(lU(tl))do local hy=l8:lower()if hy:sub(-4)==".lua"and(hy:find("sab_farm",1,true)or hy:find("sab farm",1,true))then
e0=e0 or l8 end end end c.selfPath=e0 return e0 end af.stub=[[
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
local function tm()if not lR()then return false,"this executor cannot write files"end eS("autoexec")if not c3(af.exec,af.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local e1=(function()local tn,to=pcall(function()return game:GetService("TeleportService")end)return tn and to or nil end)()
local function hz()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local tp=queueonteleport or queue_on_teleport return(pcall(tp,af.stub))end local function c7(tq)if c.rejoining then return end
c.rejoining=true y("REJOIN ("..tq..")")pcall(ez)if c.autoload then pcall(eY,c.autoload)end local tr=hz()y(tr and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for zQ=1,30 do if not e1 then break end pcall(function()e1:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function ts()local tt,l9=pcall(function()return game:GetService("GuiService")end)if tt and l9 then
pcall(function()T(l9 .ErrorMessageChanged:Connect(function()if d.Rejoin then c7("roblox error message")end end))
end)end pcall(function()local l_=game:GetService("CoreGui")local ma=l_ and l_:WaitForChild("RobloxPromptGui",15)
local mb=ma and ma:WaitForChild("promptOverlay",15)if mb then T(mb.ChildAdded:Connect(function(tu)if d.Rejoin and tostring(tu.Name):lower():find("errorprompt",1,true)then c7("disconnect prompt")end
end))end end)pcall(function()T(J.OnTeleport:Connect(function(tv)if tostring(tv):find("Started")then hz()end end))
end)if e1 then pcall(function()T(e1 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()c7("teleport retry")end)end
end))end)end end local function mc(tw)local md=c.plot and c.plot:FindFirstChild(tw)if not md then return nil,false end
for zR,hA in ipairs(md:GetChildren())do if hA:IsA("Model")or hA:IsA("BasePart")then return hA,true end end return nil,true
end local function bJ()local bi=mc("RolledSquishy")if not bi then return nil end return{model=bi,name=bi.Name,pretty=cc(bi,"NameText")or ah(ab(bi.Name)),
rar=cc(bi,"RarityText")or sW(bi.Name),price=cc(bi,"PriceText")}end local function me(hB)return type(hB)=="string"and(W.rar[ab(hB)]~=nil or rZ(hB))
end local function aa()local hC=mc("SquishyEquipped")if hC then c.carrySrc,e.heldAt="model",x()return hC.Name,hC end
local mf=J.Character if mf then for zS,c8 in ipairs(mf:GetDescendants())do if(c8:IsA("Model")or c8:IsA("Tool"))and me(c8 .Name)then
c.carrySrc,e.heldAt="character",x()return c8 .Name,c8 end end end local e2=J:GetAttribute("SquishyEquipped")if type(e2)=="string"and e2~=""and me(e2)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return e2,nil end c.carrySrc=nil end local function zT()local zU,tx=aa()return tx end local function mg()
local mh=bJ()local hD=mh and r1(mh.price)local hE=aY()if hD and hE and hE<hD*0.5 then return hE,hD end end local function cg(ty)
cR[#cR+1]=os.date("%H:%M:%S").." "..ty if#cR>40 then table.remove(cR,1)end end local function tz(bK,e3)if type(bK)~="string"then return end
cg(("Roll(%s,%s)"):format(bK,tostring(e3)))if bK:lower():find("crate",1,true)then e.rolled,e.rolledAt=bK,x()return
end Q.seq=Q.seq+1 Q.name,Q.at=bK,x()Q.rar=type(e3)=="string"and e3 or nil c.rolls=c.rolls+1 if aQ(bK)then y(("ROLL %s [%s] = TARGET"):format(bK,tostring(e3)))end
end local function tA(bL)if type(bL)~="table"then return end local e4=bL.butter or bL.itemName if type(e4)~="string"then return end
c.gifts=c.gifts+1 Q.gift,Q.giftAt=e4,x()if type(bL.giftId)=="string"then local mi=aq:FindFirstChild("Remotes")
local mj=mi and mi:FindFirstChild("GiftThanks")if mj then pcall(function()mj:FireServer(bL.giftId)end)end end
cg("Gift("..e4 .." from "..tostring(bL.fromName)..")")y(("GIFT from %s: %s - it will not be waxed"):format(tostring(bL.fromName),e4))
end local function tB()local mk=aq:WaitForChild("Remotes",30)if not c.alive then return end if not mk then y("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local ml=J:GetAttribute("SquishyEquipped")
if type(ml)=="string"and ml~=""then e.heldAt=x()end end))local tH={SquishyRollAnimation=tz,InitSquishy=function(mm)Q.init,Q.initAt=tostring(mm),x()cg("Init("..tostring(mm)..")")end,
CrateUpdate=function(ci,mn)pcall(sy,ci)pcall(L.learn,ci)if type(ci)=="table"then local tC=mn==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not tC then return end local tD=not e.waiting local tE=e.on e.waiting,e.data,e.at=true,ci,x()e.on=(mn==true)
e.title=tostring(ci.title or ci.name or"crate")if e.on and not tE then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then cg("CrateWindow open("..e.title..")")elseif tD then cg("Crate waiting("..e.title..")")y(e.title.." is waiting on your stand")
end else if e.waiting then cg("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local tF=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,tF)end if e.classify then local tG=x()
task.spawn(function()pcall(e.classify,tG)end)end end end,GiftReceived=tA,}for e5,tI in pairs(tH)do local hF=mk:FindFirstChild(e5)
if hF and hF:IsA("RemoteEvent")then T(hF.OnClientEvent:Connect(tI))elseif e5~="CrateUpdate"and e5~="GiftReceived"then y("remote "..e5 .." missing")end
end end local function hG()local bM=bJ()if bM then if aQ(bM.name)then return{state="match",shown=bM.pretty,src="pad",info=bM}
end return{state="skip",info=bM,level="idle",text=("on pad: %s [%s] - not ticked"):format(bM.pretty,tostring(bM.rar))}
end if Q.name and(x()-Q.at)<4 then if aQ(Q.name)then return{state="match",shown=ah(ab(Q.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ah(ab(Q.name)),tostring(Q.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function e6(tJ,tK,tL,tM)
local e7=RaycastParams.new()e7 .FilterType=Enum.RaycastFilterType.Exclude local hH={J.Character}for zV,tN in ipairs(tM or{})do hH[#hH+1]=tN end
e7 .FilterDescendantsInstances=hH pcall(function()e7 .RespectCanCollide=true end)local mo=ax:Raycast(Vector3 .new(tJ,tK+4,tL),Vector3 .new(0,-30,0),e7)
return mo and mo.Position or nil end local function c9(mp)local mq=mp:FindFirstChildOfClass("Humanoid")return((mq and mq.HipHeight)or 2)+mp.HumanoidRootPart.Size.Y/2+0.2
end local function hI(tO,tP)local hJ=tO:FindFirstChildOfClass("Humanoid")local tQ=x()while x()-tQ<tP do if hJ and(hJ.FloorMaterial~=Enum.Material.Air or hJ.SeatPart)then return true end
ad(0.05)end return false end local function aF(tR,hK,hL)local mr=tR.HumanoidRootPart mr.AssemblyLinearVelocity=Vector3 .new(0,0,0)
mr.CFrame=hL and CFrame.new(hK,Vector3 .new(hL.X,hK.Y,hL.Z))or CFrame.new(hK)end local function cj(a2,ms)local bN=ar()
if not bN or not a2 then return false end local bj=a2 .Position local e8=math.clamp(math.max(a2 .Size.X,a2 .Size.Z)/2+2.2,3,7)
local mt=(ms and ms.MaxActivationDistance)or 10 if e8>mt-2 then e8=math.max(2.5,mt-2)end local c_={}local function bO(da)
da=Vector3 .new(da.X,0,da.Z)if da.Magnitude>0.05 then c_[#c_+1]=da.Unit end end local mu=k_()if mu then bO(mu-bj)end
bO(a2 .CFrame.LookVector)bO(-a2 .CFrame.LookVector)bO(a2 .CFrame.RightVector)bO(-a2 .CFrame.RightVector)bO(bN.HumanoidRootPart.Position-bj)
if#c_==0 then bO(Vector3 .new(0,0,1))end local tS,e9=c9(bN),false for zW,tT in ipairs(c_)do local e_=bj+tT*e8
local hM=e6(e_.X,bj.Y,e_.Z,{a2})if hM and math.abs(hM.Y-bj.Y)<14 then aF(bN,Vector3 .new(e_.X,hM.Y+tS,e_.Z),bj)
if hI(bN,0.7)then e9=true break end end end if not e9 then aF(bN,bj+c_[1]*e8+Vector3 .new(0,3,0),bj)e9=hI(bN,1)
end ad(0.12)return e9 end local function mv(db)if not db.Parent or not db.Enabled then return false end pcall(function()db:InputHoldBegin()end)
ad(math.max(db.HoldDuration,0)+0.08)pcall(function()db:InputHoldEnd()end)return true end local function ak(mw,tU)
local tV=x()while x()-tV<tU do if mw()then return true end ad(0.05)end return mw()end local function dc(ck,tW,mx,tX)
local tY=c.zapFirst and{"zap","hold"}or{"hold","zap"}for tZ,hN in ipairs(tY)do if tZ==2 and(tX or not(ck.Parent and ck.Enabled and(not mx or mx())))then break end
local hO if hN=="hold"then hO=mv(ck)else hO=type(fireproximityprompt)=="function"and ck.Parent~=nil and ck.Enabled and pcall(fireproximityprompt,ck)end
if hO and ak(tW,1.2)then c.zapFirst=(hN=="zap")return true,hN end end return false end local function my(hP)local bk=lk()
if not bk or not bk.Enabled then y("buy: nothing on the pad")return false end local mz=cU(bk)if not mz then y("buy: pad part missing")return false end
c.lastBuyAt=x()local t0,mA=Q.seq,aY()cj(mz,bk)if not bk.Enabled then y("buy aborted: pad emptied")return false end
local cl=hG()if not hP and cl.state~="match"then y("buy aborted: "..(cl.text or"pad changed"))c.matchSince=nil
return false end local hQ=cl.info and cl.info.name or(cl.state=="match"and Q.name)or nil local function t1()return bk.Enabled and aa()==nil and(hP or hG().state=="match")
end local t2,t3=dc(bk,function()return aa()~=nil or((not bk.Enabled)and(hP or Q.seq==t0))end,t1,mg()~=nil)if t2 then
ak(function()return aa()~=nil end,0.8)local dd=aa()local mB=aY()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil Q.name,Q.rar,Q.at=nil,nil,x()y(("BOUGHT %s%s via %s"):format(dd and ah(ab(dd))or(cl.shown or"?"),(mA and mB)and(" for $"..aD(mA-mB))or"",t3))
if dd and hQ and ab(dd)~=ab(hQ)then y(("note: picked up %s, not %s"):format(dd,hQ))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local mC=bJ()y(("BUY REFUSED: cash short? have $%s, price %s"):format(aD(aY()),(mC and mC.price)or"?"))
return false end local function mD()local fa=aa()if not fa then c.holding=false y("place: hands are empty")return false
end if not aQ(fa)then y(("REFUSED TO WAX %s - it is not ticked"):format(ah(ab(fa))))return false end for zX=1,d.PlaceTries do
local bl=r_()if not bl then y("place: no free station")break end local mE=cU(bl)if mE then cj(mE,bl)local mF=aa()
if not mF then c.holding=false y("place: hands emptied on the way")return false end if not aQ(mF)then y("place: what I carry changed, not waxing it")return false end
if bl.Enabled then local t4,t5=dc(bl,function()return not bl.Enabled end,function()return bl.Enabled end)if t4 then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 Q.name,Q.rar,Q.at=nil,nil,x()
y(("WAXED %s #%d at %s via %s"):format(ah(ab(fa)),c.placed,bl.Parent.Parent.Name,t5))return true end end end ad(0.25)
end c.placeFails=c.placeFails+1 if aa()==nil then c.holding=false end y("PLACE FAILED ("..c.placeFails..")")if c.placeFails>=2 then
c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(aa()))y(c.capMsg)end return false end function q.place()local t6=x()while c.alive and q.editing and x()-t6<25 do ad(0.2)end
if d.Teams and d.TeamWax~=""then q.placing=true local t7=x()while c.alive and q.current()~=d.TeamWax and x()-t7<5 do ad(0.1)end
if q.current()==d.TeamWax then ad(0.3)else y("wax team did not come on in time - placing anyway")end end local t8,mG=pcall(mD)
q.placing=false if not t8 then error(mG,0)end return mG end local function mH(mI)return type(mI)=="string"and mI:lower():find("crate",1,true)~=nil
end local t9={SABFarmGui=1,SABToggle=1,SABError=1}local function hR(t_)local bm=t_ while bm do if t9[bm.Name]then return false end
if bm:IsA("ScreenGui")then local ua,ub=pcall(function()return bm.Enabled end)return(not ua)or ub~=false end if bm:IsA("GuiObject")and not bm.Visible then return false end
bm=bm.Parent end return false end local function fb(fc)local cm=""pcall(function()if fc:IsA("TextButton")then cm=fc.Text end end)
if not cm:find("%a")then for zY,fd in ipairs(fc:GetDescendants())do if(fd:IsA("TextLabel")or fd:IsA("TextButton"))and fd.Text:find("%a")then cm=fd.Text break end
end end if not cm:find("%a")then cm=fc.Name end return(cm:lower():gsub("[^%a]",""))end local function uc()local de,df
local mJ=J:FindFirstChildOfClass("PlayerGui")if not mJ then return nil,nil end for zZ,dg in ipairs(mJ:GetDescendants())do
if dg:IsA("GuiButton")and hR(dg)then local hS=fb(dg)if hS:sub(1,4)=="open"and not hS:find("shop",1,true)then de=de or dg end
if hS:sub(1,7)=="discard"then df=df or dg end end end if de and df then return de,df end if e.on then return de,df end
return nil,nil end local hT=(function()local ud,ue=pcall(function()return game:GetService("VirtualInputManager")end)return ud and ue or nil end)()
local function mK(a3,hU)local hV={}local function mL(uf)hV[#hV+1]=uf end if c.tapWay then mL(c.tapWay)end for z0,mM in ipairs({"touch","conn","signal"})do
if mM~=c.tapWay then mL(mM)end end local function mN(ug,...)local uh,hW=pcall(getconnections,ug)if not(uh and type(hW)=="table"and#hW>0)then return false end
local mO,ui,uj=false,{...},select("#",...)for z1,uk in ipairs(hW)do if pcall(function()uk:Fire(table.unpack(ui,1,uj))end)then mO=true end
end return mO end local function mP()local mQ=Vector3 .new(0,0,0)pcall(function()local mR,mS=a3 .AbsolutePosition,a3 .AbsoluteSize
mQ=Vector3 .new(mR.X+mS.X/2,mR.Y+mS.Y/2,0)end)local hX={Position=mQ,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()hX.UserInputType=Enum.UserInputType.Touch end)pcall(function()hX.UserInputState=Enum.UserInputState.End end)
return hX end for z2,a4 in ipairs(hV)do local dh=false if a4=="conn"and type(getconnections)=="function"then if mN(a3 .MouseButton1Click)then
dh=true if ak(hU,1.5)then c.tapWay=a4 return true,a4 end end dh=mN(a3 .Activated,mP(),1)elseif a4=="signal"and type(firesignal)=="function"then
if pcall(firesignal,a3 .MouseButton1Click)then if ak(hU,1.5)then c.tapWay=a4 return true,a4 end end dh=pcall(firesignal,a3 .Activated,mP(),1)
elseif a4=="touch"and hT then dh=pcall(function()local mT,mU=a3 .AbsolutePosition,a3 .AbsoluteSize local mV=0
local mW=a3:FindFirstAncestorWhichIsA("ScreenGui")local ul,um=pcall(function()return mW and mW.IgnoreGuiInset end)
if not(ul and um)then pcall(function()mV=game:GetService("GuiService"):GetGuiInset().Y end)end local mX,mY=mT.X+mU.X/2,mT.Y+mU.Y/2+mV
hT:SendMouseButtonEvent(mX,mY,0,true,game,1)task.wait(0.06)hT:SendMouseButtonEvent(mX,mY,0,false,game,1)end)end
if dh and ak(hU,1.5)then c.tapWay=a4 return true,a4 end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function hY(mZ)local di=mZ.Parent while di and di~=c.plot do if e.NOT[di.Name]then return false end di=di.Parent
end local hZ=(mZ.ActionText or""):lower()if hZ:find("roll",1,true)or hZ:find("place",1,true)or hZ:find("sell",1,true)then return false end
return true end local function uo()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local m0=c.plot:FindFirstChild("CrateStand")local dj if m0 then for z3,fe in ipairs(m0:GetDescendants())do
if fe:IsA("ProximityPrompt")and fe.Enabled and hY(fe)then dj=fe break end end end if not dj then for z4,bn in ipairs(c.plot:GetDescendants())do
if bn:IsA("ProximityPrompt")and bn.Enabled and hY(bn)then local m1=bn:FindFirstAncestorWhichIsA("Model")local up=((bn.ActionText or"").." "..(bn.ObjectText or"").." "..bn.Name.." "..(m1 and m1 .Name or"")):lower()
if up:find("crate",1,true)then dj=bn break end end end end e.prompt=dj return dj end local function h0()if e.on then return true end
local dk=uo()if not dk then e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local m2=cU(dk)if m2 then cj(m2,dk)end e.ours=true dc(dk,function()return e.on end)if ak(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: pressed "..eu(dk).." but no window came up")
return false end do local function uq(m3)local cn=m3 .Parent while cn and cn:IsA("GuiObject")do local m4,m5=false,false
for z5,dl in ipairs(cn:GetDescendants())do if dl~=m3 and dl:IsA("GuiButton")and fb(dl):sub(1,7)=="discard"then m4=true end
if dl:IsA("TextLabel")then local h1=dl.Text:lower()if h1:find("crate",1,true)or h1:find("can contain",1,true)or h1:find("cost",1,true)then m5=true end
end if m4 and m5 then return cn end end cn=cn.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local m6=J:FindFirstChildOfClass("PlayerGui")if not m6 then return nil end for z6,ff in ipairs(m6:GetDescendants())do
if ff:IsA("GuiButton")and not ff:FindFirstAncestor("SABFarmGui")and fb(ff):sub(1,4)=="open"then local h2=uq(ff)
if h2 then e.win=h2 return h2 end end end end local function ur(us)for z7,fg in ipairs(us:GetDescendants())do
if fg:IsA("GuiButton")then local m7,h3=fb(fg),fg.Name:lower()if m7=="x"or m7=="close"or h3=="x"or h3:find("close",1,true)or h3:find("exit",1,true)then return fg end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(ut)task.wait(ut and 4 or 1.2)if e.on or e.waiting then return end
local fh=e.findWin()if not fh or not hR(fh)then return end local m8=ur(fh)if m8 and mK(m8,function()return not hR(fh)end)then return end
y("the crate window is still open - tap its X")end end local function fi(fj)if not h0()then return false end local m9=x()-(e.openedAt or 0)
if m9<0.6 then ad(0.6-m9)end local h4=e.title local uu,uv=uc()local m_=fj and uu or uv if not m_ then e.lastFail=x()
c.crateFails=c.crateFails+1 y(("crate: no %s button found in %s"):format(fj and"Open"or"Discard",h4))return false
end local uw=aa()local ux,z8=mK(m_,function()return(not e.on)or(aa()~=nil and aa()~=uw)end)if not ux then e.lastFail=x()
c.crateFails=c.crateFails+1 y("crate: could not press "..(fj and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fj then c.crates=c.crates+1 ak(function()return aa()~=nil end,1.5)local na=aa()
y(("OPENED %s -> %s"):format(h4,na and ah(ab(na))or"?"))else y("discarded "..h4 .." (nothing ticked in it)")end
return true end e.calls={}function e.saw(uy,...)local uz=select("#",...)e.calls[#e.calls+1]={t=x(),m=uy,n=uz,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(az,a5)local bo=type(az)if(bo=="string"or bo=="number")and type(a5 .data)=="table"then for nb,h5 in pairs(a5 .data)do
if h5==az and type(nb)=="string"and(type(h5)=="string"or type(h5)=="number")then return{__slot="f:"..nb}end end
end if bo=="string"then if a5 .crate and az==a5 .crate then return{__slot="crate"}end if a5 .title and az==a5 .title then return{__slot="title"}end
if a5 .rar and az==a5 .rar then return{__slot="rarity"}end return az end if bo=="number"or bo=="boolean"or bo=="nil"then return az end
if bo=="table"then local nc={}for uA,nd in pairs(az)do if type(nd)=="table"then return nil,"nested table"end local uB,ne=e.slot(nd,a5)
if ne then return nil,ne end nc[uA]=uB end return nc end local uC,uD=pcall(function()return az:IsA("Instance")end)
if uC and uD then if az==J then return{__slot="player"}end if c.plot and az==c.plot then return{__slot="plot"}end
local fk=c.plot and c.plot:FindFirstChild("CrateStand")if fk and az==fk then return{__slot="stand"}end if fk and az.Parent==fk then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bo..")"end function e.resolve(fl)if type(fl)~="table"then return fl end
local aJ=fl.__slot if aJ and aJ:sub(1,2)=="f:"then return e.data and e.data[aJ:sub(3)]end if aJ=="crate"then return e.data and e.data.name end
if aJ=="title"then return(e.data and e.data.title)or e.title end if aJ=="rarity"then return e.data and e.data.rarity end
if aJ=="player"then return J end if aJ=="plot"then return c.plot end if aJ=="stand"or aJ=="model"then local h6=c.plot and c.plot:FindFirstChild("CrateStand")
if aJ=="stand"or not h6 then return h6 end for z9,nf in ipairs(h6:GetChildren())do if mH(nf.Name)then return nf end end
return nil end local ng={}for uE,uF in pairs(fl)do ng[uE]=e.resolve(uF)end return ng end function e.classify(h7)
if e.directOff then return end local fm={}for z_,h8 in ipairs(e.calls)do if h8 .t<=h7+0.05 and h7-h8 .t<=6 then fm[#fm+1]=h8 end
end if#fm==0 then return end if not ak(function()return(e.heldAt or 0)>=h7-1 end,2.5)then return end local dm={}
for Aa,dn in ipairs(fm)do local nh={}for ni=1,dn.n do local uG,nj=e.slot(dn.args[ni],dn)if nj then y("crate call has "..nj.." - keeping the button method")
return end nh[ni]=uG end dm[#dm+1]={m=dn.m,n=dn.n,args=nh}end local h9=e.learned e.learned={seq=dm,mode=h9 and h9 .mode or nil}
ae.dirty=true if not h9 then y(("learned how to open crates directly (%d call%s)"):format(#dm,#dm==1 and""or"s"))end
end function e.replay()local nk=e.learned local nl=aq:FindFirstChild("Remotes")local h_=nl and nl:FindFirstChild("CrateAction")
if not(nk and h_)then return false end local nm=table.unpack or unpack e.replaying=true for Ab,dp in ipairs(nk.seq)do
local ia={}for nn=1,dp.n do ia[nn]=e.resolve(dp.args[nn])end task.spawn(function()pcall(function()if dp.m=="InvokeServer"then h_:InvokeServer(nm(ia,1,dp.n))
else h_:FireServer(nm(ia,1,dp.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(uH)return(uH:gsub("[%%|;=,\n]",function(uI)return("%%%02X"):format(uI:byte())end))end
function e.enc(bP)local fn=type(bP)if fn=="string"then return"s"..e.esc(bP)end if fn=="number"then return"n"..tostring(bP)end
if fn=="boolean"then return bP and"b1"or"b0"end if fn=="nil"then return"z"end if bP.__slot then return"k"..bP.__slot end
local ib={}for uJ,uK in pairs(bP)do ib[#ib+1]=e.enc(uJ).."="..e.enc(uK)end return"t"..table.concat(ib,",")end
function e.dec(no)local dq,dr=no:sub(1,1),no:sub(2)local function uL(uM)return(uM:gsub("%%(%x%x)",function(uN)return string.char(tonumber(uN,16))end))end
if dq=="s"then return uL(dr)end if dq=="n"then return tonumber(dr)end if dq=="b"then return dr=="1"end if dq=="k"then return{__slot=dr}end
if dq=="t"then local np={}for uO in dr:gmatch("[^,]+")do local nq,uP=uO:match("^(.-)=(.*)$")if nq then local nr=e.dec(nq)
if nr~=nil then np[nr]=e.dec(uP)end end end return np end return nil end function e.goneOrNew(uQ)return function()
if not e.waiting then return true end local ns=aa()return ns~=nil and ns~=uQ end end function e.near()local nt=aq:FindFirstChild("Remotes")
local nu=nt and nt:FindFirstChild("CrateAction")local ic=ar()local ie=c.plot and c.plot:FindFirstChild("CrateStand")
local ig=ie and ie:FindFirstChild("Spot")if not(nu and ic and ig)then return false,"no crate stand or remote"end
local ih=ic.HumanoidRootPart local fo=ih.CFrame local nv,ii=e.title,"no answer"local uR=aa()local nw=ie:FindFirstChild("Holder")
local function nx()if not nw then return e.waiting or e.on end for Ac,uS in ipairs(nw:GetChildren())do if uS:IsA("Model")then return true end end
return false end for uT=1,3 do if not(e.waiting or e.on)or not nx()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(ih.Position-ig.Position).Magnitude>8 then cj(ig,e.prompt)end ad(0.12+0.15*uT)
local aS={}e.replaying=true task.spawn(function()aS.ok,aS.v=pcall(function()return nu:InvokeServer("open")end)
aS.done=true end)ak(function()return aS.done end,6)e.replaying=false local bQ=aS.v if aS.done and aS.ok and type(bQ)=="table"and bQ.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 y(("OPENED %s -> %s (no window)"):format(nv,bQ.prize and ah(ab(tostring(bQ.prize)))or"?"))
ak(function()local ny=aa()return ny~=nil and ny~=uR end,1.5)if(ih.Position-fo.Position).Magnitude>8 then pcall(function()aF(ic,fo.Position,fo.Position+fo.LookVector)end)end
return true,"opened"end ii=(aS.done and aS.ok and type(bQ)=="table")and tostring(bQ.reason or"refused, no reason given")
or(aS.done and("error: "..tostring(bQ))or"no answer in 6s")ad(0.3)if not nx()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 y(("crate: the server would not open %s next to the stand (%s)"):format(nv,ii))
return false,ii end function e.smart()local ij=e.title if(e.nearFails or 0)<3 then local uU=e.near()if uU then return true end
if e.nearFails>=3 then y("opening next to the stand failed 3 times - trying the older ways")end end local bR=e.learned
if bR then local ik=aa()if e.on then e.replay()if ak(e.goneOrNew(ik),3.5)then c.crates=c.crates+1 y("OPENED "..ij.." (direct)")
return true end else if bR.mode~="window"then e.replay()if ak(e.goneOrNew(ik),3.5)then c.crates,e.fails=c.crates+1,0
if bR.mode~="direct"then bR.mode,ae.dirty="direct",true y("crates now open directly - the window never comes up")
end y("OPENED "..ij.." (direct, no window)")return true end end if h0()then e.replay()if ak(e.goneOrNew(ik),3.5)then
c.crates,e.fails=c.crates+1,0 if bR.mode~="window"then bR.mode,ae.dirty="window",true y("crates need their window up first - it shows briefly")
end y("OPENED "..ij.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ae.dirty=bR,nil,true
if e.fails>=3 then e.directOff=true y("direct crate opening failed 3 times - using the button for now")else y("the learned crate call did not work - back to pressing Open")
end end return fi(true)end function A.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end A.cache={}function A.watchCache()A.cache=A.snap()
for uV,nz in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(nz):Connect(function()A.cache[uV]=J:GetAttribute(nz)end))
end end function A.isOn()return J:GetAttribute("AutoRollOn")==true end function A.saw(uW,...)local fp=A.cache
local uX={m=uW,n=select("#",...),args={...},before={rules=fp.rules,stop=fp.stop,on=fp.on,main=fp.main}}task.delay(1.5,function()
if c.alive then pcall(A.learnOne,uX)end end)end function A.learnOne(ds)local as,dt=A.snap(),ds.before local fq=(as.rules~=dt.rules)or(as.stop~=dt.stop)
local nA=(as.on~=dt.on)or(as.main~=dt.main)if not fq and not nA then return end local nB={}for nC=1,ds.n do local aG=ds.args[nC]
local bS=type(aG)if bS=="string"and aG~=""and aG==as.rules then aG={__slot="rules"}elseif bS=="string"and aG~=""and fq and aG==as.stop and as.stop~=dt.stop then aG={__slot="stop"}
elseif bS=="table"then local nD={}for uY,co in pairs(aG)do if type(co)=="table"or(type(co)=="userdata")then A.msg="Auto Roll sends something I cannot repeat"return
end nD[uY]=(type(co)=="string"and co~=""and co==as.rules)and{__slot="rules"}or co end aG=nD elseif bS~="string"and bS~="number"and bS~="boolean"and bS~="nil"then
if aG==J then aG={__slot="player"}else A.msg="Auto Roll sends something I cannot repeat"return end end nB[nC]=aG
end local cp={m=ds.m,n=ds.n,args=nB}if fq then local il=false for uZ=1,cp.n do local du=cp.args[uZ]if type(du)=="table"and du.__slot=="rules"then il=true end
if type(du)=="table"and not du.__slot then for Ad,nE in pairs(du)do if type(nE)=="table"and nE.__slot=="rules"then il=true end end
end end if il then A.rec.rules={cp}else table.insert(A.rec.rules,cp)if#A.rec.rules>60 then table.remove(A.rec.rules,1)end
end end if nA then if as.on==true then A.rec.on=cp else A.rec.off=cp end d.AutoRoll=(as.on==true)end if as.rules and as.rules~=""then d.ARrules,d.ARstop=as.rules,as.stop or""end
ae.dirty=true A.msg=""y(("learned an Auto Roll %s message"):format(fq and"choices"or(as.on and"on"or"off")))end
function A.resolve(cq)if type(cq)~="table"then return cq end if cq.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cq.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cq.__slot=="player"then return J end
local nF={}for u0,u1 in pairs(cq)do nF[u0]=A.resolve(u1)end return nF end function A.replay(nG,u2)local nH=table.unpack or unpack
for Ae,dv in ipairs(u2)do local im={}for nI=1,dv.n do im[nI]=A.resolve(dv.args[nI])end A.replaying=true pcall(function()
if dv.m=="InvokeServer"then task.spawn(function()pcall(function()nG:InvokeServer(nH(im,1,dv.n))end)end)else nG:FireServer(nH(im,1,dv.n))end
end)A.replaying=false task.wait(0.25)end end function A.apply(nJ,u3)if A.busy or not c.alive then return end A.busy=true
pcall(function()local nK=aq:FindFirstChild("Remotes")local io=nK and nK:FindFirstChild("AutoRollAction")if not io then A.msg="this game has no AutoRollAction"return end
local bp=d.AutoRoll if bp and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#A.rec.rules==0 then
A.msg="pick your Auto Roll choices once in the game's menu so I can learn them"y(A.msg)else A.replay(io,A.rec.rules)
if ak(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then y("Auto Roll choices put back")else
A.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"y(A.msg)end end end if bp==A.isOn()or(not bp and not u3)then return end
local fr=bp and A.rec.on or A.rec.off if not fr then local dw=bp and A.rec.off or A.rec.on local nL=dw~=nil for u4=1,dw and dw.n or 0 do
if type(dw.args[u4])=="boolean"then nL=false end end if nL then fr=dw end end if not fr then A.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bp and"on"or"off")
y(A.msg)return end A.replay(io,{fr})if ak(function()return A.isOn()==bp end,4)then A.msg=""y(("Auto Roll switched %s%s"):format(bp and"ON"or"OFF",nJ and(" ("..nJ..")")or""))
else A.msg="Auto Roll did not switch - do it once in the game so I can relearn it"y(A.msg)end end)A.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local u5,u6=pcall(function()return J.UserId end)return u5 and u6 or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local u7,ip=pcall(function()return require(aq:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if u7 and type(ip)=="table"and type(ip.Pets)=="table"then j.I=ip end return j.I end function j.order()if j.list then return j.list end
local bq=j.info()if not bq then return{}end local bT={}if type(bq.Order)=="table"and#bq.Order>0 then for Af,nM in ipairs(bq.Order)do if bq.Pets[nM]then bT[#bT+1]=nM end end
else for u8 in pairs(bq.Pets)do bT[#bT+1]=u8 end table.sort(bT,function(u9,u_)return(bq.Pets[u9].price or 0)<(bq.Pets[u_].price or 0)end)
end j.list=bT return bT end function j.nice(nN,iq)local nO=j.info()local nP=nO and nO.Pets[nN]return((iq and iq~="")and(iq.." ")or"")..(nP and nP.displayName or tostring(nN))
end function j.data()local fs=J:GetAttribute("PetsData")if type(fs)~="string"then return nil end if fs==j.rawD then return j.lastD end
local va,dx=pcall(function()return j.HS:JSONDecode(fs)end)dx=(va and type(dx)=="table")and dx or nil j.rawD,j.lastD=fs,dx
return dx end function j.pen()return aq:FindFirstChild("PetMeadowSpawns")end function j.srv()return ax:GetServerTimeNow()end
function j.money()local ir=J:FindFirstChild("MoneyValue")if ir and type(ir.Value)=="number"then return ir.Value end
return aY()or 0 end function j.wishes()local nQ=j.pen()local nR=nQ and nQ:GetAttribute("Wishes")local is,nS={},j.srv()
if type(nR)~="string"then return is end local vb,nT=pcall(function()return j.HS:JSONDecode(nR)end)if vb and type(nT)=="table"then
for vc,it in pairs(nT)do if type(it)=="number"and it>nS then is[vc]=it-nS end end end return is end function j.call(...)
local nU=aq:FindFirstChild("Remotes")local nV=nU and nU:FindFirstChild("PetRequest")if not nV then return nil end
local nW=table.pack(...)local bU={}task.spawn(function()bU.ok,bU.v=pcall(function()return nV:InvokeServer(table.unpack(nW,1,nW.n))end)
bU.done=true end)local vd=x()while not bU.done and x()-vd<6 do task.wait(0.05)end if bU.done and bU.ok then return bU.v end
return nil end function j.want(ve)return d.Pets[ve]end function j.closeNaming(iu)local nY=pcall(function()local nX=J:FindFirstChild("PlayerScripts")
local vf=nX and nX:FindFirstChild("Naming",true)require(vf).close()end)ad(0.5)if iu.Visible then pcall(function()local nZ=iu:FindFirstChild("NameBox",true)if nZ then nZ:ReleaseFocus()end end)
iu.Visible=false nY=false end return nY end function j.skipNaming()j.namingUntil=x()+10 if j.namingOn then return end
j.namingOn=true task.spawn(function()while c.alive and x()<j.namingUntil do local n0=J:FindFirstChildOfClass("PlayerGui")
local n1=n0 and n0:FindFirstChild("MainGui")local ft=n1 and n1:FindFirstChild("PetNameGui")if ft and ft.Visible then
ad(0.4)if ft.Visible then j.namingShut=(j.namingShut or 0)+1 pcall(j.closeNaming,ft)break end end ad(0.25)end
j.namingOn=false end)end function j.buyTick()if not d.PetBuy then j.buyMsg="auto adopt is off"return end local iv,n2,fu=j.info(),j.pen(),j.data()
if not(iv and n2 and fu)then j.buyMsg="pet data not loaded yet"return end j.tryAt=j.tryAt or{}local dy,iw=#(fu.pets or{}),tonumber(fu.maxOwned)or 60
local vg,n3,dz=j.srv(),{},nil for Ag,aK in ipairs(n2:GetChildren())do n3[aK.Name]=true local bV,fv=aK:GetAttribute("Pet"),aK:GetAttribute("Variant")or""
local ix=bV and j.want(bV)if ix and ix.b and iv.Pets[bV]and(not ix.g or fv=="Big")and z.wantMore(bV,fv,fu)and not aK:GetAttribute("A_"..j.uid)
and(tonumber(aK:GetAttribute("ExpiresAt"))or 0)>vg+1 and x()>=(j.tryAt[aK.Name]or 0)then local dA,n4=j.nice(bV,fv),iv.Pets[bV].price or 0
if dy>=iw then dz=("%s is in the pen, but you have %d/%d pets"):format(dA,dy,iw)j.tryAt[aK.Name]=x()+15 elseif j.money()<n4 then
dz=("%s is in the pen - need $%s"):format(dA,aD(n4))j.tryAt[aK.Name]=x()+5 else j.tryAt[aK.Name]=x()+8 local br=j.call("adopt",aK.Name)
if type(br)=="table"and br.ok then dy=dy+1 j.buys=(j.buys or 0)+1 j.recent=j.recent or{}local vh=type(br.pet)=="table"and br.pet or{}
table.insert(j.recent,{id=tostring(vh.id or("?"..x())),name=bV,variant=fv,at=x()})if#j.recent>30 then table.remove(j.recent,1)end
y("ADOPTED "..dA)j.skipNaming()dz="adopted "..dA else local n5=type(br)=="table"and tostring(br.reason or"no reason given")or"no answer"
y(("adopt %s failed: %s"):format(dA,n5))dz="adopt failed: "..n5 if type(br)=="table"and br.bagFull then j.tryAt[aK.Name]=x()+60 end
end end end end for n6 in pairs(j.tryAt)do if not n3[n6]then j.tryAt[n6]=nil end end j.buyMsg=dz or("watching the pen (%d/%d pets)"):format(dy,iw)
end function j.wishTick()if not d.PetWish then j.wishMsg="auto wish is off"return end local fw=j.info()if not(fw and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local fy,iy,bs=j.wishes(),0,nil local vi=(type(fw.Wish)=="table"and fw.Wish.cashShare)or 2
local vj=j.data()for Ah,aw in ipairs(j.order())do local n7=j.want(aw)if n7 and n7 .w and z.wantMore(aw,"",vj)then
iy=iy+1 if not fy[aw]and x()>=(j.wishTry[aw]or 0)then local iz=tonumber(J:GetAttribute("PetWishCredits"))or 0
local iA=math.floor((fw.Pets[aw].price or 0)*vi)if iz<=0 and j.money()<iA then j.wishTry[aw]=x()+10 bs=("need $%s to wish for %s"):format(aD(iA),j.nice(aw))
j.wishWhy[aw]=bs else j.wishTry[aw]=x()+3 local vk=iz>0 and"wishCredit"or"wish"local fz=j.call(vk,aw)if type(fz)=="table"and fz.ok then
j.wishN,j.wishWhy[aw]=j.wishN+1,nil y(("WISHED for %s (%s)"):format(j.nice(aw),iz>0 and"free wish"or("$"..aD(iA))))
else local iB=type(fz)=="table"and tostring(fz.reason or"no reason given")or"no answer"if iB:lower():find("already",1,true)then j.wishTry[aw]=x()+2
else y(("wish %s failed: %s"):format(j.nice(aw),iB))bs="wish failed: "..iB end end end end end end if not bs then
for Ai,fA in ipairs(j.order())do local n8=j.want(fA)if n8 and n8 .w and not fy[fA]and j.wishWhy[fA]then bs=j.wishWhy[fA]break end
end end if not bs then local fB={}for Aj,fC in ipairs(j.order())do local n9=j.want(fC)if n9 and n9 .w and fy[fC]then fB[#fB+1]=("%s %dm"):format(j.nice(fC),math.ceil(fy[fC]/60))end
end bs=iy==0 and"no pet has WISH ticked"or("running: "..(#fB>0 and table.concat(fB,", ")or"none yet"))end j.wishMsg=bs
end q.switches,q.glazed,q.finished=0,0,0 q.done,q.doneN,q.later={},0,{}function q.teams()local iC=j.data()return(iC and iC.teams)or{},iC
end function q.current(cr)cr=cr or j.data()if not cr then return""end local n_={}for Ak,vl in ipairs(cr.equipped or{})do n_[tostring(vl)]=true end
for Al,oa in ipairs(cr.teams or{})do local ob=oa.pets or{}local iD=#ob==#(cr.equipped or{})if iD then for Am,vm in ipairs(ob)do if not n_[tostring(vm)]then iD=false break end end end
if iD then return oa.name end end return""end function q.equip(iE)local vn,vo=q.teams()local iF for vp,vq in ipairs(vn)do if vq.name==iE then iF=vp break end end
if not iF then q.msg="no saved team called "..tostring(iE)return false end if q.current(vo)==iE then return true end
for An=1,4 do local oc=j.call("teamEquip",iF)if type(oc)=="table"and oc.ok then q.switches=q.switches+1 return true
end task.wait(0.4)end return false end function q.left(vr)local od=vr:FindFirstChild("SquishyPlaceHolder")local oe=od and od:FindFirstChild("TimerGui")
local of=oe and oe:FindFirstChildWhichIsA("TextLabel",true)local iG=of and of.Text if type(iG)~="string"or iG:find("-",1,true)then return nil end
local iH,og,oh=iG:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not iH then return nil end local oi=oh~=""and(tonumber(iH)*3600+tonumber(og)*60+tonumber(oh))or(tonumber(iH)*60+tonumber(og))
return oi>0 and oi or nil end function q.waxes()local dB={}local oj=c.plot and c.plot:FindFirstChild("WaxStations")
if not oj then return dB end local ol=j.srv()for Ao,aT in ipairs(oj:GetChildren())do local iI=tonumber(aT:GetAttribute("PourEnd"))
local om=aT:GetAttribute("PourOwner")if aT:GetAttribute("HasSquishy")and aT:GetAttribute("PourId")and(om==nil or om==j.uid)then
local iJ=q.left(aT)local oo=iJ and(ol+iJ)or((iI and iI>ol)and iI or nil)if oo then local op,oq=aT:FindFirstChild("SquishyPlaceHolder"),"?"
if op then for Ap,ot in ipairs(op:GetChildren())do if ot:IsA("Model")then oq=ot.Name break end end end local vs=tostring(aT:GetAttribute("Helpers")or"")
local iK=0 for Aq in vs:gmatch("%d+")do iK=iK+1 end dB[#dB+1]={st=aT,ends=oo,sure=iJ~=nil,id=aT:GetAttribute("PourId"),name=oq,helps=iK,
long=aT:GetAttribute("PourLong")==true}end end end table.sort(dB,function(vt,vu)return vt.ends<vu.ends end)return dB
end function q.glazeCount()local ou=aq:FindFirstChild("Remotes")local ov=ou and ou:FindFirstChild("EditStack")
if not ov then return nil end local vv,dC=pcall(function()return ov:InvokeServer("State",nil)end)if not(vv and type(dC)=="table"and type(dC.state)=="table")then return nil end
local iL,iM=0,{}for Ar,fD in ipairs(dC.state.entries or{})do if fD.glaze and fD.glaze~=""then iL=iL+1 iM[fD.glaze]=(iM[fD.glaze]or 0)+1 end
end return iL,iM,#(dC.state.entries or{}),dC.state.capacity end function q.finishedOne(fE,ow)q.finished=q.finished+1
task.wait(2)local iN,vw,ox,vx=q.glazeCount()if iN and ow and iN>ow then q.glazed=q.glazed+1 local iO={}for vy,vz in pairs(vw)do iO[#iO+1]=vy.." "..vz end
y(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ah(ab(fE.name)),fE.st.Name,iN,table.concat(iO,", ")))
else y(("wax done on station %s: %s, no glaze%s"):format(fE.st.Name,ah(ab(fE.name)),ox and(" (stack "..ox.."/"..tostring(vx)..")")or""))
end end function q.tick()q.list=q.waxes()if q.editing and x()-(q.editingSince or x())>120 then q.editing=false end
if q.editing then q.msg="rebuilding teams..."return end if not d.Teams then q.want,q.msg="","auto teams is off"return end
local cs=j.srv()local aA=q.glazeFor if aA then local dD=aA.st local oy=dD.Parent and dD:GetAttribute("HasSquishy")and dD:GetAttribute("PourId")==aA.id
local oz=oy and q.left(dD)if oz then aA.ends=cs+oz end if not oy then q.glazeFor,q.afterUntil=nil,x()+1.5 if not q.done[aA.id or"?"]then
q.done[aA.id or"?"],q.doneN=true,q.doneN+1 if q.doneN>400 then q.done,q.doneN={[aA.id or"?"]=true},1 end local vA=aA.before
task.spawn(function()pcall(q.finishedOne,aA,vA)end)end elseif aA.ends-cs>d.GlazeLead*3+60 or cs>aA.ends+90 then
q.glazeFor,q.afterUntil=nil,x()+1.5 q.later[aA.id or"?"]=x()+120 y(("station %s is not finishing yet (%s left) - glaze team off again"):format(dD.Name,q.clock(aA.ends-cs)))
end end if d.TeamGlaze~=""and not q.glazeFor then local vB=q.speedRatio(d.TeamGlaze)for As,bW in ipairs(q.list)do
if bW.sure and(bW.ends-cs)*vB[bW.long and 2 or 1]<=d.GlazeLead and x()>=(q.later[bW.id or"?"]or 0)and not q.done[bW.id or"?"]then
q.glazeFor=bW task.spawn(function()bW.before=q.glazeCount()end)break end end end local aH,fF="",""if d.TeamGlaze~=""and(q.glazeFor or x()<(q.afterUntil or 0))then
aH,fF=d.TeamGlaze,q.glazeFor and(" - station "..q.glazeFor.st.Name.." finishes soon")or""elseif d.TeamWax~=""and(q.placing or q.aboutToPlace())then
aH,fF=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and q.allBusy()then aH,fF=d.TeamFull," - every station is busy"
else aH=d.TeamNormal end q.want=aH local dE=q.current()q.cur=dE if aH~=""and dE~=aH and x()>=(q.nextTry or 0)then
q.nextTry=x()+1.1 if q.equip(aH)then y("team: "..aH..fF)else q.nextTry=x()+3 end end local iP=q.list[1]q.msg=("on: %s%s | next wax done %s"):format(dE~=""and dE or"(not a saved team)",(aH~=""and aH~=dE)and(" -> "..aH)or"",
iP and("in "..q.clock(iP.ends-cs).." (st "..iP.st.Name..")")or"- none running")end function q.clock(bt)bt=math.max(0,math.floor(bt))
if bt>=3600 then return("%d:%02d:%02d"):format(math.floor(bt/3600),math.floor((bt%3600)/60),bt%60)end return("%d:%02d"):format(math.floor(bt/60),bt%60)
end function q.allBusy()local vC,vD=ew()return vD>0 and vC==0 end function q.aboutToPlace()if not c.running then return false end
local oA=aa()if not(oA and aQ(oA))then return false end local vE=ew()return vE>0 end function q.mult(oB,vF,oC)return{(1+oB)*(1+oC),(1+oB+vF)*(1+oC)}end
function q.speedNow()local function iQ(vG)return tonumber(J:GetAttribute(vG))or 0 end return q.mult(iQ("PetWaxSpeed"),iQ("PetLongWax"),iQ("PetSocialWax"))
end function q.speedOf(vH)local vI,oD=q.teams()if not oD then return nil end for At,oE in ipairs(vI)do if oE.name==vH then
local iR={}for Au,vJ in ipairs(oE.pets or{})do for Av,oF in ipairs(oD.pets or{})do if tostring(oF.id)==tostring(vJ)then iR[#iR+1]=oF break end end
end local oG=z.caps()local oH,vK=z.stats(iR)return q.mult(math.min(oH.waxSpeed or 0,oG.waxSpeed or 0.25),math.min(oH.longWax or 0,oG.longWax or 0.3),vK.socialWax or 0)
end end return nil end function q.speedRatio(vL)local oI,iS=q.speedNow(),q.speedOf(vL)if not iS then return{1,1}end
return{oI[1]/iS[1],oI[2]/iS[2]}end function q.glazeSoon()return d.Teams and d.TeamGlaze~=""and(q.glazeFor~=nil or x()<(q.afterUntil or 0))
end z.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
z.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}z.buildMsg,z.fuseMsg,z.fused,z.builds="","",0,0
function z.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function z.caps()local iT=j.info()return(iT and type(iT.Caps)=="table")and iT.Caps or z.CAPS
end function z.value(oJ,iU)local fG=j.info()local ct=fG and fG.Pets[oJ]if not(ct and type(ct.boost)=="table")then return nil end
local bX if type(fG.boostValue)=="function"then local vM,vN=pcall(fG.boostValue,oJ,(iU~=""and iU)or nil)bX=vM and tonumber(vN)or nil
end if not bX then bX=ct.boost.value or 0 if iU=="Big"then local oK=bX*1.5 bX=z.ROUND[ct.boost.kind]and math.max(bX+1,math.floor(oK+0.5))or oK
end end return ct.boost.kind,bX,ct.boost.every end function z.stats(vO)local bY,iV={},{}for Aw,oL in ipairs(vO)do
local aL,fH,oM=z.value(oL.name,oL.variant or"")if aL then if aL:sub(1,6)=="social"then iV[aL]=math.max(iV[aL]or 0,fH)
elseif aL=="waxStir"or aL=="cashGift"then bY[aL]=(bY[aL]or 0)+fH*60/(oM or 60)elseif aL=="luckyPull"then bY.luckyPull=(bY.luckyPull or 0)+fH/(oM or 10)
else bY[aL]=(bY[aL]or 0)+fH end end end return bY,iV end function z.glazeGain(vP,fI)local dF,iW,Ax={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local vQ=dF[1]+dF[2]+dF[3]local vR=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cu={}for fJ=1,3 do cu[fJ]=dF[fJ]+vP*dF[fJ]/vQ+(fJ==1 and vR or 0)end
local iX={cu[1]*(1-fI),cu[2]*(1-fI)+cu[1]*fI,cu[3]+cu[2]*fI}return iX[1]*(iW[1]-1)+iX[2]*(iW[2]-1)+iX[3]*(iW[3]-1)
end function z.score(fK,vS)local iY=z.caps()local fL,fM=z.stats(vS)local function bu(oN)return math.min(fL[oN]or 0,iY[oN]or math.huge)end
local vT=(1+bu("income"))*(1+(fM.socialIncome or 0))*(1+math.min(fL.cashGift or 0,iY.cashGiftPerMinute or 9)/60)
local vU=1+bu("luck")+(fL.luckyPull or 0)+(fM.socialLuck or 0)local oO=vU*(1+bu("newFind"))local dG=math.log(vT)
local vV=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local iZ=(1+bu("waxSpeed")+bu("longWax"))*(1+(fM.socialWax or 0))
+math.min(fL.waxStir or 0,iY.waxStirPerMinute or 30)/60/vV local vW=1-(1-bu("headStart"))*(1-(fM.socialHeadStart or 0))
if fK=="farm"then return dG+0.7*math.log(oO)+0.1*math.log(iZ)end if fK=="full"then return dG+0.4*math.log(iZ)+0.02*math.log(oO)end
if fK=="glaze"then return z.glazeGain(bu("glaze"),bu("glazeUp"))+0.001*dG end if fK=="wax"then return-math.log(1-0.5*vW)+0.001*dG+0.001*math.log(iZ)end
return dG end function z.best(oP,cv,vX,i0)i0=i0 or{}local au,dH={},{}local function oQ(vY)local oR={}for vZ,v0 in ipairs(vY)do oR[vZ]=cv[v0]end return oR end
local function i1(oS)local i2=z.score(oP,oQ(oS))for Ay,v1 in ipairs(oS)do if i0[cv[v1].id]then i2=i2+1e-7 end end
return i2 end for Az=1,math.min(vX,#cv)do local fN,i3 for i4=1,#cv do if not dH[i4]then au[#au+1]=i4 local oT=i1(au)
au[#au]=nil if not i3 or oT>i3+1e-12 then fN,i3=i4,oT end end end if not fN then break end dH[fN]=true au[#au+1]=fN
end for AA=1,6 do task.wait()local oU,oV=false,i1(au)for i5=1,#au do for i6=1,#cv do if not dH[i6]then local oW=au[i5]
au[i5]=i6 local oX=i1(au)if oX>oV+1e-9 then dH[oW],dH[i6],oV,oU=nil,true,oX,true else au[i5]=oW end end end end
if not oU then break end end local oY={}for v2,v3 in ipairs(au)do oY[v2]=tostring(cv[v3].id)end return oY,z.score(oP,oQ(au))
end function z.count(oZ,o0,v4)local dI,dJ={},0 local o1,o2={},{}for AB,v5 in ipairs(o0 .arriving or{})do o1[tostring(v5)]=true end
for AC,cw in ipairs(o0 .pets or{})do o2[tostring(cw.id)]=true if cw.name==oZ and not o1[tostring(cw.id)]then if cw.variant=="Big"then dJ=dJ+1 elseif(cw.variant or"")==""then dI[#dI+1]=cw end
end end if not v4 then for AD,dK in ipairs(j.recent or{})do if dK.name==oZ and not o2[dK.id]and x()-dK.at<20 then
if dK.variant=="Big"then dJ=dJ+1 else dI[#dI+1]=dK end end end end return dI,dJ end function z.goal(v6)local o3=d.Pets[v6]return o3 and tonumber(o3 .f)or 0 end
function z.wantMore(o4,v7,o5)local i7=z.goal(o4)if i7<=0 or not o5 then return true end local v8,o6=z.count(o4,o5)
if o6>=i7 then return false end if v7=="Big"then return true end return#v8<z.need()*(i7-o6)end function z.status(o7,o8)
local fO=z.goal(o7)if fO<=0 or not o8 then return nil end local v9,i8=z.count(o7,o8)if i8>=fO then return("Big %d/%d done"):format(i8,fO)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#v9,z.need()),z.need(),i8,fO)end function z.wear(i9)local i_={}
for AE,v_ in ipairs(i9)do i_[tostring(v_)]=true end for AF=1,3 do local cx=j.data()if not cx then return false end
for AG,o9 in ipairs(cx.equipped or{})do if not i_[tostring(o9)]then j.call("unequip",o9)task.wait(0.3)end end
cx=j.data()local o_={}for AH,wa in ipairs(cx.equipped or{})do o_[tostring(wa)]=true end for AI,pa in ipairs(i9)do
if not o_[tostring(pa)]then j.call("equip",pa)task.wait(0.3)end end task.wait(0.4)cx=j.data()local ja,pb=0,true
for AJ,wb in ipairs(cx.equipped or{})do ja=ja+1 if not i_[tostring(wb)]then pb=false end end if pb and ja==#i9 then return true end
end return false end function z.saveTeam(pc,pd)if not z.wear(pd)then return false,"could not put the pets on"end
local wc=q.teams()local bZ for wd,we in ipairs(wc)do if we.name==pc then bZ=wd break end end local cy if bZ then
cy=j.call("teamSave",bZ)else cy=j.call("teamNew")if type(cy)=="table"and cy.ok and cy.index then bZ=cy.index task.wait(0.3)
j.call("teamRename",{index=bZ,name=pc})end end task.wait(0.4)local jb=j.data()local pe=jb and jb.teams and bZ and jb.teams[bZ]
if not pe then return false,"the game did not save it"end local pf={}for AK,wf in ipairs(pe.pets or{})do pf[tostring(wf)]=true end
for AL,wg in ipairs(pd)do if not pf[tostring(wg)]then return false,"saved, but not with these pets"end end return true
end z.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function z.quiet()
if q.placing or q.glazeSoon()then return false end local wh=j.srv()for AM,wi in ipairs(q.list or{})do if wi.ends-wh<(d.GlazeLead or 45)+90 then return false end end
return true end function z.plan()local dL=j.data()if not dL then return{}end local pg={}for AN,wj in ipairs(dL.arriving or{})do pg[tostring(wj)]=true end
local dM={}for AO,fP in ipairs(dL.pets or{})do if not pg[tostring(fP.id)]then dM[#dM+1]={id=tostring(fP.id),name=fP.name,variant=fP.variant or""}end
end local ph={}for AP,pj in ipairs(dM)do ph[pj.id]=pj end local pk=tonumber(dL.slots)or 3 local jc,pl={},{}for AQ,fQ in ipairs(z.ROLES)do
local dN=d[fQ[1]]if dN~=""and not pl[dN]then pl[dN]=true local jd,dO,pm={},{},false for AS,pn in ipairs(dL.teams or{})do
if pn.name==dN then for AT,wk in ipairs(pn.pets or{})do local je=ph[tostring(wk)]if je then jd[je.id]=true dO[#dO+1]=je else pm=true end
end end end local jf,po=z.best(fQ[2],dM,pk,jd)local pp=z.score(fQ[2],dO)local pq=#jf==#dO for AU,wl in ipairs(jf)do if not jd[wl]then pq=false end end
if not pq and(pm or#dO<math.min(pk,#dM)or po>pp+1e-4)then jc[#jc+1]={team=dN,role=fQ[2],ids=jf,gain=po-pp}end
end end return jc end function z.rebuild(wm)local pr=z.plan()if#pr==0 then z.buildMsg="teams are already the best your pets allow"return true end
if not z.quiet()then z.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end q.editing,q.editingSince=true,x()
local fR=true local wq,wr=pcall(function()for AV,dP in ipairs(pr)do local wn,wo=z.saveTeam(dP.team,dP.ids)local ps=j.data()
local jg={}for AW,wp in ipairs(dP.ids)do for AX,jh in ipairs(ps and ps.pets or{})do if tostring(jh.id)==wp then jg[#jg+1]=j.nice(jh.name,jh.variant)end
end end if wn then y(("TEAM %s rebuilt (%s): %s"):format(dP.team,wm or"pets changed",table.concat(jg,", ")))else fR=false y(("TEAM %s: %s"):format(dP.team,tostring(wo)))end
end end)q.editing,q.nextTry=false,0 if not wq then fR=false y("TEAM BUILD ERR "..tostring(wr))end z.builds=z.builds+1
z.buildMsg=fR and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fR end
function z.fuseTick()if not d.AutoFuse or q.editing then return end local fS=j.data()if not fS then return end
local ji=z.need()local jj,fT={},{}for AY,ws in ipairs(fS.teams or{})do for AZ,wt in ipairs(ws.pets or{})do jj[tostring(wt)]=true end end
for A0,wu in ipairs(fS.equipped or{})do fT[tostring(wu)]=true end z.failUntil=z.failUntil or{}for b0,wv in pairs(d.Pets)do
local pt=tonumber(wv.f)or 0 local jk,ww=z.count(b0,fS,true)if pt>0 and ww<pt and#jk>=ji and x()>=(z.failUntil[b0]or 0)then
table.sort(jk,function(fU,fV)local pu=(fT[tostring(fU.id)]and 4 or 0)+(jj[tostring(fU.id)]and 2 or 0)+(fU.named and 1 or 0)
local pv=(fT[tostring(fV.id)]and 4 or 0)+(jj[tostring(fV.id)]and 2 or 0)+(fV.named and 1 or 0)if pu~=pv then return pu<pv end
return tostring(fU.id)<tostring(fV.id)end)local fW,jl={},{}for fX=1,ji do fW[fX]=tostring(jk[fX].id)if fT[fW[fX]]then jl[#jl+1]=fW[fX]end
end q.editing,q.editingSince=true,x()for A1,wx in ipairs(jl)do j.call("unequip",wx)task.wait(0.3)end local fY=j.call("fuse",{ids=fW})
q.editing,q.nextTry=false,0 if type(fY)=="table"and fY.ok then z.fused=z.fused+1 z.dirtyAt=x()y(("FUSED %d %s -> Big %s"):format(ji,j.nice(b0),j.nice(b0)))
z.fuseMsg=("fused a Big %s %s"):format(j.nice(b0),os.date("%H:%M"))else z.failUntil[b0]=x()+120 y(("fuse %s failed: %s"):format(j.nice(b0),type(fY)=="table"and tostring(fY.reason or"no reason given")or"no answer"))
end return end end end function z.tick()pcall(z.fuseTick)if not d.AutoBuild or not d.Teams then return end local pw=j.data()
if not pw then return end local b1={}for A2,wy in ipairs(pw.pets or{})do b1[#b1+1]=tostring(wy.id)end table.sort(b1)
b1=table.concat(b1,",")if b1~=z.sig then z.sig,z.dirtyAt=b1,x()end local wz=(z.dirtyAt and x()-z.dirtyAt>8)or x()-(z.lastBuild or 0)>900
if wz and not q.editing then local wA=z.rebuild(z.dirtyAt and"pets changed"or"check")if wA then z.dirtyAt,z.lastBuild=nil,x()end
end end o.bb,o.fx,o.post,o.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}o.watch=setmetatable({},{__mode="k"})
o.mem,o.memPeak,o.fps=0,0,0 function o.isFx(b2)return b2:IsA("ParticleEmitter")or b2:IsA("Trail")or b2:IsA("Beam")or b2:IsA("Fire")or b2:IsA("Smoke")
or b2:IsA("Sparkles")or b2:IsA("Light")end function o.muteOne(aB)if not d.Lite or not aB.Parent then return end
local fZ=(aB:IsA("BillboardGui")and o.bb)or(o.isFx(aB)and o.fx)or nil if not fZ or fZ[aB]~=nil then return end
fZ[aB]=aB.Enabled if aB.Enabled then aB.Enabled=false end o.watch[aB]=aB:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aB.Enabled then fZ[aB]=true aB.Enabled=false end end)end function o.lite(px)d.Lite=px if px then
task.spawn(function()for wB,wC in ipairs(ax:GetDescendants())do if not d.Lite then return end pcall(o.muteOne,wC)
if wB%600==0 then task.wait()end end end)if not o.addConn then o.queue={}o.addConn=T(ax.DescendantAdded:Connect(function(jm)
if d.Lite and(jm:IsA("BillboardGui")or o.isFx(jm))then o.queue[#o.queue+1]=jm end end))end local jn=game:GetService("Lighting")
for A3,dQ in ipairs(jn:GetChildren())do if dQ:IsA("PostEffect")and dQ.Enabled and o.post[dQ]==nil then o.post[dQ]=true dQ.Enabled=false end
end pcall(function()o.oldShadows=o.oldShadows==nil and jn.GlobalShadows or o.oldShadows jn.GlobalShadows=false end)
pcall(function()o.oldDeco=o.oldDeco==nil and ax.Terrain.Decoration or o.oldDeco ax.Terrain.Decoration=false end)
else for A4,wD in pairs(o.watch)do pcall(function()wD:Disconnect()end)end for py,wE in pairs(o.bb)do pcall(function()if py.Parent then py.Enabled=wE end end)end
for pz,wF in pairs(o.fx)do pcall(function()if pz.Parent then pz.Enabled=wF end end)end for pA in pairs(o.post)do pcall(function()if pA.Parent then pA.Enabled=true end end)end
o.bb,o.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})o.watch,o.post,o.queue=setmetatable({},{__mode="k"}),{},{}
local wG=game:GetService("Lighting")if o.oldShadows~=nil then pcall(function()wG.GlobalShadows=o.oldShadows end)o.oldShadows=nil end
if o.oldDeco~=nil then pcall(function()ax.Terrain.Decoration=o.oldDeco end)o.oldDeco=nil end end end o.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function o.hideHud(pB)d.HideHud=pB local jo=J:FindFirstChildOfClass("PlayerGui")if not jo then return end if pB then
for A5,dR in ipairs(jo:GetChildren())do if dR:IsA("ScreenGui")and not o.MINE[dR.Name]and dR.Enabled then o.hud[dR]=true dR.Enabled=false end
end if not o.hudConn then o.hudConn=T(jo.ChildAdded:Connect(function(dS)if d.HideHud and dS:IsA("ScreenGui")and not o.MINE[dS.Name]then
task.defer(function()if d.HideHud and dS.Enabled then o.hud[dS]=true dS.Enabled=false end end)end end))end else
for pC in pairs(o.hud)do pcall(function()if pC.Parent then pC.Enabled=true end end)end o.hud={}end end o.CAPS={0,30,15,10}
function o.cap(jp)d.FpsCap=jp local pD=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not pD then return false end return pcall(pD,jp==0 and 60 or jp)end function o.render(pE)d.NoRender=pE pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not pE)end)
end function o.restoreAll()pcall(o.unpin)if D.arPaused then pcall(D.resume,"script stopped")end pcall(o.lite,false)
pcall(o.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)if(d.FpsCap or 0)~=0 then pcall(o.cap,0)end
end function o.rejoinSame(pF)if c.rejoining then return end y("REJOIN this server ("..pF..")")pcall(ez)if c.autoload then pcall(eY,c.autoload)end
hz()local wH=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then c7(pF..", same server failed")end end)return wH end function o.tick()
local jq=o.queue if d.Lite and jq and#jq>0 then o.queue={}for wI,wJ in ipairs(jq)do pcall(o.muteOne,wJ)if wI%300==0 then task.wait()end end
end local pG=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if pG then for A6,wK in ipairs(pG:GetChildren())do
local pH=wK:FindFirstChild("SquishyPlaceHolder")local b3=pH and pH:FindFirstChild("TimerGui")if b3 and b3:IsA("BillboardGui")then
if o.bb[b3]==nil then pcall(o.muteOne,b3)elseif b3 .Enabled then o.bb[b3]=true b3 .Enabled=false end end end end
local wL,dT=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if wL and type(dT)=="number"then
o.mem=dT o.memPeak=math.max(o.memPeak,dT)if(d.MemLimit or 0)>0 and dT>d.MemLimit then o.over=(o.over or 0)+1 if o.over>=30 and not c.busy then
o.over=-600 o.rejoinSame(("memory %d MB > %d MB"):format(dT,d.MemLimit))end elseif(o.over or 0)>0 then o.over=0
end end if x()-(o.noteAt or 0)>1800 then o.noteAt=x()y(("health: %d fps, %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function jr(f0)if type(f0)~="string"then return false end
f0=f0:lower()for A7,wM in ipairs(c.sellWords)do if f0:find(wM,1,true)then return true end end return false end
local function wN()local pI=aq:FindFirstChild("Remotes")local js=pI and pI:FindFirstChild("SellSquishy")if not(js and js:IsA("RemoteEvent"))then return false end
if not pcall(function()js:FireServer()end)then return false end return ak(function()return aa()==nil end,1.5)
end local function wO()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local pJ=ar()local pK=pJ and pJ.HumanoidRootPart.Position local dU,pL for A8,cz in ipairs((c.plot or ax):GetDescendants())do
if cz:IsA("ProximityPrompt")and(jr(cz.ActionText)or jr(cz.ObjectText)or jr(cz.Name))then local pM=k7(cz)local jt=(pM and pK)and(pM-pK).Magnitude or 1e9
if jt<=400 and(not dU or jt<pL)then dU,pL=cz,jt end end end c.sellSpot=dU c.noSellSpot=(dU==nil)return dU end
local function pN()local ju=aa()if not ju then c.holding=false return false end if aQ(ju)then return false end
local jv=ah(ab(ju))if wN()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
y("SOLD "..jv)return true end local cA=wO()if cA then local pO=cU(cA)if pO then cj(pO,cA)local pP=aa()if pP and not aQ(pP)then
local wP,wQ=dc(cA,function()return aa()==nil end,function()return cA.Enabled end)if wP then c.sold,c.holding,c.sellFails=c.sold+1,false,0
y(("SOLD %s at %s via %s"):format(jv,eu(cA),wQ))return true end end end end c.sellFails=c.sellFails+1 y("could not sell "..jv.." ("..c.sellFails..")")
return false end local wR={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function wS(cB)local f1=eu(cB):lower()for A9,wT in ipairs(wR)do if f1:find(wT,1,true)then return 0 end end
local aU,ai=cB.Name:lower(),0 local function aM(wU,wV)return wU:find(wV,1,true)~=nil end if aM(aU,"collect")then ai=ai+60 end
if aM(aU,"cash")or aM(aU,"money")then ai=ai+45 end if aM(aU,"income")or aM(aU,"claim")then ai=ai+35 end if aM(aU,"coin")or aM(aU,"earn")or aM(aU,"green")then ai=ai+20 end
if aU=="pad"or aU=="touch"then ai=ai+25 end if ai==0 and(aM(f1,"collect")or aM(f1,"cash")or aM(f1,"money"))then ai=25 end
if ai==0 then return 0 end local dV=cB.Color if dV.G>0.5 and dV.G>dV.R*1.4 and dV.G>dV.B*1.4 then ai=ai+15 end
if math.min(cB.Size.X,cB.Size.Y,cB.Size.Z)<2 then ai=ai+5 end return ai end local function wW()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local f2,dW,jw={},nil,29 for A_,f3 in ipairs(c.plot:GetDescendants())do
if f3:IsA("BasePart")then local f4=wS(f3)if f4>0 then f2[#f2+1]={s=f4,p=f3}if f4>jw then dW,jw=f3,f4 end end end
end table.sort(f2,function(wX,wY)return wX.s>wY.s end)c.padCands,c.padPart=f2,dW if dW then y("collect pad: "..eu(dW).." (score "..jw..")")end
return dW end local jx="SAB_pad_v1.txt"local function wZ(w0)if type(writefile)=="function"then pcall(writefile,jx,table.concat({w0:GetComponents()},","))end
end local function w1()if type(isfile)~="function"or type(readfile)~="function"then return nil end local w2,pQ=pcall(function()if isfile(jx)then return readfile(jx)end end)
if not w2 or type(pQ)~="string"then return nil end local f5={}for w3 in pQ:gmatch("[^,]+")do f5[#f5+1]=tonumber(w3)end
if#f5==12 then return CFrame.new(unpack(f5))end end local function w4(jy,f6,w5)local w6=c9(jy)local jz=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aN=(jz and jz:IsA("BasePart"))and(jz.Position-f6)or Vector3 .new(1,0,0)aN=Vector3 .new(aN.X,0,aN.Z)if aN.Magnitude<0.05 then aN=Vector3 .new(1,0,0)end
aN=aN.Unit for w7=0,7 do local f7=w7*math.pi/4 local w8=Vector3 .new(aN.X*math.cos(f7)-aN.Z*math.sin(f7),0,aN.X*math.sin(f7)+aN.Z*math.cos(f7))
local f8=f6+w8*(w5+5)local jA=e6(f8 .X,f6 .Y,f8 .Z)if jA and math.abs(jA.Y-f6 .Y)<8 then aF(jy,Vector3 .new(f8 .X,jA.Y+w6,f8 .Z))
if hI(jy,0.7)then return true end end end return false end local function w9()c.lastCollect=x()local dX=ar()if not dX then return end
local pR,w_=dX.HumanoidRootPart,c9(dX)local dY,pS,dZ,jB=nil,4,nil,"?"local jC=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and jC and jC:IsA("BasePart")then dY,jB=(jC.CFrame*c.manualPad).Position,"manual pad"else local a6=wW()
if a6 then dY=Vector3 .new(a6 .Position.X,a6 .Position.Y+a6 .Size.Y/2+w_,a6 .Position.Z)pS,dZ,jB=math.max(a6 .Size.X,a6 .Size.Z)/2,a6,a6 .Name
end end if not dY then y("COLLECT: pad not found - stand on it and tap SET PAD")return end local jD=aY()aF(dX,dY)
if dZ and type(firetouchinterest)=="function"then pcall(firetouchinterest,pR,dZ,0)end ad(d.PadDwell)if dZ and type(firetouchinterest)=="function"then pcall(firetouchinterest,pR,dZ,1)end
ad(0.5)c.collected=c.collected+1 local jE=aY()y(("COLLECTED (%s) %s"):format(jB,(jD and jE and jE>jD)and("+$"..aD(jE-jD))or"no cash change seen"))
w4(dX,dY,pS)end local d0 local function pT()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then c.capHit,c.placeFails=false,0
y("trying again after being stopped for 5 minutes")d0(true,true)else return nil,c.capMsg,"bad"end end if c.busy then return nil,c.busyText,"ok"end
if not ar()then return nil,"waiting for character","wait"end if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bf(),nil,nil
if not c.plot then return nil,"own plot not found yet","wait"end end if not next(d.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local jF,pU=ew()local f9=aa()if f9 then local cC=ah(ab(f9))if not aQ(f9)then local jG=(Q.gift and ab(Q.gift)==ab(f9)and x()-Q.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cC,jG),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cC,jG),"bad"end return"sell",("selling %s (%s)"):format(cC,jG),"warn"
end if jF<1 then return nil,("holding %s - 0 free stations"):format(cC),"wait"end if q.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cC),"wait"end
return"place",("waxing %s (%d free)"):format(cC,jF),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local jH=c.plot:FindFirstChild("CrateStand")if jH then for Ba,d1 in ipairs(jH:GetDescendants())do
if d1:IsA("ProximityPrompt")and d1 .Enabled and hY(d1)then local a7=d1 .ObjectText if a7==""then a7=cc(jH,"TitleLabel")or""end
if a7~=""and L.wanted(a7)then local xa=es(a7):gsub("crate$","")local pV for pW in pairs(W.members)do if es(pW)==xa then pV=pW end end
e.waiting,e.at,e.title,e.prompt=true,x(),a7,d1 e.data={name=(a7:gsub("%s","")),rarity=pV,title=a7}y(a7 .." found waiting on your stand")
end break end end end end local pX=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and pX then
local a8=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a8),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 y("could not press the "..a8 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a8),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a8),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a8,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a8),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(a8),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a8),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(a8,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not pX then local pY=e.title..tostring(e.rolledAt)if e.told~=pY then e.told=pY y(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if jF<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(pU,pU),"wait"
end local jI=lk()if not jI then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local d2=bJ()
if d2 and mH(d2 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(d2 .name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(d2 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(d2 .name),"ok"
end local bv=hG()if bv.state~="match"then c.matchSince=nil if bv.state=="skip"and not jI.Enabled then return nil,bv.text.." (sold out)","idle"end
return nil,bv.text,bv.level end if not jI.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local d3=x()if d3<c.noCashUntil then local pZ,xb=mg()if pZ then return nil,("cash short: have $%s, price ~$%s"):format(aD(pZ),aD(xb)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aD(aY()),math.ceil(c.noCashUntil-d3)),"bad"end if d3-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or d3 local p0=d3-c.matchSince if p0<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bv.shown,p0),"ok"end
return"buy",("buying %s via %s"):format(bv.shown,bv.src),"ok"end o.DEPTH=11 function o.pinTick()local p1=o.hold
if not p1 then return end local jJ=J.Character local jK=jJ and jJ:FindFirstChild("HumanoidRootPart")if not jK then return end
jK.CFrame=p1 jK.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Bb,f_ in ipairs(jJ:GetChildren())do if f_:IsA("BasePart")and f_.CanCollide then o.noclip[f_]=true f_.CanCollide=false end
end end o.noclip=setmetatable({},{__mode="k"})function o.pin(xc,p2)o.hold=xc if p2 then o.surface=p2 end end function o.unpin(xd)
if not o.hold then return end o.hold=nil for p3 in pairs(o.noclip)do pcall(function()if p3 .Parent then p3 .CanCollide=true end end)end
o.noclip=setmetatable({},{__mode="k"})local p4=ar()if p4 and o.surface and not xd then aF(p4,o.surface.Position,o.surface.Position+o.surface.LookVector)
ad(0.1)end end function o.home()local a9,p5=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ar()
if not(a9 and a9:IsA("BasePart")and p5)then return nil end local p6=k_()or a9 .Position local ga=Vector3 .new(p6 .X-a9 .Position.X,0,p6 .Z-a9 .Position.Z)
ga=ga.Magnitude>0.1 and ga.Unit or Vector3 .new(0,0,1)local gb=a9 .Position+ga*6 local p7=e6(gb.X,a9 .Position.Y,gb.Z,{a9})
return CFrame.new(gb.X,(p7 and p7 .Y or a9 .Position.Y)+c9(p5),gb.Z)end function o.parkHome()local jL=o.home()
if not jL then return false end o.pin(jL-Vector3 .new(0,o.DEPTH,0),jL)return true end function o.parkTick()if not(d.Ghost and c.running)or o.hold or c.busy then return end
local xe=ar()if not xe or K.seat()then return end o.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local p8=J.Character local p9=p8 and p8:FindFirstChildOfClass("Humanoid")local jM=p9 and p9 .SeatPart
return(jM and jM.Name=="LogSeat")and jM or nil end function K.due()if not(d.Campfire and c.running)or x()<K.nextAt then return false end
local xf=ax:FindFirstChild("NightSeats")if not xf then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire right now (it comes with every weather event)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or x()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
y(K.msg)return false end end return true end function K.sit()local p_,gc=ax:FindFirstChild("NightSeats"),ar()
if not p_ or not gc then return end local qa,cD=gc.HumanoidRootPart.Position,{}for Bc,gd in ipairs(p_:GetChildren())do
local qb=gd:IsA("Seat")and gd.Occupant==nil and gd:FindFirstChildOfClass("ProximityPrompt")if qb then cD[#cD+1]={st=gd,p=qb}end
end if#cD==0 then K.nextAt,K.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cD,function(xg,xh)return(xg.st.Position-qa).Magnitude<(xh.st.Position-qa).Magnitude end)
local xi,xj=cD[1].st,cD[1].p o.unpin(true)local cE=xi.CFrame aF(gc,cE.Position+cE.LookVector*2+Vector3 .new(0,2.5,0),cE.Position)
ad(0.25)local xk=dc(xj,function()return K.seat()~=nil end)if not xk then aF(gc,cE.Position+Vector3 .new(0,2,0),cE.Position+cE.LookVector)
ak(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,x()y(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=x()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then y(K.msg)end end end D.msg,D.nextAt,D.at,D.pulls,D.claims,D.pullLeft,D.collectLeft,D.events="",0,0,0,0,0,0,{}
function D.refresh()D.at=x()local jN=aq:FindFirstChild("Remotes")if not jN then return end local d4,jO,cF=0,0,{}
local xl,qc=pcall(function()return jN.ClanRequest:InvokeServer("state")end)local qd=xl and type(qc)=="table"and qc.tasks
for Bd,bw in ipairs(qd and qd.list or{})do if not bw.done and bw.kind=="pull"then d4=math.max(d4,(bw.goal or 0)-(bw.progress or 0))end
if not bw.done then cF[#cF+1]=("%s %d/%d"):format(tostring(bw.text),bw.progress or 0,bw.goal or 0)end end D.events={}
for Be,cG in ipairs(jN:GetChildren())do if cG:IsA("RemoteFunction")and cG.Name:match("^%u%a+Action$")and cG.Name~="CrateAction"and cG.Name~="AutoRollAction"then
local xm,d5=pcall(function()return cG:InvokeServer("state")end)if xm and type(d5)=="table"and d5 .live==true and type(d5 .quests)=="table"then
D.events[#D.events+1]={r=cG,st=d5}for Bf,aI in ipairs(d5 .quests)do if not aI.done and aI.kind=="pull"then d4=math.max(d4,(aI.goal or 0)-(aI.progress or 0))end
if not aI.done and aI.kind=="collect"then jO=math.max(jO,(aI.goal or 0)-(aI.progress or 0))end if not aI.done then cF[#cF+1]=("%s %d/%d"):format(tostring(aI.text),aI.progress or 0,aI.goal or 0)end
end end end end D.pullLeft,D.collectLeft=d4,jO D.msg=#cF>0 and("open: "..table.concat(cF,", "))or"all quests done for today"
end function D.claim()for Bg,d6 in ipairs(D.events)do local qe=d6 .r.Name:gsub("Action$","")for Bh,cH in ipairs(d6 .st.quests)do
if cH.done and not cH.claimed then local xn,qf=pcall(function()return d6 .r:InvokeServer("claimQuest",cH.id)end)
if xn and not(type(qf)=="table"and qf.ok==false)then D.claims=D.claims+1 y(("CLAIMED %s quest: %s (+%s)"):format(qe,tostring(cH.text),tostring(cH.points or cH.treats or"?")))
end ad(0.4)end end if d6 .st.bonusReady==true then local xo=pcall(function()return d6 .r:InvokeServer("claimBonus")end)
if xo then y(("CLAIMED %s daily quest bonus"):format(qe))end ad(0.4)end end end function D.tick()if not(d.Quests and c.running)then
if D.arPaused then D.resume("quests switched off")end return end if x()-D.at<(D.pullLeft>0 and 20 or 90)then return end
D.refresh()pcall(D.claim)if D.pullLeft<=0 and D.arPaused then D.resume("lever quests done")end end function D.pullDue()
return d.Quests and c.running and D.pullLeft>0 and x()>=D.nextAt and not A.busy end function D.lever()local qg=c.plot and c.plot:FindFirstChild("Lever")
local jP=qg and qg:FindFirstChild("Wheel")return jP and jP:FindFirstChildWhichIsA("ProximityPrompt"),jP end function D.resume(xp)
D.arPaused=false if D.arWas then D.arWas=false d.AutoRoll=true task.spawn(A.apply,xp)end end function D.pull()
local ge,jQ=D.lever()if not ge or not jQ or not jQ:IsA("BasePart")then D.nextAt,D.msg=x()+300,"your lever was not found"return end
if not D.arPaused then D.arPaused=true D.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false A.apply("pulling the lever for a quest",true)
if A.isOn()then D.nextAt=x()+30 return end end y(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(D.pullLeft))
end if not ge.Enabled then D.nextAt=x()+1 return end cj(jQ,ge)D.asked=nil mv(ge)D.pulls=D.pulls+1 D.pullLeft=D.pullLeft-1
ad(0.6)if D.asked then D.nextAt=x()+600 y(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(D.asked)))
D.resume("a butter the game wants kept is on the pad")return end D.nextAt=x()+2.5 if D.pullLeft<=0 then D.at=0 end
end C.skip,C.skipN,C.n,C.calls,C.fails,C.nextAt,C.msg,C.tries={},0,0,0,0,0,"off",{}function C.can(bx,xq)local jR=bx:GetAttribute("PourOwner")
if type(jR)~="number"or jR==j.uid or not bx:GetAttribute("HasSquishy")then return false end if bx:GetAttribute("PourLong")~=true or bx:GetAttribute("PourFull")==true then return false end
local jS=bx:GetAttribute("PourId")if jS==nil or C.skip[jS]then return false end local qh,jT,xr=bx:GetAttribute("Helpers"),0,tostring(j.uid)
if type(qh)=="string"then for xs in qh:gmatch("[^,%s]+")do jT=jT+1 if xs==xr then return false end end end if jT>=6 then return false end
local gf=q.left(bx)if not gf then local qi=tonumber(bx:GetAttribute("PourEnd"))gf=qi and(qi-xq)end if not gf or gf<=75 then return false end
local jU=game:GetService("Players"):GetPlayerByUserId(jR)if not jU or jU:GetAttribute("WaxHelpOff")==true then return false end
return true,jU,jS end function C.list()local jV,xt={},j.srv()local qj=ax:FindFirstChild("Plots")for Bi,qk in ipairs(qj and qj:GetChildren()or{})do
local ql=qk~=c.plot and qk:FindFirstChild("WaxStations")for Bj,jW in ipairs(ql and ql:GetChildren()or{})do local xu,xv,xw=C.can(jW,xt)
local jX=xu and jW:FindFirstChild("SquishyPlaceHolder")if jX and jX:IsA("BasePart")then jV[#jV+1]={st=jW,p=xv,id=xw,part=jX}end
end end return jV end function C.due()return d.Help and c.running and x()>=C.nextAt end function C.skipIt(qm,qn)
C.skip[qm],C.skipN=qn,C.skipN+1 if C.skipN>600 then C.skip,C.skipN,C.tries={[qm]=qn},1,{}end end function C.goHome()
local gg,by=ar(),C.home C.home=nil if not(gg and by)then return end if d.Ghost and not K.seat()then o.unpin(true)
if not o.parkHome()then pcall(aF,gg,by.Position,by.Position+by.LookVector)end elseif o.hold or(gg.HumanoidRootPart.Position-by.Position).Magnitude>20 then
o.unpin(true)pcall(aF,gg,by.Position,by.Position+by.LookVector)end end function C.step()local jY,d7=C.list(),ar()
if#jY==0 or not d7 then C.nextAt=x()+15 C.msg=("helped %d waxes here%s | none to help right now"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")
C.goHome()return end local qo=d7 .HumanoidRootPart local qp=qo.Position table.sort(jY,function(xx,xy)return(xx.part.Position-qp).Magnitude<(xy.part.Position-qp).Magnitude end)
local aO=jY[1]C.home=C.home or(o.hold and o.surface)or qo.CFrame local bz=aO.part local b4=(bz.Position+aO.st:GetPivot().Position)/2
local gh=C.tries[aO.id]or 0 if d.Ghost and gh==0 and not K.seat()then o.pin(CFrame.new(b4 .X,bz.Position.Y-o.DEPTH,b4 .Z))
else o.unpin(true)local jZ=gh==0 and e6(b4 .X,bz.Position.Y,b4 .Z,{bz})if jZ and math.abs(jZ.Y-bz.Position.Y)<8 then
aF(d7,Vector3 .new(b4 .X,jZ.Y+c9(d7),b4 .Z),bz.Position)else aF(d7,bz.Position+Vector3 .new(0,bz.Size.Y/2+3,0),b4)
end end ad(0.3)local d8=aq:FindFirstChild("Remotes")d8=d8 and d8:FindFirstChild("ClanRequest")if not d8 then C.nextAt,C.msg=x()+60,"the game's help remote is missing"return end
local gi,a_=pcall(function()return d8:InvokeServer("help",aO.st:GetAttribute("PourOwner"),tonumber(aO.st.Name))end)
if gi and type(a_)=="table"and a_.ok then C.n,C.fails=C.n+1,0 C.skipIt(aO.id,"helped")y(("HELPED %s's wax (station %s)"):format(aO.p.DisplayName,aO.st.Name))
C.msg=("helped %d waxes here%s"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")elseif gi and type(a_)=="table"and tostring(a_.reason or""):lower():find("walk up",1,true)and gh<2 then
C.tries[aO.id]=gh+1 C.nextAt=x()+0.3 elseif gi and type(a_)=="table"and tostring(a_.reason or""):lower():find("moment",1,true)then
C.waits=(C.waits or 0)+1 C.nextAt=x()+1.6 else local qq=(gi and type(a_)=="table"and tostring(a_.reason or"refused"))or("error: "..tostring(a_))
C.skipIt(aO.id,qq)C.fails=C.fails+1 if C.fails<=3 then y(("help refused for %s's wax: %s"):format(aO.p.DisplayName,qq))end
if C.fails>=5 then C.fails,C.nextAt,C.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
C.goHome()end end C.nextAt=math.max(C.nextAt,x()+1.2)end function C.onCall(ba)if not d.HelpGuild or type(ba)~="table"or ba.p~="help"or ba.mine or ba.u==j.uid or not ba.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local d9=aq:FindFirstChild("Remotes")
d9=d9 and d9:FindFirstChild("ClanRequest")if not d9 then return end local qr,d_=pcall(function()return d9:InvokeServer("callHelp",ba.u)end)
local qs=tostring(ba.n or ba.un or ba.u)if qr and type(d_)=="table"and d_.ok then C.calls=C.calls+1 y(("HELPED guildmate %s's wax from here (their call)"):format(qs))
else y(("guild call from %s: %s"):format(qs,(qr and type(d_)=="table"and tostring(d_.reason or"refused"))or tostring(d_)))
end end)end local function ao(xz,qt,...)if c.busy then return end c.busy,c.busyText=true,xz if o.hold and qt~=C.step then pcall(o.unpin)end
local xA,qu=pcall(qt,...)c.busy,c.busyText=false,""if not xA and qu~=gR then y("ERR "..tostring(qu))end end local function xC()
local aV,xD,xE=pT()c.reason,c.level=xD,xE if aV=="place"then ao("waxing...",q.place)elseif aV=="crate"then ao("opening crate...",fi,true)
elseif aV=="cratesmart"then ao("opening crate...",e.smart)elseif aV=="cratewin"then ao("opening the crate window...",h0)
elseif aV=="nocrate"then ao("discarding crate...",fi,false)elseif aV=="sell"then ao("selling...",pN)elseif aV=="buy"then ao("buying...",my,false)
elseif not aV and not c.matchSince and K.due()then ao("sitting at the campfire...",K.sit)elseif not aV and not c.matchSince and D.pullDue()and not aa()and not(bJ()and aQ(bJ().name))then
ao("pulling the lever for a quest...",D.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(D.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ao("collecting money...",w9)elseif not aV and not c.matchSince and C.due()then ao("helping a wax...",C.step)elseif C.home and not d.Help then
ao("coming back...",C.goHome)elseif not c.busy then o.parkTick()end end function d0(gj,xF)if gj==c.running then return end
c.running=gj if not xF then d.AutoStart=gj end if gj then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bf()or c.plot
y("START")else c.reason="stopped"y("STOP")end end do local bA=eT(af.auto)if type(bA)=="string"then bA=bA:gsub("%s+$","")
if bA~=""then c.autoload=bA local xG=l5(bA)y(xG and("loaded config "..bA)or("config "..bA.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local xH={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}local qv={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function N(xI,xJ,xK)local xL,j0=pcall(Instance.new,xI)
if not xL then c.uiErrs=c.uiErrs+1 return nil end for xM,xN in pairs(xJ)do if not pcall(function()j0[xM]=xN end)then c.uiErrs=c.uiErrs+1 end
end j0 .Parent=xK return j0 end local function al(xO,xP)N("UICorner",{CornerRadius=UDim.new(0,xP or 6)},xO)end
local a={}local j1=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")local qw=j1:FindFirstChild("SABFarmGui")
if qw then qw:Destroy()end local j2=N("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},j1)
local aj={w=320,h=330,head=30,strip=38,tabs=26}a.root=N("Frame",{Name="Root",Size=UDim2 .new(0,aj.w,0,aj.h),Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),
BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},j2)al(a.root,10)N("UIStroke",{Color=l.line,Thickness=1},a.root)
local bc=UDim2 .new(1,0,1,0)local function F(qx,qy)return UDim2 .new(qx,0,0,0),UDim2 .new(qy,(qx+qy>0.99)and 0 or-4,1,0)end
local function E(xQ,xR,xS,xT,xU,xV)local qz=N("TextButton",{Text=xR,Position=xU,Size=xV,BackgroundColor3=xS,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=xT,TextColor3=l.text,AutoButtonColor=true},xQ)al(qz,6)return qz end local function gk(xW,xX,xY,xZ,x0)
local j3=N("TextBox",{Text=xX,PlaceholderText=xY,Position=xZ,Size=x0,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=l.text,PlaceholderColor3=l.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},xW)al(j3,6)N("UIPadding",{PaddingLeft=UDim.new(0,8)},j3)
return j3 end local gl=ax.CurrentCamera local function x1()local x2,gm=pcall(function()return gl and gl.ViewportSize end)
if x2 and gm and gm.X>50 and gm.Y>50 then return gm end end local function bB(ea)local j4=x1()if not(j4 and ea and ea.Parent)then return end
local x3=pcall(function()local gn,qA=ea.AbsolutePosition,ea.AbsoluteSize local j5=70 local qB=math.clamp(gn.X,j5-qA.X,j4 .X-j5)
local qC=math.clamp(gn.Y,0,j4 .Y-math.min(qA.Y,j5))if math.abs(qB-gn.X)>0.5 or math.abs(qC-gn.Y)>0.5 then ea.Position=UDim2 .new(0,math.floor(qB),0,math.floor(qC))
end end)return x3 end local function go(x4)local x5,j6=pcall(function()return x4 .AbsolutePosition end)if x5 and j6 then return{math.floor(j6 .X),math.floor(j6 .Y)}end
end local cI={}c.dragMoved={}local function qD(eb,qE,j7)T(eb.InputBegan:Connect(function(cJ)if cJ.UserInputType~=Enum.UserInputType.MouseButton1 and cJ.UserInputType~=Enum.UserInputType.Touch then return end
local j8={start=cJ.Position,from=qE.Position,moved=0,target=qE,input=cJ,onDrop=j7}cI[eb],c.dragMoved[eb]=j8,0
local j9 j9=cJ.Changed:Connect(function()if cJ.UserInputState==Enum.UserInputState.End and cI[eb]==j8 then cI[eb]=nil
if j9 then j9:Disconnect()end if j7 then j7(j8 .moved)end end end)end))end T(kT.InputChanged:Connect(function(gp)
if gp.UserInputType~=Enum.UserInputType.MouseMovement and gp.UserInputType~=Enum.UserInputType.Touch then return end
for x6,aW in pairs(cI)do local j_=aW.target if j_ and j_.Parent then local qF,qG=gp.Position.X-aW.start.X,gp.Position.Y-aW.start.Y
aW.moved=math.max(aW.moved,math.abs(qF)+math.abs(qG))c.dragMoved[x6]=aW.moved j_.Position=UDim2 .new(aW.from.X.Scale,aW.from.X.Offset+qF,aW.from.Y.Scale,aW.from.Y.Offset+qG)
end end end))T(kT.InputEnded:Connect(function(gq)if gq.UserInputType~=Enum.UserInputType.MouseButton1 and gq.UserInputType~=Enum.UserInputType.Touch then return end
for x7,gr in pairs(cI)do if gr.input==gq or gq.UserInputType==Enum.UserInputType.MouseButton1 then cI[x7]=nil
if gr.onDrop then gr.onDrop(gr.moved)end end end end))local function O(x8,x9,x_,ya,yb,yc,yd)return N("TextLabel",{Text=x9,Position=yc or UDim2 .new(0,0,0,0),Size=yd or bc,BackgroundTransparency=1,
Font=yb and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=x_,TextColor3=ya,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},x8)
end a.title=N("Frame",{Size=UDim2 .new(1,0,0,aj.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=N("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.title)
al(a.dot,5)O(a.title,"SAB  BUTTER FARM  "..b8,12,l.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=E(a.title,"-",l.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=E(a.title,"X",l.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=N("Frame",{Position=UDim2 .new(0,0,0,aj.head),Size=UDim2 .new(1,0,0,aj.strip),BackgroundColor3=l.bg,BorderSizePixel=0},a.root)
a.bar=N("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
al(a.bar,2)a.reason=O(a.strip,"starting",12,l.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=N("Frame",{Position=UDim2 .new(0,0,0,aj.head+aj.strip),Size=UDim2 .new(1,0,0,aj.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=E(a.tabs,"FARM",l.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=E(a.tabs,"BUTTERS",l.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=E(a.tabs,"CRATES",l.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=E(a.tabs,"PETS",l.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=E(a.tabs,"TEAMS",l.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=E(a.tabs,"SETUP",l.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function cK()local ka=N("ScrollingFrame",{Position=UDim2 .new(0,0,0,aj.head+aj.strip+aj.tabs),Size=UDim2 .new(1,0,1,-(aj.head+aj.strip+aj.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
N("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},ka)N("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},ka)
return ka end a.farm,a.but,a.set,a.crt=cK(),cK(),cK(),cK()a.pet,a.team=cK(),cK()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local gs,ec,H=0,12,nil local function ag(qH,ye)gs,ec=gs+1,ec+qH+6 return N("Frame",{Size=UDim2 .new(1,0,0,qH),BackgroundTransparency=1,LayoutOrder=gs},ye or a.farm)
end local function bC(yf)O(ag(14),yf,10,l.dim,true)end H=ag(34)a.startB=E(H,"START",l.good,14,F(0,0.68))a.killB=E(H,"KILL",l.bad,14,F(0.68,0.32))
local yg=ag(42)local function ed(qI,yh,kb)local kc=N("Frame",{Position=UDim2 .new((qI-1)/kb,0,0,0),Size=UDim2 .new(1/kb,qI<kb and-4 or 0,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},yg)al(kc,6)local qJ=O(kc,"0",15,l.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local yi=O(kc,yh,9,l.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))qJ.TextXAlignment,yi.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return qJ end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=ed(1,"BOUGHT",5),ed(2,"WAXED",5),ed(3,"SOLD",5),ed(4,"MONEY",5),ed(5,"FREE",5)
a.info=O(ag(40),"",10,l.dim,false)a.tgt=O(ag(26),"",10,l.good,false)bC("MONEY COLLECT")H=ag(28)a.secB=gk(H,tostring(d.Every),"60",F(0,0.2))
O(H,"sec",11,l.dim,false,F(0.21,0.09))a.secSet=E(H,"SET",l.accent,12,F(0.3,0.2))a.colT=E(H,"COLLECT: ON",l.accent,11,F(0.5,0.5))
H=ag(26)a.padB=E(H,"SET PAD (stand on it)",l.panel2,10,F(0,0.55))a.padL=O(H,"",10,l.dim,false,F(0.56,0.44))bC("BUTTERS YOU DID NOT TICK, AND CRATES")
H=ag(28)a.sellT=E(H,"SELL THEM: ON",l.accent,11,F(0,0.55))a.sellB=E(H,"SELL NOW",l.warn,11,F(0.55,0.45))H=ag(28)
a.crateT=E(H,"OPEN CRATES: ON",l.accent,11,F(0,0.55))a.crateB=E(H,"OPEN NOW",l.warn,11,F(0.55,0.45))bC("HELP OTHER PLAYERS' WAXES  (10% off their wax each)")
H=ag(28)a.helpT=E(H,"HELP WAXES: OFF",l.panel2,10,F(0,0.5))a.helpGT=E(H,"GUILD CALLS: OFF",l.panel2,10,F(0.5,0.5))
a.helpL=O(ag(14),"",9,l.dim,false)bC("EVENT CAMPFIRE  /  STAYING OUT OF SIGHT")H=ag(28)a.campT=E(H,"CAMPFIRE: OFF",l.panel2,10,F(0,0.5))
a.ghostT=E(H,"GHOST: OFF",l.panel2,10,F(0.5,0.5))a.campL=O(ag(14),"",9,l.dim,false)bC("QUESTS  (claims event quests; pulls the lever / collects for quests that ask)")
a.questT=E(ag(28),"QUESTS: OFF",l.panel2,10,F(0,1))a.questL=O(ag(28),"",9,l.dim,false)bC("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
H=ag(28)a.arT=E(H,"AUTO ROLL: OFF",l.panel2,11,F(0,0.5))a.arL=O(H,"",9,l.dim,false,F(0.52,0.48))bC("TOOLS")H=ag(30)
a.buyB=E(H,"BUY",l.warn,10,F(0,0.5))a.plB=E(H,"WAX",l.good,10,F(0.5,0.5))bC("LOG")a.log=N("TextLabel",{Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},ag(84))al(a.log,6)N("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,ec)gs,ec=0,12 local function am(yj)return ag(yj,a.set)end local function ee(yk)O(am(14),yk,10,l.dim,true)end
ee("SETTINGS FILE  (saved on your phone)")H=am(28)a.cfgName=gk(H,"default","config name",F(0,0.5))a.cfgSave=E(H,"SAVE",l.good,11,F(0.5,0.25))
a.cfgLoad=E(H,"LOAD",l.accent,11,F(0.75,0.25))H=am(26)a.cfgPrev=E(H,"<",l.panel2,11,F(0,0.13))a.cfgPick=E(H,"(none saved)",l.panel2,10,F(0.13,0.74))
a.cfgNext=E(H,">",l.panel2,11,F(0.87,0.13))H=am(26)a.cfgAuto=E(H,"LOAD IT ON LAUNCH: OFF",l.panel2,10,F(0,1))
a.cfgMsg=O(am(26),"",10,l.dim,false)ee("START BY ITSELF")H=am(26)a.autoB=E(H,"INSTALL F.exec",l.accent,10,F(0,1))
a.autoMsg=O(am(30),"",10,l.dim,false)H=am(28)a.startT=E(H,"START FARMING ON LOAD: ON",l.accent,10,F(0,1))O(am(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,l.dim,false)
ee("IF THE GAME DROPS ME")H=am(28)a.rejT=E(H,"AUTO REJOIN: ON",l.accent,11,F(0,0.55))a.rejB=E(H,"REJOIN NOW",l.warn,11,F(0.55,0.45))
a.rejMsg=O(am(30),"",10,l.dim,false)ee("SMOOTHER RUNNING  (for long / overnight runs)")H=am(28)a.pfLite=E(H,"LITE MODE: OFF",l.panel2,10,F(0,0.5))
a.pfHud=E(H,"HIDE GAME HUD: OFF",l.panel2,10,F(0.5,0.5))H=am(28)a.pfFps=E(H,"FPS CAP: GAME",l.panel2,10,F(0,0.5))
a.pfRender=E(H,"STOP 3D: OFF",l.panel2,10,F(0.5,0.5))H=am(28)a.pfMem=gk(H,tostring(d.MemLimit),"2000",F(0,0.24))
O(H,"MB: rejoin this server above it (0 = never)",9,l.dim,false,F(0.26,0.52))a.pfMemSet=E(H,"SET",l.accent,11,F(0.8,0.2))
a.pfInfo=O(am(18),"",10,l.text,false)O(am(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,l.dim,false)
ee("THE ROUND SAB BUTTON")O(am(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,l.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,ec)local qK=N("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},j1)
a.tgRoot=N("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},qK)al(a.tgRoot,20)N("UIStroke",{Color=l.line,Thickness=1},a.tgRoot)
a.tgBtn=N("TextButton",{Text="SAB",Size=bc,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=l.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=N("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
al(a.tgDot,4)local bd={built=false,boxes={},at=0}local function qL(qM,kd)d.Targets[qM]=kd or nil local ke=bd.boxes[qM]
if ke then ke.Text=kd and"X"or""ke.BackgroundColor3=kd and l.good or l.panel2 end end local function kf()for yl,qN in pairs(bd.boxes)do
local qO=d.Targets[yl]==true qN.Text=qO and"X"or""qN.BackgroundColor3=qO and l.good or l.panel2 end end local ef
local function ym()local yn=0 local kg=N("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=O(kg,"",10,l.dim,false,F(0,0.5))local yo=E(kg,"CLEAR",l.panel2,10,F(0.5,0.24))local yp=E(kg,"REFRESH",l.panel2,10,F(0.74,0.26))
yo.MouseButton1Click:Connect(function()for yq in pairs(d.Targets)do d.Targets[yq]=nil end kf()end)yp.MouseButton1Click:Connect(function()
W.at=0 hr()ef(true)end)return yn end ef=function(yr)if not hr()then if not a.butEmpty then a.butEmpty=O(N("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)end return end if bd.built and not yr and bd.at==W.at then return end
for Bk,kh in ipairs(a.but:GetChildren())do if kh:IsA("Frame")or kh:IsA("TextButton")then kh:Destroy()end end bd.boxes,a.butEmpty={},nil
ym()local ki,kj=36,1 local function qP(qQ)kj=kj+1 local ys=N("Frame",{Size=UDim2 .new(1,0,0,qQ),BackgroundTransparency=1,LayoutOrder=kj},a.but)
ki=ki+qQ+6 return ys end for Bl,gt in ipairs(W.rarOrder)do local yt=qP(24)local yu=qv[gt]or l.text local kk=N("Frame",{Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0},yt)
al(kk,6)O(kk,"  "..gt:upper(),11,yu,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local yv=E(kk,"ALL",l.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local yw=gt yv.MouseButton1Click:Connect(function()local qR=W.members[yw]or{}local qS=false for Bm,yx in ipairs(qR)do if not d.Targets[yx]then qS=true break end end
for Bn,yy in ipairs(qR)do qL(yy,qS)end end)for Bo,kl in ipairs(W.members[gt]or{})do local yz=qP(22)local gu=N("TextButton",{Text="",Size=bc,BackgroundColor3=l.bg,BorderSizePixel=0,
AutoButtonColor=true},yz)al(gu,5)O(gu,"   "..ah(kl),11,l.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local km=N("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},gu)al(km,4)bd.boxes[kl]=km local qT=kl local function qU()qL(qT,not d.Targets[qT])end
gu.MouseButton1Click:Connect(qU)km.MouseButton1Click:Connect(qU)end end kf()a.but.CanvasSize=UDim2 .new(0,0,0,ki+10)
bd.built,bd.at=true,W.at end function L.paint()for yA,qV in pairs(L.boxes)do local qW=d.CrateTicks[yA]==true qV.Text=qW and"X"or""
qV.BackgroundColor3=qW and l.good or l.panel2 end if a.crtInfo then local kn,ko=0,0 for Bp in pairs(L.boxes)do kn=kn+1 end
for Bq,yB in pairs(d.CrateTicks)do if yB then ko=ko+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(kn,ko)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and l.accent or l.panel2
end end function L.build()for Br,kp in ipairs(a.crt:GetChildren())do if kp:IsA("Frame")or kp:IsA("TextButton")then kp:Destroy()end
end L.boxes={}local kq,kr=12,0 local function gv(qX)kr=kr+1 kq=kq+qX+6 return N("Frame",{Size=UDim2 .new(1,0,0,qX),BackgroundTransparency=1,LayoutOrder=kr},a.crt)
end local ks=gv(28)a.crtInfo=O(ks,"",10,l.dim,false,F(0,0.5))local yC=E(ks,"CLEAR",l.panel2,10,F(0.5,0.24))local yD=E(ks,"REFRESH",l.panel2,10,F(0.74,0.26))
T(yC.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(yD.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=E(gv(28),"",l.accent,11,F(0,1))T(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
O(gv(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,l.dim,false)
for Bs,be in ipairs(L.list())do local yE=gv(24)local eg=N("TextButton",{Text="",Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0,AutoButtonColor=true},yE)
al(eg,5)O(eg,"  "..(be.title or be.name)..(be.guess and"  (?)"or""),11,qv[be.rar or""]or l.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
O(eg,be.price and("$"..aD(be.price))or(be.rar or""),9,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local kt=N("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},eg)al(kt,4)L.boxes[be.k]=kt local qY=be.k local function qZ()d.CrateTicks[qY]=(not d.CrateTicks[qY])or nil
L.paint()end T(eg.MouseButton1Click:Connect(qZ))T(kt.MouseButton1Click:Connect(qZ))end a.crt.CanvasSize=UDim2 .new(0,0,0,kq+10)
L.built=L.at L.paint()end local q0="farm"local function bD(an)q0=an a.farm.Visible,a.but.Visible,a.set.Visible=(an=="farm"),(an=="but"),(an=="set")
a.crt.Visible=(an=="crt")a.pet.Visible,a.team.Visible=(an=="pet"),(an=="team")a.tabCrt.BackgroundColor3=(an=="crt")and l.accent or l.panel2
a.tabPet.BackgroundColor3=(an=="pet")and l.accent or l.panel2 a.tabTeam.BackgroundColor3=(an=="team")and l.accent or l.panel2
if an=="pet"and not j.built then pcall(j.build)end if an=="team"and not q.built then pcall(q.build)end if an=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(an=="farm")and l.accent or l.panel2 a.tabBut.BackgroundColor3=(an=="but")and l.accent or l.panel2
a.tabSet.BackgroundColor3=(an=="set")and l.accent or l.panel2 if an=="but"then ef(false)end end local function M(q1,q2,yF,yG)
q1 .Text=q2 and yF or yG q1 .BackgroundColor3=q2 and l.accent or l.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(q3)
local b5=j.rows and j.rows[q3]if not b5 then return end local eh=d.Pets[q3]or{}b5 .b.BackgroundColor3=eh.b and l.good or l.panel2
b5 .g.BackgroundColor3=eh.g and l.accent or l.panel2 b5 .g.Text=eh.g and"BIG"or"ANY"b5 .w.BackgroundColor3=eh.w and l.warn or l.panel2
local ku=tonumber(eh.f)or 0 b5 .f.Text=ku>0 and(ku.." BIG")or"FUSE"b5 .f.BackgroundColor3=ku>0 and l.good or l.panel2
end function j.flag(kv,gw)local aX=d.Pets[kv]or{}if gw=="f"then local q4=((tonumber(aX.f)or 0)+1)%4 aX.f=q4>0 and q4 or nil
elseif aX[gw]then aX[gw]=nil else aX[gw]=true end d.Pets[kv]=(aX.b or aX.g or aX.w or aX.f)and aX or nil j.paintRow(kv)
end function j.paintAll()for yH in pairs(j.rows or{})do j.paintRow(yH)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function j.live()if not j.built then j.build()return end if x()-(j.liveAt or 0)<1 then return end j.liveAt=x()
local q5=j.wishes()local ei=j.data()for gx,gy in pairs(j.rows)do gy.name.Text=j.nice(gx)..(q5[gx]and("   * wish %dm"):format(math.ceil(q5[gx]/60))or"")
local q6=z.status(gx,ei)gy.desc.Text=q6 and(q6 .." | "..gy.boostText)or gy.boostText end local q7=tonumber(J:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(ei and#(ei.pets or{})or 0,ei and tonumber(ei.maxOwned)or 60,
aD(j.money()),q7>0 and(" | free wishes "..q7)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local gz=j.info()for Bt,kw in ipairs(a.pet:GetChildren())do if kw:IsA("Frame")or kw:IsA("TextLabel")then kw:Destroy()end
end j.rows={}local kx,gA=0,12 local function cL(q8)kx,gA=kx+1,gA+q8+6 return N("Frame",{Size=UDim2 .new(1,0,0,q8),BackgroundTransparency=1,LayoutOrder=kx},a.pet)
end local ky=cL(28)a.pbT=E(ky,"AUTO ADOPT: OFF",l.panel2,9,F(0,0.34))a.pwT=E(ky,"AUTO WISH: OFF",l.panel2,9,F(0.34,0.33))
a.pfT=E(ky,"AUTO FUSE: OFF",l.panel2,9,F(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy j.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish j.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse j.paintAll()end)
a.pInfo=O(cL(44),"",10,l.dim,false)O(cL(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,l.dim,false)
if not gz then O(cL(30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,gA)
j.built=false return end local cM={}for Bu,q9 in ipairs(j.order())do local kz=gz.Pets[q9].rarity or"?"cM[kz]=cM[kz]or{}
table.insert(cM[kz],q9)end local cN={}for Bv,q_ in ipairs(gz.Rarities or{})do if cM[q_]then cN[#cN+1]=q_ end end
for ra in pairs(cM)do if not table.find(cN,ra)then cN[#cN+1]=ra end end for Bw,gB in ipairs(cN)do local rb=N("Frame",{Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0},cL(22))
al(rb,6)O(rb,"  "..gB:upper(),11,j.RC[gB]or l.text,true)for Bx,gC in ipairs(cM[gB])do local b6=N("Frame",{Size=bc,BackgroundColor3=l.bg,BorderSizePixel=0},cL(38))
al(b6,5)local yI=O(b6,j.nice(gC),11,j.RC[gB]or l.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local yJ,yK=pcall(function()return gz.describe(gC)end)
local rc=yJ and tostring(yK)or""local yL=O(b6,rc,9,l.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local rd=E(b6,"BUY",l.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local re=E(b6,"ANY",l.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local rf=E(b6,"WISH",l.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local rg=E(b6,"FUSE",l.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local gD=gC rd.MouseButton1Click:Connect(function()j.flag(gD,"b")end)
re.MouseButton1Click:Connect(function()j.flag(gD,"g")end)rf.MouseButton1Click:Connect(function()j.flag(gD,"w")end)
rg.MouseButton1Click:Connect(function()j.flag(gD,"f")end)j.rows[gC]={b=rd,g=re,w=rf,f=rg,name=yI,desc=yL,boostText=rc}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,gA+10)j.built=true j.paintAll()end function o.paint()M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end
end function o.applyAll()if d.Lite then o.lite(true)end if d.HideHud then o.hideHud(true)end if d.NoRender then o.render(true)end
if(d.FpsCap or 0)~=0 then o.cap(d.FpsCap)end o.paint()end T(a.pfLite.MouseButton1Click:Connect(function()o.lite(not d.Lite)o.paint()end))
T(a.pfHud.MouseButton1Click:Connect(function()o.hideHud(not d.HideHud)o.paint()end))T(a.pfRender.MouseButton1Click:Connect(function()o.render(not d.NoRender)o.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local yM=table.find(o.CAPS,d.FpsCap or 0)or 1 local rh=o.CAPS[(yM%#o.CAPS)+1]
if not o.cap(rh)and rh~=0 then y("this executor cannot cap fps")end o.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local kA=tonumber(a.pfMem.Text)if kA and kA>=0 then d.MemLimit=math.floor(kA)end o.paint()end))function q.names()
local kB={"(none)"}for By,yN in ipairs((q.teams()))do kB[#kB+1]=yN.name end return kB end function q.cycle(kC,yO)
local gE=q.names()local yP=d[kC]~=""and d[kC]or"(none)"local gF=table.find(gE,yP)or 1 gF=((gF-1+yO)%#gE)+1 d[kC]=gE[gF]=="(none)"and""or gE[gF]
q.paint()end function q.paint()if not q.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local kD={}for Bz,yQ in ipairs((q.teams()))do kD[yQ.name]=true end
for yR,ri in pairs(q.pick)do local cO=d[yR]ri.Text=cO==""and"(none)"or(kD[cO]and cO or(cO.." (missing)"))ri.TextColor3=(cO~=""and not kD[cO])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(q.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(q.switches,q.finished,q.glazed,z.fused)
..(z.buildMsg~=""and("\n"..z.buildMsg)or"")local yS,gG=j.srv(),{}for BA,gH in ipairs(q.list or{})do gG[#gG+1]=("st %-2s %-22s %9s  helps %d"):format(gH.st.Name,ah(ab(gH.name)):sub(1,22),q.clock(gH.ends-yS),gH.helps)
end a.tmList.Text=#gG>0 and table.concat(gG,"\n")or"no waxes running"end function q.build()for BB,kE in ipairs(a.team:GetChildren())do
if kE:IsA("Frame")or kE:IsA("TextLabel")then kE:Destroy()end end q.pick={}local kF,kG=0,12 local function bE(rj)
kF,kG=kF+1,kG+rj+6 return N("Frame",{Size=UDim2 .new(1,0,0,rj),BackgroundTransparency=1,LayoutOrder=kF},a.team)
end local function ej(yT)O(bE(14),yT,10,l.dim,true)end local function gI(gJ)local kH=bE(26)local yU=E(kH,"<",l.panel2,11,F(0,0.14))
local rk=E(kH,"(none)",l.panel,10,F(0.14,0.72))local yV=E(kH,">",l.panel2,11,F(0.86,0.14))yU.MouseButton1Click:Connect(function()q.cycle(gJ,-1)end)
yV.MouseButton1Click:Connect(function()q.cycle(gJ,1)end)rk.MouseButton1Click:Connect(function()q.cycle(gJ,1)end)
q.pick[gJ]=rk end a.tmT=E(bE(28),"AUTO TEAMS: OFF",l.panel2,11,F(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=q.current()end q.paint()end)a.tmInfo=O(bE(42),"",10,l.dim,false)
local rl=bE(26)a.tmBuild=E(rl,"AUTO BUILD TEAMS: OFF",l.panel2,9,F(0,0.62))a.tmBuildNow=E(rl,"BUILD NOW",l.warn,9,F(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild q.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if q.editing then return end z.buildMsg="building..."task.spawn(function()local yW,yX=pcall(z.rebuild,"you asked")if not yW then y("BUILD ERR "..tostring(yX))end end)
end)ej("NORMAL TEAM  (worn the rest of the time)")gI("TeamNormal")ej("FULL TEAM  (every station busy: money + wax speed)")
gI("TeamFull")ej("GLAZE TEAM  (worn just before a wax finishes)")gI("TeamGlaze")local kI=bE(26)a.tmLead=gk(kI,tostring(d.GlazeLead),"45",F(0,0.2))
O(kI,"sec before it finishes",10,l.dim,false,F(0.22,0.5))local yY=E(kI,"SET",l.accent,11,F(0.75,0.25))yY.MouseButton1Click:Connect(function()
local gK=tonumber(a.tmLead.Text)if gK and gK>=5 and gK<=600 then d.GlazeLead=math.floor(gK)else a.tmLead.Text=tostring(d.GlazeLead)end
q.paint()end)ej("WAX TEAM  (worn while a butter is placed: head starts)")gI("TeamWax")ej("YOUR WAXES  (time left, helps)")
a.tmList=N("TextLabel",{Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bE(150))al(a.tmList,6)N("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
O(bE(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,l.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,kG+10)q.built=true q.paint()end local function yZ()a.secB.Text=tostring(d.Every)
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ad(0.1)end pcall(o.unpin)end)end M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then d0(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bB(a.root)bB(a.tgRoot)c.lastCollect=x()
kf()L.paint()pcall(j.paintAll)pcall(q.paint)pcall(o.applyAll)end local function y0(rm)task.spawn(function()rm.TextColor3=l.bad
task.wait(0.8)if c.alive then rm.TextColor3=l.text end end)end local function rn()local ro=a.secB.Text:match("^%s*(%d+)%s*$")
local ek=ro and tonumber(ro)if not ek or ek<1 then a.secB.Text=tostring(d.Every)y0(a.secB)y("interval must be a whole number >= 1")
return end if ek==d.Every then return end d.Every,c.lastCollect=ek,x()y("collect every "..ek.."s")end local function P(y1,y2)T(y1 .MouseButton1Click:Connect(y2))end
P(a.secSet,rn)T(a.secB.FocusLost:Connect(rn))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(ao,"selling...",pN)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(A.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help C.nextAt,C.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests D.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,function()d.Ghost=not d.Ghost if not d.Ghost then task.spawn(function()while c.busy do ad(0.1)end pcall(o.unpin)end)end
M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")end)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(ao,"opening crate...",fi,true)end)P(a.padB,function()c.plot=bf()or c.plot local rp,kJ=ar(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(rp and kJ and kJ:IsA("BasePart"))then y("SET PAD: need character and plot")return end c.manualPad=kJ.CFrame:ToObjectSpace(rp.HumanoidRootPart.CFrame)
wZ(c.manualPad)y("collect pad saved at your position")end)P(a.startB,function()d0(not c.running)end)P(a.buyB,function()
c.plot=bf()or c.plot task.spawn(ao,"buying (manual)...",my,true)end)P(a.plB,function()c.plot=bf()or c.plot task.spawn(ao,"waxing (manual)...",mD)
end)P(a.tabFarm,function()bD("farm")end)P(a.tabBut,function()bD("but")end)P(a.tabSet,function()bD("set")end)P(a.tabCrt,function()bD("crt")end)
P(a.tabPet,function()bD("pet")end)P(a.tabTeam,function()bD("team")end)local function y3(kK)c.hidden=kK a.root.Visible=not kK
a.tgBtn.Text=kK and"SAB+"or"SAB"end qD(a.tgBtn,a.tgRoot,function()bB(a.tgRoot)c.togPos=go(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then y3(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aC,ap={},0
local function bF()aC=lW()if#aC==0 then a.cfgPick.Text="(none saved)"ap=0 return end if ap<1 or ap>#aC then ap=1 end
a.cfgPick.Text=aC[ap]..("  (%d/%d)"):format(ap,#aC)end local function rq()local rr=c.autoload~=nil a.cfgAuto.Text=rr and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=rr and l.accent or l.panel2 end local function kL()local rs=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if rs~=""then return rs end return(ap>0 and aC[ap])or""end P(a.cfgSave,function()c.winPos=go(a.root)or c.winPos
c.togPos=go(a.tgRoot)or c.togPos local rt,ru=eY(kL())a.cfgMsg.Text=rt and("saved as "..ru)or("could not save: "..ru)
a.cfgMsg.TextColor3=rt and l.good or l.bad bF()y(a.cfgMsg.Text)end)local function y4(kM)local kN,rv=l5(kM)a.cfgMsg.Text=kN and("loaded "..rv)or("could not load: "..rv)
a.cfgMsg.TextColor3=kN and l.good or l.bad if kN then a.cfgName.Text=kM yZ()task.spawn(A.apply,"config "..kM)
end y(a.cfgMsg.Text)end P(a.cfgLoad,function()y4(kL())end)P(a.cfgPick,function()bF()if ap>0 then a.cfgName.Text=aC[ap]end
end)P(a.cfgPrev,function()if#aC==0 then bF()return end ap=(ap-2)%#aC+1 bF()a.cfgName.Text=aC[ap]end)P(a.cfgNext,function()
if#aC==0 then bF()return end ap=ap%#aC+1 bF()a.cfgName.Text=aC[ap]end)P(a.cfgAuto,function()if c.autoload then
l7(nil)a.cfgMsg.Text="it will not load a config on launch"else local el=kL()local rw=false for BC,y5 in ipairs(lW())do if y5==el then rw=true end end
local y6=rw or eY(el)if y6 and el~=""then l7(el)bF()a.cfgMsg.Text=el.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim rq()end)P(a.autoB,function()
local rx,ry=tm()a.autoMsg.Text=rx and("installed. "..ry)or("failed: "..ry)a.autoMsg.TextColor3=rx and l.good or l.bad
y(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()c7("you asked")end)
local b7=false P(a.minB,function()b7=not b7 a.tabs.Visible=not b7 if b7 then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bD(q0)end a.root.Size=UDim2 .new(0,aj.w,0,b7 and(aj.head+aj.strip)or aj.h)
a.minB.Text=b7 and"+"or"-"end)local function gL()if not c.alive then return end c.alive,c.running=false,false
pcall(o.restoreAll)pcall(ez)for BD,y7 in ipairs(gS)do pcall(function()y7:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()j2:Destroy()end)pcall(function()qK:Destroy()end)if b9 .SAB_KILL==gL then b9 .SAB_KILL=nil end
end b9 .SAB_KILL=gL P(a.killB,gL)P(a.xB,gL)qD(a.title,a.root,function()bB(a.root)c.winPos=go(a.root)or c.winPos
end)local function rz()local em,en=c.reason,c.level if c.busy then em,en=c.busyText,"ok"elseif not c.running then
local BE,rA,y8=pT()if c.capHit then em,en=rA,"bad"else em,en="[stopped] "..rA,(y8=="bad")and"bad"or"idle"end c.reason,c.level=em,en
end a.reason.Text=em a.bar.BackgroundColor3=xH[en]or l.dim a.dot.BackgroundColor3=c.running and l.good or(c.capHit and l.bad or l.dim)
a.tgDot.BackgroundColor3=a.dot.BackgroundColor3 a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent a.startB.Text=c.running and"STOP"or"START"
M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")a.startB.BackgroundColor3=c.running and l.warn or l.good
local y9,y_=ew()a.sBought.Text,a.sPlaced.Text,a.sSold.Text=tostring(c.bought),tostring(c.placed),tostring(c.sold)
a.sColl.Text,a.sFree.Text=tostring(c.collected),y9 .."/"..y_ local rB=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local rC=aa()a.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aD(aY()),c.rolls,c.gifts,c.crates,rC and ah(ab(rC))or"nothing",e.on and("   ["..e.title.." window open]")or"",
rB and("in "..rB.."s")or"off")local cP=sY()a.tgt.Text=(#cP==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#cP<=3)and table.concat(cP,", ")or(#cP.." butters ticked")))
a.tgt.TextColor3=(#cP==0)and l.bad or l.good a.padL.Text=c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found")
a.log.Text=table.concat(eq,"\n")if a.butInfo then a.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(W.n,#W.rarOrder,#cP)
end if a.but.Visible and bd.at~=W.at then ef(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then j.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak)
end if a.team.Visible then q.paint()end if a.farm.Visible then a.helpL.Text=(d.Help or d.HelpGuild)and C.msg or"off"
a.questL.Text=d.Quests and(D.msg~=""and D.msg or"checking...")or"off"a.campL.Text=(d.Campfire and K.msg or"campfire off")..(d.Ghost and(o.hold and" | ghost: under"or" | ghost: up")or"")
end M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local rD=(A.rec.on and"on"or"")..(A.rec.off and((A.rec.on and"/"or"").."off")or"")a.arL.Text=A.msg~=""and A.msg or("game: %s | learned: %s%s"):format(A.isOn()and"ON"or"off",
rD~=""and rD or"nothing yet",#A.rec.rules>0 and", choices"or"")a.arL.TextColor3=A.msg~=""and l.warn or l.dim end
b9 .SAB={S=c,CFG=d,EV=Q,U=a,sg=j2,CAT=W,LEARN=ae,buildList=ef,logAll=cQ,evAll=cR,AR=A,CR=L,PF=o,PX=j,TM=q,CRATE=e,FU=z,HX=C,CF=K,QX=D}
y(b8 .." loaded")if c.uiErrs>0 then y("UI: "..c.uiErrs.." properties skipped")end bD("farm")bB(a.root)bB(a.tgRoot)
if gl then pcall(function()T(gl:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bB(a.root)
bB(a.tgRoot)end))end)end bF()rq()if c.config and c.config~=""then a.cfgName.Text=c.config end M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(o.applyAll)pcall(rz)task.spawn(function()local rE=tk()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(rE and("\n(backup: "..rE..")")or"")
local rF=eT(af.exec)if rF and not rF:find("SAB autoloader v2",1,true)then c3(af.exec,af.stub)y("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(eT(af.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(ts)end)task.spawn(function()while c.alive do local za,zb=pcall(rz)if not za then y("UI ERR "..tostring(zb))end
task.wait((c.hidden or b7)and 1.5 or 0.25)end end)task.spawn(function()local zc,zd=pcall(tB)if not zc then y("HOOK ERR "..tostring(zd))end
end)task.spawn(function()pcall(sl)if e.loadSeq and not e.learned then local gM={}for rG=1,20 do if e.loadSeq[rG]then gM[#gM+1]=e.loadSeq[rG]end end
if#gM>0 then e.learned={seq=gM,mode=e.loadMode}y("remembered how to open crates directly")end end if hr()then y(("catalog: %d butters in %d rarities"):format(W.n,#W.rarOrder))end
local ze,rH=pcall(w1)if ze and rH and c.alive and not c.manualPad then c.manualPad=rH end end)task.spawn(function()
while c.alive do local kO,kP=pcall(j.buyTick)if not kO then y("PET ERR "..tostring(kP))task.wait(5)end kO,kP=pcall(j.wishTick)
if not kO then y("WISH ERR "..tostring(kP))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local gN,rI=0,x()
T(game:GetService("RunService").Heartbeat:Connect(function()gN=gN+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if o.hold then pcall(o.pinTick)end end))
o.noteAt=x()while c.alive do task.wait(1)local rJ=x()o.fps,gN,rI=gN/math.max(rJ-rI,0.001),0,rJ local zf,zg=pcall(o.tick)
if not zf then y("PERF ERR "..tostring(zg))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local zh,zi=pcall(z.tick)if not zh then y("FUSE ERR "..tostring(zi))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local zj,zk=pcall(q.tick)if not zj then y("TEAM ERR "..tostring(zk))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local gO=aq:WaitForChild("Remotes",30)local rK=gO and gO:WaitForChild("ClanEvent",30)
if rK and c.alive then T(rK.OnClientEvent:Connect(function(zl,zm)if zl=="call"then pcall(C.onCall,zm)end end))
end local rL=gO and gO:FindFirstChild("RollConfirmAsk")if rL and c.alive then T(rL.OnClientEvent:Connect(function(zn)D.asked=zn or"butter"end))end
end)task.spawn(function()task.wait(8)while c.alive do local zo,zp=pcall(D.tick)if not zo then y("QUEST ERR "..tostring(zp))task.wait(30)end
task.wait(3)end end)task.spawn(function()while c.alive do task.wait(20)pcall(ez)end end)pcall(A.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local zr=(type(newcclosure)=="function")and newcclosure or function(zq)return zq end local kQ
local rM=(type(setnamecallmethod)=="function")and setnamecallmethod or nil kQ=hookmetamethod(game,"__namecall",zr(function(rN,...)
local eo=getnamecallmethod()if c.alive and(eo=="InvokeServer"or eo=="FireServer")then local rO,rP=pcall(function()return rN.Name end)
if rO and rP=="CrateAction"and not e.replaying then pcall(e.saw,eo,...)elseif rO and rP=="AutoRollAction"and not A.replaying then pcall(A.saw,eo,...)end
if rM then rM(eo)end end return kQ(rN,...)end))e.oldNC=kQ end)end if gQ then T(J.Idled:Connect(function()pcall(function()gQ:CaptureController()gQ:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for BF=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ar()and(c.plot or bf())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then A.apply("joined")end while c.alive do task.wait(30)if c.alive and d.AutoRoll and c.running and not A.isOn()and not bJ()and not aa()
and not e.waiting and not e.on and not c.busy then A.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for BG=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bf()if ar()and c.plot and next(d.Targets)then d0(true,true)y("started by itself")
return end task.wait(1)end if c.alive and not c.running then y("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bf()c.lastCollect=x()while c.alive do if c.running then local zs,rQ=pcall(xC)if not zs and rQ~=gR then y("LOOP ERR "..tostring(rQ))end
end task.wait(0.1)end end)gP("loaded - window is at the top left")end local zu,kR=xpcall(rU,function(zt)return tostring(zt).."\n"..debug.traceback()end)
if not zu then pcall(function()warn("SAB "..b8 .." ERROR: "..tostring(kR))end)gP("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b8 .." ERROR: "..tostring(kR))end)pcall(function()local rR=(type(getgenv)=="function"and getgenv())or _G
if type(rR.SAB_KILL)=="function"then rR.SAB_KILL()end for BH,zv in ipairs({"SABFarmGui","SABToggle"})do local rS=J.PlayerGui:FindFirstChild(zv)
if rS then rS:Destroy()end end end)pcall(function()local ep=Instance.new("ScreenGui")ep.Name="SABError"ep.ResetOnSpawn=false
ep.DisplayOrder=1000 local aP=Instance.new("TextBox")aP.Size=UDim2 .new(0,340,0,170)aP.Position=UDim2 .new(0,10,0,50)
aP.BackgroundColor3=Color3 .fromRGB(90,20,20)aP.TextColor3=Color3 .new(1,1,1)aP.TextSize=11 aP.TextWrapped=true
aP.ClearTextOnFocus=false aP.TextXAlignment=Enum.TextXAlignment.Left aP.TextYAlignment=Enum.TextYAlignment.Top
aP.Text="SAB "..b8 .." failed to start. Send this text:\n"..tostring(kR)aP.Parent=ep ep.Parent=J:WaitForChild("PlayerGui")
end)end
