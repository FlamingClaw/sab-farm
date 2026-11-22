local bX="v27"local m6=game:GetService("Players")local J=m6 .LocalPlayer or m6 .PlayerAdded:Wait()local function ii(vx)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bX,Text=vx,Duration=6})
end)end ii("script started")local function vy()local ah=game:GetService("ReplicatedStorage")local au=game:GetService("Workspace")
local m7=game:GetService("UserInputService")local cB=(type(getgenv)=="function"and getgenv())or _G if type(cB.SAB_KILL)=="function"then pcall(cB.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local ij=(function()local vz,vA=pcall(function()return game:GetService("VirtualUser")end)return vz and vA or nil end)()
local d={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,Calm=false,HideBases=false,HideMine=false,MemLimit=2000,Help=false,
HelpGuild=false,Campfire=true,Ghost=false,GhostHelps=false,Quests=true,AutoIndex=false,Best=0,BestCrate=false,
Shower=true,SnapGlaze=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=y(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local V={name=nil,rar=nil,at=y(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local D={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local e={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local q,z,j,C,E,K,F={},{},{},{},{},{},{}local o,O={},{}local ik={}local il,fk,ds,dt={},{},{},{}local function T(m8)il[#il+1]=m8 return m8 end
local function af(vB)task.wait(vB)if not c.alive then error(ik,0)end end local function A(fl)fl=os.date("%H:%M:%S").." "..tostring(fl)
table.insert(fk,1,fl)if#fk>6 then table.remove(fk)end c.logN=(c.logN or 0)+1 ds[#ds+1]=fl if#ds>80 then table.remove(ds,1)end
end local function fm(m9)if type(m9)~="string"then return""end return(m9:lower():gsub("[^%w]",""))end local function W(vC)
local m_=fm(vC)local im=m_:gsub("butter$","")if im==""then im=m_ end return im end local function aK(na)if type(na)~="string"then return false end
local io=W(na)if io==""then return false end if o.want then return o.want(io)end return d.Targets[io]==true end
local function vD(du)du=du:lower()return du:find("squishy",1,true)~=nil or du:match("butter$")~=nil or du:match("butter[^%a]")~=nil
end local ip={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aL(dv)if type(dv)~="number"then return"?"end
local fn=1 while math.abs(dv)>=1000 and fn<#ip do dv=dv/1000 fn=fn+1 end local vE=string.format("%.2f",dv):gsub("%.?0+$","")
return vE..ip[fn]end local function vF(nb)if type(nb)~="string"then return nil end local vG,dw=nb:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local iq=tonumber(vG)if not iq then return nil end if dw==""then return iq end local vH={qd="qa",qn="qi"}dw=vH[dw:lower()]or dw
for vI,vJ in ipairs(ip)do if vJ:lower()==dw:lower()then return iq*1000^(vI-1)end end return nil end local function a_()
local nc=J:GetAttribute("BoardValueMoney")if type(nc)=="number"then return nc end local nd=J:FindFirstChild("leaderstats")
if nd then for EI,vK in ipairs({"Cash","Money","Coins"})do local ir=nd:FindFirstChild(vK)if ir and type(ir.Value)=="number"then return ir.Value end
end end end local function fo(vL)local is=vL:GetFullName()if c.plot then local it=c.plot:GetFullName()if is:sub(1,#it)==it then return is:sub(#it+2)end
end return is end local function ao()local fp=J.Character if fp and fp:FindFirstChild("HumanoidRootPart")then
local ne=fp:FindFirstChildOfClass("Humanoid")if ne and ne.Health>0 then return fp end end end local function bv()
local iu=au:FindFirstChild("Plots")if not iu then return nil end local function nf(vM)local ng=vM:FindFirstChild("Plate")
return ng~=nil and ng:FindFirstChild("EditStackAttachment",true)~=nil end local nh=J:GetAttribute("PlotNumber")
if nh~=nil then local iv=iu:FindFirstChild(tostring(nh))if iv and nf(iv)then return iv end end for EJ,ni in ipairs(iu:GetChildren())do
if nf(ni)then return ni end end end local function dx(nj)local bw=nj and nj.Parent for EK=1,6 do if not bw then return nil end
if bw:IsA("BasePart")then return bw end if bw:IsA("Model")then return bw.PrimaryPart or bw:FindFirstChildWhichIsA("BasePart",true)end
bw=bw.Parent end end local function nk(nl)local iw=nl.Parent if iw and iw:IsA("Attachment")then return iw.WorldPosition end
local nm=dx(nl)return nm and nm.Position end local function nn()local cC=c.plot and c.plot:FindFirstChild("Plate")
if not cC then return nil end if cC:IsA("BasePart")then return cC.Position end if cC:IsA("Model")then return cC:GetPivot().Position end
local no=cC:FindFirstChildWhichIsA("BasePart",true)return no and no.Position end local function np()local ix={}
local nq=c.plot and c.plot:FindFirstChild("WaxStations")if nq then for EL,vN in ipairs(nq:GetChildren())do local nr=vN:FindFirstChild("SquishyPlaceHolder")
local iy=nr and nr:FindFirstChild("PlacePrompt")if iy and iy:IsA("ProximityPrompt")then ix[#ix+1]=iy end end end
return ix end local function fq()local ns,iz=np(),0 for EM,vO in ipairs(ns)do if vO.Enabled then iz=iz+1 end end
local iA=#ns local iB=J:GetAttribute("WaxStations")if type(iB)=="number"and iB>iA then iA=iB end return iz,iA
end local function vP()local nt=ao()local nu=nt and nt.HumanoidRootPart.Position local iC,nv for EN,iD in ipairs(np())do
if iD.Enabled then local nw=nk(iD)local nx=(nw and nu)and(nw-nu).Magnitude or 1e9 if not iC or nx<nv then iC,nv=iD,nx end
end end return iC end local function ny()local fr=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fr then return nil end local nz=fr:FindFirstChild("BuyPromptAttachment")local fs=(nz and nz:FindFirstChild("BuyPrompt"))or fr:FindFirstChild("BuyPrompt",true)
if fs and fs:IsA("ProximityPrompt")and fs:IsDescendantOf(fr)then return fs end end local nA={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local vQ={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iE="SAB_order.txt"local function ft()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for vR,vS in pairs(aj.price)do aB[#aB+1]="P|"..vR.."|"..string.format("%.0f",vS)end for vT,vU in pairs(aj.order)do aB[#aB+1]="O|"..vT.."|"..table.concat(vU,",")end
if e.learned and e.enc then aB[#aB+1]="M|mode|"..tostring(e.learned.mode or"")for vV,fu in ipairs(e.learned.seq)do
local nB={}for nC=1,fu.n do nB[nC]=e.enc(fu.args[nC])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(vV,fu.m,fu.n,table.concat(nB,";"))
end end local function iF(vW,vX,fv)local nD={}for nE=1,fv.n do nD[nE]=e.enc(fv.args[nE])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(vX,vW,fv.m,fv.n,table.concat(nD,";"))
end if e.enc then for vY,vZ in ipairs(D.rec.rules)do iF("rules",vY,vZ)end if D.rec.on then iF("on",0,D.rec.on)end
if D.rec.off then iF("off",0,D.rec.off)end end for EO,dy in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dy.name,dy.title or"",dy.rar or"",dy.price and string.format("%.0f",dy.price)or"")
end if pcall(writefile,iE,table.concat(aB,"\n"))then aj.dirty=false end end local function v0()if type(isfile)~="function"or type(readfile)~="function"then return end
local v1,v2=pcall(isfile,iE)if not(v1 and v2)then return end local v3,nF=pcall(readfile,iE)if not(v3 and type(nF)=="string")then return end
for v4 in nF:gmatch("[^\n]+")do local cD,cE,ba=v4:match("^(%a)|([^|]+)|(.*)$")if cD=="P"then aj.price[cE]=tonumber(ba)
elseif cD=="M"then e.loadMode=(ba~=""and ba~="nil")and ba or nil elseif cD=="A"and e.dec then local nG=tonumber(cE)
local nH,fw,v5=ba:match("^([^|]+)|(%d+)|(.*)$")if nG and nH then fw=tonumber(fw)local nI,fy={},0 for v6 in(v5 ..";"):gmatch("([^;]*);")do
fy=fy+1 if fy<=fw then nI[fy]=e.dec(v6)end end e.loadSeq=e.loadSeq or{}e.loadSeq[nG]={m=nH,n=fw,args=nI}end elseif cD=="R"and e.dec then
local nJ=tonumber(cE)local fz,v7,fA,v8=ba:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if nJ and fz then fA=tonumber(fA)
local nK,fB={},0 for v9 in(v8 ..";"):gmatch("([^;]*);")do fB=fB+1 if fB<=fA then nK[fB]=e.dec(v9)end end local iG={m=v7,n=fA,args=nK}
if fz=="rules"then D.rec.rules[nJ]=iG elseif fz=="on"then D.rec.on=iG elseif fz=="off"then D.rec.off=iG end end
elseif cD=="K"then local nL,nM,v_=ba:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cE)]={name=cE,title=nL~=""and nL or nil,
rar=nM~=""and nM or nil,price=tonumber(v_)}elseif cD=="O"and ba~=""then local fC={}for wa in ba:gmatch("[^,]+")do fC[#fC+1]=wa end
if#fC>0 then aj.order[cE]=fC end end end end local function wb(fD)if type(fD)~="table"then return end local bY,nN=fD.rarity,fD.contents
if type(bY)~="string"or bY==""or type(nN)~="table"then return end local dz={}for EP,fE in ipairs(nN)do if type(fE)=="table"and type(fE.butter)=="string"then
dz[#dz+1]={n=fE.butter,ch=tonumber(fE.chance)or 0}end end if#dz==0 then return end table.sort(dz,function(wc,wd)return wc.ch>wd.ch end)
local dA,dB={},false for we,wf in ipairs(dz)do dA[we]=wf.n end local iH=aj.order[bY]if not iH or#iH~=#dA then dB=true end
if not dB then for nO=1,#dA do if iH[nO]~=dA[nO]then dB=true break end end end aj.order[bY]=dA local iI=tonumber(fD.price)
if iI and aj.price[bY]~=iI then aj.price[bY]=iI dB=true end if dB then aj.dirty=true ad.at=0 A("learned the "..bY.." order from its crate")
end end local function cF(wg,wh)local wi=wg:FindFirstChild(wh,true)local wj,iJ=pcall(function()return wi.Text end)
return(wj and type(iJ)=="string"and iJ~="")and iJ or nil end local function ak(nP)return ad.pretty[nP]or nP end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(wk)return fm(wk or"")end
function L.learn(bc)if type(bc)~="table"or type(bc.name)~="string"then return end local iK=L.key(bc.name)local bd=L.seen[iK]or{}
local wl=(L.seen[iK]==nil)or(tonumber(bc.price)and bd.price~=tonumber(bc.price))bd.name,bd.title=bc.name,bc.title or bd.title
bd.rar,bd.price=bc.rarity or bd.rar,tonumber(bc.price)or bd.price L.seen[iK]=bd if wl then L.at,aj.dirty=y(),true end
end function L.wanted(nQ)if nQ==nil then return false end local iL=L.key(nQ)return d.CrateTicks[iL]==true or(d.BestCrate and o.bestCrate~=nil and(iL==o.bestCrate or iL==o.bestCrateTitle))
end function L.list()local cG={}for wm,fF in ipairs(L.base)do cG[L.key(fF[1])]={name=fF[1],title=fF[2],rar=fF[3],i=wm}end
for EQ,dC in ipairs(ad.rarOrder)do local nR=false for ER,wn in pairs(cG)do if wn.rar==dC then nR=true break end end
if not nR and dC~="?"then local nS=dC:gsub("[^%w]","").."Crate"cG[L.key(nS)]={name=nS,title=dC.." Crate",rar=dC,i=50,guess=true}
end end for nT,fG in pairs(L.seen)do local a3=cG[nT]or{i=100}a3 .name,a3 .title,a3 .rar=fG.name or a3 .name,fG.title or a3 .title,fG.rar or a3 .rar
a3 .price,a3 .guess=fG.price or a3 .price,nil cG[nT]=a3 end local dD,fH={},{}for wo,wp in ipairs(nA)do dD[wp]=wo end
for wq,nU in ipairs(ad.rarOrder)do dD[nU]=dD[nU]or(20+wq)end for wr,dE in pairs(cG)do dE.k=wr dE.price=dE.price or aj.price[dE.rar or""]
fH[#fH+1]=dE end table.sort(fH,function(bZ,b0)if bZ.price and b0 .price and bZ.price~=b0 .price then return bZ.price<b0 .price end
local nV,nW=dD[bZ.rar or""]or 99,dD[b0 .rar or""]or 99 if nV~=nW then return nV<nW end if(bZ.i or 100)~=(b0 .i or 100)then return(bZ.i or 100)<(b0 .i or 100)end
return bZ.k<b0 .k end)return fH end local function ws()local nX=ah:FindFirstChild("Assets")local nY=nX and nX:FindFirstChild("Squishies")
if not nY then return false end local iM,nZ,cH={},{},{}local fI=0 for ES,fJ in ipairs(nY:GetChildren())do local dF=W(fJ.Name)
if dF~=""and not iM[dF]then local fK=cF(fJ,"RarityText")or"?"iM[dF]=fK nZ[dF]=cF(fJ,"NameText")or fJ.Name cH[fK]=cH[fK]or{}
table.insert(cH[fK],dF)fI=fI+1 end end if fI==0 then return false end for n0,wt in pairs(cH)do local n1=aj.order[n0]or vQ[n0]
local iN={}if n1 then for wu,wv in ipairs(n1)do iN[W(wv)]=wu end end table.sort(wt,function(n2,n3)local iO,iP=iN[n2],iN[n3]
if iO and iP then return iO<iP end if iO then return true end if iP then return false end return ak(n2)<ak(n3)
end)end local iQ={}for ww,wx in ipairs(nA)do iQ[wx]=ww end local fL,b1={},{}for wy in pairs(cH)do fL[#fL+1]=wy end
pcall(function()for wz,wA in ipairs(require(ah.Modules.SquishyRNG).Keys)do b1[wA]=wz end end)table.sort(fL,function(cI,cJ)
if b1[cI]and b1[cJ]and b1[cI]~=b1[cJ]then return b1[cI]<b1[cJ]end local iR,iS=aj.price[cI],aj.price[cJ]if iR and iS and iR~=iS then return iR<iS end
local iT,iU=iQ[cI],iQ[cJ]if iT and iU then return iT<iU end if iT then return true end if iU then return false end
return cI<cJ end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=iM,nZ,cH,fL,fI,y()return true end local function iV()
if ad.at==0 or(y()-ad.at)>120 then pcall(ws)end return ad.n>0 end local function wB(wC)local n4=W(wC)return ad.rar[n4]or(V.name and W(V.name)==n4 and V.rar)or"?"
end local function wD()local fM={}local wE=((d.Best or 0)>0 and next(o.best or{}))and o.best or d.Targets for wF,wG in pairs(wE)do if wG then fM[#fM+1]=ak(wF)end end
table.sort(fM)return fM end local am={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function n5()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fN(n6)if type(makefolder)~="function"then return end local wH,wI=pcall(isfolder,n6)if not(wH and wI)then pcall(makefolder,n6)end
end local function fO(n7)if type(isfile)~="function"or type(readfile)~="function"then return nil end local wJ,wK=pcall(isfile,n7)
if not(wJ and wK)then return nil end local wL,wM=pcall(readfile,n7)return wL and wM or nil end local function dG(wN,wO)
if type(writefile)~="function"then return false end return(pcall(writefile,wN,wO))end local function n8(wP)local dH={}
if type(listfiles)~="function"then return dH end local wQ,n9=pcall(listfiles,wP)if not wQ or type(n9)~="table"then return dH end
for ET,wR in ipairs(n9)do dH[#dH+1]=tostring(wR)end return dH end local function n_()local fP={}for EU,wS in ipairs(n8(am.cfg))do
local oa=wS:match("([^/\\]+)%.txt$")if oa then fP[#fP+1]=oa end end table.sort(fP)return fP end local function wT()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(d.Every)aa[#aa+1]="N|GlazeLead|"..tostring(d.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(d.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(d.MemLimit)aa[#aa+1]="N|Best|"..tostring(d.Best or 0)for EW,ob in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..ob.."|"..d[ob]end
do local fQ={}for wU,dI in pairs(d.Pets)do local oc=(dI.b and"b"or"")..(dI.g and"g"or"")..(dI.w and"w"or"")..((tonumber(dI.f)or 0)>0 and tostring(dI.f)or"")
if oc~=""then fQ[#fQ+1]=wU.."|"..oc end end table.sort(fQ)aa[#aa+1]="P|-"for EX,wV in ipairs(fQ)do aa[#aa+1]="P|"..wV end
end for EY,od in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..od.."|"..(d[od]and"1"or"0")end local iW=J:GetAttribute("AutoRollRules")if type(iW)=="string"and iW~=""then d.ARrules,d.ARstop=iW,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then aa[#aa+1]="S|rules|"..d.ARrules aa[#aa+1]="S|stop|"..d.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for EZ,iX in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fR={}for wW,wX in pairs(iX[2])do if wX then fR[#fR+1]=wW end end table.sort(fR)aa[#aa+1]=iX[1].."|-"for E0,wY in ipairs(fR)do aa[#aa+1]=iX[1].."|"..wY end
end return table.concat(aa,"\n")end local function wZ(iY)if type(iY)~="string"or iY==""then return false end local oe,of,og,oh,dJ={},false,{},false,nil
for w0 in iY:gmatch("[^\n]+")do local aC,ag,ax=w0:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ag=="Every"then local iZ=tonumber(ax)
if iZ and iZ>=1 then d.Every=math.floor(iZ)end elseif aC=="N"and(ag=="FpsCap"or ag=="MemLimit")then local i0=tonumber(ax)
if i0 and i0>=0 then d[ag]=math.floor(i0)end elseif aC=="N"and ag=="Best"then local fS=tonumber(ax)if fS and fS>=0 and fS<=4 then d.Best=math.floor(fS)end
elseif aC=="N"and ag=="GlazeLead"then local fT=tonumber(ax)if fT and fT>=5 and fT<=600 then d.GlazeLead=math.floor(fT)end
elseif aC=="S"and(ag=="TeamNormal"or ag=="TeamFull"or ag=="TeamGlaze"or ag=="TeamWax")then d[ag]=ax elseif aC=="P"and ag~=""then
if not dJ then dJ={}end if ag~="-"and ax~=""then dJ[ag]={b=ax:find("b",1,true)and true or nil,g=ax:find("g",1,true)and true or nil,
w=ax:find("w",1,true)and true or nil,f=tonumber(ax:match("%d"))}end elseif aC=="B"then if d[ag]~=nil then d[ag]=(ax=="1")end
elseif aC=="S"and ag=="rules"then d.ARrules=ax elseif aC=="S"and ag=="stop"then d.ARstop=ax elseif aC=="W"then
c.winPos={tonumber(ag)or 10,tonumber(ax)or 44}elseif aC=="G"then c.togPos={tonumber(ag)or 10,tonumber(ax)or 300}
elseif aC=="T"and ag~=""then if ag~="-"then oe[ag]=true end of=true elseif aC=="K"and ag~=""then if ag~="-"then og[ag]=true end
oh=true end end if of then d.Targets=oe end if oh then d.CrateTicks=og end if dJ then d.Pets=dJ end return true
end local function fU(cK)if not n5()then return false,"this executor cannot write files"end cK=(cK or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cK==""then return false,"give the config a name"end fN(am.dir)fN(am.cfg)if not dG(am.cfg.."/"..cK..".txt",wT())then return false,"could not write the file"end
c.config=cK return true,cK end local function oi(fV)local oj=fO(am.cfg.."/"..fV..".txt")if not oj then return false,"no config called "..tostring(fV)end
if not wZ(oj)then return false,"that config looks empty"end c.config=fV return true,fV end local function ol(i1)
if i1 then fN(am.dir)dG(am.auto,i1)elseif type(delfile)=="function"then pcall(delfile,am.auto)else dG(am.auto,"")
end c.autoload=i1 end local function w1()if c.selfPath then return c.selfPath end local fW for E1,w2 in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",am.dir})do
for E2,om in ipairs(n8(w2))do local i2=om:lower()if i2:sub(-4)==".lua"and(i2:find("sab_farm",1,true)or i2:find("sab farm",1,true))then
fW=fW or om end end end c.selfPath=fW return fW end am.stub=[[
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
local function w3()if not n5()then return false,"this executor cannot write files"end fN("autoexec")if not dG(am.exec,am.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fX=(function()local w4,w5=pcall(function()return game:GetService("TeleportService")end)return w4 and w5 or nil end)()
local function oo()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local w6=queueonteleport or queue_on_teleport return(pcall(w6,am.stub))end local function dK(w7)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..w7 ..")")pcall(ft)if c.autoload then pcall(fU,c.autoload)end local w8=oo()A(w8 and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for E3=1,30 do if not fX then break end pcall(function()fX:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function w9()local w_,op=pcall(function()return game:GetService("GuiService")end)if w_ and op then
pcall(function()T(op.ErrorMessageChanged:Connect(function()if d.Rejoin then dK("roblox error message")end end))
end)end pcall(function()local oq=game:GetService("CoreGui")local ot=oq and oq:WaitForChild("RobloxPromptGui",15)
local ou=ot and ot:WaitForChild("promptOverlay",15)if ou then T(ou.ChildAdded:Connect(function(xa)if d.Rejoin and tostring(xa.Name):lower():find("errorprompt",1,true)then dK("disconnect prompt")end
end))end end)if fX then pcall(function()T(fX.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dK("teleport retry")end)end
end))end)end end local function ov(xb)local ow=c.plot and c.plot:FindFirstChild(xb)if not ow then return nil,false end
for E4,i3 in ipairs(ow:GetChildren())do if i3:IsA("Model")or i3:IsA("BasePart")then return i3,true end end return nil,true
end local function b2()local bx=ov("RolledSquishy")if not bx then return nil end return{model=bx,name=bx.Name,pretty=cF(bx,"NameText")or ak(W(bx.Name)),
rar=cF(bx,"RarityText")or wB(bx.Name),price=cF(bx,"PriceText")}end local function ox(i4)return type(i4)=="string"and(ad.rar[W(i4)]~=nil or vD(i4))
end local function ac()local i5=ov("SquishyEquipped")if i5 then c.carrySrc,e.heldAt="model",y()return i5 .Name,i5 end
local oy=J.Character if oy then for E5,dL in ipairs(oy:GetDescendants())do if(dL:IsA("Model")or dL:IsA("Tool"))and ox(dL.Name)then
c.carrySrc,e.heldAt="character",y()return dL.Name,dL end end end local fY=J:GetAttribute("SquishyEquipped")if type(fY)=="string"and fY~=""and ox(fY)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fY,nil end c.carrySrc=nil end local function E6()local E7,xc=ac()return xc end local function dM()
local oz=b2()local i6=oz and vF(oz.price)local i7=a_()if i6 and i7 and i7<i6*0.5 then return i7,i6 end end local function b3(xd)
dt[#dt+1]=os.date("%H:%M:%S").." "..xd if#dt>40 then table.remove(dt,1)end end local function xe(b4,fZ)if type(b4)~="string"then return end
b3(("Roll(%s,%s)"):format(b4,tostring(fZ)))if b4:lower():find("crate",1,true)then e.rolled,e.rolledAt=b4,y()return
end V.seq=V.seq+1 V.name,V.at=b4,y()V.rar=type(fZ)=="string"and fZ or nil c.rolls=c.rolls+1 if aK(b4)then A(("ROLL %s [%s] = TARGET"):format(b4,tostring(fZ)))end
end local function xf(b5)if type(b5)~="table"then return end local f0=b5 .butter or b5 .itemName if type(f0)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=f0,y()if type(b5 .giftId)=="string"then local oA=ah:FindFirstChild("Remotes")
local oB=oA and oA:FindFirstChild("GiftThanks")if oB then pcall(function()oB:FireServer(b5 .giftId)end)end end
b3("Gift("..f0 .." from "..tostring(b5 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b5 .fromName),f0))
end local function xg()local oC=ah:WaitForChild("Remotes",30)if not c.alive then return end if not oC then A("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local oD=J:GetAttribute("SquishyEquipped")
if type(oD)=="string"and oD~=""then e.heldAt=y()end end))local xm={SquishyRollAnimation=xe,InitSquishy=function(oE)V.init,V.initAt=tostring(oE),y()b3("Init("..tostring(oE)..")")end,
CrateUpdate=function(cL,oF)pcall(wb,cL)pcall(L.learn,cL)if type(cL)=="table"then local xh=oF==true or(e.rolled~=nil and y()-e.rolledAt<15)or e.waiting
if not xh then return end local xi=not e.waiting local xj=e.on e.waiting,e.data,e.at=true,cL,y()e.on=(oF==true)
e.title=tostring(cL.title or cL.name or"crate")if e.on and not xj then e.openedAt,e.byYou=y(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then b3("CrateWindow open("..e.title..")")elseif xi then b3("Crate waiting("..e.title..")")A(e.title.." is waiting on your stand")
end else if e.waiting then b3("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local xk=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,xk)end if e.classify then local xl=y()
task.spawn(function()pcall(e.classify,xl)end)end end end,GiftReceived=xf,}for f1,xn in pairs(xm)do local i8=oC:FindFirstChild(f1)
if i8 and i8:IsA("RemoteEvent")then T(i8 .OnClientEvent:Connect(xn))elseif f1~="CrateUpdate"and f1~="GiftReceived"then A("remote "..f1 .." missing")end
end end local function i9()local b6=b2()if b6 then if aK(b6 .name)then return{state="match",shown=b6 .pretty,src="pad",info=b6}
end return{state="skip",info=b6,level="idle",text=("on pad: %s [%s] - not ticked"):format(b6 .pretty,tostring(b6 .rar))}
end if V.name and(y()-V.at)<4 then if aK(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f2(xo,xp,xq,xr)
local f3=RaycastParams.new()f3 .FilterType=Enum.RaycastFilterType.Exclude local i_={J.Character}for E8,xs in ipairs(xr or{})do i_[#i_+1]=xs end
f3 .FilterDescendantsInstances=i_ pcall(function()f3 .RespectCanCollide=true end)local oG=au:Raycast(Vector3 .new(xo,xp+4,xq),Vector3 .new(0,-30,0),f3)
return oG and oG.Position or nil end local function cM(oH)local oI=oH:FindFirstChildOfClass("Humanoid")return((oI and oI.HipHeight)or 2)+oH.HumanoidRootPart.Size.Y/2+0.2
end local function ja(xt,xu)local jb=xt:FindFirstChildOfClass("Humanoid")local xv=y()while y()-xv<xu do if jb and(jb.FloorMaterial~=Enum.Material.Air or jb.SeatPart)then return true end
af(0.05)end return false end local function aD(xw,jc,jd)local oJ=xw.HumanoidRootPart oJ.AssemblyLinearVelocity=Vector3 .new(0,0,0)
oJ.CFrame=jd and CFrame.new(jc,Vector3 .new(jd.X,jc.Y,jd.Z))or CFrame.new(jc)end local function b7(be,oK)local b8=ao()
if not b8 or not be then return false end local by=be.Position local f4=math.clamp(math.max(be.Size.X,be.Size.Z)/2+2.2,3,7)
local oL=(oK and oK.MaxActivationDistance)or 10 if f4>oL-2 then f4=math.max(2.5,oL-2)end local dN={}local function b9(dO)
dO=Vector3 .new(dO.X,0,dO.Z)if dO.Magnitude>0.05 then dN[#dN+1]=dO.Unit end end local oM=nn()if oM then b9(oM-by)end
b9(be.CFrame.LookVector)b9(-be.CFrame.LookVector)b9(be.CFrame.RightVector)b9(-be.CFrame.RightVector)b9(b8 .HumanoidRootPart.Position-by)
if#dN==0 then b9(Vector3 .new(0,0,1))end local xx,f5=cM(b8),false for E9,xy in ipairs(dN)do local f6=by+xy*f4
local je=f2(f6 .X,by.Y,f6 .Z,{be})if je and math.abs(je.Y-by.Y)<14 then aD(b8,Vector3 .new(f6 .X,je.Y+xx,f6 .Z),by)
if ja(b8,0.7)then f5=true break end end end if not f5 then aD(b8,by+dN[1]*f4+Vector3 .new(0,3,0),by)f5=ja(b8,1)
end af(0.12)return f5 end local function oN(dP)if not dP.Parent or not dP.Enabled then return false end pcall(function()dP:InputHoldBegin()end)
af(math.max(dP.HoldDuration,0)+0.08)pcall(function()dP:InputHoldEnd()end)return true end local function ap(oO,xz)
local xA=y()while y()-xA<xz do if oO()then return true end af(0.05)end return oO()end local function dQ(cN,xC,oP,xD)
local xE=c.zapFirst and{"zap","hold"}or{"hold","zap"}for xF,jf in ipairs(xE)do if xF==2 and(xD or not(cN.Parent and cN.Enabled and(not oP or oP())))then break end
local jg if jf=="hold"then jg=oN(cN)else jg=type(fireproximityprompt)=="function"and cN.Parent~=nil and cN.Enabled and pcall(fireproximityprompt,cN)end
if jg and ap(xC,1.2)then c.zapFirst=(jf=="zap")return true,jf end end return false end local function oQ(jh)local bz=ny()
if not bz or not bz.Enabled then A("buy: nothing on the pad")return false end local ji=dx(bz)if not ji then A("buy: pad part missing")return false end
c.lastBuyAt=y()local xG,oR=V.seq,a_()local oS=ao()local xH=oS and(oS.HumanoidRootPart.Position-ji.Position).Magnitude>12
b7(ji,bz)if xH then af(0.4)end if not bz.Enabled then A("buy aborted: pad emptied")return false end local cO=i9()
if not jh and cO.state~="match"then A("buy aborted: "..(cO.text or"pad changed"))c.matchSince=nil return false
end local jj=cO.info and cO.info.name or(cO.state=="match"and V.name)or nil local function xI()return bz.Enabled and ac()==nil and(jh or i9().state=="match")
end local xJ,xK=dQ(bz,function()return ac()~=nil or((not bz.Enabled)and(jh or V.seq==xG))end,xI,dM()~=nil)if xJ then
ap(function()return ac()~=nil end,0.8)local dR=ac()local oT=a_()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dR and ak(W(dR))or(cO.shown or"?"),(oR and oT)and(" for $"..aL(oR-oT))or"",xK))
if dR and jj and W(dR)~=W(jj)then A(("note: picked up %s, not %s"):format(dR,jj))end return true end local f7=b2()
if dM()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aL(a_()),(f7 and f7 .price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(f7 and f7 .price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function oU()local dS=ac()if not dS then c.holding=false A("place: hands are empty")
return false end if not aK(dS)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dS))))return false end
for E_=1,d.PlaceTries do local bA=vP()if not bA then A("place: no free station")break end local oV=dx(bA)if oV then
b7(oV,bA)local oW=ac()if not oW then c.holding=false A("place: hands emptied on the way")return false end if not aK(oW)then A("place: what I carry changed, not waxing it")return false end
if bA.Enabled then local xL,xM=dQ(bA,function()return not bA.Enabled end,function()return bA.Enabled end)if xL then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dS)),c.placed,bA.Parent.Parent.Name,xM))if o.placed then pcall(o.placed,dS)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))A(c.capMsg)end return false end function z.place()local xN=y()while c.alive and z.editing and y()-xN<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then z.placing=true local xO=y()while c.alive and z.current()~=d.TeamWax and y()-xO<5 do af(0.1)end
if z.current()==d.TeamWax then af(0.3)else A("wax team did not come on in time - placing anyway")end end local xP,oX=pcall(oU)
z.placing=false if not xP then error(oX,0)end return oX end local function oY(oZ)return type(oZ)=="string"and oZ:lower():find("crate",1,true)~=nil
end local xQ={SABFarmGui=1,SABToggle=1,SABError=1}local function jk(xR)local bB=xR while bB do if xQ[bB.Name]then return false end
if bB:IsA("ScreenGui")then local xS,xT=pcall(function()return bB.Enabled end)return(not xS)or xT~=false end if bB:IsA("GuiObject")and not bB.Visible then return false end
bB=bB.Parent end return false end local function f8(f9)local cP=""pcall(function()if f9:IsA("TextButton")then cP=f9 .Text end end)
if not cP:find("%a")then for Fa,f_ in ipairs(f9:GetDescendants())do if(f_:IsA("TextLabel")or f_:IsA("TextButton"))and f_.Text:find("%a")then cP=f_.Text break end
end end if not cP:find("%a")then cP=f9 .Name end return(cP:lower():gsub("[^%a]",""))end local function xU()local dT,dU
local o0=J:FindFirstChildOfClass("PlayerGui")if not o0 then return nil,nil end for Fb,dV in ipairs(o0:GetDescendants())do
if dV:IsA("GuiButton")and jk(dV)then local jl=f8(dV)if jl:sub(1,4)=="open"and not jl:find("shop",1,true)then dT=dT or dV end
if jl:sub(1,7)=="discard"then dU=dU or dV end end end if dT and dU then return dT,dU end if e.on then return dT,dU end
return nil,nil end local jm=(function()local xV,xW=pcall(function()return game:GetService("VirtualInputManager")end)return xV and xW or nil end)()
local function o1(bf,jn)local jo={}local function o2(xX)jo[#jo+1]=xX end if c.tapWay then o2(c.tapWay)end for Fc,o3 in ipairs({"touch","conn","signal"})do
if o3~=c.tapWay then o2(o3)end end local function o4(xY,...)local xZ,jp=pcall(getconnections,xY)if not(xZ and type(jp)=="table"and#jp>0)then return false end
local o5,x0,x1=false,{...},select("#",...)for Fd,x2 in ipairs(jp)do if pcall(function()x2:Fire(table.unpack(x0,1,x1))end)then o5=true end
end return o5 end local function o6()local o7=Vector3 .new(0,0,0)pcall(function()local o8,o9=bf.AbsolutePosition,bf.AbsoluteSize
o7=Vector3 .new(o8 .X+o9 .X/2,o8 .Y+o9 .Y/2,0)end)local jq={Position=o7,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jq.UserInputType=Enum.UserInputType.Touch end)pcall(function()jq.UserInputState=Enum.UserInputState.End end)
return jq end for Fe,bh in ipairs(jo)do local dW=false if bh=="conn"and type(getconnections)=="function"then if o4(bf.MouseButton1Click)then
dW=true if ap(jn,1.5)then c.tapWay=bh return true,bh end end dW=o4(bf.Activated,o6(),1)elseif bh=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bf.MouseButton1Click)then if ap(jn,1.5)then c.tapWay=bh return true,bh end end dW=pcall(firesignal,bf.Activated,o6(),1)
elseif bh=="touch"and jm then dW=pcall(function()local o_,pa=bf.AbsolutePosition,bf.AbsoluteSize local pb=0 local pc=bf:FindFirstAncestorWhichIsA("ScreenGui")
local x3,x4=pcall(function()return pc and pc.IgnoreGuiInset end)if not(x3 and x4)then pcall(function()pb=game:GetService("GuiService"):GetGuiInset().Y end)
end local pd,pe=o_.X+pa.X/2,o_.Y+pa.Y/2+pb jm:SendMouseButtonEvent(pd,pe,0,true,game,1)task.wait(0.06)jm:SendMouseButtonEvent(pd,pe,0,false,game,1)
end)end if dW and ap(jn,1.5)then c.tapWay=bh return true,bh end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jr(pf)local dX=pf.Parent while dX and dX~=c.plot do if e.NOT[dX.Name]then return false end dX=dX.Parent
end local js=(pf.ActionText or""):lower()if js:find("roll",1,true)or js:find("place",1,true)or js:find("sell",1,true)then return false end
return true end local function pg()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local ph=c.plot:FindFirstChild("CrateStand")local dY if ph then for Ff,ga in ipairs(ph:GetDescendants())do
if ga:IsA("ProximityPrompt")and ga.Enabled and jr(ga)then dY=ga break end end end if not dY then for Fg,bC in ipairs(c.plot:GetDescendants())do
if bC:IsA("ProximityPrompt")and bC.Enabled and jr(bC)then local pj=bC:FindFirstAncestorWhichIsA("Model")local x5=((bC.ActionText or"").." "..(bC.ObjectText or"").." "..bC.Name.." "..(pj and pj.Name or"")):lower()
if x5:find("crate",1,true)then dY=bC break end end end end e.prompt=dY return dY end local function jt()if e.on then return true end
local dZ=pg()if not dZ then e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local pk=dx(dZ)if pk then b7(pk,dZ)end e.ours=true dQ(dZ,function()return e.on end)if ap(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: pressed "..fo(dZ).." but no window came up")
return false end do local function x6(pl)local cQ=pl.Parent while cQ and cQ:IsA("GuiObject")do local pm,pn=false,false
for Fh,d0 in ipairs(cQ:GetDescendants())do if d0~=pl and d0:IsA("GuiButton")and f8(d0):sub(1,7)=="discard"then pm=true end
if d0:IsA("TextLabel")then local ju=d0 .Text:lower()if ju:find("crate",1,true)or ju:find("can contain",1,true)or ju:find("cost",1,true)then pn=true end
end if pm and pn then return cQ end end cQ=cQ.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local po=J:FindFirstChildOfClass("PlayerGui")if not po then return nil end for Fi,gb in ipairs(po:GetDescendants())do
if gb:IsA("GuiButton")and not gb:FindFirstAncestor("SABFarmGui")and f8(gb):sub(1,4)=="open"then local jv=x6(gb)
if jv then e.win=jv return jv end end end end local function x7(x8)for Fj,gc in ipairs(x8:GetDescendants())do
if gc:IsA("GuiButton")then local pp,jw=f8(gc),gc.Name:lower()if pp=="x"or pp=="close"or jw=="x"or jw:find("close",1,true)or jw:find("exit",1,true)then return gc end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(x9)task.wait(x9 and 4 or 1.2)if e.on or e.waiting then return end
local gd=e.findWin()if not gd or not jk(gd)then return end local pq=x7(gd)if pq and o1(pq,function()return not jk(gd)end)then return end
A("the crate window is still open - tap its X")end end local function d1(ge)if not jt()then return false end local ps=y()-(e.openedAt or 0)
if ps<0.6 then af(0.6-ps)end local jx=e.title local x_,ya=xU()local pt=ge and x_ or ya if not pt then e.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(ge and"Open"or"Discard",jx))return false
end local yb=ac()local yc,Fk=o1(pt,function()return(not e.on)or(ac()~=nil and ac()~=yb)end)if not yc then e.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(ge and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if ge then c.crates=c.crates+1 ap(function()return ac()~=nil end,1.5)local pu=ac()
A(("OPENED %s -> %s"):format(jx,pu and ak(W(pu))or"?"))else A("discarded "..jx.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(yd,...)local ye=select("#",...)e.calls[#e.calls+1]={t=y(),m=yd,n=ye,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aE,bi)local bD=type(aE)if(bD=="string"or bD=="number")and type(bi.data)=="table"then for pv,jy in pairs(bi.data)do
if jy==aE and type(pv)=="string"and(type(jy)=="string"or type(jy)=="number")then return{__slot="f:"..pv}end end
end if bD=="string"then if bi.crate and aE==bi.crate then return{__slot="crate"}end if bi.title and aE==bi.title then return{__slot="title"}end
if bi.rar and aE==bi.rar then return{__slot="rarity"}end return aE end if bD=="number"or bD=="boolean"or bD=="nil"then return aE end
if bD=="table"then local pw={}for yf,px in pairs(aE)do if type(px)=="table"then return nil,"nested table"end local yg,py=e.slot(px,bi)
if py then return nil,py end pw[yf]=yg end return pw end local yh,yi=pcall(function()return aE:IsA("Instance")end)
if yh and yi then if aE==J then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gf=c.plot and c.plot:FindFirstChild("CrateStand")if gf and aE==gf then return{__slot="stand"}end if gf and aE.Parent==gf then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bD..")"end function e.resolve(gg)if type(gg)~="table"then return gg end
local aR=gg.__slot if aR and aR:sub(1,2)=="f:"then return e.data and e.data[aR:sub(3)]end if aR=="crate"then return e.data and e.data.name end
if aR=="title"then return(e.data and e.data.title)or e.title end if aR=="rarity"then return e.data and e.data.rarity end
if aR=="player"then return J end if aR=="plot"then return c.plot end if aR=="stand"or aR=="model"then local jz=c.plot and c.plot:FindFirstChild("CrateStand")
if aR=="stand"or not jz then return jz end for Fl,pz in ipairs(jz:GetChildren())do if oY(pz.Name)then return pz end end
return nil end local pA={}for yj,yk in pairs(gg)do pA[yj]=e.resolve(yk)end return pA end function e.classify(jA)
if e.directOff then return end local gh={}for Fm,jB in ipairs(e.calls)do if jB.t<=jA+0.05 and jA-jB.t<=6 then gh[#gh+1]=jB end
end if#gh==0 then return end if not ap(function()return(e.heldAt or 0)>=jA-1 end,2.5)then return end local d2={}
for Fn,d3 in ipairs(gh)do local pB={}for pC=1,d3 .n do local yl,pD=e.slot(d3 .args[pC],d3)if pD then A("crate call has "..pD.." - keeping the button method")
return end pB[pC]=yl end d2[#d2+1]={m=d3 .m,n=d3 .n,args=pB}end local jC=e.learned e.learned={seq=d2,mode=jC and jC.mode or nil}
aj.dirty=true if not jC then A(("learned how to open crates directly (%d call%s)"):format(#d2,#d2==1 and""or"s"))end
end function e.replay()local pE=e.learned local pF=ah:FindFirstChild("Remotes")local jD=pF and pF:FindFirstChild("CrateAction")
if not(pE and jD)then return false end local pG=table.unpack or unpack e.replaying=true for Fo,d4 in ipairs(pE.seq)do
local jE={}for pH=1,d4 .n do jE[pH]=e.resolve(d4 .args[pH])end task.spawn(function()pcall(function()if d4 .m=="InvokeServer"then jD:InvokeServer(pG(jE,1,d4 .n))
else jD:FireServer(pG(jE,1,d4 .n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(ym)return(ym:gsub("[%%|;=,\n]",function(yn)return("%%%02X"):format(yn:byte())end))end
function e.enc(b_)local gi=type(b_)if gi=="string"then return"s"..e.esc(b_)end if gi=="number"then return"n"..tostring(b_)end
if gi=="boolean"then return b_ and"b1"or"b0"end if gi=="nil"then return"z"end if b_.__slot then return"k"..b_.__slot end
local jF={}for yo,yp in pairs(b_)do jF[#jF+1]=e.enc(yo).."="..e.enc(yp)end return"t"..table.concat(jF,",")end
function e.dec(pI)local d5,d6=pI:sub(1,1),pI:sub(2)local function yq(yr)return(yr:gsub("%%(%x%x)",function(ys)return string.char(tonumber(ys,16))end))end
if d5=="s"then return yq(d6)end if d5=="n"then return tonumber(d6)end if d5=="b"then return d6=="1"end if d5=="k"then return{__slot=d6}end
if d5=="t"then local pJ={}for yt in d6:gmatch("[^,]+")do local pK,yu=yt:match("^(.-)=(.*)$")if pK then local pL=e.dec(pK)
if pL~=nil then pJ[pL]=e.dec(yu)end end end return pJ end return nil end function e.goneOrNew(yv)return function()
if not e.waiting then return true end local pM=ac()return pM~=nil and pM~=yv end end function e.near()local pN=ah:FindFirstChild("Remotes")
local jG=pN and pN:FindFirstChild("CrateAction")local gj=ao()local jH=c.plot and c.plot:FindFirstChild("CrateStand")
local jI=jH and jH:FindFirstChild("Spot")if not(jG and gj and jI)then A(("crate: cannot open %s right now (%s)"):format(tostring(e.title),
not jG and"no CrateAction remote"or not gj and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jJ=gj.HumanoidRootPart local gk=jJ.CFrame local pO,jK=e.title,"no answer"local yw=ac()local pP=jH:FindFirstChild("Holder")
local function pQ()if not pP then return e.waiting or e.on end for Fp,yx in ipairs(pP:GetChildren())do if yx:IsA("Model")then return true end end
return false end for yy=1,3 do if not(e.waiting or e.on)or not pQ()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end if(jJ.Position-jI.Position).Magnitude>8 then b7(jI,e.prompt)end af(0.12+0.15*yy)
local a4={}e.replaying=true task.spawn(function()a4 .ok,a4 .v=pcall(function()return jG:InvokeServer("open")end)
a4 .done=true end)ap(function()return a4 .done end,6)e.replaying=false local ca=a4 .v if a4 .done and a4 .ok and type(ca)=="table"and ca.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(pO,ca.prize and ak(W(tostring(ca.prize)))or"?"))
ap(function()local pR=ac()return pR~=nil and pR~=yw end,1.5)if(jJ.Position-gk.Position).Magnitude>8 then pcall(function()aD(gj,gk.Position,gk.Position+gk.LookVector)end)end
return true,"opened"end jK=(a4 .done and a4 .ok and type(ca)=="table")and tostring(ca.reason or"refused, no reason given")
or(a4 .done and("error: "..tostring(ca))or"no answer in 6s")af(0.3)if not pQ()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(pO,jK))
return false,jK end e.GIVEUP=600 function e.drop()local pS=ah:FindFirstChild("Remotes")local pT=pS and pS:FindFirstChild("CrateAction")
local pU=c.plot and c.plot:FindFirstChild("CrateStand")local jL=pU and pU:FindFirstChild("Spot")local pV=ao()
if jL and pV and(pV.HumanoidRootPart.Position-jL.Position).Magnitude>8 then b7(jL,e.prompt)af(0.3)end local jM,bj=false,nil
if pT then jM,bj=pcall(function()return pT:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(e.title),math.floor(e.GIVEUP/60),(jM and type(bj)=="table"and bj.ok)and"done"or("answer: "..tostring(type(bj)=="table"and(bj.reason or bj.ok)or bj))))
e.waiting,e.on,e.quietUntil=false,false,y()+4 e.summonFails,e.nearFails,e.lastFail,e.at,e.prompt=0,0,0,nil,nil
if not(jM and type(bj)=="table"and bj.ok)then d1(false)end end function e.smart()local jN=e.title if(e.nearFails or 0)<3 then
local yz=e.near()if yz then return true end if e.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local cb=e.learned if cb then local jO=ac()if e.on then e.replay()if ap(e.goneOrNew(jO),3.5)then c.crates=c.crates+1
A("OPENED "..jN.." (direct)")return true end else if cb.mode~="window"then e.replay()if ap(e.goneOrNew(jO),3.5)then
c.crates,e.fails=c.crates+1,0 if cb.mode~="direct"then cb.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..jN.." (direct, no window)")return true end end if jt()then e.replay()if ap(e.goneOrNew(jO),3.5)then
c.crates,e.fails=c.crates+1,0 if cb.mode~="window"then cb.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..jN.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,aj.dirty=cb,nil,true
if e.fails>=3 then e.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return d1(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for yA,pW in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(pW):Connect(function()D.cache[yA]=J:GetAttribute(pW)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(yB,...)local gl=D.cache
local yC={m=yB,n=select("#",...),args={...},before={rules=gl.rules,stop=gl.stop,on=gl.on,main=gl.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,yC)end end)end function D.learnOne(d7)local ay,d8=D.snap(),d7 .before local gm=(ay.rules~=d8 .rules)or(ay.stop~=d8 .stop)
local pX=(ay.on~=d8 .on)or(ay.main~=d8 .main)if not gm and not pX then return end local pY={}for pZ=1,d7 .n do
local aM=d7 .args[pZ]local cc=type(aM)if cc=="string"and aM~=""and aM==ay.rules then aM={__slot="rules"}elseif cc=="string"and aM~=""and gm and aM==ay.stop and ay.stop~=d8 .stop then aM={__slot="stop"}
elseif cc=="table"then local p0={}for yD,cR in pairs(aM)do if type(cR)=="table"or(type(cR)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end p0[yD]=(type(cR)=="string"and cR~=""and cR==ay.rules)and{__slot="rules"}or cR end aM=p0 elseif cc~="string"and cc~="number"and cc~="boolean"and cc~="nil"then
if aM==J then aM={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end pY[pZ]=aM
end local cS={m=d7 .m,n=d7 .n,args=pY}if gm then local jP=false for yE=1,cS.n do local d9=cS.args[yE]if type(d9)=="table"and d9 .__slot=="rules"then jP=true end
if type(d9)=="table"and not d9 .__slot then for Fq,p1 in pairs(d9)do if type(p1)=="table"and p1 .__slot=="rules"then jP=true end end
end end if jP then D.rec.rules={cS}else table.insert(D.rec.rules,cS)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if pX then if ay.on==true then D.rec.on=cS else D.rec.off=cS end d.AutoRoll=(ay.on==true)end if ay.rules and ay.rules~=""then d.ARrules,d.ARstop=ay.rules,ay.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gm and"choices"or(ay.on and"on"or"off")))end
function D.resolve(cT)if type(cT)~="table"then return cT end if cT.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cT.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cT.__slot=="player"then return J end
local p2={}for yF,yG in pairs(cT)do p2[yF]=D.resolve(yG)end return p2 end function D.replay(p3,yH)local p4=table.unpack or unpack
for Fr,d_ in ipairs(yH)do local jQ={}for p5=1,d_.n do jQ[p5]=D.resolve(d_.args[p5])end D.replaying=true pcall(function()
if d_.m=="InvokeServer"then task.spawn(function()pcall(function()p3:InvokeServer(p4(jQ,1,d_.n))end)end)else p3:FireServer(p4(jQ,1,d_.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(p6,yI)if D.busy or not c.alive then return end D.busy=true
pcall(function()local p7=ah:FindFirstChild("Remotes")local jR=p7 and p7:FindFirstChild("AutoRollAction")if not jR then D.msg="this game has no AutoRollAction"return end
local bE=d.AutoRoll if bE and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(jR,D.rec.rules)
if ap(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bE==D.isOn()or(not bE and not yI)then return end
local gn=bE and D.rec.on or D.rec.off if not gn then local ea=bE and D.rec.off or D.rec.on local p8=ea~=nil for yJ=1,ea and ea.n or 0 do
if type(ea.args[yJ])=="boolean"then p8=false end end if p8 then gn=ea end end if not gn then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bE and"on"or"off")
A(D.msg)return end D.replay(jR,{gn})if ap(function()return D.isOn()==bE end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bE and"ON"or"OFF",p6 and(" ("..p6 ..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local yK,yL=pcall(function()return J.UserId end)return yK and yL or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local yM,jS=pcall(function()return require(ah:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if yM and type(jS)=="table"and type(jS.Pets)=="table"then q.I=jS end return q.I end function q.order()if q.list then return q.list end
local bF=q.info()if not bF then return{}end local cd={}if type(bF.Order)=="table"and#bF.Order>0 then for Fs,p9 in ipairs(bF.Order)do if bF.Pets[p9]then cd[#cd+1]=p9 end end
else for yN in pairs(bF.Pets)do cd[#cd+1]=yN end table.sort(cd,function(yO,yP)return(bF.Pets[yO].price or 0)<(bF.Pets[yP].price or 0)end)
end q.list=cd return cd end function q.nice(p_,jT)local qa=q.info()local qb=qa and qa.Pets[p_]return((jT and jT~="")and(jT.." ")or"")..(qb and qb.displayName or tostring(p_))
end function q.data()local go=J:GetAttribute("PetsData")if type(go)~="string"then return nil end if go==q.rawD then return q.lastD end
local yQ,eb=pcall(function()return q.HS:JSONDecode(go)end)eb=(yQ and type(eb)=="table")and eb or nil q.rawD,q.lastD=go,eb
return eb end function q.pen()return ah:FindFirstChild("PetMeadowSpawns")end function q.srv()return au:GetServerTimeNow()end
function q.money()local jU=J:FindFirstChild("MoneyValue")if jU and type(jU.Value)=="number"then return jU.Value end
return a_()or 0 end function q.wishes()local qc=q.pen()local qe=qc and qc:GetAttribute("Wishes")local jV,qf={},q.srv()
if type(qe)~="string"then return jV end local yR,qg=pcall(function()return q.HS:JSONDecode(qe)end)if yR and type(qg)=="table"then
for yS,jW in pairs(qg)do if type(jW)=="number"and jW>qf then jV[yS]=jW-qf end end end return jV end function q.call(...)
local qh=ah:FindFirstChild("Remotes")local qi=qh and qh:FindFirstChild("PetRequest")if not qi then return nil end
local qj=table.pack(...)local ce={}task.spawn(function()ce.ok,ce.v=pcall(function()return qi:InvokeServer(table.unpack(qj,1,qj.n))end)
ce.done=true end)local yT=y()while not ce.done and y()-yT<6 do task.wait(0.05)end if ce.done and ce.ok then return ce.v end
return nil end function q.want(yU)return d.Pets[yU]end function q.closeNaming(jX)local ql=pcall(function()local qk=J:FindFirstChild("PlayerScripts")
local yV=qk and qk:FindFirstChild("Naming",true)require(yV).close()end)af(0.5)if jX.Visible then pcall(function()local qm=jX:FindFirstChild("NameBox",true)if qm then qm:ReleaseFocus()end end)
jX.Visible=false ql=false end return ql end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qo=J:FindFirstChildOfClass("PlayerGui")
local qp=qo and qo:FindFirstChild("MainGui")local gp=qp and qp:FindFirstChild("PetNameGui")if gp and gp.Visible then
af(0.4)if gp.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gp)break end end af(0.25)end
q.namingOn=false end)end function q.buyTick()if not d.PetBuy then q.buyMsg="auto adopt is off"return end local jY,qq,gq=q.info(),q.pen(),q.data()
if not(jY and qq and gq)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local ec,jZ=#(gq.pets or{}),tonumber(gq.maxOwned)or 60
local yW,qr,ed=q.srv(),{},nil for Ft,aS in ipairs(qq:GetChildren())do qr[aS.Name]=true local cf,gr=aS:GetAttribute("Pet"),aS:GetAttribute("Variant")or""
local j0=cf and q.want(cf)if j0 and j0 .b and jY.Pets[cf]and(not j0 .g or gr=="Big")and C.wantMore(cf,gr,gq)and not aS:GetAttribute("A_"..q.uid)
and(tonumber(aS:GetAttribute("ExpiresAt"))or 0)>yW+1 and y()>=(q.tryAt[aS.Name]or 0)then local ee,qs=q.nice(cf,gr),jY.Pets[cf].price or 0
if ec>=jZ then ed=("%s is in the pen, but you have %d/%d pets"):format(ee,ec,jZ)q.tryAt[aS.Name]=y()+15 elseif q.money()<qs then
ed=("%s is in the pen - need $%s"):format(ee,aL(qs))q.tryAt[aS.Name]=y()+5 else q.tryAt[aS.Name]=y()+8 local bG=q.call("adopt",aS.Name)
if type(bG)=="table"and bG.ok then ec=ec+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local yX=type(bG.pet)=="table"and bG.pet or{}
table.insert(q.recent,{id=tostring(yX.id or("?"..y())),name=cf,variant=gr,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..ee)q.skipNaming()ed="adopted "..ee else local qt=type(bG)=="table"and tostring(bG.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(ee,qt))ed="adopt failed: "..qt if type(bG)=="table"and bG.bagFull then q.tryAt[aS.Name]=y()+60 end
end end end end for qu in pairs(q.tryAt)do if not qr[qu]then q.tryAt[qu]=nil end end q.buyMsg=ed or("watching the pen (%d/%d pets)"):format(ec,jZ)
end function q.wishTick()if not d.PetWish then q.wishMsg="auto wish is off"return end local gs=q.info()if not(gs and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local cg,j1,bH=q.wishes(),0,nil local yY=(type(gs.Wish)=="table"and gs.Wish.cashShare)or 2
local yZ=q.data()for Fu,aA in ipairs(q.order())do local qv=q.want(aA)if qv and qv.w and C.wantMore(aA,"",yZ)then
j1=j1+1 if not cg[aA]and y()>=(q.wishTry[aA]or 0)then local j2=tonumber(J:GetAttribute("PetWishCredits"))or 0
local j3=math.floor((gs.Pets[aA].price or 0)*yY)if j2<=0 and q.money()<j3 then q.wishTry[aA]=y()+10 bH=("need $%s to wish for %s"):format(aL(j3),q.nice(aA))
q.wishWhy[aA]=bH else q.wishTry[aA]=y()+3 local y0=j2>0 and"wishCredit"or"wish"local gt=q.call(y0,aA)if type(gt)=="table"and gt.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),j2>0 and"free wish"or("$"..aL(j3))))
else local j4=type(gt)=="table"and tostring(gt.reason or"no reason given")or"no answer"if j4:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),j4))bH="wish failed: "..j4 end end end end end end if not bH then
for Fv,gu in ipairs(q.order())do local qw=q.want(gu)if qw and qw.w and not cg[gu]and q.wishWhy[gu]then bH=q.wishWhy[gu]break end
end end if not bH then local cU={}for Fw,gv in ipairs(q.order())do local qx=q.want(gv)if qx and qx.w and cg[gv]then cU[#cU+1]=("%s %dm"):format(q.nice(gv),math.ceil(cg[gv]/60))end
end local gw for Fx,gx in ipairs(q.order())do local qy=q.want(gx)if qy and qy.w and cg[gx]and(not gw or cg[gx]<gw)then gw=cg[gx]end
end bH=j1==0 and"no pet has WISH ticked"or(#cU==0 and"running: none yet")or(#cU<=3 and("running: "..table.concat(cU,", ")))
or("%d running, the next one ends in %dm"):format(#cU,math.ceil((gw or 0)/60))end q.wishMsg=bH end z.switches,z.glazed,z.finished=0,0,0
z.done,z.doneN,z.later={},0,{}function z.teams()local j5=q.data()return(j5 and j5 .teams)or{},j5 end function z.current(cV)
cV=cV or q.data()if not cV then return""end local qz={}for Fy,y1 in ipairs(cV.equipped or{})do qz[tostring(y1)]=true end
for Fz,qA in ipairs(cV.teams or{})do local qB=qA.pets or{}local j6=#qB==#(cV.equipped or{})if j6 then for FA,y2 in ipairs(qB)do if not qz[tostring(y2)]then j6=false break end end end
if j6 then return qA.name end end return""end function z.equip(j7)local y3,y4=z.teams()local j8 for y5,y6 in ipairs(y3)do if y6 .name==j7 then j8=y5 break end end
if not j8 then z.msg="no saved team called "..tostring(j7)return false end if z.current(y4)==j7 then return true end
for FB=1,4 do local qC=q.call("teamEquip",j8)if type(qC)=="table"and qC.ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(y7)local qD=y7:FindFirstChild("SquishyPlaceHolder")local qE=qD and qD:FindFirstChild("TimerGui")
local qF=qE and qE:FindFirstChildWhichIsA("TextLabel",true)local j9=qF and qF.Text if type(j9)~="string"or j9:find("-",1,true)then return nil end
local j_,qG,qH=j9:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not j_ then return nil end local qI=qH~=""and(tonumber(j_)*3600+tonumber(qG)*60+tonumber(qH))or(tonumber(j_)*60+tonumber(qG))
return qI>0 and qI or nil end function z.waxes()local ef={}local qJ=c.plot and c.plot:FindFirstChild("WaxStations")
if not qJ then return ef end local qK=q.srv()for FC,a5 in ipairs(qJ:GetChildren())do local ka=tonumber(a5:GetAttribute("PourEnd"))
local qL=a5:GetAttribute("PourOwner")if a5:GetAttribute("HasSquishy")and a5:GetAttribute("PourId")and(qL==nil or qL==q.uid)then
local kb=z.left(a5)local qM=kb and(qK+kb)or((ka and ka>qK)and ka or nil)if qM then local qN,qO=a5:FindFirstChild("SquishyPlaceHolder"),"?"
if qN then for FD,qP in ipairs(qN:GetChildren())do if qP:IsA("Model")then qO=qP.Name break end end end local y8=tostring(a5:GetAttribute("Helpers")or"")
local kc=0 for FE in y8:gmatch("%d+")do kc=kc+1 end ef[#ef+1]={st=a5,ends=qM,sure=kb~=nil,id=a5:GetAttribute("PourId"),name=qO,helps=kc,
long=a5:GetAttribute("PourLong")==true}end end end table.sort(ef,function(y9,y_)return y9 .ends<y_.ends end)return ef
end function z.glazeCount()local qQ=ah:FindFirstChild("Remotes")local qR=qQ and qQ:FindFirstChild("EditStack")
if not qR then return nil end local za,eg=pcall(function()return qR:InvokeServer("State",nil)end)if not(za and type(eg)=="table"and type(eg.state)=="table")then return nil end
local kd,ke=0,{}for FF,gy in ipairs(eg.state.entries or{})do if gy.glaze and gy.glaze~=""then kd=kd+1 ke[gy.glaze]=(ke[gy.glaze]or 0)+1 end
end return kd,ke,#(eg.state.entries or{}),eg.state.capacity end function z.finishedOne(gz,qS)z.finished=z.finished+1
task.wait(2)local kf,zb,qT,zc=z.glazeCount()if kf and qS and kf>qS then z.glazed=z.glazed+1 local kg={}for zd,ze in pairs(zb)do kg[#kg+1]=zd.." "..ze end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gz.name)),gz.st.Name,kf,table.concat(kg,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gz.st.Name,ak(W(gz.name)),qT and(" (stack "..qT.."/"..tostring(zc)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not d.Teams then z.want,z.msg="","auto teams is off"return end
local cj=q.srv()local aF=z.glazeFor if aF then local eh=aF.st local qU=eh.Parent and eh:GetAttribute("HasSquishy")and eh:GetAttribute("PourId")==aF.id
local qV=qU and z.left(eh)if qV then aF.ends=cj+qV end if not qU then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local zf=aF.before
task.spawn(function()pcall(z.finishedOne,aF,zf)end)end elseif aF.ends-cj>d.GlazeLead*3+60 or cj>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(eh.Name,z.clock(aF.ends-cj)))
end end if d.TeamGlaze~=""and not z.glazeFor then local zg=z.speedRatio(d.TeamGlaze)for FG,ck in ipairs(z.list)do
if ck.sure and(ck.ends-cj)*zg[ck.long and 2 or 1]<=d.GlazeLead and y()>=(z.later[ck.id or"?"]or 0)and not z.done[ck.id or"?"]then
z.glazeFor=ck task.spawn(function()ck.before=z.glazeCount()end)break end end end local aG,ei="",""local cW=d.SnapGlaze~=false and o.snapAt and(o.snapAt-cj)
if cW and cW<-8 then o.snapAt,cW=nil,nil end if d.TeamGlaze~=""and cW and cW<=20 then aG,ei=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cW)))
elseif d.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ei=d.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ei=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and z.allBusy()then
aG,ei=d.TeamFull," - every station is busy"else aG=d.TeamNormal end z.want=aG local ej=z.current()z.cur=ej if aG~=""and ej~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ei)else z.nextTry=y()+3 end end local kh=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(ej~=""and ej or"(not a saved team)",(aG~=""and aG~=ej)and(" -> "..aG)or"",
kh and("in "..z.clock(kh.ends-cj).." (st "..kh.st.Name..")")or"- none running")end function z.clock(bI)bI=math.max(0,math.floor(bI))
if bI>=3600 then return("%d:%02d:%02d"):format(math.floor(bI/3600),math.floor((bI%3600)/60),bI%60)end return("%d:%02d"):format(math.floor(bI/60),bI%60)
end function z.allBusy()local zh,zi=fq()return zi>0 and zh==0 end function z.aboutToPlace()if not c.running then return false end
local qW=ac()if not(qW and aK(qW))then return false end local zj=fq()return zj>0 end function z.mult(qX,zk,qY)return{(1+qX)*(1+qY),(1+qX+zk)*(1+qY)}end
function z.speedNow()local function ki(zl)return tonumber(J:GetAttribute(zl))or 0 end return z.mult(ki("PetWaxSpeed"),ki("PetLongWax"),ki("PetSocialWax"))
end function z.speedOf(zm)local zn,qZ=z.teams()if not qZ then return nil end for FH,q0 in ipairs(zn)do if q0 .name==zm then
local kj={}for FI,zo in ipairs(q0 .pets or{})do for FJ,q1 in ipairs(qZ.pets or{})do if tostring(q1 .id)==tostring(zo)then kj[#kj+1]=q1 break end end
end local q2=C.caps()local q3,zp=C.stats(kj)return z.mult(math.min(q3 .waxSpeed or 0,q2 .waxSpeed or 0.25),math.min(q3 .longWax or 0,q2 .longWax or 0.3),zp.socialWax or 0)
end end return nil end function z.speedRatio(zq)local q4,kk=z.speedNow(),z.speedOf(zq)if not kk then return{1,1}end
return{q4[1]/kk[1],q4[2]/kk[2]}end function z.glazeSoon()return d.Teams and d.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local kl=q.info()return(kl and type(kl.Caps)=="table")and kl.Caps or C.CAPS
end function C.value(q5,km)local gA=q.info()local cX=gA and gA.Pets[q5]if not(cX and type(cX.boost)=="table")then return nil end
local cl if type(gA.boostValue)=="function"then local zr,zs=pcall(gA.boostValue,q5,(km~=""and km)or nil)cl=zr and tonumber(zs)or nil
end if not cl then cl=cX.boost.value or 0 if km=="Big"then local q6=cl*1.5 cl=C.ROUND[cX.boost.kind]and math.max(cl+1,math.floor(q6+0.5))or q6
end end return cX.boost.kind,cl,cX.boost.every end function C.stats(zt)local cm,kn={},{}for FK,q7 in ipairs(zt)do
local aT,gB,q8=C.value(q7 .name,q7 .variant or"")if aT then if aT:sub(1,6)=="social"then kn[aT]=math.max(kn[aT]or 0,gB)
elseif aT=="waxStir"or aT=="cashGift"then cm[aT]=(cm[aT]or 0)+gB*60/(q8 or 60)elseif aT=="luckyPull"then cm.luckyPull=(cm.luckyPull or 0)+gB/(q8 or 10)
else cm[aT]=(cm[aT]or 0)+gB end end end return cm,kn end function C.glazeGain(zu,gC)local ek,ko,FL={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local zv=ek[1]+ek[2]+ek[3]local zw=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cY={}for gD=1,3 do cY[gD]=ek[gD]+zu*ek[gD]/zv+(gD==1 and zw or 0)end
local kp={cY[1]*(1-gC),cY[2]*(1-gC)+cY[1]*gC,cY[3]+cY[2]*gC}return kp[1]*(ko[1]-1)+kp[2]*(ko[2]-1)+kp[3]*(ko[3]-1)
end function C.score(gE,zx)local kq=C.caps()local gF,gG=C.stats(zx)local function bk(q9)return math.min(gF[q9]or 0,kq[q9]or math.huge)end
local zy=(1+bk("income"))*(1+(gG.socialIncome or 0))*(1+math.min(gF.cashGift or 0,kq.cashGiftPerMinute or 9)/60)
local zz=1+bk("luck")+(gF.luckyPull or 0)+(gG.socialLuck or 0)local q_=zz*(1+bk("newFind"))*(1+bk("rollSpeed"))
local el=math.log(zy)local zA=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local kr=(1+bk("waxSpeed")+bk("longWax"))*(1+(gG.socialWax or 0))
+math.min(gF.waxStir or 0,kq.waxStirPerMinute or 30)/60/zA local zB=1-(1-bk("headStart"))*(1-(gG.socialHeadStart or 0))
if gE=="farm"then return el+0.7*math.log(q_)+0.1*math.log(kr)end if gE=="full"then return el+0.4*math.log(kr)+0.02*math.log(q_)end
if gE=="glaze"then return C.glazeGain(bk("glaze"),bk("glazeUp"))+0.001*el end if gE=="wax"then return-math.log(1-0.5*zB)+0.001*el+0.001*math.log(kr)end
return el end function C.best(ra,cZ,zC,ks)ks=ks or{}local az,em={},{}local function rb(zD)local rc={}for zE,zF in ipairs(zD)do rc[zE]=cZ[zF]end return rc end
local function kt(rd)local ku=C.score(ra,rb(rd))for FM,zG in ipairs(rd)do if ks[cZ[zG].id]then ku=ku+1e-7 end end
return ku end for FN=1,math.min(zC,#cZ)do local gH,kv for kw=1,#cZ do if not em[kw]then az[#az+1]=kw local re=kt(az)
az[#az]=nil if not kv or re>kv+1e-12 then gH,kv=kw,re end end end if not gH then break end em[gH]=true az[#az+1]=gH
end for FO=1,6 do task.wait()local rf,rg=false,kt(az)for kx=1,#az do for ky=1,#cZ do if not em[ky]then local rh=az[kx]
az[kx]=ky local ri=kt(az)if ri>rg+1e-9 then em[rh],em[ky],rg,rf=nil,true,ri,true else az[kx]=rh end end end end
if not rf then break end end local rj={}for zH,zI in ipairs(az)do rj[zH]=tostring(cZ[zI].id)end return rj,C.score(ra,rb(az))
end function C.count(rk,rl,zJ)local en,eo={},0 local rm,rn={},{}for FP,zK in ipairs(rl.arriving or{})do rm[tostring(zK)]=true end
for FQ,c0 in ipairs(rl.pets or{})do rn[tostring(c0 .id)]=true if c0 .name==rk and not rm[tostring(c0 .id)]then
if c0 .variant=="Big"then eo=eo+1 elseif(c0 .variant or"")==""then en[#en+1]=c0 end end end if not zJ then for FR,ep in ipairs(q.recent or{})do
if ep.name==rk and not rn[ep.id]and y()-ep.at<20 then if ep.variant=="Big"then eo=eo+1 else en[#en+1]=ep end end
end end return en,eo end function C.goal(zL)local ro=d.Pets[zL]return ro and tonumber(ro.f)or 0 end function C.wantMore(rp,zM,rq)
local kz=C.goal(rp)if kz<=0 or not rq then return true end local zN,rr=C.count(rp,rq)if rr>=kz then return false end
if zM=="Big"then return true end return#zN<C.need()*(kz-rr)end function C.status(rs,rt)local gI=C.goal(rs)if gI<=0 or not rt then return nil end
local zO,kA=C.count(rs,rt)if kA>=gI then return("Big %d/%d done"):format(kA,gI)end return("%d/%d to fuse, Big %d/%d"):format(math.min(#zO,C.need()),C.need(),kA,gI)
end function C.wear(kB)local kC={}for FS,zP in ipairs(kB)do kC[tostring(zP)]=true end for FT=1,3 do local c1=q.data()
if not c1 then return false end for FV,ru in ipairs(c1 .equipped or{})do if not kC[tostring(ru)]then q.call("unequip",ru)task.wait(0.3)end
end c1=q.data()local rv={}for FW,zQ in ipairs(c1 .equipped or{})do rv[tostring(zQ)]=true end for FX,rw in ipairs(kB)do
if not rv[tostring(rw)]then q.call("equip",rw)task.wait(0.3)end end task.wait(0.4)c1=q.data()local kD,rx=0,true
for FY,zR in ipairs(c1 .equipped or{})do kD=kD+1 if not kC[tostring(zR)]then rx=false end end if rx and kD==#kB then return true end
end return false end function C.saveTeam(ry,rz)if not C.wear(rz)then return false,"could not put the pets on"end
local zS=z.teams()local cn for zT,zU in ipairs(zS)do if zU.name==ry then cn=zT break end end local c2 if cn then
c2=q.call("teamSave",cn)else c2=q.call("teamNew")if type(c2)=="table"and c2 .ok and c2 .index then cn=c2 .index
task.wait(0.3)q.call("teamRename",{index=cn,name=ry})end end task.wait(0.4)local kE=q.data()local rA=kE and kE.teams and cn and kE.teams[cn]
if not rA then return false,"the game did not save it"end local rB={}for FZ,zV in ipairs(rA.pets or{})do rB[tostring(zV)]=true end
for F0,zW in ipairs(rz)do if not rB[tostring(zW)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local zX=q.srv()for F1,zY in ipairs(z.list or{})do if zY.ends-zX<(d.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local eq=q.data()if not eq then return{}end local rC={}for F2,zZ in ipairs(eq.arriving or{})do rC[tostring(zZ)]=true end
local er={}for F3,gJ in ipairs(eq.pets or{})do if not rC[tostring(gJ.id)]then er[#er+1]={id=tostring(gJ.id),name=gJ.name,variant=gJ.variant or""}end
end local rD={}for F4,rE in ipairs(er)do rD[rE.id]=rE end local rF=tonumber(eq.slots)or 3 local kF,rG={},{}for F5,gK in ipairs(C.ROLES)do
local es=d[gK[1]]if es~=""and not rG[es]then rG[es]=true local kG,et,rH={},{},false for F6,rI in ipairs(eq.teams or{})do
if rI.name==es then for F7,z0 in ipairs(rI.pets or{})do local kH=rD[tostring(z0)]if kH then kG[kH.id]=true et[#et+1]=kH else rH=true end
end end end local kI,rJ=C.best(gK[2],er,rF,kG)local rK=C.score(gK[2],et)local rL=#kI==#et for F8,z1 in ipairs(kI)do if not kG[z1]then rL=false end end
if not rL and(rH or#et<math.min(rF,#er)or rJ>rK+1e-4)then kF[#kF+1]={team=es,role=gK[2],ids=kI,gain=rJ-rK}end
end end return kF end function C.rebuild(z2)local rM=C.plan()if#rM==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gL=true local z6,z7=pcall(function()for F9,eu in ipairs(rM)do local z3,z4=C.saveTeam(eu.team,eu.ids)local rN=q.data()
local kJ={}for F_,z5 in ipairs(eu.ids)do for Ga,kK in ipairs(rN and rN.pets or{})do if tostring(kK.id)==z5 then kJ[#kJ+1]=q.nice(kK.name,kK.variant)end
end end if z3 then A(("TEAM %s rebuilt (%s): %s"):format(eu.team,z2 or"pets changed",table.concat(kJ,", ")))else gL=false A(("TEAM %s: %s"):format(eu.team,tostring(z4)))end
end end)z.editing,z.nextTry=false,0 if not z6 then gL=false A("TEAM BUILD ERR "..tostring(z7))end C.builds=C.builds+1
C.buildMsg=gL and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gL end
function C.fuseTick()if not d.AutoFuse or z.editing then return end local gM=q.data()if not gM then return end
local kL=C.need()local kM,gN={},{}for Gb,z8 in ipairs(gM.teams or{})do for Gc,z9 in ipairs(z8 .pets or{})do kM[tostring(z9)]=true end end
for Gd,z_ in ipairs(gM.equipped or{})do gN[tostring(z_)]=true end C.failUntil=C.failUntil or{}for co,Aa in pairs(d.Pets)do
local rO=tonumber(Aa.f)or 0 local kN,Ab=C.count(co,gM,true)if rO>0 and Ab<rO and#kN>=kL and y()>=(C.failUntil[co]or 0)then
table.sort(kN,function(gO,gP)local rP=(gN[tostring(gO.id)]and 4 or 0)+(kM[tostring(gO.id)]and 2 or 0)+(gO.named and 1 or 0)
local rQ=(gN[tostring(gP.id)]and 4 or 0)+(kM[tostring(gP.id)]and 2 or 0)+(gP.named and 1 or 0)if rP~=rQ then return rP<rQ end
return tostring(gO.id)<tostring(gP.id)end)local gQ,kO={},{}for gR=1,kL do gQ[gR]=tostring(kN[gR].id)if gN[gQ[gR]]then kO[#kO+1]=gQ[gR]end
end z.editing,z.editingSince=true,y()for Ge,Ac in ipairs(kO)do q.call("unequip",Ac)task.wait(0.3)end local gS=q.call("fuse",{ids=gQ})
z.editing,z.nextTry=false,0 if type(gS)=="table"and gS.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(kL,q.nice(co),q.nice(co)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(co),os.date("%H:%M"))else C.failUntil[co]=y()+120 A(("fuse %s failed: %s"):format(q.nice(co),type(gS)=="table"and tostring(gS.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not d.AutoBuild or not d.Teams then return end local rR=q.data()
if not rR then return end local cp={}for Gf,Ad in ipairs(rR.pets or{})do cp[#cp+1]=tostring(Ad.id)end table.sort(cp)
cp=table.concat(cp,",")if cp~=C.sig then C.sig,C.dirtyAt=cp,y()end local Ae=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if Ae and not z.editing then local Af=C.rebuild(C.dirtyAt and"pets changed"or"check")if Af then C.dirtyAt,C.lastBuild=nil,y()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(cq)return cq:IsA("ParticleEmitter")or cq:IsA("Trail")or cq:IsA("Beam")or cq:IsA("Fire")or cq:IsA("Smoke")
or cq:IsA("Sparkles")or cq:IsA("Light")end function j.muteOne(aH)if not d.Lite or not aH.Parent then return end
local gT=(aH:IsA("BillboardGui")and j.bb)or(j.isFx(aH)and j.fx)or nil if not gT or gT[aH]~=nil then return end
gT[aH]=aH.Enabled if aH.Enabled then aH.Enabled=false end j.watch[aH]=aH:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aH.Enabled then gT[aH]=true aH.Enabled=false end end)end function j.lite(rS)d.Lite=rS if rS then
task.spawn(function()for Ag,Ah in ipairs(au:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,Ah)
if Ag%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=T(au.DescendantAdded:Connect(function(kP)
if d.Lite and(kP:IsA("BillboardGui")or j.isFx(kP))then j.queue[#j.queue+1]=kP end end))end local kQ=game:GetService("Lighting")
for Gg,ev in ipairs(kQ:GetChildren())do if ev:IsA("PostEffect")and ev.Enabled and j.post[ev]==nil then j.post[ev]=true ev.Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and kQ.GlobalShadows or j.oldShadows kQ.GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and au.Terrain.Decoration or j.oldDeco au.Terrain.Decoration=false end)
else for Gh,Ai in pairs(j.watch)do pcall(function()Ai:Disconnect()end)end for rT,Aj in pairs(j.bb)do pcall(function()if rT.Parent then rT.Enabled=Aj end end)end
for rU,Ak in pairs(j.fx)do pcall(function()if rU.Parent then rU.Enabled=Ak end end)end for rV in pairs(j.post)do pcall(function()if rV.Parent then rV.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local Al=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()Al.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()au.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(rW)d.HideHud=rW local kR=J:FindFirstChildOfClass("PlayerGui")if not kR then return end if rW then
for Gi,ew in ipairs(kR:GetChildren())do if ew:IsA("ScreenGui")and not j.MINE[ew.Name]and ew.Enabled then j.hud[ew]=true ew.Enabled=false end
end if not j.hudConn then j.hudConn=T(kR.ChildAdded:Connect(function(ex)if d.HideHud and ex:IsA("ScreenGui")and not j.MINE[ex.Name]then
task.defer(function()if d.HideHud and ex.Enabled then j.hud[ex]=true ex.Enabled=false end end)end end))end else
for rX in pairs(j.hud)do pcall(function()if rX.Parent then rX.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(kS)d.FpsCap=kS local rY=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not rY then return false end return pcall(rY,kS==0 and 60 or kS)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(an)if an:IsA("BasePart")or an:IsA("Decal")or an:IsA("Texture")then if an.Transparency<1 then j.unseen[an]=an.Transparency an.Transparency=1 end
elseif an:IsA("BillboardGui")or an:IsA("SurfaceGui")or an:IsA("ParticleEmitter")or an:IsA("Beam")or an:IsA("Trail")or an:IsA("Light")or an:IsA("Fire")or an:IsA("Smoke")or an:IsA("Sparkles")then
if an.Enabled then j.unseen[an]=true an.Enabled=false end end end function j.notMine(Am)return d.HideMine or(c.plot and not Am:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(rZ)if d.HideBases then j.bases(false)end d.HideMine=rZ==2 if rZ>0 then j.bases(true)end end
function j.bases(r0)d.HideBases=r0 local kT=au:FindFirstChild("Plots")if not kT then return end if r0 then task.spawn(function()
local kU=0 for Gj,r1 in ipairs(kT:GetChildren())do if r1~=c.plot or d.HideMine then for Gk,An in ipairs(r1:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,An)kU=kU+1 if kU%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=T(kT.DescendantAdded:Connect(function(r2)if d.HideBases and j.notMine(r2)then task.defer(function()pcall(j.hideOne,r2)end)end
end))end else for kV,r3 in pairs(j.unseen)do pcall(function()if not kV.Parent then return end if type(r3)=="number"then kV.Transparency=r3 else kV.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(r4)d.NoRender=r4 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not r4)end)
end j.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
j.calmed={}function j.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local Ao=game:GetService("RunService")
local kW=0 for Gl,Ap in ipairs({"RenderStepped","Heartbeat","Stepped"})do local Aq,r5=pcall(function()return Ao[Ap]end)
local r6,kX=false,nil if Aq and r5 then r6,kX=pcall(getconnections,r5)end if r6 and type(kX)=="table"then for Gm,kY in ipairs(kX)do
local kZ=""pcall(function()local r7=getfenv(kY.Function).script kZ=r7 and r7:GetFullName()or""end)if kZ~=""then
for Gn,Ar in ipairs(j.CALM)do if kZ:find(Ar,1,true)then if pcall(function()kY:Disable()end)then j.calmed[#j.calmed+1]=kY kW=kW+1 end
break end end end end end end if#j.calmed>200 then local k0={}for As=#j.calmed-49,#j.calmed do k0[#k0+1]=j.calmed[As]end j.calmed=k0
end return kW end function j.calm(r8)d.Calm=r8 if r8 then local At=j.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(At))
else for Go,Au in ipairs(j.calmed)do pcall(function()Au:Enable()end)end j.calmed={}end end function j.restoreAll()
pcall(j.unpin)pcall(j.calm,false)if d.HideBases then pcall(j.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(r9)if c.rejoining then return end A("REJOIN this server ("..r9 ..")")
pcall(ft)if c.autoload then pcall(fU,c.autoload)end oo()local Av=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then dK(r9 ..", same server failed")end end)return Av end function j.tick()
local k1=j.queue if d.Lite and k1 and#k1>0 then j.queue={}for Aw,Ax in ipairs(k1)do pcall(j.muteOne,Ax)if Aw%300==0 then task.wait()end end
end local r_=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if r_ then for Gp,Ay in ipairs(r_:GetChildren())do
local sa=Ay:FindFirstChild("SquishyPlaceHolder")local cr=sa and sa:FindFirstChild("TimerGui")if cr and cr:IsA("BillboardGui")then
if j.bb[cr]==nil then pcall(j.muteOne,cr)elseif cr.Enabled then j.bb[cr]=true cr.Enabled=false end end end end
local Az,ey=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Az and type(ey)=="number"then
j.mem=ey j.memPeak=math.max(j.memPeak,ey)if(d.MemLimit or 0)>0 and ey>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(ey,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if y()-(j.noteAt or 0)>1800 then j.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function k2(gU)if type(gU)~="string"then return false end
gU=gU:lower()for Gq,AA in ipairs(c.sellWords)do if gU:find(AA,1,true)then return true end end return false end
local function AB()local sb=ah:FindFirstChild("Remotes")local k3=sb and sb:FindFirstChild("SellSquishy")if not(k3 and k3:IsA("RemoteEvent"))then return false end
if not pcall(function()k3:FireServer()end)then return false end return ap(function()return ac()==nil end,1.5)
end local function AC()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local sc=ao()local sd=sc and sc.HumanoidRootPart.Position local ez,se for Gr,c3 in ipairs((c.plot or au):GetDescendants())do
if c3:IsA("ProximityPrompt")and(k2(c3 .ActionText)or k2(c3 .ObjectText)or k2(c3 .Name))then local sf=nk(c3)local k4=(sf and sd)and(sf-sd).Magnitude or 1e9
if k4<=400 and(not ez or k4<se)then ez,se=c3,k4 end end end c.sellSpot=ez c.noSellSpot=(ez==nil)return ez end
local function sh()local k5=ac()if not k5 then c.holding=false return false end if aK(k5)then return false end
local k6=ak(W(k5))if AB()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..k6)return true end local c4=AC()if c4 then local sj=dx(c4)if sj then b7(sj,c4)local sk=ac()if sk and not aK(sk)then
local AD,AE=dQ(c4,function()return ac()==nil end,function()return c4 .Enabled end)if AD then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(k6,fo(c4),AE))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..k6 .." ("..c.sellFails..")")
return false end local AF={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function AG(c5)local gV=fo(c5):lower()for Gs,AH in ipairs(AF)do if gV:find(AH,1,true)then return 0 end end
local a6,aq=c5 .Name:lower(),0 local function aU(AI,AJ)return AI:find(AJ,1,true)~=nil end if aU(a6,"collect")then aq=aq+60 end
if aU(a6,"cash")or aU(a6,"money")then aq=aq+45 end if aU(a6,"income")or aU(a6,"claim")then aq=aq+35 end if aU(a6,"coin")or aU(a6,"earn")or aU(a6,"green")then aq=aq+20 end
if a6=="pad"or a6=="touch"then aq=aq+25 end if aq==0 and(aU(gV,"collect")or aU(gV,"cash")or aU(gV,"money"))then aq=25 end
if aq==0 then return 0 end local eA=c5 .Color if eA.G>0.5 and eA.G>eA.R*1.4 and eA.G>eA.B*1.4 then aq=aq+15 end
if math.min(c5 .Size.X,c5 .Size.Y,c5 .Size.Z)<2 then aq=aq+5 end return aq end local function AK()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local gW,eB,k7={},nil,29 for Gt,gX in ipairs(c.plot:GetDescendants())do
if gX:IsA("BasePart")then local gY=AG(gX)if gY>0 then gW[#gW+1]={s=gY,p=gX}if gY>k7 then eB,k7=gX,gY end end end
end table.sort(gW,function(AL,AM)return AL.s>AM.s end)c.padCands,c.padPart=gW,eB if eB then A("collect pad: "..fo(eB).." (score "..k7 ..")")end
return eB end local k8="SAB_pad_v1.txt"local function AN(AO)if type(writefile)=="function"then pcall(writefile,k8,table.concat({AO:GetComponents()},","))end
end local function AP()if type(isfile)~="function"or type(readfile)~="function"then return nil end local AQ,sl=pcall(function()if isfile(k8)then return readfile(k8)end end)
if not AQ or type(sl)~="string"then return nil end local gZ={}for AS in sl:gmatch("[^,]+")do gZ[#gZ+1]=tonumber(AS)end
if#gZ==12 then return CFrame.new(unpack(gZ))end end local function AT(k9,g0,AU)local AV=cM(k9)local k_=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aV=(k_ and k_:IsA("BasePart"))and(k_.Position-g0)or Vector3 .new(1,0,0)aV=Vector3 .new(aV.X,0,aV.Z)if aV.Magnitude<0.05 then aV=Vector3 .new(1,0,0)end
aV=aV.Unit for AW=0,7 do local g1=AW*math.pi/4 local AX=Vector3 .new(aV.X*math.cos(g1)-aV.Z*math.sin(g1),0,aV.X*math.sin(g1)+aV.Z*math.cos(g1))
local g2=g0+AX*(AU+5)local la=f2(g2 .X,g0 .Y,g2 .Z)if la and math.abs(la.Y-g0 .Y)<8 then aD(k9,Vector3 .new(g2 .X,la.Y+AV,g2 .Z))
if ja(k9,0.7)then return true end end end return false end local function AY()c.lastCollect=y()local eC=ao()if not eC then return end
local sm,AZ=eC.HumanoidRootPart,cM(eC)local eD,sn,eE,lb=nil,4,nil,"?"local lc=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and lc and lc:IsA("BasePart")then eD,lb=(lc.CFrame*c.manualPad).Position,"manual pad"else local bl=AK()
if bl then eD=Vector3 .new(bl.Position.X,bl.Position.Y+bl.Size.Y/2+AZ,bl.Position.Z)sn,eE,lb=math.max(bl.Size.X,bl.Size.Z)/2,bl,bl.Name
end end if not eD then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local ld=a_()aD(eC,eD)
if eE and type(firetouchinterest)=="function"then pcall(firetouchinterest,sm,eE,0)end af(d.PadDwell)if eE and type(firetouchinterest)=="function"then pcall(firetouchinterest,sm,eE,1)end
af(0.5)c.collected=c.collected+1 local le=a_()A(("COLLECTED (%s) %s"):format(lb,(ld and le and le>ld)and("+$"..aL(le-ld))or"no cash change seen"))
AT(eC,eD,sn)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local so=ah:FindFirstChild("Modules")if not so then return false end local function lf(A0)local sp=so:FindFirstChild(A0)
if not sp then return nil end local A1,sq=pcall(require,sp)return(A1 and type(sq)=="table")and sq or nil end o.si,o.arm,o.ci=lf("SquishyInfo"),lf("AutoRollRules"),lf("CrateInfo")
o.modAt=y()if not o.si then return false end local lg={}if o.arm and type(o.arm.tierOf)=="table"then for lh in pairs(o.arm.tierOf)do
local g3=o.si[lh]if type(g3)=="table"and g3 .rarity~="Limited"and not g3 .incomeType and not g3 .hiddenAfter then lg[W(lh)]=lh end
end end o.roll=lg local g4={}for A2,A3 in pairs(lg)do local eF=o.si[A3]if type(eF)=="table"and type(eF.income)=="number"and not eF.incomeType then
g4[#g4+1]={k=A2,inc=eF.income,pr=tonumber(eF.price)or 0}end end table.sort(g4,function(li,lj)if li.inc~=lj.inc then return li.inc>lj.inc end return li.pr>lj.pr end)
o.order=g4 local g5,lk,ll local A4=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for A5,lm in pairs(A4)do
local ln=type(lm)=="table"and tonumber(lm.price)if ln and(not lk or ln>lk)then g5,lk,ll=A5,ln,lm.title end end
o.bestCrate,o.bestCrateName=g5 and L.key(g5),g5 o.bestCrateTitle=ll and L.key(ll)or nil return true end function o.rank(A6)
local A7,A8=pcall(function()return o.arm.rankOf(A6)end)return(A7 and tonumber(A8))or 0 end function o.loadDisc(sr)
if type(sr)~="table"then return end local ss={}for A9,A_ in pairs(sr)do if A_ then ss[W(tostring(A9))]=true end end
o.disc,o.discAt=ss,y()end function o.fetch()o.discAt=y()local su=ah:FindFirstChild("Remotes")local sv=su and su:FindFirstChild("GetSquishiesDiscovered")
if not sv then return end local Ba,Bb=pcall(function()return sv:InvokeServer()end)if Ba then o.loadDisc(Bb)end
end function o.scanWax()local lo={}local sx=c.plot and c.plot:FindFirstChild("WaxStations")if sx then for Gu,sy in ipairs(sx:GetChildren())do
local sz=sy:FindFirstChild("SquishyPlaceHolder")if sz and sy:GetAttribute("HasSquishy")then for Gv,sA in ipairs(sz:GetChildren())do if sA:IsA("Model")then lo[W(sA.Name)]=true end end
end end end for sB,Bc in pairs(o.placedAt)do if y()-Bc<20 then lo[sB]=true else o.placedAt[sB]=nil end end o.waxing=lo
end function o.compute()local sC,lp,lq={},0,0 if o.disc then for lr in pairs(o.roll or{})do if not o.disc[lr]then
if o.waxing[lr]then lq=lq+1 else sC[lr],lp=true,lp+1 end end end end o.need,o.nNeed,o.nWax=sC,lp,lq local sD,ls={},d.Best or 0
local lt=(ls==4)and o.stackMin or nil for Bd,sE in ipairs(o.order)do if(lt and sE.inc>lt)or(not lt and Bd<=(ls==4 and 1 or ls))then sD[sE.k]=true end
end o.best=sD end function o.readStack()o.stackAt=y()local sF=ah:FindFirstChild("Remotes")local sG=sF and sF:FindFirstChild("EditStack")
if not sG then return end local Be,c6=pcall(function()return sG:InvokeServer("State",nil)end)if not(Be and type(c6)=="table"and type(c6 .state)=="table"and type(c6 .state.entries)=="table")then return end
local g6 for Gw,sH in ipairs(c6 .state.entries)do local eG=type(sH)=="table"and o.si and o.si[tostring(sH.name)]
if type(eG)=="table"and type(eG.income)=="number"and not eG.incomeType and(not g6 or eG.income<g6)then g6=eG.income end
end o.stackMin=g6 o.stackFull=#c6 .state.entries>=(tonumber(c6 .state.capacity)or 100)end function o.want(lu)
if(d.Best or 0)>0 and(next(o.best)or(d.Best==4 and o.stackMin))then if o.best[lu]then return true end elseif d.Targets[lu]then
return true end return d.AutoIndex==true and o.need[lu]==true end function o.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(o.best)~=nil)or(d.AutoIndex and next(o.need)~=nil)
or d.Best==4 end function o.placed(Bf)local eH=W(Bf)o.placedAt[eH],o.waxing[eH]=y(),true if o.need[eH]then o.need[eH],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eH)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eI,eJ={},{}for Bg,Bh in pairs(o.roll or{})do if o.want(Bg)then eI[Bh]=true end end
for sI,lv in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(sI)or(type(lv)=="table"and type(lv.title)=="string"and L.wanted(lv.title))then eJ[sI]=true end
end if not next(eI)and not next(eJ)then return nil end if o.arm and type(o.arm.encode)=="function"then local Bi,sJ=pcall(o.arm.encode,{rarities={},butters=eI,crates=eJ,index=false})
if Bi and type(sJ)=="string"then return sJ end end local function sK(Bj)local g7={}for Bk in pairs(Bj)do g7[#g7+1]=Bk end table.sort(g7)return table.concat(g7,",")end
local eK="adv:"if next(eI)then eK=eK..";butters:"..sK(eI)end if next(eJ)then eK=eK..";crates:"..sK(eJ)end return eK
end function o.canon(Bl)local g8={}for sL in tostring(Bl or""):gmatch("[^;]+")do local lw,sM=sL:match("^(%a+):(.*)$")
if not lw then lw,sM="r",sL:gsub("^adv:","")end for Bm in sM:gmatch("[^,]+")do g8[#g8+1]=lw.."="..Bm end end table.sort(g8)
return table.concat(g8,"|")end function o.sync(Bn)if J:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local cs=o.rulesNow()if not cs or#cs>1900 then return end if o.canon(J:GetAttribute("AutoRollRules"))==o.canon(cs)then o.fails=0 return end
if not Bn and y()-o.sentAt<4 then return end local sN=ah:FindFirstChild("Remotes")local sO=sN and sN:FindFirstChild("AutoRollAction")
if not sO then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()sO:FireServer("Rules",cs)end)D.replaying=false d.ARrules=cs
local g9,g_=0,0 for Gx in(cs:match("butters:([^;]*)")or""):gmatch("[^,]+")do g9=g9+1 end for Gy in(cs:match("crates:([^;]*)")or""):gmatch("[^,]+")do g_=g_+1 end
local sP=g9 .."/"..g_ if o.told~=sP then o.told=sP A(("auto roll now stops on %d butters and %d crates"):format(g9,g_))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if d.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aN={}if d.AutoIndex then aN[#aN+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if d.Best==4 then local eL=0 for Gz in pairs(o.best)do eL=eL+1 end
aN[#aN+1]=eL==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eL,eL==1 and""or"s")
elseif(d.Best or 0)>0 and o.order[1]then aN[#aN+1]="best: "..ak(o.order[1].k)end if d.BestCrate and o.bestCrateName then aN[#aN+1]="crate: "..o.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aN[#aN+1]="shower: "..O.got end o.msg=#aN>0 and table.concat(aN," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(Bo)o.feed[#o.feed+1]=os.date("%H:%M ")..Bo if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(sQ,av,ha)if sQ~="Effect"then o.feedAdd(tostring(sQ)..(av~=nil and(": "..tostring(av):sub(1,80))or""))
return end if av~="ShowerTaken"and av~="GoalPoint"then o.feedAdd(tostring(av))end if av=="Shower"then O.add(ha)return end
if av=="ShowerTaken"then O.gone(ha)return end if av=="ShowerClear"then O.drops={}return end if av=="WaxGlow"then
local lx=type(ha)=="table"and tonumber(ha.SnapAt)if lx then o.snapAt=lx A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lx-q.srv()),(d.SnapGlaze~=false and d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end av=tostring(av)b3("Admin "..av)if av~="GoalPoint"and y()-(o.heard[av]or-100)>30 then o.heard[av]=y()
A("ADMIN: "..av)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(ly)if type(ly)~="table"or type(ly.Pieces)~="table"then return end
for GA,aW in pairs(ly.Pieces)do if type(aW)=="table"and aW.Id~=nil and aW.Position~=nil then O.drops[aW.Id]={id=aW.Id,butter=tostring(aW.Butter or"?"),rar=tostring(aW.Rarity or"?"),star=aW.Star==true,
pos=aW.Position,opens=tonumber(aW.OpensAt)or 0,ends=tonumber(aW.ExpiresAt)or 0}end end end function O.gone(eM)
if type(eM)~="table"or eM.Id==nil then return end O.drops[eM.Id]=nil if tonumber(eM.UserId)==q.uid then O.mine=eM.Id end
end function O.pick()local lz=q.srv()local lA,sR for sS,ct in pairs(O.drops)do if lz>=ct.ends-0.3 then O.drops[sS]=nil
elseif lz>=ct.opens-0.2 and(O.tried[sS]or 0)<3 then local sT=(aK(ct.butter)and 1e6 or 0)+(ct.star and 1e5 or 0)+o.rank(ct.rar)*100-(ct.ends-lz)
if not lA or sT>sR then lA,sR=ct,sT end end end return lA end function O.due()return d.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aO,lB=O.pick(),ao()if not(aO and lB)then return end O.tried[aO.id]=(O.tried[aO.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aD(lB,aO.pos+Vector3 .new(0,cM(lB)+0.5,0))ap(function()return O.mine==aO.id or ac()~=nil or not O.drops[aO.id]end,1.5)
if O.mine==aO.id or ac()then O.got,O.drops[aO.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aO.butter)),aO.rar,aO.star and" (star)"or""))
elseif not O.drops[aO.id]then O.miss=O.miss+1 end end local eN local function sU()if c.capHit then if d.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eN(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ao()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bv(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local lC,sV=fq()
local hb=ac()if hb then local c7=ak(W(hb))if not aK(hb)then local lD=(V.gift and W(V.gift)==W(hb)and y()-V.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c7,lD),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c7,lD),"bad"end return"sell",("selling %s (%s)"):format(c7,lD),"warn"
end if lC<1 then return nil,("holding %s - 0 free stations"):format(c7),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c7),"wait"end
return"place",("waxing %s (%d free)"):format(c7,lC),"ok"end c.holding=false if d.Crates and not e.waiting and y()-(e.scanAt or 0)>1 and y()>(e.quietUntil or 0)then
e.scanAt=y()local lE=c.plot:FindFirstChild("CrateStand")if lE then for GB,eO in ipairs(lE:GetDescendants())do
if eO:IsA("ProximityPrompt")and eO.Enabled and jr(eO)then local bm=eO.ObjectText if bm==""then bm=cF(lE,"TitleLabel")or""end
if bm~=""and L.wanted(bm)then local Bp=fm(bm):gsub("crate$","")local sW for sX in pairs(ad.members)do if fm(sX)==Bp then sW=sX end end
e.waiting,e.at,e.title,e.prompt=true,y(),bm,eO e.data={name=(bm:gsub("%s","")),rarity=sW,title=bm}A(bm.." found waiting on your stand")
end break end end end end local sY=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and sY then
local aX=e.title if y()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aX),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aX.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aX),"bad"end if y()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aX),"bad"
end if e.byYou and y()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aX,math.ceil(60-(y()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aX),"ok"end if e.at and y()-e.at>e.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aX,math.floor(e.GIVEUP/60)),"bad"
end if e.summonFails>=3 then if y()-e.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aX,
math.ceil(45-(y()-e.lastFail))),"bad"end e.summonFails,e.nearFails,e.prompt=0,0,nil A("trying the "..aX.." again")
end if y()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aX),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aX,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not sY then local sZ=e.title..tostring(e.rolledAt)if e.told~=sZ then e.told=sZ A(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and y()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if lC<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(sV,sV),"wait"
end local lF=ny()if not lF then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c8=b2()
if c8 and oY(c8 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(c8 .name),"idle"end
if y()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c8 .name),"bad"end if not pg()then return nil,("%s rolled - waiting for it to land on the stand"):format(c8 .name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c8 .name),"ok"end local bJ=i9()if bJ.state~="match"then
c.matchSince=nil if bJ.state=="skip"and not lF.Enabled then return nil,bJ.text.." (sold out)","idle"end return nil,bJ.text,bJ.level
end if not lF.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eP=y()if eP<c.noCashUntil then
local s0,Bq=dM()if s0 then return nil,("cash short: have $%s, price ~$%s"):format(aL(s0),aL(Bq)),"bad"end return nil,(dM()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aL(a_()),math.ceil(c.noCashUntil-eP)),dM()and"bad"or"wait"end if eP-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eP local s1=eP-c.matchSince if s1<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bJ.shown,s1),"ok"end
return"buy",("buying %s via %s"):format(bJ.shown,bJ.src),"ok"end j.DEPTH=11 function j.pinTick()local s2=j.hold
if not s2 then return end local lG=J.Character local lH=lG and lG:FindFirstChild("HumanoidRootPart")if not lH then return end
lH.CFrame=s2 lH.AssemblyLinearVelocity=Vector3 .new(0,0,0)for GC,hc in ipairs(lG:GetChildren())do if hc:IsA("BasePart")and hc.CanCollide then j.noclip[hc]=true hc.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(Br,s3)j.hold=Br if s3 then j.surface=s3 end end function j.unpin(Bs)
if not j.hold then return end j.hold=nil for s4 in pairs(j.noclip)do pcall(function()if s4 .Parent then s4 .CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local s5=ao()if s5 and j.surface and not Bs then aD(s5,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bn,s6=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ao()
if not(bn and bn:IsA("BasePart")and s6)then return nil end local s7=nn()or bn.Position local hd=Vector3 .new(s7 .X-bn.Position.X,0,s7 .Z-bn.Position.Z)
hd=hd.Magnitude>0.1 and hd.Unit or Vector3 .new(0,0,1)local he=bn.Position+hd*6 local s8=f2(he.X,bn.Position.Y,he.Z,{bn})
return CFrame.new(he.X,(s8 and s8 .Y or bn.Position.Y)+cM(s6),he.Z)end function j.ground(Bt,s9,Bu)local lI,lJ={J.Character},nil
for GD=1,12 do local lK=RaycastParams.new()lK.FilterType=Enum.RaycastFilterType.Exclude lK.FilterDescendantsInstances=lI
local hf=au:Raycast(Vector3 .new(Bt,s9,Bu),Vector3 .new(0,-2000,0),lK)if not hf then break end lJ,s9=hf,hf.Position.Y-0.05
lI[#lI+1]=hf.Instance end return lJ and lJ.Position.Y end function j.parkHome()local lL=j.home()if not lL then return false end
local c9=lL.Position local Bv=j.ground(c9 .X,c9 .Y+300,c9 .Z)or(c9 .Y-3)j.pin(CFrame.new(c9 .X,Bv-8,c9 .Z),lL)
return true end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}
function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end function j.setGhost(hg)d.Ghost,d.GhostHelps=hg==2,hg==1
if hg<2 then task.spawn(function()while c.busy do af(0.1)end if j.ghostMode()<2 and j.hold and not E.home then pcall(j.unpin)end
end)end j.paintGhost()A("ghost: "..j.GHOST[hg][1]:sub(8):lower())end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end
function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end local Bw=ao()if not Bw or K.seat()then return end
j.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0 function K.seat()local s_=J.Character
local ta=s_ and s_:FindFirstChildOfClass("Humanoid")local lM=ta and ta.SeatPart return(lM and lM.Name=="LogSeat")and lM or nil
end function K.due()if not(d.Campfire and c.running)or y()<K.nextAt then return false end local Bx=au:FindFirstChild("NightSeats")
if not Bx then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"return false
end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or y()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(K.msg)return false end end return true end function K.sit()local tb,hh=au:FindFirstChild("NightSeats"),ao()
if not tb or not hh then return end local tc,c_=hh.HumanoidRootPart.Position,{}for GE,hi in ipairs(tb:GetChildren())do
local td=hi:IsA("Seat")and hi.Occupant==nil and hi:FindFirstChildOfClass("ProximityPrompt")if td then c_[#c_+1]={st=hi,p=td}end
end if#c_==0 then K.nextAt,K.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(c_,function(By,Bz)return(By.st.Position-tc).Magnitude<(Bz.st.Position-tc).Magnitude end)
local BA,BB=c_[1].st,c_[1].p j.unpin(true)local da=BA.CFrame aD(hh,da.Position+da.LookVector*2+Vector3 .new(0,2.5,0),da.Position)
af(0.25)local BC=dQ(BB,function()return K.seat()~=nil end)if not BC then aD(hh,da.Position+Vector3 .new(0,2,0),da.Position+da.LookVector)
ap(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=y()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then A(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local lN=ah:FindFirstChild("Remotes")if not lN then return end local eQ,lO,db=0,0,{}
local BD,te=pcall(function()return lN.ClanRequest:InvokeServer("state")end)local tf=BD and type(te)=="table"and te.tasks
for GF,bK in ipairs(tf and tf.list or{})do if not bK.done and bK.kind=="pull"then eQ=math.max(eQ,(bK.goal or 0)-(bK.progress or 0))end
if not bK.done then db[#db+1]=("%s %d/%d"):format(tostring(bK.text),bK.progress or 0,bK.goal or 0)end end F.events={}
for GG,dc in ipairs(lN:GetChildren())do if dc:IsA("RemoteFunction")and dc.Name:match("^%u%a+Action$")and dc.Name~="CrateAction"and dc.Name~="AutoRollAction"then
local BE,eR=pcall(function()return dc:InvokeServer("state")end)if BE and type(eR)=="table"and eR.live==true and type(eR.quests)=="table"then
F.events[#F.events+1]={r=dc,st=eR}for GH,aP in ipairs(eR.quests)do if not aP.done and aP.kind=="pull"then eQ=math.max(eQ,(aP.goal or 0)-(aP.progress or 0))end
if not aP.done and aP.kind=="collect"then lO=math.max(lO,(aP.goal or 0)-(aP.progress or 0))end if not aP.done then db[#db+1]=("%s %d/%d"):format(tostring(aP.text),aP.progress or 0,aP.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eQ,lO F.msg=#db>0 and("open: "..table.concat(db,", "))or"all quests done for today"
end function F.claim()for GI,eS in ipairs(F.events)do local th=eS.r.Name:gsub("Action$","")for GJ,dd in ipairs(eS.st.quests)do
if dd.done and not dd.claimed then local BF,ti=pcall(function()return eS.r:InvokeServer("claimQuest",dd.id)end)
if BF and not(type(ti)=="table"and ti.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(th,tostring(dd.text),tostring(dd.points or dd.treats or"?")))
end af(0.4)end end if eS.st.bonusReady==true then local BG=pcall(function()return eS.r:InvokeServer("claimBonus")end)
if BG then A(("CLAIMED %s daily quest bonus"):format(th))end af(0.4)end end end function F.tick()if not(d.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return d.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local tj=c.plot and c.plot:FindFirstChild("Lever")
local lP=tj and tj:FindFirstChild("Wheel")return lP and lP:FindFirstChildWhichIsA("ProximityPrompt"),lP end function F.resume(BH)
F.arPaused=false if F.arWas then F.arWas=false d.AutoRoll=true task.spawn(D.apply,BH)end end function F.pull()
local hj,lQ=F.lever()if not hj or not lQ or not lQ:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hj.Enabled then F.nextAt=y()+1 return end b7(lQ,hj)F.asked=nil oN(hj)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
af(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bL,BI)local lR=bL:GetAttribute("PourOwner")
if type(lR)~="number"or lR==q.uid or not bL:GetAttribute("HasSquishy")then return false end if bL:GetAttribute("PourLong")~=true or bL:GetAttribute("PourFull")==true then return false end
local lS=bL:GetAttribute("PourId")if lS==nil or E.skip[lS]then return false end local tk,lT,BJ=bL:GetAttribute("Helpers"),0,tostring(q.uid)
if type(tk)=="string"then for BK in tk:gmatch("[^,%s]+")do lT=lT+1 if BK==BJ then return false end end end if lT>=6 then return false end
local hk=z.left(bL)if not hk then local tl=tonumber(bL:GetAttribute("PourEnd"))hk=tl and(tl-BI)end if not hk or hk<=75 then return false end
local lU=game:GetService("Players"):GetPlayerByUserId(lR)if not lU or lU:GetAttribute("WaxHelpOff")==true then return false end
return true,lU,lS end function E.list()local lV,BL={},q.srv()local tm=au:FindFirstChild("Plots")for GK,tn in ipairs(tm and tm:GetChildren()or{})do
local to=tn~=c.plot and tn:FindFirstChild("WaxStations")for GL,lW in ipairs(to and to:GetChildren()or{})do local BM,BN,BO=E.can(lW,BL)
local lX=BM and lW:FindFirstChild("SquishyPlaceHolder")if lX and lX:IsA("BasePart")then lV[#lV+1]={st=lW,p=BN,id=BO,part=lX}end
end end return lV end function E.due()return d.Help and c.running and y()>=E.nextAt end function E.skipIt(tp,tq)
E.skip[tp],E.skipN=tq,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[tp]=tq},1,{}end end function E.goHome()
local hl,bM=ao(),E.home E.home=nil if not(hl and bM)then return end if d.Ghost and not K.seat()then j.unpin(true)
if not j.parkHome()then pcall(aD,hl,bM.Position,bM.Position+bM.LookVector)end elseif j.hold or(hl.HumanoidRootPart.Position-bM.Position).Magnitude>20 then
j.unpin(true)pcall(aD,hl,bM.Position,bM.Position+bM.LookVector)end end function E.step()local lY,eT=E.list(),ao()
if#lY==0 or not eT then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local tr=eT.HumanoidRootPart local ts=tr.Position table.sort(lY,function(BP,BQ)return(BP.part.Position-ts).Magnitude<(BQ.part.Position-ts).Magnitude end)
local aY=lY[1]E.home=E.home or(j.hold and j.surface)or tr.CFrame local bN=aY.part local eU=(bN.Position+aY.st:GetPivot().Position)/2
local hm=E.tries[aY.id]or 0 if(d.Ghost or d.GhostHelps)and hm==0 and not K.seat()then j.pin(bN.CFrame,E.home)
else j.unpin(true)local lZ=hm==0 and f2(eU.X,bN.Position.Y,eU.Z,{bN})if lZ and math.abs(lZ.Y-bN.Position.Y)<8 then
aD(eT,Vector3 .new(eU.X,lZ.Y+cM(eT),eU.Z),bN.Position)else aD(eT,bN.Position+Vector3 .new(0,bN.Size.Y/2+3,0),eU)
end end af(0.3)local eV=ah:FindFirstChild("Remotes")eV=eV and eV:FindFirstChild("ClanRequest")if not eV then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hn,bo=pcall(function()return eV:InvokeServer("help",aY.st:GetAttribute("PourOwner"),tonumber(aY.st.Name))end)
if hn and type(bo)=="table"and bo.ok then E.n,E.fails=E.n+1,0 E.skipIt(aY.id,"helped")A(("HELPED %s's wax (station %s)"):format(aY.p.DisplayName,aY.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hn and type(bo)=="table"and tostring(bo.reason or""):lower():find("walk up",1,true)and hm<2 then
E.tries[aY.id]=hm+1 E.nextAt=y()+0.3 elseif hn and type(bo)=="table"and tostring(bo.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local tt=(hn and type(bo)=="table"and tostring(bo.reason or"refused"))or("error: "..tostring(bo))
E.skipIt(aY.id,tt)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aY.p.DisplayName,tt))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bp)if not d.HelpGuild or type(bp)~="table"or bp.p~="help"or bp.mine or bp.u==q.uid or not bp.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eW=ah:FindFirstChild("Remotes")
eW=eW and eW:FindFirstChild("ClanRequest")if not eW then return end local tu,eX=pcall(function()return eW:InvokeServer("callHelp",bp.u)end)
local tv=tostring(bp.n or bp.un or bp.u)if tu and type(eX)=="table"and eX.ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(tv))
else A(("guild call from %s: %s"):format(tv,(tu and type(eX)=="table"and tostring(eX.reason or"refused"))or tostring(eX)))
end end)end local function ar(BR,tw,...)if c.busy then return end c.busy,c.busyText=true,BR if j.hold and tw~=E.step then pcall(j.unpin)end
local BS,tx=pcall(tw,...)c.busy,c.busyText=false,""if not BS and tx~=ik then A("ERR "..tostring(tx))end end local function BT()
local aQ,BU,BV=sU()c.reason,c.level=BU,BV if aQ=="place"then ar("waxing...",z.place)elseif aQ=="crate"then ar("opening crate...",d1,true)
elseif aQ=="cratesmart"then ar("opening crate...",e.smart)elseif aQ=="cratewin"then ar("opening the crate window...",jt)
elseif aQ=="nocrate"then ar("discarding crate...",d1,false)elseif aQ=="cratedrop"then ar("discarding a crate that would not open...",e.drop)
elseif aQ=="sell"then ar("selling...",sh)elseif aQ=="buy"then ar("buying...",oQ,false)elseif not aQ and not c.matchSince and O.due()then
ar("grabbing a butter from the admin shower...",O.grab)elseif not aQ and not c.matchSince and K.due()then ar("sitting at the campfire...",K.sit)
elseif not aQ and not c.matchSince and F.pullDue()and not ac()and not(b2()and aK(b2().name))then ar("pulling the lever for a quest...",F.pull)
elseif d.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ar("collecting money...",AY)elseif not aQ and not c.matchSince and E.due()then ar("helping a wax...",E.step)elseif E.home and not d.Help then
ar("coming back...",E.goHome)elseif not c.busy then j.parkTick()end end function eN(ho,BW)if ho==c.running then return end
c.running=ho if not BW then d.AutoStart=ho end if ho then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bv()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bO=fO(am.auto)if type(bO)=="string"then bO=bO:gsub("%s+$","")
if bO~=""then c.autoload=bO local BX=oi(bO)A(BX and("loaded config "..bO)or("config "..bO.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local BY={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local l0={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local ty,tz,tA,tB=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if ty and tz and tA and tB then ae.x,ae.b,ae.m,ae.r=ty,tz,tA,tB end end)pcall(function()local tC=Enum.Font.RobotoMono if tC then ae.mono=tC end end)
local function H(BZ,B0,B1)local B2,l1=pcall(Instance.new,BZ)if not B2 then c.uiErrs=c.uiErrs+1 return nil end
for B3,B4 in pairs(B0)do if not pcall(function()l1[B3]=B4 end)then c.uiErrs=c.uiErrs+1 end end l1 .Parent=B1 return l1
end local function ab(B5,B6)H("UICorner",{CornerRadius=UDim.new(0,B6 or 8)},B5)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hp,l2)if hp and a.shown[hp]~=l2 then a.shown[hp]=l2 hp.Text=l2 end
end function a.stroke(B7,B8,B9)return H("UIStroke",{Color=B8 or l.line,Thickness=1,Transparency=B9 or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},B7)
end function a.grad(B_,Ca,Cb,Cc)local Cd,tD=pcall(function()return ColorSequence.new(Ca,Cb)end)if Cd and tD then return H("UIGradient",{Color=tD,Rotation=Cc or 0},B_)end
end function a.pad(Ce,tE,tF,Cf,Cg)H("UIPadding",{PaddingLeft=UDim.new(0,tE or 0),PaddingTop=UDim.new(0,tF or 0),
PaddingRight=UDim.new(0,Cf or tE or 0),PaddingBottom=UDim.new(0,Cg or tF or 0)},Ce)end function a.list(Ch,Ci,Cj)
return H("UIListLayout",{Padding=UDim.new(0,Ci or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Cj and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Ch)
end function a.ink(l3)local Ck,Cl=pcall(function()return 0.299*l3 .R+0.587*l3 .G+0.114*l3 .B end)return(Ck and Cl>0.55)and l.ink or l.text
end function a.nextIn(tG)local tH=(a.ord[tG]or 0)+1 a.ord[tG]=tH return tH end local l4=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local tI=l4:FindFirstChild("SABFarmGui")if tI then tI:Destroy()end local l5=H("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},l4)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local hq=au.CurrentCamera.ViewportSize if hq.X>100 and hq.Y>100 then Q.w=math.clamp(math.floor(hq.X*0.48),320,400)
Q.h=math.clamp(math.floor(hq.Y*0.86),250,360)end end)a.root=H("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},l5)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local tJ=UDim2 .new(1,0,1,0)
local function GM(tK,tL)return UDim2 .new(tK,0,0,0),UDim2 .new(tL,(tK+tL>0.99)and 0 or-4,1,0)end local function ai(Cm,Cn,eY,Co,Cp,Cq)
local l6=H("TextButton",{Text=Cn,Position=Cp,Size=Cq,BackgroundColor3=eY,BorderSizePixel=0,Font=ae.b,TextSize=Co,TextColor3=a.ink(eY),AutoButtonColor=true},Cm)
ab(l6,8)if eY==l.panel2 or eY==l.raise or eY==l.panel then a.stroke(l6,l.line,0.4)end return l6 end local function hr(Cr,Cs,Ct,Cu,Cv)
local hs=H("TextBox",{Text=Cs,PlaceholderText=Ct,Position=Cu,Size=Cv,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Cr)ab(hs,8)a.stroke(hs,l.line,0)a.pad(hs,9,0,6,0)
return hs end local ht=au.CurrentCamera local function Cw()local Cx,hu=pcall(function()return ht and ht.ViewportSize end)
if Cx and hu and hu.X>50 and hu.Y>50 then return hu end end local function bP(eZ)local l7=Cw()if not(l7 and eZ and eZ.Parent)then return end
local Cy=pcall(function()local hv,tM=eZ.AbsolutePosition,eZ.AbsoluteSize local l8=70 local tN=math.clamp(hv.X,l8-tM.X,l7 .X-l8)
local tO=math.clamp(hv.Y,0,l7 .Y-math.min(tM.Y,l8))if math.abs(tN-hv.X)>0.5 or math.abs(tO-hv.Y)>0.5 then eZ.Position=UDim2 .new(0,math.floor(tN),0,math.floor(tO))
end end)return Cy end local function hw(Cz)local CA,l9=pcall(function()return Cz.AbsolutePosition end)if CA and l9 then return{math.floor(l9 .X),math.floor(l9 .Y)}end
end local de={}c.dragMoved={}local function tP(e0,tQ,l_)T(e0 .InputBegan:Connect(function(df)if df.UserInputType~=Enum.UserInputType.MouseButton1 and df.UserInputType~=Enum.UserInputType.Touch then return end
local ma={start=df.Position,from=tQ.Position,moved=0,target=tQ,input=df,onDrop=l_}de[e0],c.dragMoved[e0]=ma,0
local mb mb=df.Changed:Connect(function()if df.UserInputState==Enum.UserInputState.End and de[e0]==ma then de[e0]=nil
if mb then mb:Disconnect()end if l_ then l_(ma.moved)end end end)end))end T(m7 .InputChanged:Connect(function(hx)
if hx.UserInputType~=Enum.UserInputType.MouseMovement and hx.UserInputType~=Enum.UserInputType.Touch then return end
for CB,a7 in pairs(de)do local mc=a7 .target if mc and mc.Parent then local tR,tS=hx.Position.X-a7 .start.X,hx.Position.Y-a7 .start.Y
a7 .moved=math.max(a7 .moved,math.abs(tR)+math.abs(tS))c.dragMoved[CB]=a7 .moved mc.Position=UDim2 .new(a7 .from.X.Scale,a7 .from.X.Offset+tR,a7 .from.Y.Scale,a7 .from.Y.Offset+tS)
end end end))T(m7 .InputEnded:Connect(function(hy)if hy.UserInputType~=Enum.UserInputType.MouseButton1 and hy.UserInputType~=Enum.UserInputType.Touch then return end
for CC,hz in pairs(de)do if hz.input==hy or hy.UserInputType==Enum.UserInputType.MouseButton1 then de[CC]=nil
if hz.onDrop then hz.onDrop(hz.moved)end end end end))local function P(CD,CE,CG,CH,CI,CJ,CK)return H("TextLabel",{Text=CE,Position=CJ or UDim2 .new(0,0,0,0),Size=CK or tJ,BackgroundTransparency=1,
Font=CI and ae.b or ae.m,TextSize=CG,TextColor3=CH,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},CD)
end function a.row(tT,CL)return H("Frame",{Size=UDim2 .new(1,0,0,CL),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(tT)},tT)end function a.card(tU,tV,tW)local dg=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(tU)},tU)ab(dg,11)a.stroke(dg,l.line,0.25)a.list(dg,5)a.pad(dg,8,8,8,9)
if tV then local md=a.row(dg,14)H("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},md)P(md,tV:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if tW then local CM=P(md,tW,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
CM.TextXAlignment=Enum.TextXAlignment.Right end end return dg end function a.heading(CN,CO,me)local mf=a.row(CN,me and 34 or 22)
P(mf,CO,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if me then P(mf,me,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mf end function a.note(CP,CQ,CS)local tX=P(a.row(CP,CS or 28),CQ,9,l.dim,false)tX.TextYAlignment=Enum.TextYAlignment.Top
return tX end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(mg)local aI=a.sw[mg]if not aI then return end
local dh=tostring(mg.Text or""):match(":%s*(.-)%s*$")or""local bQ=dh~=""and not a.OFF[dh]local mh=not aI.chips and(dh=="ON"or dh=="OFF")
aI.pill.Visible,aI.chip.Visible=mh,not mh if mh then aI.pill.BackgroundColor3=bQ and l.accent or l.panel2 aI.knob.Position=bQ and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aI.knob.BackgroundColor3=bQ and l.white or l.dim else aI.chip.Text=dh~=""and dh or"-"aI.chip.BackgroundColor3=bQ and l.accent or l.panel2
aI.chip.TextColor3=bQ and l.ink or l.dim end mg.BackgroundColor3=bQ and l.lit or l.raise if aI.edge then aI.edge.Color=bQ and l.accent or l.line aI.edge.Transparency=bQ and 0.55 or 0.45 end
end function a.switch(tY,CT,CU,e1)local aZ=H("TextButton",{Name="Switch",Text=CT,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,e1 and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(tY)},tY)
ab(aZ,9)local as={edge=a.stroke(aZ,l.line,0.45)}as.title=P(aZ,CU,11,l.text,true,UDim2 .new(0,10,0,e1 and 4 or 0),UDim2 .new(1,-100,0,e1 and 15 or 28))
as.title.TextWrapped,as.title.TextTruncate=false,Enum.TextTruncate.AtEnd if e1 then as.sub=P(aZ,e1,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
as.sub.TextWrapped,as.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end as.pill=H("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},aZ)ab(as.pill,9)as.knob=H("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},as.pill)ab(as.knob,7)as.chip=H("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},aZ)
ab(as.chip,9)a.pad(as.chip,10,0,10,0)H("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},as.chip)
as.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[aZ]=as T(aZ:GetPropertyChangedSignal("Text"):Connect(function()a.skin(aZ)end))
a.skin(aZ)return aZ end function a.chips(mi)if a.sw[mi]then a.sw[mi].chips=true a.skin(mi)end end function a.line(CV,CW)
local tZ=a.row(CV,15)local t0=H("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=CW or l.dim,
BorderSizePixel=0},tZ)ab(t0,3)local mj=P(tZ,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mj.TextWrapped,mj.TextTruncate=false,Enum.TextTruncate.AtEnd
return mj,t0 end function a.grow(t1,CX,CY)local hA=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=CX or 10,TextColor3=CY or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(t1)},t1)
T(hA:GetPropertyChangedSignal("Text"):Connect(function()hA.Visible=hA.Text~=""end))return hA end function a.actions(CZ,t2)
local C0=a.row(CZ,28)local t3,mk={},#t2 for e2,t4 in ipairs(t2)do t3[e2]=ai(C0,t4[1],t4[2]or l.panel2,10,UDim2 .new((e2-1)/mk,e2>1 and 3 or 0,0,0),
UDim2 .new(1/mk,(e2>1 and-3 or 0)+(e2<mk and-3 or 0),1,0))end return table.unpack(t3)end local function M(cu,hB,C1,C2)
a.put(cu,hB and C1 or C2)if not a.sw[cu]and a.lit[cu]~=hB then a.lit[cu]=hB cu.BackgroundColor3=hB and l.accent or l.panel2
cu.TextColor3=a.ink(cu.BackgroundColor3)end end a.title=H("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)H("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
H("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local ml=H("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(ml,8)a.grad(ml,l.accent,l.accent2,45)local t5=P(ml,"C",16,l.ink,true)t5 .Font,t5 .TextXAlignment=ae.x,Enum.TextXAlignment.Center
local C3=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))C3 .Font=ae.x P(a.title,"butter farm  "..bX,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
end a.pill=H("Frame",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-66,0.5,0),Size=UDim2 .new(0,78,0,22),
BackgroundColor3=l.raise,BorderSizePixel=0},a.title)ab(a.pill,11)a.pillEdge=a.stroke(a.pill,l.line,0.2)a.dot=H("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(0,9,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.pill)
ab(a.dot,4)a.runL=P(a.pill,"STOPPED",9,l.dim,true,UDim2 .new(0,22,0,0),UDim2 .new(1,-26,1,0))a.minB=ai(a.title,"-",l.raise,14,UDim2 .new(1,-60,0.5,-12),UDim2 .new(0,24,0,24))
a.xB=ai(a.title,"X",l.raise,11,UDim2 .new(1,-32,0.5,-12),UDim2 .new(0,24,0,24))a.xB.TextColor3=l.bad a.strip=H("Frame",{Position=UDim2 .new(0,Q.rail+8,0,Q.head+6),Size=UDim2 .new(1,-(Q.rail+16),0,Q.status),
BackgroundColor3=l.raise,BorderSizePixel=0},a.root)ab(a.strip,9)a.stroke(a.strip,l.line,0.3)a.bar=H("Frame",{Size=UDim2 .new(0,3,1,-12),Position=UDim2 .new(0,7,0,6),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
ab(a.bar,2)a.reason=P(a.strip,"starting",10,l.text,false,UDim2 .new(0,16,0,1),UDim2 .new(1,-22,1,-2))a.reason.TextTruncate=Enum.TextTruncate.AtEnd
a.railBg=H("Frame",{Position=UDim2 .new(0,0,0,Q.head),Size=UDim2 .new(0,Q.rail,1,-Q.head),BackgroundColor3=l.panel,
BorderSizePixel=0},a.root)ab(a.railBg,14)H("Frame",{Size=UDim2 .new(1,0,0,14),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
H("Frame",{Size=UDim2 .new(0,14,1,0),Position=UDim2 .new(1,-14,0,0),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
a.tabs=H("Frame",{Position=UDim2 .new(0,0,0,Q.head),Size=UDim2 .new(0,Q.rail,1,-Q.head),BackgroundTransparency=1,
BorderSizePixel=0},a.root)a.railLine=H("Frame",{Size=UDim2 .new(0,1,1,-Q.head),Position=UDim2 .new(0,Q.rail-1,0,Q.head),BackgroundColor3=l.line,
BorderSizePixel=0},a.root)do local C4=a.list(a.tabs,3)pcall(function()C4 .HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function bq(C5,C6,C7)
local hC=H("TextButton",{Text=C5,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(hC,9)local t6=H("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hC)ab(t6,2)a.tabsAll[#a.tabsAll+1]={b=hC,bar=t6,name=C6,sub=C7}return hC end
a.tabFarm=bq("🏠","Home","what the farm is doing")a.tabRun=bq("🌾","Farm","the buy - wax - collect loop")a.tabBut=bq("🧈","Butters","what gets bought and waxed")
a.tabCrt=bq("📦","Crates","which crates get opened")a.tabPet=bq("🐾","Pets","adopt, wish, fuse")a.tabTeam=bq("👥","Teams","the right pets at the right moment")
a.tabSrv=bq("🤝","Server","helping, campfire, ghost")a.tabAdm=bq("⚡","Admin","admin abuse and its boosts")a.tabSet=bq("⚙","Settings","configs, startup, performance")
local function br()local mm=H("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mm,8)a.pad(mm,8,2,10,12)return mm end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=br(),br(),br(),br(),br(),br(),br(),br(),br()a.farm.Visible=true
do local e3=a.farm local t7=a.row(e3,34)a.startB=ai(t7,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(t7,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local C8=a.row(e3,44)local function e4(t8,C9,t9)local hD=H("Frame",{Position=UDim2 .new((t8-1)/t9,t8>1 and 2 or 0,0,0),Size=UDim2 .new(1/t9,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},C8)ab(hD,9)a.stroke(hD,l.line,0.3)local hE=P(hD,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hE.Font,hE.TextXAlignment,hE.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local C_=P(hD,C9,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
C_.TextXAlignment=Enum.TextXAlignment.Center return hE end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e4(1,"BOUGHT",5),e4(2,"WAXED",5),e4(3,"SOLD",5),e4(4,"MONEY",5),e4(5,"FREE",5)
local t_=a.card(e3,"Right now")a.info=P(a.row(t_,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(t_,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local e5=a.card(e3,"Systems")
a.helpL=a.line(e5,l.info)a.campL=a.line(e5,l.accent2)a.questL=a.line(e5,l.good)a.arL=a.line(e5,l.accent)a.ixL=a.line(e5,l0 .Dotonbori)
local ua=a.card(e3,"Activity")a.log=H("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(ua)},ua)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function GN(Da,Db)return a.row(Db or a.farm,Da)end local al do local mn=a.run
a.heading(mn,"Farm","buy what rolls, wax it, collect the cash")local e6=a.card(mn,"Loop")a.colT=a.switch(e6,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(e6,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hr(al,tostring(d.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(e6,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(e6,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(e6,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local mo=a.card(mn,"By hand")
a.buyB,a.plB=a.actions(mo,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(mo,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(mo,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local hF=a.but a.heading(hF,"Butters","what gets bought and waxed")local ub=a.card(hF,"Strategy")a.ixT=a.switch(ub,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(ub,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hF)},hF)a.list(a.butList,5)end do local hG=a.crt a.heading(hG,"Crates","only ticked crates are opened")
local uc=a.card(hG,"Opening")a.crateT=a.switch(uc,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(uc,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hG)},hG)a.list(a.crtList,5)end do local hH=a.pet a.heading(hH,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local e7=a.card(hH,"Automatic")a.pbT=a.switch(e7,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(e7,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(e7,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(e7,10,l.dim)a.note(e7,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hH)},hH)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hI=a.srv a.heading(hI,"Server","other players, the campfire, staying hidden")
local mp=a.card(hI,"Helping")a.helpT=a.switch(mp,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(mp,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mp,l.info)
local ud=a.card(hI,"Campfire")a.campT=a.switch(ud,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(ud,l.accent2)local mq=a.card(hI,"Ghost")a.ghostT=a.switch(mq,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mq,l.dim)a.note(mq,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local e8=a.adm a.heading(e8,"Admin abuse","the show, its boosts and the farm in it")local ue=a.card(e8,"When")
a.admBig=P(a.row(ue,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(ue,14),"",10,l.dim,false)local Dc=a.card(e8,"Boosts now")
a.admBoost=a.grow(Dc,11,l.text)local mr=a.card(e8,"What the farm does")a.shT=a.switch(mr,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mr,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(mr,l.accent)
local uf=a.card(e8,"Show feed")a.admFeed=H("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(uf)},uf)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local di=a.set a.heading(di,"Settings","kept on your phone, per config")
local hJ=a.card(di,"Config")al=a.row(hJ,28)a.cfgName=hr(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hJ,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hJ,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(hJ,10,l.dim)local ms=a.card(di,"Starting")a.startT=a.switch(ms,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(ms,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(ms,9,l.dim)local mt=a.card(di,"If the game drops me")
a.rejT=a.switch(mt,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(mt,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(mt,9,l.dim)local bs=a.card(di,"Performance")a.pfCalm=a.switch(bs,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bs,"LITE MODE: OFF","Lite mode","labels, sparkles, lighting extras off")a.pfBases=a.switch(bs,"BASES: ALL DRAWN","Bases","stop drawing other bases, or yours too")
a.pfFps=a.switch(bs,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bs,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bs,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bs,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hr(al,tostring(d.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bs,l.good)a.note(bs,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local Dd=a.card(di,"About")a.note(Dd,"CHURN "..bX.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for GO,De in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(De)end local ug=H("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},l4)
a.tgRoot=H("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},ug)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=H("TextButton",{Text="C",Size=tJ,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=H("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=H("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()
local e9=j.ghostMode()if a.ghostT then a.put(a.ghostT,j.GHOST[e9][1])end if a.tgGhost then a.tgGhost.Text=j.GHOST[e9][2]
a.tgGhost.BackgroundColor3=e9==2 and l.accent or(e9==1 and l.warn or l.panel)a.tgGhost.TextColor3=e9>0 and l.ink or l.dim
end end local bt={built=false,boxes={},at=0}function a.check(hK,mu)hK.Text=mu and"✓"or""hK.BackgroundColor3=mu and l.accent or l.bg
hK.TextColor3=l.ink local mv=hK.Parent if mv and mv:IsA("TextButton")then mv.BackgroundColor3=mu and l.lit or l.raise end
end local function uh(ui,uj)d.Targets[ui]=uj or nil local uk=bt.boxes[ui]if uk then a.check(uk,uj)end end local function mw()
for Df,Dg in pairs(bt.boxes)do a.check(Dg,d.Targets[Df]==true)end end function a.tickBox(Dh)local mx=H("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Dh)ab(mx,6)
a.stroke(mx,l.line,0)return mx end local e_ local function Di()local Dj=a.card(a.butList,"Butter list")local my=a.row(Dj,26)
a.butInfo=P(my,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local Dk=ai(my,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Dl=ai(my,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))Dk.MouseButton1Click:Connect(function()
for Dm in pairs(d.Targets)do d.Targets[Dm]=nil end mw()end)Dl.MouseButton1Click:Connect(function()ad.at=0 iV()
e_(true)end)end e_=function(Dn)if not iV()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bt.built and not Dn and bt.at==ad.at then return end for GP,hL in ipairs(a.butList:GetChildren())do
if hL:IsA("Frame")or hL:IsA("TextButton")or hL:IsA("TextLabel")then hL:Destroy()end end bt.boxes,a.butEmpty={},nil
Di()for GQ,hM in ipairs(ad.rarOrder)do local mz=l0[hM]or l.text local cv=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cv,11)a.stroke(cv,mz,0.7)a.list(cv,4)a.pad(cv,7,7,7,8)
local mA=a.row(cv,22)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=mz,BorderSizePixel=0},mA)
local Do=P(mA,hM:upper(),11,mz,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))Do.Font=ae.x local Dp=ai(mA,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local Dq=hM Dp.MouseButton1Click:Connect(function()local ul=ad.members[Dq]or{}local um=false for GR,Dr in ipairs(ul)do if not d.Targets[Dr]then um=true break end end
for GS,Ds in ipairs(ul)do uh(Ds,um)end end)for GT,mB in ipairs(ad.members[hM]or{})do local hN=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cv)},cv)ab(hN,8)local uo=P(hN,ak(mB),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
uo.TextWrapped,uo.TextTruncate=false,Enum.TextTruncate.AtEnd local up=a.tickBox(hN)bt.boxes[mB]=up local uq=mB
local function ur()uh(uq,not d.Targets[uq])end hN.MouseButton1Click:Connect(ur)up.MouseButton1Click:Connect(ur)
end end mw()bt.built,bt.at=true,ad.at end function L.paint()for Dt,Du in pairs(L.boxes)do a.check(Du,d.CrateTicks[Dt]==true)end
if a.crtInfo then local mC,mD=0,0 for GU in pairs(L.boxes)do mC=mC+1 end for GV,Dv in pairs(d.CrateTicks)do if Dv then mD=mD+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(mC,mD))end if a.crateT then M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for GW,hO in ipairs(a.crtList:GetChildren())do if hO:IsA("Frame")or hO:IsA("TextButton")or hO:IsA("TextLabel")then hO:Destroy()end
end L.boxes={}local mE=a.card(a.crtList,"All of them","worst first")local mF=a.row(mE,26)a.crtInfo=P(mF,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Dw=ai(mF,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Dx=ai(mF,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(Dw.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(Dx.MouseButton1Click:Connect(function()L.build()end))
for GX,bu in ipairs(L.list())do local us=l0[bu.rar or""]or l.text local dj=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(mE)},mE)ab(dj,8)H("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=us,BorderSizePixel=0},dj)
local ut=P(dj,(bu.title or bu.name)..(bu.guess and"  (?)"or""),11,us,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
ut.TextWrapped,ut.TextTruncate=false,Enum.TextTruncate.AtEnd local Dy=P(dj,bu.price and("$"..aL(bu.price))or(bu.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Dy.TextXAlignment=Enum.TextXAlignment.Right local uu=a.tickBox(dj)L.boxes[bu.k]=uu local uv=bu.k local function uw()
d.CrateTicks[uv]=(not d.CrateTicks[uv])or nil L.paint()end T(dj.MouseButton1Click:Connect(uw))T(uu.MouseButton1Click:Connect(uw))
end L.built=L.at L.paint()end local ux="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a0(cw)ux=cw for Dz,mG in ipairs(a.tabKeys)do a[mG].Visible=(mG==cw)local hP=a.tabsAll[Dz]if hP then
local mH=mG==cw hP.b.BackgroundTransparency,hP.b.TextTransparency,hP.bar.Visible=mH and 0 or 1,mH and 0 or 0.45,mH
end end if cw=="pet"and not q.built then pcall(q.build)end if cw=="team"and not z.built then pcall(z.build)end
if cw=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cw=="but"then e_(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(mI,uy,uz,uA)if uA then mI.Text=uA end mI.BackgroundColor3=uy and uz or l.bg mI.TextColor3=uy and a.ink(uz)or l.dim
end function q.paintRow(uB)local cx=q.rows and q.rows[uB]if not cx then return end local cy=d.Pets[uB]or{}local fa=tonumber(cy.f)or 0
a.flag(cx.b,cy.b,l.good)a.flag(cx.g,cy.g,l.accent,cy.g and"BIG"or"ANY")a.flag(cx.w,cy.w,l.warn)a.flag(cx.f,fa>0,l.good,fa>=7 and"7 BIG/HUGE"or(fa>0 and(fa.." BIG")or"FUSE"))
if cx.row then cx.row.BackgroundColor3=(cy.b or cy.w or fa>0)and l.lit or l.raise end end function q.flag(mJ,hQ)
local a8=d.Pets[mJ]or{}if hQ=="f"then local DA={[0]=1,[1]=2,[2]=3,[3]=7}local uC=DA[tonumber(a8 .f)or 0]or 0 a8 .f=uC>0 and uC or nil
elseif a8[hQ]then a8[hQ]=nil else a8[hQ]=true end d.Pets[mJ]=(a8 .b or a8 .g or a8 .w or a8 .f)and a8 or nil q.paintRow(mJ)
end function q.paintAll()for DB in pairs(q.rows or{})do q.paintRow(DB)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local uD=q.wishes()local fb=q.data()for hR,hS in pairs(q.rows)do hS.name.Text=q.nice(hR)..(uD[hR]and("   * wish %dm"):format(math.ceil(uD[hR]/60))or"")
local uE=C.status(hR,fb)hS.desc.Text=uE and(uE.." | "..hS.boostText)or hS.boostText end local uF=tonumber(J:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(fb and#(fb.pets or{})or 0,fb and tonumber(fb.maxOwned)or 60,
aL(q.money()),uF>0 and(" | free wishes "..uF)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local hT=q.info()for GY,hU in ipairs(a.petList:GetChildren())do if hU:IsA("Frame")or hU:IsA("TextLabel")or hU:IsA("TextButton")then hU:Destroy()end
end q.rows={}if not hT then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dk={}for GZ,uG in ipairs(q.order())do local mK=hT.Pets[uG].rarity or"?"dk[mK]=dk[mK]or{}
table.insert(dk[mK],uG)end local dl={}for G0,uH in ipairs(hT.Rarities or{})do if dk[uH]then dl[#dl+1]=uH end end
for uI in pairs(dk)do if not table.find(dl,uI)then dl[#dl+1]=uI end end for G1,mL in ipairs(dl)do local hV=q.RC[mL]or l.text
local cz=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cz,11)a.stroke(cz,hV,0.7)a.list(cz,4)a.pad(cz,7,7,7,8)local uJ=a.row(cz,18)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=hV,BorderSizePixel=0},uJ)
local DC=P(uJ,mL:upper(),11,hV,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))DC.Font=ae.x for G2,hW in ipairs(dk[mL])do
local fc=H("Frame",{Size=UDim2 .new(1,0,0,44),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cz)},cz)
ab(fc,8)local mM=P(fc,q.nice(hW),11,hV,true,UDim2 .new(0,9,0,4),UDim2 .new(1,-172,0,15))mM.TextWrapped,mM.TextTruncate=false,Enum.TextTruncate.AtEnd
local DD,DE=pcall(function()return hT.describe(hW)end)local uK=DD and tostring(DE)or""local mN=P(fc,uK,9,l.dim,false,UDim2 .new(0,9,0,20),UDim2 .new(1,-172,0,20))
mN.TextYAlignment,mN.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function hX(DF,DG,DH)
local uL=ai(fc,DF,l.bg,8,UDim2 .new(1,DG,0.5,-11),UDim2 .new(0,DH,0,22))uL.AutoButtonColor=true return uL end
local uM,uN,uO,uP=hX("BUY",-164,30),hX("ANY",-131,30),hX("WISH",-98,34),hX("FUSE",-61,56)local hY=hW uM.MouseButton1Click:Connect(function()q.flag(hY,"b")end)
uN.MouseButton1Click:Connect(function()q.flag(hY,"g")end)uO.MouseButton1Click:Connect(function()q.flag(hY,"w")end)
uP.MouseButton1Click:Connect(function()q.flag(hY,"f")end)q.rows[hW]={b=uM,g=uN,w=uO,f=uP,name=mM,desc=mN,boostText=uK,row=fc}
end end q.built=true q.paintAll()end function j.paint()M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.Calm then j.calm(true)end if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end T(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()j.calm(not d.Calm)j.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local DI=table.find(j.CAPS,d.FpsCap or 0)or 1 local uQ=j.CAPS[(DI%#j.CAPS)+1]
if not j.cap(uQ)and uQ~=0 then A("this executor cannot cap fps")end j.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local mO=tonumber(a.pfMem.Text)if mO and mO>=0 then d.MemLimit=math.floor(mO)end j.paint()end))function z.names()
local mP={"(none)"}for G3,DJ in ipairs((z.teams()))do mP[#mP+1]=DJ.name end return mP end function z.cycle(mQ,DK)
local hZ=z.names()local DL=d[mQ]~=""and d[mQ]or"(none)"local h0=table.find(hZ,DL)or 1 h0=((h0-1+DK)%#hZ)+1 d[mQ]=hZ[h0]=="(none)"and""or hZ[h0]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local mR={}for G4,DM in ipairs((z.teams()))do mR[DM.name]=true end
for DN,uR in pairs(z.pick)do local dm=d[DN]uR.Text=dm==""and"(none)"or(mR[dm]and dm or(dm.." (missing)"))uR.TextColor3=(dm~=""and not mR[dm])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local DO,h1=q.srv(),{}for G5,h2 in ipairs(z.list or{})do h1[#h1+1]=("st %-2s %-22s %9s  helps %d"):format(h2 .st.Name,ak(W(h2 .name)):sub(1,22),z.clock(h2 .ends-DO),h2 .helps)
end a.tmList.Text=#h1>0 and table.concat(h1,"\n")or"no waxes running"end function z.build()for G6,h3 in ipairs(a.teamList:GetChildren())do
if h3:IsA("Frame")or h3:IsA("TextLabel")or h3:IsA("TextButton")then h3:Destroy()end end z.pick={}local h4=a.card(a.teamList,"Automatic")
a.tmT=a.switch(h4,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(h4,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild z.paint()end)a.tmBuildNow=a.actions(h4,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local DP,DQ=pcall(C.rebuild,"you asked")if not DP then A("BUILD ERR "..tostring(DQ))end end)
end)a.tmInfo=a.grow(h4,10,l.dim)local uS=a.card(a.teamList,"Which team when")local function h5(h6,DR,DS)local fd=a.row(uS,54)
P(fd,DR,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local uT=P(fd,DS,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
uT.TextWrapped,uT.TextTruncate=false,Enum.TextTruncate.AtEnd local DT=ai(fd,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local uU=ai(fd,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local DU=ai(fd,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
DT.MouseButton1Click:Connect(function()z.cycle(h6,-1)end)DU.MouseButton1Click:Connect(function()z.cycle(h6,1)end)
uU.MouseButton1Click:Connect(function()z.cycle(h6,1)end)z.pick[h6]=uU end h5("TeamNormal","Normal","the rest of the time: money + luck")
h5("TeamFull","Full","every station busy: money + wax speed")h5("TeamGlaze","Glaze","worn just before a wax finishes")
local h7=a.row(uS,26)P(h7,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hr(h7,tostring(d.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(h7,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local DV=ai(h7,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
DV.MouseButton1Click:Connect(function()local h8=tonumber(a.tmLead.Text)if h8 and h8>=5 and h8<=600 then d.GlazeLead=math.floor(h8)else a.tmLead.Text=tostring(d.GlazeLead)end
z.paint()end)h5("TeamWax","Wax","while a butter is placed: head starts")local uV=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(uV)},uV)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local DW=a.card(a.teamList,"How it works")a.note(DW,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function DX()a.secB.Text=tostring(d.Every)M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not E.home then pcall(j.unpin)end end)end
M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eN(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bP(a.root)bP(a.tgRoot)c.lastCollect=y()
mw()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(j.applyAll)end local function DY(uW)task.spawn(function()uW.TextColor3=l.bad
task.wait(0.8)if c.alive then uW.TextColor3=l.text end end)end local function uX()local uY=a.secB.Text:match("^%s*(%d+)%s*$")
local fe=uY and tonumber(uY)if not fe or fe<1 then a.secB.Text=tostring(d.Every)DY(a.secB)A("interval must be a whole number >= 1")
return end if fe==d.Every then return end d.Every,c.lastCollect=fe,y()A("collect every "..fe.."s")end local function N(DZ,D0)T(DZ.MouseButton1Click:Connect(D0))end
N(a.secSet,uX)T(a.secB.FocusLost:Connect(uX))N(a.colT,function()d.Collect,c.lastCollect=not d.Collect,y()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(ar,"selling...",sh)end)N(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
d.Help=not d.Help E.nextAt,E.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()d.Quests=not d.Quests F.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,j.cycleGhost)function o.paint()M(a.snapT,d.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
M(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(D1)task.spawn(function()pcall(o.tick)if D1 and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local D2=o.on()d.AutoIndex=not d.AutoIndex o.discAt=-100 o.changed(D2)end)
N(a.bestT,function()local D3=o.on()d.Best=((d.Best or 0)+1)%5 o.stackAt=-100 o.changed(D3)end)N(a.bcT,function()
local D4=o.on()d.BestCrate=not d.BestCrate o.changed(D4)end)N(a.shT,function()d.Shower=not d.Shower o.paint()
end)N(a.snapT,function()d.SnapGlaze=d.SnapGlaze==false o.paint()end)N(a.pbT,function()d.PetBuy=not d.PetBuy q.paintAll()end)
N(a.pwT,function()d.PetWish=not d.PetWish q.paintAll()end)N(a.pfT,function()d.AutoFuse=not d.AutoFuse q.paintAll()end)
function o.admPaint()local bR=q.srv()local bS pcall(function()o.aac=o.aac or require(ah:FindFirstChild("AdminAbuseClient"))
bS=o.aac:GetState()end)local dn,bT="nothing scheduled","the game has not announced one"if type(bS)=="table"then
local ff,a1,bU=tostring(bS.Phase or""),tonumber(bS.StartsAt),tonumber(bS.EndsAt)if a1 and a1<1e9 then a1=nil end
if bU and bU<1e9 then bU=nil end if ff=="Countdown"and a1 then dn,bT="starts in "..z.clock(a1-bR),os.date("%a %H:%M",math.floor(a1)).." your time"
elseif ff=="Live"and bU then dn,bT="LIVE  -  "..z.clock(bU-bR).." left","the farm is grabbing, waxing and glazing through it"
elseif ff~=""and ff~="Idle"and bU and bU>bR then dn,bT=ff:lower().."  -  "..z.clock(bU-bR).." left","after the show"
elseif a1 and a1>bR then dn,bT="next: "..os.date("%a %H:%M",math.floor(a1)),"your time"elseif a1 then dn,bT="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a1)).." your time"
end if type(bS.Kind)=="string"and bS.Kind~=""then bT=bT.."  |  "..bS.Kind end end a.put(a.admBig,dn)a.put(a.admSub,bT)
local dp,mS={},ah:FindFirstChild("AdminShow")if mS then local D5,D6=pcall(function()return mS:GetAttributes()end)
for uZ,dq in pairs(D5 and D6 or{})do local h9=type(uZ)=="string"and uZ:match("^(.-)Mult$")local mT=h9 and tonumber(mS:GetAttribute(h9 .."Until"))
if h9 and type(dq)=="number"and dq~=1 and dq~=0 and mT and mT>bR then dp[#dp+1]=("%s  x%s   %s left"):format(h9:gsub("(%l)(%u)","%1 %2"),(dq%1==0)and tostring(dq)or("%.2f"):format(dq),
z.clock(mT-bR))end end end table.sort(dp)a.put(a.admBoost,#dp>0 and table.concat(dp,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dp>0 and l.accent or l.dim local h_=0 for G7 in pairs(O.drops)do h_=h_+1 end local u0=o.snapAt and(o.snapAt-bR)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,h_>0 and(", "..h_.." falling")or"",
u0 and("in "..math.max(0,math.floor(u0)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(ar,"opening crate...",d1,true)end)N(a.padB,function()c.plot=bv()or c.plot local u1,mU=ao(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(u1 and mU and mU:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=mU.CFrame:ToObjectSpace(u1 .HumanoidRootPart.CFrame)
AN(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eN(not c.running)end)N(a.buyB,function()
c.plot=bv()or c.plot task.spawn(ar,"buying (manual)...",oQ,true)end)N(a.plB,function()c.plot=bv()or c.plot task.spawn(ar,"waxing (manual)...",oU)
end)N(a.tabFarm,function()a0("farm")end)N(a.tabRun,function()a0("run")end)N(a.tabSrv,function()a0("srv")end)N(a.tabAdm,function()a0("adm")end)
N(a.tabBut,function()a0("but")end)N(a.tabSet,function()a0("set")end)N(a.tabCrt,function()a0("crt")end)N(a.tabPet,function()a0("pet")end)
N(a.tabTeam,function()a0("team")end)local function D7(mV)c.hidden=mV a.root.Visible=not mV a.tgBtn.TextColor3=mV and l.text or l.ink
end tP(a.tgBtn,a.tgRoot,function()bP(a.tgRoot)c.togPos=hw(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then D7(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aJ,aw={},0 local function bV()aJ=n_()if#aJ==0 then a.cfgPick.Text="(none saved)"
aw=0 return end if aw<1 or aw>#aJ then aw=1 end a.cfgPick.Text=aJ[aw]..("  (%d/%d)"):format(aw,#aJ)end local function u2()
local u3=c.autoload~=nil a.cfgAuto.Text=u3 and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=u3 and l.accent or l.panel2
end local function mW()local u4=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if u4~=""then return u4 end return(aw>0 and aJ[aw])or""
end N(a.cfgSave,function()c.winPos=hw(a.root)or c.winPos c.togPos=hw(a.tgRoot)or c.togPos local u5,u6=fU(mW())
a.cfgMsg.Text=u5 and("saved as "..u6)or("could not save: "..u6)a.cfgMsg.TextColor3=u5 and l.good or l.bad bV()
A(a.cfgMsg.Text)end)local function D8(mX)local mY,u7=oi(mX)a.cfgMsg.Text=mY and("loaded "..u7)or("could not load: "..u7)
a.cfgMsg.TextColor3=mY and l.good or l.bad if mY then a.cfgName.Text=mX DX()task.spawn(D.apply,"config "..mX)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()D8(mW())end)N(a.cfgPick,function()bV()if aw>0 then a.cfgName.Text=aJ[aw]end
end)N(a.cfgPrev,function()if#aJ==0 then bV()return end aw=(aw-2)%#aJ+1 bV()a.cfgName.Text=aJ[aw]end)N(a.cfgNext,function()
if#aJ==0 then bV()return end aw=aw%#aJ+1 bV()a.cfgName.Text=aJ[aw]end)N(a.cfgAuto,function()if c.autoload then
ol(nil)a.cfgMsg.Text="it will not load a config on launch"else local fg=mW()local u8=false for G8,D9 in ipairs(n_())do if D9==fg then u8=true end end
local D_=u8 or fU(fg)if D_ and fg~=""then ol(fg)bV()a.cfgMsg.Text=fg.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim u2()end)N(a.autoB,function()
local u9,u_=w3()a.autoMsg.Text=u9 and("installed. "..u_)or("failed: "..u_)a.autoMsg.TextColor3=u9 and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dK("you asked")end)
local a9=false N(a.minB,function()a9=not a9 a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not a9,not a9,not a9
if a9 then for G9,Ea in ipairs(a.tabKeys)do a[Ea].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a0(ux)
end a.root.Size=UDim2 .new(0,Q.w,0,a9 and(Q.head+Q.status+12)or Q.h)a.minB.Text=a9 and"+"or"-"end)local function ia()
if not c.alive then return end c.alive,c.running=false,false pcall(j.restoreAll)pcall(ft)for G_,Eb in ipairs(il)do pcall(function()Eb:Disconnect()end)end
if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end pcall(function()l5:Destroy()end)
pcall(function()ug:Destroy()end)if cB.SAB_KILL==ia then cB.SAB_KILL=nil end end cB.SAB_KILL=ia N(a.killB,ia)N(a.xB,ia)
tP(a.title,a.root,function()bP(a.root)c.winPos=hw(a.root)or c.winPos end)local function va()local fh,cA=c.reason,c.level
if c.busy then fh,cA=c.busyText,"ok"elseif not c.running then local Ha,vb,Ec=sU()if c.capHit then fh,cA=vb,"bad"else fh,cA="[stopped] "..vb,(Ec=="bad")and"bad"or"idle"end
c.reason,c.level=fh,cA end local dr=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dr then
a.lit.dot=dr a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dr,dr,dr,dr a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fh)if a.lit.bar~=cA then a.lit.bar=cA a.bar.BackgroundColor3=BY[cA]or l.dim end
if a9 then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bW=wD()if a.farm.Visible then local Ed,Ee=fq()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Ed.."/"..Ee)local vc=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(y()-c.lastCollect)))or nil
local vd=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aL(a_()),c.rolls,c.gifts,c.crates,vd and ak(W(vd))or"nothing",e.on and("   ["..e.title.." window open]")or"",
vc and("in "..vc.."s")or"off"))a.put(a.tgt,(#bW==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bW<=3)and table.concat(bW,", ")or(#bW.." butters ticked"))))
if a.lit.tgt~=(#bW==0)then a.lit.tgt=(#bW==0)a.tgt.TextColor3=(#bW==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fk,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(d.Help or d.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,d.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,j.ghostMode()>0 and(j.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bW))
end if a.but.Visible and bt.at~=ad.at then e_(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((d.Help or d.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(d.Campfire and K.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(d.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local ve=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",ve~=""and ve or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cB.SAB={S=c,CFG=d,EV=V,U=a,sg=l5,CAT=ad,LEARN=aj,buildList=e_,
logAll=ds,evAll=dt,AR=D,CR=L,PF=j,PX=q,TM=z,CRATE=e,FU=C,HX=E,CF=K,QX=F,IX=o,SH=O}A(bX.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a0("farm")bP(a.root)bP(a.tgRoot)if ht then pcall(function()T(ht:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bP(a.root)bP(a.tgRoot)end))end)end bV()u2()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(va)task.spawn(function()local vf=w1()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(vf and("\n(backup: "..vf..")")or"")
local vg=fO(am.exec)if vg and not vg:find("SAB autoloader v2",1,true)then dG(am.exec,am.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fO(am.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(w9)end)task.spawn(function()while c.alive do local Ef,Eg=pcall(va)if not Ef then A("UI ERR "..tostring(Eg))end
task.wait((c.hidden or a9)and 1.5 or 0.4)end end)task.spawn(function()local Eh,Ei=pcall(xg)if not Eh then A("HOOK ERR "..tostring(Ei))end
end)task.spawn(function()pcall(v0)if e.loadSeq and not e.learned then local ib={}for vh=1,20 do if e.loadSeq[vh]then ib[#ib+1]=e.loadSeq[vh]end end
if#ib>0 then e.learned={seq=ib,mode=e.loadMode}A("remembered how to open crates directly")end end if iV()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local Ej,vi=pcall(AP)if Ej and vi and c.alive and not c.manualPad then c.manualPad=vi end end)task.spawn(function()
while c.alive do local mZ,m0=pcall(q.buyTick)if not mZ then A("PET ERR "..tostring(m0))task.wait(5)end mZ,m0=pcall(q.wishTick)
if not mZ then A("WISH ERR "..tostring(m0))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local ic,vj=0,y()
T(game:GetService("RunService").Heartbeat:Connect(function()ic=ic+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=y()while c.alive do task.wait(1)local vk=y()j.fps,ic,vj=ic/math.max(vk-vj,0.001),0,vk local Ek,El=pcall(j.tick)
if not Ek then A("PERF ERR "..tostring(El))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local Em,En=pcall(C.tick)if not Em then A("FUSE ERR "..tostring(En))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local Eo,Ep=pcall(z.tick)if not Eo then A("TEAM ERR "..tostring(Ep))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local ie=ah:WaitForChild("Remotes",30)local vl=ie and ie:WaitForChild("ClanEvent",30)
if vl and c.alive then T(vl.OnClientEvent:Connect(function(Eq,Er)if Eq=="call"then pcall(E.onCall,Er)end end))
end local vm=ie and ie:FindFirstChild("RollConfirmAsk")if vm and c.alive then T(vm.OnClientEvent:Connect(function(Es)F.asked=Es or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(j.calmScan)end end end)task.spawn(function()
local m1=ah:WaitForChild("Remotes",30)if not(m1 and c.alive)then return end local function ig(Et,Eu)local m2=m1:FindFirstChild(Et)
if m2 and m2:IsA("RemoteEvent")then T(m2 .OnClientEvent:Connect(function(...)pcall(Eu,...)end))end end ig("NewSquishyDiscovered",function(m3,vn)
if type(m3)~="string"then return end o.disc=o.disc or{}o.disc[W(m3)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(m3)),vn and(" ("..tostring(vn)..")")or""))
end)ig("IndexRefresh",o.loadDisc)ig("IndexRowComplete",function(Ev)A("INDEX: the whole "..tostring(Ev).." row is complete")end)
ig("AdminShow",o.admin)local vo=m1:FindFirstChild("AdminShowSync")if vo then local Ew,vp=pcall(function()return vo:InvokeServer()end)
if Ew and type(vp)=="table"then for Hb,Ex in pairs(vp)do pcall(O.add,Ex)end end end while c.alive do local Ey,Ez=pcall(o.tick)
if not Ey then o.msg="index error: "..tostring(Ez)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local EA,EB=pcall(F.tick)if not EA then A("QUEST ERR "..tostring(EB))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(ft)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local ED=(type(newcclosure)=="function")and newcclosure or function(EC)return EC end local m4
local vq=(type(setnamecallmethod)=="function")and setnamecallmethod or nil m4=hookmetamethod(game,"__namecall",ED(function(vr,...)
local fi=getnamecallmethod()if c.alive and(fi=="InvokeServer"or fi=="FireServer")then local vs,vt=pcall(function()return vr.Name end)
if vs and vt=="CrateAction"and not e.replaying then pcall(e.saw,fi,...)elseif vs and vt=="AutoRollAction"and not D.replaying then pcall(D.saw,fi,...)end
if vq then vq(fi)end end return m4(vr,...)end))e.oldNC=m4 end)end if ij then T(J.Idled:Connect(function()pcall(function()ij:CaptureController()ij:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Hc=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ao()and(c.plot or bv())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local ih=b2()
if ih and o.on()and not aK(ih.name)then ih=nil end if c.alive and d.AutoRoll and c.running and not D.isOn()and not ih and not ac()
and not e.waiting and not e.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Hd=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bv()if ao()and c.plot and o.any()then eN(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bv()c.lastCollect=y()while c.alive do if c.running then local EE,vu=pcall(BT)if not EE and vu~=ik then A("LOOP ERR "..tostring(vu))end
end task.wait(0.1)end end)ii("ready - the window is at the top left")end local EG,m5=xpcall(vy,function(EF)return tostring(EF).."\n"..debug.traceback()end)
if not EG then pcall(function()warn("SAB "..bX.." ERROR: "..tostring(m5))end)ii("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bX.." ERROR: "..tostring(m5))end)pcall(function()local vv=(type(getgenv)=="function"and getgenv())or _G
if type(vv.SAB_KILL)=="function"then vv.SAB_KILL()end for He,EH in ipairs({"SABFarmGui","SABToggle"})do local vw=J.PlayerGui:FindFirstChild(EH)
if vw then vw:Destroy()end end end)pcall(function()local fj=Instance.new("ScreenGui")fj.Name="SABError"fj.ResetOnSpawn=false
fj.DisplayOrder=1000 local a2=Instance.new("TextBox")a2 .Size=UDim2 .new(0,340,0,170)a2 .Position=UDim2 .new(0,10,0,50)
a2 .BackgroundColor3=Color3 .fromRGB(90,20,20)a2 .TextColor3=Color3 .new(1,1,1)a2 .TextSize=11 a2 .TextWrapped=true
a2 .ClearTextOnFocus=false a2 .TextXAlignment=Enum.TextXAlignment.Left a2 .TextYAlignment=Enum.TextYAlignment.Top
a2 .Text="SAB "..bX.." failed to start. Send this text:\n"..tostring(m5)a2 .Parent=fj fj.Parent=J:WaitForChild("PlayerGui")
end)end
