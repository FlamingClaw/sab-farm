local bO="v25"local jP=game:GetService("Players")local D=jP.LocalPlayer or jP.PlayerAdded:Wait()local function f8(p2)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bO,Text=p2,Duration=6})
end)end f8("script started")local function p3()local ay=game:GetService("ReplicatedStorage")local aF=game:GetService("Workspace")
local jQ=game:GetService("UserInputService")local bP=(type(getgenv)=="function"and getgenv())or _G if type(bP.SAB_KILL)=="function"then pcall(bP.SAB_KILL)end
local r=(type(tick)=="function")and tick or os.clock local f9=(function()local p4,p5=pcall(function()return game:GetService("VirtualUser")end)return p4 and p5 or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,MemLimit=2000,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=r(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local J={name=nil,rar=nil,at=r(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local y={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local d={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local l,o,q,x={},{},{},{}local f_={}local ga,dU,cp,cq={},{},{},{}local function O(jR)ga[#ga+1]=jR return jR end
local function ak(p6)task.wait(p6)if not a.alive then error(f_,0)end end local function u(dV)dV=os.date("%H:%M:%S").." "..tostring(dV)
table.insert(dU,1,dV)if#dU>6 then table.remove(dU)end cp[#cp+1]=dV if#cp>80 then table.remove(cp,1)end end local function dW(jS)
if type(jS)~="string"then return""end return(jS:lower():gsub("[^%w]",""))end local function Q(p7)local jT=dW(p7)
local gb=jT:gsub("butter$","")if gb==""then gb=jT end return gb end local function aL(gc)return type(gc)=="string"and Q(gc)~=""and e.Targets[Q(gc)]==true end
local function p8(cr)cr=cr:lower()return cr:find("squishy",1,true)~=nil or cr:match("butter$")~=nil or cr:match("butter[^%a]")~=nil
end local gd={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function as(cs)if type(cs)~="number"then return"?"end
local dX=1 while math.abs(cs)>=1000 and dX<#gd do cs=cs/1000 dX=dX+1 end local p9=string.format("%.2f",cs):gsub("%.?0+$","")
return p9 ..gd[dX]end local function p_(jU)if type(jU)~="string"then return nil end local qa,jV=jU:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local ge=tonumber(qa)if not ge then return nil end if jV==""then return ge end for qb,qc in ipairs(gd)do if qc:lower()==jV:lower()then return ge*1000^(qb-1)end end
return nil end local function aM()local jW=D:GetAttribute("BoardValueMoney")if type(jW)=="number"then return jW end
local jX=D:FindFirstChild("leaderstats")if jX then for xc,qd in ipairs({"Cash","Money","Coins"})do local gf=jX:FindFirstChild(qd)
if gf and type(gf.Value)=="number"then return gf.Value end end end end local function dY(qe)local gg=qe:GetFullName()
if a.plot then local gh=a.plot:GetFullName()if gg:sub(1,#gh)==gh then return gg:sub(#gh+2)end end return gg end
local function aN()local dZ=D.Character if dZ and dZ:FindFirstChild("HumanoidRootPart")then local jY=dZ:FindFirstChildOfClass("Humanoid")
if jY and jY.Health>0 then return dZ end end end local function a1()local gi=aF:FindFirstChild("Plots")if not gi then return nil end
local function jZ(qf)local j0=qf:FindFirstChild("Plate")return j0~=nil and j0:FindFirstChild("EditStackAttachment",true)~=nil
end local j1=D:GetAttribute("PlotNumber")if j1~=nil then local gj=gi:FindFirstChild(tostring(j1))if gj and jZ(gj)then return gj end
end for xd,j2 in ipairs(gi:GetChildren())do if jZ(j2)then return j2 end end end local function ct(j3)local a2=j3 and j3 .Parent
for xe=1,6 do if not a2 then return nil end if a2:IsA("BasePart")then return a2 end if a2:IsA("Model")then return a2 .PrimaryPart or a2:FindFirstChildWhichIsA("BasePart",true)end
a2=a2 .Parent end end local function j4(j5)local gk=j5 .Parent if gk and gk:IsA("Attachment")then return gk.WorldPosition end
local j6=ct(j5)return j6 and j6 .Position end local function qg()local bQ=a.plot and a.plot:FindFirstChild("Plate")
if not bQ then return nil end if bQ:IsA("BasePart")then return bQ.Position end if bQ:IsA("Model")then return bQ:GetPivot().Position end
local j7=bQ:FindFirstChildWhichIsA("BasePart",true)return j7 and j7 .Position end local function j8()local gl={}
local j9=a.plot and a.plot:FindFirstChild("WaxStations")if j9 then for xf,qh in ipairs(j9:GetChildren())do local j_=qh:FindFirstChild("SquishyPlaceHolder")
local gm=j_ and j_:FindFirstChild("PlacePrompt")if gm and gm:IsA("ProximityPrompt")then gl[#gl+1]=gm end end end
return gl end local function d0()local ka,gn=j8(),0 for xg,qi in ipairs(ka)do if qi.Enabled then gn=gn+1 end end
local go=#ka local gp=D:GetAttribute("WaxStations")if type(gp)=="number"and gp>go then go=gp end return gn,go
end local function qj()local kb=aN()local kc=kb and kb.HumanoidRootPart.Position local gq,kd for xh,gr in ipairs(j8())do
if gr.Enabled then local ke=j4(gr)local kf=(ke and kc)and(ke-kc).Magnitude or 1e9 if not gq or kf<kd then gq,kd=gr,kf end
end end return gq end local function kg()local d1=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not d1 then return nil end local kh=d1:FindFirstChild("BuyPromptAttachment")local d2=(kh and kh:FindFirstChild("BuyPrompt"))or d1:FindFirstChild("BuyPrompt",true)
if d2 and d2:IsA("ProximityPrompt")and d2:IsDescendantOf(d1)then return d2 end end local ki={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local qk={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local V={order={},price={},dirty=false}local E={seen={},at=0,boxes={},built=0}local M={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local gs="SAB_order.txt"local function d3()if not V.dirty or type(writefile)~="function"then return end local an={}
for ql,qm in pairs(V.price)do an[#an+1]="P|"..ql.."|"..string.format("%.0f",qm)end for qn,qo in pairs(V.order)do an[#an+1]="O|"..qn.."|"..table.concat(qo,",")end
if d.learned and d.enc then an[#an+1]="M|mode|"..tostring(d.learned.mode or"")for qp,d4 in ipairs(d.learned.seq)do
local kj={}for kk=1,d4 .n do kj[kk]=d.enc(d4 .args[kk])end an[#an+1]=("A|%d|%s|%d|%s"):format(qp,d4 .m,d4 .n,table.concat(kj,";"))
end end local function gt(qq,qr,d5)local kl={}for km=1,d5 .n do kl[km]=d.enc(d5 .args[km])end an[#an+1]=("R|%d|%s|%s|%d|%s"):format(qr,qq,d5 .m,d5 .n,table.concat(kl,";"))
end if d.enc then for qs,qt in ipairs(y.rec.rules)do gt("rules",qs,qt)end if y.rec.on then gt("on",0,y.rec.on)end
if y.rec.off then gt("off",0,y.rec.off)end end for xi,cu in pairs(E.seen)do an[#an+1]=("K|%s|%s|%s|%s"):format(cu.name,cu.title or"",cu.rar or"",cu.price and string.format("%.0f",cu.price)or"")
end if pcall(writefile,gs,table.concat(an,"\n"))then V.dirty=false end end local function qu()if type(isfile)~="function"or type(readfile)~="function"then return end
local qv,qw=pcall(isfile,gs)if not(qv and qw)then return end local qx,kn=pcall(readfile,gs)if not(qx and type(kn)=="string")then return end
for qy in kn:gmatch("[^\n]+")do local bR,bS,aO=qy:match("^(%a)|([^|]+)|(.*)$")if bR=="P"then V.price[bS]=tonumber(aO)
elseif bR=="M"then d.loadMode=(aO~=""and aO~="nil")and aO or nil elseif bR=="A"and d.dec then local ko=tonumber(bS)
local kp,d6,qz=aO:match("^([^|]+)|(%d+)|(.*)$")if ko and kp then d6=tonumber(d6)local kq,d7={},0 for qA in(qz..";"):gmatch("([^;]*);")do
d7=d7+1 if d7<=d6 then kq[d7]=d.dec(qA)end end d.loadSeq=d.loadSeq or{}d.loadSeq[ko]={m=kp,n=d6,args=kq}end elseif bR=="R"and d.dec then
local kr=tonumber(bS)local d8,qB,d9,qC=aO:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if kr and d8 then d9=tonumber(d9)
local ks,d_={},0 for qD in(qC..";"):gmatch("([^;]*);")do d_=d_+1 if d_<=d9 then ks[d_]=d.dec(qD)end end local gu={m=qB,n=d9,args=ks}
if d8=="rules"then y.rec.rules[kr]=gu elseif d8=="on"then y.rec.on=gu elseif d8=="off"then y.rec.off=gu end end
elseif bR=="K"then local kt,ku,qE=aO:match("^([^|]*)|([^|]*)|(.*)$")E.seen[E.key(bS)]={name=bS,title=kt~=""and kt or nil,
rar=ku~=""and ku or nil,price=tonumber(qE)}elseif bR=="O"and aO~=""then local ea={}for qF in aO:gmatch("[^,]+")do ea[#ea+1]=qF end
if#ea>0 then V.order[bS]=ea end end end end local function qG(eb)if type(eb)~="table"then return end local bo,kv=eb.rarity,eb.contents
if type(bo)~="string"or bo==""or type(kv)~="table"then return end local cv={}for xj,ec in ipairs(kv)do if type(ec)=="table"and type(ec.butter)=="string"then
cv[#cv+1]={n=ec.butter,ch=tonumber(ec.chance)or 0}end end if#cv==0 then return end table.sort(cv,function(qH,qI)return qH.ch>qI.ch end)
local cw,cx={},false for qJ,qK in ipairs(cv)do cw[qJ]=qK.n end local gv=V.order[bo]if not gv or#gv~=#cw then cx=true end
if not cx then for kw=1,#cw do if gv[kw]~=cw[kw]then cx=true break end end end V.order[bo]=cw local gw=tonumber(eb.price)
if gw and V.price[bo]~=gw then V.price[bo]=gw cx=true end if cx then V.dirty=true M.at=0 u("learned the "..bo.." order from its crate")
end end local function bT(qL,qM)local qN=qL:FindFirstChild(qM,true)local qO,gx=pcall(function()return qN.Text end)
return(qO and type(gx)=="string"and gx~="")and gx or nil end local function aa(kx)return M.pretty[kx]or kx end
E.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function E.key(qP)return dW(qP or"")end
function E.learn(aP)if type(aP)~="table"or type(aP.name)~="string"then return end local gy=E.key(aP.name)local aQ=E.seen[gy]or{}
local qQ=(E.seen[gy]==nil)or(tonumber(aP.price)and aQ.price~=tonumber(aP.price))aQ.name,aQ.title=aP.name,aP.title or aQ.title
aQ.rar,aQ.price=aP.rarity or aQ.rar,tonumber(aP.price)or aQ.price E.seen[gy]=aQ if qQ then E.at,V.dirty=r(),true end
end function E.wanted(ky)return ky~=nil and e.CrateTicks[E.key(ky)]==true end function E.list()local bU={}for qR,ed in ipairs(E.base)do bU[E.key(ed[1])]={name=ed[1],title=ed[2],rar=ed[3],i=qR}end
for xk,cy in ipairs(M.rarOrder)do local kz=false for xl,qS in pairs(bU)do if qS.rar==cy then kz=true break end end
if not kz and cy~="?"then local kA=cy:gsub("[^%w]","").."Crate"bU[E.key(kA)]={name=kA,title=cy.." Crate",rar=cy,i=50,guess=true}
end end for kB,ee in pairs(E.seen)do local aG=bU[kB]or{i=100}aG.name,aG.title,aG.rar=ee.name or aG.name,ee.title or aG.title,ee.rar or aG.rar
aG.price,aG.guess=ee.price or aG.price,nil bU[kB]=aG end local cz,ef={},{}for qT,qU in ipairs(ki)do cz[qU]=qT end
for qV,kC in ipairs(M.rarOrder)do cz[kC]=cz[kC]or(20+qV)end for qW,cA in pairs(bU)do cA.k=qW cA.price=cA.price or V.price[cA.rar or""]
ef[#ef+1]=cA end table.sort(ef,function(bp,bq)if bp.price and bq.price and bp.price~=bq.price then return bp.price<bq.price end
local kD,kE=cz[bp.rar or""]or 99,cz[bq.rar or""]or 99 if kD~=kE then return kD<kE end if(bp.i or 100)~=(bq.i or 100)then return(bp.i or 100)<(bq.i or 100)end
return bp.k<bq.k end)return ef end local function qX()local kF=ay:FindFirstChild("Assets")local kG=kF and kF:FindFirstChild("Squishies")
if not kG then return false end local gz,kH,bV={},{},{}local eg=0 for xm,eh in ipairs(kG:GetChildren())do local cB=Q(eh.Name)
if cB~=""and not gz[cB]then local ei=bT(eh,"RarityText")or"?"gz[cB]=ei kH[cB]=bT(eh,"NameText")or eh.Name bV[ei]=bV[ei]or{}
table.insert(bV[ei],cB)eg=eg+1 end end if eg==0 then return false end for kI,qY in pairs(bV)do local kJ=V.order[kI]or qk[kI]
local gA={}if kJ then for qZ,q0 in ipairs(kJ)do gA[Q(q0)]=qZ end end table.sort(qY,function(kK,kL)local gB,gC=gA[kK],gA[kL]
if gB and gC then return gB<gC end if gB then return true end if gC then return false end return aa(kK)<aa(kL)
end)end local gD={}for q1,q2 in ipairs(ki)do gD[q2]=q1 end local ej={}for q3 in pairs(bV)do ej[#ej+1]=q3 end table.sort(ej,function(gE,gF)
local gG,gH=V.price[gE],V.price[gF]if gG and gH and gG~=gH then return gG<gH end local gI,gJ=gD[gE],gD[gF]if gI and gJ then return gI<gJ end
if gI then return true end if gJ then return false end return gE<gF end)M.rar,M.pretty,M.members,M.rarOrder,M.n,M.at=gz,kH,bV,ej,eg,r()
return true end local function gK()if M.at==0 or(r()-M.at)>120 then pcall(qX)end return M.n>0 end local function q4(q5)
local kM=Q(q5)return M.rar[kM]or(J.name and Q(J.name)==kM and J.rar)or"?"end local function q6()local ek={}for q7,q8 in pairs(e.Targets)do if q8 then ek[#ek+1]=aa(q7)end end
table.sort(ek)return ek end local W={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function kN()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function el(kO)if type(makefolder)~="function"then return end local q9,q_=pcall(isfolder,kO)if not(q9 and q_)then pcall(makefolder,kO)end
end local function em(kP)if type(isfile)~="function"or type(readfile)~="function"then return nil end local ra,rb=pcall(isfile,kP)
if not(ra and rb)then return nil end local rc,rd=pcall(readfile,kP)return rc and rd or nil end local function cC(re,rf)
if type(writefile)~="function"then return false end return(pcall(writefile,re,rf))end local function kQ(rg)local cD={}
if type(listfiles)~="function"then return cD end local rh,kR=pcall(listfiles,rg)if not rh or type(kR)~="table"then return cD end
for xn,ri in ipairs(kR)do cD[#cD+1]=tostring(ri)end return cD end local function kS()local en={}for xo,rj in ipairs(kQ(W.cfg))do
local kT=rj:match("([^/\\]+)%.txt$")if kT then en[#en+1]=kT end end table.sort(en)return en end local function rk()
local L={"V|1"}L[#L+1]="N|Every|"..tostring(e.Every)L[#L+1]="N|GlazeLead|"..tostring(e.GlazeLead)L[#L+1]="N|FpsCap|"..tostring(e.FpsCap)
L[#L+1]="N|MemLimit|"..tostring(e.MemLimit)for xp,kU in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do L[#L+1]="S|"..kU.."|"..e[kU]end
do local eo={}for rl,cE in pairs(e.Pets)do local kV=(cE.b and"b"or"")..(cE.g and"g"or"")..(cE.w and"w"or"")..((tonumber(cE.f)or 0)>0 and tostring(cE.f)or"")
if kV~=""then eo[#eo+1]=rl.."|"..kV end end table.sort(eo)L[#L+1]="P|-"for xq,rm in ipairs(eo)do L[#L+1]="P|"..rm end
end for xr,kW in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild"})do
L[#L+1]="B|"..kW.."|"..(e[kW]and"1"or"0")end local gL=D:GetAttribute("AutoRollRules")if type(gL)=="string"and gL~=""then e.ARrules,e.ARstop=gL,tostring(D:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then L[#L+1]="S|rules|"..e.ARrules L[#L+1]="S|stop|"..e.ARstop end if a.winPos then L[#L+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then L[#L+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for xs,gM in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local ep={}for rn,ro in pairs(gM[2])do if ro then ep[#ep+1]=rn end end table.sort(ep)L[#L+1]=gM[1].."|-"for xt,rp in ipairs(ep)do L[#L+1]=gM[1].."|"..rp end
end return table.concat(L,"\n")end local function rq(gN)if type(gN)~="string"or gN==""then return false end local kX,kY,kZ,k0,cF={},false,{},false,nil
for rr in gN:gmatch("[^\n]+")do local au,T,al=rr:match("^(%a)|([^|]*)|?(.*)$")if au=="N"and T=="Every"then local gO=tonumber(al)
if gO and gO>=1 then e.Every=math.floor(gO)end elseif au=="N"and(T=="FpsCap"or T=="MemLimit")then local gP=tonumber(al)
if gP and gP>=0 then e[T]=math.floor(gP)end elseif au=="N"and T=="GlazeLead"then local eq=tonumber(al)if eq and eq>=5 and eq<=600 then e.GlazeLead=math.floor(eq)end
elseif au=="S"and(T=="TeamNormal"or T=="TeamFull"or T=="TeamGlaze"or T=="TeamWax")then e[T]=al elseif au=="P"and T~=""then
if not cF then cF={}end if T~="-"and al~=""then cF[T]={b=al:find("b",1,true)and true or nil,g=al:find("g",1,true)and true or nil,
w=al:find("w",1,true)and true or nil,f=tonumber(al:match("%d"))}end elseif au=="B"then if e[T]~=nil then e[T]=(al=="1")end
elseif au=="S"and T=="rules"then e.ARrules=al elseif au=="S"and T=="stop"then e.ARstop=al elseif au=="W"then a.winPos={tonumber(T)or 10,tonumber(al)or 44}
elseif au=="G"then a.togPos={tonumber(T)or 10,tonumber(al)or 300}elseif au=="T"and T~=""then if T~="-"then kX[T]=true end
kY=true elseif au=="K"and T~=""then if T~="-"then kZ[T]=true end k0=true end end if kY then e.Targets=kX end if k0 then e.CrateTicks=kZ end
if cF then e.Pets=cF end return true end local function er(bW)if not kN()then return false,"this executor cannot write files"end
bW=(bW or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if bW==""then return false,"give the config a name"end
el(W.dir)el(W.cfg)if not cC(W.cfg.."/"..bW..".txt",rk())then return false,"could not write the file"end a.config=bW
return true,bW end local function k1(es)local k2=em(W.cfg.."/"..es..".txt")if not k2 then return false,"no config called "..tostring(es)end
if not rq(k2)then return false,"that config looks empty"end a.config=es return true,es end local function k3(gQ)
if gQ then el(W.dir)cC(W.auto,gQ)elseif type(delfile)=="function"then pcall(delfile,W.auto)else cC(W.auto,"")
end a.autoload=gQ end local function rs()if a.selfPath then return a.selfPath end local et for xu,rt in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",W.dir})do
for xv,k4 in ipairs(kQ(rt))do local gR=k4:lower()if gR:sub(-4)==".lua"and(gR:find("sab_farm",1,true)or gR:find("sab farm",1,true))then
et=et or k4 end end end a.selfPath=et return et end W.stub=[[
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
local function ru()if not kN()then return false,"this executor cannot write files"end el("autoexec")if not cC(W.exec,W.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local eu=(function()local rv,rw=pcall(function()return game:GetService("TeleportService")end)return rv and rw or nil end)()
local function gS()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local rx=queueonteleport or queue_on_teleport return(pcall(rx,W.stub))end local function cG(ry)if a.rejoining then return end
a.rejoining=true u("REJOIN ("..ry..")")pcall(d3)if a.autoload then pcall(er,a.autoload)end local rz=gS()u(rz and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for xw=1,30 do if not eu then break end pcall(function()eu:Teleport(game.PlaceId,D)end)task.wait(10)
end end)end local function rA()local rB,k5=pcall(function()return game:GetService("GuiService")end)if rB and k5 then
pcall(function()O(k5 .ErrorMessageChanged:Connect(function()if e.Rejoin then cG("roblox error message")end end))
end)end pcall(function()local k6=game:GetService("CoreGui")local k7=k6 and k6:WaitForChild("RobloxPromptGui",15)
local k8=k7 and k7:WaitForChild("promptOverlay",15)if k8 then O(k8 .ChildAdded:Connect(function(rC)if e.Rejoin and tostring(rC.Name):lower():find("errorprompt",1,true)then cG("disconnect prompt")end
end))end end)pcall(function()O(D.OnTeleport:Connect(function(rD)if tostring(rD):find("Started")then gS()end end))
end)if eu then pcall(function()O(eu.TeleportInitFailed:Connect(function()a.rejoining=false if e.Rejoin then task.delay(5,function()cG("teleport retry")end)end
end))end)end end local function k9(rE)local k_=a.plot and a.plot:FindFirstChild(rE)if not k_ then return nil,false end
for xx,gT in ipairs(k_:GetChildren())do if gT:IsA("Model")or gT:IsA("BasePart")then return gT,true end end return nil,true
end local function cH()local a3=k9("RolledSquishy")if not a3 then return nil end return{model=a3,name=a3 .Name,pretty=bT(a3,"NameText")or aa(Q(a3 .Name)),
rar=bT(a3,"RarityText")or q4(a3 .Name),price=bT(a3,"PriceText")}end local function la(gU)return type(gU)=="string"and(M.rar[Q(gU)]~=nil or p8(gU))
end local function P()local gV=k9("SquishyEquipped")if gV then a.carrySrc,d.heldAt="model",r()return gV.Name,gV end
local lb=D.Character if lb then for xy,cI in ipairs(lb:GetDescendants())do if(cI:IsA("Model")or cI:IsA("Tool"))and la(cI.Name)then
a.carrySrc,d.heldAt="character",r()return cI.Name,cI end end end local ev=D:GetAttribute("SquishyEquipped")if type(ev)=="string"and ev~=""and la(ev)and r()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return ev,nil end a.carrySrc=nil end local function xz()local xA,rF=P()return rF end local function lc()
local ld=cH()local gW=ld and p_(ld.price)local gX=aM()if gW and gX and gX<gW*0.5 then return gX,gW end end local function bX(rG)
cq[#cq+1]=os.date("%H:%M:%S").." "..rG if#cq>40 then table.remove(cq,1)end end local function rH(br,ew)if type(br)~="string"then return end
bX(("Roll(%s,%s)"):format(br,tostring(ew)))if br:lower():find("crate",1,true)then d.rolled,d.rolledAt=br,r()return
end J.seq=J.seq+1 J.name,J.at=br,r()J.rar=type(ew)=="string"and ew or nil a.rolls=a.rolls+1 if aL(br)then u(("ROLL %s [%s] = TARGET"):format(br,tostring(ew)))end
end local function rI(bs)if type(bs)~="table"then return end local ex=bs.butter or bs.itemName if type(ex)~="string"then return end
a.gifts=a.gifts+1 J.gift,J.giftAt=ex,r()if type(bs.giftId)=="string"then local le=ay:FindFirstChild("Remotes")
local lf=le and le:FindFirstChild("GiftThanks")if lf then pcall(function()lf:FireServer(bs.giftId)end)end end
bX("Gift("..ex.." from "..tostring(bs.fromName)..")")u(("GIFT from %s: %s - it will not be waxed"):format(tostring(bs.fromName),ex))
end local function rJ()local lg=ay:WaitForChild("Remotes",30)if not a.alive then return end if not lg then u("Remotes folder missing - no roll events")return end
O(D:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local lh=D:GetAttribute("SquishyEquipped")
if type(lh)=="string"and lh~=""then d.heldAt=r()end end))local rP={SquishyRollAnimation=rH,InitSquishy=function(li)J.init,J.initAt=tostring(li),r()bX("Init("..tostring(li)..")")end,
CrateUpdate=function(bY,lj)pcall(qG,bY)pcall(E.learn,bY)if type(bY)=="table"then local rK=lj==true or(d.rolled~=nil and r()-d.rolledAt<15)or d.waiting
if not rK then return end local rL=not d.waiting local rM=d.on d.waiting,d.data,d.at=true,bY,r()d.on=(lj==true)
d.title=tostring(bY.title or bY.name or"crate")if d.on and not rM then d.openedAt,d.byYou=r(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then bX("CrateWindow open("..d.title..")")elseif rL then bX("Crate waiting("..d.title..")")u(d.title.." is waiting on your stand")
end else if d.waiting then bX("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local rN=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,rN)end if d.classify then local rO=r()
task.spawn(function()pcall(d.classify,rO)end)end end end,GiftReceived=rI,}for ey,rQ in pairs(rP)do local gY=lg:FindFirstChild(ey)
if gY and gY:IsA("RemoteEvent")then O(gY.OnClientEvent:Connect(rQ))elseif ey~="CrateUpdate"and ey~="GiftReceived"then u("remote "..ey.." missing")end
end end local function gZ()local bt=cH()if bt then if aL(bt.name)then return{state="match",shown=bt.pretty,src="pad",info=bt}
end return{state="skip",info=bt,level="idle",text=("on pad: %s [%s] - not ticked"):format(bt.pretty,tostring(bt.rar))}
end if J.name and(r()-J.at)<4 then if aL(J.name)then return{state="match",shown=aa(Q(J.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(aa(Q(J.name)),tostring(J.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function lk(rR,rS,rT,rU)
local ez=RaycastParams.new()ez.FilterType=Enum.RaycastFilterType.Exclude local g0={D.Character}for xC,rV in ipairs(rU or{})do g0[#g0+1]=rV end
ez.FilterDescendantsInstances=g0 pcall(function()ez.RespectCanCollide=true end)local ll=aF:Raycast(Vector3 .new(rR,rS+4,rT),Vector3 .new(0,-30,0),ez)
return ll and ll.Position or nil end local function g1(lm)local ln=lm:FindFirstChildOfClass("Humanoid")return((ln and ln.HipHeight)or 2)+lm.HumanoidRootPart.Size.Y/2+0.2
end local function g2(rW,rX)local lo=rW:FindFirstChildOfClass("Humanoid")local rY=r()while r()-rY<rX do if lo and lo.FloorMaterial~=Enum.Material.Air then return true end
ak(0.05)end return false end local function cJ(rZ,g3,g4)local lp=rZ.HumanoidRootPart lp.AssemblyLinearVelocity=Vector3 .new(0,0,0)
lp.CFrame=g4 and CFrame.new(g3,Vector3 .new(g4 .X,g3 .Y,g4 .Z))or CFrame.new(g3)end local function cK(aR,lq)local bu=aN()
if not bu or not aR then return false end local a4=aR.Position local eA=math.clamp(math.max(aR.Size.X,aR.Size.Z)/2+2.2,3,7)
local lr=(lq and lq.MaxActivationDistance)or 10 if eA>lr-2 then eA=math.max(2.5,lr-2)end local cL={}local function bv(cM)
cM=Vector3 .new(cM.X,0,cM.Z)if cM.Magnitude>0.05 then cL[#cL+1]=cM.Unit end end local ls=qg()if ls then bv(ls-a4)end
bv(aR.CFrame.LookVector)bv(-aR.CFrame.LookVector)bv(aR.CFrame.RightVector)bv(-aR.CFrame.RightVector)bv(bu.HumanoidRootPart.Position-a4)
if#cL==0 then bv(Vector3 .new(0,0,1))end local r0,eB=g1(bu),false for xD,r1 in ipairs(cL)do local eC=a4+r1*eA
local g5=lk(eC.X,a4 .Y,eC.Z,{aR})if g5 and math.abs(g5 .Y-a4 .Y)<14 then cJ(bu,Vector3 .new(eC.X,g5 .Y+r0,eC.Z),a4)
if g2(bu,0.7)then eB=true break end end end if not eB then cJ(bu,a4+cL[1]*eA+Vector3 .new(0,3,0),a4)eB=g2(bu,1)
end ak(0.12)return eB end local function r2(cN)if not cN.Parent or not cN.Enabled then return false end pcall(function()cN:InputHoldBegin()end)
ak(math.max(cN.HoldDuration,0)+0.08)pcall(function()cN:InputHoldEnd()end)return true end local function ag(lt,r3)
local r4=r()while r()-r4<r3 do if lt()then return true end ak(0.05)end return lt()end local function eD(bZ,r5,lu,r6)
local r7=a.zapFirst and{"zap","hold"}or{"hold","zap"}for r8,g6 in ipairs(r7)do if r8==2 and(r6 or not(bZ.Parent and bZ.Enabled and(not lu or lu())))then break end
local g7 if g6=="hold"then g7=r2(bZ)else g7=type(fireproximityprompt)=="function"and bZ.Parent~=nil and bZ.Enabled and pcall(fireproximityprompt,bZ)end
if g7 and ag(r5,1.2)then a.zapFirst=(g6=="zap")return true,g6 end end return false end local function lv(g8)local a5=kg()
if not a5 or not a5 .Enabled then u("buy: nothing on the pad")return false end local lw=ct(a5)if not lw then u("buy: pad part missing")return false end
a.lastBuyAt=r()local r9,lx=J.seq,aM()cK(lw,a5)if not a5 .Enabled then u("buy aborted: pad emptied")return false end
local b0=gZ()if not g8 and b0 .state~="match"then u("buy aborted: "..(b0 .text or"pad changed"))a.matchSince=nil
return false end local g9=b0 .info and b0 .info.name or(b0 .state=="match"and J.name)or nil local function r_()
return a5 .Enabled and P()==nil and(g8 or gZ().state=="match")end local sa,sb=eD(a5,function()return P()~=nil or((not a5 .Enabled)and(g8 or J.seq==r9))
end,r_,lc()~=nil)if sa then ag(function()return P()~=nil end,0.8)local cO=P()local ly=aM()a.holding,a.bought,a.cashFails=true,a.bought+1,0
a.matchSince=nil J.name,J.rar,J.at=nil,nil,r()u(("BOUGHT %s%s via %s"):format(cO and aa(Q(cO))or(b0 .shown or"?"),(lx and ly)and(" for $"..as(lx-ly))or"",sb))
if cO and g9 and Q(cO)~=Q(g9)then u(("note: picked up %s, not %s"):format(cO,g9))end return true end a.cashFails=a.cashFails+1
a.noCashUntil=r()+math.min(8*2^(a.cashFails-1),60)local lz=cH()u(("BUY REFUSED: cash short? have $%s, price %s"):format(as(aM()),(lz and lz.price)or"?"))
return false end local function lA()local eE=P()if not eE then a.holding=false u("place: hands are empty")return false
end if not aL(eE)then u(("REFUSED TO WAX %s - it is not ticked"):format(aa(Q(eE))))return false end for xE=1,e.PlaceTries do
local a6=qj()if not a6 then u("place: no free station")break end local lB=ct(a6)if lB then cK(lB,a6)local lC=P()
if not lC then a.holding=false u("place: hands emptied on the way")return false end if not aL(lC)then u("place: what I carry changed, not waxing it")return false end
if a6 .Enabled then local sc,sd=eD(a6,function()return not a6 .Enabled end,function()return a6 .Enabled end)if sc then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=r()+2.5,0 J.name,J.rar,J.at=nil,nil,r()
u(("WAXED %s #%d at %s via %s"):format(aa(Q(eE)),a.placed,a6 .Parent.Parent.Name,sd))return true end end end ak(0.25)
end a.placeFails=a.placeFails+1 if P()==nil then a.holding=false end u("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then
a.capHit,a.running,a.capAt=true,false,r()a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(P()))u(a.capMsg)end return false end function o.place()local se=r()while a.alive and o.editing and r()-se<25 do ak(0.2)end
if e.Teams and e.TeamWax~=""then o.placing=true local sf=r()while a.alive and o.current()~=e.TeamWax and r()-sf<5 do ak(0.1)end
if o.current()==e.TeamWax then local lD,sh=o.expectSocialWax(e.TeamWax),r()while a.alive and lD>0 and(tonumber(D:GetAttribute("PetSocialWax"))or 0)<lD-1e-6 and r()-sh<4 do ak(0.1)end
ak(0.25)else u("wax team did not come on in time - placing anyway")end end local si,lE=pcall(lA)o.placing=false
if not si then error(lE,0)end return lE end local function lF(lG)return type(lG)=="string"and lG:lower():find("crate",1,true)~=nil
end local sj={SABFarmGui=1,SABToggle=1,SABError=1}local function g_(sk)local a7=sk while a7 do if sj[a7 .Name]then return false end
if a7:IsA("ScreenGui")then local sl,sm=pcall(function()return a7 .Enabled end)return(not sl)or sm~=false end if a7:IsA("GuiObject")and not a7 .Visible then return false end
a7=a7 .Parent end return false end local function eF(eG)local b1=""pcall(function()if eG:IsA("TextButton")then b1=eG.Text end end)
if not b1:find("%a")then for xF,eH in ipairs(eG:GetDescendants())do if(eH:IsA("TextLabel")or eH:IsA("TextButton"))and eH.Text:find("%a")then b1=eH.Text break end
end end if not b1:find("%a")then b1=eG.Name end return(b1:lower():gsub("[^%a]",""))end local function sn()local cP,cQ
local lH=D:FindFirstChildOfClass("PlayerGui")if not lH then return nil,nil end for xG,cR in ipairs(lH:GetDescendants())do
if cR:IsA("GuiButton")and g_(cR)then local ha=eF(cR)if ha:sub(1,4)=="open"and not ha:find("shop",1,true)then cP=cP or cR end
if ha:sub(1,7)=="discard"then cQ=cQ or cR end end end if cP and cQ then return cP,cQ end if d.on then return cP,cQ end
return nil,nil end local hb=(function()local so,sp=pcall(function()return game:GetService("VirtualInputManager")end)return so and sp or nil end)()
local function lI(aS,hc)local hd={}local function lJ(sq)hd[#hd+1]=sq end if a.tapWay then lJ(a.tapWay)end for xH,lK in ipairs({"touch","conn","signal"})do
if lK~=a.tapWay then lJ(lK)end end local function lL(sr,...)local ss,he=pcall(getconnections,sr)if not(ss and type(he)=="table"and#he>0)then return false end
local lM,su,sv=false,{...},select("#",...)for xI,sw in ipairs(he)do if pcall(function()sw:Fire(table.unpack(su,1,sv))end)then lM=true end
end return lM end local function lN()local lO=Vector3 .new(0,0,0)pcall(function()local lP,lQ=aS.AbsolutePosition,aS.AbsoluteSize
lO=Vector3 .new(lP.X+lQ.X/2,lP.Y+lQ.Y/2,0)end)local hf={Position=lO,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()hf.UserInputType=Enum.UserInputType.Touch end)pcall(function()hf.UserInputState=Enum.UserInputState.End end)
return hf end for xJ,aT in ipairs(hd)do local cS=false if aT=="conn"and type(getconnections)=="function"then if lL(aS.MouseButton1Click)then
cS=true if ag(hc,1.5)then a.tapWay=aT return true,aT end end cS=lL(aS.Activated,lN(),1)elseif aT=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aS.MouseButton1Click)then if ag(hc,1.5)then a.tapWay=aT return true,aT end end cS=pcall(firesignal,aS.Activated,lN(),1)
elseif aT=="touch"and hb then cS=pcall(function()local lR,lS=aS.AbsolutePosition,aS.AbsoluteSize local lT=0 local lU=aS:FindFirstAncestorWhichIsA("ScreenGui")
local sx,sy=pcall(function()return lU and lU.IgnoreGuiInset end)if not(sx and sy)then pcall(function()lT=game:GetService("GuiService"):GetGuiInset().Y end)
end local lV,lW=lR.X+lS.X/2,lR.Y+lS.Y/2+lT hb:SendMouseButtonEvent(lV,lW,0,true,game,1)task.wait(0.06)hb:SendMouseButtonEvent(lV,lW,0,false,game,1)
end)end if cS and ag(hc,1.5)then a.tapWay=aT return true,aT end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function hg(lX)local cT=lX.Parent while cT and cT~=a.plot do if d.NOT[cT.Name]then return false end cT=cT.Parent
end local hh=(lX.ActionText or""):lower()if hh:find("roll",1,true)or hh:find("place",1,true)or hh:find("sell",1,true)then return false end
return true end local function sz()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local lY=a.plot:FindFirstChild("CrateStand")local cU if lY then for xK,eI in ipairs(lY:GetDescendants())do
if eI:IsA("ProximityPrompt")and eI.Enabled and hg(eI)then cU=eI break end end end if not cU then for xL,a8 in ipairs(a.plot:GetDescendants())do
if a8:IsA("ProximityPrompt")and a8 .Enabled and hg(a8)then local lZ=a8:FindFirstAncestorWhichIsA("Model")local sA=((a8 .ActionText or"").." "..(a8 .ObjectText or"").." "..a8 .Name.." "..(lZ and lZ.Name or"")):lower()
if sA:find("crate",1,true)then cU=a8 break end end end end d.prompt=cU return cU end local function hi()if d.on then return true end
local cV=sz()if not cV then d.summonFails=d.summonFails+1 d.lastFail=r()u("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local l0=ct(cV)if l0 then cK(l0,cV)end d.ours=true eD(cV,function()return d.on end)if ag(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=r()u("crate: pressed "..dY(cV).." but no window came up")
return false end do local function sB(l1)local b2=l1 .Parent while b2 and b2:IsA("GuiObject")do local l2,l3=false,false
for xM,cW in ipairs(b2:GetDescendants())do if cW~=l1 and cW:IsA("GuiButton")and eF(cW):sub(1,7)=="discard"then l2=true end
if cW:IsA("TextLabel")then local hj=cW.Text:lower()if hj:find("crate",1,true)or hj:find("can contain",1,true)or hj:find("cost",1,true)then l3=true end
end if l2 and l3 then return b2 end end b2=b2 .Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local l4=D:FindFirstChildOfClass("PlayerGui")if not l4 then return nil end for xN,eJ in ipairs(l4:GetDescendants())do
if eJ:IsA("GuiButton")and not eJ:FindFirstAncestor("SABFarmGui")and eF(eJ):sub(1,4)=="open"then local hk=sB(eJ)
if hk then d.win=hk return hk end end end end local function sC(sD)for xO,eK in ipairs(sD:GetDescendants())do
if eK:IsA("GuiButton")then local l5,hl=eF(eK),eK.Name:lower()if l5=="x"or l5=="close"or hl=="x"or hl:find("close",1,true)or hl:find("exit",1,true)then return eK end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(sE)task.wait(sE and 4 or 1.2)if d.on or d.waiting then return end
local eL=d.findWin()if not eL or not g_(eL)then return end local l6=sC(eL)if l6 and lI(l6,function()return not g_(eL)end)then return end
u("the crate window is still open - tap its X")end end local function eM(eN)if not hi()then return false end local l7=r()-(d.openedAt or 0)
if l7<0.6 then ak(0.6-l7)end local hm=d.title local sF,sG=sn()local l8=eN and sF or sG if not l8 then d.lastFail=r()
a.crateFails=a.crateFails+1 u(("crate: no %s button found in %s"):format(eN and"Open"or"Discard",hm))return false
end local sH=P()local sI,xP=lI(l8,function()return(not d.on)or(P()~=nil and P()~=sH)end)if not sI then d.lastFail=r()
a.crateFails=a.crateFails+1 u("crate: could not press "..(eN and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if eN then a.crates=a.crates+1 ag(function()return P()~=nil end,1.5)local l9=P()
u(("OPENED %s -> %s"):format(hm,l9 and aa(Q(l9))or"?"))else u("discarded "..hm.." (nothing ticked in it)")end
return true end d.calls={}function d.saw(sJ,...)local sK=select("#",...)d.calls[#d.calls+1]={t=r(),m=sJ,n=sK,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(ao,aU)local a9=type(ao)if(a9=="string"or a9=="number")and type(aU.data)=="table"then for l_,hn in pairs(aU.data)do
if hn==ao and type(l_)=="string"and(type(hn)=="string"or type(hn)=="number")then return{__slot="f:"..l_}end end
end if a9=="string"then if aU.crate and ao==aU.crate then return{__slot="crate"}end if aU.title and ao==aU.title then return{__slot="title"}end
if aU.rar and ao==aU.rar then return{__slot="rarity"}end return ao end if a9=="number"or a9=="boolean"or a9=="nil"then return ao end
if a9=="table"then local ma={}for sL,mb in pairs(ao)do if type(mb)=="table"then return nil,"nested table"end local sM,mc=d.slot(mb,aU)
if mc then return nil,mc end ma[sL]=sM end return ma end local sN,sO=pcall(function()return ao:IsA("Instance")end)
if sN and sO then if ao==D then return{__slot="player"}end if a.plot and ao==a.plot then return{__slot="plot"}end
local eO=a.plot and a.plot:FindFirstChild("CrateStand")if eO and ao==eO then return{__slot="stand"}end if eO and ao.Parent==eO then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..a9 ..")"end function d.resolve(eP)if type(eP)~="table"then return eP end
local az=eP.__slot if az and az:sub(1,2)=="f:"then return d.data and d.data[az:sub(3)]end if az=="crate"then return d.data and d.data.name end
if az=="title"then return(d.data and d.data.title)or d.title end if az=="rarity"then return d.data and d.data.rarity end
if az=="player"then return D end if az=="plot"then return a.plot end if az=="stand"or az=="model"then local ho=a.plot and a.plot:FindFirstChild("CrateStand")
if az=="stand"or not ho then return ho end for xQ,md in ipairs(ho:GetChildren())do if lF(md.Name)then return md end end
return nil end local me={}for sP,sQ in pairs(eP)do me[sP]=d.resolve(sQ)end return me end function d.classify(hp)
if d.directOff then return end local eQ={}for xR,hq in ipairs(d.calls)do if hq.t<=hp+0.05 and hp-hq.t<=6 then eQ[#eQ+1]=hq end
end if#eQ==0 then return end if not ag(function()return(d.heldAt or 0)>=hp-1 end,2.5)then return end local cX={}
for xS,cY in ipairs(eQ)do local mf={}for mg=1,cY.n do local sR,mh=d.slot(cY.args[mg],cY)if mh then u("crate call has "..mh.." - keeping the button method")
return end mf[mg]=sR end cX[#cX+1]={m=cY.m,n=cY.n,args=mf}end local hr=d.learned d.learned={seq=cX,mode=hr and hr.mode or nil}
V.dirty=true if not hr then u(("learned how to open crates directly (%d call%s)"):format(#cX,#cX==1 and""or"s"))end
end function d.replay()local mi=d.learned local mj=ay:FindFirstChild("Remotes")local hs=mj and mj:FindFirstChild("CrateAction")
if not(mi and hs)then return false end local mk=table.unpack or unpack d.replaying=true for xT,cZ in ipairs(mi.seq)do
local ht={}for ml=1,cZ.n do ht[ml]=d.resolve(cZ.args[ml])end task.spawn(function()pcall(function()if cZ.m=="InvokeServer"then hs:InvokeServer(mk(ht,1,cZ.n))
else hs:FireServer(mk(ht,1,cZ.n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(sS)return(sS:gsub("[%%|;=,\n]",function(sT)return("%%%02X"):format(sT:byte())end))end
function d.enc(bw)local eR=type(bw)if eR=="string"then return"s"..d.esc(bw)end if eR=="number"then return"n"..tostring(bw)end
if eR=="boolean"then return bw and"b1"or"b0"end if eR=="nil"then return"z"end if bw.__slot then return"k"..bw.__slot end
local hu={}for sU,sV in pairs(bw)do hu[#hu+1]=d.enc(sU).."="..d.enc(sV)end return"t"..table.concat(hu,",")end
function d.dec(mm)local c0,c1=mm:sub(1,1),mm:sub(2)local function sW(sX)return(sX:gsub("%%(%x%x)",function(sY)return string.char(tonumber(sY,16))end))end
if c0=="s"then return sW(c1)end if c0=="n"then return tonumber(c1)end if c0=="b"then return c1=="1"end if c0=="k"then return{__slot=c1}end
if c0=="t"then local mn={}for sZ in c1:gmatch("[^,]+")do local mo,s0=sZ:match("^(.-)=(.*)$")if mo then local mp=d.dec(mo)
if mp~=nil then mn[mp]=d.dec(s0)end end end return mn end return nil end function d.goneOrNew(s1)return function()
if not d.waiting then return true end local mq=P()return mq~=nil and mq~=s1 end end function d.near()local mr=ay:FindFirstChild("Remotes")
local ms=mr and mr:FindFirstChild("CrateAction")local hv=aN()local hw=a.plot and a.plot:FindFirstChild("CrateStand")
local hx=hw and hw:FindFirstChild("Spot")if not(ms and hv and hx)then return false,"no crate stand or remote"end
local hy=hv.HumanoidRootPart local eS=hy.CFrame local mt,hz=d.title,"no answer"local s2=P()local mu=hw:FindFirstChild("Holder")
local function mv()if not mu then return d.waiting or d.on end for xU,s3 in ipairs(mu:GetChildren())do if s3:IsA("Model")then return true end end
return false end for s4=1,3 do if not(d.waiting or d.on)or not mv()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end if(hy.Position-hx.Position).Magnitude>8 then cK(hx,d.prompt)end ak(0.12+0.15*s4)
local aH={}d.replaying=true task.spawn(function()aH.ok,aH.v=pcall(function()return ms:InvokeServer("open")end)
aH.done=true end)ag(function()return aH.done end,6)d.replaying=false local bx=aH.v if aH.done and aH.ok and type(bx)=="table"and bx.ok then
a.crates,d.fails,d.nearFails=a.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,r()+4 u(("OPENED %s -> %s (no window)"):format(mt,bx.prize and aa(Q(tostring(bx.prize)))or"?"))
ag(function()local mw=P()return mw~=nil and mw~=s2 end,1.5)if(hy.Position-eS.Position).Magnitude>8 then pcall(function()cJ(hv,eS.Position,eS.Position+eS.LookVector)end)end
return true,"opened"end hz=(aH.done and aH.ok and type(bx)=="table")and tostring(bx.reason or"refused, no reason given")
or(aH.done and("error: "..tostring(bx))or"no answer in 6s")ak(0.3)if not mv()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 u(("crate: the server would not open %s next to the stand (%s)"):format(mt,hz))
return false,hz end function d.smart()local hA=d.title if(d.nearFails or 0)<3 then local s5=d.near()if s5 then return true end
if d.nearFails>=3 then u("opening next to the stand failed 3 times - trying the older ways")end end local by=d.learned
if by then local hB=P()if d.on then d.replay()if ag(d.goneOrNew(hB),3.5)then a.crates=a.crates+1 u("OPENED "..hA.." (direct)")
return true end else if by.mode~="window"then d.replay()if ag(d.goneOrNew(hB),3.5)then a.crates,d.fails=a.crates+1,0
if by.mode~="direct"then by.mode,V.dirty="direct",true u("crates now open directly - the window never comes up")
end u("OPENED "..hA.." (direct, no window)")return true end end if hi()then d.replay()if ag(d.goneOrNew(hB),3.5)then
a.crates,d.fails=a.crates+1,0 if by.mode~="window"then by.mode,V.dirty="window",true u("crates need their window up first - it shows briefly")
end u("OPENED "..hA.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,V.dirty=by,nil,true
if d.fails>=3 then d.directOff=true u("direct crate opening failed 3 times - using the button for now")else u("the learned crate call did not work - back to pressing Open")
end end return eM(true)end function y.snap()return{rules=D:GetAttribute("AutoRollRules"),stop=D:GetAttribute("AutoRollStop"),
on=D:GetAttribute("AutoRollOn"),main=D:GetAttribute("AutoRoll")}end y.cache={}function y.watchCache()y.cache=y.snap()
for s6,mx in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do O(D:GetAttributeChangedSignal(mx):Connect(function()y.cache[s6]=D:GetAttribute(mx)end))
end end function y.isOn()return D:GetAttribute("AutoRollOn")==true end function y.saw(s7,...)local eT=y.cache
local s8={m=s7,n=select("#",...),args={...},before={rules=eT.rules,stop=eT.stop,on=eT.on,main=eT.main}}task.delay(1.5,function()
if a.alive then pcall(y.learnOne,s8)end end)end function y.learnOne(c2)local ai,c3=y.snap(),c2 .before local eU=(ai.rules~=c3 .rules)or(ai.stop~=c3 .stop)
local my=(ai.on~=c3 .on)or(ai.main~=c3 .main)if not eU and not my then return end local mz={}for mA=1,c2 .n do
local av=c2 .args[mA]local bz=type(av)if bz=="string"and av~=""and av==ai.rules then av={__slot="rules"}elseif bz=="string"and av~=""and eU and av==ai.stop and ai.stop~=c3 .stop then av={__slot="stop"}
elseif bz=="table"then local mB={}for s9,b3 in pairs(av)do if type(b3)=="table"or(type(b3)=="userdata")then y.msg="Auto Roll sends something I cannot repeat"return
end mB[s9]=(type(b3)=="string"and b3~=""and b3==ai.rules)and{__slot="rules"}or b3 end av=mB elseif bz~="string"and bz~="number"and bz~="boolean"and bz~="nil"then
if av==D then av={__slot="player"}else y.msg="Auto Roll sends something I cannot repeat"return end end mz[mA]=av
end local b4={m=c2 .m,n=c2 .n,args=mz}if eU then local hC=false for s_=1,b4 .n do local c4=b4 .args[s_]if type(c4)=="table"and c4 .__slot=="rules"then hC=true end
if type(c4)=="table"and not c4 .__slot then for xV,mC in pairs(c4)do if type(mC)=="table"and mC.__slot=="rules"then hC=true end end
end end if hC then y.rec.rules={b4}else table.insert(y.rec.rules,b4)if#y.rec.rules>60 then table.remove(y.rec.rules,1)end
end end if my then if ai.on==true then y.rec.on=b4 else y.rec.off=b4 end e.AutoRoll=(ai.on==true)end if ai.rules and ai.rules~=""then e.ARrules,e.ARstop=ai.rules,ai.stop or""end
V.dirty=true y.msg=""u(("learned an Auto Roll %s message"):format(eU and"choices"or(ai.on and"on"or"off")))end
function y.resolve(b5)if type(b5)~="table"then return b5 end if b5 .__slot=="rules"then return e.ARrules~=""and e.ARrules or D:GetAttribute("AutoRollRules")end
if b5 .__slot=="stop"then return e.ARstop~=""and e.ARstop or D:GetAttribute("AutoRollStop")end if b5 .__slot=="player"then return D end
local mD={}for ta,tb in pairs(b5)do mD[ta]=y.resolve(tb)end return mD end function y.replay(mE,tc)local mF=table.unpack or unpack
for xW,c5 in ipairs(tc)do local hD={}for mG=1,c5 .n do hD[mG]=y.resolve(c5 .args[mG])end y.replaying=true pcall(function()
if c5 .m=="InvokeServer"then task.spawn(function()pcall(function()mE:InvokeServer(mF(hD,1,c5 .n))end)end)else mE:FireServer(mF(hD,1,c5 .n))end
end)y.replaying=false task.wait(0.25)end end function y.apply(mH,td)if y.busy or not a.alive then return end y.busy=true
pcall(function()local mI=ay:FindFirstChild("Remotes")local hE=mI and mI:FindFirstChild("AutoRollAction")if not hE then y.msg="this game has no AutoRollAction"return end
local a_=e.AutoRoll if a_ and e.ARrules~=""and D:GetAttribute("AutoRollRules")~=e.ARrules then if#y.rec.rules==0 then
y.msg="pick your Auto Roll choices once in the game's menu so I can learn them"u(y.msg)else y.replay(hE,y.rec.rules)
if ag(function()return D:GetAttribute("AutoRollRules")==e.ARrules end,4)then u("Auto Roll choices put back")else
y.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"u(y.msg)end end end if a_==y.isOn()or(not a_ and not td)then return end
local eV=a_ and y.rec.on or y.rec.off if not eV then local c6=a_ and y.rec.off or y.rec.on local mJ=c6~=nil for te=1,c6 and c6 .n or 0 do
if type(c6 .args[te])=="boolean"then mJ=false end end if mJ then eV=c6 end end if not eV then y.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(a_ and"on"or"off")
u(y.msg)return end y.replay(hE,{eV})if ag(function()return y.isOn()==a_ end,4)then y.msg=""u(("Auto Roll switched %s%s"):format(a_ and"ON"or"OFF",mH and(" ("..mH..")")or""))
else y.msg="Auto Roll did not switch - do it once in the game so I can relearn it"u(y.msg)end end)y.busy=false
end l.HS=game:GetService("HttpService")l.uid=(function()local tf,tg=pcall(function()return D.UserId end)return tf and tg or 0 end)()
l.buyMsg,l.wishMsg,l.wishN="","",0 function l.info()if l.I then return l.I end local th,hF=pcall(function()return require(ay:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if th and type(hF)=="table"and type(hF.Pets)=="table"then l.I=hF end return l.I end function l.order()if l.list then return l.list end
local ba=l.info()if not ba then return{}end local bA={}if type(ba.Order)=="table"and#ba.Order>0 then for xX,mK in ipairs(ba.Order)do if ba.Pets[mK]then bA[#bA+1]=mK end end
else for ti in pairs(ba.Pets)do bA[#bA+1]=ti end table.sort(bA,function(tj,tk)return(ba.Pets[tj].price or 0)<(ba.Pets[tk].price or 0)end)
end l.list=bA return bA end function l.nice(mL,hG)local mM=l.info()local mN=mM and mM.Pets[mL]return((hG and hG~="")and(hG.." ")or"")..(mN and mN.displayName or tostring(mL))
end function l.data()local mO=D:GetAttribute("PetsData")if type(mO)~="string"then return nil end local tl,mP=pcall(function()return l.HS:JSONDecode(mO)end)
return(tl and type(mP)=="table")and mP or nil end function l.pen()return ay:FindFirstChild("PetMeadowSpawns")end
function l.srv()return aF:GetServerTimeNow()end function l.money()local hH=D:FindFirstChild("MoneyValue")if hH and type(hH.Value)=="number"then return hH.Value end
return aM()or 0 end function l.wishes()local mQ=l.pen()local mR=mQ and mQ:GetAttribute("Wishes")local hI,mS={},l.srv()
if type(mR)~="string"then return hI end local tm,mT=pcall(function()return l.HS:JSONDecode(mR)end)if tm and type(mT)=="table"then
for tn,hJ in pairs(mT)do if type(hJ)=="number"and hJ>mS then hI[tn]=hJ-mS end end end return hI end function l.call(...)
local mU=ay:FindFirstChild("Remotes")local mV=mU and mU:FindFirstChild("PetRequest")if not mV then return nil end
local mW=table.pack(...)local bB={}task.spawn(function()bB.ok,bB.v=pcall(function()return mV:InvokeServer(table.unpack(mW,1,mW.n))end)
bB.done=true end)local to=r()while not bB.done and r()-to<6 do task.wait(0.05)end if bB.done and bB.ok then return bB.v end
return nil end function l.want(tp)return e.Pets[tp]end function l.buyTick()if not e.PetBuy then l.buyMsg="auto adopt is off"return end
local hK,mX,eW=l.info(),l.pen(),l.data()if not(hK and mX and eW)then l.buyMsg="pet data not loaded yet"return end
l.tryAt=l.tryAt or{}local c7,hL=#(eW.pets or{}),tonumber(eW.maxOwned)or 60 local tq,mY,c8=l.srv(),{},nil for xY,aA in ipairs(mX:GetChildren())do
mY[aA.Name]=true local bC,eX=aA:GetAttribute("Pet"),aA:GetAttribute("Variant")or""local hM=bC and l.want(bC)if hM and hM.b and hK.Pets[bC]and(not hM.g or eX=="Big")and x.wantMore(bC,eX,eW)and not aA:GetAttribute("A_"..l.uid)
and(tonumber(aA:GetAttribute("ExpiresAt"))or 0)>tq+1 and r()>=(l.tryAt[aA.Name]or 0)then local c9,mZ=l.nice(bC,eX),hK.Pets[bC].price or 0
if c7>=hL then c8=("%s is in the pen, but you have %d/%d pets"):format(c9,c7,hL)l.tryAt[aA.Name]=r()+15 elseif l.money()<mZ then
c8=("%s is in the pen - need $%s"):format(c9,as(mZ))l.tryAt[aA.Name]=r()+5 else l.tryAt[aA.Name]=r()+8 local bc=l.call("adopt",aA.Name)
if type(bc)=="table"and bc.ok then c7=c7+1 l.buys=(l.buys or 0)+1 l.recent=l.recent or{}local tr=type(bc.pet)=="table"and bc.pet or{}
table.insert(l.recent,{id=tostring(tr.id or("?"..r())),name=bC,variant=eX,at=r()})if#l.recent>30 then table.remove(l.recent,1)end
u("ADOPTED "..c9)c8="adopted "..c9 else local m0=type(bc)=="table"and tostring(bc.reason or"no reason given")or"no answer"
u(("adopt %s failed: %s"):format(c9,m0))c8="adopt failed: "..m0 if type(bc)=="table"and bc.bagFull then l.tryAt[aA.Name]=r()+60 end
end end end end for m1 in pairs(l.tryAt)do if not mY[m1]then l.tryAt[m1]=nil end end l.buyMsg=c8 or("watching the pen (%d/%d pets)"):format(c7,hL)
end function l.wishTick()if not e.PetWish then l.wishMsg="auto wish is off"return end local eY=l.info()if not(eY and l.pen())then l.wishMsg="pet data not loaded yet"return end
l.wishTry,l.wishWhy=l.wishTry or{},l.wishWhy or{}local eZ,hN,bd=l.wishes(),0,nil local ts=(type(eY.Wish)=="table"and eY.Wish.cashShare)or 2
local tt=l.data()for xZ,am in ipairs(l.order())do local m2=l.want(am)if m2 and m2 .w and x.wantMore(am,"",tt)then
hN=hN+1 if not eZ[am]and r()>=(l.wishTry[am]or 0)then local hO=tonumber(D:GetAttribute("PetWishCredits"))or 0
local hP=math.floor((eY.Pets[am].price or 0)*ts)if hO<=0 and l.money()<hP then l.wishTry[am]=r()+10 bd=("need $%s to wish for %s"):format(as(hP),l.nice(am))
l.wishWhy[am]=bd else l.wishTry[am]=r()+3 local tu=hO>0 and"wishCredit"or"wish"local e0=l.call(tu,am)if type(e0)=="table"and e0 .ok then
l.wishN,l.wishWhy[am]=l.wishN+1,nil u(("WISHED for %s (%s)"):format(l.nice(am),hO>0 and"free wish"or("$"..as(hP))))
else local hQ=type(e0)=="table"and tostring(e0 .reason or"no reason given")or"no answer"if hQ:lower():find("already",1,true)then l.wishTry[am]=r()+2
else u(("wish %s failed: %s"):format(l.nice(am),hQ))bd="wish failed: "..hQ end end end end end end if not bd then
for x0,e1 in ipairs(l.order())do local m3=l.want(e1)if m3 and m3 .w and not eZ[e1]and l.wishWhy[e1]then bd=l.wishWhy[e1]break end
end end if not bd then local e2={}for x1,e3 in ipairs(l.order())do local m4=l.want(e3)if m4 and m4 .w and eZ[e3]then e2[#e2+1]=("%s %dm"):format(l.nice(e3),math.ceil(eZ[e3]/60))end
end bd=hN==0 and"no pet has WISH ticked"or("running: "..(#e2>0 and table.concat(e2,", ")or"none yet"))end l.wishMsg=bd
end o.switches,o.glazed,o.finished=0,0,0 function o.teams()local hR=l.data()return(hR and hR.teams)or{},hR end
function o.current(b6)b6=b6 or l.data()if not b6 then return""end local m5={}for x2,tv in ipairs(b6 .equipped or{})do m5[tostring(tv)]=true end
for x3,m6 in ipairs(b6 .teams or{})do local m7=m6 .pets or{}local hS=#m7==#(b6 .equipped or{})if hS then for x4,tw in ipairs(m7)do if not m5[tostring(tw)]then hS=false break end end end
if hS then return m6 .name end end return""end function o.equip(hT)local tx,ty=o.teams()local hU for tz,tA in ipairs(tx)do if tA.name==hT then hU=tz break end end
if not hU then o.msg="no saved team called "..tostring(hT)return false end if o.current(ty)==hT then return true end
for x5=1,4 do local m8=l.call("teamEquip",hU)if type(m8)=="table"and m8 .ok then o.switches=o.switches+1 return true
end task.wait(0.4)end return false end function o.waxes()local c_={}local m9=a.plot and a.plot:FindFirstChild("WaxStations")
if not m9 then return c_ end for x6,bD in ipairs(m9:GetChildren())do local m_=tonumber(bD:GetAttribute("PourEnd"))
local na=bD:GetAttribute("PourOwner")if bD:GetAttribute("HasSquishy")and m_ and(na==nil or na==l.uid)then local nb,nc=bD:FindFirstChild("SquishyPlaceHolder"),"?"
if nb then for x7,nd in ipairs(nb:GetChildren())do if nd:IsA("Model")then nc=nd.Name break end end end local tB=tostring(bD:GetAttribute("Helpers")or"")
local hV=0 for x8 in tB:gmatch("%d+")do hV=hV+1 end c_[#c_+1]={st=bD,ends=m_,id=bD:GetAttribute("PourId"),name=nc,helps=hV}
end end table.sort(c_,function(tC,tD)return tC.ends<tD.ends end)return c_ end function o.glazeCount()local ne=ay:FindFirstChild("Remotes")
local nf=ne and ne:FindFirstChild("EditStack")if not nf then return nil end local tE,da=pcall(function()return nf:InvokeServer("State",nil)end)
if not(tE and type(da)=="table"and type(da.state)=="table")then return nil end local hW,hX=0,{}for x9,e4 in ipairs(da.state.entries or{})do
if e4 .glaze and e4 .glaze~=""then hW=hW+1 hX[e4 .glaze]=(hX[e4 .glaze]or 0)+1 end end return hW,hX,#(da.state.entries or{}),da.state.capacity
end function o.finishedOne(e5,ng)o.finished=o.finished+1 task.wait(2)local hY,tF,nh,tG=o.glazeCount()if hY and ng and hY>ng then
o.glazed=o.glazed+1 local hZ={}for tH,tI in pairs(tF)do hZ[#hZ+1]=tH.." "..tI end u(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(aa(Q(e5 .name)),e5 .st.Name,hY,table.concat(hZ,", ")))
else u(("wax done on station %s: %s, no glaze%s"):format(e5 .st.Name,aa(Q(e5 .name)),nh and(" (stack "..nh.."/"..tostring(tG)..")")or""))
end end function o.tick()o.list=o.waxes()if o.editing and r()-(o.editingSince or r())>120 then o.editing=false end
if o.editing then o.msg="rebuilding teams..."return end if not e.Teams then o.want,o.msg="","auto teams is off"return end
local h0=l.srv()local be=o.glazeFor if be then local e6=be.st local tJ=e6 .Parent and e6:GetAttribute("HasSquishy")and e6:GetAttribute("PourId")==be.id
if not tJ or h0>be.ends+40 then o.glazeFor,o.afterUntil=nil,r()+1.5 local tK=be.before task.spawn(function()pcall(o.finishedOne,be,tK)end)
else be.ends=tonumber(e6:GetAttribute("PourEnd"))or be.ends end end if e.TeamGlaze~=""and not o.glazeFor then
for x_,h1 in ipairs(o.list)do if h1 .ends-h0<=e.GlazeLead then o.glazeFor=h1 task.spawn(function()h1 .before=o.glazeCount()end)
break end end end local aw,e7="",""if e.TeamGlaze~=""and(o.glazeFor or r()<(o.afterUntil or 0))then aw,e7=e.TeamGlaze,o.glazeFor and(" - station "..o.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(o.placing or o.aboutToPlace())then aw,e7=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and o.allBusy()then
aw,e7=e.TeamFull," - every station is busy"else aw=e.TeamNormal end o.want=aw local db=o.current()o.cur=db if aw~=""and db~=aw and r()>=(o.nextTry or 0)then
o.nextTry=r()+1.1 if o.equip(aw)then u("team: "..aw..e7)else o.nextTry=r()+3 end end local h2=o.list[1]o.msg=("on: %s%s | next wax done %s"):format(db~=""and db or"(not a saved team)",(aw~=""and aw~=db)and(" -> "..aw)or"",
h2 and("in "..o.clock(h2 .ends-h0).." (st "..h2 .st.Name..")")or"- none running")end function o.clock(bf)bf=math.max(0,math.floor(bf))
if bf>=3600 then return("%d:%02d:%02d"):format(math.floor(bf/3600),math.floor((bf%3600)/60),bf%60)end return("%d:%02d"):format(math.floor(bf/60),bf%60)
end function o.allBusy()local tL,tM=d0()return tM>0 and tL==0 end function o.aboutToPlace()if not a.running then return false end
local ni=P()if not(ni and aL(ni))then return false end local tN=d0()return tN>0 end function o.expectSocialWax(tO)
local tP,nj=o.teams()local h3=l.info()local h4=0 if not(h3 and nj)then return 0 end for ya,nk in ipairs(tP)do
if nk.name==tO then for yb,tQ in ipairs(nk.pets or{})do for yc,dc in ipairs(nj.pets or{})do local e8=h3 .Pets[dc.name]
if tostring(dc.id)==tostring(tQ)and e8 and e8 .boost and e8 .boost.kind=="socialWax"then local tR,tS=pcall(function()return h3 .boostValue(dc.name,(dc.variant~=""and dc.variant)or nil)end)
h4=math.max(h4,(tR and tonumber(tS))or e8 .boost.value or 0)end end end end end return h4 end function o.glazeSoon()
return e.Teams and e.TeamGlaze~=""and(o.glazeFor~=nil or r()<(o.afterUntil or 0))end x.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,
glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}x.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}
x.buildMsg,x.fuseMsg,x.fused,x.builds="","",0,0 function x.need()return D:GetAttribute("FusePass")==true and 3 or 7 end
function x.caps()local h5=l.info()return(h5 and type(h5 .Caps)=="table")and h5 .Caps or x.CAPS end function x.value(nl,h6)
local e9=l.info()local b7=e9 and e9 .Pets[nl]if not(b7 and type(b7 .boost)=="table")then return nil end local bE
if type(e9 .boostValue)=="function"then local tT,tU=pcall(e9 .boostValue,nl,(h6~=""and h6)or nil)bE=tT and tonumber(tU)or nil
end if not bE then bE=b7 .boost.value or 0 if h6=="Big"then local nm=bE*1.5 bE=x.ROUND[b7 .boost.kind]and math.max(bE+1,math.floor(nm+0.5))or nm
end end return b7 .boost.kind,bE,b7 .boost.every end function x.stats(tV)local bF,h7={},{}for yd,nn in ipairs(tV)do
local aB,e_,no=x.value(nn.name,nn.variant or"")if aB then if aB:sub(1,6)=="social"then h7[aB]=math.max(h7[aB]or 0,e_)
elseif aB=="waxStir"or aB=="cashGift"then bF[aB]=(bF[aB]or 0)+e_*60/(no or 60)elseif aB=="luckyPull"then bF.luckyPull=(bF.luckyPull or 0)+e_/(no or 10)
else bF[aB]=(bF[aB]or 0)+e_ end end end return bF,h7 end function x.glazeGain(tW,fa)local dd,h8,ye={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local tX=dd[1]+dd[2]+dd[3]local tY=tonumber(D:GetAttribute("GuildUpGlaze"))or 0 local b8={}for fb=1,3 do b8[fb]=dd[fb]+tW*dd[fb]/tX+(fb==1 and tY or 0)end
local h9={b8[1]*(1-fa),b8[2]*(1-fa)+b8[1]*fa,b8[3]+b8[2]*fa}return h9[1]*(h8[1]-1)+h9[2]*(h8[2]-1)+h9[3]*(h8[3]-1)
end function x.score(fc,tZ)local h_=x.caps()local fd,fe=x.stats(tZ)local function bh(np)return math.min(fd[np]or 0,h_[np]or math.huge)end
local t0=(1+bh("income"))*(1+(fe.socialIncome or 0))*(1+math.min(fd.cashGift or 0,h_.cashGiftPerMinute or 9)/60)
local t1=1+bh("luck")+(fd.luckyPull or 0)+(fe.socialLuck or 0)local nq=t1*(1+bh("newFind"))local de=math.log(t0)
if fc=="farm"then return de+0.7*math.log(nq)end if fc=="full"then local t2=math.max(tonumber(D:GetAttribute("WaxStations"))or 18,1)
local t3=math.min(fd.waxStir or 0,h_.waxStirPerMinute or 30)return de+math.log(1+t3/60/t2)+0.1*math.log(nq)end
if fc=="glaze"then return x.glazeGain(bh("glaze"),bh("glazeUp"))+0.001*de end if fc=="wax"then local t4=(1+bh("waxSpeed")+bh("longWax"))*(1+(fe.socialWax or 0))
local t5=1-(1-bh("headStart"))*(1-(fe.socialHeadStart or 0))return math.log(t4)-math.log(1-0.5*t5)+0.001*de end
return de end function x.best(nr,b9,t6,ia)ia=ia or{}local aj,df={},{}local function ns(t7)local nt={}for t8,t9 in ipairs(t7)do nt[t8]=b9[t9]end return nt end
local function ib(nu)local ic=x.score(nr,ns(nu))for yf,t_ in ipairs(nu)do if ia[b9[t_].id]then ic=ic+1e-7 end end
return ic end for yg=1,math.min(t6,#b9)do local ff,ie for ig=1,#b9 do if not df[ig]then aj[#aj+1]=ig local nv=ib(aj)
aj[#aj]=nil if not ie or nv>ie+1e-12 then ff,ie=ig,nv end end end if not ff then break end df[ff]=true aj[#aj+1]=ff
end for yh=1,6 do task.wait()local nw,nx=false,ib(aj)for ih=1,#aj do for ii=1,#b9 do if not df[ii]then local ny=aj[ih]
aj[ih]=ii local nz=ib(aj)if nz>nx+1e-9 then df[ny],df[ii],nx,nw=nil,true,nz,true else aj[ih]=ny end end end end
if not nw then break end end local nA={}for ua,ub in ipairs(aj)do nA[ua]=tostring(b9[ub].id)end return nA,x.score(nr,ns(aj))
end function x.count(nB,nC,uc)local dg,dh={},0 local nD,nE={},{}for yi,ud in ipairs(nC.arriving or{})do nD[tostring(ud)]=true end
for yj,b_ in ipairs(nC.pets or{})do nE[tostring(b_.id)]=true if b_.name==nB and not nD[tostring(b_.id)]then if b_.variant=="Big"then dh=dh+1 elseif(b_.variant or"")==""then dg[#dg+1]=b_ end
end end if not uc then for yk,di in ipairs(l.recent or{})do if di.name==nB and not nE[di.id]and r()-di.at<20 then
if di.variant=="Big"then dh=dh+1 else dg[#dg+1]=di end end end end return dg,dh end function x.goal(ue)local nF=e.Pets[ue]return nF and tonumber(nF.f)or 0 end
function x.wantMore(nG,uf,nH)local ij=x.goal(nG)if ij<=0 or not nH then return true end local ug,nI=x.count(nG,nH)
if nI>=ij then return false end if uf=="Big"then return true end return#ug<x.need()*(ij-nI)end function x.status(nJ,nK)
local fg=x.goal(nJ)if fg<=0 or not nK then return nil end local uh,ik=x.count(nJ,nK)if ik>=fg then return("Big %d/%d done"):format(ik,fg)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#uh,x.need()),x.need(),ik,fg)end function x.wear(il)local im={}
for yl,ui in ipairs(il)do im[tostring(ui)]=true end for ym=1,3 do local ca=l.data()if not ca then return false end
for yn,nL in ipairs(ca.equipped or{})do if not im[tostring(nL)]then l.call("unequip",nL)task.wait(0.3)end end
ca=l.data()local nM={}for yo,uj in ipairs(ca.equipped or{})do nM[tostring(uj)]=true end for yp,nN in ipairs(il)do
if not nM[tostring(nN)]then l.call("equip",nN)task.wait(0.3)end end task.wait(0.4)ca=l.data()local io,nO=0,true
for yq,uk in ipairs(ca.equipped or{})do io=io+1 if not im[tostring(uk)]then nO=false end end if nO and io==#il then return true end
end return false end function x.saveTeam(nP,nQ)if not x.wear(nQ)then return false,"could not put the pets on"end
local ul=o.teams()local bG for um,un in ipairs(ul)do if un.name==nP then bG=um break end end local cb if bG then
cb=l.call("teamSave",bG)else cb=l.call("teamNew")if type(cb)=="table"and cb.ok and cb.index then bG=cb.index task.wait(0.3)
l.call("teamRename",{index=bG,name=nP})end end task.wait(0.4)local ip=l.data()local nR=ip and ip.teams and bG and ip.teams[bG]
if not nR then return false,"the game did not save it"end local nS={}for yr,uo in ipairs(nR.pets or{})do nS[tostring(uo)]=true end
for ys,up in ipairs(nQ)do if not nS[tostring(up)]then return false,"saved, but not with these pets"end end return true
end x.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function x.quiet()
if o.placing or o.glazeSoon()then return false end local uq=l.srv()for yt,ur in ipairs(o.list or{})do if ur.ends-uq<(e.GlazeLead or 45)+90 then return false end end
return true end function x.plan()local dj=l.data()if not dj then return{}end local nT={}for yu,us in ipairs(dj.arriving or{})do nT[tostring(us)]=true end
local dk={}for yv,fh in ipairs(dj.pets or{})do if not nT[tostring(fh.id)]then dk[#dk+1]={id=tostring(fh.id),name=fh.name,variant=fh.variant or""}end
end local nU={}for yw,nV in ipairs(dk)do nU[nV.id]=nV end local nW=tonumber(dj.slots)or 3 local iq,nX={},{}for yx,fi in ipairs(x.ROLES)do
local dl=e[fi[1]]if dl~=""and not nX[dl]then nX[dl]=true local ir,dm,nY={},{},false for yy,nZ in ipairs(dj.teams or{})do
if nZ.name==dl then for yz,ut in ipairs(nZ.pets or{})do local is=nU[tostring(ut)]if is then ir[is.id]=true dm[#dm+1]=is else nY=true end
end end end local it,n0=x.best(fi[2],dk,nW,ir)local n1=x.score(fi[2],dm)local n2=#it==#dm for yA,uu in ipairs(it)do if not ir[uu]then n2=false end end
if not n2 and(nY or#dm<math.min(nW,#dk)or n0>n1+1e-4)then iq[#iq+1]={team=dl,role=fi[2],ids=it,gain=n0-n1}end
end end return iq end function x.rebuild(uv)local n3=x.plan()if#n3==0 then x.buildMsg="teams are already the best your pets allow"return true end
if not x.quiet()then x.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end o.editing,o.editingSince=true,r()
local fj=true local uz,uA=pcall(function()for yB,dn in ipairs(n3)do local uw,ux=x.saveTeam(dn.team,dn.ids)local n4=l.data()
local iu={}for yC,uy in ipairs(dn.ids)do for yD,iv in ipairs(n4 and n4 .pets or{})do if tostring(iv.id)==uy then iu[#iu+1]=l.nice(iv.name,iv.variant)end
end end if uw then u(("TEAM %s rebuilt (%s): %s"):format(dn.team,uv or"pets changed",table.concat(iu,", ")))else fj=false u(("TEAM %s: %s"):format(dn.team,tostring(ux)))end
end end)o.editing,o.nextTry=false,0 if not uz then fj=false u("TEAM BUILD ERR "..tostring(uA))end x.builds=x.builds+1
x.buildMsg=fj and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fj end
function x.fuseTick()if not e.AutoFuse or o.editing then return end local fk=l.data()if not fk then return end
local iw=x.need()local ix,fl={},{}for yE,uB in ipairs(fk.teams or{})do for yF,uC in ipairs(uB.pets or{})do ix[tostring(uC)]=true end end
for yG,uD in ipairs(fk.equipped or{})do fl[tostring(uD)]=true end x.failUntil=x.failUntil or{}for bH,uE in pairs(e.Pets)do
local n5=tonumber(uE.f)or 0 local iy,uF=x.count(bH,fk,true)if n5>0 and uF<n5 and#iy>=iw and r()>=(x.failUntil[bH]or 0)then
table.sort(iy,function(fm,fn)local n6=(fl[tostring(fm.id)]and 4 or 0)+(ix[tostring(fm.id)]and 2 or 0)+(fm.named and 1 or 0)
local n7=(fl[tostring(fn.id)]and 4 or 0)+(ix[tostring(fn.id)]and 2 or 0)+(fn.named and 1 or 0)if n6~=n7 then return n6<n7 end
return tostring(fm.id)<tostring(fn.id)end)local fo,iz={},{}for fp=1,iw do fo[fp]=tostring(iy[fp].id)if fl[fo[fp]]then iz[#iz+1]=fo[fp]end
end o.editing,o.editingSince=true,r()for yH,uG in ipairs(iz)do l.call("unequip",uG)task.wait(0.3)end local fq=l.call("fuse",{ids=fo})
o.editing,o.nextTry=false,0 if type(fq)=="table"and fq.ok then x.fused=x.fused+1 x.dirtyAt=r()u(("FUSED %d %s -> Big %s"):format(iw,l.nice(bH),l.nice(bH)))
x.fuseMsg=("fused a Big %s %s"):format(l.nice(bH),os.date("%H:%M"))else x.failUntil[bH]=r()+120 u(("fuse %s failed: %s"):format(l.nice(bH),type(fq)=="table"and tostring(fq.reason or"no reason given")or"no answer"))
end return end end end function x.tick()pcall(x.fuseTick)if not e.AutoBuild or not e.Teams then return end local n8=l.data()
if not n8 then return end local bI={}for yI,uH in ipairs(n8 .pets or{})do bI[#bI+1]=tostring(uH.id)end table.sort(bI)
bI=table.concat(bI,",")if bI~=x.sig then x.sig,x.dirtyAt=bI,r()end local uI=(x.dirtyAt and r()-x.dirtyAt>8)or r()-(x.lastBuild or 0)>900
if uI and not o.editing then local uJ=x.rebuild(x.dirtyAt and"pets changed"or"check")if uJ then x.dirtyAt,x.lastBuild=nil,r()end
end end q.bb,q.fx,q.post,q.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}q.watch=setmetatable({},{__mode="k"})
q.mem,q.memPeak,q.fps=0,0,0 function q.isFx(bJ)return bJ:IsA("ParticleEmitter")or bJ:IsA("Trail")or bJ:IsA("Beam")or bJ:IsA("Fire")or bJ:IsA("Smoke")
or bJ:IsA("Sparkles")or bJ:IsA("Light")end function q.muteOne(ap)if not e.Lite or not ap.Parent then return end
local fr=(ap:IsA("BillboardGui")and q.bb)or(q.isFx(ap)and q.fx)or nil if not fr or fr[ap]~=nil then return end
fr[ap]=ap.Enabled if ap.Enabled then ap.Enabled=false end q.watch[ap]=ap:GetPropertyChangedSignal("Enabled"):Connect(function()
if e.Lite and ap.Enabled then fr[ap]=true ap.Enabled=false end end)end function q.lite(n9)e.Lite=n9 if n9 then
task.spawn(function()for uK,uL in ipairs(aF:GetDescendants())do if not e.Lite then return end pcall(q.muteOne,uL)
if uK%600==0 then task.wait()end end end)if not q.addConn then q.queue={}q.addConn=O(aF.DescendantAdded:Connect(function(iA)
if e.Lite and(iA:IsA("BillboardGui")or q.isFx(iA))then q.queue[#q.queue+1]=iA end end))end local iB=game:GetService("Lighting")
for yJ,dp in ipairs(iB:GetChildren())do if dp:IsA("PostEffect")and dp.Enabled and q.post[dp]==nil then q.post[dp]=true dp.Enabled=false end
end pcall(function()q.oldShadows=q.oldShadows==nil and iB.GlobalShadows or q.oldShadows iB.GlobalShadows=false end)
pcall(function()q.oldDeco=q.oldDeco==nil and aF.Terrain.Decoration or q.oldDeco aF.Terrain.Decoration=false end)
else for yK,uM in pairs(q.watch)do pcall(function()uM:Disconnect()end)end for n_,uN in pairs(q.bb)do pcall(function()if n_.Parent then n_.Enabled=uN end end)end
for oa,uO in pairs(q.fx)do pcall(function()if oa.Parent then oa.Enabled=uO end end)end for ob in pairs(q.post)do pcall(function()if ob.Parent then ob.Enabled=true end end)end
q.bb,q.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})q.watch,q.post,q.queue=setmetatable({},{__mode="k"}),{},{}
local uP=game:GetService("Lighting")if q.oldShadows~=nil then pcall(function()uP.GlobalShadows=q.oldShadows end)q.oldShadows=nil end
if q.oldDeco~=nil then pcall(function()aF.Terrain.Decoration=q.oldDeco end)q.oldDeco=nil end end end q.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function q.hideHud(oc)e.HideHud=oc local iC=D:FindFirstChildOfClass("PlayerGui")if not iC then return end if oc then
for yL,dq in ipairs(iC:GetChildren())do if dq:IsA("ScreenGui")and not q.MINE[dq.Name]and dq.Enabled then q.hud[dq]=true dq.Enabled=false end
end if not q.hudConn then q.hudConn=O(iC.ChildAdded:Connect(function(dr)if e.HideHud and dr:IsA("ScreenGui")and not q.MINE[dr.Name]then
task.defer(function()if e.HideHud and dr.Enabled then q.hud[dr]=true dr.Enabled=false end end)end end))end else
for od in pairs(q.hud)do pcall(function()if od.Parent then od.Enabled=true end end)end q.hud={}end end q.CAPS={0,30,15,10}
function q.cap(iD)e.FpsCap=iD local oe=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not oe then return false end return pcall(oe,iD==0 and 60 or iD)end function q.render(of)e.NoRender=of pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not of)end)
end function q.restoreAll()pcall(q.lite,false)pcall(q.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(q.cap,0)end end function q.rejoinSame(og)if a.rejoining then return end u("REJOIN this server ("..og..")")
pcall(d3)if a.autoload then pcall(er,a.autoload)end gS()local uQ=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,D)
end)task.delay(25,function()if a.alive then cG(og..", same server failed")end end)return uQ end function q.tick()
local iE=q.queue if e.Lite and iE and#iE>0 then q.queue={}for uR,uS in ipairs(iE)do pcall(q.muteOne,uS)if uR%300==0 then task.wait()end end
end local uT,ds=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if uT and type(ds)=="number"then
q.mem=ds q.memPeak=math.max(q.memPeak,ds)if(e.MemLimit or 0)>0 and ds>e.MemLimit then q.over=(q.over or 0)+1 if q.over>=30 and not a.busy then
q.over=-600 q.rejoinSame(("memory %d MB > %d MB"):format(ds,e.MemLimit))end elseif(q.over or 0)>0 then q.over=0
end end if r()-(q.noteAt or 0)>1800 then q.noteAt=r()u(("health: %d fps, %d MB (peak %d)"):format(math.floor(q.fps+0.5),q.mem,q.memPeak))
end end a.sellWords={"sell","trash","discard","dispose","bin"}local function iF(fs)if type(fs)~="string"then return false end
fs=fs:lower()for yM,uU in ipairs(a.sellWords)do if fs:find(uU,1,true)then return true end end return false end
local function uV()local oh=ay:FindFirstChild("Remotes")local iG=oh and oh:FindFirstChild("SellSquishy")if not(iG and iG:IsA("RemoteEvent"))then return false end
if not pcall(function()iG:FireServer()end)then return false end return ag(function()return P()==nil end,1.5)end
local function uW()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end if r()-a.sellSearchAt<20 then return nil end
a.sellSearchAt=r()local oi=aN()local oj=oi and oi.HumanoidRootPart.Position local dt,ol for yN,cc in ipairs((a.plot or aF):GetDescendants())do
if cc:IsA("ProximityPrompt")and(iF(cc.ActionText)or iF(cc.ObjectText)or iF(cc.Name))then local om=j4(cc)local iH=(om and oj)and(om-oj).Magnitude or 1e9
if iH<=400 and(not dt or iH<ol)then dt,ol=cc,iH end end end a.sellSpot=dt a.noSellSpot=(dt==nil)return dt end
local function oo()local iI=P()if not iI then a.holding=false return false end if aL(iI)then return false end
local iJ=aa(Q(iI))if uV()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=r()+2.5,0
u("SOLD "..iJ)return true end local cd=uW()if cd then local op=ct(cd)if op then cK(op,cd)local oq=P()if oq and not aL(oq)then
local uX,uY=eD(cd,function()return P()==nil end,function()return cd.Enabled end)if uX then a.sold,a.holding,a.sellFails=a.sold+1,false,0
u(("SOLD %s at %s via %s"):format(iJ,dY(cd),uY))return true end end end end a.sellFails=a.sellFails+1 u("could not sell "..iJ.." ("..a.sellFails..")")
return false end local uZ={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function u0(ce)local ft=dY(ce):lower()for yO,u1 in ipairs(uZ)do if ft:find(u1,1,true)then return 0 end end
local aI,ab=ce.Name:lower(),0 local function aC(u2,u3)return u2:find(u3,1,true)~=nil end if aC(aI,"collect")then ab=ab+60 end
if aC(aI,"cash")or aC(aI,"money")then ab=ab+45 end if aC(aI,"income")or aC(aI,"claim")then ab=ab+35 end if aC(aI,"coin")or aC(aI,"earn")or aC(aI,"green")then ab=ab+20 end
if aI=="pad"or aI=="touch"then ab=ab+25 end if ab==0 and(aC(ft,"collect")or aC(ft,"cash")or aC(ft,"money"))then ab=25 end
if ab==0 then return 0 end local du=ce.Color if du.G>0.5 and du.G>du.R*1.4 and du.G>du.B*1.4 then ab=ab+15 end
if math.min(ce.Size.X,ce.Size.Y,ce.Size.Z)<2 then ab=ab+5 end return ab end local function u4()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or r()-a.padSearchAt<20 then return nil end a.padSearchAt=r()local fu,dv,iK={},nil,29 for yP,fv in ipairs(a.plot:GetDescendants())do
if fv:IsA("BasePart")then local fw=u0(fv)if fw>0 then fu[#fu+1]={s=fw,p=fv}if fw>iK then dv,iK=fv,fw end end end
end table.sort(fu,function(u5,u6)return u5 .s>u6 .s end)a.padCands,a.padPart=fu,dv if dv then u("collect pad: "..dY(dv).." (score "..iK..")")end
return dv end local iL="SAB_pad_v1.txt"local function u7(u8)if type(writefile)=="function"then pcall(writefile,iL,table.concat({u8:GetComponents()},","))end
end local function u9()if type(isfile)~="function"or type(readfile)~="function"then return nil end local u_,ot=pcall(function()if isfile(iL)then return readfile(iL)end end)
if not u_ or type(ot)~="string"then return nil end local fy={}for va in ot:gmatch("[^,]+")do fy[#fy+1]=tonumber(va)end
if#fy==12 then return CFrame.new(unpack(fy))end end local function vb(iM,fz,vc)local vd=g1(iM)local iN=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aD=(iN and iN:IsA("BasePart"))and(iN.Position-fz)or Vector3 .new(1,0,0)aD=Vector3 .new(aD.X,0,aD.Z)if aD.Magnitude<0.05 then aD=Vector3 .new(1,0,0)end
aD=aD.Unit for ve=0,7 do local fA=ve*math.pi/4 local vf=Vector3 .new(aD.X*math.cos(fA)-aD.Z*math.sin(fA),0,aD.X*math.sin(fA)+aD.Z*math.cos(fA))
local fB=fz+vf*(vc+5)local iO=lk(fB.X,fz.Y,fB.Z)if iO and math.abs(iO.Y-fz.Y)<8 then cJ(iM,Vector3 .new(fB.X,iO.Y+vd,fB.Z))
if g2(iM,0.7)then return true end end end return false end local function vg()a.lastCollect=r()local dw=aN()if not dw then return end
local ou,vh=dw.HumanoidRootPart,g1(dw)local dx,ov,dy,iP=nil,4,nil,"?"local iQ=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if a.manualPad and iQ and iQ:IsA("BasePart")then dx,iP=(iQ.CFrame*a.manualPad).Position,"manual pad"else local aV=u4()
if aV then dx=Vector3 .new(aV.Position.X,aV.Position.Y+aV.Size.Y/2+vh,aV.Position.Z)ov,dy,iP=math.max(aV.Size.X,aV.Size.Z)/2,aV,aV.Name
end end if not dx then u("COLLECT: pad not found - stand on it and tap SET PAD")return end local iR=aM()cJ(dw,dx)
if dy and type(firetouchinterest)=="function"then pcall(firetouchinterest,ou,dy,0)end ak(e.PadDwell)if dy and type(firetouchinterest)=="function"then pcall(firetouchinterest,ou,dy,1)end
ak(0.5)a.collected=a.collected+1 local iS=aM()u(("COLLECTED (%s) %s"):format(iP,(iR and iS and iS>iR)and("+$"..as(iS-iR))or"no cash change seen"))
vb(dw,dx,ov)end local dz local function ow()if a.capHit then if e.AutoStart and r()-(a.capAt or 0)>300 then a.capHit,a.placeFails=false,0
u("trying again after being stopped for 5 minutes")dz(true,true)else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end
if not aN()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=a1(),nil,nil
if not a.plot then return nil,"own plot not found yet","wait"end end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local iT,ox=d0()local fC=P()if fC then local cf=aa(Q(fC))if not aL(fC)then local iU=(J.gift and Q(J.gift)==Q(fC)and r()-J.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cf,iU),"bad"end if a.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cf,iU),"bad"end return"sell",("selling %s (%s)"):format(cf,iU),"warn"
end if iT<1 then return nil,("holding %s - 0 free stations"):format(cf),"wait"end if o.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cf),"wait"end
return"place",("waxing %s (%d free)"):format(cf,iT),"ok"end a.holding=false if e.Crates and not d.waiting and r()-(d.scanAt or 0)>1 and r()>(d.quietUntil or 0)then
d.scanAt=r()local iV=a.plot:FindFirstChild("CrateStand")if iV then for yQ,dA in ipairs(iV:GetDescendants())do
if dA:IsA("ProximityPrompt")and dA.Enabled and hg(dA)then local aW=dA.ObjectText if aW==""then aW=bT(iV,"TitleLabel")or""end
if aW~=""and E.wanted(aW)then local vi=dW(aW):gsub("crate$","")local oy for oz in pairs(M.members)do if dW(oz)==vi then oy=oz end end
d.waiting,d.at,d.title,d.prompt=true,r(),aW,dA d.data={name=(aW:gsub("%s","")),rarity=oy,title=aW}u(aW.." found waiting on your stand")
end break end end end end local oA=E.wanted(d.data and d.data.name)or E.wanted(d.title)if e.Crates and(d.on or d.waiting)and oA then
local aX=d.title if r()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aX),"bad"
end if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=r()+120,0 u("could not press the "..aX.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aX),"bad"end if r()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aX),"bad"
end if d.byYou and r()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aX,math.ceil(60-(r()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aX),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(aX),"bad"end if r()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aX),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aX,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not oA then local oB=d.title..tostring(d.rolledAt)if d.told~=oB then d.told=oB u(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and r()-d.rolledAt<6 and E.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if iT<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(ox,ox),"wait"
end local iW=kg()if not iW then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dB=cH()
if dB and lF(dB.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dB.name),"idle"end
if r()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dB.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(dB.name),"ok"
end local bi=gZ()if bi.state~="match"then a.matchSince=nil if bi.state=="skip"and not iW.Enabled then return nil,bi.text.." (sold out)","idle"end
return nil,bi.text,bi.level end if not iW.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local dC=r()if dC<a.noCashUntil then local oC,vj=lc()if oC then return nil,("cash short: have $%s, price ~$%s"):format(as(oC),as(vj)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(as(aM()),math.ceil(a.noCashUntil-dC)),"bad"end if dC-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
a.matchSince=a.matchSince or dC local oD=dC-a.matchSince if oD<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bi.shown,oD),"ok"end
return"buy",("buying %s via %s"):format(bi.shown,bi.src),"ok"end local function ax(vk,vl,...)if a.busy then return end
a.busy,a.busyText=true,vk local vm,oE=pcall(vl,...)a.busy,a.busyText=false,""if not vm and oE~=f_ then u("ERR "..tostring(oE))end
end local function vn()local bK,vo,vp=ow()a.reason,a.level=vo,vp if bK=="place"then ax("waxing...",o.place)elseif bK=="crate"then ax("opening crate...",eM,true)
elseif bK=="cratesmart"then ax("opening crate...",d.smart)elseif bK=="cratewin"then ax("opening the crate window...",hi)
elseif bK=="nocrate"then ax("discarding crate...",eM,false)elseif bK=="sell"then ax("selling...",oo)elseif bK=="buy"then ax("buying...",lv,false)
elseif e.Collect and not a.matchSince and r()-a.lastCollect>=e.Every then ax("collecting money...",vg)end end
function dz(fD,vq)if fD==a.running then return end a.running=fD if not vq then e.AutoStart=fD end if fD then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=r()a.plot=a1()or a.plot
u("START")else a.reason="stopped"u("STOP")end end do local bj=em(W.auto)if type(bj)=="string"then bj=bj:gsub("%s+$","")
if bj~=""then a.autoload=bj local vr=k1(bj)u(vr and("loaded config "..bj)or("config "..bj.." could not be loaded"))
end end end local j={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local vs={ok=j.good,wait=j.warn,warn=j.warn,bad=j.bad,idle=j.dim}local oF={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function F(vt,vu,vv)local vw,iX=pcall(Instance.new,vt)
if not vw then a.uiErrs=a.uiErrs+1 return nil end for vx,vy in pairs(vu)do if not pcall(function()iX[vx]=vy end)then a.uiErrs=a.uiErrs+1 end
end iX.Parent=vv return iX end local function ad(vz,vA)F("UICorner",{CornerRadius=UDim.new(0,vA or 6)},vz)end
local c={}local iY=D:FindFirstChildOfClass("PlayerGui")or D:WaitForChild("PlayerGui")local oG=iY:FindFirstChild("SABFarmGui")
if oG then oG:Destroy()end local iZ=F("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},iY)
local ac={w=320,h=330,head=30,strip=38,tabs=26}c.root=F("Frame",{Name="Root",Size=UDim2 .new(0,ac.w,0,ac.h),Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),
BackgroundColor3=j.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},iZ)ad(c.root,10)F("UIStroke",{Color=j.line,Thickness=1},c.root)
local aY=UDim2 .new(1,0,1,0)local function A(oH,oI)return UDim2 .new(oH,0,0,0),UDim2 .new(oI,(oH+oI>0.99)and 0 or-4,1,0)end
local function z(vB,vC,vD,vE,vF,vG)local oJ=F("TextButton",{Text=vC,Position=vF,Size=vG,BackgroundColor3=vD,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=vE,TextColor3=j.text,AutoButtonColor=true},vB)ad(oJ,6)return oJ end local function fE(vH,vI,vJ,vK,vL)
local i0=F("TextBox",{Text=vI,PlaceholderText=vJ,Position=vK,Size=vL,BackgroundColor3=j.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=j.text,PlaceholderColor3=j.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},vH)ad(i0,6)F("UIPadding",{PaddingLeft=UDim.new(0,8)},i0)
return i0 end local fF=aF.CurrentCamera local function vM()local vN,fG=pcall(function()return fF and fF.ViewportSize end)
if vN and fG and fG.X>50 and fG.Y>50 then return fG end end local function bk(dD)local i1=vM()if not(i1 and dD and dD.Parent)then return end
local vO=pcall(function()local fH,oK=dD.AbsolutePosition,dD.AbsoluteSize local i2=70 local oL=math.clamp(fH.X,i2-oK.X,i1 .X-i2)
local oM=math.clamp(fH.Y,0,i1 .Y-math.min(oK.Y,i2))if math.abs(oL-fH.X)>0.5 or math.abs(oM-fH.Y)>0.5 then dD.Position=UDim2 .new(0,math.floor(oL),0,math.floor(oM))
end end)return vO end local function fI(vP)local vQ,i3=pcall(function()return vP.AbsolutePosition end)if vQ and i3 then return{math.floor(i3 .X),math.floor(i3 .Y)}end
end local cg={}a.dragMoved={}local function oN(dE,oO,i4)O(dE.InputBegan:Connect(function(ci)if ci.UserInputType~=Enum.UserInputType.MouseButton1 and ci.UserInputType~=Enum.UserInputType.Touch then return end
local i5={start=ci.Position,from=oO.Position,moved=0,target=oO,input=ci,onDrop=i4}cg[dE],a.dragMoved[dE]=i5,0
local i6 i6=ci.Changed:Connect(function()if ci.UserInputState==Enum.UserInputState.End and cg[dE]==i5 then cg[dE]=nil
if i6 then i6:Disconnect()end if i4 then i4(i5 .moved)end end end)end))end O(jQ.InputChanged:Connect(function(fJ)
if fJ.UserInputType~=Enum.UserInputType.MouseMovement and fJ.UserInputType~=Enum.UserInputType.Touch then return end
for vR,aJ in pairs(cg)do local i7=aJ.target if i7 and i7 .Parent then local oP,oQ=fJ.Position.X-aJ.start.X,fJ.Position.Y-aJ.start.Y
aJ.moved=math.max(aJ.moved,math.abs(oP)+math.abs(oQ))a.dragMoved[vR]=aJ.moved i7 .Position=UDim2 .new(aJ.from.X.Scale,aJ.from.X.Offset+oP,aJ.from.Y.Scale,aJ.from.Y.Offset+oQ)
end end end))O(jQ.InputEnded:Connect(function(fK)if fK.UserInputType~=Enum.UserInputType.MouseButton1 and fK.UserInputType~=Enum.UserInputType.Touch then return end
for vS,fL in pairs(cg)do if fL.input==fK or fK.UserInputType==Enum.UserInputType.MouseButton1 then cg[vS]=nil
if fL.onDrop then fL.onDrop(fL.moved)end end end end))local function H(vT,vU,vV,vW,vX,vY,vZ)return F("TextLabel",{Text=vU,Position=vY or UDim2 .new(0,0,0,0),Size=vZ or aY,BackgroundTransparency=1,
Font=vX and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=vV,TextColor3=vW,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},vT)
end c.title=F("Frame",{Size=UDim2 .new(1,0,0,ac.head),BackgroundColor3=j.panel,BorderSizePixel=0,Active=true},c.root)
c.dot=F("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=j.dim,BorderSizePixel=0},c.title)
ad(c.dot,5)H(c.title,"SAB  BUTTER FARM  "..bO,12,j.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))c.minB=z(c.title,"-",j.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
c.xB=z(c.title,"X",j.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))c.strip=F("Frame",{Position=UDim2 .new(0,0,0,ac.head),Size=UDim2 .new(1,0,0,ac.strip),BackgroundColor3=j.bg,BorderSizePixel=0},c.root)
c.bar=F("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=j.warn,BorderSizePixel=0},c.strip)
ad(c.bar,2)c.reason=H(c.strip,"starting",12,j.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))c.tabs=F("Frame",{Position=UDim2 .new(0,0,0,ac.head+ac.strip),Size=UDim2 .new(1,0,0,ac.tabs),BackgroundTransparency=1},c.root)
c.tabFarm=z(c.tabs,"FARM",j.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))c.tabBut=z(c.tabs,"BUTTERS",j.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabCrt=z(c.tabs,"CRATES",j.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabPet=z(c.tabs,"PETS",j.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabTeam=z(c.tabs,"TEAMS",j.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabSet=z(c.tabs,"SETUP",j.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function cj()local i8=F("ScrollingFrame",{Position=UDim2 .new(0,0,0,ac.head+ac.strip+ac.tabs),Size=UDim2 .new(1,0,1,-(ac.head+ac.strip+ac.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=j.line,CanvasSize=UDim2 .new(0,0,0,100)},c.root)
F("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},i8)F("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},i8)
return i8 end c.farm,c.but,c.set,c.crt=cj(),cj(),cj(),cj()c.pet,c.team=cj(),cj()c.but.Visible,c.set.Visible,c.crt.Visible,c.pet.Visible,c.team.Visible=false,false,false,false,false
local fM,dF,C=0,12,nil local function aq(oR,v0)fM,dF=fM+1,dF+oR+6 return F("Frame",{Size=UDim2 .new(1,0,0,oR),BackgroundTransparency=1,LayoutOrder=fM},v0 or c.farm)
end local function dG(v1)H(aq(14),v1,10,j.dim,true)end C=aq(34)c.startB=z(C,"START",j.good,14,A(0,0.68))c.killB=z(C,"KILL",j.bad,14,A(0.68,0.32))
local v2=aq(42)local function dH(oS,v3,i9)local i_=F("Frame",{Position=UDim2 .new((oS-1)/i9,0,0,0),Size=UDim2 .new(1/i9,oS<i9 and-4 or 0,1,0),
BackgroundColor3=j.panel,BorderSizePixel=0},v2)ad(i_,6)local oT=H(i_,"0",15,j.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local v4=H(i_,v3,9,j.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))oT.TextXAlignment,v4 .TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return oT end c.sBought,c.sPlaced,c.sSold,c.sColl,c.sFree=dH(1,"BOUGHT",5),dH(2,"WAXED",5),dH(3,"SOLD",5),dH(4,"MONEY",5),dH(5,"FREE",5)
c.info=H(aq(40),"",10,j.dim,false)c.tgt=H(aq(26),"",10,j.good,false)dG("MONEY COLLECT")C=aq(28)c.secB=fE(C,tostring(e.Every),"60",A(0,0.2))
H(C,"sec",11,j.dim,false,A(0.21,0.09))c.secSet=z(C,"SET",j.accent,12,A(0.3,0.2))c.colT=z(C,"COLLECT: ON",j.accent,11,A(0.5,0.5))
C=aq(26)c.padB=z(C,"SET PAD (stand on it)",j.panel2,10,A(0,0.55))c.padL=H(C,"",10,j.dim,false,A(0.56,0.44))dG("BUTTERS YOU DID NOT TICK, AND CRATES")
C=aq(28)c.sellT=z(C,"SELL THEM: ON",j.accent,11,A(0,0.55))c.sellB=z(C,"SELL NOW",j.warn,11,A(0.55,0.45))C=aq(28)
c.crateT=z(C,"OPEN CRATES: ON",j.accent,11,A(0,0.55))c.crateB=z(C,"OPEN NOW",j.warn,11,A(0.55,0.45))dG("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
C=aq(28)c.arT=z(C,"AUTO ROLL: OFF",j.panel2,11,A(0,0.5))c.arL=H(C,"",9,j.dim,false,A(0.52,0.48))dG("TOOLS")C=aq(30)
c.buyB=z(C,"BUY",j.warn,10,A(0,0.5))c.plB=z(C,"WAX",j.good,10,A(0.5,0.5))dG("LOG")c.log=F("TextLabel",{Size=aY,BackgroundColor3=j.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=j.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},aq(84))ad(c.log,6)F("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},c.log)
c.farm.CanvasSize=UDim2 .new(0,0,0,dF)fM,dF=0,12 local function ae(v5)return aq(v5,c.set)end local function dI(v6)H(ae(14),v6,10,j.dim,true)end
dI("SETTINGS FILE  (saved on your phone)")C=ae(28)c.cfgName=fE(C,"default","config name",A(0,0.5))c.cfgSave=z(C,"SAVE",j.good,11,A(0.5,0.25))
c.cfgLoad=z(C,"LOAD",j.accent,11,A(0.75,0.25))C=ae(26)c.cfgPrev=z(C,"<",j.panel2,11,A(0,0.13))c.cfgPick=z(C,"(none saved)",j.panel2,10,A(0.13,0.74))
c.cfgNext=z(C,">",j.panel2,11,A(0.87,0.13))C=ae(26)c.cfgAuto=z(C,"LOAD IT ON LAUNCH: OFF",j.panel2,10,A(0,1))
c.cfgMsg=H(ae(26),"",10,j.dim,false)dI("START BY ITSELF")C=ae(26)c.autoB=z(C,"INSTALL F.exec",j.accent,10,A(0,1))
c.autoMsg=H(ae(30),"",10,j.dim,false)C=ae(28)c.startT=z(C,"START FARMING ON LOAD: ON",j.accent,10,A(0,1))H(ae(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,j.dim,false)
dI("IF THE GAME DROPS ME")C=ae(28)c.rejT=z(C,"AUTO REJOIN: ON",j.accent,11,A(0,0.55))c.rejB=z(C,"REJOIN NOW",j.warn,11,A(0.55,0.45))
c.rejMsg=H(ae(30),"",10,j.dim,false)dI("SMOOTHER RUNNING  (for long / overnight runs)")C=ae(28)c.pfLite=z(C,"LITE MODE: OFF",j.panel2,10,A(0,0.5))
c.pfHud=z(C,"HIDE GAME HUD: OFF",j.panel2,10,A(0.5,0.5))C=ae(28)c.pfFps=z(C,"FPS CAP: GAME",j.panel2,10,A(0,0.5))
c.pfRender=z(C,"STOP 3D: OFF",j.panel2,10,A(0.5,0.5))C=ae(28)c.pfMem=fE(C,tostring(e.MemLimit),"2000",A(0,0.24))
H(C,"MB: rejoin this server above it (0 = never)",9,j.dim,false,A(0.26,0.52))c.pfMemSet=z(C,"SET",j.accent,11,A(0.8,0.2))
c.pfInfo=H(ae(18),"",10,j.text,false)H(ae(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,j.dim,false)
dI("THE ROUND SAB BUTTON")H(ae(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,j.dim,false)
c.set.CanvasSize=UDim2 .new(0,0,0,dF)local oU=F("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},iY)
c.tgRoot=F("Frame",{Size=UDim2 .new(0,40,0,40),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=j.accent,BorderSizePixel=0,Active=true},oU)ad(c.tgRoot,20)F("UIStroke",{Color=j.line,Thickness=1},c.tgRoot)
c.tgBtn=F("TextButton",{Text="SAB",Size=aY,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=j.text,AutoButtonColor=false},c.tgRoot)
c.tgDot=F("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=j.dim,BorderSizePixel=0},c.tgRoot)
ad(c.tgDot,4)local aZ={built=false,boxes={},at=0}local function oV(oW,ja)e.Targets[oW]=ja or nil local jb=aZ.boxes[oW]
if jb then jb.Text=ja and"X"or""jb.BackgroundColor3=ja and j.good or j.panel2 end end local function jc()for v7,oX in pairs(aZ.boxes)do
local oY=e.Targets[v7]==true oX.Text=oY and"X"or""oX.BackgroundColor3=oY and j.good or j.panel2 end end local dJ
local function v8()local v9=0 local jd=F("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},c.but)
c.butInfo=H(jd,"",10,j.dim,false,A(0,0.5))local v_=z(jd,"CLEAR",j.panel2,10,A(0.5,0.24))local wa=z(jd,"REFRESH",j.panel2,10,A(0.74,0.26))
v_.MouseButton1Click:Connect(function()for wb in pairs(e.Targets)do e.Targets[wb]=nil end jc()end)wa.MouseButton1Click:Connect(function()
M.at=0 gK()dJ(true)end)return v9 end dJ=function(wc)if not gK()then if not c.butEmpty then c.butEmpty=H(F("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},c.but),
"butter list not loaded yet - open this tab again in a moment",11,j.warn,false)end return end if aZ.built and not wc and aZ.at==M.at then return end
for yR,je in ipairs(c.but:GetChildren())do if je:IsA("Frame")or je:IsA("TextButton")then je:Destroy()end end aZ.boxes,c.butEmpty={},nil
v8()local jf,jg=36,1 local function oZ(o0)jg=jg+1 local wd=F("Frame",{Size=UDim2 .new(1,0,0,o0),BackgroundTransparency=1,LayoutOrder=jg},c.but)
jf=jf+o0+6 return wd end for yS,fN in ipairs(M.rarOrder)do local we=oZ(24)local wf=oF[fN]or j.text local jh=F("Frame",{Size=aY,BackgroundColor3=j.panel,BorderSizePixel=0},we)
ad(jh,6)H(jh,"  "..fN:upper(),11,wf,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local wg=z(jh,"ALL",j.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local wh=fN wg.MouseButton1Click:Connect(function()local o1=M.members[wh]or{}local o2=false for yT,wi in ipairs(o1)do if not e.Targets[wi]then o2=true break end end
for yU,wj in ipairs(o1)do oV(wj,o2)end end)for yV,ji in ipairs(M.members[fN]or{})do local wk=oZ(22)local fO=F("TextButton",{Text="",Size=aY,BackgroundColor3=j.bg,BorderSizePixel=0,
AutoButtonColor=true},wk)ad(fO,5)H(fO,"   "..aa(ji),11,j.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local jj=F("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=j.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=j.text,AutoButtonColor=false},fO)ad(jj,4)aZ.boxes[ji]=jj local o3=ji local function o4()oV(o3,not e.Targets[o3])end
fO.MouseButton1Click:Connect(o4)jj.MouseButton1Click:Connect(o4)end end jc()c.but.CanvasSize=UDim2 .new(0,0,0,jf+10)
aZ.built,aZ.at=true,M.at end function E.paint()for wl,o5 in pairs(E.boxes)do local o6=e.CrateTicks[wl]==true o5 .Text=o6 and"X"or""
o5 .BackgroundColor3=o6 and j.good or j.panel2 end if c.crtInfo then local jk,jl=0,0 for yW in pairs(E.boxes)do jk=jk+1 end
for yX,wm in pairs(e.CrateTicks)do if wm then jl=jl+1 end end c.crtInfo.Text=("%d crates, %d ticked"):format(jk,jl)
end if c.crtAll then c.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"c.crtAll.BackgroundColor3=e.Crates and j.accent or j.panel2
end end function E.build()for yY,jm in ipairs(c.crt:GetChildren())do if jm:IsA("Frame")or jm:IsA("TextButton")then jm:Destroy()end
end E.boxes={}local jn,jo=12,0 local function fP(o7)jo=jo+1 jn=jn+o7+6 return F("Frame",{Size=UDim2 .new(1,0,0,o7),BackgroundTransparency=1,LayoutOrder=jo},c.crt)
end local jp=fP(28)c.crtInfo=H(jp,"",10,j.dim,false,A(0,0.5))local wn=z(jp,"CLEAR",j.panel2,10,A(0.5,0.24))local wo=z(jp,"REFRESH",j.panel2,10,A(0.74,0.26))
O(wn.MouseButton1Click:Connect(function()e.CrateTicks={}E.paint()end))O(wo.MouseButton1Click:Connect(function()E.build()end))
c.crtAll=z(fP(28),"",j.accent,11,A(0,1))O(c.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates E.paint()end))
H(fP(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,j.dim,false)
for yZ,a0 in ipairs(E.list())do local wp=fP(24)local dK=F("TextButton",{Text="",Size=aY,BackgroundColor3=j.panel,BorderSizePixel=0,AutoButtonColor=true},wp)
ad(dK,5)H(dK,"  "..(a0 .title or a0 .name)..(a0 .guess and"  (?)"or""),11,oF[a0 .rar or""]or j.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
H(dK,a0 .price and("$"..as(a0 .price))or(a0 .rar or""),9,j.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local jq=F("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=j.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=j.text,AutoButtonColor=false},dK)ad(jq,4)E.boxes[a0 .k]=jq local o8=a0 .k local function o9()e.CrateTicks[o8]=(not e.CrateTicks[o8])or nil
E.paint()end O(dK.MouseButton1Click:Connect(o9))O(jq.MouseButton1Click:Connect(o9))end c.crt.CanvasSize=UDim2 .new(0,0,0,jn+10)
E.built=E.at E.paint()end local o_="farm"local function bl(af)o_=af c.farm.Visible,c.but.Visible,c.set.Visible=(af=="farm"),(af=="but"),(af=="set")
c.crt.Visible=(af=="crt")c.pet.Visible,c.team.Visible=(af=="pet"),(af=="team")c.tabCrt.BackgroundColor3=(af=="crt")and j.accent or j.panel2
c.tabPet.BackgroundColor3=(af=="pet")and j.accent or j.panel2 c.tabTeam.BackgroundColor3=(af=="team")and j.accent or j.panel2
if af=="pet"and not l.built then pcall(l.build)end if af=="team"and not o.built then pcall(o.build)end if af=="crt"and(E.built~=E.at or not next(E.boxes))then E.build()end
c.tabFarm.BackgroundColor3=(af=="farm")and j.accent or j.panel2 c.tabBut.BackgroundColor3=(af=="but")and j.accent or j.panel2
c.tabSet.BackgroundColor3=(af=="set")and j.accent or j.panel2 if af=="but"then dJ(false)end end local function N(pa,pb,wq,wr)
pa.Text=pb and wq or wr pa.BackgroundColor3=pb and j.accent or j.panel2 end l.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function l.paintRow(pc)
local bL=l.rows and l.rows[pc]if not bL then return end local dL=e.Pets[pc]or{}bL.b.BackgroundColor3=dL.b and j.good or j.panel2
bL.g.BackgroundColor3=dL.g and j.accent or j.panel2 bL.g.Text=dL.g and"BIG"or"ANY"bL.w.BackgroundColor3=dL.w and j.warn or j.panel2
local jr=tonumber(dL.f)or 0 bL.f.Text=jr>0 and(jr.." BIG")or"FUSE"bL.f.BackgroundColor3=jr>0 and j.good or j.panel2
end function l.flag(js,fQ)local aK=e.Pets[js]or{}if fQ=="f"then local pd=((tonumber(aK.f)or 0)+1)%4 aK.f=pd>0 and pd or nil
elseif aK[fQ]then aK[fQ]=nil else aK[fQ]=true end e.Pets[js]=(aK.b or aK.g or aK.w or aK.f)and aK or nil l.paintRow(js)
end function l.paintAll()for ws in pairs(l.rows or{})do l.paintRow(ws)end if c.pbT then N(c.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(c.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(c.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function l.live()if not l.built then l.build()return end if r()-(l.liveAt or 0)<1 then return end l.liveAt=r()
local pe=l.wishes()local dM=l.data()for fR,fS in pairs(l.rows)do fS.name.Text=l.nice(fR)..(pe[fR]and("   * wish %dm"):format(math.ceil(pe[fR]/60))or"")
local pf=x.status(fR,dM)fS.desc.Text=pf and(pf.." | "..fS.boostText)or fS.boostText end local pg=tonumber(D:GetAttribute("PetWishCredits"))or 0
c.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dM and#(dM.pets or{})or 0,dM and tonumber(dM.maxOwned)or 60,
as(l.money()),pg>0 and(" | free wishes "..pg)or"",l.buyMsg~=""and l.buyMsg or"-",l.wishMsg~=""and l.wishMsg or"-")
end function l.build()local fT=l.info()for y0,jt in ipairs(c.pet:GetChildren())do if jt:IsA("Frame")or jt:IsA("TextLabel")then jt:Destroy()end
end l.rows={}local ju,fU=0,12 local function ck(ph)ju,fU=ju+1,fU+ph+6 return F("Frame",{Size=UDim2 .new(1,0,0,ph),BackgroundTransparency=1,LayoutOrder=ju},c.pet)
end local jv=ck(28)c.pbT=z(jv,"AUTO ADOPT: OFF",j.panel2,9,A(0,0.34))c.pwT=z(jv,"AUTO WISH: OFF",j.panel2,9,A(0.34,0.33))
c.pfT=z(jv,"AUTO FUSE: OFF",j.panel2,9,A(0.67,0.33))c.pbT.MouseButton1Click:Connect(function()e.PetBuy=not e.PetBuy l.paintAll()end)
c.pwT.MouseButton1Click:Connect(function()e.PetWish=not e.PetWish l.paintAll()end)c.pfT.MouseButton1Click:Connect(function()e.AutoFuse=not e.AutoFuse l.paintAll()end)
c.pInfo=H(ck(44),"",10,j.dim,false)H(ck(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,j.dim,false)
if not fT then H(ck(30),"pet list not loaded yet - open this tab again in a moment",11,j.warn,false)c.pet.CanvasSize=UDim2 .new(0,0,0,fU)
l.built=false return end local cl={}for y1,pj in ipairs(l.order())do local jw=fT.Pets[pj].rarity or"?"cl[jw]=cl[jw]or{}
table.insert(cl[jw],pj)end local cm={}for y2,pk in ipairs(fT.Rarities or{})do if cl[pk]then cm[#cm+1]=pk end end
for pl in pairs(cl)do if not table.find(cm,pl)then cm[#cm+1]=pl end end for y3,fV in ipairs(cm)do local pm=F("Frame",{Size=aY,BackgroundColor3=j.panel,BorderSizePixel=0},ck(22))
ad(pm,6)H(pm,"  "..fV:upper(),11,l.RC[fV]or j.text,true)for y4,fW in ipairs(cl[fV])do local bM=F("Frame",{Size=aY,BackgroundColor3=j.bg,BorderSizePixel=0},ck(38))
ad(bM,5)local wt=H(bM,l.nice(fW),11,l.RC[fV]or j.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local wu,wv=pcall(function()return fT.describe(fW)end)
local pn=wu and tostring(wv)or""local ww=H(bM,pn,9,j.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local po=z(bM,"BUY",j.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local pp=z(bM,"ANY",j.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local pq=z(bM,"WISH",j.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local pr=z(bM,"FUSE",j.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local fX=fW po.MouseButton1Click:Connect(function()l.flag(fX,"b")end)
pp.MouseButton1Click:Connect(function()l.flag(fX,"g")end)pq.MouseButton1Click:Connect(function()l.flag(fX,"w")end)
pr.MouseButton1Click:Connect(function()l.flag(fX,"f")end)l.rows[fW]={b=po,g=pp,w=pq,f=pr,name=wt,desc=ww,boostText=pn}
end end c.pet.CanvasSize=UDim2 .new(0,0,0,fU+10)l.built=true l.paintAll()end function q.paint()N(c.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(c.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")N(c.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
N(c.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")if not c.pfMem:IsFocused()then c.pfMem.Text=tostring(e.MemLimit)end
end function q.applyAll()if e.Lite then q.lite(true)end if e.HideHud then q.hideHud(true)end if e.NoRender then q.render(true)end
if(e.FpsCap or 0)~=0 then q.cap(e.FpsCap)end q.paint()end O(c.pfLite.MouseButton1Click:Connect(function()q.lite(not e.Lite)q.paint()end))
O(c.pfHud.MouseButton1Click:Connect(function()q.hideHud(not e.HideHud)q.paint()end))O(c.pfRender.MouseButton1Click:Connect(function()q.render(not e.NoRender)q.paint()end))
O(c.pfFps.MouseButton1Click:Connect(function()local wx=table.find(q.CAPS,e.FpsCap or 0)or 1 local ps=q.CAPS[(wx%#q.CAPS)+1]
if not q.cap(ps)and ps~=0 then u("this executor cannot cap fps")end q.paint()end))O(c.pfMemSet.MouseButton1Click:Connect(function()
local jx=tonumber(c.pfMem.Text)if jx and jx>=0 then e.MemLimit=math.floor(jx)end q.paint()end))function o.names()
local jy={"(none)"}for y5,wy in ipairs((o.teams()))do jy[#jy+1]=wy.name end return jy end function o.cycle(jz,wz)
local fY=o.names()local wA=e[jz]~=""and e[jz]or"(none)"local fZ=table.find(fY,wA)or 1 fZ=((fZ-1+wz)%#fY)+1 e[jz]=fY[fZ]=="(none)"and""or fY[fZ]
o.paint()end function o.paint()if not o.built then return end N(c.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
N(c.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local jA={}for y6,wB in ipairs((o.teams()))do jA[wB.name]=true end
for wC,pt in pairs(o.pick)do local cn=e[wC]pt.Text=cn==""and"(none)"or(jA[cn]and cn or(cn.." (missing)"))pt.TextColor3=(cn~=""and not jA[cn])and j.bad or j.text
end if not c.tmLead:IsFocused()then c.tmLead.Text=tostring(e.GlazeLead)end c.tmInfo.Text=(o.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(o.switches,o.finished,o.glazed,x.fused)
..(x.buildMsg~=""and("\n"..x.buildMsg)or"")local wD,f0=l.srv(),{}for y7,f1 in ipairs(o.list or{})do f0[#f0+1]=("st %-2s %-22s %9s  helps %d"):format(f1 .st.Name,aa(Q(f1 .name)):sub(1,22),o.clock(f1 .ends-wD),f1 .helps)
end c.tmList.Text=#f0>0 and table.concat(f0,"\n")or"no waxes running"end function o.build()for y8,jB in ipairs(c.team:GetChildren())do
if jB:IsA("Frame")or jB:IsA("TextLabel")then jB:Destroy()end end o.pick={}local jC,jD=0,12 local function bm(pu)
jC,jD=jC+1,jD+pu+6 return F("Frame",{Size=UDim2 .new(1,0,0,pu),BackgroundTransparency=1,LayoutOrder=jC},c.team)
end local function dN(wE)H(bm(14),wE,10,j.dim,true)end local function f2(f3)local jE=bm(26)local wF=z(jE,"<",j.panel2,11,A(0,0.14))
local pv=z(jE,"(none)",j.panel,10,A(0.14,0.72))local wG=z(jE,">",j.panel2,11,A(0.86,0.14))wF.MouseButton1Click:Connect(function()o.cycle(f3,-1)end)
wG.MouseButton1Click:Connect(function()o.cycle(f3,1)end)pv.MouseButton1Click:Connect(function()o.cycle(f3,1)end)
o.pick[f3]=pv end c.tmT=z(bm(28),"AUTO TEAMS: OFF",j.panel2,11,A(0,1))c.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=o.current()end o.paint()end)c.tmInfo=H(bm(42),"",10,j.dim,false)
local pw=bm(26)c.tmBuild=z(pw,"AUTO BUILD TEAMS: OFF",j.panel2,9,A(0,0.62))c.tmBuildNow=z(pw,"BUILD NOW",j.warn,9,A(0.62,0.38))
c.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild o.paint()end)c.tmBuildNow.MouseButton1Click:Connect(function()
if o.editing then return end x.buildMsg="building..."task.spawn(function()local wH,wI=pcall(x.rebuild,"you asked")if not wH then u("BUILD ERR "..tostring(wI))end end)
end)dN("NORMAL TEAM  (worn the rest of the time)")f2("TeamNormal")dN("FULL TEAM  (worn while every station is busy)")
f2("TeamFull")dN("GLAZE TEAM  (worn just before a wax finishes)")f2("TeamGlaze")local jF=bm(26)c.tmLead=fE(jF,tostring(e.GlazeLead),"45",A(0,0.2))
H(jF,"sec before it finishes",10,j.dim,false,A(0.22,0.5))local wJ=z(jF,"SET",j.accent,11,A(0.75,0.25))wJ.MouseButton1Click:Connect(function()
local f4=tonumber(c.tmLead.Text)if f4 and f4>=5 and f4<=600 then e.GlazeLead=math.floor(f4)else c.tmLead.Text=tostring(e.GlazeLead)end
o.paint()end)dN("WAX TEAM  (worn while a butter is placed)")f2("TeamWax")dN("YOUR WAXES  (time left, helps)")
c.tmList=F("TextLabel",{Size=aY,BackgroundColor3=j.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=j.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bm(150))ad(c.tmList,6)F("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},c.tmList)
H(bm(92),"Teams are the loadouts you saved in the game's Teams page. A wax's time is fixed when it is placed and its glaze is rolled when it finishes, so the WAX team only needs to be on while placing and the GLAZE team only at the finish. While every station is busy only wax-stir pets (Seal, Koala) still help, so the FULL team can be money + stir. A help never leaves a wax under 60 s, so 45 s is enough. While AUTO TEAMS is on it keeps putting the right team back.",9,j.dim,false)
c.team.CanvasSize=UDim2 .new(0,0,0,jD+10)o.built=true o.paint()end local function wK()c.secB.Text=tostring(e.Every)
N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then dz(e.AutoStart,true)end if a.winPos then c.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then c.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end bk(c.root)bk(c.tgRoot)a.lastCollect=r()
jc()E.paint()pcall(l.paintAll)pcall(o.paint)pcall(q.applyAll)end local function wL(px)task.spawn(function()px.TextColor3=j.bad
task.wait(0.8)if a.alive then px.TextColor3=j.text end end)end local function py()local pz=c.secB.Text:match("^%s*(%d+)%s*$")
local dO=pz and tonumber(pz)if not dO or dO<1 then c.secB.Text=tostring(e.Every)wL(c.secB)u("interval must be a whole number >= 1")
return end if dO==e.Every then return end e.Every,a.lastCollect=dO,r()u("collect every "..dO.."s")end local function K(wM,wN)O(wM.MouseButton1Click:Connect(wN))end
K(c.secSet,py)O(c.secB.FocusLost:Connect(py))K(c.colT,function()e.Collect,a.lastCollect=not e.Collect,r()N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)K(c.sellT,function()e.SellJunk=not e.SellJunk N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)K(c.sellB,function()
a.sellFails=0 task.spawn(ax,"selling...",oo)end)K(c.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(y.apply,"you asked",true)
end)K(c.crateT,function()e.Crates=not e.Crates N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)K(c.crateB,function()
d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(ax,"opening crate...",eM,true)end)K(c.padB,function()
a.plot=a1()or a.plot local pA,jG=aN(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(pA and jG and jG:IsA("BasePart"))then u("SET PAD: need character and plot")return end
a.manualPad=jG.CFrame:ToObjectSpace(pA.HumanoidRootPart.CFrame)u7(a.manualPad)u("collect pad saved at your position")
end)K(c.startB,function()dz(not a.running)end)K(c.buyB,function()a.plot=a1()or a.plot task.spawn(ax,"buying (manual)...",lv,true)
end)K(c.plB,function()a.plot=a1()or a.plot task.spawn(ax,"waxing (manual)...",lA)end)K(c.tabFarm,function()bl("farm")end)
K(c.tabBut,function()bl("but")end)K(c.tabSet,function()bl("set")end)K(c.tabCrt,function()bl("crt")end)K(c.tabPet,function()bl("pet")end)
K(c.tabTeam,function()bl("team")end)local function wO(jH)a.hidden=jH c.root.Visible=not jH c.tgBtn.Text=jH and"SAB+"or"SAB"
end oN(c.tgBtn,c.tgRoot,function()bk(c.tgRoot)a.togPos=fI(c.tgRoot)or a.togPos end)K(c.tgBtn,function()if(a.dragMoved[c.tgBtn]or 0)<8 then wO(not a.hidden)end
a.dragMoved[c.tgBtn]=0 end)local ar,ah={},0 local function bn()ar=kS()if#ar==0 then c.cfgPick.Text="(none saved)"
ah=0 return end if ah<1 or ah>#ar then ah=1 end c.cfgPick.Text=ar[ah]..("  (%d/%d)"):format(ah,#ar)end local function pB()
local pC=a.autoload~=nil c.cfgAuto.Text=pC and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"c.cfgAuto.BackgroundColor3=pC and j.accent or j.panel2
end local function jI()local pD=c.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if pD~=""then return pD end return(ah>0 and ar[ah])or""
end K(c.cfgSave,function()a.winPos=fI(c.root)or a.winPos a.togPos=fI(c.tgRoot)or a.togPos local pE,pF=er(jI())
c.cfgMsg.Text=pE and("saved as "..pF)or("could not save: "..pF)c.cfgMsg.TextColor3=pE and j.good or j.bad bn()
u(c.cfgMsg.Text)end)local function wP(jJ)local jK,pG=k1(jJ)c.cfgMsg.Text=jK and("loaded "..pG)or("could not load: "..pG)
c.cfgMsg.TextColor3=jK and j.good or j.bad if jK then c.cfgName.Text=jJ wK()task.spawn(y.apply,"config "..jJ)
end u(c.cfgMsg.Text)end K(c.cfgLoad,function()wP(jI())end)K(c.cfgPick,function()bn()if ah>0 then c.cfgName.Text=ar[ah]end
end)K(c.cfgPrev,function()if#ar==0 then bn()return end ah=(ah-2)%#ar+1 bn()c.cfgName.Text=ar[ah]end)K(c.cfgNext,function()
if#ar==0 then bn()return end ah=ah%#ar+1 bn()c.cfgName.Text=ar[ah]end)K(c.cfgAuto,function()if a.autoload then
k3(nil)c.cfgMsg.Text="it will not load a config on launch"else local dP=jI()local pH=false for y9,wQ in ipairs(kS())do if wQ==dP then pH=true end end
local wR=pH or er(dP)if wR and dP~=""then k3(dP)bn()c.cfgMsg.Text=dP.." will load every time the script starts"
else c.cfgMsg.Text="name the config and save it first"end end c.cfgMsg.TextColor3=j.dim pB()end)K(c.autoB,function()
local pI,pJ=ru()c.autoMsg.Text=pI and("installed. "..pJ)or("failed: "..pJ)c.autoMsg.TextColor3=pI and j.good or j.bad
u(c.autoMsg.Text)end)K(c.startT,function()e.AutoStart=not e.AutoStart N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)K(c.rejT,function()e.Rejoin=not e.Rejoin N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)K(c.rejB,function()cG("you asked")end)
local bN=false K(c.minB,function()bN=not bN c.tabs.Visible=not bN if bN then c.farm.Visible,c.but.Visible,c.set.Visible,c.crt.Visible=false,false,false,false
c.pet.Visible,c.team.Visible=false,false else bl(o_)end c.root.Size=UDim2 .new(0,ac.w,0,bN and(ac.head+ac.strip)or ac.h)
c.minB.Text=bN and"+"or"-"end)local function f5()if not a.alive then return end a.alive,a.running=false,false
pcall(q.restoreAll)pcall(d3)for y_,wS in ipairs(ga)do pcall(function()wS:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()iZ:Destroy()end)pcall(function()oU:Destroy()end)if bP.SAB_KILL==f5 then bP.SAB_KILL=nil end end
bP.SAB_KILL=f5 K(c.killB,f5)K(c.xB,f5)oN(c.title,c.root,function()bk(c.root)a.winPos=fI(c.root)or a.winPos end)
local function pK()local dQ,dR=a.reason,a.level if a.busy then dQ,dR=a.busyText,"ok"elseif not a.running then
local za,pL,wT=ow()if a.capHit then dQ,dR=pL,"bad"else dQ,dR="[stopped] "..pL,(wT=="bad")and"bad"or"idle"end a.reason,a.level=dQ,dR
end c.reason.Text=dQ c.bar.BackgroundColor3=vs[dR]or j.dim c.dot.BackgroundColor3=a.running and j.good or(a.capHit and j.bad or j.dim)
c.tgDot.BackgroundColor3=c.dot.BackgroundColor3 c.tgRoot.BackgroundColor3=a.hidden and j.panel2 or j.accent c.startB.Text=a.running and"STOP"or"START"
N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")c.startB.BackgroundColor3=a.running and j.warn or j.good
local wU,wV=d0()c.sBought.Text,c.sPlaced.Text,c.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
c.sColl.Text,c.sFree.Text=tostring(a.collected),wU.."/"..wV local pM=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(r()-a.lastCollect)))or nil
local pN=P()c.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
as(aM()),a.rolls,a.gifts,a.crates,pN and aa(Q(pN))or"nothing",d.on and("   ["..d.title.." window open]")or"",
pM and("in "..pM.."s")or"off")local co=q6()c.tgt.Text=(#co==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#co<=3)and table.concat(co,", ")or(#co.." butters ticked")))
c.tgt.TextColor3=(#co==0)and j.bad or j.good c.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
c.log.Text=table.concat(dU,"\n")if c.butInfo then c.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(M.n,#M.rarOrder,#co)
end if c.but.Visible and aZ.at~=M.at then dJ(false)end if c.crt.Visible then if E.built~=E.at then E.build()else E.paint()end
end if c.pet.Visible then l.live()end if c.set.Visible then c.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(q.fps+0.5),q.mem,q.memPeak)
end if c.team.Visible then o.paint()end N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local pO=(y.rec.on and"on"or"")..(y.rec.off and((y.rec.on and"/"or"").."off")or"")c.arL.Text=y.msg~=""and y.msg or("game: %s | learned: %s%s"):format(y.isOn()and"ON"or"off",
pO~=""and pO or"nothing yet",#y.rec.rules>0 and", choices"or"")c.arL.TextColor3=y.msg~=""and j.warn or j.dim end
bP.SAB={S=a,CFG=e,EV=J,U=c,sg=iZ,CAT=M,LEARN=V,buildList=dJ,logAll=cp,evAll=cq,AR=y,CR=E,PF=q,PX=l,TM=o,CRATE=d,FU=x}
u(bO.." loaded")if a.uiErrs>0 then u("UI: "..a.uiErrs.." properties skipped")end bl("farm")bk(c.root)bk(c.tgRoot)
if fF then pcall(function()O(fF:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bk(c.root)
bk(c.tgRoot)end))end)end bn()pB()if a.config and a.config~=""then c.cfgName.Text=a.config end N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
c.secB.Text=tostring(e.Every)pcall(q.applyAll)pcall(pK)task.spawn(function()local pP=rs()c.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(pP and("\n(backup: "..pP..")")or"")
local pQ=em(W.exec)if pQ and not pQ:find("SAB autoloader v2",1,true)then cC(W.exec,W.stub)u("autoexec updated: it now loads the newest version from GitHub")
end c.autoMsg.Text=(em(W.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(rA)end)task.spawn(function()while a.alive do local wW,wX=pcall(pK)if not wW then u("UI ERR "..tostring(wX))end
task.wait((a.hidden or bN)and 1.5 or 0.25)end end)task.spawn(function()local wY,wZ=pcall(rJ)if not wY then u("HOOK ERR "..tostring(wZ))end
end)task.spawn(function()pcall(qu)if d.loadSeq and not d.learned then local f6={}for pR=1,20 do if d.loadSeq[pR]then f6[#f6+1]=d.loadSeq[pR]end end
if#f6>0 then d.learned={seq=f6,mode=d.loadMode}u("remembered how to open crates directly")end end if gK()then u(("catalog: %d butters in %d rarities"):format(M.n,#M.rarOrder))end
local w0,pS=pcall(u9)if w0 and pS and a.alive and not a.manualPad then a.manualPad=pS end end)task.spawn(function()
while a.alive do local jL,jM=pcall(l.buyTick)if not jL then u("PET ERR "..tostring(jM))task.wait(5)end jL,jM=pcall(l.wishTick)
if not jL then u("WISH ERR "..tostring(jM))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local f7,pT=0,r()
O(game:GetService("RunService").Heartbeat:Connect(function()f7=f7+1 end))q.noteAt=r()while a.alive do task.wait(1)
local pU=r()q.fps,f7,pT=f7/math.max(pU-pT,0.001),0,pU local w1,w2=pcall(q.tick)if not w1 then u("PERF ERR "..tostring(w2))task.wait(5)end
end end)task.spawn(function()task.wait(10)while a.alive do local w3,w4=pcall(x.tick)if not w3 then u("FUSE ERR "..tostring(w4))task.wait(10)end
task.wait(4)end end)task.spawn(function()while a.alive do local w5,w6=pcall(o.tick)if not w5 then u("TEAM ERR "..tostring(w6))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()while a.alive do task.wait(20)pcall(d3)end end)pcall(y.watchCache)
if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then pcall(function()local w8=(type(newcclosure)=="function")and newcclosure or function(w7)return w7 end
local jN local pV=(type(setnamecallmethod)=="function")and setnamecallmethod or nil jN=hookmetamethod(game,"__namecall",w8(function(pW,...)
local dS=getnamecallmethod()if a.alive and(dS=="InvokeServer"or dS=="FireServer")then local pX,pY=pcall(function()return pW.Name end)
if pX and pY=="CrateAction"and not d.replaying then pcall(d.saw,dS,...)elseif pX and pY=="AutoRollAction"and not y.replaying then pcall(y.saw,dS,...)end
if pV then pV(dS)end end return jN(pW,...)end))d.oldNC=jN end)end if f9 then O(D.Idled:Connect(function()pcall(function()f9:CaptureController()f9:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for zb=1,90 do if not a.alive then return end if D:GetAttribute("AutoRollOn")~=nil and aN()and(a.plot or a1())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then y.apply("joined")end while a.alive do task.wait(30)if a.alive and e.AutoRoll and a.running and not y.isOn()and not cH()and not P()
and not d.waiting and not d.on and not a.busy then y.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for zc=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or a1()if aN()and a.plot and next(e.Targets)then dz(true,true)u("started by itself")
return end task.wait(1)end if a.alive and not a.running then u("gave up waiting to start - tap START")end end)
task.spawn(function()a.plot=a1()a.lastCollect=r()while a.alive do if a.running then local w9,pZ=pcall(vn)if not w9 and pZ~=f_ then u("LOOP ERR "..tostring(pZ))end
end task.wait(0.1)end end)f8("loaded - window is at the top left")end local xa,jO=xpcall(p3,function(w_)return tostring(w_).."\n"..debug.traceback()end)
if not xa then pcall(function()warn("SAB "..bO.." ERROR: "..tostring(jO))end)f8("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bO.." ERROR: "..tostring(jO))end)pcall(function()local p0=(type(getgenv)=="function"and getgenv())or _G
if type(p0 .SAB_KILL)=="function"then p0 .SAB_KILL()end for zd,xb in ipairs({"SABFarmGui","SABToggle"})do local p1=D.PlayerGui:FindFirstChild(xb)
if p1 then p1:Destroy()end end end)pcall(function()local dT=Instance.new("ScreenGui")dT.Name="SABError"dT.ResetOnSpawn=false
dT.DisplayOrder=1000 local aE=Instance.new("TextBox")aE.Size=UDim2 .new(0,340,0,170)aE.Position=UDim2 .new(0,10,0,50)
aE.BackgroundColor3=Color3 .fromRGB(90,20,20)aE.TextColor3=Color3 .new(1,1,1)aE.TextSize=11 aE.TextWrapped=true
aE.ClearTextOnFocus=false aE.TextXAlignment=Enum.TextXAlignment.Left aE.TextYAlignment=Enum.TextYAlignment.Top
aE.Text="SAB "..bO.." failed to start. Send this text:\n"..tostring(jO)aE.Parent=dT dT.Parent=D:WaitForChild("PlayerGui")
end)end
