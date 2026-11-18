local bV="v25"local ki=game:GetService("Players")local F=ki.LocalPlayer or ki.PlayerAdded:Wait()local function gm(q3)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bV,Text=q3,Duration=6})
end)end gm("script started")local function q4()local ao=game:GetService("ReplicatedStorage")local aC=game:GetService("Workspace")
local kj=game:GetService("UserInputService")local bW=(type(getgenv)=="function"and getgenv())or _G if type(bW.SAB_KILL)=="function"then pcall(bW.SAB_KILL)end
local q=(type(tick)=="function")and tick or os.clock local gn=(function()local q5,q6=pcall(function()return game:GetService("VirtualUser")end)return q5 and q6 or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,MemLimit=2000,Help=false,HelpGuild=false,}local c={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=q(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local N={name=nil,rar=nil,at=q(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local z={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local d={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local j,o,r,y,A={},{},{},{},{}local go={}local gp,d8,cA,cB={},{},{},{}local function P(kk)gp[#gp+1]=kk return kk end
local function af(q7)task.wait(q7)if not c.alive then error(go,0)end end local function x(d9)d9=os.date("%H:%M:%S").." "..tostring(d9)
table.insert(d8,1,d9)if#d8>6 then table.remove(d8)end cA[#cA+1]=d9 if#cA>80 then table.remove(cA,1)end end local function d_(kl)
if type(kl)~="string"then return""end return(kl:lower():gsub("[^%w]",""))end local function V(q8)local km=d_(q8)
local gq=km:gsub("butter$","")if gq==""then gq=km end return gq end local function aQ(gr)return type(gr)=="string"and V(gr)~=""and e.Targets[V(gr)]==true end
local function q9(cC)cC=cC:lower()return cC:find("squishy",1,true)~=nil or cC:match("butter$")~=nil or cC:match("butter[^%a]")~=nil
end local gs={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ay(cD)if type(cD)~="number"then return"?"end
local ea=1 while math.abs(cD)>=1000 and ea<#gs do cD=cD/1000 ea=ea+1 end local q_=string.format("%.2f",cD):gsub("%.?0+$","")
return q_..gs[ea]end local function ra(kn)if type(kn)~="string"then return nil end local rb,ko=kn:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local gt=tonumber(rb)if not gt then return nil end if ko==""then return gt end for rc,rd in ipairs(gs)do if rd:lower()==ko:lower()then return gt*1000^(rc-1)end end
return nil end local function aR()local kp=F:GetAttribute("BoardValueMoney")if type(kp)=="number"then return kp end
local kq=F:FindFirstChild("leaderstats")if kq then for ys,re in ipairs({"Cash","Money","Coins"})do local gu=kq:FindFirstChild(re)
if gu and type(gu.Value)=="number"then return gu.Value end end end end local function eb(rf)local gv=rf:GetFullName()
if c.plot then local gw=c.plot:GetFullName()if gv:sub(1,#gw)==gw then return gv:sub(#gw+2)end end return gv end
local function aD()local ec=F.Character if ec and ec:FindFirstChild("HumanoidRootPart")then local kr=ec:FindFirstChildOfClass("Humanoid")
if kr and kr.Health>0 then return ec end end end local function a7()local gx=aC:FindFirstChild("Plots")if not gx then return nil end
local function ks(rg)local kt=rg:FindFirstChild("Plate")return kt~=nil and kt:FindFirstChild("EditStackAttachment",true)~=nil
end local ku=F:GetAttribute("PlotNumber")if ku~=nil then local gy=gx:FindFirstChild(tostring(ku))if gy and ks(gy)then return gy end
end for yt,kv in ipairs(gx:GetChildren())do if ks(kv)then return kv end end end local function cE(kw)local a8=kw and kw.Parent
for yu=1,6 do if not a8 then return nil end if a8:IsA("BasePart")then return a8 end if a8:IsA("Model")then return a8 .PrimaryPart or a8:FindFirstChildWhichIsA("BasePart",true)end
a8=a8 .Parent end end local function kx(ky)local gz=ky.Parent if gz and gz:IsA("Attachment")then return gz.WorldPosition end
local kz=cE(ky)return kz and kz.Position end local function rh()local bX=c.plot and c.plot:FindFirstChild("Plate")
if not bX then return nil end if bX:IsA("BasePart")then return bX.Position end if bX:IsA("Model")then return bX:GetPivot().Position end
local kA=bX:FindFirstChildWhichIsA("BasePart",true)return kA and kA.Position end local function kB()local gA={}
local kC=c.plot and c.plot:FindFirstChild("WaxStations")if kC then for yv,ri in ipairs(kC:GetChildren())do local kD=ri:FindFirstChild("SquishyPlaceHolder")
local gB=kD and kD:FindFirstChild("PlacePrompt")if gB and gB:IsA("ProximityPrompt")then gA[#gA+1]=gB end end end
return gA end local function ed()local kE,gC=kB(),0 for yw,rj in ipairs(kE)do if rj.Enabled then gC=gC+1 end end
local gD=#kE local gE=F:GetAttribute("WaxStations")if type(gE)=="number"and gE>gD then gD=gE end return gC,gD
end local function rk()local kF=aD()local kG=kF and kF.HumanoidRootPart.Position local gF,kH for yx,gG in ipairs(kB())do
if gG.Enabled then local kI=kx(gG)local kJ=(kI and kG)and(kI-kG).Magnitude or 1e9 if not gF or kJ<kH then gF,kH=gG,kJ end
end end return gF end local function kK()local ee=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not ee then return nil end local kL=ee:FindFirstChild("BuyPromptAttachment")local ef=(kL and kL:FindFirstChild("BuyPrompt"))or ee:FindFirstChild("BuyPrompt",true)
if ef and ef:IsA("ProximityPrompt")and ef:IsDescendantOf(ee)then return ef end end local kM={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local rl={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aa={order={},price={},dirty=false}local H={seen={},at=0,boxes={},built=0}local Q={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local gH="SAB_order.txt"local function eg()if not aa.dirty or type(writefile)~="function"then return end local as={}
for rm,rn in pairs(aa.price)do as[#as+1]="P|"..rm.."|"..string.format("%.0f",rn)end for ro,rp in pairs(aa.order)do as[#as+1]="O|"..ro.."|"..table.concat(rp,",")end
if d.learned and d.enc then as[#as+1]="M|mode|"..tostring(d.learned.mode or"")for rq,eh in ipairs(d.learned.seq)do
local kN={}for kO=1,eh.n do kN[kO]=d.enc(eh.args[kO])end as[#as+1]=("A|%d|%s|%d|%s"):format(rq,eh.m,eh.n,table.concat(kN,";"))
end end local function gI(rr,rs,ei)local kP={}for kQ=1,ei.n do kP[kQ]=d.enc(ei.args[kQ])end as[#as+1]=("R|%d|%s|%s|%d|%s"):format(rs,rr,ei.m,ei.n,table.concat(kP,";"))
end if d.enc then for rt,ru in ipairs(z.rec.rules)do gI("rules",rt,ru)end if z.rec.on then gI("on",0,z.rec.on)end
if z.rec.off then gI("off",0,z.rec.off)end end for yy,cF in pairs(H.seen)do as[#as+1]=("K|%s|%s|%s|%s"):format(cF.name,cF.title or"",cF.rar or"",cF.price and string.format("%.0f",cF.price)or"")
end if pcall(writefile,gH,table.concat(as,"\n"))then aa.dirty=false end end local function rv()if type(isfile)~="function"or type(readfile)~="function"then return end
local rw,rx=pcall(isfile,gH)if not(rw and rx)then return end local ry,kR=pcall(readfile,gH)if not(ry and type(kR)=="string")then return end
for rz in kR:gmatch("[^\n]+")do local bY,bZ,aS=rz:match("^(%a)|([^|]+)|(.*)$")if bY=="P"then aa.price[bZ]=tonumber(aS)
elseif bY=="M"then d.loadMode=(aS~=""and aS~="nil")and aS or nil elseif bY=="A"and d.dec then local kS=tonumber(bZ)
local kT,ej,rA=aS:match("^([^|]+)|(%d+)|(.*)$")if kS and kT then ej=tonumber(ej)local kU,ek={},0 for rB in(rA..";"):gmatch("([^;]*);")do
ek=ek+1 if ek<=ej then kU[ek]=d.dec(rB)end end d.loadSeq=d.loadSeq or{}d.loadSeq[kS]={m=kT,n=ej,args=kU}end elseif bY=="R"and d.dec then
local kV=tonumber(bZ)local el,rC,em,rD=aS:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if kV and el then em=tonumber(em)
local kW,en={},0 for rE in(rD..";"):gmatch("([^;]*);")do en=en+1 if en<=em then kW[en]=d.dec(rE)end end local gJ={m=rC,n=em,args=kW}
if el=="rules"then z.rec.rules[kV]=gJ elseif el=="on"then z.rec.on=gJ elseif el=="off"then z.rec.off=gJ end end
elseif bY=="K"then local kX,kY,rF=aS:match("^([^|]*)|([^|]*)|(.*)$")H.seen[H.key(bZ)]={name=bZ,title=kX~=""and kX or nil,
rar=kY~=""and kY or nil,price=tonumber(rF)}elseif bY=="O"and aS~=""then local eo={}for rG in aS:gmatch("[^,]+")do eo[#eo+1]=rG end
if#eo>0 then aa.order[bZ]=eo end end end end local function rH(ep)if type(ep)~="table"then return end local bv,kZ=ep.rarity,ep.contents
if type(bv)~="string"or bv==""or type(kZ)~="table"then return end local cG={}for yz,eq in ipairs(kZ)do if type(eq)=="table"and type(eq.butter)=="string"then
cG[#cG+1]={n=eq.butter,ch=tonumber(eq.chance)or 0}end end if#cG==0 then return end table.sort(cG,function(rI,rJ)return rI.ch>rJ.ch end)
local cH,cI={},false for rK,rL in ipairs(cG)do cH[rK]=rL.n end local gK=aa.order[bv]if not gK or#gK~=#cH then cI=true end
if not cI then for k0=1,#cH do if gK[k0]~=cH[k0]then cI=true break end end end aa.order[bv]=cH local gL=tonumber(ep.price)
if gL and aa.price[bv]~=gL then aa.price[bv]=gL cI=true end if cI then aa.dirty=true Q.at=0 x("learned the "..bv.." order from its crate")
end end local function b0(rM,rN)local rO=rM:FindFirstChild(rN,true)local rP,gM=pcall(function()return rO.Text end)
return(rP and type(gM)=="string"and gM~="")and gM or nil end local function ac(k1)return Q.pretty[k1]or k1 end
H.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function H.key(rQ)return d_(rQ or"")end
function H.learn(aT)if type(aT)~="table"or type(aT.name)~="string"then return end local gN=H.key(aT.name)local aU=H.seen[gN]or{}
local rR=(H.seen[gN]==nil)or(tonumber(aT.price)and aU.price~=tonumber(aT.price))aU.name,aU.title=aT.name,aT.title or aU.title
aU.rar,aU.price=aT.rarity or aU.rar,tonumber(aT.price)or aU.price H.seen[gN]=aU if rR then H.at,aa.dirty=q(),true end
end function H.wanted(k2)return k2~=nil and e.CrateTicks[H.key(k2)]==true end function H.list()local b1={}for rS,er in ipairs(H.base)do b1[H.key(er[1])]={name=er[1],title=er[2],rar=er[3],i=rS}end
for yA,cJ in ipairs(Q.rarOrder)do local k3=false for yB,rT in pairs(b1)do if rT.rar==cJ then k3=true break end end
if not k3 and cJ~="?"then local k4=cJ:gsub("[^%w]","").."Crate"b1[H.key(k4)]={name=k4,title=cJ.." Crate",rar=cJ,i=50,guess=true}
end end for k5,es in pairs(H.seen)do local aK=b1[k5]or{i=100}aK.name,aK.title,aK.rar=es.name or aK.name,es.title or aK.title,es.rar or aK.rar
aK.price,aK.guess=es.price or aK.price,nil b1[k5]=aK end local cK,et={},{}for rU,rV in ipairs(kM)do cK[rV]=rU end
for rW,k6 in ipairs(Q.rarOrder)do cK[k6]=cK[k6]or(20+rW)end for rX,cL in pairs(b1)do cL.k=rX cL.price=cL.price or aa.price[cL.rar or""]
et[#et+1]=cL end table.sort(et,function(bw,bx)if bw.price and bx.price and bw.price~=bx.price then return bw.price<bx.price end
local k7,k8=cK[bw.rar or""]or 99,cK[bx.rar or""]or 99 if k7~=k8 then return k7<k8 end if(bw.i or 100)~=(bx.i or 100)then return(bw.i or 100)<(bx.i or 100)end
return bw.k<bx.k end)return et end local function rY()local k9=ao:FindFirstChild("Assets")local k_=k9 and k9:FindFirstChild("Squishies")
if not k_ then return false end local gO,la,b2={},{},{}local eu=0 for yC,ev in ipairs(k_:GetChildren())do local cM=V(ev.Name)
if cM~=""and not gO[cM]then local ew=b0(ev,"RarityText")or"?"gO[cM]=ew la[cM]=b0(ev,"NameText")or ev.Name b2[ew]=b2[ew]or{}
table.insert(b2[ew],cM)eu=eu+1 end end if eu==0 then return false end for lb,rZ in pairs(b2)do local lc=aa.order[lb]or rl[lb]
local gP={}if lc then for r0,r1 in ipairs(lc)do gP[V(r1)]=r0 end end table.sort(rZ,function(ld,le)local gQ,gR=gP[ld],gP[le]
if gQ and gR then return gQ<gR end if gQ then return true end if gR then return false end return ac(ld)<ac(le)
end)end local gS={}for r2,r3 in ipairs(kM)do gS[r3]=r2 end local ex={}for r4 in pairs(b2)do ex[#ex+1]=r4 end table.sort(ex,function(gT,gU)
local gV,gW=aa.price[gT],aa.price[gU]if gV and gW and gV~=gW then return gV<gW end local gX,gY=gS[gT],gS[gU]if gX and gY then return gX<gY end
if gX then return true end if gY then return false end return gT<gU end)Q.rar,Q.pretty,Q.members,Q.rarOrder,Q.n,Q.at=gO,la,b2,ex,eu,q()
return true end local function gZ()if Q.at==0 or(q()-Q.at)>120 then pcall(rY)end return Q.n>0 end local function r5(r6)
local lf=V(r6)return Q.rar[lf]or(N.name and V(N.name)==lf and N.rar)or"?"end local function r7()local ey={}for r8,r9 in pairs(e.Targets)do if r9 then ey[#ey+1]=ac(r8)end end
table.sort(ey)return ey end local ab={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function lg()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function ez(lh)if type(makefolder)~="function"then return end local r_,sa=pcall(isfolder,lh)if not(r_ and sa)then pcall(makefolder,lh)end
end local function eA(li)if type(isfile)~="function"or type(readfile)~="function"then return nil end local sb,sc=pcall(isfile,li)
if not(sb and sc)then return nil end local sd,se=pcall(readfile,li)return sd and se or nil end local function cN(sf,sh)
if type(writefile)~="function"then return false end return(pcall(writefile,sf,sh))end local function lj(si)local cO={}
if type(listfiles)~="function"then return cO end local sj,lk=pcall(listfiles,si)if not sj or type(lk)~="table"then return cO end
for yD,sk in ipairs(lk)do cO[#cO+1]=tostring(sk)end return cO end local function ll()local eB={}for yE,sl in ipairs(lj(ab.cfg))do
local lm=sl:match("([^/\\]+)%.txt$")if lm then eB[#eB+1]=lm end end table.sort(eB)return eB end local function sm()
local O={"V|1"}O[#O+1]="N|Every|"..tostring(e.Every)O[#O+1]="N|GlazeLead|"..tostring(e.GlazeLead)O[#O+1]="N|FpsCap|"..tostring(e.FpsCap)
O[#O+1]="N|MemLimit|"..tostring(e.MemLimit)for yF,ln in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do O[#O+1]="S|"..ln.."|"..e[ln]end
do local eC={}for sn,cP in pairs(e.Pets)do local lo=(cP.b and"b"or"")..(cP.g and"g"or"")..(cP.w and"w"or"")..((tonumber(cP.f)or 0)>0 and tostring(cP.f)or"")
if lo~=""then eC[#eC+1]=sn.."|"..lo end end table.sort(eC)O[#O+1]="P|-"for yG,so in ipairs(eC)do O[#O+1]="P|"..so end
end for yH,lp in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild"})do
O[#O+1]="B|"..lp.."|"..(e[lp]and"1"or"0")end local g0=F:GetAttribute("AutoRollRules")if type(g0)=="string"and g0~=""then e.ARrules,e.ARstop=g0,tostring(F:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then O[#O+1]="S|rules|"..e.ARrules O[#O+1]="S|stop|"..e.ARstop end if c.winPos then O[#O+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then O[#O+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for yI,g1 in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local eD={}for sp,sq in pairs(g1[2])do if sq then eD[#eD+1]=sp end end table.sort(eD)O[#O+1]=g1[1].."|-"for yJ,sr in ipairs(eD)do O[#O+1]=g1[1].."|"..sr end
end return table.concat(O,"\n")end local function ss(g2)if type(g2)~="string"or g2==""then return false end local lq,lr,ls,lt,cQ={},false,{},false,nil
for su in g2:gmatch("[^\n]+")do local az,W,ap=su:match("^(%a)|([^|]*)|?(.*)$")if az=="N"and W=="Every"then local g3=tonumber(ap)
if g3 and g3>=1 then e.Every=math.floor(g3)end elseif az=="N"and(W=="FpsCap"or W=="MemLimit")then local g4=tonumber(ap)
if g4 and g4>=0 then e[W]=math.floor(g4)end elseif az=="N"and W=="GlazeLead"then local eE=tonumber(ap)if eE and eE>=5 and eE<=600 then e.GlazeLead=math.floor(eE)end
elseif az=="S"and(W=="TeamNormal"or W=="TeamFull"or W=="TeamGlaze"or W=="TeamWax")then e[W]=ap elseif az=="P"and W~=""then
if not cQ then cQ={}end if W~="-"and ap~=""then cQ[W]={b=ap:find("b",1,true)and true or nil,g=ap:find("g",1,true)and true or nil,
w=ap:find("w",1,true)and true or nil,f=tonumber(ap:match("%d"))}end elseif az=="B"then if e[W]~=nil then e[W]=(ap=="1")end
elseif az=="S"and W=="rules"then e.ARrules=ap elseif az=="S"and W=="stop"then e.ARstop=ap elseif az=="W"then c.winPos={tonumber(W)or 10,tonumber(ap)or 44}
elseif az=="G"then c.togPos={tonumber(W)or 10,tonumber(ap)or 300}elseif az=="T"and W~=""then if W~="-"then lq[W]=true end
lr=true elseif az=="K"and W~=""then if W~="-"then ls[W]=true end lt=true end end if lr then e.Targets=lq end if lt then e.CrateTicks=ls end
if cQ then e.Pets=cQ end return true end local function eF(b3)if not lg()then return false,"this executor cannot write files"end
b3=(b3 or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if b3==""then return false,"give the config a name"end
ez(ab.dir)ez(ab.cfg)if not cN(ab.cfg.."/"..b3 ..".txt",sm())then return false,"could not write the file"end c.config=b3
return true,b3 end local function lu(eG)local lv=eA(ab.cfg.."/"..eG..".txt")if not lv then return false,"no config called "..tostring(eG)end
if not ss(lv)then return false,"that config looks empty"end c.config=eG return true,eG end local function lw(g5)
if g5 then ez(ab.dir)cN(ab.auto,g5)elseif type(delfile)=="function"then pcall(delfile,ab.auto)else cN(ab.auto,"")
end c.autoload=g5 end local function sv()if c.selfPath then return c.selfPath end local eH for yK,sw in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ab.dir})do
for yL,lx in ipairs(lj(sw))do local g6=lx:lower()if g6:sub(-4)==".lua"and(g6:find("sab_farm",1,true)or g6:find("sab farm",1,true))then
eH=eH or lx end end end c.selfPath=eH return eH end ab.stub=[[
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
local function sx()if not lg()then return false,"this executor cannot write files"end ez("autoexec")if not cN(ab.exec,ab.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local eI=(function()local sy,sz=pcall(function()return game:GetService("TeleportService")end)return sy and sz or nil end)()
local function g7()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local sA=queueonteleport or queue_on_teleport return(pcall(sA,ab.stub))end local function cR(sB)if c.rejoining then return end
c.rejoining=true x("REJOIN ("..sB..")")pcall(eg)if c.autoload then pcall(eF,c.autoload)end local sC=g7()x(sC and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for yM=1,30 do if not eI then break end pcall(function()eI:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function sD()local sE,ly=pcall(function()return game:GetService("GuiService")end)if sE and ly then
pcall(function()P(ly.ErrorMessageChanged:Connect(function()if e.Rejoin then cR("roblox error message")end end))
end)end pcall(function()local lz=game:GetService("CoreGui")local lA=lz and lz:WaitForChild("RobloxPromptGui",15)
local lB=lA and lA:WaitForChild("promptOverlay",15)if lB then P(lB.ChildAdded:Connect(function(sF)if e.Rejoin and tostring(sF.Name):lower():find("errorprompt",1,true)then cR("disconnect prompt")end
end))end end)pcall(function()P(F.OnTeleport:Connect(function(sG)if tostring(sG):find("Started")then g7()end end))
end)if eI then pcall(function()P(eI.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()cR("teleport retry")end)end
end))end)end end local function lC(sH)local lD=c.plot and c.plot:FindFirstChild(sH)if not lD then return nil,false end
for yN,g8 in ipairs(lD:GetChildren())do if g8:IsA("Model")or g8:IsA("BasePart")then return g8,true end end return nil,true
end local function cS()local a9=lC("RolledSquishy")if not a9 then return nil end return{model=a9,name=a9 .Name,pretty=b0(a9,"NameText")or ac(V(a9 .Name)),
rar=b0(a9,"RarityText")or r5(a9 .Name),price=b0(a9,"PriceText")}end local function lE(g9)return type(g9)=="string"and(Q.rar[V(g9)]~=nil or q9(g9))
end local function T()local g_=lC("SquishyEquipped")if g_ then c.carrySrc,d.heldAt="model",q()return g_.Name,g_ end
local lF=F.Character if lF then for yO,cT in ipairs(lF:GetDescendants())do if(cT:IsA("Model")or cT:IsA("Tool"))and lE(cT.Name)then
c.carrySrc,d.heldAt="character",q()return cT.Name,cT end end end local eJ=F:GetAttribute("SquishyEquipped")if type(eJ)=="string"and eJ~=""and lE(eJ)and q()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return eJ,nil end c.carrySrc=nil end local function yP()local yQ,sI=T()return sI end local function lG()
local lH=cS()local ha=lH and ra(lH.price)local hb=aR()if ha and hb and hb<ha*0.5 then return hb,ha end end local function b4(sJ)
cB[#cB+1]=os.date("%H:%M:%S").." "..sJ if#cB>40 then table.remove(cB,1)end end local function sK(by,eK)if type(by)~="string"then return end
b4(("Roll(%s,%s)"):format(by,tostring(eK)))if by:lower():find("crate",1,true)then d.rolled,d.rolledAt=by,q()return
end N.seq=N.seq+1 N.name,N.at=by,q()N.rar=type(eK)=="string"and eK or nil c.rolls=c.rolls+1 if aQ(by)then x(("ROLL %s [%s] = TARGET"):format(by,tostring(eK)))end
end local function sL(bz)if type(bz)~="table"then return end local eL=bz.butter or bz.itemName if type(eL)~="string"then return end
c.gifts=c.gifts+1 N.gift,N.giftAt=eL,q()if type(bz.giftId)=="string"then local lI=ao:FindFirstChild("Remotes")
local lJ=lI and lI:FindFirstChild("GiftThanks")if lJ then pcall(function()lJ:FireServer(bz.giftId)end)end end
b4("Gift("..eL.." from "..tostring(bz.fromName)..")")x(("GIFT from %s: %s - it will not be waxed"):format(tostring(bz.fromName),eL))
end local function sM()local lK=ao:WaitForChild("Remotes",30)if not c.alive then return end if not lK then x("Remotes folder missing - no roll events")return end
P(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local lL=F:GetAttribute("SquishyEquipped")
if type(lL)=="string"and lL~=""then d.heldAt=q()end end))local sS={SquishyRollAnimation=sK,InitSquishy=function(lM)N.init,N.initAt=tostring(lM),q()b4("Init("..tostring(lM)..")")end,
CrateUpdate=function(b5,lN)pcall(rH,b5)pcall(H.learn,b5)if type(b5)=="table"then local sN=lN==true or(d.rolled~=nil and q()-d.rolledAt<15)or d.waiting
if not sN then return end local sO=not d.waiting local sP=d.on d.waiting,d.data,d.at=true,b5,q()d.on=(lN==true)
d.title=tostring(b5 .title or b5 .name or"crate")if d.on and not sP then d.openedAt,d.byYou=q(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then b4("CrateWindow open("..d.title..")")elseif sO then b4("Crate waiting("..d.title..")")x(d.title.." is waiting on your stand")
end else if d.waiting then b4("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local sQ=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,sQ)end if d.classify then local sR=q()
task.spawn(function()pcall(d.classify,sR)end)end end end,GiftReceived=sL,}for eM,sT in pairs(sS)do local hc=lK:FindFirstChild(eM)
if hc and hc:IsA("RemoteEvent")then P(hc.OnClientEvent:Connect(sT))elseif eM~="CrateUpdate"and eM~="GiftReceived"then x("remote "..eM.." missing")end
end end local function hd()local bA=cS()if bA then if aQ(bA.name)then return{state="match",shown=bA.pretty,src="pad",info=bA}
end return{state="skip",info=bA,level="idle",text=("on pad: %s [%s] - not ticked"):format(bA.pretty,tostring(bA.rar))}
end if N.name and(q()-N.at)<4 then if aQ(N.name)then return{state="match",shown=ac(V(N.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ac(V(N.name)),tostring(N.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function lO(sU,sV,sW,sX)
local eN=RaycastParams.new()eN.FilterType=Enum.RaycastFilterType.Exclude local he={F.Character}for yR,sY in ipairs(sX or{})do he[#he+1]=sY end
eN.FilterDescendantsInstances=he pcall(function()eN.RespectCanCollide=true end)local lP=aC:Raycast(Vector3 .new(sU,sV+4,sW),Vector3 .new(0,-30,0),eN)
return lP and lP.Position or nil end local function hf(lQ)local lR=lQ:FindFirstChildOfClass("Humanoid")return((lR and lR.HipHeight)or 2)+lQ.HumanoidRootPart.Size.Y/2+0.2
end local function hg(sZ,s0)local lS=sZ:FindFirstChildOfClass("Humanoid")local s1=q()while q()-s1<s0 do if lS and lS.FloorMaterial~=Enum.Material.Air then return true end
af(0.05)end return false end local function b6(s2,hh,hi)local lT=s2 .HumanoidRootPart lT.AssemblyLinearVelocity=Vector3 .new(0,0,0)
lT.CFrame=hi and CFrame.new(hh,Vector3 .new(hi.X,hh.Y,hi.Z))or CFrame.new(hh)end local function b7(aV,lU)local bB=aD()
if not bB or not aV then return false end local a_=aV.Position local eO=math.clamp(math.max(aV.Size.X,aV.Size.Z)/2+2.2,3,7)
local lV=(lU and lU.MaxActivationDistance)or 10 if eO>lV-2 then eO=math.max(2.5,lV-2)end local cU={}local function bC(cV)
cV=Vector3 .new(cV.X,0,cV.Z)if cV.Magnitude>0.05 then cU[#cU+1]=cV.Unit end end local lW=rh()if lW then bC(lW-a_)end
bC(aV.CFrame.LookVector)bC(-aV.CFrame.LookVector)bC(aV.CFrame.RightVector)bC(-aV.CFrame.RightVector)bC(bB.HumanoidRootPart.Position-a_)
if#cU==0 then bC(Vector3 .new(0,0,1))end local s3,eP=hf(bB),false for yS,s4 in ipairs(cU)do local eQ=a_+s4*eO
local hj=lO(eQ.X,a_.Y,eQ.Z,{aV})if hj and math.abs(hj.Y-a_.Y)<14 then b6(bB,Vector3 .new(eQ.X,hj.Y+s3,eQ.Z),a_)
if hg(bB,0.7)then eP=true break end end end if not eP then b6(bB,a_+cU[1]*eO+Vector3 .new(0,3,0),a_)eP=hg(bB,1)
end af(0.12)return eP end local function s5(cW)if not cW.Parent or not cW.Enabled then return false end pcall(function()cW:InputHoldBegin()end)
af(math.max(cW.HoldDuration,0)+0.08)pcall(function()cW:InputHoldEnd()end)return true end local function aj(lX,s6)
local s7=q()while q()-s7<s6 do if lX()then return true end af(0.05)end return lX()end local function eR(b8,s8,lY,s9)
local s_=c.zapFirst and{"zap","hold"}or{"hold","zap"}for ta,hk in ipairs(s_)do if ta==2 and(s9 or not(b8 .Parent and b8 .Enabled and(not lY or lY())))then break end
local hl if hk=="hold"then hl=s5(b8)else hl=type(fireproximityprompt)=="function"and b8 .Parent~=nil and b8 .Enabled and pcall(fireproximityprompt,b8)end
if hl and aj(s8,1.2)then c.zapFirst=(hk=="zap")return true,hk end end return false end local function lZ(hm)local ba=kK()
if not ba or not ba.Enabled then x("buy: nothing on the pad")return false end local l0=cE(ba)if not l0 then x("buy: pad part missing")return false end
c.lastBuyAt=q()local tb,l1=N.seq,aR()b7(l0,ba)if not ba.Enabled then x("buy aborted: pad emptied")return false end
local b9=hd()if not hm and b9 .state~="match"then x("buy aborted: "..(b9 .text or"pad changed"))c.matchSince=nil
return false end local hn=b9 .info and b9 .info.name or(b9 .state=="match"and N.name)or nil local function tc()
return ba.Enabled and T()==nil and(hm or hd().state=="match")end local td,te=eR(ba,function()return T()~=nil or((not ba.Enabled)and(hm or N.seq==tb))
end,tc,lG()~=nil)if td then aj(function()return T()~=nil end,0.8)local cX=T()local l2=aR()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil N.name,N.rar,N.at=nil,nil,q()x(("BOUGHT %s%s via %s"):format(cX and ac(V(cX))or(b9 .shown or"?"),(l1 and l2)and(" for $"..ay(l1-l2))or"",te))
if cX and hn and V(cX)~=V(hn)then x(("note: picked up %s, not %s"):format(cX,hn))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=q()+math.min(8*2^(c.cashFails-1),60)local l3=cS()x(("BUY REFUSED: cash short? have $%s, price %s"):format(ay(aR()),(l3 and l3 .price)or"?"))
return false end local function l4()local eS=T()if not eS then c.holding=false x("place: hands are empty")return false
end if not aQ(eS)then x(("REFUSED TO WAX %s - it is not ticked"):format(ac(V(eS))))return false end for yT=1,e.PlaceTries do
local bc=rk()if not bc then x("place: no free station")break end local l5=cE(bc)if l5 then b7(l5,bc)local l6=T()
if not l6 then c.holding=false x("place: hands emptied on the way")return false end if not aQ(l6)then x("place: what I carry changed, not waxing it")return false end
if bc.Enabled then local tf,tg=eR(bc,function()return not bc.Enabled end,function()return bc.Enabled end)if tf then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=q()+2.5,0 N.name,N.rar,N.at=nil,nil,q()
x(("WAXED %s #%d at %s via %s"):format(ac(V(eS)),c.placed,bc.Parent.Parent.Name,tg))return true end end end af(0.25)
end c.placeFails=c.placeFails+1 if T()==nil then c.holding=false end x("PLACE FAILED ("..c.placeFails..")")if c.placeFails>=2 then
c.capHit,c.running,c.capAt=true,false,q()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(T()))x(c.capMsg)end return false end function o.place()local th=q()while c.alive and o.editing and q()-th<25 do af(0.2)end
if e.Teams and e.TeamWax~=""then o.placing=true local ti=q()while c.alive and o.current()~=e.TeamWax and q()-ti<5 do af(0.1)end
if o.current()==e.TeamWax then af(0.3)else x("wax team did not come on in time - placing anyway")end end local tj,l7=pcall(l4)
o.placing=false if not tj then error(l7,0)end return l7 end local function l8(l9)return type(l9)=="string"and l9:lower():find("crate",1,true)~=nil
end local tk={SABFarmGui=1,SABToggle=1,SABError=1}local function ho(tl)local bd=tl while bd do if tk[bd.Name]then return false end
if bd:IsA("ScreenGui")then local tm,tn=pcall(function()return bd.Enabled end)return(not tm)or tn~=false end if bd:IsA("GuiObject")and not bd.Visible then return false end
bd=bd.Parent end return false end local function eT(eU)local b_=""pcall(function()if eU:IsA("TextButton")then b_=eU.Text end end)
if not b_:find("%a")then for yU,eV in ipairs(eU:GetDescendants())do if(eV:IsA("TextLabel")or eV:IsA("TextButton"))and eV.Text:find("%a")then b_=eV.Text break end
end end if not b_:find("%a")then b_=eU.Name end return(b_:lower():gsub("[^%a]",""))end local function to()local cY,cZ
local l_=F:FindFirstChildOfClass("PlayerGui")if not l_ then return nil,nil end for yV,c0 in ipairs(l_:GetDescendants())do
if c0:IsA("GuiButton")and ho(c0)then local hp=eT(c0)if hp:sub(1,4)=="open"and not hp:find("shop",1,true)then cY=cY or c0 end
if hp:sub(1,7)=="discard"then cZ=cZ or c0 end end end if cY and cZ then return cY,cZ end if d.on then return cY,cZ end
return nil,nil end local hq=(function()local tp,tq=pcall(function()return game:GetService("VirtualInputManager")end)return tp and tq or nil end)()
local function ma(aW,hr)local hs={}local function mb(tr)hs[#hs+1]=tr end if c.tapWay then mb(c.tapWay)end for yW,mc in ipairs({"touch","conn","signal"})do
if mc~=c.tapWay then mb(mc)end end local function md(ts,...)local tt,ht=pcall(getconnections,ts)if not(tt and type(ht)=="table"and#ht>0)then return false end
local me,tu,tv=false,{...},select("#",...)for yX,tw in ipairs(ht)do if pcall(function()tw:Fire(table.unpack(tu,1,tv))end)then me=true end
end return me end local function mf()local mg=Vector3 .new(0,0,0)pcall(function()local mh,mi=aW.AbsolutePosition,aW.AbsoluteSize
mg=Vector3 .new(mh.X+mi.X/2,mh.Y+mi.Y/2,0)end)local hu={Position=mg,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()hu.UserInputType=Enum.UserInputType.Touch end)pcall(function()hu.UserInputState=Enum.UserInputState.End end)
return hu end for yY,aX in ipairs(hs)do local c1=false if aX=="conn"and type(getconnections)=="function"then if md(aW.MouseButton1Click)then
c1=true if aj(hr,1.5)then c.tapWay=aX return true,aX end end c1=md(aW.Activated,mf(),1)elseif aX=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aW.MouseButton1Click)then if aj(hr,1.5)then c.tapWay=aX return true,aX end end c1=pcall(firesignal,aW.Activated,mf(),1)
elseif aX=="touch"and hq then c1=pcall(function()local mj,mk=aW.AbsolutePosition,aW.AbsoluteSize local ml=0 local mm=aW:FindFirstAncestorWhichIsA("ScreenGui")
local tx,ty=pcall(function()return mm and mm.IgnoreGuiInset end)if not(tx and ty)then pcall(function()ml=game:GetService("GuiService"):GetGuiInset().Y end)
end local mn,mo=mj.X+mk.X/2,mj.Y+mk.Y/2+ml hq:SendMouseButtonEvent(mn,mo,0,true,game,1)task.wait(0.06)hq:SendMouseButtonEvent(mn,mo,0,false,game,1)
end)end if c1 and aj(hr,1.5)then c.tapWay=aX return true,aX end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function hv(mp)local c2=mp.Parent while c2 and c2~=c.plot do if d.NOT[c2 .Name]then return false end c2=c2 .Parent
end local hw=(mp.ActionText or""):lower()if hw:find("roll",1,true)or hw:find("place",1,true)or hw:find("sell",1,true)then return false end
return true end local function tz()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not c.plot then return nil end local mq=c.plot:FindFirstChild("CrateStand")local c3 if mq then for yZ,eW in ipairs(mq:GetDescendants())do
if eW:IsA("ProximityPrompt")and eW.Enabled and hv(eW)then c3=eW break end end end if not c3 then for y0,be in ipairs(c.plot:GetDescendants())do
if be:IsA("ProximityPrompt")and be.Enabled and hv(be)then local mr=be:FindFirstAncestorWhichIsA("Model")local tA=((be.ActionText or"").." "..(be.ObjectText or"").." "..be.Name.." "..(mr and mr.Name or"")):lower()
if tA:find("crate",1,true)then c3=be break end end end end d.prompt=c3 return c3 end local function hx()if d.on then return true end
local c4=tz()if not c4 then d.summonFails=d.summonFails+1 d.lastFail=q()x("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local ms=cE(c4)if ms then b7(ms,c4)end d.ours=true eR(c4,function()return d.on end)if aj(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=q()x("crate: pressed "..eb(c4).." but no window came up")
return false end do local function tB(mt)local ca=mt.Parent while ca and ca:IsA("GuiObject")do local mu,mv=false,false
for y1,c5 in ipairs(ca:GetDescendants())do if c5~=mt and c5:IsA("GuiButton")and eT(c5):sub(1,7)=="discard"then mu=true end
if c5:IsA("TextLabel")then local hy=c5 .Text:lower()if hy:find("crate",1,true)or hy:find("can contain",1,true)or hy:find("cost",1,true)then mv=true end
end if mu and mv then return ca end end ca=ca.Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local mw=F:FindFirstChildOfClass("PlayerGui")if not mw then return nil end for y2,eX in ipairs(mw:GetDescendants())do
if eX:IsA("GuiButton")and not eX:FindFirstAncestor("SABFarmGui")and eT(eX):sub(1,4)=="open"then local hz=tB(eX)
if hz then d.win=hz return hz end end end end local function tC(tD)for y3,eY in ipairs(tD:GetDescendants())do
if eY:IsA("GuiButton")then local mx,hA=eT(eY),eY.Name:lower()if mx=="x"or mx=="close"or hA=="x"or hA:find("close",1,true)or hA:find("exit",1,true)then return eY end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(tE)task.wait(tE and 4 or 1.2)if d.on or d.waiting then return end
local eZ=d.findWin()if not eZ or not ho(eZ)then return end local my=tC(eZ)if my and ma(my,function()return not ho(eZ)end)then return end
x("the crate window is still open - tap its X")end end local function e0(e1)if not hx()then return false end local mz=q()-(d.openedAt or 0)
if mz<0.6 then af(0.6-mz)end local hB=d.title local tF,tG=to()local mA=e1 and tF or tG if not mA then d.lastFail=q()
c.crateFails=c.crateFails+1 x(("crate: no %s button found in %s"):format(e1 and"Open"or"Discard",hB))return false
end local tH=T()local tI,y4=ma(mA,function()return(not d.on)or(T()~=nil and T()~=tH)end)if not tI then d.lastFail=q()
c.crateFails=c.crateFails+1 x("crate: could not press "..(e1 and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if e1 then c.crates=c.crates+1 aj(function()return T()~=nil end,1.5)local mB=T()
x(("OPENED %s -> %s"):format(hB,mB and ac(V(mB))or"?"))else x("discarded "..hB.." (nothing ticked in it)")end
return true end d.calls={}function d.saw(tJ,...)local tK=select("#",...)d.calls[#d.calls+1]={t=q(),m=tJ,n=tK,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(au,aY)local bf=type(au)if(bf=="string"or bf=="number")and type(aY.data)=="table"then for mC,hC in pairs(aY.data)do
if hC==au and type(mC)=="string"and(type(hC)=="string"or type(hC)=="number")then return{__slot="f:"..mC}end end
end if bf=="string"then if aY.crate and au==aY.crate then return{__slot="crate"}end if aY.title and au==aY.title then return{__slot="title"}end
if aY.rar and au==aY.rar then return{__slot="rarity"}end return au end if bf=="number"or bf=="boolean"or bf=="nil"then return au end
if bf=="table"then local mD={}for tL,mE in pairs(au)do if type(mE)=="table"then return nil,"nested table"end local tM,mF=d.slot(mE,aY)
if mF then return nil,mF end mD[tL]=tM end return mD end local tN,tO=pcall(function()return au:IsA("Instance")end)
if tN and tO then if au==F then return{__slot="player"}end if c.plot and au==c.plot then return{__slot="plot"}end
local e2=c.plot and c.plot:FindFirstChild("CrateStand")if e2 and au==e2 then return{__slot="stand"}end if e2 and au.Parent==e2 then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bf..")"end function d.resolve(e3)if type(e3)~="table"then return e3 end
local aE=e3 .__slot if aE and aE:sub(1,2)=="f:"then return d.data and d.data[aE:sub(3)]end if aE=="crate"then return d.data and d.data.name end
if aE=="title"then return(d.data and d.data.title)or d.title end if aE=="rarity"then return d.data and d.data.rarity end
if aE=="player"then return F end if aE=="plot"then return c.plot end if aE=="stand"or aE=="model"then local hD=c.plot and c.plot:FindFirstChild("CrateStand")
if aE=="stand"or not hD then return hD end for y5,mG in ipairs(hD:GetChildren())do if l8(mG.Name)then return mG end end
return nil end local mH={}for tP,tQ in pairs(e3)do mH[tP]=d.resolve(tQ)end return mH end function d.classify(hE)
if d.directOff then return end local e4={}for y6,hF in ipairs(d.calls)do if hF.t<=hE+0.05 and hE-hF.t<=6 then e4[#e4+1]=hF end
end if#e4==0 then return end if not aj(function()return(d.heldAt or 0)>=hE-1 end,2.5)then return end local c6={}
for y7,c7 in ipairs(e4)do local mI={}for mJ=1,c7 .n do local tR,mK=d.slot(c7 .args[mJ],c7)if mK then x("crate call has "..mK.." - keeping the button method")
return end mI[mJ]=tR end c6[#c6+1]={m=c7 .m,n=c7 .n,args=mI}end local hG=d.learned d.learned={seq=c6,mode=hG and hG.mode or nil}
aa.dirty=true if not hG then x(("learned how to open crates directly (%d call%s)"):format(#c6,#c6==1 and""or"s"))end
end function d.replay()local mL=d.learned local mM=ao:FindFirstChild("Remotes")local hH=mM and mM:FindFirstChild("CrateAction")
if not(mL and hH)then return false end local mN=table.unpack or unpack d.replaying=true for y8,c8 in ipairs(mL.seq)do
local hI={}for mO=1,c8 .n do hI[mO]=d.resolve(c8 .args[mO])end task.spawn(function()pcall(function()if c8 .m=="InvokeServer"then hH:InvokeServer(mN(hI,1,c8 .n))
else hH:FireServer(mN(hI,1,c8 .n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(tS)return(tS:gsub("[%%|;=,\n]",function(tT)return("%%%02X"):format(tT:byte())end))end
function d.enc(bD)local e5=type(bD)if e5=="string"then return"s"..d.esc(bD)end if e5=="number"then return"n"..tostring(bD)end
if e5=="boolean"then return bD and"b1"or"b0"end if e5=="nil"then return"z"end if bD.__slot then return"k"..bD.__slot end
local hJ={}for tU,tV in pairs(bD)do hJ[#hJ+1]=d.enc(tU).."="..d.enc(tV)end return"t"..table.concat(hJ,",")end
function d.dec(mP)local c9,c_=mP:sub(1,1),mP:sub(2)local function tW(tX)return(tX:gsub("%%(%x%x)",function(tY)return string.char(tonumber(tY,16))end))end
if c9=="s"then return tW(c_)end if c9=="n"then return tonumber(c_)end if c9=="b"then return c_=="1"end if c9=="k"then return{__slot=c_}end
if c9=="t"then local mQ={}for tZ in c_:gmatch("[^,]+")do local mR,t0=tZ:match("^(.-)=(.*)$")if mR then local mS=d.dec(mR)
if mS~=nil then mQ[mS]=d.dec(t0)end end end return mQ end return nil end function d.goneOrNew(t1)return function()
if not d.waiting then return true end local mT=T()return mT~=nil and mT~=t1 end end function d.near()local mU=ao:FindFirstChild("Remotes")
local mV=mU and mU:FindFirstChild("CrateAction")local hK=aD()local hL=c.plot and c.plot:FindFirstChild("CrateStand")
local hM=hL and hL:FindFirstChild("Spot")if not(mV and hK and hM)then return false,"no crate stand or remote"end
local hN=hK.HumanoidRootPart local e6=hN.CFrame local mW,hO=d.title,"no answer"local t2=T()local mX=hL:FindFirstChild("Holder")
local function mY()if not mX then return d.waiting or d.on end for y9,t3 in ipairs(mX:GetChildren())do if t3:IsA("Model")then return true end end
return false end for t4=1,3 do if not(d.waiting or d.on)or not mY()then d.waiting,d.on,d.quietUntil=false,false,q()+4
return true,"already gone"end if(hN.Position-hM.Position).Magnitude>8 then b7(hM,d.prompt)end af(0.12+0.15*t4)
local aL={}d.replaying=true task.spawn(function()aL.ok,aL.v=pcall(function()return mV:InvokeServer("open")end)
aL.done=true end)aj(function()return aL.done end,6)d.replaying=false local bE=aL.v if aL.done and aL.ok and type(bE)=="table"and bE.ok then
c.crates,d.fails,d.nearFails=c.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,q()+4 x(("OPENED %s -> %s (no window)"):format(mW,bE.prize and ac(V(tostring(bE.prize)))or"?"))
aj(function()local mZ=T()return mZ~=nil and mZ~=t2 end,1.5)if(hN.Position-e6 .Position).Magnitude>8 then pcall(function()b6(hK,e6 .Position,e6 .Position+e6 .LookVector)end)end
return true,"opened"end hO=(aL.done and aL.ok and type(bE)=="table")and tostring(bE.reason or"refused, no reason given")
or(aL.done and("error: "..tostring(bE))or"no answer in 6s")af(0.3)if not mY()then d.waiting,d.on,d.quietUntil=false,false,q()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 x(("crate: the server would not open %s next to the stand (%s)"):format(mW,hO))
return false,hO end function d.smart()local hP=d.title if(d.nearFails or 0)<3 then local t5=d.near()if t5 then return true end
if d.nearFails>=3 then x("opening next to the stand failed 3 times - trying the older ways")end end local bF=d.learned
if bF then local hQ=T()if d.on then d.replay()if aj(d.goneOrNew(hQ),3.5)then c.crates=c.crates+1 x("OPENED "..hP.." (direct)")
return true end else if bF.mode~="window"then d.replay()if aj(d.goneOrNew(hQ),3.5)then c.crates,d.fails=c.crates+1,0
if bF.mode~="direct"then bF.mode,aa.dirty="direct",true x("crates now open directly - the window never comes up")
end x("OPENED "..hP.." (direct, no window)")return true end end if hx()then d.replay()if aj(d.goneOrNew(hQ),3.5)then
c.crates,d.fails=c.crates+1,0 if bF.mode~="window"then bF.mode,aa.dirty="window",true x("crates need their window up first - it shows briefly")
end x("OPENED "..hP.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,aa.dirty=bF,nil,true
if d.fails>=3 then d.directOff=true x("direct crate opening failed 3 times - using the button for now")else x("the learned crate call did not work - back to pressing Open")
end end return e0(true)end function z.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end z.cache={}function z.watchCache()z.cache=z.snap()
for t6,m0 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do P(F:GetAttributeChangedSignal(m0):Connect(function()z.cache[t6]=F:GetAttribute(m0)end))
end end function z.isOn()return F:GetAttribute("AutoRollOn")==true end function z.saw(t7,...)local e7=z.cache
local t8={m=t7,n=select("#",...),args={...},before={rules=e7 .rules,stop=e7 .stop,on=e7 .on,main=e7 .main}}task.delay(1.5,function()
if c.alive then pcall(z.learnOne,t8)end end)end function z.learnOne(da)local al,db=z.snap(),da.before local e8=(al.rules~=db.rules)or(al.stop~=db.stop)
local m1=(al.on~=db.on)or(al.main~=db.main)if not e8 and not m1 then return end local m2={}for m3=1,da.n do local aA=da.args[m3]
local bG=type(aA)if bG=="string"and aA~=""and aA==al.rules then aA={__slot="rules"}elseif bG=="string"and aA~=""and e8 and aA==al.stop and al.stop~=db.stop then aA={__slot="stop"}
elseif bG=="table"then local m4={}for t9,cb in pairs(aA)do if type(cb)=="table"or(type(cb)=="userdata")then z.msg="Auto Roll sends something I cannot repeat"return
end m4[t9]=(type(cb)=="string"and cb~=""and cb==al.rules)and{__slot="rules"}or cb end aA=m4 elseif bG~="string"and bG~="number"and bG~="boolean"and bG~="nil"then
if aA==F then aA={__slot="player"}else z.msg="Auto Roll sends something I cannot repeat"return end end m2[m3]=aA
end local cc={m=da.m,n=da.n,args=m2}if e8 then local hR=false for t_=1,cc.n do local dc=cc.args[t_]if type(dc)=="table"and dc.__slot=="rules"then hR=true end
if type(dc)=="table"and not dc.__slot then for y_,m5 in pairs(dc)do if type(m5)=="table"and m5 .__slot=="rules"then hR=true end end
end end if hR then z.rec.rules={cc}else table.insert(z.rec.rules,cc)if#z.rec.rules>60 then table.remove(z.rec.rules,1)end
end end if m1 then if al.on==true then z.rec.on=cc else z.rec.off=cc end e.AutoRoll=(al.on==true)end if al.rules and al.rules~=""then e.ARrules,e.ARstop=al.rules,al.stop or""end
aa.dirty=true z.msg=""x(("learned an Auto Roll %s message"):format(e8 and"choices"or(al.on and"on"or"off")))end
function z.resolve(cd)if type(cd)~="table"then return cd end if cd.__slot=="rules"then return e.ARrules~=""and e.ARrules or F:GetAttribute("AutoRollRules")end
if cd.__slot=="stop"then return e.ARstop~=""and e.ARstop or F:GetAttribute("AutoRollStop")end if cd.__slot=="player"then return F end
local m6={}for ua,ub in pairs(cd)do m6[ua]=z.resolve(ub)end return m6 end function z.replay(m7,uc)local m8=table.unpack or unpack
for za,dd in ipairs(uc)do local hS={}for m9=1,dd.n do hS[m9]=z.resolve(dd.args[m9])end z.replaying=true pcall(function()
if dd.m=="InvokeServer"then task.spawn(function()pcall(function()m7:InvokeServer(m8(hS,1,dd.n))end)end)else m7:FireServer(m8(hS,1,dd.n))end
end)z.replaying=false task.wait(0.25)end end function z.apply(m_,ud)if z.busy or not c.alive then return end z.busy=true
pcall(function()local na=ao:FindFirstChild("Remotes")local hT=na and na:FindFirstChild("AutoRollAction")if not hT then z.msg="this game has no AutoRollAction"return end
local bh=e.AutoRoll if bh and e.ARrules~=""and F:GetAttribute("AutoRollRules")~=e.ARrules then if#z.rec.rules==0 then
z.msg="pick your Auto Roll choices once in the game's menu so I can learn them"x(z.msg)else z.replay(hT,z.rec.rules)
if aj(function()return F:GetAttribute("AutoRollRules")==e.ARrules end,4)then x("Auto Roll choices put back")else
z.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"x(z.msg)end end end if bh==z.isOn()or(not bh and not ud)then return end
local e9=bh and z.rec.on or z.rec.off if not e9 then local de=bh and z.rec.off or z.rec.on local nb=de~=nil for ue=1,de and de.n or 0 do
if type(de.args[ue])=="boolean"then nb=false end end if nb then e9=de end end if not e9 then z.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bh and"on"or"off")
x(z.msg)return end z.replay(hT,{e9})if aj(function()return z.isOn()==bh end,4)then z.msg=""x(("Auto Roll switched %s%s"):format(bh and"ON"or"OFF",m_ and(" ("..m_..")")or""))
else z.msg="Auto Roll did not switch - do it once in the game so I can relearn it"x(z.msg)end end)z.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local uf,ug=pcall(function()return F.UserId end)return uf and ug or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local uh,hU=pcall(function()return require(ao:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if uh and type(hU)=="table"and type(hU.Pets)=="table"then j.I=hU end return j.I end function j.order()if j.list then return j.list end
local bi=j.info()if not bi then return{}end local bH={}if type(bi.Order)=="table"and#bi.Order>0 then for zb,nc in ipairs(bi.Order)do if bi.Pets[nc]then bH[#bH+1]=nc end end
else for ui in pairs(bi.Pets)do bH[#bH+1]=ui end table.sort(bH,function(uj,uk)return(bi.Pets[uj].price or 0)<(bi.Pets[uk].price or 0)end)
end j.list=bH return bH end function j.nice(nd,hV)local ne=j.info()local nf=ne and ne.Pets[nd]return((hV and hV~="")and(hV.." ")or"")..(nf and nf.displayName or tostring(nd))
end function j.data()local e_=F:GetAttribute("PetsData")if type(e_)~="string"then return nil end if e_==j.rawD then return j.lastD end
local ul,df=pcall(function()return j.HS:JSONDecode(e_)end)df=(ul and type(df)=="table")and df or nil j.rawD,j.lastD=e_,df
return df end function j.pen()return ao:FindFirstChild("PetMeadowSpawns")end function j.srv()return aC:GetServerTimeNow()end
function j.money()local hW=F:FindFirstChild("MoneyValue")if hW and type(hW.Value)=="number"then return hW.Value end
return aR()or 0 end function j.wishes()local ng=j.pen()local nh=ng and ng:GetAttribute("Wishes")local hX,ni={},j.srv()
if type(nh)~="string"then return hX end local um,nj=pcall(function()return j.HS:JSONDecode(nh)end)if um and type(nj)=="table"then
for uo,hY in pairs(nj)do if type(hY)=="number"and hY>ni then hX[uo]=hY-ni end end end return hX end function j.call(...)
local nk=ao:FindFirstChild("Remotes")local nl=nk and nk:FindFirstChild("PetRequest")if not nl then return nil end
local nm=table.pack(...)local bI={}task.spawn(function()bI.ok,bI.v=pcall(function()return nl:InvokeServer(table.unpack(nm,1,nm.n))end)
bI.done=true end)local up=q()while not bI.done and q()-up<6 do task.wait(0.05)end if bI.done and bI.ok then return bI.v end
return nil end function j.want(uq)return e.Pets[uq]end function j.closeNaming(hZ)local no=pcall(function()local nn=F:FindFirstChild("PlayerScripts")
local ur=nn and nn:FindFirstChild("Naming",true)require(ur).close()end)af(0.5)if hZ.Visible then pcall(function()local np=hZ:FindFirstChild("NameBox",true)if np then np:ReleaseFocus()end end)
hZ.Visible=false no=false end return no end function j.skipNaming()j.namingUntil=q()+10 if j.namingOn then return end
j.namingOn=true task.spawn(function()while c.alive and q()<j.namingUntil do local nq=F:FindFirstChildOfClass("PlayerGui")
local nr=nq and nq:FindFirstChild("MainGui")local fa=nr and nr:FindFirstChild("PetNameGui")if fa and fa.Visible then
af(0.4)if fa.Visible then j.namingShut=(j.namingShut or 0)+1 pcall(j.closeNaming,fa)break end end af(0.25)end
j.namingOn=false end)end function j.buyTick()if not e.PetBuy then j.buyMsg="auto adopt is off"return end local h0,ns,fb=j.info(),j.pen(),j.data()
if not(h0 and ns and fb)then j.buyMsg="pet data not loaded yet"return end j.tryAt=j.tryAt or{}local dg,h1=#(fb.pets or{}),tonumber(fb.maxOwned)or 60
local us,nt,dh=j.srv(),{},nil for zc,aF in ipairs(ns:GetChildren())do nt[aF.Name]=true local bJ,fc=aF:GetAttribute("Pet"),aF:GetAttribute("Variant")or""
local h2=bJ and j.want(bJ)if h2 and h2 .b and h0 .Pets[bJ]and(not h2 .g or fc=="Big")and y.wantMore(bJ,fc,fb)and not aF:GetAttribute("A_"..j.uid)
and(tonumber(aF:GetAttribute("ExpiresAt"))or 0)>us+1 and q()>=(j.tryAt[aF.Name]or 0)then local di,nu=j.nice(bJ,fc),h0 .Pets[bJ].price or 0
if dg>=h1 then dh=("%s is in the pen, but you have %d/%d pets"):format(di,dg,h1)j.tryAt[aF.Name]=q()+15 elseif j.money()<nu then
dh=("%s is in the pen - need $%s"):format(di,ay(nu))j.tryAt[aF.Name]=q()+5 else j.tryAt[aF.Name]=q()+8 local bj=j.call("adopt",aF.Name)
if type(bj)=="table"and bj.ok then dg=dg+1 j.buys=(j.buys or 0)+1 j.recent=j.recent or{}local ut=type(bj.pet)=="table"and bj.pet or{}
table.insert(j.recent,{id=tostring(ut.id or("?"..q())),name=bJ,variant=fc,at=q()})if#j.recent>30 then table.remove(j.recent,1)end
x("ADOPTED "..di)j.skipNaming()dh="adopted "..di else local nv=type(bj)=="table"and tostring(bj.reason or"no reason given")or"no answer"
x(("adopt %s failed: %s"):format(di,nv))dh="adopt failed: "..nv if type(bj)=="table"and bj.bagFull then j.tryAt[aF.Name]=q()+60 end
end end end end for nw in pairs(j.tryAt)do if not nt[nw]then j.tryAt[nw]=nil end end j.buyMsg=dh or("watching the pen (%d/%d pets)"):format(dg,h1)
end function j.wishTick()if not e.PetWish then j.wishMsg="auto wish is off"return end local fd=j.info()if not(fd and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local fe,h3,bk=j.wishes(),0,nil local uu=(type(fd.Wish)=="table"and fd.Wish.cashShare)or 2
local uv=j.data()for zd,aq in ipairs(j.order())do local nx=j.want(aq)if nx and nx.w and y.wantMore(aq,"",uv)then
h3=h3+1 if not fe[aq]and q()>=(j.wishTry[aq]or 0)then local h4=tonumber(F:GetAttribute("PetWishCredits"))or 0
local h5=math.floor((fd.Pets[aq].price or 0)*uu)if h4<=0 and j.money()<h5 then j.wishTry[aq]=q()+10 bk=("need $%s to wish for %s"):format(ay(h5),j.nice(aq))
j.wishWhy[aq]=bk else j.wishTry[aq]=q()+3 local uw=h4>0 and"wishCredit"or"wish"local ff=j.call(uw,aq)if type(ff)=="table"and ff.ok then
j.wishN,j.wishWhy[aq]=j.wishN+1,nil x(("WISHED for %s (%s)"):format(j.nice(aq),h4>0 and"free wish"or("$"..ay(h5))))
else local h6=type(ff)=="table"and tostring(ff.reason or"no reason given")or"no answer"if h6:lower():find("already",1,true)then j.wishTry[aq]=q()+2
else x(("wish %s failed: %s"):format(j.nice(aq),h6))bk="wish failed: "..h6 end end end end end end if not bk then
for ze,fg in ipairs(j.order())do local ny=j.want(fg)if ny and ny.w and not fe[fg]and j.wishWhy[fg]then bk=j.wishWhy[fg]break end
end end if not bk then local fh={}for zf,fi in ipairs(j.order())do local nz=j.want(fi)if nz and nz.w and fe[fi]then fh[#fh+1]=("%s %dm"):format(j.nice(fi),math.ceil(fe[fi]/60))end
end bk=h3==0 and"no pet has WISH ticked"or("running: "..(#fh>0 and table.concat(fh,", ")or"none yet"))end j.wishMsg=bk
end o.switches,o.glazed,o.finished=0,0,0 o.done,o.doneN,o.later={},0,{}function o.teams()local h7=j.data()return(h7 and h7 .teams)or{},h7
end function o.current(ce)ce=ce or j.data()if not ce then return""end local nA={}for zg,ux in ipairs(ce.equipped or{})do nA[tostring(ux)]=true end
for zh,nB in ipairs(ce.teams or{})do local nC=nB.pets or{}local h8=#nC==#(ce.equipped or{})if h8 then for zi,uy in ipairs(nC)do if not nA[tostring(uy)]then h8=false break end end end
if h8 then return nB.name end end return""end function o.equip(h9)local uz,uA=o.teams()local h_ for uB,uC in ipairs(uz)do if uC.name==h9 then h_=uB break end end
if not h_ then o.msg="no saved team called "..tostring(h9)return false end if o.current(uA)==h9 then return true end
for zj=1,4 do local nD=j.call("teamEquip",h_)if type(nD)=="table"and nD.ok then o.switches=o.switches+1 return true
end task.wait(0.4)end return false end function o.left(uD)local nE=uD:FindFirstChild("SquishyPlaceHolder")local nF=nE and nE:FindFirstChild("TimerGui")
local nG=nF and nF:FindFirstChildWhichIsA("TextLabel",true)local ia=nG and nG.Text if type(ia)~="string"or ia:find("-",1,true)then return nil end
local ib,nH,nI=ia:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not ib then return nil end local nJ=nI~=""and(tonumber(ib)*3600+tonumber(nH)*60+tonumber(nI))or(tonumber(ib)*60+tonumber(nH))
return nJ>0 and nJ or nil end function o.waxes()local dj={}local nK=c.plot and c.plot:FindFirstChild("WaxStations")
if not nK then return dj end local nL=j.srv()for zk,aM in ipairs(nK:GetChildren())do local ic=tonumber(aM:GetAttribute("PourEnd"))
local nM=aM:GetAttribute("PourOwner")if aM:GetAttribute("HasSquishy")and aM:GetAttribute("PourId")and(nM==nil or nM==j.uid)then
local ie=o.left(aM)local nN=ie and(nL+ie)or((ic and ic>nL)and ic or nil)if nN then local nO,nP=aM:FindFirstChild("SquishyPlaceHolder"),"?"
if nO then for zl,nQ in ipairs(nO:GetChildren())do if nQ:IsA("Model")then nP=nQ.Name break end end end local uE=tostring(aM:GetAttribute("Helpers")or"")
local ig=0 for zm in uE:gmatch("%d+")do ig=ig+1 end dj[#dj+1]={st=aM,ends=nN,sure=ie~=nil,id=aM:GetAttribute("PourId"),name=nP,helps=ig,
long=aM:GetAttribute("PourLong")==true}end end end table.sort(dj,function(uF,uG)return uF.ends<uG.ends end)return dj
end function o.glazeCount()local nR=ao:FindFirstChild("Remotes")local nS=nR and nR:FindFirstChild("EditStack")
if not nS then return nil end local uH,dk=pcall(function()return nS:InvokeServer("State",nil)end)if not(uH and type(dk)=="table"and type(dk.state)=="table")then return nil end
local ih,ii=0,{}for zn,fj in ipairs(dk.state.entries or{})do if fj.glaze and fj.glaze~=""then ih=ih+1 ii[fj.glaze]=(ii[fj.glaze]or 0)+1 end
end return ih,ii,#(dk.state.entries or{}),dk.state.capacity end function o.finishedOne(fk,nT)o.finished=o.finished+1
task.wait(2)local ij,uI,nU,uJ=o.glazeCount()if ij and nT and ij>nT then o.glazed=o.glazed+1 local ik={}for uK,uL in pairs(uI)do ik[#ik+1]=uK.." "..uL end
x(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ac(V(fk.name)),fk.st.Name,ij,table.concat(ik,", ")))
else x(("wax done on station %s: %s, no glaze%s"):format(fk.st.Name,ac(V(fk.name)),nU and(" (stack "..nU.."/"..tostring(uJ)..")")or""))
end end function o.tick()o.list=o.waxes()if o.editing and q()-(o.editingSince or q())>120 then o.editing=false end
if o.editing then o.msg="rebuilding teams..."return end if not e.Teams then o.want,o.msg="","auto teams is off"return end
local cf=j.srv()local av=o.glazeFor if av then local dl=av.st local nV=dl.Parent and dl:GetAttribute("HasSquishy")and dl:GetAttribute("PourId")==av.id
local nW=nV and o.left(dl)if nW then av.ends=cf+nW end if not nV then o.glazeFor,o.afterUntil=nil,q()+1.5 if not o.done[av.id or"?"]then
o.done[av.id or"?"],o.doneN=true,o.doneN+1 if o.doneN>400 then o.done,o.doneN={[av.id or"?"]=true},1 end local uM=av.before
task.spawn(function()pcall(o.finishedOne,av,uM)end)end elseif av.ends-cf>e.GlazeLead*3+60 or cf>av.ends+90 then
o.glazeFor,o.afterUntil=nil,q()+1.5 o.later[av.id or"?"]=q()+120 x(("station %s is not finishing yet (%s left) - glaze team off again"):format(dl.Name,o.clock(av.ends-cf)))
end end if e.TeamGlaze~=""and not o.glazeFor then local uN=o.speedRatio(e.TeamGlaze)for zo,bK in ipairs(o.list)do
if bK.sure and(bK.ends-cf)*uN[bK.long and 2 or 1]<=e.GlazeLead and q()>=(o.later[bK.id or"?"]or 0)and not o.done[bK.id or"?"]then
o.glazeFor=bK task.spawn(function()bK.before=o.glazeCount()end)break end end end local aB,fl="",""if e.TeamGlaze~=""and(o.glazeFor or q()<(o.afterUntil or 0))then
aB,fl=e.TeamGlaze,o.glazeFor and(" - station "..o.glazeFor.st.Name.." finishes soon")or""elseif e.TeamWax~=""and(o.placing or o.aboutToPlace())then
aB,fl=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and o.allBusy()then aB,fl=e.TeamFull," - every station is busy"
else aB=e.TeamNormal end o.want=aB local dm=o.current()o.cur=dm if aB~=""and dm~=aB and q()>=(o.nextTry or 0)then
o.nextTry=q()+1.1 if o.equip(aB)then x("team: "..aB..fl)else o.nextTry=q()+3 end end local il=o.list[1]o.msg=("on: %s%s | next wax done %s"):format(dm~=""and dm or"(not a saved team)",(aB~=""and aB~=dm)and(" -> "..aB)or"",
il and("in "..o.clock(il.ends-cf).." (st "..il.st.Name..")")or"- none running")end function o.clock(bl)bl=math.max(0,math.floor(bl))
if bl>=3600 then return("%d:%02d:%02d"):format(math.floor(bl/3600),math.floor((bl%3600)/60),bl%60)end return("%d:%02d"):format(math.floor(bl/60),bl%60)
end function o.allBusy()local uO,uP=ed()return uP>0 and uO==0 end function o.aboutToPlace()if not c.running then return false end
local nX=T()if not(nX and aQ(nX))then return false end local uQ=ed()return uQ>0 end function o.mult(nY,uR,nZ)return{(1+nY)*(1+nZ),(1+nY+uR)*(1+nZ)}end
function o.speedNow()local function im(uS)return tonumber(F:GetAttribute(uS))or 0 end return o.mult(im("PetWaxSpeed"),im("PetLongWax"),im("PetSocialWax"))
end function o.speedOf(uT)local uU,n0=o.teams()if not n0 then return nil end for zp,n1 in ipairs(uU)do if n1 .name==uT then
local io={}for zq,uV in ipairs(n1 .pets or{})do for zr,n2 in ipairs(n0 .pets or{})do if tostring(n2 .id)==tostring(uV)then io[#io+1]=n2 break end end
end local n3=y.caps()local n4,uW=y.stats(io)return o.mult(math.min(n4 .waxSpeed or 0,n3 .waxSpeed or 0.25),math.min(n4 .longWax or 0,n3 .longWax or 0.3),uW.socialWax or 0)
end end return nil end function o.speedRatio(uX)local n5,ip=o.speedNow(),o.speedOf(uX)if not ip then return{1,1}end
return{n5[1]/ip[1],n5[2]/ip[2]}end function o.glazeSoon()return e.Teams and e.TeamGlaze~=""and(o.glazeFor~=nil or q()<(o.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function y.caps()local iq=j.info()return(iq and type(iq.Caps)=="table")and iq.Caps or y.CAPS
end function y.value(n6,ir)local fm=j.info()local cg=fm and fm.Pets[n6]if not(cg and type(cg.boost)=="table")then return nil end
local bL if type(fm.boostValue)=="function"then local uY,uZ=pcall(fm.boostValue,n6,(ir~=""and ir)or nil)bL=uY and tonumber(uZ)or nil
end if not bL then bL=cg.boost.value or 0 if ir=="Big"then local n7=bL*1.5 bL=y.ROUND[cg.boost.kind]and math.max(bL+1,math.floor(n7+0.5))or n7
end end return cg.boost.kind,bL,cg.boost.every end function y.stats(u0)local bM,is={},{}for zs,n8 in ipairs(u0)do
local aG,fn,n9=y.value(n8 .name,n8 .variant or"")if aG then if aG:sub(1,6)=="social"then is[aG]=math.max(is[aG]or 0,fn)
elseif aG=="waxStir"or aG=="cashGift"then bM[aG]=(bM[aG]or 0)+fn*60/(n9 or 60)elseif aG=="luckyPull"then bM.luckyPull=(bM.luckyPull or 0)+fn/(n9 or 10)
else bM[aG]=(bM[aG]or 0)+fn end end end return bM,is end function y.glazeGain(u1,fo)local dn,it,zt={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local u2=dn[1]+dn[2]+dn[3]local u3=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local ci={}for fp=1,3 do ci[fp]=dn[fp]+u1*dn[fp]/u2+(fp==1 and u3 or 0)end
local iu={ci[1]*(1-fo),ci[2]*(1-fo)+ci[1]*fo,ci[3]+ci[2]*fo}return iu[1]*(it[1]-1)+iu[2]*(it[2]-1)+iu[3]*(it[3]-1)
end function y.score(fq,u4)local iv=y.caps()local fr,fs=y.stats(u4)local function bm(n_)return math.min(fr[n_]or 0,iv[n_]or math.huge)end
local u5=(1+bm("income"))*(1+(fs.socialIncome or 0))*(1+math.min(fr.cashGift or 0,iv.cashGiftPerMinute or 9)/60)
local u6=1+bm("luck")+(fr.luckyPull or 0)+(fs.socialLuck or 0)local oa=u6*(1+bm("newFind"))local dp=math.log(u5)
local u7=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local iw=(1+bm("waxSpeed")+bm("longWax"))*(1+(fs.socialWax or 0))
+math.min(fr.waxStir or 0,iv.waxStirPerMinute or 30)/60/u7 local u8=1-(1-bm("headStart"))*(1-(fs.socialHeadStart or 0))
if fq=="farm"then return dp+0.7*math.log(oa)+0.1*math.log(iw)end if fq=="full"then return dp+0.4*math.log(iw)+0.02*math.log(oa)end
if fq=="glaze"then return y.glazeGain(bm("glaze"),bm("glazeUp"))+0.001*dp end if fq=="wax"then return-math.log(1-0.5*u8)+0.001*dp+0.001*math.log(iw)end
return dp end function y.best(ob,cj,u9,ix)ix=ix or{}local am,dq={},{}local function oc(u_)local od={}for va,vb in ipairs(u_)do od[va]=cj[vb]end return od end
local function iy(oe)local iz=y.score(ob,oc(oe))for zu,vc in ipairs(oe)do if ix[cj[vc].id]then iz=iz+1e-7 end end
return iz end for zv=1,math.min(u9,#cj)do local ft,iA for iB=1,#cj do if not dq[iB]then am[#am+1]=iB local of=iy(am)
am[#am]=nil if not iA or of>iA+1e-12 then ft,iA=iB,of end end end if not ft then break end dq[ft]=true am[#am+1]=ft
end for zw=1,6 do task.wait()local og,oh=false,iy(am)for iC=1,#am do for iD=1,#cj do if not dq[iD]then local oi=am[iC]
am[iC]=iD local oj=iy(am)if oj>oh+1e-9 then dq[oi],dq[iD],oh,og=nil,true,oj,true else am[iC]=oi end end end end
if not og then break end end local ol={}for vd,ve in ipairs(am)do ol[vd]=tostring(cj[ve].id)end return ol,y.score(ob,oc(am))
end function y.count(om,oo,vf)local dr,ds={},0 local op,oq={},{}for zx,vg in ipairs(oo.arriving or{})do op[tostring(vg)]=true end
for zy,ck in ipairs(oo.pets or{})do oq[tostring(ck.id)]=true if ck.name==om and not op[tostring(ck.id)]then if ck.variant=="Big"then ds=ds+1 elseif(ck.variant or"")==""then dr[#dr+1]=ck end
end end if not vf then for zz,dt in ipairs(j.recent or{})do if dt.name==om and not oq[dt.id]and q()-dt.at<20 then
if dt.variant=="Big"then ds=ds+1 else dr[#dr+1]=dt end end end end return dr,ds end function y.goal(vh)local ot=e.Pets[vh]return ot and tonumber(ot.f)or 0 end
function y.wantMore(ou,vi,ov)local iE=y.goal(ou)if iE<=0 or not ov then return true end local vj,ow=y.count(ou,ov)
if ow>=iE then return false end if vi=="Big"then return true end return#vj<y.need()*(iE-ow)end function y.status(ox,oy)
local fu=y.goal(ox)if fu<=0 or not oy then return nil end local vk,iF=y.count(ox,oy)if iF>=fu then return("Big %d/%d done"):format(iF,fu)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#vk,y.need()),y.need(),iF,fu)end function y.wear(iG)local iH={}
for zA,vl in ipairs(iG)do iH[tostring(vl)]=true end for zB=1,3 do local cl=j.data()if not cl then return false end
for zC,oz in ipairs(cl.equipped or{})do if not iH[tostring(oz)]then j.call("unequip",oz)task.wait(0.3)end end
cl=j.data()local oA={}for zD,vm in ipairs(cl.equipped or{})do oA[tostring(vm)]=true end for zE,oB in ipairs(iG)do
if not oA[tostring(oB)]then j.call("equip",oB)task.wait(0.3)end end task.wait(0.4)cl=j.data()local iI,oC=0,true
for zF,vn in ipairs(cl.equipped or{})do iI=iI+1 if not iH[tostring(vn)]then oC=false end end if oC and iI==#iG then return true end
end return false end function y.saveTeam(oD,oE)if not y.wear(oE)then return false,"could not put the pets on"end
local vo=o.teams()local bN for vp,vq in ipairs(vo)do if vq.name==oD then bN=vp break end end local cm if bN then
cm=j.call("teamSave",bN)else cm=j.call("teamNew")if type(cm)=="table"and cm.ok and cm.index then bN=cm.index task.wait(0.3)
j.call("teamRename",{index=bN,name=oD})end end task.wait(0.4)local iJ=j.data()local oF=iJ and iJ.teams and bN and iJ.teams[bN]
if not oF then return false,"the game did not save it"end local oG={}for zG,vr in ipairs(oF.pets or{})do oG[tostring(vr)]=true end
for zH,vs in ipairs(oE)do if not oG[tostring(vs)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if o.placing or o.glazeSoon()then return false end local vt=j.srv()for zI,vu in ipairs(o.list or{})do if vu.ends-vt<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local du=j.data()if not du then return{}end local oH={}for zJ,vv in ipairs(du.arriving or{})do oH[tostring(vv)]=true end
local dv={}for zK,fv in ipairs(du.pets or{})do if not oH[tostring(fv.id)]then dv[#dv+1]={id=tostring(fv.id),name=fv.name,variant=fv.variant or""}end
end local oI={}for zL,oJ in ipairs(dv)do oI[oJ.id]=oJ end local oK=tonumber(du.slots)or 3 local iK,oL={},{}for zM,fw in ipairs(y.ROLES)do
local dw=e[fw[1]]if dw~=""and not oL[dw]then oL[dw]=true local iL,dx,oM={},{},false for zN,oN in ipairs(du.teams or{})do
if oN.name==dw then for zO,vw in ipairs(oN.pets or{})do local iM=oI[tostring(vw)]if iM then iL[iM.id]=true dx[#dx+1]=iM else oM=true end
end end end local iN,oO=y.best(fw[2],dv,oK,iL)local oP=y.score(fw[2],dx)local oQ=#iN==#dx for zP,vx in ipairs(iN)do if not iL[vx]then oQ=false end end
if not oQ and(oM or#dx<math.min(oK,#dv)or oO>oP+1e-4)then iK[#iK+1]={team=dw,role=fw[2],ids=iN,gain=oO-oP}end
end end return iK end function y.rebuild(vy)local oR=y.plan()if#oR==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end o.editing,o.editingSince=true,q()
local fy=true local vC,vD=pcall(function()for zQ,dy in ipairs(oR)do local vz,vA=y.saveTeam(dy.team,dy.ids)local oS=j.data()
local iO={}for zR,vB in ipairs(dy.ids)do for zS,iP in ipairs(oS and oS.pets or{})do if tostring(iP.id)==vB then iO[#iO+1]=j.nice(iP.name,iP.variant)end
end end if vz then x(("TEAM %s rebuilt (%s): %s"):format(dy.team,vy or"pets changed",table.concat(iO,", ")))else fy=false x(("TEAM %s: %s"):format(dy.team,tostring(vA)))end
end end)o.editing,o.nextTry=false,0 if not vC then fy=false x("TEAM BUILD ERR "..tostring(vD))end y.builds=y.builds+1
y.buildMsg=fy and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fy end
function y.fuseTick()if not e.AutoFuse or o.editing then return end local fz=j.data()if not fz then return end
local iQ=y.need()local iR,fA={},{}for zT,vE in ipairs(fz.teams or{})do for zU,vF in ipairs(vE.pets or{})do iR[tostring(vF)]=true end end
for zV,vG in ipairs(fz.equipped or{})do fA[tostring(vG)]=true end y.failUntil=y.failUntil or{}for bO,vH in pairs(e.Pets)do
local oT=tonumber(vH.f)or 0 local iS,vI=y.count(bO,fz,true)if oT>0 and vI<oT and#iS>=iQ and q()>=(y.failUntil[bO]or 0)then
table.sort(iS,function(fB,fC)local oU=(fA[tostring(fB.id)]and 4 or 0)+(iR[tostring(fB.id)]and 2 or 0)+(fB.named and 1 or 0)
local oV=(fA[tostring(fC.id)]and 4 or 0)+(iR[tostring(fC.id)]and 2 or 0)+(fC.named and 1 or 0)if oU~=oV then return oU<oV end
return tostring(fB.id)<tostring(fC.id)end)local fD,iT={},{}for fE=1,iQ do fD[fE]=tostring(iS[fE].id)if fA[fD[fE]]then iT[#iT+1]=fD[fE]end
end o.editing,o.editingSince=true,q()for zW,vJ in ipairs(iT)do j.call("unequip",vJ)task.wait(0.3)end local fF=j.call("fuse",{ids=fD})
o.editing,o.nextTry=false,0 if type(fF)=="table"and fF.ok then y.fused=y.fused+1 y.dirtyAt=q()x(("FUSED %d %s -> Big %s"):format(iQ,j.nice(bO),j.nice(bO)))
y.fuseMsg=("fused a Big %s %s"):format(j.nice(bO),os.date("%H:%M"))else y.failUntil[bO]=q()+120 x(("fuse %s failed: %s"):format(j.nice(bO),type(fF)=="table"and tostring(fF.reason or"no reason given")or"no answer"))
end return end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end local oW=j.data()
if not oW then return end local bP={}for zX,vK in ipairs(oW.pets or{})do bP[#bP+1]=tostring(vK.id)end table.sort(bP)
bP=table.concat(bP,",")if bP~=y.sig then y.sig,y.dirtyAt=bP,q()end local vL=(y.dirtyAt and q()-y.dirtyAt>8)or q()-(y.lastBuild or 0)>900
if vL and not o.editing then local vM=y.rebuild(y.dirtyAt and"pets changed"or"check")if vM then y.dirtyAt,y.lastBuild=nil,q()end
end end r.bb,r.fx,r.post,r.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}r.watch=setmetatable({},{__mode="k"})
r.mem,r.memPeak,r.fps=0,0,0 function r.isFx(bQ)return bQ:IsA("ParticleEmitter")or bQ:IsA("Trail")or bQ:IsA("Beam")or bQ:IsA("Fire")or bQ:IsA("Smoke")
or bQ:IsA("Sparkles")or bQ:IsA("Light")end function r.muteOne(aw)if not e.Lite or not aw.Parent then return end
local fG=(aw:IsA("BillboardGui")and r.bb)or(r.isFx(aw)and r.fx)or nil if not fG or fG[aw]~=nil then return end
fG[aw]=aw.Enabled if aw.Enabled then aw.Enabled=false end r.watch[aw]=aw:GetPropertyChangedSignal("Enabled"):Connect(function()
if e.Lite and aw.Enabled then fG[aw]=true aw.Enabled=false end end)end function r.lite(oX)e.Lite=oX if oX then
task.spawn(function()for vN,vO in ipairs(aC:GetDescendants())do if not e.Lite then return end pcall(r.muteOne,vO)
if vN%600==0 then task.wait()end end end)if not r.addConn then r.queue={}r.addConn=P(aC.DescendantAdded:Connect(function(iU)
if e.Lite and(iU:IsA("BillboardGui")or r.isFx(iU))then r.queue[#r.queue+1]=iU end end))end local iV=game:GetService("Lighting")
for zY,dz in ipairs(iV:GetChildren())do if dz:IsA("PostEffect")and dz.Enabled and r.post[dz]==nil then r.post[dz]=true dz.Enabled=false end
end pcall(function()r.oldShadows=r.oldShadows==nil and iV.GlobalShadows or r.oldShadows iV.GlobalShadows=false end)
pcall(function()r.oldDeco=r.oldDeco==nil and aC.Terrain.Decoration or r.oldDeco aC.Terrain.Decoration=false end)
else for zZ,vP in pairs(r.watch)do pcall(function()vP:Disconnect()end)end for oY,vQ in pairs(r.bb)do pcall(function()if oY.Parent then oY.Enabled=vQ end end)end
for oZ,vR in pairs(r.fx)do pcall(function()if oZ.Parent then oZ.Enabled=vR end end)end for o0 in pairs(r.post)do pcall(function()if o0 .Parent then o0 .Enabled=true end end)end
r.bb,r.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})r.watch,r.post,r.queue=setmetatable({},{__mode="k"}),{},{}
local vS=game:GetService("Lighting")if r.oldShadows~=nil then pcall(function()vS.GlobalShadows=r.oldShadows end)r.oldShadows=nil end
if r.oldDeco~=nil then pcall(function()aC.Terrain.Decoration=r.oldDeco end)r.oldDeco=nil end end end r.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function r.hideHud(o1)e.HideHud=o1 local iW=F:FindFirstChildOfClass("PlayerGui")if not iW then return end if o1 then
for z0,dA in ipairs(iW:GetChildren())do if dA:IsA("ScreenGui")and not r.MINE[dA.Name]and dA.Enabled then r.hud[dA]=true dA.Enabled=false end
end if not r.hudConn then r.hudConn=P(iW.ChildAdded:Connect(function(dB)if e.HideHud and dB:IsA("ScreenGui")and not r.MINE[dB.Name]then
task.defer(function()if e.HideHud and dB.Enabled then r.hud[dB]=true dB.Enabled=false end end)end end))end else
for o2 in pairs(r.hud)do pcall(function()if o2 .Parent then o2 .Enabled=true end end)end r.hud={}end end r.CAPS={0,30,15,10}
function r.cap(iX)e.FpsCap=iX local o3=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not o3 then return false end return pcall(o3,iX==0 and 60 or iX)end function r.render(o4)e.NoRender=o4 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not o4)end)
end function r.restoreAll()pcall(r.lite,false)pcall(r.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(r.cap,0)end end function r.rejoinSame(o5)if c.rejoining then return end x("REJOIN this server ("..o5 ..")")
pcall(eg)if c.autoload then pcall(eF,c.autoload)end g7()local vT=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then cR(o5 ..", same server failed")end end)return vT end function r.tick()
local iY=r.queue if e.Lite and iY and#iY>0 then r.queue={}for vU,vV in ipairs(iY)do pcall(r.muteOne,vV)if vU%300==0 then task.wait()end end
end local o6=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if o6 then for z1,vW in ipairs(o6:GetChildren())do
local o7=vW:FindFirstChild("SquishyPlaceHolder")local bR=o7 and o7:FindFirstChild("TimerGui")if bR and bR:IsA("BillboardGui")then
if r.bb[bR]==nil then pcall(r.muteOne,bR)elseif bR.Enabled then r.bb[bR]=true bR.Enabled=false end end end end
local vX,dC=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if vX and type(dC)=="number"then
r.mem=dC r.memPeak=math.max(r.memPeak,dC)if(e.MemLimit or 0)>0 and dC>e.MemLimit then r.over=(r.over or 0)+1 if r.over>=30 and not c.busy then
r.over=-600 r.rejoinSame(("memory %d MB > %d MB"):format(dC,e.MemLimit))end elseif(r.over or 0)>0 then r.over=0
end end if q()-(r.noteAt or 0)>1800 then r.noteAt=q()x(("health: %d fps, %d MB (peak %d)"):format(math.floor(r.fps+0.5),r.mem,r.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function iZ(fH)if type(fH)~="string"then return false end
fH=fH:lower()for z2,vY in ipairs(c.sellWords)do if fH:find(vY,1,true)then return true end end return false end
local function vZ()local o8=ao:FindFirstChild("Remotes")local i0=o8 and o8:FindFirstChild("SellSquishy")if not(i0 and i0:IsA("RemoteEvent"))then return false end
if not pcall(function()i0:FireServer()end)then return false end return aj(function()return T()==nil end,1.5)end
local function v0()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if q()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=q()local o9=aD()local o_=o9 and o9 .HumanoidRootPart.Position local dD,pa for z3,cn in ipairs((c.plot or aC):GetDescendants())do
if cn:IsA("ProximityPrompt")and(iZ(cn.ActionText)or iZ(cn.ObjectText)or iZ(cn.Name))then local pb=kx(cn)local i1=(pb and o_)and(pb-o_).Magnitude or 1e9
if i1<=400 and(not dD or i1<pa)then dD,pa=cn,i1 end end end c.sellSpot=dD c.noSellSpot=(dD==nil)return dD end
local function pc()local i2=T()if not i2 then c.holding=false return false end if aQ(i2)then return false end
local i3=ac(V(i2))if vZ()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=q()+2.5,0
x("SOLD "..i3)return true end local co=v0()if co then local pd=cE(co)if pd then b7(pd,co)local pe=T()if pe and not aQ(pe)then
local v1,v2=eR(co,function()return T()==nil end,function()return co.Enabled end)if v1 then c.sold,c.holding,c.sellFails=c.sold+1,false,0
x(("SOLD %s at %s via %s"):format(i3,eb(co),v2))return true end end end end c.sellFails=c.sellFails+1 x("could not sell "..i3 .." ("..c.sellFails..")")
return false end local v3={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function v4(cp)local fI=eb(cp):lower()for z4,v5 in ipairs(v3)do if fI:find(v5,1,true)then return 0 end end
local aN,ad=cp.Name:lower(),0 local function aH(v6,v7)return v6:find(v7,1,true)~=nil end if aH(aN,"collect")then ad=ad+60 end
if aH(aN,"cash")or aH(aN,"money")then ad=ad+45 end if aH(aN,"income")or aH(aN,"claim")then ad=ad+35 end if aH(aN,"coin")or aH(aN,"earn")or aH(aN,"green")then ad=ad+20 end
if aN=="pad"or aN=="touch"then ad=ad+25 end if ad==0 and(aH(fI,"collect")or aH(fI,"cash")or aH(fI,"money"))then ad=25 end
if ad==0 then return 0 end local dE=cp.Color if dE.G>0.5 and dE.G>dE.R*1.4 and dE.G>dE.B*1.4 then ad=ad+15 end
if math.min(cp.Size.X,cp.Size.Y,cp.Size.Z)<2 then ad=ad+5 end return ad end local function v8()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or q()-c.padSearchAt<20 then return nil end c.padSearchAt=q()local fJ,dF,i4={},nil,29 for z5,fK in ipairs(c.plot:GetDescendants())do
if fK:IsA("BasePart")then local fL=v4(fK)if fL>0 then fJ[#fJ+1]={s=fL,p=fK}if fL>i4 then dF,i4=fK,fL end end end
end table.sort(fJ,function(v9,v_)return v9 .s>v_.s end)c.padCands,c.padPart=fJ,dF if dF then x("collect pad: "..eb(dF).." (score "..i4 ..")")end
return dF end local i5="SAB_pad_v1.txt"local function wa(wb)if type(writefile)=="function"then pcall(writefile,i5,table.concat({wb:GetComponents()},","))end
end local function wc()if type(isfile)~="function"or type(readfile)~="function"then return nil end local wd,pf=pcall(function()if isfile(i5)then return readfile(i5)end end)
if not wd or type(pf)~="string"then return nil end local fM={}for we in pf:gmatch("[^,]+")do fM[#fM+1]=tonumber(we)end
if#fM==12 then return CFrame.new(unpack(fM))end end local function wf(i6,fN,wg)local wh=hf(i6)local i7=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aI=(i7 and i7:IsA("BasePart"))and(i7 .Position-fN)or Vector3 .new(1,0,0)aI=Vector3 .new(aI.X,0,aI.Z)if aI.Magnitude<0.05 then aI=Vector3 .new(1,0,0)end
aI=aI.Unit for wi=0,7 do local fO=wi*math.pi/4 local wj=Vector3 .new(aI.X*math.cos(fO)-aI.Z*math.sin(fO),0,aI.X*math.sin(fO)+aI.Z*math.cos(fO))
local fP=fN+wj*(wg+5)local i8=lO(fP.X,fN.Y,fP.Z)if i8 and math.abs(i8 .Y-fN.Y)<8 then b6(i6,Vector3 .new(fP.X,i8 .Y+wh,fP.Z))
if hg(i6,0.7)then return true end end end return false end local function wk()c.lastCollect=q()local dG=aD()if not dG then return end
local pg,wl=dG.HumanoidRootPart,hf(dG)local dH,ph,dI,i9=nil,4,nil,"?"local i_=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and i_ and i_:IsA("BasePart")then dH,i9=(i_.CFrame*c.manualPad).Position,"manual pad"else local aZ=v8()
if aZ then dH=Vector3 .new(aZ.Position.X,aZ.Position.Y+aZ.Size.Y/2+wl,aZ.Position.Z)ph,dI,i9=math.max(aZ.Size.X,aZ.Size.Z)/2,aZ,aZ.Name
end end if not dH then x("COLLECT: pad not found - stand on it and tap SET PAD")return end local ja=aR()b6(dG,dH)
if dI and type(firetouchinterest)=="function"then pcall(firetouchinterest,pg,dI,0)end af(e.PadDwell)if dI and type(firetouchinterest)=="function"then pcall(firetouchinterest,pg,dI,1)end
af(0.5)c.collected=c.collected+1 local jb=aR()x(("COLLECTED (%s) %s"):format(i9,(ja and jb and jb>ja)and("+$"..ay(jb-ja))or"no cash change seen"))
wf(dG,dH,ph)end local dJ local function pj()if c.capHit then if e.AutoStart and q()-(c.capAt or 0)>300 then c.capHit,c.placeFails=false,0
x("trying again after being stopped for 5 minutes")dJ(true,true)else return nil,c.capMsg,"bad"end end if c.busy then return nil,c.busyText,"ok"end
if not aD()then return nil,"waiting for character","wait"end if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=a7(),nil,nil
if not c.plot then return nil,"own plot not found yet","wait"end end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local jc,pk=ed()local fQ=T()if fQ then local cq=ac(V(fQ))if not aQ(fQ)then local jd=(N.gift and V(N.gift)==V(fQ)and q()-N.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cq,jd),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cq,jd),"bad"end return"sell",("selling %s (%s)"):format(cq,jd),"warn"
end if jc<1 then return nil,("holding %s - 0 free stations"):format(cq),"wait"end if o.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cq),"wait"end
return"place",("waxing %s (%d free)"):format(cq,jc),"ok"end c.holding=false if e.Crates and not d.waiting and q()-(d.scanAt or 0)>1 and q()>(d.quietUntil or 0)then
d.scanAt=q()local je=c.plot:FindFirstChild("CrateStand")if je then for z6,dK in ipairs(je:GetDescendants())do
if dK:IsA("ProximityPrompt")and dK.Enabled and hv(dK)then local a0=dK.ObjectText if a0==""then a0=b0(je,"TitleLabel")or""end
if a0~=""and H.wanted(a0)then local wm=d_(a0):gsub("crate$","")local pl for pm in pairs(Q.members)do if d_(pm)==wm then pl=pm end end
d.waiting,d.at,d.title,d.prompt=true,q(),a0,dK d.data={name=(a0:gsub("%s","")),rarity=pl,title=a0}x(a0 .." found waiting on your stand")
end break end end end end local pn=H.wanted(d.data and d.data.name)or H.wanted(d.title)if e.Crates and(d.on or d.waiting)and pn then
local a1=d.title if q()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a1),"bad"
end if d.on then if c.crateFails>=3 then d.ignoreUntil,c.crateFails=q()+120,0 x("could not press the "..a1 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a1),"bad"end if q()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a1),"bad"
end if d.byYou and q()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a1,math.ceil(60-(q()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a1),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(a1),"bad"end if q()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a1),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(a1,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not pn then local po=d.title..tostring(d.rolledAt)if d.told~=po then d.told=po x(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and q()-d.rolledAt<6 and H.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if jc<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(pk,pk),"wait"
end local jf=kK()if not jf then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dL=cS()
if dL and l8(dL.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dL.name),"idle"end
if q()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dL.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(dL.name),"ok"
end local bn=hd()if bn.state~="match"then c.matchSince=nil if bn.state=="skip"and not jf.Enabled then return nil,bn.text.." (sold out)","idle"end
return nil,bn.text,bn.level end if not jf.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local dM=q()if dM<c.noCashUntil then local pp,wn=lG()if pp then return nil,("cash short: have $%s, price ~$%s"):format(ay(pp),ay(wn)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ay(aR()),math.ceil(c.noCashUntil-dM)),"bad"end if dM-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or dM local pq=dM-c.matchSince if pq<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bn.shown,pq),"ok"end
return"buy",("buying %s via %s"):format(bn.shown,bn.src),"ok"end A.skip,A.skipN,A.n,A.calls,A.fails,A.nextAt,A.msg={},0,0,0,0,0,"off"
function A.can(bo,wo)local jg=bo:GetAttribute("PourOwner")if type(jg)~="number"or jg==j.uid or not bo:GetAttribute("HasSquishy")then return false end
if bo:GetAttribute("PourLong")~=true or bo:GetAttribute("PourFull")==true then return false end local jh=bo:GetAttribute("PourId")
if jh==nil or A.skip[jh]then return false end local pr,ji,wp=bo:GetAttribute("Helpers"),0,tostring(j.uid)if type(pr)=="string"then
for wq in pr:gmatch("[^,%s]+")do ji=ji+1 if wq==wp then return false end end end if ji>=6 then return false end
local fR=o.left(bo)if not fR then local ps=tonumber(bo:GetAttribute("PourEnd"))fR=ps and(ps-wo)end if not fR or fR<=75 then return false end
local jj=game:GetService("Players"):GetPlayerByUserId(jg)if not jj or jj:GetAttribute("WaxHelpOff")==true then return false end
return true,jj,jh end function A.list()local jk,wr={},j.srv()local pt=aC:FindFirstChild("Plots")for z7,pu in ipairs(pt and pt:GetChildren()or{})do
local pv=pu~=c.plot and pu:FindFirstChild("WaxStations")for z8,jl in ipairs(pv and pv:GetChildren()or{})do local ws,wt,wu=A.can(jl,wr)
local jm=ws and jl:FindFirstChild("SquishyPlaceHolder")if jm and jm:IsA("BasePart")then jk[#jk+1]={st=jl,p=wt,id=wu,part=jm}end
end end return jk end function A.due()return e.Help and c.running and q()>=A.nextAt end function A.skipIt(pw,px)
A.skip[pw],A.skipN=px,A.skipN+1 if A.skipN>600 then A.skip,A.skipN={[pw]=px},1 end end function A.goHome()local jn,dN=aD(),A.home
A.home=nil if jn and dN and(jn.HumanoidRootPart.Position-dN.Position).Magnitude>20 then pcall(b6,jn,dN.Position,dN.Position+dN.LookVector)
end end function A.step()local jo,py=A.list(),aD()if#jo==0 or not py then A.nextAt=q()+15 A.msg=("helped %d waxes here%s | none to help right now"):format(A.n,A.calls>0 and(", "..A.calls.." for the guild")or"")
A.goHome()return end local pz=py.HumanoidRootPart local jp=pz.Position table.sort(jo,function(wv,ww)return(wv.part.Position-jp).Magnitude<(ww.part.Position-jp).Magnitude end)
local a2=jo[1]A.home=A.home or pz.CFrame if(a2 .part.Position-jp).Magnitude>12 then b7(a2 .part,nil)end af(0.2)
local dO=ao:FindFirstChild("Remotes")dO=dO and dO:FindFirstChild("ClanRequest")if not dO then A.nextAt,A.msg=q()+60,"the game's help remote is missing"return end
local pA,dP=pcall(function()return dO:InvokeServer("help",a2 .st:GetAttribute("PourOwner"),tonumber(a2 .st.Name))end)
if pA and type(dP)=="table"and dP.ok then A.n,A.fails=A.n+1,0 A.skipIt(a2 .id,"helped")x(("HELPED %s's wax (station %s)"):format(a2 .p.DisplayName,a2 .st.Name))
A.msg=("helped %d waxes here%s"):format(A.n,A.calls>0 and(", "..A.calls.." for the guild")or"")else local pB=(pA and type(dP)=="table"and tostring(dP.reason or"refused"))or("error: "..tostring(dP))
A.skipIt(a2 .id,pB)A.fails=A.fails+1 if A.fails<=3 then x(("help refused for %s's wax: %s"):format(a2 .p.DisplayName,pB))end
if A.fails>=5 then A.fails,A.nextAt,A.msg=0,q()+60,"the server keeps refusing helps - trying again in a minute"
A.goHome()end end A.nextAt=math.max(A.nextAt,q()+0.4)end function A.onCall(a3)if not e.HelpGuild or type(a3)~="table"or a3 .p~="help"or a3 .mine or a3 .u==j.uid or not a3 .u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local dQ=ao:FindFirstChild("Remotes")
dQ=dQ and dQ:FindFirstChild("ClanRequest")if not dQ then return end local pC,dR=pcall(function()return dQ:InvokeServer("callHelp",a3 .u)end)
local pD=tostring(a3 .n or a3 .un or a3 .u)if pC and type(dR)=="table"and dR.ok then A.calls=A.calls+1 x(("HELPED guildmate %s's wax from here (their call)"):format(pD))
else x(("guild call from %s: %s"):format(pD,(pC and type(dR)=="table"and tostring(dR.reason or"refused"))or tostring(dR)))
end end)end local function ar(wx,wy,...)if c.busy then return end c.busy,c.busyText=true,wx local wz,pE=pcall(wy,...)
c.busy,c.busyText=false,""if not wz and pE~=go then x("ERR "..tostring(pE))end end local function wA()local bp,wB,wC=pj()
c.reason,c.level=wB,wC if bp=="place"then ar("waxing...",o.place)elseif bp=="crate"then ar("opening crate...",e0,true)
elseif bp=="cratesmart"then ar("opening crate...",d.smart)elseif bp=="cratewin"then ar("opening the crate window...",hx)
elseif bp=="nocrate"then ar("discarding crate...",e0,false)elseif bp=="sell"then ar("selling...",pc)elseif bp=="buy"then ar("buying...",lZ,false)
elseif e.Collect and not c.matchSince and q()-c.lastCollect>=e.Every then ar("collecting money...",wk)elseif not bp and not c.matchSince and A.due()then
ar("helping a wax...",A.step)elseif A.home and not e.Help then ar("coming back...",A.goHome)end end function dJ(fS,wD)
if fS==c.running then return end c.running=fS if not wD then e.AutoStart=fS end if fS then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=q()c.plot=a7()or c.plot
x("START")else c.reason="stopped"x("STOP")end end do local bq=eA(ab.auto)if type(bq)=="string"then bq=bq:gsub("%s+$","")
if bq~=""then c.autoload=bq local wE=lu(bq)x(wE and("loaded config "..bq)or("config "..bq.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local wF={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}local pF={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function J(wG,wH,wI)local wJ,jq=pcall(Instance.new,wG)
if not wJ then c.uiErrs=c.uiErrs+1 return nil end for wK,wL in pairs(wH)do if not pcall(function()jq[wK]=wL end)then c.uiErrs=c.uiErrs+1 end
end jq.Parent=wI return jq end local function ag(wM,wN)J("UICorner",{CornerRadius=UDim.new(0,wN or 6)},wM)end
local a={}local jr=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local pG=jr:FindFirstChild("SABFarmGui")
if pG then pG:Destroy()end local js=J("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},jr)
local ae={w=320,h=330,head=30,strip=38,tabs=26}a.root=J("Frame",{Name="Root",Size=UDim2 .new(0,ae.w,0,ae.h),Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),
BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},js)ag(a.root,10)J("UIStroke",{Color=l.line,Thickness=1},a.root)
local a4=UDim2 .new(1,0,1,0)local function D(pH,pI)return UDim2 .new(pH,0,0,0),UDim2 .new(pI,(pH+pI>0.99)and 0 or-4,1,0)end
local function C(wO,wP,wQ,wR,wS,wT)local pJ=J("TextButton",{Text=wP,Position=wS,Size=wT,BackgroundColor3=wQ,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=wR,TextColor3=l.text,AutoButtonColor=true},wO)ag(pJ,6)return pJ end local function fT(wU,wV,wW,wX,wY)
local jt=J("TextBox",{Text=wV,PlaceholderText=wW,Position=wX,Size=wY,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=l.text,PlaceholderColor3=l.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},wU)ag(jt,6)J("UIPadding",{PaddingLeft=UDim.new(0,8)},jt)
return jt end local fU=aC.CurrentCamera local function wZ()local w0,fV=pcall(function()return fU and fU.ViewportSize end)
if w0 and fV and fV.X>50 and fV.Y>50 then return fV end end local function br(dS)local ju=wZ()if not(ju and dS and dS.Parent)then return end
local w1=pcall(function()local fW,pK=dS.AbsolutePosition,dS.AbsoluteSize local jv=70 local pL=math.clamp(fW.X,jv-pK.X,ju.X-jv)
local pM=math.clamp(fW.Y,0,ju.Y-math.min(pK.Y,jv))if math.abs(pL-fW.X)>0.5 or math.abs(pM-fW.Y)>0.5 then dS.Position=UDim2 .new(0,math.floor(pL),0,math.floor(pM))
end end)return w1 end local function fX(w2)local w3,jw=pcall(function()return w2 .AbsolutePosition end)if w3 and jw then return{math.floor(jw.X),math.floor(jw.Y)}end
end local cr={}c.dragMoved={}local function pN(dT,pO,jx)P(dT.InputBegan:Connect(function(cs)if cs.UserInputType~=Enum.UserInputType.MouseButton1 and cs.UserInputType~=Enum.UserInputType.Touch then return end
local jy={start=cs.Position,from=pO.Position,moved=0,target=pO,input=cs,onDrop=jx}cr[dT],c.dragMoved[dT]=jy,0
local jz jz=cs.Changed:Connect(function()if cs.UserInputState==Enum.UserInputState.End and cr[dT]==jy then cr[dT]=nil
if jz then jz:Disconnect()end if jx then jx(jy.moved)end end end)end))end P(kj.InputChanged:Connect(function(fY)
if fY.UserInputType~=Enum.UserInputType.MouseMovement and fY.UserInputType~=Enum.UserInputType.Touch then return end
for w4,aO in pairs(cr)do local jA=aO.target if jA and jA.Parent then local pP,pQ=fY.Position.X-aO.start.X,fY.Position.Y-aO.start.Y
aO.moved=math.max(aO.moved,math.abs(pP)+math.abs(pQ))c.dragMoved[w4]=aO.moved jA.Position=UDim2 .new(aO.from.X.Scale,aO.from.X.Offset+pP,aO.from.Y.Scale,aO.from.Y.Offset+pQ)
end end end))P(kj.InputEnded:Connect(function(fZ)if fZ.UserInputType~=Enum.UserInputType.MouseButton1 and fZ.UserInputType~=Enum.UserInputType.Touch then return end
for w5,f0 in pairs(cr)do if f0 .input==fZ or fZ.UserInputType==Enum.UserInputType.MouseButton1 then cr[w5]=nil
if f0 .onDrop then f0 .onDrop(f0 .moved)end end end end))local function K(w6,w7,w8,w9,w_,xa,xb)return J("TextLabel",{Text=w7,Position=xa or UDim2 .new(0,0,0,0),Size=xb or a4,BackgroundTransparency=1,
Font=w_ and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=w8,TextColor3=w9,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},w6)
end a.title=J("Frame",{Size=UDim2 .new(1,0,0,ae.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=J("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.title)
ag(a.dot,5)K(a.title,"SAB  BUTTER FARM  "..bV,12,l.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=C(a.title,"-",l.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=C(a.title,"X",l.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=J("Frame",{Position=UDim2 .new(0,0,0,ae.head),Size=UDim2 .new(1,0,0,ae.strip),BackgroundColor3=l.bg,BorderSizePixel=0},a.root)
a.bar=J("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
ag(a.bar,2)a.reason=K(a.strip,"starting",12,l.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=J("Frame",{Position=UDim2 .new(0,0,0,ae.head+ae.strip),Size=UDim2 .new(1,0,0,ae.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=C(a.tabs,"FARM",l.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=C(a.tabs,"BUTTERS",l.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=C(a.tabs,"CRATES",l.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=C(a.tabs,"PETS",l.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=C(a.tabs,"TEAMS",l.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=C(a.tabs,"SETUP",l.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function ct()local jB=J("ScrollingFrame",{Position=UDim2 .new(0,0,0,ae.head+ae.strip+ae.tabs),Size=UDim2 .new(1,0,1,-(ae.head+ae.strip+ae.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=l.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
J("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},jB)J("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},jB)
return jB end a.farm,a.but,a.set,a.crt=ct(),ct(),ct(),ct()a.pet,a.team=ct(),ct()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local f1,dU,E=0,12,nil local function an(pR,xc)f1,dU=f1+1,dU+pR+6 return J("Frame",{Size=UDim2 .new(1,0,0,pR),BackgroundTransparency=1,LayoutOrder=f1},xc or a.farm)
end local function cu(xd)K(an(14),xd,10,l.dim,true)end E=an(34)a.startB=C(E,"START",l.good,14,D(0,0.68))a.killB=C(E,"KILL",l.bad,14,D(0.68,0.32))
local xe=an(42)local function dV(pS,xf,jC)local jD=J("Frame",{Position=UDim2 .new((pS-1)/jC,0,0,0),Size=UDim2 .new(1/jC,pS<jC and-4 or 0,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},xe)ag(jD,6)local pT=K(jD,"0",15,l.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local xg=K(jD,xf,9,l.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))pT.TextXAlignment,xg.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return pT end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=dV(1,"BOUGHT",5),dV(2,"WAXED",5),dV(3,"SOLD",5),dV(4,"MONEY",5),dV(5,"FREE",5)
a.info=K(an(40),"",10,l.dim,false)a.tgt=K(an(26),"",10,l.good,false)cu("MONEY COLLECT")E=an(28)a.secB=fT(E,tostring(e.Every),"60",D(0,0.2))
K(E,"sec",11,l.dim,false,D(0.21,0.09))a.secSet=C(E,"SET",l.accent,12,D(0.3,0.2))a.colT=C(E,"COLLECT: ON",l.accent,11,D(0.5,0.5))
E=an(26)a.padB=C(E,"SET PAD (stand on it)",l.panel2,10,D(0,0.55))a.padL=K(E,"",10,l.dim,false,D(0.56,0.44))cu("BUTTERS YOU DID NOT TICK, AND CRATES")
E=an(28)a.sellT=C(E,"SELL THEM: ON",l.accent,11,D(0,0.55))a.sellB=C(E,"SELL NOW",l.warn,11,D(0.55,0.45))E=an(28)
a.crateT=C(E,"OPEN CRATES: ON",l.accent,11,D(0,0.55))a.crateB=C(E,"OPEN NOW",l.warn,11,D(0.55,0.45))cu("HELP OTHER PLAYERS' WAXES  (10% off their wax each)")
E=an(28)a.helpT=C(E,"HELP WAXES: OFF",l.panel2,10,D(0,0.5))a.helpGT=C(E,"GUILD CALLS: OFF",l.panel2,10,D(0.5,0.5))
a.helpL=K(an(14),"",9,l.dim,false)cu("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")E=an(28)a.arT=C(E,"AUTO ROLL: OFF",l.panel2,11,D(0,0.5))
a.arL=K(E,"",9,l.dim,false,D(0.52,0.48))cu("TOOLS")E=an(30)a.buyB=C(E,"BUY",l.warn,10,D(0,0.5))a.plB=C(E,"WAX",l.good,10,D(0.5,0.5))
cu("LOG")a.log=J("TextLabel",{Size=a4,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=10,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},an(84))ag(a.log,6)J("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,dU)f1,dU=0,12 local function ah(xh)return an(xh,a.set)end local function dW(xi)K(ah(14),xi,10,l.dim,true)end
dW("SETTINGS FILE  (saved on your phone)")E=ah(28)a.cfgName=fT(E,"default","config name",D(0,0.5))a.cfgSave=C(E,"SAVE",l.good,11,D(0.5,0.25))
a.cfgLoad=C(E,"LOAD",l.accent,11,D(0.75,0.25))E=ah(26)a.cfgPrev=C(E,"<",l.panel2,11,D(0,0.13))a.cfgPick=C(E,"(none saved)",l.panel2,10,D(0.13,0.74))
a.cfgNext=C(E,">",l.panel2,11,D(0.87,0.13))E=ah(26)a.cfgAuto=C(E,"LOAD IT ON LAUNCH: OFF",l.panel2,10,D(0,1))
a.cfgMsg=K(ah(26),"",10,l.dim,false)dW("START BY ITSELF")E=ah(26)a.autoB=C(E,"INSTALL F.exec",l.accent,10,D(0,1))
a.autoMsg=K(ah(30),"",10,l.dim,false)E=ah(28)a.startT=C(E,"START FARMING ON LOAD: ON",l.accent,10,D(0,1))K(ah(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,l.dim,false)
dW("IF THE GAME DROPS ME")E=ah(28)a.rejT=C(E,"AUTO REJOIN: ON",l.accent,11,D(0,0.55))a.rejB=C(E,"REJOIN NOW",l.warn,11,D(0.55,0.45))
a.rejMsg=K(ah(30),"",10,l.dim,false)dW("SMOOTHER RUNNING  (for long / overnight runs)")E=ah(28)a.pfLite=C(E,"LITE MODE: OFF",l.panel2,10,D(0,0.5))
a.pfHud=C(E,"HIDE GAME HUD: OFF",l.panel2,10,D(0.5,0.5))E=ah(28)a.pfFps=C(E,"FPS CAP: GAME",l.panel2,10,D(0,0.5))
a.pfRender=C(E,"STOP 3D: OFF",l.panel2,10,D(0.5,0.5))E=ah(28)a.pfMem=fT(E,tostring(e.MemLimit),"2000",D(0,0.24))
K(E,"MB: rejoin this server above it (0 = never)",9,l.dim,false,D(0.26,0.52))a.pfMemSet=C(E,"SET",l.accent,11,D(0.8,0.2))
a.pfInfo=K(ah(18),"",10,l.text,false)K(ah(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,l.dim,false)
dW("THE ROUND SAB BUTTON")K(ah(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,l.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,dU)local pU=J("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},jr)
a.tgRoot=J("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},pU)ag(a.tgRoot,20)J("UIStroke",{Color=l.line,Thickness=1},a.tgRoot)
a.tgBtn=J("TextButton",{Text="SAB",Size=a4,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=l.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=J("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ag(a.tgDot,4)local a5={built=false,boxes={},at=0}local function pV(pW,jE)e.Targets[pW]=jE or nil local jF=a5 .boxes[pW]
if jF then jF.Text=jE and"X"or""jF.BackgroundColor3=jE and l.good or l.panel2 end end local function jG()for xj,pX in pairs(a5 .boxes)do
local pY=e.Targets[xj]==true pX.Text=pY and"X"or""pX.BackgroundColor3=pY and l.good or l.panel2 end end local dX
local function xk()local xl=0 local jH=J("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=K(jH,"",10,l.dim,false,D(0,0.5))local xm=C(jH,"CLEAR",l.panel2,10,D(0.5,0.24))local xn=C(jH,"REFRESH",l.panel2,10,D(0.74,0.26))
xm.MouseButton1Click:Connect(function()for xo in pairs(e.Targets)do e.Targets[xo]=nil end jG()end)xn.MouseButton1Click:Connect(function()
Q.at=0 gZ()dX(true)end)return xl end dX=function(xp)if not gZ()then if not a.butEmpty then a.butEmpty=K(J("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)end return end if a5 .built and not xp and a5 .at==Q.at then return end
for z9,jI in ipairs(a.but:GetChildren())do if jI:IsA("Frame")or jI:IsA("TextButton")then jI:Destroy()end end a5 .boxes,a.butEmpty={},nil
xk()local jJ,jK=36,1 local function pZ(p0)jK=jK+1 local xq=J("Frame",{Size=UDim2 .new(1,0,0,p0),BackgroundTransparency=1,LayoutOrder=jK},a.but)
jJ=jJ+p0+6 return xq end for z_,f2 in ipairs(Q.rarOrder)do local xr=pZ(24)local xs=pF[f2]or l.text local jL=J("Frame",{Size=a4,BackgroundColor3=l.panel,BorderSizePixel=0},xr)
ag(jL,6)K(jL,"  "..f2:upper(),11,xs,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local xt=C(jL,"ALL",l.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local xu=f2 xt.MouseButton1Click:Connect(function()local p1=Q.members[xu]or{}local p2=false for Aa,xv in ipairs(p1)do if not e.Targets[xv]then p2=true break end end
for Ab,xw in ipairs(p1)do pV(xw,p2)end end)for Ac,jM in ipairs(Q.members[f2]or{})do local xx=pZ(22)local f3=J("TextButton",{Text="",Size=a4,BackgroundColor3=l.bg,BorderSizePixel=0,
AutoButtonColor=true},xx)ag(f3,5)K(f3,"   "..ac(jM),11,l.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local jN=J("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},f3)ag(jN,4)a5 .boxes[jM]=jN local p3=jM local function p4()pV(p3,not e.Targets[p3])end
f3 .MouseButton1Click:Connect(p4)jN.MouseButton1Click:Connect(p4)end end jG()a.but.CanvasSize=UDim2 .new(0,0,0,jJ+10)
a5 .built,a5 .at=true,Q.at end function H.paint()for xy,p5 in pairs(H.boxes)do local p6=e.CrateTicks[xy]==true
p5 .Text=p6 and"X"or""p5 .BackgroundColor3=p6 and l.good or l.panel2 end if a.crtInfo then local jO,jP=0,0 for Ad in pairs(H.boxes)do jO=jO+1 end
for Ae,xz in pairs(e.CrateTicks)do if xz then jP=jP+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(jO,jP)
end if a.crtAll then a.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=e.Crates and l.accent or l.panel2
end end function H.build()for Af,jQ in ipairs(a.crt:GetChildren())do if jQ:IsA("Frame")or jQ:IsA("TextButton")then jQ:Destroy()end
end H.boxes={}local jR,jS=12,0 local function f4(p7)jS=jS+1 jR=jR+p7+6 return J("Frame",{Size=UDim2 .new(1,0,0,p7),BackgroundTransparency=1,LayoutOrder=jS},a.crt)
end local jT=f4(28)a.crtInfo=K(jT,"",10,l.dim,false,D(0,0.5))local xA=C(jT,"CLEAR",l.panel2,10,D(0.5,0.24))local xC=C(jT,"REFRESH",l.panel2,10,D(0.74,0.26))
P(xA.MouseButton1Click:Connect(function()e.CrateTicks={}H.paint()end))P(xC.MouseButton1Click:Connect(function()H.build()end))
a.crtAll=C(f4(28),"",l.accent,11,D(0,1))P(a.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates H.paint()end))
K(f4(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,l.dim,false)
for Ag,a6 in ipairs(H.list())do local xD=f4(24)local dY=J("TextButton",{Text="",Size=a4,BackgroundColor3=l.panel,BorderSizePixel=0,AutoButtonColor=true},xD)
ag(dY,5)K(dY,"  "..(a6 .title or a6 .name)..(a6 .guess and"  (?)"or""),11,pF[a6 .rar or""]or l.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
K(dY,a6 .price and("$"..ay(a6 .price))or(a6 .rar or""),9,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local jU=J("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=l.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=l.text,AutoButtonColor=false},dY)ag(jU,4)H.boxes[a6 .k]=jU local p8=a6 .k local function p9()e.CrateTicks[p8]=(not e.CrateTicks[p8])or nil
H.paint()end P(dY.MouseButton1Click:Connect(p9))P(jU.MouseButton1Click:Connect(p9))end a.crt.CanvasSize=UDim2 .new(0,0,0,jR+10)
H.built=H.at H.paint()end local p_="farm"local function bs(ai)p_=ai a.farm.Visible,a.but.Visible,a.set.Visible=(ai=="farm"),(ai=="but"),(ai=="set")
a.crt.Visible=(ai=="crt")a.pet.Visible,a.team.Visible=(ai=="pet"),(ai=="team")a.tabCrt.BackgroundColor3=(ai=="crt")and l.accent or l.panel2
a.tabPet.BackgroundColor3=(ai=="pet")and l.accent or l.panel2 a.tabTeam.BackgroundColor3=(ai=="team")and l.accent or l.panel2
if ai=="pet"and not j.built then pcall(j.build)end if ai=="team"and not o.built then pcall(o.build)end if ai=="crt"and(H.built~=H.at or not next(H.boxes))then H.build()end
a.tabFarm.BackgroundColor3=(ai=="farm")and l.accent or l.panel2 a.tabBut.BackgroundColor3=(ai=="but")and l.accent or l.panel2
a.tabSet.BackgroundColor3=(ai=="set")and l.accent or l.panel2 if ai=="but"then dX(false)end end local function L(qa,qb,xE,xF)
qa.Text=qb and xE or xF qa.BackgroundColor3=qb and l.accent or l.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(qc)
local bS=j.rows and j.rows[qc]if not bS then return end local dZ=e.Pets[qc]or{}bS.b.BackgroundColor3=dZ.b and l.good or l.panel2
bS.g.BackgroundColor3=dZ.g and l.accent or l.panel2 bS.g.Text=dZ.g and"BIG"or"ANY"bS.w.BackgroundColor3=dZ.w and l.warn or l.panel2
local jV=tonumber(dZ.f)or 0 bS.f.Text=jV>0 and(jV.." BIG")or"FUSE"bS.f.BackgroundColor3=jV>0 and l.good or l.panel2
end function j.flag(jW,f5)local aP=e.Pets[jW]or{}if f5=="f"then local qd=((tonumber(aP.f)or 0)+1)%4 aP.f=qd>0 and qd or nil
elseif aP[f5]then aP[f5]=nil else aP[f5]=true end e.Pets[jW]=(aP.b or aP.g or aP.w or aP.f)and aP or nil j.paintRow(jW)
end function j.paintAll()for xG in pairs(j.rows or{})do j.paintRow(xG)end if a.pbT then L(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
L(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")L(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function j.live()if not j.built then j.build()return end if q()-(j.liveAt or 0)<1 then return end j.liveAt=q()
local qe=j.wishes()local d0=j.data()for f6,f7 in pairs(j.rows)do f7 .name.Text=j.nice(f6)..(qe[f6]and("   * wish %dm"):format(math.ceil(qe[f6]/60))or"")
local qf=y.status(f6,d0)f7 .desc.Text=qf and(qf.." | "..f7 .boostText)or f7 .boostText end local qg=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(d0 and#(d0 .pets or{})or 0,d0 and tonumber(d0 .maxOwned)or 60,
ay(j.money()),qg>0 and(" | free wishes "..qg)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local f8=j.info()for Ah,jX in ipairs(a.pet:GetChildren())do if jX:IsA("Frame")or jX:IsA("TextLabel")then jX:Destroy()end
end j.rows={}local jY,f9=0,12 local function cv(qh)jY,f9=jY+1,f9+qh+6 return J("Frame",{Size=UDim2 .new(1,0,0,qh),BackgroundTransparency=1,LayoutOrder=jY},a.pet)
end local jZ=cv(28)a.pbT=C(jZ,"AUTO ADOPT: OFF",l.panel2,9,D(0,0.34))a.pwT=C(jZ,"AUTO WISH: OFF",l.panel2,9,D(0.34,0.33))
a.pfT=C(jZ,"AUTO FUSE: OFF",l.panel2,9,D(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()e.PetBuy=not e.PetBuy j.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()e.PetWish=not e.PetWish j.paintAll()end)a.pfT.MouseButton1Click:Connect(function()e.AutoFuse=not e.AutoFuse j.paintAll()end)
a.pInfo=K(cv(44),"",10,l.dim,false)K(cv(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,l.dim,false)
if not f8 then K(cv(30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,f9)
j.built=false return end local cw={}for Ai,qi in ipairs(j.order())do local j0=f8 .Pets[qi].rarity or"?"cw[j0]=cw[j0]or{}
table.insert(cw[j0],qi)end local cx={}for Aj,qj in ipairs(f8 .Rarities or{})do if cw[qj]then cx[#cx+1]=qj end end
for qk in pairs(cw)do if not table.find(cx,qk)then cx[#cx+1]=qk end end for Ak,f_ in ipairs(cx)do local ql=J("Frame",{Size=a4,BackgroundColor3=l.panel,BorderSizePixel=0},cv(22))
ag(ql,6)K(ql,"  "..f_:upper(),11,j.RC[f_]or l.text,true)for Al,ga in ipairs(cw[f_])do local bT=J("Frame",{Size=a4,BackgroundColor3=l.bg,BorderSizePixel=0},cv(38))
ag(bT,5)local xH=K(bT,j.nice(ga),11,j.RC[f_]or l.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local xI,xJ=pcall(function()return f8 .describe(ga)end)
local qm=xI and tostring(xJ)or""local xK=K(bT,qm,9,l.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local qn=C(bT,"BUY",l.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local qo=C(bT,"ANY",l.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local qp=C(bT,"WISH",l.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local qq=C(bT,"FUSE",l.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local gb=ga qn.MouseButton1Click:Connect(function()j.flag(gb,"b")end)
qo.MouseButton1Click:Connect(function()j.flag(gb,"g")end)qp.MouseButton1Click:Connect(function()j.flag(gb,"w")end)
qq.MouseButton1Click:Connect(function()j.flag(gb,"f")end)j.rows[ga]={b=qn,g=qo,w=qp,f=qq,name=xH,desc=xK,boostText=qm}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,f9+10)j.built=true j.paintAll()end function r.paint()L(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")
L(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")L(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
L(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end
end function r.applyAll()if e.Lite then r.lite(true)end if e.HideHud then r.hideHud(true)end if e.NoRender then r.render(true)end
if(e.FpsCap or 0)~=0 then r.cap(e.FpsCap)end r.paint()end P(a.pfLite.MouseButton1Click:Connect(function()r.lite(not e.Lite)r.paint()end))
P(a.pfHud.MouseButton1Click:Connect(function()r.hideHud(not e.HideHud)r.paint()end))P(a.pfRender.MouseButton1Click:Connect(function()r.render(not e.NoRender)r.paint()end))
P(a.pfFps.MouseButton1Click:Connect(function()local xL=table.find(r.CAPS,e.FpsCap or 0)or 1 local qr=r.CAPS[(xL%#r.CAPS)+1]
if not r.cap(qr)and qr~=0 then x("this executor cannot cap fps")end r.paint()end))P(a.pfMemSet.MouseButton1Click:Connect(function()
local j1=tonumber(a.pfMem.Text)if j1 and j1>=0 then e.MemLimit=math.floor(j1)end r.paint()end))function o.names()
local j2={"(none)"}for Am,xM in ipairs((o.teams()))do j2[#j2+1]=xM.name end return j2 end function o.cycle(j3,xN)
local gc=o.names()local xO=e[j3]~=""and e[j3]or"(none)"local gd=table.find(gc,xO)or 1 gd=((gd-1+xN)%#gc)+1 e[j3]=gc[gd]=="(none)"and""or gc[gd]
o.paint()end function o.paint()if not o.built then return end L(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
L(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local j4={}for An,xP in ipairs((o.teams()))do j4[xP.name]=true end
for xQ,qs in pairs(o.pick)do local cy=e[xQ]qs.Text=cy==""and"(none)"or(j4[cy]and cy or(cy.." (missing)"))qs.TextColor3=(cy~=""and not j4[cy])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(o.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(o.switches,o.finished,o.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local xR,ge=j.srv(),{}for Ao,gf in ipairs(o.list or{})do ge[#ge+1]=("st %-2s %-22s %9s  helps %d"):format(gf.st.Name,ac(V(gf.name)):sub(1,22),o.clock(gf.ends-xR),gf.helps)
end a.tmList.Text=#ge>0 and table.concat(ge,"\n")or"no waxes running"end function o.build()for Ap,j5 in ipairs(a.team:GetChildren())do
if j5:IsA("Frame")or j5:IsA("TextLabel")then j5:Destroy()end end o.pick={}local j6,j7=0,12 local function bt(qt)
j6,j7=j6+1,j7+qt+6 return J("Frame",{Size=UDim2 .new(1,0,0,qt),BackgroundTransparency=1,LayoutOrder=j6},a.team)
end local function d1(xS)K(bt(14),xS,10,l.dim,true)end local function gg(gh)local j8=bt(26)local xT=C(j8,"<",l.panel2,11,D(0,0.14))
local qu=C(j8,"(none)",l.panel,10,D(0.14,0.72))local xU=C(j8,">",l.panel2,11,D(0.86,0.14))xT.MouseButton1Click:Connect(function()o.cycle(gh,-1)end)
xU.MouseButton1Click:Connect(function()o.cycle(gh,1)end)qu.MouseButton1Click:Connect(function()o.cycle(gh,1)end)
o.pick[gh]=qu end a.tmT=C(bt(28),"AUTO TEAMS: OFF",l.panel2,11,D(0,1))a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=o.current()end o.paint()end)a.tmInfo=K(bt(42),"",10,l.dim,false)
local qv=bt(26)a.tmBuild=C(qv,"AUTO BUILD TEAMS: OFF",l.panel2,9,D(0,0.62))a.tmBuildNow=C(qv,"BUILD NOW",l.warn,9,D(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild o.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if o.editing then return end y.buildMsg="building..."task.spawn(function()local xV,xW=pcall(y.rebuild,"you asked")if not xV then x("BUILD ERR "..tostring(xW))end end)
end)d1("NORMAL TEAM  (worn the rest of the time)")gg("TeamNormal")d1("FULL TEAM  (every station busy: money + wax speed)")
gg("TeamFull")d1("GLAZE TEAM  (worn just before a wax finishes)")gg("TeamGlaze")local j9=bt(26)a.tmLead=fT(j9,tostring(e.GlazeLead),"45",D(0,0.2))
K(j9,"sec before it finishes",10,l.dim,false,D(0.22,0.5))local xX=C(j9,"SET",l.accent,11,D(0.75,0.25))xX.MouseButton1Click:Connect(function()
local gi=tonumber(a.tmLead.Text)if gi and gi>=5 and gi<=600 then e.GlazeLead=math.floor(gi)else a.tmLead.Text=tostring(e.GlazeLead)end
o.paint()end)d1("WAX TEAM  (worn while a butter is placed: head starts)")gg("TeamWax")d1("YOUR WAXES  (time left, helps)")
a.tmList=J("TextLabel",{Size=a4,BackgroundColor3=l.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bt(150))ag(a.tmList,6)J("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
K(bt(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,l.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,j7+10)o.built=true o.paint()end local function xY()a.secB.Text=tostring(e.Every)
L(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")L(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")L(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
L(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")L(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
L(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")L(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")L(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then dJ(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end br(a.root)br(a.tgRoot)c.lastCollect=q()
jG()H.paint()pcall(j.paintAll)pcall(o.paint)pcall(r.applyAll)end local function xZ(qw)task.spawn(function()qw.TextColor3=l.bad
task.wait(0.8)if c.alive then qw.TextColor3=l.text end end)end local function qx()local qy=a.secB.Text:match("^%s*(%d+)%s*$")
local d2=qy and tonumber(qy)if not d2 or d2<1 then a.secB.Text=tostring(e.Every)xZ(a.secB)x("interval must be a whole number >= 1")
return end if d2==e.Every then return end e.Every,c.lastCollect=d2,q()x("collect every "..d2 .."s")end local function M(x0,x1)P(x0 .MouseButton1Click:Connect(x1))end
M(a.secSet,qx)P(a.secB.FocusLost:Connect(qx))M(a.colT,function()e.Collect,c.lastCollect=not e.Collect,q()L(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)M(a.sellT,function()e.SellJunk=not e.SellJunk L(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)M(a.sellB,function()
c.sellFails=0 task.spawn(ar,"selling...",pc)end)M(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(z.apply,"you asked",true)
end)M(a.crateT,function()e.Crates=not e.Crates L(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)M(a.helpT,function()
e.Help=not e.Help A.nextAt,A.msg=0,e.Help and"looking for waxes to help"or"off"L(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)M(a.helpGT,function()e.HelpGuild=not e.HelpGuild L(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)M(a.crateB,function()d.lastFail,d.summonFails,d.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(ar,"opening crate...",e0,true)
end)M(a.padB,function()c.plot=a7()or c.plot local qz,j_=aD(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(qz and j_ and j_:IsA("BasePart"))then x("SET PAD: need character and plot")return end c.manualPad=j_.CFrame:ToObjectSpace(qz.HumanoidRootPart.CFrame)
wa(c.manualPad)x("collect pad saved at your position")end)M(a.startB,function()dJ(not c.running)end)M(a.buyB,function()
c.plot=a7()or c.plot task.spawn(ar,"buying (manual)...",lZ,true)end)M(a.plB,function()c.plot=a7()or c.plot task.spawn(ar,"waxing (manual)...",l4)
end)M(a.tabFarm,function()bs("farm")end)M(a.tabBut,function()bs("but")end)M(a.tabSet,function()bs("set")end)M(a.tabCrt,function()bs("crt")end)
M(a.tabPet,function()bs("pet")end)M(a.tabTeam,function()bs("team")end)local function x2(ka)c.hidden=ka a.root.Visible=not ka
a.tgBtn.Text=ka and"SAB+"or"SAB"end pN(a.tgBtn,a.tgRoot,function()br(a.tgRoot)c.togPos=fX(a.tgRoot)or c.togPos
end)M(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then x2(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local ax,ak={},0
local function bu()ax=ll()if#ax==0 then a.cfgPick.Text="(none saved)"ak=0 return end if ak<1 or ak>#ax then ak=1 end
a.cfgPick.Text=ax[ak]..("  (%d/%d)"):format(ak,#ax)end local function qA()local qB=c.autoload~=nil a.cfgAuto.Text=qB and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=qB and l.accent or l.panel2 end local function kb()local qC=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if qC~=""then return qC end return(ak>0 and ax[ak])or""end M(a.cfgSave,function()c.winPos=fX(a.root)or c.winPos
c.togPos=fX(a.tgRoot)or c.togPos local qD,qE=eF(kb())a.cfgMsg.Text=qD and("saved as "..qE)or("could not save: "..qE)
a.cfgMsg.TextColor3=qD and l.good or l.bad bu()x(a.cfgMsg.Text)end)local function x3(kc)local kd,qF=lu(kc)a.cfgMsg.Text=kd and("loaded "..qF)or("could not load: "..qF)
a.cfgMsg.TextColor3=kd and l.good or l.bad if kd then a.cfgName.Text=kc xY()task.spawn(z.apply,"config "..kc)
end x(a.cfgMsg.Text)end M(a.cfgLoad,function()x3(kb())end)M(a.cfgPick,function()bu()if ak>0 then a.cfgName.Text=ax[ak]end
end)M(a.cfgPrev,function()if#ax==0 then bu()return end ak=(ak-2)%#ax+1 bu()a.cfgName.Text=ax[ak]end)M(a.cfgNext,function()
if#ax==0 then bu()return end ak=ak%#ax+1 bu()a.cfgName.Text=ax[ak]end)M(a.cfgAuto,function()if c.autoload then
lw(nil)a.cfgMsg.Text="it will not load a config on launch"else local d3=kb()local qG=false for Aq,x4 in ipairs(ll())do if x4==d3 then qG=true end end
local x5=qG or eF(d3)if x5 and d3~=""then lw(d3)bu()a.cfgMsg.Text=d3 .." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim qA()end)M(a.autoB,function()
local qH,qI=sx()a.autoMsg.Text=qH and("installed. "..qI)or("failed: "..qI)a.autoMsg.TextColor3=qH and l.good or l.bad
x(a.autoMsg.Text)end)M(a.startT,function()e.AutoStart=not e.AutoStart L(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)M(a.rejT,function()e.Rejoin=not e.Rejoin L(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)M(a.rejB,function()cR("you asked")end)
local bU=false M(a.minB,function()bU=not bU a.tabs.Visible=not bU if bU then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bs(p_)end a.root.Size=UDim2 .new(0,ae.w,0,bU and(ae.head+ae.strip)or ae.h)
a.minB.Text=bU and"+"or"-"end)local function gj()if not c.alive then return end c.alive,c.running=false,false
pcall(r.restoreAll)pcall(eg)for Ar,x6 in ipairs(gp)do pcall(function()x6:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()js:Destroy()end)pcall(function()pU:Destroy()end)if bW.SAB_KILL==gj then bW.SAB_KILL=nil end end
bW.SAB_KILL=gj M(a.killB,gj)M(a.xB,gj)pN(a.title,a.root,function()br(a.root)c.winPos=fX(a.root)or c.winPos end)
local function qJ()local d4,d5=c.reason,c.level if c.busy then d4,d5=c.busyText,"ok"elseif not c.running then
local As,qK,x7=pj()if c.capHit then d4,d5=qK,"bad"else d4,d5="[stopped] "..qK,(x7=="bad")and"bad"or"idle"end c.reason,c.level=d4,d5
end a.reason.Text=d4 a.bar.BackgroundColor3=wF[d5]or l.dim a.dot.BackgroundColor3=c.running and l.good or(c.capHit and l.bad or l.dim)
a.tgDot.BackgroundColor3=a.dot.BackgroundColor3 a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent a.startB.Text=c.running and"STOP"or"START"
L(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")a.startB.BackgroundColor3=c.running and l.warn or l.good
local x8,x9=ed()a.sBought.Text,a.sPlaced.Text,a.sSold.Text=tostring(c.bought),tostring(c.placed),tostring(c.sold)
a.sColl.Text,a.sFree.Text=tostring(c.collected),x8 .."/"..x9 local qL=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(q()-c.lastCollect)))or nil
local qM=T()a.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ay(aR()),c.rolls,c.gifts,c.crates,qM and ac(V(qM))or"nothing",d.on and("   ["..d.title.." window open]")or"",
qL and("in "..qL.."s")or"off")local cz=r7()a.tgt.Text=(#cz==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#cz<=3)and table.concat(cz,", ")or(#cz.." butters ticked")))
a.tgt.TextColor3=(#cz==0)and l.bad or l.good a.padL.Text=c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found")
a.log.Text=table.concat(d8,"\n")if a.butInfo then a.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(Q.n,#Q.rarOrder,#cz)
end if a.but.Visible and a5 .at~=Q.at then dX(false)end if a.crt.Visible then if H.built~=H.at then H.build()else H.paint()end
end if a.pet.Visible then j.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(r.fps+0.5),r.mem,r.memPeak)
end if a.team.Visible then o.paint()end if a.farm.Visible then a.helpL.Text=(e.Help or e.HelpGuild)and A.msg or"off"end
L(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")L(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local qN=(z.rec.on and"on"or"")..(z.rec.off and((z.rec.on and"/"or"").."off")or"")a.arL.Text=z.msg~=""and z.msg or("game: %s | learned: %s%s"):format(z.isOn()and"ON"or"off",
qN~=""and qN or"nothing yet",#z.rec.rules>0 and", choices"or"")a.arL.TextColor3=z.msg~=""and l.warn or l.dim end
bW.SAB={S=c,CFG=e,EV=N,U=a,sg=js,CAT=Q,LEARN=aa,buildList=dX,logAll=cA,evAll=cB,AR=z,CR=H,PF=r,PX=j,TM=o,CRATE=d,FU=y,HX=A}
x(bV.." loaded")if c.uiErrs>0 then x("UI: "..c.uiErrs.." properties skipped")end bs("farm")br(a.root)br(a.tgRoot)
if fU then pcall(function()P(fU:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)br(a.root)
br(a.tgRoot)end))end)end bu()qA()if c.config and c.config~=""then a.cfgName.Text=c.config end L(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
L(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")L(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
L(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")L(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
L(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")L(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(r.applyAll)pcall(qJ)task.spawn(function()local qO=sv()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(qO and("\n(backup: "..qO..")")or"")
local qP=eA(ab.exec)if qP and not qP:find("SAB autoloader v2",1,true)then cN(ab.exec,ab.stub)x("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(eA(ab.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(sD)end)task.spawn(function()while c.alive do local x_,ya=pcall(qJ)if not x_ then x("UI ERR "..tostring(ya))end
task.wait((c.hidden or bU)and 1.5 or 0.25)end end)task.spawn(function()local yb,yc=pcall(sM)if not yb then x("HOOK ERR "..tostring(yc))end
end)task.spawn(function()pcall(rv)if d.loadSeq and not d.learned then local gk={}for qQ=1,20 do if d.loadSeq[qQ]then gk[#gk+1]=d.loadSeq[qQ]end end
if#gk>0 then d.learned={seq=gk,mode=d.loadMode}x("remembered how to open crates directly")end end if gZ()then x(("catalog: %d butters in %d rarities"):format(Q.n,#Q.rarOrder))end
local yd,qR=pcall(wc)if yd and qR and c.alive and not c.manualPad then c.manualPad=qR end end)task.spawn(function()
while c.alive do local ke,kf=pcall(j.buyTick)if not ke then x("PET ERR "..tostring(kf))task.wait(5)end ke,kf=pcall(j.wishTick)
if not ke then x("WISH ERR "..tostring(kf))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local gl,qS=0,q()
P(game:GetService("RunService").Heartbeat:Connect(function()gl=gl+1 end))r.noteAt=q()while c.alive do task.wait(1)
local qT=q()r.fps,gl,qS=gl/math.max(qT-qS,0.001),0,qT local ye,yf=pcall(r.tick)if not ye then x("PERF ERR "..tostring(yf))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local yg,yh=pcall(y.tick)if not yg then x("FUSE ERR "..tostring(yh))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local yi,yj=pcall(o.tick)if not yi then x("TEAM ERR "..tostring(yj))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local qU=ao:WaitForChild("Remotes",30)local qV=qU and qU:WaitForChild("ClanEvent",30)
if qV and c.alive then P(qV.OnClientEvent:Connect(function(yk,yl)if yk=="call"then pcall(A.onCall,yl)end end))
end end)task.spawn(function()while c.alive do task.wait(20)pcall(eg)end end)pcall(z.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local yn=(type(newcclosure)=="function")and newcclosure or function(ym)return ym end local kg
local qW=(type(setnamecallmethod)=="function")and setnamecallmethod or nil kg=hookmetamethod(game,"__namecall",yn(function(qX,...)
local d6=getnamecallmethod()if c.alive and(d6=="InvokeServer"or d6=="FireServer")then local qY,qZ=pcall(function()return qX.Name end)
if qY and qZ=="CrateAction"and not d.replaying then pcall(d.saw,d6,...)elseif qY and qZ=="AutoRollAction"and not z.replaying then pcall(z.saw,d6,...)end
if qW then qW(d6)end end return kg(qX,...)end))d.oldNC=kg end)end if gn then P(F.Idled:Connect(function()pcall(function()gn:CaptureController()gn:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for At=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and aD()and(c.plot or a7())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then z.apply("joined")end while c.alive do task.wait(30)if c.alive and e.AutoRoll and c.running and not z.isOn()and not cS()and not T()
and not d.waiting and not d.on and not c.busy then z.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Au=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or a7()if aD()and c.plot and next(e.Targets)then dJ(true,true)x("started by itself")
return end task.wait(1)end if c.alive and not c.running then x("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=a7()c.lastCollect=q()while c.alive do if c.running then local yo,q0=pcall(wA)if not yo and q0~=go then x("LOOP ERR "..tostring(q0))end
end task.wait(0.1)end end)gm("loaded - window is at the top left")end local yq,kh=xpcall(q4,function(yp)return tostring(yp).."\n"..debug.traceback()end)
if not yq then pcall(function()warn("SAB "..bV.." ERROR: "..tostring(kh))end)gm("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bV.." ERROR: "..tostring(kh))end)pcall(function()local q1=(type(getgenv)=="function"and getgenv())or _G
if type(q1 .SAB_KILL)=="function"then q1 .SAB_KILL()end for Av,yr in ipairs({"SABFarmGui","SABToggle"})do local q2=F.PlayerGui:FindFirstChild(yr)
if q2 then q2:Destroy()end end end)pcall(function()local d7=Instance.new("ScreenGui")d7 .Name="SABError"d7 .ResetOnSpawn=false
d7 .DisplayOrder=1000 local aJ=Instance.new("TextBox")aJ.Size=UDim2 .new(0,340,0,170)aJ.Position=UDim2 .new(0,10,0,50)
aJ.BackgroundColor3=Color3 .fromRGB(90,20,20)aJ.TextColor3=Color3 .new(1,1,1)aJ.TextSize=11 aJ.TextWrapped=true
aJ.ClearTextOnFocus=false aJ.TextXAlignment=Enum.TextXAlignment.Left aJ.TextYAlignment=Enum.TextYAlignment.Top
aJ.Text="SAB "..bV.." failed to start. Send this text:\n"..tostring(kh)aJ.Parent=d7 d7 .Parent=F:WaitForChild("PlayerGui")
end)end
