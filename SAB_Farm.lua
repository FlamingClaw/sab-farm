local cd="v28"local pb=game:GetService("Players")local K=pb.LocalPlayer or pb.PlayerAdded:Wait()local function jx(yO)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..cd,Text=yO,Duration=6})
end)end jx("script started")local function yP()local ag=game:GetService("ReplicatedStorage")local ak=game:GetService("Workspace")
local pc=game:GetService("UserInputService")local c1=(type(getgenv)=="function"and getgenv())or _G if type(c1 .SAB_KILL)=="function"then pcall(c1 .SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jy=(function()local yQ,yR=pcall(function()return game:GetService("VirtualUser")end)return yQ and yR or nil end)()
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
local o,A,d,y,F,H,J={},{},{},{},{},{},{}local q,P={},{}local jz={}local jA,ge,dZ,d0={},{},{},{}local function V(pd)jA[#jA+1]=pd return pd end
local function ah(yS)task.wait(yS)if not c.alive then error(jz,0)end end local function D(gf)gf=os.date("%H:%M:%S").." "..tostring(gf)
table.insert(ge,1,gf)if#ge>6 then table.remove(ge)end c.logN=(c.logN or 0)+1 dZ[#dZ+1]=gf if#dZ>80 then table.remove(dZ,1)end
end local function gg(pe)if type(pe)~="string"then return""end return(pe:lower():gsub("[^%w]",""))end local function W(yT)
local pf=gg(yT)local jB=pf:gsub("butter$","")if jB==""then jB=pf end return jB end local function aP(jC)if type(jC)~="string"then return false end
local jD=W(jC)if jD==""then return false end if q.isLimited and q.isLimited(jC)then return q.limitedHere()end
if q.want then return q.want(jD)end return e.Targets[jD]==true end local function yU(d1)d1=d1:lower()return d1:find("squishy",1,true)~=nil or d1:match("butter$")~=nil or d1:match("butter[^%a]")~=nil
end local jE={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function av(d2)if type(d2)~="number"then return"?"end
local gh=1 while math.abs(d2)>=1000 and gh<#jE do d2=d2/1000 gh=gh+1 end local yV=string.format("%.2f",d2):gsub("%.?0+$","")
return yV..jE[gh]end local function yW(pg)if type(pg)~="string"then return nil end local yX,d3=pg:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jF=tonumber(yX)if not jF then return nil end if d3==""then return jF end local yY={qd="qa",qn="qi"}d3=yY[d3:lower()]or d3
for yZ,y0 in ipairs(jE)do if y0:lower()==d3:lower()then return jF*1000^(yZ-1)end end return nil end local function bk()
local jG=K:FindFirstChild("MoneyValue")if jG and type(jG.Value)=="number"then return jG.Value end local ph=K:GetAttribute("BoardValueMoney")
if type(ph)=="number"then return ph end local pj=K:FindFirstChild("leaderstats")if pj then for JM,y1 in ipairs({"Cash","Money","Coins"})do
local jH=pj:FindFirstChild(y1)if jH and type(jH.Value)=="number"then return jH.Value end end end end local function gi(y2)
local jI=y2:GetFullName()if c.plot then local jJ=c.plot:GetFullName()if jI:sub(1,#jJ)==jJ then return jI:sub(#jJ+2)end
end return jI end local function aq()local gj=K.Character if gj and gj:FindFirstChild("HumanoidRootPart")then
local pk=gj:FindFirstChildOfClass("Humanoid")if pk and pk.Health>0 then return gj end end end local function bF()
local jK=ak:FindFirstChild("Plots")if not jK then return nil end local function pl(y3)local pm=y3:FindFirstChild("Plate")
return pm~=nil and pm:FindFirstChild("EditStackAttachment",true)~=nil end local pn=K:GetAttribute("PlotNumber")
if pn~=nil then local jL=jK:FindFirstChild(tostring(pn))if jL and pl(jL)then return jL end end for JN,po in ipairs(jK:GetChildren())do
if pl(po)then return po end end end local function d4(pp)local bG=pp and pp.Parent for JO=1,6 do if not bG then return nil end
if bG:IsA("BasePart")then return bG end if bG:IsA("Model")then return bG.PrimaryPart or bG:FindFirstChildWhichIsA("BasePart",true)end
bG=bG.Parent end end local function pq(ps)local jM=ps.Parent if jM and jM:IsA("Attachment")then return jM.WorldPosition end
local pt=d4(ps)return pt and pt.Position end local function pu()local c2=c.plot and c.plot:FindFirstChild("Plate")
if not c2 then return nil end if c2:IsA("BasePart")then return c2 .Position end if c2:IsA("Model")then return c2:GetPivot().Position end
local pv=c2:FindFirstChildWhichIsA("BasePart",true)return pv and pv.Position end local function pw()local jN={}
local px=c.plot and c.plot:FindFirstChild("WaxStations")if px then for JP,y4 in ipairs(px:GetChildren())do local py=y4:FindFirstChild("SquishyPlaceHolder")
local jO=py and py:FindFirstChild("PlacePrompt")if jO and jO:IsA("ProximityPrompt")then jN[#jN+1]=jO end end end
return jN end local function gk()local pz,jP=pw(),0 for JQ,y5 in ipairs(pz)do if y5 .Enabled then jP=jP+1 end end
local jQ=#pz local jR=K:GetAttribute("WaxStations")if type(jR)=="number"and jR>jQ then jQ=jR end return jP,jQ
end local function y6()local pA=aq()local pB=pA and pA.HumanoidRootPart.Position local jS,pC for JR,jT in ipairs(pw())do
if jT.Enabled then local pD=pq(jT)local pE=(pD and pB)and(pD-pB).Magnitude or 1e9 if not jS or pE<pC then jS,pC=jT,pE end
end end return jS end local function pF()local gl=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not gl then return nil end local pG=gl:FindFirstChild("BuyPromptAttachment")local gm=(pG and pG:FindFirstChild("BuyPrompt"))or gl:FindFirstChild("BuyPrompt",true)
if gm and gm:IsA("ProximityPrompt")and gm:IsDescendantOf(gl)then return gm end end local pH={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local y7={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local al={order={},price={},dirty=false}local M={seen={},at=0,boxes={},built=0}local ae={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jU="SAB_order.txt"local function gn()if not al.dirty or type(writefile)~="function"then return end local aG={}
for y8,y9 in pairs(al.price)do aG[#aG+1]="P|"..y8 .."|"..string.format("%.0f",y9)end for y_,za in pairs(al.order)do aG[#aG+1]="O|"..y_.."|"..table.concat(za,",")end
if j.learned and j.enc then aG[#aG+1]="M|mode|"..tostring(j.learned.mode or"")for zb,go in ipairs(j.learned.seq)do
local pI={}for pJ=1,go.n do pI[pJ]=j.enc(go.args[pJ])end aG[#aG+1]=("A|%d|%s|%d|%s"):format(zb,go.m,go.n,table.concat(pI,";"))
end end local function jV(zc,zd,gp)local pK={}for pL=1,gp.n do pK[pL]=j.enc(gp.args[pL])end aG[#aG+1]=("R|%d|%s|%s|%d|%s"):format(zd,zc,gp.m,gp.n,table.concat(pK,";"))
end if j.enc then for ze,zf in ipairs(E.rec.rules)do jV("rules",ze,zf)end if E.rec.on then jV("on",0,E.rec.on)end
if E.rec.off then jV("off",0,E.rec.off)end end for JS,d5 in pairs(M.seen)do aG[#aG+1]=("K|%s|%s|%s|%s"):format(d5 .name,d5 .title or"",d5 .rar or"",d5 .price and string.format("%.0f",d5 .price)or"")
end if pcall(writefile,jU,table.concat(aG,"\n"))then al.dirty=false end end local function zg()if type(isfile)~="function"or type(readfile)~="function"then return end
local zh,zi=pcall(isfile,jU)if not(zh and zi)then return end local zj,pM=pcall(readfile,jU)if not(zj and type(pM)=="string")then return end
for zk in pM:gmatch("[^\n]+")do local c3,c4,bl=zk:match("^(%a)|([^|]+)|(.*)$")if c3=="P"then al.price[c4]=tonumber(bl)
elseif c3=="M"then j.loadMode=(bl~=""and bl~="nil")and bl or nil elseif c3=="A"and j.dec then local pN=tonumber(c4)
local pO,gq,zl=bl:match("^([^|]+)|(%d+)|(.*)$")if pN and pO then gq=tonumber(gq)local pP,gr={},0 for zm in(zl..";"):gmatch("([^;]*);")do
gr=gr+1 if gr<=gq then pP[gr]=j.dec(zm)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pN]={m=pO,n=gq,args=pP}end elseif c3=="R"and j.dec then
local pQ=tonumber(c4)local gs,zn,gt,zo=bl:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pQ and gs then gt=tonumber(gt)
local pR,gu={},0 for zp in(zo..";"):gmatch("([^;]*);")do gu=gu+1 if gu<=gt then pR[gu]=j.dec(zp)end end local jW={m=zn,n=gt,args=pR}
if gs=="rules"then E.rec.rules[pQ]=jW elseif gs=="on"then E.rec.on=jW elseif gs=="off"then E.rec.off=jW end end
elseif c3=="K"then local pS,pT,zq=bl:match("^([^|]*)|([^|]*)|(.*)$")M.seen[M.key(c4)]={name=c4,title=pS~=""and pS or nil,
rar=pT~=""and pT or nil,price=tonumber(zq)}elseif c3=="O"and bl~=""then local gv={}for zr in bl:gmatch("[^,]+")do gv[#gv+1]=zr end
if#gv>0 then al.order[c4]=gv end end end end local function zs(gw)if type(gw)~="table"then return end local ce,pU=gw.rarity,gw.contents
if type(ce)~="string"or ce==""or type(pU)~="table"then return end local d6={}for JT,gx in ipairs(pU)do if type(gx)=="table"and type(gx.butter)=="string"then
d6[#d6+1]={n=gx.butter,ch=tonumber(gx.chance)or 0}end end if#d6==0 then return end table.sort(d6,function(zt,zu)return zt.ch>zu.ch end)
local d7,d8={},false for zv,zw in ipairs(d6)do d7[zv]=zw.n end local jX=al.order[ce]if not jX or#jX~=#d7 then d8=true end
if not d8 then for pV=1,#d7 do if jX[pV]~=d7[pV]then d8=true break end end end al.order[ce]=d7 local jY=tonumber(gw.price)
if jY and al.price[ce]~=jY then al.price[ce]=jY d8=true end if d8 then al.dirty=true ae.at=0 D("learned the "..ce.." order from its crate")
end end local function c5(zx,zy)local zz=zx:FindFirstChild(zy,true)local zA,jZ=pcall(function()return zz.Text end)
return(zA and type(jZ)=="string"and jZ~="")and jZ or nil end local function am(pW)return ae.pretty[pW]or pW end
M.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function M.key(zB)return gg(zB or"")end
function M.learn(bm)if type(bm)~="table"or type(bm.name)~="string"then return end local j0=M.key(bm.name)local bn=M.seen[j0]or{}
local zC=(M.seen[j0]==nil)or(tonumber(bm.price)and bn.price~=tonumber(bm.price))bn.name,bn.title=bm.name,bm.title or bn.title
bn.rar,bn.price=bm.rarity or bn.rar,tonumber(bm.price)or bn.price M.seen[j0]=bn if zC then M.at,al.dirty=z(),true end
end function M.wanted(pX)if pX==nil then return false end local j1=M.key(pX)return e.CrateTicks[j1]==true or(e.BestCrate and q.bestCrate~=nil and(j1==q.bestCrate or j1==q.bestCrateTitle))
end function M.list()local c6={}for zD,gy in ipairs(M.base)do c6[M.key(gy[1])]={name=gy[1],title=gy[2],rar=gy[3],i=zD}end
for JU,d9 in ipairs(ae.rarOrder)do local pY=false for JV,zE in pairs(c6)do if zE.rar==d9 then pY=true break end end
if not pY and d9~="?"then local pZ=d9:gsub("[^%w]","").."Crate"c6[M.key(pZ)]={name=pZ,title=d9 .." Crate",rar=d9,i=50,guess=true}
end end for p0,gz in pairs(M.seen)do local a8=c6[p0]or{i=100}a8 .name,a8 .title,a8 .rar=gz.name or a8 .name,gz.title or a8 .title,gz.rar or a8 .rar
a8 .price,a8 .guess=gz.price or a8 .price,nil c6[p0]=a8 end local d_,gA={},{}for zF,zG in ipairs(pH)do d_[zG]=zF end
for zH,p1 in ipairs(ae.rarOrder)do d_[p1]=d_[p1]or(20+zH)end for zI,ea in pairs(c6)do ea.k=zI ea.price=ea.price or al.price[ea.rar or""]
gA[#gA+1]=ea end table.sort(gA,function(cf,cg)if cf.price and cg.price and cf.price~=cg.price then return cf.price<cg.price end
local p2,p3=d_[cf.rar or""]or 99,d_[cg.rar or""]or 99 if p2~=p3 then return p2<p3 end if(cf.i or 100)~=(cg.i or 100)then return(cf.i or 100)<(cg.i or 100)end
return cf.k<cg.k end)return gA end local function zJ()local p4=ag:FindFirstChild("Assets")local p5=p4 and p4:FindFirstChild("Squishies")
if not p5 then return false end local j2,p6,c7={},{},{}local gB=0 for JW,gC in ipairs(p5:GetChildren())do local eb=W(gC.Name)
if eb~=""and not j2[eb]then local gD=c5(gC,"RarityText")or"?"j2[eb]=gD p6[eb]=c5(gC,"NameText")or gC.Name c7[gD]=c7[gD]or{}
table.insert(c7[gD],eb)gB=gB+1 end end if gB==0 then return false end for p7,zK in pairs(c7)do local p8=al.order[p7]or y7[p7]
local j3={}if p8 then for zL,zM in ipairs(p8)do j3[W(zM)]=zL end end table.sort(zK,function(p9,p_)local j4,j5=j3[p9],j3[p_]
if j4 and j5 then return j4<j5 end if j4 then return true end if j5 then return false end return am(p9)<am(p_)
end)end local j6={}for zN,zO in ipairs(pH)do j6[zO]=zN end local gE,cj={},{}for zP in pairs(c7)do gE[#gE+1]=zP end
pcall(function()for zQ,zR in ipairs(require(ag.Modules.SquishyRNG).Keys)do cj[zR]=zQ end end)table.sort(gE,function(c8,c9)
if cj[c8]and cj[c9]and cj[c8]~=cj[c9]then return cj[c8]<cj[c9]end local j7,j8=al.price[c8],al.price[c9]if j7 and j8 and j7~=j8 then return j7<j8 end
local j9,j_=j6[c8],j6[c9]if j9 and j_ then return j9<j_ end if j9 then return true end if j_ then return false end
return c8<c9 end)ae.rar,ae.pretty,ae.members,ae.rarOrder,ae.n,ae.at=j2,p6,c7,gE,gB,z()return true end local function ka()
if ae.at==0 or(z()-ae.at)>120 then pcall(zJ)end return ae.n>0 end local function zS(zT)local qa=W(zT)return ae.rar[qa]or(ab.name and W(ab.name)==qa and ab.rar)or"?"
end local function zU()local gF={}local zV=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for zW,zX in pairs(zV)do if zX then gF[#gF+1]=am(zW)end end
table.sort(gF)return gF end local ar={dir="SAB",cfg="SAB/configs",auto="SAB/autoload_"..K.Name..".txt",autoOld="SAB/autoload.txt",
exec="autoexec/SAB_autoload.lua"}local function qb()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gG(qc)if type(makefolder)~="function"then return end local zY,zZ=pcall(isfolder,qc)if not(zY and zZ)then pcall(makefolder,qc)end
end local function ec(qe)if type(isfile)~="function"or type(readfile)~="function"then return nil end local z0,z1=pcall(isfile,qe)
if not(z0 and z1)then return nil end local z2,z3=pcall(readfile,qe)return z2 and z3 or nil end local function gH(z4,z5)
if type(writefile)~="function"then return false end return(pcall(writefile,z4,z5))end local function qf(z6)local ed={}
if type(listfiles)~="function"then return ed end local z7,qg=pcall(listfiles,z6)if not z7 or type(qg)~="table"then return ed end
for JX,z8 in ipairs(qg)do ed[#ed+1]=tostring(z8)end return ed end local function qh()local gI={}for JY,z9 in ipairs(qf(ar.cfg))do
local qi=z9:match("([^/\\]+)%.txt$")if qi then gI[#gI+1]=qi end end table.sort(gI)return gI end local function z_()
local ac={"V|1"}ac[#ac+1]="N|Every|"..tostring(e.Every)ac[#ac+1]="N|GlazeLead|"..tostring(e.GlazeLead)ac[#ac+1]="N|FpsCap|"..tostring(e.FpsCap)
ac[#ac+1]="N|MemLimit|"..tostring(e.MemLimit)ac[#ac+1]="N|Best|"..tostring(e.Best or 0)for JZ,qj in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ac[#ac+1]="S|"..qj.."|"..e[qj]end
do local gJ={}for Aa,gK in pairs(e.Pets)do local qk=(gK.b and"b"or"")..(gK.g and"g"or"")..(gK.w and"w"or"")..(tonumber(gK.f)==-1 and"k"or"")
if qk~=""then gJ[#gJ+1]=Aa.."|"..qk end end table.sort(gJ)ac[#ac+1]="P|-"for J0,Ab in ipairs(gJ)do ac[#ac+1]="P|"..Ab end
end for J1,ql in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
ac[#ac+1]="B|"..ql.."|"..(e[ql]and"1"or"0")end local kb=K:GetAttribute("AutoRollRules")if type(kb)=="string"and kb~=""then e.ARrules,e.ARstop=kb,tostring(K:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then ac[#ac+1]="S|rules|"..e.ARrules ac[#ac+1]="S|stop|"..e.ARstop end if c.winPos then ac[#ac+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ac[#ac+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for J2,kc in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gL={}for Ac,Ad in pairs(kc[2])do if Ad then gL[#gL+1]=Ac end end table.sort(gL)ac[#ac+1]=kc[1].."|-"for J3,Ae in ipairs(gL)do ac[#ac+1]=kc[1].."|"..Ae end
end return table.concat(ac,"\n")end local function Af(kd)if type(kd)~="string"or kd==""then return false end local qm,qo,qp,qq,ee={},false,{},false,nil
for Ag in kd:gmatch("[^\n]+")do local aH,ai,aB=Ag:match("^(%a)|([^|]*)|?(.*)$")if aH=="N"and ai=="Every"then local ke=tonumber(aB)
if ke and ke>=1 then e.Every=math.floor(ke)end elseif aH=="N"and(ai=="FpsCap"or ai=="MemLimit")then local kf=tonumber(aB)
if kf and kf>=0 then e[ai]=math.floor(kf)end elseif aH=="N"and ai=="Best"then local gM=tonumber(aB)if gM and gM>=0 and gM<=4 then e.Best=math.floor(gM)end
elseif aH=="N"and ai=="GlazeLead"then local gN=tonumber(aB)if gN and gN>=5 and gN<=600 then e.GlazeLead=math.floor(gN)end
elseif aH=="S"and(ai=="TeamNormal"or ai=="TeamFull"or ai=="TeamGlaze"or ai=="TeamWax")then e[ai]=aB elseif aH=="P"and ai~=""then
if not ee then ee={}end if ai~="-"and aB~=""then ee[ai]={b=aB:find("b",1,true)and true or nil,g=aB:find("g",1,true)and true or nil,
w=aB:find("w",1,true)and true or nil,f=aB:find("k",1,true)and-1 or nil}end elseif aH=="B"then if e[ai]~=nil then e[ai]=(aB=="1")end
elseif aH=="S"and ai=="rules"then e.ARrules=aB elseif aH=="S"and ai=="stop"then e.ARstop=aB elseif aH=="W"then
c.winPos={tonumber(ai)or 10,tonumber(aB)or 44}elseif aH=="G"then c.togPos={tonumber(ai)or 10,tonumber(aB)or 300}
elseif aH=="T"and ai~=""then if ai~="-"then qm[ai]=true end qo=true elseif aH=="K"and ai~=""then if ai~="-"then qp[ai]=true end
qq=true end end if qo then e.Targets=qm end if qq then e.CrateTicks=qp end if ee then e.Pets=ee end return true
end local function ef(c_)if not qb()then return false,"this executor cannot write files"end c_=(c_ or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c_==""then return false,"give the config a name"end gG(ar.dir)gG(ar.cfg)if not gH(ar.cfg.."/"..c_..".txt",z_())then return false,"could not write the file"end
c.config=c_ return true,c_ end local function kg(gO)local qr=ec(ar.cfg.."/"..gO..".txt")if not qr then return false,"no config called "..tostring(gO)end
if not Af(qr)then return false,"that config looks empty"end c.config=gO return true,gO end local function kh(qs)
gG(ar.dir)gH(ar.auto,qs or"")c.autoload=qs end local function Ah()if c.selfPath then return c.selfPath end local gP
for J4,Ai in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ar.dir})do for J5,qt in ipairs(qf(Ai))do local ki=qt:lower()
if ki:sub(-4)==".lua"and(ki:find("sab_farm",1,true)or ki:find("sab farm",1,true))then gP=gP or qt end end end
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
local function Aj()if not qb()then return false,"this executor cannot write files"end gG("autoexec")if not gH(ar.exec,ar.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gQ=(function()local Ak,Al=pcall(function()return game:GetService("TeleportService")end)return Ak and Al or nil end)()
local function qu()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local Am=queueonteleport or queue_on_teleport return(pcall(Am,ar.stub))end local function eg(An)if c.rejoining then return end
c.rejoining=true D("REJOIN ("..An..")")pcall(gn)if c.autoload then pcall(ef,c.autoload)end local Ao=qu()D(Ao and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for J6=1,30 do if not gQ then break end pcall(function()gQ:Teleport(game.PlaceId,K)end)task.wait(10)
end end)end local function Ap()local Aq,qv=pcall(function()return game:GetService("GuiService")end)if Aq and qv then
pcall(function()V(qv.ErrorMessageChanged:Connect(function()if e.Rejoin then eg("roblox error message")end end))
end)end pcall(function()local qw=game:GetService("CoreGui")local qx=qw and qw:WaitForChild("RobloxPromptGui",15)
local qy=qx and qx:WaitForChild("promptOverlay",15)if qy then V(qy.ChildAdded:Connect(function(Ar)if e.Rejoin and tostring(Ar.Name):lower():find("errorprompt",1,true)then eg("disconnect prompt")end
end))end end)if gQ then pcall(function()V(gQ.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()eg("teleport retry")end)end
end))end)end end local function qz(As)local qA=c.plot and c.plot:FindFirstChild(As)if not qA then return nil,false end
for J7,kj in ipairs(qA:GetChildren())do if kj:IsA("Model")or kj:IsA("BasePart")then return kj,true end end return nil,true
end local function ck()local bH=qz("RolledSquishy")if not bH then return nil end return{model=bH,name=bH.Name,pretty=c5(bH,"NameText")or am(W(bH.Name)),
rar=c5(bH,"RarityText")or zS(bH.Name),price=c5(bH,"PriceText")}end local function qB(kk)return type(kk)=="string"and(ae.rar[W(kk)]~=nil or yU(kk))
end local function ad()local kl=qz("SquishyEquipped")if kl then c.carrySrc,j.heldAt="model",z()return kl.Name,kl end
local qC=K.Character if qC then for J8,eh in ipairs(qC:GetDescendants())do if(eh:IsA("Model")or eh:IsA("Tool"))and qB(eh.Name)then
c.carrySrc,j.heldAt="character",z()return eh.Name,eh end end end local gR=K:GetAttribute("SquishyEquipped")if type(gR)=="string"and gR~=""and qB(gR)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gR,nil end c.carrySrc=nil end local function J9()local J_,At=ad()return At end local function cl()
local ei=ck()local gS=ei and yW(ei.price)local gT=bk()if gS and gT and gT<gS then return gT,gS end if ei and type(ei.price)=="string"and ei.price:find("%d")and not gS then return gT or 0,math.huge end
end local function cm(Au)d0[#d0+1]=os.date("%H:%M:%S").." "..Au if#d0>40 then table.remove(d0,1)end end local function Av(cn,gU)
if type(cn)~="string"then return end cm(("Roll(%s,%s)"):format(cn,tostring(gU)))if cn:lower():find("crate",1,true)then
j.rolled,j.rolledAt=cn,z()return end ab.seq=ab.seq+1 ab.name,ab.at=cn,z()ab.rar=type(gU)=="string"and gU or nil
c.rolls=c.rolls+1 if aP(cn)then D(("ROLL %s [%s] = TARGET"):format(cn,tostring(gU)))end end local function Aw(co)
if type(co)~="table"then return end local gV=co.butter or co.itemName if type(gV)~="string"then return end c.gifts=c.gifts+1
ab.gift,ab.giftAt=gV,z()if type(co.giftId)=="string"then local qD=ag:FindFirstChild("Remotes")local qE=qD and qD:FindFirstChild("GiftThanks")
if qE then pcall(function()qE:FireServer(co.giftId)end)end end cm("Gift("..gV.." from "..tostring(co.fromName)..")")
D(("GIFT from %s: %s - it will not be waxed"):format(tostring(co.fromName),gV))end local function Ax()local qF=ag:WaitForChild("Remotes",30)
if not c.alive then return end if not qF then D("Remotes folder missing - no roll events")return end V(K:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local qG=K:GetAttribute("SquishyEquipped")if type(qG)=="string"and qG~=""then j.heldAt=z()end end))local AD={
SquishyRollAnimation=Av,InitSquishy=function(qH)ab.init,ab.initAt=tostring(qH),z()cm("Init("..tostring(qH)..")")end,
CrateUpdate=function(da,qI)pcall(zs,da)pcall(M.learn,da)if type(da)=="table"then local Ay=qI==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not Ay then return end local Az=not j.waiting local AA=j.on j.waiting,j.data,j.at=true,da,z()j.on=(qI==true)
j.title=tostring(da.title or da.name or"crate")if j.on and not AA then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cm("CrateWindow open("..j.title..")")elseif Az then cm("Crate waiting("..j.title..")")D(j.title.." is waiting on your stand")
end else if j.waiting then cm("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local AB=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,AB)end if j.classify then local AC=z()
task.spawn(function()pcall(j.classify,AC)end)end end end,GiftReceived=Aw,}for gW,AE in pairs(AD)do local km=qF:FindFirstChild(gW)
if km and km:IsA("RemoteEvent")then V(km.OnClientEvent:Connect(AE))elseif gW~="CrateUpdate"and gW~="GiftReceived"then D("remote "..gW.." missing")end
end end local function kn()local cp=ck()if cp then if aP(cp.name)then return{state="match",shown=cp.pretty,src="pad",info=cp}
end return{state="skip",info=cp,level="idle",text=("on pad: %s [%s] - not ticked"):format(cp.pretty,tostring(cp.rar))}
end if ab.name and(z()-ab.at)<4 then if aP(ab.name)then return{state="match",shown=am(W(ab.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(am(W(ab.name)),tostring(ab.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gX(AF,AG,AH,AI)
local gY=RaycastParams.new()gY.FilterType=Enum.RaycastFilterType.Exclude local ko={K.Character}for Ka,AJ in ipairs(AI or{})do ko[#ko+1]=AJ end
gY.FilterDescendantsInstances=ko pcall(function()gY.RespectCanCollide=true end)local qJ=ak:Raycast(Vector3 .new(AF,AG+4,AH),Vector3 .new(0,-30,0),gY)
return qJ and qJ.Position or nil end local function db(qK)local qL=qK:FindFirstChildOfClass("Humanoid")return((qL and qL.HipHeight)or 2)+qK.HumanoidRootPart.Size.Y/2+0.2
end local function kp(AK,AL)local kq=AK:FindFirstChildOfClass("Humanoid")local AM=z()while z()-AM<AL do if kq and(kq.FloorMaterial~=Enum.Material.Air or kq.SeatPart)then return true end
ah(0.05)end return false end local function aE(AN,kr,ks)local qM=AN.HumanoidRootPart qM.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qM.CFrame=ks and CFrame.new(kr,Vector3 .new(ks.X,kr.Y,ks.Z))or CFrame.new(kr)end local function cq(bo,qN)local cr=aq()
if not cr or not bo then return false end local bI=bo.Position local gZ=math.clamp(math.max(bo.Size.X,bo.Size.Z)/2+2.2,3,7)
local qO=(qN and qN.MaxActivationDistance)or 10 if gZ>qO-2 then gZ=math.max(2.5,qO-2)end local ej={}local function cs(ek)
ek=Vector3 .new(ek.X,0,ek.Z)if ek.Magnitude>0.05 then ej[#ej+1]=ek.Unit end end local qP=pu()if qP then cs(qP-bI)end
cs(bo.CFrame.LookVector)cs(-bo.CFrame.LookVector)cs(bo.CFrame.RightVector)cs(-bo.CFrame.RightVector)cs(cr.HumanoidRootPart.Position-bI)
if#ej==0 then cs(Vector3 .new(0,0,1))end local AO,g0=db(cr),false for Kb,AP in ipairs(ej)do local g1=bI+AP*gZ
local kt=gX(g1 .X,bI.Y,g1 .Z,{bo})if kt and math.abs(kt.Y-bI.Y)<14 then aE(cr,Vector3 .new(g1 .X,kt.Y+AO,g1 .Z),bI)
if kp(cr,0.7)then g0=true break end end end if not g0 then aE(cr,bI+ej[1]*gZ+Vector3 .new(0,3,0),bI)g0=kp(cr,1)
end ah(0.12)return g0 end local function qQ(el)if not el.Parent or not el.Enabled then return false end pcall(function()el:InputHoldBegin()end)
ah(math.max(el.HoldDuration,0)+0.08)pcall(function()el:InputHoldEnd()end)return true end local function ao(qR,AQ)
local AS=z()while z()-AS<AQ do if qR()then return true end ah(0.05)end return qR()end local function em(dc,AT,qS,AU)
local AV=c.zapFirst and{"zap","hold"}or{"hold","zap"}for AW,ku in ipairs(AV)do if AW==2 and(AU or not(dc.Parent and dc.Enabled and(not qS or qS())))then break end
local kv if ku=="hold"then kv=qQ(dc)else kv=type(fireproximityprompt)=="function"and dc.Parent~=nil and dc.Enabled and pcall(fireproximityprompt,dc)end
if kv and ao(AT,1.2)then c.zapFirst=(ku=="zap")return true,ku end end return false end local function qT(kw)local bJ=pF()
if not bJ or not bJ.Enabled then D("buy: nothing on the pad")return false end do local qU,qV=cl()if qU then c.cashFails=(c.cashFails or 0)+1
c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("not buying: have $%s, price %s"):format(av(qU),qV==math.huge and"unreadable"or("$"..av(qV))))
return false end end local kx=d4(bJ)if not kx then D("buy: pad part missing")return false end c.lastBuyAt=z()
local AX,qW=ab.seq,bk()local qX=aq()local AY=qX and(qX.HumanoidRootPart.Position-kx.Position).Magnitude>12 cq(kx,bJ)
if AY then ah(0.4)end if not bJ.Enabled then D("buy aborted: pad emptied")return false end local dd=kn()if not kw and dd.state~="match"then
D("buy aborted: "..(dd.text or"pad changed"))c.matchSince=nil return false end local ky=dd.info and dd.info.name or(dd.state=="match"and ab.name)or nil
local function AZ()return bJ.Enabled and ad()==nil and(kw or kn().state=="match")end local A0,A1=em(bJ,function()
return ad()~=nil or((not bJ.Enabled)and(kw or ab.seq==AX))end,AZ,cl()~=nil)if A0 then ao(function()return ad()~=nil end,0.8)
local en=ad()local qY=bk()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0 c.matchSince=nil ab.name,ab.rar,ab.at=nil,nil,z()
D(("BOUGHT %s%s via %s"):format(en and am(W(en))or(dd.shown or"?"),(qW and qY)and(" for $"..av(qW-qY))or"",A1))
if en and ky and W(en)~=W(ky)then D(("note: picked up %s, not %s"):format(en,ky))end return true end local g2=ck()
if cl()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("BUY REFUSED: cash short - have $%s, price %s"):format(av(bk()),(g2 and g2 .price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)D(("buy did not go through (%s, try %d) - again in %ds"):format(g2 and g2 .price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qZ()local eo=ad()if not eo then c.holding=false D("place: hands are empty")
return false end if not aP(eo)then D(("REFUSED TO WAX %s - it is not ticked"):format(am(W(eo))))return false end
for Kc=1,e.PlaceTries do local bK=y6()if not bK then D("place: no free station")break end local q0=d4(bK)if q0 then
cq(q0,bK)local q1=ad()if not q1 then c.holding=false D("place: hands emptied on the way")return false end if not aP(q1)then D("place: what I carry changed, not waxing it")return false end
if bK.Enabled then local A2,A3=em(bK,function()return not bK.Enabled end,function()return bK.Enabled end)if A2 then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 ab.name,ab.rar,ab.at=nil,nil,z()
D(("WAXED %s #%d at %s via %s"):format(am(W(eo)),c.placed,bK.Parent.Parent.Name,A3))if q.placed then pcall(q.placed,eo)end
return true end end end ah(0.25)end c.placeFails=c.placeFails+1 if ad()==nil then c.holding=false end D("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ad()))D(c.capMsg)end return false end function A.place()local A4=z()while c.alive and A.editing and z()-A4<25 do ah(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local A5=z()while c.alive and A.current()~=e.TeamWax and z()-A5<5 do ah(0.1)end
if A.current()==e.TeamWax then ah(0.3)else D("wax team did not come on in time - placing anyway")end end local A6,q2=pcall(qZ)
A.placing=false if not A6 then error(q2,0)end return q2 end local function q3(q4)return type(q4)=="string"and q4:lower():find("crate",1,true)~=nil
end local A7={SABFarmGui=1,SABToggle=1,SABError=1}local function kz(A8)local bL=A8 while bL do if A7[bL.Name]then return false end
if bL:IsA("ScreenGui")then local A9,A_=pcall(function()return bL.Enabled end)return(not A9)or A_~=false end if bL:IsA("GuiObject")and not bL.Visible then return false end
bL=bL.Parent end return false end local function g3(g4)local de=""pcall(function()if g4:IsA("TextButton")then de=g4 .Text end end)
if not de:find("%a")then for Kd,g5 in ipairs(g4:GetDescendants())do if(g5:IsA("TextLabel")or g5:IsA("TextButton"))and g5 .Text:find("%a")then de=g5 .Text break end
end end if not de:find("%a")then de=g4 .Name end return(de:lower():gsub("[^%a]",""))end local function Ba()local ep,eq
local q5=K:FindFirstChildOfClass("PlayerGui")if not q5 then return nil,nil end for Ke,er in ipairs(q5:GetDescendants())do
if er:IsA("GuiButton")and kz(er)then local kA=g3(er)if kA:sub(1,4)=="open"and not kA:find("shop",1,true)then ep=ep or er end
if kA:sub(1,7)=="discard"then eq=eq or er end end end if ep and eq then return ep,eq end if j.on then return ep,eq end
return nil,nil end local kB=(function()local Bb,Bc=pcall(function()return game:GetService("VirtualInputManager")end)return Bb and Bc or nil end)()
local function q6(bp,kC)local kD={}local function q7(Bd)kD[#kD+1]=Bd end if c.tapWay then q7(c.tapWay)end for Kf,q8 in ipairs({"touch","conn","signal"})do
if q8~=c.tapWay then q7(q8)end end local function q9(Be,...)local Bf,kE=pcall(getconnections,Be)if not(Bf and type(kE)=="table"and#kE>0)then return false end
local q_,Bg,Bh=false,{...},select("#",...)for Kg,Bi in ipairs(kE)do if pcall(function()Bi:Fire(table.unpack(Bg,1,Bh))end)then q_=true end
end return q_ end local function ra()local rb=Vector3 .new(0,0,0)pcall(function()local rc,rd=bp.AbsolutePosition,bp.AbsoluteSize
rb=Vector3 .new(rc.X+rd.X/2,rc.Y+rd.Y/2,0)end)local kF={Position=rb,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kF.UserInputType=Enum.UserInputType.Touch end)pcall(function()kF.UserInputState=Enum.UserInputState.End end)
return kF end for Kh,bq in ipairs(kD)do local es=false if bq=="conn"and type(getconnections)=="function"then if q9(bp.MouseButton1Click)then
es=true if ao(kC,1.5)then c.tapWay=bq return true,bq end end es=q9(bp.Activated,ra(),1)elseif bq=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bp.MouseButton1Click)then if ao(kC,1.5)then c.tapWay=bq return true,bq end end es=pcall(firesignal,bp.Activated,ra(),1)
elseif bq=="touch"and kB then es=pcall(function()local rf,rg=bp.AbsolutePosition,bp.AbsoluteSize local rh=0 local ri=bp:FindFirstAncestorWhichIsA("ScreenGui")
local Bj,Bk=pcall(function()return ri and ri.IgnoreGuiInset end)if not(Bj and Bk)then pcall(function()rh=game:GetService("GuiService"):GetGuiInset().Y end)
end local rj,rk=rf.X+rg.X/2,rf.Y+rg.Y/2+rh kB:SendMouseButtonEvent(rj,rk,0,true,game,1)task.wait(0.06)kB:SendMouseButtonEvent(rj,rk,0,false,game,1)
end)end if es and ao(kC,1.5)then c.tapWay=bq return true,bq end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kG(rl)local et=rl.Parent while et and et~=c.plot do if j.NOT[et.Name]then return false end et=et.Parent
end local kH=(rl.ActionText or""):lower()if kH:find("roll",1,true)or kH:find("place",1,true)or kH:find("sell",1,true)then return false end
return true end local function rm()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local rn=c.plot:FindFirstChild("CrateStand")local eu if rn then for Ki,g6 in ipairs(rn:GetDescendants())do
if g6:IsA("ProximityPrompt")and g6 .Enabled and kG(g6)then eu=g6 break end end end if not eu then for Kj,bM in ipairs(c.plot:GetDescendants())do
if bM:IsA("ProximityPrompt")and bM.Enabled and kG(bM)then local ro=bM:FindFirstAncestorWhichIsA("Model")local Bl=((bM.ActionText or"").." "..(bM.ObjectText or"").." "..bM.Name.." "..(ro and ro.Name or"")):lower()
if Bl:find("crate",1,true)then eu=bM break end end end end j.prompt=eu return eu end local function kI()if j.on then return true end
local ev=rm()if not ev then j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local rp=d4(ev)if rp then cq(rp,ev)end j.ours=true em(ev,function()return j.on end)if ao(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: pressed "..gi(ev).." but no window came up")
return false end do local function Bm(rq)local df=rq.Parent while df and df:IsA("GuiObject")do local rr,rs=false,false
for Kk,ew in ipairs(df:GetDescendants())do if ew~=rq and ew:IsA("GuiButton")and g3(ew):sub(1,7)=="discard"then rr=true end
if ew:IsA("TextLabel")then local kJ=ew.Text:lower()if kJ:find("crate",1,true)or kJ:find("can contain",1,true)or kJ:find("cost",1,true)then rs=true end
end if rr and rs then return df end end df=df.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local rt=K:FindFirstChildOfClass("PlayerGui")if not rt then return nil end for Kl,g7 in ipairs(rt:GetDescendants())do
if g7:IsA("GuiButton")and not g7:FindFirstAncestor("SABFarmGui")and g3(g7):sub(1,4)=="open"then local kK=Bm(g7)
if kK then j.win=kK return kK end end end end local function Bn(Bo)for Km,g8 in ipairs(Bo:GetDescendants())do
if g8:IsA("GuiButton")then local ru,kL=g3(g8),g8 .Name:lower()if ru=="x"or ru=="close"or kL=="x"or kL:find("close",1,true)or kL:find("exit",1,true)then return g8 end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(Bp)task.wait(Bp and 4 or 1.2)if j.on or j.waiting then return end
local g9=j.findWin()if not g9 or not kz(g9)then return end local rv=Bn(g9)if rv and q6(rv,function()return not kz(g9)end)then return end
D("the crate window is still open - tap its X")end end local function ex(g_)if not kI()then return false end local rw=z()-(j.openedAt or 0)
if rw<0.6 then ah(0.6-rw)end local kM=j.title local Bq,Br=Ba()local rx=g_ and Bq or Br if not rx then j.lastFail=z()
c.crateFails=c.crateFails+1 D(("crate: no %s button found in %s"):format(g_ and"Open"or"Discard",kM))return false
end local Bs=ad()local Bt,Kn=q6(rx,function()return(not j.on)or(ad()~=nil and ad()~=Bs)end)if not Bt then j.lastFail=z()
c.crateFails=c.crateFails+1 D("crate: could not press "..(g_ and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if g_ then c.crates=c.crates+1 ao(function()return ad()~=nil end,1.5)local ry=ad()
D(("OPENED %s -> %s"):format(kM,ry and am(W(ry))or"?"))else D("discarded "..kM.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(Bu,...)local Bv=select("#",...)j.calls[#j.calls+1]={t=z(),m=Bu,n=Bv,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aI,br)local bN=type(aI)if(bN=="string"or bN=="number")and type(br.data)=="table"then for rz,kN in pairs(br.data)do
if kN==aI and type(rz)=="string"and(type(kN)=="string"or type(kN)=="number")then return{__slot="f:"..rz}end end
end if bN=="string"then if br.crate and aI==br.crate then return{__slot="crate"}end if br.title and aI==br.title then return{__slot="title"}end
if br.rar and aI==br.rar then return{__slot="rarity"}end return aI end if bN=="number"or bN=="boolean"or bN=="nil"then return aI end
if bN=="table"then local rA={}for Bw,rB in pairs(aI)do if type(rB)=="table"then return nil,"nested table"end local Bx,rC=j.slot(rB,br)
if rC then return nil,rC end rA[Bw]=Bx end return rA end local By,Bz=pcall(function()return aI:IsA("Instance")end)
if By and Bz then if aI==K then return{__slot="player"}end if c.plot and aI==c.plot then return{__slot="plot"}end
local ha=c.plot and c.plot:FindFirstChild("CrateStand")if ha and aI==ha then return{__slot="stand"}end if ha and aI.Parent==ha then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bN..")"end function j.resolve(hb)if type(hb)~="table"then return hb end
local aX=hb.__slot if aX and aX:sub(1,2)=="f:"then return j.data and j.data[aX:sub(3)]end if aX=="crate"then return j.data and j.data.name end
if aX=="title"then return(j.data and j.data.title)or j.title end if aX=="rarity"then return j.data and j.data.rarity end
if aX=="player"then return K end if aX=="plot"then return c.plot end if aX=="stand"or aX=="model"then local kO=c.plot and c.plot:FindFirstChild("CrateStand")
if aX=="stand"or not kO then return kO end for Ko,rD in ipairs(kO:GetChildren())do if q3(rD.Name)then return rD end end
return nil end local rE={}for BA,BB in pairs(hb)do rE[BA]=j.resolve(BB)end return rE end function j.classify(kP)
if j.directOff then return end local hc={}for Kp,kQ in ipairs(j.calls)do if kQ.t<=kP+0.05 and kP-kQ.t<=6 then hc[#hc+1]=kQ end
end if#hc==0 then return end if not ao(function()return(j.heldAt or 0)>=kP-1 end,2.5)then return end local ey={}
for Kq,ez in ipairs(hc)do local rF={}for rG=1,ez.n do local BC,rH=j.slot(ez.args[rG],ez)if rH then D("crate call has "..rH.." - keeping the button method")
return end rF[rG]=BC end ey[#ey+1]={m=ez.m,n=ez.n,args=rF}end local kR=j.learned j.learned={seq=ey,mode=kR and kR.mode or nil}
al.dirty=true if not kR then D(("learned how to open crates directly (%d call%s)"):format(#ey,#ey==1 and""or"s"))end
end function j.replay()local rI=j.learned local rJ=ag:FindFirstChild("Remotes")local kS=rJ and rJ:FindFirstChild("CrateAction")
if not(rI and kS)then return false end local rK=table.unpack or unpack j.replaying=true for Kr,eA in ipairs(rI.seq)do
local kT={}for rL=1,eA.n do kT[rL]=j.resolve(eA.args[rL])end task.spawn(function()pcall(function()if eA.m=="InvokeServer"then kS:InvokeServer(rK(kT,1,eA.n))
else kS:FireServer(rK(kT,1,eA.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(BD)return(BD:gsub("[%%|;=,\n]",function(BE)return("%%%02X"):format(BE:byte())end))end
function j.enc(ct)local hd=type(ct)if hd=="string"then return"s"..j.esc(ct)end if hd=="number"then return"n"..tostring(ct)end
if hd=="boolean"then return ct and"b1"or"b0"end if hd=="nil"then return"z"end if ct.__slot then return"k"..ct.__slot end
local kU={}for BF,BG in pairs(ct)do kU[#kU+1]=j.enc(BF).."="..j.enc(BG)end return"t"..table.concat(kU,",")end
function j.dec(rM)local eB,eC=rM:sub(1,1),rM:sub(2)local function BH(BI)return(BI:gsub("%%(%x%x)",function(BJ)return string.char(tonumber(BJ,16))end))end
if eB=="s"then return BH(eC)end if eB=="n"then return tonumber(eC)end if eB=="b"then return eC=="1"end if eB=="k"then return{__slot=eC}end
if eB=="t"then local rN={}for BK in eC:gmatch("[^,]+")do local rO,BL=BK:match("^(.-)=(.*)$")if rO then local rP=j.dec(rO)
if rP~=nil then rN[rP]=j.dec(BL)end end end return rN end return nil end function j.goneOrNew(BM)return function()
if not j.waiting then return true end local rQ=ad()return rQ~=nil and rQ~=BM end end function j.near()local rR=ag:FindFirstChild("Remotes")
local kV=rR and rR:FindFirstChild("CrateAction")local he=aq()local kW=c.plot and c.plot:FindFirstChild("CrateStand")
local kX=kW and kW:FindFirstChild("Spot")if not(kV and he and kX)then D(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kV and"no CrateAction remote"or not he and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kY=he.HumanoidRootPart local hf=kY.CFrame local rS,kZ=j.title,"no answer"local BN=ad()local rT=kW:FindFirstChild("Holder")
local function rU()if not rT then return j.waiting or j.on end for Ks,BO in ipairs(rT:GetChildren())do if BO:IsA("Model")then return true end end
return false end for BP=1,3 do if not(j.waiting or j.on)or not rU()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kY.Position-kX.Position).Magnitude>8 then cq(kX,j.prompt)end ah(0.12+0.15*BP)
local a9={}j.replaying=true task.spawn(function()a9 .ok,a9 .v=pcall(function()return kV:InvokeServer("open")end)
a9 .done=true end)ao(function()return a9 .done end,6)j.replaying=false local cu=a9 .v if a9 .done and a9 .ok and type(cu)=="table"and cu.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 D(("OPENED %s -> %s (no window)"):format(rS,cu.prize and am(W(tostring(cu.prize)))or"?"))
ao(function()local rV=ad()return rV~=nil and rV~=BN end,1.5)if(kY.Position-hf.Position).Magnitude>8 then pcall(function()aE(he,hf.Position,hf.Position+hf.LookVector)end)end
return true,"opened"end kZ=(a9 .done and a9 .ok and type(cu)=="table")and tostring(cu.reason or"refused, no reason given")
or(a9 .done and("error: "..tostring(cu))or"no answer in 6s")ah(0.3)if not rU()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 D(("crate: the server would not open %s next to the stand (%s)"):format(rS,kZ))
return false,kZ end j.GIVEUP=600 function j.drop()local rW=ag:FindFirstChild("Remotes")local rX=rW and rW:FindFirstChild("CrateAction")
local rY=c.plot and c.plot:FindFirstChild("CrateStand")local k0=rY and rY:FindFirstChild("Spot")local rZ=aq()
if k0 and rZ and(rZ.HumanoidRootPart.Position-k0 .Position).Magnitude>8 then cq(k0,j.prompt)ah(0.3)end local k1,bs=false,nil
if rX then k1,bs=pcall(function()return rX:InvokeServer("discard")end)end D(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(k1 and type(bs)=="table"and bs.ok)and"done"or("answer: "..tostring(type(bs)=="table"and(bs.reason or bs.ok)or bs))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(k1 and type(bs)=="table"and bs.ok)then ex(false)end end function j.smart()local k2=j.title if(j.nearFails or 0)<3 then
local BQ=j.near()if BQ then return true end if j.nearFails>=3 then D("opening next to the stand failed 3 times - trying the older ways")end
end local cv=j.learned if cv then local k3=ad()if j.on then j.replay()if ao(j.goneOrNew(k3),3.5)then c.crates=c.crates+1
D("OPENED "..k2 .." (direct)")return true end else if cv.mode~="window"then j.replay()if ao(j.goneOrNew(k3),3.5)then
c.crates,j.fails=c.crates+1,0 if cv.mode~="direct"then cv.mode,al.dirty="direct",true D("crates now open directly - the window never comes up")
end D("OPENED "..k2 .." (direct, no window)")return true end end if kI()then j.replay()if ao(j.goneOrNew(k3),3.5)then
c.crates,j.fails=c.crates+1,0 if cv.mode~="window"then cv.mode,al.dirty="window",true D("crates need their window up first - it shows briefly")
end D("OPENED "..k2 .." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,al.dirty=cv,nil,true
if j.fails>=3 then j.directOff=true D("direct crate opening failed 3 times - using the button for now")else D("the learned crate call did not work - back to pressing Open")
end end return ex(true)end function E.snap()return{rules=K:GetAttribute("AutoRollRules"),stop=K:GetAttribute("AutoRollStop"),
on=K:GetAttribute("AutoRollOn"),main=K:GetAttribute("AutoRoll")}end E.cache={}function E.watchCache()E.cache=E.snap()
for BR,r0 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(K:GetAttributeChangedSignal(r0):Connect(function()E.cache[BR]=K:GetAttribute(r0)end))
end end function E.isOn()return K:GetAttribute("AutoRollOn")==true end function E.saw(BS,...)local hg=E.cache
local BT={m=BS,n=select("#",...),args={...},before={rules=hg.rules,stop=hg.stop,on=hg.on,main=hg.main}}task.delay(1.5,function()
if c.alive then pcall(E.learnOne,BT)end end)end function E.learnOne(eD)local aC,eE=E.snap(),eD.before local hh=(aC.rules~=eE.rules)or(aC.stop~=eE.stop)
local r1=(aC.on~=eE.on)or(aC.main~=eE.main)if not hh and not r1 then return end local r2={}for r3=1,eD.n do local aQ=eD.args[r3]
local cw=type(aQ)if cw=="string"and aQ~=""and aQ==aC.rules then aQ={__slot="rules"}elseif cw=="string"and aQ~=""and hh and aQ==aC.stop and aC.stop~=eE.stop then aQ={__slot="stop"}
elseif cw=="table"then local r4={}for BU,dg in pairs(aQ)do if type(dg)=="table"or(type(dg)=="userdata")then E.msg="Auto Roll sends something I cannot repeat"return
end r4[BU]=(type(dg)=="string"and dg~=""and dg==aC.rules)and{__slot="rules"}or dg end aQ=r4 elseif cw~="string"and cw~="number"and cw~="boolean"and cw~="nil"then
if aQ==K then aQ={__slot="player"}else E.msg="Auto Roll sends something I cannot repeat"return end end r2[r3]=aQ
end local dh={m=eD.m,n=eD.n,args=r2}if hh then local k4=false for BV=1,dh.n do local eF=dh.args[BV]if type(eF)=="table"and eF.__slot=="rules"then k4=true end
if type(eF)=="table"and not eF.__slot then for Kt,r5 in pairs(eF)do if type(r5)=="table"and r5 .__slot=="rules"then k4=true end end
end end if k4 then E.rec.rules={dh}else table.insert(E.rec.rules,dh)if#E.rec.rules>60 then table.remove(E.rec.rules,1)end
end end if r1 then if aC.on==true then E.rec.on=dh else E.rec.off=dh end e.AutoRoll=(aC.on==true)end if aC.rules and aC.rules~=""then e.ARrules,e.ARstop=aC.rules,aC.stop or""end
al.dirty=true E.msg=""D(("learned an Auto Roll %s message"):format(hh and"choices"or(aC.on and"on"or"off")))end
function E.resolve(di)if type(di)~="table"then return di end if di.__slot=="rules"then return e.ARrules~=""and e.ARrules or K:GetAttribute("AutoRollRules")end
if di.__slot=="stop"then return e.ARstop~=""and e.ARstop or K:GetAttribute("AutoRollStop")end if di.__slot=="player"then return K end
local r6={}for BW,BX in pairs(di)do r6[BW]=E.resolve(BX)end return r6 end function E.replay(r7,BY)local r8=table.unpack or unpack
for Ku,eG in ipairs(BY)do local k5={}for r9=1,eG.n do k5[r9]=E.resolve(eG.args[r9])end E.replaying=true pcall(function()
if eG.m=="InvokeServer"then task.spawn(function()pcall(function()r7:InvokeServer(r8(k5,1,eG.n))end)end)else r7:FireServer(r8(k5,1,eG.n))end
end)E.replaying=false task.wait(0.25)end end function E.apply(r_,BZ)if E.busy or not c.alive then return end E.busy=true
pcall(function()local sa=ag:FindFirstChild("Remotes")local k6=sa and sa:FindFirstChild("AutoRollAction")if not k6 then E.msg="this game has no AutoRollAction"return end
local bO=e.AutoRoll if bO and e.ARrules~=""and K:GetAttribute("AutoRollRules")~=e.ARrules then if#E.rec.rules==0 then
E.msg="pick your Auto Roll choices once in the game's menu so I can learn them"D(E.msg)else E.replay(k6,E.rec.rules)
if ao(function()return K:GetAttribute("AutoRollRules")==e.ARrules end,4)then D("Auto Roll choices put back")else
E.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"D(E.msg)end end end if bO==E.isOn()or(not bO and not BZ)then return end
local hi=bO and E.rec.on or E.rec.off if not hi then local eH=bO and E.rec.off or E.rec.on local sb=eH~=nil for B0=1,eH and eH.n or 0 do
if type(eH.args[B0])=="boolean"then sb=false end end if sb then hi=eH end end if not hi then E.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bO and"on"or"off")
D(E.msg)return end E.replay(k6,{hi})if ao(function()return E.isOn()==bO end,4)then E.msg=""D(("Auto Roll switched %s%s"):format(bO and"ON"or"OFF",r_ and(" ("..r_..")")or""))
else E.msg="Auto Roll did not switch - do it once in the game so I can relearn it"D(E.msg)end end)E.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local B1,B2=pcall(function()return K.UserId end)return B1 and B2 or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local B3,k7=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if B3 and type(k7)=="table"and type(k7 .Pets)=="table"then o.I=k7 end return o.I end function o.order()if o.list then return o.list end
local bP=o.info()if not bP then return{}end local cx={}if type(bP.Order)=="table"and#bP.Order>0 then for Kv,sc in ipairs(bP.Order)do if bP.Pets[sc]then cx[#cx+1]=sc end end
else for B4 in pairs(bP.Pets)do cx[#cx+1]=B4 end table.sort(cx,function(B5,B6)return(bP.Pets[B5].price or 0)<(bP.Pets[B6].price or 0)end)
end o.list=cx return cx end function o.nice(sd,k8)local se=o.info()local sf=se and se.Pets[sd]return((k8 and k8~="")and(k8 .." ")or"")..(sf and sf.displayName or tostring(sd))
end function o.data()local hj=K:GetAttribute("PetsData")if type(hj)~="string"then return nil end if hj==o.rawD then return o.lastD end
local B7,eI=pcall(function()return o.HS:JSONDecode(hj)end)eI=(B7 and type(eI)=="table")and eI or nil o.rawD,o.lastD=hj,eI
return eI end function o.pen()return ag:FindFirstChild("PetMeadowSpawns")end function o.srv()return ak:GetServerTimeNow()end
function o.money()local k9=K:FindFirstChild("MoneyValue")if k9 and type(k9 .Value)=="number"then return k9 .Value end
return bk()or 0 end function o.wishes()local sh=o.pen()local sj=sh and sh:GetAttribute("Wishes")local k_,sk={},o.srv()
if type(sj)~="string"then return k_ end local B8,sl=pcall(function()return o.HS:JSONDecode(sj)end)if B8 and type(sl)=="table"then
for B9,la in pairs(sl)do if type(la)=="number"and la>sk then k_[B9]=la-sk end end end return k_ end function o.call(...)
local sm=ag:FindFirstChild("Remotes")local sn=sm and sm:FindFirstChild("PetRequest")if not sn then return nil end
local so=table.pack(...)local cy={}task.spawn(function()cy.ok,cy.v=pcall(function()return sn:InvokeServer(table.unpack(so,1,so.n))end)
cy.done=true end)local B_=z()while not cy.done and z()-B_<6 do task.wait(0.05)end if cy.done and cy.ok then return cy.v end
return nil end function o.want(Ca)return e.Pets[Ca]end function o.closeNaming(lb)local sq=pcall(function()local sp=K:FindFirstChild("PlayerScripts")
local Cb=sp and sp:FindFirstChild("Naming",true)require(Cb).close()end)ah(0.5)if lb.Visible then pcall(function()local sr=lb:FindFirstChild("NameBox",true)if sr then sr:ReleaseFocus()end end)
lb.Visible=false sq=false end return sq end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local ss=K:FindFirstChildOfClass("PlayerGui")
local su=ss and ss:FindFirstChild("MainGui")local hk=su and su:FindFirstChild("PetNameGui")if hk and hk.Visible then
ah(0.4)if hk.Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,hk)break end end ah(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local lc,sv,hl=o.info(),o.pen(),o.data()
if not(lc and sv and hl)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local eJ,ld=#(hl.pets or{}),tonumber(hl.maxOwned)or 60
local Cc,sx,eK=o.srv(),{},nil for Kw,aY in ipairs(sv:GetChildren())do sx[aY.Name]=true local cz,hm=aY:GetAttribute("Pet"),aY:GetAttribute("Variant")or""
local le=cz and o.want(cz)if le and le.b and lc.Pets[cz]and(not le.g or hm=="Big")and y.wantMore(cz,hm,hl)and not aY:GetAttribute("A_"..o.uid)
and(tonumber(aY:GetAttribute("ExpiresAt"))or 0)>Cc+1 and z()>=(o.tryAt[aY.Name]or 0)then local eL,sy=o.nice(cz,hm),lc.Pets[cz].price or 0
if eJ>=ld then eK=("%s is in the pen, but you have %d/%d pets"):format(eL,eJ,ld)o.tryAt[aY.Name]=z()+15 elseif o.money()<sy then
eK=("%s is in the pen - need $%s"):format(eL,av(sy))o.tryAt[aY.Name]=z()+5 else o.tryAt[aY.Name]=z()+8 local bQ=o.call("adopt",aY.Name)
if type(bQ)=="table"and bQ.ok then eJ=eJ+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local Cd=type(bQ.pet)=="table"and bQ.pet or{}
table.insert(o.recent,{id=tostring(Cd.id or("?"..z())),name=cz,variant=hm,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
D("ADOPTED "..eL)o.skipNaming()eK="adopted "..eL else local sz=type(bQ)=="table"and tostring(bQ.reason or"no reason given")or"no answer"
D(("adopt %s failed: %s"):format(eL,sz))eK="adopt failed: "..sz if type(bQ)=="table"and bQ.bagFull then o.tryAt[aY.Name]=z()+60 end
end end end end for sA in pairs(o.tryAt)do if not sx[sA]then o.tryAt[sA]=nil end end o.buyMsg=eK or("watching the pen (%d/%d pets)"):format(eJ,ld)
end function o.stacks()local sB=o.pen()local Ce=sB and sB:GetAttribute("WishStacks")local Cf,sC=pcall(function()return o.HS:JSONDecode(Ce)end)
return(Cf and type(sC)=="table")and sC or{}end function o.stackTick(Cg,Ch)local hn=o.info()local sD=(type(hn.Wish)=="table"and tonumber(hn.Wish.maxStacks))or 1
if sD<=1 then return end local Ci=o.stacks()o.stackTry=o.stackTry or{}for Kx,aZ in ipairs(o.order())do local sE=o.want(aZ)
local ho=tonumber(Ci[aZ])or 1 if sE and sE.w and Cg[aZ]and ho<sD and y.wantMore(aZ,"",Ch)and z()>=(o.stackTry[aZ]or 0)then
local Cj,hp=pcall(hn.wishPrice,aZ,ho+1)hp=Cj and tonumber(hp)or((hn.Pets[aZ].price or 0)*2*3^ho)o.stackTry[aZ]=z()+5
if hp<=o.money()*0.01 then local sF=o.call("wish",aZ)if type(sF)=="table"and sF.ok then o.wishN=o.wishN+1 D(("WISH x%d on %s ($%s)"):format(ho+1,o.nice(aZ),av(hp)))
else o.stackTry[aZ]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local hq=o.info()if not(hq and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bR,lf,bS=o.wishes(),0,nil local Ck=(type(hq.Wish)=="table"and hq.Wish.cashShare)or 2 local sG=o.data()for Ky,aF in ipairs(o.order())do
local sH=o.want(aF)if sH and sH.w and y.wantMore(aF,"",sG)then lf=lf+1 if not bR[aF]and z()>=(o.wishTry[aF]or 0)then
local lg=tonumber(K:GetAttribute("PetWishCredits"))or 0 local lh=math.floor((hq.Pets[aF].price or 0)*Ck)if lg<=0 and o.money()<lh then
o.wishTry[aF]=z()+10 bS=("need $%s to wish for %s"):format(av(lh),o.nice(aF))o.wishWhy[aF]=bS else o.wishTry[aF]=z()+3
local Cl=lg>0 and"wishCredit"or"wish"local hr=o.call(Cl,aF)if type(hr)=="table"and hr.ok then o.wishN,o.wishWhy[aF]=o.wishN+1,nil
D(("WISHED for %s (%s)"):format(o.nice(aF),lg>0 and"free wish"or("$"..av(lh))))else local li=type(hr)=="table"and tostring(hr.reason or"no reason given")or"no answer"
if li:lower():find("already",1,true)then o.wishTry[aF]=z()+2 else D(("wish %s failed: %s"):format(o.nice(aF),li))bS="wish failed: "..li end
end end end end end pcall(o.stackTick,bR,sG)if not bS then for Kz,hs in ipairs(o.order())do local sI=o.want(hs)
if sI and sI.w and not bR[hs]and o.wishWhy[hs]then bS=o.wishWhy[hs]break end end end if not bS then local dj={}
for KA,eM in ipairs(o.order())do local sJ=o.want(eM)local sK=tonumber(o.stacks()[eM])or 1 if sJ and sJ.w and bR[eM]then dj[#dj+1]=("%s%s %dm"):format(o.nice(eM),sK>1 and(" x"..sK)or"",math.ceil(bR[eM]/60))end
end local ht for KB,hu in ipairs(o.order())do local sL=o.want(hu)if sL and sL.w and bR[hu]and(not ht or bR[hu]<ht)then ht=bR[hu]end
end bS=lf==0 and"no pet has WISH ticked"or(#dj==0 and"running: none yet")or(#dj<=3 and("running: "..table.concat(dj,", ")))
or("%d running, the next one ends in %dm"):format(#dj,math.ceil((ht or 0)/60))end o.wishMsg=bS end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local lj=o.data()return(lj and lj.teams)or{},lj end function A.current(dk)
dk=dk or o.data()if not dk then return""end local sM={}for KC,Cm in ipairs(dk.equipped or{})do sM[tostring(Cm)]=true end
for KD,sN in ipairs(dk.teams or{})do local sO=sN.pets or{}local lk=#sO==#(dk.equipped or{})if lk then for KE,Cn in ipairs(sO)do if not sM[tostring(Cn)]then lk=false break end end end
if lk then return sN.name end end return""end function A.equip(ll)local Co,Cp=A.teams()local lm for Cq,Cr in ipairs(Co)do if Cr.name==ll then lm=Cq break end end
if not lm then A.msg="no saved team called "..tostring(ll)return false end if A.current(Cp)==ll then return true end
for KF=1,4 do local sP=o.call("teamEquip",lm)if type(sP)=="table"and sP.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(Cs)local sQ=Cs:FindFirstChild("SquishyPlaceHolder")local sR=sQ and sQ:FindFirstChild("TimerGui")
local sS=sR and sR:FindFirstChildWhichIsA("TextLabel",true)local ln=sS and sS.Text if type(ln)~="string"or ln:find("-",1,true)then return nil end
local lo,sT,sU=ln:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not lo then return nil end local sV=sU~=""and(tonumber(lo)*3600+tonumber(sT)*60+tonumber(sU))or(tonumber(lo)*60+tonumber(sT))
return sV>0 and sV or nil end function A.waxes()local eN={}local sW=c.plot and c.plot:FindFirstChild("WaxStations")
if not sW then return eN end local sX=o.srv()for KG,a_ in ipairs(sW:GetChildren())do local lp=tonumber(a_:GetAttribute("PourEnd"))
local sY=a_:GetAttribute("PourOwner")if a_:GetAttribute("HasSquishy")and a_:GetAttribute("PourId")and(sY==nil or sY==o.uid)then
local lq=A.left(a_)local sZ=lq and(sX+lq)or((lp and lp>sX)and lp or nil)if sZ then local s0,s1=a_:FindFirstChild("SquishyPlaceHolder"),"?"
if s0 then for KH,s2 in ipairs(s0:GetChildren())do if s2:IsA("Model")then s1=s2 .Name break end end end local Ct=tostring(a_:GetAttribute("Helpers")or"")
local lr=0 for KI in Ct:gmatch("%d+")do lr=lr+1 end eN[#eN+1]={st=a_,ends=sZ,sure=lq~=nil,id=a_:GetAttribute("PourId"),name=s1,helps=lr,
long=a_:GetAttribute("PourLong")==true}end end end table.sort(eN,function(Cu,Cv)return Cu.ends<Cv.ends end)return eN
end function A.glazeCount()local s3=ag:FindFirstChild("Remotes")local s4=s3 and s3:FindFirstChild("EditStack")
if not s4 then return nil end local Cw,eO=pcall(function()return s4:InvokeServer("State",nil)end)if not(Cw and type(eO)=="table"and type(eO.state)=="table")then return nil end
local ls,lt=0,{}for KJ,hv in ipairs(eO.state.entries or{})do if hv.glaze and hv.glaze~=""then ls=ls+1 lt[hv.glaze]=(lt[hv.glaze]or 0)+1 end
end return ls,lt,#(eO.state.entries or{}),eO.state.capacity end function A.finishedOne(hw,s5)A.finished=A.finished+1
task.wait(2)local lu,Cx,s6,Cy=A.glazeCount()if lu and s5 and lu>s5 then A.glazed=A.glazed+1 local lv={}for Cz,CA in pairs(Cx)do lv[#lv+1]=Cz.." "..CA end
D(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(am(W(hw.name)),hw.st.Name,lu,table.concat(lv,", ")))
else D(("wax done on station %s: %s, no glaze%s"):format(hw.st.Name,am(W(hw.name)),s6 and(" (stack "..s6 .."/"..tostring(Cy)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cA=o.srv()local aJ=A.glazeFor if aJ then local eP=aJ.st local s7=eP.Parent and eP:GetAttribute("HasSquishy")and eP:GetAttribute("PourId")==aJ.id
local s8=s7 and A.left(eP)if s8 then aJ.ends=cA+s8 end if not s7 then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aJ.id or"?"]then
A.done[aJ.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aJ.id or"?"]=true},1 end local CB=aJ.before
task.spawn(function()pcall(A.finishedOne,aJ,CB)end)end elseif aJ.ends-cA>e.GlazeLead*3+60 or cA>aJ.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aJ.id or"?"]=z()+120 D(("station %s is not finishing yet (%s left) - glaze team off again"):format(eP.Name,A.clock(aJ.ends-cA)))
end end if e.TeamGlaze~=""and not A.glazeFor then local CC=A.speedRatio(e.TeamGlaze)for KK,cB in ipairs(A.list)do
if cB.sure and(cB.ends-cA)*CC[cB.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cB.id or"?"]or 0)and not A.done[cB.id or"?"]then
A.glazeFor=cB task.spawn(function()cB.before=A.glazeCount()end)break end end end local aK,eQ="",""local dl=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cA)
if dl and dl<-8 then q.snapAt,dl=nil,nil end if e.TeamGlaze~=""and dl and dl<=20 then aK,eQ=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(dl)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aK,eQ=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aK,eQ=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aK,eQ=e.TeamFull," - every station is busy"else aK=e.TeamNormal end A.want=aK local eR=A.current()A.cur=eR if aK~=""and eR~=aK and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aK)then D("team: "..aK..eQ)else A.nextTry=z()+3 end end local lw=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eR~=""and eR or"(not a saved team)",(aK~=""and aK~=eR)and(" -> "..aK)or"",
lw and("in "..A.clock(lw.ends-cA).." (st "..lw.st.Name..")")or"- none running")end function A.clock(bT)bT=math.max(0,math.floor(bT))
if bT>=3600 then return("%d:%02d:%02d"):format(math.floor(bT/3600),math.floor((bT%3600)/60),bT%60)end return("%d:%02d"):format(math.floor(bT/60),bT%60)
end function A.allBusy()local CD,CE=gk()return CE>0 and CD==0 end function A.aboutToPlace()if not c.running then return false end
local hx=ad()if not(hx and aP(hx))then return false end if(e.NoWax and not q.isLimited(hx))or(q.isLimited(hx)and not q.limitedHere())then return false end
local CG=gk()return CG>0 end function A.mult(s9,CH,s_)return{(1+s9)*(1+s_),(1+s9+CH)*(1+s_)}end function A.speedNow()
local function lx(CI)return tonumber(K:GetAttribute(CI))or 0 end return A.mult(lx("PetWaxSpeed"),lx("PetLongWax"),lx("PetSocialWax"))
end function A.speedOf(CJ)local CK,ta=A.teams()if not ta then return nil end for KL,tb in ipairs(CK)do if tb.name==CJ then
local ly={}for KM,CL in ipairs(tb.pets or{})do for KN,td in ipairs(ta.pets or{})do if tostring(td.id)==tostring(CL)then ly[#ly+1]=td break end end
end local te=y.caps()local tf,CM=y.stats(ly)return A.mult(math.min(tf.waxSpeed or 0,te.waxSpeed or 0.25),math.min(tf.longWax or 0,te.longWax or 0.3),CM.socialWax or 0)
end end return nil end function A.speedRatio(CN)local th,lz=A.speedNow(),A.speedOf(CN)if not lz then return{1,1}end
return{th[1]/lz[1],th[2]/lz[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(CO)local lA=o.info()if lA and type(lA.fuseNeed)=="function"then local CP,lB=pcall(lA.fuseNeed,K,CO or"")
if CP and tonumber(lB)and tonumber(lB)>=2 then return tonumber(lB)end end if K:GetAttribute("FusePass")==true or K:GetAttribute("FusePass4")==true then return 3 end
if K:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(ti)
if ti=="Huge"then return y.needFor("")*y.needFor("Big")end if ti=="Big"then return y.needFor("")end return 1 end
function y.nextOf(tj)return(tj==""and"Big")or(tj=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lC=o.info()return(lC and type(lC.HugeCaps)=="table")and lC.HugeCaps or y.HCAPS end function y.cosmic()local lD=o.info()return(lD and type(lD.CosmicCaps)=="table")and lD.CosmicCaps or{StarWhale=0.1}end
function y.slots()local tk=o.data()return tonumber(tk and tk.slots)or(3+(tonumber(K:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lE=o.info()return(lE and type(lE.Caps)=="table")and lE.Caps or y.CAPS end function y.value(tl,cC)
local hy=o.info()local cD=hy and hy.Pets[tl]if not(cD and type(cD.boost)=="table")then return nil end local cE
if type(hy.boostValue)=="function"then local CQ,CS=pcall(hy.boostValue,tl,(cC~=""and cC)or nil)cE=CQ and tonumber(CS)or nil
end if not cE then local eS=cD.boost.value or 0 cE=eS if cC=="Big"or cC=="Huge"then local tm=eS*(cC=="Huge"and 1.75 or 1.5)
cE=y.ROUND[cD.boost.kind]and math.max(eS+(cC=="Huge"and 2 or 1),math.floor(tm+0.5))or tm if cC=="Huge"and y.ROUND[cD.boost.kind]then cE=math.max(cE,math.max(eS+1,math.floor(eS*1.5+0.5))+1)end
end end return cD.boost.kind,cE,cD.boost.every end function y.stats(CT)local cF,lF,tn,eT={},{},{},{}local CU=y.cosmic()
for KO,dm in ipairs(CT)do local aw,eU,to=y.value(dm.name,dm.variant or"")if aw then if dm.variant=="Huge"then tn[y.CAPKEY[aw]or aw]=true end
if aw:sub(1,6)=="social"then lF[aw]=math.max(lF[aw]or 0,eU)elseif aw=="waxStir"or aw=="cashGift"then cF[aw]=(cF[aw]or 0)+eU*60/(to or 60)
elseif aw=="luckyPull"then cF.luckyPull=(cF.luckyPull or 0)+eU/(to or 10)else cF[aw]=(cF[aw]or 0)+eU if CU[dm.name]then eT[aw]=eT[aw]or{}eT[aw][dm.name]=(eT[aw][dm.name]or 0)+eU end
end end end return cF,lF,tn,eT end function y.glazeGain(CV,hz)local eV,lG,KP={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local CW=eV[1]+eV[2]+eV[3]local CX=tonumber(K:GetAttribute("GuildUpGlaze"))or 0 local dn={}for hA=1,3 do dn[hA]=eV[hA]+CV*eV[hA]/CW+(hA==1 and CX or 0)end
local lH={dn[1]*(1-hz),dn[2]*(1-hz)+dn[1]*hz,dn[3]+dn[2]*hz}return lH[1]*(lG[1]-1)+lH[2]*(lG[2]-1)+lH[3]*(lG[3]-1)
end function y.score(hB,CY)local CZ,C0,C1=y.caps(),y.hcaps(),y.cosmic()local hC,hD,C2,tp=y.stats(CY)local function lI(lJ)return(C2[lJ]and C0[lJ])or CZ[lJ]or math.huge end
local function bt(hE)local lK,lL=hC[hE]or 0,lI(hE)local lM=math.min(lK,lL)if tp[hE]and lK>lL then local lN=0 for C3,C4 in pairs(tp[hE])do lN=lN+math.min(C4,C1[C3]or 0)end
lM=lM+math.min(lK-lL,lN)end return lM end local C5=(1+bt("income"))*(1+(hD.socialIncome or 0))*(1+math.min(hC.cashGift or 0,lI("cashGiftPerMinute"))/60)
local C6=1+bt("luck")+(hC.luckyPull or 0)+(hD.socialLuck or 0)local tq=C6*(1+bt("newFind"))*(1+bt("rollSpeed"))
local eW=math.log(C5)local C7=math.max(tonumber(K:GetAttribute("WaxStations"))or 18,1)local lO=(1+bt("waxSpeed")+bt("longWax"))*(1+(hD.socialWax or 0))
+math.min(hC.waxStir or 0,lI("waxStirPerMinute"))/60/C7 local C8=1-(1-bt("headStart"))*(1-(hD.socialHeadStart or 0))
if hB=="farm"then return eW+0.7*math.log(tq)+0.1*math.log(lO)end if hB=="full"then return eW+0.4*math.log(lO)+0.02*math.log(tq)end
if hB=="glaze"then return y.glazeGain(bt("glaze"),bt("glazeUp"))+0.001*eW end if hB=="wax"then return-math.log(1-0.5*C8)+0.001*eW+0.001*math.log(lO)end
return eW end function y.kinds(C9)local tr,lP={},{}for KQ,eX in ipairs(C9)do local ts=eX.name.."|"..(eX.variant or"")
local bU=tr[ts]if not bU then bU={name=eX.name,variant=eX.variant or"",n=0,ids={}}tr[ts]=bU lP[#lP+1]=bU end bU.n=bU.n+1
bU.ids[#bU.ids+1]=eX.id end return lP end function y.bestKinds(tt,bV,C_,tu,tv)local aD,bW={},{}local function lQ(Da)
local tw,hF={},{}for Db,lR in ipairs(Da)do tw[Db]=bV[lR]hF[lR]=(hF[lR]or 0)+1 end local eY=y.score(tt,tw)if tu then for Dc,Dd in pairs(hF)do eY=eY+1e-7*math.min(Dd,tu[Dc]or 0)end end
if tv then for De,Df in pairs(hF)do eY=eY-1e-8*Df*tv[bV[De].variant]end end return eY end for KR=1,C_ do local eZ,lS
for hG=1,#bV do if(bW[hG]or 0)<bV[hG].n then aD[#aD+1]=hG local tx=lQ(aD)aD[#aD]=nil if not lS or tx>lS+1e-12 then eZ,lS=hG,tx end
end end if not eZ then break end bW[eZ]=(bW[eZ]or 0)+1 aD[#aD+1]=eZ if#bV>40 then task.wait()end end for KS=1,6 do
task.wait()local ty,tz=false,lQ(aD)for lT=1,#aD do for dp=1,#bV do local hH=aD[lT]if dp~=hH and(bW[dp]or 0)<bV[dp].n then
aD[lT]=dp local tA=lQ(aD)if tA>tz+1e-9 then bW[hH],bW[dp],tz,ty=bW[hH]-1,(bW[dp]or 0)+1,tA,true else aD[lT]=hH end
end end end if not ty then break end end local tB={}for Dg,Dh in ipairs(aD)do tB[Dg]=bV[Dh]end return aD,y.score(tt,tB)
end function y.best(Di,Dj,Dk,hI)hI=hI or{}local lU=y.kinds(Dj)local lV={}for tC,Dl in ipairs(lU)do for KT,Dm in ipairs(Dl.ids)do if hI[tostring(Dm)]then lV[tC]=(lV[tC]or 0)+1 end end end
local Dn,Do=y.bestKinds(Di,lU,Dk,lV)local lW,lX={},{}for KU,Dp in ipairs(Dn)do local tD,e0=lU[Dp],nil for KV,lY in ipairs(tD.ids)do if hI[tostring(lY)]and not lW[lY]then e0=lY break end end
if not e0 then for KW,tE in ipairs(tD.ids)do if not lW[tE]then e0=tE break end end end lW[e0]=true lX[#lX+1]=tostring(e0)
end return lX,Do end function y.dream()local tF=o.info()if not(tF and type(tF.Pets)=="table")then return nil end
local lZ=y.slots()local tG=y.needFor("").."|"..y.needFor("Big").."|"..lZ.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==tG and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local Dv=pcall(function()local hJ={}for KX,Dq in ipairs(o.order())do for KY,Dr in ipairs({"","Big","Huge"})do hJ[#hJ+1]={name=Dq,variant=Dr,n=lZ,ids={}}end
end local e1,l0={},{}for KZ,hK in ipairs(y.ROLES)do if e[hK[1]]~=""then local Ds,Dt=y.bestKinds(hK[2],hJ,lZ,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local l1,hL={},{}for K0,tH in ipairs(Ds)do l1[tH]=(l1[tH]or 0)+1 end for Du,l2 in pairs(l1)do local bX=hJ[Du]
e1[bX.name]=e1[bX.name]or{[""]=0,Big=0,Huge=0}e1[bX.name][bX.variant]=math.max(e1[bX.name][bX.variant],l2)hL[#hL+1]=(l2>1 and(l2 .."x ")or"")..o.nice(bX.name,bX.variant)
end table.sort(hL)l0[#l0+1]={role=hK[2],team=e[hK[1]],names=hL,score=Dt}end end y.dreamT,y.dreamTeams,y.dreamSig=e1,l0,tG
end)y.dreaming=false if not Dv then y.dreamSig=nil end return y.dreamT end function y.owned(hM)local tI,l3={},{}
for K1,Dw in ipairs(hM and hM.arriving or{})do tI[tostring(Dw)]=true end for K2,cG in ipairs(hM and hM.pets or{})do
if not tI[tostring(cG.id)]then l3[#l3+1]={id=tostring(cG.id),name=cG.name,variant=cG.variant or"",named=cG.named or(cG.nickname and cG.nickname~="")}
end end return l3 end function y.have(tJ,Dx,Dy)local ba={[""]=0,Big=0,Huge=0}local tK={}for K3,e2 in ipairs(y.owned(Dx))do
tK[e2 .id]=true if e2 .name==tJ and ba[e2 .variant]then ba[e2 .variant]=ba[e2 .variant]+1 end end if Dy then for K4,dq in ipairs(o.recent or{})do
if dq.name==tJ and not tK[dq.id]and z()-dq.at<20 and ba[dq.variant or""]then ba[dq.variant or""]=ba[dq.variant or""]+1 end
end end return ba,ba[""]+ba.Big*y.unit("Big")+ba.Huge*y.unit("Huge")end function y.goal(tL)local tM=e.Pets[tL]
if tM and tonumber(tM.f)==-1 then return nil,0 end local tN=y.dream()local e3=tN and tN[tL]if not e3 then return nil,0 end
return e3,e3[""]+e3 .Big*y.unit("Big")+e3 .Huge*y.unit("Huge")end function y.wantMore(l4,K5,tO)if not tO then return true end
local tP=e.Pets[l4]if tP and tonumber(tP.f)==-1 then return true end local Dz,DA=y.goal(l4)if not Dz then return true end
local K6,DB=y.have(l4,tO,true)return DB<DA+y.need()end function y.status(e4,tQ)if not tQ then return nil end local tR=e.Pets[e4]
if tR and tonumber(tR.f)==-1 then return"KEEP: never fused"end local cH,tS=y.goal(e4)if not cH then return y.dream()and"in no best team: bought as ticked"or nil end
local l5,DC=y.have(e4,tQ)local cI={}if cH.Huge>0 then cI[#cI+1]=("Huge %d/%d"):format(l5 .Huge,cH.Huge)end if cH.Big>0 then cI[#cI+1]=("Big %d/%d"):format(l5 .Big,cH.Big)end
if cH[""]>0 then cI[#cI+1]=("plain %d/%d"):format(l5[""],cH[""])end local DD=y.blocked and y.blocked[e4]and(" | "..y.blocked[e4])or""
return("%s | %d/%d copies%s"):format(table.concat(cI," "),math.min(DC,tS),tS,DD)end function y.wear(l6)local l7={}
for K7,DE in ipairs(l6)do l7[tostring(DE)]=true end for K8=1,3 do local dr=o.data()if not dr then return false end
for K9,tT in ipairs(dr.equipped or{})do if not l7[tostring(tT)]then o.call("unequip",tT)task.wait(0.3)end end
dr=o.data()local tU={}for K_,DF in ipairs(dr.equipped or{})do tU[tostring(DF)]=true end for La,tV in ipairs(l6)do
if not tU[tostring(tV)]then o.call("equip",tV)task.wait(0.3)end end task.wait(0.4)dr=o.data()local l8,tW=0,true
for Lb,DG in ipairs(dr.equipped or{})do l8=l8+1 if not l7[tostring(DG)]then tW=false end end if tW and l8==#l6 then return true end
end return false end function y.saveTeam(tX,tY)if not y.wear(tY)then return false,"could not put the pets on"end
local DH=A.teams()local cJ for DI,DJ in ipairs(DH)do if DJ.name==tX then cJ=DI break end end local ds if cJ then
ds=o.call("teamSave",cJ)else ds=o.call("teamNew")if type(ds)=="table"and ds.ok and ds.index then cJ=ds.index task.wait(0.3)
o.call("teamRename",{index=cJ,name=tX})end end task.wait(0.4)local l9=o.data()local tZ=l9 and l9 .teams and cJ and l9 .teams[cJ]
if not tZ then return false,"the game did not save it"end local t0={}for Lc,DK in ipairs(tZ.pets or{})do t0[tostring(DK)]=true end
for Ld,DL in ipairs(tY)do if not t0[tostring(DL)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local DM=o.srv()for Le,DN in ipairs(A.list or{})do if DN.ends-DM<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local e5=o.data()if not e5 then return{}end local t1={}for Lf,DO in ipairs(e5 .arriving or{})do t1[tostring(DO)]=true end
local e6={}for Lg,hN in ipairs(e5 .pets or{})do if not t1[tostring(hN.id)]then e6[#e6+1]={id=tostring(hN.id),name=hN.name,variant=hN.variant or""}end
end local t2={}for Lh,t3 in ipairs(e6)do t2[t3 .id]=t3 end local t4=tonumber(e5 .slots)or 3 local l_,t5={},{}
for Li,hO in ipairs(y.ROLES)do local e7=e[hO[1]]if e7~=""and not t5[e7]then t5[e7]=true local ma,e8,t6={},{},false
for Lj,t7 in ipairs(e5 .teams or{})do if t7 .name==e7 then for Lk,DP in ipairs(t7 .pets or{})do local mb=t2[tostring(DP)]
if mb then ma[mb.id]=true e8[#e8+1]=mb else t6=true end end end end local mc,t8=y.best(hO[2],e6,t4,ma)local t9=y.score(hO[2],e8)
local t_=#mc==#e8 for Ll,DQ in ipairs(mc)do if not ma[DQ]then t_=false end end if not t_ and(t6 or#e8<math.min(t4,#e6)or t8>t9+1e-4)then
l_[#l_+1]={team=e7,role=hO[2],ids=mc,gain=t8-t9}end end end return l_ end function y.rebuild(DR)local ua=y.plan()
if#ua==0 then y.buildMsg="teams are already the best your pets allow"return true end if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end
A.editing,A.editingSince=true,z()local hP=true local DV,DW=pcall(function()for Lm,e9 in ipairs(ua)do local DS,DT=y.saveTeam(e9 .team,e9 .ids)
local ub=o.data()local md={}for Ln,DU in ipairs(e9 .ids)do for Lo,me in ipairs(ub and ub.pets or{})do if tostring(me.id)==DU then md[#md+1]=o.nice(me.name,me.variant)end
end end if DS then D(("TEAM %s rebuilt (%s): %s"):format(e9 .team,DR or"pets changed",table.concat(md,", ")))
else hP=false D(("TEAM %s: %s"):format(e9 .team,tostring(DT)))end end end)A.editing,A.nextTry=false,0 if not DV then hP=false D("TEAM BUILD ERR "..tostring(DW))end
y.builds=y.builds+1 y.buildMsg=hP and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return hP end function y.roleScores(uc)local bY={}for Lp,ud in ipairs(uc)do bY[#bY+1]=ud.name..ud.variant end
table.sort(bY)bY=table.concat(bY,",")y.rsCache=y.rsCache or{}if y.rsCache[bY]then return y.rsCache[bY]end local DX,DY,mf=y.kinds(uc),y.slots(),{}
for Lq,mg in ipairs(y.ROLES)do if e[mg[1]]~=""then local Lr,DZ=y.bestKinds(mg[2],DX,DY)mf[mg[2]]=DZ end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bY]=mf return mf end function y.noLoss(ue,D0,D1,D2)local uf,e_={},{}
for Ls,D3 in ipairs(D0)do uf[D3]=true end for Lt,ug in ipairs(ue)do if not uf[ug.id]then e_[#e_+1]=ug end end
e_[#e_+1]={id="new",name=D1,variant=D2}local D4,uh=y.roleScores(ue),y.roleScores(e_)local ui=false for mh,uj in pairs(D4)do
if(uh[mh]or-math.huge)<uj-1e-6 then return false,mh end if(uh[mh]or 0)>uj+1e-6 then ui=true end end return true,ui
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local fa=o.data()if not fa then return end local uk=y.owned(fa)local hQ,fb={},{}for Lu,D5 in ipairs(fa.teams or{})do for Lv,D6 in ipairs(D5 .pets or{})do hQ[tostring(D6)]=true end end
for Lw,D7 in ipairs(fa.equipped or{})do fb[tostring(D7)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for Lx,aL in ipairs(o.order())do
local hR=y.goal(aL)if hR then local mi=y.have(aL,fa)for Ly,bu in ipairs({"Big",""})do local dt,mj=y.nextOf(bu),y.needFor(bu)
local D8=(bu=="Big"and mi.Huge<hR.Huge)or(bu==""and mi.Big<hR.Big+y.needFor("Big")*math.max(0,hR.Huge-mi.Huge))
local fc={}for Lz,ml in ipairs(uk)do if ml.name==aL and ml.variant==bu then fc[#fc+1]=ml end end if D8 and#fc>=mj and z()>=(y.failUntil[aL..bu]or 0)then
table.sort(fc,function(hS,hT)local ul=(fb[hS.id]and 4 or 0)+(hQ[hS.id]and 2 or 0)+(hS.named and 1 or 0)local um=(fb[hT.id]and 4 or 0)+(hQ[hT.id]and 2 or 0)+(hT.named and 1 or 0)
if ul~=um then return ul<um end return hS.id<hT.id end)local cK,mm,uo={},{},false for du=1,mj do cK[du]=fc[du].id
if fb[cK[du]]then mm[#mm+1]=cK[du]end if fb[cK[du]]or hQ[cK[du]]then uo=true end end local D9,up=y.noLoss(uk,cK,aL,dt)
if not D9 then y.blocked[aL]=("%s waits: it would weaken the %s team now"):format(dt,y.ROLENAME[up]or tostring(up))
elseif uo and not y.quiet()then y.blocked[aL]=dt.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dt,o.nice(aL))
return else A.editing,A.editingSince=true,z()for LA,D_ in ipairs(mm)do o.call("unequip",D_)task.wait(0.3)end local hU=o.call("fuse",{ids=cK})
A.editing,A.nextTry=false,0 if type(hU)=="table"and hU.ok then y.fused=y.fused+1 y.dirtyAt=z()D(("FUSED %d %s -> %s"):format(mj,o.nice(aL,bu),o.nice(aL,dt)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aL,dt),os.date("%H:%M"))else y.failUntil[aL..bu]=z()+120 D(("fuse %s failed: %s"):format(o.nice(aL,bu),type(hU)=="table"and tostring(hU.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local uq=o.data()if not uq then return end local cL={}for LB,Ea in ipairs(uq.pets or{})do cL[#cL+1]=tostring(Ea.id)end
table.sort(cL)cL=table.concat(cL,",")if cL~=y.sig then y.sig,y.dirtyAt=cL,z()end local Eb=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if Eb and not A.editing then local Ec=y.rebuild(y.dirtyAt and"pets changed"or"check")if Ec then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cM)return cM:IsA("ParticleEmitter")or cM:IsA("Trail")or cM:IsA("Beam")or cM:IsA("Fire")or cM:IsA("Smoke")
or cM:IsA("Sparkles")or cM:IsA("Light")end function d.muteOne(bv)if not e.Lite or not bv.Parent then return end
local hV=(bv:IsA("BillboardGui")and d.bb)or(d.isFx(bv)and d.fx)or nil if not hV or hV[bv]~=nil then return end
if hV==d.fx and d.gameLow and not bv:IsA("Beam")then return end hV[bv]=bv.Enabled if bv.Enabled then bv.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local mn={}for LC,Ed in ipairs({d.bb,d.fx})do for Ee in pairs(Ed)do mn[#mn+1]=Ee end end local ur=os.clock()for Ef,fd in ipairs(mn)do
if e.Lite and fd.Parent and fd.Enabled then local Eg=d.bb[fd]~=nil and d.bb or d.fx Eg[fd]=true fd.Enabled=false
end if Ef%200==0 and os.clock()-ur>0.002 then task.wait()ur=os.clock()end end end function d.lite(us)e.Lite=us
if us then task.spawn(function()for Eh,Ei in ipairs(ak:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Ei)
if Eh%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=V(ak.DescendantAdded:Connect(function(mo)
if e.Lite and(mo:IsA("BillboardGui")or d.isFx(mo))then d.queue[#d.queue+1]=mo end end))end local mp=game:GetService("Lighting")
for LD,fe in ipairs(mp:GetChildren())do if fe:IsA("PostEffect")and fe.Enabled and d.post[fe]==nil then d.post[fe]=true fe.Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and mp.GlobalShadows or d.oldShadows mp.GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ak.Terrain.Decoration or d.oldDeco ak.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for LE,Ej in pairs(d.watch)do pcall(function()Ej:Disconnect()end)end
for ut,Ek in pairs(d.bb)do pcall(function()if ut.Parent then ut.Enabled=Ek end end)end for uu,El in pairs(d.fx)do pcall(function()if uu.Parent then uu.Enabled=El end end)end
for uv in pairs(d.post)do pcall(function()if uv.Parent then uv.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local Em=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()Em.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ak.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(uw)
local En,mq=pcall(function()return require(ag:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not En or type(mq)~="table"then return end if uw and not d.ceOld then d.ceOld={}for LF,ux in ipairs({"Fireworks","Confetti"})do
local hW=mq[ux]if type(hW)=="table"and type(hW.Play)=="function"then d.ceOld[ux]=hW.Play pcall(function()hW.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not uw and d.ceOld then for Eo,Ep in pairs(d.ceOld)do pcall(function()mq[Eo].Play=Ep end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local mr,hX for LG,ff in ipairs(getgc(false))do if type(ff)=="function"and(type(islclosure)~="function"or islclosure(ff))then
local Eq,uy,uz=pcall(debug.info,ff,"sn")if Eq and type(uy)=="string"and uy:find("ToppingCullHandler",1,true)then
if uz=="poll"then mr=ff elseif uz=="retarget"then hX=ff end end end end if not(mr and hX)then return nil end local Er,hY=pcall(debug.getupvalues,hX)
local uA=Er and type(hY)=="table"and hY[3]if type(uA)~="function"or debug.info(uA,"n")~="targetFor"or(hY[1]~=nil and type(hY[1])~="number")then return nil end
d.tc={poll=mr,re=hX}return d.tc end function d.tops(uB)local aR=d.topsFind()if not aR then return false end if uB and not aR.old then
local Es,Et=pcall(hookfunction,aR.poll,function()end)if not Es then return false end aR.old=Et pcall(debug.setupvalue,aR.re,1,-1000)
pcall(aR.re)elseif not uB and aR.old then local Eu=type(restorefunction)=="function"and pcall(restorefunction,aR.poll)
if not Eu then pcall(hookfunction,aR.poll,aR.old)end aR.old=nil pcall(aR.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(Ev)local uC=ak:FindFirstChild("Plots")local uD=os.clock()if Ev then for LH,Ew in ipairs(uC and uC:GetChildren()or{})do
local uE=Ew:FindFirstChild("SkinProps")local uF=uE and uE:FindFirstChild("FairyLights")for LI,uG in ipairs(uF and uF:GetChildren()or{})do
for LJ,fg in ipairs(uG:GetChildren())do if fg:IsA("BasePart")and(fg.Name=="Bulb"or fg.Name=="Wire")then d.lit[fg]=uG fg.Parent=nil end
end if os.clock()-uD>0.002 then task.wait()uD=os.clock()end end end for LK,Ex in ipairs({"Leaderboards","ClanBoard"})do
local ms=ak:FindFirstChild(Ex)if ms then d.boardsOff[ms]=true ms.Parent=nil end end else for Ey,uH in pairs(d.lit)do pcall(function()if uH.Parent then Ey.Parent=uH end end)end
for uI in pairs(d.boardsOff)do pcall(function()if not uI.Parent then uI.Parent=ak end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(Ez)if Ez then local uJ=ag:FindFirstChild("Remotes")local uK=uJ and uJ:FindFirstChild("SquishyRollAnimation")
if not uK or type(getconnections)~="function"then return end local EA,EB=pcall(getconnections,uK.OnClientEvent)
for LL,hZ in ipairs(EA and EB or{})do local mt=""pcall(function()mt=debug.info(hZ.Function,"s")end)if type(mt)=="string"and mt:find("SquishyHandler",1,true)and not d.reel[hZ]then
if pcall(function()hZ:Disable()end)then d.reel[hZ]=true end end end else for EC in pairs(d.reel)do pcall(function()EC:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(ED)if not ED then for LM,EE in pairs(d.quiet)do pcall(function()EE:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function mu(EF,EG)local EH,EI=pcall(getconnections,EF)
for LN,h0 in ipairs(EH and EI or{})do local mv=""pcall(function()mv=debug.info(h0 .Function,"s")end)local mw=h0 .Function
if mw and type(mv)=="string"and mv:find(EG,1,true)and not d.quiet[mw]then if pcall(function()h0:Disable()end)then d.quiet[mw]=h0 end
end end end local uL=ak:FindFirstChild("Plots")for LO,h1 in ipairs(uL and uL:GetChildren()or{})do if h1~=c.plot then
mu(h1:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uM,uN=h1:FindFirstChild("WaxStations"),h1:FindFirstChild("SquishyStack")
if uM then mu(uM.DescendantAdded,"LocalToppingsHandler")end if uN then mu(uN.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for uO,EJ in pairs(d.lit)do if not EJ:IsDescendantOf(game)then d.lit[uO]=nil pcall(function()uO:Destroy()end)end
end end function d.passText()local ax=function(EK)return K:GetAttribute(EK)end local mx={}local function bZ(EL,EM)mx[#mx+1]=(EL and"[x] "or"[  ] ")..EM end
bZ(ax("VIP")==true,"VIP: money x1.5, offline +50%")bZ(ax("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(ax("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local EN=ax("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(ax("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bZ(ax("FastWax")==true or ax("SuperFastWax")==true,EN.." (the farm times by the game's own timers)")local uP=(ax("FusePass")==true and"Fuse Pass")or(ax("FusePass4")==true and"Fuse Pass 4")or(ax("FusePass5")==true and"Fuse Pass 5")or nil
bZ(uP~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uP or"Fuse pass",y.needFor(""),y.needFor("Big")))local h2=o.data()
local EO=tonumber(h2 and h2 .maxOwned)or 60 bZ(ax("PetInventory50")==true or ax("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(h2 and#(h2 .pets or{})or 0,EO,(ax("PetInventory50")==true and ax("PetInventory100")==true)and" (both bag passes)"or""))
local uQ=tonumber(ax("PetEquipBought"))or 0 bZ(uQ>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uQ))
local uR=tonumber(ax("PetWishCredits"))or 0 if uR>0 then bZ(true,("%d free wishes: used before cash"):format(uR))end
local uS=tonumber(ax("FinishAllCredits"))or 0 if uS>0 then bZ(true,("%d finish-all credits (yours to use)"):format(uS))end
return table.concat(mx,"\n")end function d.extras(h3)pcall(d.quietPlots,h3 and c.plot~=nil)pcall(d.fxPatch,h3)
pcall(d.tops,h3)pcall(d.lights,h3)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uT)
e.HideHud=uT local my=K:FindFirstChildOfClass("PlayerGui")if not my then return end if uT then for LP,fh in ipairs(my:GetChildren())do
if fh:IsA("ScreenGui")and not d.MINE[fh.Name]and fh.Enabled then d.hud[fh]=true fh.Enabled=false end end if not d.hudConn then
d.hudConn=V(my.ChildAdded:Connect(function(fi)if e.HideHud and fi:IsA("ScreenGui")and not d.MINE[fi.Name]then
task.defer(function()if e.HideHud and fi.Enabled then d.hud[fi]=true fi.Enabled=false end end)end end))end else
for uU in pairs(d.hud)do pcall(function()if uU.Parent then uU.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mz)e.FpsCap=mz local uV=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uV then return false end return pcall(uV,mz==0 and 60 or mz)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ap)if ap:IsA("BasePart")or ap:IsA("Decal")or ap:IsA("Texture")then if ap.Transparency<1 then d.unseen[ap]=ap.Transparency ap.Transparency=1 end
elseif ap:IsA("BillboardGui")or ap:IsA("SurfaceGui")or ap:IsA("ParticleEmitter")or ap:IsA("Beam")or ap:IsA("Trail")or ap:IsA("Light")or ap:IsA("Fire")or ap:IsA("Smoke")or ap:IsA("Sparkles")then
if ap.Enabled then d.unseen[ap]=true ap.Enabled=false end end end function d.notMine(EP)return e.HideMine or(c.plot and not EP:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(h4)
local mA=h4 .Parent local mB=mA and mA.Name=="SquishyStack"and mA.Parent if mB and mB~=c.plot and c.plot and mB.Parent==c.plot.Parent and not d.dropSeen[h4]then
d.dropSeen[h4]=true d.dropQ[#d.dropQ+1]={h4,z()+3}end end function d.dropScan()local uW=c.plot and c.plot.Parent
if not(e.HideBases and uW)then return end for LQ,uX in ipairs(uW:GetChildren())do local uY=uX~=c.plot and uX:FindFirstChild("SquishyStack")
for LR,EQ in ipairs(uY and uY:GetChildren()or{})do d.dropIt(EQ)end end end function d.dropStep(ER)local mC=d.dropQ
while d.dropI<=#mC and os.clock()-ER<0.003 do local mD=mC[d.dropI]if mD[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mD[1].Parent then pcall(function()mD[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mC then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mE=os.clock()local fj=d.queue if e.Lite and fj and#fj>0 then d.muteI=d.muteI or 1
while d.muteI<=#fj and os.clock()-mE<0.0015 do pcall(d.muteOne,fj[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#fj then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mE)end local h5=d.hideQ if d.hideI>#h5 then return end while d.hideI<=#h5 and os.clock()-mE<0.004 do
local mF=h5[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mF.Parent and d.notMine(mF)then pcall(d.hideOne,mF)end
end if d.hideI>#h5 then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(uZ)if e.HideBases then d.bases(false)end
e.HideMine=uZ==2 if uZ>0 then d.bases(true)end end function d.bases(u0)e.HideBases=u0 local mG=ak:FindFirstChild("Plots")
if not mG then return end if u0 then task.spawn(function()local mH=0 for LS,h6 in ipairs(mG:GetChildren())do local u1=h6~=c.plot and c.plot and h6:FindFirstChild("SquishyStack")
for LT,ES in ipairs(u1 and u1:GetChildren()or{})do d.dropIt(ES)end if h6~=c.plot or e.HideMine then for LU,ET in ipairs(h6:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,ET)mH=mH+1 if mH%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=V(mG.DescendantAdded:Connect(function(dv)if e.HideBases and d.notMine(dv)then
pcall(d.hideOne,dv)d.hideQ[#d.hideQ+1]=dv if dv.Parent and dv.Parent.Name=="SquishyStack"then d.dropIt(dv)end
end end))end else for mI,u2 in pairs(d.unseen)do pcall(function()if not mI.Parent then return end if type(u2)=="number"then mI.Transparency=u2 else mI.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(u3)e.NoRender=u3 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not u3)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local EU=game:GetService("RunService")local mJ=0 for LV,EW in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local EX,u4=pcall(function()return EU[EW]end)local u5,mK=false,nil if EX and u4 then u5,mK=pcall(getconnections,u4)end
if u5 and type(mK)=="table"then for LW,h7 in ipairs(mK)do local mL=""pcall(function()local u6=getfenv(h7 .Function).script mL=u6 and u6:GetFullName()or""end)
if mL~=""then for LX,EY in ipairs(d.CALM)do if mL:find(EY,1,true)then local mM=h7 .Function if mM and not d.calmedF[mM]and pcall(function()h7:Disable()end)then
d.calmedF[mM]=true d.calmed[#d.calmed+1]=h7 mJ=mJ+1 end break end end end end end end if#d.calmed>200 then local mN={}for EZ=#d.calmed-49,#d.calmed do mN[#mN+1]=d.calmed[EZ]end d.calmed=mN
end return mJ end function d.walker()local E0,mO=pcall(function()return require(K.PlayerScripts.LocalScript.PetHandler.Walker)end)
return(E0 and type(mO)=="table"and type(mO.walkTo)=="function")and mO or nil end function d.walkers(E1)local u7={}
local E2,E3=pcall(debug.getupvalues,E1 .destroy)for LY,u8 in ipairs(E2 and E3 or{})do if type(u8)=="table"then
for h8 in pairs(u8)do if type(h8)=="table"and rawget(h8,"model")~=nil and rawget(h8,"position")~=nil then u7[h8]=true end end
end end return u7 end function d.walkPatch(u9)local fk=d.walker()if not fk then return 0 end if u9 and not d.wkOld then
local u_=fk.walkTo d.wkOld=u_ fk.walkTo=function(fl,fm,E4,mP)local E5=fm~=nil and pcall(function()return fm.X+fm.Z end)
if not e.Calm or not E5 then return u_(fl,fm,E4,mP)end fl.target,fl.onArrive=nil,nil pcall(function()fl:teleport(fm)fl:render(0)end)
if mP then task.spawn(mP)end end elseif not u9 then if d.wkOld then fk.walkTo,d.wkOld=d.wkOld,nil end return 0
end local mQ=0 for aM in pairs(d.walkers(fk))do if aM.target and not aM.destroyed then local va=aM.model and aM.model:FindFirstChild("Body")and aM.model.Body:FindFirstChild("PetBillboard")
local vb=va and va:FindFirstChild("TimerLabel",true)if vb and tostring(vb.Text):find("'s plot!",1,true)then pcall(function()aM:destroy()end)
pcall(function()aM.model:Destroy()end)else local E6,vc=aM.target,aM.onArrive aM.target,aM.onArrive=nil,nil pcall(function()aM:teleport(E6)aM:render(0)end)
if vc then task.spawn(vc)end end mQ=mQ+1 end end return mQ end function d.calm(vd)e.Calm=vd if vd then local E7=d.calmScan()
local mR=0 pcall(function()mR=d.walkPatch(true)end)D(("NO ANIMATIONS: %d of the game's animation loops switched off%s"):format(E7,mR>0 and(", "..mR.." stuck pet walks cleared")or""))
else for LZ,E8 in ipairs(d.calmed)do pcall(function()E8:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
pcall(d.walkPatch,false)end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end
if J.arPaused then pcall(J.resume,"script stopped")end pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(ve)if c.rejoining then return end D("REJOIN this server ("..ve..")")
pcall(gn)if c.autoload then pcall(ef,c.autoload)end qu()local E9=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,K)
end)task.delay(25,function()if c.alive then eg(ve..", same server failed")end end)return E9 end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=K:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local vf=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if vf then for L0,E_ in ipairs(vf:GetChildren())do local vg=E_:FindFirstChild("SquishyPlaceHolder")local cN=vg and vg:FindFirstChild("TimerGui")
if cN and cN:IsA("BillboardGui")then if d.bb[cN]==nil then pcall(d.muteOne,cN)elseif cN.Enabled then d.bb[cN]=true cN.Enabled=false end
end end end local Fa,dw=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Fa and type(dw)=="number"then
d.mem=dw d.memPeak=math.max(d.memPeak,dw)if(e.MemLimit or 0)>0 and dw>e.MemLimit then d.over=(d.over or 0)+((dw>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dw,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()D(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mS(h9)if type(h9)~="string"then return false end
h9=h9:lower()for L1,Fb in ipairs(c.sellWords)do if h9:find(Fb,1,true)then return true end end return false end
local function Fc()local vh=ag:FindFirstChild("Remotes")local mT=vh and vh:FindFirstChild("SellSquishy")if not(mT and mT:IsA("RemoteEvent"))then return false end
if not pcall(function()mT:FireServer()end)then return false end return ao(function()return ad()==nil end,1.5)
end local function Fd()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local vi=aq()local vj=vi and vi.HumanoidRootPart.Position local fn,vk for L2,dx in ipairs((c.plot or ak):GetDescendants())do
if dx:IsA("ProximityPrompt")and(mS(dx.ActionText)or mS(dx.ObjectText)or mS(dx.Name))then local vl=pq(dx)local mU=(vl and vj)and(vl-vj).Magnitude or 1e9
if mU<=400 and(not fn or mU<vk)then fn,vk=dx,mU end end end c.sellSpot=fn c.noSellSpot=(fn==nil)return fn end
local function vm()local h_=ad()if not h_ then c.holding=false return false end if aP(h_)then return false end
if q.isLimited(h_)then return false end local mV=am(W(h_))if Fc()then c.sold,c.holding,c.sellFails=c.sold+1,false,0
c.carryBlind,c.attrStale=z()+2.5,0 D("SOLD "..mV)return true end local dy=Fd()if dy then local vn=d4(dy)if vn then
cq(vn,dy)local vo=ad()if vo and not aP(vo)then local Fe,Ff=em(dy,function()return ad()==nil end,function()return dy.Enabled end)
if Fe then c.sold,c.holding,c.sellFails=c.sold+1,false,0 D(("SOLD %s at %s via %s"):format(mV,gi(dy),Ff))return true
end end end end c.sellFails=c.sellFails+1 D("could not sell "..mV.." ("..c.sellFails..")")return false end local Fg={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Fh(dz)local ia=gi(dz):lower()for L3,Fi in ipairs(Fg)do if ia:find(Fi,1,true)then return 0 end end
local bc,as=dz.Name:lower(),0 local function a0(Fj,Fk)return Fj:find(Fk,1,true)~=nil end if a0(bc,"collect")then as=as+60 end
if a0(bc,"cash")or a0(bc,"money")then as=as+45 end if a0(bc,"income")or a0(bc,"claim")then as=as+35 end if a0(bc,"coin")or a0(bc,"earn")or a0(bc,"green")then as=as+20 end
if bc=="pad"or bc=="touch"then as=as+25 end if as==0 and(a0(ia,"collect")or a0(ia,"cash")or a0(ia,"money"))then as=25 end
if as==0 then return 0 end local fo=dz.Color if fo.G>0.5 and fo.G>fo.R*1.4 and fo.G>fo.B*1.4 then as=as+15 end
if math.min(dz.Size.X,dz.Size.Y,dz.Size.Z)<2 then as=as+5 end return as end local function Fl()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local ib,fp,mW={},nil,29 for L4,ic in ipairs(c.plot:GetDescendants())do
if ic:IsA("BasePart")then local ie=Fh(ic)if ie>0 then ib[#ib+1]={s=ie,p=ic}if ie>mW then fp,mW=ic,ie end end end
end table.sort(ib,function(Fm,Fn)return Fm.s>Fn.s end)c.padCands,c.padPart=ib,fp if fp then D("collect pad: "..gi(fp).." (score "..mW..")")end
return fp end local mX="SAB_pad_v1.txt"local function Fo(Fp)if type(writefile)=="function"then pcall(writefile,mX,table.concat({Fp:GetComponents()},","))end
end local function Fq()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Fr,vp=pcall(function()if isfile(mX)then return readfile(mX)end end)
if not Fr or type(vp)~="string"then return nil end local ig={}for Fs in vp:gmatch("[^,]+")do ig[#ig+1]=tonumber(Fs)end
if#ig==12 then return CFrame.new(unpack(ig))end end local function Ft(mY,ih,Fu)local Fv=db(mY)local mZ=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local a1=(mZ and mZ:IsA("BasePart"))and(mZ.Position-ih)or Vector3 .new(1,0,0)a1=Vector3 .new(a1 .X,0,a1 .Z)if a1 .Magnitude<0.05 then a1=Vector3 .new(1,0,0)end
a1=a1 .Unit for Fw=0,7 do local ii=Fw*math.pi/4 local Fx=Vector3 .new(a1 .X*math.cos(ii)-a1 .Z*math.sin(ii),0,a1 .X*math.sin(ii)+a1 .Z*math.cos(ii))
local ij=ih+Fx*(Fu+5)local m0=gX(ij.X,ih.Y,ij.Z)if m0 and math.abs(m0 .Y-ih.Y)<8 then aE(mY,Vector3 .new(ij.X,m0 .Y+Fv,ij.Z))
if kp(mY,0.7)then return true end end end return false end local function Fy()c.lastCollect=z()local fq=aq()if not fq then return end
local vq,Fz=fq.HumanoidRootPart,db(fq)local fr,vr,fs,m1=nil,4,nil,"?"local m2=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and m2 and m2:IsA("BasePart")then fr,m1=(m2 .CFrame*c.manualPad).Position,"manual pad"else local bw=Fl()
if bw then fr=Vector3 .new(bw.Position.X,bw.Position.Y+bw.Size.Y/2+Fz,bw.Position.Z)vr,fs,m1=math.max(bw.Size.X,bw.Size.Z)/2,bw,bw.Name
end end if not fr then D("COLLECT: pad not found - stand on it and tap SET PAD")return end local m3=bk()aE(fq,fr)
if fs and type(firetouchinterest)=="function"then pcall(firetouchinterest,vq,fs,0)end ah(e.PadDwell)if fs and type(firetouchinterest)=="function"then pcall(firetouchinterest,vq,fs,1)end
ah(0.5)c.collected=c.collected+1 local m4=bk()D(("COLLECTED (%s) %s"):format(m1,(m3 and m4 and m4>m3)and("+$"..av(m4-m3))or"no cash change seen"))
Ft(fq,fr,vr)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.isLimited(vs)if type(vs)~="string"then return false end
local vt=W(vs)if ae.rar[vt]=="Limited"then return true end pcall(q.mods)for FA,vu in pairs(q.si or{})do if type(vu)=="table"and vu.rarity=="Limited"and W(FA)==vt then return true end
end return false end function q.limitedHere()local m5=e.MainAccount return type(m5)~="string"or m5==""or m5:lower()==K.Name:lower()
end function q.mods()if q.si and z()-q.modAt<120 then return true end local vv=ag:FindFirstChild("Modules")if not vv then return false end
local function m6(FB)local vw=vv:FindFirstChild(FB)if not vw then return nil end local FC,vx=pcall(require,vw)
return(FC and type(vx)=="table")and vx or nil end q.si,q.arm,q.ci=m6("SquishyInfo"),m6("AutoRollRules"),m6("CrateInfo")
q.modAt=z()if not q.si then return false end local m7={}if q.arm and type(q.arm.tierOf)=="table"then for m8 in pairs(q.arm.tierOf)do
local ik=q.si[m8]if type(ik)=="table"and ik.rarity~="Limited"and not ik.incomeType and not ik.hiddenAfter then m7[W(m8)]=m8 end
end end q.roll=m7 local il={}for FD,FE in pairs(m7)do local ft=q.si[FE]if type(ft)=="table"and type(ft.income)=="number"and not ft.incomeType then
il[#il+1]={k=FD,inc=ft.income,pr=tonumber(ft.price)or 0}end end table.sort(il,function(m9,m_)if m9 .inc~=m_.inc then return m9 .inc>m_.inc end return m9 .pr>m_.pr end)
q.order=il local im,na,nb local FF=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for FG,nc in pairs(FF)do
local nd=type(nc)=="table"and tonumber(nc.price)if nd and(not na or nd>na)then im,na,nb=FG,nd,nc.title end end
q.bestCrate,q.bestCrateName=im and M.key(im),im q.bestCrateTitle=nb and M.key(nb)or nil return true end function q.rank(FH)
local FI,FJ=pcall(function()return q.arm.rankOf(FH)end)return(FI and tonumber(FJ))or 0 end function q.loadDisc(vy)
if type(vy)~="table"then return end local vz={}for FK,FL in pairs(vy)do if FL then vz[W(tostring(FK))]=true end end
q.disc,q.discAt=vz,z()end function q.fetch()q.discAt=z()local vA=ag:FindFirstChild("Remotes")local vB=vA and vA:FindFirstChild("GetSquishiesDiscovered")
if not vB then return end local FM,FN=pcall(function()return vB:InvokeServer()end)if FM then q.loadDisc(FN)end
end function q.scanWax()local ne={}local vC=c.plot and c.plot:FindFirstChild("WaxStations")if vC then for L5,vD in ipairs(vC:GetChildren())do
local vE=vD:FindFirstChild("SquishyPlaceHolder")if vE and vD:GetAttribute("HasSquishy")then for L6,vF in ipairs(vE:GetChildren())do if vF:IsA("Model")then ne[W(vF.Name)]=true end end
end end end for vG,FO in pairs(q.placedAt)do if z()-FO<20 then ne[vG]=true else q.placedAt[vG]=nil end end q.waxing=ne
end function q.compute()local vH,nf,ng={},0,0 if q.disc then for nh in pairs(q.roll or{})do if not q.disc[nh]then
if q.waxing[nh]then ng=ng+1 else vH[nh],nf=true,nf+1 end end end end q.need,q.nNeed,q.nWax=vH,nf,ng local vI,ni={},e.Best or 0
local nj=(ni==4)and q.stackMin or nil for FP,vJ in ipairs(q.order)do if(nj and vJ.inc>nj)or(not nj and FP<=(ni==4 and 1 or ni))then vI[vJ.k]=true end
end q.best=vI end function q.readStack()q.stackAt=z()local vK=ag:FindFirstChild("Remotes")local vL=vK and vK:FindFirstChild("EditStack")
if not vL then return end local FQ,dA=pcall(function()return vL:InvokeServer("State",nil)end)if not(FQ and type(dA)=="table"and type(dA.state)=="table"and type(dA.state.entries)=="table")then return end
local io for L7,vM in ipairs(dA.state.entries)do local fu=type(vM)=="table"and q.si and q.si[tostring(vM.name)]
if type(fu)=="table"and type(fu.income)=="number"and not fu.incomeType and(not io or fu.income<io)then io=fu.income end
end q.stackMin=io q.stackFull=#dA.state.entries>=(tonumber(dA.state.capacity)or 100)end function q.want(nk)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[nk]then return true end elseif e.Targets[nk]then return true end return e.AutoIndex==true and q.need[nk]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(FR)local fv=W(FR)q.placedAt[fv],q.waxing[fv]=z(),true if q.need[fv]then q.need[fv],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
D(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(am(fv)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fw,fy={},{}for FS,FV in pairs(q.roll or{})do if q.want(FS)then fw[FV]=true end end
for vN,nl in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if M.wanted(vN)or(type(nl)=="table"and type(nl.title)=="string"and M.wanted(nl.title))then fy[vN]=true end
end if not next(fw)and not next(fy)then return nil end if q.arm and type(q.arm.encode)=="function"then local FW,vO=pcall(q.arm.encode,{rarities={},butters=fw,crates=fy,index=false})
if FW and type(vO)=="string"then return vO end end local function vP(FX)local ip={}for FY in pairs(FX)do ip[#ip+1]=FY end table.sort(ip)return table.concat(ip,",")end
local fz="adv:"if next(fw)then fz=fz..";butters:"..vP(fw)end if next(fy)then fz=fz..";crates:"..vP(fy)end return fz
end function q.canon(FZ)local iq={}for vQ in tostring(FZ or""):gmatch("[^;]+")do local nm,vR=vQ:match("^(%a+):(.*)$")
if not nm then nm,vR="r",vQ:gsub("^adv:","")end for F0 in vR:gmatch("[^,]+")do iq[#iq+1]=nm.."="..F0 end end table.sort(iq)
return table.concat(iq,"|")end function q.sync(F1)if K:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cO=q.rulesNow()if not cO or#cO>1900 then return end if q.canon(K:GetAttribute("AutoRollRules"))==q.canon(cO)then q.fails=0 return end
if not F1 and z()-q.sentAt<4 then return end local vS=ag:FindFirstChild("Remotes")local vT=vS and vS:FindFirstChild("AutoRollAction")
if not vT then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 D("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()E.replaying=true pcall(function()vT:FireServer("Rules",cO)end)E.replaying=false e.ARrules=cO
local ir,is=0,0 for L8 in(cO:match("butters:([^;]*)")or""):gmatch("[^,]+")do ir=ir+1 end for L9 in(cO:match("crates:([^;]*)")or""):gmatch("[^,]+")do is=is+1 end
local vU=ir.."/"..is if q.told~=vU then q.told=vU D(("auto roll now stops on %d butters and %d crates"):format(ir,is))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aS={}if e.AutoIndex then aS[#aS+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fA=0 for L_ in pairs(q.best)do fA=fA+1 end
aS[#aS+1]=fA==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fA,fA==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aS[#aS+1]="best: "..am(q.order[1].k)end if e.BestCrate and q.bestCrateName then aS[#aS+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if P.got>0 then aS[#aS+1]="shower: "..P.got end q.msg=#aS>0 and table.concat(aS," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(F2)q.feed[#q.feed+1]=os.date("%H:%M ")..F2 if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vV,az,it)if vV~="Effect"then q.feedAdd(tostring(vV)..(az~=nil and(": "..tostring(az):sub(1,80))or""))
return end if az~="ShowerTaken"and az~="GoalPoint"then q.feedAdd(tostring(az))end if az=="Shower"then P.add(it)return end
if az=="ShowerTaken"then P.gone(it)return end if az=="ShowerClear"then P.drops={}return end if az=="WaxGlow"then
local nn=type(it)=="table"and tonumber(it.SnapAt)if nn then q.snapAt=nn D(("ADMIN: every wax finishes in %ds%s"):format(math.floor(nn-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end az=tostring(az)cm("Admin "..az)if az~="GoalPoint"and z()-(q.heard[az]or-100)>30 then q.heard[az]=z()
D("ADMIN: "..az)end end P.drops,P.tried,P.got,P.miss={},{},0,0 function P.add(no)if type(no)~="table"or type(no.Pieces)~="table"then return end
for Ma,a2 in pairs(no.Pieces)do if type(a2)=="table"and a2 .Id~=nil and a2 .Position~=nil then P.drops[a2 .Id]={id=a2 .Id,butter=tostring(a2 .Butter or"?"),rar=tostring(a2 .Rarity or"?"),star=a2 .Star==true,
pos=a2 .Position,opens=tonumber(a2 .OpensAt)or 0,ends=tonumber(a2 .ExpiresAt)or 0}end end end function P.gone(fB)
if type(fB)~="table"or fB.Id==nil then return end P.drops[fB.Id]=nil if tonumber(fB.UserId)==o.uid then P.mine=fB.Id end
end function P.pick()local np=o.srv()local nq,vW for vX,cP in pairs(P.drops)do if np>=cP.ends-0.3 then P.drops[vX]=nil
elseif np>=cP.opens-0.2 and(P.tried[vX]or 0)<3 then local vY=(aP(cP.butter)and 1e6 or 0)+(cP.star and 1e5 or 0)+q.rank(cP.rar)*100-(cP.ends-np)
if not nq or vY>vW then nq,vW=cP,vY end end end return nq end function P.due()return e.Shower and c.running and next(P.drops)~=nil and not ad()and P.pick()~=nil
end function P.grab()local aT,nr=P.pick(),aq()if not(aT and nr)then return end P.tried[aT.id]=(P.tried[aT.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aE(nr,aT.pos+Vector3 .new(0,db(nr)+0.5,0))ao(function()return P.mine==aT.id or ad()~=nil or not P.drops[aT.id]end,1.5)
if P.mine==aT.id or ad()then P.got,P.drops[aT.id]=P.got+1,nil D(("GRABBED %s [%s]%s from the admin shower"):format(am(W(aT.butter)),aT.rar,aT.star and" (star)"or""))
elseif not P.drops[aT.id]then P.miss=P.miss+1 end end local fC local function vZ()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 D("trying again after being stopped for 5 minutes")fC(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not aq()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bF(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local ns,v0=gk()
local dB=ad()if dB then local b0=am(W(dB))if q.isLimited(dB)and not q.limitedHere()then return nil,("holding %s - Limited butters go to %s, never waxed or sold here"):format(b0,e.MainAccount),"wait"
end if not aP(dB)and not q.isLimited(dB)then local nt=(ab.gift and W(ab.gift)==W(dB)and z()-ab.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(b0,nt),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(b0,nt),"bad"end return"sell",("selling %s (%s)"):format(b0,nt),"warn"
end if e.NoWax then return nil,("holding %s - no waxing on this account (it is given away)"):format(b0),"wait"end
if ns<1 then return nil,("holding %s - 0 free stations"):format(b0),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(b0),"wait"end
return"place",("waxing %s (%d free)"):format(b0,ns),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local nu=c.plot:FindFirstChild("CrateStand")if nu then for Mb,fD in ipairs(nu:GetDescendants())do
if fD:IsA("ProximityPrompt")and fD.Enabled and kG(fD)then local bx=fD.ObjectText if bx==""then bx=c5(nu,"TitleLabel")or""end
if bx~=""and M.wanted(bx)then local F3=gg(bx):gsub("crate$","")local v1 for v2 in pairs(ae.members)do if gg(v2)==F3 then v1=v2 end end
j.waiting,j.at,j.title,j.prompt=true,z(),bx,fD j.data={name=(bx:gsub("%s","")),rarity=v1,title=bx}D(bx.." found waiting on your stand")
end break end end end end local v3=M.wanted(j.data and j.data.name)or M.wanted(j.title)if e.Crates and(j.on or j.waiting)and v3 then
local a3=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a3),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 D("could not press the "..a3 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a3),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a3),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a3,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a3),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a3,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a3,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil D("trying the "..a3 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a3),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a3,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not v3 then local v4=j.title..tostring(j.rolledAt)if j.told~=v4 then j.told=v4 D(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and M.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if ns<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(v0,v0),"wait"
end local nv=pF()if not nv then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dC=ck()
if dC and q3(dC.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dC.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dC.name),"bad"end if not rm()then return nil,("%s rolled - waiting for it to land on the stand"):format(dC.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dC.name),"ok"end local b1=kn()if b1 .state~="match"then
c.matchSince=nil if b1 .state=="skip"and not nv.Enabled then return nil,b1 .text.." (sold out)","idle"end return nil,b1 .text,b1 .level
end if not nv.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local dD=z()if dD<c.noCashUntil then
local v5,F4=cl()if v5 then return nil,("cash short: have $%s, price ~$%s"):format(av(v5),av(F4)),"bad"end return nil,(cl()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
av(bk()),math.ceil(c.noCashUntil-dD)),cl()and"bad"or"wait"end if dD-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
do local v6,v7=cl()if v6 then c.noCashUntil=dD+8 return nil,("cash short: have $%s, price %s - not buying"):format(av(v6),v7==math.huge and"unreadable"or("~$"..av(v7))),"bad"
end end c.matchSince=c.matchSince or dD local v8=dD-c.matchSince if v8<e.Confirm then return nil,("confirming %s (%.2fs)"):format(b1 .shown,v8),"ok"end
return"buy",("buying %s via %s"):format(b1 .shown,b1 .src),"ok"end d.DEPTH=11 function d.pinTick()local v9=d.hold
if not v9 then return end local nw=K.Character local nx=nw and nw:FindFirstChild("HumanoidRootPart")if not nx then return end
nx.CFrame=v9 nx.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Mc,iu in ipairs(nw:GetChildren())do if iu:IsA("BasePart")and iu.CanCollide then d.noclip[iu]=true iu.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(F5,v_)d.hold=F5 if v_ then d.surface=v_ end end function d.unpin(F6)
if not d.hold then return end d.hold=nil for wa in pairs(d.noclip)do pcall(function()if wa.Parent then wa.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local wb=aq()if wb and d.surface and not F6 then aE(wb,d.surface.Position,d.surface.Position+d.surface.LookVector)
ah(0.1)end end function d.home()local by,wc=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),aq()
if not(by and by:IsA("BasePart")and wc)then return nil end local wd=pu()or by.Position local iv=Vector3 .new(wd.X-by.Position.X,0,wd.Z-by.Position.Z)
iv=iv.Magnitude>0.1 and iv.Unit or Vector3 .new(0,0,1)local iw=by.Position+iv*6 local we=gX(iw.X,by.Position.Y,iw.Z,{by})
return CFrame.new(iw.X,(we and we.Y or by.Position.Y)+db(wc),iw.Z)end function d.ground(F7,wf,F8)local ny,nz={K.Character},nil
for Md=1,12 do local nA=RaycastParams.new()nA.FilterType=Enum.RaycastFilterType.Exclude nA.FilterDescendantsInstances=ny
local ix=ak:Raycast(Vector3 .new(F7,wf,F8),Vector3 .new(0,-2000,0),nA)if not ix then break end nz,wf=ix,ix.Position.Y-0.05
ny[#ny+1]=ix.Instance end return nz and nz.Position.Y end function d.parkHome()local nB=d.home()if not nB then return false end
local dE=nB.Position local F9=d.ground(dE.X,dE.Y+300,dE.Z)or(dE.Y-3)d.pin(CFrame.new(dE.X,F9-8,dE.Z),nB)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(iy)e.Ghost,e.GhostHelps=iy==2,iy==1 if iy<2 then task.spawn(function()while c.busy do ah(0.1)end
if d.ghostMode()<2 and d.hold and not F.home then pcall(d.unpin)end end)end d.paintGhost()D("ghost: "..d.GHOST[iy][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local F_=aq()if not F_ or H.seat()then return end d.parkHome()end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.uid()local Ga,Gb=pcall(function()return K.UserId end)return Ga and Gb or 0 end function H.seat()local wg=ak:FindFirstChild("NightSeats")
if wg then for Me,nC in ipairs(wg:GetChildren())do if nC.Name=="LogSeat"and nC:GetAttribute("Occupant")==H.uid()then return nC end
end end local wh=K.Character local wi=wh and wh:FindFirstChildOfClass("Humanoid")local nD=wi and wi.SeatPart return(nD and nD.Name=="LogSeat")and nD or nil
end function H.logs()local wj=ak:FindFirstChild("NightSeats")local nE,nF={},{}for Mf,cQ in ipairs(wj and wj:GetChildren()or{})do
local nG=cQ.Name=="LogSeat"and cQ:FindFirstChildOfClass("ProximityPrompt")if nG then nE[#nE+1]=cQ local nH=cQ:GetAttribute("Occupant")
local Gc=(nH~=nil and nH~=0 and nH~="")or(cQ:IsA("Seat")and cQ.Occupant~=nil)if not Gc and nG.Enabled then nF[#nF+1]={st=cQ,p=nG}end
end end return nE,nF end function H.due()if not(e.Campfire and c.running)or z()<H.nextAt then return false end
local Gd=ak:FindFirstChild("NightSeats")if not Gd then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire now (weather events)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or z()H.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(K:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
D(H.msg)return false end end return true end function H.sit()local Ge,fE=ak:FindFirstChild("NightSeats"),aq()
if not Ge or not fE then return end local iz,fF=H.logs()if#iz==0 then local Gf=ak:FindFirstChild("NightCampfire")
local Gg,nI=pcall(function()return Gf:GetPivot().Position end)if not Gg then H.nextAt,H.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()K:RequestStreamAroundAsync(nI,3)end)aE(fE,nI+Vector3 .new(0,3,9),nI)ao(function()iz,fF=H.logs()return#iz>0 end,6)
if#iz==0 then H.nextAt,H.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local wk=fE.HumanoidRootPart.Position
if#fF==0 then H.nextAt,H.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fF,function(Gh,Gi)return(Gh.st.Position-wk).Magnitude<(Gi.st.Position-wk).Magnitude end)
local nJ,Gj=fF[1].st,fF[1].p d.unpin(true)local dF=nJ:IsA("BasePart")and nJ.CFrame or CFrame.new(nJ:GetPivot().Position)
aE(fE,dF.Position+dF.LookVector*2+Vector3 .new(0,2.5,0),dF.Position)ah(0.25)local Gk=em(Gj,function()return H.seat()~=nil end)
if not Gk then aE(fE,dF.Position+Vector3 .new(0,2,0),dF.Position+dF.LookVector)ao(function()return H.seat()~=nil end,1.5)
end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,z()D(("SAT at the campfire (+%s%% cash)"):format(tostring(K:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=z()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then D(H.msg)end end end J.msg,J.nextAt,J.at,J.pulls,J.claims,J.pullLeft,J.collectLeft,J.events="",0,0,0,0,0,0,{}
function J.refresh()J.at=z()local nK=ag:FindFirstChild("Remotes")if not nK then return end local fG,nL,dG=0,0,{}
local wl,dH=pcall(function()return nK.ClanRequest:InvokeServer("state")end)if wl and type(dH)=="table"and type(dH.data)=="table"then dH=dH.data end
local wm=wl and type(dH)=="table"and dH.tasks for Mg,b2 in ipairs(wm and wm.list or{})do if not b2 .done and b2 .kind=="pull"then fG=math.max(fG,(b2 .goal or 0)-(b2 .progress or 0))end
if not b2 .done then dG[#dG+1]=("%s %d/%d"):format(tostring(b2 .text),b2 .progress or 0,b2 .goal or 0)end end
J.events={}for Mh,dI in ipairs(nK:GetChildren())do if dI:IsA("RemoteFunction")and dI.Name:match("^%u%a+Action$")and dI.Name~="CrateAction"and dI.Name~="AutoRollAction"then
local Gl,fH=pcall(function()return dI:InvokeServer("state")end)if Gl and type(fH)=="table"and fH.live==true and type(fH.quests)=="table"then
J.events[#J.events+1]={r=dI,st=fH}for Mi,aU in ipairs(fH.quests)do if not aU.done and aU.kind=="pull"then fG=math.max(fG,(aU.goal or 0)-(aU.progress or 0))end
if not aU.done and aU.kind=="collect"then nL=math.max(nL,(aU.goal or 0)-(aU.progress or 0))end if not aU.done then dG[#dG+1]=("%s %d/%d"):format(tostring(aU.text),aU.progress or 0,aU.goal or 0)end
end end end end J.pullLeft,J.collectLeft=fG,nL J.msg=#dG>0 and("open: "..table.concat(dG,", "))or"all quests done for today"
end function J.claim()for Mj,fI in ipairs(J.events)do local wn=fI.r.Name:gsub("Action$","")for Mk,dJ in ipairs(fI.st.quests)do
if dJ.done and not dJ.claimed then local Gm,wo=pcall(function()return fI.r:InvokeServer("claimQuest",dJ.id)end)
if Gm and not(type(wo)=="table"and wo.ok==false)then J.claims=J.claims+1 D(("CLAIMED %s quest: %s (+%s)"):format(wn,tostring(dJ.text),tostring(dJ.points or dJ.treats or"?")))
end ah(0.4)end end if fI.st.bonusReady==true then local Gn=pcall(function()return fI.r:InvokeServer("claimBonus")end)
if Gn then D(("CLAIMED %s daily quest bonus"):format(wn))end ah(0.4)end end end function J.tick()if not(e.Quests and c.running)then
if J.arPaused then J.resume("quests switched off")end return end if z()-J.at<(J.pullLeft>0 and 20 or 90)then return end
J.refresh()pcall(J.claim)if J.pullLeft<=0 and J.arPaused then J.resume("lever quests done")end end function J.pullDue()
return e.Quests and c.running and J.pullLeft>0 and z()>=J.nextAt and not E.busy end function J.lever()local wp=c.plot and c.plot:FindFirstChild("Lever")
local nM=wp and wp:FindFirstChild("Wheel")return nM and nM:FindFirstChildWhichIsA("ProximityPrompt"),nM end function J.resume(Go)
J.arPaused=false if J.arWas then J.arWas=false e.AutoRoll=true task.spawn(E.apply,Go)end end function J.pull()
local fJ,nN=J.lever()if not fJ or not nN or not nN:IsA("BasePart")then J.nextAt,J.msg=z()+300,"your lever was not found"return end
if not J.arPaused then J.arPaused=true J.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false E.apply("pulling the lever for a quest",true)
if E.isOn()then J.nextAt=z()+30 return end end D(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(J.pullLeft))
end if not fJ.Enabled then J.nextAt=z()+1 return end cq(nN,fJ)J.asked=nil if not(type(fireproximityprompt)=="function"and pcall(fireproximityprompt,fJ))then qQ(fJ)end
J.pulls=J.pulls+1 J.pullLeft=J.pullLeft-1 ah(0.6)if J.asked then J.nextAt=z()+600 D(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(J.asked)))
J.resume("a butter the game wants kept is on the pad")return end J.nextAt=z()+2.5 if J.pullLeft<=0 then J.at=0 end
end F.skip,F.skipN,F.n,F.calls,F.fails,F.nextAt,F.msg,F.tries={},0,0,0,0,0,"off",{}function F.can(b3,Gp)local nO=b3:GetAttribute("PourOwner")
if type(nO)~="number"or nO==o.uid or not b3:GetAttribute("HasSquishy")then return false end if b3:GetAttribute("PourLong")~=true or b3:GetAttribute("PourFull")==true then return false end
local nP=b3:GetAttribute("PourId")if nP==nil or F.skip[nP]then return false end local wq,nQ,Gq=b3:GetAttribute("Helpers"),0,tostring(o.uid)
if type(wq)=="string"then for Gr in wq:gmatch("[^,%s]+")do nQ=nQ+1 if Gr==Gq then return false end end end if nQ>=6 then return false end
local iA=A.left(b3)if not iA then local wr=tonumber(b3:GetAttribute("PourEnd"))iA=wr and(wr-Gp)end if not iA or iA<=75 then return false end
local nR=game:GetService("Players"):GetPlayerByUserId(nO)if not nR or nR:GetAttribute("WaxHelpOff")==true then return false end
return true,nR,nP end function F.list()local nS,Gs={},o.srv()local ws=ak:FindFirstChild("Plots")for Ml,wt in ipairs(ws and ws:GetChildren()or{})do
local wu=wt~=c.plot and wt:FindFirstChild("WaxStations")for Mm,nT in ipairs(wu and wu:GetChildren()or{})do local Gt,Gu,Gv=F.can(nT,Gs)
local nU=Gt and nT:FindFirstChild("SquishyPlaceHolder")if nU and nU:IsA("BasePart")then nS[#nS+1]={st=nT,p=Gu,id=Gv,part=nU}end
end end return nS end function F.due()local wv=(e.MemLimit or 0)>0 and math.floor(e.MemLimit*0.72)or 900 if e.Help and c.running and z()>=F.nextAt and(d.mem or 0)>wv then
F.nextAt,F.msg=z()+30,("paused - memory %d MB > %d MB (helps load other bases)"):format(d.mem,wv)return false
end return e.Help and c.running and z()>=F.nextAt end function F.skipIt(ww,wx)F.skip[ww],F.skipN=wx,F.skipN+1
if F.skipN>600 then F.skip,F.skipN,F.tries={[ww]=wx},1,{}end end function F.goHome()local iB,b4=aq(),F.home F.home=nil
if not(iB and b4)then return end if e.Ghost and not H.seat()then d.unpin(true)if not d.parkHome()then pcall(aE,iB,b4 .Position,b4 .Position+b4 .LookVector)end
elseif d.hold or(iB.HumanoidRootPart.Position-b4 .Position).Magnitude>20 then d.unpin(true)pcall(aE,iB,b4 .Position,b4 .Position+b4 .LookVector)
end end function F.step()local nV,fK=F.list(),aq()if#nV==0 or not fK then F.nextAt=z()+15 F.msg=("helped %d waxes here%s | none to help right now"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")
F.goHome()return end local wy=fK.HumanoidRootPart local wz=wy.Position table.sort(nV,function(Gw,Gx)return(Gw.part.Position-wz).Magnitude<(Gx.part.Position-wz).Magnitude end)
local a4=nV[1]F.home=F.home or(d.hold and d.surface)or wy.CFrame local b5=a4 .part local fL=(b5 .Position+a4 .st:GetPivot().Position)/2
local iC=F.tries[a4 .id]or 0 if(e.Ghost or e.GhostHelps)and iC==0 and not H.seat()then d.pin(b5 .CFrame,F.home)
else d.unpin(true)local nW=iC==0 and gX(fL.X,b5 .Position.Y,fL.Z,{b5})if nW and math.abs(nW.Y-b5 .Position.Y)<8 then
aE(fK,Vector3 .new(fL.X,nW.Y+db(fK),fL.Z),b5 .Position)else aE(fK,b5 .Position+Vector3 .new(0,b5 .Size.Y/2+3,0),fL)
end end ah(0.3)local fM=ag:FindFirstChild("Remotes")fM=fM and fM:FindFirstChild("ClanRequest")if not fM then F.nextAt,F.msg=z()+60,"the game's help remote is missing"return end
local iD,bz=pcall(function()return fM:InvokeServer("help",a4 .st:GetAttribute("PourOwner"),tonumber(a4 .st.Name))end)
if iD and type(bz)=="table"and bz.ok then F.n,F.fails=F.n+1,0 F.skipIt(a4 .id,"helped")D(("HELPED %s's wax (station %s)"):format(a4 .p.DisplayName,a4 .st.Name))
F.msg=("helped %d waxes here%s"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")elseif iD and type(bz)=="table"and tostring(bz.reason or""):lower():find("walk up",1,true)and iC<2 then
F.tries[a4 .id]=iC+1 F.nextAt=z()+0.3 elseif iD and type(bz)=="table"and tostring(bz.reason or""):lower():find("moment",1,true)then
F.waits=(F.waits or 0)+1 F.nextAt=z()+1.6 else local wA=(iD and type(bz)=="table"and tostring(bz.reason or"refused"))or("error: "..tostring(bz))
F.skipIt(a4 .id,wA)F.fails=F.fails+1 if F.fails<=3 then D(("help refused for %s's wax: %s"):format(a4 .p.DisplayName,wA))end
if F.fails>=5 then F.fails,F.nextAt,F.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
F.goHome()end end F.nextAt=math.max(F.nextAt,z()+1.2)end function F.onCall(bA)if not e.HelpGuild or type(bA)~="table"or bA.p~="help"or bA.mine or bA.u==o.uid or not bA.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fN=ag:FindFirstChild("Remotes")
fN=fN and fN:FindFirstChild("ClanRequest")if not fN then return end local wB,fO=pcall(function()return fN:InvokeServer("callHelp",bA.u)end)
local wC=tostring(bA.n or bA.un or bA.u)if wB and type(fO)=="table"and fO.ok then F.calls=F.calls+1 D(("HELPED guildmate %s's wax from here (their call)"):format(wC))
else D(("guild call from %s: %s"):format(wC,(wB and type(fO)=="table"and tostring(fO.reason or"refused"))or tostring(fO)))
end end)end local function au(Gy,wD,...)if c.busy then return end c.busy,c.busyText=true,Gy if d.hold and wD~=F.step then pcall(d.unpin)end
local Gz,wE=pcall(wD,...)c.busy,c.busyText=false,""if not Gz and wE~=jz then D("ERR "..tostring(wE))end end local function GA()
if e.Campfire and H.seat()then if j.at and H.tickAt then j.at=j.at+(z()-H.tickAt)end H.tickAt=z()H.due()c.reason,c.level=H.msg,"ok"
return end H.tickAt=nil local aV,GB,GC=vZ()c.reason,c.level=GB,GC if aV=="place"then au("waxing...",A.place)elseif aV=="crate"then au("opening crate...",ex,true)
elseif aV=="cratesmart"then au("opening crate...",j.smart)elseif aV=="cratewin"then au("opening the crate window...",kI)
elseif aV=="nocrate"then au("discarding crate...",ex,false)elseif aV=="cratedrop"then au("discarding a crate that would not open...",j.drop)
elseif aV=="sell"then au("selling...",vm)elseif aV=="buy"then au("buying...",qT,false)elseif not aV and not c.matchSince and P.due()then
au("grabbing a butter from the admin shower...",P.grab)elseif not aV and not c.matchSince and H.due()then au("sitting at the campfire...",H.sit)
elseif not aV and not c.matchSince and J.pullDue()and not ad()and not(ck()and aP(ck().name))then au("pulling the lever for a quest...",J.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(J.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
au("collecting money...",Fy)elseif not aV and not c.matchSince and F.due()then au("helping a wax...",F.step)elseif F.home and not e.Help then
au("coming back...",F.goHome)elseif not c.busy then d.parkTick()end end function fC(iE,GD)if iE==c.running then return end
c.running=iE if not GD then e.AutoStart=iE end if iE then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bF()or c.plot
D("START")else c.reason="stopped"D("STOP")end end do local bd=ec(ar.auto)if bd==nil then bd=ec(ar.autoOld)end
if type(bd)=="string"then bd=bd:gsub("%s+$","")if bd~=""then c.autoload=bd local GE=kg(bd)D(GE and("loaded config "..bd)or("config "..bd.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local GF={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local nX={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local af={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local wF,wG,wH,wI=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if wF and wG and wH and wI then af.x,af.b,af.m,af.r=wF,wG,wH,wI end end)pcall(function()local wJ=Enum.Font.RobotoMono if wJ then af.mono=wJ end end)
local function L(GG,GH,GI)local GJ,nY=pcall(Instance.new,GG)if not GJ then c.uiErrs=c.uiErrs+1 return nil end
for GK,GL in pairs(GH)do if not pcall(function()nY[GK]=GL end)then c.uiErrs=c.uiErrs+1 end end nY.Parent=GI return nY
end local function aa(GM,GN)L("UICorner",{CornerRadius=UDim.new(0,GN or 8)},GM)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(iF,nZ)if iF and a.shown[iF]~=nZ then a.shown[iF]=nZ iF.Text=nZ end
end function a.stroke(GO,GP,GQ)return L("UIStroke",{Color=GP or l.line,Thickness=1,Transparency=GQ or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},GO)
end function a.grad(GR,GS,GT,GU)local GV,wK=pcall(function()return ColorSequence.new(GS,GT)end)if GV and wK then return L("UIGradient",{Color=wK,Rotation=GU or 0},GR)end
end function a.pad(GW,wL,wM,GX,GY)L("UIPadding",{PaddingLeft=UDim.new(0,wL or 0),PaddingTop=UDim.new(0,wM or 0),
PaddingRight=UDim.new(0,GX or wL or 0),PaddingBottom=UDim.new(0,GY or wM or 0)},GW)end function a.list(GZ,G0,G1)
return L("UIListLayout",{Padding=UDim.new(0,G0 or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=G1 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},GZ)
end function a.ink(n0)local G2,G3=pcall(function()return 0.299*n0 .R+0.587*n0 .G+0.114*n0 .B end)return(G2 and G3>0.55)and l.ink or l.text
end function a.nextIn(wN)local wO=(a.ord[wN]or 0)+1 a.ord[wN]=wO return wO end local n1=K:FindFirstChildOfClass("PlayerGui")or K:WaitForChild("PlayerGui")
local wP=n1:FindFirstChild("SABFarmGui")if wP then wP:Destroy()end local n2=L("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},n1)local T={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local iG=ak.CurrentCamera.ViewportSize if iG.X>100 and iG.Y>100 then T.w=math.clamp(math.floor(iG.X*0.48),320,400)
T.h=math.clamp(math.floor(iG.Y*0.86),250,360)end end)a.root=L("Frame",{Name="Root",Size=UDim2 .new(0,T.w,0,T.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},n2)
aa(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local wQ=UDim2 .new(1,0,1,0)
local function Mn(wR,wS)return UDim2 .new(wR,0,0,0),UDim2 .new(wS,(wR+wS>0.99)and 0 or-4,1,0)end local function aj(G4,G5,fP,G6,G7,G8)
local n3=L("TextButton",{Text=G5,Position=G7,Size=G8,BackgroundColor3=fP,BorderSizePixel=0,Font=af.b,TextSize=G6,TextColor3=a.ink(fP),AutoButtonColor=true},G4)
aa(n3,8)if fP==l.panel2 or fP==l.raise or fP==l.panel then a.stroke(n3,l.line,0.4)end return n3 end local function iH(G9,G_,Ha,Hb,Hc)
local iI=L("TextBox",{Text=G_,PlaceholderText=Ha,Position=Hb,Size=Hc,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},G9)aa(iI,8)a.stroke(iI,l.line,0)a.pad(iI,9,0,6,0)
return iI end local iJ=ak.CurrentCamera local function Hd()local He,iK=pcall(function()return iJ and iJ.ViewportSize end)
if He and iK and iK.X>50 and iK.Y>50 then return iK end end local function b6(fQ)local n4=Hd()if not(n4 and fQ and fQ.Parent)then return end
local Hf=pcall(function()local iL,wT=fQ.AbsolutePosition,fQ.AbsoluteSize local n5=70 local wU=math.clamp(iL.X,n5-wT.X,n4 .X-n5)
local wV=math.clamp(iL.Y,0,n4 .Y-math.min(wT.Y,n5))if math.abs(wU-iL.X)>0.5 or math.abs(wV-iL.Y)>0.5 then fQ.Position=UDim2 .new(0,math.floor(wU),0,math.floor(wV))
end end)return Hf end local function iM(Hg)local Hh,n6=pcall(function()return Hg.AbsolutePosition end)if Hh and n6 then return{math.floor(n6 .X),math.floor(n6 .Y)}end
end local dK={}c.dragMoved={}local function wW(fR,wX,n7)V(fR.InputBegan:Connect(function(dL)if dL.UserInputType~=Enum.UserInputType.MouseButton1 and dL.UserInputType~=Enum.UserInputType.Touch then return end
local n8={start=dL.Position,from=wX.Position,moved=0,target=wX,input=dL,onDrop=n7}dK[fR],c.dragMoved[fR]=n8,0
local n9 n9=dL.Changed:Connect(function()if dL.UserInputState==Enum.UserInputState.End and dK[fR]==n8 then dK[fR]=nil
if n9 then n9:Disconnect()end if n7 then n7(n8 .moved)end end end)end))end V(pc.InputChanged:Connect(function(iN)
if iN.UserInputType~=Enum.UserInputType.MouseMovement and iN.UserInputType~=Enum.UserInputType.Touch then return end
for Hi,be in pairs(dK)do local n_=be.target if n_ and n_.Parent then local wY,wZ=iN.Position.X-be.start.X,iN.Position.Y-be.start.Y
be.moved=math.max(be.moved,math.abs(wY)+math.abs(wZ))c.dragMoved[Hi]=be.moved n_.Position=UDim2 .new(be.from.X.Scale,be.from.X.Offset+wY,be.from.Y.Scale,be.from.Y.Offset+wZ)
end end end))V(pc.InputEnded:Connect(function(iO)if iO.UserInputType~=Enum.UserInputType.MouseButton1 and iO.UserInputType~=Enum.UserInputType.Touch then return end
for Hj,iP in pairs(dK)do if iP.input==iO or iO.UserInputType==Enum.UserInputType.MouseButton1 then dK[Hj]=nil
if iP.onDrop then iP.onDrop(iP.moved)end end end end))local function Q(Hk,Hl,Hm,Hn,Ho,Hp,Hq)return L("TextLabel",{Text=Hl,Position=Hp or UDim2 .new(0,0,0,0),Size=Hq or wQ,BackgroundTransparency=1,
Font=Ho and af.b or af.m,TextSize=Hm,TextColor3=Hn,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Hk)
end function a.row(w0,Hr)return L("Frame",{Size=UDim2 .new(1,0,0,Hr),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(w0)},w0)end function a.card(w1,w2,w3)local dM=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(w1)},w1)aa(dM,11)a.stroke(dM,l.line,0.25)a.list(dM,5)a.pad(dM,8,8,8,9)
if w2 then local oa=a.row(dM,14)L("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},oa)Q(oa,w2:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if w3 then local Hs=Q(oa,w3,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Hs.TextXAlignment=Enum.TextXAlignment.Right end end return dM end function a.heading(Ht,Hu,ob)local oc=a.row(Ht,ob and 34 or 22)
Q(oc,Hu,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=af.x if ob then Q(oc,ob,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return oc end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(od)local aN=a.sw[od]if not aN then return end
local dN=tostring(od.Text or""):match(":%s*(.-)%s*$")or""local b7=dN~=""and not a.OFF[dN]local oe=not aN.chips and(dN=="ON"or dN=="OFF")
aN.pill.Visible,aN.chip.Visible=oe,not oe if oe then aN.pill.BackgroundColor3=b7 and l.accent or l.panel2 aN.knob.Position=b7 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aN.knob.BackgroundColor3=b7 and l.white or l.dim else aN.chip.Text=dN~=""and dN or"-"aN.chip.BackgroundColor3=b7 and l.accent or l.panel2
aN.chip.TextColor3=b7 and l.ink or l.dim end od.BackgroundColor3=b7 and l.lit or l.raise if aN.edge then aN.edge.Color=b7 and l.accent or l.line aN.edge.Transparency=b7 and 0.55 or 0.45 end
end function a.switch(w4,Hv,Hw,fS)local a5=L("TextButton",{Name="Switch",Text=Hv,TextTransparency=1,TextSize=8,Font=af.b,
Size=UDim2 .new(1,0,0,fS and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(w4)},w4)
aa(a5,9)local ay={edge=a.stroke(a5,l.line,0.45)}ay.title=Q(a5,Hw,11,l.text,true,UDim2 .new(0,10,0,fS and 4 or 0),UDim2 .new(1,-100,0,fS and 15 or 28))
ay.title.TextWrapped,ay.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fS then ay.sub=Q(a5,fS,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
ay.sub.TextWrapped,ay.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end ay.pill=L("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a5)aa(ay.pill,9)ay.knob=L("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},ay.pill)aa(ay.knob,7)ay.chip=L("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=af.b,TextSize=9,TextColor3=l.dim,Text=""},a5)
aa(ay.chip,9)a.pad(ay.chip,10,0,10,0)L("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},ay.chip)
ay.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a5]=ay V(a5:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a5)end))
a.skin(a5)return a5 end function a.chips(of)if a.sw[of]then a.sw[of].chips=true a.skin(of)end end function a.line(Hx,Hy)
local w5=a.row(Hx,15)local w6=L("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Hy or l.dim,
BorderSizePixel=0},w5)aa(w6,3)local og=Q(w5,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))og.TextWrapped,og.TextTruncate=false,Enum.TextTruncate.AtEnd
return og,w6 end function a.grow(w7,Hz,HA)local iQ=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=af.m,TextSize=Hz or 10,TextColor3=HA or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(w7)},w7)
V(iQ:GetPropertyChangedSignal("Text"):Connect(function()iQ.Visible=iQ.Text~=""end))return iQ end function a.note(HB,HC)
local w8=a.grow(HB,9,l.dim)w8 .Text=HC return w8 end function a.actions(HD,w9)local HE=a.row(HD,28)local w_,oh={},#w9
for fT,xa in ipairs(w9)do w_[fT]=aj(HE,xa[1],xa[2]or l.panel2,10,UDim2 .new((fT-1)/oh,fT>1 and 3 or 0,0,0),UDim2 .new(1/oh,(fT>1 and-3 or 0)+(fT<oh and-3 or 0),1,0))
end return table.unpack(w_)end local function O(cR,iR,HF,HG)a.put(cR,iR and HF or HG)if not a.sw[cR]and a.lit[cR]~=iR then
a.lit[cR]=iR cR.BackgroundColor3=iR and l.accent or l.panel2 cR.TextColor3=a.ink(cR.BackgroundColor3)end end a.title=L("Frame",{Size=UDim2 .new(1,0,0,T.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
aa(a.title,14)L("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
L("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local oi=L("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
aa(oi,8)a.grad(oi,l.accent,l.accent2,45)local xb=Q(oi,"C",16,l.ink,true)xb.Font,xb.TextXAlignment=af.x,Enum.TextXAlignment.Center
local HH=Q(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))HH.Font=af.x Q(a.title,"butter farm  "..cd,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local HI=a.list(a.tabs,3)pcall(function()HI.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((T.h-T.head-12)/10)-3,20,34)local function bf(HJ,HK,HL)
local iS=L("TextButton",{Text=HJ,Font=af.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)aa(iS,9)local xc=L("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iS)aa(xc,2)a.tabsAll[#a.tabsAll+1]={b=iS,bar=xc,name=HK,sub=HL}return iS end
a.tabFarm=bf("🏠","Home","what the farm is doing")a.tabRun=bf("🌾","Farm","the buy - wax - collect loop")a.tabBut=bf("🧈","Butters","what gets bought and waxed")
a.tabCrt=bf("📦","Crates","which crates get opened")a.tabPet=bf("🐾","Pets","adopt, wish, fuse")a.tabTeam=bf("👥","Teams","the right pets at the right moment")
a.tabSrv=bf("🤝","Server","helping, campfire, ghost")a.tabAdm=bf("⚡","Admin","admin abuse and its boosts")a.tabSet=bf("⚙","Settings","configs, startup, performance")
a.tabAlt=bf("🔗","Alts","several accounts working together")local function bh()local oj=L("ScrollingFrame",{Position=UDim2 .new(0,T.rail,0,T.head+T.status+10),
Size=UDim2 .new(1,-T.rail,1,-(T.head+T.status+10)),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,
CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)
a.list(oj,8)a.pad(oj,8,2,10,12)return oj end a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bh(),bh(),bh(),bh(),bh(),bh(),bh(),bh(),bh()
a.farm.Visible=true a.alt=bh()do local fU=a.farm local xd=a.row(fU,34)a.startB=aj(xd,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=af.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(xd,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local HM=a.row(fU,44)local function fV(xe,HN,xf)local iT=L("Frame",{Position=UDim2 .new((xe-1)/xf,xe>1 and 2 or 0,0,0),Size=UDim2 .new(1/xf,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},HM)aa(iT,9)a.stroke(iT,l.line,0.3)local iU=Q(iT,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iU.Font,iU.TextXAlignment,iU.TextWrapped=af.x,Enum.TextXAlignment.Center,false local HO=Q(iT,HN,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
HO.TextXAlignment=Enum.TextXAlignment.Center return iU end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fV(1,"BOUGHT",5),fV(2,"WAXED",5),fV(3,"SOLD",5),fV(4,"MONEY",5),fV(5,"FREE",5)
local xg=a.card(fU,"Right now")a.info=Q(a.row(xg,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=Q(a.row(xg,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fW=a.card(fU,"Systems")
a.helpL=a.line(fW,l.info)a.campL=a.line(fW,l.accent2)a.questL=a.line(fW,l.good)a.arL=a.line(fW,l.accent)a.ixL=a.line(fW,nX.Dotonbori)
local xh=a.card(fU,"Activity")a.log=L("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(xh)},xh)
aa(a.log,7)a.pad(a.log,7,5,7,5)end local function Mo(HP,HQ)return a.row(HQ or a.farm,HP)end local an do local ol=a.run
a.heading(ol,"Farm","buy what rolls, wax it, collect the cash")local fX=a.card(ol,"Loop")a.colT=a.switch(fX,"COLLECT: ON","Collect cash","step on the collector by itself")
an=a.row(fX,26)Q(an,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=iH(an,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
Q(an,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fX,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fX,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fX,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local om=a.card(ol,"By hand")
a.buyB,a.plB=a.actions(om,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(om,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
an=a.row(om,28)a.padB=aj(an,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=Q(an,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iV=a.but a.heading(iV,"Butters","what gets bought and waxed")local xi=a.card(iV,"Strategy")a.ixT=a.switch(xi,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(xi,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iV)},iV)a.list(a.butList,5)end do local iW=a.crt a.heading(iW,"Crates","only ticked crates are opened")
local xj=a.card(iW,"Opening")a.crateT=a.switch(xj,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(xj,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iW)},iW)a.list(a.crtList,5)end do local fY=a.pet a.heading(fY,"Pets","adopt, wish, fuse Bigs and Huges")
local fZ=a.card(fY,"Automatic")a.pbT=a.switch(fZ,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fZ,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fZ,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fZ,10,l.dim)a.note(fZ,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local xk=a.card(fY,"The plan","best teams with every pet")a.planInfo=a.grow(xk,10,l.text)a.note(xk,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fY)},fY)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iX=a.srv a.heading(iX,"Server","other players, the campfire, staying hidden")
local oo=a.card(iX,"Helping")a.helpT=a.switch(oo,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(oo,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(oo,l.info)
local xl=a.card(iX,"Campfire")a.campT=a.switch(xl,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(xl,l.accent2)local op=a.card(iX,"Ghost")a.ghostT=a.switch(op,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(op,l.dim)a.note(op,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local f0=a.adm a.heading(f0,"Admin abuse","the show, its boosts and the farm in it")local xm=a.card(f0,"When")
a.admBig=Q(a.row(xm,22),"-",15,l.text,true)a.admBig.Font=af.x a.admSub=Q(a.row(xm,14),"",10,l.dim,false)local HR=a.card(f0,"Boosts now")
a.admBoost=a.grow(HR,11,l.text)local oq=a.card(f0,"What the farm does")a.shT=a.switch(oq,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(oq,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(oq,l.accent)
local xn=a.card(f0,"Show feed")a.admFeed=L("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(xn)},xn)
aa(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cS=a.set a.heading(cS,"Settings","kept on your phone, per config")
local iY=a.card(cS,"Config")an=a.row(iY,28)a.cfgName=iH(an,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=aj(an,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=aj(an,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
an=a.row(iY,26)a.cfgPrev=aj(an,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=aj(an,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=aj(an,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iY,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iY,10,l.dim)local ot=a.card(cS,"Starting")a.startT=a.switch(ot,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(ot,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(ot,9,l.dim)local ou=a.card(cS,"If the game drops me")
a.rejT=a.switch(ou,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(ou,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(ou,9,l.dim)local bB=a.card(cS,"Performance")a.pfCalm=a.switch(bB,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bB,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bB,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bB,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bB,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bB,"STOP 3D: OFF","Stop 3D","blank the world behind this window")an=a.row(bB,28)Q(an,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=iH(an,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))Q(an,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bB,l.good)a.note(bB,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local HT=a.card(cS,"Your game passes","read from the game")a.passInfo=a.grow(HT,10,l.text)local HU=a.card(cS,"About")
a.note(HU,"CHURN "..cd.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Mp,HV in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(HV)end local xo=L("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},n1)
a.tgRoot=L("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},xo)aa(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=L("TextButton",{Text="C",Size=wQ,BackgroundTransparency=1,Font=af.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=L("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
aa(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=L("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=af.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
aa(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local f1=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[f1][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[f1][2]
a.tgGhost.BackgroundColor3=f1==2 and l.accent or(f1==1 and l.warn or l.panel)a.tgGhost.TextColor3=f1>0 and l.ink or l.dim
end end local bC={built=false,boxes={},at=0}function a.check(iZ,ov)iZ.Text=ov and"✓"or""iZ.BackgroundColor3=ov and l.accent or l.bg
iZ.TextColor3=l.ink local ow=iZ.Parent if ow and ow:IsA("TextButton")then ow.BackgroundColor3=ov and l.lit or l.raise end
end local function xp(xq,xr)e.Targets[xq]=xr or nil local xs=bC.boxes[xq]if xs then a.check(xs,xr)end end local function ox()
for HW,HY in pairs(bC.boxes)do a.check(HY,e.Targets[HW]==true)end end function a.tickBox(HZ)local oy=L("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},HZ)aa(oy,6)
a.stroke(oy,l.line,0)return oy end local f2 local function H0()local H1=a.card(a.butList,"Butter list")local oz=a.row(H1,26)
a.butInfo=Q(oz,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local H2=aj(oz,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local H3=aj(oz,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))H2 .MouseButton1Click:Connect(function()
for H4 in pairs(e.Targets)do e.Targets[H4]=nil end ox()end)H3 .MouseButton1Click:Connect(function()ae.at=0 ka()
f2(true)end)end f2=function(H5)if not ka()then if not a.butEmpty then a.butEmpty=Q(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bC.built and not H5 and bC.at==ae.at then return end for Mq,i0 in ipairs(a.butList:GetChildren())do
if i0:IsA("Frame")or i0:IsA("TextButton")or i0:IsA("TextLabel")then i0:Destroy()end end bC.boxes,a.butEmpty={},nil
H0()for Mr,i1 in ipairs(ae.rarOrder)do local oA=nX[i1]or l.text local cT=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)aa(cT,11)a.stroke(cT,oA,0.7)a.list(cT,4)a.pad(cT,7,7,7,8)
local oB=a.row(cT,22)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=oA,BorderSizePixel=0},oB)
local H6=Q(oB,i1:upper(),11,oA,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))H6 .Font=af.x local H7=aj(oB,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local H8=i1 H7 .MouseButton1Click:Connect(function()local xt=ae.members[H8]or{}local xu=false for Ms,H9 in ipairs(xt)do if not e.Targets[H9]then xu=true break end end
for Mt,H_ in ipairs(xt)do xp(H_,xu)end end)for Mu,oC in ipairs(ae.members[i1]or{})do local i2=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cT)},cT)aa(i2,8)local xv=Q(i2,am(oC),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
xv.TextWrapped,xv.TextTruncate=false,Enum.TextTruncate.AtEnd local xw=a.tickBox(i2)bC.boxes[oC]=xw local xx=oC
local function xy()xp(xx,not e.Targets[xx])end i2 .MouseButton1Click:Connect(xy)xw.MouseButton1Click:Connect(xy)
end end ox()bC.built,bC.at=true,ae.at end function M.paint()for Ia,Ib in pairs(M.boxes)do a.check(Ib,e.CrateTicks[Ia]==true)end
if a.crtInfo then local oD,oE=0,0 for Mv in pairs(M.boxes)do oD=oD+1 end for Mw,Ic in pairs(e.CrateTicks)do if Ic then oE=oE+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(oD,oE))end if a.crateT then O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function M.build()for Mx,i3 in ipairs(a.crtList:GetChildren())do if i3:IsA("Frame")or i3:IsA("TextButton")or i3:IsA("TextLabel")then i3:Destroy()end
end M.boxes={}local oF=a.card(a.crtList,"All of them","worst first")local oG=a.row(oF,26)a.crtInfo=Q(oG,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Ie=aj(oG,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local If=aj(oG,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
V(Ie.MouseButton1Click:Connect(function()e.CrateTicks={}M.paint()end))V(If.MouseButton1Click:Connect(function()M.build()end))
for My,bD in ipairs(M.list())do local xz=nX[bD.rar or""]or l.text local dO=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(oF)},oF)aa(dO,8)L("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=xz,BorderSizePixel=0},dO)
local xA=Q(dO,(bD.title or bD.name)..(bD.guess and"  (?)"or""),11,xz,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
xA.TextWrapped,xA.TextTruncate=false,Enum.TextTruncate.AtEnd local Ig=Q(dO,bD.price and("$"..av(bD.price))or(bD.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Ig.TextXAlignment=Enum.TextXAlignment.Right local xC=a.tickBox(dO)M.boxes[bD.k]=xC local xD=bD.k local function xE()
e.CrateTicks[xD]=(not e.CrateTicks[xD])or nil M.paint()end V(dO.MouseButton1Click:Connect(xE))V(xC.MouseButton1Click:Connect(xE))
end M.built=M.at M.paint()end local xF="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set","alt"}
local function aW(cU)xF=cU for Ih,oH in ipairs(a.tabKeys)do a[oH].Visible=(oH==cU)local i4=a.tabsAll[Ih]if i4 then
local oI=oH==cU i4 .b.BackgroundTransparency,i4 .b.TextTransparency,i4 .bar.Visible=oI and 0 or 1,oI and 0 or 0.45,oI
end end if cU=="pet"and not o.built then pcall(o.build)end if cU=="team"and not A.built then pcall(A.build)end
if cU=="crt"and(M.built~=M.at or not next(M.boxes))then M.build()end if cU=="but"then f2(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(oJ,xG,xH,xI)if xI then oJ.Text=xI end oJ.BackgroundColor3=xG and xH or l.bg oJ.TextColor3=xG and a.ink(xH)or l.dim
end function o.paintRow(xJ)local cV=o.rows and o.rows[xJ]if not cV then return end local cW=e.Pets[xJ]or{}local xK=tonumber(cW.f)==-1
a.flag(cV.b,cW.b,l.good)a.flag(cV.g,cW.g,l.accent,cW.g and"BIG"or"ANY")a.flag(cV.w,cW.w,l.warn)a.flag(cV.f,not xK,l.good,xK and"KEEP"or"AUTO")
if cV.row then cV.row.BackgroundColor3=(cW.b or cW.w)and l.lit or l.raise end end function o.flag(oK,i5)local bi=e.Pets[oK]or{}
if i5=="f"then bi.f=tonumber(bi.f)~=-1 and-1 or nil elseif bi[i5]then bi[i5]=nil else bi[i5]=true end e.Pets[oK]=(bi.b or bi.g or bi.w or bi.f)and bi or nil
o.paintRow(oK)end function o.paintAll()for Ii in pairs(o.rows or{})do o.paintRow(Ii)end if a.pbT then O(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
O(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")O(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(Ij)local xL=y.dreamT if not xL then return"working the plan out..."end local Ik,Il=y.needFor(""),y.needFor("Big")
local cX={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(Ik,Il,y.slots())}for Mz,xM in ipairs(y.dreamTeams or{})do cX[#cX+1]=xM.team:upper()..": "..table.concat(xM.names,", ")end
local i6,i7,i8=0,0,0 for xN,xO in pairs(xL)do local xP,Im=y.have(xN,Ij)local MA,In=y.goal(xN)i6=i6+math.max(0,xO.Huge-xP.Huge)
i7=i7+math.max(0,xO.Big-xP.Big)i8=i8+math.max(0,In-Im)end cX[#cX+1]=(i6+i7+i8==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(i6,i7,i8)if y.fuseMsg~=""then cX[#cX+1]=y.fuseMsg end
return table.concat(cX,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local oL=o.wishes()local dP=o.data()for i9,oM in pairs(o.rows)do local xQ=y.status(i9,dP)oM.desc.Text=(oL[i9]and("wishing %dm | "):format(math.ceil(oL[i9]/60))or"")..(xQ and(xQ.." | ")or"")..oM.boostText
oM.desc.TextColor3=oL[i9]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dP))end local xR=tonumber(K:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dP and#(dP.pets or{})or 0,dP and tonumber(dP.maxOwned)or 60,
av(o.money()),xR>0 and(" | free wishes "..xR)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local i_=o.info()for MB,ja in ipairs(a.petList:GetChildren())do if ja:IsA("Frame")or ja:IsA("TextLabel")or ja:IsA("TextButton")then ja:Destroy()end
end o.rows={}if not i_ then Q(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dQ={}for MC,xS in ipairs(o.order())do local oN=i_.Pets[xS].rarity or"?"dQ[oN]=dQ[oN]or{}
table.insert(dQ[oN],xS)end local dR={}for MD,xT in ipairs(i_.Rarities or{})do if dQ[xT]then dR[#dR+1]=xT end end
for xU in pairs(dQ)do if not table.find(dR,xU)then dR[#dR+1]=xU end end for ME,oO in ipairs(dR)do local jb=o.RC[oO]or l.text
local cY=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
aa(cY,11)a.stroke(cY,jb,0.7)a.list(cY,4)a.pad(cY,7,7,7,8)local xV=a.row(cY,18)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=jb,BorderSizePixel=0},xV)
local Io=Q(xV,oO:upper(),11,jb,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Io.Font=af.x for MF,jc in ipairs(dQ[oO])do
local f3=L("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cY)},cY)
aa(f3,8)local oP=Q(f3,o.nice(jc),11,jb,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))oP.TextWrapped,oP.TextTruncate=false,Enum.TextTruncate.AtEnd
local Ip,Iq=pcall(function()return i_.describe(jc)end)local xW=Ip and tostring(Iq)or""local oQ=Q(f3,xW,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oQ.TextYAlignment,oQ.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function jd(Ir,Is,It)
local xX=aj(f3,Ir,l.bg,8,UDim2 .new(1,Is,0,5),UDim2 .new(0,It,0,22))xX.AutoButtonColor=true return xX end local xY,xZ,x0,x1=jd("BUY",-164,30),jd("ANY",-131,30),jd("WISH",-98,34),jd("AUTO",-61,56)
local je=jc xY.MouseButton1Click:Connect(function()o.flag(je,"b")end)xZ.MouseButton1Click:Connect(function()o.flag(je,"g")end)
x0 .MouseButton1Click:Connect(function()o.flag(je,"w")end)x1 .MouseButton1Click:Connect(function()o.flag(je,"f")end)
o.rows[jc]={b=xY,g=xZ,w=x0,f=x1,name=oP,desc=oQ,boostText=xW,row=f3}end end o.built=true o.paintAll()end function d.paint()
O(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")O(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
O(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")O(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
O(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])O(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end V(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
V(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))V(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
V(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))V(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
V(a.pfFps.MouseButton1Click:Connect(function()local Iu=table.find(d.CAPS,e.FpsCap or 0)or 1 local x2=d.CAPS[(Iu%#d.CAPS)+1]
if not d.cap(x2)and x2~=0 then D("this executor cannot cap fps")end d.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()
local oR=tonumber(a.pfMem.Text)if oR and oR>=0 then e.MemLimit=math.floor(oR)end d.paint()end))function A.names()
local oS={"(none)"}for MG,Iv in ipairs((A.teams()))do oS[#oS+1]=Iv.name end return oS end function A.cycle(oT,Iw)
local jf=A.names()local Ix=e[oT]~=""and e[oT]or"(none)"local jg=table.find(jf,Ix)or 1 jg=((jg-1+Iw)%#jf)+1 e[oT]=jf[jg]=="(none)"and""or jf[jg]
A.paint()end function A.paint()if not A.built then return end O(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
O(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oU={}for MH,Iy in ipairs((A.teams()))do oU[Iy.name]=true end
for Iz,x3 in pairs(A.pick)do local dS=e[Iz]x3 .Text=dS==""and"(none)"or(oU[dS]and dS or(dS.." (missing)"))x3 .TextColor3=(dS~=""and not oU[dS])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local IA,jh=o.srv(),{}for MI,ji in ipairs(A.list or{})do jh[#jh+1]=("st %-2s %-22s %9s  helps %d"):format(ji.st.Name,am(W(ji.name)):sub(1,22),A.clock(ji.ends-IA),ji.helps)
end a.tmList.Text=#jh>0 and table.concat(jh,"\n")or"no waxes running"end function A.build()for MJ,jj in ipairs(a.teamList:GetChildren())do
if jj:IsA("Frame")or jj:IsA("TextLabel")or jj:IsA("TextButton")then jj:Destroy()end end A.pick={}local jk=a.card(a.teamList,"Automatic")
a.tmT=a.switch(jk,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(jk,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(jk,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local IB,IC=pcall(y.rebuild,"you asked")if not IB then D("BUILD ERR "..tostring(IC))end end)
end)a.tmInfo=a.grow(jk,10,l.dim)local x4=a.card(a.teamList,"Which team when")local function jl(jm,ID,IE)local f4=a.row(x4,54)
Q(f4,ID,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local x5=Q(f4,IE,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
x5 .TextWrapped,x5 .TextTruncate=false,Enum.TextTruncate.AtEnd local IF=aj(f4,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local x6=aj(f4,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local IG=aj(f4,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
IF.MouseButton1Click:Connect(function()A.cycle(jm,-1)end)IG.MouseButton1Click:Connect(function()A.cycle(jm,1)end)
x6 .MouseButton1Click:Connect(function()A.cycle(jm,1)end)A.pick[jm]=x6 end jl("TeamNormal","Normal","the rest of the time: money + luck")
jl("TeamFull","Full","every station busy: money + wax speed")jl("TeamGlaze","Glaze","worn just before a wax finishes")
local jn=a.row(x4,26)Q(jn,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=iH(jn,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
Q(jn,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local IH=aj(jn,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
IH.MouseButton1Click:Connect(function()local jo=tonumber(a.tmLead.Text)if jo and jo>=5 and jo<=600 then e.GlazeLead=math.floor(jo)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)jl("TeamWax","Wax","while a butter is placed: head starts")local x7=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(x7)},x7)aa(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local II=a.card(a.teamList,"How it works")a.note(II,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function IJ()a.secB.Text=tostring(e.Every)O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ah(0.1)end if not F.home then pcall(d.unpin)end end)end
O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fC(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b6(a.root)b6(a.tgRoot)c.lastCollect=z()
ox()M.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function IK(x8)task.spawn(function()x8 .TextColor3=l.bad
task.wait(0.8)if c.alive then x8 .TextColor3=l.text end end)end local function x9()local x_=a.secB.Text:match("^%s*(%d+)%s*$")
local f5=x_ and tonumber(x_)if not f5 or f5<1 then a.secB.Text=tostring(e.Every)IK(a.secB)D("interval must be a whole number >= 1")
return end if f5==e.Every then return end e.Every,c.lastCollect=f5,z()D("collect every "..f5 .."s")end local function N(IL,IM)V(IL.MouseButton1Click:Connect(IM))end
N(a.secSet,x9)V(a.secB.FocusLost:Connect(x9))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(au,"selling...",vm)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(E.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help F.nextAt,F.msg=0,e.Help and"looking for waxes to help"or"off"O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests J.at=0 O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire H.nextAt,H.fails,H.lost=0,0,0 O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()O(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")O(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
O(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
O(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")O(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(IN)task.spawn(function()pcall(q.tick)if IN and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local IO=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(IO)end)
N(a.bestT,function()local IP=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(IP)end)N(a.bcT,function()
local IQ=q.on()e.BestCrate=not e.BestCrate q.changed(IQ)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
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
local dU,oV={},ag:FindFirstChild("AdminShow")if oV then local IR,IS=pcall(function()return oV:GetAttributes()end)
for ya,dV in pairs(IR and IS or{})do local jp=type(ya)=="string"and ya:match("^(.-)Mult$")local oW=jp and tonumber(oV:GetAttribute(jp.."Until"))
if jp and type(dV)=="number"and dV~=1 and dV~=0 and oW and oW>b8 then dU[#dU+1]=("%s  x%s   %s left"):format(jp:gsub("(%l)(%u)","%1 %2"),(dV%1==0)and tostring(dV)or("%.2f"):format(dV),
A.clock(oW-b8))end end end table.sort(dU)a.put(a.admBoost,#dU>0 and table.concat(dU,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dU>0 and l.accent or l.dim local jq=0 for MK in pairs(P.drops)do jq=jq+1 end local yb=q.snapAt and(q.snapAt-b8)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(P.got,P.miss,jq>0 and(", "..jq.." falling")or"",
yb and("in "..math.max(0,math.floor(yb)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(au,"opening crate...",ex,true)end)N(a.padB,function()c.plot=bF()or c.plot local yc,oX=aq(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(yc and oX and oX:IsA("BasePart"))then D("SET PAD: need character and plot")return end c.manualPad=oX.CFrame:ToObjectSpace(yc.HumanoidRootPart.CFrame)
Fo(c.manualPad)D("collect pad saved at your position")end)N(a.startB,function()fC(not c.running)end)N(a.buyB,function()
c.plot=bF()or c.plot task.spawn(au,"buying (manual)...",qT,true)end)N(a.plB,function()c.plot=bF()or c.plot task.spawn(au,"waxing (manual)...",qZ)
end)N(a.tabFarm,function()aW("farm")end)N(a.tabRun,function()aW("run")end)N(a.tabSrv,function()aW("srv")end)N(a.tabAdm,function()aW("adm")end)
N(a.tabBut,function()aW("but")end)N(a.tabSet,function()aW("set")end)N(a.tabCrt,function()aW("crt")end)N(a.tabPet,function()aW("pet")end)
N(a.tabTeam,function()aW("team")end)N(a.tabAlt,function()aW("alt")if type(a.altShown)=="function"then pcall(a.altShown)end end)
a.mk,a.lbl,a.button,a.round,a.C,a.FT,a.click=L,Q,aj,aa,l,af,N do local IT=a.card(a.alt,"Alts","several accounts in one server")
a.altNote=Q(a.row(IT,40),"The team module is not running on this account. Load the farm with altboot.lua to use it.",10,l.dim,false)
a.altNote.TextWrapped,a.altNote.TextYAlignment=true,Enum.TextYAlignment.Top end local function IU(oY)c.hidden=oY
a.root.Visible=not oY a.tgBtn.TextColor3=oY and l.text or l.ink end wW(a.tgBtn,a.tgRoot,function()b6(a.tgRoot)
c.togPos=iM(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then IU(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aO,aA={},0 local function cb()aO=qh()if#aO==0 then a.cfgPick.Text="(none saved)"
aA=0 return end if aA<1 or aA>#aO then aA=1 end a.cfgPick.Text=aO[aA]..("  (%d/%d)"):format(aA,#aO)end local function yd()
local ye=c.autoload~=nil a.cfgAuto.Text=ye and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=ye and l.accent or l.panel2
end local function oZ()local yf=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if yf~=""then return yf end return(aA>0 and aO[aA])or""
end N(a.cfgSave,function()c.winPos=iM(a.root)or c.winPos c.togPos=iM(a.tgRoot)or c.togPos local yg,yh=ef(oZ())
a.cfgMsg.Text=yg and("saved as "..yh)or("could not save: "..yh)a.cfgMsg.TextColor3=yg and l.good or l.bad cb()
D(a.cfgMsg.Text)end)local function IV(o0)local o1,yi=kg(o0)a.cfgMsg.Text=o1 and("loaded "..yi)or("could not load: "..yi)
a.cfgMsg.TextColor3=o1 and l.good or l.bad if o1 then a.cfgName.Text=o0 IJ()task.spawn(E.apply,"config "..o0)
end D(a.cfgMsg.Text)end N(a.cfgLoad,function()IV(oZ())end)N(a.cfgPick,function()cb()if aA>0 then a.cfgName.Text=aO[aA]end
end)N(a.cfgPrev,function()if#aO==0 then cb()return end aA=(aA-2)%#aO+1 cb()a.cfgName.Text=aO[aA]end)N(a.cfgNext,function()
if#aO==0 then cb()return end aA=aA%#aO+1 cb()a.cfgName.Text=aO[aA]end)N(a.cfgAuto,function()if c.autoload then
kh(nil)a.cfgMsg.Text="it will not load a config on launch"else local f7=oZ()local yj=false for ML,IW in ipairs(qh())do if IW==f7 then yj=true end end
local IY=yj or ef(f7)if IY and f7~=""then kh(f7)cb()a.cfgMsg.Text=f7 .." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim yd()end)N(a.autoB,function()
local yk,yl=Aj()a.autoMsg.Text=yk and("installed. "..yl)or("failed: "..yl)a.autoMsg.TextColor3=yk and l.good or l.bad
D(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()eg("you asked")end)
local bj=false N(a.minB,function()bj=not bj a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bj,not bj,not bj
if bj then for MM,IZ in ipairs(a.tabKeys)do a[IZ].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,T.head+6),UDim2 .new(1,-16,0,T.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,T.rail+8,0,T.head+6),UDim2 .new(1,-(T.rail+16),0,T.status)aW(xF)
end a.root.Size=UDim2 .new(0,T.w,0,bj and(T.head+T.status+12)or T.h)a.minB.Text=bj and"+"or"-"end)local function jr()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(gn)for MN,I0 in ipairs(jA)do pcall(function()I0:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end if c.hidPurchaseApp then pcall(function()c.hidPurchaseApp.Enabled=true end)end
pcall(function()n2:Destroy()end)pcall(function()xo:Destroy()end)if c1 .SAB_KILL==jr then c1 .SAB_KILL=nil end
end c1 .SAB_KILL=jr N(a.killB,jr)N(a.xB,jr)wW(a.title,a.root,function()b6(a.root)c.winPos=iM(a.root)or c.winPos
end)local function ym()local f8,cZ=c.reason,c.level if c.busy then f8,cZ=c.busyText,"ok"elseif not c.running then
local MO,yn,I1=vZ()if c.capHit then f8,cZ=yn,"bad"else f8,cZ="[stopped] "..yn,(I1=="bad")and"bad"or"idle"end c.reason,c.level=f8,cZ
end local dW=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dW then a.lit.dot=dW a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dW,dW,dW,dW
a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,f8)if a.lit.bar~=cZ then a.lit.bar=cZ a.bar.BackgroundColor3=GF[cZ]or l.dim end
if bj then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local cc=zU()if a.farm.Visible then local I2,I3=gk()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,I2 .."/"..I3)local yo=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local yp=ad()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
av(bk()),c.rolls,c.gifts,c.crates,yp and am(W(yp))or"nothing",j.on and("   ["..j.title.." window open]")or"",
yo and("in "..yo.."s")or"off"))a.put(a.tgt,(#cc==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#cc<=3)and table.concat(cc,", ")or(#cc.." butters ticked"))))
if a.lit.tgt~=(#cc==0)then a.lit.tgt=(#cc==0)a.tgt.TextColor3=(#cc==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(ge,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and F.msg or"helping is off")a.put(a.srvCamp,e.Campfire and H.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ae.n,#ae.rarOrder,#cc))
end if a.but.Visible and bC.at~=ae.at then f2(false)end if a.crt.Visible then if M.built~=M.at then M.build()else M.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and F.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and H.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(J.msg~=""and J.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local yq=(E.rec.on and"on"or"")..(E.rec.off and((E.rec.on and"/"or"").."off")or"")
a.put(a.arL,E.msg~=""and E.msg or("auto roll  %s | knows %s%s"):format(E.isOn()and"running"or"stopped",yq~=""and yq or"nothing yet",#E.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(E.msg~="")then a.lit.arL=(E.msg~="")a.arL.TextColor3=E.msg~=""and l.warn or l.dim end end end c1 .SAB={S=c,CFG=e,EV=ab,U=a,sg=n2,CAT=ae,LEARN=al,buildList=f2,
logAll=dZ,evAll=d0,AR=E,CR=M,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=F,CF=H,QX=J,IX=q,SH=P,saveConfig=ef,loadConfig=kg,setAutoload=kh}
D(cd.." loaded")if c.uiErrs>0 then D("UI: "..c.uiErrs.." properties skipped")end aW("farm")b6(a.root)b6(a.tgRoot)
if iJ then pcall(function()V(iJ:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)b6(a.root)
b6(a.tgRoot)end))end)end cb()yd()if c.config and c.config~=""then a.cfgName.Text=c.config end O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(ym)task.spawn(function()local yr=Ah()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(yr and("\n(backup: "..yr..")")or"")
local ys=ec(ar.exec)if ys and not ys:find("SAB autoloader v2",1,true)then gH(ar.exec,ar.stub)D("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(ec(ar.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(Ap)end)task.spawn(function()while c.alive do local I4,I5=pcall(ym)if not I4 then D("UI ERR "..tostring(I5))end
task.wait((c.hidden or bj)and 1.5 or 0.4)end end)task.spawn(function()local I6,I7=pcall(Ax)if not I6 then D("HOOK ERR "..tostring(I7))end
end)task.spawn(function()pcall(zg)if j.loadSeq and not j.learned then local js={}for yt=1,20 do if j.loadSeq[yt]then js[#js+1]=j.loadSeq[yt]end end
if#js>0 then j.learned={seq=js,mode=j.loadMode}D("remembered how to open crates directly")end end if ka()then D(("catalog: %d butters in %d rarities"):format(ae.n,#ae.rarOrder))end
local I8,yu=pcall(Fq)if I8 and yu and c.alive and not c.manualPad then c.manualPad=yu end end)task.spawn(function()
while c.alive do local o2,o3=pcall(o.buyTick)if not o2 then D("PET ERR "..tostring(o3))task.wait(5)end o2,o3=pcall(o.wishTick)
if not o2 then D("WISH ERR "..tostring(o3))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local jt,yv=0,z()
V(game:GetService("RunService").Heartbeat:Connect(function()jt=jt+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
V(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local yw=z()d.fps,jt,yv=jt/math.max(yw-yv,0.001),0,yw local I9,I_=pcall(d.tick)if not I9 then D("PERF ERR "..tostring(I_))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local Ja,Jb=pcall(y.tick)if not Ja then D("FUSE ERR "..tostring(Jb))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local Jc,Jd=pcall(A.tick)if not Jc then D("TEAM ERR "..tostring(Jd))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local ju=ag:WaitForChild("Remotes",30)local yx=ju and ju:WaitForChild("ClanEvent",30)
if yx and c.alive then V(yx.OnClientEvent:Connect(function(Je,Jf)if Je=="call"then pcall(F.onCall,Jf)end end))
end local yy=ju and ju:FindFirstChild("RollConfirmAsk")if yy and c.alive then V(yy.OnClientEvent:Connect(function(Jg)J.asked=Jg or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)pcall(d.walkPatch,true)end
end end)task.spawn(function()local o4=ag:WaitForChild("Remotes",30)if not(o4 and c.alive)then return end local function jv(Jh,Ji)
local o5=o4:FindFirstChild(Jh)if o5 and o5:IsA("RemoteEvent")then V(o5 .OnClientEvent:Connect(function(...)pcall(Ji,...)end))end
end jv("NewSquishyDiscovered",function(o6,yz)if type(o6)~="string"then return end q.disc=q.disc or{}q.disc[W(o6)]=true
D(("INDEX: %s%s is in your Index now"):format(am(W(o6)),yz and(" ("..tostring(yz)..")")or""))end)jv("IndexRefresh",q.loadDisc)
jv("IndexRowComplete",function(Jj)D("INDEX: the whole "..tostring(Jj).." row is complete")end)jv("AdminShow",q.admin)
local yA=o4:FindFirstChild("AdminShowSync")if yA then local Jk,yB=pcall(function()return yA:InvokeServer()end)
if Jk and type(yB)=="table"then for MP,Jl in pairs(yB)do pcall(P.add,Jl)end end end while c.alive do local Jm,Jn=pcall(q.tick)
if not Jm then q.msg="index error: "..tostring(Jn)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Jo,Jp=pcall(J.tick)if not Jo then D("QUEST ERR "..tostring(Jp))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(gn)end end)pcall(E.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Jr=(type(newcclosure)=="function")and newcclosure or function(Jq)return Jq end local o7
local yC=(type(setnamecallmethod)=="function")and setnamecallmethod or nil o7=hookmetamethod(game,"__namecall",Jr(function(yD,...)
local f9=getnamecallmethod()if c.alive and(f9=="InvokeServer"or f9=="FireServer")then local yE,yF=pcall(function()return yD.Name end)
if yE and yF=="CrateAction"and not j.replaying then pcall(j.saw,f9,...)elseif yE and yF=="AutoRollAction"and not E.replaying then pcall(E.saw,f9,...)end
if yC then yC(f9)end end return o7(yD,...)end))j.oldNC=o7 end)end pcall(function()local f_=getgenv and getgenv()or _G
c.robuxBlocked=0 f_.SAB_NOROBUX=f_.SAB_NOROBUX or{n=0,last=""}if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
local bE=f_.SAB_NOROBUX local c0=game:GetService("MarketplaceService")local Js={PromptGift=true,PromptLimitedSquishy=true,PromptMultMoneyGamepass=true,PromptServerLuck=true,
PromptShopCrate=true,PromptTimeSkip=true,PromptDoubleOfflineEarnings=true,FinishWaxOffer=true}pcall(function()
local Ju=(type(newcclosure)=="function")and newcclosure or function(Jt)return Jt end local yG yG=hookmetamethod(game,"__namecall",Ju(function(o8,...)
local ga=getnamecallmethod()if c.alive and o8==c0 and type(ga)=="string"and ga:sub(1,6)=="Prompt"then bE.n,bE.last=bE.n+1,ga
return nil end if ga=="FireServer"or ga=="InvokeServer"then local yH,dX=pcall(function()return o8 .Name end)local o9,MQ,Jv=...
if yH and dX=="ClanRequest"and(o9=="refresh"or(o9=="create"and Jv=="robux"))then dX="ClanRequest "..o9 end if yH and(Js[dX]or dX=="ClanRequest refresh"or dX=="ClanRequest create")and c.alive then
bE.n,bE.last=bE.n+1,dX return nil end end return yG(o8,...)end))end)local function gb(yI,Jw)pcall(function()V(c0[yI]:Connect(function(Jx,Jy)
bE.n,bE.last=bE.n+1,yI pcall(Jw,Jx,Jy)end))end)end gb("PromptProductPurchaseRequested",function(o_,Jz)c0:SignalPromptProductPurchaseFinished(typeof(o_)=="Instance"and o_.UserId or o_,Jz,false)
end)gb("PromptGamePassPurchaseRequested",function(JA,JB)c0:SignalPromptGamePassPurchaseFinished(JA,JB,false)end)
gb("PromptPurchaseRequested",function(JC,JD)c0:SignalPromptPurchaseFinished(JC,JD,false)end)gb("PromptBundlePurchaseRequested",function(JE,JF)c0:SignalPromptBundlePurchaseFinished(JE,JF,false)end)
gb("PromptPremiumPurchaseRequested",function()c0:SignalPromptPremiumPurchaseFinished(false)end)end local function yJ()
local JG,JH=pcall(function()local gc=game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp")if gc and gc:IsA("ScreenGui")then
c.hidPurchaseApp=gc if gc.Enabled then gc.Enabled=false end end end)if not JG then c.hideErr=tostring(JH)end end
yJ()task.spawn(function()local yK=f_.SAB_NOROBUX.n while c.alive do task.wait(5)yJ()local dY=f_.SAB_NOROBUX if dY and dY.n>yK then
c.robuxBlocked,yK=dY.n,dY.n D(("ROBUX PROMPT BLOCKED (%s) - %d so far"):format(dY.last,dY.n))end end end)end)
if jy then V(K.Idled:Connect(function()pcall(function()jy:CaptureController()jy:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for MR=1,90 do if not c.alive then return end if K:GetAttribute("AutoRollOn")~=nil and aq()and(c.plot or bF())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then E.apply("joined")end while c.alive do task.wait(30)local jw=ck()
if jw and q.on()and not aP(jw.name)then jw=nil end if c.alive and e.AutoRoll and c.running and not E.isOn()and not jw and not ad()
and not j.waiting and not j.on and not c.busy then E.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for MS=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bF()if aq()and c.plot and q.any()then fC(true,true)D("started by itself")
return end task.wait(1)end if c.alive and not c.running then D("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bF()c.lastCollect=z()while c.alive do if c.running then local JI,yL=pcall(GA)if not JI and yL~=jz then D("LOOP ERR "..tostring(yL))end
end task.wait(0.1)end end)jx("ready - the window is at the top left")end local JK,pa=xpcall(yP,function(JJ)return tostring(JJ).."\n"..debug.traceback()end)
if not JK then pcall(function()warn("SAB "..cd.." ERROR: "..tostring(pa))end)jx("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cd.." ERROR: "..tostring(pa))end)pcall(function()local yM=(type(getgenv)=="function"and getgenv())or _G
if type(yM.SAB_KILL)=="function"then yM.SAB_KILL()end for MT,JL in ipairs({"SABFarmGui","SABToggle"})do local yN=K.PlayerGui:FindFirstChild(JL)
if yN then yN:Destroy()end end end)pcall(function()local gd=Instance.new("ScreenGui")gd.Name="SABError"gd.ResetOnSpawn=false
gd.DisplayOrder=1000 local a7=Instance.new("TextBox")a7 .Size=UDim2 .new(0,340,0,170)a7 .Position=UDim2 .new(0,10,0,50)
a7 .BackgroundColor3=Color3 .fromRGB(90,20,20)a7 .TextColor3=Color3 .new(1,1,1)a7 .TextSize=11 a7 .TextWrapped=true
a7 .ClearTextOnFocus=false a7 .TextXAlignment=Enum.TextXAlignment.Left a7 .TextYAlignment=Enum.TextYAlignment.Top
a7 .Text="SAB "..cd.." failed to start. Send this text:\n"..tostring(pa)a7 .Parent=gd gd.Parent=K:WaitForChild("PlayerGui")
end)end
