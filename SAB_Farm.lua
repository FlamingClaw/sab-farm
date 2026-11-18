local bh="v25"local iL=game:GetService("Players")local y=iL.LocalPlayer or iL.PlayerAdded:Wait()local function fg(og)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bh,Text=og,Duration=6})
end)end fg("script started")local function oh()local av=game:GetService("ReplicatedStorage")local cc=game:GetService("Workspace")
local oi=game:GetService("UserInputService")local bC=(type(getgenv)=="function"and getgenv())or _G if type(bC.SAB_KILL)=="function"then pcall(bC.SAB_KILL)end
local q=(type(tick)=="function")and tick or os.clock local fh=(function()local oj,ol=pcall(function()return game:GetService("VirtualUser")end)return oj and ol or nil end)()
local f={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},Teams=false,TeamNormal="",TeamGlaze="",TeamWax="",GlazeLead=45,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=q(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local H={name=nil,rar=nil,at=q(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local r={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local d={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local j,o={},{}local fi={}local fj,dn,aV,bi={},{},{},{}local ai=""local function T(iM)fj[#fj+1]=iM return iM end
local function ao(om)task.wait(om)if not a.alive then error(fi,0)end end local function l(dp)dp=os.date("%H:%M:%S").." "..tostring(dp)
table.insert(dn,1,dp)if#dn>6 then table.remove(dn)end aV[#aV+1]=dp if#aV>80 then table.remove(aV,1)end end local function dq(iN)
if type(iN)~="string"then return""end return(iN:lower():gsub("[^%w]",""))end local function L(oo)local iO=dq(oo)
local fk=iO:gsub("butter$","")if fk==""then fk=iO end return fk end local function aW(fl)return type(fl)=="string"and L(fl)~=""and f.Targets[L(fl)]==true end
local function op(cd)cd=cd:lower()return cd:find("squishy",1,true)~=nil or cd:match("butter$")~=nil or cd:match("butter[^%a]")~=nil
end local fm={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ag(ce)if type(ce)~="number"then return"?"end
local dr=1 while math.abs(ce)>=1000 and dr<#fm do ce=ce/1000 dr=dr+1 end local oq=string.format("%.2f",ce):gsub("%.?0+$","")
return oq..fm[dr]end local function ot(iP)if type(iP)~="string"then return nil end local ou,iQ=iP:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local fn=tonumber(ou)if not fn then return nil end if iQ==""then return fn end for ov,ow in ipairs(fm)do if ow:lower()==iQ:lower()then return fn*1000^(ov-1)end end
return nil end local function aC()local iR=y:GetAttribute("BoardValueMoney")if type(iR)=="number"then return iR end
local iS=y:FindFirstChild("leaderstats")if iS then for uw,ox in ipairs({"Cash","Money","Coins"})do local fo=iS:FindFirstChild(ox)
if fo and type(fo.Value)=="number"then return fo.Value end end end end local function ap(oy)local fp=oy:GetFullName()
if a.plot then local fq=a.plot:GetFullName()if fp:sub(1,#fq)==fq then return fp:sub(#fq+2)end end return fp end
local function aH()local ds=y.Character if ds and ds:FindFirstChild("HumanoidRootPart")then local iT=ds:FindFirstChildOfClass("Humanoid")
if iT and iT.Health>0 then return ds end end end local function aX()local fr=cc:FindFirstChild("Plots")if not fr then return nil end
local function iU(oz)local iV=oz:FindFirstChild("Plate")return iV~=nil and iV:FindFirstChild("EditStackAttachment",true)~=nil
end local iW=y:GetAttribute("PlotNumber")if iW~=nil then local fs=fr:FindFirstChild(tostring(iW))if fs and iU(fs)then return fs end
end for ux,iX in ipairs(fr:GetChildren())do if iU(iX)then return iX end end end local function cf(iY)local aY=iY and iY.Parent
for uy=1,6 do if not aY then return nil end if aY:IsA("BasePart")then return aY end if aY:IsA("Model")then return aY.PrimaryPart or aY:FindFirstChildWhichIsA("BasePart",true)end
aY=aY.Parent end end local function iZ(i0)local ft=i0 .Parent if ft and ft:IsA("Attachment")then return ft.WorldPosition end
local i1=cf(i0)return i1 and i1 .Position end local function oA()local bD=a.plot and a.plot:FindFirstChild("Plate")
if not bD then return nil end if bD:IsA("BasePart")then return bD.Position end if bD:IsA("Model")then return bD:GetPivot().Position end
local i2=bD:FindFirstChildWhichIsA("BasePart",true)return i2 and i2 .Position end local function i3()local fu={}
local i4=a.plot and a.plot:FindFirstChild("WaxStations")if i4 then for uz,oB in ipairs(i4:GetChildren())do local i5=oB:FindFirstChild("SquishyPlaceHolder")
local fv=i5 and i5:FindFirstChild("PlacePrompt")if fv and fv:IsA("ProximityPrompt")then fu[#fu+1]=fv end end end
return fu end local function fw()local i6,fx=i3(),0 for uA,oC in ipairs(i6)do if oC.Enabled then fx=fx+1 end end
local fy=#i6 local fz=y:GetAttribute("WaxStations")if type(fz)=="number"and fz>fy then fy=fz end return fx,fy
end local function oD()local i7=aH()local i8=i7 and i7 .HumanoidRootPart.Position local fA,i9 for uB,fB in ipairs(i3())do
if fB.Enabled then local i_=iZ(fB)local ja=(i_ and i8)and(i_-i8).Magnitude or 1e9 if not fA or ja<i9 then fA,i9=fB,ja end
end end return fA end local function fC()local dt=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not dt then return nil end local jb=dt:FindFirstChild("BuyPromptAttachment")local du=(jb and jb:FindFirstChild("BuyPrompt"))or dt:FindFirstChild("BuyPrompt",true)
if du and du:IsA("ProximityPrompt")and du:IsDescendantOf(dt)then return du end end local jc={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local oE={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local M={order={},price={},dirty=false}local z={seen={},at=0,boxes={},built=0}local J={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local fD="SAB_order.txt"local function fE()if not M.dirty or type(writefile)~="function"then return end local aj={}
for oF,oG in pairs(M.price)do aj[#aj+1]="P|"..oF.."|"..string.format("%.0f",oG)end for oH,oI in pairs(M.order)do aj[#aj+1]="O|"..oH.."|"..table.concat(oI,",")end
if d.learned and d.enc then aj[#aj+1]="M|mode|"..tostring(d.learned.mode or"")for oJ,dv in ipairs(d.learned.seq)do
local jd={}for je=1,dv.n do jd[je]=d.enc(dv.args[je])end aj[#aj+1]=("A|%d|%s|%d|%s"):format(oJ,dv.m,dv.n,table.concat(jd,";"))
end end local function fF(oK,oL,dw)local jf={}for jg=1,dw.n do jf[jg]=d.enc(dw.args[jg])end aj[#aj+1]=("R|%d|%s|%s|%d|%s"):format(oL,oK,dw.m,dw.n,table.concat(jf,";"))
end if d.enc then for oM,oN in ipairs(r.rec.rules)do fF("rules",oM,oN)end if r.rec.on then fF("on",0,r.rec.on)end
if r.rec.off then fF("off",0,r.rec.off)end end for uC,cg in pairs(z.seen)do aj[#aj+1]=("K|%s|%s|%s|%s"):format(cg.name,cg.title or"",cg.rar or"",cg.price and string.format("%.0f",cg.price)or"")
end if pcall(writefile,fD,table.concat(aj,"\n"))then M.dirty=false end end local function oO()if type(isfile)~="function"or type(readfile)~="function"then return end
local oP,oQ=pcall(isfile,fD)if not(oP and oQ)then return end local oR,jh=pcall(readfile,fD)if not(oR and type(jh)=="string")then return end
for oS in jh:gmatch("[^\n]+")do local bE,bF,aI=oS:match("^(%a)|([^|]+)|(.*)$")if bE=="P"then M.price[bF]=tonumber(aI)
elseif bE=="M"then d.loadMode=(aI~=""and aI~="nil")and aI or nil elseif bE=="A"and d.dec then local ji=tonumber(bF)
local jj,dx,oT=aI:match("^([^|]+)|(%d+)|(.*)$")if ji and jj then dx=tonumber(dx)local jk,dy={},0 for oU in(oT..";"):gmatch("([^;]*);")do
dy=dy+1 if dy<=dx then jk[dy]=d.dec(oU)end end d.loadSeq=d.loadSeq or{}d.loadSeq[ji]={m=jj,n=dx,args=jk}end elseif bE=="R"and d.dec then
local jl=tonumber(bF)local dz,oV,dA,oW=aI:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if jl and dz then dA=tonumber(dA)
local jm,dB={},0 for oX in(oW..";"):gmatch("([^;]*);")do dB=dB+1 if dB<=dA then jm[dB]=d.dec(oX)end end local fG={m=oV,n=dA,args=jm}
if dz=="rules"then r.rec.rules[jl]=fG elseif dz=="on"then r.rec.on=fG elseif dz=="off"then r.rec.off=fG end end
elseif bE=="K"then local jn,jo,oY=aI:match("^([^|]*)|([^|]*)|(.*)$")z.seen[z.key(bF)]={name=bF,title=jn~=""and jn or nil,
rar=jo~=""and jo or nil,price=tonumber(oY)}elseif bE=="O"and aI~=""then local dC={}for oZ in aI:gmatch("[^,]+")do dC[#dC+1]=oZ end
if#dC>0 then M.order[bF]=dC end end end end local function o0(dD)if type(dD)~="table"then return end local bj,jp=dD.rarity,dD.contents
if type(bj)~="string"or bj==""or type(jp)~="table"then return end local ci={}for uD,dE in ipairs(jp)do if type(dE)=="table"and type(dE.butter)=="string"then
ci[#ci+1]={n=dE.butter,ch=tonumber(dE.chance)or 0}end end if#ci==0 then return end table.sort(ci,function(o1,o2)return o1 .ch>o2 .ch end)
local cj,ck={},false for o3,o4 in ipairs(ci)do cj[o3]=o4 .n end local fH=M.order[bj]if not fH or#fH~=#cj then ck=true end
if not ck then for jq=1,#cj do if fH[jq]~=cj[jq]then ck=true break end end end M.order[bj]=cj local fI=tonumber(dD.price)
if fI and M.price[bj]~=fI then M.price[bj]=fI ck=true end if ck then M.dirty=true J.at=0 l("learned the "..bj.." order from its crate")
end end local function bG(o5,o6)local o7=o5:FindFirstChild(o6,true)local o8,fJ=pcall(function()return o7 .Text end)
return(o8 and type(fJ)=="string"and fJ~="")and fJ or nil end local function Q(jr)return J.pretty[jr]or jr end
z.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function z.key(o9)return dq(o9 or"")end
function z.learn(aJ)if type(aJ)~="table"or type(aJ.name)~="string"then return end local fK=z.key(aJ.name)local aK=z.seen[fK]or{}
local o_=(z.seen[fK]==nil)or(tonumber(aJ.price)and aK.price~=tonumber(aJ.price))aK.name,aK.title=aJ.name,aJ.title or aK.title
aK.rar,aK.price=aJ.rarity or aK.rar,tonumber(aJ.price)or aK.price z.seen[fK]=aK if o_ then z.at,M.dirty=q(),true end
end function z.wanted(js)return js~=nil and f.CrateTicks[z.key(js)]==true end function z.list()local bH={}for pa,dF in ipairs(z.base)do bH[z.key(dF[1])]={name=dF[1],title=dF[2],rar=dF[3],i=pa}end
for uE,cl in ipairs(J.rarOrder)do local jt=false for uF,pb in pairs(bH)do if pb.rar==cl then jt=true break end end
if not jt and cl~="?"then local ju=cl:gsub("[^%w]","").."Crate"bH[z.key(ju)]={name=ju,title=cl.." Crate",rar=cl,i=50,guess=true}
end end for jv,dG in pairs(z.seen)do local aD=bH[jv]or{i=100}aD.name,aD.title,aD.rar=dG.name or aD.name,dG.title or aD.title,dG.rar or aD.rar
aD.price,aD.guess=dG.price or aD.price,nil bH[jv]=aD end local cm,dH={},{}for pc,pd in ipairs(jc)do cm[pd]=pc end
for pe,jw in ipairs(J.rarOrder)do cm[jw]=cm[jw]or(20+pe)end for pf,cn in pairs(bH)do cn.k=pf cn.price=cn.price or M.price[cn.rar or""]
dH[#dH+1]=cn end table.sort(dH,function(bk,bl)if bk.price and bl.price and bk.price~=bl.price then return bk.price<bl.price end
local jx,jy=cm[bk.rar or""]or 99,cm[bl.rar or""]or 99 if jx~=jy then return jx<jy end if(bk.i or 100)~=(bl.i or 100)then return(bk.i or 100)<(bl.i or 100)end
return bk.k<bl.k end)return dH end local function pg()local jz=av:FindFirstChild("Assets")local jA=jz and jz:FindFirstChild("Squishies")
if not jA then return false end local fL,jB,bI={},{},{}local dI=0 for uG,dJ in ipairs(jA:GetChildren())do local co=L(dJ.Name)
if co~=""and not fL[co]then local dK=bG(dJ,"RarityText")or"?"fL[co]=dK jB[co]=bG(dJ,"NameText")or dJ.Name bI[dK]=bI[dK]or{}
table.insert(bI[dK],co)dI=dI+1 end end if dI==0 then return false end for jC,ph in pairs(bI)do local jD=M.order[jC]or oE[jC]
local fM={}if jD then for pj,pk in ipairs(jD)do fM[L(pk)]=pj end end table.sort(ph,function(jE,jF)local fN,fO=fM[jE],fM[jF]
if fN and fO then return fN<fO end if fN then return true end if fO then return false end return Q(jE)<Q(jF)end)
end local fP={}for pl,pm in ipairs(jc)do fP[pm]=pl end local dL={}for pn in pairs(bI)do dL[#dL+1]=pn end table.sort(dL,function(fQ,fR)
local fS,fT=M.price[fQ],M.price[fR]if fS and fT and fS~=fT then return fS<fT end local fU,fV=fP[fQ],fP[fR]if fU and fV then return fU<fV end
if fU then return true end if fV then return false end return fQ<fR end)J.rar,J.pretty,J.members,J.rarOrder,J.n,J.at=fL,jB,bI,dL,dI,q()
return true end local function fW()if J.at==0 or(q()-J.at)>120 then pcall(pg)end return J.n>0 end local function po(pp)
local jG=L(pp)return J.rar[jG]or(H.name and L(H.name)==jG and H.rar)or"?"end local function jH()local dM={}for pq,pr in pairs(f.Targets)do if pr then dM[#dM+1]=Q(pq)end end
table.sort(dM)return dM end local ae={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function jI()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function dN(jJ)if type(makefolder)~="function"then return end local ps,pt=pcall(isfolder,jJ)if not(ps and pt)then pcall(makefolder,jJ)end
end local function fX(jK)if type(isfile)~="function"or type(readfile)~="function"then return nil end local pu,pv=pcall(isfile,jK)
if not(pu and pv)then return nil end local pw,px=pcall(readfile,jK)return pw and px or nil end local function dO(py,pz)
if type(writefile)~="function"then return false end return(pcall(writefile,py,pz))end local function jL(pA)local cp={}
if type(listfiles)~="function"then return cp end local pB,jM=pcall(listfiles,pA)if not pB or type(jM)~="table"then return cp end
for uH,pC in ipairs(jM)do cp[#cp+1]=tostring(pC)end return cp end local function fY()local dP={}for uI,pD in ipairs(jL(ae.cfg))do
local jN=pD:match("([^/\\]+)%.txt$")if jN then dP[#dP+1]=jN end end table.sort(dP)return dP end local function pE()
local N={"V|1"}N[#N+1]="N|Every|"..tostring(f.Every)N[#N+1]="N|GlazeLead|"..tostring(f.GlazeLead)for uJ,jO in ipairs({"TeamNormal","TeamGlaze","TeamWax"})do N[#N+1]="S|"..jO.."|"..f[jO]end
do local dQ={}for pF,fZ in pairs(f.Pets)do local jP=(fZ.b and"b"or"")..(fZ.g and"g"or"")..(fZ.w and"w"or"")if jP~=""then dQ[#dQ+1]=pF.."|"..jP end
end table.sort(dQ)N[#N+1]="P|-"for uK,pG in ipairs(dQ)do N[#N+1]="P|"..pG end end for uL,jQ in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams"})do
N[#N+1]="B|"..jQ.."|"..(f[jQ]and"1"or"0")end local f0=y:GetAttribute("AutoRollRules")if type(f0)=="string"and f0~=""then f.ARrules,f.ARstop=f0,tostring(y:GetAttribute("AutoRollStop")or"")end
if f.ARrules~=""then N[#N+1]="S|rules|"..f.ARrules N[#N+1]="S|stop|"..f.ARstop end if a.winPos then N[#N+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then N[#N+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for uM,f1 in ipairs({{"T",f.Targets},{"K",f.CrateTicks}})do
local dR={}for pH,pI in pairs(f1[2])do if pI then dR[#dR+1]=pH end end table.sort(dR)N[#N+1]=f1[1].."|-"for uN,pJ in ipairs(dR)do N[#N+1]=f1[1].."|"..pJ end
end return table.concat(N,"\n")end local function pK(f2)if type(f2)~="string"or f2==""then return false end local jR,jS,jT,jU,cq={},false,{},false,nil
for pL in f2:gmatch("[^\n]+")do local aw,P,aq=pL:match("^(%a)|([^|]*)|?(.*)$")if aw=="N"and P=="Every"then local f3=tonumber(aq)
if f3 and f3>=1 then f.Every=math.floor(f3)end elseif aw=="N"and P=="GlazeLead"then local dS=tonumber(aq)if dS and dS>=5 and dS<=600 then f.GlazeLead=math.floor(dS)end
elseif aw=="S"and(P=="TeamNormal"or P=="TeamGlaze"or P=="TeamWax")then f[P]=aq elseif aw=="P"and P~=""then if not cq then cq={}end
if P~="-"and aq~=""then cq[P]={b=aq:find("b",1,true)and true or nil,g=aq:find("g",1,true)and true or nil,w=aq:find("w",1,true)and true or nil}
end elseif aw=="B"then if f[P]~=nil then f[P]=(aq=="1")end elseif aw=="S"and P=="rules"then f.ARrules=aq elseif aw=="S"and P=="stop"then
f.ARstop=aq elseif aw=="W"then a.winPos={tonumber(P)or 10,tonumber(aq)or 44}elseif aw=="G"then a.togPos={tonumber(P)or 10,tonumber(aq)or 300}
elseif aw=="T"and P~=""then if P~="-"then jR[P]=true end jS=true elseif aw=="K"and P~=""then if P~="-"then jT[P]=true end
jU=true end end if jS then f.Targets=jR end if jU then f.CrateTicks=jT end if cq then f.Pets=cq end return true
end local function f4(bJ)if not jI()then return false,"this executor cannot write files"end bJ=(bJ or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if bJ==""then return false,"give the config a name"end dN(ae.dir)dN(ae.cfg)if not dO(ae.cfg.."/"..bJ..".txt",pE())then return false,"could not write the file"end
a.config=bJ return true,bJ end local function jV(dT)local jW=fX(ae.cfg.."/"..dT..".txt")if not jW then return false,"no config called "..tostring(dT)end
if not pK(jW)then return false,"that config looks empty"end a.config=dT return true,dT end local function jX(f5)
if f5 then dN(ae.dir)dO(ae.auto,f5)elseif type(delfile)=="function"then pcall(delfile,ae.auto)else dO(ae.auto,"")
end a.autoload=f5 end local function f6()if a.selfPath then return a.selfPath end local dU for uO,pM in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ae.dir})do
for uP,jY in ipairs(jL(pM))do local f7=jY:lower()if f7:sub(-4)==".lua"and(f7:find("sab_farm",1,true)or f7:find("sab farm",1,true))then
dU=dU or jY end end end a.selfPath=dU return dU end ae.stub=[[
-- SAB autoloader: finds the saved SAB farm script and runs it on join.
task.spawn(function()
    task.wait(8)
    if type(listfiles) ~= "function" or type(readfile) ~= "function" then return end
    for _, d in ipairs({ "", "scripts", "Scripts", "Delta", "Delta/Scripts", "SAB" }) do
        local ok, fs = pcall(listfiles, d)
        if ok and type(fs) == "table" then
            for _, f in ipairs(fs) do
                local s, low = tostring(f), tostring(f):lower()
                if low:sub(-4) == ".lua" and low:find("sab_farm", 1, true) and not low:find("autoload", 1, true) then
                    local okr, src = pcall(readfile, s)
                    if okr and type(src) == "string" and #src > 1000 then
                        local fn = loadstring(src)
                        if fn then pcall(fn) return end
                    end
                end
            end
        end
    end
end)
]]
local function pN()if not jI()then return false,"this executor cannot write files"end dN("autoexec")if not dO(ae.exec,ae.stub)then return false,"could not write to the autoexec folder"end
local jZ=f6()return true,jZ and("it will load "..jZ)or"now save this script in Delta so the loader can find it"
end local dV=(function()local pO,pP=pcall(function()return game:GetService("TeleportService")end)return pO and pP or nil end)()
local function j0()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local pQ=queueonteleport or queue_on_teleport local j1=f6()if not j1 then return false end return(pcall(pQ,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(j1)))
end local function dW(pR)if a.rejoining then return end a.rejoining=true l("REJOIN ("..pR..")")pcall(fE)if a.autoload then pcall(f4,a.autoload)end
local pS=j0()l(pS and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for uQ=1,30 do if not dV then break end pcall(function()dV:Teleport(game.PlaceId,y)end)task.wait(10)
end end)end local function pT()local pU,j2=pcall(function()return game:GetService("GuiService")end)if pU and j2 then
pcall(function()T(j2 .ErrorMessageChanged:Connect(function()if f.Rejoin then dW("roblox error message")end end))
end)end pcall(function()local j3=game:GetService("CoreGui")local j4=j3 and j3:WaitForChild("RobloxPromptGui",15)
local j5=j4 and j4:WaitForChild("promptOverlay",15)if j5 then T(j5 .ChildAdded:Connect(function(pV)if f.Rejoin and tostring(pV.Name):lower():find("errorprompt",1,true)then dW("disconnect prompt")end
end))end end)pcall(function()T(y.OnTeleport:Connect(function(pW)if tostring(pW):find("Started")then j0()end end))
end)if dV then pcall(function()T(dV.TeleportInitFailed:Connect(function()a.rejoining=false if f.Rejoin then task.delay(5,function()dW("teleport retry")end)end
end))end)end end local function j6(pX)local j7=a.plot and a.plot:FindFirstChild(pX)if not j7 then return nil,false end
for uR,f8 in ipairs(j7:GetChildren())do if f8:IsA("Model")or f8:IsA("BasePart")then return f8,true end end return nil,true
end local function bK()local aZ=j6("RolledSquishy")if not aZ then return nil end return{model=aZ,name=aZ.Name,pretty=bG(aZ,"NameText")or Q(L(aZ.Name)),
rar=bG(aZ,"RarityText")or po(aZ.Name),price=bG(aZ,"PriceText")}end local function j8(f9)return type(f9)=="string"and(J.rar[L(f9)]~=nil or op(f9))
end local function K()local f_=j6("SquishyEquipped")if f_ then a.carrySrc,d.heldAt="model",q()return f_.Name,f_ end
local j9=y.Character if j9 then for uS,cr in ipairs(j9:GetDescendants())do if(cr:IsA("Model")or cr:IsA("Tool"))and j8(cr.Name)then
a.carrySrc,d.heldAt="character",q()return cr.Name,cr end end end local dX=y:GetAttribute("SquishyEquipped")if type(dX)=="string"and dX~=""and j8(dX)and q()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return dX,nil end a.carrySrc=nil end local function uT()local uU,pY=K()return pY end local function j_()
local ka=bK()local ga=ka and ot(ka.price)local gb=aC()if ga and gb and gb<ga*0.5 then return gb,ga end end local function bL(pZ)
bi[#bi+1]=os.date("%H:%M:%S").." "..pZ if#bi>40 then table.remove(bi,1)end end local function p0(bm,dY)if type(bm)~="string"then return end
bL(("Roll(%s,%s)"):format(bm,tostring(dY)))if bm:lower():find("crate",1,true)then d.rolled,d.rolledAt=bm,q()return
end H.seq=H.seq+1 H.name,H.at=bm,q()H.rar=type(dY)=="string"and dY or nil a.rolls=a.rolls+1 if aW(bm)then l(("ROLL %s [%s] = TARGET"):format(bm,tostring(dY)))end
end local function p1(bn)if type(bn)~="table"then return end local dZ=bn.butter or bn.itemName if type(dZ)~="string"then return end
a.gifts=a.gifts+1 H.gift,H.giftAt=dZ,q()if type(bn.giftId)=="string"then local kb=av:FindFirstChild("Remotes")
local kc=kb and kb:FindFirstChild("GiftThanks")if kc then pcall(function()kc:FireServer(bn.giftId)end)end end
bL("Gift("..dZ.." from "..tostring(bn.fromName)..")")l(("GIFT from %s: %s - it will not be waxed"):format(tostring(bn.fromName),dZ))
end local function p2()local kd=av:WaitForChild("Remotes",30)if not a.alive then return end if not kd then l("Remotes folder missing - no roll events")return end
T(y:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local ke=y:GetAttribute("SquishyEquipped")
if type(ke)=="string"and ke~=""then d.heldAt=q()end end))local p8={SquishyRollAnimation=p0,InitSquishy=function(kf)H.init,H.initAt=tostring(kf),q()bL("Init("..tostring(kf)..")")end,
CrateUpdate=function(bM,kg)pcall(o0,bM)pcall(z.learn,bM)if type(bM)=="table"then local p3=kg==true or(d.rolled~=nil and q()-d.rolledAt<15)or d.waiting
if not p3 then return end local p4=not d.waiting local p5=d.on d.waiting,d.data,d.at=true,bM,q()d.on=(kg==true)
d.title=tostring(bM.title or bM.name or"crate")if d.on and not p5 then d.openedAt,d.byYou=q(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then bL("CrateWindow open("..d.title..")")elseif p4 then bL("Crate waiting("..d.title..")")l(d.title.." is waiting on your stand")
end else if d.waiting then bL("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local p6=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,p6)end if d.classify then local p7=q()
task.spawn(function()pcall(d.classify,p7)end)end end end,GiftReceived=p1,}for d0,p9 in pairs(p8)do local gc=kd:FindFirstChild(d0)
if gc and gc:IsA("RemoteEvent")then T(gc.OnClientEvent:Connect(p9))elseif d0~="CrateUpdate"and d0~="GiftReceived"then l("remote "..d0 .." missing")end
end end local function gd()local bo=bK()if bo then if aW(bo.name)then return{state="match",shown=bo.pretty,src="pad",info=bo}
end return{state="skip",info=bo,level="idle",text=("on pad: %s [%s] - not ticked"):format(bo.pretty,tostring(bo.rar))}
end if H.name and(q()-H.at)<4 then if aW(H.name)then return{state="match",shown=Q(L(H.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(Q(L(H.name)),tostring(H.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function kh(p_,qa,qb,qc)
local d1=RaycastParams.new()d1 .FilterType=Enum.RaycastFilterType.Exclude local ge={y.Character}for uV,qd in ipairs(qc or{})do ge[#ge+1]=qd end
d1 .FilterDescendantsInstances=ge pcall(function()d1 .RespectCanCollide=true end)local ki=cc:Raycast(Vector3 .new(p_,qa+4,qb),Vector3 .new(0,-30,0),d1)
return ki and ki.Position or nil end local function gf(kj)local kk=kj:FindFirstChildOfClass("Humanoid")return((kk and kk.HipHeight)or 2)+kj.HumanoidRootPart.Size.Y/2+0.2
end local function gg(qe,qf)local kl=qe:FindFirstChildOfClass("Humanoid")local qg=q()while q()-qg<qf do if kl and kl.FloorMaterial~=Enum.Material.Air then return true end
ao(0.05)end return false end local function cs(qh,gh,gi)local km=qh.HumanoidRootPart km.AssemblyLinearVelocity=Vector3 .new(0,0,0)
km.CFrame=gi and CFrame.new(gh,Vector3 .new(gi.X,gh.Y,gi.Z))or CFrame.new(gh)end local function ct(aL,kn)local bp=aH()
if not bp or not aL then return false end local a0=aL.Position local d2=math.clamp(math.max(aL.Size.X,aL.Size.Z)/2+2.2,3,7)
local ko=(kn and kn.MaxActivationDistance)or 10 if d2>ko-2 then d2=math.max(2.5,ko-2)end local cu={}local function bq(cv)
cv=Vector3 .new(cv.X,0,cv.Z)if cv.Magnitude>0.05 then cu[#cu+1]=cv.Unit end end local kp=oA()if kp then bq(kp-a0)end
bq(aL.CFrame.LookVector)bq(-aL.CFrame.LookVector)bq(aL.CFrame.RightVector)bq(-aL.CFrame.RightVector)bq(bp.HumanoidRootPart.Position-a0)
if#cu==0 then bq(Vector3 .new(0,0,1))end local qi,d3=gf(bp),false for uW,qj in ipairs(cu)do local d4=a0+qj*d2
local gj=kh(d4 .X,a0 .Y,d4 .Z,{aL})if gj and math.abs(gj.Y-a0 .Y)<14 then cs(bp,Vector3 .new(d4 .X,gj.Y+qi,d4 .Z),a0)
if gg(bp,0.7)then d3=true break end end end if not d3 then cs(bp,a0+cu[1]*d2+Vector3 .new(0,3,0),a0)d3=gg(bp,1)
end ao(0.12)return d3 end local function qk(cw)if not cw.Parent or not cw.Enabled then return false end pcall(function()cw:InputHoldBegin()end)
ao(math.max(cw.HoldDuration,0)+0.08)pcall(function()cw:InputHoldEnd()end)return true end local function ac(kq,ql)
local qm=q()while q()-qm<ql do if kq()then return true end ao(0.05)end return kq()end local function d5(bN,qn,kr,qo)
local qp=a.zapFirst and{"zap","hold"}or{"hold","zap"}for qq,gk in ipairs(qp)do if qq==2 and(qo or not(bN.Parent and bN.Enabled and(not kr or kr())))then break end
local gl if gk=="hold"then gl=qk(bN)else gl=type(fireproximityprompt)=="function"and bN.Parent~=nil and bN.Enabled and pcall(fireproximityprompt,bN)end
if gl and ac(qn,1.2)then a.zapFirst=(gk=="zap")return true,gk end end return false end local function ks(gm)local a1=fC()
if not a1 or not a1 .Enabled then l("buy: nothing on the pad")return false end local kt=cf(a1)if not kt then l("buy: pad part missing")return false end
a.lastBuyAt=q()local qr,ku=H.seq,aC()ct(kt,a1)if not a1 .Enabled then l("buy aborted: pad emptied")return false end
local bO=gd()if not gm and bO.state~="match"then l("buy aborted: "..(bO.text or"pad changed"))a.matchSince=nil
return false end local gn=bO.info and bO.info.name or(bO.state=="match"and H.name)or nil local function qs()return a1 .Enabled and K()==nil and(gm or gd().state=="match")
end local qt,qu=d5(a1,function()return K()~=nil or((not a1 .Enabled)and(gm or H.seq==qr))end,qs,j_()~=nil)if qt then
ac(function()return K()~=nil end,0.8)local cx=K()local kv=aC()a.holding,a.bought,a.cashFails=true,a.bought+1,0
a.matchSince=nil H.name,H.rar,H.at=nil,nil,q()l(("BOUGHT %s%s via %s"):format(cx and Q(L(cx))or(bO.shown or"?"),(ku and kv)and(" for $"..ag(ku-kv))or"",qu))
if cx and gn and L(cx)~=L(gn)then l(("note: picked up %s, not %s"):format(cx,gn))end return true end a.cashFails=a.cashFails+1
a.noCashUntil=q()+math.min(8*2^(a.cashFails-1),60)local kw=bK()l(("BUY REFUSED: cash short? have $%s, price %s"):format(ag(aC()),(kw and kw.price)or"?"))
return false end local function kx()local d6=K()if not d6 then a.holding=false l("place: hands are empty")return false
end if not aW(d6)then l(("REFUSED TO WAX %s - it is not ticked"):format(Q(L(d6))))return false end for uX=1,f.PlaceTries do
local a2=oD()if not a2 then l("place: no free station")break end local ky=cf(a2)if ky then ct(ky,a2)local kz=K()
if not kz then a.holding=false l("place: hands emptied on the way")return false end if not aW(kz)then l("place: what I carry changed, not waxing it")return false end
if a2 .Enabled then local qv,qw=d5(a2,function()return not a2 .Enabled end,function()return a2 .Enabled end)if qv then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=q()+2.5,0 H.name,H.rar,H.at=nil,nil,q()
l(("WAXED %s #%d at %s via %s"):format(Q(L(d6)),a.placed,a2 .Parent.Parent.Name,qw))return true end end end ao(0.25)
end a.placeFails=a.placeFails+1 if K()==nil then a.holding=false end l("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then
a.capHit,a.running,a.capAt=true,false,q()a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(K()))l(a.capMsg)end return false end function o.place()if f.Teams and f.TeamWax~=""then o.placing=true
local qx=q()while a.alive and o.current()~=f.TeamWax and q()-qx<5 do ao(0.1)end if o.current()==f.TeamWax then ao(0.25)else l("wax team did not come on in time - placing anyway")end
end local qy,kA=pcall(kx)o.placing=false if not qy then error(kA,0)end return kA end local function kB(kC)return type(kC)=="string"and kC:lower():find("crate",1,true)~=nil
end local qz={SABFarmGui=1,SABToggle=1,SABError=1}local function d7(qA)local a3=qA while a3 do if qz[a3 .Name]then return false end
if a3:IsA("ScreenGui")then local qB,qC=pcall(function()return a3 .Enabled end)return(not qB)or qC~=false end if a3:IsA("GuiObject")and not a3 .Visible then return false end
a3=a3 .Parent end return false end local function bP(d8)local bQ=""pcall(function()if d8:IsA("TextButton")then bQ=d8 .Text end end)
if not bQ:find("%a")then for uY,d9 in ipairs(d8:GetDescendants())do if(d9:IsA("TextLabel")or d9:IsA("TextButton"))and d9 .Text:find("%a")then bQ=d9 .Text break end
end end if not bQ:find("%a")then bQ=d8 .Name end return(bQ:lower():gsub("[^%a]",""))end local function qD()local cy,cz
local kD=y:FindFirstChildOfClass("PlayerGui")if not kD then return nil,nil end for uZ,cA in ipairs(kD:GetDescendants())do
if cA:IsA("GuiButton")and d7(cA)then local go=bP(cA)if go:sub(1,4)=="open"and not go:find("shop",1,true)then cy=cy or cA end
if go:sub(1,7)=="discard"then cz=cz or cA end end end if cy and cz then return cy,cz end if d.on then return cy,cz end
return nil,nil end local d_=(function()local qE,qF=pcall(function()return game:GetService("VirtualInputManager")end)return qE and qF or nil end)()
local function kE(aM,gp)local gq={}local function kF(qG)gq[#gq+1]=qG end if a.tapWay then kF(a.tapWay)end for u0,kG in ipairs({"touch","conn","signal"})do
if kG~=a.tapWay then kF(kG)end end local function kH(qH,...)local qI,gr=pcall(getconnections,qH)if not(qI and type(gr)=="table"and#gr>0)then return false end
local kI,qJ,qK=false,{...},select("#",...)for u1,qL in ipairs(gr)do if pcall(function()qL:Fire(table.unpack(qJ,1,qK))end)then kI=true end
end return kI end local function kJ()local kK=Vector3 .new(0,0,0)pcall(function()local kL,kM=aM.AbsolutePosition,aM.AbsoluteSize
kK=Vector3 .new(kL.X+kM.X/2,kL.Y+kM.Y/2,0)end)local gs={Position=kK,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()gs.UserInputType=Enum.UserInputType.Touch end)pcall(function()gs.UserInputState=Enum.UserInputState.End end)
return gs end for u2,aN in ipairs(gq)do local cB=false if aN=="conn"and type(getconnections)=="function"then if kH(aM.MouseButton1Click)then
cB=true if ac(gp,1.5)then a.tapWay=aN return true,aN end end cB=kH(aM.Activated,kJ(),1)elseif aN=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aM.MouseButton1Click)then if ac(gp,1.5)then a.tapWay=aN return true,aN end end cB=pcall(firesignal,aM.Activated,kJ(),1)
elseif aN=="touch"and d_ then cB=pcall(function()local kN,kO=aM.AbsolutePosition,aM.AbsoluteSize local kP=0 local kQ=aM:FindFirstAncestorWhichIsA("ScreenGui")
local qM,qN=pcall(function()return kQ and kQ.IgnoreGuiInset end)if not(qM and qN)then pcall(function()kP=game:GetService("GuiService"):GetGuiInset().Y end)
end local kR,kS=kN.X+kO.X/2,kN.Y+kO.Y/2+kP d_:SendMouseButtonEvent(kR,kS,0,true,game,1)task.wait(0.06)d_:SendMouseButtonEvent(kR,kS,0,false,game,1)
end)end if cB and ac(gp,1.5)then a.tapWay=aN return true,aN end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function ea(kT)local cC=kT.Parent while cC and cC~=a.plot do if d.NOT[cC.Name]then return false end cC=cC.Parent
end local gt=(kT.ActionText or""):lower()if gt:find("roll",1,true)or gt:find("place",1,true)or gt:find("sell",1,true)then return false end
return true end local function kU()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local kV=a.plot:FindFirstChild("CrateStand")local cD if kV then for u3,eb in ipairs(kV:GetDescendants())do
if eb:IsA("ProximityPrompt")and eb.Enabled and ea(eb)then cD=eb break end end end if not cD then for u4,a4 in ipairs(a.plot:GetDescendants())do
if a4:IsA("ProximityPrompt")and a4 .Enabled and ea(a4)then local kW=a4:FindFirstAncestorWhichIsA("Model")local qO=((a4 .ActionText or"").." "..(a4 .ObjectText or"").." "..a4 .Name.." "..(kW and kW.Name or"")):lower()
if qO:find("crate",1,true)then cD=a4 break end end end end d.prompt=cD return cD end local function gu()if d.on then return true end
local cE=kU()if not cE then d.summonFails=d.summonFails+1 d.lastFail=q()l("crate: cannot find where to open "..d.title.." - open it once by hand, then DUMP")
return false end local kX=cf(cE)if kX then ct(kX,cE)end d.ours=true d5(cE,function()return d.on end)if ac(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=q()l("crate: pressed "..ap(cE).." but no window came up")
return false end do local function qP(kY)local bR=kY.Parent while bR and bR:IsA("GuiObject")do local kZ,k0=false,false
for u5,cF in ipairs(bR:GetDescendants())do if cF~=kY and cF:IsA("GuiButton")and bP(cF):sub(1,7)=="discard"then kZ=true end
if cF:IsA("TextLabel")then local gv=cF.Text:lower()if gv:find("crate",1,true)or gv:find("can contain",1,true)or gv:find("cost",1,true)then k0=true end
end if kZ and k0 then return bR end end bR=bR.Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local k1=y:FindFirstChildOfClass("PlayerGui")if not k1 then return nil end for u6,ec in ipairs(k1:GetDescendants())do
if ec:IsA("GuiButton")and not ec:FindFirstAncestor("SABFarmGui")and bP(ec):sub(1,4)=="open"then local gw=qP(ec)
if gw then d.win=gw return gw end end end end local function qQ(qR)for u7,ed in ipairs(qR:GetDescendants())do
if ed:IsA("GuiButton")then local k2,gx=bP(ed),ed.Name:lower()if k2=="x"or k2=="close"or gx=="x"or gx:find("close",1,true)or gx:find("exit",1,true)then return ed end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(qS)task.wait(qS and 4 or 1.2)if d.on or d.waiting then return end
local ee=d.findWin()if not ee or not d7(ee)then return end local k3=qQ(ee)if k3 and kE(k3,function()return not d7(ee)end)then return end
l("the crate window is still open - tap its X")end end local function ef(eg)if not gu()then return false end local k4=q()-(d.openedAt or 0)
if k4<0.6 then ao(0.6-k4)end local gy=d.title local qT,qU=qD()local k5=eg and qT or qU if not k5 then d.lastFail=q()
a.crateFails=a.crateFails+1 l(("crate: no %s button found in %s"):format(eg and"Open"or"Discard",gy))return false
end local qV=K()local qW,u8=kE(k5,function()return(not d.on)or(K()~=nil and K()~=qV)end)if not qW then d.lastFail=q()
a.crateFails=a.crateFails+1 l("crate: could not press "..(eg and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if eg then a.crates=a.crates+1 ac(function()return K()~=nil end,1.5)local k6=K()
l(("OPENED %s -> %s"):format(gy,k6 and Q(L(k6))or"?"))else l("discarded "..gy.." (nothing ticked in it)")end return true
end d.calls={}function d.saw(qX,...)local qY=select("#",...)d.calls[#d.calls+1]={t=q(),m=qX,n=qY,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(ak,aO)local a5=type(ak)if(a5=="string"or a5=="number")and type(aO.data)=="table"then for k7,gz in pairs(aO.data)do
if gz==ak and type(k7)=="string"and(type(gz)=="string"or type(gz)=="number")then return{__slot="f:"..k7}end end
end if a5=="string"then if aO.crate and ak==aO.crate then return{__slot="crate"}end if aO.title and ak==aO.title then return{__slot="title"}end
if aO.rar and ak==aO.rar then return{__slot="rarity"}end return ak end if a5=="number"or a5=="boolean"or a5=="nil"then return ak end
if a5=="table"then local k8={}for qZ,k9 in pairs(ak)do if type(k9)=="table"then return nil,"nested table"end local q0,k_=d.slot(k9,aO)
if k_ then return nil,k_ end k8[qZ]=q0 end return k8 end local q1,q2=pcall(function()return ak:IsA("Instance")end)
if q1 and q2 then if ak==y then return{__slot="player"}end if a.plot and ak==a.plot then return{__slot="plot"}end
local eh=a.plot and a.plot:FindFirstChild("CrateStand")if eh and ak==eh then return{__slot="stand"}end if eh and ak.Parent==eh then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..a5 ..")"end function d.resolve(ei)if type(ei)~="table"then return ei end
local ax=ei.__slot if ax and ax:sub(1,2)=="f:"then return d.data and d.data[ax:sub(3)]end if ax=="crate"then return d.data and d.data.name end
if ax=="title"then return(d.data and d.data.title)or d.title end if ax=="rarity"then return d.data and d.data.rarity end
if ax=="player"then return y end if ax=="plot"then return a.plot end if ax=="stand"or ax=="model"then local gA=a.plot and a.plot:FindFirstChild("CrateStand")
if ax=="stand"or not gA then return gA end for u9,la in ipairs(gA:GetChildren())do if kB(la.Name)then return la end end
return nil end local lb={}for q3,q4 in pairs(ei)do lb[q3]=d.resolve(q4)end return lb end function d.classify(gB)
if d.directOff then return end local ej={}for u_,gC in ipairs(d.calls)do if gC.t<=gB+0.05 and gB-gC.t<=6 then ej[#ej+1]=gC end
end if#ej==0 then return end if not ac(function()return(d.heldAt or 0)>=gB-1 end,2.5)then return end local cG={}
for va,cH in ipairs(ej)do local lc={}for ld=1,cH.n do local q5,le=d.slot(cH.args[ld],cH)if le then l("crate call has "..le.." - keeping the button method")
return end lc[ld]=q5 end cG[#cG+1]={m=cH.m,n=cH.n,args=lc}end local gD=d.learned d.learned={seq=cG,mode=gD and gD.mode or nil}
M.dirty=true if not gD then l(("learned how to open crates directly (%d call%s)"):format(#cG,#cG==1 and""or"s"))end
end function d.replay()local lf=d.learned local lg=av:FindFirstChild("Remotes")local gE=lg and lg:FindFirstChild("CrateAction")
if not(lf and gE)then return false end local lh=table.unpack or unpack d.replaying=true for vb,cI in ipairs(lf.seq)do
local gF={}for li=1,cI.n do gF[li]=d.resolve(cI.args[li])end task.spawn(function()pcall(function()if cI.m=="InvokeServer"then gE:InvokeServer(lh(gF,1,cI.n))
else gE:FireServer(lh(gF,1,cI.n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(q6)return(q6:gsub("[%%|;=,\n]",function(q7)return("%%%02X"):format(q7:byte())end))end
function d.enc(br)local ek=type(br)if ek=="string"then return"s"..d.esc(br)end if ek=="number"then return"n"..tostring(br)end
if ek=="boolean"then return br and"b1"or"b0"end if ek=="nil"then return"z"end if br.__slot then return"k"..br.__slot end
local gG={}for q8,q9 in pairs(br)do gG[#gG+1]=d.enc(q8).."="..d.enc(q9)end return"t"..table.concat(gG,",")end
function d.dec(lj)local cJ,cK=lj:sub(1,1),lj:sub(2)local function q_(ra)return(ra:gsub("%%(%x%x)",function(rb)return string.char(tonumber(rb,16))end))end
if cJ=="s"then return q_(cK)end if cJ=="n"then return tonumber(cK)end if cJ=="b"then return cK=="1"end if cJ=="k"then return{__slot=cK}end
if cJ=="t"then local lk={}for rc in cK:gmatch("[^,]+")do local ll,rd=rc:match("^(.-)=(.*)$")if ll then local lm=d.dec(ll)
if lm~=nil then lk[lm]=d.dec(rd)end end end return lk end return nil end function d.goneOrNew(re)return function()
if not d.waiting then return true end local ln=K()return ln~=nil and ln~=re end end function d.near()local lo=av:FindFirstChild("Remotes")
local lp=lo and lo:FindFirstChild("CrateAction")local gH=aH()local gI=a.plot and a.plot:FindFirstChild("CrateStand")
local gJ=gI and gI:FindFirstChild("Spot")if not(lp and gH and gJ)then return false,"no crate stand or remote"end
local gK=gH.HumanoidRootPart local el=gK.CFrame local lq,gL=d.title,"no answer"local rf=K()local lr=gI:FindFirstChild("Holder")
local function ls()if not lr then return d.waiting or d.on end for vc,rg in ipairs(lr:GetChildren())do if rg:IsA("Model")then return true end end
return false end for rh=1,3 do if not(d.waiting or d.on)or not ls()then d.waiting,d.on,d.quietUntil=false,false,q()+4
return true,"already gone"end if(gK.Position-gJ.Position).Magnitude>8 then ct(gJ,d.prompt)end ao(0.12+0.15*rh)
local aE={}d.replaying=true task.spawn(function()aE.ok,aE.v=pcall(function()return lp:InvokeServer("open")end)
aE.done=true end)ac(function()return aE.done end,6)d.replaying=false local bs=aE.v if aE.done and aE.ok and type(bs)=="table"and bs.ok then
a.crates,d.fails,d.nearFails=a.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,q()+4 l(("OPENED %s -> %s (no window)"):format(lq,bs.prize and Q(L(tostring(bs.prize)))or"?"))
ac(function()local lt=K()return lt~=nil and lt~=rf end,1.5)if(gK.Position-el.Position).Magnitude>8 then pcall(function()cs(gH,el.Position,el.Position+el.LookVector)end)end
return true,"opened"end gL=(aE.done and aE.ok and type(bs)=="table")and tostring(bs.reason or"refused, no reason given")
or(aE.done and("error: "..tostring(bs))or"no answer in 6s")ao(0.3)if not ls()then d.waiting,d.on,d.quietUntil=false,false,q()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 l(("crate: the server would not open %s next to the stand (%s)"):format(lq,gL))
return false,gL end function d.smart()local gM=d.title if(d.nearFails or 0)<3 then local ri=d.near()if ri then return true end
if d.nearFails>=3 then l("opening next to the stand failed 3 times - trying the older ways")end end local bt=d.learned
if bt then local gN=K()if d.on then d.replay()if ac(d.goneOrNew(gN),3.5)then a.crates=a.crates+1 l("OPENED "..gM.." (direct)")
return true end else if bt.mode~="window"then d.replay()if ac(d.goneOrNew(gN),3.5)then a.crates,d.fails=a.crates+1,0
if bt.mode~="direct"then bt.mode,M.dirty="direct",true l("crates now open directly - the window never comes up")
end l("OPENED "..gM.." (direct, no window)")return true end end if gu()then d.replay()if ac(d.goneOrNew(gN),3.5)then
a.crates,d.fails=a.crates+1,0 if bt.mode~="window"then bt.mode,M.dirty="window",true l("crates need their window up first - it shows briefly")
end l("OPENED "..gM.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,M.dirty=bt,nil,true
if d.fails>=3 then d.directOff=true l("direct crate opening failed 3 times - using the button for now (see DUMP)")
else l("the learned crate call did not work - back to pressing Open")end end return ef(true)end function r.snap()
return{rules=y:GetAttribute("AutoRollRules"),stop=y:GetAttribute("AutoRollStop"),on=y:GetAttribute("AutoRollOn"),main=y:GetAttribute("AutoRoll")}
end r.cache={}function r.watchCache()r.cache=r.snap()for rj,lu in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do
T(y:GetAttributeChangedSignal(lu):Connect(function()r.cache[rj]=y:GetAttribute(lu)end))end end function r.isOn()return y:GetAttribute("AutoRollOn")==true end
function r.saw(rk,...)local em=r.cache local rl={m=rk,n=select("#",...),args={...},before={rules=em.rules,stop=em.stop,on=em.on,main=em.main}}
task.delay(1.5,function()if a.alive then pcall(r.learnOne,rl)end end)end function r.learnOne(cL)local af,cM=r.snap(),cL.before
local en=(af.rules~=cM.rules)or(af.stop~=cM.stop)local lv=(af.on~=cM.on)or(af.main~=cM.main)if not en and not lv then return end
local lw={}for lx=1,cL.n do local ar=cL.args[lx]local bu=type(ar)if bu=="string"and ar~=""and ar==af.rules then ar={__slot="rules"}
elseif bu=="string"and ar~=""and en and ar==af.stop and af.stop~=cM.stop then ar={__slot="stop"}elseif bu=="table"then
local ly={}for rm,bS in pairs(ar)do if type(bS)=="table"or(type(bS)=="userdata")then r.msg="Auto Roll sends something I cannot repeat"return
end ly[rm]=(type(bS)=="string"and bS~=""and bS==af.rules)and{__slot="rules"}or bS end ar=ly elseif bu~="string"and bu~="number"and bu~="boolean"and bu~="nil"then
if ar==y then ar={__slot="player"}else r.msg="Auto Roll sends something I cannot repeat"return end end lw[lx]=ar
end local bT={m=cL.m,n=cL.n,args=lw}if en then local gO=false for rn=1,bT.n do local cN=bT.args[rn]if type(cN)=="table"and cN.__slot=="rules"then gO=true end
if type(cN)=="table"and not cN.__slot then for vd,lz in pairs(cN)do if type(lz)=="table"and lz.__slot=="rules"then gO=true end end
end end if gO then r.rec.rules={bT}else table.insert(r.rec.rules,bT)if#r.rec.rules>60 then table.remove(r.rec.rules,1)end
end end if lv then if af.on==true then r.rec.on=bT else r.rec.off=bT end f.AutoRoll=(af.on==true)end if af.rules and af.rules~=""then f.ARrules,f.ARstop=af.rules,af.stop or""end
M.dirty=true r.msg=""l(("learned an Auto Roll %s message"):format(en and"choices"or(af.on and"on"or"off")))end
function r.resolve(bU)if type(bU)~="table"then return bU end if bU.__slot=="rules"then return f.ARrules~=""and f.ARrules or y:GetAttribute("AutoRollRules")end
if bU.__slot=="stop"then return f.ARstop~=""and f.ARstop or y:GetAttribute("AutoRollStop")end if bU.__slot=="player"then return y end
local lA={}for ro,rp in pairs(bU)do lA[ro]=r.resolve(rp)end return lA end function r.replay(lB,rq)local lC=table.unpack or unpack
for ve,cO in ipairs(rq)do local gP={}for lD=1,cO.n do gP[lD]=r.resolve(cO.args[lD])end r.replaying=true pcall(function()
if cO.m=="InvokeServer"then task.spawn(function()pcall(function()lB:InvokeServer(lC(gP,1,cO.n))end)end)else lB:FireServer(lC(gP,1,cO.n))end
end)r.replaying=false task.wait(0.25)end end function r.apply(lE,rr)if r.busy or not a.alive then return end r.busy=true
pcall(function()local lF=av:FindFirstChild("Remotes")local gQ=lF and lF:FindFirstChild("AutoRollAction")if not gQ then r.msg="this game has no AutoRollAction"return end
local a6=f.AutoRoll if a6 and f.ARrules~=""and y:GetAttribute("AutoRollRules")~=f.ARrules then if#r.rec.rules==0 then
r.msg="pick your Auto Roll choices once in the game's menu so I can learn them"l(r.msg)else r.replay(gQ,r.rec.rules)
if ac(function()return y:GetAttribute("AutoRollRules")==f.ARrules end,4)then l("Auto Roll choices put back")else
r.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"l(r.msg)end end end if a6==r.isOn()or(not a6 and not rr)then return end
local eo=a6 and r.rec.on or r.rec.off if not eo then local cP=a6 and r.rec.off or r.rec.on local lG=cP~=nil for rs=1,cP and cP.n or 0 do
if type(cP.args[rs])=="boolean"then lG=false end end if lG then eo=cP end end if not eo then r.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(a6 and"on"or"off")
l(r.msg)return end r.replay(gQ,{eo})if ac(function()return r.isOn()==a6 end,4)then r.msg=""l(("Auto Roll switched %s%s"):format(a6 and"ON"or"OFF",lE and(" ("..lE..")")or""))
else r.msg="Auto Roll did not switch - do it once in the game so I can relearn it"l(r.msg)end end)r.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local rt,ru=pcall(function()return y.UserId end)return rt and ru or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local rv,gR=pcall(function()return require(av:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if rv and type(gR)=="table"and type(gR.Pets)=="table"then j.I=gR end return j.I end function j.order()if j.list then return j.list end
local a7=j.info()if not a7 then return{}end local bv={}if type(a7 .Order)=="table"and#a7 .Order>0 then for vf,lH in ipairs(a7 .Order)do if a7 .Pets[lH]then bv[#bv+1]=lH end end
else for rw in pairs(a7 .Pets)do bv[#bv+1]=rw end table.sort(bv,function(rx,ry)return(a7 .Pets[rx].price or 0)<(a7 .Pets[ry].price or 0)end)
end j.list=bv return bv end function j.nice(lI,gS)local lJ=j.info()local lK=lJ and lJ.Pets[lI]return((gS and gS~="")and(gS.." ")or"")..(lK and lK.displayName or tostring(lI))
end function j.data()local lL=y:GetAttribute("PetsData")if type(lL)~="string"then return nil end local rz,lM=pcall(function()return j.HS:JSONDecode(lL)end)
return(rz and type(lM)=="table")and lM or nil end function j.pen()return av:FindFirstChild("PetMeadowSpawns")end
function j.srv()return cc:GetServerTimeNow()end function j.money()local gT=y:FindFirstChild("MoneyValue")if gT and type(gT.Value)=="number"then return gT.Value end
return aC()or 0 end function j.wishes()local lN=j.pen()local lO=lN and lN:GetAttribute("Wishes")local gU,lP={},j.srv()
if type(lO)~="string"then return gU end local rA,lQ=pcall(function()return j.HS:JSONDecode(lO)end)if rA and type(lQ)=="table"then
for rB,gV in pairs(lQ)do if type(gV)=="number"and gV>lP then gU[rB]=gV-lP end end end return gU end function j.call(...)
local lR=av:FindFirstChild("Remotes")local lS=lR and lR:FindFirstChild("PetRequest")if not lS then return nil end
local lT=table.pack(...)local bw={}task.spawn(function()bw.ok,bw.v=pcall(function()return lS:InvokeServer(table.unpack(lT,1,lT.n))end)
bw.done=true end)local rC=q()while not bw.done and q()-rC<6 do task.wait(0.05)end if bw.done and bw.ok then return bw.v end
return nil end function j.want(rD)return f.Pets[rD]end function j.buyTick()if not f.PetBuy then j.buyMsg="auto adopt is off"return end
local gW,lU,gX=j.info(),j.pen(),j.data()if not(gW and lU and gX)then j.buyMsg="pet data not loaded yet"return end
j.tryAt=j.tryAt or{}local cQ,gY=#(gX.pets or{}),tonumber(gX.maxOwned)or 60 local rE,lV,cR=j.srv(),{},nil for vg,ay in ipairs(lU:GetChildren())do
lV[ay.Name]=true local cS,lW=ay:GetAttribute("Pet"),ay:GetAttribute("Variant")or""local gZ=cS and j.want(cS)if gZ and gZ.b and gW.Pets[cS]and(not gZ.g or lW=="Big")and not ay:GetAttribute("A_"..j.uid)
and(tonumber(ay:GetAttribute("ExpiresAt"))or 0)>rE+1 and q()>=(j.tryAt[ay.Name]or 0)then local cT,lX=j.nice(cS,lW),gW.Pets[cS].price or 0
if cQ>=gY then cR=("%s is in the pen, but you have %d/%d pets"):format(cT,cQ,gY)j.tryAt[ay.Name]=q()+15 elseif j.money()<lX then
cR=("%s is in the pen - need $%s"):format(cT,ag(lX))j.tryAt[ay.Name]=q()+5 else j.tryAt[ay.Name]=q()+8 local bV=j.call("adopt",ay.Name)
if type(bV)=="table"and bV.ok then cQ=cQ+1 j.buys=(j.buys or 0)+1 l("ADOPTED "..cT)cR="adopted "..cT else local lY=type(bV)=="table"and tostring(bV.reason or"no reason given")or"no answer"
l(("adopt %s failed: %s"):format(cT,lY))cR="adopt failed: "..lY if type(bV)=="table"and bV.bagFull then j.tryAt[ay.Name]=q()+60 end
end end end end for lZ in pairs(j.tryAt)do if not lV[lZ]then j.tryAt[lZ]=nil end end j.buyMsg=cR or("watching the pen (%d/%d pets)"):format(cQ,gY)
end function j.wishTick()if not f.PetWish then j.wishMsg="auto wish is off"return end local ep=j.info()if not(ep and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local eq,g0,a8=j.wishes(),0,nil local rF=(type(ep.Wish)=="table"and ep.Wish.cashShare)or 2
for vh,al in ipairs(j.order())do local l0=j.want(al)if l0 and l0 .w then g0=g0+1 if not eq[al]and q()>=(j.wishTry[al]or 0)then
local g1=tonumber(y:GetAttribute("PetWishCredits"))or 0 local g2=math.floor((ep.Pets[al].price or 0)*rF)if g1<=0 and j.money()<g2 then
j.wishTry[al]=q()+10 a8=("need $%s to wish for %s"):format(ag(g2),j.nice(al))j.wishWhy[al]=a8 else j.wishTry[al]=q()+3
local rG=g1>0 and"wishCredit"or"wish"local er=j.call(rG,al)if type(er)=="table"and er.ok then j.wishN,j.wishWhy[al]=j.wishN+1,nil
l(("WISHED for %s (%s)"):format(j.nice(al),g1>0 and"free wish"or("$"..ag(g2))))else local g3=type(er)=="table"and tostring(er.reason or"no reason given")or"no answer"
if g3:lower():find("already",1,true)then j.wishTry[al]=q()+2 else l(("wish %s failed: %s"):format(j.nice(al),g3))a8="wish failed: "..g3 end
end end end end end if not a8 then for vi,es in ipairs(j.order())do local l1=j.want(es)if l1 and l1 .w and not eq[es]and j.wishWhy[es]then a8=j.wishWhy[es]break end
end end if not a8 then local et={}for vj,eu in ipairs(j.order())do local l2=j.want(eu)if l2 and l2 .w and eq[eu]then et[#et+1]=("%s %dm"):format(j.nice(eu),math.ceil(eq[eu]/60))end
end a8=g0==0 and"no pet has WISH ticked"or("running: "..(#et>0 and table.concat(et,", ")or"none yet"))end j.wishMsg=a8
end o.switches,o.glazed,o.finished=0,0,0 function o.teams()local g4=j.data()return(g4 and g4 .teams)or{},g4 end
function o.current(bW)bW=bW or j.data()if not bW then return""end local l3={}for vk,rH in ipairs(bW.equipped or{})do l3[tostring(rH)]=true end
for vl,l4 in ipairs(bW.teams or{})do local l5=l4 .pets or{}local g5=#l5==#(bW.equipped or{})if g5 then for vm,rI in ipairs(l5)do if not l3[tostring(rI)]then g5=false break end end end
if g5 then return l4 .name end end return""end function o.equip(g6)local rJ,rK=o.teams()local g7 for rL,rM in ipairs(rJ)do if rM.name==g6 then g7=rL break end end
if not g7 then o.msg="no saved team called "..tostring(g6)return false end if o.current(rK)==g6 then return true end
for vn=1,4 do local l6=j.call("teamEquip",g7)if type(l6)=="table"and l6 .ok then o.switches=o.switches+1 return true
end task.wait(0.4)end return false end function o.waxes()local cU={}local l7=a.plot and a.plot:FindFirstChild("WaxStations")
if not l7 then return cU end for vo,bx in ipairs(l7:GetChildren())do local l8=tonumber(bx:GetAttribute("PourEnd"))
local l9=bx:GetAttribute("PourOwner")if bx:GetAttribute("HasSquishy")and l8 and(l9==nil or l9==j.uid)then local l_,ma=bx:FindFirstChild("SquishyPlaceHolder"),"?"
if l_ then for vp,mb in ipairs(l_:GetChildren())do if mb:IsA("Model")then ma=mb.Name break end end end local rN=tostring(bx:GetAttribute("Helpers")or"")
local g8=0 for vq in rN:gmatch("%d+")do g8=g8+1 end cU[#cU+1]={st=bx,ends=l8,id=bx:GetAttribute("PourId"),name=ma,helps=g8}
end end table.sort(cU,function(rO,rP)return rO.ends<rP.ends end)return cU end function o.glazeCount()local mc=av:FindFirstChild("Remotes")
local md=mc and mc:FindFirstChild("EditStack")if not md then return nil end local rQ,cV=pcall(function()return md:InvokeServer("State",nil)end)
if not(rQ and type(cV)=="table"and type(cV.state)=="table")then return nil end local g9,g_=0,{}for vr,ev in ipairs(cV.state.entries or{})do
if ev.glaze and ev.glaze~=""then g9=g9+1 g_[ev.glaze]=(g_[ev.glaze]or 0)+1 end end return g9,g_,#(cV.state.entries or{}),cV.state.capacity
end function o.finishedOne(ew,me)o.finished=o.finished+1 task.wait(2)local ha,rR,mf,rS=o.glazeCount()if ha and me and ha>me then
o.glazed=o.glazed+1 local hb={}for rT,rU in pairs(rR)do hb[#hb+1]=rT.." "..rU end l(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(Q(L(ew.name)),ew.st.Name,ha,table.concat(hb,", ")))
else l(("wax done on station %s: %s, no glaze%s"):format(ew.st.Name,Q(L(ew.name)),mf and(" (stack "..mf.."/"..tostring(rS)..")")or""))
end end function o.tick()o.list=o.waxes()if not f.Teams then o.want,o.msg="","auto teams is off"return end local hc=j.srv()
local a9=o.glazeFor if a9 then local ex=a9 .st local rV=ex.Parent and ex:GetAttribute("HasSquishy")and ex:GetAttribute("PourId")==a9 .id
if not rV or hc>a9 .ends+40 then o.glazeFor,o.afterUntil=nil,q()+1.5 local rW=a9 .before task.spawn(function()pcall(o.finishedOne,a9,rW)end)
else a9 .ends=tonumber(ex:GetAttribute("PourEnd"))or a9 .ends end end if f.TeamGlaze~=""and not o.glazeFor then
for vs,hd in ipairs(o.list)do if hd.ends-hc<=f.GlazeLead then o.glazeFor=hd task.spawn(function()hd.before=o.glazeCount()end)
break end end end local am=""if f.TeamGlaze~=""and(o.glazeFor or q()<(o.afterUntil or 0))then am=f.TeamGlaze elseif o.placing and f.TeamWax~=""then am=f.TeamWax
else am=f.TeamNormal end o.want=am local cW=o.current()o.cur=cW if am~=""and cW~=am and q()>=(o.nextTry or 0)then
o.nextTry=q()+1.1 if o.equip(am)then local rX=(am==f.TeamGlaze and o.glazeFor)and(" - station "..o.glazeFor.st.Name.." finishes soon")
or((am==f.TeamWax and o.placing)and" - placing a butter"or"")l("team: "..am..rX)else o.nextTry=q()+3 end end local he=o.list[1]
o.msg=("on: %s%s | next wax done %s"):format(cW~=""and cW or"(not a saved team)",(am~=""and am~=cW)and(" -> "..am)or"",
he and("in "..o.clock(he.ends-hc).." (st "..he.st.Name..")")or"- none running")end function o.clock(a_)a_=math.max(0,math.floor(a_))
if a_>=3600 then return("%d:%02d:%02d"):format(math.floor(a_/3600),math.floor((a_%3600)/60),a_%60)end return("%d:%02d"):format(math.floor(a_/60),a_%60)
end function o.glazeSoon()return f.Teams and f.TeamGlaze~=""and(o.glazeFor~=nil or q()<(o.afterUntil or 0))end
a.sellWords={"sell","trash","discard","dispose","bin"}local function hf(ey)if type(ey)~="string"then return false end
ey=ey:lower()for vt,rY in ipairs(a.sellWords)do if ey:find(rY,1,true)then return true end end return false end
local function rZ()local mg=av:FindFirstChild("Remotes")local hg=mg and mg:FindFirstChild("SellSquishy")if not(hg and hg:IsA("RemoteEvent"))then return false end
if not pcall(function()hg:FireServer()end)then return false end return ac(function()return K()==nil end,1.5)end
local function r0()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end if q()-a.sellSearchAt<20 then return nil end
a.sellSearchAt=q()local mh=aH()local mi=mh and mh.HumanoidRootPart.Position local cX,mj for vu,bX in ipairs((a.plot or cc):GetDescendants())do
if bX:IsA("ProximityPrompt")and(hf(bX.ActionText)or hf(bX.ObjectText)or hf(bX.Name))then local mk=iZ(bX)local hh=(mk and mi)and(mk-mi).Magnitude or 1e9
if hh<=400 and(not cX or hh<mj)then cX,mj=bX,hh end end end a.sellSpot=cX a.noSellSpot=(cX==nil)return cX end
local function ml()local hi=K()if not hi then a.holding=false return false end if aW(hi)then return false end
local hj=Q(L(hi))if rZ()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=q()+2.5,0
l("SOLD "..hj)return true end local bY=r0()if bY then local mm=cf(bY)if mm then ct(mm,bY)local mn=K()if mn and not aW(mn)then
local r1,r2=d5(bY,function()return K()==nil end,function()return bY.Enabled end)if r1 then a.sold,a.holding,a.sellFails=a.sold+1,false,0
l(("SOLD %s at %s via %s"):format(hj,ap(bY),r2))return true end end end end a.sellFails=a.sellFails+1 l("could not sell "..hj.." ("..a.sellFails..")")
return false end local r3={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function r4(bZ)local ez=ap(bZ):lower()for vv,r5 in ipairs(r3)do if ez:find(r5,1,true)then return 0 end end
local aF,V=bZ.Name:lower(),0 local function az(r6,r7)return r6:find(r7,1,true)~=nil end if az(aF,"collect")then V=V+60 end
if az(aF,"cash")or az(aF,"money")then V=V+45 end if az(aF,"income")or az(aF,"claim")then V=V+35 end if az(aF,"coin")or az(aF,"earn")or az(aF,"green")then V=V+20 end
if aF=="pad"or aF=="touch"then V=V+25 end if V==0 and(az(ez,"collect")or az(ez,"cash")or az(ez,"money"))then V=25 end
if V==0 then return 0 end local cY=bZ.Color if cY.G>0.5 and cY.G>cY.R*1.4 and cY.G>cY.B*1.4 then V=V+15 end if math.min(bZ.Size.X,bZ.Size.Y,bZ.Size.Z)<2 then V=V+5 end
return V end local function r8()if a.padPart and a.padPart.Parent then return a.padPart end if not a.plot or q()-a.padSearchAt<20 then return nil end
a.padSearchAt=q()local eA,cZ,hk={},nil,29 for vw,eB in ipairs(a.plot:GetDescendants())do if eB:IsA("BasePart")then
local eC=r4(eB)if eC>0 then eA[#eA+1]={s=eC,p=eB}if eC>hk then cZ,hk=eB,eC end end end end table.sort(eA,function(r9,r_)return r9 .s>r_.s end)
a.padCands,a.padPart=eA,cZ if cZ then l("collect pad: "..ap(cZ).." (score "..hk..")")end return cZ end local hl="SAB_pad_v1.txt"
local function sa(sb)if type(writefile)=="function"then pcall(writefile,hl,table.concat({sb:GetComponents()},","))end
end local function sc()if type(isfile)~="function"or type(readfile)~="function"then return nil end local sd,mo=pcall(function()if isfile(hl)then return readfile(hl)end end)
if not sd or type(mo)~="string"then return nil end local eD={}for se in mo:gmatch("[^,]+")do eD[#eD+1]=tonumber(se)end
if#eD==12 then return CFrame.new(unpack(eD))end end local function sf(hm,eE,sh)local si=gf(hm)local hn=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aA=(hn and hn:IsA("BasePart"))and(hn.Position-eE)or Vector3 .new(1,0,0)aA=Vector3 .new(aA.X,0,aA.Z)if aA.Magnitude<0.05 then aA=Vector3 .new(1,0,0)end
aA=aA.Unit for sj=0,7 do local eF=sj*math.pi/4 local sk=Vector3 .new(aA.X*math.cos(eF)-aA.Z*math.sin(eF),0,aA.X*math.sin(eF)+aA.Z*math.cos(eF))
local eG=eE+sk*(sh+5)local ho=kh(eG.X,eE.Y,eG.Z)if ho and math.abs(ho.Y-eE.Y)<8 then cs(hm,Vector3 .new(eG.X,ho.Y+si,eG.Z))
if gg(hm,0.7)then return true end end end return false end local function sl()a.lastCollect=q()local c0=aH()if not c0 then return end
local mp,sm=c0 .HumanoidRootPart,gf(c0)local c1,mq,c2,hp=nil,4,nil,"?"local hq=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if a.manualPad and hq and hq:IsA("BasePart")then c1,hp=(hq.CFrame*a.manualPad).Position,"manual pad"else local aP=r8()
if aP then c1=Vector3 .new(aP.Position.X,aP.Position.Y+aP.Size.Y/2+sm,aP.Position.Z)mq,c2,hp=math.max(aP.Size.X,aP.Size.Z)/2,aP,aP.Name
end end if not c1 then l("COLLECT: pad not found - stand on it and tap SET PAD")return end local hr=aC()cs(c0,c1)
if c2 and type(firetouchinterest)=="function"then pcall(firetouchinterest,mp,c2,0)end ao(f.PadDwell)if c2 and type(firetouchinterest)=="function"then pcall(firetouchinterest,mp,c2,1)end
ao(0.5)a.collected=a.collected+1 local hs=aC()l(("COLLECTED (%s) %s"):format(hp,(hr and hs and hs>hr)and("+$"..ag(hs-hr))or"no cash change seen"))
sf(c0,c1,mq)end local c3 local function mr()if a.capHit then if f.AutoStart and q()-(a.capAt or 0)>300 then a.capHit,a.placeFails=false,0
l("trying again after being stopped for 5 minutes")c3(true,true)else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end
if not aH()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aX(),nil,nil
if not a.plot then return nil,"own plot not found yet","wait"end end if not next(f.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local ht,ms=fw()local eH=K()if eH then local b0=Q(L(eH))if not aW(eH)then local hu=(H.gift and L(H.gift)==L(eH)and q()-H.giftAt<600)and"gift"or"not ticked"
if not f.SellJunk then return nil,("holding %s (%s) - selling is off"):format(b0,hu),"bad"end if a.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(b0,hu),"bad"end return"sell",("selling %s (%s)"):format(b0,hu),"warn"
end if ht<1 then return nil,("holding %s - 0 free stations"):format(b0),"wait"end if o.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(b0),"wait"end
return"place",("waxing %s (%d free)"):format(b0,ht),"ok"end a.holding=false if f.Crates and not d.waiting and q()-(d.scanAt or 0)>1 and q()>(d.quietUntil or 0)then
d.scanAt=q()local hv=a.plot:FindFirstChild("CrateStand")if hv then for vx,c4 in ipairs(hv:GetDescendants())do
if c4:IsA("ProximityPrompt")and c4 .Enabled and ea(c4)then local aQ=c4 .ObjectText if aQ==""then aQ=bG(hv,"TitleLabel")or""end
if aQ~=""and z.wanted(aQ)then local sn=dq(aQ):gsub("crate$","")local mt for mu in pairs(J.members)do if dq(mu)==sn then mt=mu end end
d.waiting,d.at,d.title,d.prompt=true,q(),aQ,c4 d.data={name=(aQ:gsub("%s","")),rarity=mt,title=aQ}l(aQ.." found waiting on your stand")
end break end end end end local mv=z.wanted(d.data and d.data.name)or z.wanted(d.title)if f.Crates and(d.on or d.waiting)and mv then
local aR=d.title if q()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aR),"bad"
end if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=q()+120,0 l("could not press the "..aR.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aR),"bad"end if q()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aR),"bad"
end if d.byYou and q()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aR,math.ceil(60-(q()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aR),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand then DUMP"):format(aR),"bad"end if q()-d.lastFail<8 then
return nil,("%s waiting - retrying shortly"):format(aR),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aR,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not mv then local mw=d.title..tostring(d.rolledAt)if d.told~=mw then d.told=mw l(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and q()-d.rolledAt<6 and z.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if ht<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(ms,ms),"wait"
end local hw=fC()if not hw then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c5=bK()
if c5 and kB(c5 .name)then a.matchSince=nil if not f.Crates then return nil,("%s on the pad - crate opening is off"):format(c5 .name),"idle"end
if q()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c5 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(c5 .name),"ok"
end local ba=gd()if ba.state~="match"then a.matchSince=nil if ba.state=="skip"and not hw.Enabled then return nil,ba.text.." (sold out)","idle"end
return nil,ba.text,ba.level end if not hw.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local c6=q()if c6<a.noCashUntil then local mx,so=j_()if mx then return nil,("cash short: have $%s, price ~$%s"):format(ag(mx),ag(so)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ag(aC()),math.ceil(a.noCashUntil-c6)),"bad"end if c6-a.lastBuyAt<f.BuyGap then return nil,"cooldown after last buy","wait"end
a.matchSince=a.matchSince or c6 local my=c6-a.matchSince if my<f.Confirm then return nil,("confirming %s (%.2fs)"):format(ba.shown,my),"ok"end
return"buy",("buying %s via %s"):format(ba.shown,ba.src),"ok"end local function as(sp,sq,...)if a.busy then return end
a.busy,a.busyText=true,sp local sr,mz=pcall(sq,...)a.busy,a.busyText=false,""if not sr and mz~=fi then l("ERR "..tostring(mz))end
end local function ss()local by,su,sv=mr()a.reason,a.level=su,sv if by=="place"then as("waxing...",o.place)elseif by=="crate"then as("opening crate...",ef,true)
elseif by=="cratesmart"then as("opening crate...",d.smart)elseif by=="cratewin"then as("opening the crate window...",gu)
elseif by=="nocrate"then as("discarding crate...",ef,false)elseif by=="sell"then as("selling...",ml)elseif by=="buy"then as("buying...",ks,false)
elseif f.Collect and not a.matchSince and q()-a.lastCollect>=f.Every then as("collecting money...",sl)end end
function c3(eI,sw)if eI==a.running then return end a.running=eI if not sw then f.AutoStart=eI end if eI then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=q()a.plot=aX()or a.plot
l("START")else a.reason="stopped"l("STOP")end end local function hx()local hy={}local function u(sx)hy[#hy+1]=tostring(sx)end
u("=== SAB "..bh.." DUMP "..os.date("%H:%M:%S").." ===")u(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))u("reason: "..tostring(a.reason))
u("targets: "..table.concat(jH(),", "))u(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
u("cash="..ag(aC()))u(("pets: adopt=%s wish=%s | %s | %s"):format(tostring(f.PetBuy),tostring(f.PetWish),tostring(j.buyMsg),tostring(j.wishMsg)))
u(("teams: auto=%s normal=%s glaze=%s wax=%s lead=%s | %s"):format(tostring(f.Teams),f.TeamNormal,f.TeamGlaze,
f.TeamWax,tostring(f.GlazeLead),tostring(o.msg)))u(("crate near-open fails=%s"):format(tostring(d.nearFails or 0)))
local sy,mA=K()u("in hands: "..tostring(sy)..(mA and(" ("..mA.ClassName..")")or"").."  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-q())))
u("  attribute SquishyEquipped = "..tostring(y:GetAttribute("SquishyEquipped")))local mB=a.plot and a.plot:FindFirstChild("SquishyEquipped")
u("  plot.SquishyEquipped = "..(mB and(#mB:GetChildren().." children")or"missing"))local hz=y.Character if hz then
local hA={}for vy,c7 in ipairs(hz:GetDescendants())do if(c7:IsA("Model")or c7:IsA("Tool"))and c7 .Name~=hz.Name then hA[#hA+1]=c7 .ClassName..":"..c7 .Name end
end u("  on the character: "..(table.concat(hA,", "):sub(1,300)))end local eJ=bK()u("on pad: "..(eJ and("%s [%s] %s"):format(eJ.name,tostring(eJ.rar),tostring(eJ.price))or"nothing"))
u("sell spot: "..(a.sellSpot and ap(a.sellSpot)or"none found"))u("--- CRATES ---")u(("waiting=%s windowOpen=%s title=%s rolled=%s (%ss ago) opened=%d tapWay=%s fails=%d/%d"):format(
tostring(d.waiting),tostring(d.on),d.title,tostring(d.rolled),d.rolledAt>0 and string.format("%.0f",q()-d.rolledAt)or"-",
a.crates,tostring(a.tapWay),a.crateFails,d.summonFails))u("--- AUTO ROLL ---")local eK=r.snap()u(("game: AutoRollOn=%s AutoRoll=%s stop=%s rules=%s"):format(tostring(eK.on),tostring(eK.main),
tostring(eK.stop),tostring(eK.rules)))u(("wanted: %s  choices to put back: %s (stop %s)  note: %s"):format(tostring(f.AutoRoll),
f.ARrules~=""and f.ARrules or"-",f.ARstop~=""and f.ARstop or"-",r.msg~=""and r.msg or"-"))local function hB(hC)
local mC={}for mD=1,hC.n do local eL=hC.args[mD]mC[mD]=type(eL)=="table"and(eL.__slot and("<"..eL.__slot..">")or"{table}")or("%q"):format(tostring(eL))
end return("AutoRollAction:%s(%s)"):format(hC.m,table.concat(mC,", "))end for sz,sA in ipairs(r.rec.rules)do u(("  choices %d: %s"):format(sz,hB(sA)))end
if r.rec.on then u("  on:  "..hB(r.rec.on))end if r.rec.off then u("  off: "..hB(r.rec.off))end if#r.rec.rules==0 and not r.rec.on and not r.rec.off then u("  nothing learned yet")end
u("--- CRATE OPENING ---")local function eM(bb,eN)eN=eN or 0 local mE=type(bb)if mE=="string"then return("%q"):format(bb)end
if mE=="table"then if bb.__slot then return"<"..bb.__slot..">"end if eN>1 then return"{...}"end local hD={}for sB,sC in pairs(bb)do hD[#hD+1]=tostring(sB).."="..eM(sC,eN+1)end
return"{"..table.concat(hD,",").."}"end local sD,mF=pcall(function()return bb.ClassName end)if sD and mF then return"<"..mF.." "..ap(bb)..">"end
return tostring(bb)end u("watching CrateAction: "..tostring(d.oldNC~=nil).."  hookmetamethod="..type(hookmetamethod))
if d.learned then u("learned (mode "..tostring(d.learned.mode or"untried").."):")for sE,hE in ipairs(d.learned.seq)do
local mG={}for mH=1,hE.n do mG[mH]=eM(hE.args[mH])end u(("  %d. CrateAction:%s(%s)"):format(sE,hE.m,table.concat(mG,", ")))
end else u("not learned yet - it learns from the next crate that opens")end if d.directOff then u("direct opening is OFF for this session after 3 failures")end
if d.lastBad then u("last call that failed:")for sF,hF in ipairs(d.lastBad.seq)do local mI={}for mJ=1,hF.n do mI[mJ]=eM(hF.args[mJ])end
u(("  %d. CrateAction:%s(%s)"):format(sF,hF.m,table.concat(mI,", ")))end end u("CrateAction calls seen:")for vz,c8 in ipairs(d.calls or{})do
local mK={}for mL=1,c8 .n do mK[mL]=eM(c8 .args[mL])end u(("  %.0fs ago  %s(%s)  [crate=%s]"):format(q()-c8 .t,c8 .m,table.concat(mK,", "),tostring(c8 .crate)))
end local b1=d.findWin()if b1 and type(getconnections)=="function"then u("how the game wired its crate window buttons (handler counts):")
for vA,c9 in ipairs(b1:GetDescendants())do if c9:IsA("GuiButton")then local hG={}for vB,mM in ipairs({"MouseButton1Click","MouseButton1Down","MouseButton1Up","Activated",
"InputBegan","InputEnded","TouchTap"})do local sG,mN=pcall(function()return getconnections(c9[mM])end)local mO=(sG and type(mN)=="table")and#mN or-1
if mO~=0 then hG[#hG+1]=mM.."="..mO end end u(("  %s %s %q: %s"):format(c9 .ClassName,c9 .Name,bP(c9),table.concat(hG," ")))
end end end u(("crate window: %s visible=%s mine=%s yours=%s"):format(b1 and ap(b1)or"not found",tostring(b1 and b1 .Visible),tostring(d.ours),tostring(d.byYou)))
local eO=kU()u("crate prompt: "..(eO and(ap(eO).." ["..eO.ActionText.."|"..eO.ObjectText.."]")or"none found"))
local mP=a.plot and a.plot:FindFirstChild("CrateStand")if mP then local hH=0 for vC,bz in ipairs(mP:GetDescendants())do
hH=hH+1 if hH>30 then u("  ...")break end local mQ=""if bz:IsA("ProximityPrompt")then mQ=(" [%s|%s|on=%s|hold=%.2f]"):format(bz.ActionText,bz.ObjectText,tostring(bz.Enabled),bz.HoldDuration)end
u("  CrateStand/"..ap(bz):gsub("^.-CrateStand%.","").." ("..bz.ClassName..")"..mQ)end else u("  no CrateStand in the plot")
end u("enabled prompts in the plot:")if a.plot then for vD,b2 in ipairs(a.plot:GetDescendants())do if b2:IsA("ProximityPrompt")and b2 .Enabled then
u(("  %s [%s|%s] safe=%s"):format(ap(b2),b2 .ActionText,b2 .ObjectText,tostring(ea(b2))))end end end local mR=y:FindFirstChildOfClass("PlayerGui")
if mR then u("buttons on screen that say open/discard:")for vE,c_ in ipairs(mR:GetDescendants())do if c_:IsA("GuiButton")and d7(c_)then
local hI=bP(c_)if hI:find("open",1,true)or hI:find("discard",1,true)then u(("  %s %s -> %q"):format(c_.ClassName,ap(c_),hI))
end end end end u("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(d_~=nil))
u("--- CATALOG ("..J.n.." butters, worst rarity first) ---")for vF,eP in ipairs(J.rarOrder)do local hJ={}for vG,mS in ipairs(J.members[eP]or{})do
hJ[#hJ+1]=(f.Targets[mS]and"*"or"")..Q(mS)end u(("  [%s]%s %s"):format(eP,M.price[eP]and(" crate $"..ag(M.price[eP]))or"",table.concat(hJ,", ")))
end u("learned orders: ")for sH,sI in pairs(M.order)do u("  "..sH..": "..table.concat(sI,", "))end u("--- PLOT ---")
u("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for vH,hK in ipairs(a.plot:GetChildren())do
u(("  %s %s (%d)"):format(hK.ClassName,hK.Name,#hK:GetChildren()))end local sJ,sK=fw()u(("stations free %d / %d"):format(sJ,sK))
local hL=fC()u("BuyPrompt: "..(hL and("enabled="..tostring(hL.Enabled).." hold="..hL.HoldDuration)or"MISSING"))
end u("autostart="..tostring(f.AutoStart).." rejoin="..tostring(f.Rejoin))u(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))u("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#fY())u("--- COLLECT PAD ---")u("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and ap(a.padPart)or"none"))
u("--- ATTRIBUTES ---")for vI,mT in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
u(("  %s = %s"):format(mT,tostring(y:GetAttribute(mT))))end u("--- EVENTS ---")for sL=math.max(1,#bi-15),#bi do u("  "..bi[sL])end
u("--- LOG ---")for sM=math.max(1,#aV-25),#aV do u("  "..aV[sM])end return table.concat(hy,"\n")end do local bc=fX(ae.auto)
if type(bc)=="string"then bc=bc:gsub("%s+$","")if bc~=""then a.autoload=bc local sN=jV(bc)l(sN and("loaded config "..bc)or("config "..bc.." could not be loaded"))
end end end local e={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local sO={ok=e.good,wait=e.warn,warn=e.warn,bad=e.bad,idle=e.dim}local mU={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function D(sP,sQ,sR)local sS,hM=pcall(Instance.new,sP)
if not sS then a.uiErrs=a.uiErrs+1 return nil end for sT,sU in pairs(sQ)do if not pcall(function()hM[sT]=sU end)then a.uiErrs=a.uiErrs+1 end
end hM.Parent=sR return hM end local function W(sV,sW)D("UICorner",{CornerRadius=UDim.new(0,sW or 6)},sV)end local c={}
local hN=y:FindFirstChildOfClass("PlayerGui")or y:WaitForChild("PlayerGui")local mV=hN:FindFirstChild("SABFarmGui")
if mV then mV:Destroy()end local hO=D("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},hN)
local aa={w=320,h=330,head=30,strip=38,tabs=26}c.root=D("Frame",{Name="Root",Size=UDim2 .new(0,aa.w,0,aa.h),Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),
BackgroundColor3=e.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},hO)W(c.root,10)D("UIStroke",{Color=e.line,Thickness=1},c.root)
local aG=UDim2 .new(1,0,1,0)local function A(mW,mX)return UDim2 .new(mW,0,0,0),UDim2 .new(mX,(mW+mX>0.99)and 0 or-4,1,0)end
local function x(sX,sY,sZ,s0,s1,s2)local mY=D("TextButton",{Text=sY,Position=s1,Size=s2,BackgroundColor3=sZ,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=s0,TextColor3=e.text,AutoButtonColor=true},sX)W(mY,6)return mY end local function hP(s3,s4,s5,s6,s7)
local hQ=D("TextBox",{Text=s4,PlaceholderText=s5,Position=s6,Size=s7,BackgroundColor3=e.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=e.text,PlaceholderColor3=e.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},s3)W(hQ,6)D("UIPadding",{PaddingLeft=UDim.new(0,8)},hQ)
return hQ end local eQ=cc.CurrentCamera local function s8()local s9,eR=pcall(function()return eQ and eQ.ViewportSize end)
if s9 and eR and eR.X>50 and eR.Y>50 then return eR end end local function bd(da)local hR=s8()if not(hR and da and da.Parent)then return end
local s_=pcall(function()local eS,mZ=da.AbsolutePosition,da.AbsoluteSize local hS=70 local m0=math.clamp(eS.X,hS-mZ.X,hR.X-hS)
local m1=math.clamp(eS.Y,0,hR.Y-math.min(mZ.Y,hS))if math.abs(m0-eS.X)>0.5 or math.abs(m1-eS.Y)>0.5 then da.Position=UDim2 .new(0,math.floor(m0),0,math.floor(m1))
end end)return s_ end local function eT(ta)local tb,hT=pcall(function()return ta.AbsolutePosition end)if tb and hT then return{math.floor(hT.X),math.floor(hT.Y)}end
end local eU={}local function m2(eV,m3,m4)T(eV.InputBegan:Connect(function(db)if db.UserInputType~=Enum.UserInputType.MouseButton1 and db.UserInputType~=Enum.UserInputType.Touch then return end
eU[eV]={start=db.Position,from=m3 .Position,moved=0,target=m3}local hU hU=db.Changed:Connect(function()if db.UserInputState==Enum.UserInputState.End then
local m5=eU[eV]eU[eV]=nil if hU then hU:Disconnect()end if m5 and m4 then m4(m5 .moved)end end end)end))end T(oi.InputChanged:Connect(function(eW)
if eW.UserInputType~=Enum.UserInputType.MouseMovement and eW.UserInputType~=Enum.UserInputType.Touch then return end
for vJ,aS in pairs(eU)do local hV=aS.target if hV and hV.Parent then local m6,m7=eW.Position.X-aS.start.X,eW.Position.Y-aS.start.Y
aS.moved=math.max(aS.moved,math.abs(m6)+math.abs(m7))hV.Position=UDim2 .new(aS.from.X.Scale,aS.from.X.Offset+m6,aS.from.Y.Scale,aS.from.Y.Offset+m7)
end end end))local function E(tc,td,te,tf,tg,th,ti)return D("TextLabel",{Text=td,Position=th or UDim2 .new(0,0,0,0),Size=ti or aG,BackgroundTransparency=1,
Font=tg and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=te,TextColor3=tf,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},tc)
end c.title=D("Frame",{Size=UDim2 .new(1,0,0,aa.head),BackgroundColor3=e.panel,BorderSizePixel=0,Active=true},c.root)
c.dot=D("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=e.dim,BorderSizePixel=0},c.title)
W(c.dot,5)E(c.title,"SAB  BUTTER FARM  "..bh,12,e.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))c.minB=x(c.title,"-",e.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
c.xB=x(c.title,"X",e.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))c.strip=D("Frame",{Position=UDim2 .new(0,0,0,aa.head),Size=UDim2 .new(1,0,0,aa.strip),BackgroundColor3=e.bg,BorderSizePixel=0},c.root)
c.bar=D("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=e.warn,BorderSizePixel=0},c.strip)
W(c.bar,2)c.reason=E(c.strip,"starting",12,e.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))c.tabs=D("Frame",{Position=UDim2 .new(0,0,0,aa.head+aa.strip),Size=UDim2 .new(1,0,0,aa.tabs),BackgroundTransparency=1},c.root)
c.tabFarm=x(c.tabs,"FARM",e.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))c.tabBut=x(c.tabs,"BUTTERS",e.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabCrt=x(c.tabs,"CRATES",e.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabPet=x(c.tabs,"PETS",e.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabTeam=x(c.tabs,"TEAMS",e.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabSet=x(c.tabs,"SETUP",e.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function b3()local hW=D("ScrollingFrame",{Position=UDim2 .new(0,0,0,aa.head+aa.strip+aa.tabs),Size=UDim2 .new(1,0,1,-(aa.head+aa.strip+aa.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=e.line,CanvasSize=UDim2 .new(0,0,0,100)},c.root)
D("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},hW)D("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},hW)
return hW end c.farm,c.but,c.set,c.crt=b3(),b3(),b3(),b3()c.pet,c.team=b3(),b3()c.but.Visible,c.set.Visible,c.crt.Visible,c.pet.Visible,c.team.Visible=false,false,false,false,false
local eX,dc,C=0,12,nil local function ah(m8,tj)eX,dc=eX+1,dc+m8+6 return D("Frame",{Size=UDim2 .new(1,0,0,m8),BackgroundTransparency=1,LayoutOrder=eX},tj or c.farm)
end local function b4(tk)E(ah(14),tk,10,e.dim,true)end C=ah(34)c.startB=x(C,"START",e.good,14,A(0,0.68))c.killB=x(C,"KILL",e.bad,14,A(0.68,0.32))
local tl=ah(42)local function dd(m9,tm,hX)local hY=D("Frame",{Position=UDim2 .new((m9-1)/hX,0,0,0),Size=UDim2 .new(1/hX,m9<hX and-4 or 0,1,0),
BackgroundColor3=e.panel,BorderSizePixel=0},tl)W(hY,6)local m_=E(hY,"0",15,e.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local tn=E(hY,tm,9,e.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))m_.TextXAlignment,tn.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return m_ end c.sBought,c.sPlaced,c.sSold,c.sColl,c.sFree=dd(1,"BOUGHT",5),dd(2,"WAXED",5),dd(3,"SOLD",5),dd(4,"MONEY",5),dd(5,"FREE",5)
c.info=E(ah(40),"",10,e.dim,false)c.tgt=E(ah(26),"",10,e.good,false)b4("MONEY COLLECT")C=ah(28)c.secB=hP(C,tostring(f.Every),"60",A(0,0.2))
E(C,"sec",11,e.dim,false,A(0.21,0.09))c.secSet=x(C,"SET",e.accent,12,A(0.3,0.2))c.colT=x(C,"COLLECT: ON",e.accent,11,A(0.5,0.5))
C=ah(26)c.padB=x(C,"SET PAD (stand on it)",e.panel2,10,A(0,0.55))c.padL=E(C,"",10,e.dim,false,A(0.56,0.44))b4("BUTTERS YOU DID NOT TICK, AND CRATES")
C=ah(28)c.sellT=x(C,"SELL THEM: ON",e.accent,11,A(0,0.55))c.sellB=x(C,"SELL NOW",e.warn,11,A(0.55,0.45))C=ah(28)
c.crateT=x(C,"OPEN CRATES: ON",e.accent,11,A(0,0.55))c.crateB=x(C,"OPEN NOW",e.warn,11,A(0.55,0.45))b4("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
C=ah(28)c.arT=x(C,"AUTO ROLL: OFF",e.panel2,11,A(0,0.5))c.arL=E(C,"",9,e.dim,false,A(0.52,0.48))b4("TOOLS")C=ah(30)
c.buyB=x(C,"BUY",e.warn,10,A(0,0.2))c.plB=x(C,"WAX",e.good,10,A(0.2,0.2))c.dumpB=x(C,"DUMP",e.accent,10,A(0.4,0.2))
c.copyB=x(C,"COPY",e.panel2,10,A(0.6,0.2))c.linkB=x(C,"LINK",e.good,10,A(0.8,0.2))b4("LOG")c.log=D("TextLabel",{Size=aG,BackgroundColor3=e.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=e.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},ah(84))W(c.log,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},c.log)
b4("OUTPUT  (DUMP result)")c.out=D("TextBox",{Size=aG,BackgroundColor3=e.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},ah(110))W(c.out,6)c.farm.CanvasSize=UDim2 .new(0,0,0,dc)
eX,dc=0,12 local function au(to)return ah(to,c.set)end local function eY(tp)E(au(14),tp,10,e.dim,true)end eY("SETTINGS FILE  (saved on your phone)")
C=au(28)c.cfgName=hP(C,"default","config name",A(0,0.5))c.cfgSave=x(C,"SAVE",e.good,11,A(0.5,0.25))c.cfgLoad=x(C,"LOAD",e.accent,11,A(0.75,0.25))
C=au(26)c.cfgPrev=x(C,"<",e.panel2,11,A(0,0.13))c.cfgPick=x(C,"(none saved)",e.panel2,10,A(0.13,0.74))c.cfgNext=x(C,">",e.panel2,11,A(0.87,0.13))
C=au(26)c.cfgAuto=x(C,"LOAD IT ON LAUNCH: OFF",e.panel2,10,A(0,1))c.cfgMsg=E(au(26),"",10,e.dim,false)eY("START BY ITSELF")
C=au(26)c.autoB=x(C,"INSTALL F.exec",e.accent,10,A(0,1))c.autoMsg=E(au(30),"",10,e.dim,false)C=au(28)c.startT=x(C,"START FARMING ON LOAD: ON",e.accent,10,A(0,1))
E(au(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,e.dim,false)
eY("IF THE GAME DROPS ME")C=au(28)c.rejT=x(C,"AUTO REJOIN: ON",e.accent,11,A(0,0.55))c.rejB=x(C,"REJOIN NOW",e.warn,11,A(0.55,0.45))
c.rejMsg=E(au(30),"",10,e.dim,false)eY("THE ROUND SAB BUTTON")E(au(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,e.dim,false)
c.set.CanvasSize=UDim2 .new(0,0,0,dc)local na=D("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},hN)
c.tgRoot=D("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=e.accent,BorderSizePixel=0,Active=true},na)W(c.tgRoot,26)D("UIStroke",{Color=e.line,Thickness=1},c.tgRoot)
c.tgBtn=D("TextButton",{Text="SAB",Size=aG,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=e.text,AutoButtonColor=false},c.tgRoot)
c.tgDot=D("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=e.dim,BorderSizePixel=0},c.tgRoot)
W(c.tgDot,4)local aT={built=false,boxes={},at=0}local function nb(nc,hZ)f.Targets[nc]=hZ or nil local h0=aT.boxes[nc]
if h0 then h0 .Text=hZ and"X"or""h0 .BackgroundColor3=hZ and e.good or e.panel2 end end local function h1()for tq,nd in pairs(aT.boxes)do
local ne=f.Targets[tq]==true nd.Text=ne and"X"or""nd.BackgroundColor3=ne and e.good or e.panel2 end end local de
local function tr()local ts=0 local h2=D("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},c.but)
c.butInfo=E(h2,"",10,e.dim,false,A(0,0.5))local tt=x(h2,"CLEAR",e.panel2,10,A(0.5,0.24))local tu=x(h2,"REFRESH",e.panel2,10,A(0.74,0.26))
tt.MouseButton1Click:Connect(function()for tv in pairs(f.Targets)do f.Targets[tv]=nil end h1()end)tu.MouseButton1Click:Connect(function()
J.at=0 fW()de(true)end)return ts end de=function(tw)if not fW()then if not c.butEmpty then c.butEmpty=E(D("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},c.but),
"butter list not loaded yet - open this tab again in a moment",11,e.warn,false)end return end if aT.built and not tw and aT.at==J.at then return end
for vK,h3 in ipairs(c.but:GetChildren())do if h3:IsA("Frame")or h3:IsA("TextButton")then h3:Destroy()end end aT.boxes,c.butEmpty={},nil
tr()local h4,h5=36,1 local function nf(ng)h5=h5+1 local tx=D("Frame",{Size=UDim2 .new(1,0,0,ng),BackgroundTransparency=1,LayoutOrder=h5},c.but)
h4=h4+ng+6 return tx end for vL,eZ in ipairs(J.rarOrder)do local ty=nf(24)local tz=mU[eZ]or e.text local h6=D("Frame",{Size=aG,BackgroundColor3=e.panel,BorderSizePixel=0},ty)
W(h6,6)E(h6,"  "..eZ:upper(),11,tz,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local tA=x(h6,"ALL",e.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local tB=eZ tA.MouseButton1Click:Connect(function()local nh=J.members[tB]or{}local ni=false for vM,tC in ipairs(nh)do if not f.Targets[tC]then ni=true break end end
for vN,tD in ipairs(nh)do nb(tD,ni)end end)for vO,h7 in ipairs(J.members[eZ]or{})do local tE=nf(22)local e0=D("TextButton",{Text="",Size=aG,BackgroundColor3=e.bg,BorderSizePixel=0,
AutoButtonColor=true},tE)W(e0,5)E(e0,"   "..Q(h7),11,e.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local h8=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=e.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=e.text,AutoButtonColor=false},e0)
W(h8,4)aT.boxes[h7]=h8 local nj=h7 local function nk()nb(nj,not f.Targets[nj])end e0 .MouseButton1Click:Connect(nk)
h8 .MouseButton1Click:Connect(nk)end end h1()c.but.CanvasSize=UDim2 .new(0,0,0,h4+10)aT.built,aT.at=true,J.at
end function z.paint()for tF,nl in pairs(z.boxes)do local nm=f.CrateTicks[tF]==true nl.Text=nm and"X"or""nl.BackgroundColor3=nm and e.good or e.panel2
end if c.crtInfo then local h9,h_=0,0 for vP in pairs(z.boxes)do h9=h9+1 end for vQ,tG in pairs(f.CrateTicks)do if tG then h_=h_+1 end end
c.crtInfo.Text=("%d crates, %d ticked"):format(h9,h_)end if c.crtAll then c.crtAll.Text=f.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"
c.crtAll.BackgroundColor3=f.Crates and e.accent or e.panel2 end end function z.build()for vR,ia in ipairs(c.crt:GetChildren())do
if ia:IsA("Frame")or ia:IsA("TextButton")then ia:Destroy()end end z.boxes={}local ib,ic=12,0 local function e1(nn)
ic=ic+1 ib=ib+nn+6 return D("Frame",{Size=UDim2 .new(1,0,0,nn),BackgroundTransparency=1,LayoutOrder=ic},c.crt)
end local ie=e1(28)c.crtInfo=E(ie,"",10,e.dim,false,A(0,0.5))local tH=x(ie,"CLEAR",e.panel2,10,A(0.5,0.24))local tI=x(ie,"REFRESH",e.panel2,10,A(0.74,0.26))
T(tH.MouseButton1Click:Connect(function()f.CrateTicks={}z.paint()end))T(tI.MouseButton1Click:Connect(function()z.build()end))
c.crtAll=x(e1(28),"",e.accent,11,A(0,1))T(c.crtAll.MouseButton1Click:Connect(function()f.Crates=not f.Crates z.paint()end))
E(e1(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,e.dim,false)
for vS,aU in ipairs(z.list())do local tJ=e1(24)local df=D("TextButton",{Text="",Size=aG,BackgroundColor3=e.panel,BorderSizePixel=0,AutoButtonColor=true},tJ)
W(df,5)E(df,"  "..(aU.title or aU.name)..(aU.guess and"  (?)"or""),11,mU[aU.rar or""]or e.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
E(df,aU.price and("$"..ag(aU.price))or(aU.rar or""),9,e.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local ig=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=e.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=e.text,AutoButtonColor=false},df)W(ig,4)z.boxes[aU.k]=ig local no=aU.k local function np()f.CrateTicks[no]=(not f.CrateTicks[no])or nil
z.paint()end T(df.MouseButton1Click:Connect(np))T(ig.MouseButton1Click:Connect(np))end c.crt.CanvasSize=UDim2 .new(0,0,0,ib+10)
z.built=z.at z.paint()end local nq="farm"local function be(ab)nq=ab c.farm.Visible,c.but.Visible,c.set.Visible=(ab=="farm"),(ab=="but"),(ab=="set")
c.crt.Visible=(ab=="crt")c.pet.Visible,c.team.Visible=(ab=="pet"),(ab=="team")c.tabCrt.BackgroundColor3=(ab=="crt")and e.accent or e.panel2
c.tabPet.BackgroundColor3=(ab=="pet")and e.accent or e.panel2 c.tabTeam.BackgroundColor3=(ab=="team")and e.accent or e.panel2
if ab=="pet"and not j.built then pcall(j.build)end if ab=="team"and not o.built then pcall(o.build)end if ab=="crt"and(z.built~=z.at or not next(z.boxes))then z.build()end
c.tabFarm.BackgroundColor3=(ab=="farm")and e.accent or e.panel2 c.tabBut.BackgroundColor3=(ab=="but")and e.accent or e.panel2
c.tabSet.BackgroundColor3=(ab=="set")and e.accent or e.panel2 if ab=="but"then de(false)end end local function O(nr,ns,tK,tL)
nr.Text=ns and tK or tL nr.BackgroundColor3=ns and e.accent or e.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(nt)
local dg=j.rows and j.rows[nt]if not dg then return end local e2=f.Pets[nt]or{}dg.b.BackgroundColor3=e2 .b and e.good or e.panel2
dg.g.BackgroundColor3=e2 .g and e.accent or e.panel2 dg.g.Text=e2 .g and"BIG"or"ANY"dg.w.BackgroundColor3=e2 .w and e.warn or e.panel2
end function j.flag(ih,ii)local bA=f.Pets[ih]or{}if bA[ii]then bA[ii]=nil else bA[ii]=true end f.Pets[ih]=(bA.b or bA.g or bA.w)and bA or nil
j.paintRow(ih)end function j.paintAll()for tM in pairs(j.rows or{})do j.paintRow(tM)end if c.pbT then O(c.pbT,f.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
O(c.pwT,f.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")end end function j.live()if not j.built then j.build()return end
if q()-(j.liveAt or 0)<1 then return end j.liveAt=q()local nu=j.wishes()for ij,tN in pairs(j.rows)do tN.name.Text=j.nice(ij)..(nu[ij]and("   * wish %dm"):format(math.ceil(nu[ij]/60))or"")
end local e3=j.data()local nv=tonumber(y:GetAttribute("PetWishCredits"))or 0 c.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(e3 and#(e3 .pets or{})or 0,e3 and tonumber(e3 .maxOwned)or 60,
ag(j.money()),nv>0 and(" | free wishes "..nv)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local e4=j.info()for vT,ik in ipairs(c.pet:GetChildren())do if ik:IsA("Frame")or ik:IsA("TextLabel")then ik:Destroy()end
end j.rows={}local il,e5=0,12 local function b5(nw)il,e5=il+1,e5+nw+6 return D("Frame",{Size=UDim2 .new(1,0,0,nw),BackgroundTransparency=1,LayoutOrder=il},c.pet)
end local nx=b5(28)c.pbT=x(nx,"AUTO ADOPT: OFF",e.panel2,10,A(0,0.5))c.pwT=x(nx,"AUTO WISH: OFF",e.panel2,10,A(0.5,0.5))
c.pbT.MouseButton1Click:Connect(function()f.PetBuy=not f.PetBuy j.paintAll()end)c.pwT.MouseButton1Click:Connect(function()f.PetWish=not f.PetWish j.paintAll()end)
c.pInfo=E(b5(44),"",10,e.dim,false)E(b5(40),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (costs 2x its price, 20 min, one per pet per server).",9,e.dim,false)
if not e4 then E(b5(30),"pet list not loaded yet - open this tab again in a moment",11,e.warn,false)c.pet.CanvasSize=UDim2 .new(0,0,0,e5)
j.built=false return end local b6={}for vU,ny in ipairs(j.order())do local im=e4 .Pets[ny].rarity or"?"b6[im]=b6[im]or{}
table.insert(b6[im],ny)end local b7={}for vV,nz in ipairs(e4 .Rarities or{})do if b6[nz]then b7[#b7+1]=nz end end
for nA in pairs(b6)do if not table.find(b7,nA)then b7[#b7+1]=nA end end for vW,e6 in ipairs(b7)do local nB=D("Frame",{Size=aG,BackgroundColor3=e.panel,BorderSizePixel=0},b5(22))
W(nB,6)E(nB,"  "..e6:upper(),11,j.RC[e6]or e.text,true)for vX,e7 in ipairs(b6[e6])do local b8=D("Frame",{Size=aG,BackgroundColor3=e.bg,BorderSizePixel=0},b5(38))
W(b8,5)local tO=E(b8,j.nice(e7),11,j.RC[e6]or e.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-122,0,17))local tP,tQ=pcall(function()return e4 .describe(e7)end)
E(b8,tP and tostring(tQ)or"",9,e.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-122,0,17))local nC=x(b8,"BUY",e.panel2,9,UDim2 .new(1,-114,0.5,-11),UDim2 .new(0,34,0,22))
local nD=x(b8,"ANY",e.panel2,9,UDim2 .new(1,-77,0.5,-11),UDim2 .new(0,34,0,22))local nE=x(b8,"WISH",e.panel2,9,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,36,0,22))
local io=e7 nC.MouseButton1Click:Connect(function()j.flag(io,"b")end)nD.MouseButton1Click:Connect(function()j.flag(io,"g")end)
nE.MouseButton1Click:Connect(function()j.flag(io,"w")end)j.rows[e7]={b=nC,g=nD,w=nE,name=tO}end end c.pet.CanvasSize=UDim2 .new(0,0,0,e5+10)
j.built=true j.paintAll()end function o.names()local ip={"(none)"}for vY,tR in ipairs((o.teams()))do ip[#ip+1]=tR.name end
return ip end function o.cycle(iq,tS)local e8=o.names()local tT=f[iq]~=""and f[iq]or"(none)"local e9=table.find(e8,tT)or 1
e9=((e9-1+tS)%#e8)+1 f[iq]=e8[e9]=="(none)"and""or e8[e9]o.paint()end function o.paint()if not o.built then return end
O(c.tmT,f.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")local ir={}for vZ,tU in ipairs((o.teams()))do ir[tU.name]=true end
for tV,nF in pairs(o.pick)do local b9=f[tV]nF.Text=b9==""and"(none)"or(ir[b9]and b9 or(b9 .." (missing)"))nF.TextColor3=(b9~=""and not ir[b9])and e.bad or e.text
end if not c.tmLead:IsFocused()then c.tmLead.Text=tostring(f.GlazeLead)end c.tmInfo.Text=(o.msg or"")..("\nswitches %d | waxes finished %d | glazed %d"):format(o.switches,o.finished,o.glazed)
local tW,e_=j.srv(),{}for v0,fa in ipairs(o.list or{})do e_[#e_+1]=("st %-2s %-22s %9s  helps %d"):format(fa.st.Name,Q(L(fa.name)):sub(1,22),o.clock(fa.ends-tW),fa.helps)
end c.tmList.Text=#e_>0 and table.concat(e_,"\n")or"no waxes running"end function o.build()for v1,is in ipairs(c.team:GetChildren())do
if is:IsA("Frame")or is:IsA("TextLabel")then is:Destroy()end end o.pick={}local it,iu=0,12 local function bB(nG)
it,iu=it+1,iu+nG+6 return D("Frame",{Size=UDim2 .new(1,0,0,nG),BackgroundTransparency=1,LayoutOrder=it},c.team)
end local function fb(tX)E(bB(14),tX,10,e.dim,true)end local function iv(fc)local iw=bB(26)local tY=x(iw,"<",e.panel2,11,A(0,0.14))
local nH=x(iw,"(none)",e.panel,10,A(0.14,0.72))local tZ=x(iw,">",e.panel2,11,A(0.86,0.14))tY.MouseButton1Click:Connect(function()o.cycle(fc,-1)end)
tZ.MouseButton1Click:Connect(function()o.cycle(fc,1)end)nH.MouseButton1Click:Connect(function()o.cycle(fc,1)end)
o.pick[fc]=nH end c.tmT=x(bB(28),"AUTO TEAMS: OFF",e.panel2,11,A(0,1))c.tmT.MouseButton1Click:Connect(function()
f.Teams=not f.Teams if f.Teams and f.TeamNormal==""then f.TeamNormal=o.current()end o.paint()end)c.tmInfo=E(bB(30),"",10,e.dim,false)
fb("NORMAL TEAM  (worn the rest of the time)")iv("TeamNormal")fb("GLAZE TEAM  (worn just before a wax finishes)")
iv("TeamGlaze")local ix=bB(26)c.tmLead=hP(ix,tostring(f.GlazeLead),"45",A(0,0.2))E(ix,"sec before it finishes",10,e.dim,false,A(0.22,0.5))
local t0=x(ix,"SET",e.accent,11,A(0.75,0.25))t0 .MouseButton1Click:Connect(function()local fd=tonumber(c.tmLead.Text)
if fd and fd>=5 and fd<=600 then f.GlazeLead=math.floor(fd)else c.tmLead.Text=tostring(f.GlazeLead)end o.paint()
end)fb("WAX TEAM  (worn while a butter is placed)")iv("TeamWax")fb("YOUR WAXES  (time left, helps)")c.tmList=D("TextLabel",{Size=aG,BackgroundColor3=e.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=e.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text=""},bB(150))
W(c.tmList,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},c.tmList)E(bB(78),"Teams are the loadouts you saved in the game's Teams page. A wax's time is fixed when it is placed and its glaze is rolled when it finishes, so the WAX team only needs to be on while placing and the GLAZE team only at the finish. A help never leaves a wax under 60 s, so 45 s is enough. While AUTO TEAMS is on it keeps putting your NORMAL team back.",9,e.dim,false)
c.team.CanvasSize=UDim2 .new(0,0,0,iu+10)o.built=true o.paint()end local function t1()c.secB.Text=tostring(f.Every)
O(c.colT,f.Collect,"COLLECT: ON","COLLECT: OFF")O(c.sellT,f.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(c.crateT,f.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(c.arT,f.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")O(c.rejT,f.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(c.startT,f.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if f.AutoStart~=a.running then c3(f.AutoStart,true)end if a.winPos then c.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then c.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end bd(c.root)bd(c.tgRoot)a.lastCollect=q()
h1()z.paint()pcall(j.paintAll)pcall(o.paint)end local function t2(nI)task.spawn(function()nI.TextColor3=e.bad
task.wait(0.8)if a.alive then nI.TextColor3=e.text end end)end local function nJ()local nK=c.secB.Text:match("^%s*(%d+)%s*$")
local dh=nK and tonumber(nK)if not dh or dh<1 then c.secB.Text=tostring(f.Every)t2(c.secB)l("interval must be a whole number >= 1")
return end if dh==f.Every then return end f.Every,a.lastCollect=dh,q()l("collect every "..dh.."s")end local function iy(t3)
local nL=setclipboard or toclipboard return type(nL)=="function"and pcall(nL,t3)end local function t4()local iz=ai~=""and ai or(a.reason.."\n"..table.concat(aV,"\n"))
if iy(iz)then l("copied "..#iz.." chars")return end c.out.Text=iz pcall(function()c.out:CaptureFocus()end)l("no clipboard here - select the text in OUTPUT")
end local function t5()local t6,nM=pcall(hx)ai=t6 and nM or("DUMP ERROR "..tostring(nM))local nN=iy(ai)c.out.Text=(nN and#ai>7000)and(ai:sub(1,7000).."\n... (full text is on your clipboard)")or ai
l("DUMP "..#ai.." chars"..(nN and", copied"or""))end local function F(t7,t8)T(t7 .MouseButton1Click:Connect(t8))end
F(c.secSet,nJ)T(c.secB.FocusLost:Connect(nJ))F(c.colT,function()f.Collect,a.lastCollect=not f.Collect,q()O(c.colT,f.Collect,"COLLECT: ON","COLLECT: OFF")
end)F(c.sellT,function()f.SellJunk=not f.SellJunk O(c.sellT,f.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)F(c.sellB,function()
a.sellFails=0 task.spawn(as,"selling...",ml)end)F(c.arT,function()f.AutoRoll=not f.AutoRoll task.spawn(r.apply,"you asked",true)
end)F(c.crateT,function()f.Crates=not f.Crates O(c.crateT,f.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)F(c.crateB,function()
d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(as,"opening crate...",ef,true)end)F(c.padB,function()
a.plot=aX()or a.plot local nO,iA=aH(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(nO and iA and iA:IsA("BasePart"))then l("SET PAD: need character and plot")return end
a.manualPad=iA.CFrame:ToObjectSpace(nO.HumanoidRootPart.CFrame)sa(a.manualPad)l("collect pad saved at your position")
end)F(c.startB,function()c3(not a.running)end)F(c.buyB,function()a.plot=aX()or a.plot task.spawn(as,"buying (manual)...",ks,true)
end)F(c.plB,function()a.plot=aX()or a.plot task.spawn(as,"waxing (manual)...",kx)end)F(c.dumpB,t5)F(c.copyB,t4)
F(c.linkB,function()task.spawn(function()local t9,t_=pcall(hx)ai=t9 and t_ or ai if ai==""then ai="(empty dump)"end
local nP=(type(request)=="function"and request)or(type(http_request)=="function"and http_request)or(syn and syn.request)or(http and http.request)
if type(nP)~="function"then c.out.Text="this executor cannot upload - use COPY instead"return end c.out.Text="uploading..."
local nQ,b_=pcall(nP,{Url="https://paste.rs/",Method="POST",Headers={["Content-Type"]="text/plain"},Body=ai})
local iB=nQ and type(b_)=="table"and(b_.StatusCode or b_.status_code)or 0 local ua=nQ and type(b_)=="table"and(b_.Body or b_.body)or""
local iC=(iB>=200 and iB<300)and tostring(ua):match("https?://[%w%./%-_]+")or nil if not iC then c.out.Text="upload failed ("..tostring(iB)..") - use COPY instead"
l("LINK failed")return end local nR=iy(iC)c.out.Text="SEND THIS LINK TO CLAUDE:\n"..iC..(nR and"\n(copied)"or"")
l("dump uploaded"..(nR and", link copied"or""))end)end)F(c.tabFarm,function()be("farm")end)F(c.tabBut,function()be("but")end)
F(c.tabSet,function()be("set")end)F(c.tabCrt,function()be("crt")end)F(c.tabPet,function()be("pet")end)F(c.tabTeam,function()be("team")end)
local function nS(iD)a.hidden=iD c.root.Visible=not iD c.tgBtn.Text=iD and"SAB+"or"SAB"end m2(c.tgRoot,c.tgRoot,function(ub)
bd(c.tgRoot)a.togPos=eT(c.tgRoot)or a.togPos if ub<8 then nS(not a.hidden)end end)F(c.tgBtn,function()nS(not a.hidden)end)
local an,ad={},0 local function bf()an=fY()if#an==0 then c.cfgPick.Text="(none saved)"ad=0 return end if ad<1 or ad>#an then ad=1 end
c.cfgPick.Text=an[ad]..("  (%d/%d)"):format(ad,#an)end local function nT()local nU=a.autoload~=nil c.cfgAuto.Text=nU and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
c.cfgAuto.BackgroundColor3=nU and e.accent or e.panel2 end local function iE()local nV=c.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if nV~=""then return nV end return(ad>0 and an[ad])or""end F(c.cfgSave,function()a.winPos=eT(c.root)or a.winPos
a.togPos=eT(c.tgRoot)or a.togPos local nW,nX=f4(iE())c.cfgMsg.Text=nW and("saved as "..nX)or("could not save: "..nX)
c.cfgMsg.TextColor3=nW and e.good or e.bad bf()l(c.cfgMsg.Text)end)local function uc(iF)local iG,nY=jV(iF)c.cfgMsg.Text=iG and("loaded "..nY)or("could not load: "..nY)
c.cfgMsg.TextColor3=iG and e.good or e.bad if iG then c.cfgName.Text=iF t1()task.spawn(r.apply,"config "..iF)
end l(c.cfgMsg.Text)end F(c.cfgLoad,function()uc(iE())end)F(c.cfgPick,function()bf()if ad>0 then c.cfgName.Text=an[ad]end
end)F(c.cfgPrev,function()if#an==0 then bf()return end ad=(ad-2)%#an+1 bf()c.cfgName.Text=an[ad]end)F(c.cfgNext,function()
if#an==0 then bf()return end ad=ad%#an+1 bf()c.cfgName.Text=an[ad]end)F(c.cfgAuto,function()if a.autoload then
jX(nil)c.cfgMsg.Text="it will not load a config on launch"else local di=iE()local nZ=false for v2,ud in ipairs(fY())do if ud==di then nZ=true end end
local ue=nZ or f4(di)if ue and di~=""then jX(di)bf()c.cfgMsg.Text=di.." will load every time the script starts"
else c.cfgMsg.Text="name the config and save it first"end end c.cfgMsg.TextColor3=e.dim nT()end)F(c.autoB,function()
local n0,n1=pN()c.autoMsg.Text=n0 and("installed. "..n1)or("failed: "..n1)c.autoMsg.TextColor3=n0 and e.good or e.bad
l(c.autoMsg.Text)end)F(c.startT,function()f.AutoStart=not f.AutoStart O(c.startT,f.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)F(c.rejT,function()f.Rejoin=not f.Rejoin O(c.rejT,f.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)F(c.rejB,function()dW("you asked")end)
local ca=false F(c.minB,function()ca=not ca c.tabs.Visible=not ca if ca then c.farm.Visible,c.but.Visible,c.set.Visible,c.crt.Visible=false,false,false,false
c.pet.Visible,c.team.Visible=false,false else be(nq)end c.root.Size=UDim2 .new(0,aa.w,0,ca and(aa.head+aa.strip)or aa.h)
c.minB.Text=ca and"+"or"-"end)local function fe()if not a.alive then return end a.alive,a.running=false,false
pcall(fE)for v3,uf in ipairs(fj)do pcall(function()uf:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()hO:Destroy()end)pcall(function()na:Destroy()end)if bC.SAB_KILL==fe then bC.SAB_KILL=nil end end
bC.SAB_KILL=fe F(c.killB,fe)F(c.xB,fe)m2(c.title,c.root,function()bd(c.root)a.winPos=eT(c.root)or a.winPos end)
local function n2()local dj,dk=a.reason,a.level if a.busy then dj,dk=a.busyText,"ok"elseif not a.running then
local v4,n3,ug=mr()if a.capHit then dj,dk=n3,"bad"else dj,dk="[stopped] "..n3,(ug=="bad")and"bad"or"idle"end a.reason,a.level=dj,dk
end c.reason.Text=dj c.bar.BackgroundColor3=sO[dk]or e.dim c.dot.BackgroundColor3=a.running and e.good or(a.capHit and e.bad or e.dim)
c.tgDot.BackgroundColor3=c.dot.BackgroundColor3 c.tgRoot.BackgroundColor3=a.hidden and e.panel2 or e.accent c.startB.Text=a.running and"STOP"or"START"
O(c.startT,f.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")c.startB.BackgroundColor3=a.running and e.warn or e.good
local uh,ui=fw()c.sBought.Text,c.sPlaced.Text,c.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
c.sColl.Text,c.sFree.Text=tostring(a.collected),uh.."/"..ui local n4=(a.running and f.Collect)and math.max(0,math.ceil(f.Every-(q()-a.lastCollect)))or nil
local n5=K()c.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ag(aC()),a.rolls,a.gifts,a.crates,n5 and Q(L(n5))or"nothing",d.on and("   ["..d.title.." window open]")or"",n4 and("in "..n4 .."s")or"off")
local cb=jH()c.tgt.Text=(#cb==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#cb<=3)and table.concat(cb,", ")or(#cb.." butters ticked")))
c.tgt.TextColor3=(#cb==0)and e.bad or e.good c.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
c.log.Text=table.concat(dn,"\n")if c.butInfo then c.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(J.n,#J.rarOrder,#cb)
end if c.but.Visible and aT.at~=J.at then de(false)end if c.crt.Visible then if z.built~=z.at then z.build()else z.paint()end
end if c.pet.Visible then j.live()end if c.team.Visible then o.paint()end O(c.crateT,f.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(c.arT,f.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local n6=(r.rec.on and"on"or"")..(r.rec.off and((r.rec.on and"/"or"").."off")or"")
c.arL.Text=r.msg~=""and r.msg or("game: %s | learned: %s%s"):format(r.isOn()and"ON"or"off",n6~=""and n6 or"nothing yet",#r.rec.rules>0 and", choices"or"")
c.arL.TextColor3=r.msg~=""and e.warn or e.dim end bC.SAB={S=a,CFG=f,EV=H,U=c,sg=hO,dump=hx,CAT=J,LEARN=M,buildList=de,
PX=j,TM=o,CRATE=d}l(bh.." loaded")if a.uiErrs>0 then l("UI: "..a.uiErrs.." properties skipped")end be("farm")
bd(c.root)bd(c.tgRoot)if eQ then pcall(function()T(eQ:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bd(c.root)bd(c.tgRoot)end))end)end bf()nT()if a.config and a.config~=""then c.cfgName.Text=a.config end
O(c.colT,f.Collect,"COLLECT: ON","COLLECT: OFF")O(c.sellT,f.SellJunk,"SELL THEM: ON","SELL THEM: OFF")O(c.crateT,f.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
O(c.rejT,f.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")O(c.startT,f.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
c.secB.Text=tostring(f.Every)pcall(n2)task.spawn(function()local n7=f6()c.rejMsg.Text=n7 and("after a rejoin it restarts from\n"..n7)or
"no saved copy of this script found, so after a rejoin you would start it by hand"c.autoMsg.Text=(fX(ae.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(pT)end)task.spawn(function()while a.alive do local uj,uk=pcall(n2)if not uj then l("UI ERR "..tostring(uk))end
task.wait(0.25)end end)task.spawn(function()local ul,um=pcall(p2)if not ul then l("HOOK ERR "..tostring(um))end
end)task.spawn(function()pcall(oO)if d.loadSeq and not d.learned then local ff={}for n8=1,20 do if d.loadSeq[n8]then ff[#ff+1]=d.loadSeq[n8]end end
if#ff>0 then d.learned={seq=ff,mode=d.loadMode}l("remembered how to open crates directly")end end if fW()then l(("catalog: %d butters in %d rarities"):format(J.n,#J.rarOrder))end
local un,n9=pcall(sc)if un and n9 and a.alive and not a.manualPad then a.manualPad=n9 end end)task.spawn(function()
while a.alive do local iH,iI=pcall(j.buyTick)if not iH then l("PET ERR "..tostring(iI))task.wait(5)end iH,iI=pcall(j.wishTick)
if not iH then l("WISH ERR "..tostring(iI))task.wait(5)end task.wait(0.75)end end)task.spawn(function()while a.alive do
local uo,up=pcall(o.tick)if not uo then l("TEAM ERR "..tostring(up))task.wait(3)end task.wait(0.25)end end)task.spawn(function()
while a.alive do task.wait(20)pcall(fE)end end)pcall(r.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local ur=(type(newcclosure)=="function")and newcclosure or function(uq)return uq end local iJ
local n_=(type(setnamecallmethod)=="function")and setnamecallmethod or nil iJ=hookmetamethod(game,"__namecall",ur(function(oa,...)
local dl=getnamecallmethod()if a.alive and(dl=="InvokeServer"or dl=="FireServer")then local ob,oc=pcall(function()return oa.Name end)
if ob and oc=="CrateAction"and not d.replaying then pcall(d.saw,dl,...)elseif ob and oc=="AutoRollAction"and not r.replaying then pcall(r.saw,dl,...)end
if n_ then n_(dl)end end return iJ(oa,...)end))d.oldNC=iJ end)end if fh then T(y.Idled:Connect(function()pcall(function()fh:CaptureController()fh:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for v5=1,90 do if not a.alive then return end if y:GetAttribute("AutoRollOn")~=nil and aH()and(a.plot or aX())then break end
task.wait(1)end task.wait(2)if f.AutoRoll then r.apply("joined")end while a.alive do task.wait(30)if a.alive and f.AutoRoll and a.running and not r.isOn()and not bK()and not K()
and not d.waiting and not d.on and not a.busy then r.apply("it was off")end end end)task.spawn(function()if not f.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for v6=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or aX()if aH()and a.plot and next(f.Targets)then c3(true,true)l("started by itself")
return end task.wait(1)end if a.alive and not a.running then l("gave up waiting to start - tap START")end end)
task.spawn(function()a.plot=aX()a.lastCollect=q()while a.alive do if a.running then local us,od=pcall(ss)if not us and od~=fi then l("LOOP ERR "..tostring(od))end
end task.wait(0.1)end end)fg("loaded - window is at the top left")end local uu,iK=xpcall(oh,function(ut)return tostring(ut).."\n"..debug.traceback()end)
if not uu then pcall(function()warn("SAB "..bh.." ERROR: "..tostring(iK))end)fg("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bh.." ERROR: "..tostring(iK))end)pcall(function()local oe=(type(getgenv)=="function"and getgenv())or _G
if type(oe.SAB_KILL)=="function"then oe.SAB_KILL()end for v7,uv in ipairs({"SABFarmGui","SABToggle"})do local of=y.PlayerGui:FindFirstChild(uv)
if of then of:Destroy()end end end)pcall(function()local dm=Instance.new("ScreenGui")dm.Name="SABError"dm.ResetOnSpawn=false
dm.DisplayOrder=1000 local aB=Instance.new("TextBox")aB.Size=UDim2 .new(0,340,0,170)aB.Position=UDim2 .new(0,10,0,50)
aB.BackgroundColor3=Color3 .fromRGB(90,20,20)aB.TextColor3=Color3 .new(1,1,1)aB.TextSize=11 aB.TextWrapped=true
aB.ClearTextOnFocus=false aB.TextXAlignment=Enum.TextXAlignment.Left aB.TextYAlignment=Enum.TextYAlignment.Top
aB.Text="SAB "..bh.." failed to start. Send this text:\n"..tostring(iK)aB.Parent=dm dm.Parent=y:WaitForChild("PlayerGui")
end)end
