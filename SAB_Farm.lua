local bQ="v25"local jY=game:GetService("Players")local C=jY.LocalPlayer or jY.PlayerAdded:Wait()local function gb(qt)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bQ,Text=qt,Duration=6})
end)end gb("script started")local function qu()local az=game:GetService("ReplicatedStorage")local aG=game:GetService("Workspace")
local jZ=game:GetService("UserInputService")local bR=(type(getgenv)=="function"and getgenv())or _G if type(bR.SAB_KILL)=="function"then pcall(bR.SAB_KILL)end
local r=(type(tick)=="function")and tick or os.clock local gc=(function()local qv,qw=pcall(function()return game:GetService("VirtualUser")end)return qv and qw or nil end)()
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
local j,o,q,x={},{},{},{}local gd={}local ge,dY,cs,ct={},{},{},{}local function O(j0)ge[#ge+1]=j0 return j0 end
local function ag(qx)task.wait(qx)if not a.alive then error(gd,0)end end local function u(dZ)dZ=os.date("%H:%M:%S").." "..tostring(dZ)
table.insert(dY,1,dZ)if#dY>6 then table.remove(dY)end cs[#cs+1]=dZ if#cs>80 then table.remove(cs,1)end end local function d0(j1)
if type(j1)~="string"then return""end return(j1:lower():gsub("[^%w]",""))end local function Q(qy)local j2=d0(qy)
local gf=j2:gsub("butter$","")if gf==""then gf=j2 end return gf end local function aN(gg)return type(gg)=="string"and Q(gg)~=""and e.Targets[Q(gg)]==true end
local function qz(cu)cu=cu:lower()return cu:find("squishy",1,true)~=nil or cu:match("butter$")~=nil or cu:match("butter[^%a]")~=nil
end local gh={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function au(cv)if type(cv)~="number"then return"?"end
local d1=1 while math.abs(cv)>=1000 and d1<#gh do cv=cv/1000 d1=d1+1 end local qA=string.format("%.2f",cv):gsub("%.?0+$","")
return qA..gh[d1]end local function qB(j3)if type(j3)~="string"then return nil end local qC,j4=j3:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local gi=tonumber(qC)if not gi then return nil end if j4==""then return gi end for qD,qE in ipairs(gh)do if qE:lower()==j4:lower()then return gi*1000^(qD-1)end end
return nil end local function aO()local j5=C:GetAttribute("BoardValueMoney")if type(j5)=="number"then return j5 end
local j6=C:FindFirstChild("leaderstats")if j6 then for xH,qF in ipairs({"Cash","Money","Coins"})do local gj=j6:FindFirstChild(qF)
if gj and type(gj.Value)=="number"then return gj.Value end end end end local function d2(qG)local gk=qG:GetFullName()
if a.plot then local gl=a.plot:GetFullName()if gk:sub(1,#gl)==gl then return gk:sub(#gl+2)end end return gk end
local function aP()local d3=C.Character if d3 and d3:FindFirstChild("HumanoidRootPart")then local j7=d3:FindFirstChildOfClass("Humanoid")
if j7 and j7 .Health>0 then return d3 end end end local function a3()local gm=aG:FindFirstChild("Plots")if not gm then return nil end
local function j8(qH)local j9=qH:FindFirstChild("Plate")return j9~=nil and j9:FindFirstChild("EditStackAttachment",true)~=nil
end local j_=C:GetAttribute("PlotNumber")if j_~=nil then local gn=gm:FindFirstChild(tostring(j_))if gn and j8(gn)then return gn end
end for xI,ka in ipairs(gm:GetChildren())do if j8(ka)then return ka end end end local function cw(kb)local a4=kb and kb.Parent
for xJ=1,6 do if not a4 then return nil end if a4:IsA("BasePart")then return a4 end if a4:IsA("Model")then return a4 .PrimaryPart or a4:FindFirstChildWhichIsA("BasePart",true)end
a4=a4 .Parent end end local function kc(kd)local go=kd.Parent if go and go:IsA("Attachment")then return go.WorldPosition end
local ke=cw(kd)return ke and ke.Position end local function qI()local bS=a.plot and a.plot:FindFirstChild("Plate")
if not bS then return nil end if bS:IsA("BasePart")then return bS.Position end if bS:IsA("Model")then return bS:GetPivot().Position end
local kf=bS:FindFirstChildWhichIsA("BasePart",true)return kf and kf.Position end local function kg()local gp={}
local kh=a.plot and a.plot:FindFirstChild("WaxStations")if kh then for xK,qJ in ipairs(kh:GetChildren())do local ki=qJ:FindFirstChild("SquishyPlaceHolder")
local gq=ki and ki:FindFirstChild("PlacePrompt")if gq and gq:IsA("ProximityPrompt")then gp[#gp+1]=gq end end end
return gp end local function d4()local kj,gr=kg(),0 for xL,qK in ipairs(kj)do if qK.Enabled then gr=gr+1 end end
local gs=#kj local gt=C:GetAttribute("WaxStations")if type(gt)=="number"and gt>gs then gs=gt end return gr,gs
end local function qL()local kk=aP()local kl=kk and kk.HumanoidRootPart.Position local gu,km for xM,gv in ipairs(kg())do
if gv.Enabled then local kn=kc(gv)local ko=(kn and kl)and(kn-kl).Magnitude or 1e9 if not gu or ko<km then gu,km=gv,ko end
end end return gu end local function kp()local d5=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not d5 then return nil end local kq=d5:FindFirstChild("BuyPromptAttachment")local d6=(kq and kq:FindFirstChild("BuyPrompt"))or d5:FindFirstChild("BuyPrompt",true)
if d6 and d6:IsA("ProximityPrompt")and d6:IsDescendantOf(d5)then return d6 end end local kr={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local qM={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local V={order={},price={},dirty=false}local E={seen={},at=0,boxes={},built=0}local M={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local gw="SAB_order.txt"local function d7()if not V.dirty or type(writefile)~="function"then return end local an={}
for qN,qO in pairs(V.price)do an[#an+1]="P|"..qN.."|"..string.format("%.0f",qO)end for qP,qQ in pairs(V.order)do an[#an+1]="O|"..qP.."|"..table.concat(qQ,",")end
if d.learned and d.enc then an[#an+1]="M|mode|"..tostring(d.learned.mode or"")for qR,d8 in ipairs(d.learned.seq)do
local ks={}for kt=1,d8 .n do ks[kt]=d.enc(d8 .args[kt])end an[#an+1]=("A|%d|%s|%d|%s"):format(qR,d8 .m,d8 .n,table.concat(ks,";"))
end end local function gx(qS,qT,d9)local ku={}for kv=1,d9 .n do ku[kv]=d.enc(d9 .args[kv])end an[#an+1]=("R|%d|%s|%s|%d|%s"):format(qT,qS,d9 .m,d9 .n,table.concat(ku,";"))
end if d.enc then for qU,qV in ipairs(y.rec.rules)do gx("rules",qU,qV)end if y.rec.on then gx("on",0,y.rec.on)end
if y.rec.off then gx("off",0,y.rec.off)end end for xN,cx in pairs(E.seen)do an[#an+1]=("K|%s|%s|%s|%s"):format(cx.name,cx.title or"",cx.rar or"",cx.price and string.format("%.0f",cx.price)or"")
end if pcall(writefile,gw,table.concat(an,"\n"))then V.dirty=false end end local function qW()if type(isfile)~="function"or type(readfile)~="function"then return end
local qX,qY=pcall(isfile,gw)if not(qX and qY)then return end local qZ,kw=pcall(readfile,gw)if not(qZ and type(kw)=="string")then return end
for q0 in kw:gmatch("[^\n]+")do local bT,bU,aQ=q0:match("^(%a)|([^|]+)|(.*)$")if bT=="P"then V.price[bU]=tonumber(aQ)
elseif bT=="M"then d.loadMode=(aQ~=""and aQ~="nil")and aQ or nil elseif bT=="A"and d.dec then local kx=tonumber(bU)
local ky,d_,q1=aQ:match("^([^|]+)|(%d+)|(.*)$")if kx and ky then d_=tonumber(d_)local kz,ea={},0 for q2 in(q1 ..";"):gmatch("([^;]*);")do
ea=ea+1 if ea<=d_ then kz[ea]=d.dec(q2)end end d.loadSeq=d.loadSeq or{}d.loadSeq[kx]={m=ky,n=d_,args=kz}end elseif bT=="R"and d.dec then
local kA=tonumber(bU)local eb,q3,ec,q4=aQ:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if kA and eb then ec=tonumber(ec)
local kB,ed={},0 for q5 in(q4 ..";"):gmatch("([^;]*);")do ed=ed+1 if ed<=ec then kB[ed]=d.dec(q5)end end local gy={m=q3,n=ec,args=kB}
if eb=="rules"then y.rec.rules[kA]=gy elseif eb=="on"then y.rec.on=gy elseif eb=="off"then y.rec.off=gy end end
elseif bT=="K"then local kC,kD,q6=aQ:match("^([^|]*)|([^|]*)|(.*)$")E.seen[E.key(bU)]={name=bU,title=kC~=""and kC or nil,
rar=kD~=""and kD or nil,price=tonumber(q6)}elseif bT=="O"and aQ~=""then local ee={}for q7 in aQ:gmatch("[^,]+")do ee[#ee+1]=q7 end
if#ee>0 then V.order[bU]=ee end end end end local function q8(ef)if type(ef)~="table"then return end local bp,kE=ef.rarity,ef.contents
if type(bp)~="string"or bp==""or type(kE)~="table"then return end local cy={}for xO,eg in ipairs(kE)do if type(eg)=="table"and type(eg.butter)=="string"then
cy[#cy+1]={n=eg.butter,ch=tonumber(eg.chance)or 0}end end if#cy==0 then return end table.sort(cy,function(q9,q_)return q9 .ch>q_.ch end)
local cz,cA={},false for ra,rb in ipairs(cy)do cz[ra]=rb.n end local gz=V.order[bp]if not gz or#gz~=#cz then cA=true end
if not cA then for kF=1,#cz do if gz[kF]~=cz[kF]then cA=true break end end end V.order[bp]=cz local gA=tonumber(ef.price)
if gA and V.price[bp]~=gA then V.price[bp]=gA cA=true end if cA then V.dirty=true M.at=0 u("learned the "..bp.." order from its crate")
end end local function bV(rc,rd)local re=rc:FindFirstChild(rd,true)local rf,gB=pcall(function()return re.Text end)
return(rf and type(gB)=="string"and gB~="")and gB or nil end local function aa(kG)return M.pretty[kG]or kG end
E.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function E.key(rg)return d0(rg or"")end
function E.learn(aR)if type(aR)~="table"or type(aR.name)~="string"then return end local gC=E.key(aR.name)local aS=E.seen[gC]or{}
local rh=(E.seen[gC]==nil)or(tonumber(aR.price)and aS.price~=tonumber(aR.price))aS.name,aS.title=aR.name,aR.title or aS.title
aS.rar,aS.price=aR.rarity or aS.rar,tonumber(aR.price)or aS.price E.seen[gC]=aS if rh then E.at,V.dirty=r(),true end
end function E.wanted(kH)return kH~=nil and e.CrateTicks[E.key(kH)]==true end function E.list()local bW={}for ri,eh in ipairs(E.base)do bW[E.key(eh[1])]={name=eh[1],title=eh[2],rar=eh[3],i=ri}end
for xP,cB in ipairs(M.rarOrder)do local kI=false for xQ,rj in pairs(bW)do if rj.rar==cB then kI=true break end end
if not kI and cB~="?"then local kJ=cB:gsub("[^%w]","").."Crate"bW[E.key(kJ)]={name=kJ,title=cB.." Crate",rar=cB,i=50,guess=true}
end end for kK,ei in pairs(E.seen)do local aH=bW[kK]or{i=100}aH.name,aH.title,aH.rar=ei.name or aH.name,ei.title or aH.title,ei.rar or aH.rar
aH.price,aH.guess=ei.price or aH.price,nil bW[kK]=aH end local cC,ej={},{}for rk,rl in ipairs(kr)do cC[rl]=rk end
for rm,kL in ipairs(M.rarOrder)do cC[kL]=cC[kL]or(20+rm)end for rn,cD in pairs(bW)do cD.k=rn cD.price=cD.price or V.price[cD.rar or""]
ej[#ej+1]=cD end table.sort(ej,function(bq,br)if bq.price and br.price and bq.price~=br.price then return bq.price<br.price end
local kM,kN=cC[bq.rar or""]or 99,cC[br.rar or""]or 99 if kM~=kN then return kM<kN end if(bq.i or 100)~=(br.i or 100)then return(bq.i or 100)<(br.i or 100)end
return bq.k<br.k end)return ej end local function ro()local kO=az:FindFirstChild("Assets")local kP=kO and kO:FindFirstChild("Squishies")
if not kP then return false end local gD,kQ,bX={},{},{}local ek=0 for xR,el in ipairs(kP:GetChildren())do local cE=Q(el.Name)
if cE~=""and not gD[cE]then local em=bV(el,"RarityText")or"?"gD[cE]=em kQ[cE]=bV(el,"NameText")or el.Name bX[em]=bX[em]or{}
table.insert(bX[em],cE)ek=ek+1 end end if ek==0 then return false end for kR,rp in pairs(bX)do local kS=V.order[kR]or qM[kR]
local gE={}if kS then for rq,rr in ipairs(kS)do gE[Q(rr)]=rq end end table.sort(rp,function(kT,kU)local gF,gG=gE[kT],gE[kU]
if gF and gG then return gF<gG end if gF then return true end if gG then return false end return aa(kT)<aa(kU)
end)end local gH={}for rs,rt in ipairs(kr)do gH[rt]=rs end local en={}for ru in pairs(bX)do en[#en+1]=ru end table.sort(en,function(gI,gJ)
local gK,gL=V.price[gI],V.price[gJ]if gK and gL and gK~=gL then return gK<gL end local gM,gN=gH[gI],gH[gJ]if gM and gN then return gM<gN end
if gM then return true end if gN then return false end return gI<gJ end)M.rar,M.pretty,M.members,M.rarOrder,M.n,M.at=gD,kQ,bX,en,ek,r()
return true end local function gO()if M.at==0 or(r()-M.at)>120 then pcall(ro)end return M.n>0 end local function rv(rw)
local kV=Q(rw)return M.rar[kV]or(J.name and Q(J.name)==kV and J.rar)or"?"end local function rx()local eo={}for ry,rz in pairs(e.Targets)do if rz then eo[#eo+1]=aa(ry)end end
table.sort(eo)return eo end local W={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function kW()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function ep(kX)if type(makefolder)~="function"then return end local rA,rB=pcall(isfolder,kX)if not(rA and rB)then pcall(makefolder,kX)end
end local function eq(kY)if type(isfile)~="function"or type(readfile)~="function"then return nil end local rC,rD=pcall(isfile,kY)
if not(rC and rD)then return nil end local rE,rF=pcall(readfile,kY)return rE and rF or nil end local function cF(rG,rH)
if type(writefile)~="function"then return false end return(pcall(writefile,rG,rH))end local function kZ(rI)local cG={}
if type(listfiles)~="function"then return cG end local rJ,k0=pcall(listfiles,rI)if not rJ or type(k0)~="table"then return cG end
for xS,rK in ipairs(k0)do cG[#cG+1]=tostring(rK)end return cG end local function k1()local er={}for xT,rL in ipairs(kZ(W.cfg))do
local k2=rL:match("([^/\\]+)%.txt$")if k2 then er[#er+1]=k2 end end table.sort(er)return er end local function rM()
local L={"V|1"}L[#L+1]="N|Every|"..tostring(e.Every)L[#L+1]="N|GlazeLead|"..tostring(e.GlazeLead)L[#L+1]="N|FpsCap|"..tostring(e.FpsCap)
L[#L+1]="N|MemLimit|"..tostring(e.MemLimit)for xU,k3 in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do L[#L+1]="S|"..k3 .."|"..e[k3]end
do local es={}for rN,cH in pairs(e.Pets)do local k4=(cH.b and"b"or"")..(cH.g and"g"or"")..(cH.w and"w"or"")..((tonumber(cH.f)or 0)>0 and tostring(cH.f)or"")
if k4~=""then es[#es+1]=rN.."|"..k4 end end table.sort(es)L[#L+1]="P|-"for xV,rO in ipairs(es)do L[#L+1]="P|"..rO end
end for xW,k5 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild"})do
L[#L+1]="B|"..k5 .."|"..(e[k5]and"1"or"0")end local gP=C:GetAttribute("AutoRollRules")if type(gP)=="string"and gP~=""then e.ARrules,e.ARstop=gP,tostring(C:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then L[#L+1]="S|rules|"..e.ARrules L[#L+1]="S|stop|"..e.ARstop end if a.winPos then L[#L+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then L[#L+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for xX,gQ in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local et={}for rP,rQ in pairs(gQ[2])do if rQ then et[#et+1]=rP end end table.sort(et)L[#L+1]=gQ[1].."|-"for xY,rR in ipairs(et)do L[#L+1]=gQ[1].."|"..rR end
end return table.concat(L,"\n")end local function rS(gR)if type(gR)~="string"or gR==""then return false end local k6,k7,k8,k9,cI={},false,{},false,nil
for rT in gR:gmatch("[^\n]+")do local av,T,al=rT:match("^(%a)|([^|]*)|?(.*)$")if av=="N"and T=="Every"then local gS=tonumber(al)
if gS and gS>=1 then e.Every=math.floor(gS)end elseif av=="N"and(T=="FpsCap"or T=="MemLimit")then local gT=tonumber(al)
if gT and gT>=0 then e[T]=math.floor(gT)end elseif av=="N"and T=="GlazeLead"then local eu=tonumber(al)if eu and eu>=5 and eu<=600 then e.GlazeLead=math.floor(eu)end
elseif av=="S"and(T=="TeamNormal"or T=="TeamFull"or T=="TeamGlaze"or T=="TeamWax")then e[T]=al elseif av=="P"and T~=""then
if not cI then cI={}end if T~="-"and al~=""then cI[T]={b=al:find("b",1,true)and true or nil,g=al:find("g",1,true)and true or nil,
w=al:find("w",1,true)and true or nil,f=tonumber(al:match("%d"))}end elseif av=="B"then if e[T]~=nil then e[T]=(al=="1")end
elseif av=="S"and T=="rules"then e.ARrules=al elseif av=="S"and T=="stop"then e.ARstop=al elseif av=="W"then a.winPos={tonumber(T)or 10,tonumber(al)or 44}
elseif av=="G"then a.togPos={tonumber(T)or 10,tonumber(al)or 300}elseif av=="T"and T~=""then if T~="-"then k6[T]=true end
k7=true elseif av=="K"and T~=""then if T~="-"then k8[T]=true end k9=true end end if k7 then e.Targets=k6 end if k9 then e.CrateTicks=k8 end
if cI then e.Pets=cI end return true end local function ev(bY)if not kW()then return false,"this executor cannot write files"end
bY=(bY or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if bY==""then return false,"give the config a name"end
ep(W.dir)ep(W.cfg)if not cF(W.cfg.."/"..bY..".txt",rM())then return false,"could not write the file"end a.config=bY
return true,bY end local function k_(ew)local la=eq(W.cfg.."/"..ew..".txt")if not la then return false,"no config called "..tostring(ew)end
if not rS(la)then return false,"that config looks empty"end a.config=ew return true,ew end local function lb(gU)
if gU then ep(W.dir)cF(W.auto,gU)elseif type(delfile)=="function"then pcall(delfile,W.auto)else cF(W.auto,"")
end a.autoload=gU end local function rU()if a.selfPath then return a.selfPath end local ex for xZ,rV in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",W.dir})do
for x0,lc in ipairs(kZ(rV))do local gV=lc:lower()if gV:sub(-4)==".lua"and(gV:find("sab_farm",1,true)or gV:find("sab farm",1,true))then
ex=ex or lc end end end a.selfPath=ex return ex end W.stub=[[
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
local function rW()if not kW()then return false,"this executor cannot write files"end ep("autoexec")if not cF(W.exec,W.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local ey=(function()local rX,rY=pcall(function()return game:GetService("TeleportService")end)return rX and rY or nil end)()
local function gW()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local rZ=queueonteleport or queue_on_teleport return(pcall(rZ,W.stub))end local function cJ(r0)if a.rejoining then return end
a.rejoining=true u("REJOIN ("..r0 ..")")pcall(d7)if a.autoload then pcall(ev,a.autoload)end local r1=gW()u(r1 and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for x1=1,30 do if not ey then break end pcall(function()ey:Teleport(game.PlaceId,C)end)task.wait(10)
end end)end local function r2()local r3,ld=pcall(function()return game:GetService("GuiService")end)if r3 and ld then
pcall(function()O(ld.ErrorMessageChanged:Connect(function()if e.Rejoin then cJ("roblox error message")end end))
end)end pcall(function()local le=game:GetService("CoreGui")local lf=le and le:WaitForChild("RobloxPromptGui",15)
local lg=lf and lf:WaitForChild("promptOverlay",15)if lg then O(lg.ChildAdded:Connect(function(r4)if e.Rejoin and tostring(r4 .Name):lower():find("errorprompt",1,true)then cJ("disconnect prompt")end
end))end end)pcall(function()O(C.OnTeleport:Connect(function(r5)if tostring(r5):find("Started")then gW()end end))
end)if ey then pcall(function()O(ey.TeleportInitFailed:Connect(function()a.rejoining=false if e.Rejoin then task.delay(5,function()cJ("teleport retry")end)end
end))end)end end local function lh(r6)local li=a.plot and a.plot:FindFirstChild(r6)if not li then return nil,false end
for x2,gX in ipairs(li:GetChildren())do if gX:IsA("Model")or gX:IsA("BasePart")then return gX,true end end return nil,true
end local function cK()local a5=lh("RolledSquishy")if not a5 then return nil end return{model=a5,name=a5 .Name,pretty=bV(a5,"NameText")or aa(Q(a5 .Name)),
rar=bV(a5,"RarityText")or rv(a5 .Name),price=bV(a5,"PriceText")}end local function lj(gY)return type(gY)=="string"and(M.rar[Q(gY)]~=nil or qz(gY))
end local function P()local gZ=lh("SquishyEquipped")if gZ then a.carrySrc,d.heldAt="model",r()return gZ.Name,gZ end
local lk=C.Character if lk then for x3,cL in ipairs(lk:GetDescendants())do if(cL:IsA("Model")or cL:IsA("Tool"))and lj(cL.Name)then
a.carrySrc,d.heldAt="character",r()return cL.Name,cL end end end local ez=C:GetAttribute("SquishyEquipped")if type(ez)=="string"and ez~=""and lj(ez)and r()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return ez,nil end a.carrySrc=nil end local function x4()local x5,r7=P()return r7 end local function ll()
local lm=cK()local g0=lm and qB(lm.price)local g1=aO()if g0 and g1 and g1<g0*0.5 then return g1,g0 end end local function bZ(r8)
ct[#ct+1]=os.date("%H:%M:%S").." "..r8 if#ct>40 then table.remove(ct,1)end end local function r9(bs,eA)if type(bs)~="string"then return end
bZ(("Roll(%s,%s)"):format(bs,tostring(eA)))if bs:lower():find("crate",1,true)then d.rolled,d.rolledAt=bs,r()return
end J.seq=J.seq+1 J.name,J.at=bs,r()J.rar=type(eA)=="string"and eA or nil a.rolls=a.rolls+1 if aN(bs)then u(("ROLL %s [%s] = TARGET"):format(bs,tostring(eA)))end
end local function r_(bt)if type(bt)~="table"then return end local eB=bt.butter or bt.itemName if type(eB)~="string"then return end
a.gifts=a.gifts+1 J.gift,J.giftAt=eB,r()if type(bt.giftId)=="string"then local ln=az:FindFirstChild("Remotes")
local lo=ln and ln:FindFirstChild("GiftThanks")if lo then pcall(function()lo:FireServer(bt.giftId)end)end end
bZ("Gift("..eB.." from "..tostring(bt.fromName)..")")u(("GIFT from %s: %s - it will not be waxed"):format(tostring(bt.fromName),eB))
end local function sa()local lp=az:WaitForChild("Remotes",30)if not a.alive then return end if not lp then u("Remotes folder missing - no roll events")return end
O(C:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local lq=C:GetAttribute("SquishyEquipped")
if type(lq)=="string"and lq~=""then d.heldAt=r()end end))local sh={SquishyRollAnimation=r9,InitSquishy=function(lr)J.init,J.initAt=tostring(lr),r()bZ("Init("..tostring(lr)..")")end,
CrateUpdate=function(b0,ls)pcall(q8,b0)pcall(E.learn,b0)if type(b0)=="table"then local sb=ls==true or(d.rolled~=nil and r()-d.rolledAt<15)or d.waiting
if not sb then return end local sc=not d.waiting local sd=d.on d.waiting,d.data,d.at=true,b0,r()d.on=(ls==true)
d.title=tostring(b0 .title or b0 .name or"crate")if d.on and not sd then d.openedAt,d.byYou=r(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then bZ("CrateWindow open("..d.title..")")elseif sc then bZ("Crate waiting("..d.title..")")u(d.title.." is waiting on your stand")
end else if d.waiting then bZ("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local se=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,se)end if d.classify then local sf=r()
task.spawn(function()pcall(d.classify,sf)end)end end end,GiftReceived=r_,}for eC,si in pairs(sh)do local g2=lp:FindFirstChild(eC)
if g2 and g2:IsA("RemoteEvent")then O(g2 .OnClientEvent:Connect(si))elseif eC~="CrateUpdate"and eC~="GiftReceived"then u("remote "..eC.." missing")end
end end local function g3()local bu=cK()if bu then if aN(bu.name)then return{state="match",shown=bu.pretty,src="pad",info=bu}
end return{state="skip",info=bu,level="idle",text=("on pad: %s [%s] - not ticked"):format(bu.pretty,tostring(bu.rar))}
end if J.name and(r()-J.at)<4 then if aN(J.name)then return{state="match",shown=aa(Q(J.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(aa(Q(J.name)),tostring(J.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function lt(sj,sk,sl,sm)
local eD=RaycastParams.new()eD.FilterType=Enum.RaycastFilterType.Exclude local g4={C.Character}for x6,sn in ipairs(sm or{})do g4[#g4+1]=sn end
eD.FilterDescendantsInstances=g4 pcall(function()eD.RespectCanCollide=true end)local lu=aG:Raycast(Vector3 .new(sj,sk+4,sl),Vector3 .new(0,-30,0),eD)
return lu and lu.Position or nil end local function g5(lv)local lw=lv:FindFirstChildOfClass("Humanoid")return((lw and lw.HipHeight)or 2)+lv.HumanoidRootPart.Size.Y/2+0.2
end local function g6(so,sp)local lx=so:FindFirstChildOfClass("Humanoid")local sq=r()while r()-sq<sp do if lx and lx.FloorMaterial~=Enum.Material.Air then return true end
ag(0.05)end return false end local function cM(sr,g7,g8)local ly=sr.HumanoidRootPart ly.AssemblyLinearVelocity=Vector3 .new(0,0,0)
ly.CFrame=g8 and CFrame.new(g7,Vector3 .new(g8 .X,g7 .Y,g8 .Z))or CFrame.new(g7)end local function cN(aT,lz)local bv=aP()
if not bv or not aT then return false end local a6=aT.Position local eE=math.clamp(math.max(aT.Size.X,aT.Size.Z)/2+2.2,3,7)
local lA=(lz and lz.MaxActivationDistance)or 10 if eE>lA-2 then eE=math.max(2.5,lA-2)end local cO={}local function bw(cP)
cP=Vector3 .new(cP.X,0,cP.Z)if cP.Magnitude>0.05 then cO[#cO+1]=cP.Unit end end local lB=qI()if lB then bw(lB-a6)end
bw(aT.CFrame.LookVector)bw(-aT.CFrame.LookVector)bw(aT.CFrame.RightVector)bw(-aT.CFrame.RightVector)bw(bv.HumanoidRootPart.Position-a6)
if#cO==0 then bw(Vector3 .new(0,0,1))end local ss,eF=g5(bv),false for x7,su in ipairs(cO)do local eG=a6+su*eE
local g9=lt(eG.X,a6 .Y,eG.Z,{aT})if g9 and math.abs(g9 .Y-a6 .Y)<14 then cM(bv,Vector3 .new(eG.X,g9 .Y+ss,eG.Z),a6)
if g6(bv,0.7)then eF=true break end end end if not eF then cM(bv,a6+cO[1]*eE+Vector3 .new(0,3,0),a6)eF=g6(bv,1)
end ag(0.12)return eF end local function sv(cQ)if not cQ.Parent or not cQ.Enabled then return false end pcall(function()cQ:InputHoldBegin()end)
ag(math.max(cQ.HoldDuration,0)+0.08)pcall(function()cQ:InputHoldEnd()end)return true end local function ah(lC,sw)
local sx=r()while r()-sx<sw do if lC()then return true end ag(0.05)end return lC()end local function eH(b1,sy,lD,sz)
local sA=a.zapFirst and{"zap","hold"}or{"hold","zap"}for sB,g_ in ipairs(sA)do if sB==2 and(sz or not(b1 .Parent and b1 .Enabled and(not lD or lD())))then break end
local ha if g_=="hold"then ha=sv(b1)else ha=type(fireproximityprompt)=="function"and b1 .Parent~=nil and b1 .Enabled and pcall(fireproximityprompt,b1)end
if ha and ah(sy,1.2)then a.zapFirst=(g_=="zap")return true,g_ end end return false end local function lE(hb)local a7=kp()
if not a7 or not a7 .Enabled then u("buy: nothing on the pad")return false end local lF=cw(a7)if not lF then u("buy: pad part missing")return false end
a.lastBuyAt=r()local sC,lG=J.seq,aO()cN(lF,a7)if not a7 .Enabled then u("buy aborted: pad emptied")return false end
local b2=g3()if not hb and b2 .state~="match"then u("buy aborted: "..(b2 .text or"pad changed"))a.matchSince=nil
return false end local hc=b2 .info and b2 .info.name or(b2 .state=="match"and J.name)or nil local function sD()
return a7 .Enabled and P()==nil and(hb or g3().state=="match")end local sE,sF=eH(a7,function()return P()~=nil or((not a7 .Enabled)and(hb or J.seq==sC))
end,sD,ll()~=nil)if sE then ah(function()return P()~=nil end,0.8)local cR=P()local lH=aO()a.holding,a.bought,a.cashFails=true,a.bought+1,0
a.matchSince=nil J.name,J.rar,J.at=nil,nil,r()u(("BOUGHT %s%s via %s"):format(cR and aa(Q(cR))or(b2 .shown or"?"),(lG and lH)and(" for $"..au(lG-lH))or"",sF))
if cR and hc and Q(cR)~=Q(hc)then u(("note: picked up %s, not %s"):format(cR,hc))end return true end a.cashFails=a.cashFails+1
a.noCashUntil=r()+math.min(8*2^(a.cashFails-1),60)local lI=cK()u(("BUY REFUSED: cash short? have $%s, price %s"):format(au(aO()),(lI and lI.price)or"?"))
return false end local function lJ()local eI=P()if not eI then a.holding=false u("place: hands are empty")return false
end if not aN(eI)then u(("REFUSED TO WAX %s - it is not ticked"):format(aa(Q(eI))))return false end for x8=1,e.PlaceTries do
local a8=qL()if not a8 then u("place: no free station")break end local lK=cw(a8)if lK then cN(lK,a8)local lL=P()
if not lL then a.holding=false u("place: hands emptied on the way")return false end if not aN(lL)then u("place: what I carry changed, not waxing it")return false end
if a8 .Enabled then local sG,sH=eH(a8,function()return not a8 .Enabled end,function()return a8 .Enabled end)if sG then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=r()+2.5,0 J.name,J.rar,J.at=nil,nil,r()
u(("WAXED %s #%d at %s via %s"):format(aa(Q(eI)),a.placed,a8 .Parent.Parent.Name,sH))return true end end end ag(0.25)
end a.placeFails=a.placeFails+1 if P()==nil then a.holding=false end u("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then
a.capHit,a.running,a.capAt=true,false,r()a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(P()))u(a.capMsg)end return false end function o.place()local sI=r()while a.alive and o.editing and r()-sI<25 do ag(0.2)end
if e.Teams and e.TeamWax~=""then o.placing=true local sJ=r()while a.alive and o.current()~=e.TeamWax and r()-sJ<5 do ag(0.1)end
if o.current()==e.TeamWax then ag(0.3)else u("wax team did not come on in time - placing anyway")end end local sK,lM=pcall(lJ)
o.placing=false if not sK then error(lM,0)end return lM end local function lN(lO)return type(lO)=="string"and lO:lower():find("crate",1,true)~=nil
end local sL={SABFarmGui=1,SABToggle=1,SABError=1}local function hd(sM)local a9=sM while a9 do if sL[a9 .Name]then return false end
if a9:IsA("ScreenGui")then local sN,sO=pcall(function()return a9 .Enabled end)return(not sN)or sO~=false end if a9:IsA("GuiObject")and not a9 .Visible then return false end
a9=a9 .Parent end return false end local function eJ(eK)local b3=""pcall(function()if eK:IsA("TextButton")then b3=eK.Text end end)
if not b3:find("%a")then for x9,eL in ipairs(eK:GetDescendants())do if(eL:IsA("TextLabel")or eL:IsA("TextButton"))and eL.Text:find("%a")then b3=eL.Text break end
end end if not b3:find("%a")then b3=eK.Name end return(b3:lower():gsub("[^%a]",""))end local function sP()local cS,cT
local lP=C:FindFirstChildOfClass("PlayerGui")if not lP then return nil,nil end for x_,cU in ipairs(lP:GetDescendants())do
if cU:IsA("GuiButton")and hd(cU)then local he=eJ(cU)if he:sub(1,4)=="open"and not he:find("shop",1,true)then cS=cS or cU end
if he:sub(1,7)=="discard"then cT=cT or cU end end end if cS and cT then return cS,cT end if d.on then return cS,cT end
return nil,nil end local hf=(function()local sQ,sR=pcall(function()return game:GetService("VirtualInputManager")end)return sQ and sR or nil end)()
local function lQ(aU,hg)local hh={}local function lR(sS)hh[#hh+1]=sS end if a.tapWay then lR(a.tapWay)end for ya,lS in ipairs({"touch","conn","signal"})do
if lS~=a.tapWay then lR(lS)end end local function lT(sT,...)local sU,hi=pcall(getconnections,sT)if not(sU and type(hi)=="table"and#hi>0)then return false end
local lU,sV,sW=false,{...},select("#",...)for yb,sX in ipairs(hi)do if pcall(function()sX:Fire(table.unpack(sV,1,sW))end)then lU=true end
end return lU end local function lV()local lW=Vector3 .new(0,0,0)pcall(function()local lX,lY=aU.AbsolutePosition,aU.AbsoluteSize
lW=Vector3 .new(lX.X+lY.X/2,lX.Y+lY.Y/2,0)end)local hj={Position=lW,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()hj.UserInputType=Enum.UserInputType.Touch end)pcall(function()hj.UserInputState=Enum.UserInputState.End end)
return hj end for yc,aV in ipairs(hh)do local cV=false if aV=="conn"and type(getconnections)=="function"then if lT(aU.MouseButton1Click)then
cV=true if ah(hg,1.5)then a.tapWay=aV return true,aV end end cV=lT(aU.Activated,lV(),1)elseif aV=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aU.MouseButton1Click)then if ah(hg,1.5)then a.tapWay=aV return true,aV end end cV=pcall(firesignal,aU.Activated,lV(),1)
elseif aV=="touch"and hf then cV=pcall(function()local lZ,l0=aU.AbsolutePosition,aU.AbsoluteSize local l1=0 local l2=aU:FindFirstAncestorWhichIsA("ScreenGui")
local sY,sZ=pcall(function()return l2 and l2 .IgnoreGuiInset end)if not(sY and sZ)then pcall(function()l1=game:GetService("GuiService"):GetGuiInset().Y end)
end local l3,l4=lZ.X+l0 .X/2,lZ.Y+l0 .Y/2+l1 hf:SendMouseButtonEvent(l3,l4,0,true,game,1)task.wait(0.06)hf:SendMouseButtonEvent(l3,l4,0,false,game,1)
end)end if cV and ah(hg,1.5)then a.tapWay=aV return true,aV end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function hk(l5)local cW=l5 .Parent while cW and cW~=a.plot do if d.NOT[cW.Name]then return false end cW=cW.Parent
end local hl=(l5 .ActionText or""):lower()if hl:find("roll",1,true)or hl:find("place",1,true)or hl:find("sell",1,true)then return false end
return true end local function s0()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local l6=a.plot:FindFirstChild("CrateStand")local cX if l6 then for yd,eM in ipairs(l6:GetDescendants())do
if eM:IsA("ProximityPrompt")and eM.Enabled and hk(eM)then cX=eM break end end end if not cX then for ye,a_ in ipairs(a.plot:GetDescendants())do
if a_:IsA("ProximityPrompt")and a_.Enabled and hk(a_)then local l7=a_:FindFirstAncestorWhichIsA("Model")local s1=((a_.ActionText or"").." "..(a_.ObjectText or"").." "..a_.Name.." "..(l7 and l7 .Name or"")):lower()
if s1:find("crate",1,true)then cX=a_ break end end end end d.prompt=cX return cX end local function hm()if d.on then return true end
local cY=s0()if not cY then d.summonFails=d.summonFails+1 d.lastFail=r()u("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local l8=cw(cY)if l8 then cN(l8,cY)end d.ours=true eH(cY,function()return d.on end)if ah(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=r()u("crate: pressed "..d2(cY).." but no window came up")
return false end do local function s2(l9)local b4=l9 .Parent while b4 and b4:IsA("GuiObject")do local l_,ma=false,false
for yf,cZ in ipairs(b4:GetDescendants())do if cZ~=l9 and cZ:IsA("GuiButton")and eJ(cZ):sub(1,7)=="discard"then l_=true end
if cZ:IsA("TextLabel")then local hn=cZ.Text:lower()if hn:find("crate",1,true)or hn:find("can contain",1,true)or hn:find("cost",1,true)then ma=true end
end if l_ and ma then return b4 end end b4=b4 .Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local mb=C:FindFirstChildOfClass("PlayerGui")if not mb then return nil end for yg,eN in ipairs(mb:GetDescendants())do
if eN:IsA("GuiButton")and not eN:FindFirstAncestor("SABFarmGui")and eJ(eN):sub(1,4)=="open"then local ho=s2(eN)
if ho then d.win=ho return ho end end end end local function s3(s4)for yh,eO in ipairs(s4:GetDescendants())do
if eO:IsA("GuiButton")then local mc,hp=eJ(eO),eO.Name:lower()if mc=="x"or mc=="close"or hp=="x"or hp:find("close",1,true)or hp:find("exit",1,true)then return eO end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(s5)task.wait(s5 and 4 or 1.2)if d.on or d.waiting then return end
local eP=d.findWin()if not eP or not hd(eP)then return end local md=s3(eP)if md and lQ(md,function()return not hd(eP)end)then return end
u("the crate window is still open - tap its X")end end local function eQ(eR)if not hm()then return false end local me=r()-(d.openedAt or 0)
if me<0.6 then ag(0.6-me)end local hq=d.title local s6,s7=sP()local mf=eR and s6 or s7 if not mf then d.lastFail=r()
a.crateFails=a.crateFails+1 u(("crate: no %s button found in %s"):format(eR and"Open"or"Discard",hq))return false
end local s8=P()local s9,yi=lQ(mf,function()return(not d.on)or(P()~=nil and P()~=s8)end)if not s9 then d.lastFail=r()
a.crateFails=a.crateFails+1 u("crate: could not press "..(eR and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if eR then a.crates=a.crates+1 ah(function()return P()~=nil end,1.5)local mg=P()
u(("OPENED %s -> %s"):format(hq,mg and aa(Q(mg))or"?"))else u("discarded "..hq.." (nothing ticked in it)")end
return true end d.calls={}function d.saw(s_,...)local ta=select("#",...)d.calls[#d.calls+1]={t=r(),m=s_,n=ta,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(ao,aW)local ba=type(ao)if(ba=="string"or ba=="number")and type(aW.data)=="table"then for mh,hr in pairs(aW.data)do
if hr==ao and type(mh)=="string"and(type(hr)=="string"or type(hr)=="number")then return{__slot="f:"..mh}end end
end if ba=="string"then if aW.crate and ao==aW.crate then return{__slot="crate"}end if aW.title and ao==aW.title then return{__slot="title"}end
if aW.rar and ao==aW.rar then return{__slot="rarity"}end return ao end if ba=="number"or ba=="boolean"or ba=="nil"then return ao end
if ba=="table"then local mi={}for tb,mj in pairs(ao)do if type(mj)=="table"then return nil,"nested table"end local tc,mk=d.slot(mj,aW)
if mk then return nil,mk end mi[tb]=tc end return mi end local td,te=pcall(function()return ao:IsA("Instance")end)
if td and te then if ao==C then return{__slot="player"}end if a.plot and ao==a.plot then return{__slot="plot"}end
local eS=a.plot and a.plot:FindFirstChild("CrateStand")if eS and ao==eS then return{__slot="stand"}end if eS and ao.Parent==eS then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..ba..")"end function d.resolve(eT)if type(eT)~="table"then return eT end
local aA=eT.__slot if aA and aA:sub(1,2)=="f:"then return d.data and d.data[aA:sub(3)]end if aA=="crate"then return d.data and d.data.name end
if aA=="title"then return(d.data and d.data.title)or d.title end if aA=="rarity"then return d.data and d.data.rarity end
if aA=="player"then return C end if aA=="plot"then return a.plot end if aA=="stand"or aA=="model"then local hs=a.plot and a.plot:FindFirstChild("CrateStand")
if aA=="stand"or not hs then return hs end for yj,ml in ipairs(hs:GetChildren())do if lN(ml.Name)then return ml end end
return nil end local mm={}for tf,tg in pairs(eT)do mm[tf]=d.resolve(tg)end return mm end function d.classify(ht)
if d.directOff then return end local eU={}for yk,hu in ipairs(d.calls)do if hu.t<=ht+0.05 and ht-hu.t<=6 then eU[#eU+1]=hu end
end if#eU==0 then return end if not ah(function()return(d.heldAt or 0)>=ht-1 end,2.5)then return end local c0={}
for yl,c1 in ipairs(eU)do local mn={}for mo=1,c1 .n do local th,mp=d.slot(c1 .args[mo],c1)if mp then u("crate call has "..mp.." - keeping the button method")
return end mn[mo]=th end c0[#c0+1]={m=c1 .m,n=c1 .n,args=mn}end local hv=d.learned d.learned={seq=c0,mode=hv and hv.mode or nil}
V.dirty=true if not hv then u(("learned how to open crates directly (%d call%s)"):format(#c0,#c0==1 and""or"s"))end
end function d.replay()local mq=d.learned local mr=az:FindFirstChild("Remotes")local hw=mr and mr:FindFirstChild("CrateAction")
if not(mq and hw)then return false end local ms=table.unpack or unpack d.replaying=true for ym,c2 in ipairs(mq.seq)do
local hx={}for mt=1,c2 .n do hx[mt]=d.resolve(c2 .args[mt])end task.spawn(function()pcall(function()if c2 .m=="InvokeServer"then hw:InvokeServer(ms(hx,1,c2 .n))
else hw:FireServer(ms(hx,1,c2 .n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(ti)return(ti:gsub("[%%|;=,\n]",function(tj)return("%%%02X"):format(tj:byte())end))end
function d.enc(bx)local eV=type(bx)if eV=="string"then return"s"..d.esc(bx)end if eV=="number"then return"n"..tostring(bx)end
if eV=="boolean"then return bx and"b1"or"b0"end if eV=="nil"then return"z"end if bx.__slot then return"k"..bx.__slot end
local hy={}for tk,tl in pairs(bx)do hy[#hy+1]=d.enc(tk).."="..d.enc(tl)end return"t"..table.concat(hy,",")end
function d.dec(mu)local c3,c4=mu:sub(1,1),mu:sub(2)local function tm(tn)return(tn:gsub("%%(%x%x)",function(to)return string.char(tonumber(to,16))end))end
if c3=="s"then return tm(c4)end if c3=="n"then return tonumber(c4)end if c3=="b"then return c4=="1"end if c3=="k"then return{__slot=c4}end
if c3=="t"then local mv={}for tp in c4:gmatch("[^,]+")do local mw,tq=tp:match("^(.-)=(.*)$")if mw then local mx=d.dec(mw)
if mx~=nil then mv[mx]=d.dec(tq)end end end return mv end return nil end function d.goneOrNew(tr)return function()
if not d.waiting then return true end local my=P()return my~=nil and my~=tr end end function d.near()local mz=az:FindFirstChild("Remotes")
local mA=mz and mz:FindFirstChild("CrateAction")local hz=aP()local hA=a.plot and a.plot:FindFirstChild("CrateStand")
local hB=hA and hA:FindFirstChild("Spot")if not(mA and hz and hB)then return false,"no crate stand or remote"end
local hC=hz.HumanoidRootPart local eW=hC.CFrame local mB,hD=d.title,"no answer"local ts=P()local mC=hA:FindFirstChild("Holder")
local function mD()if not mC then return d.waiting or d.on end for yn,tt in ipairs(mC:GetChildren())do if tt:IsA("Model")then return true end end
return false end for tu=1,3 do if not(d.waiting or d.on)or not mD()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end if(hC.Position-hB.Position).Magnitude>8 then cN(hB,d.prompt)end ag(0.12+0.15*tu)
local aI={}d.replaying=true task.spawn(function()aI.ok,aI.v=pcall(function()return mA:InvokeServer("open")end)
aI.done=true end)ah(function()return aI.done end,6)d.replaying=false local by=aI.v if aI.done and aI.ok and type(by)=="table"and by.ok then
a.crates,d.fails,d.nearFails=a.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,r()+4 u(("OPENED %s -> %s (no window)"):format(mB,by.prize and aa(Q(tostring(by.prize)))or"?"))
ah(function()local mE=P()return mE~=nil and mE~=ts end,1.5)if(hC.Position-eW.Position).Magnitude>8 then pcall(function()cM(hz,eW.Position,eW.Position+eW.LookVector)end)end
return true,"opened"end hD=(aI.done and aI.ok and type(by)=="table")and tostring(by.reason or"refused, no reason given")
or(aI.done and("error: "..tostring(by))or"no answer in 6s")ag(0.3)if not mD()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 u(("crate: the server would not open %s next to the stand (%s)"):format(mB,hD))
return false,hD end function d.smart()local hE=d.title if(d.nearFails or 0)<3 then local tv=d.near()if tv then return true end
if d.nearFails>=3 then u("opening next to the stand failed 3 times - trying the older ways")end end local bz=d.learned
if bz then local hF=P()if d.on then d.replay()if ah(d.goneOrNew(hF),3.5)then a.crates=a.crates+1 u("OPENED "..hE.." (direct)")
return true end else if bz.mode~="window"then d.replay()if ah(d.goneOrNew(hF),3.5)then a.crates,d.fails=a.crates+1,0
if bz.mode~="direct"then bz.mode,V.dirty="direct",true u("crates now open directly - the window never comes up")
end u("OPENED "..hE.." (direct, no window)")return true end end if hm()then d.replay()if ah(d.goneOrNew(hF),3.5)then
a.crates,d.fails=a.crates+1,0 if bz.mode~="window"then bz.mode,V.dirty="window",true u("crates need their window up first - it shows briefly")
end u("OPENED "..hE.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,V.dirty=bz,nil,true
if d.fails>=3 then d.directOff=true u("direct crate opening failed 3 times - using the button for now")else u("the learned crate call did not work - back to pressing Open")
end end return eQ(true)end function y.snap()return{rules=C:GetAttribute("AutoRollRules"),stop=C:GetAttribute("AutoRollStop"),
on=C:GetAttribute("AutoRollOn"),main=C:GetAttribute("AutoRoll")}end y.cache={}function y.watchCache()y.cache=y.snap()
for tw,mF in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do O(C:GetAttributeChangedSignal(mF):Connect(function()y.cache[tw]=C:GetAttribute(mF)end))
end end function y.isOn()return C:GetAttribute("AutoRollOn")==true end function y.saw(tx,...)local eX=y.cache
local ty={m=tx,n=select("#",...),args={...},before={rules=eX.rules,stop=eX.stop,on=eX.on,main=eX.main}}task.delay(1.5,function()
if a.alive then pcall(y.learnOne,ty)end end)end function y.learnOne(c5)local aj,c6=y.snap(),c5 .before local eY=(aj.rules~=c6 .rules)or(aj.stop~=c6 .stop)
local mG=(aj.on~=c6 .on)or(aj.main~=c6 .main)if not eY and not mG then return end local mH={}for mI=1,c5 .n do
local aw=c5 .args[mI]local bA=type(aw)if bA=="string"and aw~=""and aw==aj.rules then aw={__slot="rules"}elseif bA=="string"and aw~=""and eY and aw==aj.stop and aj.stop~=c6 .stop then aw={__slot="stop"}
elseif bA=="table"then local mJ={}for tz,b5 in pairs(aw)do if type(b5)=="table"or(type(b5)=="userdata")then y.msg="Auto Roll sends something I cannot repeat"return
end mJ[tz]=(type(b5)=="string"and b5~=""and b5==aj.rules)and{__slot="rules"}or b5 end aw=mJ elseif bA~="string"and bA~="number"and bA~="boolean"and bA~="nil"then
if aw==C then aw={__slot="player"}else y.msg="Auto Roll sends something I cannot repeat"return end end mH[mI]=aw
end local b6={m=c5 .m,n=c5 .n,args=mH}if eY then local hG=false for tA=1,b6 .n do local c7=b6 .args[tA]if type(c7)=="table"and c7 .__slot=="rules"then hG=true end
if type(c7)=="table"and not c7 .__slot then for yo,mK in pairs(c7)do if type(mK)=="table"and mK.__slot=="rules"then hG=true end end
end end if hG then y.rec.rules={b6}else table.insert(y.rec.rules,b6)if#y.rec.rules>60 then table.remove(y.rec.rules,1)end
end end if mG then if aj.on==true then y.rec.on=b6 else y.rec.off=b6 end e.AutoRoll=(aj.on==true)end if aj.rules and aj.rules~=""then e.ARrules,e.ARstop=aj.rules,aj.stop or""end
V.dirty=true y.msg=""u(("learned an Auto Roll %s message"):format(eY and"choices"or(aj.on and"on"or"off")))end
function y.resolve(b7)if type(b7)~="table"then return b7 end if b7 .__slot=="rules"then return e.ARrules~=""and e.ARrules or C:GetAttribute("AutoRollRules")end
if b7 .__slot=="stop"then return e.ARstop~=""and e.ARstop or C:GetAttribute("AutoRollStop")end if b7 .__slot=="player"then return C end
local mL={}for tB,tC in pairs(b7)do mL[tB]=y.resolve(tC)end return mL end function y.replay(mM,tD)local mN=table.unpack or unpack
for yp,c8 in ipairs(tD)do local hH={}for mO=1,c8 .n do hH[mO]=y.resolve(c8 .args[mO])end y.replaying=true pcall(function()
if c8 .m=="InvokeServer"then task.spawn(function()pcall(function()mM:InvokeServer(mN(hH,1,c8 .n))end)end)else mM:FireServer(mN(hH,1,c8 .n))end
end)y.replaying=false task.wait(0.25)end end function y.apply(mP,tE)if y.busy or not a.alive then return end y.busy=true
pcall(function()local mQ=az:FindFirstChild("Remotes")local hI=mQ and mQ:FindFirstChild("AutoRollAction")if not hI then y.msg="this game has no AutoRollAction"return end
local bc=e.AutoRoll if bc and e.ARrules~=""and C:GetAttribute("AutoRollRules")~=e.ARrules then if#y.rec.rules==0 then
y.msg="pick your Auto Roll choices once in the game's menu so I can learn them"u(y.msg)else y.replay(hI,y.rec.rules)
if ah(function()return C:GetAttribute("AutoRollRules")==e.ARrules end,4)then u("Auto Roll choices put back")else
y.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"u(y.msg)end end end if bc==y.isOn()or(not bc and not tE)then return end
local eZ=bc and y.rec.on or y.rec.off if not eZ then local c9=bc and y.rec.off or y.rec.on local mR=c9~=nil for tF=1,c9 and c9 .n or 0 do
if type(c9 .args[tF])=="boolean"then mR=false end end if mR then eZ=c9 end end if not eZ then y.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bc and"on"or"off")
u(y.msg)return end y.replay(hI,{eZ})if ah(function()return y.isOn()==bc end,4)then y.msg=""u(("Auto Roll switched %s%s"):format(bc and"ON"or"OFF",mP and(" ("..mP..")")or""))
else y.msg="Auto Roll did not switch - do it once in the game so I can relearn it"u(y.msg)end end)y.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local tG,tH=pcall(function()return C.UserId end)return tG and tH or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local tI,hJ=pcall(function()return require(az:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if tI and type(hJ)=="table"and type(hJ.Pets)=="table"then j.I=hJ end return j.I end function j.order()if j.list then return j.list end
local bd=j.info()if not bd then return{}end local bB={}if type(bd.Order)=="table"and#bd.Order>0 then for yq,mS in ipairs(bd.Order)do if bd.Pets[mS]then bB[#bB+1]=mS end end
else for tJ in pairs(bd.Pets)do bB[#bB+1]=tJ end table.sort(bB,function(tK,tL)return(bd.Pets[tK].price or 0)<(bd.Pets[tL].price or 0)end)
end j.list=bB return bB end function j.nice(mT,hK)local mU=j.info()local mV=mU and mU.Pets[mT]return((hK and hK~="")and(hK.." ")or"")..(mV and mV.displayName or tostring(mT))
end function j.data()local e0=C:GetAttribute("PetsData")if type(e0)~="string"then return nil end if e0==j.rawD then return j.lastD end
local tM,c_=pcall(function()return j.HS:JSONDecode(e0)end)c_=(tM and type(c_)=="table")and c_ or nil j.rawD,j.lastD=e0,c_
return c_ end function j.pen()return az:FindFirstChild("PetMeadowSpawns")end function j.srv()return aG:GetServerTimeNow()end
function j.money()local hL=C:FindFirstChild("MoneyValue")if hL and type(hL.Value)=="number"then return hL.Value end
return aO()or 0 end function j.wishes()local mW=j.pen()local mX=mW and mW:GetAttribute("Wishes")local hM,mY={},j.srv()
if type(mX)~="string"then return hM end local tN,mZ=pcall(function()return j.HS:JSONDecode(mX)end)if tN and type(mZ)=="table"then
for tO,hN in pairs(mZ)do if type(hN)=="number"and hN>mY then hM[tO]=hN-mY end end end return hM end function j.call(...)
local m0=az:FindFirstChild("Remotes")local m1=m0 and m0:FindFirstChild("PetRequest")if not m1 then return nil end
local m2=table.pack(...)local bC={}task.spawn(function()bC.ok,bC.v=pcall(function()return m1:InvokeServer(table.unpack(m2,1,m2 .n))end)
bC.done=true end)local tP=r()while not bC.done and r()-tP<6 do task.wait(0.05)end if bC.done and bC.ok then return bC.v end
return nil end function j.want(tQ)return e.Pets[tQ]end function j.closeNaming(hO)local m4=pcall(function()local m3=C:FindFirstChild("PlayerScripts")
local tR=m3 and m3:FindFirstChild("Naming",true)require(tR).close()end)ag(0.5)if hO.Visible then pcall(function()local m5=hO:FindFirstChild("NameBox",true)if m5 then m5:ReleaseFocus()end end)
hO.Visible=false m4=false end return m4 end function j.skipNaming()j.namingUntil=r()+10 if j.namingOn then return end
j.namingOn=true task.spawn(function()while a.alive and r()<j.namingUntil do local m6=C:FindFirstChildOfClass("PlayerGui")
local m7=m6 and m6:FindFirstChild("MainGui")local e1=m7 and m7:FindFirstChild("PetNameGui")if e1 and e1 .Visible then
ag(0.4)if e1 .Visible then j.namingShut=(j.namingShut or 0)+1 pcall(j.closeNaming,e1)break end end ag(0.25)end
j.namingOn=false end)end function j.buyTick()if not e.PetBuy then j.buyMsg="auto adopt is off"return end local hP,m8,e2=j.info(),j.pen(),j.data()
if not(hP and m8 and e2)then j.buyMsg="pet data not loaded yet"return end j.tryAt=j.tryAt or{}local da,hQ=#(e2 .pets or{}),tonumber(e2 .maxOwned)or 60
local tS,m9,db=j.srv(),{},nil for yr,aB in ipairs(m8:GetChildren())do m9[aB.Name]=true local bD,e3=aB:GetAttribute("Pet"),aB:GetAttribute("Variant")or""
local hR=bD and j.want(bD)if hR and hR.b and hP.Pets[bD]and(not hR.g or e3=="Big")and x.wantMore(bD,e3,e2)and not aB:GetAttribute("A_"..j.uid)
and(tonumber(aB:GetAttribute("ExpiresAt"))or 0)>tS+1 and r()>=(j.tryAt[aB.Name]or 0)then local dc,m_=j.nice(bD,e3),hP.Pets[bD].price or 0
if da>=hQ then db=("%s is in the pen, but you have %d/%d pets"):format(dc,da,hQ)j.tryAt[aB.Name]=r()+15 elseif j.money()<m_ then
db=("%s is in the pen - need $%s"):format(dc,au(m_))j.tryAt[aB.Name]=r()+5 else j.tryAt[aB.Name]=r()+8 local be=j.call("adopt",aB.Name)
if type(be)=="table"and be.ok then da=da+1 j.buys=(j.buys or 0)+1 j.recent=j.recent or{}local tT=type(be.pet)=="table"and be.pet or{}
table.insert(j.recent,{id=tostring(tT.id or("?"..r())),name=bD,variant=e3,at=r()})if#j.recent>30 then table.remove(j.recent,1)end
u("ADOPTED "..dc)j.skipNaming()db="adopted "..dc else local na=type(be)=="table"and tostring(be.reason or"no reason given")or"no answer"
u(("adopt %s failed: %s"):format(dc,na))db="adopt failed: "..na if type(be)=="table"and be.bagFull then j.tryAt[aB.Name]=r()+60 end
end end end end for nb in pairs(j.tryAt)do if not m9[nb]then j.tryAt[nb]=nil end end j.buyMsg=db or("watching the pen (%d/%d pets)"):format(da,hQ)
end function j.wishTick()if not e.PetWish then j.wishMsg="auto wish is off"return end local e4=j.info()if not(e4 and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local e5,hS,bf=j.wishes(),0,nil local tU=(type(e4 .Wish)=="table"and e4 .Wish.cashShare)or 2
local tV=j.data()for ys,am in ipairs(j.order())do local nc=j.want(am)if nc and nc.w and x.wantMore(am,"",tV)then
hS=hS+1 if not e5[am]and r()>=(j.wishTry[am]or 0)then local hT=tonumber(C:GetAttribute("PetWishCredits"))or 0
local hU=math.floor((e4 .Pets[am].price or 0)*tU)if hT<=0 and j.money()<hU then j.wishTry[am]=r()+10 bf=("need $%s to wish for %s"):format(au(hU),j.nice(am))
j.wishWhy[am]=bf else j.wishTry[am]=r()+3 local tW=hT>0 and"wishCredit"or"wish"local e6=j.call(tW,am)if type(e6)=="table"and e6 .ok then
j.wishN,j.wishWhy[am]=j.wishN+1,nil u(("WISHED for %s (%s)"):format(j.nice(am),hT>0 and"free wish"or("$"..au(hU))))
else local hV=type(e6)=="table"and tostring(e6 .reason or"no reason given")or"no answer"if hV:lower():find("already",1,true)then j.wishTry[am]=r()+2
else u(("wish %s failed: %s"):format(j.nice(am),hV))bf="wish failed: "..hV end end end end end end if not bf then
for yt,e7 in ipairs(j.order())do local nd=j.want(e7)if nd and nd.w and not e5[e7]and j.wishWhy[e7]then bf=j.wishWhy[e7]break end
end end if not bf then local e8={}for yu,e9 in ipairs(j.order())do local ne=j.want(e9)if ne and ne.w and e5[e9]then e8[#e8+1]=("%s %dm"):format(j.nice(e9),math.ceil(e5[e9]/60))end
end bf=hS==0 and"no pet has WISH ticked"or("running: "..(#e8>0 and table.concat(e8,", ")or"none yet"))end j.wishMsg=bf
end o.switches,o.glazed,o.finished=0,0,0 o.done,o.doneN,o.later={},0,{}function o.teams()local hW=j.data()return(hW and hW.teams)or{},hW
end function o.current(b8)b8=b8 or j.data()if not b8 then return""end local nf={}for yv,tX in ipairs(b8 .equipped or{})do nf[tostring(tX)]=true end
for yw,ng in ipairs(b8 .teams or{})do local nh=ng.pets or{}local hX=#nh==#(b8 .equipped or{})if hX then for yx,tY in ipairs(nh)do if not nf[tostring(tY)]then hX=false break end end end
if hX then return ng.name end end return""end function o.equip(hY)local tZ,t0=o.teams()local hZ for t1,t2 in ipairs(tZ)do if t2 .name==hY then hZ=t1 break end end
if not hZ then o.msg="no saved team called "..tostring(hY)return false end if o.current(t0)==hY then return true end
for yy=1,4 do local ni=j.call("teamEquip",hZ)if type(ni)=="table"and ni.ok then o.switches=o.switches+1 return true
end task.wait(0.4)end return false end function o.left(t3)local nj=t3:FindFirstChild("SquishyPlaceHolder")local nk=nj and nj:FindFirstChild("TimerGui")
local nl=nk and nk:FindFirstChildWhichIsA("TextLabel",true)local h0=nl and nl.Text if type(h0)~="string"or h0:find("-",1,true)then return nil end
local h1,nm,nn=h0:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not h1 then return nil end local no=nn~=""and(tonumber(h1)*3600+tonumber(nm)*60+tonumber(nn))or(tonumber(h1)*60+tonumber(nm))
return no>0 and no or nil end function o.waxes()local dd={}local np=a.plot and a.plot:FindFirstChild("WaxStations")
if not np then return dd end local nq=j.srv()for yz,aJ in ipairs(np:GetChildren())do local h2=tonumber(aJ:GetAttribute("PourEnd"))
local nr=aJ:GetAttribute("PourOwner")if aJ:GetAttribute("HasSquishy")and aJ:GetAttribute("PourId")and(nr==nil or nr==j.uid)then
local h3=o.left(aJ)local ns=h3 and(nq+h3)or((h2 and h2>nq)and h2 or nil)if ns then local nt,nu=aJ:FindFirstChild("SquishyPlaceHolder"),"?"
if nt then for yA,nv in ipairs(nt:GetChildren())do if nv:IsA("Model")then nu=nv.Name break end end end local t4=tostring(aJ:GetAttribute("Helpers")or"")
local h4=0 for yB in t4:gmatch("%d+")do h4=h4+1 end dd[#dd+1]={st=aJ,ends=ns,sure=h3~=nil,id=aJ:GetAttribute("PourId"),name=nu,helps=h4,
long=aJ:GetAttribute("PourLong")==true}end end end table.sort(dd,function(t5,t6)return t5 .ends<t6 .ends end)
return dd end function o.glazeCount()local nw=az:FindFirstChild("Remotes")local nx=nw and nw:FindFirstChild("EditStack")
if not nx then return nil end local t7,de=pcall(function()return nx:InvokeServer("State",nil)end)if not(t7 and type(de)=="table"and type(de.state)=="table")then return nil end
local h5,h6=0,{}for yC,e_ in ipairs(de.state.entries or{})do if e_.glaze and e_.glaze~=""then h5=h5+1 h6[e_.glaze]=(h6[e_.glaze]or 0)+1 end
end return h5,h6,#(de.state.entries or{}),de.state.capacity end function o.finishedOne(fa,ny)o.finished=o.finished+1
task.wait(2)local h7,t8,nz,t9=o.glazeCount()if h7 and ny and h7>ny then o.glazed=o.glazed+1 local h8={}for t_,ua in pairs(t8)do h8[#h8+1]=t_.." "..ua end
u(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(aa(Q(fa.name)),fa.st.Name,h7,table.concat(h8,", ")))
else u(("wax done on station %s: %s, no glaze%s"):format(fa.st.Name,aa(Q(fa.name)),nz and(" (stack "..nz.."/"..tostring(t9)..")")or""))
end end function o.tick()o.list=o.waxes()if o.editing and r()-(o.editingSince or r())>120 then o.editing=false end
if o.editing then o.msg="rebuilding teams..."return end if not e.Teams then o.want,o.msg="","auto teams is off"return end
local b9=j.srv()local ap=o.glazeFor if ap then local df=ap.st local nA=df.Parent and df:GetAttribute("HasSquishy")and df:GetAttribute("PourId")==ap.id
local nB=nA and o.left(df)if nB then ap.ends=b9+nB end if not nA then o.glazeFor,o.afterUntil=nil,r()+1.5 if not o.done[ap.id or"?"]then
o.done[ap.id or"?"],o.doneN=true,o.doneN+1 if o.doneN>400 then o.done,o.doneN={[ap.id or"?"]=true},1 end local ub=ap.before
task.spawn(function()pcall(o.finishedOne,ap,ub)end)end elseif ap.ends-b9>e.GlazeLead*3+60 or b9>ap.ends+90 then
o.glazeFor,o.afterUntil=nil,r()+1.5 o.later[ap.id or"?"]=r()+120 u(("station %s is not finishing yet (%s left) - glaze team off again"):format(df.Name,o.clock(ap.ends-b9)))
end end if e.TeamGlaze~=""and not o.glazeFor then local uc=o.speedRatio(e.TeamGlaze)for yD,bE in ipairs(o.list)do
if bE.sure and(bE.ends-b9)*uc[bE.long and 2 or 1]<=e.GlazeLead and r()>=(o.later[bE.id or"?"]or 0)and not o.done[bE.id or"?"]then
o.glazeFor=bE task.spawn(function()bE.before=o.glazeCount()end)break end end end local ax,fb="",""if e.TeamGlaze~=""and(o.glazeFor or r()<(o.afterUntil or 0))then
ax,fb=e.TeamGlaze,o.glazeFor and(" - station "..o.glazeFor.st.Name.." finishes soon")or""elseif e.TeamWax~=""and(o.placing or o.aboutToPlace())then
ax,fb=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and o.allBusy()then ax,fb=e.TeamFull," - every station is busy"
else ax=e.TeamNormal end o.want=ax local dg=o.current()o.cur=dg if ax~=""and dg~=ax and r()>=(o.nextTry or 0)then
o.nextTry=r()+1.1 if o.equip(ax)then u("team: "..ax..fb)else o.nextTry=r()+3 end end local h9=o.list[1]o.msg=("on: %s%s | next wax done %s"):format(dg~=""and dg or"(not a saved team)",(ax~=""and ax~=dg)and(" -> "..ax)or"",
h9 and("in "..o.clock(h9 .ends-b9).." (st "..h9 .st.Name..")")or"- none running")end function o.clock(bh)bh=math.max(0,math.floor(bh))
if bh>=3600 then return("%d:%02d:%02d"):format(math.floor(bh/3600),math.floor((bh%3600)/60),bh%60)end return("%d:%02d"):format(math.floor(bh/60),bh%60)
end function o.allBusy()local ud,ue=d4()return ue>0 and ud==0 end function o.aboutToPlace()if not a.running then return false end
local nC=P()if not(nC and aN(nC))then return false end local uf=d4()return uf>0 end function o.mult(nD,ug,nE)return{(1+nD)*(1+nE),(1+nD+ug)*(1+nE)}end
function o.speedNow()local function h_(uh)return tonumber(C:GetAttribute(uh))or 0 end return o.mult(h_("PetWaxSpeed"),h_("PetLongWax"),h_("PetSocialWax"))
end function o.speedOf(ui)local uj,nF=o.teams()if not nF then return nil end for yE,nG in ipairs(uj)do if nG.name==ui then
local ia={}for yF,uk in ipairs(nG.pets or{})do for yG,nH in ipairs(nF.pets or{})do if tostring(nH.id)==tostring(uk)then ia[#ia+1]=nH break end end
end local nI=x.caps()local nJ,ul=x.stats(ia)return o.mult(math.min(nJ.waxSpeed or 0,nI.waxSpeed or 0.25),math.min(nJ.longWax or 0,nI.longWax or 0.3),ul.socialWax or 0)
end end return nil end function o.speedRatio(um)local nK,ib=o.speedNow(),o.speedOf(um)if not ib then return{1,1}end
return{nK[1]/ib[1],nK[2]/ib[2]}end function o.glazeSoon()return e.Teams and e.TeamGlaze~=""and(o.glazeFor~=nil or r()<(o.afterUntil or 0))
end x.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
x.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}x.buildMsg,x.fuseMsg,x.fused,x.builds="","",0,0
function x.need()return C:GetAttribute("FusePass")==true and 3 or 7 end function x.caps()local ic=j.info()return(ic and type(ic.Caps)=="table")and ic.Caps or x.CAPS
end function x.value(nL,ie)local fc=j.info()local b_=fc and fc.Pets[nL]if not(b_ and type(b_.boost)=="table")then return nil end
local bF if type(fc.boostValue)=="function"then local un,uo=pcall(fc.boostValue,nL,(ie~=""and ie)or nil)bF=un and tonumber(uo)or nil
end if not bF then bF=b_.boost.value or 0 if ie=="Big"then local nM=bF*1.5 bF=x.ROUND[b_.boost.kind]and math.max(bF+1,math.floor(nM+0.5))or nM
end end return b_.boost.kind,bF,b_.boost.every end function x.stats(up)local bG,ig={},{}for yH,nN in ipairs(up)do
local aC,fd,nO=x.value(nN.name,nN.variant or"")if aC then if aC:sub(1,6)=="social"then ig[aC]=math.max(ig[aC]or 0,fd)
elseif aC=="waxStir"or aC=="cashGift"then bG[aC]=(bG[aC]or 0)+fd*60/(nO or 60)elseif aC=="luckyPull"then bG.luckyPull=(bG.luckyPull or 0)+fd/(nO or 10)
else bG[aC]=(bG[aC]or 0)+fd end end end return bG,ig end function x.glazeGain(uq,fe)local dh,ih,yI={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local ur=dh[1]+dh[2]+dh[3]local us=tonumber(C:GetAttribute("GuildUpGlaze"))or 0 local ca={}for ff=1,3 do ca[ff]=dh[ff]+uq*dh[ff]/ur+(ff==1 and us or 0)end
local ii={ca[1]*(1-fe),ca[2]*(1-fe)+ca[1]*fe,ca[3]+ca[2]*fe}return ii[1]*(ih[1]-1)+ii[2]*(ih[2]-1)+ii[3]*(ih[3]-1)
end function x.score(fg,ut)local ij=x.caps()local fh,fi=x.stats(ut)local function bi(nP)return math.min(fh[nP]or 0,ij[nP]or math.huge)end
local uu=(1+bi("income"))*(1+(fi.socialIncome or 0))*(1+math.min(fh.cashGift or 0,ij.cashGiftPerMinute or 9)/60)
local uv=1+bi("luck")+(fh.luckyPull or 0)+(fi.socialLuck or 0)local nQ=uv*(1+bi("newFind"))local di=math.log(uu)
local uw=math.max(tonumber(C:GetAttribute("WaxStations"))or 18,1)local ik=(1+bi("waxSpeed")+bi("longWax"))*(1+(fi.socialWax or 0))
+math.min(fh.waxStir or 0,ij.waxStirPerMinute or 30)/60/uw local ux=1-(1-bi("headStart"))*(1-(fi.socialHeadStart or 0))
if fg=="farm"then return di+0.7*math.log(nQ)+0.1*math.log(ik)end if fg=="full"then return di+0.4*math.log(ik)+0.02*math.log(nQ)end
if fg=="glaze"then return x.glazeGain(bi("glaze"),bi("glazeUp"))+0.001*di end if fg=="wax"then return-math.log(1-0.5*ux)+0.001*di+0.001*math.log(ik)end
return di end function x.best(nR,cb,uy,il)il=il or{}local ak,dj={},{}local function nS(uz)local nT={}for uA,uB in ipairs(uz)do nT[uA]=cb[uB]end return nT end
local function im(nU)local io=x.score(nR,nS(nU))for yJ,uC in ipairs(nU)do if il[cb[uC].id]then io=io+1e-7 end end
return io end for yK=1,math.min(uy,#cb)do local fj,ip for iq=1,#cb do if not dj[iq]then ak[#ak+1]=iq local nV=im(ak)
ak[#ak]=nil if not ip or nV>ip+1e-12 then fj,ip=iq,nV end end end if not fj then break end dj[fj]=true ak[#ak+1]=fj
end for yL=1,6 do task.wait()local nW,nX=false,im(ak)for ir=1,#ak do for is=1,#cb do if not dj[is]then local nY=ak[ir]
ak[ir]=is local nZ=im(ak)if nZ>nX+1e-9 then dj[nY],dj[is],nX,nW=nil,true,nZ,true else ak[ir]=nY end end end end
if not nW then break end end local n0={}for uD,uE in ipairs(ak)do n0[uD]=tostring(cb[uE].id)end return n0,x.score(nR,nS(ak))
end function x.count(n1,n2,uF)local dk,dl={},0 local n3,n4={},{}for yM,uG in ipairs(n2 .arriving or{})do n3[tostring(uG)]=true end
for yN,cc in ipairs(n2 .pets or{})do n4[tostring(cc.id)]=true if cc.name==n1 and not n3[tostring(cc.id)]then if cc.variant=="Big"then dl=dl+1 elseif(cc.variant or"")==""then dk[#dk+1]=cc end
end end if not uF then for yO,dm in ipairs(j.recent or{})do if dm.name==n1 and not n4[dm.id]and r()-dm.at<20 then
if dm.variant=="Big"then dl=dl+1 else dk[#dk+1]=dm end end end end return dk,dl end function x.goal(uH)local n5=e.Pets[uH]return n5 and tonumber(n5 .f)or 0 end
function x.wantMore(n6,uI,n7)local it=x.goal(n6)if it<=0 or not n7 then return true end local uJ,n8=x.count(n6,n7)
if n8>=it then return false end if uI=="Big"then return true end return#uJ<x.need()*(it-n8)end function x.status(n9,n_)
local fk=x.goal(n9)if fk<=0 or not n_ then return nil end local uK,iu=x.count(n9,n_)if iu>=fk then return("Big %d/%d done"):format(iu,fk)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#uK,x.need()),x.need(),iu,fk)end function x.wear(iv)local iw={}
for yP,uL in ipairs(iv)do iw[tostring(uL)]=true end for yQ=1,3 do local cd=j.data()if not cd then return false end
for yR,oa in ipairs(cd.equipped or{})do if not iw[tostring(oa)]then j.call("unequip",oa)task.wait(0.3)end end
cd=j.data()local ob={}for yS,uM in ipairs(cd.equipped or{})do ob[tostring(uM)]=true end for yT,oc in ipairs(iv)do
if not ob[tostring(oc)]then j.call("equip",oc)task.wait(0.3)end end task.wait(0.4)cd=j.data()local ix,od=0,true
for yU,uN in ipairs(cd.equipped or{})do ix=ix+1 if not iw[tostring(uN)]then od=false end end if od and ix==#iv then return true end
end return false end function x.saveTeam(oe,of)if not x.wear(of)then return false,"could not put the pets on"end
local uO=o.teams()local bH for uP,uQ in ipairs(uO)do if uQ.name==oe then bH=uP break end end local ce if bH then
ce=j.call("teamSave",bH)else ce=j.call("teamNew")if type(ce)=="table"and ce.ok and ce.index then bH=ce.index task.wait(0.3)
j.call("teamRename",{index=bH,name=oe})end end task.wait(0.4)local iy=j.data()local og=iy and iy.teams and bH and iy.teams[bH]
if not og then return false,"the game did not save it"end local oh={}for yV,uR in ipairs(og.pets or{})do oh[tostring(uR)]=true end
for yW,uS in ipairs(of)do if not oh[tostring(uS)]then return false,"saved, but not with these pets"end end return true
end x.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function x.quiet()
if o.placing or o.glazeSoon()then return false end local uT=j.srv()for yX,uU in ipairs(o.list or{})do if uU.ends-uT<(e.GlazeLead or 45)+90 then return false end end
return true end function x.plan()local dn=j.data()if not dn then return{}end local oi={}for yY,uV in ipairs(dn.arriving or{})do oi[tostring(uV)]=true end
local dp={}for yZ,fl in ipairs(dn.pets or{})do if not oi[tostring(fl.id)]then dp[#dp+1]={id=tostring(fl.id),name=fl.name,variant=fl.variant or""}end
end local oj={}for y0,ol in ipairs(dp)do oj[ol.id]=ol end local om=tonumber(dn.slots)or 3 local iz,oo={},{}for y1,fm in ipairs(x.ROLES)do
local dq=e[fm[1]]if dq~=""and not oo[dq]then oo[dq]=true local iA,dr,op={},{},false for y2,oq in ipairs(dn.teams or{})do
if oq.name==dq then for y3,uW in ipairs(oq.pets or{})do local iB=oj[tostring(uW)]if iB then iA[iB.id]=true dr[#dr+1]=iB else op=true end
end end end local iC,ot=x.best(fm[2],dp,om,iA)local ou=x.score(fm[2],dr)local ov=#iC==#dr for y4,uX in ipairs(iC)do if not iA[uX]then ov=false end end
if not ov and(op or#dr<math.min(om,#dp)or ot>ou+1e-4)then iz[#iz+1]={team=dq,role=fm[2],ids=iC,gain=ot-ou}end
end end return iz end function x.rebuild(uY)local ow=x.plan()if#ow==0 then x.buildMsg="teams are already the best your pets allow"return true end
if not x.quiet()then x.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end o.editing,o.editingSince=true,r()
local fn=true local u2,u3=pcall(function()for y5,ds in ipairs(ow)do local uZ,u0=x.saveTeam(ds.team,ds.ids)local ox=j.data()
local iD={}for y6,u1 in ipairs(ds.ids)do for y7,iE in ipairs(ox and ox.pets or{})do if tostring(iE.id)==u1 then iD[#iD+1]=j.nice(iE.name,iE.variant)end
end end if uZ then u(("TEAM %s rebuilt (%s): %s"):format(ds.team,uY or"pets changed",table.concat(iD,", ")))else fn=false u(("TEAM %s: %s"):format(ds.team,tostring(u0)))end
end end)o.editing,o.nextTry=false,0 if not u2 then fn=false u("TEAM BUILD ERR "..tostring(u3))end x.builds=x.builds+1
x.buildMsg=fn and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fn end
function x.fuseTick()if not e.AutoFuse or o.editing then return end local fo=j.data()if not fo then return end
local iF=x.need()local iG,fp={},{}for y8,u4 in ipairs(fo.teams or{})do for y9,u5 in ipairs(u4 .pets or{})do iG[tostring(u5)]=true end end
for y_,u6 in ipairs(fo.equipped or{})do fp[tostring(u6)]=true end x.failUntil=x.failUntil or{}for bI,u7 in pairs(e.Pets)do
local oy=tonumber(u7 .f)or 0 local iH,u8=x.count(bI,fo,true)if oy>0 and u8<oy and#iH>=iF and r()>=(x.failUntil[bI]or 0)then
table.sort(iH,function(fq,fr)local oz=(fp[tostring(fq.id)]and 4 or 0)+(iG[tostring(fq.id)]and 2 or 0)+(fq.named and 1 or 0)
local oA=(fp[tostring(fr.id)]and 4 or 0)+(iG[tostring(fr.id)]and 2 or 0)+(fr.named and 1 or 0)if oz~=oA then return oz<oA end
return tostring(fq.id)<tostring(fr.id)end)local fs,iI={},{}for ft=1,iF do fs[ft]=tostring(iH[ft].id)if fp[fs[ft]]then iI[#iI+1]=fs[ft]end
end o.editing,o.editingSince=true,r()for za,u9 in ipairs(iI)do j.call("unequip",u9)task.wait(0.3)end local fu=j.call("fuse",{ids=fs})
o.editing,o.nextTry=false,0 if type(fu)=="table"and fu.ok then x.fused=x.fused+1 x.dirtyAt=r()u(("FUSED %d %s -> Big %s"):format(iF,j.nice(bI),j.nice(bI)))
x.fuseMsg=("fused a Big %s %s"):format(j.nice(bI),os.date("%H:%M"))else x.failUntil[bI]=r()+120 u(("fuse %s failed: %s"):format(j.nice(bI),type(fu)=="table"and tostring(fu.reason or"no reason given")or"no answer"))
end return end end end function x.tick()pcall(x.fuseTick)if not e.AutoBuild or not e.Teams then return end local oB=j.data()
if not oB then return end local bJ={}for zb,u_ in ipairs(oB.pets or{})do bJ[#bJ+1]=tostring(u_.id)end table.sort(bJ)
bJ=table.concat(bJ,",")if bJ~=x.sig then x.sig,x.dirtyAt=bJ,r()end local va=(x.dirtyAt and r()-x.dirtyAt>8)or r()-(x.lastBuild or 0)>900
if va and not o.editing then local vb=x.rebuild(x.dirtyAt and"pets changed"or"check")if vb then x.dirtyAt,x.lastBuild=nil,r()end
end end q.bb,q.fx,q.post,q.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}q.watch=setmetatable({},{__mode="k"})
q.mem,q.memPeak,q.fps=0,0,0 function q.isFx(bK)return bK:IsA("ParticleEmitter")or bK:IsA("Trail")or bK:IsA("Beam")or bK:IsA("Fire")or bK:IsA("Smoke")
or bK:IsA("Sparkles")or bK:IsA("Light")end function q.muteOne(aq)if not e.Lite or not aq.Parent then return end
local fv=(aq:IsA("BillboardGui")and q.bb)or(q.isFx(aq)and q.fx)or nil if not fv or fv[aq]~=nil then return end
fv[aq]=aq.Enabled if aq.Enabled then aq.Enabled=false end q.watch[aq]=aq:GetPropertyChangedSignal("Enabled"):Connect(function()
if e.Lite and aq.Enabled then fv[aq]=true aq.Enabled=false end end)end function q.lite(oC)e.Lite=oC if oC then
task.spawn(function()for vc,vd in ipairs(aG:GetDescendants())do if not e.Lite then return end pcall(q.muteOne,vd)
if vc%600==0 then task.wait()end end end)if not q.addConn then q.queue={}q.addConn=O(aG.DescendantAdded:Connect(function(iJ)
if e.Lite and(iJ:IsA("BillboardGui")or q.isFx(iJ))then q.queue[#q.queue+1]=iJ end end))end local iK=game:GetService("Lighting")
for zc,dt in ipairs(iK:GetChildren())do if dt:IsA("PostEffect")and dt.Enabled and q.post[dt]==nil then q.post[dt]=true dt.Enabled=false end
end pcall(function()q.oldShadows=q.oldShadows==nil and iK.GlobalShadows or q.oldShadows iK.GlobalShadows=false end)
pcall(function()q.oldDeco=q.oldDeco==nil and aG.Terrain.Decoration or q.oldDeco aG.Terrain.Decoration=false end)
else for zd,ve in pairs(q.watch)do pcall(function()ve:Disconnect()end)end for oD,vf in pairs(q.bb)do pcall(function()if oD.Parent then oD.Enabled=vf end end)end
for oE,vg in pairs(q.fx)do pcall(function()if oE.Parent then oE.Enabled=vg end end)end for oF in pairs(q.post)do pcall(function()if oF.Parent then oF.Enabled=true end end)end
q.bb,q.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})q.watch,q.post,q.queue=setmetatable({},{__mode="k"}),{},{}
local vh=game:GetService("Lighting")if q.oldShadows~=nil then pcall(function()vh.GlobalShadows=q.oldShadows end)q.oldShadows=nil end
if q.oldDeco~=nil then pcall(function()aG.Terrain.Decoration=q.oldDeco end)q.oldDeco=nil end end end q.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function q.hideHud(oG)e.HideHud=oG local iL=C:FindFirstChildOfClass("PlayerGui")if not iL then return end if oG then
for ze,du in ipairs(iL:GetChildren())do if du:IsA("ScreenGui")and not q.MINE[du.Name]and du.Enabled then q.hud[du]=true du.Enabled=false end
end if not q.hudConn then q.hudConn=O(iL.ChildAdded:Connect(function(dv)if e.HideHud and dv:IsA("ScreenGui")and not q.MINE[dv.Name]then
task.defer(function()if e.HideHud and dv.Enabled then q.hud[dv]=true dv.Enabled=false end end)end end))end else
for oH in pairs(q.hud)do pcall(function()if oH.Parent then oH.Enabled=true end end)end q.hud={}end end q.CAPS={0,30,15,10}
function q.cap(iM)e.FpsCap=iM local oI=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not oI then return false end return pcall(oI,iM==0 and 60 or iM)end function q.render(oJ)e.NoRender=oJ pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not oJ)end)
end function q.restoreAll()pcall(q.lite,false)pcall(q.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(q.cap,0)end end function q.rejoinSame(oK)if a.rejoining then return end u("REJOIN this server ("..oK..")")
pcall(d7)if a.autoload then pcall(ev,a.autoload)end gW()local vi=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,C)
end)task.delay(25,function()if a.alive then cJ(oK..", same server failed")end end)return vi end function q.tick()
local iN=q.queue if e.Lite and iN and#iN>0 then q.queue={}for vj,vk in ipairs(iN)do pcall(q.muteOne,vk)if vj%300==0 then task.wait()end end
end local oL=e.Lite and a.plot and a.plot:FindFirstChild("WaxStations")if oL then for zf,vl in ipairs(oL:GetChildren())do
local oM=vl:FindFirstChild("SquishyPlaceHolder")local bL=oM and oM:FindFirstChild("TimerGui")if bL and bL:IsA("BillboardGui")then
if q.bb[bL]==nil then pcall(q.muteOne,bL)elseif bL.Enabled then q.bb[bL]=true bL.Enabled=false end end end end
local vm,dw=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if vm and type(dw)=="number"then
q.mem=dw q.memPeak=math.max(q.memPeak,dw)if(e.MemLimit or 0)>0 and dw>e.MemLimit then q.over=(q.over or 0)+1 if q.over>=30 and not a.busy then
q.over=-600 q.rejoinSame(("memory %d MB > %d MB"):format(dw,e.MemLimit))end elseif(q.over or 0)>0 then q.over=0
end end if r()-(q.noteAt or 0)>1800 then q.noteAt=r()u(("health: %d fps, %d MB (peak %d)"):format(math.floor(q.fps+0.5),q.mem,q.memPeak))
end end a.sellWords={"sell","trash","discard","dispose","bin"}local function iO(fw)if type(fw)~="string"then return false end
fw=fw:lower()for zg,vn in ipairs(a.sellWords)do if fw:find(vn,1,true)then return true end end return false end
local function vo()local oN=az:FindFirstChild("Remotes")local iP=oN and oN:FindFirstChild("SellSquishy")if not(iP and iP:IsA("RemoteEvent"))then return false end
if not pcall(function()iP:FireServer()end)then return false end return ah(function()return P()==nil end,1.5)end
local function vp()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end if r()-a.sellSearchAt<20 then return nil end
a.sellSearchAt=r()local oO=aP()local oP=oO and oO.HumanoidRootPart.Position local dx,oQ for zh,cf in ipairs((a.plot or aG):GetDescendants())do
if cf:IsA("ProximityPrompt")and(iO(cf.ActionText)or iO(cf.ObjectText)or iO(cf.Name))then local oR=kc(cf)local iQ=(oR and oP)and(oR-oP).Magnitude or 1e9
if iQ<=400 and(not dx or iQ<oQ)then dx,oQ=cf,iQ end end end a.sellSpot=dx a.noSellSpot=(dx==nil)return dx end
local function oS()local iR=P()if not iR then a.holding=false return false end if aN(iR)then return false end
local iS=aa(Q(iR))if vo()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=r()+2.5,0
u("SOLD "..iS)return true end local cg=vp()if cg then local oT=cw(cg)if oT then cN(oT,cg)local oU=P()if oU and not aN(oU)then
local vq,vr=eH(cg,function()return P()==nil end,function()return cg.Enabled end)if vq then a.sold,a.holding,a.sellFails=a.sold+1,false,0
u(("SOLD %s at %s via %s"):format(iS,d2(cg),vr))return true end end end end a.sellFails=a.sellFails+1 u("could not sell "..iS.." ("..a.sellFails..")")
return false end local vs={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function vt(ci)local fy=d2(ci):lower()for zi,vu in ipairs(vs)do if fy:find(vu,1,true)then return 0 end end
local aK,ab=ci.Name:lower(),0 local function aD(vv,vw)return vv:find(vw,1,true)~=nil end if aD(aK,"collect")then ab=ab+60 end
if aD(aK,"cash")or aD(aK,"money")then ab=ab+45 end if aD(aK,"income")or aD(aK,"claim")then ab=ab+35 end if aD(aK,"coin")or aD(aK,"earn")or aD(aK,"green")then ab=ab+20 end
if aK=="pad"or aK=="touch"then ab=ab+25 end if ab==0 and(aD(fy,"collect")or aD(fy,"cash")or aD(fy,"money"))then ab=25 end
if ab==0 then return 0 end local dy=ci.Color if dy.G>0.5 and dy.G>dy.R*1.4 and dy.G>dy.B*1.4 then ab=ab+15 end
if math.min(ci.Size.X,ci.Size.Y,ci.Size.Z)<2 then ab=ab+5 end return ab end local function vx()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or r()-a.padSearchAt<20 then return nil end a.padSearchAt=r()local fz,dz,iT={},nil,29 for zj,fA in ipairs(a.plot:GetDescendants())do
if fA:IsA("BasePart")then local fB=vt(fA)if fB>0 then fz[#fz+1]={s=fB,p=fA}if fB>iT then dz,iT=fA,fB end end end
end table.sort(fz,function(vy,vz)return vy.s>vz.s end)a.padCands,a.padPart=fz,dz if dz then u("collect pad: "..d2(dz).." (score "..iT..")")end
return dz end local iU="SAB_pad_v1.txt"local function vA(vB)if type(writefile)=="function"then pcall(writefile,iU,table.concat({vB:GetComponents()},","))end
end local function vC()if type(isfile)~="function"or type(readfile)~="function"then return nil end local vD,oV=pcall(function()if isfile(iU)then return readfile(iU)end end)
if not vD or type(oV)~="string"then return nil end local fC={}for vE in oV:gmatch("[^,]+")do fC[#fC+1]=tonumber(vE)end
if#fC==12 then return CFrame.new(unpack(fC))end end local function vF(iV,fD,vG)local vH=g5(iV)local iW=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aE=(iW and iW:IsA("BasePart"))and(iW.Position-fD)or Vector3 .new(1,0,0)aE=Vector3 .new(aE.X,0,aE.Z)if aE.Magnitude<0.05 then aE=Vector3 .new(1,0,0)end
aE=aE.Unit for vI=0,7 do local fE=vI*math.pi/4 local vJ=Vector3 .new(aE.X*math.cos(fE)-aE.Z*math.sin(fE),0,aE.X*math.sin(fE)+aE.Z*math.cos(fE))
local fF=fD+vJ*(vG+5)local iX=lt(fF.X,fD.Y,fF.Z)if iX and math.abs(iX.Y-fD.Y)<8 then cM(iV,Vector3 .new(fF.X,iX.Y+vH,fF.Z))
if g6(iV,0.7)then return true end end end return false end local function vK()a.lastCollect=r()local dA=aP()if not dA then return end
local oW,vL=dA.HumanoidRootPart,g5(dA)local dB,oX,dC,iY=nil,4,nil,"?"local iZ=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if a.manualPad and iZ and iZ:IsA("BasePart")then dB,iY=(iZ.CFrame*a.manualPad).Position,"manual pad"else local aX=vx()
if aX then dB=Vector3 .new(aX.Position.X,aX.Position.Y+aX.Size.Y/2+vL,aX.Position.Z)oX,dC,iY=math.max(aX.Size.X,aX.Size.Z)/2,aX,aX.Name
end end if not dB then u("COLLECT: pad not found - stand on it and tap SET PAD")return end local i0=aO()cM(dA,dB)
if dC and type(firetouchinterest)=="function"then pcall(firetouchinterest,oW,dC,0)end ag(e.PadDwell)if dC and type(firetouchinterest)=="function"then pcall(firetouchinterest,oW,dC,1)end
ag(0.5)a.collected=a.collected+1 local i1=aO()u(("COLLECTED (%s) %s"):format(iY,(i0 and i1 and i1>i0)and("+$"..au(i1-i0))or"no cash change seen"))
vF(dA,dB,oX)end local dD local function oY()if a.capHit then if e.AutoStart and r()-(a.capAt or 0)>300 then a.capHit,a.placeFails=false,0
u("trying again after being stopped for 5 minutes")dD(true,true)else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end
if not aP()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=a3(),nil,nil
if not a.plot then return nil,"own plot not found yet","wait"end end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local i2,oZ=d4()local fG=P()if fG then local cj=aa(Q(fG))if not aN(fG)then local i3=(J.gift and Q(J.gift)==Q(fG)and r()-J.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cj,i3),"bad"end if a.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cj,i3),"bad"end return"sell",("selling %s (%s)"):format(cj,i3),"warn"
end if i2<1 then return nil,("holding %s - 0 free stations"):format(cj),"wait"end if o.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cj),"wait"end
return"place",("waxing %s (%d free)"):format(cj,i2),"ok"end a.holding=false if e.Crates and not d.waiting and r()-(d.scanAt or 0)>1 and r()>(d.quietUntil or 0)then
d.scanAt=r()local i4=a.plot:FindFirstChild("CrateStand")if i4 then for zk,dE in ipairs(i4:GetDescendants())do
if dE:IsA("ProximityPrompt")and dE.Enabled and hk(dE)then local aY=dE.ObjectText if aY==""then aY=bV(i4,"TitleLabel")or""end
if aY~=""and E.wanted(aY)then local vM=d0(aY):gsub("crate$","")local o0 for o1 in pairs(M.members)do if d0(o1)==vM then o0=o1 end end
d.waiting,d.at,d.title,d.prompt=true,r(),aY,dE d.data={name=(aY:gsub("%s","")),rarity=o0,title=aY}u(aY.." found waiting on your stand")
end break end end end end local o2=E.wanted(d.data and d.data.name)or E.wanted(d.title)if e.Crates and(d.on or d.waiting)and o2 then
local aZ=d.title if r()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aZ),"bad"
end if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=r()+120,0 u("could not press the "..aZ.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aZ),"bad"end if r()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aZ),"bad"
end if d.byYou and r()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aZ,math.ceil(60-(r()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aZ),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(aZ),"bad"end if r()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aZ),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aZ,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not o2 then local o3=d.title..tostring(d.rolledAt)if d.told~=o3 then d.told=o3 u(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and r()-d.rolledAt<6 and E.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if i2<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(oZ,oZ),"wait"
end local i5=kp()if not i5 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dF=cK()
if dF and lN(dF.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dF.name),"idle"end
if r()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dF.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(dF.name),"ok"
end local bj=g3()if bj.state~="match"then a.matchSince=nil if bj.state=="skip"and not i5 .Enabled then return nil,bj.text.." (sold out)","idle"end
return nil,bj.text,bj.level end if not i5 .Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local dG=r()if dG<a.noCashUntil then local o4,vN=ll()if o4 then return nil,("cash short: have $%s, price ~$%s"):format(au(o4),au(vN)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(au(aO()),math.ceil(a.noCashUntil-dG)),"bad"end if dG-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
a.matchSince=a.matchSince or dG local o5=dG-a.matchSince if o5<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bj.shown,o5),"ok"end
return"buy",("buying %s via %s"):format(bj.shown,bj.src),"ok"end local function ay(vO,vP,...)if a.busy then return end
a.busy,a.busyText=true,vO local vQ,o6=pcall(vP,...)a.busy,a.busyText=false,""if not vQ and o6~=gd then u("ERR "..tostring(o6))end
end local function vR()local bM,vS,vT=oY()a.reason,a.level=vS,vT if bM=="place"then ay("waxing...",o.place)elseif bM=="crate"then ay("opening crate...",eQ,true)
elseif bM=="cratesmart"then ay("opening crate...",d.smart)elseif bM=="cratewin"then ay("opening the crate window...",hm)
elseif bM=="nocrate"then ay("discarding crate...",eQ,false)elseif bM=="sell"then ay("selling...",oS)elseif bM=="buy"then ay("buying...",lE,false)
elseif e.Collect and not a.matchSince and r()-a.lastCollect>=e.Every then ay("collecting money...",vK)end end
function dD(fH,vU)if fH==a.running then return end a.running=fH if not vU then e.AutoStart=fH end if fH then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=r()a.plot=a3()or a.plot
u("START")else a.reason="stopped"u("STOP")end end do local bk=eq(W.auto)if type(bk)=="string"then bk=bk:gsub("%s+$","")
if bk~=""then a.autoload=bk local vV=k_(bk)u(vV and("loaded config "..bk)or("config "..bk.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local vW={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}local o7={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function F(vX,vY,vZ)local v0,i6=pcall(Instance.new,vX)
if not v0 then a.uiErrs=a.uiErrs+1 return nil end for v1,v2 in pairs(vY)do if not pcall(function()i6[v1]=v2 end)then a.uiErrs=a.uiErrs+1 end
end i6 .Parent=vZ return i6 end local function ad(v3,v4)F("UICorner",{CornerRadius=UDim.new(0,v4 or 6)},v3)end
local c={}local i7=C:FindFirstChildOfClass("PlayerGui")or C:WaitForChild("PlayerGui")local o8=i7:FindFirstChild("SABFarmGui")
if o8 then o8:Destroy()end local i8=F("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},i7)
local ac={w=320,h=330,head=30,strip=38,tabs=26}c.root=F("Frame",{Name="Root",Size=UDim2 .new(0,ac.w,0,ac.h),Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),
BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},i8)ad(c.root,10)F("UIStroke",{Color=l.line,Thickness=1},c.root)
local a0=UDim2 .new(1,0,1,0)local function A(o9,o_)return UDim2 .new(o9,0,0,0),UDim2 .new(o_,(o9+o_>0.99)and 0 or-4,1,0)end
local function z(v5,v6,v7,v8,v9,v_)local pa=F("TextButton",{Text=v6,Position=v9,Size=v_,BackgroundColor3=v7,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=v8,TextColor3=l.text,AutoButtonColor=true},v5)ad(pa,6)return pa end local function fI(wa,wb,wc,wd,we)
local i9=F("TextBox",{Text=wb,PlaceholderText=wc,Position=wd,Size=we,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=l.text,PlaceholderColor3=l.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},wa)ad(i9,6)F("UIPadding",{PaddingLeft=UDim.new(0,8)},i9)
return i9 end local fJ=aG.CurrentCamera local function wf()local wg,fK=pcall(function()return fJ and fJ.ViewportSize end)
if wg and fK and fK.X>50 and fK.Y>50 then return fK end end local function bl(dH)local i_=wf()if not(i_ and dH and dH.Parent)then return end
local wh=pcall(function()local fL,pb=dH.AbsolutePosition,dH.AbsoluteSize local ja=70 local pc=math.clamp(fL.X,ja-pb.X,i_.X-ja)
local pd=math.clamp(fL.Y,0,i_.Y-math.min(pb.Y,ja))if math.abs(pc-fL.X)>0.5 or math.abs(pd-fL.Y)>0.5 then dH.Position=UDim2 .new(0,math.floor(pc),0,math.floor(pd))
end end)return wh end local function fM(wi)local wj,jb=pcall(function()return wi.AbsolutePosition end)if wj and jb then return{math.floor(jb.X),math.floor(jb.Y)}end
end local ck={}a.dragMoved={}local function pe(dI,pf,jc)O(dI.InputBegan:Connect(function(cl)if cl.UserInputType~=Enum.UserInputType.MouseButton1 and cl.UserInputType~=Enum.UserInputType.Touch then return end
local jd={start=cl.Position,from=pf.Position,moved=0,target=pf,input=cl,onDrop=jc}ck[dI],a.dragMoved[dI]=jd,0
local je je=cl.Changed:Connect(function()if cl.UserInputState==Enum.UserInputState.End and ck[dI]==jd then ck[dI]=nil
if je then je:Disconnect()end if jc then jc(jd.moved)end end end)end))end O(jZ.InputChanged:Connect(function(fN)
if fN.UserInputType~=Enum.UserInputType.MouseMovement and fN.UserInputType~=Enum.UserInputType.Touch then return end
for wk,aL in pairs(ck)do local jf=aL.target if jf and jf.Parent then local pg,ph=fN.Position.X-aL.start.X,fN.Position.Y-aL.start.Y
aL.moved=math.max(aL.moved,math.abs(pg)+math.abs(ph))a.dragMoved[wk]=aL.moved jf.Position=UDim2 .new(aL.from.X.Scale,aL.from.X.Offset+pg,aL.from.Y.Scale,aL.from.Y.Offset+ph)
end end end))O(jZ.InputEnded:Connect(function(fO)if fO.UserInputType~=Enum.UserInputType.MouseButton1 and fO.UserInputType~=Enum.UserInputType.Touch then return end
for wl,fP in pairs(ck)do if fP.input==fO or fO.UserInputType==Enum.UserInputType.MouseButton1 then ck[wl]=nil
if fP.onDrop then fP.onDrop(fP.moved)end end end end))local function H(wm,wn,wo,wp,wq,wr,ws)return F("TextLabel",{Text=wn,Position=wr or UDim2 .new(0,0,0,0),Size=ws or a0,BackgroundTransparency=1,
Font=wq and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=wo,TextColor3=wp,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},wm)
end c.title=F("Frame",{Size=UDim2 .new(1,0,0,ac.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},c.root)
c.dot=F("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},c.title)
ad(c.dot,5)H(c.title,"SAB  BUTTER FARM  "..bQ,12,l.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))c.minB=z(c.title,"-",l.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
c.xB=z(c.title,"X",l.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))c.strip=F("Frame",{Position=UDim2 .new(0,0,0,ac.head),Size=UDim2 .new(1,0,0,ac.strip),BackgroundColor3=l.bg,BorderSizePixel=0},c.root)
c.bar=F("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=l.warn,BorderSizePixel=0},c.strip)
ad(c.bar,2)c.reason=H(c.strip,"starting",12,l.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))c.tabs=F("Frame",{Position=UDim2 .new(0,0,0,ac.head+ac.strip),Size=UDim2 .new(1,0,0,ac.tabs),BackgroundTransparency=1},c.root)
c.tabFarm=z(c.tabs,"FARM",l.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))c.tabBut=z(c.tabs,"BUTTERS",l.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabCrt=z(c.tabs,"CRATES",l.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabPet=z(c.tabs,"PETS",l.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabTeam=z(c.tabs,"TEAMS",l.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabSet=z(c.tabs,"SETUP",l.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function cm()local jg=F("ScrollingFrame",{Position=UDim2 .new(0,0,0,ac.head+ac.strip+ac.tabs),Size=UDim2 .new(1,0,1,-(ac.head+ac.strip+ac.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.line,CanvasSize=UDim2 .new(0,0,0,100)},c.root)
F("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},jg)F("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},jg)
return jg end c.farm,c.but,c.set,c.crt=cm(),cm(),cm(),cm()c.pet,c.team=cm(),cm()c.but.Visible,c.set.Visible,c.crt.Visible,c.pet.Visible,c.team.Visible=false,false,false,false,false
local fQ,dJ,D=0,12,nil local function ar(pj,wt)fQ,dJ=fQ+1,dJ+pj+6 return F("Frame",{Size=UDim2 .new(1,0,0,pj),BackgroundTransparency=1,LayoutOrder=fQ},wt or c.farm)
end local function dK(wu)H(ar(14),wu,10,l.dim,true)end D=ar(34)c.startB=z(D,"START",l.good,14,A(0,0.68))c.killB=z(D,"KILL",l.bad,14,A(0.68,0.32))
local wv=ar(42)local function dL(pk,ww,jh)local ji=F("Frame",{Position=UDim2 .new((pk-1)/jh,0,0,0),Size=UDim2 .new(1/jh,pk<jh and-4 or 0,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},wv)ad(ji,6)local pl=H(ji,"0",15,l.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local wx=H(ji,ww,9,l.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))pl.TextXAlignment,wx.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return pl end c.sBought,c.sPlaced,c.sSold,c.sColl,c.sFree=dL(1,"BOUGHT",5),dL(2,"WAXED",5),dL(3,"SOLD",5),dL(4,"MONEY",5),dL(5,"FREE",5)
c.info=H(ar(40),"",10,l.dim,false)c.tgt=H(ar(26),"",10,l.good,false)dK("MONEY COLLECT")D=ar(28)c.secB=fI(D,tostring(e.Every),"60",A(0,0.2))
H(D,"sec",11,l.dim,false,A(0.21,0.09))c.secSet=z(D,"SET",l.accent,12,A(0.3,0.2))c.colT=z(D,"COLLECT: ON",l.accent,11,A(0.5,0.5))
D=ar(26)c.padB=z(D,"SET PAD (stand on it)",l.panel2,10,A(0,0.55))c.padL=H(D,"",10,l.dim,false,A(0.56,0.44))dK("BUTTERS YOU DID NOT TICK, AND CRATES")
D=ar(28)c.sellT=z(D,"SELL THEM: ON",l.accent,11,A(0,0.55))c.sellB=z(D,"SELL NOW",l.warn,11,A(0.55,0.45))D=ar(28)
c.crateT=z(D,"OPEN CRATES: ON",l.accent,11,A(0,0.55))c.crateB=z(D,"OPEN NOW",l.warn,11,A(0.55,0.45))dK("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
D=ar(28)c.arT=z(D,"AUTO ROLL: OFF",l.panel2,11,A(0,0.5))c.arL=H(D,"",9,l.dim,false,A(0.52,0.48))dK("TOOLS")D=ar(30)
c.buyB=z(D,"BUY",l.warn,10,A(0,0.5))c.plB=z(D,"WAX",l.good,10,A(0.5,0.5))dK("LOG")c.log=F("TextLabel",{Size=a0,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},ar(84))ad(c.log,6)F("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},c.log)
c.farm.CanvasSize=UDim2 .new(0,0,0,dJ)fQ,dJ=0,12 local function ae(wy)return ar(wy,c.set)end local function dM(wz)H(ae(14),wz,10,l.dim,true)end
dM("SETTINGS FILE  (saved on your phone)")D=ae(28)c.cfgName=fI(D,"default","config name",A(0,0.5))c.cfgSave=z(D,"SAVE",l.good,11,A(0.5,0.25))
c.cfgLoad=z(D,"LOAD",l.accent,11,A(0.75,0.25))D=ae(26)c.cfgPrev=z(D,"<",l.panel2,11,A(0,0.13))c.cfgPick=z(D,"(none saved)",l.panel2,10,A(0.13,0.74))
c.cfgNext=z(D,">",l.panel2,11,A(0.87,0.13))D=ae(26)c.cfgAuto=z(D,"LOAD IT ON LAUNCH: OFF",l.panel2,10,A(0,1))
c.cfgMsg=H(ae(26),"",10,l.dim,false)dM("START BY ITSELF")D=ae(26)c.autoB=z(D,"INSTALL F.exec",l.accent,10,A(0,1))
c.autoMsg=H(ae(30),"",10,l.dim,false)D=ae(28)c.startT=z(D,"START FARMING ON LOAD: ON",l.accent,10,A(0,1))H(ae(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,l.dim,false)
dM("IF THE GAME DROPS ME")D=ae(28)c.rejT=z(D,"AUTO REJOIN: ON",l.accent,11,A(0,0.55))c.rejB=z(D,"REJOIN NOW",l.warn,11,A(0.55,0.45))
c.rejMsg=H(ae(30),"",10,l.dim,false)dM("SMOOTHER RUNNING  (for long / overnight runs)")D=ae(28)c.pfLite=z(D,"LITE MODE: OFF",l.panel2,10,A(0,0.5))
c.pfHud=z(D,"HIDE GAME HUD: OFF",l.panel2,10,A(0.5,0.5))D=ae(28)c.pfFps=z(D,"FPS CAP: GAME",l.panel2,10,A(0,0.5))
c.pfRender=z(D,"STOP 3D: OFF",l.panel2,10,A(0.5,0.5))D=ae(28)c.pfMem=fI(D,tostring(e.MemLimit),"2000",A(0,0.24))
H(D,"MB: rejoin this server above it (0 = never)",9,l.dim,false,A(0.26,0.52))c.pfMemSet=z(D,"SET",l.accent,11,A(0.8,0.2))
c.pfInfo=H(ae(18),"",10,l.text,false)H(ae(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,l.dim,false)
dM("THE ROUND SAB BUTTON")H(ae(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,l.dim,false)
c.set.CanvasSize=UDim2 .new(0,0,0,dJ)local pm=F("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},i7)
c.tgRoot=F("Frame",{Size=UDim2 .new(0,40,0,40),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},pm)ad(c.tgRoot,20)F("UIStroke",{Color=l.line,Thickness=1},c.tgRoot)
c.tgBtn=F("TextButton",{Text="SAB",Size=a0,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=l.text,AutoButtonColor=false},c.tgRoot)
c.tgDot=F("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=l.dim,BorderSizePixel=0},c.tgRoot)
ad(c.tgDot,4)local a1={built=false,boxes={},at=0}local function pn(po,jj)e.Targets[po]=jj or nil local jk=a1 .boxes[po]
if jk then jk.Text=jj and"X"or""jk.BackgroundColor3=jj and l.good or l.panel2 end end local function jl()for wA,pp in pairs(a1 .boxes)do
local pq=e.Targets[wA]==true pp.Text=pq and"X"or""pp.BackgroundColor3=pq and l.good or l.panel2 end end local dN
local function wB()local wC=0 local jm=F("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},c.but)
c.butInfo=H(jm,"",10,l.dim,false,A(0,0.5))local wD=z(jm,"CLEAR",l.panel2,10,A(0.5,0.24))local wE=z(jm,"REFRESH",l.panel2,10,A(0.74,0.26))
wD.MouseButton1Click:Connect(function()for wF in pairs(e.Targets)do e.Targets[wF]=nil end jl()end)wE.MouseButton1Click:Connect(function()
M.at=0 gO()dN(true)end)return wC end dN=function(wG)if not gO()then if not c.butEmpty then c.butEmpty=H(F("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},c.but),
"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)end return end if a1 .built and not wG and a1 .at==M.at then return end
for zl,jn in ipairs(c.but:GetChildren())do if jn:IsA("Frame")or jn:IsA("TextButton")then jn:Destroy()end end a1 .boxes,c.butEmpty={},nil
wB()local jo,jp=36,1 local function pr(ps)jp=jp+1 local wH=F("Frame",{Size=UDim2 .new(1,0,0,ps),BackgroundTransparency=1,LayoutOrder=jp},c.but)
jo=jo+ps+6 return wH end for zm,fR in ipairs(M.rarOrder)do local wI=pr(24)local wJ=o7[fR]or l.text local jq=F("Frame",{Size=a0,BackgroundColor3=l.panel,BorderSizePixel=0},wI)
ad(jq,6)H(jq,"  "..fR:upper(),11,wJ,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local wK=z(jq,"ALL",l.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local wL=fR wK.MouseButton1Click:Connect(function()local pt=M.members[wL]or{}local pu=false for zn,wM in ipairs(pt)do if not e.Targets[wM]then pu=true break end end
for zo,wN in ipairs(pt)do pn(wN,pu)end end)for zp,jr in ipairs(M.members[fR]or{})do local wO=pr(22)local fS=F("TextButton",{Text="",Size=a0,BackgroundColor3=l.bg,BorderSizePixel=0,
AutoButtonColor=true},wO)ad(fS,5)H(fS,"   "..aa(jr),11,l.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local js=F("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},fS)ad(js,4)a1 .boxes[jr]=js local pv=jr local function pw()pn(pv,not e.Targets[pv])end
fS.MouseButton1Click:Connect(pw)js.MouseButton1Click:Connect(pw)end end jl()c.but.CanvasSize=UDim2 .new(0,0,0,jo+10)
a1 .built,a1 .at=true,M.at end function E.paint()for wP,px in pairs(E.boxes)do local py=e.CrateTicks[wP]==true
px.Text=py and"X"or""px.BackgroundColor3=py and l.good or l.panel2 end if c.crtInfo then local jt,ju=0,0 for zq in pairs(E.boxes)do jt=jt+1 end
for zr,wQ in pairs(e.CrateTicks)do if wQ then ju=ju+1 end end c.crtInfo.Text=("%d crates, %d ticked"):format(jt,ju)
end if c.crtAll then c.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"c.crtAll.BackgroundColor3=e.Crates and l.accent or l.panel2
end end function E.build()for zs,jv in ipairs(c.crt:GetChildren())do if jv:IsA("Frame")or jv:IsA("TextButton")then jv:Destroy()end
end E.boxes={}local jw,jx=12,0 local function fT(pz)jx=jx+1 jw=jw+pz+6 return F("Frame",{Size=UDim2 .new(1,0,0,pz),BackgroundTransparency=1,LayoutOrder=jx},c.crt)
end local jy=fT(28)c.crtInfo=H(jy,"",10,l.dim,false,A(0,0.5))local wR=z(jy,"CLEAR",l.panel2,10,A(0.5,0.24))local wS=z(jy,"REFRESH",l.panel2,10,A(0.74,0.26))
O(wR.MouseButton1Click:Connect(function()e.CrateTicks={}E.paint()end))O(wS.MouseButton1Click:Connect(function()E.build()end))
c.crtAll=z(fT(28),"",l.accent,11,A(0,1))O(c.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates E.paint()end))
H(fT(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,l.dim,false)
for zt,a2 in ipairs(E.list())do local wT=fT(24)local dO=F("TextButton",{Text="",Size=a0,BackgroundColor3=l.panel,BorderSizePixel=0,AutoButtonColor=true},wT)
ad(dO,5)H(dO,"  "..(a2 .title or a2 .name)..(a2 .guess and"  (?)"or""),11,o7[a2 .rar or""]or l.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
H(dO,a2 .price and("$"..au(a2 .price))or(a2 .rar or""),9,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local jz=F("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},dO)ad(jz,4)E.boxes[a2 .k]=jz local pA=a2 .k local function pB()e.CrateTicks[pA]=(not e.CrateTicks[pA])or nil
E.paint()end O(dO.MouseButton1Click:Connect(pB))O(jz.MouseButton1Click:Connect(pB))end c.crt.CanvasSize=UDim2 .new(0,0,0,jw+10)
E.built=E.at E.paint()end local pC="farm"local function bm(af)pC=af c.farm.Visible,c.but.Visible,c.set.Visible=(af=="farm"),(af=="but"),(af=="set")
c.crt.Visible=(af=="crt")c.pet.Visible,c.team.Visible=(af=="pet"),(af=="team")c.tabCrt.BackgroundColor3=(af=="crt")and l.accent or l.panel2
c.tabPet.BackgroundColor3=(af=="pet")and l.accent or l.panel2 c.tabTeam.BackgroundColor3=(af=="team")and l.accent or l.panel2
if af=="pet"and not j.built then pcall(j.build)end if af=="team"and not o.built then pcall(o.build)end if af=="crt"and(E.built~=E.at or not next(E.boxes))then E.build()end
c.tabFarm.BackgroundColor3=(af=="farm")and l.accent or l.panel2 c.tabBut.BackgroundColor3=(af=="but")and l.accent or l.panel2
c.tabSet.BackgroundColor3=(af=="set")and l.accent or l.panel2 if af=="but"then dN(false)end end local function N(pD,pE,wU,wV)
pD.Text=pE and wU or wV pD.BackgroundColor3=pE and l.accent or l.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(pF)
local bN=j.rows and j.rows[pF]if not bN then return end local dP=e.Pets[pF]or{}bN.b.BackgroundColor3=dP.b and l.good or l.panel2
bN.g.BackgroundColor3=dP.g and l.accent or l.panel2 bN.g.Text=dP.g and"BIG"or"ANY"bN.w.BackgroundColor3=dP.w and l.warn or l.panel2
local jA=tonumber(dP.f)or 0 bN.f.Text=jA>0 and(jA.." BIG")or"FUSE"bN.f.BackgroundColor3=jA>0 and l.good or l.panel2
end function j.flag(jB,fU)local aM=e.Pets[jB]or{}if fU=="f"then local pG=((tonumber(aM.f)or 0)+1)%4 aM.f=pG>0 and pG or nil
elseif aM[fU]then aM[fU]=nil else aM[fU]=true end e.Pets[jB]=(aM.b or aM.g or aM.w or aM.f)and aM or nil j.paintRow(jB)
end function j.paintAll()for wW in pairs(j.rows or{})do j.paintRow(wW)end if c.pbT then N(c.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(c.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(c.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function j.live()if not j.built then j.build()return end if r()-(j.liveAt or 0)<1 then return end j.liveAt=r()
local pH=j.wishes()local dQ=j.data()for fV,fW in pairs(j.rows)do fW.name.Text=j.nice(fV)..(pH[fV]and("   * wish %dm"):format(math.ceil(pH[fV]/60))or"")
local pI=x.status(fV,dQ)fW.desc.Text=pI and(pI.." | "..fW.boostText)or fW.boostText end local pJ=tonumber(C:GetAttribute("PetWishCredits"))or 0
c.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dQ and#(dQ.pets or{})or 0,dQ and tonumber(dQ.maxOwned)or 60,
au(j.money()),pJ>0 and(" | free wishes "..pJ)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local fX=j.info()for zu,jC in ipairs(c.pet:GetChildren())do if jC:IsA("Frame")or jC:IsA("TextLabel")then jC:Destroy()end
end j.rows={}local jD,fY=0,12 local function cn(pK)jD,fY=jD+1,fY+pK+6 return F("Frame",{Size=UDim2 .new(1,0,0,pK),BackgroundTransparency=1,LayoutOrder=jD},c.pet)
end local jE=cn(28)c.pbT=z(jE,"AUTO ADOPT: OFF",l.panel2,9,A(0,0.34))c.pwT=z(jE,"AUTO WISH: OFF",l.panel2,9,A(0.34,0.33))
c.pfT=z(jE,"AUTO FUSE: OFF",l.panel2,9,A(0.67,0.33))c.pbT.MouseButton1Click:Connect(function()e.PetBuy=not e.PetBuy j.paintAll()end)
c.pwT.MouseButton1Click:Connect(function()e.PetWish=not e.PetWish j.paintAll()end)c.pfT.MouseButton1Click:Connect(function()e.AutoFuse=not e.AutoFuse j.paintAll()end)
c.pInfo=H(cn(44),"",10,l.dim,false)H(cn(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,l.dim,false)
if not fX then H(cn(30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)c.pet.CanvasSize=UDim2 .new(0,0,0,fY)
j.built=false return end local co={}for zv,pL in ipairs(j.order())do local jF=fX.Pets[pL].rarity or"?"co[jF]=co[jF]or{}
table.insert(co[jF],pL)end local cp={}for zw,pM in ipairs(fX.Rarities or{})do if co[pM]then cp[#cp+1]=pM end end
for pN in pairs(co)do if not table.find(cp,pN)then cp[#cp+1]=pN end end for zx,fZ in ipairs(cp)do local pO=F("Frame",{Size=a0,BackgroundColor3=l.panel,BorderSizePixel=0},cn(22))
ad(pO,6)H(pO,"  "..fZ:upper(),11,j.RC[fZ]or l.text,true)for zy,f0 in ipairs(co[fZ])do local bO=F("Frame",{Size=a0,BackgroundColor3=l.bg,BorderSizePixel=0},cn(38))
ad(bO,5)local wX=H(bO,j.nice(f0),11,j.RC[fZ]or l.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local wY,wZ=pcall(function()return fX.describe(f0)end)
local pP=wY and tostring(wZ)or""local w0=H(bO,pP,9,l.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local pQ=z(bO,"BUY",l.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local pR=z(bO,"ANY",l.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local pS=z(bO,"WISH",l.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local pT=z(bO,"FUSE",l.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local f1=f0 pQ.MouseButton1Click:Connect(function()j.flag(f1,"b")end)
pR.MouseButton1Click:Connect(function()j.flag(f1,"g")end)pS.MouseButton1Click:Connect(function()j.flag(f1,"w")end)
pT.MouseButton1Click:Connect(function()j.flag(f1,"f")end)j.rows[f0]={b=pQ,g=pR,w=pS,f=pT,name=wX,desc=w0,boostText=pP}
end end c.pet.CanvasSize=UDim2 .new(0,0,0,fY+10)j.built=true j.paintAll()end function q.paint()N(c.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(c.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")N(c.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
N(c.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")if not c.pfMem:IsFocused()then c.pfMem.Text=tostring(e.MemLimit)end
end function q.applyAll()if e.Lite then q.lite(true)end if e.HideHud then q.hideHud(true)end if e.NoRender then q.render(true)end
if(e.FpsCap or 0)~=0 then q.cap(e.FpsCap)end q.paint()end O(c.pfLite.MouseButton1Click:Connect(function()q.lite(not e.Lite)q.paint()end))
O(c.pfHud.MouseButton1Click:Connect(function()q.hideHud(not e.HideHud)q.paint()end))O(c.pfRender.MouseButton1Click:Connect(function()q.render(not e.NoRender)q.paint()end))
O(c.pfFps.MouseButton1Click:Connect(function()local w1=table.find(q.CAPS,e.FpsCap or 0)or 1 local pU=q.CAPS[(w1%#q.CAPS)+1]
if not q.cap(pU)and pU~=0 then u("this executor cannot cap fps")end q.paint()end))O(c.pfMemSet.MouseButton1Click:Connect(function()
local jG=tonumber(c.pfMem.Text)if jG and jG>=0 then e.MemLimit=math.floor(jG)end q.paint()end))function o.names()
local jH={"(none)"}for zz,w2 in ipairs((o.teams()))do jH[#jH+1]=w2 .name end return jH end function o.cycle(jI,w3)
local f2=o.names()local w4=e[jI]~=""and e[jI]or"(none)"local f3=table.find(f2,w4)or 1 f3=((f3-1+w3)%#f2)+1 e[jI]=f2[f3]=="(none)"and""or f2[f3]
o.paint()end function o.paint()if not o.built then return end N(c.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
N(c.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local jJ={}for zA,w5 in ipairs((o.teams()))do jJ[w5 .name]=true end
for w6,pV in pairs(o.pick)do local cq=e[w6]pV.Text=cq==""and"(none)"or(jJ[cq]and cq or(cq.." (missing)"))pV.TextColor3=(cq~=""and not jJ[cq])and l.bad or l.text
end if not c.tmLead:IsFocused()then c.tmLead.Text=tostring(e.GlazeLead)end c.tmInfo.Text=(o.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(o.switches,o.finished,o.glazed,x.fused)
..(x.buildMsg~=""and("\n"..x.buildMsg)or"")local w7,f4=j.srv(),{}for zB,f5 in ipairs(o.list or{})do f4[#f4+1]=("st %-2s %-22s %9s  helps %d"):format(f5 .st.Name,aa(Q(f5 .name)):sub(1,22),o.clock(f5 .ends-w7),f5 .helps)
end c.tmList.Text=#f4>0 and table.concat(f4,"\n")or"no waxes running"end function o.build()for zC,jK in ipairs(c.team:GetChildren())do
if jK:IsA("Frame")or jK:IsA("TextLabel")then jK:Destroy()end end o.pick={}local jL,jM=0,12 local function bn(pW)
jL,jM=jL+1,jM+pW+6 return F("Frame",{Size=UDim2 .new(1,0,0,pW),BackgroundTransparency=1,LayoutOrder=jL},c.team)
end local function dR(w8)H(bn(14),w8,10,l.dim,true)end local function f6(f7)local jN=bn(26)local w9=z(jN,"<",l.panel2,11,A(0,0.14))
local pX=z(jN,"(none)",l.panel,10,A(0.14,0.72))local w_=z(jN,">",l.panel2,11,A(0.86,0.14))w9 .MouseButton1Click:Connect(function()o.cycle(f7,-1)end)
w_.MouseButton1Click:Connect(function()o.cycle(f7,1)end)pX.MouseButton1Click:Connect(function()o.cycle(f7,1)end)
o.pick[f7]=pX end c.tmT=z(bn(28),"AUTO TEAMS: OFF",l.panel2,11,A(0,1))c.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=o.current()end o.paint()end)c.tmInfo=H(bn(42),"",10,l.dim,false)
local pY=bn(26)c.tmBuild=z(pY,"AUTO BUILD TEAMS: OFF",l.panel2,9,A(0,0.62))c.tmBuildNow=z(pY,"BUILD NOW",l.warn,9,A(0.62,0.38))
c.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild o.paint()end)c.tmBuildNow.MouseButton1Click:Connect(function()
if o.editing then return end x.buildMsg="building..."task.spawn(function()local xa,xb=pcall(x.rebuild,"you asked")if not xa then u("BUILD ERR "..tostring(xb))end end)
end)dR("NORMAL TEAM  (worn the rest of the time)")f6("TeamNormal")dR("FULL TEAM  (every station busy: money + wax speed)")
f6("TeamFull")dR("GLAZE TEAM  (worn just before a wax finishes)")f6("TeamGlaze")local jO=bn(26)c.tmLead=fI(jO,tostring(e.GlazeLead),"45",A(0,0.2))
H(jO,"sec before it finishes",10,l.dim,false,A(0.22,0.5))local xc=z(jO,"SET",l.accent,11,A(0.75,0.25))xc.MouseButton1Click:Connect(function()
local f8=tonumber(c.tmLead.Text)if f8 and f8>=5 and f8<=600 then e.GlazeLead=math.floor(f8)else c.tmLead.Text=tostring(e.GlazeLead)end
o.paint()end)dR("WAX TEAM  (worn while a butter is placed: head starts)")f6("TeamWax")dR("YOUR WAXES  (time left, helps)")
c.tmList=F("TextLabel",{Size=a0,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bn(150))ad(c.tmList,6)F("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},c.tmList)
H(bn(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,l.dim,false)
c.team.CanvasSize=UDim2 .new(0,0,0,jM+10)o.built=true o.paint()end local function xd()c.secB.Text=tostring(e.Every)
N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then dD(e.AutoStart,true)end if a.winPos then c.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then c.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end bl(c.root)bl(c.tgRoot)a.lastCollect=r()
jl()E.paint()pcall(j.paintAll)pcall(o.paint)pcall(q.applyAll)end local function xe(pZ)task.spawn(function()pZ.TextColor3=l.bad
task.wait(0.8)if a.alive then pZ.TextColor3=l.text end end)end local function p0()local p1=c.secB.Text:match("^%s*(%d+)%s*$")
local dS=p1 and tonumber(p1)if not dS or dS<1 then c.secB.Text=tostring(e.Every)xe(c.secB)u("interval must be a whole number >= 1")
return end if dS==e.Every then return end e.Every,a.lastCollect=dS,r()u("collect every "..dS.."s")end local function K(xf,xg)O(xf.MouseButton1Click:Connect(xg))end
K(c.secSet,p0)O(c.secB.FocusLost:Connect(p0))K(c.colT,function()e.Collect,a.lastCollect=not e.Collect,r()N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)K(c.sellT,function()e.SellJunk=not e.SellJunk N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)K(c.sellB,function()
a.sellFails=0 task.spawn(ay,"selling...",oS)end)K(c.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(y.apply,"you asked",true)
end)K(c.crateT,function()e.Crates=not e.Crates N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)K(c.crateB,function()
d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(ay,"opening crate...",eQ,true)end)K(c.padB,function()
a.plot=a3()or a.plot local p2,jP=aP(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(p2 and jP and jP:IsA("BasePart"))then u("SET PAD: need character and plot")return end
a.manualPad=jP.CFrame:ToObjectSpace(p2 .HumanoidRootPart.CFrame)vA(a.manualPad)u("collect pad saved at your position")
end)K(c.startB,function()dD(not a.running)end)K(c.buyB,function()a.plot=a3()or a.plot task.spawn(ay,"buying (manual)...",lE,true)
end)K(c.plB,function()a.plot=a3()or a.plot task.spawn(ay,"waxing (manual)...",lJ)end)K(c.tabFarm,function()bm("farm")end)
K(c.tabBut,function()bm("but")end)K(c.tabSet,function()bm("set")end)K(c.tabCrt,function()bm("crt")end)K(c.tabPet,function()bm("pet")end)
K(c.tabTeam,function()bm("team")end)local function xh(jQ)a.hidden=jQ c.root.Visible=not jQ c.tgBtn.Text=jQ and"SAB+"or"SAB"
end pe(c.tgBtn,c.tgRoot,function()bl(c.tgRoot)a.togPos=fM(c.tgRoot)or a.togPos end)K(c.tgBtn,function()if(a.dragMoved[c.tgBtn]or 0)<8 then xh(not a.hidden)end
a.dragMoved[c.tgBtn]=0 end)local as,ai={},0 local function bo()as=k1()if#as==0 then c.cfgPick.Text="(none saved)"
ai=0 return end if ai<1 or ai>#as then ai=1 end c.cfgPick.Text=as[ai]..("  (%d/%d)"):format(ai,#as)end local function p3()
local p4=a.autoload~=nil c.cfgAuto.Text=p4 and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"c.cfgAuto.BackgroundColor3=p4 and l.accent or l.panel2
end local function jR()local p5=c.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if p5~=""then return p5 end return(ai>0 and as[ai])or""
end K(c.cfgSave,function()a.winPos=fM(c.root)or a.winPos a.togPos=fM(c.tgRoot)or a.togPos local p6,p7=ev(jR())
c.cfgMsg.Text=p6 and("saved as "..p7)or("could not save: "..p7)c.cfgMsg.TextColor3=p6 and l.good or l.bad bo()
u(c.cfgMsg.Text)end)local function xi(jS)local jT,p8=k_(jS)c.cfgMsg.Text=jT and("loaded "..p8)or("could not load: "..p8)
c.cfgMsg.TextColor3=jT and l.good or l.bad if jT then c.cfgName.Text=jS xd()task.spawn(y.apply,"config "..jS)
end u(c.cfgMsg.Text)end K(c.cfgLoad,function()xi(jR())end)K(c.cfgPick,function()bo()if ai>0 then c.cfgName.Text=as[ai]end
end)K(c.cfgPrev,function()if#as==0 then bo()return end ai=(ai-2)%#as+1 bo()c.cfgName.Text=as[ai]end)K(c.cfgNext,function()
if#as==0 then bo()return end ai=ai%#as+1 bo()c.cfgName.Text=as[ai]end)K(c.cfgAuto,function()if a.autoload then
lb(nil)c.cfgMsg.Text="it will not load a config on launch"else local dT=jR()local p9=false for zD,xj in ipairs(k1())do if xj==dT then p9=true end end
local xk=p9 or ev(dT)if xk and dT~=""then lb(dT)bo()c.cfgMsg.Text=dT.." will load every time the script starts"
else c.cfgMsg.Text="name the config and save it first"end end c.cfgMsg.TextColor3=l.dim p3()end)K(c.autoB,function()
local p_,qa=rW()c.autoMsg.Text=p_ and("installed. "..qa)or("failed: "..qa)c.autoMsg.TextColor3=p_ and l.good or l.bad
u(c.autoMsg.Text)end)K(c.startT,function()e.AutoStart=not e.AutoStart N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)K(c.rejT,function()e.Rejoin=not e.Rejoin N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)K(c.rejB,function()cJ("you asked")end)
local bP=false K(c.minB,function()bP=not bP c.tabs.Visible=not bP if bP then c.farm.Visible,c.but.Visible,c.set.Visible,c.crt.Visible=false,false,false,false
c.pet.Visible,c.team.Visible=false,false else bm(pC)end c.root.Size=UDim2 .new(0,ac.w,0,bP and(ac.head+ac.strip)or ac.h)
c.minB.Text=bP and"+"or"-"end)local function f9()if not a.alive then return end a.alive,a.running=false,false
pcall(q.restoreAll)pcall(d7)for zE,xl in ipairs(ge)do pcall(function()xl:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()i8:Destroy()end)pcall(function()pm:Destroy()end)if bR.SAB_KILL==f9 then bR.SAB_KILL=nil end end
bR.SAB_KILL=f9 K(c.killB,f9)K(c.xB,f9)pe(c.title,c.root,function()bl(c.root)a.winPos=fM(c.root)or a.winPos end)
local function qb()local dU,dV=a.reason,a.level if a.busy then dU,dV=a.busyText,"ok"elseif not a.running then
local zF,qc,xm=oY()if a.capHit then dU,dV=qc,"bad"else dU,dV="[stopped] "..qc,(xm=="bad")and"bad"or"idle"end a.reason,a.level=dU,dV
end c.reason.Text=dU c.bar.BackgroundColor3=vW[dV]or l.dim c.dot.BackgroundColor3=a.running and l.good or(a.capHit and l.bad or l.dim)
c.tgDot.BackgroundColor3=c.dot.BackgroundColor3 c.tgRoot.BackgroundColor3=a.hidden and l.panel2 or l.accent c.startB.Text=a.running and"STOP"or"START"
N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")c.startB.BackgroundColor3=a.running and l.warn or l.good
local xn,xo=d4()c.sBought.Text,c.sPlaced.Text,c.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
c.sColl.Text,c.sFree.Text=tostring(a.collected),xn.."/"..xo local qd=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(r()-a.lastCollect)))or nil
local qe=P()c.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
au(aO()),a.rolls,a.gifts,a.crates,qe and aa(Q(qe))or"nothing",d.on and("   ["..d.title.." window open]")or"",
qd and("in "..qd.."s")or"off")local cr=rx()c.tgt.Text=(#cr==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#cr<=3)and table.concat(cr,", ")or(#cr.." butters ticked")))
c.tgt.TextColor3=(#cr==0)and l.bad or l.good c.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
c.log.Text=table.concat(dY,"\n")if c.butInfo then c.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(M.n,#M.rarOrder,#cr)
end if c.but.Visible and a1 .at~=M.at then dN(false)end if c.crt.Visible then if E.built~=E.at then E.build()else E.paint()end
end if c.pet.Visible then j.live()end if c.set.Visible then c.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(q.fps+0.5),q.mem,q.memPeak)
end if c.team.Visible then o.paint()end N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local qf=(y.rec.on and"on"or"")..(y.rec.off and((y.rec.on and"/"or"").."off")or"")c.arL.Text=y.msg~=""and y.msg or("game: %s | learned: %s%s"):format(y.isOn()and"ON"or"off",
qf~=""and qf or"nothing yet",#y.rec.rules>0 and", choices"or"")c.arL.TextColor3=y.msg~=""and l.warn or l.dim end
bR.SAB={S=a,CFG=e,EV=J,U=c,sg=i8,CAT=M,LEARN=V,buildList=dN,logAll=cs,evAll=ct,AR=y,CR=E,PF=q,PX=j,TM=o,CRATE=d,FU=x}
u(bQ.." loaded")if a.uiErrs>0 then u("UI: "..a.uiErrs.." properties skipped")end bm("farm")bl(c.root)bl(c.tgRoot)
if fJ then pcall(function()O(fJ:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bl(c.root)
bl(c.tgRoot)end))end)end bo()p3()if a.config and a.config~=""then c.cfgName.Text=a.config end N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
c.secB.Text=tostring(e.Every)pcall(q.applyAll)pcall(qb)task.spawn(function()local qg=rU()c.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(qg and("\n(backup: "..qg..")")or"")
local qh=eq(W.exec)if qh and not qh:find("SAB autoloader v2",1,true)then cF(W.exec,W.stub)u("autoexec updated: it now loads the newest version from GitHub")
end c.autoMsg.Text=(eq(W.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(r2)end)task.spawn(function()while a.alive do local xp,xq=pcall(qb)if not xp then u("UI ERR "..tostring(xq))end
task.wait((a.hidden or bP)and 1.5 or 0.25)end end)task.spawn(function()local xr,xs=pcall(sa)if not xr then u("HOOK ERR "..tostring(xs))end
end)task.spawn(function()pcall(qW)if d.loadSeq and not d.learned then local f_={}for qi=1,20 do if d.loadSeq[qi]then f_[#f_+1]=d.loadSeq[qi]end end
if#f_>0 then d.learned={seq=f_,mode=d.loadMode}u("remembered how to open crates directly")end end if gO()then u(("catalog: %d butters in %d rarities"):format(M.n,#M.rarOrder))end
local xt,qj=pcall(vC)if xt and qj and a.alive and not a.manualPad then a.manualPad=qj end end)task.spawn(function()
while a.alive do local jU,jV=pcall(j.buyTick)if not jU then u("PET ERR "..tostring(jV))task.wait(5)end jU,jV=pcall(j.wishTick)
if not jU then u("WISH ERR "..tostring(jV))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local ga,qk=0,r()
O(game:GetService("RunService").Heartbeat:Connect(function()ga=ga+1 end))q.noteAt=r()while a.alive do task.wait(1)
local ql=r()q.fps,ga,qk=ga/math.max(ql-qk,0.001),0,ql local xu,xv=pcall(q.tick)if not xu then u("PERF ERR "..tostring(xv))task.wait(5)end
end end)task.spawn(function()task.wait(10)while a.alive do local xw,xx=pcall(x.tick)if not xw then u("FUSE ERR "..tostring(xx))task.wait(10)end
task.wait(4)end end)task.spawn(function()while a.alive do local xy,xz=pcall(o.tick)if not xy then u("TEAM ERR "..tostring(xz))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()while a.alive do task.wait(20)pcall(d7)end end)pcall(y.watchCache)
if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then pcall(function()local xC=(type(newcclosure)=="function")and newcclosure or function(xA)return xA end
local jW local qm=(type(setnamecallmethod)=="function")and setnamecallmethod or nil jW=hookmetamethod(game,"__namecall",xC(function(qn,...)
local dW=getnamecallmethod()if a.alive and(dW=="InvokeServer"or dW=="FireServer")then local qo,qp=pcall(function()return qn.Name end)
if qo and qp=="CrateAction"and not d.replaying then pcall(d.saw,dW,...)elseif qo and qp=="AutoRollAction"and not y.replaying then pcall(y.saw,dW,...)end
if qm then qm(dW)end end return jW(qn,...)end))d.oldNC=jW end)end if gc then O(C.Idled:Connect(function()pcall(function()gc:CaptureController()gc:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for zG=1,90 do if not a.alive then return end if C:GetAttribute("AutoRollOn")~=nil and aP()and(a.plot or a3())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then y.apply("joined")end while a.alive do task.wait(30)if a.alive and e.AutoRoll and a.running and not y.isOn()and not cK()and not P()
and not d.waiting and not d.on and not a.busy then y.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for zH=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or a3()if aP()and a.plot and next(e.Targets)then dD(true,true)u("started by itself")
return end task.wait(1)end if a.alive and not a.running then u("gave up waiting to start - tap START")end end)
task.spawn(function()a.plot=a3()a.lastCollect=r()while a.alive do if a.running then local xD,qq=pcall(vR)if not xD and qq~=gd then u("LOOP ERR "..tostring(qq))end
end task.wait(0.1)end end)gb("loaded - window is at the top left")end local xF,jX=xpcall(qu,function(xE)return tostring(xE).."\n"..debug.traceback()end)
if not xF then pcall(function()warn("SAB "..bQ.." ERROR: "..tostring(jX))end)gb("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bQ.." ERROR: "..tostring(jX))end)pcall(function()local qr=(type(getgenv)=="function"and getgenv())or _G
if type(qr.SAB_KILL)=="function"then qr.SAB_KILL()end for zI,xG in ipairs({"SABFarmGui","SABToggle"})do local qs=C.PlayerGui:FindFirstChild(xG)
if qs then qs:Destroy()end end end)pcall(function()local dX=Instance.new("ScreenGui")dX.Name="SABError"dX.ResetOnSpawn=false
dX.DisplayOrder=1000 local aF=Instance.new("TextBox")aF.Size=UDim2 .new(0,340,0,170)aF.Position=UDim2 .new(0,10,0,50)
aF.BackgroundColor3=Color3 .fromRGB(90,20,20)aF.TextColor3=Color3 .new(1,1,1)aF.TextSize=11 aF.TextWrapped=true
aF.ClearTextOnFocus=false aF.TextXAlignment=Enum.TextXAlignment.Left aF.TextYAlignment=Enum.TextYAlignment.Top
aF.Text="SAB "..bQ.." failed to start. Send this text:\n"..tostring(jX)aF.Parent=dX dX.Parent=C:WaitForChild("PlayerGui")
end)end
