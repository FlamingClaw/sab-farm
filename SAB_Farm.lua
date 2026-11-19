local b8="v25"local k8=game:GetService("Players")local E=k8 .LocalPlayer or k8 .PlayerAdded:Wait()local function g1(sa)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..b8,Text=sa,Duration=6})
end)end g1("script started")local function sb()local ap=game:GetService("ReplicatedStorage")local aq=game:GetService("Workspace")
local k9=game:GetService("UserInputService")local b9=(type(getgenv)=="function"and getgenv())or _G if type(b9 .SAB_KILL)=="function"then pcall(b9 .SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local g2=(function()local sc,sd=pcall(function()return game:GetService("VirtualUser")end)return sc and sd or nil end)()
local d={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,MemLimit=2000,Help=false,HelpGuild=false,Campfire=true,Ghost=false,
GhostHelps=false,Quests=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=x(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local Q={name=nil,rar=nil,at=x(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local A={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local e={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local j,q,o,z,C,F,D={},{},{},{},{},{},{}local g3={}local g4,eq,cR,cS={},{},{},{}local function T(k_)g4[#g4+1]=k_ return k_ end
local function ad(se)task.wait(se)if not c.alive then error(g3,0)end end local function y(er)er=os.date("%H:%M:%S").." "..tostring(er)
table.insert(eq,1,er)if#eq>6 then table.remove(eq)end c.logN=(c.logN or 0)+1 cR[#cR+1]=er if#cR>80 then table.remove(cR,1)end
end local function es(la)if type(la)~="string"then return""end return(la:lower():gsub("[^%w]",""))end local function ab(sf)
local lb=es(sf)local g5=lb:gsub("butter$","")if g5==""then g5=lb end return g5 end local function aP(g6)return type(g6)=="string"and ab(g6)~=""and d.Targets[ab(g6)]==true end
local function sh(cT)cT=cT:lower()return cT:find("squishy",1,true)~=nil or cT:match("butter$")~=nil or cT:match("butter[^%a]")~=nil
end local g7={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aC(cU)if type(cU)~="number"then return"?"end
local et=1 while math.abs(cU)>=1000 and et<#g7 do cU=cU/1000 et=et+1 end local si=string.format("%.2f",cU):gsub("%.?0+$","")
return si..g7[et]end local function sj(lc)if type(lc)~="string"then return nil end local sk,ld=lc:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local g8=tonumber(sk)if not g8 then return nil end if ld==""then return g8 end for sl,sm in ipairs(g7)do if sm:lower()==ld:lower()then return g8*1000^(sl-1)end end
return nil end local function aZ()local le=E:GetAttribute("BoardValueMoney")if type(le)=="number"then return le end
local lf=E:FindFirstChild("leaderstats")if lf then for zV,sn in ipairs({"Cash","Money","Coins"})do local g9=lf:FindFirstChild(sn)
if g9 and type(g9 .Value)=="number"then return g9 .Value end end end end local function eu(so)local g_=so:GetFullName()
if c.plot then local ha=c.plot:GetFullName()if g_:sub(1,#ha)==ha then return g_:sub(#ha+2)end end return g_ end
local function ar()local ev=E.Character if ev and ev:FindFirstChild("HumanoidRootPart")then local lg=ev:FindFirstChildOfClass("Humanoid")
if lg and lg.Health>0 then return ev end end end local function bf()local hb=aq:FindFirstChild("Plots")if not hb then return nil end
local function lh(sp)local li=sp:FindFirstChild("Plate")return li~=nil and li:FindFirstChild("EditStackAttachment",true)~=nil
end local lj=E:GetAttribute("PlotNumber")if lj~=nil then local hc=hb:FindFirstChild(tostring(lj))if hc and lh(hc)then return hc end
end for zW,lk in ipairs(hb:GetChildren())do if lh(lk)then return lk end end end local function cV(ll)local bh=ll and ll.Parent
for zX=1,6 do if not bh then return nil end if bh:IsA("BasePart")then return bh end if bh:IsA("Model")then return bh.PrimaryPart or bh:FindFirstChildWhichIsA("BasePart",true)end
bh=bh.Parent end end local function lm(ln)local hd=ln.Parent if hd and hd:IsA("Attachment")then return hd.WorldPosition end
local lo=cV(ln)return lo and lo.Position end local function lp()local b_=c.plot and c.plot:FindFirstChild("Plate")
if not b_ then return nil end if b_:IsA("BasePart")then return b_.Position end if b_:IsA("Model")then return b_:GetPivot().Position end
local lq=b_:FindFirstChildWhichIsA("BasePart",true)return lq and lq.Position end local function lr()local he={}
local ls=c.plot and c.plot:FindFirstChild("WaxStations")if ls then for zY,sq in ipairs(ls:GetChildren())do local lt=sq:FindFirstChild("SquishyPlaceHolder")
local hf=lt and lt:FindFirstChild("PlacePrompt")if hf and hf:IsA("ProximityPrompt")then he[#he+1]=hf end end end
return he end local function ew()local lu,hg=lr(),0 for zZ,sr in ipairs(lu)do if sr.Enabled then hg=hg+1 end end
local hh=#lu local hi=E:GetAttribute("WaxStations")if type(hi)=="number"and hi>hh then hh=hi end return hg,hh
end local function ss()local lv=ar()local lw=lv and lv.HumanoidRootPart.Position local hj,lx for z0,hk in ipairs(lr())do
if hk.Enabled then local ly=lm(hk)local lz=(ly and lw)and(ly-lw).Magnitude or 1e9 if not hj or lz<lx then hj,lx=hk,lz end
end end return hj end local function lA()local ex=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not ex then return nil end local lB=ex:FindFirstChild("BuyPromptAttachment")local ey=(lB and lB:FindFirstChild("BuyPrompt"))or ex:FindFirstChild("BuyPrompt",true)
if ey and ey:IsA("ProximityPrompt")and ey:IsDescendantOf(ex)then return ey end end local lC={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local su={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ae={order={},price={},dirty=false}local K={seen={},at=0,boxes={},built=0}local W={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local hl="SAB_order.txt"local function ez()if not ae.dirty or type(writefile)~="function"then return end local ax={}
for sv,sw in pairs(ae.price)do ax[#ax+1]="P|"..sv.."|"..string.format("%.0f",sw)end for sx,sy in pairs(ae.order)do ax[#ax+1]="O|"..sx.."|"..table.concat(sy,",")end
if e.learned and e.enc then ax[#ax+1]="M|mode|"..tostring(e.learned.mode or"")for sz,eA in ipairs(e.learned.seq)do
local lD={}for lE=1,eA.n do lD[lE]=e.enc(eA.args[lE])end ax[#ax+1]=("A|%d|%s|%d|%s"):format(sz,eA.m,eA.n,table.concat(lD,";"))
end end local function hm(sA,sB,eB)local lF={}for lG=1,eB.n do lF[lG]=e.enc(eB.args[lG])end ax[#ax+1]=("R|%d|%s|%s|%d|%s"):format(sB,sA,eB.m,eB.n,table.concat(lF,";"))
end if e.enc then for sC,sD in ipairs(A.rec.rules)do hm("rules",sC,sD)end if A.rec.on then hm("on",0,A.rec.on)end
if A.rec.off then hm("off",0,A.rec.off)end end for z1,cW in pairs(K.seen)do ax[#ax+1]=("K|%s|%s|%s|%s"):format(cW.name,cW.title or"",cW.rar or"",cW.price and string.format("%.0f",cW.price)or"")
end if pcall(writefile,hl,table.concat(ax,"\n"))then ae.dirty=false end end local function sE()if type(isfile)~="function"or type(readfile)~="function"then return end
local sF,sG=pcall(isfile,hl)if not(sF and sG)then return end local sH,lH=pcall(readfile,hl)if not(sH and type(lH)=="string")then return end
for sI in lH:gmatch("[^\n]+")do local ca,cb,a0=sI:match("^(%a)|([^|]+)|(.*)$")if ca=="P"then ae.price[cb]=tonumber(a0)
elseif ca=="M"then e.loadMode=(a0~=""and a0~="nil")and a0 or nil elseif ca=="A"and e.dec then local lI=tonumber(cb)
local lJ,eC,sJ=a0:match("^([^|]+)|(%d+)|(.*)$")if lI and lJ then eC=tonumber(eC)local lK,eD={},0 for sK in(sJ..";"):gmatch("([^;]*);")do
eD=eD+1 if eD<=eC then lK[eD]=e.dec(sK)end end e.loadSeq=e.loadSeq or{}e.loadSeq[lI]={m=lJ,n=eC,args=lK}end elseif ca=="R"and e.dec then
local lL=tonumber(cb)local eE,sL,eF,sM=a0:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if lL and eE then eF=tonumber(eF)
local lM,eG={},0 for sN in(sM..";"):gmatch("([^;]*);")do eG=eG+1 if eG<=eF then lM[eG]=e.dec(sN)end end local hn={m=sL,n=eF,args=lM}
if eE=="rules"then A.rec.rules[lL]=hn elseif eE=="on"then A.rec.on=hn elseif eE=="off"then A.rec.off=hn end end
elseif ca=="K"then local lN,lO,sO=a0:match("^([^|]*)|([^|]*)|(.*)$")K.seen[K.key(cb)]={name=cb,title=lN~=""and lN or nil,
rar=lO~=""and lO or nil,price=tonumber(sO)}elseif ca=="O"and a0~=""then local eH={}for sP in a0:gmatch("[^,]+")do eH[#eH+1]=sP end
if#eH>0 then ae.order[cb]=eH end end end end local function sQ(eI)if type(eI)~="table"then return end local bH,lP=eI.rarity,eI.contents
if type(bH)~="string"or bH==""or type(lP)~="table"then return end local cX={}for z2,eJ in ipairs(lP)do if type(eJ)=="table"and type(eJ.butter)=="string"then
cX[#cX+1]={n=eJ.butter,ch=tonumber(eJ.chance)or 0}end end if#cX==0 then return end table.sort(cX,function(sR,sS)return sR.ch>sS.ch end)
local cY,cZ={},false for sT,sU in ipairs(cX)do cY[sT]=sU.n end local ho=ae.order[bH]if not ho or#ho~=#cY then cZ=true end
if not cZ then for lQ=1,#cY do if ho[lQ]~=cY[lQ]then cZ=true break end end end ae.order[bH]=cY local hp=tonumber(eI.price)
if hp and ae.price[bH]~=hp then ae.price[bH]=hp cZ=true end if cZ then ae.dirty=true W.at=0 y("learned the "..bH.." order from its crate")
end end local function cc(sV,sW)local sX=sV:FindFirstChild(sW,true)local sY,hq=pcall(function()return sX.Text end)
return(sY and type(hq)=="string"and hq~="")and hq or nil end local function aj(lR)return W.pretty[lR]or lR end
K.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function K.key(sZ)return es(sZ or"")end
function K.learn(a1)if type(a1)~="table"or type(a1 .name)~="string"then return end local hr=K.key(a1 .name)local a2=K.seen[hr]or{}
local s0=(K.seen[hr]==nil)or(tonumber(a1 .price)and a2 .price~=tonumber(a1 .price))a2 .name,a2 .title=a1 .name,a1 .title or a2 .title
a2 .rar,a2 .price=a1 .rarity or a2 .rar,tonumber(a1 .price)or a2 .price K.seen[hr]=a2 if s0 then K.at,ae.dirty=x(),true end
end function K.wanted(lS)return lS~=nil and d.CrateTicks[K.key(lS)]==true end function K.list()local cd={}for s1,eK in ipairs(K.base)do cd[K.key(eK[1])]={name=eK[1],title=eK[2],rar=eK[3],i=s1}end
for z3,c0 in ipairs(W.rarOrder)do local lT=false for z4,s2 in pairs(cd)do if s2 .rar==c0 then lT=true break end end
if not lT and c0~="?"then local lU=c0:gsub("[^%w]","").."Crate"cd[K.key(lU)]={name=lU,title=c0 .." Crate",rar=c0,i=50,guess=true}
end end for lV,eL in pairs(K.seen)do local aQ=cd[lV]or{i=100}aQ.name,aQ.title,aQ.rar=eL.name or aQ.name,eL.title or aQ.title,eL.rar or aQ.rar
aQ.price,aQ.guess=eL.price or aQ.price,nil cd[lV]=aQ end local c1,eM={},{}for s3,s4 in ipairs(lC)do c1[s4]=s3 end
for s5,lW in ipairs(W.rarOrder)do c1[lW]=c1[lW]or(20+s5)end for s6,c2 in pairs(cd)do c2 .k=s6 c2 .price=c2 .price or ae.price[c2 .rar or""]
eM[#eM+1]=c2 end table.sort(eM,function(bI,bJ)if bI.price and bJ.price and bI.price~=bJ.price then return bI.price<bJ.price end
local lX,lY=c1[bI.rar or""]or 99,c1[bJ.rar or""]or 99 if lX~=lY then return lX<lY end if(bI.i or 100)~=(bJ.i or 100)then return(bI.i or 100)<(bJ.i or 100)end
return bI.k<bJ.k end)return eM end local function s7()local lZ=ap:FindFirstChild("Assets")local l0=lZ and lZ:FindFirstChild("Squishies")
if not l0 then return false end local hs,l1,ce={},{},{}local eN=0 for z5,eO in ipairs(l0:GetChildren())do local c3=ab(eO.Name)
if c3~=""and not hs[c3]then local eP=cc(eO,"RarityText")or"?"hs[c3]=eP l1[c3]=cc(eO,"NameText")or eO.Name ce[eP]=ce[eP]or{}
table.insert(ce[eP],c3)eN=eN+1 end end if eN==0 then return false end for l2,s8 in pairs(ce)do local l3=ae.order[l2]or su[l2]
local ht={}if l3 then for s9,s_ in ipairs(l3)do ht[ab(s_)]=s9 end end table.sort(s8,function(l4,l5)local hu,hv=ht[l4],ht[l5]
if hu and hv then return hu<hv end if hu then return true end if hv then return false end return aj(l4)<aj(l5)
end)end local hw={}for ta,tb in ipairs(lC)do hw[tb]=ta end local eQ={}for tc in pairs(ce)do eQ[#eQ+1]=tc end table.sort(eQ,function(hx,hy)
local hz,hA=ae.price[hx],ae.price[hy]if hz and hA and hz~=hA then return hz<hA end local hB,hC=hw[hx],hw[hy]if hB and hC then return hB<hC end
if hB then return true end if hC then return false end return hx<hy end)W.rar,W.pretty,W.members,W.rarOrder,W.n,W.at=hs,l1,ce,eQ,eN,x()
return true end local function hD()if W.at==0 or(x()-W.at)>120 then pcall(s7)end return W.n>0 end local function td(te)
local l6=ab(te)return W.rar[l6]or(Q.name and ab(Q.name)==l6 and Q.rar)or"?"end local function tf()local eR={}
for th,ti in pairs(d.Targets)do if ti then eR[#eR+1]=aj(th)end end table.sort(eR)return eR end local ah={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function l7()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function eS(l8)if type(makefolder)~="function"then return end local tj,tk=pcall(isfolder,l8)if not(tj and tk)then pcall(makefolder,l8)end
end local function eT(l9)if type(isfile)~="function"or type(readfile)~="function"then return nil end local tl,tm=pcall(isfile,l9)
if not(tl and tm)then return nil end local tn,to=pcall(readfile,l9)return tn and to or nil end local function c4(tp,tq)
if type(writefile)~="function"then return false end return(pcall(writefile,tp,tq))end local function l_(tr)local c5={}
if type(listfiles)~="function"then return c5 end local ts,ma=pcall(listfiles,tr)if not ts or type(ma)~="table"then return c5 end
for z6,tt in ipairs(ma)do c5[#c5+1]=tostring(tt)end return c5 end local function mb()local eU={}for z7,tu in ipairs(l_(ah.cfg))do
local mc=tu:match("([^/\\]+)%.txt$")if mc then eU[#eU+1]=mc end end table.sort(eU)return eU end local function tv()
local V={"V|1"}V[#V+1]="N|Every|"..tostring(d.Every)V[#V+1]="N|GlazeLead|"..tostring(d.GlazeLead)V[#V+1]="N|FpsCap|"..tostring(d.FpsCap)
V[#V+1]="N|MemLimit|"..tostring(d.MemLimit)for z8,md in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do V[#V+1]="S|"..md.."|"..d[md]end
do local eV={}for tw,c6 in pairs(d.Pets)do local me=(c6 .b and"b"or"")..(c6 .g and"g"or"")..(c6 .w and"w"or"")..((tonumber(c6 .f)or 0)>0 and tostring(c6 .f)or"")
if me~=""then eV[#eV+1]=tw.."|"..me end end table.sort(eV)V[#V+1]="P|-"for z9,tx in ipairs(eV)do V[#V+1]="P|"..tx end
end for z_,mf in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests"})do
V[#V+1]="B|"..mf.."|"..(d[mf]and"1"or"0")end local hE=E:GetAttribute("AutoRollRules")if type(hE)=="string"and hE~=""then d.ARrules,d.ARstop=hE,tostring(E:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then V[#V+1]="S|rules|"..d.ARrules V[#V+1]="S|stop|"..d.ARstop end if c.winPos then V[#V+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then V[#V+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Aa,hF in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local eW={}for ty,tz in pairs(hF[2])do if tz then eW[#eW+1]=ty end end table.sort(eW)V[#V+1]=hF[1].."|-"for Ab,tA in ipairs(eW)do V[#V+1]=hF[1].."|"..tA end
end return table.concat(V,"\n")end local function tB(hG)if type(hG)~="string"or hG==""then return false end local mg,mh,mi,mj,c7={},false,{},false,nil
for tC in hG:gmatch("[^\n]+")do local aD,ac,av=tC:match("^(%a)|([^|]*)|?(.*)$")if aD=="N"and ac=="Every"then local hH=tonumber(av)
if hH and hH>=1 then d.Every=math.floor(hH)end elseif aD=="N"and(ac=="FpsCap"or ac=="MemLimit")then local hI=tonumber(av)
if hI and hI>=0 then d[ac]=math.floor(hI)end elseif aD=="N"and ac=="GlazeLead"then local eX=tonumber(av)if eX and eX>=5 and eX<=600 then d.GlazeLead=math.floor(eX)end
elseif aD=="S"and(ac=="TeamNormal"or ac=="TeamFull"or ac=="TeamGlaze"or ac=="TeamWax")then d[ac]=av elseif aD=="P"and ac~=""then
if not c7 then c7={}end if ac~="-"and av~=""then c7[ac]={b=av:find("b",1,true)and true or nil,g=av:find("g",1,true)and true or nil,
w=av:find("w",1,true)and true or nil,f=tonumber(av:match("%d"))}end elseif aD=="B"then if d[ac]~=nil then d[ac]=(av=="1")end
elseif aD=="S"and ac=="rules"then d.ARrules=av elseif aD=="S"and ac=="stop"then d.ARstop=av elseif aD=="W"then
c.winPos={tonumber(ac)or 10,tonumber(av)or 44}elseif aD=="G"then c.togPos={tonumber(ac)or 10,tonumber(av)or 300}
elseif aD=="T"and ac~=""then if ac~="-"then mg[ac]=true end mh=true elseif aD=="K"and ac~=""then if ac~="-"then mi[ac]=true end
mj=true end end if mh then d.Targets=mg end if mj then d.CrateTicks=mi end if c7 then d.Pets=c7 end return true
end local function eY(cf)if not l7()then return false,"this executor cannot write files"end cf=(cf or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cf==""then return false,"give the config a name"end eS(ah.dir)eS(ah.cfg)if not c4(ah.cfg.."/"..cf..".txt",tv())then return false,"could not write the file"end
c.config=cf return true,cf end local function mk(eZ)local ml=eT(ah.cfg.."/"..eZ..".txt")if not ml then return false,"no config called "..tostring(eZ)end
if not tB(ml)then return false,"that config looks empty"end c.config=eZ return true,eZ end local function mm(hJ)
if hJ then eS(ah.dir)c4(ah.auto,hJ)elseif type(delfile)=="function"then pcall(delfile,ah.auto)else c4(ah.auto,"")
end c.autoload=hJ end local function tD()if c.selfPath then return c.selfPath end local e0 for Ac,tE in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ah.dir})do
for Ad,mn in ipairs(l_(tE))do local hK=mn:lower()if hK:sub(-4)==".lua"and(hK:find("sab_farm",1,true)or hK:find("sab farm",1,true))then
e0=e0 or mn end end end c.selfPath=e0 return e0 end ah.stub=[[
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
local function tF()if not l7()then return false,"this executor cannot write files"end eS("autoexec")if not c4(ah.exec,ah.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local e1=(function()local tG,tH=pcall(function()return game:GetService("TeleportService")end)return tG and tH or nil end)()
local function hL()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local tI=queueonteleport or queue_on_teleport return(pcall(tI,ah.stub))end local function c8(tJ)if c.rejoining then return end
c.rejoining=true y("REJOIN ("..tJ..")")pcall(ez)if c.autoload then pcall(eY,c.autoload)end local tK=hL()y(tK and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Ae=1,30 do if not e1 then break end pcall(function()e1:Teleport(game.PlaceId,E)end)task.wait(10)
end end)end local function tL()local tM,mo=pcall(function()return game:GetService("GuiService")end)if tM and mo then
pcall(function()T(mo.ErrorMessageChanged:Connect(function()if d.Rejoin then c8("roblox error message")end end))
end)end pcall(function()local mp=game:GetService("CoreGui")local mq=mp and mp:WaitForChild("RobloxPromptGui",15)
local mr=mq and mq:WaitForChild("promptOverlay",15)if mr then T(mr.ChildAdded:Connect(function(tN)if d.Rejoin and tostring(tN.Name):lower():find("errorprompt",1,true)then c8("disconnect prompt")end
end))end end)pcall(function()T(E.OnTeleport:Connect(function(tO)if tostring(tO):find("Started")then hL()end end))
end)if e1 then pcall(function()T(e1 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()c8("teleport retry")end)end
end))end)end end local function ms(tP)local mt=c.plot and c.plot:FindFirstChild(tP)if not mt then return nil,false end
for Af,hM in ipairs(mt:GetChildren())do if hM:IsA("Model")or hM:IsA("BasePart")then return hM,true end end return nil,true
end local function bK()local bi=ms("RolledSquishy")if not bi then return nil end return{model=bi,name=bi.Name,pretty=cc(bi,"NameText")or aj(ab(bi.Name)),
rar=cc(bi,"RarityText")or td(bi.Name),price=cc(bi,"PriceText")}end local function mu(hN)return type(hN)=="string"and(W.rar[ab(hN)]~=nil or sh(hN))
end local function aa()local hO=ms("SquishyEquipped")if hO then c.carrySrc,e.heldAt="model",x()return hO.Name,hO end
local mv=E.Character if mv then for Ag,c9 in ipairs(mv:GetDescendants())do if(c9:IsA("Model")or c9:IsA("Tool"))and mu(c9 .Name)then
c.carrySrc,e.heldAt="character",x()return c9 .Name,c9 end end end local e2=E:GetAttribute("SquishyEquipped")if type(e2)=="string"and e2~=""and mu(e2)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return e2,nil end c.carrySrc=nil end local function Ah()local Ai,tQ=aa()return tQ end local function mw()
local mx=bK()local hP=mx and sj(mx.price)local hQ=aZ()if hP and hQ and hQ<hP*0.5 then return hQ,hP end end local function cg(tR)
cS[#cS+1]=os.date("%H:%M:%S").." "..tR if#cS>40 then table.remove(cS,1)end end local function tS(bL,e3)if type(bL)~="string"then return end
cg(("Roll(%s,%s)"):format(bL,tostring(e3)))if bL:lower():find("crate",1,true)then e.rolled,e.rolledAt=bL,x()return
end Q.seq=Q.seq+1 Q.name,Q.at=bL,x()Q.rar=type(e3)=="string"and e3 or nil c.rolls=c.rolls+1 if aP(bL)then y(("ROLL %s [%s] = TARGET"):format(bL,tostring(e3)))end
end local function tT(bM)if type(bM)~="table"then return end local e4=bM.butter or bM.itemName if type(e4)~="string"then return end
c.gifts=c.gifts+1 Q.gift,Q.giftAt=e4,x()if type(bM.giftId)=="string"then local my=ap:FindFirstChild("Remotes")
local mz=my and my:FindFirstChild("GiftThanks")if mz then pcall(function()mz:FireServer(bM.giftId)end)end end
cg("Gift("..e4 .." from "..tostring(bM.fromName)..")")y(("GIFT from %s: %s - it will not be waxed"):format(tostring(bM.fromName),e4))
end local function tU()local mA=ap:WaitForChild("Remotes",30)if not c.alive then return end if not mA then y("Remotes folder missing - no roll events")return end
T(E:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local mB=E:GetAttribute("SquishyEquipped")
if type(mB)=="string"and mB~=""then e.heldAt=x()end end))local t0={SquishyRollAnimation=tS,InitSquishy=function(mC)Q.init,Q.initAt=tostring(mC),x()cg("Init("..tostring(mC)..")")end,
CrateUpdate=function(ci,mD)pcall(sQ,ci)pcall(K.learn,ci)if type(ci)=="table"then local tV=mD==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not tV then return end local tW=not e.waiting local tX=e.on e.waiting,e.data,e.at=true,ci,x()e.on=(mD==true)
e.title=tostring(ci.title or ci.name or"crate")if e.on and not tX then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then cg("CrateWindow open("..e.title..")")elseif tW then cg("Crate waiting("..e.title..")")y(e.title.." is waiting on your stand")
end else if e.waiting then cg("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local tY=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,tY)end if e.classify then local tZ=x()
task.spawn(function()pcall(e.classify,tZ)end)end end end,GiftReceived=tT,}for e5,t1 in pairs(t0)do local hR=mA:FindFirstChild(e5)
if hR and hR:IsA("RemoteEvent")then T(hR.OnClientEvent:Connect(t1))elseif e5~="CrateUpdate"and e5~="GiftReceived"then y("remote "..e5 .." missing")end
end end local function hS()local bN=bK()if bN then if aP(bN.name)then return{state="match",shown=bN.pretty,src="pad",info=bN}
end return{state="skip",info=bN,level="idle",text=("on pad: %s [%s] - not ticked"):format(bN.pretty,tostring(bN.rar))}
end if Q.name and(x()-Q.at)<4 then if aP(Q.name)then return{state="match",shown=aj(ab(Q.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(aj(ab(Q.name)),tostring(Q.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function e6(t2,t3,t4,t5)
local e7=RaycastParams.new()e7 .FilterType=Enum.RaycastFilterType.Exclude local hT={E.Character}for Aj,t6 in ipairs(t5 or{})do hT[#hT+1]=t6 end
e7 .FilterDescendantsInstances=hT pcall(function()e7 .RespectCanCollide=true end)local mE=aq:Raycast(Vector3 .new(t2,t3+4,t4),Vector3 .new(0,-30,0),e7)
return mE and mE.Position or nil end local function c_(mF)local mG=mF:FindFirstChildOfClass("Humanoid")return((mG and mG.HipHeight)or 2)+mF.HumanoidRootPart.Size.Y/2+0.2
end local function hU(t7,t8)local hV=t7:FindFirstChildOfClass("Humanoid")local t9=x()while x()-t9<t8 do if hV and(hV.FloorMaterial~=Enum.Material.Air or hV.SeatPart)then return true end
ad(0.05)end return false end local function aE(t_,hW,hX)local mH=t_.HumanoidRootPart mH.AssemblyLinearVelocity=Vector3 .new(0,0,0)
mH.CFrame=hX and CFrame.new(hW,Vector3 .new(hX.X,hW.Y,hX.Z))or CFrame.new(hW)end local function cj(a3,mI)local bO=ar()
if not bO or not a3 then return false end local bj=a3 .Position local e8=math.clamp(math.max(a3 .Size.X,a3 .Size.Z)/2+2.2,3,7)
local mJ=(mI and mI.MaxActivationDistance)or 10 if e8>mJ-2 then e8=math.max(2.5,mJ-2)end local da={}local function bP(db)
db=Vector3 .new(db.X,0,db.Z)if db.Magnitude>0.05 then da[#da+1]=db.Unit end end local mK=lp()if mK then bP(mK-bj)end
bP(a3 .CFrame.LookVector)bP(-a3 .CFrame.LookVector)bP(a3 .CFrame.RightVector)bP(-a3 .CFrame.RightVector)bP(bO.HumanoidRootPart.Position-bj)
if#da==0 then bP(Vector3 .new(0,0,1))end local ua,e9=c_(bO),false for Ak,ub in ipairs(da)do local e_=bj+ub*e8
local hY=e6(e_.X,bj.Y,e_.Z,{a3})if hY and math.abs(hY.Y-bj.Y)<14 then aE(bO,Vector3 .new(e_.X,hY.Y+ua,e_.Z),bj)
if hU(bO,0.7)then e9=true break end end end if not e9 then aE(bO,bj+da[1]*e8+Vector3 .new(0,3,0),bj)e9=hU(bO,1)
end ad(0.12)return e9 end local function mL(dc)if not dc.Parent or not dc.Enabled then return false end pcall(function()dc:InputHoldBegin()end)
ad(math.max(dc.HoldDuration,0)+0.08)pcall(function()dc:InputHoldEnd()end)return true end local function al(mM,uc)
local ud=x()while x()-ud<uc do if mM()then return true end ad(0.05)end return mM()end local function dd(ck,ue,mN,uf)
local ug=c.zapFirst and{"zap","hold"}or{"hold","zap"}for uh,hZ in ipairs(ug)do if uh==2 and(uf or not(ck.Parent and ck.Enabled and(not mN or mN())))then break end
local h0 if hZ=="hold"then h0=mL(ck)else h0=type(fireproximityprompt)=="function"and ck.Parent~=nil and ck.Enabled and pcall(fireproximityprompt,ck)end
if h0 and al(ue,1.2)then c.zapFirst=(hZ=="zap")return true,hZ end end return false end local function mO(h1)local bk=lA()
if not bk or not bk.Enabled then y("buy: nothing on the pad")return false end local mP=cV(bk)if not mP then y("buy: pad part missing")return false end
c.lastBuyAt=x()local ui,mQ=Q.seq,aZ()cj(mP,bk)if not bk.Enabled then y("buy aborted: pad emptied")return false end
local cl=hS()if not h1 and cl.state~="match"then y("buy aborted: "..(cl.text or"pad changed"))c.matchSince=nil
return false end local h2=cl.info and cl.info.name or(cl.state=="match"and Q.name)or nil local function uj()return bk.Enabled and aa()==nil and(h1 or hS().state=="match")
end local uk,ul=dd(bk,function()return aa()~=nil or((not bk.Enabled)and(h1 or Q.seq==ui))end,uj,mw()~=nil)if uk then
al(function()return aa()~=nil end,0.8)local de=aa()local mR=aZ()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil Q.name,Q.rar,Q.at=nil,nil,x()y(("BOUGHT %s%s via %s"):format(de and aj(ab(de))or(cl.shown or"?"),(mQ and mR)and(" for $"..aC(mQ-mR))or"",ul))
if de and h2 and ab(de)~=ab(h2)then y(("note: picked up %s, not %s"):format(de,h2))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local mS=bK()y(("BUY REFUSED: cash short? have $%s, price %s"):format(aC(aZ()),(mS and mS.price)or"?"))
return false end local function mT()local fa=aa()if not fa then c.holding=false y("place: hands are empty")return false
end if not aP(fa)then y(("REFUSED TO WAX %s - it is not ticked"):format(aj(ab(fa))))return false end for Al=1,d.PlaceTries do
local bl=ss()if not bl then y("place: no free station")break end local mU=cV(bl)if mU then cj(mU,bl)local mV=aa()
if not mV then c.holding=false y("place: hands emptied on the way")return false end if not aP(mV)then y("place: what I carry changed, not waxing it")return false end
if bl.Enabled then local um,uo=dd(bl,function()return not bl.Enabled end,function()return bl.Enabled end)if um then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 Q.name,Q.rar,Q.at=nil,nil,x()
y(("WAXED %s #%d at %s via %s"):format(aj(ab(fa)),c.placed,bl.Parent.Parent.Name,uo))return true end end end ad(0.25)
end c.placeFails=c.placeFails+1 if aa()==nil then c.holding=false end y("PLACE FAILED ("..c.placeFails..")")if c.placeFails>=2 then
c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(aa()))y(c.capMsg)end return false end function q.place()local up=x()while c.alive and q.editing and x()-up<25 do ad(0.2)end
if d.Teams and d.TeamWax~=""then q.placing=true local uq=x()while c.alive and q.current()~=d.TeamWax and x()-uq<5 do ad(0.1)end
if q.current()==d.TeamWax then ad(0.3)else y("wax team did not come on in time - placing anyway")end end local ur,mW=pcall(mT)
q.placing=false if not ur then error(mW,0)end return mW end local function mX(mY)return type(mY)=="string"and mY:lower():find("crate",1,true)~=nil
end local us={SABFarmGui=1,SABToggle=1,SABError=1}local function h3(ut)local bm=ut while bm do if us[bm.Name]then return false end
if bm:IsA("ScreenGui")then local uu,uv=pcall(function()return bm.Enabled end)return(not uu)or uv~=false end if bm:IsA("GuiObject")and not bm.Visible then return false end
bm=bm.Parent end return false end local function fb(fc)local cm=""pcall(function()if fc:IsA("TextButton")then cm=fc.Text end end)
if not cm:find("%a")then for Am,fd in ipairs(fc:GetDescendants())do if(fd:IsA("TextLabel")or fd:IsA("TextButton"))and fd.Text:find("%a")then cm=fd.Text break end
end end if not cm:find("%a")then cm=fc.Name end return(cm:lower():gsub("[^%a]",""))end local function uw()local df,dg
local mZ=E:FindFirstChildOfClass("PlayerGui")if not mZ then return nil,nil end for An,dh in ipairs(mZ:GetDescendants())do
if dh:IsA("GuiButton")and h3(dh)then local h4=fb(dh)if h4:sub(1,4)=="open"and not h4:find("shop",1,true)then df=df or dh end
if h4:sub(1,7)=="discard"then dg=dg or dh end end end if df and dg then return df,dg end if e.on then return df,dg end
return nil,nil end local h5=(function()local ux,uy=pcall(function()return game:GetService("VirtualInputManager")end)return ux and uy or nil end)()
local function m0(a4,h6)local h7={}local function m1(uz)h7[#h7+1]=uz end if c.tapWay then m1(c.tapWay)end for Ao,m2 in ipairs({"touch","conn","signal"})do
if m2~=c.tapWay then m1(m2)end end local function m3(uA,...)local uB,h8=pcall(getconnections,uA)if not(uB and type(h8)=="table"and#h8>0)then return false end
local m4,uC,uD=false,{...},select("#",...)for Ap,uE in ipairs(h8)do if pcall(function()uE:Fire(table.unpack(uC,1,uD))end)then m4=true end
end return m4 end local function m5()local m6=Vector3 .new(0,0,0)pcall(function()local m7,m8=a4 .AbsolutePosition,a4 .AbsoluteSize
m6=Vector3 .new(m7 .X+m8 .X/2,m7 .Y+m8 .Y/2,0)end)local h9={Position=m6,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()h9 .UserInputType=Enum.UserInputType.Touch end)pcall(function()h9 .UserInputState=Enum.UserInputState.End end)
return h9 end for Aq,a5 in ipairs(h7)do local di=false if a5=="conn"and type(getconnections)=="function"then if m3(a4 .MouseButton1Click)then
di=true if al(h6,1.5)then c.tapWay=a5 return true,a5 end end di=m3(a4 .Activated,m5(),1)elseif a5=="signal"and type(firesignal)=="function"then
if pcall(firesignal,a4 .MouseButton1Click)then if al(h6,1.5)then c.tapWay=a5 return true,a5 end end di=pcall(firesignal,a4 .Activated,m5(),1)
elseif a5=="touch"and h5 then di=pcall(function()local m9,m_=a4 .AbsolutePosition,a4 .AbsoluteSize local na=0
local nb=a4:FindFirstAncestorWhichIsA("ScreenGui")local uF,uG=pcall(function()return nb and nb.IgnoreGuiInset end)
if not(uF and uG)then pcall(function()na=game:GetService("GuiService"):GetGuiInset().Y end)end local nc,nd=m9 .X+m_.X/2,m9 .Y+m_.Y/2+na
h5:SendMouseButtonEvent(nc,nd,0,true,game,1)task.wait(0.06)h5:SendMouseButtonEvent(nc,nd,0,false,game,1)end)end
if di and al(h6,1.5)then c.tapWay=a5 return true,a5 end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function h_(ne)local dj=ne.Parent while dj and dj~=c.plot do if e.NOT[dj.Name]then return false end dj=dj.Parent
end local ia=(ne.ActionText or""):lower()if ia:find("roll",1,true)or ia:find("place",1,true)or ia:find("sell",1,true)then return false end
return true end local function uH()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local nf=c.plot:FindFirstChild("CrateStand")local dk if nf then for Ar,fe in ipairs(nf:GetDescendants())do
if fe:IsA("ProximityPrompt")and fe.Enabled and h_(fe)then dk=fe break end end end if not dk then for As,bn in ipairs(c.plot:GetDescendants())do
if bn:IsA("ProximityPrompt")and bn.Enabled and h_(bn)then local ng=bn:FindFirstAncestorWhichIsA("Model")local uI=((bn.ActionText or"").." "..(bn.ObjectText or"").." "..bn.Name.." "..(ng and ng.Name or"")):lower()
if uI:find("crate",1,true)then dk=bn break end end end end e.prompt=dk return dk end local function ib()if e.on then return true end
local dl=uH()if not dl then e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local nh=cV(dl)if nh then cj(nh,dl)end e.ours=true dd(dl,function()return e.on end)if al(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: pressed "..eu(dl).." but no window came up")
return false end do local function uJ(ni)local cn=ni.Parent while cn and cn:IsA("GuiObject")do local nj,nk=false,false
for At,dm in ipairs(cn:GetDescendants())do if dm~=ni and dm:IsA("GuiButton")and fb(dm):sub(1,7)=="discard"then nj=true end
if dm:IsA("TextLabel")then local ic=dm.Text:lower()if ic:find("crate",1,true)or ic:find("can contain",1,true)or ic:find("cost",1,true)then nk=true end
end if nj and nk then return cn end end cn=cn.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local nl=E:FindFirstChildOfClass("PlayerGui")if not nl then return nil end for Au,ff in ipairs(nl:GetDescendants())do
if ff:IsA("GuiButton")and not ff:FindFirstAncestor("SABFarmGui")and fb(ff):sub(1,4)=="open"then local ie=uJ(ff)
if ie then e.win=ie return ie end end end end local function uK(uL)for Av,fg in ipairs(uL:GetDescendants())do
if fg:IsA("GuiButton")then local nm,ig=fb(fg),fg.Name:lower()if nm=="x"or nm=="close"or ig=="x"or ig:find("close",1,true)or ig:find("exit",1,true)then return fg end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(uM)task.wait(uM and 4 or 1.2)if e.on or e.waiting then return end
local fh=e.findWin()if not fh or not h3(fh)then return end local nn=uK(fh)if nn and m0(nn,function()return not h3(fh)end)then return end
y("the crate window is still open - tap its X")end end local function fi(fj)if not ib()then return false end local no=x()-(e.openedAt or 0)
if no<0.6 then ad(0.6-no)end local ih=e.title local uN,uO=uw()local np=fj and uN or uO if not np then e.lastFail=x()
c.crateFails=c.crateFails+1 y(("crate: no %s button found in %s"):format(fj and"Open"or"Discard",ih))return false
end local uP=aa()local uQ,Aw=m0(np,function()return(not e.on)or(aa()~=nil and aa()~=uP)end)if not uQ then e.lastFail=x()
c.crateFails=c.crateFails+1 y("crate: could not press "..(fj and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fj then c.crates=c.crates+1 al(function()return aa()~=nil end,1.5)local nq=aa()
y(("OPENED %s -> %s"):format(ih,nq and aj(ab(nq))or"?"))else y("discarded "..ih.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(uR,...)local uS=select("#",...)e.calls[#e.calls+1]={t=x(),m=uR,n=uS,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(ay,a6)local bo=type(ay)if(bo=="string"or bo=="number")and type(a6 .data)=="table"then for nr,ii in pairs(a6 .data)do
if ii==ay and type(nr)=="string"and(type(ii)=="string"or type(ii)=="number")then return{__slot="f:"..nr}end end
end if bo=="string"then if a6 .crate and ay==a6 .crate then return{__slot="crate"}end if a6 .title and ay==a6 .title then return{__slot="title"}end
if a6 .rar and ay==a6 .rar then return{__slot="rarity"}end return ay end if bo=="number"or bo=="boolean"or bo=="nil"then return ay end
if bo=="table"then local ns={}for uT,nt in pairs(ay)do if type(nt)=="table"then return nil,"nested table"end local uU,nu=e.slot(nt,a6)
if nu then return nil,nu end ns[uT]=uU end return ns end local uV,uW=pcall(function()return ay:IsA("Instance")end)
if uV and uW then if ay==E then return{__slot="player"}end if c.plot and ay==c.plot then return{__slot="plot"}end
local fk=c.plot and c.plot:FindFirstChild("CrateStand")if fk and ay==fk then return{__slot="stand"}end if fk and ay.Parent==fk then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bo..")"end function e.resolve(fl)if type(fl)~="table"then return fl end
local aI=fl.__slot if aI and aI:sub(1,2)=="f:"then return e.data and e.data[aI:sub(3)]end if aI=="crate"then return e.data and e.data.name end
if aI=="title"then return(e.data and e.data.title)or e.title end if aI=="rarity"then return e.data and e.data.rarity end
if aI=="player"then return E end if aI=="plot"then return c.plot end if aI=="stand"or aI=="model"then local ij=c.plot and c.plot:FindFirstChild("CrateStand")
if aI=="stand"or not ij then return ij end for Ax,nv in ipairs(ij:GetChildren())do if mX(nv.Name)then return nv end end
return nil end local nw={}for uX,uY in pairs(fl)do nw[uX]=e.resolve(uY)end return nw end function e.classify(ik)
if e.directOff then return end local fm={}for Ay,il in ipairs(e.calls)do if il.t<=ik+0.05 and ik-il.t<=6 then fm[#fm+1]=il end
end if#fm==0 then return end if not al(function()return(e.heldAt or 0)>=ik-1 end,2.5)then return end local dn={}
for Az,dp in ipairs(fm)do local nx={}for ny=1,dp.n do local uZ,nz=e.slot(dp.args[ny],dp)if nz then y("crate call has "..nz.." - keeping the button method")
return end nx[ny]=uZ end dn[#dn+1]={m=dp.m,n=dp.n,args=nx}end local im=e.learned e.learned={seq=dn,mode=im and im.mode or nil}
ae.dirty=true if not im then y(("learned how to open crates directly (%d call%s)"):format(#dn,#dn==1 and""or"s"))end
end function e.replay()local nA=e.learned local nB=ap:FindFirstChild("Remotes")local io=nB and nB:FindFirstChild("CrateAction")
if not(nA and io)then return false end local nC=table.unpack or unpack e.replaying=true for AA,dq in ipairs(nA.seq)do
local ip={}for nD=1,dq.n do ip[nD]=e.resolve(dq.args[nD])end task.spawn(function()pcall(function()if dq.m=="InvokeServer"then io:InvokeServer(nC(ip,1,dq.n))
else io:FireServer(nC(ip,1,dq.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(u0)return(u0:gsub("[%%|;=,\n]",function(u1)return("%%%02X"):format(u1:byte())end))end
function e.enc(bQ)local fn=type(bQ)if fn=="string"then return"s"..e.esc(bQ)end if fn=="number"then return"n"..tostring(bQ)end
if fn=="boolean"then return bQ and"b1"or"b0"end if fn=="nil"then return"z"end if bQ.__slot then return"k"..bQ.__slot end
local iq={}for u2,u3 in pairs(bQ)do iq[#iq+1]=e.enc(u2).."="..e.enc(u3)end return"t"..table.concat(iq,",")end
function e.dec(nE)local dr,ds=nE:sub(1,1),nE:sub(2)local function u4(u5)return(u5:gsub("%%(%x%x)",function(u6)return string.char(tonumber(u6,16))end))end
if dr=="s"then return u4(ds)end if dr=="n"then return tonumber(ds)end if dr=="b"then return ds=="1"end if dr=="k"then return{__slot=ds}end
if dr=="t"then local nF={}for u7 in ds:gmatch("[^,]+")do local nG,u8=u7:match("^(.-)=(.*)$")if nG then local nH=e.dec(nG)
if nH~=nil then nF[nH]=e.dec(u8)end end end return nF end return nil end function e.goneOrNew(u9)return function()
if not e.waiting then return true end local nI=aa()return nI~=nil and nI~=u9 end end function e.near()local nJ=ap:FindFirstChild("Remotes")
local nK=nJ and nJ:FindFirstChild("CrateAction")local ir=ar()local is=c.plot and c.plot:FindFirstChild("CrateStand")
local it=is and is:FindFirstChild("Spot")if not(nK and ir and it)then return false,"no crate stand or remote"end
local iu=ir.HumanoidRootPart local fo=iu.CFrame local nL,iv=e.title,"no answer"local u_=aa()local nM=is:FindFirstChild("Holder")
local function nN()if not nM then return e.waiting or e.on end for AB,va in ipairs(nM:GetChildren())do if va:IsA("Model")then return true end end
return false end for vb=1,3 do if not(e.waiting or e.on)or not nN()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(iu.Position-it.Position).Magnitude>8 then cj(it,e.prompt)end ad(0.12+0.15*vb)
local aR={}e.replaying=true task.spawn(function()aR.ok,aR.v=pcall(function()return nK:InvokeServer("open")end)
aR.done=true end)al(function()return aR.done end,6)e.replaying=false local bR=aR.v if aR.done and aR.ok and type(bR)=="table"and bR.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 y(("OPENED %s -> %s (no window)"):format(nL,bR.prize and aj(ab(tostring(bR.prize)))or"?"))
al(function()local nO=aa()return nO~=nil and nO~=u_ end,1.5)if(iu.Position-fo.Position).Magnitude>8 then pcall(function()aE(ir,fo.Position,fo.Position+fo.LookVector)end)end
return true,"opened"end iv=(aR.done and aR.ok and type(bR)=="table")and tostring(bR.reason or"refused, no reason given")
or(aR.done and("error: "..tostring(bR))or"no answer in 6s")ad(0.3)if not nN()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 y(("crate: the server would not open %s next to the stand (%s)"):format(nL,iv))
return false,iv end function e.smart()local iw=e.title if(e.nearFails or 0)<3 then local vc=e.near()if vc then return true end
if e.nearFails>=3 then y("opening next to the stand failed 3 times - trying the older ways")end end local bS=e.learned
if bS then local ix=aa()if e.on then e.replay()if al(e.goneOrNew(ix),3.5)then c.crates=c.crates+1 y("OPENED "..iw.." (direct)")
return true end else if bS.mode~="window"then e.replay()if al(e.goneOrNew(ix),3.5)then c.crates,e.fails=c.crates+1,0
if bS.mode~="direct"then bS.mode,ae.dirty="direct",true y("crates now open directly - the window never comes up")
end y("OPENED "..iw.." (direct, no window)")return true end end if ib()then e.replay()if al(e.goneOrNew(ix),3.5)then
c.crates,e.fails=c.crates+1,0 if bS.mode~="window"then bS.mode,ae.dirty="window",true y("crates need their window up first - it shows briefly")
end y("OPENED "..iw.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ae.dirty=bS,nil,true
if e.fails>=3 then e.directOff=true y("direct crate opening failed 3 times - using the button for now")else y("the learned crate call did not work - back to pressing Open")
end end return fi(true)end function A.snap()return{rules=E:GetAttribute("AutoRollRules"),stop=E:GetAttribute("AutoRollStop"),
on=E:GetAttribute("AutoRollOn"),main=E:GetAttribute("AutoRoll")}end A.cache={}function A.watchCache()A.cache=A.snap()
for vd,nP in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(E:GetAttributeChangedSignal(nP):Connect(function()A.cache[vd]=E:GetAttribute(nP)end))
end end function A.isOn()return E:GetAttribute("AutoRollOn")==true end function A.saw(ve,...)local fp=A.cache
local vf={m=ve,n=select("#",...),args={...},before={rules=fp.rules,stop=fp.stop,on=fp.on,main=fp.main}}task.delay(1.5,function()
if c.alive then pcall(A.learnOne,vf)end end)end function A.learnOne(dt)local as,du=A.snap(),dt.before local fq=(as.rules~=du.rules)or(as.stop~=du.stop)
local nQ=(as.on~=du.on)or(as.main~=du.main)if not fq and not nQ then return end local nR={}for nS=1,dt.n do local aF=dt.args[nS]
local bT=type(aF)if bT=="string"and aF~=""and aF==as.rules then aF={__slot="rules"}elseif bT=="string"and aF~=""and fq and aF==as.stop and as.stop~=du.stop then aF={__slot="stop"}
elseif bT=="table"then local nT={}for vg,co in pairs(aF)do if type(co)=="table"or(type(co)=="userdata")then A.msg="Auto Roll sends something I cannot repeat"return
end nT[vg]=(type(co)=="string"and co~=""and co==as.rules)and{__slot="rules"}or co end aF=nT elseif bT~="string"and bT~="number"and bT~="boolean"and bT~="nil"then
if aF==E then aF={__slot="player"}else A.msg="Auto Roll sends something I cannot repeat"return end end nR[nS]=aF
end local cp={m=dt.m,n=dt.n,args=nR}if fq then local iy=false for vh=1,cp.n do local dv=cp.args[vh]if type(dv)=="table"and dv.__slot=="rules"then iy=true end
if type(dv)=="table"and not dv.__slot then for AC,nU in pairs(dv)do if type(nU)=="table"and nU.__slot=="rules"then iy=true end end
end end if iy then A.rec.rules={cp}else table.insert(A.rec.rules,cp)if#A.rec.rules>60 then table.remove(A.rec.rules,1)end
end end if nQ then if as.on==true then A.rec.on=cp else A.rec.off=cp end d.AutoRoll=(as.on==true)end if as.rules and as.rules~=""then d.ARrules,d.ARstop=as.rules,as.stop or""end
ae.dirty=true A.msg=""y(("learned an Auto Roll %s message"):format(fq and"choices"or(as.on and"on"or"off")))end
function A.resolve(cq)if type(cq)~="table"then return cq end if cq.__slot=="rules"then return d.ARrules~=""and d.ARrules or E:GetAttribute("AutoRollRules")end
if cq.__slot=="stop"then return d.ARstop~=""and d.ARstop or E:GetAttribute("AutoRollStop")end if cq.__slot=="player"then return E end
local nV={}for vi,vj in pairs(cq)do nV[vi]=A.resolve(vj)end return nV end function A.replay(nW,vk)local nX=table.unpack or unpack
for AD,dw in ipairs(vk)do local iz={}for nY=1,dw.n do iz[nY]=A.resolve(dw.args[nY])end A.replaying=true pcall(function()
if dw.m=="InvokeServer"then task.spawn(function()pcall(function()nW:InvokeServer(nX(iz,1,dw.n))end)end)else nW:FireServer(nX(iz,1,dw.n))end
end)A.replaying=false task.wait(0.25)end end function A.apply(nZ,vl)if A.busy or not c.alive then return end A.busy=true
pcall(function()local n0=ap:FindFirstChild("Remotes")local iA=n0 and n0:FindFirstChild("AutoRollAction")if not iA then A.msg="this game has no AutoRollAction"return end
local bp=d.AutoRoll if bp and d.ARrules~=""and E:GetAttribute("AutoRollRules")~=d.ARrules then if#A.rec.rules==0 then
A.msg="pick your Auto Roll choices once in the game's menu so I can learn them"y(A.msg)else A.replay(iA,A.rec.rules)
if al(function()return E:GetAttribute("AutoRollRules")==d.ARrules end,4)then y("Auto Roll choices put back")else
A.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"y(A.msg)end end end if bp==A.isOn()or(not bp and not vl)then return end
local fr=bp and A.rec.on or A.rec.off if not fr then local dx=bp and A.rec.off or A.rec.on local n1=dx~=nil for vm=1,dx and dx.n or 0 do
if type(dx.args[vm])=="boolean"then n1=false end end if n1 then fr=dx end end if not fr then A.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bp and"on"or"off")
y(A.msg)return end A.replay(iA,{fr})if al(function()return A.isOn()==bp end,4)then A.msg=""y(("Auto Roll switched %s%s"):format(bp and"ON"or"OFF",nZ and(" ("..nZ..")")or""))
else A.msg="Auto Roll did not switch - do it once in the game so I can relearn it"y(A.msg)end end)A.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local vn,vo=pcall(function()return E.UserId end)return vn and vo or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local vp,iB=pcall(function()return require(ap:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if vp and type(iB)=="table"and type(iB.Pets)=="table"then j.I=iB end return j.I end function j.order()if j.list then return j.list end
local bq=j.info()if not bq then return{}end local bU={}if type(bq.Order)=="table"and#bq.Order>0 then for AE,n2 in ipairs(bq.Order)do if bq.Pets[n2]then bU[#bU+1]=n2 end end
else for vq in pairs(bq.Pets)do bU[#bU+1]=vq end table.sort(bU,function(vr,vs)return(bq.Pets[vr].price or 0)<(bq.Pets[vs].price or 0)end)
end j.list=bU return bU end function j.nice(n3,iC)local n4=j.info()local n5=n4 and n4 .Pets[n3]return((iC and iC~="")and(iC.." ")or"")..(n5 and n5 .displayName or tostring(n3))
end function j.data()local fs=E:GetAttribute("PetsData")if type(fs)~="string"then return nil end if fs==j.rawD then return j.lastD end
local vt,dy=pcall(function()return j.HS:JSONDecode(fs)end)dy=(vt and type(dy)=="table")and dy or nil j.rawD,j.lastD=fs,dy
return dy end function j.pen()return ap:FindFirstChild("PetMeadowSpawns")end function j.srv()return aq:GetServerTimeNow()end
function j.money()local iD=E:FindFirstChild("MoneyValue")if iD and type(iD.Value)=="number"then return iD.Value end
return aZ()or 0 end function j.wishes()local n6=j.pen()local n7=n6 and n6:GetAttribute("Wishes")local iE,n8={},j.srv()
if type(n7)~="string"then return iE end local vu,n9=pcall(function()return j.HS:JSONDecode(n7)end)if vu and type(n9)=="table"then
for vv,iF in pairs(n9)do if type(iF)=="number"and iF>n8 then iE[vv]=iF-n8 end end end return iE end function j.call(...)
local n_=ap:FindFirstChild("Remotes")local oa=n_ and n_:FindFirstChild("PetRequest")if not oa then return nil end
local ob=table.pack(...)local bV={}task.spawn(function()bV.ok,bV.v=pcall(function()return oa:InvokeServer(table.unpack(ob,1,ob.n))end)
bV.done=true end)local vw=x()while not bV.done and x()-vw<6 do task.wait(0.05)end if bV.done and bV.ok then return bV.v end
return nil end function j.want(vx)return d.Pets[vx]end function j.closeNaming(iG)local od=pcall(function()local oc=E:FindFirstChild("PlayerScripts")
local vy=oc and oc:FindFirstChild("Naming",true)require(vy).close()end)ad(0.5)if iG.Visible then pcall(function()local oe=iG:FindFirstChild("NameBox",true)if oe then oe:ReleaseFocus()end end)
iG.Visible=false od=false end return od end function j.skipNaming()j.namingUntil=x()+10 if j.namingOn then return end
j.namingOn=true task.spawn(function()while c.alive and x()<j.namingUntil do local of=E:FindFirstChildOfClass("PlayerGui")
local og=of and of:FindFirstChild("MainGui")local ft=og and og:FindFirstChild("PetNameGui")if ft and ft.Visible then
ad(0.4)if ft.Visible then j.namingShut=(j.namingShut or 0)+1 pcall(j.closeNaming,ft)break end end ad(0.25)end
j.namingOn=false end)end function j.buyTick()if not d.PetBuy then j.buyMsg="auto adopt is off"return end local iH,oh,fu=j.info(),j.pen(),j.data()
if not(iH and oh and fu)then j.buyMsg="pet data not loaded yet"return end j.tryAt=j.tryAt or{}local dz,iI=#(fu.pets or{}),tonumber(fu.maxOwned)or 60
local vz,oi,dA=j.srv(),{},nil for AF,aJ in ipairs(oh:GetChildren())do oi[aJ.Name]=true local bW,fv=aJ:GetAttribute("Pet"),aJ:GetAttribute("Variant")or""
local iJ=bW and j.want(bW)if iJ and iJ.b and iH.Pets[bW]and(not iJ.g or fv=="Big")and z.wantMore(bW,fv,fu)and not aJ:GetAttribute("A_"..j.uid)
and(tonumber(aJ:GetAttribute("ExpiresAt"))or 0)>vz+1 and x()>=(j.tryAt[aJ.Name]or 0)then local dB,oj=j.nice(bW,fv),iH.Pets[bW].price or 0
if dz>=iI then dA=("%s is in the pen, but you have %d/%d pets"):format(dB,dz,iI)j.tryAt[aJ.Name]=x()+15 elseif j.money()<oj then
dA=("%s is in the pen - need $%s"):format(dB,aC(oj))j.tryAt[aJ.Name]=x()+5 else j.tryAt[aJ.Name]=x()+8 local br=j.call("adopt",aJ.Name)
if type(br)=="table"and br.ok then dz=dz+1 j.buys=(j.buys or 0)+1 j.recent=j.recent or{}local vA=type(br.pet)=="table"and br.pet or{}
table.insert(j.recent,{id=tostring(vA.id or("?"..x())),name=bW,variant=fv,at=x()})if#j.recent>30 then table.remove(j.recent,1)end
y("ADOPTED "..dB)j.skipNaming()dA="adopted "..dB else local ol=type(br)=="table"and tostring(br.reason or"no reason given")or"no answer"
y(("adopt %s failed: %s"):format(dB,ol))dA="adopt failed: "..ol if type(br)=="table"and br.bagFull then j.tryAt[aJ.Name]=x()+60 end
end end end end for om in pairs(j.tryAt)do if not oi[om]then j.tryAt[om]=nil end end j.buyMsg=dA or("watching the pen (%d/%d pets)"):format(dz,iI)
end function j.wishTick()if not d.PetWish then j.wishMsg="auto wish is off"return end local fw=j.info()if not(fw and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local fy,iK,bs=j.wishes(),0,nil local vB=(type(fw.Wish)=="table"and fw.Wish.cashShare)or 2
local vC=j.data()for AG,aw in ipairs(j.order())do local oo=j.want(aw)if oo and oo.w and z.wantMore(aw,"",vC)then
iK=iK+1 if not fy[aw]and x()>=(j.wishTry[aw]or 0)then local iL=tonumber(E:GetAttribute("PetWishCredits"))or 0
local iM=math.floor((fw.Pets[aw].price or 0)*vB)if iL<=0 and j.money()<iM then j.wishTry[aw]=x()+10 bs=("need $%s to wish for %s"):format(aC(iM),j.nice(aw))
j.wishWhy[aw]=bs else j.wishTry[aw]=x()+3 local vD=iL>0 and"wishCredit"or"wish"local fz=j.call(vD,aw)if type(fz)=="table"and fz.ok then
j.wishN,j.wishWhy[aw]=j.wishN+1,nil y(("WISHED for %s (%s)"):format(j.nice(aw),iL>0 and"free wish"or("$"..aC(iM))))
else local iN=type(fz)=="table"and tostring(fz.reason or"no reason given")or"no answer"if iN:lower():find("already",1,true)then j.wishTry[aw]=x()+2
else y(("wish %s failed: %s"):format(j.nice(aw),iN))bs="wish failed: "..iN end end end end end end if not bs then
for AH,fA in ipairs(j.order())do local op=j.want(fA)if op and op.w and not fy[fA]and j.wishWhy[fA]then bs=j.wishWhy[fA]break end
end end if not bs then local fB={}for AI,fC in ipairs(j.order())do local oq=j.want(fC)if oq and oq.w and fy[fC]then fB[#fB+1]=("%s %dm"):format(j.nice(fC),math.ceil(fy[fC]/60))end
end bs=iK==0 and"no pet has WISH ticked"or("running: "..(#fB>0 and table.concat(fB,", ")or"none yet"))end j.wishMsg=bs
end q.switches,q.glazed,q.finished=0,0,0 q.done,q.doneN,q.later={},0,{}function q.teams()local iO=j.data()return(iO and iO.teams)or{},iO
end function q.current(cr)cr=cr or j.data()if not cr then return""end local ot={}for AJ,vE in ipairs(cr.equipped or{})do ot[tostring(vE)]=true end
for AK,ou in ipairs(cr.teams or{})do local ov=ou.pets or{}local iP=#ov==#(cr.equipped or{})if iP then for AL,vF in ipairs(ov)do if not ot[tostring(vF)]then iP=false break end end end
if iP then return ou.name end end return""end function q.equip(iQ)local vG,vH=q.teams()local iR for vI,vJ in ipairs(vG)do if vJ.name==iQ then iR=vI break end end
if not iR then q.msg="no saved team called "..tostring(iQ)return false end if q.current(vH)==iQ then return true end
for AM=1,4 do local ow=j.call("teamEquip",iR)if type(ow)=="table"and ow.ok then q.switches=q.switches+1 return true
end task.wait(0.4)end return false end function q.left(vK)local ox=vK:FindFirstChild("SquishyPlaceHolder")local oy=ox and ox:FindFirstChild("TimerGui")
local oz=oy and oy:FindFirstChildWhichIsA("TextLabel",true)local iS=oz and oz.Text if type(iS)~="string"or iS:find("-",1,true)then return nil end
local iT,oA,oB=iS:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not iT then return nil end local oC=oB~=""and(tonumber(iT)*3600+tonumber(oA)*60+tonumber(oB))or(tonumber(iT)*60+tonumber(oA))
return oC>0 and oC or nil end function q.waxes()local dC={}local oD=c.plot and c.plot:FindFirstChild("WaxStations")
if not oD then return dC end local oE=j.srv()for AN,aS in ipairs(oD:GetChildren())do local iU=tonumber(aS:GetAttribute("PourEnd"))
local oF=aS:GetAttribute("PourOwner")if aS:GetAttribute("HasSquishy")and aS:GetAttribute("PourId")and(oF==nil or oF==j.uid)then
local iV=q.left(aS)local oG=iV and(oE+iV)or((iU and iU>oE)and iU or nil)if oG then local oH,oI=aS:FindFirstChild("SquishyPlaceHolder"),"?"
if oH then for AO,oJ in ipairs(oH:GetChildren())do if oJ:IsA("Model")then oI=oJ.Name break end end end local vL=tostring(aS:GetAttribute("Helpers")or"")
local iW=0 for AP in vL:gmatch("%d+")do iW=iW+1 end dC[#dC+1]={st=aS,ends=oG,sure=iV~=nil,id=aS:GetAttribute("PourId"),name=oI,helps=iW,
long=aS:GetAttribute("PourLong")==true}end end end table.sort(dC,function(vM,vN)return vM.ends<vN.ends end)return dC
end function q.glazeCount()local oK=ap:FindFirstChild("Remotes")local oL=oK and oK:FindFirstChild("EditStack")
if not oL then return nil end local vO,dD=pcall(function()return oL:InvokeServer("State",nil)end)if not(vO and type(dD)=="table"and type(dD.state)=="table")then return nil end
local iX,iY=0,{}for AQ,fD in ipairs(dD.state.entries or{})do if fD.glaze and fD.glaze~=""then iX=iX+1 iY[fD.glaze]=(iY[fD.glaze]or 0)+1 end
end return iX,iY,#(dD.state.entries or{}),dD.state.capacity end function q.finishedOne(fE,oM)q.finished=q.finished+1
task.wait(2)local iZ,vP,oN,vQ=q.glazeCount()if iZ and oM and iZ>oM then q.glazed=q.glazed+1 local i0={}for vR,vS in pairs(vP)do i0[#i0+1]=vR.." "..vS end
y(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(aj(ab(fE.name)),fE.st.Name,iZ,table.concat(i0,", ")))
else y(("wax done on station %s: %s, no glaze%s"):format(fE.st.Name,aj(ab(fE.name)),oN and(" (stack "..oN.."/"..tostring(vQ)..")")or""))
end end function q.tick()q.list=q.waxes()if q.editing and x()-(q.editingSince or x())>120 then q.editing=false end
if q.editing then q.msg="rebuilding teams..."return end if not d.Teams then q.want,q.msg="","auto teams is off"return end
local cs=j.srv()local az=q.glazeFor if az then local dE=az.st local oO=dE.Parent and dE:GetAttribute("HasSquishy")and dE:GetAttribute("PourId")==az.id
local oP=oO and q.left(dE)if oP then az.ends=cs+oP end if not oO then q.glazeFor,q.afterUntil=nil,x()+1.5 if not q.done[az.id or"?"]then
q.done[az.id or"?"],q.doneN=true,q.doneN+1 if q.doneN>400 then q.done,q.doneN={[az.id or"?"]=true},1 end local vT=az.before
task.spawn(function()pcall(q.finishedOne,az,vT)end)end elseif az.ends-cs>d.GlazeLead*3+60 or cs>az.ends+90 then
q.glazeFor,q.afterUntil=nil,x()+1.5 q.later[az.id or"?"]=x()+120 y(("station %s is not finishing yet (%s left) - glaze team off again"):format(dE.Name,q.clock(az.ends-cs)))
end end if d.TeamGlaze~=""and not q.glazeFor then local vU=q.speedRatio(d.TeamGlaze)for AS,bX in ipairs(q.list)do
if bX.sure and(bX.ends-cs)*vU[bX.long and 2 or 1]<=d.GlazeLead and x()>=(q.later[bX.id or"?"]or 0)and not q.done[bX.id or"?"]then
q.glazeFor=bX task.spawn(function()bX.before=q.glazeCount()end)break end end end local aG,fF="",""if d.TeamGlaze~=""and(q.glazeFor or x()<(q.afterUntil or 0))then
aG,fF=d.TeamGlaze,q.glazeFor and(" - station "..q.glazeFor.st.Name.." finishes soon")or""elseif d.TeamWax~=""and(q.placing or q.aboutToPlace())then
aG,fF=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and q.allBusy()then aG,fF=d.TeamFull," - every station is busy"
else aG=d.TeamNormal end q.want=aG local dF=q.current()q.cur=dF if aG~=""and dF~=aG and x()>=(q.nextTry or 0)then
q.nextTry=x()+1.1 if q.equip(aG)then y("team: "..aG..fF)else q.nextTry=x()+3 end end local i1=q.list[1]q.msg=("on: %s%s | next wax done %s"):format(dF~=""and dF or"(not a saved team)",(aG~=""and aG~=dF)and(" -> "..aG)or"",
i1 and("in "..q.clock(i1 .ends-cs).." (st "..i1 .st.Name..")")or"- none running")end function q.clock(bt)bt=math.max(0,math.floor(bt))
if bt>=3600 then return("%d:%02d:%02d"):format(math.floor(bt/3600),math.floor((bt%3600)/60),bt%60)end return("%d:%02d"):format(math.floor(bt/60),bt%60)
end function q.allBusy()local vV,vW=ew()return vW>0 and vV==0 end function q.aboutToPlace()if not c.running then return false end
local oQ=aa()if not(oQ and aP(oQ))then return false end local vX=ew()return vX>0 end function q.mult(oR,vY,oS)return{(1+oR)*(1+oS),(1+oR+vY)*(1+oS)}end
function q.speedNow()local function i2(vZ)return tonumber(E:GetAttribute(vZ))or 0 end return q.mult(i2("PetWaxSpeed"),i2("PetLongWax"),i2("PetSocialWax"))
end function q.speedOf(v0)local v1,oT=q.teams()if not oT then return nil end for AT,oU in ipairs(v1)do if oU.name==v0 then
local i3={}for AU,v2 in ipairs(oU.pets or{})do for AV,oV in ipairs(oT.pets or{})do if tostring(oV.id)==tostring(v2)then i3[#i3+1]=oV break end end
end local oW=z.caps()local oX,v3=z.stats(i3)return q.mult(math.min(oX.waxSpeed or 0,oW.waxSpeed or 0.25),math.min(oX.longWax or 0,oW.longWax or 0.3),v3 .socialWax or 0)
end end return nil end function q.speedRatio(v4)local oY,i4=q.speedNow(),q.speedOf(v4)if not i4 then return{1,1}end
return{oY[1]/i4[1],oY[2]/i4[2]}end function q.glazeSoon()return d.Teams and d.TeamGlaze~=""and(q.glazeFor~=nil or x()<(q.afterUntil or 0))
end z.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
z.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}z.buildMsg,z.fuseMsg,z.fused,z.builds="","",0,0
function z.need()return E:GetAttribute("FusePass")==true and 3 or 7 end function z.caps()local i5=j.info()return(i5 and type(i5 .Caps)=="table")and i5 .Caps or z.CAPS
end function z.value(oZ,i6)local fG=j.info()local ct=fG and fG.Pets[oZ]if not(ct and type(ct.boost)=="table")then return nil end
local bY if type(fG.boostValue)=="function"then local v5,v6=pcall(fG.boostValue,oZ,(i6~=""and i6)or nil)bY=v5 and tonumber(v6)or nil
end if not bY then bY=ct.boost.value or 0 if i6=="Big"then local o0=bY*1.5 bY=z.ROUND[ct.boost.kind]and math.max(bY+1,math.floor(o0+0.5))or o0
end end return ct.boost.kind,bY,ct.boost.every end function z.stats(v7)local bZ,i7={},{}for AW,o1 in ipairs(v7)do
local aK,fH,o2=z.value(o1 .name,o1 .variant or"")if aK then if aK:sub(1,6)=="social"then i7[aK]=math.max(i7[aK]or 0,fH)
elseif aK=="waxStir"or aK=="cashGift"then bZ[aK]=(bZ[aK]or 0)+fH*60/(o2 or 60)elseif aK=="luckyPull"then bZ.luckyPull=(bZ.luckyPull or 0)+fH/(o2 or 10)
else bZ[aK]=(bZ[aK]or 0)+fH end end end return bZ,i7 end function z.glazeGain(v8,fI)local dG,i8,AX={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local v9=dG[1]+dG[2]+dG[3]local v_=tonumber(E:GetAttribute("GuildUpGlaze"))or 0 local cu={}for fJ=1,3 do cu[fJ]=dG[fJ]+v8*dG[fJ]/v9+(fJ==1 and v_ or 0)end
local i9={cu[1]*(1-fI),cu[2]*(1-fI)+cu[1]*fI,cu[3]+cu[2]*fI}return i9[1]*(i8[1]-1)+i9[2]*(i8[2]-1)+i9[3]*(i8[3]-1)
end function z.score(fK,wa)local i_=z.caps()local fL,fM=z.stats(wa)local function bu(o3)return math.min(fL[o3]or 0,i_[o3]or math.huge)end
local wb=(1+bu("income"))*(1+(fM.socialIncome or 0))*(1+math.min(fL.cashGift or 0,i_.cashGiftPerMinute or 9)/60)
local wc=1+bu("luck")+(fL.luckyPull or 0)+(fM.socialLuck or 0)local o4=wc*(1+bu("newFind"))local dH=math.log(wb)
local wd=math.max(tonumber(E:GetAttribute("WaxStations"))or 18,1)local ja=(1+bu("waxSpeed")+bu("longWax"))*(1+(fM.socialWax or 0))
+math.min(fL.waxStir or 0,i_.waxStirPerMinute or 30)/60/wd local we=1-(1-bu("headStart"))*(1-(fM.socialHeadStart or 0))
if fK=="farm"then return dH+0.7*math.log(o4)+0.1*math.log(ja)end if fK=="full"then return dH+0.4*math.log(ja)+0.02*math.log(o4)end
if fK=="glaze"then return z.glazeGain(bu("glaze"),bu("glazeUp"))+0.001*dH end if fK=="wax"then return-math.log(1-0.5*we)+0.001*dH+0.001*math.log(ja)end
return dH end function z.best(o5,cv,wf,jb)jb=jb or{}local au,dI={},{}local function o6(wg)local o7={}for wh,wi in ipairs(wg)do o7[wh]=cv[wi]end return o7 end
local function jc(o8)local jd=z.score(o5,o6(o8))for AY,wj in ipairs(o8)do if jb[cv[wj].id]then jd=jd+1e-7 end end
return jd end for AZ=1,math.min(wf,#cv)do local fN,je for jf=1,#cv do if not dI[jf]then au[#au+1]=jf local o9=jc(au)
au[#au]=nil if not je or o9>je+1e-12 then fN,je=jf,o9 end end end if not fN then break end dI[fN]=true au[#au+1]=fN
end for A0=1,6 do task.wait()local o_,pa=false,jc(au)for jg=1,#au do for jh=1,#cv do if not dI[jh]then local pb=au[jg]
au[jg]=jh local pc=jc(au)if pc>pa+1e-9 then dI[pb],dI[jh],pa,o_=nil,true,pc,true else au[jg]=pb end end end end
if not o_ then break end end local pd={}for wk,wl in ipairs(au)do pd[wk]=tostring(cv[wl].id)end return pd,z.score(o5,o6(au))
end function z.count(pe,pf,wm)local dJ,dK={},0 local pg,ph={},{}for A1,wn in ipairs(pf.arriving or{})do pg[tostring(wn)]=true end
for A2,cw in ipairs(pf.pets or{})do ph[tostring(cw.id)]=true if cw.name==pe and not pg[tostring(cw.id)]then if cw.variant=="Big"then dK=dK+1 elseif(cw.variant or"")==""then dJ[#dJ+1]=cw end
end end if not wm then for A3,dL in ipairs(j.recent or{})do if dL.name==pe and not ph[dL.id]and x()-dL.at<20 then
if dL.variant=="Big"then dK=dK+1 else dJ[#dJ+1]=dL end end end end return dJ,dK end function z.goal(wo)local pj=d.Pets[wo]return pj and tonumber(pj.f)or 0 end
function z.wantMore(pk,wp,pl)local ji=z.goal(pk)if ji<=0 or not pl then return true end local wq,pm=z.count(pk,pl)
if pm>=ji then return false end if wp=="Big"then return true end return#wq<z.need()*(ji-pm)end function z.status(pn,po)
local fO=z.goal(pn)if fO<=0 or not po then return nil end local wr,jj=z.count(pn,po)if jj>=fO then return("Big %d/%d done"):format(jj,fO)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#wr,z.need()),z.need(),jj,fO)end function z.wear(jk)local jl={}
for A4,ws in ipairs(jk)do jl[tostring(ws)]=true end for A5=1,3 do local cx=j.data()if not cx then return false end
for A6,pp in ipairs(cx.equipped or{})do if not jl[tostring(pp)]then j.call("unequip",pp)task.wait(0.3)end end
cx=j.data()local pq={}for A7,wt in ipairs(cx.equipped or{})do pq[tostring(wt)]=true end for A8,pr in ipairs(jk)do
if not pq[tostring(pr)]then j.call("equip",pr)task.wait(0.3)end end task.wait(0.4)cx=j.data()local jm,ps=0,true
for A9,wu in ipairs(cx.equipped or{})do jm=jm+1 if not jl[tostring(wu)]then ps=false end end if ps and jm==#jk then return true end
end return false end function z.saveTeam(pt,pu)if not z.wear(pu)then return false,"could not put the pets on"end
local wv=q.teams()local b0 for ww,wx in ipairs(wv)do if wx.name==pt then b0=ww break end end local cy if b0 then
cy=j.call("teamSave",b0)else cy=j.call("teamNew")if type(cy)=="table"and cy.ok and cy.index then b0=cy.index task.wait(0.3)
j.call("teamRename",{index=b0,name=pt})end end task.wait(0.4)local jn=j.data()local pv=jn and jn.teams and b0 and jn.teams[b0]
if not pv then return false,"the game did not save it"end local pw={}for A_,wy in ipairs(pv.pets or{})do pw[tostring(wy)]=true end
for Ba,wz in ipairs(pu)do if not pw[tostring(wz)]then return false,"saved, but not with these pets"end end return true
end z.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function z.quiet()
if q.placing or q.glazeSoon()then return false end local wA=j.srv()for Bb,wB in ipairs(q.list or{})do if wB.ends-wA<(d.GlazeLead or 45)+90 then return false end end
return true end function z.plan()local dM=j.data()if not dM then return{}end local px={}for Bc,wC in ipairs(dM.arriving or{})do px[tostring(wC)]=true end
local dN={}for Bd,fP in ipairs(dM.pets or{})do if not px[tostring(fP.id)]then dN[#dN+1]={id=tostring(fP.id),name=fP.name,variant=fP.variant or""}end
end local py={}for Be,pz in ipairs(dN)do py[pz.id]=pz end local pA=tonumber(dM.slots)or 3 local jo,pB={},{}for Bf,fQ in ipairs(z.ROLES)do
local dO=d[fQ[1]]if dO~=""and not pB[dO]then pB[dO]=true local jp,dP,pC={},{},false for Bg,pD in ipairs(dM.teams or{})do
if pD.name==dO then for Bh,wD in ipairs(pD.pets or{})do local jq=py[tostring(wD)]if jq then jp[jq.id]=true dP[#dP+1]=jq else pC=true end
end end end local jr,pE=z.best(fQ[2],dN,pA,jp)local pF=z.score(fQ[2],dP)local pG=#jr==#dP for Bi,wE in ipairs(jr)do if not jp[wE]then pG=false end end
if not pG and(pC or#dP<math.min(pA,#dN)or pE>pF+1e-4)then jo[#jo+1]={team=dO,role=fQ[2],ids=jr,gain=pE-pF}end
end end return jo end function z.rebuild(wF)local pH=z.plan()if#pH==0 then z.buildMsg="teams are already the best your pets allow"return true end
if not z.quiet()then z.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end q.editing,q.editingSince=true,x()
local fR=true local wJ,wK=pcall(function()for Bj,dQ in ipairs(pH)do local wG,wH=z.saveTeam(dQ.team,dQ.ids)local pI=j.data()
local js={}for Bk,wI in ipairs(dQ.ids)do for Bl,jt in ipairs(pI and pI.pets or{})do if tostring(jt.id)==wI then js[#js+1]=j.nice(jt.name,jt.variant)end
end end if wG then y(("TEAM %s rebuilt (%s): %s"):format(dQ.team,wF or"pets changed",table.concat(js,", ")))else fR=false y(("TEAM %s: %s"):format(dQ.team,tostring(wH)))end
end end)q.editing,q.nextTry=false,0 if not wJ then fR=false y("TEAM BUILD ERR "..tostring(wK))end z.builds=z.builds+1
z.buildMsg=fR and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fR end
function z.fuseTick()if not d.AutoFuse or q.editing then return end local fS=j.data()if not fS then return end
local ju=z.need()local jv,fT={},{}for Bm,wL in ipairs(fS.teams or{})do for Bn,wM in ipairs(wL.pets or{})do jv[tostring(wM)]=true end end
for Bo,wN in ipairs(fS.equipped or{})do fT[tostring(wN)]=true end z.failUntil=z.failUntil or{}for b1,wO in pairs(d.Pets)do
local pJ=tonumber(wO.f)or 0 local jw,wP=z.count(b1,fS,true)if pJ>0 and wP<pJ and#jw>=ju and x()>=(z.failUntil[b1]or 0)then
table.sort(jw,function(fU,fV)local pK=(fT[tostring(fU.id)]and 4 or 0)+(jv[tostring(fU.id)]and 2 or 0)+(fU.named and 1 or 0)
local pL=(fT[tostring(fV.id)]and 4 or 0)+(jv[tostring(fV.id)]and 2 or 0)+(fV.named and 1 or 0)if pK~=pL then return pK<pL end
return tostring(fU.id)<tostring(fV.id)end)local fW,jx={},{}for fX=1,ju do fW[fX]=tostring(jw[fX].id)if fT[fW[fX]]then jx[#jx+1]=fW[fX]end
end q.editing,q.editingSince=true,x()for Bp,wQ in ipairs(jx)do j.call("unequip",wQ)task.wait(0.3)end local fY=j.call("fuse",{ids=fW})
q.editing,q.nextTry=false,0 if type(fY)=="table"and fY.ok then z.fused=z.fused+1 z.dirtyAt=x()y(("FUSED %d %s -> Big %s"):format(ju,j.nice(b1),j.nice(b1)))
z.fuseMsg=("fused a Big %s %s"):format(j.nice(b1),os.date("%H:%M"))else z.failUntil[b1]=x()+120 y(("fuse %s failed: %s"):format(j.nice(b1),type(fY)=="table"and tostring(fY.reason or"no reason given")or"no answer"))
end return end end end function z.tick()pcall(z.fuseTick)if not d.AutoBuild or not d.Teams then return end local pM=j.data()
if not pM then return end local b2={}for Bq,wR in ipairs(pM.pets or{})do b2[#b2+1]=tostring(wR.id)end table.sort(b2)
b2=table.concat(b2,",")if b2~=z.sig then z.sig,z.dirtyAt=b2,x()end local wS=(z.dirtyAt and x()-z.dirtyAt>8)or x()-(z.lastBuild or 0)>900
if wS and not q.editing then local wT=z.rebuild(z.dirtyAt and"pets changed"or"check")if wT then z.dirtyAt,z.lastBuild=nil,x()end
end end o.bb,o.fx,o.post,o.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}o.watch=setmetatable({},{__mode="k"})
o.mem,o.memPeak,o.fps=0,0,0 function o.isFx(b3)return b3:IsA("ParticleEmitter")or b3:IsA("Trail")or b3:IsA("Beam")or b3:IsA("Fire")or b3:IsA("Smoke")
or b3:IsA("Sparkles")or b3:IsA("Light")end function o.muteOne(aA)if not d.Lite or not aA.Parent then return end
local fZ=(aA:IsA("BillboardGui")and o.bb)or(o.isFx(aA)and o.fx)or nil if not fZ or fZ[aA]~=nil then return end
fZ[aA]=aA.Enabled if aA.Enabled then aA.Enabled=false end o.watch[aA]=aA:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aA.Enabled then fZ[aA]=true aA.Enabled=false end end)end function o.lite(pN)d.Lite=pN if pN then
task.spawn(function()for wU,wV in ipairs(aq:GetDescendants())do if not d.Lite then return end pcall(o.muteOne,wV)
if wU%600==0 then task.wait()end end end)if not o.addConn then o.queue={}o.addConn=T(aq.DescendantAdded:Connect(function(jy)
if d.Lite and(jy:IsA("BillboardGui")or o.isFx(jy))then o.queue[#o.queue+1]=jy end end))end local jz=game:GetService("Lighting")
for Br,dR in ipairs(jz:GetChildren())do if dR:IsA("PostEffect")and dR.Enabled and o.post[dR]==nil then o.post[dR]=true dR.Enabled=false end
end pcall(function()o.oldShadows=o.oldShadows==nil and jz.GlobalShadows or o.oldShadows jz.GlobalShadows=false end)
pcall(function()o.oldDeco=o.oldDeco==nil and aq.Terrain.Decoration or o.oldDeco aq.Terrain.Decoration=false end)
else for Bs,wW in pairs(o.watch)do pcall(function()wW:Disconnect()end)end for pO,wX in pairs(o.bb)do pcall(function()if pO.Parent then pO.Enabled=wX end end)end
for pP,wY in pairs(o.fx)do pcall(function()if pP.Parent then pP.Enabled=wY end end)end for pQ in pairs(o.post)do pcall(function()if pQ.Parent then pQ.Enabled=true end end)end
o.bb,o.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})o.watch,o.post,o.queue=setmetatable({},{__mode="k"}),{},{}
local wZ=game:GetService("Lighting")if o.oldShadows~=nil then pcall(function()wZ.GlobalShadows=o.oldShadows end)o.oldShadows=nil end
if o.oldDeco~=nil then pcall(function()aq.Terrain.Decoration=o.oldDeco end)o.oldDeco=nil end end end o.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function o.hideHud(pR)d.HideHud=pR local jA=E:FindFirstChildOfClass("PlayerGui")if not jA then return end if pR then
for Bt,dS in ipairs(jA:GetChildren())do if dS:IsA("ScreenGui")and not o.MINE[dS.Name]and dS.Enabled then o.hud[dS]=true dS.Enabled=false end
end if not o.hudConn then o.hudConn=T(jA.ChildAdded:Connect(function(dT)if d.HideHud and dT:IsA("ScreenGui")and not o.MINE[dT.Name]then
task.defer(function()if d.HideHud and dT.Enabled then o.hud[dT]=true dT.Enabled=false end end)end end))end else
for pS in pairs(o.hud)do pcall(function()if pS.Parent then pS.Enabled=true end end)end o.hud={}end end o.CAPS={0,30,15,10}
function o.cap(jB)d.FpsCap=jB local pT=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not pT then return false end return pcall(pT,jB==0 and 60 or jB)end function o.render(pU)d.NoRender=pU pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not pU)end)
end function o.restoreAll()pcall(o.unpin)if D.arPaused then pcall(D.resume,"script stopped")end pcall(o.lite,false)
pcall(o.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)if(d.FpsCap or 0)~=0 then pcall(o.cap,0)end
end function o.rejoinSame(pV)if c.rejoining then return end y("REJOIN this server ("..pV..")")pcall(ez)if c.autoload then pcall(eY,c.autoload)end
hL()local w0=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,E)
end)task.delay(25,function()if c.alive then c8(pV..", same server failed")end end)return w0 end function o.tick()
local jC=o.queue if d.Lite and jC and#jC>0 then o.queue={}for w1,w2 in ipairs(jC)do pcall(o.muteOne,w2)if w1%300==0 then task.wait()end end
end local pW=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if pW then for Bu,w3 in ipairs(pW:GetChildren())do
local pX=w3:FindFirstChild("SquishyPlaceHolder")local b4=pX and pX:FindFirstChild("TimerGui")if b4 and b4:IsA("BillboardGui")then
if o.bb[b4]==nil then pcall(o.muteOne,b4)elseif b4 .Enabled then o.bb[b4]=true b4 .Enabled=false end end end end
local w4,dU=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if w4 and type(dU)=="number"then
o.mem=dU o.memPeak=math.max(o.memPeak,dU)if(d.MemLimit or 0)>0 and dU>d.MemLimit then o.over=(o.over or 0)+1 if o.over>=30 and not c.busy then
o.over=-600 o.rejoinSame(("memory %d MB > %d MB"):format(dU,d.MemLimit))end elseif(o.over or 0)>0 then o.over=0
end end if x()-(o.noteAt or 0)>1800 then o.noteAt=x()y(("health: %d fps, %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function jD(f0)if type(f0)~="string"then return false end
f0=f0:lower()for Bv,w5 in ipairs(c.sellWords)do if f0:find(w5,1,true)then return true end end return false end
local function w6()local pY=ap:FindFirstChild("Remotes")local jE=pY and pY:FindFirstChild("SellSquishy")if not(jE and jE:IsA("RemoteEvent"))then return false end
if not pcall(function()jE:FireServer()end)then return false end return al(function()return aa()==nil end,1.5)
end local function w7()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local pZ=ar()local p0=pZ and pZ.HumanoidRootPart.Position local dV,p1 for Bw,cz in ipairs((c.plot or aq):GetDescendants())do
if cz:IsA("ProximityPrompt")and(jD(cz.ActionText)or jD(cz.ObjectText)or jD(cz.Name))then local p2=lm(cz)local jF=(p2 and p0)and(p2-p0).Magnitude or 1e9
if jF<=400 and(not dV or jF<p1)then dV,p1=cz,jF end end end c.sellSpot=dV c.noSellSpot=(dV==nil)return dV end
local function p3()local jG=aa()if not jG then c.holding=false return false end if aP(jG)then return false end
local jH=aj(ab(jG))if w6()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
y("SOLD "..jH)return true end local cA=w7()if cA then local p4=cV(cA)if p4 then cj(p4,cA)local p5=aa()if p5 and not aP(p5)then
local w8,w9=dd(cA,function()return aa()==nil end,function()return cA.Enabled end)if w8 then c.sold,c.holding,c.sellFails=c.sold+1,false,0
y(("SOLD %s at %s via %s"):format(jH,eu(cA),w9))return true end end end end c.sellFails=c.sellFails+1 y("could not sell "..jH.." ("..c.sellFails..")")
return false end local w_={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function xa(cB)local f1=eu(cB):lower()for Bx,xb in ipairs(w_)do if f1:find(xb,1,true)then return 0 end end
local aT,ak=cB.Name:lower(),0 local function aL(xc,xd)return xc:find(xd,1,true)~=nil end if aL(aT,"collect")then ak=ak+60 end
if aL(aT,"cash")or aL(aT,"money")then ak=ak+45 end if aL(aT,"income")or aL(aT,"claim")then ak=ak+35 end if aL(aT,"coin")or aL(aT,"earn")or aL(aT,"green")then ak=ak+20 end
if aT=="pad"or aT=="touch"then ak=ak+25 end if ak==0 and(aL(f1,"collect")or aL(f1,"cash")or aL(f1,"money"))then ak=25 end
if ak==0 then return 0 end local dW=cB.Color if dW.G>0.5 and dW.G>dW.R*1.4 and dW.G>dW.B*1.4 then ak=ak+15 end
if math.min(cB.Size.X,cB.Size.Y,cB.Size.Z)<2 then ak=ak+5 end return ak end local function xe()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local f2,dX,jI={},nil,29 for By,f3 in ipairs(c.plot:GetDescendants())do
if f3:IsA("BasePart")then local f4=xa(f3)if f4>0 then f2[#f2+1]={s=f4,p=f3}if f4>jI then dX,jI=f3,f4 end end end
end table.sort(f2,function(xf,xg)return xf.s>xg.s end)c.padCands,c.padPart=f2,dX if dX then y("collect pad: "..eu(dX).." (score "..jI..")")end
return dX end local jJ="SAB_pad_v1.txt"local function xh(xi)if type(writefile)=="function"then pcall(writefile,jJ,table.concat({xi:GetComponents()},","))end
end local function xj()if type(isfile)~="function"or type(readfile)~="function"then return nil end local xk,p6=pcall(function()if isfile(jJ)then return readfile(jJ)end end)
if not xk or type(p6)~="string"then return nil end local f5={}for xl in p6:gmatch("[^,]+")do f5[#f5+1]=tonumber(xl)end
if#f5==12 then return CFrame.new(unpack(f5))end end local function xm(jK,f6,xn)local xo=c_(jK)local jL=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aM=(jL and jL:IsA("BasePart"))and(jL.Position-f6)or Vector3 .new(1,0,0)aM=Vector3 .new(aM.X,0,aM.Z)if aM.Magnitude<0.05 then aM=Vector3 .new(1,0,0)end
aM=aM.Unit for xp=0,7 do local f7=xp*math.pi/4 local xq=Vector3 .new(aM.X*math.cos(f7)-aM.Z*math.sin(f7),0,aM.X*math.sin(f7)+aM.Z*math.cos(f7))
local f8=f6+xq*(xn+5)local jM=e6(f8 .X,f6 .Y,f8 .Z)if jM and math.abs(jM.Y-f6 .Y)<8 then aE(jK,Vector3 .new(f8 .X,jM.Y+xo,f8 .Z))
if hU(jK,0.7)then return true end end end return false end local function xr()c.lastCollect=x()local dY=ar()if not dY then return end
local p7,xs=dY.HumanoidRootPart,c_(dY)local dZ,p8,d0,jN=nil,4,nil,"?"local jO=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and jO and jO:IsA("BasePart")then dZ,jN=(jO.CFrame*c.manualPad).Position,"manual pad"else local a7=xe()
if a7 then dZ=Vector3 .new(a7 .Position.X,a7 .Position.Y+a7 .Size.Y/2+xs,a7 .Position.Z)p8,d0,jN=math.max(a7 .Size.X,a7 .Size.Z)/2,a7,a7 .Name
end end if not dZ then y("COLLECT: pad not found - stand on it and tap SET PAD")return end local jP=aZ()aE(dY,dZ)
if d0 and type(firetouchinterest)=="function"then pcall(firetouchinterest,p7,d0,0)end ad(d.PadDwell)if d0 and type(firetouchinterest)=="function"then pcall(firetouchinterest,p7,d0,1)end
ad(0.5)c.collected=c.collected+1 local jQ=aZ()y(("COLLECTED (%s) %s"):format(jN,(jP and jQ and jQ>jP)and("+$"..aC(jQ-jP))or"no cash change seen"))
xm(dY,dZ,p8)end local d1 local function p9()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then c.capHit,c.placeFails=false,0
y("trying again after being stopped for 5 minutes")d1(true,true)else return nil,c.capMsg,"bad"end end if c.busy then return nil,c.busyText,"ok"end
if not ar()then return nil,"waiting for character","wait"end if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bf(),nil,nil
if not c.plot then return nil,"own plot not found yet","wait"end end if not next(d.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local jR,p_=ew()local f9=aa()if f9 then local cC=aj(ab(f9))if not aP(f9)then local jS=(Q.gift and ab(Q.gift)==ab(f9)and x()-Q.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cC,jS),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cC,jS),"bad"end return"sell",("selling %s (%s)"):format(cC,jS),"warn"
end if jR<1 then return nil,("holding %s - 0 free stations"):format(cC),"wait"end if q.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cC),"wait"end
return"place",("waxing %s (%d free)"):format(cC,jR),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local jT=c.plot:FindFirstChild("CrateStand")if jT then for Bz,d2 in ipairs(jT:GetDescendants())do
if d2:IsA("ProximityPrompt")and d2 .Enabled and h_(d2)then local a8=d2 .ObjectText if a8==""then a8=cc(jT,"TitleLabel")or""end
if a8~=""and K.wanted(a8)then local xt=es(a8):gsub("crate$","")local qa for qb in pairs(W.members)do if es(qb)==xt then qa=qb end end
e.waiting,e.at,e.title,e.prompt=true,x(),a8,d2 e.data={name=(a8:gsub("%s","")),rarity=qa,title=a8}y(a8 .." found waiting on your stand")
end break end end end end local qc=K.wanted(e.data and e.data.name)or K.wanted(e.title)if d.Crates and(e.on or e.waiting)and qc then
local a9=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a9),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 y("could not press the "..a9 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a9),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a9),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a9,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a9),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(a9),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a9),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(a9,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not qc then local qd=e.title..tostring(e.rolledAt)if e.told~=qd then e.told=qd y(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and K.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if jR<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(p_,p_),"wait"
end local jU=lA()if not jU then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local d3=bK()
if d3 and mX(d3 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(d3 .name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(d3 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(d3 .name),"ok"
end local bv=hS()if bv.state~="match"then c.matchSince=nil if bv.state=="skip"and not jU.Enabled then return nil,bv.text.." (sold out)","idle"end
return nil,bv.text,bv.level end if not jU.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local d4=x()if d4<c.noCashUntil then local qe,xu=mw()if qe then return nil,("cash short: have $%s, price ~$%s"):format(aC(qe),aC(xu)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aC(aZ()),math.ceil(c.noCashUntil-d4)),"bad"end if d4-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or d4 local qf=d4-c.matchSince if qf<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bv.shown,qf),"ok"end
return"buy",("buying %s via %s"):format(bv.shown,bv.src),"ok"end o.DEPTH=11 function o.pinTick()local qg=o.hold
if not qg then return end local jV=E.Character local jW=jV and jV:FindFirstChild("HumanoidRootPart")if not jW then return end
jW.CFrame=qg jW.AssemblyLinearVelocity=Vector3 .new(0,0,0)for BA,f_ in ipairs(jV:GetChildren())do if f_:IsA("BasePart")and f_.CanCollide then o.noclip[f_]=true f_.CanCollide=false end
end end o.noclip=setmetatable({},{__mode="k"})function o.pin(xv,qh)o.hold=xv if qh then o.surface=qh end end function o.unpin(xw)
if not o.hold then return end o.hold=nil for qi in pairs(o.noclip)do pcall(function()if qi.Parent then qi.CanCollide=true end end)end
o.noclip=setmetatable({},{__mode="k"})local qj=ar()if qj and o.surface and not xw then aE(qj,o.surface.Position,o.surface.Position+o.surface.LookVector)
ad(0.1)end end function o.home()local a_,qk=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ar()
if not(a_ and a_:IsA("BasePart")and qk)then return nil end local ql=lp()or a_.Position local ga=Vector3 .new(ql.X-a_.Position.X,0,ql.Z-a_.Position.Z)
ga=ga.Magnitude>0.1 and ga.Unit or Vector3 .new(0,0,1)local gb=a_.Position+ga*6 local qm=e6(gb.X,a_.Position.Y,gb.Z,{a_})
return CFrame.new(gb.X,(qm and qm.Y or a_.Position.Y)+c_(qk),gb.Z)end function o.ground(xx,qn,xy)local jX,jY={E.Character},nil
for BB=1,12 do local jZ=RaycastParams.new()jZ.FilterType=Enum.RaycastFilterType.Exclude jZ.FilterDescendantsInstances=jX
local gc=aq:Raycast(Vector3 .new(xx,qn,xy),Vector3 .new(0,-2000,0),jZ)if not gc then break end jY,qn=gc,gc.Position.Y-0.05
jX[#jX+1]=gc.Instance end return jY and jY.Position.Y end function o.parkHome()local j0=o.home()if not j0 then return false end
local cD=j0 .Position local xz=o.ground(cD.X,cD.Y+300,cD.Z)or(cD.Y-3)o.pin(CFrame.new(cD.X,xz-8,cD.Z),j0)return true
end o.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function o.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function o.setGhost(gd)d.Ghost,d.GhostHelps=gd==2,gd==1 if gd<2 then task.spawn(function()while c.busy do ad(0.1)end
if o.ghostMode()<2 and o.hold and not C.home then pcall(o.unpin)end end)end o.paintGhost()y("ghost: "..o.GHOST[gd][1]:sub(8):lower())
end function o.cycleGhost()o.setGhost((o.ghostMode()+1)%3)end function o.parkTick()if not(d.Ghost and c.running)or o.hold or c.busy then return end
local xA=ar()if not xA or F.seat()then return end o.parkHome()end F.n,F.fails,F.nextAt,F.msg,F.lost=0,0,0,"no campfire right now",0
function F.seat()local qo=E.Character local qp=qo and qo:FindFirstChildOfClass("Humanoid")local j1=qp and qp.SeatPart
return(j1 and j1 .Name=="LogSeat")and j1 or nil end function F.due()if not(d.Campfire and c.running)or x()<F.nextAt then return false end
local xC=aq:FindFirstChild("NightSeats")if not xC then if F.wasOn then F.wasOn,F.fails,F.lost=false,0,0 end F.msg="no campfire (comes with weather events)"
return false end F.wasOn=true if F.seat()then F.sitAt=F.sitAt or x()F.msg=("sitting at the campfire: +%s%% cash"):format(tostring(E:GetAttribute("CampfireBoost")or"?"))
return false end if F.sitAt then F.lost,F.sitAt=F.lost+1,nil if F.lost>=4 then F.nextAt,F.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
y(F.msg)return false end end return true end function F.sit()local qq,ge=aq:FindFirstChild("NightSeats"),ar()
if not qq or not ge then return end local qr,cE=ge.HumanoidRootPart.Position,{}for BC,gf in ipairs(qq:GetChildren())do
local qs=gf:IsA("Seat")and gf.Occupant==nil and gf:FindFirstChildOfClass("ProximityPrompt")if qs then cE[#cE+1]={st=gf,p=qs}end
end if#cE==0 then F.nextAt,F.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cE,function(xD,xE)return(xD.st.Position-qr).Magnitude<(xE.st.Position-qr).Magnitude end)
local xF,xG=cE[1].st,cE[1].p o.unpin(true)local cF=xF.CFrame aE(ge,cF.Position+cF.LookVector*2+Vector3 .new(0,2.5,0),cF.Position)
ad(0.25)local xH=dd(xG,function()return F.seat()~=nil end)if not xH then aE(ge,cF.Position+Vector3 .new(0,2,0),cF.Position+cF.LookVector)
al(function()return F.seat()~=nil end,1.5)end if F.seat()then F.n,F.fails,F.sitAt=F.n+1,0,x()y(("SAT at the campfire (+%s%% cash)"):format(tostring(E:GetAttribute("CampfireBoost")or"?")))
else F.fails=F.fails+1 F.nextAt=x()+(F.fails>=3 and 60 or 5)F.msg="could not sit at the campfire"..(F.fails>=3 and" - trying again in a minute"or"")
if F.fails<=3 then y(F.msg)end end end D.msg,D.nextAt,D.at,D.pulls,D.claims,D.pullLeft,D.collectLeft,D.events="",0,0,0,0,0,0,{}
function D.refresh()D.at=x()local j2=ap:FindFirstChild("Remotes")if not j2 then return end local d5,j3,cG=0,0,{}
local xI,qt=pcall(function()return j2 .ClanRequest:InvokeServer("state")end)local qu=xI and type(qt)=="table"and qt.tasks
for BD,bw in ipairs(qu and qu.list or{})do if not bw.done and bw.kind=="pull"then d5=math.max(d5,(bw.goal or 0)-(bw.progress or 0))end
if not bw.done then cG[#cG+1]=("%s %d/%d"):format(tostring(bw.text),bw.progress or 0,bw.goal or 0)end end D.events={}
for BE,cH in ipairs(j2:GetChildren())do if cH:IsA("RemoteFunction")and cH.Name:match("^%u%a+Action$")and cH.Name~="CrateAction"and cH.Name~="AutoRollAction"then
local xJ,d6=pcall(function()return cH:InvokeServer("state")end)if xJ and type(d6)=="table"and d6 .live==true and type(d6 .quests)=="table"then
D.events[#D.events+1]={r=cH,st=d6}for BF,aH in ipairs(d6 .quests)do if not aH.done and aH.kind=="pull"then d5=math.max(d5,(aH.goal or 0)-(aH.progress or 0))end
if not aH.done and aH.kind=="collect"then j3=math.max(j3,(aH.goal or 0)-(aH.progress or 0))end if not aH.done then cG[#cG+1]=("%s %d/%d"):format(tostring(aH.text),aH.progress or 0,aH.goal or 0)end
end end end end D.pullLeft,D.collectLeft=d5,j3 D.msg=#cG>0 and("open: "..table.concat(cG,", "))or"all quests done for today"
end function D.claim()for BG,d7 in ipairs(D.events)do local qv=d7 .r.Name:gsub("Action$","")for BH,cI in ipairs(d7 .st.quests)do
if cI.done and not cI.claimed then local xK,qw=pcall(function()return d7 .r:InvokeServer("claimQuest",cI.id)end)
if xK and not(type(qw)=="table"and qw.ok==false)then D.claims=D.claims+1 y(("CLAIMED %s quest: %s (+%s)"):format(qv,tostring(cI.text),tostring(cI.points or cI.treats or"?")))
end ad(0.4)end end if d7 .st.bonusReady==true then local xL=pcall(function()return d7 .r:InvokeServer("claimBonus")end)
if xL then y(("CLAIMED %s daily quest bonus"):format(qv))end ad(0.4)end end end function D.tick()if not(d.Quests and c.running)then
if D.arPaused then D.resume("quests switched off")end return end if x()-D.at<(D.pullLeft>0 and 20 or 90)then return end
D.refresh()pcall(D.claim)if D.pullLeft<=0 and D.arPaused then D.resume("lever quests done")end end function D.pullDue()
return d.Quests and c.running and D.pullLeft>0 and x()>=D.nextAt and not A.busy end function D.lever()local qx=c.plot and c.plot:FindFirstChild("Lever")
local j4=qx and qx:FindFirstChild("Wheel")return j4 and j4:FindFirstChildWhichIsA("ProximityPrompt"),j4 end function D.resume(xM)
D.arPaused=false if D.arWas then D.arWas=false d.AutoRoll=true task.spawn(A.apply,xM)end end function D.pull()
local gg,j5=D.lever()if not gg or not j5 or not j5:IsA("BasePart")then D.nextAt,D.msg=x()+300,"your lever was not found"return end
if not D.arPaused then D.arPaused=true D.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false A.apply("pulling the lever for a quest",true)
if A.isOn()then D.nextAt=x()+30 return end end y(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(D.pullLeft))
end if not gg.Enabled then D.nextAt=x()+1 return end cj(j5,gg)D.asked=nil mL(gg)D.pulls=D.pulls+1 D.pullLeft=D.pullLeft-1
ad(0.6)if D.asked then D.nextAt=x()+600 y(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(D.asked)))
D.resume("a butter the game wants kept is on the pad")return end D.nextAt=x()+2.5 if D.pullLeft<=0 then D.at=0 end
end C.skip,C.skipN,C.n,C.calls,C.fails,C.nextAt,C.msg,C.tries={},0,0,0,0,0,"off",{}function C.can(bx,xN)local j6=bx:GetAttribute("PourOwner")
if type(j6)~="number"or j6==j.uid or not bx:GetAttribute("HasSquishy")then return false end if bx:GetAttribute("PourLong")~=true or bx:GetAttribute("PourFull")==true then return false end
local j7=bx:GetAttribute("PourId")if j7==nil or C.skip[j7]then return false end local qy,j8,xO=bx:GetAttribute("Helpers"),0,tostring(j.uid)
if type(qy)=="string"then for xP in qy:gmatch("[^,%s]+")do j8=j8+1 if xP==xO then return false end end end if j8>=6 then return false end
local gh=q.left(bx)if not gh then local qz=tonumber(bx:GetAttribute("PourEnd"))gh=qz and(qz-xN)end if not gh or gh<=75 then return false end
local j9=game:GetService("Players"):GetPlayerByUserId(j6)if not j9 or j9:GetAttribute("WaxHelpOff")==true then return false end
return true,j9,j7 end function C.list()local j_,xQ={},j.srv()local qA=aq:FindFirstChild("Plots")for BI,qB in ipairs(qA and qA:GetChildren()or{})do
local qC=qB~=c.plot and qB:FindFirstChild("WaxStations")for BJ,ka in ipairs(qC and qC:GetChildren()or{})do local xR,xS,xT=C.can(ka,xQ)
local kb=xR and ka:FindFirstChild("SquishyPlaceHolder")if kb and kb:IsA("BasePart")then j_[#j_+1]={st=ka,p=xS,id=xT,part=kb}end
end end return j_ end function C.due()return d.Help and c.running and x()>=C.nextAt end function C.skipIt(qD,qE)
C.skip[qD],C.skipN=qE,C.skipN+1 if C.skipN>600 then C.skip,C.skipN,C.tries={[qD]=qE},1,{}end end function C.goHome()
local gi,by=ar(),C.home C.home=nil if not(gi and by)then return end if d.Ghost and not F.seat()then o.unpin(true)
if not o.parkHome()then pcall(aE,gi,by.Position,by.Position+by.LookVector)end elseif o.hold or(gi.HumanoidRootPart.Position-by.Position).Magnitude>20 then
o.unpin(true)pcall(aE,gi,by.Position,by.Position+by.LookVector)end end function C.step()local kc,d8=C.list(),ar()
if#kc==0 or not d8 then C.nextAt=x()+15 C.msg=("helped %d waxes here%s | none to help right now"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")
C.goHome()return end local qF=d8 .HumanoidRootPart local qG=qF.Position table.sort(kc,function(xU,xV)return(xU.part.Position-qG).Magnitude<(xV.part.Position-qG).Magnitude end)
local aN=kc[1]C.home=C.home or(o.hold and o.surface)or qF.CFrame local bz=aN.part local d9=(bz.Position+aN.st:GetPivot().Position)/2
local gj=C.tries[aN.id]or 0 if(d.Ghost or d.GhostHelps)and gj==0 and not F.seat()then o.pin(bz.CFrame,C.home)
else o.unpin(true)local kd=gj==0 and e6(d9 .X,bz.Position.Y,d9 .Z,{bz})if kd and math.abs(kd.Y-bz.Position.Y)<8 then
aE(d8,Vector3 .new(d9 .X,kd.Y+c_(d8),d9 .Z),bz.Position)else aE(d8,bz.Position+Vector3 .new(0,bz.Size.Y/2+3,0),d9)
end end ad(0.3)local d_=ap:FindFirstChild("Remotes")d_=d_ and d_:FindFirstChild("ClanRequest")if not d_ then C.nextAt,C.msg=x()+60,"the game's help remote is missing"return end
local gk,ba=pcall(function()return d_:InvokeServer("help",aN.st:GetAttribute("PourOwner"),tonumber(aN.st.Name))end)
if gk and type(ba)=="table"and ba.ok then C.n,C.fails=C.n+1,0 C.skipIt(aN.id,"helped")y(("HELPED %s's wax (station %s)"):format(aN.p.DisplayName,aN.st.Name))
C.msg=("helped %d waxes here%s"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")elseif gk and type(ba)=="table"and tostring(ba.reason or""):lower():find("walk up",1,true)and gj<2 then
C.tries[aN.id]=gj+1 C.nextAt=x()+0.3 elseif gk and type(ba)=="table"and tostring(ba.reason or""):lower():find("moment",1,true)then
C.waits=(C.waits or 0)+1 C.nextAt=x()+1.6 else local qH=(gk and type(ba)=="table"and tostring(ba.reason or"refused"))or("error: "..tostring(ba))
C.skipIt(aN.id,qH)C.fails=C.fails+1 if C.fails<=3 then y(("help refused for %s's wax: %s"):format(aN.p.DisplayName,qH))end
if C.fails>=5 then C.fails,C.nextAt,C.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
C.goHome()end end C.nextAt=math.max(C.nextAt,x()+1.2)end function C.onCall(bc)if not d.HelpGuild or type(bc)~="table"or bc.p~="help"or bc.mine or bc.u==j.uid or not bc.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local ea=ap:FindFirstChild("Remotes")
ea=ea and ea:FindFirstChild("ClanRequest")if not ea then return end local qI,eb=pcall(function()return ea:InvokeServer("callHelp",bc.u)end)
local qJ=tostring(bc.n or bc.un or bc.u)if qI and type(eb)=="table"and eb.ok then C.calls=C.calls+1 y(("HELPED guildmate %s's wax from here (their call)"):format(qJ))
else y(("guild call from %s: %s"):format(qJ,(qI and type(eb)=="table"and tostring(eb.reason or"refused"))or tostring(eb)))
end end)end local function an(xW,qK,...)if c.busy then return end c.busy,c.busyText=true,xW if o.hold and qK~=C.step then pcall(o.unpin)end
local xX,qL=pcall(qK,...)c.busy,c.busyText=false,""if not xX and qL~=g3 then y("ERR "..tostring(qL))end end local function xY()
local aU,xZ,x0=p9()c.reason,c.level=xZ,x0 if aU=="place"then an("waxing...",q.place)elseif aU=="crate"then an("opening crate...",fi,true)
elseif aU=="cratesmart"then an("opening crate...",e.smart)elseif aU=="cratewin"then an("opening the crate window...",ib)
elseif aU=="nocrate"then an("discarding crate...",fi,false)elseif aU=="sell"then an("selling...",p3)elseif aU=="buy"then an("buying...",mO,false)
elseif not aU and not c.matchSince and F.due()then an("sitting at the campfire...",F.sit)elseif not aU and not c.matchSince and D.pullDue()and not aa()and not(bK()and aP(bK().name))then
an("pulling the lever for a quest...",D.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(D.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
an("collecting money...",xr)elseif not aU and not c.matchSince and C.due()then an("helping a wax...",C.step)elseif C.home and not d.Help then
an("coming back...",C.goHome)elseif not c.busy then o.parkTick()end end function d1(gl,x1)if gl==c.running then return end
c.running=gl if not x1 then d.AutoStart=gl end if gl then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bf()or c.plot
y("START")else c.reason="stopped"y("STOP")end end do local bA=eT(ah.auto)if type(bA)=="string"then bA=bA:gsub("%s+$","")
if bA~=""then c.autoload=bA local x2=mk(bA)y(x2 and("loaded config "..bA)or("config "..bA.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local x3={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}local qM={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function L(x4,x5,x6)local x7,ke=pcall(Instance.new,x4)
if not x7 then c.uiErrs=c.uiErrs+1 return nil end for x8,x9 in pairs(x5)do if not pcall(function()ke[x8]=x9 end)then c.uiErrs=c.uiErrs+1 end
end ke.Parent=x6 return ke end local function ai(x_,ya)L("UICorner",{CornerRadius=UDim.new(0,ya or 6)},x_)end
local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"})}function a.put(gm,kf)if gm and a.shown[gm]~=kf then a.shown[gm]=kf gm.Text=kf end
end local kg=E:FindFirstChildOfClass("PlayerGui")or E:WaitForChild("PlayerGui")local qN=kg:FindFirstChild("SABFarmGui")
if qN then qN:Destroy()end local kh=L("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},kg)
local af={w=320,h=300,head=28,strip=34,tabs=24}pcall(function()local gn=aq.CurrentCamera.ViewportSize if gn.X>100 and gn.Y>100 then
af.w=math.clamp(math.floor(gn.X*0.44),300,360)af.h=math.clamp(math.floor(gn.Y*0.84),240,340)end end)a.root=L("Frame",{Name="Root",Size=UDim2 .new(0,af.w,0,af.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},kh)
ai(a.root,10)L("UIStroke",{Color=l.line,Thickness=1},a.root)local aV=UDim2 .new(1,0,1,0)local function J(qO,qP)return UDim2 .new(qO,0,0,0),UDim2 .new(qP,(qO+qP>0.99)and 0 or-4,1,0)end
local function H(yb,yc,yd,ye,yf,yg)local qQ=L("TextButton",{Text=yc,Position=yf,Size=yg,BackgroundColor3=yd,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=ye,TextColor3=l.text,AutoButtonColor=true},yb)ai(qQ,6)return qQ end local function go(yh,yi,yj,yk,yl)
local ki=L("TextBox",{Text=yi,PlaceholderText=yj,Position=yk,Size=yl,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=l.text,PlaceholderColor3=l.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},yh)ai(ki,6)L("UIPadding",{PaddingLeft=UDim.new(0,8)},ki)
return ki end local gp=aq.CurrentCamera local function ym()local yn,gq=pcall(function()return gp and gp.ViewportSize end)
if yn and gq and gq.X>50 and gq.Y>50 then return gq end end local function bB(ec)local kj=ym()if not(kj and ec and ec.Parent)then return end
local yo=pcall(function()local gr,qR=ec.AbsolutePosition,ec.AbsoluteSize local kk=70 local qS=math.clamp(gr.X,kk-qR.X,kj.X-kk)
local qT=math.clamp(gr.Y,0,kj.Y-math.min(qR.Y,kk))if math.abs(qS-gr.X)>0.5 or math.abs(qT-gr.Y)>0.5 then ec.Position=UDim2 .new(0,math.floor(qS),0,math.floor(qT))
end end)return yo end local function gs(yp)local yq,kl=pcall(function()return yp.AbsolutePosition end)if yq and kl then return{math.floor(kl.X),math.floor(kl.Y)}end
end local cJ={}c.dragMoved={}local function qU(ed,qV,km)T(ed.InputBegan:Connect(function(cK)if cK.UserInputType~=Enum.UserInputType.MouseButton1 and cK.UserInputType~=Enum.UserInputType.Touch then return end
local kn={start=cK.Position,from=qV.Position,moved=0,target=qV,input=cK,onDrop=km}cJ[ed],c.dragMoved[ed]=kn,0
local ko ko=cK.Changed:Connect(function()if cK.UserInputState==Enum.UserInputState.End and cJ[ed]==kn then cJ[ed]=nil
if ko then ko:Disconnect()end if km then km(kn.moved)end end end)end))end T(k9 .InputChanged:Connect(function(gt)
if gt.UserInputType~=Enum.UserInputType.MouseMovement and gt.UserInputType~=Enum.UserInputType.Touch then return end
for yr,aW in pairs(cJ)do local kp=aW.target if kp and kp.Parent then local qW,qX=gt.Position.X-aW.start.X,gt.Position.Y-aW.start.Y
aW.moved=math.max(aW.moved,math.abs(qW)+math.abs(qX))c.dragMoved[yr]=aW.moved kp.Position=UDim2 .new(aW.from.X.Scale,aW.from.X.Offset+qW,aW.from.Y.Scale,aW.from.Y.Offset+qX)
end end end))T(k9 .InputEnded:Connect(function(gu)if gu.UserInputType~=Enum.UserInputType.MouseButton1 and gu.UserInputType~=Enum.UserInputType.Touch then return end
for ys,gv in pairs(cJ)do if gv.input==gu or gu.UserInputType==Enum.UserInputType.MouseButton1 then cJ[ys]=nil
if gv.onDrop then gv.onDrop(gv.moved)end end end end))local function O(yt,yu,yv,yw,yx,yy,yz)return L("TextLabel",{Text=yu,Position=yy or UDim2 .new(0,0,0,0),Size=yz or aV,BackgroundTransparency=1,
Font=yx and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=yv,TextColor3=yw,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},yt)
end a.title=L("Frame",{Size=UDim2 .new(1,0,0,af.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=L("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.title)
ai(a.dot,5)O(a.title,"SAB  BUTTER FARM  "..b8,12,l.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=H(a.title,"-",l.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=H(a.title,"X",l.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=L("Frame",{Position=UDim2 .new(0,0,0,af.head),Size=UDim2 .new(1,0,0,af.strip),BackgroundColor3=l.bg,BorderSizePixel=0},a.root)
a.bar=L("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
ai(a.bar,2)a.reason=O(a.strip,"starting",12,l.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=L("Frame",{Position=UDim2 .new(0,0,0,af.head+af.strip),Size=UDim2 .new(1,0,0,af.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=H(a.tabs,"FARM",l.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=H(a.tabs,"BUTTERS",l.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=H(a.tabs,"CRATES",l.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=H(a.tabs,"PETS",l.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=H(a.tabs,"TEAMS",l.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=H(a.tabs,"SETUP",l.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function cL()local kq=L("ScrollingFrame",{Position=UDim2 .new(0,0,0,af.head+af.strip+af.tabs),Size=UDim2 .new(1,0,1,-(af.head+af.strip+af.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
L("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},kq)L("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},kq)
return kq end a.farm,a.but,a.set,a.crt=cL(),cL(),cL(),cL()a.pet,a.team=cL(),cL()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local gw,ee,M=0,12,nil local function aX(qY,yA)gw,ee=gw+1,ee+qY+6 return L("Frame",{Size=UDim2 .new(1,0,0,qY),BackgroundTransparency=1,LayoutOrder=gw},yA or a.farm)
end local function qZ(yB)O(aX(14),yB,10,l.dim,true)end M=aX(32)a.startB=H(M,"START",l.good,14,J(0,0.68))a.killB=H(M,"KILL",l.bad,14,J(0.68,0.32))
local yC=aX(40)local function ef(q0,yD,kr)local ks=L("Frame",{Position=UDim2 .new((q0-1)/kr,0,0,0),Size=UDim2 .new(1/kr,q0<kr and-4 or 0,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},yC)ai(ks,6)local q1=O(ks,"0",14,l.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,20))
local yE=O(ks,yD,9,l.dim,false,UDim2 .new(0,0,0,23),UDim2 .new(1,0,0,13))q1 .TextXAlignment,yE.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return q1 end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=ef(1,"BOUGHT",5),ef(2,"WAXED",5),ef(3,"SOLD",5),ef(4,"MONEY",5),ef(5,"FREE",5)
a.info=O(aX(40),"",10,l.dim,false)a.tgt=O(aX(16),"",10,l.good,false)qZ("SWITCHES")do local function gx(yF,yG)
local q2=aX(26)return H(q2,yF,l.panel2,10,J(0,0.5)),H(q2,yG,l.panel2,10,J(0.5,0.5))end a.colT,a.sellT=gx("COLLECT: ON","SELL THEM: ON")
a.crateT,a.arT=gx("OPEN CRATES: ON","AUTO ROLL: OFF")a.helpT,a.helpGT=gx("HELP WAXES: OFF","GUILD CALLS: OFF")
a.campT,a.ghostT=gx("CAMPFIRE: OFF","GHOST: OFF")M=aX(26)a.questT=H(M,"QUESTS: OFF",l.panel2,10,J(0,0.5))O(M,"collect every",9,l.dim,false,J(0.52,0.2))
a.secB=go(M,tostring(d.Every),"60",J(0.72,0.13))a.secB.TextSize=11 a.secSet=H(M,"SET",l.accent,10,J(0.85,0.15))
local gy=L("Frame",{Size=aV,BackgroundColor3=l.panel,BorderSizePixel=0},aX(62))ai(gy,6)L("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},gy)
L("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,3)},gy)local function gz(yH)local gA=O(gy,"",9,l.dim,false,nil,UDim2 .new(1,-6,0,14))
gA.LayoutOrder,gA.TextWrapped,gA.TextTruncate=yH,false,Enum.TextTruncate.AtEnd return gA end a.helpL,a.campL,a.questL,a.arL=gz(1),gz(2),gz(3),gz(4)
end qZ("LOG")a.log=L("TextLabel",{Size=aV,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=10,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},aX(84))ai(a.log,6)L("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,ee)gw,ee=0,12 local function ag(yI)return aX(yI,a.set)end local function cM(yJ)O(ag(14),yJ,10,l.dim,true)end
cM("ONE-OFF ACTIONS")M=ag(26)a.buyB=H(M,"BUY THE PAD",l.warn,10,J(0,0.5))a.plB=H(M,"WAX WHAT I HOLD",l.good,10,J(0.5,0.5))
M=ag(26)a.sellB=H(M,"SELL WHAT I HOLD",l.warn,10,J(0,0.5))a.crateB=H(M,"OPEN CRATE NOW",l.warn,10,J(0.5,0.5))
M=ag(26)a.padB=H(M,"SET PAD (stand on it)",l.panel2,10,J(0,0.55))a.padL=O(M,"",10,l.dim,false,J(0.56,0.44))cM("SETTINGS FILE  (saved on your phone)")
M=ag(28)a.cfgName=go(M,"default","config name",J(0,0.5))a.cfgSave=H(M,"SAVE",l.good,11,J(0.5,0.25))a.cfgLoad=H(M,"LOAD",l.accent,11,J(0.75,0.25))
M=ag(26)a.cfgPrev=H(M,"<",l.panel2,11,J(0,0.13))a.cfgPick=H(M,"(none saved)",l.panel2,10,J(0.13,0.74))a.cfgNext=H(M,">",l.panel2,11,J(0.87,0.13))
M=ag(26)a.cfgAuto=H(M,"LOAD IT ON LAUNCH: OFF",l.panel2,10,J(0,1))a.cfgMsg=O(ag(26),"",10,l.dim,false)cM("START BY ITSELF")
M=ag(26)a.autoB=H(M,"INSTALL F.exec",l.accent,10,J(0,1))a.autoMsg=O(ag(30),"",10,l.dim,false)M=ag(28)a.startT=H(M,"START FARMING ON LOAD: ON",l.accent,10,J(0,1))
O(ag(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,l.dim,false)
cM("IF THE GAME DROPS ME")M=ag(28)a.rejT=H(M,"AUTO REJOIN: ON",l.accent,11,J(0,0.55))a.rejB=H(M,"REJOIN NOW",l.warn,11,J(0.55,0.45))
a.rejMsg=O(ag(30),"",10,l.dim,false)cM("SMOOTHER RUNNING  (for long / overnight runs)")M=ag(28)a.pfLite=H(M,"LITE MODE: OFF",l.panel2,10,J(0,0.5))
a.pfHud=H(M,"HIDE GAME HUD: OFF",l.panel2,10,J(0.5,0.5))M=ag(28)a.pfFps=H(M,"FPS CAP: GAME",l.panel2,10,J(0,0.5))
a.pfRender=H(M,"STOP 3D: OFF",l.panel2,10,J(0.5,0.5))M=ag(28)a.pfMem=go(M,tostring(d.MemLimit),"2000",J(0,0.24))
O(M,"MB: rejoin this server above it (0 = never)",9,l.dim,false,J(0.26,0.52))a.pfMemSet=H(M,"SET",l.accent,11,J(0.8,0.2))
a.pfInfo=O(ag(18),"",10,l.text,false)O(ag(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,l.dim,false)
cM("THE ROUND SAB BUTTON")O(ag(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,l.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,ee)local q3=L("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},kg)
a.tgRoot=L("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},q3)ai(a.tgRoot,20)L("UIStroke",{Color=l.line,Thickness=1},a.tgRoot)
a.tgBtn=L("TextButton",{Text="SAB",Size=aV,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=l.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=L("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ai(a.tgDot,4)a.tgGhost=L("TextButton",{Text="G: OFF",Size=UDim2 .new(0,46,0,18),Position=UDim2 .new(0.5,-23,1,4),
BackgroundColor3=l.panel2,Font=Enum.Font.GothamBold,TextSize=9,TextColor3=l.text,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ai(a.tgGhost,6)a.tgGhost.MouseButton1Click:Connect(function()o.cycleGhost()end)function o.paintGhost()local gB=o.ghostMode()
local q4=gB==2 and l.accent or(gB==1 and l.warn or l.panel2)if a.ghostT then a.ghostT.Text,a.ghostT.BackgroundColor3=o.GHOST[gB][1],q4 end
if a.tgGhost then a.tgGhost.Text,a.tgGhost.BackgroundColor3=o.GHOST[gB][2],q4 end end local bd={built=false,boxes={},at=0}
local function q5(q6,kt)d.Targets[q6]=kt or nil local ku=bd.boxes[q6]if ku then ku.Text=kt and"X"or""ku.BackgroundColor3=kt and l.good or l.panel2
end end local function kv()for yK,q7 in pairs(bd.boxes)do local q8=d.Targets[yK]==true q7 .Text=q8 and"X"or""
q7 .BackgroundColor3=q8 and l.good or l.panel2 end end local eg local function yL()local yM=0 local kw=L("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=O(kw,"",10,l.dim,false,J(0,0.5))local yN=H(kw,"CLEAR",l.panel2,10,J(0.5,0.24))local yO=H(kw,"REFRESH",l.panel2,10,J(0.74,0.26))
yN.MouseButton1Click:Connect(function()for yP in pairs(d.Targets)do d.Targets[yP]=nil end kv()end)yO.MouseButton1Click:Connect(function()
W.at=0 hD()eg(true)end)return yM end eg=function(yQ)if not hD()then if not a.butEmpty then a.butEmpty=O(L("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)end return end if bd.built and not yQ and bd.at==W.at then return end
for BK,kx in ipairs(a.but:GetChildren())do if kx:IsA("Frame")or kx:IsA("TextButton")then kx:Destroy()end end bd.boxes,a.butEmpty={},nil
yL()local ky,kz=36,1 local function q9(q_)kz=kz+1 local yR=L("Frame",{Size=UDim2 .new(1,0,0,q_),BackgroundTransparency=1,LayoutOrder=kz},a.but)
ky=ky+q_+6 return yR end for BL,gC in ipairs(W.rarOrder)do local yS=q9(24)local yT=qM[gC]or l.text local kA=L("Frame",{Size=aV,BackgroundColor3=l.panel,BorderSizePixel=0},yS)
ai(kA,6)O(kA,"  "..gC:upper(),11,yT,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local yU=H(kA,"ALL",l.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local yV=gC yU.MouseButton1Click:Connect(function()local ra=W.members[yV]or{}local rb=false for BM,yW in ipairs(ra)do if not d.Targets[yW]then rb=true break end end
for BN,yX in ipairs(ra)do q5(yX,rb)end end)for BO,kB in ipairs(W.members[gC]or{})do local yY=q9(22)local gD=L("TextButton",{Text="",Size=aV,BackgroundColor3=l.bg,BorderSizePixel=0,
AutoButtonColor=true},yY)ai(gD,5)O(gD,"   "..aj(kB),11,l.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local kC=L("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},gD)ai(kC,4)bd.boxes[kB]=kC local rc=kB local function rd()q5(rc,not d.Targets[rc])end
gD.MouseButton1Click:Connect(rd)kC.MouseButton1Click:Connect(rd)end end kv()a.but.CanvasSize=UDim2 .new(0,0,0,ky+10)
bd.built,bd.at=true,W.at end function K.paint()for yZ,re in pairs(K.boxes)do local rf=d.CrateTicks[yZ]==true re.Text=rf and"X"or""
re.BackgroundColor3=rf and l.good or l.panel2 end if a.crtInfo then local kD,kE=0,0 for BP in pairs(K.boxes)do kD=kD+1 end
for BQ,y0 in pairs(d.CrateTicks)do if y0 then kE=kE+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(kD,kE)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and l.accent or l.panel2
end end function K.build()for BR,kF in ipairs(a.crt:GetChildren())do if kF:IsA("Frame")or kF:IsA("TextButton")then kF:Destroy()end
end K.boxes={}local kG,kH=12,0 local function gE(rg)kH=kH+1 kG=kG+rg+6 return L("Frame",{Size=UDim2 .new(1,0,0,rg),BackgroundTransparency=1,LayoutOrder=kH},a.crt)
end local kI=gE(28)a.crtInfo=O(kI,"",10,l.dim,false,J(0,0.5))local y1=H(kI,"CLEAR",l.panel2,10,J(0.5,0.24))local y2=H(kI,"REFRESH",l.panel2,10,J(0.74,0.26))
T(y1 .MouseButton1Click:Connect(function()d.CrateTicks={}K.paint()end))T(y2 .MouseButton1Click:Connect(function()K.build()end))
a.crtAll=H(gE(28),"",l.accent,11,J(0,1))T(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates K.paint()end))
O(gE(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,l.dim,false)
for BS,be in ipairs(K.list())do local y3=gE(24)local eh=L("TextButton",{Text="",Size=aV,BackgroundColor3=l.panel,BorderSizePixel=0,AutoButtonColor=true},y3)
ai(eh,5)O(eh,"  "..(be.title or be.name)..(be.guess and"  (?)"or""),11,qM[be.rar or""]or l.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
O(eh,be.price and("$"..aC(be.price))or(be.rar or""),9,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local kJ=L("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},eh)ai(kJ,4)K.boxes[be.k]=kJ local rh=be.k local function ri()d.CrateTicks[rh]=(not d.CrateTicks[rh])or nil
K.paint()end T(eh.MouseButton1Click:Connect(ri))T(kJ.MouseButton1Click:Connect(ri))end a.crt.CanvasSize=UDim2 .new(0,0,0,kG+10)
K.built=K.at K.paint()end local rj="farm"local function bC(am)rj=am a.farm.Visible,a.but.Visible,a.set.Visible=(am=="farm"),(am=="but"),(am=="set")
a.crt.Visible=(am=="crt")a.pet.Visible,a.team.Visible=(am=="pet"),(am=="team")a.tabCrt.BackgroundColor3=(am=="crt")and l.accent or l.panel2
a.tabPet.BackgroundColor3=(am=="pet")and l.accent or l.panel2 a.tabTeam.BackgroundColor3=(am=="team")and l.accent or l.panel2
if am=="pet"and not j.built then pcall(j.build)end if am=="team"and not q.built then pcall(q.build)end if am=="crt"and(K.built~=K.at or not next(K.boxes))then K.build()end
a.tabFarm.BackgroundColor3=(am=="farm")and l.accent or l.panel2 a.tabBut.BackgroundColor3=(am=="but")and l.accent or l.panel2
a.tabSet.BackgroundColor3=(am=="set")and l.accent or l.panel2 if am=="but"then eg(false)end end local function N(gF,gG,y4,y5)
a.put(gF,gG and y4 or y5)if a.lit[gF]~=gG then a.lit[gF]=gG gF.BackgroundColor3=gG and l.accent or l.panel2 end
end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(rk)
local b5=j.rows and j.rows[rk]if not b5 then return end local ei=d.Pets[rk]or{}b5 .b.BackgroundColor3=ei.b and l.good or l.panel2
b5 .g.BackgroundColor3=ei.g and l.accent or l.panel2 b5 .g.Text=ei.g and"BIG"or"ANY"b5 .w.BackgroundColor3=ei.w and l.warn or l.panel2
local kK=tonumber(ei.f)or 0 b5 .f.Text=kK>0 and(kK.." BIG")or"FUSE"b5 .f.BackgroundColor3=kK>0 and l.good or l.panel2
end function j.flag(kL,gH)local aY=d.Pets[kL]or{}if gH=="f"then local rl=((tonumber(aY.f)or 0)+1)%4 aY.f=rl>0 and rl or nil
elseif aY[gH]then aY[gH]=nil else aY[gH]=true end d.Pets[kL]=(aY.b or aY.g or aY.w or aY.f)and aY or nil j.paintRow(kL)
end function j.paintAll()for y6 in pairs(j.rows or{})do j.paintRow(y6)end if a.pbT then N(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function j.live()if not j.built then j.build()return end if x()-(j.liveAt or 0)<1 then return end j.liveAt=x()
local rm=j.wishes()local ej=j.data()for gI,gJ in pairs(j.rows)do gJ.name.Text=j.nice(gI)..(rm[gI]and("   * wish %dm"):format(math.ceil(rm[gI]/60))or"")
local rn=z.status(gI,ej)gJ.desc.Text=rn and(rn.." | "..gJ.boostText)or gJ.boostText end local ro=tonumber(E:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(ej and#(ej.pets or{})or 0,ej and tonumber(ej.maxOwned)or 60,
aC(j.money()),ro>0 and(" | free wishes "..ro)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local gK=j.info()for BT,kM in ipairs(a.pet:GetChildren())do if kM:IsA("Frame")or kM:IsA("TextLabel")then kM:Destroy()end
end j.rows={}local kN,gL=0,12 local function cN(rp)kN,gL=kN+1,gL+rp+6 return L("Frame",{Size=UDim2 .new(1,0,0,rp),BackgroundTransparency=1,LayoutOrder=kN},a.pet)
end local kO=cN(28)a.pbT=H(kO,"AUTO ADOPT: OFF",l.panel2,9,J(0,0.34))a.pwT=H(kO,"AUTO WISH: OFF",l.panel2,9,J(0.34,0.33))
a.pfT=H(kO,"AUTO FUSE: OFF",l.panel2,9,J(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy j.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish j.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse j.paintAll()end)
a.pInfo=O(cN(44),"",10,l.dim,false)O(cN(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,l.dim,false)
if not gK then O(cN(30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,gL)
j.built=false return end local cO={}for BU,rq in ipairs(j.order())do local kP=gK.Pets[rq].rarity or"?"cO[kP]=cO[kP]or{}
table.insert(cO[kP],rq)end local cP={}for BV,rr in ipairs(gK.Rarities or{})do if cO[rr]then cP[#cP+1]=rr end end
for rs in pairs(cO)do if not table.find(cP,rs)then cP[#cP+1]=rs end end for BW,gM in ipairs(cP)do local rt=L("Frame",{Size=aV,BackgroundColor3=l.panel,BorderSizePixel=0},cN(22))
ai(rt,6)O(rt,"  "..gM:upper(),11,j.RC[gM]or l.text,true)for BX,gN in ipairs(cO[gM])do local b6=L("Frame",{Size=aV,BackgroundColor3=l.bg,BorderSizePixel=0},cN(38))
ai(b6,5)local y7=O(b6,j.nice(gN),11,j.RC[gM]or l.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local y8,y9=pcall(function()return gK.describe(gN)end)
local ru=y8 and tostring(y9)or""local y_=O(b6,ru,9,l.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local rv=H(b6,"BUY",l.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local rw=H(b6,"ANY",l.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local rx=H(b6,"WISH",l.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local ry=H(b6,"FUSE",l.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local gO=gN rv.MouseButton1Click:Connect(function()j.flag(gO,"b")end)
rw.MouseButton1Click:Connect(function()j.flag(gO,"g")end)rx.MouseButton1Click:Connect(function()j.flag(gO,"w")end)
ry.MouseButton1Click:Connect(function()j.flag(gO,"f")end)j.rows[gN]={b=rv,g=rw,w=rx,f=ry,name=y7,desc=y_,boostText=ru}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,gL+10)j.built=true j.paintAll()end function o.paint()N(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")N(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
N(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end
end function o.applyAll()if d.Lite then o.lite(true)end if d.HideHud then o.hideHud(true)end if d.NoRender then o.render(true)end
if(d.FpsCap or 0)~=0 then o.cap(d.FpsCap)end o.paint()end T(a.pfLite.MouseButton1Click:Connect(function()o.lite(not d.Lite)o.paint()end))
T(a.pfHud.MouseButton1Click:Connect(function()o.hideHud(not d.HideHud)o.paint()end))T(a.pfRender.MouseButton1Click:Connect(function()o.render(not d.NoRender)o.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local za=table.find(o.CAPS,d.FpsCap or 0)or 1 local rz=o.CAPS[(za%#o.CAPS)+1]
if not o.cap(rz)and rz~=0 then y("this executor cannot cap fps")end o.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local kQ=tonumber(a.pfMem.Text)if kQ and kQ>=0 then d.MemLimit=math.floor(kQ)end o.paint()end))function q.names()
local kR={"(none)"}for BY,zb in ipairs((q.teams()))do kR[#kR+1]=zb.name end return kR end function q.cycle(kS,zc)
local gP=q.names()local zd=d[kS]~=""and d[kS]or"(none)"local gQ=table.find(gP,zd)or 1 gQ=((gQ-1+zc)%#gP)+1 d[kS]=gP[gQ]=="(none)"and""or gP[gQ]
q.paint()end function q.paint()if not q.built then return end N(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
N(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local kT={}for BZ,ze in ipairs((q.teams()))do kT[ze.name]=true end
for zf,rA in pairs(q.pick)do local cQ=d[zf]rA.Text=cQ==""and"(none)"or(kT[cQ]and cQ or(cQ.." (missing)"))rA.TextColor3=(cQ~=""and not kT[cQ])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(q.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(q.switches,q.finished,q.glazed,z.fused)
..(z.buildMsg~=""and("\n"..z.buildMsg)or"")local zg,gR=j.srv(),{}for B0,gS in ipairs(q.list or{})do gR[#gR+1]=("st %-2s %-22s %9s  helps %d"):format(gS.st.Name,aj(ab(gS.name)):sub(1,22),q.clock(gS.ends-zg),gS.helps)
end a.tmList.Text=#gR>0 and table.concat(gR,"\n")or"no waxes running"end function q.build()for B1,kU in ipairs(a.team:GetChildren())do
if kU:IsA("Frame")or kU:IsA("TextLabel")then kU:Destroy()end end q.pick={}local kV,kW=0,12 local function bD(rB)
kV,kW=kV+1,kW+rB+6 return L("Frame",{Size=UDim2 .new(1,0,0,rB),BackgroundTransparency=1,LayoutOrder=kV},a.team)
end local function ek(zh)O(bD(14),zh,10,l.dim,true)end local function gT(gU)local kX=bD(26)local zi=H(kX,"<",l.panel2,11,J(0,0.14))
local rC=H(kX,"(none)",l.panel,10,J(0.14,0.72))local zj=H(kX,">",l.panel2,11,J(0.86,0.14))zi.MouseButton1Click:Connect(function()q.cycle(gU,-1)end)
zj.MouseButton1Click:Connect(function()q.cycle(gU,1)end)rC.MouseButton1Click:Connect(function()q.cycle(gU,1)end)
q.pick[gU]=rC end a.tmT=H(bD(28),"AUTO TEAMS: OFF",l.panel2,11,J(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=q.current()end q.paint()end)a.tmInfo=O(bD(42),"",10,l.dim,false)
local rD=bD(26)a.tmBuild=H(rD,"AUTO BUILD TEAMS: OFF",l.panel2,9,J(0,0.62))a.tmBuildNow=H(rD,"BUILD NOW",l.warn,9,J(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild q.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if q.editing then return end z.buildMsg="building..."task.spawn(function()local zk,zl=pcall(z.rebuild,"you asked")if not zk then y("BUILD ERR "..tostring(zl))end end)
end)ek("NORMAL TEAM  (worn the rest of the time)")gT("TeamNormal")ek("FULL TEAM  (every station busy: money + wax speed)")
gT("TeamFull")ek("GLAZE TEAM  (worn just before a wax finishes)")gT("TeamGlaze")local kY=bD(26)a.tmLead=go(kY,tostring(d.GlazeLead),"45",J(0,0.2))
O(kY,"sec before it finishes",10,l.dim,false,J(0.22,0.5))local zm=H(kY,"SET",l.accent,11,J(0.75,0.25))zm.MouseButton1Click:Connect(function()
local gV=tonumber(a.tmLead.Text)if gV and gV>=5 and gV<=600 then d.GlazeLead=math.floor(gV)else a.tmLead.Text=tostring(d.GlazeLead)end
q.paint()end)ek("WAX TEAM  (worn while a butter is placed: head starts)")gT("TeamWax")ek("YOUR WAXES  (time left, helps)")
a.tmList=L("TextLabel",{Size=aV,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bD(150))ai(a.tmList,6)L("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
O(bD(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,l.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,kW+10)q.built=true q.paint()end local function zn()a.secB.Text=tostring(d.Every)
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")o.paintGhost()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ad(0.1)end if not C.home then pcall(o.unpin)end end)end
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then d1(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bB(a.root)bB(a.tgRoot)c.lastCollect=x()
kv()K.paint()pcall(j.paintAll)pcall(q.paint)pcall(o.applyAll)end local function zo(rE)task.spawn(function()rE.TextColor3=l.bad
task.wait(0.8)if c.alive then rE.TextColor3=l.text end end)end local function rF()local rG=a.secB.Text:match("^%s*(%d+)%s*$")
local el=rG and tonumber(rG)if not el or el<1 then a.secB.Text=tostring(d.Every)zo(a.secB)y("interval must be a whole number >= 1")
return end if el==d.Every then return end d.Every,c.lastCollect=el,x()y("collect every "..el.."s")end local function P(zp,zq)T(zp.MouseButton1Click:Connect(zq))end
P(a.secSet,rF)T(a.secB.FocusLost:Connect(rF))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(an,"selling...",p3)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(A.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help C.nextAt,C.msg=0,d.Help and"looking for waxes to help"or"off"N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests D.at=0 N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire F.nextAt,F.fails,F.lost=0,0,0 N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,o.cycleGhost)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(an,"opening crate...",fi,true)
end)P(a.padB,function()c.plot=bf()or c.plot local rH,kZ=ar(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(rH and kZ and kZ:IsA("BasePart"))then y("SET PAD: need character and plot")return end c.manualPad=kZ.CFrame:ToObjectSpace(rH.HumanoidRootPart.CFrame)
xh(c.manualPad)y("collect pad saved at your position")end)P(a.startB,function()d1(not c.running)end)P(a.buyB,function()
c.plot=bf()or c.plot task.spawn(an,"buying (manual)...",mO,true)end)P(a.plB,function()c.plot=bf()or c.plot task.spawn(an,"waxing (manual)...",mT)
end)P(a.tabFarm,function()bC("farm")end)P(a.tabBut,function()bC("but")end)P(a.tabSet,function()bC("set")end)P(a.tabCrt,function()bC("crt")end)
P(a.tabPet,function()bC("pet")end)P(a.tabTeam,function()bC("team")end)local function zr(k0)c.hidden=k0 a.root.Visible=not k0
a.tgBtn.Text=k0 and"SAB+"or"SAB"end qU(a.tgBtn,a.tgRoot,function()bB(a.tgRoot)c.togPos=gs(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then zr(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aB,ao={},0
local function bE()aB=mb()if#aB==0 then a.cfgPick.Text="(none saved)"ao=0 return end if ao<1 or ao>#aB then ao=1 end
a.cfgPick.Text=aB[ao]..("  (%d/%d)"):format(ao,#aB)end local function rI()local rJ=c.autoload~=nil a.cfgAuto.Text=rJ and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=rJ and l.accent or l.panel2 end local function k1()local rK=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if rK~=""then return rK end return(ao>0 and aB[ao])or""end P(a.cfgSave,function()c.winPos=gs(a.root)or c.winPos
c.togPos=gs(a.tgRoot)or c.togPos local rL,rM=eY(k1())a.cfgMsg.Text=rL and("saved as "..rM)or("could not save: "..rM)
a.cfgMsg.TextColor3=rL and l.good or l.bad bE()y(a.cfgMsg.Text)end)local function zs(k2)local k3,rN=mk(k2)a.cfgMsg.Text=k3 and("loaded "..rN)or("could not load: "..rN)
a.cfgMsg.TextColor3=k3 and l.good or l.bad if k3 then a.cfgName.Text=k2 zn()task.spawn(A.apply,"config "..k2)
end y(a.cfgMsg.Text)end P(a.cfgLoad,function()zs(k1())end)P(a.cfgPick,function()bE()if ao>0 then a.cfgName.Text=aB[ao]end
end)P(a.cfgPrev,function()if#aB==0 then bE()return end ao=(ao-2)%#aB+1 bE()a.cfgName.Text=aB[ao]end)P(a.cfgNext,function()
if#aB==0 then bE()return end ao=ao%#aB+1 bE()a.cfgName.Text=aB[ao]end)P(a.cfgAuto,function()if c.autoload then
mm(nil)a.cfgMsg.Text="it will not load a config on launch"else local em=k1()local rO=false for B2,zt in ipairs(mb())do if zt==em then rO=true end end
local zu=rO or eY(em)if zu and em~=""then mm(em)bE()a.cfgMsg.Text=em.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim rI()end)P(a.autoB,function()
local rP,rQ=tF()a.autoMsg.Text=rP and("installed. "..rQ)or("failed: "..rQ)a.autoMsg.TextColor3=rP and l.good or l.bad
y(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()c8("you asked")end)
local bF=false P(a.minB,function()bF=not bF a.tabs.Visible=not bF if bF then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bC(rj)end a.root.Size=UDim2 .new(0,af.w,0,bF and(af.head+af.strip)or af.h)
a.minB.Text=bF and"+"or"-"end)local function gW()if not c.alive then return end c.alive,c.running=false,false
pcall(o.restoreAll)pcall(ez)for B3,zv in ipairs(g4)do pcall(function()zv:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()kh:Destroy()end)pcall(function()q3:Destroy()end)if b9 .SAB_KILL==gW then b9 .SAB_KILL=nil end
end b9 .SAB_KILL=gW P(a.killB,gW)P(a.xB,gW)qU(a.title,a.root,function()bB(a.root)c.winPos=gs(a.root)or c.winPos
end)local function rR()local en,b7=c.reason,c.level if c.busy then en,b7=c.busyText,"ok"elseif not c.running then
local B4,rS,zw=p9()if c.capHit then en,b7=rS,"bad"else en,b7="[stopped] "..rS,(zw=="bad")and"bad"or"idle"end c.reason,c.level=en,b7
end local gX=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=gX then a.lit.dot=gX a.dot.BackgroundColor3,a.tgDot.BackgroundColor3=gX,gX end
if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end if c.hidden then return end
a.put(a.reason,en)if a.lit.bar~=b7 then a.lit.bar=b7 a.bar.BackgroundColor3=x3[b7]or l.dim end if bF then return end
if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
end N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")local bG=tf()if a.farm.Visible then
local zx,zy=ew()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,zx.."/"..zy)local rT=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local rU=aa()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aC(aZ()),c.rolls,c.gifts,c.crates,rU and aj(ab(rU))or"nothing",e.on and("   ["..e.title.." window open]")or"",
rT and("in "..rT.."s")or"off"))a.put(a.tgt,(#bG==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bG<=3)and table.concat(bG,", ")or(#bG.." butters ticked"))))
if a.lit.tgt~=(#bG==0)then a.lit.tgt=(#bG==0)a.tgt.TextColor3=(#bG==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(eq,"\n")end
end if a.set.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(W.n,#W.rarOrder,#bG))
end if a.but.Visible and bd.at~=W.at then eg(false)end if a.crt.Visible then if K.built~=K.at then K.build()else K.paint()end
end if a.pet.Visible then j.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak)
end if a.team.Visible then q.paint()end if a.farm.Visible then a.put(a.helpL,"help: "..((d.Help or d.HelpGuild)and C.msg or"off"))
a.put(a.campL,"camp: "..(d.Campfire and F.msg or"off")..(o.ghostMode()>0 and(o.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests: "..(d.Quests and(D.msg~=""and D.msg or"checking...")or"off"))N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local rV=(A.rec.on and"on"or"")..(A.rec.off and((A.rec.on and"/"or"").."off")or"")
a.put(a.arL,A.msg~=""and A.msg or("auto roll: game %s | learned %s%s"):format(A.isOn()and"ON"or"off",rV~=""and rV or"nothing yet",#A.rec.rules>0 and", choices"or""))
if a.lit.arL~=(A.msg~="")then a.lit.arL=(A.msg~="")a.arL.TextColor3=A.msg~=""and l.warn or l.dim end end end b9 .SAB={S=c,CFG=d,EV=Q,U=a,sg=kh,CAT=W,LEARN=ae,buildList=eg,
logAll=cR,evAll=cS,AR=A,CR=K,PF=o,PX=j,TM=q,CRATE=e,FU=z,HX=C,CF=F,QX=D}y(b8 .." loaded")if c.uiErrs>0 then y("UI: "..c.uiErrs.." properties skipped")end
bC("farm")bB(a.root)bB(a.tgRoot)if gp then pcall(function()T(gp:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bB(a.root)bB(a.tgRoot)end))end)end bE()rI()if c.config and c.config~=""then a.cfgName.Text=c.config end
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")o.paintGhost()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(o.applyAll)pcall(rR)task.spawn(function()local rW=tD()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(rW and("\n(backup: "..rW..")")or"")
local rX=eT(ah.exec)if rX and not rX:find("SAB autoloader v2",1,true)then c4(ah.exec,ah.stub)y("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(eT(ah.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(tL)end)task.spawn(function()while c.alive do local zz,zA=pcall(rR)if not zz then y("UI ERR "..tostring(zA))end
task.wait((c.hidden or bF)and 1.5 or 0.4)end end)task.spawn(function()local zB,zC=pcall(tU)if not zB then y("HOOK ERR "..tostring(zC))end
end)task.spawn(function()pcall(sE)if e.loadSeq and not e.learned then local gY={}for rY=1,20 do if e.loadSeq[rY]then gY[#gY+1]=e.loadSeq[rY]end end
if#gY>0 then e.learned={seq=gY,mode=e.loadMode}y("remembered how to open crates directly")end end if hD()then y(("catalog: %d butters in %d rarities"):format(W.n,#W.rarOrder))end
local zD,rZ=pcall(xj)if zD and rZ and c.alive and not c.manualPad then c.manualPad=rZ end end)task.spawn(function()
while c.alive do local k4,k5=pcall(j.buyTick)if not k4 then y("PET ERR "..tostring(k5))task.wait(5)end k4,k5=pcall(j.wishTick)
if not k4 then y("WISH ERR "..tostring(k5))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local gZ,r0=0,x()
T(game:GetService("RunService").Heartbeat:Connect(function()gZ=gZ+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if o.hold then pcall(o.pinTick)end end))
o.noteAt=x()while c.alive do task.wait(1)local r1=x()o.fps,gZ,r0=gZ/math.max(r1-r0,0.001),0,r1 local zE,zF=pcall(o.tick)
if not zE then y("PERF ERR "..tostring(zF))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local zG,zH=pcall(z.tick)if not zG then y("FUSE ERR "..tostring(zH))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local zI,zJ=pcall(q.tick)if not zI then y("TEAM ERR "..tostring(zJ))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local g0=ap:WaitForChild("Remotes",30)local r2=g0 and g0:WaitForChild("ClanEvent",30)
if r2 and c.alive then T(r2 .OnClientEvent:Connect(function(zK,zL)if zK=="call"then pcall(C.onCall,zL)end end))
end local r3=g0 and g0:FindFirstChild("RollConfirmAsk")if r3 and c.alive then T(r3 .OnClientEvent:Connect(function(zM)D.asked=zM or"butter"end))end
end)task.spawn(function()task.wait(8)while c.alive do local zN,zO=pcall(D.tick)if not zN then y("QUEST ERR "..tostring(zO))task.wait(30)end
task.wait(3)end end)task.spawn(function()while c.alive do task.wait(20)pcall(ez)end end)pcall(A.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local zQ=(type(newcclosure)=="function")and newcclosure or function(zP)return zP end local k6
local r4=(type(setnamecallmethod)=="function")and setnamecallmethod or nil k6=hookmetamethod(game,"__namecall",zQ(function(r5,...)
local eo=getnamecallmethod()if c.alive and(eo=="InvokeServer"or eo=="FireServer")then local r6,r7=pcall(function()return r5 .Name end)
if r6 and r7=="CrateAction"and not e.replaying then pcall(e.saw,eo,...)elseif r6 and r7=="AutoRollAction"and not A.replaying then pcall(A.saw,eo,...)end
if r4 then r4(eo)end end return k6(r5,...)end))e.oldNC=k6 end)end if g2 then T(E.Idled:Connect(function()pcall(function()g2:CaptureController()g2:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for B5=1,90 do if not c.alive then return end if E:GetAttribute("AutoRollOn")~=nil and ar()and(c.plot or bf())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then A.apply("joined")end while c.alive do task.wait(30)if c.alive and d.AutoRoll and c.running and not A.isOn()and not bK()and not aa()
and not e.waiting and not e.on and not c.busy then A.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for B6=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bf()if ar()and c.plot and next(d.Targets)then d1(true,true)y("started by itself")
return end task.wait(1)end if c.alive and not c.running then y("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bf()c.lastCollect=x()while c.alive do if c.running then local zR,r8=pcall(xY)if not zR and r8~=g3 then y("LOOP ERR "..tostring(r8))end
end task.wait(0.1)end end)g1("loaded - window is at the top left")end local zT,k7=xpcall(sb,function(zS)return tostring(zS).."\n"..debug.traceback()end)
if not zT then pcall(function()warn("SAB "..b8 .." ERROR: "..tostring(k7))end)g1("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b8 .." ERROR: "..tostring(k7))end)pcall(function()local r9=(type(getgenv)=="function"and getgenv())or _G
if type(r9 .SAB_KILL)=="function"then r9 .SAB_KILL()end for B7,zU in ipairs({"SABFarmGui","SABToggle"})do local r_=E.PlayerGui:FindFirstChild(zU)
if r_ then r_:Destroy()end end end)pcall(function()local ep=Instance.new("ScreenGui")ep.Name="SABError"ep.ResetOnSpawn=false
ep.DisplayOrder=1000 local aO=Instance.new("TextBox")aO.Size=UDim2 .new(0,340,0,170)aO.Position=UDim2 .new(0,10,0,50)
aO.BackgroundColor3=Color3 .fromRGB(90,20,20)aO.TextColor3=Color3 .new(1,1,1)aO.TextSize=11 aO.TextWrapped=true
aO.ClearTextOnFocus=false aO.TextXAlignment=Enum.TextXAlignment.Left aO.TextYAlignment=Enum.TextYAlignment.Top
aO.Text="SAB "..b8 .." failed to start. Send this text:\n"..tostring(k7)aO.Parent=ep ep.Parent=E:WaitForChild("PlayerGui")
end)end
