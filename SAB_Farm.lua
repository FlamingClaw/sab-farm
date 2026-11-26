local cd="v28"local o8=game:GetService("Players")local K=o8 .LocalPlayer or o8 .PlayerAdded:Wait()local function ju(yL)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..cd,Text=yL,Duration=6})
end)end ju("script started")local function yM()local ag=game:GetService("ReplicatedStorage")local ak=game:GetService("Workspace")
local o9=game:GetService("UserInputService")local c1=(type(getgenv)=="function"and getgenv())or _G if type(c1 .SAB_KILL)=="function"then pcall(c1 .SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jv=(function()local yN,yO=pcall(function()return game:GetService("VirtualUser")end)return yN and yO or nil end)()
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
local o,A,d,y,F,H,J={},{},{},{},{},{},{}local q,P={},{}local jw={}local jx,gc,dX,dY={},{},{},{}local function V(o_)jx[#jx+1]=o_ return o_ end
local function ah(yP)task.wait(yP)if not c.alive then error(jw,0)end end local function D(gd)gd=os.date("%H:%M:%S").." "..tostring(gd)
table.insert(gc,1,gd)if#gc>6 then table.remove(gc)end c.logN=(c.logN or 0)+1 dX[#dX+1]=gd if#dX>80 then table.remove(dX,1)end
end local function ge(pa)if type(pa)~="string"then return""end return(pa:lower():gsub("[^%w]",""))end local function W(yQ)
local pb=ge(yQ)local jy=pb:gsub("butter$","")if jy==""then jy=pb end return jy end local function aP(jz)if type(jz)~="string"then return false end
local jA=W(jz)if jA==""then return false end if q.isLimited and q.isLimited(jz)then return q.limitedHere()end
if q.want then return q.want(jA)end return e.Targets[jA]==true end local function yR(dZ)dZ=dZ:lower()return dZ:find("squishy",1,true)~=nil or dZ:match("butter$")~=nil or dZ:match("butter[^%a]")~=nil
end local jB={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function av(d0)if type(d0)~="number"then return"?"end
local gf=1 while math.abs(d0)>=1000 and gf<#jB do d0=d0/1000 gf=gf+1 end local yS=string.format("%.2f",d0):gsub("%.?0+$","")
return yS..jB[gf]end local function yT(pc)if type(pc)~="string"then return nil end local yU,d1=pc:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jC=tonumber(yU)if not jC then return nil end if d1==""then return jC end local yV={qd="qa",qn="qi"}d1=yV[d1:lower()]or d1
for yW,yX in ipairs(jB)do if yX:lower()==d1:lower()then return jC*1000^(yW-1)end end return nil end local function bk()
local jD=K:FindFirstChild("MoneyValue")if jD and type(jD.Value)=="number"then return jD.Value end local pd=K:GetAttribute("BoardValueMoney")
if type(pd)=="number"then return pd end local pe=K:FindFirstChild("leaderstats")if pe then for JK,yY in ipairs({"Cash","Money","Coins"})do
local jE=pe:FindFirstChild(yY)if jE and type(jE.Value)=="number"then return jE.Value end end end end local function gg(yZ)
local jF=yZ:GetFullName()if c.plot then local jG=c.plot:GetFullName()if jF:sub(1,#jG)==jG then return jF:sub(#jG+2)end
end return jF end local function aq()local gh=K.Character if gh and gh:FindFirstChild("HumanoidRootPart")then
local pf=gh:FindFirstChildOfClass("Humanoid")if pf and pf.Health>0 then return gh end end end local function bF()
local jH=ak:FindFirstChild("Plots")if not jH then return nil end local function pg(y0)local ph=y0:FindFirstChild("Plate")
return ph~=nil and ph:FindFirstChild("EditStackAttachment",true)~=nil end local pj=K:GetAttribute("PlotNumber")
if pj~=nil then local jI=jH:FindFirstChild(tostring(pj))if jI and pg(jI)then return jI end end for JL,pk in ipairs(jH:GetChildren())do
if pg(pk)then return pk end end end local function d2(pl)local bG=pl and pl.Parent for JM=1,6 do if not bG then return nil end
if bG:IsA("BasePart")then return bG end if bG:IsA("Model")then return bG.PrimaryPart or bG:FindFirstChildWhichIsA("BasePart",true)end
bG=bG.Parent end end local function pm(pn)local jJ=pn.Parent if jJ and jJ:IsA("Attachment")then return jJ.WorldPosition end
local po=d2(pn)return po and po.Position end local function pp()local c2=c.plot and c.plot:FindFirstChild("Plate")
if not c2 then return nil end if c2:IsA("BasePart")then return c2 .Position end if c2:IsA("Model")then return c2:GetPivot().Position end
local pq=c2:FindFirstChildWhichIsA("BasePart",true)return pq and pq.Position end local function ps()local jK={}
local pt=c.plot and c.plot:FindFirstChild("WaxStations")if pt then for JN,y1 in ipairs(pt:GetChildren())do local pu=y1:FindFirstChild("SquishyPlaceHolder")
local jL=pu and pu:FindFirstChild("PlacePrompt")if jL and jL:IsA("ProximityPrompt")then jK[#jK+1]=jL end end end
return jK end local function gi()local pv,jM=ps(),0 for JO,y2 in ipairs(pv)do if y2 .Enabled then jM=jM+1 end end
local jN=#pv local jO=K:GetAttribute("WaxStations")if type(jO)=="number"and jO>jN then jN=jO end return jM,jN
end local function y3()local pw=aq()local px=pw and pw.HumanoidRootPart.Position local jP,py for JP,jQ in ipairs(ps())do
if jQ.Enabled then local pz=pm(jQ)local pA=(pz and px)and(pz-px).Magnitude or 1e9 if not jP or pA<py then jP,py=jQ,pA end
end end return jP end local function pB()local gj=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not gj then return nil end local pC=gj:FindFirstChild("BuyPromptAttachment")local gk=(pC and pC:FindFirstChild("BuyPrompt"))or gj:FindFirstChild("BuyPrompt",true)
if gk and gk:IsA("ProximityPrompt")and gk:IsDescendantOf(gj)then return gk end end local pD={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local y4={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local al={order={},price={},dirty=false}local M={seen={},at=0,boxes={},built=0}local ae={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jR="SAB_order.txt"local function gl()if not al.dirty or type(writefile)~="function"then return end local aG={}
for y5,y6 in pairs(al.price)do aG[#aG+1]="P|"..y5 .."|"..string.format("%.0f",y6)end for y7,y8 in pairs(al.order)do aG[#aG+1]="O|"..y7 .."|"..table.concat(y8,",")end
if j.learned and j.enc then aG[#aG+1]="M|mode|"..tostring(j.learned.mode or"")for y9,gm in ipairs(j.learned.seq)do
local pE={}for pF=1,gm.n do pE[pF]=j.enc(gm.args[pF])end aG[#aG+1]=("A|%d|%s|%d|%s"):format(y9,gm.m,gm.n,table.concat(pE,";"))
end end local function jS(y_,za,gn)local pG={}for pH=1,gn.n do pG[pH]=j.enc(gn.args[pH])end aG[#aG+1]=("R|%d|%s|%s|%d|%s"):format(za,y_,gn.m,gn.n,table.concat(pG,";"))
end if j.enc then for zb,zc in ipairs(E.rec.rules)do jS("rules",zb,zc)end if E.rec.on then jS("on",0,E.rec.on)end
if E.rec.off then jS("off",0,E.rec.off)end end for JQ,d3 in pairs(M.seen)do aG[#aG+1]=("K|%s|%s|%s|%s"):format(d3 .name,d3 .title or"",d3 .rar or"",d3 .price and string.format("%.0f",d3 .price)or"")
end if pcall(writefile,jR,table.concat(aG,"\n"))then al.dirty=false end end local function zd()if type(isfile)~="function"or type(readfile)~="function"then return end
local ze,zf=pcall(isfile,jR)if not(ze and zf)then return end local zg,pI=pcall(readfile,jR)if not(zg and type(pI)=="string")then return end
for zh in pI:gmatch("[^\n]+")do local c3,c4,bl=zh:match("^(%a)|([^|]+)|(.*)$")if c3=="P"then al.price[c4]=tonumber(bl)
elseif c3=="M"then j.loadMode=(bl~=""and bl~="nil")and bl or nil elseif c3=="A"and j.dec then local pJ=tonumber(c4)
local pK,go,zi=bl:match("^([^|]+)|(%d+)|(.*)$")if pJ and pK then go=tonumber(go)local pL,gp={},0 for zj in(zi..";"):gmatch("([^;]*);")do
gp=gp+1 if gp<=go then pL[gp]=j.dec(zj)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pJ]={m=pK,n=go,args=pL}end elseif c3=="R"and j.dec then
local pM=tonumber(c4)local gq,zk,gr,zl=bl:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pM and gq then gr=tonumber(gr)
local pN,gs={},0 for zm in(zl..";"):gmatch("([^;]*);")do gs=gs+1 if gs<=gr then pN[gs]=j.dec(zm)end end local jT={m=zk,n=gr,args=pN}
if gq=="rules"then E.rec.rules[pM]=jT elseif gq=="on"then E.rec.on=jT elseif gq=="off"then E.rec.off=jT end end
elseif c3=="K"then local pO,pP,zn=bl:match("^([^|]*)|([^|]*)|(.*)$")M.seen[M.key(c4)]={name=c4,title=pO~=""and pO or nil,
rar=pP~=""and pP or nil,price=tonumber(zn)}elseif c3=="O"and bl~=""then local gt={}for zo in bl:gmatch("[^,]+")do gt[#gt+1]=zo end
if#gt>0 then al.order[c4]=gt end end end end local function zp(gu)if type(gu)~="table"then return end local ce,pQ=gu.rarity,gu.contents
if type(ce)~="string"or ce==""or type(pQ)~="table"then return end local d4={}for JR,gv in ipairs(pQ)do if type(gv)=="table"and type(gv.butter)=="string"then
d4[#d4+1]={n=gv.butter,ch=tonumber(gv.chance)or 0}end end if#d4==0 then return end table.sort(d4,function(zq,zr)return zq.ch>zr.ch end)
local d5,d6={},false for zs,zt in ipairs(d4)do d5[zs]=zt.n end local jU=al.order[ce]if not jU or#jU~=#d5 then d6=true end
if not d6 then for pR=1,#d5 do if jU[pR]~=d5[pR]then d6=true break end end end al.order[ce]=d5 local jV=tonumber(gu.price)
if jV and al.price[ce]~=jV then al.price[ce]=jV d6=true end if d6 then al.dirty=true ae.at=0 D("learned the "..ce.." order from its crate")
end end local function c5(zu,zv)local zw=zu:FindFirstChild(zv,true)local zx,jW=pcall(function()return zw.Text end)
return(zx and type(jW)=="string"and jW~="")and jW or nil end local function am(pS)return ae.pretty[pS]or pS end
M.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function M.key(zy)return ge(zy or"")end
function M.learn(bm)if type(bm)~="table"or type(bm.name)~="string"then return end local jX=M.key(bm.name)local bn=M.seen[jX]or{}
local zz=(M.seen[jX]==nil)or(tonumber(bm.price)and bn.price~=tonumber(bm.price))bn.name,bn.title=bm.name,bm.title or bn.title
bn.rar,bn.price=bm.rarity or bn.rar,tonumber(bm.price)or bn.price M.seen[jX]=bn if zz then M.at,al.dirty=z(),true end
end function M.wanted(pT)if pT==nil then return false end local jY=M.key(pT)return e.CrateTicks[jY]==true or(e.BestCrate and q.bestCrate~=nil and(jY==q.bestCrate or jY==q.bestCrateTitle))
end function M.list()local c6={}for zA,gw in ipairs(M.base)do c6[M.key(gw[1])]={name=gw[1],title=gw[2],rar=gw[3],i=zA}end
for JS,d7 in ipairs(ae.rarOrder)do local pU=false for JT,zB in pairs(c6)do if zB.rar==d7 then pU=true break end end
if not pU and d7~="?"then local pV=d7:gsub("[^%w]","").."Crate"c6[M.key(pV)]={name=pV,title=d7 .." Crate",rar=d7,i=50,guess=true}
end end for pW,gx in pairs(M.seen)do local a8=c6[pW]or{i=100}a8 .name,a8 .title,a8 .rar=gx.name or a8 .name,gx.title or a8 .title,gx.rar or a8 .rar
a8 .price,a8 .guess=gx.price or a8 .price,nil c6[pW]=a8 end local d8,gy={},{}for zC,zD in ipairs(pD)do d8[zD]=zC end
for zE,pX in ipairs(ae.rarOrder)do d8[pX]=d8[pX]or(20+zE)end for zF,d9 in pairs(c6)do d9 .k=zF d9 .price=d9 .price or al.price[d9 .rar or""]
gy[#gy+1]=d9 end table.sort(gy,function(cf,cg)if cf.price and cg.price and cf.price~=cg.price then return cf.price<cg.price end
local pY,pZ=d8[cf.rar or""]or 99,d8[cg.rar or""]or 99 if pY~=pZ then return pY<pZ end if(cf.i or 100)~=(cg.i or 100)then return(cf.i or 100)<(cg.i or 100)end
return cf.k<cg.k end)return gy end local function zG()local p0=ag:FindFirstChild("Assets")local p1=p0 and p0:FindFirstChild("Squishies")
if not p1 then return false end local jZ,p2,c7={},{},{}local gz=0 for JU,gA in ipairs(p1:GetChildren())do local d_=W(gA.Name)
if d_~=""and not jZ[d_]then local gB=c5(gA,"RarityText")or"?"jZ[d_]=gB p2[d_]=c5(gA,"NameText")or gA.Name c7[gB]=c7[gB]or{}
table.insert(c7[gB],d_)gz=gz+1 end end if gz==0 then return false end for p3,zH in pairs(c7)do local p4=al.order[p3]or y4[p3]
local j0={}if p4 then for zI,zJ in ipairs(p4)do j0[W(zJ)]=zI end end table.sort(zH,function(p5,p6)local j1,j2=j0[p5],j0[p6]
if j1 and j2 then return j1<j2 end if j1 then return true end if j2 then return false end return am(p5)<am(p6)
end)end local j3={}for zK,zL in ipairs(pD)do j3[zL]=zK end local gC,cj={},{}for zM in pairs(c7)do gC[#gC+1]=zM end
pcall(function()for zN,zO in ipairs(require(ag.Modules.SquishyRNG).Keys)do cj[zO]=zN end end)table.sort(gC,function(c8,c9)
if cj[c8]and cj[c9]and cj[c8]~=cj[c9]then return cj[c8]<cj[c9]end local j4,j5=al.price[c8],al.price[c9]if j4 and j5 and j4~=j5 then return j4<j5 end
local j6,j7=j3[c8],j3[c9]if j6 and j7 then return j6<j7 end if j6 then return true end if j7 then return false end
return c8<c9 end)ae.rar,ae.pretty,ae.members,ae.rarOrder,ae.n,ae.at=jZ,p2,c7,gC,gz,z()return true end local function j8()
if ae.at==0 or(z()-ae.at)>120 then pcall(zG)end return ae.n>0 end local function zP(zQ)local p7=W(zQ)return ae.rar[p7]or(ab.name and W(ab.name)==p7 and ab.rar)or"?"
end local function zR()local gD={}local zS=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for zT,zU in pairs(zS)do if zU then gD[#gD+1]=am(zT)end end
table.sort(gD)return gD end local ar={dir="SAB",cfg="SAB/configs",auto="SAB/autoload_"..K.Name..".txt",autoOld="SAB/autoload.txt",
exec="autoexec/SAB_autoload.lua"}local function p8()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gE(p9)if type(makefolder)~="function"then return end local zV,zW=pcall(isfolder,p9)if not(zV and zW)then pcall(makefolder,p9)end
end local function ea(p_)if type(isfile)~="function"or type(readfile)~="function"then return nil end local zX,zY=pcall(isfile,p_)
if not(zX and zY)then return nil end local zZ,z0=pcall(readfile,p_)return zZ and z0 or nil end local function gF(z1,z2)
if type(writefile)~="function"then return false end return(pcall(writefile,z1,z2))end local function qa(z3)local eb={}
if type(listfiles)~="function"then return eb end local z4,qb=pcall(listfiles,z3)if not z4 or type(qb)~="table"then return eb end
for JV,z5 in ipairs(qb)do eb[#eb+1]=tostring(z5)end return eb end local function qc()local gG={}for JW,z6 in ipairs(qa(ar.cfg))do
local qe=z6:match("([^/\\]+)%.txt$")if qe then gG[#gG+1]=qe end end table.sort(gG)return gG end local function z7()
local ac={"V|1"}ac[#ac+1]="N|Every|"..tostring(e.Every)ac[#ac+1]="N|GlazeLead|"..tostring(e.GlazeLead)ac[#ac+1]="N|FpsCap|"..tostring(e.FpsCap)
ac[#ac+1]="N|MemLimit|"..tostring(e.MemLimit)ac[#ac+1]="N|Best|"..tostring(e.Best or 0)for JX,qf in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ac[#ac+1]="S|"..qf.."|"..e[qf]end
do local gH={}for z8,gI in pairs(e.Pets)do local qg=(gI.b and"b"or"")..(gI.g and"g"or"")..(gI.w and"w"or"")..(tonumber(gI.f)==-1 and"k"or"")
if qg~=""then gH[#gH+1]=z8 .."|"..qg end end table.sort(gH)ac[#ac+1]="P|-"for JY,z9 in ipairs(gH)do ac[#ac+1]="P|"..z9 end
end for JZ,qh in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
ac[#ac+1]="B|"..qh.."|"..(e[qh]and"1"or"0")end local j9=K:GetAttribute("AutoRollRules")if type(j9)=="string"and j9~=""then e.ARrules,e.ARstop=j9,tostring(K:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then ac[#ac+1]="S|rules|"..e.ARrules ac[#ac+1]="S|stop|"..e.ARstop end if c.winPos then ac[#ac+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ac[#ac+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for J0,j_ in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gJ={}for z_,Aa in pairs(j_[2])do if Aa then gJ[#gJ+1]=z_ end end table.sort(gJ)ac[#ac+1]=j_[1].."|-"for J1,Ab in ipairs(gJ)do ac[#ac+1]=j_[1].."|"..Ab end
end return table.concat(ac,"\n")end local function Ac(ka)if type(ka)~="string"or ka==""then return false end local qi,qj,qk,ql,ec={},false,{},false,nil
for Ad in ka:gmatch("[^\n]+")do local aH,ai,aB=Ad:match("^(%a)|([^|]*)|?(.*)$")if aH=="N"and ai=="Every"then local kb=tonumber(aB)
if kb and kb>=1 then e.Every=math.floor(kb)end elseif aH=="N"and(ai=="FpsCap"or ai=="MemLimit")then local kc=tonumber(aB)
if kc and kc>=0 then e[ai]=math.floor(kc)end elseif aH=="N"and ai=="Best"then local gK=tonumber(aB)if gK and gK>=0 and gK<=4 then e.Best=math.floor(gK)end
elseif aH=="N"and ai=="GlazeLead"then local gL=tonumber(aB)if gL and gL>=5 and gL<=600 then e.GlazeLead=math.floor(gL)end
elseif aH=="S"and(ai=="TeamNormal"or ai=="TeamFull"or ai=="TeamGlaze"or ai=="TeamWax")then e[ai]=aB elseif aH=="P"and ai~=""then
if not ec then ec={}end if ai~="-"and aB~=""then ec[ai]={b=aB:find("b",1,true)and true or nil,g=aB:find("g",1,true)and true or nil,
w=aB:find("w",1,true)and true or nil,f=aB:find("k",1,true)and-1 or nil}end elseif aH=="B"then if e[ai]~=nil then e[ai]=(aB=="1")end
elseif aH=="S"and ai=="rules"then e.ARrules=aB elseif aH=="S"and ai=="stop"then e.ARstop=aB elseif aH=="W"then
c.winPos={tonumber(ai)or 10,tonumber(aB)or 44}elseif aH=="G"then c.togPos={tonumber(ai)or 10,tonumber(aB)or 300}
elseif aH=="T"and ai~=""then if ai~="-"then qi[ai]=true end qj=true elseif aH=="K"and ai~=""then if ai~="-"then qk[ai]=true end
ql=true end end if qj then e.Targets=qi end if ql then e.CrateTicks=qk end if ec then e.Pets=ec end return true
end local function ed(c_)if not p8()then return false,"this executor cannot write files"end c_=(c_ or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c_==""then return false,"give the config a name"end gE(ar.dir)gE(ar.cfg)if not gF(ar.cfg.."/"..c_..".txt",z7())then return false,"could not write the file"end
c.config=c_ return true,c_ end local function kd(gM)local qm=ea(ar.cfg.."/"..gM..".txt")if not qm then return false,"no config called "..tostring(gM)end
if not Ac(qm)then return false,"that config looks empty"end c.config=gM return true,gM end local function ke(qo)
gE(ar.dir)gF(ar.auto,qo or"")c.autoload=qo end local function Ae()if c.selfPath then return c.selfPath end local gN
for J2,Af in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ar.dir})do for J3,qp in ipairs(qa(Af))do local kf=qp:lower()
if kf:sub(-4)==".lua"and(kf:find("sab_farm",1,true)or kf:find("sab farm",1,true))then gN=gN or qp end end end
c.selfPath=gN return gN end ar.stub=[[
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
local function Ag()if not p8()then return false,"this executor cannot write files"end gE("autoexec")if not gF(ar.exec,ar.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gO=(function()local Ah,Ai=pcall(function()return game:GetService("TeleportService")end)return Ah and Ai or nil end)()
local function qq()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local Aj=queueonteleport or queue_on_teleport return(pcall(Aj,ar.stub))end local function ee(Ak)if c.rejoining then return end
c.rejoining=true D("REJOIN ("..Ak..")")pcall(gl)if c.autoload then pcall(ed,c.autoload)end local Al=qq()D(Al and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for J4=1,30 do if not gO then break end pcall(function()gO:Teleport(game.PlaceId,K)end)task.wait(10)
end end)end local function Am()local An,qr=pcall(function()return game:GetService("GuiService")end)if An and qr then
pcall(function()V(qr.ErrorMessageChanged:Connect(function()if e.Rejoin then ee("roblox error message")end end))
end)end pcall(function()local qs=game:GetService("CoreGui")local qt=qs and qs:WaitForChild("RobloxPromptGui",15)
local qu=qt and qt:WaitForChild("promptOverlay",15)if qu then V(qu.ChildAdded:Connect(function(Ao)if e.Rejoin and tostring(Ao.Name):lower():find("errorprompt",1,true)then ee("disconnect prompt")end
end))end end)if gO then pcall(function()V(gO.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()ee("teleport retry")end)end
end))end)end end local function qv(Ap)local qw=c.plot and c.plot:FindFirstChild(Ap)if not qw then return nil,false end
for J5,kg in ipairs(qw:GetChildren())do if kg:IsA("Model")or kg:IsA("BasePart")then return kg,true end end return nil,true
end local function ck()local bH=qv("RolledSquishy")if not bH then return nil end return{model=bH,name=bH.Name,pretty=c5(bH,"NameText")or am(W(bH.Name)),
rar=c5(bH,"RarityText")or zP(bH.Name),price=c5(bH,"PriceText")}end local function qx(kh)return type(kh)=="string"and(ae.rar[W(kh)]~=nil or yR(kh))
end local function ad()local ki=qv("SquishyEquipped")if ki then c.carrySrc,j.heldAt="model",z()return ki.Name,ki end
local qy=K.Character if qy then for J6,ef in ipairs(qy:GetDescendants())do if(ef:IsA("Model")or ef:IsA("Tool"))and qx(ef.Name)then
c.carrySrc,j.heldAt="character",z()return ef.Name,ef end end end local gP=K:GetAttribute("SquishyEquipped")if type(gP)=="string"and gP~=""and qx(gP)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gP,nil end c.carrySrc=nil end local function J7()local J8,Aq=ad()return Aq end local function cl()
local eg=ck()local gQ=eg and yT(eg.price)local gR=bk()if gQ and gR and gR<gQ then return gR,gQ end if eg and type(eg.price)=="string"and eg.price:find("%d")and not gQ then return gR or 0,math.huge end
end local function cm(Ar)dY[#dY+1]=os.date("%H:%M:%S").." "..Ar if#dY>40 then table.remove(dY,1)end end local function As(cn,gS)
if type(cn)~="string"then return end cm(("Roll(%s,%s)"):format(cn,tostring(gS)))if cn:lower():find("crate",1,true)then
j.rolled,j.rolledAt=cn,z()return end ab.seq=ab.seq+1 ab.name,ab.at=cn,z()ab.rar=type(gS)=="string"and gS or nil
c.rolls=c.rolls+1 if aP(cn)then D(("ROLL %s [%s] = TARGET"):format(cn,tostring(gS)))end end local function At(co)
if type(co)~="table"then return end local gT=co.butter or co.itemName if type(gT)~="string"then return end c.gifts=c.gifts+1
ab.gift,ab.giftAt=gT,z()if type(co.giftId)=="string"then local qz=ag:FindFirstChild("Remotes")local qA=qz and qz:FindFirstChild("GiftThanks")
if qA then pcall(function()qA:FireServer(co.giftId)end)end end cm("Gift("..gT.." from "..tostring(co.fromName)..")")
D(("GIFT from %s: %s - it will not be waxed"):format(tostring(co.fromName),gT))end local function Au()local qB=ag:WaitForChild("Remotes",30)
if not c.alive then return end if not qB then D("Remotes folder missing - no roll events")return end V(K:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local qC=K:GetAttribute("SquishyEquipped")if type(qC)=="string"and qC~=""then j.heldAt=z()end end))local AA={
SquishyRollAnimation=As,InitSquishy=function(qD)ab.init,ab.initAt=tostring(qD),z()cm("Init("..tostring(qD)..")")end,
CrateUpdate=function(da,qE)pcall(zp,da)pcall(M.learn,da)if type(da)=="table"then local Av=qE==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not Av then return end local Aw=not j.waiting local Ax=j.on j.waiting,j.data,j.at=true,da,z()j.on=(qE==true)
j.title=tostring(da.title or da.name or"crate")if j.on and not Ax then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cm("CrateWindow open("..j.title..")")elseif Aw then cm("Crate waiting("..j.title..")")D(j.title.." is waiting on your stand")
end else if j.waiting then cm("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local Ay=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,Ay)end if j.classify then local Az=z()
task.spawn(function()pcall(j.classify,Az)end)end end end,GiftReceived=At,}for gU,AB in pairs(AA)do local kj=qB:FindFirstChild(gU)
if kj and kj:IsA("RemoteEvent")then V(kj.OnClientEvent:Connect(AB))elseif gU~="CrateUpdate"and gU~="GiftReceived"then D("remote "..gU.." missing")end
end end local function kk()local cp=ck()if cp then if aP(cp.name)then return{state="match",shown=cp.pretty,src="pad",info=cp}
end return{state="skip",info=cp,level="idle",text=("on pad: %s [%s] - not ticked"):format(cp.pretty,tostring(cp.rar))}
end if ab.name and(z()-ab.at)<4 then if aP(ab.name)then return{state="match",shown=am(W(ab.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(am(W(ab.name)),tostring(ab.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gV(AC,AD,AE,AF)
local gW=RaycastParams.new()gW.FilterType=Enum.RaycastFilterType.Exclude local kl={K.Character}for J9,AG in ipairs(AF or{})do kl[#kl+1]=AG end
gW.FilterDescendantsInstances=kl pcall(function()gW.RespectCanCollide=true end)local qF=ak:Raycast(Vector3 .new(AC,AD+4,AE),Vector3 .new(0,-30,0),gW)
return qF and qF.Position or nil end local function db(qG)local qH=qG:FindFirstChildOfClass("Humanoid")return((qH and qH.HipHeight)or 2)+qG.HumanoidRootPart.Size.Y/2+0.2
end local function km(AH,AI)local kn=AH:FindFirstChildOfClass("Humanoid")local AJ=z()while z()-AJ<AI do if kn and(kn.FloorMaterial~=Enum.Material.Air or kn.SeatPart)then return true end
ah(0.05)end return false end local function aE(AK,ko,kp)local qI=AK.HumanoidRootPart qI.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qI.CFrame=kp and CFrame.new(ko,Vector3 .new(kp.X,ko.Y,kp.Z))or CFrame.new(ko)end local function cq(bo,qJ)local cr=aq()
if not cr or not bo then return false end local bI=bo.Position local gX=math.clamp(math.max(bo.Size.X,bo.Size.Z)/2+2.2,3,7)
local qK=(qJ and qJ.MaxActivationDistance)or 10 if gX>qK-2 then gX=math.max(2.5,qK-2)end local eh={}local function cs(ei)
ei=Vector3 .new(ei.X,0,ei.Z)if ei.Magnitude>0.05 then eh[#eh+1]=ei.Unit end end local qL=pp()if qL then cs(qL-bI)end
cs(bo.CFrame.LookVector)cs(-bo.CFrame.LookVector)cs(bo.CFrame.RightVector)cs(-bo.CFrame.RightVector)cs(cr.HumanoidRootPart.Position-bI)
if#eh==0 then cs(Vector3 .new(0,0,1))end local AL,gY=db(cr),false for J_,AM in ipairs(eh)do local gZ=bI+AM*gX
local kq=gV(gZ.X,bI.Y,gZ.Z,{bo})if kq and math.abs(kq.Y-bI.Y)<14 then aE(cr,Vector3 .new(gZ.X,kq.Y+AL,gZ.Z),bI)
if km(cr,0.7)then gY=true break end end end if not gY then aE(cr,bI+eh[1]*gX+Vector3 .new(0,3,0),bI)gY=km(cr,1)
end ah(0.12)return gY end local function qM(ej)if not ej.Parent or not ej.Enabled then return false end pcall(function()ej:InputHoldBegin()end)
ah(math.max(ej.HoldDuration,0)+0.08)pcall(function()ej:InputHoldEnd()end)return true end local function ao(qN,AN)
local AO=z()while z()-AO<AN do if qN()then return true end ah(0.05)end return qN()end local function ek(dc,AP,qO,AQ)
local AS=c.zapFirst and{"zap","hold"}or{"hold","zap"}for AT,kr in ipairs(AS)do if AT==2 and(AQ or not(dc.Parent and dc.Enabled and(not qO or qO())))then break end
local ks if kr=="hold"then ks=qM(dc)else ks=type(fireproximityprompt)=="function"and dc.Parent~=nil and dc.Enabled and pcall(fireproximityprompt,dc)end
if ks and ao(AP,1.2)then c.zapFirst=(kr=="zap")return true,kr end end return false end local function qP(kt)local bJ=pB()
if not bJ or not bJ.Enabled then D("buy: nothing on the pad")return false end do local qQ,qR=cl()if qQ then c.cashFails=(c.cashFails or 0)+1
c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("not buying: have $%s, price %s"):format(av(qQ),qR==math.huge and"unreadable"or("$"..av(qR))))
return false end end local ku=d2(bJ)if not ku then D("buy: pad part missing")return false end c.lastBuyAt=z()
local AU,qS=ab.seq,bk()local qT=aq()local AV=qT and(qT.HumanoidRootPart.Position-ku.Position).Magnitude>12 cq(ku,bJ)
if AV then ah(0.4)end if not bJ.Enabled then D("buy aborted: pad emptied")return false end local dd=kk()if not kt and dd.state~="match"then
D("buy aborted: "..(dd.text or"pad changed"))c.matchSince=nil return false end local kv=dd.info and dd.info.name or(dd.state=="match"and ab.name)or nil
local function AW()return bJ.Enabled and ad()==nil and(kt or kk().state=="match")end local AX,AY=ek(bJ,function()
return ad()~=nil or((not bJ.Enabled)and(kt or ab.seq==AU))end,AW,cl()~=nil)if AX then ao(function()return ad()~=nil end,0.8)
local el=ad()local qU=bk()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0 c.matchSince=nil ab.name,ab.rar,ab.at=nil,nil,z()
D(("BOUGHT %s%s via %s"):format(el and am(W(el))or(dd.shown or"?"),(qS and qU)and(" for $"..av(qS-qU))or"",AY))
if el and kv and W(el)~=W(kv)then D(("note: picked up %s, not %s"):format(el,kv))end return true end local g0=ck()
if cl()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("BUY REFUSED: cash short - have $%s, price %s"):format(av(bk()),(g0 and g0 .price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)D(("buy did not go through (%s, try %d) - again in %ds"):format(g0 and g0 .price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qV()local em=ad()if not em then c.holding=false D("place: hands are empty")
return false end if not aP(em)then D(("REFUSED TO WAX %s - it is not ticked"):format(am(W(em))))return false end
for Ka=1,e.PlaceTries do local bK=y3()if not bK then D("place: no free station")break end local qW=d2(bK)if qW then
cq(qW,bK)local qX=ad()if not qX then c.holding=false D("place: hands emptied on the way")return false end if not aP(qX)then D("place: what I carry changed, not waxing it")return false end
if bK.Enabled then local AZ,A0=ek(bK,function()return not bK.Enabled end,function()return bK.Enabled end)if AZ then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 ab.name,ab.rar,ab.at=nil,nil,z()
D(("WAXED %s #%d at %s via %s"):format(am(W(em)),c.placed,bK.Parent.Parent.Name,A0))if q.placed then pcall(q.placed,em)end
return true end end end ah(0.25)end c.placeFails=c.placeFails+1 if ad()==nil then c.holding=false end D("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ad()))D(c.capMsg)end return false end function A.place()local A1=z()while c.alive and A.editing and z()-A1<25 do ah(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local A2=z()while c.alive and A.current()~=e.TeamWax and z()-A2<5 do ah(0.1)end
if A.current()==e.TeamWax then ah(0.3)else D("wax team did not come on in time - placing anyway")end end local A3,qY=pcall(qV)
A.placing=false if not A3 then error(qY,0)end return qY end local function qZ(q0)return type(q0)=="string"and q0:lower():find("crate",1,true)~=nil
end local A4={SABFarmGui=1,SABToggle=1,SABError=1}local function kw(A5)local bL=A5 while bL do if A4[bL.Name]then return false end
if bL:IsA("ScreenGui")then local A6,A7=pcall(function()return bL.Enabled end)return(not A6)or A7~=false end if bL:IsA("GuiObject")and not bL.Visible then return false end
bL=bL.Parent end return false end local function g1(g2)local de=""pcall(function()if g2:IsA("TextButton")then de=g2 .Text end end)
if not de:find("%a")then for Kb,g3 in ipairs(g2:GetDescendants())do if(g3:IsA("TextLabel")or g3:IsA("TextButton"))and g3 .Text:find("%a")then de=g3 .Text break end
end end if not de:find("%a")then de=g2 .Name end return(de:lower():gsub("[^%a]",""))end local function A8()local en,eo
local q1=K:FindFirstChildOfClass("PlayerGui")if not q1 then return nil,nil end for Kc,ep in ipairs(q1:GetDescendants())do
if ep:IsA("GuiButton")and kw(ep)then local kx=g1(ep)if kx:sub(1,4)=="open"and not kx:find("shop",1,true)then en=en or ep end
if kx:sub(1,7)=="discard"then eo=eo or ep end end end if en and eo then return en,eo end if j.on then return en,eo end
return nil,nil end local ky=(function()local A9,A_=pcall(function()return game:GetService("VirtualInputManager")end)return A9 and A_ or nil end)()
local function q2(bp,kz)local kA={}local function q3(Ba)kA[#kA+1]=Ba end if c.tapWay then q3(c.tapWay)end for Kd,q4 in ipairs({"touch","conn","signal"})do
if q4~=c.tapWay then q3(q4)end end local function q5(Bb,...)local Bc,kB=pcall(getconnections,Bb)if not(Bc and type(kB)=="table"and#kB>0)then return false end
local q6,Bd,Be=false,{...},select("#",...)for Ke,Bf in ipairs(kB)do if pcall(function()Bf:Fire(table.unpack(Bd,1,Be))end)then q6=true end
end return q6 end local function q7()local q8=Vector3 .new(0,0,0)pcall(function()local q9,q_=bp.AbsolutePosition,bp.AbsoluteSize
q8=Vector3 .new(q9 .X+q_.X/2,q9 .Y+q_.Y/2,0)end)local kC={Position=q8,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kC.UserInputType=Enum.UserInputType.Touch end)pcall(function()kC.UserInputState=Enum.UserInputState.End end)
return kC end for Kf,bq in ipairs(kA)do local eq=false if bq=="conn"and type(getconnections)=="function"then if q5(bp.MouseButton1Click)then
eq=true if ao(kz,1.5)then c.tapWay=bq return true,bq end end eq=q5(bp.Activated,q7(),1)elseif bq=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bp.MouseButton1Click)then if ao(kz,1.5)then c.tapWay=bq return true,bq end end eq=pcall(firesignal,bp.Activated,q7(),1)
elseif bq=="touch"and ky then eq=pcall(function()local ra,rb=bp.AbsolutePosition,bp.AbsoluteSize local rc=0 local rd=bp:FindFirstAncestorWhichIsA("ScreenGui")
local Bg,Bh=pcall(function()return rd and rd.IgnoreGuiInset end)if not(Bg and Bh)then pcall(function()rc=game:GetService("GuiService"):GetGuiInset().Y end)
end local rf,rg=ra.X+rb.X/2,ra.Y+rb.Y/2+rc ky:SendMouseButtonEvent(rf,rg,0,true,game,1)task.wait(0.06)ky:SendMouseButtonEvent(rf,rg,0,false,game,1)
end)end if eq and ao(kz,1.5)then c.tapWay=bq return true,bq end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kD(rh)local er=rh.Parent while er and er~=c.plot do if j.NOT[er.Name]then return false end er=er.Parent
end local kE=(rh.ActionText or""):lower()if kE:find("roll",1,true)or kE:find("place",1,true)or kE:find("sell",1,true)then return false end
return true end local function ri()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local rj=c.plot:FindFirstChild("CrateStand")local es if rj then for Kg,g4 in ipairs(rj:GetDescendants())do
if g4:IsA("ProximityPrompt")and g4 .Enabled and kD(g4)then es=g4 break end end end if not es then for Kh,bM in ipairs(c.plot:GetDescendants())do
if bM:IsA("ProximityPrompt")and bM.Enabled and kD(bM)then local rk=bM:FindFirstAncestorWhichIsA("Model")local Bi=((bM.ActionText or"").." "..(bM.ObjectText or"").." "..bM.Name.." "..(rk and rk.Name or"")):lower()
if Bi:find("crate",1,true)then es=bM break end end end end j.prompt=es return es end local function kF()if j.on then return true end
local et=ri()if not et then j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local rl=d2(et)if rl then cq(rl,et)end j.ours=true ek(et,function()return j.on end)if ao(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: pressed "..gg(et).." but no window came up")
return false end do local function Bj(rm)local df=rm.Parent while df and df:IsA("GuiObject")do local rn,ro=false,false
for Ki,eu in ipairs(df:GetDescendants())do if eu~=rm and eu:IsA("GuiButton")and g1(eu):sub(1,7)=="discard"then rn=true end
if eu:IsA("TextLabel")then local kG=eu.Text:lower()if kG:find("crate",1,true)or kG:find("can contain",1,true)or kG:find("cost",1,true)then ro=true end
end if rn and ro then return df end end df=df.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local rp=K:FindFirstChildOfClass("PlayerGui")if not rp then return nil end for Kj,g5 in ipairs(rp:GetDescendants())do
if g5:IsA("GuiButton")and not g5:FindFirstAncestor("SABFarmGui")and g1(g5):sub(1,4)=="open"then local kH=Bj(g5)
if kH then j.win=kH return kH end end end end local function Bk(Bl)for Kk,g6 in ipairs(Bl:GetDescendants())do
if g6:IsA("GuiButton")then local rq,kI=g1(g6),g6 .Name:lower()if rq=="x"or rq=="close"or kI=="x"or kI:find("close",1,true)or kI:find("exit",1,true)then return g6 end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(Bm)task.wait(Bm and 4 or 1.2)if j.on or j.waiting then return end
local g7=j.findWin()if not g7 or not kw(g7)then return end local rr=Bk(g7)if rr and q2(rr,function()return not kw(g7)end)then return end
D("the crate window is still open - tap its X")end end local function ev(g8)if not kF()then return false end local rs=z()-(j.openedAt or 0)
if rs<0.6 then ah(0.6-rs)end local kJ=j.title local Bn,Bo=A8()local rt=g8 and Bn or Bo if not rt then j.lastFail=z()
c.crateFails=c.crateFails+1 D(("crate: no %s button found in %s"):format(g8 and"Open"or"Discard",kJ))return false
end local Bp=ad()local Bq,Kl=q2(rt,function()return(not j.on)or(ad()~=nil and ad()~=Bp)end)if not Bq then j.lastFail=z()
c.crateFails=c.crateFails+1 D("crate: could not press "..(g8 and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if g8 then c.crates=c.crates+1 ao(function()return ad()~=nil end,1.5)local ru=ad()
D(("OPENED %s -> %s"):format(kJ,ru and am(W(ru))or"?"))else D("discarded "..kJ.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(Br,...)local Bs=select("#",...)j.calls[#j.calls+1]={t=z(),m=Br,n=Bs,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aI,br)local bN=type(aI)if(bN=="string"or bN=="number")and type(br.data)=="table"then for rv,kK in pairs(br.data)do
if kK==aI and type(rv)=="string"and(type(kK)=="string"or type(kK)=="number")then return{__slot="f:"..rv}end end
end if bN=="string"then if br.crate and aI==br.crate then return{__slot="crate"}end if br.title and aI==br.title then return{__slot="title"}end
if br.rar and aI==br.rar then return{__slot="rarity"}end return aI end if bN=="number"or bN=="boolean"or bN=="nil"then return aI end
if bN=="table"then local rw={}for Bt,rx in pairs(aI)do if type(rx)=="table"then return nil,"nested table"end local Bu,ry=j.slot(rx,br)
if ry then return nil,ry end rw[Bt]=Bu end return rw end local Bv,Bw=pcall(function()return aI:IsA("Instance")end)
if Bv and Bw then if aI==K then return{__slot="player"}end if c.plot and aI==c.plot then return{__slot="plot"}end
local g9=c.plot and c.plot:FindFirstChild("CrateStand")if g9 and aI==g9 then return{__slot="stand"}end if g9 and aI.Parent==g9 then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bN..")"end function j.resolve(g_)if type(g_)~="table"then return g_ end
local aX=g_.__slot if aX and aX:sub(1,2)=="f:"then return j.data and j.data[aX:sub(3)]end if aX=="crate"then return j.data and j.data.name end
if aX=="title"then return(j.data and j.data.title)or j.title end if aX=="rarity"then return j.data and j.data.rarity end
if aX=="player"then return K end if aX=="plot"then return c.plot end if aX=="stand"or aX=="model"then local kL=c.plot and c.plot:FindFirstChild("CrateStand")
if aX=="stand"or not kL then return kL end for Km,rz in ipairs(kL:GetChildren())do if qZ(rz.Name)then return rz end end
return nil end local rA={}for Bx,By in pairs(g_)do rA[Bx]=j.resolve(By)end return rA end function j.classify(kM)
if j.directOff then return end local ha={}for Kn,kN in ipairs(j.calls)do if kN.t<=kM+0.05 and kM-kN.t<=6 then ha[#ha+1]=kN end
end if#ha==0 then return end if not ao(function()return(j.heldAt or 0)>=kM-1 end,2.5)then return end local ew={}
for Ko,ex in ipairs(ha)do local rB={}for rC=1,ex.n do local Bz,rD=j.slot(ex.args[rC],ex)if rD then D("crate call has "..rD.." - keeping the button method")
return end rB[rC]=Bz end ew[#ew+1]={m=ex.m,n=ex.n,args=rB}end local kO=j.learned j.learned={seq=ew,mode=kO and kO.mode or nil}
al.dirty=true if not kO then D(("learned how to open crates directly (%d call%s)"):format(#ew,#ew==1 and""or"s"))end
end function j.replay()local rE=j.learned local rF=ag:FindFirstChild("Remotes")local kP=rF and rF:FindFirstChild("CrateAction")
if not(rE and kP)then return false end local rG=table.unpack or unpack j.replaying=true for Kp,ey in ipairs(rE.seq)do
local kQ={}for rH=1,ey.n do kQ[rH]=j.resolve(ey.args[rH])end task.spawn(function()pcall(function()if ey.m=="InvokeServer"then kP:InvokeServer(rG(kQ,1,ey.n))
else kP:FireServer(rG(kQ,1,ey.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(BA)return(BA:gsub("[%%|;=,\n]",function(BB)return("%%%02X"):format(BB:byte())end))end
function j.enc(ct)local hb=type(ct)if hb=="string"then return"s"..j.esc(ct)end if hb=="number"then return"n"..tostring(ct)end
if hb=="boolean"then return ct and"b1"or"b0"end if hb=="nil"then return"z"end if ct.__slot then return"k"..ct.__slot end
local kR={}for BC,BD in pairs(ct)do kR[#kR+1]=j.enc(BC).."="..j.enc(BD)end return"t"..table.concat(kR,",")end
function j.dec(rI)local ez,eA=rI:sub(1,1),rI:sub(2)local function BE(BF)return(BF:gsub("%%(%x%x)",function(BG)return string.char(tonumber(BG,16))end))end
if ez=="s"then return BE(eA)end if ez=="n"then return tonumber(eA)end if ez=="b"then return eA=="1"end if ez=="k"then return{__slot=eA}end
if ez=="t"then local rJ={}for BH in eA:gmatch("[^,]+")do local rK,BI=BH:match("^(.-)=(.*)$")if rK then local rL=j.dec(rK)
if rL~=nil then rJ[rL]=j.dec(BI)end end end return rJ end return nil end function j.goneOrNew(BJ)return function()
if not j.waiting then return true end local rM=ad()return rM~=nil and rM~=BJ end end function j.near()local rN=ag:FindFirstChild("Remotes")
local kS=rN and rN:FindFirstChild("CrateAction")local hc=aq()local kT=c.plot and c.plot:FindFirstChild("CrateStand")
local kU=kT and kT:FindFirstChild("Spot")if not(kS and hc and kU)then D(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kS and"no CrateAction remote"or not hc and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kV=hc.HumanoidRootPart local hd=kV.CFrame local rO,kW=j.title,"no answer"local BK=ad()local rP=kT:FindFirstChild("Holder")
local function rQ()if not rP then return j.waiting or j.on end for Kq,BL in ipairs(rP:GetChildren())do if BL:IsA("Model")then return true end end
return false end for BM=1,3 do if not(j.waiting or j.on)or not rQ()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kV.Position-kU.Position).Magnitude>8 then cq(kU,j.prompt)end ah(0.12+0.15*BM)
local a9={}j.replaying=true task.spawn(function()a9 .ok,a9 .v=pcall(function()return kS:InvokeServer("open")end)
a9 .done=true end)ao(function()return a9 .done end,6)j.replaying=false local cu=a9 .v if a9 .done and a9 .ok and type(cu)=="table"and cu.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 D(("OPENED %s -> %s (no window)"):format(rO,cu.prize and am(W(tostring(cu.prize)))or"?"))
ao(function()local rR=ad()return rR~=nil and rR~=BK end,1.5)if(kV.Position-hd.Position).Magnitude>8 then pcall(function()aE(hc,hd.Position,hd.Position+hd.LookVector)end)end
return true,"opened"end kW=(a9 .done and a9 .ok and type(cu)=="table")and tostring(cu.reason or"refused, no reason given")
or(a9 .done and("error: "..tostring(cu))or"no answer in 6s")ah(0.3)if not rQ()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 D(("crate: the server would not open %s next to the stand (%s)"):format(rO,kW))
return false,kW end j.GIVEUP=600 function j.drop()local rS=ag:FindFirstChild("Remotes")local rT=rS and rS:FindFirstChild("CrateAction")
local rU=c.plot and c.plot:FindFirstChild("CrateStand")local kX=rU and rU:FindFirstChild("Spot")local rV=aq()
if kX and rV and(rV.HumanoidRootPart.Position-kX.Position).Magnitude>8 then cq(kX,j.prompt)ah(0.3)end local kY,bs=false,nil
if rT then kY,bs=pcall(function()return rT:InvokeServer("discard")end)end D(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(kY and type(bs)=="table"and bs.ok)and"done"or("answer: "..tostring(type(bs)=="table"and(bs.reason or bs.ok)or bs))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(kY and type(bs)=="table"and bs.ok)then ev(false)end end function j.smart()local kZ=j.title if(j.nearFails or 0)<3 then
local BN=j.near()if BN then return true end if j.nearFails>=3 then D("opening next to the stand failed 3 times - trying the older ways")end
end local cv=j.learned if cv then local k0=ad()if j.on then j.replay()if ao(j.goneOrNew(k0),3.5)then c.crates=c.crates+1
D("OPENED "..kZ.." (direct)")return true end else if cv.mode~="window"then j.replay()if ao(j.goneOrNew(k0),3.5)then
c.crates,j.fails=c.crates+1,0 if cv.mode~="direct"then cv.mode,al.dirty="direct",true D("crates now open directly - the window never comes up")
end D("OPENED "..kZ.." (direct, no window)")return true end end if kF()then j.replay()if ao(j.goneOrNew(k0),3.5)then
c.crates,j.fails=c.crates+1,0 if cv.mode~="window"then cv.mode,al.dirty="window",true D("crates need their window up first - it shows briefly")
end D("OPENED "..kZ.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,al.dirty=cv,nil,true
if j.fails>=3 then j.directOff=true D("direct crate opening failed 3 times - using the button for now")else D("the learned crate call did not work - back to pressing Open")
end end return ev(true)end function E.snap()return{rules=K:GetAttribute("AutoRollRules"),stop=K:GetAttribute("AutoRollStop"),
on=K:GetAttribute("AutoRollOn"),main=K:GetAttribute("AutoRoll")}end E.cache={}function E.watchCache()E.cache=E.snap()
for BO,rW in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(K:GetAttributeChangedSignal(rW):Connect(function()E.cache[BO]=K:GetAttribute(rW)end))
end end function E.isOn()return K:GetAttribute("AutoRollOn")==true end function E.saw(BP,...)local he=E.cache
local BQ={m=BP,n=select("#",...),args={...},before={rules=he.rules,stop=he.stop,on=he.on,main=he.main}}task.delay(1.5,function()
if c.alive then pcall(E.learnOne,BQ)end end)end function E.learnOne(eB)local aC,eC=E.snap(),eB.before local hf=(aC.rules~=eC.rules)or(aC.stop~=eC.stop)
local rX=(aC.on~=eC.on)or(aC.main~=eC.main)if not hf and not rX then return end local rY={}for rZ=1,eB.n do local aQ=eB.args[rZ]
local cw=type(aQ)if cw=="string"and aQ~=""and aQ==aC.rules then aQ={__slot="rules"}elseif cw=="string"and aQ~=""and hf and aQ==aC.stop and aC.stop~=eC.stop then aQ={__slot="stop"}
elseif cw=="table"then local r0={}for BR,dg in pairs(aQ)do if type(dg)=="table"or(type(dg)=="userdata")then E.msg="Auto Roll sends something I cannot repeat"return
end r0[BR]=(type(dg)=="string"and dg~=""and dg==aC.rules)and{__slot="rules"}or dg end aQ=r0 elseif cw~="string"and cw~="number"and cw~="boolean"and cw~="nil"then
if aQ==K then aQ={__slot="player"}else E.msg="Auto Roll sends something I cannot repeat"return end end rY[rZ]=aQ
end local dh={m=eB.m,n=eB.n,args=rY}if hf then local k1=false for BS=1,dh.n do local eD=dh.args[BS]if type(eD)=="table"and eD.__slot=="rules"then k1=true end
if type(eD)=="table"and not eD.__slot then for Kr,r1 in pairs(eD)do if type(r1)=="table"and r1 .__slot=="rules"then k1=true end end
end end if k1 then E.rec.rules={dh}else table.insert(E.rec.rules,dh)if#E.rec.rules>60 then table.remove(E.rec.rules,1)end
end end if rX then if aC.on==true then E.rec.on=dh else E.rec.off=dh end e.AutoRoll=(aC.on==true)end if aC.rules and aC.rules~=""then e.ARrules,e.ARstop=aC.rules,aC.stop or""end
al.dirty=true E.msg=""D(("learned an Auto Roll %s message"):format(hf and"choices"or(aC.on and"on"or"off")))end
function E.resolve(di)if type(di)~="table"then return di end if di.__slot=="rules"then return e.ARrules~=""and e.ARrules or K:GetAttribute("AutoRollRules")end
if di.__slot=="stop"then return e.ARstop~=""and e.ARstop or K:GetAttribute("AutoRollStop")end if di.__slot=="player"then return K end
local r2={}for BT,BU in pairs(di)do r2[BT]=E.resolve(BU)end return r2 end function E.replay(r3,BV)local r4=table.unpack or unpack
for Ks,eE in ipairs(BV)do local k2={}for r5=1,eE.n do k2[r5]=E.resolve(eE.args[r5])end E.replaying=true pcall(function()
if eE.m=="InvokeServer"then task.spawn(function()pcall(function()r3:InvokeServer(r4(k2,1,eE.n))end)end)else r3:FireServer(r4(k2,1,eE.n))end
end)E.replaying=false task.wait(0.25)end end function E.apply(r6,BW)if E.busy or not c.alive then return end E.busy=true
pcall(function()local r7=ag:FindFirstChild("Remotes")local k3=r7 and r7:FindFirstChild("AutoRollAction")if not k3 then E.msg="this game has no AutoRollAction"return end
local bO=e.AutoRoll if bO and e.ARrules~=""and K:GetAttribute("AutoRollRules")~=e.ARrules then if#E.rec.rules==0 then
E.msg="pick your Auto Roll choices once in the game's menu so I can learn them"D(E.msg)else E.replay(k3,E.rec.rules)
if ao(function()return K:GetAttribute("AutoRollRules")==e.ARrules end,4)then D("Auto Roll choices put back")else
E.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"D(E.msg)end end end if bO==E.isOn()or(not bO and not BW)then return end
local hg=bO and E.rec.on or E.rec.off if not hg then local eF=bO and E.rec.off or E.rec.on local r8=eF~=nil for BX=1,eF and eF.n or 0 do
if type(eF.args[BX])=="boolean"then r8=false end end if r8 then hg=eF end end if not hg then E.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bO and"on"or"off")
D(E.msg)return end E.replay(k3,{hg})if ao(function()return E.isOn()==bO end,4)then E.msg=""D(("Auto Roll switched %s%s"):format(bO and"ON"or"OFF",r6 and(" ("..r6 ..")")or""))
else E.msg="Auto Roll did not switch - do it once in the game so I can relearn it"D(E.msg)end end)E.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local BY,BZ=pcall(function()return K.UserId end)return BY and BZ or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local B0,k4=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if B0 and type(k4)=="table"and type(k4 .Pets)=="table"then o.I=k4 end return o.I end function o.order()if o.list then return o.list end
local bP=o.info()if not bP then return{}end local cx={}if type(bP.Order)=="table"and#bP.Order>0 then for Kt,r9 in ipairs(bP.Order)do if bP.Pets[r9]then cx[#cx+1]=r9 end end
else for B1 in pairs(bP.Pets)do cx[#cx+1]=B1 end table.sort(cx,function(B2,B3)return(bP.Pets[B2].price or 0)<(bP.Pets[B3].price or 0)end)
end o.list=cx return cx end function o.nice(r_,k5)local sa=o.info()local sb=sa and sa.Pets[r_]return((k5 and k5~="")and(k5 .." ")or"")..(sb and sb.displayName or tostring(r_))
end function o.data()local hh=K:GetAttribute("PetsData")if type(hh)~="string"then return nil end if hh==o.rawD then return o.lastD end
local B4,eG=pcall(function()return o.HS:JSONDecode(hh)end)eG=(B4 and type(eG)=="table")and eG or nil o.rawD,o.lastD=hh,eG
return eG end function o.pen()return ag:FindFirstChild("PetMeadowSpawns")end function o.srv()return ak:GetServerTimeNow()end
function o.money()local k6=K:FindFirstChild("MoneyValue")if k6 and type(k6 .Value)=="number"then return k6 .Value end
return bk()or 0 end function o.wishes()local sc=o.pen()local sd=sc and sc:GetAttribute("Wishes")local k7,se={},o.srv()
if type(sd)~="string"then return k7 end local B5,sf=pcall(function()return o.HS:JSONDecode(sd)end)if B5 and type(sf)=="table"then
for B6,k8 in pairs(sf)do if type(k8)=="number"and k8>se then k7[B6]=k8-se end end end return k7 end function o.call(...)
local sh=ag:FindFirstChild("Remotes")local sj=sh and sh:FindFirstChild("PetRequest")if not sj then return nil end
local sk=table.pack(...)local cy={}task.spawn(function()cy.ok,cy.v=pcall(function()return sj:InvokeServer(table.unpack(sk,1,sk.n))end)
cy.done=true end)local B7=z()while not cy.done and z()-B7<6 do task.wait(0.05)end if cy.done and cy.ok then return cy.v end
return nil end function o.want(B8)return e.Pets[B8]end function o.closeNaming(k9)local sm=pcall(function()local sl=K:FindFirstChild("PlayerScripts")
local B9=sl and sl:FindFirstChild("Naming",true)require(B9).close()end)ah(0.5)if k9 .Visible then pcall(function()local sn=k9:FindFirstChild("NameBox",true)if sn then sn:ReleaseFocus()end end)
k9 .Visible=false sm=false end return sm end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local so=K:FindFirstChildOfClass("PlayerGui")
local sp=so and so:FindFirstChild("MainGui")local hi=sp and sp:FindFirstChild("PetNameGui")if hi and hi.Visible then
ah(0.4)if hi.Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,hi)break end end ah(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local k_,sq,hj=o.info(),o.pen(),o.data()
if not(k_ and sq and hj)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local eH,la=#(hj.pets or{}),tonumber(hj.maxOwned)or 60
local B_,sr,eI=o.srv(),{},nil for Ku,aY in ipairs(sq:GetChildren())do sr[aY.Name]=true local cz,hk=aY:GetAttribute("Pet"),aY:GetAttribute("Variant")or""
local lb=cz and o.want(cz)if lb and lb.b and k_.Pets[cz]and(not lb.g or hk=="Big")and y.wantMore(cz,hk,hj)and not aY:GetAttribute("A_"..o.uid)
and(tonumber(aY:GetAttribute("ExpiresAt"))or 0)>B_+1 and z()>=(o.tryAt[aY.Name]or 0)then local eJ,ss=o.nice(cz,hk),k_.Pets[cz].price or 0
if eH>=la then eI=("%s is in the pen, but you have %d/%d pets"):format(eJ,eH,la)o.tryAt[aY.Name]=z()+15 elseif o.money()<ss then
eI=("%s is in the pen - need $%s"):format(eJ,av(ss))o.tryAt[aY.Name]=z()+5 else o.tryAt[aY.Name]=z()+8 local bQ=o.call("adopt",aY.Name)
if type(bQ)=="table"and bQ.ok then eH=eH+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local Ca=type(bQ.pet)=="table"and bQ.pet or{}
table.insert(o.recent,{id=tostring(Ca.id or("?"..z())),name=cz,variant=hk,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
D("ADOPTED "..eJ)o.skipNaming()eI="adopted "..eJ else local su=type(bQ)=="table"and tostring(bQ.reason or"no reason given")or"no answer"
D(("adopt %s failed: %s"):format(eJ,su))eI="adopt failed: "..su if type(bQ)=="table"and bQ.bagFull then o.tryAt[aY.Name]=z()+60 end
end end end end for sv in pairs(o.tryAt)do if not sr[sv]then o.tryAt[sv]=nil end end o.buyMsg=eI or("watching the pen (%d/%d pets)"):format(eH,la)
end function o.stacks()local sx=o.pen()local Cb=sx and sx:GetAttribute("WishStacks")local Cc,sy=pcall(function()return o.HS:JSONDecode(Cb)end)
return(Cc and type(sy)=="table")and sy or{}end function o.stackTick(Cd,Ce)local hl=o.info()local sz=(type(hl.Wish)=="table"and tonumber(hl.Wish.maxStacks))or 1
if sz<=1 then return end local Cf=o.stacks()o.stackTry=o.stackTry or{}for Kv,aZ in ipairs(o.order())do local sA=o.want(aZ)
local hm=tonumber(Cf[aZ])or 1 if sA and sA.w and Cd[aZ]and hm<sz and y.wantMore(aZ,"",Ce)and z()>=(o.stackTry[aZ]or 0)then
local Cg,hn=pcall(hl.wishPrice,aZ,hm+1)hn=Cg and tonumber(hn)or((hl.Pets[aZ].price or 0)*2*3^hm)o.stackTry[aZ]=z()+5
if hn<=o.money()*0.01 then local sB=o.call("wish",aZ)if type(sB)=="table"and sB.ok then o.wishN=o.wishN+1 D(("WISH x%d on %s ($%s)"):format(hm+1,o.nice(aZ),av(hn)))
else o.stackTry[aZ]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local ho=o.info()if not(ho and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bR,lc,bS=o.wishes(),0,nil local Ch=(type(ho.Wish)=="table"and ho.Wish.cashShare)or 2 local sC=o.data()for Kw,aF in ipairs(o.order())do
local sD=o.want(aF)if sD and sD.w and y.wantMore(aF,"",sC)then lc=lc+1 if not bR[aF]and z()>=(o.wishTry[aF]or 0)then
local ld=tonumber(K:GetAttribute("PetWishCredits"))or 0 local le=math.floor((ho.Pets[aF].price or 0)*Ch)if ld<=0 and o.money()<le then
o.wishTry[aF]=z()+10 bS=("need $%s to wish for %s"):format(av(le),o.nice(aF))o.wishWhy[aF]=bS else o.wishTry[aF]=z()+3
local Ci=ld>0 and"wishCredit"or"wish"local hp=o.call(Ci,aF)if type(hp)=="table"and hp.ok then o.wishN,o.wishWhy[aF]=o.wishN+1,nil
D(("WISHED for %s (%s)"):format(o.nice(aF),ld>0 and"free wish"or("$"..av(le))))else local lf=type(hp)=="table"and tostring(hp.reason or"no reason given")or"no answer"
if lf:lower():find("already",1,true)then o.wishTry[aF]=z()+2 else D(("wish %s failed: %s"):format(o.nice(aF),lf))bS="wish failed: "..lf end
end end end end end pcall(o.stackTick,bR,sC)if not bS then for Kx,hq in ipairs(o.order())do local sE=o.want(hq)
if sE and sE.w and not bR[hq]and o.wishWhy[hq]then bS=o.wishWhy[hq]break end end end if not bS then local dj={}
for Ky,eK in ipairs(o.order())do local sF=o.want(eK)local sG=tonumber(o.stacks()[eK])or 1 if sF and sF.w and bR[eK]then dj[#dj+1]=("%s%s %dm"):format(o.nice(eK),sG>1 and(" x"..sG)or"",math.ceil(bR[eK]/60))end
end local hr for Kz,hs in ipairs(o.order())do local sH=o.want(hs)if sH and sH.w and bR[hs]and(not hr or bR[hs]<hr)then hr=bR[hs]end
end bS=lc==0 and"no pet has WISH ticked"or(#dj==0 and"running: none yet")or(#dj<=3 and("running: "..table.concat(dj,", ")))
or("%d running, the next one ends in %dm"):format(#dj,math.ceil((hr or 0)/60))end o.wishMsg=bS end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local lg=o.data()return(lg and lg.teams)or{},lg end function A.current(dk)
dk=dk or o.data()if not dk then return""end local sI={}for KA,Cj in ipairs(dk.equipped or{})do sI[tostring(Cj)]=true end
for KB,sJ in ipairs(dk.teams or{})do local sK=sJ.pets or{}local lh=#sK==#(dk.equipped or{})if lh then for KC,Ck in ipairs(sK)do if not sI[tostring(Ck)]then lh=false break end end end
if lh then return sJ.name end end return""end function A.equip(li)local Cl,Cm=A.teams()local lj for Cn,Co in ipairs(Cl)do if Co.name==li then lj=Cn break end end
if not lj then A.msg="no saved team called "..tostring(li)return false end if A.current(Cm)==li then return true end
for KD=1,4 do local sL=o.call("teamEquip",lj)if type(sL)=="table"and sL.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(Cp)local sM=Cp:FindFirstChild("SquishyPlaceHolder")local sN=sM and sM:FindFirstChild("TimerGui")
local sO=sN and sN:FindFirstChildWhichIsA("TextLabel",true)local lk=sO and sO.Text if type(lk)~="string"or lk:find("-",1,true)then return nil end
local ll,sP,sQ=lk:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not ll then return nil end local sR=sQ~=""and(tonumber(ll)*3600+tonumber(sP)*60+tonumber(sQ))or(tonumber(ll)*60+tonumber(sP))
return sR>0 and sR or nil end function A.waxes()local eL={}local sS=c.plot and c.plot:FindFirstChild("WaxStations")
if not sS then return eL end local sT=o.srv()for KE,a_ in ipairs(sS:GetChildren())do local lm=tonumber(a_:GetAttribute("PourEnd"))
local sU=a_:GetAttribute("PourOwner")if a_:GetAttribute("HasSquishy")and a_:GetAttribute("PourId")and(sU==nil or sU==o.uid)then
local ln=A.left(a_)local sV=ln and(sT+ln)or((lm and lm>sT)and lm or nil)if sV then local sW,sX=a_:FindFirstChild("SquishyPlaceHolder"),"?"
if sW then for KF,sY in ipairs(sW:GetChildren())do if sY:IsA("Model")then sX=sY.Name break end end end local Cq=tostring(a_:GetAttribute("Helpers")or"")
local lo=0 for KG in Cq:gmatch("%d+")do lo=lo+1 end eL[#eL+1]={st=a_,ends=sV,sure=ln~=nil,id=a_:GetAttribute("PourId"),name=sX,helps=lo,
long=a_:GetAttribute("PourLong")==true}end end end table.sort(eL,function(Cr,Cs)return Cr.ends<Cs.ends end)return eL
end function A.glazeCount()local sZ=ag:FindFirstChild("Remotes")local s0=sZ and sZ:FindFirstChild("EditStack")
if not s0 then return nil end local Ct,eM=pcall(function()return s0:InvokeServer("State",nil)end)if not(Ct and type(eM)=="table"and type(eM.state)=="table")then return nil end
local lp,lq=0,{}for KH,ht in ipairs(eM.state.entries or{})do if ht.glaze and ht.glaze~=""then lp=lp+1 lq[ht.glaze]=(lq[ht.glaze]or 0)+1 end
end return lp,lq,#(eM.state.entries or{}),eM.state.capacity end function A.finishedOne(hu,s1)A.finished=A.finished+1
task.wait(2)local lr,Cu,s2,Cv=A.glazeCount()if lr and s1 and lr>s1 then A.glazed=A.glazed+1 local ls={}for Cw,Cx in pairs(Cu)do ls[#ls+1]=Cw.." "..Cx end
D(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(am(W(hu.name)),hu.st.Name,lr,table.concat(ls,", ")))
else D(("wax done on station %s: %s, no glaze%s"):format(hu.st.Name,am(W(hu.name)),s2 and(" (stack "..s2 .."/"..tostring(Cv)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cA=o.srv()local aJ=A.glazeFor if aJ then local eN=aJ.st local s3=eN.Parent and eN:GetAttribute("HasSquishy")and eN:GetAttribute("PourId")==aJ.id
local s4=s3 and A.left(eN)if s4 then aJ.ends=cA+s4 end if not s3 then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aJ.id or"?"]then
A.done[aJ.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aJ.id or"?"]=true},1 end local Cy=aJ.before
task.spawn(function()pcall(A.finishedOne,aJ,Cy)end)end elseif aJ.ends-cA>e.GlazeLead*3+60 or cA>aJ.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aJ.id or"?"]=z()+120 D(("station %s is not finishing yet (%s left) - glaze team off again"):format(eN.Name,A.clock(aJ.ends-cA)))
end end if e.TeamGlaze~=""and not A.glazeFor then local Cz=A.speedRatio(e.TeamGlaze)for KI,cB in ipairs(A.list)do
if cB.sure and(cB.ends-cA)*Cz[cB.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cB.id or"?"]or 0)and not A.done[cB.id or"?"]then
A.glazeFor=cB task.spawn(function()cB.before=A.glazeCount()end)break end end end local aK,eO="",""local dl=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cA)
if dl and dl<-8 then q.snapAt,dl=nil,nil end if e.TeamGlaze~=""and dl and dl<=20 then aK,eO=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(dl)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aK,eO=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aK,eO=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aK,eO=e.TeamFull," - every station is busy"else aK=e.TeamNormal end A.want=aK local eP=A.current()A.cur=eP if aK~=""and eP~=aK and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aK)then D("team: "..aK..eO)else A.nextTry=z()+3 end end local lt=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eP~=""and eP or"(not a saved team)",(aK~=""and aK~=eP)and(" -> "..aK)or"",
lt and("in "..A.clock(lt.ends-cA).." (st "..lt.st.Name..")")or"- none running")end function A.clock(bT)bT=math.max(0,math.floor(bT))
if bT>=3600 then return("%d:%02d:%02d"):format(math.floor(bT/3600),math.floor((bT%3600)/60),bT%60)end return("%d:%02d"):format(math.floor(bT/60),bT%60)
end function A.allBusy()local CA,CB=gi()return CB>0 and CA==0 end function A.aboutToPlace()if not c.running then return false end
local s5=ad()if not(s5 and aP(s5))then return false end local CC=gi()return CC>0 end function A.mult(s6,CD,s7)return{(1+s6)*(1+s7),(1+s6+CD)*(1+s7)}end
function A.speedNow()local function lu(CE)return tonumber(K:GetAttribute(CE))or 0 end return A.mult(lu("PetWaxSpeed"),lu("PetLongWax"),lu("PetSocialWax"))
end function A.speedOf(CG)local CH,s8=A.teams()if not s8 then return nil end for KJ,s9 in ipairs(CH)do if s9 .name==CG then
local lv={}for KK,CI in ipairs(s9 .pets or{})do for KL,s_ in ipairs(s8 .pets or{})do if tostring(s_.id)==tostring(CI)then lv[#lv+1]=s_ break end end
end local ta=y.caps()local tb,CJ=y.stats(lv)return A.mult(math.min(tb.waxSpeed or 0,ta.waxSpeed or 0.25),math.min(tb.longWax or 0,ta.longWax or 0.3),CJ.socialWax or 0)
end end return nil end function A.speedRatio(CK)local td,lw=A.speedNow(),A.speedOf(CK)if not lw then return{1,1}end
return{td[1]/lw[1],td[2]/lw[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(CL)local lx=o.info()if lx and type(lx.fuseNeed)=="function"then local CM,ly=pcall(lx.fuseNeed,K,CL or"")
if CM and tonumber(ly)and tonumber(ly)>=2 then return tonumber(ly)end end if K:GetAttribute("FusePass")==true or K:GetAttribute("FusePass4")==true then return 3 end
if K:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(te)
if te=="Huge"then return y.needFor("")*y.needFor("Big")end if te=="Big"then return y.needFor("")end return 1 end
function y.nextOf(tf)return(tf==""and"Big")or(tf=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lz=o.info()return(lz and type(lz.HugeCaps)=="table")and lz.HugeCaps or y.HCAPS end function y.cosmic()local lA=o.info()return(lA and type(lA.CosmicCaps)=="table")and lA.CosmicCaps or{StarWhale=0.1}end
function y.slots()local th=o.data()return tonumber(th and th.slots)or(3+(tonumber(K:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lB=o.info()return(lB and type(lB.Caps)=="table")and lB.Caps or y.CAPS end function y.value(ti,cC)
local hv=o.info()local cD=hv and hv.Pets[ti]if not(cD and type(cD.boost)=="table")then return nil end local cE
if type(hv.boostValue)=="function"then local CN,CO=pcall(hv.boostValue,ti,(cC~=""and cC)or nil)cE=CN and tonumber(CO)or nil
end if not cE then local eQ=cD.boost.value or 0 cE=eQ if cC=="Big"or cC=="Huge"then local tj=eQ*(cC=="Huge"and 1.75 or 1.5)
cE=y.ROUND[cD.boost.kind]and math.max(eQ+(cC=="Huge"and 2 or 1),math.floor(tj+0.5))or tj if cC=="Huge"and y.ROUND[cD.boost.kind]then cE=math.max(cE,math.max(eQ+1,math.floor(eQ*1.5+0.5))+1)end
end end return cD.boost.kind,cE,cD.boost.every end function y.stats(CP)local cF,lC,tk,eR={},{},{},{}local CQ=y.cosmic()
for KM,dm in ipairs(CP)do local aw,eS,tl=y.value(dm.name,dm.variant or"")if aw then if dm.variant=="Huge"then tk[y.CAPKEY[aw]or aw]=true end
if aw:sub(1,6)=="social"then lC[aw]=math.max(lC[aw]or 0,eS)elseif aw=="waxStir"or aw=="cashGift"then cF[aw]=(cF[aw]or 0)+eS*60/(tl or 60)
elseif aw=="luckyPull"then cF.luckyPull=(cF.luckyPull or 0)+eS/(tl or 10)else cF[aw]=(cF[aw]or 0)+eS if CQ[dm.name]then eR[aw]=eR[aw]or{}eR[aw][dm.name]=(eR[aw][dm.name]or 0)+eS end
end end end return cF,lC,tk,eR end function y.glazeGain(CS,hw)local eT,lD,KN={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local CT=eT[1]+eT[2]+eT[3]local CU=tonumber(K:GetAttribute("GuildUpGlaze"))or 0 local dn={}for hx=1,3 do dn[hx]=eT[hx]+CS*eT[hx]/CT+(hx==1 and CU or 0)end
local lE={dn[1]*(1-hw),dn[2]*(1-hw)+dn[1]*hw,dn[3]+dn[2]*hw}return lE[1]*(lD[1]-1)+lE[2]*(lD[2]-1)+lE[3]*(lD[3]-1)
end function y.score(hy,CV)local CW,CX,CY=y.caps(),y.hcaps(),y.cosmic()local hz,hA,CZ,tm=y.stats(CV)local function lF(lG)return(CZ[lG]and CX[lG])or CW[lG]or math.huge end
local function bt(hB)local lH,lI=hz[hB]or 0,lF(hB)local lJ=math.min(lH,lI)if tm[hB]and lH>lI then local lK=0 for C0,C1 in pairs(tm[hB])do lK=lK+math.min(C1,CY[C0]or 0)end
lJ=lJ+math.min(lH-lI,lK)end return lJ end local C2=(1+bt("income"))*(1+(hA.socialIncome or 0))*(1+math.min(hz.cashGift or 0,lF("cashGiftPerMinute"))/60)
local C3=1+bt("luck")+(hz.luckyPull or 0)+(hA.socialLuck or 0)local tn=C3*(1+bt("newFind"))*(1+bt("rollSpeed"))
local eU=math.log(C2)local C4=math.max(tonumber(K:GetAttribute("WaxStations"))or 18,1)local lL=(1+bt("waxSpeed")+bt("longWax"))*(1+(hA.socialWax or 0))
+math.min(hz.waxStir or 0,lF("waxStirPerMinute"))/60/C4 local C5=1-(1-bt("headStart"))*(1-(hA.socialHeadStart or 0))
if hy=="farm"then return eU+0.7*math.log(tn)+0.1*math.log(lL)end if hy=="full"then return eU+0.4*math.log(lL)+0.02*math.log(tn)end
if hy=="glaze"then return y.glazeGain(bt("glaze"),bt("glazeUp"))+0.001*eU end if hy=="wax"then return-math.log(1-0.5*C5)+0.001*eU+0.001*math.log(lL)end
return eU end function y.kinds(C6)local to,lM={},{}for KO,eV in ipairs(C6)do local tp=eV.name.."|"..(eV.variant or"")
local bU=to[tp]if not bU then bU={name=eV.name,variant=eV.variant or"",n=0,ids={}}to[tp]=bU lM[#lM+1]=bU end bU.n=bU.n+1
bU.ids[#bU.ids+1]=eV.id end return lM end function y.bestKinds(tq,bV,C7,tr,ts)local aD,bW={},{}local function lN(C8)
local tt,hC={},{}for C9,lO in ipairs(C8)do tt[C9]=bV[lO]hC[lO]=(hC[lO]or 0)+1 end local eW=y.score(tq,tt)if tr then for C_,Da in pairs(hC)do eW=eW+1e-7*math.min(Da,tr[C_]or 0)end end
if ts then for Db,Dc in pairs(hC)do eW=eW-1e-8*Dc*ts[bV[Db].variant]end end return eW end for KP=1,C7 do local eX,lP
for hD=1,#bV do if(bW[hD]or 0)<bV[hD].n then aD[#aD+1]=hD local tu=lN(aD)aD[#aD]=nil if not lP or tu>lP+1e-12 then eX,lP=hD,tu end
end end if not eX then break end bW[eX]=(bW[eX]or 0)+1 aD[#aD+1]=eX if#bV>40 then task.wait()end end for KQ=1,6 do
task.wait()local tv,tw=false,lN(aD)for lQ=1,#aD do for dp=1,#bV do local hE=aD[lQ]if dp~=hE and(bW[dp]or 0)<bV[dp].n then
aD[lQ]=dp local tx=lN(aD)if tx>tw+1e-9 then bW[hE],bW[dp],tw,tv=bW[hE]-1,(bW[dp]or 0)+1,tx,true else aD[lQ]=hE end
end end end if not tv then break end end local ty={}for Dd,De in ipairs(aD)do ty[Dd]=bV[De]end return aD,y.score(tq,ty)
end function y.best(Df,Dg,Dh,hF)hF=hF or{}local lR=y.kinds(Dg)local lS={}for tz,Di in ipairs(lR)do for KR,Dj in ipairs(Di.ids)do if hF[tostring(Dj)]then lS[tz]=(lS[tz]or 0)+1 end end end
local Dk,Dl=y.bestKinds(Df,lR,Dh,lS)local lT,lU={},{}for KS,Dm in ipairs(Dk)do local tA,eY=lR[Dm],nil for KT,lV in ipairs(tA.ids)do if hF[tostring(lV)]and not lT[lV]then eY=lV break end end
if not eY then for KU,tB in ipairs(tA.ids)do if not lT[tB]then eY=tB break end end end lT[eY]=true lU[#lU+1]=tostring(eY)
end return lU,Dl end function y.dream()local tC=o.info()if not(tC and type(tC.Pets)=="table")then return nil end
local lW=y.slots()local tD=y.needFor("").."|"..y.needFor("Big").."|"..lW.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==tD and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local Ds=pcall(function()local hG={}for KV,Dn in ipairs(o.order())do for KW,Do in ipairs({"","Big","Huge"})do hG[#hG+1]={name=Dn,variant=Do,n=lW,ids={}}end
end local eZ,lX={},{}for KX,hH in ipairs(y.ROLES)do if e[hH[1]]~=""then local Dp,Dq=y.bestKinds(hH[2],hG,lW,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local lY,hI={},{}for KY,tE in ipairs(Dp)do lY[tE]=(lY[tE]or 0)+1 end for Dr,lZ in pairs(lY)do local bX=hG[Dr]
eZ[bX.name]=eZ[bX.name]or{[""]=0,Big=0,Huge=0}eZ[bX.name][bX.variant]=math.max(eZ[bX.name][bX.variant],lZ)hI[#hI+1]=(lZ>1 and(lZ.."x ")or"")..o.nice(bX.name,bX.variant)
end table.sort(hI)lX[#lX+1]={role=hH[2],team=e[hH[1]],names=hI,score=Dq}end end y.dreamT,y.dreamTeams,y.dreamSig=eZ,lX,tD
end)y.dreaming=false if not Ds then y.dreamSig=nil end return y.dreamT end function y.owned(hJ)local tF,l0={},{}
for KZ,Dt in ipairs(hJ and hJ.arriving or{})do tF[tostring(Dt)]=true end for K0,cG in ipairs(hJ and hJ.pets or{})do
if not tF[tostring(cG.id)]then l0[#l0+1]={id=tostring(cG.id),name=cG.name,variant=cG.variant or"",named=cG.named or(cG.nickname and cG.nickname~="")}
end end return l0 end function y.have(tG,Du,Dv)local ba={[""]=0,Big=0,Huge=0}local tH={}for K1,e0 in ipairs(y.owned(Du))do
tH[e0 .id]=true if e0 .name==tG and ba[e0 .variant]then ba[e0 .variant]=ba[e0 .variant]+1 end end if Dv then for K2,dq in ipairs(o.recent or{})do
if dq.name==tG and not tH[dq.id]and z()-dq.at<20 and ba[dq.variant or""]then ba[dq.variant or""]=ba[dq.variant or""]+1 end
end end return ba,ba[""]+ba.Big*y.unit("Big")+ba.Huge*y.unit("Huge")end function y.goal(tI)local tJ=e.Pets[tI]
if tJ and tonumber(tJ.f)==-1 then return nil,0 end local tK=y.dream()local e1=tK and tK[tI]if not e1 then return nil,0 end
return e1,e1[""]+e1 .Big*y.unit("Big")+e1 .Huge*y.unit("Huge")end function y.wantMore(l1,K3,tL)if not tL then return true end
local tM=e.Pets[l1]if tM and tonumber(tM.f)==-1 then return true end local Dw,Dx=y.goal(l1)if not Dw then return true end
local K4,Dy=y.have(l1,tL,true)return Dy<Dx+y.need()end function y.status(e2,tN)if not tN then return nil end local tO=e.Pets[e2]
if tO and tonumber(tO.f)==-1 then return"KEEP: never fused"end local cH,tP=y.goal(e2)if not cH then return y.dream()and"in no best team: bought as ticked"or nil end
local l2,Dz=y.have(e2,tN)local cI={}if cH.Huge>0 then cI[#cI+1]=("Huge %d/%d"):format(l2 .Huge,cH.Huge)end if cH.Big>0 then cI[#cI+1]=("Big %d/%d"):format(l2 .Big,cH.Big)end
if cH[""]>0 then cI[#cI+1]=("plain %d/%d"):format(l2[""],cH[""])end local DA=y.blocked and y.blocked[e2]and(" | "..y.blocked[e2])or""
return("%s | %d/%d copies%s"):format(table.concat(cI," "),math.min(Dz,tP),tP,DA)end function y.wear(l3)local l4={}
for K5,DB in ipairs(l3)do l4[tostring(DB)]=true end for K6=1,3 do local dr=o.data()if not dr then return false end
for K7,tQ in ipairs(dr.equipped or{})do if not l4[tostring(tQ)]then o.call("unequip",tQ)task.wait(0.3)end end
dr=o.data()local tR={}for K8,DC in ipairs(dr.equipped or{})do tR[tostring(DC)]=true end for K9,tS in ipairs(l3)do
if not tR[tostring(tS)]then o.call("equip",tS)task.wait(0.3)end end task.wait(0.4)dr=o.data()local l5,tT=0,true
for K_,DD in ipairs(dr.equipped or{})do l5=l5+1 if not l4[tostring(DD)]then tT=false end end if tT and l5==#l3 then return true end
end return false end function y.saveTeam(tU,tV)if not y.wear(tV)then return false,"could not put the pets on"end
local DE=A.teams()local cJ for DF,DG in ipairs(DE)do if DG.name==tU then cJ=DF break end end local ds if cJ then
ds=o.call("teamSave",cJ)else ds=o.call("teamNew")if type(ds)=="table"and ds.ok and ds.index then cJ=ds.index task.wait(0.3)
o.call("teamRename",{index=cJ,name=tU})end end task.wait(0.4)local l6=o.data()local tW=l6 and l6 .teams and cJ and l6 .teams[cJ]
if not tW then return false,"the game did not save it"end local tX={}for La,DH in ipairs(tW.pets or{})do tX[tostring(DH)]=true end
for Lb,DI in ipairs(tV)do if not tX[tostring(DI)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local DJ=o.srv()for Lc,DK in ipairs(A.list or{})do if DK.ends-DJ<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local e3=o.data()if not e3 then return{}end local tY={}for Ld,DL in ipairs(e3 .arriving or{})do tY[tostring(DL)]=true end
local e4={}for Le,hK in ipairs(e3 .pets or{})do if not tY[tostring(hK.id)]then e4[#e4+1]={id=tostring(hK.id),name=hK.name,variant=hK.variant or""}end
end local tZ={}for Lf,t0 in ipairs(e4)do tZ[t0 .id]=t0 end local t1=tonumber(e3 .slots)or 3 local l7,t2={},{}
for Lg,hL in ipairs(y.ROLES)do local e5=e[hL[1]]if e5~=""and not t2[e5]then t2[e5]=true local l8,e6,t3={},{},false
for Lh,t4 in ipairs(e3 .teams or{})do if t4 .name==e5 then for Li,DM in ipairs(t4 .pets or{})do local l9=tZ[tostring(DM)]
if l9 then l8[l9 .id]=true e6[#e6+1]=l9 else t3=true end end end end local l_,t5=y.best(hL[2],e4,t1,l8)local t6=y.score(hL[2],e6)
local t7=#l_==#e6 for Lj,DN in ipairs(l_)do if not l8[DN]then t7=false end end if not t7 and(t3 or#e6<math.min(t1,#e4)or t5>t6+1e-4)then
l7[#l7+1]={team=e5,role=hL[2],ids=l_,gain=t5-t6}end end end return l7 end function y.rebuild(DO)local t8=y.plan()
if#t8==0 then y.buildMsg="teams are already the best your pets allow"return true end if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end
A.editing,A.editingSince=true,z()local hM=true local DS,DT=pcall(function()for Lk,e7 in ipairs(t8)do local DP,DQ=y.saveTeam(e7 .team,e7 .ids)
local t9=o.data()local ma={}for Ll,DR in ipairs(e7 .ids)do for Lm,mb in ipairs(t9 and t9 .pets or{})do if tostring(mb.id)==DR then ma[#ma+1]=o.nice(mb.name,mb.variant)end
end end if DP then D(("TEAM %s rebuilt (%s): %s"):format(e7 .team,DO or"pets changed",table.concat(ma,", ")))
else hM=false D(("TEAM %s: %s"):format(e7 .team,tostring(DQ)))end end end)A.editing,A.nextTry=false,0 if not DS then hM=false D("TEAM BUILD ERR "..tostring(DT))end
y.builds=y.builds+1 y.buildMsg=hM and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return hM end function y.roleScores(t_)local bY={}for Ln,ua in ipairs(t_)do bY[#bY+1]=ua.name..ua.variant end
table.sort(bY)bY=table.concat(bY,",")y.rsCache=y.rsCache or{}if y.rsCache[bY]then return y.rsCache[bY]end local DU,DV,mc=y.kinds(t_),y.slots(),{}
for Lo,md in ipairs(y.ROLES)do if e[md[1]]~=""then local Lp,DW=y.bestKinds(md[2],DU,DV)mc[md[2]]=DW end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bY]=mc return mc end function y.noLoss(ub,DX,DY,DZ)local uc,e8={},{}
for Lq,D0 in ipairs(DX)do uc[D0]=true end for Lr,ud in ipairs(ub)do if not uc[ud.id]then e8[#e8+1]=ud end end
e8[#e8+1]={id="new",name=DY,variant=DZ}local D1,ue=y.roleScores(ub),y.roleScores(e8)local uf=false for me,ug in pairs(D1)do
if(ue[me]or-math.huge)<ug-1e-6 then return false,me end if(ue[me]or 0)>ug+1e-6 then uf=true end end return true,uf
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local e9=o.data()if not e9 then return end local uh=y.owned(e9)local hN,e_={},{}for Ls,D2 in ipairs(e9 .teams or{})do for Lt,D3 in ipairs(D2 .pets or{})do hN[tostring(D3)]=true end end
for Lu,D4 in ipairs(e9 .equipped or{})do e_[tostring(D4)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for Lv,aL in ipairs(o.order())do
local hO=y.goal(aL)if hO then local mf=y.have(aL,e9)for Lw,bu in ipairs({"Big",""})do local dt,mg=y.nextOf(bu),y.needFor(bu)
local D5=(bu=="Big"and mf.Huge<hO.Huge)or(bu==""and mf.Big<hO.Big+y.needFor("Big")*math.max(0,hO.Huge-mf.Huge))
local fa={}for Lx,mh in ipairs(uh)do if mh.name==aL and mh.variant==bu then fa[#fa+1]=mh end end if D5 and#fa>=mg and z()>=(y.failUntil[aL..bu]or 0)then
table.sort(fa,function(hP,hQ)local ui=(e_[hP.id]and 4 or 0)+(hN[hP.id]and 2 or 0)+(hP.named and 1 or 0)local uj=(e_[hQ.id]and 4 or 0)+(hN[hQ.id]and 2 or 0)+(hQ.named and 1 or 0)
if ui~=uj then return ui<uj end return hP.id<hQ.id end)local cK,mi,uk={},{},false for du=1,mg do cK[du]=fa[du].id
if e_[cK[du]]then mi[#mi+1]=cK[du]end if e_[cK[du]]or hN[cK[du]]then uk=true end end local D6,ul=y.noLoss(uh,cK,aL,dt)
if not D6 then y.blocked[aL]=("%s waits: it would weaken the %s team now"):format(dt,y.ROLENAME[ul]or tostring(ul))
elseif uk and not y.quiet()then y.blocked[aL]=dt.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dt,o.nice(aL))
return else A.editing,A.editingSince=true,z()for Ly,D7 in ipairs(mi)do o.call("unequip",D7)task.wait(0.3)end local hR=o.call("fuse",{ids=cK})
A.editing,A.nextTry=false,0 if type(hR)=="table"and hR.ok then y.fused=y.fused+1 y.dirtyAt=z()D(("FUSED %d %s -> %s"):format(mg,o.nice(aL,bu),o.nice(aL,dt)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aL,dt),os.date("%H:%M"))else y.failUntil[aL..bu]=z()+120 D(("fuse %s failed: %s"):format(o.nice(aL,bu),type(hR)=="table"and tostring(hR.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local um=o.data()if not um then return end local cL={}for Lz,D8 in ipairs(um.pets or{})do cL[#cL+1]=tostring(D8 .id)end
table.sort(cL)cL=table.concat(cL,",")if cL~=y.sig then y.sig,y.dirtyAt=cL,z()end local D9=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if D9 and not A.editing then local D_=y.rebuild(y.dirtyAt and"pets changed"or"check")if D_ then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cM)return cM:IsA("ParticleEmitter")or cM:IsA("Trail")or cM:IsA("Beam")or cM:IsA("Fire")or cM:IsA("Smoke")
or cM:IsA("Sparkles")or cM:IsA("Light")end function d.muteOne(bv)if not e.Lite or not bv.Parent then return end
local hS=(bv:IsA("BillboardGui")and d.bb)or(d.isFx(bv)and d.fx)or nil if not hS or hS[bv]~=nil then return end
if hS==d.fx and d.gameLow and not bv:IsA("Beam")then return end hS[bv]=bv.Enabled if bv.Enabled then bv.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local mj={}for LA,Ea in ipairs({d.bb,d.fx})do for Eb in pairs(Ea)do mj[#mj+1]=Eb end end local uo=os.clock()for Ec,fb in ipairs(mj)do
if e.Lite and fb.Parent and fb.Enabled then local Ed=d.bb[fb]~=nil and d.bb or d.fx Ed[fb]=true fb.Enabled=false
end if Ec%200==0 and os.clock()-uo>0.002 then task.wait()uo=os.clock()end end end function d.lite(up)e.Lite=up
if up then task.spawn(function()for Ee,Ef in ipairs(ak:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Ef)
if Ee%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=V(ak.DescendantAdded:Connect(function(ml)
if e.Lite and(ml:IsA("BillboardGui")or d.isFx(ml))then d.queue[#d.queue+1]=ml end end))end local mm=game:GetService("Lighting")
for LB,fc in ipairs(mm:GetChildren())do if fc:IsA("PostEffect")and fc.Enabled and d.post[fc]==nil then d.post[fc]=true fc.Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and mm.GlobalShadows or d.oldShadows mm.GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ak.Terrain.Decoration or d.oldDeco ak.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for LC,Eg in pairs(d.watch)do pcall(function()Eg:Disconnect()end)end
for uq,Eh in pairs(d.bb)do pcall(function()if uq.Parent then uq.Enabled=Eh end end)end for ur,Ei in pairs(d.fx)do pcall(function()if ur.Parent then ur.Enabled=Ei end end)end
for us in pairs(d.post)do pcall(function()if us.Parent then us.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local Ej=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()Ej.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ak.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(ut)
local Ek,mn=pcall(function()return require(ag:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not Ek or type(mn)~="table"then return end if ut and not d.ceOld then d.ceOld={}for LD,uu in ipairs({"Fireworks","Confetti"})do
local hT=mn[uu]if type(hT)=="table"and type(hT.Play)=="function"then d.ceOld[uu]=hT.Play pcall(function()hT.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not ut and d.ceOld then for El,Em in pairs(d.ceOld)do pcall(function()mn[El].Play=Em end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local mo,hU for LE,fd in ipairs(getgc(false))do if type(fd)=="function"and(type(islclosure)~="function"or islclosure(fd))then
local En,uv,uw=pcall(debug.info,fd,"sn")if En and type(uv)=="string"and uv:find("ToppingCullHandler",1,true)then
if uw=="poll"then mo=fd elseif uw=="retarget"then hU=fd end end end end if not(mo and hU)then return nil end local Eo,hV=pcall(debug.getupvalues,hU)
local ux=Eo and type(hV)=="table"and hV[3]if type(ux)~="function"or debug.info(ux,"n")~="targetFor"or(hV[1]~=nil and type(hV[1])~="number")then return nil end
d.tc={poll=mo,re=hU}return d.tc end function d.tops(uy)local aR=d.topsFind()if not aR then return false end if uy and not aR.old then
local Ep,Eq=pcall(hookfunction,aR.poll,function()end)if not Ep then return false end aR.old=Eq pcall(debug.setupvalue,aR.re,1,-1000)
pcall(aR.re)elseif not uy and aR.old then local Er=type(restorefunction)=="function"and pcall(restorefunction,aR.poll)
if not Er then pcall(hookfunction,aR.poll,aR.old)end aR.old=nil pcall(aR.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(Es)local uz=ak:FindFirstChild("Plots")local uA=os.clock()if Es then for LF,Et in ipairs(uz and uz:GetChildren()or{})do
local uB=Et:FindFirstChild("SkinProps")local uC=uB and uB:FindFirstChild("FairyLights")for LG,uD in ipairs(uC and uC:GetChildren()or{})do
for LH,fe in ipairs(uD:GetChildren())do if fe:IsA("BasePart")and(fe.Name=="Bulb"or fe.Name=="Wire")then d.lit[fe]=uD fe.Parent=nil end
end if os.clock()-uA>0.002 then task.wait()uA=os.clock()end end end for LI,Eu in ipairs({"Leaderboards","ClanBoard"})do
local mp=ak:FindFirstChild(Eu)if mp then d.boardsOff[mp]=true mp.Parent=nil end end else for Ev,uE in pairs(d.lit)do pcall(function()if uE.Parent then Ev.Parent=uE end end)end
for uF in pairs(d.boardsOff)do pcall(function()if not uF.Parent then uF.Parent=ak end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(Ew)if Ew then local uG=ag:FindFirstChild("Remotes")local uH=uG and uG:FindFirstChild("SquishyRollAnimation")
if not uH or type(getconnections)~="function"then return end local Ex,Ey=pcall(getconnections,uH.OnClientEvent)
for LJ,hW in ipairs(Ex and Ey or{})do local mq=""pcall(function()mq=debug.info(hW.Function,"s")end)if type(mq)=="string"and mq:find("SquishyHandler",1,true)and not d.reel[hW]then
if pcall(function()hW:Disable()end)then d.reel[hW]=true end end end else for Ez in pairs(d.reel)do pcall(function()Ez:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(EA)if not EA then for LK,EB in pairs(d.quiet)do pcall(function()EB:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function mr(EC,ED)local EE,EF=pcall(getconnections,EC)
for LL,hX in ipairs(EE and EF or{})do local ms=""pcall(function()ms=debug.info(hX.Function,"s")end)local mt=hX.Function
if mt and type(ms)=="string"and ms:find(ED,1,true)and not d.quiet[mt]then if pcall(function()hX:Disable()end)then d.quiet[mt]=hX end
end end end local uI=ak:FindFirstChild("Plots")for LM,hY in ipairs(uI and uI:GetChildren()or{})do if hY~=c.plot then
mr(hY:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uJ,uK=hY:FindFirstChild("WaxStations"),hY:FindFirstChild("SquishyStack")
if uJ then mr(uJ.DescendantAdded,"LocalToppingsHandler")end if uK then mr(uK.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for uL,EG in pairs(d.lit)do if not EG:IsDescendantOf(game)then d.lit[uL]=nil pcall(function()uL:Destroy()end)end
end end function d.passText()local ax=function(EH)return K:GetAttribute(EH)end local mu={}local function bZ(EI,EJ)mu[#mu+1]=(EI and"[x] "or"[  ] ")..EJ end
bZ(ax("VIP")==true,"VIP: money x1.5, offline +50%")bZ(ax("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(ax("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local EK=ax("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(ax("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bZ(ax("FastWax")==true or ax("SuperFastWax")==true,EK.." (the farm times by the game's own timers)")local uM=(ax("FusePass")==true and"Fuse Pass")or(ax("FusePass4")==true and"Fuse Pass 4")or(ax("FusePass5")==true and"Fuse Pass 5")or nil
bZ(uM~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uM or"Fuse pass",y.needFor(""),y.needFor("Big")))local hZ=o.data()
local EL=tonumber(hZ and hZ.maxOwned)or 60 bZ(ax("PetInventory50")==true or ax("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(hZ and#(hZ.pets or{})or 0,EL,(ax("PetInventory50")==true and ax("PetInventory100")==true)and" (both bag passes)"or""))
local uN=tonumber(ax("PetEquipBought"))or 0 bZ(uN>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uN))
local uO=tonumber(ax("PetWishCredits"))or 0 if uO>0 then bZ(true,("%d free wishes: used before cash"):format(uO))end
local uP=tonumber(ax("FinishAllCredits"))or 0 if uP>0 then bZ(true,("%d finish-all credits (yours to use)"):format(uP))end
return table.concat(mu,"\n")end function d.extras(h0)pcall(d.quietPlots,h0 and c.plot~=nil)pcall(d.fxPatch,h0)
pcall(d.tops,h0)pcall(d.lights,h0)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uQ)
e.HideHud=uQ local mv=K:FindFirstChildOfClass("PlayerGui")if not mv then return end if uQ then for LN,ff in ipairs(mv:GetChildren())do
if ff:IsA("ScreenGui")and not d.MINE[ff.Name]and ff.Enabled then d.hud[ff]=true ff.Enabled=false end end if not d.hudConn then
d.hudConn=V(mv.ChildAdded:Connect(function(fg)if e.HideHud and fg:IsA("ScreenGui")and not d.MINE[fg.Name]then
task.defer(function()if e.HideHud and fg.Enabled then d.hud[fg]=true fg.Enabled=false end end)end end))end else
for uR in pairs(d.hud)do pcall(function()if uR.Parent then uR.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mw)e.FpsCap=mw local uS=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uS then return false end return pcall(uS,mw==0 and 60 or mw)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ap)if ap:IsA("BasePart")or ap:IsA("Decal")or ap:IsA("Texture")then if ap.Transparency<1 then d.unseen[ap]=ap.Transparency ap.Transparency=1 end
elseif ap:IsA("BillboardGui")or ap:IsA("SurfaceGui")or ap:IsA("ParticleEmitter")or ap:IsA("Beam")or ap:IsA("Trail")or ap:IsA("Light")or ap:IsA("Fire")or ap:IsA("Smoke")or ap:IsA("Sparkles")then
if ap.Enabled then d.unseen[ap]=true ap.Enabled=false end end end function d.notMine(EM)return e.HideMine or(c.plot and not EM:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(h1)
local mx=h1 .Parent local my=mx and mx.Name=="SquishyStack"and mx.Parent if my and my~=c.plot and c.plot and my.Parent==c.plot.Parent and not d.dropSeen[h1]then
d.dropSeen[h1]=true d.dropQ[#d.dropQ+1]={h1,z()+3}end end function d.dropScan()local uT=c.plot and c.plot.Parent
if not(e.HideBases and uT)then return end for LO,uU in ipairs(uT:GetChildren())do local uV=uU~=c.plot and uU:FindFirstChild("SquishyStack")
for LP,EN in ipairs(uV and uV:GetChildren()or{})do d.dropIt(EN)end end end function d.dropStep(EO)local mz=d.dropQ
while d.dropI<=#mz and os.clock()-EO<0.003 do local mA=mz[d.dropI]if mA[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mA[1].Parent then pcall(function()mA[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mz then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mB=os.clock()local fh=d.queue if e.Lite and fh and#fh>0 then d.muteI=d.muteI or 1
while d.muteI<=#fh and os.clock()-mB<0.0015 do pcall(d.muteOne,fh[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#fh then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mB)end local h2=d.hideQ if d.hideI>#h2 then return end while d.hideI<=#h2 and os.clock()-mB<0.004 do
local mC=h2[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mC.Parent and d.notMine(mC)then pcall(d.hideOne,mC)end
end if d.hideI>#h2 then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(uW)if e.HideBases then d.bases(false)end
e.HideMine=uW==2 if uW>0 then d.bases(true)end end function d.bases(uX)e.HideBases=uX local mD=ak:FindFirstChild("Plots")
if not mD then return end if uX then task.spawn(function()local mE=0 for LQ,h3 in ipairs(mD:GetChildren())do local uY=h3~=c.plot and c.plot and h3:FindFirstChild("SquishyStack")
for LR,EP in ipairs(uY and uY:GetChildren()or{})do d.dropIt(EP)end if h3~=c.plot or e.HideMine then for LS,EQ in ipairs(h3:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,EQ)mE=mE+1 if mE%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=V(mD.DescendantAdded:Connect(function(dv)if e.HideBases and d.notMine(dv)then
pcall(d.hideOne,dv)d.hideQ[#d.hideQ+1]=dv if dv.Parent and dv.Parent.Name=="SquishyStack"then d.dropIt(dv)end
end end))end else for mF,uZ in pairs(d.unseen)do pcall(function()if not mF.Parent then return end if type(uZ)=="number"then mF.Transparency=uZ else mF.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(u0)e.NoRender=u0 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not u0)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local ER=game:GetService("RunService")local mG=0 for LT,ES in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local ET,u1=pcall(function()return ER[ES]end)local u2,mH=false,nil if ET and u1 then u2,mH=pcall(getconnections,u1)end
if u2 and type(mH)=="table"then for LU,h4 in ipairs(mH)do local mI=""pcall(function()local u3=getfenv(h4 .Function).script mI=u3 and u3:GetFullName()or""end)
if mI~=""then for LV,EU in ipairs(d.CALM)do if mI:find(EU,1,true)then local mJ=h4 .Function if mJ and not d.calmedF[mJ]and pcall(function()h4:Disable()end)then
d.calmedF[mJ]=true d.calmed[#d.calmed+1]=h4 mG=mG+1 end break end end end end end end if#d.calmed>200 then local mK={}for EW=#d.calmed-49,#d.calmed do mK[#mK+1]=d.calmed[EW]end d.calmed=mK
end return mG end function d.walker()local EX,mL=pcall(function()return require(K.PlayerScripts.LocalScript.PetHandler.Walker)end)
return(EX and type(mL)=="table"and type(mL.walkTo)=="function")and mL or nil end function d.walkers(EY)local u4={}
local EZ,E0=pcall(debug.getupvalues,EY.destroy)for LW,u5 in ipairs(EZ and E0 or{})do if type(u5)=="table"then
for h5 in pairs(u5)do if type(h5)=="table"and rawget(h5,"model")~=nil and rawget(h5,"position")~=nil then u4[h5]=true end end
end end return u4 end function d.walkPatch(u6)local fi=d.walker()if not fi then return 0 end if u6 and not d.wkOld then
local u7=fi.walkTo d.wkOld=u7 fi.walkTo=function(fj,fk,E1,mM)local E2=fk~=nil and pcall(function()return fk.X+fk.Z end)
if not e.Calm or not E2 then return u7(fj,fk,E1,mM)end fj.target,fj.onArrive=nil,nil pcall(function()fj:teleport(fk)fj:render(0)end)
if mM then task.spawn(mM)end end elseif not u6 then if d.wkOld then fi.walkTo,d.wkOld=d.wkOld,nil end return 0
end local mN=0 for aM in pairs(d.walkers(fi))do if aM.target and not aM.destroyed then local u8=aM.model and aM.model:FindFirstChild("Body")and aM.model.Body:FindFirstChild("PetBillboard")
local u9=u8 and u8:FindFirstChild("TimerLabel",true)if u9 and tostring(u9 .Text):find("'s plot!",1,true)then pcall(function()aM:destroy()end)
pcall(function()aM.model:Destroy()end)else local E3,u_=aM.target,aM.onArrive aM.target,aM.onArrive=nil,nil pcall(function()aM:teleport(E3)aM:render(0)end)
if u_ then task.spawn(u_)end end mN=mN+1 end end return mN end function d.calm(va)e.Calm=va if va then local E4=d.calmScan()
local mO=0 pcall(function()mO=d.walkPatch(true)end)D(("NO ANIMATIONS: %d of the game's animation loops switched off%s"):format(E4,mO>0 and(", "..mO.." stuck pet walks cleared")or""))
else for LX,E5 in ipairs(d.calmed)do pcall(function()E5:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
pcall(d.walkPatch,false)end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end
if J.arPaused then pcall(J.resume,"script stopped")end pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(vb)if c.rejoining then return end D("REJOIN this server ("..vb..")")
pcall(gl)if c.autoload then pcall(ed,c.autoload)end qq()local E6=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,K)
end)task.delay(25,function()if c.alive then ee(vb..", same server failed")end end)return E6 end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=K:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local vc=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if vc then for LY,E7 in ipairs(vc:GetChildren())do local vd=E7:FindFirstChild("SquishyPlaceHolder")local cN=vd and vd:FindFirstChild("TimerGui")
if cN and cN:IsA("BillboardGui")then if d.bb[cN]==nil then pcall(d.muteOne,cN)elseif cN.Enabled then d.bb[cN]=true cN.Enabled=false end
end end end local E8,dw=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if E8 and type(dw)=="number"then
d.mem=dw d.memPeak=math.max(d.memPeak,dw)if(e.MemLimit or 0)>0 and dw>e.MemLimit then d.over=(d.over or 0)+((dw>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dw,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()D(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mP(h6)if type(h6)~="string"then return false end
h6=h6:lower()for LZ,E9 in ipairs(c.sellWords)do if h6:find(E9,1,true)then return true end end return false end
local function E_()local ve=ag:FindFirstChild("Remotes")local mQ=ve and ve:FindFirstChild("SellSquishy")if not(mQ and mQ:IsA("RemoteEvent"))then return false end
if not pcall(function()mQ:FireServer()end)then return false end return ao(function()return ad()==nil end,1.5)
end local function Fa()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local vf=aq()local vg=vf and vf.HumanoidRootPart.Position local fl,vh for L0,dx in ipairs((c.plot or ak):GetDescendants())do
if dx:IsA("ProximityPrompt")and(mP(dx.ActionText)or mP(dx.ObjectText)or mP(dx.Name))then local vi=pm(dx)local mR=(vi and vg)and(vi-vg).Magnitude or 1e9
if mR<=400 and(not fl or mR<vh)then fl,vh=dx,mR end end end c.sellSpot=fl c.noSellSpot=(fl==nil)return fl end
local function vj()local h7=ad()if not h7 then c.holding=false return false end if aP(h7)then return false end
if q.isLimited(h7)then return false end local mS=am(W(h7))if E_()then c.sold,c.holding,c.sellFails=c.sold+1,false,0
c.carryBlind,c.attrStale=z()+2.5,0 D("SOLD "..mS)return true end local dy=Fa()if dy then local vk=d2(dy)if vk then
cq(vk,dy)local vl=ad()if vl and not aP(vl)then local Fb,Fc=ek(dy,function()return ad()==nil end,function()return dy.Enabled end)
if Fb then c.sold,c.holding,c.sellFails=c.sold+1,false,0 D(("SOLD %s at %s via %s"):format(mS,gg(dy),Fc))return true
end end end end c.sellFails=c.sellFails+1 D("could not sell "..mS.." ("..c.sellFails..")")return false end local Fd={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Fe(dz)local h8=gg(dz):lower()for L1,Ff in ipairs(Fd)do if h8:find(Ff,1,true)then return 0 end end
local bc,as=dz.Name:lower(),0 local function a0(Fg,Fh)return Fg:find(Fh,1,true)~=nil end if a0(bc,"collect")then as=as+60 end
if a0(bc,"cash")or a0(bc,"money")then as=as+45 end if a0(bc,"income")or a0(bc,"claim")then as=as+35 end if a0(bc,"coin")or a0(bc,"earn")or a0(bc,"green")then as=as+20 end
if bc=="pad"or bc=="touch"then as=as+25 end if as==0 and(a0(h8,"collect")or a0(h8,"cash")or a0(h8,"money"))then as=25 end
if as==0 then return 0 end local fm=dz.Color if fm.G>0.5 and fm.G>fm.R*1.4 and fm.G>fm.B*1.4 then as=as+15 end
if math.min(dz.Size.X,dz.Size.Y,dz.Size.Z)<2 then as=as+5 end return as end local function Fi()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local h9,fn,mT={},nil,29 for L2,h_ in ipairs(c.plot:GetDescendants())do
if h_:IsA("BasePart")then local ia=Fe(h_)if ia>0 then h9[#h9+1]={s=ia,p=h_}if ia>mT then fn,mT=h_,ia end end end
end table.sort(h9,function(Fj,Fk)return Fj.s>Fk.s end)c.padCands,c.padPart=h9,fn if fn then D("collect pad: "..gg(fn).." (score "..mT..")")end
return fn end local mU="SAB_pad_v1.txt"local function Fl(Fm)if type(writefile)=="function"then pcall(writefile,mU,table.concat({Fm:GetComponents()},","))end
end local function Fn()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Fo,vm=pcall(function()if isfile(mU)then return readfile(mU)end end)
if not Fo or type(vm)~="string"then return nil end local ib={}for Fp in vm:gmatch("[^,]+")do ib[#ib+1]=tonumber(Fp)end
if#ib==12 then return CFrame.new(unpack(ib))end end local function Fq(mV,ic,Fr)local Fs=db(mV)local mW=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local a1=(mW and mW:IsA("BasePart"))and(mW.Position-ic)or Vector3 .new(1,0,0)a1=Vector3 .new(a1 .X,0,a1 .Z)if a1 .Magnitude<0.05 then a1=Vector3 .new(1,0,0)end
a1=a1 .Unit for Ft=0,7 do local ie=Ft*math.pi/4 local Fu=Vector3 .new(a1 .X*math.cos(ie)-a1 .Z*math.sin(ie),0,a1 .X*math.sin(ie)+a1 .Z*math.cos(ie))
local ig=ic+Fu*(Fr+5)local mX=gV(ig.X,ic.Y,ig.Z)if mX and math.abs(mX.Y-ic.Y)<8 then aE(mV,Vector3 .new(ig.X,mX.Y+Fs,ig.Z))
if km(mV,0.7)then return true end end end return false end local function Fv()c.lastCollect=z()local fo=aq()if not fo then return end
local vn,Fw=fo.HumanoidRootPart,db(fo)local fp,vo,fq,mY=nil,4,nil,"?"local mZ=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and mZ and mZ:IsA("BasePart")then fp,mY=(mZ.CFrame*c.manualPad).Position,"manual pad"else local bw=Fi()
if bw then fp=Vector3 .new(bw.Position.X,bw.Position.Y+bw.Size.Y/2+Fw,bw.Position.Z)vo,fq,mY=math.max(bw.Size.X,bw.Size.Z)/2,bw,bw.Name
end end if not fp then D("COLLECT: pad not found - stand on it and tap SET PAD")return end local m0=bk()aE(fo,fp)
if fq and type(firetouchinterest)=="function"then pcall(firetouchinterest,vn,fq,0)end ah(e.PadDwell)if fq and type(firetouchinterest)=="function"then pcall(firetouchinterest,vn,fq,1)end
ah(0.5)c.collected=c.collected+1 local m1=bk()D(("COLLECTED (%s) %s"):format(mY,(m0 and m1 and m1>m0)and("+$"..av(m1-m0))or"no cash change seen"))
Fq(fo,fp,vo)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.isLimited(vp)if type(vp)~="string"then return false end
local vq=W(vp)if ae.rar[vq]=="Limited"then return true end pcall(q.mods)for Fx,vr in pairs(q.si or{})do if type(vr)=="table"and vr.rarity=="Limited"and W(Fx)==vq then return true end
end return false end function q.limitedHere()local m2=e.MainAccount return type(m2)~="string"or m2==""or m2:lower()==K.Name:lower()
end function q.mods()if q.si and z()-q.modAt<120 then return true end local vs=ag:FindFirstChild("Modules")if not vs then return false end
local function m3(Fy)local vt=vs:FindFirstChild(Fy)if not vt then return nil end local Fz,vu=pcall(require,vt)
return(Fz and type(vu)=="table")and vu or nil end q.si,q.arm,q.ci=m3("SquishyInfo"),m3("AutoRollRules"),m3("CrateInfo")
q.modAt=z()if not q.si then return false end local m4={}if q.arm and type(q.arm.tierOf)=="table"then for m5 in pairs(q.arm.tierOf)do
local ih=q.si[m5]if type(ih)=="table"and ih.rarity~="Limited"and not ih.incomeType and not ih.hiddenAfter then m4[W(m5)]=m5 end
end end q.roll=m4 local ii={}for FA,FB in pairs(m4)do local fr=q.si[FB]if type(fr)=="table"and type(fr.income)=="number"and not fr.incomeType then
ii[#ii+1]={k=FA,inc=fr.income,pr=tonumber(fr.price)or 0}end end table.sort(ii,function(m6,m7)if m6 .inc~=m7 .inc then return m6 .inc>m7 .inc end return m6 .pr>m7 .pr end)
q.order=ii local ij,m8,m9 local FC=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for FD,m_ in pairs(FC)do
local na=type(m_)=="table"and tonumber(m_.price)if na and(not m8 or na>m8)then ij,m8,m9=FD,na,m_.title end end
q.bestCrate,q.bestCrateName=ij and M.key(ij),ij q.bestCrateTitle=m9 and M.key(m9)or nil return true end function q.rank(FE)
local FF,FG=pcall(function()return q.arm.rankOf(FE)end)return(FF and tonumber(FG))or 0 end function q.loadDisc(vv)
if type(vv)~="table"then return end local vw={}for FH,FI in pairs(vv)do if FI then vw[W(tostring(FH))]=true end end
q.disc,q.discAt=vw,z()end function q.fetch()q.discAt=z()local vx=ag:FindFirstChild("Remotes")local vy=vx and vx:FindFirstChild("GetSquishiesDiscovered")
if not vy then return end local FJ,FK=pcall(function()return vy:InvokeServer()end)if FJ then q.loadDisc(FK)end
end function q.scanWax()local nb={}local vz=c.plot and c.plot:FindFirstChild("WaxStations")if vz then for L3,vA in ipairs(vz:GetChildren())do
local vB=vA:FindFirstChild("SquishyPlaceHolder")if vB and vA:GetAttribute("HasSquishy")then for L4,vC in ipairs(vB:GetChildren())do if vC:IsA("Model")then nb[W(vC.Name)]=true end end
end end end for vD,FL in pairs(q.placedAt)do if z()-FL<20 then nb[vD]=true else q.placedAt[vD]=nil end end q.waxing=nb
end function q.compute()local vE,nc,nd={},0,0 if q.disc then for ne in pairs(q.roll or{})do if not q.disc[ne]then
if q.waxing[ne]then nd=nd+1 else vE[ne],nc=true,nc+1 end end end end q.need,q.nNeed,q.nWax=vE,nc,nd local vF,nf={},e.Best or 0
local ng=(nf==4)and q.stackMin or nil for FM,vG in ipairs(q.order)do if(ng and vG.inc>ng)or(not ng and FM<=(nf==4 and 1 or nf))then vF[vG.k]=true end
end q.best=vF end function q.readStack()q.stackAt=z()local vH=ag:FindFirstChild("Remotes")local vI=vH and vH:FindFirstChild("EditStack")
if not vI then return end local FN,dA=pcall(function()return vI:InvokeServer("State",nil)end)if not(FN and type(dA)=="table"and type(dA.state)=="table"and type(dA.state.entries)=="table")then return end
local ik for L5,vJ in ipairs(dA.state.entries)do local fs=type(vJ)=="table"and q.si and q.si[tostring(vJ.name)]
if type(fs)=="table"and type(fs.income)=="number"and not fs.incomeType and(not ik or fs.income<ik)then ik=fs.income end
end q.stackMin=ik q.stackFull=#dA.state.entries>=(tonumber(dA.state.capacity)or 100)end function q.want(nh)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[nh]then return true end elseif e.Targets[nh]then return true end return e.AutoIndex==true and q.need[nh]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(FO)local ft=W(FO)q.placedAt[ft],q.waxing[ft]=z(),true if q.need[ft]then q.need[ft],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
D(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(am(ft)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fu,fv={},{}for FP,FQ in pairs(q.roll or{})do if q.want(FP)then fu[FQ]=true end end
for vK,ni in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if M.wanted(vK)or(type(ni)=="table"and type(ni.title)=="string"and M.wanted(ni.title))then fv[vK]=true end
end if not next(fu)and not next(fv)then return nil end if q.arm and type(q.arm.encode)=="function"then local FR,vL=pcall(q.arm.encode,{rarities={},butters=fu,crates=fv,index=false})
if FR and type(vL)=="string"then return vL end end local function vM(FS)local il={}for FV in pairs(FS)do il[#il+1]=FV end table.sort(il)return table.concat(il,",")end
local fw="adv:"if next(fu)then fw=fw..";butters:"..vM(fu)end if next(fv)then fw=fw..";crates:"..vM(fv)end return fw
end function q.canon(FW)local im={}for vN in tostring(FW or""):gmatch("[^;]+")do local nj,vO=vN:match("^(%a+):(.*)$")
if not nj then nj,vO="r",vN:gsub("^adv:","")end for FX in vO:gmatch("[^,]+")do im[#im+1]=nj.."="..FX end end table.sort(im)
return table.concat(im,"|")end function q.sync(FY)if K:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cO=q.rulesNow()if not cO or#cO>1900 then return end if q.canon(K:GetAttribute("AutoRollRules"))==q.canon(cO)then q.fails=0 return end
if not FY and z()-q.sentAt<4 then return end local vP=ag:FindFirstChild("Remotes")local vQ=vP and vP:FindFirstChild("AutoRollAction")
if not vQ then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 D("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()E.replaying=true pcall(function()vQ:FireServer("Rules",cO)end)E.replaying=false e.ARrules=cO
local io,ip=0,0 for L6 in(cO:match("butters:([^;]*)")or""):gmatch("[^,]+")do io=io+1 end for L7 in(cO:match("crates:([^;]*)")or""):gmatch("[^,]+")do ip=ip+1 end
local vR=io.."/"..ip if q.told~=vR then q.told=vR D(("auto roll now stops on %d butters and %d crates"):format(io,ip))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aS={}if e.AutoIndex then aS[#aS+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fy=0 for L8 in pairs(q.best)do fy=fy+1 end
aS[#aS+1]=fy==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fy,fy==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aS[#aS+1]="best: "..am(q.order[1].k)end if e.BestCrate and q.bestCrateName then aS[#aS+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if P.got>0 then aS[#aS+1]="shower: "..P.got end q.msg=#aS>0 and table.concat(aS," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(FZ)q.feed[#q.feed+1]=os.date("%H:%M ")..FZ if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vS,az,iq)if vS~="Effect"then q.feedAdd(tostring(vS)..(az~=nil and(": "..tostring(az):sub(1,80))or""))
return end if az~="ShowerTaken"and az~="GoalPoint"then q.feedAdd(tostring(az))end if az=="Shower"then P.add(iq)return end
if az=="ShowerTaken"then P.gone(iq)return end if az=="ShowerClear"then P.drops={}return end if az=="WaxGlow"then
local nk=type(iq)=="table"and tonumber(iq.SnapAt)if nk then q.snapAt=nk D(("ADMIN: every wax finishes in %ds%s"):format(math.floor(nk-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end az=tostring(az)cm("Admin "..az)if az~="GoalPoint"and z()-(q.heard[az]or-100)>30 then q.heard[az]=z()
D("ADMIN: "..az)end end P.drops,P.tried,P.got,P.miss={},{},0,0 function P.add(nl)if type(nl)~="table"or type(nl.Pieces)~="table"then return end
for L9,a2 in pairs(nl.Pieces)do if type(a2)=="table"and a2 .Id~=nil and a2 .Position~=nil then P.drops[a2 .Id]={id=a2 .Id,butter=tostring(a2 .Butter or"?"),rar=tostring(a2 .Rarity or"?"),star=a2 .Star==true,
pos=a2 .Position,opens=tonumber(a2 .OpensAt)or 0,ends=tonumber(a2 .ExpiresAt)or 0}end end end function P.gone(fz)
if type(fz)~="table"or fz.Id==nil then return end P.drops[fz.Id]=nil if tonumber(fz.UserId)==o.uid then P.mine=fz.Id end
end function P.pick()local nm=o.srv()local nn,vT for vU,cP in pairs(P.drops)do if nm>=cP.ends-0.3 then P.drops[vU]=nil
elseif nm>=cP.opens-0.2 and(P.tried[vU]or 0)<3 then local vV=(aP(cP.butter)and 1e6 or 0)+(cP.star and 1e5 or 0)+q.rank(cP.rar)*100-(cP.ends-nm)
if not nn or vV>vT then nn,vT=cP,vV end end end return nn end function P.due()return e.Shower and c.running and next(P.drops)~=nil and not ad()and P.pick()~=nil
end function P.grab()local aT,no=P.pick(),aq()if not(aT and no)then return end P.tried[aT.id]=(P.tried[aT.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aE(no,aT.pos+Vector3 .new(0,db(no)+0.5,0))ao(function()return P.mine==aT.id or ad()~=nil or not P.drops[aT.id]end,1.5)
if P.mine==aT.id or ad()then P.got,P.drops[aT.id]=P.got+1,nil D(("GRABBED %s [%s]%s from the admin shower"):format(am(W(aT.butter)),aT.rar,aT.star and" (star)"or""))
elseif not P.drops[aT.id]then P.miss=P.miss+1 end end local fA local function vW()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 D("trying again after being stopped for 5 minutes")fA(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not aq()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bF(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local np,vX=gi()
local dB=ad()if dB then local b0=am(W(dB))if q.isLimited(dB)and not q.limitedHere()then return nil,("holding %s - Limited butters go to %s, never waxed or sold here"):format(b0,e.MainAccount),"wait"
end if not aP(dB)and not q.isLimited(dB)then local nq=(ab.gift and W(ab.gift)==W(dB)and z()-ab.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(b0,nq),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(b0,nq),"bad"end return"sell",("selling %s (%s)"):format(b0,nq),"warn"
end if e.NoWax then return nil,("holding %s - no waxing on this account (it is given away)"):format(b0),"wait"end
if np<1 then return nil,("holding %s - 0 free stations"):format(b0),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(b0),"wait"end
return"place",("waxing %s (%d free)"):format(b0,np),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local nr=c.plot:FindFirstChild("CrateStand")if nr then for L_,fB in ipairs(nr:GetDescendants())do
if fB:IsA("ProximityPrompt")and fB.Enabled and kD(fB)then local bx=fB.ObjectText if bx==""then bx=c5(nr,"TitleLabel")or""end
if bx~=""and M.wanted(bx)then local F0=ge(bx):gsub("crate$","")local vY for vZ in pairs(ae.members)do if ge(vZ)==F0 then vY=vZ end end
j.waiting,j.at,j.title,j.prompt=true,z(),bx,fB j.data={name=(bx:gsub("%s","")),rarity=vY,title=bx}D(bx.." found waiting on your stand")
end break end end end end local v0=M.wanted(j.data and j.data.name)or M.wanted(j.title)if e.Crates and(j.on or j.waiting)and v0 then
local a3=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a3),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 D("could not press the "..a3 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a3),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a3),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a3,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a3),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a3,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a3,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil D("trying the "..a3 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a3),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a3,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not v0 then local v1=j.title..tostring(j.rolledAt)if j.told~=v1 then j.told=v1 D(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and M.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if np<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(vX,vX),"wait"
end local ns=pB()if not ns then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dC=ck()
if dC and qZ(dC.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dC.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dC.name),"bad"end if not ri()then return nil,("%s rolled - waiting for it to land on the stand"):format(dC.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dC.name),"ok"end local b1=kk()if b1 .state~="match"then
c.matchSince=nil if b1 .state=="skip"and not ns.Enabled then return nil,b1 .text.." (sold out)","idle"end return nil,b1 .text,b1 .level
end if not ns.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local dD=z()if dD<c.noCashUntil then
local v2,F1=cl()if v2 then return nil,("cash short: have $%s, price ~$%s"):format(av(v2),av(F1)),"bad"end return nil,(cl()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
av(bk()),math.ceil(c.noCashUntil-dD)),cl()and"bad"or"wait"end if dD-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
do local v3,v4=cl()if v3 then c.noCashUntil=dD+8 return nil,("cash short: have $%s, price %s - not buying"):format(av(v3),v4==math.huge and"unreadable"or("~$"..av(v4))),"bad"
end end c.matchSince=c.matchSince or dD local v5=dD-c.matchSince if v5<e.Confirm then return nil,("confirming %s (%.2fs)"):format(b1 .shown,v5),"ok"end
return"buy",("buying %s via %s"):format(b1 .shown,b1 .src),"ok"end d.DEPTH=11 function d.pinTick()local v6=d.hold
if not v6 then return end local nt=K.Character local nu=nt and nt:FindFirstChild("HumanoidRootPart")if not nu then return end
nu.CFrame=v6 nu.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Ma,ir in ipairs(nt:GetChildren())do if ir:IsA("BasePart")and ir.CanCollide then d.noclip[ir]=true ir.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(F2,v7)d.hold=F2 if v7 then d.surface=v7 end end function d.unpin(F3)
if not d.hold then return end d.hold=nil for v8 in pairs(d.noclip)do pcall(function()if v8 .Parent then v8 .CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local v9=aq()if v9 and d.surface and not F3 then aE(v9,d.surface.Position,d.surface.Position+d.surface.LookVector)
ah(0.1)end end function d.home()local by,v_=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),aq()
if not(by and by:IsA("BasePart")and v_)then return nil end local wa=pp()or by.Position local is=Vector3 .new(wa.X-by.Position.X,0,wa.Z-by.Position.Z)
is=is.Magnitude>0.1 and is.Unit or Vector3 .new(0,0,1)local it=by.Position+is*6 local wb=gV(it.X,by.Position.Y,it.Z,{by})
return CFrame.new(it.X,(wb and wb.Y or by.Position.Y)+db(v_),it.Z)end function d.ground(F4,wc,F5)local nv,nw={K.Character},nil
for Mb=1,12 do local nx=RaycastParams.new()nx.FilterType=Enum.RaycastFilterType.Exclude nx.FilterDescendantsInstances=nv
local iu=ak:Raycast(Vector3 .new(F4,wc,F5),Vector3 .new(0,-2000,0),nx)if not iu then break end nw,wc=iu,iu.Position.Y-0.05
nv[#nv+1]=iu.Instance end return nw and nw.Position.Y end function d.parkHome()local ny=d.home()if not ny then return false end
local dE=ny.Position local F6=d.ground(dE.X,dE.Y+300,dE.Z)or(dE.Y-3)d.pin(CFrame.new(dE.X,F6-8,dE.Z),ny)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(iv)e.Ghost,e.GhostHelps=iv==2,iv==1 if iv<2 then task.spawn(function()while c.busy do ah(0.1)end
if d.ghostMode()<2 and d.hold and not F.home then pcall(d.unpin)end end)end d.paintGhost()D("ghost: "..d.GHOST[iv][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local F7=aq()if not F7 or H.seat()then return end d.parkHome()end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.uid()local F8,F9=pcall(function()return K.UserId end)return F8 and F9 or 0 end function H.seat()local wd=ak:FindFirstChild("NightSeats")
if wd then for Mc,nz in ipairs(wd:GetChildren())do if nz.Name=="LogSeat"and nz:GetAttribute("Occupant")==H.uid()then return nz end
end end local we=K.Character local wf=we and we:FindFirstChildOfClass("Humanoid")local nA=wf and wf.SeatPart return(nA and nA.Name=="LogSeat")and nA or nil
end function H.logs()local wg=ak:FindFirstChild("NightSeats")local nB,nC={},{}for Md,cQ in ipairs(wg and wg:GetChildren()or{})do
local nD=cQ.Name=="LogSeat"and cQ:FindFirstChildOfClass("ProximityPrompt")if nD then nB[#nB+1]=cQ local nE=cQ:GetAttribute("Occupant")
local F_=(nE~=nil and nE~=0 and nE~="")or(cQ:IsA("Seat")and cQ.Occupant~=nil)if not F_ and nD.Enabled then nC[#nC+1]={st=cQ,p=nD}end
end end return nB,nC end function H.due()if not(e.Campfire and c.running)or z()<H.nextAt then return false end
local Ga=ak:FindFirstChild("NightSeats")if not Ga then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire now (weather events)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or z()H.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(K:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
D(H.msg)return false end end return true end function H.sit()local Gb,fC=ak:FindFirstChild("NightSeats"),aq()
if not Gb or not fC then return end local iw,fD=H.logs()if#iw==0 then local Gc=ak:FindFirstChild("NightCampfire")
local Gd,nF=pcall(function()return Gc:GetPivot().Position end)if not Gd then H.nextAt,H.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()K:RequestStreamAroundAsync(nF,3)end)aE(fC,nF+Vector3 .new(0,3,9),nF)ao(function()iw,fD=H.logs()return#iw>0 end,6)
if#iw==0 then H.nextAt,H.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local wh=fC.HumanoidRootPart.Position
if#fD==0 then H.nextAt,H.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fD,function(Ge,Gf)return(Ge.st.Position-wh).Magnitude<(Gf.st.Position-wh).Magnitude end)
local nG,Gg=fD[1].st,fD[1].p d.unpin(true)local dF=nG:IsA("BasePart")and nG.CFrame or CFrame.new(nG:GetPivot().Position)
aE(fC,dF.Position+dF.LookVector*2+Vector3 .new(0,2.5,0),dF.Position)ah(0.25)local Gh=ek(Gg,function()return H.seat()~=nil end)
if not Gh then aE(fC,dF.Position+Vector3 .new(0,2,0),dF.Position+dF.LookVector)ao(function()return H.seat()~=nil end,1.5)
end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,z()D(("SAT at the campfire (+%s%% cash)"):format(tostring(K:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=z()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then D(H.msg)end end end J.msg,J.nextAt,J.at,J.pulls,J.claims,J.pullLeft,J.collectLeft,J.events="",0,0,0,0,0,0,{}
function J.refresh()J.at=z()local nH=ag:FindFirstChild("Remotes")if not nH then return end local fE,nI,dG=0,0,{}
local Gi,wi=pcall(function()return nH.ClanRequest:InvokeServer("state")end)local wj=Gi and type(wi)=="table"and wi.tasks
for Me,b2 in ipairs(wj and wj.list or{})do if not b2 .done and b2 .kind=="pull"then fE=math.max(fE,(b2 .goal or 0)-(b2 .progress or 0))end
if not b2 .done then dG[#dG+1]=("%s %d/%d"):format(tostring(b2 .text),b2 .progress or 0,b2 .goal or 0)end end
J.events={}for Mf,dH in ipairs(nH:GetChildren())do if dH:IsA("RemoteFunction")and dH.Name:match("^%u%a+Action$")and dH.Name~="CrateAction"and dH.Name~="AutoRollAction"then
local Gj,fF=pcall(function()return dH:InvokeServer("state")end)if Gj and type(fF)=="table"and fF.live==true and type(fF.quests)=="table"then
J.events[#J.events+1]={r=dH,st=fF}for Mg,aU in ipairs(fF.quests)do if not aU.done and aU.kind=="pull"then fE=math.max(fE,(aU.goal or 0)-(aU.progress or 0))end
if not aU.done and aU.kind=="collect"then nI=math.max(nI,(aU.goal or 0)-(aU.progress or 0))end if not aU.done then dG[#dG+1]=("%s %d/%d"):format(tostring(aU.text),aU.progress or 0,aU.goal or 0)end
end end end end J.pullLeft,J.collectLeft=fE,nI J.msg=#dG>0 and("open: "..table.concat(dG,", "))or"all quests done for today"
end function J.claim()for Mh,fG in ipairs(J.events)do local wk=fG.r.Name:gsub("Action$","")for Mi,dI in ipairs(fG.st.quests)do
if dI.done and not dI.claimed then local Gk,wl=pcall(function()return fG.r:InvokeServer("claimQuest",dI.id)end)
if Gk and not(type(wl)=="table"and wl.ok==false)then J.claims=J.claims+1 D(("CLAIMED %s quest: %s (+%s)"):format(wk,tostring(dI.text),tostring(dI.points or dI.treats or"?")))
end ah(0.4)end end if fG.st.bonusReady==true then local Gl=pcall(function()return fG.r:InvokeServer("claimBonus")end)
if Gl then D(("CLAIMED %s daily quest bonus"):format(wk))end ah(0.4)end end end function J.tick()if not(e.Quests and c.running)then
if J.arPaused then J.resume("quests switched off")end return end if z()-J.at<(J.pullLeft>0 and 20 or 90)then return end
J.refresh()pcall(J.claim)if J.pullLeft<=0 and J.arPaused then J.resume("lever quests done")end end function J.pullDue()
return e.Quests and c.running and J.pullLeft>0 and z()>=J.nextAt and not E.busy end function J.lever()local wm=c.plot and c.plot:FindFirstChild("Lever")
local nJ=wm and wm:FindFirstChild("Wheel")return nJ and nJ:FindFirstChildWhichIsA("ProximityPrompt"),nJ end function J.resume(Gm)
J.arPaused=false if J.arWas then J.arWas=false e.AutoRoll=true task.spawn(E.apply,Gm)end end function J.pull()
local fH,nK=J.lever()if not fH or not nK or not nK:IsA("BasePart")then J.nextAt,J.msg=z()+300,"your lever was not found"return end
if not J.arPaused then J.arPaused=true J.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false E.apply("pulling the lever for a quest",true)
if E.isOn()then J.nextAt=z()+30 return end end D(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(J.pullLeft))
end if not fH.Enabled then J.nextAt=z()+1 return end cq(nK,fH)J.asked=nil if not(type(fireproximityprompt)=="function"and pcall(fireproximityprompt,fH))then qM(fH)end
J.pulls=J.pulls+1 J.pullLeft=J.pullLeft-1 ah(0.6)if J.asked then J.nextAt=z()+600 D(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(J.asked)))
J.resume("a butter the game wants kept is on the pad")return end J.nextAt=z()+2.5 if J.pullLeft<=0 then J.at=0 end
end F.skip,F.skipN,F.n,F.calls,F.fails,F.nextAt,F.msg,F.tries={},0,0,0,0,0,"off",{}function F.can(b3,Gn)local nL=b3:GetAttribute("PourOwner")
if type(nL)~="number"or nL==o.uid or not b3:GetAttribute("HasSquishy")then return false end if b3:GetAttribute("PourLong")~=true or b3:GetAttribute("PourFull")==true then return false end
local nM=b3:GetAttribute("PourId")if nM==nil or F.skip[nM]then return false end local wn,nN,Go=b3:GetAttribute("Helpers"),0,tostring(o.uid)
if type(wn)=="string"then for Gp in wn:gmatch("[^,%s]+")do nN=nN+1 if Gp==Go then return false end end end if nN>=6 then return false end
local ix=A.left(b3)if not ix then local wo=tonumber(b3:GetAttribute("PourEnd"))ix=wo and(wo-Gn)end if not ix or ix<=75 then return false end
local nO=game:GetService("Players"):GetPlayerByUserId(nL)if not nO or nO:GetAttribute("WaxHelpOff")==true then return false end
return true,nO,nM end function F.list()local nP,Gq={},o.srv()local wp=ak:FindFirstChild("Plots")for Mj,wq in ipairs(wp and wp:GetChildren()or{})do
local wr=wq~=c.plot and wq:FindFirstChild("WaxStations")for Mk,nQ in ipairs(wr and wr:GetChildren()or{})do local Gr,Gs,Gt=F.can(nQ,Gq)
local nR=Gr and nQ:FindFirstChild("SquishyPlaceHolder")if nR and nR:IsA("BasePart")then nP[#nP+1]={st=nQ,p=Gs,id=Gt,part=nR}end
end end return nP end function F.due()local ws=(e.MemLimit or 0)>0 and math.floor(e.MemLimit*0.72)or 900 if e.Help and c.running and z()>=F.nextAt and(d.mem or 0)>ws then
F.nextAt,F.msg=z()+30,("paused - memory %d MB > %d MB (helps load other bases)"):format(d.mem,ws)return false
end return e.Help and c.running and z()>=F.nextAt end function F.skipIt(wt,wu)F.skip[wt],F.skipN=wu,F.skipN+1
if F.skipN>600 then F.skip,F.skipN,F.tries={[wt]=wu},1,{}end end function F.goHome()local iy,b4=aq(),F.home F.home=nil
if not(iy and b4)then return end if e.Ghost and not H.seat()then d.unpin(true)if not d.parkHome()then pcall(aE,iy,b4 .Position,b4 .Position+b4 .LookVector)end
elseif d.hold or(iy.HumanoidRootPart.Position-b4 .Position).Magnitude>20 then d.unpin(true)pcall(aE,iy,b4 .Position,b4 .Position+b4 .LookVector)
end end function F.step()local nS,fI=F.list(),aq()if#nS==0 or not fI then F.nextAt=z()+15 F.msg=("helped %d waxes here%s | none to help right now"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")
F.goHome()return end local wv=fI.HumanoidRootPart local ww=wv.Position table.sort(nS,function(Gu,Gv)return(Gu.part.Position-ww).Magnitude<(Gv.part.Position-ww).Magnitude end)
local a4=nS[1]F.home=F.home or(d.hold and d.surface)or wv.CFrame local b5=a4 .part local fJ=(b5 .Position+a4 .st:GetPivot().Position)/2
local iz=F.tries[a4 .id]or 0 if(e.Ghost or e.GhostHelps)and iz==0 and not H.seat()then d.pin(b5 .CFrame,F.home)
else d.unpin(true)local nT=iz==0 and gV(fJ.X,b5 .Position.Y,fJ.Z,{b5})if nT and math.abs(nT.Y-b5 .Position.Y)<8 then
aE(fI,Vector3 .new(fJ.X,nT.Y+db(fI),fJ.Z),b5 .Position)else aE(fI,b5 .Position+Vector3 .new(0,b5 .Size.Y/2+3,0),fJ)
end end ah(0.3)local fK=ag:FindFirstChild("Remotes")fK=fK and fK:FindFirstChild("ClanRequest")if not fK then F.nextAt,F.msg=z()+60,"the game's help remote is missing"return end
local iA,bz=pcall(function()return fK:InvokeServer("help",a4 .st:GetAttribute("PourOwner"),tonumber(a4 .st.Name))end)
if iA and type(bz)=="table"and bz.ok then F.n,F.fails=F.n+1,0 F.skipIt(a4 .id,"helped")D(("HELPED %s's wax (station %s)"):format(a4 .p.DisplayName,a4 .st.Name))
F.msg=("helped %d waxes here%s"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")elseif iA and type(bz)=="table"and tostring(bz.reason or""):lower():find("walk up",1,true)and iz<2 then
F.tries[a4 .id]=iz+1 F.nextAt=z()+0.3 elseif iA and type(bz)=="table"and tostring(bz.reason or""):lower():find("moment",1,true)then
F.waits=(F.waits or 0)+1 F.nextAt=z()+1.6 else local wx=(iA and type(bz)=="table"and tostring(bz.reason or"refused"))or("error: "..tostring(bz))
F.skipIt(a4 .id,wx)F.fails=F.fails+1 if F.fails<=3 then D(("help refused for %s's wax: %s"):format(a4 .p.DisplayName,wx))end
if F.fails>=5 then F.fails,F.nextAt,F.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
F.goHome()end end F.nextAt=math.max(F.nextAt,z()+1.2)end function F.onCall(bA)if not e.HelpGuild or type(bA)~="table"or bA.p~="help"or bA.mine or bA.u==o.uid or not bA.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fL=ag:FindFirstChild("Remotes")
fL=fL and fL:FindFirstChild("ClanRequest")if not fL then return end local wy,fM=pcall(function()return fL:InvokeServer("callHelp",bA.u)end)
local wz=tostring(bA.n or bA.un or bA.u)if wy and type(fM)=="table"and fM.ok then F.calls=F.calls+1 D(("HELPED guildmate %s's wax from here (their call)"):format(wz))
else D(("guild call from %s: %s"):format(wz,(wy and type(fM)=="table"and tostring(fM.reason or"refused"))or tostring(fM)))
end end)end local function au(Gw,wA,...)if c.busy then return end c.busy,c.busyText=true,Gw if d.hold and wA~=F.step then pcall(d.unpin)end
local Gx,wB=pcall(wA,...)c.busy,c.busyText=false,""if not Gx and wB~=jw then D("ERR "..tostring(wB))end end local function Gy()
if e.Campfire and H.seat()then if j.at and H.tickAt then j.at=j.at+(z()-H.tickAt)end H.tickAt=z()H.due()c.reason,c.level=H.msg,"ok"
return end H.tickAt=nil local aV,Gz,GA=vW()c.reason,c.level=Gz,GA if aV=="place"then au("waxing...",A.place)elseif aV=="crate"then au("opening crate...",ev,true)
elseif aV=="cratesmart"then au("opening crate...",j.smart)elseif aV=="cratewin"then au("opening the crate window...",kF)
elseif aV=="nocrate"then au("discarding crate...",ev,false)elseif aV=="cratedrop"then au("discarding a crate that would not open...",j.drop)
elseif aV=="sell"then au("selling...",vj)elseif aV=="buy"then au("buying...",qP,false)elseif not aV and not c.matchSince and P.due()then
au("grabbing a butter from the admin shower...",P.grab)elseif not aV and not c.matchSince and H.due()then au("sitting at the campfire...",H.sit)
elseif not aV and not c.matchSince and J.pullDue()and not ad()and not(ck()and aP(ck().name))then au("pulling the lever for a quest...",J.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(J.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
au("collecting money...",Fv)elseif not aV and not c.matchSince and F.due()then au("helping a wax...",F.step)elseif F.home and not e.Help then
au("coming back...",F.goHome)elseif not c.busy then d.parkTick()end end function fA(iB,GB)if iB==c.running then return end
c.running=iB if not GB then e.AutoStart=iB end if iB then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bF()or c.plot
D("START")else c.reason="stopped"D("STOP")end end do local bd=ea(ar.auto)if bd==nil then bd=ea(ar.autoOld)end
if type(bd)=="string"then bd=bd:gsub("%s+$","")if bd~=""then c.autoload=bd local GC=kd(bd)D(GC and("loaded config "..bd)or("config "..bd.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local GD={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local nU={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local af={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local wC,wD,wE,wF=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if wC and wD and wE and wF then af.x,af.b,af.m,af.r=wC,wD,wE,wF end end)pcall(function()local wG=Enum.Font.RobotoMono if wG then af.mono=wG end end)
local function L(GE,GF,GG)local GH,nV=pcall(Instance.new,GE)if not GH then c.uiErrs=c.uiErrs+1 return nil end
for GI,GJ in pairs(GF)do if not pcall(function()nV[GI]=GJ end)then c.uiErrs=c.uiErrs+1 end end nV.Parent=GG return nV
end local function aa(GK,GL)L("UICorner",{CornerRadius=UDim.new(0,GL or 8)},GK)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(iC,nW)if iC and a.shown[iC]~=nW then a.shown[iC]=nW iC.Text=nW end
end function a.stroke(GM,GN,GO)return L("UIStroke",{Color=GN or l.line,Thickness=1,Transparency=GO or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},GM)
end function a.grad(GP,GQ,GR,GS)local GT,wH=pcall(function()return ColorSequence.new(GQ,GR)end)if GT and wH then return L("UIGradient",{Color=wH,Rotation=GS or 0},GP)end
end function a.pad(GU,wI,wJ,GV,GW)L("UIPadding",{PaddingLeft=UDim.new(0,wI or 0),PaddingTop=UDim.new(0,wJ or 0),
PaddingRight=UDim.new(0,GV or wI or 0),PaddingBottom=UDim.new(0,GW or wJ or 0)},GU)end function a.list(GX,GY,GZ)
return L("UIListLayout",{Padding=UDim.new(0,GY or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=GZ and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},GX)
end function a.ink(nX)local G0,G1=pcall(function()return 0.299*nX.R+0.587*nX.G+0.114*nX.B end)return(G0 and G1>0.55)and l.ink or l.text
end function a.nextIn(wK)local wL=(a.ord[wK]or 0)+1 a.ord[wK]=wL return wL end local nY=K:FindFirstChildOfClass("PlayerGui")or K:WaitForChild("PlayerGui")
local wM=nY:FindFirstChild("SABFarmGui")if wM then wM:Destroy()end local nZ=L("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},nY)local T={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local iD=ak.CurrentCamera.ViewportSize if iD.X>100 and iD.Y>100 then T.w=math.clamp(math.floor(iD.X*0.48),320,400)
T.h=math.clamp(math.floor(iD.Y*0.86),250,360)end end)a.root=L("Frame",{Name="Root",Size=UDim2 .new(0,T.w,0,T.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},nZ)
aa(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local wN=UDim2 .new(1,0,1,0)
local function Ml(wO,wP)return UDim2 .new(wO,0,0,0),UDim2 .new(wP,(wO+wP>0.99)and 0 or-4,1,0)end local function aj(G2,G3,fN,G4,G5,G6)
local n0=L("TextButton",{Text=G3,Position=G5,Size=G6,BackgroundColor3=fN,BorderSizePixel=0,Font=af.b,TextSize=G4,TextColor3=a.ink(fN),AutoButtonColor=true},G2)
aa(n0,8)if fN==l.panel2 or fN==l.raise or fN==l.panel then a.stroke(n0,l.line,0.4)end return n0 end local function iE(G7,G8,G9,G_,Ha)
local iF=L("TextBox",{Text=G8,PlaceholderText=G9,Position=G_,Size=Ha,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},G7)aa(iF,8)a.stroke(iF,l.line,0)a.pad(iF,9,0,6,0)
return iF end local iG=ak.CurrentCamera local function Hb()local Hc,iH=pcall(function()return iG and iG.ViewportSize end)
if Hc and iH and iH.X>50 and iH.Y>50 then return iH end end local function b6(fO)local n1=Hb()if not(n1 and fO and fO.Parent)then return end
local Hd=pcall(function()local iI,wQ=fO.AbsolutePosition,fO.AbsoluteSize local n2=70 local wR=math.clamp(iI.X,n2-wQ.X,n1 .X-n2)
local wS=math.clamp(iI.Y,0,n1 .Y-math.min(wQ.Y,n2))if math.abs(wR-iI.X)>0.5 or math.abs(wS-iI.Y)>0.5 then fO.Position=UDim2 .new(0,math.floor(wR),0,math.floor(wS))
end end)return Hd end local function iJ(He)local Hf,n3=pcall(function()return He.AbsolutePosition end)if Hf and n3 then return{math.floor(n3 .X),math.floor(n3 .Y)}end
end local dJ={}c.dragMoved={}local function wT(fP,wU,n4)V(fP.InputBegan:Connect(function(dK)if dK.UserInputType~=Enum.UserInputType.MouseButton1 and dK.UserInputType~=Enum.UserInputType.Touch then return end
local n5={start=dK.Position,from=wU.Position,moved=0,target=wU,input=dK,onDrop=n4}dJ[fP],c.dragMoved[fP]=n5,0
local n6 n6=dK.Changed:Connect(function()if dK.UserInputState==Enum.UserInputState.End and dJ[fP]==n5 then dJ[fP]=nil
if n6 then n6:Disconnect()end if n4 then n4(n5 .moved)end end end)end))end V(o9 .InputChanged:Connect(function(iK)
if iK.UserInputType~=Enum.UserInputType.MouseMovement and iK.UserInputType~=Enum.UserInputType.Touch then return end
for Hg,be in pairs(dJ)do local n7=be.target if n7 and n7 .Parent then local wV,wW=iK.Position.X-be.start.X,iK.Position.Y-be.start.Y
be.moved=math.max(be.moved,math.abs(wV)+math.abs(wW))c.dragMoved[Hg]=be.moved n7 .Position=UDim2 .new(be.from.X.Scale,be.from.X.Offset+wV,be.from.Y.Scale,be.from.Y.Offset+wW)
end end end))V(o9 .InputEnded:Connect(function(iL)if iL.UserInputType~=Enum.UserInputType.MouseButton1 and iL.UserInputType~=Enum.UserInputType.Touch then return end
for Hh,iM in pairs(dJ)do if iM.input==iL or iL.UserInputType==Enum.UserInputType.MouseButton1 then dJ[Hh]=nil
if iM.onDrop then iM.onDrop(iM.moved)end end end end))local function Q(Hi,Hj,Hk,Hl,Hm,Hn,Ho)return L("TextLabel",{Text=Hj,Position=Hn or UDim2 .new(0,0,0,0),Size=Ho or wN,BackgroundTransparency=1,
Font=Hm and af.b or af.m,TextSize=Hk,TextColor3=Hl,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Hi)
end function a.row(wX,Hp)return L("Frame",{Size=UDim2 .new(1,0,0,Hp),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(wX)},wX)end function a.card(wY,wZ,w0)local dL=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(wY)},wY)aa(dL,11)a.stroke(dL,l.line,0.25)a.list(dL,5)a.pad(dL,8,8,8,9)
if wZ then local n8=a.row(dL,14)L("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},n8)Q(n8,wZ:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if w0 then local Hq=Q(n8,w0,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Hq.TextXAlignment=Enum.TextXAlignment.Right end end return dL end function a.heading(Hr,Hs,n9)local n_=a.row(Hr,n9 and 34 or 22)
Q(n_,Hs,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=af.x if n9 then Q(n_,n9,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return n_ end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(oa)local aN=a.sw[oa]if not aN then return end
local dM=tostring(oa.Text or""):match(":%s*(.-)%s*$")or""local b7=dM~=""and not a.OFF[dM]local ob=not aN.chips and(dM=="ON"or dM=="OFF")
aN.pill.Visible,aN.chip.Visible=ob,not ob if ob then aN.pill.BackgroundColor3=b7 and l.accent or l.panel2 aN.knob.Position=b7 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aN.knob.BackgroundColor3=b7 and l.white or l.dim else aN.chip.Text=dM~=""and dM or"-"aN.chip.BackgroundColor3=b7 and l.accent or l.panel2
aN.chip.TextColor3=b7 and l.ink or l.dim end oa.BackgroundColor3=b7 and l.lit or l.raise if aN.edge then aN.edge.Color=b7 and l.accent or l.line aN.edge.Transparency=b7 and 0.55 or 0.45 end
end function a.switch(w1,Ht,Hu,fQ)local a5=L("TextButton",{Name="Switch",Text=Ht,TextTransparency=1,TextSize=8,Font=af.b,
Size=UDim2 .new(1,0,0,fQ and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(w1)},w1)
aa(a5,9)local ay={edge=a.stroke(a5,l.line,0.45)}ay.title=Q(a5,Hu,11,l.text,true,UDim2 .new(0,10,0,fQ and 4 or 0),UDim2 .new(1,-100,0,fQ and 15 or 28))
ay.title.TextWrapped,ay.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fQ then ay.sub=Q(a5,fQ,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
ay.sub.TextWrapped,ay.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end ay.pill=L("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a5)aa(ay.pill,9)ay.knob=L("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},ay.pill)aa(ay.knob,7)ay.chip=L("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=af.b,TextSize=9,TextColor3=l.dim,Text=""},a5)
aa(ay.chip,9)a.pad(ay.chip,10,0,10,0)L("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},ay.chip)
ay.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a5]=ay V(a5:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a5)end))
a.skin(a5)return a5 end function a.chips(oc)if a.sw[oc]then a.sw[oc].chips=true a.skin(oc)end end function a.line(Hv,Hw)
local w2=a.row(Hv,15)local w3=L("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Hw or l.dim,
BorderSizePixel=0},w2)aa(w3,3)local od=Q(w2,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))od.TextWrapped,od.TextTruncate=false,Enum.TextTruncate.AtEnd
return od,w3 end function a.grow(w4,Hx,Hy)local iN=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=af.m,TextSize=Hx or 10,TextColor3=Hy or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(w4)},w4)
V(iN:GetPropertyChangedSignal("Text"):Connect(function()iN.Visible=iN.Text~=""end))return iN end function a.note(Hz,HA)
local w5=a.grow(Hz,9,l.dim)w5 .Text=HA return w5 end function a.actions(HB,w6)local HC=a.row(HB,28)local w7,oe={},#w6
for fR,w8 in ipairs(w6)do w7[fR]=aj(HC,w8[1],w8[2]or l.panel2,10,UDim2 .new((fR-1)/oe,fR>1 and 3 or 0,0,0),UDim2 .new(1/oe,(fR>1 and-3 or 0)+(fR<oe and-3 or 0),1,0))
end return table.unpack(w7)end local function O(cR,iO,HD,HE)a.put(cR,iO and HD or HE)if not a.sw[cR]and a.lit[cR]~=iO then
a.lit[cR]=iO cR.BackgroundColor3=iO and l.accent or l.panel2 cR.TextColor3=a.ink(cR.BackgroundColor3)end end a.title=L("Frame",{Size=UDim2 .new(1,0,0,T.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
aa(a.title,14)L("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
L("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local of=L("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
aa(of,8)a.grad(of,l.accent,l.accent2,45)local w9=Q(of,"C",16,l.ink,true)w9 .Font,w9 .TextXAlignment=af.x,Enum.TextXAlignment.Center
local HF=Q(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))HF.Font=af.x Q(a.title,"butter farm  "..cd,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local HG=a.list(a.tabs,3)pcall(function()HG.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((T.h-T.head-12)/10)-3,20,34)local function bf(HH,HI,HJ)
local iP=L("TextButton",{Text=HH,Font=af.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)aa(iP,9)local w_=L("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iP)aa(w_,2)a.tabsAll[#a.tabsAll+1]={b=iP,bar=w_,name=HI,sub=HJ}return iP end
a.tabFarm=bf("🏠","Home","what the farm is doing")a.tabRun=bf("🌾","Farm","the buy - wax - collect loop")a.tabBut=bf("🧈","Butters","what gets bought and waxed")
a.tabCrt=bf("📦","Crates","which crates get opened")a.tabPet=bf("🐾","Pets","adopt, wish, fuse")a.tabTeam=bf("👥","Teams","the right pets at the right moment")
a.tabSrv=bf("🤝","Server","helping, campfire, ghost")a.tabAdm=bf("⚡","Admin","admin abuse and its boosts")a.tabSet=bf("⚙","Settings","configs, startup, performance")
a.tabAlt=bf("🔗","Alts","several accounts working together")local function bh()local og=L("ScrollingFrame",{Position=UDim2 .new(0,T.rail,0,T.head+T.status+10),
Size=UDim2 .new(1,-T.rail,1,-(T.head+T.status+10)),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,
CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)
a.list(og,8)a.pad(og,8,2,10,12)return og end a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bh(),bh(),bh(),bh(),bh(),bh(),bh(),bh(),bh()
a.farm.Visible=true a.alt=bh()do local fS=a.farm local xa=a.row(fS,34)a.startB=aj(xa,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=af.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(xa,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local HK=a.row(fS,44)local function fT(xb,HL,xc)local iQ=L("Frame",{Position=UDim2 .new((xb-1)/xc,xb>1 and 2 or 0,0,0),Size=UDim2 .new(1/xc,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},HK)aa(iQ,9)a.stroke(iQ,l.line,0.3)local iR=Q(iQ,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iR.Font,iR.TextXAlignment,iR.TextWrapped=af.x,Enum.TextXAlignment.Center,false local HM=Q(iQ,HL,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
HM.TextXAlignment=Enum.TextXAlignment.Center return iR end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fT(1,"BOUGHT",5),fT(2,"WAXED",5),fT(3,"SOLD",5),fT(4,"MONEY",5),fT(5,"FREE",5)
local xd=a.card(fS,"Right now")a.info=Q(a.row(xd,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=Q(a.row(xd,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fU=a.card(fS,"Systems")
a.helpL=a.line(fU,l.info)a.campL=a.line(fU,l.accent2)a.questL=a.line(fU,l.good)a.arL=a.line(fU,l.accent)a.ixL=a.line(fU,nU.Dotonbori)
local xe=a.card(fS,"Activity")a.log=L("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(xe)},xe)
aa(a.log,7)a.pad(a.log,7,5,7,5)end local function Mm(HN,HO)return a.row(HO or a.farm,HN)end local an do local oh=a.run
a.heading(oh,"Farm","buy what rolls, wax it, collect the cash")local fV=a.card(oh,"Loop")a.colT=a.switch(fV,"COLLECT: ON","Collect cash","step on the collector by itself")
an=a.row(fV,26)Q(an,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=iE(an,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
Q(an,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fV,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fV,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fV,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local oi=a.card(oh,"By hand")
a.buyB,a.plB=a.actions(oi,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(oi,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
an=a.row(oi,28)a.padB=aj(an,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=Q(an,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iS=a.but a.heading(iS,"Butters","what gets bought and waxed")local xf=a.card(iS,"Strategy")a.ixT=a.switch(xf,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(xf,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iS)},iS)a.list(a.butList,5)end do local iT=a.crt a.heading(iT,"Crates","only ticked crates are opened")
local xg=a.card(iT,"Opening")a.crateT=a.switch(xg,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(xg,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iT)},iT)a.list(a.crtList,5)end do local fW=a.pet a.heading(fW,"Pets","adopt, wish, fuse Bigs and Huges")
local fX=a.card(fW,"Automatic")a.pbT=a.switch(fX,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fX,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fX,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fX,10,l.dim)a.note(fX,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local xh=a.card(fW,"The plan","best teams with every pet")a.planInfo=a.grow(xh,10,l.text)a.note(xh,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fW)},fW)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iU=a.srv a.heading(iU,"Server","other players, the campfire, staying hidden")
local oj=a.card(iU,"Helping")a.helpT=a.switch(oj,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(oj,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(oj,l.info)
local xi=a.card(iU,"Campfire")a.campT=a.switch(xi,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(xi,l.accent2)local ol=a.card(iU,"Ghost")a.ghostT=a.switch(ol,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(ol,l.dim)a.note(ol,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fY=a.adm a.heading(fY,"Admin abuse","the show, its boosts and the farm in it")local xj=a.card(fY,"When")
a.admBig=Q(a.row(xj,22),"-",15,l.text,true)a.admBig.Font=af.x a.admSub=Q(a.row(xj,14),"",10,l.dim,false)local HP=a.card(fY,"Boosts now")
a.admBoost=a.grow(HP,11,l.text)local om=a.card(fY,"What the farm does")a.shT=a.switch(om,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(om,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(om,l.accent)
local xk=a.card(fY,"Show feed")a.admFeed=L("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(xk)},xk)
aa(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cS=a.set a.heading(cS,"Settings","kept on your phone, per config")
local iV=a.card(cS,"Config")an=a.row(iV,28)a.cfgName=iE(an,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=aj(an,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=aj(an,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
an=a.row(iV,26)a.cfgPrev=aj(an,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=aj(an,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=aj(an,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iV,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iV,10,l.dim)local oo=a.card(cS,"Starting")a.startT=a.switch(oo,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(oo,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(oo,9,l.dim)local op=a.card(cS,"If the game drops me")
a.rejT=a.switch(op,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(op,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(op,9,l.dim)local bB=a.card(cS,"Performance")a.pfCalm=a.switch(bB,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bB,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bB,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bB,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bB,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bB,"STOP 3D: OFF","Stop 3D","blank the world behind this window")an=a.row(bB,28)Q(an,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=iE(an,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))Q(an,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bB,l.good)a.note(bB,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local HQ=a.card(cS,"Your game passes","read from the game")a.passInfo=a.grow(HQ,10,l.text)local HR=a.card(cS,"About")
a.note(HR,"CHURN "..cd.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Mn,HT in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(HT)end local xl=L("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},nY)
a.tgRoot=L("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},xl)aa(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=L("TextButton",{Text="C",Size=wN,BackgroundTransparency=1,Font=af.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=L("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
aa(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=L("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=af.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
aa(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fZ=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fZ][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fZ][2]
a.tgGhost.BackgroundColor3=fZ==2 and l.accent or(fZ==1 and l.warn or l.panel)a.tgGhost.TextColor3=fZ>0 and l.ink or l.dim
end end local bC={built=false,boxes={},at=0}function a.check(iW,oq)iW.Text=oq and"✓"or""iW.BackgroundColor3=oq and l.accent or l.bg
iW.TextColor3=l.ink local ot=iW.Parent if ot and ot:IsA("TextButton")then ot.BackgroundColor3=oq and l.lit or l.raise end
end local function xm(xn,xo)e.Targets[xn]=xo or nil local xp=bC.boxes[xn]if xp then a.check(xp,xo)end end local function ou()
for HU,HV in pairs(bC.boxes)do a.check(HV,e.Targets[HU]==true)end end function a.tickBox(HW)local ov=L("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},HW)aa(ov,6)
a.stroke(ov,l.line,0)return ov end local f0 local function HY()local HZ=a.card(a.butList,"Butter list")local ow=a.row(HZ,26)
a.butInfo=Q(ow,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local H0=aj(ow,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local H1=aj(ow,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))H0 .MouseButton1Click:Connect(function()
for H2 in pairs(e.Targets)do e.Targets[H2]=nil end ou()end)H1 .MouseButton1Click:Connect(function()ae.at=0 j8()
f0(true)end)end f0=function(H3)if not j8()then if not a.butEmpty then a.butEmpty=Q(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bC.built and not H3 and bC.at==ae.at then return end for Mo,iX in ipairs(a.butList:GetChildren())do
if iX:IsA("Frame")or iX:IsA("TextButton")or iX:IsA("TextLabel")then iX:Destroy()end end bC.boxes,a.butEmpty={},nil
HY()for Mp,iY in ipairs(ae.rarOrder)do local ox=nU[iY]or l.text local cT=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)aa(cT,11)a.stroke(cT,ox,0.7)a.list(cT,4)a.pad(cT,7,7,7,8)
local oy=a.row(cT,22)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=ox,BorderSizePixel=0},oy)
local H4=Q(oy,iY:upper(),11,ox,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))H4 .Font=af.x local H5=aj(oy,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local H6=iY H5 .MouseButton1Click:Connect(function()local xq=ae.members[H6]or{}local xr=false for Mq,H7 in ipairs(xq)do if not e.Targets[H7]then xr=true break end end
for Mr,H8 in ipairs(xq)do xm(H8,xr)end end)for Ms,oz in ipairs(ae.members[iY]or{})do local iZ=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cT)},cT)aa(iZ,8)local xs=Q(iZ,am(oz),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
xs.TextWrapped,xs.TextTruncate=false,Enum.TextTruncate.AtEnd local xt=a.tickBox(iZ)bC.boxes[oz]=xt local xu=oz
local function xv()xm(xu,not e.Targets[xu])end iZ.MouseButton1Click:Connect(xv)xt.MouseButton1Click:Connect(xv)
end end ou()bC.built,bC.at=true,ae.at end function M.paint()for H9,H_ in pairs(M.boxes)do a.check(H_,e.CrateTicks[H9]==true)end
if a.crtInfo then local oA,oB=0,0 for Mt in pairs(M.boxes)do oA=oA+1 end for Mu,Ia in pairs(e.CrateTicks)do if Ia then oB=oB+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(oA,oB))end if a.crateT then O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function M.build()for Mv,i0 in ipairs(a.crtList:GetChildren())do if i0:IsA("Frame")or i0:IsA("TextButton")or i0:IsA("TextLabel")then i0:Destroy()end
end M.boxes={}local oC=a.card(a.crtList,"All of them","worst first")local oD=a.row(oC,26)a.crtInfo=Q(oD,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Ib=aj(oD,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Ic=aj(oD,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
V(Ib.MouseButton1Click:Connect(function()e.CrateTicks={}M.paint()end))V(Ic.MouseButton1Click:Connect(function()M.build()end))
for Mw,bD in ipairs(M.list())do local xw=nU[bD.rar or""]or l.text local dN=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(oC)},oC)aa(dN,8)L("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=xw,BorderSizePixel=0},dN)
local xx=Q(dN,(bD.title or bD.name)..(bD.guess and"  (?)"or""),11,xw,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
xx.TextWrapped,xx.TextTruncate=false,Enum.TextTruncate.AtEnd local Ie=Q(dN,bD.price and("$"..av(bD.price))or(bD.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Ie.TextXAlignment=Enum.TextXAlignment.Right local xy=a.tickBox(dN)M.boxes[bD.k]=xy local xz=bD.k local function xA()
e.CrateTicks[xz]=(not e.CrateTicks[xz])or nil M.paint()end V(dN.MouseButton1Click:Connect(xA))V(xy.MouseButton1Click:Connect(xA))
end M.built=M.at M.paint()end local xC="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set","alt"}
local function aW(cU)xC=cU for If,oE in ipairs(a.tabKeys)do a[oE].Visible=(oE==cU)local i1=a.tabsAll[If]if i1 then
local oF=oE==cU i1 .b.BackgroundTransparency,i1 .b.TextTransparency,i1 .bar.Visible=oF and 0 or 1,oF and 0 or 0.45,oF
end end if cU=="pet"and not o.built then pcall(o.build)end if cU=="team"and not A.built then pcall(A.build)end
if cU=="crt"and(M.built~=M.at or not next(M.boxes))then M.build()end if cU=="but"then f0(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(oG,xD,xE,xF)if xF then oG.Text=xF end oG.BackgroundColor3=xD and xE or l.bg oG.TextColor3=xD and a.ink(xE)or l.dim
end function o.paintRow(xG)local cV=o.rows and o.rows[xG]if not cV then return end local cW=e.Pets[xG]or{}local xH=tonumber(cW.f)==-1
a.flag(cV.b,cW.b,l.good)a.flag(cV.g,cW.g,l.accent,cW.g and"BIG"or"ANY")a.flag(cV.w,cW.w,l.warn)a.flag(cV.f,not xH,l.good,xH and"KEEP"or"AUTO")
if cV.row then cV.row.BackgroundColor3=(cW.b or cW.w)and l.lit or l.raise end end function o.flag(oH,i2)local bi=e.Pets[oH]or{}
if i2=="f"then bi.f=tonumber(bi.f)~=-1 and-1 or nil elseif bi[i2]then bi[i2]=nil else bi[i2]=true end e.Pets[oH]=(bi.b or bi.g or bi.w or bi.f)and bi or nil
o.paintRow(oH)end function o.paintAll()for Ig in pairs(o.rows or{})do o.paintRow(Ig)end if a.pbT then O(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
O(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")O(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(Ih)local xI=y.dreamT if not xI then return"working the plan out..."end local Ii,Ij=y.needFor(""),y.needFor("Big")
local cX={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(Ii,Ij,y.slots())}for Mx,xJ in ipairs(y.dreamTeams or{})do cX[#cX+1]=xJ.team:upper()..": "..table.concat(xJ.names,", ")end
local i3,i4,i5=0,0,0 for xK,xL in pairs(xI)do local xM,Ik=y.have(xK,Ih)local My,Il=y.goal(xK)i3=i3+math.max(0,xL.Huge-xM.Huge)
i4=i4+math.max(0,xL.Big-xM.Big)i5=i5+math.max(0,Il-Ik)end cX[#cX+1]=(i3+i4+i5==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(i3,i4,i5)if y.fuseMsg~=""then cX[#cX+1]=y.fuseMsg end
return table.concat(cX,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local oI=o.wishes()local dO=o.data()for i6,oJ in pairs(o.rows)do local xN=y.status(i6,dO)oJ.desc.Text=(oI[i6]and("wishing %dm | "):format(math.ceil(oI[i6]/60))or"")..(xN and(xN.." | ")or"")..oJ.boostText
oJ.desc.TextColor3=oI[i6]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dO))end local xO=tonumber(K:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dO and#(dO.pets or{})or 0,dO and tonumber(dO.maxOwned)or 60,
av(o.money()),xO>0 and(" | free wishes "..xO)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local i7=o.info()for Mz,i8 in ipairs(a.petList:GetChildren())do if i8:IsA("Frame")or i8:IsA("TextLabel")or i8:IsA("TextButton")then i8:Destroy()end
end o.rows={}if not i7 then Q(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dP={}for MA,xP in ipairs(o.order())do local oK=i7 .Pets[xP].rarity or"?"dP[oK]=dP[oK]or{}
table.insert(dP[oK],xP)end local dQ={}for MB,xQ in ipairs(i7 .Rarities or{})do if dP[xQ]then dQ[#dQ+1]=xQ end end
for xR in pairs(dP)do if not table.find(dQ,xR)then dQ[#dQ+1]=xR end end for MC,oL in ipairs(dQ)do local i9=o.RC[oL]or l.text
local cY=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
aa(cY,11)a.stroke(cY,i9,0.7)a.list(cY,4)a.pad(cY,7,7,7,8)local xS=a.row(cY,18)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=i9,BorderSizePixel=0},xS)
local Im=Q(xS,oL:upper(),11,i9,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Im.Font=af.x for MD,i_ in ipairs(dP[oL])do
local f1=L("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cY)},cY)
aa(f1,8)local oM=Q(f1,o.nice(i_),11,i9,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))oM.TextWrapped,oM.TextTruncate=false,Enum.TextTruncate.AtEnd
local In,Io=pcall(function()return i7 .describe(i_)end)local xT=In and tostring(Io)or""local oN=Q(f1,xT,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oN.TextYAlignment,oN.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function ja(Ip,Iq,Ir)
local xU=aj(f1,Ip,l.bg,8,UDim2 .new(1,Iq,0,5),UDim2 .new(0,Ir,0,22))xU.AutoButtonColor=true return xU end local xV,xW,xX,xY=ja("BUY",-164,30),ja("ANY",-131,30),ja("WISH",-98,34),ja("AUTO",-61,56)
local jb=i_ xV.MouseButton1Click:Connect(function()o.flag(jb,"b")end)xW.MouseButton1Click:Connect(function()o.flag(jb,"g")end)
xX.MouseButton1Click:Connect(function()o.flag(jb,"w")end)xY.MouseButton1Click:Connect(function()o.flag(jb,"f")end)
o.rows[i_]={b=xV,g=xW,w=xX,f=xY,name=oM,desc=oN,boostText=xT,row=f1}end end o.built=true o.paintAll()end function d.paint()
O(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")O(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
O(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")O(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
O(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])O(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end V(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
V(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))V(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
V(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))V(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
V(a.pfFps.MouseButton1Click:Connect(function()local Is=table.find(d.CAPS,e.FpsCap or 0)or 1 local xZ=d.CAPS[(Is%#d.CAPS)+1]
if not d.cap(xZ)and xZ~=0 then D("this executor cannot cap fps")end d.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()
local oO=tonumber(a.pfMem.Text)if oO and oO>=0 then e.MemLimit=math.floor(oO)end d.paint()end))function A.names()
local oP={"(none)"}for ME,It in ipairs((A.teams()))do oP[#oP+1]=It.name end return oP end function A.cycle(oQ,Iu)
local jc=A.names()local Iv=e[oQ]~=""and e[oQ]or"(none)"local jd=table.find(jc,Iv)or 1 jd=((jd-1+Iu)%#jc)+1 e[oQ]=jc[jd]=="(none)"and""or jc[jd]
A.paint()end function A.paint()if not A.built then return end O(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
O(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oR={}for MF,Iw in ipairs((A.teams()))do oR[Iw.name]=true end
for Ix,x0 in pairs(A.pick)do local dR=e[Ix]x0 .Text=dR==""and"(none)"or(oR[dR]and dR or(dR.." (missing)"))x0 .TextColor3=(dR~=""and not oR[dR])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local Iy,je=o.srv(),{}for MG,jf in ipairs(A.list or{})do je[#je+1]=("st %-2s %-22s %9s  helps %d"):format(jf.st.Name,am(W(jf.name)):sub(1,22),A.clock(jf.ends-Iy),jf.helps)
end a.tmList.Text=#je>0 and table.concat(je,"\n")or"no waxes running"end function A.build()for MH,jg in ipairs(a.teamList:GetChildren())do
if jg:IsA("Frame")or jg:IsA("TextLabel")or jg:IsA("TextButton")then jg:Destroy()end end A.pick={}local jh=a.card(a.teamList,"Automatic")
a.tmT=a.switch(jh,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(jh,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(jh,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local Iz,IA=pcall(y.rebuild,"you asked")if not Iz then D("BUILD ERR "..tostring(IA))end end)
end)a.tmInfo=a.grow(jh,10,l.dim)local x1=a.card(a.teamList,"Which team when")local function ji(jj,IB,IC)local f2=a.row(x1,54)
Q(f2,IB,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local x2=Q(f2,IC,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
x2 .TextWrapped,x2 .TextTruncate=false,Enum.TextTruncate.AtEnd local ID=aj(f2,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local x3=aj(f2,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local IE=aj(f2,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
ID.MouseButton1Click:Connect(function()A.cycle(jj,-1)end)IE.MouseButton1Click:Connect(function()A.cycle(jj,1)end)
x3 .MouseButton1Click:Connect(function()A.cycle(jj,1)end)A.pick[jj]=x3 end ji("TeamNormal","Normal","the rest of the time: money + luck")
ji("TeamFull","Full","every station busy: money + wax speed")ji("TeamGlaze","Glaze","worn just before a wax finishes")
local jk=a.row(x1,26)Q(jk,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=iE(jk,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
Q(jk,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local IF=aj(jk,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
IF.MouseButton1Click:Connect(function()local jl=tonumber(a.tmLead.Text)if jl and jl>=5 and jl<=600 then e.GlazeLead=math.floor(jl)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)ji("TeamWax","Wax","while a butter is placed: head starts")local x4=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(x4)},x4)aa(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local IG=a.card(a.teamList,"How it works")a.note(IG,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function IH()a.secB.Text=tostring(e.Every)O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ah(0.1)end if not F.home then pcall(d.unpin)end end)end
O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fA(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b6(a.root)b6(a.tgRoot)c.lastCollect=z()
ou()M.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function II(x5)task.spawn(function()x5 .TextColor3=l.bad
task.wait(0.8)if c.alive then x5 .TextColor3=l.text end end)end local function x6()local x7=a.secB.Text:match("^%s*(%d+)%s*$")
local f3=x7 and tonumber(x7)if not f3 or f3<1 then a.secB.Text=tostring(e.Every)II(a.secB)D("interval must be a whole number >= 1")
return end if f3==e.Every then return end e.Every,c.lastCollect=f3,z()D("collect every "..f3 .."s")end local function N(IJ,IK)V(IJ.MouseButton1Click:Connect(IK))end
N(a.secSet,x6)V(a.secB.FocusLost:Connect(x6))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(au,"selling...",vj)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(E.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help F.nextAt,F.msg=0,e.Help and"looking for waxes to help"or"off"O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests J.at=0 O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire H.nextAt,H.fails,H.lost=0,0,0 O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()O(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")O(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
O(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
O(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")O(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(IL)task.spawn(function()pcall(q.tick)if IL and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local IM=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(IM)end)
N(a.bestT,function()local IN=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(IN)end)N(a.bcT,function()
local IO=q.on()e.BestCrate=not e.BestCrate q.changed(IO)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b8=o.srv()local b9 pcall(function()q.aac=q.aac or require(ag:FindFirstChild("AdminAbuseClient"))
b9=q.aac:GetState()end)local dS,b_="nothing scheduled","the game has not announced one"if type(b9)=="table"then
local f4,a6,ca=tostring(b9 .Phase or""),tonumber(b9 .StartsAt),tonumber(b9 .EndsAt)if a6 and a6<1e9 then a6=nil end
if ca and ca<1e9 then ca=nil end if f4=="Countdown"and a6 then dS,b_="starts in "..A.clock(a6-b8),os.date("%a %H:%M",math.floor(a6)).." your time"
elseif f4=="Live"and ca then dS,b_="LIVE  -  "..A.clock(ca-b8).." left","the farm is grabbing, waxing and glazing through it"
elseif f4~=""and f4~="Idle"and ca and ca>b8 then dS,b_=f4:lower().."  -  "..A.clock(ca-b8).." left","after the show"
elseif a6 and a6>b8 then dS,b_="next: "..os.date("%a %H:%M",math.floor(a6)),"your time"elseif a6 then dS,b_="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a6)).." your time"
end if type(b9 .Kind)=="string"and b9 .Kind~=""then b_=b_.."  |  "..b9 .Kind end end a.put(a.admBig,dS)a.put(a.admSub,b_)
local dT,oS={},ag:FindFirstChild("AdminShow")if oS then local IP,IQ=pcall(function()return oS:GetAttributes()end)
for x8,dU in pairs(IP and IQ or{})do local jm=type(x8)=="string"and x8:match("^(.-)Mult$")local oT=jm and tonumber(oS:GetAttribute(jm.."Until"))
if jm and type(dU)=="number"and dU~=1 and dU~=0 and oT and oT>b8 then dT[#dT+1]=("%s  x%s   %s left"):format(jm:gsub("(%l)(%u)","%1 %2"),(dU%1==0)and tostring(dU)or("%.2f"):format(dU),
A.clock(oT-b8))end end end table.sort(dT)a.put(a.admBoost,#dT>0 and table.concat(dT,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dT>0 and l.accent or l.dim local jn=0 for MI in pairs(P.drops)do jn=jn+1 end local x9=q.snapAt and(q.snapAt-b8)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(P.got,P.miss,jn>0 and(", "..jn.." falling")or"",
x9 and("in "..math.max(0,math.floor(x9)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(au,"opening crate...",ev,true)end)N(a.padB,function()c.plot=bF()or c.plot local x_,oU=aq(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(x_ and oU and oU:IsA("BasePart"))then D("SET PAD: need character and plot")return end c.manualPad=oU.CFrame:ToObjectSpace(x_.HumanoidRootPart.CFrame)
Fl(c.manualPad)D("collect pad saved at your position")end)N(a.startB,function()fA(not c.running)end)N(a.buyB,function()
c.plot=bF()or c.plot task.spawn(au,"buying (manual)...",qP,true)end)N(a.plB,function()c.plot=bF()or c.plot task.spawn(au,"waxing (manual)...",qV)
end)N(a.tabFarm,function()aW("farm")end)N(a.tabRun,function()aW("run")end)N(a.tabSrv,function()aW("srv")end)N(a.tabAdm,function()aW("adm")end)
N(a.tabBut,function()aW("but")end)N(a.tabSet,function()aW("set")end)N(a.tabCrt,function()aW("crt")end)N(a.tabPet,function()aW("pet")end)
N(a.tabTeam,function()aW("team")end)N(a.tabAlt,function()aW("alt")if type(a.altShown)=="function"then pcall(a.altShown)end end)
a.mk,a.lbl,a.button,a.round,a.C,a.FT,a.click=L,Q,aj,aa,l,af,N do local IR=a.card(a.alt,"Alts","several accounts in one server")
a.altNote=Q(a.row(IR,40),"The team module is not running on this account. Load the farm with altboot.lua to use it.",10,l.dim,false)
a.altNote.TextWrapped,a.altNote.TextYAlignment=true,Enum.TextYAlignment.Top end local function IS(oV)c.hidden=oV
a.root.Visible=not oV a.tgBtn.TextColor3=oV and l.text or l.ink end wT(a.tgBtn,a.tgRoot,function()b6(a.tgRoot)
c.togPos=iJ(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then IS(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aO,aA={},0 local function cb()aO=qc()if#aO==0 then a.cfgPick.Text="(none saved)"
aA=0 return end if aA<1 or aA>#aO then aA=1 end a.cfgPick.Text=aO[aA]..("  (%d/%d)"):format(aA,#aO)end local function ya()
local yb=c.autoload~=nil a.cfgAuto.Text=yb and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=yb and l.accent or l.panel2
end local function oW()local yc=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if yc~=""then return yc end return(aA>0 and aO[aA])or""
end N(a.cfgSave,function()c.winPos=iJ(a.root)or c.winPos c.togPos=iJ(a.tgRoot)or c.togPos local yd,ye=ed(oW())
a.cfgMsg.Text=yd and("saved as "..ye)or("could not save: "..ye)a.cfgMsg.TextColor3=yd and l.good or l.bad cb()
D(a.cfgMsg.Text)end)local function IT(oX)local oY,yf=kd(oX)a.cfgMsg.Text=oY and("loaded "..yf)or("could not load: "..yf)
a.cfgMsg.TextColor3=oY and l.good or l.bad if oY then a.cfgName.Text=oX IH()task.spawn(E.apply,"config "..oX)
end D(a.cfgMsg.Text)end N(a.cfgLoad,function()IT(oW())end)N(a.cfgPick,function()cb()if aA>0 then a.cfgName.Text=aO[aA]end
end)N(a.cfgPrev,function()if#aO==0 then cb()return end aA=(aA-2)%#aO+1 cb()a.cfgName.Text=aO[aA]end)N(a.cfgNext,function()
if#aO==0 then cb()return end aA=aA%#aO+1 cb()a.cfgName.Text=aO[aA]end)N(a.cfgAuto,function()if c.autoload then
ke(nil)a.cfgMsg.Text="it will not load a config on launch"else local f5=oW()local yg=false for MJ,IU in ipairs(qc())do if IU==f5 then yg=true end end
local IV=yg or ed(f5)if IV and f5~=""then ke(f5)cb()a.cfgMsg.Text=f5 .." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim ya()end)N(a.autoB,function()
local yh,yi=Ag()a.autoMsg.Text=yh and("installed. "..yi)or("failed: "..yi)a.autoMsg.TextColor3=yh and l.good or l.bad
D(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()ee("you asked")end)
local bj=false N(a.minB,function()bj=not bj a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bj,not bj,not bj
if bj then for MK,IW in ipairs(a.tabKeys)do a[IW].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,T.head+6),UDim2 .new(1,-16,0,T.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,T.rail+8,0,T.head+6),UDim2 .new(1,-(T.rail+16),0,T.status)aW(xC)
end a.root.Size=UDim2 .new(0,T.w,0,bj and(T.head+T.status+12)or T.h)a.minB.Text=bj and"+"or"-"end)local function jo()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(gl)for ML,IY in ipairs(jx)do pcall(function()IY:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end if c.hidPurchaseApp then pcall(function()c.hidPurchaseApp.Enabled=true end)end
pcall(function()nZ:Destroy()end)pcall(function()xl:Destroy()end)if c1 .SAB_KILL==jo then c1 .SAB_KILL=nil end
end c1 .SAB_KILL=jo N(a.killB,jo)N(a.xB,jo)wT(a.title,a.root,function()b6(a.root)c.winPos=iJ(a.root)or c.winPos
end)local function yj()local f6,cZ=c.reason,c.level if c.busy then f6,cZ=c.busyText,"ok"elseif not c.running then
local MM,yk,IZ=vW()if c.capHit then f6,cZ=yk,"bad"else f6,cZ="[stopped] "..yk,(IZ=="bad")and"bad"or"idle"end c.reason,c.level=f6,cZ
end local dV=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dV then a.lit.dot=dV a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dV,dV,dV,dV
a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,f6)if a.lit.bar~=cZ then a.lit.bar=cZ a.bar.BackgroundColor3=GD[cZ]or l.dim end
if bj then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local cc=zR()if a.farm.Visible then local I0,I1=gi()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,I0 .."/"..I1)local yl=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local ym=ad()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
av(bk()),c.rolls,c.gifts,c.crates,ym and am(W(ym))or"nothing",j.on and("   ["..j.title.." window open]")or"",
yl and("in "..yl.."s")or"off"))a.put(a.tgt,(#cc==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#cc<=3)and table.concat(cc,", ")or(#cc.." butters ticked"))))
if a.lit.tgt~=(#cc==0)then a.lit.tgt=(#cc==0)a.tgt.TextColor3=(#cc==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(gc,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and F.msg or"helping is off")a.put(a.srvCamp,e.Campfire and H.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ae.n,#ae.rarOrder,#cc))
end if a.but.Visible and bC.at~=ae.at then f0(false)end if a.crt.Visible then if M.built~=M.at then M.build()else M.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and F.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and H.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(J.msg~=""and J.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local yn=(E.rec.on and"on"or"")..(E.rec.off and((E.rec.on and"/"or"").."off")or"")
a.put(a.arL,E.msg~=""and E.msg or("auto roll  %s | knows %s%s"):format(E.isOn()and"running"or"stopped",yn~=""and yn or"nothing yet",#E.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(E.msg~="")then a.lit.arL=(E.msg~="")a.arL.TextColor3=E.msg~=""and l.warn or l.dim end end end c1 .SAB={S=c,CFG=e,EV=ab,U=a,sg=nZ,CAT=ae,LEARN=al,buildList=f0,
logAll=dX,evAll=dY,AR=E,CR=M,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=F,CF=H,QX=J,IX=q,SH=P,saveConfig=ed,loadConfig=kd,setAutoload=ke}
D(cd.." loaded")if c.uiErrs>0 then D("UI: "..c.uiErrs.." properties skipped")end aW("farm")b6(a.root)b6(a.tgRoot)
if iG then pcall(function()V(iG:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)b6(a.root)
b6(a.tgRoot)end))end)end cb()ya()if c.config and c.config~=""then a.cfgName.Text=c.config end O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(yj)task.spawn(function()local yo=Ae()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(yo and("\n(backup: "..yo..")")or"")
local yp=ea(ar.exec)if yp and not yp:find("SAB autoloader v2",1,true)then gF(ar.exec,ar.stub)D("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(ea(ar.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(Am)end)task.spawn(function()while c.alive do local I2,I3=pcall(yj)if not I2 then D("UI ERR "..tostring(I3))end
task.wait((c.hidden or bj)and 1.5 or 0.4)end end)task.spawn(function()local I4,I5=pcall(Au)if not I4 then D("HOOK ERR "..tostring(I5))end
end)task.spawn(function()pcall(zd)if j.loadSeq and not j.learned then local jp={}for yq=1,20 do if j.loadSeq[yq]then jp[#jp+1]=j.loadSeq[yq]end end
if#jp>0 then j.learned={seq=jp,mode=j.loadMode}D("remembered how to open crates directly")end end if j8()then D(("catalog: %d butters in %d rarities"):format(ae.n,#ae.rarOrder))end
local I6,yr=pcall(Fn)if I6 and yr and c.alive and not c.manualPad then c.manualPad=yr end end)task.spawn(function()
while c.alive do local oZ,o0=pcall(o.buyTick)if not oZ then D("PET ERR "..tostring(o0))task.wait(5)end oZ,o0=pcall(o.wishTick)
if not oZ then D("WISH ERR "..tostring(o0))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local jq,ys=0,z()
V(game:GetService("RunService").Heartbeat:Connect(function()jq=jq+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
V(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local yt=z()d.fps,jq,ys=jq/math.max(yt-ys,0.001),0,yt local I7,I8=pcall(d.tick)if not I7 then D("PERF ERR "..tostring(I8))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local I9,I_=pcall(y.tick)if not I9 then D("FUSE ERR "..tostring(I_))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local Ja,Jb=pcall(A.tick)if not Ja then D("TEAM ERR "..tostring(Jb))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local jr=ag:WaitForChild("Remotes",30)local yu=jr and jr:WaitForChild("ClanEvent",30)
if yu and c.alive then V(yu.OnClientEvent:Connect(function(Jc,Jd)if Jc=="call"then pcall(F.onCall,Jd)end end))
end local yv=jr and jr:FindFirstChild("RollConfirmAsk")if yv and c.alive then V(yv.OnClientEvent:Connect(function(Je)J.asked=Je or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)pcall(d.walkPatch,true)end
end end)task.spawn(function()local o1=ag:WaitForChild("Remotes",30)if not(o1 and c.alive)then return end local function js(Jf,Jg)
local o2=o1:FindFirstChild(Jf)if o2 and o2:IsA("RemoteEvent")then V(o2 .OnClientEvent:Connect(function(...)pcall(Jg,...)end))end
end js("NewSquishyDiscovered",function(o3,yw)if type(o3)~="string"then return end q.disc=q.disc or{}q.disc[W(o3)]=true
D(("INDEX: %s%s is in your Index now"):format(am(W(o3)),yw and(" ("..tostring(yw)..")")or""))end)js("IndexRefresh",q.loadDisc)
js("IndexRowComplete",function(Jh)D("INDEX: the whole "..tostring(Jh).." row is complete")end)js("AdminShow",q.admin)
local yx=o1:FindFirstChild("AdminShowSync")if yx then local Ji,yy=pcall(function()return yx:InvokeServer()end)
if Ji and type(yy)=="table"then for MN,Jj in pairs(yy)do pcall(P.add,Jj)end end end while c.alive do local Jk,Jl=pcall(q.tick)
if not Jk then q.msg="index error: "..tostring(Jl)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Jm,Jn=pcall(J.tick)if not Jm then D("QUEST ERR "..tostring(Jn))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(gl)end end)pcall(E.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Jp=(type(newcclosure)=="function")and newcclosure or function(Jo)return Jo end local o4
local yz=(type(setnamecallmethod)=="function")and setnamecallmethod or nil o4=hookmetamethod(game,"__namecall",Jp(function(yA,...)
local f7=getnamecallmethod()if c.alive and(f7=="InvokeServer"or f7=="FireServer")then local yB,yC=pcall(function()return yA.Name end)
if yB and yC=="CrateAction"and not j.replaying then pcall(j.saw,f7,...)elseif yB and yC=="AutoRollAction"and not E.replaying then pcall(E.saw,f7,...)end
if yz then yz(f7)end end return o4(yA,...)end))j.oldNC=o4 end)end pcall(function()local f8=getgenv and getgenv()or _G
c.robuxBlocked=0 f8 .SAB_NOROBUX=f8 .SAB_NOROBUX or{n=0,last=""}if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
local bE=f8 .SAB_NOROBUX local c0=game:GetService("MarketplaceService")local Jq={PromptGift=true,PromptLimitedSquishy=true,PromptMultMoneyGamepass=true,PromptServerLuck=true,
PromptShopCrate=true,PromptTimeSkip=true,PromptDoubleOfflineEarnings=true,FinishWaxOffer=true}pcall(function()
local Js=(type(newcclosure)=="function")and newcclosure or function(Jr)return Jr end local yD yD=hookmetamethod(game,"__namecall",Js(function(o5,...)
local f9=getnamecallmethod()if c.alive and o5==c0 and type(f9)=="string"and f9:sub(1,6)=="Prompt"then bE.n,bE.last=bE.n+1,f9
return nil end if f9=="FireServer"or f9=="InvokeServer"then local Jt,yE=pcall(function()return o5 .Name end)if Jt and Jq[yE]and c.alive then
bE.n,bE.last=bE.n+1,yE return nil end end return yD(o5,...)end))end)local function f_(yF,Ju)pcall(function()V(c0[yF]:Connect(function(Jv,Jw)
bE.n,bE.last=bE.n+1,yF pcall(Ju,Jv,Jw)end))end)end f_("PromptProductPurchaseRequested",function(o6,Jx)c0:SignalPromptProductPurchaseFinished(typeof(o6)=="Instance"and o6 .UserId or o6,Jx,false)
end)f_("PromptGamePassPurchaseRequested",function(Jy,Jz)c0:SignalPromptGamePassPurchaseFinished(Jy,Jz,false)end)
f_("PromptPurchaseRequested",function(JA,JB)c0:SignalPromptPurchaseFinished(JA,JB,false)end)f_("PromptBundlePurchaseRequested",function(JC,JD)c0:SignalPromptBundlePurchaseFinished(JC,JD,false)end)
f_("PromptPremiumPurchaseRequested",function()c0:SignalPromptPremiumPurchaseFinished(false)end)end local function yG()
local JE,JF=pcall(function()local ga=game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp")if ga and ga:IsA("ScreenGui")then
c.hidPurchaseApp=ga if ga.Enabled then ga.Enabled=false end end end)if not JE then c.hideErr=tostring(JF)end end
yG()task.spawn(function()local yH=f8 .SAB_NOROBUX.n while c.alive do task.wait(5)yG()local dW=f8 .SAB_NOROBUX
if dW and dW.n>yH then c.robuxBlocked,yH=dW.n,dW.n D(("ROBUX PROMPT BLOCKED (%s) - %d so far"):format(dW.last,dW.n))
end end end)end)if jv then V(K.Idled:Connect(function()pcall(function()jv:CaptureController()jv:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for MO=1,90 do if not c.alive then return end if K:GetAttribute("AutoRollOn")~=nil and aq()and(c.plot or bF())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then E.apply("joined")end while c.alive do task.wait(30)local jt=ck()
if jt and q.on()and not aP(jt.name)then jt=nil end if c.alive and e.AutoRoll and c.running and not E.isOn()and not jt and not ad()
and not j.waiting and not j.on and not c.busy then E.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for MP=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bF()if aq()and c.plot and q.any()then fA(true,true)D("started by itself")
return end task.wait(1)end if c.alive and not c.running then D("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bF()c.lastCollect=z()while c.alive do if c.running then local JG,yI=pcall(Gy)if not JG and yI~=jw then D("LOOP ERR "..tostring(yI))end
end task.wait(0.1)end end)ju("ready - the window is at the top left")end local JI,o7=xpcall(yM,function(JH)return tostring(JH).."\n"..debug.traceback()end)
if not JI then pcall(function()warn("SAB "..cd.." ERROR: "..tostring(o7))end)ju("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cd.." ERROR: "..tostring(o7))end)pcall(function()local yJ=(type(getgenv)=="function"and getgenv())or _G
if type(yJ.SAB_KILL)=="function"then yJ.SAB_KILL()end for MQ,JJ in ipairs({"SABFarmGui","SABToggle"})do local yK=K.PlayerGui:FindFirstChild(JJ)
if yK then yK:Destroy()end end end)pcall(function()local gb=Instance.new("ScreenGui")gb.Name="SABError"gb.ResetOnSpawn=false
gb.DisplayOrder=1000 local a7=Instance.new("TextBox")a7 .Size=UDim2 .new(0,340,0,170)a7 .Position=UDim2 .new(0,10,0,50)
a7 .BackgroundColor3=Color3 .fromRGB(90,20,20)a7 .TextColor3=Color3 .new(1,1,1)a7 .TextSize=11 a7 .TextWrapped=true
a7 .ClearTextOnFocus=false a7 .TextXAlignment=Enum.TextXAlignment.Left a7 .TextYAlignment=Enum.TextYAlignment.Top
a7 .Text="SAB "..cd.." failed to start. Send this text:\n"..tostring(o7)a7 .Parent=gb gb.Parent=K:WaitForChild("PlayerGui")
end)end
