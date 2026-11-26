local cc="v28"local o5=game:GetService("Players")local K=o5 .LocalPlayer or o5 .PlayerAdded:Wait()local function jt(yH)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..cc,Text=yH,Duration=6})
end)end jt("script started")local function yI()local ag=game:GetService("ReplicatedStorage")local ak=game:GetService("Workspace")
local o6=game:GetService("UserInputService")local c1=(type(getgenv)=="function"and getgenv())or _G if type(c1 .SAB_KILL)=="function"then pcall(c1 .SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local ju=(function()local yJ,yK=pcall(function()return game:GetService("VirtualUser")end)return yJ and yK or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,NoWax=false,Crates=true,CrateTicks={picniccrate=true},
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
local o,A,d,y,F,H,J={},{},{},{},{},{},{}local q,P={},{}local jv={}local jw,ga,dW,dX={},{},{},{}local function V(o7)jw[#jw+1]=o7 return o7 end
local function ah(yL)task.wait(yL)if not c.alive then error(jv,0)end end local function D(gb)gb=os.date("%H:%M:%S").." "..tostring(gb)
table.insert(ga,1,gb)if#ga>6 then table.remove(ga)end c.logN=(c.logN or 0)+1 dW[#dW+1]=gb if#dW>80 then table.remove(dW,1)end
end local function gc(o8)if type(o8)~="string"then return""end return(o8:lower():gsub("[^%w]",""))end local function ab(yM)
local o9=gc(yM)local jx=o9:gsub("butter$","")if jx==""then jx=o9 end return jx end local function aP(o_)if type(o_)~="string"then return false end
local jy=ab(o_)if jy==""then return false end if q.want then return q.want(jy)end return e.Targets[jy]==true end
local function yN(dY)dY=dY:lower()return dY:find("squishy",1,true)~=nil or dY:match("butter$")~=nil or dY:match("butter[^%a]")~=nil
end local jz={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function av(dZ)if type(dZ)~="number"then return"?"end
local gd=1 while math.abs(dZ)>=1000 and gd<#jz do dZ=dZ/1000 gd=gd+1 end local yO=string.format("%.2f",dZ):gsub("%.?0+$","")
return yO..jz[gd]end local function yP(pa)if type(pa)~="string"then return nil end local yQ,d0=pa:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jA=tonumber(yQ)if not jA then return nil end if d0==""then return jA end local yR={qd="qa",qn="qi"}d0=yR[d0:lower()]or d0
for yS,yT in ipairs(jz)do if yT:lower()==d0:lower()then return jA*1000^(yS-1)end end return nil end local function bj()
local jB=K:FindFirstChild("MoneyValue")if jB and type(jB.Value)=="number"then return jB.Value end local pb=K:GetAttribute("BoardValueMoney")
if type(pb)=="number"then return pb end local pc=K:FindFirstChild("leaderstats")if pc then for JF,yU in ipairs({"Cash","Money","Coins"})do
local jC=pc:FindFirstChild(yU)if jC and type(jC.Value)=="number"then return jC.Value end end end end local function ge(yV)
local jD=yV:GetFullName()if c.plot then local jE=c.plot:GetFullName()if jD:sub(1,#jE)==jE then return jD:sub(#jE+2)end
end return jD end local function ar()local gf=K.Character if gf and gf:FindFirstChild("HumanoidRootPart")then
local pd=gf:FindFirstChildOfClass("Humanoid")if pd and pd.Health>0 then return gf end end end local function bE()
local jF=ak:FindFirstChild("Plots")if not jF then return nil end local function pe(yW)local pf=yW:FindFirstChild("Plate")
return pf~=nil and pf:FindFirstChild("EditStackAttachment",true)~=nil end local pg=K:GetAttribute("PlotNumber")
if pg~=nil then local jG=jF:FindFirstChild(tostring(pg))if jG and pe(jG)then return jG end end for JG,ph in ipairs(jF:GetChildren())do
if pe(ph)then return ph end end end local function d1(pj)local bF=pj and pj.Parent for JH=1,6 do if not bF then return nil end
if bF:IsA("BasePart")then return bF end if bF:IsA("Model")then return bF.PrimaryPart or bF:FindFirstChildWhichIsA("BasePart",true)end
bF=bF.Parent end end local function pk(pl)local jH=pl.Parent if jH and jH:IsA("Attachment")then return jH.WorldPosition end
local pm=d1(pl)return pm and pm.Position end local function pn()local c2=c.plot and c.plot:FindFirstChild("Plate")
if not c2 then return nil end if c2:IsA("BasePart")then return c2 .Position end if c2:IsA("Model")then return c2:GetPivot().Position end
local po=c2:FindFirstChildWhichIsA("BasePart",true)return po and po.Position end local function pp()local jI={}
local pq=c.plot and c.plot:FindFirstChild("WaxStations")if pq then for JI,yX in ipairs(pq:GetChildren())do local ps=yX:FindFirstChild("SquishyPlaceHolder")
local jJ=ps and ps:FindFirstChild("PlacePrompt")if jJ and jJ:IsA("ProximityPrompt")then jI[#jI+1]=jJ end end end
return jI end local function gg()local pt,jK=pp(),0 for JJ,yY in ipairs(pt)do if yY.Enabled then jK=jK+1 end end
local jL=#pt local jM=K:GetAttribute("WaxStations")if type(jM)=="number"and jM>jL then jL=jM end return jK,jL
end local function yZ()local pu=ar()local pv=pu and pu.HumanoidRootPart.Position local jN,pw for JK,jO in ipairs(pp())do
if jO.Enabled then local px=pk(jO)local py=(px and pv)and(px-pv).Magnitude or 1e9 if not jN or py<pw then jN,pw=jO,py end
end end return jN end local function pz()local gh=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not gh then return nil end local pA=gh:FindFirstChild("BuyPromptAttachment")local gi=(pA and pA:FindFirstChild("BuyPrompt"))or gh:FindFirstChild("BuyPrompt",true)
if gi and gi:IsA("ProximityPrompt")and gi:IsDescendantOf(gh)then return gi end end local pB={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local y0={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local al={order={},price={},dirty=false}local M={seen={},at=0,boxes={},built=0}local ae={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jP="SAB_order.txt"local function gj()if not al.dirty or type(writefile)~="function"then return end local aG={}
for y1,y2 in pairs(al.price)do aG[#aG+1]="P|"..y1 .."|"..string.format("%.0f",y2)end for y3,y4 in pairs(al.order)do aG[#aG+1]="O|"..y3 .."|"..table.concat(y4,",")end
if j.learned and j.enc then aG[#aG+1]="M|mode|"..tostring(j.learned.mode or"")for y5,gk in ipairs(j.learned.seq)do
local pC={}for pD=1,gk.n do pC[pD]=j.enc(gk.args[pD])end aG[#aG+1]=("A|%d|%s|%d|%s"):format(y5,gk.m,gk.n,table.concat(pC,";"))
end end local function jQ(y6,y7,gl)local pE={}for pF=1,gl.n do pE[pF]=j.enc(gl.args[pF])end aG[#aG+1]=("R|%d|%s|%s|%d|%s"):format(y7,y6,gl.m,gl.n,table.concat(pE,";"))
end if j.enc then for y8,y9 in ipairs(E.rec.rules)do jQ("rules",y8,y9)end if E.rec.on then jQ("on",0,E.rec.on)end
if E.rec.off then jQ("off",0,E.rec.off)end end for JL,d2 in pairs(M.seen)do aG[#aG+1]=("K|%s|%s|%s|%s"):format(d2 .name,d2 .title or"",d2 .rar or"",d2 .price and string.format("%.0f",d2 .price)or"")
end if pcall(writefile,jP,table.concat(aG,"\n"))then al.dirty=false end end local function y_()if type(isfile)~="function"or type(readfile)~="function"then return end
local za,zb=pcall(isfile,jP)if not(za and zb)then return end local zc,pG=pcall(readfile,jP)if not(zc and type(pG)=="string")then return end
for zd in pG:gmatch("[^\n]+")do local c3,c4,bk=zd:match("^(%a)|([^|]+)|(.*)$")if c3=="P"then al.price[c4]=tonumber(bk)
elseif c3=="M"then j.loadMode=(bk~=""and bk~="nil")and bk or nil elseif c3=="A"and j.dec then local pH=tonumber(c4)
local pI,gm,ze=bk:match("^([^|]+)|(%d+)|(.*)$")if pH and pI then gm=tonumber(gm)local pJ,gn={},0 for zf in(ze..";"):gmatch("([^;]*);")do
gn=gn+1 if gn<=gm then pJ[gn]=j.dec(zf)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pH]={m=pI,n=gm,args=pJ}end elseif c3=="R"and j.dec then
local pK=tonumber(c4)local go,zg,gp,zh=bk:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pK and go then gp=tonumber(gp)
local pL,gq={},0 for zi in(zh..";"):gmatch("([^;]*);")do gq=gq+1 if gq<=gp then pL[gq]=j.dec(zi)end end local jR={m=zg,n=gp,args=pL}
if go=="rules"then E.rec.rules[pK]=jR elseif go=="on"then E.rec.on=jR elseif go=="off"then E.rec.off=jR end end
elseif c3=="K"then local pM,pN,zj=bk:match("^([^|]*)|([^|]*)|(.*)$")M.seen[M.key(c4)]={name=c4,title=pM~=""and pM or nil,
rar=pN~=""and pN or nil,price=tonumber(zj)}elseif c3=="O"and bk~=""then local gr={}for zk in bk:gmatch("[^,]+")do gr[#gr+1]=zk end
if#gr>0 then al.order[c4]=gr end end end end local function zl(gs)if type(gs)~="table"then return end local cd,pO=gs.rarity,gs.contents
if type(cd)~="string"or cd==""or type(pO)~="table"then return end local d3={}for JM,gt in ipairs(pO)do if type(gt)=="table"and type(gt.butter)=="string"then
d3[#d3+1]={n=gt.butter,ch=tonumber(gt.chance)or 0}end end if#d3==0 then return end table.sort(d3,function(zm,zn)return zm.ch>zn.ch end)
local d4,d5={},false for zo,zp in ipairs(d3)do d4[zo]=zp.n end local jS=al.order[cd]if not jS or#jS~=#d4 then d5=true end
if not d5 then for pP=1,#d4 do if jS[pP]~=d4[pP]then d5=true break end end end al.order[cd]=d4 local jT=tonumber(gs.price)
if jT and al.price[cd]~=jT then al.price[cd]=jT d5=true end if d5 then al.dirty=true ae.at=0 D("learned the "..cd.." order from its crate")
end end local function c5(zq,zr)local zs=zq:FindFirstChild(zr,true)local zt,jU=pcall(function()return zs.Text end)
return(zt and type(jU)=="string"and jU~="")and jU or nil end local function am(pQ)return ae.pretty[pQ]or pQ end
M.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function M.key(zu)return gc(zu or"")end
function M.learn(bl)if type(bl)~="table"or type(bl.name)~="string"then return end local jV=M.key(bl.name)local bm=M.seen[jV]or{}
local zv=(M.seen[jV]==nil)or(tonumber(bl.price)and bm.price~=tonumber(bl.price))bm.name,bm.title=bl.name,bl.title or bm.title
bm.rar,bm.price=bl.rarity or bm.rar,tonumber(bl.price)or bm.price M.seen[jV]=bm if zv then M.at,al.dirty=z(),true end
end function M.wanted(pR)if pR==nil then return false end local jW=M.key(pR)return e.CrateTicks[jW]==true or(e.BestCrate and q.bestCrate~=nil and(jW==q.bestCrate or jW==q.bestCrateTitle))
end function M.list()local c6={}for zw,gu in ipairs(M.base)do c6[M.key(gu[1])]={name=gu[1],title=gu[2],rar=gu[3],i=zw}end
for JN,d6 in ipairs(ae.rarOrder)do local pS=false for JO,zx in pairs(c6)do if zx.rar==d6 then pS=true break end end
if not pS and d6~="?"then local pT=d6:gsub("[^%w]","").."Crate"c6[M.key(pT)]={name=pT,title=d6 .." Crate",rar=d6,i=50,guess=true}
end end for pU,gv in pairs(M.seen)do local a8=c6[pU]or{i=100}a8 .name,a8 .title,a8 .rar=gv.name or a8 .name,gv.title or a8 .title,gv.rar or a8 .rar
a8 .price,a8 .guess=gv.price or a8 .price,nil c6[pU]=a8 end local d7,gw={},{}for zy,zz in ipairs(pB)do d7[zz]=zy end
for zA,pV in ipairs(ae.rarOrder)do d7[pV]=d7[pV]or(20+zA)end for zB,d8 in pairs(c6)do d8 .k=zB d8 .price=d8 .price or al.price[d8 .rar or""]
gw[#gw+1]=d8 end table.sort(gw,function(ce,cf)if ce.price and cf.price and ce.price~=cf.price then return ce.price<cf.price end
local pW,pX=d7[ce.rar or""]or 99,d7[cf.rar or""]or 99 if pW~=pX then return pW<pX end if(ce.i or 100)~=(cf.i or 100)then return(ce.i or 100)<(cf.i or 100)end
return ce.k<cf.k end)return gw end local function zC()local pY=ag:FindFirstChild("Assets")local pZ=pY and pY:FindFirstChild("Squishies")
if not pZ then return false end local jX,p0,c7={},{},{}local gx=0 for JP,gy in ipairs(pZ:GetChildren())do local d9=ab(gy.Name)
if d9~=""and not jX[d9]then local gz=c5(gy,"RarityText")or"?"jX[d9]=gz p0[d9]=c5(gy,"NameText")or gy.Name c7[gz]=c7[gz]or{}
table.insert(c7[gz],d9)gx=gx+1 end end if gx==0 then return false end for p1,zD in pairs(c7)do local p2=al.order[p1]or y0[p1]
local jY={}if p2 then for zE,zF in ipairs(p2)do jY[ab(zF)]=zE end end table.sort(zD,function(p3,p4)local jZ,j0=jY[p3],jY[p4]
if jZ and j0 then return jZ<j0 end if jZ then return true end if j0 then return false end return am(p3)<am(p4)
end)end local j1={}for zG,zH in ipairs(pB)do j1[zH]=zG end local gA,cg={},{}for zI in pairs(c7)do gA[#gA+1]=zI end
pcall(function()for zJ,zK in ipairs(require(ag.Modules.SquishyRNG).Keys)do cg[zK]=zJ end end)table.sort(gA,function(c8,c9)
if cg[c8]and cg[c9]and cg[c8]~=cg[c9]then return cg[c8]<cg[c9]end local j2,j3=al.price[c8],al.price[c9]if j2 and j3 and j2~=j3 then return j2<j3 end
local j4,j5=j1[c8],j1[c9]if j4 and j5 then return j4<j5 end if j4 then return true end if j5 then return false end
return c8<c9 end)ae.rar,ae.pretty,ae.members,ae.rarOrder,ae.n,ae.at=jX,p0,c7,gA,gx,z()return true end local function j6()
if ae.at==0 or(z()-ae.at)>120 then pcall(zC)end return ae.n>0 end local function zL(zM)local p5=ab(zM)return ae.rar[p5]or(aa.name and ab(aa.name)==p5 and aa.rar)or"?"
end local function zN()local gB={}local zO=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for zP,zQ in pairs(zO)do if zQ then gB[#gB+1]=am(zP)end end
table.sort(gB)return gB end local ao={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function p6()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gC(p7)if type(makefolder)~="function"then return end local zR,zS=pcall(isfolder,p7)if not(zR and zS)then pcall(makefolder,p7)end
end local function gD(p8)if type(isfile)~="function"or type(readfile)~="function"then return nil end local zT,zU=pcall(isfile,p8)
if not(zT and zU)then return nil end local zV,zW=pcall(readfile,p8)return zV and zW or nil end local function d_(zX,zY)
if type(writefile)~="function"then return false end return(pcall(writefile,zX,zY))end local function p9(zZ)local ea={}
if type(listfiles)~="function"then return ea end local z0,p_=pcall(listfiles,zZ)if not z0 or type(p_)~="table"then return ea end
for JQ,z1 in ipairs(p_)do ea[#ea+1]=tostring(z1)end return ea end local function qa()local gE={}for JR,z2 in ipairs(p9(ao.cfg))do
local qb=z2:match("([^/\\]+)%.txt$")if qb then gE[#gE+1]=qb end end table.sort(gE)return gE end local function z3()
local ac={"V|1"}ac[#ac+1]="N|Every|"..tostring(e.Every)ac[#ac+1]="N|GlazeLead|"..tostring(e.GlazeLead)ac[#ac+1]="N|FpsCap|"..tostring(e.FpsCap)
ac[#ac+1]="N|MemLimit|"..tostring(e.MemLimit)ac[#ac+1]="N|Best|"..tostring(e.Best or 0)for JS,qc in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ac[#ac+1]="S|"..qc.."|"..e[qc]end
do local gF={}for z4,gG in pairs(e.Pets)do local qe=(gG.b and"b"or"")..(gG.g and"g"or"")..(gG.w and"w"or"")..(tonumber(gG.f)==-1 and"k"or"")
if qe~=""then gF[#gF+1]=z4 .."|"..qe end end table.sort(gF)ac[#ac+1]="P|-"for JT,z5 in ipairs(gF)do ac[#ac+1]="P|"..z5 end
end for JU,qf in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
ac[#ac+1]="B|"..qf.."|"..(e[qf]and"1"or"0")end local j7=K:GetAttribute("AutoRollRules")if type(j7)=="string"and j7~=""then e.ARrules,e.ARstop=j7,tostring(K:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then ac[#ac+1]="S|rules|"..e.ARrules ac[#ac+1]="S|stop|"..e.ARstop end if c.winPos then ac[#ac+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ac[#ac+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for JV,j8 in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gH={}for z6,z7 in pairs(j8[2])do if z7 then gH[#gH+1]=z6 end end table.sort(gH)ac[#ac+1]=j8[1].."|-"for JW,z8 in ipairs(gH)do ac[#ac+1]=j8[1].."|"..z8 end
end return table.concat(ac,"\n")end local function z9(j9)if type(j9)~="string"or j9==""then return false end local qg,qh,qi,qj,eb={},false,{},false,nil
for z_ in j9:gmatch("[^\n]+")do local aH,ai,aB=z_:match("^(%a)|([^|]*)|?(.*)$")if aH=="N"and ai=="Every"then local j_=tonumber(aB)
if j_ and j_>=1 then e.Every=math.floor(j_)end elseif aH=="N"and(ai=="FpsCap"or ai=="MemLimit")then local ka=tonumber(aB)
if ka and ka>=0 then e[ai]=math.floor(ka)end elseif aH=="N"and ai=="Best"then local gI=tonumber(aB)if gI and gI>=0 and gI<=4 then e.Best=math.floor(gI)end
elseif aH=="N"and ai=="GlazeLead"then local gJ=tonumber(aB)if gJ and gJ>=5 and gJ<=600 then e.GlazeLead=math.floor(gJ)end
elseif aH=="S"and(ai=="TeamNormal"or ai=="TeamFull"or ai=="TeamGlaze"or ai=="TeamWax")then e[ai]=aB elseif aH=="P"and ai~=""then
if not eb then eb={}end if ai~="-"and aB~=""then eb[ai]={b=aB:find("b",1,true)and true or nil,g=aB:find("g",1,true)and true or nil,
w=aB:find("w",1,true)and true or nil,f=aB:find("k",1,true)and-1 or nil}end elseif aH=="B"then if e[ai]~=nil then e[ai]=(aB=="1")end
elseif aH=="S"and ai=="rules"then e.ARrules=aB elseif aH=="S"and ai=="stop"then e.ARstop=aB elseif aH=="W"then
c.winPos={tonumber(ai)or 10,tonumber(aB)or 44}elseif aH=="G"then c.togPos={tonumber(ai)or 10,tonumber(aB)or 300}
elseif aH=="T"and ai~=""then if ai~="-"then qg[ai]=true end qh=true elseif aH=="K"and ai~=""then if ai~="-"then qi[ai]=true end
qj=true end end if qh then e.Targets=qg end if qj then e.CrateTicks=qi end if eb then e.Pets=eb end return true
end local function gK(c_)if not p6()then return false,"this executor cannot write files"end c_=(c_ or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c_==""then return false,"give the config a name"end gC(ao.dir)gC(ao.cfg)if not d_(ao.cfg.."/"..c_..".txt",z3())then return false,"could not write the file"end
c.config=c_ return true,c_ end local function qk(gL)local ql=gD(ao.cfg.."/"..gL..".txt")if not ql then return false,"no config called "..tostring(gL)end
if not z9(ql)then return false,"that config looks empty"end c.config=gL return true,gL end local function qm(kb)
if kb then gC(ao.dir)d_(ao.auto,kb)elseif type(delfile)=="function"then pcall(delfile,ao.auto)else d_(ao.auto,"")
end c.autoload=kb end local function Aa()if c.selfPath then return c.selfPath end local gM for JX,Ab in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ao.dir})do
for JY,qo in ipairs(p9(Ab))do local kc=qo:lower()if kc:sub(-4)==".lua"and(kc:find("sab_farm",1,true)or kc:find("sab farm",1,true))then
gM=gM or qo end end end c.selfPath=gM return gM end ao.stub=[[
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
local function Ac()if not p6()then return false,"this executor cannot write files"end gC("autoexec")if not d_(ao.exec,ao.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gN=(function()local Ad,Ae=pcall(function()return game:GetService("TeleportService")end)return Ad and Ae or nil end)()
local function qp()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local Af=queueonteleport or queue_on_teleport return(pcall(Af,ao.stub))end local function ec(Ag)if c.rejoining then return end
c.rejoining=true D("REJOIN ("..Ag..")")pcall(gj)if c.autoload then pcall(gK,c.autoload)end local Ah=qp()D(Ah and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for JZ=1,30 do if not gN then break end pcall(function()gN:Teleport(game.PlaceId,K)end)task.wait(10)
end end)end local function Ai()local Aj,qq=pcall(function()return game:GetService("GuiService")end)if Aj and qq then
pcall(function()V(qq.ErrorMessageChanged:Connect(function()if e.Rejoin then ec("roblox error message")end end))
end)end pcall(function()local qr=game:GetService("CoreGui")local qs=qr and qr:WaitForChild("RobloxPromptGui",15)
local qt=qs and qs:WaitForChild("promptOverlay",15)if qt then V(qt.ChildAdded:Connect(function(Ak)if e.Rejoin and tostring(Ak.Name):lower():find("errorprompt",1,true)then ec("disconnect prompt")end
end))end end)if gN then pcall(function()V(gN.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()ec("teleport retry")end)end
end))end)end end local function qu(Al)local qv=c.plot and c.plot:FindFirstChild(Al)if not qv then return nil,false end
for J0,kd in ipairs(qv:GetChildren())do if kd:IsA("Model")or kd:IsA("BasePart")then return kd,true end end return nil,true
end local function cj()local bG=qu("RolledSquishy")if not bG then return nil end return{model=bG,name=bG.Name,pretty=c5(bG,"NameText")or am(ab(bG.Name)),
rar=c5(bG,"RarityText")or zL(bG.Name),price=c5(bG,"PriceText")}end local function qw(ke)return type(ke)=="string"and(ae.rar[ab(ke)]~=nil or yN(ke))
end local function ad()local kf=qu("SquishyEquipped")if kf then c.carrySrc,j.heldAt="model",z()return kf.Name,kf end
local qx=K.Character if qx then for J1,ed in ipairs(qx:GetDescendants())do if(ed:IsA("Model")or ed:IsA("Tool"))and qw(ed.Name)then
c.carrySrc,j.heldAt="character",z()return ed.Name,ed end end end local gO=K:GetAttribute("SquishyEquipped")if type(gO)=="string"and gO~=""and qw(gO)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gO,nil end c.carrySrc=nil end local function J2()local J3,Am=ad()return Am end local function ck()
local ee=cj()local gP=ee and yP(ee.price)local gQ=bj()if gP and gQ and gQ<gP then return gQ,gP end if ee and type(ee.price)=="string"and ee.price:find("%d")and not gP then return gQ or 0,math.huge end
end local function cl(An)dX[#dX+1]=os.date("%H:%M:%S").." "..An if#dX>40 then table.remove(dX,1)end end local function Ao(cm,gR)
if type(cm)~="string"then return end cl(("Roll(%s,%s)"):format(cm,tostring(gR)))if cm:lower():find("crate",1,true)then
j.rolled,j.rolledAt=cm,z()return end aa.seq=aa.seq+1 aa.name,aa.at=cm,z()aa.rar=type(gR)=="string"and gR or nil
c.rolls=c.rolls+1 if aP(cm)then D(("ROLL %s [%s] = TARGET"):format(cm,tostring(gR)))end end local function Ap(cn)
if type(cn)~="table"then return end local gS=cn.butter or cn.itemName if type(gS)~="string"then return end c.gifts=c.gifts+1
aa.gift,aa.giftAt=gS,z()if type(cn.giftId)=="string"then local qy=ag:FindFirstChild("Remotes")local qz=qy and qy:FindFirstChild("GiftThanks")
if qz then pcall(function()qz:FireServer(cn.giftId)end)end end cl("Gift("..gS.." from "..tostring(cn.fromName)..")")
D(("GIFT from %s: %s - it will not be waxed"):format(tostring(cn.fromName),gS))end local function Aq()local qA=ag:WaitForChild("Remotes",30)
if not c.alive then return end if not qA then D("Remotes folder missing - no roll events")return end V(K:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local qB=K:GetAttribute("SquishyEquipped")if type(qB)=="string"and qB~=""then j.heldAt=z()end end))local Aw={
SquishyRollAnimation=Ao,InitSquishy=function(qC)aa.init,aa.initAt=tostring(qC),z()cl("Init("..tostring(qC)..")")end,
CrateUpdate=function(da,qD)pcall(zl,da)pcall(M.learn,da)if type(da)=="table"then local Ar=qD==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not Ar then return end local As=not j.waiting local At=j.on j.waiting,j.data,j.at=true,da,z()j.on=(qD==true)
j.title=tostring(da.title or da.name or"crate")if j.on and not At then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cl("CrateWindow open("..j.title..")")elseif As then cl("Crate waiting("..j.title..")")D(j.title.." is waiting on your stand")
end else if j.waiting then cl("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local Au=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,Au)end if j.classify then local Av=z()
task.spawn(function()pcall(j.classify,Av)end)end end end,GiftReceived=Ap,}for gT,Ax in pairs(Aw)do local kg=qA:FindFirstChild(gT)
if kg and kg:IsA("RemoteEvent")then V(kg.OnClientEvent:Connect(Ax))elseif gT~="CrateUpdate"and gT~="GiftReceived"then D("remote "..gT.." missing")end
end end local function kh()local co=cj()if co then if aP(co.name)then return{state="match",shown=co.pretty,src="pad",info=co}
end return{state="skip",info=co,level="idle",text=("on pad: %s [%s] - not ticked"):format(co.pretty,tostring(co.rar))}
end if aa.name and(z()-aa.at)<4 then if aP(aa.name)then return{state="match",shown=am(ab(aa.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(am(ab(aa.name)),tostring(aa.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gU(Ay,Az,AA,AB)
local gV=RaycastParams.new()gV.FilterType=Enum.RaycastFilterType.Exclude local ki={K.Character}for J4,AC in ipairs(AB or{})do ki[#ki+1]=AC end
gV.FilterDescendantsInstances=ki pcall(function()gV.RespectCanCollide=true end)local qE=ak:Raycast(Vector3 .new(Ay,Az+4,AA),Vector3 .new(0,-30,0),gV)
return qE and qE.Position or nil end local function db(qF)local qG=qF:FindFirstChildOfClass("Humanoid")return((qG and qG.HipHeight)or 2)+qF.HumanoidRootPart.Size.Y/2+0.2
end local function kj(AD,AE)local kk=AD:FindFirstChildOfClass("Humanoid")local AF=z()while z()-AF<AE do if kk and(kk.FloorMaterial~=Enum.Material.Air or kk.SeatPart)then return true end
ah(0.05)end return false end local function aE(AG,kl,km)local qH=AG.HumanoidRootPart qH.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qH.CFrame=km and CFrame.new(kl,Vector3 .new(km.X,kl.Y,km.Z))or CFrame.new(kl)end local function cp(bn,qI)local cq=ar()
if not cq or not bn then return false end local bH=bn.Position local gW=math.clamp(math.max(bn.Size.X,bn.Size.Z)/2+2.2,3,7)
local qJ=(qI and qI.MaxActivationDistance)or 10 if gW>qJ-2 then gW=math.max(2.5,qJ-2)end local ef={}local function cr(eg)
eg=Vector3 .new(eg.X,0,eg.Z)if eg.Magnitude>0.05 then ef[#ef+1]=eg.Unit end end local qK=pn()if qK then cr(qK-bH)end
cr(bn.CFrame.LookVector)cr(-bn.CFrame.LookVector)cr(bn.CFrame.RightVector)cr(-bn.CFrame.RightVector)cr(cq.HumanoidRootPart.Position-bH)
if#ef==0 then cr(Vector3 .new(0,0,1))end local AH,gX=db(cq),false for J5,AI in ipairs(ef)do local gY=bH+AI*gW
local kn=gU(gY.X,bH.Y,gY.Z,{bn})if kn and math.abs(kn.Y-bH.Y)<14 then aE(cq,Vector3 .new(gY.X,kn.Y+AH,gY.Z),bH)
if kj(cq,0.7)then gX=true break end end end if not gX then aE(cq,bH+ef[1]*gW+Vector3 .new(0,3,0),bH)gX=kj(cq,1)
end ah(0.12)return gX end local function qL(eh)if not eh.Parent or not eh.Enabled then return false end pcall(function()eh:InputHoldBegin()end)
ah(math.max(eh.HoldDuration,0)+0.08)pcall(function()eh:InputHoldEnd()end)return true end local function ap(qM,AJ)
local AK=z()while z()-AK<AJ do if qM()then return true end ah(0.05)end return qM()end local function ei(dc,AL,qN,AM)
local AN=c.zapFirst and{"zap","hold"}or{"hold","zap"}for AO,ko in ipairs(AN)do if AO==2 and(AM or not(dc.Parent and dc.Enabled and(not qN or qN())))then break end
local kp if ko=="hold"then kp=qL(dc)else kp=type(fireproximityprompt)=="function"and dc.Parent~=nil and dc.Enabled and pcall(fireproximityprompt,dc)end
if kp and ap(AL,1.2)then c.zapFirst=(ko=="zap")return true,ko end end return false end local function qO(kq)local bI=pz()
if not bI or not bI.Enabled then D("buy: nothing on the pad")return false end do local qP,qQ=ck()if qP then c.cashFails=(c.cashFails or 0)+1
c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("not buying: have $%s, price %s"):format(av(qP),qQ==math.huge and"unreadable"or("$"..av(qQ))))
return false end end local kr=d1(bI)if not kr then D("buy: pad part missing")return false end c.lastBuyAt=z()
local AP,qR=aa.seq,bj()local qS=ar()local AQ=qS and(qS.HumanoidRootPart.Position-kr.Position).Magnitude>12 cp(kr,bI)
if AQ then ah(0.4)end if not bI.Enabled then D("buy aborted: pad emptied")return false end local dd=kh()if not kq and dd.state~="match"then
D("buy aborted: "..(dd.text or"pad changed"))c.matchSince=nil return false end local ks=dd.info and dd.info.name or(dd.state=="match"and aa.name)or nil
local function AS()return bI.Enabled and ad()==nil and(kq or kh().state=="match")end local AT,AU=ei(bI,function()
return ad()~=nil or((not bI.Enabled)and(kq or aa.seq==AP))end,AS,ck()~=nil)if AT then ap(function()return ad()~=nil end,0.8)
local ej=ad()local qT=bj()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0 c.matchSince=nil aa.name,aa.rar,aa.at=nil,nil,z()
D(("BOUGHT %s%s via %s"):format(ej and am(ab(ej))or(dd.shown or"?"),(qR and qT)and(" for $"..av(qR-qT))or"",AU))
if ej and ks and ab(ej)~=ab(ks)then D(("note: picked up %s, not %s"):format(ej,ks))end return true end local gZ=cj()
if ck()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("BUY REFUSED: cash short - have $%s, price %s"):format(av(bj()),(gZ and gZ.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)D(("buy did not go through (%s, try %d) - again in %ds"):format(gZ and gZ.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qU()local ek=ad()if not ek then c.holding=false D("place: hands are empty")
return false end if not aP(ek)then D(("REFUSED TO WAX %s - it is not ticked"):format(am(ab(ek))))return false
end for J6=1,e.PlaceTries do local bJ=yZ()if not bJ then D("place: no free station")break end local qV=d1(bJ)
if qV then cp(qV,bJ)local qW=ad()if not qW then c.holding=false D("place: hands emptied on the way")return false end
if not aP(qW)then D("place: what I carry changed, not waxing it")return false end if bJ.Enabled then local AV,AW=ei(bJ,function()return not bJ.Enabled end,function()return bJ.Enabled end)
if AV then c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 aa.name,aa.rar,aa.at=nil,nil,z()
D(("WAXED %s #%d at %s via %s"):format(am(ab(ek)),c.placed,bJ.Parent.Parent.Name,AW))if q.placed then pcall(q.placed,ek)end
return true end end end ah(0.25)end c.placeFails=c.placeFails+1 if ad()==nil then c.holding=false end D("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ad()))D(c.capMsg)end return false end function A.place()local AX=z()while c.alive and A.editing and z()-AX<25 do ah(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local AY=z()while c.alive and A.current()~=e.TeamWax and z()-AY<5 do ah(0.1)end
if A.current()==e.TeamWax then ah(0.3)else D("wax team did not come on in time - placing anyway")end end local AZ,qX=pcall(qU)
A.placing=false if not AZ then error(qX,0)end return qX end local function qY(qZ)return type(qZ)=="string"and qZ:lower():find("crate",1,true)~=nil
end local A0={SABFarmGui=1,SABToggle=1,SABError=1}local function kt(A1)local bK=A1 while bK do if A0[bK.Name]then return false end
if bK:IsA("ScreenGui")then local A2,A3=pcall(function()return bK.Enabled end)return(not A2)or A3~=false end if bK:IsA("GuiObject")and not bK.Visible then return false end
bK=bK.Parent end return false end local function g0(g1)local de=""pcall(function()if g1:IsA("TextButton")then de=g1 .Text end end)
if not de:find("%a")then for J7,g2 in ipairs(g1:GetDescendants())do if(g2:IsA("TextLabel")or g2:IsA("TextButton"))and g2 .Text:find("%a")then de=g2 .Text break end
end end if not de:find("%a")then de=g1 .Name end return(de:lower():gsub("[^%a]",""))end local function A4()local el,em
local q0=K:FindFirstChildOfClass("PlayerGui")if not q0 then return nil,nil end for J8,en in ipairs(q0:GetDescendants())do
if en:IsA("GuiButton")and kt(en)then local ku=g0(en)if ku:sub(1,4)=="open"and not ku:find("shop",1,true)then el=el or en end
if ku:sub(1,7)=="discard"then em=em or en end end end if el and em then return el,em end if j.on then return el,em end
return nil,nil end local kv=(function()local A5,A6=pcall(function()return game:GetService("VirtualInputManager")end)return A5 and A6 or nil end)()
local function q1(bo,kw)local kx={}local function q2(A7)kx[#kx+1]=A7 end if c.tapWay then q2(c.tapWay)end for J9,q3 in ipairs({"touch","conn","signal"})do
if q3~=c.tapWay then q2(q3)end end local function q4(A8,...)local A9,ky=pcall(getconnections,A8)if not(A9 and type(ky)=="table"and#ky>0)then return false end
local q5,A_,Ba=false,{...},select("#",...)for J_,Bb in ipairs(ky)do if pcall(function()Bb:Fire(table.unpack(A_,1,Ba))end)then q5=true end
end return q5 end local function q6()local q7=Vector3 .new(0,0,0)pcall(function()local q8,q9=bo.AbsolutePosition,bo.AbsoluteSize
q7=Vector3 .new(q8 .X+q9 .X/2,q8 .Y+q9 .Y/2,0)end)local kz={Position=q7,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kz.UserInputType=Enum.UserInputType.Touch end)pcall(function()kz.UserInputState=Enum.UserInputState.End end)
return kz end for Ka,bp in ipairs(kx)do local eo=false if bp=="conn"and type(getconnections)=="function"then if q4(bo.MouseButton1Click)then
eo=true if ap(kw,1.5)then c.tapWay=bp return true,bp end end eo=q4(bo.Activated,q6(),1)elseif bp=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bo.MouseButton1Click)then if ap(kw,1.5)then c.tapWay=bp return true,bp end end eo=pcall(firesignal,bo.Activated,q6(),1)
elseif bp=="touch"and kv then eo=pcall(function()local q_,ra=bo.AbsolutePosition,bo.AbsoluteSize local rb=0 local rc=bo:FindFirstAncestorWhichIsA("ScreenGui")
local Bc,Bd=pcall(function()return rc and rc.IgnoreGuiInset end)if not(Bc and Bd)then pcall(function()rb=game:GetService("GuiService"):GetGuiInset().Y end)
end local rd,rf=q_.X+ra.X/2,q_.Y+ra.Y/2+rb kv:SendMouseButtonEvent(rd,rf,0,true,game,1)task.wait(0.06)kv:SendMouseButtonEvent(rd,rf,0,false,game,1)
end)end if eo and ap(kw,1.5)then c.tapWay=bp return true,bp end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kA(rg)local ep=rg.Parent while ep and ep~=c.plot do if j.NOT[ep.Name]then return false end ep=ep.Parent
end local kB=(rg.ActionText or""):lower()if kB:find("roll",1,true)or kB:find("place",1,true)or kB:find("sell",1,true)then return false end
return true end local function rh()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local ri=c.plot:FindFirstChild("CrateStand")local eq if ri then for Kb,g3 in ipairs(ri:GetDescendants())do
if g3:IsA("ProximityPrompt")and g3 .Enabled and kA(g3)then eq=g3 break end end end if not eq then for Kc,bL in ipairs(c.plot:GetDescendants())do
if bL:IsA("ProximityPrompt")and bL.Enabled and kA(bL)then local rj=bL:FindFirstAncestorWhichIsA("Model")local Be=((bL.ActionText or"").." "..(bL.ObjectText or"").." "..bL.Name.." "..(rj and rj.Name or"")):lower()
if Be:find("crate",1,true)then eq=bL break end end end end j.prompt=eq return eq end local function kC()if j.on then return true end
local er=rh()if not er then j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local rk=d1(er)if rk then cp(rk,er)end j.ours=true ei(er,function()return j.on end)if ap(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: pressed "..ge(er).." but no window came up")
return false end do local function Bf(rl)local df=rl.Parent while df and df:IsA("GuiObject")do local rm,rn=false,false
for Kd,es in ipairs(df:GetDescendants())do if es~=rl and es:IsA("GuiButton")and g0(es):sub(1,7)=="discard"then rm=true end
if es:IsA("TextLabel")then local kD=es.Text:lower()if kD:find("crate",1,true)or kD:find("can contain",1,true)or kD:find("cost",1,true)then rn=true end
end if rm and rn then return df end end df=df.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local ro=K:FindFirstChildOfClass("PlayerGui")if not ro then return nil end for Ke,g4 in ipairs(ro:GetDescendants())do
if g4:IsA("GuiButton")and not g4:FindFirstAncestor("SABFarmGui")and g0(g4):sub(1,4)=="open"then local kE=Bf(g4)
if kE then j.win=kE return kE end end end end local function Bg(Bh)for Kf,g5 in ipairs(Bh:GetDescendants())do
if g5:IsA("GuiButton")then local rp,kF=g0(g5),g5 .Name:lower()if rp=="x"or rp=="close"or kF=="x"or kF:find("close",1,true)or kF:find("exit",1,true)then return g5 end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(Bi)task.wait(Bi and 4 or 1.2)if j.on or j.waiting then return end
local g6=j.findWin()if not g6 or not kt(g6)then return end local rq=Bg(g6)if rq and q1(rq,function()return not kt(g6)end)then return end
D("the crate window is still open - tap its X")end end local function et(g7)if not kC()then return false end local rr=z()-(j.openedAt or 0)
if rr<0.6 then ah(0.6-rr)end local kG=j.title local Bj,Bk=A4()local rs=g7 and Bj or Bk if not rs then j.lastFail=z()
c.crateFails=c.crateFails+1 D(("crate: no %s button found in %s"):format(g7 and"Open"or"Discard",kG))return false
end local Bl=ad()local Bm,Kg=q1(rs,function()return(not j.on)or(ad()~=nil and ad()~=Bl)end)if not Bm then j.lastFail=z()
c.crateFails=c.crateFails+1 D("crate: could not press "..(g7 and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if g7 then c.crates=c.crates+1 ap(function()return ad()~=nil end,1.5)local rt=ad()
D(("OPENED %s -> %s"):format(kG,rt and am(ab(rt))or"?"))else D("discarded "..kG.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(Bn,...)local Bo=select("#",...)j.calls[#j.calls+1]={t=z(),m=Bn,n=Bo,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aI,bq)local bM=type(aI)if(bM=="string"or bM=="number")and type(bq.data)=="table"then for ru,kH in pairs(bq.data)do
if kH==aI and type(ru)=="string"and(type(kH)=="string"or type(kH)=="number")then return{__slot="f:"..ru}end end
end if bM=="string"then if bq.crate and aI==bq.crate then return{__slot="crate"}end if bq.title and aI==bq.title then return{__slot="title"}end
if bq.rar and aI==bq.rar then return{__slot="rarity"}end return aI end if bM=="number"or bM=="boolean"or bM=="nil"then return aI end
if bM=="table"then local rv={}for Bp,rw in pairs(aI)do if type(rw)=="table"then return nil,"nested table"end local Bq,rx=j.slot(rw,bq)
if rx then return nil,rx end rv[Bp]=Bq end return rv end local Br,Bs=pcall(function()return aI:IsA("Instance")end)
if Br and Bs then if aI==K then return{__slot="player"}end if c.plot and aI==c.plot then return{__slot="plot"}end
local g8=c.plot and c.plot:FindFirstChild("CrateStand")if g8 and aI==g8 then return{__slot="stand"}end if g8 and aI.Parent==g8 then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bM..")"end function j.resolve(g9)if type(g9)~="table"then return g9 end
local aX=g9 .__slot if aX and aX:sub(1,2)=="f:"then return j.data and j.data[aX:sub(3)]end if aX=="crate"then return j.data and j.data.name end
if aX=="title"then return(j.data and j.data.title)or j.title end if aX=="rarity"then return j.data and j.data.rarity end
if aX=="player"then return K end if aX=="plot"then return c.plot end if aX=="stand"or aX=="model"then local kI=c.plot and c.plot:FindFirstChild("CrateStand")
if aX=="stand"or not kI then return kI end for Kh,ry in ipairs(kI:GetChildren())do if qY(ry.Name)then return ry end end
return nil end local rz={}for Bt,Bu in pairs(g9)do rz[Bt]=j.resolve(Bu)end return rz end function j.classify(kJ)
if j.directOff then return end local g_={}for Ki,kK in ipairs(j.calls)do if kK.t<=kJ+0.05 and kJ-kK.t<=6 then g_[#g_+1]=kK end
end if#g_==0 then return end if not ap(function()return(j.heldAt or 0)>=kJ-1 end,2.5)then return end local eu={}
for Kj,ev in ipairs(g_)do local rA={}for rB=1,ev.n do local Bv,rC=j.slot(ev.args[rB],ev)if rC then D("crate call has "..rC.." - keeping the button method")
return end rA[rB]=Bv end eu[#eu+1]={m=ev.m,n=ev.n,args=rA}end local kL=j.learned j.learned={seq=eu,mode=kL and kL.mode or nil}
al.dirty=true if not kL then D(("learned how to open crates directly (%d call%s)"):format(#eu,#eu==1 and""or"s"))end
end function j.replay()local rD=j.learned local rE=ag:FindFirstChild("Remotes")local kM=rE and rE:FindFirstChild("CrateAction")
if not(rD and kM)then return false end local rF=table.unpack or unpack j.replaying=true for Kk,ew in ipairs(rD.seq)do
local kN={}for rG=1,ew.n do kN[rG]=j.resolve(ew.args[rG])end task.spawn(function()pcall(function()if ew.m=="InvokeServer"then kM:InvokeServer(rF(kN,1,ew.n))
else kM:FireServer(rF(kN,1,ew.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(Bw)return(Bw:gsub("[%%|;=,\n]",function(Bx)return("%%%02X"):format(Bx:byte())end))end
function j.enc(cs)local ha=type(cs)if ha=="string"then return"s"..j.esc(cs)end if ha=="number"then return"n"..tostring(cs)end
if ha=="boolean"then return cs and"b1"or"b0"end if ha=="nil"then return"z"end if cs.__slot then return"k"..cs.__slot end
local kO={}for By,Bz in pairs(cs)do kO[#kO+1]=j.enc(By).."="..j.enc(Bz)end return"t"..table.concat(kO,",")end
function j.dec(rH)local ex,ey=rH:sub(1,1),rH:sub(2)local function BA(BB)return(BB:gsub("%%(%x%x)",function(BC)return string.char(tonumber(BC,16))end))end
if ex=="s"then return BA(ey)end if ex=="n"then return tonumber(ey)end if ex=="b"then return ey=="1"end if ex=="k"then return{__slot=ey}end
if ex=="t"then local rI={}for BD in ey:gmatch("[^,]+")do local rJ,BE=BD:match("^(.-)=(.*)$")if rJ then local rK=j.dec(rJ)
if rK~=nil then rI[rK]=j.dec(BE)end end end return rI end return nil end function j.goneOrNew(BF)return function()
if not j.waiting then return true end local rL=ad()return rL~=nil and rL~=BF end end function j.near()local rM=ag:FindFirstChild("Remotes")
local kP=rM and rM:FindFirstChild("CrateAction")local hb=ar()local kQ=c.plot and c.plot:FindFirstChild("CrateStand")
local kR=kQ and kQ:FindFirstChild("Spot")if not(kP and hb and kR)then D(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kP and"no CrateAction remote"or not hb and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kS=hb.HumanoidRootPart local hc=kS.CFrame local rN,kT=j.title,"no answer"local BG=ad()local rO=kQ:FindFirstChild("Holder")
local function rP()if not rO then return j.waiting or j.on end for Kl,BH in ipairs(rO:GetChildren())do if BH:IsA("Model")then return true end end
return false end for BI=1,3 do if not(j.waiting or j.on)or not rP()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kS.Position-kR.Position).Magnitude>8 then cp(kR,j.prompt)end ah(0.12+0.15*BI)
local a9={}j.replaying=true task.spawn(function()a9 .ok,a9 .v=pcall(function()return kP:InvokeServer("open")end)
a9 .done=true end)ap(function()return a9 .done end,6)j.replaying=false local ct=a9 .v if a9 .done and a9 .ok and type(ct)=="table"and ct.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 D(("OPENED %s -> %s (no window)"):format(rN,ct.prize and am(ab(tostring(ct.prize)))or"?"))
ap(function()local rQ=ad()return rQ~=nil and rQ~=BG end,1.5)if(kS.Position-hc.Position).Magnitude>8 then pcall(function()aE(hb,hc.Position,hc.Position+hc.LookVector)end)end
return true,"opened"end kT=(a9 .done and a9 .ok and type(ct)=="table")and tostring(ct.reason or"refused, no reason given")
or(a9 .done and("error: "..tostring(ct))or"no answer in 6s")ah(0.3)if not rP()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 D(("crate: the server would not open %s next to the stand (%s)"):format(rN,kT))
return false,kT end j.GIVEUP=600 function j.drop()local rR=ag:FindFirstChild("Remotes")local rS=rR and rR:FindFirstChild("CrateAction")
local rT=c.plot and c.plot:FindFirstChild("CrateStand")local kU=rT and rT:FindFirstChild("Spot")local rU=ar()
if kU and rU and(rU.HumanoidRootPart.Position-kU.Position).Magnitude>8 then cp(kU,j.prompt)ah(0.3)end local kV,br=false,nil
if rS then kV,br=pcall(function()return rS:InvokeServer("discard")end)end D(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(kV and type(br)=="table"and br.ok)and"done"or("answer: "..tostring(type(br)=="table"and(br.reason or br.ok)or br))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(kV and type(br)=="table"and br.ok)then et(false)end end function j.smart()local kW=j.title if(j.nearFails or 0)<3 then
local BJ=j.near()if BJ then return true end if j.nearFails>=3 then D("opening next to the stand failed 3 times - trying the older ways")end
end local cu=j.learned if cu then local kX=ad()if j.on then j.replay()if ap(j.goneOrNew(kX),3.5)then c.crates=c.crates+1
D("OPENED "..kW.." (direct)")return true end else if cu.mode~="window"then j.replay()if ap(j.goneOrNew(kX),3.5)then
c.crates,j.fails=c.crates+1,0 if cu.mode~="direct"then cu.mode,al.dirty="direct",true D("crates now open directly - the window never comes up")
end D("OPENED "..kW.." (direct, no window)")return true end end if kC()then j.replay()if ap(j.goneOrNew(kX),3.5)then
c.crates,j.fails=c.crates+1,0 if cu.mode~="window"then cu.mode,al.dirty="window",true D("crates need their window up first - it shows briefly")
end D("OPENED "..kW.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,al.dirty=cu,nil,true
if j.fails>=3 then j.directOff=true D("direct crate opening failed 3 times - using the button for now")else D("the learned crate call did not work - back to pressing Open")
end end return et(true)end function E.snap()return{rules=K:GetAttribute("AutoRollRules"),stop=K:GetAttribute("AutoRollStop"),
on=K:GetAttribute("AutoRollOn"),main=K:GetAttribute("AutoRoll")}end E.cache={}function E.watchCache()E.cache=E.snap()
for BK,rV in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(K:GetAttributeChangedSignal(rV):Connect(function()E.cache[BK]=K:GetAttribute(rV)end))
end end function E.isOn()return K:GetAttribute("AutoRollOn")==true end function E.saw(BL,...)local hd=E.cache
local BM={m=BL,n=select("#",...),args={...},before={rules=hd.rules,stop=hd.stop,on=hd.on,main=hd.main}}task.delay(1.5,function()
if c.alive then pcall(E.learnOne,BM)end end)end function E.learnOne(ez)local aC,eA=E.snap(),ez.before local he=(aC.rules~=eA.rules)or(aC.stop~=eA.stop)
local rW=(aC.on~=eA.on)or(aC.main~=eA.main)if not he and not rW then return end local rX={}for rY=1,ez.n do local aQ=ez.args[rY]
local cv=type(aQ)if cv=="string"and aQ~=""and aQ==aC.rules then aQ={__slot="rules"}elseif cv=="string"and aQ~=""and he and aQ==aC.stop and aC.stop~=eA.stop then aQ={__slot="stop"}
elseif cv=="table"then local rZ={}for BN,dg in pairs(aQ)do if type(dg)=="table"or(type(dg)=="userdata")then E.msg="Auto Roll sends something I cannot repeat"return
end rZ[BN]=(type(dg)=="string"and dg~=""and dg==aC.rules)and{__slot="rules"}or dg end aQ=rZ elseif cv~="string"and cv~="number"and cv~="boolean"and cv~="nil"then
if aQ==K then aQ={__slot="player"}else E.msg="Auto Roll sends something I cannot repeat"return end end rX[rY]=aQ
end local dh={m=ez.m,n=ez.n,args=rX}if he then local kY=false for BO=1,dh.n do local eB=dh.args[BO]if type(eB)=="table"and eB.__slot=="rules"then kY=true end
if type(eB)=="table"and not eB.__slot then for Km,r0 in pairs(eB)do if type(r0)=="table"and r0 .__slot=="rules"then kY=true end end
end end if kY then E.rec.rules={dh}else table.insert(E.rec.rules,dh)if#E.rec.rules>60 then table.remove(E.rec.rules,1)end
end end if rW then if aC.on==true then E.rec.on=dh else E.rec.off=dh end e.AutoRoll=(aC.on==true)end if aC.rules and aC.rules~=""then e.ARrules,e.ARstop=aC.rules,aC.stop or""end
al.dirty=true E.msg=""D(("learned an Auto Roll %s message"):format(he and"choices"or(aC.on and"on"or"off")))end
function E.resolve(di)if type(di)~="table"then return di end if di.__slot=="rules"then return e.ARrules~=""and e.ARrules or K:GetAttribute("AutoRollRules")end
if di.__slot=="stop"then return e.ARstop~=""and e.ARstop or K:GetAttribute("AutoRollStop")end if di.__slot=="player"then return K end
local r1={}for BP,BQ in pairs(di)do r1[BP]=E.resolve(BQ)end return r1 end function E.replay(r2,BR)local r3=table.unpack or unpack
for Kn,eC in ipairs(BR)do local kZ={}for r4=1,eC.n do kZ[r4]=E.resolve(eC.args[r4])end E.replaying=true pcall(function()
if eC.m=="InvokeServer"then task.spawn(function()pcall(function()r2:InvokeServer(r3(kZ,1,eC.n))end)end)else r2:FireServer(r3(kZ,1,eC.n))end
end)E.replaying=false task.wait(0.25)end end function E.apply(r5,BS)if E.busy or not c.alive then return end E.busy=true
pcall(function()local r6=ag:FindFirstChild("Remotes")local k0=r6 and r6:FindFirstChild("AutoRollAction")if not k0 then E.msg="this game has no AutoRollAction"return end
local bN=e.AutoRoll if bN and e.ARrules~=""and K:GetAttribute("AutoRollRules")~=e.ARrules then if#E.rec.rules==0 then
E.msg="pick your Auto Roll choices once in the game's menu so I can learn them"D(E.msg)else E.replay(k0,E.rec.rules)
if ap(function()return K:GetAttribute("AutoRollRules")==e.ARrules end,4)then D("Auto Roll choices put back")else
E.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"D(E.msg)end end end if bN==E.isOn()or(not bN and not BS)then return end
local hf=bN and E.rec.on or E.rec.off if not hf then local eD=bN and E.rec.off or E.rec.on local r7=eD~=nil for BT=1,eD and eD.n or 0 do
if type(eD.args[BT])=="boolean"then r7=false end end if r7 then hf=eD end end if not hf then E.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bN and"on"or"off")
D(E.msg)return end E.replay(k0,{hf})if ap(function()return E.isOn()==bN end,4)then E.msg=""D(("Auto Roll switched %s%s"):format(bN and"ON"or"OFF",r5 and(" ("..r5 ..")")or""))
else E.msg="Auto Roll did not switch - do it once in the game so I can relearn it"D(E.msg)end end)E.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local BU,BV=pcall(function()return K.UserId end)return BU and BV or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local BW,k1=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if BW and type(k1)=="table"and type(k1 .Pets)=="table"then o.I=k1 end return o.I end function o.order()if o.list then return o.list end
local bO=o.info()if not bO then return{}end local cw={}if type(bO.Order)=="table"and#bO.Order>0 then for Ko,r8 in ipairs(bO.Order)do if bO.Pets[r8]then cw[#cw+1]=r8 end end
else for BX in pairs(bO.Pets)do cw[#cw+1]=BX end table.sort(cw,function(BY,BZ)return(bO.Pets[BY].price or 0)<(bO.Pets[BZ].price or 0)end)
end o.list=cw return cw end function o.nice(r9,k2)local r_=o.info()local sa=r_ and r_.Pets[r9]return((k2 and k2~="")and(k2 .." ")or"")..(sa and sa.displayName or tostring(r9))
end function o.data()local hg=K:GetAttribute("PetsData")if type(hg)~="string"then return nil end if hg==o.rawD then return o.lastD end
local B0,eE=pcall(function()return o.HS:JSONDecode(hg)end)eE=(B0 and type(eE)=="table")and eE or nil o.rawD,o.lastD=hg,eE
return eE end function o.pen()return ag:FindFirstChild("PetMeadowSpawns")end function o.srv()return ak:GetServerTimeNow()end
function o.money()local k3=K:FindFirstChild("MoneyValue")if k3 and type(k3 .Value)=="number"then return k3 .Value end
return bj()or 0 end function o.wishes()local sb=o.pen()local sc=sb and sb:GetAttribute("Wishes")local k4,sd={},o.srv()
if type(sc)~="string"then return k4 end local B1,se=pcall(function()return o.HS:JSONDecode(sc)end)if B1 and type(se)=="table"then
for B2,k5 in pairs(se)do if type(k5)=="number"and k5>sd then k4[B2]=k5-sd end end end return k4 end function o.call(...)
local sf=ag:FindFirstChild("Remotes")local sh=sf and sf:FindFirstChild("PetRequest")if not sh then return nil end
local sj=table.pack(...)local cx={}task.spawn(function()cx.ok,cx.v=pcall(function()return sh:InvokeServer(table.unpack(sj,1,sj.n))end)
cx.done=true end)local B3=z()while not cx.done and z()-B3<6 do task.wait(0.05)end if cx.done and cx.ok then return cx.v end
return nil end function o.want(B4)return e.Pets[B4]end function o.closeNaming(k6)local sl=pcall(function()local sk=K:FindFirstChild("PlayerScripts")
local B5=sk and sk:FindFirstChild("Naming",true)require(B5).close()end)ah(0.5)if k6 .Visible then pcall(function()local sm=k6:FindFirstChild("NameBox",true)if sm then sm:ReleaseFocus()end end)
k6 .Visible=false sl=false end return sl end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local sn=K:FindFirstChildOfClass("PlayerGui")
local so=sn and sn:FindFirstChild("MainGui")local hh=so and so:FindFirstChild("PetNameGui")if hh and hh.Visible then
ah(0.4)if hh.Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,hh)break end end ah(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local k7,sp,hi=o.info(),o.pen(),o.data()
if not(k7 and sp and hi)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local eF,k8=#(hi.pets or{}),tonumber(hi.maxOwned)or 60
local B6,sq,eG=o.srv(),{},nil for Kp,aY in ipairs(sp:GetChildren())do sq[aY.Name]=true local cy,hj=aY:GetAttribute("Pet"),aY:GetAttribute("Variant")or""
local k9=cy and o.want(cy)if k9 and k9 .b and k7 .Pets[cy]and(not k9 .g or hj=="Big")and y.wantMore(cy,hj,hi)and not aY:GetAttribute("A_"..o.uid)
and(tonumber(aY:GetAttribute("ExpiresAt"))or 0)>B6+1 and z()>=(o.tryAt[aY.Name]or 0)then local eH,sr=o.nice(cy,hj),k7 .Pets[cy].price or 0
if eF>=k8 then eG=("%s is in the pen, but you have %d/%d pets"):format(eH,eF,k8)o.tryAt[aY.Name]=z()+15 elseif o.money()<sr then
eG=("%s is in the pen - need $%s"):format(eH,av(sr))o.tryAt[aY.Name]=z()+5 else o.tryAt[aY.Name]=z()+8 local bP=o.call("adopt",aY.Name)
if type(bP)=="table"and bP.ok then eF=eF+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local B7=type(bP.pet)=="table"and bP.pet or{}
table.insert(o.recent,{id=tostring(B7 .id or("?"..z())),name=cy,variant=hj,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
D("ADOPTED "..eH)o.skipNaming()eG="adopted "..eH else local ss=type(bP)=="table"and tostring(bP.reason or"no reason given")or"no answer"
D(("adopt %s failed: %s"):format(eH,ss))eG="adopt failed: "..ss if type(bP)=="table"and bP.bagFull then o.tryAt[aY.Name]=z()+60 end
end end end end for su in pairs(o.tryAt)do if not sq[su]then o.tryAt[su]=nil end end o.buyMsg=eG or("watching the pen (%d/%d pets)"):format(eF,k8)
end function o.stacks()local sv=o.pen()local B8=sv and sv:GetAttribute("WishStacks")local B9,sx=pcall(function()return o.HS:JSONDecode(B8)end)
return(B9 and type(sx)=="table")and sx or{}end function o.stackTick(B_,Ca)local hk=o.info()local sy=(type(hk.Wish)=="table"and tonumber(hk.Wish.maxStacks))or 1
if sy<=1 then return end local Cb=o.stacks()o.stackTry=o.stackTry or{}for Kq,aZ in ipairs(o.order())do local sz=o.want(aZ)
local hl=tonumber(Cb[aZ])or 1 if sz and sz.w and B_[aZ]and hl<sy and y.wantMore(aZ,"",Ca)and z()>=(o.stackTry[aZ]or 0)then
local Cc,hm=pcall(hk.wishPrice,aZ,hl+1)hm=Cc and tonumber(hm)or((hk.Pets[aZ].price or 0)*2*3^hl)o.stackTry[aZ]=z()+5
if hm<=o.money()*0.01 then local sA=o.call("wish",aZ)if type(sA)=="table"and sA.ok then o.wishN=o.wishN+1 D(("WISH x%d on %s ($%s)"):format(hl+1,o.nice(aZ),av(hm)))
else o.stackTry[aZ]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local hn=o.info()if not(hn and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bQ,k_,bR=o.wishes(),0,nil local Cd=(type(hn.Wish)=="table"and hn.Wish.cashShare)or 2 local sB=o.data()for Kr,aF in ipairs(o.order())do
local sC=o.want(aF)if sC and sC.w and y.wantMore(aF,"",sB)then k_=k_+1 if not bQ[aF]and z()>=(o.wishTry[aF]or 0)then
local la=tonumber(K:GetAttribute("PetWishCredits"))or 0 local lb=math.floor((hn.Pets[aF].price or 0)*Cd)if la<=0 and o.money()<lb then
o.wishTry[aF]=z()+10 bR=("need $%s to wish for %s"):format(av(lb),o.nice(aF))o.wishWhy[aF]=bR else o.wishTry[aF]=z()+3
local Ce=la>0 and"wishCredit"or"wish"local ho=o.call(Ce,aF)if type(ho)=="table"and ho.ok then o.wishN,o.wishWhy[aF]=o.wishN+1,nil
D(("WISHED for %s (%s)"):format(o.nice(aF),la>0 and"free wish"or("$"..av(lb))))else local lc=type(ho)=="table"and tostring(ho.reason or"no reason given")or"no answer"
if lc:lower():find("already",1,true)then o.wishTry[aF]=z()+2 else D(("wish %s failed: %s"):format(o.nice(aF),lc))bR="wish failed: "..lc end
end end end end end pcall(o.stackTick,bQ,sB)if not bR then for Ks,hp in ipairs(o.order())do local sD=o.want(hp)
if sD and sD.w and not bQ[hp]and o.wishWhy[hp]then bR=o.wishWhy[hp]break end end end if not bR then local dj={}
for Kt,eI in ipairs(o.order())do local sE=o.want(eI)local sF=tonumber(o.stacks()[eI])or 1 if sE and sE.w and bQ[eI]then dj[#dj+1]=("%s%s %dm"):format(o.nice(eI),sF>1 and(" x"..sF)or"",math.ceil(bQ[eI]/60))end
end local hq for Ku,hr in ipairs(o.order())do local sG=o.want(hr)if sG and sG.w and bQ[hr]and(not hq or bQ[hr]<hq)then hq=bQ[hr]end
end bR=k_==0 and"no pet has WISH ticked"or(#dj==0 and"running: none yet")or(#dj<=3 and("running: "..table.concat(dj,", ")))
or("%d running, the next one ends in %dm"):format(#dj,math.ceil((hq or 0)/60))end o.wishMsg=bR end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local ld=o.data()return(ld and ld.teams)or{},ld end function A.current(dk)
dk=dk or o.data()if not dk then return""end local sH={}for Kv,Cf in ipairs(dk.equipped or{})do sH[tostring(Cf)]=true end
for Kw,sI in ipairs(dk.teams or{})do local sJ=sI.pets or{}local le=#sJ==#(dk.equipped or{})if le then for Kx,Cg in ipairs(sJ)do if not sH[tostring(Cg)]then le=false break end end end
if le then return sI.name end end return""end function A.equip(lf)local Ch,Ci=A.teams()local lg for Cj,Ck in ipairs(Ch)do if Ck.name==lf then lg=Cj break end end
if not lg then A.msg="no saved team called "..tostring(lf)return false end if A.current(Ci)==lf then return true end
for Ky=1,4 do local sK=o.call("teamEquip",lg)if type(sK)=="table"and sK.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(Cl)local sL=Cl:FindFirstChild("SquishyPlaceHolder")local sM=sL and sL:FindFirstChild("TimerGui")
local sN=sM and sM:FindFirstChildWhichIsA("TextLabel",true)local lh=sN and sN.Text if type(lh)~="string"or lh:find("-",1,true)then return nil end
local li,sO,sP=lh:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not li then return nil end local sQ=sP~=""and(tonumber(li)*3600+tonumber(sO)*60+tonumber(sP))or(tonumber(li)*60+tonumber(sO))
return sQ>0 and sQ or nil end function A.waxes()local eJ={}local sR=c.plot and c.plot:FindFirstChild("WaxStations")
if not sR then return eJ end local sS=o.srv()for Kz,a_ in ipairs(sR:GetChildren())do local lj=tonumber(a_:GetAttribute("PourEnd"))
local sT=a_:GetAttribute("PourOwner")if a_:GetAttribute("HasSquishy")and a_:GetAttribute("PourId")and(sT==nil or sT==o.uid)then
local lk=A.left(a_)local sU=lk and(sS+lk)or((lj and lj>sS)and lj or nil)if sU then local sV,sW=a_:FindFirstChild("SquishyPlaceHolder"),"?"
if sV then for KA,sX in ipairs(sV:GetChildren())do if sX:IsA("Model")then sW=sX.Name break end end end local Cm=tostring(a_:GetAttribute("Helpers")or"")
local ll=0 for KB in Cm:gmatch("%d+")do ll=ll+1 end eJ[#eJ+1]={st=a_,ends=sU,sure=lk~=nil,id=a_:GetAttribute("PourId"),name=sW,helps=ll,
long=a_:GetAttribute("PourLong")==true}end end end table.sort(eJ,function(Cn,Co)return Cn.ends<Co.ends end)return eJ
end function A.glazeCount()local sY=ag:FindFirstChild("Remotes")local sZ=sY and sY:FindFirstChild("EditStack")
if not sZ then return nil end local Cp,eK=pcall(function()return sZ:InvokeServer("State",nil)end)if not(Cp and type(eK)=="table"and type(eK.state)=="table")then return nil end
local lm,ln=0,{}for KC,hs in ipairs(eK.state.entries or{})do if hs.glaze and hs.glaze~=""then lm=lm+1 ln[hs.glaze]=(ln[hs.glaze]or 0)+1 end
end return lm,ln,#(eK.state.entries or{}),eK.state.capacity end function A.finishedOne(ht,s0)A.finished=A.finished+1
task.wait(2)local lo,Cq,s1,Cr=A.glazeCount()if lo and s0 and lo>s0 then A.glazed=A.glazed+1 local lp={}for Cs,Ct in pairs(Cq)do lp[#lp+1]=Cs.." "..Ct end
D(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(am(ab(ht.name)),ht.st.Name,lo,table.concat(lp,", ")))
else D(("wax done on station %s: %s, no glaze%s"):format(ht.st.Name,am(ab(ht.name)),s1 and(" (stack "..s1 .."/"..tostring(Cr)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cz=o.srv()local aJ=A.glazeFor if aJ then local eL=aJ.st local s2=eL.Parent and eL:GetAttribute("HasSquishy")and eL:GetAttribute("PourId")==aJ.id
local s3=s2 and A.left(eL)if s3 then aJ.ends=cz+s3 end if not s2 then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aJ.id or"?"]then
A.done[aJ.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aJ.id or"?"]=true},1 end local Cu=aJ.before
task.spawn(function()pcall(A.finishedOne,aJ,Cu)end)end elseif aJ.ends-cz>e.GlazeLead*3+60 or cz>aJ.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aJ.id or"?"]=z()+120 D(("station %s is not finishing yet (%s left) - glaze team off again"):format(eL.Name,A.clock(aJ.ends-cz)))
end end if e.TeamGlaze~=""and not A.glazeFor then local Cv=A.speedRatio(e.TeamGlaze)for KD,cA in ipairs(A.list)do
if cA.sure and(cA.ends-cz)*Cv[cA.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cA.id or"?"]or 0)and not A.done[cA.id or"?"]then
A.glazeFor=cA task.spawn(function()cA.before=A.glazeCount()end)break end end end local aK,eM="",""local dl=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cz)
if dl and dl<-8 then q.snapAt,dl=nil,nil end if e.TeamGlaze~=""and dl and dl<=20 then aK,eM=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(dl)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aK,eM=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aK,eM=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aK,eM=e.TeamFull," - every station is busy"else aK=e.TeamNormal end A.want=aK local eN=A.current()A.cur=eN if aK~=""and eN~=aK and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aK)then D("team: "..aK..eM)else A.nextTry=z()+3 end end local lq=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eN~=""and eN or"(not a saved team)",(aK~=""and aK~=eN)and(" -> "..aK)or"",
lq and("in "..A.clock(lq.ends-cz).." (st "..lq.st.Name..")")or"- none running")end function A.clock(bS)bS=math.max(0,math.floor(bS))
if bS>=3600 then return("%d:%02d:%02d"):format(math.floor(bS/3600),math.floor((bS%3600)/60),bS%60)end return("%d:%02d"):format(math.floor(bS/60),bS%60)
end function A.allBusy()local Cw,Cx=gg()return Cx>0 and Cw==0 end function A.aboutToPlace()if not c.running then return false end
local s4=ad()if not(s4 and aP(s4))then return false end local Cy=gg()return Cy>0 end function A.mult(s5,Cz,s6)return{(1+s5)*(1+s6),(1+s5+Cz)*(1+s6)}end
function A.speedNow()local function lr(CA)return tonumber(K:GetAttribute(CA))or 0 end return A.mult(lr("PetWaxSpeed"),lr("PetLongWax"),lr("PetSocialWax"))
end function A.speedOf(CB)local CC,s7=A.teams()if not s7 then return nil end for KE,s8 in ipairs(CC)do if s8 .name==CB then
local ls={}for KF,CD in ipairs(s8 .pets or{})do for KG,s9 in ipairs(s7 .pets or{})do if tostring(s9 .id)==tostring(CD)then ls[#ls+1]=s9 break end end
end local s_=y.caps()local ta,CE=y.stats(ls)return A.mult(math.min(ta.waxSpeed or 0,s_.waxSpeed or 0.25),math.min(ta.longWax or 0,s_.longWax or 0.3),CE.socialWax or 0)
end end return nil end function A.speedRatio(CG)local tb,lt=A.speedNow(),A.speedOf(CG)if not lt then return{1,1}end
return{tb[1]/lt[1],tb[2]/lt[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(CH)local lu=o.info()if lu and type(lu.fuseNeed)=="function"then local CI,lv=pcall(lu.fuseNeed,K,CH or"")
if CI and tonumber(lv)and tonumber(lv)>=2 then return tonumber(lv)end end if K:GetAttribute("FusePass")==true or K:GetAttribute("FusePass4")==true then return 3 end
if K:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(td)
if td=="Huge"then return y.needFor("")*y.needFor("Big")end if td=="Big"then return y.needFor("")end return 1 end
function y.nextOf(te)return(te==""and"Big")or(te=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lw=o.info()return(lw and type(lw.HugeCaps)=="table")and lw.HugeCaps or y.HCAPS end function y.cosmic()local lx=o.info()return(lx and type(lx.CosmicCaps)=="table")and lx.CosmicCaps or{StarWhale=0.1}end
function y.slots()local tf=o.data()return tonumber(tf and tf.slots)or(3+(tonumber(K:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local ly=o.info()return(ly and type(ly.Caps)=="table")and ly.Caps or y.CAPS end function y.value(th,cB)
local hu=o.info()local cC=hu and hu.Pets[th]if not(cC and type(cC.boost)=="table")then return nil end local cD
if type(hu.boostValue)=="function"then local CJ,CK=pcall(hu.boostValue,th,(cB~=""and cB)or nil)cD=CJ and tonumber(CK)or nil
end if not cD then local eO=cC.boost.value or 0 cD=eO if cB=="Big"or cB=="Huge"then local ti=eO*(cB=="Huge"and 1.75 or 1.5)
cD=y.ROUND[cC.boost.kind]and math.max(eO+(cB=="Huge"and 2 or 1),math.floor(ti+0.5))or ti if cB=="Huge"and y.ROUND[cC.boost.kind]then cD=math.max(cD,math.max(eO+1,math.floor(eO*1.5+0.5))+1)end
end end return cC.boost.kind,cD,cC.boost.every end function y.stats(CL)local cE,lz,tj,eP={},{},{},{}local CM=y.cosmic()
for KH,dm in ipairs(CL)do local aw,eQ,tk=y.value(dm.name,dm.variant or"")if aw then if dm.variant=="Huge"then tj[y.CAPKEY[aw]or aw]=true end
if aw:sub(1,6)=="social"then lz[aw]=math.max(lz[aw]or 0,eQ)elseif aw=="waxStir"or aw=="cashGift"then cE[aw]=(cE[aw]or 0)+eQ*60/(tk or 60)
elseif aw=="luckyPull"then cE.luckyPull=(cE.luckyPull or 0)+eQ/(tk or 10)else cE[aw]=(cE[aw]or 0)+eQ if CM[dm.name]then eP[aw]=eP[aw]or{}eP[aw][dm.name]=(eP[aw][dm.name]or 0)+eQ end
end end end return cE,lz,tj,eP end function y.glazeGain(CN,hv)local eR,lA,KI={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local CO=eR[1]+eR[2]+eR[3]local CP=tonumber(K:GetAttribute("GuildUpGlaze"))or 0 local dn={}for hw=1,3 do dn[hw]=eR[hw]+CN*eR[hw]/CO+(hw==1 and CP or 0)end
local lB={dn[1]*(1-hv),dn[2]*(1-hv)+dn[1]*hv,dn[3]+dn[2]*hv}return lB[1]*(lA[1]-1)+lB[2]*(lA[2]-1)+lB[3]*(lA[3]-1)
end function y.score(hx,CQ)local CS,CT,CU=y.caps(),y.hcaps(),y.cosmic()local hy,hz,CV,tl=y.stats(CQ)local function lC(lD)return(CV[lD]and CT[lD])or CS[lD]or math.huge end
local function bs(hA)local lE,lF=hy[hA]or 0,lC(hA)local lG=math.min(lE,lF)if tl[hA]and lE>lF then local lH=0 for CW,CX in pairs(tl[hA])do lH=lH+math.min(CX,CU[CW]or 0)end
lG=lG+math.min(lE-lF,lH)end return lG end local CY=(1+bs("income"))*(1+(hz.socialIncome or 0))*(1+math.min(hy.cashGift or 0,lC("cashGiftPerMinute"))/60)
local CZ=1+bs("luck")+(hy.luckyPull or 0)+(hz.socialLuck or 0)local tm=CZ*(1+bs("newFind"))*(1+bs("rollSpeed"))
local eS=math.log(CY)local C0=math.max(tonumber(K:GetAttribute("WaxStations"))or 18,1)local lI=(1+bs("waxSpeed")+bs("longWax"))*(1+(hz.socialWax or 0))
+math.min(hy.waxStir or 0,lC("waxStirPerMinute"))/60/C0 local C1=1-(1-bs("headStart"))*(1-(hz.socialHeadStart or 0))
if hx=="farm"then return eS+0.7*math.log(tm)+0.1*math.log(lI)end if hx=="full"then return eS+0.4*math.log(lI)+0.02*math.log(tm)end
if hx=="glaze"then return y.glazeGain(bs("glaze"),bs("glazeUp"))+0.001*eS end if hx=="wax"then return-math.log(1-0.5*C1)+0.001*eS+0.001*math.log(lI)end
return eS end function y.kinds(C2)local tn,lJ={},{}for KJ,eT in ipairs(C2)do local to=eT.name.."|"..(eT.variant or"")
local bT=tn[to]if not bT then bT={name=eT.name,variant=eT.variant or"",n=0,ids={}}tn[to]=bT lJ[#lJ+1]=bT end bT.n=bT.n+1
bT.ids[#bT.ids+1]=eT.id end return lJ end function y.bestKinds(tp,bU,C3,tq,tr)local aD,bV={},{}local function lK(C4)
local ts,hB={},{}for C5,lL in ipairs(C4)do ts[C5]=bU[lL]hB[lL]=(hB[lL]or 0)+1 end local eU=y.score(tp,ts)if tq then for C6,C7 in pairs(hB)do eU=eU+1e-7*math.min(C7,tq[C6]or 0)end end
if tr then for C8,C9 in pairs(hB)do eU=eU-1e-8*C9*tr[bU[C8].variant]end end return eU end for KK=1,C3 do local eV,lM
for hC=1,#bU do if(bV[hC]or 0)<bU[hC].n then aD[#aD+1]=hC local tt=lK(aD)aD[#aD]=nil if not lM or tt>lM+1e-12 then eV,lM=hC,tt end
end end if not eV then break end bV[eV]=(bV[eV]or 0)+1 aD[#aD+1]=eV if#bU>40 then task.wait()end end for KL=1,6 do
task.wait()local tu,tv=false,lK(aD)for lN=1,#aD do for dp=1,#bU do local hD=aD[lN]if dp~=hD and(bV[dp]or 0)<bU[dp].n then
aD[lN]=dp local tw=lK(aD)if tw>tv+1e-9 then bV[hD],bV[dp],tv,tu=bV[hD]-1,(bV[dp]or 0)+1,tw,true else aD[lN]=hD end
end end end if not tu then break end end local tx={}for C_,Da in ipairs(aD)do tx[C_]=bU[Da]end return aD,y.score(tp,tx)
end function y.best(Db,Dc,Dd,hE)hE=hE or{}local lO=y.kinds(Dc)local lP={}for ty,De in ipairs(lO)do for KM,Df in ipairs(De.ids)do if hE[tostring(Df)]then lP[ty]=(lP[ty]or 0)+1 end end end
local Dg,Dh=y.bestKinds(Db,lO,Dd,lP)local lQ,lR={},{}for KN,Di in ipairs(Dg)do local tz,eW=lO[Di],nil for KO,lS in ipairs(tz.ids)do if hE[tostring(lS)]and not lQ[lS]then eW=lS break end end
if not eW then for KP,tA in ipairs(tz.ids)do if not lQ[tA]then eW=tA break end end end lQ[eW]=true lR[#lR+1]=tostring(eW)
end return lR,Dh end function y.dream()local tB=o.info()if not(tB and type(tB.Pets)=="table")then return nil end
local lT=y.slots()local tC=y.needFor("").."|"..y.needFor("Big").."|"..lT.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==tC and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local Do=pcall(function()local hF={}for KQ,Dj in ipairs(o.order())do for KR,Dk in ipairs({"","Big","Huge"})do hF[#hF+1]={name=Dj,variant=Dk,n=lT,ids={}}end
end local eX,lU={},{}for KS,hG in ipairs(y.ROLES)do if e[hG[1]]~=""then local Dl,Dm=y.bestKinds(hG[2],hF,lT,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local lV,hH={},{}for KT,tD in ipairs(Dl)do lV[tD]=(lV[tD]or 0)+1 end for Dn,lW in pairs(lV)do local bW=hF[Dn]
eX[bW.name]=eX[bW.name]or{[""]=0,Big=0,Huge=0}eX[bW.name][bW.variant]=math.max(eX[bW.name][bW.variant],lW)hH[#hH+1]=(lW>1 and(lW.."x ")or"")..o.nice(bW.name,bW.variant)
end table.sort(hH)lU[#lU+1]={role=hG[2],team=e[hG[1]],names=hH,score=Dm}end end y.dreamT,y.dreamTeams,y.dreamSig=eX,lU,tC
end)y.dreaming=false if not Do then y.dreamSig=nil end return y.dreamT end function y.owned(hI)local tE,lX={},{}
for KU,Dp in ipairs(hI and hI.arriving or{})do tE[tostring(Dp)]=true end for KV,cF in ipairs(hI and hI.pets or{})do
if not tE[tostring(cF.id)]then lX[#lX+1]={id=tostring(cF.id),name=cF.name,variant=cF.variant or"",named=cF.named or(cF.nickname and cF.nickname~="")}
end end return lX end function y.have(tF,Dq,Dr)local ba={[""]=0,Big=0,Huge=0}local tG={}for KW,eY in ipairs(y.owned(Dq))do
tG[eY.id]=true if eY.name==tF and ba[eY.variant]then ba[eY.variant]=ba[eY.variant]+1 end end if Dr then for KX,dq in ipairs(o.recent or{})do
if dq.name==tF and not tG[dq.id]and z()-dq.at<20 and ba[dq.variant or""]then ba[dq.variant or""]=ba[dq.variant or""]+1 end
end end return ba,ba[""]+ba.Big*y.unit("Big")+ba.Huge*y.unit("Huge")end function y.goal(tH)local tI=e.Pets[tH]
if tI and tonumber(tI.f)==-1 then return nil,0 end local tJ=y.dream()local eZ=tJ and tJ[tH]if not eZ then return nil,0 end
return eZ,eZ[""]+eZ.Big*y.unit("Big")+eZ.Huge*y.unit("Huge")end function y.wantMore(lY,KY,tK)if not tK then return true end
local tL=e.Pets[lY]if tL and tonumber(tL.f)==-1 then return true end local Ds,Dt=y.goal(lY)if not Ds then return true end
local KZ,Du=y.have(lY,tK,true)return Du<Dt+y.need()end function y.status(e0,tM)if not tM then return nil end local tN=e.Pets[e0]
if tN and tonumber(tN.f)==-1 then return"KEEP: never fused"end local cG,tO=y.goal(e0)if not cG then return y.dream()and"in no best team: bought as ticked"or nil end
local lZ,Dv=y.have(e0,tM)local cH={}if cG.Huge>0 then cH[#cH+1]=("Huge %d/%d"):format(lZ.Huge,cG.Huge)end if cG.Big>0 then cH[#cH+1]=("Big %d/%d"):format(lZ.Big,cG.Big)end
if cG[""]>0 then cH[#cH+1]=("plain %d/%d"):format(lZ[""],cG[""])end local Dw=y.blocked and y.blocked[e0]and(" | "..y.blocked[e0])or""
return("%s | %d/%d copies%s"):format(table.concat(cH," "),math.min(Dv,tO),tO,Dw)end function y.wear(l0)local l1={}
for K0,Dx in ipairs(l0)do l1[tostring(Dx)]=true end for K1=1,3 do local dr=o.data()if not dr then return false end
for K2,tP in ipairs(dr.equipped or{})do if not l1[tostring(tP)]then o.call("unequip",tP)task.wait(0.3)end end
dr=o.data()local tQ={}for K3,Dy in ipairs(dr.equipped or{})do tQ[tostring(Dy)]=true end for K4,tR in ipairs(l0)do
if not tQ[tostring(tR)]then o.call("equip",tR)task.wait(0.3)end end task.wait(0.4)dr=o.data()local l2,tS=0,true
for K5,Dz in ipairs(dr.equipped or{})do l2=l2+1 if not l1[tostring(Dz)]then tS=false end end if tS and l2==#l0 then return true end
end return false end function y.saveTeam(tT,tU)if not y.wear(tU)then return false,"could not put the pets on"end
local DA=A.teams()local cI for DB,DC in ipairs(DA)do if DC.name==tT then cI=DB break end end local ds if cI then
ds=o.call("teamSave",cI)else ds=o.call("teamNew")if type(ds)=="table"and ds.ok and ds.index then cI=ds.index task.wait(0.3)
o.call("teamRename",{index=cI,name=tT})end end task.wait(0.4)local l3=o.data()local tV=l3 and l3 .teams and cI and l3 .teams[cI]
if not tV then return false,"the game did not save it"end local tW={}for K6,DD in ipairs(tV.pets or{})do tW[tostring(DD)]=true end
for K7,DE in ipairs(tU)do if not tW[tostring(DE)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local DF=o.srv()for K8,DG in ipairs(A.list or{})do if DG.ends-DF<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local e1=o.data()if not e1 then return{}end local tX={}for K9,DH in ipairs(e1 .arriving or{})do tX[tostring(DH)]=true end
local e2={}for K_,hJ in ipairs(e1 .pets or{})do if not tX[tostring(hJ.id)]then e2[#e2+1]={id=tostring(hJ.id),name=hJ.name,variant=hJ.variant or""}end
end local tY={}for La,tZ in ipairs(e2)do tY[tZ.id]=tZ end local t0=tonumber(e1 .slots)or 3 local l4,t1={},{}for Lb,hK in ipairs(y.ROLES)do
local e3=e[hK[1]]if e3~=""and not t1[e3]then t1[e3]=true local l5,e4,t2={},{},false for Lc,t3 in ipairs(e1 .teams or{})do
if t3 .name==e3 then for Ld,DI in ipairs(t3 .pets or{})do local l6=tY[tostring(DI)]if l6 then l5[l6 .id]=true e4[#e4+1]=l6 else t2=true end
end end end local l7,t4=y.best(hK[2],e2,t0,l5)local t5=y.score(hK[2],e4)local t6=#l7==#e4 for Le,DJ in ipairs(l7)do if not l5[DJ]then t6=false end end
if not t6 and(t2 or#e4<math.min(t0,#e2)or t4>t5+1e-4)then l4[#l4+1]={team=e3,role=hK[2],ids=l7,gain=t4-t5}end
end end return l4 end function y.rebuild(DK)local t7=y.plan()if#t7==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end A.editing,A.editingSince=true,z()
local hL=true local DO,DP=pcall(function()for Lf,e5 in ipairs(t7)do local DL,DM=y.saveTeam(e5 .team,e5 .ids)local t8=o.data()
local l8={}for Lg,DN in ipairs(e5 .ids)do for Lh,l9 in ipairs(t8 and t8 .pets or{})do if tostring(l9 .id)==DN then l8[#l8+1]=o.nice(l9 .name,l9 .variant)end
end end if DL then D(("TEAM %s rebuilt (%s): %s"):format(e5 .team,DK or"pets changed",table.concat(l8,", ")))
else hL=false D(("TEAM %s: %s"):format(e5 .team,tostring(DM)))end end end)A.editing,A.nextTry=false,0 if not DO then hL=false D("TEAM BUILD ERR "..tostring(DP))end
y.builds=y.builds+1 y.buildMsg=hL and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return hL end function y.roleScores(t9)local bX={}for Li,t_ in ipairs(t9)do bX[#bX+1]=t_.name..t_.variant end
table.sort(bX)bX=table.concat(bX,",")y.rsCache=y.rsCache or{}if y.rsCache[bX]then return y.rsCache[bX]end local DQ,DR,l_=y.kinds(t9),y.slots(),{}
for Lj,ma in ipairs(y.ROLES)do if e[ma[1]]~=""then local Lk,DS=y.bestKinds(ma[2],DQ,DR)l_[ma[2]]=DS end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bX]=l_ return l_ end function y.noLoss(ua,DT,DU,DV)local ub,e6={},{}
for Ll,DW in ipairs(DT)do ub[DW]=true end for Lm,uc in ipairs(ua)do if not ub[uc.id]then e6[#e6+1]=uc end end
e6[#e6+1]={id="new",name=DU,variant=DV}local DX,ud=y.roleScores(ua),y.roleScores(e6)local ue=false for mb,uf in pairs(DX)do
if(ud[mb]or-math.huge)<uf-1e-6 then return false,mb end if(ud[mb]or 0)>uf+1e-6 then ue=true end end return true,ue
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local e7=o.data()if not e7 then return end local ug=y.owned(e7)local hM,e8={},{}for Ln,DY in ipairs(e7 .teams or{})do for Lo,DZ in ipairs(DY.pets or{})do hM[tostring(DZ)]=true end end
for Lp,D0 in ipairs(e7 .equipped or{})do e8[tostring(D0)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for Lq,aL in ipairs(o.order())do
local hN=y.goal(aL)if hN then local mc=y.have(aL,e7)for Lr,bt in ipairs({"Big",""})do local dt,md=y.nextOf(bt),y.needFor(bt)
local D1=(bt=="Big"and mc.Huge<hN.Huge)or(bt==""and mc.Big<hN.Big+y.needFor("Big")*math.max(0,hN.Huge-mc.Huge))
local e9={}for Ls,me in ipairs(ug)do if me.name==aL and me.variant==bt then e9[#e9+1]=me end end if D1 and#e9>=md and z()>=(y.failUntil[aL..bt]or 0)then
table.sort(e9,function(hO,hP)local uh=(e8[hO.id]and 4 or 0)+(hM[hO.id]and 2 or 0)+(hO.named and 1 or 0)local ui=(e8[hP.id]and 4 or 0)+(hM[hP.id]and 2 or 0)+(hP.named and 1 or 0)
if uh~=ui then return uh<ui end return hO.id<hP.id end)local cJ,mf,uj={},{},false for du=1,md do cJ[du]=e9[du].id
if e8[cJ[du]]then mf[#mf+1]=cJ[du]end if e8[cJ[du]]or hM[cJ[du]]then uj=true end end local D2,uk=y.noLoss(ug,cJ,aL,dt)
if not D2 then y.blocked[aL]=("%s waits: it would weaken the %s team now"):format(dt,y.ROLENAME[uk]or tostring(uk))
elseif uj and not y.quiet()then y.blocked[aL]=dt.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dt,o.nice(aL))
return else A.editing,A.editingSince=true,z()for Lt,D3 in ipairs(mf)do o.call("unequip",D3)task.wait(0.3)end local hQ=o.call("fuse",{ids=cJ})
A.editing,A.nextTry=false,0 if type(hQ)=="table"and hQ.ok then y.fused=y.fused+1 y.dirtyAt=z()D(("FUSED %d %s -> %s"):format(md,o.nice(aL,bt),o.nice(aL,dt)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aL,dt),os.date("%H:%M"))else y.failUntil[aL..bt]=z()+120 D(("fuse %s failed: %s"):format(o.nice(aL,bt),type(hQ)=="table"and tostring(hQ.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local ul=o.data()if not ul then return end local cK={}for Lu,D4 in ipairs(ul.pets or{})do cK[#cK+1]=tostring(D4 .id)end
table.sort(cK)cK=table.concat(cK,",")if cK~=y.sig then y.sig,y.dirtyAt=cK,z()end local D5=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if D5 and not A.editing then local D6=y.rebuild(y.dirtyAt and"pets changed"or"check")if D6 then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cL)return cL:IsA("ParticleEmitter")or cL:IsA("Trail")or cL:IsA("Beam")or cL:IsA("Fire")or cL:IsA("Smoke")
or cL:IsA("Sparkles")or cL:IsA("Light")end function d.muteOne(bu)if not e.Lite or not bu.Parent then return end
local hR=(bu:IsA("BillboardGui")and d.bb)or(d.isFx(bu)and d.fx)or nil if not hR or hR[bu]~=nil then return end
if hR==d.fx and d.gameLow and not bu:IsA("Beam")then return end hR[bu]=bu.Enabled if bu.Enabled then bu.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local mg={}for Lv,D7 in ipairs({d.bb,d.fx})do for D8 in pairs(D7)do mg[#mg+1]=D8 end end local um=os.clock()for D9,e_ in ipairs(mg)do
if e.Lite and e_.Parent and e_.Enabled then local D_=d.bb[e_]~=nil and d.bb or d.fx D_[e_]=true e_.Enabled=false
end if D9%200==0 and os.clock()-um>0.002 then task.wait()um=os.clock()end end end function d.lite(uo)e.Lite=uo
if uo then task.spawn(function()for Ea,Eb in ipairs(ak:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Eb)
if Ea%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=V(ak.DescendantAdded:Connect(function(mh)
if e.Lite and(mh:IsA("BillboardGui")or d.isFx(mh))then d.queue[#d.queue+1]=mh end end))end local mi=game:GetService("Lighting")
for Lw,fa in ipairs(mi:GetChildren())do if fa:IsA("PostEffect")and fa.Enabled and d.post[fa]==nil then d.post[fa]=true fa.Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and mi.GlobalShadows or d.oldShadows mi.GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ak.Terrain.Decoration or d.oldDeco ak.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for Lx,Ec in pairs(d.watch)do pcall(function()Ec:Disconnect()end)end
for up,Ed in pairs(d.bb)do pcall(function()if up.Parent then up.Enabled=Ed end end)end for uq,Ee in pairs(d.fx)do pcall(function()if uq.Parent then uq.Enabled=Ee end end)end
for ur in pairs(d.post)do pcall(function()if ur.Parent then ur.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local Ef=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()Ef.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ak.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(us)
local Eg,mj=pcall(function()return require(ag:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not Eg or type(mj)~="table"then return end if us and not d.ceOld then d.ceOld={}for Ly,ut in ipairs({"Fireworks","Confetti"})do
local hS=mj[ut]if type(hS)=="table"and type(hS.Play)=="function"then d.ceOld[ut]=hS.Play pcall(function()hS.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not us and d.ceOld then for Eh,Ei in pairs(d.ceOld)do pcall(function()mj[Eh].Play=Ei end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local ml,hT for Lz,fb in ipairs(getgc(false))do if type(fb)=="function"and(type(islclosure)~="function"or islclosure(fb))then
local Ej,uu,uv=pcall(debug.info,fb,"sn")if Ej and type(uu)=="string"and uu:find("ToppingCullHandler",1,true)then
if uv=="poll"then ml=fb elseif uv=="retarget"then hT=fb end end end end if not(ml and hT)then return nil end local Ek,hU=pcall(debug.getupvalues,hT)
local uw=Ek and type(hU)=="table"and hU[3]if type(uw)~="function"or debug.info(uw,"n")~="targetFor"or(hU[1]~=nil and type(hU[1])~="number")then return nil end
d.tc={poll=ml,re=hT}return d.tc end function d.tops(ux)local aR=d.topsFind()if not aR then return false end if ux and not aR.old then
local El,Em=pcall(hookfunction,aR.poll,function()end)if not El then return false end aR.old=Em pcall(debug.setupvalue,aR.re,1,-1000)
pcall(aR.re)elseif not ux and aR.old then local En=type(restorefunction)=="function"and pcall(restorefunction,aR.poll)
if not En then pcall(hookfunction,aR.poll,aR.old)end aR.old=nil pcall(aR.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(Eo)local uy=ak:FindFirstChild("Plots")local uz=os.clock()if Eo then for LA,Ep in ipairs(uy and uy:GetChildren()or{})do
local uA=Ep:FindFirstChild("SkinProps")local uB=uA and uA:FindFirstChild("FairyLights")for LB,uC in ipairs(uB and uB:GetChildren()or{})do
for LC,fc in ipairs(uC:GetChildren())do if fc:IsA("BasePart")and(fc.Name=="Bulb"or fc.Name=="Wire")then d.lit[fc]=uC fc.Parent=nil end
end if os.clock()-uz>0.002 then task.wait()uz=os.clock()end end end for LD,Eq in ipairs({"Leaderboards","ClanBoard"})do
local mm=ak:FindFirstChild(Eq)if mm then d.boardsOff[mm]=true mm.Parent=nil end end else for Er,uD in pairs(d.lit)do pcall(function()if uD.Parent then Er.Parent=uD end end)end
for uE in pairs(d.boardsOff)do pcall(function()if not uE.Parent then uE.Parent=ak end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(Es)if Es then local uF=ag:FindFirstChild("Remotes")local uG=uF and uF:FindFirstChild("SquishyRollAnimation")
if not uG or type(getconnections)~="function"then return end local Et,Eu=pcall(getconnections,uG.OnClientEvent)
for LE,hV in ipairs(Et and Eu or{})do local mn=""pcall(function()mn=debug.info(hV.Function,"s")end)if type(mn)=="string"and mn:find("SquishyHandler",1,true)and not d.reel[hV]then
if pcall(function()hV:Disable()end)then d.reel[hV]=true end end end else for Ev in pairs(d.reel)do pcall(function()Ev:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(Ew)if not Ew then for LF,Ex in pairs(d.quiet)do pcall(function()Ex:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function mo(Ey,Ez)local EA,EB=pcall(getconnections,Ey)
for LG,hW in ipairs(EA and EB or{})do local mp=""pcall(function()mp=debug.info(hW.Function,"s")end)local mq=hW.Function
if mq and type(mp)=="string"and mp:find(Ez,1,true)and not d.quiet[mq]then if pcall(function()hW:Disable()end)then d.quiet[mq]=hW end
end end end local uH=ak:FindFirstChild("Plots")for LH,hX in ipairs(uH and uH:GetChildren()or{})do if hX~=c.plot then
mo(hX:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uI,uJ=hX:FindFirstChild("WaxStations"),hX:FindFirstChild("SquishyStack")
if uI then mo(uI.DescendantAdded,"LocalToppingsHandler")end if uJ then mo(uJ.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for uK,EC in pairs(d.lit)do if not EC:IsDescendantOf(game)then d.lit[uK]=nil pcall(function()uK:Destroy()end)end
end end function d.passText()local ax=function(ED)return K:GetAttribute(ED)end local mr={}local function bY(EE,EF)mr[#mr+1]=(EE and"[x] "or"[  ] ")..EF end
bY(ax("VIP")==true,"VIP: money x1.5, offline +50%")bY(ax("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(ax("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local EG=ax("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(ax("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bY(ax("FastWax")==true or ax("SuperFastWax")==true,EG.." (the farm times by the game's own timers)")local uL=(ax("FusePass")==true and"Fuse Pass")or(ax("FusePass4")==true and"Fuse Pass 4")or(ax("FusePass5")==true and"Fuse Pass 5")or nil
bY(uL~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uL or"Fuse pass",y.needFor(""),y.needFor("Big")))local hY=o.data()
local EH=tonumber(hY and hY.maxOwned)or 60 bY(ax("PetInventory50")==true or ax("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(hY and#(hY.pets or{})or 0,EH,(ax("PetInventory50")==true and ax("PetInventory100")==true)and" (both bag passes)"or""))
local uM=tonumber(ax("PetEquipBought"))or 0 bY(uM>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uM))
local uN=tonumber(ax("PetWishCredits"))or 0 if uN>0 then bY(true,("%d free wishes: used before cash"):format(uN))end
local uO=tonumber(ax("FinishAllCredits"))or 0 if uO>0 then bY(true,("%d finish-all credits (yours to use)"):format(uO))end
return table.concat(mr,"\n")end function d.extras(hZ)pcall(d.quietPlots,hZ and c.plot~=nil)pcall(d.fxPatch,hZ)
pcall(d.tops,hZ)pcall(d.lights,hZ)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uP)
e.HideHud=uP local ms=K:FindFirstChildOfClass("PlayerGui")if not ms then return end if uP then for LI,fd in ipairs(ms:GetChildren())do
if fd:IsA("ScreenGui")and not d.MINE[fd.Name]and fd.Enabled then d.hud[fd]=true fd.Enabled=false end end if not d.hudConn then
d.hudConn=V(ms.ChildAdded:Connect(function(fe)if e.HideHud and fe:IsA("ScreenGui")and not d.MINE[fe.Name]then
task.defer(function()if e.HideHud and fe.Enabled then d.hud[fe]=true fe.Enabled=false end end)end end))end else
for uQ in pairs(d.hud)do pcall(function()if uQ.Parent then uQ.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mt)e.FpsCap=mt local uR=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uR then return false end return pcall(uR,mt==0 and 60 or mt)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(aq)if aq:IsA("BasePart")or aq:IsA("Decal")or aq:IsA("Texture")then if aq.Transparency<1 then d.unseen[aq]=aq.Transparency aq.Transparency=1 end
elseif aq:IsA("BillboardGui")or aq:IsA("SurfaceGui")or aq:IsA("ParticleEmitter")or aq:IsA("Beam")or aq:IsA("Trail")or aq:IsA("Light")or aq:IsA("Fire")or aq:IsA("Smoke")or aq:IsA("Sparkles")then
if aq.Enabled then d.unseen[aq]=true aq.Enabled=false end end end function d.notMine(EI)return e.HideMine or(c.plot and not EI:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(h0)
local mu=h0 .Parent local mv=mu and mu.Name=="SquishyStack"and mu.Parent if mv and mv~=c.plot and c.plot and mv.Parent==c.plot.Parent and not d.dropSeen[h0]then
d.dropSeen[h0]=true d.dropQ[#d.dropQ+1]={h0,z()+3}end end function d.dropScan()local uS=c.plot and c.plot.Parent
if not(e.HideBases and uS)then return end for LJ,uT in ipairs(uS:GetChildren())do local uU=uT~=c.plot and uT:FindFirstChild("SquishyStack")
for LK,EJ in ipairs(uU and uU:GetChildren()or{})do d.dropIt(EJ)end end end function d.dropStep(EK)local mw=d.dropQ
while d.dropI<=#mw and os.clock()-EK<0.003 do local mx=mw[d.dropI]if mx[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mx[1].Parent then pcall(function()mx[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mw then d.dropQ,d.dropI={},1 end
end function d.hideStep()local my=os.clock()local ff=d.queue if e.Lite and ff and#ff>0 then d.muteI=d.muteI or 1
while d.muteI<=#ff and os.clock()-my<0.0015 do pcall(d.muteOne,ff[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#ff then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,my)end local h1=d.hideQ if d.hideI>#h1 then return end while d.hideI<=#h1 and os.clock()-my<0.004 do
local mz=h1[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mz.Parent and d.notMine(mz)then pcall(d.hideOne,mz)end
end if d.hideI>#h1 then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(uV)if e.HideBases then d.bases(false)end
e.HideMine=uV==2 if uV>0 then d.bases(true)end end function d.bases(uW)e.HideBases=uW local mA=ak:FindFirstChild("Plots")
if not mA then return end if uW then task.spawn(function()local mB=0 for LL,h2 in ipairs(mA:GetChildren())do local uX=h2~=c.plot and c.plot and h2:FindFirstChild("SquishyStack")
for LM,EL in ipairs(uX and uX:GetChildren()or{})do d.dropIt(EL)end if h2~=c.plot or e.HideMine then for LN,EM in ipairs(h2:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,EM)mB=mB+1 if mB%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=V(mA.DescendantAdded:Connect(function(dv)if e.HideBases and d.notMine(dv)then
pcall(d.hideOne,dv)d.hideQ[#d.hideQ+1]=dv if dv.Parent and dv.Parent.Name=="SquishyStack"then d.dropIt(dv)end
end end))end else for mC,uY in pairs(d.unseen)do pcall(function()if not mC.Parent then return end if type(uY)=="number"then mC.Transparency=uY else mC.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(uZ)e.NoRender=uZ pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not uZ)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local EN=game:GetService("RunService")local mD=0 for LO,EO in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local EP,u0=pcall(function()return EN[EO]end)local u1,mE=false,nil if EP and u0 then u1,mE=pcall(getconnections,u0)end
if u1 and type(mE)=="table"then for LP,h3 in ipairs(mE)do local mF=""pcall(function()local u2=getfenv(h3 .Function).script mF=u2 and u2:GetFullName()or""end)
if mF~=""then for LQ,EQ in ipairs(d.CALM)do if mF:find(EQ,1,true)then local mG=h3 .Function if mG and not d.calmedF[mG]and pcall(function()h3:Disable()end)then
d.calmedF[mG]=true d.calmed[#d.calmed+1]=h3 mD=mD+1 end break end end end end end end if#d.calmed>200 then local mH={}for ER=#d.calmed-49,#d.calmed do mH[#mH+1]=d.calmed[ER]end d.calmed=mH
end return mD end function d.walker()local ES,mI=pcall(function()return require(K.PlayerScripts.LocalScript.PetHandler.Walker)end)
return(ES and type(mI)=="table"and type(mI.walkTo)=="function")and mI or nil end function d.walkers(ET)local u3={}
local EU,EW=pcall(debug.getupvalues,ET.destroy)for LR,u4 in ipairs(EU and EW or{})do if type(u4)=="table"then
for h4 in pairs(u4)do if type(h4)=="table"and rawget(h4,"model")~=nil and rawget(h4,"position")~=nil then u3[h4]=true end end
end end return u3 end function d.walkPatch(u5)local fg=d.walker()if not fg then return 0 end if u5 and not d.wkOld then
local u6=fg.walkTo d.wkOld=u6 fg.walkTo=function(fh,fi,EX,mJ)local EY=fi~=nil and pcall(function()return fi.X+fi.Z end)
if not e.Calm or not EY then return u6(fh,fi,EX,mJ)end fh.target,fh.onArrive=nil,nil pcall(function()fh:teleport(fi)fh:render(0)end)
if mJ then task.spawn(mJ)end end elseif not u5 then if d.wkOld then fg.walkTo,d.wkOld=d.wkOld,nil end return 0
end local mK=0 for aM in pairs(d.walkers(fg))do if aM.target and not aM.destroyed then local u7=aM.model and aM.model:FindFirstChild("Body")and aM.model.Body:FindFirstChild("PetBillboard")
local u8=u7 and u7:FindFirstChild("TimerLabel",true)if u8 and tostring(u8 .Text):find("'s plot!",1,true)then pcall(function()aM:destroy()end)
pcall(function()aM.model:Destroy()end)else local EZ,u9=aM.target,aM.onArrive aM.target,aM.onArrive=nil,nil pcall(function()aM:teleport(EZ)aM:render(0)end)
if u9 then task.spawn(u9)end end mK=mK+1 end end return mK end function d.calm(u_)e.Calm=u_ if u_ then local E0=d.calmScan()
local mL=0 pcall(function()mL=d.walkPatch(true)end)D(("NO ANIMATIONS: %d of the game's animation loops switched off%s"):format(E0,mL>0 and(", "..mL.." stuck pet walks cleared")or""))
else for LS,E1 in ipairs(d.calmed)do pcall(function()E1:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
pcall(d.walkPatch,false)end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end
if J.arPaused then pcall(J.resume,"script stopped")end pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(va)if c.rejoining then return end D("REJOIN this server ("..va..")")
pcall(gj)if c.autoload then pcall(gK,c.autoload)end qp()local E2=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,K)
end)task.delay(25,function()if c.alive then ec(va..", same server failed")end end)return E2 end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=K:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local vb=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if vb then for LT,E3 in ipairs(vb:GetChildren())do local vc=E3:FindFirstChild("SquishyPlaceHolder")local cM=vc and vc:FindFirstChild("TimerGui")
if cM and cM:IsA("BillboardGui")then if d.bb[cM]==nil then pcall(d.muteOne,cM)elseif cM.Enabled then d.bb[cM]=true cM.Enabled=false end
end end end local E4,dw=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if E4 and type(dw)=="number"then
d.mem=dw d.memPeak=math.max(d.memPeak,dw)if(e.MemLimit or 0)>0 and dw>e.MemLimit then d.over=(d.over or 0)+((dw>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dw,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()D(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mM(h5)if type(h5)~="string"then return false end
h5=h5:lower()for LU,E5 in ipairs(c.sellWords)do if h5:find(E5,1,true)then return true end end return false end
local function E6()local vd=ag:FindFirstChild("Remotes")local mN=vd and vd:FindFirstChild("SellSquishy")if not(mN and mN:IsA("RemoteEvent"))then return false end
if not pcall(function()mN:FireServer()end)then return false end return ap(function()return ad()==nil end,1.5)
end local function E7()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local ve=ar()local vf=ve and ve.HumanoidRootPart.Position local fj,vg for LV,dx in ipairs((c.plot or ak):GetDescendants())do
if dx:IsA("ProximityPrompt")and(mM(dx.ActionText)or mM(dx.ObjectText)or mM(dx.Name))then local vh=pk(dx)local mO=(vh and vf)and(vh-vf).Magnitude or 1e9
if mO<=400 and(not fj or mO<vg)then fj,vg=dx,mO end end end c.sellSpot=fj c.noSellSpot=(fj==nil)return fj end
local function vi()local mP=ad()if not mP then c.holding=false return false end if aP(mP)then return false end
local mQ=am(ab(mP))if E6()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=z()+2.5,0
D("SOLD "..mQ)return true end local dy=E7()if dy then local vj=d1(dy)if vj then cp(vj,dy)local vk=ad()if vk and not aP(vk)then
local E8,E9=ei(dy,function()return ad()==nil end,function()return dy.Enabled end)if E8 then c.sold,c.holding,c.sellFails=c.sold+1,false,0
D(("SOLD %s at %s via %s"):format(mQ,ge(dy),E9))return true end end end end c.sellFails=c.sellFails+1 D("could not sell "..mQ.." ("..c.sellFails..")")
return false end local E_={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Fa(dz)local h6=ge(dz):lower()for LW,Fb in ipairs(E_)do if h6:find(Fb,1,true)then return 0 end end
local bc,as=dz.Name:lower(),0 local function a0(Fc,Fd)return Fc:find(Fd,1,true)~=nil end if a0(bc,"collect")then as=as+60 end
if a0(bc,"cash")or a0(bc,"money")then as=as+45 end if a0(bc,"income")or a0(bc,"claim")then as=as+35 end if a0(bc,"coin")or a0(bc,"earn")or a0(bc,"green")then as=as+20 end
if bc=="pad"or bc=="touch"then as=as+25 end if as==0 and(a0(h6,"collect")or a0(h6,"cash")or a0(h6,"money"))then as=25 end
if as==0 then return 0 end local fk=dz.Color if fk.G>0.5 and fk.G>fk.R*1.4 and fk.G>fk.B*1.4 then as=as+15 end
if math.min(dz.Size.X,dz.Size.Y,dz.Size.Z)<2 then as=as+5 end return as end local function Fe()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local h7,fl,mR={},nil,29 for LX,h8 in ipairs(c.plot:GetDescendants())do
if h8:IsA("BasePart")then local h9=Fa(h8)if h9>0 then h7[#h7+1]={s=h9,p=h8}if h9>mR then fl,mR=h8,h9 end end end
end table.sort(h7,function(Ff,Fg)return Ff.s>Fg.s end)c.padCands,c.padPart=h7,fl if fl then D("collect pad: "..ge(fl).." (score "..mR..")")end
return fl end local mS="SAB_pad_v1.txt"local function Fh(Fi)if type(writefile)=="function"then pcall(writefile,mS,table.concat({Fi:GetComponents()},","))end
end local function Fj()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Fk,vl=pcall(function()if isfile(mS)then return readfile(mS)end end)
if not Fk or type(vl)~="string"then return nil end local h_={}for Fl in vl:gmatch("[^,]+")do h_[#h_+1]=tonumber(Fl)end
if#h_==12 then return CFrame.new(unpack(h_))end end local function Fm(mT,ia,Fn)local Fo=db(mT)local mU=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local a1=(mU and mU:IsA("BasePart"))and(mU.Position-ia)or Vector3 .new(1,0,0)a1=Vector3 .new(a1 .X,0,a1 .Z)if a1 .Magnitude<0.05 then a1=Vector3 .new(1,0,0)end
a1=a1 .Unit for Fp=0,7 do local ib=Fp*math.pi/4 local Fq=Vector3 .new(a1 .X*math.cos(ib)-a1 .Z*math.sin(ib),0,a1 .X*math.sin(ib)+a1 .Z*math.cos(ib))
local ic=ia+Fq*(Fn+5)local mV=gU(ic.X,ia.Y,ic.Z)if mV and math.abs(mV.Y-ia.Y)<8 then aE(mT,Vector3 .new(ic.X,mV.Y+Fo,ic.Z))
if kj(mT,0.7)then return true end end end return false end local function Fr()c.lastCollect=z()local fm=ar()if not fm then return end
local vm,Fs=fm.HumanoidRootPart,db(fm)local fn,vn,fo,mW=nil,4,nil,"?"local mX=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and mX and mX:IsA("BasePart")then fn,mW=(mX.CFrame*c.manualPad).Position,"manual pad"else local bv=Fe()
if bv then fn=Vector3 .new(bv.Position.X,bv.Position.Y+bv.Size.Y/2+Fs,bv.Position.Z)vn,fo,mW=math.max(bv.Size.X,bv.Size.Z)/2,bv,bv.Name
end end if not fn then D("COLLECT: pad not found - stand on it and tap SET PAD")return end local mY=bj()aE(fm,fn)
if fo and type(firetouchinterest)=="function"then pcall(firetouchinterest,vm,fo,0)end ah(e.PadDwell)if fo and type(firetouchinterest)=="function"then pcall(firetouchinterest,vm,fo,1)end
ah(0.5)c.collected=c.collected+1 local mZ=bj()D(("COLLECTED (%s) %s"):format(mW,(mY and mZ and mZ>mY)and("+$"..av(mZ-mY))or"no cash change seen"))
Fm(fm,fn,vn)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.mods()if q.si and z()-q.modAt<120 then return true end
local vo=ag:FindFirstChild("Modules")if not vo then return false end local function m0(Ft)local vp=vo:FindFirstChild(Ft)
if not vp then return nil end local Fu,vq=pcall(require,vp)return(Fu and type(vq)=="table")and vq or nil end q.si,q.arm,q.ci=m0("SquishyInfo"),m0("AutoRollRules"),m0("CrateInfo")
q.modAt=z()if not q.si then return false end local m1={}if q.arm and type(q.arm.tierOf)=="table"then for m2 in pairs(q.arm.tierOf)do
local ie=q.si[m2]if type(ie)=="table"and ie.rarity~="Limited"and not ie.incomeType and not ie.hiddenAfter then m1[ab(m2)]=m2 end
end end q.roll=m1 local ig={}for Fv,Fw in pairs(m1)do local fp=q.si[Fw]if type(fp)=="table"and type(fp.income)=="number"and not fp.incomeType then
ig[#ig+1]={k=Fv,inc=fp.income,pr=tonumber(fp.price)or 0}end end table.sort(ig,function(m3,m4)if m3 .inc~=m4 .inc then return m3 .inc>m4 .inc end return m3 .pr>m4 .pr end)
q.order=ig local ih,m5,m6 local Fx=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for Fy,m7 in pairs(Fx)do
local m8=type(m7)=="table"and tonumber(m7 .price)if m8 and(not m5 or m8>m5)then ih,m5,m6=Fy,m8,m7 .title end end
q.bestCrate,q.bestCrateName=ih and M.key(ih),ih q.bestCrateTitle=m6 and M.key(m6)or nil return true end function q.rank(Fz)
local FA,FB=pcall(function()return q.arm.rankOf(Fz)end)return(FA and tonumber(FB))or 0 end function q.loadDisc(vr)
if type(vr)~="table"then return end local vs={}for FC,FD in pairs(vr)do if FD then vs[ab(tostring(FC))]=true end end
q.disc,q.discAt=vs,z()end function q.fetch()q.discAt=z()local vt=ag:FindFirstChild("Remotes")local vu=vt and vt:FindFirstChild("GetSquishiesDiscovered")
if not vu then return end local FE,FF=pcall(function()return vu:InvokeServer()end)if FE then q.loadDisc(FF)end
end function q.scanWax()local m9={}local vv=c.plot and c.plot:FindFirstChild("WaxStations")if vv then for LY,vw in ipairs(vv:GetChildren())do
local vx=vw:FindFirstChild("SquishyPlaceHolder")if vx and vw:GetAttribute("HasSquishy")then for LZ,vy in ipairs(vx:GetChildren())do if vy:IsA("Model")then m9[ab(vy.Name)]=true end end
end end end for vz,FG in pairs(q.placedAt)do if z()-FG<20 then m9[vz]=true else q.placedAt[vz]=nil end end q.waxing=m9
end function q.compute()local vA,m_,na={},0,0 if q.disc then for nb in pairs(q.roll or{})do if not q.disc[nb]then
if q.waxing[nb]then na=na+1 else vA[nb],m_=true,m_+1 end end end end q.need,q.nNeed,q.nWax=vA,m_,na local vB,nc={},e.Best or 0
local nd=(nc==4)and q.stackMin or nil for FH,vC in ipairs(q.order)do if(nd and vC.inc>nd)or(not nd and FH<=(nc==4 and 1 or nc))then vB[vC.k]=true end
end q.best=vB end function q.readStack()q.stackAt=z()local vD=ag:FindFirstChild("Remotes")local vE=vD and vD:FindFirstChild("EditStack")
if not vE then return end local FI,dA=pcall(function()return vE:InvokeServer("State",nil)end)if not(FI and type(dA)=="table"and type(dA.state)=="table"and type(dA.state.entries)=="table")then return end
local ii for L0,vF in ipairs(dA.state.entries)do local fq=type(vF)=="table"and q.si and q.si[tostring(vF.name)]
if type(fq)=="table"and type(fq.income)=="number"and not fq.incomeType and(not ii or fq.income<ii)then ii=fq.income end
end q.stackMin=ii q.stackFull=#dA.state.entries>=(tonumber(dA.state.capacity)or 100)end function q.want(ne)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[ne]then return true end elseif e.Targets[ne]then return true end return e.AutoIndex==true and q.need[ne]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(FJ)local fr=ab(FJ)q.placedAt[fr],q.waxing[fr]=z(),true if q.need[fr]then q.need[fr],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
D(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(am(fr)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fs,ft={},{}for FK,FL in pairs(q.roll or{})do if q.want(FK)then fs[FL]=true end end
for vG,nf in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if M.wanted(vG)or(type(nf)=="table"and type(nf.title)=="string"and M.wanted(nf.title))then ft[vG]=true end
end if not next(fs)and not next(ft)then return nil end if q.arm and type(q.arm.encode)=="function"then local FM,vH=pcall(q.arm.encode,{rarities={},butters=fs,crates=ft,index=false})
if FM and type(vH)=="string"then return vH end end local function vI(FN)local ij={}for FO in pairs(FN)do ij[#ij+1]=FO end table.sort(ij)return table.concat(ij,",")end
local fu="adv:"if next(fs)then fu=fu..";butters:"..vI(fs)end if next(ft)then fu=fu..";crates:"..vI(ft)end return fu
end function q.canon(FP)local ik={}for vJ in tostring(FP or""):gmatch("[^;]+")do local ng,vK=vJ:match("^(%a+):(.*)$")
if not ng then ng,vK="r",vJ:gsub("^adv:","")end for FQ in vK:gmatch("[^,]+")do ik[#ik+1]=ng.."="..FQ end end table.sort(ik)
return table.concat(ik,"|")end function q.sync(FR)if K:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cN=q.rulesNow()if not cN or#cN>1900 then return end if q.canon(K:GetAttribute("AutoRollRules"))==q.canon(cN)then q.fails=0 return end
if not FR and z()-q.sentAt<4 then return end local vL=ag:FindFirstChild("Remotes")local vM=vL and vL:FindFirstChild("AutoRollAction")
if not vM then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 D("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()E.replaying=true pcall(function()vM:FireServer("Rules",cN)end)E.replaying=false e.ARrules=cN
local il,im=0,0 for L1 in(cN:match("butters:([^;]*)")or""):gmatch("[^,]+")do il=il+1 end for L2 in(cN:match("crates:([^;]*)")or""):gmatch("[^,]+")do im=im+1 end
local vN=il.."/"..im if q.told~=vN then q.told=vN D(("auto roll now stops on %d butters and %d crates"):format(il,im))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aS={}if e.AutoIndex then aS[#aS+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fv=0 for L3 in pairs(q.best)do fv=fv+1 end
aS[#aS+1]=fv==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fv,fv==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aS[#aS+1]="best: "..am(q.order[1].k)end if e.BestCrate and q.bestCrateName then aS[#aS+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if P.got>0 then aS[#aS+1]="shower: "..P.got end q.msg=#aS>0 and table.concat(aS," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(FS)q.feed[#q.feed+1]=os.date("%H:%M ")..FS if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vO,az,io)if vO~="Effect"then q.feedAdd(tostring(vO)..(az~=nil and(": "..tostring(az):sub(1,80))or""))
return end if az~="ShowerTaken"and az~="GoalPoint"then q.feedAdd(tostring(az))end if az=="Shower"then P.add(io)return end
if az=="ShowerTaken"then P.gone(io)return end if az=="ShowerClear"then P.drops={}return end if az=="WaxGlow"then
local nh=type(io)=="table"and tonumber(io.SnapAt)if nh then q.snapAt=nh D(("ADMIN: every wax finishes in %ds%s"):format(math.floor(nh-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end az=tostring(az)cl("Admin "..az)if az~="GoalPoint"and z()-(q.heard[az]or-100)>30 then q.heard[az]=z()
D("ADMIN: "..az)end end P.drops,P.tried,P.got,P.miss={},{},0,0 function P.add(ni)if type(ni)~="table"or type(ni.Pieces)~="table"then return end
for L4,a2 in pairs(ni.Pieces)do if type(a2)=="table"and a2 .Id~=nil and a2 .Position~=nil then P.drops[a2 .Id]={id=a2 .Id,butter=tostring(a2 .Butter or"?"),rar=tostring(a2 .Rarity or"?"),star=a2 .Star==true,
pos=a2 .Position,opens=tonumber(a2 .OpensAt)or 0,ends=tonumber(a2 .ExpiresAt)or 0}end end end function P.gone(fw)
if type(fw)~="table"or fw.Id==nil then return end P.drops[fw.Id]=nil if tonumber(fw.UserId)==o.uid then P.mine=fw.Id end
end function P.pick()local nj=o.srv()local nk,vP for vQ,cO in pairs(P.drops)do if nj>=cO.ends-0.3 then P.drops[vQ]=nil
elseif nj>=cO.opens-0.2 and(P.tried[vQ]or 0)<3 then local vR=(aP(cO.butter)and 1e6 or 0)+(cO.star and 1e5 or 0)+q.rank(cO.rar)*100-(cO.ends-nj)
if not nk or vR>vP then nk,vP=cO,vR end end end return nk end function P.due()return e.Shower and c.running and next(P.drops)~=nil and not ad()and P.pick()~=nil
end function P.grab()local aT,nl=P.pick(),ar()if not(aT and nl)then return end P.tried[aT.id]=(P.tried[aT.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aE(nl,aT.pos+Vector3 .new(0,db(nl)+0.5,0))ap(function()return P.mine==aT.id or ad()~=nil or not P.drops[aT.id]end,1.5)
if P.mine==aT.id or ad()then P.got,P.drops[aT.id]=P.got+1,nil D(("GRABBED %s [%s]%s from the admin shower"):format(am(ab(aT.butter)),aT.rar,aT.star and" (star)"or""))
elseif not P.drops[aT.id]then P.miss=P.miss+1 end end local fy local function vS()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 D("trying again after being stopped for 5 minutes")fy(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ar()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bE(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local nm,vT=gg()
local ip=ad()if ip then local cP=am(ab(ip))if not aP(ip)then local nn=(aa.gift and ab(aa.gift)==ab(ip)and z()-aa.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cP,nn),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cP,nn),"bad"end return"sell",("selling %s (%s)"):format(cP,nn),"warn"
end if e.NoWax then return nil,("holding %s - no waxing on this account (it is given away)"):format(cP),"wait"end
if nm<1 then return nil,("holding %s - 0 free stations"):format(cP),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cP),"wait"end
return"place",("waxing %s (%d free)"):format(cP,nm),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local no=c.plot:FindFirstChild("CrateStand")if no then for L5,fz in ipairs(no:GetDescendants())do
if fz:IsA("ProximityPrompt")and fz.Enabled and kA(fz)then local bw=fz.ObjectText if bw==""then bw=c5(no,"TitleLabel")or""end
if bw~=""and M.wanted(bw)then local FV=gc(bw):gsub("crate$","")local vU for vV in pairs(ae.members)do if gc(vV)==FV then vU=vV end end
j.waiting,j.at,j.title,j.prompt=true,z(),bw,fz j.data={name=(bw:gsub("%s","")),rarity=vU,title=bw}D(bw.." found waiting on your stand")
end break end end end end local vW=M.wanted(j.data and j.data.name)or M.wanted(j.title)if e.Crates and(j.on or j.waiting)and vW then
local a3=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a3),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 D("could not press the "..a3 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a3),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a3),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a3,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a3),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a3,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a3,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil D("trying the "..a3 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a3),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a3,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not vW then local vX=j.title..tostring(j.rolledAt)if j.told~=vX then j.told=vX D(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and M.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if nm<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(vT,vT),"wait"
end local np=pz()if not np then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dB=cj()
if dB and qY(dB.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dB.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dB.name),"bad"end if not rh()then return nil,("%s rolled - waiting for it to land on the stand"):format(dB.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dB.name),"ok"end local bZ=kh()if bZ.state~="match"then
c.matchSince=nil if bZ.state=="skip"and not np.Enabled then return nil,bZ.text.." (sold out)","idle"end return nil,bZ.text,bZ.level
end if not np.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local dC=z()if dC<c.noCashUntil then
local vY,FW=ck()if vY then return nil,("cash short: have $%s, price ~$%s"):format(av(vY),av(FW)),"bad"end return nil,(ck()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
av(bj()),math.ceil(c.noCashUntil-dC)),ck()and"bad"or"wait"end if dC-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
do local vZ,v0=ck()if vZ then c.noCashUntil=dC+8 return nil,("cash short: have $%s, price %s - not buying"):format(av(vZ),v0==math.huge and"unreadable"or("~$"..av(v0))),"bad"
end end c.matchSince=c.matchSince or dC local v1=dC-c.matchSince if v1<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bZ.shown,v1),"ok"end
return"buy",("buying %s via %s"):format(bZ.shown,bZ.src),"ok"end d.DEPTH=11 function d.pinTick()local v2=d.hold
if not v2 then return end local nq=K.Character local nr=nq and nq:FindFirstChild("HumanoidRootPart")if not nr then return end
nr.CFrame=v2 nr.AssemblyLinearVelocity=Vector3 .new(0,0,0)for L6,iq in ipairs(nq:GetChildren())do if iq:IsA("BasePart")and iq.CanCollide then d.noclip[iq]=true iq.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(FX,v3)d.hold=FX if v3 then d.surface=v3 end end function d.unpin(FY)
if not d.hold then return end d.hold=nil for v4 in pairs(d.noclip)do pcall(function()if v4 .Parent then v4 .CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local v5=ar()if v5 and d.surface and not FY then aE(v5,d.surface.Position,d.surface.Position+d.surface.LookVector)
ah(0.1)end end function d.home()local bx,v6=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ar()
if not(bx and bx:IsA("BasePart")and v6)then return nil end local v7=pn()or bx.Position local ir=Vector3 .new(v7 .X-bx.Position.X,0,v7 .Z-bx.Position.Z)
ir=ir.Magnitude>0.1 and ir.Unit or Vector3 .new(0,0,1)local is=bx.Position+ir*6 local v8=gU(is.X,bx.Position.Y,is.Z,{bx})
return CFrame.new(is.X,(v8 and v8 .Y or bx.Position.Y)+db(v6),is.Z)end function d.ground(FZ,v9,F0)local ns,nt={K.Character},nil
for L7=1,12 do local nu=RaycastParams.new()nu.FilterType=Enum.RaycastFilterType.Exclude nu.FilterDescendantsInstances=ns
local it=ak:Raycast(Vector3 .new(FZ,v9,F0),Vector3 .new(0,-2000,0),nu)if not it then break end nt,v9=it,it.Position.Y-0.05
ns[#ns+1]=it.Instance end return nt and nt.Position.Y end function d.parkHome()local nv=d.home()if not nv then return false end
local dD=nv.Position local F1=d.ground(dD.X,dD.Y+300,dD.Z)or(dD.Y-3)d.pin(CFrame.new(dD.X,F1-8,dD.Z),nv)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(iu)e.Ghost,e.GhostHelps=iu==2,iu==1 if iu<2 then task.spawn(function()while c.busy do ah(0.1)end
if d.ghostMode()<2 and d.hold and not F.home then pcall(d.unpin)end end)end d.paintGhost()D("ghost: "..d.GHOST[iu][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local F2=ar()if not F2 or H.seat()then return end d.parkHome()end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.uid()local F3,F4=pcall(function()return K.UserId end)return F3 and F4 or 0 end function H.seat()local v_=ak:FindFirstChild("NightSeats")
if v_ then for L8,nw in ipairs(v_:GetChildren())do if nw.Name=="LogSeat"and nw:GetAttribute("Occupant")==H.uid()then return nw end
end end local wa=K.Character local wb=wa and wa:FindFirstChildOfClass("Humanoid")local nx=wb and wb.SeatPart return(nx and nx.Name=="LogSeat")and nx or nil
end function H.logs()local wc=ak:FindFirstChild("NightSeats")local ny,nz={},{}for L9,cQ in ipairs(wc and wc:GetChildren()or{})do
local nA=cQ.Name=="LogSeat"and cQ:FindFirstChildOfClass("ProximityPrompt")if nA then ny[#ny+1]=cQ local nB=cQ:GetAttribute("Occupant")
local F5=(nB~=nil and nB~=0 and nB~="")or(cQ:IsA("Seat")and cQ.Occupant~=nil)if not F5 and nA.Enabled then nz[#nz+1]={st=cQ,p=nA}end
end end return ny,nz end function H.due()if not(e.Campfire and c.running)or z()<H.nextAt then return false end
local F6=ak:FindFirstChild("NightSeats")if not F6 then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire now (weather events)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or z()H.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(K:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
D(H.msg)return false end end return true end function H.sit()local F7,fA=ak:FindFirstChild("NightSeats"),ar()
if not F7 or not fA then return end local iv,fB=H.logs()if#iv==0 then local F8=ak:FindFirstChild("NightCampfire")
local F9,nC=pcall(function()return F8:GetPivot().Position end)if not F9 then H.nextAt,H.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()K:RequestStreamAroundAsync(nC,3)end)aE(fA,nC+Vector3 .new(0,3,9),nC)ap(function()iv,fB=H.logs()return#iv>0 end,6)
if#iv==0 then H.nextAt,H.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local wd=fA.HumanoidRootPart.Position
if#fB==0 then H.nextAt,H.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fB,function(F_,Ga)return(F_.st.Position-wd).Magnitude<(Ga.st.Position-wd).Magnitude end)
local nD,Gb=fB[1].st,fB[1].p d.unpin(true)local dE=nD:IsA("BasePart")and nD.CFrame or CFrame.new(nD:GetPivot().Position)
aE(fA,dE.Position+dE.LookVector*2+Vector3 .new(0,2.5,0),dE.Position)ah(0.25)local Gc=ei(Gb,function()return H.seat()~=nil end)
if not Gc then aE(fA,dE.Position+Vector3 .new(0,2,0),dE.Position+dE.LookVector)ap(function()return H.seat()~=nil end,1.5)
end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,z()D(("SAT at the campfire (+%s%% cash)"):format(tostring(K:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=z()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then D(H.msg)end end end J.msg,J.nextAt,J.at,J.pulls,J.claims,J.pullLeft,J.collectLeft,J.events="",0,0,0,0,0,0,{}
function J.refresh()J.at=z()local nE=ag:FindFirstChild("Remotes")if not nE then return end local fC,nF,dF=0,0,{}
local Gd,we=pcall(function()return nE.ClanRequest:InvokeServer("state")end)local wf=Gd and type(we)=="table"and we.tasks
for L_,b0 in ipairs(wf and wf.list or{})do if not b0 .done and b0 .kind=="pull"then fC=math.max(fC,(b0 .goal or 0)-(b0 .progress or 0))end
if not b0 .done then dF[#dF+1]=("%s %d/%d"):format(tostring(b0 .text),b0 .progress or 0,b0 .goal or 0)end end
J.events={}for Ma,dG in ipairs(nE:GetChildren())do if dG:IsA("RemoteFunction")and dG.Name:match("^%u%a+Action$")and dG.Name~="CrateAction"and dG.Name~="AutoRollAction"then
local Ge,fD=pcall(function()return dG:InvokeServer("state")end)if Ge and type(fD)=="table"and fD.live==true and type(fD.quests)=="table"then
J.events[#J.events+1]={r=dG,st=fD}for Mb,aU in ipairs(fD.quests)do if not aU.done and aU.kind=="pull"then fC=math.max(fC,(aU.goal or 0)-(aU.progress or 0))end
if not aU.done and aU.kind=="collect"then nF=math.max(nF,(aU.goal or 0)-(aU.progress or 0))end if not aU.done then dF[#dF+1]=("%s %d/%d"):format(tostring(aU.text),aU.progress or 0,aU.goal or 0)end
end end end end J.pullLeft,J.collectLeft=fC,nF J.msg=#dF>0 and("open: "..table.concat(dF,", "))or"all quests done for today"
end function J.claim()for Mc,fE in ipairs(J.events)do local wg=fE.r.Name:gsub("Action$","")for Md,dH in ipairs(fE.st.quests)do
if dH.done and not dH.claimed then local Gf,wh=pcall(function()return fE.r:InvokeServer("claimQuest",dH.id)end)
if Gf and not(type(wh)=="table"and wh.ok==false)then J.claims=J.claims+1 D(("CLAIMED %s quest: %s (+%s)"):format(wg,tostring(dH.text),tostring(dH.points or dH.treats or"?")))
end ah(0.4)end end if fE.st.bonusReady==true then local Gg=pcall(function()return fE.r:InvokeServer("claimBonus")end)
if Gg then D(("CLAIMED %s daily quest bonus"):format(wg))end ah(0.4)end end end function J.tick()if not(e.Quests and c.running)then
if J.arPaused then J.resume("quests switched off")end return end if z()-J.at<(J.pullLeft>0 and 20 or 90)then return end
J.refresh()pcall(J.claim)if J.pullLeft<=0 and J.arPaused then J.resume("lever quests done")end end function J.pullDue()
return e.Quests and c.running and J.pullLeft>0 and z()>=J.nextAt and not E.busy end function J.lever()local wi=c.plot and c.plot:FindFirstChild("Lever")
local nG=wi and wi:FindFirstChild("Wheel")return nG and nG:FindFirstChildWhichIsA("ProximityPrompt"),nG end function J.resume(Gh)
J.arPaused=false if J.arWas then J.arWas=false e.AutoRoll=true task.spawn(E.apply,Gh)end end function J.pull()
local fF,nH=J.lever()if not fF or not nH or not nH:IsA("BasePart")then J.nextAt,J.msg=z()+300,"your lever was not found"return end
if not J.arPaused then J.arPaused=true J.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false E.apply("pulling the lever for a quest",true)
if E.isOn()then J.nextAt=z()+30 return end end D(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(J.pullLeft))
end if not fF.Enabled then J.nextAt=z()+1 return end cp(nH,fF)J.asked=nil if not(type(fireproximityprompt)=="function"and pcall(fireproximityprompt,fF))then qL(fF)end
J.pulls=J.pulls+1 J.pullLeft=J.pullLeft-1 ah(0.6)if J.asked then J.nextAt=z()+600 D(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(J.asked)))
J.resume("a butter the game wants kept is on the pad")return end J.nextAt=z()+2.5 if J.pullLeft<=0 then J.at=0 end
end F.skip,F.skipN,F.n,F.calls,F.fails,F.nextAt,F.msg,F.tries={},0,0,0,0,0,"off",{}function F.can(b1,Gi)local nI=b1:GetAttribute("PourOwner")
if type(nI)~="number"or nI==o.uid or not b1:GetAttribute("HasSquishy")then return false end if b1:GetAttribute("PourLong")~=true or b1:GetAttribute("PourFull")==true then return false end
local nJ=b1:GetAttribute("PourId")if nJ==nil or F.skip[nJ]then return false end local wj,nK,Gj=b1:GetAttribute("Helpers"),0,tostring(o.uid)
if type(wj)=="string"then for Gk in wj:gmatch("[^,%s]+")do nK=nK+1 if Gk==Gj then return false end end end if nK>=6 then return false end
local iw=A.left(b1)if not iw then local wk=tonumber(b1:GetAttribute("PourEnd"))iw=wk and(wk-Gi)end if not iw or iw<=75 then return false end
local nL=game:GetService("Players"):GetPlayerByUserId(nI)if not nL or nL:GetAttribute("WaxHelpOff")==true then return false end
return true,nL,nJ end function F.list()local nM,Gl={},o.srv()local wl=ak:FindFirstChild("Plots")for Me,wm in ipairs(wl and wl:GetChildren()or{})do
local wn=wm~=c.plot and wm:FindFirstChild("WaxStations")for Mf,nN in ipairs(wn and wn:GetChildren()or{})do local Gm,Gn,Go=F.can(nN,Gl)
local nO=Gm and nN:FindFirstChild("SquishyPlaceHolder")if nO and nO:IsA("BasePart")then nM[#nM+1]={st=nN,p=Gn,id=Go,part=nO}end
end end return nM end function F.due()local wo=(e.MemLimit or 0)>0 and math.floor(e.MemLimit*0.72)or 900 if e.Help and c.running and z()>=F.nextAt and(d.mem or 0)>wo then
F.nextAt,F.msg=z()+30,("paused - memory %d MB > %d MB (helps load other bases)"):format(d.mem,wo)return false
end return e.Help and c.running and z()>=F.nextAt end function F.skipIt(wp,wq)F.skip[wp],F.skipN=wq,F.skipN+1
if F.skipN>600 then F.skip,F.skipN,F.tries={[wp]=wq},1,{}end end function F.goHome()local ix,b2=ar(),F.home F.home=nil
if not(ix and b2)then return end if e.Ghost and not H.seat()then d.unpin(true)if not d.parkHome()then pcall(aE,ix,b2 .Position,b2 .Position+b2 .LookVector)end
elseif d.hold or(ix.HumanoidRootPart.Position-b2 .Position).Magnitude>20 then d.unpin(true)pcall(aE,ix,b2 .Position,b2 .Position+b2 .LookVector)
end end function F.step()local nP,fG=F.list(),ar()if#nP==0 or not fG then F.nextAt=z()+15 F.msg=("helped %d waxes here%s | none to help right now"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")
F.goHome()return end local wr=fG.HumanoidRootPart local ws=wr.Position table.sort(nP,function(Gp,Gq)return(Gp.part.Position-ws).Magnitude<(Gq.part.Position-ws).Magnitude end)
local a4=nP[1]F.home=F.home or(d.hold and d.surface)or wr.CFrame local b3=a4 .part local fH=(b3 .Position+a4 .st:GetPivot().Position)/2
local iy=F.tries[a4 .id]or 0 if(e.Ghost or e.GhostHelps)and iy==0 and not H.seat()then d.pin(b3 .CFrame,F.home)
else d.unpin(true)local nQ=iy==0 and gU(fH.X,b3 .Position.Y,fH.Z,{b3})if nQ and math.abs(nQ.Y-b3 .Position.Y)<8 then
aE(fG,Vector3 .new(fH.X,nQ.Y+db(fG),fH.Z),b3 .Position)else aE(fG,b3 .Position+Vector3 .new(0,b3 .Size.Y/2+3,0),fH)
end end ah(0.3)local fI=ag:FindFirstChild("Remotes")fI=fI and fI:FindFirstChild("ClanRequest")if not fI then F.nextAt,F.msg=z()+60,"the game's help remote is missing"return end
local iz,by=pcall(function()return fI:InvokeServer("help",a4 .st:GetAttribute("PourOwner"),tonumber(a4 .st.Name))end)
if iz and type(by)=="table"and by.ok then F.n,F.fails=F.n+1,0 F.skipIt(a4 .id,"helped")D(("HELPED %s's wax (station %s)"):format(a4 .p.DisplayName,a4 .st.Name))
F.msg=("helped %d waxes here%s"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")elseif iz and type(by)=="table"and tostring(by.reason or""):lower():find("walk up",1,true)and iy<2 then
F.tries[a4 .id]=iy+1 F.nextAt=z()+0.3 elseif iz and type(by)=="table"and tostring(by.reason or""):lower():find("moment",1,true)then
F.waits=(F.waits or 0)+1 F.nextAt=z()+1.6 else local wt=(iz and type(by)=="table"and tostring(by.reason or"refused"))or("error: "..tostring(by))
F.skipIt(a4 .id,wt)F.fails=F.fails+1 if F.fails<=3 then D(("help refused for %s's wax: %s"):format(a4 .p.DisplayName,wt))end
if F.fails>=5 then F.fails,F.nextAt,F.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
F.goHome()end end F.nextAt=math.max(F.nextAt,z()+1.2)end function F.onCall(bz)if not e.HelpGuild or type(bz)~="table"or bz.p~="help"or bz.mine or bz.u==o.uid or not bz.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fJ=ag:FindFirstChild("Remotes")
fJ=fJ and fJ:FindFirstChild("ClanRequest")if not fJ then return end local wu,fK=pcall(function()return fJ:InvokeServer("callHelp",bz.u)end)
local wv=tostring(bz.n or bz.un or bz.u)if wu and type(fK)=="table"and fK.ok then F.calls=F.calls+1 D(("HELPED guildmate %s's wax from here (their call)"):format(wv))
else D(("guild call from %s: %s"):format(wv,(wu and type(fK)=="table"and tostring(fK.reason or"refused"))or tostring(fK)))
end end)end local function au(Gr,ww,...)if c.busy then return end c.busy,c.busyText=true,Gr if d.hold and ww~=F.step then pcall(d.unpin)end
local Gs,wx=pcall(ww,...)c.busy,c.busyText=false,""if not Gs and wx~=jv then D("ERR "..tostring(wx))end end local function Gt()
if e.Campfire and H.seat()then if j.at and H.tickAt then j.at=j.at+(z()-H.tickAt)end H.tickAt=z()H.due()c.reason,c.level=H.msg,"ok"
return end H.tickAt=nil local aV,Gu,Gv=vS()c.reason,c.level=Gu,Gv if aV=="place"then au("waxing...",A.place)elseif aV=="crate"then au("opening crate...",et,true)
elseif aV=="cratesmart"then au("opening crate...",j.smart)elseif aV=="cratewin"then au("opening the crate window...",kC)
elseif aV=="nocrate"then au("discarding crate...",et,false)elseif aV=="cratedrop"then au("discarding a crate that would not open...",j.drop)
elseif aV=="sell"then au("selling...",vi)elseif aV=="buy"then au("buying...",qO,false)elseif not aV and not c.matchSince and P.due()then
au("grabbing a butter from the admin shower...",P.grab)elseif not aV and not c.matchSince and H.due()then au("sitting at the campfire...",H.sit)
elseif not aV and not c.matchSince and J.pullDue()and not ad()and not(cj()and aP(cj().name))then au("pulling the lever for a quest...",J.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(J.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
au("collecting money...",Fr)elseif not aV and not c.matchSince and F.due()then au("helping a wax...",F.step)elseif F.home and not e.Help then
au("coming back...",F.goHome)elseif not c.busy then d.parkTick()end end function fy(iA,Gw)if iA==c.running then return end
c.running=iA if not Gw then e.AutoStart=iA end if iA then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bE()or c.plot
D("START")else c.reason="stopped"D("STOP")end end do local b4=gD(ao.auto)if type(b4)=="string"then b4=b4:gsub("%s+$","")
if b4~=""then c.autoload=b4 local Gx=qk(b4)D(Gx and("loaded config "..b4)or("config "..b4 .." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local Gy={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local nR={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local af={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local wy,wz,wA,wB=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if wy and wz and wA and wB then af.x,af.b,af.m,af.r=wy,wz,wA,wB end end)pcall(function()local wC=Enum.Font.RobotoMono if wC then af.mono=wC end end)
local function L(Gz,GA,GB)local GC,nS=pcall(Instance.new,Gz)if not GC then c.uiErrs=c.uiErrs+1 return nil end
for GD,GE in pairs(GA)do if not pcall(function()nS[GD]=GE end)then c.uiErrs=c.uiErrs+1 end end nS.Parent=GB return nS
end local function W(GF,GG)L("UICorner",{CornerRadius=UDim.new(0,GG or 8)},GF)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(iB,nT)if iB and a.shown[iB]~=nT then a.shown[iB]=nT iB.Text=nT end
end function a.stroke(GH,GI,GJ)return L("UIStroke",{Color=GI or l.line,Thickness=1,Transparency=GJ or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},GH)
end function a.grad(GK,GL,GM,GN)local GO,wD=pcall(function()return ColorSequence.new(GL,GM)end)if GO and wD then return L("UIGradient",{Color=wD,Rotation=GN or 0},GK)end
end function a.pad(GP,wE,wF,GQ,GR)L("UIPadding",{PaddingLeft=UDim.new(0,wE or 0),PaddingTop=UDim.new(0,wF or 0),
PaddingRight=UDim.new(0,GQ or wE or 0),PaddingBottom=UDim.new(0,GR or wF or 0)},GP)end function a.list(GS,GT,GU)
return L("UIListLayout",{Padding=UDim.new(0,GT or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=GU and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},GS)
end function a.ink(nU)local GV,GW=pcall(function()return 0.299*nU.R+0.587*nU.G+0.114*nU.B end)return(GV and GW>0.55)and l.ink or l.text
end function a.nextIn(wG)local wH=(a.ord[wG]or 0)+1 a.ord[wG]=wH return wH end local nV=K:FindFirstChildOfClass("PlayerGui")or K:WaitForChild("PlayerGui")
local wI=nV:FindFirstChild("SABFarmGui")if wI then wI:Destroy()end local nW=L("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},nV)local T={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local iC=ak.CurrentCamera.ViewportSize if iC.X>100 and iC.Y>100 then T.w=math.clamp(math.floor(iC.X*0.48),320,400)
T.h=math.clamp(math.floor(iC.Y*0.86),250,360)end end)a.root=L("Frame",{Name="Root",Size=UDim2 .new(0,T.w,0,T.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},nW)
W(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local wJ=UDim2 .new(1,0,1,0)
local function Mg(wK,wL)return UDim2 .new(wK,0,0,0),UDim2 .new(wL,(wK+wL>0.99)and 0 or-4,1,0)end local function aj(GX,GY,fL,GZ,G0,G1)
local nX=L("TextButton",{Text=GY,Position=G0,Size=G1,BackgroundColor3=fL,BorderSizePixel=0,Font=af.b,TextSize=GZ,TextColor3=a.ink(fL),AutoButtonColor=true},GX)
W(nX,8)if fL==l.panel2 or fL==l.raise or fL==l.panel then a.stroke(nX,l.line,0.4)end return nX end local function iD(G2,G3,G4,G5,G6)
local iE=L("TextBox",{Text=G3,PlaceholderText=G4,Position=G5,Size=G6,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},G2)W(iE,8)a.stroke(iE,l.line,0)a.pad(iE,9,0,6,0)
return iE end local iF=ak.CurrentCamera local function G7()local G8,iG=pcall(function()return iF and iF.ViewportSize end)
if G8 and iG and iG.X>50 and iG.Y>50 then return iG end end local function b5(fM)local nY=G7()if not(nY and fM and fM.Parent)then return end
local G9=pcall(function()local iH,wM=fM.AbsolutePosition,fM.AbsoluteSize local nZ=70 local wN=math.clamp(iH.X,nZ-wM.X,nY.X-nZ)
local wO=math.clamp(iH.Y,0,nY.Y-math.min(wM.Y,nZ))if math.abs(wN-iH.X)>0.5 or math.abs(wO-iH.Y)>0.5 then fM.Position=UDim2 .new(0,math.floor(wN),0,math.floor(wO))
end end)return G9 end local function iI(G_)local Ha,n0=pcall(function()return G_.AbsolutePosition end)if Ha and n0 then return{math.floor(n0 .X),math.floor(n0 .Y)}end
end local dI={}c.dragMoved={}local function wP(fN,wQ,n1)V(fN.InputBegan:Connect(function(dJ)if dJ.UserInputType~=Enum.UserInputType.MouseButton1 and dJ.UserInputType~=Enum.UserInputType.Touch then return end
local n2={start=dJ.Position,from=wQ.Position,moved=0,target=wQ,input=dJ,onDrop=n1}dI[fN],c.dragMoved[fN]=n2,0
local n3 n3=dJ.Changed:Connect(function()if dJ.UserInputState==Enum.UserInputState.End and dI[fN]==n2 then dI[fN]=nil
if n3 then n3:Disconnect()end if n1 then n1(n2 .moved)end end end)end))end V(o6 .InputChanged:Connect(function(iJ)
if iJ.UserInputType~=Enum.UserInputType.MouseMovement and iJ.UserInputType~=Enum.UserInputType.Touch then return end
for Hb,bd in pairs(dI)do local n4=bd.target if n4 and n4 .Parent then local wR,wS=iJ.Position.X-bd.start.X,iJ.Position.Y-bd.start.Y
bd.moved=math.max(bd.moved,math.abs(wR)+math.abs(wS))c.dragMoved[Hb]=bd.moved n4 .Position=UDim2 .new(bd.from.X.Scale,bd.from.X.Offset+wR,bd.from.Y.Scale,bd.from.Y.Offset+wS)
end end end))V(o6 .InputEnded:Connect(function(iK)if iK.UserInputType~=Enum.UserInputType.MouseButton1 and iK.UserInputType~=Enum.UserInputType.Touch then return end
for Hc,iL in pairs(dI)do if iL.input==iK or iK.UserInputType==Enum.UserInputType.MouseButton1 then dI[Hc]=nil
if iL.onDrop then iL.onDrop(iL.moved)end end end end))local function Q(Hd,He,Hf,Hg,Hh,Hi,Hj)return L("TextLabel",{Text=He,Position=Hi or UDim2 .new(0,0,0,0),Size=Hj or wJ,BackgroundTransparency=1,
Font=Hh and af.b or af.m,TextSize=Hf,TextColor3=Hg,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Hd)
end function a.row(wT,Hk)return L("Frame",{Size=UDim2 .new(1,0,0,Hk),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(wT)},wT)end function a.card(wU,wV,wW)local dK=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(wU)},wU)W(dK,11)a.stroke(dK,l.line,0.25)a.list(dK,5)a.pad(dK,8,8,8,9)if wV then
local n5=a.row(dK,14)L("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},n5)Q(n5,wV:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if wW then local Hl=Q(n5,wW,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Hl.TextXAlignment=Enum.TextXAlignment.Right end end return dK end function a.heading(Hm,Hn,n6)local n7=a.row(Hm,n6 and 34 or 22)
Q(n7,Hn,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=af.x if n6 then Q(n7,n6,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return n7 end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(n8)local aN=a.sw[n8]if not aN then return end
local dL=tostring(n8 .Text or""):match(":%s*(.-)%s*$")or""local b6=dL~=""and not a.OFF[dL]local n9=not aN.chips and(dL=="ON"or dL=="OFF")
aN.pill.Visible,aN.chip.Visible=n9,not n9 if n9 then aN.pill.BackgroundColor3=b6 and l.accent or l.panel2 aN.knob.Position=b6 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aN.knob.BackgroundColor3=b6 and l.white or l.dim else aN.chip.Text=dL~=""and dL or"-"aN.chip.BackgroundColor3=b6 and l.accent or l.panel2
aN.chip.TextColor3=b6 and l.ink or l.dim end n8 .BackgroundColor3=b6 and l.lit or l.raise if aN.edge then aN.edge.Color=b6 and l.accent or l.line aN.edge.Transparency=b6 and 0.55 or 0.45 end
end function a.switch(wX,Ho,Hp,fO)local a5=L("TextButton",{Name="Switch",Text=Ho,TextTransparency=1,TextSize=8,Font=af.b,
Size=UDim2 .new(1,0,0,fO and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(wX)},wX)
W(a5,9)local ay={edge=a.stroke(a5,l.line,0.45)}ay.title=Q(a5,Hp,11,l.text,true,UDim2 .new(0,10,0,fO and 4 or 0),UDim2 .new(1,-100,0,fO and 15 or 28))
ay.title.TextWrapped,ay.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fO then ay.sub=Q(a5,fO,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
ay.sub.TextWrapped,ay.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end ay.pill=L("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a5)W(ay.pill,9)ay.knob=L("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},ay.pill)W(ay.knob,7)ay.chip=L("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=af.b,TextSize=9,TextColor3=l.dim,Text=""},a5)
W(ay.chip,9)a.pad(ay.chip,10,0,10,0)L("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},ay.chip)
ay.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a5]=ay V(a5:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a5)end))
a.skin(a5)return a5 end function a.chips(n_)if a.sw[n_]then a.sw[n_].chips=true a.skin(n_)end end function a.line(Hq,Hr)
local wY=a.row(Hq,15)local wZ=L("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Hr or l.dim,
BorderSizePixel=0},wY)W(wZ,3)local oa=Q(wY,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))oa.TextWrapped,oa.TextTruncate=false,Enum.TextTruncate.AtEnd
return oa,wZ end function a.grow(w0,Hs,Ht)local iM=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=af.m,TextSize=Hs or 10,TextColor3=Ht or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(w0)},w0)
V(iM:GetPropertyChangedSignal("Text"):Connect(function()iM.Visible=iM.Text~=""end))return iM end function a.note(Hu,Hv)
local w1=a.grow(Hu,9,l.dim)w1 .Text=Hv return w1 end function a.actions(Hw,w2)local Hx=a.row(Hw,28)local w3,ob={},#w2
for fP,w4 in ipairs(w2)do w3[fP]=aj(Hx,w4[1],w4[2]or l.panel2,10,UDim2 .new((fP-1)/ob,fP>1 and 3 or 0,0,0),UDim2 .new(1/ob,(fP>1 and-3 or 0)+(fP<ob and-3 or 0),1,0))
end return table.unpack(w3)end local function O(cR,iN,Hy,Hz)a.put(cR,iN and Hy or Hz)if not a.sw[cR]and a.lit[cR]~=iN then
a.lit[cR]=iN cR.BackgroundColor3=iN and l.accent or l.panel2 cR.TextColor3=a.ink(cR.BackgroundColor3)end end a.title=L("Frame",{Size=UDim2 .new(1,0,0,T.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
W(a.title,14)L("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
L("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local oc=L("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
W(oc,8)a.grad(oc,l.accent,l.accent2,45)local w5=Q(oc,"C",16,l.ink,true)w5 .Font,w5 .TextXAlignment=af.x,Enum.TextXAlignment.Center
local HA=Q(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))HA.Font=af.x Q(a.title,"butter farm  "..cc,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local HB=a.list(a.tabs,3)pcall(function()HB.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((T.h-T.head-12)/10)-3,20,34)local function be(HC,HD,HE)
local iO=L("TextButton",{Text=HC,Font=af.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)W(iO,9)local w6=L("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iO)W(w6,2)a.tabsAll[#a.tabsAll+1]={b=iO,bar=w6,name=HD,sub=HE}return iO end a.tabFarm=be("🏠","Home","what the farm is doing")
a.tabRun=be("🌾","Farm","the buy - wax - collect loop")a.tabBut=be("🧈","Butters","what gets bought and waxed")
a.tabCrt=be("📦","Crates","which crates get opened")a.tabPet=be("🐾","Pets","adopt, wish, fuse")a.tabTeam=be("👥","Teams","the right pets at the right moment")
a.tabSrv=be("🤝","Server","helping, campfire, ghost")a.tabAdm=be("⚡","Admin","admin abuse and its boosts")a.tabSet=be("⚙","Settings","configs, startup, performance")
a.tabAlt=be("🔗","Alts","several accounts working together")local function bf()local od=L("ScrollingFrame",{Position=UDim2 .new(0,T.rail,0,T.head+T.status+10),
Size=UDim2 .new(1,-T.rail,1,-(T.head+T.status+10)),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,
CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)
a.list(od,8)a.pad(od,8,2,10,12)return od end a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bf(),bf(),bf(),bf(),bf(),bf(),bf(),bf(),bf()
a.farm.Visible=true a.alt=bf()do local fQ=a.farm local w7=a.row(fQ,34)a.startB=aj(w7,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=af.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(w7,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local HF=a.row(fQ,44)local function fR(w8,HG,w9)local iP=L("Frame",{Position=UDim2 .new((w8-1)/w9,w8>1 and 2 or 0,0,0),Size=UDim2 .new(1/w9,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},HF)W(iP,9)a.stroke(iP,l.line,0.3)local iQ=Q(iP,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iQ.Font,iQ.TextXAlignment,iQ.TextWrapped=af.x,Enum.TextXAlignment.Center,false local HH=Q(iP,HG,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
HH.TextXAlignment=Enum.TextXAlignment.Center return iQ end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fR(1,"BOUGHT",5),fR(2,"WAXED",5),fR(3,"SOLD",5),fR(4,"MONEY",5),fR(5,"FREE",5)
local w_=a.card(fQ,"Right now")a.info=Q(a.row(w_,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=Q(a.row(w_,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fS=a.card(fQ,"Systems")
a.helpL=a.line(fS,l.info)a.campL=a.line(fS,l.accent2)a.questL=a.line(fS,l.good)a.arL=a.line(fS,l.accent)a.ixL=a.line(fS,nR.Dotonbori)
local xa=a.card(fQ,"Activity")a.log=L("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(xa)},xa)
W(a.log,7)a.pad(a.log,7,5,7,5)end local function Mh(HI,HJ)return a.row(HJ or a.farm,HI)end local an do local oe=a.run
a.heading(oe,"Farm","buy what rolls, wax it, collect the cash")local fT=a.card(oe,"Loop")a.colT=a.switch(fT,"COLLECT: ON","Collect cash","step on the collector by itself")
an=a.row(fT,26)Q(an,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=iD(an,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
Q(an,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fT,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fT,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fT,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local of=a.card(oe,"By hand")
a.buyB,a.plB=a.actions(of,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(of,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
an=a.row(of,28)a.padB=aj(an,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=Q(an,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iR=a.but a.heading(iR,"Butters","what gets bought and waxed")local xb=a.card(iR,"Strategy")a.ixT=a.switch(xb,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(xb,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iR)},iR)a.list(a.butList,5)end do local iS=a.crt a.heading(iS,"Crates","only ticked crates are opened")
local xc=a.card(iS,"Opening")a.crateT=a.switch(xc,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(xc,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iS)},iS)a.list(a.crtList,5)end do local fU=a.pet a.heading(fU,"Pets","adopt, wish, fuse Bigs and Huges")
local fV=a.card(fU,"Automatic")a.pbT=a.switch(fV,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fV,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fV,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fV,10,l.dim)a.note(fV,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local xd=a.card(fU,"The plan","best teams with every pet")a.planInfo=a.grow(xd,10,l.text)a.note(xd,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fU)},fU)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iT=a.srv a.heading(iT,"Server","other players, the campfire, staying hidden")
local og=a.card(iT,"Helping")a.helpT=a.switch(og,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(og,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(og,l.info)
local xe=a.card(iT,"Campfire")a.campT=a.switch(xe,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(xe,l.accent2)local oh=a.card(iT,"Ghost")a.ghostT=a.switch(oh,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(oh,l.dim)a.note(oh,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fW=a.adm a.heading(fW,"Admin abuse","the show, its boosts and the farm in it")local xf=a.card(fW,"When")
a.admBig=Q(a.row(xf,22),"-",15,l.text,true)a.admBig.Font=af.x a.admSub=Q(a.row(xf,14),"",10,l.dim,false)local HK=a.card(fW,"Boosts now")
a.admBoost=a.grow(HK,11,l.text)local oi=a.card(fW,"What the farm does")a.shT=a.switch(oi,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(oi,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(oi,l.accent)
local xg=a.card(fW,"Show feed")a.admFeed=L("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(xg)},xg)
W(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cS=a.set a.heading(cS,"Settings","kept on your phone, per config")
local iU=a.card(cS,"Config")an=a.row(iU,28)a.cfgName=iD(an,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=aj(an,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=aj(an,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
an=a.row(iU,26)a.cfgPrev=aj(an,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=aj(an,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=aj(an,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iU,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iU,10,l.dim)local oj=a.card(cS,"Starting")a.startT=a.switch(oj,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(oj,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(oj,9,l.dim)local ol=a.card(cS,"If the game drops me")
a.rejT=a.switch(ol,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(ol,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(ol,9,l.dim)local bA=a.card(cS,"Performance")a.pfCalm=a.switch(bA,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bA,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bA,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bA,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bA,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bA,"STOP 3D: OFF","Stop 3D","blank the world behind this window")an=a.row(bA,28)Q(an,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=iD(an,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))Q(an,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bA,l.good)a.note(bA,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local HL=a.card(cS,"Your game passes","read from the game")a.passInfo=a.grow(HL,10,l.text)local HM=a.card(cS,"About")
a.note(HM,"CHURN "..cc.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Mi,HN in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(HN)end local xh=L("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},nV)
a.tgRoot=L("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},xh)W(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=L("TextButton",{Text="C",Size=wJ,BackgroundTransparency=1,Font=af.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=L("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
W(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=L("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=af.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
W(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fX=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fX][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fX][2]
a.tgGhost.BackgroundColor3=fX==2 and l.accent or(fX==1 and l.warn or l.panel)a.tgGhost.TextColor3=fX>0 and l.ink or l.dim
end end local bB={built=false,boxes={},at=0}function a.check(iV,om)iV.Text=om and"✓"or""iV.BackgroundColor3=om and l.accent or l.bg
iV.TextColor3=l.ink local oo=iV.Parent if oo and oo:IsA("TextButton")then oo.BackgroundColor3=om and l.lit or l.raise end
end local function xi(xj,xk)e.Targets[xj]=xk or nil local xl=bB.boxes[xj]if xl then a.check(xl,xk)end end local function op()
for HO,HP in pairs(bB.boxes)do a.check(HP,e.Targets[HO]==true)end end function a.tickBox(HQ)local oq=L("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},HQ)W(oq,6)
a.stroke(oq,l.line,0)return oq end local fY local function HR()local HT=a.card(a.butList,"Butter list")local ot=a.row(HT,26)
a.butInfo=Q(ot,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local HU=aj(ot,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local HV=aj(ot,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))HU.MouseButton1Click:Connect(function()
for HW in pairs(e.Targets)do e.Targets[HW]=nil end op()end)HV.MouseButton1Click:Connect(function()ae.at=0 j6()
fY(true)end)end fY=function(HY)if not j6()then if not a.butEmpty then a.butEmpty=Q(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bB.built and not HY and bB.at==ae.at then return end for Mj,iW in ipairs(a.butList:GetChildren())do
if iW:IsA("Frame")or iW:IsA("TextButton")or iW:IsA("TextLabel")then iW:Destroy()end end bB.boxes,a.butEmpty={},nil
HR()for Mk,iX in ipairs(ae.rarOrder)do local ou=nR[iX]or l.text local cT=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)W(cT,11)a.stroke(cT,ou,0.7)a.list(cT,4)a.pad(cT,7,7,7,8)
local ov=a.row(cT,22)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=ou,BorderSizePixel=0},ov)
local HZ=Q(ov,iX:upper(),11,ou,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))HZ.Font=af.x local H0=aj(ov,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local H1=iX H0 .MouseButton1Click:Connect(function()local xm=ae.members[H1]or{}local xn=false for Ml,H2 in ipairs(xm)do if not e.Targets[H2]then xn=true break end end
for Mm,H3 in ipairs(xm)do xi(H3,xn)end end)for Mn,ow in ipairs(ae.members[iX]or{})do local iY=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cT)},cT)W(iY,8)local xo=Q(iY,am(ow),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
xo.TextWrapped,xo.TextTruncate=false,Enum.TextTruncate.AtEnd local xp=a.tickBox(iY)bB.boxes[ow]=xp local xq=ow
local function xr()xi(xq,not e.Targets[xq])end iY.MouseButton1Click:Connect(xr)xp.MouseButton1Click:Connect(xr)
end end op()bB.built,bB.at=true,ae.at end function M.paint()for H4,H5 in pairs(M.boxes)do a.check(H5,e.CrateTicks[H4]==true)end
if a.crtInfo then local ox,oy=0,0 for Mo in pairs(M.boxes)do ox=ox+1 end for Mp,H6 in pairs(e.CrateTicks)do if H6 then oy=oy+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(ox,oy))end if a.crateT then O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function M.build()for Mq,iZ in ipairs(a.crtList:GetChildren())do if iZ:IsA("Frame")or iZ:IsA("TextButton")or iZ:IsA("TextLabel")then iZ:Destroy()end
end M.boxes={}local oz=a.card(a.crtList,"All of them","worst first")local oA=a.row(oz,26)a.crtInfo=Q(oA,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local H7=aj(oA,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local H8=aj(oA,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
V(H7 .MouseButton1Click:Connect(function()e.CrateTicks={}M.paint()end))V(H8 .MouseButton1Click:Connect(function()M.build()end))
for Mr,bC in ipairs(M.list())do local xs=nR[bC.rar or""]or l.text local dM=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(oz)},oz)W(dM,8)L("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=xs,BorderSizePixel=0},dM)
local xt=Q(dM,(bC.title or bC.name)..(bC.guess and"  (?)"or""),11,xs,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
xt.TextWrapped,xt.TextTruncate=false,Enum.TextTruncate.AtEnd local H9=Q(dM,bC.price and("$"..av(bC.price))or(bC.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
H9 .TextXAlignment=Enum.TextXAlignment.Right local xu=a.tickBox(dM)M.boxes[bC.k]=xu local xv=bC.k local function xw()
e.CrateTicks[xv]=(not e.CrateTicks[xv])or nil M.paint()end V(dM.MouseButton1Click:Connect(xw))V(xu.MouseButton1Click:Connect(xw))
end M.built=M.at M.paint()end local xx="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set","alt"}
local function aW(cU)xx=cU for H_,oB in ipairs(a.tabKeys)do a[oB].Visible=(oB==cU)local i0=a.tabsAll[H_]if i0 then
local oC=oB==cU i0 .b.BackgroundTransparency,i0 .b.TextTransparency,i0 .bar.Visible=oC and 0 or 1,oC and 0 or 0.45,oC
end end if cU=="pet"and not o.built then pcall(o.build)end if cU=="team"and not A.built then pcall(A.build)end
if cU=="crt"and(M.built~=M.at or not next(M.boxes))then M.build()end if cU=="but"then fY(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(oD,xy,xz,xA)if xA then oD.Text=xA end oD.BackgroundColor3=xy and xz or l.bg oD.TextColor3=xy and a.ink(xz)or l.dim
end function o.paintRow(xC)local cV=o.rows and o.rows[xC]if not cV then return end local cW=e.Pets[xC]or{}local xD=tonumber(cW.f)==-1
a.flag(cV.b,cW.b,l.good)a.flag(cV.g,cW.g,l.accent,cW.g and"BIG"or"ANY")a.flag(cV.w,cW.w,l.warn)a.flag(cV.f,not xD,l.good,xD and"KEEP"or"AUTO")
if cV.row then cV.row.BackgroundColor3=(cW.b or cW.w)and l.lit or l.raise end end function o.flag(oE,i1)local bh=e.Pets[oE]or{}
if i1=="f"then bh.f=tonumber(bh.f)~=-1 and-1 or nil elseif bh[i1]then bh[i1]=nil else bh[i1]=true end e.Pets[oE]=(bh.b or bh.g or bh.w or bh.f)and bh or nil
o.paintRow(oE)end function o.paintAll()for Ia in pairs(o.rows or{})do o.paintRow(Ia)end if a.pbT then O(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
O(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")O(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(Ib)local xE=y.dreamT if not xE then return"working the plan out..."end local Ic,Ie=y.needFor(""),y.needFor("Big")
local cX={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(Ic,Ie,y.slots())}for Ms,xF in ipairs(y.dreamTeams or{})do cX[#cX+1]=xF.team:upper()..": "..table.concat(xF.names,", ")end
local i2,i3,i4=0,0,0 for xG,xH in pairs(xE)do local xI,If=y.have(xG,Ib)local Mt,Ig=y.goal(xG)i2=i2+math.max(0,xH.Huge-xI.Huge)
i3=i3+math.max(0,xH.Big-xI.Big)i4=i4+math.max(0,Ig-If)end cX[#cX+1]=(i2+i3+i4==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(i2,i3,i4)if y.fuseMsg~=""then cX[#cX+1]=y.fuseMsg end
return table.concat(cX,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local oF=o.wishes()local dN=o.data()for i5,oG in pairs(o.rows)do local xJ=y.status(i5,dN)oG.desc.Text=(oF[i5]and("wishing %dm | "):format(math.ceil(oF[i5]/60))or"")..(xJ and(xJ.." | ")or"")..oG.boostText
oG.desc.TextColor3=oF[i5]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dN))end local xK=tonumber(K:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dN and#(dN.pets or{})or 0,dN and tonumber(dN.maxOwned)or 60,
av(o.money()),xK>0 and(" | free wishes "..xK)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local i6=o.info()for Mu,i7 in ipairs(a.petList:GetChildren())do if i7:IsA("Frame")or i7:IsA("TextLabel")or i7:IsA("TextButton")then i7:Destroy()end
end o.rows={}if not i6 then Q(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dO={}for Mv,xL in ipairs(o.order())do local oH=i6 .Pets[xL].rarity or"?"dO[oH]=dO[oH]or{}
table.insert(dO[oH],xL)end local dP={}for Mw,xM in ipairs(i6 .Rarities or{})do if dO[xM]then dP[#dP+1]=xM end end
for xN in pairs(dO)do if not table.find(dP,xN)then dP[#dP+1]=xN end end for Mx,oI in ipairs(dP)do local i8=o.RC[oI]or l.text
local cY=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
W(cY,11)a.stroke(cY,i8,0.7)a.list(cY,4)a.pad(cY,7,7,7,8)local xO=a.row(cY,18)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=i8,BorderSizePixel=0},xO)
local Ih=Q(xO,oI:upper(),11,i8,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Ih.Font=af.x for My,i9 in ipairs(dO[oI])do
local fZ=L("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cY)},cY)
W(fZ,8)local oJ=Q(fZ,o.nice(i9),11,i8,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))oJ.TextWrapped,oJ.TextTruncate=false,Enum.TextTruncate.AtEnd
local Ii,Ij=pcall(function()return i6 .describe(i9)end)local xP=Ii and tostring(Ij)or""local oK=Q(fZ,xP,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oK.TextYAlignment,oK.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function i_(Ik,Il,Im)
local xQ=aj(fZ,Ik,l.bg,8,UDim2 .new(1,Il,0,5),UDim2 .new(0,Im,0,22))xQ.AutoButtonColor=true return xQ end local xR,xS,xT,xU=i_("BUY",-164,30),i_("ANY",-131,30),i_("WISH",-98,34),i_("AUTO",-61,56)
local ja=i9 xR.MouseButton1Click:Connect(function()o.flag(ja,"b")end)xS.MouseButton1Click:Connect(function()o.flag(ja,"g")end)
xT.MouseButton1Click:Connect(function()o.flag(ja,"w")end)xU.MouseButton1Click:Connect(function()o.flag(ja,"f")end)
o.rows[i9]={b=xR,g=xS,w=xT,f=xU,name=oJ,desc=oK,boostText=xP,row=fZ}end end o.built=true o.paintAll()end function d.paint()
O(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")O(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
O(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")O(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
O(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])O(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end V(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
V(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))V(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
V(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))V(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
V(a.pfFps.MouseButton1Click:Connect(function()local In=table.find(d.CAPS,e.FpsCap or 0)or 1 local xV=d.CAPS[(In%#d.CAPS)+1]
if not d.cap(xV)and xV~=0 then D("this executor cannot cap fps")end d.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()
local oL=tonumber(a.pfMem.Text)if oL and oL>=0 then e.MemLimit=math.floor(oL)end d.paint()end))function A.names()
local oM={"(none)"}for Mz,Io in ipairs((A.teams()))do oM[#oM+1]=Io.name end return oM end function A.cycle(oN,Ip)
local jb=A.names()local Iq=e[oN]~=""and e[oN]or"(none)"local jc=table.find(jb,Iq)or 1 jc=((jc-1+Ip)%#jb)+1 e[oN]=jb[jc]=="(none)"and""or jb[jc]
A.paint()end function A.paint()if not A.built then return end O(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
O(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oO={}for MA,Ir in ipairs((A.teams()))do oO[Ir.name]=true end
for Is,xW in pairs(A.pick)do local dQ=e[Is]xW.Text=dQ==""and"(none)"or(oO[dQ]and dQ or(dQ.." (missing)"))xW.TextColor3=(dQ~=""and not oO[dQ])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local It,jd=o.srv(),{}for MB,je in ipairs(A.list or{})do jd[#jd+1]=("st %-2s %-22s %9s  helps %d"):format(je.st.Name,am(ab(je.name)):sub(1,22),A.clock(je.ends-It),je.helps)
end a.tmList.Text=#jd>0 and table.concat(jd,"\n")or"no waxes running"end function A.build()for MC,jf in ipairs(a.teamList:GetChildren())do
if jf:IsA("Frame")or jf:IsA("TextLabel")or jf:IsA("TextButton")then jf:Destroy()end end A.pick={}local jg=a.card(a.teamList,"Automatic")
a.tmT=a.switch(jg,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(jg,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(jg,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local Iu,Iv=pcall(y.rebuild,"you asked")if not Iu then D("BUILD ERR "..tostring(Iv))end end)
end)a.tmInfo=a.grow(jg,10,l.dim)local xX=a.card(a.teamList,"Which team when")local function jh(ji,Iw,Ix)local f0=a.row(xX,54)
Q(f0,Iw,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local xY=Q(f0,Ix,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
xY.TextWrapped,xY.TextTruncate=false,Enum.TextTruncate.AtEnd local Iy=aj(f0,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local xZ=aj(f0,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local Iz=aj(f0,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
Iy.MouseButton1Click:Connect(function()A.cycle(ji,-1)end)Iz.MouseButton1Click:Connect(function()A.cycle(ji,1)end)
xZ.MouseButton1Click:Connect(function()A.cycle(ji,1)end)A.pick[ji]=xZ end jh("TeamNormal","Normal","the rest of the time: money + luck")
jh("TeamFull","Full","every station busy: money + wax speed")jh("TeamGlaze","Glaze","worn just before a wax finishes")
local jj=a.row(xX,26)Q(jj,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=iD(jj,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
Q(jj,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local IA=aj(jj,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
IA.MouseButton1Click:Connect(function()local jk=tonumber(a.tmLead.Text)if jk and jk>=5 and jk<=600 then e.GlazeLead=math.floor(jk)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)jh("TeamWax","Wax","while a butter is placed: head starts")local x0=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(x0)},x0)W(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local IB=a.card(a.teamList,"How it works")a.note(IB,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function IC()a.secB.Text=tostring(e.Every)O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ah(0.1)end if not F.home then pcall(d.unpin)end end)end
O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fy(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b5(a.root)b5(a.tgRoot)c.lastCollect=z()
op()M.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function ID(x1)task.spawn(function()x1 .TextColor3=l.bad
task.wait(0.8)if c.alive then x1 .TextColor3=l.text end end)end local function x2()local x3=a.secB.Text:match("^%s*(%d+)%s*$")
local f1=x3 and tonumber(x3)if not f1 or f1<1 then a.secB.Text=tostring(e.Every)ID(a.secB)D("interval must be a whole number >= 1")
return end if f1==e.Every then return end e.Every,c.lastCollect=f1,z()D("collect every "..f1 .."s")end local function N(IE,IF)V(IE.MouseButton1Click:Connect(IF))end
N(a.secSet,x2)V(a.secB.FocusLost:Connect(x2))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(au,"selling...",vi)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(E.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help F.nextAt,F.msg=0,e.Help and"looking for waxes to help"or"off"O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests J.at=0 O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire H.nextAt,H.fails,H.lost=0,0,0 O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()O(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")O(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
O(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
O(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")O(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(IG)task.spawn(function()pcall(q.tick)if IG and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local IH=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(IH)end)
N(a.bestT,function()local II=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(II)end)N(a.bcT,function()
local IJ=q.on()e.BestCrate=not e.BestCrate q.changed(IJ)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b7=o.srv()local b8 pcall(function()q.aac=q.aac or require(ag:FindFirstChild("AdminAbuseClient"))
b8=q.aac:GetState()end)local dR,b9="nothing scheduled","the game has not announced one"if type(b8)=="table"then
local f2,a6,b_=tostring(b8 .Phase or""),tonumber(b8 .StartsAt),tonumber(b8 .EndsAt)if a6 and a6<1e9 then a6=nil end
if b_ and b_<1e9 then b_=nil end if f2=="Countdown"and a6 then dR,b9="starts in "..A.clock(a6-b7),os.date("%a %H:%M",math.floor(a6)).." your time"
elseif f2=="Live"and b_ then dR,b9="LIVE  -  "..A.clock(b_-b7).." left","the farm is grabbing, waxing and glazing through it"
elseif f2~=""and f2~="Idle"and b_ and b_>b7 then dR,b9=f2:lower().."  -  "..A.clock(b_-b7).." left","after the show"
elseif a6 and a6>b7 then dR,b9="next: "..os.date("%a %H:%M",math.floor(a6)),"your time"elseif a6 then dR,b9="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a6)).." your time"
end if type(b8 .Kind)=="string"and b8 .Kind~=""then b9=b9 .."  |  "..b8 .Kind end end a.put(a.admBig,dR)a.put(a.admSub,b9)
local dS,oP={},ag:FindFirstChild("AdminShow")if oP then local IK,IL=pcall(function()return oP:GetAttributes()end)
for x4,dT in pairs(IK and IL or{})do local jl=type(x4)=="string"and x4:match("^(.-)Mult$")local oQ=jl and tonumber(oP:GetAttribute(jl.."Until"))
if jl and type(dT)=="number"and dT~=1 and dT~=0 and oQ and oQ>b7 then dS[#dS+1]=("%s  x%s   %s left"):format(jl:gsub("(%l)(%u)","%1 %2"),(dT%1==0)and tostring(dT)or("%.2f"):format(dT),
A.clock(oQ-b7))end end end table.sort(dS)a.put(a.admBoost,#dS>0 and table.concat(dS,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dS>0 and l.accent or l.dim local jm=0 for MD in pairs(P.drops)do jm=jm+1 end local x5=q.snapAt and(q.snapAt-b7)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(P.got,P.miss,jm>0 and(", "..jm.." falling")or"",
x5 and("in "..math.max(0,math.floor(x5)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(au,"opening crate...",et,true)end)N(a.padB,function()c.plot=bE()or c.plot local x6,oR=ar(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(x6 and oR and oR:IsA("BasePart"))then D("SET PAD: need character and plot")return end c.manualPad=oR.CFrame:ToObjectSpace(x6 .HumanoidRootPart.CFrame)
Fh(c.manualPad)D("collect pad saved at your position")end)N(a.startB,function()fy(not c.running)end)N(a.buyB,function()
c.plot=bE()or c.plot task.spawn(au,"buying (manual)...",qO,true)end)N(a.plB,function()c.plot=bE()or c.plot task.spawn(au,"waxing (manual)...",qU)
end)N(a.tabFarm,function()aW("farm")end)N(a.tabRun,function()aW("run")end)N(a.tabSrv,function()aW("srv")end)N(a.tabAdm,function()aW("adm")end)
N(a.tabBut,function()aW("but")end)N(a.tabSet,function()aW("set")end)N(a.tabCrt,function()aW("crt")end)N(a.tabPet,function()aW("pet")end)
N(a.tabTeam,function()aW("team")end)N(a.tabAlt,function()aW("alt")if type(a.altShown)=="function"then pcall(a.altShown)end end)
a.mk,a.lbl,a.button,a.round,a.C,a.FT,a.click=L,Q,aj,W,l,af,N do local IM=a.card(a.alt,"Alts","several accounts in one server")
a.altNote=Q(a.row(IM,40),"The team module is not running on this account. Load the farm with altboot.lua to use it.",10,l.dim,false)
a.altNote.TextWrapped,a.altNote.TextYAlignment=true,Enum.TextYAlignment.Top end local function IN(oS)c.hidden=oS
a.root.Visible=not oS a.tgBtn.TextColor3=oS and l.text or l.ink end wP(a.tgBtn,a.tgRoot,function()b5(a.tgRoot)
c.togPos=iI(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then IN(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aO,aA={},0 local function ca()aO=qa()if#aO==0 then a.cfgPick.Text="(none saved)"
aA=0 return end if aA<1 or aA>#aO then aA=1 end a.cfgPick.Text=aO[aA]..("  (%d/%d)"):format(aA,#aO)end local function x7()
local x8=c.autoload~=nil a.cfgAuto.Text=x8 and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=x8 and l.accent or l.panel2
end local function oT()local x9=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if x9~=""then return x9 end return(aA>0 and aO[aA])or""
end N(a.cfgSave,function()c.winPos=iI(a.root)or c.winPos c.togPos=iI(a.tgRoot)or c.togPos local x_,ya=gK(oT())
a.cfgMsg.Text=x_ and("saved as "..ya)or("could not save: "..ya)a.cfgMsg.TextColor3=x_ and l.good or l.bad ca()
D(a.cfgMsg.Text)end)local function IO(oU)local oV,yb=qk(oU)a.cfgMsg.Text=oV and("loaded "..yb)or("could not load: "..yb)
a.cfgMsg.TextColor3=oV and l.good or l.bad if oV then a.cfgName.Text=oU IC()task.spawn(E.apply,"config "..oU)
end D(a.cfgMsg.Text)end N(a.cfgLoad,function()IO(oT())end)N(a.cfgPick,function()ca()if aA>0 then a.cfgName.Text=aO[aA]end
end)N(a.cfgPrev,function()if#aO==0 then ca()return end aA=(aA-2)%#aO+1 ca()a.cfgName.Text=aO[aA]end)N(a.cfgNext,function()
if#aO==0 then ca()return end aA=aA%#aO+1 ca()a.cfgName.Text=aO[aA]end)N(a.cfgAuto,function()if c.autoload then
qm(nil)a.cfgMsg.Text="it will not load a config on launch"else local f3=oT()local yc=false for ME,IP in ipairs(qa())do if IP==f3 then yc=true end end
local IQ=yc or gK(f3)if IQ and f3~=""then qm(f3)ca()a.cfgMsg.Text=f3 .." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim x7()end)N(a.autoB,function()
local yd,ye=Ac()a.autoMsg.Text=yd and("installed. "..ye)or("failed: "..ye)a.autoMsg.TextColor3=yd and l.good or l.bad
D(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()ec("you asked")end)
local bi=false N(a.minB,function()bi=not bi a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bi,not bi,not bi
if bi then for MF,IR in ipairs(a.tabKeys)do a[IR].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,T.head+6),UDim2 .new(1,-16,0,T.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,T.rail+8,0,T.head+6),UDim2 .new(1,-(T.rail+16),0,T.status)aW(xx)
end a.root.Size=UDim2 .new(0,T.w,0,bi and(T.head+T.status+12)or T.h)a.minB.Text=bi and"+"or"-"end)local function jn()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(gj)for MG,IS in ipairs(jw)do pcall(function()IS:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end if c.hidPurchaseApp then pcall(function()c.hidPurchaseApp.Enabled=true end)end
pcall(function()nW:Destroy()end)pcall(function()xh:Destroy()end)if c1 .SAB_KILL==jn then c1 .SAB_KILL=nil end
end c1 .SAB_KILL=jn N(a.killB,jn)N(a.xB,jn)wP(a.title,a.root,function()b5(a.root)c.winPos=iI(a.root)or c.winPos
end)local function yf()local f4,cZ=c.reason,c.level if c.busy then f4,cZ=c.busyText,"ok"elseif not c.running then
local MH,yg,IT=vS()if c.capHit then f4,cZ=yg,"bad"else f4,cZ="[stopped] "..yg,(IT=="bad")and"bad"or"idle"end c.reason,c.level=f4,cZ
end local dU=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dU then a.lit.dot=dU a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dU,dU,dU,dU
a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,f4)if a.lit.bar~=cZ then a.lit.bar=cZ a.bar.BackgroundColor3=Gy[cZ]or l.dim end
if bi then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local cb=zN()if a.farm.Visible then local IU,IV=gg()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,IU.."/"..IV)local yh=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local yi=ad()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
av(bj()),c.rolls,c.gifts,c.crates,yi and am(ab(yi))or"nothing",j.on and("   ["..j.title.." window open]")or"",
yh and("in "..yh.."s")or"off"))a.put(a.tgt,(#cb==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#cb<=3)and table.concat(cb,", ")or(#cb.." butters ticked"))))
if a.lit.tgt~=(#cb==0)then a.lit.tgt=(#cb==0)a.tgt.TextColor3=(#cb==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(ga,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and F.msg or"helping is off")a.put(a.srvCamp,e.Campfire and H.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ae.n,#ae.rarOrder,#cb))
end if a.but.Visible and bB.at~=ae.at then fY(false)end if a.crt.Visible then if M.built~=M.at then M.build()else M.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and F.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and H.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(J.msg~=""and J.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local yj=(E.rec.on and"on"or"")..(E.rec.off and((E.rec.on and"/"or"").."off")or"")
a.put(a.arL,E.msg~=""and E.msg or("auto roll  %s | knows %s%s"):format(E.isOn()and"running"or"stopped",yj~=""and yj or"nothing yet",#E.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(E.msg~="")then a.lit.arL=(E.msg~="")a.arL.TextColor3=E.msg~=""and l.warn or l.dim end end end c1 .SAB={S=c,CFG=e,EV=aa,U=a,sg=nW,CAT=ae,LEARN=al,buildList=fY,
logAll=dW,evAll=dX,AR=E,CR=M,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=F,CF=H,QX=J,IX=q,SH=P}D(cc.." loaded")if c.uiErrs>0 then D("UI: "..c.uiErrs.." properties skipped")end
aW("farm")b5(a.root)b5(a.tgRoot)if iF then pcall(function()V(iF:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)b5(a.root)b5(a.tgRoot)end))end)end ca()x7()if c.config and c.config~=""then a.cfgName.Text=c.config end
O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(yf)task.spawn(function()local yk=Aa()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(yk and("\n(backup: "..yk..")")or"")
local yl=gD(ao.exec)if yl and not yl:find("SAB autoloader v2",1,true)then d_(ao.exec,ao.stub)D("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(gD(ao.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(Ai)end)task.spawn(function()while c.alive do local IW,IY=pcall(yf)if not IW then D("UI ERR "..tostring(IY))end
task.wait((c.hidden or bi)and 1.5 or 0.4)end end)task.spawn(function()local IZ,I0=pcall(Aq)if not IZ then D("HOOK ERR "..tostring(I0))end
end)task.spawn(function()pcall(y_)if j.loadSeq and not j.learned then local jo={}for ym=1,20 do if j.loadSeq[ym]then jo[#jo+1]=j.loadSeq[ym]end end
if#jo>0 then j.learned={seq=jo,mode=j.loadMode}D("remembered how to open crates directly")end end if j6()then D(("catalog: %d butters in %d rarities"):format(ae.n,#ae.rarOrder))end
local I1,yn=pcall(Fj)if I1 and yn and c.alive and not c.manualPad then c.manualPad=yn end end)task.spawn(function()
while c.alive do local oW,oX=pcall(o.buyTick)if not oW then D("PET ERR "..tostring(oX))task.wait(5)end oW,oX=pcall(o.wishTick)
if not oW then D("WISH ERR "..tostring(oX))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local jp,yo=0,z()
V(game:GetService("RunService").Heartbeat:Connect(function()jp=jp+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
V(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local yp=z()d.fps,jp,yo=jp/math.max(yp-yo,0.001),0,yp local I2,I3=pcall(d.tick)if not I2 then D("PERF ERR "..tostring(I3))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local I4,I5=pcall(y.tick)if not I4 then D("FUSE ERR "..tostring(I5))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local I6,I7=pcall(A.tick)if not I6 then D("TEAM ERR "..tostring(I7))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local jq=ag:WaitForChild("Remotes",30)local yq=jq and jq:WaitForChild("ClanEvent",30)
if yq and c.alive then V(yq.OnClientEvent:Connect(function(I8,I9)if I8=="call"then pcall(F.onCall,I9)end end))
end local yr=jq and jq:FindFirstChild("RollConfirmAsk")if yr and c.alive then V(yr.OnClientEvent:Connect(function(I_)J.asked=I_ or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)pcall(d.walkPatch,true)end
end end)task.spawn(function()local oY=ag:WaitForChild("Remotes",30)if not(oY and c.alive)then return end local function jr(Ja,Jb)
local oZ=oY:FindFirstChild(Ja)if oZ and oZ:IsA("RemoteEvent")then V(oZ.OnClientEvent:Connect(function(...)pcall(Jb,...)end))end
end jr("NewSquishyDiscovered",function(o0,ys)if type(o0)~="string"then return end q.disc=q.disc or{}q.disc[ab(o0)]=true
D(("INDEX: %s%s is in your Index now"):format(am(ab(o0)),ys and(" ("..tostring(ys)..")")or""))end)jr("IndexRefresh",q.loadDisc)
jr("IndexRowComplete",function(Jc)D("INDEX: the whole "..tostring(Jc).." row is complete")end)jr("AdminShow",q.admin)
local yt=oY:FindFirstChild("AdminShowSync")if yt then local Jd,yu=pcall(function()return yt:InvokeServer()end)
if Jd and type(yu)=="table"then for MI,Je in pairs(yu)do pcall(P.add,Je)end end end while c.alive do local Jf,Jg=pcall(q.tick)
if not Jf then q.msg="index error: "..tostring(Jg)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Jh,Ji=pcall(J.tick)if not Jh then D("QUEST ERR "..tostring(Ji))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(gj)end end)pcall(E.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Jk=(type(newcclosure)=="function")and newcclosure or function(Jj)return Jj end local o1
local yv=(type(setnamecallmethod)=="function")and setnamecallmethod or nil o1=hookmetamethod(game,"__namecall",Jk(function(yw,...)
local f5=getnamecallmethod()if c.alive and(f5=="InvokeServer"or f5=="FireServer")then local yx,yy=pcall(function()return yw.Name end)
if yx and yy=="CrateAction"and not j.replaying then pcall(j.saw,f5,...)elseif yx and yy=="AutoRollAction"and not E.replaying then pcall(E.saw,f5,...)end
if yv then yv(f5)end end return o1(yw,...)end))j.oldNC=o1 end)end pcall(function()local f6=getgenv and getgenv()or _G
c.robuxBlocked=0 f6 .SAB_NOROBUX=f6 .SAB_NOROBUX or{n=0,last=""}if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
local bD=f6 .SAB_NOROBUX local c0=game:GetService("MarketplaceService")local Jl={PromptGift=true,PromptLimitedSquishy=true,PromptMultMoneyGamepass=true,PromptServerLuck=true,
PromptShopCrate=true,PromptTimeSkip=true,PromptDoubleOfflineEarnings=true,FinishWaxOffer=true}pcall(function()
local Jn=(type(newcclosure)=="function")and newcclosure or function(Jm)return Jm end local yz yz=hookmetamethod(game,"__namecall",Jn(function(o2,...)
local f7=getnamecallmethod()if c.alive and o2==c0 and type(f7)=="string"and f7:sub(1,6)=="Prompt"then bD.n,bD.last=bD.n+1,f7
return nil end if f7=="FireServer"or f7=="InvokeServer"then local Jo,yA=pcall(function()return o2 .Name end)if Jo and Jl[yA]and c.alive then
bD.n,bD.last=bD.n+1,yA return nil end end return yz(o2,...)end))end)local function f8(yB,Jp)pcall(function()V(c0[yB]:Connect(function(Jq,Jr)
bD.n,bD.last=bD.n+1,yB pcall(Jp,Jq,Jr)end))end)end f8("PromptProductPurchaseRequested",function(o3,Js)c0:SignalPromptProductPurchaseFinished(typeof(o3)=="Instance"and o3 .UserId or o3,Js,false)
end)f8("PromptGamePassPurchaseRequested",function(Jt,Ju)c0:SignalPromptGamePassPurchaseFinished(Jt,Ju,false)end)
f8("PromptPurchaseRequested",function(Jv,Jw)c0:SignalPromptPurchaseFinished(Jv,Jw,false)end)f8("PromptBundlePurchaseRequested",function(Jx,Jy)c0:SignalPromptBundlePurchaseFinished(Jx,Jy,false)end)
f8("PromptPremiumPurchaseRequested",function()c0:SignalPromptPremiumPurchaseFinished(false)end)end local function yC()
local Jz,JA=pcall(function()local f9=game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp")if f9 and f9:IsA("ScreenGui")then
c.hidPurchaseApp=f9 if f9 .Enabled then f9 .Enabled=false end end end)if not Jz then c.hideErr=tostring(JA)end
end yC()task.spawn(function()local yD=f6 .SAB_NOROBUX.n while c.alive do task.wait(5)yC()local dV=f6 .SAB_NOROBUX
if dV and dV.n>yD then c.robuxBlocked,yD=dV.n,dV.n D(("ROBUX PROMPT BLOCKED (%s) - %d so far"):format(dV.last,dV.n))
end end end)end)if ju then V(K.Idled:Connect(function()pcall(function()ju:CaptureController()ju:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for MJ=1,90 do if not c.alive then return end if K:GetAttribute("AutoRollOn")~=nil and ar()and(c.plot or bE())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then E.apply("joined")end while c.alive do task.wait(30)local js=cj()
if js and q.on()and not aP(js.name)then js=nil end if c.alive and e.AutoRoll and c.running and not E.isOn()and not js and not ad()
and not j.waiting and not j.on and not c.busy then E.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for MK=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bE()if ar()and c.plot and q.any()then fy(true,true)D("started by itself")
return end task.wait(1)end if c.alive and not c.running then D("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bE()c.lastCollect=z()while c.alive do if c.running then local JB,yE=pcall(Gt)if not JB and yE~=jv then D("LOOP ERR "..tostring(yE))end
end task.wait(0.1)end end)jt("ready - the window is at the top left")end local JD,o4=xpcall(yI,function(JC)return tostring(JC).."\n"..debug.traceback()end)
if not JD then pcall(function()warn("SAB "..cc.." ERROR: "..tostring(o4))end)jt("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cc.." ERROR: "..tostring(o4))end)pcall(function()local yF=(type(getgenv)=="function"and getgenv())or _G
if type(yF.SAB_KILL)=="function"then yF.SAB_KILL()end for ML,JE in ipairs({"SABFarmGui","SABToggle"})do local yG=K.PlayerGui:FindFirstChild(JE)
if yG then yG:Destroy()end end end)pcall(function()local f_=Instance.new("ScreenGui")f_.Name="SABError"f_.ResetOnSpawn=false
f_.DisplayOrder=1000 local a7=Instance.new("TextBox")a7 .Size=UDim2 .new(0,340,0,170)a7 .Position=UDim2 .new(0,10,0,50)
a7 .BackgroundColor3=Color3 .fromRGB(90,20,20)a7 .TextColor3=Color3 .new(1,1,1)a7 .TextSize=11 a7 .TextWrapped=true
a7 .ClearTextOnFocus=false a7 .TextXAlignment=Enum.TextXAlignment.Left a7 .TextYAlignment=Enum.TextYAlignment.Top
a7 .Text="SAB "..cc.." failed to start. Send this text:\n"..tostring(o4)a7 .Parent=f_ f_.Parent=K:WaitForChild("PlayerGui")
end)end
