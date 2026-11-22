local bY="v27"local ng=game:GetService("Players")local J=ng.LocalPlayer or ng.PlayerAdded:Wait()local function ip(vW)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bY,Text=vW,Duration=6})
end)end ip("script started")local function vX()local ah=game:GetService("ReplicatedStorage")local ao=game:GetService("Workspace")
local nh=game:GetService("UserInputService")local cC=(type(getgenv)=="function"and getgenv())or _G if type(cC.SAB_KILL)=="function"then pcall(cC.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local iq=(function()local vY,vZ=pcall(function()return game:GetService("VirtualUser")end)return vY and vZ or nil end)()
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
local q,z,j,C,E,K,F={},{},{},{},{},{},{}local o,O={},{}local ir={}local is,fn,dt,du={},{},{},{}local function T(ni)is[#is+1]=ni return ni end
local function af(v0)task.wait(v0)if not c.alive then error(ir,0)end end local function A(fo)fo=os.date("%H:%M:%S").." "..tostring(fo)
table.insert(fn,1,fo)if#fn>6 then table.remove(fn)end c.logN=(c.logN or 0)+1 dt[#dt+1]=fo if#dt>80 then table.remove(dt,1)end
end local function fp(nj)if type(nj)~="string"then return""end return(nj:lower():gsub("[^%w]",""))end local function W(v1)
local nk=fp(v1)local it=nk:gsub("butter$","")if it==""then it=nk end return it end local function aK(nl)if type(nl)~="string"then return false end
local iu=W(nl)if iu==""then return false end if o.want then return o.want(iu)end return d.Targets[iu]==true end
local function v2(dv)dv=dv:lower()return dv:find("squishy",1,true)~=nil or dv:match("butter$")~=nil or dv:match("butter[^%a]")~=nil
end local iv={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aL(dw)if type(dw)~="number"then return"?"end
local fq=1 while math.abs(dw)>=1000 and fq<#iv do dw=dw/1000 fq=fq+1 end local v3=string.format("%.2f",dw):gsub("%.?0+$","")
return v3 ..iv[fq]end local function v4(nm)if type(nm)~="string"then return nil end local v5,dx=nm:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local iw=tonumber(v5)if not iw then return nil end if dx==""then return iw end local v6={qd="qa",qn="qi"}dx=v6[dx:lower()]or dx
for v7,v8 in ipairs(iv)do if v8:lower()==dx:lower()then return iw*1000^(v7-1)end end return nil end local function ba()
local nn=J:GetAttribute("BoardValueMoney")if type(nn)=="number"then return nn end local no=J:FindFirstChild("leaderstats")
if no then for Fi,v9 in ipairs({"Cash","Money","Coins"})do local ix=no:FindFirstChild(v9)if ix and type(ix.Value)=="number"then return ix.Value end
end end end local function fr(v_)local iy=v_:GetFullName()if c.plot then local iz=c.plot:GetFullName()if iy:sub(1,#iz)==iz then return iy:sub(#iz+2)end
end return iy end local function ap()local fs=J.Character if fs and fs:FindFirstChild("HumanoidRootPart")then
local np=fs:FindFirstChildOfClass("Humanoid")if np and np.Health>0 then return fs end end end local function bw()
local iA=ao:FindFirstChild("Plots")if not iA then return nil end local function nq(wa)local nr=wa:FindFirstChild("Plate")
return nr~=nil and nr:FindFirstChild("EditStackAttachment",true)~=nil end local ns=J:GetAttribute("PlotNumber")
if ns~=nil then local iB=iA:FindFirstChild(tostring(ns))if iB and nq(iB)then return iB end end for Fj,nt in ipairs(iA:GetChildren())do
if nq(nt)then return nt end end end local function dy(nu)local bx=nu and nu.Parent for Fk=1,6 do if not bx then return nil end
if bx:IsA("BasePart")then return bx end if bx:IsA("Model")then return bx.PrimaryPart or bx:FindFirstChildWhichIsA("BasePart",true)end
bx=bx.Parent end end local function nv(nw)local iC=nw.Parent if iC and iC:IsA("Attachment")then return iC.WorldPosition end
local nx=dy(nw)return nx and nx.Position end local function ny()local cD=c.plot and c.plot:FindFirstChild("Plate")
if not cD then return nil end if cD:IsA("BasePart")then return cD.Position end if cD:IsA("Model")then return cD:GetPivot().Position end
local nz=cD:FindFirstChildWhichIsA("BasePart",true)return nz and nz.Position end local function nA()local iD={}
local nB=c.plot and c.plot:FindFirstChild("WaxStations")if nB then for Fl,wb in ipairs(nB:GetChildren())do local nC=wb:FindFirstChild("SquishyPlaceHolder")
local iE=nC and nC:FindFirstChild("PlacePrompt")if iE and iE:IsA("ProximityPrompt")then iD[#iD+1]=iE end end end
return iD end local function ft()local nD,iF=nA(),0 for Fm,wc in ipairs(nD)do if wc.Enabled then iF=iF+1 end end
local iG=#nD local iH=J:GetAttribute("WaxStations")if type(iH)=="number"and iH>iG then iG=iH end return iF,iG
end local function wd()local nE=ap()local nF=nE and nE.HumanoidRootPart.Position local iI,nG for Fn,iJ in ipairs(nA())do
if iJ.Enabled then local nH=nv(iJ)local nI=(nH and nF)and(nH-nF).Magnitude or 1e9 if not iI or nI<nG then iI,nG=iJ,nI end
end end return iI end local function nJ()local fu=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fu then return nil end local nK=fu:FindFirstChild("BuyPromptAttachment")local fv=(nK and nK:FindFirstChild("BuyPrompt"))or fu:FindFirstChild("BuyPrompt",true)
if fv and fv:IsA("ProximityPrompt")and fv:IsDescendantOf(fu)then return fv end end local nL={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local we={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iK="SAB_order.txt"local function fw()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for wf,wg in pairs(aj.price)do aB[#aB+1]="P|"..wf.."|"..string.format("%.0f",wg)end for wh,wi in pairs(aj.order)do aB[#aB+1]="O|"..wh.."|"..table.concat(wi,",")end
if e.learned and e.enc then aB[#aB+1]="M|mode|"..tostring(e.learned.mode or"")for wj,fy in ipairs(e.learned.seq)do
local nM={}for nN=1,fy.n do nM[nN]=e.enc(fy.args[nN])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(wj,fy.m,fy.n,table.concat(nM,";"))
end end local function iL(wk,wl,fz)local nO={}for nP=1,fz.n do nO[nP]=e.enc(fz.args[nP])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(wl,wk,fz.m,fz.n,table.concat(nO,";"))
end if e.enc then for wm,wn in ipairs(D.rec.rules)do iL("rules",wm,wn)end if D.rec.on then iL("on",0,D.rec.on)end
if D.rec.off then iL("off",0,D.rec.off)end end for Fo,dz in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dz.name,dz.title or"",dz.rar or"",dz.price and string.format("%.0f",dz.price)or"")
end if pcall(writefile,iK,table.concat(aB,"\n"))then aj.dirty=false end end local function wo()if type(isfile)~="function"or type(readfile)~="function"then return end
local wp,wq=pcall(isfile,iK)if not(wp and wq)then return end local wr,nQ=pcall(readfile,iK)if not(wr and type(nQ)=="string")then return end
for ws in nQ:gmatch("[^\n]+")do local cE,cF,bc=ws:match("^(%a)|([^|]+)|(.*)$")if cE=="P"then aj.price[cF]=tonumber(bc)
elseif cE=="M"then e.loadMode=(bc~=""and bc~="nil")and bc or nil elseif cE=="A"and e.dec then local nR=tonumber(cF)
local nS,fA,wt=bc:match("^([^|]+)|(%d+)|(.*)$")if nR and nS then fA=tonumber(fA)local nT,fB={},0 for wu in(wt..";"):gmatch("([^;]*);")do
fB=fB+1 if fB<=fA then nT[fB]=e.dec(wu)end end e.loadSeq=e.loadSeq or{}e.loadSeq[nR]={m=nS,n=fA,args=nT}end elseif cE=="R"and e.dec then
local nU=tonumber(cF)local fC,wv,fD,ww=bc:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if nU and fC then fD=tonumber(fD)
local nV,fE={},0 for wx in(ww..";"):gmatch("([^;]*);")do fE=fE+1 if fE<=fD then nV[fE]=e.dec(wx)end end local iM={m=wv,n=fD,args=nV}
if fC=="rules"then D.rec.rules[nU]=iM elseif fC=="on"then D.rec.on=iM elseif fC=="off"then D.rec.off=iM end end
elseif cE=="K"then local nW,nX,wy=bc:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cF)]={name=cF,title=nW~=""and nW or nil,
rar=nX~=""and nX or nil,price=tonumber(wy)}elseif cE=="O"and bc~=""then local fF={}for wz in bc:gmatch("[^,]+")do fF[#fF+1]=wz end
if#fF>0 then aj.order[cF]=fF end end end end local function wA(fG)if type(fG)~="table"then return end local bZ,nY=fG.rarity,fG.contents
if type(bZ)~="string"or bZ==""or type(nY)~="table"then return end local dA={}for Fp,fH in ipairs(nY)do if type(fH)=="table"and type(fH.butter)=="string"then
dA[#dA+1]={n=fH.butter,ch=tonumber(fH.chance)or 0}end end if#dA==0 then return end table.sort(dA,function(wB,wC)return wB.ch>wC.ch end)
local dB,dC={},false for wD,wE in ipairs(dA)do dB[wD]=wE.n end local iN=aj.order[bZ]if not iN or#iN~=#dB then dC=true end
if not dC then for nZ=1,#dB do if iN[nZ]~=dB[nZ]then dC=true break end end end aj.order[bZ]=dB local iO=tonumber(fG.price)
if iO and aj.price[bZ]~=iO then aj.price[bZ]=iO dC=true end if dC then aj.dirty=true ad.at=0 A("learned the "..bZ.." order from its crate")
end end local function cG(wF,wG)local wH=wF:FindFirstChild(wG,true)local wI,iP=pcall(function()return wH.Text end)
return(wI and type(iP)=="string"and iP~="")and iP or nil end local function ak(n0)return ad.pretty[n0]or n0 end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(wJ)return fp(wJ or"")end
function L.learn(bd)if type(bd)~="table"or type(bd.name)~="string"then return end local iQ=L.key(bd.name)local be=L.seen[iQ]or{}
local wK=(L.seen[iQ]==nil)or(tonumber(bd.price)and be.price~=tonumber(bd.price))be.name,be.title=bd.name,bd.title or be.title
be.rar,be.price=bd.rarity or be.rar,tonumber(bd.price)or be.price L.seen[iQ]=be if wK then L.at,aj.dirty=y(),true end
end function L.wanted(n1)if n1==nil then return false end local iR=L.key(n1)return d.CrateTicks[iR]==true or(d.BestCrate and o.bestCrate~=nil and(iR==o.bestCrate or iR==o.bestCrateTitle))
end function L.list()local cH={}for wL,fI in ipairs(L.base)do cH[L.key(fI[1])]={name=fI[1],title=fI[2],rar=fI[3],i=wL}end
for Fq,dD in ipairs(ad.rarOrder)do local n2=false for Fr,wM in pairs(cH)do if wM.rar==dD then n2=true break end end
if not n2 and dD~="?"then local n3=dD:gsub("[^%w]","").."Crate"cH[L.key(n3)]={name=n3,title=dD.." Crate",rar=dD,i=50,guess=true}
end end for n4,fJ in pairs(L.seen)do local a4=cH[n4]or{i=100}a4 .name,a4 .title,a4 .rar=fJ.name or a4 .name,fJ.title or a4 .title,fJ.rar or a4 .rar
a4 .price,a4 .guess=fJ.price or a4 .price,nil cH[n4]=a4 end local dE,fK={},{}for wN,wO in ipairs(nL)do dE[wO]=wN end
for wP,n5 in ipairs(ad.rarOrder)do dE[n5]=dE[n5]or(20+wP)end for wQ,dF in pairs(cH)do dF.k=wQ dF.price=dF.price or aj.price[dF.rar or""]
fK[#fK+1]=dF end table.sort(fK,function(b0,b1)if b0 .price and b1 .price and b0 .price~=b1 .price then return b0 .price<b1 .price end
local n6,n7=dE[b0 .rar or""]or 99,dE[b1 .rar or""]or 99 if n6~=n7 then return n6<n7 end if(b0 .i or 100)~=(b1 .i or 100)then return(b0 .i or 100)<(b1 .i or 100)end
return b0 .k<b1 .k end)return fK end local function wR()local n8=ah:FindFirstChild("Assets")local n9=n8 and n8:FindFirstChild("Squishies")
if not n9 then return false end local iS,n_,cI={},{},{}local fL=0 for Fs,fM in ipairs(n9:GetChildren())do local dG=W(fM.Name)
if dG~=""and not iS[dG]then local fN=cG(fM,"RarityText")or"?"iS[dG]=fN n_[dG]=cG(fM,"NameText")or fM.Name cI[fN]=cI[fN]or{}
table.insert(cI[fN],dG)fL=fL+1 end end if fL==0 then return false end for oa,wS in pairs(cI)do local ob=aj.order[oa]or we[oa]
local iT={}if ob then for wT,wU in ipairs(ob)do iT[W(wU)]=wT end end table.sort(wS,function(oc,od)local iU,iV=iT[oc],iT[od]
if iU and iV then return iU<iV end if iU then return true end if iV then return false end return ak(oc)<ak(od)
end)end local iW={}for wV,wW in ipairs(nL)do iW[wW]=wV end local fO,b2={},{}for wX in pairs(cI)do fO[#fO+1]=wX end
pcall(function()for wY,wZ in ipairs(require(ah.Modules.SquishyRNG).Keys)do b2[wZ]=wY end end)table.sort(fO,function(cJ,cK)
if b2[cJ]and b2[cK]and b2[cJ]~=b2[cK]then return b2[cJ]<b2[cK]end local iX,iY=aj.price[cJ],aj.price[cK]if iX and iY and iX~=iY then return iX<iY end
local iZ,i0=iW[cJ],iW[cK]if iZ and i0 then return iZ<i0 end if iZ then return true end if i0 then return false end
return cJ<cK end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=iS,n_,cI,fO,fL,y()return true end local function i1()
if ad.at==0 or(y()-ad.at)>120 then pcall(wR)end return ad.n>0 end local function w0(w1)local oe=W(w1)return ad.rar[oe]or(V.name and W(V.name)==oe and V.rar)or"?"
end local function w2()local fP={}local w3=((d.Best or 0)>0 and next(o.best or{}))and o.best or d.Targets for w4,w5 in pairs(w3)do if w5 then fP[#fP+1]=ak(w4)end end
table.sort(fP)return fP end local am={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function of()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fQ(og)if type(makefolder)~="function"then return end local w6,w7=pcall(isfolder,og)if not(w6 and w7)then pcall(makefolder,og)end
end local function fR(oh)if type(isfile)~="function"or type(readfile)~="function"then return nil end local w8,w9=pcall(isfile,oh)
if not(w8 and w9)then return nil end local w_,xa=pcall(readfile,oh)return w_ and xa or nil end local function dH(xb,xc)
if type(writefile)~="function"then return false end return(pcall(writefile,xb,xc))end local function oi(xd)local dI={}
if type(listfiles)~="function"then return dI end local xe,oj=pcall(listfiles,xd)if not xe or type(oj)~="table"then return dI end
for Ft,xf in ipairs(oj)do dI[#dI+1]=tostring(xf)end return dI end local function ol()local fS={}for Fu,xg in ipairs(oi(am.cfg))do
local om=xg:match("([^/\\]+)%.txt$")if om then fS[#fS+1]=om end end table.sort(fS)return fS end local function xh()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(d.Every)aa[#aa+1]="N|GlazeLead|"..tostring(d.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(d.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(d.MemLimit)aa[#aa+1]="N|Best|"..tostring(d.Best or 0)for Fv,oo in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..oo.."|"..d[oo]end
do local fT={}for xi,dJ in pairs(d.Pets)do local op=(dJ.b and"b"or"")..(dJ.g and"g"or"")..(dJ.w and"w"or"")..((tonumber(dJ.f)or 0)>0 and tostring(dJ.f)or"")
if op~=""then fT[#fT+1]=xi.."|"..op end end table.sort(fT)aa[#aa+1]="P|-"for Fw,xj in ipairs(fT)do aa[#aa+1]="P|"..xj end
end for Fx,oq in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..oq.."|"..(d[oq]and"1"or"0")end local i2=J:GetAttribute("AutoRollRules")if type(i2)=="string"and i2~=""then d.ARrules,d.ARstop=i2,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then aa[#aa+1]="S|rules|"..d.ARrules aa[#aa+1]="S|stop|"..d.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Fy,i3 in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fU={}for xk,xl in pairs(i3[2])do if xl then fU[#fU+1]=xk end end table.sort(fU)aa[#aa+1]=i3[1].."|-"for Fz,xm in ipairs(fU)do aa[#aa+1]=i3[1].."|"..xm end
end return table.concat(aa,"\n")end local function xn(i4)if type(i4)~="string"or i4==""then return false end local ot,ou,ov,ow,dK={},false,{},false,nil
for xo in i4:gmatch("[^\n]+")do local aC,ag,ax=xo:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ag=="Every"then local i5=tonumber(ax)
if i5 and i5>=1 then d.Every=math.floor(i5)end elseif aC=="N"and(ag=="FpsCap"or ag=="MemLimit")then local i6=tonumber(ax)
if i6 and i6>=0 then d[ag]=math.floor(i6)end elseif aC=="N"and ag=="Best"then local fV=tonumber(ax)if fV and fV>=0 and fV<=4 then d.Best=math.floor(fV)end
elseif aC=="N"and ag=="GlazeLead"then local fW=tonumber(ax)if fW and fW>=5 and fW<=600 then d.GlazeLead=math.floor(fW)end
elseif aC=="S"and(ag=="TeamNormal"or ag=="TeamFull"or ag=="TeamGlaze"or ag=="TeamWax")then d[ag]=ax elseif aC=="P"and ag~=""then
if not dK then dK={}end if ag~="-"and ax~=""then dK[ag]={b=ax:find("b",1,true)and true or nil,g=ax:find("g",1,true)and true or nil,
w=ax:find("w",1,true)and true or nil,f=tonumber(ax:match("%d"))}end elseif aC=="B"then if d[ag]~=nil then d[ag]=(ax=="1")end
elseif aC=="S"and ag=="rules"then d.ARrules=ax elseif aC=="S"and ag=="stop"then d.ARstop=ax elseif aC=="W"then
c.winPos={tonumber(ag)or 10,tonumber(ax)or 44}elseif aC=="G"then c.togPos={tonumber(ag)or 10,tonumber(ax)or 300}
elseif aC=="T"and ag~=""then if ag~="-"then ot[ag]=true end ou=true elseif aC=="K"and ag~=""then if ag~="-"then ov[ag]=true end
ow=true end end if ou then d.Targets=ot end if ow then d.CrateTicks=ov end if dK then d.Pets=dK end return true
end local function fX(cL)if not of()then return false,"this executor cannot write files"end cL=(cL or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cL==""then return false,"give the config a name"end fQ(am.dir)fQ(am.cfg)if not dH(am.cfg.."/"..cL..".txt",xh())then return false,"could not write the file"end
c.config=cL return true,cL end local function ox(fY)local oy=fR(am.cfg.."/"..fY..".txt")if not oy then return false,"no config called "..tostring(fY)end
if not xn(oy)then return false,"that config looks empty"end c.config=fY return true,fY end local function oz(i7)
if i7 then fQ(am.dir)dH(am.auto,i7)elseif type(delfile)=="function"then pcall(delfile,am.auto)else dH(am.auto,"")
end c.autoload=i7 end local function xp()if c.selfPath then return c.selfPath end local fZ for FA,xq in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",am.dir})do
for FB,oA in ipairs(oi(xq))do local i8=oA:lower()if i8:sub(-4)==".lua"and(i8:find("sab_farm",1,true)or i8:find("sab farm",1,true))then
fZ=fZ or oA end end end c.selfPath=fZ return fZ end am.stub=[[
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
local function xr()if not of()then return false,"this executor cannot write files"end fQ("autoexec")if not dH(am.exec,am.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local f0=(function()local xs,xt=pcall(function()return game:GetService("TeleportService")end)return xs and xt or nil end)()
local function oB()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local xu=queueonteleport or queue_on_teleport return(pcall(xu,am.stub))end local function dL(xv)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..xv..")")pcall(fw)if c.autoload then pcall(fX,c.autoload)end local xw=oB()A(xw and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for FC=1,30 do if not f0 then break end pcall(function()f0:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function xx()local xy,oC=pcall(function()return game:GetService("GuiService")end)if xy and oC then
pcall(function()T(oC.ErrorMessageChanged:Connect(function()if d.Rejoin then dL("roblox error message")end end))
end)end pcall(function()local oD=game:GetService("CoreGui")local oE=oD and oD:WaitForChild("RobloxPromptGui",15)
local oF=oE and oE:WaitForChild("promptOverlay",15)if oF then T(oF.ChildAdded:Connect(function(xz)if d.Rejoin and tostring(xz.Name):lower():find("errorprompt",1,true)then dL("disconnect prompt")end
end))end end)if f0 then pcall(function()T(f0 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dL("teleport retry")end)end
end))end)end end local function oG(xA)local oH=c.plot and c.plot:FindFirstChild(xA)if not oH then return nil,false end
for FD,i9 in ipairs(oH:GetChildren())do if i9:IsA("Model")or i9:IsA("BasePart")then return i9,true end end return nil,true
end local function b3()local by=oG("RolledSquishy")if not by then return nil end return{model=by,name=by.Name,pretty=cG(by,"NameText")or ak(W(by.Name)),
rar=cG(by,"RarityText")or w0(by.Name),price=cG(by,"PriceText")}end local function oI(i_)return type(i_)=="string"and(ad.rar[W(i_)]~=nil or v2(i_))
end local function ac()local ja=oG("SquishyEquipped")if ja then c.carrySrc,e.heldAt="model",y()return ja.Name,ja end
local oJ=J.Character if oJ then for FE,dM in ipairs(oJ:GetDescendants())do if(dM:IsA("Model")or dM:IsA("Tool"))and oI(dM.Name)then
c.carrySrc,e.heldAt="character",y()return dM.Name,dM end end end local f1=J:GetAttribute("SquishyEquipped")if type(f1)=="string"and f1~=""and oI(f1)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return f1,nil end c.carrySrc=nil end local function FF()local FG,xC=ac()return xC end local function dN()
local oK=b3()local jb=oK and v4(oK.price)local jc=ba()if jb and jc and jc<jb*0.5 then return jc,jb end end local function b4(xD)
du[#du+1]=os.date("%H:%M:%S").." "..xD if#du>40 then table.remove(du,1)end end local function xE(b5,f2)if type(b5)~="string"then return end
b4(("Roll(%s,%s)"):format(b5,tostring(f2)))if b5:lower():find("crate",1,true)then e.rolled,e.rolledAt=b5,y()return
end V.seq=V.seq+1 V.name,V.at=b5,y()V.rar=type(f2)=="string"and f2 or nil c.rolls=c.rolls+1 if aK(b5)then A(("ROLL %s [%s] = TARGET"):format(b5,tostring(f2)))end
end local function xF(b6)if type(b6)~="table"then return end local f3=b6 .butter or b6 .itemName if type(f3)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=f3,y()if type(b6 .giftId)=="string"then local oL=ah:FindFirstChild("Remotes")
local oM=oL and oL:FindFirstChild("GiftThanks")if oM then pcall(function()oM:FireServer(b6 .giftId)end)end end
b4("Gift("..f3 .." from "..tostring(b6 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b6 .fromName),f3))
end local function xG()local oN=ah:WaitForChild("Remotes",30)if not c.alive then return end if not oN then A("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local oO=J:GetAttribute("SquishyEquipped")
if type(oO)=="string"and oO~=""then e.heldAt=y()end end))local xM={SquishyRollAnimation=xE,InitSquishy=function(oP)V.init,V.initAt=tostring(oP),y()b4("Init("..tostring(oP)..")")end,
CrateUpdate=function(cM,oQ)pcall(wA,cM)pcall(L.learn,cM)if type(cM)=="table"then local xH=oQ==true or(e.rolled~=nil and y()-e.rolledAt<15)or e.waiting
if not xH then return end local xI=not e.waiting local xJ=e.on e.waiting,e.data,e.at=true,cM,y()e.on=(oQ==true)
e.title=tostring(cM.title or cM.name or"crate")if e.on and not xJ then e.openedAt,e.byYou=y(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then b4("CrateWindow open("..e.title..")")elseif xI then b4("Crate waiting("..e.title..")")A(e.title.." is waiting on your stand")
end else if e.waiting then b4("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local xK=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,xK)end if e.classify then local xL=y()
task.spawn(function()pcall(e.classify,xL)end)end end end,GiftReceived=xF,}for f4,xN in pairs(xM)do local jd=oN:FindFirstChild(f4)
if jd and jd:IsA("RemoteEvent")then T(jd.OnClientEvent:Connect(xN))elseif f4~="CrateUpdate"and f4~="GiftReceived"then A("remote "..f4 .." missing")end
end end local function je()local b7=b3()if b7 then if aK(b7 .name)then return{state="match",shown=b7 .pretty,src="pad",info=b7}
end return{state="skip",info=b7,level="idle",text=("on pad: %s [%s] - not ticked"):format(b7 .pretty,tostring(b7 .rar))}
end if V.name and(y()-V.at)<4 then if aK(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f5(xO,xP,xQ,xR)
local f6=RaycastParams.new()f6 .FilterType=Enum.RaycastFilterType.Exclude local jf={J.Character}for FH,xS in ipairs(xR or{})do jf[#jf+1]=xS end
f6 .FilterDescendantsInstances=jf pcall(function()f6 .RespectCanCollide=true end)local oR=ao:Raycast(Vector3 .new(xO,xP+4,xQ),Vector3 .new(0,-30,0),f6)
return oR and oR.Position or nil end local function cN(oS)local oT=oS:FindFirstChildOfClass("Humanoid")return((oT and oT.HipHeight)or 2)+oS.HumanoidRootPart.Size.Y/2+0.2
end local function jg(xT,xU)local jh=xT:FindFirstChildOfClass("Humanoid")local xV=y()while y()-xV<xU do if jh and(jh.FloorMaterial~=Enum.Material.Air or jh.SeatPart)then return true end
af(0.05)end return false end local function aD(xW,ji,jj)local oU=xW.HumanoidRootPart oU.AssemblyLinearVelocity=Vector3 .new(0,0,0)
oU.CFrame=jj and CFrame.new(ji,Vector3 .new(jj.X,ji.Y,jj.Z))or CFrame.new(ji)end local function b8(bf,oV)local b9=ap()
if not b9 or not bf then return false end local bz=bf.Position local f7=math.clamp(math.max(bf.Size.X,bf.Size.Z)/2+2.2,3,7)
local oW=(oV and oV.MaxActivationDistance)or 10 if f7>oW-2 then f7=math.max(2.5,oW-2)end local dO={}local function b_(dP)
dP=Vector3 .new(dP.X,0,dP.Z)if dP.Magnitude>0.05 then dO[#dO+1]=dP.Unit end end local oX=ny()if oX then b_(oX-bz)end
b_(bf.CFrame.LookVector)b_(-bf.CFrame.LookVector)b_(bf.CFrame.RightVector)b_(-bf.CFrame.RightVector)b_(b9 .HumanoidRootPart.Position-bz)
if#dO==0 then b_(Vector3 .new(0,0,1))end local xX,f8=cN(b9),false for FI,xY in ipairs(dO)do local f9=bz+xY*f7
local jk=f5(f9 .X,bz.Y,f9 .Z,{bf})if jk and math.abs(jk.Y-bz.Y)<14 then aD(b9,Vector3 .new(f9 .X,jk.Y+xX,f9 .Z),bz)
if jg(b9,0.7)then f8=true break end end end if not f8 then aD(b9,bz+dO[1]*f7+Vector3 .new(0,3,0),bz)f8=jg(b9,1)
end af(0.12)return f8 end local function oY(dQ)if not dQ.Parent or not dQ.Enabled then return false end pcall(function()dQ:InputHoldBegin()end)
af(math.max(dQ.HoldDuration,0)+0.08)pcall(function()dQ:InputHoldEnd()end)return true end local function aq(oZ,xZ)
local x0=y()while y()-x0<xZ do if oZ()then return true end af(0.05)end return oZ()end local function dR(cO,x1,o0,x2)
local x3=c.zapFirst and{"zap","hold"}or{"hold","zap"}for x4,jl in ipairs(x3)do if x4==2 and(x2 or not(cO.Parent and cO.Enabled and(not o0 or o0())))then break end
local jm if jl=="hold"then jm=oY(cO)else jm=type(fireproximityprompt)=="function"and cO.Parent~=nil and cO.Enabled and pcall(fireproximityprompt,cO)end
if jm and aq(x1,1.2)then c.zapFirst=(jl=="zap")return true,jl end end return false end local function o1(jn)local bA=nJ()
if not bA or not bA.Enabled then A("buy: nothing on the pad")return false end local jo=dy(bA)if not jo then A("buy: pad part missing")return false end
c.lastBuyAt=y()local x5,o2=V.seq,ba()local o3=ap()local x6=o3 and(o3 .HumanoidRootPart.Position-jo.Position).Magnitude>12
b8(jo,bA)if x6 then af(0.4)end if not bA.Enabled then A("buy aborted: pad emptied")return false end local cP=je()
if not jn and cP.state~="match"then A("buy aborted: "..(cP.text or"pad changed"))c.matchSince=nil return false
end local jp=cP.info and cP.info.name or(cP.state=="match"and V.name)or nil local function x7()return bA.Enabled and ac()==nil and(jn or je().state=="match")
end local x8,x9=dR(bA,function()return ac()~=nil or((not bA.Enabled)and(jn or V.seq==x5))end,x7,dN()~=nil)if x8 then
aq(function()return ac()~=nil end,0.8)local dS=ac()local o4=ba()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dS and ak(W(dS))or(cP.shown or"?"),(o2 and o4)and(" for $"..aL(o2-o4))or"",x9))
if dS and jp and W(dS)~=W(jp)then A(("note: picked up %s, not %s"):format(dS,jp))end return true end local f_=b3()
if dN()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aL(ba()),(f_ and f_.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(f_ and f_.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function o5()local dT=ac()if not dT then c.holding=false A("place: hands are empty")
return false end if not aK(dT)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dT))))return false end
for FJ=1,d.PlaceTries do local bB=wd()if not bB then A("place: no free station")break end local o6=dy(bB)if o6 then
b8(o6,bB)local o7=ac()if not o7 then c.holding=false A("place: hands emptied on the way")return false end if not aK(o7)then A("place: what I carry changed, not waxing it")return false end
if bB.Enabled then local x_,ya=dR(bB,function()return not bB.Enabled end,function()return bB.Enabled end)if x_ then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dT)),c.placed,bB.Parent.Parent.Name,ya))if o.placed then pcall(o.placed,dT)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))A(c.capMsg)end return false end function z.place()local yb=y()while c.alive and z.editing and y()-yb<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then z.placing=true local yc=y()while c.alive and z.current()~=d.TeamWax and y()-yc<5 do af(0.1)end
if z.current()==d.TeamWax then af(0.3)else A("wax team did not come on in time - placing anyway")end end local yd,o8=pcall(o5)
z.placing=false if not yd then error(o8,0)end return o8 end local function o9(o_)return type(o_)=="string"and o_:lower():find("crate",1,true)~=nil
end local ye={SABFarmGui=1,SABToggle=1,SABError=1}local function jq(yf)local bC=yf while bC do if ye[bC.Name]then return false end
if bC:IsA("ScreenGui")then local yg,yh=pcall(function()return bC.Enabled end)return(not yg)or yh~=false end if bC:IsA("GuiObject")and not bC.Visible then return false end
bC=bC.Parent end return false end local function ga(gb)local cQ=""pcall(function()if gb:IsA("TextButton")then cQ=gb.Text end end)
if not cQ:find("%a")then for FK,gc in ipairs(gb:GetDescendants())do if(gc:IsA("TextLabel")or gc:IsA("TextButton"))and gc.Text:find("%a")then cQ=gc.Text break end
end end if not cQ:find("%a")then cQ=gb.Name end return(cQ:lower():gsub("[^%a]",""))end local function yi()local dU,dV
local pa=J:FindFirstChildOfClass("PlayerGui")if not pa then return nil,nil end for FL,dW in ipairs(pa:GetDescendants())do
if dW:IsA("GuiButton")and jq(dW)then local jr=ga(dW)if jr:sub(1,4)=="open"and not jr:find("shop",1,true)then dU=dU or dW end
if jr:sub(1,7)=="discard"then dV=dV or dW end end end if dU and dV then return dU,dV end if e.on then return dU,dV end
return nil,nil end local js=(function()local yj,yk=pcall(function()return game:GetService("VirtualInputManager")end)return yj and yk or nil end)()
local function pb(bh,jt)local ju={}local function pc(yl)ju[#ju+1]=yl end if c.tapWay then pc(c.tapWay)end for FM,pd in ipairs({"touch","conn","signal"})do
if pd~=c.tapWay then pc(pd)end end local function pe(ym,...)local yn,jv=pcall(getconnections,ym)if not(yn and type(jv)=="table"and#jv>0)then return false end
local pf,yo,yp=false,{...},select("#",...)for FN,yq in ipairs(jv)do if pcall(function()yq:Fire(table.unpack(yo,1,yp))end)then pf=true end
end return pf end local function pg()local ph=Vector3 .new(0,0,0)pcall(function()local pj,pk=bh.AbsolutePosition,bh.AbsoluteSize
ph=Vector3 .new(pj.X+pk.X/2,pj.Y+pk.Y/2,0)end)local jw={Position=ph,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jw.UserInputType=Enum.UserInputType.Touch end)pcall(function()jw.UserInputState=Enum.UserInputState.End end)
return jw end for FO,bi in ipairs(ju)do local dX=false if bi=="conn"and type(getconnections)=="function"then if pe(bh.MouseButton1Click)then
dX=true if aq(jt,1.5)then c.tapWay=bi return true,bi end end dX=pe(bh.Activated,pg(),1)elseif bi=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bh.MouseButton1Click)then if aq(jt,1.5)then c.tapWay=bi return true,bi end end dX=pcall(firesignal,bh.Activated,pg(),1)
elseif bi=="touch"and js then dX=pcall(function()local pl,pm=bh.AbsolutePosition,bh.AbsoluteSize local pn=0 local po=bh:FindFirstAncestorWhichIsA("ScreenGui")
local yr,ys=pcall(function()return po and po.IgnoreGuiInset end)if not(yr and ys)then pcall(function()pn=game:GetService("GuiService"):GetGuiInset().Y end)
end local pp,pq=pl.X+pm.X/2,pl.Y+pm.Y/2+pn js:SendMouseButtonEvent(pp,pq,0,true,game,1)task.wait(0.06)js:SendMouseButtonEvent(pp,pq,0,false,game,1)
end)end if dX and aq(jt,1.5)then c.tapWay=bi return true,bi end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jx(ps)local dY=ps.Parent while dY and dY~=c.plot do if e.NOT[dY.Name]then return false end dY=dY.Parent
end local jy=(ps.ActionText or""):lower()if jy:find("roll",1,true)or jy:find("place",1,true)or jy:find("sell",1,true)then return false end
return true end local function pt()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local pu=c.plot:FindFirstChild("CrateStand")local dZ if pu then for FP,gd in ipairs(pu:GetDescendants())do
if gd:IsA("ProximityPrompt")and gd.Enabled and jx(gd)then dZ=gd break end end end if not dZ then for FQ,bD in ipairs(c.plot:GetDescendants())do
if bD:IsA("ProximityPrompt")and bD.Enabled and jx(bD)then local pv=bD:FindFirstAncestorWhichIsA("Model")local yt=((bD.ActionText or"").." "..(bD.ObjectText or"").." "..bD.Name.." "..(pv and pv.Name or"")):lower()
if yt:find("crate",1,true)then dZ=bD break end end end end e.prompt=dZ return dZ end local function jz()if e.on then return true end
local d0=pt()if not d0 then e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local pw=dy(d0)if pw then b8(pw,d0)end e.ours=true dR(d0,function()return e.on end)if aq(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: pressed "..fr(d0).." but no window came up")
return false end do local function yu(px)local cR=px.Parent while cR and cR:IsA("GuiObject")do local py,pz=false,false
for FR,d1 in ipairs(cR:GetDescendants())do if d1~=px and d1:IsA("GuiButton")and ga(d1):sub(1,7)=="discard"then py=true end
if d1:IsA("TextLabel")then local jA=d1 .Text:lower()if jA:find("crate",1,true)or jA:find("can contain",1,true)or jA:find("cost",1,true)then pz=true end
end if py and pz then return cR end end cR=cR.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local pA=J:FindFirstChildOfClass("PlayerGui")if not pA then return nil end for FS,ge in ipairs(pA:GetDescendants())do
if ge:IsA("GuiButton")and not ge:FindFirstAncestor("SABFarmGui")and ga(ge):sub(1,4)=="open"then local jB=yu(ge)
if jB then e.win=jB return jB end end end end local function yv(yw)for FT,gf in ipairs(yw:GetDescendants())do
if gf:IsA("GuiButton")then local pB,jC=ga(gf),gf.Name:lower()if pB=="x"or pB=="close"or jC=="x"or jC:find("close",1,true)or jC:find("exit",1,true)then return gf end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(yx)task.wait(yx and 4 or 1.2)if e.on or e.waiting then return end
local gg=e.findWin()if not gg or not jq(gg)then return end local pC=yv(gg)if pC and pb(pC,function()return not jq(gg)end)then return end
A("the crate window is still open - tap its X")end end local function d2(gh)if not jz()then return false end local pD=y()-(e.openedAt or 0)
if pD<0.6 then af(0.6-pD)end local jD=e.title local yy,yz=yi()local pE=gh and yy or yz if not pE then e.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(gh and"Open"or"Discard",jD))return false
end local yA=ac()local yB,FV=pb(pE,function()return(not e.on)or(ac()~=nil and ac()~=yA)end)if not yB then e.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(gh and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gh then c.crates=c.crates+1 aq(function()return ac()~=nil end,1.5)local pF=ac()
A(("OPENED %s -> %s"):format(jD,pF and ak(W(pF))or"?"))else A("discarded "..jD.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(yC,...)local yD=select("#",...)e.calls[#e.calls+1]={t=y(),m=yC,n=yD,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aE,bj)local bE=type(aE)if(bE=="string"or bE=="number")and type(bj.data)=="table"then for pG,jE in pairs(bj.data)do
if jE==aE and type(pG)=="string"and(type(jE)=="string"or type(jE)=="number")then return{__slot="f:"..pG}end end
end if bE=="string"then if bj.crate and aE==bj.crate then return{__slot="crate"}end if bj.title and aE==bj.title then return{__slot="title"}end
if bj.rar and aE==bj.rar then return{__slot="rarity"}end return aE end if bE=="number"or bE=="boolean"or bE=="nil"then return aE end
if bE=="table"then local pH={}for yE,pI in pairs(aE)do if type(pI)=="table"then return nil,"nested table"end local yF,pJ=e.slot(pI,bj)
if pJ then return nil,pJ end pH[yE]=yF end return pH end local yG,yH=pcall(function()return aE:IsA("Instance")end)
if yG and yH then if aE==J then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gi=c.plot and c.plot:FindFirstChild("CrateStand")if gi and aE==gi then return{__slot="stand"}end if gi and aE.Parent==gi then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bE..")"end function e.resolve(gj)if type(gj)~="table"then return gj end
local aS=gj.__slot if aS and aS:sub(1,2)=="f:"then return e.data and e.data[aS:sub(3)]end if aS=="crate"then return e.data and e.data.name end
if aS=="title"then return(e.data and e.data.title)or e.title end if aS=="rarity"then return e.data and e.data.rarity end
if aS=="player"then return J end if aS=="plot"then return c.plot end if aS=="stand"or aS=="model"then local jF=c.plot and c.plot:FindFirstChild("CrateStand")
if aS=="stand"or not jF then return jF end for FW,pK in ipairs(jF:GetChildren())do if o9(pK.Name)then return pK end end
return nil end local pL={}for yI,yJ in pairs(gj)do pL[yI]=e.resolve(yJ)end return pL end function e.classify(jG)
if e.directOff then return end local gk={}for FX,jH in ipairs(e.calls)do if jH.t<=jG+0.05 and jG-jH.t<=6 then gk[#gk+1]=jH end
end if#gk==0 then return end if not aq(function()return(e.heldAt or 0)>=jG-1 end,2.5)then return end local d3={}
for FY,d4 in ipairs(gk)do local pM={}for pN=1,d4 .n do local yK,pO=e.slot(d4 .args[pN],d4)if pO then A("crate call has "..pO.." - keeping the button method")
return end pM[pN]=yK end d3[#d3+1]={m=d4 .m,n=d4 .n,args=pM}end local jI=e.learned e.learned={seq=d3,mode=jI and jI.mode or nil}
aj.dirty=true if not jI then A(("learned how to open crates directly (%d call%s)"):format(#d3,#d3==1 and""or"s"))end
end function e.replay()local pP=e.learned local pQ=ah:FindFirstChild("Remotes")local jJ=pQ and pQ:FindFirstChild("CrateAction")
if not(pP and jJ)then return false end local pR=table.unpack or unpack e.replaying=true for FZ,d5 in ipairs(pP.seq)do
local jK={}for pS=1,d5 .n do jK[pS]=e.resolve(d5 .args[pS])end task.spawn(function()pcall(function()if d5 .m=="InvokeServer"then jJ:InvokeServer(pR(jK,1,d5 .n))
else jJ:FireServer(pR(jK,1,d5 .n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(yL)return(yL:gsub("[%%|;=,\n]",function(yM)return("%%%02X"):format(yM:byte())end))end
function e.enc(ca)local gl=type(ca)if gl=="string"then return"s"..e.esc(ca)end if gl=="number"then return"n"..tostring(ca)end
if gl=="boolean"then return ca and"b1"or"b0"end if gl=="nil"then return"z"end if ca.__slot then return"k"..ca.__slot end
local jL={}for yN,yO in pairs(ca)do jL[#jL+1]=e.enc(yN).."="..e.enc(yO)end return"t"..table.concat(jL,",")end
function e.dec(pT)local d6,d7=pT:sub(1,1),pT:sub(2)local function yP(yQ)return(yQ:gsub("%%(%x%x)",function(yR)return string.char(tonumber(yR,16))end))end
if d6=="s"then return yP(d7)end if d6=="n"then return tonumber(d7)end if d6=="b"then return d7=="1"end if d6=="k"then return{__slot=d7}end
if d6=="t"then local pU={}for yS in d7:gmatch("[^,]+")do local pV,yT=yS:match("^(.-)=(.*)$")if pV then local pW=e.dec(pV)
if pW~=nil then pU[pW]=e.dec(yT)end end end return pU end return nil end function e.goneOrNew(yU)return function()
if not e.waiting then return true end local pX=ac()return pX~=nil and pX~=yU end end function e.near()local pY=ah:FindFirstChild("Remotes")
local jM=pY and pY:FindFirstChild("CrateAction")local gm=ap()local jN=c.plot and c.plot:FindFirstChild("CrateStand")
local jO=jN and jN:FindFirstChild("Spot")if not(jM and gm and jO)then A(("crate: cannot open %s right now (%s)"):format(tostring(e.title),
not jM and"no CrateAction remote"or not gm and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jP=gm.HumanoidRootPart local gn=jP.CFrame local pZ,jQ=e.title,"no answer"local yV=ac()local p0=jN:FindFirstChild("Holder")
local function p1()if not p0 then return e.waiting or e.on end for F0,yW in ipairs(p0:GetChildren())do if yW:IsA("Model")then return true end end
return false end for yX=1,3 do if not(e.waiting or e.on)or not p1()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end if(jP.Position-jO.Position).Magnitude>8 then b8(jO,e.prompt)end af(0.12+0.15*yX)
local a5={}e.replaying=true task.spawn(function()a5 .ok,a5 .v=pcall(function()return jM:InvokeServer("open")end)
a5 .done=true end)aq(function()return a5 .done end,6)e.replaying=false local cb=a5 .v if a5 .done and a5 .ok and type(cb)=="table"and cb.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(pZ,cb.prize and ak(W(tostring(cb.prize)))or"?"))
aq(function()local p2=ac()return p2~=nil and p2~=yV end,1.5)if(jP.Position-gn.Position).Magnitude>8 then pcall(function()aD(gm,gn.Position,gn.Position+gn.LookVector)end)end
return true,"opened"end jQ=(a5 .done and a5 .ok and type(cb)=="table")and tostring(cb.reason or"refused, no reason given")
or(a5 .done and("error: "..tostring(cb))or"no answer in 6s")af(0.3)if not p1()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(pZ,jQ))
return false,jQ end e.GIVEUP=600 function e.drop()local p3=ah:FindFirstChild("Remotes")local p4=p3 and p3:FindFirstChild("CrateAction")
local p5=c.plot and c.plot:FindFirstChild("CrateStand")local jR=p5 and p5:FindFirstChild("Spot")local p6=ap()
if jR and p6 and(p6 .HumanoidRootPart.Position-jR.Position).Magnitude>8 then b8(jR,e.prompt)af(0.3)end local jS,bk=false,nil
if p4 then jS,bk=pcall(function()return p4:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(e.title),math.floor(e.GIVEUP/60),(jS and type(bk)=="table"and bk.ok)and"done"or("answer: "..tostring(type(bk)=="table"and(bk.reason or bk.ok)or bk))))
e.waiting,e.on,e.quietUntil=false,false,y()+4 e.summonFails,e.nearFails,e.lastFail,e.at,e.prompt=0,0,0,nil,nil
if not(jS and type(bk)=="table"and bk.ok)then d2(false)end end function e.smart()local jT=e.title if(e.nearFails or 0)<3 then
local yY=e.near()if yY then return true end if e.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local cc=e.learned if cc then local jU=ac()if e.on then e.replay()if aq(e.goneOrNew(jU),3.5)then c.crates=c.crates+1
A("OPENED "..jT.." (direct)")return true end else if cc.mode~="window"then e.replay()if aq(e.goneOrNew(jU),3.5)then
c.crates,e.fails=c.crates+1,0 if cc.mode~="direct"then cc.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..jT.." (direct, no window)")return true end end if jz()then e.replay()if aq(e.goneOrNew(jU),3.5)then
c.crates,e.fails=c.crates+1,0 if cc.mode~="window"then cc.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..jT.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,aj.dirty=cc,nil,true
if e.fails>=3 then e.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return d2(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for yZ,p7 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(p7):Connect(function()D.cache[yZ]=J:GetAttribute(p7)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(y0,...)local go=D.cache
local y1={m=y0,n=select("#",...),args={...},before={rules=go.rules,stop=go.stop,on=go.on,main=go.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,y1)end end)end function D.learnOne(d8)local ay,d9=D.snap(),d8 .before local gp=(ay.rules~=d9 .rules)or(ay.stop~=d9 .stop)
local p8=(ay.on~=d9 .on)or(ay.main~=d9 .main)if not gp and not p8 then return end local p9={}for p_=1,d8 .n do
local aM=d8 .args[p_]local cd=type(aM)if cd=="string"and aM~=""and aM==ay.rules then aM={__slot="rules"}elseif cd=="string"and aM~=""and gp and aM==ay.stop and ay.stop~=d9 .stop then aM={__slot="stop"}
elseif cd=="table"then local qa={}for y2,cS in pairs(aM)do if type(cS)=="table"or(type(cS)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end qa[y2]=(type(cS)=="string"and cS~=""and cS==ay.rules)and{__slot="rules"}or cS end aM=qa elseif cd~="string"and cd~="number"and cd~="boolean"and cd~="nil"then
if aM==J then aM={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end p9[p_]=aM
end local cT={m=d8 .m,n=d8 .n,args=p9}if gp then local jV=false for y3=1,cT.n do local d_=cT.args[y3]if type(d_)=="table"and d_.__slot=="rules"then jV=true end
if type(d_)=="table"and not d_.__slot then for F1,qb in pairs(d_)do if type(qb)=="table"and qb.__slot=="rules"then jV=true end end
end end if jV then D.rec.rules={cT}else table.insert(D.rec.rules,cT)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if p8 then if ay.on==true then D.rec.on=cT else D.rec.off=cT end d.AutoRoll=(ay.on==true)end if ay.rules and ay.rules~=""then d.ARrules,d.ARstop=ay.rules,ay.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gp and"choices"or(ay.on and"on"or"off")))end
function D.resolve(cU)if type(cU)~="table"then return cU end if cU.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cU.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cU.__slot=="player"then return J end
local qc={}for y4,y5 in pairs(cU)do qc[y4]=D.resolve(y5)end return qc end function D.replay(qe,y6)local qf=table.unpack or unpack
for F2,ea in ipairs(y6)do local jW={}for qg=1,ea.n do jW[qg]=D.resolve(ea.args[qg])end D.replaying=true pcall(function()
if ea.m=="InvokeServer"then task.spawn(function()pcall(function()qe:InvokeServer(qf(jW,1,ea.n))end)end)else qe:FireServer(qf(jW,1,ea.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(qh,y7)if D.busy or not c.alive then return end D.busy=true
pcall(function()local qi=ah:FindFirstChild("Remotes")local jX=qi and qi:FindFirstChild("AutoRollAction")if not jX then D.msg="this game has no AutoRollAction"return end
local bF=d.AutoRoll if bF and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(jX,D.rec.rules)
if aq(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bF==D.isOn()or(not bF and not y7)then return end
local gq=bF and D.rec.on or D.rec.off if not gq then local eb=bF and D.rec.off or D.rec.on local qj=eb~=nil for y8=1,eb and eb.n or 0 do
if type(eb.args[y8])=="boolean"then qj=false end end if qj then gq=eb end end if not gq then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bF and"on"or"off")
A(D.msg)return end D.replay(jX,{gq})if aq(function()return D.isOn()==bF end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bF and"ON"or"OFF",qh and(" ("..qh..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local y9,y_=pcall(function()return J.UserId end)return y9 and y_ or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local za,jY=pcall(function()return require(ah:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if za and type(jY)=="table"and type(jY.Pets)=="table"then q.I=jY end return q.I end function q.order()if q.list then return q.list end
local bG=q.info()if not bG then return{}end local ce={}if type(bG.Order)=="table"and#bG.Order>0 then for F3,qk in ipairs(bG.Order)do if bG.Pets[qk]then ce[#ce+1]=qk end end
else for zb in pairs(bG.Pets)do ce[#ce+1]=zb end table.sort(ce,function(zc,zd)return(bG.Pets[zc].price or 0)<(bG.Pets[zd].price or 0)end)
end q.list=ce return ce end function q.nice(ql,jZ)local qm=q.info()local qo=qm and qm.Pets[ql]return((jZ and jZ~="")and(jZ.." ")or"")..(qo and qo.displayName or tostring(ql))
end function q.data()local gr=J:GetAttribute("PetsData")if type(gr)~="string"then return nil end if gr==q.rawD then return q.lastD end
local ze,ec=pcall(function()return q.HS:JSONDecode(gr)end)ec=(ze and type(ec)=="table")and ec or nil q.rawD,q.lastD=gr,ec
return ec end function q.pen()return ah:FindFirstChild("PetMeadowSpawns")end function q.srv()return ao:GetServerTimeNow()end
function q.money()local j0=J:FindFirstChild("MoneyValue")if j0 and type(j0 .Value)=="number"then return j0 .Value end
return ba()or 0 end function q.wishes()local qp=q.pen()local qq=qp and qp:GetAttribute("Wishes")local j1,qr={},q.srv()
if type(qq)~="string"then return j1 end local zf,qs=pcall(function()return q.HS:JSONDecode(qq)end)if zf and type(qs)=="table"then
for zg,j2 in pairs(qs)do if type(j2)=="number"and j2>qr then j1[zg]=j2-qr end end end return j1 end function q.call(...)
local qt=ah:FindFirstChild("Remotes")local qu=qt and qt:FindFirstChild("PetRequest")if not qu then return nil end
local qv=table.pack(...)local cf={}task.spawn(function()cf.ok,cf.v=pcall(function()return qu:InvokeServer(table.unpack(qv,1,qv.n))end)
cf.done=true end)local zh=y()while not cf.done and y()-zh<6 do task.wait(0.05)end if cf.done and cf.ok then return cf.v end
return nil end function q.want(zi)return d.Pets[zi]end function q.closeNaming(j3)local qx=pcall(function()local qw=J:FindFirstChild("PlayerScripts")
local zj=qw and qw:FindFirstChild("Naming",true)require(zj).close()end)af(0.5)if j3 .Visible then pcall(function()local qy=j3:FindFirstChild("NameBox",true)if qy then qy:ReleaseFocus()end end)
j3 .Visible=false qx=false end return qx end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qz=J:FindFirstChildOfClass("PlayerGui")
local qA=qz and qz:FindFirstChild("MainGui")local gs=qA and qA:FindFirstChild("PetNameGui")if gs and gs.Visible then
af(0.4)if gs.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gs)break end end af(0.25)end
q.namingOn=false end)end function q.buyTick()if not d.PetBuy then q.buyMsg="auto adopt is off"return end local j4,qB,gt=q.info(),q.pen(),q.data()
if not(j4 and qB and gt)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local ed,j5=#(gt.pets or{}),tonumber(gt.maxOwned)or 60
local zk,qC,ee=q.srv(),{},nil for F4,aT in ipairs(qB:GetChildren())do qC[aT.Name]=true local cg,gu=aT:GetAttribute("Pet"),aT:GetAttribute("Variant")or""
local j6=cg and q.want(cg)if j6 and j6 .b and j4 .Pets[cg]and(not j6 .g or gu=="Big")and C.wantMore(cg,gu,gt)and not aT:GetAttribute("A_"..q.uid)
and(tonumber(aT:GetAttribute("ExpiresAt"))or 0)>zk+1 and y()>=(q.tryAt[aT.Name]or 0)then local ef,qD=q.nice(cg,gu),j4 .Pets[cg].price or 0
if ed>=j5 then ee=("%s is in the pen, but you have %d/%d pets"):format(ef,ed,j5)q.tryAt[aT.Name]=y()+15 elseif q.money()<qD then
ee=("%s is in the pen - need $%s"):format(ef,aL(qD))q.tryAt[aT.Name]=y()+5 else q.tryAt[aT.Name]=y()+8 local bH=q.call("adopt",aT.Name)
if type(bH)=="table"and bH.ok then ed=ed+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local zl=type(bH.pet)=="table"and bH.pet or{}
table.insert(q.recent,{id=tostring(zl.id or("?"..y())),name=cg,variant=gu,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..ef)q.skipNaming()ee="adopted "..ef else local qE=type(bH)=="table"and tostring(bH.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(ef,qE))ee="adopt failed: "..qE if type(bH)=="table"and bH.bagFull then q.tryAt[aT.Name]=y()+60 end
end end end end for qF in pairs(q.tryAt)do if not qC[qF]then q.tryAt[qF]=nil end end q.buyMsg=ee or("watching the pen (%d/%d pets)"):format(ed,j5)
end function q.wishTick()if not d.PetWish then q.wishMsg="auto wish is off"return end local gv=q.info()if not(gv and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local cj,j7,bI=q.wishes(),0,nil local zm=(type(gv.Wish)=="table"and gv.Wish.cashShare)or 2
local zn=q.data()for F5,aA in ipairs(q.order())do local qG=q.want(aA)if qG and qG.w and C.wantMore(aA,"",zn)then
j7=j7+1 if not cj[aA]and y()>=(q.wishTry[aA]or 0)then local j8=tonumber(J:GetAttribute("PetWishCredits"))or 0
local j9=math.floor((gv.Pets[aA].price or 0)*zm)if j8<=0 and q.money()<j9 then q.wishTry[aA]=y()+10 bI=("need $%s to wish for %s"):format(aL(j9),q.nice(aA))
q.wishWhy[aA]=bI else q.wishTry[aA]=y()+3 local zo=j8>0 and"wishCredit"or"wish"local gw=q.call(zo,aA)if type(gw)=="table"and gw.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),j8>0 and"free wish"or("$"..aL(j9))))
else local j_=type(gw)=="table"and tostring(gw.reason or"no reason given")or"no answer"if j_:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),j_))bI="wish failed: "..j_ end end end end end end if not bI then
for F6,gx in ipairs(q.order())do local qH=q.want(gx)if qH and qH.w and not cj[gx]and q.wishWhy[gx]then bI=q.wishWhy[gx]break end
end end if not bI then local cV={}for F7,gy in ipairs(q.order())do local qI=q.want(gy)if qI and qI.w and cj[gy]then cV[#cV+1]=("%s %dm"):format(q.nice(gy),math.ceil(cj[gy]/60))end
end local gz for F8,gA in ipairs(q.order())do local qJ=q.want(gA)if qJ and qJ.w and cj[gA]and(not gz or cj[gA]<gz)then gz=cj[gA]end
end bI=j7==0 and"no pet has WISH ticked"or(#cV==0 and"running: none yet")or(#cV<=3 and("running: "..table.concat(cV,", ")))
or("%d running, the next one ends in %dm"):format(#cV,math.ceil((gz or 0)/60))end q.wishMsg=bI end z.switches,z.glazed,z.finished=0,0,0
z.done,z.doneN,z.later={},0,{}function z.teams()local ka=q.data()return(ka and ka.teams)or{},ka end function z.current(cW)
cW=cW or q.data()if not cW then return""end local qK={}for F9,zp in ipairs(cW.equipped or{})do qK[tostring(zp)]=true end
for F_,qL in ipairs(cW.teams or{})do local qM=qL.pets or{}local kb=#qM==#(cW.equipped or{})if kb then for Ga,zq in ipairs(qM)do if not qK[tostring(zq)]then kb=false break end end end
if kb then return qL.name end end return""end function z.equip(kc)local zr,zs=z.teams()local kd for zt,zu in ipairs(zr)do if zu.name==kc then kd=zt break end end
if not kd then z.msg="no saved team called "..tostring(kc)return false end if z.current(zs)==kc then return true end
for Gb=1,4 do local qN=q.call("teamEquip",kd)if type(qN)=="table"and qN.ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(zv)local qO=zv:FindFirstChild("SquishyPlaceHolder")local qP=qO and qO:FindFirstChild("TimerGui")
local qQ=qP and qP:FindFirstChildWhichIsA("TextLabel",true)local ke=qQ and qQ.Text if type(ke)~="string"or ke:find("-",1,true)then return nil end
local kf,qR,qS=ke:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not kf then return nil end local qT=qS~=""and(tonumber(kf)*3600+tonumber(qR)*60+tonumber(qS))or(tonumber(kf)*60+tonumber(qR))
return qT>0 and qT or nil end function z.waxes()local eg={}local qU=c.plot and c.plot:FindFirstChild("WaxStations")
if not qU then return eg end local qV=q.srv()for Gc,a6 in ipairs(qU:GetChildren())do local kg=tonumber(a6:GetAttribute("PourEnd"))
local qW=a6:GetAttribute("PourOwner")if a6:GetAttribute("HasSquishy")and a6:GetAttribute("PourId")and(qW==nil or qW==q.uid)then
local kh=z.left(a6)local qX=kh and(qV+kh)or((kg and kg>qV)and kg or nil)if qX then local qY,qZ=a6:FindFirstChild("SquishyPlaceHolder"),"?"
if qY then for Gd,q0 in ipairs(qY:GetChildren())do if q0:IsA("Model")then qZ=q0 .Name break end end end local zw=tostring(a6:GetAttribute("Helpers")or"")
local ki=0 for Ge in zw:gmatch("%d+")do ki=ki+1 end eg[#eg+1]={st=a6,ends=qX,sure=kh~=nil,id=a6:GetAttribute("PourId"),name=qZ,helps=ki,
long=a6:GetAttribute("PourLong")==true}end end end table.sort(eg,function(zx,zy)return zx.ends<zy.ends end)return eg
end function z.glazeCount()local q1=ah:FindFirstChild("Remotes")local q2=q1 and q1:FindFirstChild("EditStack")
if not q2 then return nil end local zz,eh=pcall(function()return q2:InvokeServer("State",nil)end)if not(zz and type(eh)=="table"and type(eh.state)=="table")then return nil end
local kj,kk=0,{}for Gf,gB in ipairs(eh.state.entries or{})do if gB.glaze and gB.glaze~=""then kj=kj+1 kk[gB.glaze]=(kk[gB.glaze]or 0)+1 end
end return kj,kk,#(eh.state.entries or{}),eh.state.capacity end function z.finishedOne(gC,q3)z.finished=z.finished+1
task.wait(2)local kl,zA,q4,zB=z.glazeCount()if kl and q3 and kl>q3 then z.glazed=z.glazed+1 local km={}for zC,zD in pairs(zA)do km[#km+1]=zC.." "..zD end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gC.name)),gC.st.Name,kl,table.concat(km,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gC.st.Name,ak(W(gC.name)),q4 and(" (stack "..q4 .."/"..tostring(zB)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not d.Teams then z.want,z.msg="","auto teams is off"return end
local ck=q.srv()local aF=z.glazeFor if aF then local ei=aF.st local q5=ei.Parent and ei:GetAttribute("HasSquishy")and ei:GetAttribute("PourId")==aF.id
local q6=q5 and z.left(ei)if q6 then aF.ends=ck+q6 end if not q5 then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local zE=aF.before
task.spawn(function()pcall(z.finishedOne,aF,zE)end)end elseif aF.ends-ck>d.GlazeLead*3+60 or ck>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(ei.Name,z.clock(aF.ends-ck)))
end end if d.TeamGlaze~=""and not z.glazeFor then local zF=z.speedRatio(d.TeamGlaze)for Gg,cl in ipairs(z.list)do
if cl.sure and(cl.ends-ck)*zF[cl.long and 2 or 1]<=d.GlazeLead and y()>=(z.later[cl.id or"?"]or 0)and not z.done[cl.id or"?"]then
z.glazeFor=cl task.spawn(function()cl.before=z.glazeCount()end)break end end end local aG,ej="",""local cX=d.SnapGlaze~=false and o.snapAt and(o.snapAt-ck)
if cX and cX<-8 then o.snapAt,cX=nil,nil end if d.TeamGlaze~=""and cX and cX<=20 then aG,ej=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cX)))
elseif d.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ej=d.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ej=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and z.allBusy()then
aG,ej=d.TeamFull," - every station is busy"else aG=d.TeamNormal end z.want=aG local ek=z.current()z.cur=ek if aG~=""and ek~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ej)else z.nextTry=y()+3 end end local kn=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(ek~=""and ek or"(not a saved team)",(aG~=""and aG~=ek)and(" -> "..aG)or"",
kn and("in "..z.clock(kn.ends-ck).." (st "..kn.st.Name..")")or"- none running")end function z.clock(bJ)bJ=math.max(0,math.floor(bJ))
if bJ>=3600 then return("%d:%02d:%02d"):format(math.floor(bJ/3600),math.floor((bJ%3600)/60),bJ%60)end return("%d:%02d"):format(math.floor(bJ/60),bJ%60)
end function z.allBusy()local zG,zH=ft()return zH>0 and zG==0 end function z.aboutToPlace()if not c.running then return false end
local q7=ac()if not(q7 and aK(q7))then return false end local zI=ft()return zI>0 end function z.mult(q8,zJ,q9)return{(1+q8)*(1+q9),(1+q8+zJ)*(1+q9)}end
function z.speedNow()local function ko(zK)return tonumber(J:GetAttribute(zK))or 0 end return z.mult(ko("PetWaxSpeed"),ko("PetLongWax"),ko("PetSocialWax"))
end function z.speedOf(zL)local zM,q_=z.teams()if not q_ then return nil end for Gh,ra in ipairs(zM)do if ra.name==zL then
local kp={}for Gi,zN in ipairs(ra.pets or{})do for Gj,rb in ipairs(q_.pets or{})do if tostring(rb.id)==tostring(zN)then kp[#kp+1]=rb break end end
end local rc=C.caps()local rd,zO=C.stats(kp)return z.mult(math.min(rd.waxSpeed or 0,rc.waxSpeed or 0.25),math.min(rd.longWax or 0,rc.longWax or 0.3),zO.socialWax or 0)
end end return nil end function z.speedRatio(zP)local rf,kq=z.speedNow(),z.speedOf(zP)if not kq then return{1,1}end
return{rf[1]/kq[1],rf[2]/kq[2]}end function z.glazeSoon()return d.Teams and d.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local kr=q.info()return(kr and type(kr.Caps)=="table")and kr.Caps or C.CAPS
end function C.value(rg,ks)local gD=q.info()local cY=gD and gD.Pets[rg]if not(cY and type(cY.boost)=="table")then return nil end
local cm if type(gD.boostValue)=="function"then local zQ,zR=pcall(gD.boostValue,rg,(ks~=""and ks)or nil)cm=zQ and tonumber(zR)or nil
end if not cm then cm=cY.boost.value or 0 if ks=="Big"then local rh=cm*1.5 cm=C.ROUND[cY.boost.kind]and math.max(cm+1,math.floor(rh+0.5))or rh
end end return cY.boost.kind,cm,cY.boost.every end function C.stats(zS)local cn,kt={},{}for Gk,ri in ipairs(zS)do
local aU,gE,rj=C.value(ri.name,ri.variant or"")if aU then if aU:sub(1,6)=="social"then kt[aU]=math.max(kt[aU]or 0,gE)
elseif aU=="waxStir"or aU=="cashGift"then cn[aU]=(cn[aU]or 0)+gE*60/(rj or 60)elseif aU=="luckyPull"then cn.luckyPull=(cn.luckyPull or 0)+gE/(rj or 10)
else cn[aU]=(cn[aU]or 0)+gE end end end return cn,kt end function C.glazeGain(zT,gF)local el,ku,Gl={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local zU=el[1]+el[2]+el[3]local zV=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cZ={}for gG=1,3 do cZ[gG]=el[gG]+zT*el[gG]/zU+(gG==1 and zV or 0)end
local kv={cZ[1]*(1-gF),cZ[2]*(1-gF)+cZ[1]*gF,cZ[3]+cZ[2]*gF}return kv[1]*(ku[1]-1)+kv[2]*(ku[2]-1)+kv[3]*(ku[3]-1)
end function C.score(gH,zW)local kw=C.caps()local gI,gJ=C.stats(zW)local function bl(rk)return math.min(gI[rk]or 0,kw[rk]or math.huge)end
local zX=(1+bl("income"))*(1+(gJ.socialIncome or 0))*(1+math.min(gI.cashGift or 0,kw.cashGiftPerMinute or 9)/60)
local zY=1+bl("luck")+(gI.luckyPull or 0)+(gJ.socialLuck or 0)local rl=zY*(1+bl("newFind"))*(1+bl("rollSpeed"))
local em=math.log(zX)local zZ=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local kx=(1+bl("waxSpeed")+bl("longWax"))*(1+(gJ.socialWax or 0))
+math.min(gI.waxStir or 0,kw.waxStirPerMinute or 30)/60/zZ local z0=1-(1-bl("headStart"))*(1-(gJ.socialHeadStart or 0))
if gH=="farm"then return em+0.7*math.log(rl)+0.1*math.log(kx)end if gH=="full"then return em+0.4*math.log(kx)+0.02*math.log(rl)end
if gH=="glaze"then return C.glazeGain(bl("glaze"),bl("glazeUp"))+0.001*em end if gH=="wax"then return-math.log(1-0.5*z0)+0.001*em+0.001*math.log(kx)end
return em end function C.best(rm,c0,z1,ky)ky=ky or{}local az,en={},{}local function rn(z2)local ro={}for z3,z4 in ipairs(z2)do ro[z3]=c0[z4]end return ro end
local function kz(rp)local kA=C.score(rm,rn(rp))for Gm,z5 in ipairs(rp)do if ky[c0[z5].id]then kA=kA+1e-7 end end
return kA end for Gn=1,math.min(z1,#c0)do local gK,kB for kC=1,#c0 do if not en[kC]then az[#az+1]=kC local rq=kz(az)
az[#az]=nil if not kB or rq>kB+1e-12 then gK,kB=kC,rq end end end if not gK then break end en[gK]=true az[#az+1]=gK
end for Go=1,6 do task.wait()local rr,rs=false,kz(az)for kD=1,#az do for kE=1,#c0 do if not en[kE]then local rt=az[kD]
az[kD]=kE local ru=kz(az)if ru>rs+1e-9 then en[rt],en[kE],rs,rr=nil,true,ru,true else az[kD]=rt end end end end
if not rr then break end end local rv={}for z6,z7 in ipairs(az)do rv[z6]=tostring(c0[z7].id)end return rv,C.score(rm,rn(az))
end function C.count(rw,rx,z8)local eo,ep={},0 local ry,rz={},{}for Gp,z9 in ipairs(rx.arriving or{})do ry[tostring(z9)]=true end
for Gq,c1 in ipairs(rx.pets or{})do rz[tostring(c1 .id)]=true if c1 .name==rw and not ry[tostring(c1 .id)]then
if c1 .variant=="Big"then ep=ep+1 elseif(c1 .variant or"")==""then eo[#eo+1]=c1 end end end if not z8 then for Gr,eq in ipairs(q.recent or{})do
if eq.name==rw and not rz[eq.id]and y()-eq.at<20 then if eq.variant=="Big"then ep=ep+1 else eo[#eo+1]=eq end end
end end return eo,ep end function C.goal(z_)local rA=d.Pets[z_]return rA and tonumber(rA.f)or 0 end function C.wantMore(rB,Aa,rC)
local kF=C.goal(rB)if kF<=0 or not rC then return true end local Ab,rD=C.count(rB,rC)if rD>=kF then return false end
if Aa=="Big"then return true end return#Ab<C.need()*(kF-rD)end function C.status(rE,rF)local gL=C.goal(rE)if gL<=0 or not rF then return nil end
local Ac,kG=C.count(rE,rF)if kG>=gL then return("Big %d/%d done"):format(kG,gL)end return("%d/%d to fuse, Big %d/%d"):format(math.min(#Ac,C.need()),C.need(),kG,gL)
end function C.wear(kH)local kI={}for Gs,Ad in ipairs(kH)do kI[tostring(Ad)]=true end for Gt=1,3 do local c2=q.data()
if not c2 then return false end for Gu,rG in ipairs(c2 .equipped or{})do if not kI[tostring(rG)]then q.call("unequip",rG)task.wait(0.3)end
end c2=q.data()local rH={}for Gv,Ae in ipairs(c2 .equipped or{})do rH[tostring(Ae)]=true end for Gw,rI in ipairs(kH)do
if not rH[tostring(rI)]then q.call("equip",rI)task.wait(0.3)end end task.wait(0.4)c2=q.data()local kJ,rJ=0,true
for Gx,Af in ipairs(c2 .equipped or{})do kJ=kJ+1 if not kI[tostring(Af)]then rJ=false end end if rJ and kJ==#kH then return true end
end return false end function C.saveTeam(rK,rL)if not C.wear(rL)then return false,"could not put the pets on"end
local Ag=z.teams()local co for Ah,Ai in ipairs(Ag)do if Ai.name==rK then co=Ah break end end local c3 if co then
c3=q.call("teamSave",co)else c3=q.call("teamNew")if type(c3)=="table"and c3 .ok and c3 .index then co=c3 .index
task.wait(0.3)q.call("teamRename",{index=co,name=rK})end end task.wait(0.4)local kK=q.data()local rM=kK and kK.teams and co and kK.teams[co]
if not rM then return false,"the game did not save it"end local rN={}for Gy,Aj in ipairs(rM.pets or{})do rN[tostring(Aj)]=true end
for Gz,Ak in ipairs(rL)do if not rN[tostring(Ak)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local Al=q.srv()for GA,Am in ipairs(z.list or{})do if Am.ends-Al<(d.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local er=q.data()if not er then return{}end local rO={}for GB,An in ipairs(er.arriving or{})do rO[tostring(An)]=true end
local es={}for GC,gM in ipairs(er.pets or{})do if not rO[tostring(gM.id)]then es[#es+1]={id=tostring(gM.id),name=gM.name,variant=gM.variant or""}end
end local rP={}for GD,rQ in ipairs(es)do rP[rQ.id]=rQ end local rR=tonumber(er.slots)or 3 local kL,rS={},{}for GE,gN in ipairs(C.ROLES)do
local et=d[gN[1]]if et~=""and not rS[et]then rS[et]=true local kM,eu,rT={},{},false for GF,rU in ipairs(er.teams or{})do
if rU.name==et then for GG,Ao in ipairs(rU.pets or{})do local kN=rP[tostring(Ao)]if kN then kM[kN.id]=true eu[#eu+1]=kN else rT=true end
end end end local kO,rV=C.best(gN[2],es,rR,kM)local rW=C.score(gN[2],eu)local rX=#kO==#eu for GH,Ap in ipairs(kO)do if not kM[Ap]then rX=false end end
if not rX and(rT or#eu<math.min(rR,#es)or rV>rW+1e-4)then kL[#kL+1]={team=et,role=gN[2],ids=kO,gain=rV-rW}end
end end return kL end function C.rebuild(Aq)local rY=C.plan()if#rY==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gO=true local Au,Av=pcall(function()for GI,ev in ipairs(rY)do local Ar,As=C.saveTeam(ev.team,ev.ids)local rZ=q.data()
local kP={}for GJ,At in ipairs(ev.ids)do for GK,kQ in ipairs(rZ and rZ.pets or{})do if tostring(kQ.id)==At then kP[#kP+1]=q.nice(kQ.name,kQ.variant)end
end end if Ar then A(("TEAM %s rebuilt (%s): %s"):format(ev.team,Aq or"pets changed",table.concat(kP,", ")))else gO=false A(("TEAM %s: %s"):format(ev.team,tostring(As)))end
end end)z.editing,z.nextTry=false,0 if not Au then gO=false A("TEAM BUILD ERR "..tostring(Av))end C.builds=C.builds+1
C.buildMsg=gO and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gO end
function C.fuseTick()if not d.AutoFuse or z.editing then return end local gP=q.data()if not gP then return end
local kR=C.need()local kS,gQ={},{}for GL,Aw in ipairs(gP.teams or{})do for GM,Ax in ipairs(Aw.pets or{})do kS[tostring(Ax)]=true end end
for GN,Ay in ipairs(gP.equipped or{})do gQ[tostring(Ay)]=true end C.failUntil=C.failUntil or{}for cp,Az in pairs(d.Pets)do
local r0=tonumber(Az.f)or 0 local kT,AA=C.count(cp,gP,true)if r0>0 and AA<r0 and#kT>=kR and y()>=(C.failUntil[cp]or 0)then
table.sort(kT,function(gR,gS)local r1=(gQ[tostring(gR.id)]and 4 or 0)+(kS[tostring(gR.id)]and 2 or 0)+(gR.named and 1 or 0)
local r2=(gQ[tostring(gS.id)]and 4 or 0)+(kS[tostring(gS.id)]and 2 or 0)+(gS.named and 1 or 0)if r1~=r2 then return r1<r2 end
return tostring(gR.id)<tostring(gS.id)end)local gT,kU={},{}for gU=1,kR do gT[gU]=tostring(kT[gU].id)if gQ[gT[gU]]then kU[#kU+1]=gT[gU]end
end z.editing,z.editingSince=true,y()for GO,AB in ipairs(kU)do q.call("unequip",AB)task.wait(0.3)end local gV=q.call("fuse",{ids=gT})
z.editing,z.nextTry=false,0 if type(gV)=="table"and gV.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(kR,q.nice(cp),q.nice(cp)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(cp),os.date("%H:%M"))else C.failUntil[cp]=y()+120 A(("fuse %s failed: %s"):format(q.nice(cp),type(gV)=="table"and tostring(gV.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not d.AutoBuild or not d.Teams then return end local r3=q.data()
if not r3 then return end local cq={}for GP,AC in ipairs(r3 .pets or{})do cq[#cq+1]=tostring(AC.id)end table.sort(cq)
cq=table.concat(cq,",")if cq~=C.sig then C.sig,C.dirtyAt=cq,y()end local AD=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if AD and not z.editing then local AE=C.rebuild(C.dirtyAt and"pets changed"or"check")if AE then C.dirtyAt,C.lastBuild=nil,y()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(cr)return cr:IsA("ParticleEmitter")or cr:IsA("Trail")or cr:IsA("Beam")or cr:IsA("Fire")or cr:IsA("Smoke")
or cr:IsA("Sparkles")or cr:IsA("Light")end function j.muteOne(aH)if not d.Lite or not aH.Parent then return end
local gW=(aH:IsA("BillboardGui")and j.bb)or(j.isFx(aH)and j.fx)or nil if not gW or gW[aH]~=nil then return end
gW[aH]=aH.Enabled if aH.Enabled then aH.Enabled=false end j.watch[aH]=aH:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aH.Enabled then gW[aH]=true aH.Enabled=false end end)end function j.lite(r4)d.Lite=r4 if r4 then
task.spawn(function()for AF,AG in ipairs(ao:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,AG)
if AF%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=T(ao.DescendantAdded:Connect(function(kV)
if d.Lite and(kV:IsA("BillboardGui")or j.isFx(kV))then j.queue[#j.queue+1]=kV end end))end local kW=game:GetService("Lighting")
for GQ,ew in ipairs(kW:GetChildren())do if ew:IsA("PostEffect")and ew.Enabled and j.post[ew]==nil then j.post[ew]=true ew.Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and kW.GlobalShadows or j.oldShadows kW.GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and ao.Terrain.Decoration or j.oldDeco ao.Terrain.Decoration=false end)
task.spawn(j.extras,true)else j.extras(false)for GR,AH in pairs(j.watch)do pcall(function()AH:Disconnect()end)end
for r5,AI in pairs(j.bb)do pcall(function()if r5 .Parent then r5 .Enabled=AI end end)end for r6,AJ in pairs(j.fx)do pcall(function()if r6 .Parent then r6 .Enabled=AJ end end)end
for r7 in pairs(j.post)do pcall(function()if r7 .Parent then r7 .Enabled=true end end)end j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}local AK=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()AK.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()ao.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end function j.fxPatch(r8)
local AL,kX=pcall(function()return require(ah:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not AL or type(kX)~="table"then return end if r8 and not j.ceOld then j.ceOld={}for GS,r9 in ipairs({"Fireworks","Confetti"})do
local gX=kX[r9]if type(gX)=="table"and type(gX.Play)=="function"then j.ceOld[r9]=gX.Play pcall(function()gX.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not r8 and j.ceOld then for AM,AN in pairs(j.ceOld)do pcall(function()kX[AM].Play=AN end)end j.ceOld=nil
end end function j.topsFind()if j.tc then return j.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local kY,gY for GT,ex in ipairs(getgc(false))do if type(ex)=="function"and(type(islclosure)~="function"or islclosure(ex))then
local AO,r_,sa=pcall(debug.info,ex,"sn")if AO and type(r_)=="string"and r_:find("ToppingCullHandler",1,true)then
if sa=="poll"then kY=ex elseif sa=="retarget"then gY=ex end end end end if not(kY and gY)then return nil end local AP,gZ=pcall(debug.getupvalues,gY)
local sb=AP and type(gZ)=="table"and gZ[3]if type(sb)~="function"or debug.info(sb,"n")~="targetFor"or(gZ[1]~=nil and type(gZ[1])~="number")then return nil end
j.tc={poll=kY,re=gY}return j.tc end function j.tops(sc)local aN=j.topsFind()if not aN then return false end if sc and not aN.old then
local AQ,AS=pcall(hookfunction,aN.poll,function()end)if not AQ then return false end aN.old=AS pcall(debug.setupvalue,aN.re,1,-1000)
pcall(aN.re)elseif not sc and aN.old then local AT=type(restorefunction)=="function"and pcall(restorefunction,aN.poll)
if not AT then pcall(hookfunction,aN.poll,aN.old)end aN.old=nil pcall(aN.poll)end return true end j.lit,j.boardsOff={},{}
function j.lights(AU)local sd=ao:FindFirstChild("Plots")if AU then for GU,AV in ipairs(sd and sd:GetChildren()or{})do
local se=AV:FindFirstChild("SkinProps")local sf=se and se:FindFirstChild("FairyLights")for GV,sh in ipairs(sf and sf:GetChildren()or{})do
for GW,ey in ipairs(sh:GetChildren())do if ey:IsA("BasePart")and(ey.Name=="Bulb"or ey.Name=="Wire")then j.lit[ey]=sh ey.Parent=nil end
end end end for GX,AW in ipairs({"Leaderboards","ClanBoard"})do local sj=ao:FindFirstChild(AW)for GY,g0 in ipairs(sj and sj:GetDescendants()or{})do
if g0:IsA("SurfaceGui")and g0 .Enabled then j.boardsOff[g0]=true g0 .Enabled=false end end end else for AX,sk in pairs(j.lit)do pcall(function()if sk.Parent then AX.Parent=sk end end)end
for sl in pairs(j.boardsOff)do pcall(function()if sl.Parent then sl.Enabled=true end end)end j.lit,j.boardsOff={},{}
end end function j.extras(kZ)pcall(j.fxPatch,kZ)pcall(j.tops,kZ)pcall(j.lights,kZ)end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(sm)d.HideHud=sm local k0=J:FindFirstChildOfClass("PlayerGui")if not k0 then return end if sm then
for GZ,ez in ipairs(k0:GetChildren())do if ez:IsA("ScreenGui")and not j.MINE[ez.Name]and ez.Enabled then j.hud[ez]=true ez.Enabled=false end
end if not j.hudConn then j.hudConn=T(k0 .ChildAdded:Connect(function(eA)if d.HideHud and eA:IsA("ScreenGui")and not j.MINE[eA.Name]then
task.defer(function()if d.HideHud and eA.Enabled then j.hud[eA]=true eA.Enabled=false end end)end end))end else
for sn in pairs(j.hud)do pcall(function()if sn.Parent then sn.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(k1)d.FpsCap=k1 local so=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not so then return false end return pcall(so,k1==0 and 60 or k1)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(an)if an:IsA("BasePart")or an:IsA("Decal")or an:IsA("Texture")then if an.Transparency<1 then j.unseen[an]=an.Transparency an.Transparency=1 end
elseif an:IsA("BillboardGui")or an:IsA("SurfaceGui")or an:IsA("ParticleEmitter")or an:IsA("Beam")or an:IsA("Trail")or an:IsA("Light")or an:IsA("Fire")or an:IsA("Smoke")or an:IsA("Sparkles")then
if an.Enabled then j.unseen[an]=true an.Enabled=false end end end function j.notMine(AY)return d.HideMine or(c.plot and not AY:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(sp)if d.HideBases then j.bases(false)end d.HideMine=sp==2 if sp>0 then j.bases(true)end end
function j.bases(sq)d.HideBases=sq local k2=ao:FindFirstChild("Plots")if not k2 then return end if sq then task.spawn(function()
local k3=0 for G0,sr in ipairs(k2:GetChildren())do if sr~=c.plot or d.HideMine then for G1,AZ in ipairs(sr:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,AZ)k3=k3+1 if k3%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=T(k2 .DescendantAdded:Connect(function(ss)if d.HideBases and j.notMine(ss)then task.defer(function()pcall(j.hideOne,ss)end)end
end))end else for k4,su in pairs(j.unseen)do pcall(function()if not k4 .Parent then return end if type(su)=="number"then k4 .Transparency=su else k4 .Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(sv)d.NoRender=sv pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not sv)end)
end j.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
j.calmed={}function j.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local A0=game:GetService("RunService")
local k5=0 for G2,A1 in ipairs({"RenderStepped","Heartbeat","Stepped"})do local A2,sx=pcall(function()return A0[A1]end)
local sy,k6=false,nil if A2 and sx then sy,k6=pcall(getconnections,sx)end if sy and type(k6)=="table"then for G3,k7 in ipairs(k6)do
local k8=""pcall(function()local sz=getfenv(k7 .Function).script k8=sz and sz:GetFullName()or""end)if k8~=""then
for G4,A3 in ipairs(j.CALM)do if k8:find(A3,1,true)then if pcall(function()k7:Disable()end)then j.calmed[#j.calmed+1]=k7 k5=k5+1 end
break end end end end end end if#j.calmed>200 then local k9={}for A4=#j.calmed-49,#j.calmed do k9[#k9+1]=j.calmed[A4]end j.calmed=k9
end return k5 end function j.calm(sA)d.Calm=sA if sA then local A5=j.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(A5))
else for G5,A6 in ipairs(j.calmed)do pcall(function()A6:Enable()end)end j.calmed={}end end function j.restoreAll()
pcall(j.unpin)pcall(j.calm,false)if d.HideBases then pcall(j.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(sB)if c.rejoining then return end A("REJOIN this server ("..sB..")")
pcall(fw)if c.autoload then pcall(fX,c.autoload)end oB()local A7=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then dL(sB..", same server failed")end end)return A7 end function j.tick()
if d.Lite and y()-(j.extraAt or 0)>5 then j.extraAt=y()pcall(j.lights,true)pcall(j.fxPatch,true)if not(j.tc and j.tc.old)and y()-(j.topsTry or-100)>60 then j.topsTry=y()pcall(j.tops,true)end
end local k_=j.queue if d.Lite and k_ and#k_>0 then j.queue={}for A8,A9 in ipairs(k_)do pcall(j.muteOne,A9)if A8%300==0 then task.wait()end end
end local sC=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if sC then for G6,A_ in ipairs(sC:GetChildren())do
local sD=A_:FindFirstChild("SquishyPlaceHolder")local cs=sD and sD:FindFirstChild("TimerGui")if cs and cs:IsA("BillboardGui")then
if j.bb[cs]==nil then pcall(j.muteOne,cs)elseif cs.Enabled then j.bb[cs]=true cs.Enabled=false end end end end
local Ba,eB=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Ba and type(eB)=="number"then
j.mem=eB j.memPeak=math.max(j.memPeak,eB)if(d.MemLimit or 0)>0 and eB>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(eB,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if y()-(j.noteAt or 0)>1800 then j.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function la(g1)if type(g1)~="string"then return false end
g1=g1:lower()for G7,Bb in ipairs(c.sellWords)do if g1:find(Bb,1,true)then return true end end return false end
local function Bc()local sE=ah:FindFirstChild("Remotes")local lb=sE and sE:FindFirstChild("SellSquishy")if not(lb and lb:IsA("RemoteEvent"))then return false end
if not pcall(function()lb:FireServer()end)then return false end return aq(function()return ac()==nil end,1.5)
end local function Bd()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local sF=ap()local sG=sF and sF.HumanoidRootPart.Position local eC,sH for G8,c4 in ipairs((c.plot or ao):GetDescendants())do
if c4:IsA("ProximityPrompt")and(la(c4 .ActionText)or la(c4 .ObjectText)or la(c4 .Name))then local sI=nv(c4)local lc=(sI and sG)and(sI-sG).Magnitude or 1e9
if lc<=400 and(not eC or lc<sH)then eC,sH=c4,lc end end end c.sellSpot=eC c.noSellSpot=(eC==nil)return eC end
local function sJ()local ld=ac()if not ld then c.holding=false return false end if aK(ld)then return false end
local le=ak(W(ld))if Bc()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..le)return true end local c5=Bd()if c5 then local sK=dy(c5)if sK then b8(sK,c5)local sL=ac()if sL and not aK(sL)then
local Be,Bf=dR(c5,function()return ac()==nil end,function()return c5 .Enabled end)if Be then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(le,fr(c5),Bf))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..le.." ("..c.sellFails..")")
return false end local Bg={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Bh(c6)local g2=fr(c6):lower()for G9,Bi in ipairs(Bg)do if g2:find(Bi,1,true)then return 0 end end
local a7,ar=c6 .Name:lower(),0 local function aV(Bj,Bk)return Bj:find(Bk,1,true)~=nil end if aV(a7,"collect")then ar=ar+60 end
if aV(a7,"cash")or aV(a7,"money")then ar=ar+45 end if aV(a7,"income")or aV(a7,"claim")then ar=ar+35 end if aV(a7,"coin")or aV(a7,"earn")or aV(a7,"green")then ar=ar+20 end
if a7=="pad"or a7=="touch"then ar=ar+25 end if ar==0 and(aV(g2,"collect")or aV(g2,"cash")or aV(g2,"money"))then ar=25 end
if ar==0 then return 0 end local eD=c6 .Color if eD.G>0.5 and eD.G>eD.R*1.4 and eD.G>eD.B*1.4 then ar=ar+15 end
if math.min(c6 .Size.X,c6 .Size.Y,c6 .Size.Z)<2 then ar=ar+5 end return ar end local function Bl()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local g3,eE,lf={},nil,29 for G_,g4 in ipairs(c.plot:GetDescendants())do
if g4:IsA("BasePart")then local g5=Bh(g4)if g5>0 then g3[#g3+1]={s=g5,p=g4}if g5>lf then eE,lf=g4,g5 end end end
end table.sort(g3,function(Bm,Bn)return Bm.s>Bn.s end)c.padCands,c.padPart=g3,eE if eE then A("collect pad: "..fr(eE).." (score "..lf..")")end
return eE end local lg="SAB_pad_v1.txt"local function Bo(Bp)if type(writefile)=="function"then pcall(writefile,lg,table.concat({Bp:GetComponents()},","))end
end local function Bq()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Br,sM=pcall(function()if isfile(lg)then return readfile(lg)end end)
if not Br or type(sM)~="string"then return nil end local g6={}for Bs in sM:gmatch("[^,]+")do g6[#g6+1]=tonumber(Bs)end
if#g6==12 then return CFrame.new(unpack(g6))end end local function Bt(lh,g7,Bu)local Bv=cN(lh)local li=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aW=(li and li:IsA("BasePart"))and(li.Position-g7)or Vector3 .new(1,0,0)aW=Vector3 .new(aW.X,0,aW.Z)if aW.Magnitude<0.05 then aW=Vector3 .new(1,0,0)end
aW=aW.Unit for Bw=0,7 do local g8=Bw*math.pi/4 local Bx=Vector3 .new(aW.X*math.cos(g8)-aW.Z*math.sin(g8),0,aW.X*math.sin(g8)+aW.Z*math.cos(g8))
local g9=g7+Bx*(Bu+5)local lj=f5(g9 .X,g7 .Y,g9 .Z)if lj and math.abs(lj.Y-g7 .Y)<8 then aD(lh,Vector3 .new(g9 .X,lj.Y+Bv,g9 .Z))
if jg(lh,0.7)then return true end end end return false end local function By()c.lastCollect=y()local eF=ap()if not eF then return end
local sN,Bz=eF.HumanoidRootPart,cN(eF)local eG,sO,eH,lk=nil,4,nil,"?"local ll=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and ll and ll:IsA("BasePart")then eG,lk=(ll.CFrame*c.manualPad).Position,"manual pad"else local bm=Bl()
if bm then eG=Vector3 .new(bm.Position.X,bm.Position.Y+bm.Size.Y/2+Bz,bm.Position.Z)sO,eH,lk=math.max(bm.Size.X,bm.Size.Z)/2,bm,bm.Name
end end if not eG then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local lm=ba()aD(eF,eG)
if eH and type(firetouchinterest)=="function"then pcall(firetouchinterest,sN,eH,0)end af(d.PadDwell)if eH and type(firetouchinterest)=="function"then pcall(firetouchinterest,sN,eH,1)end
af(0.5)c.collected=c.collected+1 local ln=ba()A(("COLLECTED (%s) %s"):format(lk,(lm and ln and ln>lm)and("+$"..aL(ln-lm))or"no cash change seen"))
Bt(eF,eG,sO)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local sP=ah:FindFirstChild("Modules")if not sP then return false end local function lo(BA)local sQ=sP:FindFirstChild(BA)
if not sQ then return nil end local BB,sR=pcall(require,sQ)return(BB and type(sR)=="table")and sR or nil end o.si,o.arm,o.ci=lo("SquishyInfo"),lo("AutoRollRules"),lo("CrateInfo")
o.modAt=y()if not o.si then return false end local lp={}if o.arm and type(o.arm.tierOf)=="table"then for lq in pairs(o.arm.tierOf)do
local g_=o.si[lq]if type(g_)=="table"and g_.rarity~="Limited"and not g_.incomeType and not g_.hiddenAfter then lp[W(lq)]=lq end
end end o.roll=lp local ha={}for BC,BD in pairs(lp)do local eI=o.si[BD]if type(eI)=="table"and type(eI.income)=="number"and not eI.incomeType then
ha[#ha+1]={k=BC,inc=eI.income,pr=tonumber(eI.price)or 0}end end table.sort(ha,function(lr,ls)if lr.inc~=ls.inc then return lr.inc>ls.inc end return lr.pr>ls.pr end)
o.order=ha local hb,lt,lu local BE=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for BF,lv in pairs(BE)do
local lw=type(lv)=="table"and tonumber(lv.price)if lw and(not lt or lw>lt)then hb,lt,lu=BF,lw,lv.title end end
o.bestCrate,o.bestCrateName=hb and L.key(hb),hb o.bestCrateTitle=lu and L.key(lu)or nil return true end function o.rank(BG)
local BH,BI=pcall(function()return o.arm.rankOf(BG)end)return(BH and tonumber(BI))or 0 end function o.loadDisc(sS)
if type(sS)~="table"then return end local sT={}for BJ,BK in pairs(sS)do if BK then sT[W(tostring(BJ))]=true end end
o.disc,o.discAt=sT,y()end function o.fetch()o.discAt=y()local sU=ah:FindFirstChild("Remotes")local sV=sU and sU:FindFirstChild("GetSquishiesDiscovered")
if not sV then return end local BL,BM=pcall(function()return sV:InvokeServer()end)if BL then o.loadDisc(BM)end
end function o.scanWax()local lx={}local sW=c.plot and c.plot:FindFirstChild("WaxStations")if sW then for Ha,sX in ipairs(sW:GetChildren())do
local sY=sX:FindFirstChild("SquishyPlaceHolder")if sY and sX:GetAttribute("HasSquishy")then for Hb,sZ in ipairs(sY:GetChildren())do if sZ:IsA("Model")then lx[W(sZ.Name)]=true end end
end end end for s0,BN in pairs(o.placedAt)do if y()-BN<20 then lx[s0]=true else o.placedAt[s0]=nil end end o.waxing=lx
end function o.compute()local s1,ly,lz={},0,0 if o.disc then for lA in pairs(o.roll or{})do if not o.disc[lA]then
if o.waxing[lA]then lz=lz+1 else s1[lA],ly=true,ly+1 end end end end o.need,o.nNeed,o.nWax=s1,ly,lz local s2,lB={},d.Best or 0
local lC=(lB==4)and o.stackMin or nil for BO,s3 in ipairs(o.order)do if(lC and s3 .inc>lC)or(not lC and BO<=(lB==4 and 1 or lB))then s2[s3 .k]=true end
end o.best=s2 end function o.readStack()o.stackAt=y()local s4=ah:FindFirstChild("Remotes")local s5=s4 and s4:FindFirstChild("EditStack")
if not s5 then return end local BP,c7=pcall(function()return s5:InvokeServer("State",nil)end)if not(BP and type(c7)=="table"and type(c7 .state)=="table"and type(c7 .state.entries)=="table")then return end
local hc for Hc,s6 in ipairs(c7 .state.entries)do local eJ=type(s6)=="table"and o.si and o.si[tostring(s6 .name)]
if type(eJ)=="table"and type(eJ.income)=="number"and not eJ.incomeType and(not hc or eJ.income<hc)then hc=eJ.income end
end o.stackMin=hc o.stackFull=#c7 .state.entries>=(tonumber(c7 .state.capacity)or 100)end function o.want(lD)
if(d.Best or 0)>0 and(next(o.best)or(d.Best==4 and o.stackMin))then if o.best[lD]then return true end elseif d.Targets[lD]then
return true end return d.AutoIndex==true and o.need[lD]==true end function o.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(o.best)~=nil)or(d.AutoIndex and next(o.need)~=nil)
or d.Best==4 end function o.placed(BQ)local eK=W(BQ)o.placedAt[eK],o.waxing[eK]=y(),true if o.need[eK]then o.need[eK],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eK)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eL,eM={},{}for BR,BS in pairs(o.roll or{})do if o.want(BR)then eL[BS]=true end end
for s7,lE in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(s7)or(type(lE)=="table"and type(lE.title)=="string"and L.wanted(lE.title))then eM[s7]=true end
end if not next(eL)and not next(eM)then return nil end if o.arm and type(o.arm.encode)=="function"then local BT,s8=pcall(o.arm.encode,{rarities={},butters=eL,crates=eM,index=false})
if BT and type(s8)=="string"then return s8 end end local function s9(BU)local hd={}for BV in pairs(BU)do hd[#hd+1]=BV end table.sort(hd)return table.concat(hd,",")end
local eN="adv:"if next(eL)then eN=eN..";butters:"..s9(eL)end if next(eM)then eN=eN..";crates:"..s9(eM)end return eN
end function o.canon(BW)local he={}for s_ in tostring(BW or""):gmatch("[^;]+")do local lF,ta=s_:match("^(%a+):(.*)$")
if not lF then lF,ta="r",s_:gsub("^adv:","")end for BX in ta:gmatch("[^,]+")do he[#he+1]=lF.."="..BX end end table.sort(he)
return table.concat(he,"|")end function o.sync(BY)if J:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local ct=o.rulesNow()if not ct or#ct>1900 then return end if o.canon(J:GetAttribute("AutoRollRules"))==o.canon(ct)then o.fails=0 return end
if not BY and y()-o.sentAt<4 then return end local tb=ah:FindFirstChild("Remotes")local td=tb and tb:FindFirstChild("AutoRollAction")
if not td then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()td:FireServer("Rules",ct)end)D.replaying=false d.ARrules=ct
local hf,hg=0,0 for Hd in(ct:match("butters:([^;]*)")or""):gmatch("[^,]+")do hf=hf+1 end for He in(ct:match("crates:([^;]*)")or""):gmatch("[^,]+")do hg=hg+1 end
local te=hf.."/"..hg if o.told~=te then o.told=te A(("auto roll now stops on %d butters and %d crates"):format(hf,hg))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if d.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aO={}if d.AutoIndex then aO[#aO+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if d.Best==4 then local eO=0 for Hf in pairs(o.best)do eO=eO+1 end
aO[#aO+1]=eO==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eO,eO==1 and""or"s")
elseif(d.Best or 0)>0 and o.order[1]then aO[#aO+1]="best: "..ak(o.order[1].k)end if d.BestCrate and o.bestCrateName then aO[#aO+1]="crate: "..o.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aO[#aO+1]="shower: "..O.got end o.msg=#aO>0 and table.concat(aO," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(BZ)o.feed[#o.feed+1]=os.date("%H:%M ")..BZ if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(tf,av,hh)if tf~="Effect"then o.feedAdd(tostring(tf)..(av~=nil and(": "..tostring(av):sub(1,80))or""))
return end if av~="ShowerTaken"and av~="GoalPoint"then o.feedAdd(tostring(av))end if av=="Shower"then O.add(hh)return end
if av=="ShowerTaken"then O.gone(hh)return end if av=="ShowerClear"then O.drops={}return end if av=="WaxGlow"then
local lG=type(hh)=="table"and tonumber(hh.SnapAt)if lG then o.snapAt=lG A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lG-q.srv()),(d.SnapGlaze~=false and d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end av=tostring(av)b4("Admin "..av)if av~="GoalPoint"and y()-(o.heard[av]or-100)>30 then o.heard[av]=y()
A("ADMIN: "..av)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(lH)if type(lH)~="table"or type(lH.Pieces)~="table"then return end
for Hg,aX in pairs(lH.Pieces)do if type(aX)=="table"and aX.Id~=nil and aX.Position~=nil then O.drops[aX.Id]={id=aX.Id,butter=tostring(aX.Butter or"?"),rar=tostring(aX.Rarity or"?"),star=aX.Star==true,
pos=aX.Position,opens=tonumber(aX.OpensAt)or 0,ends=tonumber(aX.ExpiresAt)or 0}end end end function O.gone(eP)
if type(eP)~="table"or eP.Id==nil then return end O.drops[eP.Id]=nil if tonumber(eP.UserId)==q.uid then O.mine=eP.Id end
end function O.pick()local lI=q.srv()local lJ,th for ti,cu in pairs(O.drops)do if lI>=cu.ends-0.3 then O.drops[ti]=nil
elseif lI>=cu.opens-0.2 and(O.tried[ti]or 0)<3 then local tj=(aK(cu.butter)and 1e6 or 0)+(cu.star and 1e5 or 0)+o.rank(cu.rar)*100-(cu.ends-lI)
if not lJ or tj>th then lJ,th=cu,tj end end end return lJ end function O.due()return d.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aP,lK=O.pick(),ap()if not(aP and lK)then return end O.tried[aP.id]=(O.tried[aP.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aD(lK,aP.pos+Vector3 .new(0,cN(lK)+0.5,0))aq(function()return O.mine==aP.id or ac()~=nil or not O.drops[aP.id]end,1.5)
if O.mine==aP.id or ac()then O.got,O.drops[aP.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aP.butter)),aP.rar,aP.star and" (star)"or""))
elseif not O.drops[aP.id]then O.miss=O.miss+1 end end local eQ local function tk()if c.capHit then if d.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eQ(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ap()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bw(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local lL,tl=ft()
local hi=ac()if hi then local c8=ak(W(hi))if not aK(hi)then local lM=(V.gift and W(V.gift)==W(hi)and y()-V.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c8,lM),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c8,lM),"bad"end return"sell",("selling %s (%s)"):format(c8,lM),"warn"
end if lL<1 then return nil,("holding %s - 0 free stations"):format(c8),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c8),"wait"end
return"place",("waxing %s (%d free)"):format(c8,lL),"ok"end c.holding=false if d.Crates and not e.waiting and y()-(e.scanAt or 0)>1 and y()>(e.quietUntil or 0)then
e.scanAt=y()local lN=c.plot:FindFirstChild("CrateStand")if lN then for Hh,eR in ipairs(lN:GetDescendants())do
if eR:IsA("ProximityPrompt")and eR.Enabled and jx(eR)then local bn=eR.ObjectText if bn==""then bn=cG(lN,"TitleLabel")or""end
if bn~=""and L.wanted(bn)then local B0=fp(bn):gsub("crate$","")local tm for tn in pairs(ad.members)do if fp(tn)==B0 then tm=tn end end
e.waiting,e.at,e.title,e.prompt=true,y(),bn,eR e.data={name=(bn:gsub("%s","")),rarity=tm,title=bn}A(bn.." found waiting on your stand")
end break end end end end local to=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and to then
local aY=e.title if y()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aY),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aY.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aY),"bad"end if y()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aY),"bad"
end if e.byYou and y()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aY,math.ceil(60-(y()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aY),"ok"end if e.at and y()-e.at>e.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aY,math.floor(e.GIVEUP/60)),"bad"
end if e.summonFails>=3 then if y()-e.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aY,
math.ceil(45-(y()-e.lastFail))),"bad"end e.summonFails,e.nearFails,e.prompt=0,0,nil A("trying the "..aY.." again")
end if y()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aY),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aY,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not to then local tp=e.title..tostring(e.rolledAt)if e.told~=tp then e.told=tp A(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and y()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if lL<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(tl,tl),"wait"
end local lO=nJ()if not lO then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c9=b3()
if c9 and o9(c9 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(c9 .name),"idle"end
if y()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c9 .name),"bad"end if not pt()then return nil,("%s rolled - waiting for it to land on the stand"):format(c9 .name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c9 .name),"ok"end local bK=je()if bK.state~="match"then
c.matchSince=nil if bK.state=="skip"and not lO.Enabled then return nil,bK.text.." (sold out)","idle"end return nil,bK.text,bK.level
end if not lO.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eS=y()if eS<c.noCashUntil then
local tq,B1=dN()if tq then return nil,("cash short: have $%s, price ~$%s"):format(aL(tq),aL(B1)),"bad"end return nil,(dN()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aL(ba()),math.ceil(c.noCashUntil-eS)),dN()and"bad"or"wait"end if eS-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eS local tr=eS-c.matchSince if tr<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bK.shown,tr),"ok"end
return"buy",("buying %s via %s"):format(bK.shown,bK.src),"ok"end j.DEPTH=11 function j.pinTick()local ts=j.hold
if not ts then return end local lP=J.Character local lQ=lP and lP:FindFirstChild("HumanoidRootPart")if not lQ then return end
lQ.CFrame=ts lQ.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Hi,hj in ipairs(lP:GetChildren())do if hj:IsA("BasePart")and hj.CanCollide then j.noclip[hj]=true hj.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(B2,tt)j.hold=B2 if tt then j.surface=tt end end function j.unpin(B3)
if not j.hold then return end j.hold=nil for tu in pairs(j.noclip)do pcall(function()if tu.Parent then tu.CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local tv=ap()if tv and j.surface and not B3 then aD(tv,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bo,tw=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ap()
if not(bo and bo:IsA("BasePart")and tw)then return nil end local tx=ny()or bo.Position local hk=Vector3 .new(tx.X-bo.Position.X,0,tx.Z-bo.Position.Z)
hk=hk.Magnitude>0.1 and hk.Unit or Vector3 .new(0,0,1)local hl=bo.Position+hk*6 local ty=f5(hl.X,bo.Position.Y,hl.Z,{bo})
return CFrame.new(hl.X,(ty and ty.Y or bo.Position.Y)+cN(tw),hl.Z)end function j.ground(B4,tz,B5)local lR,lS={J.Character},nil
for Hj=1,12 do local lT=RaycastParams.new()lT.FilterType=Enum.RaycastFilterType.Exclude lT.FilterDescendantsInstances=lR
local hm=ao:Raycast(Vector3 .new(B4,tz,B5),Vector3 .new(0,-2000,0),lT)if not hm then break end lS,tz=hm,hm.Position.Y-0.05
lR[#lR+1]=hm.Instance end return lS and lS.Position.Y end function j.parkHome()local lU=j.home()if not lU then return false end
local c_=lU.Position local B6=j.ground(c_.X,c_.Y+300,c_.Z)or(c_.Y-3)j.pin(CFrame.new(c_.X,B6-8,c_.Z),lU)return true
end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function j.setGhost(hn)d.Ghost,d.GhostHelps=hn==2,hn==1 if hn<2 then task.spawn(function()while c.busy do af(0.1)end
if j.ghostMode()<2 and j.hold and not E.home then pcall(j.unpin)end end)end j.paintGhost()A("ghost: "..j.GHOST[hn][1]:sub(8):lower())
end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end
local B7=ap()if not B7 or K.seat()then return end j.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local tA=J.Character local tB=tA and tA:FindFirstChildOfClass("Humanoid")local lV=tB and tB.SeatPart
return(lV and lV.Name=="LogSeat")and lV or nil end function K.due()if not(d.Campfire and c.running)or y()<K.nextAt then return false end
local B8=ao:FindFirstChild("NightSeats")if not B8 then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or y()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(K.msg)return false end end return true end function K.sit()local tC,ho=ao:FindFirstChild("NightSeats"),ap()
if not tC or not ho then return end local tD,da=ho.HumanoidRootPart.Position,{}for Hk,hp in ipairs(tC:GetChildren())do
local tE=hp:IsA("Seat")and hp.Occupant==nil and hp:FindFirstChildOfClass("ProximityPrompt")if tE then da[#da+1]={st=hp,p=tE}end
end if#da==0 then K.nextAt,K.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(da,function(B9,B_)return(B9 .st.Position-tD).Magnitude<(B_.st.Position-tD).Magnitude end)
local Ca,Cb=da[1].st,da[1].p j.unpin(true)local db=Ca.CFrame aD(ho,db.Position+db.LookVector*2+Vector3 .new(0,2.5,0),db.Position)
af(0.25)local Cc=dR(Cb,function()return K.seat()~=nil end)if not Cc then aD(ho,db.Position+Vector3 .new(0,2,0),db.Position+db.LookVector)
aq(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=y()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then A(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local lW=ah:FindFirstChild("Remotes")if not lW then return end local eT,lX,dc=0,0,{}
local Cd,tF=pcall(function()return lW.ClanRequest:InvokeServer("state")end)local tG=Cd and type(tF)=="table"and tF.tasks
for Hl,bL in ipairs(tG and tG.list or{})do if not bL.done and bL.kind=="pull"then eT=math.max(eT,(bL.goal or 0)-(bL.progress or 0))end
if not bL.done then dc[#dc+1]=("%s %d/%d"):format(tostring(bL.text),bL.progress or 0,bL.goal or 0)end end F.events={}
for Hm,dd in ipairs(lW:GetChildren())do if dd:IsA("RemoteFunction")and dd.Name:match("^%u%a+Action$")and dd.Name~="CrateAction"and dd.Name~="AutoRollAction"then
local Ce,eU=pcall(function()return dd:InvokeServer("state")end)if Ce and type(eU)=="table"and eU.live==true and type(eU.quests)=="table"then
F.events[#F.events+1]={r=dd,st=eU}for Hn,aQ in ipairs(eU.quests)do if not aQ.done and aQ.kind=="pull"then eT=math.max(eT,(aQ.goal or 0)-(aQ.progress or 0))end
if not aQ.done and aQ.kind=="collect"then lX=math.max(lX,(aQ.goal or 0)-(aQ.progress or 0))end if not aQ.done then dc[#dc+1]=("%s %d/%d"):format(tostring(aQ.text),aQ.progress or 0,aQ.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eT,lX F.msg=#dc>0 and("open: "..table.concat(dc,", "))or"all quests done for today"
end function F.claim()for Ho,eV in ipairs(F.events)do local tH=eV.r.Name:gsub("Action$","")for Hp,de in ipairs(eV.st.quests)do
if de.done and not de.claimed then local Cf,tI=pcall(function()return eV.r:InvokeServer("claimQuest",de.id)end)
if Cf and not(type(tI)=="table"and tI.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(tH,tostring(de.text),tostring(de.points or de.treats or"?")))
end af(0.4)end end if eV.st.bonusReady==true then local Cg=pcall(function()return eV.r:InvokeServer("claimBonus")end)
if Cg then A(("CLAIMED %s daily quest bonus"):format(tH))end af(0.4)end end end function F.tick()if not(d.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return d.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local tJ=c.plot and c.plot:FindFirstChild("Lever")
local lY=tJ and tJ:FindFirstChild("Wheel")return lY and lY:FindFirstChildWhichIsA("ProximityPrompt"),lY end function F.resume(Ch)
F.arPaused=false if F.arWas then F.arWas=false d.AutoRoll=true task.spawn(D.apply,Ch)end end function F.pull()
local hq,lZ=F.lever()if not hq or not lZ or not lZ:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hq.Enabled then F.nextAt=y()+1 return end b8(lZ,hq)F.asked=nil oY(hq)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
af(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bM,Ci)local l0=bM:GetAttribute("PourOwner")
if type(l0)~="number"or l0==q.uid or not bM:GetAttribute("HasSquishy")then return false end if bM:GetAttribute("PourLong")~=true or bM:GetAttribute("PourFull")==true then return false end
local l1=bM:GetAttribute("PourId")if l1==nil or E.skip[l1]then return false end local tK,l2,Cj=bM:GetAttribute("Helpers"),0,tostring(q.uid)
if type(tK)=="string"then for Ck in tK:gmatch("[^,%s]+")do l2=l2+1 if Ck==Cj then return false end end end if l2>=6 then return false end
local hr=z.left(bM)if not hr then local tL=tonumber(bM:GetAttribute("PourEnd"))hr=tL and(tL-Ci)end if not hr or hr<=75 then return false end
local l3=game:GetService("Players"):GetPlayerByUserId(l0)if not l3 or l3:GetAttribute("WaxHelpOff")==true then return false end
return true,l3,l1 end function E.list()local l4,Cl={},q.srv()local tM=ao:FindFirstChild("Plots")for Hq,tN in ipairs(tM and tM:GetChildren()or{})do
local tO=tN~=c.plot and tN:FindFirstChild("WaxStations")for Hr,l5 in ipairs(tO and tO:GetChildren()or{})do local Cm,Cn,Co=E.can(l5,Cl)
local l6=Cm and l5:FindFirstChild("SquishyPlaceHolder")if l6 and l6:IsA("BasePart")then l4[#l4+1]={st=l5,p=Cn,id=Co,part=l6}end
end end return l4 end function E.due()return d.Help and c.running and y()>=E.nextAt end function E.skipIt(tP,tQ)
E.skip[tP],E.skipN=tQ,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[tP]=tQ},1,{}end end function E.goHome()
local hs,bN=ap(),E.home E.home=nil if not(hs and bN)then return end if d.Ghost and not K.seat()then j.unpin(true)
if not j.parkHome()then pcall(aD,hs,bN.Position,bN.Position+bN.LookVector)end elseif j.hold or(hs.HumanoidRootPart.Position-bN.Position).Magnitude>20 then
j.unpin(true)pcall(aD,hs,bN.Position,bN.Position+bN.LookVector)end end function E.step()local l7,eW=E.list(),ap()
if#l7==0 or not eW then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local tR=eW.HumanoidRootPart local tS=tR.Position table.sort(l7,function(Cp,Cq)return(Cp.part.Position-tS).Magnitude<(Cq.part.Position-tS).Magnitude end)
local aZ=l7[1]E.home=E.home or(j.hold and j.surface)or tR.CFrame local bO=aZ.part local eX=(bO.Position+aZ.st:GetPivot().Position)/2
local ht=E.tries[aZ.id]or 0 if(d.Ghost or d.GhostHelps)and ht==0 and not K.seat()then j.pin(bO.CFrame,E.home)
else j.unpin(true)local l8=ht==0 and f5(eX.X,bO.Position.Y,eX.Z,{bO})if l8 and math.abs(l8 .Y-bO.Position.Y)<8 then
aD(eW,Vector3 .new(eX.X,l8 .Y+cN(eW),eX.Z),bO.Position)else aD(eW,bO.Position+Vector3 .new(0,bO.Size.Y/2+3,0),eX)
end end af(0.3)local eY=ah:FindFirstChild("Remotes")eY=eY and eY:FindFirstChild("ClanRequest")if not eY then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hu,bp=pcall(function()return eY:InvokeServer("help",aZ.st:GetAttribute("PourOwner"),tonumber(aZ.st.Name))end)
if hu and type(bp)=="table"and bp.ok then E.n,E.fails=E.n+1,0 E.skipIt(aZ.id,"helped")A(("HELPED %s's wax (station %s)"):format(aZ.p.DisplayName,aZ.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hu and type(bp)=="table"and tostring(bp.reason or""):lower():find("walk up",1,true)and ht<2 then
E.tries[aZ.id]=ht+1 E.nextAt=y()+0.3 elseif hu and type(bp)=="table"and tostring(bp.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local tT=(hu and type(bp)=="table"and tostring(bp.reason or"refused"))or("error: "..tostring(bp))
E.skipIt(aZ.id,tT)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aZ.p.DisplayName,tT))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bq)if not d.HelpGuild or type(bq)~="table"or bq.p~="help"or bq.mine or bq.u==q.uid or not bq.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eZ=ah:FindFirstChild("Remotes")
eZ=eZ and eZ:FindFirstChild("ClanRequest")if not eZ then return end local tU,e0=pcall(function()return eZ:InvokeServer("callHelp",bq.u)end)
local tV=tostring(bq.n or bq.un or bq.u)if tU and type(e0)=="table"and e0 .ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(tV))
else A(("guild call from %s: %s"):format(tV,(tU and type(e0)=="table"and tostring(e0 .reason or"refused"))or tostring(e0)))
end end)end local function as(Cr,tW,...)if c.busy then return end c.busy,c.busyText=true,Cr if j.hold and tW~=E.step then pcall(j.unpin)end
local Cs,tX=pcall(tW,...)c.busy,c.busyText=false,""if not Cs and tX~=ir then A("ERR "..tostring(tX))end end local function Ct()
local aR,Cu,Cv=tk()c.reason,c.level=Cu,Cv if aR=="place"then as("waxing...",z.place)elseif aR=="crate"then as("opening crate...",d2,true)
elseif aR=="cratesmart"then as("opening crate...",e.smart)elseif aR=="cratewin"then as("opening the crate window...",jz)
elseif aR=="nocrate"then as("discarding crate...",d2,false)elseif aR=="cratedrop"then as("discarding a crate that would not open...",e.drop)
elseif aR=="sell"then as("selling...",sJ)elseif aR=="buy"then as("buying...",o1,false)elseif not aR and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aR and not c.matchSince and K.due()then as("sitting at the campfire...",K.sit)
elseif not aR and not c.matchSince and F.pullDue()and not ac()and not(b3()and aK(b3().name))then as("pulling the lever for a quest...",F.pull)
elseif d.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
as("collecting money...",By)elseif not aR and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not d.Help then
as("coming back...",E.goHome)elseif not c.busy then j.parkTick()end end function eQ(hv,Cw)if hv==c.running then return end
c.running=hv if not Cw then d.AutoStart=hv end if hv then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bw()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bP=fR(am.auto)if type(bP)=="string"then bP=bP:gsub("%s+$","")
if bP~=""then c.autoload=bP local Cx=ox(bP)A(Cx and("loaded config "..bP)or("config "..bP.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local Cy={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local l9={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local tY,tZ,t0,t1=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if tY and tZ and t0 and t1 then ae.x,ae.b,ae.m,ae.r=tY,tZ,t0,t1 end end)pcall(function()local t2=Enum.Font.RobotoMono if t2 then ae.mono=t2 end end)
local function H(Cz,CA,CB)local CC,l_=pcall(Instance.new,Cz)if not CC then c.uiErrs=c.uiErrs+1 return nil end
for CD,CE in pairs(CA)do if not pcall(function()l_[CD]=CE end)then c.uiErrs=c.uiErrs+1 end end l_.Parent=CB return l_
end local function ab(CG,CH)H("UICorner",{CornerRadius=UDim.new(0,CH or 8)},CG)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hw,ma)if hw and a.shown[hw]~=ma then a.shown[hw]=ma hw.Text=ma end
end function a.stroke(CI,CJ,CK)return H("UIStroke",{Color=CJ or l.line,Thickness=1,Transparency=CK or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},CI)
end function a.grad(CL,CM,CN,CO)local CP,t3=pcall(function()return ColorSequence.new(CM,CN)end)if CP and t3 then return H("UIGradient",{Color=t3,Rotation=CO or 0},CL)end
end function a.pad(CQ,t4,t5,CS,CT)H("UIPadding",{PaddingLeft=UDim.new(0,t4 or 0),PaddingTop=UDim.new(0,t5 or 0),
PaddingRight=UDim.new(0,CS or t4 or 0),PaddingBottom=UDim.new(0,CT or t5 or 0)},CQ)end function a.list(CU,CV,CW)
return H("UIListLayout",{Padding=UDim.new(0,CV or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=CW and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},CU)
end function a.ink(mb)local CX,CY=pcall(function()return 0.299*mb.R+0.587*mb.G+0.114*mb.B end)return(CX and CY>0.55)and l.ink or l.text
end function a.nextIn(t6)local t7=(a.ord[t6]or 0)+1 a.ord[t6]=t7 return t7 end local mc=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local t8=mc:FindFirstChild("SABFarmGui")if t8 then t8:Destroy()end local md=H("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},mc)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local hx=ao.CurrentCamera.ViewportSize if hx.X>100 and hx.Y>100 then Q.w=math.clamp(math.floor(hx.X*0.48),320,400)
Q.h=math.clamp(math.floor(hx.Y*0.86),250,360)end end)a.root=H("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},md)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local t9=UDim2 .new(1,0,1,0)
local function Hs(t_,ua)return UDim2 .new(t_,0,0,0),UDim2 .new(ua,(t_+ua>0.99)and 0 or-4,1,0)end local function ai(CZ,C0,e1,C1,C2,C3)
local me=H("TextButton",{Text=C0,Position=C2,Size=C3,BackgroundColor3=e1,BorderSizePixel=0,Font=ae.b,TextSize=C1,TextColor3=a.ink(e1),AutoButtonColor=true},CZ)
ab(me,8)if e1==l.panel2 or e1==l.raise or e1==l.panel then a.stroke(me,l.line,0.4)end return me end local function hy(C4,C5,C6,C7,C8)
local hz=H("TextBox",{Text=C5,PlaceholderText=C6,Position=C7,Size=C8,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},C4)ab(hz,8)a.stroke(hz,l.line,0)a.pad(hz,9,0,6,0)
return hz end local hA=ao.CurrentCamera local function C9()local C_,hB=pcall(function()return hA and hA.ViewportSize end)
if C_ and hB and hB.X>50 and hB.Y>50 then return hB end end local function bQ(e2)local mf=C9()if not(mf and e2 and e2 .Parent)then return end
local Da=pcall(function()local hC,ub=e2 .AbsolutePosition,e2 .AbsoluteSize local mg=70 local uc=math.clamp(hC.X,mg-ub.X,mf.X-mg)
local ud=math.clamp(hC.Y,0,mf.Y-math.min(ub.Y,mg))if math.abs(uc-hC.X)>0.5 or math.abs(ud-hC.Y)>0.5 then e2 .Position=UDim2 .new(0,math.floor(uc),0,math.floor(ud))
end end)return Da end local function hD(Db)local Dc,mh=pcall(function()return Db.AbsolutePosition end)if Dc and mh then return{math.floor(mh.X),math.floor(mh.Y)}end
end local df={}c.dragMoved={}local function ue(e3,uf,mi)T(e3 .InputBegan:Connect(function(dg)if dg.UserInputType~=Enum.UserInputType.MouseButton1 and dg.UserInputType~=Enum.UserInputType.Touch then return end
local mj={start=dg.Position,from=uf.Position,moved=0,target=uf,input=dg,onDrop=mi}df[e3],c.dragMoved[e3]=mj,0
local mk mk=dg.Changed:Connect(function()if dg.UserInputState==Enum.UserInputState.End and df[e3]==mj then df[e3]=nil
if mk then mk:Disconnect()end if mi then mi(mj.moved)end end end)end))end T(nh.InputChanged:Connect(function(hE)
if hE.UserInputType~=Enum.UserInputType.MouseMovement and hE.UserInputType~=Enum.UserInputType.Touch then return end
for Dd,a8 in pairs(df)do local ml=a8 .target if ml and ml.Parent then local ug,uh=hE.Position.X-a8 .start.X,hE.Position.Y-a8 .start.Y
a8 .moved=math.max(a8 .moved,math.abs(ug)+math.abs(uh))c.dragMoved[Dd]=a8 .moved ml.Position=UDim2 .new(a8 .from.X.Scale,a8 .from.X.Offset+ug,a8 .from.Y.Scale,a8 .from.Y.Offset+uh)
end end end))T(nh.InputEnded:Connect(function(hF)if hF.UserInputType~=Enum.UserInputType.MouseButton1 and hF.UserInputType~=Enum.UserInputType.Touch then return end
for De,hG in pairs(df)do if hG.input==hF or hF.UserInputType==Enum.UserInputType.MouseButton1 then df[De]=nil
if hG.onDrop then hG.onDrop(hG.moved)end end end end))local function P(Df,Dg,Dh,Di,Dj,Dk,Dl)return H("TextLabel",{Text=Dg,Position=Dk or UDim2 .new(0,0,0,0),Size=Dl or t9,BackgroundTransparency=1,
Font=Dj and ae.b or ae.m,TextSize=Dh,TextColor3=Di,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Df)
end function a.row(ui,Dm)return H("Frame",{Size=UDim2 .new(1,0,0,Dm),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(ui)},ui)end function a.card(uj,uk,ul)local dh=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(uj)},uj)ab(dh,11)a.stroke(dh,l.line,0.25)a.list(dh,5)a.pad(dh,8,8,8,9)
if uk then local mm=a.row(dh,14)H("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},mm)P(mm,uk:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if ul then local Dn=P(mm,ul,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Dn.TextXAlignment=Enum.TextXAlignment.Right end end return dh end function a.heading(Do,Dp,mn)local mo=a.row(Do,mn and 34 or 22)
P(mo,Dp,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if mn then P(mo,mn,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mo end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(mp)local aI=a.sw[mp]if not aI then return end
local di=tostring(mp.Text or""):match(":%s*(.-)%s*$")or""local bR=di~=""and not a.OFF[di]local mq=not aI.chips and(di=="ON"or di=="OFF")
aI.pill.Visible,aI.chip.Visible=mq,not mq if mq then aI.pill.BackgroundColor3=bR and l.accent or l.panel2 aI.knob.Position=bR and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aI.knob.BackgroundColor3=bR and l.white or l.dim else aI.chip.Text=di~=""and di or"-"aI.chip.BackgroundColor3=bR and l.accent or l.panel2
aI.chip.TextColor3=bR and l.ink or l.dim end mp.BackgroundColor3=bR and l.lit or l.raise if aI.edge then aI.edge.Color=bR and l.accent or l.line aI.edge.Transparency=bR and 0.55 or 0.45 end
end function a.switch(um,Dq,Dr,e4)local a0=H("TextButton",{Name="Switch",Text=Dq,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,e4 and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(um)},um)
ab(a0,9)local au={edge=a.stroke(a0,l.line,0.45)}au.title=P(a0,Dr,11,l.text,true,UDim2 .new(0,10,0,e4 and 4 or 0),UDim2 .new(1,-100,0,e4 and 15 or 28))
au.title.TextWrapped,au.title.TextTruncate=false,Enum.TextTruncate.AtEnd if e4 then au.sub=P(a0,e4,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
au.sub.TextWrapped,au.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end au.pill=H("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a0)ab(au.pill,9)au.knob=H("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},au.pill)ab(au.knob,7)au.chip=H("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},a0)
ab(au.chip,9)a.pad(au.chip,10,0,10,0)H("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},au.chip)
au.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a0]=au T(a0:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a0)end))
a.skin(a0)return a0 end function a.chips(mr)if a.sw[mr]then a.sw[mr].chips=true a.skin(mr)end end function a.line(Ds,Dt)
local uo=a.row(Ds,15)local up=H("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Dt or l.dim,
BorderSizePixel=0},uo)ab(up,3)local ms=P(uo,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))ms.TextWrapped,ms.TextTruncate=false,Enum.TextTruncate.AtEnd
return ms,up end function a.grow(uq,Du,Dv)local hH=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=Du or 10,TextColor3=Dv or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(uq)},uq)
T(hH:GetPropertyChangedSignal("Text"):Connect(function()hH.Visible=hH.Text~=""end))return hH end function a.note(Dw,Dx)
local ur=a.grow(Dw,9,l.dim)ur.Text=Dx return ur end function a.actions(Dy,us)local Dz=a.row(Dy,28)local ut,mt={},#us
for e5,uu in ipairs(us)do ut[e5]=ai(Dz,uu[1],uu[2]or l.panel2,10,UDim2 .new((e5-1)/mt,e5>1 and 3 or 0,0,0),UDim2 .new(1/mt,(e5>1 and-3 or 0)+(e5<mt and-3 or 0),1,0))
end return table.unpack(ut)end local function M(cv,hI,DA,DB)a.put(cv,hI and DA or DB)if not a.sw[cv]and a.lit[cv]~=hI then
a.lit[cv]=hI cv.BackgroundColor3=hI and l.accent or l.panel2 cv.TextColor3=a.ink(cv.BackgroundColor3)end end a.title=H("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)H("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
H("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local mu=H("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(mu,8)a.grad(mu,l.accent,l.accent2,45)local uv=P(mu,"C",16,l.ink,true)uv.Font,uv.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local DC=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))DC.Font=ae.x P(a.title,"butter farm  "..bY,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local DD=a.list(a.tabs,3)pcall(function()DD.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function br(DE,DF,DG)
local hJ=H("TextButton",{Text=DE,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(hJ,9)local uw=H("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hJ)ab(uw,2)a.tabsAll[#a.tabsAll+1]={b=hJ,bar=uw,name=DF,sub=DG}return hJ end
a.tabFarm=br("🏠","Home","what the farm is doing")a.tabRun=br("🌾","Farm","the buy - wax - collect loop")a.tabBut=br("🧈","Butters","what gets bought and waxed")
a.tabCrt=br("📦","Crates","which crates get opened")a.tabPet=br("🐾","Pets","adopt, wish, fuse")a.tabTeam=br("👥","Teams","the right pets at the right moment")
a.tabSrv=br("🤝","Server","helping, campfire, ghost")a.tabAdm=br("⚡","Admin","admin abuse and its boosts")a.tabSet=br("⚙","Settings","configs, startup, performance")
local function bs()local mv=H("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mv,8)a.pad(mv,8,2,10,12)return mv end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs()a.farm.Visible=true
do local e6=a.farm local ux=a.row(e6,34)a.startB=ai(ux,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(ux,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local DH=a.row(e6,44)local function e7(uy,DI,uz)local hK=H("Frame",{Position=UDim2 .new((uy-1)/uz,uy>1 and 2 or 0,0,0),Size=UDim2 .new(1/uz,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},DH)ab(hK,9)a.stroke(hK,l.line,0.3)local hL=P(hK,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hL.Font,hL.TextXAlignment,hL.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local DJ=P(hK,DI,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
DJ.TextXAlignment=Enum.TextXAlignment.Center return hL end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e7(1,"BOUGHT",5),e7(2,"WAXED",5),e7(3,"SOLD",5),e7(4,"MONEY",5),e7(5,"FREE",5)
local uA=a.card(e6,"Right now")a.info=P(a.row(uA,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(uA,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local e8=a.card(e6,"Systems")
a.helpL=a.line(e8,l.info)a.campL=a.line(e8,l.accent2)a.questL=a.line(e8,l.good)a.arL=a.line(e8,l.accent)a.ixL=a.line(e8,l9 .Dotonbori)
local uB=a.card(e6,"Activity")a.log=H("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(uB)},uB)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function Ht(DK,DL)return a.row(DL or a.farm,DK)end local al do local mw=a.run
a.heading(mw,"Farm","buy what rolls, wax it, collect the cash")local e9=a.card(mw,"Loop")a.colT=a.switch(e9,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(e9,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hy(al,tostring(d.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(e9,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(e9,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(e9,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local mx=a.card(mw,"By hand")
a.buyB,a.plB=a.actions(mx,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(mx,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(mx,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local hM=a.but a.heading(hM,"Butters","what gets bought and waxed")local uC=a.card(hM,"Strategy")a.ixT=a.switch(uC,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(uC,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hM)},hM)a.list(a.butList,5)end do local hN=a.crt a.heading(hN,"Crates","only ticked crates are opened")
local uD=a.card(hN,"Opening")a.crateT=a.switch(uD,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(uD,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hN)},hN)a.list(a.crtList,5)end do local hO=a.pet a.heading(hO,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local e_=a.card(hO,"Automatic")a.pbT=a.switch(e_,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(e_,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(e_,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(e_,10,l.dim)a.note(e_,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hO)},hO)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hP=a.srv a.heading(hP,"Server","other players, the campfire, staying hidden")
local my=a.card(hP,"Helping")a.helpT=a.switch(my,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(my,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(my,l.info)
local uE=a.card(hP,"Campfire")a.campT=a.switch(uE,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(uE,l.accent2)local mz=a.card(hP,"Ghost")a.ghostT=a.switch(mz,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mz,l.dim)a.note(mz,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fa=a.adm a.heading(fa,"Admin abuse","the show, its boosts and the farm in it")local uF=a.card(fa,"When")
a.admBig=P(a.row(uF,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(uF,14),"",10,l.dim,false)local DM=a.card(fa,"Boosts now")
a.admBoost=a.grow(DM,11,l.text)local mA=a.card(fa,"What the farm does")a.shT=a.switch(mA,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mA,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(mA,l.accent)
local uG=a.card(fa,"Show feed")a.admFeed=H("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(uG)},uG)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local dj=a.set a.heading(dj,"Settings","kept on your phone, per config")
local hQ=a.card(dj,"Config")al=a.row(hQ,28)a.cfgName=hy(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hQ,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hQ,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(hQ,10,l.dim)local mB=a.card(dj,"Starting")a.startT=a.switch(mB,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mB,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(mB,9,l.dim)local mC=a.card(dj,"If the game drops me")
a.rejT=a.switch(mC,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(mC,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(mC,9,l.dim)local bt=a.card(dj,"Performance")a.pfCalm=a.switch(bt,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bt,"LITE MODE: OFF","Lite mode","fireworks, toppings, labels, sparkles off")a.pfBases=a.switch(bt,"BASES: ALL DRAWN","Bases","stop drawing other bases, or yours too")
a.pfFps=a.switch(bt,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bt,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bt,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bt,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hy(al,tostring(d.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bt,l.good)a.note(bt,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local DN=a.card(dj,"About")a.note(DN,"CHURN "..bY.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Hu,DO in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(DO)end local uH=H("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},mc)
a.tgRoot=H("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},uH)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=H("TextButton",{Text="C",Size=t9,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=H("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=H("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()
local fb=j.ghostMode()if a.ghostT then a.put(a.ghostT,j.GHOST[fb][1])end if a.tgGhost then a.tgGhost.Text=j.GHOST[fb][2]
a.tgGhost.BackgroundColor3=fb==2 and l.accent or(fb==1 and l.warn or l.panel)a.tgGhost.TextColor3=fb>0 and l.ink or l.dim
end end local bu={built=false,boxes={},at=0}function a.check(hR,mD)hR.Text=mD and"✓"or""hR.BackgroundColor3=mD and l.accent or l.bg
hR.TextColor3=l.ink local mE=hR.Parent if mE and mE:IsA("TextButton")then mE.BackgroundColor3=mD and l.lit or l.raise end
end local function uI(uJ,uK)d.Targets[uJ]=uK or nil local uL=bu.boxes[uJ]if uL then a.check(uL,uK)end end local function mF()
for DP,DQ in pairs(bu.boxes)do a.check(DQ,d.Targets[DP]==true)end end function a.tickBox(DR)local mG=H("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},DR)ab(mG,6)
a.stroke(mG,l.line,0)return mG end local fc local function DS()local DT=a.card(a.butList,"Butter list")local mH=a.row(DT,26)
a.butInfo=P(mH,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local DU=ai(mH,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local DV=ai(mH,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))DU.MouseButton1Click:Connect(function()
for DW in pairs(d.Targets)do d.Targets[DW]=nil end mF()end)DV.MouseButton1Click:Connect(function()ad.at=0 i1()
fc(true)end)end fc=function(DX)if not i1()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bu.built and not DX and bu.at==ad.at then return end for Hv,hS in ipairs(a.butList:GetChildren())do
if hS:IsA("Frame")or hS:IsA("TextButton")or hS:IsA("TextLabel")then hS:Destroy()end end bu.boxes,a.butEmpty={},nil
DS()for Hw,hT in ipairs(ad.rarOrder)do local mI=l9[hT]or l.text local cw=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cw,11)a.stroke(cw,mI,0.7)a.list(cw,4)a.pad(cw,7,7,7,8)
local mJ=a.row(cw,22)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=mI,BorderSizePixel=0},mJ)
local DY=P(mJ,hT:upper(),11,mI,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))DY.Font=ae.x local DZ=ai(mJ,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local D0=hT DZ.MouseButton1Click:Connect(function()local uM=ad.members[D0]or{}local uN=false for Hx,D1 in ipairs(uM)do if not d.Targets[D1]then uN=true break end end
for Hy,D2 in ipairs(uM)do uI(D2,uN)end end)for Hz,mK in ipairs(ad.members[hT]or{})do local hU=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cw)},cw)ab(hU,8)local uO=P(hU,ak(mK),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
uO.TextWrapped,uO.TextTruncate=false,Enum.TextTruncate.AtEnd local uP=a.tickBox(hU)bu.boxes[mK]=uP local uQ=mK
local function uR()uI(uQ,not d.Targets[uQ])end hU.MouseButton1Click:Connect(uR)uP.MouseButton1Click:Connect(uR)
end end mF()bu.built,bu.at=true,ad.at end function L.paint()for D3,D4 in pairs(L.boxes)do a.check(D4,d.CrateTicks[D3]==true)end
if a.crtInfo then local mL,mM=0,0 for HA in pairs(L.boxes)do mL=mL+1 end for HB,D5 in pairs(d.CrateTicks)do if D5 then mM=mM+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(mL,mM))end if a.crateT then M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for HC,hV in ipairs(a.crtList:GetChildren())do if hV:IsA("Frame")or hV:IsA("TextButton")or hV:IsA("TextLabel")then hV:Destroy()end
end L.boxes={}local mN=a.card(a.crtList,"All of them","worst first")local mO=a.row(mN,26)a.crtInfo=P(mO,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local D6=ai(mO,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local D7=ai(mO,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(D6 .MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(D7 .MouseButton1Click:Connect(function()L.build()end))
for HD,bv in ipairs(L.list())do local uS=l9[bv.rar or""]or l.text local dk=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(mN)},mN)ab(dk,8)H("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=uS,BorderSizePixel=0},dk)
local uT=P(dk,(bv.title or bv.name)..(bv.guess and"  (?)"or""),11,uS,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
uT.TextWrapped,uT.TextTruncate=false,Enum.TextTruncate.AtEnd local D8=P(dk,bv.price and("$"..aL(bv.price))or(bv.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
D8 .TextXAlignment=Enum.TextXAlignment.Right local uU=a.tickBox(dk)L.boxes[bv.k]=uU local uV=bv.k local function uW()
d.CrateTicks[uV]=(not d.CrateTicks[uV])or nil L.paint()end T(dk.MouseButton1Click:Connect(uW))T(uU.MouseButton1Click:Connect(uW))
end L.built=L.at L.paint()end local uX="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a1(cx)uX=cx for D9,mP in ipairs(a.tabKeys)do a[mP].Visible=(mP==cx)local hW=a.tabsAll[D9]if hW then
local mQ=mP==cx hW.b.BackgroundTransparency,hW.b.TextTransparency,hW.bar.Visible=mQ and 0 or 1,mQ and 0 or 0.45,mQ
end end if cx=="pet"and not q.built then pcall(q.build)end if cx=="team"and not z.built then pcall(z.build)end
if cx=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cx=="but"then fc(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(mR,uY,uZ,u0)if u0 then mR.Text=u0 end mR.BackgroundColor3=uY and uZ or l.bg mR.TextColor3=uY and a.ink(uZ)or l.dim
end function q.paintRow(u1)local cy=q.rows and q.rows[u1]if not cy then return end local cz=d.Pets[u1]or{}local fd=tonumber(cz.f)or 0
a.flag(cy.b,cz.b,l.good)a.flag(cy.g,cz.g,l.accent,cz.g and"BIG"or"ANY")a.flag(cy.w,cz.w,l.warn)a.flag(cy.f,fd>0,l.good,fd>=7 and"7 BIG/HUGE"or(fd>0 and(fd.." BIG")or"FUSE"))
if cy.row then cy.row.BackgroundColor3=(cz.b or cz.w or fd>0)and l.lit or l.raise end end function q.flag(mS,hX)
local a9=d.Pets[mS]or{}if hX=="f"then local D_={[0]=1,[1]=2,[2]=3,[3]=7}local u2=D_[tonumber(a9 .f)or 0]or 0 a9 .f=u2>0 and u2 or nil
elseif a9[hX]then a9[hX]=nil else a9[hX]=true end d.Pets[mS]=(a9 .b or a9 .g or a9 .w or a9 .f)and a9 or nil q.paintRow(mS)
end function q.paintAll()for Ea in pairs(q.rows or{})do q.paintRow(Ea)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local mT=q.wishes()local fe=q.data()for hY,mU in pairs(q.rows)do local u3=C.status(hY,fe)mU.desc.Text=(mT[hY]and("wishing %dm | "):format(math.ceil(mT[hY]/60))or"")..(u3 and(u3 .." | ")or"")..mU.boostText
mU.desc.TextColor3=mT[hY]and l.text or l.dim end local u4=tonumber(J:GetAttribute("PetWishCredits"))or 0 a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(fe and#(fe.pets or{})or 0,fe and tonumber(fe.maxOwned)or 60,
aL(q.money()),u4>0 and(" | free wishes "..u4)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local hZ=q.info()for HE,h0 in ipairs(a.petList:GetChildren())do if h0:IsA("Frame")or h0:IsA("TextLabel")or h0:IsA("TextButton")then h0:Destroy()end
end q.rows={}if not hZ then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dl={}for HF,u5 in ipairs(q.order())do local mV=hZ.Pets[u5].rarity or"?"dl[mV]=dl[mV]or{}
table.insert(dl[mV],u5)end local dm={}for HG,u6 in ipairs(hZ.Rarities or{})do if dl[u6]then dm[#dm+1]=u6 end end
for u7 in pairs(dl)do if not table.find(dm,u7)then dm[#dm+1]=u7 end end for HH,mW in ipairs(dm)do local h1=q.RC[mW]or l.text
local cA=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cA,11)a.stroke(cA,h1,0.7)a.list(cA,4)a.pad(cA,7,7,7,8)local u8=a.row(cA,18)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=h1,BorderSizePixel=0},u8)
local Eb=P(u8,mW:upper(),11,h1,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Eb.Font=ae.x for HI,h2 in ipairs(dl[mW])do
local ff=H("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cA)},cA)
ab(ff,8)local mX=P(ff,q.nice(h2),11,h1,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))mX.TextWrapped,mX.TextTruncate=false,Enum.TextTruncate.AtEnd
local Ec,Ed=pcall(function()return hZ.describe(h2)end)local u9=Ec and tostring(Ed)or""local mY=P(ff,u9,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
mY.TextYAlignment,mY.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function h3(Ee,Ef,Eg)
local u_=ai(ff,Ee,l.bg,8,UDim2 .new(1,Ef,0,5),UDim2 .new(0,Eg,0,22))u_.AutoButtonColor=true return u_ end local va,vb,vc,vd=h3("BUY",-164,30),h3("ANY",-131,30),h3("WISH",-98,34),h3("FUSE",-61,56)
local h4=h2 va.MouseButton1Click:Connect(function()q.flag(h4,"b")end)vb.MouseButton1Click:Connect(function()q.flag(h4,"g")end)
vc.MouseButton1Click:Connect(function()q.flag(h4,"w")end)vd.MouseButton1Click:Connect(function()q.flag(h4,"f")end)
q.rows[h2]={b=va,g=vb,w=vc,f=vd,name=mX,desc=mY,boostText=u9,row=ff}end end q.built=true q.paintAll()end function j.paint()
M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.Calm then j.calm(true)end if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end T(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()j.calm(not d.Calm)j.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local Eh=table.find(j.CAPS,d.FpsCap or 0)or 1 local ve=j.CAPS[(Eh%#j.CAPS)+1]
if not j.cap(ve)and ve~=0 then A("this executor cannot cap fps")end j.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local mZ=tonumber(a.pfMem.Text)if mZ and mZ>=0 then d.MemLimit=math.floor(mZ)end j.paint()end))function z.names()
local m0={"(none)"}for HJ,Ei in ipairs((z.teams()))do m0[#m0+1]=Ei.name end return m0 end function z.cycle(m1,Ej)
local h5=z.names()local Ek=d[m1]~=""and d[m1]or"(none)"local h6=table.find(h5,Ek)or 1 h6=((h6-1+Ej)%#h5)+1 d[m1]=h5[h6]=="(none)"and""or h5[h6]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local m2={}for HK,El in ipairs((z.teams()))do m2[El.name]=true end
for Em,vf in pairs(z.pick)do local dn=d[Em]vf.Text=dn==""and"(none)"or(m2[dn]and dn or(dn.." (missing)"))vf.TextColor3=(dn~=""and not m2[dn])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local En,h7=q.srv(),{}for HL,h8 in ipairs(z.list or{})do h7[#h7+1]=("st %-2s %-22s %9s  helps %d"):format(h8 .st.Name,ak(W(h8 .name)):sub(1,22),z.clock(h8 .ends-En),h8 .helps)
end a.tmList.Text=#h7>0 and table.concat(h7,"\n")or"no waxes running"end function z.build()for HM,h9 in ipairs(a.teamList:GetChildren())do
if h9:IsA("Frame")or h9:IsA("TextLabel")or h9:IsA("TextButton")then h9:Destroy()end end z.pick={}local h_=a.card(a.teamList,"Automatic")
a.tmT=a.switch(h_,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(h_,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild z.paint()end)a.tmBuildNow=a.actions(h_,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local Eo,Ep=pcall(C.rebuild,"you asked")if not Eo then A("BUILD ERR "..tostring(Ep))end end)
end)a.tmInfo=a.grow(h_,10,l.dim)local vg=a.card(a.teamList,"Which team when")local function ia(ib,Eq,Er)local fg=a.row(vg,54)
P(fg,Eq,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local vh=P(fg,Er,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
vh.TextWrapped,vh.TextTruncate=false,Enum.TextTruncate.AtEnd local Es=ai(fg,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local vi=ai(fg,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local Et=ai(fg,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
Es.MouseButton1Click:Connect(function()z.cycle(ib,-1)end)Et.MouseButton1Click:Connect(function()z.cycle(ib,1)end)
vi.MouseButton1Click:Connect(function()z.cycle(ib,1)end)z.pick[ib]=vi end ia("TeamNormal","Normal","the rest of the time: money + luck")
ia("TeamFull","Full","every station busy: money + wax speed")ia("TeamGlaze","Glaze","worn just before a wax finishes")
local ic=a.row(vg,26)P(ic,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hy(ic,tostring(d.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(ic,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local Eu=ai(ic,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
Eu.MouseButton1Click:Connect(function()local ie=tonumber(a.tmLead.Text)if ie and ie>=5 and ie<=600 then d.GlazeLead=math.floor(ie)else a.tmLead.Text=tostring(d.GlazeLead)end
z.paint()end)ia("TeamWax","Wax","while a butter is placed: head starts")local vj=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(vj)},vj)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local Ev=a.card(a.teamList,"How it works")a.note(Ev,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function Ew()a.secB.Text=tostring(d.Every)M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not E.home then pcall(j.unpin)end end)end
M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eQ(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bQ(a.root)bQ(a.tgRoot)c.lastCollect=y()
mF()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(j.applyAll)end local function Ex(vk)task.spawn(function()vk.TextColor3=l.bad
task.wait(0.8)if c.alive then vk.TextColor3=l.text end end)end local function vl()local vm=a.secB.Text:match("^%s*(%d+)%s*$")
local fh=vm and tonumber(vm)if not fh or fh<1 then a.secB.Text=tostring(d.Every)Ex(a.secB)A("interval must be a whole number >= 1")
return end if fh==d.Every then return end d.Every,c.lastCollect=fh,y()A("collect every "..fh.."s")end local function N(Ey,Ez)T(Ey.MouseButton1Click:Connect(Ez))end
N(a.secSet,vl)T(a.secB.FocusLost:Connect(vl))N(a.colT,function()d.Collect,c.lastCollect=not d.Collect,y()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",sJ)end)N(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
d.Help=not d.Help E.nextAt,E.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()d.Quests=not d.Quests F.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,j.cycleGhost)function o.paint()M(a.snapT,d.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
M(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(EA)task.spawn(function()pcall(o.tick)if EA and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local EB=o.on()d.AutoIndex=not d.AutoIndex o.discAt=-100 o.changed(EB)end)
N(a.bestT,function()local EC=o.on()d.Best=((d.Best or 0)+1)%5 o.stackAt=-100 o.changed(EC)end)N(a.bcT,function()
local ED=o.on()d.BestCrate=not d.BestCrate o.changed(ED)end)N(a.shT,function()d.Shower=not d.Shower o.paint()
end)N(a.snapT,function()d.SnapGlaze=d.SnapGlaze==false o.paint()end)N(a.pbT,function()d.PetBuy=not d.PetBuy q.paintAll()end)
N(a.pwT,function()d.PetWish=not d.PetWish q.paintAll()end)N(a.pfT,function()d.AutoFuse=not d.AutoFuse q.paintAll()end)
function o.admPaint()local bS=q.srv()local bT pcall(function()o.aac=o.aac or require(ah:FindFirstChild("AdminAbuseClient"))
bT=o.aac:GetState()end)local dp,bU="nothing scheduled","the game has not announced one"if type(bT)=="table"then
local fi,a2,bV=tostring(bT.Phase or""),tonumber(bT.StartsAt),tonumber(bT.EndsAt)if a2 and a2<1e9 then a2=nil end
if bV and bV<1e9 then bV=nil end if fi=="Countdown"and a2 then dp,bU="starts in "..z.clock(a2-bS),os.date("%a %H:%M",math.floor(a2)).." your time"
elseif fi=="Live"and bV then dp,bU="LIVE  -  "..z.clock(bV-bS).." left","the farm is grabbing, waxing and glazing through it"
elseif fi~=""and fi~="Idle"and bV and bV>bS then dp,bU=fi:lower().."  -  "..z.clock(bV-bS).." left","after the show"
elseif a2 and a2>bS then dp,bU="next: "..os.date("%a %H:%M",math.floor(a2)),"your time"elseif a2 then dp,bU="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a2)).." your time"
end if type(bT.Kind)=="string"and bT.Kind~=""then bU=bU.."  |  "..bT.Kind end end a.put(a.admBig,dp)a.put(a.admSub,bU)
local dq,m3={},ah:FindFirstChild("AdminShow")if m3 then local EE,EF=pcall(function()return m3:GetAttributes()end)
for vn,dr in pairs(EE and EF or{})do local ig=type(vn)=="string"and vn:match("^(.-)Mult$")local m4=ig and tonumber(m3:GetAttribute(ig.."Until"))
if ig and type(dr)=="number"and dr~=1 and dr~=0 and m4 and m4>bS then dq[#dq+1]=("%s  x%s   %s left"):format(ig:gsub("(%l)(%u)","%1 %2"),(dr%1==0)and tostring(dr)or("%.2f"):format(dr),
z.clock(m4-bS))end end end table.sort(dq)a.put(a.admBoost,#dq>0 and table.concat(dq,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dq>0 and l.accent or l.dim local ih=0 for HN in pairs(O.drops)do ih=ih+1 end local vo=o.snapAt and(o.snapAt-bS)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,ih>0 and(", "..ih.." falling")or"",
vo and("in "..math.max(0,math.floor(vo)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",d2,true)end)N(a.padB,function()c.plot=bw()or c.plot local vp,m5=ap(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(vp and m5 and m5:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=m5 .CFrame:ToObjectSpace(vp.HumanoidRootPart.CFrame)
Bo(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eQ(not c.running)end)N(a.buyB,function()
c.plot=bw()or c.plot task.spawn(as,"buying (manual)...",o1,true)end)N(a.plB,function()c.plot=bw()or c.plot task.spawn(as,"waxing (manual)...",o5)
end)N(a.tabFarm,function()a1("farm")end)N(a.tabRun,function()a1("run")end)N(a.tabSrv,function()a1("srv")end)N(a.tabAdm,function()a1("adm")end)
N(a.tabBut,function()a1("but")end)N(a.tabSet,function()a1("set")end)N(a.tabCrt,function()a1("crt")end)N(a.tabPet,function()a1("pet")end)
N(a.tabTeam,function()a1("team")end)local function EG(m6)c.hidden=m6 a.root.Visible=not m6 a.tgBtn.TextColor3=m6 and l.text or l.ink
end ue(a.tgBtn,a.tgRoot,function()bQ(a.tgRoot)c.togPos=hD(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then EG(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aJ,aw={},0 local function bW()aJ=ol()if#aJ==0 then a.cfgPick.Text="(none saved)"
aw=0 return end if aw<1 or aw>#aJ then aw=1 end a.cfgPick.Text=aJ[aw]..("  (%d/%d)"):format(aw,#aJ)end local function vq()
local vr=c.autoload~=nil a.cfgAuto.Text=vr and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=vr and l.accent or l.panel2
end local function m7()local vs=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if vs~=""then return vs end return(aw>0 and aJ[aw])or""
end N(a.cfgSave,function()c.winPos=hD(a.root)or c.winPos c.togPos=hD(a.tgRoot)or c.togPos local vt,vu=fX(m7())
a.cfgMsg.Text=vt and("saved as "..vu)or("could not save: "..vu)a.cfgMsg.TextColor3=vt and l.good or l.bad bW()
A(a.cfgMsg.Text)end)local function EH(m8)local m9,vv=ox(m8)a.cfgMsg.Text=m9 and("loaded "..vv)or("could not load: "..vv)
a.cfgMsg.TextColor3=m9 and l.good or l.bad if m9 then a.cfgName.Text=m8 Ew()task.spawn(D.apply,"config "..m8)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()EH(m7())end)N(a.cfgPick,function()bW()if aw>0 then a.cfgName.Text=aJ[aw]end
end)N(a.cfgPrev,function()if#aJ==0 then bW()return end aw=(aw-2)%#aJ+1 bW()a.cfgName.Text=aJ[aw]end)N(a.cfgNext,function()
if#aJ==0 then bW()return end aw=aw%#aJ+1 bW()a.cfgName.Text=aJ[aw]end)N(a.cfgAuto,function()if c.autoload then
oz(nil)a.cfgMsg.Text="it will not load a config on launch"else local fj=m7()local vw=false for HO,EI in ipairs(ol())do if EI==fj then vw=true end end
local EJ=vw or fX(fj)if EJ and fj~=""then oz(fj)bW()a.cfgMsg.Text=fj.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim vq()end)N(a.autoB,function()
local vx,vy=xr()a.autoMsg.Text=vx and("installed. "..vy)or("failed: "..vy)a.autoMsg.TextColor3=vx and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dL("you asked")end)
local a_=false N(a.minB,function()a_=not a_ a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not a_,not a_,not a_
if a_ then for HP,EK in ipairs(a.tabKeys)do a[EK].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a1(uX)
end a.root.Size=UDim2 .new(0,Q.w,0,a_ and(Q.head+Q.status+12)or Q.h)a.minB.Text=a_ and"+"or"-"end)local function ii()
if not c.alive then return end c.alive,c.running=false,false pcall(j.restoreAll)pcall(fw)for HQ,EL in ipairs(is)do pcall(function()EL:Disconnect()end)end
if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end pcall(function()md:Destroy()end)
pcall(function()uH:Destroy()end)if cC.SAB_KILL==ii then cC.SAB_KILL=nil end end cC.SAB_KILL=ii N(a.killB,ii)N(a.xB,ii)
ue(a.title,a.root,function()bQ(a.root)c.winPos=hD(a.root)or c.winPos end)local function vz()local fk,cB=c.reason,c.level
if c.busy then fk,cB=c.busyText,"ok"elseif not c.running then local HR,vA,EM=tk()if c.capHit then fk,cB=vA,"bad"else fk,cB="[stopped] "..vA,(EM=="bad")and"bad"or"idle"end
c.reason,c.level=fk,cB end local ds=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=ds then
a.lit.dot=ds a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=ds,ds,ds,ds a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fk)if a.lit.bar~=cB then a.lit.bar=cB a.bar.BackgroundColor3=Cy[cB]or l.dim end
if a_ then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bX=w2()if a.farm.Visible then local EN,EO=ft()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,EN.."/"..EO)local vB=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(y()-c.lastCollect)))or nil
local vC=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aL(ba()),c.rolls,c.gifts,c.crates,vC and ak(W(vC))or"nothing",e.on and("   ["..e.title.." window open]")or"",
vB and("in "..vB.."s")or"off"))a.put(a.tgt,(#bX==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bX<=3)and table.concat(bX,", ")or(#bX.." butters ticked"))))
if a.lit.tgt~=(#bX==0)then a.lit.tgt=(#bX==0)a.tgt.TextColor3=(#bX==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fn,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(d.Help or d.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,d.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,j.ghostMode()>0 and(j.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bX))
end if a.but.Visible and bu.at~=ad.at then fc(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((d.Help or d.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(d.Campfire and K.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(d.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local vD=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",vD~=""and vD or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cC.SAB={S=c,CFG=d,EV=V,U=a,sg=md,CAT=ad,LEARN=aj,buildList=fc,
logAll=dt,evAll=du,AR=D,CR=L,PF=j,PX=q,TM=z,CRATE=e,FU=C,HX=E,CF=K,QX=F,IX=o,SH=O}A(bY.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a1("farm")bQ(a.root)bQ(a.tgRoot)if hA then pcall(function()T(hA:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bQ(a.root)bQ(a.tgRoot)end))end)end bW()vq()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(vz)task.spawn(function()local vE=xp()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(vE and("\n(backup: "..vE..")")or"")
local vF=fR(am.exec)if vF and not vF:find("SAB autoloader v2",1,true)then dH(am.exec,am.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fR(am.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(xx)end)task.spawn(function()while c.alive do local EP,EQ=pcall(vz)if not EP then A("UI ERR "..tostring(EQ))end
task.wait((c.hidden or a_)and 1.5 or 0.4)end end)task.spawn(function()local ER,ES=pcall(xG)if not ER then A("HOOK ERR "..tostring(ES))end
end)task.spawn(function()pcall(wo)if e.loadSeq and not e.learned then local ij={}for vG=1,20 do if e.loadSeq[vG]then ij[#ij+1]=e.loadSeq[vG]end end
if#ij>0 then e.learned={seq=ij,mode=e.loadMode}A("remembered how to open crates directly")end end if i1()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local ET,vH=pcall(Bq)if ET and vH and c.alive and not c.manualPad then c.manualPad=vH end end)task.spawn(function()
while c.alive do local m_,na=pcall(q.buyTick)if not m_ then A("PET ERR "..tostring(na))task.wait(5)end m_,na=pcall(q.wishTick)
if not m_ then A("WISH ERR "..tostring(na))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local ik,vI=0,y()
T(game:GetService("RunService").Heartbeat:Connect(function()ik=ik+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=y()while c.alive do task.wait(1)local vJ=y()j.fps,ik,vI=ik/math.max(vJ-vI,0.001),0,vJ local EU,EW=pcall(j.tick)
if not EU then A("PERF ERR "..tostring(EW))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local EX,EY=pcall(C.tick)if not EX then A("FUSE ERR "..tostring(EY))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local EZ,E0=pcall(z.tick)if not EZ then A("TEAM ERR "..tostring(E0))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local il=ah:WaitForChild("Remotes",30)local vK=il and il:WaitForChild("ClanEvent",30)
if vK and c.alive then T(vK.OnClientEvent:Connect(function(E1,E2)if E1=="call"then pcall(E.onCall,E2)end end))
end local vL=il and il:FindFirstChild("RollConfirmAsk")if vL and c.alive then T(vL.OnClientEvent:Connect(function(E3)F.asked=E3 or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(j.calmScan)end end end)task.spawn(function()
local nb=ah:WaitForChild("Remotes",30)if not(nb and c.alive)then return end local function im(E4,E5)local nc=nb:FindFirstChild(E4)
if nc and nc:IsA("RemoteEvent")then T(nc.OnClientEvent:Connect(function(...)pcall(E5,...)end))end end im("NewSquishyDiscovered",function(nd,vM)
if type(nd)~="string"then return end o.disc=o.disc or{}o.disc[W(nd)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(nd)),vM and(" ("..tostring(vM)..")")or""))
end)im("IndexRefresh",o.loadDisc)im("IndexRowComplete",function(E6)A("INDEX: the whole "..tostring(E6).." row is complete")end)
im("AdminShow",o.admin)local vN=nb:FindFirstChild("AdminShowSync")if vN then local E7,vO=pcall(function()return vN:InvokeServer()end)
if E7 and type(vO)=="table"then for HT,E8 in pairs(vO)do pcall(O.add,E8)end end end while c.alive do local E9,E_=pcall(o.tick)
if not E9 then o.msg="index error: "..tostring(E_)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Fa,Fb=pcall(F.tick)if not Fa then A("QUEST ERR "..tostring(Fb))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(fw)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Fd=(type(newcclosure)=="function")and newcclosure or function(Fc)return Fc end local ne
local vP=(type(setnamecallmethod)=="function")and setnamecallmethod or nil ne=hookmetamethod(game,"__namecall",Fd(function(vQ,...)
local fl=getnamecallmethod()if c.alive and(fl=="InvokeServer"or fl=="FireServer")then local vR,vS=pcall(function()return vQ.Name end)
if vR and vS=="CrateAction"and not e.replaying then pcall(e.saw,fl,...)elseif vR and vS=="AutoRollAction"and not D.replaying then pcall(D.saw,fl,...)end
if vP then vP(fl)end end return ne(vQ,...)end))e.oldNC=ne end)end if iq then T(J.Idled:Connect(function()pcall(function()iq:CaptureController()iq:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for HU=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ap()and(c.plot or bw())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local io=b3()
if io and o.on()and not aK(io.name)then io=nil end if c.alive and d.AutoRoll and c.running and not D.isOn()and not io and not ac()
and not e.waiting and not e.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for HV=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bw()if ap()and c.plot and o.any()then eQ(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bw()c.lastCollect=y()while c.alive do if c.running then local Fe,vT=pcall(Ct)if not Fe and vT~=ir then A("LOOP ERR "..tostring(vT))end
end task.wait(0.1)end end)ip("ready - the window is at the top left")end local Fg,nf=xpcall(vX,function(Ff)return tostring(Ff).."\n"..debug.traceback()end)
if not Fg then pcall(function()warn("SAB "..bY.." ERROR: "..tostring(nf))end)ip("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bY.." ERROR: "..tostring(nf))end)pcall(function()local vU=(type(getgenv)=="function"and getgenv())or _G
if type(vU.SAB_KILL)=="function"then vU.SAB_KILL()end for HW,Fh in ipairs({"SABFarmGui","SABToggle"})do local vV=J.PlayerGui:FindFirstChild(Fh)
if vV then vV:Destroy()end end end)pcall(function()local fm=Instance.new("ScreenGui")fm.Name="SABError"fm.ResetOnSpawn=false
fm.DisplayOrder=1000 local a3=Instance.new("TextBox")a3 .Size=UDim2 .new(0,340,0,170)a3 .Position=UDim2 .new(0,10,0,50)
a3 .BackgroundColor3=Color3 .fromRGB(90,20,20)a3 .TextColor3=Color3 .new(1,1,1)a3 .TextSize=11 a3 .TextWrapped=true
a3 .ClearTextOnFocus=false a3 .TextXAlignment=Enum.TextXAlignment.Left a3 .TextYAlignment=Enum.TextYAlignment.Top
a3 .Text="SAB "..bY.." failed to start. Send this text:\n"..tostring(nf)a3 .Parent=fm fm.Parent=J:WaitForChild("PlayerGui")
end)end
