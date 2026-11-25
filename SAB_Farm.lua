local cb="v28"local oU=game:GetService("Players")local K=oU.LocalPlayer or oU.PlayerAdded:Wait()local function jj(yo)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..cb,Text=yo,Duration=6})
end)end jj("script started")local function yp()local ag=game:GetService("ReplicatedStorage")local ak=game:GetService("Workspace")
local oV=game:GetService("UserInputService")local cX=(type(getgenv)=="function"and getgenv())or _G if type(cX.SAB_KILL)=="function"then pcall(cX.SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jk=(function()local yq,yr=pcall(function()return game:GetService("VirtualUser")end)return yq and yr or nil end)()
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
local o,A,d,y,F,H,J={},{},{},{},{},{},{}local q,P={},{}local jl={}local jm,f3,dR,dS={},{},{},{}local function V(oW)jm[#jm+1]=oW return oW end
local function ah(ys)task.wait(ys)if not c.alive then error(jl,0)end end local function D(f4)f4=os.date("%H:%M:%S").." "..tostring(f4)
table.insert(f3,1,f4)if#f3>6 then table.remove(f3)end c.logN=(c.logN or 0)+1 dR[#dR+1]=f4 if#dR>80 then table.remove(dR,1)end
end local function f5(oX)if type(oX)~="string"then return""end return(oX:lower():gsub("[^%w]",""))end local function ab(yt)
local oY=f5(yt)local jn=oY:gsub("butter$","")if jn==""then jn=oY end return jn end local function aP(oZ)if type(oZ)~="string"then return false end
local jo=ab(oZ)if jo==""then return false end if q.want then return q.want(jo)end return e.Targets[jo]==true end
local function yu(dT)dT=dT:lower()return dT:find("squishy",1,true)~=nil or dT:match("butter$")~=nil or dT:match("butter[^%a]")~=nil
end local jp={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aF(dU)if type(dU)~="number"then return"?"end
local f6=1 while math.abs(dU)>=1000 and f6<#jp do dU=dU/1000 f6=f6+1 end local yv=string.format("%.2f",dU):gsub("%.?0+$","")
return yv..jp[f6]end local function yw(o0)if type(o0)~="string"then return nil end local yx,dV=o0:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jq=tonumber(yx)if not jq then return nil end if dV==""then return jq end local yy={qd="qa",qn="qi"}dV=yy[dV:lower()]or dV
for yz,yA in ipairs(jp)do if yA:lower()==dV:lower()then return jq*1000^(yz-1)end end return nil end local function bj()
local o1=K:GetAttribute("BoardValueMoney")if type(o1)=="number"then return o1 end local o2=K:FindFirstChild("leaderstats")
if o2 then for I7,yB in ipairs({"Cash","Money","Coins"})do local jr=o2:FindFirstChild(yB)if jr and type(jr.Value)=="number"then return jr.Value end
end end end local function f7(yC)local js=yC:GetFullName()if c.plot then local jt=c.plot:GetFullName()if js:sub(1,#jt)==jt then return js:sub(#jt+2)end
end return js end local function ar()local f8=K.Character if f8 and f8:FindFirstChild("HumanoidRootPart")then
local o3=f8:FindFirstChildOfClass("Humanoid")if o3 and o3 .Health>0 then return f8 end end end local function bD()
local ju=ak:FindFirstChild("Plots")if not ju then return nil end local function o4(yD)local o5=yD:FindFirstChild("Plate")
return o5~=nil and o5:FindFirstChild("EditStackAttachment",true)~=nil end local o6=K:GetAttribute("PlotNumber")
if o6~=nil then local jv=ju:FindFirstChild(tostring(o6))if jv and o4(jv)then return jv end end for I8,o7 in ipairs(ju:GetChildren())do
if o4(o7)then return o7 end end end local function dW(o8)local bE=o8 and o8 .Parent for I9=1,6 do if not bE then return nil end
if bE:IsA("BasePart")then return bE end if bE:IsA("Model")then return bE.PrimaryPart or bE:FindFirstChildWhichIsA("BasePart",true)end
bE=bE.Parent end end local function o9(o_)local jw=o_.Parent if jw and jw:IsA("Attachment")then return jw.WorldPosition end
local pa=dW(o_)return pa and pa.Position end local function pb()local cY=c.plot and c.plot:FindFirstChild("Plate")
if not cY then return nil end if cY:IsA("BasePart")then return cY.Position end if cY:IsA("Model")then return cY:GetPivot().Position end
local pc=cY:FindFirstChildWhichIsA("BasePart",true)return pc and pc.Position end local function pd()local jx={}
local pe=c.plot and c.plot:FindFirstChild("WaxStations")if pe then for I_,yE in ipairs(pe:GetChildren())do local pf=yE:FindFirstChild("SquishyPlaceHolder")
local jy=pf and pf:FindFirstChild("PlacePrompt")if jy and jy:IsA("ProximityPrompt")then jx[#jx+1]=jy end end end
return jx end local function f9()local pg,jz=pd(),0 for Ja,yF in ipairs(pg)do if yF.Enabled then jz=jz+1 end end
local jA=#pg local jB=K:GetAttribute("WaxStations")if type(jB)=="number"and jB>jA then jA=jB end return jz,jA
end local function yG()local ph=ar()local pj=ph and ph.HumanoidRootPart.Position local jC,pk for Jb,jD in ipairs(pd())do
if jD.Enabled then local pl=o9(jD)local pm=(pl and pj)and(pl-pj).Magnitude or 1e9 if not jC or pm<pk then jC,pk=jD,pm end
end end return jC end local function pn()local f_=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not f_ then return nil end local po=f_:FindFirstChild("BuyPromptAttachment")local ga=(po and po:FindFirstChild("BuyPrompt"))or f_:FindFirstChild("BuyPrompt",true)
if ga and ga:IsA("ProximityPrompt")and ga:IsDescendantOf(f_)then return ga end end local pp={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local yH={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local al={order={},price={},dirty=false}local M={seen={},at=0,boxes={},built=0}local ae={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jE="SAB_order.txt"local function gb()if not al.dirty or type(writefile)~="function"then return end local aG={}
for yI,yJ in pairs(al.price)do aG[#aG+1]="P|"..yI.."|"..string.format("%.0f",yJ)end for yK,yL in pairs(al.order)do aG[#aG+1]="O|"..yK.."|"..table.concat(yL,",")end
if j.learned and j.enc then aG[#aG+1]="M|mode|"..tostring(j.learned.mode or"")for yM,gc in ipairs(j.learned.seq)do
local pq={}for ps=1,gc.n do pq[ps]=j.enc(gc.args[ps])end aG[#aG+1]=("A|%d|%s|%d|%s"):format(yM,gc.m,gc.n,table.concat(pq,";"))
end end local function jF(yN,yO,gd)local pt={}for pu=1,gd.n do pt[pu]=j.enc(gd.args[pu])end aG[#aG+1]=("R|%d|%s|%s|%d|%s"):format(yO,yN,gd.m,gd.n,table.concat(pt,";"))
end if j.enc then for yP,yQ in ipairs(E.rec.rules)do jF("rules",yP,yQ)end if E.rec.on then jF("on",0,E.rec.on)end
if E.rec.off then jF("off",0,E.rec.off)end end for Jc,dX in pairs(M.seen)do aG[#aG+1]=("K|%s|%s|%s|%s"):format(dX.name,dX.title or"",dX.rar or"",dX.price and string.format("%.0f",dX.price)or"")
end if pcall(writefile,jE,table.concat(aG,"\n"))then al.dirty=false end end local function yR()if type(isfile)~="function"or type(readfile)~="function"then return end
local yS,yT=pcall(isfile,jE)if not(yS and yT)then return end local yU,pv=pcall(readfile,jE)if not(yU and type(pv)=="string")then return end
for yV in pv:gmatch("[^\n]+")do local cZ,c0,bk=yV:match("^(%a)|([^|]+)|(.*)$")if cZ=="P"then al.price[c0]=tonumber(bk)
elseif cZ=="M"then j.loadMode=(bk~=""and bk~="nil")and bk or nil elseif cZ=="A"and j.dec then local pw=tonumber(c0)
local px,ge,yW=bk:match("^([^|]+)|(%d+)|(.*)$")if pw and px then ge=tonumber(ge)local py,gf={},0 for yX in(yW..";"):gmatch("([^;]*);")do
gf=gf+1 if gf<=ge then py[gf]=j.dec(yX)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pw]={m=px,n=ge,args=py}end elseif cZ=="R"and j.dec then
local pz=tonumber(c0)local gg,yY,gh,yZ=bk:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pz and gg then gh=tonumber(gh)
local pA,gi={},0 for y0 in(yZ..";"):gmatch("([^;]*);")do gi=gi+1 if gi<=gh then pA[gi]=j.dec(y0)end end local jG={m=yY,n=gh,args=pA}
if gg=="rules"then E.rec.rules[pz]=jG elseif gg=="on"then E.rec.on=jG elseif gg=="off"then E.rec.off=jG end end
elseif cZ=="K"then local pB,pC,y1=bk:match("^([^|]*)|([^|]*)|(.*)$")M.seen[M.key(c0)]={name=c0,title=pB~=""and pB or nil,
rar=pC~=""and pC or nil,price=tonumber(y1)}elseif cZ=="O"and bk~=""then local gj={}for y2 in bk:gmatch("[^,]+")do gj[#gj+1]=y2 end
if#gj>0 then al.order[c0]=gj end end end end local function y3(gk)if type(gk)~="table"then return end local cc,pD=gk.rarity,gk.contents
if type(cc)~="string"or cc==""or type(pD)~="table"then return end local dY={}for Jd,gl in ipairs(pD)do if type(gl)=="table"and type(gl.butter)=="string"then
dY[#dY+1]={n=gl.butter,ch=tonumber(gl.chance)or 0}end end if#dY==0 then return end table.sort(dY,function(y4,y5)return y4 .ch>y5 .ch end)
local dZ,d0={},false for y6,y7 in ipairs(dY)do dZ[y6]=y7 .n end local jH=al.order[cc]if not jH or#jH~=#dZ then d0=true end
if not d0 then for pE=1,#dZ do if jH[pE]~=dZ[pE]then d0=true break end end end al.order[cc]=dZ local jI=tonumber(gk.price)
if jI and al.price[cc]~=jI then al.price[cc]=jI d0=true end if d0 then al.dirty=true ae.at=0 D("learned the "..cc.." order from its crate")
end end local function c1(y8,y9)local y_=y8:FindFirstChild(y9,true)local za,jJ=pcall(function()return y_.Text end)
return(za and type(jJ)=="string"and jJ~="")and jJ or nil end local function am(pF)return ae.pretty[pF]or pF end
M.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function M.key(zb)return f5(zb or"")end
function M.learn(bl)if type(bl)~="table"or type(bl.name)~="string"then return end local jK=M.key(bl.name)local bm=M.seen[jK]or{}
local zc=(M.seen[jK]==nil)or(tonumber(bl.price)and bm.price~=tonumber(bl.price))bm.name,bm.title=bl.name,bl.title or bm.title
bm.rar,bm.price=bl.rarity or bm.rar,tonumber(bl.price)or bm.price M.seen[jK]=bm if zc then M.at,al.dirty=z(),true end
end function M.wanted(pG)if pG==nil then return false end local jL=M.key(pG)return e.CrateTicks[jL]==true or(e.BestCrate and q.bestCrate~=nil and(jL==q.bestCrate or jL==q.bestCrateTitle))
end function M.list()local c2={}for zd,gm in ipairs(M.base)do c2[M.key(gm[1])]={name=gm[1],title=gm[2],rar=gm[3],i=zd}end
for Je,d1 in ipairs(ae.rarOrder)do local pH=false for Jf,ze in pairs(c2)do if ze.rar==d1 then pH=true break end end
if not pH and d1~="?"then local pI=d1:gsub("[^%w]","").."Crate"c2[M.key(pI)]={name=pI,title=d1 .." Crate",rar=d1,i=50,guess=true}
end end for pJ,gn in pairs(M.seen)do local a8=c2[pJ]or{i=100}a8 .name,a8 .title,a8 .rar=gn.name or a8 .name,gn.title or a8 .title,gn.rar or a8 .rar
a8 .price,a8 .guess=gn.price or a8 .price,nil c2[pJ]=a8 end local d2,go={},{}for zf,zg in ipairs(pp)do d2[zg]=zf end
for zh,pK in ipairs(ae.rarOrder)do d2[pK]=d2[pK]or(20+zh)end for zi,d3 in pairs(c2)do d3 .k=zi d3 .price=d3 .price or al.price[d3 .rar or""]
go[#go+1]=d3 end table.sort(go,function(cd,ce)if cd.price and ce.price and cd.price~=ce.price then return cd.price<ce.price end
local pL,pM=d2[cd.rar or""]or 99,d2[ce.rar or""]or 99 if pL~=pM then return pL<pM end if(cd.i or 100)~=(ce.i or 100)then return(cd.i or 100)<(ce.i or 100)end
return cd.k<ce.k end)return go end local function zj()local pN=ag:FindFirstChild("Assets")local pO=pN and pN:FindFirstChild("Squishies")
if not pO then return false end local jM,pP,c3={},{},{}local gp=0 for Jg,gq in ipairs(pO:GetChildren())do local d4=ab(gq.Name)
if d4~=""and not jM[d4]then local gr=c1(gq,"RarityText")or"?"jM[d4]=gr pP[d4]=c1(gq,"NameText")or gq.Name c3[gr]=c3[gr]or{}
table.insert(c3[gr],d4)gp=gp+1 end end if gp==0 then return false end for pQ,zk in pairs(c3)do local pR=al.order[pQ]or yH[pQ]
local jN={}if pR then for zl,zm in ipairs(pR)do jN[ab(zm)]=zl end end table.sort(zk,function(pS,pT)local jO,jP=jN[pS],jN[pT]
if jO and jP then return jO<jP end if jO then return true end if jP then return false end return am(pS)<am(pT)
end)end local jQ={}for zn,zo in ipairs(pp)do jQ[zo]=zn end local gs,cf={},{}for zp in pairs(c3)do gs[#gs+1]=zp end
pcall(function()for zq,zr in ipairs(require(ag.Modules.SquishyRNG).Keys)do cf[zr]=zq end end)table.sort(gs,function(c4,c5)
if cf[c4]and cf[c5]and cf[c4]~=cf[c5]then return cf[c4]<cf[c5]end local jR,jS=al.price[c4],al.price[c5]if jR and jS and jR~=jS then return jR<jS end
local jT,jU=jQ[c4],jQ[c5]if jT and jU then return jT<jU end if jT then return true end if jU then return false end
return c4<c5 end)ae.rar,ae.pretty,ae.members,ae.rarOrder,ae.n,ae.at=jM,pP,c3,gs,gp,z()return true end local function jV()
if ae.at==0 or(z()-ae.at)>120 then pcall(zj)end return ae.n>0 end local function zs(zt)local pU=ab(zt)return ae.rar[pU]or(aa.name and ab(aa.name)==pU and aa.rar)or"?"
end local function zu()local gt={}local zv=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for zw,zx in pairs(zv)do if zx then gt[#gt+1]=am(zw)end end
table.sort(gt)return gt end local ao={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function pV()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gu(pW)if type(makefolder)~="function"then return end local zy,zz=pcall(isfolder,pW)if not(zy and zz)then pcall(makefolder,pW)end
end local function gv(pX)if type(isfile)~="function"or type(readfile)~="function"then return nil end local zA,zB=pcall(isfile,pX)
if not(zA and zB)then return nil end local zC,zD=pcall(readfile,pX)return zC and zD or nil end local function d5(zE,zF)
if type(writefile)~="function"then return false end return(pcall(writefile,zE,zF))end local function pY(zG)local d6={}
if type(listfiles)~="function"then return d6 end local zH,pZ=pcall(listfiles,zG)if not zH or type(pZ)~="table"then return d6 end
for Jh,zI in ipairs(pZ)do d6[#d6+1]=tostring(zI)end return d6 end local function p0()local gw={}for Ji,zJ in ipairs(pY(ao.cfg))do
local p1=zJ:match("([^/\\]+)%.txt$")if p1 then gw[#gw+1]=p1 end end table.sort(gw)return gw end local function zK()
local ac={"V|1"}ac[#ac+1]="N|Every|"..tostring(e.Every)ac[#ac+1]="N|GlazeLead|"..tostring(e.GlazeLead)ac[#ac+1]="N|FpsCap|"..tostring(e.FpsCap)
ac[#ac+1]="N|MemLimit|"..tostring(e.MemLimit)ac[#ac+1]="N|Best|"..tostring(e.Best or 0)for Jj,p2 in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ac[#ac+1]="S|"..p2 .."|"..e[p2]end
do local gx={}for zL,gy in pairs(e.Pets)do local p3=(gy.b and"b"or"")..(gy.g and"g"or"")..(gy.w and"w"or"")..(tonumber(gy.f)==-1 and"k"or"")
if p3~=""then gx[#gx+1]=zL.."|"..p3 end end table.sort(gx)ac[#ac+1]="P|-"for Jk,zM in ipairs(gx)do ac[#ac+1]="P|"..zM end
end for Jl,p4 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
ac[#ac+1]="B|"..p4 .."|"..(e[p4]and"1"or"0")end local jW=K:GetAttribute("AutoRollRules")if type(jW)=="string"and jW~=""then e.ARrules,e.ARstop=jW,tostring(K:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then ac[#ac+1]="S|rules|"..e.ARrules ac[#ac+1]="S|stop|"..e.ARstop end if c.winPos then ac[#ac+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ac[#ac+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Jm,jX in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gz={}for zN,zO in pairs(jX[2])do if zO then gz[#gz+1]=zN end end table.sort(gz)ac[#ac+1]=jX[1].."|-"for Jn,zP in ipairs(gz)do ac[#ac+1]=jX[1].."|"..zP end
end return table.concat(ac,"\n")end local function zQ(jY)if type(jY)~="string"or jY==""then return false end local p5,p6,p7,p8,d7={},false,{},false,nil
for zR in jY:gmatch("[^\n]+")do local aH,ai,aA=zR:match("^(%a)|([^|]*)|?(.*)$")if aH=="N"and ai=="Every"then local jZ=tonumber(aA)
if jZ and jZ>=1 then e.Every=math.floor(jZ)end elseif aH=="N"and(ai=="FpsCap"or ai=="MemLimit")then local j0=tonumber(aA)
if j0 and j0>=0 then e[ai]=math.floor(j0)end elseif aH=="N"and ai=="Best"then local gA=tonumber(aA)if gA and gA>=0 and gA<=4 then e.Best=math.floor(gA)end
elseif aH=="N"and ai=="GlazeLead"then local gB=tonumber(aA)if gB and gB>=5 and gB<=600 then e.GlazeLead=math.floor(gB)end
elseif aH=="S"and(ai=="TeamNormal"or ai=="TeamFull"or ai=="TeamGlaze"or ai=="TeamWax")then e[ai]=aA elseif aH=="P"and ai~=""then
if not d7 then d7={}end if ai~="-"and aA~=""then d7[ai]={b=aA:find("b",1,true)and true or nil,g=aA:find("g",1,true)and true or nil,
w=aA:find("w",1,true)and true or nil,f=aA:find("k",1,true)and-1 or nil}end elseif aH=="B"then if e[ai]~=nil then e[ai]=(aA=="1")end
elseif aH=="S"and ai=="rules"then e.ARrules=aA elseif aH=="S"and ai=="stop"then e.ARstop=aA elseif aH=="W"then
c.winPos={tonumber(ai)or 10,tonumber(aA)or 44}elseif aH=="G"then c.togPos={tonumber(ai)or 10,tonumber(aA)or 300}
elseif aH=="T"and ai~=""then if ai~="-"then p5[ai]=true end p6=true elseif aH=="K"and ai~=""then if ai~="-"then p7[ai]=true end
p8=true end end if p6 then e.Targets=p5 end if p8 then e.CrateTicks=p7 end if d7 then e.Pets=d7 end return true
end local function gC(c6)if not pV()then return false,"this executor cannot write files"end c6=(c6 or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c6==""then return false,"give the config a name"end gu(ao.dir)gu(ao.cfg)if not d5(ao.cfg.."/"..c6 ..".txt",zK())then return false,"could not write the file"end
c.config=c6 return true,c6 end local function p9(gD)local p_=gv(ao.cfg.."/"..gD..".txt")if not p_ then return false,"no config called "..tostring(gD)end
if not zQ(p_)then return false,"that config looks empty"end c.config=gD return true,gD end local function qa(j1)
if j1 then gu(ao.dir)d5(ao.auto,j1)elseif type(delfile)=="function"then pcall(delfile,ao.auto)else d5(ao.auto,"")
end c.autoload=j1 end local function zS()if c.selfPath then return c.selfPath end local gE for Jo,zT in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ao.dir})do
for Jp,qb in ipairs(pY(zT))do local j2=qb:lower()if j2:sub(-4)==".lua"and(j2:find("sab_farm",1,true)or j2:find("sab farm",1,true))then
gE=gE or qb end end end c.selfPath=gE return gE end ao.stub=[[
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
local function zU()if not pV()then return false,"this executor cannot write files"end gu("autoexec")if not d5(ao.exec,ao.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gF=(function()local zV,zW=pcall(function()return game:GetService("TeleportService")end)return zV and zW or nil end)()
local function qc()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local zX=queueonteleport or queue_on_teleport return(pcall(zX,ao.stub))end local function d8(zY)if c.rejoining then return end
c.rejoining=true D("REJOIN ("..zY..")")pcall(gb)if c.autoload then pcall(gC,c.autoload)end local zZ=qc()D(zZ and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Jq=1,30 do if not gF then break end pcall(function()gF:Teleport(game.PlaceId,K)end)task.wait(10)
end end)end local function z0()local z1,qe=pcall(function()return game:GetService("GuiService")end)if z1 and qe then
pcall(function()V(qe.ErrorMessageChanged:Connect(function()if e.Rejoin then d8("roblox error message")end end))
end)end pcall(function()local qf=game:GetService("CoreGui")local qg=qf and qf:WaitForChild("RobloxPromptGui",15)
local qh=qg and qg:WaitForChild("promptOverlay",15)if qh then V(qh.ChildAdded:Connect(function(z2)if e.Rejoin and tostring(z2 .Name):lower():find("errorprompt",1,true)then d8("disconnect prompt")end
end))end end)if gF then pcall(function()V(gF.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()d8("teleport retry")end)end
end))end)end end local function qi(z3)local qj=c.plot and c.plot:FindFirstChild(z3)if not qj then return nil,false end
for Jr,j3 in ipairs(qj:GetChildren())do if j3:IsA("Model")or j3:IsA("BasePart")then return j3,true end end return nil,true
end local function cg()local bF=qi("RolledSquishy")if not bF then return nil end return{model=bF,name=bF.Name,pretty=c1(bF,"NameText")or am(ab(bF.Name)),
rar=c1(bF,"RarityText")or zs(bF.Name),price=c1(bF,"PriceText")}end local function qk(j4)return type(j4)=="string"and(ae.rar[ab(j4)]~=nil or yu(j4))
end local function ad()local j5=qi("SquishyEquipped")if j5 then c.carrySrc,j.heldAt="model",z()return j5 .Name,j5 end
local ql=K.Character if ql then for Js,d9 in ipairs(ql:GetDescendants())do if(d9:IsA("Model")or d9:IsA("Tool"))and qk(d9 .Name)then
c.carrySrc,j.heldAt="character",z()return d9 .Name,d9 end end end local gG=K:GetAttribute("SquishyEquipped")if type(gG)=="string"and gG~=""and qk(gG)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gG,nil end c.carrySrc=nil end local function Jt()local Ju,z4=ad()return z4 end local function d_()
local qm=cg()local j6=qm and yw(qm.price)local j7=bj()if j6 and j7 and j7<j6*0.5 then return j7,j6 end end local function cj(z5)
dS[#dS+1]=os.date("%H:%M:%S").." "..z5 if#dS>40 then table.remove(dS,1)end end local function z6(ck,gH)if type(ck)~="string"then return end
cj(("Roll(%s,%s)"):format(ck,tostring(gH)))if ck:lower():find("crate",1,true)then j.rolled,j.rolledAt=ck,z()return
end aa.seq=aa.seq+1 aa.name,aa.at=ck,z()aa.rar=type(gH)=="string"and gH or nil c.rolls=c.rolls+1 if aP(ck)then D(("ROLL %s [%s] = TARGET"):format(ck,tostring(gH)))end
end local function z7(cl)if type(cl)~="table"then return end local gI=cl.butter or cl.itemName if type(gI)~="string"then return end
c.gifts=c.gifts+1 aa.gift,aa.giftAt=gI,z()if type(cl.giftId)=="string"then local qo=ag:FindFirstChild("Remotes")
local qp=qo and qo:FindFirstChild("GiftThanks")if qp then pcall(function()qp:FireServer(cl.giftId)end)end end
cj("Gift("..gI.." from "..tostring(cl.fromName)..")")D(("GIFT from %s: %s - it will not be waxed"):format(tostring(cl.fromName),gI))
end local function z8()local qq=ag:WaitForChild("Remotes",30)if not c.alive then return end if not qq then D("Remotes folder missing - no roll events")return end
V(K:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local qr=K:GetAttribute("SquishyEquipped")
if type(qr)=="string"and qr~=""then j.heldAt=z()end end))local Ad={SquishyRollAnimation=z6,InitSquishy=function(qs)aa.init,aa.initAt=tostring(qs),z()cj("Init("..tostring(qs)..")")end,
CrateUpdate=function(c7,qt)pcall(y3,c7)pcall(M.learn,c7)if type(c7)=="table"then local z9=qt==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not z9 then return end local z_=not j.waiting local Aa=j.on j.waiting,j.data,j.at=true,c7,z()j.on=(qt==true)
j.title=tostring(c7 .title or c7 .name or"crate")if j.on and not Aa then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cj("CrateWindow open("..j.title..")")elseif z_ then cj("Crate waiting("..j.title..")")D(j.title.." is waiting on your stand")
end else if j.waiting then cj("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local Ab=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,Ab)end if j.classify then local Ac=z()
task.spawn(function()pcall(j.classify,Ac)end)end end end,GiftReceived=z7,}for gJ,Ae in pairs(Ad)do local j8=qq:FindFirstChild(gJ)
if j8 and j8:IsA("RemoteEvent")then V(j8 .OnClientEvent:Connect(Ae))elseif gJ~="CrateUpdate"and gJ~="GiftReceived"then D("remote "..gJ.." missing")end
end end local function j9()local cm=cg()if cm then if aP(cm.name)then return{state="match",shown=cm.pretty,src="pad",info=cm}
end return{state="skip",info=cm,level="idle",text=("on pad: %s [%s] - not ticked"):format(cm.pretty,tostring(cm.rar))}
end if aa.name and(z()-aa.at)<4 then if aP(aa.name)then return{state="match",shown=am(ab(aa.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(am(ab(aa.name)),tostring(aa.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gK(Af,Ag,Ah,Ai)
local gL=RaycastParams.new()gL.FilterType=Enum.RaycastFilterType.Exclude local j_={K.Character}for Jv,Aj in ipairs(Ai or{})do j_[#j_+1]=Aj end
gL.FilterDescendantsInstances=j_ pcall(function()gL.RespectCanCollide=true end)local qu=ak:Raycast(Vector3 .new(Af,Ag+4,Ah),Vector3 .new(0,-30,0),gL)
return qu and qu.Position or nil end local function c8(qv)local qw=qv:FindFirstChildOfClass("Humanoid")return((qw and qw.HipHeight)or 2)+qv.HumanoidRootPart.Size.Y/2+0.2
end local function ka(Ak,Al)local kb=Ak:FindFirstChildOfClass("Humanoid")local Am=z()while z()-Am<Al do if kb and(kb.FloorMaterial~=Enum.Material.Air or kb.SeatPart)then return true end
ah(0.05)end return false end local function aD(An,kc,kd)local qx=An.HumanoidRootPart qx.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qx.CFrame=kd and CFrame.new(kc,Vector3 .new(kd.X,kc.Y,kd.Z))or CFrame.new(kc)end local function cn(bn,qy)local co=ar()
if not co or not bn then return false end local bG=bn.Position local gM=math.clamp(math.max(bn.Size.X,bn.Size.Z)/2+2.2,3,7)
local qz=(qy and qy.MaxActivationDistance)or 10 if gM>qz-2 then gM=math.max(2.5,qz-2)end local ea={}local function cp(eb)
eb=Vector3 .new(eb.X,0,eb.Z)if eb.Magnitude>0.05 then ea[#ea+1]=eb.Unit end end local qA=pb()if qA then cp(qA-bG)end
cp(bn.CFrame.LookVector)cp(-bn.CFrame.LookVector)cp(bn.CFrame.RightVector)cp(-bn.CFrame.RightVector)cp(co.HumanoidRootPart.Position-bG)
if#ea==0 then cp(Vector3 .new(0,0,1))end local Ao,gN=c8(co),false for Jw,Ap in ipairs(ea)do local gO=bG+Ap*gM
local ke=gK(gO.X,bG.Y,gO.Z,{bn})if ke and math.abs(ke.Y-bG.Y)<14 then aD(co,Vector3 .new(gO.X,ke.Y+Ao,gO.Z),bG)
if ka(co,0.7)then gN=true break end end end if not gN then aD(co,bG+ea[1]*gM+Vector3 .new(0,3,0),bG)gN=ka(co,1)
end ah(0.12)return gN end local function qB(ec)if not ec.Parent or not ec.Enabled then return false end pcall(function()ec:InputHoldBegin()end)
ah(math.max(ec.HoldDuration,0)+0.08)pcall(function()ec:InputHoldEnd()end)return true end local function ap(qC,Aq)
local Ar=z()while z()-Ar<Aq do if qC()then return true end ah(0.05)end return qC()end local function ed(c9,As,qD,At)
local Au=c.zapFirst and{"zap","hold"}or{"hold","zap"}for Av,kf in ipairs(Au)do if Av==2 and(At or not(c9 .Parent and c9 .Enabled and(not qD or qD())))then break end
local kg if kf=="hold"then kg=qB(c9)else kg=type(fireproximityprompt)=="function"and c9 .Parent~=nil and c9 .Enabled and pcall(fireproximityprompt,c9)end
if kg and ap(As,1.2)then c.zapFirst=(kf=="zap")return true,kf end end return false end local function qE(kh)local bH=pn()
if not bH or not bH.Enabled then D("buy: nothing on the pad")return false end local ki=dW(bH)if not ki then D("buy: pad part missing")return false end
c.lastBuyAt=z()local Aw,qF=aa.seq,bj()local qG=ar()local Ax=qG and(qG.HumanoidRootPart.Position-ki.Position).Magnitude>12
cn(ki,bH)if Ax then ah(0.4)end if not bH.Enabled then D("buy aborted: pad emptied")return false end local c_=j9()
if not kh and c_.state~="match"then D("buy aborted: "..(c_.text or"pad changed"))c.matchSince=nil return false
end local kj=c_.info and c_.info.name or(c_.state=="match"and aa.name)or nil local function Ay()return bH.Enabled and ad()==nil and(kh or j9().state=="match")
end local Az,AA=ed(bH,function()return ad()~=nil or((not bH.Enabled)and(kh or aa.seq==Aw))end,Ay,d_()~=nil)if Az then
ap(function()return ad()~=nil end,0.8)local ee=ad()local qH=bj()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil aa.name,aa.rar,aa.at=nil,nil,z()D(("BOUGHT %s%s via %s"):format(ee and am(ab(ee))or(c_.shown or"?"),(qF and qH)and(" for $"..aF(qF-qH))or"",AA))
if ee and kj and ab(ee)~=ab(kj)then D(("note: picked up %s, not %s"):format(ee,kj))end return true end local gP=cg()
if d_()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("BUY REFUSED: cash short - have $%s, price %s"):format(aF(bj()),(gP and gP.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)D(("buy did not go through (%s, try %d) - again in %ds"):format(gP and gP.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qI()local ef=ad()if not ef then c.holding=false D("place: hands are empty")
return false end if not aP(ef)then D(("REFUSED TO WAX %s - it is not ticked"):format(am(ab(ef))))return false
end for Jx=1,e.PlaceTries do local bI=yG()if not bI then D("place: no free station")break end local qJ=dW(bI)
if qJ then cn(qJ,bI)local qK=ad()if not qK then c.holding=false D("place: hands emptied on the way")return false end
if not aP(qK)then D("place: what I carry changed, not waxing it")return false end if bI.Enabled then local AB,AC=ed(bI,function()return not bI.Enabled end,function()return bI.Enabled end)
if AB then c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 aa.name,aa.rar,aa.at=nil,nil,z()
D(("WAXED %s #%d at %s via %s"):format(am(ab(ef)),c.placed,bI.Parent.Parent.Name,AC))if q.placed then pcall(q.placed,ef)end
return true end end end ah(0.25)end c.placeFails=c.placeFails+1 if ad()==nil then c.holding=false end D("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ad()))D(c.capMsg)end return false end function A.place()local AD=z()while c.alive and A.editing and z()-AD<25 do ah(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local AE=z()while c.alive and A.current()~=e.TeamWax and z()-AE<5 do ah(0.1)end
if A.current()==e.TeamWax then ah(0.3)else D("wax team did not come on in time - placing anyway")end end local AF,qL=pcall(qI)
A.placing=false if not AF then error(qL,0)end return qL end local function qM(qN)return type(qN)=="string"and qN:lower():find("crate",1,true)~=nil
end local AG={SABFarmGui=1,SABToggle=1,SABError=1}local function kk(AH)local bJ=AH while bJ do if AG[bJ.Name]then return false end
if bJ:IsA("ScreenGui")then local AI,AJ=pcall(function()return bJ.Enabled end)return(not AI)or AJ~=false end if bJ:IsA("GuiObject")and not bJ.Visible then return false end
bJ=bJ.Parent end return false end local function gQ(gR)local da=""pcall(function()if gR:IsA("TextButton")then da=gR.Text end end)
if not da:find("%a")then for Jy,gS in ipairs(gR:GetDescendants())do if(gS:IsA("TextLabel")or gS:IsA("TextButton"))and gS.Text:find("%a")then da=gS.Text break end
end end if not da:find("%a")then da=gR.Name end return(da:lower():gsub("[^%a]",""))end local function AK()local eg,eh
local qO=K:FindFirstChildOfClass("PlayerGui")if not qO then return nil,nil end for Jz,ei in ipairs(qO:GetDescendants())do
if ei:IsA("GuiButton")and kk(ei)then local kl=gQ(ei)if kl:sub(1,4)=="open"and not kl:find("shop",1,true)then eg=eg or ei end
if kl:sub(1,7)=="discard"then eh=eh or ei end end end if eg and eh then return eg,eh end if j.on then return eg,eh end
return nil,nil end local km=(function()local AL,AM=pcall(function()return game:GetService("VirtualInputManager")end)return AL and AM or nil end)()
local function qP(bo,kn)local ko={}local function qQ(AN)ko[#ko+1]=AN end if c.tapWay then qQ(c.tapWay)end for JA,qR in ipairs({"touch","conn","signal"})do
if qR~=c.tapWay then qQ(qR)end end local function qS(AO,...)local AP,kp=pcall(getconnections,AO)if not(AP and type(kp)=="table"and#kp>0)then return false end
local qT,AQ,AS=false,{...},select("#",...)for JB,AT in ipairs(kp)do if pcall(function()AT:Fire(table.unpack(AQ,1,AS))end)then qT=true end
end return qT end local function qU()local qV=Vector3 .new(0,0,0)pcall(function()local qW,qX=bo.AbsolutePosition,bo.AbsoluteSize
qV=Vector3 .new(qW.X+qX.X/2,qW.Y+qX.Y/2,0)end)local kq={Position=qV,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kq.UserInputType=Enum.UserInputType.Touch end)pcall(function()kq.UserInputState=Enum.UserInputState.End end)
return kq end for JC,bp in ipairs(ko)do local ej=false if bp=="conn"and type(getconnections)=="function"then if qS(bo.MouseButton1Click)then
ej=true if ap(kn,1.5)then c.tapWay=bp return true,bp end end ej=qS(bo.Activated,qU(),1)elseif bp=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bo.MouseButton1Click)then if ap(kn,1.5)then c.tapWay=bp return true,bp end end ej=pcall(firesignal,bo.Activated,qU(),1)
elseif bp=="touch"and km then ej=pcall(function()local qY,qZ=bo.AbsolutePosition,bo.AbsoluteSize local q0=0 local q1=bo:FindFirstAncestorWhichIsA("ScreenGui")
local AU,AV=pcall(function()return q1 and q1 .IgnoreGuiInset end)if not(AU and AV)then pcall(function()q0=game:GetService("GuiService"):GetGuiInset().Y end)
end local q2,q3=qY.X+qZ.X/2,qY.Y+qZ.Y/2+q0 km:SendMouseButtonEvent(q2,q3,0,true,game,1)task.wait(0.06)km:SendMouseButtonEvent(q2,q3,0,false,game,1)
end)end if ej and ap(kn,1.5)then c.tapWay=bp return true,bp end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kr(q4)local ek=q4 .Parent while ek and ek~=c.plot do if j.NOT[ek.Name]then return false end ek=ek.Parent
end local ks=(q4 .ActionText or""):lower()if ks:find("roll",1,true)or ks:find("place",1,true)or ks:find("sell",1,true)then return false end
return true end local function q5()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local q6=c.plot:FindFirstChild("CrateStand")local el if q6 then for JD,gT in ipairs(q6:GetDescendants())do
if gT:IsA("ProximityPrompt")and gT.Enabled and kr(gT)then el=gT break end end end if not el then for JE,bK in ipairs(c.plot:GetDescendants())do
if bK:IsA("ProximityPrompt")and bK.Enabled and kr(bK)then local q7=bK:FindFirstAncestorWhichIsA("Model")local AW=((bK.ActionText or"").." "..(bK.ObjectText or"").." "..bK.Name.." "..(q7 and q7 .Name or"")):lower()
if AW:find("crate",1,true)then el=bK break end end end end j.prompt=el return el end local function kt()if j.on then return true end
local em=q5()if not em then j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local q8=dW(em)if q8 then cn(q8,em)end j.ours=true ed(em,function()return j.on end)if ap(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: pressed "..f7(em).." but no window came up")
return false end do local function AX(q9)local db=q9 .Parent while db and db:IsA("GuiObject")do local q_,ra=false,false
for JF,en in ipairs(db:GetDescendants())do if en~=q9 and en:IsA("GuiButton")and gQ(en):sub(1,7)=="discard"then q_=true end
if en:IsA("TextLabel")then local ku=en.Text:lower()if ku:find("crate",1,true)or ku:find("can contain",1,true)or ku:find("cost",1,true)then ra=true end
end if q_ and ra then return db end end db=db.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local rb=K:FindFirstChildOfClass("PlayerGui")if not rb then return nil end for JG,gU in ipairs(rb:GetDescendants())do
if gU:IsA("GuiButton")and not gU:FindFirstAncestor("SABFarmGui")and gQ(gU):sub(1,4)=="open"then local kv=AX(gU)
if kv then j.win=kv return kv end end end end local function AY(AZ)for JH,gV in ipairs(AZ:GetDescendants())do
if gV:IsA("GuiButton")then local rc,kw=gQ(gV),gV.Name:lower()if rc=="x"or rc=="close"or kw=="x"or kw:find("close",1,true)or kw:find("exit",1,true)then return gV end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(A0)task.wait(A0 and 4 or 1.2)if j.on or j.waiting then return end
local gW=j.findWin()if not gW or not kk(gW)then return end local rd=AY(gW)if rd and qP(rd,function()return not kk(gW)end)then return end
D("the crate window is still open - tap its X")end end local function eo(gX)if not kt()then return false end local rf=z()-(j.openedAt or 0)
if rf<0.6 then ah(0.6-rf)end local kx=j.title local A1,A2=AK()local rg=gX and A1 or A2 if not rg then j.lastFail=z()
c.crateFails=c.crateFails+1 D(("crate: no %s button found in %s"):format(gX and"Open"or"Discard",kx))return false
end local A3=ad()local A4,JI=qP(rg,function()return(not j.on)or(ad()~=nil and ad()~=A3)end)if not A4 then j.lastFail=z()
c.crateFails=c.crateFails+1 D("crate: could not press "..(gX and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gX then c.crates=c.crates+1 ap(function()return ad()~=nil end,1.5)local rh=ad()
D(("OPENED %s -> %s"):format(kx,rh and am(ab(rh))or"?"))else D("discarded "..kx.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(A5,...)local A6=select("#",...)j.calls[#j.calls+1]={t=z(),m=A5,n=A6,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aI,bq)local bL=type(aI)if(bL=="string"or bL=="number")and type(bq.data)=="table"then for ri,ky in pairs(bq.data)do
if ky==aI and type(ri)=="string"and(type(ky)=="string"or type(ky)=="number")then return{__slot="f:"..ri}end end
end if bL=="string"then if bq.crate and aI==bq.crate then return{__slot="crate"}end if bq.title and aI==bq.title then return{__slot="title"}end
if bq.rar and aI==bq.rar then return{__slot="rarity"}end return aI end if bL=="number"or bL=="boolean"or bL=="nil"then return aI end
if bL=="table"then local rj={}for A7,rk in pairs(aI)do if type(rk)=="table"then return nil,"nested table"end local A8,rl=j.slot(rk,bq)
if rl then return nil,rl end rj[A7]=A8 end return rj end local A9,A_=pcall(function()return aI:IsA("Instance")end)
if A9 and A_ then if aI==K then return{__slot="player"}end if c.plot and aI==c.plot then return{__slot="plot"}end
local gY=c.plot and c.plot:FindFirstChild("CrateStand")if gY and aI==gY then return{__slot="stand"}end if gY and aI.Parent==gY then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bL..")"end function j.resolve(gZ)if type(gZ)~="table"then return gZ end
local aX=gZ.__slot if aX and aX:sub(1,2)=="f:"then return j.data and j.data[aX:sub(3)]end if aX=="crate"then return j.data and j.data.name end
if aX=="title"then return(j.data and j.data.title)or j.title end if aX=="rarity"then return j.data and j.data.rarity end
if aX=="player"then return K end if aX=="plot"then return c.plot end if aX=="stand"or aX=="model"then local kz=c.plot and c.plot:FindFirstChild("CrateStand")
if aX=="stand"or not kz then return kz end for JJ,rm in ipairs(kz:GetChildren())do if qM(rm.Name)then return rm end end
return nil end local rn={}for Ba,Bb in pairs(gZ)do rn[Ba]=j.resolve(Bb)end return rn end function j.classify(kA)
if j.directOff then return end local g0={}for JK,kB in ipairs(j.calls)do if kB.t<=kA+0.05 and kA-kB.t<=6 then g0[#g0+1]=kB end
end if#g0==0 then return end if not ap(function()return(j.heldAt or 0)>=kA-1 end,2.5)then return end local ep={}
for JL,eq in ipairs(g0)do local ro={}for rp=1,eq.n do local Bc,rq=j.slot(eq.args[rp],eq)if rq then D("crate call has "..rq.." - keeping the button method")
return end ro[rp]=Bc end ep[#ep+1]={m=eq.m,n=eq.n,args=ro}end local kC=j.learned j.learned={seq=ep,mode=kC and kC.mode or nil}
al.dirty=true if not kC then D(("learned how to open crates directly (%d call%s)"):format(#ep,#ep==1 and""or"s"))end
end function j.replay()local rr=j.learned local rs=ag:FindFirstChild("Remotes")local kD=rs and rs:FindFirstChild("CrateAction")
if not(rr and kD)then return false end local rt=table.unpack or unpack j.replaying=true for JM,er in ipairs(rr.seq)do
local kE={}for ru=1,er.n do kE[ru]=j.resolve(er.args[ru])end task.spawn(function()pcall(function()if er.m=="InvokeServer"then kD:InvokeServer(rt(kE,1,er.n))
else kD:FireServer(rt(kE,1,er.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(Bd)return(Bd:gsub("[%%|;=,\n]",function(Be)return("%%%02X"):format(Be:byte())end))end
function j.enc(cq)local g1=type(cq)if g1=="string"then return"s"..j.esc(cq)end if g1=="number"then return"n"..tostring(cq)end
if g1=="boolean"then return cq and"b1"or"b0"end if g1=="nil"then return"z"end if cq.__slot then return"k"..cq.__slot end
local kF={}for Bf,Bg in pairs(cq)do kF[#kF+1]=j.enc(Bf).."="..j.enc(Bg)end return"t"..table.concat(kF,",")end
function j.dec(rv)local es,et=rv:sub(1,1),rv:sub(2)local function Bh(Bi)return(Bi:gsub("%%(%x%x)",function(Bj)return string.char(tonumber(Bj,16))end))end
if es=="s"then return Bh(et)end if es=="n"then return tonumber(et)end if es=="b"then return et=="1"end if es=="k"then return{__slot=et}end
if es=="t"then local rw={}for Bk in et:gmatch("[^,]+")do local rx,Bl=Bk:match("^(.-)=(.*)$")if rx then local ry=j.dec(rx)
if ry~=nil then rw[ry]=j.dec(Bl)end end end return rw end return nil end function j.goneOrNew(Bm)return function()
if not j.waiting then return true end local rz=ad()return rz~=nil and rz~=Bm end end function j.near()local rA=ag:FindFirstChild("Remotes")
local kG=rA and rA:FindFirstChild("CrateAction")local g2=ar()local kH=c.plot and c.plot:FindFirstChild("CrateStand")
local kI=kH and kH:FindFirstChild("Spot")if not(kG and g2 and kI)then D(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kG and"no CrateAction remote"or not g2 and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kJ=g2 .HumanoidRootPart local g3=kJ.CFrame local rB,kK=j.title,"no answer"local Bn=ad()local rC=kH:FindFirstChild("Holder")
local function rD()if not rC then return j.waiting or j.on end for JN,Bo in ipairs(rC:GetChildren())do if Bo:IsA("Model")then return true end end
return false end for Bp=1,3 do if not(j.waiting or j.on)or not rD()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kJ.Position-kI.Position).Magnitude>8 then cn(kI,j.prompt)end ah(0.12+0.15*Bp)
local a9={}j.replaying=true task.spawn(function()a9 .ok,a9 .v=pcall(function()return kG:InvokeServer("open")end)
a9 .done=true end)ap(function()return a9 .done end,6)j.replaying=false local cr=a9 .v if a9 .done and a9 .ok and type(cr)=="table"and cr.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 D(("OPENED %s -> %s (no window)"):format(rB,cr.prize and am(ab(tostring(cr.prize)))or"?"))
ap(function()local rE=ad()return rE~=nil and rE~=Bn end,1.5)if(kJ.Position-g3 .Position).Magnitude>8 then pcall(function()aD(g2,g3 .Position,g3 .Position+g3 .LookVector)end)end
return true,"opened"end kK=(a9 .done and a9 .ok and type(cr)=="table")and tostring(cr.reason or"refused, no reason given")
or(a9 .done and("error: "..tostring(cr))or"no answer in 6s")ah(0.3)if not rD()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 D(("crate: the server would not open %s next to the stand (%s)"):format(rB,kK))
return false,kK end j.GIVEUP=600 function j.drop()local rF=ag:FindFirstChild("Remotes")local rG=rF and rF:FindFirstChild("CrateAction")
local rH=c.plot and c.plot:FindFirstChild("CrateStand")local kL=rH and rH:FindFirstChild("Spot")local rI=ar()
if kL and rI and(rI.HumanoidRootPart.Position-kL.Position).Magnitude>8 then cn(kL,j.prompt)ah(0.3)end local kM,br=false,nil
if rG then kM,br=pcall(function()return rG:InvokeServer("discard")end)end D(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(kM and type(br)=="table"and br.ok)and"done"or("answer: "..tostring(type(br)=="table"and(br.reason or br.ok)or br))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(kM and type(br)=="table"and br.ok)then eo(false)end end function j.smart()local kN=j.title if(j.nearFails or 0)<3 then
local Bq=j.near()if Bq then return true end if j.nearFails>=3 then D("opening next to the stand failed 3 times - trying the older ways")end
end local cs=j.learned if cs then local kO=ad()if j.on then j.replay()if ap(j.goneOrNew(kO),3.5)then c.crates=c.crates+1
D("OPENED "..kN.." (direct)")return true end else if cs.mode~="window"then j.replay()if ap(j.goneOrNew(kO),3.5)then
c.crates,j.fails=c.crates+1,0 if cs.mode~="direct"then cs.mode,al.dirty="direct",true D("crates now open directly - the window never comes up")
end D("OPENED "..kN.." (direct, no window)")return true end end if kt()then j.replay()if ap(j.goneOrNew(kO),3.5)then
c.crates,j.fails=c.crates+1,0 if cs.mode~="window"then cs.mode,al.dirty="window",true D("crates need their window up first - it shows briefly")
end D("OPENED "..kN.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,al.dirty=cs,nil,true
if j.fails>=3 then j.directOff=true D("direct crate opening failed 3 times - using the button for now")else D("the learned crate call did not work - back to pressing Open")
end end return eo(true)end function E.snap()return{rules=K:GetAttribute("AutoRollRules"),stop=K:GetAttribute("AutoRollStop"),
on=K:GetAttribute("AutoRollOn"),main=K:GetAttribute("AutoRoll")}end E.cache={}function E.watchCache()E.cache=E.snap()
for Br,rJ in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(K:GetAttributeChangedSignal(rJ):Connect(function()E.cache[Br]=K:GetAttribute(rJ)end))
end end function E.isOn()return K:GetAttribute("AutoRollOn")==true end function E.saw(Bs,...)local g4=E.cache
local Bt={m=Bs,n=select("#",...),args={...},before={rules=g4 .rules,stop=g4 .stop,on=g4 .on,main=g4 .main}}task.delay(1.5,function()
if c.alive then pcall(E.learnOne,Bt)end end)end function E.learnOne(eu)local aB,ev=E.snap(),eu.before local g5=(aB.rules~=ev.rules)or(aB.stop~=ev.stop)
local rK=(aB.on~=ev.on)or(aB.main~=ev.main)if not g5 and not rK then return end local rL={}for rM=1,eu.n do local aQ=eu.args[rM]
local ct=type(aQ)if ct=="string"and aQ~=""and aQ==aB.rules then aQ={__slot="rules"}elseif ct=="string"and aQ~=""and g5 and aQ==aB.stop and aB.stop~=ev.stop then aQ={__slot="stop"}
elseif ct=="table"then local rN={}for Bu,dc in pairs(aQ)do if type(dc)=="table"or(type(dc)=="userdata")then E.msg="Auto Roll sends something I cannot repeat"return
end rN[Bu]=(type(dc)=="string"and dc~=""and dc==aB.rules)and{__slot="rules"}or dc end aQ=rN elseif ct~="string"and ct~="number"and ct~="boolean"and ct~="nil"then
if aQ==K then aQ={__slot="player"}else E.msg="Auto Roll sends something I cannot repeat"return end end rL[rM]=aQ
end local dd={m=eu.m,n=eu.n,args=rL}if g5 then local kP=false for Bv=1,dd.n do local ew=dd.args[Bv]if type(ew)=="table"and ew.__slot=="rules"then kP=true end
if type(ew)=="table"and not ew.__slot then for JO,rO in pairs(ew)do if type(rO)=="table"and rO.__slot=="rules"then kP=true end end
end end if kP then E.rec.rules={dd}else table.insert(E.rec.rules,dd)if#E.rec.rules>60 then table.remove(E.rec.rules,1)end
end end if rK then if aB.on==true then E.rec.on=dd else E.rec.off=dd end e.AutoRoll=(aB.on==true)end if aB.rules and aB.rules~=""then e.ARrules,e.ARstop=aB.rules,aB.stop or""end
al.dirty=true E.msg=""D(("learned an Auto Roll %s message"):format(g5 and"choices"or(aB.on and"on"or"off")))end
function E.resolve(de)if type(de)~="table"then return de end if de.__slot=="rules"then return e.ARrules~=""and e.ARrules or K:GetAttribute("AutoRollRules")end
if de.__slot=="stop"then return e.ARstop~=""and e.ARstop or K:GetAttribute("AutoRollStop")end if de.__slot=="player"then return K end
local rP={}for Bw,Bx in pairs(de)do rP[Bw]=E.resolve(Bx)end return rP end function E.replay(rQ,By)local rR=table.unpack or unpack
for JP,ex in ipairs(By)do local kQ={}for rS=1,ex.n do kQ[rS]=E.resolve(ex.args[rS])end E.replaying=true pcall(function()
if ex.m=="InvokeServer"then task.spawn(function()pcall(function()rQ:InvokeServer(rR(kQ,1,ex.n))end)end)else rQ:FireServer(rR(kQ,1,ex.n))end
end)E.replaying=false task.wait(0.25)end end function E.apply(rT,Bz)if E.busy or not c.alive then return end E.busy=true
pcall(function()local rU=ag:FindFirstChild("Remotes")local kR=rU and rU:FindFirstChild("AutoRollAction")if not kR then E.msg="this game has no AutoRollAction"return end
local bM=e.AutoRoll if bM and e.ARrules~=""and K:GetAttribute("AutoRollRules")~=e.ARrules then if#E.rec.rules==0 then
E.msg="pick your Auto Roll choices once in the game's menu so I can learn them"D(E.msg)else E.replay(kR,E.rec.rules)
if ap(function()return K:GetAttribute("AutoRollRules")==e.ARrules end,4)then D("Auto Roll choices put back")else
E.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"D(E.msg)end end end if bM==E.isOn()or(not bM and not Bz)then return end
local g6=bM and E.rec.on or E.rec.off if not g6 then local ey=bM and E.rec.off or E.rec.on local rV=ey~=nil for BA=1,ey and ey.n or 0 do
if type(ey.args[BA])=="boolean"then rV=false end end if rV then g6=ey end end if not g6 then E.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bM and"on"or"off")
D(E.msg)return end E.replay(kR,{g6})if ap(function()return E.isOn()==bM end,4)then E.msg=""D(("Auto Roll switched %s%s"):format(bM and"ON"or"OFF",rT and(" ("..rT..")")or""))
else E.msg="Auto Roll did not switch - do it once in the game so I can relearn it"D(E.msg)end end)E.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local BB,BC=pcall(function()return K.UserId end)return BB and BC or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local BD,kS=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if BD and type(kS)=="table"and type(kS.Pets)=="table"then o.I=kS end return o.I end function o.order()if o.list then return o.list end
local bN=o.info()if not bN then return{}end local cu={}if type(bN.Order)=="table"and#bN.Order>0 then for JQ,rW in ipairs(bN.Order)do if bN.Pets[rW]then cu[#cu+1]=rW end end
else for BE in pairs(bN.Pets)do cu[#cu+1]=BE end table.sort(cu,function(BF,BG)return(bN.Pets[BF].price or 0)<(bN.Pets[BG].price or 0)end)
end o.list=cu return cu end function o.nice(rX,kT)local rY=o.info()local rZ=rY and rY.Pets[rX]return((kT and kT~="")and(kT.." ")or"")..(rZ and rZ.displayName or tostring(rX))
end function o.data()local g7=K:GetAttribute("PetsData")if type(g7)~="string"then return nil end if g7==o.rawD then return o.lastD end
local BH,ez=pcall(function()return o.HS:JSONDecode(g7)end)ez=(BH and type(ez)=="table")and ez or nil o.rawD,o.lastD=g7,ez
return ez end function o.pen()return ag:FindFirstChild("PetMeadowSpawns")end function o.srv()return ak:GetServerTimeNow()end
function o.money()local kU=K:FindFirstChild("MoneyValue")if kU and type(kU.Value)=="number"then return kU.Value end
return bj()or 0 end function o.wishes()local r0=o.pen()local r1=r0 and r0:GetAttribute("Wishes")local kV,r2={},o.srv()
if type(r1)~="string"then return kV end local BI,r3=pcall(function()return o.HS:JSONDecode(r1)end)if BI and type(r3)=="table"then
for BJ,kW in pairs(r3)do if type(kW)=="number"and kW>r2 then kV[BJ]=kW-r2 end end end return kV end function o.call(...)
local r4=ag:FindFirstChild("Remotes")local r5=r4 and r4:FindFirstChild("PetRequest")if not r5 then return nil end
local r6=table.pack(...)local cv={}task.spawn(function()cv.ok,cv.v=pcall(function()return r5:InvokeServer(table.unpack(r6,1,r6 .n))end)
cv.done=true end)local BK=z()while not cv.done and z()-BK<6 do task.wait(0.05)end if cv.done and cv.ok then return cv.v end
return nil end function o.want(BL)return e.Pets[BL]end function o.closeNaming(kX)local r8=pcall(function()local r7=K:FindFirstChild("PlayerScripts")
local BM=r7 and r7:FindFirstChild("Naming",true)require(BM).close()end)ah(0.5)if kX.Visible then pcall(function()local r9=kX:FindFirstChild("NameBox",true)if r9 then r9:ReleaseFocus()end end)
kX.Visible=false r8=false end return r8 end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local r_=K:FindFirstChildOfClass("PlayerGui")
local sa=r_ and r_:FindFirstChild("MainGui")local g8=sa and sa:FindFirstChild("PetNameGui")if g8 and g8 .Visible then
ah(0.4)if g8 .Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,g8)break end end ah(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local kY,sb,g9=o.info(),o.pen(),o.data()
if not(kY and sb and g9)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local eA,kZ=#(g9 .pets or{}),tonumber(g9 .maxOwned)or 60
local BN,sc,eB=o.srv(),{},nil for JR,aY in ipairs(sb:GetChildren())do sc[aY.Name]=true local cw,g_=aY:GetAttribute("Pet"),aY:GetAttribute("Variant")or""
local k0=cw and o.want(cw)if k0 and k0 .b and kY.Pets[cw]and(not k0 .g or g_=="Big")and y.wantMore(cw,g_,g9)and not aY:GetAttribute("A_"..o.uid)
and(tonumber(aY:GetAttribute("ExpiresAt"))or 0)>BN+1 and z()>=(o.tryAt[aY.Name]or 0)then local eC,sd=o.nice(cw,g_),kY.Pets[cw].price or 0
if eA>=kZ then eB=("%s is in the pen, but you have %d/%d pets"):format(eC,eA,kZ)o.tryAt[aY.Name]=z()+15 elseif o.money()<sd then
eB=("%s is in the pen - need $%s"):format(eC,aF(sd))o.tryAt[aY.Name]=z()+5 else o.tryAt[aY.Name]=z()+8 local bO=o.call("adopt",aY.Name)
if type(bO)=="table"and bO.ok then eA=eA+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local BO=type(bO.pet)=="table"and bO.pet or{}
table.insert(o.recent,{id=tostring(BO.id or("?"..z())),name=cw,variant=g_,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
D("ADOPTED "..eC)o.skipNaming()eB="adopted "..eC else local se=type(bO)=="table"and tostring(bO.reason or"no reason given")or"no answer"
D(("adopt %s failed: %s"):format(eC,se))eB="adopt failed: "..se if type(bO)=="table"and bO.bagFull then o.tryAt[aY.Name]=z()+60 end
end end end end for sf in pairs(o.tryAt)do if not sc[sf]then o.tryAt[sf]=nil end end o.buyMsg=eB or("watching the pen (%d/%d pets)"):format(eA,kZ)
end function o.stacks()local sh=o.pen()local BP=sh and sh:GetAttribute("WishStacks")local BQ,sj=pcall(function()return o.HS:JSONDecode(BP)end)
return(BQ and type(sj)=="table")and sj or{}end function o.stackTick(BR,BS)local ha=o.info()local sk=(type(ha.Wish)=="table"and tonumber(ha.Wish.maxStacks))or 1
if sk<=1 then return end local BT=o.stacks()o.stackTry=o.stackTry or{}for JS,aZ in ipairs(o.order())do local sl=o.want(aZ)
local hb=tonumber(BT[aZ])or 1 if sl and sl.w and BR[aZ]and hb<sk and y.wantMore(aZ,"",BS)and z()>=(o.stackTry[aZ]or 0)then
local BU,hc=pcall(ha.wishPrice,aZ,hb+1)hc=BU and tonumber(hc)or((ha.Pets[aZ].price or 0)*2*3^hb)o.stackTry[aZ]=z()+5
if hc<=o.money()*0.01 then local sm=o.call("wish",aZ)if type(sm)=="table"and sm.ok then o.wishN=o.wishN+1 D(("WISH x%d on %s ($%s)"):format(hb+1,o.nice(aZ),aF(hc)))
else o.stackTry[aZ]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local hd=o.info()if not(hd and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bP,k1,bQ=o.wishes(),0,nil local BV=(type(hd.Wish)=="table"and hd.Wish.cashShare)or 2 local sn=o.data()for JT,aE in ipairs(o.order())do
local so=o.want(aE)if so and so.w and y.wantMore(aE,"",sn)then k1=k1+1 if not bP[aE]and z()>=(o.wishTry[aE]or 0)then
local k2=tonumber(K:GetAttribute("PetWishCredits"))or 0 local k3=math.floor((hd.Pets[aE].price or 0)*BV)if k2<=0 and o.money()<k3 then
o.wishTry[aE]=z()+10 bQ=("need $%s to wish for %s"):format(aF(k3),o.nice(aE))o.wishWhy[aE]=bQ else o.wishTry[aE]=z()+3
local BW=k2>0 and"wishCredit"or"wish"local he=o.call(BW,aE)if type(he)=="table"and he.ok then o.wishN,o.wishWhy[aE]=o.wishN+1,nil
D(("WISHED for %s (%s)"):format(o.nice(aE),k2>0 and"free wish"or("$"..aF(k3))))else local k4=type(he)=="table"and tostring(he.reason or"no reason given")or"no answer"
if k4:lower():find("already",1,true)then o.wishTry[aE]=z()+2 else D(("wish %s failed: %s"):format(o.nice(aE),k4))bQ="wish failed: "..k4 end
end end end end end pcall(o.stackTick,bP,sn)if not bQ then for JU,hf in ipairs(o.order())do local sp=o.want(hf)
if sp and sp.w and not bP[hf]and o.wishWhy[hf]then bQ=o.wishWhy[hf]break end end end if not bQ then local df={}
for JV,eD in ipairs(o.order())do local sq=o.want(eD)local sr=tonumber(o.stacks()[eD])or 1 if sq and sq.w and bP[eD]then df[#df+1]=("%s%s %dm"):format(o.nice(eD),sr>1 and(" x"..sr)or"",math.ceil(bP[eD]/60))end
end local hg for JW,hh in ipairs(o.order())do local ss=o.want(hh)if ss and ss.w and bP[hh]and(not hg or bP[hh]<hg)then hg=bP[hh]end
end bQ=k1==0 and"no pet has WISH ticked"or(#df==0 and"running: none yet")or(#df<=3 and("running: "..table.concat(df,", ")))
or("%d running, the next one ends in %dm"):format(#df,math.ceil((hg or 0)/60))end o.wishMsg=bQ end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local k5=o.data()return(k5 and k5 .teams)or{},k5 end function A.current(dg)
dg=dg or o.data()if not dg then return""end local su={}for JX,BX in ipairs(dg.equipped or{})do su[tostring(BX)]=true end
for JY,sv in ipairs(dg.teams or{})do local sx=sv.pets or{}local k6=#sx==#(dg.equipped or{})if k6 then for JZ,BY in ipairs(sx)do if not su[tostring(BY)]then k6=false break end end end
if k6 then return sv.name end end return""end function A.equip(k7)local BZ,B0=A.teams()local k8 for B1,B2 in ipairs(BZ)do if B2 .name==k7 then k8=B1 break end end
if not k8 then A.msg="no saved team called "..tostring(k7)return false end if A.current(B0)==k7 then return true end
for J0=1,4 do local sy=o.call("teamEquip",k8)if type(sy)=="table"and sy.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(B3)local sz=B3:FindFirstChild("SquishyPlaceHolder")local sA=sz and sz:FindFirstChild("TimerGui")
local sB=sA and sA:FindFirstChildWhichIsA("TextLabel",true)local k9=sB and sB.Text if type(k9)~="string"or k9:find("-",1,true)then return nil end
local k_,sC,sD=k9:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not k_ then return nil end local sE=sD~=""and(tonumber(k_)*3600+tonumber(sC)*60+tonumber(sD))or(tonumber(k_)*60+tonumber(sC))
return sE>0 and sE or nil end function A.waxes()local eE={}local sF=c.plot and c.plot:FindFirstChild("WaxStations")
if not sF then return eE end local sG=o.srv()for J1,a_ in ipairs(sF:GetChildren())do local la=tonumber(a_:GetAttribute("PourEnd"))
local sH=a_:GetAttribute("PourOwner")if a_:GetAttribute("HasSquishy")and a_:GetAttribute("PourId")and(sH==nil or sH==o.uid)then
local lb=A.left(a_)local sI=lb and(sG+lb)or((la and la>sG)and la or nil)if sI then local sJ,sK=a_:FindFirstChild("SquishyPlaceHolder"),"?"
if sJ then for J2,sL in ipairs(sJ:GetChildren())do if sL:IsA("Model")then sK=sL.Name break end end end local B4=tostring(a_:GetAttribute("Helpers")or"")
local lc=0 for J3 in B4:gmatch("%d+")do lc=lc+1 end eE[#eE+1]={st=a_,ends=sI,sure=lb~=nil,id=a_:GetAttribute("PourId"),name=sK,helps=lc,
long=a_:GetAttribute("PourLong")==true}end end end table.sort(eE,function(B5,B6)return B5 .ends<B6 .ends end)
return eE end function A.glazeCount()local sM=ag:FindFirstChild("Remotes")local sN=sM and sM:FindFirstChild("EditStack")
if not sN then return nil end local B7,eF=pcall(function()return sN:InvokeServer("State",nil)end)if not(B7 and type(eF)=="table"and type(eF.state)=="table")then return nil end
local ld,le=0,{}for J4,hi in ipairs(eF.state.entries or{})do if hi.glaze and hi.glaze~=""then ld=ld+1 le[hi.glaze]=(le[hi.glaze]or 0)+1 end
end return ld,le,#(eF.state.entries or{}),eF.state.capacity end function A.finishedOne(hj,sO)A.finished=A.finished+1
task.wait(2)local lf,B8,sP,B9=A.glazeCount()if lf and sO and lf>sO then A.glazed=A.glazed+1 local lg={}for B_,Ca in pairs(B8)do lg[#lg+1]=B_.." "..Ca end
D(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(am(ab(hj.name)),hj.st.Name,lf,table.concat(lg,", ")))
else D(("wax done on station %s: %s, no glaze%s"):format(hj.st.Name,am(ab(hj.name)),sP and(" (stack "..sP.."/"..tostring(B9)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cx=o.srv()local aJ=A.glazeFor if aJ then local eG=aJ.st local sQ=eG.Parent and eG:GetAttribute("HasSquishy")and eG:GetAttribute("PourId")==aJ.id
local sR=sQ and A.left(eG)if sR then aJ.ends=cx+sR end if not sQ then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aJ.id or"?"]then
A.done[aJ.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aJ.id or"?"]=true},1 end local Cb=aJ.before
task.spawn(function()pcall(A.finishedOne,aJ,Cb)end)end elseif aJ.ends-cx>e.GlazeLead*3+60 or cx>aJ.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aJ.id or"?"]=z()+120 D(("station %s is not finishing yet (%s left) - glaze team off again"):format(eG.Name,A.clock(aJ.ends-cx)))
end end if e.TeamGlaze~=""and not A.glazeFor then local Cc=A.speedRatio(e.TeamGlaze)for J5,cy in ipairs(A.list)do
if cy.sure and(cy.ends-cx)*Cc[cy.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cy.id or"?"]or 0)and not A.done[cy.id or"?"]then
A.glazeFor=cy task.spawn(function()cy.before=A.glazeCount()end)break end end end local aK,eH="",""local dh=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cx)
if dh and dh<-8 then q.snapAt,dh=nil,nil end if e.TeamGlaze~=""and dh and dh<=20 then aK,eH=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(dh)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aK,eH=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aK,eH=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aK,eH=e.TeamFull," - every station is busy"else aK=e.TeamNormal end A.want=aK local eI=A.current()A.cur=eI if aK~=""and eI~=aK and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aK)then D("team: "..aK..eH)else A.nextTry=z()+3 end end local lh=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eI~=""and eI or"(not a saved team)",(aK~=""and aK~=eI)and(" -> "..aK)or"",
lh and("in "..A.clock(lh.ends-cx).." (st "..lh.st.Name..")")or"- none running")end function A.clock(bR)bR=math.max(0,math.floor(bR))
if bR>=3600 then return("%d:%02d:%02d"):format(math.floor(bR/3600),math.floor((bR%3600)/60),bR%60)end return("%d:%02d"):format(math.floor(bR/60),bR%60)
end function A.allBusy()local Cd,Ce=f9()return Ce>0 and Cd==0 end function A.aboutToPlace()if not c.running then return false end
local sS=ad()if not(sS and aP(sS))then return false end local Cf=f9()return Cf>0 end function A.mult(sT,Cg,sU)return{(1+sT)*(1+sU),(1+sT+Cg)*(1+sU)}end
function A.speedNow()local function li(Ch)return tonumber(K:GetAttribute(Ch))or 0 end return A.mult(li("PetWaxSpeed"),li("PetLongWax"),li("PetSocialWax"))
end function A.speedOf(Ci)local Cj,sV=A.teams()if not sV then return nil end for J6,sW in ipairs(Cj)do if sW.name==Ci then
local lj={}for J7,Ck in ipairs(sW.pets or{})do for J8,sX in ipairs(sV.pets or{})do if tostring(sX.id)==tostring(Ck)then lj[#lj+1]=sX break end end
end local sY=y.caps()local sZ,Cl=y.stats(lj)return A.mult(math.min(sZ.waxSpeed or 0,sY.waxSpeed or 0.25),math.min(sZ.longWax or 0,sY.longWax or 0.3),Cl.socialWax or 0)
end end return nil end function A.speedRatio(Cm)local s0,lk=A.speedNow(),A.speedOf(Cm)if not lk then return{1,1}end
return{s0[1]/lk[1],s0[2]/lk[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(Cn)local ll=o.info()if ll and type(ll.fuseNeed)=="function"then local Co,lm=pcall(ll.fuseNeed,K,Cn or"")
if Co and tonumber(lm)and tonumber(lm)>=2 then return tonumber(lm)end end if K:GetAttribute("FusePass")==true or K:GetAttribute("FusePass4")==true then return 3 end
if K:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(s1)
if s1=="Huge"then return y.needFor("")*y.needFor("Big")end if s1=="Big"then return y.needFor("")end return 1 end
function y.nextOf(s2)return(s2==""and"Big")or(s2=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local ln=o.info()return(ln and type(ln.HugeCaps)=="table")and ln.HugeCaps or y.HCAPS end function y.cosmic()local lo=o.info()return(lo and type(lo.CosmicCaps)=="table")and lo.CosmicCaps or{StarWhale=0.1}end
function y.slots()local s3=o.data()return tonumber(s3 and s3 .slots)or(3+(tonumber(K:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lp=o.info()return(lp and type(lp.Caps)=="table")and lp.Caps or y.CAPS end function y.value(s4,cz)
local hk=o.info()local cA=hk and hk.Pets[s4]if not(cA and type(cA.boost)=="table")then return nil end local cB
if type(hk.boostValue)=="function"then local Cp,Cq=pcall(hk.boostValue,s4,(cz~=""and cz)or nil)cB=Cp and tonumber(Cq)or nil
end if not cB then local eJ=cA.boost.value or 0 cB=eJ if cz=="Big"or cz=="Huge"then local s5=eJ*(cz=="Huge"and 1.75 or 1.5)
cB=y.ROUND[cA.boost.kind]and math.max(eJ+(cz=="Huge"and 2 or 1),math.floor(s5+0.5))or s5 if cz=="Huge"and y.ROUND[cA.boost.kind]then cB=math.max(cB,math.max(eJ+1,math.floor(eJ*1.5+0.5))+1)end
end end return cA.boost.kind,cB,cA.boost.every end function y.stats(Cr)local cC,lq,s6,eK={},{},{},{}local Cs=y.cosmic()
for J9,di in ipairs(Cr)do local av,eL,s7=y.value(di.name,di.variant or"")if av then if di.variant=="Huge"then s6[y.CAPKEY[av]or av]=true end
if av:sub(1,6)=="social"then lq[av]=math.max(lq[av]or 0,eL)elseif av=="waxStir"or av=="cashGift"then cC[av]=(cC[av]or 0)+eL*60/(s7 or 60)
elseif av=="luckyPull"then cC.luckyPull=(cC.luckyPull or 0)+eL/(s7 or 10)else cC[av]=(cC[av]or 0)+eL if Cs[di.name]then eK[av]=eK[av]or{}eK[av][di.name]=(eK[av][di.name]or 0)+eL end
end end end return cC,lq,s6,eK end function y.glazeGain(Ct,hl)local eM,lr,J_={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local Cu=eM[1]+eM[2]+eM[3]local Cv=tonumber(K:GetAttribute("GuildUpGlaze"))or 0 local dj={}for hm=1,3 do dj[hm]=eM[hm]+Ct*eM[hm]/Cu+(hm==1 and Cv or 0)end
local ls={dj[1]*(1-hl),dj[2]*(1-hl)+dj[1]*hl,dj[3]+dj[2]*hl}return ls[1]*(lr[1]-1)+ls[2]*(lr[2]-1)+ls[3]*(lr[3]-1)
end function y.score(hn,Cw)local Cx,Cy,Cz=y.caps(),y.hcaps(),y.cosmic()local ho,hp,CA,s8=y.stats(Cw)local function lt(lu)return(CA[lu]and Cy[lu])or Cx[lu]or math.huge end
local function bs(hq)local lv,lw=ho[hq]or 0,lt(hq)local lx=math.min(lv,lw)if s8[hq]and lv>lw then local ly=0 for CB,CC in pairs(s8[hq])do ly=ly+math.min(CC,Cz[CB]or 0)end
lx=lx+math.min(lv-lw,ly)end return lx end local CD=(1+bs("income"))*(1+(hp.socialIncome or 0))*(1+math.min(ho.cashGift or 0,lt("cashGiftPerMinute"))/60)
local CE=1+bs("luck")+(ho.luckyPull or 0)+(hp.socialLuck or 0)local s9=CE*(1+bs("newFind"))*(1+bs("rollSpeed"))
local eN=math.log(CD)local CG=math.max(tonumber(K:GetAttribute("WaxStations"))or 18,1)local lz=(1+bs("waxSpeed")+bs("longWax"))*(1+(hp.socialWax or 0))
+math.min(ho.waxStir or 0,lt("waxStirPerMinute"))/60/CG local CH=1-(1-bs("headStart"))*(1-(hp.socialHeadStart or 0))
if hn=="farm"then return eN+0.7*math.log(s9)+0.1*math.log(lz)end if hn=="full"then return eN+0.4*math.log(lz)+0.02*math.log(s9)end
if hn=="glaze"then return y.glazeGain(bs("glaze"),bs("glazeUp"))+0.001*eN end if hn=="wax"then return-math.log(1-0.5*CH)+0.001*eN+0.001*math.log(lz)end
return eN end function y.kinds(CI)local s_,lA={},{}for Ka,eO in ipairs(CI)do local ta=eO.name.."|"..(eO.variant or"")
local bS=s_[ta]if not bS then bS={name=eO.name,variant=eO.variant or"",n=0,ids={}}s_[ta]=bS lA[#lA+1]=bS end bS.n=bS.n+1
bS.ids[#bS.ids+1]=eO.id end return lA end function y.bestKinds(tb,bT,CJ,td,te)local aC,bU={},{}local function lB(CK)
local tf,hr={},{}for CL,lC in ipairs(CK)do tf[CL]=bT[lC]hr[lC]=(hr[lC]or 0)+1 end local eP=y.score(tb,tf)if td then for CM,CN in pairs(hr)do eP=eP+1e-7*math.min(CN,td[CM]or 0)end end
if te then for CO,CP in pairs(hr)do eP=eP-1e-8*CP*te[bT[CO].variant]end end return eP end for Kb=1,CJ do local eQ,lD
for hs=1,#bT do if(bU[hs]or 0)<bT[hs].n then aC[#aC+1]=hs local th=lB(aC)aC[#aC]=nil if not lD or th>lD+1e-12 then eQ,lD=hs,th end
end end if not eQ then break end bU[eQ]=(bU[eQ]or 0)+1 aC[#aC+1]=eQ if#bT>40 then task.wait()end end for Kc=1,6 do
task.wait()local ti,tj=false,lB(aC)for lE=1,#aC do for dk=1,#bT do local ht=aC[lE]if dk~=ht and(bU[dk]or 0)<bT[dk].n then
aC[lE]=dk local tk=lB(aC)if tk>tj+1e-9 then bU[ht],bU[dk],tj,ti=bU[ht]-1,(bU[dk]or 0)+1,tk,true else aC[lE]=ht end
end end end if not ti then break end end local tl={}for CQ,CS in ipairs(aC)do tl[CQ]=bT[CS]end return aC,y.score(tb,tl)
end function y.best(CT,CU,CV,hu)hu=hu or{}local lF=y.kinds(CU)local lG={}for tm,CW in ipairs(lF)do for Kd,CX in ipairs(CW.ids)do if hu[tostring(CX)]then lG[tm]=(lG[tm]or 0)+1 end end end
local CY,CZ=y.bestKinds(CT,lF,CV,lG)local lH,lI={},{}for Ke,C0 in ipairs(CY)do local tn,eR=lF[C0],nil for Kf,lJ in ipairs(tn.ids)do if hu[tostring(lJ)]and not lH[lJ]then eR=lJ break end end
if not eR then for Kg,to in ipairs(tn.ids)do if not lH[to]then eR=to break end end end lH[eR]=true lI[#lI+1]=tostring(eR)
end return lI,CZ end function y.dream()local tp=o.info()if not(tp and type(tp.Pets)=="table")then return nil end
local lK=y.slots()local tq=y.needFor("").."|"..y.needFor("Big").."|"..lK.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==tq and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local C6=pcall(function()local hv={}for Kh,C1 in ipairs(o.order())do for Ki,C2 in ipairs({"","Big","Huge"})do hv[#hv+1]={name=C1,variant=C2,n=lK,ids={}}end
end local eS,lL={},{}for Kj,hw in ipairs(y.ROLES)do if e[hw[1]]~=""then local C3,C4=y.bestKinds(hw[2],hv,lK,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local lM,hx={},{}for Kk,tr in ipairs(C3)do lM[tr]=(lM[tr]or 0)+1 end for C5,lN in pairs(lM)do local bV=hv[C5]
eS[bV.name]=eS[bV.name]or{[""]=0,Big=0,Huge=0}eS[bV.name][bV.variant]=math.max(eS[bV.name][bV.variant],lN)hx[#hx+1]=(lN>1 and(lN.."x ")or"")..o.nice(bV.name,bV.variant)
end table.sort(hx)lL[#lL+1]={role=hw[2],team=e[hw[1]],names=hx,score=C4}end end y.dreamT,y.dreamTeams,y.dreamSig=eS,lL,tq
end)y.dreaming=false if not C6 then y.dreamSig=nil end return y.dreamT end function y.owned(hy)local ts,lO={},{}
for Kl,C7 in ipairs(hy and hy.arriving or{})do ts[tostring(C7)]=true end for Km,cD in ipairs(hy and hy.pets or{})do
if not ts[tostring(cD.id)]then lO[#lO+1]={id=tostring(cD.id),name=cD.name,variant=cD.variant or"",named=cD.named or(cD.nickname and cD.nickname~="")}
end end return lO end function y.have(tt,C8,C9)local ba={[""]=0,Big=0,Huge=0}local tu={}for Kn,eT in ipairs(y.owned(C8))do
tu[eT.id]=true if eT.name==tt and ba[eT.variant]then ba[eT.variant]=ba[eT.variant]+1 end end if C9 then for Ko,dl in ipairs(o.recent or{})do
if dl.name==tt and not tu[dl.id]and z()-dl.at<20 and ba[dl.variant or""]then ba[dl.variant or""]=ba[dl.variant or""]+1 end
end end return ba,ba[""]+ba.Big*y.unit("Big")+ba.Huge*y.unit("Huge")end function y.goal(tv)local tw=e.Pets[tv]
if tw and tonumber(tw.f)==-1 then return nil,0 end local tx=y.dream()local eU=tx and tx[tv]if not eU then return nil,0 end
return eU,eU[""]+eU.Big*y.unit("Big")+eU.Huge*y.unit("Huge")end function y.wantMore(lP,Kp,ty)if not ty then return true end
local tz=e.Pets[lP]if tz and tonumber(tz.f)==-1 then return true end local C_,Da=y.goal(lP)if not C_ then return true end
local Kq,Db=y.have(lP,ty,true)return Db<Da+y.need()end function y.status(eV,tA)if not tA then return nil end local tB=e.Pets[eV]
if tB and tonumber(tB.f)==-1 then return"KEEP: never fused"end local cE,tC=y.goal(eV)if not cE then return y.dream()and"in no best team: bought as ticked"or nil end
local lQ,Dc=y.have(eV,tA)local cF={}if cE.Huge>0 then cF[#cF+1]=("Huge %d/%d"):format(lQ.Huge,cE.Huge)end if cE.Big>0 then cF[#cF+1]=("Big %d/%d"):format(lQ.Big,cE.Big)end
if cE[""]>0 then cF[#cF+1]=("plain %d/%d"):format(lQ[""],cE[""])end local Dd=y.blocked and y.blocked[eV]and(" | "..y.blocked[eV])or""
return("%s | %d/%d copies%s"):format(table.concat(cF," "),math.min(Dc,tC),tC,Dd)end function y.wear(lR)local lS={}
for Kr,De in ipairs(lR)do lS[tostring(De)]=true end for Ks=1,3 do local dm=o.data()if not dm then return false end
for Kt,tD in ipairs(dm.equipped or{})do if not lS[tostring(tD)]then o.call("unequip",tD)task.wait(0.3)end end
dm=o.data()local tE={}for Ku,Df in ipairs(dm.equipped or{})do tE[tostring(Df)]=true end for Kv,tF in ipairs(lR)do
if not tE[tostring(tF)]then o.call("equip",tF)task.wait(0.3)end end task.wait(0.4)dm=o.data()local lT,tG=0,true
for Kw,Dg in ipairs(dm.equipped or{})do lT=lT+1 if not lS[tostring(Dg)]then tG=false end end if tG and lT==#lR then return true end
end return false end function y.saveTeam(tH,tI)if not y.wear(tI)then return false,"could not put the pets on"end
local Dh=A.teams()local cG for Di,Dj in ipairs(Dh)do if Dj.name==tH then cG=Di break end end local dn if cG then
dn=o.call("teamSave",cG)else dn=o.call("teamNew")if type(dn)=="table"and dn.ok and dn.index then cG=dn.index task.wait(0.3)
o.call("teamRename",{index=cG,name=tH})end end task.wait(0.4)local lU=o.data()local tJ=lU and lU.teams and cG and lU.teams[cG]
if not tJ then return false,"the game did not save it"end local tK={}for Kx,Dk in ipairs(tJ.pets or{})do tK[tostring(Dk)]=true end
for Ky,Dl in ipairs(tI)do if not tK[tostring(Dl)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local Dm=o.srv()for Kz,Dn in ipairs(A.list or{})do if Dn.ends-Dm<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local eW=o.data()if not eW then return{}end local tL={}for KA,Do in ipairs(eW.arriving or{})do tL[tostring(Do)]=true end
local eX={}for KB,hz in ipairs(eW.pets or{})do if not tL[tostring(hz.id)]then eX[#eX+1]={id=tostring(hz.id),name=hz.name,variant=hz.variant or""}end
end local tM={}for KC,tN in ipairs(eX)do tM[tN.id]=tN end local tO=tonumber(eW.slots)or 3 local lV,tP={},{}for KD,hA in ipairs(y.ROLES)do
local eY=e[hA[1]]if eY~=""and not tP[eY]then tP[eY]=true local lW,eZ,tQ={},{},false for KE,tR in ipairs(eW.teams or{})do
if tR.name==eY then for KF,Dp in ipairs(tR.pets or{})do local lX=tM[tostring(Dp)]if lX then lW[lX.id]=true eZ[#eZ+1]=lX else tQ=true end
end end end local lY,tS=y.best(hA[2],eX,tO,lW)local tT=y.score(hA[2],eZ)local tU=#lY==#eZ for KG,Dq in ipairs(lY)do if not lW[Dq]then tU=false end end
if not tU and(tQ or#eZ<math.min(tO,#eX)or tS>tT+1e-4)then lV[#lV+1]={team=eY,role=hA[2],ids=lY,gain=tS-tT}end
end end return lV end function y.rebuild(Dr)local tV=y.plan()if#tV==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end A.editing,A.editingSince=true,z()
local hB=true local Dv,Dw=pcall(function()for KH,e0 in ipairs(tV)do local Ds,Dt=y.saveTeam(e0 .team,e0 .ids)local tW=o.data()
local lZ={}for KI,Du in ipairs(e0 .ids)do for KJ,l0 in ipairs(tW and tW.pets or{})do if tostring(l0 .id)==Du then lZ[#lZ+1]=o.nice(l0 .name,l0 .variant)end
end end if Ds then D(("TEAM %s rebuilt (%s): %s"):format(e0 .team,Dr or"pets changed",table.concat(lZ,", ")))
else hB=false D(("TEAM %s: %s"):format(e0 .team,tostring(Dt)))end end end)A.editing,A.nextTry=false,0 if not Dv then hB=false D("TEAM BUILD ERR "..tostring(Dw))end
y.builds=y.builds+1 y.buildMsg=hB and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return hB end function y.roleScores(tX)local bW={}for KK,tY in ipairs(tX)do bW[#bW+1]=tY.name..tY.variant end
table.sort(bW)bW=table.concat(bW,",")y.rsCache=y.rsCache or{}if y.rsCache[bW]then return y.rsCache[bW]end local Dx,Dy,l1=y.kinds(tX),y.slots(),{}
for KL,l2 in ipairs(y.ROLES)do if e[l2[1]]~=""then local KM,Dz=y.bestKinds(l2[2],Dx,Dy)l1[l2[2]]=Dz end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bW]=l1 return l1 end function y.noLoss(tZ,DA,DB,DC)local t0,e1={},{}
for KN,DD in ipairs(DA)do t0[DD]=true end for KO,t1 in ipairs(tZ)do if not t0[t1 .id]then e1[#e1+1]=t1 end end
e1[#e1+1]={id="new",name=DB,variant=DC}local DE,t2=y.roleScores(tZ),y.roleScores(e1)local t3=false for l3,t4 in pairs(DE)do
if(t2[l3]or-math.huge)<t4-1e-6 then return false,l3 end if(t2[l3]or 0)>t4+1e-6 then t3=true end end return true,t3
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local e2=o.data()if not e2 then return end local t5=y.owned(e2)local hC,e3={},{}for KP,DF in ipairs(e2 .teams or{})do for KQ,DG in ipairs(DF.pets or{})do hC[tostring(DG)]=true end end
for KR,DH in ipairs(e2 .equipped or{})do e3[tostring(DH)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for KS,aL in ipairs(o.order())do
local hD=y.goal(aL)if hD then local l4=y.have(aL,e2)for KT,bt in ipairs({"Big",""})do local dp,l5=y.nextOf(bt),y.needFor(bt)
local DI=(bt=="Big"and l4 .Huge<hD.Huge)or(bt==""and l4 .Big<hD.Big+y.needFor("Big")*math.max(0,hD.Huge-l4 .Huge))
local e4={}for KU,l6 in ipairs(t5)do if l6 .name==aL and l6 .variant==bt then e4[#e4+1]=l6 end end if DI and#e4>=l5 and z()>=(y.failUntil[aL..bt]or 0)then
table.sort(e4,function(hE,hF)local t6=(e3[hE.id]and 4 or 0)+(hC[hE.id]and 2 or 0)+(hE.named and 1 or 0)local t7=(e3[hF.id]and 4 or 0)+(hC[hF.id]and 2 or 0)+(hF.named and 1 or 0)
if t6~=t7 then return t6<t7 end return hE.id<hF.id end)local cH,l7,t8={},{},false for dq=1,l5 do cH[dq]=e4[dq].id
if e3[cH[dq]]then l7[#l7+1]=cH[dq]end if e3[cH[dq]]or hC[cH[dq]]then t8=true end end local DJ,t9=y.noLoss(t5,cH,aL,dp)
if not DJ then y.blocked[aL]=("%s waits: it would weaken the %s team now"):format(dp,y.ROLENAME[t9]or tostring(t9))
elseif t8 and not y.quiet()then y.blocked[aL]=dp.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dp,o.nice(aL))
return else A.editing,A.editingSince=true,z()for KV,DK in ipairs(l7)do o.call("unequip",DK)task.wait(0.3)end local hG=o.call("fuse",{ids=cH})
A.editing,A.nextTry=false,0 if type(hG)=="table"and hG.ok then y.fused=y.fused+1 y.dirtyAt=z()D(("FUSED %d %s -> %s"):format(l5,o.nice(aL,bt),o.nice(aL,dp)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aL,dp),os.date("%H:%M"))else y.failUntil[aL..bt]=z()+120 D(("fuse %s failed: %s"):format(o.nice(aL,bt),type(hG)=="table"and tostring(hG.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local t_=o.data()if not t_ then return end local cI={}for KW,DL in ipairs(t_.pets or{})do cI[#cI+1]=tostring(DL.id)end
table.sort(cI)cI=table.concat(cI,",")if cI~=y.sig then y.sig,y.dirtyAt=cI,z()end local DM=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if DM and not A.editing then local DN=y.rebuild(y.dirtyAt and"pets changed"or"check")if DN then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cJ)return cJ:IsA("ParticleEmitter")or cJ:IsA("Trail")or cJ:IsA("Beam")or cJ:IsA("Fire")or cJ:IsA("Smoke")
or cJ:IsA("Sparkles")or cJ:IsA("Light")end function d.muteOne(bu)if not e.Lite or not bu.Parent then return end
local hH=(bu:IsA("BillboardGui")and d.bb)or(d.isFx(bu)and d.fx)or nil if not hH or hH[bu]~=nil then return end
if hH==d.fx and d.gameLow and not bu:IsA("Beam")then return end hH[bu]=bu.Enabled if bu.Enabled then bu.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local l8={}for KX,DO in ipairs({d.bb,d.fx})do for DP in pairs(DO)do l8[#l8+1]=DP end end local ua=os.clock()for DQ,e5 in ipairs(l8)do
if e.Lite and e5 .Parent and e5 .Enabled then local DR=d.bb[e5]~=nil and d.bb or d.fx DR[e5]=true e5 .Enabled=false
end if DQ%200==0 and os.clock()-ua>0.002 then task.wait()ua=os.clock()end end end function d.lite(ub)e.Lite=ub
if ub then task.spawn(function()for DS,DT in ipairs(ak:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,DT)
if DS%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=V(ak.DescendantAdded:Connect(function(l9)
if e.Lite and(l9:IsA("BillboardGui")or d.isFx(l9))then d.queue[#d.queue+1]=l9 end end))end local l_=game:GetService("Lighting")
for KY,e6 in ipairs(l_:GetChildren())do if e6:IsA("PostEffect")and e6 .Enabled and d.post[e6]==nil then d.post[e6]=true e6 .Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and l_.GlobalShadows or d.oldShadows l_.GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ak.Terrain.Decoration or d.oldDeco ak.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for KZ,DU in pairs(d.watch)do pcall(function()DU:Disconnect()end)end
for uc,DV in pairs(d.bb)do pcall(function()if uc.Parent then uc.Enabled=DV end end)end for ud,DW in pairs(d.fx)do pcall(function()if ud.Parent then ud.Enabled=DW end end)end
for ue in pairs(d.post)do pcall(function()if ue.Parent then ue.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local DX=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()DX.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ak.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(uf)
local DY,ma=pcall(function()return require(ag:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not DY or type(ma)~="table"then return end if uf and not d.ceOld then d.ceOld={}for K0,ug in ipairs({"Fireworks","Confetti"})do
local hI=ma[ug]if type(hI)=="table"and type(hI.Play)=="function"then d.ceOld[ug]=hI.Play pcall(function()hI.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not uf and d.ceOld then for DZ,D0 in pairs(d.ceOld)do pcall(function()ma[DZ].Play=D0 end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local mb,hJ for K1,e7 in ipairs(getgc(false))do if type(e7)=="function"and(type(islclosure)~="function"or islclosure(e7))then
local D1,uh,ui=pcall(debug.info,e7,"sn")if D1 and type(uh)=="string"and uh:find("ToppingCullHandler",1,true)then
if ui=="poll"then mb=e7 elseif ui=="retarget"then hJ=e7 end end end end if not(mb and hJ)then return nil end local D2,hK=pcall(debug.getupvalues,hJ)
local uj=D2 and type(hK)=="table"and hK[3]if type(uj)~="function"or debug.info(uj,"n")~="targetFor"or(hK[1]~=nil and type(hK[1])~="number")then return nil end
d.tc={poll=mb,re=hJ}return d.tc end function d.tops(uk)local aR=d.topsFind()if not aR then return false end if uk and not aR.old then
local D3,D4=pcall(hookfunction,aR.poll,function()end)if not D3 then return false end aR.old=D4 pcall(debug.setupvalue,aR.re,1,-1000)
pcall(aR.re)elseif not uk and aR.old then local D5=type(restorefunction)=="function"and pcall(restorefunction,aR.poll)
if not D5 then pcall(hookfunction,aR.poll,aR.old)end aR.old=nil pcall(aR.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(D6)local ul=ak:FindFirstChild("Plots")local um=os.clock()if D6 then for K2,D7 in ipairs(ul and ul:GetChildren()or{})do
local uo=D7:FindFirstChild("SkinProps")local up=uo and uo:FindFirstChild("FairyLights")for K3,uq in ipairs(up and up:GetChildren()or{})do
for K4,e8 in ipairs(uq:GetChildren())do if e8:IsA("BasePart")and(e8 .Name=="Bulb"or e8 .Name=="Wire")then d.lit[e8]=uq e8 .Parent=nil end
end if os.clock()-um>0.002 then task.wait()um=os.clock()end end end for K5,D8 in ipairs({"Leaderboards","ClanBoard"})do
local mc=ak:FindFirstChild(D8)if mc then d.boardsOff[mc]=true mc.Parent=nil end end else for D9,ur in pairs(d.lit)do pcall(function()if ur.Parent then D9 .Parent=ur end end)end
for us in pairs(d.boardsOff)do pcall(function()if not us.Parent then us.Parent=ak end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(D_)if D_ then local ut=ag:FindFirstChild("Remotes")local uu=ut and ut:FindFirstChild("SquishyRollAnimation")
if not uu or type(getconnections)~="function"then return end local Ea,Eb=pcall(getconnections,uu.OnClientEvent)
for K6,hL in ipairs(Ea and Eb or{})do local md=""pcall(function()md=debug.info(hL.Function,"s")end)if type(md)=="string"and md:find("SquishyHandler",1,true)and not d.reel[hL]then
if pcall(function()hL:Disable()end)then d.reel[hL]=true end end end else for Ec in pairs(d.reel)do pcall(function()Ec:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(Ed)if not Ed then for K7,Ee in pairs(d.quiet)do pcall(function()Ee:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function me(Ef,Eg)local Eh,Ei=pcall(getconnections,Ef)
for K8,hM in ipairs(Eh and Ei or{})do local mf=""pcall(function()mf=debug.info(hM.Function,"s")end)local mg=hM.Function
if mg and type(mf)=="string"and mf:find(Eg,1,true)and not d.quiet[mg]then if pcall(function()hM:Disable()end)then d.quiet[mg]=hM end
end end end local uv=ak:FindFirstChild("Plots")for K9,hN in ipairs(uv and uv:GetChildren()or{})do if hN~=c.plot then
me(hN:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uw,ux=hN:FindFirstChild("WaxStations"),hN:FindFirstChild("SquishyStack")
if uw then me(uw.DescendantAdded,"LocalToppingsHandler")end if ux then me(ux.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for uy,Ej in pairs(d.lit)do if not Ej:IsDescendantOf(game)then d.lit[uy]=nil pcall(function()uy:Destroy()end)end
end end function d.passText()local aw=function(Ek)return K:GetAttribute(Ek)end local mh={}local function bX(El,Em)mh[#mh+1]=(El and"[x] "or"[  ] ")..Em end
bX(aw("VIP")==true,"VIP: money x1.5, offline +50%")bX(aw("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(aw("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local En=aw("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(aw("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bX(aw("FastWax")==true or aw("SuperFastWax")==true,En.." (the farm times by the game's own timers)")local uz=(aw("FusePass")==true and"Fuse Pass")or(aw("FusePass4")==true and"Fuse Pass 4")or(aw("FusePass5")==true and"Fuse Pass 5")or nil
bX(uz~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uz or"Fuse pass",y.needFor(""),y.needFor("Big")))local hO=o.data()
local Eo=tonumber(hO and hO.maxOwned)or 60 bX(aw("PetInventory50")==true or aw("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(hO and#(hO.pets or{})or 0,Eo,(aw("PetInventory50")==true and aw("PetInventory100")==true)and" (both bag passes)"or""))
local uA=tonumber(aw("PetEquipBought"))or 0 bX(uA>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uA))
local uB=tonumber(aw("PetWishCredits"))or 0 if uB>0 then bX(true,("%d free wishes: used before cash"):format(uB))end
local uC=tonumber(aw("FinishAllCredits"))or 0 if uC>0 then bX(true,("%d finish-all credits (yours to use)"):format(uC))end
return table.concat(mh,"\n")end function d.extras(hP)pcall(d.quietPlots,hP and c.plot~=nil)pcall(d.fxPatch,hP)
pcall(d.tops,hP)pcall(d.lights,hP)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uD)
e.HideHud=uD local mi=K:FindFirstChildOfClass("PlayerGui")if not mi then return end if uD then for K_,e9 in ipairs(mi:GetChildren())do
if e9:IsA("ScreenGui")and not d.MINE[e9 .Name]and e9 .Enabled then d.hud[e9]=true e9 .Enabled=false end end if not d.hudConn then
d.hudConn=V(mi.ChildAdded:Connect(function(e_)if e.HideHud and e_:IsA("ScreenGui")and not d.MINE[e_.Name]then
task.defer(function()if e.HideHud and e_.Enabled then d.hud[e_]=true e_.Enabled=false end end)end end))end else
for uE in pairs(d.hud)do pcall(function()if uE.Parent then uE.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mj)e.FpsCap=mj local uF=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uF then return false end return pcall(uF,mj==0 and 60 or mj)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(aq)if aq:IsA("BasePart")or aq:IsA("Decal")or aq:IsA("Texture")then if aq.Transparency<1 then d.unseen[aq]=aq.Transparency aq.Transparency=1 end
elseif aq:IsA("BillboardGui")or aq:IsA("SurfaceGui")or aq:IsA("ParticleEmitter")or aq:IsA("Beam")or aq:IsA("Trail")or aq:IsA("Light")or aq:IsA("Fire")or aq:IsA("Smoke")or aq:IsA("Sparkles")then
if aq.Enabled then d.unseen[aq]=true aq.Enabled=false end end end function d.notMine(Ep)return e.HideMine or(c.plot and not Ep:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(hQ)
local ml=hQ.Parent local mm=ml and ml.Name=="SquishyStack"and ml.Parent if mm and mm~=c.plot and c.plot and mm.Parent==c.plot.Parent and not d.dropSeen[hQ]then
d.dropSeen[hQ]=true d.dropQ[#d.dropQ+1]={hQ,z()+3}end end function d.dropScan()local uG=c.plot and c.plot.Parent
if not(e.HideBases and uG)then return end for La,uH in ipairs(uG:GetChildren())do local uI=uH~=c.plot and uH:FindFirstChild("SquishyStack")
for Lb,Eq in ipairs(uI and uI:GetChildren()or{})do d.dropIt(Eq)end end end function d.dropStep(Er)local mn=d.dropQ
while d.dropI<=#mn and os.clock()-Er<0.003 do local mo=mn[d.dropI]if mo[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mo[1].Parent then pcall(function()mo[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mn then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mp=os.clock()local fa=d.queue if e.Lite and fa and#fa>0 then d.muteI=d.muteI or 1
while d.muteI<=#fa and os.clock()-mp<0.0015 do pcall(d.muteOne,fa[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#fa then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mp)end local hR=d.hideQ if d.hideI>#hR then return end while d.hideI<=#hR and os.clock()-mp<0.004 do
local mq=hR[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mq.Parent and d.notMine(mq)then pcall(d.hideOne,mq)end
end if d.hideI>#hR then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(uJ)if e.HideBases then d.bases(false)end
e.HideMine=uJ==2 if uJ>0 then d.bases(true)end end function d.bases(uK)e.HideBases=uK local mr=ak:FindFirstChild("Plots")
if not mr then return end if uK then task.spawn(function()local ms=0 for Lc,hS in ipairs(mr:GetChildren())do local uL=hS~=c.plot and c.plot and hS:FindFirstChild("SquishyStack")
for Ld,Es in ipairs(uL and uL:GetChildren()or{})do d.dropIt(Es)end if hS~=c.plot or e.HideMine then for Le,Et in ipairs(hS:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,Et)ms=ms+1 if ms%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=V(mr.DescendantAdded:Connect(function(dr)if e.HideBases and d.notMine(dr)then
pcall(d.hideOne,dr)d.hideQ[#d.hideQ+1]=dr if dr.Parent and dr.Parent.Name=="SquishyStack"then d.dropIt(dr)end
end end))end else for mt,uM in pairs(d.unseen)do pcall(function()if not mt.Parent then return end if type(uM)=="number"then mt.Transparency=uM else mt.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(uN)e.NoRender=uN pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not uN)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local Eu=game:GetService("RunService")local mu=0 for Lf,Ev in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local Ew,uO=pcall(function()return Eu[Ev]end)local uP,mv=false,nil if Ew and uO then uP,mv=pcall(getconnections,uO)end
if uP and type(mv)=="table"then for Lg,hT in ipairs(mv)do local mw=""pcall(function()local uQ=getfenv(hT.Function).script mw=uQ and uQ:GetFullName()or""end)
if mw~=""then for Lh,Ex in ipairs(d.CALM)do if mw:find(Ex,1,true)then local mx=hT.Function if mx and not d.calmedF[mx]and pcall(function()hT:Disable()end)then
d.calmedF[mx]=true d.calmed[#d.calmed+1]=hT mu=mu+1 end break end end end end end end if#d.calmed>200 then local my={}for Ey=#d.calmed-49,#d.calmed do my[#my+1]=d.calmed[Ey]end d.calmed=my
end return mu end function d.walker()local Ez,mz=pcall(function()return require(K.PlayerScripts.LocalScript.PetHandler.Walker)end)
return(Ez and type(mz)=="table"and type(mz.walkTo)=="function")and mz or nil end function d.walkers(EA)local uR={}
local EB,EC=pcall(debug.getupvalues,EA.destroy)for Li,uS in ipairs(EB and EC or{})do if type(uS)=="table"then
for hU in pairs(uS)do if type(hU)=="table"and rawget(hU,"model")~=nil and rawget(hU,"position")~=nil then uR[hU]=true end end
end end return uR end function d.walkPatch(uT)local fb=d.walker()if not fb then return 0 end if uT and not d.wkOld then
local uU=fb.walkTo d.wkOld=uU fb.walkTo=function(fc,fd,ED,mA)local EE=fd~=nil and pcall(function()return fd.X+fd.Z end)
if not e.Calm or not EE then return uU(fc,fd,ED,mA)end fc.target,fc.onArrive=nil,nil pcall(function()fc:teleport(fd)fc:render(0)end)
if mA then task.spawn(mA)end end elseif not uT then if d.wkOld then fb.walkTo,d.wkOld=d.wkOld,nil end return 0
end local mB=0 for aM in pairs(d.walkers(fb))do if aM.target and not aM.destroyed then local uV=aM.model and aM.model:FindFirstChild("Body")and aM.model.Body:FindFirstChild("PetBillboard")
local uW=uV and uV:FindFirstChild("TimerLabel",true)if uW and tostring(uW.Text):find("'s plot!",1,true)then pcall(function()aM:destroy()end)
pcall(function()aM.model:Destroy()end)else local EF,uX=aM.target,aM.onArrive aM.target,aM.onArrive=nil,nil pcall(function()aM:teleport(EF)aM:render(0)end)
if uX then task.spawn(uX)end end mB=mB+1 end end return mB end function d.calm(uY)e.Calm=uY if uY then local EG=d.calmScan()
local mC=0 pcall(function()mC=d.walkPatch(true)end)D(("NO ANIMATIONS: %d of the game's animation loops switched off%s"):format(EG,mC>0 and(", "..mC.." stuck pet walks cleared")or""))
else for Lj,EH in ipairs(d.calmed)do pcall(function()EH:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
pcall(d.walkPatch,false)end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end
if J.arPaused then pcall(J.resume,"script stopped")end pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(uZ)if c.rejoining then return end D("REJOIN this server ("..uZ..")")
pcall(gb)if c.autoload then pcall(gC,c.autoload)end qc()local EI=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,K)
end)task.delay(25,function()if c.alive then d8(uZ..", same server failed")end end)return EI end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=K:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local u0=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if u0 then for Lk,EJ in ipairs(u0:GetChildren())do local u1=EJ:FindFirstChild("SquishyPlaceHolder")local cK=u1 and u1:FindFirstChild("TimerGui")
if cK and cK:IsA("BillboardGui")then if d.bb[cK]==nil then pcall(d.muteOne,cK)elseif cK.Enabled then d.bb[cK]=true cK.Enabled=false end
end end end local EK,ds=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if EK and type(ds)=="number"then
d.mem=ds d.memPeak=math.max(d.memPeak,ds)if(e.MemLimit or 0)>0 and ds>e.MemLimit then d.over=(d.over or 0)+((ds>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(ds,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()D(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mD(hV)if type(hV)~="string"then return false end
hV=hV:lower()for Ll,EL in ipairs(c.sellWords)do if hV:find(EL,1,true)then return true end end return false end
local function EM()local u2=ag:FindFirstChild("Remotes")local mE=u2 and u2:FindFirstChild("SellSquishy")if not(mE and mE:IsA("RemoteEvent"))then return false end
if not pcall(function()mE:FireServer()end)then return false end return ap(function()return ad()==nil end,1.5)
end local function EN()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local u3=ar()local u4=u3 and u3 .HumanoidRootPart.Position local fe,u5 for Lm,dt in ipairs((c.plot or ak):GetDescendants())do
if dt:IsA("ProximityPrompt")and(mD(dt.ActionText)or mD(dt.ObjectText)or mD(dt.Name))then local u6=o9(dt)local mF=(u6 and u4)and(u6-u4).Magnitude or 1e9
if mF<=400 and(not fe or mF<u5)then fe,u5=dt,mF end end end c.sellSpot=fe c.noSellSpot=(fe==nil)return fe end
local function u7()local mG=ad()if not mG then c.holding=false return false end if aP(mG)then return false end
local mH=am(ab(mG))if EM()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=z()+2.5,0
D("SOLD "..mH)return true end local du=EN()if du then local u8=dW(du)if u8 then cn(u8,du)local u9=ad()if u9 and not aP(u9)then
local EO,EP=ed(du,function()return ad()==nil end,function()return du.Enabled end)if EO then c.sold,c.holding,c.sellFails=c.sold+1,false,0
D(("SOLD %s at %s via %s"):format(mH,f7(du),EP))return true end end end end c.sellFails=c.sellFails+1 D("could not sell "..mH.." ("..c.sellFails..")")
return false end local EQ={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function ER(dv)local hW=f7(dv):lower()for Ln,ES in ipairs(EQ)do if hW:find(ES,1,true)then return 0 end end
local bc,as=dv.Name:lower(),0 local function a0(ET,EU)return ET:find(EU,1,true)~=nil end if a0(bc,"collect")then as=as+60 end
if a0(bc,"cash")or a0(bc,"money")then as=as+45 end if a0(bc,"income")or a0(bc,"claim")then as=as+35 end if a0(bc,"coin")or a0(bc,"earn")or a0(bc,"green")then as=as+20 end
if bc=="pad"or bc=="touch"then as=as+25 end if as==0 and(a0(hW,"collect")or a0(hW,"cash")or a0(hW,"money"))then as=25 end
if as==0 then return 0 end local ff=dv.Color if ff.G>0.5 and ff.G>ff.R*1.4 and ff.G>ff.B*1.4 then as=as+15 end
if math.min(dv.Size.X,dv.Size.Y,dv.Size.Z)<2 then as=as+5 end return as end local function EW()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local hX,fg,mI={},nil,29 for Lo,hY in ipairs(c.plot:GetDescendants())do
if hY:IsA("BasePart")then local hZ=ER(hY)if hZ>0 then hX[#hX+1]={s=hZ,p=hY}if hZ>mI then fg,mI=hY,hZ end end end
end table.sort(hX,function(EX,EY)return EX.s>EY.s end)c.padCands,c.padPart=hX,fg if fg then D("collect pad: "..f7(fg).." (score "..mI..")")end
return fg end local mJ="SAB_pad_v1.txt"local function EZ(E0)if type(writefile)=="function"then pcall(writefile,mJ,table.concat({E0:GetComponents()},","))end
end local function E1()if type(isfile)~="function"or type(readfile)~="function"then return nil end local E2,u_=pcall(function()if isfile(mJ)then return readfile(mJ)end end)
if not E2 or type(u_)~="string"then return nil end local h0={}for E3 in u_:gmatch("[^,]+")do h0[#h0+1]=tonumber(E3)end
if#h0==12 then return CFrame.new(unpack(h0))end end local function E4(mK,h1,E5)local E6=c8(mK)local mL=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local a1=(mL and mL:IsA("BasePart"))and(mL.Position-h1)or Vector3 .new(1,0,0)a1=Vector3 .new(a1 .X,0,a1 .Z)if a1 .Magnitude<0.05 then a1=Vector3 .new(1,0,0)end
a1=a1 .Unit for E7=0,7 do local h2=E7*math.pi/4 local E8=Vector3 .new(a1 .X*math.cos(h2)-a1 .Z*math.sin(h2),0,a1 .X*math.sin(h2)+a1 .Z*math.cos(h2))
local h3=h1+E8*(E5+5)local mM=gK(h3 .X,h1 .Y,h3 .Z)if mM and math.abs(mM.Y-h1 .Y)<8 then aD(mK,Vector3 .new(h3 .X,mM.Y+E6,h3 .Z))
if ka(mK,0.7)then return true end end end return false end local function E9()c.lastCollect=z()local fh=ar()if not fh then return end
local va,E_=fh.HumanoidRootPart,c8(fh)local fi,vb,fj,mN=nil,4,nil,"?"local mO=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and mO and mO:IsA("BasePart")then fi,mN=(mO.CFrame*c.manualPad).Position,"manual pad"else local bv=EW()
if bv then fi=Vector3 .new(bv.Position.X,bv.Position.Y+bv.Size.Y/2+E_,bv.Position.Z)vb,fj,mN=math.max(bv.Size.X,bv.Size.Z)/2,bv,bv.Name
end end if not fi then D("COLLECT: pad not found - stand on it and tap SET PAD")return end local mP=bj()aD(fh,fi)
if fj and type(firetouchinterest)=="function"then pcall(firetouchinterest,va,fj,0)end ah(e.PadDwell)if fj and type(firetouchinterest)=="function"then pcall(firetouchinterest,va,fj,1)end
ah(0.5)c.collected=c.collected+1 local mQ=bj()D(("COLLECTED (%s) %s"):format(mN,(mP and mQ and mQ>mP)and("+$"..aF(mQ-mP))or"no cash change seen"))
E4(fh,fi,vb)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.mods()if q.si and z()-q.modAt<120 then return true end
local vc=ag:FindFirstChild("Modules")if not vc then return false end local function mR(Fa)local vd=vc:FindFirstChild(Fa)
if not vd then return nil end local Fb,ve=pcall(require,vd)return(Fb and type(ve)=="table")and ve or nil end q.si,q.arm,q.ci=mR("SquishyInfo"),mR("AutoRollRules"),mR("CrateInfo")
q.modAt=z()if not q.si then return false end local mS={}if q.arm and type(q.arm.tierOf)=="table"then for mT in pairs(q.arm.tierOf)do
local h4=q.si[mT]if type(h4)=="table"and h4 .rarity~="Limited"and not h4 .incomeType and not h4 .hiddenAfter then mS[ab(mT)]=mT end
end end q.roll=mS local h5={}for Fc,Fd in pairs(mS)do local fk=q.si[Fd]if type(fk)=="table"and type(fk.income)=="number"and not fk.incomeType then
h5[#h5+1]={k=Fc,inc=fk.income,pr=tonumber(fk.price)or 0}end end table.sort(h5,function(mU,mV)if mU.inc~=mV.inc then return mU.inc>mV.inc end return mU.pr>mV.pr end)
q.order=h5 local h6,mW,mX local Fe=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for Ff,mY in pairs(Fe)do
local mZ=type(mY)=="table"and tonumber(mY.price)if mZ and(not mW or mZ>mW)then h6,mW,mX=Ff,mZ,mY.title end end
q.bestCrate,q.bestCrateName=h6 and M.key(h6),h6 q.bestCrateTitle=mX and M.key(mX)or nil return true end function q.rank(Fg)
local Fh,Fi=pcall(function()return q.arm.rankOf(Fg)end)return(Fh and tonumber(Fi))or 0 end function q.loadDisc(vf)
if type(vf)~="table"then return end local vg={}for Fj,Fk in pairs(vf)do if Fk then vg[ab(tostring(Fj))]=true end end
q.disc,q.discAt=vg,z()end function q.fetch()q.discAt=z()local vh=ag:FindFirstChild("Remotes")local vi=vh and vh:FindFirstChild("GetSquishiesDiscovered")
if not vi then return end local Fl,Fm=pcall(function()return vi:InvokeServer()end)if Fl then q.loadDisc(Fm)end
end function q.scanWax()local m0={}local vj=c.plot and c.plot:FindFirstChild("WaxStations")if vj then for Lp,vk in ipairs(vj:GetChildren())do
local vl=vk:FindFirstChild("SquishyPlaceHolder")if vl and vk:GetAttribute("HasSquishy")then for Lq,vm in ipairs(vl:GetChildren())do if vm:IsA("Model")then m0[ab(vm.Name)]=true end end
end end end for vn,Fn in pairs(q.placedAt)do if z()-Fn<20 then m0[vn]=true else q.placedAt[vn]=nil end end q.waxing=m0
end function q.compute()local vo,m1,m2={},0,0 if q.disc then for m3 in pairs(q.roll or{})do if not q.disc[m3]then
if q.waxing[m3]then m2=m2+1 else vo[m3],m1=true,m1+1 end end end end q.need,q.nNeed,q.nWax=vo,m1,m2 local vp,m4={},e.Best or 0
local m5=(m4==4)and q.stackMin or nil for Fo,vq in ipairs(q.order)do if(m5 and vq.inc>m5)or(not m5 and Fo<=(m4==4 and 1 or m4))then vp[vq.k]=true end
end q.best=vp end function q.readStack()q.stackAt=z()local vr=ag:FindFirstChild("Remotes")local vs=vr and vr:FindFirstChild("EditStack")
if not vs then return end local Fp,dw=pcall(function()return vs:InvokeServer("State",nil)end)if not(Fp and type(dw)=="table"and type(dw.state)=="table"and type(dw.state.entries)=="table")then return end
local h7 for Lr,vt in ipairs(dw.state.entries)do local fl=type(vt)=="table"and q.si and q.si[tostring(vt.name)]
if type(fl)=="table"and type(fl.income)=="number"and not fl.incomeType and(not h7 or fl.income<h7)then h7=fl.income end
end q.stackMin=h7 q.stackFull=#dw.state.entries>=(tonumber(dw.state.capacity)or 100)end function q.want(m6)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[m6]then return true end elseif e.Targets[m6]then return true end return e.AutoIndex==true and q.need[m6]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(Fq)local fm=ab(Fq)q.placedAt[fm],q.waxing[fm]=z(),true if q.need[fm]then q.need[fm],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
D(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(am(fm)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fn,fo={},{}for Fr,Fs in pairs(q.roll or{})do if q.want(Fr)then fn[Fs]=true end end
for vu,m7 in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if M.wanted(vu)or(type(m7)=="table"and type(m7 .title)=="string"and M.wanted(m7 .title))then fo[vu]=true end
end if not next(fn)and not next(fo)then return nil end if q.arm and type(q.arm.encode)=="function"then local Ft,vv=pcall(q.arm.encode,{rarities={},butters=fn,crates=fo,index=false})
if Ft and type(vv)=="string"then return vv end end local function vw(Fu)local h8={}for Fv in pairs(Fu)do h8[#h8+1]=Fv end table.sort(h8)return table.concat(h8,",")end
local fp="adv:"if next(fn)then fp=fp..";butters:"..vw(fn)end if next(fo)then fp=fp..";crates:"..vw(fo)end return fp
end function q.canon(Fw)local h9={}for vx in tostring(Fw or""):gmatch("[^;]+")do local m8,vy=vx:match("^(%a+):(.*)$")
if not m8 then m8,vy="r",vx:gsub("^adv:","")end for Fx in vy:gmatch("[^,]+")do h9[#h9+1]=m8 .."="..Fx end end
table.sort(h9)return table.concat(h9,"|")end function q.sync(Fy)if K:GetAttribute("AutoRoll")~=true then return end
if z()<(q.pauseUntil or 0)then return end local cL=q.rulesNow()if not cL or#cL>1900 then return end if q.canon(K:GetAttribute("AutoRollRules"))==q.canon(cL)then q.fails=0 return end
if not Fy and z()-q.sentAt<4 then return end local vz=ag:FindFirstChild("Remotes")local vA=vz and vz:FindFirstChild("AutoRollAction")
if not vA then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 D("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()E.replaying=true pcall(function()vA:FireServer("Rules",cL)end)E.replaying=false e.ARrules=cL
local h_,ia=0,0 for Ls in(cL:match("butters:([^;]*)")or""):gmatch("[^,]+")do h_=h_+1 end for Lt in(cL:match("crates:([^;]*)")or""):gmatch("[^,]+")do ia=ia+1 end
local vB=h_.."/"..ia if q.told~=vB then q.told=vB D(("auto roll now stops on %d butters and %d crates"):format(h_,ia))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aS={}if e.AutoIndex then aS[#aS+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fq=0 for Lu in pairs(q.best)do fq=fq+1 end
aS[#aS+1]=fq==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fq,fq==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aS[#aS+1]="best: "..am(q.order[1].k)end if e.BestCrate and q.bestCrateName then aS[#aS+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if P.got>0 then aS[#aS+1]="shower: "..P.got end q.msg=#aS>0 and table.concat(aS," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(Fz)q.feed[#q.feed+1]=os.date("%H:%M ")..Fz if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vC,ay,ib)if vC~="Effect"then q.feedAdd(tostring(vC)..(ay~=nil and(": "..tostring(ay):sub(1,80))or""))
return end if ay~="ShowerTaken"and ay~="GoalPoint"then q.feedAdd(tostring(ay))end if ay=="Shower"then P.add(ib)return end
if ay=="ShowerTaken"then P.gone(ib)return end if ay=="ShowerClear"then P.drops={}return end if ay=="WaxGlow"then
local m9=type(ib)=="table"and tonumber(ib.SnapAt)if m9 then q.snapAt=m9 D(("ADMIN: every wax finishes in %ds%s"):format(math.floor(m9-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end ay=tostring(ay)cj("Admin "..ay)if ay~="GoalPoint"and z()-(q.heard[ay]or-100)>30 then q.heard[ay]=z()
D("ADMIN: "..ay)end end P.drops,P.tried,P.got,P.miss={},{},0,0 function P.add(m_)if type(m_)~="table"or type(m_.Pieces)~="table"then return end
for Lv,a2 in pairs(m_.Pieces)do if type(a2)=="table"and a2 .Id~=nil and a2 .Position~=nil then P.drops[a2 .Id]={id=a2 .Id,butter=tostring(a2 .Butter or"?"),rar=tostring(a2 .Rarity or"?"),star=a2 .Star==true,
pos=a2 .Position,opens=tonumber(a2 .OpensAt)or 0,ends=tonumber(a2 .ExpiresAt)or 0}end end end function P.gone(fr)
if type(fr)~="table"or fr.Id==nil then return end P.drops[fr.Id]=nil if tonumber(fr.UserId)==o.uid then P.mine=fr.Id end
end function P.pick()local na=o.srv()local nb,vD for vE,cM in pairs(P.drops)do if na>=cM.ends-0.3 then P.drops[vE]=nil
elseif na>=cM.opens-0.2 and(P.tried[vE]or 0)<3 then local vF=(aP(cM.butter)and 1e6 or 0)+(cM.star and 1e5 or 0)+q.rank(cM.rar)*100-(cM.ends-na)
if not nb or vF>vD then nb,vD=cM,vF end end end return nb end function P.due()return e.Shower and c.running and next(P.drops)~=nil and not ad()and P.pick()~=nil
end function P.grab()local aT,nc=P.pick(),ar()if not(aT and nc)then return end P.tried[aT.id]=(P.tried[aT.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aD(nc,aT.pos+Vector3 .new(0,c8(nc)+0.5,0))ap(function()return P.mine==aT.id or ad()~=nil or not P.drops[aT.id]end,1.5)
if P.mine==aT.id or ad()then P.got,P.drops[aT.id]=P.got+1,nil D(("GRABBED %s [%s]%s from the admin shower"):format(am(ab(aT.butter)),aT.rar,aT.star and" (star)"or""))
elseif not P.drops[aT.id]then P.miss=P.miss+1 end end local fs local function vG()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 D("trying again after being stopped for 5 minutes")fs(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ar()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bD(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local nd,vH=f9()
local ic=ad()if ic then local dx=am(ab(ic))if not aP(ic)then local ne=(aa.gift and ab(aa.gift)==ab(ic)and z()-aa.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(dx,ne),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(dx,ne),"bad"end return"sell",("selling %s (%s)"):format(dx,ne),"warn"
end if nd<1 then return nil,("holding %s - 0 free stations"):format(dx),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(dx),"wait"end
return"place",("waxing %s (%d free)"):format(dx,nd),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local nf=c.plot:FindFirstChild("CrateStand")if nf then for Lw,ft in ipairs(nf:GetDescendants())do
if ft:IsA("ProximityPrompt")and ft.Enabled and kr(ft)then local bw=ft.ObjectText if bw==""then bw=c1(nf,"TitleLabel")or""end
if bw~=""and M.wanted(bw)then local FA=f5(bw):gsub("crate$","")local vI for vJ in pairs(ae.members)do if f5(vJ)==FA then vI=vJ end end
j.waiting,j.at,j.title,j.prompt=true,z(),bw,ft j.data={name=(bw:gsub("%s","")),rarity=vI,title=bw}D(bw.." found waiting on your stand")
end break end end end end local vK=M.wanted(j.data and j.data.name)or M.wanted(j.title)if e.Crates and(j.on or j.waiting)and vK then
local a3=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a3),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 D("could not press the "..a3 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a3),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a3),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a3,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a3),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a3,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a3,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil D("trying the "..a3 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a3),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a3,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not vK then local vL=j.title..tostring(j.rolledAt)if j.told~=vL then j.told=vL D(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and M.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if nd<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(vH,vH),"wait"
end local ng=pn()if not ng then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dy=cg()
if dy and qM(dy.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dy.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dy.name),"bad"end if not q5()then return nil,("%s rolled - waiting for it to land on the stand"):format(dy.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dy.name),"ok"end local bY=j9()if bY.state~="match"then
c.matchSince=nil if bY.state=="skip"and not ng.Enabled then return nil,bY.text.." (sold out)","idle"end return nil,bY.text,bY.level
end if not ng.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local fu=z()if fu<c.noCashUntil then
local vM,FB=d_()if vM then return nil,("cash short: have $%s, price ~$%s"):format(aF(vM),aF(FB)),"bad"end return nil,(d_()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aF(bj()),math.ceil(c.noCashUntil-fu)),d_()and"bad"or"wait"end if fu-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or fu local vN=fu-c.matchSince if vN<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bY.shown,vN),"ok"end
return"buy",("buying %s via %s"):format(bY.shown,bY.src),"ok"end d.DEPTH=11 function d.pinTick()local vO=d.hold
if not vO then return end local nh=K.Character local ni=nh and nh:FindFirstChild("HumanoidRootPart")if not ni then return end
ni.CFrame=vO ni.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Lx,ie in ipairs(nh:GetChildren())do if ie:IsA("BasePart")and ie.CanCollide then d.noclip[ie]=true ie.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(FC,vP)d.hold=FC if vP then d.surface=vP end end function d.unpin(FD)
if not d.hold then return end d.hold=nil for vQ in pairs(d.noclip)do pcall(function()if vQ.Parent then vQ.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local vR=ar()if vR and d.surface and not FD then aD(vR,d.surface.Position,d.surface.Position+d.surface.LookVector)
ah(0.1)end end function d.home()local bx,vS=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ar()
if not(bx and bx:IsA("BasePart")and vS)then return nil end local vT=pb()or bx.Position local ig=Vector3 .new(vT.X-bx.Position.X,0,vT.Z-bx.Position.Z)
ig=ig.Magnitude>0.1 and ig.Unit or Vector3 .new(0,0,1)local ih=bx.Position+ig*6 local vU=gK(ih.X,bx.Position.Y,ih.Z,{bx})
return CFrame.new(ih.X,(vU and vU.Y or bx.Position.Y)+c8(vS),ih.Z)end function d.ground(FE,vV,FF)local nj,nk={K.Character},nil
for Ly=1,12 do local nl=RaycastParams.new()nl.FilterType=Enum.RaycastFilterType.Exclude nl.FilterDescendantsInstances=nj
local ii=ak:Raycast(Vector3 .new(FE,vV,FF),Vector3 .new(0,-2000,0),nl)if not ii then break end nk,vV=ii,ii.Position.Y-0.05
nj[#nj+1]=ii.Instance end return nk and nk.Position.Y end function d.parkHome()local nm=d.home()if not nm then return false end
local dz=nm.Position local FG=d.ground(dz.X,dz.Y+300,dz.Z)or(dz.Y-3)d.pin(CFrame.new(dz.X,FG-8,dz.Z),nm)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(ij)e.Ghost,e.GhostHelps=ij==2,ij==1 if ij<2 then task.spawn(function()while c.busy do ah(0.1)end
if d.ghostMode()<2 and d.hold and not F.home then pcall(d.unpin)end end)end d.paintGhost()D("ghost: "..d.GHOST[ij][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local FH=ar()if not FH or H.seat()then return end d.parkHome()end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.uid()local FI,FJ=pcall(function()return K.UserId end)return FI and FJ or 0 end function H.seat()local vW=ak:FindFirstChild("NightSeats")
if vW then for Lz,nn in ipairs(vW:GetChildren())do if nn.Name=="LogSeat"and nn:GetAttribute("Occupant")==H.uid()then return nn end
end end local vX=K.Character local vY=vX and vX:FindFirstChildOfClass("Humanoid")local no=vY and vY.SeatPart return(no and no.Name=="LogSeat")and no or nil
end function H.logs()local vZ=ak:FindFirstChild("NightSeats")local np,nq={},{}for LA,cN in ipairs(vZ and vZ:GetChildren()or{})do
local nr=cN.Name=="LogSeat"and cN:FindFirstChildOfClass("ProximityPrompt")if nr then np[#np+1]=cN local ns=cN:GetAttribute("Occupant")
local FK=(ns~=nil and ns~=0 and ns~="")or(cN:IsA("Seat")and cN.Occupant~=nil)if not FK and nr.Enabled then nq[#nq+1]={st=cN,p=nr}end
end end return np,nq end function H.due()if not(e.Campfire and c.running)or z()<H.nextAt then return false end
local FL=ak:FindFirstChild("NightSeats")if not FL then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire now (weather events)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or z()H.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(K:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
D(H.msg)return false end end return true end function H.sit()local FM,fv=ak:FindFirstChild("NightSeats"),ar()
if not FM or not fv then return end local ik,fw=H.logs()if#ik==0 then local FN=ak:FindFirstChild("NightCampfire")
local FO,nt=pcall(function()return FN:GetPivot().Position end)if not FO then H.nextAt,H.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()K:RequestStreamAroundAsync(nt,3)end)aD(fv,nt+Vector3 .new(0,3,9),nt)ap(function()ik,fw=H.logs()return#ik>0 end,6)
if#ik==0 then H.nextAt,H.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local v0=fv.HumanoidRootPart.Position
if#fw==0 then H.nextAt,H.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fw,function(FP,FQ)return(FP.st.Position-v0).Magnitude<(FQ.st.Position-v0).Magnitude end)
local nu,FR=fw[1].st,fw[1].p d.unpin(true)local dA=nu:IsA("BasePart")and nu.CFrame or CFrame.new(nu:GetPivot().Position)
aD(fv,dA.Position+dA.LookVector*2+Vector3 .new(0,2.5,0),dA.Position)ah(0.25)local FS=ed(FR,function()return H.seat()~=nil end)
if not FS then aD(fv,dA.Position+Vector3 .new(0,2,0),dA.Position+dA.LookVector)ap(function()return H.seat()~=nil end,1.5)
end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,z()D(("SAT at the campfire (+%s%% cash)"):format(tostring(K:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=z()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then D(H.msg)end end end J.msg,J.nextAt,J.at,J.pulls,J.claims,J.pullLeft,J.collectLeft,J.events="",0,0,0,0,0,0,{}
function J.refresh()J.at=z()local nv=ag:FindFirstChild("Remotes")if not nv then return end local fy,nw,dB=0,0,{}
local FV,v1=pcall(function()return nv.ClanRequest:InvokeServer("state")end)local v2=FV and type(v1)=="table"and v1 .tasks
for LB,bZ in ipairs(v2 and v2 .list or{})do if not bZ.done and bZ.kind=="pull"then fy=math.max(fy,(bZ.goal or 0)-(bZ.progress or 0))end
if not bZ.done then dB[#dB+1]=("%s %d/%d"):format(tostring(bZ.text),bZ.progress or 0,bZ.goal or 0)end end J.events={}
for LC,dC in ipairs(nv:GetChildren())do if dC:IsA("RemoteFunction")and dC.Name:match("^%u%a+Action$")and dC.Name~="CrateAction"and dC.Name~="AutoRollAction"then
local FW,fz=pcall(function()return dC:InvokeServer("state")end)if FW and type(fz)=="table"and fz.live==true and type(fz.quests)=="table"then
J.events[#J.events+1]={r=dC,st=fz}for LD,aU in ipairs(fz.quests)do if not aU.done and aU.kind=="pull"then fy=math.max(fy,(aU.goal or 0)-(aU.progress or 0))end
if not aU.done and aU.kind=="collect"then nw=math.max(nw,(aU.goal or 0)-(aU.progress or 0))end if not aU.done then dB[#dB+1]=("%s %d/%d"):format(tostring(aU.text),aU.progress or 0,aU.goal or 0)end
end end end end J.pullLeft,J.collectLeft=fy,nw J.msg=#dB>0 and("open: "..table.concat(dB,", "))or"all quests done for today"
end function J.claim()for LE,fA in ipairs(J.events)do local v3=fA.r.Name:gsub("Action$","")for LF,dD in ipairs(fA.st.quests)do
if dD.done and not dD.claimed then local FX,v4=pcall(function()return fA.r:InvokeServer("claimQuest",dD.id)end)
if FX and not(type(v4)=="table"and v4 .ok==false)then J.claims=J.claims+1 D(("CLAIMED %s quest: %s (+%s)"):format(v3,tostring(dD.text),tostring(dD.points or dD.treats or"?")))
end ah(0.4)end end if fA.st.bonusReady==true then local FY=pcall(function()return fA.r:InvokeServer("claimBonus")end)
if FY then D(("CLAIMED %s daily quest bonus"):format(v3))end ah(0.4)end end end function J.tick()if not(e.Quests and c.running)then
if J.arPaused then J.resume("quests switched off")end return end if z()-J.at<(J.pullLeft>0 and 20 or 90)then return end
J.refresh()pcall(J.claim)if J.pullLeft<=0 and J.arPaused then J.resume("lever quests done")end end function J.pullDue()
return e.Quests and c.running and J.pullLeft>0 and z()>=J.nextAt and not E.busy end function J.lever()local v5=c.plot and c.plot:FindFirstChild("Lever")
local nx=v5 and v5:FindFirstChild("Wheel")return nx and nx:FindFirstChildWhichIsA("ProximityPrompt"),nx end function J.resume(FZ)
J.arPaused=false if J.arWas then J.arWas=false e.AutoRoll=true task.spawn(E.apply,FZ)end end function J.pull()
local fB,ny=J.lever()if not fB or not ny or not ny:IsA("BasePart")then J.nextAt,J.msg=z()+300,"your lever was not found"return end
if not J.arPaused then J.arPaused=true J.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false E.apply("pulling the lever for a quest",true)
if E.isOn()then J.nextAt=z()+30 return end end D(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(J.pullLeft))
end if not fB.Enabled then J.nextAt=z()+1 return end cn(ny,fB)J.asked=nil if not(type(fireproximityprompt)=="function"and pcall(fireproximityprompt,fB))then qB(fB)end
J.pulls=J.pulls+1 J.pullLeft=J.pullLeft-1 ah(0.6)if J.asked then J.nextAt=z()+600 D(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(J.asked)))
J.resume("a butter the game wants kept is on the pad")return end J.nextAt=z()+2.5 if J.pullLeft<=0 then J.at=0 end
end F.skip,F.skipN,F.n,F.calls,F.fails,F.nextAt,F.msg,F.tries={},0,0,0,0,0,"off",{}function F.can(b0,F0)local nz=b0:GetAttribute("PourOwner")
if type(nz)~="number"or nz==o.uid or not b0:GetAttribute("HasSquishy")then return false end if b0:GetAttribute("PourLong")~=true or b0:GetAttribute("PourFull")==true then return false end
local nA=b0:GetAttribute("PourId")if nA==nil or F.skip[nA]then return false end local v6,nB,F1=b0:GetAttribute("Helpers"),0,tostring(o.uid)
if type(v6)=="string"then for F2 in v6:gmatch("[^,%s]+")do nB=nB+1 if F2==F1 then return false end end end if nB>=6 then return false end
local il=A.left(b0)if not il then local v7=tonumber(b0:GetAttribute("PourEnd"))il=v7 and(v7-F0)end if not il or il<=75 then return false end
local nC=game:GetService("Players"):GetPlayerByUserId(nz)if not nC or nC:GetAttribute("WaxHelpOff")==true then return false end
return true,nC,nA end function F.list()local nD,F3={},o.srv()local v8=ak:FindFirstChild("Plots")for LG,v9 in ipairs(v8 and v8:GetChildren()or{})do
local v_=v9~=c.plot and v9:FindFirstChild("WaxStations")for LH,nE in ipairs(v_ and v_:GetChildren()or{})do local F4,F5,F6=F.can(nE,F3)
local nF=F4 and nE:FindFirstChild("SquishyPlaceHolder")if nF and nF:IsA("BasePart")then nD[#nD+1]={st=nE,p=F5,id=F6,part=nF}end
end end return nD end function F.due()local wa=(e.MemLimit or 0)>0 and math.floor(e.MemLimit*0.72)or 900 if e.Help and c.running and z()>=F.nextAt and(d.mem or 0)>wa then
F.nextAt,F.msg=z()+30,("paused - memory %d MB > %d MB (helps load other bases)"):format(d.mem,wa)return false
end return e.Help and c.running and z()>=F.nextAt end function F.skipIt(wb,wc)F.skip[wb],F.skipN=wc,F.skipN+1
if F.skipN>600 then F.skip,F.skipN,F.tries={[wb]=wc},1,{}end end function F.goHome()local im,b1=ar(),F.home F.home=nil
if not(im and b1)then return end if e.Ghost and not H.seat()then d.unpin(true)if not d.parkHome()then pcall(aD,im,b1 .Position,b1 .Position+b1 .LookVector)end
elseif d.hold or(im.HumanoidRootPart.Position-b1 .Position).Magnitude>20 then d.unpin(true)pcall(aD,im,b1 .Position,b1 .Position+b1 .LookVector)
end end function F.step()local nG,fC=F.list(),ar()if#nG==0 or not fC then F.nextAt=z()+15 F.msg=("helped %d waxes here%s | none to help right now"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")
F.goHome()return end local wd=fC.HumanoidRootPart local we=wd.Position table.sort(nG,function(F7,F8)return(F7 .part.Position-we).Magnitude<(F8 .part.Position-we).Magnitude end)
local a4=nG[1]F.home=F.home or(d.hold and d.surface)or wd.CFrame local b2=a4 .part local fD=(b2 .Position+a4 .st:GetPivot().Position)/2
local io=F.tries[a4 .id]or 0 if(e.Ghost or e.GhostHelps)and io==0 and not H.seat()then d.pin(b2 .CFrame,F.home)
else d.unpin(true)local nH=io==0 and gK(fD.X,b2 .Position.Y,fD.Z,{b2})if nH and math.abs(nH.Y-b2 .Position.Y)<8 then
aD(fC,Vector3 .new(fD.X,nH.Y+c8(fC),fD.Z),b2 .Position)else aD(fC,b2 .Position+Vector3 .new(0,b2 .Size.Y/2+3,0),fD)
end end ah(0.3)local fE=ag:FindFirstChild("Remotes")fE=fE and fE:FindFirstChild("ClanRequest")if not fE then F.nextAt,F.msg=z()+60,"the game's help remote is missing"return end
local ip,by=pcall(function()return fE:InvokeServer("help",a4 .st:GetAttribute("PourOwner"),tonumber(a4 .st.Name))end)
if ip and type(by)=="table"and by.ok then F.n,F.fails=F.n+1,0 F.skipIt(a4 .id,"helped")D(("HELPED %s's wax (station %s)"):format(a4 .p.DisplayName,a4 .st.Name))
F.msg=("helped %d waxes here%s"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")elseif ip and type(by)=="table"and tostring(by.reason or""):lower():find("walk up",1,true)and io<2 then
F.tries[a4 .id]=io+1 F.nextAt=z()+0.3 elseif ip and type(by)=="table"and tostring(by.reason or""):lower():find("moment",1,true)then
F.waits=(F.waits or 0)+1 F.nextAt=z()+1.6 else local wf=(ip and type(by)=="table"and tostring(by.reason or"refused"))or("error: "..tostring(by))
F.skipIt(a4 .id,wf)F.fails=F.fails+1 if F.fails<=3 then D(("help refused for %s's wax: %s"):format(a4 .p.DisplayName,wf))end
if F.fails>=5 then F.fails,F.nextAt,F.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
F.goHome()end end F.nextAt=math.max(F.nextAt,z()+1.2)end function F.onCall(bz)if not e.HelpGuild or type(bz)~="table"or bz.p~="help"or bz.mine or bz.u==o.uid or not bz.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fF=ag:FindFirstChild("Remotes")
fF=fF and fF:FindFirstChild("ClanRequest")if not fF then return end local wg,fG=pcall(function()return fF:InvokeServer("callHelp",bz.u)end)
local wh=tostring(bz.n or bz.un or bz.u)if wg and type(fG)=="table"and fG.ok then F.calls=F.calls+1 D(("HELPED guildmate %s's wax from here (their call)"):format(wh))
else D(("guild call from %s: %s"):format(wh,(wg and type(fG)=="table"and tostring(fG.reason or"refused"))or tostring(fG)))
end end)end local function au(F9,wi,...)if c.busy then return end c.busy,c.busyText=true,F9 if d.hold and wi~=F.step then pcall(d.unpin)end
local F_,wj=pcall(wi,...)c.busy,c.busyText=false,""if not F_ and wj~=jl then D("ERR "..tostring(wj))end end local function Ga()
if e.Campfire and H.seat()then if j.at and H.tickAt then j.at=j.at+(z()-H.tickAt)end H.tickAt=z()H.due()c.reason,c.level=H.msg,"ok"
return end H.tickAt=nil local aV,Gb,Gc=vG()c.reason,c.level=Gb,Gc if aV=="place"then au("waxing...",A.place)elseif aV=="crate"then au("opening crate...",eo,true)
elseif aV=="cratesmart"then au("opening crate...",j.smart)elseif aV=="cratewin"then au("opening the crate window...",kt)
elseif aV=="nocrate"then au("discarding crate...",eo,false)elseif aV=="cratedrop"then au("discarding a crate that would not open...",j.drop)
elseif aV=="sell"then au("selling...",u7)elseif aV=="buy"then au("buying...",qE,false)elseif not aV and not c.matchSince and P.due()then
au("grabbing a butter from the admin shower...",P.grab)elseif not aV and not c.matchSince and H.due()then au("sitting at the campfire...",H.sit)
elseif not aV and not c.matchSince and J.pullDue()and not ad()and not(cg()and aP(cg().name))then au("pulling the lever for a quest...",J.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(J.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
au("collecting money...",E9)elseif not aV and not c.matchSince and F.due()then au("helping a wax...",F.step)elseif F.home and not e.Help then
au("coming back...",F.goHome)elseif not c.busy then d.parkTick()end end function fs(iq,Gd)if iq==c.running then return end
c.running=iq if not Gd then e.AutoStart=iq end if iq then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bD()or c.plot
D("START")else c.reason="stopped"D("STOP")end end do local b3=gv(ao.auto)if type(b3)=="string"then b3=b3:gsub("%s+$","")
if b3~=""then c.autoload=b3 local Ge=p9(b3)D(Ge and("loaded config "..b3)or("config "..b3 .." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local Gf={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local nI={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local af={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local wk,wl,wm,wn=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if wk and wl and wm and wn then af.x,af.b,af.m,af.r=wk,wl,wm,wn end end)pcall(function()local wo=Enum.Font.RobotoMono if wo then af.mono=wo end end)
local function L(Gg,Gh,Gi)local Gj,nJ=pcall(Instance.new,Gg)if not Gj then c.uiErrs=c.uiErrs+1 return nil end
for Gk,Gl in pairs(Gh)do if not pcall(function()nJ[Gk]=Gl end)then c.uiErrs=c.uiErrs+1 end end nJ.Parent=Gi return nJ
end local function W(Gm,Gn)L("UICorner",{CornerRadius=UDim.new(0,Gn or 8)},Gm)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(ir,nK)if ir and a.shown[ir]~=nK then a.shown[ir]=nK ir.Text=nK end
end function a.stroke(Go,Gp,Gq)return L("UIStroke",{Color=Gp or l.line,Thickness=1,Transparency=Gq or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},Go)
end function a.grad(Gr,Gs,Gt,Gu)local Gv,wp=pcall(function()return ColorSequence.new(Gs,Gt)end)if Gv and wp then return L("UIGradient",{Color=wp,Rotation=Gu or 0},Gr)end
end function a.pad(Gw,wq,wr,Gx,Gy)L("UIPadding",{PaddingLeft=UDim.new(0,wq or 0),PaddingTop=UDim.new(0,wr or 0),
PaddingRight=UDim.new(0,Gx or wq or 0),PaddingBottom=UDim.new(0,Gy or wr or 0)},Gw)end function a.list(Gz,GA,GB)
return L("UIListLayout",{Padding=UDim.new(0,GA or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=GB and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Gz)
end function a.ink(nL)local GC,GD=pcall(function()return 0.299*nL.R+0.587*nL.G+0.114*nL.B end)return(GC and GD>0.55)and l.ink or l.text
end function a.nextIn(ws)local wt=(a.ord[ws]or 0)+1 a.ord[ws]=wt return wt end local nM=K:FindFirstChildOfClass("PlayerGui")or K:WaitForChild("PlayerGui")
local wu=nM:FindFirstChild("SABFarmGui")if wu then wu:Destroy()end local nN=L("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},nM)local T={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local is=ak.CurrentCamera.ViewportSize if is.X>100 and is.Y>100 then T.w=math.clamp(math.floor(is.X*0.48),320,400)
T.h=math.clamp(math.floor(is.Y*0.86),250,360)end end)a.root=L("Frame",{Name="Root",Size=UDim2 .new(0,T.w,0,T.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},nN)
W(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local wv=UDim2 .new(1,0,1,0)
local function LI(ww,wx)return UDim2 .new(ww,0,0,0),UDim2 .new(wx,(ww+wx>0.99)and 0 or-4,1,0)end local function aj(GE,GF,fH,GG,GH,GI)
local nO=L("TextButton",{Text=GF,Position=GH,Size=GI,BackgroundColor3=fH,BorderSizePixel=0,Font=af.b,TextSize=GG,TextColor3=a.ink(fH),AutoButtonColor=true},GE)
W(nO,8)if fH==l.panel2 or fH==l.raise or fH==l.panel then a.stroke(nO,l.line,0.4)end return nO end local function it(GJ,GK,GL,GM,GN)
local iu=L("TextBox",{Text=GK,PlaceholderText=GL,Position=GM,Size=GN,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},GJ)W(iu,8)a.stroke(iu,l.line,0)a.pad(iu,9,0,6,0)
return iu end local iv=ak.CurrentCamera local function GO()local GP,iw=pcall(function()return iv and iv.ViewportSize end)
if GP and iw and iw.X>50 and iw.Y>50 then return iw end end local function b4(fI)local nP=GO()if not(nP and fI and fI.Parent)then return end
local GQ=pcall(function()local ix,wy=fI.AbsolutePosition,fI.AbsoluteSize local nQ=70 local wz=math.clamp(ix.X,nQ-wy.X,nP.X-nQ)
local wA=math.clamp(ix.Y,0,nP.Y-math.min(wy.Y,nQ))if math.abs(wz-ix.X)>0.5 or math.abs(wA-ix.Y)>0.5 then fI.Position=UDim2 .new(0,math.floor(wz),0,math.floor(wA))
end end)return GQ end local function iy(GR)local GS,nR=pcall(function()return GR.AbsolutePosition end)if GS and nR then return{math.floor(nR.X),math.floor(nR.Y)}end
end local dE={}c.dragMoved={}local function wB(fJ,wC,nS)V(fJ.InputBegan:Connect(function(dF)if dF.UserInputType~=Enum.UserInputType.MouseButton1 and dF.UserInputType~=Enum.UserInputType.Touch then return end
local nT={start=dF.Position,from=wC.Position,moved=0,target=wC,input=dF,onDrop=nS}dE[fJ],c.dragMoved[fJ]=nT,0
local nU nU=dF.Changed:Connect(function()if dF.UserInputState==Enum.UserInputState.End and dE[fJ]==nT then dE[fJ]=nil
if nU then nU:Disconnect()end if nS then nS(nT.moved)end end end)end))end V(oV.InputChanged:Connect(function(iz)
if iz.UserInputType~=Enum.UserInputType.MouseMovement and iz.UserInputType~=Enum.UserInputType.Touch then return end
for GT,bd in pairs(dE)do local nV=bd.target if nV and nV.Parent then local wD,wE=iz.Position.X-bd.start.X,iz.Position.Y-bd.start.Y
bd.moved=math.max(bd.moved,math.abs(wD)+math.abs(wE))c.dragMoved[GT]=bd.moved nV.Position=UDim2 .new(bd.from.X.Scale,bd.from.X.Offset+wD,bd.from.Y.Scale,bd.from.Y.Offset+wE)
end end end))V(oV.InputEnded:Connect(function(iA)if iA.UserInputType~=Enum.UserInputType.MouseButton1 and iA.UserInputType~=Enum.UserInputType.Touch then return end
for GU,iB in pairs(dE)do if iB.input==iA or iA.UserInputType==Enum.UserInputType.MouseButton1 then dE[GU]=nil
if iB.onDrop then iB.onDrop(iB.moved)end end end end))local function Q(GV,GW,GX,GY,GZ,G0,G1)return L("TextLabel",{Text=GW,Position=G0 or UDim2 .new(0,0,0,0),Size=G1 or wv,BackgroundTransparency=1,
Font=GZ and af.b or af.m,TextSize=GX,TextColor3=GY,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},GV)
end function a.row(wF,G2)return L("Frame",{Size=UDim2 .new(1,0,0,G2),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(wF)},wF)end function a.card(wG,wH,wI)local dG=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(wG)},wG)W(dG,11)a.stroke(dG,l.line,0.25)a.list(dG,5)a.pad(dG,8,8,8,9)if wH then
local nW=a.row(dG,14)L("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},nW)Q(nW,wH:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if wI then local G3=Q(nW,wI,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
G3 .TextXAlignment=Enum.TextXAlignment.Right end end return dG end function a.heading(G4,G5,nX)local nY=a.row(G4,nX and 34 or 22)
Q(nY,G5,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=af.x if nX then Q(nY,nX,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return nY end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(nZ)local aN=a.sw[nZ]if not aN then return end
local dH=tostring(nZ.Text or""):match(":%s*(.-)%s*$")or""local b5=dH~=""and not a.OFF[dH]local n0=not aN.chips and(dH=="ON"or dH=="OFF")
aN.pill.Visible,aN.chip.Visible=n0,not n0 if n0 then aN.pill.BackgroundColor3=b5 and l.accent or l.panel2 aN.knob.Position=b5 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aN.knob.BackgroundColor3=b5 and l.white or l.dim else aN.chip.Text=dH~=""and dH or"-"aN.chip.BackgroundColor3=b5 and l.accent or l.panel2
aN.chip.TextColor3=b5 and l.ink or l.dim end nZ.BackgroundColor3=b5 and l.lit or l.raise if aN.edge then aN.edge.Color=b5 and l.accent or l.line aN.edge.Transparency=b5 and 0.55 or 0.45 end
end function a.switch(wJ,G6,G7,fK)local a5=L("TextButton",{Name="Switch",Text=G6,TextTransparency=1,TextSize=8,Font=af.b,
Size=UDim2 .new(1,0,0,fK and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(wJ)},wJ)
W(a5,9)local ax={edge=a.stroke(a5,l.line,0.45)}ax.title=Q(a5,G7,11,l.text,true,UDim2 .new(0,10,0,fK and 4 or 0),UDim2 .new(1,-100,0,fK and 15 or 28))
ax.title.TextWrapped,ax.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fK then ax.sub=Q(a5,fK,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
ax.sub.TextWrapped,ax.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end ax.pill=L("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a5)W(ax.pill,9)ax.knob=L("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},ax.pill)W(ax.knob,7)ax.chip=L("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=af.b,TextSize=9,TextColor3=l.dim,Text=""},a5)
W(ax.chip,9)a.pad(ax.chip,10,0,10,0)L("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},ax.chip)
ax.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a5]=ax V(a5:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a5)end))
a.skin(a5)return a5 end function a.chips(n1)if a.sw[n1]then a.sw[n1].chips=true a.skin(n1)end end function a.line(G8,G9)
local wK=a.row(G8,15)local wL=L("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=G9 or l.dim,
BorderSizePixel=0},wK)W(wL,3)local n2=Q(wK,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))n2 .TextWrapped,n2 .TextTruncate=false,Enum.TextTruncate.AtEnd
return n2,wL end function a.grow(wM,G_,Ha)local iC=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=af.m,TextSize=G_ or 10,TextColor3=Ha or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(wM)},wM)
V(iC:GetPropertyChangedSignal("Text"):Connect(function()iC.Visible=iC.Text~=""end))return iC end function a.note(Hb,Hc)
local wN=a.grow(Hb,9,l.dim)wN.Text=Hc return wN end function a.actions(Hd,wO)local He=a.row(Hd,28)local wP,n3={},#wO
for fL,wQ in ipairs(wO)do wP[fL]=aj(He,wQ[1],wQ[2]or l.panel2,10,UDim2 .new((fL-1)/n3,fL>1 and 3 or 0,0,0),UDim2 .new(1/n3,(fL>1 and-3 or 0)+(fL<n3 and-3 or 0),1,0))
end return table.unpack(wP)end local function O(cO,iD,Hf,Hg)a.put(cO,iD and Hf or Hg)if not a.sw[cO]and a.lit[cO]~=iD then
a.lit[cO]=iD cO.BackgroundColor3=iD and l.accent or l.panel2 cO.TextColor3=a.ink(cO.BackgroundColor3)end end a.title=L("Frame",{Size=UDim2 .new(1,0,0,T.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
W(a.title,14)L("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
L("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local n4=L("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
W(n4,8)a.grad(n4,l.accent,l.accent2,45)local wR=Q(n4,"C",16,l.ink,true)wR.Font,wR.TextXAlignment=af.x,Enum.TextXAlignment.Center
local Hh=Q(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))Hh.Font=af.x Q(a.title,"butter farm  "..cb,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local Hi=a.list(a.tabs,3)pcall(function()Hi.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((T.h-T.head-12)/10)-3,20,34)local function be(Hj,Hk,Hl)
local iE=L("TextButton",{Text=Hj,Font=af.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)W(iE,9)local wS=L("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iE)W(wS,2)a.tabsAll[#a.tabsAll+1]={b=iE,bar=wS,name=Hk,sub=Hl}return iE end a.tabFarm=be("🏠","Home","what the farm is doing")
a.tabRun=be("🌾","Farm","the buy - wax - collect loop")a.tabBut=be("🧈","Butters","what gets bought and waxed")
a.tabCrt=be("📦","Crates","which crates get opened")a.tabPet=be("🐾","Pets","adopt, wish, fuse")a.tabTeam=be("👥","Teams","the right pets at the right moment")
a.tabSrv=be("🤝","Server","helping, campfire, ghost")a.tabAdm=be("⚡","Admin","admin abuse and its boosts")a.tabSet=be("⚙","Settings","configs, startup, performance")
a.tabAlt=be("🔗","Alts","several accounts working together")local function bf()local n5=L("ScrollingFrame",{Position=UDim2 .new(0,T.rail,0,T.head+T.status+10),
Size=UDim2 .new(1,-T.rail,1,-(T.head+T.status+10)),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,
CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)
a.list(n5,8)a.pad(n5,8,2,10,12)return n5 end a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bf(),bf(),bf(),bf(),bf(),bf(),bf(),bf(),bf()
a.farm.Visible=true a.alt=bf()do local fM=a.farm local wT=a.row(fM,34)a.startB=aj(wT,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=af.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(wT,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local Hm=a.row(fM,44)local function fN(wU,Hn,wV)local iF=L("Frame",{Position=UDim2 .new((wU-1)/wV,wU>1 and 2 or 0,0,0),Size=UDim2 .new(1/wV,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},Hm)W(iF,9)a.stroke(iF,l.line,0.3)local iG=Q(iF,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iG.Font,iG.TextXAlignment,iG.TextWrapped=af.x,Enum.TextXAlignment.Center,false local Ho=Q(iF,Hn,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
Ho.TextXAlignment=Enum.TextXAlignment.Center return iG end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fN(1,"BOUGHT",5),fN(2,"WAXED",5),fN(3,"SOLD",5),fN(4,"MONEY",5),fN(5,"FREE",5)
local wW=a.card(fM,"Right now")a.info=Q(a.row(wW,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=Q(a.row(wW,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fO=a.card(fM,"Systems")
a.helpL=a.line(fO,l.info)a.campL=a.line(fO,l.accent2)a.questL=a.line(fO,l.good)a.arL=a.line(fO,l.accent)a.ixL=a.line(fO,nI.Dotonbori)
local wX=a.card(fM,"Activity")a.log=L("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(wX)},wX)
W(a.log,7)a.pad(a.log,7,5,7,5)end local function LJ(Hp,Hq)return a.row(Hq or a.farm,Hp)end local an do local n6=a.run
a.heading(n6,"Farm","buy what rolls, wax it, collect the cash")local fP=a.card(n6,"Loop")a.colT=a.switch(fP,"COLLECT: ON","Collect cash","step on the collector by itself")
an=a.row(fP,26)Q(an,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=it(an,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
Q(an,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fP,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fP,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fP,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local n7=a.card(n6,"By hand")
a.buyB,a.plB=a.actions(n7,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(n7,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
an=a.row(n7,28)a.padB=aj(an,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=Q(an,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iH=a.but a.heading(iH,"Butters","what gets bought and waxed")local wY=a.card(iH,"Strategy")a.ixT=a.switch(wY,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(wY,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iH)},iH)a.list(a.butList,5)end do local iI=a.crt a.heading(iI,"Crates","only ticked crates are opened")
local wZ=a.card(iI,"Opening")a.crateT=a.switch(wZ,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(wZ,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iI)},iI)a.list(a.crtList,5)end do local fQ=a.pet a.heading(fQ,"Pets","adopt, wish, fuse Bigs and Huges")
local fR=a.card(fQ,"Automatic")a.pbT=a.switch(fR,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fR,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fR,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fR,10,l.dim)a.note(fR,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local w0=a.card(fQ,"The plan","best teams with every pet")a.planInfo=a.grow(w0,10,l.text)a.note(w0,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fQ)},fQ)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iJ=a.srv a.heading(iJ,"Server","other players, the campfire, staying hidden")
local n8=a.card(iJ,"Helping")a.helpT=a.switch(n8,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(n8,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(n8,l.info)
local w1=a.card(iJ,"Campfire")a.campT=a.switch(w1,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(w1,l.accent2)local n9=a.card(iJ,"Ghost")a.ghostT=a.switch(n9,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(n9,l.dim)a.note(n9,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fS=a.adm a.heading(fS,"Admin abuse","the show, its boosts and the farm in it")local w2=a.card(fS,"When")
a.admBig=Q(a.row(w2,22),"-",15,l.text,true)a.admBig.Font=af.x a.admSub=Q(a.row(w2,14),"",10,l.dim,false)local Hr=a.card(fS,"Boosts now")
a.admBoost=a.grow(Hr,11,l.text)local n_=a.card(fS,"What the farm does")a.shT=a.switch(n_,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(n_,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(n_,l.accent)
local w3=a.card(fS,"Show feed")a.admFeed=L("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(w3)},w3)
W(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cP=a.set a.heading(cP,"Settings","kept on your phone, per config")
local iK=a.card(cP,"Config")an=a.row(iK,28)a.cfgName=it(an,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=aj(an,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=aj(an,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
an=a.row(iK,26)a.cfgPrev=aj(an,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=aj(an,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=aj(an,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iK,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iK,10,l.dim)local oa=a.card(cP,"Starting")a.startT=a.switch(oa,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(oa,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(oa,9,l.dim)local ob=a.card(cP,"If the game drops me")
a.rejT=a.switch(ob,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(ob,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(ob,9,l.dim)local bA=a.card(cP,"Performance")a.pfCalm=a.switch(bA,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bA,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bA,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bA,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bA,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bA,"STOP 3D: OFF","Stop 3D","blank the world behind this window")an=a.row(bA,28)Q(an,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=it(an,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))Q(an,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bA,l.good)a.note(bA,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local Hs=a.card(cP,"Your game passes","read from the game")a.passInfo=a.grow(Hs,10,l.text)local Ht=a.card(cP,"About")
a.note(Ht,"CHURN "..cb.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for LK,Hu in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(Hu)end local w4=L("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},nM)
a.tgRoot=L("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},w4)W(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=L("TextButton",{Text="C",Size=wv,BackgroundTransparency=1,Font=af.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=L("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
W(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=L("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=af.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
W(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fT=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fT][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fT][2]
a.tgGhost.BackgroundColor3=fT==2 and l.accent or(fT==1 and l.warn or l.panel)a.tgGhost.TextColor3=fT>0 and l.ink or l.dim
end end local bB={built=false,boxes={},at=0}function a.check(iL,oc)iL.Text=oc and"✓"or""iL.BackgroundColor3=oc and l.accent or l.bg
iL.TextColor3=l.ink local od=iL.Parent if od and od:IsA("TextButton")then od.BackgroundColor3=oc and l.lit or l.raise end
end local function w5(w6,w7)e.Targets[w6]=w7 or nil local w8=bB.boxes[w6]if w8 then a.check(w8,w7)end end local function oe()
for Hv,Hw in pairs(bB.boxes)do a.check(Hw,e.Targets[Hv]==true)end end function a.tickBox(Hx)local of=L("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Hx)W(of,6)
a.stroke(of,l.line,0)return of end local fU local function Hy()local Hz=a.card(a.butList,"Butter list")local og=a.row(Hz,26)
a.butInfo=Q(og,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local HA=aj(og,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local HB=aj(og,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))HA.MouseButton1Click:Connect(function()
for HC in pairs(e.Targets)do e.Targets[HC]=nil end oe()end)HB.MouseButton1Click:Connect(function()ae.at=0 jV()
fU(true)end)end fU=function(HD)if not jV()then if not a.butEmpty then a.butEmpty=Q(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bB.built and not HD and bB.at==ae.at then return end for LL,iM in ipairs(a.butList:GetChildren())do
if iM:IsA("Frame")or iM:IsA("TextButton")or iM:IsA("TextLabel")then iM:Destroy()end end bB.boxes,a.butEmpty={},nil
Hy()for LM,iN in ipairs(ae.rarOrder)do local oh=nI[iN]or l.text local cQ=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)W(cQ,11)a.stroke(cQ,oh,0.7)a.list(cQ,4)a.pad(cQ,7,7,7,8)
local oi=a.row(cQ,22)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=oh,BorderSizePixel=0},oi)
local HE=Q(oi,iN:upper(),11,oh,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))HE.Font=af.x local HF=aj(oi,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local HG=iN HF.MouseButton1Click:Connect(function()local w9=ae.members[HG]or{}local w_=false for LN,HH in ipairs(w9)do if not e.Targets[HH]then w_=true break end end
for LO,HI in ipairs(w9)do w5(HI,w_)end end)for LP,oj in ipairs(ae.members[iN]or{})do local iO=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cQ)},cQ)W(iO,8)local xa=Q(iO,am(oj),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
xa.TextWrapped,xa.TextTruncate=false,Enum.TextTruncate.AtEnd local xb=a.tickBox(iO)bB.boxes[oj]=xb local xc=oj
local function xd()w5(xc,not e.Targets[xc])end iO.MouseButton1Click:Connect(xd)xb.MouseButton1Click:Connect(xd)
end end oe()bB.built,bB.at=true,ae.at end function M.paint()for HJ,HK in pairs(M.boxes)do a.check(HK,e.CrateTicks[HJ]==true)end
if a.crtInfo then local ol,om=0,0 for LQ in pairs(M.boxes)do ol=ol+1 end for LR,HL in pairs(e.CrateTicks)do if HL then om=om+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(ol,om))end if a.crateT then O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function M.build()for LS,iP in ipairs(a.crtList:GetChildren())do if iP:IsA("Frame")or iP:IsA("TextButton")or iP:IsA("TextLabel")then iP:Destroy()end
end M.boxes={}local oo=a.card(a.crtList,"All of them","worst first")local op=a.row(oo,26)a.crtInfo=Q(op,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local HM=aj(op,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local HN=aj(op,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
V(HM.MouseButton1Click:Connect(function()e.CrateTicks={}M.paint()end))V(HN.MouseButton1Click:Connect(function()M.build()end))
for LT,bC in ipairs(M.list())do local xe=nI[bC.rar or""]or l.text local dI=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(oo)},oo)W(dI,8)L("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=xe,BorderSizePixel=0},dI)
local xf=Q(dI,(bC.title or bC.name)..(bC.guess and"  (?)"or""),11,xe,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
xf.TextWrapped,xf.TextTruncate=false,Enum.TextTruncate.AtEnd local HO=Q(dI,bC.price and("$"..aF(bC.price))or(bC.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
HO.TextXAlignment=Enum.TextXAlignment.Right local xg=a.tickBox(dI)M.boxes[bC.k]=xg local xh=bC.k local function xi()
e.CrateTicks[xh]=(not e.CrateTicks[xh])or nil M.paint()end V(dI.MouseButton1Click:Connect(xi))V(xg.MouseButton1Click:Connect(xi))
end M.built=M.at M.paint()end local xj="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set","alt"}
local function aW(cR)xj=cR for HP,oq in ipairs(a.tabKeys)do a[oq].Visible=(oq==cR)local iQ=a.tabsAll[HP]if iQ then
local ot=oq==cR iQ.b.BackgroundTransparency,iQ.b.TextTransparency,iQ.bar.Visible=ot and 0 or 1,ot and 0 or 0.45,ot
end end if cR=="pet"and not o.built then pcall(o.build)end if cR=="team"and not A.built then pcall(A.build)end
if cR=="crt"and(M.built~=M.at or not next(M.boxes))then M.build()end if cR=="but"then fU(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(ou,xk,xl,xm)if xm then ou.Text=xm end ou.BackgroundColor3=xk and xl or l.bg ou.TextColor3=xk and a.ink(xl)or l.dim
end function o.paintRow(xn)local cS=o.rows and o.rows[xn]if not cS then return end local cT=e.Pets[xn]or{}local xo=tonumber(cT.f)==-1
a.flag(cS.b,cT.b,l.good)a.flag(cS.g,cT.g,l.accent,cT.g and"BIG"or"ANY")a.flag(cS.w,cT.w,l.warn)a.flag(cS.f,not xo,l.good,xo and"KEEP"or"AUTO")
if cS.row then cS.row.BackgroundColor3=(cT.b or cT.w)and l.lit or l.raise end end function o.flag(ov,iR)local bh=e.Pets[ov]or{}
if iR=="f"then bh.f=tonumber(bh.f)~=-1 and-1 or nil elseif bh[iR]then bh[iR]=nil else bh[iR]=true end e.Pets[ov]=(bh.b or bh.g or bh.w or bh.f)and bh or nil
o.paintRow(ov)end function o.paintAll()for HQ in pairs(o.rows or{})do o.paintRow(HQ)end if a.pbT then O(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
O(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")O(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(HR)local xp=y.dreamT if not xp then return"working the plan out..."end local HT,HU=y.needFor(""),y.needFor("Big")
local cU={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(HT,HU,y.slots())}for LU,xq in ipairs(y.dreamTeams or{})do cU[#cU+1]=xq.team:upper()..": "..table.concat(xq.names,", ")end
local iS,iT,iU=0,0,0 for xr,xs in pairs(xp)do local xt,HV=y.have(xr,HR)local LV,HW=y.goal(xr)iS=iS+math.max(0,xs.Huge-xt.Huge)
iT=iT+math.max(0,xs.Big-xt.Big)iU=iU+math.max(0,HW-HV)end cU[#cU+1]=(iS+iT+iU==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(iS,iT,iU)if y.fuseMsg~=""then cU[#cU+1]=y.fuseMsg end
return table.concat(cU,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local ow=o.wishes()local dJ=o.data()for iV,ox in pairs(o.rows)do local xu=y.status(iV,dJ)ox.desc.Text=(ow[iV]and("wishing %dm | "):format(math.ceil(ow[iV]/60))or"")..(xu and(xu.." | ")or"")..ox.boostText
ox.desc.TextColor3=ow[iV]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dJ))end local xv=tonumber(K:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dJ and#(dJ.pets or{})or 0,dJ and tonumber(dJ.maxOwned)or 60,
aF(o.money()),xv>0 and(" | free wishes "..xv)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local iW=o.info()for LW,iX in ipairs(a.petList:GetChildren())do if iX:IsA("Frame")or iX:IsA("TextLabel")or iX:IsA("TextButton")then iX:Destroy()end
end o.rows={}if not iW then Q(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dK={}for LX,xw in ipairs(o.order())do local oy=iW.Pets[xw].rarity or"?"dK[oy]=dK[oy]or{}
table.insert(dK[oy],xw)end local dL={}for LY,xx in ipairs(iW.Rarities or{})do if dK[xx]then dL[#dL+1]=xx end end
for xy in pairs(dK)do if not table.find(dL,xy)then dL[#dL+1]=xy end end for LZ,oz in ipairs(dL)do local iY=o.RC[oz]or l.text
local cV=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
W(cV,11)a.stroke(cV,iY,0.7)a.list(cV,4)a.pad(cV,7,7,7,8)local xz=a.row(cV,18)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=iY,BorderSizePixel=0},xz)
local HY=Q(xz,oz:upper(),11,iY,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))HY.Font=af.x for L0,iZ in ipairs(dK[oz])do
local fV=L("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cV)},cV)
W(fV,8)local oA=Q(fV,o.nice(iZ),11,iY,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))oA.TextWrapped,oA.TextTruncate=false,Enum.TextTruncate.AtEnd
local HZ,H0=pcall(function()return iW.describe(iZ)end)local xA=HZ and tostring(H0)or""local oB=Q(fV,xA,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oB.TextYAlignment,oB.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function i0(H1,H2,H3)
local xC=aj(fV,H1,l.bg,8,UDim2 .new(1,H2,0,5),UDim2 .new(0,H3,0,22))xC.AutoButtonColor=true return xC end local xD,xE,xF,xG=i0("BUY",-164,30),i0("ANY",-131,30),i0("WISH",-98,34),i0("AUTO",-61,56)
local i1=iZ xD.MouseButton1Click:Connect(function()o.flag(i1,"b")end)xE.MouseButton1Click:Connect(function()o.flag(i1,"g")end)
xF.MouseButton1Click:Connect(function()o.flag(i1,"w")end)xG.MouseButton1Click:Connect(function()o.flag(i1,"f")end)
o.rows[iZ]={b=xD,g=xE,w=xF,f=xG,name=oA,desc=oB,boostText=xA,row=fV}end end o.built=true o.paintAll()end function d.paint()
O(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")O(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
O(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")O(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
O(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])O(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end V(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
V(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))V(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
V(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))V(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
V(a.pfFps.MouseButton1Click:Connect(function()local H4=table.find(d.CAPS,e.FpsCap or 0)or 1 local xH=d.CAPS[(H4%#d.CAPS)+1]
if not d.cap(xH)and xH~=0 then D("this executor cannot cap fps")end d.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()
local oC=tonumber(a.pfMem.Text)if oC and oC>=0 then e.MemLimit=math.floor(oC)end d.paint()end))function A.names()
local oD={"(none)"}for L1,H5 in ipairs((A.teams()))do oD[#oD+1]=H5 .name end return oD end function A.cycle(oE,H6)
local i2=A.names()local H7=e[oE]~=""and e[oE]or"(none)"local i3=table.find(i2,H7)or 1 i3=((i3-1+H6)%#i2)+1 e[oE]=i2[i3]=="(none)"and""or i2[i3]
A.paint()end function A.paint()if not A.built then return end O(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
O(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oF={}for L2,H8 in ipairs((A.teams()))do oF[H8 .name]=true end
for H9,xI in pairs(A.pick)do local dM=e[H9]xI.Text=dM==""and"(none)"or(oF[dM]and dM or(dM.." (missing)"))xI.TextColor3=(dM~=""and not oF[dM])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local H_,i4=o.srv(),{}for L3,i5 in ipairs(A.list or{})do i4[#i4+1]=("st %-2s %-22s %9s  helps %d"):format(i5 .st.Name,am(ab(i5 .name)):sub(1,22),A.clock(i5 .ends-H_),i5 .helps)
end a.tmList.Text=#i4>0 and table.concat(i4,"\n")or"no waxes running"end function A.build()for L4,i6 in ipairs(a.teamList:GetChildren())do
if i6:IsA("Frame")or i6:IsA("TextLabel")or i6:IsA("TextButton")then i6:Destroy()end end A.pick={}local i7=a.card(a.teamList,"Automatic")
a.tmT=a.switch(i7,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(i7,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(i7,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local Ia,Ib=pcall(y.rebuild,"you asked")if not Ia then D("BUILD ERR "..tostring(Ib))end end)
end)a.tmInfo=a.grow(i7,10,l.dim)local xJ=a.card(a.teamList,"Which team when")local function i8(i9,Ic,Ie)local fW=a.row(xJ,54)
Q(fW,Ic,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local xK=Q(fW,Ie,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
xK.TextWrapped,xK.TextTruncate=false,Enum.TextTruncate.AtEnd local If=aj(fW,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local xL=aj(fW,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local Ig=aj(fW,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
If.MouseButton1Click:Connect(function()A.cycle(i9,-1)end)Ig.MouseButton1Click:Connect(function()A.cycle(i9,1)end)
xL.MouseButton1Click:Connect(function()A.cycle(i9,1)end)A.pick[i9]=xL end i8("TeamNormal","Normal","the rest of the time: money + luck")
i8("TeamFull","Full","every station busy: money + wax speed")i8("TeamGlaze","Glaze","worn just before a wax finishes")
local i_=a.row(xJ,26)Q(i_,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=it(i_,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
Q(i_,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local Ih=aj(i_,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
Ih.MouseButton1Click:Connect(function()local ja=tonumber(a.tmLead.Text)if ja and ja>=5 and ja<=600 then e.GlazeLead=math.floor(ja)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)i8("TeamWax","Wax","while a butter is placed: head starts")local xM=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(xM)},xM)W(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local Ii=a.card(a.teamList,"How it works")a.note(Ii,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function Ij()a.secB.Text=tostring(e.Every)O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ah(0.1)end if not F.home then pcall(d.unpin)end end)end
O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fs(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b4(a.root)b4(a.tgRoot)c.lastCollect=z()
oe()M.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function Ik(xN)task.spawn(function()xN.TextColor3=l.bad
task.wait(0.8)if c.alive then xN.TextColor3=l.text end end)end local function xO()local xP=a.secB.Text:match("^%s*(%d+)%s*$")
local fX=xP and tonumber(xP)if not fX or fX<1 then a.secB.Text=tostring(e.Every)Ik(a.secB)D("interval must be a whole number >= 1")
return end if fX==e.Every then return end e.Every,c.lastCollect=fX,z()D("collect every "..fX.."s")end local function N(Il,Im)V(Il.MouseButton1Click:Connect(Im))end
N(a.secSet,xO)V(a.secB.FocusLost:Connect(xO))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(au,"selling...",u7)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(E.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help F.nextAt,F.msg=0,e.Help and"looking for waxes to help"or"off"O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests J.at=0 O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire H.nextAt,H.fails,H.lost=0,0,0 O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()O(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")O(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
O(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
O(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")O(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(In)task.spawn(function()pcall(q.tick)if In and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local Io=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(Io)end)
N(a.bestT,function()local Ip=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(Ip)end)N(a.bcT,function()
local Iq=q.on()e.BestCrate=not e.BestCrate q.changed(Iq)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b6=o.srv()local b7 pcall(function()q.aac=q.aac or require(ag:FindFirstChild("AdminAbuseClient"))
b7=q.aac:GetState()end)local dN,b8="nothing scheduled","the game has not announced one"if type(b7)=="table"then
local fY,a6,b9=tostring(b7 .Phase or""),tonumber(b7 .StartsAt),tonumber(b7 .EndsAt)if a6 and a6<1e9 then a6=nil end
if b9 and b9<1e9 then b9=nil end if fY=="Countdown"and a6 then dN,b8="starts in "..A.clock(a6-b6),os.date("%a %H:%M",math.floor(a6)).." your time"
elseif fY=="Live"and b9 then dN,b8="LIVE  -  "..A.clock(b9-b6).." left","the farm is grabbing, waxing and glazing through it"
elseif fY~=""and fY~="Idle"and b9 and b9>b6 then dN,b8=fY:lower().."  -  "..A.clock(b9-b6).." left","after the show"
elseif a6 and a6>b6 then dN,b8="next: "..os.date("%a %H:%M",math.floor(a6)),"your time"elseif a6 then dN,b8="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a6)).." your time"
end if type(b7 .Kind)=="string"and b7 .Kind~=""then b8=b8 .."  |  "..b7 .Kind end end a.put(a.admBig,dN)a.put(a.admSub,b8)
local dO,oG={},ag:FindFirstChild("AdminShow")if oG then local Ir,Is=pcall(function()return oG:GetAttributes()end)
for xQ,dP in pairs(Ir and Is or{})do local jb=type(xQ)=="string"and xQ:match("^(.-)Mult$")local oH=jb and tonumber(oG:GetAttribute(jb.."Until"))
if jb and type(dP)=="number"and dP~=1 and dP~=0 and oH and oH>b6 then dO[#dO+1]=("%s  x%s   %s left"):format(jb:gsub("(%l)(%u)","%1 %2"),(dP%1==0)and tostring(dP)or("%.2f"):format(dP),
A.clock(oH-b6))end end end table.sort(dO)a.put(a.admBoost,#dO>0 and table.concat(dO,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dO>0 and l.accent or l.dim local jc=0 for L5 in pairs(P.drops)do jc=jc+1 end local xR=q.snapAt and(q.snapAt-b6)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(P.got,P.miss,jc>0 and(", "..jc.." falling")or"",
xR and("in "..math.max(0,math.floor(xR)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(au,"opening crate...",eo,true)end)N(a.padB,function()c.plot=bD()or c.plot local xS,oI=ar(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(xS and oI and oI:IsA("BasePart"))then D("SET PAD: need character and plot")return end c.manualPad=oI.CFrame:ToObjectSpace(xS.HumanoidRootPart.CFrame)
EZ(c.manualPad)D("collect pad saved at your position")end)N(a.startB,function()fs(not c.running)end)N(a.buyB,function()
c.plot=bD()or c.plot task.spawn(au,"buying (manual)...",qE,true)end)N(a.plB,function()c.plot=bD()or c.plot task.spawn(au,"waxing (manual)...",qI)
end)N(a.tabFarm,function()aW("farm")end)N(a.tabRun,function()aW("run")end)N(a.tabSrv,function()aW("srv")end)N(a.tabAdm,function()aW("adm")end)
N(a.tabBut,function()aW("but")end)N(a.tabSet,function()aW("set")end)N(a.tabCrt,function()aW("crt")end)N(a.tabPet,function()aW("pet")end)
N(a.tabTeam,function()aW("team")end)N(a.tabAlt,function()aW("alt")if type(a.altShown)=="function"then pcall(a.altShown)end end)
a.mk,a.lbl,a.button,a.round,a.C,a.FT,a.click=L,Q,aj,W,l,af,N do local It=a.card(a.alt,"Alts","several accounts in one server")
a.altNote=Q(a.row(It,40),"The team module is not running on this account. Load the farm with altboot.lua to use it.",10,l.dim,false)
a.altNote.TextWrapped,a.altNote.TextYAlignment=true,Enum.TextYAlignment.Top end local function Iu(oJ)c.hidden=oJ
a.root.Visible=not oJ a.tgBtn.TextColor3=oJ and l.text or l.ink end wB(a.tgBtn,a.tgRoot,function()b4(a.tgRoot)
c.togPos=iy(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then Iu(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aO,az={},0 local function b_()aO=p0()if#aO==0 then a.cfgPick.Text="(none saved)"
az=0 return end if az<1 or az>#aO then az=1 end a.cfgPick.Text=aO[az]..("  (%d/%d)"):format(az,#aO)end local function xT()
local xU=c.autoload~=nil a.cfgAuto.Text=xU and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=xU and l.accent or l.panel2
end local function oK()local xV=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if xV~=""then return xV end return(az>0 and aO[az])or""
end N(a.cfgSave,function()c.winPos=iy(a.root)or c.winPos c.togPos=iy(a.tgRoot)or c.togPos local xW,xX=gC(oK())
a.cfgMsg.Text=xW and("saved as "..xX)or("could not save: "..xX)a.cfgMsg.TextColor3=xW and l.good or l.bad b_()
D(a.cfgMsg.Text)end)local function Iv(oL)local oM,xY=p9(oL)a.cfgMsg.Text=oM and("loaded "..xY)or("could not load: "..xY)
a.cfgMsg.TextColor3=oM and l.good or l.bad if oM then a.cfgName.Text=oL Ij()task.spawn(E.apply,"config "..oL)
end D(a.cfgMsg.Text)end N(a.cfgLoad,function()Iv(oK())end)N(a.cfgPick,function()b_()if az>0 then a.cfgName.Text=aO[az]end
end)N(a.cfgPrev,function()if#aO==0 then b_()return end az=(az-2)%#aO+1 b_()a.cfgName.Text=aO[az]end)N(a.cfgNext,function()
if#aO==0 then b_()return end az=az%#aO+1 b_()a.cfgName.Text=aO[az]end)N(a.cfgAuto,function()if c.autoload then
qa(nil)a.cfgMsg.Text="it will not load a config on launch"else local fZ=oK()local xZ=false for L6,Iw in ipairs(p0())do if Iw==fZ then xZ=true end end
local Ix=xZ or gC(fZ)if Ix and fZ~=""then qa(fZ)b_()a.cfgMsg.Text=fZ.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim xT()end)N(a.autoB,function()
local x0,x1=zU()a.autoMsg.Text=x0 and("installed. "..x1)or("failed: "..x1)a.autoMsg.TextColor3=x0 and l.good or l.bad
D(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()d8("you asked")end)
local bi=false N(a.minB,function()bi=not bi a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bi,not bi,not bi
if bi then for L7,Iy in ipairs(a.tabKeys)do a[Iy].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,T.head+6),UDim2 .new(1,-16,0,T.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,T.rail+8,0,T.head+6),UDim2 .new(1,-(T.rail+16),0,T.status)aW(xj)
end a.root.Size=UDim2 .new(0,T.w,0,bi and(T.head+T.status+12)or T.h)a.minB.Text=bi and"+"or"-"end)local function jd()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(gb)for L8,Iz in ipairs(jm)do pcall(function()Iz:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()nN:Destroy()end)
pcall(function()w4:Destroy()end)if cX.SAB_KILL==jd then cX.SAB_KILL=nil end end cX.SAB_KILL=jd N(a.killB,jd)N(a.xB,jd)
wB(a.title,a.root,function()b4(a.root)c.winPos=iy(a.root)or c.winPos end)local function x2()local f0,cW=c.reason,c.level
if c.busy then f0,cW=c.busyText,"ok"elseif not c.running then local L9,x3,IA=vG()if c.capHit then f0,cW=x3,"bad"else f0,cW="[stopped] "..x3,(IA=="bad")and"bad"or"idle"end
c.reason,c.level=f0,cW end local dQ=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dQ then
a.lit.dot=dQ a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dQ,dQ,dQ,dQ a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,f0)if a.lit.bar~=cW then a.lit.bar=cW a.bar.BackgroundColor3=Gf[cW]or l.dim end
if bi then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local ca=zu()if a.farm.Visible then local IB,IC=f9()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,IB.."/"..IC)local x4=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local x5=ad()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aF(bj()),c.rolls,c.gifts,c.crates,x5 and am(ab(x5))or"nothing",j.on and("   ["..j.title.." window open]")or"",
x4 and("in "..x4 .."s")or"off"))a.put(a.tgt,(#ca==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#ca<=3)and table.concat(ca,", ")or(#ca.." butters ticked"))))
if a.lit.tgt~=(#ca==0)then a.lit.tgt=(#ca==0)a.tgt.TextColor3=(#ca==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(f3,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and F.msg or"helping is off")a.put(a.srvCamp,e.Campfire and H.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ae.n,#ae.rarOrder,#ca))
end if a.but.Visible and bB.at~=ae.at then fU(false)end if a.crt.Visible then if M.built~=M.at then M.build()else M.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and F.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and H.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(J.msg~=""and J.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local x6=(E.rec.on and"on"or"")..(E.rec.off and((E.rec.on and"/"or"").."off")or"")
a.put(a.arL,E.msg~=""and E.msg or("auto roll  %s | knows %s%s"):format(E.isOn()and"running"or"stopped",x6~=""and x6 or"nothing yet",#E.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(E.msg~="")then a.lit.arL=(E.msg~="")a.arL.TextColor3=E.msg~=""and l.warn or l.dim end end end cX.SAB={S=c,CFG=e,EV=aa,U=a,sg=nN,CAT=ae,LEARN=al,buildList=fU,
logAll=dR,evAll=dS,AR=E,CR=M,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=F,CF=H,QX=J,IX=q,SH=P}D(cb.." loaded")if c.uiErrs>0 then D("UI: "..c.uiErrs.." properties skipped")end
aW("farm")b4(a.root)b4(a.tgRoot)if iv then pcall(function()V(iv:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)b4(a.root)b4(a.tgRoot)end))end)end b_()xT()if c.config and c.config~=""then a.cfgName.Text=c.config end
O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(x2)task.spawn(function()local x7=zS()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(x7 and("\n(backup: "..x7 ..")")or"")
local x8=gv(ao.exec)if x8 and not x8:find("SAB autoloader v2",1,true)then d5(ao.exec,ao.stub)D("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(gv(ao.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(z0)end)task.spawn(function()while c.alive do local ID,IE=pcall(x2)if not ID then D("UI ERR "..tostring(IE))end
task.wait((c.hidden or bi)and 1.5 or 0.4)end end)task.spawn(function()local IF,IG=pcall(z8)if not IF then D("HOOK ERR "..tostring(IG))end
end)task.spawn(function()pcall(yR)if j.loadSeq and not j.learned then local je={}for x9=1,20 do if j.loadSeq[x9]then je[#je+1]=j.loadSeq[x9]end end
if#je>0 then j.learned={seq=je,mode=j.loadMode}D("remembered how to open crates directly")end end if jV()then D(("catalog: %d butters in %d rarities"):format(ae.n,#ae.rarOrder))end
local IH,x_=pcall(E1)if IH and x_ and c.alive and not c.manualPad then c.manualPad=x_ end end)task.spawn(function()
while c.alive do local oN,oO=pcall(o.buyTick)if not oN then D("PET ERR "..tostring(oO))task.wait(5)end oN,oO=pcall(o.wishTick)
if not oN then D("WISH ERR "..tostring(oO))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local jf,ya=0,z()
V(game:GetService("RunService").Heartbeat:Connect(function()jf=jf+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
V(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local yb=z()d.fps,jf,ya=jf/math.max(yb-ya,0.001),0,yb local II,IJ=pcall(d.tick)if not II then D("PERF ERR "..tostring(IJ))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local IK,IL=pcall(y.tick)if not IK then D("FUSE ERR "..tostring(IL))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local IM,IN=pcall(A.tick)if not IM then D("TEAM ERR "..tostring(IN))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local jg=ag:WaitForChild("Remotes",30)local yc=jg and jg:WaitForChild("ClanEvent",30)
if yc and c.alive then V(yc.OnClientEvent:Connect(function(IO,IP)if IO=="call"then pcall(F.onCall,IP)end end))
end local yd=jg and jg:FindFirstChild("RollConfirmAsk")if yd and c.alive then V(yd.OnClientEvent:Connect(function(IQ)J.asked=IQ or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)pcall(d.walkPatch,true)end
end end)task.spawn(function()local oP=ag:WaitForChild("Remotes",30)if not(oP and c.alive)then return end local function jh(IR,IS)
local oQ=oP:FindFirstChild(IR)if oQ and oQ:IsA("RemoteEvent")then V(oQ.OnClientEvent:Connect(function(...)pcall(IS,...)end))end
end jh("NewSquishyDiscovered",function(oR,ye)if type(oR)~="string"then return end q.disc=q.disc or{}q.disc[ab(oR)]=true
D(("INDEX: %s%s is in your Index now"):format(am(ab(oR)),ye and(" ("..tostring(ye)..")")or""))end)jh("IndexRefresh",q.loadDisc)
jh("IndexRowComplete",function(IT)D("INDEX: the whole "..tostring(IT).." row is complete")end)jh("AdminShow",q.admin)
local yf=oP:FindFirstChild("AdminShowSync")if yf then local IU,yg=pcall(function()return yf:InvokeServer()end)
if IU and type(yg)=="table"then for L_,IV in pairs(yg)do pcall(P.add,IV)end end end while c.alive do local IW,IY=pcall(q.tick)
if not IW then q.msg="index error: "..tostring(IY)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local IZ,I0=pcall(J.tick)if not IZ then D("QUEST ERR "..tostring(I0))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(gb)end end)pcall(E.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local I2=(type(newcclosure)=="function")and newcclosure or function(I1)return I1 end local oS
local yh=(type(setnamecallmethod)=="function")and setnamecallmethod or nil oS=hookmetamethod(game,"__namecall",I2(function(yi,...)
local f1=getnamecallmethod()if c.alive and(f1=="InvokeServer"or f1=="FireServer")then local yj,yk=pcall(function()return yi.Name end)
if yj and yk=="CrateAction"and not j.replaying then pcall(j.saw,f1,...)elseif yj and yk=="AutoRollAction"and not E.replaying then pcall(E.saw,f1,...)end
if yh then yh(f1)end end return oS(yi,...)end))j.oldNC=oS end)end if jk then V(K.Idled:Connect(function()pcall(function()jk:CaptureController()jk:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Ma=1,90 do if not c.alive then return end if K:GetAttribute("AutoRollOn")~=nil and ar()and(c.plot or bD())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then E.apply("joined")end while c.alive do task.wait(30)local ji=cg()
if ji and q.on()and not aP(ji.name)then ji=nil end if c.alive and e.AutoRoll and c.running and not E.isOn()and not ji and not ad()
and not j.waiting and not j.on and not c.busy then E.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Mb=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bD()if ar()and c.plot and q.any()then fs(true,true)D("started by itself")
return end task.wait(1)end if c.alive and not c.running then D("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bD()c.lastCollect=z()while c.alive do if c.running then local I3,yl=pcall(Ga)if not I3 and yl~=jl then D("LOOP ERR "..tostring(yl))end
end task.wait(0.1)end end)jj("ready - the window is at the top left")end local I5,oT=xpcall(yp,function(I4)return tostring(I4).."\n"..debug.traceback()end)
if not I5 then pcall(function()warn("SAB "..cb.." ERROR: "..tostring(oT))end)jj("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cb.." ERROR: "..tostring(oT))end)pcall(function()local ym=(type(getgenv)=="function"and getgenv())or _G
if type(ym.SAB_KILL)=="function"then ym.SAB_KILL()end for Mc,I6 in ipairs({"SABFarmGui","SABToggle"})do local yn=K.PlayerGui:FindFirstChild(I6)
if yn then yn:Destroy()end end end)pcall(function()local f2=Instance.new("ScreenGui")f2 .Name="SABError"f2 .ResetOnSpawn=false
f2 .DisplayOrder=1000 local a7=Instance.new("TextBox")a7 .Size=UDim2 .new(0,340,0,170)a7 .Position=UDim2 .new(0,10,0,50)
a7 .BackgroundColor3=Color3 .fromRGB(90,20,20)a7 .TextColor3=Color3 .new(1,1,1)a7 .TextSize=11 a7 .TextWrapped=true
a7 .ClearTextOnFocus=false a7 .TextXAlignment=Enum.TextXAlignment.Left a7 .TextYAlignment=Enum.TextYAlignment.Top
a7 .Text="SAB "..cb.." failed to start. Send this text:\n"..tostring(oT)a7 .Parent=f2 f2 .Parent=K:WaitForChild("PlayerGui")
end)end
