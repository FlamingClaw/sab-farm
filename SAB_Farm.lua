local cc="v28"local o2=game:GetService("Players")local K=o2 .LocalPlayer or o2 .PlayerAdded:Wait()local function jp(yA)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..cc,Text=yA,Duration=6})
end)end jp("script started")local function yB()local ag=game:GetService("ReplicatedStorage")local ak=game:GetService("Workspace")
local o3=game:GetService("UserInputService")local cZ=(type(getgenv)=="function"and getgenv())or _G if type(cZ.SAB_KILL)=="function"then pcall(cZ.SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jq=(function()local yC,yD=pcall(function()return game:GetService("VirtualUser")end)return yC and yD or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,Calm=false,HideBases=false,HideMine=false,MemLimit=1250,Help=false,
HelpGuild=false,Campfire=true,Ghost=false,GhostHelps=false,Quests=true,AutoIndex=false,Best=0,BestCrate=false,
Shower=true,SnapGlaze=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=z(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local aa={name=nil,rar=nil,at=z(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local E={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local j={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local o,A,d,y,F,H,J={},{},{},{},{},{},{}local q,P={},{}local jr={}local js,f9,dU,dV={},{},{},{}local function V(o4)js[#js+1]=o4 return o4 end
local function ah(yE)task.wait(yE)if not c.alive then error(jr,0)end end local function D(f_)f_=os.date("%H:%M:%S").." "..tostring(f_)
table.insert(f9,1,f_)if#f9>6 then table.remove(f9)end c.logN=(c.logN or 0)+1 dU[#dU+1]=f_ if#dU>80 then table.remove(dU,1)end
end local function ga(o5)if type(o5)~="string"then return""end return(o5:lower():gsub("[^%w]",""))end local function ab(yF)
local o6=ga(yF)local jt=o6:gsub("butter$","")if jt==""then jt=o6 end return jt end local function aP(o7)if type(o7)~="string"then return false end
local ju=ab(o7)if ju==""then return false end if q.want then return q.want(ju)end return e.Targets[ju]==true end
local function yG(dW)dW=dW:lower()return dW:find("squishy",1,true)~=nil or dW:match("butter$")~=nil or dW:match("butter[^%a]")~=nil
end local jv={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aF(dX)if type(dX)~="number"then return"?"end
local gb=1 while math.abs(dX)>=1000 and gb<#jv do dX=dX/1000 gb=gb+1 end local yH=string.format("%.2f",dX):gsub("%.?0+$","")
return yH..jv[gb]end local function yI(o8)if type(o8)~="string"then return nil end local yJ,dY=o8:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jw=tonumber(yJ)if not jw then return nil end if dY==""then return jw end local yK={qd="qa",qn="qi"}dY=yK[dY:lower()]or dY
for yL,yM in ipairs(jv)do if yM:lower()==dY:lower()then return jw*1000^(yL-1)end end return nil end local function bj()
local o9=K:GetAttribute("BoardValueMoney")if type(o9)=="number"then return o9 end local o_=K:FindFirstChild("leaderstats")
if o_ then for Jw,yN in ipairs({"Cash","Money","Coins"})do local jx=o_:FindFirstChild(yN)if jx and type(jx.Value)=="number"then return jx.Value end
end end end local function gc(yO)local jy=yO:GetFullName()if c.plot then local jz=c.plot:GetFullName()if jy:sub(1,#jz)==jz then return jy:sub(#jz+2)end
end return jy end local function ar()local gd=K.Character if gd and gd:FindFirstChild("HumanoidRootPart")then
local pa=gd:FindFirstChildOfClass("Humanoid")if pa and pa.Health>0 then return gd end end end local function bE()
local jA=ak:FindFirstChild("Plots")if not jA then return nil end local function pb(yP)local pc=yP:FindFirstChild("Plate")
return pc~=nil and pc:FindFirstChild("EditStackAttachment",true)~=nil end local pd=K:GetAttribute("PlotNumber")
if pd~=nil then local jB=jA:FindFirstChild(tostring(pd))if jB and pb(jB)then return jB end end for Jx,pe in ipairs(jA:GetChildren())do
if pb(pe)then return pe end end end local function dZ(pf)local bF=pf and pf.Parent for Jy=1,6 do if not bF then return nil end
if bF:IsA("BasePart")then return bF end if bF:IsA("Model")then return bF.PrimaryPart or bF:FindFirstChildWhichIsA("BasePart",true)end
bF=bF.Parent end end local function pg(ph)local jC=ph.Parent if jC and jC:IsA("Attachment")then return jC.WorldPosition end
local pj=dZ(ph)return pj and pj.Position end local function pk()local c0=c.plot and c.plot:FindFirstChild("Plate")
if not c0 then return nil end if c0:IsA("BasePart")then return c0 .Position end if c0:IsA("Model")then return c0:GetPivot().Position end
local pl=c0:FindFirstChildWhichIsA("BasePart",true)return pl and pl.Position end local function pm()local jD={}
local pn=c.plot and c.plot:FindFirstChild("WaxStations")if pn then for Jz,yQ in ipairs(pn:GetChildren())do local po=yQ:FindFirstChild("SquishyPlaceHolder")
local jE=po and po:FindFirstChild("PlacePrompt")if jE and jE:IsA("ProximityPrompt")then jD[#jD+1]=jE end end end
return jD end local function ge()local pp,jF=pm(),0 for JA,yR in ipairs(pp)do if yR.Enabled then jF=jF+1 end end
local jG=#pp local jH=K:GetAttribute("WaxStations")if type(jH)=="number"and jH>jG then jG=jH end return jF,jG
end local function yS()local pq=ar()local ps=pq and pq.HumanoidRootPart.Position local jI,pt for JB,jJ in ipairs(pm())do
if jJ.Enabled then local pu=pg(jJ)local pv=(pu and ps)and(pu-ps).Magnitude or 1e9 if not jI or pv<pt then jI,pt=jJ,pv end
end end return jI end local function pw()local gf=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not gf then return nil end local px=gf:FindFirstChild("BuyPromptAttachment")local gg=(px and px:FindFirstChild("BuyPrompt"))or gf:FindFirstChild("BuyPrompt",true)
if gg and gg:IsA("ProximityPrompt")and gg:IsDescendantOf(gf)then return gg end end local py={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local yT={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local al={order={},price={},dirty=false}local M={seen={},at=0,boxes={},built=0}local ae={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jK="SAB_order.txt"local function gh()if not al.dirty or type(writefile)~="function"then return end local aG={}
for yU,yV in pairs(al.price)do aG[#aG+1]="P|"..yU.."|"..string.format("%.0f",yV)end for yW,yX in pairs(al.order)do aG[#aG+1]="O|"..yW.."|"..table.concat(yX,",")end
if j.learned and j.enc then aG[#aG+1]="M|mode|"..tostring(j.learned.mode or"")for yY,gi in ipairs(j.learned.seq)do
local pz={}for pA=1,gi.n do pz[pA]=j.enc(gi.args[pA])end aG[#aG+1]=("A|%d|%s|%d|%s"):format(yY,gi.m,gi.n,table.concat(pz,";"))
end end local function jL(yZ,y0,gj)local pB={}for pC=1,gj.n do pB[pC]=j.enc(gj.args[pC])end aG[#aG+1]=("R|%d|%s|%s|%d|%s"):format(y0,yZ,gj.m,gj.n,table.concat(pB,";"))
end if j.enc then for y1,y2 in ipairs(E.rec.rules)do jL("rules",y1,y2)end if E.rec.on then jL("on",0,E.rec.on)end
if E.rec.off then jL("off",0,E.rec.off)end end for JC,d0 in pairs(M.seen)do aG[#aG+1]=("K|%s|%s|%s|%s"):format(d0 .name,d0 .title or"",d0 .rar or"",d0 .price and string.format("%.0f",d0 .price)or"")
end if pcall(writefile,jK,table.concat(aG,"\n"))then al.dirty=false end end local function y3()if type(isfile)~="function"or type(readfile)~="function"then return end
local y4,y5=pcall(isfile,jK)if not(y4 and y5)then return end local y6,pD=pcall(readfile,jK)if not(y6 and type(pD)=="string")then return end
for y7 in pD:gmatch("[^\n]+")do local c1,c2,bk=y7:match("^(%a)|([^|]+)|(.*)$")if c1=="P"then al.price[c2]=tonumber(bk)
elseif c1=="M"then j.loadMode=(bk~=""and bk~="nil")and bk or nil elseif c1=="A"and j.dec then local pE=tonumber(c2)
local pF,gk,y8=bk:match("^([^|]+)|(%d+)|(.*)$")if pE and pF then gk=tonumber(gk)local pG,gl={},0 for y9 in(y8 ..";"):gmatch("([^;]*);")do
gl=gl+1 if gl<=gk then pG[gl]=j.dec(y9)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pE]={m=pF,n=gk,args=pG}end elseif c1=="R"and j.dec then
local pH=tonumber(c2)local gm,y_,gn,za=bk:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pH and gm then gn=tonumber(gn)
local pI,go={},0 for zb in(za..";"):gmatch("([^;]*);")do go=go+1 if go<=gn then pI[go]=j.dec(zb)end end local jM={m=y_,n=gn,args=pI}
if gm=="rules"then E.rec.rules[pH]=jM elseif gm=="on"then E.rec.on=jM elseif gm=="off"then E.rec.off=jM end end
elseif c1=="K"then local pJ,pK,zc=bk:match("^([^|]*)|([^|]*)|(.*)$")M.seen[M.key(c2)]={name=c2,title=pJ~=""and pJ or nil,
rar=pK~=""and pK or nil,price=tonumber(zc)}elseif c1=="O"and bk~=""then local gp={}for zd in bk:gmatch("[^,]+")do gp[#gp+1]=zd end
if#gp>0 then al.order[c2]=gp end end end end local function ze(gq)if type(gq)~="table"then return end local cd,pL=gq.rarity,gq.contents
if type(cd)~="string"or cd==""or type(pL)~="table"then return end local d1={}for JD,gr in ipairs(pL)do if type(gr)=="table"and type(gr.butter)=="string"then
d1[#d1+1]={n=gr.butter,ch=tonumber(gr.chance)or 0}end end if#d1==0 then return end table.sort(d1,function(zf,zg)return zf.ch>zg.ch end)
local d2,d3={},false for zh,zi in ipairs(d1)do d2[zh]=zi.n end local jN=al.order[cd]if not jN or#jN~=#d2 then d3=true end
if not d3 then for pM=1,#d2 do if jN[pM]~=d2[pM]then d3=true break end end end al.order[cd]=d2 local jO=tonumber(gq.price)
if jO and al.price[cd]~=jO then al.price[cd]=jO d3=true end if d3 then al.dirty=true ae.at=0 D("learned the "..cd.." order from its crate")
end end local function c3(zj,zk)local zl=zj:FindFirstChild(zk,true)local zm,jP=pcall(function()return zl.Text end)
return(zm and type(jP)=="string"and jP~="")and jP or nil end local function am(pN)return ae.pretty[pN]or pN end
M.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function M.key(zn)return ga(zn or"")end
function M.learn(bl)if type(bl)~="table"or type(bl.name)~="string"then return end local jQ=M.key(bl.name)local bm=M.seen[jQ]or{}
local zo=(M.seen[jQ]==nil)or(tonumber(bl.price)and bm.price~=tonumber(bl.price))bm.name,bm.title=bl.name,bl.title or bm.title
bm.rar,bm.price=bl.rarity or bm.rar,tonumber(bl.price)or bm.price M.seen[jQ]=bm if zo then M.at,al.dirty=z(),true end
end function M.wanted(pO)if pO==nil then return false end local jR=M.key(pO)return e.CrateTicks[jR]==true or(e.BestCrate and q.bestCrate~=nil and(jR==q.bestCrate or jR==q.bestCrateTitle))
end function M.list()local c4={}for zp,gs in ipairs(M.base)do c4[M.key(gs[1])]={name=gs[1],title=gs[2],rar=gs[3],i=zp}end
for JE,d4 in ipairs(ae.rarOrder)do local pP=false for JF,zq in pairs(c4)do if zq.rar==d4 then pP=true break end end
if not pP and d4~="?"then local pQ=d4:gsub("[^%w]","").."Crate"c4[M.key(pQ)]={name=pQ,title=d4 .." Crate",rar=d4,i=50,guess=true}
end end for pR,gt in pairs(M.seen)do local a8=c4[pR]or{i=100}a8 .name,a8 .title,a8 .rar=gt.name or a8 .name,gt.title or a8 .title,gt.rar or a8 .rar
a8 .price,a8 .guess=gt.price or a8 .price,nil c4[pR]=a8 end local d5,gu={},{}for zr,zs in ipairs(py)do d5[zs]=zr end
for zt,pS in ipairs(ae.rarOrder)do d5[pS]=d5[pS]or(20+zt)end for zu,d6 in pairs(c4)do d6 .k=zu d6 .price=d6 .price or al.price[d6 .rar or""]
gu[#gu+1]=d6 end table.sort(gu,function(ce,cf)if ce.price and cf.price and ce.price~=cf.price then return ce.price<cf.price end
local pT,pU=d5[ce.rar or""]or 99,d5[cf.rar or""]or 99 if pT~=pU then return pT<pU end if(ce.i or 100)~=(cf.i or 100)then return(ce.i or 100)<(cf.i or 100)end
return ce.k<cf.k end)return gu end local function zv()local pV=ag:FindFirstChild("Assets")local pW=pV and pV:FindFirstChild("Squishies")
if not pW then return false end local jS,pX,c5={},{},{}local gv=0 for JG,gw in ipairs(pW:GetChildren())do local d7=ab(gw.Name)
if d7~=""and not jS[d7]then local gx=c3(gw,"RarityText")or"?"jS[d7]=gx pX[d7]=c3(gw,"NameText")or gw.Name c5[gx]=c5[gx]or{}
table.insert(c5[gx],d7)gv=gv+1 end end if gv==0 then return false end for pY,zw in pairs(c5)do local pZ=al.order[pY]or yT[pY]
local jT={}if pZ then for zx,zy in ipairs(pZ)do jT[ab(zy)]=zx end end table.sort(zw,function(p0,p1)local jU,jV=jT[p0],jT[p1]
if jU and jV then return jU<jV end if jU then return true end if jV then return false end return am(p0)<am(p1)
end)end local jW={}for zz,zA in ipairs(py)do jW[zA]=zz end local gy,cg={},{}for zB in pairs(c5)do gy[#gy+1]=zB end
pcall(function()for zC,zD in ipairs(require(ag.Modules.SquishyRNG).Keys)do cg[zD]=zC end end)table.sort(gy,function(c6,c7)
if cg[c6]and cg[c7]and cg[c6]~=cg[c7]then return cg[c6]<cg[c7]end local jX,jY=al.price[c6],al.price[c7]if jX and jY and jX~=jY then return jX<jY end
local jZ,j0=jW[c6],jW[c7]if jZ and j0 then return jZ<j0 end if jZ then return true end if j0 then return false end
return c6<c7 end)ae.rar,ae.pretty,ae.members,ae.rarOrder,ae.n,ae.at=jS,pX,c5,gy,gv,z()return true end local function j1()
if ae.at==0 or(z()-ae.at)>120 then pcall(zv)end return ae.n>0 end local function zE(zF)local p2=ab(zF)return ae.rar[p2]or(aa.name and ab(aa.name)==p2 and aa.rar)or"?"
end local function zG()local gz={}local zH=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for zI,zJ in pairs(zH)do if zJ then gz[#gz+1]=am(zI)end end
table.sort(gz)return gz end local ao={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function p3()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gA(p4)if type(makefolder)~="function"then return end local zK,zL=pcall(isfolder,p4)if not(zK and zL)then pcall(makefolder,p4)end
end local function gB(p5)if type(isfile)~="function"or type(readfile)~="function"then return nil end local zM,zN=pcall(isfile,p5)
if not(zM and zN)then return nil end local zO,zP=pcall(readfile,p5)return zO and zP or nil end local function d8(zQ,zR)
if type(writefile)~="function"then return false end return(pcall(writefile,zQ,zR))end local function p6(zS)local d9={}
if type(listfiles)~="function"then return d9 end local zT,p7=pcall(listfiles,zS)if not zT or type(p7)~="table"then return d9 end
for JH,zU in ipairs(p7)do d9[#d9+1]=tostring(zU)end return d9 end local function p8()local gC={}for JI,zV in ipairs(p6(ao.cfg))do
local p9=zV:match("([^/\\]+)%.txt$")if p9 then gC[#gC+1]=p9 end end table.sort(gC)return gC end local function zW()
local ac={"V|1"}ac[#ac+1]="N|Every|"..tostring(e.Every)ac[#ac+1]="N|GlazeLead|"..tostring(e.GlazeLead)ac[#ac+1]="N|FpsCap|"..tostring(e.FpsCap)
ac[#ac+1]="N|MemLimit|"..tostring(e.MemLimit)ac[#ac+1]="N|Best|"..tostring(e.Best or 0)for JJ,p_ in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ac[#ac+1]="S|"..p_.."|"..e[p_]end
do local gD={}for zX,gE in pairs(e.Pets)do local qa=(gE.b and"b"or"")..(gE.g and"g"or"")..(gE.w and"w"or"")..(tonumber(gE.f)==-1 and"k"or"")
if qa~=""then gD[#gD+1]=zX.."|"..qa end end table.sort(gD)ac[#ac+1]="P|-"for JK,zY in ipairs(gD)do ac[#ac+1]="P|"..zY end
end for JL,qb in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
ac[#ac+1]="B|"..qb.."|"..(e[qb]and"1"or"0")end local j2=K:GetAttribute("AutoRollRules")if type(j2)=="string"and j2~=""then e.ARrules,e.ARstop=j2,tostring(K:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then ac[#ac+1]="S|rules|"..e.ARrules ac[#ac+1]="S|stop|"..e.ARstop end if c.winPos then ac[#ac+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ac[#ac+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for JM,j3 in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gF={}for zZ,z0 in pairs(j3[2])do if z0 then gF[#gF+1]=zZ end end table.sort(gF)ac[#ac+1]=j3[1].."|-"for JN,z1 in ipairs(gF)do ac[#ac+1]=j3[1].."|"..z1 end
end return table.concat(ac,"\n")end local function z2(j4)if type(j4)~="string"or j4==""then return false end local qc,qe,qf,qg,d_={},false,{},false,nil
for z3 in j4:gmatch("[^\n]+")do local aH,ai,aA=z3:match("^(%a)|([^|]*)|?(.*)$")if aH=="N"and ai=="Every"then local j5=tonumber(aA)
if j5 and j5>=1 then e.Every=math.floor(j5)end elseif aH=="N"and(ai=="FpsCap"or ai=="MemLimit")then local j6=tonumber(aA)
if j6 and j6>=0 then e[ai]=math.floor(j6)end elseif aH=="N"and ai=="Best"then local gG=tonumber(aA)if gG and gG>=0 and gG<=4 then e.Best=math.floor(gG)end
elseif aH=="N"and ai=="GlazeLead"then local gH=tonumber(aA)if gH and gH>=5 and gH<=600 then e.GlazeLead=math.floor(gH)end
elseif aH=="S"and(ai=="TeamNormal"or ai=="TeamFull"or ai=="TeamGlaze"or ai=="TeamWax")then e[ai]=aA elseif aH=="P"and ai~=""then
if not d_ then d_={}end if ai~="-"and aA~=""then d_[ai]={b=aA:find("b",1,true)and true or nil,g=aA:find("g",1,true)and true or nil,
w=aA:find("w",1,true)and true or nil,f=aA:find("k",1,true)and-1 or nil}end elseif aH=="B"then if e[ai]~=nil then e[ai]=(aA=="1")end
elseif aH=="S"and ai=="rules"then e.ARrules=aA elseif aH=="S"and ai=="stop"then e.ARstop=aA elseif aH=="W"then
c.winPos={tonumber(ai)or 10,tonumber(aA)or 44}elseif aH=="G"then c.togPos={tonumber(ai)or 10,tonumber(aA)or 300}
elseif aH=="T"and ai~=""then if ai~="-"then qc[ai]=true end qe=true elseif aH=="K"and ai~=""then if ai~="-"then qf[ai]=true end
qg=true end end if qe then e.Targets=qc end if qg then e.CrateTicks=qf end if d_ then e.Pets=d_ end return true
end local function gI(c8)if not p3()then return false,"this executor cannot write files"end c8=(c8 or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c8==""then return false,"give the config a name"end gA(ao.dir)gA(ao.cfg)if not d8(ao.cfg.."/"..c8 ..".txt",zW())then return false,"could not write the file"end
c.config=c8 return true,c8 end local function qh(gJ)local qi=gB(ao.cfg.."/"..gJ..".txt")if not qi then return false,"no config called "..tostring(gJ)end
if not z2(qi)then return false,"that config looks empty"end c.config=gJ return true,gJ end local function qj(j7)
if j7 then gA(ao.dir)d8(ao.auto,j7)elseif type(delfile)=="function"then pcall(delfile,ao.auto)else d8(ao.auto,"")
end c.autoload=j7 end local function z4()if c.selfPath then return c.selfPath end local gK for JO,z5 in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ao.dir})do
for JP,qk in ipairs(p6(z5))do local j8=qk:lower()if j8:sub(-4)==".lua"and(j8:find("sab_farm",1,true)or j8:find("sab farm",1,true))then
gK=gK or qk end end end c.selfPath=gK return gK end ao.stub=[[
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
local function z6()if not p3()then return false,"this executor cannot write files"end gA("autoexec")if not d8(ao.exec,ao.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gL=(function()local z7,z8=pcall(function()return game:GetService("TeleportService")end)return z7 and z8 or nil end)()
local function ql()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local z9=queueonteleport or queue_on_teleport return(pcall(z9,ao.stub))end local function ea(z_)if c.rejoining then return end
c.rejoining=true D("REJOIN ("..z_..")")pcall(gh)if c.autoload then pcall(gI,c.autoload)end local Aa=ql()D(Aa and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for JQ=1,30 do if not gL then break end pcall(function()gL:Teleport(game.PlaceId,K)end)task.wait(10)
end end)end local function Ab()local Ac,qm=pcall(function()return game:GetService("GuiService")end)if Ac and qm then
pcall(function()V(qm.ErrorMessageChanged:Connect(function()if e.Rejoin then ea("roblox error message")end end))
end)end pcall(function()local qo=game:GetService("CoreGui")local qp=qo and qo:WaitForChild("RobloxPromptGui",15)
local qq=qp and qp:WaitForChild("promptOverlay",15)if qq then V(qq.ChildAdded:Connect(function(Ad)if e.Rejoin and tostring(Ad.Name):lower():find("errorprompt",1,true)then ea("disconnect prompt")end
end))end end)if gL then pcall(function()V(gL.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()ea("teleport retry")end)end
end))end)end end local function qr(Ae)local qs=c.plot and c.plot:FindFirstChild(Ae)if not qs then return nil,false end
for JR,j9 in ipairs(qs:GetChildren())do if j9:IsA("Model")or j9:IsA("BasePart")then return j9,true end end return nil,true
end local function cj()local bG=qr("RolledSquishy")if not bG then return nil end return{model=bG,name=bG.Name,pretty=c3(bG,"NameText")or am(ab(bG.Name)),
rar=c3(bG,"RarityText")or zE(bG.Name),price=c3(bG,"PriceText")}end local function qt(j_)return type(j_)=="string"and(ae.rar[ab(j_)]~=nil or yG(j_))
end local function ad()local ka=qr("SquishyEquipped")if ka then c.carrySrc,j.heldAt="model",z()return ka.Name,ka end
local qu=K.Character if qu then for JS,eb in ipairs(qu:GetDescendants())do if(eb:IsA("Model")or eb:IsA("Tool"))and qt(eb.Name)then
c.carrySrc,j.heldAt="character",z()return eb.Name,eb end end end local gM=K:GetAttribute("SquishyEquipped")if type(gM)=="string"and gM~=""and qt(gM)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gM,nil end c.carrySrc=nil end local function JT()local JU,Af=ad()return Af end local function ec()
local qv=cj()local kb=qv and yI(qv.price)local kc=bj()if kb and kc and kc<kb*0.5 then return kc,kb end end local function ck(Ag)
dV[#dV+1]=os.date("%H:%M:%S").." "..Ag if#dV>40 then table.remove(dV,1)end end local function Ah(cl,gN)if type(cl)~="string"then return end
ck(("Roll(%s,%s)"):format(cl,tostring(gN)))if cl:lower():find("crate",1,true)then j.rolled,j.rolledAt=cl,z()return
end aa.seq=aa.seq+1 aa.name,aa.at=cl,z()aa.rar=type(gN)=="string"and gN or nil c.rolls=c.rolls+1 if aP(cl)then D(("ROLL %s [%s] = TARGET"):format(cl,tostring(gN)))end
end local function Ai(cm)if type(cm)~="table"then return end local gO=cm.butter or cm.itemName if type(gO)~="string"then return end
c.gifts=c.gifts+1 aa.gift,aa.giftAt=gO,z()if type(cm.giftId)=="string"then local qw=ag:FindFirstChild("Remotes")
local qx=qw and qw:FindFirstChild("GiftThanks")if qx then pcall(function()qx:FireServer(cm.giftId)end)end end
ck("Gift("..gO.." from "..tostring(cm.fromName)..")")D(("GIFT from %s: %s - it will not be waxed"):format(tostring(cm.fromName),gO))
end local function Aj()local qy=ag:WaitForChild("Remotes",30)if not c.alive then return end if not qy then D("Remotes folder missing - no roll events")return end
V(K:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local qz=K:GetAttribute("SquishyEquipped")
if type(qz)=="string"and qz~=""then j.heldAt=z()end end))local Ap={SquishyRollAnimation=Ah,InitSquishy=function(qA)aa.init,aa.initAt=tostring(qA),z()ck("Init("..tostring(qA)..")")end,
CrateUpdate=function(c9,qB)pcall(ze,c9)pcall(M.learn,c9)if type(c9)=="table"then local Ak=qB==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not Ak then return end local Al=not j.waiting local Am=j.on j.waiting,j.data,j.at=true,c9,z()j.on=(qB==true)
j.title=tostring(c9 .title or c9 .name or"crate")if j.on and not Am then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then ck("CrateWindow open("..j.title..")")elseif Al then ck("Crate waiting("..j.title..")")D(j.title.." is waiting on your stand")
end else if j.waiting then ck("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local An=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,An)end if j.classify then local Ao=z()
task.spawn(function()pcall(j.classify,Ao)end)end end end,GiftReceived=Ai,}for gP,Aq in pairs(Ap)do local kd=qy:FindFirstChild(gP)
if kd and kd:IsA("RemoteEvent")then V(kd.OnClientEvent:Connect(Aq))elseif gP~="CrateUpdate"and gP~="GiftReceived"then D("remote "..gP.." missing")end
end end local function ke()local cn=cj()if cn then if aP(cn.name)then return{state="match",shown=cn.pretty,src="pad",info=cn}
end return{state="skip",info=cn,level="idle",text=("on pad: %s [%s] - not ticked"):format(cn.pretty,tostring(cn.rar))}
end if aa.name and(z()-aa.at)<4 then if aP(aa.name)then return{state="match",shown=am(ab(aa.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(am(ab(aa.name)),tostring(aa.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gQ(Ar,As,At,Au)
local gR=RaycastParams.new()gR.FilterType=Enum.RaycastFilterType.Exclude local kf={K.Character}for JV,Av in ipairs(Au or{})do kf[#kf+1]=Av end
gR.FilterDescendantsInstances=kf pcall(function()gR.RespectCanCollide=true end)local qC=ak:Raycast(Vector3 .new(Ar,As+4,At),Vector3 .new(0,-30,0),gR)
return qC and qC.Position or nil end local function c_(qD)local qE=qD:FindFirstChildOfClass("Humanoid")return((qE and qE.HipHeight)or 2)+qD.HumanoidRootPart.Size.Y/2+0.2
end local function kg(Aw,Ax)local kh=Aw:FindFirstChildOfClass("Humanoid")local Ay=z()while z()-Ay<Ax do if kh and(kh.FloorMaterial~=Enum.Material.Air or kh.SeatPart)then return true end
ah(0.05)end return false end local function aD(Az,ki,kj)local qF=Az.HumanoidRootPart qF.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qF.CFrame=kj and CFrame.new(ki,Vector3 .new(kj.X,ki.Y,kj.Z))or CFrame.new(ki)end local function co(bn,qG)local cp=ar()
if not cp or not bn then return false end local bH=bn.Position local gS=math.clamp(math.max(bn.Size.X,bn.Size.Z)/2+2.2,3,7)
local qH=(qG and qG.MaxActivationDistance)or 10 if gS>qH-2 then gS=math.max(2.5,qH-2)end local ed={}local function cq(ee)
ee=Vector3 .new(ee.X,0,ee.Z)if ee.Magnitude>0.05 then ed[#ed+1]=ee.Unit end end local qI=pk()if qI then cq(qI-bH)end
cq(bn.CFrame.LookVector)cq(-bn.CFrame.LookVector)cq(bn.CFrame.RightVector)cq(-bn.CFrame.RightVector)cq(cp.HumanoidRootPart.Position-bH)
if#ed==0 then cq(Vector3 .new(0,0,1))end local AA,gT=c_(cp),false for JW,AB in ipairs(ed)do local gU=bH+AB*gS
local kk=gQ(gU.X,bH.Y,gU.Z,{bn})if kk and math.abs(kk.Y-bH.Y)<14 then aD(cp,Vector3 .new(gU.X,kk.Y+AA,gU.Z),bH)
if kg(cp,0.7)then gT=true break end end end if not gT then aD(cp,bH+ed[1]*gS+Vector3 .new(0,3,0),bH)gT=kg(cp,1)
end ah(0.12)return gT end local function qJ(ef)if not ef.Parent or not ef.Enabled then return false end pcall(function()ef:InputHoldBegin()end)
ah(math.max(ef.HoldDuration,0)+0.08)pcall(function()ef:InputHoldEnd()end)return true end local function ap(qK,AC)
local AD=z()while z()-AD<AC do if qK()then return true end ah(0.05)end return qK()end local function eg(da,AE,qL,AF)
local AG=c.zapFirst and{"zap","hold"}or{"hold","zap"}for AH,kl in ipairs(AG)do if AH==2 and(AF or not(da.Parent and da.Enabled and(not qL or qL())))then break end
local km if kl=="hold"then km=qJ(da)else km=type(fireproximityprompt)=="function"and da.Parent~=nil and da.Enabled and pcall(fireproximityprompt,da)end
if km and ap(AE,1.2)then c.zapFirst=(kl=="zap")return true,kl end end return false end local function qM(kn)local bI=pw()
if not bI or not bI.Enabled then D("buy: nothing on the pad")return false end local ko=dZ(bI)if not ko then D("buy: pad part missing")return false end
c.lastBuyAt=z()local AI,qN=aa.seq,bj()local qO=ar()local AJ=qO and(qO.HumanoidRootPart.Position-ko.Position).Magnitude>12
co(ko,bI)if AJ then ah(0.4)end if not bI.Enabled then D("buy aborted: pad emptied")return false end local db=ke()
if not kn and db.state~="match"then D("buy aborted: "..(db.text or"pad changed"))c.matchSince=nil return false
end local kp=db.info and db.info.name or(db.state=="match"and aa.name)or nil local function AK()return bI.Enabled and ad()==nil and(kn or ke().state=="match")
end local AL,AM=eg(bI,function()return ad()~=nil or((not bI.Enabled)and(kn or aa.seq==AI))end,AK,ec()~=nil)if AL then
ap(function()return ad()~=nil end,0.8)local eh=ad()local qP=bj()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil aa.name,aa.rar,aa.at=nil,nil,z()D(("BOUGHT %s%s via %s"):format(eh and am(ab(eh))or(db.shown or"?"),(qN and qP)and(" for $"..aF(qN-qP))or"",AM))
if eh and kp and ab(eh)~=ab(kp)then D(("note: picked up %s, not %s"):format(eh,kp))end return true end local gV=cj()
if ec()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("BUY REFUSED: cash short - have $%s, price %s"):format(aF(bj()),(gV and gV.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)D(("buy did not go through (%s, try %d) - again in %ds"):format(gV and gV.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qQ()local ei=ad()if not ei then c.holding=false D("place: hands are empty")
return false end if not aP(ei)then D(("REFUSED TO WAX %s - it is not ticked"):format(am(ab(ei))))return false
end for JX=1,e.PlaceTries do local bJ=yS()if not bJ then D("place: no free station")break end local qR=dZ(bJ)
if qR then co(qR,bJ)local qS=ad()if not qS then c.holding=false D("place: hands emptied on the way")return false end
if not aP(qS)then D("place: what I carry changed, not waxing it")return false end if bJ.Enabled then local AN,AO=eg(bJ,function()return not bJ.Enabled end,function()return bJ.Enabled end)
if AN then c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 aa.name,aa.rar,aa.at=nil,nil,z()
D(("WAXED %s #%d at %s via %s"):format(am(ab(ei)),c.placed,bJ.Parent.Parent.Name,AO))if q.placed then pcall(q.placed,ei)end
return true end end end ah(0.25)end c.placeFails=c.placeFails+1 if ad()==nil then c.holding=false end D("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ad()))D(c.capMsg)end return false end function A.place()local AP=z()while c.alive and A.editing and z()-AP<25 do ah(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local AQ=z()while c.alive and A.current()~=e.TeamWax and z()-AQ<5 do ah(0.1)end
if A.current()==e.TeamWax then ah(0.3)else D("wax team did not come on in time - placing anyway")end end local AS,qT=pcall(qQ)
A.placing=false if not AS then error(qT,0)end return qT end local function qU(qV)return type(qV)=="string"and qV:lower():find("crate",1,true)~=nil
end local AT={SABFarmGui=1,SABToggle=1,SABError=1}local function kq(AU)local bK=AU while bK do if AT[bK.Name]then return false end
if bK:IsA("ScreenGui")then local AV,AW=pcall(function()return bK.Enabled end)return(not AV)or AW~=false end if bK:IsA("GuiObject")and not bK.Visible then return false end
bK=bK.Parent end return false end local function gW(gX)local dc=""pcall(function()if gX:IsA("TextButton")then dc=gX.Text end end)
if not dc:find("%a")then for JY,gY in ipairs(gX:GetDescendants())do if(gY:IsA("TextLabel")or gY:IsA("TextButton"))and gY.Text:find("%a")then dc=gY.Text break end
end end if not dc:find("%a")then dc=gX.Name end return(dc:lower():gsub("[^%a]",""))end local function AX()local ej,ek
local qW=K:FindFirstChildOfClass("PlayerGui")if not qW then return nil,nil end for JZ,el in ipairs(qW:GetDescendants())do
if el:IsA("GuiButton")and kq(el)then local kr=gW(el)if kr:sub(1,4)=="open"and not kr:find("shop",1,true)then ej=ej or el end
if kr:sub(1,7)=="discard"then ek=ek or el end end end if ej and ek then return ej,ek end if j.on then return ej,ek end
return nil,nil end local ks=(function()local AY,AZ=pcall(function()return game:GetService("VirtualInputManager")end)return AY and AZ or nil end)()
local function qX(bo,kt)local ku={}local function qY(A0)ku[#ku+1]=A0 end if c.tapWay then qY(c.tapWay)end for J0,qZ in ipairs({"touch","conn","signal"})do
if qZ~=c.tapWay then qY(qZ)end end local function q0(A1,...)local A2,kv=pcall(getconnections,A1)if not(A2 and type(kv)=="table"and#kv>0)then return false end
local q1,A3,A4=false,{...},select("#",...)for J1,A5 in ipairs(kv)do if pcall(function()A5:Fire(table.unpack(A3,1,A4))end)then q1=true end
end return q1 end local function q2()local q3=Vector3 .new(0,0,0)pcall(function()local q4,q5=bo.AbsolutePosition,bo.AbsoluteSize
q3=Vector3 .new(q4 .X+q5 .X/2,q4 .Y+q5 .Y/2,0)end)local kw={Position=q3,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kw.UserInputType=Enum.UserInputType.Touch end)pcall(function()kw.UserInputState=Enum.UserInputState.End end)
return kw end for J2,bp in ipairs(ku)do local em=false if bp=="conn"and type(getconnections)=="function"then if q0(bo.MouseButton1Click)then
em=true if ap(kt,1.5)then c.tapWay=bp return true,bp end end em=q0(bo.Activated,q2(),1)elseif bp=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bo.MouseButton1Click)then if ap(kt,1.5)then c.tapWay=bp return true,bp end end em=pcall(firesignal,bo.Activated,q2(),1)
elseif bp=="touch"and ks then em=pcall(function()local q6,q7=bo.AbsolutePosition,bo.AbsoluteSize local q8=0 local q9=bo:FindFirstAncestorWhichIsA("ScreenGui")
local A6,A7=pcall(function()return q9 and q9 .IgnoreGuiInset end)if not(A6 and A7)then pcall(function()q8=game:GetService("GuiService"):GetGuiInset().Y end)
end local q_,ra=q6 .X+q7 .X/2,q6 .Y+q7 .Y/2+q8 ks:SendMouseButtonEvent(q_,ra,0,true,game,1)task.wait(0.06)ks:SendMouseButtonEvent(q_,ra,0,false,game,1)
end)end if em and ap(kt,1.5)then c.tapWay=bp return true,bp end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kx(rb)local en=rb.Parent while en and en~=c.plot do if j.NOT[en.Name]then return false end en=en.Parent
end local ky=(rb.ActionText or""):lower()if ky:find("roll",1,true)or ky:find("place",1,true)or ky:find("sell",1,true)then return false end
return true end local function rc()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local rd=c.plot:FindFirstChild("CrateStand")local eo if rd then for J3,gZ in ipairs(rd:GetDescendants())do
if gZ:IsA("ProximityPrompt")and gZ.Enabled and kx(gZ)then eo=gZ break end end end if not eo then for J4,bL in ipairs(c.plot:GetDescendants())do
if bL:IsA("ProximityPrompt")and bL.Enabled and kx(bL)then local rf=bL:FindFirstAncestorWhichIsA("Model")local A8=((bL.ActionText or"").." "..(bL.ObjectText or"").." "..bL.Name.." "..(rf and rf.Name or"")):lower()
if A8:find("crate",1,true)then eo=bL break end end end end j.prompt=eo return eo end local function kz()if j.on then return true end
local ep=rc()if not ep then j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local rg=dZ(ep)if rg then co(rg,ep)end j.ours=true eg(ep,function()return j.on end)if ap(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: pressed "..gc(ep).." but no window came up")
return false end do local function A9(rh)local dd=rh.Parent while dd and dd:IsA("GuiObject")do local ri,rj=false,false
for J5,eq in ipairs(dd:GetDescendants())do if eq~=rh and eq:IsA("GuiButton")and gW(eq):sub(1,7)=="discard"then ri=true end
if eq:IsA("TextLabel")then local kA=eq.Text:lower()if kA:find("crate",1,true)or kA:find("can contain",1,true)or kA:find("cost",1,true)then rj=true end
end if ri and rj then return dd end end dd=dd.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local rk=K:FindFirstChildOfClass("PlayerGui")if not rk then return nil end for J6,g0 in ipairs(rk:GetDescendants())do
if g0:IsA("GuiButton")and not g0:FindFirstAncestor("SABFarmGui")and gW(g0):sub(1,4)=="open"then local kB=A9(g0)
if kB then j.win=kB return kB end end end end local function A_(Ba)for J7,g1 in ipairs(Ba:GetDescendants())do
if g1:IsA("GuiButton")then local rl,kC=gW(g1),g1 .Name:lower()if rl=="x"or rl=="close"or kC=="x"or kC:find("close",1,true)or kC:find("exit",1,true)then return g1 end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(Bb)task.wait(Bb and 4 or 1.2)if j.on or j.waiting then return end
local g2=j.findWin()if not g2 or not kq(g2)then return end local rm=A_(g2)if rm and qX(rm,function()return not kq(g2)end)then return end
D("the crate window is still open - tap its X")end end local function er(g3)if not kz()then return false end local rn=z()-(j.openedAt or 0)
if rn<0.6 then ah(0.6-rn)end local kD=j.title local Bc,Bd=AX()local ro=g3 and Bc or Bd if not ro then j.lastFail=z()
c.crateFails=c.crateFails+1 D(("crate: no %s button found in %s"):format(g3 and"Open"or"Discard",kD))return false
end local Be=ad()local Bf,J8=qX(ro,function()return(not j.on)or(ad()~=nil and ad()~=Be)end)if not Bf then j.lastFail=z()
c.crateFails=c.crateFails+1 D("crate: could not press "..(g3 and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if g3 then c.crates=c.crates+1 ap(function()return ad()~=nil end,1.5)local rp=ad()
D(("OPENED %s -> %s"):format(kD,rp and am(ab(rp))or"?"))else D("discarded "..kD.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(Bg,...)local Bh=select("#",...)j.calls[#j.calls+1]={t=z(),m=Bg,n=Bh,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aI,bq)local bM=type(aI)if(bM=="string"or bM=="number")and type(bq.data)=="table"then for rq,kE in pairs(bq.data)do
if kE==aI and type(rq)=="string"and(type(kE)=="string"or type(kE)=="number")then return{__slot="f:"..rq}end end
end if bM=="string"then if bq.crate and aI==bq.crate then return{__slot="crate"}end if bq.title and aI==bq.title then return{__slot="title"}end
if bq.rar and aI==bq.rar then return{__slot="rarity"}end return aI end if bM=="number"or bM=="boolean"or bM=="nil"then return aI end
if bM=="table"then local rr={}for Bi,rs in pairs(aI)do if type(rs)=="table"then return nil,"nested table"end local Bj,rt=j.slot(rs,bq)
if rt then return nil,rt end rr[Bi]=Bj end return rr end local Bk,Bl=pcall(function()return aI:IsA("Instance")end)
if Bk and Bl then if aI==K then return{__slot="player"}end if c.plot and aI==c.plot then return{__slot="plot"}end
local g4=c.plot and c.plot:FindFirstChild("CrateStand")if g4 and aI==g4 then return{__slot="stand"}end if g4 and aI.Parent==g4 then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bM..")"end function j.resolve(g5)if type(g5)~="table"then return g5 end
local aX=g5 .__slot if aX and aX:sub(1,2)=="f:"then return j.data and j.data[aX:sub(3)]end if aX=="crate"then return j.data and j.data.name end
if aX=="title"then return(j.data and j.data.title)or j.title end if aX=="rarity"then return j.data and j.data.rarity end
if aX=="player"then return K end if aX=="plot"then return c.plot end if aX=="stand"or aX=="model"then local kF=c.plot and c.plot:FindFirstChild("CrateStand")
if aX=="stand"or not kF then return kF end for J9,ru in ipairs(kF:GetChildren())do if qU(ru.Name)then return ru end end
return nil end local rv={}for Bm,Bn in pairs(g5)do rv[Bm]=j.resolve(Bn)end return rv end function j.classify(kG)
if j.directOff then return end local g6={}for J_,kH in ipairs(j.calls)do if kH.t<=kG+0.05 and kG-kH.t<=6 then g6[#g6+1]=kH end
end if#g6==0 then return end if not ap(function()return(j.heldAt or 0)>=kG-1 end,2.5)then return end local es={}
for Ka,et in ipairs(g6)do local rw={}for rx=1,et.n do local Bo,ry=j.slot(et.args[rx],et)if ry then D("crate call has "..ry.." - keeping the button method")
return end rw[rx]=Bo end es[#es+1]={m=et.m,n=et.n,args=rw}end local kI=j.learned j.learned={seq=es,mode=kI and kI.mode or nil}
al.dirty=true if not kI then D(("learned how to open crates directly (%d call%s)"):format(#es,#es==1 and""or"s"))end
end function j.replay()local rz=j.learned local rA=ag:FindFirstChild("Remotes")local kJ=rA and rA:FindFirstChild("CrateAction")
if not(rz and kJ)then return false end local rB=table.unpack or unpack j.replaying=true for Kb,eu in ipairs(rz.seq)do
local kK={}for rC=1,eu.n do kK[rC]=j.resolve(eu.args[rC])end task.spawn(function()pcall(function()if eu.m=="InvokeServer"then kJ:InvokeServer(rB(kK,1,eu.n))
else kJ:FireServer(rB(kK,1,eu.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(Bp)return(Bp:gsub("[%%|;=,\n]",function(Bq)return("%%%02X"):format(Bq:byte())end))end
function j.enc(cr)local g7=type(cr)if g7=="string"then return"s"..j.esc(cr)end if g7=="number"then return"n"..tostring(cr)end
if g7=="boolean"then return cr and"b1"or"b0"end if g7=="nil"then return"z"end if cr.__slot then return"k"..cr.__slot end
local kL={}for Br,Bs in pairs(cr)do kL[#kL+1]=j.enc(Br).."="..j.enc(Bs)end return"t"..table.concat(kL,",")end
function j.dec(rD)local ev,ew=rD:sub(1,1),rD:sub(2)local function Bt(Bu)return(Bu:gsub("%%(%x%x)",function(Bv)return string.char(tonumber(Bv,16))end))end
if ev=="s"then return Bt(ew)end if ev=="n"then return tonumber(ew)end if ev=="b"then return ew=="1"end if ev=="k"then return{__slot=ew}end
if ev=="t"then local rE={}for Bw in ew:gmatch("[^,]+")do local rF,Bx=Bw:match("^(.-)=(.*)$")if rF then local rG=j.dec(rF)
if rG~=nil then rE[rG]=j.dec(Bx)end end end return rE end return nil end function j.goneOrNew(By)return function()
if not j.waiting then return true end local rH=ad()return rH~=nil and rH~=By end end function j.near()local rI=ag:FindFirstChild("Remotes")
local kM=rI and rI:FindFirstChild("CrateAction")local g8=ar()local kN=c.plot and c.plot:FindFirstChild("CrateStand")
local kO=kN and kN:FindFirstChild("Spot")if not(kM and g8 and kO)then D(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kM and"no CrateAction remote"or not g8 and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kP=g8 .HumanoidRootPart local g9=kP.CFrame local rJ,kQ=j.title,"no answer"local Bz=ad()local rK=kN:FindFirstChild("Holder")
local function rL()if not rK then return j.waiting or j.on end for Kc,BA in ipairs(rK:GetChildren())do if BA:IsA("Model")then return true end end
return false end for BB=1,3 do if not(j.waiting or j.on)or not rL()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kP.Position-kO.Position).Magnitude>8 then co(kO,j.prompt)end ah(0.12+0.15*BB)
local a9={}j.replaying=true task.spawn(function()a9 .ok,a9 .v=pcall(function()return kM:InvokeServer("open")end)
a9 .done=true end)ap(function()return a9 .done end,6)j.replaying=false local cs=a9 .v if a9 .done and a9 .ok and type(cs)=="table"and cs.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 D(("OPENED %s -> %s (no window)"):format(rJ,cs.prize and am(ab(tostring(cs.prize)))or"?"))
ap(function()local rM=ad()return rM~=nil and rM~=Bz end,1.5)if(kP.Position-g9 .Position).Magnitude>8 then pcall(function()aD(g8,g9 .Position,g9 .Position+g9 .LookVector)end)end
return true,"opened"end kQ=(a9 .done and a9 .ok and type(cs)=="table")and tostring(cs.reason or"refused, no reason given")
or(a9 .done and("error: "..tostring(cs))or"no answer in 6s")ah(0.3)if not rL()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 D(("crate: the server would not open %s next to the stand (%s)"):format(rJ,kQ))
return false,kQ end j.GIVEUP=600 function j.drop()local rN=ag:FindFirstChild("Remotes")local rO=rN and rN:FindFirstChild("CrateAction")
local rP=c.plot and c.plot:FindFirstChild("CrateStand")local kR=rP and rP:FindFirstChild("Spot")local rQ=ar()
if kR and rQ and(rQ.HumanoidRootPart.Position-kR.Position).Magnitude>8 then co(kR,j.prompt)ah(0.3)end local kS,br=false,nil
if rO then kS,br=pcall(function()return rO:InvokeServer("discard")end)end D(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(kS and type(br)=="table"and br.ok)and"done"or("answer: "..tostring(type(br)=="table"and(br.reason or br.ok)or br))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(kS and type(br)=="table"and br.ok)then er(false)end end function j.smart()local kT=j.title if(j.nearFails or 0)<3 then
local BC=j.near()if BC then return true end if j.nearFails>=3 then D("opening next to the stand failed 3 times - trying the older ways")end
end local ct=j.learned if ct then local kU=ad()if j.on then j.replay()if ap(j.goneOrNew(kU),3.5)then c.crates=c.crates+1
D("OPENED "..kT.." (direct)")return true end else if ct.mode~="window"then j.replay()if ap(j.goneOrNew(kU),3.5)then
c.crates,j.fails=c.crates+1,0 if ct.mode~="direct"then ct.mode,al.dirty="direct",true D("crates now open directly - the window never comes up")
end D("OPENED "..kT.." (direct, no window)")return true end end if kz()then j.replay()if ap(j.goneOrNew(kU),3.5)then
c.crates,j.fails=c.crates+1,0 if ct.mode~="window"then ct.mode,al.dirty="window",true D("crates need their window up first - it shows briefly")
end D("OPENED "..kT.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,al.dirty=ct,nil,true
if j.fails>=3 then j.directOff=true D("direct crate opening failed 3 times - using the button for now")else D("the learned crate call did not work - back to pressing Open")
end end return er(true)end function E.snap()return{rules=K:GetAttribute("AutoRollRules"),stop=K:GetAttribute("AutoRollStop"),
on=K:GetAttribute("AutoRollOn"),main=K:GetAttribute("AutoRoll")}end E.cache={}function E.watchCache()E.cache=E.snap()
for BD,rR in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(K:GetAttributeChangedSignal(rR):Connect(function()E.cache[BD]=K:GetAttribute(rR)end))
end end function E.isOn()return K:GetAttribute("AutoRollOn")==true end function E.saw(BE,...)local g_=E.cache
local BF={m=BE,n=select("#",...),args={...},before={rules=g_.rules,stop=g_.stop,on=g_.on,main=g_.main}}task.delay(1.5,function()
if c.alive then pcall(E.learnOne,BF)end end)end function E.learnOne(ex)local aB,ey=E.snap(),ex.before local ha=(aB.rules~=ey.rules)or(aB.stop~=ey.stop)
local rS=(aB.on~=ey.on)or(aB.main~=ey.main)if not ha and not rS then return end local rT={}for rU=1,ex.n do local aQ=ex.args[rU]
local cu=type(aQ)if cu=="string"and aQ~=""and aQ==aB.rules then aQ={__slot="rules"}elseif cu=="string"and aQ~=""and ha and aQ==aB.stop and aB.stop~=ey.stop then aQ={__slot="stop"}
elseif cu=="table"then local rV={}for BG,de in pairs(aQ)do if type(de)=="table"or(type(de)=="userdata")then E.msg="Auto Roll sends something I cannot repeat"return
end rV[BG]=(type(de)=="string"and de~=""and de==aB.rules)and{__slot="rules"}or de end aQ=rV elseif cu~="string"and cu~="number"and cu~="boolean"and cu~="nil"then
if aQ==K then aQ={__slot="player"}else E.msg="Auto Roll sends something I cannot repeat"return end end rT[rU]=aQ
end local df={m=ex.m,n=ex.n,args=rT}if ha then local kV=false for BH=1,df.n do local ez=df.args[BH]if type(ez)=="table"and ez.__slot=="rules"then kV=true end
if type(ez)=="table"and not ez.__slot then for Kd,rW in pairs(ez)do if type(rW)=="table"and rW.__slot=="rules"then kV=true end end
end end if kV then E.rec.rules={df}else table.insert(E.rec.rules,df)if#E.rec.rules>60 then table.remove(E.rec.rules,1)end
end end if rS then if aB.on==true then E.rec.on=df else E.rec.off=df end e.AutoRoll=(aB.on==true)end if aB.rules and aB.rules~=""then e.ARrules,e.ARstop=aB.rules,aB.stop or""end
al.dirty=true E.msg=""D(("learned an Auto Roll %s message"):format(ha and"choices"or(aB.on and"on"or"off")))end
function E.resolve(dg)if type(dg)~="table"then return dg end if dg.__slot=="rules"then return e.ARrules~=""and e.ARrules or K:GetAttribute("AutoRollRules")end
if dg.__slot=="stop"then return e.ARstop~=""and e.ARstop or K:GetAttribute("AutoRollStop")end if dg.__slot=="player"then return K end
local rX={}for BI,BJ in pairs(dg)do rX[BI]=E.resolve(BJ)end return rX end function E.replay(rY,BK)local rZ=table.unpack or unpack
for Ke,eA in ipairs(BK)do local kW={}for r0=1,eA.n do kW[r0]=E.resolve(eA.args[r0])end E.replaying=true pcall(function()
if eA.m=="InvokeServer"then task.spawn(function()pcall(function()rY:InvokeServer(rZ(kW,1,eA.n))end)end)else rY:FireServer(rZ(kW,1,eA.n))end
end)E.replaying=false task.wait(0.25)end end function E.apply(r1,BL)if E.busy or not c.alive then return end E.busy=true
pcall(function()local r2=ag:FindFirstChild("Remotes")local kX=r2 and r2:FindFirstChild("AutoRollAction")if not kX then E.msg="this game has no AutoRollAction"return end
local bN=e.AutoRoll if bN and e.ARrules~=""and K:GetAttribute("AutoRollRules")~=e.ARrules then if#E.rec.rules==0 then
E.msg="pick your Auto Roll choices once in the game's menu so I can learn them"D(E.msg)else E.replay(kX,E.rec.rules)
if ap(function()return K:GetAttribute("AutoRollRules")==e.ARrules end,4)then D("Auto Roll choices put back")else
E.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"D(E.msg)end end end if bN==E.isOn()or(not bN and not BL)then return end
local hb=bN and E.rec.on or E.rec.off if not hb then local eB=bN and E.rec.off or E.rec.on local r3=eB~=nil for BM=1,eB and eB.n or 0 do
if type(eB.args[BM])=="boolean"then r3=false end end if r3 then hb=eB end end if not hb then E.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bN and"on"or"off")
D(E.msg)return end E.replay(kX,{hb})if ap(function()return E.isOn()==bN end,4)then E.msg=""D(("Auto Roll switched %s%s"):format(bN and"ON"or"OFF",r1 and(" ("..r1 ..")")or""))
else E.msg="Auto Roll did not switch - do it once in the game so I can relearn it"D(E.msg)end end)E.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local BN,BO=pcall(function()return K.UserId end)return BN and BO or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local BP,kY=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if BP and type(kY)=="table"and type(kY.Pets)=="table"then o.I=kY end return o.I end function o.order()if o.list then return o.list end
local bO=o.info()if not bO then return{}end local cv={}if type(bO.Order)=="table"and#bO.Order>0 then for Kf,r4 in ipairs(bO.Order)do if bO.Pets[r4]then cv[#cv+1]=r4 end end
else for BQ in pairs(bO.Pets)do cv[#cv+1]=BQ end table.sort(cv,function(BR,BS)return(bO.Pets[BR].price or 0)<(bO.Pets[BS].price or 0)end)
end o.list=cv return cv end function o.nice(r5,kZ)local r6=o.info()local r7=r6 and r6 .Pets[r5]return((kZ and kZ~="")and(kZ.." ")or"")..(r7 and r7 .displayName or tostring(r5))
end function o.data()local hc=K:GetAttribute("PetsData")if type(hc)~="string"then return nil end if hc==o.rawD then return o.lastD end
local BT,eC=pcall(function()return o.HS:JSONDecode(hc)end)eC=(BT and type(eC)=="table")and eC or nil o.rawD,o.lastD=hc,eC
return eC end function o.pen()return ag:FindFirstChild("PetMeadowSpawns")end function o.srv()return ak:GetServerTimeNow()end
function o.money()local k0=K:FindFirstChild("MoneyValue")if k0 and type(k0 .Value)=="number"then return k0 .Value end
return bj()or 0 end function o.wishes()local r8=o.pen()local r9=r8 and r8:GetAttribute("Wishes")local k1,r_={},o.srv()
if type(r9)~="string"then return k1 end local BU,sa=pcall(function()return o.HS:JSONDecode(r9)end)if BU and type(sa)=="table"then
for BV,k2 in pairs(sa)do if type(k2)=="number"and k2>r_ then k1[BV]=k2-r_ end end end return k1 end function o.call(...)
local sb=ag:FindFirstChild("Remotes")local sc=sb and sb:FindFirstChild("PetRequest")if not sc then return nil end
local sd=table.pack(...)local cw={}task.spawn(function()cw.ok,cw.v=pcall(function()return sc:InvokeServer(table.unpack(sd,1,sd.n))end)
cw.done=true end)local BW=z()while not cw.done and z()-BW<6 do task.wait(0.05)end if cw.done and cw.ok then return cw.v end
return nil end function o.want(BX)return e.Pets[BX]end function o.closeNaming(k3)local sf=pcall(function()local se=K:FindFirstChild("PlayerScripts")
local BY=se and se:FindFirstChild("Naming",true)require(BY).close()end)ah(0.5)if k3 .Visible then pcall(function()local sh=k3:FindFirstChild("NameBox",true)if sh then sh:ReleaseFocus()end end)
k3 .Visible=false sf=false end return sf end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local sj=K:FindFirstChildOfClass("PlayerGui")
local sk=sj and sj:FindFirstChild("MainGui")local hd=sk and sk:FindFirstChild("PetNameGui")if hd and hd.Visible then
ah(0.4)if hd.Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,hd)break end end ah(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local k4,sl,he=o.info(),o.pen(),o.data()
if not(k4 and sl and he)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local eD,k5=#(he.pets or{}),tonumber(he.maxOwned)or 60
local BZ,sm,eE=o.srv(),{},nil for Kg,aY in ipairs(sl:GetChildren())do sm[aY.Name]=true local cx,hf=aY:GetAttribute("Pet"),aY:GetAttribute("Variant")or""
local k6=cx and o.want(cx)if k6 and k6 .b and k4 .Pets[cx]and(not k6 .g or hf=="Big")and y.wantMore(cx,hf,he)and not aY:GetAttribute("A_"..o.uid)
and(tonumber(aY:GetAttribute("ExpiresAt"))or 0)>BZ+1 and z()>=(o.tryAt[aY.Name]or 0)then local eF,sn=o.nice(cx,hf),k4 .Pets[cx].price or 0
if eD>=k5 then eE=("%s is in the pen, but you have %d/%d pets"):format(eF,eD,k5)o.tryAt[aY.Name]=z()+15 elseif o.money()<sn then
eE=("%s is in the pen - need $%s"):format(eF,aF(sn))o.tryAt[aY.Name]=z()+5 else o.tryAt[aY.Name]=z()+8 local bP=o.call("adopt",aY.Name)
if type(bP)=="table"and bP.ok then eD=eD+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local B0=type(bP.pet)=="table"and bP.pet or{}
table.insert(o.recent,{id=tostring(B0 .id or("?"..z())),name=cx,variant=hf,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
D("ADOPTED "..eF)o.skipNaming()eE="adopted "..eF else local so=type(bP)=="table"and tostring(bP.reason or"no reason given")or"no answer"
D(("adopt %s failed: %s"):format(eF,so))eE="adopt failed: "..so if type(bP)=="table"and bP.bagFull then o.tryAt[aY.Name]=z()+60 end
end end end end for sp in pairs(o.tryAt)do if not sm[sp]then o.tryAt[sp]=nil end end o.buyMsg=eE or("watching the pen (%d/%d pets)"):format(eD,k5)
end function o.stacks()local sq=o.pen()local B1=sq and sq:GetAttribute("WishStacks")local B2,sr=pcall(function()return o.HS:JSONDecode(B1)end)
return(B2 and type(sr)=="table")and sr or{}end function o.stackTick(B3,B4)local hg=o.info()local ss=(type(hg.Wish)=="table"and tonumber(hg.Wish.maxStacks))or 1
if ss<=1 then return end local B5=o.stacks()o.stackTry=o.stackTry or{}for Kh,aZ in ipairs(o.order())do local su=o.want(aZ)
local hh=tonumber(B5[aZ])or 1 if su and su.w and B3[aZ]and hh<ss and y.wantMore(aZ,"",B4)and z()>=(o.stackTry[aZ]or 0)then
local B6,hi=pcall(hg.wishPrice,aZ,hh+1)hi=B6 and tonumber(hi)or((hg.Pets[aZ].price or 0)*2*3^hh)o.stackTry[aZ]=z()+5
if hi<=o.money()*0.01 then local sv=o.call("wish",aZ)if type(sv)=="table"and sv.ok then o.wishN=o.wishN+1 D(("WISH x%d on %s ($%s)"):format(hh+1,o.nice(aZ),aF(hi)))
else o.stackTry[aZ]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local hj=o.info()if not(hj and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bQ,k7,bR=o.wishes(),0,nil local B7=(type(hj.Wish)=="table"and hj.Wish.cashShare)or 2 local sx=o.data()for Ki,aE in ipairs(o.order())do
local sy=o.want(aE)if sy and sy.w and y.wantMore(aE,"",sx)then k7=k7+1 if not bQ[aE]and z()>=(o.wishTry[aE]or 0)then
local k8=tonumber(K:GetAttribute("PetWishCredits"))or 0 local k9=math.floor((hj.Pets[aE].price or 0)*B7)if k8<=0 and o.money()<k9 then
o.wishTry[aE]=z()+10 bR=("need $%s to wish for %s"):format(aF(k9),o.nice(aE))o.wishWhy[aE]=bR else o.wishTry[aE]=z()+3
local B8=k8>0 and"wishCredit"or"wish"local hk=o.call(B8,aE)if type(hk)=="table"and hk.ok then o.wishN,o.wishWhy[aE]=o.wishN+1,nil
D(("WISHED for %s (%s)"):format(o.nice(aE),k8>0 and"free wish"or("$"..aF(k9))))else local k_=type(hk)=="table"and tostring(hk.reason or"no reason given")or"no answer"
if k_:lower():find("already",1,true)then o.wishTry[aE]=z()+2 else D(("wish %s failed: %s"):format(o.nice(aE),k_))bR="wish failed: "..k_ end
end end end end end pcall(o.stackTick,bQ,sx)if not bR then for Kj,hl in ipairs(o.order())do local sz=o.want(hl)
if sz and sz.w and not bQ[hl]and o.wishWhy[hl]then bR=o.wishWhy[hl]break end end end if not bR then local dh={}
for Kk,eG in ipairs(o.order())do local sA=o.want(eG)local sB=tonumber(o.stacks()[eG])or 1 if sA and sA.w and bQ[eG]then dh[#dh+1]=("%s%s %dm"):format(o.nice(eG),sB>1 and(" x"..sB)or"",math.ceil(bQ[eG]/60))end
end local hm for Kl,hn in ipairs(o.order())do local sC=o.want(hn)if sC and sC.w and bQ[hn]and(not hm or bQ[hn]<hm)then hm=bQ[hn]end
end bR=k7==0 and"no pet has WISH ticked"or(#dh==0 and"running: none yet")or(#dh<=3 and("running: "..table.concat(dh,", ")))
or("%d running, the next one ends in %dm"):format(#dh,math.ceil((hm or 0)/60))end o.wishMsg=bR end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local la=o.data()return(la and la.teams)or{},la end function A.current(di)
di=di or o.data()if not di then return""end local sD={}for Km,B9 in ipairs(di.equipped or{})do sD[tostring(B9)]=true end
for Kn,sE in ipairs(di.teams or{})do local sF=sE.pets or{}local lb=#sF==#(di.equipped or{})if lb then for Ko,B_ in ipairs(sF)do if not sD[tostring(B_)]then lb=false break end end end
if lb then return sE.name end end return""end function A.equip(lc)local Ca,Cb=A.teams()local ld for Cc,Cd in ipairs(Ca)do if Cd.name==lc then ld=Cc break end end
if not ld then A.msg="no saved team called "..tostring(lc)return false end if A.current(Cb)==lc then return true end
for Kp=1,4 do local sG=o.call("teamEquip",ld)if type(sG)=="table"and sG.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(Ce)local sH=Ce:FindFirstChild("SquishyPlaceHolder")local sI=sH and sH:FindFirstChild("TimerGui")
local sJ=sI and sI:FindFirstChildWhichIsA("TextLabel",true)local le=sJ and sJ.Text if type(le)~="string"or le:find("-",1,true)then return nil end
local lf,sK,sL=le:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not lf then return nil end local sM=sL~=""and(tonumber(lf)*3600+tonumber(sK)*60+tonumber(sL))or(tonumber(lf)*60+tonumber(sK))
return sM>0 and sM or nil end function A.waxes()local eH={}local sN=c.plot and c.plot:FindFirstChild("WaxStations")
if not sN then return eH end local sO=o.srv()for Kq,a_ in ipairs(sN:GetChildren())do local lg=tonumber(a_:GetAttribute("PourEnd"))
local sP=a_:GetAttribute("PourOwner")if a_:GetAttribute("HasSquishy")and a_:GetAttribute("PourId")and(sP==nil or sP==o.uid)then
local lh=A.left(a_)local sQ=lh and(sO+lh)or((lg and lg>sO)and lg or nil)if sQ then local sR,sS=a_:FindFirstChild("SquishyPlaceHolder"),"?"
if sR then for Kr,sT in ipairs(sR:GetChildren())do if sT:IsA("Model")then sS=sT.Name break end end end local Cf=tostring(a_:GetAttribute("Helpers")or"")
local li=0 for Ks in Cf:gmatch("%d+")do li=li+1 end eH[#eH+1]={st=a_,ends=sQ,sure=lh~=nil,id=a_:GetAttribute("PourId"),name=sS,helps=li,
long=a_:GetAttribute("PourLong")==true}end end end table.sort(eH,function(Cg,Ch)return Cg.ends<Ch.ends end)return eH
end function A.glazeCount()local sU=ag:FindFirstChild("Remotes")local sV=sU and sU:FindFirstChild("EditStack")
if not sV then return nil end local Ci,eI=pcall(function()return sV:InvokeServer("State",nil)end)if not(Ci and type(eI)=="table"and type(eI.state)=="table")then return nil end
local lj,lk=0,{}for Kt,ho in ipairs(eI.state.entries or{})do if ho.glaze and ho.glaze~=""then lj=lj+1 lk[ho.glaze]=(lk[ho.glaze]or 0)+1 end
end return lj,lk,#(eI.state.entries or{}),eI.state.capacity end function A.finishedOne(hp,sW)A.finished=A.finished+1
task.wait(2)local ll,Cj,sX,Ck=A.glazeCount()if ll and sW and ll>sW then A.glazed=A.glazed+1 local lm={}for Cl,Cm in pairs(Cj)do lm[#lm+1]=Cl.." "..Cm end
D(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(am(ab(hp.name)),hp.st.Name,ll,table.concat(lm,", ")))
else D(("wax done on station %s: %s, no glaze%s"):format(hp.st.Name,am(ab(hp.name)),sX and(" (stack "..sX.."/"..tostring(Ck)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cy=o.srv()local aJ=A.glazeFor if aJ then local eJ=aJ.st local sY=eJ.Parent and eJ:GetAttribute("HasSquishy")and eJ:GetAttribute("PourId")==aJ.id
local sZ=sY and A.left(eJ)if sZ then aJ.ends=cy+sZ end if not sY then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aJ.id or"?"]then
A.done[aJ.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aJ.id or"?"]=true},1 end local Cn=aJ.before
task.spawn(function()pcall(A.finishedOne,aJ,Cn)end)end elseif aJ.ends-cy>e.GlazeLead*3+60 or cy>aJ.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aJ.id or"?"]=z()+120 D(("station %s is not finishing yet (%s left) - glaze team off again"):format(eJ.Name,A.clock(aJ.ends-cy)))
end end if e.TeamGlaze~=""and not A.glazeFor then local Co=A.speedRatio(e.TeamGlaze)for Ku,cz in ipairs(A.list)do
if cz.sure and(cz.ends-cy)*Co[cz.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cz.id or"?"]or 0)and not A.done[cz.id or"?"]then
A.glazeFor=cz task.spawn(function()cz.before=A.glazeCount()end)break end end end local aK,eK="",""local dj=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cy)
if dj and dj<-8 then q.snapAt,dj=nil,nil end if e.TeamGlaze~=""and dj and dj<=20 then aK,eK=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(dj)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aK,eK=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aK,eK=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aK,eK=e.TeamFull," - every station is busy"else aK=e.TeamNormal end A.want=aK local eL=A.current()A.cur=eL if aK~=""and eL~=aK and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aK)then D("team: "..aK..eK)else A.nextTry=z()+3 end end local ln=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eL~=""and eL or"(not a saved team)",(aK~=""and aK~=eL)and(" -> "..aK)or"",
ln and("in "..A.clock(ln.ends-cy).." (st "..ln.st.Name..")")or"- none running")end function A.clock(bS)bS=math.max(0,math.floor(bS))
if bS>=3600 then return("%d:%02d:%02d"):format(math.floor(bS/3600),math.floor((bS%3600)/60),bS%60)end return("%d:%02d"):format(math.floor(bS/60),bS%60)
end function A.allBusy()local Cp,Cq=ge()return Cq>0 and Cp==0 end function A.aboutToPlace()if not c.running then return false end
local s0=ad()if not(s0 and aP(s0))then return false end local Cr=ge()return Cr>0 end function A.mult(s1,Cs,s2)return{(1+s1)*(1+s2),(1+s1+Cs)*(1+s2)}end
function A.speedNow()local function lo(Ct)return tonumber(K:GetAttribute(Ct))or 0 end return A.mult(lo("PetWaxSpeed"),lo("PetLongWax"),lo("PetSocialWax"))
end function A.speedOf(Cu)local Cv,s3=A.teams()if not s3 then return nil end for Kv,s4 in ipairs(Cv)do if s4 .name==Cu then
local lp={}for Kw,Cw in ipairs(s4 .pets or{})do for Kx,s5 in ipairs(s3 .pets or{})do if tostring(s5 .id)==tostring(Cw)then lp[#lp+1]=s5 break end end
end local s6=y.caps()local s7,Cx=y.stats(lp)return A.mult(math.min(s7 .waxSpeed or 0,s6 .waxSpeed or 0.25),math.min(s7 .longWax or 0,s6 .longWax or 0.3),Cx.socialWax or 0)
end end return nil end function A.speedRatio(Cy)local s8,lq=A.speedNow(),A.speedOf(Cy)if not lq then return{1,1}end
return{s8[1]/lq[1],s8[2]/lq[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(Cz)local lr=o.info()if lr and type(lr.fuseNeed)=="function"then local CA,ls=pcall(lr.fuseNeed,K,Cz or"")
if CA and tonumber(ls)and tonumber(ls)>=2 then return tonumber(ls)end end if K:GetAttribute("FusePass")==true or K:GetAttribute("FusePass4")==true then return 3 end
if K:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(s9)
if s9=="Huge"then return y.needFor("")*y.needFor("Big")end if s9=="Big"then return y.needFor("")end return 1 end
function y.nextOf(s_)return(s_==""and"Big")or(s_=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lt=o.info()return(lt and type(lt.HugeCaps)=="table")and lt.HugeCaps or y.HCAPS end function y.cosmic()local lu=o.info()return(lu and type(lu.CosmicCaps)=="table")and lu.CosmicCaps or{StarWhale=0.1}end
function y.slots()local ta=o.data()return tonumber(ta and ta.slots)or(3+(tonumber(K:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lv=o.info()return(lv and type(lv.Caps)=="table")and lv.Caps or y.CAPS end function y.value(tb,cA)
local hq=o.info()local cB=hq and hq.Pets[tb]if not(cB and type(cB.boost)=="table")then return nil end local cC
if type(hq.boostValue)=="function"then local CB,CC=pcall(hq.boostValue,tb,(cA~=""and cA)or nil)cC=CB and tonumber(CC)or nil
end if not cC then local eM=cB.boost.value or 0 cC=eM if cA=="Big"or cA=="Huge"then local td=eM*(cA=="Huge"and 1.75 or 1.5)
cC=y.ROUND[cB.boost.kind]and math.max(eM+(cA=="Huge"and 2 or 1),math.floor(td+0.5))or td if cA=="Huge"and y.ROUND[cB.boost.kind]then cC=math.max(cC,math.max(eM+1,math.floor(eM*1.5+0.5))+1)end
end end return cB.boost.kind,cC,cB.boost.every end function y.stats(CD)local cD,lw,te,eN={},{},{},{}local CE=y.cosmic()
for Ky,dk in ipairs(CD)do local av,eO,tf=y.value(dk.name,dk.variant or"")if av then if dk.variant=="Huge"then te[y.CAPKEY[av]or av]=true end
if av:sub(1,6)=="social"then lw[av]=math.max(lw[av]or 0,eO)elseif av=="waxStir"or av=="cashGift"then cD[av]=(cD[av]or 0)+eO*60/(tf or 60)
elseif av=="luckyPull"then cD.luckyPull=(cD.luckyPull or 0)+eO/(tf or 10)else cD[av]=(cD[av]or 0)+eO if CE[dk.name]then eN[av]=eN[av]or{}eN[av][dk.name]=(eN[av][dk.name]or 0)+eO end
end end end return cD,lw,te,eN end function y.glazeGain(CG,hr)local eP,lx,Kz={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local CH=eP[1]+eP[2]+eP[3]local CI=tonumber(K:GetAttribute("GuildUpGlaze"))or 0 local dl={}for hs=1,3 do dl[hs]=eP[hs]+CG*eP[hs]/CH+(hs==1 and CI or 0)end
local ly={dl[1]*(1-hr),dl[2]*(1-hr)+dl[1]*hr,dl[3]+dl[2]*hr}return ly[1]*(lx[1]-1)+ly[2]*(lx[2]-1)+ly[3]*(lx[3]-1)
end function y.score(ht,CJ)local CK,CL,CM=y.caps(),y.hcaps(),y.cosmic()local hu,hv,CN,th=y.stats(CJ)local function lz(lA)return(CN[lA]and CL[lA])or CK[lA]or math.huge end
local function bs(hw)local lB,lC=hu[hw]or 0,lz(hw)local lD=math.min(lB,lC)if th[hw]and lB>lC then local lE=0 for CO,CP in pairs(th[hw])do lE=lE+math.min(CP,CM[CO]or 0)end
lD=lD+math.min(lB-lC,lE)end return lD end local CQ=(1+bs("income"))*(1+(hv.socialIncome or 0))*(1+math.min(hu.cashGift or 0,lz("cashGiftPerMinute"))/60)
local CS=1+bs("luck")+(hu.luckyPull or 0)+(hv.socialLuck or 0)local ti=CS*(1+bs("newFind"))*(1+bs("rollSpeed"))
local eQ=math.log(CQ)local CT=math.max(tonumber(K:GetAttribute("WaxStations"))or 18,1)local lF=(1+bs("waxSpeed")+bs("longWax"))*(1+(hv.socialWax or 0))
+math.min(hu.waxStir or 0,lz("waxStirPerMinute"))/60/CT local CU=1-(1-bs("headStart"))*(1-(hv.socialHeadStart or 0))
if ht=="farm"then return eQ+0.7*math.log(ti)+0.1*math.log(lF)end if ht=="full"then return eQ+0.4*math.log(lF)+0.02*math.log(ti)end
if ht=="glaze"then return y.glazeGain(bs("glaze"),bs("glazeUp"))+0.001*eQ end if ht=="wax"then return-math.log(1-0.5*CU)+0.001*eQ+0.001*math.log(lF)end
return eQ end function y.kinds(CV)local tj,lG={},{}for KA,eR in ipairs(CV)do local tk=eR.name.."|"..(eR.variant or"")
local bT=tj[tk]if not bT then bT={name=eR.name,variant=eR.variant or"",n=0,ids={}}tj[tk]=bT lG[#lG+1]=bT end bT.n=bT.n+1
bT.ids[#bT.ids+1]=eR.id end return lG end function y.bestKinds(tl,bU,CW,tm,tn)local aC,bV={},{}local function lH(CX)
local to,hx={},{}for CY,lI in ipairs(CX)do to[CY]=bU[lI]hx[lI]=(hx[lI]or 0)+1 end local eS=y.score(tl,to)if tm then for CZ,C0 in pairs(hx)do eS=eS+1e-7*math.min(C0,tm[CZ]or 0)end end
if tn then for C1,C2 in pairs(hx)do eS=eS-1e-8*C2*tn[bU[C1].variant]end end return eS end for KB=1,CW do local eT,lJ
for hy=1,#bU do if(bV[hy]or 0)<bU[hy].n then aC[#aC+1]=hy local tp=lH(aC)aC[#aC]=nil if not lJ or tp>lJ+1e-12 then eT,lJ=hy,tp end
end end if not eT then break end bV[eT]=(bV[eT]or 0)+1 aC[#aC+1]=eT if#bU>40 then task.wait()end end for KC=1,6 do
task.wait()local tq,tr=false,lH(aC)for lK=1,#aC do for dm=1,#bU do local hz=aC[lK]if dm~=hz and(bV[dm]or 0)<bU[dm].n then
aC[lK]=dm local ts=lH(aC)if ts>tr+1e-9 then bV[hz],bV[dm],tr,tq=bV[hz]-1,(bV[dm]or 0)+1,ts,true else aC[lK]=hz end
end end end if not tq then break end end local tt={}for C3,C4 in ipairs(aC)do tt[C3]=bU[C4]end return aC,y.score(tl,tt)
end function y.best(C5,C6,C7,hA)hA=hA or{}local lL=y.kinds(C6)local lM={}for tu,C8 in ipairs(lL)do for KD,C9 in ipairs(C8 .ids)do if hA[tostring(C9)]then lM[tu]=(lM[tu]or 0)+1 end end end
local C_,Da=y.bestKinds(C5,lL,C7,lM)local lN,lO={},{}for KE,Db in ipairs(C_)do local tv,eU=lL[Db],nil for KF,lP in ipairs(tv.ids)do if hA[tostring(lP)]and not lN[lP]then eU=lP break end end
if not eU then for KG,tw in ipairs(tv.ids)do if not lN[tw]then eU=tw break end end end lN[eU]=true lO[#lO+1]=tostring(eU)
end return lO,Da end function y.dream()local tx=o.info()if not(tx and type(tx.Pets)=="table")then return nil end
local lQ=y.slots()local ty=y.needFor("").."|"..y.needFor("Big").."|"..lQ.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==ty and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local Dh=pcall(function()local hB={}for KH,Dc in ipairs(o.order())do for KI,Dd in ipairs({"","Big","Huge"})do hB[#hB+1]={name=Dc,variant=Dd,n=lQ,ids={}}end
end local eV,lR={},{}for KJ,hC in ipairs(y.ROLES)do if e[hC[1]]~=""then local De,Df=y.bestKinds(hC[2],hB,lQ,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local lS,hD={},{}for KK,tz in ipairs(De)do lS[tz]=(lS[tz]or 0)+1 end for Dg,lT in pairs(lS)do local bW=hB[Dg]
eV[bW.name]=eV[bW.name]or{[""]=0,Big=0,Huge=0}eV[bW.name][bW.variant]=math.max(eV[bW.name][bW.variant],lT)hD[#hD+1]=(lT>1 and(lT.."x ")or"")..o.nice(bW.name,bW.variant)
end table.sort(hD)lR[#lR+1]={role=hC[2],team=e[hC[1]],names=hD,score=Df}end end y.dreamT,y.dreamTeams,y.dreamSig=eV,lR,ty
end)y.dreaming=false if not Dh then y.dreamSig=nil end return y.dreamT end function y.owned(hE)local tA,lU={},{}
for KL,Di in ipairs(hE and hE.arriving or{})do tA[tostring(Di)]=true end for KM,cE in ipairs(hE and hE.pets or{})do
if not tA[tostring(cE.id)]then lU[#lU+1]={id=tostring(cE.id),name=cE.name,variant=cE.variant or"",named=cE.named or(cE.nickname and cE.nickname~="")}
end end return lU end function y.have(tB,Dj,Dk)local ba={[""]=0,Big=0,Huge=0}local tC={}for KN,eW in ipairs(y.owned(Dj))do
tC[eW.id]=true if eW.name==tB and ba[eW.variant]then ba[eW.variant]=ba[eW.variant]+1 end end if Dk then for KO,dn in ipairs(o.recent or{})do
if dn.name==tB and not tC[dn.id]and z()-dn.at<20 and ba[dn.variant or""]then ba[dn.variant or""]=ba[dn.variant or""]+1 end
end end return ba,ba[""]+ba.Big*y.unit("Big")+ba.Huge*y.unit("Huge")end function y.goal(tD)local tE=e.Pets[tD]
if tE and tonumber(tE.f)==-1 then return nil,0 end local tF=y.dream()local eX=tF and tF[tD]if not eX then return nil,0 end
return eX,eX[""]+eX.Big*y.unit("Big")+eX.Huge*y.unit("Huge")end function y.wantMore(lV,KP,tG)if not tG then return true end
local tH=e.Pets[lV]if tH and tonumber(tH.f)==-1 then return true end local Dl,Dm=y.goal(lV)if not Dl then return true end
local KQ,Dn=y.have(lV,tG,true)return Dn<Dm+y.need()end function y.status(eY,tI)if not tI then return nil end local tJ=e.Pets[eY]
if tJ and tonumber(tJ.f)==-1 then return"KEEP: never fused"end local cF,tK=y.goal(eY)if not cF then return y.dream()and"in no best team: bought as ticked"or nil end
local lW,Do=y.have(eY,tI)local cG={}if cF.Huge>0 then cG[#cG+1]=("Huge %d/%d"):format(lW.Huge,cF.Huge)end if cF.Big>0 then cG[#cG+1]=("Big %d/%d"):format(lW.Big,cF.Big)end
if cF[""]>0 then cG[#cG+1]=("plain %d/%d"):format(lW[""],cF[""])end local Dp=y.blocked and y.blocked[eY]and(" | "..y.blocked[eY])or""
return("%s | %d/%d copies%s"):format(table.concat(cG," "),math.min(Do,tK),tK,Dp)end function y.wear(lX)local lY={}
for KR,Dq in ipairs(lX)do lY[tostring(Dq)]=true end for KS=1,3 do local dp=o.data()if not dp then return false end
for KT,tL in ipairs(dp.equipped or{})do if not lY[tostring(tL)]then o.call("unequip",tL)task.wait(0.3)end end
dp=o.data()local tM={}for KU,Dr in ipairs(dp.equipped or{})do tM[tostring(Dr)]=true end for KV,tN in ipairs(lX)do
if not tM[tostring(tN)]then o.call("equip",tN)task.wait(0.3)end end task.wait(0.4)dp=o.data()local lZ,tO=0,true
for KW,Ds in ipairs(dp.equipped or{})do lZ=lZ+1 if not lY[tostring(Ds)]then tO=false end end if tO and lZ==#lX then return true end
end return false end function y.saveTeam(tP,tQ)if not y.wear(tQ)then return false,"could not put the pets on"end
local Dt=A.teams()local cH for Du,Dv in ipairs(Dt)do if Dv.name==tP then cH=Du break end end local dq if cH then
dq=o.call("teamSave",cH)else dq=o.call("teamNew")if type(dq)=="table"and dq.ok and dq.index then cH=dq.index task.wait(0.3)
o.call("teamRename",{index=cH,name=tP})end end task.wait(0.4)local l0=o.data()local tR=l0 and l0 .teams and cH and l0 .teams[cH]
if not tR then return false,"the game did not save it"end local tS={}for KX,Dw in ipairs(tR.pets or{})do tS[tostring(Dw)]=true end
for KY,Dx in ipairs(tQ)do if not tS[tostring(Dx)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local Dy=o.srv()for KZ,Dz in ipairs(A.list or{})do if Dz.ends-Dy<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local eZ=o.data()if not eZ then return{}end local tT={}for K0,DA in ipairs(eZ.arriving or{})do tT[tostring(DA)]=true end
local e0={}for K1,hF in ipairs(eZ.pets or{})do if not tT[tostring(hF.id)]then e0[#e0+1]={id=tostring(hF.id),name=hF.name,variant=hF.variant or""}end
end local tU={}for K2,tV in ipairs(e0)do tU[tV.id]=tV end local tW=tonumber(eZ.slots)or 3 local l1,tX={},{}for K3,hG in ipairs(y.ROLES)do
local e1=e[hG[1]]if e1~=""and not tX[e1]then tX[e1]=true local l2,e2,tY={},{},false for K4,tZ in ipairs(eZ.teams or{})do
if tZ.name==e1 then for K5,DB in ipairs(tZ.pets or{})do local l3=tU[tostring(DB)]if l3 then l2[l3 .id]=true e2[#e2+1]=l3 else tY=true end
end end end local l4,t0=y.best(hG[2],e0,tW,l2)local t1=y.score(hG[2],e2)local t2=#l4==#e2 for K6,DC in ipairs(l4)do if not l2[DC]then t2=false end end
if not t2 and(tY or#e2<math.min(tW,#e0)or t0>t1+1e-4)then l1[#l1+1]={team=e1,role=hG[2],ids=l4,gain=t0-t1}end
end end return l1 end function y.rebuild(DD)local t3=y.plan()if#t3==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end A.editing,A.editingSince=true,z()
local hH=true local DH,DI=pcall(function()for K7,e3 in ipairs(t3)do local DE,DF=y.saveTeam(e3 .team,e3 .ids)local t4=o.data()
local l5={}for K8,DG in ipairs(e3 .ids)do for K9,l6 in ipairs(t4 and t4 .pets or{})do if tostring(l6 .id)==DG then l5[#l5+1]=o.nice(l6 .name,l6 .variant)end
end end if DE then D(("TEAM %s rebuilt (%s): %s"):format(e3 .team,DD or"pets changed",table.concat(l5,", ")))
else hH=false D(("TEAM %s: %s"):format(e3 .team,tostring(DF)))end end end)A.editing,A.nextTry=false,0 if not DH then hH=false D("TEAM BUILD ERR "..tostring(DI))end
y.builds=y.builds+1 y.buildMsg=hH and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return hH end function y.roleScores(t5)local bX={}for K_,t6 in ipairs(t5)do bX[#bX+1]=t6 .name..t6 .variant end
table.sort(bX)bX=table.concat(bX,",")y.rsCache=y.rsCache or{}if y.rsCache[bX]then return y.rsCache[bX]end local DJ,DK,l7=y.kinds(t5),y.slots(),{}
for La,l8 in ipairs(y.ROLES)do if e[l8[1]]~=""then local Lb,DL=y.bestKinds(l8[2],DJ,DK)l7[l8[2]]=DL end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bX]=l7 return l7 end function y.noLoss(t7,DM,DN,DO)local t8,e4={},{}
for Lc,DP in ipairs(DM)do t8[DP]=true end for Ld,t9 in ipairs(t7)do if not t8[t9 .id]then e4[#e4+1]=t9 end end
e4[#e4+1]={id="new",name=DN,variant=DO}local DQ,t_=y.roleScores(t7),y.roleScores(e4)local ua=false for l9,ub in pairs(DQ)do
if(t_[l9]or-math.huge)<ub-1e-6 then return false,l9 end if(t_[l9]or 0)>ub+1e-6 then ua=true end end return true,ua
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local e5=o.data()if not e5 then return end local uc=y.owned(e5)local hI,e6={},{}for Le,DR in ipairs(e5 .teams or{})do for Lf,DS in ipairs(DR.pets or{})do hI[tostring(DS)]=true end end
for Lg,DT in ipairs(e5 .equipped or{})do e6[tostring(DT)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for Lh,aL in ipairs(o.order())do
local hJ=y.goal(aL)if hJ then local l_=y.have(aL,e5)for Li,bt in ipairs({"Big",""})do local dr,ma=y.nextOf(bt),y.needFor(bt)
local DU=(bt=="Big"and l_.Huge<hJ.Huge)or(bt==""and l_.Big<hJ.Big+y.needFor("Big")*math.max(0,hJ.Huge-l_.Huge))
local e7={}for Lj,mb in ipairs(uc)do if mb.name==aL and mb.variant==bt then e7[#e7+1]=mb end end if DU and#e7>=ma and z()>=(y.failUntil[aL..bt]or 0)then
table.sort(e7,function(hK,hL)local ud=(e6[hK.id]and 4 or 0)+(hI[hK.id]and 2 or 0)+(hK.named and 1 or 0)local ue=(e6[hL.id]and 4 or 0)+(hI[hL.id]and 2 or 0)+(hL.named and 1 or 0)
if ud~=ue then return ud<ue end return hK.id<hL.id end)local cI,mc,uf={},{},false for ds=1,ma do cI[ds]=e7[ds].id
if e6[cI[ds]]then mc[#mc+1]=cI[ds]end if e6[cI[ds]]or hI[cI[ds]]then uf=true end end local DV,ug=y.noLoss(uc,cI,aL,dr)
if not DV then y.blocked[aL]=("%s waits: it would weaken the %s team now"):format(dr,y.ROLENAME[ug]or tostring(ug))
elseif uf and not y.quiet()then y.blocked[aL]=dr.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dr,o.nice(aL))
return else A.editing,A.editingSince=true,z()for Lk,DW in ipairs(mc)do o.call("unequip",DW)task.wait(0.3)end local hM=o.call("fuse",{ids=cI})
A.editing,A.nextTry=false,0 if type(hM)=="table"and hM.ok then y.fused=y.fused+1 y.dirtyAt=z()D(("FUSED %d %s -> %s"):format(ma,o.nice(aL,bt),o.nice(aL,dr)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aL,dr),os.date("%H:%M"))else y.failUntil[aL..bt]=z()+120 D(("fuse %s failed: %s"):format(o.nice(aL,bt),type(hM)=="table"and tostring(hM.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local uh=o.data()if not uh then return end local cJ={}for Ll,DX in ipairs(uh.pets or{})do cJ[#cJ+1]=tostring(DX.id)end
table.sort(cJ)cJ=table.concat(cJ,",")if cJ~=y.sig then y.sig,y.dirtyAt=cJ,z()end local DY=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if DY and not A.editing then local DZ=y.rebuild(y.dirtyAt and"pets changed"or"check")if DZ then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cK)return cK:IsA("ParticleEmitter")or cK:IsA("Trail")or cK:IsA("Beam")or cK:IsA("Fire")or cK:IsA("Smoke")
or cK:IsA("Sparkles")or cK:IsA("Light")end function d.muteOne(bu)if not e.Lite or not bu.Parent then return end
local hN=(bu:IsA("BillboardGui")and d.bb)or(d.isFx(bu)and d.fx)or nil if not hN or hN[bu]~=nil then return end
if hN==d.fx and d.gameLow and not bu:IsA("Beam")then return end hN[bu]=bu.Enabled if bu.Enabled then bu.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local md={}for Lm,D0 in ipairs({d.bb,d.fx})do for D1 in pairs(D0)do md[#md+1]=D1 end end local ui=os.clock()for D2,e8 in ipairs(md)do
if e.Lite and e8 .Parent and e8 .Enabled then local D3=d.bb[e8]~=nil and d.bb or d.fx D3[e8]=true e8 .Enabled=false
end if D2%200==0 and os.clock()-ui>0.002 then task.wait()ui=os.clock()end end end function d.lite(uj)e.Lite=uj
if uj then task.spawn(function()for D4,D5 in ipairs(ak:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,D5)
if D4%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=V(ak.DescendantAdded:Connect(function(me)
if e.Lite and(me:IsA("BillboardGui")or d.isFx(me))then d.queue[#d.queue+1]=me end end))end local mf=game:GetService("Lighting")
for Ln,e9 in ipairs(mf:GetChildren())do if e9:IsA("PostEffect")and e9 .Enabled and d.post[e9]==nil then d.post[e9]=true e9 .Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and mf.GlobalShadows or d.oldShadows mf.GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ak.Terrain.Decoration or d.oldDeco ak.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for Lo,D6 in pairs(d.watch)do pcall(function()D6:Disconnect()end)end
for uk,D7 in pairs(d.bb)do pcall(function()if uk.Parent then uk.Enabled=D7 end end)end for ul,D8 in pairs(d.fx)do pcall(function()if ul.Parent then ul.Enabled=D8 end end)end
for um in pairs(d.post)do pcall(function()if um.Parent then um.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local D9=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()D9 .GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ak.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(uo)
local D_,mg=pcall(function()return require(ag:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not D_ or type(mg)~="table"then return end if uo and not d.ceOld then d.ceOld={}for Lp,up in ipairs({"Fireworks","Confetti"})do
local hO=mg[up]if type(hO)=="table"and type(hO.Play)=="function"then d.ceOld[up]=hO.Play pcall(function()hO.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not uo and d.ceOld then for Ea,Eb in pairs(d.ceOld)do pcall(function()mg[Ea].Play=Eb end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local mh,hP for Lq,e_ in ipairs(getgc(false))do if type(e_)=="function"and(type(islclosure)~="function"or islclosure(e_))then
local Ec,uq,ur=pcall(debug.info,e_,"sn")if Ec and type(uq)=="string"and uq:find("ToppingCullHandler",1,true)then
if ur=="poll"then mh=e_ elseif ur=="retarget"then hP=e_ end end end end if not(mh and hP)then return nil end local Ed,hQ=pcall(debug.getupvalues,hP)
local us=Ed and type(hQ)=="table"and hQ[3]if type(us)~="function"or debug.info(us,"n")~="targetFor"or(hQ[1]~=nil and type(hQ[1])~="number")then return nil end
d.tc={poll=mh,re=hP}return d.tc end function d.tops(ut)local aR=d.topsFind()if not aR then return false end if ut and not aR.old then
local Ee,Ef=pcall(hookfunction,aR.poll,function()end)if not Ee then return false end aR.old=Ef pcall(debug.setupvalue,aR.re,1,-1000)
pcall(aR.re)elseif not ut and aR.old then local Eg=type(restorefunction)=="function"and pcall(restorefunction,aR.poll)
if not Eg then pcall(hookfunction,aR.poll,aR.old)end aR.old=nil pcall(aR.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(Eh)local uu=ak:FindFirstChild("Plots")local uv=os.clock()if Eh then for Lr,Ei in ipairs(uu and uu:GetChildren()or{})do
local uw=Ei:FindFirstChild("SkinProps")local ux=uw and uw:FindFirstChild("FairyLights")for Ls,uy in ipairs(ux and ux:GetChildren()or{})do
for Lt,fa in ipairs(uy:GetChildren())do if fa:IsA("BasePart")and(fa.Name=="Bulb"or fa.Name=="Wire")then d.lit[fa]=uy fa.Parent=nil end
end if os.clock()-uv>0.002 then task.wait()uv=os.clock()end end end for Lu,Ej in ipairs({"Leaderboards","ClanBoard"})do
local mi=ak:FindFirstChild(Ej)if mi then d.boardsOff[mi]=true mi.Parent=nil end end else for Ek,uz in pairs(d.lit)do pcall(function()if uz.Parent then Ek.Parent=uz end end)end
for uA in pairs(d.boardsOff)do pcall(function()if not uA.Parent then uA.Parent=ak end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(El)if El then local uB=ag:FindFirstChild("Remotes")local uC=uB and uB:FindFirstChild("SquishyRollAnimation")
if not uC or type(getconnections)~="function"then return end local Em,En=pcall(getconnections,uC.OnClientEvent)
for Lv,hR in ipairs(Em and En or{})do local mj=""pcall(function()mj=debug.info(hR.Function,"s")end)if type(mj)=="string"and mj:find("SquishyHandler",1,true)and not d.reel[hR]then
if pcall(function()hR:Disable()end)then d.reel[hR]=true end end end else for Eo in pairs(d.reel)do pcall(function()Eo:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(Ep)if not Ep then for Lw,Eq in pairs(d.quiet)do pcall(function()Eq:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function ml(Er,Es)local Et,Eu=pcall(getconnections,Er)
for Lx,hS in ipairs(Et and Eu or{})do local mm=""pcall(function()mm=debug.info(hS.Function,"s")end)local mn=hS.Function
if mn and type(mm)=="string"and mm:find(Es,1,true)and not d.quiet[mn]then if pcall(function()hS:Disable()end)then d.quiet[mn]=hS end
end end end local uD=ak:FindFirstChild("Plots")for Ly,hT in ipairs(uD and uD:GetChildren()or{})do if hT~=c.plot then
ml(hT:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uE,uF=hT:FindFirstChild("WaxStations"),hT:FindFirstChild("SquishyStack")
if uE then ml(uE.DescendantAdded,"LocalToppingsHandler")end if uF then ml(uF.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for uG,Ev in pairs(d.lit)do if not Ev:IsDescendantOf(game)then d.lit[uG]=nil pcall(function()uG:Destroy()end)end
end end function d.passText()local aw=function(Ew)return K:GetAttribute(Ew)end local mo={}local function bY(Ex,Ey)mo[#mo+1]=(Ex and"[x] "or"[  ] ")..Ey end
bY(aw("VIP")==true,"VIP: money x1.5, offline +50%")bY(aw("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(aw("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local Ez=aw("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(aw("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bY(aw("FastWax")==true or aw("SuperFastWax")==true,Ez.." (the farm times by the game's own timers)")local uH=(aw("FusePass")==true and"Fuse Pass")or(aw("FusePass4")==true and"Fuse Pass 4")or(aw("FusePass5")==true and"Fuse Pass 5")or nil
bY(uH~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uH or"Fuse pass",y.needFor(""),y.needFor("Big")))local hU=o.data()
local EA=tonumber(hU and hU.maxOwned)or 60 bY(aw("PetInventory50")==true or aw("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(hU and#(hU.pets or{})or 0,EA,(aw("PetInventory50")==true and aw("PetInventory100")==true)and" (both bag passes)"or""))
local uI=tonumber(aw("PetEquipBought"))or 0 bY(uI>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uI))
local uJ=tonumber(aw("PetWishCredits"))or 0 if uJ>0 then bY(true,("%d free wishes: used before cash"):format(uJ))end
local uK=tonumber(aw("FinishAllCredits"))or 0 if uK>0 then bY(true,("%d finish-all credits (yours to use)"):format(uK))end
return table.concat(mo,"\n")end function d.extras(hV)pcall(d.quietPlots,hV and c.plot~=nil)pcall(d.fxPatch,hV)
pcall(d.tops,hV)pcall(d.lights,hV)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uL)
e.HideHud=uL local mp=K:FindFirstChildOfClass("PlayerGui")if not mp then return end if uL then for Lz,fb in ipairs(mp:GetChildren())do
if fb:IsA("ScreenGui")and not d.MINE[fb.Name]and fb.Enabled then d.hud[fb]=true fb.Enabled=false end end if not d.hudConn then
d.hudConn=V(mp.ChildAdded:Connect(function(fc)if e.HideHud and fc:IsA("ScreenGui")and not d.MINE[fc.Name]then
task.defer(function()if e.HideHud and fc.Enabled then d.hud[fc]=true fc.Enabled=false end end)end end))end else
for uM in pairs(d.hud)do pcall(function()if uM.Parent then uM.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mq)e.FpsCap=mq local uN=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uN then return false end return pcall(uN,mq==0 and 60 or mq)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(aq)if aq:IsA("BasePart")or aq:IsA("Decal")or aq:IsA("Texture")then if aq.Transparency<1 then d.unseen[aq]=aq.Transparency aq.Transparency=1 end
elseif aq:IsA("BillboardGui")or aq:IsA("SurfaceGui")or aq:IsA("ParticleEmitter")or aq:IsA("Beam")or aq:IsA("Trail")or aq:IsA("Light")or aq:IsA("Fire")or aq:IsA("Smoke")or aq:IsA("Sparkles")then
if aq.Enabled then d.unseen[aq]=true aq.Enabled=false end end end function d.notMine(EB)return e.HideMine or(c.plot and not EB:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(hW)
local mr=hW.Parent local ms=mr and mr.Name=="SquishyStack"and mr.Parent if ms and ms~=c.plot and c.plot and ms.Parent==c.plot.Parent and not d.dropSeen[hW]then
d.dropSeen[hW]=true d.dropQ[#d.dropQ+1]={hW,z()+3}end end function d.dropScan()local uO=c.plot and c.plot.Parent
if not(e.HideBases and uO)then return end for LA,uP in ipairs(uO:GetChildren())do local uQ=uP~=c.plot and uP:FindFirstChild("SquishyStack")
for LB,EC in ipairs(uQ and uQ:GetChildren()or{})do d.dropIt(EC)end end end function d.dropStep(ED)local mt=d.dropQ
while d.dropI<=#mt and os.clock()-ED<0.003 do local mu=mt[d.dropI]if mu[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mu[1].Parent then pcall(function()mu[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mt then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mv=os.clock()local fd=d.queue if e.Lite and fd and#fd>0 then d.muteI=d.muteI or 1
while d.muteI<=#fd and os.clock()-mv<0.0015 do pcall(d.muteOne,fd[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#fd then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mv)end local hX=d.hideQ if d.hideI>#hX then return end while d.hideI<=#hX and os.clock()-mv<0.004 do
local mw=hX[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mw.Parent and d.notMine(mw)then pcall(d.hideOne,mw)end
end if d.hideI>#hX then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(uR)if e.HideBases then d.bases(false)end
e.HideMine=uR==2 if uR>0 then d.bases(true)end end function d.bases(uS)e.HideBases=uS local mx=ak:FindFirstChild("Plots")
if not mx then return end if uS then task.spawn(function()local my=0 for LC,hY in ipairs(mx:GetChildren())do local uT=hY~=c.plot and c.plot and hY:FindFirstChild("SquishyStack")
for LD,EE in ipairs(uT and uT:GetChildren()or{})do d.dropIt(EE)end if hY~=c.plot or e.HideMine then for LE,EF in ipairs(hY:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,EF)my=my+1 if my%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=V(mx.DescendantAdded:Connect(function(dt)if e.HideBases and d.notMine(dt)then
pcall(d.hideOne,dt)d.hideQ[#d.hideQ+1]=dt if dt.Parent and dt.Parent.Name=="SquishyStack"then d.dropIt(dt)end
end end))end else for mz,uU in pairs(d.unseen)do pcall(function()if not mz.Parent then return end if type(uU)=="number"then mz.Transparency=uU else mz.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(uV)e.NoRender=uV pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not uV)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local EG=game:GetService("RunService")local mA=0 for LF,EH in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local EI,uW=pcall(function()return EG[EH]end)local uX,mB=false,nil if EI and uW then uX,mB=pcall(getconnections,uW)end
if uX and type(mB)=="table"then for LG,hZ in ipairs(mB)do local mC=""pcall(function()local uY=getfenv(hZ.Function).script mC=uY and uY:GetFullName()or""end)
if mC~=""then for LH,EJ in ipairs(d.CALM)do if mC:find(EJ,1,true)then local mD=hZ.Function if mD and not d.calmedF[mD]and pcall(function()hZ:Disable()end)then
d.calmedF[mD]=true d.calmed[#d.calmed+1]=hZ mA=mA+1 end break end end end end end end if#d.calmed>200 then local mE={}for EK=#d.calmed-49,#d.calmed do mE[#mE+1]=d.calmed[EK]end d.calmed=mE
end return mA end function d.walker()local EL,mF=pcall(function()return require(K.PlayerScripts.LocalScript.PetHandler.Walker)end)
return(EL and type(mF)=="table"and type(mF.walkTo)=="function")and mF or nil end function d.walkers(EM)local uZ={}
local EN,EO=pcall(debug.getupvalues,EM.destroy)for LI,u0 in ipairs(EN and EO or{})do if type(u0)=="table"then
for h0 in pairs(u0)do if type(h0)=="table"and rawget(h0,"model")~=nil and rawget(h0,"position")~=nil then uZ[h0]=true end end
end end return uZ end function d.walkPatch(u1)local fe=d.walker()if not fe then return 0 end if u1 and not d.wkOld then
local u2=fe.walkTo d.wkOld=u2 fe.walkTo=function(ff,fg,EP,mG)local EQ=fg~=nil and pcall(function()return fg.X+fg.Z end)
if not e.Calm or not EQ then return u2(ff,fg,EP,mG)end ff.target,ff.onArrive=nil,nil pcall(function()ff:teleport(fg)ff:render(0)end)
if mG then task.spawn(mG)end end elseif not u1 then if d.wkOld then fe.walkTo,d.wkOld=d.wkOld,nil end return 0
end local mH=0 for aM in pairs(d.walkers(fe))do if aM.target and not aM.destroyed then local u3=aM.model and aM.model:FindFirstChild("Body")and aM.model.Body:FindFirstChild("PetBillboard")
local u4=u3 and u3:FindFirstChild("TimerLabel",true)if u4 and tostring(u4 .Text):find("'s plot!",1,true)then pcall(function()aM:destroy()end)
pcall(function()aM.model:Destroy()end)else local ER,u5=aM.target,aM.onArrive aM.target,aM.onArrive=nil,nil pcall(function()aM:teleport(ER)aM:render(0)end)
if u5 then task.spawn(u5)end end mH=mH+1 end end return mH end function d.calm(u6)e.Calm=u6 if u6 then local ES=d.calmScan()
local mI=0 pcall(function()mI=d.walkPatch(true)end)D(("NO ANIMATIONS: %d of the game's animation loops switched off%s"):format(ES,mI>0 and(", "..mI.." stuck pet walks cleared")or""))
else for LJ,ET in ipairs(d.calmed)do pcall(function()ET:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
pcall(d.walkPatch,false)end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end
if J.arPaused then pcall(J.resume,"script stopped")end pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(u7)if c.rejoining then return end D("REJOIN this server ("..u7 ..")")
pcall(gh)if c.autoload then pcall(gI,c.autoload)end ql()local EU=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,K)
end)task.delay(25,function()if c.alive then ea(u7 ..", same server failed")end end)return EU end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=K:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local u8=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if u8 then for LK,EW in ipairs(u8:GetChildren())do local u9=EW:FindFirstChild("SquishyPlaceHolder")local cL=u9 and u9:FindFirstChild("TimerGui")
if cL and cL:IsA("BillboardGui")then if d.bb[cL]==nil then pcall(d.muteOne,cL)elseif cL.Enabled then d.bb[cL]=true cL.Enabled=false end
end end end local EX,du=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if EX and type(du)=="number"then
d.mem=du d.memPeak=math.max(d.memPeak,du)if(e.MemLimit or 0)>0 and du>e.MemLimit then d.over=(d.over or 0)+((du>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(du,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()D(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mJ(h1)if type(h1)~="string"then return false end
h1=h1:lower()for LL,EY in ipairs(c.sellWords)do if h1:find(EY,1,true)then return true end end return false end
local function EZ()local u_=ag:FindFirstChild("Remotes")local mK=u_ and u_:FindFirstChild("SellSquishy")if not(mK and mK:IsA("RemoteEvent"))then return false end
if not pcall(function()mK:FireServer()end)then return false end return ap(function()return ad()==nil end,1.5)
end local function E0()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local va=ar()local vb=va and va.HumanoidRootPart.Position local fh,vc for LM,dv in ipairs((c.plot or ak):GetDescendants())do
if dv:IsA("ProximityPrompt")and(mJ(dv.ActionText)or mJ(dv.ObjectText)or mJ(dv.Name))then local vd=pg(dv)local mL=(vd and vb)and(vd-vb).Magnitude or 1e9
if mL<=400 and(not fh or mL<vc)then fh,vc=dv,mL end end end c.sellSpot=fh c.noSellSpot=(fh==nil)return fh end
local function ve()local mM=ad()if not mM then c.holding=false return false end if aP(mM)then return false end
local mN=am(ab(mM))if EZ()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=z()+2.5,0
D("SOLD "..mN)return true end local dw=E0()if dw then local vf=dZ(dw)if vf then co(vf,dw)local vg=ad()if vg and not aP(vg)then
local E1,E2=eg(dw,function()return ad()==nil end,function()return dw.Enabled end)if E1 then c.sold,c.holding,c.sellFails=c.sold+1,false,0
D(("SOLD %s at %s via %s"):format(mN,gc(dw),E2))return true end end end end c.sellFails=c.sellFails+1 D("could not sell "..mN.." ("..c.sellFails..")")
return false end local E3={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function E4(dx)local h2=gc(dx):lower()for LN,E5 in ipairs(E3)do if h2:find(E5,1,true)then return 0 end end
local bc,as=dx.Name:lower(),0 local function a0(E6,E7)return E6:find(E7,1,true)~=nil end if a0(bc,"collect")then as=as+60 end
if a0(bc,"cash")or a0(bc,"money")then as=as+45 end if a0(bc,"income")or a0(bc,"claim")then as=as+35 end if a0(bc,"coin")or a0(bc,"earn")or a0(bc,"green")then as=as+20 end
if bc=="pad"or bc=="touch"then as=as+25 end if as==0 and(a0(h2,"collect")or a0(h2,"cash")or a0(h2,"money"))then as=25 end
if as==0 then return 0 end local fi=dx.Color if fi.G>0.5 and fi.G>fi.R*1.4 and fi.G>fi.B*1.4 then as=as+15 end
if math.min(dx.Size.X,dx.Size.Y,dx.Size.Z)<2 then as=as+5 end return as end local function E8()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local h3,fj,mO={},nil,29 for LO,h4 in ipairs(c.plot:GetDescendants())do
if h4:IsA("BasePart")then local h5=E4(h4)if h5>0 then h3[#h3+1]={s=h5,p=h4}if h5>mO then fj,mO=h4,h5 end end end
end table.sort(h3,function(E9,E_)return E9 .s>E_.s end)c.padCands,c.padPart=h3,fj if fj then D("collect pad: "..gc(fj).." (score "..mO..")")end
return fj end local mP="SAB_pad_v1.txt"local function Fa(Fb)if type(writefile)=="function"then pcall(writefile,mP,table.concat({Fb:GetComponents()},","))end
end local function Fc()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Fd,vh=pcall(function()if isfile(mP)then return readfile(mP)end end)
if not Fd or type(vh)~="string"then return nil end local h6={}for Fe in vh:gmatch("[^,]+")do h6[#h6+1]=tonumber(Fe)end
if#h6==12 then return CFrame.new(unpack(h6))end end local function Ff(mQ,h7,Fg)local Fh=c_(mQ)local mR=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local a1=(mR and mR:IsA("BasePart"))and(mR.Position-h7)or Vector3 .new(1,0,0)a1=Vector3 .new(a1 .X,0,a1 .Z)if a1 .Magnitude<0.05 then a1=Vector3 .new(1,0,0)end
a1=a1 .Unit for Fi=0,7 do local h8=Fi*math.pi/4 local Fj=Vector3 .new(a1 .X*math.cos(h8)-a1 .Z*math.sin(h8),0,a1 .X*math.sin(h8)+a1 .Z*math.cos(h8))
local h9=h7+Fj*(Fg+5)local mS=gQ(h9 .X,h7 .Y,h9 .Z)if mS and math.abs(mS.Y-h7 .Y)<8 then aD(mQ,Vector3 .new(h9 .X,mS.Y+Fh,h9 .Z))
if kg(mQ,0.7)then return true end end end return false end local function Fk()c.lastCollect=z()local fk=ar()if not fk then return end
local vi,Fl=fk.HumanoidRootPart,c_(fk)local fl,vj,fm,mT=nil,4,nil,"?"local mU=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and mU and mU:IsA("BasePart")then fl,mT=(mU.CFrame*c.manualPad).Position,"manual pad"else local bv=E8()
if bv then fl=Vector3 .new(bv.Position.X,bv.Position.Y+bv.Size.Y/2+Fl,bv.Position.Z)vj,fm,mT=math.max(bv.Size.X,bv.Size.Z)/2,bv,bv.Name
end end if not fl then D("COLLECT: pad not found - stand on it and tap SET PAD")return end local mV=bj()aD(fk,fl)
if fm and type(firetouchinterest)=="function"then pcall(firetouchinterest,vi,fm,0)end ah(e.PadDwell)if fm and type(firetouchinterest)=="function"then pcall(firetouchinterest,vi,fm,1)end
ah(0.5)c.collected=c.collected+1 local mW=bj()D(("COLLECTED (%s) %s"):format(mT,(mV and mW and mW>mV)and("+$"..aF(mW-mV))or"no cash change seen"))
Ff(fk,fl,vj)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.mods()if q.si and z()-q.modAt<120 then return true end
local vk=ag:FindFirstChild("Modules")if not vk then return false end local function mX(Fm)local vl=vk:FindFirstChild(Fm)
if not vl then return nil end local Fn,vm=pcall(require,vl)return(Fn and type(vm)=="table")and vm or nil end q.si,q.arm,q.ci=mX("SquishyInfo"),mX("AutoRollRules"),mX("CrateInfo")
q.modAt=z()if not q.si then return false end local mY={}if q.arm and type(q.arm.tierOf)=="table"then for mZ in pairs(q.arm.tierOf)do
local h_=q.si[mZ]if type(h_)=="table"and h_.rarity~="Limited"and not h_.incomeType and not h_.hiddenAfter then mY[ab(mZ)]=mZ end
end end q.roll=mY local ia={}for Fo,Fp in pairs(mY)do local fn=q.si[Fp]if type(fn)=="table"and type(fn.income)=="number"and not fn.incomeType then
ia[#ia+1]={k=Fo,inc=fn.income,pr=tonumber(fn.price)or 0}end end table.sort(ia,function(m0,m1)if m0 .inc~=m1 .inc then return m0 .inc>m1 .inc end return m0 .pr>m1 .pr end)
q.order=ia local ib,m2,m3 local Fq=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for Fr,m4 in pairs(Fq)do
local m5=type(m4)=="table"and tonumber(m4 .price)if m5 and(not m2 or m5>m2)then ib,m2,m3=Fr,m5,m4 .title end end
q.bestCrate,q.bestCrateName=ib and M.key(ib),ib q.bestCrateTitle=m3 and M.key(m3)or nil return true end function q.rank(Fs)
local Ft,Fu=pcall(function()return q.arm.rankOf(Fs)end)return(Ft and tonumber(Fu))or 0 end function q.loadDisc(vn)
if type(vn)~="table"then return end local vo={}for Fv,Fw in pairs(vn)do if Fw then vo[ab(tostring(Fv))]=true end end
q.disc,q.discAt=vo,z()end function q.fetch()q.discAt=z()local vp=ag:FindFirstChild("Remotes")local vq=vp and vp:FindFirstChild("GetSquishiesDiscovered")
if not vq then return end local Fx,Fy=pcall(function()return vq:InvokeServer()end)if Fx then q.loadDisc(Fy)end
end function q.scanWax()local m6={}local vr=c.plot and c.plot:FindFirstChild("WaxStations")if vr then for LP,vs in ipairs(vr:GetChildren())do
local vt=vs:FindFirstChild("SquishyPlaceHolder")if vt and vs:GetAttribute("HasSquishy")then for LQ,vu in ipairs(vt:GetChildren())do if vu:IsA("Model")then m6[ab(vu.Name)]=true end end
end end end for vv,Fz in pairs(q.placedAt)do if z()-Fz<20 then m6[vv]=true else q.placedAt[vv]=nil end end q.waxing=m6
end function q.compute()local vw,m7,m8={},0,0 if q.disc then for m9 in pairs(q.roll or{})do if not q.disc[m9]then
if q.waxing[m9]then m8=m8+1 else vw[m9],m7=true,m7+1 end end end end q.need,q.nNeed,q.nWax=vw,m7,m8 local vx,m_={},e.Best or 0
local na=(m_==4)and q.stackMin or nil for FA,vy in ipairs(q.order)do if(na and vy.inc>na)or(not na and FA<=(m_==4 and 1 or m_))then vx[vy.k]=true end
end q.best=vx end function q.readStack()q.stackAt=z()local vz=ag:FindFirstChild("Remotes")local vA=vz and vz:FindFirstChild("EditStack")
if not vA then return end local FB,dy=pcall(function()return vA:InvokeServer("State",nil)end)if not(FB and type(dy)=="table"and type(dy.state)=="table"and type(dy.state.entries)=="table")then return end
local ic for LR,vB in ipairs(dy.state.entries)do local fo=type(vB)=="table"and q.si and q.si[tostring(vB.name)]
if type(fo)=="table"and type(fo.income)=="number"and not fo.incomeType and(not ic or fo.income<ic)then ic=fo.income end
end q.stackMin=ic q.stackFull=#dy.state.entries>=(tonumber(dy.state.capacity)or 100)end function q.want(nb)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[nb]then return true end elseif e.Targets[nb]then return true end return e.AutoIndex==true and q.need[nb]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(FC)local fp=ab(FC)q.placedAt[fp],q.waxing[fp]=z(),true if q.need[fp]then q.need[fp],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
D(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(am(fp)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fq,fr={},{}for FD,FE in pairs(q.roll or{})do if q.want(FD)then fq[FE]=true end end
for vC,nc in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if M.wanted(vC)or(type(nc)=="table"and type(nc.title)=="string"and M.wanted(nc.title))then fr[vC]=true end
end if not next(fq)and not next(fr)then return nil end if q.arm and type(q.arm.encode)=="function"then local FF,vD=pcall(q.arm.encode,{rarities={},butters=fq,crates=fr,index=false})
if FF and type(vD)=="string"then return vD end end local function vE(FG)local ie={}for FH in pairs(FG)do ie[#ie+1]=FH end table.sort(ie)return table.concat(ie,",")end
local fs="adv:"if next(fq)then fs=fs..";butters:"..vE(fq)end if next(fr)then fs=fs..";crates:"..vE(fr)end return fs
end function q.canon(FI)local ig={}for vF in tostring(FI or""):gmatch("[^;]+")do local nd,vG=vF:match("^(%a+):(.*)$")
if not nd then nd,vG="r",vF:gsub("^adv:","")end for FJ in vG:gmatch("[^,]+")do ig[#ig+1]=nd.."="..FJ end end table.sort(ig)
return table.concat(ig,"|")end function q.sync(FK)if K:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cM=q.rulesNow()if not cM or#cM>1900 then return end if q.canon(K:GetAttribute("AutoRollRules"))==q.canon(cM)then q.fails=0 return end
if not FK and z()-q.sentAt<4 then return end local vH=ag:FindFirstChild("Remotes")local vI=vH and vH:FindFirstChild("AutoRollAction")
if not vI then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 D("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()E.replaying=true pcall(function()vI:FireServer("Rules",cM)end)E.replaying=false e.ARrules=cM
local ih,ii=0,0 for LS in(cM:match("butters:([^;]*)")or""):gmatch("[^,]+")do ih=ih+1 end for LT in(cM:match("crates:([^;]*)")or""):gmatch("[^,]+")do ii=ii+1 end
local vJ=ih.."/"..ii if q.told~=vJ then q.told=vJ D(("auto roll now stops on %d butters and %d crates"):format(ih,ii))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aS={}if e.AutoIndex then aS[#aS+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local ft=0 for LU in pairs(q.best)do ft=ft+1 end
aS[#aS+1]=ft==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(ft,ft==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aS[#aS+1]="best: "..am(q.order[1].k)end if e.BestCrate and q.bestCrateName then aS[#aS+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if P.got>0 then aS[#aS+1]="shower: "..P.got end q.msg=#aS>0 and table.concat(aS," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(FL)q.feed[#q.feed+1]=os.date("%H:%M ")..FL if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vK,ay,ij)if vK~="Effect"then q.feedAdd(tostring(vK)..(ay~=nil and(": "..tostring(ay):sub(1,80))or""))
return end if ay~="ShowerTaken"and ay~="GoalPoint"then q.feedAdd(tostring(ay))end if ay=="Shower"then P.add(ij)return end
if ay=="ShowerTaken"then P.gone(ij)return end if ay=="ShowerClear"then P.drops={}return end if ay=="WaxGlow"then
local ne=type(ij)=="table"and tonumber(ij.SnapAt)if ne then q.snapAt=ne D(("ADMIN: every wax finishes in %ds%s"):format(math.floor(ne-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end ay=tostring(ay)ck("Admin "..ay)if ay~="GoalPoint"and z()-(q.heard[ay]or-100)>30 then q.heard[ay]=z()
D("ADMIN: "..ay)end end P.drops,P.tried,P.got,P.miss={},{},0,0 function P.add(nf)if type(nf)~="table"or type(nf.Pieces)~="table"then return end
for LV,a2 in pairs(nf.Pieces)do if type(a2)=="table"and a2 .Id~=nil and a2 .Position~=nil then P.drops[a2 .Id]={id=a2 .Id,butter=tostring(a2 .Butter or"?"),rar=tostring(a2 .Rarity or"?"),star=a2 .Star==true,
pos=a2 .Position,opens=tonumber(a2 .OpensAt)or 0,ends=tonumber(a2 .ExpiresAt)or 0}end end end function P.gone(fu)
if type(fu)~="table"or fu.Id==nil then return end P.drops[fu.Id]=nil if tonumber(fu.UserId)==o.uid then P.mine=fu.Id end
end function P.pick()local ng=o.srv()local nh,vL for vM,cN in pairs(P.drops)do if ng>=cN.ends-0.3 then P.drops[vM]=nil
elseif ng>=cN.opens-0.2 and(P.tried[vM]or 0)<3 then local vN=(aP(cN.butter)and 1e6 or 0)+(cN.star and 1e5 or 0)+q.rank(cN.rar)*100-(cN.ends-ng)
if not nh or vN>vL then nh,vL=cN,vN end end end return nh end function P.due()return e.Shower and c.running and next(P.drops)~=nil and not ad()and P.pick()~=nil
end function P.grab()local aT,ni=P.pick(),ar()if not(aT and ni)then return end P.tried[aT.id]=(P.tried[aT.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aD(ni,aT.pos+Vector3 .new(0,c_(ni)+0.5,0))ap(function()return P.mine==aT.id or ad()~=nil or not P.drops[aT.id]end,1.5)
if P.mine==aT.id or ad()then P.got,P.drops[aT.id]=P.got+1,nil D(("GRABBED %s [%s]%s from the admin shower"):format(am(ab(aT.butter)),aT.rar,aT.star and" (star)"or""))
elseif not P.drops[aT.id]then P.miss=P.miss+1 end end local fv local function vO()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 D("trying again after being stopped for 5 minutes")fv(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ar()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bE(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local nj,vP=ge()
local ik=ad()if ik then local dz=am(ab(ik))if not aP(ik)then local nk=(aa.gift and ab(aa.gift)==ab(ik)and z()-aa.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(dz,nk),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(dz,nk),"bad"end return"sell",("selling %s (%s)"):format(dz,nk),"warn"
end if nj<1 then return nil,("holding %s - 0 free stations"):format(dz),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(dz),"wait"end
return"place",("waxing %s (%d free)"):format(dz,nj),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local nl=c.plot:FindFirstChild("CrateStand")if nl then for LW,fw in ipairs(nl:GetDescendants())do
if fw:IsA("ProximityPrompt")and fw.Enabled and kx(fw)then local bw=fw.ObjectText if bw==""then bw=c3(nl,"TitleLabel")or""end
if bw~=""and M.wanted(bw)then local FM=ga(bw):gsub("crate$","")local vQ for vR in pairs(ae.members)do if ga(vR)==FM then vQ=vR end end
j.waiting,j.at,j.title,j.prompt=true,z(),bw,fw j.data={name=(bw:gsub("%s","")),rarity=vQ,title=bw}D(bw.." found waiting on your stand")
end break end end end end local vS=M.wanted(j.data and j.data.name)or M.wanted(j.title)if e.Crates and(j.on or j.waiting)and vS then
local a3=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a3),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 D("could not press the "..a3 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a3),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a3),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a3,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a3),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a3,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a3,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil D("trying the "..a3 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a3),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a3,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not vS then local vT=j.title..tostring(j.rolledAt)if j.told~=vT then j.told=vT D(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and M.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if nj<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(vP,vP),"wait"
end local nm=pw()if not nm then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dA=cj()
if dA and qU(dA.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dA.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dA.name),"bad"end if not rc()then return nil,("%s rolled - waiting for it to land on the stand"):format(dA.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dA.name),"ok"end local bZ=ke()if bZ.state~="match"then
c.matchSince=nil if bZ.state=="skip"and not nm.Enabled then return nil,bZ.text.." (sold out)","idle"end return nil,bZ.text,bZ.level
end if not nm.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local fy=z()if fy<c.noCashUntil then
local vU,FN=ec()if vU then return nil,("cash short: have $%s, price ~$%s"):format(aF(vU),aF(FN)),"bad"end return nil,(ec()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aF(bj()),math.ceil(c.noCashUntil-fy)),ec()and"bad"or"wait"end if fy-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or fy local vV=fy-c.matchSince if vV<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bZ.shown,vV),"ok"end
return"buy",("buying %s via %s"):format(bZ.shown,bZ.src),"ok"end d.DEPTH=11 function d.pinTick()local vW=d.hold
if not vW then return end local nn=K.Character local no=nn and nn:FindFirstChild("HumanoidRootPart")if not no then return end
no.CFrame=vW no.AssemblyLinearVelocity=Vector3 .new(0,0,0)for LX,il in ipairs(nn:GetChildren())do if il:IsA("BasePart")and il.CanCollide then d.noclip[il]=true il.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(FO,vX)d.hold=FO if vX then d.surface=vX end end function d.unpin(FP)
if not d.hold then return end d.hold=nil for vY in pairs(d.noclip)do pcall(function()if vY.Parent then vY.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local vZ=ar()if vZ and d.surface and not FP then aD(vZ,d.surface.Position,d.surface.Position+d.surface.LookVector)
ah(0.1)end end function d.home()local bx,v0=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ar()
if not(bx and bx:IsA("BasePart")and v0)then return nil end local v1=pk()or bx.Position local im=Vector3 .new(v1 .X-bx.Position.X,0,v1 .Z-bx.Position.Z)
im=im.Magnitude>0.1 and im.Unit or Vector3 .new(0,0,1)local io=bx.Position+im*6 local v2=gQ(io.X,bx.Position.Y,io.Z,{bx})
return CFrame.new(io.X,(v2 and v2 .Y or bx.Position.Y)+c_(v0),io.Z)end function d.ground(FQ,v3,FR)local np,nq={K.Character},nil
for LY=1,12 do local nr=RaycastParams.new()nr.FilterType=Enum.RaycastFilterType.Exclude nr.FilterDescendantsInstances=np
local ip=ak:Raycast(Vector3 .new(FQ,v3,FR),Vector3 .new(0,-2000,0),nr)if not ip then break end nq,v3=ip,ip.Position.Y-0.05
np[#np+1]=ip.Instance end return nq and nq.Position.Y end function d.parkHome()local ns=d.home()if not ns then return false end
local dB=ns.Position local FS=d.ground(dB.X,dB.Y+300,dB.Z)or(dB.Y-3)d.pin(CFrame.new(dB.X,FS-8,dB.Z),ns)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(iq)e.Ghost,e.GhostHelps=iq==2,iq==1 if iq<2 then task.spawn(function()while c.busy do ah(0.1)end
if d.ghostMode()<2 and d.hold and not F.home then pcall(d.unpin)end end)end d.paintGhost()D("ghost: "..d.GHOST[iq][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local FV=ar()if not FV or H.seat()then return end d.parkHome()end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.uid()local FW,FX=pcall(function()return K.UserId end)return FW and FX or 0 end function H.seat()local v4=ak:FindFirstChild("NightSeats")
if v4 then for LZ,nt in ipairs(v4:GetChildren())do if nt.Name=="LogSeat"and nt:GetAttribute("Occupant")==H.uid()then return nt end
end end local v5=K.Character local v6=v5 and v5:FindFirstChildOfClass("Humanoid")local nu=v6 and v6 .SeatPart
return(nu and nu.Name=="LogSeat")and nu or nil end function H.logs()local v7=ak:FindFirstChild("NightSeats")local nv,nw={},{}
for L0,cO in ipairs(v7 and v7:GetChildren()or{})do local nx=cO.Name=="LogSeat"and cO:FindFirstChildOfClass("ProximityPrompt")
if nx then nv[#nv+1]=cO local ny=cO:GetAttribute("Occupant")local FY=(ny~=nil and ny~=0 and ny~="")or(cO:IsA("Seat")and cO.Occupant~=nil)
if not FY and nx.Enabled then nw[#nw+1]={st=cO,p=nx}end end end return nv,nw end function H.due()if not(e.Campfire and c.running)or z()<H.nextAt then return false end
local FZ=ak:FindFirstChild("NightSeats")if not FZ then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire now (weather events)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or z()H.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(K:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
D(H.msg)return false end end return true end function H.sit()local F0,fz=ak:FindFirstChild("NightSeats"),ar()
if not F0 or not fz then return end local ir,fA=H.logs()if#ir==0 then local F1=ak:FindFirstChild("NightCampfire")
local F2,nz=pcall(function()return F1:GetPivot().Position end)if not F2 then H.nextAt,H.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()K:RequestStreamAroundAsync(nz,3)end)aD(fz,nz+Vector3 .new(0,3,9),nz)ap(function()ir,fA=H.logs()return#ir>0 end,6)
if#ir==0 then H.nextAt,H.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local v8=fz.HumanoidRootPart.Position
if#fA==0 then H.nextAt,H.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fA,function(F3,F4)return(F3 .st.Position-v8).Magnitude<(F4 .st.Position-v8).Magnitude end)
local nA,F5=fA[1].st,fA[1].p d.unpin(true)local dC=nA:IsA("BasePart")and nA.CFrame or CFrame.new(nA:GetPivot().Position)
aD(fz,dC.Position+dC.LookVector*2+Vector3 .new(0,2.5,0),dC.Position)ah(0.25)local F6=eg(F5,function()return H.seat()~=nil end)
if not F6 then aD(fz,dC.Position+Vector3 .new(0,2,0),dC.Position+dC.LookVector)ap(function()return H.seat()~=nil end,1.5)
end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,z()D(("SAT at the campfire (+%s%% cash)"):format(tostring(K:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=z()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then D(H.msg)end end end J.msg,J.nextAt,J.at,J.pulls,J.claims,J.pullLeft,J.collectLeft,J.events="",0,0,0,0,0,0,{}
function J.refresh()J.at=z()local nB=ag:FindFirstChild("Remotes")if not nB then return end local fB,nC,dD=0,0,{}
local F7,v9=pcall(function()return nB.ClanRequest:InvokeServer("state")end)local v_=F7 and type(v9)=="table"and v9 .tasks
for L1,b0 in ipairs(v_ and v_.list or{})do if not b0 .done and b0 .kind=="pull"then fB=math.max(fB,(b0 .goal or 0)-(b0 .progress or 0))end
if not b0 .done then dD[#dD+1]=("%s %d/%d"):format(tostring(b0 .text),b0 .progress or 0,b0 .goal or 0)end end
J.events={}for L2,dE in ipairs(nB:GetChildren())do if dE:IsA("RemoteFunction")and dE.Name:match("^%u%a+Action$")and dE.Name~="CrateAction"and dE.Name~="AutoRollAction"then
local F8,fC=pcall(function()return dE:InvokeServer("state")end)if F8 and type(fC)=="table"and fC.live==true and type(fC.quests)=="table"then
J.events[#J.events+1]={r=dE,st=fC}for L3,aU in ipairs(fC.quests)do if not aU.done and aU.kind=="pull"then fB=math.max(fB,(aU.goal or 0)-(aU.progress or 0))end
if not aU.done and aU.kind=="collect"then nC=math.max(nC,(aU.goal or 0)-(aU.progress or 0))end if not aU.done then dD[#dD+1]=("%s %d/%d"):format(tostring(aU.text),aU.progress or 0,aU.goal or 0)end
end end end end J.pullLeft,J.collectLeft=fB,nC J.msg=#dD>0 and("open: "..table.concat(dD,", "))or"all quests done for today"
end function J.claim()for L4,fD in ipairs(J.events)do local wa=fD.r.Name:gsub("Action$","")for L5,dF in ipairs(fD.st.quests)do
if dF.done and not dF.claimed then local F9,wb=pcall(function()return fD.r:InvokeServer("claimQuest",dF.id)end)
if F9 and not(type(wb)=="table"and wb.ok==false)then J.claims=J.claims+1 D(("CLAIMED %s quest: %s (+%s)"):format(wa,tostring(dF.text),tostring(dF.points or dF.treats or"?")))
end ah(0.4)end end if fD.st.bonusReady==true then local F_=pcall(function()return fD.r:InvokeServer("claimBonus")end)
if F_ then D(("CLAIMED %s daily quest bonus"):format(wa))end ah(0.4)end end end function J.tick()if not(e.Quests and c.running)then
if J.arPaused then J.resume("quests switched off")end return end if z()-J.at<(J.pullLeft>0 and 20 or 90)then return end
J.refresh()pcall(J.claim)if J.pullLeft<=0 and J.arPaused then J.resume("lever quests done")end end function J.pullDue()
return e.Quests and c.running and J.pullLeft>0 and z()>=J.nextAt and not E.busy end function J.lever()local wc=c.plot and c.plot:FindFirstChild("Lever")
local nD=wc and wc:FindFirstChild("Wheel")return nD and nD:FindFirstChildWhichIsA("ProximityPrompt"),nD end function J.resume(Ga)
J.arPaused=false if J.arWas then J.arWas=false e.AutoRoll=true task.spawn(E.apply,Ga)end end function J.pull()
local fE,nE=J.lever()if not fE or not nE or not nE:IsA("BasePart")then J.nextAt,J.msg=z()+300,"your lever was not found"return end
if not J.arPaused then J.arPaused=true J.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false E.apply("pulling the lever for a quest",true)
if E.isOn()then J.nextAt=z()+30 return end end D(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(J.pullLeft))
end if not fE.Enabled then J.nextAt=z()+1 return end co(nE,fE)J.asked=nil if not(type(fireproximityprompt)=="function"and pcall(fireproximityprompt,fE))then qJ(fE)end
J.pulls=J.pulls+1 J.pullLeft=J.pullLeft-1 ah(0.6)if J.asked then J.nextAt=z()+600 D(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(J.asked)))
J.resume("a butter the game wants kept is on the pad")return end J.nextAt=z()+2.5 if J.pullLeft<=0 then J.at=0 end
end F.skip,F.skipN,F.n,F.calls,F.fails,F.nextAt,F.msg,F.tries={},0,0,0,0,0,"off",{}function F.can(b1,Gb)local nF=b1:GetAttribute("PourOwner")
if type(nF)~="number"or nF==o.uid or not b1:GetAttribute("HasSquishy")then return false end if b1:GetAttribute("PourLong")~=true or b1:GetAttribute("PourFull")==true then return false end
local nG=b1:GetAttribute("PourId")if nG==nil or F.skip[nG]then return false end local wd,nH,Gc=b1:GetAttribute("Helpers"),0,tostring(o.uid)
if type(wd)=="string"then for Gd in wd:gmatch("[^,%s]+")do nH=nH+1 if Gd==Gc then return false end end end if nH>=6 then return false end
local is=A.left(b1)if not is then local we=tonumber(b1:GetAttribute("PourEnd"))is=we and(we-Gb)end if not is or is<=75 then return false end
local nI=game:GetService("Players"):GetPlayerByUserId(nF)if not nI or nI:GetAttribute("WaxHelpOff")==true then return false end
return true,nI,nG end function F.list()local nJ,Ge={},o.srv()local wf=ak:FindFirstChild("Plots")for L6,wg in ipairs(wf and wf:GetChildren()or{})do
local wh=wg~=c.plot and wg:FindFirstChild("WaxStations")for L7,nK in ipairs(wh and wh:GetChildren()or{})do local Gf,Gg,Gh=F.can(nK,Ge)
local nL=Gf and nK:FindFirstChild("SquishyPlaceHolder")if nL and nL:IsA("BasePart")then nJ[#nJ+1]={st=nK,p=Gg,id=Gh,part=nL}end
end end return nJ end function F.due()local wi=(e.MemLimit or 0)>0 and math.floor(e.MemLimit*0.72)or 900 if e.Help and c.running and z()>=F.nextAt and(d.mem or 0)>wi then
F.nextAt,F.msg=z()+30,("paused - memory %d MB > %d MB (helps load other bases)"):format(d.mem,wi)return false
end return e.Help and c.running and z()>=F.nextAt end function F.skipIt(wj,wk)F.skip[wj],F.skipN=wk,F.skipN+1
if F.skipN>600 then F.skip,F.skipN,F.tries={[wj]=wk},1,{}end end function F.goHome()local it,b2=ar(),F.home F.home=nil
if not(it and b2)then return end if e.Ghost and not H.seat()then d.unpin(true)if not d.parkHome()then pcall(aD,it,b2 .Position,b2 .Position+b2 .LookVector)end
elseif d.hold or(it.HumanoidRootPart.Position-b2 .Position).Magnitude>20 then d.unpin(true)pcall(aD,it,b2 .Position,b2 .Position+b2 .LookVector)
end end function F.step()local nM,fF=F.list(),ar()if#nM==0 or not fF then F.nextAt=z()+15 F.msg=("helped %d waxes here%s | none to help right now"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")
F.goHome()return end local wl=fF.HumanoidRootPart local wm=wl.Position table.sort(nM,function(Gi,Gj)return(Gi.part.Position-wm).Magnitude<(Gj.part.Position-wm).Magnitude end)
local a4=nM[1]F.home=F.home or(d.hold and d.surface)or wl.CFrame local b3=a4 .part local fG=(b3 .Position+a4 .st:GetPivot().Position)/2
local iu=F.tries[a4 .id]or 0 if(e.Ghost or e.GhostHelps)and iu==0 and not H.seat()then d.pin(b3 .CFrame,F.home)
else d.unpin(true)local nN=iu==0 and gQ(fG.X,b3 .Position.Y,fG.Z,{b3})if nN and math.abs(nN.Y-b3 .Position.Y)<8 then
aD(fF,Vector3 .new(fG.X,nN.Y+c_(fF),fG.Z),b3 .Position)else aD(fF,b3 .Position+Vector3 .new(0,b3 .Size.Y/2+3,0),fG)
end end ah(0.3)local fH=ag:FindFirstChild("Remotes")fH=fH and fH:FindFirstChild("ClanRequest")if not fH then F.nextAt,F.msg=z()+60,"the game's help remote is missing"return end
local iv,by=pcall(function()return fH:InvokeServer("help",a4 .st:GetAttribute("PourOwner"),tonumber(a4 .st.Name))end)
if iv and type(by)=="table"and by.ok then F.n,F.fails=F.n+1,0 F.skipIt(a4 .id,"helped")D(("HELPED %s's wax (station %s)"):format(a4 .p.DisplayName,a4 .st.Name))
F.msg=("helped %d waxes here%s"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")elseif iv and type(by)=="table"and tostring(by.reason or""):lower():find("walk up",1,true)and iu<2 then
F.tries[a4 .id]=iu+1 F.nextAt=z()+0.3 elseif iv and type(by)=="table"and tostring(by.reason or""):lower():find("moment",1,true)then
F.waits=(F.waits or 0)+1 F.nextAt=z()+1.6 else local wn=(iv and type(by)=="table"and tostring(by.reason or"refused"))or("error: "..tostring(by))
F.skipIt(a4 .id,wn)F.fails=F.fails+1 if F.fails<=3 then D(("help refused for %s's wax: %s"):format(a4 .p.DisplayName,wn))end
if F.fails>=5 then F.fails,F.nextAt,F.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
F.goHome()end end F.nextAt=math.max(F.nextAt,z()+1.2)end function F.onCall(bz)if not e.HelpGuild or type(bz)~="table"or bz.p~="help"or bz.mine or bz.u==o.uid or not bz.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fI=ag:FindFirstChild("Remotes")
fI=fI and fI:FindFirstChild("ClanRequest")if not fI then return end local wo,fJ=pcall(function()return fI:InvokeServer("callHelp",bz.u)end)
local wp=tostring(bz.n or bz.un or bz.u)if wo and type(fJ)=="table"and fJ.ok then F.calls=F.calls+1 D(("HELPED guildmate %s's wax from here (their call)"):format(wp))
else D(("guild call from %s: %s"):format(wp,(wo and type(fJ)=="table"and tostring(fJ.reason or"refused"))or tostring(fJ)))
end end)end local function au(Gk,wq,...)if c.busy then return end c.busy,c.busyText=true,Gk if d.hold and wq~=F.step then pcall(d.unpin)end
local Gl,wr=pcall(wq,...)c.busy,c.busyText=false,""if not Gl and wr~=jr then D("ERR "..tostring(wr))end end local function Gm()
if e.Campfire and H.seat()then if j.at and H.tickAt then j.at=j.at+(z()-H.tickAt)end H.tickAt=z()H.due()c.reason,c.level=H.msg,"ok"
return end H.tickAt=nil local aV,Gn,Go=vO()c.reason,c.level=Gn,Go if aV=="place"then au("waxing...",A.place)elseif aV=="crate"then au("opening crate...",er,true)
elseif aV=="cratesmart"then au("opening crate...",j.smart)elseif aV=="cratewin"then au("opening the crate window...",kz)
elseif aV=="nocrate"then au("discarding crate...",er,false)elseif aV=="cratedrop"then au("discarding a crate that would not open...",j.drop)
elseif aV=="sell"then au("selling...",ve)elseif aV=="buy"then au("buying...",qM,false)elseif not aV and not c.matchSince and P.due()then
au("grabbing a butter from the admin shower...",P.grab)elseif not aV and not c.matchSince and H.due()then au("sitting at the campfire...",H.sit)
elseif not aV and not c.matchSince and J.pullDue()and not ad()and not(cj()and aP(cj().name))then au("pulling the lever for a quest...",J.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(J.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
au("collecting money...",Fk)elseif not aV and not c.matchSince and F.due()then au("helping a wax...",F.step)elseif F.home and not e.Help then
au("coming back...",F.goHome)elseif not c.busy then d.parkTick()end end function fv(iw,Gp)if iw==c.running then return end
c.running=iw if not Gp then e.AutoStart=iw end if iw then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bE()or c.plot
D("START")else c.reason="stopped"D("STOP")end end do local b4=gB(ao.auto)if type(b4)=="string"then b4=b4:gsub("%s+$","")
if b4~=""then c.autoload=b4 local Gq=qh(b4)D(Gq and("loaded config "..b4)or("config "..b4 .." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local Gr={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local nO={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local af={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local ws,wt,wu,wv=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if ws and wt and wu and wv then af.x,af.b,af.m,af.r=ws,wt,wu,wv end end)pcall(function()local ww=Enum.Font.RobotoMono if ww then af.mono=ww end end)
local function L(Gs,Gt,Gu)local Gv,nP=pcall(Instance.new,Gs)if not Gv then c.uiErrs=c.uiErrs+1 return nil end
for Gw,Gx in pairs(Gt)do if not pcall(function()nP[Gw]=Gx end)then c.uiErrs=c.uiErrs+1 end end nP.Parent=Gu return nP
end local function W(Gy,Gz)L("UICorner",{CornerRadius=UDim.new(0,Gz or 8)},Gy)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(ix,nQ)if ix and a.shown[ix]~=nQ then a.shown[ix]=nQ ix.Text=nQ end
end function a.stroke(GA,GB,GC)return L("UIStroke",{Color=GB or l.line,Thickness=1,Transparency=GC or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},GA)
end function a.grad(GD,GE,GF,GG)local GH,wx=pcall(function()return ColorSequence.new(GE,GF)end)if GH and wx then return L("UIGradient",{Color=wx,Rotation=GG or 0},GD)end
end function a.pad(GI,wy,wz,GJ,GK)L("UIPadding",{PaddingLeft=UDim.new(0,wy or 0),PaddingTop=UDim.new(0,wz or 0),
PaddingRight=UDim.new(0,GJ or wy or 0),PaddingBottom=UDim.new(0,GK or wz or 0)},GI)end function a.list(GL,GM,GN)
return L("UIListLayout",{Padding=UDim.new(0,GM or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=GN and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},GL)
end function a.ink(nR)local GO,GP=pcall(function()return 0.299*nR.R+0.587*nR.G+0.114*nR.B end)return(GO and GP>0.55)and l.ink or l.text
end function a.nextIn(wA)local wB=(a.ord[wA]or 0)+1 a.ord[wA]=wB return wB end local nS=K:FindFirstChildOfClass("PlayerGui")or K:WaitForChild("PlayerGui")
local wC=nS:FindFirstChild("SABFarmGui")if wC then wC:Destroy()end local nT=L("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},nS)local T={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local iy=ak.CurrentCamera.ViewportSize if iy.X>100 and iy.Y>100 then T.w=math.clamp(math.floor(iy.X*0.48),320,400)
T.h=math.clamp(math.floor(iy.Y*0.86),250,360)end end)a.root=L("Frame",{Name="Root",Size=UDim2 .new(0,T.w,0,T.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},nT)
W(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local wD=UDim2 .new(1,0,1,0)
local function L8(wE,wF)return UDim2 .new(wE,0,0,0),UDim2 .new(wF,(wE+wF>0.99)and 0 or-4,1,0)end local function aj(GQ,GR,fK,GS,GT,GU)
local nU=L("TextButton",{Text=GR,Position=GT,Size=GU,BackgroundColor3=fK,BorderSizePixel=0,Font=af.b,TextSize=GS,TextColor3=a.ink(fK),AutoButtonColor=true},GQ)
W(nU,8)if fK==l.panel2 or fK==l.raise or fK==l.panel then a.stroke(nU,l.line,0.4)end return nU end local function iz(GV,GW,GX,GY,GZ)
local iA=L("TextBox",{Text=GW,PlaceholderText=GX,Position=GY,Size=GZ,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},GV)W(iA,8)a.stroke(iA,l.line,0)a.pad(iA,9,0,6,0)
return iA end local iB=ak.CurrentCamera local function G0()local G1,iC=pcall(function()return iB and iB.ViewportSize end)
if G1 and iC and iC.X>50 and iC.Y>50 then return iC end end local function b5(fL)local nV=G0()if not(nV and fL and fL.Parent)then return end
local G2=pcall(function()local iD,wG=fL.AbsolutePosition,fL.AbsoluteSize local nW=70 local wH=math.clamp(iD.X,nW-wG.X,nV.X-nW)
local wI=math.clamp(iD.Y,0,nV.Y-math.min(wG.Y,nW))if math.abs(wH-iD.X)>0.5 or math.abs(wI-iD.Y)>0.5 then fL.Position=UDim2 .new(0,math.floor(wH),0,math.floor(wI))
end end)return G2 end local function iE(G3)local G4,nX=pcall(function()return G3 .AbsolutePosition end)if G4 and nX then return{math.floor(nX.X),math.floor(nX.Y)}end
end local dG={}c.dragMoved={}local function wJ(fM,wK,nY)V(fM.InputBegan:Connect(function(dH)if dH.UserInputType~=Enum.UserInputType.MouseButton1 and dH.UserInputType~=Enum.UserInputType.Touch then return end
local nZ={start=dH.Position,from=wK.Position,moved=0,target=wK,input=dH,onDrop=nY}dG[fM],c.dragMoved[fM]=nZ,0
local n0 n0=dH.Changed:Connect(function()if dH.UserInputState==Enum.UserInputState.End and dG[fM]==nZ then dG[fM]=nil
if n0 then n0:Disconnect()end if nY then nY(nZ.moved)end end end)end))end V(o3 .InputChanged:Connect(function(iF)
if iF.UserInputType~=Enum.UserInputType.MouseMovement and iF.UserInputType~=Enum.UserInputType.Touch then return end
for G5,bd in pairs(dG)do local n1=bd.target if n1 and n1 .Parent then local wL,wM=iF.Position.X-bd.start.X,iF.Position.Y-bd.start.Y
bd.moved=math.max(bd.moved,math.abs(wL)+math.abs(wM))c.dragMoved[G5]=bd.moved n1 .Position=UDim2 .new(bd.from.X.Scale,bd.from.X.Offset+wL,bd.from.Y.Scale,bd.from.Y.Offset+wM)
end end end))V(o3 .InputEnded:Connect(function(iG)if iG.UserInputType~=Enum.UserInputType.MouseButton1 and iG.UserInputType~=Enum.UserInputType.Touch then return end
for G6,iH in pairs(dG)do if iH.input==iG or iG.UserInputType==Enum.UserInputType.MouseButton1 then dG[G6]=nil
if iH.onDrop then iH.onDrop(iH.moved)end end end end))local function Q(G7,G8,G9,G_,Ha,Hb,Hc)return L("TextLabel",{Text=G8,Position=Hb or UDim2 .new(0,0,0,0),Size=Hc or wD,BackgroundTransparency=1,
Font=Ha and af.b or af.m,TextSize=G9,TextColor3=G_,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},G7)
end function a.row(wN,Hd)return L("Frame",{Size=UDim2 .new(1,0,0,Hd),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(wN)},wN)end function a.card(wO,wP,wQ)local dI=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(wO)},wO)W(dI,11)a.stroke(dI,l.line,0.25)a.list(dI,5)a.pad(dI,8,8,8,9)if wP then
local n2=a.row(dI,14)L("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},n2)Q(n2,wP:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if wQ then local He=Q(n2,wQ,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
He.TextXAlignment=Enum.TextXAlignment.Right end end return dI end function a.heading(Hf,Hg,n3)local n4=a.row(Hf,n3 and 34 or 22)
Q(n4,Hg,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=af.x if n3 then Q(n4,n3,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return n4 end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(n5)local aN=a.sw[n5]if not aN then return end
local dJ=tostring(n5 .Text or""):match(":%s*(.-)%s*$")or""local b6=dJ~=""and not a.OFF[dJ]local n6=not aN.chips and(dJ=="ON"or dJ=="OFF")
aN.pill.Visible,aN.chip.Visible=n6,not n6 if n6 then aN.pill.BackgroundColor3=b6 and l.accent or l.panel2 aN.knob.Position=b6 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aN.knob.BackgroundColor3=b6 and l.white or l.dim else aN.chip.Text=dJ~=""and dJ or"-"aN.chip.BackgroundColor3=b6 and l.accent or l.panel2
aN.chip.TextColor3=b6 and l.ink or l.dim end n5 .BackgroundColor3=b6 and l.lit or l.raise if aN.edge then aN.edge.Color=b6 and l.accent or l.line aN.edge.Transparency=b6 and 0.55 or 0.45 end
end function a.switch(wR,Hh,Hi,fN)local a5=L("TextButton",{Name="Switch",Text=Hh,TextTransparency=1,TextSize=8,Font=af.b,
Size=UDim2 .new(1,0,0,fN and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(wR)},wR)
W(a5,9)local ax={edge=a.stroke(a5,l.line,0.45)}ax.title=Q(a5,Hi,11,l.text,true,UDim2 .new(0,10,0,fN and 4 or 0),UDim2 .new(1,-100,0,fN and 15 or 28))
ax.title.TextWrapped,ax.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fN then ax.sub=Q(a5,fN,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
ax.sub.TextWrapped,ax.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end ax.pill=L("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a5)W(ax.pill,9)ax.knob=L("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},ax.pill)W(ax.knob,7)ax.chip=L("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=af.b,TextSize=9,TextColor3=l.dim,Text=""},a5)
W(ax.chip,9)a.pad(ax.chip,10,0,10,0)L("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},ax.chip)
ax.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a5]=ax V(a5:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a5)end))
a.skin(a5)return a5 end function a.chips(n7)if a.sw[n7]then a.sw[n7].chips=true a.skin(n7)end end function a.line(Hj,Hk)
local wS=a.row(Hj,15)local wT=L("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Hk or l.dim,
BorderSizePixel=0},wS)W(wT,3)local n8=Q(wS,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))n8 .TextWrapped,n8 .TextTruncate=false,Enum.TextTruncate.AtEnd
return n8,wT end function a.grow(wU,Hl,Hm)local iI=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=af.m,TextSize=Hl or 10,TextColor3=Hm or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(wU)},wU)
V(iI:GetPropertyChangedSignal("Text"):Connect(function()iI.Visible=iI.Text~=""end))return iI end function a.note(Hn,Ho)
local wV=a.grow(Hn,9,l.dim)wV.Text=Ho return wV end function a.actions(Hp,wW)local Hq=a.row(Hp,28)local wX,n9={},#wW
for fO,wY in ipairs(wW)do wX[fO]=aj(Hq,wY[1],wY[2]or l.panel2,10,UDim2 .new((fO-1)/n9,fO>1 and 3 or 0,0,0),UDim2 .new(1/n9,(fO>1 and-3 or 0)+(fO<n9 and-3 or 0),1,0))
end return table.unpack(wX)end local function O(cP,iJ,Hr,Hs)a.put(cP,iJ and Hr or Hs)if not a.sw[cP]and a.lit[cP]~=iJ then
a.lit[cP]=iJ cP.BackgroundColor3=iJ and l.accent or l.panel2 cP.TextColor3=a.ink(cP.BackgroundColor3)end end a.title=L("Frame",{Size=UDim2 .new(1,0,0,T.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
W(a.title,14)L("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
L("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local n_=L("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
W(n_,8)a.grad(n_,l.accent,l.accent2,45)local wZ=Q(n_,"C",16,l.ink,true)wZ.Font,wZ.TextXAlignment=af.x,Enum.TextXAlignment.Center
local Ht=Q(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))Ht.Font=af.x Q(a.title,"butter farm  "..cc,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
end a.pill=L("Frame",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-66,0.5,0),Size=UDim2 .new(0,78,0,22),
BackgroundColor3=l.raise,BorderSizePixel=0},a.title)W(a.pill,11)a.pillEdge=a.stroke(a.pill,l.line,0.2)a.dot=L("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(0,9,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.pill)
W(a.dot,4)a.runL=Q(a.pill,"STOPPED",9,l.dim,true,UDim2 .new(0,22,0,0),UDim2 .new(1,-26,1,0))a.minB=aj(a.title,"-",l.raise,14,UDim2 .new(1,-60,0.5,-12),UDim2 .new(0,24,0,24))
a.xB=aj(a.title,"X",l.raise,11,UDim2 .new(1,-32,0.5,-12),UDim2 .new(0,24,0,24))a.xB.TextColor3=l.bad a.strip=L("Frame",{Position=UDim2 .new(0,T.rail+8,0,T.head+6),Size=UDim2 .new(1,-(T.rail+16),0,T.status),
BackgroundColor3=l.raise,BorderSizePixel=0},a.root)W(a.strip,9)a.stroke(a.strip,l.line,0.3)a.bar=L("Frame",{Size=UDim2 .new(0,3,1,-12),Position=UDim2 .new(0,7,0,6),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
W(a.bar,2)a.reason=Q(a.strip,"starting",10,l.text,false,UDim2 .new(0,16,0,1),UDim2 .new(1,-22,1,-2))a.reason.TextTruncate=Enum.TextTruncate.AtEnd
a.railBg=L("Frame",{Position=UDim2 .new(0,0,0,T.head),Size=UDim2 .new(0,T.rail,1,-T.head),BackgroundColor3=l.panel,
BorderSizePixel=0},a.root)W(a.railBg,14)L("Frame",{Size=UDim2 .new(1,0,0,14),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
L("Frame",{Size=UDim2 .new(0,14,1,0),Position=UDim2 .new(1,-14,0,0),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
a.tabs=L("Frame",{Position=UDim2 .new(0,0,0,T.head),Size=UDim2 .new(0,T.rail,1,-T.head),BackgroundTransparency=1,
BorderSizePixel=0},a.root)a.railLine=L("Frame",{Size=UDim2 .new(0,1,1,-T.head),Position=UDim2 .new(0,T.rail-1,0,T.head),BackgroundColor3=l.line,
BorderSizePixel=0},a.root)do local Hu=a.list(a.tabs,3)pcall(function()Hu.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((T.h-T.head-12)/10)-3,20,34)local function be(Hv,Hw,Hx)
local iK=L("TextButton",{Text=Hv,Font=af.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)W(iK,9)local w0=L("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iK)W(w0,2)a.tabsAll[#a.tabsAll+1]={b=iK,bar=w0,name=Hw,sub=Hx}return iK end a.tabFarm=be("🏠","Home","what the farm is doing")
a.tabRun=be("🌾","Farm","the buy - wax - collect loop")a.tabBut=be("🧈","Butters","what gets bought and waxed")
a.tabCrt=be("📦","Crates","which crates get opened")a.tabPet=be("🐾","Pets","adopt, wish, fuse")a.tabTeam=be("👥","Teams","the right pets at the right moment")
a.tabSrv=be("🤝","Server","helping, campfire, ghost")a.tabAdm=be("⚡","Admin","admin abuse and its boosts")a.tabSet=be("⚙","Settings","configs, startup, performance")
a.tabAlt=be("🔗","Alts","several accounts working together")local function bf()local oa=L("ScrollingFrame",{Position=UDim2 .new(0,T.rail,0,T.head+T.status+10),
Size=UDim2 .new(1,-T.rail,1,-(T.head+T.status+10)),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,
CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)
a.list(oa,8)a.pad(oa,8,2,10,12)return oa end a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bf(),bf(),bf(),bf(),bf(),bf(),bf(),bf(),bf()
a.farm.Visible=true a.alt=bf()do local fP=a.farm local w1=a.row(fP,34)a.startB=aj(w1,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=af.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(w1,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local Hy=a.row(fP,44)local function fQ(w2,Hz,w3)local iL=L("Frame",{Position=UDim2 .new((w2-1)/w3,w2>1 and 2 or 0,0,0),Size=UDim2 .new(1/w3,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},Hy)W(iL,9)a.stroke(iL,l.line,0.3)local iM=Q(iL,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iM.Font,iM.TextXAlignment,iM.TextWrapped=af.x,Enum.TextXAlignment.Center,false local HA=Q(iL,Hz,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
HA.TextXAlignment=Enum.TextXAlignment.Center return iM end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fQ(1,"BOUGHT",5),fQ(2,"WAXED",5),fQ(3,"SOLD",5),fQ(4,"MONEY",5),fQ(5,"FREE",5)
local w4=a.card(fP,"Right now")a.info=Q(a.row(w4,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=Q(a.row(w4,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fR=a.card(fP,"Systems")
a.helpL=a.line(fR,l.info)a.campL=a.line(fR,l.accent2)a.questL=a.line(fR,l.good)a.arL=a.line(fR,l.accent)a.ixL=a.line(fR,nO.Dotonbori)
local w5=a.card(fP,"Activity")a.log=L("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(w5)},w5)
W(a.log,7)a.pad(a.log,7,5,7,5)end local function L9(HB,HC)return a.row(HC or a.farm,HB)end local an do local ob=a.run
a.heading(ob,"Farm","buy what rolls, wax it, collect the cash")local fS=a.card(ob,"Loop")a.colT=a.switch(fS,"COLLECT: ON","Collect cash","step on the collector by itself")
an=a.row(fS,26)Q(an,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=iz(an,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
Q(an,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fS,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fS,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fS,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local oc=a.card(ob,"By hand")
a.buyB,a.plB=a.actions(oc,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(oc,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
an=a.row(oc,28)a.padB=aj(an,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=Q(an,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iN=a.but a.heading(iN,"Butters","what gets bought and waxed")local w6=a.card(iN,"Strategy")a.ixT=a.switch(w6,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(w6,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iN)},iN)a.list(a.butList,5)end do local iO=a.crt a.heading(iO,"Crates","only ticked crates are opened")
local w7=a.card(iO,"Opening")a.crateT=a.switch(w7,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(w7,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iO)},iO)a.list(a.crtList,5)end do local fT=a.pet a.heading(fT,"Pets","adopt, wish, fuse Bigs and Huges")
local fU=a.card(fT,"Automatic")a.pbT=a.switch(fU,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fU,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fU,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fU,10,l.dim)a.note(fU,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local w8=a.card(fT,"The plan","best teams with every pet")a.planInfo=a.grow(w8,10,l.text)a.note(w8,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fT)},fT)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iP=a.srv a.heading(iP,"Server","other players, the campfire, staying hidden")
local od=a.card(iP,"Helping")a.helpT=a.switch(od,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(od,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(od,l.info)
local w9=a.card(iP,"Campfire")a.campT=a.switch(w9,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(w9,l.accent2)local oe=a.card(iP,"Ghost")a.ghostT=a.switch(oe,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(oe,l.dim)a.note(oe,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fV=a.adm a.heading(fV,"Admin abuse","the show, its boosts and the farm in it")local w_=a.card(fV,"When")
a.admBig=Q(a.row(w_,22),"-",15,l.text,true)a.admBig.Font=af.x a.admSub=Q(a.row(w_,14),"",10,l.dim,false)local HD=a.card(fV,"Boosts now")
a.admBoost=a.grow(HD,11,l.text)local of=a.card(fV,"What the farm does")a.shT=a.switch(of,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(of,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(of,l.accent)
local xa=a.card(fV,"Show feed")a.admFeed=L("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(xa)},xa)
W(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cQ=a.set a.heading(cQ,"Settings","kept on your phone, per config")
local iQ=a.card(cQ,"Config")an=a.row(iQ,28)a.cfgName=iz(an,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=aj(an,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=aj(an,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
an=a.row(iQ,26)a.cfgPrev=aj(an,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=aj(an,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=aj(an,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iQ,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iQ,10,l.dim)local og=a.card(cQ,"Starting")a.startT=a.switch(og,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(og,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(og,9,l.dim)local oh=a.card(cQ,"If the game drops me")
a.rejT=a.switch(oh,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(oh,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(oh,9,l.dim)local bA=a.card(cQ,"Performance")a.pfCalm=a.switch(bA,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bA,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bA,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bA,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bA,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bA,"STOP 3D: OFF","Stop 3D","blank the world behind this window")an=a.row(bA,28)Q(an,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=iz(an,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))Q(an,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bA,l.good)a.note(bA,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local HE=a.card(cQ,"Your game passes","read from the game")a.passInfo=a.grow(HE,10,l.text)local HF=a.card(cQ,"About")
a.note(HF,"CHURN "..cc.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for L_,HG in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(HG)end local xb=L("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},nS)
a.tgRoot=L("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},xb)W(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=L("TextButton",{Text="C",Size=wD,BackgroundTransparency=1,Font=af.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=L("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
W(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=L("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=af.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
W(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fW=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fW][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fW][2]
a.tgGhost.BackgroundColor3=fW==2 and l.accent or(fW==1 and l.warn or l.panel)a.tgGhost.TextColor3=fW>0 and l.ink or l.dim
end end local bB={built=false,boxes={},at=0}function a.check(iR,oi)iR.Text=oi and"✓"or""iR.BackgroundColor3=oi and l.accent or l.bg
iR.TextColor3=l.ink local oj=iR.Parent if oj and oj:IsA("TextButton")then oj.BackgroundColor3=oi and l.lit or l.raise end
end local function xc(xd,xe)e.Targets[xd]=xe or nil local xf=bB.boxes[xd]if xf then a.check(xf,xe)end end local function ol()
for HH,HI in pairs(bB.boxes)do a.check(HI,e.Targets[HH]==true)end end function a.tickBox(HJ)local om=L("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},HJ)W(om,6)
a.stroke(om,l.line,0)return om end local fX local function HK()local HL=a.card(a.butList,"Butter list")local oo=a.row(HL,26)
a.butInfo=Q(oo,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local HM=aj(oo,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local HN=aj(oo,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))HM.MouseButton1Click:Connect(function()
for HO in pairs(e.Targets)do e.Targets[HO]=nil end ol()end)HN.MouseButton1Click:Connect(function()ae.at=0 j1()
fX(true)end)end fX=function(HP)if not j1()then if not a.butEmpty then a.butEmpty=Q(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bB.built and not HP and bB.at==ae.at then return end for Ma,iS in ipairs(a.butList:GetChildren())do
if iS:IsA("Frame")or iS:IsA("TextButton")or iS:IsA("TextLabel")then iS:Destroy()end end bB.boxes,a.butEmpty={},nil
HK()for Mb,iT in ipairs(ae.rarOrder)do local op=nO[iT]or l.text local cR=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)W(cR,11)a.stroke(cR,op,0.7)a.list(cR,4)a.pad(cR,7,7,7,8)
local oq=a.row(cR,22)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=op,BorderSizePixel=0},oq)
local HQ=Q(oq,iT:upper(),11,op,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))HQ.Font=af.x local HR=aj(oq,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local HT=iT HR.MouseButton1Click:Connect(function()local xg=ae.members[HT]or{}local xh=false for Mc,HU in ipairs(xg)do if not e.Targets[HU]then xh=true break end end
for Md,HV in ipairs(xg)do xc(HV,xh)end end)for Me,ot in ipairs(ae.members[iT]or{})do local iU=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cR)},cR)W(iU,8)local xi=Q(iU,am(ot),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
xi.TextWrapped,xi.TextTruncate=false,Enum.TextTruncate.AtEnd local xj=a.tickBox(iU)bB.boxes[ot]=xj local xk=ot
local function xl()xc(xk,not e.Targets[xk])end iU.MouseButton1Click:Connect(xl)xj.MouseButton1Click:Connect(xl)
end end ol()bB.built,bB.at=true,ae.at end function M.paint()for HW,HY in pairs(M.boxes)do a.check(HY,e.CrateTicks[HW]==true)end
if a.crtInfo then local ou,ov=0,0 for Mf in pairs(M.boxes)do ou=ou+1 end for Mg,HZ in pairs(e.CrateTicks)do if HZ then ov=ov+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(ou,ov))end if a.crateT then O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function M.build()for Mh,iV in ipairs(a.crtList:GetChildren())do if iV:IsA("Frame")or iV:IsA("TextButton")or iV:IsA("TextLabel")then iV:Destroy()end
end M.boxes={}local ow=a.card(a.crtList,"All of them","worst first")local ox=a.row(ow,26)a.crtInfo=Q(ox,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local H0=aj(ox,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local H1=aj(ox,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
V(H0 .MouseButton1Click:Connect(function()e.CrateTicks={}M.paint()end))V(H1 .MouseButton1Click:Connect(function()M.build()end))
for Mi,bC in ipairs(M.list())do local xm=nO[bC.rar or""]or l.text local dK=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(ow)},ow)W(dK,8)L("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=xm,BorderSizePixel=0},dK)
local xn=Q(dK,(bC.title or bC.name)..(bC.guess and"  (?)"or""),11,xm,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
xn.TextWrapped,xn.TextTruncate=false,Enum.TextTruncate.AtEnd local H2=Q(dK,bC.price and("$"..aF(bC.price))or(bC.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
H2 .TextXAlignment=Enum.TextXAlignment.Right local xo=a.tickBox(dK)M.boxes[bC.k]=xo local xp=bC.k local function xq()
e.CrateTicks[xp]=(not e.CrateTicks[xp])or nil M.paint()end V(dK.MouseButton1Click:Connect(xq))V(xo.MouseButton1Click:Connect(xq))
end M.built=M.at M.paint()end local xr="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set","alt"}
local function aW(cS)xr=cS for H3,oy in ipairs(a.tabKeys)do a[oy].Visible=(oy==cS)local iW=a.tabsAll[H3]if iW then
local oz=oy==cS iW.b.BackgroundTransparency,iW.b.TextTransparency,iW.bar.Visible=oz and 0 or 1,oz and 0 or 0.45,oz
end end if cS=="pet"and not o.built then pcall(o.build)end if cS=="team"and not A.built then pcall(A.build)end
if cS=="crt"and(M.built~=M.at or not next(M.boxes))then M.build()end if cS=="but"then fX(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(oA,xs,xt,xu)if xu then oA.Text=xu end oA.BackgroundColor3=xs and xt or l.bg oA.TextColor3=xs and a.ink(xt)or l.dim
end function o.paintRow(xv)local cT=o.rows and o.rows[xv]if not cT then return end local cU=e.Pets[xv]or{}local xw=tonumber(cU.f)==-1
a.flag(cT.b,cU.b,l.good)a.flag(cT.g,cU.g,l.accent,cU.g and"BIG"or"ANY")a.flag(cT.w,cU.w,l.warn)a.flag(cT.f,not xw,l.good,xw and"KEEP"or"AUTO")
if cT.row then cT.row.BackgroundColor3=(cU.b or cU.w)and l.lit or l.raise end end function o.flag(oB,iX)local bh=e.Pets[oB]or{}
if iX=="f"then bh.f=tonumber(bh.f)~=-1 and-1 or nil elseif bh[iX]then bh[iX]=nil else bh[iX]=true end e.Pets[oB]=(bh.b or bh.g or bh.w or bh.f)and bh or nil
o.paintRow(oB)end function o.paintAll()for H4 in pairs(o.rows or{})do o.paintRow(H4)end if a.pbT then O(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
O(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")O(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(H5)local xx=y.dreamT if not xx then return"working the plan out..."end local H6,H7=y.needFor(""),y.needFor("Big")
local cV={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(H6,H7,y.slots())}for Mj,xy in ipairs(y.dreamTeams or{})do cV[#cV+1]=xy.team:upper()..": "..table.concat(xy.names,", ")end
local iY,iZ,i0=0,0,0 for xz,xA in pairs(xx)do local xC,H8=y.have(xz,H5)local Mk,H9=y.goal(xz)iY=iY+math.max(0,xA.Huge-xC.Huge)
iZ=iZ+math.max(0,xA.Big-xC.Big)i0=i0+math.max(0,H9-H8)end cV[#cV+1]=(iY+iZ+i0==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(iY,iZ,i0)if y.fuseMsg~=""then cV[#cV+1]=y.fuseMsg end
return table.concat(cV,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local oC=o.wishes()local dL=o.data()for i1,oD in pairs(o.rows)do local xD=y.status(i1,dL)oD.desc.Text=(oC[i1]and("wishing %dm | "):format(math.ceil(oC[i1]/60))or"")..(xD and(xD.." | ")or"")..oD.boostText
oD.desc.TextColor3=oC[i1]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dL))end local xE=tonumber(K:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dL and#(dL.pets or{})or 0,dL and tonumber(dL.maxOwned)or 60,
aF(o.money()),xE>0 and(" | free wishes "..xE)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local i2=o.info()for Ml,i3 in ipairs(a.petList:GetChildren())do if i3:IsA("Frame")or i3:IsA("TextLabel")or i3:IsA("TextButton")then i3:Destroy()end
end o.rows={}if not i2 then Q(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dM={}for Mm,xF in ipairs(o.order())do local oE=i2 .Pets[xF].rarity or"?"dM[oE]=dM[oE]or{}
table.insert(dM[oE],xF)end local dN={}for Mn,xG in ipairs(i2 .Rarities or{})do if dM[xG]then dN[#dN+1]=xG end end
for xH in pairs(dM)do if not table.find(dN,xH)then dN[#dN+1]=xH end end for Mo,oF in ipairs(dN)do local i4=o.RC[oF]or l.text
local cW=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
W(cW,11)a.stroke(cW,i4,0.7)a.list(cW,4)a.pad(cW,7,7,7,8)local xI=a.row(cW,18)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=i4,BorderSizePixel=0},xI)
local H_=Q(xI,oF:upper(),11,i4,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))H_.Font=af.x for Mp,i5 in ipairs(dM[oF])do
local fY=L("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cW)},cW)
W(fY,8)local oG=Q(fY,o.nice(i5),11,i4,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))oG.TextWrapped,oG.TextTruncate=false,Enum.TextTruncate.AtEnd
local Ia,Ib=pcall(function()return i2 .describe(i5)end)local xJ=Ia and tostring(Ib)or""local oH=Q(fY,xJ,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oH.TextYAlignment,oH.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function i6(Ic,Ie,If)
local xK=aj(fY,Ic,l.bg,8,UDim2 .new(1,Ie,0,5),UDim2 .new(0,If,0,22))xK.AutoButtonColor=true return xK end local xL,xM,xN,xO=i6("BUY",-164,30),i6("ANY",-131,30),i6("WISH",-98,34),i6("AUTO",-61,56)
local i7=i5 xL.MouseButton1Click:Connect(function()o.flag(i7,"b")end)xM.MouseButton1Click:Connect(function()o.flag(i7,"g")end)
xN.MouseButton1Click:Connect(function()o.flag(i7,"w")end)xO.MouseButton1Click:Connect(function()o.flag(i7,"f")end)
o.rows[i5]={b=xL,g=xM,w=xN,f=xO,name=oG,desc=oH,boostText=xJ,row=fY}end end o.built=true o.paintAll()end function d.paint()
O(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")O(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
O(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")O(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
O(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])O(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end V(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
V(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))V(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
V(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))V(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
V(a.pfFps.MouseButton1Click:Connect(function()local Ig=table.find(d.CAPS,e.FpsCap or 0)or 1 local xP=d.CAPS[(Ig%#d.CAPS)+1]
if not d.cap(xP)and xP~=0 then D("this executor cannot cap fps")end d.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()
local oI=tonumber(a.pfMem.Text)if oI and oI>=0 then e.MemLimit=math.floor(oI)end d.paint()end))function A.names()
local oJ={"(none)"}for Mq,Ih in ipairs((A.teams()))do oJ[#oJ+1]=Ih.name end return oJ end function A.cycle(oK,Ii)
local i8=A.names()local Ij=e[oK]~=""and e[oK]or"(none)"local i9=table.find(i8,Ij)or 1 i9=((i9-1+Ii)%#i8)+1 e[oK]=i8[i9]=="(none)"and""or i8[i9]
A.paint()end function A.paint()if not A.built then return end O(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
O(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oL={}for Mr,Ik in ipairs((A.teams()))do oL[Ik.name]=true end
for Il,xQ in pairs(A.pick)do local dO=e[Il]xQ.Text=dO==""and"(none)"or(oL[dO]and dO or(dO.." (missing)"))xQ.TextColor3=(dO~=""and not oL[dO])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local Im,i_=o.srv(),{}for Ms,ja in ipairs(A.list or{})do i_[#i_+1]=("st %-2s %-22s %9s  helps %d"):format(ja.st.Name,am(ab(ja.name)):sub(1,22),A.clock(ja.ends-Im),ja.helps)
end a.tmList.Text=#i_>0 and table.concat(i_,"\n")or"no waxes running"end function A.build()for Mt,jb in ipairs(a.teamList:GetChildren())do
if jb:IsA("Frame")or jb:IsA("TextLabel")or jb:IsA("TextButton")then jb:Destroy()end end A.pick={}local jc=a.card(a.teamList,"Automatic")
a.tmT=a.switch(jc,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(jc,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(jc,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local In,Io=pcall(y.rebuild,"you asked")if not In then D("BUILD ERR "..tostring(Io))end end)
end)a.tmInfo=a.grow(jc,10,l.dim)local xR=a.card(a.teamList,"Which team when")local function jd(je,Ip,Iq)local fZ=a.row(xR,54)
Q(fZ,Ip,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local xS=Q(fZ,Iq,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
xS.TextWrapped,xS.TextTruncate=false,Enum.TextTruncate.AtEnd local Ir=aj(fZ,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local xT=aj(fZ,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local Is=aj(fZ,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
Ir.MouseButton1Click:Connect(function()A.cycle(je,-1)end)Is.MouseButton1Click:Connect(function()A.cycle(je,1)end)
xT.MouseButton1Click:Connect(function()A.cycle(je,1)end)A.pick[je]=xT end jd("TeamNormal","Normal","the rest of the time: money + luck")
jd("TeamFull","Full","every station busy: money + wax speed")jd("TeamGlaze","Glaze","worn just before a wax finishes")
local jf=a.row(xR,26)Q(jf,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=iz(jf,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
Q(jf,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local It=aj(jf,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
It.MouseButton1Click:Connect(function()local jg=tonumber(a.tmLead.Text)if jg and jg>=5 and jg<=600 then e.GlazeLead=math.floor(jg)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)jd("TeamWax","Wax","while a butter is placed: head starts")local xU=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(xU)},xU)W(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local Iu=a.card(a.teamList,"How it works")a.note(Iu,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function Iv()a.secB.Text=tostring(e.Every)O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ah(0.1)end if not F.home then pcall(d.unpin)end end)end
O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fv(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b5(a.root)b5(a.tgRoot)c.lastCollect=z()
ol()M.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function Iw(xV)task.spawn(function()xV.TextColor3=l.bad
task.wait(0.8)if c.alive then xV.TextColor3=l.text end end)end local function xW()local xX=a.secB.Text:match("^%s*(%d+)%s*$")
local f0=xX and tonumber(xX)if not f0 or f0<1 then a.secB.Text=tostring(e.Every)Iw(a.secB)D("interval must be a whole number >= 1")
return end if f0==e.Every then return end e.Every,c.lastCollect=f0,z()D("collect every "..f0 .."s")end local function N(Ix,Iy)V(Ix.MouseButton1Click:Connect(Iy))end
N(a.secSet,xW)V(a.secB.FocusLost:Connect(xW))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(au,"selling...",ve)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(E.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help F.nextAt,F.msg=0,e.Help and"looking for waxes to help"or"off"O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests J.at=0 O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire H.nextAt,H.fails,H.lost=0,0,0 O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()O(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")O(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
O(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
O(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")O(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(Iz)task.spawn(function()pcall(q.tick)if Iz and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local IA=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(IA)end)
N(a.bestT,function()local IB=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(IB)end)N(a.bcT,function()
local IC=q.on()e.BestCrate=not e.BestCrate q.changed(IC)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b7=o.srv()local b8 pcall(function()q.aac=q.aac or require(ag:FindFirstChild("AdminAbuseClient"))
b8=q.aac:GetState()end)local dP,b9="nothing scheduled","the game has not announced one"if type(b8)=="table"then
local f1,a6,b_=tostring(b8 .Phase or""),tonumber(b8 .StartsAt),tonumber(b8 .EndsAt)if a6 and a6<1e9 then a6=nil end
if b_ and b_<1e9 then b_=nil end if f1=="Countdown"and a6 then dP,b9="starts in "..A.clock(a6-b7),os.date("%a %H:%M",math.floor(a6)).." your time"
elseif f1=="Live"and b_ then dP,b9="LIVE  -  "..A.clock(b_-b7).." left","the farm is grabbing, waxing and glazing through it"
elseif f1~=""and f1~="Idle"and b_ and b_>b7 then dP,b9=f1:lower().."  -  "..A.clock(b_-b7).." left","after the show"
elseif a6 and a6>b7 then dP,b9="next: "..os.date("%a %H:%M",math.floor(a6)),"your time"elseif a6 then dP,b9="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a6)).." your time"
end if type(b8 .Kind)=="string"and b8 .Kind~=""then b9=b9 .."  |  "..b8 .Kind end end a.put(a.admBig,dP)a.put(a.admSub,b9)
local dQ,oM={},ag:FindFirstChild("AdminShow")if oM then local ID,IE=pcall(function()return oM:GetAttributes()end)
for xY,dR in pairs(ID and IE or{})do local jh=type(xY)=="string"and xY:match("^(.-)Mult$")local oN=jh and tonumber(oM:GetAttribute(jh.."Until"))
if jh and type(dR)=="number"and dR~=1 and dR~=0 and oN and oN>b7 then dQ[#dQ+1]=("%s  x%s   %s left"):format(jh:gsub("(%l)(%u)","%1 %2"),(dR%1==0)and tostring(dR)or("%.2f"):format(dR),
A.clock(oN-b7))end end end table.sort(dQ)a.put(a.admBoost,#dQ>0 and table.concat(dQ,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dQ>0 and l.accent or l.dim local ji=0 for Mu in pairs(P.drops)do ji=ji+1 end local xZ=q.snapAt and(q.snapAt-b7)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(P.got,P.miss,ji>0 and(", "..ji.." falling")or"",
xZ and("in "..math.max(0,math.floor(xZ)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(au,"opening crate...",er,true)end)N(a.padB,function()c.plot=bE()or c.plot local x0,oO=ar(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(x0 and oO and oO:IsA("BasePart"))then D("SET PAD: need character and plot")return end c.manualPad=oO.CFrame:ToObjectSpace(x0 .HumanoidRootPart.CFrame)
Fa(c.manualPad)D("collect pad saved at your position")end)N(a.startB,function()fv(not c.running)end)N(a.buyB,function()
c.plot=bE()or c.plot task.spawn(au,"buying (manual)...",qM,true)end)N(a.plB,function()c.plot=bE()or c.plot task.spawn(au,"waxing (manual)...",qQ)
end)N(a.tabFarm,function()aW("farm")end)N(a.tabRun,function()aW("run")end)N(a.tabSrv,function()aW("srv")end)N(a.tabAdm,function()aW("adm")end)
N(a.tabBut,function()aW("but")end)N(a.tabSet,function()aW("set")end)N(a.tabCrt,function()aW("crt")end)N(a.tabPet,function()aW("pet")end)
N(a.tabTeam,function()aW("team")end)N(a.tabAlt,function()aW("alt")if type(a.altShown)=="function"then pcall(a.altShown)end end)
a.mk,a.lbl,a.button,a.round,a.C,a.FT,a.click=L,Q,aj,W,l,af,N do local IF=a.card(a.alt,"Alts","several accounts in one server")
a.altNote=Q(a.row(IF,40),"The team module is not running on this account. Load the farm with altboot.lua to use it.",10,l.dim,false)
a.altNote.TextWrapped,a.altNote.TextYAlignment=true,Enum.TextYAlignment.Top end local function IG(oP)c.hidden=oP
a.root.Visible=not oP a.tgBtn.TextColor3=oP and l.text or l.ink end wJ(a.tgBtn,a.tgRoot,function()b5(a.tgRoot)
c.togPos=iE(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then IG(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aO,az={},0 local function ca()aO=p8()if#aO==0 then a.cfgPick.Text="(none saved)"
az=0 return end if az<1 or az>#aO then az=1 end a.cfgPick.Text=aO[az]..("  (%d/%d)"):format(az,#aO)end local function x1()
local x2=c.autoload~=nil a.cfgAuto.Text=x2 and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=x2 and l.accent or l.panel2
end local function oQ()local x3=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if x3~=""then return x3 end return(az>0 and aO[az])or""
end N(a.cfgSave,function()c.winPos=iE(a.root)or c.winPos c.togPos=iE(a.tgRoot)or c.togPos local x4,x5=gI(oQ())
a.cfgMsg.Text=x4 and("saved as "..x5)or("could not save: "..x5)a.cfgMsg.TextColor3=x4 and l.good or l.bad ca()
D(a.cfgMsg.Text)end)local function IH(oR)local oS,x6=qh(oR)a.cfgMsg.Text=oS and("loaded "..x6)or("could not load: "..x6)
a.cfgMsg.TextColor3=oS and l.good or l.bad if oS then a.cfgName.Text=oR Iv()task.spawn(E.apply,"config "..oR)
end D(a.cfgMsg.Text)end N(a.cfgLoad,function()IH(oQ())end)N(a.cfgPick,function()ca()if az>0 then a.cfgName.Text=aO[az]end
end)N(a.cfgPrev,function()if#aO==0 then ca()return end az=(az-2)%#aO+1 ca()a.cfgName.Text=aO[az]end)N(a.cfgNext,function()
if#aO==0 then ca()return end az=az%#aO+1 ca()a.cfgName.Text=aO[az]end)N(a.cfgAuto,function()if c.autoload then
qj(nil)a.cfgMsg.Text="it will not load a config on launch"else local f2=oQ()local x7=false for Mv,II in ipairs(p8())do if II==f2 then x7=true end end
local IJ=x7 or gI(f2)if IJ and f2~=""then qj(f2)ca()a.cfgMsg.Text=f2 .." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim x1()end)N(a.autoB,function()
local x8,x9=z6()a.autoMsg.Text=x8 and("installed. "..x9)or("failed: "..x9)a.autoMsg.TextColor3=x8 and l.good or l.bad
D(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()ea("you asked")end)
local bi=false N(a.minB,function()bi=not bi a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bi,not bi,not bi
if bi then for Mw,IK in ipairs(a.tabKeys)do a[IK].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,T.head+6),UDim2 .new(1,-16,0,T.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,T.rail+8,0,T.head+6),UDim2 .new(1,-(T.rail+16),0,T.status)aW(xr)
end a.root.Size=UDim2 .new(0,T.w,0,bi and(T.head+T.status+12)or T.h)a.minB.Text=bi and"+"or"-"end)local function jj()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(gh)for Mx,IL in ipairs(js)do pcall(function()IL:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()nT:Destroy()end)
pcall(function()xb:Destroy()end)if cZ.SAB_KILL==jj then cZ.SAB_KILL=nil end end cZ.SAB_KILL=jj N(a.killB,jj)N(a.xB,jj)
wJ(a.title,a.root,function()b5(a.root)c.winPos=iE(a.root)or c.winPos end)local function x_()local f3,cX=c.reason,c.level
if c.busy then f3,cX=c.busyText,"ok"elseif not c.running then local My,ya,IM=vO()if c.capHit then f3,cX=ya,"bad"else f3,cX="[stopped] "..ya,(IM=="bad")and"bad"or"idle"end
c.reason,c.level=f3,cX end local dS=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dS then
a.lit.dot=dS a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dS,dS,dS,dS a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,f3)if a.lit.bar~=cX then a.lit.bar=cX a.bar.BackgroundColor3=Gr[cX]or l.dim end
if bi then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local cb=zG()if a.farm.Visible then local IN,IO=ge()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,IN.."/"..IO)local yb=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local yc=ad()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aF(bj()),c.rolls,c.gifts,c.crates,yc and am(ab(yc))or"nothing",j.on and("   ["..j.title.." window open]")or"",
yb and("in "..yb.."s")or"off"))a.put(a.tgt,(#cb==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#cb<=3)and table.concat(cb,", ")or(#cb.." butters ticked"))))
if a.lit.tgt~=(#cb==0)then a.lit.tgt=(#cb==0)a.tgt.TextColor3=(#cb==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(f9,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and F.msg or"helping is off")a.put(a.srvCamp,e.Campfire and H.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ae.n,#ae.rarOrder,#cb))
end if a.but.Visible and bB.at~=ae.at then fX(false)end if a.crt.Visible then if M.built~=M.at then M.build()else M.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and F.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and H.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(J.msg~=""and J.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local yd=(E.rec.on and"on"or"")..(E.rec.off and((E.rec.on and"/"or"").."off")or"")
a.put(a.arL,E.msg~=""and E.msg or("auto roll  %s | knows %s%s"):format(E.isOn()and"running"or"stopped",yd~=""and yd or"nothing yet",#E.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(E.msg~="")then a.lit.arL=(E.msg~="")a.arL.TextColor3=E.msg~=""and l.warn or l.dim end end end cZ.SAB={S=c,CFG=e,EV=aa,U=a,sg=nT,CAT=ae,LEARN=al,buildList=fX,
logAll=dU,evAll=dV,AR=E,CR=M,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=F,CF=H,QX=J,IX=q,SH=P}D(cc.." loaded")if c.uiErrs>0 then D("UI: "..c.uiErrs.." properties skipped")end
aW("farm")b5(a.root)b5(a.tgRoot)if iB then pcall(function()V(iB:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)b5(a.root)b5(a.tgRoot)end))end)end ca()x1()if c.config and c.config~=""then a.cfgName.Text=c.config end
O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(x_)task.spawn(function()local ye=z4()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(ye and("\n(backup: "..ye..")")or"")
local yf=gB(ao.exec)if yf and not yf:find("SAB autoloader v2",1,true)then d8(ao.exec,ao.stub)D("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(gB(ao.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(Ab)end)task.spawn(function()while c.alive do local IP,IQ=pcall(x_)if not IP then D("UI ERR "..tostring(IQ))end
task.wait((c.hidden or bi)and 1.5 or 0.4)end end)task.spawn(function()local IR,IS=pcall(Aj)if not IR then D("HOOK ERR "..tostring(IS))end
end)task.spawn(function()pcall(y3)if j.loadSeq and not j.learned then local jk={}for yg=1,20 do if j.loadSeq[yg]then jk[#jk+1]=j.loadSeq[yg]end end
if#jk>0 then j.learned={seq=jk,mode=j.loadMode}D("remembered how to open crates directly")end end if j1()then D(("catalog: %d butters in %d rarities"):format(ae.n,#ae.rarOrder))end
local IT,yh=pcall(Fc)if IT and yh and c.alive and not c.manualPad then c.manualPad=yh end end)task.spawn(function()
while c.alive do local oT,oU=pcall(o.buyTick)if not oT then D("PET ERR "..tostring(oU))task.wait(5)end oT,oU=pcall(o.wishTick)
if not oT then D("WISH ERR "..tostring(oU))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local jl,yi=0,z()
V(game:GetService("RunService").Heartbeat:Connect(function()jl=jl+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
V(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local yj=z()d.fps,jl,yi=jl/math.max(yj-yi,0.001),0,yj local IU,IV=pcall(d.tick)if not IU then D("PERF ERR "..tostring(IV))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local IW,IY=pcall(y.tick)if not IW then D("FUSE ERR "..tostring(IY))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local IZ,I0=pcall(A.tick)if not IZ then D("TEAM ERR "..tostring(I0))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local jm=ag:WaitForChild("Remotes",30)local yk=jm and jm:WaitForChild("ClanEvent",30)
if yk and c.alive then V(yk.OnClientEvent:Connect(function(I1,I2)if I1=="call"then pcall(F.onCall,I2)end end))
end local yl=jm and jm:FindFirstChild("RollConfirmAsk")if yl and c.alive then V(yl.OnClientEvent:Connect(function(I3)J.asked=I3 or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)pcall(d.walkPatch,true)end
end end)task.spawn(function()local oV=ag:WaitForChild("Remotes",30)if not(oV and c.alive)then return end local function jn(I4,I5)
local oW=oV:FindFirstChild(I4)if oW and oW:IsA("RemoteEvent")then V(oW.OnClientEvent:Connect(function(...)pcall(I5,...)end))end
end jn("NewSquishyDiscovered",function(oX,ym)if type(oX)~="string"then return end q.disc=q.disc or{}q.disc[ab(oX)]=true
D(("INDEX: %s%s is in your Index now"):format(am(ab(oX)),ym and(" ("..tostring(ym)..")")or""))end)jn("IndexRefresh",q.loadDisc)
jn("IndexRowComplete",function(I6)D("INDEX: the whole "..tostring(I6).." row is complete")end)jn("AdminShow",q.admin)
local yn=oV:FindFirstChild("AdminShowSync")if yn then local I7,yo=pcall(function()return yn:InvokeServer()end)
if I7 and type(yo)=="table"then for Mz,I8 in pairs(yo)do pcall(P.add,I8)end end end while c.alive do local I9,I_=pcall(q.tick)
if not I9 then q.msg="index error: "..tostring(I_)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Ja,Jb=pcall(J.tick)if not Ja then D("QUEST ERR "..tostring(Jb))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(gh)end end)pcall(E.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Jd=(type(newcclosure)=="function")and newcclosure or function(Jc)return Jc end local oY
local yp=(type(setnamecallmethod)=="function")and setnamecallmethod or nil oY=hookmetamethod(game,"__namecall",Jd(function(yq,...)
local f4=getnamecallmethod()if c.alive and(f4=="InvokeServer"or f4=="FireServer")then local yr,ys=pcall(function()return yq.Name end)
if yr and ys=="CrateAction"and not j.replaying then pcall(j.saw,f4,...)elseif yr and ys=="AutoRollAction"and not E.replaying then pcall(E.saw,f4,...)end
if yp then yp(f4)end end return oY(yq,...)end))j.oldNC=oY end)end pcall(function()local f5=getgenv and getgenv()or _G
c.robuxBlocked=0 f5 .SAB_NOROBUX=f5 .SAB_NOROBUX or{n=0,last=""}if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
local bD=f5 .SAB_NOROBUX local cY=game:GetService("MarketplaceService")local Je={PromptGift=true,PromptLimitedSquishy=true,PromptMultMoneyGamepass=true,PromptServerLuck=true,
PromptShopCrate=true,PromptTimeSkip=true,PromptDoubleOfflineEarnings=true,FinishWaxOffer=true}pcall(function()
local Jg=(type(newcclosure)=="function")and newcclosure or function(Jf)return Jf end local yt yt=hookmetamethod(game,"__namecall",Jg(function(oZ,...)
local f6=getnamecallmethod()if c.alive and oZ==cY and type(f6)=="string"and f6:sub(1,6)=="Prompt"then bD.n,bD.last=bD.n+1,f6
return nil end if f6=="FireServer"or f6=="InvokeServer"then local Jh,yu=pcall(function()return oZ.Name end)if Jh and Je[yu]and c.alive then
bD.n,bD.last=bD.n+1,yu return nil end end return yt(oZ,...)end))end)local function f7(yv,Ji)pcall(function()V(cY[yv]:Connect(function(Jj,Jk)
bD.n,bD.last=bD.n+1,yv pcall(Ji,Jj,Jk)end))end)end f7("PromptProductPurchaseRequested",function(o0,Jl)cY:SignalPromptProductPurchaseFinished(typeof(o0)=="Instance"and o0 .UserId or o0,Jl,false)
end)f7("PromptGamePassPurchaseRequested",function(Jm,Jn)cY:SignalPromptGamePassPurchaseFinished(Jm,Jn,false)end)
f7("PromptPurchaseRequested",function(Jo,Jp)cY:SignalPromptPurchaseFinished(Jo,Jp,false)end)f7("PromptBundlePurchaseRequested",function(Jq,Jr)cY:SignalPromptBundlePurchaseFinished(Jq,Jr,false)end)
f7("PromptPremiumPurchaseRequested",function()cY:SignalPromptPremiumPurchaseFinished(false)end)end task.spawn(function()
local yw=f5 .SAB_NOROBUX.n while c.alive do task.wait(5)local dT=f5 .SAB_NOROBUX if dT and dT.n>yw then c.robuxBlocked,yw=dT.n,dT.n
D(("ROBUX PROMPT BLOCKED (%s) - %d so far"):format(dT.last,dT.n))end end end)end)if jq then V(K.Idled:Connect(function()pcall(function()jq:CaptureController()jq:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for MA=1,90 do if not c.alive then return end if K:GetAttribute("AutoRollOn")~=nil and ar()and(c.plot or bE())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then E.apply("joined")end while c.alive do task.wait(30)local jo=cj()
if jo and q.on()and not aP(jo.name)then jo=nil end if c.alive and e.AutoRoll and c.running and not E.isOn()and not jo and not ad()
and not j.waiting and not j.on and not c.busy then E.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for MB=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bE()if ar()and c.plot and q.any()then fv(true,true)D("started by itself")
return end task.wait(1)end if c.alive and not c.running then D("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bE()c.lastCollect=z()while c.alive do if c.running then local Js,yx=pcall(Gm)if not Js and yx~=jr then D("LOOP ERR "..tostring(yx))end
end task.wait(0.1)end end)jp("ready - the window is at the top left")end local Ju,o1=xpcall(yB,function(Jt)return tostring(Jt).."\n"..debug.traceback()end)
if not Ju then pcall(function()warn("SAB "..cc.." ERROR: "..tostring(o1))end)jp("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cc.." ERROR: "..tostring(o1))end)pcall(function()local yy=(type(getgenv)=="function"and getgenv())or _G
if type(yy.SAB_KILL)=="function"then yy.SAB_KILL()end for MC,Jv in ipairs({"SABFarmGui","SABToggle"})do local yz=K.PlayerGui:FindFirstChild(Jv)
if yz then yz:Destroy()end end end)pcall(function()local f8=Instance.new("ScreenGui")f8 .Name="SABError"f8 .ResetOnSpawn=false
f8 .DisplayOrder=1000 local a7=Instance.new("TextBox")a7 .Size=UDim2 .new(0,340,0,170)a7 .Position=UDim2 .new(0,10,0,50)
a7 .BackgroundColor3=Color3 .fromRGB(90,20,20)a7 .TextColor3=Color3 .new(1,1,1)a7 .TextSize=11 a7 .TextWrapped=true
a7 .ClearTextOnFocus=false a7 .TextXAlignment=Enum.TextXAlignment.Left a7 .TextYAlignment=Enum.TextYAlignment.Top
a7 .Text="SAB "..cc.." failed to start. Send this text:\n"..tostring(o1)a7 .Parent=f8 f8 .Parent=K:WaitForChild("PlayerGui")
end)end
