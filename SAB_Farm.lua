local b7="v25"local kX=game:GetService("Players")local J=kX.LocalPlayer or kX.PlayerAdded:Wait()local function gR(rZ)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..b7,Text=rZ,Duration=6})
end)end gR("script started")local function r0()local aq=game:GetService("ReplicatedStorage")local av=game:GetService("Workspace")
local kY=game:GetService("UserInputService")local b8=(type(getgenv)=="function"and getgenv())or _G if type(b8 .SAB_KILL)=="function"then pcall(b8 .SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local gS=(function()local r1,r2=pcall(function()return game:GetService("VirtualUser")end)return r1 and r2 or nil end)()
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
local j,q,o,z,C,K,D={},{},{},{},{},{},{}local gT={}local gU,er,cQ,cR={},{},{},{}local function T(kZ)gU[#gU+1]=kZ return kZ end
local function ad(r3)task.wait(r3)if not c.alive then error(gT,0)end end local function y(es)es=os.date("%H:%M:%S").." "..tostring(es)
table.insert(er,1,es)if#er>6 then table.remove(er)end cQ[#cQ+1]=es if#cQ>80 then table.remove(cQ,1)end end local function et(k0)
if type(k0)~="string"then return""end return(k0:lower():gsub("[^%w]",""))end local function ab(r4)local k1=et(r4)
local gV=k1:gsub("butter$","")if gV==""then gV=k1 end return gV end local function aQ(gW)return type(gW)=="string"and ab(gW)~=""and d.Targets[ab(gW)]==true end
local function r5(cS)cS=cS:lower()return cS:find("squishy",1,true)~=nil or cS:match("butter$")~=nil or cS:match("butter[^%a]")~=nil
end local gX={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aD(cT)if type(cT)~="number"then return"?"end
local eu=1 while math.abs(cT)>=1000 and eu<#gX do cT=cT/1000 eu=eu+1 end local r6=string.format("%.2f",cT):gsub("%.?0+$","")
return r6 ..gX[eu]end local function r7(k2)if type(k2)~="string"then return nil end local r8,k3=k2:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local gY=tonumber(r8)if not gY then return nil end if k3==""then return gY end for r9,r_ in ipairs(gX)do if r_:lower()==k3:lower()then return gY*1000^(r9-1)end end
return nil end local function aY()local k4=J:GetAttribute("BoardValueMoney")if type(k4)=="number"then return k4 end
local k5=J:FindFirstChild("leaderstats")if k5 then for zF,sa in ipairs({"Cash","Money","Coins"})do local gZ=k5:FindFirstChild(sa)
if gZ and type(gZ.Value)=="number"then return gZ.Value end end end end local function ev(sb)local g0=sb:GetFullName()
if c.plot then local g1=c.plot:GetFullName()if g0:sub(1,#g1)==g1 then return g0:sub(#g1+2)end end return g0 end
local function ar()local ew=J.Character if ew and ew:FindFirstChild("HumanoidRootPart")then local k6=ew:FindFirstChildOfClass("Humanoid")
if k6 and k6 .Health>0 then return ew end end end local function bf()local g2=av:FindFirstChild("Plots")if not g2 then return nil end
local function k7(sc)local k8=sc:FindFirstChild("Plate")return k8~=nil and k8:FindFirstChild("EditStackAttachment",true)~=nil
end local k9=J:GetAttribute("PlotNumber")if k9~=nil then local g3=g2:FindFirstChild(tostring(k9))if g3 and k7(g3)then return g3 end
end for zG,k_ in ipairs(g2:GetChildren())do if k7(k_)then return k_ end end end local function cU(la)local bh=la and la.Parent
for zH=1,6 do if not bh then return nil end if bh:IsA("BasePart")then return bh end if bh:IsA("Model")then return bh.PrimaryPart or bh:FindFirstChildWhichIsA("BasePart",true)end
bh=bh.Parent end end local function lb(lc)local g4=lc.Parent if g4 and g4:IsA("Attachment")then return g4 .WorldPosition end
local ld=cU(lc)return ld and ld.Position end local function le()local b9=c.plot and c.plot:FindFirstChild("Plate")
if not b9 then return nil end if b9:IsA("BasePart")then return b9 .Position end if b9:IsA("Model")then return b9:GetPivot().Position end
local lf=b9:FindFirstChildWhichIsA("BasePart",true)return lf and lf.Position end local function lg()local g5={}
local lh=c.plot and c.plot:FindFirstChild("WaxStations")if lh then for zI,sd in ipairs(lh:GetChildren())do local li=sd:FindFirstChild("SquishyPlaceHolder")
local g6=li and li:FindFirstChild("PlacePrompt")if g6 and g6:IsA("ProximityPrompt")then g5[#g5+1]=g6 end end end
return g5 end local function ex()local lj,g7=lg(),0 for zJ,se in ipairs(lj)do if se.Enabled then g7=g7+1 end end
local g8=#lj local g9=J:GetAttribute("WaxStations")if type(g9)=="number"and g9>g8 then g8=g9 end return g7,g8
end local function sf()local lk=ar()local ll=lk and lk.HumanoidRootPart.Position local g_,lm for zK,ha in ipairs(lg())do
if ha.Enabled then local ln=lb(ha)local lo=(ln and ll)and(ln-ll).Magnitude or 1e9 if not g_ or lo<lm then g_,lm=ha,lo end
end end return g_ end local function lp()local ey=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not ey then return nil end local lq=ey:FindFirstChild("BuyPromptAttachment")local ez=(lq and lq:FindFirstChild("BuyPrompt"))or ey:FindFirstChild("BuyPrompt",true)
if ez and ez:IsA("ProximityPrompt")and ez:IsDescendantOf(ey)then return ez end end local lr={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local sh={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ae={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local W={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local hb="SAB_order.txt"local function eA()if not ae.dirty or type(writefile)~="function"then return end local ay={}
for si,sj in pairs(ae.price)do ay[#ay+1]="P|"..si.."|"..string.format("%.0f",sj)end for sk,sl in pairs(ae.order)do ay[#ay+1]="O|"..sk.."|"..table.concat(sl,",")end
if e.learned and e.enc then ay[#ay+1]="M|mode|"..tostring(e.learned.mode or"")for sm,eB in ipairs(e.learned.seq)do
local ls={}for lt=1,eB.n do ls[lt]=e.enc(eB.args[lt])end ay[#ay+1]=("A|%d|%s|%d|%s"):format(sm,eB.m,eB.n,table.concat(ls,";"))
end end local function hc(sn,so,eC)local lu={}for lv=1,eC.n do lu[lv]=e.enc(eC.args[lv])end ay[#ay+1]=("R|%d|%s|%s|%d|%s"):format(so,sn,eC.m,eC.n,table.concat(lu,";"))
end if e.enc then for sp,sq in ipairs(A.rec.rules)do hc("rules",sp,sq)end if A.rec.on then hc("on",0,A.rec.on)end
if A.rec.off then hc("off",0,A.rec.off)end end for zL,cV in pairs(L.seen)do ay[#ay+1]=("K|%s|%s|%s|%s"):format(cV.name,cV.title or"",cV.rar or"",cV.price and string.format("%.0f",cV.price)or"")
end if pcall(writefile,hb,table.concat(ay,"\n"))then ae.dirty=false end end local function sr()if type(isfile)~="function"or type(readfile)~="function"then return end
local ss,su=pcall(isfile,hb)if not(ss and su)then return end local sv,lw=pcall(readfile,hb)if not(sv and type(lw)=="string")then return end
for sw in lw:gmatch("[^\n]+")do local b_,ca,aZ=sw:match("^(%a)|([^|]+)|(.*)$")if b_=="P"then ae.price[ca]=tonumber(aZ)
elseif b_=="M"then e.loadMode=(aZ~=""and aZ~="nil")and aZ or nil elseif b_=="A"and e.dec then local lx=tonumber(ca)
local ly,eD,sx=aZ:match("^([^|]+)|(%d+)|(.*)$")if lx and ly then eD=tonumber(eD)local lz,eE={},0 for sy in(sx..";"):gmatch("([^;]*);")do
eE=eE+1 if eE<=eD then lz[eE]=e.dec(sy)end end e.loadSeq=e.loadSeq or{}e.loadSeq[lx]={m=ly,n=eD,args=lz}end elseif b_=="R"and e.dec then
local lA=tonumber(ca)local eF,sz,eG,sA=aZ:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if lA and eF then eG=tonumber(eG)
local lB,eH={},0 for sB in(sA..";"):gmatch("([^;]*);")do eH=eH+1 if eH<=eG then lB[eH]=e.dec(sB)end end local hd={m=sz,n=eG,args=lB}
if eF=="rules"then A.rec.rules[lA]=hd elseif eF=="on"then A.rec.on=hd elseif eF=="off"then A.rec.off=hd end end
elseif b_=="K"then local lC,lD,sC=aZ:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(ca)]={name=ca,title=lC~=""and lC or nil,
rar=lD~=""and lD or nil,price=tonumber(sC)}elseif b_=="O"and aZ~=""then local eI={}for sD in aZ:gmatch("[^,]+")do eI[#eI+1]=sD end
if#eI>0 then ae.order[ca]=eI end end end end local function sE(eJ)if type(eJ)~="table"then return end local bG,lE=eJ.rarity,eJ.contents
if type(bG)~="string"or bG==""or type(lE)~="table"then return end local cW={}for zM,eK in ipairs(lE)do if type(eK)=="table"and type(eK.butter)=="string"then
cW[#cW+1]={n=eK.butter,ch=tonumber(eK.chance)or 0}end end if#cW==0 then return end table.sort(cW,function(sF,sG)return sF.ch>sG.ch end)
local cX,cY={},false for sH,sI in ipairs(cW)do cX[sH]=sI.n end local he=ae.order[bG]if not he or#he~=#cX then cY=true end
if not cY then for lF=1,#cX do if he[lF]~=cX[lF]then cY=true break end end end ae.order[bG]=cX local hf=tonumber(eJ.price)
if hf and ae.price[bG]~=hf then ae.price[bG]=hf cY=true end if cY then ae.dirty=true W.at=0 y("learned the "..bG.." order from its crate")
end end local function cb(sJ,sK)local sL=sJ:FindFirstChild(sK,true)local sM,hg=pcall(function()return sL.Text end)
return(sM and type(hg)=="string"and hg~="")and hg or nil end local function ah(lG)return W.pretty[lG]or lG end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(sN)return et(sN or"")end
function L.learn(a0)if type(a0)~="table"or type(a0 .name)~="string"then return end local hh=L.key(a0 .name)local a1=L.seen[hh]or{}
local sO=(L.seen[hh]==nil)or(tonumber(a0 .price)and a1 .price~=tonumber(a0 .price))a1 .name,a1 .title=a0 .name,a0 .title or a1 .title
a1 .rar,a1 .price=a0 .rarity or a1 .rar,tonumber(a0 .price)or a1 .price L.seen[hh]=a1 if sO then L.at,ae.dirty=x(),true end
end function L.wanted(lH)return lH~=nil and d.CrateTicks[L.key(lH)]==true end function L.list()local cc={}for sP,eL in ipairs(L.base)do cc[L.key(eL[1])]={name=eL[1],title=eL[2],rar=eL[3],i=sP}end
for zN,cZ in ipairs(W.rarOrder)do local lI=false for zO,sQ in pairs(cc)do if sQ.rar==cZ then lI=true break end end
if not lI and cZ~="?"then local lJ=cZ:gsub("[^%w]","").."Crate"cc[L.key(lJ)]={name=lJ,title=cZ.." Crate",rar=cZ,i=50,guess=true}
end end for lK,eM in pairs(L.seen)do local aR=cc[lK]or{i=100}aR.name,aR.title,aR.rar=eM.name or aR.name,eM.title or aR.title,eM.rar or aR.rar
aR.price,aR.guess=eM.price or aR.price,nil cc[lK]=aR end local c0,eN={},{}for sR,sS in ipairs(lr)do c0[sS]=sR end
for sT,lL in ipairs(W.rarOrder)do c0[lL]=c0[lL]or(20+sT)end for sU,c1 in pairs(cc)do c1 .k=sU c1 .price=c1 .price or ae.price[c1 .rar or""]
eN[#eN+1]=c1 end table.sort(eN,function(bH,bI)if bH.price and bI.price and bH.price~=bI.price then return bH.price<bI.price end
local lM,lN=c0[bH.rar or""]or 99,c0[bI.rar or""]or 99 if lM~=lN then return lM<lN end if(bH.i or 100)~=(bI.i or 100)then return(bH.i or 100)<(bI.i or 100)end
return bH.k<bI.k end)return eN end local function sV()local lO=aq:FindFirstChild("Assets")local lP=lO and lO:FindFirstChild("Squishies")
if not lP then return false end local hi,lQ,cd={},{},{}local eO=0 for zP,eP in ipairs(lP:GetChildren())do local c2=ab(eP.Name)
if c2~=""and not hi[c2]then local eQ=cb(eP,"RarityText")or"?"hi[c2]=eQ lQ[c2]=cb(eP,"NameText")or eP.Name cd[eQ]=cd[eQ]or{}
table.insert(cd[eQ],c2)eO=eO+1 end end if eO==0 then return false end for lR,sW in pairs(cd)do local lS=ae.order[lR]or sh[lR]
local hj={}if lS then for sX,sY in ipairs(lS)do hj[ab(sY)]=sX end end table.sort(sW,function(lT,lU)local hk,hl=hj[lT],hj[lU]
if hk and hl then return hk<hl end if hk then return true end if hl then return false end return ah(lT)<ah(lU)
end)end local hm={}for sZ,s0 in ipairs(lr)do hm[s0]=sZ end local eR={}for s1 in pairs(cd)do eR[#eR+1]=s1 end table.sort(eR,function(hn,ho)
local hp,hq=ae.price[hn],ae.price[ho]if hp and hq and hp~=hq then return hp<hq end local hr,hs=hm[hn],hm[ho]if hr and hs then return hr<hs end
if hr then return true end if hs then return false end return hn<ho end)W.rar,W.pretty,W.members,W.rarOrder,W.n,W.at=hi,lQ,cd,eR,eO,x()
return true end local function ht()if W.at==0 or(x()-W.at)>120 then pcall(sV)end return W.n>0 end local function s2(s3)
local lV=ab(s3)return W.rar[lV]or(Q.name and ab(Q.name)==lV and Q.rar)or"?"end local function s4()local eS={}
for s5,s6 in pairs(d.Targets)do if s6 then eS[#eS+1]=ah(s5)end end table.sort(eS)return eS end local af={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function lW()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function eT(lX)if type(makefolder)~="function"then return end local s7,s8=pcall(isfolder,lX)if not(s7 and s8)then pcall(makefolder,lX)end
end local function eU(lY)if type(isfile)~="function"or type(readfile)~="function"then return nil end local s9,s_=pcall(isfile,lY)
if not(s9 and s_)then return nil end local ta,tb=pcall(readfile,lY)return ta and tb or nil end local function c3(tc,td)
if type(writefile)~="function"then return false end return(pcall(writefile,tc,td))end local function lZ(te)local c4={}
if type(listfiles)~="function"then return c4 end local tf,l0=pcall(listfiles,te)if not tf or type(l0)~="table"then return c4 end
for zQ,tg in ipairs(l0)do c4[#c4+1]=tostring(tg)end return c4 end local function l1()local eV={}for zR,th in ipairs(lZ(af.cfg))do
local l2=th:match("([^/\\]+)%.txt$")if l2 then eV[#eV+1]=l2 end end table.sort(eV)return eV end local function ti()
local V={"V|1"}V[#V+1]="N|Every|"..tostring(d.Every)V[#V+1]="N|GlazeLead|"..tostring(d.GlazeLead)V[#V+1]="N|FpsCap|"..tostring(d.FpsCap)
V[#V+1]="N|MemLimit|"..tostring(d.MemLimit)for zS,l3 in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do V[#V+1]="S|"..l3 .."|"..d[l3]end
do local eW={}for tj,c5 in pairs(d.Pets)do local l4=(c5 .b and"b"or"")..(c5 .g and"g"or"")..(c5 .w and"w"or"")..((tonumber(c5 .f)or 0)>0 and tostring(c5 .f)or"")
if l4~=""then eW[#eW+1]=tj.."|"..l4 end end table.sort(eW)V[#V+1]="P|-"for zT,tk in ipairs(eW)do V[#V+1]="P|"..tk end
end for zU,l5 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","Quests"})do
V[#V+1]="B|"..l5 .."|"..(d[l5]and"1"or"0")end local hu=J:GetAttribute("AutoRollRules")if type(hu)=="string"and hu~=""then d.ARrules,d.ARstop=hu,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then V[#V+1]="S|rules|"..d.ARrules V[#V+1]="S|stop|"..d.ARstop end if c.winPos then V[#V+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then V[#V+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for zV,hv in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local eX={}for tl,tm in pairs(hv[2])do if tm then eX[#eX+1]=tl end end table.sort(eX)V[#V+1]=hv[1].."|-"for zW,tn in ipairs(eX)do V[#V+1]=hv[1].."|"..tn end
end return table.concat(V,"\n")end local function to(hw)if type(hw)~="string"or hw==""then return false end local l6,l7,l8,l9,c6={},false,{},false,nil
for tp in hw:gmatch("[^\n]+")do local aE,ac,aw=tp:match("^(%a)|([^|]*)|?(.*)$")if aE=="N"and ac=="Every"then local hx=tonumber(aw)
if hx and hx>=1 then d.Every=math.floor(hx)end elseif aE=="N"and(ac=="FpsCap"or ac=="MemLimit")then local hy=tonumber(aw)
if hy and hy>=0 then d[ac]=math.floor(hy)end elseif aE=="N"and ac=="GlazeLead"then local eY=tonumber(aw)if eY and eY>=5 and eY<=600 then d.GlazeLead=math.floor(eY)end
elseif aE=="S"and(ac=="TeamNormal"or ac=="TeamFull"or ac=="TeamGlaze"or ac=="TeamWax")then d[ac]=aw elseif aE=="P"and ac~=""then
if not c6 then c6={}end if ac~="-"and aw~=""then c6[ac]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aE=="B"then if d[ac]~=nil then d[ac]=(aw=="1")end
elseif aE=="S"and ac=="rules"then d.ARrules=aw elseif aE=="S"and ac=="stop"then d.ARstop=aw elseif aE=="W"then
c.winPos={tonumber(ac)or 10,tonumber(aw)or 44}elseif aE=="G"then c.togPos={tonumber(ac)or 10,tonumber(aw)or 300}
elseif aE=="T"and ac~=""then if ac~="-"then l6[ac]=true end l7=true elseif aE=="K"and ac~=""then if ac~="-"then l8[ac]=true end
l9=true end end if l7 then d.Targets=l6 end if l9 then d.CrateTicks=l8 end if c6 then d.Pets=c6 end return true
end local function eZ(ce)if not lW()then return false,"this executor cannot write files"end ce=(ce or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if ce==""then return false,"give the config a name"end eT(af.dir)eT(af.cfg)if not c3(af.cfg.."/"..ce..".txt",ti())then return false,"could not write the file"end
c.config=ce return true,ce end local function l_(e0)local ma=eU(af.cfg.."/"..e0 ..".txt")if not ma then return false,"no config called "..tostring(e0)end
if not to(ma)then return false,"that config looks empty"end c.config=e0 return true,e0 end local function mb(hz)
if hz then eT(af.dir)c3(af.auto,hz)elseif type(delfile)=="function"then pcall(delfile,af.auto)else c3(af.auto,"")
end c.autoload=hz end local function tq()if c.selfPath then return c.selfPath end local e1 for zX,tr in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",af.dir})do
for zY,mc in ipairs(lZ(tr))do local hA=mc:lower()if hA:sub(-4)==".lua"and(hA:find("sab_farm",1,true)or hA:find("sab farm",1,true))then
e1=e1 or mc end end end c.selfPath=e1 return e1 end af.stub=[[
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
local function ts()if not lW()then return false,"this executor cannot write files"end eT("autoexec")if not c3(af.exec,af.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local e2=(function()local tt,tu=pcall(function()return game:GetService("TeleportService")end)return tt and tu or nil end)()
local function hB()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local tv=queueonteleport or queue_on_teleport return(pcall(tv,af.stub))end local function c7(tw)if c.rejoining then return end
c.rejoining=true y("REJOIN ("..tw..")")pcall(eA)if c.autoload then pcall(eZ,c.autoload)end local tx=hB()y(tx and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for zZ=1,30 do if not e2 then break end pcall(function()e2:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function ty()local tz,md=pcall(function()return game:GetService("GuiService")end)if tz and md then
pcall(function()T(md.ErrorMessageChanged:Connect(function()if d.Rejoin then c7("roblox error message")end end))
end)end pcall(function()local me=game:GetService("CoreGui")local mf=me and me:WaitForChild("RobloxPromptGui",15)
local mg=mf and mf:WaitForChild("promptOverlay",15)if mg then T(mg.ChildAdded:Connect(function(tA)if d.Rejoin and tostring(tA.Name):lower():find("errorprompt",1,true)then c7("disconnect prompt")end
end))end end)pcall(function()T(J.OnTeleport:Connect(function(tB)if tostring(tB):find("Started")then hB()end end))
end)if e2 then pcall(function()T(e2 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()c7("teleport retry")end)end
end))end)end end local function mh(tC)local mi=c.plot and c.plot:FindFirstChild(tC)if not mi then return nil,false end
for z0,hC in ipairs(mi:GetChildren())do if hC:IsA("Model")or hC:IsA("BasePart")then return hC,true end end return nil,true
end local function bJ()local bi=mh("RolledSquishy")if not bi then return nil end return{model=bi,name=bi.Name,pretty=cb(bi,"NameText")or ah(ab(bi.Name)),
rar=cb(bi,"RarityText")or s2(bi.Name),price=cb(bi,"PriceText")}end local function mj(hD)return type(hD)=="string"and(W.rar[ab(hD)]~=nil or r5(hD))
end local function aa()local hE=mh("SquishyEquipped")if hE then c.carrySrc,e.heldAt="model",x()return hE.Name,hE end
local mk=J.Character if mk then for z1,c8 in ipairs(mk:GetDescendants())do if(c8:IsA("Model")or c8:IsA("Tool"))and mj(c8 .Name)then
c.carrySrc,e.heldAt="character",x()return c8 .Name,c8 end end end local e3=J:GetAttribute("SquishyEquipped")if type(e3)=="string"and e3~=""and mj(e3)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return e3,nil end c.carrySrc=nil end local function z2()local z3,tD=aa()return tD end local function ml()
local mm=bJ()local hF=mm and r7(mm.price)local hG=aY()if hF and hG and hG<hF*0.5 then return hG,hF end end local function cf(tE)
cR[#cR+1]=os.date("%H:%M:%S").." "..tE if#cR>40 then table.remove(cR,1)end end local function tF(bK,e4)if type(bK)~="string"then return end
cf(("Roll(%s,%s)"):format(bK,tostring(e4)))if bK:lower():find("crate",1,true)then e.rolled,e.rolledAt=bK,x()return
end Q.seq=Q.seq+1 Q.name,Q.at=bK,x()Q.rar=type(e4)=="string"and e4 or nil c.rolls=c.rolls+1 if aQ(bK)then y(("ROLL %s [%s] = TARGET"):format(bK,tostring(e4)))end
end local function tG(bL)if type(bL)~="table"then return end local e5=bL.butter or bL.itemName if type(e5)~="string"then return end
c.gifts=c.gifts+1 Q.gift,Q.giftAt=e5,x()if type(bL.giftId)=="string"then local mn=aq:FindFirstChild("Remotes")
local mo=mn and mn:FindFirstChild("GiftThanks")if mo then pcall(function()mo:FireServer(bL.giftId)end)end end
cf("Gift("..e5 .." from "..tostring(bL.fromName)..")")y(("GIFT from %s: %s - it will not be waxed"):format(tostring(bL.fromName),e5))
end local function tH()local mp=aq:WaitForChild("Remotes",30)if not c.alive then return end if not mp then y("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local mq=J:GetAttribute("SquishyEquipped")
if type(mq)=="string"and mq~=""then e.heldAt=x()end end))local tN={SquishyRollAnimation=tF,InitSquishy=function(mr)Q.init,Q.initAt=tostring(mr),x()cf("Init("..tostring(mr)..")")end,
CrateUpdate=function(cg,ms)pcall(sE,cg)pcall(L.learn,cg)if type(cg)=="table"then local tI=ms==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not tI then return end local tJ=not e.waiting local tK=e.on e.waiting,e.data,e.at=true,cg,x()e.on=(ms==true)
e.title=tostring(cg.title or cg.name or"crate")if e.on and not tK then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then cf("CrateWindow open("..e.title..")")elseif tJ then cf("Crate waiting("..e.title..")")y(e.title.." is waiting on your stand")
end else if e.waiting then cf("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local tL=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,tL)end if e.classify then local tM=x()
task.spawn(function()pcall(e.classify,tM)end)end end end,GiftReceived=tG,}for e6,tO in pairs(tN)do local hH=mp:FindFirstChild(e6)
if hH and hH:IsA("RemoteEvent")then T(hH.OnClientEvent:Connect(tO))elseif e6~="CrateUpdate"and e6~="GiftReceived"then y("remote "..e6 .." missing")end
end end local function hI()local bM=bJ()if bM then if aQ(bM.name)then return{state="match",shown=bM.pretty,src="pad",info=bM}
end return{state="skip",info=bM,level="idle",text=("on pad: %s [%s] - not ticked"):format(bM.pretty,tostring(bM.rar))}
end if Q.name and(x()-Q.at)<4 then if aQ(Q.name)then return{state="match",shown=ah(ab(Q.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ah(ab(Q.name)),tostring(Q.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function e7(tP,tQ,tR,tS)
local e8=RaycastParams.new()e8 .FilterType=Enum.RaycastFilterType.Exclude local hJ={J.Character}for z4,tT in ipairs(tS or{})do hJ[#hJ+1]=tT end
e8 .FilterDescendantsInstances=hJ pcall(function()e8 .RespectCanCollide=true end)local mt=av:Raycast(Vector3 .new(tP,tQ+4,tR),Vector3 .new(0,-30,0),e8)
return mt and mt.Position or nil end local function c9(mu)local mv=mu:FindFirstChildOfClass("Humanoid")return((mv and mv.HipHeight)or 2)+mu.HumanoidRootPart.Size.Y/2+0.2
end local function hK(tU,tV)local hL=tU:FindFirstChildOfClass("Humanoid")local tW=x()while x()-tW<tV do if hL and(hL.FloorMaterial~=Enum.Material.Air or hL.SeatPart)then return true end
ad(0.05)end return false end local function aF(tX,hM,hN)local mw=tX.HumanoidRootPart mw.AssemblyLinearVelocity=Vector3 .new(0,0,0)
mw.CFrame=hN and CFrame.new(hM,Vector3 .new(hN.X,hM.Y,hN.Z))or CFrame.new(hM)end local function ci(a2,mx)local bN=ar()
if not bN or not a2 then return false end local bj=a2 .Position local e9=math.clamp(math.max(a2 .Size.X,a2 .Size.Z)/2+2.2,3,7)
local my=(mx and mx.MaxActivationDistance)or 10 if e9>my-2 then e9=math.max(2.5,my-2)end local c_={}local function bO(da)
da=Vector3 .new(da.X,0,da.Z)if da.Magnitude>0.05 then c_[#c_+1]=da.Unit end end local mz=le()if mz then bO(mz-bj)end
bO(a2 .CFrame.LookVector)bO(-a2 .CFrame.LookVector)bO(a2 .CFrame.RightVector)bO(-a2 .CFrame.RightVector)bO(bN.HumanoidRootPart.Position-bj)
if#c_==0 then bO(Vector3 .new(0,0,1))end local tY,e_=c9(bN),false for z5,tZ in ipairs(c_)do local fa=bj+tZ*e9
local hO=e7(fa.X,bj.Y,fa.Z,{a2})if hO and math.abs(hO.Y-bj.Y)<14 then aF(bN,Vector3 .new(fa.X,hO.Y+tY,fa.Z),bj)
if hK(bN,0.7)then e_=true break end end end if not e_ then aF(bN,bj+c_[1]*e9+Vector3 .new(0,3,0),bj)e_=hK(bN,1)
end ad(0.12)return e_ end local function mA(db)if not db.Parent or not db.Enabled then return false end pcall(function()db:InputHoldBegin()end)
ad(math.max(db.HoldDuration,0)+0.08)pcall(function()db:InputHoldEnd()end)return true end local function ak(mB,t0)
local t1=x()while x()-t1<t0 do if mB()then return true end ad(0.05)end return mB()end local function dc(cj,t2,mC,t3)
local t4=c.zapFirst and{"zap","hold"}or{"hold","zap"}for t5,hP in ipairs(t4)do if t5==2 and(t3 or not(cj.Parent and cj.Enabled and(not mC or mC())))then break end
local hQ if hP=="hold"then hQ=mA(cj)else hQ=type(fireproximityprompt)=="function"and cj.Parent~=nil and cj.Enabled and pcall(fireproximityprompt,cj)end
if hQ and ak(t2,1.2)then c.zapFirst=(hP=="zap")return true,hP end end return false end local function mD(hR)local bk=lp()
if not bk or not bk.Enabled then y("buy: nothing on the pad")return false end local mE=cU(bk)if not mE then y("buy: pad part missing")return false end
c.lastBuyAt=x()local t6,mF=Q.seq,aY()ci(mE,bk)if not bk.Enabled then y("buy aborted: pad emptied")return false end
local ck=hI()if not hR and ck.state~="match"then y("buy aborted: "..(ck.text or"pad changed"))c.matchSince=nil
return false end local hS=ck.info and ck.info.name or(ck.state=="match"and Q.name)or nil local function t7()return bk.Enabled and aa()==nil and(hR or hI().state=="match")
end local t8,t9=dc(bk,function()return aa()~=nil or((not bk.Enabled)and(hR or Q.seq==t6))end,t7,ml()~=nil)if t8 then
ak(function()return aa()~=nil end,0.8)local dd=aa()local mG=aY()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil Q.name,Q.rar,Q.at=nil,nil,x()y(("BOUGHT %s%s via %s"):format(dd and ah(ab(dd))or(ck.shown or"?"),(mF and mG)and(" for $"..aD(mF-mG))or"",t9))
if dd and hS and ab(dd)~=ab(hS)then y(("note: picked up %s, not %s"):format(dd,hS))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local mH=bJ()y(("BUY REFUSED: cash short? have $%s, price %s"):format(aD(aY()),(mH and mH.price)or"?"))
return false end local function mI()local fb=aa()if not fb then c.holding=false y("place: hands are empty")return false
end if not aQ(fb)then y(("REFUSED TO WAX %s - it is not ticked"):format(ah(ab(fb))))return false end for z6=1,d.PlaceTries do
local bl=sf()if not bl then y("place: no free station")break end local mJ=cU(bl)if mJ then ci(mJ,bl)local mK=aa()
if not mK then c.holding=false y("place: hands emptied on the way")return false end if not aQ(mK)then y("place: what I carry changed, not waxing it")return false end
if bl.Enabled then local t_,ua=dc(bl,function()return not bl.Enabled end,function()return bl.Enabled end)if t_ then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 Q.name,Q.rar,Q.at=nil,nil,x()
y(("WAXED %s #%d at %s via %s"):format(ah(ab(fb)),c.placed,bl.Parent.Parent.Name,ua))return true end end end ad(0.25)
end c.placeFails=c.placeFails+1 if aa()==nil then c.holding=false end y("PLACE FAILED ("..c.placeFails..")")if c.placeFails>=2 then
c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(aa()))y(c.capMsg)end return false end function q.place()local ub=x()while c.alive and q.editing and x()-ub<25 do ad(0.2)end
if d.Teams and d.TeamWax~=""then q.placing=true local uc=x()while c.alive and q.current()~=d.TeamWax and x()-uc<5 do ad(0.1)end
if q.current()==d.TeamWax then ad(0.3)else y("wax team did not come on in time - placing anyway")end end local ud,mL=pcall(mI)
q.placing=false if not ud then error(mL,0)end return mL end local function mM(mN)return type(mN)=="string"and mN:lower():find("crate",1,true)~=nil
end local ue={SABFarmGui=1,SABToggle=1,SABError=1}local function hT(uf)local bm=uf while bm do if ue[bm.Name]then return false end
if bm:IsA("ScreenGui")then local ug,uh=pcall(function()return bm.Enabled end)return(not ug)or uh~=false end if bm:IsA("GuiObject")and not bm.Visible then return false end
bm=bm.Parent end return false end local function fc(fd)local cl=""pcall(function()if fd:IsA("TextButton")then cl=fd.Text end end)
if not cl:find("%a")then for z7,fe in ipairs(fd:GetDescendants())do if(fe:IsA("TextLabel")or fe:IsA("TextButton"))and fe.Text:find("%a")then cl=fe.Text break end
end end if not cl:find("%a")then cl=fd.Name end return(cl:lower():gsub("[^%a]",""))end local function ui()local de,df
local mO=J:FindFirstChildOfClass("PlayerGui")if not mO then return nil,nil end for z8,dg in ipairs(mO:GetDescendants())do
if dg:IsA("GuiButton")and hT(dg)then local hU=fc(dg)if hU:sub(1,4)=="open"and not hU:find("shop",1,true)then de=de or dg end
if hU:sub(1,7)=="discard"then df=df or dg end end end if de and df then return de,df end if e.on then return de,df end
return nil,nil end local hV=(function()local uj,uk=pcall(function()return game:GetService("VirtualInputManager")end)return uj and uk or nil end)()
local function mP(a3,hW)local hX={}local function mQ(ul)hX[#hX+1]=ul end if c.tapWay then mQ(c.tapWay)end for z9,mR in ipairs({"touch","conn","signal"})do
if mR~=c.tapWay then mQ(mR)end end local function mS(um,...)local uo,hY=pcall(getconnections,um)if not(uo and type(hY)=="table"and#hY>0)then return false end
local mT,up,uq=false,{...},select("#",...)for z_,ur in ipairs(hY)do if pcall(function()ur:Fire(table.unpack(up,1,uq))end)then mT=true end
end return mT end local function mU()local mV=Vector3 .new(0,0,0)pcall(function()local mW,mX=a3 .AbsolutePosition,a3 .AbsoluteSize
mV=Vector3 .new(mW.X+mX.X/2,mW.Y+mX.Y/2,0)end)local hZ={Position=mV,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()hZ.UserInputType=Enum.UserInputType.Touch end)pcall(function()hZ.UserInputState=Enum.UserInputState.End end)
return hZ end for Aa,a4 in ipairs(hX)do local dh=false if a4=="conn"and type(getconnections)=="function"then if mS(a3 .MouseButton1Click)then
dh=true if ak(hW,1.5)then c.tapWay=a4 return true,a4 end end dh=mS(a3 .Activated,mU(),1)elseif a4=="signal"and type(firesignal)=="function"then
if pcall(firesignal,a3 .MouseButton1Click)then if ak(hW,1.5)then c.tapWay=a4 return true,a4 end end dh=pcall(firesignal,a3 .Activated,mU(),1)
elseif a4=="touch"and hV then dh=pcall(function()local mY,mZ=a3 .AbsolutePosition,a3 .AbsoluteSize local m0=0
local m1=a3:FindFirstAncestorWhichIsA("ScreenGui")local us,ut=pcall(function()return m1 and m1 .IgnoreGuiInset end)
if not(us and ut)then pcall(function()m0=game:GetService("GuiService"):GetGuiInset().Y end)end local m2,m3=mY.X+mZ.X/2,mY.Y+mZ.Y/2+m0
hV:SendMouseButtonEvent(m2,m3,0,true,game,1)task.wait(0.06)hV:SendMouseButtonEvent(m2,m3,0,false,game,1)end)end
if dh and ak(hW,1.5)then c.tapWay=a4 return true,a4 end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function h0(m4)local di=m4 .Parent while di and di~=c.plot do if e.NOT[di.Name]then return false end di=di.Parent
end local h1=(m4 .ActionText or""):lower()if h1:find("roll",1,true)or h1:find("place",1,true)or h1:find("sell",1,true)then return false end
return true end local function uu()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local m5=c.plot:FindFirstChild("CrateStand")local dj if m5 then for Ab,ff in ipairs(m5:GetDescendants())do
if ff:IsA("ProximityPrompt")and ff.Enabled and h0(ff)then dj=ff break end end end if not dj then for Ac,bn in ipairs(c.plot:GetDescendants())do
if bn:IsA("ProximityPrompt")and bn.Enabled and h0(bn)then local m6=bn:FindFirstAncestorWhichIsA("Model")local uv=((bn.ActionText or"").." "..(bn.ObjectText or"").." "..bn.Name.." "..(m6 and m6 .Name or"")):lower()
if uv:find("crate",1,true)then dj=bn break end end end end e.prompt=dj return dj end local function h2()if e.on then return true end
local dk=uu()if not dk then e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local m7=cU(dk)if m7 then ci(m7,dk)end e.ours=true dc(dk,function()return e.on end)if ak(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: pressed "..ev(dk).." but no window came up")
return false end do local function uw(m8)local cm=m8 .Parent while cm and cm:IsA("GuiObject")do local m9,m_=false,false
for Ad,dl in ipairs(cm:GetDescendants())do if dl~=m8 and dl:IsA("GuiButton")and fc(dl):sub(1,7)=="discard"then m9=true end
if dl:IsA("TextLabel")then local h3=dl.Text:lower()if h3:find("crate",1,true)or h3:find("can contain",1,true)or h3:find("cost",1,true)then m_=true end
end if m9 and m_ then return cm end end cm=cm.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local na=J:FindFirstChildOfClass("PlayerGui")if not na then return nil end for Ae,fg in ipairs(na:GetDescendants())do
if fg:IsA("GuiButton")and not fg:FindFirstAncestor("SABFarmGui")and fc(fg):sub(1,4)=="open"then local h4=uw(fg)
if h4 then e.win=h4 return h4 end end end end local function ux(uy)for Af,fh in ipairs(uy:GetDescendants())do
if fh:IsA("GuiButton")then local nb,h5=fc(fh),fh.Name:lower()if nb=="x"or nb=="close"or h5=="x"or h5:find("close",1,true)or h5:find("exit",1,true)then return fh end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(uz)task.wait(uz and 4 or 1.2)if e.on or e.waiting then return end
local fi=e.findWin()if not fi or not hT(fi)then return end local nc=ux(fi)if nc and mP(nc,function()return not hT(fi)end)then return end
y("the crate window is still open - tap its X")end end local function fj(fk)if not h2()then return false end local nd=x()-(e.openedAt or 0)
if nd<0.6 then ad(0.6-nd)end local h6=e.title local uA,uB=ui()local ne=fk and uA or uB if not ne then e.lastFail=x()
c.crateFails=c.crateFails+1 y(("crate: no %s button found in %s"):format(fk and"Open"or"Discard",h6))return false
end local uC=aa()local uD,Ag=mP(ne,function()return(not e.on)or(aa()~=nil and aa()~=uC)end)if not uD then e.lastFail=x()
c.crateFails=c.crateFails+1 y("crate: could not press "..(fk and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fk then c.crates=c.crates+1 ak(function()return aa()~=nil end,1.5)local nf=aa()
y(("OPENED %s -> %s"):format(h6,nf and ah(ab(nf))or"?"))else y("discarded "..h6 .." (nothing ticked in it)")end
return true end e.calls={}function e.saw(uE,...)local uF=select("#",...)e.calls[#e.calls+1]={t=x(),m=uE,n=uF,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(az,a5)local bo=type(az)if(bo=="string"or bo=="number")and type(a5 .data)=="table"then for ng,h7 in pairs(a5 .data)do
if h7==az and type(ng)=="string"and(type(h7)=="string"or type(h7)=="number")then return{__slot="f:"..ng}end end
end if bo=="string"then if a5 .crate and az==a5 .crate then return{__slot="crate"}end if a5 .title and az==a5 .title then return{__slot="title"}end
if a5 .rar and az==a5 .rar then return{__slot="rarity"}end return az end if bo=="number"or bo=="boolean"or bo=="nil"then return az end
if bo=="table"then local nh={}for uG,ni in pairs(az)do if type(ni)=="table"then return nil,"nested table"end local uH,nj=e.slot(ni,a5)
if nj then return nil,nj end nh[uG]=uH end return nh end local uI,uJ=pcall(function()return az:IsA("Instance")end)
if uI and uJ then if az==J then return{__slot="player"}end if c.plot and az==c.plot then return{__slot="plot"}end
local fl=c.plot and c.plot:FindFirstChild("CrateStand")if fl and az==fl then return{__slot="stand"}end if fl and az.Parent==fl then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bo..")"end function e.resolve(fm)if type(fm)~="table"then return fm end
local aJ=fm.__slot if aJ and aJ:sub(1,2)=="f:"then return e.data and e.data[aJ:sub(3)]end if aJ=="crate"then return e.data and e.data.name end
if aJ=="title"then return(e.data and e.data.title)or e.title end if aJ=="rarity"then return e.data and e.data.rarity end
if aJ=="player"then return J end if aJ=="plot"then return c.plot end if aJ=="stand"or aJ=="model"then local h8=c.plot and c.plot:FindFirstChild("CrateStand")
if aJ=="stand"or not h8 then return h8 end for Ah,nk in ipairs(h8:GetChildren())do if mM(nk.Name)then return nk end end
return nil end local nl={}for uK,uL in pairs(fm)do nl[uK]=e.resolve(uL)end return nl end function e.classify(h9)
if e.directOff then return end local fn={}for Ai,h_ in ipairs(e.calls)do if h_.t<=h9+0.05 and h9-h_.t<=6 then fn[#fn+1]=h_ end
end if#fn==0 then return end if not ak(function()return(e.heldAt or 0)>=h9-1 end,2.5)then return end local dm={}
for Aj,dn in ipairs(fn)do local nm={}for nn=1,dn.n do local uM,no=e.slot(dn.args[nn],dn)if no then y("crate call has "..no.." - keeping the button method")
return end nm[nn]=uM end dm[#dm+1]={m=dn.m,n=dn.n,args=nm}end local ia=e.learned e.learned={seq=dm,mode=ia and ia.mode or nil}
ae.dirty=true if not ia then y(("learned how to open crates directly (%d call%s)"):format(#dm,#dm==1 and""or"s"))end
end function e.replay()local np=e.learned local nq=aq:FindFirstChild("Remotes")local ib=nq and nq:FindFirstChild("CrateAction")
if not(np and ib)then return false end local nr=table.unpack or unpack e.replaying=true for Ak,dp in ipairs(np.seq)do
local ic={}for ns=1,dp.n do ic[ns]=e.resolve(dp.args[ns])end task.spawn(function()pcall(function()if dp.m=="InvokeServer"then ib:InvokeServer(nr(ic,1,dp.n))
else ib:FireServer(nr(ic,1,dp.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(uN)return(uN:gsub("[%%|;=,\n]",function(uO)return("%%%02X"):format(uO:byte())end))end
function e.enc(bP)local fo=type(bP)if fo=="string"then return"s"..e.esc(bP)end if fo=="number"then return"n"..tostring(bP)end
if fo=="boolean"then return bP and"b1"or"b0"end if fo=="nil"then return"z"end if bP.__slot then return"k"..bP.__slot end
local ie={}for uP,uQ in pairs(bP)do ie[#ie+1]=e.enc(uP).."="..e.enc(uQ)end return"t"..table.concat(ie,",")end
function e.dec(nt)local dq,dr=nt:sub(1,1),nt:sub(2)local function uR(uS)return(uS:gsub("%%(%x%x)",function(uT)return string.char(tonumber(uT,16))end))end
if dq=="s"then return uR(dr)end if dq=="n"then return tonumber(dr)end if dq=="b"then return dr=="1"end if dq=="k"then return{__slot=dr}end
if dq=="t"then local nu={}for uU in dr:gmatch("[^,]+")do local nv,uV=uU:match("^(.-)=(.*)$")if nv then local nw=e.dec(nv)
if nw~=nil then nu[nw]=e.dec(uV)end end end return nu end return nil end function e.goneOrNew(uW)return function()
if not e.waiting then return true end local nx=aa()return nx~=nil and nx~=uW end end function e.near()local ny=aq:FindFirstChild("Remotes")
local nz=ny and ny:FindFirstChild("CrateAction")local ig=ar()local ih=c.plot and c.plot:FindFirstChild("CrateStand")
local ii=ih and ih:FindFirstChild("Spot")if not(nz and ig and ii)then return false,"no crate stand or remote"end
local ij=ig.HumanoidRootPart local fp=ij.CFrame local nA,ik=e.title,"no answer"local uX=aa()local nB=ih:FindFirstChild("Holder")
local function nC()if not nB then return e.waiting or e.on end for Al,uY in ipairs(nB:GetChildren())do if uY:IsA("Model")then return true end end
return false end for uZ=1,3 do if not(e.waiting or e.on)or not nC()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(ij.Position-ii.Position).Magnitude>8 then ci(ii,e.prompt)end ad(0.12+0.15*uZ)
local aS={}e.replaying=true task.spawn(function()aS.ok,aS.v=pcall(function()return nz:InvokeServer("open")end)
aS.done=true end)ak(function()return aS.done end,6)e.replaying=false local bQ=aS.v if aS.done and aS.ok and type(bQ)=="table"and bQ.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 y(("OPENED %s -> %s (no window)"):format(nA,bQ.prize and ah(ab(tostring(bQ.prize)))or"?"))
ak(function()local nD=aa()return nD~=nil and nD~=uX end,1.5)if(ij.Position-fp.Position).Magnitude>8 then pcall(function()aF(ig,fp.Position,fp.Position+fp.LookVector)end)end
return true,"opened"end ik=(aS.done and aS.ok and type(bQ)=="table")and tostring(bQ.reason or"refused, no reason given")
or(aS.done and("error: "..tostring(bQ))or"no answer in 6s")ad(0.3)if not nC()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 y(("crate: the server would not open %s next to the stand (%s)"):format(nA,ik))
return false,ik end function e.smart()local il=e.title if(e.nearFails or 0)<3 then local u0=e.near()if u0 then return true end
if e.nearFails>=3 then y("opening next to the stand failed 3 times - trying the older ways")end end local bR=e.learned
if bR then local im=aa()if e.on then e.replay()if ak(e.goneOrNew(im),3.5)then c.crates=c.crates+1 y("OPENED "..il.." (direct)")
return true end else if bR.mode~="window"then e.replay()if ak(e.goneOrNew(im),3.5)then c.crates,e.fails=c.crates+1,0
if bR.mode~="direct"then bR.mode,ae.dirty="direct",true y("crates now open directly - the window never comes up")
end y("OPENED "..il.." (direct, no window)")return true end end if h2()then e.replay()if ak(e.goneOrNew(im),3.5)then
c.crates,e.fails=c.crates+1,0 if bR.mode~="window"then bR.mode,ae.dirty="window",true y("crates need their window up first - it shows briefly")
end y("OPENED "..il.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ae.dirty=bR,nil,true
if e.fails>=3 then e.directOff=true y("direct crate opening failed 3 times - using the button for now")else y("the learned crate call did not work - back to pressing Open")
end end return fj(true)end function A.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end A.cache={}function A.watchCache()A.cache=A.snap()
for u1,nE in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(nE):Connect(function()A.cache[u1]=J:GetAttribute(nE)end))
end end function A.isOn()return J:GetAttribute("AutoRollOn")==true end function A.saw(u2,...)local fq=A.cache
local u3={m=u2,n=select("#",...),args={...},before={rules=fq.rules,stop=fq.stop,on=fq.on,main=fq.main}}task.delay(1.5,function()
if c.alive then pcall(A.learnOne,u3)end end)end function A.learnOne(ds)local as,dt=A.snap(),ds.before local fr=(as.rules~=dt.rules)or(as.stop~=dt.stop)
local nF=(as.on~=dt.on)or(as.main~=dt.main)if not fr and not nF then return end local nG={}for nH=1,ds.n do local aG=ds.args[nH]
local bS=type(aG)if bS=="string"and aG~=""and aG==as.rules then aG={__slot="rules"}elseif bS=="string"and aG~=""and fr and aG==as.stop and as.stop~=dt.stop then aG={__slot="stop"}
elseif bS=="table"then local nI={}for u4,cn in pairs(aG)do if type(cn)=="table"or(type(cn)=="userdata")then A.msg="Auto Roll sends something I cannot repeat"return
end nI[u4]=(type(cn)=="string"and cn~=""and cn==as.rules)and{__slot="rules"}or cn end aG=nI elseif bS~="string"and bS~="number"and bS~="boolean"and bS~="nil"then
if aG==J then aG={__slot="player"}else A.msg="Auto Roll sends something I cannot repeat"return end end nG[nH]=aG
end local co={m=ds.m,n=ds.n,args=nG}if fr then local io=false for u5=1,co.n do local du=co.args[u5]if type(du)=="table"and du.__slot=="rules"then io=true end
if type(du)=="table"and not du.__slot then for Am,nJ in pairs(du)do if type(nJ)=="table"and nJ.__slot=="rules"then io=true end end
end end if io then A.rec.rules={co}else table.insert(A.rec.rules,co)if#A.rec.rules>60 then table.remove(A.rec.rules,1)end
end end if nF then if as.on==true then A.rec.on=co else A.rec.off=co end d.AutoRoll=(as.on==true)end if as.rules and as.rules~=""then d.ARrules,d.ARstop=as.rules,as.stop or""end
ae.dirty=true A.msg=""y(("learned an Auto Roll %s message"):format(fr and"choices"or(as.on and"on"or"off")))end
function A.resolve(cp)if type(cp)~="table"then return cp end if cp.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cp.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cp.__slot=="player"then return J end
local nK={}for u6,u7 in pairs(cp)do nK[u6]=A.resolve(u7)end return nK end function A.replay(nL,u8)local nM=table.unpack or unpack
for An,dv in ipairs(u8)do local ip={}for nN=1,dv.n do ip[nN]=A.resolve(dv.args[nN])end A.replaying=true pcall(function()
if dv.m=="InvokeServer"then task.spawn(function()pcall(function()nL:InvokeServer(nM(ip,1,dv.n))end)end)else nL:FireServer(nM(ip,1,dv.n))end
end)A.replaying=false task.wait(0.25)end end function A.apply(nO,u9)if A.busy or not c.alive then return end A.busy=true
pcall(function()local nP=aq:FindFirstChild("Remotes")local iq=nP and nP:FindFirstChild("AutoRollAction")if not iq then A.msg="this game has no AutoRollAction"return end
local bp=d.AutoRoll if bp and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#A.rec.rules==0 then
A.msg="pick your Auto Roll choices once in the game's menu so I can learn them"y(A.msg)else A.replay(iq,A.rec.rules)
if ak(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then y("Auto Roll choices put back")else
A.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"y(A.msg)end end end if bp==A.isOn()or(not bp and not u9)then return end
local fs=bp and A.rec.on or A.rec.off if not fs then local dw=bp and A.rec.off or A.rec.on local nQ=dw~=nil for u_=1,dw and dw.n or 0 do
if type(dw.args[u_])=="boolean"then nQ=false end end if nQ then fs=dw end end if not fs then A.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bp and"on"or"off")
y(A.msg)return end A.replay(iq,{fs})if ak(function()return A.isOn()==bp end,4)then A.msg=""y(("Auto Roll switched %s%s"):format(bp and"ON"or"OFF",nO and(" ("..nO..")")or""))
else A.msg="Auto Roll did not switch - do it once in the game so I can relearn it"y(A.msg)end end)A.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local va,vb=pcall(function()return J.UserId end)return va and vb or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local vc,ir=pcall(function()return require(aq:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if vc and type(ir)=="table"and type(ir.Pets)=="table"then j.I=ir end return j.I end function j.order()if j.list then return j.list end
local bq=j.info()if not bq then return{}end local bT={}if type(bq.Order)=="table"and#bq.Order>0 then for Ao,nR in ipairs(bq.Order)do if bq.Pets[nR]then bT[#bT+1]=nR end end
else for vd in pairs(bq.Pets)do bT[#bT+1]=vd end table.sort(bT,function(ve,vf)return(bq.Pets[ve].price or 0)<(bq.Pets[vf].price or 0)end)
end j.list=bT return bT end function j.nice(nS,is)local nT=j.info()local nU=nT and nT.Pets[nS]return((is and is~="")and(is.." ")or"")..(nU and nU.displayName or tostring(nS))
end function j.data()local ft=J:GetAttribute("PetsData")if type(ft)~="string"then return nil end if ft==j.rawD then return j.lastD end
local vg,dx=pcall(function()return j.HS:JSONDecode(ft)end)dx=(vg and type(dx)=="table")and dx or nil j.rawD,j.lastD=ft,dx
return dx end function j.pen()return aq:FindFirstChild("PetMeadowSpawns")end function j.srv()return av:GetServerTimeNow()end
function j.money()local it=J:FindFirstChild("MoneyValue")if it and type(it.Value)=="number"then return it.Value end
return aY()or 0 end function j.wishes()local nV=j.pen()local nW=nV and nV:GetAttribute("Wishes")local iu,nX={},j.srv()
if type(nW)~="string"then return iu end local vh,nY=pcall(function()return j.HS:JSONDecode(nW)end)if vh and type(nY)=="table"then
for vi,iv in pairs(nY)do if type(iv)=="number"and iv>nX then iu[vi]=iv-nX end end end return iu end function j.call(...)
local nZ=aq:FindFirstChild("Remotes")local n0=nZ and nZ:FindFirstChild("PetRequest")if not n0 then return nil end
local n1=table.pack(...)local bU={}task.spawn(function()bU.ok,bU.v=pcall(function()return n0:InvokeServer(table.unpack(n1,1,n1 .n))end)
bU.done=true end)local vj=x()while not bU.done and x()-vj<6 do task.wait(0.05)end if bU.done and bU.ok then return bU.v end
return nil end function j.want(vk)return d.Pets[vk]end function j.closeNaming(iw)local n3=pcall(function()local n2=J:FindFirstChild("PlayerScripts")
local vl=n2 and n2:FindFirstChild("Naming",true)require(vl).close()end)ad(0.5)if iw.Visible then pcall(function()local n4=iw:FindFirstChild("NameBox",true)if n4 then n4:ReleaseFocus()end end)
iw.Visible=false n3=false end return n3 end function j.skipNaming()j.namingUntil=x()+10 if j.namingOn then return end
j.namingOn=true task.spawn(function()while c.alive and x()<j.namingUntil do local n5=J:FindFirstChildOfClass("PlayerGui")
local n6=n5 and n5:FindFirstChild("MainGui")local fu=n6 and n6:FindFirstChild("PetNameGui")if fu and fu.Visible then
ad(0.4)if fu.Visible then j.namingShut=(j.namingShut or 0)+1 pcall(j.closeNaming,fu)break end end ad(0.25)end
j.namingOn=false end)end function j.buyTick()if not d.PetBuy then j.buyMsg="auto adopt is off"return end local ix,n7,fv=j.info(),j.pen(),j.data()
if not(ix and n7 and fv)then j.buyMsg="pet data not loaded yet"return end j.tryAt=j.tryAt or{}local dy,iy=#(fv.pets or{}),tonumber(fv.maxOwned)or 60
local vm,n8,dz=j.srv(),{},nil for Ap,aK in ipairs(n7:GetChildren())do n8[aK.Name]=true local bV,fw=aK:GetAttribute("Pet"),aK:GetAttribute("Variant")or""
local iz=bV and j.want(bV)if iz and iz.b and ix.Pets[bV]and(not iz.g or fw=="Big")and z.wantMore(bV,fw,fv)and not aK:GetAttribute("A_"..j.uid)
and(tonumber(aK:GetAttribute("ExpiresAt"))or 0)>vm+1 and x()>=(j.tryAt[aK.Name]or 0)then local dA,n9=j.nice(bV,fw),ix.Pets[bV].price or 0
if dy>=iy then dz=("%s is in the pen, but you have %d/%d pets"):format(dA,dy,iy)j.tryAt[aK.Name]=x()+15 elseif j.money()<n9 then
dz=("%s is in the pen - need $%s"):format(dA,aD(n9))j.tryAt[aK.Name]=x()+5 else j.tryAt[aK.Name]=x()+8 local br=j.call("adopt",aK.Name)
if type(br)=="table"and br.ok then dy=dy+1 j.buys=(j.buys or 0)+1 j.recent=j.recent or{}local vn=type(br.pet)=="table"and br.pet or{}
table.insert(j.recent,{id=tostring(vn.id or("?"..x())),name=bV,variant=fw,at=x()})if#j.recent>30 then table.remove(j.recent,1)end
y("ADOPTED "..dA)j.skipNaming()dz="adopted "..dA else local n_=type(br)=="table"and tostring(br.reason or"no reason given")or"no answer"
y(("adopt %s failed: %s"):format(dA,n_))dz="adopt failed: "..n_ if type(br)=="table"and br.bagFull then j.tryAt[aK.Name]=x()+60 end
end end end end for oa in pairs(j.tryAt)do if not n8[oa]then j.tryAt[oa]=nil end end j.buyMsg=dz or("watching the pen (%d/%d pets)"):format(dy,iy)
end function j.wishTick()if not d.PetWish then j.wishMsg="auto wish is off"return end local fy=j.info()if not(fy and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local fz,iA,bs=j.wishes(),0,nil local vo=(type(fy.Wish)=="table"and fy.Wish.cashShare)or 2
local vp=j.data()for Aq,ax in ipairs(j.order())do local ob=j.want(ax)if ob and ob.w and z.wantMore(ax,"",vp)then
iA=iA+1 if not fz[ax]and x()>=(j.wishTry[ax]or 0)then local iB=tonumber(J:GetAttribute("PetWishCredits"))or 0
local iC=math.floor((fy.Pets[ax].price or 0)*vo)if iB<=0 and j.money()<iC then j.wishTry[ax]=x()+10 bs=("need $%s to wish for %s"):format(aD(iC),j.nice(ax))
j.wishWhy[ax]=bs else j.wishTry[ax]=x()+3 local vq=iB>0 and"wishCredit"or"wish"local fA=j.call(vq,ax)if type(fA)=="table"and fA.ok then
j.wishN,j.wishWhy[ax]=j.wishN+1,nil y(("WISHED for %s (%s)"):format(j.nice(ax),iB>0 and"free wish"or("$"..aD(iC))))
else local iD=type(fA)=="table"and tostring(fA.reason or"no reason given")or"no answer"if iD:lower():find("already",1,true)then j.wishTry[ax]=x()+2
else y(("wish %s failed: %s"):format(j.nice(ax),iD))bs="wish failed: "..iD end end end end end end if not bs then
for Ar,fB in ipairs(j.order())do local oc=j.want(fB)if oc and oc.w and not fz[fB]and j.wishWhy[fB]then bs=j.wishWhy[fB]break end
end end if not bs then local fC={}for As,fD in ipairs(j.order())do local od=j.want(fD)if od and od.w and fz[fD]then fC[#fC+1]=("%s %dm"):format(j.nice(fD),math.ceil(fz[fD]/60))end
end bs=iA==0 and"no pet has WISH ticked"or("running: "..(#fC>0 and table.concat(fC,", ")or"none yet"))end j.wishMsg=bs
end q.switches,q.glazed,q.finished=0,0,0 q.done,q.doneN,q.later={},0,{}function q.teams()local iE=j.data()return(iE and iE.teams)or{},iE
end function q.current(cq)cq=cq or j.data()if not cq then return""end local oe={}for At,vr in ipairs(cq.equipped or{})do oe[tostring(vr)]=true end
for Au,of in ipairs(cq.teams or{})do local og=of.pets or{}local iF=#og==#(cq.equipped or{})if iF then for Av,vs in ipairs(og)do if not oe[tostring(vs)]then iF=false break end end end
if iF then return of.name end end return""end function q.equip(iG)local vt,vu=q.teams()local iH for vv,vw in ipairs(vt)do if vw.name==iG then iH=vv break end end
if not iH then q.msg="no saved team called "..tostring(iG)return false end if q.current(vu)==iG then return true end
for Aw=1,4 do local oh=j.call("teamEquip",iH)if type(oh)=="table"and oh.ok then q.switches=q.switches+1 return true
end task.wait(0.4)end return false end function q.left(vx)local oi=vx:FindFirstChild("SquishyPlaceHolder")local oj=oi and oi:FindFirstChild("TimerGui")
local ol=oj and oj:FindFirstChildWhichIsA("TextLabel",true)local iI=ol and ol.Text if type(iI)~="string"or iI:find("-",1,true)then return nil end
local iJ,om,oo=iI:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not iJ then return nil end local op=oo~=""and(tonumber(iJ)*3600+tonumber(om)*60+tonumber(oo))or(tonumber(iJ)*60+tonumber(om))
return op>0 and op or nil end function q.waxes()local dB={}local oq=c.plot and c.plot:FindFirstChild("WaxStations")
if not oq then return dB end local ot=j.srv()for Ax,aT in ipairs(oq:GetChildren())do local iK=tonumber(aT:GetAttribute("PourEnd"))
local ou=aT:GetAttribute("PourOwner")if aT:GetAttribute("HasSquishy")and aT:GetAttribute("PourId")and(ou==nil or ou==j.uid)then
local iL=q.left(aT)local ov=iL and(ot+iL)or((iK and iK>ot)and iK or nil)if ov then local ow,ox=aT:FindFirstChild("SquishyPlaceHolder"),"?"
if ow then for Ay,oy in ipairs(ow:GetChildren())do if oy:IsA("Model")then ox=oy.Name break end end end local vy=tostring(aT:GetAttribute("Helpers")or"")
local iM=0 for Az in vy:gmatch("%d+")do iM=iM+1 end dB[#dB+1]={st=aT,ends=ov,sure=iL~=nil,id=aT:GetAttribute("PourId"),name=ox,helps=iM,
long=aT:GetAttribute("PourLong")==true}end end end table.sort(dB,function(vz,vA)return vz.ends<vA.ends end)return dB
end function q.glazeCount()local oz=aq:FindFirstChild("Remotes")local oA=oz and oz:FindFirstChild("EditStack")
if not oA then return nil end local vB,dC=pcall(function()return oA:InvokeServer("State",nil)end)if not(vB and type(dC)=="table"and type(dC.state)=="table")then return nil end
local iN,iO=0,{}for AA,fE in ipairs(dC.state.entries or{})do if fE.glaze and fE.glaze~=""then iN=iN+1 iO[fE.glaze]=(iO[fE.glaze]or 0)+1 end
end return iN,iO,#(dC.state.entries or{}),dC.state.capacity end function q.finishedOne(fF,oB)q.finished=q.finished+1
task.wait(2)local iP,vC,oC,vD=q.glazeCount()if iP and oB and iP>oB then q.glazed=q.glazed+1 local iQ={}for vE,vF in pairs(vC)do iQ[#iQ+1]=vE.." "..vF end
y(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ah(ab(fF.name)),fF.st.Name,iP,table.concat(iQ,", ")))
else y(("wax done on station %s: %s, no glaze%s"):format(fF.st.Name,ah(ab(fF.name)),oC and(" (stack "..oC.."/"..tostring(vD)..")")or""))
end end function q.tick()q.list=q.waxes()if q.editing and x()-(q.editingSince or x())>120 then q.editing=false end
if q.editing then q.msg="rebuilding teams..."return end if not d.Teams then q.want,q.msg="","auto teams is off"return end
local cr=j.srv()local aA=q.glazeFor if aA then local dD=aA.st local oD=dD.Parent and dD:GetAttribute("HasSquishy")and dD:GetAttribute("PourId")==aA.id
local oE=oD and q.left(dD)if oE then aA.ends=cr+oE end if not oD then q.glazeFor,q.afterUntil=nil,x()+1.5 if not q.done[aA.id or"?"]then
q.done[aA.id or"?"],q.doneN=true,q.doneN+1 if q.doneN>400 then q.done,q.doneN={[aA.id or"?"]=true},1 end local vG=aA.before
task.spawn(function()pcall(q.finishedOne,aA,vG)end)end elseif aA.ends-cr>d.GlazeLead*3+60 or cr>aA.ends+90 then
q.glazeFor,q.afterUntil=nil,x()+1.5 q.later[aA.id or"?"]=x()+120 y(("station %s is not finishing yet (%s left) - glaze team off again"):format(dD.Name,q.clock(aA.ends-cr)))
end end if d.TeamGlaze~=""and not q.glazeFor then local vH=q.speedRatio(d.TeamGlaze)for AB,bW in ipairs(q.list)do
if bW.sure and(bW.ends-cr)*vH[bW.long and 2 or 1]<=d.GlazeLead and x()>=(q.later[bW.id or"?"]or 0)and not q.done[bW.id or"?"]then
q.glazeFor=bW task.spawn(function()bW.before=q.glazeCount()end)break end end end local aH,fG="",""if d.TeamGlaze~=""and(q.glazeFor or x()<(q.afterUntil or 0))then
aH,fG=d.TeamGlaze,q.glazeFor and(" - station "..q.glazeFor.st.Name.." finishes soon")or""elseif d.TeamWax~=""and(q.placing or q.aboutToPlace())then
aH,fG=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and q.allBusy()then aH,fG=d.TeamFull," - every station is busy"
else aH=d.TeamNormal end q.want=aH local dE=q.current()q.cur=dE if aH~=""and dE~=aH and x()>=(q.nextTry or 0)then
q.nextTry=x()+1.1 if q.equip(aH)then y("team: "..aH..fG)else q.nextTry=x()+3 end end local iR=q.list[1]q.msg=("on: %s%s | next wax done %s"):format(dE~=""and dE or"(not a saved team)",(aH~=""and aH~=dE)and(" -> "..aH)or"",
iR and("in "..q.clock(iR.ends-cr).." (st "..iR.st.Name..")")or"- none running")end function q.clock(bt)bt=math.max(0,math.floor(bt))
if bt>=3600 then return("%d:%02d:%02d"):format(math.floor(bt/3600),math.floor((bt%3600)/60),bt%60)end return("%d:%02d"):format(math.floor(bt/60),bt%60)
end function q.allBusy()local vI,vJ=ex()return vJ>0 and vI==0 end function q.aboutToPlace()if not c.running then return false end
local oF=aa()if not(oF and aQ(oF))then return false end local vK=ex()return vK>0 end function q.mult(oG,vL,oH)return{(1+oG)*(1+oH),(1+oG+vL)*(1+oH)}end
function q.speedNow()local function iS(vM)return tonumber(J:GetAttribute(vM))or 0 end return q.mult(iS("PetWaxSpeed"),iS("PetLongWax"),iS("PetSocialWax"))
end function q.speedOf(vN)local vO,oI=q.teams()if not oI then return nil end for AC,oJ in ipairs(vO)do if oJ.name==vN then
local iT={}for AD,vP in ipairs(oJ.pets or{})do for AE,oK in ipairs(oI.pets or{})do if tostring(oK.id)==tostring(vP)then iT[#iT+1]=oK break end end
end local oL=z.caps()local oM,vQ=z.stats(iT)return q.mult(math.min(oM.waxSpeed or 0,oL.waxSpeed or 0.25),math.min(oM.longWax or 0,oL.longWax or 0.3),vQ.socialWax or 0)
end end return nil end function q.speedRatio(vR)local oN,iU=q.speedNow(),q.speedOf(vR)if not iU then return{1,1}end
return{oN[1]/iU[1],oN[2]/iU[2]}end function q.glazeSoon()return d.Teams and d.TeamGlaze~=""and(q.glazeFor~=nil or x()<(q.afterUntil or 0))
end z.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
z.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}z.buildMsg,z.fuseMsg,z.fused,z.builds="","",0,0
function z.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function z.caps()local iV=j.info()return(iV and type(iV.Caps)=="table")and iV.Caps or z.CAPS
end function z.value(oO,iW)local fH=j.info()local cs=fH and fH.Pets[oO]if not(cs and type(cs.boost)=="table")then return nil end
local bX if type(fH.boostValue)=="function"then local vS,vT=pcall(fH.boostValue,oO,(iW~=""and iW)or nil)bX=vS and tonumber(vT)or nil
end if not bX then bX=cs.boost.value or 0 if iW=="Big"then local oP=bX*1.5 bX=z.ROUND[cs.boost.kind]and math.max(bX+1,math.floor(oP+0.5))or oP
end end return cs.boost.kind,bX,cs.boost.every end function z.stats(vU)local bY,iX={},{}for AF,oQ in ipairs(vU)do
local aL,fI,oR=z.value(oQ.name,oQ.variant or"")if aL then if aL:sub(1,6)=="social"then iX[aL]=math.max(iX[aL]or 0,fI)
elseif aL=="waxStir"or aL=="cashGift"then bY[aL]=(bY[aL]or 0)+fI*60/(oR or 60)elseif aL=="luckyPull"then bY.luckyPull=(bY.luckyPull or 0)+fI/(oR or 10)
else bY[aL]=(bY[aL]or 0)+fI end end end return bY,iX end function z.glazeGain(vV,fJ)local dF,iY,AG={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local vW=dF[1]+dF[2]+dF[3]local vX=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local ct={}for fK=1,3 do ct[fK]=dF[fK]+vV*dF[fK]/vW+(fK==1 and vX or 0)end
local iZ={ct[1]*(1-fJ),ct[2]*(1-fJ)+ct[1]*fJ,ct[3]+ct[2]*fJ}return iZ[1]*(iY[1]-1)+iZ[2]*(iY[2]-1)+iZ[3]*(iY[3]-1)
end function z.score(fL,vY)local i0=z.caps()local fM,fN=z.stats(vY)local function bu(oS)return math.min(fM[oS]or 0,i0[oS]or math.huge)end
local vZ=(1+bu("income"))*(1+(fN.socialIncome or 0))*(1+math.min(fM.cashGift or 0,i0 .cashGiftPerMinute or 9)/60)
local v0=1+bu("luck")+(fM.luckyPull or 0)+(fN.socialLuck or 0)local oT=v0*(1+bu("newFind"))local dG=math.log(vZ)
local v1=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local i1=(1+bu("waxSpeed")+bu("longWax"))*(1+(fN.socialWax or 0))
+math.min(fM.waxStir or 0,i0 .waxStirPerMinute or 30)/60/v1 local v2=1-(1-bu("headStart"))*(1-(fN.socialHeadStart or 0))
if fL=="farm"then return dG+0.7*math.log(oT)+0.1*math.log(i1)end if fL=="full"then return dG+0.4*math.log(i1)+0.02*math.log(oT)end
if fL=="glaze"then return z.glazeGain(bu("glaze"),bu("glazeUp"))+0.001*dG end if fL=="wax"then return-math.log(1-0.5*v2)+0.001*dG+0.001*math.log(i1)end
return dG end function z.best(oU,cu,v3,i2)i2=i2 or{}local au,dH={},{}local function oV(v4)local oW={}for v5,v6 in ipairs(v4)do oW[v5]=cu[v6]end return oW end
local function i3(oX)local i4=z.score(oU,oV(oX))for AH,v7 in ipairs(oX)do if i2[cu[v7].id]then i4=i4+1e-7 end end
return i4 end for AI=1,math.min(v3,#cu)do local fO,i5 for i6=1,#cu do if not dH[i6]then au[#au+1]=i6 local oY=i3(au)
au[#au]=nil if not i5 or oY>i5+1e-12 then fO,i5=i6,oY end end end if not fO then break end dH[fO]=true au[#au+1]=fO
end for AJ=1,6 do task.wait()local oZ,o0=false,i3(au)for i7=1,#au do for i8=1,#cu do if not dH[i8]then local o1=au[i7]
au[i7]=i8 local o2=i3(au)if o2>o0+1e-9 then dH[o1],dH[i8],o0,oZ=nil,true,o2,true else au[i7]=o1 end end end end
if not oZ then break end end local o3={}for v8,v9 in ipairs(au)do o3[v8]=tostring(cu[v9].id)end return o3,z.score(oU,oV(au))
end function z.count(o4,o5,v_)local dI,dJ={},0 local o6,o7={},{}for AK,wa in ipairs(o5 .arriving or{})do o6[tostring(wa)]=true end
for AL,cv in ipairs(o5 .pets or{})do o7[tostring(cv.id)]=true if cv.name==o4 and not o6[tostring(cv.id)]then if cv.variant=="Big"then dJ=dJ+1 elseif(cv.variant or"")==""then dI[#dI+1]=cv end
end end if not v_ then for AM,dK in ipairs(j.recent or{})do if dK.name==o4 and not o7[dK.id]and x()-dK.at<20 then
if dK.variant=="Big"then dJ=dJ+1 else dI[#dI+1]=dK end end end end return dI,dJ end function z.goal(wb)local o8=d.Pets[wb]return o8 and tonumber(o8 .f)or 0 end
function z.wantMore(o9,wc,o_)local i9=z.goal(o9)if i9<=0 or not o_ then return true end local wd,pa=z.count(o9,o_)
if pa>=i9 then return false end if wc=="Big"then return true end return#wd<z.need()*(i9-pa)end function z.status(pb,pc)
local fP=z.goal(pb)if fP<=0 or not pc then return nil end local we,i_=z.count(pb,pc)if i_>=fP then return("Big %d/%d done"):format(i_,fP)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#we,z.need()),z.need(),i_,fP)end function z.wear(ja)local jb={}
for AN,wf in ipairs(ja)do jb[tostring(wf)]=true end for AO=1,3 do local cw=j.data()if not cw then return false end
for AP,pd in ipairs(cw.equipped or{})do if not jb[tostring(pd)]then j.call("unequip",pd)task.wait(0.3)end end
cw=j.data()local pe={}for AQ,wg in ipairs(cw.equipped or{})do pe[tostring(wg)]=true end for AS,pf in ipairs(ja)do
if not pe[tostring(pf)]then j.call("equip",pf)task.wait(0.3)end end task.wait(0.4)cw=j.data()local jc,pg=0,true
for AT,wh in ipairs(cw.equipped or{})do jc=jc+1 if not jb[tostring(wh)]then pg=false end end if pg and jc==#ja then return true end
end return false end function z.saveTeam(ph,pj)if not z.wear(pj)then return false,"could not put the pets on"end
local wi=q.teams()local bZ for wj,wk in ipairs(wi)do if wk.name==ph then bZ=wj break end end local cx if bZ then
cx=j.call("teamSave",bZ)else cx=j.call("teamNew")if type(cx)=="table"and cx.ok and cx.index then bZ=cx.index task.wait(0.3)
j.call("teamRename",{index=bZ,name=ph})end end task.wait(0.4)local jd=j.data()local pk=jd and jd.teams and bZ and jd.teams[bZ]
if not pk then return false,"the game did not save it"end local pl={}for AU,wl in ipairs(pk.pets or{})do pl[tostring(wl)]=true end
for AV,wm in ipairs(pj)do if not pl[tostring(wm)]then return false,"saved, but not with these pets"end end return true
end z.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function z.quiet()
if q.placing or q.glazeSoon()then return false end local wn=j.srv()for AW,wo in ipairs(q.list or{})do if wo.ends-wn<(d.GlazeLead or 45)+90 then return false end end
return true end function z.plan()local dL=j.data()if not dL then return{}end local pm={}for AX,wp in ipairs(dL.arriving or{})do pm[tostring(wp)]=true end
local dM={}for AY,fQ in ipairs(dL.pets or{})do if not pm[tostring(fQ.id)]then dM[#dM+1]={id=tostring(fQ.id),name=fQ.name,variant=fQ.variant or""}end
end local pn={}for AZ,po in ipairs(dM)do pn[po.id]=po end local pp=tonumber(dL.slots)or 3 local je,pq={},{}for A0,fR in ipairs(z.ROLES)do
local dN=d[fR[1]]if dN~=""and not pq[dN]then pq[dN]=true local jf,dO,pr={},{},false for A1,ps in ipairs(dL.teams or{})do
if ps.name==dN then for A2,wq in ipairs(ps.pets or{})do local jg=pn[tostring(wq)]if jg then jf[jg.id]=true dO[#dO+1]=jg else pr=true end
end end end local jh,pt=z.best(fR[2],dM,pp,jf)local pu=z.score(fR[2],dO)local pv=#jh==#dO for A3,wr in ipairs(jh)do if not jf[wr]then pv=false end end
if not pv and(pr or#dO<math.min(pp,#dM)or pt>pu+1e-4)then je[#je+1]={team=dN,role=fR[2],ids=jh,gain=pt-pu}end
end end return je end function z.rebuild(ws)local pw=z.plan()if#pw==0 then z.buildMsg="teams are already the best your pets allow"return true end
if not z.quiet()then z.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end q.editing,q.editingSince=true,x()
local fS=true local ww,wx=pcall(function()for A4,dP in ipairs(pw)do local wt,wu=z.saveTeam(dP.team,dP.ids)local px=j.data()
local ji={}for A5,wv in ipairs(dP.ids)do for A6,jj in ipairs(px and px.pets or{})do if tostring(jj.id)==wv then ji[#ji+1]=j.nice(jj.name,jj.variant)end
end end if wt then y(("TEAM %s rebuilt (%s): %s"):format(dP.team,ws or"pets changed",table.concat(ji,", ")))else fS=false y(("TEAM %s: %s"):format(dP.team,tostring(wu)))end
end end)q.editing,q.nextTry=false,0 if not ww then fS=false y("TEAM BUILD ERR "..tostring(wx))end z.builds=z.builds+1
z.buildMsg=fS and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fS end
function z.fuseTick()if not d.AutoFuse or q.editing then return end local fT=j.data()if not fT then return end
local jk=z.need()local jl,fU={},{}for A7,wy in ipairs(fT.teams or{})do for A8,wz in ipairs(wy.pets or{})do jl[tostring(wz)]=true end end
for A9,wA in ipairs(fT.equipped or{})do fU[tostring(wA)]=true end z.failUntil=z.failUntil or{}for b0,wB in pairs(d.Pets)do
local py=tonumber(wB.f)or 0 local jm,wC=z.count(b0,fT,true)if py>0 and wC<py and#jm>=jk and x()>=(z.failUntil[b0]or 0)then
table.sort(jm,function(fV,fW)local pz=(fU[tostring(fV.id)]and 4 or 0)+(jl[tostring(fV.id)]and 2 or 0)+(fV.named and 1 or 0)
local pA=(fU[tostring(fW.id)]and 4 or 0)+(jl[tostring(fW.id)]and 2 or 0)+(fW.named and 1 or 0)if pz~=pA then return pz<pA end
return tostring(fV.id)<tostring(fW.id)end)local fX,jn={},{}for fY=1,jk do fX[fY]=tostring(jm[fY].id)if fU[fX[fY]]then jn[#jn+1]=fX[fY]end
end q.editing,q.editingSince=true,x()for A_,wD in ipairs(jn)do j.call("unequip",wD)task.wait(0.3)end local fZ=j.call("fuse",{ids=fX})
q.editing,q.nextTry=false,0 if type(fZ)=="table"and fZ.ok then z.fused=z.fused+1 z.dirtyAt=x()y(("FUSED %d %s -> Big %s"):format(jk,j.nice(b0),j.nice(b0)))
z.fuseMsg=("fused a Big %s %s"):format(j.nice(b0),os.date("%H:%M"))else z.failUntil[b0]=x()+120 y(("fuse %s failed: %s"):format(j.nice(b0),type(fZ)=="table"and tostring(fZ.reason or"no reason given")or"no answer"))
end return end end end function z.tick()pcall(z.fuseTick)if not d.AutoBuild or not d.Teams then return end local pB=j.data()
if not pB then return end local b1={}for Ba,wE in ipairs(pB.pets or{})do b1[#b1+1]=tostring(wE.id)end table.sort(b1)
b1=table.concat(b1,",")if b1~=z.sig then z.sig,z.dirtyAt=b1,x()end local wF=(z.dirtyAt and x()-z.dirtyAt>8)or x()-(z.lastBuild or 0)>900
if wF and not q.editing then local wG=z.rebuild(z.dirtyAt and"pets changed"or"check")if wG then z.dirtyAt,z.lastBuild=nil,x()end
end end o.bb,o.fx,o.post,o.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}o.watch=setmetatable({},{__mode="k"})
o.mem,o.memPeak,o.fps=0,0,0 function o.isFx(b2)return b2:IsA("ParticleEmitter")or b2:IsA("Trail")or b2:IsA("Beam")or b2:IsA("Fire")or b2:IsA("Smoke")
or b2:IsA("Sparkles")or b2:IsA("Light")end function o.muteOne(aB)if not d.Lite or not aB.Parent then return end
local f0=(aB:IsA("BillboardGui")and o.bb)or(o.isFx(aB)and o.fx)or nil if not f0 or f0[aB]~=nil then return end
f0[aB]=aB.Enabled if aB.Enabled then aB.Enabled=false end o.watch[aB]=aB:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aB.Enabled then f0[aB]=true aB.Enabled=false end end)end function o.lite(pC)d.Lite=pC if pC then
task.spawn(function()for wH,wI in ipairs(av:GetDescendants())do if not d.Lite then return end pcall(o.muteOne,wI)
if wH%600==0 then task.wait()end end end)if not o.addConn then o.queue={}o.addConn=T(av.DescendantAdded:Connect(function(jo)
if d.Lite and(jo:IsA("BillboardGui")or o.isFx(jo))then o.queue[#o.queue+1]=jo end end))end local jp=game:GetService("Lighting")
for Bb,dQ in ipairs(jp:GetChildren())do if dQ:IsA("PostEffect")and dQ.Enabled and o.post[dQ]==nil then o.post[dQ]=true dQ.Enabled=false end
end pcall(function()o.oldShadows=o.oldShadows==nil and jp.GlobalShadows or o.oldShadows jp.GlobalShadows=false end)
pcall(function()o.oldDeco=o.oldDeco==nil and av.Terrain.Decoration or o.oldDeco av.Terrain.Decoration=false end)
else for Bc,wJ in pairs(o.watch)do pcall(function()wJ:Disconnect()end)end for pD,wK in pairs(o.bb)do pcall(function()if pD.Parent then pD.Enabled=wK end end)end
for pE,wL in pairs(o.fx)do pcall(function()if pE.Parent then pE.Enabled=wL end end)end for pF in pairs(o.post)do pcall(function()if pF.Parent then pF.Enabled=true end end)end
o.bb,o.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})o.watch,o.post,o.queue=setmetatable({},{__mode="k"}),{},{}
local wM=game:GetService("Lighting")if o.oldShadows~=nil then pcall(function()wM.GlobalShadows=o.oldShadows end)o.oldShadows=nil end
if o.oldDeco~=nil then pcall(function()av.Terrain.Decoration=o.oldDeco end)o.oldDeco=nil end end end o.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function o.hideHud(pG)d.HideHud=pG local jq=J:FindFirstChildOfClass("PlayerGui")if not jq then return end if pG then
for Bd,dR in ipairs(jq:GetChildren())do if dR:IsA("ScreenGui")and not o.MINE[dR.Name]and dR.Enabled then o.hud[dR]=true dR.Enabled=false end
end if not o.hudConn then o.hudConn=T(jq.ChildAdded:Connect(function(dS)if d.HideHud and dS:IsA("ScreenGui")and not o.MINE[dS.Name]then
task.defer(function()if d.HideHud and dS.Enabled then o.hud[dS]=true dS.Enabled=false end end)end end))end else
for pH in pairs(o.hud)do pcall(function()if pH.Parent then pH.Enabled=true end end)end o.hud={}end end o.CAPS={0,30,15,10}
function o.cap(jr)d.FpsCap=jr local pI=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not pI then return false end return pcall(pI,jr==0 and 60 or jr)end function o.render(pJ)d.NoRender=pJ pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not pJ)end)
end function o.restoreAll()pcall(o.unpin)if D.arPaused then pcall(D.resume,"script stopped")end pcall(o.lite,false)
pcall(o.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)if(d.FpsCap or 0)~=0 then pcall(o.cap,0)end
end function o.rejoinSame(pK)if c.rejoining then return end y("REJOIN this server ("..pK..")")pcall(eA)if c.autoload then pcall(eZ,c.autoload)end
hB()local wN=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then c7(pK..", same server failed")end end)return wN end function o.tick()
local js=o.queue if d.Lite and js and#js>0 then o.queue={}for wO,wP in ipairs(js)do pcall(o.muteOne,wP)if wO%300==0 then task.wait()end end
end local pL=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if pL then for Be,wQ in ipairs(pL:GetChildren())do
local pM=wQ:FindFirstChild("SquishyPlaceHolder")local b3=pM and pM:FindFirstChild("TimerGui")if b3 and b3:IsA("BillboardGui")then
if o.bb[b3]==nil then pcall(o.muteOne,b3)elseif b3 .Enabled then o.bb[b3]=true b3 .Enabled=false end end end end
local wR,dT=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if wR and type(dT)=="number"then
o.mem=dT o.memPeak=math.max(o.memPeak,dT)if(d.MemLimit or 0)>0 and dT>d.MemLimit then o.over=(o.over or 0)+1 if o.over>=30 and not c.busy then
o.over=-600 o.rejoinSame(("memory %d MB > %d MB"):format(dT,d.MemLimit))end elseif(o.over or 0)>0 then o.over=0
end end if x()-(o.noteAt or 0)>1800 then o.noteAt=x()y(("health: %d fps, %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function jt(f1)if type(f1)~="string"then return false end
f1=f1:lower()for Bf,wS in ipairs(c.sellWords)do if f1:find(wS,1,true)then return true end end return false end
local function wT()local pN=aq:FindFirstChild("Remotes")local ju=pN and pN:FindFirstChild("SellSquishy")if not(ju and ju:IsA("RemoteEvent"))then return false end
if not pcall(function()ju:FireServer()end)then return false end return ak(function()return aa()==nil end,1.5)
end local function wU()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local pO=ar()local pP=pO and pO.HumanoidRootPart.Position local dU,pQ for Bg,cy in ipairs((c.plot or av):GetDescendants())do
if cy:IsA("ProximityPrompt")and(jt(cy.ActionText)or jt(cy.ObjectText)or jt(cy.Name))then local pR=lb(cy)local jv=(pR and pP)and(pR-pP).Magnitude or 1e9
if jv<=400 and(not dU or jv<pQ)then dU,pQ=cy,jv end end end c.sellSpot=dU c.noSellSpot=(dU==nil)return dU end
local function pS()local jw=aa()if not jw then c.holding=false return false end if aQ(jw)then return false end
local jx=ah(ab(jw))if wT()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
y("SOLD "..jx)return true end local cz=wU()if cz then local pT=cU(cz)if pT then ci(pT,cz)local pU=aa()if pU and not aQ(pU)then
local wV,wW=dc(cz,function()return aa()==nil end,function()return cz.Enabled end)if wV then c.sold,c.holding,c.sellFails=c.sold+1,false,0
y(("SOLD %s at %s via %s"):format(jx,ev(cz),wW))return true end end end end c.sellFails=c.sellFails+1 y("could not sell "..jx.." ("..c.sellFails..")")
return false end local wX={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function wY(cA)local f2=ev(cA):lower()for Bh,wZ in ipairs(wX)do if f2:find(wZ,1,true)then return 0 end end
local aU,ai=cA.Name:lower(),0 local function aM(w0,w1)return w0:find(w1,1,true)~=nil end if aM(aU,"collect")then ai=ai+60 end
if aM(aU,"cash")or aM(aU,"money")then ai=ai+45 end if aM(aU,"income")or aM(aU,"claim")then ai=ai+35 end if aM(aU,"coin")or aM(aU,"earn")or aM(aU,"green")then ai=ai+20 end
if aU=="pad"or aU=="touch"then ai=ai+25 end if ai==0 and(aM(f2,"collect")or aM(f2,"cash")or aM(f2,"money"))then ai=25 end
if ai==0 then return 0 end local dV=cA.Color if dV.G>0.5 and dV.G>dV.R*1.4 and dV.G>dV.B*1.4 then ai=ai+15 end
if math.min(cA.Size.X,cA.Size.Y,cA.Size.Z)<2 then ai=ai+5 end return ai end local function w2()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local f3,dW,jy={},nil,29 for Bi,f4 in ipairs(c.plot:GetDescendants())do
if f4:IsA("BasePart")then local f5=wY(f4)if f5>0 then f3[#f3+1]={s=f5,p=f4}if f5>jy then dW,jy=f4,f5 end end end
end table.sort(f3,function(w3,w4)return w3 .s>w4 .s end)c.padCands,c.padPart=f3,dW if dW then y("collect pad: "..ev(dW).." (score "..jy..")")end
return dW end local jz="SAB_pad_v1.txt"local function w5(w6)if type(writefile)=="function"then pcall(writefile,jz,table.concat({w6:GetComponents()},","))end
end local function w7()if type(isfile)~="function"or type(readfile)~="function"then return nil end local w8,pV=pcall(function()if isfile(jz)then return readfile(jz)end end)
if not w8 or type(pV)~="string"then return nil end local f6={}for w9 in pV:gmatch("[^,]+")do f6[#f6+1]=tonumber(w9)end
if#f6==12 then return CFrame.new(unpack(f6))end end local function w_(jA,f7,xa)local xb=c9(jA)local jB=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aN=(jB and jB:IsA("BasePart"))and(jB.Position-f7)or Vector3 .new(1,0,0)aN=Vector3 .new(aN.X,0,aN.Z)if aN.Magnitude<0.05 then aN=Vector3 .new(1,0,0)end
aN=aN.Unit for xc=0,7 do local f8=xc*math.pi/4 local xd=Vector3 .new(aN.X*math.cos(f8)-aN.Z*math.sin(f8),0,aN.X*math.sin(f8)+aN.Z*math.cos(f8))
local f9=f7+xd*(xa+5)local jC=e7(f9 .X,f7 .Y,f9 .Z)if jC and math.abs(jC.Y-f7 .Y)<8 then aF(jA,Vector3 .new(f9 .X,jC.Y+xb,f9 .Z))
if hK(jA,0.7)then return true end end end return false end local function xe()c.lastCollect=x()local dX=ar()if not dX then return end
local pW,xf=dX.HumanoidRootPart,c9(dX)local dY,pX,dZ,jD=nil,4,nil,"?"local jE=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and jE and jE:IsA("BasePart")then dY,jD=(jE.CFrame*c.manualPad).Position,"manual pad"else local a6=w2()
if a6 then dY=Vector3 .new(a6 .Position.X,a6 .Position.Y+a6 .Size.Y/2+xf,a6 .Position.Z)pX,dZ,jD=math.max(a6 .Size.X,a6 .Size.Z)/2,a6,a6 .Name
end end if not dY then y("COLLECT: pad not found - stand on it and tap SET PAD")return end local jF=aY()aF(dX,dY)
if dZ and type(firetouchinterest)=="function"then pcall(firetouchinterest,pW,dZ,0)end ad(d.PadDwell)if dZ and type(firetouchinterest)=="function"then pcall(firetouchinterest,pW,dZ,1)end
ad(0.5)c.collected=c.collected+1 local jG=aY()y(("COLLECTED (%s) %s"):format(jD,(jF and jG and jG>jF)and("+$"..aD(jG-jF))or"no cash change seen"))
w_(dX,dY,pX)end local d0 local function pY()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then c.capHit,c.placeFails=false,0
y("trying again after being stopped for 5 minutes")d0(true,true)else return nil,c.capMsg,"bad"end end if c.busy then return nil,c.busyText,"ok"end
if not ar()then return nil,"waiting for character","wait"end if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bf(),nil,nil
if not c.plot then return nil,"own plot not found yet","wait"end end if not next(d.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local jH,pZ=ex()local f_=aa()if f_ then local cB=ah(ab(f_))if not aQ(f_)then local jI=(Q.gift and ab(Q.gift)==ab(f_)and x()-Q.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cB,jI),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cB,jI),"bad"end return"sell",("selling %s (%s)"):format(cB,jI),"warn"
end if jH<1 then return nil,("holding %s - 0 free stations"):format(cB),"wait"end if q.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cB),"wait"end
return"place",("waxing %s (%d free)"):format(cB,jH),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local jJ=c.plot:FindFirstChild("CrateStand")if jJ then for Bj,d1 in ipairs(jJ:GetDescendants())do
if d1:IsA("ProximityPrompt")and d1 .Enabled and h0(d1)then local a7=d1 .ObjectText if a7==""then a7=cb(jJ,"TitleLabel")or""end
if a7~=""and L.wanted(a7)then local xg=et(a7):gsub("crate$","")local p0 for p1 in pairs(W.members)do if et(p1)==xg then p0=p1 end end
e.waiting,e.at,e.title,e.prompt=true,x(),a7,d1 e.data={name=(a7:gsub("%s","")),rarity=p0,title=a7}y(a7 .." found waiting on your stand")
end break end end end end local p2=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and p2 then
local a8=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a8),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 y("could not press the "..a8 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a8),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a8),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a8,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a8),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(a8),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a8),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(a8,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not p2 then local p3=e.title..tostring(e.rolledAt)if e.told~=p3 then e.told=p3 y(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if jH<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(pZ,pZ),"wait"
end local jK=lp()if not jK then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local d2=bJ()
if d2 and mM(d2 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(d2 .name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(d2 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(d2 .name),"ok"
end local bv=hI()if bv.state~="match"then c.matchSince=nil if bv.state=="skip"and not jK.Enabled then return nil,bv.text.." (sold out)","idle"end
return nil,bv.text,bv.level end if not jK.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local d3=x()if d3<c.noCashUntil then local p4,xh=ml()if p4 then return nil,("cash short: have $%s, price ~$%s"):format(aD(p4),aD(xh)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aD(aY()),math.ceil(c.noCashUntil-d3)),"bad"end if d3-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or d3 local p5=d3-c.matchSince if p5<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bv.shown,p5),"ok"end
return"buy",("buying %s via %s"):format(bv.shown,bv.src),"ok"end o.DEPTH=11 function o.pinTick()local p6=o.hold
if not p6 then return end local jL=J.Character local jM=jL and jL:FindFirstChild("HumanoidRootPart")if not jM then return end
jM.CFrame=p6 jM.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Bk,ga in ipairs(jL:GetChildren())do if ga:IsA("BasePart")and ga.CanCollide then o.noclip[ga]=true ga.CanCollide=false end
end end o.noclip=setmetatable({},{__mode="k"})function o.pin(xi,p7)o.hold=xi if p7 then o.surface=p7 end end function o.unpin(xj)
if not o.hold then return end o.hold=nil for p8 in pairs(o.noclip)do pcall(function()if p8 .Parent then p8 .CanCollide=true end end)end
o.noclip=setmetatable({},{__mode="k"})local p9=ar()if p9 and o.surface and not xj then aF(p9,o.surface.Position,o.surface.Position+o.surface.LookVector)
ad(0.1)end end function o.home()local a9,p_=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ar()
if not(a9 and a9:IsA("BasePart")and p_)then return nil end local qa=le()or a9 .Position local gb=Vector3 .new(qa.X-a9 .Position.X,0,qa.Z-a9 .Position.Z)
gb=gb.Magnitude>0.1 and gb.Unit or Vector3 .new(0,0,1)local gc=a9 .Position+gb*6 local qb=e7(gc.X,a9 .Position.Y,gc.Z,{a9})
return CFrame.new(gc.X,(qb and qb.Y or a9 .Position.Y)+c9(p_),gc.Z)end function o.ground(xk,qc,xl)local jN,jO={J.Character},nil
for Bl=1,12 do local jP=RaycastParams.new()jP.FilterType=Enum.RaycastFilterType.Exclude jP.FilterDescendantsInstances=jN
local gd=av:Raycast(Vector3 .new(xk,qc,xl),Vector3 .new(0,-2000,0),jP)if not gd then break end jO,qc=gd,gd.Position.Y-0.05
jN[#jN+1]=gd.Instance end return jO and jO.Position.Y end function o.parkHome()local jQ=o.home()if not jQ then return false end
local cC=jQ.Position local xm=o.ground(cC.X,cC.Y+300,cC.Z)or(cC.Y-3)o.pin(CFrame.new(cC.X,xm-8,cC.Z),jQ)return true
end function o.parkTick()if not(d.Ghost and c.running)or o.hold or c.busy then return end local xn=ar()if not xn or K.seat()then return end
o.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0 function K.seat()local qd=J.Character
local qe=qd and qd:FindFirstChildOfClass("Humanoid")local jR=qe and qe.SeatPart return(jR and jR.Name=="LogSeat")and jR or nil
end function K.due()if not(d.Campfire and c.running)or x()<K.nextAt then return false end local xo=av:FindFirstChild("NightSeats")
if not xo then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire right now (it comes with every weather event)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or x()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
y(K.msg)return false end end return true end function K.sit()local qf,ge=av:FindFirstChild("NightSeats"),ar()
if not qf or not ge then return end local qg,cD=ge.HumanoidRootPart.Position,{}for Bm,gf in ipairs(qf:GetChildren())do
local qh=gf:IsA("Seat")and gf.Occupant==nil and gf:FindFirstChildOfClass("ProximityPrompt")if qh then cD[#cD+1]={st=gf,p=qh}end
end if#cD==0 then K.nextAt,K.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cD,function(xp,xq)return(xp.st.Position-qg).Magnitude<(xq.st.Position-qg).Magnitude end)
local xr,xs=cD[1].st,cD[1].p o.unpin(true)local cE=xr.CFrame aF(ge,cE.Position+cE.LookVector*2+Vector3 .new(0,2.5,0),cE.Position)
ad(0.25)local xt=dc(xs,function()return K.seat()~=nil end)if not xt then aF(ge,cE.Position+Vector3 .new(0,2,0),cE.Position+cE.LookVector)
ak(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,x()y(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=x()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then y(K.msg)end end end D.msg,D.nextAt,D.at,D.pulls,D.claims,D.pullLeft,D.collectLeft,D.events="",0,0,0,0,0,0,{}
function D.refresh()D.at=x()local jS=aq:FindFirstChild("Remotes")if not jS then return end local d4,jT,cF=0,0,{}
local xu,qi=pcall(function()return jS.ClanRequest:InvokeServer("state")end)local qj=xu and type(qi)=="table"and qi.tasks
for Bn,bw in ipairs(qj and qj.list or{})do if not bw.done and bw.kind=="pull"then d4=math.max(d4,(bw.goal or 0)-(bw.progress or 0))end
if not bw.done then cF[#cF+1]=("%s %d/%d"):format(tostring(bw.text),bw.progress or 0,bw.goal or 0)end end D.events={}
for Bo,cG in ipairs(jS:GetChildren())do if cG:IsA("RemoteFunction")and cG.Name:match("^%u%a+Action$")and cG.Name~="CrateAction"and cG.Name~="AutoRollAction"then
local xv,d5=pcall(function()return cG:InvokeServer("state")end)if xv and type(d5)=="table"and d5 .live==true and type(d5 .quests)=="table"then
D.events[#D.events+1]={r=cG,st=d5}for Bp,aI in ipairs(d5 .quests)do if not aI.done and aI.kind=="pull"then d4=math.max(d4,(aI.goal or 0)-(aI.progress or 0))end
if not aI.done and aI.kind=="collect"then jT=math.max(jT,(aI.goal or 0)-(aI.progress or 0))end if not aI.done then cF[#cF+1]=("%s %d/%d"):format(tostring(aI.text),aI.progress or 0,aI.goal or 0)end
end end end end D.pullLeft,D.collectLeft=d4,jT D.msg=#cF>0 and("open: "..table.concat(cF,", "))or"all quests done for today"
end function D.claim()for Bq,d6 in ipairs(D.events)do local qk=d6 .r.Name:gsub("Action$","")for Br,cH in ipairs(d6 .st.quests)do
if cH.done and not cH.claimed then local xw,ql=pcall(function()return d6 .r:InvokeServer("claimQuest",cH.id)end)
if xw and not(type(ql)=="table"and ql.ok==false)then D.claims=D.claims+1 y(("CLAIMED %s quest: %s (+%s)"):format(qk,tostring(cH.text),tostring(cH.points or cH.treats or"?")))
end ad(0.4)end end if d6 .st.bonusReady==true then local xx=pcall(function()return d6 .r:InvokeServer("claimBonus")end)
if xx then y(("CLAIMED %s daily quest bonus"):format(qk))end ad(0.4)end end end function D.tick()if not(d.Quests and c.running)then
if D.arPaused then D.resume("quests switched off")end return end if x()-D.at<(D.pullLeft>0 and 20 or 90)then return end
D.refresh()pcall(D.claim)if D.pullLeft<=0 and D.arPaused then D.resume("lever quests done")end end function D.pullDue()
return d.Quests and c.running and D.pullLeft>0 and x()>=D.nextAt and not A.busy end function D.lever()local qm=c.plot and c.plot:FindFirstChild("Lever")
local jU=qm and qm:FindFirstChild("Wheel")return jU and jU:FindFirstChildWhichIsA("ProximityPrompt"),jU end function D.resume(xy)
D.arPaused=false if D.arWas then D.arWas=false d.AutoRoll=true task.spawn(A.apply,xy)end end function D.pull()
local gg,jV=D.lever()if not gg or not jV or not jV:IsA("BasePart")then D.nextAt,D.msg=x()+300,"your lever was not found"return end
if not D.arPaused then D.arPaused=true D.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false A.apply("pulling the lever for a quest",true)
if A.isOn()then D.nextAt=x()+30 return end end y(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(D.pullLeft))
end if not gg.Enabled then D.nextAt=x()+1 return end ci(jV,gg)D.asked=nil mA(gg)D.pulls=D.pulls+1 D.pullLeft=D.pullLeft-1
ad(0.6)if D.asked then D.nextAt=x()+600 y(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(D.asked)))
D.resume("a butter the game wants kept is on the pad")return end D.nextAt=x()+2.5 if D.pullLeft<=0 then D.at=0 end
end C.skip,C.skipN,C.n,C.calls,C.fails,C.nextAt,C.msg,C.tries={},0,0,0,0,0,"off",{}function C.can(bx,xz)local jW=bx:GetAttribute("PourOwner")
if type(jW)~="number"or jW==j.uid or not bx:GetAttribute("HasSquishy")then return false end if bx:GetAttribute("PourLong")~=true or bx:GetAttribute("PourFull")==true then return false end
local jX=bx:GetAttribute("PourId")if jX==nil or C.skip[jX]then return false end local qn,jY,xA=bx:GetAttribute("Helpers"),0,tostring(j.uid)
if type(qn)=="string"then for xC in qn:gmatch("[^,%s]+")do jY=jY+1 if xC==xA then return false end end end if jY>=6 then return false end
local gh=q.left(bx)if not gh then local qo=tonumber(bx:GetAttribute("PourEnd"))gh=qo and(qo-xz)end if not gh or gh<=75 then return false end
local jZ=game:GetService("Players"):GetPlayerByUserId(jW)if not jZ or jZ:GetAttribute("WaxHelpOff")==true then return false end
return true,jZ,jX end function C.list()local j0,xD={},j.srv()local qp=av:FindFirstChild("Plots")for Bs,qq in ipairs(qp and qp:GetChildren()or{})do
local qr=qq~=c.plot and qq:FindFirstChild("WaxStations")for Bt,j1 in ipairs(qr and qr:GetChildren()or{})do local xE,xF,xG=C.can(j1,xD)
local j2=xE and j1:FindFirstChild("SquishyPlaceHolder")if j2 and j2:IsA("BasePart")then j0[#j0+1]={st=j1,p=xF,id=xG,part=j2}end
end end return j0 end function C.due()return d.Help and c.running and x()>=C.nextAt end function C.skipIt(qs,qt)
C.skip[qs],C.skipN=qt,C.skipN+1 if C.skipN>600 then C.skip,C.skipN,C.tries={[qs]=qt},1,{}end end function C.goHome()
local gi,by=ar(),C.home C.home=nil if not(gi and by)then return end if d.Ghost and not K.seat()then o.unpin(true)
if not o.parkHome()then pcall(aF,gi,by.Position,by.Position+by.LookVector)end elseif o.hold or(gi.HumanoidRootPart.Position-by.Position).Magnitude>20 then
o.unpin(true)pcall(aF,gi,by.Position,by.Position+by.LookVector)end end function C.step()local j3,d7=C.list(),ar()
if#j3==0 or not d7 then C.nextAt=x()+15 C.msg=("helped %d waxes here%s | none to help right now"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")
C.goHome()return end local qu=d7 .HumanoidRootPart local qv=qu.Position table.sort(j3,function(xH,xI)return(xH.part.Position-qv).Magnitude<(xI.part.Position-qv).Magnitude end)
local aO=j3[1]C.home=C.home or(o.hold and o.surface)or qu.CFrame local bz=aO.part local d8=(bz.Position+aO.st:GetPivot().Position)/2
local gj=C.tries[aO.id]or 0 if d.Ghost and gj==0 and not K.seat()then o.pin(bz.CFrame)else o.unpin(true)local j4=gj==0 and e7(d8 .X,bz.Position.Y,d8 .Z,{bz})
if j4 and math.abs(j4 .Y-bz.Position.Y)<8 then aF(d7,Vector3 .new(d8 .X,j4 .Y+c9(d7),d8 .Z),bz.Position)else aF(d7,bz.Position+Vector3 .new(0,bz.Size.Y/2+3,0),d8)
end end ad(0.3)local d9=aq:FindFirstChild("Remotes")d9=d9 and d9:FindFirstChild("ClanRequest")if not d9 then C.nextAt,C.msg=x()+60,"the game's help remote is missing"return end
local gk,a_=pcall(function()return d9:InvokeServer("help",aO.st:GetAttribute("PourOwner"),tonumber(aO.st.Name))end)
if gk and type(a_)=="table"and a_.ok then C.n,C.fails=C.n+1,0 C.skipIt(aO.id,"helped")y(("HELPED %s's wax (station %s)"):format(aO.p.DisplayName,aO.st.Name))
C.msg=("helped %d waxes here%s"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")elseif gk and type(a_)=="table"and tostring(a_.reason or""):lower():find("walk up",1,true)and gj<2 then
C.tries[aO.id]=gj+1 C.nextAt=x()+0.3 elseif gk and type(a_)=="table"and tostring(a_.reason or""):lower():find("moment",1,true)then
C.waits=(C.waits or 0)+1 C.nextAt=x()+1.6 else local qw=(gk and type(a_)=="table"and tostring(a_.reason or"refused"))or("error: "..tostring(a_))
C.skipIt(aO.id,qw)C.fails=C.fails+1 if C.fails<=3 then y(("help refused for %s's wax: %s"):format(aO.p.DisplayName,qw))end
if C.fails>=5 then C.fails,C.nextAt,C.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
C.goHome()end end C.nextAt=math.max(C.nextAt,x()+1.2)end function C.onCall(ba)if not d.HelpGuild or type(ba)~="table"or ba.p~="help"or ba.mine or ba.u==j.uid or not ba.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local d_=aq:FindFirstChild("Remotes")
d_=d_ and d_:FindFirstChild("ClanRequest")if not d_ then return end local qx,ea=pcall(function()return d_:InvokeServer("callHelp",ba.u)end)
local qy=tostring(ba.n or ba.un or ba.u)if qx and type(ea)=="table"and ea.ok then C.calls=C.calls+1 y(("HELPED guildmate %s's wax from here (their call)"):format(qy))
else y(("guild call from %s: %s"):format(qy,(qx and type(ea)=="table"and tostring(ea.reason or"refused"))or tostring(ea)))
end end)end local function ao(xJ,qz,...)if c.busy then return end c.busy,c.busyText=true,xJ if o.hold and qz~=C.step then pcall(o.unpin)end
local xK,qA=pcall(qz,...)c.busy,c.busyText=false,""if not xK and qA~=gT then y("ERR "..tostring(qA))end end local function xL()
local aV,xM,xN=pY()c.reason,c.level=xM,xN if aV=="place"then ao("waxing...",q.place)elseif aV=="crate"then ao("opening crate...",fj,true)
elseif aV=="cratesmart"then ao("opening crate...",e.smart)elseif aV=="cratewin"then ao("opening the crate window...",h2)
elseif aV=="nocrate"then ao("discarding crate...",fj,false)elseif aV=="sell"then ao("selling...",pS)elseif aV=="buy"then ao("buying...",mD,false)
elseif not aV and not c.matchSince and K.due()then ao("sitting at the campfire...",K.sit)elseif not aV and not c.matchSince and D.pullDue()and not aa()and not(bJ()and aQ(bJ().name))then
ao("pulling the lever for a quest...",D.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(D.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ao("collecting money...",xe)elseif not aV and not c.matchSince and C.due()then ao("helping a wax...",C.step)elseif C.home and not d.Help then
ao("coming back...",C.goHome)elseif not c.busy then o.parkTick()end end function d0(gl,xO)if gl==c.running then return end
c.running=gl if not xO then d.AutoStart=gl end if gl then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bf()or c.plot
y("START")else c.reason="stopped"y("STOP")end end do local bA=eU(af.auto)if type(bA)=="string"then bA=bA:gsub("%s+$","")
if bA~=""then c.autoload=bA local xP=l_(bA)y(xP and("loaded config "..bA)or("config "..bA.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local xQ={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}local qB={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function N(xR,xS,xT)local xU,j5=pcall(Instance.new,xR)
if not xU then c.uiErrs=c.uiErrs+1 return nil end for xV,xW in pairs(xS)do if not pcall(function()j5[xV]=xW end)then c.uiErrs=c.uiErrs+1 end
end j5 .Parent=xT return j5 end local function al(xX,xY)N("UICorner",{CornerRadius=UDim.new(0,xY or 6)},xX)end
local a={}local j6=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")local qC=j6:FindFirstChild("SABFarmGui")
if qC then qC:Destroy()end local j7=N("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},j6)
local aj={w=320,h=330,head=30,strip=38,tabs=26}a.root=N("Frame",{Name="Root",Size=UDim2 .new(0,aj.w,0,aj.h),Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),
BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},j7)al(a.root,10)N("UIStroke",{Color=l.line,Thickness=1},a.root)
local bc=UDim2 .new(1,0,1,0)local function F(qD,qE)return UDim2 .new(qD,0,0,0),UDim2 .new(qE,(qD+qE>0.99)and 0 or-4,1,0)end
local function E(xZ,x0,x1,x2,x3,x4)local qF=N("TextButton",{Text=x0,Position=x3,Size=x4,BackgroundColor3=x1,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=x2,TextColor3=l.text,AutoButtonColor=true},xZ)al(qF,6)return qF end local function gm(x5,x6,x7,x8,x9)
local j8=N("TextBox",{Text=x6,PlaceholderText=x7,Position=x8,Size=x9,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=l.text,PlaceholderColor3=l.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},x5)al(j8,6)N("UIPadding",{PaddingLeft=UDim.new(0,8)},j8)
return j8 end local gn=av.CurrentCamera local function x_()local ya,go=pcall(function()return gn and gn.ViewportSize end)
if ya and go and go.X>50 and go.Y>50 then return go end end local function bB(eb)local j9=x_()if not(j9 and eb and eb.Parent)then return end
local yb=pcall(function()local gp,qG=eb.AbsolutePosition,eb.AbsoluteSize local j_=70 local qH=math.clamp(gp.X,j_-qG.X,j9 .X-j_)
local qI=math.clamp(gp.Y,0,j9 .Y-math.min(qG.Y,j_))if math.abs(qH-gp.X)>0.5 or math.abs(qI-gp.Y)>0.5 then eb.Position=UDim2 .new(0,math.floor(qH),0,math.floor(qI))
end end)return yb end local function gq(yc)local yd,ka=pcall(function()return yc.AbsolutePosition end)if yd and ka then return{math.floor(ka.X),math.floor(ka.Y)}end
end local cI={}c.dragMoved={}local function qJ(ec,qK,kb)T(ec.InputBegan:Connect(function(cJ)if cJ.UserInputType~=Enum.UserInputType.MouseButton1 and cJ.UserInputType~=Enum.UserInputType.Touch then return end
local kc={start=cJ.Position,from=qK.Position,moved=0,target=qK,input=cJ,onDrop=kb}cI[ec],c.dragMoved[ec]=kc,0
local kd kd=cJ.Changed:Connect(function()if cJ.UserInputState==Enum.UserInputState.End and cI[ec]==kc then cI[ec]=nil
if kd then kd:Disconnect()end if kb then kb(kc.moved)end end end)end))end T(kY.InputChanged:Connect(function(gr)
if gr.UserInputType~=Enum.UserInputType.MouseMovement and gr.UserInputType~=Enum.UserInputType.Touch then return end
for ye,aW in pairs(cI)do local ke=aW.target if ke and ke.Parent then local qL,qM=gr.Position.X-aW.start.X,gr.Position.Y-aW.start.Y
aW.moved=math.max(aW.moved,math.abs(qL)+math.abs(qM))c.dragMoved[ye]=aW.moved ke.Position=UDim2 .new(aW.from.X.Scale,aW.from.X.Offset+qL,aW.from.Y.Scale,aW.from.Y.Offset+qM)
end end end))T(kY.InputEnded:Connect(function(gs)if gs.UserInputType~=Enum.UserInputType.MouseButton1 and gs.UserInputType~=Enum.UserInputType.Touch then return end
for yf,gt in pairs(cI)do if gt.input==gs or gs.UserInputType==Enum.UserInputType.MouseButton1 then cI[yf]=nil
if gt.onDrop then gt.onDrop(gt.moved)end end end end))local function O(yg,yh,yi,yj,yk,yl,ym)return N("TextLabel",{Text=yh,Position=yl or UDim2 .new(0,0,0,0),Size=ym or bc,BackgroundTransparency=1,
Font=yk and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=yi,TextColor3=yj,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},yg)
end a.title=N("Frame",{Size=UDim2 .new(1,0,0,aj.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=N("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.title)
al(a.dot,5)O(a.title,"SAB  BUTTER FARM  "..b7,12,l.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=E(a.title,"-",l.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=E(a.title,"X",l.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=N("Frame",{Position=UDim2 .new(0,0,0,aj.head),Size=UDim2 .new(1,0,0,aj.strip),BackgroundColor3=l.bg,BorderSizePixel=0},a.root)
a.bar=N("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
al(a.bar,2)a.reason=O(a.strip,"starting",12,l.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=N("Frame",{Position=UDim2 .new(0,0,0,aj.head+aj.strip),Size=UDim2 .new(1,0,0,aj.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=E(a.tabs,"FARM",l.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=E(a.tabs,"BUTTERS",l.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=E(a.tabs,"CRATES",l.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=E(a.tabs,"PETS",l.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=E(a.tabs,"TEAMS",l.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=E(a.tabs,"SETUP",l.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function cK()local kf=N("ScrollingFrame",{Position=UDim2 .new(0,0,0,aj.head+aj.strip+aj.tabs),Size=UDim2 .new(1,0,1,-(aj.head+aj.strip+aj.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
N("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},kf)N("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},kf)
return kf end a.farm,a.but,a.set,a.crt=cK(),cK(),cK(),cK()a.pet,a.team=cK(),cK()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local gu,ed,H=0,12,nil local function ag(qN,yn)gu,ed=gu+1,ed+qN+6 return N("Frame",{Size=UDim2 .new(1,0,0,qN),BackgroundTransparency=1,LayoutOrder=gu},yn or a.farm)
end local function bC(yo)O(ag(14),yo,10,l.dim,true)end H=ag(34)a.startB=E(H,"START",l.good,14,F(0,0.68))a.killB=E(H,"KILL",l.bad,14,F(0.68,0.32))
local yp=ag(42)local function ee(qO,yq,kg)local kh=N("Frame",{Position=UDim2 .new((qO-1)/kg,0,0,0),Size=UDim2 .new(1/kg,qO<kg and-4 or 0,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},yp)al(kh,6)local qP=O(kh,"0",15,l.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local yr=O(kh,yq,9,l.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))qP.TextXAlignment,yr.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return qP end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=ee(1,"BOUGHT",5),ee(2,"WAXED",5),ee(3,"SOLD",5),ee(4,"MONEY",5),ee(5,"FREE",5)
a.info=O(ag(40),"",10,l.dim,false)a.tgt=O(ag(26),"",10,l.good,false)bC("MONEY COLLECT")H=ag(28)a.secB=gm(H,tostring(d.Every),"60",F(0,0.2))
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
a.farm.CanvasSize=UDim2 .new(0,0,0,ed)gu,ed=0,12 local function am(ys)return ag(ys,a.set)end local function ef(yt)O(am(14),yt,10,l.dim,true)end
ef("SETTINGS FILE  (saved on your phone)")H=am(28)a.cfgName=gm(H,"default","config name",F(0,0.5))a.cfgSave=E(H,"SAVE",l.good,11,F(0.5,0.25))
a.cfgLoad=E(H,"LOAD",l.accent,11,F(0.75,0.25))H=am(26)a.cfgPrev=E(H,"<",l.panel2,11,F(0,0.13))a.cfgPick=E(H,"(none saved)",l.panel2,10,F(0.13,0.74))
a.cfgNext=E(H,">",l.panel2,11,F(0.87,0.13))H=am(26)a.cfgAuto=E(H,"LOAD IT ON LAUNCH: OFF",l.panel2,10,F(0,1))
a.cfgMsg=O(am(26),"",10,l.dim,false)ef("START BY ITSELF")H=am(26)a.autoB=E(H,"INSTALL F.exec",l.accent,10,F(0,1))
a.autoMsg=O(am(30),"",10,l.dim,false)H=am(28)a.startT=E(H,"START FARMING ON LOAD: ON",l.accent,10,F(0,1))O(am(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,l.dim,false)
ef("IF THE GAME DROPS ME")H=am(28)a.rejT=E(H,"AUTO REJOIN: ON",l.accent,11,F(0,0.55))a.rejB=E(H,"REJOIN NOW",l.warn,11,F(0.55,0.45))
a.rejMsg=O(am(30),"",10,l.dim,false)ef("SMOOTHER RUNNING  (for long / overnight runs)")H=am(28)a.pfLite=E(H,"LITE MODE: OFF",l.panel2,10,F(0,0.5))
a.pfHud=E(H,"HIDE GAME HUD: OFF",l.panel2,10,F(0.5,0.5))H=am(28)a.pfFps=E(H,"FPS CAP: GAME",l.panel2,10,F(0,0.5))
a.pfRender=E(H,"STOP 3D: OFF",l.panel2,10,F(0.5,0.5))H=am(28)a.pfMem=gm(H,tostring(d.MemLimit),"2000",F(0,0.24))
O(H,"MB: rejoin this server above it (0 = never)",9,l.dim,false,F(0.26,0.52))a.pfMemSet=E(H,"SET",l.accent,11,F(0.8,0.2))
a.pfInfo=O(am(18),"",10,l.text,false)O(am(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,l.dim,false)
ef("THE ROUND SAB BUTTON")O(am(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,l.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,ed)local qQ=N("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},j6)
a.tgRoot=N("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},qQ)al(a.tgRoot,20)N("UIStroke",{Color=l.line,Thickness=1},a.tgRoot)
a.tgBtn=N("TextButton",{Text="SAB",Size=bc,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=l.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=N("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
al(a.tgDot,4)local bd={built=false,boxes={},at=0}local function qR(qS,ki)d.Targets[qS]=ki or nil local kj=bd.boxes[qS]
if kj then kj.Text=ki and"X"or""kj.BackgroundColor3=ki and l.good or l.panel2 end end local function kk()for yu,qT in pairs(bd.boxes)do
local qU=d.Targets[yu]==true qT.Text=qU and"X"or""qT.BackgroundColor3=qU and l.good or l.panel2 end end local eg
local function yv()local yw=0 local kl=N("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=O(kl,"",10,l.dim,false,F(0,0.5))local yx=E(kl,"CLEAR",l.panel2,10,F(0.5,0.24))local yy=E(kl,"REFRESH",l.panel2,10,F(0.74,0.26))
yx.MouseButton1Click:Connect(function()for yz in pairs(d.Targets)do d.Targets[yz]=nil end kk()end)yy.MouseButton1Click:Connect(function()
W.at=0 ht()eg(true)end)return yw end eg=function(yA)if not ht()then if not a.butEmpty then a.butEmpty=O(N("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)end return end if bd.built and not yA and bd.at==W.at then return end
for Bu,km in ipairs(a.but:GetChildren())do if km:IsA("Frame")or km:IsA("TextButton")then km:Destroy()end end bd.boxes,a.butEmpty={},nil
yv()local kn,ko=36,1 local function qV(qW)ko=ko+1 local yB=N("Frame",{Size=UDim2 .new(1,0,0,qW),BackgroundTransparency=1,LayoutOrder=ko},a.but)
kn=kn+qW+6 return yB end for Bv,gv in ipairs(W.rarOrder)do local yC=qV(24)local yD=qB[gv]or l.text local kp=N("Frame",{Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0},yC)
al(kp,6)O(kp,"  "..gv:upper(),11,yD,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local yE=E(kp,"ALL",l.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local yF=gv yE.MouseButton1Click:Connect(function()local qX=W.members[yF]or{}local qY=false for Bw,yG in ipairs(qX)do if not d.Targets[yG]then qY=true break end end
for Bx,yH in ipairs(qX)do qR(yH,qY)end end)for By,kq in ipairs(W.members[gv]or{})do local yI=qV(22)local gw=N("TextButton",{Text="",Size=bc,BackgroundColor3=l.bg,BorderSizePixel=0,
AutoButtonColor=true},yI)al(gw,5)O(gw,"   "..ah(kq),11,l.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local kr=N("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},gw)al(kr,4)bd.boxes[kq]=kr local qZ=kq local function q0()qR(qZ,not d.Targets[qZ])end
gw.MouseButton1Click:Connect(q0)kr.MouseButton1Click:Connect(q0)end end kk()a.but.CanvasSize=UDim2 .new(0,0,0,kn+10)
bd.built,bd.at=true,W.at end function L.paint()for yJ,q1 in pairs(L.boxes)do local q2=d.CrateTicks[yJ]==true q1 .Text=q2 and"X"or""
q1 .BackgroundColor3=q2 and l.good or l.panel2 end if a.crtInfo then local ks,kt=0,0 for Bz in pairs(L.boxes)do ks=ks+1 end
for BA,yK in pairs(d.CrateTicks)do if yK then kt=kt+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(ks,kt)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and l.accent or l.panel2
end end function L.build()for BB,ku in ipairs(a.crt:GetChildren())do if ku:IsA("Frame")or ku:IsA("TextButton")then ku:Destroy()end
end L.boxes={}local kv,kw=12,0 local function gx(q3)kw=kw+1 kv=kv+q3+6 return N("Frame",{Size=UDim2 .new(1,0,0,q3),BackgroundTransparency=1,LayoutOrder=kw},a.crt)
end local kx=gx(28)a.crtInfo=O(kx,"",10,l.dim,false,F(0,0.5))local yL=E(kx,"CLEAR",l.panel2,10,F(0.5,0.24))local yM=E(kx,"REFRESH",l.panel2,10,F(0.74,0.26))
T(yL.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(yM.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=E(gx(28),"",l.accent,11,F(0,1))T(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
O(gx(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,l.dim,false)
for BC,be in ipairs(L.list())do local yN=gx(24)local eh=N("TextButton",{Text="",Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0,AutoButtonColor=true},yN)
al(eh,5)O(eh,"  "..(be.title or be.name)..(be.guess and"  (?)"or""),11,qB[be.rar or""]or l.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
O(eh,be.price and("$"..aD(be.price))or(be.rar or""),9,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local ky=N("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},eh)al(ky,4)L.boxes[be.k]=ky local q4=be.k local function q5()d.CrateTicks[q4]=(not d.CrateTicks[q4])or nil
L.paint()end T(eh.MouseButton1Click:Connect(q5))T(ky.MouseButton1Click:Connect(q5))end a.crt.CanvasSize=UDim2 .new(0,0,0,kv+10)
L.built=L.at L.paint()end local q6="farm"local function bD(an)q6=an a.farm.Visible,a.but.Visible,a.set.Visible=(an=="farm"),(an=="but"),(an=="set")
a.crt.Visible=(an=="crt")a.pet.Visible,a.team.Visible=(an=="pet"),(an=="team")a.tabCrt.BackgroundColor3=(an=="crt")and l.accent or l.panel2
a.tabPet.BackgroundColor3=(an=="pet")and l.accent or l.panel2 a.tabTeam.BackgroundColor3=(an=="team")and l.accent or l.panel2
if an=="pet"and not j.built then pcall(j.build)end if an=="team"and not q.built then pcall(q.build)end if an=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(an=="farm")and l.accent or l.panel2 a.tabBut.BackgroundColor3=(an=="but")and l.accent or l.panel2
a.tabSet.BackgroundColor3=(an=="set")and l.accent or l.panel2 if an=="but"then eg(false)end end local function M(q7,q8,yO,yP)
q7 .Text=q8 and yO or yP q7 .BackgroundColor3=q8 and l.accent or l.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(q9)
local b4=j.rows and j.rows[q9]if not b4 then return end local ei=d.Pets[q9]or{}b4 .b.BackgroundColor3=ei.b and l.good or l.panel2
b4 .g.BackgroundColor3=ei.g and l.accent or l.panel2 b4 .g.Text=ei.g and"BIG"or"ANY"b4 .w.BackgroundColor3=ei.w and l.warn or l.panel2
local kz=tonumber(ei.f)or 0 b4 .f.Text=kz>0 and(kz.." BIG")or"FUSE"b4 .f.BackgroundColor3=kz>0 and l.good or l.panel2
end function j.flag(kA,gy)local aX=d.Pets[kA]or{}if gy=="f"then local q_=((tonumber(aX.f)or 0)+1)%4 aX.f=q_>0 and q_ or nil
elseif aX[gy]then aX[gy]=nil else aX[gy]=true end d.Pets[kA]=(aX.b or aX.g or aX.w or aX.f)and aX or nil j.paintRow(kA)
end function j.paintAll()for yQ in pairs(j.rows or{})do j.paintRow(yQ)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function j.live()if not j.built then j.build()return end if x()-(j.liveAt or 0)<1 then return end j.liveAt=x()
local ra=j.wishes()local ej=j.data()for gz,gA in pairs(j.rows)do gA.name.Text=j.nice(gz)..(ra[gz]and("   * wish %dm"):format(math.ceil(ra[gz]/60))or"")
local rb=z.status(gz,ej)gA.desc.Text=rb and(rb.." | "..gA.boostText)or gA.boostText end local rc=tonumber(J:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(ej and#(ej.pets or{})or 0,ej and tonumber(ej.maxOwned)or 60,
aD(j.money()),rc>0 and(" | free wishes "..rc)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local gB=j.info()for BD,kB in ipairs(a.pet:GetChildren())do if kB:IsA("Frame")or kB:IsA("TextLabel")then kB:Destroy()end
end j.rows={}local kC,gC=0,12 local function cL(rd)kC,gC=kC+1,gC+rd+6 return N("Frame",{Size=UDim2 .new(1,0,0,rd),BackgroundTransparency=1,LayoutOrder=kC},a.pet)
end local kD=cL(28)a.pbT=E(kD,"AUTO ADOPT: OFF",l.panel2,9,F(0,0.34))a.pwT=E(kD,"AUTO WISH: OFF",l.panel2,9,F(0.34,0.33))
a.pfT=E(kD,"AUTO FUSE: OFF",l.panel2,9,F(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy j.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish j.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse j.paintAll()end)
a.pInfo=O(cL(44),"",10,l.dim,false)O(cL(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,l.dim,false)
if not gB then O(cL(30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,gC)
j.built=false return end local cM={}for BE,re in ipairs(j.order())do local kE=gB.Pets[re].rarity or"?"cM[kE]=cM[kE]or{}
table.insert(cM[kE],re)end local cN={}for BF,rf in ipairs(gB.Rarities or{})do if cM[rf]then cN[#cN+1]=rf end end
for rg in pairs(cM)do if not table.find(cN,rg)then cN[#cN+1]=rg end end for BG,gD in ipairs(cN)do local rh=N("Frame",{Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0},cL(22))
al(rh,6)O(rh,"  "..gD:upper(),11,j.RC[gD]or l.text,true)for BH,gE in ipairs(cM[gD])do local b5=N("Frame",{Size=bc,BackgroundColor3=l.bg,BorderSizePixel=0},cL(38))
al(b5,5)local yR=O(b5,j.nice(gE),11,j.RC[gD]or l.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local yS,yT=pcall(function()return gB.describe(gE)end)
local ri=yS and tostring(yT)or""local yU=O(b5,ri,9,l.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local rj=E(b5,"BUY",l.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local rk=E(b5,"ANY",l.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local rl=E(b5,"WISH",l.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local rm=E(b5,"FUSE",l.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local gF=gE rj.MouseButton1Click:Connect(function()j.flag(gF,"b")end)
rk.MouseButton1Click:Connect(function()j.flag(gF,"g")end)rl.MouseButton1Click:Connect(function()j.flag(gF,"w")end)
rm.MouseButton1Click:Connect(function()j.flag(gF,"f")end)j.rows[gE]={b=rj,g=rk,w=rl,f=rm,name=yR,desc=yU,boostText=ri}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,gC+10)j.built=true j.paintAll()end function o.paint()M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end
end function o.applyAll()if d.Lite then o.lite(true)end if d.HideHud then o.hideHud(true)end if d.NoRender then o.render(true)end
if(d.FpsCap or 0)~=0 then o.cap(d.FpsCap)end o.paint()end T(a.pfLite.MouseButton1Click:Connect(function()o.lite(not d.Lite)o.paint()end))
T(a.pfHud.MouseButton1Click:Connect(function()o.hideHud(not d.HideHud)o.paint()end))T(a.pfRender.MouseButton1Click:Connect(function()o.render(not d.NoRender)o.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local yV=table.find(o.CAPS,d.FpsCap or 0)or 1 local rn=o.CAPS[(yV%#o.CAPS)+1]
if not o.cap(rn)and rn~=0 then y("this executor cannot cap fps")end o.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local kF=tonumber(a.pfMem.Text)if kF and kF>=0 then d.MemLimit=math.floor(kF)end o.paint()end))function q.names()
local kG={"(none)"}for BI,yW in ipairs((q.teams()))do kG[#kG+1]=yW.name end return kG end function q.cycle(kH,yX)
local gG=q.names()local yY=d[kH]~=""and d[kH]or"(none)"local gH=table.find(gG,yY)or 1 gH=((gH-1+yX)%#gG)+1 d[kH]=gG[gH]=="(none)"and""or gG[gH]
q.paint()end function q.paint()if not q.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local kI={}for BJ,yZ in ipairs((q.teams()))do kI[yZ.name]=true end
for y0,ro in pairs(q.pick)do local cO=d[y0]ro.Text=cO==""and"(none)"or(kI[cO]and cO or(cO.." (missing)"))ro.TextColor3=(cO~=""and not kI[cO])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(q.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(q.switches,q.finished,q.glazed,z.fused)
..(z.buildMsg~=""and("\n"..z.buildMsg)or"")local y1,gI=j.srv(),{}for BK,gJ in ipairs(q.list or{})do gI[#gI+1]=("st %-2s %-22s %9s  helps %d"):format(gJ.st.Name,ah(ab(gJ.name)):sub(1,22),q.clock(gJ.ends-y1),gJ.helps)
end a.tmList.Text=#gI>0 and table.concat(gI,"\n")or"no waxes running"end function q.build()for BL,kJ in ipairs(a.team:GetChildren())do
if kJ:IsA("Frame")or kJ:IsA("TextLabel")then kJ:Destroy()end end q.pick={}local kK,kL=0,12 local function bE(rp)
kK,kL=kK+1,kL+rp+6 return N("Frame",{Size=UDim2 .new(1,0,0,rp),BackgroundTransparency=1,LayoutOrder=kK},a.team)
end local function ek(y2)O(bE(14),y2,10,l.dim,true)end local function gK(gL)local kM=bE(26)local y3=E(kM,"<",l.panel2,11,F(0,0.14))
local rq=E(kM,"(none)",l.panel,10,F(0.14,0.72))local y4=E(kM,">",l.panel2,11,F(0.86,0.14))y3 .MouseButton1Click:Connect(function()q.cycle(gL,-1)end)
y4 .MouseButton1Click:Connect(function()q.cycle(gL,1)end)rq.MouseButton1Click:Connect(function()q.cycle(gL,1)end)
q.pick[gL]=rq end a.tmT=E(bE(28),"AUTO TEAMS: OFF",l.panel2,11,F(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=q.current()end q.paint()end)a.tmInfo=O(bE(42),"",10,l.dim,false)
local rr=bE(26)a.tmBuild=E(rr,"AUTO BUILD TEAMS: OFF",l.panel2,9,F(0,0.62))a.tmBuildNow=E(rr,"BUILD NOW",l.warn,9,F(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild q.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if q.editing then return end z.buildMsg="building..."task.spawn(function()local y5,y6=pcall(z.rebuild,"you asked")if not y5 then y("BUILD ERR "..tostring(y6))end end)
end)ek("NORMAL TEAM  (worn the rest of the time)")gK("TeamNormal")ek("FULL TEAM  (every station busy: money + wax speed)")
gK("TeamFull")ek("GLAZE TEAM  (worn just before a wax finishes)")gK("TeamGlaze")local kN=bE(26)a.tmLead=gm(kN,tostring(d.GlazeLead),"45",F(0,0.2))
O(kN,"sec before it finishes",10,l.dim,false,F(0.22,0.5))local y7=E(kN,"SET",l.accent,11,F(0.75,0.25))y7 .MouseButton1Click:Connect(function()
local gM=tonumber(a.tmLead.Text)if gM and gM>=5 and gM<=600 then d.GlazeLead=math.floor(gM)else a.tmLead.Text=tostring(d.GlazeLead)end
q.paint()end)ek("WAX TEAM  (worn while a butter is placed: head starts)")gK("TeamWax")ek("YOUR WAXES  (time left, helps)")
a.tmList=N("TextLabel",{Size=bc,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bE(150))al(a.tmList,6)N("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
O(bE(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,l.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,kL+10)q.built=true q.paint()end local function y8()a.secB.Text=tostring(d.Every)
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ad(0.1)end pcall(o.unpin)end)end M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then d0(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bB(a.root)bB(a.tgRoot)c.lastCollect=x()
kk()L.paint()pcall(j.paintAll)pcall(q.paint)pcall(o.applyAll)end local function y9(rs)task.spawn(function()rs.TextColor3=l.bad
task.wait(0.8)if c.alive then rs.TextColor3=l.text end end)end local function rt()local ru=a.secB.Text:match("^%s*(%d+)%s*$")
local el=ru and tonumber(ru)if not el or el<1 then a.secB.Text=tostring(d.Every)y9(a.secB)y("interval must be a whole number >= 1")
return end if el==d.Every then return end d.Every,c.lastCollect=el,x()y("collect every "..el.."s")end local function P(y_,za)T(y_.MouseButton1Click:Connect(za))end
P(a.secSet,rt)T(a.secB.FocusLost:Connect(rt))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(ao,"selling...",pS)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(A.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help C.nextAt,C.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests D.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,function()d.Ghost=not d.Ghost if not d.Ghost then task.spawn(function()while c.busy do ad(0.1)end pcall(o.unpin)end)end
M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")end)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(ao,"opening crate...",fj,true)end)P(a.padB,function()c.plot=bf()or c.plot local rv,kO=ar(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(rv and kO and kO:IsA("BasePart"))then y("SET PAD: need character and plot")return end c.manualPad=kO.CFrame:ToObjectSpace(rv.HumanoidRootPart.CFrame)
w5(c.manualPad)y("collect pad saved at your position")end)P(a.startB,function()d0(not c.running)end)P(a.buyB,function()
c.plot=bf()or c.plot task.spawn(ao,"buying (manual)...",mD,true)end)P(a.plB,function()c.plot=bf()or c.plot task.spawn(ao,"waxing (manual)...",mI)
end)P(a.tabFarm,function()bD("farm")end)P(a.tabBut,function()bD("but")end)P(a.tabSet,function()bD("set")end)P(a.tabCrt,function()bD("crt")end)
P(a.tabPet,function()bD("pet")end)P(a.tabTeam,function()bD("team")end)local function zb(kP)c.hidden=kP a.root.Visible=not kP
a.tgBtn.Text=kP and"SAB+"or"SAB"end qJ(a.tgBtn,a.tgRoot,function()bB(a.tgRoot)c.togPos=gq(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then zb(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aC,ap={},0
local function bF()aC=l1()if#aC==0 then a.cfgPick.Text="(none saved)"ap=0 return end if ap<1 or ap>#aC then ap=1 end
a.cfgPick.Text=aC[ap]..("  (%d/%d)"):format(ap,#aC)end local function rw()local rx=c.autoload~=nil a.cfgAuto.Text=rx and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=rx and l.accent or l.panel2 end local function kQ()local ry=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if ry~=""then return ry end return(ap>0 and aC[ap])or""end P(a.cfgSave,function()c.winPos=gq(a.root)or c.winPos
c.togPos=gq(a.tgRoot)or c.togPos local rz,rA=eZ(kQ())a.cfgMsg.Text=rz and("saved as "..rA)or("could not save: "..rA)
a.cfgMsg.TextColor3=rz and l.good or l.bad bF()y(a.cfgMsg.Text)end)local function zc(kR)local kS,rB=l_(kR)a.cfgMsg.Text=kS and("loaded "..rB)or("could not load: "..rB)
a.cfgMsg.TextColor3=kS and l.good or l.bad if kS then a.cfgName.Text=kR y8()task.spawn(A.apply,"config "..kR)
end y(a.cfgMsg.Text)end P(a.cfgLoad,function()zc(kQ())end)P(a.cfgPick,function()bF()if ap>0 then a.cfgName.Text=aC[ap]end
end)P(a.cfgPrev,function()if#aC==0 then bF()return end ap=(ap-2)%#aC+1 bF()a.cfgName.Text=aC[ap]end)P(a.cfgNext,function()
if#aC==0 then bF()return end ap=ap%#aC+1 bF()a.cfgName.Text=aC[ap]end)P(a.cfgAuto,function()if c.autoload then
mb(nil)a.cfgMsg.Text="it will not load a config on launch"else local em=kQ()local rC=false for BM,zd in ipairs(l1())do if zd==em then rC=true end end
local ze=rC or eZ(em)if ze and em~=""then mb(em)bF()a.cfgMsg.Text=em.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim rw()end)P(a.autoB,function()
local rD,rE=ts()a.autoMsg.Text=rD and("installed. "..rE)or("failed: "..rE)a.autoMsg.TextColor3=rD and l.good or l.bad
y(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()c7("you asked")end)
local b6=false P(a.minB,function()b6=not b6 a.tabs.Visible=not b6 if b6 then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bD(q6)end a.root.Size=UDim2 .new(0,aj.w,0,b6 and(aj.head+aj.strip)or aj.h)
a.minB.Text=b6 and"+"or"-"end)local function gN()if not c.alive then return end c.alive,c.running=false,false
pcall(o.restoreAll)pcall(eA)for BN,zf in ipairs(gU)do pcall(function()zf:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()j7:Destroy()end)pcall(function()qQ:Destroy()end)if b8 .SAB_KILL==gN then b8 .SAB_KILL=nil end
end b8 .SAB_KILL=gN P(a.killB,gN)P(a.xB,gN)qJ(a.title,a.root,function()bB(a.root)c.winPos=gq(a.root)or c.winPos
end)local function rF()local en,eo=c.reason,c.level if c.busy then en,eo=c.busyText,"ok"elseif not c.running then
local BO,rG,zg=pY()if c.capHit then en,eo=rG,"bad"else en,eo="[stopped] "..rG,(zg=="bad")and"bad"or"idle"end c.reason,c.level=en,eo
end a.reason.Text=en a.bar.BackgroundColor3=xQ[eo]or l.dim a.dot.BackgroundColor3=c.running and l.good or(c.capHit and l.bad or l.dim)
a.tgDot.BackgroundColor3=a.dot.BackgroundColor3 a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent a.startB.Text=c.running and"STOP"or"START"
M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")a.startB.BackgroundColor3=c.running and l.warn or l.good
local zh,zi=ex()a.sBought.Text,a.sPlaced.Text,a.sSold.Text=tostring(c.bought),tostring(c.placed),tostring(c.sold)
a.sColl.Text,a.sFree.Text=tostring(c.collected),zh.."/"..zi local rH=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local rI=aa()a.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aD(aY()),c.rolls,c.gifts,c.crates,rI and ah(ab(rI))or"nothing",e.on and("   ["..e.title.." window open]")or"",
rH and("in "..rH.."s")or"off")local cP=s4()a.tgt.Text=(#cP==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#cP<=3)and table.concat(cP,", ")or(#cP.." butters ticked")))
a.tgt.TextColor3=(#cP==0)and l.bad or l.good a.padL.Text=c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found")
a.log.Text=table.concat(er,"\n")if a.butInfo then a.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(W.n,#W.rarOrder,#cP)
end if a.but.Visible and bd.at~=W.at then eg(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then j.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(o.fps+0.5),o.mem,o.memPeak)
end if a.team.Visible then q.paint()end if a.farm.Visible then a.helpL.Text=(d.Help or d.HelpGuild)and C.msg or"off"
a.questL.Text=d.Quests and(D.msg~=""and D.msg or"checking...")or"off"a.campL.Text=(d.Campfire and K.msg or"campfire off")..(d.Ghost and(o.hold and" | ghost: under"or" | ghost: up")or"")
end M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local rJ=(A.rec.on and"on"or"")..(A.rec.off and((A.rec.on and"/"or"").."off")or"")a.arL.Text=A.msg~=""and A.msg or("game: %s | learned: %s%s"):format(A.isOn()and"ON"or"off",
rJ~=""and rJ or"nothing yet",#A.rec.rules>0 and", choices"or"")a.arL.TextColor3=A.msg~=""and l.warn or l.dim end
b8 .SAB={S=c,CFG=d,EV=Q,U=a,sg=j7,CAT=W,LEARN=ae,buildList=eg,logAll=cQ,evAll=cR,AR=A,CR=L,PF=o,PX=j,TM=q,CRATE=e,FU=z,HX=C,CF=K,QX=D}
y(b7 .." loaded")if c.uiErrs>0 then y("UI: "..c.uiErrs.." properties skipped")end bD("farm")bB(a.root)bB(a.tgRoot)
if gn then pcall(function()T(gn:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bB(a.root)
bB(a.tgRoot)end))end)end bF()rw()if c.config and c.config~=""then a.cfgName.Text=c.config end M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")M(a.ghostT,d.Ghost,"GHOST: ON","GHOST: OFF")M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(o.applyAll)pcall(rF)task.spawn(function()local rK=tq()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(rK and("\n(backup: "..rK..")")or"")
local rL=eU(af.exec)if rL and not rL:find("SAB autoloader v2",1,true)then c3(af.exec,af.stub)y("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(eU(af.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(ty)end)task.spawn(function()while c.alive do local zj,zk=pcall(rF)if not zj then y("UI ERR "..tostring(zk))end
task.wait((c.hidden or b6)and 1.5 or 0.25)end end)task.spawn(function()local zl,zm=pcall(tH)if not zl then y("HOOK ERR "..tostring(zm))end
end)task.spawn(function()pcall(sr)if e.loadSeq and not e.learned then local gO={}for rM=1,20 do if e.loadSeq[rM]then gO[#gO+1]=e.loadSeq[rM]end end
if#gO>0 then e.learned={seq=gO,mode=e.loadMode}y("remembered how to open crates directly")end end if ht()then y(("catalog: %d butters in %d rarities"):format(W.n,#W.rarOrder))end
local zn,rN=pcall(w7)if zn and rN and c.alive and not c.manualPad then c.manualPad=rN end end)task.spawn(function()
while c.alive do local kT,kU=pcall(j.buyTick)if not kT then y("PET ERR "..tostring(kU))task.wait(5)end kT,kU=pcall(j.wishTick)
if not kT then y("WISH ERR "..tostring(kU))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local gP,rO=0,x()
T(game:GetService("RunService").Heartbeat:Connect(function()gP=gP+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if o.hold then pcall(o.pinTick)end end))
o.noteAt=x()while c.alive do task.wait(1)local rP=x()o.fps,gP,rO=gP/math.max(rP-rO,0.001),0,rP local zo,zp=pcall(o.tick)
if not zo then y("PERF ERR "..tostring(zp))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local zq,zr=pcall(z.tick)if not zq then y("FUSE ERR "..tostring(zr))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local zs,zt=pcall(q.tick)if not zs then y("TEAM ERR "..tostring(zt))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local gQ=aq:WaitForChild("Remotes",30)local rQ=gQ and gQ:WaitForChild("ClanEvent",30)
if rQ and c.alive then T(rQ.OnClientEvent:Connect(function(zu,zv)if zu=="call"then pcall(C.onCall,zv)end end))
end local rR=gQ and gQ:FindFirstChild("RollConfirmAsk")if rR and c.alive then T(rR.OnClientEvent:Connect(function(zw)D.asked=zw or"butter"end))end
end)task.spawn(function()task.wait(8)while c.alive do local zx,zy=pcall(D.tick)if not zx then y("QUEST ERR "..tostring(zy))task.wait(30)end
task.wait(3)end end)task.spawn(function()while c.alive do task.wait(20)pcall(eA)end end)pcall(A.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local zA=(type(newcclosure)=="function")and newcclosure or function(zz)return zz end local kV
local rS=(type(setnamecallmethod)=="function")and setnamecallmethod or nil kV=hookmetamethod(game,"__namecall",zA(function(rT,...)
local ep=getnamecallmethod()if c.alive and(ep=="InvokeServer"or ep=="FireServer")then local rU,rV=pcall(function()return rT.Name end)
if rU and rV=="CrateAction"and not e.replaying then pcall(e.saw,ep,...)elseif rU and rV=="AutoRollAction"and not A.replaying then pcall(A.saw,ep,...)end
if rS then rS(ep)end end return kV(rT,...)end))e.oldNC=kV end)end if gS then T(J.Idled:Connect(function()pcall(function()gS:CaptureController()gS:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for BP=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ar()and(c.plot or bf())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then A.apply("joined")end while c.alive do task.wait(30)if c.alive and d.AutoRoll and c.running and not A.isOn()and not bJ()and not aa()
and not e.waiting and not e.on and not c.busy then A.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for BQ=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bf()if ar()and c.plot and next(d.Targets)then d0(true,true)y("started by itself")
return end task.wait(1)end if c.alive and not c.running then y("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bf()c.lastCollect=x()while c.alive do if c.running then local zB,rW=pcall(xL)if not zB and rW~=gT then y("LOOP ERR "..tostring(rW))end
end task.wait(0.1)end end)gR("loaded - window is at the top left")end local zD,kW=xpcall(r0,function(zC)return tostring(zC).."\n"..debug.traceback()end)
if not zD then pcall(function()warn("SAB "..b7 .." ERROR: "..tostring(kW))end)gR("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b7 .." ERROR: "..tostring(kW))end)pcall(function()local rX=(type(getgenv)=="function"and getgenv())or _G
if type(rX.SAB_KILL)=="function"then rX.SAB_KILL()end for BR,zE in ipairs({"SABFarmGui","SABToggle"})do local rY=J.PlayerGui:FindFirstChild(zE)
if rY then rY:Destroy()end end end)pcall(function()local eq=Instance.new("ScreenGui")eq.Name="SABError"eq.ResetOnSpawn=false
eq.DisplayOrder=1000 local aP=Instance.new("TextBox")aP.Size=UDim2 .new(0,340,0,170)aP.Position=UDim2 .new(0,10,0,50)
aP.BackgroundColor3=Color3 .fromRGB(90,20,20)aP.TextColor3=Color3 .new(1,1,1)aP.TextSize=11 aP.TextWrapped=true
aP.ClearTextOnFocus=false aP.TextXAlignment=Enum.TextXAlignment.Left aP.TextYAlignment=Enum.TextYAlignment.Top
aP.Text="SAB "..b7 .." failed to start. Send this text:\n"..tostring(kW)aP.Parent=eq eq.Parent=J:WaitForChild("PlayerGui")
end)end
