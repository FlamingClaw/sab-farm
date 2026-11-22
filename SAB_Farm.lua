local bY="v27"local no=game:GetService("Players")local J=no.LocalPlayer or no.PlayerAdded:Wait()local function it(v7)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bY,Text=v7,Duration=6})
end)end it("script started")local function v8()local af=game:GetService("ReplicatedStorage")local am=game:GetService("Workspace")
local np=game:GetService("UserInputService")local cC=(type(getgenv)=="function"and getgenv())or _G if type(cC.SAB_KILL)=="function"then pcall(cC.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local iu=(function()local v9,v_=pcall(function()return game:GetService("VirtualUser")end)return v9 and v_ or nil end)()
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
local D={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local j={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local q,z,e,C,E,K,F={},{},{},{},{},{},{}local o,O={},{}local iv={}local iw,fn,dt,du={},{},{},{}local function T(nq)iw[#iw+1]=nq return nq end
local function ag(wa)task.wait(wa)if not c.alive then error(iv,0)end end local function A(fo)fo=os.date("%H:%M:%S").." "..tostring(fo)
table.insert(fn,1,fo)if#fn>6 then table.remove(fn)end c.logN=(c.logN or 0)+1 dt[#dt+1]=fo if#dt>80 then table.remove(dt,1)end
end local function fp(nr)if type(nr)~="string"then return""end return(nr:lower():gsub("[^%w]",""))end local function W(wb)
local ns=fp(wb)local ix=ns:gsub("butter$","")if ix==""then ix=ns end return ix end local function aK(nt)if type(nt)~="string"then return false end
local iy=W(nt)if iy==""then return false end if o.want then return o.want(iy)end return d.Targets[iy]==true end
local function wc(dv)dv=dv:lower()return dv:find("squishy",1,true)~=nil or dv:match("butter$")~=nil or dv:match("butter[^%a]")~=nil
end local iz={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aL(dw)if type(dw)~="number"then return"?"end
local fq=1 while math.abs(dw)>=1000 and fq<#iz do dw=dw/1000 fq=fq+1 end local wd=string.format("%.2f",dw):gsub("%.?0+$","")
return wd..iz[fq]end local function we(nu)if type(nu)~="string"then return nil end local wf,dx=nu:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local iA=tonumber(wf)if not iA then return nil end if dx==""then return iA end local wg={qd="qa",qn="qi"}dx=wg[dx:lower()]or dx
for wh,wi in ipairs(iz)do if wi:lower()==dx:lower()then return iA*1000^(wh-1)end end return nil end local function ba()
local nv=J:GetAttribute("BoardValueMoney")if type(nv)=="number"then return nv end local nw=J:FindFirstChild("leaderstats")
if nw then for FF,wj in ipairs({"Cash","Money","Coins"})do local iB=nw:FindFirstChild(wj)if iB and type(iB.Value)=="number"then return iB.Value end
end end end local function fr(wk)local iC=wk:GetFullName()if c.plot then local iD=c.plot:GetFullName()if iC:sub(1,#iD)==iD then return iC:sub(#iD+2)end
end return iC end local function ap()local fs=J.Character if fs and fs:FindFirstChild("HumanoidRootPart")then
local nx=fs:FindFirstChildOfClass("Humanoid")if nx and nx.Health>0 then return fs end end end local function bw()
local iE=am:FindFirstChild("Plots")if not iE then return nil end local function ny(wl)local nz=wl:FindFirstChild("Plate")
return nz~=nil and nz:FindFirstChild("EditStackAttachment",true)~=nil end local nA=J:GetAttribute("PlotNumber")
if nA~=nil then local iF=iE:FindFirstChild(tostring(nA))if iF and ny(iF)then return iF end end for FG,nB in ipairs(iE:GetChildren())do
if ny(nB)then return nB end end end local function dy(nC)local bx=nC and nC.Parent for FH=1,6 do if not bx then return nil end
if bx:IsA("BasePart")then return bx end if bx:IsA("Model")then return bx.PrimaryPart or bx:FindFirstChildWhichIsA("BasePart",true)end
bx=bx.Parent end end local function nD(nE)local iG=nE.Parent if iG and iG:IsA("Attachment")then return iG.WorldPosition end
local nF=dy(nE)return nF and nF.Position end local function nG()local cD=c.plot and c.plot:FindFirstChild("Plate")
if not cD then return nil end if cD:IsA("BasePart")then return cD.Position end if cD:IsA("Model")then return cD:GetPivot().Position end
local nH=cD:FindFirstChildWhichIsA("BasePart",true)return nH and nH.Position end local function nI()local iH={}
local nJ=c.plot and c.plot:FindFirstChild("WaxStations")if nJ then for FI,wm in ipairs(nJ:GetChildren())do local nK=wm:FindFirstChild("SquishyPlaceHolder")
local iI=nK and nK:FindFirstChild("PlacePrompt")if iI and iI:IsA("ProximityPrompt")then iH[#iH+1]=iI end end end
return iH end local function ft()local nL,iJ=nI(),0 for FJ,wn in ipairs(nL)do if wn.Enabled then iJ=iJ+1 end end
local iK=#nL local iL=J:GetAttribute("WaxStations")if type(iL)=="number"and iL>iK then iK=iL end return iJ,iK
end local function wo()local nM=ap()local nN=nM and nM.HumanoidRootPart.Position local iM,nO for FK,iN in ipairs(nI())do
if iN.Enabled then local nP=nD(iN)local nQ=(nP and nN)and(nP-nN).Magnitude or 1e9 if not iM or nQ<nO then iM,nO=iN,nQ end
end end return iM end local function nR()local fu=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fu then return nil end local nS=fu:FindFirstChild("BuyPromptAttachment")local fv=(nS and nS:FindFirstChild("BuyPrompt"))or fu:FindFirstChild("BuyPrompt",true)
if fv and fv:IsA("ProximityPrompt")and fv:IsDescendantOf(fu)then return fv end end local nT={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local wp={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iO="SAB_order.txt"local function fw()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for wq,wr in pairs(aj.price)do aB[#aB+1]="P|"..wq.."|"..string.format("%.0f",wr)end for ws,wt in pairs(aj.order)do aB[#aB+1]="O|"..ws.."|"..table.concat(wt,",")end
if j.learned and j.enc then aB[#aB+1]="M|mode|"..tostring(j.learned.mode or"")for wu,fy in ipairs(j.learned.seq)do
local nU={}for nV=1,fy.n do nU[nV]=j.enc(fy.args[nV])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(wu,fy.m,fy.n,table.concat(nU,";"))
end end local function iP(wv,ww,fz)local nW={}for nX=1,fz.n do nW[nX]=j.enc(fz.args[nX])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(ww,wv,fz.m,fz.n,table.concat(nW,";"))
end if j.enc then for wx,wy in ipairs(D.rec.rules)do iP("rules",wx,wy)end if D.rec.on then iP("on",0,D.rec.on)end
if D.rec.off then iP("off",0,D.rec.off)end end for FL,dz in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dz.name,dz.title or"",dz.rar or"",dz.price and string.format("%.0f",dz.price)or"")
end if pcall(writefile,iO,table.concat(aB,"\n"))then aj.dirty=false end end local function wz()if type(isfile)~="function"or type(readfile)~="function"then return end
local wA,wB=pcall(isfile,iO)if not(wA and wB)then return end local wC,nY=pcall(readfile,iO)if not(wC and type(nY)=="string")then return end
for wD in nY:gmatch("[^\n]+")do local cE,cF,bc=wD:match("^(%a)|([^|]+)|(.*)$")if cE=="P"then aj.price[cF]=tonumber(bc)
elseif cE=="M"then j.loadMode=(bc~=""and bc~="nil")and bc or nil elseif cE=="A"and j.dec then local nZ=tonumber(cF)
local n0,fA,wE=bc:match("^([^|]+)|(%d+)|(.*)$")if nZ and n0 then fA=tonumber(fA)local n1,fB={},0 for wF in(wE..";"):gmatch("([^;]*);")do
fB=fB+1 if fB<=fA then n1[fB]=j.dec(wF)end end j.loadSeq=j.loadSeq or{}j.loadSeq[nZ]={m=n0,n=fA,args=n1}end elseif cE=="R"and j.dec then
local n2=tonumber(cF)local fC,wG,fD,wH=bc:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if n2 and fC then fD=tonumber(fD)
local n3,fE={},0 for wI in(wH..";"):gmatch("([^;]*);")do fE=fE+1 if fE<=fD then n3[fE]=j.dec(wI)end end local iQ={m=wG,n=fD,args=n3}
if fC=="rules"then D.rec.rules[n2]=iQ elseif fC=="on"then D.rec.on=iQ elseif fC=="off"then D.rec.off=iQ end end
elseif cE=="K"then local n4,n5,wJ=bc:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cF)]={name=cF,title=n4~=""and n4 or nil,
rar=n5~=""and n5 or nil,price=tonumber(wJ)}elseif cE=="O"and bc~=""then local fF={}for wK in bc:gmatch("[^,]+")do fF[#fF+1]=wK end
if#fF>0 then aj.order[cF]=fF end end end end local function wL(fG)if type(fG)~="table"then return end local bZ,n6=fG.rarity,fG.contents
if type(bZ)~="string"or bZ==""or type(n6)~="table"then return end local dA={}for FM,fH in ipairs(n6)do if type(fH)=="table"and type(fH.butter)=="string"then
dA[#dA+1]={n=fH.butter,ch=tonumber(fH.chance)or 0}end end if#dA==0 then return end table.sort(dA,function(wM,wN)return wM.ch>wN.ch end)
local dB,dC={},false for wO,wP in ipairs(dA)do dB[wO]=wP.n end local iR=aj.order[bZ]if not iR or#iR~=#dB then dC=true end
if not dC then for n7=1,#dB do if iR[n7]~=dB[n7]then dC=true break end end end aj.order[bZ]=dB local iS=tonumber(fG.price)
if iS and aj.price[bZ]~=iS then aj.price[bZ]=iS dC=true end if dC then aj.dirty=true ad.at=0 A("learned the "..bZ.." order from its crate")
end end local function cG(wQ,wR)local wS=wQ:FindFirstChild(wR,true)local wT,iT=pcall(function()return wS.Text end)
return(wT and type(iT)=="string"and iT~="")and iT or nil end local function ak(n8)return ad.pretty[n8]or n8 end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(wU)return fp(wU or"")end
function L.learn(bd)if type(bd)~="table"or type(bd.name)~="string"then return end local iU=L.key(bd.name)local be=L.seen[iU]or{}
local wV=(L.seen[iU]==nil)or(tonumber(bd.price)and be.price~=tonumber(bd.price))be.name,be.title=bd.name,bd.title or be.title
be.rar,be.price=bd.rarity or be.rar,tonumber(bd.price)or be.price L.seen[iU]=be if wV then L.at,aj.dirty=y(),true end
end function L.wanted(n9)if n9==nil then return false end local iV=L.key(n9)return d.CrateTicks[iV]==true or(d.BestCrate and o.bestCrate~=nil and(iV==o.bestCrate or iV==o.bestCrateTitle))
end function L.list()local cH={}for wW,fI in ipairs(L.base)do cH[L.key(fI[1])]={name=fI[1],title=fI[2],rar=fI[3],i=wW}end
for FN,dD in ipairs(ad.rarOrder)do local n_=false for FO,wX in pairs(cH)do if wX.rar==dD then n_=true break end end
if not n_ and dD~="?"then local oa=dD:gsub("[^%w]","").."Crate"cH[L.key(oa)]={name=oa,title=dD.." Crate",rar=dD,i=50,guess=true}
end end for ob,fJ in pairs(L.seen)do local a4=cH[ob]or{i=100}a4 .name,a4 .title,a4 .rar=fJ.name or a4 .name,fJ.title or a4 .title,fJ.rar or a4 .rar
a4 .price,a4 .guess=fJ.price or a4 .price,nil cH[ob]=a4 end local dE,fK={},{}for wY,wZ in ipairs(nT)do dE[wZ]=wY end
for w0,oc in ipairs(ad.rarOrder)do dE[oc]=dE[oc]or(20+w0)end for w1,dF in pairs(cH)do dF.k=w1 dF.price=dF.price or aj.price[dF.rar or""]
fK[#fK+1]=dF end table.sort(fK,function(b0,b1)if b0 .price and b1 .price and b0 .price~=b1 .price then return b0 .price<b1 .price end
local od,oe=dE[b0 .rar or""]or 99,dE[b1 .rar or""]or 99 if od~=oe then return od<oe end if(b0 .i or 100)~=(b1 .i or 100)then return(b0 .i or 100)<(b1 .i or 100)end
return b0 .k<b1 .k end)return fK end local function w2()local of=af:FindFirstChild("Assets")local og=of and of:FindFirstChild("Squishies")
if not og then return false end local iW,oh,cI={},{},{}local fL=0 for FP,fM in ipairs(og:GetChildren())do local dG=W(fM.Name)
if dG~=""and not iW[dG]then local fN=cG(fM,"RarityText")or"?"iW[dG]=fN oh[dG]=cG(fM,"NameText")or fM.Name cI[fN]=cI[fN]or{}
table.insert(cI[fN],dG)fL=fL+1 end end if fL==0 then return false end for oi,w3 in pairs(cI)do local oj=aj.order[oi]or wp[oi]
local iX={}if oj then for w4,w5 in ipairs(oj)do iX[W(w5)]=w4 end end table.sort(w3,function(ol,om)local iY,iZ=iX[ol],iX[om]
if iY and iZ then return iY<iZ end if iY then return true end if iZ then return false end return ak(ol)<ak(om)
end)end local i0={}for w6,w7 in ipairs(nT)do i0[w7]=w6 end local fO,b2={},{}for w8 in pairs(cI)do fO[#fO+1]=w8 end
pcall(function()for w9,w_ in ipairs(require(af.Modules.SquishyRNG).Keys)do b2[w_]=w9 end end)table.sort(fO,function(cJ,cK)
if b2[cJ]and b2[cK]and b2[cJ]~=b2[cK]then return b2[cJ]<b2[cK]end local i1,i2=aj.price[cJ],aj.price[cK]if i1 and i2 and i1~=i2 then return i1<i2 end
local i3,i4=i0[cJ],i0[cK]if i3 and i4 then return i3<i4 end if i3 then return true end if i4 then return false end
return cJ<cK end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=iW,oh,cI,fO,fL,y()return true end local function i5()
if ad.at==0 or(y()-ad.at)>120 then pcall(w2)end return ad.n>0 end local function xa(xb)local oo=W(xb)return ad.rar[oo]or(V.name and W(V.name)==oo and V.rar)or"?"
end local function xc()local fP={}local xd=((d.Best or 0)>0 and next(o.best or{}))and o.best or d.Targets for xe,xf in pairs(xd)do if xf then fP[#fP+1]=ak(xe)end end
table.sort(fP)return fP end local an={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function op()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fQ(oq)if type(makefolder)~="function"then return end local xg,xh=pcall(isfolder,oq)if not(xg and xh)then pcall(makefolder,oq)end
end local function fR(ot)if type(isfile)~="function"or type(readfile)~="function"then return nil end local xi,xj=pcall(isfile,ot)
if not(xi and xj)then return nil end local xk,xl=pcall(readfile,ot)return xk and xl or nil end local function dH(xm,xn)
if type(writefile)~="function"then return false end return(pcall(writefile,xm,xn))end local function ou(xo)local dI={}
if type(listfiles)~="function"then return dI end local xp,ov=pcall(listfiles,xo)if not xp or type(ov)~="table"then return dI end
for FQ,xq in ipairs(ov)do dI[#dI+1]=tostring(xq)end return dI end local function ow()local fS={}for FR,xr in ipairs(ou(an.cfg))do
local ox=xr:match("([^/\\]+)%.txt$")if ox then fS[#fS+1]=ox end end table.sort(fS)return fS end local function xs()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(d.Every)aa[#aa+1]="N|GlazeLead|"..tostring(d.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(d.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(d.MemLimit)aa[#aa+1]="N|Best|"..tostring(d.Best or 0)for FS,oy in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..oy.."|"..d[oy]end
do local fT={}for xt,dJ in pairs(d.Pets)do local oz=(dJ.b and"b"or"")..(dJ.g and"g"or"")..(dJ.w and"w"or"")..((tonumber(dJ.f)or 0)>0 and tostring(dJ.f)or"")
if oz~=""then fT[#fT+1]=xt.."|"..oz end end table.sort(fT)aa[#aa+1]="P|-"for FT,xu in ipairs(fT)do aa[#aa+1]="P|"..xu end
end for FV,oA in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..oA.."|"..(d[oA]and"1"or"0")end local i6=J:GetAttribute("AutoRollRules")if type(i6)=="string"and i6~=""then d.ARrules,d.ARstop=i6,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then aa[#aa+1]="S|rules|"..d.ARrules aa[#aa+1]="S|stop|"..d.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for FW,i7 in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fU={}for xv,xw in pairs(i7[2])do if xw then fU[#fU+1]=xv end end table.sort(fU)aa[#aa+1]=i7[1].."|-"for FX,xx in ipairs(fU)do aa[#aa+1]=i7[1].."|"..xx end
end return table.concat(aa,"\n")end local function xy(i8)if type(i8)~="string"or i8==""then return false end local oB,oC,oD,oE,dK={},false,{},false,nil
for xz in i8:gmatch("[^\n]+")do local aC,ah,ax=xz:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ah=="Every"then local i9=tonumber(ax)
if i9 and i9>=1 then d.Every=math.floor(i9)end elseif aC=="N"and(ah=="FpsCap"or ah=="MemLimit")then local i_=tonumber(ax)
if i_ and i_>=0 then d[ah]=math.floor(i_)end elseif aC=="N"and ah=="Best"then local fV=tonumber(ax)if fV and fV>=0 and fV<=4 then d.Best=math.floor(fV)end
elseif aC=="N"and ah=="GlazeLead"then local fW=tonumber(ax)if fW and fW>=5 and fW<=600 then d.GlazeLead=math.floor(fW)end
elseif aC=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then d[ah]=ax elseif aC=="P"and ah~=""then
if not dK then dK={}end if ah~="-"and ax~=""then dK[ah]={b=ax:find("b",1,true)and true or nil,g=ax:find("g",1,true)and true or nil,
w=ax:find("w",1,true)and true or nil,f=tonumber(ax:match("%d"))}end elseif aC=="B"then if d[ah]~=nil then d[ah]=(ax=="1")end
elseif aC=="S"and ah=="rules"then d.ARrules=ax elseif aC=="S"and ah=="stop"then d.ARstop=ax elseif aC=="W"then
c.winPos={tonumber(ah)or 10,tonumber(ax)or 44}elseif aC=="G"then c.togPos={tonumber(ah)or 10,tonumber(ax)or 300}
elseif aC=="T"and ah~=""then if ah~="-"then oB[ah]=true end oC=true elseif aC=="K"and ah~=""then if ah~="-"then oD[ah]=true end
oE=true end end if oC then d.Targets=oB end if oE then d.CrateTicks=oD end if dK then d.Pets=dK end return true
end local function fX(cL)if not op()then return false,"this executor cannot write files"end cL=(cL or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cL==""then return false,"give the config a name"end fQ(an.dir)fQ(an.cfg)if not dH(an.cfg.."/"..cL..".txt",xs())then return false,"could not write the file"end
c.config=cL return true,cL end local function oF(fY)local oG=fR(an.cfg.."/"..fY..".txt")if not oG then return false,"no config called "..tostring(fY)end
if not xy(oG)then return false,"that config looks empty"end c.config=fY return true,fY end local function oH(ja)
if ja then fQ(an.dir)dH(an.auto,ja)elseif type(delfile)=="function"then pcall(delfile,an.auto)else dH(an.auto,"")
end c.autoload=ja end local function xA()if c.selfPath then return c.selfPath end local fZ for FY,xC in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",an.dir})do
for FZ,oI in ipairs(ou(xC))do local jb=oI:lower()if jb:sub(-4)==".lua"and(jb:find("sab_farm",1,true)or jb:find("sab farm",1,true))then
fZ=fZ or oI end end end c.selfPath=fZ return fZ end an.stub=[[
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
local function xD()if not op()then return false,"this executor cannot write files"end fQ("autoexec")if not dH(an.exec,an.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local f0=(function()local xE,xF=pcall(function()return game:GetService("TeleportService")end)return xE and xF or nil end)()
local function oJ()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local xG=queueonteleport or queue_on_teleport return(pcall(xG,an.stub))end local function dL(xH)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..xH..")")pcall(fw)if c.autoload then pcall(fX,c.autoload)end local xI=oJ()A(xI and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for F0=1,30 do if not f0 then break end pcall(function()f0:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function xJ()local xK,oK=pcall(function()return game:GetService("GuiService")end)if xK and oK then
pcall(function()T(oK.ErrorMessageChanged:Connect(function()if d.Rejoin then dL("roblox error message")end end))
end)end pcall(function()local oL=game:GetService("CoreGui")local oM=oL and oL:WaitForChild("RobloxPromptGui",15)
local oN=oM and oM:WaitForChild("promptOverlay",15)if oN then T(oN.ChildAdded:Connect(function(xL)if d.Rejoin and tostring(xL.Name):lower():find("errorprompt",1,true)then dL("disconnect prompt")end
end))end end)if f0 then pcall(function()T(f0 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dL("teleport retry")end)end
end))end)end end local function oO(xM)local oP=c.plot and c.plot:FindFirstChild(xM)if not oP then return nil,false end
for F1,jc in ipairs(oP:GetChildren())do if jc:IsA("Model")or jc:IsA("BasePart")then return jc,true end end return nil,true
end local function b3()local by=oO("RolledSquishy")if not by then return nil end return{model=by,name=by.Name,pretty=cG(by,"NameText")or ak(W(by.Name)),
rar=cG(by,"RarityText")or xa(by.Name),price=cG(by,"PriceText")}end local function oQ(jd)return type(jd)=="string"and(ad.rar[W(jd)]~=nil or wc(jd))
end local function ac()local je=oO("SquishyEquipped")if je then c.carrySrc,j.heldAt="model",y()return je.Name,je end
local oR=J.Character if oR then for F2,dM in ipairs(oR:GetDescendants())do if(dM:IsA("Model")or dM:IsA("Tool"))and oQ(dM.Name)then
c.carrySrc,j.heldAt="character",y()return dM.Name,dM end end end local f1=J:GetAttribute("SquishyEquipped")if type(f1)=="string"and f1~=""and oQ(f1)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return f1,nil end c.carrySrc=nil end local function F3()local F4,xN=ac()return xN end local function dN()
local oS=b3()local jf=oS and we(oS.price)local jg=ba()if jf and jg and jg<jf*0.5 then return jg,jf end end local function b4(xO)
du[#du+1]=os.date("%H:%M:%S").." "..xO if#du>40 then table.remove(du,1)end end local function xP(b5,f2)if type(b5)~="string"then return end
b4(("Roll(%s,%s)"):format(b5,tostring(f2)))if b5:lower():find("crate",1,true)then j.rolled,j.rolledAt=b5,y()return
end V.seq=V.seq+1 V.name,V.at=b5,y()V.rar=type(f2)=="string"and f2 or nil c.rolls=c.rolls+1 if aK(b5)then A(("ROLL %s [%s] = TARGET"):format(b5,tostring(f2)))end
end local function xQ(b6)if type(b6)~="table"then return end local f3=b6 .butter or b6 .itemName if type(f3)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=f3,y()if type(b6 .giftId)=="string"then local oT=af:FindFirstChild("Remotes")
local oU=oT and oT:FindFirstChild("GiftThanks")if oU then pcall(function()oU:FireServer(b6 .giftId)end)end end
b4("Gift("..f3 .." from "..tostring(b6 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b6 .fromName),f3))
end local function xR()local oV=af:WaitForChild("Remotes",30)if not c.alive then return end if not oV then A("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local oW=J:GetAttribute("SquishyEquipped")
if type(oW)=="string"and oW~=""then j.heldAt=y()end end))local xX={SquishyRollAnimation=xP,InitSquishy=function(oX)V.init,V.initAt=tostring(oX),y()b4("Init("..tostring(oX)..")")end,
CrateUpdate=function(cM,oY)pcall(wL,cM)pcall(L.learn,cM)if type(cM)=="table"then local xS=oY==true or(j.rolled~=nil and y()-j.rolledAt<15)or j.waiting
if not xS then return end local xT=not j.waiting local xU=j.on j.waiting,j.data,j.at=true,cM,y()j.on=(oY==true)
j.title=tostring(cM.title or cM.name or"crate")if j.on and not xU then j.openedAt,j.byYou=y(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then b4("CrateWindow open("..j.title..")")elseif xT then b4("Crate waiting("..j.title..")")A(j.title.." is waiting on your stand")
end else if j.waiting then b4("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local xV=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,xV)end if j.classify then local xW=y()
task.spawn(function()pcall(j.classify,xW)end)end end end,GiftReceived=xQ,}for f4,xY in pairs(xX)do local jh=oV:FindFirstChild(f4)
if jh and jh:IsA("RemoteEvent")then T(jh.OnClientEvent:Connect(xY))elseif f4~="CrateUpdate"and f4~="GiftReceived"then A("remote "..f4 .." missing")end
end end local function ji()local b7=b3()if b7 then if aK(b7 .name)then return{state="match",shown=b7 .pretty,src="pad",info=b7}
end return{state="skip",info=b7,level="idle",text=("on pad: %s [%s] - not ticked"):format(b7 .pretty,tostring(b7 .rar))}
end if V.name and(y()-V.at)<4 then if aK(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f5(xZ,x0,x1,x2)
local f6=RaycastParams.new()f6 .FilterType=Enum.RaycastFilterType.Exclude local jj={J.Character}for F5,x3 in ipairs(x2 or{})do jj[#jj+1]=x3 end
f6 .FilterDescendantsInstances=jj pcall(function()f6 .RespectCanCollide=true end)local oZ=am:Raycast(Vector3 .new(xZ,x0+4,x1),Vector3 .new(0,-30,0),f6)
return oZ and oZ.Position or nil end local function cN(o0)local o1=o0:FindFirstChildOfClass("Humanoid")return((o1 and o1 .HipHeight)or 2)+o0 .HumanoidRootPart.Size.Y/2+0.2
end local function jk(x4,x5)local jl=x4:FindFirstChildOfClass("Humanoid")local x6=y()while y()-x6<x5 do if jl and(jl.FloorMaterial~=Enum.Material.Air or jl.SeatPart)then return true end
ag(0.05)end return false end local function aD(x7,jm,jn)local o2=x7 .HumanoidRootPart o2 .AssemblyLinearVelocity=Vector3 .new(0,0,0)
o2 .CFrame=jn and CFrame.new(jm,Vector3 .new(jn.X,jm.Y,jn.Z))or CFrame.new(jm)end local function b8(bf,o3)local b9=ap()
if not b9 or not bf then return false end local bz=bf.Position local f7=math.clamp(math.max(bf.Size.X,bf.Size.Z)/2+2.2,3,7)
local o4=(o3 and o3 .MaxActivationDistance)or 10 if f7>o4-2 then f7=math.max(2.5,o4-2)end local dO={}local function b_(dP)
dP=Vector3 .new(dP.X,0,dP.Z)if dP.Magnitude>0.05 then dO[#dO+1]=dP.Unit end end local o5=nG()if o5 then b_(o5-bz)end
b_(bf.CFrame.LookVector)b_(-bf.CFrame.LookVector)b_(bf.CFrame.RightVector)b_(-bf.CFrame.RightVector)b_(b9 .HumanoidRootPart.Position-bz)
if#dO==0 then b_(Vector3 .new(0,0,1))end local x8,f8=cN(b9),false for F6,x9 in ipairs(dO)do local f9=bz+x9*f7
local jo=f5(f9 .X,bz.Y,f9 .Z,{bf})if jo and math.abs(jo.Y-bz.Y)<14 then aD(b9,Vector3 .new(f9 .X,jo.Y+x8,f9 .Z),bz)
if jk(b9,0.7)then f8=true break end end end if not f8 then aD(b9,bz+dO[1]*f7+Vector3 .new(0,3,0),bz)f8=jk(b9,1)
end ag(0.12)return f8 end local function o6(dQ)if not dQ.Parent or not dQ.Enabled then return false end pcall(function()dQ:InputHoldBegin()end)
ag(math.max(dQ.HoldDuration,0)+0.08)pcall(function()dQ:InputHoldEnd()end)return true end local function aq(o7,x_)
local ya=y()while y()-ya<x_ do if o7()then return true end ag(0.05)end return o7()end local function dR(cO,yb,o8,yc)
local yd=c.zapFirst and{"zap","hold"}or{"hold","zap"}for ye,jp in ipairs(yd)do if ye==2 and(yc or not(cO.Parent and cO.Enabled and(not o8 or o8())))then break end
local jq if jp=="hold"then jq=o6(cO)else jq=type(fireproximityprompt)=="function"and cO.Parent~=nil and cO.Enabled and pcall(fireproximityprompt,cO)end
if jq and aq(yb,1.2)then c.zapFirst=(jp=="zap")return true,jp end end return false end local function o9(jr)local bA=nR()
if not bA or not bA.Enabled then A("buy: nothing on the pad")return false end local js=dy(bA)if not js then A("buy: pad part missing")return false end
c.lastBuyAt=y()local yf,o_=V.seq,ba()local pa=ap()local yg=pa and(pa.HumanoidRootPart.Position-js.Position).Magnitude>12
b8(js,bA)if yg then ag(0.4)end if not bA.Enabled then A("buy aborted: pad emptied")return false end local cP=ji()
if not jr and cP.state~="match"then A("buy aborted: "..(cP.text or"pad changed"))c.matchSince=nil return false
end local jt=cP.info and cP.info.name or(cP.state=="match"and V.name)or nil local function yh()return bA.Enabled and ac()==nil and(jr or ji().state=="match")
end local yi,yj=dR(bA,function()return ac()~=nil or((not bA.Enabled)and(jr or V.seq==yf))end,yh,dN()~=nil)if yi then
aq(function()return ac()~=nil end,0.8)local dS=ac()local pb=ba()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dS and ak(W(dS))or(cP.shown or"?"),(o_ and pb)and(" for $"..aL(o_-pb))or"",yj))
if dS and jt and W(dS)~=W(jt)then A(("note: picked up %s, not %s"):format(dS,jt))end return true end local f_=b3()
if dN()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aL(ba()),(f_ and f_.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(f_ and f_.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function pc()local dT=ac()if not dT then c.holding=false A("place: hands are empty")
return false end if not aK(dT)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dT))))return false end
for F7=1,d.PlaceTries do local bB=wo()if not bB then A("place: no free station")break end local pd=dy(bB)if pd then
b8(pd,bB)local pe=ac()if not pe then c.holding=false A("place: hands emptied on the way")return false end if not aK(pe)then A("place: what I carry changed, not waxing it")return false end
if bB.Enabled then local yk,yl=dR(bB,function()return not bB.Enabled end,function()return bB.Enabled end)if yk then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dT)),c.placed,bB.Parent.Parent.Name,yl))if o.placed then pcall(o.placed,dT)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))A(c.capMsg)end return false end function z.place()local ym=y()while c.alive and z.editing and y()-ym<25 do ag(0.2)end
if d.Teams and d.TeamWax~=""then z.placing=true local yn=y()while c.alive and z.current()~=d.TeamWax and y()-yn<5 do ag(0.1)end
if z.current()==d.TeamWax then ag(0.3)else A("wax team did not come on in time - placing anyway")end end local yo,pf=pcall(pc)
z.placing=false if not yo then error(pf,0)end return pf end local function pg(ph)return type(ph)=="string"and ph:lower():find("crate",1,true)~=nil
end local yp={SABFarmGui=1,SABToggle=1,SABError=1}local function ju(yq)local bC=yq while bC do if yp[bC.Name]then return false end
if bC:IsA("ScreenGui")then local yr,ys=pcall(function()return bC.Enabled end)return(not yr)or ys~=false end if bC:IsA("GuiObject")and not bC.Visible then return false end
bC=bC.Parent end return false end local function ga(gb)local cQ=""pcall(function()if gb:IsA("TextButton")then cQ=gb.Text end end)
if not cQ:find("%a")then for F8,gc in ipairs(gb:GetDescendants())do if(gc:IsA("TextLabel")or gc:IsA("TextButton"))and gc.Text:find("%a")then cQ=gc.Text break end
end end if not cQ:find("%a")then cQ=gb.Name end return(cQ:lower():gsub("[^%a]",""))end local function yt()local dU,dV
local pj=J:FindFirstChildOfClass("PlayerGui")if not pj then return nil,nil end for F9,dW in ipairs(pj:GetDescendants())do
if dW:IsA("GuiButton")and ju(dW)then local jv=ga(dW)if jv:sub(1,4)=="open"and not jv:find("shop",1,true)then dU=dU or dW end
if jv:sub(1,7)=="discard"then dV=dV or dW end end end if dU and dV then return dU,dV end if j.on then return dU,dV end
return nil,nil end local jw=(function()local yu,yv=pcall(function()return game:GetService("VirtualInputManager")end)return yu and yv or nil end)()
local function pk(bh,jx)local jy={}local function pl(yw)jy[#jy+1]=yw end if c.tapWay then pl(c.tapWay)end for F_,pm in ipairs({"touch","conn","signal"})do
if pm~=c.tapWay then pl(pm)end end local function pn(yx,...)local yy,jz=pcall(getconnections,yx)if not(yy and type(jz)=="table"and#jz>0)then return false end
local po,yz,yA=false,{...},select("#",...)for Ga,yB in ipairs(jz)do if pcall(function()yB:Fire(table.unpack(yz,1,yA))end)then po=true end
end return po end local function pp()local pq=Vector3 .new(0,0,0)pcall(function()local ps,pt=bh.AbsolutePosition,bh.AbsoluteSize
pq=Vector3 .new(ps.X+pt.X/2,ps.Y+pt.Y/2,0)end)local jA={Position=pq,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jA.UserInputType=Enum.UserInputType.Touch end)pcall(function()jA.UserInputState=Enum.UserInputState.End end)
return jA end for Gb,bi in ipairs(jy)do local dX=false if bi=="conn"and type(getconnections)=="function"then if pn(bh.MouseButton1Click)then
dX=true if aq(jx,1.5)then c.tapWay=bi return true,bi end end dX=pn(bh.Activated,pp(),1)elseif bi=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bh.MouseButton1Click)then if aq(jx,1.5)then c.tapWay=bi return true,bi end end dX=pcall(firesignal,bh.Activated,pp(),1)
elseif bi=="touch"and jw then dX=pcall(function()local pu,pv=bh.AbsolutePosition,bh.AbsoluteSize local pw=0 local px=bh:FindFirstAncestorWhichIsA("ScreenGui")
local yC,yD=pcall(function()return px and px.IgnoreGuiInset end)if not(yC and yD)then pcall(function()pw=game:GetService("GuiService"):GetGuiInset().Y end)
end local py,pz=pu.X+pv.X/2,pu.Y+pv.Y/2+pw jw:SendMouseButtonEvent(py,pz,0,true,game,1)task.wait(0.06)jw:SendMouseButtonEvent(py,pz,0,false,game,1)
end)end if dX and aq(jx,1.5)then c.tapWay=bi return true,bi end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jB(pA)local dY=pA.Parent while dY and dY~=c.plot do if j.NOT[dY.Name]then return false end dY=dY.Parent
end local jC=(pA.ActionText or""):lower()if jC:find("roll",1,true)or jC:find("place",1,true)or jC:find("sell",1,true)then return false end
return true end local function pB()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local pC=c.plot:FindFirstChild("CrateStand")local dZ if pC then for Gc,gd in ipairs(pC:GetDescendants())do
if gd:IsA("ProximityPrompt")and gd.Enabled and jB(gd)then dZ=gd break end end end if not dZ then for Gd,bD in ipairs(c.plot:GetDescendants())do
if bD:IsA("ProximityPrompt")and bD.Enabled and jB(bD)then local pD=bD:FindFirstAncestorWhichIsA("Model")local yE=((bD.ActionText or"").." "..(bD.ObjectText or"").." "..bD.Name.." "..(pD and pD.Name or"")):lower()
if yE:find("crate",1,true)then dZ=bD break end end end end j.prompt=dZ return dZ end local function jD()if j.on then return true end
local d0=pB()if not d0 then j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local pE=dy(d0)if pE then b8(pE,d0)end j.ours=true dR(d0,function()return j.on end)if aq(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: pressed "..fr(d0).." but no window came up")
return false end do local function yF(pF)local cR=pF.Parent while cR and cR:IsA("GuiObject")do local pG,pH=false,false
for Ge,d1 in ipairs(cR:GetDescendants())do if d1~=pF and d1:IsA("GuiButton")and ga(d1):sub(1,7)=="discard"then pG=true end
if d1:IsA("TextLabel")then local jE=d1 .Text:lower()if jE:find("crate",1,true)or jE:find("can contain",1,true)or jE:find("cost",1,true)then pH=true end
end if pG and pH then return cR end end cR=cR.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local pI=J:FindFirstChildOfClass("PlayerGui")if not pI then return nil end for Gf,ge in ipairs(pI:GetDescendants())do
if ge:IsA("GuiButton")and not ge:FindFirstAncestor("SABFarmGui")and ga(ge):sub(1,4)=="open"then local jF=yF(ge)
if jF then j.win=jF return jF end end end end local function yG(yH)for Gg,gf in ipairs(yH:GetDescendants())do
if gf:IsA("GuiButton")then local pJ,jG=ga(gf),gf.Name:lower()if pJ=="x"or pJ=="close"or jG=="x"or jG:find("close",1,true)or jG:find("exit",1,true)then return gf end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(yI)task.wait(yI and 4 or 1.2)if j.on or j.waiting then return end
local gg=j.findWin()if not gg or not ju(gg)then return end local pK=yG(gg)if pK and pk(pK,function()return not ju(gg)end)then return end
A("the crate window is still open - tap its X")end end local function d2(gh)if not jD()then return false end local pL=y()-(j.openedAt or 0)
if pL<0.6 then ag(0.6-pL)end local jH=j.title local yJ,yK=yt()local pM=gh and yJ or yK if not pM then j.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(gh and"Open"or"Discard",jH))return false
end local yL=ac()local yM,Gh=pk(pM,function()return(not j.on)or(ac()~=nil and ac()~=yL)end)if not yM then j.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(gh and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gh then c.crates=c.crates+1 aq(function()return ac()~=nil end,1.5)local pN=ac()
A(("OPENED %s -> %s"):format(jH,pN and ak(W(pN))or"?"))else A("discarded "..jH.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(yN,...)local yO=select("#",...)j.calls[#j.calls+1]={t=y(),m=yN,n=yO,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aE,bj)local bE=type(aE)if(bE=="string"or bE=="number")and type(bj.data)=="table"then for pO,jI in pairs(bj.data)do
if jI==aE and type(pO)=="string"and(type(jI)=="string"or type(jI)=="number")then return{__slot="f:"..pO}end end
end if bE=="string"then if bj.crate and aE==bj.crate then return{__slot="crate"}end if bj.title and aE==bj.title then return{__slot="title"}end
if bj.rar and aE==bj.rar then return{__slot="rarity"}end return aE end if bE=="number"or bE=="boolean"or bE=="nil"then return aE end
if bE=="table"then local pP={}for yP,pQ in pairs(aE)do if type(pQ)=="table"then return nil,"nested table"end local yQ,pR=j.slot(pQ,bj)
if pR then return nil,pR end pP[yP]=yQ end return pP end local yR,yS=pcall(function()return aE:IsA("Instance")end)
if yR and yS then if aE==J then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gi=c.plot and c.plot:FindFirstChild("CrateStand")if gi and aE==gi then return{__slot="stand"}end if gi and aE.Parent==gi then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bE..")"end function j.resolve(gj)if type(gj)~="table"then return gj end
local aS=gj.__slot if aS and aS:sub(1,2)=="f:"then return j.data and j.data[aS:sub(3)]end if aS=="crate"then return j.data and j.data.name end
if aS=="title"then return(j.data and j.data.title)or j.title end if aS=="rarity"then return j.data and j.data.rarity end
if aS=="player"then return J end if aS=="plot"then return c.plot end if aS=="stand"or aS=="model"then local jJ=c.plot and c.plot:FindFirstChild("CrateStand")
if aS=="stand"or not jJ then return jJ end for Gi,pS in ipairs(jJ:GetChildren())do if pg(pS.Name)then return pS end end
return nil end local pT={}for yT,yU in pairs(gj)do pT[yT]=j.resolve(yU)end return pT end function j.classify(jK)
if j.directOff then return end local gk={}for Gj,jL in ipairs(j.calls)do if jL.t<=jK+0.05 and jK-jL.t<=6 then gk[#gk+1]=jL end
end if#gk==0 then return end if not aq(function()return(j.heldAt or 0)>=jK-1 end,2.5)then return end local d3={}
for Gk,d4 in ipairs(gk)do local pU={}for pV=1,d4 .n do local yV,pW=j.slot(d4 .args[pV],d4)if pW then A("crate call has "..pW.." - keeping the button method")
return end pU[pV]=yV end d3[#d3+1]={m=d4 .m,n=d4 .n,args=pU}end local jM=j.learned j.learned={seq=d3,mode=jM and jM.mode or nil}
aj.dirty=true if not jM then A(("learned how to open crates directly (%d call%s)"):format(#d3,#d3==1 and""or"s"))end
end function j.replay()local pX=j.learned local pY=af:FindFirstChild("Remotes")local jN=pY and pY:FindFirstChild("CrateAction")
if not(pX and jN)then return false end local pZ=table.unpack or unpack j.replaying=true for Gl,d5 in ipairs(pX.seq)do
local jO={}for p0=1,d5 .n do jO[p0]=j.resolve(d5 .args[p0])end task.spawn(function()pcall(function()if d5 .m=="InvokeServer"then jN:InvokeServer(pZ(jO,1,d5 .n))
else jN:FireServer(pZ(jO,1,d5 .n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(yW)return(yW:gsub("[%%|;=,\n]",function(yX)return("%%%02X"):format(yX:byte())end))end
function j.enc(ca)local gl=type(ca)if gl=="string"then return"s"..j.esc(ca)end if gl=="number"then return"n"..tostring(ca)end
if gl=="boolean"then return ca and"b1"or"b0"end if gl=="nil"then return"z"end if ca.__slot then return"k"..ca.__slot end
local jP={}for yY,yZ in pairs(ca)do jP[#jP+1]=j.enc(yY).."="..j.enc(yZ)end return"t"..table.concat(jP,",")end
function j.dec(p1)local d6,d7=p1:sub(1,1),p1:sub(2)local function y0(y1)return(y1:gsub("%%(%x%x)",function(y2)return string.char(tonumber(y2,16))end))end
if d6=="s"then return y0(d7)end if d6=="n"then return tonumber(d7)end if d6=="b"then return d7=="1"end if d6=="k"then return{__slot=d7}end
if d6=="t"then local p2={}for y3 in d7:gmatch("[^,]+")do local p3,y4=y3:match("^(.-)=(.*)$")if p3 then local p4=j.dec(p3)
if p4~=nil then p2[p4]=j.dec(y4)end end end return p2 end return nil end function j.goneOrNew(y5)return function()
if not j.waiting then return true end local p5=ac()return p5~=nil and p5~=y5 end end function j.near()local p6=af:FindFirstChild("Remotes")
local jQ=p6 and p6:FindFirstChild("CrateAction")local gm=ap()local jR=c.plot and c.plot:FindFirstChild("CrateStand")
local jS=jR and jR:FindFirstChild("Spot")if not(jQ and gm and jS)then A(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not jQ and"no CrateAction remote"or not gm and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jT=gm.HumanoidRootPart local gn=jT.CFrame local p7,jU=j.title,"no answer"local y6=ac()local p8=jR:FindFirstChild("Holder")
local function p9()if not p8 then return j.waiting or j.on end for Gm,y7 in ipairs(p8:GetChildren())do if y7:IsA("Model")then return true end end
return false end for y8=1,3 do if not(j.waiting or j.on)or not p9()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end if(jT.Position-jS.Position).Magnitude>8 then b8(jS,j.prompt)end ag(0.12+0.15*y8)
local a5={}j.replaying=true task.spawn(function()a5 .ok,a5 .v=pcall(function()return jQ:InvokeServer("open")end)
a5 .done=true end)aq(function()return a5 .done end,6)j.replaying=false local cb=a5 .v if a5 .done and a5 .ok and type(cb)=="table"and cb.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(p7,cb.prize and ak(W(tostring(cb.prize)))or"?"))
aq(function()local p_=ac()return p_~=nil and p_~=y6 end,1.5)if(jT.Position-gn.Position).Magnitude>8 then pcall(function()aD(gm,gn.Position,gn.Position+gn.LookVector)end)end
return true,"opened"end jU=(a5 .done and a5 .ok and type(cb)=="table")and tostring(cb.reason or"refused, no reason given")
or(a5 .done and("error: "..tostring(cb))or"no answer in 6s")ag(0.3)if not p9()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(p7,jU))
return false,jU end j.GIVEUP=600 function j.drop()local qa=af:FindFirstChild("Remotes")local qb=qa and qa:FindFirstChild("CrateAction")
local qc=c.plot and c.plot:FindFirstChild("CrateStand")local jV=qc and qc:FindFirstChild("Spot")local qe=ap()
if jV and qe and(qe.HumanoidRootPart.Position-jV.Position).Magnitude>8 then b8(jV,j.prompt)ag(0.3)end local jW,bk=false,nil
if qb then jW,bk=pcall(function()return qb:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(jW and type(bk)=="table"and bk.ok)and"done"or("answer: "..tostring(type(bk)=="table"and(bk.reason or bk.ok)or bk))))
j.waiting,j.on,j.quietUntil=false,false,y()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(jW and type(bk)=="table"and bk.ok)then d2(false)end end function j.smart()local jX=j.title if(j.nearFails or 0)<3 then
local y9=j.near()if y9 then return true end if j.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local cc=j.learned if cc then local jY=ac()if j.on then j.replay()if aq(j.goneOrNew(jY),3.5)then c.crates=c.crates+1
A("OPENED "..jX.." (direct)")return true end else if cc.mode~="window"then j.replay()if aq(j.goneOrNew(jY),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="direct"then cc.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..jX.." (direct, no window)")return true end end if jD()then j.replay()if aq(j.goneOrNew(jY),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="window"then cc.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..jX.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,aj.dirty=cc,nil,true
if j.fails>=3 then j.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return d2(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for y_,qf in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(qf):Connect(function()D.cache[y_]=J:GetAttribute(qf)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(za,...)local go=D.cache
local zb={m=za,n=select("#",...),args={...},before={rules=go.rules,stop=go.stop,on=go.on,main=go.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,zb)end end)end function D.learnOne(d8)local ay,d9=D.snap(),d8 .before local gp=(ay.rules~=d9 .rules)or(ay.stop~=d9 .stop)
local qg=(ay.on~=d9 .on)or(ay.main~=d9 .main)if not gp and not qg then return end local qh={}for qi=1,d8 .n do
local aM=d8 .args[qi]local cd=type(aM)if cd=="string"and aM~=""and aM==ay.rules then aM={__slot="rules"}elseif cd=="string"and aM~=""and gp and aM==ay.stop and ay.stop~=d9 .stop then aM={__slot="stop"}
elseif cd=="table"then local qj={}for zc,cS in pairs(aM)do if type(cS)=="table"or(type(cS)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end qj[zc]=(type(cS)=="string"and cS~=""and cS==ay.rules)and{__slot="rules"}or cS end aM=qj elseif cd~="string"and cd~="number"and cd~="boolean"and cd~="nil"then
if aM==J then aM={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end qh[qi]=aM
end local cT={m=d8 .m,n=d8 .n,args=qh}if gp then local jZ=false for zd=1,cT.n do local d_=cT.args[zd]if type(d_)=="table"and d_.__slot=="rules"then jZ=true end
if type(d_)=="table"and not d_.__slot then for Gn,qk in pairs(d_)do if type(qk)=="table"and qk.__slot=="rules"then jZ=true end end
end end if jZ then D.rec.rules={cT}else table.insert(D.rec.rules,cT)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if qg then if ay.on==true then D.rec.on=cT else D.rec.off=cT end d.AutoRoll=(ay.on==true)end if ay.rules and ay.rules~=""then d.ARrules,d.ARstop=ay.rules,ay.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gp and"choices"or(ay.on and"on"or"off")))end
function D.resolve(cU)if type(cU)~="table"then return cU end if cU.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cU.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cU.__slot=="player"then return J end
local ql={}for ze,zf in pairs(cU)do ql[ze]=D.resolve(zf)end return ql end function D.replay(qm,zg)local qo=table.unpack or unpack
for Go,ea in ipairs(zg)do local j0={}for qp=1,ea.n do j0[qp]=D.resolve(ea.args[qp])end D.replaying=true pcall(function()
if ea.m=="InvokeServer"then task.spawn(function()pcall(function()qm:InvokeServer(qo(j0,1,ea.n))end)end)else qm:FireServer(qo(j0,1,ea.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(qq,zh)if D.busy or not c.alive then return end D.busy=true
pcall(function()local qr=af:FindFirstChild("Remotes")local j1=qr and qr:FindFirstChild("AutoRollAction")if not j1 then D.msg="this game has no AutoRollAction"return end
local bF=d.AutoRoll if bF and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(j1,D.rec.rules)
if aq(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bF==D.isOn()or(not bF and not zh)then return end
local gq=bF and D.rec.on or D.rec.off if not gq then local eb=bF and D.rec.off or D.rec.on local qs=eb~=nil for zi=1,eb and eb.n or 0 do
if type(eb.args[zi])=="boolean"then qs=false end end if qs then gq=eb end end if not gq then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bF and"on"or"off")
A(D.msg)return end D.replay(j1,{gq})if aq(function()return D.isOn()==bF end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bF and"ON"or"OFF",qq and(" ("..qq..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local zj,zk=pcall(function()return J.UserId end)return zj and zk or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local zl,j2=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if zl and type(j2)=="table"and type(j2 .Pets)=="table"then q.I=j2 end return q.I end function q.order()if q.list then return q.list end
local bG=q.info()if not bG then return{}end local ce={}if type(bG.Order)=="table"and#bG.Order>0 then for Gp,qt in ipairs(bG.Order)do if bG.Pets[qt]then ce[#ce+1]=qt end end
else for zm in pairs(bG.Pets)do ce[#ce+1]=zm end table.sort(ce,function(zn,zo)return(bG.Pets[zn].price or 0)<(bG.Pets[zo].price or 0)end)
end q.list=ce return ce end function q.nice(qu,j3)local qv=q.info()local qw=qv and qv.Pets[qu]return((j3 and j3~="")and(j3 .." ")or"")..(qw and qw.displayName or tostring(qu))
end function q.data()local gr=J:GetAttribute("PetsData")if type(gr)~="string"then return nil end if gr==q.rawD then return q.lastD end
local zp,ec=pcall(function()return q.HS:JSONDecode(gr)end)ec=(zp and type(ec)=="table")and ec or nil q.rawD,q.lastD=gr,ec
return ec end function q.pen()return af:FindFirstChild("PetMeadowSpawns")end function q.srv()return am:GetServerTimeNow()end
function q.money()local j4=J:FindFirstChild("MoneyValue")if j4 and type(j4 .Value)=="number"then return j4 .Value end
return ba()or 0 end function q.wishes()local qx=q.pen()local qy=qx and qx:GetAttribute("Wishes")local j5,qz={},q.srv()
if type(qy)~="string"then return j5 end local zq,qA=pcall(function()return q.HS:JSONDecode(qy)end)if zq and type(qA)=="table"then
for zr,j6 in pairs(qA)do if type(j6)=="number"and j6>qz then j5[zr]=j6-qz end end end return j5 end function q.call(...)
local qB=af:FindFirstChild("Remotes")local qC=qB and qB:FindFirstChild("PetRequest")if not qC then return nil end
local qD=table.pack(...)local cf={}task.spawn(function()cf.ok,cf.v=pcall(function()return qC:InvokeServer(table.unpack(qD,1,qD.n))end)
cf.done=true end)local zs=y()while not cf.done and y()-zs<6 do task.wait(0.05)end if cf.done and cf.ok then return cf.v end
return nil end function q.want(zt)return d.Pets[zt]end function q.closeNaming(j7)local qF=pcall(function()local qE=J:FindFirstChild("PlayerScripts")
local zu=qE and qE:FindFirstChild("Naming",true)require(zu).close()end)ag(0.5)if j7 .Visible then pcall(function()local qG=j7:FindFirstChild("NameBox",true)if qG then qG:ReleaseFocus()end end)
j7 .Visible=false qF=false end return qF end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qH=J:FindFirstChildOfClass("PlayerGui")
local qI=qH and qH:FindFirstChild("MainGui")local gs=qI and qI:FindFirstChild("PetNameGui")if gs and gs.Visible then
ag(0.4)if gs.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gs)break end end ag(0.25)end
q.namingOn=false end)end function q.buyTick()if not d.PetBuy then q.buyMsg="auto adopt is off"return end local j8,qJ,gt=q.info(),q.pen(),q.data()
if not(j8 and qJ and gt)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local ed,j9=#(gt.pets or{}),tonumber(gt.maxOwned)or 60
local zv,qK,ee=q.srv(),{},nil for Gq,aT in ipairs(qJ:GetChildren())do qK[aT.Name]=true local cg,gu=aT:GetAttribute("Pet"),aT:GetAttribute("Variant")or""
local j_=cg and q.want(cg)if j_ and j_.b and j8 .Pets[cg]and(not j_.g or gu=="Big")and C.wantMore(cg,gu,gt)and not aT:GetAttribute("A_"..q.uid)
and(tonumber(aT:GetAttribute("ExpiresAt"))or 0)>zv+1 and y()>=(q.tryAt[aT.Name]or 0)then local ef,qL=q.nice(cg,gu),j8 .Pets[cg].price or 0
if ed>=j9 then ee=("%s is in the pen, but you have %d/%d pets"):format(ef,ed,j9)q.tryAt[aT.Name]=y()+15 elseif q.money()<qL then
ee=("%s is in the pen - need $%s"):format(ef,aL(qL))q.tryAt[aT.Name]=y()+5 else q.tryAt[aT.Name]=y()+8 local bH=q.call("adopt",aT.Name)
if type(bH)=="table"and bH.ok then ed=ed+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local zw=type(bH.pet)=="table"and bH.pet or{}
table.insert(q.recent,{id=tostring(zw.id or("?"..y())),name=cg,variant=gu,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..ef)q.skipNaming()ee="adopted "..ef else local qM=type(bH)=="table"and tostring(bH.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(ef,qM))ee="adopt failed: "..qM if type(bH)=="table"and bH.bagFull then q.tryAt[aT.Name]=y()+60 end
end end end end for qN in pairs(q.tryAt)do if not qK[qN]then q.tryAt[qN]=nil end end q.buyMsg=ee or("watching the pen (%d/%d pets)"):format(ed,j9)
end function q.wishTick()if not d.PetWish then q.wishMsg="auto wish is off"return end local gv=q.info()if not(gv and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local cj,ka,bI=q.wishes(),0,nil local zx=(type(gv.Wish)=="table"and gv.Wish.cashShare)or 2
local zy=q.data()for Gr,aA in ipairs(q.order())do local qO=q.want(aA)if qO and qO.w and C.wantMore(aA,"",zy)then
ka=ka+1 if not cj[aA]and y()>=(q.wishTry[aA]or 0)then local kb=tonumber(J:GetAttribute("PetWishCredits"))or 0
local kc=math.floor((gv.Pets[aA].price or 0)*zx)if kb<=0 and q.money()<kc then q.wishTry[aA]=y()+10 bI=("need $%s to wish for %s"):format(aL(kc),q.nice(aA))
q.wishWhy[aA]=bI else q.wishTry[aA]=y()+3 local zz=kb>0 and"wishCredit"or"wish"local gw=q.call(zz,aA)if type(gw)=="table"and gw.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),kb>0 and"free wish"or("$"..aL(kc))))
else local kd=type(gw)=="table"and tostring(gw.reason or"no reason given")or"no answer"if kd:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),kd))bI="wish failed: "..kd end end end end end end if not bI then
for Gs,gx in ipairs(q.order())do local qP=q.want(gx)if qP and qP.w and not cj[gx]and q.wishWhy[gx]then bI=q.wishWhy[gx]break end
end end if not bI then local cV={}for Gt,gy in ipairs(q.order())do local qQ=q.want(gy)if qQ and qQ.w and cj[gy]then cV[#cV+1]=("%s %dm"):format(q.nice(gy),math.ceil(cj[gy]/60))end
end local gz for Gu,gA in ipairs(q.order())do local qR=q.want(gA)if qR and qR.w and cj[gA]and(not gz or cj[gA]<gz)then gz=cj[gA]end
end bI=ka==0 and"no pet has WISH ticked"or(#cV==0 and"running: none yet")or(#cV<=3 and("running: "..table.concat(cV,", ")))
or("%d running, the next one ends in %dm"):format(#cV,math.ceil((gz or 0)/60))end q.wishMsg=bI end z.switches,z.glazed,z.finished=0,0,0
z.done,z.doneN,z.later={},0,{}function z.teams()local ke=q.data()return(ke and ke.teams)or{},ke end function z.current(cW)
cW=cW or q.data()if not cW then return""end local qS={}for Gv,zA in ipairs(cW.equipped or{})do qS[tostring(zA)]=true end
for Gw,qT in ipairs(cW.teams or{})do local qU=qT.pets or{}local kf=#qU==#(cW.equipped or{})if kf then for Gx,zB in ipairs(qU)do if not qS[tostring(zB)]then kf=false break end end end
if kf then return qT.name end end return""end function z.equip(kg)local zC,zD=z.teams()local kh for zE,zF in ipairs(zC)do if zF.name==kg then kh=zE break end end
if not kh then z.msg="no saved team called "..tostring(kg)return false end if z.current(zD)==kg then return true end
for Gy=1,4 do local qV=q.call("teamEquip",kh)if type(qV)=="table"and qV.ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(zG)local qW=zG:FindFirstChild("SquishyPlaceHolder")local qX=qW and qW:FindFirstChild("TimerGui")
local qY=qX and qX:FindFirstChildWhichIsA("TextLabel",true)local ki=qY and qY.Text if type(ki)~="string"or ki:find("-",1,true)then return nil end
local kj,qZ,q0=ki:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not kj then return nil end local q1=q0~=""and(tonumber(kj)*3600+tonumber(qZ)*60+tonumber(q0))or(tonumber(kj)*60+tonumber(qZ))
return q1>0 and q1 or nil end function z.waxes()local eg={}local q2=c.plot and c.plot:FindFirstChild("WaxStations")
if not q2 then return eg end local q3=q.srv()for Gz,a6 in ipairs(q2:GetChildren())do local kk=tonumber(a6:GetAttribute("PourEnd"))
local q4=a6:GetAttribute("PourOwner")if a6:GetAttribute("HasSquishy")and a6:GetAttribute("PourId")and(q4==nil or q4==q.uid)then
local kl=z.left(a6)local q5=kl and(q3+kl)or((kk and kk>q3)and kk or nil)if q5 then local q6,q7=a6:FindFirstChild("SquishyPlaceHolder"),"?"
if q6 then for GA,q8 in ipairs(q6:GetChildren())do if q8:IsA("Model")then q7=q8 .Name break end end end local zH=tostring(a6:GetAttribute("Helpers")or"")
local km=0 for GB in zH:gmatch("%d+")do km=km+1 end eg[#eg+1]={st=a6,ends=q5,sure=kl~=nil,id=a6:GetAttribute("PourId"),name=q7,helps=km,
long=a6:GetAttribute("PourLong")==true}end end end table.sort(eg,function(zI,zJ)return zI.ends<zJ.ends end)return eg
end function z.glazeCount()local q9=af:FindFirstChild("Remotes")local q_=q9 and q9:FindFirstChild("EditStack")
if not q_ then return nil end local zK,eh=pcall(function()return q_:InvokeServer("State",nil)end)if not(zK and type(eh)=="table"and type(eh.state)=="table")then return nil end
local kn,ko=0,{}for GC,gB in ipairs(eh.state.entries or{})do if gB.glaze and gB.glaze~=""then kn=kn+1 ko[gB.glaze]=(ko[gB.glaze]or 0)+1 end
end return kn,ko,#(eh.state.entries or{}),eh.state.capacity end function z.finishedOne(gC,ra)z.finished=z.finished+1
task.wait(2)local kp,zL,rb,zM=z.glazeCount()if kp and ra and kp>ra then z.glazed=z.glazed+1 local kq={}for zN,zO in pairs(zL)do kq[#kq+1]=zN.." "..zO end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gC.name)),gC.st.Name,kp,table.concat(kq,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gC.st.Name,ak(W(gC.name)),rb and(" (stack "..rb.."/"..tostring(zM)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not d.Teams then z.want,z.msg="","auto teams is off"return end
local ck=q.srv()local aF=z.glazeFor if aF then local ei=aF.st local rc=ei.Parent and ei:GetAttribute("HasSquishy")and ei:GetAttribute("PourId")==aF.id
local rd=rc and z.left(ei)if rd then aF.ends=ck+rd end if not rc then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local zP=aF.before
task.spawn(function()pcall(z.finishedOne,aF,zP)end)end elseif aF.ends-ck>d.GlazeLead*3+60 or ck>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(ei.Name,z.clock(aF.ends-ck)))
end end if d.TeamGlaze~=""and not z.glazeFor then local zQ=z.speedRatio(d.TeamGlaze)for GD,cl in ipairs(z.list)do
if cl.sure and(cl.ends-ck)*zQ[cl.long and 2 or 1]<=d.GlazeLead and y()>=(z.later[cl.id or"?"]or 0)and not z.done[cl.id or"?"]then
z.glazeFor=cl task.spawn(function()cl.before=z.glazeCount()end)break end end end local aG,ej="",""local cX=d.SnapGlaze~=false and o.snapAt and(o.snapAt-ck)
if cX and cX<-8 then o.snapAt,cX=nil,nil end if d.TeamGlaze~=""and cX and cX<=20 then aG,ej=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cX)))
elseif d.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ej=d.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ej=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and z.allBusy()then
aG,ej=d.TeamFull," - every station is busy"else aG=d.TeamNormal end z.want=aG local ek=z.current()z.cur=ek if aG~=""and ek~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ej)else z.nextTry=y()+3 end end local kr=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(ek~=""and ek or"(not a saved team)",(aG~=""and aG~=ek)and(" -> "..aG)or"",
kr and("in "..z.clock(kr.ends-ck).." (st "..kr.st.Name..")")or"- none running")end function z.clock(bJ)bJ=math.max(0,math.floor(bJ))
if bJ>=3600 then return("%d:%02d:%02d"):format(math.floor(bJ/3600),math.floor((bJ%3600)/60),bJ%60)end return("%d:%02d"):format(math.floor(bJ/60),bJ%60)
end function z.allBusy()local zR,zS=ft()return zS>0 and zR==0 end function z.aboutToPlace()if not c.running then return false end
local rf=ac()if not(rf and aK(rf))then return false end local zT=ft()return zT>0 end function z.mult(rg,zU,rh)return{(1+rg)*(1+rh),(1+rg+zU)*(1+rh)}end
function z.speedNow()local function ks(zV)return tonumber(J:GetAttribute(zV))or 0 end return z.mult(ks("PetWaxSpeed"),ks("PetLongWax"),ks("PetSocialWax"))
end function z.speedOf(zW)local zX,ri=z.teams()if not ri then return nil end for GE,rj in ipairs(zX)do if rj.name==zW then
local kt={}for GF,zY in ipairs(rj.pets or{})do for GG,rk in ipairs(ri.pets or{})do if tostring(rk.id)==tostring(zY)then kt[#kt+1]=rk break end end
end local rl=C.caps()local rm,zZ=C.stats(kt)return z.mult(math.min(rm.waxSpeed or 0,rl.waxSpeed or 0.25),math.min(rm.longWax or 0,rl.longWax or 0.3),zZ.socialWax or 0)
end end return nil end function z.speedRatio(z0)local rn,ku=z.speedNow(),z.speedOf(z0)if not ku then return{1,1}end
return{rn[1]/ku[1],rn[2]/ku[2]}end function z.glazeSoon()return d.Teams and d.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local kv=q.info()return(kv and type(kv.Caps)=="table")and kv.Caps or C.CAPS
end function C.value(ro,kw)local gD=q.info()local cY=gD and gD.Pets[ro]if not(cY and type(cY.boost)=="table")then return nil end
local cm if type(gD.boostValue)=="function"then local z1,z2=pcall(gD.boostValue,ro,(kw~=""and kw)or nil)cm=z1 and tonumber(z2)or nil
end if not cm then cm=cY.boost.value or 0 if kw=="Big"then local rp=cm*1.5 cm=C.ROUND[cY.boost.kind]and math.max(cm+1,math.floor(rp+0.5))or rp
end end return cY.boost.kind,cm,cY.boost.every end function C.stats(z3)local cn,kx={},{}for GH,rq in ipairs(z3)do
local aU,gE,rr=C.value(rq.name,rq.variant or"")if aU then if aU:sub(1,6)=="social"then kx[aU]=math.max(kx[aU]or 0,gE)
elseif aU=="waxStir"or aU=="cashGift"then cn[aU]=(cn[aU]or 0)+gE*60/(rr or 60)elseif aU=="luckyPull"then cn.luckyPull=(cn.luckyPull or 0)+gE/(rr or 10)
else cn[aU]=(cn[aU]or 0)+gE end end end return cn,kx end function C.glazeGain(z4,gF)local el,ky,GI={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local z5=el[1]+el[2]+el[3]local z6=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cZ={}for gG=1,3 do cZ[gG]=el[gG]+z4*el[gG]/z5+(gG==1 and z6 or 0)end
local kz={cZ[1]*(1-gF),cZ[2]*(1-gF)+cZ[1]*gF,cZ[3]+cZ[2]*gF}return kz[1]*(ky[1]-1)+kz[2]*(ky[2]-1)+kz[3]*(ky[3]-1)
end function C.score(gH,z7)local kA=C.caps()local gI,gJ=C.stats(z7)local function bl(rs)return math.min(gI[rs]or 0,kA[rs]or math.huge)end
local z8=(1+bl("income"))*(1+(gJ.socialIncome or 0))*(1+math.min(gI.cashGift or 0,kA.cashGiftPerMinute or 9)/60)
local z9=1+bl("luck")+(gI.luckyPull or 0)+(gJ.socialLuck or 0)local rt=z9*(1+bl("newFind"))*(1+bl("rollSpeed"))
local em=math.log(z8)local z_=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local kB=(1+bl("waxSpeed")+bl("longWax"))*(1+(gJ.socialWax or 0))
+math.min(gI.waxStir or 0,kA.waxStirPerMinute or 30)/60/z_ local Aa=1-(1-bl("headStart"))*(1-(gJ.socialHeadStart or 0))
if gH=="farm"then return em+0.7*math.log(rt)+0.1*math.log(kB)end if gH=="full"then return em+0.4*math.log(kB)+0.02*math.log(rt)end
if gH=="glaze"then return C.glazeGain(bl("glaze"),bl("glazeUp"))+0.001*em end if gH=="wax"then return-math.log(1-0.5*Aa)+0.001*em+0.001*math.log(kB)end
return em end function C.best(ru,c0,Ab,kC)kC=kC or{}local az,en={},{}local function rv(Ac)local rw={}for Ad,Ae in ipairs(Ac)do rw[Ad]=c0[Ae]end return rw end
local function kD(rx)local kE=C.score(ru,rv(rx))for GJ,Af in ipairs(rx)do if kC[c0[Af].id]then kE=kE+1e-7 end end
return kE end for GK=1,math.min(Ab,#c0)do local gK,kF for kG=1,#c0 do if not en[kG]then az[#az+1]=kG local ry=kD(az)
az[#az]=nil if not kF or ry>kF+1e-12 then gK,kF=kG,ry end end end if not gK then break end en[gK]=true az[#az+1]=gK
end for GL=1,6 do task.wait()local rz,rA=false,kD(az)for kH=1,#az do for kI=1,#c0 do if not en[kI]then local rB=az[kH]
az[kH]=kI local rC=kD(az)if rC>rA+1e-9 then en[rB],en[kI],rA,rz=nil,true,rC,true else az[kH]=rB end end end end
if not rz then break end end local rD={}for Ag,Ah in ipairs(az)do rD[Ag]=tostring(c0[Ah].id)end return rD,C.score(ru,rv(az))
end function C.count(rE,rF,Ai)local eo,ep={},0 local rG,rH={},{}for GM,Aj in ipairs(rF.arriving or{})do rG[tostring(Aj)]=true end
for GN,c1 in ipairs(rF.pets or{})do rH[tostring(c1 .id)]=true if c1 .name==rE and not rG[tostring(c1 .id)]then
if c1 .variant=="Big"then ep=ep+1 elseif(c1 .variant or"")==""then eo[#eo+1]=c1 end end end if not Ai then for GO,eq in ipairs(q.recent or{})do
if eq.name==rE and not rH[eq.id]and y()-eq.at<20 then if eq.variant=="Big"then ep=ep+1 else eo[#eo+1]=eq end end
end end return eo,ep end function C.goal(Ak)local rI=d.Pets[Ak]return rI and tonumber(rI.f)or 0 end function C.wantMore(rJ,Al,rK)
local kJ=C.goal(rJ)if kJ<=0 or not rK then return true end local Am,rL=C.count(rJ,rK)if rL>=kJ then return false end
if Al=="Big"then return true end return#Am<C.need()*(kJ-rL)end function C.status(rM,rN)local gL=C.goal(rM)if gL<=0 or not rN then return nil end
local An,kK=C.count(rM,rN)if kK>=gL then return("Big %d/%d done"):format(kK,gL)end return("%d/%d to fuse, Big %d/%d"):format(math.min(#An,C.need()),C.need(),kK,gL)
end function C.wear(kL)local kM={}for GP,Ao in ipairs(kL)do kM[tostring(Ao)]=true end for GQ=1,3 do local c2=q.data()
if not c2 then return false end for GR,rO in ipairs(c2 .equipped or{})do if not kM[tostring(rO)]then q.call("unequip",rO)task.wait(0.3)end
end c2=q.data()local rP={}for GS,Ap in ipairs(c2 .equipped or{})do rP[tostring(Ap)]=true end for GT,rQ in ipairs(kL)do
if not rP[tostring(rQ)]then q.call("equip",rQ)task.wait(0.3)end end task.wait(0.4)c2=q.data()local kN,rR=0,true
for GU,Aq in ipairs(c2 .equipped or{})do kN=kN+1 if not kM[tostring(Aq)]then rR=false end end if rR and kN==#kL then return true end
end return false end function C.saveTeam(rS,rT)if not C.wear(rT)then return false,"could not put the pets on"end
local Ar=z.teams()local co for As,At in ipairs(Ar)do if At.name==rS then co=As break end end local c3 if co then
c3=q.call("teamSave",co)else c3=q.call("teamNew")if type(c3)=="table"and c3 .ok and c3 .index then co=c3 .index
task.wait(0.3)q.call("teamRename",{index=co,name=rS})end end task.wait(0.4)local kO=q.data()local rU=kO and kO.teams and co and kO.teams[co]
if not rU then return false,"the game did not save it"end local rV={}for GV,Au in ipairs(rU.pets or{})do rV[tostring(Au)]=true end
for GW,Av in ipairs(rT)do if not rV[tostring(Av)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local Aw=q.srv()for GX,Ax in ipairs(z.list or{})do if Ax.ends-Aw<(d.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local er=q.data()if not er then return{}end local rW={}for GY,Ay in ipairs(er.arriving or{})do rW[tostring(Ay)]=true end
local es={}for GZ,gM in ipairs(er.pets or{})do if not rW[tostring(gM.id)]then es[#es+1]={id=tostring(gM.id),name=gM.name,variant=gM.variant or""}end
end local rX={}for G0,rY in ipairs(es)do rX[rY.id]=rY end local rZ=tonumber(er.slots)or 3 local kP,r0={},{}for G1,gN in ipairs(C.ROLES)do
local et=d[gN[1]]if et~=""and not r0[et]then r0[et]=true local kQ,eu,r1={},{},false for G2,r2 in ipairs(er.teams or{})do
if r2 .name==et then for G3,Az in ipairs(r2 .pets or{})do local kR=rX[tostring(Az)]if kR then kQ[kR.id]=true eu[#eu+1]=kR else r1=true end
end end end local kS,r3=C.best(gN[2],es,rZ,kQ)local r4=C.score(gN[2],eu)local r5=#kS==#eu for G4,AA in ipairs(kS)do if not kQ[AA]then r5=false end end
if not r5 and(r1 or#eu<math.min(rZ,#es)or r3>r4+1e-4)then kP[#kP+1]={team=et,role=gN[2],ids=kS,gain=r3-r4}end
end end return kP end function C.rebuild(AB)local r6=C.plan()if#r6==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gO=true local AF,AG=pcall(function()for G5,ev in ipairs(r6)do local AC,AD=C.saveTeam(ev.team,ev.ids)local r7=q.data()
local kT={}for G6,AE in ipairs(ev.ids)do for G7,kU in ipairs(r7 and r7 .pets or{})do if tostring(kU.id)==AE then kT[#kT+1]=q.nice(kU.name,kU.variant)end
end end if AC then A(("TEAM %s rebuilt (%s): %s"):format(ev.team,AB or"pets changed",table.concat(kT,", ")))else gO=false A(("TEAM %s: %s"):format(ev.team,tostring(AD)))end
end end)z.editing,z.nextTry=false,0 if not AF then gO=false A("TEAM BUILD ERR "..tostring(AG))end C.builds=C.builds+1
C.buildMsg=gO and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gO end
function C.fuseTick()if not d.AutoFuse or z.editing then return end local gP=q.data()if not gP then return end
local kV=C.need()local kW,gQ={},{}for G8,AH in ipairs(gP.teams or{})do for G9,AI in ipairs(AH.pets or{})do kW[tostring(AI)]=true end end
for G_,AJ in ipairs(gP.equipped or{})do gQ[tostring(AJ)]=true end C.failUntil=C.failUntil or{}for cp,AK in pairs(d.Pets)do
local r8=tonumber(AK.f)or 0 local kX,AL=C.count(cp,gP,true)if r8>0 and AL<r8 and#kX>=kV and y()>=(C.failUntil[cp]or 0)then
table.sort(kX,function(gR,gS)local r9=(gQ[tostring(gR.id)]and 4 or 0)+(kW[tostring(gR.id)]and 2 or 0)+(gR.named and 1 or 0)
local r_=(gQ[tostring(gS.id)]and 4 or 0)+(kW[tostring(gS.id)]and 2 or 0)+(gS.named and 1 or 0)if r9~=r_ then return r9<r_ end
return tostring(gR.id)<tostring(gS.id)end)local gT,kY={},{}for gU=1,kV do gT[gU]=tostring(kX[gU].id)if gQ[gT[gU]]then kY[#kY+1]=gT[gU]end
end z.editing,z.editingSince=true,y()for Ha,AM in ipairs(kY)do q.call("unequip",AM)task.wait(0.3)end local gV=q.call("fuse",{ids=gT})
z.editing,z.nextTry=false,0 if type(gV)=="table"and gV.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(kV,q.nice(cp),q.nice(cp)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(cp),os.date("%H:%M"))else C.failUntil[cp]=y()+120 A(("fuse %s failed: %s"):format(q.nice(cp),type(gV)=="table"and tostring(gV.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not d.AutoBuild or not d.Teams then return end local sa=q.data()
if not sa then return end local cq={}for Hb,AN in ipairs(sa.pets or{})do cq[#cq+1]=tostring(AN.id)end table.sort(cq)
cq=table.concat(cq,",")if cq~=C.sig then C.sig,C.dirtyAt=cq,y()end local AO=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if AO and not z.editing then local AP=C.rebuild(C.dirtyAt and"pets changed"or"check")if AP then C.dirtyAt,C.lastBuild=nil,y()end
end end e.bb,e.fx,e.post,e.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}e.watch=setmetatable({},{__mode="k"})
e.mem,e.memPeak,e.fps=0,0,0 function e.isFx(cr)return cr:IsA("ParticleEmitter")or cr:IsA("Trail")or cr:IsA("Beam")or cr:IsA("Fire")or cr:IsA("Smoke")
or cr:IsA("Sparkles")or cr:IsA("Light")end function e.muteOne(aH)if not d.Lite or not aH.Parent then return end
local gW=(aH:IsA("BillboardGui")and e.bb)or(e.isFx(aH)and e.fx)or nil if not gW or gW[aH]~=nil then return end
gW[aH]=aH.Enabled if aH.Enabled then aH.Enabled=false end e.watch[aH]=aH:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aH.Enabled then gW[aH]=true aH.Enabled=false end end)end function e.lite(sb)d.Lite=sb if sb then
task.spawn(function()for AQ,AS in ipairs(am:GetDescendants())do if not d.Lite then return end pcall(e.muteOne,AS)
if AQ%600==0 then task.wait()end end end)if not e.addConn then e.queue={}e.addConn=T(am.DescendantAdded:Connect(function(kZ)
if d.Lite and(kZ:IsA("BillboardGui")or e.isFx(kZ))then e.queue[#e.queue+1]=kZ end end))end local k0=game:GetService("Lighting")
for Hc,ew in ipairs(k0:GetChildren())do if ew:IsA("PostEffect")and ew.Enabled and e.post[ew]==nil then e.post[ew]=true ew.Enabled=false end
end pcall(function()e.oldShadows=e.oldShadows==nil and k0 .GlobalShadows or e.oldShadows k0 .GlobalShadows=false end)
pcall(function()e.oldDeco=e.oldDeco==nil and am.Terrain.Decoration or e.oldDeco am.Terrain.Decoration=false end)
task.spawn(e.extras,true)else e.extras(false)for Hd,AT in pairs(e.watch)do pcall(function()AT:Disconnect()end)end
for sc,AU in pairs(e.bb)do pcall(function()if sc.Parent then sc.Enabled=AU end end)end for sd,AV in pairs(e.fx)do pcall(function()if sd.Parent then sd.Enabled=AV end end)end
for se in pairs(e.post)do pcall(function()if se.Parent then se.Enabled=true end end)end e.bb,e.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
e.watch,e.post,e.queue=setmetatable({},{__mode="k"}),{},{}local AW=game:GetService("Lighting")if e.oldShadows~=nil then pcall(function()AW.GlobalShadows=e.oldShadows end)e.oldShadows=nil end
if e.oldDeco~=nil then pcall(function()am.Terrain.Decoration=e.oldDeco end)e.oldDeco=nil end end end function e.fxPatch(sf)
local AX,k1=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not AX or type(k1)~="table"then return end if sf and not e.ceOld then e.ceOld={}for He,sh in ipairs({"Fireworks","Confetti"})do
local gX=k1[sh]if type(gX)=="table"and type(gX.Play)=="function"then e.ceOld[sh]=gX.Play pcall(function()gX.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not sf and e.ceOld then for AY,AZ in pairs(e.ceOld)do pcall(function()k1[AY].Play=AZ end)end e.ceOld=nil
end end function e.topsFind()if e.tc then return e.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local k2,gY for Hf,ex in ipairs(getgc(false))do if type(ex)=="function"and(type(islclosure)~="function"or islclosure(ex))then
local A0,sj,sk=pcall(debug.info,ex,"sn")if A0 and type(sj)=="string"and sj:find("ToppingCullHandler",1,true)then
if sk=="poll"then k2=ex elseif sk=="retarget"then gY=ex end end end end if not(k2 and gY)then return nil end local A1,gZ=pcall(debug.getupvalues,gY)
local sl=A1 and type(gZ)=="table"and gZ[3]if type(sl)~="function"or debug.info(sl,"n")~="targetFor"or(gZ[1]~=nil and type(gZ[1])~="number")then return nil end
e.tc={poll=k2,re=gY}return e.tc end function e.tops(sm)local aN=e.topsFind()if not aN then return false end if sm and not aN.old then
local A2,A3=pcall(hookfunction,aN.poll,function()end)if not A2 then return false end aN.old=A3 pcall(debug.setupvalue,aN.re,1,-1000)
pcall(aN.re)elseif not sm and aN.old then local A4=type(restorefunction)=="function"and pcall(restorefunction,aN.poll)
if not A4 then pcall(hookfunction,aN.poll,aN.old)end aN.old=nil pcall(aN.poll)end return true end e.lit,e.boardsOff={},{}
function e.lights(A5)local sn=am:FindFirstChild("Plots")if A5 then for Hg,A6 in ipairs(sn and sn:GetChildren()or{})do
local so=A6:FindFirstChild("SkinProps")local sp=so and so:FindFirstChild("FairyLights")for Hh,sq in ipairs(sp and sp:GetChildren()or{})do
for Hi,ey in ipairs(sq:GetChildren())do if ey:IsA("BasePart")and(ey.Name=="Bulb"or ey.Name=="Wire")then e.lit[ey]=sq ey.Parent=nil end
end end end for Hj,A7 in ipairs({"Leaderboards","ClanBoard"})do local k3=am:FindFirstChild(A7)if k3 then e.boardsOff[k3]=true k3 .Parent=nil end
end else for A8,sr in pairs(e.lit)do pcall(function()if sr.Parent then A8 .Parent=sr end end)end for ss in pairs(e.boardsOff)do pcall(function()if not ss.Parent then ss.Parent=am end end)end
e.lit,e.boardsOff={},{}end end e.reel={}function e.rollFx(A9)if A9 then local su=af:FindFirstChild("Remotes")
local sv=su and su:FindFirstChild("SquishyRollAnimation")if not sv or type(getconnections)~="function"then return end
local A_,Ba=pcall(getconnections,sv.OnClientEvent)for Hk,g0 in ipairs(A_ and Ba or{})do local k4=""pcall(function()k4=debug.info(g0 .Function,"s")end)
if type(k4)=="string"and k4:find("SquishyHandler",1,true)and not e.reel[g0]then if pcall(function()g0:Disable()end)then e.reel[g0]=true end
end end else for Bb in pairs(e.reel)do pcall(function()Bb:Enable()end)end e.reel={}end end e.quiet={}function e.quietPlots(Bc)
if not Bc then for Bd in pairs(e.quiet)do pcall(function()Bd:Enable()end)end e.quiet={}return end if type(getconnections)~="function"then return end
local function k5(Be,Bf)local Bg,Bh=pcall(getconnections,Be)for Hl,g1 in ipairs(Bg and Bh or{})do local k6=""
pcall(function()k6=debug.info(g1 .Function,"s")end)if type(k6)=="string"and k6:find(Bf,1,true)and not e.quiet[g1]then
if pcall(function()g1:Disable()end)then e.quiet[g1]=true end end end end local sx=am:FindFirstChild("Plots")for Hm,g2 in ipairs(sx and sx:GetChildren()or{})do
if g2~=c.plot then k5(g2:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local sy,sz=g2:FindFirstChild("WaxStations"),g2:FindFirstChild("SquishyStack")
if sy then k5(sy.DescendantAdded,"LocalToppingsHandler")end if sz then k5(sz.ChildAdded,"LocalToppingsHandler")end
end end end function e.extras(g3)pcall(e.quietPlots,g3 and c.plot~=nil)pcall(e.fxPatch,g3)pcall(e.tops,g3)pcall(e.lights,g3)
end e.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function e.hideHud(sA)d.HideHud=sA local k7=J:FindFirstChildOfClass("PlayerGui")
if not k7 then return end if sA then for Hn,ez in ipairs(k7:GetChildren())do if ez:IsA("ScreenGui")and not e.MINE[ez.Name]and ez.Enabled then e.hud[ez]=true ez.Enabled=false end
end if not e.hudConn then e.hudConn=T(k7 .ChildAdded:Connect(function(eA)if d.HideHud and eA:IsA("ScreenGui")and not e.MINE[eA.Name]then
task.defer(function()if d.HideHud and eA.Enabled then e.hud[eA]=true eA.Enabled=false end end)end end))end else
for sB in pairs(e.hud)do pcall(function()if sB.Parent then sB.Enabled=true end end)end e.hud={}end end e.CAPS={0,30,15,10}
function e.cap(k8)d.FpsCap=k8 local sC=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not sC then return false end return pcall(sC,k8==0 and 60 or k8)end e.unseen=setmetatable({},{__mode="k"})
function e.hideOne(ao)if ao:IsA("BasePart")or ao:IsA("Decal")or ao:IsA("Texture")then if ao.Transparency<1 then e.unseen[ao]=ao.Transparency ao.Transparency=1 end
elseif ao:IsA("BillboardGui")or ao:IsA("SurfaceGui")or ao:IsA("ParticleEmitter")or ao:IsA("Beam")or ao:IsA("Trail")or ao:IsA("Light")or ao:IsA("Fire")or ao:IsA("Smoke")or ao:IsA("Sparkles")then
if ao.Enabled then e.unseen[ao]=true ao.Enabled=false end end end function e.notMine(Bi)return d.HideMine or(c.plot and not Bi:IsDescendantOf(c.plot))end
e.hideQ,e.hideI={},1 function e.hideStep()local g4=e.hideQ if e.hideI>#g4 then return end local Bj=os.clock()
while e.hideI<=#g4 and os.clock()-Bj<0.002 do local k9=g4[e.hideI]e.hideI=e.hideI+1 if d.HideBases and k9 .Parent and e.notMine(k9)then pcall(e.hideOne,k9)end
end if e.hideI>#g4 then e.hideQ,e.hideI={},1 end end e.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function e.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end function e.setBases(sD)if d.HideBases then e.bases(false)end
d.HideMine=sD==2 if sD>0 then e.bases(true)end end function e.bases(sE)d.HideBases=sE local k_=am:FindFirstChild("Plots")
if not k_ then return end if sE then task.spawn(function()local la=0 for Ho,sF in ipairs(k_:GetChildren())do if sF~=c.plot or d.HideMine then
for Hp,Bk in ipairs(sF:GetDescendants())do if not d.HideBases then return end pcall(e.hideOne,Bk)la=la+1 if la%600==0 then task.wait()end
end end end end)if not e.basesConn then e.basesConn=T(k_.DescendantAdded:Connect(function(Bl)if d.HideBases then e.hideQ[#e.hideQ+1]=Bl end
end))end else for lb,sG in pairs(e.unseen)do pcall(function()if not lb.Parent then return end if type(sG)=="number"then lb.Transparency=sG else lb.Enabled=true end
end)end e.unseen=setmetatable({},{__mode="k"})end end function e.render(sH)d.NoRender=sH pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not sH)end)
end e.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
e.calmed={}function e.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local Bm=game:GetService("RunService")
local lc=0 for Hq,Bn in ipairs({"RenderStepped","Heartbeat","Stepped"})do local Bo,sI=pcall(function()return Bm[Bn]end)
local sJ,ld=false,nil if Bo and sI then sJ,ld=pcall(getconnections,sI)end if sJ and type(ld)=="table"then for Hr,le in ipairs(ld)do
local lf=""pcall(function()local sK=getfenv(le.Function).script lf=sK and sK:GetFullName()or""end)if lf~=""then
for Hs,Bp in ipairs(e.CALM)do if lf:find(Bp,1,true)then if pcall(function()le:Disable()end)then e.calmed[#e.calmed+1]=le lc=lc+1 end
break end end end end end end if#e.calmed>200 then local lg={}for Bq=#e.calmed-49,#e.calmed do lg[#lg+1]=e.calmed[Bq]end e.calmed=lg
end return lc end function e.calm(sL)d.Calm=sL if sL then local Br=e.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(Br))
else for Ht,Bs in ipairs(e.calmed)do pcall(function()Bs:Enable()end)end e.calmed={}end end function e.restoreAll()
pcall(e.unpin)pcall(e.calm,false)if d.HideBases then pcall(e.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(e.lite,false)pcall(e.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(e.cap,0)end end function e.rejoinSame(sM)if c.rejoining then return end A("REJOIN this server ("..sM..")")
pcall(fw)if c.autoload then pcall(fX,c.autoload)end oJ()local Bt=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then dL(sM..", same server failed")end end)return Bt end function e.tick()
if d.Lite and y()-(e.extraAt or 0)>5 then e.extraAt=y()pcall(e.lights,true)pcall(e.fxPatch,true)if c.plot then pcall(e.quietPlots,true)end
if not next(e.reel)then pcall(e.rollFx,true)end if not(e.tc and e.tc.old)and y()-(e.topsTry or-100)>60 then e.topsTry=y()pcall(e.tops,true)end
end local lh=e.queue if d.Lite and lh and#lh>0 then e.queue={}for Bu,Bv in ipairs(lh)do pcall(e.muteOne,Bv)if Bu%300==0 then task.wait()end end
end local sN=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if sN then for Hu,Bw in ipairs(sN:GetChildren())do
local sO=Bw:FindFirstChild("SquishyPlaceHolder")local cs=sO and sO:FindFirstChild("TimerGui")if cs and cs:IsA("BillboardGui")then
if e.bb[cs]==nil then pcall(e.muteOne,cs)elseif cs.Enabled then e.bb[cs]=true cs.Enabled=false end end end end
local Bx,eB=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Bx and type(eB)=="number"then
e.mem=eB e.memPeak=math.max(e.memPeak,eB)if(d.MemLimit or 0)>0 and eB>d.MemLimit then e.over=(e.over or 0)+1 if e.over>=30 and not c.busy then
e.over=-600 e.rejoinSame(("memory %d MB > %d MB"):format(eB,d.MemLimit))end elseif(e.over or 0)>0 then e.over=0
end end if y()-(e.noteAt or 0)>1800 then e.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(e.fps+0.5),e.mem,e.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function li(g5)if type(g5)~="string"then return false end
g5=g5:lower()for Hv,By in ipairs(c.sellWords)do if g5:find(By,1,true)then return true end end return false end
local function Bz()local sP=af:FindFirstChild("Remotes")local lj=sP and sP:FindFirstChild("SellSquishy")if not(lj and lj:IsA("RemoteEvent"))then return false end
if not pcall(function()lj:FireServer()end)then return false end return aq(function()return ac()==nil end,1.5)
end local function BA()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local sQ=ap()local sR=sQ and sQ.HumanoidRootPart.Position local eC,sS for Hw,c4 in ipairs((c.plot or am):GetDescendants())do
if c4:IsA("ProximityPrompt")and(li(c4 .ActionText)or li(c4 .ObjectText)or li(c4 .Name))then local sT=nD(c4)local lk=(sT and sR)and(sT-sR).Magnitude or 1e9
if lk<=400 and(not eC or lk<sS)then eC,sS=c4,lk end end end c.sellSpot=eC c.noSellSpot=(eC==nil)return eC end
local function sU()local ll=ac()if not ll then c.holding=false return false end if aK(ll)then return false end
local lm=ak(W(ll))if Bz()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..lm)return true end local c5=BA()if c5 then local sV=dy(c5)if sV then b8(sV,c5)local sW=ac()if sW and not aK(sW)then
local BB,BC=dR(c5,function()return ac()==nil end,function()return c5 .Enabled end)if BB then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(lm,fr(c5),BC))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..lm.." ("..c.sellFails..")")
return false end local BD={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function BE(c6)local g6=fr(c6):lower()for Hx,BF in ipairs(BD)do if g6:find(BF,1,true)then return 0 end end
local a7,ar=c6 .Name:lower(),0 local function aV(BG,BH)return BG:find(BH,1,true)~=nil end if aV(a7,"collect")then ar=ar+60 end
if aV(a7,"cash")or aV(a7,"money")then ar=ar+45 end if aV(a7,"income")or aV(a7,"claim")then ar=ar+35 end if aV(a7,"coin")or aV(a7,"earn")or aV(a7,"green")then ar=ar+20 end
if a7=="pad"or a7=="touch"then ar=ar+25 end if ar==0 and(aV(g6,"collect")or aV(g6,"cash")or aV(g6,"money"))then ar=25 end
if ar==0 then return 0 end local eD=c6 .Color if eD.G>0.5 and eD.G>eD.R*1.4 and eD.G>eD.B*1.4 then ar=ar+15 end
if math.min(c6 .Size.X,c6 .Size.Y,c6 .Size.Z)<2 then ar=ar+5 end return ar end local function BI()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local g7,eE,ln={},nil,29 for Hy,g8 in ipairs(c.plot:GetDescendants())do
if g8:IsA("BasePart")then local g9=BE(g8)if g9>0 then g7[#g7+1]={s=g9,p=g8}if g9>ln then eE,ln=g8,g9 end end end
end table.sort(g7,function(BJ,BK)return BJ.s>BK.s end)c.padCands,c.padPart=g7,eE if eE then A("collect pad: "..fr(eE).." (score "..ln..")")end
return eE end local lo="SAB_pad_v1.txt"local function BL(BM)if type(writefile)=="function"then pcall(writefile,lo,table.concat({BM:GetComponents()},","))end
end local function BN()if type(isfile)~="function"or type(readfile)~="function"then return nil end local BO,sX=pcall(function()if isfile(lo)then return readfile(lo)end end)
if not BO or type(sX)~="string"then return nil end local g_={}for BP in sX:gmatch("[^,]+")do g_[#g_+1]=tonumber(BP)end
if#g_==12 then return CFrame.new(unpack(g_))end end local function BQ(lp,ha,BR)local BS=cN(lp)local lq=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aW=(lq and lq:IsA("BasePart"))and(lq.Position-ha)or Vector3 .new(1,0,0)aW=Vector3 .new(aW.X,0,aW.Z)if aW.Magnitude<0.05 then aW=Vector3 .new(1,0,0)end
aW=aW.Unit for BT=0,7 do local hb=BT*math.pi/4 local BU=Vector3 .new(aW.X*math.cos(hb)-aW.Z*math.sin(hb),0,aW.X*math.sin(hb)+aW.Z*math.cos(hb))
local hc=ha+BU*(BR+5)local lr=f5(hc.X,ha.Y,hc.Z)if lr and math.abs(lr.Y-ha.Y)<8 then aD(lp,Vector3 .new(hc.X,lr.Y+BS,hc.Z))
if jk(lp,0.7)then return true end end end return false end local function BV()c.lastCollect=y()local eF=ap()if not eF then return end
local sY,BW=eF.HumanoidRootPart,cN(eF)local eG,sZ,eH,ls=nil,4,nil,"?"local lt=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and lt and lt:IsA("BasePart")then eG,ls=(lt.CFrame*c.manualPad).Position,"manual pad"else local bm=BI()
if bm then eG=Vector3 .new(bm.Position.X,bm.Position.Y+bm.Size.Y/2+BW,bm.Position.Z)sZ,eH,ls=math.max(bm.Size.X,bm.Size.Z)/2,bm,bm.Name
end end if not eG then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local lu=ba()aD(eF,eG)
if eH and type(firetouchinterest)=="function"then pcall(firetouchinterest,sY,eH,0)end ag(d.PadDwell)if eH and type(firetouchinterest)=="function"then pcall(firetouchinterest,sY,eH,1)end
ag(0.5)c.collected=c.collected+1 local lv=ba()A(("COLLECTED (%s) %s"):format(ls,(lu and lv and lv>lu)and("+$"..aL(lv-lu))or"no cash change seen"))
BQ(eF,eG,sZ)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local s0=af:FindFirstChild("Modules")if not s0 then return false end local function lw(BX)local s1=s0:FindFirstChild(BX)
if not s1 then return nil end local BY,s2=pcall(require,s1)return(BY and type(s2)=="table")and s2 or nil end o.si,o.arm,o.ci=lw("SquishyInfo"),lw("AutoRollRules"),lw("CrateInfo")
o.modAt=y()if not o.si then return false end local lx={}if o.arm and type(o.arm.tierOf)=="table"then for ly in pairs(o.arm.tierOf)do
local hd=o.si[ly]if type(hd)=="table"and hd.rarity~="Limited"and not hd.incomeType and not hd.hiddenAfter then lx[W(ly)]=ly end
end end o.roll=lx local he={}for BZ,B0 in pairs(lx)do local eI=o.si[B0]if type(eI)=="table"and type(eI.income)=="number"and not eI.incomeType then
he[#he+1]={k=BZ,inc=eI.income,pr=tonumber(eI.price)or 0}end end table.sort(he,function(lz,lA)if lz.inc~=lA.inc then return lz.inc>lA.inc end return lz.pr>lA.pr end)
o.order=he local hf,lB,lC local B1=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for B2,lD in pairs(B1)do
local lE=type(lD)=="table"and tonumber(lD.price)if lE and(not lB or lE>lB)then hf,lB,lC=B2,lE,lD.title end end
o.bestCrate,o.bestCrateName=hf and L.key(hf),hf o.bestCrateTitle=lC and L.key(lC)or nil return true end function o.rank(B3)
local B4,B5=pcall(function()return o.arm.rankOf(B3)end)return(B4 and tonumber(B5))or 0 end function o.loadDisc(s3)
if type(s3)~="table"then return end local s4={}for B6,B7 in pairs(s3)do if B7 then s4[W(tostring(B6))]=true end end
o.disc,o.discAt=s4,y()end function o.fetch()o.discAt=y()local s5=af:FindFirstChild("Remotes")local s6=s5 and s5:FindFirstChild("GetSquishiesDiscovered")
if not s6 then return end local B8,B9=pcall(function()return s6:InvokeServer()end)if B8 then o.loadDisc(B9)end
end function o.scanWax()local lF={}local s7=c.plot and c.plot:FindFirstChild("WaxStations")if s7 then for Hz,s8 in ipairs(s7:GetChildren())do
local s9=s8:FindFirstChild("SquishyPlaceHolder")if s9 and s8:GetAttribute("HasSquishy")then for HA,s_ in ipairs(s9:GetChildren())do if s_:IsA("Model")then lF[W(s_.Name)]=true end end
end end end for ta,B_ in pairs(o.placedAt)do if y()-B_<20 then lF[ta]=true else o.placedAt[ta]=nil end end o.waxing=lF
end function o.compute()local tb,lG,lH={},0,0 if o.disc then for lI in pairs(o.roll or{})do if not o.disc[lI]then
if o.waxing[lI]then lH=lH+1 else tb[lI],lG=true,lG+1 end end end end o.need,o.nNeed,o.nWax=tb,lG,lH local td,lJ={},d.Best or 0
local lK=(lJ==4)and o.stackMin or nil for Ca,te in ipairs(o.order)do if(lK and te.inc>lK)or(not lK and Ca<=(lJ==4 and 1 or lJ))then td[te.k]=true end
end o.best=td end function o.readStack()o.stackAt=y()local tf=af:FindFirstChild("Remotes")local th=tf and tf:FindFirstChild("EditStack")
if not th then return end local Cb,c7=pcall(function()return th:InvokeServer("State",nil)end)if not(Cb and type(c7)=="table"and type(c7 .state)=="table"and type(c7 .state.entries)=="table")then return end
local hg for HB,ti in ipairs(c7 .state.entries)do local eJ=type(ti)=="table"and o.si and o.si[tostring(ti.name)]
if type(eJ)=="table"and type(eJ.income)=="number"and not eJ.incomeType and(not hg or eJ.income<hg)then hg=eJ.income end
end o.stackMin=hg o.stackFull=#c7 .state.entries>=(tonumber(c7 .state.capacity)or 100)end function o.want(lL)
if(d.Best or 0)>0 and(next(o.best)or(d.Best==4 and o.stackMin))then if o.best[lL]then return true end elseif d.Targets[lL]then
return true end return d.AutoIndex==true and o.need[lL]==true end function o.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(o.best)~=nil)or(d.AutoIndex and next(o.need)~=nil)
or d.Best==4 end function o.placed(Cc)local eK=W(Cc)o.placedAt[eK],o.waxing[eK]=y(),true if o.need[eK]then o.need[eK],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eK)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eL,eM={},{}for Cd,Ce in pairs(o.roll or{})do if o.want(Cd)then eL[Ce]=true end end
for tj,lM in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(tj)or(type(lM)=="table"and type(lM.title)=="string"and L.wanted(lM.title))then eM[tj]=true end
end if not next(eL)and not next(eM)then return nil end if o.arm and type(o.arm.encode)=="function"then local Cf,tk=pcall(o.arm.encode,{rarities={},butters=eL,crates=eM,index=false})
if Cf and type(tk)=="string"then return tk end end local function tl(Cg)local hh={}for Ch in pairs(Cg)do hh[#hh+1]=Ch end table.sort(hh)return table.concat(hh,",")end
local eN="adv:"if next(eL)then eN=eN..";butters:"..tl(eL)end if next(eM)then eN=eN..";crates:"..tl(eM)end return eN
end function o.canon(Ci)local hi={}for tm in tostring(Ci or""):gmatch("[^;]+")do local lN,tn=tm:match("^(%a+):(.*)$")
if not lN then lN,tn="r",tm:gsub("^adv:","")end for Cj in tn:gmatch("[^,]+")do hi[#hi+1]=lN.."="..Cj end end table.sort(hi)
return table.concat(hi,"|")end function o.sync(Ck)if J:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local ct=o.rulesNow()if not ct or#ct>1900 then return end if o.canon(J:GetAttribute("AutoRollRules"))==o.canon(ct)then o.fails=0 return end
if not Ck and y()-o.sentAt<4 then return end local to=af:FindFirstChild("Remotes")local tp=to and to:FindFirstChild("AutoRollAction")
if not tp then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()tp:FireServer("Rules",ct)end)D.replaying=false d.ARrules=ct
local hj,hk=0,0 for HC in(ct:match("butters:([^;]*)")or""):gmatch("[^,]+")do hj=hj+1 end for HD in(ct:match("crates:([^;]*)")or""):gmatch("[^,]+")do hk=hk+1 end
local tq=hj.."/"..hk if o.told~=tq then o.told=tq A(("auto roll now stops on %d butters and %d crates"):format(hj,hk))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if d.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aO={}if d.AutoIndex then aO[#aO+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if d.Best==4 then local eO=0 for HE in pairs(o.best)do eO=eO+1 end
aO[#aO+1]=eO==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eO,eO==1 and""or"s")
elseif(d.Best or 0)>0 and o.order[1]then aO[#aO+1]="best: "..ak(o.order[1].k)end if d.BestCrate and o.bestCrateName then aO[#aO+1]="crate: "..o.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aO[#aO+1]="shower: "..O.got end o.msg=#aO>0 and table.concat(aO," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(Cl)o.feed[#o.feed+1]=os.date("%H:%M ")..Cl if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(tr,av,hl)if tr~="Effect"then o.feedAdd(tostring(tr)..(av~=nil and(": "..tostring(av):sub(1,80))or""))
return end if av~="ShowerTaken"and av~="GoalPoint"then o.feedAdd(tostring(av))end if av=="Shower"then O.add(hl)return end
if av=="ShowerTaken"then O.gone(hl)return end if av=="ShowerClear"then O.drops={}return end if av=="WaxGlow"then
local lO=type(hl)=="table"and tonumber(hl.SnapAt)if lO then o.snapAt=lO A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lO-q.srv()),(d.SnapGlaze~=false and d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end av=tostring(av)b4("Admin "..av)if av~="GoalPoint"and y()-(o.heard[av]or-100)>30 then o.heard[av]=y()
A("ADMIN: "..av)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(lP)if type(lP)~="table"or type(lP.Pieces)~="table"then return end
for HF,aX in pairs(lP.Pieces)do if type(aX)=="table"and aX.Id~=nil and aX.Position~=nil then O.drops[aX.Id]={id=aX.Id,butter=tostring(aX.Butter or"?"),rar=tostring(aX.Rarity or"?"),star=aX.Star==true,
pos=aX.Position,opens=tonumber(aX.OpensAt)or 0,ends=tonumber(aX.ExpiresAt)or 0}end end end function O.gone(eP)
if type(eP)~="table"or eP.Id==nil then return end O.drops[eP.Id]=nil if tonumber(eP.UserId)==q.uid then O.mine=eP.Id end
end function O.pick()local lQ=q.srv()local lR,ts for tt,cu in pairs(O.drops)do if lQ>=cu.ends-0.3 then O.drops[tt]=nil
elseif lQ>=cu.opens-0.2 and(O.tried[tt]or 0)<3 then local tu=(aK(cu.butter)and 1e6 or 0)+(cu.star and 1e5 or 0)+o.rank(cu.rar)*100-(cu.ends-lQ)
if not lR or tu>ts then lR,ts=cu,tu end end end return lR end function O.due()return d.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aP,lS=O.pick(),ap()if not(aP and lS)then return end O.tried[aP.id]=(O.tried[aP.id]or 0)+1
if e.hold then pcall(e.unpin,true)end aD(lS,aP.pos+Vector3 .new(0,cN(lS)+0.5,0))aq(function()return O.mine==aP.id or ac()~=nil or not O.drops[aP.id]end,1.5)
if O.mine==aP.id or ac()then O.got,O.drops[aP.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aP.butter)),aP.rar,aP.star and" (star)"or""))
elseif not O.drops[aP.id]then O.miss=O.miss+1 end end local eQ local function tv()if c.capHit then if d.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eQ(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ap()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bw(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local lT,tw=ft()
local hm=ac()if hm then local c8=ak(W(hm))if not aK(hm)then local lU=(V.gift and W(V.gift)==W(hm)and y()-V.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c8,lU),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c8,lU),"bad"end return"sell",("selling %s (%s)"):format(c8,lU),"warn"
end if lT<1 then return nil,("holding %s - 0 free stations"):format(c8),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c8),"wait"end
return"place",("waxing %s (%d free)"):format(c8,lT),"ok"end c.holding=false if d.Crates and not j.waiting and y()-(j.scanAt or 0)>1 and y()>(j.quietUntil or 0)then
j.scanAt=y()local lV=c.plot:FindFirstChild("CrateStand")if lV then for HG,eR in ipairs(lV:GetDescendants())do
if eR:IsA("ProximityPrompt")and eR.Enabled and jB(eR)then local bn=eR.ObjectText if bn==""then bn=cG(lV,"TitleLabel")or""end
if bn~=""and L.wanted(bn)then local Cm=fp(bn):gsub("crate$","")local tx for ty in pairs(ad.members)do if fp(ty)==Cm then tx=ty end end
j.waiting,j.at,j.title,j.prompt=true,y(),bn,eR j.data={name=(bn:gsub("%s","")),rarity=tx,title=bn}A(bn.." found waiting on your stand")
end break end end end end local tz=L.wanted(j.data and j.data.name)or L.wanted(j.title)if d.Crates and(j.on or j.waiting)and tz then
local aY=j.title if y()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aY),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aY.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aY),"bad"end if y()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aY),"bad"
end if j.byYou and y()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aY,math.ceil(60-(y()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aY),"ok"end if j.at and y()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aY,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if y()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aY,
math.ceil(45-(y()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil A("trying the "..aY.." again")
end if y()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aY),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aY,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not tz then local tA=j.title..tostring(j.rolledAt)if j.told~=tA then j.told=tA A(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and y()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if lT<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(tw,tw),"wait"
end local lW=nR()if not lW then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c9=b3()
if c9 and pg(c9 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(c9 .name),"idle"end
if y()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c9 .name),"bad"end if not pB()then return nil,("%s rolled - waiting for it to land on the stand"):format(c9 .name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c9 .name),"ok"end local bK=ji()if bK.state~="match"then
c.matchSince=nil if bK.state=="skip"and not lW.Enabled then return nil,bK.text.." (sold out)","idle"end return nil,bK.text,bK.level
end if not lW.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eS=y()if eS<c.noCashUntil then
local tB,Cn=dN()if tB then return nil,("cash short: have $%s, price ~$%s"):format(aL(tB),aL(Cn)),"bad"end return nil,(dN()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aL(ba()),math.ceil(c.noCashUntil-eS)),dN()and"bad"or"wait"end if eS-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eS local tC=eS-c.matchSince if tC<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bK.shown,tC),"ok"end
return"buy",("buying %s via %s"):format(bK.shown,bK.src),"ok"end e.DEPTH=11 function e.pinTick()local tD=e.hold
if not tD then return end local lX=J.Character local lY=lX and lX:FindFirstChild("HumanoidRootPart")if not lY then return end
lY.CFrame=tD lY.AssemblyLinearVelocity=Vector3 .new(0,0,0)for HH,hn in ipairs(lX:GetChildren())do if hn:IsA("BasePart")and hn.CanCollide then e.noclip[hn]=true hn.CanCollide=false end
end end e.noclip=setmetatable({},{__mode="k"})function e.pin(Co,tE)e.hold=Co if tE then e.surface=tE end end function e.unpin(Cp)
if not e.hold then return end e.hold=nil for tF in pairs(e.noclip)do pcall(function()if tF.Parent then tF.CanCollide=true end end)end
e.noclip=setmetatable({},{__mode="k"})local tG=ap()if tG and e.surface and not Cp then aD(tG,e.surface.Position,e.surface.Position+e.surface.LookVector)
ag(0.1)end end function e.home()local bo,tH=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ap()
if not(bo and bo:IsA("BasePart")and tH)then return nil end local tI=nG()or bo.Position local ho=Vector3 .new(tI.X-bo.Position.X,0,tI.Z-bo.Position.Z)
ho=ho.Magnitude>0.1 and ho.Unit or Vector3 .new(0,0,1)local hp=bo.Position+ho*6 local tJ=f5(hp.X,bo.Position.Y,hp.Z,{bo})
return CFrame.new(hp.X,(tJ and tJ.Y or bo.Position.Y)+cN(tH),hp.Z)end function e.ground(Cq,tK,Cr)local lZ,l0={J.Character},nil
for HI=1,12 do local l1=RaycastParams.new()l1 .FilterType=Enum.RaycastFilterType.Exclude l1 .FilterDescendantsInstances=lZ
local hq=am:Raycast(Vector3 .new(Cq,tK,Cr),Vector3 .new(0,-2000,0),l1)if not hq then break end l0,tK=hq,hq.Position.Y-0.05
lZ[#lZ+1]=hq.Instance end return l0 and l0 .Position.Y end function e.parkHome()local l2=e.home()if not l2 then return false end
local c_=l2 .Position local Cs=e.ground(c_.X,c_.Y+300,c_.Z)or(c_.Y-3)e.pin(CFrame.new(c_.X,Cs-8,c_.Z),l2)return true
end e.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function e.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function e.setGhost(hr)d.Ghost,d.GhostHelps=hr==2,hr==1 if hr<2 then task.spawn(function()while c.busy do ag(0.1)end
if e.ghostMode()<2 and e.hold and not E.home then pcall(e.unpin)end end)end e.paintGhost()A("ghost: "..e.GHOST[hr][1]:sub(8):lower())
end function e.cycleGhost()e.setGhost((e.ghostMode()+1)%3)end function e.parkTick()if not(d.Ghost and c.running)or e.hold or c.busy then return end
local Ct=ap()if not Ct or K.seat()then return end e.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local tL=J.Character local tM=tL and tL:FindFirstChildOfClass("Humanoid")local l3=tM and tM.SeatPart
return(l3 and l3 .Name=="LogSeat")and l3 or nil end function K.due()if not(d.Campfire and c.running)or y()<K.nextAt then return false end
local Cu=am:FindFirstChild("NightSeats")if not Cu then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or y()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(K.msg)return false end end return true end function K.sit()local tN,hs=am:FindFirstChild("NightSeats"),ap()
if not tN or not hs then return end local tO,da=hs.HumanoidRootPart.Position,{}for HJ,ht in ipairs(tN:GetChildren())do
local tP=ht:IsA("Seat")and ht.Occupant==nil and ht:FindFirstChildOfClass("ProximityPrompt")if tP then da[#da+1]={st=ht,p=tP}end
end if#da==0 then K.nextAt,K.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(da,function(Cv,Cw)return(Cv.st.Position-tO).Magnitude<(Cw.st.Position-tO).Magnitude end)
local Cx,Cy=da[1].st,da[1].p e.unpin(true)local db=Cx.CFrame aD(hs,db.Position+db.LookVector*2+Vector3 .new(0,2.5,0),db.Position)
ag(0.25)local Cz=dR(Cy,function()return K.seat()~=nil end)if not Cz then aD(hs,db.Position+Vector3 .new(0,2,0),db.Position+db.LookVector)
aq(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=y()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then A(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local l4=af:FindFirstChild("Remotes")if not l4 then return end local eT,l5,dc=0,0,{}
local CA,tQ=pcall(function()return l4 .ClanRequest:InvokeServer("state")end)local tR=CA and type(tQ)=="table"and tQ.tasks
for HK,bL in ipairs(tR and tR.list or{})do if not bL.done and bL.kind=="pull"then eT=math.max(eT,(bL.goal or 0)-(bL.progress or 0))end
if not bL.done then dc[#dc+1]=("%s %d/%d"):format(tostring(bL.text),bL.progress or 0,bL.goal or 0)end end F.events={}
for HL,dd in ipairs(l4:GetChildren())do if dd:IsA("RemoteFunction")and dd.Name:match("^%u%a+Action$")and dd.Name~="CrateAction"and dd.Name~="AutoRollAction"then
local CB,eU=pcall(function()return dd:InvokeServer("state")end)if CB and type(eU)=="table"and eU.live==true and type(eU.quests)=="table"then
F.events[#F.events+1]={r=dd,st=eU}for HM,aQ in ipairs(eU.quests)do if not aQ.done and aQ.kind=="pull"then eT=math.max(eT,(aQ.goal or 0)-(aQ.progress or 0))end
if not aQ.done and aQ.kind=="collect"then l5=math.max(l5,(aQ.goal or 0)-(aQ.progress or 0))end if not aQ.done then dc[#dc+1]=("%s %d/%d"):format(tostring(aQ.text),aQ.progress or 0,aQ.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eT,l5 F.msg=#dc>0 and("open: "..table.concat(dc,", "))or"all quests done for today"
end function F.claim()for HN,eV in ipairs(F.events)do local tS=eV.r.Name:gsub("Action$","")for HO,de in ipairs(eV.st.quests)do
if de.done and not de.claimed then local CC,tT=pcall(function()return eV.r:InvokeServer("claimQuest",de.id)end)
if CC and not(type(tT)=="table"and tT.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(tS,tostring(de.text),tostring(de.points or de.treats or"?")))
end ag(0.4)end end if eV.st.bonusReady==true then local CD=pcall(function()return eV.r:InvokeServer("claimBonus")end)
if CD then A(("CLAIMED %s daily quest bonus"):format(tS))end ag(0.4)end end end function F.tick()if not(d.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return d.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local tU=c.plot and c.plot:FindFirstChild("Lever")
local l6=tU and tU:FindFirstChild("Wheel")return l6 and l6:FindFirstChildWhichIsA("ProximityPrompt"),l6 end function F.resume(CE)
F.arPaused=false if F.arWas then F.arWas=false d.AutoRoll=true task.spawn(D.apply,CE)end end function F.pull()
local hu,l7=F.lever()if not hu or not l7 or not l7:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hu.Enabled then F.nextAt=y()+1 return end b8(l7,hu)F.asked=nil o6(hu)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
ag(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bM,CG)local l8=bM:GetAttribute("PourOwner")
if type(l8)~="number"or l8==q.uid or not bM:GetAttribute("HasSquishy")then return false end if bM:GetAttribute("PourLong")~=true or bM:GetAttribute("PourFull")==true then return false end
local l9=bM:GetAttribute("PourId")if l9==nil or E.skip[l9]then return false end local tV,l_,CH=bM:GetAttribute("Helpers"),0,tostring(q.uid)
if type(tV)=="string"then for CI in tV:gmatch("[^,%s]+")do l_=l_+1 if CI==CH then return false end end end if l_>=6 then return false end
local hv=z.left(bM)if not hv then local tW=tonumber(bM:GetAttribute("PourEnd"))hv=tW and(tW-CG)end if not hv or hv<=75 then return false end
local ma=game:GetService("Players"):GetPlayerByUserId(l8)if not ma or ma:GetAttribute("WaxHelpOff")==true then return false end
return true,ma,l9 end function E.list()local mb,CJ={},q.srv()local tX=am:FindFirstChild("Plots")for HP,tY in ipairs(tX and tX:GetChildren()or{})do
local tZ=tY~=c.plot and tY:FindFirstChild("WaxStations")for HQ,mc in ipairs(tZ and tZ:GetChildren()or{})do local CK,CL,CM=E.can(mc,CJ)
local md=CK and mc:FindFirstChild("SquishyPlaceHolder")if md and md:IsA("BasePart")then mb[#mb+1]={st=mc,p=CL,id=CM,part=md}end
end end return mb end function E.due()return d.Help and c.running and y()>=E.nextAt end function E.skipIt(t0,t1)
E.skip[t0],E.skipN=t1,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[t0]=t1},1,{}end end function E.goHome()
local hw,bN=ap(),E.home E.home=nil if not(hw and bN)then return end if d.Ghost and not K.seat()then e.unpin(true)
if not e.parkHome()then pcall(aD,hw,bN.Position,bN.Position+bN.LookVector)end elseif e.hold or(hw.HumanoidRootPart.Position-bN.Position).Magnitude>20 then
e.unpin(true)pcall(aD,hw,bN.Position,bN.Position+bN.LookVector)end end function E.step()local me,eW=E.list(),ap()
if#me==0 or not eW then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local t2=eW.HumanoidRootPart local t3=t2 .Position table.sort(me,function(CN,CO)return(CN.part.Position-t3).Magnitude<(CO.part.Position-t3).Magnitude end)
local aZ=me[1]E.home=E.home or(e.hold and e.surface)or t2 .CFrame local bO=aZ.part local eX=(bO.Position+aZ.st:GetPivot().Position)/2
local hx=E.tries[aZ.id]or 0 if(d.Ghost or d.GhostHelps)and hx==0 and not K.seat()then e.pin(bO.CFrame,E.home)
else e.unpin(true)local mf=hx==0 and f5(eX.X,bO.Position.Y,eX.Z,{bO})if mf and math.abs(mf.Y-bO.Position.Y)<8 then
aD(eW,Vector3 .new(eX.X,mf.Y+cN(eW),eX.Z),bO.Position)else aD(eW,bO.Position+Vector3 .new(0,bO.Size.Y/2+3,0),eX)
end end ag(0.3)local eY=af:FindFirstChild("Remotes")eY=eY and eY:FindFirstChild("ClanRequest")if not eY then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hy,bp=pcall(function()return eY:InvokeServer("help",aZ.st:GetAttribute("PourOwner"),tonumber(aZ.st.Name))end)
if hy and type(bp)=="table"and bp.ok then E.n,E.fails=E.n+1,0 E.skipIt(aZ.id,"helped")A(("HELPED %s's wax (station %s)"):format(aZ.p.DisplayName,aZ.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hy and type(bp)=="table"and tostring(bp.reason or""):lower():find("walk up",1,true)and hx<2 then
E.tries[aZ.id]=hx+1 E.nextAt=y()+0.3 elseif hy and type(bp)=="table"and tostring(bp.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local t4=(hy and type(bp)=="table"and tostring(bp.reason or"refused"))or("error: "..tostring(bp))
E.skipIt(aZ.id,t4)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aZ.p.DisplayName,t4))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bq)if not d.HelpGuild or type(bq)~="table"or bq.p~="help"or bq.mine or bq.u==q.uid or not bq.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eZ=af:FindFirstChild("Remotes")
eZ=eZ and eZ:FindFirstChild("ClanRequest")if not eZ then return end local t5,e0=pcall(function()return eZ:InvokeServer("callHelp",bq.u)end)
local t6=tostring(bq.n or bq.un or bq.u)if t5 and type(e0)=="table"and e0 .ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(t6))
else A(("guild call from %s: %s"):format(t6,(t5 and type(e0)=="table"and tostring(e0 .reason or"refused"))or tostring(e0)))
end end)end local function as(CP,t7,...)if c.busy then return end c.busy,c.busyText=true,CP if e.hold and t7~=E.step then pcall(e.unpin)end
local CQ,t8=pcall(t7,...)c.busy,c.busyText=false,""if not CQ and t8~=iv then A("ERR "..tostring(t8))end end local function CS()
local aR,CT,CU=tv()c.reason,c.level=CT,CU if aR=="place"then as("waxing...",z.place)elseif aR=="crate"then as("opening crate...",d2,true)
elseif aR=="cratesmart"then as("opening crate...",j.smart)elseif aR=="cratewin"then as("opening the crate window...",jD)
elseif aR=="nocrate"then as("discarding crate...",d2,false)elseif aR=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aR=="sell"then as("selling...",sU)elseif aR=="buy"then as("buying...",o9,false)elseif not aR and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aR and not c.matchSince and K.due()then as("sitting at the campfire...",K.sit)
elseif not aR and not c.matchSince and F.pullDue()and not ac()and not(b3()and aK(b3().name))then as("pulling the lever for a quest...",F.pull)
elseif d.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
as("collecting money...",BV)elseif not aR and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not d.Help then
as("coming back...",E.goHome)elseif not c.busy then e.parkTick()end end function eQ(hz,CV)if hz==c.running then return end
c.running=hz if not CV then d.AutoStart=hz end if hz then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bw()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bP=fR(an.auto)if type(bP)=="string"then bP=bP:gsub("%s+$","")
if bP~=""then c.autoload=bP local CW=oF(bP)A(CW and("loaded config "..bP)or("config "..bP.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local CX={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local mg={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local t9,t_,ua,ub=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if t9 and t_ and ua and ub then ae.x,ae.b,ae.m,ae.r=t9,t_,ua,ub end end)pcall(function()local uc=Enum.Font.RobotoMono if uc then ae.mono=uc end end)
local function H(CY,CZ,C0)local C1,mh=pcall(Instance.new,CY)if not C1 then c.uiErrs=c.uiErrs+1 return nil end
for C2,C3 in pairs(CZ)do if not pcall(function()mh[C2]=C3 end)then c.uiErrs=c.uiErrs+1 end end mh.Parent=C0 return mh
end local function ab(C4,C5)H("UICorner",{CornerRadius=UDim.new(0,C5 or 8)},C4)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hA,mi)if hA and a.shown[hA]~=mi then a.shown[hA]=mi hA.Text=mi end
end function a.stroke(C6,C7,C8)return H("UIStroke",{Color=C7 or l.line,Thickness=1,Transparency=C8 or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},C6)
end function a.grad(C9,C_,Da,Db)local Dc,ud=pcall(function()return ColorSequence.new(C_,Da)end)if Dc and ud then return H("UIGradient",{Color=ud,Rotation=Db or 0},C9)end
end function a.pad(Dd,ue,uf,De,Df)H("UIPadding",{PaddingLeft=UDim.new(0,ue or 0),PaddingTop=UDim.new(0,uf or 0),
PaddingRight=UDim.new(0,De or ue or 0),PaddingBottom=UDim.new(0,Df or uf or 0)},Dd)end function a.list(Dg,Dh,Di)
return H("UIListLayout",{Padding=UDim.new(0,Dh or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Di and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Dg)
end function a.ink(mj)local Dj,Dk=pcall(function()return 0.299*mj.R+0.587*mj.G+0.114*mj.B end)return(Dj and Dk>0.55)and l.ink or l.text
end function a.nextIn(ug)local uh=(a.ord[ug]or 0)+1 a.ord[ug]=uh return uh end local mk=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local ui=mk:FindFirstChild("SABFarmGui")if ui then ui:Destroy()end local ml=H("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},mk)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local hB=am.CurrentCamera.ViewportSize if hB.X>100 and hB.Y>100 then Q.w=math.clamp(math.floor(hB.X*0.48),320,400)
Q.h=math.clamp(math.floor(hB.Y*0.86),250,360)end end)a.root=H("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},ml)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local uj=UDim2 .new(1,0,1,0)
local function HR(uk,ul)return UDim2 .new(uk,0,0,0),UDim2 .new(ul,(uk+ul>0.99)and 0 or-4,1,0)end local function ai(Dl,Dm,e1,Dn,Do,Dp)
local mm=H("TextButton",{Text=Dm,Position=Do,Size=Dp,BackgroundColor3=e1,BorderSizePixel=0,Font=ae.b,TextSize=Dn,TextColor3=a.ink(e1),AutoButtonColor=true},Dl)
ab(mm,8)if e1==l.panel2 or e1==l.raise or e1==l.panel then a.stroke(mm,l.line,0.4)end return mm end local function hC(Dq,Dr,Ds,Dt,Du)
local hD=H("TextBox",{Text=Dr,PlaceholderText=Ds,Position=Dt,Size=Du,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Dq)ab(hD,8)a.stroke(hD,l.line,0)a.pad(hD,9,0,6,0)
return hD end local hE=am.CurrentCamera local function Dv()local Dw,hF=pcall(function()return hE and hE.ViewportSize end)
if Dw and hF and hF.X>50 and hF.Y>50 then return hF end end local function bQ(e2)local mn=Dv()if not(mn and e2 and e2 .Parent)then return end
local Dx=pcall(function()local hG,um=e2 .AbsolutePosition,e2 .AbsoluteSize local mo=70 local uo=math.clamp(hG.X,mo-um.X,mn.X-mo)
local up=math.clamp(hG.Y,0,mn.Y-math.min(um.Y,mo))if math.abs(uo-hG.X)>0.5 or math.abs(up-hG.Y)>0.5 then e2 .Position=UDim2 .new(0,math.floor(uo),0,math.floor(up))
end end)return Dx end local function hH(Dy)local Dz,mp=pcall(function()return Dy.AbsolutePosition end)if Dz and mp then return{math.floor(mp.X),math.floor(mp.Y)}end
end local df={}c.dragMoved={}local function uq(e3,ur,mq)T(e3 .InputBegan:Connect(function(dg)if dg.UserInputType~=Enum.UserInputType.MouseButton1 and dg.UserInputType~=Enum.UserInputType.Touch then return end
local mr={start=dg.Position,from=ur.Position,moved=0,target=ur,input=dg,onDrop=mq}df[e3],c.dragMoved[e3]=mr,0
local ms ms=dg.Changed:Connect(function()if dg.UserInputState==Enum.UserInputState.End and df[e3]==mr then df[e3]=nil
if ms then ms:Disconnect()end if mq then mq(mr.moved)end end end)end))end T(np.InputChanged:Connect(function(hI)
if hI.UserInputType~=Enum.UserInputType.MouseMovement and hI.UserInputType~=Enum.UserInputType.Touch then return end
for DA,a8 in pairs(df)do local mt=a8 .target if mt and mt.Parent then local us,ut=hI.Position.X-a8 .start.X,hI.Position.Y-a8 .start.Y
a8 .moved=math.max(a8 .moved,math.abs(us)+math.abs(ut))c.dragMoved[DA]=a8 .moved mt.Position=UDim2 .new(a8 .from.X.Scale,a8 .from.X.Offset+us,a8 .from.Y.Scale,a8 .from.Y.Offset+ut)
end end end))T(np.InputEnded:Connect(function(hJ)if hJ.UserInputType~=Enum.UserInputType.MouseButton1 and hJ.UserInputType~=Enum.UserInputType.Touch then return end
for DB,hK in pairs(df)do if hK.input==hJ or hJ.UserInputType==Enum.UserInputType.MouseButton1 then df[DB]=nil
if hK.onDrop then hK.onDrop(hK.moved)end end end end))local function P(DC,DD,DE,DF,DG,DH,DI)return H("TextLabel",{Text=DD,Position=DH or UDim2 .new(0,0,0,0),Size=DI or uj,BackgroundTransparency=1,
Font=DG and ae.b or ae.m,TextSize=DE,TextColor3=DF,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},DC)
end function a.row(uu,DJ)return H("Frame",{Size=UDim2 .new(1,0,0,DJ),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(uu)},uu)end function a.card(uv,uw,ux)local dh=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(uv)},uv)ab(dh,11)a.stroke(dh,l.line,0.25)a.list(dh,5)a.pad(dh,8,8,8,9)
if uw then local mu=a.row(dh,14)H("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},mu)P(mu,uw:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if ux then local DK=P(mu,ux,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
DK.TextXAlignment=Enum.TextXAlignment.Right end end return dh end function a.heading(DL,DM,mv)local mw=a.row(DL,mv and 34 or 22)
P(mw,DM,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if mv then P(mw,mv,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mw end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(mx)local aI=a.sw[mx]if not aI then return end
local di=tostring(mx.Text or""):match(":%s*(.-)%s*$")or""local bR=di~=""and not a.OFF[di]local my=not aI.chips and(di=="ON"or di=="OFF")
aI.pill.Visible,aI.chip.Visible=my,not my if my then aI.pill.BackgroundColor3=bR and l.accent or l.panel2 aI.knob.Position=bR and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aI.knob.BackgroundColor3=bR and l.white or l.dim else aI.chip.Text=di~=""and di or"-"aI.chip.BackgroundColor3=bR and l.accent or l.panel2
aI.chip.TextColor3=bR and l.ink or l.dim end mx.BackgroundColor3=bR and l.lit or l.raise if aI.edge then aI.edge.Color=bR and l.accent or l.line aI.edge.Transparency=bR and 0.55 or 0.45 end
end function a.switch(uy,DN,DO,e4)local a0=H("TextButton",{Name="Switch",Text=DN,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,e4 and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(uy)},uy)
ab(a0,9)local au={edge=a.stroke(a0,l.line,0.45)}au.title=P(a0,DO,11,l.text,true,UDim2 .new(0,10,0,e4 and 4 or 0),UDim2 .new(1,-100,0,e4 and 15 or 28))
au.title.TextWrapped,au.title.TextTruncate=false,Enum.TextTruncate.AtEnd if e4 then au.sub=P(a0,e4,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
au.sub.TextWrapped,au.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end au.pill=H("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a0)ab(au.pill,9)au.knob=H("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},au.pill)ab(au.knob,7)au.chip=H("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},a0)
ab(au.chip,9)a.pad(au.chip,10,0,10,0)H("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},au.chip)
au.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a0]=au T(a0:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a0)end))
a.skin(a0)return a0 end function a.chips(mz)if a.sw[mz]then a.sw[mz].chips=true a.skin(mz)end end function a.line(DP,DQ)
local uz=a.row(DP,15)local uA=H("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=DQ or l.dim,
BorderSizePixel=0},uz)ab(uA,3)local mA=P(uz,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mA.TextWrapped,mA.TextTruncate=false,Enum.TextTruncate.AtEnd
return mA,uA end function a.grow(uB,DR,DS)local hL=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=DR or 10,TextColor3=DS or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(uB)},uB)
T(hL:GetPropertyChangedSignal("Text"):Connect(function()hL.Visible=hL.Text~=""end))return hL end function a.note(DT,DU)
local uC=a.grow(DT,9,l.dim)uC.Text=DU return uC end function a.actions(DV,uD)local DW=a.row(DV,28)local uE,mB={},#uD
for e5,uF in ipairs(uD)do uE[e5]=ai(DW,uF[1],uF[2]or l.panel2,10,UDim2 .new((e5-1)/mB,e5>1 and 3 or 0,0,0),UDim2 .new(1/mB,(e5>1 and-3 or 0)+(e5<mB and-3 or 0),1,0))
end return table.unpack(uE)end local function M(cv,hM,DX,DY)a.put(cv,hM and DX or DY)if not a.sw[cv]and a.lit[cv]~=hM then
a.lit[cv]=hM cv.BackgroundColor3=hM and l.accent or l.panel2 cv.TextColor3=a.ink(cv.BackgroundColor3)end end a.title=H("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)H("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
H("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local mC=H("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(mC,8)a.grad(mC,l.accent,l.accent2,45)local uG=P(mC,"C",16,l.ink,true)uG.Font,uG.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local DZ=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))DZ.Font=ae.x P(a.title,"butter farm  "..bY,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local D0=a.list(a.tabs,3)pcall(function()D0 .HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function br(D1,D2,D3)
local hN=H("TextButton",{Text=D1,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(hN,9)local uH=H("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hN)ab(uH,2)a.tabsAll[#a.tabsAll+1]={b=hN,bar=uH,name=D2,sub=D3}return hN end
a.tabFarm=br("🏠","Home","what the farm is doing")a.tabRun=br("🌾","Farm","the buy - wax - collect loop")a.tabBut=br("🧈","Butters","what gets bought and waxed")
a.tabCrt=br("📦","Crates","which crates get opened")a.tabPet=br("🐾","Pets","adopt, wish, fuse")a.tabTeam=br("👥","Teams","the right pets at the right moment")
a.tabSrv=br("🤝","Server","helping, campfire, ghost")a.tabAdm=br("⚡","Admin","admin abuse and its boosts")a.tabSet=br("⚙","Settings","configs, startup, performance")
local function bs()local mD=H("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mD,8)a.pad(mD,8,2,10,12)return mD end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs()a.farm.Visible=true
do local e6=a.farm local uI=a.row(e6,34)a.startB=ai(uI,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(uI,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local D4=a.row(e6,44)local function e7(uJ,D5,uK)local hO=H("Frame",{Position=UDim2 .new((uJ-1)/uK,uJ>1 and 2 or 0,0,0),Size=UDim2 .new(1/uK,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},D4)ab(hO,9)a.stroke(hO,l.line,0.3)local hP=P(hO,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hP.Font,hP.TextXAlignment,hP.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local D6=P(hO,D5,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
D6 .TextXAlignment=Enum.TextXAlignment.Center return hP end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e7(1,"BOUGHT",5),e7(2,"WAXED",5),e7(3,"SOLD",5),e7(4,"MONEY",5),e7(5,"FREE",5)
local uL=a.card(e6,"Right now")a.info=P(a.row(uL,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(uL,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local e8=a.card(e6,"Systems")
a.helpL=a.line(e8,l.info)a.campL=a.line(e8,l.accent2)a.questL=a.line(e8,l.good)a.arL=a.line(e8,l.accent)a.ixL=a.line(e8,mg.Dotonbori)
local uM=a.card(e6,"Activity")a.log=H("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(uM)},uM)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function HT(D7,D8)return a.row(D8 or a.farm,D7)end local al do local mE=a.run
a.heading(mE,"Farm","buy what rolls, wax it, collect the cash")local e9=a.card(mE,"Loop")a.colT=a.switch(e9,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(e9,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hC(al,tostring(d.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(e9,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(e9,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(e9,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local mF=a.card(mE,"By hand")
a.buyB,a.plB=a.actions(mF,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(mF,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(mF,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local hQ=a.but a.heading(hQ,"Butters","what gets bought and waxed")local uN=a.card(hQ,"Strategy")a.ixT=a.switch(uN,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(uN,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hQ)},hQ)a.list(a.butList,5)end do local hR=a.crt a.heading(hR,"Crates","only ticked crates are opened")
local uO=a.card(hR,"Opening")a.crateT=a.switch(uO,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(uO,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hR)},hR)a.list(a.crtList,5)end do local hS=a.pet a.heading(hS,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local e_=a.card(hS,"Automatic")a.pbT=a.switch(e_,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(e_,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(e_,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(e_,10,l.dim)a.note(e_,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hS)},hS)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hT=a.srv a.heading(hT,"Server","other players, the campfire, staying hidden")
local mG=a.card(hT,"Helping")a.helpT=a.switch(mG,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(mG,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mG,l.info)
local uP=a.card(hT,"Campfire")a.campT=a.switch(uP,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(uP,l.accent2)local mH=a.card(hT,"Ghost")a.ghostT=a.switch(mH,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mH,l.dim)a.note(mH,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fa=a.adm a.heading(fa,"Admin abuse","the show, its boosts and the farm in it")local uQ=a.card(fa,"When")
a.admBig=P(a.row(uQ,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(uQ,14),"",10,l.dim,false)local D9=a.card(fa,"Boosts now")
a.admBoost=a.grow(D9,11,l.text)local mI=a.card(fa,"What the farm does")a.shT=a.switch(mI,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mI,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(mI,l.accent)
local uR=a.card(fa,"Show feed")a.admFeed=H("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(uR)},uR)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local dj=a.set a.heading(dj,"Settings","kept on your phone, per config")
local hU=a.card(dj,"Config")al=a.row(hU,28)a.cfgName=hC(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hU,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hU,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(hU,10,l.dim)local mJ=a.card(dj,"Starting")a.startT=a.switch(mJ,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mJ,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(mJ,9,l.dim)local mK=a.card(dj,"If the game drops me")
a.rejT=a.switch(mK,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(mK,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(mK,9,l.dim)local bt=a.card(dj,"Performance")a.pfCalm=a.switch(bt,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bt,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bt,"BASES: ALL DRAWN","Bases","stop drawing other bases, or yours too")
a.pfFps=a.switch(bt,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bt,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bt,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bt,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hC(al,tostring(d.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bt,l.good)a.note(bt,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local D_=a.card(dj,"About")a.note(D_,"CHURN "..bY.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for HU,Ea in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(Ea)end local uS=H("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},mk)
a.tgRoot=H("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},uS)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=H("TextButton",{Text="C",Size=uj,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=H("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=H("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()e.cycleGhost()end)function e.paintGhost()
local fb=e.ghostMode()if a.ghostT then a.put(a.ghostT,e.GHOST[fb][1])end if a.tgGhost then a.tgGhost.Text=e.GHOST[fb][2]
a.tgGhost.BackgroundColor3=fb==2 and l.accent or(fb==1 and l.warn or l.panel)a.tgGhost.TextColor3=fb>0 and l.ink or l.dim
end end local bu={built=false,boxes={},at=0}function a.check(hV,mL)hV.Text=mL and"✓"or""hV.BackgroundColor3=mL and l.accent or l.bg
hV.TextColor3=l.ink local mM=hV.Parent if mM and mM:IsA("TextButton")then mM.BackgroundColor3=mL and l.lit or l.raise end
end local function uT(uU,uV)d.Targets[uU]=uV or nil local uW=bu.boxes[uU]if uW then a.check(uW,uV)end end local function mN()
for Eb,Ec in pairs(bu.boxes)do a.check(Ec,d.Targets[Eb]==true)end end function a.tickBox(Ed)local mO=H("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Ed)ab(mO,6)
a.stroke(mO,l.line,0)return mO end local fc local function Ee()local Ef=a.card(a.butList,"Butter list")local mP=a.row(Ef,26)
a.butInfo=P(mP,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local Eg=ai(mP,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Eh=ai(mP,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))Eg.MouseButton1Click:Connect(function()
for Ei in pairs(d.Targets)do d.Targets[Ei]=nil end mN()end)Eh.MouseButton1Click:Connect(function()ad.at=0 i5()
fc(true)end)end fc=function(Ej)if not i5()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bu.built and not Ej and bu.at==ad.at then return end for HV,hW in ipairs(a.butList:GetChildren())do
if hW:IsA("Frame")or hW:IsA("TextButton")or hW:IsA("TextLabel")then hW:Destroy()end end bu.boxes,a.butEmpty={},nil
Ee()for HW,hX in ipairs(ad.rarOrder)do local mQ=mg[hX]or l.text local cw=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cw,11)a.stroke(cw,mQ,0.7)a.list(cw,4)a.pad(cw,7,7,7,8)
local mR=a.row(cw,22)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=mQ,BorderSizePixel=0},mR)
local Ek=P(mR,hX:upper(),11,mQ,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))Ek.Font=ae.x local El=ai(mR,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local Em=hX El.MouseButton1Click:Connect(function()local uX=ad.members[Em]or{}local uY=false for HY,En in ipairs(uX)do if not d.Targets[En]then uY=true break end end
for HZ,Eo in ipairs(uX)do uT(Eo,uY)end end)for H0,mS in ipairs(ad.members[hX]or{})do local hY=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cw)},cw)ab(hY,8)local uZ=P(hY,ak(mS),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
uZ.TextWrapped,uZ.TextTruncate=false,Enum.TextTruncate.AtEnd local u0=a.tickBox(hY)bu.boxes[mS]=u0 local u1=mS
local function u2()uT(u1,not d.Targets[u1])end hY.MouseButton1Click:Connect(u2)u0 .MouseButton1Click:Connect(u2)
end end mN()bu.built,bu.at=true,ad.at end function L.paint()for Ep,Eq in pairs(L.boxes)do a.check(Eq,d.CrateTicks[Ep]==true)end
if a.crtInfo then local mT,mU=0,0 for H1 in pairs(L.boxes)do mT=mT+1 end for H2,Er in pairs(d.CrateTicks)do if Er then mU=mU+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(mT,mU))end if a.crateT then M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for H3,hZ in ipairs(a.crtList:GetChildren())do if hZ:IsA("Frame")or hZ:IsA("TextButton")or hZ:IsA("TextLabel")then hZ:Destroy()end
end L.boxes={}local mV=a.card(a.crtList,"All of them","worst first")local mW=a.row(mV,26)a.crtInfo=P(mW,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Es=ai(mW,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Et=ai(mW,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(Es.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(Et.MouseButton1Click:Connect(function()L.build()end))
for H4,bv in ipairs(L.list())do local u3=mg[bv.rar or""]or l.text local dk=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(mV)},mV)ab(dk,8)H("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=u3,BorderSizePixel=0},dk)
local u4=P(dk,(bv.title or bv.name)..(bv.guess and"  (?)"or""),11,u3,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
u4 .TextWrapped,u4 .TextTruncate=false,Enum.TextTruncate.AtEnd local Eu=P(dk,bv.price and("$"..aL(bv.price))or(bv.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Eu.TextXAlignment=Enum.TextXAlignment.Right local u5=a.tickBox(dk)L.boxes[bv.k]=u5 local u6=bv.k local function u7()
d.CrateTicks[u6]=(not d.CrateTicks[u6])or nil L.paint()end T(dk.MouseButton1Click:Connect(u7))T(u5 .MouseButton1Click:Connect(u7))
end L.built=L.at L.paint()end local u8="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a1(cx)u8=cx for Ev,mX in ipairs(a.tabKeys)do a[mX].Visible=(mX==cx)local h0=a.tabsAll[Ev]if h0 then
local mY=mX==cx h0 .b.BackgroundTransparency,h0 .b.TextTransparency,h0 .bar.Visible=mY and 0 or 1,mY and 0 or 0.45,mY
end end if cx=="pet"and not q.built then pcall(q.build)end if cx=="team"and not z.built then pcall(z.build)end
if cx=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cx=="but"then fc(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(mZ,u9,u_,va)if va then mZ.Text=va end mZ.BackgroundColor3=u9 and u_ or l.bg mZ.TextColor3=u9 and a.ink(u_)or l.dim
end function q.paintRow(vb)local cy=q.rows and q.rows[vb]if not cy then return end local cz=d.Pets[vb]or{}local fd=tonumber(cz.f)or 0
a.flag(cy.b,cz.b,l.good)a.flag(cy.g,cz.g,l.accent,cz.g and"BIG"or"ANY")a.flag(cy.w,cz.w,l.warn)a.flag(cy.f,fd>0,l.good,fd>=7 and"7 BIG/HUGE"or(fd>0 and(fd.." BIG")or"FUSE"))
if cy.row then cy.row.BackgroundColor3=(cz.b or cz.w or fd>0)and l.lit or l.raise end end function q.flag(m0,h1)
local a9=d.Pets[m0]or{}if h1=="f"then local Ew={[0]=1,[1]=2,[2]=3,[3]=7}local vc=Ew[tonumber(a9 .f)or 0]or 0 a9 .f=vc>0 and vc or nil
elseif a9[h1]then a9[h1]=nil else a9[h1]=true end d.Pets[m0]=(a9 .b or a9 .g or a9 .w or a9 .f)and a9 or nil q.paintRow(m0)
end function q.paintAll()for Ex in pairs(q.rows or{})do q.paintRow(Ex)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local m1=q.wishes()local fe=q.data()for h2,m2 in pairs(q.rows)do local vd=C.status(h2,fe)m2 .desc.Text=(m1[h2]and("wishing %dm | "):format(math.ceil(m1[h2]/60))or"")..(vd and(vd.." | ")or"")..m2 .boostText
m2 .desc.TextColor3=m1[h2]and l.text or l.dim end local ve=tonumber(J:GetAttribute("PetWishCredits"))or 0 a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(fe and#(fe.pets or{})or 0,fe and tonumber(fe.maxOwned)or 60,
aL(q.money()),ve>0 and(" | free wishes "..ve)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local h3=q.info()for H5,h4 in ipairs(a.petList:GetChildren())do if h4:IsA("Frame")or h4:IsA("TextLabel")or h4:IsA("TextButton")then h4:Destroy()end
end q.rows={}if not h3 then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dl={}for H6,vf in ipairs(q.order())do local m3=h3 .Pets[vf].rarity or"?"dl[m3]=dl[m3]or{}
table.insert(dl[m3],vf)end local dm={}for H7,vg in ipairs(h3 .Rarities or{})do if dl[vg]then dm[#dm+1]=vg end end
for vh in pairs(dl)do if not table.find(dm,vh)then dm[#dm+1]=vh end end for H8,m4 in ipairs(dm)do local h5=q.RC[m4]or l.text
local cA=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cA,11)a.stroke(cA,h5,0.7)a.list(cA,4)a.pad(cA,7,7,7,8)local vi=a.row(cA,18)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=h5,BorderSizePixel=0},vi)
local Ey=P(vi,m4:upper(),11,h5,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Ey.Font=ae.x for H9,h6 in ipairs(dl[m4])do
local ff=H("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cA)},cA)
ab(ff,8)local m5=P(ff,q.nice(h6),11,h5,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))m5 .TextWrapped,m5 .TextTruncate=false,Enum.TextTruncate.AtEnd
local Ez,EA=pcall(function()return h3 .describe(h6)end)local vj=Ez and tostring(EA)or""local m6=P(ff,vj,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
m6 .TextYAlignment,m6 .TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function h7(EB,EC,ED)
local vk=ai(ff,EB,l.bg,8,UDim2 .new(1,EC,0,5),UDim2 .new(0,ED,0,22))vk.AutoButtonColor=true return vk end local vl,vm,vn,vo=h7("BUY",-164,30),h7("ANY",-131,30),h7("WISH",-98,34),h7("FUSE",-61,56)
local h8=h6 vl.MouseButton1Click:Connect(function()q.flag(h8,"b")end)vm.MouseButton1Click:Connect(function()q.flag(h8,"g")end)
vn.MouseButton1Click:Connect(function()q.flag(h8,"w")end)vo.MouseButton1Click:Connect(function()q.flag(h8,"f")end)
q.rows[h6]={b=vl,g=vm,w=vn,f=vo,name=m5,desc=m6,boostText=vj,row=ff}end end q.built=true q.paintAll()end function e.paint()
M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,d.HideBases,e.BASES[e.basesMode()],e.BASES[0])M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function e.applyAll()if d.Lite then e.lite(true)end
if d.Calm then e.calm(true)end if d.HideHud then e.hideHud(true)end if d.NoRender then e.render(true)end if d.HideBases then e.bases(true)end
if(d.FpsCap or 0)~=0 then e.cap(d.FpsCap)end e.paint()end T(a.pfLite.MouseButton1Click:Connect(function()e.lite(not d.Lite)e.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()e.calm(not d.Calm)e.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()e.hideHud(not d.HideHud)e.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()e.render(not d.NoRender)e.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()e.setBases((e.basesMode()+1)%3)e.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local EE=table.find(e.CAPS,d.FpsCap or 0)or 1 local vp=e.CAPS[(EE%#e.CAPS)+1]
if not e.cap(vp)and vp~=0 then A("this executor cannot cap fps")end e.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local m7=tonumber(a.pfMem.Text)if m7 and m7>=0 then d.MemLimit=math.floor(m7)end e.paint()end))function z.names()
local m8={"(none)"}for H_,EF in ipairs((z.teams()))do m8[#m8+1]=EF.name end return m8 end function z.cycle(m9,EG)
local h9=z.names()local EH=d[m9]~=""and d[m9]or"(none)"local h_=table.find(h9,EH)or 1 h_=((h_-1+EG)%#h9)+1 d[m9]=h9[h_]=="(none)"and""or h9[h_]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local m_={}for Ia,EI in ipairs((z.teams()))do m_[EI.name]=true end
for EJ,vq in pairs(z.pick)do local dn=d[EJ]vq.Text=dn==""and"(none)"or(m_[dn]and dn or(dn.." (missing)"))vq.TextColor3=(dn~=""and not m_[dn])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local EK,ia=q.srv(),{}for Ib,ib in ipairs(z.list or{})do ia[#ia+1]=("st %-2s %-22s %9s  helps %d"):format(ib.st.Name,ak(W(ib.name)):sub(1,22),z.clock(ib.ends-EK),ib.helps)
end a.tmList.Text=#ia>0 and table.concat(ia,"\n")or"no waxes running"end function z.build()for Ic,ic in ipairs(a.teamList:GetChildren())do
if ic:IsA("Frame")or ic:IsA("TextLabel")or ic:IsA("TextButton")then ic:Destroy()end end z.pick={}local ie=a.card(a.teamList,"Automatic")
a.tmT=a.switch(ie,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(ie,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild z.paint()end)a.tmBuildNow=a.actions(ie,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local EL,EM=pcall(C.rebuild,"you asked")if not EL then A("BUILD ERR "..tostring(EM))end end)
end)a.tmInfo=a.grow(ie,10,l.dim)local vr=a.card(a.teamList,"Which team when")local function ig(ih,EN,EO)local fg=a.row(vr,54)
P(fg,EN,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local vs=P(fg,EO,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
vs.TextWrapped,vs.TextTruncate=false,Enum.TextTruncate.AtEnd local EP=ai(fg,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local vt=ai(fg,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local EQ=ai(fg,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
EP.MouseButton1Click:Connect(function()z.cycle(ih,-1)end)EQ.MouseButton1Click:Connect(function()z.cycle(ih,1)end)
vt.MouseButton1Click:Connect(function()z.cycle(ih,1)end)z.pick[ih]=vt end ig("TeamNormal","Normal","the rest of the time: money + luck")
ig("TeamFull","Full","every station busy: money + wax speed")ig("TeamGlaze","Glaze","worn just before a wax finishes")
local ii=a.row(vr,26)P(ii,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hC(ii,tostring(d.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(ii,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local ER=ai(ii,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
ER.MouseButton1Click:Connect(function()local ij=tonumber(a.tmLead.Text)if ij and ij>=5 and ij<=600 then d.GlazeLead=math.floor(ij)else a.tmLead.Text=tostring(d.GlazeLead)end
z.paint()end)ig("TeamWax","Wax","while a butter is placed: head starts")local vu=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(vu)},vu)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local ES=a.card(a.teamList,"How it works")a.note(ES,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function ET()a.secB.Text=tostring(d.Every)M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")e.paintGhost()o.paint()M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(e.unpin)end end)end
M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eQ(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bQ(a.root)bQ(a.tgRoot)c.lastCollect=y()
mN()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(e.applyAll)end local function EU(vv)task.spawn(function()vv.TextColor3=l.bad
task.wait(0.8)if c.alive then vv.TextColor3=l.text end end)end local function vw()local vx=a.secB.Text:match("^%s*(%d+)%s*$")
local fh=vx and tonumber(vx)if not fh or fh<1 then a.secB.Text=tostring(d.Every)EU(a.secB)A("interval must be a whole number >= 1")
return end if fh==d.Every then return end d.Every,c.lastCollect=fh,y()A("collect every "..fh.."s")end local function N(EW,EX)T(EW.MouseButton1Click:Connect(EX))end
N(a.secSet,vw)T(a.secB.FocusLost:Connect(vw))N(a.colT,function()d.Collect,c.lastCollect=not d.Collect,y()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",sU)end)N(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
d.Help=not d.Help E.nextAt,E.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()d.Quests=not d.Quests F.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,e.cycleGhost)function o.paint()M(a.snapT,d.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
M(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(EY)task.spawn(function()pcall(o.tick)if EY and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local EZ=o.on()d.AutoIndex=not d.AutoIndex o.discAt=-100 o.changed(EZ)end)
N(a.bestT,function()local E0=o.on()d.Best=((d.Best or 0)+1)%5 o.stackAt=-100 o.changed(E0)end)N(a.bcT,function()
local E1=o.on()d.BestCrate=not d.BestCrate o.changed(E1)end)N(a.shT,function()d.Shower=not d.Shower o.paint()
end)N(a.snapT,function()d.SnapGlaze=d.SnapGlaze==false o.paint()end)N(a.pbT,function()d.PetBuy=not d.PetBuy q.paintAll()end)
N(a.pwT,function()d.PetWish=not d.PetWish q.paintAll()end)N(a.pfT,function()d.AutoFuse=not d.AutoFuse q.paintAll()end)
function o.admPaint()local bS=q.srv()local bT pcall(function()o.aac=o.aac or require(af:FindFirstChild("AdminAbuseClient"))
bT=o.aac:GetState()end)local dp,bU="nothing scheduled","the game has not announced one"if type(bT)=="table"then
local fi,a2,bV=tostring(bT.Phase or""),tonumber(bT.StartsAt),tonumber(bT.EndsAt)if a2 and a2<1e9 then a2=nil end
if bV and bV<1e9 then bV=nil end if fi=="Countdown"and a2 then dp,bU="starts in "..z.clock(a2-bS),os.date("%a %H:%M",math.floor(a2)).." your time"
elseif fi=="Live"and bV then dp,bU="LIVE  -  "..z.clock(bV-bS).." left","the farm is grabbing, waxing and glazing through it"
elseif fi~=""and fi~="Idle"and bV and bV>bS then dp,bU=fi:lower().."  -  "..z.clock(bV-bS).." left","after the show"
elseif a2 and a2>bS then dp,bU="next: "..os.date("%a %H:%M",math.floor(a2)),"your time"elseif a2 then dp,bU="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a2)).." your time"
end if type(bT.Kind)=="string"and bT.Kind~=""then bU=bU.."  |  "..bT.Kind end end a.put(a.admBig,dp)a.put(a.admSub,bU)
local dq,na={},af:FindFirstChild("AdminShow")if na then local E2,E3=pcall(function()return na:GetAttributes()end)
for vy,dr in pairs(E2 and E3 or{})do local ik=type(vy)=="string"and vy:match("^(.-)Mult$")local nb=ik and tonumber(na:GetAttribute(ik.."Until"))
if ik and type(dr)=="number"and dr~=1 and dr~=0 and nb and nb>bS then dq[#dq+1]=("%s  x%s   %s left"):format(ik:gsub("(%l)(%u)","%1 %2"),(dr%1==0)and tostring(dr)or("%.2f"):format(dr),
z.clock(nb-bS))end end end table.sort(dq)a.put(a.admBoost,#dq>0 and table.concat(dq,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dq>0 and l.accent or l.dim local il=0 for Ie in pairs(O.drops)do il=il+1 end local vz=o.snapAt and(o.snapAt-bS)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,il>0 and(", "..il.." falling")or"",
vz and("in "..math.max(0,math.floor(vz)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",d2,true)end)N(a.padB,function()c.plot=bw()or c.plot local vA,nc=ap(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(vA and nc and nc:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=nc.CFrame:ToObjectSpace(vA.HumanoidRootPart.CFrame)
BL(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eQ(not c.running)end)N(a.buyB,function()
c.plot=bw()or c.plot task.spawn(as,"buying (manual)...",o9,true)end)N(a.plB,function()c.plot=bw()or c.plot task.spawn(as,"waxing (manual)...",pc)
end)N(a.tabFarm,function()a1("farm")end)N(a.tabRun,function()a1("run")end)N(a.tabSrv,function()a1("srv")end)N(a.tabAdm,function()a1("adm")end)
N(a.tabBut,function()a1("but")end)N(a.tabSet,function()a1("set")end)N(a.tabCrt,function()a1("crt")end)N(a.tabPet,function()a1("pet")end)
N(a.tabTeam,function()a1("team")end)local function E4(nd)c.hidden=nd a.root.Visible=not nd a.tgBtn.TextColor3=nd and l.text or l.ink
end uq(a.tgBtn,a.tgRoot,function()bQ(a.tgRoot)c.togPos=hH(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then E4(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aJ,aw={},0 local function bW()aJ=ow()if#aJ==0 then a.cfgPick.Text="(none saved)"
aw=0 return end if aw<1 or aw>#aJ then aw=1 end a.cfgPick.Text=aJ[aw]..("  (%d/%d)"):format(aw,#aJ)end local function vB()
local vC=c.autoload~=nil a.cfgAuto.Text=vC and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=vC and l.accent or l.panel2
end local function ne()local vD=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if vD~=""then return vD end return(aw>0 and aJ[aw])or""
end N(a.cfgSave,function()c.winPos=hH(a.root)or c.winPos c.togPos=hH(a.tgRoot)or c.togPos local vE,vF=fX(ne())
a.cfgMsg.Text=vE and("saved as "..vF)or("could not save: "..vF)a.cfgMsg.TextColor3=vE and l.good or l.bad bW()
A(a.cfgMsg.Text)end)local function E5(nf)local ng,vG=oF(nf)a.cfgMsg.Text=ng and("loaded "..vG)or("could not load: "..vG)
a.cfgMsg.TextColor3=ng and l.good or l.bad if ng then a.cfgName.Text=nf ET()task.spawn(D.apply,"config "..nf)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()E5(ne())end)N(a.cfgPick,function()bW()if aw>0 then a.cfgName.Text=aJ[aw]end
end)N(a.cfgPrev,function()if#aJ==0 then bW()return end aw=(aw-2)%#aJ+1 bW()a.cfgName.Text=aJ[aw]end)N(a.cfgNext,function()
if#aJ==0 then bW()return end aw=aw%#aJ+1 bW()a.cfgName.Text=aJ[aw]end)N(a.cfgAuto,function()if c.autoload then
oH(nil)a.cfgMsg.Text="it will not load a config on launch"else local fj=ne()local vH=false for If,E6 in ipairs(ow())do if E6==fj then vH=true end end
local E7=vH or fX(fj)if E7 and fj~=""then oH(fj)bW()a.cfgMsg.Text=fj.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim vB()end)N(a.autoB,function()
local vI,vJ=xD()a.autoMsg.Text=vI and("installed. "..vJ)or("failed: "..vJ)a.autoMsg.TextColor3=vI and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dL("you asked")end)
local a_=false N(a.minB,function()a_=not a_ a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not a_,not a_,not a_
if a_ then for Ig,E8 in ipairs(a.tabKeys)do a[E8].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a1(u8)
end a.root.Size=UDim2 .new(0,Q.w,0,a_ and(Q.head+Q.status+12)or Q.h)a.minB.Text=a_ and"+"or"-"end)local function im()
if not c.alive then return end c.alive,c.running=false,false pcall(e.restoreAll)pcall(fw)for Ih,E9 in ipairs(iw)do pcall(function()E9:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()ml:Destroy()end)
pcall(function()uS:Destroy()end)if cC.SAB_KILL==im then cC.SAB_KILL=nil end end cC.SAB_KILL=im N(a.killB,im)N(a.xB,im)
uq(a.title,a.root,function()bQ(a.root)c.winPos=hH(a.root)or c.winPos end)local function vK()local fk,cB=c.reason,c.level
if c.busy then fk,cB=c.busyText,"ok"elseif not c.running then local Ii,vL,E_=tv()if c.capHit then fk,cB=vL,"bad"else fk,cB="[stopped] "..vL,(E_=="bad")and"bad"or"idle"end
c.reason,c.level=fk,cB end local ds=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=ds then
a.lit.dot=ds a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=ds,ds,ds,ds a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fk)if a.lit.bar~=cB then a.lit.bar=cB a.bar.BackgroundColor3=CX[cB]or l.dim end
if a_ then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bX=xc()if a.farm.Visible then local Fa,Fb=ft()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Fa.."/"..Fb)local vM=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(y()-c.lastCollect)))or nil
local vN=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aL(ba()),c.rolls,c.gifts,c.crates,vN and ak(W(vN))or"nothing",j.on and("   ["..j.title.." window open]")or"",
vM and("in "..vM.."s")or"off"))a.put(a.tgt,(#bX==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bX<=3)and table.concat(bX,", ")or(#bX.." butters ticked"))))
if a.lit.tgt~=(#bX==0)then a.lit.tgt=(#bX==0)a.tgt.TextColor3=(#bX==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fn,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(d.Help or d.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,d.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,e.ghostMode()>0 and(e.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bX))
end if a.but.Visible and bu.at~=ad.at then fc(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(e.fps+0.5),e.mem,e.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((d.Help or d.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(d.Campfire and K.msg or"off")..(e.ghostMode()>0 and(e.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(d.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local vO=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",vO~=""and vO or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cC.SAB={S=c,CFG=d,EV=V,U=a,sg=ml,CAT=ad,LEARN=aj,buildList=fc,
logAll=dt,evAll=du,AR=D,CR=L,PF=e,PX=q,TM=z,CRATE=j,FU=C,HX=E,CF=K,QX=F,IX=o,SH=O}A(bY.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a1("farm")bQ(a.root)bQ(a.tgRoot)if hE then pcall(function()T(hE:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bQ(a.root)bQ(a.tgRoot)end))end)end bW()vB()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")e.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(e.applyAll)pcall(vK)task.spawn(function()local vP=xA()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(vP and("\n(backup: "..vP..")")or"")
local vQ=fR(an.exec)if vQ and not vQ:find("SAB autoloader v2",1,true)then dH(an.exec,an.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fR(an.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(xJ)end)task.spawn(function()while c.alive do local Fc,Fd=pcall(vK)if not Fc then A("UI ERR "..tostring(Fd))end
task.wait((c.hidden or a_)and 1.5 or 0.4)end end)task.spawn(function()local Fe,Ff=pcall(xR)if not Fe then A("HOOK ERR "..tostring(Ff))end
end)task.spawn(function()pcall(wz)if j.loadSeq and not j.learned then local io={}for vR=1,20 do if j.loadSeq[vR]then io[#io+1]=j.loadSeq[vR]end end
if#io>0 then j.learned={seq=io,mode=j.loadMode}A("remembered how to open crates directly")end end if i5()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local Fg,vS=pcall(BN)if Fg and vS and c.alive and not c.manualPad then c.manualPad=vS end end)task.spawn(function()
while c.alive do local nh,ni=pcall(q.buyTick)if not nh then A("PET ERR "..tostring(ni))task.wait(5)end nh,ni=pcall(q.wishTick)
if not nh then A("WISH ERR "..tostring(ni))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local ip,vT=0,y()
T(game:GetService("RunService").Heartbeat:Connect(function()ip=ip+1 if e.hideI<=#e.hideQ then pcall(e.hideStep)end end))
T(game:GetService("RunService").Heartbeat:Connect(function()if e.hold then pcall(e.pinTick)end end))e.noteAt=y()
while c.alive do task.wait(1)local vU=y()e.fps,ip,vT=ip/math.max(vU-vT,0.001),0,vU local Fh,Fi=pcall(e.tick)if not Fh then A("PERF ERR "..tostring(Fi))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local Fj,Fk=pcall(C.tick)if not Fj then A("FUSE ERR "..tostring(Fk))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local Fl,Fm=pcall(z.tick)if not Fl then A("TEAM ERR "..tostring(Fm))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local iq=af:WaitForChild("Remotes",30)local vV=iq and iq:WaitForChild("ClanEvent",30)
if vV and c.alive then T(vV.OnClientEvent:Connect(function(Fn,Fo)if Fn=="call"then pcall(E.onCall,Fo)end end))
end local vW=iq and iq:FindFirstChild("RollConfirmAsk")if vW and c.alive then T(vW.OnClientEvent:Connect(function(Fp)F.asked=Fp or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(e.calmScan)end end end)task.spawn(function()
local nj=af:WaitForChild("Remotes",30)if not(nj and c.alive)then return end local function ir(Fq,Fr)local nk=nj:FindFirstChild(Fq)
if nk and nk:IsA("RemoteEvent")then T(nk.OnClientEvent:Connect(function(...)pcall(Fr,...)end))end end ir("NewSquishyDiscovered",function(nl,vX)
if type(nl)~="string"then return end o.disc=o.disc or{}o.disc[W(nl)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(nl)),vX and(" ("..tostring(vX)..")")or""))
end)ir("IndexRefresh",o.loadDisc)ir("IndexRowComplete",function(Fs)A("INDEX: the whole "..tostring(Fs).." row is complete")end)
ir("AdminShow",o.admin)local vY=nj:FindFirstChild("AdminShowSync")if vY then local Ft,vZ=pcall(function()return vY:InvokeServer()end)
if Ft and type(vZ)=="table"then for Ij,Fu in pairs(vZ)do pcall(O.add,Fu)end end end while c.alive do local Fv,Fw=pcall(o.tick)
if not Fv then o.msg="index error: "..tostring(Fw)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Fx,Fy=pcall(F.tick)if not Fx then A("QUEST ERR "..tostring(Fy))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(fw)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local FA=(type(newcclosure)=="function")and newcclosure or function(Fz)return Fz end local nm
local v0=(type(setnamecallmethod)=="function")and setnamecallmethod or nil nm=hookmetamethod(game,"__namecall",FA(function(v1,...)
local fl=getnamecallmethod()if c.alive and(fl=="InvokeServer"or fl=="FireServer")then local v2,v3=pcall(function()return v1 .Name end)
if v2 and v3=="CrateAction"and not j.replaying then pcall(j.saw,fl,...)elseif v2 and v3=="AutoRollAction"and not D.replaying then pcall(D.saw,fl,...)end
if v0 then v0(fl)end end return nm(v1,...)end))j.oldNC=nm end)end if iu then T(J.Idled:Connect(function()pcall(function()iu:CaptureController()iu:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Ik=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ap()and(c.plot or bw())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local is=b3()
if is and o.on()and not aK(is.name)then is=nil end if c.alive and d.AutoRoll and c.running and not D.isOn()and not is and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Il=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bw()if ap()and c.plot and o.any()then eQ(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bw()c.lastCollect=y()while c.alive do if c.running then local FB,v4=pcall(CS)if not FB and v4~=iv then A("LOOP ERR "..tostring(v4))end
end task.wait(0.1)end end)it("ready - the window is at the top left")end local FD,nn=xpcall(v8,function(FC)return tostring(FC).."\n"..debug.traceback()end)
if not FD then pcall(function()warn("SAB "..bY.." ERROR: "..tostring(nn))end)it("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bY.." ERROR: "..tostring(nn))end)pcall(function()local v5=(type(getgenv)=="function"and getgenv())or _G
if type(v5 .SAB_KILL)=="function"then v5 .SAB_KILL()end for Im,FE in ipairs({"SABFarmGui","SABToggle"})do local v6=J.PlayerGui:FindFirstChild(FE)
if v6 then v6:Destroy()end end end)pcall(function()local fm=Instance.new("ScreenGui")fm.Name="SABError"fm.ResetOnSpawn=false
fm.DisplayOrder=1000 local a3=Instance.new("TextBox")a3 .Size=UDim2 .new(0,340,0,170)a3 .Position=UDim2 .new(0,10,0,50)
a3 .BackgroundColor3=Color3 .fromRGB(90,20,20)a3 .TextColor3=Color3 .new(1,1,1)a3 .TextSize=11 a3 .TextWrapped=true
a3 .ClearTextOnFocus=false a3 .TextXAlignment=Enum.TextXAlignment.Left a3 .TextYAlignment=Enum.TextYAlignment.Top
a3 .Text="SAB "..bY.." failed to start. Send this text:\n"..tostring(nn)a3 .Parent=fm fm.Parent=J:WaitForChild("PlayerGui")
end)end
