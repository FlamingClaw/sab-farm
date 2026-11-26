local cd="v28"local ph=game:GetService("Players")local K=ph.LocalPlayer or ph.PlayerAdded:Wait()local function jz(yS)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..cd,Text=yS,Duration=6})
end)end jz("script started")local function yT()local ag=game:GetService("ReplicatedStorage")local ak=game:GetService("Workspace")
local pj=game:GetService("UserInputService")local c1=(type(getgenv)=="function"and getgenv())or _G if type(c1 .SAB_KILL)=="function"then pcall(c1 .SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jA=(function()local yU,yV=pcall(function()return game:GetService("VirtualUser")end)return yU and yV or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,NoWax=false,MainAccount="o_oFlame3",Crates=true,
CrateTicks={picniccrate=true},Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,Calm=false,HideBases=false,HideMine=false,MemLimit=1250,Help=false,
HelpGuild=false,Campfire=true,Ghost=false,GhostHelps=false,Quests=true,AutoIndex=false,Best=0,BestCrate=false,
Shower=true,SnapGlaze=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=z(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local ab={name=nil,rar=nil,at=z(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local E={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local j={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local o,A,d,y,F,H,J={},{},{},{},{},{},{}local q,P={},{}local jB={}local jC,ge,dZ,d0={},{},{},{}local function V(pk)jC[#jC+1]=pk return pk end
local function ah(yW)task.wait(yW)if not c.alive then error(jB,0)end end local function D(gf)gf=os.date("%H:%M:%S").." "..tostring(gf)
table.insert(ge,1,gf)if#ge>6 then table.remove(ge)end c.logN=(c.logN or 0)+1 dZ[#dZ+1]=gf if#dZ>80 then table.remove(dZ,1)end
end local function gg(pl)if type(pl)~="string"then return""end return(pl:lower():gsub("[^%w]",""))end local function W(yX)
local pm=gg(yX)local jD=pm:gsub("butter$","")if jD==""then jD=pm end return jD end local function aP(jE)if type(jE)~="string"then return false end
local jF=W(jE)if jF==""then return false end if q.isLimited and q.isLimited(jE)then return q.limitedHere()end
if q.want then return q.want(jF)end return e.Targets[jF]==true end local function yY(d1)d1=d1:lower()return d1:find("squishy",1,true)~=nil or d1:match("butter$")~=nil or d1:match("butter[^%a]")~=nil
end local jG={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function av(d2)if type(d2)~="number"then return"?"end
local gh=1 while math.abs(d2)>=1000 and gh<#jG do d2=d2/1000 gh=gh+1 end local yZ=string.format("%.2f",d2):gsub("%.?0+$","")
return yZ..jG[gh]end local function y0(pn)if type(pn)~="string"then return nil end local y1,d3=pn:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jH=tonumber(y1)if not jH then return nil end if d3==""then return jH end local y2={qd="qa",qn="qi"}d3=y2[d3:lower()]or d3
for y3,y4 in ipairs(jG)do if y4:lower()==d3:lower()then return jH*1000^(y3-1)end end return nil end local function bk()
local jI=K:FindFirstChild("MoneyValue")if jI and type(jI.Value)=="number"then return jI.Value end local po=K:GetAttribute("BoardValueMoney")
if type(po)=="number"then return po end local pp=K:FindFirstChild("leaderstats")if pp then for JP,y5 in ipairs({"Cash","Money","Coins"})do
local jJ=pp:FindFirstChild(y5)if jJ and type(jJ.Value)=="number"then return jJ.Value end end end end local function gi(y6)
local jK=y6:GetFullName()if c.plot then local jL=c.plot:GetFullName()if jK:sub(1,#jL)==jL then return jK:sub(#jL+2)end
end return jK end local function aq()local gj=K.Character if gj and gj:FindFirstChild("HumanoidRootPart")then
local pq=gj:FindFirstChildOfClass("Humanoid")if pq and pq.Health>0 then return gj end end end local function bF()
local jM=ak:FindFirstChild("Plots")if not jM then return nil end local function ps(y7)local pt=y7:FindFirstChild("Plate")
return pt~=nil and pt:FindFirstChild("EditStackAttachment",true)~=nil end local pu=K:GetAttribute("PlotNumber")
if pu~=nil then local jN=jM:FindFirstChild(tostring(pu))if jN and ps(jN)then return jN end end for JQ,pv in ipairs(jM:GetChildren())do
if ps(pv)then return pv end end end local function d4(pw)local bG=pw and pw.Parent for JR=1,6 do if not bG then return nil end
if bG:IsA("BasePart")then return bG end if bG:IsA("Model")then return bG.PrimaryPart or bG:FindFirstChildWhichIsA("BasePart",true)end
bG=bG.Parent end end local function px(py)local jO=py.Parent if jO and jO:IsA("Attachment")then return jO.WorldPosition end
local pz=d4(py)return pz and pz.Position end local function pA()local c2=c.plot and c.plot:FindFirstChild("Plate")
if not c2 then return nil end if c2:IsA("BasePart")then return c2 .Position end if c2:IsA("Model")then return c2:GetPivot().Position end
local pB=c2:FindFirstChildWhichIsA("BasePart",true)return pB and pB.Position end local function pC()local jP={}
local pD=c.plot and c.plot:FindFirstChild("WaxStations")if pD then for JS,y8 in ipairs(pD:GetChildren())do local pE=y8:FindFirstChild("SquishyPlaceHolder")
local jQ=pE and pE:FindFirstChild("PlacePrompt")if jQ and jQ:IsA("ProximityPrompt")then jP[#jP+1]=jQ end end end
return jP end local function gk()local pF,jR=pC(),0 for JT,y9 in ipairs(pF)do if y9 .Enabled then jR=jR+1 end end
local jS=#pF local jT=K:GetAttribute("WaxStations")if type(jT)=="number"and jT>jS then jS=jT end return jR,jS
end local function y_()local pG=aq()local pH=pG and pG.HumanoidRootPart.Position local jU,pI for JU,jV in ipairs(pC())do
if jV.Enabled then local pJ=px(jV)local pK=(pJ and pH)and(pJ-pH).Magnitude or 1e9 if not jU or pK<pI then jU,pI=jV,pK end
end end return jU end local function pL()local gl=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not gl then return nil end local pM=gl:FindFirstChild("BuyPromptAttachment")local gm=(pM and pM:FindFirstChild("BuyPrompt"))or gl:FindFirstChild("BuyPrompt",true)
if gm and gm:IsA("ProximityPrompt")and gm:IsDescendantOf(gl)then return gm end end local pN={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local za={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local al={order={},price={},dirty=false}local M={seen={},at=0,boxes={},built=0}local ae={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jW="SAB_order.txt"local function gn()if not al.dirty or type(writefile)~="function"then return end local aG={}
for zb,zc in pairs(al.price)do aG[#aG+1]="P|"..zb.."|"..string.format("%.0f",zc)end for zd,ze in pairs(al.order)do aG[#aG+1]="O|"..zd.."|"..table.concat(ze,",")end
if j.learned and j.enc then aG[#aG+1]="M|mode|"..tostring(j.learned.mode or"")for zf,go in ipairs(j.learned.seq)do
local pO={}for pP=1,go.n do pO[pP]=j.enc(go.args[pP])end aG[#aG+1]=("A|%d|%s|%d|%s"):format(zf,go.m,go.n,table.concat(pO,";"))
end end local function jX(zg,zh,gp)local pQ={}for pR=1,gp.n do pQ[pR]=j.enc(gp.args[pR])end aG[#aG+1]=("R|%d|%s|%s|%d|%s"):format(zh,zg,gp.m,gp.n,table.concat(pQ,";"))
end if j.enc then for zi,zj in ipairs(E.rec.rules)do jX("rules",zi,zj)end if E.rec.on then jX("on",0,E.rec.on)end
if E.rec.off then jX("off",0,E.rec.off)end end for JV,d5 in pairs(M.seen)do aG[#aG+1]=("K|%s|%s|%s|%s"):format(d5 .name,d5 .title or"",d5 .rar or"",d5 .price and string.format("%.0f",d5 .price)or"")
end if pcall(writefile,jW,table.concat(aG,"\n"))then al.dirty=false end end local function zk()if type(isfile)~="function"or type(readfile)~="function"then return end
local zl,zm=pcall(isfile,jW)if not(zl and zm)then return end local zn,pS=pcall(readfile,jW)if not(zn and type(pS)=="string")then return end
for zo in pS:gmatch("[^\n]+")do local c3,c4,bl=zo:match("^(%a)|([^|]+)|(.*)$")if c3=="P"then al.price[c4]=tonumber(bl)
elseif c3=="M"then j.loadMode=(bl~=""and bl~="nil")and bl or nil elseif c3=="A"and j.dec then local pT=tonumber(c4)
local pU,gq,zp=bl:match("^([^|]+)|(%d+)|(.*)$")if pT and pU then gq=tonumber(gq)local pV,gr={},0 for zq in(zp..";"):gmatch("([^;]*);")do
gr=gr+1 if gr<=gq then pV[gr]=j.dec(zq)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pT]={m=pU,n=gq,args=pV}end elseif c3=="R"and j.dec then
local pW=tonumber(c4)local gs,zr,gt,zs=bl:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pW and gs then gt=tonumber(gt)
local pX,gu={},0 for zt in(zs..";"):gmatch("([^;]*);")do gu=gu+1 if gu<=gt then pX[gu]=j.dec(zt)end end local jY={m=zr,n=gt,args=pX}
if gs=="rules"then E.rec.rules[pW]=jY elseif gs=="on"then E.rec.on=jY elseif gs=="off"then E.rec.off=jY end end
elseif c3=="K"then local pY,pZ,zu=bl:match("^([^|]*)|([^|]*)|(.*)$")M.seen[M.key(c4)]={name=c4,title=pY~=""and pY or nil,
rar=pZ~=""and pZ or nil,price=tonumber(zu)}elseif c3=="O"and bl~=""then local gv={}for zv in bl:gmatch("[^,]+")do gv[#gv+1]=zv end
if#gv>0 then al.order[c4]=gv end end end end local function zw(gw)if type(gw)~="table"then return end local ce,p0=gw.rarity,gw.contents
if type(ce)~="string"or ce==""or type(p0)~="table"then return end local d6={}for JW,gx in ipairs(p0)do if type(gx)=="table"and type(gx.butter)=="string"then
d6[#d6+1]={n=gx.butter,ch=tonumber(gx.chance)or 0}end end if#d6==0 then return end table.sort(d6,function(zx,zy)return zx.ch>zy.ch end)
local d7,d8={},false for zz,zA in ipairs(d6)do d7[zz]=zA.n end local jZ=al.order[ce]if not jZ or#jZ~=#d7 then d8=true end
if not d8 then for p1=1,#d7 do if jZ[p1]~=d7[p1]then d8=true break end end end al.order[ce]=d7 local j0=tonumber(gw.price)
if j0 and al.price[ce]~=j0 then al.price[ce]=j0 d8=true end if d8 then al.dirty=true ae.at=0 D("learned the "..ce.." order from its crate")
end end local function c5(zB,zC)local zD=zB:FindFirstChild(zC,true)local zE,j1=pcall(function()return zD.Text end)
return(zE and type(j1)=="string"and j1~="")and j1 or nil end local function am(p2)return ae.pretty[p2]or p2 end
M.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function M.key(zF)return gg(zF or"")end
function M.learn(bm)if type(bm)~="table"or type(bm.name)~="string"then return end local j2=M.key(bm.name)local bn=M.seen[j2]or{}
local zG=(M.seen[j2]==nil)or(tonumber(bm.price)and bn.price~=tonumber(bm.price))bn.name,bn.title=bm.name,bm.title or bn.title
bn.rar,bn.price=bm.rarity or bn.rar,tonumber(bm.price)or bn.price M.seen[j2]=bn if zG then M.at,al.dirty=z(),true end
end function M.wanted(p3)if p3==nil then return false end local j3=M.key(p3)return e.CrateTicks[j3]==true or(e.BestCrate and q.bestCrate~=nil and(j3==q.bestCrate or j3==q.bestCrateTitle))
end function M.list()local c6={}for zH,gy in ipairs(M.base)do c6[M.key(gy[1])]={name=gy[1],title=gy[2],rar=gy[3],i=zH}end
for JX,d9 in ipairs(ae.rarOrder)do local p4=false for JY,zI in pairs(c6)do if zI.rar==d9 then p4=true break end end
if not p4 and d9~="?"then local p5=d9:gsub("[^%w]","").."Crate"c6[M.key(p5)]={name=p5,title=d9 .." Crate",rar=d9,i=50,guess=true}
end end for p6,gz in pairs(M.seen)do local a8=c6[p6]or{i=100}a8 .name,a8 .title,a8 .rar=gz.name or a8 .name,gz.title or a8 .title,gz.rar or a8 .rar
a8 .price,a8 .guess=gz.price or a8 .price,nil c6[p6]=a8 end local d_,gA={},{}for zJ,zK in ipairs(pN)do d_[zK]=zJ end
for zL,p7 in ipairs(ae.rarOrder)do d_[p7]=d_[p7]or(20+zL)end for zM,ea in pairs(c6)do ea.k=zM ea.price=ea.price or al.price[ea.rar or""]
gA[#gA+1]=ea end table.sort(gA,function(cf,cg)if cf.price and cg.price and cf.price~=cg.price then return cf.price<cg.price end
local p8,p9=d_[cf.rar or""]or 99,d_[cg.rar or""]or 99 if p8~=p9 then return p8<p9 end if(cf.i or 100)~=(cg.i or 100)then return(cf.i or 100)<(cg.i or 100)end
return cf.k<cg.k end)return gA end local function zN()local p_=ag:FindFirstChild("Assets")local qa=p_ and p_:FindFirstChild("Squishies")
if not qa then return false end local j4,qb,c7={},{},{}local gB=0 for JZ,gC in ipairs(qa:GetChildren())do local eb=W(gC.Name)
if eb~=""and not j4[eb]then local gD=c5(gC,"RarityText")or"?"j4[eb]=gD qb[eb]=c5(gC,"NameText")or gC.Name c7[gD]=c7[gD]or{}
table.insert(c7[gD],eb)gB=gB+1 end end if gB==0 then return false end for qc,zO in pairs(c7)do local qe=al.order[qc]or za[qc]
local j5={}if qe then for zP,zQ in ipairs(qe)do j5[W(zQ)]=zP end end table.sort(zO,function(qf,qg)local j6,j7=j5[qf],j5[qg]
if j6 and j7 then return j6<j7 end if j6 then return true end if j7 then return false end return am(qf)<am(qg)
end)end local j8={}for zR,zS in ipairs(pN)do j8[zS]=zR end local gE,cj={},{}for zT in pairs(c7)do gE[#gE+1]=zT end
pcall(function()for zU,zV in ipairs(require(ag.Modules.SquishyRNG).Keys)do cj[zV]=zU end end)table.sort(gE,function(c8,c9)
if cj[c8]and cj[c9]and cj[c8]~=cj[c9]then return cj[c8]<cj[c9]end local j9,j_=al.price[c8],al.price[c9]if j9 and j_ and j9~=j_ then return j9<j_ end
local ka,kb=j8[c8],j8[c9]if ka and kb then return ka<kb end if ka then return true end if kb then return false end
return c8<c9 end)ae.rar,ae.pretty,ae.members,ae.rarOrder,ae.n,ae.at=j4,qb,c7,gE,gB,z()return true end local function kc()
if ae.at==0 or(z()-ae.at)>120 then pcall(zN)end return ae.n>0 end local function zW(zX)local qh=W(zX)return ae.rar[qh]or(ab.name and W(ab.name)==qh and ab.rar)or"?"
end local function zY()local gF={}local zZ=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for z0,z1 in pairs(zZ)do if z1 then gF[#gF+1]=am(z0)end end
table.sort(gF)return gF end local ar={dir="SAB",cfg="SAB/configs",auto="SAB/autoload_"..K.Name..".txt",autoOld="SAB/autoload.txt",
exec="autoexec/SAB_autoload.lua"}local function qi()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gG(qj)if type(makefolder)~="function"then return end local z2,z3=pcall(isfolder,qj)if not(z2 and z3)then pcall(makefolder,qj)end
end local function ec(qk)if type(isfile)~="function"or type(readfile)~="function"then return nil end local z4,z5=pcall(isfile,qk)
if not(z4 and z5)then return nil end local z6,z7=pcall(readfile,qk)return z6 and z7 or nil end local function gH(z8,z9)
if type(writefile)~="function"then return false end return(pcall(writefile,z8,z9))end local function ql(z_)local ed={}
if type(listfiles)~="function"then return ed end local Aa,qm=pcall(listfiles,z_)if not Aa or type(qm)~="table"then return ed end
for J0,Ab in ipairs(qm)do ed[#ed+1]=tostring(Ab)end return ed end local function qo()local gI={}for J1,Ac in ipairs(ql(ar.cfg))do
local qp=Ac:match("([^/\\]+)%.txt$")if qp then gI[#gI+1]=qp end end table.sort(gI)return gI end local function Ad()
local ac={"V|1"}ac[#ac+1]="N|Every|"..tostring(e.Every)ac[#ac+1]="N|GlazeLead|"..tostring(e.GlazeLead)ac[#ac+1]="N|FpsCap|"..tostring(e.FpsCap)
ac[#ac+1]="N|MemLimit|"..tostring(e.MemLimit)ac[#ac+1]="N|Best|"..tostring(e.Best or 0)for J2,qq in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ac[#ac+1]="S|"..qq.."|"..e[qq]end
do local gJ={}for Ae,gK in pairs(e.Pets)do local qr=(gK.b and"b"or"")..(gK.g and"g"or"")..(gK.w and"w"or"")..(tonumber(gK.f)==-1 and"k"or"")
if qr~=""then gJ[#gJ+1]=Ae.."|"..qr end end table.sort(gJ)ac[#ac+1]="P|-"for J3,Af in ipairs(gJ)do ac[#ac+1]="P|"..Af end
end for J4,qs in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
ac[#ac+1]="B|"..qs.."|"..(e[qs]and"1"or"0")end local kd=K:GetAttribute("AutoRollRules")if type(kd)=="string"and kd~=""then e.ARrules,e.ARstop=kd,tostring(K:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then ac[#ac+1]="S|rules|"..e.ARrules ac[#ac+1]="S|stop|"..e.ARstop end if c.winPos then ac[#ac+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ac[#ac+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for J5,ke in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gL={}for Ag,Ah in pairs(ke[2])do if Ah then gL[#gL+1]=Ag end end table.sort(gL)ac[#ac+1]=ke[1].."|-"for J6,Ai in ipairs(gL)do ac[#ac+1]=ke[1].."|"..Ai end
end return table.concat(ac,"\n")end local function Aj(kf)if type(kf)~="string"or kf==""then return false end local qt,qu,qv,qw,ee={},false,{},false,nil
for Ak in kf:gmatch("[^\n]+")do local aH,ai,aB=Ak:match("^(%a)|([^|]*)|?(.*)$")if aH=="N"and ai=="Every"then local kg=tonumber(aB)
if kg and kg>=1 then e.Every=math.floor(kg)end elseif aH=="N"and(ai=="FpsCap"or ai=="MemLimit")then local kh=tonumber(aB)
if kh and kh>=0 then e[ai]=math.floor(kh)end elseif aH=="N"and ai=="Best"then local gM=tonumber(aB)if gM and gM>=0 and gM<=4 then e.Best=math.floor(gM)end
elseif aH=="N"and ai=="GlazeLead"then local gN=tonumber(aB)if gN and gN>=5 and gN<=600 then e.GlazeLead=math.floor(gN)end
elseif aH=="S"and(ai=="TeamNormal"or ai=="TeamFull"or ai=="TeamGlaze"or ai=="TeamWax")then e[ai]=aB elseif aH=="P"and ai~=""then
if not ee then ee={}end if ai~="-"and aB~=""then ee[ai]={b=aB:find("b",1,true)and true or nil,g=aB:find("g",1,true)and true or nil,
w=aB:find("w",1,true)and true or nil,f=aB:find("k",1,true)and-1 or nil}end elseif aH=="B"then if e[ai]~=nil then e[ai]=(aB=="1")end
elseif aH=="S"and ai=="rules"then e.ARrules=aB elseif aH=="S"and ai=="stop"then e.ARstop=aB elseif aH=="W"then
c.winPos={tonumber(ai)or 10,tonumber(aB)or 44}elseif aH=="G"then c.togPos={tonumber(ai)or 10,tonumber(aB)or 300}
elseif aH=="T"and ai~=""then if ai~="-"then qt[ai]=true end qu=true elseif aH=="K"and ai~=""then if ai~="-"then qv[ai]=true end
qw=true end end if qu then e.Targets=qt end if qw then e.CrateTicks=qv end if ee then e.Pets=ee end return true
end local function ef(c_)if not qi()then return false,"this executor cannot write files"end c_=(c_ or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c_==""then return false,"give the config a name"end gG(ar.dir)gG(ar.cfg)if not gH(ar.cfg.."/"..c_..".txt",Ad())then return false,"could not write the file"end
c.config=c_ return true,c_ end local function ki(gO)local qx=ec(ar.cfg.."/"..gO..".txt")if not qx then return false,"no config called "..tostring(gO)end
if not Aj(qx)then return false,"that config looks empty"end c.config=gO return true,gO end local function kj(qy)
gG(ar.dir)gH(ar.auto,qy or"")c.autoload=qy end local function Al()if c.selfPath then return c.selfPath end local gP
for J7,Am in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ar.dir})do for J8,qz in ipairs(ql(Am))do local kk=qz:lower()
if kk:sub(-4)==".lua"and(kk:find("sab_farm",1,true)or kk:find("sab farm",1,true))then gP=gP or qz end end end
c.selfPath=gP return gP end ar.stub=[[
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
local function An()if not qi()then return false,"this executor cannot write files"end gG("autoexec")if not gH(ar.exec,ar.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gQ=(function()local Ao,Ap=pcall(function()return game:GetService("TeleportService")end)return Ao and Ap or nil end)()
local function qA()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local Aq=queueonteleport or queue_on_teleport return(pcall(Aq,ar.stub))end local function eg(Ar)if c.rejoining then return end
c.rejoining=true D("REJOIN ("..Ar..")")pcall(gn)if c.autoload then pcall(ef,c.autoload)end local As=qA()D(As and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for J9=1,30 do if not gQ then break end pcall(function()gQ:Teleport(game.PlaceId,K)end)task.wait(10)
end end)end local function At()local Au,qB=pcall(function()return game:GetService("GuiService")end)if Au and qB then
pcall(function()V(qB.ErrorMessageChanged:Connect(function()if e.Rejoin then eg("roblox error message")end end))
end)end pcall(function()local qC=game:GetService("CoreGui")local qD=qC and qC:WaitForChild("RobloxPromptGui",15)
local qE=qD and qD:WaitForChild("promptOverlay",15)if qE then V(qE.ChildAdded:Connect(function(Av)if e.Rejoin and tostring(Av.Name):lower():find("errorprompt",1,true)then eg("disconnect prompt")end
end))end end)if gQ then pcall(function()V(gQ.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()eg("teleport retry")end)end
end))end)end end local function qF(Aw)local qG=c.plot and c.plot:FindFirstChild(Aw)if not qG then return nil,false end
for J_,kl in ipairs(qG:GetChildren())do if kl:IsA("Model")or kl:IsA("BasePart")then return kl,true end end return nil,true
end local function ck()local bH=qF("RolledSquishy")if not bH then return nil end return{model=bH,name=bH.Name,pretty=c5(bH,"NameText")or am(W(bH.Name)),
rar=c5(bH,"RarityText")or zW(bH.Name),price=c5(bH,"PriceText")}end local function qH(km)return type(km)=="string"and(ae.rar[W(km)]~=nil or yY(km))
end local function ad()local kn=qF("SquishyEquipped")if kn then c.carrySrc,j.heldAt="model",z()return kn.Name,kn end
local qI=K.Character if qI then for Ka,eh in ipairs(qI:GetDescendants())do if(eh:IsA("Model")or eh:IsA("Tool"))and qH(eh.Name)then
c.carrySrc,j.heldAt="character",z()return eh.Name,eh end end end local gR=K:GetAttribute("SquishyEquipped")if type(gR)=="string"and gR~=""and qH(gR)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gR,nil end c.carrySrc=nil end local function Kb()local Kc,Ax=ad()return Ax end local function cl()
local ei=ck()local gS=ei and y0(ei.price)local gT=bk()if gS and gT and gT<gS then return gT,gS end if ei and type(ei.price)=="string"and ei.price:find("%d")and not gS then return gT or 0,math.huge end
end local function cm(Ay)d0[#d0+1]=os.date("%H:%M:%S").." "..Ay if#d0>40 then table.remove(d0,1)end end local function Az(cn,gU)
if type(cn)~="string"then return end cm(("Roll(%s,%s)"):format(cn,tostring(gU)))if cn:lower():find("crate",1,true)then
j.rolled,j.rolledAt=cn,z()return end ab.seq=ab.seq+1 ab.name,ab.at=cn,z()ab.rar=type(gU)=="string"and gU or nil
c.rolls=c.rolls+1 if aP(cn)then D(("ROLL %s [%s] = TARGET"):format(cn,tostring(gU)))end end local function AA(co)
if type(co)~="table"then return end local gV=co.butter or co.itemName if type(gV)~="string"then return end c.gifts=c.gifts+1
ab.gift,ab.giftAt=gV,z()if type(co.giftId)=="string"then local qJ=ag:FindFirstChild("Remotes")local qK=qJ and qJ:FindFirstChild("GiftThanks")
if qK then pcall(function()qK:FireServer(co.giftId)end)end end cm("Gift("..gV.." from "..tostring(co.fromName)..")")
D(("GIFT from %s: %s - it will not be waxed"):format(tostring(co.fromName),gV))end local function AB()local qL=ag:WaitForChild("Remotes",30)
if not c.alive then return end if not qL then D("Remotes folder missing - no roll events")return end V(K:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local qM=K:GetAttribute("SquishyEquipped")if type(qM)=="string"and qM~=""then j.heldAt=z()end end))local AH={
SquishyRollAnimation=Az,InitSquishy=function(qN)ab.init,ab.initAt=tostring(qN),z()cm("Init("..tostring(qN)..")")end,
CrateUpdate=function(da,qO)pcall(zw,da)pcall(M.learn,da)if type(da)=="table"then local AC=qO==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not AC then return end local AD=not j.waiting local AE=j.on j.waiting,j.data,j.at=true,da,z()j.on=(qO==true)
j.title=tostring(da.title or da.name or"crate")if j.on and not AE then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cm("CrateWindow open("..j.title..")")elseif AD then cm("Crate waiting("..j.title..")")D(j.title.." is waiting on your stand")
end else if j.waiting then cm("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local AF=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,AF)end if j.classify then local AG=z()
task.spawn(function()pcall(j.classify,AG)end)end end end,GiftReceived=AA,}for gW,AI in pairs(AH)do local ko=qL:FindFirstChild(gW)
if ko and ko:IsA("RemoteEvent")then V(ko.OnClientEvent:Connect(AI))elseif gW~="CrateUpdate"and gW~="GiftReceived"then D("remote "..gW.." missing")end
end end local function kp()local cp=ck()if cp then if aP(cp.name)then return{state="match",shown=cp.pretty,src="pad",info=cp}
end return{state="skip",info=cp,level="idle",text=("on pad: %s [%s] - not ticked"):format(cp.pretty,tostring(cp.rar))}
end if ab.name and(z()-ab.at)<4 then if aP(ab.name)then return{state="match",shown=am(W(ab.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(am(W(ab.name)),tostring(ab.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gX(AJ,AK,AL,AM)
local gY=RaycastParams.new()gY.FilterType=Enum.RaycastFilterType.Exclude local kq={K.Character}for Kd,AN in ipairs(AM or{})do kq[#kq+1]=AN end
gY.FilterDescendantsInstances=kq pcall(function()gY.RespectCanCollide=true end)local qP=ak:Raycast(Vector3 .new(AJ,AK+4,AL),Vector3 .new(0,-30,0),gY)
return qP and qP.Position or nil end local function db(qQ)local qR=qQ:FindFirstChildOfClass("Humanoid")return((qR and qR.HipHeight)or 2)+qQ.HumanoidRootPart.Size.Y/2+0.2
end local function kr(AO,AP)local ks=AO:FindFirstChildOfClass("Humanoid")local AQ=z()while z()-AQ<AP do if ks and(ks.FloorMaterial~=Enum.Material.Air or ks.SeatPart)then return true end
ah(0.05)end return false end local function aE(AS,kt,ku)local qS=AS.HumanoidRootPart qS.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qS.CFrame=ku and CFrame.new(kt,Vector3 .new(ku.X,kt.Y,ku.Z))or CFrame.new(kt)end local function cq(bo,qT)local cr=aq()
if not cr or not bo then return false end local bI=bo.Position local gZ=math.clamp(math.max(bo.Size.X,bo.Size.Z)/2+2.2,3,7)
local qU=(qT and qT.MaxActivationDistance)or 10 if gZ>qU-2 then gZ=math.max(2.5,qU-2)end local ej={}local function cs(ek)
ek=Vector3 .new(ek.X,0,ek.Z)if ek.Magnitude>0.05 then ej[#ej+1]=ek.Unit end end local qV=pA()if qV then cs(qV-bI)end
cs(bo.CFrame.LookVector)cs(-bo.CFrame.LookVector)cs(bo.CFrame.RightVector)cs(-bo.CFrame.RightVector)cs(cr.HumanoidRootPart.Position-bI)
if#ej==0 then cs(Vector3 .new(0,0,1))end local AT,g0=db(cr),false for Ke,AU in ipairs(ej)do local g1=bI+AU*gZ
local kv=gX(g1 .X,bI.Y,g1 .Z,{bo})if kv and math.abs(kv.Y-bI.Y)<14 then aE(cr,Vector3 .new(g1 .X,kv.Y+AT,g1 .Z),bI)
if kr(cr,0.7)then g0=true break end end end if not g0 then aE(cr,bI+ej[1]*gZ+Vector3 .new(0,3,0),bI)g0=kr(cr,1)
end ah(0.12)return g0 end local function qW(el)if not el.Parent or not el.Enabled then return false end pcall(function()el:InputHoldBegin()end)
ah(math.max(el.HoldDuration,0)+0.08)pcall(function()el:InputHoldEnd()end)return true end local function ao(qX,AV)
local AW=z()while z()-AW<AV do if qX()then return true end ah(0.05)end return qX()end local function em(dc,AX,qY,AY)
local AZ=c.zapFirst and{"zap","hold"}or{"hold","zap"}for A0,kw in ipairs(AZ)do if A0==2 and(AY or not(dc.Parent and dc.Enabled and(not qY or qY())))then break end
local kx if kw=="hold"then kx=qW(dc)else kx=type(fireproximityprompt)=="function"and dc.Parent~=nil and dc.Enabled and pcall(fireproximityprompt,dc)end
if kx and ao(AX,1.2)then c.zapFirst=(kw=="zap")return true,kw end end return false end local function qZ(ky)local bJ=pL()
if not bJ or not bJ.Enabled then D("buy: nothing on the pad")return false end do local q0,q1=cl()if q0 then c.cashFails=(c.cashFails or 0)+1
c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("not buying: have $%s, price %s"):format(av(q0),q1==math.huge and"unreadable"or("$"..av(q1))))
return false end end local kz=d4(bJ)if not kz then D("buy: pad part missing")return false end c.lastBuyAt=z()
local A1,q2=ab.seq,bk()local q3=aq()local A2=q3 and(q3 .HumanoidRootPart.Position-kz.Position).Magnitude>12 cq(kz,bJ)
if A2 then ah(0.4)end if not bJ.Enabled then D("buy aborted: pad emptied")return false end local dd=kp()if not ky and dd.state~="match"then
D("buy aborted: "..(dd.text or"pad changed"))c.matchSince=nil return false end local kA=dd.info and dd.info.name or(dd.state=="match"and ab.name)or nil
local function A3()return bJ.Enabled and ad()==nil and(ky or kp().state=="match")end local A4,A5=em(bJ,function()
return ad()~=nil or((not bJ.Enabled)and(ky or ab.seq==A1))end,A3,cl()~=nil)if A4 then ao(function()return ad()~=nil end,0.8)
local en=ad()local q4=bk()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0 c.matchSince=nil ab.name,ab.rar,ab.at=nil,nil,z()
D(("BOUGHT %s%s via %s"):format(en and am(W(en))or(dd.shown or"?"),(q2 and q4)and(" for $"..av(q2-q4))or"",A5))
if en and kA and W(en)~=W(kA)then D(("note: picked up %s, not %s"):format(en,kA))end return true end local g2=ck()
if cl()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("BUY REFUSED: cash short - have $%s, price %s"):format(av(bk()),(g2 and g2 .price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)D(("buy did not go through (%s, try %d) - again in %ds"):format(g2 and g2 .price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function q5()local eo=ad()if not eo then c.holding=false D("place: hands are empty")
return false end if not aP(eo)then D(("REFUSED TO WAX %s - it is not ticked"):format(am(W(eo))))return false end
for Kf=1,e.PlaceTries do local bK=y_()if not bK then D("place: no free station")break end local q6=d4(bK)if q6 then
cq(q6,bK)local q7=ad()if not q7 then c.holding=false D("place: hands emptied on the way")return false end if not aP(q7)then D("place: what I carry changed, not waxing it")return false end
if bK.Enabled then local A6,A7=em(bK,function()return not bK.Enabled end,function()return bK.Enabled end)if A6 then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 ab.name,ab.rar,ab.at=nil,nil,z()
D(("WAXED %s #%d at %s via %s"):format(am(W(eo)),c.placed,bK.Parent.Parent.Name,A7))if q.placed then pcall(q.placed,eo)end
return true end end end ah(0.25)end c.placeFails=c.placeFails+1 if ad()==nil then c.holding=false end D("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ad()))D(c.capMsg)end return false end function A.place()local A8=z()while c.alive and A.editing and z()-A8<25 do ah(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local A9=z()while c.alive and A.current()~=e.TeamWax and z()-A9<5 do ah(0.1)end
if A.current()==e.TeamWax then ah(0.3)else D("wax team did not come on in time - placing anyway")end end local A_,q8=pcall(q5)
A.placing=false if not A_ then error(q8,0)end return q8 end local function q9(q_)return type(q_)=="string"and q_:lower():find("crate",1,true)~=nil
end local Ba={SABFarmGui=1,SABToggle=1,SABError=1}local function kB(Bb)local bL=Bb while bL do if Ba[bL.Name]then return false end
if bL:IsA("ScreenGui")then local Bc,Bd=pcall(function()return bL.Enabled end)return(not Bc)or Bd~=false end if bL:IsA("GuiObject")and not bL.Visible then return false end
bL=bL.Parent end return false end local function g3(g4)local de=""pcall(function()if g4:IsA("TextButton")then de=g4 .Text end end)
if not de:find("%a")then for Kg,g5 in ipairs(g4:GetDescendants())do if(g5:IsA("TextLabel")or g5:IsA("TextButton"))and g5 .Text:find("%a")then de=g5 .Text break end
end end if not de:find("%a")then de=g4 .Name end return(de:lower():gsub("[^%a]",""))end local function Be()local ep,eq
local ra=K:FindFirstChildOfClass("PlayerGui")if not ra then return nil,nil end for Kh,er in ipairs(ra:GetDescendants())do
if er:IsA("GuiButton")and kB(er)then local kC=g3(er)if kC:sub(1,4)=="open"and not kC:find("shop",1,true)then ep=ep or er end
if kC:sub(1,7)=="discard"then eq=eq or er end end end if ep and eq then return ep,eq end if j.on then return ep,eq end
return nil,nil end local kD=(function()local Bf,Bg=pcall(function()return game:GetService("VirtualInputManager")end)return Bf and Bg or nil end)()
local function rb(bp,kE)local kF={}local function rc(Bh)kF[#kF+1]=Bh end if c.tapWay then rc(c.tapWay)end for Ki,rd in ipairs({"touch","conn","signal"})do
if rd~=c.tapWay then rc(rd)end end local function rf(Bi,...)local Bj,kG=pcall(getconnections,Bi)if not(Bj and type(kG)=="table"and#kG>0)then return false end
local rg,Bk,Bl=false,{...},select("#",...)for Kj,Bm in ipairs(kG)do if pcall(function()Bm:Fire(table.unpack(Bk,1,Bl))end)then rg=true end
end return rg end local function rh()local ri=Vector3 .new(0,0,0)pcall(function()local rj,rk=bp.AbsolutePosition,bp.AbsoluteSize
ri=Vector3 .new(rj.X+rk.X/2,rj.Y+rk.Y/2,0)end)local kH={Position=ri,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kH.UserInputType=Enum.UserInputType.Touch end)pcall(function()kH.UserInputState=Enum.UserInputState.End end)
return kH end for Kk,bq in ipairs(kF)do local es=false if bq=="conn"and type(getconnections)=="function"then if rf(bp.MouseButton1Click)then
es=true if ao(kE,1.5)then c.tapWay=bq return true,bq end end es=rf(bp.Activated,rh(),1)elseif bq=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bp.MouseButton1Click)then if ao(kE,1.5)then c.tapWay=bq return true,bq end end es=pcall(firesignal,bp.Activated,rh(),1)
elseif bq=="touch"and kD then es=pcall(function()local rl,rm=bp.AbsolutePosition,bp.AbsoluteSize local rn=0 local ro=bp:FindFirstAncestorWhichIsA("ScreenGui")
local Bn,Bo=pcall(function()return ro and ro.IgnoreGuiInset end)if not(Bn and Bo)then pcall(function()rn=game:GetService("GuiService"):GetGuiInset().Y end)
end local rp,rq=rl.X+rm.X/2,rl.Y+rm.Y/2+rn kD:SendMouseButtonEvent(rp,rq,0,true,game,1)task.wait(0.06)kD:SendMouseButtonEvent(rp,rq,0,false,game,1)
end)end if es and ao(kE,1.5)then c.tapWay=bq return true,bq end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kI(rr)local et=rr.Parent while et and et~=c.plot do if j.NOT[et.Name]then return false end et=et.Parent
end local kJ=(rr.ActionText or""):lower()if kJ:find("roll",1,true)or kJ:find("place",1,true)or kJ:find("sell",1,true)then return false end
return true end local function rs()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local rt=c.plot:FindFirstChild("CrateStand")local eu if rt then for Kl,g6 in ipairs(rt:GetDescendants())do
if g6:IsA("ProximityPrompt")and g6 .Enabled and kI(g6)then eu=g6 break end end end if not eu then for Km,bM in ipairs(c.plot:GetDescendants())do
if bM:IsA("ProximityPrompt")and bM.Enabled and kI(bM)then local ru=bM:FindFirstAncestorWhichIsA("Model")local Bp=((bM.ActionText or"").." "..(bM.ObjectText or"").." "..bM.Name.." "..(ru and ru.Name or"")):lower()
if Bp:find("crate",1,true)then eu=bM break end end end end j.prompt=eu return eu end local function kK()if j.on then return true end
local ev=rs()if not ev then j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local rv=d4(ev)if rv then cq(rv,ev)end j.ours=true em(ev,function()return j.on end)if ao(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: pressed "..gi(ev).." but no window came up")
return false end do local function Bq(rw)local df=rw.Parent while df and df:IsA("GuiObject")do local rx,ry=false,false
for Kn,ew in ipairs(df:GetDescendants())do if ew~=rw and ew:IsA("GuiButton")and g3(ew):sub(1,7)=="discard"then rx=true end
if ew:IsA("TextLabel")then local kL=ew.Text:lower()if kL:find("crate",1,true)or kL:find("can contain",1,true)or kL:find("cost",1,true)then ry=true end
end if rx and ry then return df end end df=df.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local rz=K:FindFirstChildOfClass("PlayerGui")if not rz then return nil end for Ko,g7 in ipairs(rz:GetDescendants())do
if g7:IsA("GuiButton")and not g7:FindFirstAncestor("SABFarmGui")and g3(g7):sub(1,4)=="open"then local kM=Bq(g7)
if kM then j.win=kM return kM end end end end local function Br(Bs)for Kp,g8 in ipairs(Bs:GetDescendants())do
if g8:IsA("GuiButton")then local rA,kN=g3(g8),g8 .Name:lower()if rA=="x"or rA=="close"or kN=="x"or kN:find("close",1,true)or kN:find("exit",1,true)then return g8 end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(Bt)task.wait(Bt and 4 or 1.2)if j.on or j.waiting then return end
local g9=j.findWin()if not g9 or not kB(g9)then return end local rB=Br(g9)if rB and rb(rB,function()return not kB(g9)end)then return end
D("the crate window is still open - tap its X")end end local function ex(g_)if not kK()then return false end local rC=z()-(j.openedAt or 0)
if rC<0.6 then ah(0.6-rC)end local kO=j.title local Bu,Bv=Be()local rD=g_ and Bu or Bv if not rD then j.lastFail=z()
c.crateFails=c.crateFails+1 D(("crate: no %s button found in %s"):format(g_ and"Open"or"Discard",kO))return false
end local Bw=ad()local Bx,Kq=rb(rD,function()return(not j.on)or(ad()~=nil and ad()~=Bw)end)if not Bx then j.lastFail=z()
c.crateFails=c.crateFails+1 D("crate: could not press "..(g_ and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if g_ then c.crates=c.crates+1 ao(function()return ad()~=nil end,1.5)local rE=ad()
D(("OPENED %s -> %s"):format(kO,rE and am(W(rE))or"?"))else D("discarded "..kO.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(By,...)local Bz=select("#",...)j.calls[#j.calls+1]={t=z(),m=By,n=Bz,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aI,br)local bN=type(aI)if(bN=="string"or bN=="number")and type(br.data)=="table"then for rF,kP in pairs(br.data)do
if kP==aI and type(rF)=="string"and(type(kP)=="string"or type(kP)=="number")then return{__slot="f:"..rF}end end
end if bN=="string"then if br.crate and aI==br.crate then return{__slot="crate"}end if br.title and aI==br.title then return{__slot="title"}end
if br.rar and aI==br.rar then return{__slot="rarity"}end return aI end if bN=="number"or bN=="boolean"or bN=="nil"then return aI end
if bN=="table"then local rG={}for BA,rH in pairs(aI)do if type(rH)=="table"then return nil,"nested table"end local BB,rI=j.slot(rH,br)
if rI then return nil,rI end rG[BA]=BB end return rG end local BC,BD=pcall(function()return aI:IsA("Instance")end)
if BC and BD then if aI==K then return{__slot="player"}end if c.plot and aI==c.plot then return{__slot="plot"}end
local ha=c.plot and c.plot:FindFirstChild("CrateStand")if ha and aI==ha then return{__slot="stand"}end if ha and aI.Parent==ha then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bN..")"end function j.resolve(hb)if type(hb)~="table"then return hb end
local aX=hb.__slot if aX and aX:sub(1,2)=="f:"then return j.data and j.data[aX:sub(3)]end if aX=="crate"then return j.data and j.data.name end
if aX=="title"then return(j.data and j.data.title)or j.title end if aX=="rarity"then return j.data and j.data.rarity end
if aX=="player"then return K end if aX=="plot"then return c.plot end if aX=="stand"or aX=="model"then local kQ=c.plot and c.plot:FindFirstChild("CrateStand")
if aX=="stand"or not kQ then return kQ end for Kr,rJ in ipairs(kQ:GetChildren())do if q9(rJ.Name)then return rJ end end
return nil end local rK={}for BE,BF in pairs(hb)do rK[BE]=j.resolve(BF)end return rK end function j.classify(kR)
if j.directOff then return end local hc={}for Ks,kS in ipairs(j.calls)do if kS.t<=kR+0.05 and kR-kS.t<=6 then hc[#hc+1]=kS end
end if#hc==0 then return end if not ao(function()return(j.heldAt or 0)>=kR-1 end,2.5)then return end local ey={}
for Kt,ez in ipairs(hc)do local rL={}for rM=1,ez.n do local BG,rN=j.slot(ez.args[rM],ez)if rN then D("crate call has "..rN.." - keeping the button method")
return end rL[rM]=BG end ey[#ey+1]={m=ez.m,n=ez.n,args=rL}end local kT=j.learned j.learned={seq=ey,mode=kT and kT.mode or nil}
al.dirty=true if not kT then D(("learned how to open crates directly (%d call%s)"):format(#ey,#ey==1 and""or"s"))end
end function j.replay()local rO=j.learned local rP=ag:FindFirstChild("Remotes")local kU=rP and rP:FindFirstChild("CrateAction")
if not(rO and kU)then return false end local rQ=table.unpack or unpack j.replaying=true for Ku,eA in ipairs(rO.seq)do
local kV={}for rR=1,eA.n do kV[rR]=j.resolve(eA.args[rR])end task.spawn(function()pcall(function()if eA.m=="InvokeServer"then kU:InvokeServer(rQ(kV,1,eA.n))
else kU:FireServer(rQ(kV,1,eA.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(BH)return(BH:gsub("[%%|;=,\n]",function(BI)return("%%%02X"):format(BI:byte())end))end
function j.enc(ct)local hd=type(ct)if hd=="string"then return"s"..j.esc(ct)end if hd=="number"then return"n"..tostring(ct)end
if hd=="boolean"then return ct and"b1"or"b0"end if hd=="nil"then return"z"end if ct.__slot then return"k"..ct.__slot end
local kW={}for BJ,BK in pairs(ct)do kW[#kW+1]=j.enc(BJ).."="..j.enc(BK)end return"t"..table.concat(kW,",")end
function j.dec(rS)local eB,eC=rS:sub(1,1),rS:sub(2)local function BL(BM)return(BM:gsub("%%(%x%x)",function(BN)return string.char(tonumber(BN,16))end))end
if eB=="s"then return BL(eC)end if eB=="n"then return tonumber(eC)end if eB=="b"then return eC=="1"end if eB=="k"then return{__slot=eC}end
if eB=="t"then local rT={}for BO in eC:gmatch("[^,]+")do local rU,BP=BO:match("^(.-)=(.*)$")if rU then local rV=j.dec(rU)
if rV~=nil then rT[rV]=j.dec(BP)end end end return rT end return nil end function j.goneOrNew(BQ)return function()
if not j.waiting then return true end local rW=ad()return rW~=nil and rW~=BQ end end function j.near()local rX=ag:FindFirstChild("Remotes")
local kX=rX and rX:FindFirstChild("CrateAction")local he=aq()local kY=c.plot and c.plot:FindFirstChild("CrateStand")
local kZ=kY and kY:FindFirstChild("Spot")if not(kX and he and kZ)then D(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kX and"no CrateAction remote"or not he and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local k0=he.HumanoidRootPart local hf=k0 .CFrame local rY,k1=j.title,"no answer"local BR=ad()local rZ=kY:FindFirstChild("Holder")
local function r0()if not rZ then return j.waiting or j.on end for Kv,BS in ipairs(rZ:GetChildren())do if BS:IsA("Model")then return true end end
return false end for BT=1,3 do if not(j.waiting or j.on)or not r0()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(k0 .Position-kZ.Position).Magnitude>8 then cq(kZ,j.prompt)end ah(0.12+0.15*BT)
local a9={}j.replaying=true task.spawn(function()a9 .ok,a9 .v=pcall(function()return kX:InvokeServer("open")end)
a9 .done=true end)ao(function()return a9 .done end,6)j.replaying=false local cu=a9 .v if a9 .done and a9 .ok and type(cu)=="table"and cu.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 D(("OPENED %s -> %s (no window)"):format(rY,cu.prize and am(W(tostring(cu.prize)))or"?"))
ao(function()local r1=ad()return r1~=nil and r1~=BR end,1.5)if(k0 .Position-hf.Position).Magnitude>8 then pcall(function()aE(he,hf.Position,hf.Position+hf.LookVector)end)end
return true,"opened"end k1=(a9 .done and a9 .ok and type(cu)=="table")and tostring(cu.reason or"refused, no reason given")
or(a9 .done and("error: "..tostring(cu))or"no answer in 6s")ah(0.3)if not r0()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 D(("crate: the server would not open %s next to the stand (%s)"):format(rY,k1))
return false,k1 end j.GIVEUP=600 function j.drop()local r2=ag:FindFirstChild("Remotes")local r3=r2 and r2:FindFirstChild("CrateAction")
local r4=c.plot and c.plot:FindFirstChild("CrateStand")local k2=r4 and r4:FindFirstChild("Spot")local r5=aq()
if k2 and r5 and(r5 .HumanoidRootPart.Position-k2 .Position).Magnitude>8 then cq(k2,j.prompt)ah(0.3)end local k3,bs=false,nil
if r3 then k3,bs=pcall(function()return r3:InvokeServer("discard")end)end D(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(k3 and type(bs)=="table"and bs.ok)and"done"or("answer: "..tostring(type(bs)=="table"and(bs.reason or bs.ok)or bs))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(k3 and type(bs)=="table"and bs.ok)then ex(false)end end function j.smart()local k4=j.title if(j.nearFails or 0)<3 then
local BU=j.near()if BU then return true end if j.nearFails>=3 then D("opening next to the stand failed 3 times - trying the older ways")end
end local cv=j.learned if cv then local k5=ad()if j.on then j.replay()if ao(j.goneOrNew(k5),3.5)then c.crates=c.crates+1
D("OPENED "..k4 .." (direct)")return true end else if cv.mode~="window"then j.replay()if ao(j.goneOrNew(k5),3.5)then
c.crates,j.fails=c.crates+1,0 if cv.mode~="direct"then cv.mode,al.dirty="direct",true D("crates now open directly - the window never comes up")
end D("OPENED "..k4 .." (direct, no window)")return true end end if kK()then j.replay()if ao(j.goneOrNew(k5),3.5)then
c.crates,j.fails=c.crates+1,0 if cv.mode~="window"then cv.mode,al.dirty="window",true D("crates need their window up first - it shows briefly")
end D("OPENED "..k4 .." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,al.dirty=cv,nil,true
if j.fails>=3 then j.directOff=true D("direct crate opening failed 3 times - using the button for now")else D("the learned crate call did not work - back to pressing Open")
end end return ex(true)end function E.snap()return{rules=K:GetAttribute("AutoRollRules"),stop=K:GetAttribute("AutoRollStop"),
on=K:GetAttribute("AutoRollOn"),main=K:GetAttribute("AutoRoll")}end E.cache={}function E.watchCache()E.cache=E.snap()
for BV,r6 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(K:GetAttributeChangedSignal(r6):Connect(function()E.cache[BV]=K:GetAttribute(r6)end))
end end function E.isOn()return K:GetAttribute("AutoRollOn")==true end function E.saw(BW,...)local hg=E.cache
local BX={m=BW,n=select("#",...),args={...},before={rules=hg.rules,stop=hg.stop,on=hg.on,main=hg.main}}task.delay(1.5,function()
if c.alive then pcall(E.learnOne,BX)end end)end function E.learnOne(eD)local aC,eE=E.snap(),eD.before local hh=(aC.rules~=eE.rules)or(aC.stop~=eE.stop)
local r7=(aC.on~=eE.on)or(aC.main~=eE.main)if not hh and not r7 then return end local r8={}for r9=1,eD.n do local aQ=eD.args[r9]
local cw=type(aQ)if cw=="string"and aQ~=""and aQ==aC.rules then aQ={__slot="rules"}elseif cw=="string"and aQ~=""and hh and aQ==aC.stop and aC.stop~=eE.stop then aQ={__slot="stop"}
elseif cw=="table"then local r_={}for BY,dg in pairs(aQ)do if type(dg)=="table"or(type(dg)=="userdata")then E.msg="Auto Roll sends something I cannot repeat"return
end r_[BY]=(type(dg)=="string"and dg~=""and dg==aC.rules)and{__slot="rules"}or dg end aQ=r_ elseif cw~="string"and cw~="number"and cw~="boolean"and cw~="nil"then
if aQ==K then aQ={__slot="player"}else E.msg="Auto Roll sends something I cannot repeat"return end end r8[r9]=aQ
end local dh={m=eD.m,n=eD.n,args=r8}if hh then local k6=false for BZ=1,dh.n do local eF=dh.args[BZ]if type(eF)=="table"and eF.__slot=="rules"then k6=true end
if type(eF)=="table"and not eF.__slot then for Kw,sa in pairs(eF)do if type(sa)=="table"and sa.__slot=="rules"then k6=true end end
end end if k6 then E.rec.rules={dh}else table.insert(E.rec.rules,dh)if#E.rec.rules>60 then table.remove(E.rec.rules,1)end
end end if r7 then if aC.on==true then E.rec.on=dh else E.rec.off=dh end e.AutoRoll=(aC.on==true)end if aC.rules and aC.rules~=""then e.ARrules,e.ARstop=aC.rules,aC.stop or""end
al.dirty=true E.msg=""D(("learned an Auto Roll %s message"):format(hh and"choices"or(aC.on and"on"or"off")))end
function E.resolve(di)if type(di)~="table"then return di end if di.__slot=="rules"then return e.ARrules~=""and e.ARrules or K:GetAttribute("AutoRollRules")end
if di.__slot=="stop"then return e.ARstop~=""and e.ARstop or K:GetAttribute("AutoRollStop")end if di.__slot=="player"then return K end
local sb={}for B0,B1 in pairs(di)do sb[B0]=E.resolve(B1)end return sb end function E.replay(sc,B2)local sd=table.unpack or unpack
for Kx,eG in ipairs(B2)do local k7={}for se=1,eG.n do k7[se]=E.resolve(eG.args[se])end E.replaying=true pcall(function()
if eG.m=="InvokeServer"then task.spawn(function()pcall(function()sc:InvokeServer(sd(k7,1,eG.n))end)end)else sc:FireServer(sd(k7,1,eG.n))end
end)E.replaying=false task.wait(0.25)end end function E.apply(sf,B3)if E.busy or not c.alive then return end E.busy=true
pcall(function()local sh=ag:FindFirstChild("Remotes")local k8=sh and sh:FindFirstChild("AutoRollAction")if not k8 then E.msg="this game has no AutoRollAction"return end
local bO=e.AutoRoll if bO and e.ARrules~=""and K:GetAttribute("AutoRollRules")~=e.ARrules then if#E.rec.rules==0 then
E.msg="pick your Auto Roll choices once in the game's menu so I can learn them"D(E.msg)else E.replay(k8,E.rec.rules)
if ao(function()return K:GetAttribute("AutoRollRules")==e.ARrules end,4)then D("Auto Roll choices put back")else
E.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"D(E.msg)end end end if bO==E.isOn()or(not bO and not B3)then return end
local hi=bO and E.rec.on or E.rec.off if not hi then local eH=bO and E.rec.off or E.rec.on local sj=eH~=nil for B4=1,eH and eH.n or 0 do
if type(eH.args[B4])=="boolean"then sj=false end end if sj then hi=eH end end if not hi then E.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bO and"on"or"off")
D(E.msg)return end E.replay(k8,{hi})if ao(function()return E.isOn()==bO end,4)then E.msg=""D(("Auto Roll switched %s%s"):format(bO and"ON"or"OFF",sf and(" ("..sf..")")or""))
else E.msg="Auto Roll did not switch - do it once in the game so I can relearn it"D(E.msg)end end)E.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local B5,B6=pcall(function()return K.UserId end)return B5 and B6 or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local B7,k9=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if B7 and type(k9)=="table"and type(k9 .Pets)=="table"then o.I=k9 end return o.I end function o.order()if o.list then return o.list end
local bP=o.info()if not bP then return{}end local cx={}if type(bP.Order)=="table"and#bP.Order>0 then for Ky,sk in ipairs(bP.Order)do if bP.Pets[sk]then cx[#cx+1]=sk end end
else for B8 in pairs(bP.Pets)do cx[#cx+1]=B8 end table.sort(cx,function(B9,B_)return(bP.Pets[B9].price or 0)<(bP.Pets[B_].price or 0)end)
end o.list=cx return cx end function o.nice(sl,k_)local sm=o.info()local sn=sm and sm.Pets[sl]return((k_ and k_~="")and(k_.." ")or"")..(sn and sn.displayName or tostring(sl))
end function o.data()local hj=K:GetAttribute("PetsData")if type(hj)~="string"then return nil end if hj==o.rawD then return o.lastD end
local Ca,eI=pcall(function()return o.HS:JSONDecode(hj)end)eI=(Ca and type(eI)=="table")and eI or nil o.rawD,o.lastD=hj,eI
return eI end function o.pen()return ag:FindFirstChild("PetMeadowSpawns")end function o.srv()return ak:GetServerTimeNow()end
function o.money()local la=K:FindFirstChild("MoneyValue")if la and type(la.Value)=="number"then return la.Value end
return bk()or 0 end function o.wishes()local so=o.pen()local sp=so and so:GetAttribute("Wishes")local lb,sq={},o.srv()
if type(sp)~="string"then return lb end local Cb,sr=pcall(function()return o.HS:JSONDecode(sp)end)if Cb and type(sr)=="table"then
for Cc,lc in pairs(sr)do if type(lc)=="number"and lc>sq then lb[Cc]=lc-sq end end end return lb end function o.call(...)
local ss=ag:FindFirstChild("Remotes")local su=ss and ss:FindFirstChild("PetRequest")if not su then return nil end
local sv=table.pack(...)local cy={}task.spawn(function()cy.ok,cy.v=pcall(function()return su:InvokeServer(table.unpack(sv,1,sv.n))end)
cy.done=true end)local Cd=z()while not cy.done and z()-Cd<6 do task.wait(0.05)end if cy.done and cy.ok then return cy.v end
return nil end function o.want(Ce)return e.Pets[Ce]end function o.closeNaming(ld)local sy=pcall(function()local sx=K:FindFirstChild("PlayerScripts")
local Cf=sx and sx:FindFirstChild("Naming",true)require(Cf).close()end)ah(0.5)if ld.Visible then pcall(function()local sz=ld:FindFirstChild("NameBox",true)if sz then sz:ReleaseFocus()end end)
ld.Visible=false sy=false end return sy end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local sA=K:FindFirstChildOfClass("PlayerGui")
local sB=sA and sA:FindFirstChild("MainGui")local hk=sB and sB:FindFirstChild("PetNameGui")if hk and hk.Visible then
ah(0.4)if hk.Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,hk)break end end ah(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local le,sC,hl=o.info(),o.pen(),o.data()
if not(le and sC and hl)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local eJ,lf=#(hl.pets or{}),tonumber(hl.maxOwned)or 60
local Cg,sD,eK=o.srv(),{},nil for Kz,aY in ipairs(sC:GetChildren())do sD[aY.Name]=true local cz,hm=aY:GetAttribute("Pet"),aY:GetAttribute("Variant")or""
local lg=cz and o.want(cz)if lg and lg.b and le.Pets[cz]and(not lg.g or hm=="Big")and y.wantMore(cz,hm,hl)and not aY:GetAttribute("A_"..o.uid)
and(tonumber(aY:GetAttribute("ExpiresAt"))or 0)>Cg+1 and z()>=(o.tryAt[aY.Name]or 0)then local eL,sE=o.nice(cz,hm),le.Pets[cz].price or 0
if eJ>=lf then eK=("%s is in the pen, but you have %d/%d pets"):format(eL,eJ,lf)o.tryAt[aY.Name]=z()+15 elseif o.money()<sE then
eK=("%s is in the pen - need $%s"):format(eL,av(sE))o.tryAt[aY.Name]=z()+5 else o.tryAt[aY.Name]=z()+8 local bQ=o.call("adopt",aY.Name)
if type(bQ)=="table"and bQ.ok then eJ=eJ+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local Ch=type(bQ.pet)=="table"and bQ.pet or{}
table.insert(o.recent,{id=tostring(Ch.id or("?"..z())),name=cz,variant=hm,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
D("ADOPTED "..eL)o.skipNaming()eK="adopted "..eL else local sF=type(bQ)=="table"and tostring(bQ.reason or"no reason given")or"no answer"
D(("adopt %s failed: %s"):format(eL,sF))eK="adopt failed: "..sF if type(bQ)=="table"and bQ.bagFull then o.tryAt[aY.Name]=z()+60 end
end end end end for sG in pairs(o.tryAt)do if not sD[sG]then o.tryAt[sG]=nil end end o.buyMsg=eK or("watching the pen (%d/%d pets)"):format(eJ,lf)
end function o.stacks()local sH=o.pen()local Ci=sH and sH:GetAttribute("WishStacks")local Cj,sI=pcall(function()return o.HS:JSONDecode(Ci)end)
return(Cj and type(sI)=="table")and sI or{}end function o.stackTick(Ck,Cl)local hn=o.info()local sJ=(type(hn.Wish)=="table"and tonumber(hn.Wish.maxStacks))or 1
if sJ<=1 then return end local Cm=o.stacks()o.stackTry=o.stackTry or{}for KA,aZ in ipairs(o.order())do local sK=o.want(aZ)
local ho=tonumber(Cm[aZ])or 1 if sK and sK.w and Ck[aZ]and ho<sJ and y.wantMore(aZ,"",Cl)and z()>=(o.stackTry[aZ]or 0)then
local Cn,hp=pcall(hn.wishPrice,aZ,ho+1)hp=Cn and tonumber(hp)or((hn.Pets[aZ].price or 0)*2*3^ho)o.stackTry[aZ]=z()+5
if hp<=o.money()*0.01 then local sL=o.call("wish",aZ)if type(sL)=="table"and sL.ok then o.wishN=o.wishN+1 D(("WISH x%d on %s ($%s)"):format(ho+1,o.nice(aZ),av(hp)))
else o.stackTry[aZ]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local hq=o.info()if not(hq and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bR,lh,bS=o.wishes(),0,nil local Co=(type(hq.Wish)=="table"and hq.Wish.cashShare)or 2 local sM=o.data()for KB,aF in ipairs(o.order())do
local sN=o.want(aF)if sN and sN.w and y.wantMore(aF,"",sM)then lh=lh+1 if not bR[aF]and z()>=(o.wishTry[aF]or 0)then
local li=tonumber(K:GetAttribute("PetWishCredits"))or 0 local lj=math.floor((hq.Pets[aF].price or 0)*Co)if li<=0 and o.money()<lj then
o.wishTry[aF]=z()+10 bS=("need $%s to wish for %s"):format(av(lj),o.nice(aF))o.wishWhy[aF]=bS else o.wishTry[aF]=z()+3
local Cp=li>0 and"wishCredit"or"wish"local hr=o.call(Cp,aF)if type(hr)=="table"and hr.ok then o.wishN,o.wishWhy[aF]=o.wishN+1,nil
D(("WISHED for %s (%s)"):format(o.nice(aF),li>0 and"free wish"or("$"..av(lj))))else local lk=type(hr)=="table"and tostring(hr.reason or"no reason given")or"no answer"
if lk:lower():find("already",1,true)then o.wishTry[aF]=z()+2 else D(("wish %s failed: %s"):format(o.nice(aF),lk))bS="wish failed: "..lk end
end end end end end pcall(o.stackTick,bR,sM)if not bS then for KC,hs in ipairs(o.order())do local sO=o.want(hs)
if sO and sO.w and not bR[hs]and o.wishWhy[hs]then bS=o.wishWhy[hs]break end end end if not bS then local dj={}
for KD,eM in ipairs(o.order())do local sP=o.want(eM)local sQ=tonumber(o.stacks()[eM])or 1 if sP and sP.w and bR[eM]then dj[#dj+1]=("%s%s %dm"):format(o.nice(eM),sQ>1 and(" x"..sQ)or"",math.ceil(bR[eM]/60))end
end local ht for KE,hu in ipairs(o.order())do local sR=o.want(hu)if sR and sR.w and bR[hu]and(not ht or bR[hu]<ht)then ht=bR[hu]end
end bS=lh==0 and"no pet has WISH ticked"or(#dj==0 and"running: none yet")or(#dj<=3 and("running: "..table.concat(dj,", ")))
or("%d running, the next one ends in %dm"):format(#dj,math.ceil((ht or 0)/60))end o.wishMsg=bS end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local ll=o.data()return(ll and ll.teams)or{},ll end function A.current(dk)
dk=dk or o.data()if not dk then return""end local sS={}for KF,Cq in ipairs(dk.equipped or{})do sS[tostring(Cq)]=true end
for KG,sT in ipairs(dk.teams or{})do local sU=sT.pets or{}local lm=#sU==#(dk.equipped or{})if lm then for KH,Cr in ipairs(sU)do if not sS[tostring(Cr)]then lm=false break end end end
if lm then return sT.name end end return""end function A.equip(ln)local Cs,Ct=A.teams()local lo for Cu,Cv in ipairs(Cs)do if Cv.name==ln then lo=Cu break end end
if not lo then A.msg="no saved team called "..tostring(ln)return false end if A.current(Ct)==ln then return true end
for KI=1,4 do local sV=o.call("teamEquip",lo)if type(sV)=="table"and sV.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(Cw)local sW=Cw:FindFirstChild("SquishyPlaceHolder")local sX=sW and sW:FindFirstChild("TimerGui")
local sY=sX and sX:FindFirstChildWhichIsA("TextLabel",true)local lp=sY and sY.Text if type(lp)~="string"or lp:find("-",1,true)then return nil end
local lq,sZ,s0=lp:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not lq then return nil end local s1=s0~=""and(tonumber(lq)*3600+tonumber(sZ)*60+tonumber(s0))or(tonumber(lq)*60+tonumber(sZ))
return s1>0 and s1 or nil end function A.waxes()local eN={}local s2=c.plot and c.plot:FindFirstChild("WaxStations")
if not s2 then return eN end local s3=o.srv()for KJ,a_ in ipairs(s2:GetChildren())do local lr=tonumber(a_:GetAttribute("PourEnd"))
local s4=a_:GetAttribute("PourOwner")if a_:GetAttribute("HasSquishy")and a_:GetAttribute("PourId")and(s4==nil or s4==o.uid)then
local ls=A.left(a_)local s5=ls and(s3+ls)or((lr and lr>s3)and lr or nil)if s5 then local s6,s7=a_:FindFirstChild("SquishyPlaceHolder"),"?"
if s6 then for KK,s8 in ipairs(s6:GetChildren())do if s8:IsA("Model")then s7=s8 .Name break end end end local Cx=tostring(a_:GetAttribute("Helpers")or"")
local lt=0 for KL in Cx:gmatch("%d+")do lt=lt+1 end eN[#eN+1]={st=a_,ends=s5,sure=ls~=nil,id=a_:GetAttribute("PourId"),name=s7,helps=lt,
long=a_:GetAttribute("PourLong")==true}end end end table.sort(eN,function(Cy,Cz)return Cy.ends<Cz.ends end)return eN
end function A.glazeCount()local s9=ag:FindFirstChild("Remotes")local s_=s9 and s9:FindFirstChild("EditStack")
if not s_ then return nil end local CA,eO=pcall(function()return s_:InvokeServer("State",nil)end)if not(CA and type(eO)=="table"and type(eO.state)=="table")then return nil end
local lu,lv=0,{}for KM,hv in ipairs(eO.state.entries or{})do if hv.glaze and hv.glaze~=""then lu=lu+1 lv[hv.glaze]=(lv[hv.glaze]or 0)+1 end
end return lu,lv,#(eO.state.entries or{}),eO.state.capacity end function A.finishedOne(hw,ta)A.finished=A.finished+1
task.wait(2)local lw,CB,tb,CC=A.glazeCount()if lw and ta and lw>ta then A.glazed=A.glazed+1 local lx={}for CD,CE in pairs(CB)do lx[#lx+1]=CD.." "..CE end
D(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(am(W(hw.name)),hw.st.Name,lw,table.concat(lx,", ")))
else D(("wax done on station %s: %s, no glaze%s"):format(hw.st.Name,am(W(hw.name)),tb and(" (stack "..tb.."/"..tostring(CC)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cA=o.srv()local aJ=A.glazeFor if aJ then local eP=aJ.st local td=eP.Parent and eP:GetAttribute("HasSquishy")and eP:GetAttribute("PourId")==aJ.id
local te=td and A.left(eP)if te then aJ.ends=cA+te end if not td then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aJ.id or"?"]then
A.done[aJ.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aJ.id or"?"]=true},1 end local CG=aJ.before
task.spawn(function()pcall(A.finishedOne,aJ,CG)end)end elseif aJ.ends-cA>e.GlazeLead*3+60 or cA>aJ.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aJ.id or"?"]=z()+120 D(("station %s is not finishing yet (%s left) - glaze team off again"):format(eP.Name,A.clock(aJ.ends-cA)))
end end if e.TeamGlaze~=""and not A.glazeFor then local CH=A.speedRatio(e.TeamGlaze)for KN,cB in ipairs(A.list)do
if cB.sure and(cB.ends-cA)*CH[cB.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cB.id or"?"]or 0)and not A.done[cB.id or"?"]then
A.glazeFor=cB task.spawn(function()cB.before=A.glazeCount()end)break end end end local aK,eQ="",""local dl=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cA)
if dl and dl<-8 then q.snapAt,dl=nil,nil end if e.TeamGlaze~=""and dl and dl<=20 then aK,eQ=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(dl)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aK,eQ=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aK,eQ=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aK,eQ=e.TeamFull," - every station is busy"else aK=e.TeamNormal end A.want=aK local eR=A.current()A.cur=eR if aK~=""and eR~=aK and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aK)then D("team: "..aK..eQ)else A.nextTry=z()+3 end end local ly=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eR~=""and eR or"(not a saved team)",(aK~=""and aK~=eR)and(" -> "..aK)or"",
ly and("in "..A.clock(ly.ends-cA).." (st "..ly.st.Name..")")or"- none running")end function A.clock(bT)bT=math.max(0,math.floor(bT))
if bT>=3600 then return("%d:%02d:%02d"):format(math.floor(bT/3600),math.floor((bT%3600)/60),bT%60)end return("%d:%02d"):format(math.floor(bT/60),bT%60)
end function A.allBusy()local CI,CJ=gk()return CJ>0 and CI==0 end function A.aboutToPlace()if not c.running then return false end
local hx=ad()if not(hx and aP(hx))then return false end if(e.NoWax and not q.isLimited(hx))or(q.isLimited(hx)and not q.limitedHere())then return false end
local CK=gk()return CK>0 end function A.mult(tf,CL,th)return{(1+tf)*(1+th),(1+tf+CL)*(1+th)}end function A.speedNow()
local function lz(CM)return tonumber(K:GetAttribute(CM))or 0 end return A.mult(lz("PetWaxSpeed"),lz("PetLongWax"),lz("PetSocialWax"))
end function A.speedOf(CN)local CO,ti=A.teams()if not ti then return nil end for KO,tj in ipairs(CO)do if tj.name==CN then
local lA={}for KP,CP in ipairs(tj.pets or{})do for KQ,tk in ipairs(ti.pets or{})do if tostring(tk.id)==tostring(CP)then lA[#lA+1]=tk break end end
end local tl=y.caps()local tm,CQ=y.stats(lA)return A.mult(math.min(tm.waxSpeed or 0,tl.waxSpeed or 0.25),math.min(tm.longWax or 0,tl.longWax or 0.3),CQ.socialWax or 0)
end end return nil end function A.speedRatio(CS)local tn,lB=A.speedNow(),A.speedOf(CS)if not lB then return{1,1}end
return{tn[1]/lB[1],tn[2]/lB[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(CT)local lC=o.info()if lC and type(lC.fuseNeed)=="function"then local CU,lD=pcall(lC.fuseNeed,K,CT or"")
if CU and tonumber(lD)and tonumber(lD)>=2 then return tonumber(lD)end end if K:GetAttribute("FusePass")==true or K:GetAttribute("FusePass4")==true then return 3 end
if K:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(to)
if to=="Huge"then return y.needFor("")*y.needFor("Big")end if to=="Big"then return y.needFor("")end return 1 end
function y.nextOf(tp)return(tp==""and"Big")or(tp=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lE=o.info()return(lE and type(lE.HugeCaps)=="table")and lE.HugeCaps or y.HCAPS end function y.cosmic()local lF=o.info()return(lF and type(lF.CosmicCaps)=="table")and lF.CosmicCaps or{StarWhale=0.1}end
function y.slots()local tq=o.data()return tonumber(tq and tq.slots)or(3+(tonumber(K:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lG=o.info()return(lG and type(lG.Caps)=="table")and lG.Caps or y.CAPS end function y.value(tr,cC)
local hy=o.info()local cD=hy and hy.Pets[tr]if not(cD and type(cD.boost)=="table")then return nil end local cE
if type(hy.boostValue)=="function"then local CV,CW=pcall(hy.boostValue,tr,(cC~=""and cC)or nil)cE=CV and tonumber(CW)or nil
end if not cE then local eS=cD.boost.value or 0 cE=eS if cC=="Big"or cC=="Huge"then local ts=eS*(cC=="Huge"and 1.75 or 1.5)
cE=y.ROUND[cD.boost.kind]and math.max(eS+(cC=="Huge"and 2 or 1),math.floor(ts+0.5))or ts if cC=="Huge"and y.ROUND[cD.boost.kind]then cE=math.max(cE,math.max(eS+1,math.floor(eS*1.5+0.5))+1)end
end end return cD.boost.kind,cE,cD.boost.every end function y.stats(CX)local cF,lH,tt,eT={},{},{},{}local CY=y.cosmic()
for KR,dm in ipairs(CX)do local aw,eU,tu=y.value(dm.name,dm.variant or"")if aw then if dm.variant=="Huge"then tt[y.CAPKEY[aw]or aw]=true end
if aw:sub(1,6)=="social"then lH[aw]=math.max(lH[aw]or 0,eU)elseif aw=="waxStir"or aw=="cashGift"then cF[aw]=(cF[aw]or 0)+eU*60/(tu or 60)
elseif aw=="luckyPull"then cF.luckyPull=(cF.luckyPull or 0)+eU/(tu or 10)else cF[aw]=(cF[aw]or 0)+eU if CY[dm.name]then eT[aw]=eT[aw]or{}eT[aw][dm.name]=(eT[aw][dm.name]or 0)+eU end
end end end return cF,lH,tt,eT end function y.glazeGain(CZ,hz)local eV,lI,KS={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local C0=eV[1]+eV[2]+eV[3]local C1=tonumber(K:GetAttribute("GuildUpGlaze"))or 0 local dn={}for hA=1,3 do dn[hA]=eV[hA]+CZ*eV[hA]/C0+(hA==1 and C1 or 0)end
local lJ={dn[1]*(1-hz),dn[2]*(1-hz)+dn[1]*hz,dn[3]+dn[2]*hz}return lJ[1]*(lI[1]-1)+lJ[2]*(lI[2]-1)+lJ[3]*(lI[3]-1)
end function y.score(hB,C2)local C3,C4,C5=y.caps(),y.hcaps(),y.cosmic()local hC,hD,C6,tv=y.stats(C2)local function lK(lL)return(C6[lL]and C4[lL])or C3[lL]or math.huge end
local function bt(hE)local lM,lN=hC[hE]or 0,lK(hE)local lO=math.min(lM,lN)if tv[hE]and lM>lN then local lP=0 for C7,C8 in pairs(tv[hE])do lP=lP+math.min(C8,C5[C7]or 0)end
lO=lO+math.min(lM-lN,lP)end return lO end local C9=(1+bt("income"))*(1+(hD.socialIncome or 0))*(1+math.min(hC.cashGift or 0,lK("cashGiftPerMinute"))/60)
local C_=1+bt("luck")+(hC.luckyPull or 0)+(hD.socialLuck or 0)local tw=C_*(1+bt("newFind"))*(1+bt("rollSpeed"))
local eW=math.log(C9)local Da=math.max(tonumber(K:GetAttribute("WaxStations"))or 18,1)local lQ=(1+bt("waxSpeed")+bt("longWax"))*(1+(hD.socialWax or 0))
+math.min(hC.waxStir or 0,lK("waxStirPerMinute"))/60/Da local Db=1-(1-bt("headStart"))*(1-(hD.socialHeadStart or 0))
if hB=="farm"then return eW+0.7*math.log(tw)+0.1*math.log(lQ)end if hB=="full"then return eW+0.4*math.log(lQ)+0.02*math.log(tw)end
if hB=="glaze"then return y.glazeGain(bt("glaze"),bt("glazeUp"))+0.001*eW end if hB=="wax"then return-math.log(1-0.5*Db)+0.001*eW+0.001*math.log(lQ)end
return eW end function y.kinds(Dc)local tx,lR={},{}for KT,eX in ipairs(Dc)do local ty=eX.name.."|"..(eX.variant or"")
local bU=tx[ty]if not bU then bU={name=eX.name,variant=eX.variant or"",n=0,ids={}}tx[ty]=bU lR[#lR+1]=bU end bU.n=bU.n+1
bU.ids[#bU.ids+1]=eX.id end return lR end function y.bestKinds(tz,bV,Dd,tA,tB)local aD,bW={},{}local function lS(De)
local tC,hF={},{}for Df,lT in ipairs(De)do tC[Df]=bV[lT]hF[lT]=(hF[lT]or 0)+1 end local eY=y.score(tz,tC)if tA then for Dg,Dh in pairs(hF)do eY=eY+1e-7*math.min(Dh,tA[Dg]or 0)end end
if tB then for Di,Dj in pairs(hF)do eY=eY-1e-8*Dj*tB[bV[Di].variant]end end return eY end for KU=1,Dd do local eZ,lU
for hG=1,#bV do if(bW[hG]or 0)<bV[hG].n then aD[#aD+1]=hG local tD=lS(aD)aD[#aD]=nil if not lU or tD>lU+1e-12 then eZ,lU=hG,tD end
end end if not eZ then break end bW[eZ]=(bW[eZ]or 0)+1 aD[#aD+1]=eZ if#bV>40 then task.wait()end end for KV=1,6 do
task.wait()local tE,tF=false,lS(aD)for lV=1,#aD do for dp=1,#bV do local hH=aD[lV]if dp~=hH and(bW[dp]or 0)<bV[dp].n then
aD[lV]=dp local tG=lS(aD)if tG>tF+1e-9 then bW[hH],bW[dp],tF,tE=bW[hH]-1,(bW[dp]or 0)+1,tG,true else aD[lV]=hH end
end end end if not tE then break end end local tH={}for Dk,Dl in ipairs(aD)do tH[Dk]=bV[Dl]end return aD,y.score(tz,tH)
end function y.best(Dm,Dn,Do,hI)hI=hI or{}local lW=y.kinds(Dn)local lX={}for tI,Dp in ipairs(lW)do for KW,Dq in ipairs(Dp.ids)do if hI[tostring(Dq)]then lX[tI]=(lX[tI]or 0)+1 end end end
local Dr,Ds=y.bestKinds(Dm,lW,Do,lX)local lY,lZ={},{}for KX,Dt in ipairs(Dr)do local tJ,e0=lW[Dt],nil for KY,l0 in ipairs(tJ.ids)do if hI[tostring(l0)]and not lY[l0]then e0=l0 break end end
if not e0 then for KZ,tK in ipairs(tJ.ids)do if not lY[tK]then e0=tK break end end end lY[e0]=true lZ[#lZ+1]=tostring(e0)
end return lZ,Ds end function y.dream()local tL=o.info()if not(tL and type(tL.Pets)=="table")then return nil end
local l1=y.slots()local tM=y.needFor("").."|"..y.needFor("Big").."|"..l1 .."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==tM and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local Dz=pcall(function()local hJ={}for K0,Du in ipairs(o.order())do for K1,Dv in ipairs({"","Big","Huge"})do hJ[#hJ+1]={name=Du,variant=Dv,n=l1,ids={}}end
end local e1,l2={},{}for K2,hK in ipairs(y.ROLES)do if e[hK[1]]~=""then local Dw,Dx=y.bestKinds(hK[2],hJ,l1,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local l3,hL={},{}for K3,tN in ipairs(Dw)do l3[tN]=(l3[tN]or 0)+1 end for Dy,l4 in pairs(l3)do local bX=hJ[Dy]
e1[bX.name]=e1[bX.name]or{[""]=0,Big=0,Huge=0}e1[bX.name][bX.variant]=math.max(e1[bX.name][bX.variant],l4)hL[#hL+1]=(l4>1 and(l4 .."x ")or"")..o.nice(bX.name,bX.variant)
end table.sort(hL)l2[#l2+1]={role=hK[2],team=e[hK[1]],names=hL,score=Dx}end end y.dreamT,y.dreamTeams,y.dreamSig=e1,l2,tM
end)y.dreaming=false if not Dz then y.dreamSig=nil end return y.dreamT end function y.owned(hM)local tO,l5={},{}
for K4,DA in ipairs(hM and hM.arriving or{})do tO[tostring(DA)]=true end for K5,cG in ipairs(hM and hM.pets or{})do
if not tO[tostring(cG.id)]then l5[#l5+1]={id=tostring(cG.id),name=cG.name,variant=cG.variant or"",named=cG.named or(cG.nickname and cG.nickname~="")}
end end return l5 end function y.have(tP,DB,DC)local ba={[""]=0,Big=0,Huge=0}local tQ={}for K6,e2 in ipairs(y.owned(DB))do
tQ[e2 .id]=true if e2 .name==tP and ba[e2 .variant]then ba[e2 .variant]=ba[e2 .variant]+1 end end if DC then for K7,dq in ipairs(o.recent or{})do
if dq.name==tP and not tQ[dq.id]and z()-dq.at<20 and ba[dq.variant or""]then ba[dq.variant or""]=ba[dq.variant or""]+1 end
end end return ba,ba[""]+ba.Big*y.unit("Big")+ba.Huge*y.unit("Huge")end function y.goal(tR)local tS=e.Pets[tR]
if tS and tonumber(tS.f)==-1 then return nil,0 end local tT=y.dream()local e3=tT and tT[tR]if not e3 then return nil,0 end
return e3,e3[""]+e3 .Big*y.unit("Big")+e3 .Huge*y.unit("Huge")end function y.wantMore(l6,K8,tU)if not tU then return true end
local tV=e.Pets[l6]if tV and tonumber(tV.f)==-1 then return true end local DD,DE=y.goal(l6)if not DD then return true end
local K9,DF=y.have(l6,tU,true)return DF<DE+y.need()end function y.status(e4,tW)if not tW then return nil end local tX=e.Pets[e4]
if tX and tonumber(tX.f)==-1 then return"KEEP: never fused"end local cH,tY=y.goal(e4)if not cH then return y.dream()and"in no best team: bought as ticked"or nil end
local l7,DG=y.have(e4,tW)local cI={}if cH.Huge>0 then cI[#cI+1]=("Huge %d/%d"):format(l7 .Huge,cH.Huge)end if cH.Big>0 then cI[#cI+1]=("Big %d/%d"):format(l7 .Big,cH.Big)end
if cH[""]>0 then cI[#cI+1]=("plain %d/%d"):format(l7[""],cH[""])end local DH=y.blocked and y.blocked[e4]and(" | "..y.blocked[e4])or""
return("%s | %d/%d copies%s"):format(table.concat(cI," "),math.min(DG,tY),tY,DH)end function y.wear(l8)local l9={}
for K_,DI in ipairs(l8)do l9[tostring(DI)]=true end for La=1,3 do local dr=o.data()if not dr then return false end
for Lb,tZ in ipairs(dr.equipped or{})do if not l9[tostring(tZ)]then o.call("unequip",tZ)task.wait(0.3)end end
dr=o.data()local t0={}for Lc,DJ in ipairs(dr.equipped or{})do t0[tostring(DJ)]=true end for Ld,t1 in ipairs(l8)do
if not t0[tostring(t1)]then o.call("equip",t1)task.wait(0.3)end end task.wait(0.4)dr=o.data()local l_,t2=0,true
for Le,DK in ipairs(dr.equipped or{})do l_=l_+1 if not l9[tostring(DK)]then t2=false end end if t2 and l_==#l8 then return true end
end return false end function y.saveTeam(t3,t4)if not y.wear(t4)then return false,"could not put the pets on"end
local DL=A.teams()local cJ for DM,DN in ipairs(DL)do if DN.name==t3 then cJ=DM break end end local ds if cJ then
ds=o.call("teamSave",cJ)else ds=o.call("teamNew")if type(ds)=="table"and ds.ok and ds.index then cJ=ds.index task.wait(0.3)
o.call("teamRename",{index=cJ,name=t3})end end task.wait(0.4)local ma=o.data()local t5=ma and ma.teams and cJ and ma.teams[cJ]
if not t5 then return false,"the game did not save it"end local t6={}for Lf,DO in ipairs(t5 .pets or{})do t6[tostring(DO)]=true end
for Lg,DP in ipairs(t4)do if not t6[tostring(DP)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local DQ=o.srv()for Lh,DR in ipairs(A.list or{})do if DR.ends-DQ<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local e5=o.data()if not e5 then return{}end local t7={}for Li,DS in ipairs(e5 .arriving or{})do t7[tostring(DS)]=true end
local e6={}for Lj,hN in ipairs(e5 .pets or{})do if not t7[tostring(hN.id)]then e6[#e6+1]={id=tostring(hN.id),name=hN.name,variant=hN.variant or""}end
end local t8={}for Lk,t9 in ipairs(e6)do t8[t9 .id]=t9 end local t_=tonumber(e5 .slots)or 3 local mb,ua={},{}
for Ll,hO in ipairs(y.ROLES)do local e7=e[hO[1]]if e7~=""and not ua[e7]then ua[e7]=true local mc,e8,ub={},{},false
for Lm,uc in ipairs(e5 .teams or{})do if uc.name==e7 then for Ln,DT in ipairs(uc.pets or{})do local md=t8[tostring(DT)]
if md then mc[md.id]=true e8[#e8+1]=md else ub=true end end end end local me,ud=y.best(hO[2],e6,t_,mc)local ue=y.score(hO[2],e8)
local uf=#me==#e8 for Lo,DU in ipairs(me)do if not mc[DU]then uf=false end end if not uf and(ub or#e8<math.min(t_,#e6)or ud>ue+1e-4)then
mb[#mb+1]={team=e7,role=hO[2],ids=me,gain=ud-ue}end end end return mb end function y.rebuild(DV)local ug=y.plan()
if#ug==0 then y.buildMsg="teams are already the best your pets allow"return true end if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end
A.editing,A.editingSince=true,z()local hP=true local DZ,D0=pcall(function()for Lp,e9 in ipairs(ug)do local DW,DX=y.saveTeam(e9 .team,e9 .ids)
local uh=o.data()local mf={}for Lq,DY in ipairs(e9 .ids)do for Lr,mg in ipairs(uh and uh.pets or{})do if tostring(mg.id)==DY then mf[#mf+1]=o.nice(mg.name,mg.variant)end
end end if DW then D(("TEAM %s rebuilt (%s): %s"):format(e9 .team,DV or"pets changed",table.concat(mf,", ")))
else hP=false D(("TEAM %s: %s"):format(e9 .team,tostring(DX)))end end end)A.editing,A.nextTry=false,0 if not DZ then hP=false D("TEAM BUILD ERR "..tostring(D0))end
y.builds=y.builds+1 y.buildMsg=hP and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return hP end function y.roleScores(ui)local bY={}for Ls,uj in ipairs(ui)do bY[#bY+1]=uj.name..uj.variant end
table.sort(bY)bY=table.concat(bY,",")y.rsCache=y.rsCache or{}if y.rsCache[bY]then return y.rsCache[bY]end local D1,D2,mh=y.kinds(ui),y.slots(),{}
for Lt,mi in ipairs(y.ROLES)do if e[mi[1]]~=""then local Lu,D3=y.bestKinds(mi[2],D1,D2)mh[mi[2]]=D3 end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bY]=mh return mh end function y.noLoss(uk,D4,D5,D6)local ul,e_={},{}
for Lv,D7 in ipairs(D4)do ul[D7]=true end for Lw,um in ipairs(uk)do if not ul[um.id]then e_[#e_+1]=um end end
e_[#e_+1]={id="new",name=D5,variant=D6}local D8,uo=y.roleScores(uk),y.roleScores(e_)local up=false for mj,uq in pairs(D8)do
if(uo[mj]or-math.huge)<uq-1e-6 then return false,mj end if(uo[mj]or 0)>uq+1e-6 then up=true end end return true,up
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local fa=o.data()if not fa then return end local ur=y.owned(fa)local hQ,fb={},{}for Lx,D9 in ipairs(fa.teams or{})do for Ly,D_ in ipairs(D9 .pets or{})do hQ[tostring(D_)]=true end end
for Lz,Ea in ipairs(fa.equipped or{})do fb[tostring(Ea)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for LA,aL in ipairs(o.order())do
local hR=y.goal(aL)if hR then local ml=y.have(aL,fa)for LB,bu in ipairs({"Big",""})do local dt,mm=y.nextOf(bu),y.needFor(bu)
local Eb=(bu=="Big"and ml.Huge<hR.Huge)or(bu==""and ml.Big<hR.Big+y.needFor("Big")*math.max(0,hR.Huge-ml.Huge))
local fc={}for LC,mn in ipairs(ur)do if mn.name==aL and mn.variant==bu then fc[#fc+1]=mn end end if Eb and#fc>=mm and z()>=(y.failUntil[aL..bu]or 0)then
table.sort(fc,function(hS,hT)local us=(fb[hS.id]and 4 or 0)+(hQ[hS.id]and 2 or 0)+(hS.named and 1 or 0)local ut=(fb[hT.id]and 4 or 0)+(hQ[hT.id]and 2 or 0)+(hT.named and 1 or 0)
if us~=ut then return us<ut end return hS.id<hT.id end)local cK,mo,uu={},{},false for du=1,mm do cK[du]=fc[du].id
if fb[cK[du]]then mo[#mo+1]=cK[du]end if fb[cK[du]]or hQ[cK[du]]then uu=true end end local Ec,uv=y.noLoss(ur,cK,aL,dt)
if not Ec then y.blocked[aL]=("%s waits: it would weaken the %s team now"):format(dt,y.ROLENAME[uv]or tostring(uv))
elseif uu and not y.quiet()then y.blocked[aL]=dt.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dt,o.nice(aL))
return else A.editing,A.editingSince=true,z()for LD,Ed in ipairs(mo)do o.call("unequip",Ed)task.wait(0.3)end local hU=o.call("fuse",{ids=cK})
A.editing,A.nextTry=false,0 if type(hU)=="table"and hU.ok then y.fused=y.fused+1 y.dirtyAt=z()D(("FUSED %d %s -> %s"):format(mm,o.nice(aL,bu),o.nice(aL,dt)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aL,dt),os.date("%H:%M"))else y.failUntil[aL..bu]=z()+120 D(("fuse %s failed: %s"):format(o.nice(aL,bu),type(hU)=="table"and tostring(hU.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local uw=o.data()if not uw then return end local cL={}for LE,Ee in ipairs(uw.pets or{})do cL[#cL+1]=tostring(Ee.id)end
table.sort(cL)cL=table.concat(cL,",")if cL~=y.sig then y.sig,y.dirtyAt=cL,z()end local Ef=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if Ef and not A.editing then local Eg=y.rebuild(y.dirtyAt and"pets changed"or"check")if Eg then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cM)return cM:IsA("ParticleEmitter")or cM:IsA("Trail")or cM:IsA("Beam")or cM:IsA("Fire")or cM:IsA("Smoke")
or cM:IsA("Sparkles")or cM:IsA("Light")end function d.muteOne(bv)if not e.Lite or not bv.Parent then return end
local hV=(bv:IsA("BillboardGui")and d.bb)or(d.isFx(bv)and d.fx)or nil if not hV or hV[bv]~=nil then return end
if hV==d.fx and d.gameLow and not bv:IsA("Beam")then return end hV[bv]=bv.Enabled if bv.Enabled then bv.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local mp={}for LF,Eh in ipairs({d.bb,d.fx})do for Ei in pairs(Eh)do mp[#mp+1]=Ei end end local ux=os.clock()for Ej,fd in ipairs(mp)do
if e.Lite and fd.Parent and fd.Enabled then local Ek=d.bb[fd]~=nil and d.bb or d.fx Ek[fd]=true fd.Enabled=false
end if Ej%200==0 and os.clock()-ux>0.002 then task.wait()ux=os.clock()end end end function d.lite(uy)e.Lite=uy
if uy then task.spawn(function()for El,Em in ipairs(ak:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Em)
if El%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=V(ak.DescendantAdded:Connect(function(mq)
if e.Lite and(mq:IsA("BillboardGui")or d.isFx(mq))then d.queue[#d.queue+1]=mq end end))end local mr=game:GetService("Lighting")
for LG,fe in ipairs(mr:GetChildren())do if fe:IsA("PostEffect")and fe.Enabled and d.post[fe]==nil then d.post[fe]=true fe.Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and mr.GlobalShadows or d.oldShadows mr.GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ak.Terrain.Decoration or d.oldDeco ak.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for LH,En in pairs(d.watch)do pcall(function()En:Disconnect()end)end
for uz,Eo in pairs(d.bb)do pcall(function()if uz.Parent then uz.Enabled=Eo end end)end for uA,Ep in pairs(d.fx)do pcall(function()if uA.Parent then uA.Enabled=Ep end end)end
for uB in pairs(d.post)do pcall(function()if uB.Parent then uB.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local Eq=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()Eq.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ak.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(uC)
local Er,ms=pcall(function()return require(ag:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not Er or type(ms)~="table"then return end if uC and not d.ceOld then d.ceOld={}for LI,uD in ipairs({"Fireworks","Confetti"})do
local hW=ms[uD]if type(hW)=="table"and type(hW.Play)=="function"then d.ceOld[uD]=hW.Play pcall(function()hW.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not uC and d.ceOld then for Es,Et in pairs(d.ceOld)do pcall(function()ms[Es].Play=Et end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local mt,hX for LJ,ff in ipairs(getgc(false))do if type(ff)=="function"and(type(islclosure)~="function"or islclosure(ff))then
local Eu,uE,uF=pcall(debug.info,ff,"sn")if Eu and type(uE)=="string"and uE:find("ToppingCullHandler",1,true)then
if uF=="poll"then mt=ff elseif uF=="retarget"then hX=ff end end end end if not(mt and hX)then return nil end local Ev,hY=pcall(debug.getupvalues,hX)
local uG=Ev and type(hY)=="table"and hY[3]if type(uG)~="function"or debug.info(uG,"n")~="targetFor"or(hY[1]~=nil and type(hY[1])~="number")then return nil end
d.tc={poll=mt,re=hX}return d.tc end function d.tops(uH)local aR=d.topsFind()if not aR then return false end if uH and not aR.old then
local Ew,Ex=pcall(hookfunction,aR.poll,function()end)if not Ew then return false end aR.old=Ex pcall(debug.setupvalue,aR.re,1,-1000)
pcall(aR.re)elseif not uH and aR.old then local Ey=type(restorefunction)=="function"and pcall(restorefunction,aR.poll)
if not Ey then pcall(hookfunction,aR.poll,aR.old)end aR.old=nil pcall(aR.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(Ez)local uI=ak:FindFirstChild("Plots")local uJ=os.clock()if Ez then for LK,EA in ipairs(uI and uI:GetChildren()or{})do
local uK=EA:FindFirstChild("SkinProps")local uL=uK and uK:FindFirstChild("FairyLights")for LL,uM in ipairs(uL and uL:GetChildren()or{})do
for LM,fg in ipairs(uM:GetChildren())do if fg:IsA("BasePart")and(fg.Name=="Bulb"or fg.Name=="Wire")then d.lit[fg]=uM fg.Parent=nil end
end if os.clock()-uJ>0.002 then task.wait()uJ=os.clock()end end end for LN,EB in ipairs({"Leaderboards","ClanBoard"})do
local mu=ak:FindFirstChild(EB)if mu then d.boardsOff[mu]=true mu.Parent=nil end end else for EC,uN in pairs(d.lit)do pcall(function()if uN.Parent then EC.Parent=uN end end)end
for uO in pairs(d.boardsOff)do pcall(function()if not uO.Parent then uO.Parent=ak end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(ED)if ED then local uP=ag:FindFirstChild("Remotes")local uQ=uP and uP:FindFirstChild("SquishyRollAnimation")
if not uQ or type(getconnections)~="function"then return end local EE,EF=pcall(getconnections,uQ.OnClientEvent)
for LO,hZ in ipairs(EE and EF or{})do local mv=""pcall(function()mv=debug.info(hZ.Function,"s")end)if type(mv)=="string"and mv:find("SquishyHandler",1,true)and not d.reel[hZ]then
if pcall(function()hZ:Disable()end)then d.reel[hZ]=true end end end else for EG in pairs(d.reel)do pcall(function()EG:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(EH)if not EH then for LP,EI in pairs(d.quiet)do pcall(function()EI:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function mw(EJ,EK)local EL,EM=pcall(getconnections,EJ)
for LQ,h0 in ipairs(EL and EM or{})do local mx=""pcall(function()mx=debug.info(h0 .Function,"s")end)local my=h0 .Function
if my and type(mx)=="string"and mx:find(EK,1,true)and not d.quiet[my]then if pcall(function()h0:Disable()end)then d.quiet[my]=h0 end
end end end local uR=ak:FindFirstChild("Plots")for LR,h1 in ipairs(uR and uR:GetChildren()or{})do if h1~=c.plot then
mw(h1:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uS,uT=h1:FindFirstChild("WaxStations"),h1:FindFirstChild("SquishyStack")
if uS then mw(uS.DescendantAdded,"LocalToppingsHandler")end if uT then mw(uT.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for uU,EN in pairs(d.lit)do if not EN:IsDescendantOf(game)then d.lit[uU]=nil pcall(function()uU:Destroy()end)end
end end function d.passText()local ax=function(EO)return K:GetAttribute(EO)end local mz={}local function bZ(EP,EQ)mz[#mz+1]=(EP and"[x] "or"[  ] ")..EQ end
bZ(ax("VIP")==true,"VIP: money x1.5, offline +50%")bZ(ax("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(ax("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local ER=ax("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(ax("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bZ(ax("FastWax")==true or ax("SuperFastWax")==true,ER.." (the farm times by the game's own timers)")local uV=(ax("FusePass")==true and"Fuse Pass")or(ax("FusePass4")==true and"Fuse Pass 4")or(ax("FusePass5")==true and"Fuse Pass 5")or nil
bZ(uV~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uV or"Fuse pass",y.needFor(""),y.needFor("Big")))local h2=o.data()
local ES=tonumber(h2 and h2 .maxOwned)or 60 bZ(ax("PetInventory50")==true or ax("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(h2 and#(h2 .pets or{})or 0,ES,(ax("PetInventory50")==true and ax("PetInventory100")==true)and" (both bag passes)"or""))
local uW=tonumber(ax("PetEquipBought"))or 0 bZ(uW>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uW))
local uX=tonumber(ax("PetWishCredits"))or 0 if uX>0 then bZ(true,("%d free wishes: used before cash"):format(uX))end
local uY=tonumber(ax("FinishAllCredits"))or 0 if uY>0 then bZ(true,("%d finish-all credits (yours to use)"):format(uY))end
return table.concat(mz,"\n")end function d.extras(h3)pcall(d.quietPlots,h3 and c.plot~=nil)pcall(d.fxPatch,h3)
pcall(d.tops,h3)pcall(d.lights,h3)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uZ)
e.HideHud=uZ local mA=K:FindFirstChildOfClass("PlayerGui")if not mA then return end if uZ then for LS,fh in ipairs(mA:GetChildren())do
if fh:IsA("ScreenGui")and not d.MINE[fh.Name]and fh.Enabled then d.hud[fh]=true fh.Enabled=false end end if not d.hudConn then
d.hudConn=V(mA.ChildAdded:Connect(function(fi)if e.HideHud and fi:IsA("ScreenGui")and not d.MINE[fi.Name]then
task.defer(function()if e.HideHud and fi.Enabled then d.hud[fi]=true fi.Enabled=false end end)end end))end else
for u0 in pairs(d.hud)do pcall(function()if u0 .Parent then u0 .Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mB)e.FpsCap=mB local u1=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not u1 then return false end return pcall(u1,mB==0 and 60 or mB)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ap)if ap:IsA("BasePart")or ap:IsA("Decal")or ap:IsA("Texture")then if ap.Transparency<1 then d.unseen[ap]=ap.Transparency ap.Transparency=1 end
elseif ap:IsA("BillboardGui")or ap:IsA("SurfaceGui")or ap:IsA("ParticleEmitter")or ap:IsA("Beam")or ap:IsA("Trail")or ap:IsA("Light")or ap:IsA("Fire")or ap:IsA("Smoke")or ap:IsA("Sparkles")then
if ap.Enabled then d.unseen[ap]=true ap.Enabled=false end end end function d.notMine(ET)return e.HideMine or(c.plot and not ET:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(h4)
local mC=h4 .Parent local mD=mC and mC.Name=="SquishyStack"and mC.Parent if mD and mD~=c.plot and c.plot and mD.Parent==c.plot.Parent and not d.dropSeen[h4]then
d.dropSeen[h4]=true d.dropQ[#d.dropQ+1]={h4,z()+3}end end function d.dropScan()local u2=c.plot and c.plot.Parent
if not(e.HideBases and u2)then return end for LT,u3 in ipairs(u2:GetChildren())do local u4=u3~=c.plot and u3:FindFirstChild("SquishyStack")
for LU,EU in ipairs(u4 and u4:GetChildren()or{})do d.dropIt(EU)end end end function d.dropStep(EW)local mE=d.dropQ
while d.dropI<=#mE and os.clock()-EW<0.003 do local mF=mE[d.dropI]if mF[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mF[1].Parent then pcall(function()mF[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mE then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mG=os.clock()local fj=d.queue if e.Lite and fj and#fj>0 then d.muteI=d.muteI or 1
while d.muteI<=#fj and os.clock()-mG<0.0015 do pcall(d.muteOne,fj[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#fj then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mG)end local h5=d.hideQ if d.hideI>#h5 then return end while d.hideI<=#h5 and os.clock()-mG<0.004 do
local mH=h5[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mH.Parent and d.notMine(mH)then pcall(d.hideOne,mH)end
end if d.hideI>#h5 then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(u5)if e.HideBases then d.bases(false)end
e.HideMine=u5==2 if u5>0 then d.bases(true)end end function d.bases(u6)e.HideBases=u6 local mI=ak:FindFirstChild("Plots")
if not mI then return end if u6 then task.spawn(function()local mJ=0 for LV,h6 in ipairs(mI:GetChildren())do local u7=h6~=c.plot and c.plot and h6:FindFirstChild("SquishyStack")
for LW,EX in ipairs(u7 and u7:GetChildren()or{})do d.dropIt(EX)end if h6~=c.plot or e.HideMine then for LX,EY in ipairs(h6:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,EY)mJ=mJ+1 if mJ%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=V(mI.DescendantAdded:Connect(function(dv)if e.HideBases and d.notMine(dv)then
pcall(d.hideOne,dv)d.hideQ[#d.hideQ+1]=dv if dv.Parent and dv.Parent.Name=="SquishyStack"then d.dropIt(dv)end
end end))end else for mK,u8 in pairs(d.unseen)do pcall(function()if not mK.Parent then return end if type(u8)=="number"then mK.Transparency=u8 else mK.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(u9)e.NoRender=u9 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not u9)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local EZ=game:GetService("RunService")local mL=0 for LY,E0 in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local E1,u_=pcall(function()return EZ[E0]end)local va,mM=false,nil if E1 and u_ then va,mM=pcall(getconnections,u_)end
if va and type(mM)=="table"then for LZ,h7 in ipairs(mM)do local mN=""pcall(function()local vb=getfenv(h7 .Function).script mN=vb and vb:GetFullName()or""end)
if mN~=""then for L0,E2 in ipairs(d.CALM)do if mN:find(E2,1,true)then local mO=h7 .Function if mO and not d.calmedF[mO]and pcall(function()h7:Disable()end)then
d.calmedF[mO]=true d.calmed[#d.calmed+1]=h7 mL=mL+1 end break end end end end end end if#d.calmed>200 then local mP={}for E3=#d.calmed-49,#d.calmed do mP[#mP+1]=d.calmed[E3]end d.calmed=mP
end return mL end function d.walker()local E4,mQ=pcall(function()return require(K.PlayerScripts.LocalScript.PetHandler.Walker)end)
return(E4 and type(mQ)=="table"and type(mQ.walkTo)=="function")and mQ or nil end function d.walkers(E5)local vc={}
local E6,E7=pcall(debug.getupvalues,E5 .destroy)for L1,vd in ipairs(E6 and E7 or{})do if type(vd)=="table"then
for h8 in pairs(vd)do if type(h8)=="table"and rawget(h8,"model")~=nil and rawget(h8,"position")~=nil then vc[h8]=true end end
end end return vc end function d.walkPatch(ve)local fk=d.walker()if not fk then return 0 end if ve and not d.wkOld then
local vf=fk.walkTo d.wkOld=vf fk.walkTo=function(fl,fm,E8,mR)local E9=fm~=nil and pcall(function()return fm.X+fm.Z end)
if not e.Calm or not E9 then return vf(fl,fm,E8,mR)end fl.target,fl.onArrive=nil,nil pcall(function()fl:teleport(fm)fl:render(0)end)
if mR then task.spawn(mR)end end elseif not ve then if d.wkOld then fk.walkTo,d.wkOld=d.wkOld,nil end return 0
end local mS=0 for aM in pairs(d.walkers(fk))do if aM.target and not aM.destroyed then local vg=aM.model and aM.model:FindFirstChild("Body")and aM.model.Body:FindFirstChild("PetBillboard")
local vh=vg and vg:FindFirstChild("TimerLabel",true)if vh and tostring(vh.Text):find("'s plot!",1,true)then pcall(function()aM:destroy()end)
pcall(function()aM.model:Destroy()end)else local E_,vi=aM.target,aM.onArrive aM.target,aM.onArrive=nil,nil pcall(function()aM:teleport(E_)aM:render(0)end)
if vi then task.spawn(vi)end end mS=mS+1 end end return mS end function d.calm(vj)e.Calm=vj if vj then local Fa=d.calmScan()
local mT=0 pcall(function()mT=d.walkPatch(true)end)D(("NO ANIMATIONS: %d of the game's animation loops switched off%s"):format(Fa,mT>0 and(", "..mT.." stuck pet walks cleared")or""))
else for L2,Fb in ipairs(d.calmed)do pcall(function()Fb:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
pcall(d.walkPatch,false)end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end
if J.arPaused then pcall(J.resume,"script stopped")end pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(vk)if c.rejoining then return end D("REJOIN this server ("..vk..")")
pcall(gn)if c.autoload then pcall(ef,c.autoload)end qA()local Fc=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,K)
end)task.delay(25,function()if c.alive then eg(vk..", same server failed")end end)return Fc end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=K:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local vl=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if vl then for L3,Fd in ipairs(vl:GetChildren())do local vm=Fd:FindFirstChild("SquishyPlaceHolder")local cN=vm and vm:FindFirstChild("TimerGui")
if cN and cN:IsA("BillboardGui")then if d.bb[cN]==nil then pcall(d.muteOne,cN)elseif cN.Enabled then d.bb[cN]=true cN.Enabled=false end
end end end local Fe,dw=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Fe and type(dw)=="number"then
d.mem=dw d.memPeak=math.max(d.memPeak,dw)if(e.MemLimit or 0)>0 and dw>e.MemLimit then d.over=(d.over or 0)+((dw>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dw,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()D(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mU(h9)if type(h9)~="string"then return false end
h9=h9:lower()for L4,Ff in ipairs(c.sellWords)do if h9:find(Ff,1,true)then return true end end return false end
local function Fg()local vn=ag:FindFirstChild("Remotes")local mV=vn and vn:FindFirstChild("SellSquishy")if not(mV and mV:IsA("RemoteEvent"))then return false end
if not pcall(function()mV:FireServer()end)then return false end return ao(function()return ad()==nil end,1.5)
end local function Fh()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local vo=aq()local vp=vo and vo.HumanoidRootPart.Position local fn,vq for L5,dx in ipairs((c.plot or ak):GetDescendants())do
if dx:IsA("ProximityPrompt")and(mU(dx.ActionText)or mU(dx.ObjectText)or mU(dx.Name))then local vr=px(dx)local mW=(vr and vp)and(vr-vp).Magnitude or 1e9
if mW<=400 and(not fn or mW<vq)then fn,vq=dx,mW end end end c.sellSpot=fn c.noSellSpot=(fn==nil)return fn end
local function vs()local h_=ad()if not h_ then c.holding=false return false end if aP(h_)then return false end
if q.isLimited(h_)then return false end local mX=am(W(h_))if Fg()then c.sold,c.holding,c.sellFails=c.sold+1,false,0
c.carryBlind,c.attrStale=z()+2.5,0 D("SOLD "..mX)return true end local dy=Fh()if dy then local vt=d4(dy)if vt then
cq(vt,dy)local vu=ad()if vu and not aP(vu)then local Fi,Fj=em(dy,function()return ad()==nil end,function()return dy.Enabled end)
if Fi then c.sold,c.holding,c.sellFails=c.sold+1,false,0 D(("SOLD %s at %s via %s"):format(mX,gi(dy),Fj))return true
end end end end c.sellFails=c.sellFails+1 D("could not sell "..mX.." ("..c.sellFails..")")return false end local Fk={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Fl(dz)local ia=gi(dz):lower()for L6,Fm in ipairs(Fk)do if ia:find(Fm,1,true)then return 0 end end
local bc,as=dz.Name:lower(),0 local function a0(Fn,Fo)return Fn:find(Fo,1,true)~=nil end if a0(bc,"collect")then as=as+60 end
if a0(bc,"cash")or a0(bc,"money")then as=as+45 end if a0(bc,"income")or a0(bc,"claim")then as=as+35 end if a0(bc,"coin")or a0(bc,"earn")or a0(bc,"green")then as=as+20 end
if bc=="pad"or bc=="touch"then as=as+25 end if as==0 and(a0(ia,"collect")or a0(ia,"cash")or a0(ia,"money"))then as=25 end
if as==0 then return 0 end local fo=dz.Color if fo.G>0.5 and fo.G>fo.R*1.4 and fo.G>fo.B*1.4 then as=as+15 end
if math.min(dz.Size.X,dz.Size.Y,dz.Size.Z)<2 then as=as+5 end return as end local function Fp()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local ib,fp,mY={},nil,29 for L7,ic in ipairs(c.plot:GetDescendants())do
if ic:IsA("BasePart")then local ie=Fl(ic)if ie>0 then ib[#ib+1]={s=ie,p=ic}if ie>mY then fp,mY=ic,ie end end end
end table.sort(ib,function(Fq,Fr)return Fq.s>Fr.s end)c.padCands,c.padPart=ib,fp if fp then D("collect pad: "..gi(fp).." (score "..mY..")")end
return fp end local mZ="SAB_pad_v1.txt"local function Fs(Ft)if type(writefile)=="function"then pcall(writefile,mZ,table.concat({Ft:GetComponents()},","))end
end local function Fu()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Fv,vv=pcall(function()if isfile(mZ)then return readfile(mZ)end end)
if not Fv or type(vv)~="string"then return nil end local ig={}for Fw in vv:gmatch("[^,]+")do ig[#ig+1]=tonumber(Fw)end
if#ig==12 then return CFrame.new(unpack(ig))end end local function Fx(m0,ih,Fy)local Fz=db(m0)local m1=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local a1=(m1 and m1:IsA("BasePart"))and(m1 .Position-ih)or Vector3 .new(1,0,0)a1=Vector3 .new(a1 .X,0,a1 .Z)if a1 .Magnitude<0.05 then a1=Vector3 .new(1,0,0)end
a1=a1 .Unit for FA=0,7 do local ii=FA*math.pi/4 local FB=Vector3 .new(a1 .X*math.cos(ii)-a1 .Z*math.sin(ii),0,a1 .X*math.sin(ii)+a1 .Z*math.cos(ii))
local ij=ih+FB*(Fy+5)local m2=gX(ij.X,ih.Y,ij.Z)if m2 and math.abs(m2 .Y-ih.Y)<8 then aE(m0,Vector3 .new(ij.X,m2 .Y+Fz,ij.Z))
if kr(m0,0.7)then return true end end end return false end local function FC()c.lastCollect=z()local fq=aq()if not fq then return end
local vw,FD=fq.HumanoidRootPart,db(fq)local fr,vx,fs,m3=nil,4,nil,"?"local m4=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and m4 and m4:IsA("BasePart")then fr,m3=(m4 .CFrame*c.manualPad).Position,"manual pad"else local bw=Fp()
if bw then fr=Vector3 .new(bw.Position.X,bw.Position.Y+bw.Size.Y/2+FD,bw.Position.Z)vx,fs,m3=math.max(bw.Size.X,bw.Size.Z)/2,bw,bw.Name
end end if not fr then D("COLLECT: pad not found - stand on it and tap SET PAD")return end local m5=bk()aE(fq,fr)
if fs and type(firetouchinterest)=="function"then pcall(firetouchinterest,vw,fs,0)end ah(e.PadDwell)if fs and type(firetouchinterest)=="function"then pcall(firetouchinterest,vw,fs,1)end
ah(0.5)c.collected=c.collected+1 local m6=bk()D(("COLLECTED (%s) %s"):format(m3,(m5 and m6 and m6>m5)and("+$"..av(m6-m5))or"no cash change seen"))
Fx(fq,fr,vx)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end q.limNames={pecanpie=true,turkey=true}
function q.isLimited(vy)if type(vy)~="string"then return false end local m7=W(vy)if q.limNames[m7]or ae.rar[m7]=="Limited"then return true end
pcall(q.mods)for FE,vz in pairs(q.si or{})do if type(vz)=="table"and vz.rarity=="Limited"and W(FE)==m7 then return true end
end return false end function q.limitedHere()local m8=e.MainAccount return type(m8)~="string"or m8==""or m8:lower()==K.Name:lower()
end function q.mods()if q.si and z()-q.modAt<120 then return true end local m9=ag:FindFirstChild("Modules")if not m9 then return false end
local function ik(FF)local vA=m9:FindFirstChild(FF)if not vA then return nil end local FG,vB=pcall(require,vA)
return(FG and type(vB)=="table")and vB or nil end q.si,q.arm,q.ci=ik("SquishyInfo"),ik("AutoRollRules"),ik("CrateInfo")
q.modAt=z()pcall(function()for L8,m_ in ipairs(m9:GetChildren())do if m_:IsA("ModuleScript")and m_.Name:match("^%u%a+Config$")then
local il=ik(m_.Name)for L9,na in ipairs({"freeButter","paidButter"})do if il and type(il[na])=="string"and il[na]~=""then q.limNames[W(il[na])]=true end
end end end end)if not q.si then return false end local nb={}if q.arm and type(q.arm.tierOf)=="table"then for nc in pairs(q.arm.tierOf)do
local im=q.si[nc]if type(im)=="table"and im.rarity~="Limited"and not im.incomeType and not im.hiddenAfter then nb[W(nc)]=nc end
end end q.roll=nb local io={}for FH,FI in pairs(nb)do local ft=q.si[FI]if type(ft)=="table"and type(ft.income)=="number"and not ft.incomeType then
io[#io+1]={k=FH,inc=ft.income,pr=tonumber(ft.price)or 0}end end table.sort(io,function(nd,ne)if nd.inc~=ne.inc then return nd.inc>ne.inc end return nd.pr>ne.pr end)
q.order=io local ip,nf,ng local FJ=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for FK,nh in pairs(FJ)do
local ni=type(nh)=="table"and tonumber(nh.price)if ni and(not nf or ni>nf)then ip,nf,ng=FK,ni,nh.title end end
q.bestCrate,q.bestCrateName=ip and M.key(ip),ip q.bestCrateTitle=ng and M.key(ng)or nil return true end function q.rank(FL)
local FM,FN=pcall(function()return q.arm.rankOf(FL)end)return(FM and tonumber(FN))or 0 end function q.loadDisc(vC)
if type(vC)~="table"then return end local vD={}for FO,FP in pairs(vC)do if FP then vD[W(tostring(FO))]=true end end
q.disc,q.discAt=vD,z()end function q.fetch()q.discAt=z()local vE=ag:FindFirstChild("Remotes")local vF=vE and vE:FindFirstChild("GetSquishiesDiscovered")
if not vF then return end local FQ,FR=pcall(function()return vF:InvokeServer()end)if FQ then q.loadDisc(FR)end
end function q.scanWax()local nj={}local vG=c.plot and c.plot:FindFirstChild("WaxStations")if vG then for L_,vH in ipairs(vG:GetChildren())do
local vI=vH:FindFirstChild("SquishyPlaceHolder")if vI and vH:GetAttribute("HasSquishy")then for Ma,vJ in ipairs(vI:GetChildren())do if vJ:IsA("Model")then nj[W(vJ.Name)]=true end end
end end end for vK,FS in pairs(q.placedAt)do if z()-FS<20 then nj[vK]=true else q.placedAt[vK]=nil end end q.waxing=nj
end function q.compute()local vL,nk,nl={},0,0 if q.disc then for nm in pairs(q.roll or{})do if not q.disc[nm]then
if q.waxing[nm]then nl=nl+1 else vL[nm],nk=true,nk+1 end end end end q.need,q.nNeed,q.nWax=vL,nk,nl local vM,nn={},e.Best or 0
local no=(nn==4)and q.stackMin or nil for FV,vN in ipairs(q.order)do if(no and vN.inc>no)or(not no and FV<=(nn==4 and 1 or nn))then vM[vN.k]=true end
end q.best=vM end function q.readStack()q.stackAt=z()local vO=ag:FindFirstChild("Remotes")local vP=vO and vO:FindFirstChild("EditStack")
if not vP then return end local FW,dA=pcall(function()return vP:InvokeServer("State",nil)end)if not(FW and type(dA)=="table"and type(dA.state)=="table"and type(dA.state.entries)=="table")then return end
local iq for Mb,vQ in ipairs(dA.state.entries)do local fu=type(vQ)=="table"and q.si and q.si[tostring(vQ.name)]
if type(fu)=="table"and type(fu.income)=="number"and not fu.incomeType and(not iq or fu.income<iq)then iq=fu.income end
end q.stackMin=iq q.stackFull=#dA.state.entries>=(tonumber(dA.state.capacity)or 100)end function q.want(np)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[np]then return true end elseif e.Targets[np]then return true end return e.AutoIndex==true and q.need[np]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(FX)local fv=W(FX)q.placedAt[fv],q.waxing[fv]=z(),true if q.need[fv]then q.need[fv],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
D(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(am(fv)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fw,fy={},{}for FY,FZ in pairs(q.roll or{})do if q.want(FY)then fw[FZ]=true end end
for vR,nq in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if M.wanted(vR)or(type(nq)=="table"and type(nq.title)=="string"and M.wanted(nq.title))then fy[vR]=true end
end if not next(fw)and not next(fy)then return nil end if q.arm and type(q.arm.encode)=="function"then local F0,vS=pcall(q.arm.encode,{rarities={},butters=fw,crates=fy,index=false})
if F0 and type(vS)=="string"then return vS end end local function vT(F1)local ir={}for F2 in pairs(F1)do ir[#ir+1]=F2 end table.sort(ir)return table.concat(ir,",")end
local fz="adv:"if next(fw)then fz=fz..";butters:"..vT(fw)end if next(fy)then fz=fz..";crates:"..vT(fy)end return fz
end function q.canon(F3)local is={}for vU in tostring(F3 or""):gmatch("[^;]+")do local nr,vV=vU:match("^(%a+):(.*)$")
if not nr then nr,vV="r",vU:gsub("^adv:","")end for F4 in vV:gmatch("[^,]+")do is[#is+1]=nr.."="..F4 end end table.sort(is)
return table.concat(is,"|")end function q.sync(F5)if K:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cO=q.rulesNow()if not cO or#cO>1900 then return end if q.canon(K:GetAttribute("AutoRollRules"))==q.canon(cO)then q.fails=0 return end
if not F5 and z()-q.sentAt<4 then return end local vW=ag:FindFirstChild("Remotes")local vX=vW and vW:FindFirstChild("AutoRollAction")
if not vX then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 D("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()E.replaying=true pcall(function()vX:FireServer("Rules",cO)end)E.replaying=false e.ARrules=cO
local it,iu=0,0 for Mc in(cO:match("butters:([^;]*)")or""):gmatch("[^,]+")do it=it+1 end for Md in(cO:match("crates:([^;]*)")or""):gmatch("[^,]+")do iu=iu+1 end
local vY=it.."/"..iu if q.told~=vY then q.told=vY D(("auto roll now stops on %d butters and %d crates"):format(it,iu))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aS={}if e.AutoIndex then aS[#aS+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fA=0 for Me in pairs(q.best)do fA=fA+1 end
aS[#aS+1]=fA==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fA,fA==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aS[#aS+1]="best: "..am(q.order[1].k)end if e.BestCrate and q.bestCrateName then aS[#aS+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if P.got>0 then aS[#aS+1]="shower: "..P.got end q.msg=#aS>0 and table.concat(aS," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(F6)q.feed[#q.feed+1]=os.date("%H:%M ")..F6 if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vZ,az,iv)if vZ~="Effect"then q.feedAdd(tostring(vZ)..(az~=nil and(": "..tostring(az):sub(1,80))or""))
return end if az~="ShowerTaken"and az~="GoalPoint"then q.feedAdd(tostring(az))end if az=="Shower"then P.add(iv)return end
if az=="ShowerTaken"then P.gone(iv)return end if az=="ShowerClear"then P.drops={}return end if az=="WaxGlow"then
local ns=type(iv)=="table"and tonumber(iv.SnapAt)if ns then q.snapAt=ns D(("ADMIN: every wax finishes in %ds%s"):format(math.floor(ns-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end az=tostring(az)cm("Admin "..az)if az~="GoalPoint"and z()-(q.heard[az]or-100)>30 then q.heard[az]=z()
D("ADMIN: "..az)end end P.drops,P.tried,P.got,P.miss={},{},0,0 function P.add(nt)if type(nt)~="table"or type(nt.Pieces)~="table"then return end
for Mf,a2 in pairs(nt.Pieces)do if type(a2)=="table"and a2 .Id~=nil and a2 .Position~=nil then P.drops[a2 .Id]={id=a2 .Id,butter=tostring(a2 .Butter or"?"),rar=tostring(a2 .Rarity or"?"),star=a2 .Star==true,
pos=a2 .Position,opens=tonumber(a2 .OpensAt)or 0,ends=tonumber(a2 .ExpiresAt)or 0}end end end function P.gone(fB)
if type(fB)~="table"or fB.Id==nil then return end P.drops[fB.Id]=nil if tonumber(fB.UserId)==o.uid then P.mine=fB.Id end
end function P.pick()local nu=o.srv()local nv,v0 for v1,cP in pairs(P.drops)do if nu>=cP.ends-0.3 then P.drops[v1]=nil
elseif nu>=cP.opens-0.2 and(P.tried[v1]or 0)<3 then local v2=(aP(cP.butter)and 1e6 or 0)+(cP.star and 1e5 or 0)+q.rank(cP.rar)*100-(cP.ends-nu)
if not nv or v2>v0 then nv,v0=cP,v2 end end end return nv end function P.due()return e.Shower and c.running and next(P.drops)~=nil and not ad()and P.pick()~=nil
end function P.grab()local aT,nw=P.pick(),aq()if not(aT and nw)then return end P.tried[aT.id]=(P.tried[aT.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aE(nw,aT.pos+Vector3 .new(0,db(nw)+0.5,0))ao(function()return P.mine==aT.id or ad()~=nil or not P.drops[aT.id]end,1.5)
if P.mine==aT.id or ad()then P.got,P.drops[aT.id]=P.got+1,nil D(("GRABBED %s [%s]%s from the admin shower"):format(am(W(aT.butter)),aT.rar,aT.star and" (star)"or""))
elseif not P.drops[aT.id]then P.miss=P.miss+1 end end local fC local function v3()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 D("trying again after being stopped for 5 minutes")fC(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not aq()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bF(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local nx,v4=gk()
local dB=ad()if dB then local b0=am(W(dB))if q.isLimited(dB)and not q.limitedHere()then return nil,("holding %s - Limited butters go to %s, never waxed or sold here"):format(b0,e.MainAccount),"wait"
end if not aP(dB)and not q.isLimited(dB)then local ny=(ab.gift and W(ab.gift)==W(dB)and z()-ab.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(b0,ny),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(b0,ny),"bad"end return"sell",("selling %s (%s)"):format(b0,ny),"warn"
end if e.NoWax then return nil,("holding %s - no waxing on this account (it is given away)"):format(b0),"wait"end
if nx<1 then return nil,("holding %s - 0 free stations"):format(b0),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(b0),"wait"end
return"place",("waxing %s (%d free)"):format(b0,nx),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local nz=c.plot:FindFirstChild("CrateStand")if nz then for Mg,fD in ipairs(nz:GetDescendants())do
if fD:IsA("ProximityPrompt")and fD.Enabled and kI(fD)then local bx=fD.ObjectText if bx==""then bx=c5(nz,"TitleLabel")or""end
if bx~=""and M.wanted(bx)then local F7=gg(bx):gsub("crate$","")local v5 for v6 in pairs(ae.members)do if gg(v6)==F7 then v5=v6 end end
j.waiting,j.at,j.title,j.prompt=true,z(),bx,fD j.data={name=(bx:gsub("%s","")),rarity=v5,title=bx}D(bx.." found waiting on your stand")
end break end end end end local v7=M.wanted(j.data and j.data.name)or M.wanted(j.title)if e.Crates and(j.on or j.waiting)and v7 then
local a3=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a3),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 D("could not press the "..a3 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a3),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a3),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a3,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a3),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a3,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a3,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil D("trying the "..a3 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a3),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a3,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not v7 then local v8=j.title..tostring(j.rolledAt)if j.told~=v8 then j.told=v8 D(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and M.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if nx<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(v4,v4),"wait"
end local nA=pL()if not nA then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dC=ck()
if dC and q9(dC.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dC.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dC.name),"bad"end if not rs()then return nil,("%s rolled - waiting for it to land on the stand"):format(dC.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dC.name),"ok"end local b1=kp()if b1 .state~="match"then
c.matchSince=nil if b1 .state=="skip"and not nA.Enabled then return nil,b1 .text.." (sold out)","idle"end return nil,b1 .text,b1 .level
end if not nA.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local dD=z()if dD<c.noCashUntil then
local v9,F8=cl()if v9 then return nil,("cash short: have $%s, price ~$%s"):format(av(v9),av(F8)),"bad"end return nil,(cl()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
av(bk()),math.ceil(c.noCashUntil-dD)),cl()and"bad"or"wait"end if dD-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
do local v_,wa=cl()if v_ then c.noCashUntil=dD+8 return nil,("cash short: have $%s, price %s - not buying"):format(av(v_),wa==math.huge and"unreadable"or("~$"..av(wa))),"bad"
end end c.matchSince=c.matchSince or dD local wb=dD-c.matchSince if wb<e.Confirm then return nil,("confirming %s (%.2fs)"):format(b1 .shown,wb),"ok"end
return"buy",("buying %s via %s"):format(b1 .shown,b1 .src),"ok"end d.DEPTH=11 function d.pinTick()local wc=d.hold
if not wc then return end local nB=K.Character local nC=nB and nB:FindFirstChild("HumanoidRootPart")if not nC then return end
nC.CFrame=wc nC.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Mh,iw in ipairs(nB:GetChildren())do if iw:IsA("BasePart")and iw.CanCollide then d.noclip[iw]=true iw.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(F9,wd)d.hold=F9 if wd then d.surface=wd end end function d.unpin(F_)
if not d.hold then return end d.hold=nil for we in pairs(d.noclip)do pcall(function()if we.Parent then we.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local wf=aq()if wf and d.surface and not F_ then aE(wf,d.surface.Position,d.surface.Position+d.surface.LookVector)
ah(0.1)end end function d.home()local by,wg=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),aq()
if not(by and by:IsA("BasePart")and wg)then return nil end local wh=pA()or by.Position local ix=Vector3 .new(wh.X-by.Position.X,0,wh.Z-by.Position.Z)
ix=ix.Magnitude>0.1 and ix.Unit or Vector3 .new(0,0,1)local iy=by.Position+ix*6 local wi=gX(iy.X,by.Position.Y,iy.Z,{by})
return CFrame.new(iy.X,(wi and wi.Y or by.Position.Y)+db(wg),iy.Z)end function d.ground(Ga,wj,Gb)local nD,nE={K.Character},nil
for Mi=1,12 do local nF=RaycastParams.new()nF.FilterType=Enum.RaycastFilterType.Exclude nF.FilterDescendantsInstances=nD
local iz=ak:Raycast(Vector3 .new(Ga,wj,Gb),Vector3 .new(0,-2000,0),nF)if not iz then break end nE,wj=iz,iz.Position.Y-0.05
nD[#nD+1]=iz.Instance end return nE and nE.Position.Y end function d.parkHome()local nG=d.home()if not nG then return false end
local dE=nG.Position local Gc=d.ground(dE.X,dE.Y+300,dE.Z)or(dE.Y-3)d.pin(CFrame.new(dE.X,Gc-8,dE.Z),nG)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(iA)e.Ghost,e.GhostHelps=iA==2,iA==1 if iA<2 then task.spawn(function()while c.busy do ah(0.1)end
if d.ghostMode()<2 and d.hold and not F.home then pcall(d.unpin)end end)end d.paintGhost()D("ghost: "..d.GHOST[iA][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local Gd=aq()if not Gd or H.seat()then return end d.parkHome()end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.uid()local Ge,Gf=pcall(function()return K.UserId end)return Ge and Gf or 0 end function H.seat()local wk=ak:FindFirstChild("NightSeats")
if wk then for Mj,nH in ipairs(wk:GetChildren())do if nH.Name=="LogSeat"and nH:GetAttribute("Occupant")==H.uid()then return nH end
end end local wl=K.Character local wm=wl and wl:FindFirstChildOfClass("Humanoid")local nI=wm and wm.SeatPart return(nI and nI.Name=="LogSeat")and nI or nil
end function H.logs()local wn=ak:FindFirstChild("NightSeats")local nJ,nK={},{}for Mk,cQ in ipairs(wn and wn:GetChildren()or{})do
local nL=cQ.Name=="LogSeat"and cQ:FindFirstChildOfClass("ProximityPrompt")if nL then nJ[#nJ+1]=cQ local nM=cQ:GetAttribute("Occupant")
local Gg=(nM~=nil and nM~=0 and nM~="")or(cQ:IsA("Seat")and cQ.Occupant~=nil)if not Gg and nL.Enabled then nK[#nK+1]={st=cQ,p=nL}end
end end return nJ,nK end function H.due()if not(e.Campfire and c.running)or z()<H.nextAt then return false end
local Gh=ak:FindFirstChild("NightSeats")if not Gh then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire now (weather events)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or z()H.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(K:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
D(H.msg)return false end end return true end function H.sit()local Gi,fE=ak:FindFirstChild("NightSeats"),aq()
if not Gi or not fE then return end local iB,fF=H.logs()if#iB==0 then local Gj=ak:FindFirstChild("NightCampfire")
local Gk,nN=pcall(function()return Gj:GetPivot().Position end)if not Gk then H.nextAt,H.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()K:RequestStreamAroundAsync(nN,3)end)aE(fE,nN+Vector3 .new(0,3,9),nN)ao(function()iB,fF=H.logs()return#iB>0 end,6)
if#iB==0 then H.nextAt,H.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local wo=fE.HumanoidRootPart.Position
if#fF==0 then H.nextAt,H.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fF,function(Gl,Gm)return(Gl.st.Position-wo).Magnitude<(Gm.st.Position-wo).Magnitude end)
local nO,Gn=fF[1].st,fF[1].p d.unpin(true)local dF=nO:IsA("BasePart")and nO.CFrame or CFrame.new(nO:GetPivot().Position)
aE(fE,dF.Position+dF.LookVector*2+Vector3 .new(0,2.5,0),dF.Position)ah(0.25)local Go=em(Gn,function()return H.seat()~=nil end)
if not Go then aE(fE,dF.Position+Vector3 .new(0,2,0),dF.Position+dF.LookVector)ao(function()return H.seat()~=nil end,1.5)
end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,z()D(("SAT at the campfire (+%s%% cash)"):format(tostring(K:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=z()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then D(H.msg)end end end J.msg,J.nextAt,J.at,J.pulls,J.claims,J.pullLeft,J.collectLeft,J.events="",0,0,0,0,0,0,{}
function J.refresh()J.at=z()local nP=ag:FindFirstChild("Remotes")if not nP then return end local fG,nQ,dG=0,0,{}
local wp,dH=pcall(function()return nP.ClanRequest:InvokeServer("state")end)if wp and type(dH)=="table"and type(dH.data)=="table"then dH=dH.data end
local wq=wp and type(dH)=="table"and dH.tasks for Ml,b2 in ipairs(wq and wq.list or{})do if not b2 .done and b2 .kind=="pull"then fG=math.max(fG,(b2 .goal or 0)-(b2 .progress or 0))end
if not b2 .done then dG[#dG+1]=("%s %d/%d"):format(tostring(b2 .text),b2 .progress or 0,b2 .goal or 0)end end
J.events={}for Mm,dI in ipairs(nP:GetChildren())do if dI:IsA("RemoteFunction")and dI.Name:match("^%u%a+Action$")and dI.Name~="CrateAction"and dI.Name~="AutoRollAction"then
local Gp,fH=pcall(function()return dI:InvokeServer("state")end)if Gp and type(fH)=="table"and fH.live==true and type(fH.quests)=="table"then
J.events[#J.events+1]={r=dI,st=fH}for Mn,aU in ipairs(fH.quests)do if not aU.done and aU.kind=="pull"then fG=math.max(fG,(aU.goal or 0)-(aU.progress or 0))end
if not aU.done and aU.kind=="collect"then nQ=math.max(nQ,(aU.goal or 0)-(aU.progress or 0))end if not aU.done then dG[#dG+1]=("%s %d/%d"):format(tostring(aU.text),aU.progress or 0,aU.goal or 0)end
end end end end J.pullLeft,J.collectLeft=fG,nQ J.msg=#dG>0 and("open: "..table.concat(dG,", "))or"all quests done for today"
end function J.claim()for Mo,fI in ipairs(J.events)do local wr=fI.r.Name:gsub("Action$","")for Mp,dJ in ipairs(fI.st.quests)do
if dJ.done and not dJ.claimed then local Gq,ws=pcall(function()return fI.r:InvokeServer("claimQuest",dJ.id)end)
if Gq and not(type(ws)=="table"and ws.ok==false)then J.claims=J.claims+1 D(("CLAIMED %s quest: %s (+%s)"):format(wr,tostring(dJ.text),tostring(dJ.points or dJ.treats or"?")))
end ah(0.4)end end if fI.st.bonusReady==true then local Gr=pcall(function()return fI.r:InvokeServer("claimBonus")end)
if Gr then D(("CLAIMED %s daily quest bonus"):format(wr))end ah(0.4)end end end function J.tick()if not(e.Quests and c.running)then
if J.arPaused then J.resume("quests switched off")end return end if z()-J.at<(J.pullLeft>0 and 20 or 90)then return end
J.refresh()pcall(J.claim)if J.pullLeft<=0 and J.arPaused then J.resume("lever quests done")end end function J.pullDue()
return e.Quests and c.running and J.pullLeft>0 and z()>=J.nextAt and not E.busy end function J.lever()local wt=c.plot and c.plot:FindFirstChild("Lever")
local nR=wt and wt:FindFirstChild("Wheel")return nR and nR:FindFirstChildWhichIsA("ProximityPrompt"),nR end function J.resume(Gs)
J.arPaused=false if J.arWas then J.arWas=false e.AutoRoll=true task.spawn(E.apply,Gs)end end function J.pull()
local fJ,nS=J.lever()if not fJ or not nS or not nS:IsA("BasePart")then J.nextAt,J.msg=z()+300,"your lever was not found"return end
if not J.arPaused then J.arPaused=true J.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false E.apply("pulling the lever for a quest",true)
if E.isOn()then J.nextAt=z()+30 return end end D(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(J.pullLeft))
end if not fJ.Enabled then J.nextAt=z()+1 return end cq(nS,fJ)J.asked=nil if not(type(fireproximityprompt)=="function"and pcall(fireproximityprompt,fJ))then qW(fJ)end
J.pulls=J.pulls+1 J.pullLeft=J.pullLeft-1 ah(0.6)if J.asked then J.nextAt=z()+600 D(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(J.asked)))
J.resume("a butter the game wants kept is on the pad")return end J.nextAt=z()+2.5 if J.pullLeft<=0 then J.at=0 end
end F.skip,F.skipN,F.n,F.calls,F.fails,F.nextAt,F.msg,F.tries={},0,0,0,0,0,"off",{}function F.can(b3,Gt)local nT=b3:GetAttribute("PourOwner")
if type(nT)~="number"or nT==o.uid or not b3:GetAttribute("HasSquishy")then return false end if b3:GetAttribute("PourLong")~=true or b3:GetAttribute("PourFull")==true then return false end
local nU=b3:GetAttribute("PourId")if nU==nil or F.skip[nU]then return false end local wu,nV,Gu=b3:GetAttribute("Helpers"),0,tostring(o.uid)
if type(wu)=="string"then for Gv in wu:gmatch("[^,%s]+")do nV=nV+1 if Gv==Gu then return false end end end if nV>=6 then return false end
local iC=A.left(b3)if not iC then local wv=tonumber(b3:GetAttribute("PourEnd"))iC=wv and(wv-Gt)end if not iC or iC<=75 then return false end
local nW=game:GetService("Players"):GetPlayerByUserId(nT)if not nW or nW:GetAttribute("WaxHelpOff")==true then return false end
return true,nW,nU end function F.list()local nX,Gw={},o.srv()local ww=ak:FindFirstChild("Plots")for Mq,wx in ipairs(ww and ww:GetChildren()or{})do
local wy=wx~=c.plot and wx:FindFirstChild("WaxStations")for Mr,nY in ipairs(wy and wy:GetChildren()or{})do local Gx,Gy,Gz=F.can(nY,Gw)
local nZ=Gx and nY:FindFirstChild("SquishyPlaceHolder")if nZ and nZ:IsA("BasePart")then nX[#nX+1]={st=nY,p=Gy,id=Gz,part=nZ}end
end end return nX end function F.due()local wz=(e.MemLimit or 0)>0 and math.floor(e.MemLimit*0.72)or 900 if e.Help and c.running and z()>=F.nextAt and(d.mem or 0)>wz then
F.nextAt,F.msg=z()+30,("paused - memory %d MB > %d MB (helps load other bases)"):format(d.mem,wz)return false
end return e.Help and c.running and z()>=F.nextAt end function F.skipIt(wA,wB)F.skip[wA],F.skipN=wB,F.skipN+1
if F.skipN>600 then F.skip,F.skipN,F.tries={[wA]=wB},1,{}end end function F.goHome()local iD,b4=aq(),F.home F.home=nil
if not(iD and b4)then return end if e.Ghost and not H.seat()then d.unpin(true)if not d.parkHome()then pcall(aE,iD,b4 .Position,b4 .Position+b4 .LookVector)end
elseif d.hold or(iD.HumanoidRootPart.Position-b4 .Position).Magnitude>20 then d.unpin(true)pcall(aE,iD,b4 .Position,b4 .Position+b4 .LookVector)
end end function F.step()local n0,fK=F.list(),aq()if#n0==0 or not fK then F.nextAt=z()+15 F.msg=("helped %d waxes here%s | none to help right now"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")
F.goHome()return end local wC=fK.HumanoidRootPart local wD=wC.Position table.sort(n0,function(GA,GB)return(GA.part.Position-wD).Magnitude<(GB.part.Position-wD).Magnitude end)
local a4=n0[1]F.home=F.home or(d.hold and d.surface)or wC.CFrame local b5=a4 .part local fL=(b5 .Position+a4 .st:GetPivot().Position)/2
local iE=F.tries[a4 .id]or 0 if(e.Ghost or e.GhostHelps)and iE==0 and not H.seat()then d.pin(b5 .CFrame,F.home)
else d.unpin(true)local n1=iE==0 and gX(fL.X,b5 .Position.Y,fL.Z,{b5})if n1 and math.abs(n1 .Y-b5 .Position.Y)<8 then
aE(fK,Vector3 .new(fL.X,n1 .Y+db(fK),fL.Z),b5 .Position)else aE(fK,b5 .Position+Vector3 .new(0,b5 .Size.Y/2+3,0),fL)
end end ah(0.3)local fM=ag:FindFirstChild("Remotes")fM=fM and fM:FindFirstChild("ClanRequest")if not fM then F.nextAt,F.msg=z()+60,"the game's help remote is missing"return end
local iF,bz=pcall(function()return fM:InvokeServer("help",a4 .st:GetAttribute("PourOwner"),tonumber(a4 .st.Name))end)
if iF and type(bz)=="table"and bz.ok then F.n,F.fails=F.n+1,0 F.skipIt(a4 .id,"helped")D(("HELPED %s's wax (station %s)"):format(a4 .p.DisplayName,a4 .st.Name))
F.msg=("helped %d waxes here%s"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")elseif iF and type(bz)=="table"and tostring(bz.reason or""):lower():find("walk up",1,true)and iE<2 then
F.tries[a4 .id]=iE+1 F.nextAt=z()+0.3 elseif iF and type(bz)=="table"and tostring(bz.reason or""):lower():find("moment",1,true)then
F.waits=(F.waits or 0)+1 F.nextAt=z()+1.6 else local wE=(iF and type(bz)=="table"and tostring(bz.reason or"refused"))or("error: "..tostring(bz))
F.skipIt(a4 .id,wE)F.fails=F.fails+1 if F.fails<=3 then D(("help refused for %s's wax: %s"):format(a4 .p.DisplayName,wE))end
if F.fails>=5 then F.fails,F.nextAt,F.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
F.goHome()end end F.nextAt=math.max(F.nextAt,z()+1.2)end function F.onCall(bA)if not e.HelpGuild or type(bA)~="table"or bA.p~="help"or bA.mine or bA.u==o.uid or not bA.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fN=ag:FindFirstChild("Remotes")
fN=fN and fN:FindFirstChild("ClanRequest")if not fN then return end local wF,fO=pcall(function()return fN:InvokeServer("callHelp",bA.u)end)
local wG=tostring(bA.n or bA.un or bA.u)if wF and type(fO)=="table"and fO.ok then F.calls=F.calls+1 D(("HELPED guildmate %s's wax from here (their call)"):format(wG))
else D(("guild call from %s: %s"):format(wG,(wF and type(fO)=="table"and tostring(fO.reason or"refused"))or tostring(fO)))
end end)end local function au(GC,wH,...)if c.busy then return end c.busy,c.busyText=true,GC if d.hold and wH~=F.step then pcall(d.unpin)end
local GD,wI=pcall(wH,...)c.busy,c.busyText=false,""if not GD and wI~=jB then D("ERR "..tostring(wI))end end local function GE()
if e.Campfire and H.seat()then if j.at and H.tickAt then j.at=j.at+(z()-H.tickAt)end H.tickAt=z()H.due()c.reason,c.level=H.msg,"ok"
return end H.tickAt=nil local aV,GF,GG=v3()c.reason,c.level=GF,GG if aV=="place"then au("waxing...",A.place)elseif aV=="crate"then au("opening crate...",ex,true)
elseif aV=="cratesmart"then au("opening crate...",j.smart)elseif aV=="cratewin"then au("opening the crate window...",kK)
elseif aV=="nocrate"then au("discarding crate...",ex,false)elseif aV=="cratedrop"then au("discarding a crate that would not open...",j.drop)
elseif aV=="sell"then au("selling...",vs)elseif aV=="buy"then au("buying...",qZ,false)elseif not aV and not c.matchSince and P.due()then
au("grabbing a butter from the admin shower...",P.grab)elseif not aV and not c.matchSince and H.due()then au("sitting at the campfire...",H.sit)
elseif not aV and not c.matchSince and J.pullDue()and not ad()and not(ck()and aP(ck().name))then au("pulling the lever for a quest...",J.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(J.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
au("collecting money...",FC)elseif not aV and not c.matchSince and F.due()then au("helping a wax...",F.step)elseif F.home and not e.Help then
au("coming back...",F.goHome)elseif not c.busy then d.parkTick()end end function fC(iG,GH)if iG==c.running then return end
c.running=iG if not GH then e.AutoStart=iG end if iG then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bF()or c.plot
D("START")else c.reason="stopped"D("STOP")end end do local bd=ec(ar.auto)if bd==nil then bd=ec(ar.autoOld)end
if type(bd)=="string"then bd=bd:gsub("%s+$","")if bd~=""then c.autoload=bd local GI=ki(bd)D(GI and("loaded config "..bd)or("config "..bd.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local GJ={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local n2={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local af={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local wJ,wK,wL,wM=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if wJ and wK and wL and wM then af.x,af.b,af.m,af.r=wJ,wK,wL,wM end end)pcall(function()local wN=Enum.Font.RobotoMono if wN then af.mono=wN end end)
local function L(GK,GL,GM)local GN,n3=pcall(Instance.new,GK)if not GN then c.uiErrs=c.uiErrs+1 return nil end
for GO,GP in pairs(GL)do if not pcall(function()n3[GO]=GP end)then c.uiErrs=c.uiErrs+1 end end n3 .Parent=GM return n3
end local function aa(GQ,GR)L("UICorner",{CornerRadius=UDim.new(0,GR or 8)},GQ)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(iH,n4)if iH and a.shown[iH]~=n4 then a.shown[iH]=n4 iH.Text=n4 end
end function a.stroke(GS,GT,GU)return L("UIStroke",{Color=GT or l.line,Thickness=1,Transparency=GU or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},GS)
end function a.grad(GV,GW,GX,GY)local GZ,wO=pcall(function()return ColorSequence.new(GW,GX)end)if GZ and wO then return L("UIGradient",{Color=wO,Rotation=GY or 0},GV)end
end function a.pad(G0,wP,wQ,G1,G2)L("UIPadding",{PaddingLeft=UDim.new(0,wP or 0),PaddingTop=UDim.new(0,wQ or 0),
PaddingRight=UDim.new(0,G1 or wP or 0),PaddingBottom=UDim.new(0,G2 or wQ or 0)},G0)end function a.list(G3,G4,G5)
return L("UIListLayout",{Padding=UDim.new(0,G4 or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=G5 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},G3)
end function a.ink(n5)local G6,G7=pcall(function()return 0.299*n5 .R+0.587*n5 .G+0.114*n5 .B end)return(G6 and G7>0.55)and l.ink or l.text
end function a.nextIn(wR)local wS=(a.ord[wR]or 0)+1 a.ord[wR]=wS return wS end local n6=K:FindFirstChildOfClass("PlayerGui")or K:WaitForChild("PlayerGui")
local wT=n6:FindFirstChild("SABFarmGui")if wT then wT:Destroy()end local n7=L("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},n6)local T={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local iI=ak.CurrentCamera.ViewportSize if iI.X>100 and iI.Y>100 then T.w=math.clamp(math.floor(iI.X*0.48),320,400)
T.h=math.clamp(math.floor(iI.Y*0.86),250,360)end end)a.root=L("Frame",{Name="Root",Size=UDim2 .new(0,T.w,0,T.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},n7)
aa(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local wU=UDim2 .new(1,0,1,0)
local function Ms(wV,wW)return UDim2 .new(wV,0,0,0),UDim2 .new(wW,(wV+wW>0.99)and 0 or-4,1,0)end local function aj(G8,G9,fP,G_,Ha,Hb)
local n8=L("TextButton",{Text=G9,Position=Ha,Size=Hb,BackgroundColor3=fP,BorderSizePixel=0,Font=af.b,TextSize=G_,TextColor3=a.ink(fP),AutoButtonColor=true},G8)
aa(n8,8)if fP==l.panel2 or fP==l.raise or fP==l.panel then a.stroke(n8,l.line,0.4)end return n8 end local function iJ(Hc,Hd,He,Hf,Hg)
local iK=L("TextBox",{Text=Hd,PlaceholderText=He,Position=Hf,Size=Hg,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Hc)aa(iK,8)a.stroke(iK,l.line,0)a.pad(iK,9,0,6,0)
return iK end local iL=ak.CurrentCamera local function Hh()local Hi,iM=pcall(function()return iL and iL.ViewportSize end)
if Hi and iM and iM.X>50 and iM.Y>50 then return iM end end local function b6(fQ)local n9=Hh()if not(n9 and fQ and fQ.Parent)then return end
local Hj=pcall(function()local iN,wX=fQ.AbsolutePosition,fQ.AbsoluteSize local n_=70 local wY=math.clamp(iN.X,n_-wX.X,n9 .X-n_)
local wZ=math.clamp(iN.Y,0,n9 .Y-math.min(wX.Y,n_))if math.abs(wY-iN.X)>0.5 or math.abs(wZ-iN.Y)>0.5 then fQ.Position=UDim2 .new(0,math.floor(wY),0,math.floor(wZ))
end end)return Hj end local function iO(Hk)local Hl,oa=pcall(function()return Hk.AbsolutePosition end)if Hl and oa then return{math.floor(oa.X),math.floor(oa.Y)}end
end local dK={}c.dragMoved={}local function w0(fR,w1,ob)V(fR.InputBegan:Connect(function(dL)if dL.UserInputType~=Enum.UserInputType.MouseButton1 and dL.UserInputType~=Enum.UserInputType.Touch then return end
local oc={start=dL.Position,from=w1 .Position,moved=0,target=w1,input=dL,onDrop=ob}dK[fR],c.dragMoved[fR]=oc,0
local od od=dL.Changed:Connect(function()if dL.UserInputState==Enum.UserInputState.End and dK[fR]==oc then dK[fR]=nil
if od then od:Disconnect()end if ob then ob(oc.moved)end end end)end))end V(pj.InputChanged:Connect(function(iP)
if iP.UserInputType~=Enum.UserInputType.MouseMovement and iP.UserInputType~=Enum.UserInputType.Touch then return end
for Hm,be in pairs(dK)do local oe=be.target if oe and oe.Parent then local w2,w3=iP.Position.X-be.start.X,iP.Position.Y-be.start.Y
be.moved=math.max(be.moved,math.abs(w2)+math.abs(w3))c.dragMoved[Hm]=be.moved oe.Position=UDim2 .new(be.from.X.Scale,be.from.X.Offset+w2,be.from.Y.Scale,be.from.Y.Offset+w3)
end end end))V(pj.InputEnded:Connect(function(iQ)if iQ.UserInputType~=Enum.UserInputType.MouseButton1 and iQ.UserInputType~=Enum.UserInputType.Touch then return end
for Hn,iR in pairs(dK)do if iR.input==iQ or iQ.UserInputType==Enum.UserInputType.MouseButton1 then dK[Hn]=nil
if iR.onDrop then iR.onDrop(iR.moved)end end end end))local function Q(Ho,Hp,Hq,Hr,Hs,Ht,Hu)return L("TextLabel",{Text=Hp,Position=Ht or UDim2 .new(0,0,0,0),Size=Hu or wU,BackgroundTransparency=1,
Font=Hs and af.b or af.m,TextSize=Hq,TextColor3=Hr,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Ho)
end function a.row(w4,Hv)return L("Frame",{Size=UDim2 .new(1,0,0,Hv),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(w4)},w4)end function a.card(w5,w6,w7)local dM=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(w5)},w5)aa(dM,11)a.stroke(dM,l.line,0.25)a.list(dM,5)a.pad(dM,8,8,8,9)
if w6 then local of=a.row(dM,14)L("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},of)Q(of,w6:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if w7 then local Hw=Q(of,w7,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Hw.TextXAlignment=Enum.TextXAlignment.Right end end return dM end function a.heading(Hx,Hy,og)local oh=a.row(Hx,og and 34 or 22)
Q(oh,Hy,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=af.x if og then Q(oh,og,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return oh end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(oi)local aN=a.sw[oi]if not aN then return end
local dN=tostring(oi.Text or""):match(":%s*(.-)%s*$")or""local b7=dN~=""and not a.OFF[dN]local oj=not aN.chips and(dN=="ON"or dN=="OFF")
aN.pill.Visible,aN.chip.Visible=oj,not oj if oj then aN.pill.BackgroundColor3=b7 and l.accent or l.panel2 aN.knob.Position=b7 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aN.knob.BackgroundColor3=b7 and l.white or l.dim else aN.chip.Text=dN~=""and dN or"-"aN.chip.BackgroundColor3=b7 and l.accent or l.panel2
aN.chip.TextColor3=b7 and l.ink or l.dim end oi.BackgroundColor3=b7 and l.lit or l.raise if aN.edge then aN.edge.Color=b7 and l.accent or l.line aN.edge.Transparency=b7 and 0.55 or 0.45 end
end function a.switch(w8,Hz,HA,fS)local a5=L("TextButton",{Name="Switch",Text=Hz,TextTransparency=1,TextSize=8,Font=af.b,
Size=UDim2 .new(1,0,0,fS and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(w8)},w8)
aa(a5,9)local ay={edge=a.stroke(a5,l.line,0.45)}ay.title=Q(a5,HA,11,l.text,true,UDim2 .new(0,10,0,fS and 4 or 0),UDim2 .new(1,-100,0,fS and 15 or 28))
ay.title.TextWrapped,ay.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fS then ay.sub=Q(a5,fS,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
ay.sub.TextWrapped,ay.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end ay.pill=L("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a5)aa(ay.pill,9)ay.knob=L("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},ay.pill)aa(ay.knob,7)ay.chip=L("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=af.b,TextSize=9,TextColor3=l.dim,Text=""},a5)
aa(ay.chip,9)a.pad(ay.chip,10,0,10,0)L("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},ay.chip)
ay.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a5]=ay V(a5:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a5)end))
a.skin(a5)return a5 end function a.chips(ol)if a.sw[ol]then a.sw[ol].chips=true a.skin(ol)end end function a.line(HB,HC)
local w9=a.row(HB,15)local w_=L("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=HC or l.dim,
BorderSizePixel=0},w9)aa(w_,3)local om=Q(w9,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))om.TextWrapped,om.TextTruncate=false,Enum.TextTruncate.AtEnd
return om,w_ end function a.grow(xa,HD,HE)local iS=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=af.m,TextSize=HD or 10,TextColor3=HE or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(xa)},xa)
V(iS:GetPropertyChangedSignal("Text"):Connect(function()iS.Visible=iS.Text~=""end))return iS end function a.note(HF,HG)
local xb=a.grow(HF,9,l.dim)xb.Text=HG return xb end function a.actions(HH,xc)local HI=a.row(HH,28)local xd,oo={},#xc
for fT,xe in ipairs(xc)do xd[fT]=aj(HI,xe[1],xe[2]or l.panel2,10,UDim2 .new((fT-1)/oo,fT>1 and 3 or 0,0,0),UDim2 .new(1/oo,(fT>1 and-3 or 0)+(fT<oo and-3 or 0),1,0))
end return table.unpack(xd)end local function O(cR,iT,HJ,HK)a.put(cR,iT and HJ or HK)if not a.sw[cR]and a.lit[cR]~=iT then
a.lit[cR]=iT cR.BackgroundColor3=iT and l.accent or l.panel2 cR.TextColor3=a.ink(cR.BackgroundColor3)end end a.title=L("Frame",{Size=UDim2 .new(1,0,0,T.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
aa(a.title,14)L("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
L("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local op=L("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
aa(op,8)a.grad(op,l.accent,l.accent2,45)local xf=Q(op,"C",16,l.ink,true)xf.Font,xf.TextXAlignment=af.x,Enum.TextXAlignment.Center
local HL=Q(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))HL.Font=af.x Q(a.title,"butter farm  "..cd,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
end a.pill=L("Frame",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-66,0.5,0),Size=UDim2 .new(0,78,0,22),
BackgroundColor3=l.raise,BorderSizePixel=0},a.title)aa(a.pill,11)a.pillEdge=a.stroke(a.pill,l.line,0.2)a.dot=L("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(0,9,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.pill)
aa(a.dot,4)a.runL=Q(a.pill,"STOPPED",9,l.dim,true,UDim2 .new(0,22,0,0),UDim2 .new(1,-26,1,0))a.minB=aj(a.title,"-",l.raise,14,UDim2 .new(1,-60,0.5,-12),UDim2 .new(0,24,0,24))
a.xB=aj(a.title,"X",l.raise,11,UDim2 .new(1,-32,0.5,-12),UDim2 .new(0,24,0,24))a.xB.TextColor3=l.bad a.strip=L("Frame",{Position=UDim2 .new(0,T.rail+8,0,T.head+6),Size=UDim2 .new(1,-(T.rail+16),0,T.status),
BackgroundColor3=l.raise,BorderSizePixel=0},a.root)aa(a.strip,9)a.stroke(a.strip,l.line,0.3)a.bar=L("Frame",{Size=UDim2 .new(0,3,1,-12),Position=UDim2 .new(0,7,0,6),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
aa(a.bar,2)a.reason=Q(a.strip,"starting",10,l.text,false,UDim2 .new(0,16,0,1),UDim2 .new(1,-22,1,-2))a.reason.TextTruncate=Enum.TextTruncate.AtEnd
a.railBg=L("Frame",{Position=UDim2 .new(0,0,0,T.head),Size=UDim2 .new(0,T.rail,1,-T.head),BackgroundColor3=l.panel,
BorderSizePixel=0},a.root)aa(a.railBg,14)L("Frame",{Size=UDim2 .new(1,0,0,14),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
L("Frame",{Size=UDim2 .new(0,14,1,0),Position=UDim2 .new(1,-14,0,0),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
a.tabs=L("Frame",{Position=UDim2 .new(0,0,0,T.head),Size=UDim2 .new(0,T.rail,1,-T.head),BackgroundTransparency=1,
BorderSizePixel=0},a.root)a.railLine=L("Frame",{Size=UDim2 .new(0,1,1,-T.head),Position=UDim2 .new(0,T.rail-1,0,T.head),BackgroundColor3=l.line,
BorderSizePixel=0},a.root)do local HM=a.list(a.tabs,3)pcall(function()HM.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((T.h-T.head-12)/10)-3,20,34)local function bf(HN,HO,HP)
local iU=L("TextButton",{Text=HN,Font=af.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)aa(iU,9)local xg=L("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iU)aa(xg,2)a.tabsAll[#a.tabsAll+1]={b=iU,bar=xg,name=HO,sub=HP}return iU end
a.tabFarm=bf("🏠","Home","what the farm is doing")a.tabRun=bf("🌾","Farm","the buy - wax - collect loop")a.tabBut=bf("🧈","Butters","what gets bought and waxed")
a.tabCrt=bf("📦","Crates","which crates get opened")a.tabPet=bf("🐾","Pets","adopt, wish, fuse")a.tabTeam=bf("👥","Teams","the right pets at the right moment")
a.tabSrv=bf("🤝","Server","helping, campfire, ghost")a.tabAdm=bf("⚡","Admin","admin abuse and its boosts")a.tabSet=bf("⚙","Settings","configs, startup, performance")
a.tabAlt=bf("🔗","Alts","several accounts working together")local function bh()local oq=L("ScrollingFrame",{Position=UDim2 .new(0,T.rail,0,T.head+T.status+10),
Size=UDim2 .new(1,-T.rail,1,-(T.head+T.status+10)),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,
CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)
a.list(oq,8)a.pad(oq,8,2,10,12)return oq end a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bh(),bh(),bh(),bh(),bh(),bh(),bh(),bh(),bh()
a.farm.Visible=true a.alt=bh()do local fU=a.farm local xh=a.row(fU,34)a.startB=aj(xh,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=af.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(xh,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local HQ=a.row(fU,44)local function fV(xi,HR,xj)local iV=L("Frame",{Position=UDim2 .new((xi-1)/xj,xi>1 and 2 or 0,0,0),Size=UDim2 .new(1/xj,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},HQ)aa(iV,9)a.stroke(iV,l.line,0.3)local iW=Q(iV,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iW.Font,iW.TextXAlignment,iW.TextWrapped=af.x,Enum.TextXAlignment.Center,false local HT=Q(iV,HR,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
HT.TextXAlignment=Enum.TextXAlignment.Center return iW end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fV(1,"BOUGHT",5),fV(2,"WAXED",5),fV(3,"SOLD",5),fV(4,"MONEY",5),fV(5,"FREE",5)
local xk=a.card(fU,"Right now")a.info=Q(a.row(xk,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=Q(a.row(xk,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fW=a.card(fU,"Systems")
a.helpL=a.line(fW,l.info)a.campL=a.line(fW,l.accent2)a.questL=a.line(fW,l.good)a.arL=a.line(fW,l.accent)a.ixL=a.line(fW,n2 .Dotonbori)
local xl=a.card(fU,"Activity")a.log=L("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(xl)},xl)
aa(a.log,7)a.pad(a.log,7,5,7,5)end local function Mt(HU,HV)return a.row(HV or a.farm,HU)end local an do local ot=a.run
a.heading(ot,"Farm","buy what rolls, wax it, collect the cash")local fX=a.card(ot,"Loop")a.colT=a.switch(fX,"COLLECT: ON","Collect cash","step on the collector by itself")
an=a.row(fX,26)Q(an,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=iJ(an,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
Q(an,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fX,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fX,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fX,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local ou=a.card(ot,"By hand")
a.buyB,a.plB=a.actions(ou,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(ou,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
an=a.row(ou,28)a.padB=aj(an,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=Q(an,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iX=a.but a.heading(iX,"Butters","what gets bought and waxed")local xm=a.card(iX,"Strategy")a.ixT=a.switch(xm,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(xm,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iX)},iX)a.list(a.butList,5)end do local iY=a.crt a.heading(iY,"Crates","only ticked crates are opened")
local xn=a.card(iY,"Opening")a.crateT=a.switch(xn,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(xn,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iY)},iY)a.list(a.crtList,5)end do local fY=a.pet a.heading(fY,"Pets","adopt, wish, fuse Bigs and Huges")
local fZ=a.card(fY,"Automatic")a.pbT=a.switch(fZ,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fZ,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fZ,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fZ,10,l.dim)a.note(fZ,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local xo=a.card(fY,"The plan","best teams with every pet")a.planInfo=a.grow(xo,10,l.text)a.note(xo,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fY)},fY)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iZ=a.srv a.heading(iZ,"Server","other players, the campfire, staying hidden")
local ov=a.card(iZ,"Helping")a.helpT=a.switch(ov,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(ov,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(ov,l.info)
local xp=a.card(iZ,"Campfire")a.campT=a.switch(xp,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(xp,l.accent2)local ow=a.card(iZ,"Ghost")a.ghostT=a.switch(ow,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(ow,l.dim)a.note(ow,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local f0=a.adm a.heading(f0,"Admin abuse","the show, its boosts and the farm in it")local xq=a.card(f0,"When")
a.admBig=Q(a.row(xq,22),"-",15,l.text,true)a.admBig.Font=af.x a.admSub=Q(a.row(xq,14),"",10,l.dim,false)local HW=a.card(f0,"Boosts now")
a.admBoost=a.grow(HW,11,l.text)local ox=a.card(f0,"What the farm does")a.shT=a.switch(ox,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(ox,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(ox,l.accent)
local xr=a.card(f0,"Show feed")a.admFeed=L("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(xr)},xr)
aa(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cS=a.set a.heading(cS,"Settings","kept on your phone, per config")
local i0=a.card(cS,"Config")an=a.row(i0,28)a.cfgName=iJ(an,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=aj(an,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=aj(an,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
an=a.row(i0,26)a.cfgPrev=aj(an,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=aj(an,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=aj(an,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(i0,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(i0,10,l.dim)local oy=a.card(cS,"Starting")a.startT=a.switch(oy,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(oy,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(oy,9,l.dim)local oz=a.card(cS,"If the game drops me")
a.rejT=a.switch(oz,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(oz,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(oz,9,l.dim)local bB=a.card(cS,"Performance")a.pfCalm=a.switch(bB,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bB,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bB,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bB,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bB,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bB,"STOP 3D: OFF","Stop 3D","blank the world behind this window")an=a.row(bB,28)Q(an,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=iJ(an,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))Q(an,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bB,l.good)a.note(bB,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local HY=a.card(cS,"Your game passes","read from the game")a.passInfo=a.grow(HY,10,l.text)local HZ=a.card(cS,"About")
a.note(HZ,"CHURN "..cd.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Mu,H0 in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(H0)end local xs=L("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},n6)
a.tgRoot=L("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},xs)aa(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=L("TextButton",{Text="C",Size=wU,BackgroundTransparency=1,Font=af.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=L("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
aa(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=L("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=af.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
aa(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local f1=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[f1][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[f1][2]
a.tgGhost.BackgroundColor3=f1==2 and l.accent or(f1==1 and l.warn or l.panel)a.tgGhost.TextColor3=f1>0 and l.ink or l.dim
end end local bC={built=false,boxes={},at=0}function a.check(i1,oA)i1 .Text=oA and"✓"or""i1 .BackgroundColor3=oA and l.accent or l.bg
i1 .TextColor3=l.ink local oB=i1 .Parent if oB and oB:IsA("TextButton")then oB.BackgroundColor3=oA and l.lit or l.raise end
end local function xt(xu,xv)e.Targets[xu]=xv or nil local xw=bC.boxes[xu]if xw then a.check(xw,xv)end end local function oC()
for H1,H2 in pairs(bC.boxes)do a.check(H2,e.Targets[H1]==true)end end function a.tickBox(H3)local oD=L("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},H3)aa(oD,6)
a.stroke(oD,l.line,0)return oD end local f2 local function H4()local H5=a.card(a.butList,"Butter list")local oE=a.row(H5,26)
a.butInfo=Q(oE,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local H6=aj(oE,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local H7=aj(oE,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))H6 .MouseButton1Click:Connect(function()
for H8 in pairs(e.Targets)do e.Targets[H8]=nil end oC()end)H7 .MouseButton1Click:Connect(function()ae.at=0 kc()
f2(true)end)end f2=function(H9)if not kc()then if not a.butEmpty then a.butEmpty=Q(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bC.built and not H9 and bC.at==ae.at then return end for Mv,i2 in ipairs(a.butList:GetChildren())do
if i2:IsA("Frame")or i2:IsA("TextButton")or i2:IsA("TextLabel")then i2:Destroy()end end bC.boxes,a.butEmpty={},nil
H4()for Mw,i3 in ipairs(ae.rarOrder)do local oF=n2[i3]or l.text local cT=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)aa(cT,11)a.stroke(cT,oF,0.7)a.list(cT,4)a.pad(cT,7,7,7,8)
local oG=a.row(cT,22)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=oF,BorderSizePixel=0},oG)
local H_=Q(oG,i3:upper(),11,oF,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))H_.Font=af.x local Ia=aj(oG,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local Ib=i3 Ia.MouseButton1Click:Connect(function()local xx=ae.members[Ib]or{}local xy=false for Mx,Ic in ipairs(xx)do if not e.Targets[Ic]then xy=true break end end
for My,Ie in ipairs(xx)do xt(Ie,xy)end end)for Mz,oH in ipairs(ae.members[i3]or{})do local i4=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cT)},cT)aa(i4,8)local xz=Q(i4,am(oH),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
xz.TextWrapped,xz.TextTruncate=false,Enum.TextTruncate.AtEnd local xA=a.tickBox(i4)bC.boxes[oH]=xA local xC=oH
local function xD()xt(xC,not e.Targets[xC])end i4 .MouseButton1Click:Connect(xD)xA.MouseButton1Click:Connect(xD)
end end oC()bC.built,bC.at=true,ae.at end function M.paint()for If,Ig in pairs(M.boxes)do a.check(Ig,e.CrateTicks[If]==true)end
if a.crtInfo then local oI,oJ=0,0 for MA in pairs(M.boxes)do oI=oI+1 end for MB,Ih in pairs(e.CrateTicks)do if Ih then oJ=oJ+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(oI,oJ))end if a.crateT then O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function M.build()for MC,i5 in ipairs(a.crtList:GetChildren())do if i5:IsA("Frame")or i5:IsA("TextButton")or i5:IsA("TextLabel")then i5:Destroy()end
end M.boxes={}local oK=a.card(a.crtList,"All of them","worst first")local oL=a.row(oK,26)a.crtInfo=Q(oL,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Ii=aj(oL,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Ij=aj(oL,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
V(Ii.MouseButton1Click:Connect(function()e.CrateTicks={}M.paint()end))V(Ij.MouseButton1Click:Connect(function()M.build()end))
for MD,bD in ipairs(M.list())do local xE=n2[bD.rar or""]or l.text local dO=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(oK)},oK)aa(dO,8)L("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=xE,BorderSizePixel=0},dO)
local xF=Q(dO,(bD.title or bD.name)..(bD.guess and"  (?)"or""),11,xE,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
xF.TextWrapped,xF.TextTruncate=false,Enum.TextTruncate.AtEnd local Ik=Q(dO,bD.price and("$"..av(bD.price))or(bD.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Ik.TextXAlignment=Enum.TextXAlignment.Right local xG=a.tickBox(dO)M.boxes[bD.k]=xG local xH=bD.k local function xI()
e.CrateTicks[xH]=(not e.CrateTicks[xH])or nil M.paint()end V(dO.MouseButton1Click:Connect(xI))V(xG.MouseButton1Click:Connect(xI))
end M.built=M.at M.paint()end local xJ="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set","alt"}
local function aW(cU)xJ=cU for Il,oM in ipairs(a.tabKeys)do a[oM].Visible=(oM==cU)local i6=a.tabsAll[Il]if i6 then
local oN=oM==cU i6 .b.BackgroundTransparency,i6 .b.TextTransparency,i6 .bar.Visible=oN and 0 or 1,oN and 0 or 0.45,oN
end end if cU=="pet"and not o.built then pcall(o.build)end if cU=="team"and not A.built then pcall(A.build)end
if cU=="crt"and(M.built~=M.at or not next(M.boxes))then M.build()end if cU=="but"then f2(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(oO,xK,xL,xM)if xM then oO.Text=xM end oO.BackgroundColor3=xK and xL or l.bg oO.TextColor3=xK and a.ink(xL)or l.dim
end function o.paintRow(xN)local cV=o.rows and o.rows[xN]if not cV then return end local cW=e.Pets[xN]or{}local xO=tonumber(cW.f)==-1
a.flag(cV.b,cW.b,l.good)a.flag(cV.g,cW.g,l.accent,cW.g and"BIG"or"ANY")a.flag(cV.w,cW.w,l.warn)a.flag(cV.f,not xO,l.good,xO and"KEEP"or"AUTO")
if cV.row then cV.row.BackgroundColor3=(cW.b or cW.w)and l.lit or l.raise end end function o.flag(oP,i7)local bi=e.Pets[oP]or{}
if i7=="f"then bi.f=tonumber(bi.f)~=-1 and-1 or nil elseif bi[i7]then bi[i7]=nil else bi[i7]=true end e.Pets[oP]=(bi.b or bi.g or bi.w or bi.f)and bi or nil
o.paintRow(oP)end function o.paintAll()for Im in pairs(o.rows or{})do o.paintRow(Im)end if a.pbT then O(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
O(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")O(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(In)local xP=y.dreamT if not xP then return"working the plan out..."end local Io,Ip=y.needFor(""),y.needFor("Big")
local cX={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(Io,Ip,y.slots())}for ME,xQ in ipairs(y.dreamTeams or{})do cX[#cX+1]=xQ.team:upper()..": "..table.concat(xQ.names,", ")end
local i8,i9,i_=0,0,0 for xR,xS in pairs(xP)do local xT,Iq=y.have(xR,In)local MF,Ir=y.goal(xR)i8=i8+math.max(0,xS.Huge-xT.Huge)
i9=i9+math.max(0,xS.Big-xT.Big)i_=i_+math.max(0,Ir-Iq)end cX[#cX+1]=(i8+i9+i_==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(i8,i9,i_)if y.fuseMsg~=""then cX[#cX+1]=y.fuseMsg end
return table.concat(cX,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local oQ=o.wishes()local dP=o.data()for ja,oR in pairs(o.rows)do local xU=y.status(ja,dP)oR.desc.Text=(oQ[ja]and("wishing %dm | "):format(math.ceil(oQ[ja]/60))or"")..(xU and(xU.." | ")or"")..oR.boostText
oR.desc.TextColor3=oQ[ja]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dP))end local xV=tonumber(K:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dP and#(dP.pets or{})or 0,dP and tonumber(dP.maxOwned)or 60,
av(o.money()),xV>0 and(" | free wishes "..xV)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local jb=o.info()for MG,jc in ipairs(a.petList:GetChildren())do if jc:IsA("Frame")or jc:IsA("TextLabel")or jc:IsA("TextButton")then jc:Destroy()end
end o.rows={}if not jb then Q(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dQ={}for MH,xW in ipairs(o.order())do local oS=jb.Pets[xW].rarity or"?"dQ[oS]=dQ[oS]or{}
table.insert(dQ[oS],xW)end local dR={}for MI,xX in ipairs(jb.Rarities or{})do if dQ[xX]then dR[#dR+1]=xX end end
for xY in pairs(dQ)do if not table.find(dR,xY)then dR[#dR+1]=xY end end for MJ,oT in ipairs(dR)do local jd=o.RC[oT]or l.text
local cY=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
aa(cY,11)a.stroke(cY,jd,0.7)a.list(cY,4)a.pad(cY,7,7,7,8)local xZ=a.row(cY,18)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=jd,BorderSizePixel=0},xZ)
local Is=Q(xZ,oT:upper(),11,jd,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Is.Font=af.x for MK,je in ipairs(dQ[oT])do
local f3=L("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cY)},cY)
aa(f3,8)local oU=Q(f3,o.nice(je),11,jd,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))oU.TextWrapped,oU.TextTruncate=false,Enum.TextTruncate.AtEnd
local It,Iu=pcall(function()return jb.describe(je)end)local x0=It and tostring(Iu)or""local oV=Q(f3,x0,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oV.TextYAlignment,oV.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function jf(Iv,Iw,Ix)
local x1=aj(f3,Iv,l.bg,8,UDim2 .new(1,Iw,0,5),UDim2 .new(0,Ix,0,22))x1 .AutoButtonColor=true return x1 end local x2,x3,x4,x5=jf("BUY",-164,30),jf("ANY",-131,30),jf("WISH",-98,34),jf("AUTO",-61,56)
local jg=je x2 .MouseButton1Click:Connect(function()o.flag(jg,"b")end)x3 .MouseButton1Click:Connect(function()o.flag(jg,"g")end)
x4 .MouseButton1Click:Connect(function()o.flag(jg,"w")end)x5 .MouseButton1Click:Connect(function()o.flag(jg,"f")end)
o.rows[je]={b=x2,g=x3,w=x4,f=x5,name=oU,desc=oV,boostText=x0,row=f3}end end o.built=true o.paintAll()end function d.paint()
O(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")O(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
O(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")O(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
O(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])O(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end V(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
V(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))V(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
V(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))V(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
V(a.pfFps.MouseButton1Click:Connect(function()local Iy=table.find(d.CAPS,e.FpsCap or 0)or 1 local x6=d.CAPS[(Iy%#d.CAPS)+1]
if not d.cap(x6)and x6~=0 then D("this executor cannot cap fps")end d.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()
local oW=tonumber(a.pfMem.Text)if oW and oW>=0 then e.MemLimit=math.floor(oW)end d.paint()end))function A.names()
local oX={"(none)"}for ML,Iz in ipairs((A.teams()))do oX[#oX+1]=Iz.name end return oX end function A.cycle(oY,IA)
local jh=A.names()local IB=e[oY]~=""and e[oY]or"(none)"local ji=table.find(jh,IB)or 1 ji=((ji-1+IA)%#jh)+1 e[oY]=jh[ji]=="(none)"and""or jh[ji]
A.paint()end function A.paint()if not A.built then return end O(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
O(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oZ={}for MM,IC in ipairs((A.teams()))do oZ[IC.name]=true end
for ID,x7 in pairs(A.pick)do local dS=e[ID]x7 .Text=dS==""and"(none)"or(oZ[dS]and dS or(dS.." (missing)"))x7 .TextColor3=(dS~=""and not oZ[dS])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local IE,jj=o.srv(),{}for MN,jk in ipairs(A.list or{})do jj[#jj+1]=("st %-2s %-22s %9s  helps %d"):format(jk.st.Name,am(W(jk.name)):sub(1,22),A.clock(jk.ends-IE),jk.helps)
end a.tmList.Text=#jj>0 and table.concat(jj,"\n")or"no waxes running"end function A.build()for MO,jl in ipairs(a.teamList:GetChildren())do
if jl:IsA("Frame")or jl:IsA("TextLabel")or jl:IsA("TextButton")then jl:Destroy()end end A.pick={}local jm=a.card(a.teamList,"Automatic")
a.tmT=a.switch(jm,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(jm,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(jm,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local IF,IG=pcall(y.rebuild,"you asked")if not IF then D("BUILD ERR "..tostring(IG))end end)
end)a.tmInfo=a.grow(jm,10,l.dim)local x8=a.card(a.teamList,"Which team when")local function jn(jo,IH,II)local f4=a.row(x8,54)
Q(f4,IH,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local x9=Q(f4,II,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
x9 .TextWrapped,x9 .TextTruncate=false,Enum.TextTruncate.AtEnd local IJ=aj(f4,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local x_=aj(f4,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local IK=aj(f4,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
IJ.MouseButton1Click:Connect(function()A.cycle(jo,-1)end)IK.MouseButton1Click:Connect(function()A.cycle(jo,1)end)
x_.MouseButton1Click:Connect(function()A.cycle(jo,1)end)A.pick[jo]=x_ end jn("TeamNormal","Normal","the rest of the time: money + luck")
jn("TeamFull","Full","every station busy: money + wax speed")jn("TeamGlaze","Glaze","worn just before a wax finishes")
local jp=a.row(x8,26)Q(jp,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=iJ(jp,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
Q(jp,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local IL=aj(jp,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
IL.MouseButton1Click:Connect(function()local jq=tonumber(a.tmLead.Text)if jq and jq>=5 and jq<=600 then e.GlazeLead=math.floor(jq)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)jn("TeamWax","Wax","while a butter is placed: head starts")local ya=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(ya)},ya)aa(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local IM=a.card(a.teamList,"How it works")a.note(IM,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function IN()a.secB.Text=tostring(e.Every)O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ah(0.1)end if not F.home then pcall(d.unpin)end end)end
O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fC(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b6(a.root)b6(a.tgRoot)c.lastCollect=z()
oC()M.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function IO(yb)task.spawn(function()yb.TextColor3=l.bad
task.wait(0.8)if c.alive then yb.TextColor3=l.text end end)end local function yc()local yd=a.secB.Text:match("^%s*(%d+)%s*$")
local f5=yd and tonumber(yd)if not f5 or f5<1 then a.secB.Text=tostring(e.Every)IO(a.secB)D("interval must be a whole number >= 1")
return end if f5==e.Every then return end e.Every,c.lastCollect=f5,z()D("collect every "..f5 .."s")end local function N(IP,IQ)V(IP.MouseButton1Click:Connect(IQ))end
N(a.secSet,yc)V(a.secB.FocusLost:Connect(yc))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(au,"selling...",vs)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(E.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help F.nextAt,F.msg=0,e.Help and"looking for waxes to help"or"off"O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests J.at=0 O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire H.nextAt,H.fails,H.lost=0,0,0 O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()O(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")O(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
O(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
O(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")O(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(IR)task.spawn(function()pcall(q.tick)if IR and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local IS=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(IS)end)
N(a.bestT,function()local IT=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(IT)end)N(a.bcT,function()
local IU=q.on()e.BestCrate=not e.BestCrate q.changed(IU)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b8=o.srv()local b9 pcall(function()q.aac=q.aac or require(ag:FindFirstChild("AdminAbuseClient"))
b9=q.aac:GetState()end)local dT,b_="nothing scheduled","the game has not announced one"if type(b9)=="table"then
local f6,a6,ca=tostring(b9 .Phase or""),tonumber(b9 .StartsAt),tonumber(b9 .EndsAt)if a6 and a6<1e9 then a6=nil end
if ca and ca<1e9 then ca=nil end if f6=="Countdown"and a6 then dT,b_="starts in "..A.clock(a6-b8),os.date("%a %H:%M",math.floor(a6)).." your time"
elseif f6=="Live"and ca then dT,b_="LIVE  -  "..A.clock(ca-b8).." left","the farm is grabbing, waxing and glazing through it"
elseif f6~=""and f6~="Idle"and ca and ca>b8 then dT,b_=f6:lower().."  -  "..A.clock(ca-b8).." left","after the show"
elseif a6 and a6>b8 then dT,b_="next: "..os.date("%a %H:%M",math.floor(a6)),"your time"elseif a6 then dT,b_="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a6)).." your time"
end if type(b9 .Kind)=="string"and b9 .Kind~=""then b_=b_.."  |  "..b9 .Kind end end a.put(a.admBig,dT)a.put(a.admSub,b_)
local dU,o0={},ag:FindFirstChild("AdminShow")if o0 then local IV,IW=pcall(function()return o0:GetAttributes()end)
for ye,dV in pairs(IV and IW or{})do local jr=type(ye)=="string"and ye:match("^(.-)Mult$")local o1=jr and tonumber(o0:GetAttribute(jr.."Until"))
if jr and type(dV)=="number"and dV~=1 and dV~=0 and o1 and o1>b8 then dU[#dU+1]=("%s  x%s   %s left"):format(jr:gsub("(%l)(%u)","%1 %2"),(dV%1==0)and tostring(dV)or("%.2f"):format(dV),
A.clock(o1-b8))end end end table.sort(dU)a.put(a.admBoost,#dU>0 and table.concat(dU,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dU>0 and l.accent or l.dim local js=0 for MP in pairs(P.drops)do js=js+1 end local yf=q.snapAt and(q.snapAt-b8)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(P.got,P.miss,js>0 and(", "..js.." falling")or"",
yf and("in "..math.max(0,math.floor(yf)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(au,"opening crate...",ex,true)end)N(a.padB,function()c.plot=bF()or c.plot local yg,o2=aq(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(yg and o2 and o2:IsA("BasePart"))then D("SET PAD: need character and plot")return end c.manualPad=o2 .CFrame:ToObjectSpace(yg.HumanoidRootPart.CFrame)
Fs(c.manualPad)D("collect pad saved at your position")end)N(a.startB,function()fC(not c.running)end)N(a.buyB,function()
c.plot=bF()or c.plot task.spawn(au,"buying (manual)...",qZ,true)end)N(a.plB,function()c.plot=bF()or c.plot task.spawn(au,"waxing (manual)...",q5)
end)N(a.tabFarm,function()aW("farm")end)N(a.tabRun,function()aW("run")end)N(a.tabSrv,function()aW("srv")end)N(a.tabAdm,function()aW("adm")end)
N(a.tabBut,function()aW("but")end)N(a.tabSet,function()aW("set")end)N(a.tabCrt,function()aW("crt")end)N(a.tabPet,function()aW("pet")end)
N(a.tabTeam,function()aW("team")end)N(a.tabAlt,function()aW("alt")if type(a.altShown)=="function"then pcall(a.altShown)end end)
a.mk,a.lbl,a.button,a.round,a.C,a.FT,a.click=L,Q,aj,aa,l,af,N do local IY=a.card(a.alt,"Alts","several accounts in one server")
a.altNote=Q(a.row(IY,40),"The team module is not running on this account. Load the farm with altboot.lua to use it.",10,l.dim,false)
a.altNote.TextWrapped,a.altNote.TextYAlignment=true,Enum.TextYAlignment.Top end local function IZ(o3)c.hidden=o3
a.root.Visible=not o3 a.tgBtn.TextColor3=o3 and l.text or l.ink end w0(a.tgBtn,a.tgRoot,function()b6(a.tgRoot)
c.togPos=iO(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then IZ(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aO,aA={},0 local function cb()aO=qo()if#aO==0 then a.cfgPick.Text="(none saved)"
aA=0 return end if aA<1 or aA>#aO then aA=1 end a.cfgPick.Text=aO[aA]..("  (%d/%d)"):format(aA,#aO)end local function yh()
local yi=c.autoload~=nil a.cfgAuto.Text=yi and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=yi and l.accent or l.panel2
end local function o4()local yj=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if yj~=""then return yj end return(aA>0 and aO[aA])or""
end N(a.cfgSave,function()c.winPos=iO(a.root)or c.winPos c.togPos=iO(a.tgRoot)or c.togPos local yk,yl=ef(o4())
a.cfgMsg.Text=yk and("saved as "..yl)or("could not save: "..yl)a.cfgMsg.TextColor3=yk and l.good or l.bad cb()
D(a.cfgMsg.Text)end)local function I0(o5)local o6,ym=ki(o5)a.cfgMsg.Text=o6 and("loaded "..ym)or("could not load: "..ym)
a.cfgMsg.TextColor3=o6 and l.good or l.bad if o6 then a.cfgName.Text=o5 IN()task.spawn(E.apply,"config "..o5)
end D(a.cfgMsg.Text)end N(a.cfgLoad,function()I0(o4())end)N(a.cfgPick,function()cb()if aA>0 then a.cfgName.Text=aO[aA]end
end)N(a.cfgPrev,function()if#aO==0 then cb()return end aA=(aA-2)%#aO+1 cb()a.cfgName.Text=aO[aA]end)N(a.cfgNext,function()
if#aO==0 then cb()return end aA=aA%#aO+1 cb()a.cfgName.Text=aO[aA]end)N(a.cfgAuto,function()if c.autoload then
kj(nil)a.cfgMsg.Text="it will not load a config on launch"else local f7=o4()local yn=false for MQ,I1 in ipairs(qo())do if I1==f7 then yn=true end end
local I2=yn or ef(f7)if I2 and f7~=""then kj(f7)cb()a.cfgMsg.Text=f7 .." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim yh()end)N(a.autoB,function()
local yo,yp=An()a.autoMsg.Text=yo and("installed. "..yp)or("failed: "..yp)a.autoMsg.TextColor3=yo and l.good or l.bad
D(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()eg("you asked")end)
local bj=false N(a.minB,function()bj=not bj a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bj,not bj,not bj
if bj then for MR,I3 in ipairs(a.tabKeys)do a[I3].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,T.head+6),UDim2 .new(1,-16,0,T.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,T.rail+8,0,T.head+6),UDim2 .new(1,-(T.rail+16),0,T.status)aW(xJ)
end a.root.Size=UDim2 .new(0,T.w,0,bj and(T.head+T.status+12)or T.h)a.minB.Text=bj and"+"or"-"end)local function jt()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(gn)for MS,I4 in ipairs(jC)do pcall(function()I4:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end if c.hidPurchaseApp then pcall(function()c.hidPurchaseApp.Enabled=true end)end
pcall(function()n7:Destroy()end)pcall(function()xs:Destroy()end)if c1 .SAB_KILL==jt then c1 .SAB_KILL=nil end
end c1 .SAB_KILL=jt N(a.killB,jt)N(a.xB,jt)w0(a.title,a.root,function()b6(a.root)c.winPos=iO(a.root)or c.winPos
end)local function yq()local f8,cZ=c.reason,c.level if c.busy then f8,cZ=c.busyText,"ok"elseif not c.running then
local MT,yr,I5=v3()if c.capHit then f8,cZ=yr,"bad"else f8,cZ="[stopped] "..yr,(I5=="bad")and"bad"or"idle"end c.reason,c.level=f8,cZ
end local dW=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dW then a.lit.dot=dW a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dW,dW,dW,dW
a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,f8)if a.lit.bar~=cZ then a.lit.bar=cZ a.bar.BackgroundColor3=GJ[cZ]or l.dim end
if bj then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local cc=zY()if a.farm.Visible then local I6,I7=gk()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,I6 .."/"..I7)local ys=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local yt=ad()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
av(bk()),c.rolls,c.gifts,c.crates,yt and am(W(yt))or"nothing",j.on and("   ["..j.title.." window open]")or"",
ys and("in "..ys.."s")or"off"))a.put(a.tgt,(#cc==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#cc<=3)and table.concat(cc,", ")or(#cc.." butters ticked"))))
if a.lit.tgt~=(#cc==0)then a.lit.tgt=(#cc==0)a.tgt.TextColor3=(#cc==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(ge,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and F.msg or"helping is off")a.put(a.srvCamp,e.Campfire and H.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ae.n,#ae.rarOrder,#cc))
end if a.but.Visible and bC.at~=ae.at then f2(false)end if a.crt.Visible then if M.built~=M.at then M.build()else M.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and F.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and H.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(J.msg~=""and J.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local yu=(E.rec.on and"on"or"")..(E.rec.off and((E.rec.on and"/"or"").."off")or"")
a.put(a.arL,E.msg~=""and E.msg or("auto roll  %s | knows %s%s"):format(E.isOn()and"running"or"stopped",yu~=""and yu or"nothing yet",#E.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(E.msg~="")then a.lit.arL=(E.msg~="")a.arL.TextColor3=E.msg~=""and l.warn or l.dim end end end c1 .SAB={S=c,CFG=e,EV=ab,U=a,sg=n7,CAT=ae,LEARN=al,buildList=f2,
logAll=dZ,evAll=d0,AR=E,CR=M,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=F,CF=H,QX=J,IX=q,SH=P,saveConfig=ef,loadConfig=ki,setAutoload=kj}
D(cd.." loaded")if c.uiErrs>0 then D("UI: "..c.uiErrs.." properties skipped")end aW("farm")b6(a.root)b6(a.tgRoot)
if iL then pcall(function()V(iL:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)b6(a.root)
b6(a.tgRoot)end))end)end cb()yh()if c.config and c.config~=""then a.cfgName.Text=c.config end O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(yq)task.spawn(function()local yv=Al()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(yv and("\n(backup: "..yv..")")or"")
local yw=ec(ar.exec)if yw and not yw:find("SAB autoloader v2",1,true)then gH(ar.exec,ar.stub)D("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(ec(ar.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(At)end)task.spawn(function()while c.alive do local I8,I9=pcall(yq)if not I8 then D("UI ERR "..tostring(I9))end
task.wait((c.hidden or bj)and 1.5 or 0.4)end end)task.spawn(function()local I_,Ja=pcall(AB)if not I_ then D("HOOK ERR "..tostring(Ja))end
end)task.spawn(function()pcall(zk)if j.loadSeq and not j.learned then local ju={}for yx=1,20 do if j.loadSeq[yx]then ju[#ju+1]=j.loadSeq[yx]end end
if#ju>0 then j.learned={seq=ju,mode=j.loadMode}D("remembered how to open crates directly")end end if kc()then D(("catalog: %d butters in %d rarities"):format(ae.n,#ae.rarOrder))end
local Jb,yy=pcall(Fu)if Jb and yy and c.alive and not c.manualPad then c.manualPad=yy end end)task.spawn(function()
while c.alive do local o7,o8=pcall(o.buyTick)if not o7 then D("PET ERR "..tostring(o8))task.wait(5)end o7,o8=pcall(o.wishTick)
if not o7 then D("WISH ERR "..tostring(o8))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local jv,yz=0,z()
V(game:GetService("RunService").Heartbeat:Connect(function()jv=jv+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
V(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local yA=z()d.fps,jv,yz=jv/math.max(yA-yz,0.001),0,yA local Jc,Jd=pcall(d.tick)if not Jc then D("PERF ERR "..tostring(Jd))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local Je,Jf=pcall(y.tick)if not Je then D("FUSE ERR "..tostring(Jf))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local Jg,Jh=pcall(A.tick)if not Jg then D("TEAM ERR "..tostring(Jh))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local jw=ag:WaitForChild("Remotes",30)local yB=jw and jw:WaitForChild("ClanEvent",30)
if yB and c.alive then V(yB.OnClientEvent:Connect(function(Ji,Jj)if Ji=="call"then pcall(F.onCall,Jj)end end))
end local yC=jw and jw:FindFirstChild("RollConfirmAsk")if yC and c.alive then V(yC.OnClientEvent:Connect(function(Jk)J.asked=Jk or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)pcall(d.walkPatch,true)end
end end)task.spawn(function()local o9=ag:WaitForChild("Remotes",30)if not(o9 and c.alive)then return end local function jx(Jl,Jm)
local o_=o9:FindFirstChild(Jl)if o_ and o_:IsA("RemoteEvent")then V(o_.OnClientEvent:Connect(function(...)pcall(Jm,...)end))end
end jx("NewSquishyDiscovered",function(pa,yD)if type(pa)~="string"then return end q.disc=q.disc or{}q.disc[W(pa)]=true
D(("INDEX: %s%s is in your Index now"):format(am(W(pa)),yD and(" ("..tostring(yD)..")")or""))end)jx("IndexRefresh",q.loadDisc)
jx("IndexRowComplete",function(Jn)D("INDEX: the whole "..tostring(Jn).." row is complete")end)jx("AdminShow",q.admin)
local yE=o9:FindFirstChild("AdminShowSync")if yE then local Jo,yF=pcall(function()return yE:InvokeServer()end)
if Jo and type(yF)=="table"then for MU,Jp in pairs(yF)do pcall(P.add,Jp)end end end while c.alive do local Jq,Jr=pcall(q.tick)
if not Jq then q.msg="index error: "..tostring(Jr)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Js,Jt=pcall(J.tick)if not Js then D("QUEST ERR "..tostring(Jt))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(gn)end end)pcall(E.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Jv=(type(newcclosure)=="function")and newcclosure or function(Ju)return Ju end local pb
local yG=(type(setnamecallmethod)=="function")and setnamecallmethod or nil pb=hookmetamethod(game,"__namecall",Jv(function(yH,...)
local f9=getnamecallmethod()if c.alive and(f9=="InvokeServer"or f9=="FireServer")then local yI,yJ=pcall(function()return yH.Name end)
if yI and yJ=="CrateAction"and not j.replaying then pcall(j.saw,f9,...)elseif yI and yJ=="AutoRollAction"and not E.replaying then pcall(E.saw,f9,...)end
if yG then yG(f9)end end return pb(yH,...)end))j.oldNC=pb end)end pcall(function()local f_=getgenv and getgenv()or _G
c.robuxBlocked=0 f_.SAB_NOROBUX=f_.SAB_NOROBUX or{n=0,last=""}if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
local bE=f_.SAB_NOROBUX local c0=game:GetService("MarketplaceService")local Jw={PromptGift=true,PromptLimitedSquishy=true,PromptMultMoneyGamepass=true,PromptServerLuck=true,
PromptShopCrate=true,PromptTimeSkip=true,PromptDoubleOfflineEarnings=true,FinishWaxOffer=true}pcall(function()
local Jy=(type(newcclosure)=="function")and newcclosure or function(Jx)return Jx end local yK yK=hookmetamethod(game,"__namecall",Jy(function(pc,...)
local ga=getnamecallmethod()if c.alive and pc==c0 and type(ga)=="string"and ga:sub(1,6)=="Prompt"then bE.n,bE.last=bE.n+1,ga
return nil end if ga=="FireServer"or ga=="InvokeServer"then local yL,dX=pcall(function()return pc.Name end)local pd,MV,Jz=...
if yL and dX=="ClanRequest"and(pd=="refresh"or(pd=="create"and Jz=="robux"))then dX="ClanRequest "..pd end if yL and(Jw[dX]or dX=="ClanRequest refresh"or dX=="ClanRequest create")and c.alive then
bE.n,bE.last=bE.n+1,dX return nil end end return yK(pc,...)end))end)local function gb(yM,JA)pcall(function()V(c0[yM]:Connect(function(JB,pe)
bE.n,bE.last=bE.n+1,yM..(pe~=nil and(" #"..tostring(pe))or"")pcall(JA,JB,pe)end))end)end gb("PromptProductPurchaseRequested",function(pf,JC)
c0:SignalPromptProductPurchaseFinished(typeof(pf)=="Instance"and pf.UserId or pf,JC,false)end)gb("PromptGamePassPurchaseRequested",function(JD,JE)c0:SignalPromptGamePassPurchaseFinished(JD,JE,false)end)
gb("PromptPurchaseRequested",function(JF,JG)c0:SignalPromptPurchaseFinished(JF,JG,false)end)gb("PromptBundlePurchaseRequested",function(JH,JI)c0:SignalPromptBundlePurchaseFinished(JH,JI,false)end)
gb("PromptPremiumPurchaseRequested",function()c0:SignalPromptPremiumPurchaseFinished(false)end)end local function yN()
local JJ,JK=pcall(function()local gc=game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp")if gc and gc:IsA("ScreenGui")then
c.hidPurchaseApp=gc if gc.Enabled then gc.Enabled=false end end end)if not JJ then c.hideErr=tostring(JK)end end
yN()task.spawn(function()local yO=f_.SAB_NOROBUX.n while c.alive do task.wait(5)yN()local dY=f_.SAB_NOROBUX if dY and dY.n>yO then
c.robuxBlocked,yO=dY.n,dY.n D(("ROBUX PROMPT BLOCKED (%s) - %d so far"):format(dY.last,dY.n))end end end)end)
if jA then V(K.Idled:Connect(function()pcall(function()jA:CaptureController()jA:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for MW=1,90 do if not c.alive then return end if K:GetAttribute("AutoRollOn")~=nil and aq()and(c.plot or bF())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then E.apply("joined")end while c.alive do task.wait(30)local jy=ck()
if jy and q.on()and not aP(jy.name)then jy=nil end if c.alive and e.AutoRoll and c.running and not E.isOn()and not jy and not ad()
and not j.waiting and not j.on and not c.busy then E.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for MX=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bF()if aq()and c.plot and q.any()then fC(true,true)D("started by itself")
return end task.wait(1)end if c.alive and not c.running then D("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bF()c.lastCollect=z()while c.alive do if c.running then local JL,yP=pcall(GE)if not JL and yP~=jB then D("LOOP ERR "..tostring(yP))end
end task.wait(0.1)end end)jz("ready - the window is at the top left")end local JN,pg=xpcall(yT,function(JM)return tostring(JM).."\n"..debug.traceback()end)
if not JN then pcall(function()warn("SAB "..cd.." ERROR: "..tostring(pg))end)jz("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cd.." ERROR: "..tostring(pg))end)pcall(function()local yQ=(type(getgenv)=="function"and getgenv())or _G
if type(yQ.SAB_KILL)=="function"then yQ.SAB_KILL()end for MY,JO in ipairs({"SABFarmGui","SABToggle"})do local yR=K.PlayerGui:FindFirstChild(JO)
if yR then yR:Destroy()end end end)pcall(function()local gd=Instance.new("ScreenGui")gd.Name="SABError"gd.ResetOnSpawn=false
gd.DisplayOrder=1000 local a7=Instance.new("TextBox")a7 .Size=UDim2 .new(0,340,0,170)a7 .Position=UDim2 .new(0,10,0,50)
a7 .BackgroundColor3=Color3 .fromRGB(90,20,20)a7 .TextColor3=Color3 .new(1,1,1)a7 .TextSize=11 a7 .TextWrapped=true
a7 .ClearTextOnFocus=false a7 .TextXAlignment=Enum.TextXAlignment.Left a7 .TextYAlignment=Enum.TextYAlignment.Top
a7 .Text="SAB "..cd.." failed to start. Send this text:\n"..tostring(pg)a7 .Parent=gd gd.Parent=K:WaitForChild("PlayerGui")
end)end
