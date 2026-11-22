local bY="v27"local ni=game:GetService("Players")local J=ni.LocalPlayer or ni.PlayerAdded:Wait()local function ir(v0)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bY,Text=v0,Duration=6})
end)end ir("script started")local function v1()local af=game:GetService("ReplicatedStorage")local ao=game:GetService("Workspace")
local nj=game:GetService("UserInputService")local cC=(type(getgenv)=="function"and getgenv())or _G if type(cC.SAB_KILL)=="function"then pcall(cC.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local is=(function()local v2,v3=pcall(function()return game:GetService("VirtualUser")end)return v2 and v3 or nil end)()
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
local q,z,e,C,E,K,F={},{},{},{},{},{},{}local o,O={},{}local it={}local iu,fn,dt,du={},{},{},{}local function T(nk)iu[#iu+1]=nk return nk end
local function ag(v4)task.wait(v4)if not c.alive then error(it,0)end end local function A(fo)fo=os.date("%H:%M:%S").." "..tostring(fo)
table.insert(fn,1,fo)if#fn>6 then table.remove(fn)end c.logN=(c.logN or 0)+1 dt[#dt+1]=fo if#dt>80 then table.remove(dt,1)end
end local function fp(nl)if type(nl)~="string"then return""end return(nl:lower():gsub("[^%w]",""))end local function W(v5)
local nm=fp(v5)local iv=nm:gsub("butter$","")if iv==""then iv=nm end return iv end local function aK(nn)if type(nn)~="string"then return false end
local iw=W(nn)if iw==""then return false end if o.want then return o.want(iw)end return d.Targets[iw]==true end
local function v6(dv)dv=dv:lower()return dv:find("squishy",1,true)~=nil or dv:match("butter$")~=nil or dv:match("butter[^%a]")~=nil
end local ix={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aL(dw)if type(dw)~="number"then return"?"end
local fq=1 while math.abs(dw)>=1000 and fq<#ix do dw=dw/1000 fq=fq+1 end local v7=string.format("%.2f",dw):gsub("%.?0+$","")
return v7 ..ix[fq]end local function v8(no)if type(no)~="string"then return nil end local v9,dx=no:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local iy=tonumber(v9)if not iy then return nil end if dx==""then return iy end local v_={qd="qa",qn="qi"}dx=v_[dx:lower()]or dx
for wa,wb in ipairs(ix)do if wb:lower()==dx:lower()then return iy*1000^(wa-1)end end return nil end local function ba()
local np=J:GetAttribute("BoardValueMoney")if type(np)=="number"then return np end local nq=J:FindFirstChild("leaderstats")
if nq then for Fq,wc in ipairs({"Cash","Money","Coins"})do local iz=nq:FindFirstChild(wc)if iz and type(iz.Value)=="number"then return iz.Value end
end end end local function fr(wd)local iA=wd:GetFullName()if c.plot then local iB=c.plot:GetFullName()if iA:sub(1,#iB)==iB then return iA:sub(#iB+2)end
end return iA end local function ap()local fs=J.Character if fs and fs:FindFirstChild("HumanoidRootPart")then
local nr=fs:FindFirstChildOfClass("Humanoid")if nr and nr.Health>0 then return fs end end end local function bw()
local iC=ao:FindFirstChild("Plots")if not iC then return nil end local function ns(we)local nt=we:FindFirstChild("Plate")
return nt~=nil and nt:FindFirstChild("EditStackAttachment",true)~=nil end local nu=J:GetAttribute("PlotNumber")
if nu~=nil then local iD=iC:FindFirstChild(tostring(nu))if iD and ns(iD)then return iD end end for Fr,nv in ipairs(iC:GetChildren())do
if ns(nv)then return nv end end end local function dy(nw)local bx=nw and nw.Parent for Fs=1,6 do if not bx then return nil end
if bx:IsA("BasePart")then return bx end if bx:IsA("Model")then return bx.PrimaryPart or bx:FindFirstChildWhichIsA("BasePart",true)end
bx=bx.Parent end end local function nx(ny)local iE=ny.Parent if iE and iE:IsA("Attachment")then return iE.WorldPosition end
local nz=dy(ny)return nz and nz.Position end local function nA()local cD=c.plot and c.plot:FindFirstChild("Plate")
if not cD then return nil end if cD:IsA("BasePart")then return cD.Position end if cD:IsA("Model")then return cD:GetPivot().Position end
local nB=cD:FindFirstChildWhichIsA("BasePart",true)return nB and nB.Position end local function nC()local iF={}
local nD=c.plot and c.plot:FindFirstChild("WaxStations")if nD then for Ft,wf in ipairs(nD:GetChildren())do local nE=wf:FindFirstChild("SquishyPlaceHolder")
local iG=nE and nE:FindFirstChild("PlacePrompt")if iG and iG:IsA("ProximityPrompt")then iF[#iF+1]=iG end end end
return iF end local function ft()local nF,iH=nC(),0 for Fu,wg in ipairs(nF)do if wg.Enabled then iH=iH+1 end end
local iI=#nF local iJ=J:GetAttribute("WaxStations")if type(iJ)=="number"and iJ>iI then iI=iJ end return iH,iI
end local function wh()local nG=ap()local nH=nG and nG.HumanoidRootPart.Position local iK,nI for Fv,iL in ipairs(nC())do
if iL.Enabled then local nJ=nx(iL)local nK=(nJ and nH)and(nJ-nH).Magnitude or 1e9 if not iK or nK<nI then iK,nI=iL,nK end
end end return iK end local function nL()local fu=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fu then return nil end local nM=fu:FindFirstChild("BuyPromptAttachment")local fv=(nM and nM:FindFirstChild("BuyPrompt"))or fu:FindFirstChild("BuyPrompt",true)
if fv and fv:IsA("ProximityPrompt")and fv:IsDescendantOf(fu)then return fv end end local nN={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local wi={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iM="SAB_order.txt"local function fw()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for wj,wk in pairs(aj.price)do aB[#aB+1]="P|"..wj.."|"..string.format("%.0f",wk)end for wl,wm in pairs(aj.order)do aB[#aB+1]="O|"..wl.."|"..table.concat(wm,",")end
if j.learned and j.enc then aB[#aB+1]="M|mode|"..tostring(j.learned.mode or"")for wn,fy in ipairs(j.learned.seq)do
local nO={}for nP=1,fy.n do nO[nP]=j.enc(fy.args[nP])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(wn,fy.m,fy.n,table.concat(nO,";"))
end end local function iN(wo,wp,fz)local nQ={}for nR=1,fz.n do nQ[nR]=j.enc(fz.args[nR])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(wp,wo,fz.m,fz.n,table.concat(nQ,";"))
end if j.enc then for wq,wr in ipairs(D.rec.rules)do iN("rules",wq,wr)end if D.rec.on then iN("on",0,D.rec.on)end
if D.rec.off then iN("off",0,D.rec.off)end end for Fw,dz in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dz.name,dz.title or"",dz.rar or"",dz.price and string.format("%.0f",dz.price)or"")
end if pcall(writefile,iM,table.concat(aB,"\n"))then aj.dirty=false end end local function ws()if type(isfile)~="function"or type(readfile)~="function"then return end
local wt,wu=pcall(isfile,iM)if not(wt and wu)then return end local wv,nS=pcall(readfile,iM)if not(wv and type(nS)=="string")then return end
for ww in nS:gmatch("[^\n]+")do local cE,cF,bc=ww:match("^(%a)|([^|]+)|(.*)$")if cE=="P"then aj.price[cF]=tonumber(bc)
elseif cE=="M"then j.loadMode=(bc~=""and bc~="nil")and bc or nil elseif cE=="A"and j.dec then local nT=tonumber(cF)
local nU,fA,wx=bc:match("^([^|]+)|(%d+)|(.*)$")if nT and nU then fA=tonumber(fA)local nV,fB={},0 for wy in(wx..";"):gmatch("([^;]*);")do
fB=fB+1 if fB<=fA then nV[fB]=j.dec(wy)end end j.loadSeq=j.loadSeq or{}j.loadSeq[nT]={m=nU,n=fA,args=nV}end elseif cE=="R"and j.dec then
local nW=tonumber(cF)local fC,wz,fD,wA=bc:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if nW and fC then fD=tonumber(fD)
local nX,fE={},0 for wB in(wA..";"):gmatch("([^;]*);")do fE=fE+1 if fE<=fD then nX[fE]=j.dec(wB)end end local iO={m=wz,n=fD,args=nX}
if fC=="rules"then D.rec.rules[nW]=iO elseif fC=="on"then D.rec.on=iO elseif fC=="off"then D.rec.off=iO end end
elseif cE=="K"then local nY,nZ,wC=bc:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cF)]={name=cF,title=nY~=""and nY or nil,
rar=nZ~=""and nZ or nil,price=tonumber(wC)}elseif cE=="O"and bc~=""then local fF={}for wD in bc:gmatch("[^,]+")do fF[#fF+1]=wD end
if#fF>0 then aj.order[cF]=fF end end end end local function wE(fG)if type(fG)~="table"then return end local bZ,n0=fG.rarity,fG.contents
if type(bZ)~="string"or bZ==""or type(n0)~="table"then return end local dA={}for Fx,fH in ipairs(n0)do if type(fH)=="table"and type(fH.butter)=="string"then
dA[#dA+1]={n=fH.butter,ch=tonumber(fH.chance)or 0}end end if#dA==0 then return end table.sort(dA,function(wF,wG)return wF.ch>wG.ch end)
local dB,dC={},false for wH,wI in ipairs(dA)do dB[wH]=wI.n end local iP=aj.order[bZ]if not iP or#iP~=#dB then dC=true end
if not dC then for n1=1,#dB do if iP[n1]~=dB[n1]then dC=true break end end end aj.order[bZ]=dB local iQ=tonumber(fG.price)
if iQ and aj.price[bZ]~=iQ then aj.price[bZ]=iQ dC=true end if dC then aj.dirty=true ad.at=0 A("learned the "..bZ.." order from its crate")
end end local function cG(wJ,wK)local wL=wJ:FindFirstChild(wK,true)local wM,iR=pcall(function()return wL.Text end)
return(wM and type(iR)=="string"and iR~="")and iR or nil end local function ak(n2)return ad.pretty[n2]or n2 end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(wN)return fp(wN or"")end
function L.learn(bd)if type(bd)~="table"or type(bd.name)~="string"then return end local iS=L.key(bd.name)local be=L.seen[iS]or{}
local wO=(L.seen[iS]==nil)or(tonumber(bd.price)and be.price~=tonumber(bd.price))be.name,be.title=bd.name,bd.title or be.title
be.rar,be.price=bd.rarity or be.rar,tonumber(bd.price)or be.price L.seen[iS]=be if wO then L.at,aj.dirty=y(),true end
end function L.wanted(n3)if n3==nil then return false end local iT=L.key(n3)return d.CrateTicks[iT]==true or(d.BestCrate and o.bestCrate~=nil and(iT==o.bestCrate or iT==o.bestCrateTitle))
end function L.list()local cH={}for wP,fI in ipairs(L.base)do cH[L.key(fI[1])]={name=fI[1],title=fI[2],rar=fI[3],i=wP}end
for Fy,dD in ipairs(ad.rarOrder)do local n4=false for Fz,wQ in pairs(cH)do if wQ.rar==dD then n4=true break end end
if not n4 and dD~="?"then local n5=dD:gsub("[^%w]","").."Crate"cH[L.key(n5)]={name=n5,title=dD.." Crate",rar=dD,i=50,guess=true}
end end for n6,fJ in pairs(L.seen)do local a4=cH[n6]or{i=100}a4 .name,a4 .title,a4 .rar=fJ.name or a4 .name,fJ.title or a4 .title,fJ.rar or a4 .rar
a4 .price,a4 .guess=fJ.price or a4 .price,nil cH[n6]=a4 end local dE,fK={},{}for wR,wS in ipairs(nN)do dE[wS]=wR end
for wT,n7 in ipairs(ad.rarOrder)do dE[n7]=dE[n7]or(20+wT)end for wU,dF in pairs(cH)do dF.k=wU dF.price=dF.price or aj.price[dF.rar or""]
fK[#fK+1]=dF end table.sort(fK,function(b0,b1)if b0 .price and b1 .price and b0 .price~=b1 .price then return b0 .price<b1 .price end
local n8,n9=dE[b0 .rar or""]or 99,dE[b1 .rar or""]or 99 if n8~=n9 then return n8<n9 end if(b0 .i or 100)~=(b1 .i or 100)then return(b0 .i or 100)<(b1 .i or 100)end
return b0 .k<b1 .k end)return fK end local function wV()local n_=af:FindFirstChild("Assets")local oa=n_ and n_:FindFirstChild("Squishies")
if not oa then return false end local iU,ob,cI={},{},{}local fL=0 for FA,fM in ipairs(oa:GetChildren())do local dG=W(fM.Name)
if dG~=""and not iU[dG]then local fN=cG(fM,"RarityText")or"?"iU[dG]=fN ob[dG]=cG(fM,"NameText")or fM.Name cI[fN]=cI[fN]or{}
table.insert(cI[fN],dG)fL=fL+1 end end if fL==0 then return false end for oc,wW in pairs(cI)do local od=aj.order[oc]or wi[oc]
local iV={}if od then for wX,wY in ipairs(od)do iV[W(wY)]=wX end end table.sort(wW,function(oe,of)local iW,iX=iV[oe],iV[of]
if iW and iX then return iW<iX end if iW then return true end if iX then return false end return ak(oe)<ak(of)
end)end local iY={}for wZ,w0 in ipairs(nN)do iY[w0]=wZ end local fO,b2={},{}for w1 in pairs(cI)do fO[#fO+1]=w1 end
pcall(function()for w2,w3 in ipairs(require(af.Modules.SquishyRNG).Keys)do b2[w3]=w2 end end)table.sort(fO,function(cJ,cK)
if b2[cJ]and b2[cK]and b2[cJ]~=b2[cK]then return b2[cJ]<b2[cK]end local iZ,i0=aj.price[cJ],aj.price[cK]if iZ and i0 and iZ~=i0 then return iZ<i0 end
local i1,i2=iY[cJ],iY[cK]if i1 and i2 then return i1<i2 end if i1 then return true end if i2 then return false end
return cJ<cK end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=iU,ob,cI,fO,fL,y()return true end local function i3()
if ad.at==0 or(y()-ad.at)>120 then pcall(wV)end return ad.n>0 end local function w4(w5)local og=W(w5)return ad.rar[og]or(V.name and W(V.name)==og and V.rar)or"?"
end local function w6()local fP={}local w7=((d.Best or 0)>0 and next(o.best or{}))and o.best or d.Targets for w8,w9 in pairs(w7)do if w9 then fP[#fP+1]=ak(w8)end end
table.sort(fP)return fP end local am={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function oh()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fQ(oi)if type(makefolder)~="function"then return end local w_,xa=pcall(isfolder,oi)if not(w_ and xa)then pcall(makefolder,oi)end
end local function fR(oj)if type(isfile)~="function"or type(readfile)~="function"then return nil end local xb,xc=pcall(isfile,oj)
if not(xb and xc)then return nil end local xd,xe=pcall(readfile,oj)return xd and xe or nil end local function dH(xf,xg)
if type(writefile)~="function"then return false end return(pcall(writefile,xf,xg))end local function ol(xh)local dI={}
if type(listfiles)~="function"then return dI end local xi,om=pcall(listfiles,xh)if not xi or type(om)~="table"then return dI end
for FB,xj in ipairs(om)do dI[#dI+1]=tostring(xj)end return dI end local function oo()local fS={}for FC,xk in ipairs(ol(am.cfg))do
local op=xk:match("([^/\\]+)%.txt$")if op then fS[#fS+1]=op end end table.sort(fS)return fS end local function xl()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(d.Every)aa[#aa+1]="N|GlazeLead|"..tostring(d.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(d.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(d.MemLimit)aa[#aa+1]="N|Best|"..tostring(d.Best or 0)for FD,oq in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..oq.."|"..d[oq]end
do local fT={}for xm,dJ in pairs(d.Pets)do local ot=(dJ.b and"b"or"")..(dJ.g and"g"or"")..(dJ.w and"w"or"")..((tonumber(dJ.f)or 0)>0 and tostring(dJ.f)or"")
if ot~=""then fT[#fT+1]=xm.."|"..ot end end table.sort(fT)aa[#aa+1]="P|-"for FE,xn in ipairs(fT)do aa[#aa+1]="P|"..xn end
end for FF,ou in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..ou.."|"..(d[ou]and"1"or"0")end local i4=J:GetAttribute("AutoRollRules")if type(i4)=="string"and i4~=""then d.ARrules,d.ARstop=i4,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then aa[#aa+1]="S|rules|"..d.ARrules aa[#aa+1]="S|stop|"..d.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for FG,i5 in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fU={}for xo,xp in pairs(i5[2])do if xp then fU[#fU+1]=xo end end table.sort(fU)aa[#aa+1]=i5[1].."|-"for FH,xq in ipairs(fU)do aa[#aa+1]=i5[1].."|"..xq end
end return table.concat(aa,"\n")end local function xr(i6)if type(i6)~="string"or i6==""then return false end local ov,ow,ox,oy,dK={},false,{},false,nil
for xs in i6:gmatch("[^\n]+")do local aC,ah,ax=xs:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ah=="Every"then local i7=tonumber(ax)
if i7 and i7>=1 then d.Every=math.floor(i7)end elseif aC=="N"and(ah=="FpsCap"or ah=="MemLimit")then local i8=tonumber(ax)
if i8 and i8>=0 then d[ah]=math.floor(i8)end elseif aC=="N"and ah=="Best"then local fV=tonumber(ax)if fV and fV>=0 and fV<=4 then d.Best=math.floor(fV)end
elseif aC=="N"and ah=="GlazeLead"then local fW=tonumber(ax)if fW and fW>=5 and fW<=600 then d.GlazeLead=math.floor(fW)end
elseif aC=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then d[ah]=ax elseif aC=="P"and ah~=""then
if not dK then dK={}end if ah~="-"and ax~=""then dK[ah]={b=ax:find("b",1,true)and true or nil,g=ax:find("g",1,true)and true or nil,
w=ax:find("w",1,true)and true or nil,f=tonumber(ax:match("%d"))}end elseif aC=="B"then if d[ah]~=nil then d[ah]=(ax=="1")end
elseif aC=="S"and ah=="rules"then d.ARrules=ax elseif aC=="S"and ah=="stop"then d.ARstop=ax elseif aC=="W"then
c.winPos={tonumber(ah)or 10,tonumber(ax)or 44}elseif aC=="G"then c.togPos={tonumber(ah)or 10,tonumber(ax)or 300}
elseif aC=="T"and ah~=""then if ah~="-"then ov[ah]=true end ow=true elseif aC=="K"and ah~=""then if ah~="-"then ox[ah]=true end
oy=true end end if ow then d.Targets=ov end if oy then d.CrateTicks=ox end if dK then d.Pets=dK end return true
end local function fX(cL)if not oh()then return false,"this executor cannot write files"end cL=(cL or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cL==""then return false,"give the config a name"end fQ(am.dir)fQ(am.cfg)if not dH(am.cfg.."/"..cL..".txt",xl())then return false,"could not write the file"end
c.config=cL return true,cL end local function oz(fY)local oA=fR(am.cfg.."/"..fY..".txt")if not oA then return false,"no config called "..tostring(fY)end
if not xr(oA)then return false,"that config looks empty"end c.config=fY return true,fY end local function oB(i9)
if i9 then fQ(am.dir)dH(am.auto,i9)elseif type(delfile)=="function"then pcall(delfile,am.auto)else dH(am.auto,"")
end c.autoload=i9 end local function xt()if c.selfPath then return c.selfPath end local fZ for FI,xu in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",am.dir})do
for FJ,oC in ipairs(ol(xu))do local i_=oC:lower()if i_:sub(-4)==".lua"and(i_:find("sab_farm",1,true)or i_:find("sab farm",1,true))then
fZ=fZ or oC end end end c.selfPath=fZ return fZ end am.stub=[[
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
local function xv()if not oh()then return false,"this executor cannot write files"end fQ("autoexec")if not dH(am.exec,am.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local f0=(function()local xw,xx=pcall(function()return game:GetService("TeleportService")end)return xw and xx or nil end)()
local function oD()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local xy=queueonteleport or queue_on_teleport return(pcall(xy,am.stub))end local function dL(xz)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..xz..")")pcall(fw)if c.autoload then pcall(fX,c.autoload)end local xA=oD()A(xA and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for FK=1,30 do if not f0 then break end pcall(function()f0:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function xC()local xD,oE=pcall(function()return game:GetService("GuiService")end)if xD and oE then
pcall(function()T(oE.ErrorMessageChanged:Connect(function()if d.Rejoin then dL("roblox error message")end end))
end)end pcall(function()local oF=game:GetService("CoreGui")local oG=oF and oF:WaitForChild("RobloxPromptGui",15)
local oH=oG and oG:WaitForChild("promptOverlay",15)if oH then T(oH.ChildAdded:Connect(function(xE)if d.Rejoin and tostring(xE.Name):lower():find("errorprompt",1,true)then dL("disconnect prompt")end
end))end end)if f0 then pcall(function()T(f0 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dL("teleport retry")end)end
end))end)end end local function oI(xF)local oJ=c.plot and c.plot:FindFirstChild(xF)if not oJ then return nil,false end
for FL,ja in ipairs(oJ:GetChildren())do if ja:IsA("Model")or ja:IsA("BasePart")then return ja,true end end return nil,true
end local function b3()local by=oI("RolledSquishy")if not by then return nil end return{model=by,name=by.Name,pretty=cG(by,"NameText")or ak(W(by.Name)),
rar=cG(by,"RarityText")or w4(by.Name),price=cG(by,"PriceText")}end local function oK(jb)return type(jb)=="string"and(ad.rar[W(jb)]~=nil or v6(jb))
end local function ac()local jc=oI("SquishyEquipped")if jc then c.carrySrc,j.heldAt="model",y()return jc.Name,jc end
local oL=J.Character if oL then for FM,dM in ipairs(oL:GetDescendants())do if(dM:IsA("Model")or dM:IsA("Tool"))and oK(dM.Name)then
c.carrySrc,j.heldAt="character",y()return dM.Name,dM end end end local f1=J:GetAttribute("SquishyEquipped")if type(f1)=="string"and f1~=""and oK(f1)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return f1,nil end c.carrySrc=nil end local function FN()local FO,xG=ac()return xG end local function dN()
local oM=b3()local jd=oM and v8(oM.price)local je=ba()if jd and je and je<jd*0.5 then return je,jd end end local function b4(xH)
du[#du+1]=os.date("%H:%M:%S").." "..xH if#du>40 then table.remove(du,1)end end local function xI(b5,f2)if type(b5)~="string"then return end
b4(("Roll(%s,%s)"):format(b5,tostring(f2)))if b5:lower():find("crate",1,true)then j.rolled,j.rolledAt=b5,y()return
end V.seq=V.seq+1 V.name,V.at=b5,y()V.rar=type(f2)=="string"and f2 or nil c.rolls=c.rolls+1 if aK(b5)then A(("ROLL %s [%s] = TARGET"):format(b5,tostring(f2)))end
end local function xJ(b6)if type(b6)~="table"then return end local f3=b6 .butter or b6 .itemName if type(f3)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=f3,y()if type(b6 .giftId)=="string"then local oN=af:FindFirstChild("Remotes")
local oO=oN and oN:FindFirstChild("GiftThanks")if oO then pcall(function()oO:FireServer(b6 .giftId)end)end end
b4("Gift("..f3 .." from "..tostring(b6 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b6 .fromName),f3))
end local function xK()local oP=af:WaitForChild("Remotes",30)if not c.alive then return end if not oP then A("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local oQ=J:GetAttribute("SquishyEquipped")
if type(oQ)=="string"and oQ~=""then j.heldAt=y()end end))local xQ={SquishyRollAnimation=xI,InitSquishy=function(oR)V.init,V.initAt=tostring(oR),y()b4("Init("..tostring(oR)..")")end,
CrateUpdate=function(cM,oS)pcall(wE,cM)pcall(L.learn,cM)if type(cM)=="table"then local xL=oS==true or(j.rolled~=nil and y()-j.rolledAt<15)or j.waiting
if not xL then return end local xM=not j.waiting local xN=j.on j.waiting,j.data,j.at=true,cM,y()j.on=(oS==true)
j.title=tostring(cM.title or cM.name or"crate")if j.on and not xN then j.openedAt,j.byYou=y(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then b4("CrateWindow open("..j.title..")")elseif xM then b4("Crate waiting("..j.title..")")A(j.title.." is waiting on your stand")
end else if j.waiting then b4("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local xO=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,xO)end if j.classify then local xP=y()
task.spawn(function()pcall(j.classify,xP)end)end end end,GiftReceived=xJ,}for f4,xR in pairs(xQ)do local jf=oP:FindFirstChild(f4)
if jf and jf:IsA("RemoteEvent")then T(jf.OnClientEvent:Connect(xR))elseif f4~="CrateUpdate"and f4~="GiftReceived"then A("remote "..f4 .." missing")end
end end local function jg()local b7=b3()if b7 then if aK(b7 .name)then return{state="match",shown=b7 .pretty,src="pad",info=b7}
end return{state="skip",info=b7,level="idle",text=("on pad: %s [%s] - not ticked"):format(b7 .pretty,tostring(b7 .rar))}
end if V.name and(y()-V.at)<4 then if aK(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f5(xS,xT,xU,xV)
local f6=RaycastParams.new()f6 .FilterType=Enum.RaycastFilterType.Exclude local jh={J.Character}for FP,xW in ipairs(xV or{})do jh[#jh+1]=xW end
f6 .FilterDescendantsInstances=jh pcall(function()f6 .RespectCanCollide=true end)local oT=ao:Raycast(Vector3 .new(xS,xT+4,xU),Vector3 .new(0,-30,0),f6)
return oT and oT.Position or nil end local function cN(oU)local oV=oU:FindFirstChildOfClass("Humanoid")return((oV and oV.HipHeight)or 2)+oU.HumanoidRootPart.Size.Y/2+0.2
end local function ji(xX,xY)local jj=xX:FindFirstChildOfClass("Humanoid")local xZ=y()while y()-xZ<xY do if jj and(jj.FloorMaterial~=Enum.Material.Air or jj.SeatPart)then return true end
ag(0.05)end return false end local function aD(x0,jk,jl)local oW=x0 .HumanoidRootPart oW.AssemblyLinearVelocity=Vector3 .new(0,0,0)
oW.CFrame=jl and CFrame.new(jk,Vector3 .new(jl.X,jk.Y,jl.Z))or CFrame.new(jk)end local function b8(bf,oX)local b9=ap()
if not b9 or not bf then return false end local bz=bf.Position local f7=math.clamp(math.max(bf.Size.X,bf.Size.Z)/2+2.2,3,7)
local oY=(oX and oX.MaxActivationDistance)or 10 if f7>oY-2 then f7=math.max(2.5,oY-2)end local dO={}local function b_(dP)
dP=Vector3 .new(dP.X,0,dP.Z)if dP.Magnitude>0.05 then dO[#dO+1]=dP.Unit end end local oZ=nA()if oZ then b_(oZ-bz)end
b_(bf.CFrame.LookVector)b_(-bf.CFrame.LookVector)b_(bf.CFrame.RightVector)b_(-bf.CFrame.RightVector)b_(b9 .HumanoidRootPart.Position-bz)
if#dO==0 then b_(Vector3 .new(0,0,1))end local x1,f8=cN(b9),false for FQ,x2 in ipairs(dO)do local f9=bz+x2*f7
local jm=f5(f9 .X,bz.Y,f9 .Z,{bf})if jm and math.abs(jm.Y-bz.Y)<14 then aD(b9,Vector3 .new(f9 .X,jm.Y+x1,f9 .Z),bz)
if ji(b9,0.7)then f8=true break end end end if not f8 then aD(b9,bz+dO[1]*f7+Vector3 .new(0,3,0),bz)f8=ji(b9,1)
end ag(0.12)return f8 end local function o0(dQ)if not dQ.Parent or not dQ.Enabled then return false end pcall(function()dQ:InputHoldBegin()end)
ag(math.max(dQ.HoldDuration,0)+0.08)pcall(function()dQ:InputHoldEnd()end)return true end local function aq(o1,x3)
local x4=y()while y()-x4<x3 do if o1()then return true end ag(0.05)end return o1()end local function dR(cO,x5,o2,x6)
local x7=c.zapFirst and{"zap","hold"}or{"hold","zap"}for x8,jn in ipairs(x7)do if x8==2 and(x6 or not(cO.Parent and cO.Enabled and(not o2 or o2())))then break end
local jo if jn=="hold"then jo=o0(cO)else jo=type(fireproximityprompt)=="function"and cO.Parent~=nil and cO.Enabled and pcall(fireproximityprompt,cO)end
if jo and aq(x5,1.2)then c.zapFirst=(jn=="zap")return true,jn end end return false end local function o3(jp)local bA=nL()
if not bA or not bA.Enabled then A("buy: nothing on the pad")return false end local jq=dy(bA)if not jq then A("buy: pad part missing")return false end
c.lastBuyAt=y()local x9,o4=V.seq,ba()local o5=ap()local x_=o5 and(o5 .HumanoidRootPart.Position-jq.Position).Magnitude>12
b8(jq,bA)if x_ then ag(0.4)end if not bA.Enabled then A("buy aborted: pad emptied")return false end local cP=jg()
if not jp and cP.state~="match"then A("buy aborted: "..(cP.text or"pad changed"))c.matchSince=nil return false
end local jr=cP.info and cP.info.name or(cP.state=="match"and V.name)or nil local function ya()return bA.Enabled and ac()==nil and(jp or jg().state=="match")
end local yb,yc=dR(bA,function()return ac()~=nil or((not bA.Enabled)and(jp or V.seq==x9))end,ya,dN()~=nil)if yb then
aq(function()return ac()~=nil end,0.8)local dS=ac()local o6=ba()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dS and ak(W(dS))or(cP.shown or"?"),(o4 and o6)and(" for $"..aL(o4-o6))or"",yc))
if dS and jr and W(dS)~=W(jr)then A(("note: picked up %s, not %s"):format(dS,jr))end return true end local f_=b3()
if dN()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aL(ba()),(f_ and f_.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(f_ and f_.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function o7()local dT=ac()if not dT then c.holding=false A("place: hands are empty")
return false end if not aK(dT)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dT))))return false end
for FR=1,d.PlaceTries do local bB=wh()if not bB then A("place: no free station")break end local o8=dy(bB)if o8 then
b8(o8,bB)local o9=ac()if not o9 then c.holding=false A("place: hands emptied on the way")return false end if not aK(o9)then A("place: what I carry changed, not waxing it")return false end
if bB.Enabled then local yd,ye=dR(bB,function()return not bB.Enabled end,function()return bB.Enabled end)if yd then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dT)),c.placed,bB.Parent.Parent.Name,ye))if o.placed then pcall(o.placed,dT)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))A(c.capMsg)end return false end function z.place()local yf=y()while c.alive and z.editing and y()-yf<25 do ag(0.2)end
if d.Teams and d.TeamWax~=""then z.placing=true local yg=y()while c.alive and z.current()~=d.TeamWax and y()-yg<5 do ag(0.1)end
if z.current()==d.TeamWax then ag(0.3)else A("wax team did not come on in time - placing anyway")end end local yh,o_=pcall(o7)
z.placing=false if not yh then error(o_,0)end return o_ end local function pa(pb)return type(pb)=="string"and pb:lower():find("crate",1,true)~=nil
end local yi={SABFarmGui=1,SABToggle=1,SABError=1}local function js(yj)local bC=yj while bC do if yi[bC.Name]then return false end
if bC:IsA("ScreenGui")then local yk,yl=pcall(function()return bC.Enabled end)return(not yk)or yl~=false end if bC:IsA("GuiObject")and not bC.Visible then return false end
bC=bC.Parent end return false end local function ga(gb)local cQ=""pcall(function()if gb:IsA("TextButton")then cQ=gb.Text end end)
if not cQ:find("%a")then for FS,gc in ipairs(gb:GetDescendants())do if(gc:IsA("TextLabel")or gc:IsA("TextButton"))and gc.Text:find("%a")then cQ=gc.Text break end
end end if not cQ:find("%a")then cQ=gb.Name end return(cQ:lower():gsub("[^%a]",""))end local function ym()local dU,dV
local pc=J:FindFirstChildOfClass("PlayerGui")if not pc then return nil,nil end for FT,dW in ipairs(pc:GetDescendants())do
if dW:IsA("GuiButton")and js(dW)then local jt=ga(dW)if jt:sub(1,4)=="open"and not jt:find("shop",1,true)then dU=dU or dW end
if jt:sub(1,7)=="discard"then dV=dV or dW end end end if dU and dV then return dU,dV end if j.on then return dU,dV end
return nil,nil end local ju=(function()local yn,yo=pcall(function()return game:GetService("VirtualInputManager")end)return yn and yo or nil end)()
local function pd(bh,jv)local jw={}local function pe(yp)jw[#jw+1]=yp end if c.tapWay then pe(c.tapWay)end for FV,pf in ipairs({"touch","conn","signal"})do
if pf~=c.tapWay then pe(pf)end end local function pg(yq,...)local yr,jx=pcall(getconnections,yq)if not(yr and type(jx)=="table"and#jx>0)then return false end
local ph,ys,yt=false,{...},select("#",...)for FW,yu in ipairs(jx)do if pcall(function()yu:Fire(table.unpack(ys,1,yt))end)then ph=true end
end return ph end local function pj()local pk=Vector3 .new(0,0,0)pcall(function()local pl,pm=bh.AbsolutePosition,bh.AbsoluteSize
pk=Vector3 .new(pl.X+pm.X/2,pl.Y+pm.Y/2,0)end)local jy={Position=pk,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jy.UserInputType=Enum.UserInputType.Touch end)pcall(function()jy.UserInputState=Enum.UserInputState.End end)
return jy end for FX,bi in ipairs(jw)do local dX=false if bi=="conn"and type(getconnections)=="function"then if pg(bh.MouseButton1Click)then
dX=true if aq(jv,1.5)then c.tapWay=bi return true,bi end end dX=pg(bh.Activated,pj(),1)elseif bi=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bh.MouseButton1Click)then if aq(jv,1.5)then c.tapWay=bi return true,bi end end dX=pcall(firesignal,bh.Activated,pj(),1)
elseif bi=="touch"and ju then dX=pcall(function()local pn,po=bh.AbsolutePosition,bh.AbsoluteSize local pp=0 local pq=bh:FindFirstAncestorWhichIsA("ScreenGui")
local yv,yw=pcall(function()return pq and pq.IgnoreGuiInset end)if not(yv and yw)then pcall(function()pp=game:GetService("GuiService"):GetGuiInset().Y end)
end local ps,pt=pn.X+po.X/2,pn.Y+po.Y/2+pp ju:SendMouseButtonEvent(ps,pt,0,true,game,1)task.wait(0.06)ju:SendMouseButtonEvent(ps,pt,0,false,game,1)
end)end if dX and aq(jv,1.5)then c.tapWay=bi return true,bi end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jz(pu)local dY=pu.Parent while dY and dY~=c.plot do if j.NOT[dY.Name]then return false end dY=dY.Parent
end local jA=(pu.ActionText or""):lower()if jA:find("roll",1,true)or jA:find("place",1,true)or jA:find("sell",1,true)then return false end
return true end local function pv()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local pw=c.plot:FindFirstChild("CrateStand")local dZ if pw then for FY,gd in ipairs(pw:GetDescendants())do
if gd:IsA("ProximityPrompt")and gd.Enabled and jz(gd)then dZ=gd break end end end if not dZ then for FZ,bD in ipairs(c.plot:GetDescendants())do
if bD:IsA("ProximityPrompt")and bD.Enabled and jz(bD)then local px=bD:FindFirstAncestorWhichIsA("Model")local yx=((bD.ActionText or"").." "..(bD.ObjectText or"").." "..bD.Name.." "..(px and px.Name or"")):lower()
if yx:find("crate",1,true)then dZ=bD break end end end end j.prompt=dZ return dZ end local function jB()if j.on then return true end
local d0=pv()if not d0 then j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local py=dy(d0)if py then b8(py,d0)end j.ours=true dR(d0,function()return j.on end)if aq(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: pressed "..fr(d0).." but no window came up")
return false end do local function yy(pz)local cR=pz.Parent while cR and cR:IsA("GuiObject")do local pA,pB=false,false
for F0,d1 in ipairs(cR:GetDescendants())do if d1~=pz and d1:IsA("GuiButton")and ga(d1):sub(1,7)=="discard"then pA=true end
if d1:IsA("TextLabel")then local jC=d1 .Text:lower()if jC:find("crate",1,true)or jC:find("can contain",1,true)or jC:find("cost",1,true)then pB=true end
end if pA and pB then return cR end end cR=cR.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local pC=J:FindFirstChildOfClass("PlayerGui")if not pC then return nil end for F1,ge in ipairs(pC:GetDescendants())do
if ge:IsA("GuiButton")and not ge:FindFirstAncestor("SABFarmGui")and ga(ge):sub(1,4)=="open"then local jD=yy(ge)
if jD then j.win=jD return jD end end end end local function yz(yA)for F2,gf in ipairs(yA:GetDescendants())do
if gf:IsA("GuiButton")then local pD,jE=ga(gf),gf.Name:lower()if pD=="x"or pD=="close"or jE=="x"or jE:find("close",1,true)or jE:find("exit",1,true)then return gf end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(yB)task.wait(yB and 4 or 1.2)if j.on or j.waiting then return end
local gg=j.findWin()if not gg or not js(gg)then return end local pE=yz(gg)if pE and pd(pE,function()return not js(gg)end)then return end
A("the crate window is still open - tap its X")end end local function d2(gh)if not jB()then return false end local pF=y()-(j.openedAt or 0)
if pF<0.6 then ag(0.6-pF)end local jF=j.title local yC,yD=ym()local pG=gh and yC or yD if not pG then j.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(gh and"Open"or"Discard",jF))return false
end local yE=ac()local yF,F3=pd(pG,function()return(not j.on)or(ac()~=nil and ac()~=yE)end)if not yF then j.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(gh and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gh then c.crates=c.crates+1 aq(function()return ac()~=nil end,1.5)local pH=ac()
A(("OPENED %s -> %s"):format(jF,pH and ak(W(pH))or"?"))else A("discarded "..jF.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(yG,...)local yH=select("#",...)j.calls[#j.calls+1]={t=y(),m=yG,n=yH,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aE,bj)local bE=type(aE)if(bE=="string"or bE=="number")and type(bj.data)=="table"then for pI,jG in pairs(bj.data)do
if jG==aE and type(pI)=="string"and(type(jG)=="string"or type(jG)=="number")then return{__slot="f:"..pI}end end
end if bE=="string"then if bj.crate and aE==bj.crate then return{__slot="crate"}end if bj.title and aE==bj.title then return{__slot="title"}end
if bj.rar and aE==bj.rar then return{__slot="rarity"}end return aE end if bE=="number"or bE=="boolean"or bE=="nil"then return aE end
if bE=="table"then local pJ={}for yI,pK in pairs(aE)do if type(pK)=="table"then return nil,"nested table"end local yJ,pL=j.slot(pK,bj)
if pL then return nil,pL end pJ[yI]=yJ end return pJ end local yK,yL=pcall(function()return aE:IsA("Instance")end)
if yK and yL then if aE==J then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gi=c.plot and c.plot:FindFirstChild("CrateStand")if gi and aE==gi then return{__slot="stand"}end if gi and aE.Parent==gi then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bE..")"end function j.resolve(gj)if type(gj)~="table"then return gj end
local aS=gj.__slot if aS and aS:sub(1,2)=="f:"then return j.data and j.data[aS:sub(3)]end if aS=="crate"then return j.data and j.data.name end
if aS=="title"then return(j.data and j.data.title)or j.title end if aS=="rarity"then return j.data and j.data.rarity end
if aS=="player"then return J end if aS=="plot"then return c.plot end if aS=="stand"or aS=="model"then local jH=c.plot and c.plot:FindFirstChild("CrateStand")
if aS=="stand"or not jH then return jH end for F4,pM in ipairs(jH:GetChildren())do if pa(pM.Name)then return pM end end
return nil end local pN={}for yM,yN in pairs(gj)do pN[yM]=j.resolve(yN)end return pN end function j.classify(jI)
if j.directOff then return end local gk={}for F5,jJ in ipairs(j.calls)do if jJ.t<=jI+0.05 and jI-jJ.t<=6 then gk[#gk+1]=jJ end
end if#gk==0 then return end if not aq(function()return(j.heldAt or 0)>=jI-1 end,2.5)then return end local d3={}
for F6,d4 in ipairs(gk)do local pO={}for pP=1,d4 .n do local yO,pQ=j.slot(d4 .args[pP],d4)if pQ then A("crate call has "..pQ.." - keeping the button method")
return end pO[pP]=yO end d3[#d3+1]={m=d4 .m,n=d4 .n,args=pO}end local jK=j.learned j.learned={seq=d3,mode=jK and jK.mode or nil}
aj.dirty=true if not jK then A(("learned how to open crates directly (%d call%s)"):format(#d3,#d3==1 and""or"s"))end
end function j.replay()local pR=j.learned local pS=af:FindFirstChild("Remotes")local jL=pS and pS:FindFirstChild("CrateAction")
if not(pR and jL)then return false end local pT=table.unpack or unpack j.replaying=true for F7,d5 in ipairs(pR.seq)do
local jM={}for pU=1,d5 .n do jM[pU]=j.resolve(d5 .args[pU])end task.spawn(function()pcall(function()if d5 .m=="InvokeServer"then jL:InvokeServer(pT(jM,1,d5 .n))
else jL:FireServer(pT(jM,1,d5 .n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(yP)return(yP:gsub("[%%|;=,\n]",function(yQ)return("%%%02X"):format(yQ:byte())end))end
function j.enc(ca)local gl=type(ca)if gl=="string"then return"s"..j.esc(ca)end if gl=="number"then return"n"..tostring(ca)end
if gl=="boolean"then return ca and"b1"or"b0"end if gl=="nil"then return"z"end if ca.__slot then return"k"..ca.__slot end
local jN={}for yR,yS in pairs(ca)do jN[#jN+1]=j.enc(yR).."="..j.enc(yS)end return"t"..table.concat(jN,",")end
function j.dec(pV)local d6,d7=pV:sub(1,1),pV:sub(2)local function yT(yU)return(yU:gsub("%%(%x%x)",function(yV)return string.char(tonumber(yV,16))end))end
if d6=="s"then return yT(d7)end if d6=="n"then return tonumber(d7)end if d6=="b"then return d7=="1"end if d6=="k"then return{__slot=d7}end
if d6=="t"then local pW={}for yW in d7:gmatch("[^,]+")do local pX,yX=yW:match("^(.-)=(.*)$")if pX then local pY=j.dec(pX)
if pY~=nil then pW[pY]=j.dec(yX)end end end return pW end return nil end function j.goneOrNew(yY)return function()
if not j.waiting then return true end local pZ=ac()return pZ~=nil and pZ~=yY end end function j.near()local p0=af:FindFirstChild("Remotes")
local jO=p0 and p0:FindFirstChild("CrateAction")local gm=ap()local jP=c.plot and c.plot:FindFirstChild("CrateStand")
local jQ=jP and jP:FindFirstChild("Spot")if not(jO and gm and jQ)then A(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not jO and"no CrateAction remote"or not gm and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jR=gm.HumanoidRootPart local gn=jR.CFrame local p1,jS=j.title,"no answer"local yZ=ac()local p2=jP:FindFirstChild("Holder")
local function p3()if not p2 then return j.waiting or j.on end for F8,y0 in ipairs(p2:GetChildren())do if y0:IsA("Model")then return true end end
return false end for y1=1,3 do if not(j.waiting or j.on)or not p3()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end if(jR.Position-jQ.Position).Magnitude>8 then b8(jQ,j.prompt)end ag(0.12+0.15*y1)
local a5={}j.replaying=true task.spawn(function()a5 .ok,a5 .v=pcall(function()return jO:InvokeServer("open")end)
a5 .done=true end)aq(function()return a5 .done end,6)j.replaying=false local cb=a5 .v if a5 .done and a5 .ok and type(cb)=="table"and cb.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(p1,cb.prize and ak(W(tostring(cb.prize)))or"?"))
aq(function()local p4=ac()return p4~=nil and p4~=yZ end,1.5)if(jR.Position-gn.Position).Magnitude>8 then pcall(function()aD(gm,gn.Position,gn.Position+gn.LookVector)end)end
return true,"opened"end jS=(a5 .done and a5 .ok and type(cb)=="table")and tostring(cb.reason or"refused, no reason given")
or(a5 .done and("error: "..tostring(cb))or"no answer in 6s")ag(0.3)if not p3()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(p1,jS))
return false,jS end j.GIVEUP=600 function j.drop()local p5=af:FindFirstChild("Remotes")local p6=p5 and p5:FindFirstChild("CrateAction")
local p7=c.plot and c.plot:FindFirstChild("CrateStand")local jT=p7 and p7:FindFirstChild("Spot")local p8=ap()
if jT and p8 and(p8 .HumanoidRootPart.Position-jT.Position).Magnitude>8 then b8(jT,j.prompt)ag(0.3)end local jU,bk=false,nil
if p6 then jU,bk=pcall(function()return p6:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(jU and type(bk)=="table"and bk.ok)and"done"or("answer: "..tostring(type(bk)=="table"and(bk.reason or bk.ok)or bk))))
j.waiting,j.on,j.quietUntil=false,false,y()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(jU and type(bk)=="table"and bk.ok)then d2(false)end end function j.smart()local jV=j.title if(j.nearFails or 0)<3 then
local y2=j.near()if y2 then return true end if j.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local cc=j.learned if cc then local jW=ac()if j.on then j.replay()if aq(j.goneOrNew(jW),3.5)then c.crates=c.crates+1
A("OPENED "..jV.." (direct)")return true end else if cc.mode~="window"then j.replay()if aq(j.goneOrNew(jW),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="direct"then cc.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..jV.." (direct, no window)")return true end end if jB()then j.replay()if aq(j.goneOrNew(jW),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="window"then cc.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..jV.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,aj.dirty=cc,nil,true
if j.fails>=3 then j.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return d2(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for y3,p9 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(p9):Connect(function()D.cache[y3]=J:GetAttribute(p9)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(y4,...)local go=D.cache
local y5={m=y4,n=select("#",...),args={...},before={rules=go.rules,stop=go.stop,on=go.on,main=go.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,y5)end end)end function D.learnOne(d8)local ay,d9=D.snap(),d8 .before local gp=(ay.rules~=d9 .rules)or(ay.stop~=d9 .stop)
local p_=(ay.on~=d9 .on)or(ay.main~=d9 .main)if not gp and not p_ then return end local qa={}for qb=1,d8 .n do
local aM=d8 .args[qb]local cd=type(aM)if cd=="string"and aM~=""and aM==ay.rules then aM={__slot="rules"}elseif cd=="string"and aM~=""and gp and aM==ay.stop and ay.stop~=d9 .stop then aM={__slot="stop"}
elseif cd=="table"then local qc={}for y6,cS in pairs(aM)do if type(cS)=="table"or(type(cS)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end qc[y6]=(type(cS)=="string"and cS~=""and cS==ay.rules)and{__slot="rules"}or cS end aM=qc elseif cd~="string"and cd~="number"and cd~="boolean"and cd~="nil"then
if aM==J then aM={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end qa[qb]=aM
end local cT={m=d8 .m,n=d8 .n,args=qa}if gp then local jX=false for y7=1,cT.n do local d_=cT.args[y7]if type(d_)=="table"and d_.__slot=="rules"then jX=true end
if type(d_)=="table"and not d_.__slot then for F9,qe in pairs(d_)do if type(qe)=="table"and qe.__slot=="rules"then jX=true end end
end end if jX then D.rec.rules={cT}else table.insert(D.rec.rules,cT)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if p_ then if ay.on==true then D.rec.on=cT else D.rec.off=cT end d.AutoRoll=(ay.on==true)end if ay.rules and ay.rules~=""then d.ARrules,d.ARstop=ay.rules,ay.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gp and"choices"or(ay.on and"on"or"off")))end
function D.resolve(cU)if type(cU)~="table"then return cU end if cU.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cU.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cU.__slot=="player"then return J end
local qf={}for y8,y9 in pairs(cU)do qf[y8]=D.resolve(y9)end return qf end function D.replay(qg,y_)local qh=table.unpack or unpack
for F_,ea in ipairs(y_)do local jY={}for qi=1,ea.n do jY[qi]=D.resolve(ea.args[qi])end D.replaying=true pcall(function()
if ea.m=="InvokeServer"then task.spawn(function()pcall(function()qg:InvokeServer(qh(jY,1,ea.n))end)end)else qg:FireServer(qh(jY,1,ea.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(qj,za)if D.busy or not c.alive then return end D.busy=true
pcall(function()local qk=af:FindFirstChild("Remotes")local jZ=qk and qk:FindFirstChild("AutoRollAction")if not jZ then D.msg="this game has no AutoRollAction"return end
local bF=d.AutoRoll if bF and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(jZ,D.rec.rules)
if aq(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bF==D.isOn()or(not bF and not za)then return end
local gq=bF and D.rec.on or D.rec.off if not gq then local eb=bF and D.rec.off or D.rec.on local ql=eb~=nil for zb=1,eb and eb.n or 0 do
if type(eb.args[zb])=="boolean"then ql=false end end if ql then gq=eb end end if not gq then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bF and"on"or"off")
A(D.msg)return end D.replay(jZ,{gq})if aq(function()return D.isOn()==bF end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bF and"ON"or"OFF",qj and(" ("..qj..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local zc,zd=pcall(function()return J.UserId end)return zc and zd or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local ze,j0=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if ze and type(j0)=="table"and type(j0 .Pets)=="table"then q.I=j0 end return q.I end function q.order()if q.list then return q.list end
local bG=q.info()if not bG then return{}end local ce={}if type(bG.Order)=="table"and#bG.Order>0 then for Ga,qm in ipairs(bG.Order)do if bG.Pets[qm]then ce[#ce+1]=qm end end
else for zf in pairs(bG.Pets)do ce[#ce+1]=zf end table.sort(ce,function(zg,zh)return(bG.Pets[zg].price or 0)<(bG.Pets[zh].price or 0)end)
end q.list=ce return ce end function q.nice(qo,j1)local qp=q.info()local qq=qp and qp.Pets[qo]return((j1 and j1~="")and(j1 .." ")or"")..(qq and qq.displayName or tostring(qo))
end function q.data()local gr=J:GetAttribute("PetsData")if type(gr)~="string"then return nil end if gr==q.rawD then return q.lastD end
local zi,ec=pcall(function()return q.HS:JSONDecode(gr)end)ec=(zi and type(ec)=="table")and ec or nil q.rawD,q.lastD=gr,ec
return ec end function q.pen()return af:FindFirstChild("PetMeadowSpawns")end function q.srv()return ao:GetServerTimeNow()end
function q.money()local j2=J:FindFirstChild("MoneyValue")if j2 and type(j2 .Value)=="number"then return j2 .Value end
return ba()or 0 end function q.wishes()local qr=q.pen()local qs=qr and qr:GetAttribute("Wishes")local j3,qt={},q.srv()
if type(qs)~="string"then return j3 end local zj,qu=pcall(function()return q.HS:JSONDecode(qs)end)if zj and type(qu)=="table"then
for zk,j4 in pairs(qu)do if type(j4)=="number"and j4>qt then j3[zk]=j4-qt end end end return j3 end function q.call(...)
local qv=af:FindFirstChild("Remotes")local qw=qv and qv:FindFirstChild("PetRequest")if not qw then return nil end
local qx=table.pack(...)local cf={}task.spawn(function()cf.ok,cf.v=pcall(function()return qw:InvokeServer(table.unpack(qx,1,qx.n))end)
cf.done=true end)local zl=y()while not cf.done and y()-zl<6 do task.wait(0.05)end if cf.done and cf.ok then return cf.v end
return nil end function q.want(zm)return d.Pets[zm]end function q.closeNaming(j5)local qz=pcall(function()local qy=J:FindFirstChild("PlayerScripts")
local zn=qy and qy:FindFirstChild("Naming",true)require(zn).close()end)ag(0.5)if j5 .Visible then pcall(function()local qA=j5:FindFirstChild("NameBox",true)if qA then qA:ReleaseFocus()end end)
j5 .Visible=false qz=false end return qz end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qB=J:FindFirstChildOfClass("PlayerGui")
local qC=qB and qB:FindFirstChild("MainGui")local gs=qC and qC:FindFirstChild("PetNameGui")if gs and gs.Visible then
ag(0.4)if gs.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gs)break end end ag(0.25)end
q.namingOn=false end)end function q.buyTick()if not d.PetBuy then q.buyMsg="auto adopt is off"return end local j6,qD,gt=q.info(),q.pen(),q.data()
if not(j6 and qD and gt)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local ed,j7=#(gt.pets or{}),tonumber(gt.maxOwned)or 60
local zo,qE,ee=q.srv(),{},nil for Gb,aT in ipairs(qD:GetChildren())do qE[aT.Name]=true local cg,gu=aT:GetAttribute("Pet"),aT:GetAttribute("Variant")or""
local j8=cg and q.want(cg)if j8 and j8 .b and j6 .Pets[cg]and(not j8 .g or gu=="Big")and C.wantMore(cg,gu,gt)and not aT:GetAttribute("A_"..q.uid)
and(tonumber(aT:GetAttribute("ExpiresAt"))or 0)>zo+1 and y()>=(q.tryAt[aT.Name]or 0)then local ef,qF=q.nice(cg,gu),j6 .Pets[cg].price or 0
if ed>=j7 then ee=("%s is in the pen, but you have %d/%d pets"):format(ef,ed,j7)q.tryAt[aT.Name]=y()+15 elseif q.money()<qF then
ee=("%s is in the pen - need $%s"):format(ef,aL(qF))q.tryAt[aT.Name]=y()+5 else q.tryAt[aT.Name]=y()+8 local bH=q.call("adopt",aT.Name)
if type(bH)=="table"and bH.ok then ed=ed+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local zp=type(bH.pet)=="table"and bH.pet or{}
table.insert(q.recent,{id=tostring(zp.id or("?"..y())),name=cg,variant=gu,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..ef)q.skipNaming()ee="adopted "..ef else local qG=type(bH)=="table"and tostring(bH.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(ef,qG))ee="adopt failed: "..qG if type(bH)=="table"and bH.bagFull then q.tryAt[aT.Name]=y()+60 end
end end end end for qH in pairs(q.tryAt)do if not qE[qH]then q.tryAt[qH]=nil end end q.buyMsg=ee or("watching the pen (%d/%d pets)"):format(ed,j7)
end function q.wishTick()if not d.PetWish then q.wishMsg="auto wish is off"return end local gv=q.info()if not(gv and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local cj,j9,bI=q.wishes(),0,nil local zq=(type(gv.Wish)=="table"and gv.Wish.cashShare)or 2
local zr=q.data()for Gc,aA in ipairs(q.order())do local qI=q.want(aA)if qI and qI.w and C.wantMore(aA,"",zr)then
j9=j9+1 if not cj[aA]and y()>=(q.wishTry[aA]or 0)then local j_=tonumber(J:GetAttribute("PetWishCredits"))or 0
local ka=math.floor((gv.Pets[aA].price or 0)*zq)if j_<=0 and q.money()<ka then q.wishTry[aA]=y()+10 bI=("need $%s to wish for %s"):format(aL(ka),q.nice(aA))
q.wishWhy[aA]=bI else q.wishTry[aA]=y()+3 local zs=j_>0 and"wishCredit"or"wish"local gw=q.call(zs,aA)if type(gw)=="table"and gw.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),j_>0 and"free wish"or("$"..aL(ka))))
else local kb=type(gw)=="table"and tostring(gw.reason or"no reason given")or"no answer"if kb:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),kb))bI="wish failed: "..kb end end end end end end if not bI then
for Gd,gx in ipairs(q.order())do local qJ=q.want(gx)if qJ and qJ.w and not cj[gx]and q.wishWhy[gx]then bI=q.wishWhy[gx]break end
end end if not bI then local cV={}for Ge,gy in ipairs(q.order())do local qK=q.want(gy)if qK and qK.w and cj[gy]then cV[#cV+1]=("%s %dm"):format(q.nice(gy),math.ceil(cj[gy]/60))end
end local gz for Gf,gA in ipairs(q.order())do local qL=q.want(gA)if qL and qL.w and cj[gA]and(not gz or cj[gA]<gz)then gz=cj[gA]end
end bI=j9==0 and"no pet has WISH ticked"or(#cV==0 and"running: none yet")or(#cV<=3 and("running: "..table.concat(cV,", ")))
or("%d running, the next one ends in %dm"):format(#cV,math.ceil((gz or 0)/60))end q.wishMsg=bI end z.switches,z.glazed,z.finished=0,0,0
z.done,z.doneN,z.later={},0,{}function z.teams()local kc=q.data()return(kc and kc.teams)or{},kc end function z.current(cW)
cW=cW or q.data()if not cW then return""end local qM={}for Gg,zt in ipairs(cW.equipped or{})do qM[tostring(zt)]=true end
for Gh,qN in ipairs(cW.teams or{})do local qO=qN.pets or{}local kd=#qO==#(cW.equipped or{})if kd then for Gi,zu in ipairs(qO)do if not qM[tostring(zu)]then kd=false break end end end
if kd then return qN.name end end return""end function z.equip(ke)local zv,zw=z.teams()local kf for zx,zy in ipairs(zv)do if zy.name==ke then kf=zx break end end
if not kf then z.msg="no saved team called "..tostring(ke)return false end if z.current(zw)==ke then return true end
for Gj=1,4 do local qP=q.call("teamEquip",kf)if type(qP)=="table"and qP.ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(zz)local qQ=zz:FindFirstChild("SquishyPlaceHolder")local qR=qQ and qQ:FindFirstChild("TimerGui")
local qS=qR and qR:FindFirstChildWhichIsA("TextLabel",true)local kg=qS and qS.Text if type(kg)~="string"or kg:find("-",1,true)then return nil end
local kh,qT,qU=kg:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not kh then return nil end local qV=qU~=""and(tonumber(kh)*3600+tonumber(qT)*60+tonumber(qU))or(tonumber(kh)*60+tonumber(qT))
return qV>0 and qV or nil end function z.waxes()local eg={}local qW=c.plot and c.plot:FindFirstChild("WaxStations")
if not qW then return eg end local qX=q.srv()for Gk,a6 in ipairs(qW:GetChildren())do local ki=tonumber(a6:GetAttribute("PourEnd"))
local qY=a6:GetAttribute("PourOwner")if a6:GetAttribute("HasSquishy")and a6:GetAttribute("PourId")and(qY==nil or qY==q.uid)then
local kj=z.left(a6)local qZ=kj and(qX+kj)or((ki and ki>qX)and ki or nil)if qZ then local q0,q1=a6:FindFirstChild("SquishyPlaceHolder"),"?"
if q0 then for Gl,q2 in ipairs(q0:GetChildren())do if q2:IsA("Model")then q1=q2 .Name break end end end local zA=tostring(a6:GetAttribute("Helpers")or"")
local kk=0 for Gm in zA:gmatch("%d+")do kk=kk+1 end eg[#eg+1]={st=a6,ends=qZ,sure=kj~=nil,id=a6:GetAttribute("PourId"),name=q1,helps=kk,
long=a6:GetAttribute("PourLong")==true}end end end table.sort(eg,function(zB,zC)return zB.ends<zC.ends end)return eg
end function z.glazeCount()local q3=af:FindFirstChild("Remotes")local q4=q3 and q3:FindFirstChild("EditStack")
if not q4 then return nil end local zD,eh=pcall(function()return q4:InvokeServer("State",nil)end)if not(zD and type(eh)=="table"and type(eh.state)=="table")then return nil end
local kl,km=0,{}for Gn,gB in ipairs(eh.state.entries or{})do if gB.glaze and gB.glaze~=""then kl=kl+1 km[gB.glaze]=(km[gB.glaze]or 0)+1 end
end return kl,km,#(eh.state.entries or{}),eh.state.capacity end function z.finishedOne(gC,q5)z.finished=z.finished+1
task.wait(2)local kn,zE,q6,zF=z.glazeCount()if kn and q5 and kn>q5 then z.glazed=z.glazed+1 local ko={}for zG,zH in pairs(zE)do ko[#ko+1]=zG.." "..zH end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gC.name)),gC.st.Name,kn,table.concat(ko,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gC.st.Name,ak(W(gC.name)),q6 and(" (stack "..q6 .."/"..tostring(zF)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not d.Teams then z.want,z.msg="","auto teams is off"return end
local ck=q.srv()local aF=z.glazeFor if aF then local ei=aF.st local q7=ei.Parent and ei:GetAttribute("HasSquishy")and ei:GetAttribute("PourId")==aF.id
local q8=q7 and z.left(ei)if q8 then aF.ends=ck+q8 end if not q7 then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local zI=aF.before
task.spawn(function()pcall(z.finishedOne,aF,zI)end)end elseif aF.ends-ck>d.GlazeLead*3+60 or ck>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(ei.Name,z.clock(aF.ends-ck)))
end end if d.TeamGlaze~=""and not z.glazeFor then local zJ=z.speedRatio(d.TeamGlaze)for Go,cl in ipairs(z.list)do
if cl.sure and(cl.ends-ck)*zJ[cl.long and 2 or 1]<=d.GlazeLead and y()>=(z.later[cl.id or"?"]or 0)and not z.done[cl.id or"?"]then
z.glazeFor=cl task.spawn(function()cl.before=z.glazeCount()end)break end end end local aG,ej="",""local cX=d.SnapGlaze~=false and o.snapAt and(o.snapAt-ck)
if cX and cX<-8 then o.snapAt,cX=nil,nil end if d.TeamGlaze~=""and cX and cX<=20 then aG,ej=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cX)))
elseif d.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ej=d.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ej=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and z.allBusy()then
aG,ej=d.TeamFull," - every station is busy"else aG=d.TeamNormal end z.want=aG local ek=z.current()z.cur=ek if aG~=""and ek~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ej)else z.nextTry=y()+3 end end local kp=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(ek~=""and ek or"(not a saved team)",(aG~=""and aG~=ek)and(" -> "..aG)or"",
kp and("in "..z.clock(kp.ends-ck).." (st "..kp.st.Name..")")or"- none running")end function z.clock(bJ)bJ=math.max(0,math.floor(bJ))
if bJ>=3600 then return("%d:%02d:%02d"):format(math.floor(bJ/3600),math.floor((bJ%3600)/60),bJ%60)end return("%d:%02d"):format(math.floor(bJ/60),bJ%60)
end function z.allBusy()local zK,zL=ft()return zL>0 and zK==0 end function z.aboutToPlace()if not c.running then return false end
local q9=ac()if not(q9 and aK(q9))then return false end local zM=ft()return zM>0 end function z.mult(q_,zN,ra)return{(1+q_)*(1+ra),(1+q_+zN)*(1+ra)}end
function z.speedNow()local function kq(zO)return tonumber(J:GetAttribute(zO))or 0 end return z.mult(kq("PetWaxSpeed"),kq("PetLongWax"),kq("PetSocialWax"))
end function z.speedOf(zP)local zQ,rb=z.teams()if not rb then return nil end for Gp,rc in ipairs(zQ)do if rc.name==zP then
local kr={}for Gq,zR in ipairs(rc.pets or{})do for Gr,rd in ipairs(rb.pets or{})do if tostring(rd.id)==tostring(zR)then kr[#kr+1]=rd break end end
end local rf=C.caps()local rg,zS=C.stats(kr)return z.mult(math.min(rg.waxSpeed or 0,rf.waxSpeed or 0.25),math.min(rg.longWax or 0,rf.longWax or 0.3),zS.socialWax or 0)
end end return nil end function z.speedRatio(zT)local rh,ks=z.speedNow(),z.speedOf(zT)if not ks then return{1,1}end
return{rh[1]/ks[1],rh[2]/ks[2]}end function z.glazeSoon()return d.Teams and d.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local kt=q.info()return(kt and type(kt.Caps)=="table")and kt.Caps or C.CAPS
end function C.value(ri,ku)local gD=q.info()local cY=gD and gD.Pets[ri]if not(cY and type(cY.boost)=="table")then return nil end
local cm if type(gD.boostValue)=="function"then local zU,zV=pcall(gD.boostValue,ri,(ku~=""and ku)or nil)cm=zU and tonumber(zV)or nil
end if not cm then cm=cY.boost.value or 0 if ku=="Big"then local rj=cm*1.5 cm=C.ROUND[cY.boost.kind]and math.max(cm+1,math.floor(rj+0.5))or rj
end end return cY.boost.kind,cm,cY.boost.every end function C.stats(zW)local cn,kv={},{}for Gs,rk in ipairs(zW)do
local aU,gE,rl=C.value(rk.name,rk.variant or"")if aU then if aU:sub(1,6)=="social"then kv[aU]=math.max(kv[aU]or 0,gE)
elseif aU=="waxStir"or aU=="cashGift"then cn[aU]=(cn[aU]or 0)+gE*60/(rl or 60)elseif aU=="luckyPull"then cn.luckyPull=(cn.luckyPull or 0)+gE/(rl or 10)
else cn[aU]=(cn[aU]or 0)+gE end end end return cn,kv end function C.glazeGain(zX,gF)local el,kw,Gt={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local zY=el[1]+el[2]+el[3]local zZ=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cZ={}for gG=1,3 do cZ[gG]=el[gG]+zX*el[gG]/zY+(gG==1 and zZ or 0)end
local kx={cZ[1]*(1-gF),cZ[2]*(1-gF)+cZ[1]*gF,cZ[3]+cZ[2]*gF}return kx[1]*(kw[1]-1)+kx[2]*(kw[2]-1)+kx[3]*(kw[3]-1)
end function C.score(gH,z0)local ky=C.caps()local gI,gJ=C.stats(z0)local function bl(rm)return math.min(gI[rm]or 0,ky[rm]or math.huge)end
local z1=(1+bl("income"))*(1+(gJ.socialIncome or 0))*(1+math.min(gI.cashGift or 0,ky.cashGiftPerMinute or 9)/60)
local z2=1+bl("luck")+(gI.luckyPull or 0)+(gJ.socialLuck or 0)local rn=z2*(1+bl("newFind"))*(1+bl("rollSpeed"))
local em=math.log(z1)local z3=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local kz=(1+bl("waxSpeed")+bl("longWax"))*(1+(gJ.socialWax or 0))
+math.min(gI.waxStir or 0,ky.waxStirPerMinute or 30)/60/z3 local z4=1-(1-bl("headStart"))*(1-(gJ.socialHeadStart or 0))
if gH=="farm"then return em+0.7*math.log(rn)+0.1*math.log(kz)end if gH=="full"then return em+0.4*math.log(kz)+0.02*math.log(rn)end
if gH=="glaze"then return C.glazeGain(bl("glaze"),bl("glazeUp"))+0.001*em end if gH=="wax"then return-math.log(1-0.5*z4)+0.001*em+0.001*math.log(kz)end
return em end function C.best(ro,c0,z5,kA)kA=kA or{}local az,en={},{}local function rp(z6)local rq={}for z7,z8 in ipairs(z6)do rq[z7]=c0[z8]end return rq end
local function kB(rr)local kC=C.score(ro,rp(rr))for Gu,z9 in ipairs(rr)do if kA[c0[z9].id]then kC=kC+1e-7 end end
return kC end for Gv=1,math.min(z5,#c0)do local gK,kD for kE=1,#c0 do if not en[kE]then az[#az+1]=kE local rs=kB(az)
az[#az]=nil if not kD or rs>kD+1e-12 then gK,kD=kE,rs end end end if not gK then break end en[gK]=true az[#az+1]=gK
end for Gw=1,6 do task.wait()local rt,ru=false,kB(az)for kF=1,#az do for kG=1,#c0 do if not en[kG]then local rv=az[kF]
az[kF]=kG local rw=kB(az)if rw>ru+1e-9 then en[rv],en[kG],ru,rt=nil,true,rw,true else az[kF]=rv end end end end
if not rt then break end end local rx={}for z_,Aa in ipairs(az)do rx[z_]=tostring(c0[Aa].id)end return rx,C.score(ro,rp(az))
end function C.count(ry,rz,Ab)local eo,ep={},0 local rA,rB={},{}for Gx,Ac in ipairs(rz.arriving or{})do rA[tostring(Ac)]=true end
for Gy,c1 in ipairs(rz.pets or{})do rB[tostring(c1 .id)]=true if c1 .name==ry and not rA[tostring(c1 .id)]then
if c1 .variant=="Big"then ep=ep+1 elseif(c1 .variant or"")==""then eo[#eo+1]=c1 end end end if not Ab then for Gz,eq in ipairs(q.recent or{})do
if eq.name==ry and not rB[eq.id]and y()-eq.at<20 then if eq.variant=="Big"then ep=ep+1 else eo[#eo+1]=eq end end
end end return eo,ep end function C.goal(Ad)local rC=d.Pets[Ad]return rC and tonumber(rC.f)or 0 end function C.wantMore(rD,Ae,rE)
local kH=C.goal(rD)if kH<=0 or not rE then return true end local Af,rF=C.count(rD,rE)if rF>=kH then return false end
if Ae=="Big"then return true end return#Af<C.need()*(kH-rF)end function C.status(rG,rH)local gL=C.goal(rG)if gL<=0 or not rH then return nil end
local Ag,kI=C.count(rG,rH)if kI>=gL then return("Big %d/%d done"):format(kI,gL)end return("%d/%d to fuse, Big %d/%d"):format(math.min(#Ag,C.need()),C.need(),kI,gL)
end function C.wear(kJ)local kK={}for GA,Ah in ipairs(kJ)do kK[tostring(Ah)]=true end for GB=1,3 do local c2=q.data()
if not c2 then return false end for GC,rI in ipairs(c2 .equipped or{})do if not kK[tostring(rI)]then q.call("unequip",rI)task.wait(0.3)end
end c2=q.data()local rJ={}for GD,Ai in ipairs(c2 .equipped or{})do rJ[tostring(Ai)]=true end for GE,rK in ipairs(kJ)do
if not rJ[tostring(rK)]then q.call("equip",rK)task.wait(0.3)end end task.wait(0.4)c2=q.data()local kL,rL=0,true
for GF,Aj in ipairs(c2 .equipped or{})do kL=kL+1 if not kK[tostring(Aj)]then rL=false end end if rL and kL==#kJ then return true end
end return false end function C.saveTeam(rM,rN)if not C.wear(rN)then return false,"could not put the pets on"end
local Ak=z.teams()local co for Al,Am in ipairs(Ak)do if Am.name==rM then co=Al break end end local c3 if co then
c3=q.call("teamSave",co)else c3=q.call("teamNew")if type(c3)=="table"and c3 .ok and c3 .index then co=c3 .index
task.wait(0.3)q.call("teamRename",{index=co,name=rM})end end task.wait(0.4)local kM=q.data()local rO=kM and kM.teams and co and kM.teams[co]
if not rO then return false,"the game did not save it"end local rP={}for GG,An in ipairs(rO.pets or{})do rP[tostring(An)]=true end
for GH,Ao in ipairs(rN)do if not rP[tostring(Ao)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local Ap=q.srv()for GI,Aq in ipairs(z.list or{})do if Aq.ends-Ap<(d.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local er=q.data()if not er then return{}end local rQ={}for GJ,Ar in ipairs(er.arriving or{})do rQ[tostring(Ar)]=true end
local es={}for GK,gM in ipairs(er.pets or{})do if not rQ[tostring(gM.id)]then es[#es+1]={id=tostring(gM.id),name=gM.name,variant=gM.variant or""}end
end local rR={}for GL,rS in ipairs(es)do rR[rS.id]=rS end local rT=tonumber(er.slots)or 3 local kN,rU={},{}for GM,gN in ipairs(C.ROLES)do
local et=d[gN[1]]if et~=""and not rU[et]then rU[et]=true local kO,eu,rV={},{},false for GN,rW in ipairs(er.teams or{})do
if rW.name==et then for GO,As in ipairs(rW.pets or{})do local kP=rR[tostring(As)]if kP then kO[kP.id]=true eu[#eu+1]=kP else rV=true end
end end end local kQ,rX=C.best(gN[2],es,rT,kO)local rY=C.score(gN[2],eu)local rZ=#kQ==#eu for GP,At in ipairs(kQ)do if not kO[At]then rZ=false end end
if not rZ and(rV or#eu<math.min(rT,#es)or rX>rY+1e-4)then kN[#kN+1]={team=et,role=gN[2],ids=kQ,gain=rX-rY}end
end end return kN end function C.rebuild(Au)local r0=C.plan()if#r0==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gO=true local Ay,Az=pcall(function()for GQ,ev in ipairs(r0)do local Av,Aw=C.saveTeam(ev.team,ev.ids)local r1=q.data()
local kR={}for GR,Ax in ipairs(ev.ids)do for GS,kS in ipairs(r1 and r1 .pets or{})do if tostring(kS.id)==Ax then kR[#kR+1]=q.nice(kS.name,kS.variant)end
end end if Av then A(("TEAM %s rebuilt (%s): %s"):format(ev.team,Au or"pets changed",table.concat(kR,", ")))else gO=false A(("TEAM %s: %s"):format(ev.team,tostring(Aw)))end
end end)z.editing,z.nextTry=false,0 if not Ay then gO=false A("TEAM BUILD ERR "..tostring(Az))end C.builds=C.builds+1
C.buildMsg=gO and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gO end
function C.fuseTick()if not d.AutoFuse or z.editing then return end local gP=q.data()if not gP then return end
local kT=C.need()local kU,gQ={},{}for GT,AA in ipairs(gP.teams or{})do for GU,AB in ipairs(AA.pets or{})do kU[tostring(AB)]=true end end
for GV,AC in ipairs(gP.equipped or{})do gQ[tostring(AC)]=true end C.failUntil=C.failUntil or{}for cp,AD in pairs(d.Pets)do
local r2=tonumber(AD.f)or 0 local kV,AE=C.count(cp,gP,true)if r2>0 and AE<r2 and#kV>=kT and y()>=(C.failUntil[cp]or 0)then
table.sort(kV,function(gR,gS)local r3=(gQ[tostring(gR.id)]and 4 or 0)+(kU[tostring(gR.id)]and 2 or 0)+(gR.named and 1 or 0)
local r4=(gQ[tostring(gS.id)]and 4 or 0)+(kU[tostring(gS.id)]and 2 or 0)+(gS.named and 1 or 0)if r3~=r4 then return r3<r4 end
return tostring(gR.id)<tostring(gS.id)end)local gT,kW={},{}for gU=1,kT do gT[gU]=tostring(kV[gU].id)if gQ[gT[gU]]then kW[#kW+1]=gT[gU]end
end z.editing,z.editingSince=true,y()for GW,AF in ipairs(kW)do q.call("unequip",AF)task.wait(0.3)end local gV=q.call("fuse",{ids=gT})
z.editing,z.nextTry=false,0 if type(gV)=="table"and gV.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(kT,q.nice(cp),q.nice(cp)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(cp),os.date("%H:%M"))else C.failUntil[cp]=y()+120 A(("fuse %s failed: %s"):format(q.nice(cp),type(gV)=="table"and tostring(gV.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not d.AutoBuild or not d.Teams then return end local r5=q.data()
if not r5 then return end local cq={}for GX,AG in ipairs(r5 .pets or{})do cq[#cq+1]=tostring(AG.id)end table.sort(cq)
cq=table.concat(cq,",")if cq~=C.sig then C.sig,C.dirtyAt=cq,y()end local AH=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if AH and not z.editing then local AI=C.rebuild(C.dirtyAt and"pets changed"or"check")if AI then C.dirtyAt,C.lastBuild=nil,y()end
end end e.bb,e.fx,e.post,e.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}e.watch=setmetatable({},{__mode="k"})
e.mem,e.memPeak,e.fps=0,0,0 function e.isFx(cr)return cr:IsA("ParticleEmitter")or cr:IsA("Trail")or cr:IsA("Beam")or cr:IsA("Fire")or cr:IsA("Smoke")
or cr:IsA("Sparkles")or cr:IsA("Light")end function e.muteOne(aH)if not d.Lite or not aH.Parent then return end
local gW=(aH:IsA("BillboardGui")and e.bb)or(e.isFx(aH)and e.fx)or nil if not gW or gW[aH]~=nil then return end
gW[aH]=aH.Enabled if aH.Enabled then aH.Enabled=false end e.watch[aH]=aH:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aH.Enabled then gW[aH]=true aH.Enabled=false end end)end function e.lite(r6)d.Lite=r6 if r6 then
task.spawn(function()for AJ,AK in ipairs(ao:GetDescendants())do if not d.Lite then return end pcall(e.muteOne,AK)
if AJ%600==0 then task.wait()end end end)if not e.addConn then e.queue={}e.addConn=T(ao.DescendantAdded:Connect(function(kX)
if d.Lite and(kX:IsA("BillboardGui")or e.isFx(kX))then e.queue[#e.queue+1]=kX end end))end local kY=game:GetService("Lighting")
for GY,ew in ipairs(kY:GetChildren())do if ew:IsA("PostEffect")and ew.Enabled and e.post[ew]==nil then e.post[ew]=true ew.Enabled=false end
end pcall(function()e.oldShadows=e.oldShadows==nil and kY.GlobalShadows or e.oldShadows kY.GlobalShadows=false end)
pcall(function()e.oldDeco=e.oldDeco==nil and ao.Terrain.Decoration or e.oldDeco ao.Terrain.Decoration=false end)
task.spawn(e.extras,true)else e.extras(false)for GZ,AL in pairs(e.watch)do pcall(function()AL:Disconnect()end)end
for r7,AM in pairs(e.bb)do pcall(function()if r7 .Parent then r7 .Enabled=AM end end)end for r8,AN in pairs(e.fx)do pcall(function()if r8 .Parent then r8 .Enabled=AN end end)end
for r9 in pairs(e.post)do pcall(function()if r9 .Parent then r9 .Enabled=true end end)end e.bb,e.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
e.watch,e.post,e.queue=setmetatable({},{__mode="k"}),{},{}local AO=game:GetService("Lighting")if e.oldShadows~=nil then pcall(function()AO.GlobalShadows=e.oldShadows end)e.oldShadows=nil end
if e.oldDeco~=nil then pcall(function()ao.Terrain.Decoration=e.oldDeco end)e.oldDeco=nil end end end function e.fxPatch(r_)
local AP,kZ=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not AP or type(kZ)~="table"then return end if r_ and not e.ceOld then e.ceOld={}for G0,sa in ipairs({"Fireworks","Confetti"})do
local gX=kZ[sa]if type(gX)=="table"and type(gX.Play)=="function"then e.ceOld[sa]=gX.Play pcall(function()gX.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not r_ and e.ceOld then for AQ,AS in pairs(e.ceOld)do pcall(function()kZ[AQ].Play=AS end)end e.ceOld=nil
end end function e.topsFind()if e.tc then return e.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local k0,gY for G1,ex in ipairs(getgc(false))do if type(ex)=="function"and(type(islclosure)~="function"or islclosure(ex))then
local AT,sb,sc=pcall(debug.info,ex,"sn")if AT and type(sb)=="string"and sb:find("ToppingCullHandler",1,true)then
if sc=="poll"then k0=ex elseif sc=="retarget"then gY=ex end end end end if not(k0 and gY)then return nil end local AU,gZ=pcall(debug.getupvalues,gY)
local sd=AU and type(gZ)=="table"and gZ[3]if type(sd)~="function"or debug.info(sd,"n")~="targetFor"or(gZ[1]~=nil and type(gZ[1])~="number")then return nil end
e.tc={poll=k0,re=gY}return e.tc end function e.tops(se)local aN=e.topsFind()if not aN then return false end if se and not aN.old then
local AV,AW=pcall(hookfunction,aN.poll,function()end)if not AV then return false end aN.old=AW pcall(debug.setupvalue,aN.re,1,-1000)
pcall(aN.re)elseif not se and aN.old then local AX=type(restorefunction)=="function"and pcall(restorefunction,aN.poll)
if not AX then pcall(hookfunction,aN.poll,aN.old)end aN.old=nil pcall(aN.poll)end return true end e.lit,e.boardsOff={},{}
function e.lights(AY)local sf=ao:FindFirstChild("Plots")if AY then for G2,AZ in ipairs(sf and sf:GetChildren()or{})do
local sh=AZ:FindFirstChild("SkinProps")local sj=sh and sh:FindFirstChild("FairyLights")for G3,sk in ipairs(sj and sj:GetChildren()or{})do
for G4,ey in ipairs(sk:GetChildren())do if ey:IsA("BasePart")and(ey.Name=="Bulb"or ey.Name=="Wire")then e.lit[ey]=sk ey.Parent=nil end
end end end for G5,A0 in ipairs({"Leaderboards","ClanBoard"})do local sl=ao:FindFirstChild(A0)for G6,g0 in ipairs(sl and sl:GetDescendants()or{})do
if g0:IsA("SurfaceGui")and g0 .Enabled then e.boardsOff[g0]=true g0 .Enabled=false end end end else for A1,sm in pairs(e.lit)do pcall(function()if sm.Parent then A1 .Parent=sm end end)end
for sn in pairs(e.boardsOff)do pcall(function()if sn.Parent then sn.Enabled=true end end)end e.lit,e.boardsOff={},{}
end end e.reel={}function e.rollFx(A2)if A2 then local so=af:FindFirstChild("Remotes")local sp=so and so:FindFirstChild("SquishyRollAnimation")
if not sp or type(getconnections)~="function"then return end local A3,A4=pcall(getconnections,sp.OnClientEvent)
for G7,g1 in ipairs(A3 and A4 or{})do local k1=""pcall(function()k1=debug.info(g1 .Function,"s")end)if type(k1)=="string"and k1:find("SquishyHandler",1,true)and not e.reel[g1]then
if pcall(function()g1:Disable()end)then e.reel[g1]=true end end end else for A5 in pairs(e.reel)do pcall(function()A5:Enable()end)end
e.reel={}end end function e.extras(g2)pcall(e.rollFx,g2)pcall(e.fxPatch,g2)pcall(e.tops,g2)pcall(e.lights,g2)
end e.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function e.hideHud(sq)d.HideHud=sq local k2=J:FindFirstChildOfClass("PlayerGui")
if not k2 then return end if sq then for G8,ez in ipairs(k2:GetChildren())do if ez:IsA("ScreenGui")and not e.MINE[ez.Name]and ez.Enabled then e.hud[ez]=true ez.Enabled=false end
end if not e.hudConn then e.hudConn=T(k2 .ChildAdded:Connect(function(eA)if d.HideHud and eA:IsA("ScreenGui")and not e.MINE[eA.Name]then
task.defer(function()if d.HideHud and eA.Enabled then e.hud[eA]=true eA.Enabled=false end end)end end))end else
for sr in pairs(e.hud)do pcall(function()if sr.Parent then sr.Enabled=true end end)end e.hud={}end end e.CAPS={0,30,15,10}
function e.cap(k3)d.FpsCap=k3 local ss=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not ss then return false end return pcall(ss,k3==0 and 60 or k3)end e.unseen=setmetatable({},{__mode="k"})
function e.hideOne(an)if an:IsA("BasePart")or an:IsA("Decal")or an:IsA("Texture")then if an.Transparency<1 then e.unseen[an]=an.Transparency an.Transparency=1 end
elseif an:IsA("BillboardGui")or an:IsA("SurfaceGui")or an:IsA("ParticleEmitter")or an:IsA("Beam")or an:IsA("Trail")or an:IsA("Light")or an:IsA("Fire")or an:IsA("Smoke")or an:IsA("Sparkles")then
if an.Enabled then e.unseen[an]=true an.Enabled=false end end end function e.notMine(A6)return d.HideMine or(c.plot and not A6:IsDescendantOf(c.plot))end
e.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function e.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function e.setBases(su)if d.HideBases then e.bases(false)end d.HideMine=su==2 if su>0 then e.bases(true)end end
function e.bases(sv)d.HideBases=sv local k4=ao:FindFirstChild("Plots")if not k4 then return end if sv then task.spawn(function()
local k5=0 for G9,sx in ipairs(k4:GetChildren())do if sx~=c.plot or d.HideMine then for G_,A7 in ipairs(sx:GetDescendants())do
if not d.HideBases then return end pcall(e.hideOne,A7)k5=k5+1 if k5%600==0 then task.wait()end end end end end)
if not e.basesConn then e.basesConn=T(k4 .DescendantAdded:Connect(function(sy)if d.HideBases and e.notMine(sy)then task.defer(function()pcall(e.hideOne,sy)end)end
end))end else for k6,sz in pairs(e.unseen)do pcall(function()if not k6 .Parent then return end if type(sz)=="number"then k6 .Transparency=sz else k6 .Enabled=true end
end)end e.unseen=setmetatable({},{__mode="k"})end end function e.render(sA)d.NoRender=sA pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not sA)end)
end e.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
e.calmed={}function e.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local A8=game:GetService("RunService")
local k7=0 for Ha,A9 in ipairs({"RenderStepped","Heartbeat","Stepped"})do local A_,sB=pcall(function()return A8[A9]end)
local sC,k8=false,nil if A_ and sB then sC,k8=pcall(getconnections,sB)end if sC and type(k8)=="table"then for Hb,k9 in ipairs(k8)do
local k_=""pcall(function()local sD=getfenv(k9 .Function).script k_=sD and sD:GetFullName()or""end)if k_~=""then
for Hc,Ba in ipairs(e.CALM)do if k_:find(Ba,1,true)then if pcall(function()k9:Disable()end)then e.calmed[#e.calmed+1]=k9 k7=k7+1 end
break end end end end end end if#e.calmed>200 then local la={}for Bb=#e.calmed-49,#e.calmed do la[#la+1]=e.calmed[Bb]end e.calmed=la
end return k7 end function e.calm(sE)d.Calm=sE if sE then local Bc=e.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(Bc))
else for Hd,Bd in ipairs(e.calmed)do pcall(function()Bd:Enable()end)end e.calmed={}end end function e.restoreAll()
pcall(e.unpin)pcall(e.calm,false)if d.HideBases then pcall(e.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(e.lite,false)pcall(e.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(e.cap,0)end end function e.rejoinSame(sF)if c.rejoining then return end A("REJOIN this server ("..sF..")")
pcall(fw)if c.autoload then pcall(fX,c.autoload)end oD()local Be=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then dL(sF..", same server failed")end end)return Be end function e.tick()
if d.Lite and y()-(e.extraAt or 0)>5 then e.extraAt=y()pcall(e.lights,true)pcall(e.fxPatch,true)if not next(e.reel)then pcall(e.rollFx,true)end
if not(e.tc and e.tc.old)and y()-(e.topsTry or-100)>60 then e.topsTry=y()pcall(e.tops,true)end end local lb=e.queue
if d.Lite and lb and#lb>0 then e.queue={}for Bf,Bg in ipairs(lb)do pcall(e.muteOne,Bg)if Bf%300==0 then task.wait()end end
end local sG=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if sG then for He,Bh in ipairs(sG:GetChildren())do
local sH=Bh:FindFirstChild("SquishyPlaceHolder")local cs=sH and sH:FindFirstChild("TimerGui")if cs and cs:IsA("BillboardGui")then
if e.bb[cs]==nil then pcall(e.muteOne,cs)elseif cs.Enabled then e.bb[cs]=true cs.Enabled=false end end end end
local Bi,eB=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Bi and type(eB)=="number"then
e.mem=eB e.memPeak=math.max(e.memPeak,eB)if(d.MemLimit or 0)>0 and eB>d.MemLimit then e.over=(e.over or 0)+1 if e.over>=30 and not c.busy then
e.over=-600 e.rejoinSame(("memory %d MB > %d MB"):format(eB,d.MemLimit))end elseif(e.over or 0)>0 then e.over=0
end end if y()-(e.noteAt or 0)>1800 then e.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(e.fps+0.5),e.mem,e.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function lc(g3)if type(g3)~="string"then return false end
g3=g3:lower()for Hf,Bj in ipairs(c.sellWords)do if g3:find(Bj,1,true)then return true end end return false end
local function Bk()local sI=af:FindFirstChild("Remotes")local ld=sI and sI:FindFirstChild("SellSquishy")if not(ld and ld:IsA("RemoteEvent"))then return false end
if not pcall(function()ld:FireServer()end)then return false end return aq(function()return ac()==nil end,1.5)
end local function Bl()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local sJ=ap()local sK=sJ and sJ.HumanoidRootPart.Position local eC,sL for Hg,c4 in ipairs((c.plot or ao):GetDescendants())do
if c4:IsA("ProximityPrompt")and(lc(c4 .ActionText)or lc(c4 .ObjectText)or lc(c4 .Name))then local sM=nx(c4)local le=(sM and sK)and(sM-sK).Magnitude or 1e9
if le<=400 and(not eC or le<sL)then eC,sL=c4,le end end end c.sellSpot=eC c.noSellSpot=(eC==nil)return eC end
local function sN()local lf=ac()if not lf then c.holding=false return false end if aK(lf)then return false end
local lg=ak(W(lf))if Bk()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..lg)return true end local c5=Bl()if c5 then local sO=dy(c5)if sO then b8(sO,c5)local sP=ac()if sP and not aK(sP)then
local Bm,Bn=dR(c5,function()return ac()==nil end,function()return c5 .Enabled end)if Bm then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(lg,fr(c5),Bn))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..lg.." ("..c.sellFails..")")
return false end local Bo={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Bp(c6)local g4=fr(c6):lower()for Hh,Bq in ipairs(Bo)do if g4:find(Bq,1,true)then return 0 end end
local a7,ar=c6 .Name:lower(),0 local function aV(Br,Bs)return Br:find(Bs,1,true)~=nil end if aV(a7,"collect")then ar=ar+60 end
if aV(a7,"cash")or aV(a7,"money")then ar=ar+45 end if aV(a7,"income")or aV(a7,"claim")then ar=ar+35 end if aV(a7,"coin")or aV(a7,"earn")or aV(a7,"green")then ar=ar+20 end
if a7=="pad"or a7=="touch"then ar=ar+25 end if ar==0 and(aV(g4,"collect")or aV(g4,"cash")or aV(g4,"money"))then ar=25 end
if ar==0 then return 0 end local eD=c6 .Color if eD.G>0.5 and eD.G>eD.R*1.4 and eD.G>eD.B*1.4 then ar=ar+15 end
if math.min(c6 .Size.X,c6 .Size.Y,c6 .Size.Z)<2 then ar=ar+5 end return ar end local function Bt()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local g5,eE,lh={},nil,29 for Hi,g6 in ipairs(c.plot:GetDescendants())do
if g6:IsA("BasePart")then local g7=Bp(g6)if g7>0 then g5[#g5+1]={s=g7,p=g6}if g7>lh then eE,lh=g6,g7 end end end
end table.sort(g5,function(Bu,Bv)return Bu.s>Bv.s end)c.padCands,c.padPart=g5,eE if eE then A("collect pad: "..fr(eE).." (score "..lh..")")end
return eE end local li="SAB_pad_v1.txt"local function Bw(Bx)if type(writefile)=="function"then pcall(writefile,li,table.concat({Bx:GetComponents()},","))end
end local function By()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Bz,sQ=pcall(function()if isfile(li)then return readfile(li)end end)
if not Bz or type(sQ)~="string"then return nil end local g8={}for BA in sQ:gmatch("[^,]+")do g8[#g8+1]=tonumber(BA)end
if#g8==12 then return CFrame.new(unpack(g8))end end local function BB(lj,g9,BC)local BD=cN(lj)local lk=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aW=(lk and lk:IsA("BasePart"))and(lk.Position-g9)or Vector3 .new(1,0,0)aW=Vector3 .new(aW.X,0,aW.Z)if aW.Magnitude<0.05 then aW=Vector3 .new(1,0,0)end
aW=aW.Unit for BE=0,7 do local g_=BE*math.pi/4 local BF=Vector3 .new(aW.X*math.cos(g_)-aW.Z*math.sin(g_),0,aW.X*math.sin(g_)+aW.Z*math.cos(g_))
local ha=g9+BF*(BC+5)local ll=f5(ha.X,g9 .Y,ha.Z)if ll and math.abs(ll.Y-g9 .Y)<8 then aD(lj,Vector3 .new(ha.X,ll.Y+BD,ha.Z))
if ji(lj,0.7)then return true end end end return false end local function BG()c.lastCollect=y()local eF=ap()if not eF then return end
local sR,BH=eF.HumanoidRootPart,cN(eF)local eG,sS,eH,lm=nil,4,nil,"?"local ln=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and ln and ln:IsA("BasePart")then eG,lm=(ln.CFrame*c.manualPad).Position,"manual pad"else local bm=Bt()
if bm then eG=Vector3 .new(bm.Position.X,bm.Position.Y+bm.Size.Y/2+BH,bm.Position.Z)sS,eH,lm=math.max(bm.Size.X,bm.Size.Z)/2,bm,bm.Name
end end if not eG then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local lo=ba()aD(eF,eG)
if eH and type(firetouchinterest)=="function"then pcall(firetouchinterest,sR,eH,0)end ag(d.PadDwell)if eH and type(firetouchinterest)=="function"then pcall(firetouchinterest,sR,eH,1)end
ag(0.5)c.collected=c.collected+1 local lp=ba()A(("COLLECTED (%s) %s"):format(lm,(lo and lp and lp>lo)and("+$"..aL(lp-lo))or"no cash change seen"))
BB(eF,eG,sS)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local sT=af:FindFirstChild("Modules")if not sT then return false end local function lq(BI)local sU=sT:FindFirstChild(BI)
if not sU then return nil end local BJ,sV=pcall(require,sU)return(BJ and type(sV)=="table")and sV or nil end o.si,o.arm,o.ci=lq("SquishyInfo"),lq("AutoRollRules"),lq("CrateInfo")
o.modAt=y()if not o.si then return false end local lr={}if o.arm and type(o.arm.tierOf)=="table"then for ls in pairs(o.arm.tierOf)do
local hb=o.si[ls]if type(hb)=="table"and hb.rarity~="Limited"and not hb.incomeType and not hb.hiddenAfter then lr[W(ls)]=ls end
end end o.roll=lr local hc={}for BK,BL in pairs(lr)do local eI=o.si[BL]if type(eI)=="table"and type(eI.income)=="number"and not eI.incomeType then
hc[#hc+1]={k=BK,inc=eI.income,pr=tonumber(eI.price)or 0}end end table.sort(hc,function(lt,lu)if lt.inc~=lu.inc then return lt.inc>lu.inc end return lt.pr>lu.pr end)
o.order=hc local hd,lv,lw local BM=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for BN,lx in pairs(BM)do
local ly=type(lx)=="table"and tonumber(lx.price)if ly and(not lv or ly>lv)then hd,lv,lw=BN,ly,lx.title end end
o.bestCrate,o.bestCrateName=hd and L.key(hd),hd o.bestCrateTitle=lw and L.key(lw)or nil return true end function o.rank(BO)
local BP,BQ=pcall(function()return o.arm.rankOf(BO)end)return(BP and tonumber(BQ))or 0 end function o.loadDisc(sW)
if type(sW)~="table"then return end local sX={}for BR,BS in pairs(sW)do if BS then sX[W(tostring(BR))]=true end end
o.disc,o.discAt=sX,y()end function o.fetch()o.discAt=y()local sY=af:FindFirstChild("Remotes")local sZ=sY and sY:FindFirstChild("GetSquishiesDiscovered")
if not sZ then return end local BT,BU=pcall(function()return sZ:InvokeServer()end)if BT then o.loadDisc(BU)end
end function o.scanWax()local lz={}local s0=c.plot and c.plot:FindFirstChild("WaxStations")if s0 then for Hj,s1 in ipairs(s0:GetChildren())do
local s2=s1:FindFirstChild("SquishyPlaceHolder")if s2 and s1:GetAttribute("HasSquishy")then for Hk,s3 in ipairs(s2:GetChildren())do if s3:IsA("Model")then lz[W(s3 .Name)]=true end end
end end end for s4,BV in pairs(o.placedAt)do if y()-BV<20 then lz[s4]=true else o.placedAt[s4]=nil end end o.waxing=lz
end function o.compute()local s5,lA,lB={},0,0 if o.disc then for lC in pairs(o.roll or{})do if not o.disc[lC]then
if o.waxing[lC]then lB=lB+1 else s5[lC],lA=true,lA+1 end end end end o.need,o.nNeed,o.nWax=s5,lA,lB local s6,lD={},d.Best or 0
local lE=(lD==4)and o.stackMin or nil for BW,s7 in ipairs(o.order)do if(lE and s7 .inc>lE)or(not lE and BW<=(lD==4 and 1 or lD))then s6[s7 .k]=true end
end o.best=s6 end function o.readStack()o.stackAt=y()local s8=af:FindFirstChild("Remotes")local s9=s8 and s8:FindFirstChild("EditStack")
if not s9 then return end local BX,c7=pcall(function()return s9:InvokeServer("State",nil)end)if not(BX and type(c7)=="table"and type(c7 .state)=="table"and type(c7 .state.entries)=="table")then return end
local he for Hl,s_ in ipairs(c7 .state.entries)do local eJ=type(s_)=="table"and o.si and o.si[tostring(s_.name)]
if type(eJ)=="table"and type(eJ.income)=="number"and not eJ.incomeType and(not he or eJ.income<he)then he=eJ.income end
end o.stackMin=he o.stackFull=#c7 .state.entries>=(tonumber(c7 .state.capacity)or 100)end function o.want(lF)
if(d.Best or 0)>0 and(next(o.best)or(d.Best==4 and o.stackMin))then if o.best[lF]then return true end elseif d.Targets[lF]then
return true end return d.AutoIndex==true and o.need[lF]==true end function o.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(o.best)~=nil)or(d.AutoIndex and next(o.need)~=nil)
or d.Best==4 end function o.placed(BY)local eK=W(BY)o.placedAt[eK],o.waxing[eK]=y(),true if o.need[eK]then o.need[eK],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eK)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eL,eM={},{}for BZ,B0 in pairs(o.roll or{})do if o.want(BZ)then eL[B0]=true end end
for ta,lG in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(ta)or(type(lG)=="table"and type(lG.title)=="string"and L.wanted(lG.title))then eM[ta]=true end
end if not next(eL)and not next(eM)then return nil end if o.arm and type(o.arm.encode)=="function"then local B1,tb=pcall(o.arm.encode,{rarities={},butters=eL,crates=eM,index=false})
if B1 and type(tb)=="string"then return tb end end local function td(B2)local hf={}for B3 in pairs(B2)do hf[#hf+1]=B3 end table.sort(hf)return table.concat(hf,",")end
local eN="adv:"if next(eL)then eN=eN..";butters:"..td(eL)end if next(eM)then eN=eN..";crates:"..td(eM)end return eN
end function o.canon(B4)local hg={}for te in tostring(B4 or""):gmatch("[^;]+")do local lH,tf=te:match("^(%a+):(.*)$")
if not lH then lH,tf="r",te:gsub("^adv:","")end for B5 in tf:gmatch("[^,]+")do hg[#hg+1]=lH.."="..B5 end end table.sort(hg)
return table.concat(hg,"|")end function o.sync(B6)if J:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local ct=o.rulesNow()if not ct or#ct>1900 then return end if o.canon(J:GetAttribute("AutoRollRules"))==o.canon(ct)then o.fails=0 return end
if not B6 and y()-o.sentAt<4 then return end local th=af:FindFirstChild("Remotes")local ti=th and th:FindFirstChild("AutoRollAction")
if not ti then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()ti:FireServer("Rules",ct)end)D.replaying=false d.ARrules=ct
local hh,hi=0,0 for Hm in(ct:match("butters:([^;]*)")or""):gmatch("[^,]+")do hh=hh+1 end for Hn in(ct:match("crates:([^;]*)")or""):gmatch("[^,]+")do hi=hi+1 end
local tj=hh.."/"..hi if o.told~=tj then o.told=tj A(("auto roll now stops on %d butters and %d crates"):format(hh,hi))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if d.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aO={}if d.AutoIndex then aO[#aO+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if d.Best==4 then local eO=0 for Ho in pairs(o.best)do eO=eO+1 end
aO[#aO+1]=eO==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eO,eO==1 and""or"s")
elseif(d.Best or 0)>0 and o.order[1]then aO[#aO+1]="best: "..ak(o.order[1].k)end if d.BestCrate and o.bestCrateName then aO[#aO+1]="crate: "..o.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aO[#aO+1]="shower: "..O.got end o.msg=#aO>0 and table.concat(aO," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(B7)o.feed[#o.feed+1]=os.date("%H:%M ")..B7 if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(tk,av,hj)if tk~="Effect"then o.feedAdd(tostring(tk)..(av~=nil and(": "..tostring(av):sub(1,80))or""))
return end if av~="ShowerTaken"and av~="GoalPoint"then o.feedAdd(tostring(av))end if av=="Shower"then O.add(hj)return end
if av=="ShowerTaken"then O.gone(hj)return end if av=="ShowerClear"then O.drops={}return end if av=="WaxGlow"then
local lI=type(hj)=="table"and tonumber(hj.SnapAt)if lI then o.snapAt=lI A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lI-q.srv()),(d.SnapGlaze~=false and d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end av=tostring(av)b4("Admin "..av)if av~="GoalPoint"and y()-(o.heard[av]or-100)>30 then o.heard[av]=y()
A("ADMIN: "..av)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(lJ)if type(lJ)~="table"or type(lJ.Pieces)~="table"then return end
for Hp,aX in pairs(lJ.Pieces)do if type(aX)=="table"and aX.Id~=nil and aX.Position~=nil then O.drops[aX.Id]={id=aX.Id,butter=tostring(aX.Butter or"?"),rar=tostring(aX.Rarity or"?"),star=aX.Star==true,
pos=aX.Position,opens=tonumber(aX.OpensAt)or 0,ends=tonumber(aX.ExpiresAt)or 0}end end end function O.gone(eP)
if type(eP)~="table"or eP.Id==nil then return end O.drops[eP.Id]=nil if tonumber(eP.UserId)==q.uid then O.mine=eP.Id end
end function O.pick()local lK=q.srv()local lL,tl for tm,cu in pairs(O.drops)do if lK>=cu.ends-0.3 then O.drops[tm]=nil
elseif lK>=cu.opens-0.2 and(O.tried[tm]or 0)<3 then local tn=(aK(cu.butter)and 1e6 or 0)+(cu.star and 1e5 or 0)+o.rank(cu.rar)*100-(cu.ends-lK)
if not lL or tn>tl then lL,tl=cu,tn end end end return lL end function O.due()return d.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aP,lM=O.pick(),ap()if not(aP and lM)then return end O.tried[aP.id]=(O.tried[aP.id]or 0)+1
if e.hold then pcall(e.unpin,true)end aD(lM,aP.pos+Vector3 .new(0,cN(lM)+0.5,0))aq(function()return O.mine==aP.id or ac()~=nil or not O.drops[aP.id]end,1.5)
if O.mine==aP.id or ac()then O.got,O.drops[aP.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aP.butter)),aP.rar,aP.star and" (star)"or""))
elseif not O.drops[aP.id]then O.miss=O.miss+1 end end local eQ local function to()if c.capHit then if d.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eQ(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ap()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bw(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local lN,tp=ft()
local hk=ac()if hk then local c8=ak(W(hk))if not aK(hk)then local lO=(V.gift and W(V.gift)==W(hk)and y()-V.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c8,lO),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c8,lO),"bad"end return"sell",("selling %s (%s)"):format(c8,lO),"warn"
end if lN<1 then return nil,("holding %s - 0 free stations"):format(c8),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c8),"wait"end
return"place",("waxing %s (%d free)"):format(c8,lN),"ok"end c.holding=false if d.Crates and not j.waiting and y()-(j.scanAt or 0)>1 and y()>(j.quietUntil or 0)then
j.scanAt=y()local lP=c.plot:FindFirstChild("CrateStand")if lP then for Hq,eR in ipairs(lP:GetDescendants())do
if eR:IsA("ProximityPrompt")and eR.Enabled and jz(eR)then local bn=eR.ObjectText if bn==""then bn=cG(lP,"TitleLabel")or""end
if bn~=""and L.wanted(bn)then local B8=fp(bn):gsub("crate$","")local tq for tr in pairs(ad.members)do if fp(tr)==B8 then tq=tr end end
j.waiting,j.at,j.title,j.prompt=true,y(),bn,eR j.data={name=(bn:gsub("%s","")),rarity=tq,title=bn}A(bn.." found waiting on your stand")
end break end end end end local ts=L.wanted(j.data and j.data.name)or L.wanted(j.title)if d.Crates and(j.on or j.waiting)and ts then
local aY=j.title if y()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aY),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aY.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aY),"bad"end if y()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aY),"bad"
end if j.byYou and y()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aY,math.ceil(60-(y()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aY),"ok"end if j.at and y()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aY,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if y()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aY,
math.ceil(45-(y()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil A("trying the "..aY.." again")
end if y()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aY),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aY,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not ts then local tt=j.title..tostring(j.rolledAt)if j.told~=tt then j.told=tt A(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and y()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if lN<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(tp,tp),"wait"
end local lQ=nL()if not lQ then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c9=b3()
if c9 and pa(c9 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(c9 .name),"idle"end
if y()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c9 .name),"bad"end if not pv()then return nil,("%s rolled - waiting for it to land on the stand"):format(c9 .name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c9 .name),"ok"end local bK=jg()if bK.state~="match"then
c.matchSince=nil if bK.state=="skip"and not lQ.Enabled then return nil,bK.text.." (sold out)","idle"end return nil,bK.text,bK.level
end if not lQ.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eS=y()if eS<c.noCashUntil then
local tu,B9=dN()if tu then return nil,("cash short: have $%s, price ~$%s"):format(aL(tu),aL(B9)),"bad"end return nil,(dN()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aL(ba()),math.ceil(c.noCashUntil-eS)),dN()and"bad"or"wait"end if eS-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eS local tv=eS-c.matchSince if tv<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bK.shown,tv),"ok"end
return"buy",("buying %s via %s"):format(bK.shown,bK.src),"ok"end e.DEPTH=11 function e.pinTick()local tw=e.hold
if not tw then return end local lR=J.Character local lS=lR and lR:FindFirstChild("HumanoidRootPart")if not lS then return end
lS.CFrame=tw lS.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Hr,hl in ipairs(lR:GetChildren())do if hl:IsA("BasePart")and hl.CanCollide then e.noclip[hl]=true hl.CanCollide=false end
end end e.noclip=setmetatable({},{__mode="k"})function e.pin(B_,tx)e.hold=B_ if tx then e.surface=tx end end function e.unpin(Ca)
if not e.hold then return end e.hold=nil for ty in pairs(e.noclip)do pcall(function()if ty.Parent then ty.CanCollide=true end end)end
e.noclip=setmetatable({},{__mode="k"})local tz=ap()if tz and e.surface and not Ca then aD(tz,e.surface.Position,e.surface.Position+e.surface.LookVector)
ag(0.1)end end function e.home()local bo,tA=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ap()
if not(bo and bo:IsA("BasePart")and tA)then return nil end local tB=nA()or bo.Position local hm=Vector3 .new(tB.X-bo.Position.X,0,tB.Z-bo.Position.Z)
hm=hm.Magnitude>0.1 and hm.Unit or Vector3 .new(0,0,1)local hn=bo.Position+hm*6 local tC=f5(hn.X,bo.Position.Y,hn.Z,{bo})
return CFrame.new(hn.X,(tC and tC.Y or bo.Position.Y)+cN(tA),hn.Z)end function e.ground(Cb,tD,Cc)local lT,lU={J.Character},nil
for Hs=1,12 do local lV=RaycastParams.new()lV.FilterType=Enum.RaycastFilterType.Exclude lV.FilterDescendantsInstances=lT
local ho=ao:Raycast(Vector3 .new(Cb,tD,Cc),Vector3 .new(0,-2000,0),lV)if not ho then break end lU,tD=ho,ho.Position.Y-0.05
lT[#lT+1]=ho.Instance end return lU and lU.Position.Y end function e.parkHome()local lW=e.home()if not lW then return false end
local c_=lW.Position local Cd=e.ground(c_.X,c_.Y+300,c_.Z)or(c_.Y-3)e.pin(CFrame.new(c_.X,Cd-8,c_.Z),lW)return true
end e.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function e.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function e.setGhost(hp)d.Ghost,d.GhostHelps=hp==2,hp==1 if hp<2 then task.spawn(function()while c.busy do ag(0.1)end
if e.ghostMode()<2 and e.hold and not E.home then pcall(e.unpin)end end)end e.paintGhost()A("ghost: "..e.GHOST[hp][1]:sub(8):lower())
end function e.cycleGhost()e.setGhost((e.ghostMode()+1)%3)end function e.parkTick()if not(d.Ghost and c.running)or e.hold or c.busy then return end
local Ce=ap()if not Ce or K.seat()then return end e.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local tE=J.Character local tF=tE and tE:FindFirstChildOfClass("Humanoid")local lX=tF and tF.SeatPart
return(lX and lX.Name=="LogSeat")and lX or nil end function K.due()if not(d.Campfire and c.running)or y()<K.nextAt then return false end
local Cf=ao:FindFirstChild("NightSeats")if not Cf then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or y()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(K.msg)return false end end return true end function K.sit()local tG,hq=ao:FindFirstChild("NightSeats"),ap()
if not tG or not hq then return end local tH,da=hq.HumanoidRootPart.Position,{}for Ht,hr in ipairs(tG:GetChildren())do
local tI=hr:IsA("Seat")and hr.Occupant==nil and hr:FindFirstChildOfClass("ProximityPrompt")if tI then da[#da+1]={st=hr,p=tI}end
end if#da==0 then K.nextAt,K.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(da,function(Cg,Ch)return(Cg.st.Position-tH).Magnitude<(Ch.st.Position-tH).Magnitude end)
local Ci,Cj=da[1].st,da[1].p e.unpin(true)local db=Ci.CFrame aD(hq,db.Position+db.LookVector*2+Vector3 .new(0,2.5,0),db.Position)
ag(0.25)local Ck=dR(Cj,function()return K.seat()~=nil end)if not Ck then aD(hq,db.Position+Vector3 .new(0,2,0),db.Position+db.LookVector)
aq(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=y()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then A(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local lY=af:FindFirstChild("Remotes")if not lY then return end local eT,lZ,dc=0,0,{}
local Cl,tJ=pcall(function()return lY.ClanRequest:InvokeServer("state")end)local tK=Cl and type(tJ)=="table"and tJ.tasks
for Hu,bL in ipairs(tK and tK.list or{})do if not bL.done and bL.kind=="pull"then eT=math.max(eT,(bL.goal or 0)-(bL.progress or 0))end
if not bL.done then dc[#dc+1]=("%s %d/%d"):format(tostring(bL.text),bL.progress or 0,bL.goal or 0)end end F.events={}
for Hv,dd in ipairs(lY:GetChildren())do if dd:IsA("RemoteFunction")and dd.Name:match("^%u%a+Action$")and dd.Name~="CrateAction"and dd.Name~="AutoRollAction"then
local Cm,eU=pcall(function()return dd:InvokeServer("state")end)if Cm and type(eU)=="table"and eU.live==true and type(eU.quests)=="table"then
F.events[#F.events+1]={r=dd,st=eU}for Hw,aQ in ipairs(eU.quests)do if not aQ.done and aQ.kind=="pull"then eT=math.max(eT,(aQ.goal or 0)-(aQ.progress or 0))end
if not aQ.done and aQ.kind=="collect"then lZ=math.max(lZ,(aQ.goal or 0)-(aQ.progress or 0))end if not aQ.done then dc[#dc+1]=("%s %d/%d"):format(tostring(aQ.text),aQ.progress or 0,aQ.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eT,lZ F.msg=#dc>0 and("open: "..table.concat(dc,", "))or"all quests done for today"
end function F.claim()for Hx,eV in ipairs(F.events)do local tL=eV.r.Name:gsub("Action$","")for Hy,de in ipairs(eV.st.quests)do
if de.done and not de.claimed then local Cn,tM=pcall(function()return eV.r:InvokeServer("claimQuest",de.id)end)
if Cn and not(type(tM)=="table"and tM.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(tL,tostring(de.text),tostring(de.points or de.treats or"?")))
end ag(0.4)end end if eV.st.bonusReady==true then local Co=pcall(function()return eV.r:InvokeServer("claimBonus")end)
if Co then A(("CLAIMED %s daily quest bonus"):format(tL))end ag(0.4)end end end function F.tick()if not(d.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return d.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local tN=c.plot and c.plot:FindFirstChild("Lever")
local l0=tN and tN:FindFirstChild("Wheel")return l0 and l0:FindFirstChildWhichIsA("ProximityPrompt"),l0 end function F.resume(Cp)
F.arPaused=false if F.arWas then F.arWas=false d.AutoRoll=true task.spawn(D.apply,Cp)end end function F.pull()
local hs,l1=F.lever()if not hs or not l1 or not l1:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hs.Enabled then F.nextAt=y()+1 return end b8(l1,hs)F.asked=nil o0(hs)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
ag(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bM,Cq)local l2=bM:GetAttribute("PourOwner")
if type(l2)~="number"or l2==q.uid or not bM:GetAttribute("HasSquishy")then return false end if bM:GetAttribute("PourLong")~=true or bM:GetAttribute("PourFull")==true then return false end
local l3=bM:GetAttribute("PourId")if l3==nil or E.skip[l3]then return false end local tO,l4,Cr=bM:GetAttribute("Helpers"),0,tostring(q.uid)
if type(tO)=="string"then for Cs in tO:gmatch("[^,%s]+")do l4=l4+1 if Cs==Cr then return false end end end if l4>=6 then return false end
local ht=z.left(bM)if not ht then local tP=tonumber(bM:GetAttribute("PourEnd"))ht=tP and(tP-Cq)end if not ht or ht<=75 then return false end
local l5=game:GetService("Players"):GetPlayerByUserId(l2)if not l5 or l5:GetAttribute("WaxHelpOff")==true then return false end
return true,l5,l3 end function E.list()local l6,Ct={},q.srv()local tQ=ao:FindFirstChild("Plots")for Hz,tR in ipairs(tQ and tQ:GetChildren()or{})do
local tS=tR~=c.plot and tR:FindFirstChild("WaxStations")for HA,l7 in ipairs(tS and tS:GetChildren()or{})do local Cu,Cv,Cw=E.can(l7,Ct)
local l8=Cu and l7:FindFirstChild("SquishyPlaceHolder")if l8 and l8:IsA("BasePart")then l6[#l6+1]={st=l7,p=Cv,id=Cw,part=l8}end
end end return l6 end function E.due()return d.Help and c.running and y()>=E.nextAt end function E.skipIt(tT,tU)
E.skip[tT],E.skipN=tU,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[tT]=tU},1,{}end end function E.goHome()
local hu,bN=ap(),E.home E.home=nil if not(hu and bN)then return end if d.Ghost and not K.seat()then e.unpin(true)
if not e.parkHome()then pcall(aD,hu,bN.Position,bN.Position+bN.LookVector)end elseif e.hold or(hu.HumanoidRootPart.Position-bN.Position).Magnitude>20 then
e.unpin(true)pcall(aD,hu,bN.Position,bN.Position+bN.LookVector)end end function E.step()local l9,eW=E.list(),ap()
if#l9==0 or not eW then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local tV=eW.HumanoidRootPart local tW=tV.Position table.sort(l9,function(Cx,Cy)return(Cx.part.Position-tW).Magnitude<(Cy.part.Position-tW).Magnitude end)
local aZ=l9[1]E.home=E.home or(e.hold and e.surface)or tV.CFrame local bO=aZ.part local eX=(bO.Position+aZ.st:GetPivot().Position)/2
local hv=E.tries[aZ.id]or 0 if(d.Ghost or d.GhostHelps)and hv==0 and not K.seat()then e.pin(bO.CFrame,E.home)
else e.unpin(true)local l_=hv==0 and f5(eX.X,bO.Position.Y,eX.Z,{bO})if l_ and math.abs(l_.Y-bO.Position.Y)<8 then
aD(eW,Vector3 .new(eX.X,l_.Y+cN(eW),eX.Z),bO.Position)else aD(eW,bO.Position+Vector3 .new(0,bO.Size.Y/2+3,0),eX)
end end ag(0.3)local eY=af:FindFirstChild("Remotes")eY=eY and eY:FindFirstChild("ClanRequest")if not eY then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hw,bp=pcall(function()return eY:InvokeServer("help",aZ.st:GetAttribute("PourOwner"),tonumber(aZ.st.Name))end)
if hw and type(bp)=="table"and bp.ok then E.n,E.fails=E.n+1,0 E.skipIt(aZ.id,"helped")A(("HELPED %s's wax (station %s)"):format(aZ.p.DisplayName,aZ.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hw and type(bp)=="table"and tostring(bp.reason or""):lower():find("walk up",1,true)and hv<2 then
E.tries[aZ.id]=hv+1 E.nextAt=y()+0.3 elseif hw and type(bp)=="table"and tostring(bp.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local tX=(hw and type(bp)=="table"and tostring(bp.reason or"refused"))or("error: "..tostring(bp))
E.skipIt(aZ.id,tX)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aZ.p.DisplayName,tX))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bq)if not d.HelpGuild or type(bq)~="table"or bq.p~="help"or bq.mine or bq.u==q.uid or not bq.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eZ=af:FindFirstChild("Remotes")
eZ=eZ and eZ:FindFirstChild("ClanRequest")if not eZ then return end local tY,e0=pcall(function()return eZ:InvokeServer("callHelp",bq.u)end)
local tZ=tostring(bq.n or bq.un or bq.u)if tY and type(e0)=="table"and e0 .ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(tZ))
else A(("guild call from %s: %s"):format(tZ,(tY and type(e0)=="table"and tostring(e0 .reason or"refused"))or tostring(e0)))
end end)end local function as(Cz,t0,...)if c.busy then return end c.busy,c.busyText=true,Cz if e.hold and t0~=E.step then pcall(e.unpin)end
local CA,t1=pcall(t0,...)c.busy,c.busyText=false,""if not CA and t1~=it then A("ERR "..tostring(t1))end end local function CB()
local aR,CC,CD=to()c.reason,c.level=CC,CD if aR=="place"then as("waxing...",z.place)elseif aR=="crate"then as("opening crate...",d2,true)
elseif aR=="cratesmart"then as("opening crate...",j.smart)elseif aR=="cratewin"then as("opening the crate window...",jB)
elseif aR=="nocrate"then as("discarding crate...",d2,false)elseif aR=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aR=="sell"then as("selling...",sN)elseif aR=="buy"then as("buying...",o3,false)elseif not aR and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aR and not c.matchSince and K.due()then as("sitting at the campfire...",K.sit)
elseif not aR and not c.matchSince and F.pullDue()and not ac()and not(b3()and aK(b3().name))then as("pulling the lever for a quest...",F.pull)
elseif d.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
as("collecting money...",BG)elseif not aR and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not d.Help then
as("coming back...",E.goHome)elseif not c.busy then e.parkTick()end end function eQ(hx,CE)if hx==c.running then return end
c.running=hx if not CE then d.AutoStart=hx end if hx then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bw()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bP=fR(am.auto)if type(bP)=="string"then bP=bP:gsub("%s+$","")
if bP~=""then c.autoload=bP local CG=oz(bP)A(CG and("loaded config "..bP)or("config "..bP.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local CH={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local ma={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local t2,t3,t4,t5=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if t2 and t3 and t4 and t5 then ae.x,ae.b,ae.m,ae.r=t2,t3,t4,t5 end end)pcall(function()local t6=Enum.Font.RobotoMono if t6 then ae.mono=t6 end end)
local function H(CI,CJ,CK)local CL,mb=pcall(Instance.new,CI)if not CL then c.uiErrs=c.uiErrs+1 return nil end
for CM,CN in pairs(CJ)do if not pcall(function()mb[CM]=CN end)then c.uiErrs=c.uiErrs+1 end end mb.Parent=CK return mb
end local function ab(CO,CP)H("UICorner",{CornerRadius=UDim.new(0,CP or 8)},CO)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hy,mc)if hy and a.shown[hy]~=mc then a.shown[hy]=mc hy.Text=mc end
end function a.stroke(CQ,CS,CT)return H("UIStroke",{Color=CS or l.line,Thickness=1,Transparency=CT or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},CQ)
end function a.grad(CU,CV,CW,CX)local CY,t7=pcall(function()return ColorSequence.new(CV,CW)end)if CY and t7 then return H("UIGradient",{Color=t7,Rotation=CX or 0},CU)end
end function a.pad(CZ,t8,t9,C0,C1)H("UIPadding",{PaddingLeft=UDim.new(0,t8 or 0),PaddingTop=UDim.new(0,t9 or 0),
PaddingRight=UDim.new(0,C0 or t8 or 0),PaddingBottom=UDim.new(0,C1 or t9 or 0)},CZ)end function a.list(C2,C3,C4)
return H("UIListLayout",{Padding=UDim.new(0,C3 or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=C4 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},C2)
end function a.ink(md)local C5,C6=pcall(function()return 0.299*md.R+0.587*md.G+0.114*md.B end)return(C5 and C6>0.55)and l.ink or l.text
end function a.nextIn(t_)local ua=(a.ord[t_]or 0)+1 a.ord[t_]=ua return ua end local me=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local ub=me:FindFirstChild("SABFarmGui")if ub then ub:Destroy()end local mf=H("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},me)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local hz=ao.CurrentCamera.ViewportSize if hz.X>100 and hz.Y>100 then Q.w=math.clamp(math.floor(hz.X*0.48),320,400)
Q.h=math.clamp(math.floor(hz.Y*0.86),250,360)end end)a.root=H("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},mf)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local uc=UDim2 .new(1,0,1,0)
local function HB(ud,ue)return UDim2 .new(ud,0,0,0),UDim2 .new(ue,(ud+ue>0.99)and 0 or-4,1,0)end local function ai(C7,C8,e1,C9,C_,Da)
local mg=H("TextButton",{Text=C8,Position=C_,Size=Da,BackgroundColor3=e1,BorderSizePixel=0,Font=ae.b,TextSize=C9,TextColor3=a.ink(e1),AutoButtonColor=true},C7)
ab(mg,8)if e1==l.panel2 or e1==l.raise or e1==l.panel then a.stroke(mg,l.line,0.4)end return mg end local function hA(Db,Dc,Dd,De,Df)
local hB=H("TextBox",{Text=Dc,PlaceholderText=Dd,Position=De,Size=Df,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Db)ab(hB,8)a.stroke(hB,l.line,0)a.pad(hB,9,0,6,0)
return hB end local hC=ao.CurrentCamera local function Dg()local Dh,hD=pcall(function()return hC and hC.ViewportSize end)
if Dh and hD and hD.X>50 and hD.Y>50 then return hD end end local function bQ(e2)local mh=Dg()if not(mh and e2 and e2 .Parent)then return end
local Di=pcall(function()local hE,uf=e2 .AbsolutePosition,e2 .AbsoluteSize local mi=70 local ug=math.clamp(hE.X,mi-uf.X,mh.X-mi)
local uh=math.clamp(hE.Y,0,mh.Y-math.min(uf.Y,mi))if math.abs(ug-hE.X)>0.5 or math.abs(uh-hE.Y)>0.5 then e2 .Position=UDim2 .new(0,math.floor(ug),0,math.floor(uh))
end end)return Di end local function hF(Dj)local Dk,mj=pcall(function()return Dj.AbsolutePosition end)if Dk and mj then return{math.floor(mj.X),math.floor(mj.Y)}end
end local df={}c.dragMoved={}local function ui(e3,uj,mk)T(e3 .InputBegan:Connect(function(dg)if dg.UserInputType~=Enum.UserInputType.MouseButton1 and dg.UserInputType~=Enum.UserInputType.Touch then return end
local ml={start=dg.Position,from=uj.Position,moved=0,target=uj,input=dg,onDrop=mk}df[e3],c.dragMoved[e3]=ml,0
local mm mm=dg.Changed:Connect(function()if dg.UserInputState==Enum.UserInputState.End and df[e3]==ml then df[e3]=nil
if mm then mm:Disconnect()end if mk then mk(ml.moved)end end end)end))end T(nj.InputChanged:Connect(function(hG)
if hG.UserInputType~=Enum.UserInputType.MouseMovement and hG.UserInputType~=Enum.UserInputType.Touch then return end
for Dl,a8 in pairs(df)do local mn=a8 .target if mn and mn.Parent then local uk,ul=hG.Position.X-a8 .start.X,hG.Position.Y-a8 .start.Y
a8 .moved=math.max(a8 .moved,math.abs(uk)+math.abs(ul))c.dragMoved[Dl]=a8 .moved mn.Position=UDim2 .new(a8 .from.X.Scale,a8 .from.X.Offset+uk,a8 .from.Y.Scale,a8 .from.Y.Offset+ul)
end end end))T(nj.InputEnded:Connect(function(hH)if hH.UserInputType~=Enum.UserInputType.MouseButton1 and hH.UserInputType~=Enum.UserInputType.Touch then return end
for Dm,hI in pairs(df)do if hI.input==hH or hH.UserInputType==Enum.UserInputType.MouseButton1 then df[Dm]=nil
if hI.onDrop then hI.onDrop(hI.moved)end end end end))local function P(Dn,Do,Dp,Dq,Dr,Ds,Dt)return H("TextLabel",{Text=Do,Position=Ds or UDim2 .new(0,0,0,0),Size=Dt or uc,BackgroundTransparency=1,
Font=Dr and ae.b or ae.m,TextSize=Dp,TextColor3=Dq,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Dn)
end function a.row(um,Du)return H("Frame",{Size=UDim2 .new(1,0,0,Du),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(um)},um)end function a.card(uo,up,uq)local dh=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(uo)},uo)ab(dh,11)a.stroke(dh,l.line,0.25)a.list(dh,5)a.pad(dh,8,8,8,9)
if up then local mo=a.row(dh,14)H("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},mo)P(mo,up:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if uq then local Dv=P(mo,uq,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Dv.TextXAlignment=Enum.TextXAlignment.Right end end return dh end function a.heading(Dw,Dx,mp)local mq=a.row(Dw,mp and 34 or 22)
P(mq,Dx,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if mp then P(mq,mp,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mq end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(mr)local aI=a.sw[mr]if not aI then return end
local di=tostring(mr.Text or""):match(":%s*(.-)%s*$")or""local bR=di~=""and not a.OFF[di]local ms=not aI.chips and(di=="ON"or di=="OFF")
aI.pill.Visible,aI.chip.Visible=ms,not ms if ms then aI.pill.BackgroundColor3=bR and l.accent or l.panel2 aI.knob.Position=bR and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aI.knob.BackgroundColor3=bR and l.white or l.dim else aI.chip.Text=di~=""and di or"-"aI.chip.BackgroundColor3=bR and l.accent or l.panel2
aI.chip.TextColor3=bR and l.ink or l.dim end mr.BackgroundColor3=bR and l.lit or l.raise if aI.edge then aI.edge.Color=bR and l.accent or l.line aI.edge.Transparency=bR and 0.55 or 0.45 end
end function a.switch(ur,Dy,Dz,e4)local a0=H("TextButton",{Name="Switch",Text=Dy,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,e4 and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(ur)},ur)
ab(a0,9)local au={edge=a.stroke(a0,l.line,0.45)}au.title=P(a0,Dz,11,l.text,true,UDim2 .new(0,10,0,e4 and 4 or 0),UDim2 .new(1,-100,0,e4 and 15 or 28))
au.title.TextWrapped,au.title.TextTruncate=false,Enum.TextTruncate.AtEnd if e4 then au.sub=P(a0,e4,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
au.sub.TextWrapped,au.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end au.pill=H("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a0)ab(au.pill,9)au.knob=H("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},au.pill)ab(au.knob,7)au.chip=H("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},a0)
ab(au.chip,9)a.pad(au.chip,10,0,10,0)H("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},au.chip)
au.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a0]=au T(a0:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a0)end))
a.skin(a0)return a0 end function a.chips(mt)if a.sw[mt]then a.sw[mt].chips=true a.skin(mt)end end function a.line(DA,DB)
local us=a.row(DA,15)local ut=H("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=DB or l.dim,
BorderSizePixel=0},us)ab(ut,3)local mu=P(us,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mu.TextWrapped,mu.TextTruncate=false,Enum.TextTruncate.AtEnd
return mu,ut end function a.grow(uu,DC,DD)local hJ=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=DC or 10,TextColor3=DD or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(uu)},uu)
T(hJ:GetPropertyChangedSignal("Text"):Connect(function()hJ.Visible=hJ.Text~=""end))return hJ end function a.note(DE,DF)
local uv=a.grow(DE,9,l.dim)uv.Text=DF return uv end function a.actions(DG,uw)local DH=a.row(DG,28)local ux,mv={},#uw
for e5,uy in ipairs(uw)do ux[e5]=ai(DH,uy[1],uy[2]or l.panel2,10,UDim2 .new((e5-1)/mv,e5>1 and 3 or 0,0,0),UDim2 .new(1/mv,(e5>1 and-3 or 0)+(e5<mv and-3 or 0),1,0))
end return table.unpack(ux)end local function M(cv,hK,DI,DJ)a.put(cv,hK and DI or DJ)if not a.sw[cv]and a.lit[cv]~=hK then
a.lit[cv]=hK cv.BackgroundColor3=hK and l.accent or l.panel2 cv.TextColor3=a.ink(cv.BackgroundColor3)end end a.title=H("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)H("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
H("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local mw=H("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(mw,8)a.grad(mw,l.accent,l.accent2,45)local uz=P(mw,"C",16,l.ink,true)uz.Font,uz.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local DK=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))DK.Font=ae.x P(a.title,"butter farm  "..bY,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local DL=a.list(a.tabs,3)pcall(function()DL.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function br(DM,DN,DO)
local hL=H("TextButton",{Text=DM,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(hL,9)local uA=H("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hL)ab(uA,2)a.tabsAll[#a.tabsAll+1]={b=hL,bar=uA,name=DN,sub=DO}return hL end
a.tabFarm=br("🏠","Home","what the farm is doing")a.tabRun=br("🌾","Farm","the buy - wax - collect loop")a.tabBut=br("🧈","Butters","what gets bought and waxed")
a.tabCrt=br("📦","Crates","which crates get opened")a.tabPet=br("🐾","Pets","adopt, wish, fuse")a.tabTeam=br("👥","Teams","the right pets at the right moment")
a.tabSrv=br("🤝","Server","helping, campfire, ghost")a.tabAdm=br("⚡","Admin","admin abuse and its boosts")a.tabSet=br("⚙","Settings","configs, startup, performance")
local function bs()local mx=H("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mx,8)a.pad(mx,8,2,10,12)return mx end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs()a.farm.Visible=true
do local e6=a.farm local uB=a.row(e6,34)a.startB=ai(uB,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(uB,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local DP=a.row(e6,44)local function e7(uC,DQ,uD)local hM=H("Frame",{Position=UDim2 .new((uC-1)/uD,uC>1 and 2 or 0,0,0),Size=UDim2 .new(1/uD,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},DP)ab(hM,9)a.stroke(hM,l.line,0.3)local hN=P(hM,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hN.Font,hN.TextXAlignment,hN.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local DR=P(hM,DQ,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
DR.TextXAlignment=Enum.TextXAlignment.Center return hN end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e7(1,"BOUGHT",5),e7(2,"WAXED",5),e7(3,"SOLD",5),e7(4,"MONEY",5),e7(5,"FREE",5)
local uE=a.card(e6,"Right now")a.info=P(a.row(uE,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(uE,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local e8=a.card(e6,"Systems")
a.helpL=a.line(e8,l.info)a.campL=a.line(e8,l.accent2)a.questL=a.line(e8,l.good)a.arL=a.line(e8,l.accent)a.ixL=a.line(e8,ma.Dotonbori)
local uF=a.card(e6,"Activity")a.log=H("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(uF)},uF)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function HC(DS,DT)return a.row(DT or a.farm,DS)end local al do local my=a.run
a.heading(my,"Farm","buy what rolls, wax it, collect the cash")local e9=a.card(my,"Loop")a.colT=a.switch(e9,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(e9,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hA(al,tostring(d.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(e9,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(e9,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(e9,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local mz=a.card(my,"By hand")
a.buyB,a.plB=a.actions(mz,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(mz,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(mz,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local hO=a.but a.heading(hO,"Butters","what gets bought and waxed")local uG=a.card(hO,"Strategy")a.ixT=a.switch(uG,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(uG,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hO)},hO)a.list(a.butList,5)end do local hP=a.crt a.heading(hP,"Crates","only ticked crates are opened")
local uH=a.card(hP,"Opening")a.crateT=a.switch(uH,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(uH,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hP)},hP)a.list(a.crtList,5)end do local hQ=a.pet a.heading(hQ,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local e_=a.card(hQ,"Automatic")a.pbT=a.switch(e_,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(e_,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(e_,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(e_,10,l.dim)a.note(e_,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hQ)},hQ)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hR=a.srv a.heading(hR,"Server","other players, the campfire, staying hidden")
local mA=a.card(hR,"Helping")a.helpT=a.switch(mA,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(mA,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mA,l.info)
local uI=a.card(hR,"Campfire")a.campT=a.switch(uI,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(uI,l.accent2)local mB=a.card(hR,"Ghost")a.ghostT=a.switch(mB,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mB,l.dim)a.note(mB,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fa=a.adm a.heading(fa,"Admin abuse","the show, its boosts and the farm in it")local uJ=a.card(fa,"When")
a.admBig=P(a.row(uJ,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(uJ,14),"",10,l.dim,false)local DU=a.card(fa,"Boosts now")
a.admBoost=a.grow(DU,11,l.text)local mC=a.card(fa,"What the farm does")a.shT=a.switch(mC,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mC,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(mC,l.accent)
local uK=a.card(fa,"Show feed")a.admFeed=H("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(uK)},uK)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local dj=a.set a.heading(dj,"Settings","kept on your phone, per config")
local hS=a.card(dj,"Config")al=a.row(hS,28)a.cfgName=hA(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hS,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hS,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(hS,10,l.dim)local mD=a.card(dj,"Starting")a.startT=a.switch(mD,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mD,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(mD,9,l.dim)local mE=a.card(dj,"If the game drops me")
a.rejT=a.switch(mE,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(mE,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(mE,9,l.dim)local bt=a.card(dj,"Performance")a.pfCalm=a.switch(bt,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bt,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bt,"BASES: ALL DRAWN","Bases","stop drawing other bases, or yours too")
a.pfFps=a.switch(bt,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bt,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bt,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bt,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hA(al,tostring(d.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bt,l.good)a.note(bt,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local DV=a.card(dj,"About")a.note(DV,"CHURN "..bY.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for HD,DW in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(DW)end local uL=H("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},me)
a.tgRoot=H("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},uL)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=H("TextButton",{Text="C",Size=uc,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=H("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=H("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()e.cycleGhost()end)function e.paintGhost()
local fb=e.ghostMode()if a.ghostT then a.put(a.ghostT,e.GHOST[fb][1])end if a.tgGhost then a.tgGhost.Text=e.GHOST[fb][2]
a.tgGhost.BackgroundColor3=fb==2 and l.accent or(fb==1 and l.warn or l.panel)a.tgGhost.TextColor3=fb>0 and l.ink or l.dim
end end local bu={built=false,boxes={},at=0}function a.check(hT,mF)hT.Text=mF and"✓"or""hT.BackgroundColor3=mF and l.accent or l.bg
hT.TextColor3=l.ink local mG=hT.Parent if mG and mG:IsA("TextButton")then mG.BackgroundColor3=mF and l.lit or l.raise end
end local function uM(uN,uO)d.Targets[uN]=uO or nil local uP=bu.boxes[uN]if uP then a.check(uP,uO)end end local function mH()
for DX,DY in pairs(bu.boxes)do a.check(DY,d.Targets[DX]==true)end end function a.tickBox(DZ)local mI=H("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},DZ)ab(mI,6)
a.stroke(mI,l.line,0)return mI end local fc local function D0()local D1=a.card(a.butList,"Butter list")local mJ=a.row(D1,26)
a.butInfo=P(mJ,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local D2=ai(mJ,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local D3=ai(mJ,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))D2 .MouseButton1Click:Connect(function()
for D4 in pairs(d.Targets)do d.Targets[D4]=nil end mH()end)D3 .MouseButton1Click:Connect(function()ad.at=0 i3()
fc(true)end)end fc=function(D5)if not i3()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bu.built and not D5 and bu.at==ad.at then return end for HE,hU in ipairs(a.butList:GetChildren())do
if hU:IsA("Frame")or hU:IsA("TextButton")or hU:IsA("TextLabel")then hU:Destroy()end end bu.boxes,a.butEmpty={},nil
D0()for HF,hV in ipairs(ad.rarOrder)do local mK=ma[hV]or l.text local cw=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cw,11)a.stroke(cw,mK,0.7)a.list(cw,4)a.pad(cw,7,7,7,8)
local mL=a.row(cw,22)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=mK,BorderSizePixel=0},mL)
local D6=P(mL,hV:upper(),11,mK,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))D6 .Font=ae.x local D7=ai(mL,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local D8=hV D7 .MouseButton1Click:Connect(function()local uQ=ad.members[D8]or{}local uR=false for HG,D9 in ipairs(uQ)do if not d.Targets[D9]then uR=true break end end
for HH,D_ in ipairs(uQ)do uM(D_,uR)end end)for HI,mM in ipairs(ad.members[hV]or{})do local hW=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cw)},cw)ab(hW,8)local uS=P(hW,ak(mM),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
uS.TextWrapped,uS.TextTruncate=false,Enum.TextTruncate.AtEnd local uT=a.tickBox(hW)bu.boxes[mM]=uT local uU=mM
local function uV()uM(uU,not d.Targets[uU])end hW.MouseButton1Click:Connect(uV)uT.MouseButton1Click:Connect(uV)
end end mH()bu.built,bu.at=true,ad.at end function L.paint()for Ea,Eb in pairs(L.boxes)do a.check(Eb,d.CrateTicks[Ea]==true)end
if a.crtInfo then local mN,mO=0,0 for HJ in pairs(L.boxes)do mN=mN+1 end for HK,Ec in pairs(d.CrateTicks)do if Ec then mO=mO+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(mN,mO))end if a.crateT then M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for HL,hX in ipairs(a.crtList:GetChildren())do if hX:IsA("Frame")or hX:IsA("TextButton")or hX:IsA("TextLabel")then hX:Destroy()end
end L.boxes={}local mP=a.card(a.crtList,"All of them","worst first")local mQ=a.row(mP,26)a.crtInfo=P(mQ,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Ed=ai(mQ,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Ee=ai(mQ,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(Ed.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(Ee.MouseButton1Click:Connect(function()L.build()end))
for HM,bv in ipairs(L.list())do local uW=ma[bv.rar or""]or l.text local dk=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(mP)},mP)ab(dk,8)H("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=uW,BorderSizePixel=0},dk)
local uX=P(dk,(bv.title or bv.name)..(bv.guess and"  (?)"or""),11,uW,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
uX.TextWrapped,uX.TextTruncate=false,Enum.TextTruncate.AtEnd local Ef=P(dk,bv.price and("$"..aL(bv.price))or(bv.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Ef.TextXAlignment=Enum.TextXAlignment.Right local uY=a.tickBox(dk)L.boxes[bv.k]=uY local uZ=bv.k local function u0()
d.CrateTicks[uZ]=(not d.CrateTicks[uZ])or nil L.paint()end T(dk.MouseButton1Click:Connect(u0))T(uY.MouseButton1Click:Connect(u0))
end L.built=L.at L.paint()end local u1="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a1(cx)u1=cx for Eg,mR in ipairs(a.tabKeys)do a[mR].Visible=(mR==cx)local hY=a.tabsAll[Eg]if hY then
local mS=mR==cx hY.b.BackgroundTransparency,hY.b.TextTransparency,hY.bar.Visible=mS and 0 or 1,mS and 0 or 0.45,mS
end end if cx=="pet"and not q.built then pcall(q.build)end if cx=="team"and not z.built then pcall(z.build)end
if cx=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cx=="but"then fc(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(mT,u2,u3,u4)if u4 then mT.Text=u4 end mT.BackgroundColor3=u2 and u3 or l.bg mT.TextColor3=u2 and a.ink(u3)or l.dim
end function q.paintRow(u5)local cy=q.rows and q.rows[u5]if not cy then return end local cz=d.Pets[u5]or{}local fd=tonumber(cz.f)or 0
a.flag(cy.b,cz.b,l.good)a.flag(cy.g,cz.g,l.accent,cz.g and"BIG"or"ANY")a.flag(cy.w,cz.w,l.warn)a.flag(cy.f,fd>0,l.good,fd>=7 and"7 BIG/HUGE"or(fd>0 and(fd.." BIG")or"FUSE"))
if cy.row then cy.row.BackgroundColor3=(cz.b or cz.w or fd>0)and l.lit or l.raise end end function q.flag(mU,hZ)
local a9=d.Pets[mU]or{}if hZ=="f"then local Eh={[0]=1,[1]=2,[2]=3,[3]=7}local u6=Eh[tonumber(a9 .f)or 0]or 0 a9 .f=u6>0 and u6 or nil
elseif a9[hZ]then a9[hZ]=nil else a9[hZ]=true end d.Pets[mU]=(a9 .b or a9 .g or a9 .w or a9 .f)and a9 or nil q.paintRow(mU)
end function q.paintAll()for Ei in pairs(q.rows or{})do q.paintRow(Ei)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local mV=q.wishes()local fe=q.data()for h0,mW in pairs(q.rows)do local u7=C.status(h0,fe)mW.desc.Text=(mV[h0]and("wishing %dm | "):format(math.ceil(mV[h0]/60))or"")..(u7 and(u7 .." | ")or"")..mW.boostText
mW.desc.TextColor3=mV[h0]and l.text or l.dim end local u8=tonumber(J:GetAttribute("PetWishCredits"))or 0 a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(fe and#(fe.pets or{})or 0,fe and tonumber(fe.maxOwned)or 60,
aL(q.money()),u8>0 and(" | free wishes "..u8)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local h1=q.info()for HN,h2 in ipairs(a.petList:GetChildren())do if h2:IsA("Frame")or h2:IsA("TextLabel")or h2:IsA("TextButton")then h2:Destroy()end
end q.rows={}if not h1 then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dl={}for HO,u9 in ipairs(q.order())do local mX=h1 .Pets[u9].rarity or"?"dl[mX]=dl[mX]or{}
table.insert(dl[mX],u9)end local dm={}for HP,u_ in ipairs(h1 .Rarities or{})do if dl[u_]then dm[#dm+1]=u_ end end
for va in pairs(dl)do if not table.find(dm,va)then dm[#dm+1]=va end end for HQ,mY in ipairs(dm)do local h3=q.RC[mY]or l.text
local cA=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cA,11)a.stroke(cA,h3,0.7)a.list(cA,4)a.pad(cA,7,7,7,8)local vb=a.row(cA,18)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=h3,BorderSizePixel=0},vb)
local Ej=P(vb,mY:upper(),11,h3,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Ej.Font=ae.x for HR,h4 in ipairs(dl[mY])do
local ff=H("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cA)},cA)
ab(ff,8)local mZ=P(ff,q.nice(h4),11,h3,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))mZ.TextWrapped,mZ.TextTruncate=false,Enum.TextTruncate.AtEnd
local Ek,El=pcall(function()return h1 .describe(h4)end)local vc=Ek and tostring(El)or""local m0=P(ff,vc,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
m0 .TextYAlignment,m0 .TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function h5(Em,En,Eo)
local vd=ai(ff,Em,l.bg,8,UDim2 .new(1,En,0,5),UDim2 .new(0,Eo,0,22))vd.AutoButtonColor=true return vd end local ve,vf,vg,vh=h5("BUY",-164,30),h5("ANY",-131,30),h5("WISH",-98,34),h5("FUSE",-61,56)
local h6=h4 ve.MouseButton1Click:Connect(function()q.flag(h6,"b")end)vf.MouseButton1Click:Connect(function()q.flag(h6,"g")end)
vg.MouseButton1Click:Connect(function()q.flag(h6,"w")end)vh.MouseButton1Click:Connect(function()q.flag(h6,"f")end)
q.rows[h4]={b=ve,g=vf,w=vg,f=vh,name=mZ,desc=m0,boostText=vc,row=ff}end end q.built=true q.paintAll()end function e.paint()
M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,d.HideBases,e.BASES[e.basesMode()],e.BASES[0])M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function e.applyAll()if d.Lite then e.lite(true)end
if d.Calm then e.calm(true)end if d.HideHud then e.hideHud(true)end if d.NoRender then e.render(true)end if d.HideBases then e.bases(true)end
if(d.FpsCap or 0)~=0 then e.cap(d.FpsCap)end e.paint()end T(a.pfLite.MouseButton1Click:Connect(function()e.lite(not d.Lite)e.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()e.calm(not d.Calm)e.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()e.hideHud(not d.HideHud)e.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()e.render(not d.NoRender)e.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()e.setBases((e.basesMode()+1)%3)e.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local Ep=table.find(e.CAPS,d.FpsCap or 0)or 1 local vi=e.CAPS[(Ep%#e.CAPS)+1]
if not e.cap(vi)and vi~=0 then A("this executor cannot cap fps")end e.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local m1=tonumber(a.pfMem.Text)if m1 and m1>=0 then d.MemLimit=math.floor(m1)end e.paint()end))function z.names()
local m2={"(none)"}for HT,Eq in ipairs((z.teams()))do m2[#m2+1]=Eq.name end return m2 end function z.cycle(m3,Er)
local h7=z.names()local Es=d[m3]~=""and d[m3]or"(none)"local h8=table.find(h7,Es)or 1 h8=((h8-1+Er)%#h7)+1 d[m3]=h7[h8]=="(none)"and""or h7[h8]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local m4={}for HU,Et in ipairs((z.teams()))do m4[Et.name]=true end
for Eu,vj in pairs(z.pick)do local dn=d[Eu]vj.Text=dn==""and"(none)"or(m4[dn]and dn or(dn.." (missing)"))vj.TextColor3=(dn~=""and not m4[dn])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local Ev,h9=q.srv(),{}for HV,h_ in ipairs(z.list or{})do h9[#h9+1]=("st %-2s %-22s %9s  helps %d"):format(h_.st.Name,ak(W(h_.name)):sub(1,22),z.clock(h_.ends-Ev),h_.helps)
end a.tmList.Text=#h9>0 and table.concat(h9,"\n")or"no waxes running"end function z.build()for HW,ia in ipairs(a.teamList:GetChildren())do
if ia:IsA("Frame")or ia:IsA("TextLabel")or ia:IsA("TextButton")then ia:Destroy()end end z.pick={}local ib=a.card(a.teamList,"Automatic")
a.tmT=a.switch(ib,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(ib,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild z.paint()end)a.tmBuildNow=a.actions(ib,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local Ew,Ex=pcall(C.rebuild,"you asked")if not Ew then A("BUILD ERR "..tostring(Ex))end end)
end)a.tmInfo=a.grow(ib,10,l.dim)local vk=a.card(a.teamList,"Which team when")local function ic(ie,Ey,Ez)local fg=a.row(vk,54)
P(fg,Ey,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local vl=P(fg,Ez,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
vl.TextWrapped,vl.TextTruncate=false,Enum.TextTruncate.AtEnd local EA=ai(fg,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local vm=ai(fg,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local EB=ai(fg,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
EA.MouseButton1Click:Connect(function()z.cycle(ie,-1)end)EB.MouseButton1Click:Connect(function()z.cycle(ie,1)end)
vm.MouseButton1Click:Connect(function()z.cycle(ie,1)end)z.pick[ie]=vm end ic("TeamNormal","Normal","the rest of the time: money + luck")
ic("TeamFull","Full","every station busy: money + wax speed")ic("TeamGlaze","Glaze","worn just before a wax finishes")
local ig=a.row(vk,26)P(ig,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hA(ig,tostring(d.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(ig,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local EC=ai(ig,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
EC.MouseButton1Click:Connect(function()local ih=tonumber(a.tmLead.Text)if ih and ih>=5 and ih<=600 then d.GlazeLead=math.floor(ih)else a.tmLead.Text=tostring(d.GlazeLead)end
z.paint()end)ic("TeamWax","Wax","while a butter is placed: head starts")local vn=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(vn)},vn)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local ED=a.card(a.teamList,"How it works")a.note(ED,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function EE()a.secB.Text=tostring(d.Every)M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")e.paintGhost()o.paint()M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(e.unpin)end end)end
M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eQ(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bQ(a.root)bQ(a.tgRoot)c.lastCollect=y()
mH()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(e.applyAll)end local function EF(vo)task.spawn(function()vo.TextColor3=l.bad
task.wait(0.8)if c.alive then vo.TextColor3=l.text end end)end local function vp()local vq=a.secB.Text:match("^%s*(%d+)%s*$")
local fh=vq and tonumber(vq)if not fh or fh<1 then a.secB.Text=tostring(d.Every)EF(a.secB)A("interval must be a whole number >= 1")
return end if fh==d.Every then return end d.Every,c.lastCollect=fh,y()A("collect every "..fh.."s")end local function N(EG,EH)T(EG.MouseButton1Click:Connect(EH))end
N(a.secSet,vp)T(a.secB.FocusLost:Connect(vp))N(a.colT,function()d.Collect,c.lastCollect=not d.Collect,y()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",sN)end)N(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
d.Help=not d.Help E.nextAt,E.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()d.Quests=not d.Quests F.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,e.cycleGhost)function o.paint()M(a.snapT,d.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
M(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(EI)task.spawn(function()pcall(o.tick)if EI and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local EJ=o.on()d.AutoIndex=not d.AutoIndex o.discAt=-100 o.changed(EJ)end)
N(a.bestT,function()local EK=o.on()d.Best=((d.Best or 0)+1)%5 o.stackAt=-100 o.changed(EK)end)N(a.bcT,function()
local EL=o.on()d.BestCrate=not d.BestCrate o.changed(EL)end)N(a.shT,function()d.Shower=not d.Shower o.paint()
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
local dq,m5={},af:FindFirstChild("AdminShow")if m5 then local EM,EN=pcall(function()return m5:GetAttributes()end)
for vr,dr in pairs(EM and EN or{})do local ii=type(vr)=="string"and vr:match("^(.-)Mult$")local m6=ii and tonumber(m5:GetAttribute(ii.."Until"))
if ii and type(dr)=="number"and dr~=1 and dr~=0 and m6 and m6>bS then dq[#dq+1]=("%s  x%s   %s left"):format(ii:gsub("(%l)(%u)","%1 %2"),(dr%1==0)and tostring(dr)or("%.2f"):format(dr),
z.clock(m6-bS))end end end table.sort(dq)a.put(a.admBoost,#dq>0 and table.concat(dq,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dq>0 and l.accent or l.dim local ij=0 for HY in pairs(O.drops)do ij=ij+1 end local vs=o.snapAt and(o.snapAt-bS)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,ij>0 and(", "..ij.." falling")or"",
vs and("in "..math.max(0,math.floor(vs)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",d2,true)end)N(a.padB,function()c.plot=bw()or c.plot local vt,m7=ap(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(vt and m7 and m7:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=m7 .CFrame:ToObjectSpace(vt.HumanoidRootPart.CFrame)
Bw(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eQ(not c.running)end)N(a.buyB,function()
c.plot=bw()or c.plot task.spawn(as,"buying (manual)...",o3,true)end)N(a.plB,function()c.plot=bw()or c.plot task.spawn(as,"waxing (manual)...",o7)
end)N(a.tabFarm,function()a1("farm")end)N(a.tabRun,function()a1("run")end)N(a.tabSrv,function()a1("srv")end)N(a.tabAdm,function()a1("adm")end)
N(a.tabBut,function()a1("but")end)N(a.tabSet,function()a1("set")end)N(a.tabCrt,function()a1("crt")end)N(a.tabPet,function()a1("pet")end)
N(a.tabTeam,function()a1("team")end)local function EO(m8)c.hidden=m8 a.root.Visible=not m8 a.tgBtn.TextColor3=m8 and l.text or l.ink
end ui(a.tgBtn,a.tgRoot,function()bQ(a.tgRoot)c.togPos=hF(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then EO(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aJ,aw={},0 local function bW()aJ=oo()if#aJ==0 then a.cfgPick.Text="(none saved)"
aw=0 return end if aw<1 or aw>#aJ then aw=1 end a.cfgPick.Text=aJ[aw]..("  (%d/%d)"):format(aw,#aJ)end local function vu()
local vv=c.autoload~=nil a.cfgAuto.Text=vv and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=vv and l.accent or l.panel2
end local function m9()local vw=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if vw~=""then return vw end return(aw>0 and aJ[aw])or""
end N(a.cfgSave,function()c.winPos=hF(a.root)or c.winPos c.togPos=hF(a.tgRoot)or c.togPos local vx,vy=fX(m9())
a.cfgMsg.Text=vx and("saved as "..vy)or("could not save: "..vy)a.cfgMsg.TextColor3=vx and l.good or l.bad bW()
A(a.cfgMsg.Text)end)local function EP(m_)local na,vz=oz(m_)a.cfgMsg.Text=na and("loaded "..vz)or("could not load: "..vz)
a.cfgMsg.TextColor3=na and l.good or l.bad if na then a.cfgName.Text=m_ EE()task.spawn(D.apply,"config "..m_)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()EP(m9())end)N(a.cfgPick,function()bW()if aw>0 then a.cfgName.Text=aJ[aw]end
end)N(a.cfgPrev,function()if#aJ==0 then bW()return end aw=(aw-2)%#aJ+1 bW()a.cfgName.Text=aJ[aw]end)N(a.cfgNext,function()
if#aJ==0 then bW()return end aw=aw%#aJ+1 bW()a.cfgName.Text=aJ[aw]end)N(a.cfgAuto,function()if c.autoload then
oB(nil)a.cfgMsg.Text="it will not load a config on launch"else local fj=m9()local vA=false for HZ,EQ in ipairs(oo())do if EQ==fj then vA=true end end
local ER=vA or fX(fj)if ER and fj~=""then oB(fj)bW()a.cfgMsg.Text=fj.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim vu()end)N(a.autoB,function()
local vB,vC=xv()a.autoMsg.Text=vB and("installed. "..vC)or("failed: "..vC)a.autoMsg.TextColor3=vB and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dL("you asked")end)
local a_=false N(a.minB,function()a_=not a_ a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not a_,not a_,not a_
if a_ then for H0,ES in ipairs(a.tabKeys)do a[ES].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a1(u1)
end a.root.Size=UDim2 .new(0,Q.w,0,a_ and(Q.head+Q.status+12)or Q.h)a.minB.Text=a_ and"+"or"-"end)local function ik()
if not c.alive then return end c.alive,c.running=false,false pcall(e.restoreAll)pcall(fw)for H1,ET in ipairs(iu)do pcall(function()ET:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()mf:Destroy()end)
pcall(function()uL:Destroy()end)if cC.SAB_KILL==ik then cC.SAB_KILL=nil end end cC.SAB_KILL=ik N(a.killB,ik)N(a.xB,ik)
ui(a.title,a.root,function()bQ(a.root)c.winPos=hF(a.root)or c.winPos end)local function vD()local fk,cB=c.reason,c.level
if c.busy then fk,cB=c.busyText,"ok"elseif not c.running then local H2,vE,EU=to()if c.capHit then fk,cB=vE,"bad"else fk,cB="[stopped] "..vE,(EU=="bad")and"bad"or"idle"end
c.reason,c.level=fk,cB end local ds=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=ds then
a.lit.dot=ds a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=ds,ds,ds,ds a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fk)if a.lit.bar~=cB then a.lit.bar=cB a.bar.BackgroundColor3=CH[cB]or l.dim end
if a_ then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bX=w6()if a.farm.Visible then local EW,EX=ft()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,EW.."/"..EX)local vF=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(y()-c.lastCollect)))or nil
local vG=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aL(ba()),c.rolls,c.gifts,c.crates,vG and ak(W(vG))or"nothing",j.on and("   ["..j.title.." window open]")or"",
vF and("in "..vF.."s")or"off"))a.put(a.tgt,(#bX==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bX<=3)and table.concat(bX,", ")or(#bX.." butters ticked"))))
if a.lit.tgt~=(#bX==0)then a.lit.tgt=(#bX==0)a.tgt.TextColor3=(#bX==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fn,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(d.Help or d.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,d.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,e.ghostMode()>0 and(e.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bX))
end if a.but.Visible and bu.at~=ad.at then fc(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(e.fps+0.5),e.mem,e.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((d.Help or d.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(d.Campfire and K.msg or"off")..(e.ghostMode()>0 and(e.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(d.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local vH=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",vH~=""and vH or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cC.SAB={S=c,CFG=d,EV=V,U=a,sg=mf,CAT=ad,LEARN=aj,buildList=fc,
logAll=dt,evAll=du,AR=D,CR=L,PF=e,PX=q,TM=z,CRATE=j,FU=C,HX=E,CF=K,QX=F,IX=o,SH=O}A(bY.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a1("farm")bQ(a.root)bQ(a.tgRoot)if hC then pcall(function()T(hC:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bQ(a.root)bQ(a.tgRoot)end))end)end bW()vu()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")e.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(e.applyAll)pcall(vD)task.spawn(function()local vI=xt()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(vI and("\n(backup: "..vI..")")or"")
local vJ=fR(am.exec)if vJ and not vJ:find("SAB autoloader v2",1,true)then dH(am.exec,am.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fR(am.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(xC)end)task.spawn(function()while c.alive do local EY,EZ=pcall(vD)if not EY then A("UI ERR "..tostring(EZ))end
task.wait((c.hidden or a_)and 1.5 or 0.4)end end)task.spawn(function()local E0,E1=pcall(xK)if not E0 then A("HOOK ERR "..tostring(E1))end
end)task.spawn(function()pcall(ws)if j.loadSeq and not j.learned then local il={}for vK=1,20 do if j.loadSeq[vK]then il[#il+1]=j.loadSeq[vK]end end
if#il>0 then j.learned={seq=il,mode=j.loadMode}A("remembered how to open crates directly")end end if i3()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local E2,vL=pcall(By)if E2 and vL and c.alive and not c.manualPad then c.manualPad=vL end end)task.spawn(function()
while c.alive do local nb,nc=pcall(q.buyTick)if not nb then A("PET ERR "..tostring(nc))task.wait(5)end nb,nc=pcall(q.wishTick)
if not nb then A("WISH ERR "..tostring(nc))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local im,vM=0,y()
T(game:GetService("RunService").Heartbeat:Connect(function()im=im+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if e.hold then pcall(e.pinTick)end end))
e.noteAt=y()while c.alive do task.wait(1)local vN=y()e.fps,im,vM=im/math.max(vN-vM,0.001),0,vN local E3,E4=pcall(e.tick)
if not E3 then A("PERF ERR "..tostring(E4))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local E5,E6=pcall(C.tick)if not E5 then A("FUSE ERR "..tostring(E6))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local E7,E8=pcall(z.tick)if not E7 then A("TEAM ERR "..tostring(E8))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local io=af:WaitForChild("Remotes",30)local vO=io and io:WaitForChild("ClanEvent",30)
if vO and c.alive then T(vO.OnClientEvent:Connect(function(E9,E_)if E9=="call"then pcall(E.onCall,E_)end end))
end local vP=io and io:FindFirstChild("RollConfirmAsk")if vP and c.alive then T(vP.OnClientEvent:Connect(function(Fa)F.asked=Fa or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(e.calmScan)end end end)task.spawn(function()
local nd=af:WaitForChild("Remotes",30)if not(nd and c.alive)then return end local function ip(Fb,Fc)local ne=nd:FindFirstChild(Fb)
if ne and ne:IsA("RemoteEvent")then T(ne.OnClientEvent:Connect(function(...)pcall(Fc,...)end))end end ip("NewSquishyDiscovered",function(nf,vQ)
if type(nf)~="string"then return end o.disc=o.disc or{}o.disc[W(nf)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(nf)),vQ and(" ("..tostring(vQ)..")")or""))
end)ip("IndexRefresh",o.loadDisc)ip("IndexRowComplete",function(Fd)A("INDEX: the whole "..tostring(Fd).." row is complete")end)
ip("AdminShow",o.admin)local vR=nd:FindFirstChild("AdminShowSync")if vR then local Fe,vS=pcall(function()return vR:InvokeServer()end)
if Fe and type(vS)=="table"then for H3,Ff in pairs(vS)do pcall(O.add,Ff)end end end while c.alive do local Fg,Fh=pcall(o.tick)
if not Fg then o.msg="index error: "..tostring(Fh)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Fi,Fj=pcall(F.tick)if not Fi then A("QUEST ERR "..tostring(Fj))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(fw)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Fl=(type(newcclosure)=="function")and newcclosure or function(Fk)return Fk end local ng
local vT=(type(setnamecallmethod)=="function")and setnamecallmethod or nil ng=hookmetamethod(game,"__namecall",Fl(function(vU,...)
local fl=getnamecallmethod()if c.alive and(fl=="InvokeServer"or fl=="FireServer")then local vV,vW=pcall(function()return vU.Name end)
if vV and vW=="CrateAction"and not j.replaying then pcall(j.saw,fl,...)elseif vV and vW=="AutoRollAction"and not D.replaying then pcall(D.saw,fl,...)end
if vT then vT(fl)end end return ng(vU,...)end))j.oldNC=ng end)end if is then T(J.Idled:Connect(function()pcall(function()is:CaptureController()is:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for H4=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ap()and(c.plot or bw())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local iq=b3()
if iq and o.on()and not aK(iq.name)then iq=nil end if c.alive and d.AutoRoll and c.running and not D.isOn()and not iq and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for H5=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bw()if ap()and c.plot and o.any()then eQ(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bw()c.lastCollect=y()while c.alive do if c.running then local Fm,vX=pcall(CB)if not Fm and vX~=it then A("LOOP ERR "..tostring(vX))end
end task.wait(0.1)end end)ir("ready - the window is at the top left")end local Fo,nh=xpcall(v1,function(Fn)return tostring(Fn).."\n"..debug.traceback()end)
if not Fo then pcall(function()warn("SAB "..bY.." ERROR: "..tostring(nh))end)ir("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bY.." ERROR: "..tostring(nh))end)pcall(function()local vY=(type(getgenv)=="function"and getgenv())or _G
if type(vY.SAB_KILL)=="function"then vY.SAB_KILL()end for H6,Fp in ipairs({"SABFarmGui","SABToggle"})do local vZ=J.PlayerGui:FindFirstChild(Fp)
if vZ then vZ:Destroy()end end end)pcall(function()local fm=Instance.new("ScreenGui")fm.Name="SABError"fm.ResetOnSpawn=false
fm.DisplayOrder=1000 local a3=Instance.new("TextBox")a3 .Size=UDim2 .new(0,340,0,170)a3 .Position=UDim2 .new(0,10,0,50)
a3 .BackgroundColor3=Color3 .fromRGB(90,20,20)a3 .TextColor3=Color3 .new(1,1,1)a3 .TextSize=11 a3 .TextWrapped=true
a3 .ClearTextOnFocus=false a3 .TextXAlignment=Enum.TextXAlignment.Left a3 .TextYAlignment=Enum.TextYAlignment.Top
a3 .Text="SAB "..bY.." failed to start. Send this text:\n"..tostring(nh)a3 .Parent=fm fm.Parent=J:WaitForChild("PlayerGui")
end)end
