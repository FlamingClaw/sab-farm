local cd="v28"local pc=game:GetService("Players")local K=pc.LocalPlayer or pc.PlayerAdded:Wait()local function jx(yP)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..cd,Text=yP,Duration=6})
end)end jx("script started")local function yQ()local ag=game:GetService("ReplicatedStorage")local ak=game:GetService("Workspace")
local pd=game:GetService("UserInputService")local c1=(type(getgenv)=="function"and getgenv())or _G if type(c1 .SAB_KILL)=="function"then pcall(c1 .SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jy=(function()local yR,yS=pcall(function()return game:GetService("VirtualUser")end)return yR and yS or nil end)()
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
local o,A,d,y,F,H,J={},{},{},{},{},{},{}local q,P={},{}local jz={}local jA,ge,dZ,d0={},{},{},{}local function V(pe)jA[#jA+1]=pe return pe end
local function ah(yT)task.wait(yT)if not c.alive then error(jz,0)end end local function D(gf)gf=os.date("%H:%M:%S").." "..tostring(gf)
table.insert(ge,1,gf)if#ge>6 then table.remove(ge)end c.logN=(c.logN or 0)+1 dZ[#dZ+1]=gf if#dZ>80 then table.remove(dZ,1)end
end local function gg(pf)if type(pf)~="string"then return""end return(pf:lower():gsub("[^%w]",""))end local function W(yU)
local pg=gg(yU)local jB=pg:gsub("butter$","")if jB==""then jB=pg end return jB end local function aP(jC)if type(jC)~="string"then return false end
local jD=W(jC)if jD==""then return false end if q.isLimited and q.isLimited(jC)then return q.limitedHere()end
if q.want then return q.want(jD)end return e.Targets[jD]==true end local function yV(d1)d1=d1:lower()return d1:find("squishy",1,true)~=nil or d1:match("butter$")~=nil or d1:match("butter[^%a]")~=nil
end local jE={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function av(d2)if type(d2)~="number"then return"?"end
local gh=1 while math.abs(d2)>=1000 and gh<#jE do d2=d2/1000 gh=gh+1 end local yW=string.format("%.2f",d2):gsub("%.?0+$","")
return yW..jE[gh]end local function yX(ph)if type(ph)~="string"then return nil end local yY,d3=ph:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jF=tonumber(yY)if not jF then return nil end if d3==""then return jF end local yZ={qd="qa",qn="qi"}d3=yZ[d3:lower()]or d3
for y0,y1 in ipairs(jE)do if y1:lower()==d3:lower()then return jF*1000^(y0-1)end end return nil end local function bk()
local jG=K:FindFirstChild("MoneyValue")if jG and type(jG.Value)=="number"then return jG.Value end local pj=K:GetAttribute("BoardValueMoney")
if type(pj)=="number"then return pj end local pk=K:FindFirstChild("leaderstats")if pk then for JM,y2 in ipairs({"Cash","Money","Coins"})do
local jH=pk:FindFirstChild(y2)if jH and type(jH.Value)=="number"then return jH.Value end end end end local function gi(y3)
local jI=y3:GetFullName()if c.plot then local jJ=c.plot:GetFullName()if jI:sub(1,#jJ)==jJ then return jI:sub(#jJ+2)end
end return jI end local function aq()local gj=K.Character if gj and gj:FindFirstChild("HumanoidRootPart")then
local pl=gj:FindFirstChildOfClass("Humanoid")if pl and pl.Health>0 then return gj end end end local function bF()
local jK=ak:FindFirstChild("Plots")if not jK then return nil end local function pm(y4)local pn=y4:FindFirstChild("Plate")
return pn~=nil and pn:FindFirstChild("EditStackAttachment",true)~=nil end local po=K:GetAttribute("PlotNumber")
if po~=nil then local jL=jK:FindFirstChild(tostring(po))if jL and pm(jL)then return jL end end for JN,pp in ipairs(jK:GetChildren())do
if pm(pp)then return pp end end end local function d4(pq)local bG=pq and pq.Parent for JO=1,6 do if not bG then return nil end
if bG:IsA("BasePart")then return bG end if bG:IsA("Model")then return bG.PrimaryPart or bG:FindFirstChildWhichIsA("BasePart",true)end
bG=bG.Parent end end local function ps(pt)local jM=pt.Parent if jM and jM:IsA("Attachment")then return jM.WorldPosition end
local pu=d4(pt)return pu and pu.Position end local function pv()local c2=c.plot and c.plot:FindFirstChild("Plate")
if not c2 then return nil end if c2:IsA("BasePart")then return c2 .Position end if c2:IsA("Model")then return c2:GetPivot().Position end
local pw=c2:FindFirstChildWhichIsA("BasePart",true)return pw and pw.Position end local function px()local jN={}
local py=c.plot and c.plot:FindFirstChild("WaxStations")if py then for JP,y5 in ipairs(py:GetChildren())do local pz=y5:FindFirstChild("SquishyPlaceHolder")
local jO=pz and pz:FindFirstChild("PlacePrompt")if jO and jO:IsA("ProximityPrompt")then jN[#jN+1]=jO end end end
return jN end local function gk()local pA,jP=px(),0 for JQ,y6 in ipairs(pA)do if y6 .Enabled then jP=jP+1 end end
local jQ=#pA local jR=K:GetAttribute("WaxStations")if type(jR)=="number"and jR>jQ then jQ=jR end return jP,jQ
end local function y7()local pB=aq()local pC=pB and pB.HumanoidRootPart.Position local jS,pD for JR,jT in ipairs(px())do
if jT.Enabled then local pE=ps(jT)local pF=(pE and pC)and(pE-pC).Magnitude or 1e9 if not jS or pF<pD then jS,pD=jT,pF end
end end return jS end local function pG()local gl=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not gl then return nil end local pH=gl:FindFirstChild("BuyPromptAttachment")local gm=(pH and pH:FindFirstChild("BuyPrompt"))or gl:FindFirstChild("BuyPrompt",true)
if gm and gm:IsA("ProximityPrompt")and gm:IsDescendantOf(gl)then return gm end end local pI={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local y8={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local al={order={},price={},dirty=false}local M={seen={},at=0,boxes={},built=0}local ae={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jU="SAB_order.txt"local function gn()if not al.dirty or type(writefile)~="function"then return end local aG={}
for y9,y_ in pairs(al.price)do aG[#aG+1]="P|"..y9 .."|"..string.format("%.0f",y_)end for za,zb in pairs(al.order)do aG[#aG+1]="O|"..za.."|"..table.concat(zb,",")end
if j.learned and j.enc then aG[#aG+1]="M|mode|"..tostring(j.learned.mode or"")for zc,go in ipairs(j.learned.seq)do
local pJ={}for pK=1,go.n do pJ[pK]=j.enc(go.args[pK])end aG[#aG+1]=("A|%d|%s|%d|%s"):format(zc,go.m,go.n,table.concat(pJ,";"))
end end local function jV(zd,ze,gp)local pL={}for pM=1,gp.n do pL[pM]=j.enc(gp.args[pM])end aG[#aG+1]=("R|%d|%s|%s|%d|%s"):format(ze,zd,gp.m,gp.n,table.concat(pL,";"))
end if j.enc then for zf,zg in ipairs(E.rec.rules)do jV("rules",zf,zg)end if E.rec.on then jV("on",0,E.rec.on)end
if E.rec.off then jV("off",0,E.rec.off)end end for JS,d5 in pairs(M.seen)do aG[#aG+1]=("K|%s|%s|%s|%s"):format(d5 .name,d5 .title or"",d5 .rar or"",d5 .price and string.format("%.0f",d5 .price)or"")
end if pcall(writefile,jU,table.concat(aG,"\n"))then al.dirty=false end end local function zh()if type(isfile)~="function"or type(readfile)~="function"then return end
local zi,zj=pcall(isfile,jU)if not(zi and zj)then return end local zk,pN=pcall(readfile,jU)if not(zk and type(pN)=="string")then return end
for zl in pN:gmatch("[^\n]+")do local c3,c4,bl=zl:match("^(%a)|([^|]+)|(.*)$")if c3=="P"then al.price[c4]=tonumber(bl)
elseif c3=="M"then j.loadMode=(bl~=""and bl~="nil")and bl or nil elseif c3=="A"and j.dec then local pO=tonumber(c4)
local pP,gq,zm=bl:match("^([^|]+)|(%d+)|(.*)$")if pO and pP then gq=tonumber(gq)local pQ,gr={},0 for zn in(zm..";"):gmatch("([^;]*);")do
gr=gr+1 if gr<=gq then pQ[gr]=j.dec(zn)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pO]={m=pP,n=gq,args=pQ}end elseif c3=="R"and j.dec then
local pR=tonumber(c4)local gs,zo,gt,zp=bl:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pR and gs then gt=tonumber(gt)
local pS,gu={},0 for zq in(zp..";"):gmatch("([^;]*);")do gu=gu+1 if gu<=gt then pS[gu]=j.dec(zq)end end local jW={m=zo,n=gt,args=pS}
if gs=="rules"then E.rec.rules[pR]=jW elseif gs=="on"then E.rec.on=jW elseif gs=="off"then E.rec.off=jW end end
elseif c3=="K"then local pT,pU,zr=bl:match("^([^|]*)|([^|]*)|(.*)$")M.seen[M.key(c4)]={name=c4,title=pT~=""and pT or nil,
rar=pU~=""and pU or nil,price=tonumber(zr)}elseif c3=="O"and bl~=""then local gv={}for zs in bl:gmatch("[^,]+")do gv[#gv+1]=zs end
if#gv>0 then al.order[c4]=gv end end end end local function zt(gw)if type(gw)~="table"then return end local ce,pV=gw.rarity,gw.contents
if type(ce)~="string"or ce==""or type(pV)~="table"then return end local d6={}for JT,gx in ipairs(pV)do if type(gx)=="table"and type(gx.butter)=="string"then
d6[#d6+1]={n=gx.butter,ch=tonumber(gx.chance)or 0}end end if#d6==0 then return end table.sort(d6,function(zu,zv)return zu.ch>zv.ch end)
local d7,d8={},false for zw,zx in ipairs(d6)do d7[zw]=zx.n end local jX=al.order[ce]if not jX or#jX~=#d7 then d8=true end
if not d8 then for pW=1,#d7 do if jX[pW]~=d7[pW]then d8=true break end end end al.order[ce]=d7 local jY=tonumber(gw.price)
if jY and al.price[ce]~=jY then al.price[ce]=jY d8=true end if d8 then al.dirty=true ae.at=0 D("learned the "..ce.." order from its crate")
end end local function c5(zy,zz)local zA=zy:FindFirstChild(zz,true)local zB,jZ=pcall(function()return zA.Text end)
return(zB and type(jZ)=="string"and jZ~="")and jZ or nil end local function am(pX)return ae.pretty[pX]or pX end
M.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function M.key(zC)return gg(zC or"")end
function M.learn(bm)if type(bm)~="table"or type(bm.name)~="string"then return end local j0=M.key(bm.name)local bn=M.seen[j0]or{}
local zD=(M.seen[j0]==nil)or(tonumber(bm.price)and bn.price~=tonumber(bm.price))bn.name,bn.title=bm.name,bm.title or bn.title
bn.rar,bn.price=bm.rarity or bn.rar,tonumber(bm.price)or bn.price M.seen[j0]=bn if zD then M.at,al.dirty=z(),true end
end function M.wanted(pY)if pY==nil then return false end local j1=M.key(pY)return e.CrateTicks[j1]==true or(e.BestCrate and q.bestCrate~=nil and(j1==q.bestCrate or j1==q.bestCrateTitle))
end function M.list()local c6={}for zE,gy in ipairs(M.base)do c6[M.key(gy[1])]={name=gy[1],title=gy[2],rar=gy[3],i=zE}end
for JU,d9 in ipairs(ae.rarOrder)do local pZ=false for JV,zF in pairs(c6)do if zF.rar==d9 then pZ=true break end end
if not pZ and d9~="?"then local p0=d9:gsub("[^%w]","").."Crate"c6[M.key(p0)]={name=p0,title=d9 .." Crate",rar=d9,i=50,guess=true}
end end for p1,gz in pairs(M.seen)do local a8=c6[p1]or{i=100}a8 .name,a8 .title,a8 .rar=gz.name or a8 .name,gz.title or a8 .title,gz.rar or a8 .rar
a8 .price,a8 .guess=gz.price or a8 .price,nil c6[p1]=a8 end local d_,gA={},{}for zG,zH in ipairs(pI)do d_[zH]=zG end
for zI,p2 in ipairs(ae.rarOrder)do d_[p2]=d_[p2]or(20+zI)end for zJ,ea in pairs(c6)do ea.k=zJ ea.price=ea.price or al.price[ea.rar or""]
gA[#gA+1]=ea end table.sort(gA,function(cf,cg)if cf.price and cg.price and cf.price~=cg.price then return cf.price<cg.price end
local p3,p4=d_[cf.rar or""]or 99,d_[cg.rar or""]or 99 if p3~=p4 then return p3<p4 end if(cf.i or 100)~=(cg.i or 100)then return(cf.i or 100)<(cg.i or 100)end
return cf.k<cg.k end)return gA end local function zK()local p5=ag:FindFirstChild("Assets")local p6=p5 and p5:FindFirstChild("Squishies")
if not p6 then return false end local j2,p7,c7={},{},{}local gB=0 for JW,gC in ipairs(p6:GetChildren())do local eb=W(gC.Name)
if eb~=""and not j2[eb]then local gD=c5(gC,"RarityText")or"?"j2[eb]=gD p7[eb]=c5(gC,"NameText")or gC.Name c7[gD]=c7[gD]or{}
table.insert(c7[gD],eb)gB=gB+1 end end if gB==0 then return false end for p8,zL in pairs(c7)do local p9=al.order[p8]or y8[p8]
local j3={}if p9 then for zM,zN in ipairs(p9)do j3[W(zN)]=zM end end table.sort(zL,function(p_,qa)local j4,j5=j3[p_],j3[qa]
if j4 and j5 then return j4<j5 end if j4 then return true end if j5 then return false end return am(p_)<am(qa)
end)end local j6={}for zO,zP in ipairs(pI)do j6[zP]=zO end local gE,cj={},{}for zQ in pairs(c7)do gE[#gE+1]=zQ end
pcall(function()for zR,zS in ipairs(require(ag.Modules.SquishyRNG).Keys)do cj[zS]=zR end end)table.sort(gE,function(c8,c9)
if cj[c8]and cj[c9]and cj[c8]~=cj[c9]then return cj[c8]<cj[c9]end local j7,j8=al.price[c8],al.price[c9]if j7 and j8 and j7~=j8 then return j7<j8 end
local j9,j_=j6[c8],j6[c9]if j9 and j_ then return j9<j_ end if j9 then return true end if j_ then return false end
return c8<c9 end)ae.rar,ae.pretty,ae.members,ae.rarOrder,ae.n,ae.at=j2,p7,c7,gE,gB,z()return true end local function ka()
if ae.at==0 or(z()-ae.at)>120 then pcall(zK)end return ae.n>0 end local function zT(zU)local qb=W(zU)return ae.rar[qb]or(ab.name and W(ab.name)==qb and ab.rar)or"?"
end local function zV()local gF={}local zW=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for zX,zY in pairs(zW)do if zY then gF[#gF+1]=am(zX)end end
table.sort(gF)return gF end local ar={dir="SAB",cfg="SAB/configs",auto="SAB/autoload_"..K.Name..".txt",autoOld="SAB/autoload.txt",
exec="autoexec/SAB_autoload.lua"}local function qc()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gG(qe)if type(makefolder)~="function"then return end local zZ,z0=pcall(isfolder,qe)if not(zZ and z0)then pcall(makefolder,qe)end
end local function ec(qf)if type(isfile)~="function"or type(readfile)~="function"then return nil end local z1,z2=pcall(isfile,qf)
if not(z1 and z2)then return nil end local z3,z4=pcall(readfile,qf)return z3 and z4 or nil end local function gH(z5,z6)
if type(writefile)~="function"then return false end return(pcall(writefile,z5,z6))end local function qg(z7)local ed={}
if type(listfiles)~="function"then return ed end local z8,qh=pcall(listfiles,z7)if not z8 or type(qh)~="table"then return ed end
for JX,z9 in ipairs(qh)do ed[#ed+1]=tostring(z9)end return ed end local function qi()local gI={}for JY,z_ in ipairs(qg(ar.cfg))do
local qj=z_:match("([^/\\]+)%.txt$")if qj then gI[#gI+1]=qj end end table.sort(gI)return gI end local function Aa()
local ac={"V|1"}ac[#ac+1]="N|Every|"..tostring(e.Every)ac[#ac+1]="N|GlazeLead|"..tostring(e.GlazeLead)ac[#ac+1]="N|FpsCap|"..tostring(e.FpsCap)
ac[#ac+1]="N|MemLimit|"..tostring(e.MemLimit)ac[#ac+1]="N|Best|"..tostring(e.Best or 0)for JZ,qk in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ac[#ac+1]="S|"..qk.."|"..e[qk]end
do local gJ={}for Ab,gK in pairs(e.Pets)do local ql=(gK.b and"b"or"")..(gK.g and"g"or"")..(gK.w and"w"or"")..(tonumber(gK.f)==-1 and"k"or"")
if ql~=""then gJ[#gJ+1]=Ab.."|"..ql end end table.sort(gJ)ac[#ac+1]="P|-"for J0,Ac in ipairs(gJ)do ac[#ac+1]="P|"..Ac end
end for J1,qm in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
ac[#ac+1]="B|"..qm.."|"..(e[qm]and"1"or"0")end local kb=K:GetAttribute("AutoRollRules")if type(kb)=="string"and kb~=""then e.ARrules,e.ARstop=kb,tostring(K:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then ac[#ac+1]="S|rules|"..e.ARrules ac[#ac+1]="S|stop|"..e.ARstop end if c.winPos then ac[#ac+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ac[#ac+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for J2,kc in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gL={}for Ad,Ae in pairs(kc[2])do if Ae then gL[#gL+1]=Ad end end table.sort(gL)ac[#ac+1]=kc[1].."|-"for J3,Af in ipairs(gL)do ac[#ac+1]=kc[1].."|"..Af end
end return table.concat(ac,"\n")end local function Ag(kd)if type(kd)~="string"or kd==""then return false end local qo,qp,qq,qr,ee={},false,{},false,nil
for Ah in kd:gmatch("[^\n]+")do local aH,ai,aB=Ah:match("^(%a)|([^|]*)|?(.*)$")if aH=="N"and ai=="Every"then local ke=tonumber(aB)
if ke and ke>=1 then e.Every=math.floor(ke)end elseif aH=="N"and(ai=="FpsCap"or ai=="MemLimit")then local kf=tonumber(aB)
if kf and kf>=0 then e[ai]=math.floor(kf)end elseif aH=="N"and ai=="Best"then local gM=tonumber(aB)if gM and gM>=0 and gM<=4 then e.Best=math.floor(gM)end
elseif aH=="N"and ai=="GlazeLead"then local gN=tonumber(aB)if gN and gN>=5 and gN<=600 then e.GlazeLead=math.floor(gN)end
elseif aH=="S"and(ai=="TeamNormal"or ai=="TeamFull"or ai=="TeamGlaze"or ai=="TeamWax")then e[ai]=aB elseif aH=="P"and ai~=""then
if not ee then ee={}end if ai~="-"and aB~=""then ee[ai]={b=aB:find("b",1,true)and true or nil,g=aB:find("g",1,true)and true or nil,
w=aB:find("w",1,true)and true or nil,f=aB:find("k",1,true)and-1 or nil}end elseif aH=="B"then if e[ai]~=nil then e[ai]=(aB=="1")end
elseif aH=="S"and ai=="rules"then e.ARrules=aB elseif aH=="S"and ai=="stop"then e.ARstop=aB elseif aH=="W"then
c.winPos={tonumber(ai)or 10,tonumber(aB)or 44}elseif aH=="G"then c.togPos={tonumber(ai)or 10,tonumber(aB)or 300}
elseif aH=="T"and ai~=""then if ai~="-"then qo[ai]=true end qp=true elseif aH=="K"and ai~=""then if ai~="-"then qq[ai]=true end
qr=true end end if qp then e.Targets=qo end if qr then e.CrateTicks=qq end if ee then e.Pets=ee end return true
end local function ef(c_)if not qc()then return false,"this executor cannot write files"end c_=(c_ or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c_==""then return false,"give the config a name"end gG(ar.dir)gG(ar.cfg)if not gH(ar.cfg.."/"..c_..".txt",Aa())then return false,"could not write the file"end
c.config=c_ return true,c_ end local function kg(gO)local qs=ec(ar.cfg.."/"..gO..".txt")if not qs then return false,"no config called "..tostring(gO)end
if not Ag(qs)then return false,"that config looks empty"end c.config=gO return true,gO end local function kh(qt)
gG(ar.dir)gH(ar.auto,qt or"")c.autoload=qt end local function Ai()if c.selfPath then return c.selfPath end local gP
for J4,Aj in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ar.dir})do for J5,qu in ipairs(qg(Aj))do local ki=qu:lower()
if ki:sub(-4)==".lua"and(ki:find("sab_farm",1,true)or ki:find("sab farm",1,true))then gP=gP or qu end end end
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
local function Ak()if not qc()then return false,"this executor cannot write files"end gG("autoexec")if not gH(ar.exec,ar.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gQ=(function()local Al,Am=pcall(function()return game:GetService("TeleportService")end)return Al and Am or nil end)()
local function qv()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local An=queueonteleport or queue_on_teleport return(pcall(An,ar.stub))end local function eg(Ao)if c.rejoining then return end
c.rejoining=true D("REJOIN ("..Ao..")")pcall(gn)if c.autoload then pcall(ef,c.autoload)end local Ap=qv()D(Ap and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for J6=1,30 do if not gQ then break end pcall(function()gQ:Teleport(game.PlaceId,K)end)task.wait(10)
end end)end local function Aq()local Ar,qw=pcall(function()return game:GetService("GuiService")end)if Ar and qw then
pcall(function()V(qw.ErrorMessageChanged:Connect(function()if e.Rejoin then eg("roblox error message")end end))
end)end pcall(function()local qx=game:GetService("CoreGui")local qy=qx and qx:WaitForChild("RobloxPromptGui",15)
local qz=qy and qy:WaitForChild("promptOverlay",15)if qz then V(qz.ChildAdded:Connect(function(As)if e.Rejoin and tostring(As.Name):lower():find("errorprompt",1,true)then eg("disconnect prompt")end
end))end end)if gQ then pcall(function()V(gQ.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()eg("teleport retry")end)end
end))end)end end local function qA(At)local qB=c.plot and c.plot:FindFirstChild(At)if not qB then return nil,false end
for J7,kj in ipairs(qB:GetChildren())do if kj:IsA("Model")or kj:IsA("BasePart")then return kj,true end end return nil,true
end local function ck()local bH=qA("RolledSquishy")if not bH then return nil end return{model=bH,name=bH.Name,pretty=c5(bH,"NameText")or am(W(bH.Name)),
rar=c5(bH,"RarityText")or zT(bH.Name),price=c5(bH,"PriceText")}end local function qC(kk)return type(kk)=="string"and(ae.rar[W(kk)]~=nil or yV(kk))
end local function ad()local kl=qA("SquishyEquipped")if kl then c.carrySrc,j.heldAt="model",z()return kl.Name,kl end
local qD=K.Character if qD then for J8,eh in ipairs(qD:GetDescendants())do if(eh:IsA("Model")or eh:IsA("Tool"))and qC(eh.Name)then
c.carrySrc,j.heldAt="character",z()return eh.Name,eh end end end local gR=K:GetAttribute("SquishyEquipped")if type(gR)=="string"and gR~=""and qC(gR)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gR,nil end c.carrySrc=nil end local function J9()local J_,Au=ad()return Au end local function cl()
local ei=ck()local gS=ei and yX(ei.price)local gT=bk()if gS and gT and gT<gS then return gT,gS end if ei and type(ei.price)=="string"and ei.price:find("%d")and not gS then return gT or 0,math.huge end
end local function cm(Av)d0[#d0+1]=os.date("%H:%M:%S").." "..Av if#d0>40 then table.remove(d0,1)end end local function Aw(cn,gU)
if type(cn)~="string"then return end cm(("Roll(%s,%s)"):format(cn,tostring(gU)))if cn:lower():find("crate",1,true)then
j.rolled,j.rolledAt=cn,z()return end ab.seq=ab.seq+1 ab.name,ab.at=cn,z()ab.rar=type(gU)=="string"and gU or nil
c.rolls=c.rolls+1 if aP(cn)then D(("ROLL %s [%s] = TARGET"):format(cn,tostring(gU)))end end local function Ax(co)
if type(co)~="table"then return end local gV=co.butter or co.itemName if type(gV)~="string"then return end c.gifts=c.gifts+1
ab.gift,ab.giftAt=gV,z()if type(co.giftId)=="string"then local qE=ag:FindFirstChild("Remotes")local qF=qE and qE:FindFirstChild("GiftThanks")
if qF then pcall(function()qF:FireServer(co.giftId)end)end end cm("Gift("..gV.." from "..tostring(co.fromName)..")")
D(("GIFT from %s: %s - it will not be waxed"):format(tostring(co.fromName),gV))end local function Ay()local qG=ag:WaitForChild("Remotes",30)
if not c.alive then return end if not qG then D("Remotes folder missing - no roll events")return end V(K:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
local qH=K:GetAttribute("SquishyEquipped")if type(qH)=="string"and qH~=""then j.heldAt=z()end end))local AE={
SquishyRollAnimation=Aw,InitSquishy=function(qI)ab.init,ab.initAt=tostring(qI),z()cm("Init("..tostring(qI)..")")end,
CrateUpdate=function(da,qJ)pcall(zt,da)pcall(M.learn,da)if type(da)=="table"then local Az=qJ==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not Az then return end local AA=not j.waiting local AB=j.on j.waiting,j.data,j.at=true,da,z()j.on=(qJ==true)
j.title=tostring(da.title or da.name or"crate")if j.on and not AB then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cm("CrateWindow open("..j.title..")")elseif AA then cm("Crate waiting("..j.title..")")D(j.title.." is waiting on your stand")
end else if j.waiting then cm("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local AC=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,AC)end if j.classify then local AD=z()
task.spawn(function()pcall(j.classify,AD)end)end end end,GiftReceived=Ax,}for gW,AF in pairs(AE)do local km=qG:FindFirstChild(gW)
if km and km:IsA("RemoteEvent")then V(km.OnClientEvent:Connect(AF))elseif gW~="CrateUpdate"and gW~="GiftReceived"then D("remote "..gW.." missing")end
end end local function kn()local cp=ck()if cp then if aP(cp.name)then return{state="match",shown=cp.pretty,src="pad",info=cp}
end return{state="skip",info=cp,level="idle",text=("on pad: %s [%s] - not ticked"):format(cp.pretty,tostring(cp.rar))}
end if ab.name and(z()-ab.at)<4 then if aP(ab.name)then return{state="match",shown=am(W(ab.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(am(W(ab.name)),tostring(ab.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gX(AG,AH,AI,AJ)
local gY=RaycastParams.new()gY.FilterType=Enum.RaycastFilterType.Exclude local ko={K.Character}for Ka,AK in ipairs(AJ or{})do ko[#ko+1]=AK end
gY.FilterDescendantsInstances=ko pcall(function()gY.RespectCanCollide=true end)local qK=ak:Raycast(Vector3 .new(AG,AH+4,AI),Vector3 .new(0,-30,0),gY)
return qK and qK.Position or nil end local function db(qL)local qM=qL:FindFirstChildOfClass("Humanoid")return((qM and qM.HipHeight)or 2)+qL.HumanoidRootPart.Size.Y/2+0.2
end local function kp(AL,AM)local kq=AL:FindFirstChildOfClass("Humanoid")local AN=z()while z()-AN<AM do if kq and(kq.FloorMaterial~=Enum.Material.Air or kq.SeatPart)then return true end
ah(0.05)end return false end local function aE(AO,kr,ks)local qN=AO.HumanoidRootPart qN.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qN.CFrame=ks and CFrame.new(kr,Vector3 .new(ks.X,kr.Y,ks.Z))or CFrame.new(kr)end local function cq(bo,qO)local cr=aq()
if not cr or not bo then return false end local bI=bo.Position local gZ=math.clamp(math.max(bo.Size.X,bo.Size.Z)/2+2.2,3,7)
local qP=(qO and qO.MaxActivationDistance)or 10 if gZ>qP-2 then gZ=math.max(2.5,qP-2)end local ej={}local function cs(ek)
ek=Vector3 .new(ek.X,0,ek.Z)if ek.Magnitude>0.05 then ej[#ej+1]=ek.Unit end end local qQ=pv()if qQ then cs(qQ-bI)end
cs(bo.CFrame.LookVector)cs(-bo.CFrame.LookVector)cs(bo.CFrame.RightVector)cs(-bo.CFrame.RightVector)cs(cr.HumanoidRootPart.Position-bI)
if#ej==0 then cs(Vector3 .new(0,0,1))end local AP,g0=db(cr),false for Kb,AQ in ipairs(ej)do local g1=bI+AQ*gZ
local kt=gX(g1 .X,bI.Y,g1 .Z,{bo})if kt and math.abs(kt.Y-bI.Y)<14 then aE(cr,Vector3 .new(g1 .X,kt.Y+AP,g1 .Z),bI)
if kp(cr,0.7)then g0=true break end end end if not g0 then aE(cr,bI+ej[1]*gZ+Vector3 .new(0,3,0),bI)g0=kp(cr,1)
end ah(0.12)return g0 end local function qR(el)if not el.Parent or not el.Enabled then return false end pcall(function()el:InputHoldBegin()end)
ah(math.max(el.HoldDuration,0)+0.08)pcall(function()el:InputHoldEnd()end)return true end local function ao(qS,AS)
local AT=z()while z()-AT<AS do if qS()then return true end ah(0.05)end return qS()end local function em(dc,AU,qT,AV)
local AW=c.zapFirst and{"zap","hold"}or{"hold","zap"}for AX,ku in ipairs(AW)do if AX==2 and(AV or not(dc.Parent and dc.Enabled and(not qT or qT())))then break end
local kv if ku=="hold"then kv=qR(dc)else kv=type(fireproximityprompt)=="function"and dc.Parent~=nil and dc.Enabled and pcall(fireproximityprompt,dc)end
if kv and ao(AU,1.2)then c.zapFirst=(ku=="zap")return true,ku end end return false end local function qU(kw)local bJ=pG()
if not bJ or not bJ.Enabled then D("buy: nothing on the pad")return false end do local qV,qW=cl()if qV then c.cashFails=(c.cashFails or 0)+1
c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("not buying: have $%s, price %s"):format(av(qV),qW==math.huge and"unreadable"or("$"..av(qW))))
return false end end local kx=d4(bJ)if not kx then D("buy: pad part missing")return false end c.lastBuyAt=z()
local AY,qX=ab.seq,bk()local qY=aq()local AZ=qY and(qY.HumanoidRootPart.Position-kx.Position).Magnitude>12 cq(kx,bJ)
if AZ then ah(0.4)end if not bJ.Enabled then D("buy aborted: pad emptied")return false end local dd=kn()if not kw and dd.state~="match"then
D("buy aborted: "..(dd.text or"pad changed"))c.matchSince=nil return false end local ky=dd.info and dd.info.name or(dd.state=="match"and ab.name)or nil
local function A0()return bJ.Enabled and ad()==nil and(kw or kn().state=="match")end local A1,A2=em(bJ,function()
return ad()~=nil or((not bJ.Enabled)and(kw or ab.seq==AY))end,A0,cl()~=nil)if A1 then ao(function()return ad()~=nil end,0.8)
local en=ad()local qZ=bk()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0 c.matchSince=nil ab.name,ab.rar,ab.at=nil,nil,z()
D(("BOUGHT %s%s via %s"):format(en and am(W(en))or(dd.shown or"?"),(qX and qZ)and(" for $"..av(qX-qZ))or"",A2))
if en and ky and W(en)~=W(ky)then D(("note: picked up %s, not %s"):format(en,ky))end return true end local g2=ck()
if cl()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)D(("BUY REFUSED: cash short - have $%s, price %s"):format(av(bk()),(g2 and g2 .price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)D(("buy did not go through (%s, try %d) - again in %ds"):format(g2 and g2 .price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function q0()local eo=ad()if not eo then c.holding=false D("place: hands are empty")
return false end if not aP(eo)then D(("REFUSED TO WAX %s - it is not ticked"):format(am(W(eo))))return false end
for Kc=1,e.PlaceTries do local bK=y7()if not bK then D("place: no free station")break end local q1=d4(bK)if q1 then
cq(q1,bK)local q2=ad()if not q2 then c.holding=false D("place: hands emptied on the way")return false end if not aP(q2)then D("place: what I carry changed, not waxing it")return false end
if bK.Enabled then local A3,A4=em(bK,function()return not bK.Enabled end,function()return bK.Enabled end)if A3 then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 ab.name,ab.rar,ab.at=nil,nil,z()
D(("WAXED %s #%d at %s via %s"):format(am(W(eo)),c.placed,bK.Parent.Parent.Name,A4))if q.placed then pcall(q.placed,eo)end
return true end end end ah(0.25)end c.placeFails=c.placeFails+1 if ad()==nil then c.holding=false end D("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ad()))D(c.capMsg)end return false end function A.place()local A5=z()while c.alive and A.editing and z()-A5<25 do ah(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local A6=z()while c.alive and A.current()~=e.TeamWax and z()-A6<5 do ah(0.1)end
if A.current()==e.TeamWax then ah(0.3)else D("wax team did not come on in time - placing anyway")end end local A7,q3=pcall(q0)
A.placing=false if not A7 then error(q3,0)end return q3 end local function q4(q5)return type(q5)=="string"and q5:lower():find("crate",1,true)~=nil
end local A8={SABFarmGui=1,SABToggle=1,SABError=1}local function kz(A9)local bL=A9 while bL do if A8[bL.Name]then return false end
if bL:IsA("ScreenGui")then local A_,Ba=pcall(function()return bL.Enabled end)return(not A_)or Ba~=false end if bL:IsA("GuiObject")and not bL.Visible then return false end
bL=bL.Parent end return false end local function g3(g4)local de=""pcall(function()if g4:IsA("TextButton")then de=g4 .Text end end)
if not de:find("%a")then for Kd,g5 in ipairs(g4:GetDescendants())do if(g5:IsA("TextLabel")or g5:IsA("TextButton"))and g5 .Text:find("%a")then de=g5 .Text break end
end end if not de:find("%a")then de=g4 .Name end return(de:lower():gsub("[^%a]",""))end local function Bb()local ep,eq
local q6=K:FindFirstChildOfClass("PlayerGui")if not q6 then return nil,nil end for Ke,er in ipairs(q6:GetDescendants())do
if er:IsA("GuiButton")and kz(er)then local kA=g3(er)if kA:sub(1,4)=="open"and not kA:find("shop",1,true)then ep=ep or er end
if kA:sub(1,7)=="discard"then eq=eq or er end end end if ep and eq then return ep,eq end if j.on then return ep,eq end
return nil,nil end local kB=(function()local Bc,Bd=pcall(function()return game:GetService("VirtualInputManager")end)return Bc and Bd or nil end)()
local function q7(bp,kC)local kD={}local function q8(Be)kD[#kD+1]=Be end if c.tapWay then q8(c.tapWay)end for Kf,q9 in ipairs({"touch","conn","signal"})do
if q9~=c.tapWay then q8(q9)end end local function q_(Bf,...)local Bg,kE=pcall(getconnections,Bf)if not(Bg and type(kE)=="table"and#kE>0)then return false end
local ra,Bh,Bi=false,{...},select("#",...)for Kg,Bj in ipairs(kE)do if pcall(function()Bj:Fire(table.unpack(Bh,1,Bi))end)then ra=true end
end return ra end local function rb()local rc=Vector3 .new(0,0,0)pcall(function()local rd,rf=bp.AbsolutePosition,bp.AbsoluteSize
rc=Vector3 .new(rd.X+rf.X/2,rd.Y+rf.Y/2,0)end)local kF={Position=rc,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kF.UserInputType=Enum.UserInputType.Touch end)pcall(function()kF.UserInputState=Enum.UserInputState.End end)
return kF end for Kh,bq in ipairs(kD)do local es=false if bq=="conn"and type(getconnections)=="function"then if q_(bp.MouseButton1Click)then
es=true if ao(kC,1.5)then c.tapWay=bq return true,bq end end es=q_(bp.Activated,rb(),1)elseif bq=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bp.MouseButton1Click)then if ao(kC,1.5)then c.tapWay=bq return true,bq end end es=pcall(firesignal,bp.Activated,rb(),1)
elseif bq=="touch"and kB then es=pcall(function()local rg,rh=bp.AbsolutePosition,bp.AbsoluteSize local ri=0 local rj=bp:FindFirstAncestorWhichIsA("ScreenGui")
local Bk,Bl=pcall(function()return rj and rj.IgnoreGuiInset end)if not(Bk and Bl)then pcall(function()ri=game:GetService("GuiService"):GetGuiInset().Y end)
end local rk,rl=rg.X+rh.X/2,rg.Y+rh.Y/2+ri kB:SendMouseButtonEvent(rk,rl,0,true,game,1)task.wait(0.06)kB:SendMouseButtonEvent(rk,rl,0,false,game,1)
end)end if es and ao(kC,1.5)then c.tapWay=bq return true,bq end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kG(rm)local et=rm.Parent while et and et~=c.plot do if j.NOT[et.Name]then return false end et=et.Parent
end local kH=(rm.ActionText or""):lower()if kH:find("roll",1,true)or kH:find("place",1,true)or kH:find("sell",1,true)then return false end
return true end local function rn()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local ro=c.plot:FindFirstChild("CrateStand")local eu if ro then for Ki,g6 in ipairs(ro:GetDescendants())do
if g6:IsA("ProximityPrompt")and g6 .Enabled and kG(g6)then eu=g6 break end end end if not eu then for Kj,bM in ipairs(c.plot:GetDescendants())do
if bM:IsA("ProximityPrompt")and bM.Enabled and kG(bM)then local rp=bM:FindFirstAncestorWhichIsA("Model")local Bm=((bM.ActionText or"").." "..(bM.ObjectText or"").." "..bM.Name.." "..(rp and rp.Name or"")):lower()
if Bm:find("crate",1,true)then eu=bM break end end end end j.prompt=eu return eu end local function kI()if j.on then return true end
local ev=rn()if not ev then j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local rq=d4(ev)if rq then cq(rq,ev)end j.ours=true em(ev,function()return j.on end)if ao(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()D("crate: pressed "..gi(ev).." but no window came up")
return false end do local function Bn(rr)local df=rr.Parent while df and df:IsA("GuiObject")do local rs,rt=false,false
for Kk,ew in ipairs(df:GetDescendants())do if ew~=rr and ew:IsA("GuiButton")and g3(ew):sub(1,7)=="discard"then rs=true end
if ew:IsA("TextLabel")then local kJ=ew.Text:lower()if kJ:find("crate",1,true)or kJ:find("can contain",1,true)or kJ:find("cost",1,true)then rt=true end
end if rs and rt then return df end end df=df.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local ru=K:FindFirstChildOfClass("PlayerGui")if not ru then return nil end for Kl,g7 in ipairs(ru:GetDescendants())do
if g7:IsA("GuiButton")and not g7:FindFirstAncestor("SABFarmGui")and g3(g7):sub(1,4)=="open"then local kK=Bn(g7)
if kK then j.win=kK return kK end end end end local function Bo(Bp)for Km,g8 in ipairs(Bp:GetDescendants())do
if g8:IsA("GuiButton")then local rv,kL=g3(g8),g8 .Name:lower()if rv=="x"or rv=="close"or kL=="x"or kL:find("close",1,true)or kL:find("exit",1,true)then return g8 end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(Bq)task.wait(Bq and 4 or 1.2)if j.on or j.waiting then return end
local g9=j.findWin()if not g9 or not kz(g9)then return end local rw=Bo(g9)if rw and q7(rw,function()return not kz(g9)end)then return end
D("the crate window is still open - tap its X")end end local function ex(g_)if not kI()then return false end local rx=z()-(j.openedAt or 0)
if rx<0.6 then ah(0.6-rx)end local kM=j.title local Br,Bs=Bb()local ry=g_ and Br or Bs if not ry then j.lastFail=z()
c.crateFails=c.crateFails+1 D(("crate: no %s button found in %s"):format(g_ and"Open"or"Discard",kM))return false
end local Bt=ad()local Bu,Kn=q7(ry,function()return(not j.on)or(ad()~=nil and ad()~=Bt)end)if not Bu then j.lastFail=z()
c.crateFails=c.crateFails+1 D("crate: could not press "..(g_ and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if g_ then c.crates=c.crates+1 ao(function()return ad()~=nil end,1.5)local rz=ad()
D(("OPENED %s -> %s"):format(kM,rz and am(W(rz))or"?"))else D("discarded "..kM.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(Bv,...)local Bw=select("#",...)j.calls[#j.calls+1]={t=z(),m=Bv,n=Bw,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aI,br)local bN=type(aI)if(bN=="string"or bN=="number")and type(br.data)=="table"then for rA,kN in pairs(br.data)do
if kN==aI and type(rA)=="string"and(type(kN)=="string"or type(kN)=="number")then return{__slot="f:"..rA}end end
end if bN=="string"then if br.crate and aI==br.crate then return{__slot="crate"}end if br.title and aI==br.title then return{__slot="title"}end
if br.rar and aI==br.rar then return{__slot="rarity"}end return aI end if bN=="number"or bN=="boolean"or bN=="nil"then return aI end
if bN=="table"then local rB={}for Bx,rC in pairs(aI)do if type(rC)=="table"then return nil,"nested table"end local By,rD=j.slot(rC,br)
if rD then return nil,rD end rB[Bx]=By end return rB end local Bz,BA=pcall(function()return aI:IsA("Instance")end)
if Bz and BA then if aI==K then return{__slot="player"}end if c.plot and aI==c.plot then return{__slot="plot"}end
local ha=c.plot and c.plot:FindFirstChild("CrateStand")if ha and aI==ha then return{__slot="stand"}end if ha and aI.Parent==ha then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bN..")"end function j.resolve(hb)if type(hb)~="table"then return hb end
local aX=hb.__slot if aX and aX:sub(1,2)=="f:"then return j.data and j.data[aX:sub(3)]end if aX=="crate"then return j.data and j.data.name end
if aX=="title"then return(j.data and j.data.title)or j.title end if aX=="rarity"then return j.data and j.data.rarity end
if aX=="player"then return K end if aX=="plot"then return c.plot end if aX=="stand"or aX=="model"then local kO=c.plot and c.plot:FindFirstChild("CrateStand")
if aX=="stand"or not kO then return kO end for Ko,rE in ipairs(kO:GetChildren())do if q4(rE.Name)then return rE end end
return nil end local rF={}for BB,BC in pairs(hb)do rF[BB]=j.resolve(BC)end return rF end function j.classify(kP)
if j.directOff then return end local hc={}for Kp,kQ in ipairs(j.calls)do if kQ.t<=kP+0.05 and kP-kQ.t<=6 then hc[#hc+1]=kQ end
end if#hc==0 then return end if not ao(function()return(j.heldAt or 0)>=kP-1 end,2.5)then return end local ey={}
for Kq,ez in ipairs(hc)do local rG={}for rH=1,ez.n do local BD,rI=j.slot(ez.args[rH],ez)if rI then D("crate call has "..rI.." - keeping the button method")
return end rG[rH]=BD end ey[#ey+1]={m=ez.m,n=ez.n,args=rG}end local kR=j.learned j.learned={seq=ey,mode=kR and kR.mode or nil}
al.dirty=true if not kR then D(("learned how to open crates directly (%d call%s)"):format(#ey,#ey==1 and""or"s"))end
end function j.replay()local rJ=j.learned local rK=ag:FindFirstChild("Remotes")local kS=rK and rK:FindFirstChild("CrateAction")
if not(rJ and kS)then return false end local rL=table.unpack or unpack j.replaying=true for Kr,eA in ipairs(rJ.seq)do
local kT={}for rM=1,eA.n do kT[rM]=j.resolve(eA.args[rM])end task.spawn(function()pcall(function()if eA.m=="InvokeServer"then kS:InvokeServer(rL(kT,1,eA.n))
else kS:FireServer(rL(kT,1,eA.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(BE)return(BE:gsub("[%%|;=,\n]",function(BF)return("%%%02X"):format(BF:byte())end))end
function j.enc(ct)local hd=type(ct)if hd=="string"then return"s"..j.esc(ct)end if hd=="number"then return"n"..tostring(ct)end
if hd=="boolean"then return ct and"b1"or"b0"end if hd=="nil"then return"z"end if ct.__slot then return"k"..ct.__slot end
local kU={}for BG,BH in pairs(ct)do kU[#kU+1]=j.enc(BG).."="..j.enc(BH)end return"t"..table.concat(kU,",")end
function j.dec(rN)local eB,eC=rN:sub(1,1),rN:sub(2)local function BI(BJ)return(BJ:gsub("%%(%x%x)",function(BK)return string.char(tonumber(BK,16))end))end
if eB=="s"then return BI(eC)end if eB=="n"then return tonumber(eC)end if eB=="b"then return eC=="1"end if eB=="k"then return{__slot=eC}end
if eB=="t"then local rO={}for BL in eC:gmatch("[^,]+")do local rP,BM=BL:match("^(.-)=(.*)$")if rP then local rQ=j.dec(rP)
if rQ~=nil then rO[rQ]=j.dec(BM)end end end return rO end return nil end function j.goneOrNew(BN)return function()
if not j.waiting then return true end local rR=ad()return rR~=nil and rR~=BN end end function j.near()local rS=ag:FindFirstChild("Remotes")
local kV=rS and rS:FindFirstChild("CrateAction")local he=aq()local kW=c.plot and c.plot:FindFirstChild("CrateStand")
local kX=kW and kW:FindFirstChild("Spot")if not(kV and he and kX)then D(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kV and"no CrateAction remote"or not he and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kY=he.HumanoidRootPart local hf=kY.CFrame local rT,kZ=j.title,"no answer"local BO=ad()local rU=kW:FindFirstChild("Holder")
local function rV()if not rU then return j.waiting or j.on end for Ks,BP in ipairs(rU:GetChildren())do if BP:IsA("Model")then return true end end
return false end for BQ=1,3 do if not(j.waiting or j.on)or not rV()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kY.Position-kX.Position).Magnitude>8 then cq(kX,j.prompt)end ah(0.12+0.15*BQ)
local a9={}j.replaying=true task.spawn(function()a9 .ok,a9 .v=pcall(function()return kV:InvokeServer("open")end)
a9 .done=true end)ao(function()return a9 .done end,6)j.replaying=false local cu=a9 .v if a9 .done and a9 .ok and type(cu)=="table"and cu.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 D(("OPENED %s -> %s (no window)"):format(rT,cu.prize and am(W(tostring(cu.prize)))or"?"))
ao(function()local rW=ad()return rW~=nil and rW~=BO end,1.5)if(kY.Position-hf.Position).Magnitude>8 then pcall(function()aE(he,hf.Position,hf.Position+hf.LookVector)end)end
return true,"opened"end kZ=(a9 .done and a9 .ok and type(cu)=="table")and tostring(cu.reason or"refused, no reason given")
or(a9 .done and("error: "..tostring(cu))or"no answer in 6s")ah(0.3)if not rV()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 D(("crate: the server would not open %s next to the stand (%s)"):format(rT,kZ))
return false,kZ end j.GIVEUP=600 function j.drop()local rX=ag:FindFirstChild("Remotes")local rY=rX and rX:FindFirstChild("CrateAction")
local rZ=c.plot and c.plot:FindFirstChild("CrateStand")local k0=rZ and rZ:FindFirstChild("Spot")local r0=aq()
if k0 and r0 and(r0 .HumanoidRootPart.Position-k0 .Position).Magnitude>8 then cq(k0,j.prompt)ah(0.3)end local k1,bs=false,nil
if rY then k1,bs=pcall(function()return rY:InvokeServer("discard")end)end D(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(k1 and type(bs)=="table"and bs.ok)and"done"or("answer: "..tostring(type(bs)=="table"and(bs.reason or bs.ok)or bs))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(k1 and type(bs)=="table"and bs.ok)then ex(false)end end function j.smart()local k2=j.title if(j.nearFails or 0)<3 then
local BR=j.near()if BR then return true end if j.nearFails>=3 then D("opening next to the stand failed 3 times - trying the older ways")end
end local cv=j.learned if cv then local k3=ad()if j.on then j.replay()if ao(j.goneOrNew(k3),3.5)then c.crates=c.crates+1
D("OPENED "..k2 .." (direct)")return true end else if cv.mode~="window"then j.replay()if ao(j.goneOrNew(k3),3.5)then
c.crates,j.fails=c.crates+1,0 if cv.mode~="direct"then cv.mode,al.dirty="direct",true D("crates now open directly - the window never comes up")
end D("OPENED "..k2 .." (direct, no window)")return true end end if kI()then j.replay()if ao(j.goneOrNew(k3),3.5)then
c.crates,j.fails=c.crates+1,0 if cv.mode~="window"then cv.mode,al.dirty="window",true D("crates need their window up first - it shows briefly")
end D("OPENED "..k2 .." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,al.dirty=cv,nil,true
if j.fails>=3 then j.directOff=true D("direct crate opening failed 3 times - using the button for now")else D("the learned crate call did not work - back to pressing Open")
end end return ex(true)end function E.snap()return{rules=K:GetAttribute("AutoRollRules"),stop=K:GetAttribute("AutoRollStop"),
on=K:GetAttribute("AutoRollOn"),main=K:GetAttribute("AutoRoll")}end E.cache={}function E.watchCache()E.cache=E.snap()
for BS,r1 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(K:GetAttributeChangedSignal(r1):Connect(function()E.cache[BS]=K:GetAttribute(r1)end))
end end function E.isOn()return K:GetAttribute("AutoRollOn")==true end function E.saw(BT,...)local hg=E.cache
local BU={m=BT,n=select("#",...),args={...},before={rules=hg.rules,stop=hg.stop,on=hg.on,main=hg.main}}task.delay(1.5,function()
if c.alive then pcall(E.learnOne,BU)end end)end function E.learnOne(eD)local aC,eE=E.snap(),eD.before local hh=(aC.rules~=eE.rules)or(aC.stop~=eE.stop)
local r2=(aC.on~=eE.on)or(aC.main~=eE.main)if not hh and not r2 then return end local r3={}for r4=1,eD.n do local aQ=eD.args[r4]
local cw=type(aQ)if cw=="string"and aQ~=""and aQ==aC.rules then aQ={__slot="rules"}elseif cw=="string"and aQ~=""and hh and aQ==aC.stop and aC.stop~=eE.stop then aQ={__slot="stop"}
elseif cw=="table"then local r5={}for BV,dg in pairs(aQ)do if type(dg)=="table"or(type(dg)=="userdata")then E.msg="Auto Roll sends something I cannot repeat"return
end r5[BV]=(type(dg)=="string"and dg~=""and dg==aC.rules)and{__slot="rules"}or dg end aQ=r5 elseif cw~="string"and cw~="number"and cw~="boolean"and cw~="nil"then
if aQ==K then aQ={__slot="player"}else E.msg="Auto Roll sends something I cannot repeat"return end end r3[r4]=aQ
end local dh={m=eD.m,n=eD.n,args=r3}if hh then local k4=false for BW=1,dh.n do local eF=dh.args[BW]if type(eF)=="table"and eF.__slot=="rules"then k4=true end
if type(eF)=="table"and not eF.__slot then for Kt,r6 in pairs(eF)do if type(r6)=="table"and r6 .__slot=="rules"then k4=true end end
end end if k4 then E.rec.rules={dh}else table.insert(E.rec.rules,dh)if#E.rec.rules>60 then table.remove(E.rec.rules,1)end
end end if r2 then if aC.on==true then E.rec.on=dh else E.rec.off=dh end e.AutoRoll=(aC.on==true)end if aC.rules and aC.rules~=""then e.ARrules,e.ARstop=aC.rules,aC.stop or""end
al.dirty=true E.msg=""D(("learned an Auto Roll %s message"):format(hh and"choices"or(aC.on and"on"or"off")))end
function E.resolve(di)if type(di)~="table"then return di end if di.__slot=="rules"then return e.ARrules~=""and e.ARrules or K:GetAttribute("AutoRollRules")end
if di.__slot=="stop"then return e.ARstop~=""and e.ARstop or K:GetAttribute("AutoRollStop")end if di.__slot=="player"then return K end
local r7={}for BX,BY in pairs(di)do r7[BX]=E.resolve(BY)end return r7 end function E.replay(r8,BZ)local r9=table.unpack or unpack
for Ku,eG in ipairs(BZ)do local k5={}for r_=1,eG.n do k5[r_]=E.resolve(eG.args[r_])end E.replaying=true pcall(function()
if eG.m=="InvokeServer"then task.spawn(function()pcall(function()r8:InvokeServer(r9(k5,1,eG.n))end)end)else r8:FireServer(r9(k5,1,eG.n))end
end)E.replaying=false task.wait(0.25)end end function E.apply(sa,B0)if E.busy or not c.alive then return end E.busy=true
pcall(function()local sb=ag:FindFirstChild("Remotes")local k6=sb and sb:FindFirstChild("AutoRollAction")if not k6 then E.msg="this game has no AutoRollAction"return end
local bO=e.AutoRoll if bO and e.ARrules~=""and K:GetAttribute("AutoRollRules")~=e.ARrules then if#E.rec.rules==0 then
E.msg="pick your Auto Roll choices once in the game's menu so I can learn them"D(E.msg)else E.replay(k6,E.rec.rules)
if ao(function()return K:GetAttribute("AutoRollRules")==e.ARrules end,4)then D("Auto Roll choices put back")else
E.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"D(E.msg)end end end if bO==E.isOn()or(not bO and not B0)then return end
local hi=bO and E.rec.on or E.rec.off if not hi then local eH=bO and E.rec.off or E.rec.on local sc=eH~=nil for B1=1,eH and eH.n or 0 do
if type(eH.args[B1])=="boolean"then sc=false end end if sc then hi=eH end end if not hi then E.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bO and"on"or"off")
D(E.msg)return end E.replay(k6,{hi})if ao(function()return E.isOn()==bO end,4)then E.msg=""D(("Auto Roll switched %s%s"):format(bO and"ON"or"OFF",sa and(" ("..sa..")")or""))
else E.msg="Auto Roll did not switch - do it once in the game so I can relearn it"D(E.msg)end end)E.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local B2,B3=pcall(function()return K.UserId end)return B2 and B3 or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local B4,k7=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if B4 and type(k7)=="table"and type(k7 .Pets)=="table"then o.I=k7 end return o.I end function o.order()if o.list then return o.list end
local bP=o.info()if not bP then return{}end local cx={}if type(bP.Order)=="table"and#bP.Order>0 then for Kv,sd in ipairs(bP.Order)do if bP.Pets[sd]then cx[#cx+1]=sd end end
else for B5 in pairs(bP.Pets)do cx[#cx+1]=B5 end table.sort(cx,function(B6,B7)return(bP.Pets[B6].price or 0)<(bP.Pets[B7].price or 0)end)
end o.list=cx return cx end function o.nice(se,k8)local sf=o.info()local sh=sf and sf.Pets[se]return((k8 and k8~="")and(k8 .." ")or"")..(sh and sh.displayName or tostring(se))
end function o.data()local hj=K:GetAttribute("PetsData")if type(hj)~="string"then return nil end if hj==o.rawD then return o.lastD end
local B8,eI=pcall(function()return o.HS:JSONDecode(hj)end)eI=(B8 and type(eI)=="table")and eI or nil o.rawD,o.lastD=hj,eI
return eI end function o.pen()return ag:FindFirstChild("PetMeadowSpawns")end function o.srv()return ak:GetServerTimeNow()end
function o.money()local k9=K:FindFirstChild("MoneyValue")if k9 and type(k9 .Value)=="number"then return k9 .Value end
return bk()or 0 end function o.wishes()local sj=o.pen()local sk=sj and sj:GetAttribute("Wishes")local k_,sl={},o.srv()
if type(sk)~="string"then return k_ end local B9,sm=pcall(function()return o.HS:JSONDecode(sk)end)if B9 and type(sm)=="table"then
for B_,la in pairs(sm)do if type(la)=="number"and la>sl then k_[B_]=la-sl end end end return k_ end function o.call(...)
local sn=ag:FindFirstChild("Remotes")local so=sn and sn:FindFirstChild("PetRequest")if not so then return nil end
local sp=table.pack(...)local cy={}task.spawn(function()cy.ok,cy.v=pcall(function()return so:InvokeServer(table.unpack(sp,1,sp.n))end)
cy.done=true end)local Ca=z()while not cy.done and z()-Ca<6 do task.wait(0.05)end if cy.done and cy.ok then return cy.v end
return nil end function o.want(Cb)return e.Pets[Cb]end function o.closeNaming(lb)local sr=pcall(function()local sq=K:FindFirstChild("PlayerScripts")
local Cc=sq and sq:FindFirstChild("Naming",true)require(Cc).close()end)ah(0.5)if lb.Visible then pcall(function()local ss=lb:FindFirstChild("NameBox",true)if ss then ss:ReleaseFocus()end end)
lb.Visible=false sr=false end return sr end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local su=K:FindFirstChildOfClass("PlayerGui")
local sv=su and su:FindFirstChild("MainGui")local hk=sv and sv:FindFirstChild("PetNameGui")if hk and hk.Visible then
ah(0.4)if hk.Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,hk)break end end ah(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local lc,sx,hl=o.info(),o.pen(),o.data()
if not(lc and sx and hl)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local eJ,ld=#(hl.pets or{}),tonumber(hl.maxOwned)or 60
local Cd,sy,eK=o.srv(),{},nil for Kw,aY in ipairs(sx:GetChildren())do sy[aY.Name]=true local cz,hm=aY:GetAttribute("Pet"),aY:GetAttribute("Variant")or""
local le=cz and o.want(cz)if le and le.b and lc.Pets[cz]and(not le.g or hm=="Big")and y.wantMore(cz,hm,hl)and not aY:GetAttribute("A_"..o.uid)
and(tonumber(aY:GetAttribute("ExpiresAt"))or 0)>Cd+1 and z()>=(o.tryAt[aY.Name]or 0)then local eL,sz=o.nice(cz,hm),lc.Pets[cz].price or 0
if eJ>=ld then eK=("%s is in the pen, but you have %d/%d pets"):format(eL,eJ,ld)o.tryAt[aY.Name]=z()+15 elseif o.money()<sz then
eK=("%s is in the pen - need $%s"):format(eL,av(sz))o.tryAt[aY.Name]=z()+5 else o.tryAt[aY.Name]=z()+8 local bQ=o.call("adopt",aY.Name)
if type(bQ)=="table"and bQ.ok then eJ=eJ+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local Ce=type(bQ.pet)=="table"and bQ.pet or{}
table.insert(o.recent,{id=tostring(Ce.id or("?"..z())),name=cz,variant=hm,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
D("ADOPTED "..eL)o.skipNaming()eK="adopted "..eL else local sA=type(bQ)=="table"and tostring(bQ.reason or"no reason given")or"no answer"
D(("adopt %s failed: %s"):format(eL,sA))eK="adopt failed: "..sA if type(bQ)=="table"and bQ.bagFull then o.tryAt[aY.Name]=z()+60 end
end end end end for sB in pairs(o.tryAt)do if not sy[sB]then o.tryAt[sB]=nil end end o.buyMsg=eK or("watching the pen (%d/%d pets)"):format(eJ,ld)
end function o.stacks()local sC=o.pen()local Cf=sC and sC:GetAttribute("WishStacks")local Cg,sD=pcall(function()return o.HS:JSONDecode(Cf)end)
return(Cg and type(sD)=="table")and sD or{}end function o.stackTick(Ch,Ci)local hn=o.info()local sE=(type(hn.Wish)=="table"and tonumber(hn.Wish.maxStacks))or 1
if sE<=1 then return end local Cj=o.stacks()o.stackTry=o.stackTry or{}for Kx,aZ in ipairs(o.order())do local sF=o.want(aZ)
local ho=tonumber(Cj[aZ])or 1 if sF and sF.w and Ch[aZ]and ho<sE and y.wantMore(aZ,"",Ci)and z()>=(o.stackTry[aZ]or 0)then
local Ck,hp=pcall(hn.wishPrice,aZ,ho+1)hp=Ck and tonumber(hp)or((hn.Pets[aZ].price or 0)*2*3^ho)o.stackTry[aZ]=z()+5
if hp<=o.money()*0.01 then local sG=o.call("wish",aZ)if type(sG)=="table"and sG.ok then o.wishN=o.wishN+1 D(("WISH x%d on %s ($%s)"):format(ho+1,o.nice(aZ),av(hp)))
else o.stackTry[aZ]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local hq=o.info()if not(hq and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bR,lf,bS=o.wishes(),0,nil local Cl=(type(hq.Wish)=="table"and hq.Wish.cashShare)or 2 local sH=o.data()for Ky,aF in ipairs(o.order())do
local sI=o.want(aF)if sI and sI.w and y.wantMore(aF,"",sH)then lf=lf+1 if not bR[aF]and z()>=(o.wishTry[aF]or 0)then
local lg=tonumber(K:GetAttribute("PetWishCredits"))or 0 local lh=math.floor((hq.Pets[aF].price or 0)*Cl)if lg<=0 and o.money()<lh then
o.wishTry[aF]=z()+10 bS=("need $%s to wish for %s"):format(av(lh),o.nice(aF))o.wishWhy[aF]=bS else o.wishTry[aF]=z()+3
local Cm=lg>0 and"wishCredit"or"wish"local hr=o.call(Cm,aF)if type(hr)=="table"and hr.ok then o.wishN,o.wishWhy[aF]=o.wishN+1,nil
D(("WISHED for %s (%s)"):format(o.nice(aF),lg>0 and"free wish"or("$"..av(lh))))else local li=type(hr)=="table"and tostring(hr.reason or"no reason given")or"no answer"
if li:lower():find("already",1,true)then o.wishTry[aF]=z()+2 else D(("wish %s failed: %s"):format(o.nice(aF),li))bS="wish failed: "..li end
end end end end end pcall(o.stackTick,bR,sH)if not bS then for Kz,hs in ipairs(o.order())do local sJ=o.want(hs)
if sJ and sJ.w and not bR[hs]and o.wishWhy[hs]then bS=o.wishWhy[hs]break end end end if not bS then local dj={}
for KA,eM in ipairs(o.order())do local sK=o.want(eM)local sL=tonumber(o.stacks()[eM])or 1 if sK and sK.w and bR[eM]then dj[#dj+1]=("%s%s %dm"):format(o.nice(eM),sL>1 and(" x"..sL)or"",math.ceil(bR[eM]/60))end
end local ht for KB,hu in ipairs(o.order())do local sM=o.want(hu)if sM and sM.w and bR[hu]and(not ht or bR[hu]<ht)then ht=bR[hu]end
end bS=lf==0 and"no pet has WISH ticked"or(#dj==0 and"running: none yet")or(#dj<=3 and("running: "..table.concat(dj,", ")))
or("%d running, the next one ends in %dm"):format(#dj,math.ceil((ht or 0)/60))end o.wishMsg=bS end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local lj=o.data()return(lj and lj.teams)or{},lj end function A.current(dk)
dk=dk or o.data()if not dk then return""end local sN={}for KC,Cn in ipairs(dk.equipped or{})do sN[tostring(Cn)]=true end
for KD,sO in ipairs(dk.teams or{})do local sP=sO.pets or{}local lk=#sP==#(dk.equipped or{})if lk then for KE,Co in ipairs(sP)do if not sN[tostring(Co)]then lk=false break end end end
if lk then return sO.name end end return""end function A.equip(ll)local Cp,Cq=A.teams()local lm for Cr,Cs in ipairs(Cp)do if Cs.name==ll then lm=Cr break end end
if not lm then A.msg="no saved team called "..tostring(ll)return false end if A.current(Cq)==ll then return true end
for KF=1,4 do local sQ=o.call("teamEquip",lm)if type(sQ)=="table"and sQ.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(Ct)local sR=Ct:FindFirstChild("SquishyPlaceHolder")local sS=sR and sR:FindFirstChild("TimerGui")
local sT=sS and sS:FindFirstChildWhichIsA("TextLabel",true)local ln=sT and sT.Text if type(ln)~="string"or ln:find("-",1,true)then return nil end
local lo,sU,sV=ln:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not lo then return nil end local sW=sV~=""and(tonumber(lo)*3600+tonumber(sU)*60+tonumber(sV))or(tonumber(lo)*60+tonumber(sU))
return sW>0 and sW or nil end function A.waxes()local eN={}local sX=c.plot and c.plot:FindFirstChild("WaxStations")
if not sX then return eN end local sY=o.srv()for KG,a_ in ipairs(sX:GetChildren())do local lp=tonumber(a_:GetAttribute("PourEnd"))
local sZ=a_:GetAttribute("PourOwner")if a_:GetAttribute("HasSquishy")and a_:GetAttribute("PourId")and(sZ==nil or sZ==o.uid)then
local lq=A.left(a_)local s0=lq and(sY+lq)or((lp and lp>sY)and lp or nil)if s0 then local s1,s2=a_:FindFirstChild("SquishyPlaceHolder"),"?"
if s1 then for KH,s3 in ipairs(s1:GetChildren())do if s3:IsA("Model")then s2=s3 .Name break end end end local Cu=tostring(a_:GetAttribute("Helpers")or"")
local lr=0 for KI in Cu:gmatch("%d+")do lr=lr+1 end eN[#eN+1]={st=a_,ends=s0,sure=lq~=nil,id=a_:GetAttribute("PourId"),name=s2,helps=lr,
long=a_:GetAttribute("PourLong")==true}end end end table.sort(eN,function(Cv,Cw)return Cv.ends<Cw.ends end)return eN
end function A.glazeCount()local s4=ag:FindFirstChild("Remotes")local s5=s4 and s4:FindFirstChild("EditStack")
if not s5 then return nil end local Cx,eO=pcall(function()return s5:InvokeServer("State",nil)end)if not(Cx and type(eO)=="table"and type(eO.state)=="table")then return nil end
local ls,lt=0,{}for KJ,hv in ipairs(eO.state.entries or{})do if hv.glaze and hv.glaze~=""then ls=ls+1 lt[hv.glaze]=(lt[hv.glaze]or 0)+1 end
end return ls,lt,#(eO.state.entries or{}),eO.state.capacity end function A.finishedOne(hw,s6)A.finished=A.finished+1
task.wait(2)local lu,Cy,s7,Cz=A.glazeCount()if lu and s6 and lu>s6 then A.glazed=A.glazed+1 local lv={}for CA,CB in pairs(Cy)do lv[#lv+1]=CA.." "..CB end
D(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(am(W(hw.name)),hw.st.Name,lu,table.concat(lv,", ")))
else D(("wax done on station %s: %s, no glaze%s"):format(hw.st.Name,am(W(hw.name)),s7 and(" (stack "..s7 .."/"..tostring(Cz)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cA=o.srv()local aJ=A.glazeFor if aJ then local eP=aJ.st local s8=eP.Parent and eP:GetAttribute("HasSquishy")and eP:GetAttribute("PourId")==aJ.id
local s9=s8 and A.left(eP)if s9 then aJ.ends=cA+s9 end if not s8 then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aJ.id or"?"]then
A.done[aJ.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aJ.id or"?"]=true},1 end local CC=aJ.before
task.spawn(function()pcall(A.finishedOne,aJ,CC)end)end elseif aJ.ends-cA>e.GlazeLead*3+60 or cA>aJ.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aJ.id or"?"]=z()+120 D(("station %s is not finishing yet (%s left) - glaze team off again"):format(eP.Name,A.clock(aJ.ends-cA)))
end end if e.TeamGlaze~=""and not A.glazeFor then local CD=A.speedRatio(e.TeamGlaze)for KK,cB in ipairs(A.list)do
if cB.sure and(cB.ends-cA)*CD[cB.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cB.id or"?"]or 0)and not A.done[cB.id or"?"]then
A.glazeFor=cB task.spawn(function()cB.before=A.glazeCount()end)break end end end local aK,eQ="",""local dl=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cA)
if dl and dl<-8 then q.snapAt,dl=nil,nil end if e.TeamGlaze~=""and dl and dl<=20 then aK,eQ=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(dl)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aK,eQ=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aK,eQ=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aK,eQ=e.TeamFull," - every station is busy"else aK=e.TeamNormal end A.want=aK local eR=A.current()A.cur=eR if aK~=""and eR~=aK and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aK)then D("team: "..aK..eQ)else A.nextTry=z()+3 end end local lw=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eR~=""and eR or"(not a saved team)",(aK~=""and aK~=eR)and(" -> "..aK)or"",
lw and("in "..A.clock(lw.ends-cA).." (st "..lw.st.Name..")")or"- none running")end function A.clock(bT)bT=math.max(0,math.floor(bT))
if bT>=3600 then return("%d:%02d:%02d"):format(math.floor(bT/3600),math.floor((bT%3600)/60),bT%60)end return("%d:%02d"):format(math.floor(bT/60),bT%60)
end function A.allBusy()local CE,CG=gk()return CG>0 and CE==0 end function A.aboutToPlace()if not c.running then return false end
local hx=ad()if not(hx and aP(hx))then return false end if(e.NoWax and not q.isLimited(hx))or(q.isLimited(hx)and not q.limitedHere())then return false end
local CH=gk()return CH>0 end function A.mult(s_,CI,ta)return{(1+s_)*(1+ta),(1+s_+CI)*(1+ta)}end function A.speedNow()
local function lx(CJ)return tonumber(K:GetAttribute(CJ))or 0 end return A.mult(lx("PetWaxSpeed"),lx("PetLongWax"),lx("PetSocialWax"))
end function A.speedOf(CK)local CL,tb=A.teams()if not tb then return nil end for KL,td in ipairs(CL)do if td.name==CK then
local ly={}for KM,CM in ipairs(td.pets or{})do for KN,te in ipairs(tb.pets or{})do if tostring(te.id)==tostring(CM)then ly[#ly+1]=te break end end
end local tf=y.caps()local th,CN=y.stats(ly)return A.mult(math.min(th.waxSpeed or 0,tf.waxSpeed or 0.25),math.min(th.longWax or 0,tf.longWax or 0.3),CN.socialWax or 0)
end end return nil end function A.speedRatio(CO)local ti,lz=A.speedNow(),A.speedOf(CO)if not lz then return{1,1}end
return{ti[1]/lz[1],ti[2]/lz[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(CP)local lA=o.info()if lA and type(lA.fuseNeed)=="function"then local CQ,lB=pcall(lA.fuseNeed,K,CP or"")
if CQ and tonumber(lB)and tonumber(lB)>=2 then return tonumber(lB)end end if K:GetAttribute("FusePass")==true or K:GetAttribute("FusePass4")==true then return 3 end
if K:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(tj)
if tj=="Huge"then return y.needFor("")*y.needFor("Big")end if tj=="Big"then return y.needFor("")end return 1 end
function y.nextOf(tk)return(tk==""and"Big")or(tk=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lC=o.info()return(lC and type(lC.HugeCaps)=="table")and lC.HugeCaps or y.HCAPS end function y.cosmic()local lD=o.info()return(lD and type(lD.CosmicCaps)=="table")and lD.CosmicCaps or{StarWhale=0.1}end
function y.slots()local tl=o.data()return tonumber(tl and tl.slots)or(3+(tonumber(K:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lE=o.info()return(lE and type(lE.Caps)=="table")and lE.Caps or y.CAPS end function y.value(tm,cC)
local hy=o.info()local cD=hy and hy.Pets[tm]if not(cD and type(cD.boost)=="table")then return nil end local cE
if type(hy.boostValue)=="function"then local CS,CT=pcall(hy.boostValue,tm,(cC~=""and cC)or nil)cE=CS and tonumber(CT)or nil
end if not cE then local eS=cD.boost.value or 0 cE=eS if cC=="Big"or cC=="Huge"then local tn=eS*(cC=="Huge"and 1.75 or 1.5)
cE=y.ROUND[cD.boost.kind]and math.max(eS+(cC=="Huge"and 2 or 1),math.floor(tn+0.5))or tn if cC=="Huge"and y.ROUND[cD.boost.kind]then cE=math.max(cE,math.max(eS+1,math.floor(eS*1.5+0.5))+1)end
end end return cD.boost.kind,cE,cD.boost.every end function y.stats(CU)local cF,lF,to,eT={},{},{},{}local CV=y.cosmic()
for KO,dm in ipairs(CU)do local aw,eU,tp=y.value(dm.name,dm.variant or"")if aw then if dm.variant=="Huge"then to[y.CAPKEY[aw]or aw]=true end
if aw:sub(1,6)=="social"then lF[aw]=math.max(lF[aw]or 0,eU)elseif aw=="waxStir"or aw=="cashGift"then cF[aw]=(cF[aw]or 0)+eU*60/(tp or 60)
elseif aw=="luckyPull"then cF.luckyPull=(cF.luckyPull or 0)+eU/(tp or 10)else cF[aw]=(cF[aw]or 0)+eU if CV[dm.name]then eT[aw]=eT[aw]or{}eT[aw][dm.name]=(eT[aw][dm.name]or 0)+eU end
end end end return cF,lF,to,eT end function y.glazeGain(CW,hz)local eV,lG,KP={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local CX=eV[1]+eV[2]+eV[3]local CY=tonumber(K:GetAttribute("GuildUpGlaze"))or 0 local dn={}for hA=1,3 do dn[hA]=eV[hA]+CW*eV[hA]/CX+(hA==1 and CY or 0)end
local lH={dn[1]*(1-hz),dn[2]*(1-hz)+dn[1]*hz,dn[3]+dn[2]*hz}return lH[1]*(lG[1]-1)+lH[2]*(lG[2]-1)+lH[3]*(lG[3]-1)
end function y.score(hB,CZ)local C0,C1,C2=y.caps(),y.hcaps(),y.cosmic()local hC,hD,C3,tq=y.stats(CZ)local function lI(lJ)return(C3[lJ]and C1[lJ])or C0[lJ]or math.huge end
local function bt(hE)local lK,lL=hC[hE]or 0,lI(hE)local lM=math.min(lK,lL)if tq[hE]and lK>lL then local lN=0 for C4,C5 in pairs(tq[hE])do lN=lN+math.min(C5,C2[C4]or 0)end
lM=lM+math.min(lK-lL,lN)end return lM end local C6=(1+bt("income"))*(1+(hD.socialIncome or 0))*(1+math.min(hC.cashGift or 0,lI("cashGiftPerMinute"))/60)
local C7=1+bt("luck")+(hC.luckyPull or 0)+(hD.socialLuck or 0)local tr=C7*(1+bt("newFind"))*(1+bt("rollSpeed"))
local eW=math.log(C6)local C8=math.max(tonumber(K:GetAttribute("WaxStations"))or 18,1)local lO=(1+bt("waxSpeed")+bt("longWax"))*(1+(hD.socialWax or 0))
+math.min(hC.waxStir or 0,lI("waxStirPerMinute"))/60/C8 local C9=1-(1-bt("headStart"))*(1-(hD.socialHeadStart or 0))
if hB=="farm"then return eW+0.7*math.log(tr)+0.1*math.log(lO)end if hB=="full"then return eW+0.4*math.log(lO)+0.02*math.log(tr)end
if hB=="glaze"then return y.glazeGain(bt("glaze"),bt("glazeUp"))+0.001*eW end if hB=="wax"then return-math.log(1-0.5*C9)+0.001*eW+0.001*math.log(lO)end
return eW end function y.kinds(C_)local ts,lP={},{}for KQ,eX in ipairs(C_)do local tt=eX.name.."|"..(eX.variant or"")
local bU=ts[tt]if not bU then bU={name=eX.name,variant=eX.variant or"",n=0,ids={}}ts[tt]=bU lP[#lP+1]=bU end bU.n=bU.n+1
bU.ids[#bU.ids+1]=eX.id end return lP end function y.bestKinds(tu,bV,Da,tv,tw)local aD,bW={},{}local function lQ(Db)
local tx,hF={},{}for Dc,lR in ipairs(Db)do tx[Dc]=bV[lR]hF[lR]=(hF[lR]or 0)+1 end local eY=y.score(tu,tx)if tv then for Dd,De in pairs(hF)do eY=eY+1e-7*math.min(De,tv[Dd]or 0)end end
if tw then for Df,Dg in pairs(hF)do eY=eY-1e-8*Dg*tw[bV[Df].variant]end end return eY end for KR=1,Da do local eZ,lS
for hG=1,#bV do if(bW[hG]or 0)<bV[hG].n then aD[#aD+1]=hG local ty=lQ(aD)aD[#aD]=nil if not lS or ty>lS+1e-12 then eZ,lS=hG,ty end
end end if not eZ then break end bW[eZ]=(bW[eZ]or 0)+1 aD[#aD+1]=eZ if#bV>40 then task.wait()end end for KS=1,6 do
task.wait()local tz,tA=false,lQ(aD)for lT=1,#aD do for dp=1,#bV do local hH=aD[lT]if dp~=hH and(bW[dp]or 0)<bV[dp].n then
aD[lT]=dp local tB=lQ(aD)if tB>tA+1e-9 then bW[hH],bW[dp],tA,tz=bW[hH]-1,(bW[dp]or 0)+1,tB,true else aD[lT]=hH end
end end end if not tz then break end end local tC={}for Dh,Di in ipairs(aD)do tC[Dh]=bV[Di]end return aD,y.score(tu,tC)
end function y.best(Dj,Dk,Dl,hI)hI=hI or{}local lU=y.kinds(Dk)local lV={}for tD,Dm in ipairs(lU)do for KT,Dn in ipairs(Dm.ids)do if hI[tostring(Dn)]then lV[tD]=(lV[tD]or 0)+1 end end end
local Do,Dp=y.bestKinds(Dj,lU,Dl,lV)local lW,lX={},{}for KU,Dq in ipairs(Do)do local tE,e0=lU[Dq],nil for KV,lY in ipairs(tE.ids)do if hI[tostring(lY)]and not lW[lY]then e0=lY break end end
if not e0 then for KW,tF in ipairs(tE.ids)do if not lW[tF]then e0=tF break end end end lW[e0]=true lX[#lX+1]=tostring(e0)
end return lX,Dp end function y.dream()local tG=o.info()if not(tG and type(tG.Pets)=="table")then return nil end
local lZ=y.slots()local tH=y.needFor("").."|"..y.needFor("Big").."|"..lZ.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==tH and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local Dw=pcall(function()local hJ={}for KX,Dr in ipairs(o.order())do for KY,Ds in ipairs({"","Big","Huge"})do hJ[#hJ+1]={name=Dr,variant=Ds,n=lZ,ids={}}end
end local e1,l0={},{}for KZ,hK in ipairs(y.ROLES)do if e[hK[1]]~=""then local Dt,Du=y.bestKinds(hK[2],hJ,lZ,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local l1,hL={},{}for K0,tI in ipairs(Dt)do l1[tI]=(l1[tI]or 0)+1 end for Dv,l2 in pairs(l1)do local bX=hJ[Dv]
e1[bX.name]=e1[bX.name]or{[""]=0,Big=0,Huge=0}e1[bX.name][bX.variant]=math.max(e1[bX.name][bX.variant],l2)hL[#hL+1]=(l2>1 and(l2 .."x ")or"")..o.nice(bX.name,bX.variant)
end table.sort(hL)l0[#l0+1]={role=hK[2],team=e[hK[1]],names=hL,score=Du}end end y.dreamT,y.dreamTeams,y.dreamSig=e1,l0,tH
end)y.dreaming=false if not Dw then y.dreamSig=nil end return y.dreamT end function y.owned(hM)local tJ,l3={},{}
for K1,Dx in ipairs(hM and hM.arriving or{})do tJ[tostring(Dx)]=true end for K2,cG in ipairs(hM and hM.pets or{})do
if not tJ[tostring(cG.id)]then l3[#l3+1]={id=tostring(cG.id),name=cG.name,variant=cG.variant or"",named=cG.named or(cG.nickname and cG.nickname~="")}
end end return l3 end function y.have(tK,Dy,Dz)local ba={[""]=0,Big=0,Huge=0}local tL={}for K3,e2 in ipairs(y.owned(Dy))do
tL[e2 .id]=true if e2 .name==tK and ba[e2 .variant]then ba[e2 .variant]=ba[e2 .variant]+1 end end if Dz then for K4,dq in ipairs(o.recent or{})do
if dq.name==tK and not tL[dq.id]and z()-dq.at<20 and ba[dq.variant or""]then ba[dq.variant or""]=ba[dq.variant or""]+1 end
end end return ba,ba[""]+ba.Big*y.unit("Big")+ba.Huge*y.unit("Huge")end function y.goal(tM)local tN=e.Pets[tM]
if tN and tonumber(tN.f)==-1 then return nil,0 end local tO=y.dream()local e3=tO and tO[tM]if not e3 then return nil,0 end
return e3,e3[""]+e3 .Big*y.unit("Big")+e3 .Huge*y.unit("Huge")end function y.wantMore(l4,K5,tP)if not tP then return true end
local tQ=e.Pets[l4]if tQ and tonumber(tQ.f)==-1 then return true end local DA,DB=y.goal(l4)if not DA then return true end
local K6,DC=y.have(l4,tP,true)return DC<DB+y.need()end function y.status(e4,tR)if not tR then return nil end local tS=e.Pets[e4]
if tS and tonumber(tS.f)==-1 then return"KEEP: never fused"end local cH,tT=y.goal(e4)if not cH then return y.dream()and"in no best team: bought as ticked"or nil end
local l5,DD=y.have(e4,tR)local cI={}if cH.Huge>0 then cI[#cI+1]=("Huge %d/%d"):format(l5 .Huge,cH.Huge)end if cH.Big>0 then cI[#cI+1]=("Big %d/%d"):format(l5 .Big,cH.Big)end
if cH[""]>0 then cI[#cI+1]=("plain %d/%d"):format(l5[""],cH[""])end local DE=y.blocked and y.blocked[e4]and(" | "..y.blocked[e4])or""
return("%s | %d/%d copies%s"):format(table.concat(cI," "),math.min(DD,tT),tT,DE)end function y.wear(l6)local l7={}
for K7,DF in ipairs(l6)do l7[tostring(DF)]=true end for K8=1,3 do local dr=o.data()if not dr then return false end
for K9,tU in ipairs(dr.equipped or{})do if not l7[tostring(tU)]then o.call("unequip",tU)task.wait(0.3)end end
dr=o.data()local tV={}for K_,DG in ipairs(dr.equipped or{})do tV[tostring(DG)]=true end for La,tW in ipairs(l6)do
if not tV[tostring(tW)]then o.call("equip",tW)task.wait(0.3)end end task.wait(0.4)dr=o.data()local l8,tX=0,true
for Lb,DH in ipairs(dr.equipped or{})do l8=l8+1 if not l7[tostring(DH)]then tX=false end end if tX and l8==#l6 then return true end
end return false end function y.saveTeam(tY,tZ)if not y.wear(tZ)then return false,"could not put the pets on"end
local DI=A.teams()local cJ for DJ,DK in ipairs(DI)do if DK.name==tY then cJ=DJ break end end local ds if cJ then
ds=o.call("teamSave",cJ)else ds=o.call("teamNew")if type(ds)=="table"and ds.ok and ds.index then cJ=ds.index task.wait(0.3)
o.call("teamRename",{index=cJ,name=tY})end end task.wait(0.4)local l9=o.data()local t0=l9 and l9 .teams and cJ and l9 .teams[cJ]
if not t0 then return false,"the game did not save it"end local t1={}for Lc,DL in ipairs(t0 .pets or{})do t1[tostring(DL)]=true end
for Ld,DM in ipairs(tZ)do if not t1[tostring(DM)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local DN=o.srv()for Le,DO in ipairs(A.list or{})do if DO.ends-DN<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local e5=o.data()if not e5 then return{}end local t2={}for Lf,DP in ipairs(e5 .arriving or{})do t2[tostring(DP)]=true end
local e6={}for Lg,hN in ipairs(e5 .pets or{})do if not t2[tostring(hN.id)]then e6[#e6+1]={id=tostring(hN.id),name=hN.name,variant=hN.variant or""}end
end local t3={}for Lh,t4 in ipairs(e6)do t3[t4 .id]=t4 end local t5=tonumber(e5 .slots)or 3 local l_,t6={},{}
for Li,hO in ipairs(y.ROLES)do local e7=e[hO[1]]if e7~=""and not t6[e7]then t6[e7]=true local ma,e8,t7={},{},false
for Lj,t8 in ipairs(e5 .teams or{})do if t8 .name==e7 then for Lk,DQ in ipairs(t8 .pets or{})do local mb=t3[tostring(DQ)]
if mb then ma[mb.id]=true e8[#e8+1]=mb else t7=true end end end end local mc,t9=y.best(hO[2],e6,t5,ma)local t_=y.score(hO[2],e8)
local ua=#mc==#e8 for Ll,DR in ipairs(mc)do if not ma[DR]then ua=false end end if not ua and(t7 or#e8<math.min(t5,#e6)or t9>t_+1e-4)then
l_[#l_+1]={team=e7,role=hO[2],ids=mc,gain=t9-t_}end end end return l_ end function y.rebuild(DS)local ub=y.plan()
if#ub==0 then y.buildMsg="teams are already the best your pets allow"return true end if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end
A.editing,A.editingSince=true,z()local hP=true local DW,DX=pcall(function()for Lm,e9 in ipairs(ub)do local DT,DU=y.saveTeam(e9 .team,e9 .ids)
local uc=o.data()local md={}for Ln,DV in ipairs(e9 .ids)do for Lo,me in ipairs(uc and uc.pets or{})do if tostring(me.id)==DV then md[#md+1]=o.nice(me.name,me.variant)end
end end if DT then D(("TEAM %s rebuilt (%s): %s"):format(e9 .team,DS or"pets changed",table.concat(md,", ")))
else hP=false D(("TEAM %s: %s"):format(e9 .team,tostring(DU)))end end end)A.editing,A.nextTry=false,0 if not DW then hP=false D("TEAM BUILD ERR "..tostring(DX))end
y.builds=y.builds+1 y.buildMsg=hP and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return hP end function y.roleScores(ud)local bY={}for Lp,ue in ipairs(ud)do bY[#bY+1]=ue.name..ue.variant end
table.sort(bY)bY=table.concat(bY,",")y.rsCache=y.rsCache or{}if y.rsCache[bY]then return y.rsCache[bY]end local DY,DZ,mf=y.kinds(ud),y.slots(),{}
for Lq,mg in ipairs(y.ROLES)do if e[mg[1]]~=""then local Lr,D0=y.bestKinds(mg[2],DY,DZ)mf[mg[2]]=D0 end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bY]=mf return mf end function y.noLoss(uf,D1,D2,D3)local ug,e_={},{}
for Ls,D4 in ipairs(D1)do ug[D4]=true end for Lt,uh in ipairs(uf)do if not ug[uh.id]then e_[#e_+1]=uh end end
e_[#e_+1]={id="new",name=D2,variant=D3}local D5,ui=y.roleScores(uf),y.roleScores(e_)local uj=false for mh,uk in pairs(D5)do
if(ui[mh]or-math.huge)<uk-1e-6 then return false,mh end if(ui[mh]or 0)>uk+1e-6 then uj=true end end return true,uj
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local fa=o.data()if not fa then return end local ul=y.owned(fa)local hQ,fb={},{}for Lu,D6 in ipairs(fa.teams or{})do for Lv,D7 in ipairs(D6 .pets or{})do hQ[tostring(D7)]=true end end
for Lw,D8 in ipairs(fa.equipped or{})do fb[tostring(D8)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for Lx,aL in ipairs(o.order())do
local hR=y.goal(aL)if hR then local mi=y.have(aL,fa)for Ly,bu in ipairs({"Big",""})do local dt,mj=y.nextOf(bu),y.needFor(bu)
local D9=(bu=="Big"and mi.Huge<hR.Huge)or(bu==""and mi.Big<hR.Big+y.needFor("Big")*math.max(0,hR.Huge-mi.Huge))
local fc={}for Lz,ml in ipairs(ul)do if ml.name==aL and ml.variant==bu then fc[#fc+1]=ml end end if D9 and#fc>=mj and z()>=(y.failUntil[aL..bu]or 0)then
table.sort(fc,function(hS,hT)local um=(fb[hS.id]and 4 or 0)+(hQ[hS.id]and 2 or 0)+(hS.named and 1 or 0)local uo=(fb[hT.id]and 4 or 0)+(hQ[hT.id]and 2 or 0)+(hT.named and 1 or 0)
if um~=uo then return um<uo end return hS.id<hT.id end)local cK,mm,up={},{},false for du=1,mj do cK[du]=fc[du].id
if fb[cK[du]]then mm[#mm+1]=cK[du]end if fb[cK[du]]or hQ[cK[du]]then up=true end end local D_,uq=y.noLoss(ul,cK,aL,dt)
if not D_ then y.blocked[aL]=("%s waits: it would weaken the %s team now"):format(dt,y.ROLENAME[uq]or tostring(uq))
elseif up and not y.quiet()then y.blocked[aL]=dt.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dt,o.nice(aL))
return else A.editing,A.editingSince=true,z()for LA,Ea in ipairs(mm)do o.call("unequip",Ea)task.wait(0.3)end local hU=o.call("fuse",{ids=cK})
A.editing,A.nextTry=false,0 if type(hU)=="table"and hU.ok then y.fused=y.fused+1 y.dirtyAt=z()D(("FUSED %d %s -> %s"):format(mj,o.nice(aL,bu),o.nice(aL,dt)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aL,dt),os.date("%H:%M"))else y.failUntil[aL..bu]=z()+120 D(("fuse %s failed: %s"):format(o.nice(aL,bu),type(hU)=="table"and tostring(hU.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local ur=o.data()if not ur then return end local cL={}for LB,Eb in ipairs(ur.pets or{})do cL[#cL+1]=tostring(Eb.id)end
table.sort(cL)cL=table.concat(cL,",")if cL~=y.sig then y.sig,y.dirtyAt=cL,z()end local Ec=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if Ec and not A.editing then local Ed=y.rebuild(y.dirtyAt and"pets changed"or"check")if Ed then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cM)return cM:IsA("ParticleEmitter")or cM:IsA("Trail")or cM:IsA("Beam")or cM:IsA("Fire")or cM:IsA("Smoke")
or cM:IsA("Sparkles")or cM:IsA("Light")end function d.muteOne(bv)if not e.Lite or not bv.Parent then return end
local hV=(bv:IsA("BillboardGui")and d.bb)or(d.isFx(bv)and d.fx)or nil if not hV or hV[bv]~=nil then return end
if hV==d.fx and d.gameLow and not bv:IsA("Beam")then return end hV[bv]=bv.Enabled if bv.Enabled then bv.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local mn={}for LC,Ee in ipairs({d.bb,d.fx})do for Ef in pairs(Ee)do mn[#mn+1]=Ef end end local us=os.clock()for Eg,fd in ipairs(mn)do
if e.Lite and fd.Parent and fd.Enabled then local Eh=d.bb[fd]~=nil and d.bb or d.fx Eh[fd]=true fd.Enabled=false
end if Eg%200==0 and os.clock()-us>0.002 then task.wait()us=os.clock()end end end function d.lite(ut)e.Lite=ut
if ut then task.spawn(function()for Ei,Ej in ipairs(ak:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Ej)
if Ei%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=V(ak.DescendantAdded:Connect(function(mo)
if e.Lite and(mo:IsA("BillboardGui")or d.isFx(mo))then d.queue[#d.queue+1]=mo end end))end local mp=game:GetService("Lighting")
for LD,fe in ipairs(mp:GetChildren())do if fe:IsA("PostEffect")and fe.Enabled and d.post[fe]==nil then d.post[fe]=true fe.Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and mp.GlobalShadows or d.oldShadows mp.GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ak.Terrain.Decoration or d.oldDeco ak.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for LE,Ek in pairs(d.watch)do pcall(function()Ek:Disconnect()end)end
for uu,El in pairs(d.bb)do pcall(function()if uu.Parent then uu.Enabled=El end end)end for uv,Em in pairs(d.fx)do pcall(function()if uv.Parent then uv.Enabled=Em end end)end
for uw in pairs(d.post)do pcall(function()if uw.Parent then uw.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local En=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()En.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ak.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(ux)
local Eo,mq=pcall(function()return require(ag:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not Eo or type(mq)~="table"then return end if ux and not d.ceOld then d.ceOld={}for LF,uy in ipairs({"Fireworks","Confetti"})do
local hW=mq[uy]if type(hW)=="table"and type(hW.Play)=="function"then d.ceOld[uy]=hW.Play pcall(function()hW.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not ux and d.ceOld then for Ep,Eq in pairs(d.ceOld)do pcall(function()mq[Ep].Play=Eq end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local mr,hX for LG,ff in ipairs(getgc(false))do if type(ff)=="function"and(type(islclosure)~="function"or islclosure(ff))then
local Er,uz,uA=pcall(debug.info,ff,"sn")if Er and type(uz)=="string"and uz:find("ToppingCullHandler",1,true)then
if uA=="poll"then mr=ff elseif uA=="retarget"then hX=ff end end end end if not(mr and hX)then return nil end local Es,hY=pcall(debug.getupvalues,hX)
local uB=Es and type(hY)=="table"and hY[3]if type(uB)~="function"or debug.info(uB,"n")~="targetFor"or(hY[1]~=nil and type(hY[1])~="number")then return nil end
d.tc={poll=mr,re=hX}return d.tc end function d.tops(uC)local aR=d.topsFind()if not aR then return false end if uC and not aR.old then
local Et,Eu=pcall(hookfunction,aR.poll,function()end)if not Et then return false end aR.old=Eu pcall(debug.setupvalue,aR.re,1,-1000)
pcall(aR.re)elseif not uC and aR.old then local Ev=type(restorefunction)=="function"and pcall(restorefunction,aR.poll)
if not Ev then pcall(hookfunction,aR.poll,aR.old)end aR.old=nil pcall(aR.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(Ew)local uD=ak:FindFirstChild("Plots")local uE=os.clock()if Ew then for LH,Ex in ipairs(uD and uD:GetChildren()or{})do
local uF=Ex:FindFirstChild("SkinProps")local uG=uF and uF:FindFirstChild("FairyLights")for LI,uH in ipairs(uG and uG:GetChildren()or{})do
for LJ,fg in ipairs(uH:GetChildren())do if fg:IsA("BasePart")and(fg.Name=="Bulb"or fg.Name=="Wire")then d.lit[fg]=uH fg.Parent=nil end
end if os.clock()-uE>0.002 then task.wait()uE=os.clock()end end end for LK,Ey in ipairs({"Leaderboards","ClanBoard"})do
local ms=ak:FindFirstChild(Ey)if ms then d.boardsOff[ms]=true ms.Parent=nil end end else for Ez,uI in pairs(d.lit)do pcall(function()if uI.Parent then Ez.Parent=uI end end)end
for uJ in pairs(d.boardsOff)do pcall(function()if not uJ.Parent then uJ.Parent=ak end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(EA)if EA then local uK=ag:FindFirstChild("Remotes")local uL=uK and uK:FindFirstChild("SquishyRollAnimation")
if not uL or type(getconnections)~="function"then return end local EB,EC=pcall(getconnections,uL.OnClientEvent)
for LL,hZ in ipairs(EB and EC or{})do local mt=""pcall(function()mt=debug.info(hZ.Function,"s")end)if type(mt)=="string"and mt:find("SquishyHandler",1,true)and not d.reel[hZ]then
if pcall(function()hZ:Disable()end)then d.reel[hZ]=true end end end else for ED in pairs(d.reel)do pcall(function()ED:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(EE)if not EE then for LM,EF in pairs(d.quiet)do pcall(function()EF:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function mu(EG,EH)local EI,EJ=pcall(getconnections,EG)
for LN,h0 in ipairs(EI and EJ or{})do local mv=""pcall(function()mv=debug.info(h0 .Function,"s")end)local mw=h0 .Function
if mw and type(mv)=="string"and mv:find(EH,1,true)and not d.quiet[mw]then if pcall(function()h0:Disable()end)then d.quiet[mw]=h0 end
end end end local uM=ak:FindFirstChild("Plots")for LO,h1 in ipairs(uM and uM:GetChildren()or{})do if h1~=c.plot then
mu(h1:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uN,uO=h1:FindFirstChild("WaxStations"),h1:FindFirstChild("SquishyStack")
if uN then mu(uN.DescendantAdded,"LocalToppingsHandler")end if uO then mu(uO.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for uP,EK in pairs(d.lit)do if not EK:IsDescendantOf(game)then d.lit[uP]=nil pcall(function()uP:Destroy()end)end
end end function d.passText()local ax=function(EL)return K:GetAttribute(EL)end local mx={}local function bZ(EM,EN)mx[#mx+1]=(EM and"[x] "or"[  ] ")..EN end
bZ(ax("VIP")==true,"VIP: money x1.5, offline +50%")bZ(ax("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(ax("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local EO=ax("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(ax("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bZ(ax("FastWax")==true or ax("SuperFastWax")==true,EO.." (the farm times by the game's own timers)")local uQ=(ax("FusePass")==true and"Fuse Pass")or(ax("FusePass4")==true and"Fuse Pass 4")or(ax("FusePass5")==true and"Fuse Pass 5")or nil
bZ(uQ~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uQ or"Fuse pass",y.needFor(""),y.needFor("Big")))local h2=o.data()
local EP=tonumber(h2 and h2 .maxOwned)or 60 bZ(ax("PetInventory50")==true or ax("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(h2 and#(h2 .pets or{})or 0,EP,(ax("PetInventory50")==true and ax("PetInventory100")==true)and" (both bag passes)"or""))
local uR=tonumber(ax("PetEquipBought"))or 0 bZ(uR>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uR))
local uS=tonumber(ax("PetWishCredits"))or 0 if uS>0 then bZ(true,("%d free wishes: used before cash"):format(uS))end
local uT=tonumber(ax("FinishAllCredits"))or 0 if uT>0 then bZ(true,("%d finish-all credits (yours to use)"):format(uT))end
return table.concat(mx,"\n")end function d.extras(h3)pcall(d.quietPlots,h3 and c.plot~=nil)pcall(d.fxPatch,h3)
pcall(d.tops,h3)pcall(d.lights,h3)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uU)
e.HideHud=uU local my=K:FindFirstChildOfClass("PlayerGui")if not my then return end if uU then for LP,fh in ipairs(my:GetChildren())do
if fh:IsA("ScreenGui")and not d.MINE[fh.Name]and fh.Enabled then d.hud[fh]=true fh.Enabled=false end end if not d.hudConn then
d.hudConn=V(my.ChildAdded:Connect(function(fi)if e.HideHud and fi:IsA("ScreenGui")and not d.MINE[fi.Name]then
task.defer(function()if e.HideHud and fi.Enabled then d.hud[fi]=true fi.Enabled=false end end)end end))end else
for uV in pairs(d.hud)do pcall(function()if uV.Parent then uV.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mz)e.FpsCap=mz local uW=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uW then return false end return pcall(uW,mz==0 and 60 or mz)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ap)if ap:IsA("BasePart")or ap:IsA("Decal")or ap:IsA("Texture")then if ap.Transparency<1 then d.unseen[ap]=ap.Transparency ap.Transparency=1 end
elseif ap:IsA("BillboardGui")or ap:IsA("SurfaceGui")or ap:IsA("ParticleEmitter")or ap:IsA("Beam")or ap:IsA("Trail")or ap:IsA("Light")or ap:IsA("Fire")or ap:IsA("Smoke")or ap:IsA("Sparkles")then
if ap.Enabled then d.unseen[ap]=true ap.Enabled=false end end end function d.notMine(EQ)return e.HideMine or(c.plot and not EQ:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(h4)
local mA=h4 .Parent local mB=mA and mA.Name=="SquishyStack"and mA.Parent if mB and mB~=c.plot and c.plot and mB.Parent==c.plot.Parent and not d.dropSeen[h4]then
d.dropSeen[h4]=true d.dropQ[#d.dropQ+1]={h4,z()+3}end end function d.dropScan()local uX=c.plot and c.plot.Parent
if not(e.HideBases and uX)then return end for LQ,uY in ipairs(uX:GetChildren())do local uZ=uY~=c.plot and uY:FindFirstChild("SquishyStack")
for LR,ER in ipairs(uZ and uZ:GetChildren()or{})do d.dropIt(ER)end end end function d.dropStep(ES)local mC=d.dropQ
while d.dropI<=#mC and os.clock()-ES<0.003 do local mD=mC[d.dropI]if mD[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mD[1].Parent then pcall(function()mD[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mC then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mE=os.clock()local fj=d.queue if e.Lite and fj and#fj>0 then d.muteI=d.muteI or 1
while d.muteI<=#fj and os.clock()-mE<0.0015 do pcall(d.muteOne,fj[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#fj then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mE)end local h5=d.hideQ if d.hideI>#h5 then return end while d.hideI<=#h5 and os.clock()-mE<0.004 do
local mF=h5[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mF.Parent and d.notMine(mF)then pcall(d.hideOne,mF)end
end if d.hideI>#h5 then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(u0)if e.HideBases then d.bases(false)end
e.HideMine=u0==2 if u0>0 then d.bases(true)end end function d.bases(u1)e.HideBases=u1 local mG=ak:FindFirstChild("Plots")
if not mG then return end if u1 then task.spawn(function()local mH=0 for LS,h6 in ipairs(mG:GetChildren())do local u2=h6~=c.plot and c.plot and h6:FindFirstChild("SquishyStack")
for LT,ET in ipairs(u2 and u2:GetChildren()or{})do d.dropIt(ET)end if h6~=c.plot or e.HideMine then for LU,EU in ipairs(h6:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,EU)mH=mH+1 if mH%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=V(mG.DescendantAdded:Connect(function(dv)if e.HideBases and d.notMine(dv)then
pcall(d.hideOne,dv)d.hideQ[#d.hideQ+1]=dv if dv.Parent and dv.Parent.Name=="SquishyStack"then d.dropIt(dv)end
end end))end else for mI,u3 in pairs(d.unseen)do pcall(function()if not mI.Parent then return end if type(u3)=="number"then mI.Transparency=u3 else mI.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(u4)e.NoRender=u4 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not u4)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local EW=game:GetService("RunService")local mJ=0 for LV,EX in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local EY,u5=pcall(function()return EW[EX]end)local u6,mK=false,nil if EY and u5 then u6,mK=pcall(getconnections,u5)end
if u6 and type(mK)=="table"then for LW,h7 in ipairs(mK)do local mL=""pcall(function()local u7=getfenv(h7 .Function).script mL=u7 and u7:GetFullName()or""end)
if mL~=""then for LX,EZ in ipairs(d.CALM)do if mL:find(EZ,1,true)then local mM=h7 .Function if mM and not d.calmedF[mM]and pcall(function()h7:Disable()end)then
d.calmedF[mM]=true d.calmed[#d.calmed+1]=h7 mJ=mJ+1 end break end end end end end end if#d.calmed>200 then local mN={}for E0=#d.calmed-49,#d.calmed do mN[#mN+1]=d.calmed[E0]end d.calmed=mN
end return mJ end function d.walker()local E1,mO=pcall(function()return require(K.PlayerScripts.LocalScript.PetHandler.Walker)end)
return(E1 and type(mO)=="table"and type(mO.walkTo)=="function")and mO or nil end function d.walkers(E2)local u8={}
local E3,E4=pcall(debug.getupvalues,E2 .destroy)for LY,u9 in ipairs(E3 and E4 or{})do if type(u9)=="table"then
for h8 in pairs(u9)do if type(h8)=="table"and rawget(h8,"model")~=nil and rawget(h8,"position")~=nil then u8[h8]=true end end
end end return u8 end function d.walkPatch(u_)local fk=d.walker()if not fk then return 0 end if u_ and not d.wkOld then
local va=fk.walkTo d.wkOld=va fk.walkTo=function(fl,fm,E5,mP)local E6=fm~=nil and pcall(function()return fm.X+fm.Z end)
if not e.Calm or not E6 then return va(fl,fm,E5,mP)end fl.target,fl.onArrive=nil,nil pcall(function()fl:teleport(fm)fl:render(0)end)
if mP then task.spawn(mP)end end elseif not u_ then if d.wkOld then fk.walkTo,d.wkOld=d.wkOld,nil end return 0
end local mQ=0 for aM in pairs(d.walkers(fk))do if aM.target and not aM.destroyed then local vb=aM.model and aM.model:FindFirstChild("Body")and aM.model.Body:FindFirstChild("PetBillboard")
local vc=vb and vb:FindFirstChild("TimerLabel",true)if vc and tostring(vc.Text):find("'s plot!",1,true)then pcall(function()aM:destroy()end)
pcall(function()aM.model:Destroy()end)else local E7,vd=aM.target,aM.onArrive aM.target,aM.onArrive=nil,nil pcall(function()aM:teleport(E7)aM:render(0)end)
if vd then task.spawn(vd)end end mQ=mQ+1 end end return mQ end function d.calm(ve)e.Calm=ve if ve then local E8=d.calmScan()
local mR=0 pcall(function()mR=d.walkPatch(true)end)D(("NO ANIMATIONS: %d of the game's animation loops switched off%s"):format(E8,mR>0 and(", "..mR.." stuck pet walks cleared")or""))
else for LZ,E9 in ipairs(d.calmed)do pcall(function()E9:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
pcall(d.walkPatch,false)end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end
if J.arPaused then pcall(J.resume,"script stopped")end pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(vf)if c.rejoining then return end D("REJOIN this server ("..vf..")")
pcall(gn)if c.autoload then pcall(ef,c.autoload)end qv()local E_=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,K)
end)task.delay(25,function()if c.alive then eg(vf..", same server failed")end end)return E_ end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=K:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local vg=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if vg then for L0,Fa in ipairs(vg:GetChildren())do local vh=Fa:FindFirstChild("SquishyPlaceHolder")local cN=vh and vh:FindFirstChild("TimerGui")
if cN and cN:IsA("BillboardGui")then if d.bb[cN]==nil then pcall(d.muteOne,cN)elseif cN.Enabled then d.bb[cN]=true cN.Enabled=false end
end end end local Fb,dw=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Fb and type(dw)=="number"then
d.mem=dw d.memPeak=math.max(d.memPeak,dw)if(e.MemLimit or 0)>0 and dw>e.MemLimit then d.over=(d.over or 0)+((dw>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dw,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()D(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mS(h9)if type(h9)~="string"then return false end
h9=h9:lower()for L1,Fc in ipairs(c.sellWords)do if h9:find(Fc,1,true)then return true end end return false end
local function Fd()local vi=ag:FindFirstChild("Remotes")local mT=vi and vi:FindFirstChild("SellSquishy")if not(mT and mT:IsA("RemoteEvent"))then return false end
if not pcall(function()mT:FireServer()end)then return false end return ao(function()return ad()==nil end,1.5)
end local function Fe()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local vj=aq()local vk=vj and vj.HumanoidRootPart.Position local fn,vl for L2,dx in ipairs((c.plot or ak):GetDescendants())do
if dx:IsA("ProximityPrompt")and(mS(dx.ActionText)or mS(dx.ObjectText)or mS(dx.Name))then local vm=ps(dx)local mU=(vm and vk)and(vm-vk).Magnitude or 1e9
if mU<=400 and(not fn or mU<vl)then fn,vl=dx,mU end end end c.sellSpot=fn c.noSellSpot=(fn==nil)return fn end
local function vn()local h_=ad()if not h_ then c.holding=false return false end if aP(h_)then return false end
if q.isLimited(h_)then return false end local mV=am(W(h_))if Fd()then c.sold,c.holding,c.sellFails=c.sold+1,false,0
c.carryBlind,c.attrStale=z()+2.5,0 D("SOLD "..mV)return true end local dy=Fe()if dy then local vo=d4(dy)if vo then
cq(vo,dy)local vp=ad()if vp and not aP(vp)then local Ff,Fg=em(dy,function()return ad()==nil end,function()return dy.Enabled end)
if Ff then c.sold,c.holding,c.sellFails=c.sold+1,false,0 D(("SOLD %s at %s via %s"):format(mV,gi(dy),Fg))return true
end end end end c.sellFails=c.sellFails+1 D("could not sell "..mV.." ("..c.sellFails..")")return false end local Fh={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Fi(dz)local ia=gi(dz):lower()for L3,Fj in ipairs(Fh)do if ia:find(Fj,1,true)then return 0 end end
local bc,as=dz.Name:lower(),0 local function a0(Fk,Fl)return Fk:find(Fl,1,true)~=nil end if a0(bc,"collect")then as=as+60 end
if a0(bc,"cash")or a0(bc,"money")then as=as+45 end if a0(bc,"income")or a0(bc,"claim")then as=as+35 end if a0(bc,"coin")or a0(bc,"earn")or a0(bc,"green")then as=as+20 end
if bc=="pad"or bc=="touch"then as=as+25 end if as==0 and(a0(ia,"collect")or a0(ia,"cash")or a0(ia,"money"))then as=25 end
if as==0 then return 0 end local fo=dz.Color if fo.G>0.5 and fo.G>fo.R*1.4 and fo.G>fo.B*1.4 then as=as+15 end
if math.min(dz.Size.X,dz.Size.Y,dz.Size.Z)<2 then as=as+5 end return as end local function Fm()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local ib,fp,mW={},nil,29 for L4,ic in ipairs(c.plot:GetDescendants())do
if ic:IsA("BasePart")then local ie=Fi(ic)if ie>0 then ib[#ib+1]={s=ie,p=ic}if ie>mW then fp,mW=ic,ie end end end
end table.sort(ib,function(Fn,Fo)return Fn.s>Fo.s end)c.padCands,c.padPart=ib,fp if fp then D("collect pad: "..gi(fp).." (score "..mW..")")end
return fp end local mX="SAB_pad_v1.txt"local function Fp(Fq)if type(writefile)=="function"then pcall(writefile,mX,table.concat({Fq:GetComponents()},","))end
end local function Fr()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Fs,vq=pcall(function()if isfile(mX)then return readfile(mX)end end)
if not Fs or type(vq)~="string"then return nil end local ig={}for Ft in vq:gmatch("[^,]+")do ig[#ig+1]=tonumber(Ft)end
if#ig==12 then return CFrame.new(unpack(ig))end end local function Fu(mY,ih,Fv)local Fw=db(mY)local mZ=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local a1=(mZ and mZ:IsA("BasePart"))and(mZ.Position-ih)or Vector3 .new(1,0,0)a1=Vector3 .new(a1 .X,0,a1 .Z)if a1 .Magnitude<0.05 then a1=Vector3 .new(1,0,0)end
a1=a1 .Unit for Fx=0,7 do local ii=Fx*math.pi/4 local Fy=Vector3 .new(a1 .X*math.cos(ii)-a1 .Z*math.sin(ii),0,a1 .X*math.sin(ii)+a1 .Z*math.cos(ii))
local ij=ih+Fy*(Fv+5)local m0=gX(ij.X,ih.Y,ij.Z)if m0 and math.abs(m0 .Y-ih.Y)<8 then aE(mY,Vector3 .new(ij.X,m0 .Y+Fw,ij.Z))
if kp(mY,0.7)then return true end end end return false end local function Fz()c.lastCollect=z()local fq=aq()if not fq then return end
local vr,FA=fq.HumanoidRootPart,db(fq)local fr,vs,fs,m1=nil,4,nil,"?"local m2=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and m2 and m2:IsA("BasePart")then fr,m1=(m2 .CFrame*c.manualPad).Position,"manual pad"else local bw=Fm()
if bw then fr=Vector3 .new(bw.Position.X,bw.Position.Y+bw.Size.Y/2+FA,bw.Position.Z)vs,fs,m1=math.max(bw.Size.X,bw.Size.Z)/2,bw,bw.Name
end end if not fr then D("COLLECT: pad not found - stand on it and tap SET PAD")return end local m3=bk()aE(fq,fr)
if fs and type(firetouchinterest)=="function"then pcall(firetouchinterest,vr,fs,0)end ah(e.PadDwell)if fs and type(firetouchinterest)=="function"then pcall(firetouchinterest,vr,fs,1)end
ah(0.5)c.collected=c.collected+1 local m4=bk()D(("COLLECTED (%s) %s"):format(m1,(m3 and m4 and m4>m3)and("+$"..av(m4-m3))or"no cash change seen"))
Fu(fq,fr,vs)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.isLimited(vt)if type(vt)~="string"then return false end
local vu=W(vt)if ae.rar[vu]=="Limited"then return true end pcall(q.mods)for FB,vv in pairs(q.si or{})do if type(vv)=="table"and vv.rarity=="Limited"and W(FB)==vu then return true end
end return false end function q.limitedHere()local m5=e.MainAccount return type(m5)~="string"or m5==""or m5:lower()==K.Name:lower()
end function q.mods()if q.si and z()-q.modAt<120 then return true end local vw=ag:FindFirstChild("Modules")if not vw then return false end
local function m6(FC)local vx=vw:FindFirstChild(FC)if not vx then return nil end local FD,vy=pcall(require,vx)
return(FD and type(vy)=="table")and vy or nil end q.si,q.arm,q.ci=m6("SquishyInfo"),m6("AutoRollRules"),m6("CrateInfo")
q.modAt=z()if not q.si then return false end local m7={}if q.arm and type(q.arm.tierOf)=="table"then for m8 in pairs(q.arm.tierOf)do
local ik=q.si[m8]if type(ik)=="table"and ik.rarity~="Limited"and not ik.incomeType and not ik.hiddenAfter then m7[W(m8)]=m8 end
end end q.roll=m7 local il={}for FE,FF in pairs(m7)do local ft=q.si[FF]if type(ft)=="table"and type(ft.income)=="number"and not ft.incomeType then
il[#il+1]={k=FE,inc=ft.income,pr=tonumber(ft.price)or 0}end end table.sort(il,function(m9,m_)if m9 .inc~=m_.inc then return m9 .inc>m_.inc end return m9 .pr>m_.pr end)
q.order=il local im,na,nb local FG=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for FH,nc in pairs(FG)do
local nd=type(nc)=="table"and tonumber(nc.price)if nd and(not na or nd>na)then im,na,nb=FH,nd,nc.title end end
q.bestCrate,q.bestCrateName=im and M.key(im),im q.bestCrateTitle=nb and M.key(nb)or nil return true end function q.rank(FI)
local FJ,FK=pcall(function()return q.arm.rankOf(FI)end)return(FJ and tonumber(FK))or 0 end function q.loadDisc(vz)
if type(vz)~="table"then return end local vA={}for FL,FM in pairs(vz)do if FM then vA[W(tostring(FL))]=true end end
q.disc,q.discAt=vA,z()end function q.fetch()q.discAt=z()local vB=ag:FindFirstChild("Remotes")local vC=vB and vB:FindFirstChild("GetSquishiesDiscovered")
if not vC then return end local FN,FO=pcall(function()return vC:InvokeServer()end)if FN then q.loadDisc(FO)end
end function q.scanWax()local ne={}local vD=c.plot and c.plot:FindFirstChild("WaxStations")if vD then for L5,vE in ipairs(vD:GetChildren())do
local vF=vE:FindFirstChild("SquishyPlaceHolder")if vF and vE:GetAttribute("HasSquishy")then for L6,vG in ipairs(vF:GetChildren())do if vG:IsA("Model")then ne[W(vG.Name)]=true end end
end end end for vH,FP in pairs(q.placedAt)do if z()-FP<20 then ne[vH]=true else q.placedAt[vH]=nil end end q.waxing=ne
end function q.compute()local vI,nf,ng={},0,0 if q.disc then for nh in pairs(q.roll or{})do if not q.disc[nh]then
if q.waxing[nh]then ng=ng+1 else vI[nh],nf=true,nf+1 end end end end q.need,q.nNeed,q.nWax=vI,nf,ng local vJ,ni={},e.Best or 0
local nj=(ni==4)and q.stackMin or nil for FQ,vK in ipairs(q.order)do if(nj and vK.inc>nj)or(not nj and FQ<=(ni==4 and 1 or ni))then vJ[vK.k]=true end
end q.best=vJ end function q.readStack()q.stackAt=z()local vL=ag:FindFirstChild("Remotes")local vM=vL and vL:FindFirstChild("EditStack")
if not vM then return end local FR,dA=pcall(function()return vM:InvokeServer("State",nil)end)if not(FR and type(dA)=="table"and type(dA.state)=="table"and type(dA.state.entries)=="table")then return end
local io for L7,vN in ipairs(dA.state.entries)do local fu=type(vN)=="table"and q.si and q.si[tostring(vN.name)]
if type(fu)=="table"and type(fu.income)=="number"and not fu.incomeType and(not io or fu.income<io)then io=fu.income end
end q.stackMin=io q.stackFull=#dA.state.entries>=(tonumber(dA.state.capacity)or 100)end function q.want(nk)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[nk]then return true end elseif e.Targets[nk]then return true end return e.AutoIndex==true and q.need[nk]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(FS)local fv=W(FS)q.placedAt[fv],q.waxing[fv]=z(),true if q.need[fv]then q.need[fv],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
D(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(am(fv)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fw,fy={},{}for FV,FW in pairs(q.roll or{})do if q.want(FV)then fw[FW]=true end end
for vO,nl in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if M.wanted(vO)or(type(nl)=="table"and type(nl.title)=="string"and M.wanted(nl.title))then fy[vO]=true end
end if not next(fw)and not next(fy)then return nil end if q.arm and type(q.arm.encode)=="function"then local FX,vP=pcall(q.arm.encode,{rarities={},butters=fw,crates=fy,index=false})
if FX and type(vP)=="string"then return vP end end local function vQ(FY)local ip={}for FZ in pairs(FY)do ip[#ip+1]=FZ end table.sort(ip)return table.concat(ip,",")end
local fz="adv:"if next(fw)then fz=fz..";butters:"..vQ(fw)end if next(fy)then fz=fz..";crates:"..vQ(fy)end return fz
end function q.canon(F0)local iq={}for vR in tostring(F0 or""):gmatch("[^;]+")do local nm,vS=vR:match("^(%a+):(.*)$")
if not nm then nm,vS="r",vR:gsub("^adv:","")end for F1 in vS:gmatch("[^,]+")do iq[#iq+1]=nm.."="..F1 end end table.sort(iq)
return table.concat(iq,"|")end function q.sync(F2)if K:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cO=q.rulesNow()if not cO or#cO>1900 then return end if q.canon(K:GetAttribute("AutoRollRules"))==q.canon(cO)then q.fails=0 return end
if not F2 and z()-q.sentAt<4 then return end local vT=ag:FindFirstChild("Remotes")local vU=vT and vT:FindFirstChild("AutoRollAction")
if not vU then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 D("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()E.replaying=true pcall(function()vU:FireServer("Rules",cO)end)E.replaying=false e.ARrules=cO
local ir,is=0,0 for L8 in(cO:match("butters:([^;]*)")or""):gmatch("[^,]+")do ir=ir+1 end for L9 in(cO:match("crates:([^;]*)")or""):gmatch("[^,]+")do is=is+1 end
local vV=ir.."/"..is if q.told~=vV then q.told=vV D(("auto roll now stops on %d butters and %d crates"):format(ir,is))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aS={}if e.AutoIndex then aS[#aS+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fA=0 for L_ in pairs(q.best)do fA=fA+1 end
aS[#aS+1]=fA==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fA,fA==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aS[#aS+1]="best: "..am(q.order[1].k)end if e.BestCrate and q.bestCrateName then aS[#aS+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if P.got>0 then aS[#aS+1]="shower: "..P.got end q.msg=#aS>0 and table.concat(aS," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(F3)q.feed[#q.feed+1]=os.date("%H:%M ")..F3 if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vW,az,it)if vW~="Effect"then q.feedAdd(tostring(vW)..(az~=nil and(": "..tostring(az):sub(1,80))or""))
return end if az~="ShowerTaken"and az~="GoalPoint"then q.feedAdd(tostring(az))end if az=="Shower"then P.add(it)return end
if az=="ShowerTaken"then P.gone(it)return end if az=="ShowerClear"then P.drops={}return end if az=="WaxGlow"then
local nn=type(it)=="table"and tonumber(it.SnapAt)if nn then q.snapAt=nn D(("ADMIN: every wax finishes in %ds%s"):format(math.floor(nn-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end az=tostring(az)cm("Admin "..az)if az~="GoalPoint"and z()-(q.heard[az]or-100)>30 then q.heard[az]=z()
D("ADMIN: "..az)end end P.drops,P.tried,P.got,P.miss={},{},0,0 function P.add(no)if type(no)~="table"or type(no.Pieces)~="table"then return end
for Ma,a2 in pairs(no.Pieces)do if type(a2)=="table"and a2 .Id~=nil and a2 .Position~=nil then P.drops[a2 .Id]={id=a2 .Id,butter=tostring(a2 .Butter or"?"),rar=tostring(a2 .Rarity or"?"),star=a2 .Star==true,
pos=a2 .Position,opens=tonumber(a2 .OpensAt)or 0,ends=tonumber(a2 .ExpiresAt)or 0}end end end function P.gone(fB)
if type(fB)~="table"or fB.Id==nil then return end P.drops[fB.Id]=nil if tonumber(fB.UserId)==o.uid then P.mine=fB.Id end
end function P.pick()local np=o.srv()local nq,vX for vY,cP in pairs(P.drops)do if np>=cP.ends-0.3 then P.drops[vY]=nil
elseif np>=cP.opens-0.2 and(P.tried[vY]or 0)<3 then local vZ=(aP(cP.butter)and 1e6 or 0)+(cP.star and 1e5 or 0)+q.rank(cP.rar)*100-(cP.ends-np)
if not nq or vZ>vX then nq,vX=cP,vZ end end end return nq end function P.due()return e.Shower and c.running and next(P.drops)~=nil and not ad()and P.pick()~=nil
end function P.grab()local aT,nr=P.pick(),aq()if not(aT and nr)then return end P.tried[aT.id]=(P.tried[aT.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aE(nr,aT.pos+Vector3 .new(0,db(nr)+0.5,0))ao(function()return P.mine==aT.id or ad()~=nil or not P.drops[aT.id]end,1.5)
if P.mine==aT.id or ad()then P.got,P.drops[aT.id]=P.got+1,nil D(("GRABBED %s [%s]%s from the admin shower"):format(am(W(aT.butter)),aT.rar,aT.star and" (star)"or""))
elseif not P.drops[aT.id]then P.miss=P.miss+1 end end local fC local function v0()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 D("trying again after being stopped for 5 minutes")fC(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not aq()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bF(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local ns,v1=gk()
local dB=ad()if dB then local b0=am(W(dB))if q.isLimited(dB)and not q.limitedHere()then return nil,("holding %s - Limited butters go to %s, never waxed or sold here"):format(b0,e.MainAccount),"wait"
end if not aP(dB)and not q.isLimited(dB)then local nt=(ab.gift and W(ab.gift)==W(dB)and z()-ab.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(b0,nt),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(b0,nt),"bad"end return"sell",("selling %s (%s)"):format(b0,nt),"warn"
end if e.NoWax then return nil,("holding %s - no waxing on this account (it is given away)"):format(b0),"wait"end
if ns<1 then return nil,("holding %s - 0 free stations"):format(b0),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(b0),"wait"end
return"place",("waxing %s (%d free)"):format(b0,ns),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local nu=c.plot:FindFirstChild("CrateStand")if nu then for Mb,fD in ipairs(nu:GetDescendants())do
if fD:IsA("ProximityPrompt")and fD.Enabled and kG(fD)then local bx=fD.ObjectText if bx==""then bx=c5(nu,"TitleLabel")or""end
if bx~=""and M.wanted(bx)then local F4=gg(bx):gsub("crate$","")local v2 for v3 in pairs(ae.members)do if gg(v3)==F4 then v2=v3 end end
j.waiting,j.at,j.title,j.prompt=true,z(),bx,fD j.data={name=(bx:gsub("%s","")),rarity=v2,title=bx}D(bx.." found waiting on your stand")
end break end end end end local v4=M.wanted(j.data and j.data.name)or M.wanted(j.title)if e.Crates and(j.on or j.waiting)and v4 then
local a3=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a3),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 D("could not press the "..a3 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a3),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a3),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a3,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a3),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a3,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a3,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil D("trying the "..a3 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a3),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a3,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not v4 then local v5=j.title..tostring(j.rolledAt)if j.told~=v5 then j.told=v5 D(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and M.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if ns<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(v1,v1),"wait"
end local nv=pG()if not nv then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dC=ck()
if dC and q4(dC.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dC.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dC.name),"bad"end if not rn()then return nil,("%s rolled - waiting for it to land on the stand"):format(dC.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dC.name),"ok"end local b1=kn()if b1 .state~="match"then
c.matchSince=nil if b1 .state=="skip"and not nv.Enabled then return nil,b1 .text.." (sold out)","idle"end return nil,b1 .text,b1 .level
end if not nv.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local dD=z()if dD<c.noCashUntil then
local v6,F5=cl()if v6 then return nil,("cash short: have $%s, price ~$%s"):format(av(v6),av(F5)),"bad"end return nil,(cl()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
av(bk()),math.ceil(c.noCashUntil-dD)),cl()and"bad"or"wait"end if dD-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
do local v7,v8=cl()if v7 then c.noCashUntil=dD+8 return nil,("cash short: have $%s, price %s - not buying"):format(av(v7),v8==math.huge and"unreadable"or("~$"..av(v8))),"bad"
end end c.matchSince=c.matchSince or dD local v9=dD-c.matchSince if v9<e.Confirm then return nil,("confirming %s (%.2fs)"):format(b1 .shown,v9),"ok"end
return"buy",("buying %s via %s"):format(b1 .shown,b1 .src),"ok"end d.DEPTH=11 function d.pinTick()local v_=d.hold
if not v_ then return end local nw=K.Character local nx=nw and nw:FindFirstChild("HumanoidRootPart")if not nx then return end
nx.CFrame=v_ nx.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Mc,iu in ipairs(nw:GetChildren())do if iu:IsA("BasePart")and iu.CanCollide then d.noclip[iu]=true iu.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(F6,wa)d.hold=F6 if wa then d.surface=wa end end function d.unpin(F7)
if not d.hold then return end d.hold=nil for wb in pairs(d.noclip)do pcall(function()if wb.Parent then wb.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local wc=aq()if wc and d.surface and not F7 then aE(wc,d.surface.Position,d.surface.Position+d.surface.LookVector)
ah(0.1)end end function d.home()local by,wd=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),aq()
if not(by and by:IsA("BasePart")and wd)then return nil end local we=pv()or by.Position local iv=Vector3 .new(we.X-by.Position.X,0,we.Z-by.Position.Z)
iv=iv.Magnitude>0.1 and iv.Unit or Vector3 .new(0,0,1)local iw=by.Position+iv*6 local wf=gX(iw.X,by.Position.Y,iw.Z,{by})
return CFrame.new(iw.X,(wf and wf.Y or by.Position.Y)+db(wd),iw.Z)end function d.ground(F8,wg,F9)local ny,nz={K.Character},nil
for Md=1,12 do local nA=RaycastParams.new()nA.FilterType=Enum.RaycastFilterType.Exclude nA.FilterDescendantsInstances=ny
local ix=ak:Raycast(Vector3 .new(F8,wg,F9),Vector3 .new(0,-2000,0),nA)if not ix then break end nz,wg=ix,ix.Position.Y-0.05
ny[#ny+1]=ix.Instance end return nz and nz.Position.Y end function d.parkHome()local nB=d.home()if not nB then return false end
local dE=nB.Position local F_=d.ground(dE.X,dE.Y+300,dE.Z)or(dE.Y-3)d.pin(CFrame.new(dE.X,F_-8,dE.Z),nB)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(iy)e.Ghost,e.GhostHelps=iy==2,iy==1 if iy<2 then task.spawn(function()while c.busy do ah(0.1)end
if d.ghostMode()<2 and d.hold and not F.home then pcall(d.unpin)end end)end d.paintGhost()D("ghost: "..d.GHOST[iy][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local Ga=aq()if not Ga or H.seat()then return end d.parkHome()end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.uid()local Gb,Gc=pcall(function()return K.UserId end)return Gb and Gc or 0 end function H.seat()local wh=ak:FindFirstChild("NightSeats")
if wh then for Me,nC in ipairs(wh:GetChildren())do if nC.Name=="LogSeat"and nC:GetAttribute("Occupant")==H.uid()then return nC end
end end local wi=K.Character local wj=wi and wi:FindFirstChildOfClass("Humanoid")local nD=wj and wj.SeatPart return(nD and nD.Name=="LogSeat")and nD or nil
end function H.logs()local wk=ak:FindFirstChild("NightSeats")local nE,nF={},{}for Mf,cQ in ipairs(wk and wk:GetChildren()or{})do
local nG=cQ.Name=="LogSeat"and cQ:FindFirstChildOfClass("ProximityPrompt")if nG then nE[#nE+1]=cQ local nH=cQ:GetAttribute("Occupant")
local Gd=(nH~=nil and nH~=0 and nH~="")or(cQ:IsA("Seat")and cQ.Occupant~=nil)if not Gd and nG.Enabled then nF[#nF+1]={st=cQ,p=nG}end
end end return nE,nF end function H.due()if not(e.Campfire and c.running)or z()<H.nextAt then return false end
local Ge=ak:FindFirstChild("NightSeats")if not Ge then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire now (weather events)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or z()H.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(K:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
D(H.msg)return false end end return true end function H.sit()local Gf,fE=ak:FindFirstChild("NightSeats"),aq()
if not Gf or not fE then return end local iz,fF=H.logs()if#iz==0 then local Gg=ak:FindFirstChild("NightCampfire")
local Gh,nI=pcall(function()return Gg:GetPivot().Position end)if not Gh then H.nextAt,H.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()K:RequestStreamAroundAsync(nI,3)end)aE(fE,nI+Vector3 .new(0,3,9),nI)ao(function()iz,fF=H.logs()return#iz>0 end,6)
if#iz==0 then H.nextAt,H.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local wl=fE.HumanoidRootPart.Position
if#fF==0 then H.nextAt,H.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fF,function(Gi,Gj)return(Gi.st.Position-wl).Magnitude<(Gj.st.Position-wl).Magnitude end)
local nJ,Gk=fF[1].st,fF[1].p d.unpin(true)local dF=nJ:IsA("BasePart")and nJ.CFrame or CFrame.new(nJ:GetPivot().Position)
aE(fE,dF.Position+dF.LookVector*2+Vector3 .new(0,2.5,0),dF.Position)ah(0.25)local Gl=em(Gk,function()return H.seat()~=nil end)
if not Gl then aE(fE,dF.Position+Vector3 .new(0,2,0),dF.Position+dF.LookVector)ao(function()return H.seat()~=nil end,1.5)
end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,z()D(("SAT at the campfire (+%s%% cash)"):format(tostring(K:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=z()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then D(H.msg)end end end J.msg,J.nextAt,J.at,J.pulls,J.claims,J.pullLeft,J.collectLeft,J.events="",0,0,0,0,0,0,{}
function J.refresh()J.at=z()local nK=ag:FindFirstChild("Remotes")if not nK then return end local fG,nL,dG=0,0,{}
local wm,dH=pcall(function()return nK.ClanRequest:InvokeServer("state")end)if wm and type(dH)=="table"and type(dH.data)=="table"then dH=dH.data end
local wn=wm and type(dH)=="table"and dH.tasks for Mg,b2 in ipairs(wn and wn.list or{})do if not b2 .done and b2 .kind=="pull"then fG=math.max(fG,(b2 .goal or 0)-(b2 .progress or 0))end
if not b2 .done then dG[#dG+1]=("%s %d/%d"):format(tostring(b2 .text),b2 .progress or 0,b2 .goal or 0)end end
J.events={}for Mh,dI in ipairs(nK:GetChildren())do if dI:IsA("RemoteFunction")and dI.Name:match("^%u%a+Action$")and dI.Name~="CrateAction"and dI.Name~="AutoRollAction"then
local Gm,fH=pcall(function()return dI:InvokeServer("state")end)if Gm and type(fH)=="table"and fH.live==true and type(fH.quests)=="table"then
J.events[#J.events+1]={r=dI,st=fH}for Mi,aU in ipairs(fH.quests)do if not aU.done and aU.kind=="pull"then fG=math.max(fG,(aU.goal or 0)-(aU.progress or 0))end
if not aU.done and aU.kind=="collect"then nL=math.max(nL,(aU.goal or 0)-(aU.progress or 0))end if not aU.done then dG[#dG+1]=("%s %d/%d"):format(tostring(aU.text),aU.progress or 0,aU.goal or 0)end
end end end end J.pullLeft,J.collectLeft=fG,nL J.msg=#dG>0 and("open: "..table.concat(dG,", "))or"all quests done for today"
end function J.claim()for Mj,fI in ipairs(J.events)do local wo=fI.r.Name:gsub("Action$","")for Mk,dJ in ipairs(fI.st.quests)do
if dJ.done and not dJ.claimed then local Gn,wp=pcall(function()return fI.r:InvokeServer("claimQuest",dJ.id)end)
if Gn and not(type(wp)=="table"and wp.ok==false)then J.claims=J.claims+1 D(("CLAIMED %s quest: %s (+%s)"):format(wo,tostring(dJ.text),tostring(dJ.points or dJ.treats or"?")))
end ah(0.4)end end if fI.st.bonusReady==true then local Go=pcall(function()return fI.r:InvokeServer("claimBonus")end)
if Go then D(("CLAIMED %s daily quest bonus"):format(wo))end ah(0.4)end end end function J.tick()if not(e.Quests and c.running)then
if J.arPaused then J.resume("quests switched off")end return end if z()-J.at<(J.pullLeft>0 and 20 or 90)then return end
J.refresh()pcall(J.claim)if J.pullLeft<=0 and J.arPaused then J.resume("lever quests done")end end function J.pullDue()
return e.Quests and c.running and J.pullLeft>0 and z()>=J.nextAt and not E.busy end function J.lever()local wq=c.plot and c.plot:FindFirstChild("Lever")
local nM=wq and wq:FindFirstChild("Wheel")return nM and nM:FindFirstChildWhichIsA("ProximityPrompt"),nM end function J.resume(Gp)
J.arPaused=false if J.arWas then J.arWas=false e.AutoRoll=true task.spawn(E.apply,Gp)end end function J.pull()
local fJ,nN=J.lever()if not fJ or not nN or not nN:IsA("BasePart")then J.nextAt,J.msg=z()+300,"your lever was not found"return end
if not J.arPaused then J.arPaused=true J.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false E.apply("pulling the lever for a quest",true)
if E.isOn()then J.nextAt=z()+30 return end end D(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(J.pullLeft))
end if not fJ.Enabled then J.nextAt=z()+1 return end cq(nN,fJ)J.asked=nil if not(type(fireproximityprompt)=="function"and pcall(fireproximityprompt,fJ))then qR(fJ)end
J.pulls=J.pulls+1 J.pullLeft=J.pullLeft-1 ah(0.6)if J.asked then J.nextAt=z()+600 D(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(J.asked)))
J.resume("a butter the game wants kept is on the pad")return end J.nextAt=z()+2.5 if J.pullLeft<=0 then J.at=0 end
end F.skip,F.skipN,F.n,F.calls,F.fails,F.nextAt,F.msg,F.tries={},0,0,0,0,0,"off",{}function F.can(b3,Gq)local nO=b3:GetAttribute("PourOwner")
if type(nO)~="number"or nO==o.uid or not b3:GetAttribute("HasSquishy")then return false end if b3:GetAttribute("PourLong")~=true or b3:GetAttribute("PourFull")==true then return false end
local nP=b3:GetAttribute("PourId")if nP==nil or F.skip[nP]then return false end local wr,nQ,Gr=b3:GetAttribute("Helpers"),0,tostring(o.uid)
if type(wr)=="string"then for Gs in wr:gmatch("[^,%s]+")do nQ=nQ+1 if Gs==Gr then return false end end end if nQ>=6 then return false end
local iA=A.left(b3)if not iA then local ws=tonumber(b3:GetAttribute("PourEnd"))iA=ws and(ws-Gq)end if not iA or iA<=75 then return false end
local nR=game:GetService("Players"):GetPlayerByUserId(nO)if not nR or nR:GetAttribute("WaxHelpOff")==true then return false end
return true,nR,nP end function F.list()local nS,Gt={},o.srv()local wt=ak:FindFirstChild("Plots")for Ml,wu in ipairs(wt and wt:GetChildren()or{})do
local wv=wu~=c.plot and wu:FindFirstChild("WaxStations")for Mm,nT in ipairs(wv and wv:GetChildren()or{})do local Gu,Gv,Gw=F.can(nT,Gt)
local nU=Gu and nT:FindFirstChild("SquishyPlaceHolder")if nU and nU:IsA("BasePart")then nS[#nS+1]={st=nT,p=Gv,id=Gw,part=nU}end
end end return nS end function F.due()local ww=(e.MemLimit or 0)>0 and math.floor(e.MemLimit*0.72)or 900 if e.Help and c.running and z()>=F.nextAt and(d.mem or 0)>ww then
F.nextAt,F.msg=z()+30,("paused - memory %d MB > %d MB (helps load other bases)"):format(d.mem,ww)return false
end return e.Help and c.running and z()>=F.nextAt end function F.skipIt(wx,wy)F.skip[wx],F.skipN=wy,F.skipN+1
if F.skipN>600 then F.skip,F.skipN,F.tries={[wx]=wy},1,{}end end function F.goHome()local iB,b4=aq(),F.home F.home=nil
if not(iB and b4)then return end if e.Ghost and not H.seat()then d.unpin(true)if not d.parkHome()then pcall(aE,iB,b4 .Position,b4 .Position+b4 .LookVector)end
elseif d.hold or(iB.HumanoidRootPart.Position-b4 .Position).Magnitude>20 then d.unpin(true)pcall(aE,iB,b4 .Position,b4 .Position+b4 .LookVector)
end end function F.step()local nV,fK=F.list(),aq()if#nV==0 or not fK then F.nextAt=z()+15 F.msg=("helped %d waxes here%s | none to help right now"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")
F.goHome()return end local wz=fK.HumanoidRootPart local wA=wz.Position table.sort(nV,function(Gx,Gy)return(Gx.part.Position-wA).Magnitude<(Gy.part.Position-wA).Magnitude end)
local a4=nV[1]F.home=F.home or(d.hold and d.surface)or wz.CFrame local b5=a4 .part local fL=(b5 .Position+a4 .st:GetPivot().Position)/2
local iC=F.tries[a4 .id]or 0 if(e.Ghost or e.GhostHelps)and iC==0 and not H.seat()then d.pin(b5 .CFrame,F.home)
else d.unpin(true)local nW=iC==0 and gX(fL.X,b5 .Position.Y,fL.Z,{b5})if nW and math.abs(nW.Y-b5 .Position.Y)<8 then
aE(fK,Vector3 .new(fL.X,nW.Y+db(fK),fL.Z),b5 .Position)else aE(fK,b5 .Position+Vector3 .new(0,b5 .Size.Y/2+3,0),fL)
end end ah(0.3)local fM=ag:FindFirstChild("Remotes")fM=fM and fM:FindFirstChild("ClanRequest")if not fM then F.nextAt,F.msg=z()+60,"the game's help remote is missing"return end
local iD,bz=pcall(function()return fM:InvokeServer("help",a4 .st:GetAttribute("PourOwner"),tonumber(a4 .st.Name))end)
if iD and type(bz)=="table"and bz.ok then F.n,F.fails=F.n+1,0 F.skipIt(a4 .id,"helped")D(("HELPED %s's wax (station %s)"):format(a4 .p.DisplayName,a4 .st.Name))
F.msg=("helped %d waxes here%s"):format(F.n,F.calls>0 and(", "..F.calls.." for the guild")or"")elseif iD and type(bz)=="table"and tostring(bz.reason or""):lower():find("walk up",1,true)and iC<2 then
F.tries[a4 .id]=iC+1 F.nextAt=z()+0.3 elseif iD and type(bz)=="table"and tostring(bz.reason or""):lower():find("moment",1,true)then
F.waits=(F.waits or 0)+1 F.nextAt=z()+1.6 else local wB=(iD and type(bz)=="table"and tostring(bz.reason or"refused"))or("error: "..tostring(bz))
F.skipIt(a4 .id,wB)F.fails=F.fails+1 if F.fails<=3 then D(("help refused for %s's wax: %s"):format(a4 .p.DisplayName,wB))end
if F.fails>=5 then F.fails,F.nextAt,F.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
F.goHome()end end F.nextAt=math.max(F.nextAt,z()+1.2)end function F.onCall(bA)if not e.HelpGuild or type(bA)~="table"or bA.p~="help"or bA.mine or bA.u==o.uid or not bA.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fN=ag:FindFirstChild("Remotes")
fN=fN and fN:FindFirstChild("ClanRequest")if not fN then return end local wC,fO=pcall(function()return fN:InvokeServer("callHelp",bA.u)end)
local wD=tostring(bA.n or bA.un or bA.u)if wC and type(fO)=="table"and fO.ok then F.calls=F.calls+1 D(("HELPED guildmate %s's wax from here (their call)"):format(wD))
else D(("guild call from %s: %s"):format(wD,(wC and type(fO)=="table"and tostring(fO.reason or"refused"))or tostring(fO)))
end end)end local function au(Gz,wE,...)if c.busy then return end c.busy,c.busyText=true,Gz if d.hold and wE~=F.step then pcall(d.unpin)end
local GA,wF=pcall(wE,...)c.busy,c.busyText=false,""if not GA and wF~=jz then D("ERR "..tostring(wF))end end local function GB()
if e.Campfire and H.seat()then if j.at and H.tickAt then j.at=j.at+(z()-H.tickAt)end H.tickAt=z()H.due()c.reason,c.level=H.msg,"ok"
return end H.tickAt=nil local aV,GC,GD=v0()c.reason,c.level=GC,GD if aV=="place"then au("waxing...",A.place)elseif aV=="crate"then au("opening crate...",ex,true)
elseif aV=="cratesmart"then au("opening crate...",j.smart)elseif aV=="cratewin"then au("opening the crate window...",kI)
elseif aV=="nocrate"then au("discarding crate...",ex,false)elseif aV=="cratedrop"then au("discarding a crate that would not open...",j.drop)
elseif aV=="sell"then au("selling...",vn)elseif aV=="buy"then au("buying...",qU,false)elseif not aV and not c.matchSince and P.due()then
au("grabbing a butter from the admin shower...",P.grab)elseif not aV and not c.matchSince and H.due()then au("sitting at the campfire...",H.sit)
elseif not aV and not c.matchSince and J.pullDue()and not ad()and not(ck()and aP(ck().name))then au("pulling the lever for a quest...",J.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(J.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
au("collecting money...",Fz)elseif not aV and not c.matchSince and F.due()then au("helping a wax...",F.step)elseif F.home and not e.Help then
au("coming back...",F.goHome)elseif not c.busy then d.parkTick()end end function fC(iE,GE)if iE==c.running then return end
c.running=iE if not GE then e.AutoStart=iE end if iE then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bF()or c.plot
D("START")else c.reason="stopped"D("STOP")end end do local bd=ec(ar.auto)if bd==nil then bd=ec(ar.autoOld)end
if type(bd)=="string"then bd=bd:gsub("%s+$","")if bd~=""then c.autoload=bd local GF=kg(bd)D(GF and("loaded config "..bd)or("config "..bd.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local GG={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local nX={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local af={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local wG,wH,wI,wJ=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if wG and wH and wI and wJ then af.x,af.b,af.m,af.r=wG,wH,wI,wJ end end)pcall(function()local wK=Enum.Font.RobotoMono if wK then af.mono=wK end end)
local function L(GH,GI,GJ)local GK,nY=pcall(Instance.new,GH)if not GK then c.uiErrs=c.uiErrs+1 return nil end
for GL,GM in pairs(GI)do if not pcall(function()nY[GL]=GM end)then c.uiErrs=c.uiErrs+1 end end nY.Parent=GJ return nY
end local function aa(GN,GO)L("UICorner",{CornerRadius=UDim.new(0,GO or 8)},GN)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(iF,nZ)if iF and a.shown[iF]~=nZ then a.shown[iF]=nZ iF.Text=nZ end
end function a.stroke(GP,GQ,GR)return L("UIStroke",{Color=GQ or l.line,Thickness=1,Transparency=GR or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},GP)
end function a.grad(GS,GT,GU,GV)local GW,wL=pcall(function()return ColorSequence.new(GT,GU)end)if GW and wL then return L("UIGradient",{Color=wL,Rotation=GV or 0},GS)end
end function a.pad(GX,wM,wN,GY,GZ)L("UIPadding",{PaddingLeft=UDim.new(0,wM or 0),PaddingTop=UDim.new(0,wN or 0),
PaddingRight=UDim.new(0,GY or wM or 0),PaddingBottom=UDim.new(0,GZ or wN or 0)},GX)end function a.list(G0,G1,G2)
return L("UIListLayout",{Padding=UDim.new(0,G1 or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=G2 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},G0)
end function a.ink(n0)local G3,G4=pcall(function()return 0.299*n0 .R+0.587*n0 .G+0.114*n0 .B end)return(G3 and G4>0.55)and l.ink or l.text
end function a.nextIn(wO)local wP=(a.ord[wO]or 0)+1 a.ord[wO]=wP return wP end local n1=K:FindFirstChildOfClass("PlayerGui")or K:WaitForChild("PlayerGui")
local wQ=n1:FindFirstChild("SABFarmGui")if wQ then wQ:Destroy()end local n2=L("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},n1)local T={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local iG=ak.CurrentCamera.ViewportSize if iG.X>100 and iG.Y>100 then T.w=math.clamp(math.floor(iG.X*0.48),320,400)
T.h=math.clamp(math.floor(iG.Y*0.86),250,360)end end)a.root=L("Frame",{Name="Root",Size=UDim2 .new(0,T.w,0,T.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},n2)
aa(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local wR=UDim2 .new(1,0,1,0)
local function Mn(wS,wT)return UDim2 .new(wS,0,0,0),UDim2 .new(wT,(wS+wT>0.99)and 0 or-4,1,0)end local function aj(G5,G6,fP,G7,G8,G9)
local n3=L("TextButton",{Text=G6,Position=G8,Size=G9,BackgroundColor3=fP,BorderSizePixel=0,Font=af.b,TextSize=G7,TextColor3=a.ink(fP),AutoButtonColor=true},G5)
aa(n3,8)if fP==l.panel2 or fP==l.raise or fP==l.panel then a.stroke(n3,l.line,0.4)end return n3 end local function iH(G_,Ha,Hb,Hc,Hd)
local iI=L("TextBox",{Text=Ha,PlaceholderText=Hb,Position=Hc,Size=Hd,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},G_)aa(iI,8)a.stroke(iI,l.line,0)a.pad(iI,9,0,6,0)
return iI end local iJ=ak.CurrentCamera local function He()local Hf,iK=pcall(function()return iJ and iJ.ViewportSize end)
if Hf and iK and iK.X>50 and iK.Y>50 then return iK end end local function b6(fQ)local n4=He()if not(n4 and fQ and fQ.Parent)then return end
local Hg=pcall(function()local iL,wU=fQ.AbsolutePosition,fQ.AbsoluteSize local n5=70 local wV=math.clamp(iL.X,n5-wU.X,n4 .X-n5)
local wW=math.clamp(iL.Y,0,n4 .Y-math.min(wU.Y,n5))if math.abs(wV-iL.X)>0.5 or math.abs(wW-iL.Y)>0.5 then fQ.Position=UDim2 .new(0,math.floor(wV),0,math.floor(wW))
end end)return Hg end local function iM(Hh)local Hi,n6=pcall(function()return Hh.AbsolutePosition end)if Hi and n6 then return{math.floor(n6 .X),math.floor(n6 .Y)}end
end local dK={}c.dragMoved={}local function wX(fR,wY,n7)V(fR.InputBegan:Connect(function(dL)if dL.UserInputType~=Enum.UserInputType.MouseButton1 and dL.UserInputType~=Enum.UserInputType.Touch then return end
local n8={start=dL.Position,from=wY.Position,moved=0,target=wY,input=dL,onDrop=n7}dK[fR],c.dragMoved[fR]=n8,0
local n9 n9=dL.Changed:Connect(function()if dL.UserInputState==Enum.UserInputState.End and dK[fR]==n8 then dK[fR]=nil
if n9 then n9:Disconnect()end if n7 then n7(n8 .moved)end end end)end))end V(pd.InputChanged:Connect(function(iN)
if iN.UserInputType~=Enum.UserInputType.MouseMovement and iN.UserInputType~=Enum.UserInputType.Touch then return end
for Hj,be in pairs(dK)do local n_=be.target if n_ and n_.Parent then local wZ,w0=iN.Position.X-be.start.X,iN.Position.Y-be.start.Y
be.moved=math.max(be.moved,math.abs(wZ)+math.abs(w0))c.dragMoved[Hj]=be.moved n_.Position=UDim2 .new(be.from.X.Scale,be.from.X.Offset+wZ,be.from.Y.Scale,be.from.Y.Offset+w0)
end end end))V(pd.InputEnded:Connect(function(iO)if iO.UserInputType~=Enum.UserInputType.MouseButton1 and iO.UserInputType~=Enum.UserInputType.Touch then return end
for Hk,iP in pairs(dK)do if iP.input==iO or iO.UserInputType==Enum.UserInputType.MouseButton1 then dK[Hk]=nil
if iP.onDrop then iP.onDrop(iP.moved)end end end end))local function Q(Hl,Hm,Hn,Ho,Hp,Hq,Hr)return L("TextLabel",{Text=Hm,Position=Hq or UDim2 .new(0,0,0,0),Size=Hr or wR,BackgroundTransparency=1,
Font=Hp and af.b or af.m,TextSize=Hn,TextColor3=Ho,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Hl)
end function a.row(w1,Hs)return L("Frame",{Size=UDim2 .new(1,0,0,Hs),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(w1)},w1)end function a.card(w2,w3,w4)local dM=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(w2)},w2)aa(dM,11)a.stroke(dM,l.line,0.25)a.list(dM,5)a.pad(dM,8,8,8,9)
if w3 then local oa=a.row(dM,14)L("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},oa)Q(oa,w3:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if w4 then local Ht=Q(oa,w4,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Ht.TextXAlignment=Enum.TextXAlignment.Right end end return dM end function a.heading(Hu,Hv,ob)local oc=a.row(Hu,ob and 34 or 22)
Q(oc,Hv,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=af.x if ob then Q(oc,ob,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return oc end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(od)local aN=a.sw[od]if not aN then return end
local dN=tostring(od.Text or""):match(":%s*(.-)%s*$")or""local b7=dN~=""and not a.OFF[dN]local oe=not aN.chips and(dN=="ON"or dN=="OFF")
aN.pill.Visible,aN.chip.Visible=oe,not oe if oe then aN.pill.BackgroundColor3=b7 and l.accent or l.panel2 aN.knob.Position=b7 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aN.knob.BackgroundColor3=b7 and l.white or l.dim else aN.chip.Text=dN~=""and dN or"-"aN.chip.BackgroundColor3=b7 and l.accent or l.panel2
aN.chip.TextColor3=b7 and l.ink or l.dim end od.BackgroundColor3=b7 and l.lit or l.raise if aN.edge then aN.edge.Color=b7 and l.accent or l.line aN.edge.Transparency=b7 and 0.55 or 0.45 end
end function a.switch(w5,Hw,Hx,fS)local a5=L("TextButton",{Name="Switch",Text=Hw,TextTransparency=1,TextSize=8,Font=af.b,
Size=UDim2 .new(1,0,0,fS and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(w5)},w5)
aa(a5,9)local ay={edge=a.stroke(a5,l.line,0.45)}ay.title=Q(a5,Hx,11,l.text,true,UDim2 .new(0,10,0,fS and 4 or 0),UDim2 .new(1,-100,0,fS and 15 or 28))
ay.title.TextWrapped,ay.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fS then ay.sub=Q(a5,fS,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
ay.sub.TextWrapped,ay.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end ay.pill=L("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a5)aa(ay.pill,9)ay.knob=L("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},ay.pill)aa(ay.knob,7)ay.chip=L("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=af.b,TextSize=9,TextColor3=l.dim,Text=""},a5)
aa(ay.chip,9)a.pad(ay.chip,10,0,10,0)L("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},ay.chip)
ay.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a5]=ay V(a5:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a5)end))
a.skin(a5)return a5 end function a.chips(of)if a.sw[of]then a.sw[of].chips=true a.skin(of)end end function a.line(Hy,Hz)
local w6=a.row(Hy,15)local w7=L("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Hz or l.dim,
BorderSizePixel=0},w6)aa(w7,3)local og=Q(w6,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))og.TextWrapped,og.TextTruncate=false,Enum.TextTruncate.AtEnd
return og,w7 end function a.grow(w8,HA,HB)local iQ=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=af.m,TextSize=HA or 10,TextColor3=HB or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(w8)},w8)
V(iQ:GetPropertyChangedSignal("Text"):Connect(function()iQ.Visible=iQ.Text~=""end))return iQ end function a.note(HC,HD)
local w9=a.grow(HC,9,l.dim)w9 .Text=HD return w9 end function a.actions(HE,w_)local HF=a.row(HE,28)local xa,oh={},#w_
for fT,xb in ipairs(w_)do xa[fT]=aj(HF,xb[1],xb[2]or l.panel2,10,UDim2 .new((fT-1)/oh,fT>1 and 3 or 0,0,0),UDim2 .new(1/oh,(fT>1 and-3 or 0)+(fT<oh and-3 or 0),1,0))
end return table.unpack(xa)end local function O(cR,iR,HG,HH)a.put(cR,iR and HG or HH)if not a.sw[cR]and a.lit[cR]~=iR then
a.lit[cR]=iR cR.BackgroundColor3=iR and l.accent or l.panel2 cR.TextColor3=a.ink(cR.BackgroundColor3)end end a.title=L("Frame",{Size=UDim2 .new(1,0,0,T.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
aa(a.title,14)L("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
L("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local oi=L("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
aa(oi,8)a.grad(oi,l.accent,l.accent2,45)local xc=Q(oi,"C",16,l.ink,true)xc.Font,xc.TextXAlignment=af.x,Enum.TextXAlignment.Center
local HI=Q(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))HI.Font=af.x Q(a.title,"butter farm  "..cd,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local HJ=a.list(a.tabs,3)pcall(function()HJ.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((T.h-T.head-12)/10)-3,20,34)local function bf(HK,HL,HM)
local iS=L("TextButton",{Text=HK,Font=af.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)aa(iS,9)local xd=L("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iS)aa(xd,2)a.tabsAll[#a.tabsAll+1]={b=iS,bar=xd,name=HL,sub=HM}return iS end
a.tabFarm=bf("🏠","Home","what the farm is doing")a.tabRun=bf("🌾","Farm","the buy - wax - collect loop")a.tabBut=bf("🧈","Butters","what gets bought and waxed")
a.tabCrt=bf("📦","Crates","which crates get opened")a.tabPet=bf("🐾","Pets","adopt, wish, fuse")a.tabTeam=bf("👥","Teams","the right pets at the right moment")
a.tabSrv=bf("🤝","Server","helping, campfire, ghost")a.tabAdm=bf("⚡","Admin","admin abuse and its boosts")a.tabSet=bf("⚙","Settings","configs, startup, performance")
a.tabAlt=bf("🔗","Alts","several accounts working together")local function bh()local oj=L("ScrollingFrame",{Position=UDim2 .new(0,T.rail,0,T.head+T.status+10),
Size=UDim2 .new(1,-T.rail,1,-(T.head+T.status+10)),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,
CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)
a.list(oj,8)a.pad(oj,8,2,10,12)return oj end a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bh(),bh(),bh(),bh(),bh(),bh(),bh(),bh(),bh()
a.farm.Visible=true a.alt=bh()do local fU=a.farm local xe=a.row(fU,34)a.startB=aj(xe,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=af.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(xe,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local HN=a.row(fU,44)local function fV(xf,HO,xg)local iT=L("Frame",{Position=UDim2 .new((xf-1)/xg,xf>1 and 2 or 0,0,0),Size=UDim2 .new(1/xg,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},HN)aa(iT,9)a.stroke(iT,l.line,0.3)local iU=Q(iT,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iU.Font,iU.TextXAlignment,iU.TextWrapped=af.x,Enum.TextXAlignment.Center,false local HP=Q(iT,HO,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
HP.TextXAlignment=Enum.TextXAlignment.Center return iU end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fV(1,"BOUGHT",5),fV(2,"WAXED",5),fV(3,"SOLD",5),fV(4,"MONEY",5),fV(5,"FREE",5)
local xh=a.card(fU,"Right now")a.info=Q(a.row(xh,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=Q(a.row(xh,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fW=a.card(fU,"Systems")
a.helpL=a.line(fW,l.info)a.campL=a.line(fW,l.accent2)a.questL=a.line(fW,l.good)a.arL=a.line(fW,l.accent)a.ixL=a.line(fW,nX.Dotonbori)
local xi=a.card(fU,"Activity")a.log=L("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(xi)},xi)
aa(a.log,7)a.pad(a.log,7,5,7,5)end local function Mo(HQ,HR)return a.row(HR or a.farm,HQ)end local an do local ol=a.run
a.heading(ol,"Farm","buy what rolls, wax it, collect the cash")local fX=a.card(ol,"Loop")a.colT=a.switch(fX,"COLLECT: ON","Collect cash","step on the collector by itself")
an=a.row(fX,26)Q(an,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=iH(an,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
Q(an,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(an,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fX,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fX,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fX,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local om=a.card(ol,"By hand")
a.buyB,a.plB=a.actions(om,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(om,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
an=a.row(om,28)a.padB=aj(an,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=Q(an,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iV=a.but a.heading(iV,"Butters","what gets bought and waxed")local xj=a.card(iV,"Strategy")a.ixT=a.switch(xj,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(xj,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iV)},iV)a.list(a.butList,5)end do local iW=a.crt a.heading(iW,"Crates","only ticked crates are opened")
local xk=a.card(iW,"Opening")a.crateT=a.switch(xk,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(xk,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iW)},iW)a.list(a.crtList,5)end do local fY=a.pet a.heading(fY,"Pets","adopt, wish, fuse Bigs and Huges")
local fZ=a.card(fY,"Automatic")a.pbT=a.switch(fZ,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fZ,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fZ,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fZ,10,l.dim)a.note(fZ,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local xl=a.card(fY,"The plan","best teams with every pet")a.planInfo=a.grow(xl,10,l.text)a.note(xl,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fY)},fY)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iX=a.srv a.heading(iX,"Server","other players, the campfire, staying hidden")
local oo=a.card(iX,"Helping")a.helpT=a.switch(oo,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(oo,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(oo,l.info)
local xm=a.card(iX,"Campfire")a.campT=a.switch(xm,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(xm,l.accent2)local op=a.card(iX,"Ghost")a.ghostT=a.switch(op,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(op,l.dim)a.note(op,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local f0=a.adm a.heading(f0,"Admin abuse","the show, its boosts and the farm in it")local xn=a.card(f0,"When")
a.admBig=Q(a.row(xn,22),"-",15,l.text,true)a.admBig.Font=af.x a.admSub=Q(a.row(xn,14),"",10,l.dim,false)local HT=a.card(f0,"Boosts now")
a.admBoost=a.grow(HT,11,l.text)local oq=a.card(f0,"What the farm does")a.shT=a.switch(oq,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(oq,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(oq,l.accent)
local xo=a.card(f0,"Show feed")a.admFeed=L("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(xo)},xo)
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
local HU=a.card(cS,"Your game passes","read from the game")a.passInfo=a.grow(HU,10,l.text)local HV=a.card(cS,"About")
a.note(HV,"CHURN "..cd.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Mp,HW in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(HW)end local xp=L("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},n1)
a.tgRoot=L("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},xp)aa(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=L("TextButton",{Text="C",Size=wR,BackgroundTransparency=1,Font=af.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=L("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
aa(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=L("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=af.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
aa(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local f1=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[f1][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[f1][2]
a.tgGhost.BackgroundColor3=f1==2 and l.accent or(f1==1 and l.warn or l.panel)a.tgGhost.TextColor3=f1>0 and l.ink or l.dim
end end local bC={built=false,boxes={},at=0}function a.check(iZ,ov)iZ.Text=ov and"✓"or""iZ.BackgroundColor3=ov and l.accent or l.bg
iZ.TextColor3=l.ink local ow=iZ.Parent if ow and ow:IsA("TextButton")then ow.BackgroundColor3=ov and l.lit or l.raise end
end local function xq(xr,xs)e.Targets[xr]=xs or nil local xt=bC.boxes[xr]if xt then a.check(xt,xs)end end local function ox()
for HY,HZ in pairs(bC.boxes)do a.check(HZ,e.Targets[HY]==true)end end function a.tickBox(H0)local oy=L("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},H0)aa(oy,6)
a.stroke(oy,l.line,0)return oy end local f2 local function H1()local H2=a.card(a.butList,"Butter list")local oz=a.row(H2,26)
a.butInfo=Q(oz,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local H3=aj(oz,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local H4=aj(oz,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))H3 .MouseButton1Click:Connect(function()
for H5 in pairs(e.Targets)do e.Targets[H5]=nil end ox()end)H4 .MouseButton1Click:Connect(function()ae.at=0 ka()
f2(true)end)end f2=function(H6)if not ka()then if not a.butEmpty then a.butEmpty=Q(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bC.built and not H6 and bC.at==ae.at then return end for Mq,i0 in ipairs(a.butList:GetChildren())do
if i0:IsA("Frame")or i0:IsA("TextButton")or i0:IsA("TextLabel")then i0:Destroy()end end bC.boxes,a.butEmpty={},nil
H1()for Mr,i1 in ipairs(ae.rarOrder)do local oA=nX[i1]or l.text local cT=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)aa(cT,11)a.stroke(cT,oA,0.7)a.list(cT,4)a.pad(cT,7,7,7,8)
local oB=a.row(cT,22)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=oA,BorderSizePixel=0},oB)
local H7=Q(oB,i1:upper(),11,oA,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))H7 .Font=af.x local H8=aj(oB,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local H9=i1 H8 .MouseButton1Click:Connect(function()local xu=ae.members[H9]or{}local xv=false for Ms,H_ in ipairs(xu)do if not e.Targets[H_]then xv=true break end end
for Mt,Ia in ipairs(xu)do xq(Ia,xv)end end)for Mu,oC in ipairs(ae.members[i1]or{})do local i2=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cT)},cT)aa(i2,8)local xw=Q(i2,am(oC),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
xw.TextWrapped,xw.TextTruncate=false,Enum.TextTruncate.AtEnd local xx=a.tickBox(i2)bC.boxes[oC]=xx local xy=oC
local function xz()xq(xy,not e.Targets[xy])end i2 .MouseButton1Click:Connect(xz)xx.MouseButton1Click:Connect(xz)
end end ox()bC.built,bC.at=true,ae.at end function M.paint()for Ib,Ic in pairs(M.boxes)do a.check(Ic,e.CrateTicks[Ib]==true)end
if a.crtInfo then local oD,oE=0,0 for Mv in pairs(M.boxes)do oD=oD+1 end for Mw,Ie in pairs(e.CrateTicks)do if Ie then oE=oE+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(oD,oE))end if a.crateT then O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function M.build()for Mx,i3 in ipairs(a.crtList:GetChildren())do if i3:IsA("Frame")or i3:IsA("TextButton")or i3:IsA("TextLabel")then i3:Destroy()end
end M.boxes={}local oF=a.card(a.crtList,"All of them","worst first")local oG=a.row(oF,26)a.crtInfo=Q(oG,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local If=aj(oG,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Ig=aj(oG,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
V(If.MouseButton1Click:Connect(function()e.CrateTicks={}M.paint()end))V(Ig.MouseButton1Click:Connect(function()M.build()end))
for My,bD in ipairs(M.list())do local xA=nX[bD.rar or""]or l.text local dO=L("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(oF)},oF)aa(dO,8)L("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=xA,BorderSizePixel=0},dO)
local xC=Q(dO,(bD.title or bD.name)..(bD.guess and"  (?)"or""),11,xA,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
xC.TextWrapped,xC.TextTruncate=false,Enum.TextTruncate.AtEnd local Ih=Q(dO,bD.price and("$"..av(bD.price))or(bD.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Ih.TextXAlignment=Enum.TextXAlignment.Right local xD=a.tickBox(dO)M.boxes[bD.k]=xD local xE=bD.k local function xF()
e.CrateTicks[xE]=(not e.CrateTicks[xE])or nil M.paint()end V(dO.MouseButton1Click:Connect(xF))V(xD.MouseButton1Click:Connect(xF))
end M.built=M.at M.paint()end local xG="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set","alt"}
local function aW(cU)xG=cU for Ii,oH in ipairs(a.tabKeys)do a[oH].Visible=(oH==cU)local i4=a.tabsAll[Ii]if i4 then
local oI=oH==cU i4 .b.BackgroundTransparency,i4 .b.TextTransparency,i4 .bar.Visible=oI and 0 or 1,oI and 0 or 0.45,oI
end end if cU=="pet"and not o.built then pcall(o.build)end if cU=="team"and not A.built then pcall(A.build)end
if cU=="crt"and(M.built~=M.at or not next(M.boxes))then M.build()end if cU=="but"then f2(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(oJ,xH,xI,xJ)if xJ then oJ.Text=xJ end oJ.BackgroundColor3=xH and xI or l.bg oJ.TextColor3=xH and a.ink(xI)or l.dim
end function o.paintRow(xK)local cV=o.rows and o.rows[xK]if not cV then return end local cW=e.Pets[xK]or{}local xL=tonumber(cW.f)==-1
a.flag(cV.b,cW.b,l.good)a.flag(cV.g,cW.g,l.accent,cW.g and"BIG"or"ANY")a.flag(cV.w,cW.w,l.warn)a.flag(cV.f,not xL,l.good,xL and"KEEP"or"AUTO")
if cV.row then cV.row.BackgroundColor3=(cW.b or cW.w)and l.lit or l.raise end end function o.flag(oK,i5)local bi=e.Pets[oK]or{}
if i5=="f"then bi.f=tonumber(bi.f)~=-1 and-1 or nil elseif bi[i5]then bi[i5]=nil else bi[i5]=true end e.Pets[oK]=(bi.b or bi.g or bi.w or bi.f)and bi or nil
o.paintRow(oK)end function o.paintAll()for Ij in pairs(o.rows or{})do o.paintRow(Ij)end if a.pbT then O(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
O(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")O(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(Ik)local xM=y.dreamT if not xM then return"working the plan out..."end local Il,Im=y.needFor(""),y.needFor("Big")
local cX={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(Il,Im,y.slots())}for Mz,xN in ipairs(y.dreamTeams or{})do cX[#cX+1]=xN.team:upper()..": "..table.concat(xN.names,", ")end
local i6,i7,i8=0,0,0 for xO,xP in pairs(xM)do local xQ,In=y.have(xO,Ik)local MA,Io=y.goal(xO)i6=i6+math.max(0,xP.Huge-xQ.Huge)
i7=i7+math.max(0,xP.Big-xQ.Big)i8=i8+math.max(0,Io-In)end cX[#cX+1]=(i6+i7+i8==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(i6,i7,i8)if y.fuseMsg~=""then cX[#cX+1]=y.fuseMsg end
return table.concat(cX,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local oL=o.wishes()local dP=o.data()for i9,oM in pairs(o.rows)do local xR=y.status(i9,dP)oM.desc.Text=(oL[i9]and("wishing %dm | "):format(math.ceil(oL[i9]/60))or"")..(xR and(xR.." | ")or"")..oM.boostText
oM.desc.TextColor3=oL[i9]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dP))end local xS=tonumber(K:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dP and#(dP.pets or{})or 0,dP and tonumber(dP.maxOwned)or 60,
av(o.money()),xS>0 and(" | free wishes "..xS)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local i_=o.info()for MB,ja in ipairs(a.petList:GetChildren())do if ja:IsA("Frame")or ja:IsA("TextLabel")or ja:IsA("TextButton")then ja:Destroy()end
end o.rows={}if not i_ then Q(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dQ={}for MC,xT in ipairs(o.order())do local oN=i_.Pets[xT].rarity or"?"dQ[oN]=dQ[oN]or{}
table.insert(dQ[oN],xT)end local dR={}for MD,xU in ipairs(i_.Rarities or{})do if dQ[xU]then dR[#dR+1]=xU end end
for xV in pairs(dQ)do if not table.find(dR,xV)then dR[#dR+1]=xV end end for ME,oO in ipairs(dR)do local jb=o.RC[oO]or l.text
local cY=L("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
aa(cY,11)a.stroke(cY,jb,0.7)a.list(cY,4)a.pad(cY,7,7,7,8)local xW=a.row(cY,18)L("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=jb,BorderSizePixel=0},xW)
local Ip=Q(xW,oO:upper(),11,jb,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Ip.Font=af.x for MF,jc in ipairs(dQ[oO])do
local f3=L("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cY)},cY)
aa(f3,8)local oP=Q(f3,o.nice(jc),11,jb,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))oP.TextWrapped,oP.TextTruncate=false,Enum.TextTruncate.AtEnd
local Iq,Ir=pcall(function()return i_.describe(jc)end)local xX=Iq and tostring(Ir)or""local oQ=Q(f3,xX,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oQ.TextYAlignment,oQ.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function jd(Is,It,Iu)
local xY=aj(f3,Is,l.bg,8,UDim2 .new(1,It,0,5),UDim2 .new(0,Iu,0,22))xY.AutoButtonColor=true return xY end local xZ,x0,x1,x2=jd("BUY",-164,30),jd("ANY",-131,30),jd("WISH",-98,34),jd("AUTO",-61,56)
local je=jc xZ.MouseButton1Click:Connect(function()o.flag(je,"b")end)x0 .MouseButton1Click:Connect(function()o.flag(je,"g")end)
x1 .MouseButton1Click:Connect(function()o.flag(je,"w")end)x2 .MouseButton1Click:Connect(function()o.flag(je,"f")end)
o.rows[jc]={b=xZ,g=x0,w=x1,f=x2,name=oP,desc=oQ,boostText=xX,row=f3}end end o.built=true o.paintAll()end function d.paint()
O(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")O(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
O(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")O(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
O(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])O(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end V(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
V(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))V(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
V(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))V(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
V(a.pfFps.MouseButton1Click:Connect(function()local Iv=table.find(d.CAPS,e.FpsCap or 0)or 1 local x3=d.CAPS[(Iv%#d.CAPS)+1]
if not d.cap(x3)and x3~=0 then D("this executor cannot cap fps")end d.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()
local oR=tonumber(a.pfMem.Text)if oR and oR>=0 then e.MemLimit=math.floor(oR)end d.paint()end))function A.names()
local oS={"(none)"}for MG,Iw in ipairs((A.teams()))do oS[#oS+1]=Iw.name end return oS end function A.cycle(oT,Ix)
local jf=A.names()local Iy=e[oT]~=""and e[oT]or"(none)"local jg=table.find(jf,Iy)or 1 jg=((jg-1+Ix)%#jf)+1 e[oT]=jf[jg]=="(none)"and""or jf[jg]
A.paint()end function A.paint()if not A.built then return end O(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
O(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oU={}for MH,Iz in ipairs((A.teams()))do oU[Iz.name]=true end
for IA,x4 in pairs(A.pick)do local dS=e[IA]x4 .Text=dS==""and"(none)"or(oU[dS]and dS or(dS.." (missing)"))x4 .TextColor3=(dS~=""and not oU[dS])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local IB,jh=o.srv(),{}for MI,ji in ipairs(A.list or{})do jh[#jh+1]=("st %-2s %-22s %9s  helps %d"):format(ji.st.Name,am(W(ji.name)):sub(1,22),A.clock(ji.ends-IB),ji.helps)
end a.tmList.Text=#jh>0 and table.concat(jh,"\n")or"no waxes running"end function A.build()for MJ,jj in ipairs(a.teamList:GetChildren())do
if jj:IsA("Frame")or jj:IsA("TextLabel")or jj:IsA("TextButton")then jj:Destroy()end end A.pick={}local jk=a.card(a.teamList,"Automatic")
a.tmT=a.switch(jk,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(jk,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(jk,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local IC,ID=pcall(y.rebuild,"you asked")if not IC then D("BUILD ERR "..tostring(ID))end end)
end)a.tmInfo=a.grow(jk,10,l.dim)local x5=a.card(a.teamList,"Which team when")local function jl(jm,IE,IF)local f4=a.row(x5,54)
Q(f4,IE,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local x6=Q(f4,IF,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
x6 .TextWrapped,x6 .TextTruncate=false,Enum.TextTruncate.AtEnd local IG=aj(f4,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local x7=aj(f4,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local IH=aj(f4,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
IG.MouseButton1Click:Connect(function()A.cycle(jm,-1)end)IH.MouseButton1Click:Connect(function()A.cycle(jm,1)end)
x7 .MouseButton1Click:Connect(function()A.cycle(jm,1)end)A.pick[jm]=x7 end jl("TeamNormal","Normal","the rest of the time: money + luck")
jl("TeamFull","Full","every station busy: money + wax speed")jl("TeamGlaze","Glaze","worn just before a wax finishes")
local jn=a.row(x5,26)Q(jn,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=iH(jn,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
Q(jn,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local II=aj(jn,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
II.MouseButton1Click:Connect(function()local jo=tonumber(a.tmLead.Text)if jo and jo>=5 and jo<=600 then e.GlazeLead=math.floor(jo)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)jl("TeamWax","Wax","while a butter is placed: head starts")local x8=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=L("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=af.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(x8)},x8)aa(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local IJ=a.card(a.teamList,"How it works")a.note(IJ,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function IK()a.secB.Text=tostring(e.Every)O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ah(0.1)end if not F.home then pcall(d.unpin)end end)end
O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fC(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b6(a.root)b6(a.tgRoot)c.lastCollect=z()
ox()M.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function IL(x9)task.spawn(function()x9 .TextColor3=l.bad
task.wait(0.8)if c.alive then x9 .TextColor3=l.text end end)end local function x_()local ya=a.secB.Text:match("^%s*(%d+)%s*$")
local f5=ya and tonumber(ya)if not f5 or f5<1 then a.secB.Text=tostring(e.Every)IL(a.secB)D("interval must be a whole number >= 1")
return end if f5==e.Every then return end e.Every,c.lastCollect=f5,z()D("collect every "..f5 .."s")end local function N(IM,IN)V(IM.MouseButton1Click:Connect(IN))end
N(a.secSet,x_)V(a.secB.FocusLost:Connect(x_))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(au,"selling...",vn)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(E.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help F.nextAt,F.msg=0,e.Help and"looking for waxes to help"or"off"O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests J.at=0 O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire H.nextAt,H.fails,H.lost=0,0,0 O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()O(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")O(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
O(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
O(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")O(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(IO)task.spawn(function()pcall(q.tick)if IO and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local IP=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(IP)end)
N(a.bestT,function()local IQ=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(IQ)end)N(a.bcT,function()
local IR=q.on()e.BestCrate=not e.BestCrate q.changed(IR)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
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
local dU,oV={},ag:FindFirstChild("AdminShow")if oV then local IS,IT=pcall(function()return oV:GetAttributes()end)
for yb,dV in pairs(IS and IT or{})do local jp=type(yb)=="string"and yb:match("^(.-)Mult$")local oW=jp and tonumber(oV:GetAttribute(jp.."Until"))
if jp and type(dV)=="number"and dV~=1 and dV~=0 and oW and oW>b8 then dU[#dU+1]=("%s  x%s   %s left"):format(jp:gsub("(%l)(%u)","%1 %2"),(dV%1==0)and tostring(dV)or("%.2f"):format(dV),
A.clock(oW-b8))end end end table.sort(dU)a.put(a.admBoost,#dU>0 and table.concat(dU,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dU>0 and l.accent or l.dim local jq=0 for MK in pairs(P.drops)do jq=jq+1 end local yc=q.snapAt and(q.snapAt-b8)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(P.got,P.miss,jq>0 and(", "..jq.." falling")or"",
yc and("in "..math.max(0,math.floor(yc)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(au,"opening crate...",ex,true)end)N(a.padB,function()c.plot=bF()or c.plot local yd,oX=aq(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(yd and oX and oX:IsA("BasePart"))then D("SET PAD: need character and plot")return end c.manualPad=oX.CFrame:ToObjectSpace(yd.HumanoidRootPart.CFrame)
Fp(c.manualPad)D("collect pad saved at your position")end)N(a.startB,function()fC(not c.running)end)N(a.buyB,function()
c.plot=bF()or c.plot task.spawn(au,"buying (manual)...",qU,true)end)N(a.plB,function()c.plot=bF()or c.plot task.spawn(au,"waxing (manual)...",q0)
end)N(a.tabFarm,function()aW("farm")end)N(a.tabRun,function()aW("run")end)N(a.tabSrv,function()aW("srv")end)N(a.tabAdm,function()aW("adm")end)
N(a.tabBut,function()aW("but")end)N(a.tabSet,function()aW("set")end)N(a.tabCrt,function()aW("crt")end)N(a.tabPet,function()aW("pet")end)
N(a.tabTeam,function()aW("team")end)N(a.tabAlt,function()aW("alt")if type(a.altShown)=="function"then pcall(a.altShown)end end)
a.mk,a.lbl,a.button,a.round,a.C,a.FT,a.click=L,Q,aj,aa,l,af,N do local IU=a.card(a.alt,"Alts","several accounts in one server")
a.altNote=Q(a.row(IU,40),"The team module is not running on this account. Load the farm with altboot.lua to use it.",10,l.dim,false)
a.altNote.TextWrapped,a.altNote.TextYAlignment=true,Enum.TextYAlignment.Top end local function IV(oY)c.hidden=oY
a.root.Visible=not oY a.tgBtn.TextColor3=oY and l.text or l.ink end wX(a.tgBtn,a.tgRoot,function()b6(a.tgRoot)
c.togPos=iM(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then IV(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aO,aA={},0 local function cb()aO=qi()if#aO==0 then a.cfgPick.Text="(none saved)"
aA=0 return end if aA<1 or aA>#aO then aA=1 end a.cfgPick.Text=aO[aA]..("  (%d/%d)"):format(aA,#aO)end local function ye()
local yf=c.autoload~=nil a.cfgAuto.Text=yf and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=yf and l.accent or l.panel2
end local function oZ()local yg=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if yg~=""then return yg end return(aA>0 and aO[aA])or""
end N(a.cfgSave,function()c.winPos=iM(a.root)or c.winPos c.togPos=iM(a.tgRoot)or c.togPos local yh,yi=ef(oZ())
a.cfgMsg.Text=yh and("saved as "..yi)or("could not save: "..yi)a.cfgMsg.TextColor3=yh and l.good or l.bad cb()
D(a.cfgMsg.Text)end)local function IW(o0)local o1,yj=kg(o0)a.cfgMsg.Text=o1 and("loaded "..yj)or("could not load: "..yj)
a.cfgMsg.TextColor3=o1 and l.good or l.bad if o1 then a.cfgName.Text=o0 IK()task.spawn(E.apply,"config "..o0)
end D(a.cfgMsg.Text)end N(a.cfgLoad,function()IW(oZ())end)N(a.cfgPick,function()cb()if aA>0 then a.cfgName.Text=aO[aA]end
end)N(a.cfgPrev,function()if#aO==0 then cb()return end aA=(aA-2)%#aO+1 cb()a.cfgName.Text=aO[aA]end)N(a.cfgNext,function()
if#aO==0 then cb()return end aA=aA%#aO+1 cb()a.cfgName.Text=aO[aA]end)N(a.cfgAuto,function()if c.autoload then
kh(nil)a.cfgMsg.Text="it will not load a config on launch"else local f7=oZ()local yk=false for ML,IY in ipairs(qi())do if IY==f7 then yk=true end end
local IZ=yk or ef(f7)if IZ and f7~=""then kh(f7)cb()a.cfgMsg.Text=f7 .." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim ye()end)N(a.autoB,function()
local yl,ym=Ak()a.autoMsg.Text=yl and("installed. "..ym)or("failed: "..ym)a.autoMsg.TextColor3=yl and l.good or l.bad
D(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()eg("you asked")end)
local bj=false N(a.minB,function()bj=not bj a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bj,not bj,not bj
if bj then for MM,I0 in ipairs(a.tabKeys)do a[I0].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,T.head+6),UDim2 .new(1,-16,0,T.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,T.rail+8,0,T.head+6),UDim2 .new(1,-(T.rail+16),0,T.status)aW(xG)
end a.root.Size=UDim2 .new(0,T.w,0,bj and(T.head+T.status+12)or T.h)a.minB.Text=bj and"+"or"-"end)local function jr()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(gn)for MN,I1 in ipairs(jA)do pcall(function()I1:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end if c.hidPurchaseApp then pcall(function()c.hidPurchaseApp.Enabled=true end)end
pcall(function()n2:Destroy()end)pcall(function()xp:Destroy()end)if c1 .SAB_KILL==jr then c1 .SAB_KILL=nil end
end c1 .SAB_KILL=jr N(a.killB,jr)N(a.xB,jr)wX(a.title,a.root,function()b6(a.root)c.winPos=iM(a.root)or c.winPos
end)local function yn()local f8,cZ=c.reason,c.level if c.busy then f8,cZ=c.busyText,"ok"elseif not c.running then
local MO,yo,I2=v0()if c.capHit then f8,cZ=yo,"bad"else f8,cZ="[stopped] "..yo,(I2=="bad")and"bad"or"idle"end c.reason,c.level=f8,cZ
end local dW=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dW then a.lit.dot=dW a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dW,dW,dW,dW
a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,f8)if a.lit.bar~=cZ then a.lit.bar=cZ a.bar.BackgroundColor3=GG[cZ]or l.dim end
if bj then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")O(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local cc=zV()if a.farm.Visible then local I3,I4=gk()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,I3 .."/"..I4)local yp=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local yq=ad()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
av(bk()),c.rolls,c.gifts,c.crates,yq and am(W(yq))or"nothing",j.on and("   ["..j.title.." window open]")or"",
yp and("in "..yp.."s")or"off"))a.put(a.tgt,(#cc==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#cc<=3)and table.concat(cc,", ")or(#cc.." butters ticked"))))
if a.lit.tgt~=(#cc==0)then a.lit.tgt=(#cc==0)a.tgt.TextColor3=(#cc==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(ge,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and F.msg or"helping is off")a.put(a.srvCamp,e.Campfire and H.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ae.n,#ae.rarOrder,#cc))
end if a.but.Visible and bC.at~=ae.at then f2(false)end if a.crt.Visible then if M.built~=M.at then M.build()else M.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and F.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and H.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(J.msg~=""and J.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local yr=(E.rec.on and"on"or"")..(E.rec.off and((E.rec.on and"/"or"").."off")or"")
a.put(a.arL,E.msg~=""and E.msg or("auto roll  %s | knows %s%s"):format(E.isOn()and"running"or"stopped",yr~=""and yr or"nothing yet",#E.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(E.msg~="")then a.lit.arL=(E.msg~="")a.arL.TextColor3=E.msg~=""and l.warn or l.dim end end end c1 .SAB={S=c,CFG=e,EV=ab,U=a,sg=n2,CAT=ae,LEARN=al,buildList=f2,
logAll=dZ,evAll=d0,AR=E,CR=M,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=F,CF=H,QX=J,IX=q,SH=P,saveConfig=ef,loadConfig=kg,setAutoload=kh}
D(cd.." loaded")if c.uiErrs>0 then D("UI: "..c.uiErrs.." properties skipped")end aW("farm")b6(a.root)b6(a.tgRoot)
if iJ then pcall(function()V(iJ:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)b6(a.root)
b6(a.tgRoot)end))end)end cb()ye()if c.config and c.config~=""then a.cfgName.Text=c.config end O(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
O(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")O(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
O(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)O(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
O(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(yn)task.spawn(function()local ys=Ai()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(ys and("\n(backup: "..ys..")")or"")
local yt=ec(ar.exec)if yt and not yt:find("SAB autoloader v2",1,true)then gH(ar.exec,ar.stub)D("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(ec(ar.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(Aq)end)task.spawn(function()while c.alive do local I5,I6=pcall(yn)if not I5 then D("UI ERR "..tostring(I6))end
task.wait((c.hidden or bj)and 1.5 or 0.4)end end)task.spawn(function()local I7,I8=pcall(Ay)if not I7 then D("HOOK ERR "..tostring(I8))end
end)task.spawn(function()pcall(zh)if j.loadSeq and not j.learned then local js={}for yu=1,20 do if j.loadSeq[yu]then js[#js+1]=j.loadSeq[yu]end end
if#js>0 then j.learned={seq=js,mode=j.loadMode}D("remembered how to open crates directly")end end if ka()then D(("catalog: %d butters in %d rarities"):format(ae.n,#ae.rarOrder))end
local I9,yv=pcall(Fr)if I9 and yv and c.alive and not c.manualPad then c.manualPad=yv end end)task.spawn(function()
while c.alive do local o2,o3=pcall(o.buyTick)if not o2 then D("PET ERR "..tostring(o3))task.wait(5)end o2,o3=pcall(o.wishTick)
if not o2 then D("WISH ERR "..tostring(o3))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local jt,yw=0,z()
V(game:GetService("RunService").Heartbeat:Connect(function()jt=jt+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
V(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local yx=z()d.fps,jt,yw=jt/math.max(yx-yw,0.001),0,yx local I_,Ja=pcall(d.tick)if not I_ then D("PERF ERR "..tostring(Ja))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local Jb,Jc=pcall(y.tick)if not Jb then D("FUSE ERR "..tostring(Jc))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local Jd,Je=pcall(A.tick)if not Jd then D("TEAM ERR "..tostring(Je))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local ju=ag:WaitForChild("Remotes",30)local yy=ju and ju:WaitForChild("ClanEvent",30)
if yy and c.alive then V(yy.OnClientEvent:Connect(function(Jf,Jg)if Jf=="call"then pcall(F.onCall,Jg)end end))
end local yz=ju and ju:FindFirstChild("RollConfirmAsk")if yz and c.alive then V(yz.OnClientEvent:Connect(function(Jh)J.asked=Jh or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)pcall(d.walkPatch,true)end
end end)task.spawn(function()local o4=ag:WaitForChild("Remotes",30)if not(o4 and c.alive)then return end local function jv(Ji,Jj)
local o5=o4:FindFirstChild(Ji)if o5 and o5:IsA("RemoteEvent")then V(o5 .OnClientEvent:Connect(function(...)pcall(Jj,...)end))end
end jv("NewSquishyDiscovered",function(o6,yA)if type(o6)~="string"then return end q.disc=q.disc or{}q.disc[W(o6)]=true
D(("INDEX: %s%s is in your Index now"):format(am(W(o6)),yA and(" ("..tostring(yA)..")")or""))end)jv("IndexRefresh",q.loadDisc)
jv("IndexRowComplete",function(Jk)D("INDEX: the whole "..tostring(Jk).." row is complete")end)jv("AdminShow",q.admin)
local yB=o4:FindFirstChild("AdminShowSync")if yB then local Jl,yC=pcall(function()return yB:InvokeServer()end)
if Jl and type(yC)=="table"then for MP,Jm in pairs(yC)do pcall(P.add,Jm)end end end while c.alive do local Jn,Jo=pcall(q.tick)
if not Jn then q.msg="index error: "..tostring(Jo)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Jp,Jq=pcall(J.tick)if not Jp then D("QUEST ERR "..tostring(Jq))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(gn)end end)pcall(E.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Js=(type(newcclosure)=="function")and newcclosure or function(Jr)return Jr end local o7
local yD=(type(setnamecallmethod)=="function")and setnamecallmethod or nil o7=hookmetamethod(game,"__namecall",Js(function(yE,...)
local f9=getnamecallmethod()if c.alive and(f9=="InvokeServer"or f9=="FireServer")then local yF,yG=pcall(function()return yE.Name end)
if yF and yG=="CrateAction"and not j.replaying then pcall(j.saw,f9,...)elseif yF and yG=="AutoRollAction"and not E.replaying then pcall(E.saw,f9,...)end
if yD then yD(f9)end end return o7(yE,...)end))j.oldNC=o7 end)end pcall(function()local f_=getgenv and getgenv()or _G
c.robuxBlocked=0 f_.SAB_NOROBUX=f_.SAB_NOROBUX or{n=0,last=""}if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
local bE=f_.SAB_NOROBUX local c0=game:GetService("MarketplaceService")local Jt={PromptGift=true,PromptLimitedSquishy=true,PromptMultMoneyGamepass=true,PromptServerLuck=true,
PromptShopCrate=true,PromptTimeSkip=true,PromptDoubleOfflineEarnings=true,FinishWaxOffer=true}pcall(function()
local Jv=(type(newcclosure)=="function")and newcclosure or function(Ju)return Ju end local yH yH=hookmetamethod(game,"__namecall",Jv(function(o8,...)
local ga=getnamecallmethod()if c.alive and o8==c0 and type(ga)=="string"and ga:sub(1,6)=="Prompt"then bE.n,bE.last=bE.n+1,ga
return nil end if ga=="FireServer"or ga=="InvokeServer"then local yI,dX=pcall(function()return o8 .Name end)local o9,MQ,Jw=...
if yI and dX=="ClanRequest"and(o9=="refresh"or(o9=="create"and Jw=="robux"))then dX="ClanRequest "..o9 end if yI and(Jt[dX]or dX=="ClanRequest refresh"or dX=="ClanRequest create")and c.alive then
bE.n,bE.last=bE.n+1,dX return nil end end return yH(o8,...)end))end)local function gb(yJ,Jx)pcall(function()V(c0[yJ]:Connect(function(Jy,o_)
bE.n,bE.last=bE.n+1,yJ..(o_~=nil and(" #"..tostring(o_))or"")pcall(Jx,Jy,o_)end))end)end gb("PromptProductPurchaseRequested",function(pa,Jz)
c0:SignalPromptProductPurchaseFinished(typeof(pa)=="Instance"and pa.UserId or pa,Jz,false)end)gb("PromptGamePassPurchaseRequested",function(JA,JB)c0:SignalPromptGamePassPurchaseFinished(JA,JB,false)end)
gb("PromptPurchaseRequested",function(JC,JD)c0:SignalPromptPurchaseFinished(JC,JD,false)end)gb("PromptBundlePurchaseRequested",function(JE,JF)c0:SignalPromptBundlePurchaseFinished(JE,JF,false)end)
gb("PromptPremiumPurchaseRequested",function()c0:SignalPromptPremiumPurchaseFinished(false)end)end local function yK()
local JG,JH=pcall(function()local gc=game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp")if gc and gc:IsA("ScreenGui")then
c.hidPurchaseApp=gc if gc.Enabled then gc.Enabled=false end end end)if not JG then c.hideErr=tostring(JH)end end
yK()task.spawn(function()local yL=f_.SAB_NOROBUX.n while c.alive do task.wait(5)yK()local dY=f_.SAB_NOROBUX if dY and dY.n>yL then
c.robuxBlocked,yL=dY.n,dY.n D(("ROBUX PROMPT BLOCKED (%s) - %d so far"):format(dY.last,dY.n))end end end)end)
if jy then V(K.Idled:Connect(function()pcall(function()jy:CaptureController()jy:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for MR=1,90 do if not c.alive then return end if K:GetAttribute("AutoRollOn")~=nil and aq()and(c.plot or bF())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then E.apply("joined")end while c.alive do task.wait(30)local jw=ck()
if jw and q.on()and not aP(jw.name)then jw=nil end if c.alive and e.AutoRoll and c.running and not E.isOn()and not jw and not ad()
and not j.waiting and not j.on and not c.busy then E.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for MS=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bF()if aq()and c.plot and q.any()then fC(true,true)D("started by itself")
return end task.wait(1)end if c.alive and not c.running then D("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bF()c.lastCollect=z()while c.alive do if c.running then local JI,yM=pcall(GB)if not JI and yM~=jz then D("LOOP ERR "..tostring(yM))end
end task.wait(0.1)end end)jx("ready - the window is at the top left")end local JK,pb=xpcall(yQ,function(JJ)return tostring(JJ).."\n"..debug.traceback()end)
if not JK then pcall(function()warn("SAB "..cd.." ERROR: "..tostring(pb))end)jx("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cd.." ERROR: "..tostring(pb))end)pcall(function()local yN=(type(getgenv)=="function"and getgenv())or _G
if type(yN.SAB_KILL)=="function"then yN.SAB_KILL()end for MT,JL in ipairs({"SABFarmGui","SABToggle"})do local yO=K.PlayerGui:FindFirstChild(JL)
if yO then yO:Destroy()end end end)pcall(function()local gd=Instance.new("ScreenGui")gd.Name="SABError"gd.ResetOnSpawn=false
gd.DisplayOrder=1000 local a7=Instance.new("TextBox")a7 .Size=UDim2 .new(0,340,0,170)a7 .Position=UDim2 .new(0,10,0,50)
a7 .BackgroundColor3=Color3 .fromRGB(90,20,20)a7 .TextColor3=Color3 .new(1,1,1)a7 .TextSize=11 a7 .TextWrapped=true
a7 .ClearTextOnFocus=false a7 .TextXAlignment=Enum.TextXAlignment.Left a7 .TextYAlignment=Enum.TextYAlignment.Top
a7 .Text="SAB "..cd.." failed to start. Send this text:\n"..tostring(pb)a7 .Parent=gd gd.Parent=K:WaitForChild("PlayerGui")
end)end
