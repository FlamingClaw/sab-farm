local bY="v27"local no=game:GetService("Players")local J=no.LocalPlayer or no.PlayerAdded:Wait()local function iu(v9)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bY,Text=v9,Duration=6})
end)end iu("script started")local function v_()local af=game:GetService("ReplicatedStorage")local am=game:GetService("Workspace")
local np=game:GetService("UserInputService")local cC=(type(getgenv)=="function"and getgenv())or _G if type(cC.SAB_KILL)=="function"then pcall(cC.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local iv=(function()local wa,wb=pcall(function()return game:GetService("VirtualUser")end)return wa and wb or nil end)()
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
local q,z,e,C,E,K,F={},{},{},{},{},{},{}local o,O={},{}local iw={}local ix,fo,dt,du={},{},{},{}local function T(nq)ix[#ix+1]=nq return nq end
local function ag(wc)task.wait(wc)if not c.alive then error(iw,0)end end local function A(fp)fp=os.date("%H:%M:%S").." "..tostring(fp)
table.insert(fo,1,fp)if#fo>6 then table.remove(fo)end c.logN=(c.logN or 0)+1 dt[#dt+1]=fp if#dt>80 then table.remove(dt,1)end
end local function fq(nr)if type(nr)~="string"then return""end return(nr:lower():gsub("[^%w]",""))end local function W(wd)
local ns=fq(wd)local iy=ns:gsub("butter$","")if iy==""then iy=ns end return iy end local function aK(nt)if type(nt)~="string"then return false end
local iz=W(nt)if iz==""then return false end if o.want then return o.want(iz)end return d.Targets[iz]==true end
local function we(dv)dv=dv:lower()return dv:find("squishy",1,true)~=nil or dv:match("butter$")~=nil or dv:match("butter[^%a]")~=nil
end local iA={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aL(dw)if type(dw)~="number"then return"?"end
local fr=1 while math.abs(dw)>=1000 and fr<#iA do dw=dw/1000 fr=fr+1 end local wf=string.format("%.2f",dw):gsub("%.?0+$","")
return wf..iA[fr]end local function wg(nu)if type(nu)~="string"then return nil end local wh,dx=nu:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local iB=tonumber(wh)if not iB then return nil end if dx==""then return iB end local wi={qd="qa",qn="qi"}dx=wi[dx:lower()]or dx
for wj,wk in ipairs(iA)do if wk:lower()==dx:lower()then return iB*1000^(wj-1)end end return nil end local function ba()
local nv=J:GetAttribute("BoardValueMoney")if type(nv)=="number"then return nv end local nw=J:FindFirstChild("leaderstats")
if nw then for FE,wl in ipairs({"Cash","Money","Coins"})do local iC=nw:FindFirstChild(wl)if iC and type(iC.Value)=="number"then return iC.Value end
end end end local function fs(wm)local iD=wm:GetFullName()if c.plot then local iE=c.plot:GetFullName()if iD:sub(1,#iE)==iE then return iD:sub(#iE+2)end
end return iD end local function ap()local ft=J.Character if ft and ft:FindFirstChild("HumanoidRootPart")then
local nx=ft:FindFirstChildOfClass("Humanoid")if nx and nx.Health>0 then return ft end end end local function bw()
local iF=am:FindFirstChild("Plots")if not iF then return nil end local function ny(wn)local nz=wn:FindFirstChild("Plate")
return nz~=nil and nz:FindFirstChild("EditStackAttachment",true)~=nil end local nA=J:GetAttribute("PlotNumber")
if nA~=nil then local iG=iF:FindFirstChild(tostring(nA))if iG and ny(iG)then return iG end end for FF,nB in ipairs(iF:GetChildren())do
if ny(nB)then return nB end end end local function dy(nC)local bx=nC and nC.Parent for FG=1,6 do if not bx then return nil end
if bx:IsA("BasePart")then return bx end if bx:IsA("Model")then return bx.PrimaryPart or bx:FindFirstChildWhichIsA("BasePart",true)end
bx=bx.Parent end end local function nD(nE)local iH=nE.Parent if iH and iH:IsA("Attachment")then return iH.WorldPosition end
local nF=dy(nE)return nF and nF.Position end local function nG()local cD=c.plot and c.plot:FindFirstChild("Plate")
if not cD then return nil end if cD:IsA("BasePart")then return cD.Position end if cD:IsA("Model")then return cD:GetPivot().Position end
local nH=cD:FindFirstChildWhichIsA("BasePart",true)return nH and nH.Position end local function nI()local iI={}
local nJ=c.plot and c.plot:FindFirstChild("WaxStations")if nJ then for FH,wo in ipairs(nJ:GetChildren())do local nK=wo:FindFirstChild("SquishyPlaceHolder")
local iJ=nK and nK:FindFirstChild("PlacePrompt")if iJ and iJ:IsA("ProximityPrompt")then iI[#iI+1]=iJ end end end
return iI end local function fu()local nL,iK=nI(),0 for FI,wp in ipairs(nL)do if wp.Enabled then iK=iK+1 end end
local iL=#nL local iM=J:GetAttribute("WaxStations")if type(iM)=="number"and iM>iL then iL=iM end return iK,iL
end local function wq()local nM=ap()local nN=nM and nM.HumanoidRootPart.Position local iN,nO for FJ,iO in ipairs(nI())do
if iO.Enabled then local nP=nD(iO)local nQ=(nP and nN)and(nP-nN).Magnitude or 1e9 if not iN or nQ<nO then iN,nO=iO,nQ end
end end return iN end local function nR()local fv=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fv then return nil end local nS=fv:FindFirstChild("BuyPromptAttachment")local fw=(nS and nS:FindFirstChild("BuyPrompt"))or fv:FindFirstChild("BuyPrompt",true)
if fw and fw:IsA("ProximityPrompt")and fw:IsDescendantOf(fv)then return fw end end local nT={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local wr={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iP="SAB_order.txt"local function fy()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for ws,wt in pairs(aj.price)do aB[#aB+1]="P|"..ws.."|"..string.format("%.0f",wt)end for wu,wv in pairs(aj.order)do aB[#aB+1]="O|"..wu.."|"..table.concat(wv,",")end
if j.learned and j.enc then aB[#aB+1]="M|mode|"..tostring(j.learned.mode or"")for ww,fz in ipairs(j.learned.seq)do
local nU={}for nV=1,fz.n do nU[nV]=j.enc(fz.args[nV])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(ww,fz.m,fz.n,table.concat(nU,";"))
end end local function iQ(wx,wy,fA)local nW={}for nX=1,fA.n do nW[nX]=j.enc(fA.args[nX])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(wy,wx,fA.m,fA.n,table.concat(nW,";"))
end if j.enc then for wz,wA in ipairs(D.rec.rules)do iQ("rules",wz,wA)end if D.rec.on then iQ("on",0,D.rec.on)end
if D.rec.off then iQ("off",0,D.rec.off)end end for FK,dz in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dz.name,dz.title or"",dz.rar or"",dz.price and string.format("%.0f",dz.price)or"")
end if pcall(writefile,iP,table.concat(aB,"\n"))then aj.dirty=false end end local function wB()if type(isfile)~="function"or type(readfile)~="function"then return end
local wC,wD=pcall(isfile,iP)if not(wC and wD)then return end local wE,nY=pcall(readfile,iP)if not(wE and type(nY)=="string")then return end
for wF in nY:gmatch("[^\n]+")do local cE,cF,bc=wF:match("^(%a)|([^|]+)|(.*)$")if cE=="P"then aj.price[cF]=tonumber(bc)
elseif cE=="M"then j.loadMode=(bc~=""and bc~="nil")and bc or nil elseif cE=="A"and j.dec then local nZ=tonumber(cF)
local n0,fB,wG=bc:match("^([^|]+)|(%d+)|(.*)$")if nZ and n0 then fB=tonumber(fB)local n1,fC={},0 for wH in(wG..";"):gmatch("([^;]*);")do
fC=fC+1 if fC<=fB then n1[fC]=j.dec(wH)end end j.loadSeq=j.loadSeq or{}j.loadSeq[nZ]={m=n0,n=fB,args=n1}end elseif cE=="R"and j.dec then
local n2=tonumber(cF)local fD,wI,fE,wJ=bc:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if n2 and fD then fE=tonumber(fE)
local n3,fF={},0 for wK in(wJ..";"):gmatch("([^;]*);")do fF=fF+1 if fF<=fE then n3[fF]=j.dec(wK)end end local iR={m=wI,n=fE,args=n3}
if fD=="rules"then D.rec.rules[n2]=iR elseif fD=="on"then D.rec.on=iR elseif fD=="off"then D.rec.off=iR end end
elseif cE=="K"then local n4,n5,wL=bc:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cF)]={name=cF,title=n4~=""and n4 or nil,
rar=n5~=""and n5 or nil,price=tonumber(wL)}elseif cE=="O"and bc~=""then local fG={}for wM in bc:gmatch("[^,]+")do fG[#fG+1]=wM end
if#fG>0 then aj.order[cF]=fG end end end end local function wN(fH)if type(fH)~="table"then return end local bZ,n6=fH.rarity,fH.contents
if type(bZ)~="string"or bZ==""or type(n6)~="table"then return end local dA={}for FL,fI in ipairs(n6)do if type(fI)=="table"and type(fI.butter)=="string"then
dA[#dA+1]={n=fI.butter,ch=tonumber(fI.chance)or 0}end end if#dA==0 then return end table.sort(dA,function(wO,wP)return wO.ch>wP.ch end)
local dB,dC={},false for wQ,wR in ipairs(dA)do dB[wQ]=wR.n end local iS=aj.order[bZ]if not iS or#iS~=#dB then dC=true end
if not dC then for n7=1,#dB do if iS[n7]~=dB[n7]then dC=true break end end end aj.order[bZ]=dB local iT=tonumber(fH.price)
if iT and aj.price[bZ]~=iT then aj.price[bZ]=iT dC=true end if dC then aj.dirty=true ad.at=0 A("learned the "..bZ.." order from its crate")
end end local function cG(wS,wT)local wU=wS:FindFirstChild(wT,true)local wV,iU=pcall(function()return wU.Text end)
return(wV and type(iU)=="string"and iU~="")and iU or nil end local function ak(n8)return ad.pretty[n8]or n8 end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(wW)return fq(wW or"")end
function L.learn(bd)if type(bd)~="table"or type(bd.name)~="string"then return end local iV=L.key(bd.name)local be=L.seen[iV]or{}
local wX=(L.seen[iV]==nil)or(tonumber(bd.price)and be.price~=tonumber(bd.price))be.name,be.title=bd.name,bd.title or be.title
be.rar,be.price=bd.rarity or be.rar,tonumber(bd.price)or be.price L.seen[iV]=be if wX then L.at,aj.dirty=y(),true end
end function L.wanted(n9)if n9==nil then return false end local iW=L.key(n9)return d.CrateTicks[iW]==true or(d.BestCrate and o.bestCrate~=nil and(iW==o.bestCrate or iW==o.bestCrateTitle))
end function L.list()local cH={}for wY,fJ in ipairs(L.base)do cH[L.key(fJ[1])]={name=fJ[1],title=fJ[2],rar=fJ[3],i=wY}end
for FM,dD in ipairs(ad.rarOrder)do local n_=false for FN,wZ in pairs(cH)do if wZ.rar==dD then n_=true break end end
if not n_ and dD~="?"then local oa=dD:gsub("[^%w]","").."Crate"cH[L.key(oa)]={name=oa,title=dD.." Crate",rar=dD,i=50,guess=true}
end end for ob,fK in pairs(L.seen)do local a4=cH[ob]or{i=100}a4 .name,a4 .title,a4 .rar=fK.name or a4 .name,fK.title or a4 .title,fK.rar or a4 .rar
a4 .price,a4 .guess=fK.price or a4 .price,nil cH[ob]=a4 end local dE,fL={},{}for w0,w1 in ipairs(nT)do dE[w1]=w0 end
for w2,oc in ipairs(ad.rarOrder)do dE[oc]=dE[oc]or(20+w2)end for w3,dF in pairs(cH)do dF.k=w3 dF.price=dF.price or aj.price[dF.rar or""]
fL[#fL+1]=dF end table.sort(fL,function(b0,b1)if b0 .price and b1 .price and b0 .price~=b1 .price then return b0 .price<b1 .price end
local od,oe=dE[b0 .rar or""]or 99,dE[b1 .rar or""]or 99 if od~=oe then return od<oe end if(b0 .i or 100)~=(b1 .i or 100)then return(b0 .i or 100)<(b1 .i or 100)end
return b0 .k<b1 .k end)return fL end local function w4()local of=af:FindFirstChild("Assets")local og=of and of:FindFirstChild("Squishies")
if not og then return false end local iX,oh,cI={},{},{}local fM=0 for FO,fN in ipairs(og:GetChildren())do local dG=W(fN.Name)
if dG~=""and not iX[dG]then local fO=cG(fN,"RarityText")or"?"iX[dG]=fO oh[dG]=cG(fN,"NameText")or fN.Name cI[fO]=cI[fO]or{}
table.insert(cI[fO],dG)fM=fM+1 end end if fM==0 then return false end for oi,w5 in pairs(cI)do local oj=aj.order[oi]or wr[oi]
local iY={}if oj then for w6,w7 in ipairs(oj)do iY[W(w7)]=w6 end end table.sort(w5,function(ol,om)local iZ,i0=iY[ol],iY[om]
if iZ and i0 then return iZ<i0 end if iZ then return true end if i0 then return false end return ak(ol)<ak(om)
end)end local i1={}for w8,w9 in ipairs(nT)do i1[w9]=w8 end local fP,b2={},{}for w_ in pairs(cI)do fP[#fP+1]=w_ end
pcall(function()for xa,xb in ipairs(require(af.Modules.SquishyRNG).Keys)do b2[xb]=xa end end)table.sort(fP,function(cJ,cK)
if b2[cJ]and b2[cK]and b2[cJ]~=b2[cK]then return b2[cJ]<b2[cK]end local i2,i3=aj.price[cJ],aj.price[cK]if i2 and i3 and i2~=i3 then return i2<i3 end
local i4,i5=i1[cJ],i1[cK]if i4 and i5 then return i4<i5 end if i4 then return true end if i5 then return false end
return cJ<cK end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=iX,oh,cI,fP,fM,y()return true end local function i6()
if ad.at==0 or(y()-ad.at)>120 then pcall(w4)end return ad.n>0 end local function xc(xd)local oo=W(xd)return ad.rar[oo]or(V.name and W(V.name)==oo and V.rar)or"?"
end local function xe()local fQ={}local xf=((d.Best or 0)>0 and next(o.best or{}))and o.best or d.Targets for xg,xh in pairs(xf)do if xh then fQ[#fQ+1]=ak(xg)end end
table.sort(fQ)return fQ end local an={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function op()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fR(oq)if type(makefolder)~="function"then return end local xi,xj=pcall(isfolder,oq)if not(xi and xj)then pcall(makefolder,oq)end
end local function fS(ot)if type(isfile)~="function"or type(readfile)~="function"then return nil end local xk,xl=pcall(isfile,ot)
if not(xk and xl)then return nil end local xm,xn=pcall(readfile,ot)return xm and xn or nil end local function dH(xo,xp)
if type(writefile)~="function"then return false end return(pcall(writefile,xo,xp))end local function ou(xq)local dI={}
if type(listfiles)~="function"then return dI end local xr,ov=pcall(listfiles,xq)if not xr or type(ov)~="table"then return dI end
for FP,xs in ipairs(ov)do dI[#dI+1]=tostring(xs)end return dI end local function ow()local fT={}for FQ,xt in ipairs(ou(an.cfg))do
local ox=xt:match("([^/\\]+)%.txt$")if ox then fT[#fT+1]=ox end end table.sort(fT)return fT end local function xu()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(d.Every)aa[#aa+1]="N|GlazeLead|"..tostring(d.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(d.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(d.MemLimit)aa[#aa+1]="N|Best|"..tostring(d.Best or 0)for FR,oy in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..oy.."|"..d[oy]end
do local fU={}for xv,dJ in pairs(d.Pets)do local oz=(dJ.b and"b"or"")..(dJ.g and"g"or"")..(dJ.w and"w"or"")..((tonumber(dJ.f)or 0)>0 and tostring(dJ.f)or"")
if oz~=""then fU[#fU+1]=xv.."|"..oz end end table.sort(fU)aa[#aa+1]="P|-"for FS,xw in ipairs(fU)do aa[#aa+1]="P|"..xw end
end for FT,oA in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..oA.."|"..(d[oA]and"1"or"0")end local i7=J:GetAttribute("AutoRollRules")if type(i7)=="string"and i7~=""then d.ARrules,d.ARstop=i7,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then aa[#aa+1]="S|rules|"..d.ARrules aa[#aa+1]="S|stop|"..d.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for FV,i8 in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fV={}for xx,xy in pairs(i8[2])do if xy then fV[#fV+1]=xx end end table.sort(fV)aa[#aa+1]=i8[1].."|-"for FW,xz in ipairs(fV)do aa[#aa+1]=i8[1].."|"..xz end
end return table.concat(aa,"\n")end local function xA(i9)if type(i9)~="string"or i9==""then return false end local oB,oC,oD,oE,dK={},false,{},false,nil
for xC in i9:gmatch("[^\n]+")do local aC,ah,ax=xC:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ah=="Every"then local i_=tonumber(ax)
if i_ and i_>=1 then d.Every=math.floor(i_)end elseif aC=="N"and(ah=="FpsCap"or ah=="MemLimit")then local ja=tonumber(ax)
if ja and ja>=0 then d[ah]=math.floor(ja)end elseif aC=="N"and ah=="Best"then local fW=tonumber(ax)if fW and fW>=0 and fW<=4 then d.Best=math.floor(fW)end
elseif aC=="N"and ah=="GlazeLead"then local fX=tonumber(ax)if fX and fX>=5 and fX<=600 then d.GlazeLead=math.floor(fX)end
elseif aC=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then d[ah]=ax elseif aC=="P"and ah~=""then
if not dK then dK={}end if ah~="-"and ax~=""then dK[ah]={b=ax:find("b",1,true)and true or nil,g=ax:find("g",1,true)and true or nil,
w=ax:find("w",1,true)and true or nil,f=tonumber(ax:match("%d"))}end elseif aC=="B"then if d[ah]~=nil then d[ah]=(ax=="1")end
elseif aC=="S"and ah=="rules"then d.ARrules=ax elseif aC=="S"and ah=="stop"then d.ARstop=ax elseif aC=="W"then
c.winPos={tonumber(ah)or 10,tonumber(ax)or 44}elseif aC=="G"then c.togPos={tonumber(ah)or 10,tonumber(ax)or 300}
elseif aC=="T"and ah~=""then if ah~="-"then oB[ah]=true end oC=true elseif aC=="K"and ah~=""then if ah~="-"then oD[ah]=true end
oE=true end end if oC then d.Targets=oB end if oE then d.CrateTicks=oD end if dK then d.Pets=dK end return true
end local function fY(cL)if not op()then return false,"this executor cannot write files"end cL=(cL or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cL==""then return false,"give the config a name"end fR(an.dir)fR(an.cfg)if not dH(an.cfg.."/"..cL..".txt",xu())then return false,"could not write the file"end
c.config=cL return true,cL end local function oF(fZ)local oG=fS(an.cfg.."/"..fZ..".txt")if not oG then return false,"no config called "..tostring(fZ)end
if not xA(oG)then return false,"that config looks empty"end c.config=fZ return true,fZ end local function oH(jb)
if jb then fR(an.dir)dH(an.auto,jb)elseif type(delfile)=="function"then pcall(delfile,an.auto)else dH(an.auto,"")
end c.autoload=jb end local function xD()if c.selfPath then return c.selfPath end local f0 for FX,xE in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",an.dir})do
for FY,oI in ipairs(ou(xE))do local jc=oI:lower()if jc:sub(-4)==".lua"and(jc:find("sab_farm",1,true)or jc:find("sab farm",1,true))then
f0=f0 or oI end end end c.selfPath=f0 return f0 end an.stub=[[
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
local function xF()if not op()then return false,"this executor cannot write files"end fR("autoexec")if not dH(an.exec,an.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local f1=(function()local xG,xH=pcall(function()return game:GetService("TeleportService")end)return xG and xH or nil end)()
local function oJ()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local xI=queueonteleport or queue_on_teleport return(pcall(xI,an.stub))end local function dL(xJ)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..xJ..")")pcall(fy)if c.autoload then pcall(fY,c.autoload)end local xK=oJ()A(xK and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for FZ=1,30 do if not f1 then break end pcall(function()f1:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function xL()local xM,oK=pcall(function()return game:GetService("GuiService")end)if xM and oK then
pcall(function()T(oK.ErrorMessageChanged:Connect(function()if d.Rejoin then dL("roblox error message")end end))
end)end pcall(function()local oL=game:GetService("CoreGui")local oM=oL and oL:WaitForChild("RobloxPromptGui",15)
local oN=oM and oM:WaitForChild("promptOverlay",15)if oN then T(oN.ChildAdded:Connect(function(xN)if d.Rejoin and tostring(xN.Name):lower():find("errorprompt",1,true)then dL("disconnect prompt")end
end))end end)if f1 then pcall(function()T(f1 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dL("teleport retry")end)end
end))end)end end local function oO(xO)local oP=c.plot and c.plot:FindFirstChild(xO)if not oP then return nil,false end
for F0,jd in ipairs(oP:GetChildren())do if jd:IsA("Model")or jd:IsA("BasePart")then return jd,true end end return nil,true
end local function b3()local by=oO("RolledSquishy")if not by then return nil end return{model=by,name=by.Name,pretty=cG(by,"NameText")or ak(W(by.Name)),
rar=cG(by,"RarityText")or xc(by.Name),price=cG(by,"PriceText")}end local function oQ(je)return type(je)=="string"and(ad.rar[W(je)]~=nil or we(je))
end local function ac()local jf=oO("SquishyEquipped")if jf then c.carrySrc,j.heldAt="model",y()return jf.Name,jf end
local oR=J.Character if oR then for F1,dM in ipairs(oR:GetDescendants())do if(dM:IsA("Model")or dM:IsA("Tool"))and oQ(dM.Name)then
c.carrySrc,j.heldAt="character",y()return dM.Name,dM end end end local f2=J:GetAttribute("SquishyEquipped")if type(f2)=="string"and f2~=""and oQ(f2)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return f2,nil end c.carrySrc=nil end local function F2()local F3,xP=ac()return xP end local function dN()
local oS=b3()local jg=oS and wg(oS.price)local jh=ba()if jg and jh and jh<jg*0.5 then return jh,jg end end local function b4(xQ)
du[#du+1]=os.date("%H:%M:%S").." "..xQ if#du>40 then table.remove(du,1)end end local function xR(b5,f3)if type(b5)~="string"then return end
b4(("Roll(%s,%s)"):format(b5,tostring(f3)))if b5:lower():find("crate",1,true)then j.rolled,j.rolledAt=b5,y()return
end V.seq=V.seq+1 V.name,V.at=b5,y()V.rar=type(f3)=="string"and f3 or nil c.rolls=c.rolls+1 if aK(b5)then A(("ROLL %s [%s] = TARGET"):format(b5,tostring(f3)))end
end local function xS(b6)if type(b6)~="table"then return end local f4=b6 .butter or b6 .itemName if type(f4)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=f4,y()if type(b6 .giftId)=="string"then local oT=af:FindFirstChild("Remotes")
local oU=oT and oT:FindFirstChild("GiftThanks")if oU then pcall(function()oU:FireServer(b6 .giftId)end)end end
b4("Gift("..f4 .." from "..tostring(b6 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b6 .fromName),f4))
end local function xT()local oV=af:WaitForChild("Remotes",30)if not c.alive then return end if not oV then A("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local oW=J:GetAttribute("SquishyEquipped")
if type(oW)=="string"and oW~=""then j.heldAt=y()end end))local xZ={SquishyRollAnimation=xR,InitSquishy=function(oX)V.init,V.initAt=tostring(oX),y()b4("Init("..tostring(oX)..")")end,
CrateUpdate=function(cM,oY)pcall(wN,cM)pcall(L.learn,cM)if type(cM)=="table"then local xU=oY==true or(j.rolled~=nil and y()-j.rolledAt<15)or j.waiting
if not xU then return end local xV=not j.waiting local xW=j.on j.waiting,j.data,j.at=true,cM,y()j.on=(oY==true)
j.title=tostring(cM.title or cM.name or"crate")if j.on and not xW then j.openedAt,j.byYou=y(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then b4("CrateWindow open("..j.title..")")elseif xV then b4("Crate waiting("..j.title..")")A(j.title.." is waiting on your stand")
end else if j.waiting then b4("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local xX=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,xX)end if j.classify then local xY=y()
task.spawn(function()pcall(j.classify,xY)end)end end end,GiftReceived=xS,}for f5,x0 in pairs(xZ)do local ji=oV:FindFirstChild(f5)
if ji and ji:IsA("RemoteEvent")then T(ji.OnClientEvent:Connect(x0))elseif f5~="CrateUpdate"and f5~="GiftReceived"then A("remote "..f5 .." missing")end
end end local function jj()local b7=b3()if b7 then if aK(b7 .name)then return{state="match",shown=b7 .pretty,src="pad",info=b7}
end return{state="skip",info=b7,level="idle",text=("on pad: %s [%s] - not ticked"):format(b7 .pretty,tostring(b7 .rar))}
end if V.name and(y()-V.at)<4 then if aK(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f6(x1,x2,x3,x4)
local f7=RaycastParams.new()f7 .FilterType=Enum.RaycastFilterType.Exclude local jk={J.Character}for F4,x5 in ipairs(x4 or{})do jk[#jk+1]=x5 end
f7 .FilterDescendantsInstances=jk pcall(function()f7 .RespectCanCollide=true end)local oZ=am:Raycast(Vector3 .new(x1,x2+4,x3),Vector3 .new(0,-30,0),f7)
return oZ and oZ.Position or nil end local function cN(o0)local o1=o0:FindFirstChildOfClass("Humanoid")return((o1 and o1 .HipHeight)or 2)+o0 .HumanoidRootPart.Size.Y/2+0.2
end local function jl(x6,x7)local jm=x6:FindFirstChildOfClass("Humanoid")local x8=y()while y()-x8<x7 do if jm and(jm.FloorMaterial~=Enum.Material.Air or jm.SeatPart)then return true end
ag(0.05)end return false end local function aD(x9,jn,jo)local o2=x9 .HumanoidRootPart o2 .AssemblyLinearVelocity=Vector3 .new(0,0,0)
o2 .CFrame=jo and CFrame.new(jn,Vector3 .new(jo.X,jn.Y,jo.Z))or CFrame.new(jn)end local function b8(bf,o3)local b9=ap()
if not b9 or not bf then return false end local bz=bf.Position local f8=math.clamp(math.max(bf.Size.X,bf.Size.Z)/2+2.2,3,7)
local o4=(o3 and o3 .MaxActivationDistance)or 10 if f8>o4-2 then f8=math.max(2.5,o4-2)end local dO={}local function b_(dP)
dP=Vector3 .new(dP.X,0,dP.Z)if dP.Magnitude>0.05 then dO[#dO+1]=dP.Unit end end local o5=nG()if o5 then b_(o5-bz)end
b_(bf.CFrame.LookVector)b_(-bf.CFrame.LookVector)b_(bf.CFrame.RightVector)b_(-bf.CFrame.RightVector)b_(b9 .HumanoidRootPart.Position-bz)
if#dO==0 then b_(Vector3 .new(0,0,1))end local x_,f9=cN(b9),false for F5,ya in ipairs(dO)do local f_=bz+ya*f8
local jp=f6(f_.X,bz.Y,f_.Z,{bf})if jp and math.abs(jp.Y-bz.Y)<14 then aD(b9,Vector3 .new(f_.X,jp.Y+x_,f_.Z),bz)
if jl(b9,0.7)then f9=true break end end end if not f9 then aD(b9,bz+dO[1]*f8+Vector3 .new(0,3,0),bz)f9=jl(b9,1)
end ag(0.12)return f9 end local function o6(dQ)if not dQ.Parent or not dQ.Enabled then return false end pcall(function()dQ:InputHoldBegin()end)
ag(math.max(dQ.HoldDuration,0)+0.08)pcall(function()dQ:InputHoldEnd()end)return true end local function aq(o7,yb)
local yc=y()while y()-yc<yb do if o7()then return true end ag(0.05)end return o7()end local function dR(cO,yd,o8,ye)
local yf=c.zapFirst and{"zap","hold"}or{"hold","zap"}for yg,jq in ipairs(yf)do if yg==2 and(ye or not(cO.Parent and cO.Enabled and(not o8 or o8())))then break end
local jr if jq=="hold"then jr=o6(cO)else jr=type(fireproximityprompt)=="function"and cO.Parent~=nil and cO.Enabled and pcall(fireproximityprompt,cO)end
if jr and aq(yd,1.2)then c.zapFirst=(jq=="zap")return true,jq end end return false end local function o9(js)local bA=nR()
if not bA or not bA.Enabled then A("buy: nothing on the pad")return false end local jt=dy(bA)if not jt then A("buy: pad part missing")return false end
c.lastBuyAt=y()local yh,o_=V.seq,ba()local pa=ap()local yi=pa and(pa.HumanoidRootPart.Position-jt.Position).Magnitude>12
b8(jt,bA)if yi then ag(0.4)end if not bA.Enabled then A("buy aborted: pad emptied")return false end local cP=jj()
if not js and cP.state~="match"then A("buy aborted: "..(cP.text or"pad changed"))c.matchSince=nil return false
end local ju=cP.info and cP.info.name or(cP.state=="match"and V.name)or nil local function yj()return bA.Enabled and ac()==nil and(js or jj().state=="match")
end local yk,yl=dR(bA,function()return ac()~=nil or((not bA.Enabled)and(js or V.seq==yh))end,yj,dN()~=nil)if yk then
aq(function()return ac()~=nil end,0.8)local dS=ac()local pb=ba()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dS and ak(W(dS))or(cP.shown or"?"),(o_ and pb)and(" for $"..aL(o_-pb))or"",yl))
if dS and ju and W(dS)~=W(ju)then A(("note: picked up %s, not %s"):format(dS,ju))end return true end local ga=b3()
if dN()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aL(ba()),(ga and ga.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(ga and ga.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function pc()local dT=ac()if not dT then c.holding=false A("place: hands are empty")
return false end if not aK(dT)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dT))))return false end
for F6=1,d.PlaceTries do local bB=wq()if not bB then A("place: no free station")break end local pd=dy(bB)if pd then
b8(pd,bB)local pe=ac()if not pe then c.holding=false A("place: hands emptied on the way")return false end if not aK(pe)then A("place: what I carry changed, not waxing it")return false end
if bB.Enabled then local ym,yn=dR(bB,function()return not bB.Enabled end,function()return bB.Enabled end)if ym then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dT)),c.placed,bB.Parent.Parent.Name,yn))if o.placed then pcall(o.placed,dT)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))A(c.capMsg)end return false end function z.place()local yo=y()while c.alive and z.editing and y()-yo<25 do ag(0.2)end
if d.Teams and d.TeamWax~=""then z.placing=true local yp=y()while c.alive and z.current()~=d.TeamWax and y()-yp<5 do ag(0.1)end
if z.current()==d.TeamWax then ag(0.3)else A("wax team did not come on in time - placing anyway")end end local yq,pf=pcall(pc)
z.placing=false if not yq then error(pf,0)end return pf end local function pg(ph)return type(ph)=="string"and ph:lower():find("crate",1,true)~=nil
end local yr={SABFarmGui=1,SABToggle=1,SABError=1}local function jv(ys)local bC=ys while bC do if yr[bC.Name]then return false end
if bC:IsA("ScreenGui")then local yt,yu=pcall(function()return bC.Enabled end)return(not yt)or yu~=false end if bC:IsA("GuiObject")and not bC.Visible then return false end
bC=bC.Parent end return false end local function gb(gc)local cQ=""pcall(function()if gc:IsA("TextButton")then cQ=gc.Text end end)
if not cQ:find("%a")then for F7,gd in ipairs(gc:GetDescendants())do if(gd:IsA("TextLabel")or gd:IsA("TextButton"))and gd.Text:find("%a")then cQ=gd.Text break end
end end if not cQ:find("%a")then cQ=gc.Name end return(cQ:lower():gsub("[^%a]",""))end local function yv()local dU,dV
local pj=J:FindFirstChildOfClass("PlayerGui")if not pj then return nil,nil end for F8,dW in ipairs(pj:GetDescendants())do
if dW:IsA("GuiButton")and jv(dW)then local jw=gb(dW)if jw:sub(1,4)=="open"and not jw:find("shop",1,true)then dU=dU or dW end
if jw:sub(1,7)=="discard"then dV=dV or dW end end end if dU and dV then return dU,dV end if j.on then return dU,dV end
return nil,nil end local jx=(function()local yw,yx=pcall(function()return game:GetService("VirtualInputManager")end)return yw and yx or nil end)()
local function pk(bh,jy)local jz={}local function pl(yy)jz[#jz+1]=yy end if c.tapWay then pl(c.tapWay)end for F9,pm in ipairs({"touch","conn","signal"})do
if pm~=c.tapWay then pl(pm)end end local function pn(yz,...)local yA,jA=pcall(getconnections,yz)if not(yA and type(jA)=="table"and#jA>0)then return false end
local po,yB,yC=false,{...},select("#",...)for F_,yD in ipairs(jA)do if pcall(function()yD:Fire(table.unpack(yB,1,yC))end)then po=true end
end return po end local function pp()local pq=Vector3 .new(0,0,0)pcall(function()local ps,pt=bh.AbsolutePosition,bh.AbsoluteSize
pq=Vector3 .new(ps.X+pt.X/2,ps.Y+pt.Y/2,0)end)local jB={Position=pq,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jB.UserInputType=Enum.UserInputType.Touch end)pcall(function()jB.UserInputState=Enum.UserInputState.End end)
return jB end for Ga,bi in ipairs(jz)do local dX=false if bi=="conn"and type(getconnections)=="function"then if pn(bh.MouseButton1Click)then
dX=true if aq(jy,1.5)then c.tapWay=bi return true,bi end end dX=pn(bh.Activated,pp(),1)elseif bi=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bh.MouseButton1Click)then if aq(jy,1.5)then c.tapWay=bi return true,bi end end dX=pcall(firesignal,bh.Activated,pp(),1)
elseif bi=="touch"and jx then dX=pcall(function()local pu,pv=bh.AbsolutePosition,bh.AbsoluteSize local pw=0 local px=bh:FindFirstAncestorWhichIsA("ScreenGui")
local yE,yF=pcall(function()return px and px.IgnoreGuiInset end)if not(yE and yF)then pcall(function()pw=game:GetService("GuiService"):GetGuiInset().Y end)
end local py,pz=pu.X+pv.X/2,pu.Y+pv.Y/2+pw jx:SendMouseButtonEvent(py,pz,0,true,game,1)task.wait(0.06)jx:SendMouseButtonEvent(py,pz,0,false,game,1)
end)end if dX and aq(jy,1.5)then c.tapWay=bi return true,bi end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jC(pA)local dY=pA.Parent while dY and dY~=c.plot do if j.NOT[dY.Name]then return false end dY=dY.Parent
end local jD=(pA.ActionText or""):lower()if jD:find("roll",1,true)or jD:find("place",1,true)or jD:find("sell",1,true)then return false end
return true end local function pB()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local pC=c.plot:FindFirstChild("CrateStand")local dZ if pC then for Gb,ge in ipairs(pC:GetDescendants())do
if ge:IsA("ProximityPrompt")and ge.Enabled and jC(ge)then dZ=ge break end end end if not dZ then for Gc,bD in ipairs(c.plot:GetDescendants())do
if bD:IsA("ProximityPrompt")and bD.Enabled and jC(bD)then local pD=bD:FindFirstAncestorWhichIsA("Model")local yG=((bD.ActionText or"").." "..(bD.ObjectText or"").." "..bD.Name.." "..(pD and pD.Name or"")):lower()
if yG:find("crate",1,true)then dZ=bD break end end end end j.prompt=dZ return dZ end local function jE()if j.on then return true end
local d0=pB()if not d0 then j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local pE=dy(d0)if pE then b8(pE,d0)end j.ours=true dR(d0,function()return j.on end)if aq(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: pressed "..fs(d0).." but no window came up")
return false end do local function yH(pF)local cR=pF.Parent while cR and cR:IsA("GuiObject")do local pG,pH=false,false
for Gd,d1 in ipairs(cR:GetDescendants())do if d1~=pF and d1:IsA("GuiButton")and gb(d1):sub(1,7)=="discard"then pG=true end
if d1:IsA("TextLabel")then local jF=d1 .Text:lower()if jF:find("crate",1,true)or jF:find("can contain",1,true)or jF:find("cost",1,true)then pH=true end
end if pG and pH then return cR end end cR=cR.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local pI=J:FindFirstChildOfClass("PlayerGui")if not pI then return nil end for Ge,gf in ipairs(pI:GetDescendants())do
if gf:IsA("GuiButton")and not gf:FindFirstAncestor("SABFarmGui")and gb(gf):sub(1,4)=="open"then local jG=yH(gf)
if jG then j.win=jG return jG end end end end local function yI(yJ)for Gf,gg in ipairs(yJ:GetDescendants())do
if gg:IsA("GuiButton")then local pJ,jH=gb(gg),gg.Name:lower()if pJ=="x"or pJ=="close"or jH=="x"or jH:find("close",1,true)or jH:find("exit",1,true)then return gg end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(yK)task.wait(yK and 4 or 1.2)if j.on or j.waiting then return end
local gh=j.findWin()if not gh or not jv(gh)then return end local pK=yI(gh)if pK and pk(pK,function()return not jv(gh)end)then return end
A("the crate window is still open - tap its X")end end local function d2(gi)if not jE()then return false end local pL=y()-(j.openedAt or 0)
if pL<0.6 then ag(0.6-pL)end local jI=j.title local yL,yM=yv()local pM=gi and yL or yM if not pM then j.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(gi and"Open"or"Discard",jI))return false
end local yN=ac()local yO,Gg=pk(pM,function()return(not j.on)or(ac()~=nil and ac()~=yN)end)if not yO then j.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(gi and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gi then c.crates=c.crates+1 aq(function()return ac()~=nil end,1.5)local pN=ac()
A(("OPENED %s -> %s"):format(jI,pN and ak(W(pN))or"?"))else A("discarded "..jI.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(yP,...)local yQ=select("#",...)j.calls[#j.calls+1]={t=y(),m=yP,n=yQ,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aE,bj)local bE=type(aE)if(bE=="string"or bE=="number")and type(bj.data)=="table"then for pO,jJ in pairs(bj.data)do
if jJ==aE and type(pO)=="string"and(type(jJ)=="string"or type(jJ)=="number")then return{__slot="f:"..pO}end end
end if bE=="string"then if bj.crate and aE==bj.crate then return{__slot="crate"}end if bj.title and aE==bj.title then return{__slot="title"}end
if bj.rar and aE==bj.rar then return{__slot="rarity"}end return aE end if bE=="number"or bE=="boolean"or bE=="nil"then return aE end
if bE=="table"then local pP={}for yR,pQ in pairs(aE)do if type(pQ)=="table"then return nil,"nested table"end local yS,pR=j.slot(pQ,bj)
if pR then return nil,pR end pP[yR]=yS end return pP end local yT,yU=pcall(function()return aE:IsA("Instance")end)
if yT and yU then if aE==J then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gj=c.plot and c.plot:FindFirstChild("CrateStand")if gj and aE==gj then return{__slot="stand"}end if gj and aE.Parent==gj then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bE..")"end function j.resolve(gk)if type(gk)~="table"then return gk end
local aS=gk.__slot if aS and aS:sub(1,2)=="f:"then return j.data and j.data[aS:sub(3)]end if aS=="crate"then return j.data and j.data.name end
if aS=="title"then return(j.data and j.data.title)or j.title end if aS=="rarity"then return j.data and j.data.rarity end
if aS=="player"then return J end if aS=="plot"then return c.plot end if aS=="stand"or aS=="model"then local jK=c.plot and c.plot:FindFirstChild("CrateStand")
if aS=="stand"or not jK then return jK end for Gh,pS in ipairs(jK:GetChildren())do if pg(pS.Name)then return pS end end
return nil end local pT={}for yV,yW in pairs(gk)do pT[yV]=j.resolve(yW)end return pT end function j.classify(jL)
if j.directOff then return end local gl={}for Gi,jM in ipairs(j.calls)do if jM.t<=jL+0.05 and jL-jM.t<=6 then gl[#gl+1]=jM end
end if#gl==0 then return end if not aq(function()return(j.heldAt or 0)>=jL-1 end,2.5)then return end local d3={}
for Gj,d4 in ipairs(gl)do local pU={}for pV=1,d4 .n do local yX,pW=j.slot(d4 .args[pV],d4)if pW then A("crate call has "..pW.." - keeping the button method")
return end pU[pV]=yX end d3[#d3+1]={m=d4 .m,n=d4 .n,args=pU}end local jN=j.learned j.learned={seq=d3,mode=jN and jN.mode or nil}
aj.dirty=true if not jN then A(("learned how to open crates directly (%d call%s)"):format(#d3,#d3==1 and""or"s"))end
end function j.replay()local pX=j.learned local pY=af:FindFirstChild("Remotes")local jO=pY and pY:FindFirstChild("CrateAction")
if not(pX and jO)then return false end local pZ=table.unpack or unpack j.replaying=true for Gk,d5 in ipairs(pX.seq)do
local jP={}for p0=1,d5 .n do jP[p0]=j.resolve(d5 .args[p0])end task.spawn(function()pcall(function()if d5 .m=="InvokeServer"then jO:InvokeServer(pZ(jP,1,d5 .n))
else jO:FireServer(pZ(jP,1,d5 .n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(yY)return(yY:gsub("[%%|;=,\n]",function(yZ)return("%%%02X"):format(yZ:byte())end))end
function j.enc(ca)local gm=type(ca)if gm=="string"then return"s"..j.esc(ca)end if gm=="number"then return"n"..tostring(ca)end
if gm=="boolean"then return ca and"b1"or"b0"end if gm=="nil"then return"z"end if ca.__slot then return"k"..ca.__slot end
local jQ={}for y0,y1 in pairs(ca)do jQ[#jQ+1]=j.enc(y0).."="..j.enc(y1)end return"t"..table.concat(jQ,",")end
function j.dec(p1)local d6,d7=p1:sub(1,1),p1:sub(2)local function y2(y3)return(y3:gsub("%%(%x%x)",function(y4)return string.char(tonumber(y4,16))end))end
if d6=="s"then return y2(d7)end if d6=="n"then return tonumber(d7)end if d6=="b"then return d7=="1"end if d6=="k"then return{__slot=d7}end
if d6=="t"then local p2={}for y5 in d7:gmatch("[^,]+")do local p3,y6=y5:match("^(.-)=(.*)$")if p3 then local p4=j.dec(p3)
if p4~=nil then p2[p4]=j.dec(y6)end end end return p2 end return nil end function j.goneOrNew(y7)return function()
if not j.waiting then return true end local p5=ac()return p5~=nil and p5~=y7 end end function j.near()local p6=af:FindFirstChild("Remotes")
local jR=p6 and p6:FindFirstChild("CrateAction")local gn=ap()local jS=c.plot and c.plot:FindFirstChild("CrateStand")
local jT=jS and jS:FindFirstChild("Spot")if not(jR and gn and jT)then A(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not jR and"no CrateAction remote"or not gn and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jU=gn.HumanoidRootPart local go=jU.CFrame local p7,jV=j.title,"no answer"local y8=ac()local p8=jS:FindFirstChild("Holder")
local function p9()if not p8 then return j.waiting or j.on end for Gl,y9 in ipairs(p8:GetChildren())do if y9:IsA("Model")then return true end end
return false end for y_=1,3 do if not(j.waiting or j.on)or not p9()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end if(jU.Position-jT.Position).Magnitude>8 then b8(jT,j.prompt)end ag(0.12+0.15*y_)
local a5={}j.replaying=true task.spawn(function()a5 .ok,a5 .v=pcall(function()return jR:InvokeServer("open")end)
a5 .done=true end)aq(function()return a5 .done end,6)j.replaying=false local cb=a5 .v if a5 .done and a5 .ok and type(cb)=="table"and cb.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(p7,cb.prize and ak(W(tostring(cb.prize)))or"?"))
aq(function()local p_=ac()return p_~=nil and p_~=y8 end,1.5)if(jU.Position-go.Position).Magnitude>8 then pcall(function()aD(gn,go.Position,go.Position+go.LookVector)end)end
return true,"opened"end jV=(a5 .done and a5 .ok and type(cb)=="table")and tostring(cb.reason or"refused, no reason given")
or(a5 .done and("error: "..tostring(cb))or"no answer in 6s")ag(0.3)if not p9()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(p7,jV))
return false,jV end j.GIVEUP=600 function j.drop()local qa=af:FindFirstChild("Remotes")local qb=qa and qa:FindFirstChild("CrateAction")
local qc=c.plot and c.plot:FindFirstChild("CrateStand")local jW=qc and qc:FindFirstChild("Spot")local qe=ap()
if jW and qe and(qe.HumanoidRootPart.Position-jW.Position).Magnitude>8 then b8(jW,j.prompt)ag(0.3)end local jX,bk=false,nil
if qb then jX,bk=pcall(function()return qb:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(jX and type(bk)=="table"and bk.ok)and"done"or("answer: "..tostring(type(bk)=="table"and(bk.reason or bk.ok)or bk))))
j.waiting,j.on,j.quietUntil=false,false,y()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(jX and type(bk)=="table"and bk.ok)then d2(false)end end function j.smart()local jY=j.title if(j.nearFails or 0)<3 then
local za=j.near()if za then return true end if j.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local cc=j.learned if cc then local jZ=ac()if j.on then j.replay()if aq(j.goneOrNew(jZ),3.5)then c.crates=c.crates+1
A("OPENED "..jY.." (direct)")return true end else if cc.mode~="window"then j.replay()if aq(j.goneOrNew(jZ),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="direct"then cc.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..jY.." (direct, no window)")return true end end if jE()then j.replay()if aq(j.goneOrNew(jZ),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="window"then cc.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..jY.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,aj.dirty=cc,nil,true
if j.fails>=3 then j.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return d2(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for zb,qf in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(qf):Connect(function()D.cache[zb]=J:GetAttribute(qf)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(zc,...)local gp=D.cache
local zd={m=zc,n=select("#",...),args={...},before={rules=gp.rules,stop=gp.stop,on=gp.on,main=gp.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,zd)end end)end function D.learnOne(d8)local ay,d9=D.snap(),d8 .before local gq=(ay.rules~=d9 .rules)or(ay.stop~=d9 .stop)
local qg=(ay.on~=d9 .on)or(ay.main~=d9 .main)if not gq and not qg then return end local qh={}for qi=1,d8 .n do
local aM=d8 .args[qi]local cd=type(aM)if cd=="string"and aM~=""and aM==ay.rules then aM={__slot="rules"}elseif cd=="string"and aM~=""and gq and aM==ay.stop and ay.stop~=d9 .stop then aM={__slot="stop"}
elseif cd=="table"then local qj={}for ze,cS in pairs(aM)do if type(cS)=="table"or(type(cS)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end qj[ze]=(type(cS)=="string"and cS~=""and cS==ay.rules)and{__slot="rules"}or cS end aM=qj elseif cd~="string"and cd~="number"and cd~="boolean"and cd~="nil"then
if aM==J then aM={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end qh[qi]=aM
end local cT={m=d8 .m,n=d8 .n,args=qh}if gq then local j0=false for zf=1,cT.n do local d_=cT.args[zf]if type(d_)=="table"and d_.__slot=="rules"then j0=true end
if type(d_)=="table"and not d_.__slot then for Gm,qk in pairs(d_)do if type(qk)=="table"and qk.__slot=="rules"then j0=true end end
end end if j0 then D.rec.rules={cT}else table.insert(D.rec.rules,cT)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if qg then if ay.on==true then D.rec.on=cT else D.rec.off=cT end d.AutoRoll=(ay.on==true)end if ay.rules and ay.rules~=""then d.ARrules,d.ARstop=ay.rules,ay.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gq and"choices"or(ay.on and"on"or"off")))end
function D.resolve(cU)if type(cU)~="table"then return cU end if cU.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cU.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cU.__slot=="player"then return J end
local ql={}for zg,zh in pairs(cU)do ql[zg]=D.resolve(zh)end return ql end function D.replay(qm,zi)local qo=table.unpack or unpack
for Gn,ea in ipairs(zi)do local j1={}for qp=1,ea.n do j1[qp]=D.resolve(ea.args[qp])end D.replaying=true pcall(function()
if ea.m=="InvokeServer"then task.spawn(function()pcall(function()qm:InvokeServer(qo(j1,1,ea.n))end)end)else qm:FireServer(qo(j1,1,ea.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(qq,zj)if D.busy or not c.alive then return end D.busy=true
pcall(function()local qr=af:FindFirstChild("Remotes")local j2=qr and qr:FindFirstChild("AutoRollAction")if not j2 then D.msg="this game has no AutoRollAction"return end
local bF=d.AutoRoll if bF and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(j2,D.rec.rules)
if aq(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bF==D.isOn()or(not bF and not zj)then return end
local gr=bF and D.rec.on or D.rec.off if not gr then local eb=bF and D.rec.off or D.rec.on local qs=eb~=nil for zk=1,eb and eb.n or 0 do
if type(eb.args[zk])=="boolean"then qs=false end end if qs then gr=eb end end if not gr then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bF and"on"or"off")
A(D.msg)return end D.replay(j2,{gr})if aq(function()return D.isOn()==bF end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bF and"ON"or"OFF",qq and(" ("..qq..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local zl,zm=pcall(function()return J.UserId end)return zl and zm or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local zn,j3=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if zn and type(j3)=="table"and type(j3 .Pets)=="table"then q.I=j3 end return q.I end function q.order()if q.list then return q.list end
local bG=q.info()if not bG then return{}end local ce={}if type(bG.Order)=="table"and#bG.Order>0 then for Go,qt in ipairs(bG.Order)do if bG.Pets[qt]then ce[#ce+1]=qt end end
else for zo in pairs(bG.Pets)do ce[#ce+1]=zo end table.sort(ce,function(zp,zq)return(bG.Pets[zp].price or 0)<(bG.Pets[zq].price or 0)end)
end q.list=ce return ce end function q.nice(qu,j4)local qv=q.info()local qw=qv and qv.Pets[qu]return((j4 and j4~="")and(j4 .." ")or"")..(qw and qw.displayName or tostring(qu))
end function q.data()local gs=J:GetAttribute("PetsData")if type(gs)~="string"then return nil end if gs==q.rawD then return q.lastD end
local zr,ec=pcall(function()return q.HS:JSONDecode(gs)end)ec=(zr and type(ec)=="table")and ec or nil q.rawD,q.lastD=gs,ec
return ec end function q.pen()return af:FindFirstChild("PetMeadowSpawns")end function q.srv()return am:GetServerTimeNow()end
function q.money()local j5=J:FindFirstChild("MoneyValue")if j5 and type(j5 .Value)=="number"then return j5 .Value end
return ba()or 0 end function q.wishes()local qx=q.pen()local qy=qx and qx:GetAttribute("Wishes")local j6,qz={},q.srv()
if type(qy)~="string"then return j6 end local zs,qA=pcall(function()return q.HS:JSONDecode(qy)end)if zs and type(qA)=="table"then
for zt,j7 in pairs(qA)do if type(j7)=="number"and j7>qz then j6[zt]=j7-qz end end end return j6 end function q.call(...)
local qB=af:FindFirstChild("Remotes")local qC=qB and qB:FindFirstChild("PetRequest")if not qC then return nil end
local qD=table.pack(...)local cf={}task.spawn(function()cf.ok,cf.v=pcall(function()return qC:InvokeServer(table.unpack(qD,1,qD.n))end)
cf.done=true end)local zu=y()while not cf.done and y()-zu<6 do task.wait(0.05)end if cf.done and cf.ok then return cf.v end
return nil end function q.want(zv)return d.Pets[zv]end function q.closeNaming(j8)local qF=pcall(function()local qE=J:FindFirstChild("PlayerScripts")
local zw=qE and qE:FindFirstChild("Naming",true)require(zw).close()end)ag(0.5)if j8 .Visible then pcall(function()local qG=j8:FindFirstChild("NameBox",true)if qG then qG:ReleaseFocus()end end)
j8 .Visible=false qF=false end return qF end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qH=J:FindFirstChildOfClass("PlayerGui")
local qI=qH and qH:FindFirstChild("MainGui")local gt=qI and qI:FindFirstChild("PetNameGui")if gt and gt.Visible then
ag(0.4)if gt.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gt)break end end ag(0.25)end
q.namingOn=false end)end function q.buyTick()if not d.PetBuy then q.buyMsg="auto adopt is off"return end local j9,qJ,gu=q.info(),q.pen(),q.data()
if not(j9 and qJ and gu)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local ed,j_=#(gu.pets or{}),tonumber(gu.maxOwned)or 60
local zx,qK,ee=q.srv(),{},nil for Gp,aT in ipairs(qJ:GetChildren())do qK[aT.Name]=true local cg,gv=aT:GetAttribute("Pet"),aT:GetAttribute("Variant")or""
local ka=cg and q.want(cg)if ka and ka.b and j9 .Pets[cg]and(not ka.g or gv=="Big")and C.wantMore(cg,gv,gu)and not aT:GetAttribute("A_"..q.uid)
and(tonumber(aT:GetAttribute("ExpiresAt"))or 0)>zx+1 and y()>=(q.tryAt[aT.Name]or 0)then local ef,qL=q.nice(cg,gv),j9 .Pets[cg].price or 0
if ed>=j_ then ee=("%s is in the pen, but you have %d/%d pets"):format(ef,ed,j_)q.tryAt[aT.Name]=y()+15 elseif q.money()<qL then
ee=("%s is in the pen - need $%s"):format(ef,aL(qL))q.tryAt[aT.Name]=y()+5 else q.tryAt[aT.Name]=y()+8 local bH=q.call("adopt",aT.Name)
if type(bH)=="table"and bH.ok then ed=ed+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local zy=type(bH.pet)=="table"and bH.pet or{}
table.insert(q.recent,{id=tostring(zy.id or("?"..y())),name=cg,variant=gv,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..ef)q.skipNaming()ee="adopted "..ef else local qM=type(bH)=="table"and tostring(bH.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(ef,qM))ee="adopt failed: "..qM if type(bH)=="table"and bH.bagFull then q.tryAt[aT.Name]=y()+60 end
end end end end for qN in pairs(q.tryAt)do if not qK[qN]then q.tryAt[qN]=nil end end q.buyMsg=ee or("watching the pen (%d/%d pets)"):format(ed,j_)
end function q.wishTick()if not d.PetWish then q.wishMsg="auto wish is off"return end local gw=q.info()if not(gw and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local cj,kb,bI=q.wishes(),0,nil local zz=(type(gw.Wish)=="table"and gw.Wish.cashShare)or 2
local zA=q.data()for Gq,aA in ipairs(q.order())do local qO=q.want(aA)if qO and qO.w and C.wantMore(aA,"",zA)then
kb=kb+1 if not cj[aA]and y()>=(q.wishTry[aA]or 0)then local kc=tonumber(J:GetAttribute("PetWishCredits"))or 0
local kd=math.floor((gw.Pets[aA].price or 0)*zz)if kc<=0 and q.money()<kd then q.wishTry[aA]=y()+10 bI=("need $%s to wish for %s"):format(aL(kd),q.nice(aA))
q.wishWhy[aA]=bI else q.wishTry[aA]=y()+3 local zB=kc>0 and"wishCredit"or"wish"local gx=q.call(zB,aA)if type(gx)=="table"and gx.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),kc>0 and"free wish"or("$"..aL(kd))))
else local ke=type(gx)=="table"and tostring(gx.reason or"no reason given")or"no answer"if ke:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),ke))bI="wish failed: "..ke end end end end end end if not bI then
for Gr,gy in ipairs(q.order())do local qP=q.want(gy)if qP and qP.w and not cj[gy]and q.wishWhy[gy]then bI=q.wishWhy[gy]break end
end end if not bI then local cV={}for Gs,gz in ipairs(q.order())do local qQ=q.want(gz)if qQ and qQ.w and cj[gz]then cV[#cV+1]=("%s %dm"):format(q.nice(gz),math.ceil(cj[gz]/60))end
end local gA for Gt,gB in ipairs(q.order())do local qR=q.want(gB)if qR and qR.w and cj[gB]and(not gA or cj[gB]<gA)then gA=cj[gB]end
end bI=kb==0 and"no pet has WISH ticked"or(#cV==0 and"running: none yet")or(#cV<=3 and("running: "..table.concat(cV,", ")))
or("%d running, the next one ends in %dm"):format(#cV,math.ceil((gA or 0)/60))end q.wishMsg=bI end z.switches,z.glazed,z.finished=0,0,0
z.done,z.doneN,z.later={},0,{}function z.teams()local kf=q.data()return(kf and kf.teams)or{},kf end function z.current(cW)
cW=cW or q.data()if not cW then return""end local qS={}for Gu,zC in ipairs(cW.equipped or{})do qS[tostring(zC)]=true end
for Gv,qT in ipairs(cW.teams or{})do local qU=qT.pets or{}local kg=#qU==#(cW.equipped or{})if kg then for Gw,zD in ipairs(qU)do if not qS[tostring(zD)]then kg=false break end end end
if kg then return qT.name end end return""end function z.equip(kh)local zE,zF=z.teams()local ki for zG,zH in ipairs(zE)do if zH.name==kh then ki=zG break end end
if not ki then z.msg="no saved team called "..tostring(kh)return false end if z.current(zF)==kh then return true end
for Gx=1,4 do local qV=q.call("teamEquip",ki)if type(qV)=="table"and qV.ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(zI)local qW=zI:FindFirstChild("SquishyPlaceHolder")local qX=qW and qW:FindFirstChild("TimerGui")
local qY=qX and qX:FindFirstChildWhichIsA("TextLabel",true)local kj=qY and qY.Text if type(kj)~="string"or kj:find("-",1,true)then return nil end
local kk,qZ,q0=kj:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not kk then return nil end local q1=q0~=""and(tonumber(kk)*3600+tonumber(qZ)*60+tonumber(q0))or(tonumber(kk)*60+tonumber(qZ))
return q1>0 and q1 or nil end function z.waxes()local eg={}local q2=c.plot and c.plot:FindFirstChild("WaxStations")
if not q2 then return eg end local q3=q.srv()for Gy,a6 in ipairs(q2:GetChildren())do local kl=tonumber(a6:GetAttribute("PourEnd"))
local q4=a6:GetAttribute("PourOwner")if a6:GetAttribute("HasSquishy")and a6:GetAttribute("PourId")and(q4==nil or q4==q.uid)then
local km=z.left(a6)local q5=km and(q3+km)or((kl and kl>q3)and kl or nil)if q5 then local q6,q7=a6:FindFirstChild("SquishyPlaceHolder"),"?"
if q6 then for Gz,q8 in ipairs(q6:GetChildren())do if q8:IsA("Model")then q7=q8 .Name break end end end local zJ=tostring(a6:GetAttribute("Helpers")or"")
local kn=0 for GA in zJ:gmatch("%d+")do kn=kn+1 end eg[#eg+1]={st=a6,ends=q5,sure=km~=nil,id=a6:GetAttribute("PourId"),name=q7,helps=kn,
long=a6:GetAttribute("PourLong")==true}end end end table.sort(eg,function(zK,zL)return zK.ends<zL.ends end)return eg
end function z.glazeCount()local q9=af:FindFirstChild("Remotes")local q_=q9 and q9:FindFirstChild("EditStack")
if not q_ then return nil end local zM,eh=pcall(function()return q_:InvokeServer("State",nil)end)if not(zM and type(eh)=="table"and type(eh.state)=="table")then return nil end
local ko,kp=0,{}for GB,gC in ipairs(eh.state.entries or{})do if gC.glaze and gC.glaze~=""then ko=ko+1 kp[gC.glaze]=(kp[gC.glaze]or 0)+1 end
end return ko,kp,#(eh.state.entries or{}),eh.state.capacity end function z.finishedOne(gD,ra)z.finished=z.finished+1
task.wait(2)local kq,zN,rb,zO=z.glazeCount()if kq and ra and kq>ra then z.glazed=z.glazed+1 local kr={}for zP,zQ in pairs(zN)do kr[#kr+1]=zP.." "..zQ end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gD.name)),gD.st.Name,kq,table.concat(kr,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gD.st.Name,ak(W(gD.name)),rb and(" (stack "..rb.."/"..tostring(zO)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not d.Teams then z.want,z.msg="","auto teams is off"return end
local ck=q.srv()local aF=z.glazeFor if aF then local ei=aF.st local rc=ei.Parent and ei:GetAttribute("HasSquishy")and ei:GetAttribute("PourId")==aF.id
local rd=rc and z.left(ei)if rd then aF.ends=ck+rd end if not rc then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local zR=aF.before
task.spawn(function()pcall(z.finishedOne,aF,zR)end)end elseif aF.ends-ck>d.GlazeLead*3+60 or ck>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(ei.Name,z.clock(aF.ends-ck)))
end end if d.TeamGlaze~=""and not z.glazeFor then local zS=z.speedRatio(d.TeamGlaze)for GC,cl in ipairs(z.list)do
if cl.sure and(cl.ends-ck)*zS[cl.long and 2 or 1]<=d.GlazeLead and y()>=(z.later[cl.id or"?"]or 0)and not z.done[cl.id or"?"]then
z.glazeFor=cl task.spawn(function()cl.before=z.glazeCount()end)break end end end local aG,ej="",""local cX=d.SnapGlaze~=false and o.snapAt and(o.snapAt-ck)
if cX and cX<-8 then o.snapAt,cX=nil,nil end if d.TeamGlaze~=""and cX and cX<=20 then aG,ej=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cX)))
elseif d.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ej=d.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ej=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and z.allBusy()then
aG,ej=d.TeamFull," - every station is busy"else aG=d.TeamNormal end z.want=aG local ek=z.current()z.cur=ek if aG~=""and ek~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ej)else z.nextTry=y()+3 end end local ks=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(ek~=""and ek or"(not a saved team)",(aG~=""and aG~=ek)and(" -> "..aG)or"",
ks and("in "..z.clock(ks.ends-ck).." (st "..ks.st.Name..")")or"- none running")end function z.clock(bJ)bJ=math.max(0,math.floor(bJ))
if bJ>=3600 then return("%d:%02d:%02d"):format(math.floor(bJ/3600),math.floor((bJ%3600)/60),bJ%60)end return("%d:%02d"):format(math.floor(bJ/60),bJ%60)
end function z.allBusy()local zT,zU=fu()return zU>0 and zT==0 end function z.aboutToPlace()if not c.running then return false end
local rf=ac()if not(rf and aK(rf))then return false end local zV=fu()return zV>0 end function z.mult(rg,zW,rh)return{(1+rg)*(1+rh),(1+rg+zW)*(1+rh)}end
function z.speedNow()local function kt(zX)return tonumber(J:GetAttribute(zX))or 0 end return z.mult(kt("PetWaxSpeed"),kt("PetLongWax"),kt("PetSocialWax"))
end function z.speedOf(zY)local zZ,ri=z.teams()if not ri then return nil end for GD,rj in ipairs(zZ)do if rj.name==zY then
local ku={}for GE,z0 in ipairs(rj.pets or{})do for GF,rk in ipairs(ri.pets or{})do if tostring(rk.id)==tostring(z0)then ku[#ku+1]=rk break end end
end local rl=C.caps()local rm,z1=C.stats(ku)return z.mult(math.min(rm.waxSpeed or 0,rl.waxSpeed or 0.25),math.min(rm.longWax or 0,rl.longWax or 0.3),z1 .socialWax or 0)
end end return nil end function z.speedRatio(z2)local rn,kv=z.speedNow(),z.speedOf(z2)if not kv then return{1,1}end
return{rn[1]/kv[1],rn[2]/kv[2]}end function z.glazeSoon()return d.Teams and d.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local kw=q.info()return(kw and type(kw.Caps)=="table")and kw.Caps or C.CAPS
end function C.value(ro,kx)local gE=q.info()local cY=gE and gE.Pets[ro]if not(cY and type(cY.boost)=="table")then return nil end
local cm if type(gE.boostValue)=="function"then local z3,z4=pcall(gE.boostValue,ro,(kx~=""and kx)or nil)cm=z3 and tonumber(z4)or nil
end if not cm then cm=cY.boost.value or 0 if kx=="Big"then local rp=cm*1.5 cm=C.ROUND[cY.boost.kind]and math.max(cm+1,math.floor(rp+0.5))or rp
end end return cY.boost.kind,cm,cY.boost.every end function C.stats(z5)local cn,ky={},{}for GG,rq in ipairs(z5)do
local aU,gF,rr=C.value(rq.name,rq.variant or"")if aU then if aU:sub(1,6)=="social"then ky[aU]=math.max(ky[aU]or 0,gF)
elseif aU=="waxStir"or aU=="cashGift"then cn[aU]=(cn[aU]or 0)+gF*60/(rr or 60)elseif aU=="luckyPull"then cn.luckyPull=(cn.luckyPull or 0)+gF/(rr or 10)
else cn[aU]=(cn[aU]or 0)+gF end end end return cn,ky end function C.glazeGain(z6,gG)local el,kz,GH={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local z7=el[1]+el[2]+el[3]local z8=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cZ={}for gH=1,3 do cZ[gH]=el[gH]+z6*el[gH]/z7+(gH==1 and z8 or 0)end
local kA={cZ[1]*(1-gG),cZ[2]*(1-gG)+cZ[1]*gG,cZ[3]+cZ[2]*gG}return kA[1]*(kz[1]-1)+kA[2]*(kz[2]-1)+kA[3]*(kz[3]-1)
end function C.score(gI,z9)local kB=C.caps()local gJ,gK=C.stats(z9)local function bl(rs)return math.min(gJ[rs]or 0,kB[rs]or math.huge)end
local z_=(1+bl("income"))*(1+(gK.socialIncome or 0))*(1+math.min(gJ.cashGift or 0,kB.cashGiftPerMinute or 9)/60)
local Aa=1+bl("luck")+(gJ.luckyPull or 0)+(gK.socialLuck or 0)local rt=Aa*(1+bl("newFind"))*(1+bl("rollSpeed"))
local em=math.log(z_)local Ab=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local kC=(1+bl("waxSpeed")+bl("longWax"))*(1+(gK.socialWax or 0))
+math.min(gJ.waxStir or 0,kB.waxStirPerMinute or 30)/60/Ab local Ac=1-(1-bl("headStart"))*(1-(gK.socialHeadStart or 0))
if gI=="farm"then return em+0.7*math.log(rt)+0.1*math.log(kC)end if gI=="full"then return em+0.4*math.log(kC)+0.02*math.log(rt)end
if gI=="glaze"then return C.glazeGain(bl("glaze"),bl("glazeUp"))+0.001*em end if gI=="wax"then return-math.log(1-0.5*Ac)+0.001*em+0.001*math.log(kC)end
return em end function C.best(ru,c0,Ad,kD)kD=kD or{}local az,en={},{}local function rv(Ae)local rw={}for Af,Ag in ipairs(Ae)do rw[Af]=c0[Ag]end return rw end
local function kE(rx)local kF=C.score(ru,rv(rx))for GI,Ah in ipairs(rx)do if kD[c0[Ah].id]then kF=kF+1e-7 end end
return kF end for GJ=1,math.min(Ad,#c0)do local gL,kG for kH=1,#c0 do if not en[kH]then az[#az+1]=kH local ry=kE(az)
az[#az]=nil if not kG or ry>kG+1e-12 then gL,kG=kH,ry end end end if not gL then break end en[gL]=true az[#az+1]=gL
end for GK=1,6 do task.wait()local rz,rA=false,kE(az)for kI=1,#az do for kJ=1,#c0 do if not en[kJ]then local rB=az[kI]
az[kI]=kJ local rC=kE(az)if rC>rA+1e-9 then en[rB],en[kJ],rA,rz=nil,true,rC,true else az[kI]=rB end end end end
if not rz then break end end local rD={}for Ai,Aj in ipairs(az)do rD[Ai]=tostring(c0[Aj].id)end return rD,C.score(ru,rv(az))
end function C.count(rE,rF,Ak)local eo,ep={},0 local rG,rH={},{}for GL,Al in ipairs(rF.arriving or{})do rG[tostring(Al)]=true end
for GM,c1 in ipairs(rF.pets or{})do rH[tostring(c1 .id)]=true if c1 .name==rE and not rG[tostring(c1 .id)]then
if c1 .variant=="Big"then ep=ep+1 elseif(c1 .variant or"")==""then eo[#eo+1]=c1 end end end if not Ak then for GN,eq in ipairs(q.recent or{})do
if eq.name==rE and not rH[eq.id]and y()-eq.at<20 then if eq.variant=="Big"then ep=ep+1 else eo[#eo+1]=eq end end
end end return eo,ep end function C.goal(Am)local rI=d.Pets[Am]return rI and tonumber(rI.f)or 0 end function C.wantMore(rJ,An,rK)
local kK=C.goal(rJ)if kK<=0 or not rK then return true end local Ao,rL=C.count(rJ,rK)if rL>=kK then return false end
if An=="Big"then return true end return#Ao<C.need()*(kK-rL)end function C.status(rM,rN)local gM=C.goal(rM)if gM<=0 or not rN then return nil end
local Ap,kL=C.count(rM,rN)if kL>=gM then return("Big %d/%d done"):format(kL,gM)end return("%d/%d to fuse, Big %d/%d"):format(math.min(#Ap,C.need()),C.need(),kL,gM)
end function C.wear(kM)local kN={}for GO,Aq in ipairs(kM)do kN[tostring(Aq)]=true end for GP=1,3 do local c2=q.data()
if not c2 then return false end for GQ,rO in ipairs(c2 .equipped or{})do if not kN[tostring(rO)]then q.call("unequip",rO)task.wait(0.3)end
end c2=q.data()local rP={}for GR,Ar in ipairs(c2 .equipped or{})do rP[tostring(Ar)]=true end for GS,rQ in ipairs(kM)do
if not rP[tostring(rQ)]then q.call("equip",rQ)task.wait(0.3)end end task.wait(0.4)c2=q.data()local kO,rR=0,true
for GT,As in ipairs(c2 .equipped or{})do kO=kO+1 if not kN[tostring(As)]then rR=false end end if rR and kO==#kM then return true end
end return false end function C.saveTeam(rS,rT)if not C.wear(rT)then return false,"could not put the pets on"end
local At=z.teams()local co for Au,Av in ipairs(At)do if Av.name==rS then co=Au break end end local c3 if co then
c3=q.call("teamSave",co)else c3=q.call("teamNew")if type(c3)=="table"and c3 .ok and c3 .index then co=c3 .index
task.wait(0.3)q.call("teamRename",{index=co,name=rS})end end task.wait(0.4)local kP=q.data()local rU=kP and kP.teams and co and kP.teams[co]
if not rU then return false,"the game did not save it"end local rV={}for GU,Aw in ipairs(rU.pets or{})do rV[tostring(Aw)]=true end
for GV,Ax in ipairs(rT)do if not rV[tostring(Ax)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local Ay=q.srv()for GW,Az in ipairs(z.list or{})do if Az.ends-Ay<(d.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local er=q.data()if not er then return{}end local rW={}for GX,AA in ipairs(er.arriving or{})do rW[tostring(AA)]=true end
local es={}for GY,gN in ipairs(er.pets or{})do if not rW[tostring(gN.id)]then es[#es+1]={id=tostring(gN.id),name=gN.name,variant=gN.variant or""}end
end local rX={}for GZ,rY in ipairs(es)do rX[rY.id]=rY end local rZ=tonumber(er.slots)or 3 local kQ,r0={},{}for G0,gO in ipairs(C.ROLES)do
local et=d[gO[1]]if et~=""and not r0[et]then r0[et]=true local kR,eu,r1={},{},false for G1,r2 in ipairs(er.teams or{})do
if r2 .name==et then for G2,AB in ipairs(r2 .pets or{})do local kS=rX[tostring(AB)]if kS then kR[kS.id]=true eu[#eu+1]=kS else r1=true end
end end end local kT,r3=C.best(gO[2],es,rZ,kR)local r4=C.score(gO[2],eu)local r5=#kT==#eu for G3,AC in ipairs(kT)do if not kR[AC]then r5=false end end
if not r5 and(r1 or#eu<math.min(rZ,#es)or r3>r4+1e-4)then kQ[#kQ+1]={team=et,role=gO[2],ids=kT,gain=r3-r4}end
end end return kQ end function C.rebuild(AD)local r6=C.plan()if#r6==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gP=true local AH,AI=pcall(function()for G4,ev in ipairs(r6)do local AE,AF=C.saveTeam(ev.team,ev.ids)local r7=q.data()
local kU={}for G5,AG in ipairs(ev.ids)do for G6,kV in ipairs(r7 and r7 .pets or{})do if tostring(kV.id)==AG then kU[#kU+1]=q.nice(kV.name,kV.variant)end
end end if AE then A(("TEAM %s rebuilt (%s): %s"):format(ev.team,AD or"pets changed",table.concat(kU,", ")))else gP=false A(("TEAM %s: %s"):format(ev.team,tostring(AF)))end
end end)z.editing,z.nextTry=false,0 if not AH then gP=false A("TEAM BUILD ERR "..tostring(AI))end C.builds=C.builds+1
C.buildMsg=gP and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gP end
function C.fuseTick()if not d.AutoFuse or z.editing then return end local gQ=q.data()if not gQ then return end
local kW=C.need()local kX,gR={},{}for G7,AJ in ipairs(gQ.teams or{})do for G8,AK in ipairs(AJ.pets or{})do kX[tostring(AK)]=true end end
for G9,AL in ipairs(gQ.equipped or{})do gR[tostring(AL)]=true end C.failUntil=C.failUntil or{}for cp,AM in pairs(d.Pets)do
local r8=tonumber(AM.f)or 0 local kY,AN=C.count(cp,gQ,true)if r8>0 and AN<r8 and#kY>=kW and y()>=(C.failUntil[cp]or 0)then
table.sort(kY,function(gS,gT)local r9=(gR[tostring(gS.id)]and 4 or 0)+(kX[tostring(gS.id)]and 2 or 0)+(gS.named and 1 or 0)
local r_=(gR[tostring(gT.id)]and 4 or 0)+(kX[tostring(gT.id)]and 2 or 0)+(gT.named and 1 or 0)if r9~=r_ then return r9<r_ end
return tostring(gS.id)<tostring(gT.id)end)local gU,kZ={},{}for gV=1,kW do gU[gV]=tostring(kY[gV].id)if gR[gU[gV]]then kZ[#kZ+1]=gU[gV]end
end z.editing,z.editingSince=true,y()for G_,AO in ipairs(kZ)do q.call("unequip",AO)task.wait(0.3)end local gW=q.call("fuse",{ids=gU})
z.editing,z.nextTry=false,0 if type(gW)=="table"and gW.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(kW,q.nice(cp),q.nice(cp)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(cp),os.date("%H:%M"))else C.failUntil[cp]=y()+120 A(("fuse %s failed: %s"):format(q.nice(cp),type(gW)=="table"and tostring(gW.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not d.AutoBuild or not d.Teams then return end local sa=q.data()
if not sa then return end local cq={}for Ha,AP in ipairs(sa.pets or{})do cq[#cq+1]=tostring(AP.id)end table.sort(cq)
cq=table.concat(cq,",")if cq~=C.sig then C.sig,C.dirtyAt=cq,y()end local AQ=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if AQ and not z.editing then local AS=C.rebuild(C.dirtyAt and"pets changed"or"check")if AS then C.dirtyAt,C.lastBuild=nil,y()end
end end e.bb,e.fx,e.post,e.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}e.watch=setmetatable({},{__mode="k"})
e.mem,e.memPeak,e.fps=0,0,0 function e.isFx(cr)return cr:IsA("ParticleEmitter")or cr:IsA("Trail")or cr:IsA("Beam")or cr:IsA("Fire")or cr:IsA("Smoke")
or cr:IsA("Sparkles")or cr:IsA("Light")end function e.muteOne(aH)if not d.Lite or not aH.Parent then return end
local gX=(aH:IsA("BillboardGui")and e.bb)or(e.isFx(aH)and e.fx)or nil if not gX or gX[aH]~=nil then return end
gX[aH]=aH.Enabled if aH.Enabled then aH.Enabled=false end e.watch[aH]=aH:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aH.Enabled then gX[aH]=true aH.Enabled=false end end)end function e.lite(sb)d.Lite=sb if sb then
task.spawn(function()for AT,AU in ipairs(am:GetDescendants())do if not d.Lite then return end pcall(e.muteOne,AU)
if AT%600==0 then task.wait()end end end)if not e.addConn then e.queue,e.muteI={},1 e.addConn=T(am.DescendantAdded:Connect(function(k0)
if d.Lite and(k0:IsA("BillboardGui")or e.isFx(k0))then e.queue[#e.queue+1]=k0 end end))end local k1=game:GetService("Lighting")
for Hb,ew in ipairs(k1:GetChildren())do if ew:IsA("PostEffect")and ew.Enabled and e.post[ew]==nil then e.post[ew]=true ew.Enabled=false end
end pcall(function()e.oldShadows=e.oldShadows==nil and k1 .GlobalShadows or e.oldShadows k1 .GlobalShadows=false end)
pcall(function()e.oldDeco=e.oldDeco==nil and am.Terrain.Decoration or e.oldDeco am.Terrain.Decoration=false end)
task.spawn(e.extras,true)else e.extras(false)for Hc,AV in pairs(e.watch)do pcall(function()AV:Disconnect()end)end
for sc,AW in pairs(e.bb)do pcall(function()if sc.Parent then sc.Enabled=AW end end)end for sd,AX in pairs(e.fx)do pcall(function()if sd.Parent then sd.Enabled=AX end end)end
for se in pairs(e.post)do pcall(function()if se.Parent then se.Enabled=true end end)end e.bb,e.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
e.watch,e.post,e.queue,e.muteI=setmetatable({},{__mode="k"}),{},{},1 local AY=game:GetService("Lighting")if e.oldShadows~=nil then pcall(function()AY.GlobalShadows=e.oldShadows end)e.oldShadows=nil end
if e.oldDeco~=nil then pcall(function()am.Terrain.Decoration=e.oldDeco end)e.oldDeco=nil end end end function e.fxPatch(sf)
local AZ,k2=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not AZ or type(k2)~="table"then return end if sf and not e.ceOld then e.ceOld={}for Hd,sh in ipairs({"Fireworks","Confetti"})do
local gY=k2[sh]if type(gY)=="table"and type(gY.Play)=="function"then e.ceOld[sh]=gY.Play pcall(function()gY.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not sf and e.ceOld then for A0,A1 in pairs(e.ceOld)do pcall(function()k2[A0].Play=A1 end)end e.ceOld=nil
end end function e.topsFind()if e.tc then return e.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local k3,gZ for He,ex in ipairs(getgc(false))do if type(ex)=="function"and(type(islclosure)~="function"or islclosure(ex))then
local A2,sj,sk=pcall(debug.info,ex,"sn")if A2 and type(sj)=="string"and sj:find("ToppingCullHandler",1,true)then
if sk=="poll"then k3=ex elseif sk=="retarget"then gZ=ex end end end end if not(k3 and gZ)then return nil end local A3,g0=pcall(debug.getupvalues,gZ)
local sl=A3 and type(g0)=="table"and g0[3]if type(sl)~="function"or debug.info(sl,"n")~="targetFor"or(g0[1]~=nil and type(g0[1])~="number")then return nil end
e.tc={poll=k3,re=gZ}return e.tc end function e.tops(sm)local aN=e.topsFind()if not aN then return false end if sm and not aN.old then
local A4,A5=pcall(hookfunction,aN.poll,function()end)if not A4 then return false end aN.old=A5 pcall(debug.setupvalue,aN.re,1,-1000)
pcall(aN.re)elseif not sm and aN.old then local A6=type(restorefunction)=="function"and pcall(restorefunction,aN.poll)
if not A6 then pcall(hookfunction,aN.poll,aN.old)end aN.old=nil pcall(aN.poll)end return true end e.lit,e.boardsOff={},{}
function e.lights(A7)local sn=am:FindFirstChild("Plots")local so=os.clock()if A7 then for Hf,A8 in ipairs(sn and sn:GetChildren()or{})do
local sp=A8:FindFirstChild("SkinProps")local sq=sp and sp:FindFirstChild("FairyLights")for Hg,sr in ipairs(sq and sq:GetChildren()or{})do
for Hh,ey in ipairs(sr:GetChildren())do if ey:IsA("BasePart")and(ey.Name=="Bulb"or ey.Name=="Wire")then e.lit[ey]=sr ey.Parent=nil end
end if os.clock()-so>0.002 then task.wait()so=os.clock()end end end for Hi,A9 in ipairs({"Leaderboards","ClanBoard"})do
local k4=am:FindFirstChild(A9)if k4 then e.boardsOff[k4]=true k4 .Parent=nil end end else for A_,ss in pairs(e.lit)do pcall(function()if ss.Parent then A_.Parent=ss end end)end
for su in pairs(e.boardsOff)do pcall(function()if not su.Parent then su.Parent=am end end)end e.lit,e.boardsOff={},{}
end end e.reel={}function e.rollFx(Ba)if Ba then local sv=af:FindFirstChild("Remotes")local sx=sv and sv:FindFirstChild("SquishyRollAnimation")
if not sx or type(getconnections)~="function"then return end local Bb,Bc=pcall(getconnections,sx.OnClientEvent)
for Hj,g1 in ipairs(Bb and Bc or{})do local k5=""pcall(function()k5=debug.info(g1 .Function,"s")end)if type(k5)=="string"and k5:find("SquishyHandler",1,true)and not e.reel[g1]then
if pcall(function()g1:Disable()end)then e.reel[g1]=true end end end else for Bd in pairs(e.reel)do pcall(function()Bd:Enable()end)end
e.reel={}end end e.quiet={}function e.quietPlots(Be)if not Be then for Bf in pairs(e.quiet)do pcall(function()Bf:Enable()end)end
e.quiet={}return end if type(getconnections)~="function"then return end local function k6(Bg,Bh)local Bi,Bj=pcall(getconnections,Bg)
for Hk,g2 in ipairs(Bi and Bj or{})do local k7=""pcall(function()k7=debug.info(g2 .Function,"s")end)if type(k7)=="string"and k7:find(Bh,1,true)and not e.quiet[g2]then
if pcall(function()g2:Disable()end)then e.quiet[g2]=true end end end end local sy=am:FindFirstChild("Plots")for Hl,g3 in ipairs(sy and sy:GetChildren()or{})do
if g3~=c.plot then k6(g3:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local sz,sA=g3:FindFirstChild("WaxStations"),g3:FindFirstChild("SquishyStack")
if sz then k6(sz.DescendantAdded,"LocalToppingsHandler")end if sA then k6(sA.ChildAdded,"LocalToppingsHandler")end
end end end function e.extras(g4)pcall(e.quietPlots,g4 and c.plot~=nil)pcall(e.fxPatch,g4)pcall(e.tops,g4)pcall(e.lights,g4)
end e.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function e.hideHud(sB)d.HideHud=sB local k8=J:FindFirstChildOfClass("PlayerGui")
if not k8 then return end if sB then for Hm,ez in ipairs(k8:GetChildren())do if ez:IsA("ScreenGui")and not e.MINE[ez.Name]and ez.Enabled then e.hud[ez]=true ez.Enabled=false end
end if not e.hudConn then e.hudConn=T(k8 .ChildAdded:Connect(function(eA)if d.HideHud and eA:IsA("ScreenGui")and not e.MINE[eA.Name]then
task.defer(function()if d.HideHud and eA.Enabled then e.hud[eA]=true eA.Enabled=false end end)end end))end else
for sC in pairs(e.hud)do pcall(function()if sC.Parent then sC.Enabled=true end end)end e.hud={}end end e.CAPS={0,30,15,10}
function e.cap(k9)d.FpsCap=k9 local sD=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not sD then return false end return pcall(sD,k9==0 and 60 or k9)end e.unseen=setmetatable({},{__mode="k"})
function e.hideOne(ao)if ao:IsA("BasePart")or ao:IsA("Decal")or ao:IsA("Texture")then if ao.Transparency<1 then e.unseen[ao]=ao.Transparency ao.Transparency=1 end
elseif ao:IsA("BillboardGui")or ao:IsA("SurfaceGui")or ao:IsA("ParticleEmitter")or ao:IsA("Beam")or ao:IsA("Trail")or ao:IsA("Light")or ao:IsA("Fire")or ao:IsA("Smoke")or ao:IsA("Sparkles")then
if ao.Enabled then e.unseen[ao]=true ao.Enabled=false end end end function e.notMine(Bk)return d.HideMine or(c.plot and not Bk:IsDescendantOf(c.plot))end
e.hideQ,e.hideI={},1 function e.hideStep()local sE=os.clock()local eB=e.queue if d.Lite and eB and#eB>0 then e.muteI=e.muteI or 1
while e.muteI<=#eB and os.clock()-sE<0.0015 do pcall(e.muteOne,eB[e.muteI])e.muteI=e.muteI+1 end if e.muteI>#eB then e.queue,e.muteI={},1 end
end local g5=e.hideQ if e.hideI>#g5 then return end while e.hideI<=#g5 and os.clock()-sE<0.002 do local k_=g5[e.hideI]
e.hideI=e.hideI+1 if d.HideBases and k_.Parent and e.notMine(k_)then pcall(e.hideOne,k_)end end if e.hideI>#g5 then e.hideQ,e.hideI={},1 end
end e.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function e.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function e.setBases(sF)if d.HideBases then e.bases(false)end d.HideMine=sF==2 if sF>0 then e.bases(true)end end
function e.bases(sG)d.HideBases=sG local la=am:FindFirstChild("Plots")if not la then return end if sG then task.spawn(function()
local lb=0 for Hn,sH in ipairs(la:GetChildren())do if sH~=c.plot or d.HideMine then for Ho,Bl in ipairs(sH:GetDescendants())do
if not d.HideBases then return end pcall(e.hideOne,Bl)lb=lb+1 if lb%600==0 then task.wait()end end end end end)
if not e.basesConn then e.basesConn=T(la.DescendantAdded:Connect(function(Bm)if d.HideBases then e.hideQ[#e.hideQ+1]=Bm end
end))end else for lc,sI in pairs(e.unseen)do pcall(function()if not lc.Parent then return end if type(sI)=="number"then lc.Transparency=sI else lc.Enabled=true end
end)end e.unseen=setmetatable({},{__mode="k"})end end function e.render(sJ)d.NoRender=sJ pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not sJ)end)
end e.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
e.calmed={}function e.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local Bn=game:GetService("RunService")
local ld=0 for Hp,Bo in ipairs({"RenderStepped","Heartbeat","Stepped"})do local Bp,sK=pcall(function()return Bn[Bo]end)
local sL,le=false,nil if Bp and sK then sL,le=pcall(getconnections,sK)end if sL and type(le)=="table"then for Hq,lf in ipairs(le)do
local lg=""pcall(function()local sM=getfenv(lf.Function).script lg=sM and sM:GetFullName()or""end)if lg~=""then
for Hr,Bq in ipairs(e.CALM)do if lg:find(Bq,1,true)then if pcall(function()lf:Disable()end)then e.calmed[#e.calmed+1]=lf ld=ld+1 end
break end end end end end end if#e.calmed>200 then local lh={}for Br=#e.calmed-49,#e.calmed do lh[#lh+1]=e.calmed[Br]end e.calmed=lh
end return ld end function e.calm(sN)d.Calm=sN if sN then local Bs=e.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(Bs))
else for Hs,Bt in ipairs(e.calmed)do pcall(function()Bt:Enable()end)end e.calmed={}end end function e.restoreAll()
pcall(e.unpin)pcall(e.calm,false)if d.HideBases then pcall(e.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(e.lite,false)pcall(e.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(e.cap,0)end end function e.rejoinSame(sO)if c.rejoining then return end A("REJOIN this server ("..sO..")")
pcall(fy)if c.autoload then pcall(fY,c.autoload)end oJ()local Bu=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then dL(sO..", same server failed")end end)return Bu end function e.tick()
if d.Lite and y()-(e.extraAt or 0)>5 then e.extraAt=y()pcall(e.lights,true)pcall(e.fxPatch,true)if c.plot then pcall(e.quietPlots,true)end
if not next(e.reel)then pcall(e.rollFx,true)end if not(e.tc and e.tc.old)and y()-(e.topsTry or-100)>60 then e.topsTry=y()pcall(e.tops,true)end
end local sP=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if sP then for Ht,Bv in ipairs(sP:GetChildren())do
local sQ=Bv:FindFirstChild("SquishyPlaceHolder")local cs=sQ and sQ:FindFirstChild("TimerGui")if cs and cs:IsA("BillboardGui")then
if e.bb[cs]==nil then pcall(e.muteOne,cs)elseif cs.Enabled then e.bb[cs]=true cs.Enabled=false end end end end
local Bw,eC=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Bw and type(eC)=="number"then
e.mem=eC e.memPeak=math.max(e.memPeak,eC)if(d.MemLimit or 0)>0 and eC>d.MemLimit then e.over=(e.over or 0)+1 if e.over>=30 and not c.busy then
e.over=-600 e.rejoinSame(("memory %d MB > %d MB"):format(eC,d.MemLimit))end elseif(e.over or 0)>0 then e.over=0
end end if y()-(e.noteAt or 0)>1800 then e.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(e.fps+0.5),e.mem,e.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function li(g6)if type(g6)~="string"then return false end
g6=g6:lower()for Hu,Bx in ipairs(c.sellWords)do if g6:find(Bx,1,true)then return true end end return false end
local function By()local sR=af:FindFirstChild("Remotes")local lj=sR and sR:FindFirstChild("SellSquishy")if not(lj and lj:IsA("RemoteEvent"))then return false end
if not pcall(function()lj:FireServer()end)then return false end return aq(function()return ac()==nil end,1.5)
end local function Bz()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local sS=ap()local sT=sS and sS.HumanoidRootPart.Position local eD,sU for Hv,c4 in ipairs((c.plot or am):GetDescendants())do
if c4:IsA("ProximityPrompt")and(li(c4 .ActionText)or li(c4 .ObjectText)or li(c4 .Name))then local sV=nD(c4)local lk=(sV and sT)and(sV-sT).Magnitude or 1e9
if lk<=400 and(not eD or lk<sU)then eD,sU=c4,lk end end end c.sellSpot=eD c.noSellSpot=(eD==nil)return eD end
local function sW()local ll=ac()if not ll then c.holding=false return false end if aK(ll)then return false end
local lm=ak(W(ll))if By()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..lm)return true end local c5=Bz()if c5 then local sX=dy(c5)if sX then b8(sX,c5)local sY=ac()if sY and not aK(sY)then
local BA,BB=dR(c5,function()return ac()==nil end,function()return c5 .Enabled end)if BA then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(lm,fs(c5),BB))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..lm.." ("..c.sellFails..")")
return false end local BC={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function BD(c6)local g7=fs(c6):lower()for Hw,BE in ipairs(BC)do if g7:find(BE,1,true)then return 0 end end
local a7,ar=c6 .Name:lower(),0 local function aV(BF,BG)return BF:find(BG,1,true)~=nil end if aV(a7,"collect")then ar=ar+60 end
if aV(a7,"cash")or aV(a7,"money")then ar=ar+45 end if aV(a7,"income")or aV(a7,"claim")then ar=ar+35 end if aV(a7,"coin")or aV(a7,"earn")or aV(a7,"green")then ar=ar+20 end
if a7=="pad"or a7=="touch"then ar=ar+25 end if ar==0 and(aV(g7,"collect")or aV(g7,"cash")or aV(g7,"money"))then ar=25 end
if ar==0 then return 0 end local eE=c6 .Color if eE.G>0.5 and eE.G>eE.R*1.4 and eE.G>eE.B*1.4 then ar=ar+15 end
if math.min(c6 .Size.X,c6 .Size.Y,c6 .Size.Z)<2 then ar=ar+5 end return ar end local function BH()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local g8,eF,ln={},nil,29 for Hx,g9 in ipairs(c.plot:GetDescendants())do
if g9:IsA("BasePart")then local g_=BD(g9)if g_>0 then g8[#g8+1]={s=g_,p=g9}if g_>ln then eF,ln=g9,g_ end end end
end table.sort(g8,function(BI,BJ)return BI.s>BJ.s end)c.padCands,c.padPart=g8,eF if eF then A("collect pad: "..fs(eF).." (score "..ln..")")end
return eF end local lo="SAB_pad_v1.txt"local function BK(BL)if type(writefile)=="function"then pcall(writefile,lo,table.concat({BL:GetComponents()},","))end
end local function BM()if type(isfile)~="function"or type(readfile)~="function"then return nil end local BN,sZ=pcall(function()if isfile(lo)then return readfile(lo)end end)
if not BN or type(sZ)~="string"then return nil end local ha={}for BO in sZ:gmatch("[^,]+")do ha[#ha+1]=tonumber(BO)end
if#ha==12 then return CFrame.new(unpack(ha))end end local function BP(lp,hb,BQ)local BR=cN(lp)local lq=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aW=(lq and lq:IsA("BasePart"))and(lq.Position-hb)or Vector3 .new(1,0,0)aW=Vector3 .new(aW.X,0,aW.Z)if aW.Magnitude<0.05 then aW=Vector3 .new(1,0,0)end
aW=aW.Unit for BS=0,7 do local hc=BS*math.pi/4 local BT=Vector3 .new(aW.X*math.cos(hc)-aW.Z*math.sin(hc),0,aW.X*math.sin(hc)+aW.Z*math.cos(hc))
local hd=hb+BT*(BQ+5)local lr=f6(hd.X,hb.Y,hd.Z)if lr and math.abs(lr.Y-hb.Y)<8 then aD(lp,Vector3 .new(hd.X,lr.Y+BR,hd.Z))
if jl(lp,0.7)then return true end end end return false end local function BU()c.lastCollect=y()local eG=ap()if not eG then return end
local s0,BV=eG.HumanoidRootPart,cN(eG)local eH,s1,eI,ls=nil,4,nil,"?"local lt=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and lt and lt:IsA("BasePart")then eH,ls=(lt.CFrame*c.manualPad).Position,"manual pad"else local bm=BH()
if bm then eH=Vector3 .new(bm.Position.X,bm.Position.Y+bm.Size.Y/2+BV,bm.Position.Z)s1,eI,ls=math.max(bm.Size.X,bm.Size.Z)/2,bm,bm.Name
end end if not eH then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local lu=ba()aD(eG,eH)
if eI and type(firetouchinterest)=="function"then pcall(firetouchinterest,s0,eI,0)end ag(d.PadDwell)if eI and type(firetouchinterest)=="function"then pcall(firetouchinterest,s0,eI,1)end
ag(0.5)c.collected=c.collected+1 local lv=ba()A(("COLLECTED (%s) %s"):format(ls,(lu and lv and lv>lu)and("+$"..aL(lv-lu))or"no cash change seen"))
BP(eG,eH,s1)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local s2=af:FindFirstChild("Modules")if not s2 then return false end local function lw(BW)local s3=s2:FindFirstChild(BW)
if not s3 then return nil end local BX,s4=pcall(require,s3)return(BX and type(s4)=="table")and s4 or nil end o.si,o.arm,o.ci=lw("SquishyInfo"),lw("AutoRollRules"),lw("CrateInfo")
o.modAt=y()if not o.si then return false end local lx={}if o.arm and type(o.arm.tierOf)=="table"then for ly in pairs(o.arm.tierOf)do
local he=o.si[ly]if type(he)=="table"and he.rarity~="Limited"and not he.incomeType and not he.hiddenAfter then lx[W(ly)]=ly end
end end o.roll=lx local hf={}for BY,BZ in pairs(lx)do local eJ=o.si[BZ]if type(eJ)=="table"and type(eJ.income)=="number"and not eJ.incomeType then
hf[#hf+1]={k=BY,inc=eJ.income,pr=tonumber(eJ.price)or 0}end end table.sort(hf,function(lz,lA)if lz.inc~=lA.inc then return lz.inc>lA.inc end return lz.pr>lA.pr end)
o.order=hf local hg,lB,lC local B0=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for B1,lD in pairs(B0)do
local lE=type(lD)=="table"and tonumber(lD.price)if lE and(not lB or lE>lB)then hg,lB,lC=B1,lE,lD.title end end
o.bestCrate,o.bestCrateName=hg and L.key(hg),hg o.bestCrateTitle=lC and L.key(lC)or nil return true end function o.rank(B2)
local B3,B4=pcall(function()return o.arm.rankOf(B2)end)return(B3 and tonumber(B4))or 0 end function o.loadDisc(s5)
if type(s5)~="table"then return end local s6={}for B5,B6 in pairs(s5)do if B6 then s6[W(tostring(B5))]=true end end
o.disc,o.discAt=s6,y()end function o.fetch()o.discAt=y()local s7=af:FindFirstChild("Remotes")local s8=s7 and s7:FindFirstChild("GetSquishiesDiscovered")
if not s8 then return end local B7,B8=pcall(function()return s8:InvokeServer()end)if B7 then o.loadDisc(B8)end
end function o.scanWax()local lF={}local s9=c.plot and c.plot:FindFirstChild("WaxStations")if s9 then for Hy,s_ in ipairs(s9:GetChildren())do
local ta=s_:FindFirstChild("SquishyPlaceHolder")if ta and s_:GetAttribute("HasSquishy")then for Hz,tb in ipairs(ta:GetChildren())do if tb:IsA("Model")then lF[W(tb.Name)]=true end end
end end end for td,B9 in pairs(o.placedAt)do if y()-B9<20 then lF[td]=true else o.placedAt[td]=nil end end o.waxing=lF
end function o.compute()local te,lG,lH={},0,0 if o.disc then for lI in pairs(o.roll or{})do if not o.disc[lI]then
if o.waxing[lI]then lH=lH+1 else te[lI],lG=true,lG+1 end end end end o.need,o.nNeed,o.nWax=te,lG,lH local tf,lJ={},d.Best or 0
local lK=(lJ==4)and o.stackMin or nil for B_,th in ipairs(o.order)do if(lK and th.inc>lK)or(not lK and B_<=(lJ==4 and 1 or lJ))then tf[th.k]=true end
end o.best=tf end function o.readStack()o.stackAt=y()local ti=af:FindFirstChild("Remotes")local tj=ti and ti:FindFirstChild("EditStack")
if not tj then return end local Ca,c7=pcall(function()return tj:InvokeServer("State",nil)end)if not(Ca and type(c7)=="table"and type(c7 .state)=="table"and type(c7 .state.entries)=="table")then return end
local hh for HA,tk in ipairs(c7 .state.entries)do local eK=type(tk)=="table"and o.si and o.si[tostring(tk.name)]
if type(eK)=="table"and type(eK.income)=="number"and not eK.incomeType and(not hh or eK.income<hh)then hh=eK.income end
end o.stackMin=hh o.stackFull=#c7 .state.entries>=(tonumber(c7 .state.capacity)or 100)end function o.want(lL)
if(d.Best or 0)>0 and(next(o.best)or(d.Best==4 and o.stackMin))then if o.best[lL]then return true end elseif d.Targets[lL]then
return true end return d.AutoIndex==true and o.need[lL]==true end function o.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(o.best)~=nil)or(d.AutoIndex and next(o.need)~=nil)
or d.Best==4 end function o.placed(Cb)local eL=W(Cb)o.placedAt[eL],o.waxing[eL]=y(),true if o.need[eL]then o.need[eL],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eL)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eM,eN={},{}for Cc,Cd in pairs(o.roll or{})do if o.want(Cc)then eM[Cd]=true end end
for tl,lM in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(tl)or(type(lM)=="table"and type(lM.title)=="string"and L.wanted(lM.title))then eN[tl]=true end
end if not next(eM)and not next(eN)then return nil end if o.arm and type(o.arm.encode)=="function"then local Ce,tm=pcall(o.arm.encode,{rarities={},butters=eM,crates=eN,index=false})
if Ce and type(tm)=="string"then return tm end end local function tn(Cf)local hi={}for Cg in pairs(Cf)do hi[#hi+1]=Cg end table.sort(hi)return table.concat(hi,",")end
local eO="adv:"if next(eM)then eO=eO..";butters:"..tn(eM)end if next(eN)then eO=eO..";crates:"..tn(eN)end return eO
end function o.canon(Ch)local hj={}for to in tostring(Ch or""):gmatch("[^;]+")do local lN,tp=to:match("^(%a+):(.*)$")
if not lN then lN,tp="r",to:gsub("^adv:","")end for Ci in tp:gmatch("[^,]+")do hj[#hj+1]=lN.."="..Ci end end table.sort(hj)
return table.concat(hj,"|")end function o.sync(Cj)if J:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local ct=o.rulesNow()if not ct or#ct>1900 then return end if o.canon(J:GetAttribute("AutoRollRules"))==o.canon(ct)then o.fails=0 return end
if not Cj and y()-o.sentAt<4 then return end local tq=af:FindFirstChild("Remotes")local tr=tq and tq:FindFirstChild("AutoRollAction")
if not tr then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()tr:FireServer("Rules",ct)end)D.replaying=false d.ARrules=ct
local hk,hl=0,0 for HB in(ct:match("butters:([^;]*)")or""):gmatch("[^,]+")do hk=hk+1 end for HC in(ct:match("crates:([^;]*)")or""):gmatch("[^,]+")do hl=hl+1 end
local ts=hk.."/"..hl if o.told~=ts then o.told=ts A(("auto roll now stops on %d butters and %d crates"):format(hk,hl))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if d.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aO={}if d.AutoIndex then aO[#aO+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if d.Best==4 then local eP=0 for HD in pairs(o.best)do eP=eP+1 end
aO[#aO+1]=eP==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eP,eP==1 and""or"s")
elseif(d.Best or 0)>0 and o.order[1]then aO[#aO+1]="best: "..ak(o.order[1].k)end if d.BestCrate and o.bestCrateName then aO[#aO+1]="crate: "..o.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aO[#aO+1]="shower: "..O.got end o.msg=#aO>0 and table.concat(aO," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(Ck)o.feed[#o.feed+1]=os.date("%H:%M ")..Ck if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(tt,av,hm)if tt~="Effect"then o.feedAdd(tostring(tt)..(av~=nil and(": "..tostring(av):sub(1,80))or""))
return end if av~="ShowerTaken"and av~="GoalPoint"then o.feedAdd(tostring(av))end if av=="Shower"then O.add(hm)return end
if av=="ShowerTaken"then O.gone(hm)return end if av=="ShowerClear"then O.drops={}return end if av=="WaxGlow"then
local lO=type(hm)=="table"and tonumber(hm.SnapAt)if lO then o.snapAt=lO A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lO-q.srv()),(d.SnapGlaze~=false and d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end av=tostring(av)b4("Admin "..av)if av~="GoalPoint"and y()-(o.heard[av]or-100)>30 then o.heard[av]=y()
A("ADMIN: "..av)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(lP)if type(lP)~="table"or type(lP.Pieces)~="table"then return end
for HE,aX in pairs(lP.Pieces)do if type(aX)=="table"and aX.Id~=nil and aX.Position~=nil then O.drops[aX.Id]={id=aX.Id,butter=tostring(aX.Butter or"?"),rar=tostring(aX.Rarity or"?"),star=aX.Star==true,
pos=aX.Position,opens=tonumber(aX.OpensAt)or 0,ends=tonumber(aX.ExpiresAt)or 0}end end end function O.gone(eQ)
if type(eQ)~="table"or eQ.Id==nil then return end O.drops[eQ.Id]=nil if tonumber(eQ.UserId)==q.uid then O.mine=eQ.Id end
end function O.pick()local lQ=q.srv()local lR,tu for tv,cu in pairs(O.drops)do if lQ>=cu.ends-0.3 then O.drops[tv]=nil
elseif lQ>=cu.opens-0.2 and(O.tried[tv]or 0)<3 then local tw=(aK(cu.butter)and 1e6 or 0)+(cu.star and 1e5 or 0)+o.rank(cu.rar)*100-(cu.ends-lQ)
if not lR or tw>tu then lR,tu=cu,tw end end end return lR end function O.due()return d.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aP,lS=O.pick(),ap()if not(aP and lS)then return end O.tried[aP.id]=(O.tried[aP.id]or 0)+1
if e.hold then pcall(e.unpin,true)end aD(lS,aP.pos+Vector3 .new(0,cN(lS)+0.5,0))aq(function()return O.mine==aP.id or ac()~=nil or not O.drops[aP.id]end,1.5)
if O.mine==aP.id or ac()then O.got,O.drops[aP.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aP.butter)),aP.rar,aP.star and" (star)"or""))
elseif not O.drops[aP.id]then O.miss=O.miss+1 end end local eR local function tx()if c.capHit then if d.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eR(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ap()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bw(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local lT,ty=fu()
local hn=ac()if hn then local c8=ak(W(hn))if not aK(hn)then local lU=(V.gift and W(V.gift)==W(hn)and y()-V.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c8,lU),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c8,lU),"bad"end return"sell",("selling %s (%s)"):format(c8,lU),"warn"
end if lT<1 then return nil,("holding %s - 0 free stations"):format(c8),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c8),"wait"end
return"place",("waxing %s (%d free)"):format(c8,lT),"ok"end c.holding=false if d.Crates and not j.waiting and y()-(j.scanAt or 0)>1 and y()>(j.quietUntil or 0)then
j.scanAt=y()local lV=c.plot:FindFirstChild("CrateStand")if lV then for HF,eS in ipairs(lV:GetDescendants())do
if eS:IsA("ProximityPrompt")and eS.Enabled and jC(eS)then local bn=eS.ObjectText if bn==""then bn=cG(lV,"TitleLabel")or""end
if bn~=""and L.wanted(bn)then local Cl=fq(bn):gsub("crate$","")local tz for tA in pairs(ad.members)do if fq(tA)==Cl then tz=tA end end
j.waiting,j.at,j.title,j.prompt=true,y(),bn,eS j.data={name=(bn:gsub("%s","")),rarity=tz,title=bn}A(bn.." found waiting on your stand")
end break end end end end local tB=L.wanted(j.data and j.data.name)or L.wanted(j.title)if d.Crates and(j.on or j.waiting)and tB then
local aY=j.title if y()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aY),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aY.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aY),"bad"end if y()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aY),"bad"
end if j.byYou and y()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aY,math.ceil(60-(y()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aY),"ok"end if j.at and y()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aY,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if y()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aY,
math.ceil(45-(y()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil A("trying the "..aY.." again")
end if y()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aY),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aY,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not tB then local tC=j.title..tostring(j.rolledAt)if j.told~=tC then j.told=tC A(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and y()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if lT<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(ty,ty),"wait"
end local lW=nR()if not lW then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c9=b3()
if c9 and pg(c9 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(c9 .name),"idle"end
if y()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c9 .name),"bad"end if not pB()then return nil,("%s rolled - waiting for it to land on the stand"):format(c9 .name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c9 .name),"ok"end local bK=jj()if bK.state~="match"then
c.matchSince=nil if bK.state=="skip"and not lW.Enabled then return nil,bK.text.." (sold out)","idle"end return nil,bK.text,bK.level
end if not lW.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eT=y()if eT<c.noCashUntil then
local tD,Cm=dN()if tD then return nil,("cash short: have $%s, price ~$%s"):format(aL(tD),aL(Cm)),"bad"end return nil,(dN()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aL(ba()),math.ceil(c.noCashUntil-eT)),dN()and"bad"or"wait"end if eT-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eT local tE=eT-c.matchSince if tE<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bK.shown,tE),"ok"end
return"buy",("buying %s via %s"):format(bK.shown,bK.src),"ok"end e.DEPTH=11 function e.pinTick()local tF=e.hold
if not tF then return end local lX=J.Character local lY=lX and lX:FindFirstChild("HumanoidRootPart")if not lY then return end
lY.CFrame=tF lY.AssemblyLinearVelocity=Vector3 .new(0,0,0)for HG,ho in ipairs(lX:GetChildren())do if ho:IsA("BasePart")and ho.CanCollide then e.noclip[ho]=true ho.CanCollide=false end
end end e.noclip=setmetatable({},{__mode="k"})function e.pin(Cn,tG)e.hold=Cn if tG then e.surface=tG end end function e.unpin(Co)
if not e.hold then return end e.hold=nil for tH in pairs(e.noclip)do pcall(function()if tH.Parent then tH.CanCollide=true end end)end
e.noclip=setmetatable({},{__mode="k"})local tI=ap()if tI and e.surface and not Co then aD(tI,e.surface.Position,e.surface.Position+e.surface.LookVector)
ag(0.1)end end function e.home()local bo,tJ=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ap()
if not(bo and bo:IsA("BasePart")and tJ)then return nil end local tK=nG()or bo.Position local hp=Vector3 .new(tK.X-bo.Position.X,0,tK.Z-bo.Position.Z)
hp=hp.Magnitude>0.1 and hp.Unit or Vector3 .new(0,0,1)local hq=bo.Position+hp*6 local tL=f6(hq.X,bo.Position.Y,hq.Z,{bo})
return CFrame.new(hq.X,(tL and tL.Y or bo.Position.Y)+cN(tJ),hq.Z)end function e.ground(Cp,tM,Cq)local lZ,l0={J.Character},nil
for HH=1,12 do local l1=RaycastParams.new()l1 .FilterType=Enum.RaycastFilterType.Exclude l1 .FilterDescendantsInstances=lZ
local hr=am:Raycast(Vector3 .new(Cp,tM,Cq),Vector3 .new(0,-2000,0),l1)if not hr then break end l0,tM=hr,hr.Position.Y-0.05
lZ[#lZ+1]=hr.Instance end return l0 and l0 .Position.Y end function e.parkHome()local l2=e.home()if not l2 then return false end
local c_=l2 .Position local Cr=e.ground(c_.X,c_.Y+300,c_.Z)or(c_.Y-3)e.pin(CFrame.new(c_.X,Cr-8,c_.Z),l2)return true
end e.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function e.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function e.setGhost(hs)d.Ghost,d.GhostHelps=hs==2,hs==1 if hs<2 then task.spawn(function()while c.busy do ag(0.1)end
if e.ghostMode()<2 and e.hold and not E.home then pcall(e.unpin)end end)end e.paintGhost()A("ghost: "..e.GHOST[hs][1]:sub(8):lower())
end function e.cycleGhost()e.setGhost((e.ghostMode()+1)%3)end function e.parkTick()if not(d.Ghost and c.running)or e.hold or c.busy then return end
local Cs=ap()if not Cs or K.seat()then return end e.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local tN=J.Character local tO=tN and tN:FindFirstChildOfClass("Humanoid")local l3=tO and tO.SeatPart
return(l3 and l3 .Name=="LogSeat")and l3 or nil end function K.due()if not(d.Campfire and c.running)or y()<K.nextAt then return false end
local Ct=am:FindFirstChild("NightSeats")if not Ct then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or y()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(K.msg)return false end end return true end function K.sit()local tP,ht=am:FindFirstChild("NightSeats"),ap()
if not tP or not ht then return end local tQ,da=ht.HumanoidRootPart.Position,{}for HI,hu in ipairs(tP:GetChildren())do
local tR=hu:IsA("Seat")and hu.Occupant==nil and hu:FindFirstChildOfClass("ProximityPrompt")if tR then da[#da+1]={st=hu,p=tR}end
end if#da==0 then K.nextAt,K.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(da,function(Cu,Cv)return(Cu.st.Position-tQ).Magnitude<(Cv.st.Position-tQ).Magnitude end)
local Cw,Cx=da[1].st,da[1].p e.unpin(true)local db=Cw.CFrame aD(ht,db.Position+db.LookVector*2+Vector3 .new(0,2.5,0),db.Position)
ag(0.25)local Cy=dR(Cx,function()return K.seat()~=nil end)if not Cy then aD(ht,db.Position+Vector3 .new(0,2,0),db.Position+db.LookVector)
aq(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=y()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then A(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local l4=af:FindFirstChild("Remotes")if not l4 then return end local eU,l5,dc=0,0,{}
local Cz,tS=pcall(function()return l4 .ClanRequest:InvokeServer("state")end)local tT=Cz and type(tS)=="table"and tS.tasks
for HJ,bL in ipairs(tT and tT.list or{})do if not bL.done and bL.kind=="pull"then eU=math.max(eU,(bL.goal or 0)-(bL.progress or 0))end
if not bL.done then dc[#dc+1]=("%s %d/%d"):format(tostring(bL.text),bL.progress or 0,bL.goal or 0)end end F.events={}
for HK,dd in ipairs(l4:GetChildren())do if dd:IsA("RemoteFunction")and dd.Name:match("^%u%a+Action$")and dd.Name~="CrateAction"and dd.Name~="AutoRollAction"then
local CA,eV=pcall(function()return dd:InvokeServer("state")end)if CA and type(eV)=="table"and eV.live==true and type(eV.quests)=="table"then
F.events[#F.events+1]={r=dd,st=eV}for HL,aQ in ipairs(eV.quests)do if not aQ.done and aQ.kind=="pull"then eU=math.max(eU,(aQ.goal or 0)-(aQ.progress or 0))end
if not aQ.done and aQ.kind=="collect"then l5=math.max(l5,(aQ.goal or 0)-(aQ.progress or 0))end if not aQ.done then dc[#dc+1]=("%s %d/%d"):format(tostring(aQ.text),aQ.progress or 0,aQ.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eU,l5 F.msg=#dc>0 and("open: "..table.concat(dc,", "))or"all quests done for today"
end function F.claim()for HM,eW in ipairs(F.events)do local tU=eW.r.Name:gsub("Action$","")for HN,de in ipairs(eW.st.quests)do
if de.done and not de.claimed then local CB,tV=pcall(function()return eW.r:InvokeServer("claimQuest",de.id)end)
if CB and not(type(tV)=="table"and tV.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(tU,tostring(de.text),tostring(de.points or de.treats or"?")))
end ag(0.4)end end if eW.st.bonusReady==true then local CC=pcall(function()return eW.r:InvokeServer("claimBonus")end)
if CC then A(("CLAIMED %s daily quest bonus"):format(tU))end ag(0.4)end end end function F.tick()if not(d.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return d.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local tW=c.plot and c.plot:FindFirstChild("Lever")
local l6=tW and tW:FindFirstChild("Wheel")return l6 and l6:FindFirstChildWhichIsA("ProximityPrompt"),l6 end function F.resume(CD)
F.arPaused=false if F.arWas then F.arWas=false d.AutoRoll=true task.spawn(D.apply,CD)end end function F.pull()
local hv,l7=F.lever()if not hv or not l7 or not l7:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hv.Enabled then F.nextAt=y()+1 return end b8(l7,hv)F.asked=nil o6(hv)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
ag(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bM,CE)local l8=bM:GetAttribute("PourOwner")
if type(l8)~="number"or l8==q.uid or not bM:GetAttribute("HasSquishy")then return false end if bM:GetAttribute("PourLong")~=true or bM:GetAttribute("PourFull")==true then return false end
local l9=bM:GetAttribute("PourId")if l9==nil or E.skip[l9]then return false end local tX,l_,CG=bM:GetAttribute("Helpers"),0,tostring(q.uid)
if type(tX)=="string"then for CH in tX:gmatch("[^,%s]+")do l_=l_+1 if CH==CG then return false end end end if l_>=6 then return false end
local hw=z.left(bM)if not hw then local tY=tonumber(bM:GetAttribute("PourEnd"))hw=tY and(tY-CE)end if not hw or hw<=75 then return false end
local ma=game:GetService("Players"):GetPlayerByUserId(l8)if not ma or ma:GetAttribute("WaxHelpOff")==true then return false end
return true,ma,l9 end function E.list()local mb,CI={},q.srv()local tZ=am:FindFirstChild("Plots")for HO,t0 in ipairs(tZ and tZ:GetChildren()or{})do
local t1=t0~=c.plot and t0:FindFirstChild("WaxStations")for HP,mc in ipairs(t1 and t1:GetChildren()or{})do local CJ,CK,CL=E.can(mc,CI)
local md=CJ and mc:FindFirstChild("SquishyPlaceHolder")if md and md:IsA("BasePart")then mb[#mb+1]={st=mc,p=CK,id=CL,part=md}end
end end return mb end function E.due()return d.Help and c.running and y()>=E.nextAt end function E.skipIt(t2,t3)
E.skip[t2],E.skipN=t3,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[t2]=t3},1,{}end end function E.goHome()
local hx,bN=ap(),E.home E.home=nil if not(hx and bN)then return end if d.Ghost and not K.seat()then e.unpin(true)
if not e.parkHome()then pcall(aD,hx,bN.Position,bN.Position+bN.LookVector)end elseif e.hold or(hx.HumanoidRootPart.Position-bN.Position).Magnitude>20 then
e.unpin(true)pcall(aD,hx,bN.Position,bN.Position+bN.LookVector)end end function E.step()local me,eX=E.list(),ap()
if#me==0 or not eX then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local t4=eX.HumanoidRootPart local t5=t4 .Position table.sort(me,function(CM,CN)return(CM.part.Position-t5).Magnitude<(CN.part.Position-t5).Magnitude end)
local aZ=me[1]E.home=E.home or(e.hold and e.surface)or t4 .CFrame local bO=aZ.part local eY=(bO.Position+aZ.st:GetPivot().Position)/2
local hy=E.tries[aZ.id]or 0 if(d.Ghost or d.GhostHelps)and hy==0 and not K.seat()then e.pin(bO.CFrame,E.home)
else e.unpin(true)local mf=hy==0 and f6(eY.X,bO.Position.Y,eY.Z,{bO})if mf and math.abs(mf.Y-bO.Position.Y)<8 then
aD(eX,Vector3 .new(eY.X,mf.Y+cN(eX),eY.Z),bO.Position)else aD(eX,bO.Position+Vector3 .new(0,bO.Size.Y/2+3,0),eY)
end end ag(0.3)local eZ=af:FindFirstChild("Remotes")eZ=eZ and eZ:FindFirstChild("ClanRequest")if not eZ then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hz,bp=pcall(function()return eZ:InvokeServer("help",aZ.st:GetAttribute("PourOwner"),tonumber(aZ.st.Name))end)
if hz and type(bp)=="table"and bp.ok then E.n,E.fails=E.n+1,0 E.skipIt(aZ.id,"helped")A(("HELPED %s's wax (station %s)"):format(aZ.p.DisplayName,aZ.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hz and type(bp)=="table"and tostring(bp.reason or""):lower():find("walk up",1,true)and hy<2 then
E.tries[aZ.id]=hy+1 E.nextAt=y()+0.3 elseif hz and type(bp)=="table"and tostring(bp.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local t6=(hz and type(bp)=="table"and tostring(bp.reason or"refused"))or("error: "..tostring(bp))
E.skipIt(aZ.id,t6)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aZ.p.DisplayName,t6))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bq)if not d.HelpGuild or type(bq)~="table"or bq.p~="help"or bq.mine or bq.u==q.uid or not bq.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local e0=af:FindFirstChild("Remotes")
e0=e0 and e0:FindFirstChild("ClanRequest")if not e0 then return end local t7,e1=pcall(function()return e0:InvokeServer("callHelp",bq.u)end)
local t8=tostring(bq.n or bq.un or bq.u)if t7 and type(e1)=="table"and e1 .ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(t8))
else A(("guild call from %s: %s"):format(t8,(t7 and type(e1)=="table"and tostring(e1 .reason or"refused"))or tostring(e1)))
end end)end local function as(CO,t9,...)if c.busy then return end c.busy,c.busyText=true,CO if e.hold and t9~=E.step then pcall(e.unpin)end
local CP,t_=pcall(t9,...)c.busy,c.busyText=false,""if not CP and t_~=iw then A("ERR "..tostring(t_))end end local function CQ()
local aR,CS,CT=tx()c.reason,c.level=CS,CT if aR=="place"then as("waxing...",z.place)elseif aR=="crate"then as("opening crate...",d2,true)
elseif aR=="cratesmart"then as("opening crate...",j.smart)elseif aR=="cratewin"then as("opening the crate window...",jE)
elseif aR=="nocrate"then as("discarding crate...",d2,false)elseif aR=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aR=="sell"then as("selling...",sW)elseif aR=="buy"then as("buying...",o9,false)elseif not aR and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aR and not c.matchSince and K.due()then as("sitting at the campfire...",K.sit)
elseif not aR and not c.matchSince and F.pullDue()and not ac()and not(b3()and aK(b3().name))then as("pulling the lever for a quest...",F.pull)
elseif d.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
as("collecting money...",BU)elseif not aR and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not d.Help then
as("coming back...",E.goHome)elseif not c.busy then e.parkTick()end end function eR(hA,CU)if hA==c.running then return end
c.running=hA if not CU then d.AutoStart=hA end if hA then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bw()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bP=fS(an.auto)if type(bP)=="string"then bP=bP:gsub("%s+$","")
if bP~=""then c.autoload=bP local CV=oF(bP)A(CV and("loaded config "..bP)or("config "..bP.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local CW={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local mg={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local ua,ub,uc,ud=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if ua and ub and uc and ud then ae.x,ae.b,ae.m,ae.r=ua,ub,uc,ud end end)pcall(function()local ue=Enum.Font.RobotoMono if ue then ae.mono=ue end end)
local function H(CX,CY,CZ)local C0,mh=pcall(Instance.new,CX)if not C0 then c.uiErrs=c.uiErrs+1 return nil end
for C1,C2 in pairs(CY)do if not pcall(function()mh[C1]=C2 end)then c.uiErrs=c.uiErrs+1 end end mh.Parent=CZ return mh
end local function ab(C3,C4)H("UICorner",{CornerRadius=UDim.new(0,C4 or 8)},C3)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hB,mi)if hB and a.shown[hB]~=mi then a.shown[hB]=mi hB.Text=mi end
end function a.stroke(C5,C6,C7)return H("UIStroke",{Color=C6 or l.line,Thickness=1,Transparency=C7 or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},C5)
end function a.grad(C8,C9,C_,Da)local Db,uf=pcall(function()return ColorSequence.new(C9,C_)end)if Db and uf then return H("UIGradient",{Color=uf,Rotation=Da or 0},C8)end
end function a.pad(Dc,ug,uh,Dd,De)H("UIPadding",{PaddingLeft=UDim.new(0,ug or 0),PaddingTop=UDim.new(0,uh or 0),
PaddingRight=UDim.new(0,Dd or ug or 0),PaddingBottom=UDim.new(0,De or uh or 0)},Dc)end function a.list(Df,Dg,Dh)
return H("UIListLayout",{Padding=UDim.new(0,Dg or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Dh and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Df)
end function a.ink(mj)local Di,Dj=pcall(function()return 0.299*mj.R+0.587*mj.G+0.114*mj.B end)return(Di and Dj>0.55)and l.ink or l.text
end function a.nextIn(ui)local uj=(a.ord[ui]or 0)+1 a.ord[ui]=uj return uj end local mk=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local uk=mk:FindFirstChild("SABFarmGui")if uk then uk:Destroy()end local ml=H("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},mk)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local hC=am.CurrentCamera.ViewportSize if hC.X>100 and hC.Y>100 then Q.w=math.clamp(math.floor(hC.X*0.48),320,400)
Q.h=math.clamp(math.floor(hC.Y*0.86),250,360)end end)a.root=H("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},ml)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local ul=UDim2 .new(1,0,1,0)
local function HQ(um,uo)return UDim2 .new(um,0,0,0),UDim2 .new(uo,(um+uo>0.99)and 0 or-4,1,0)end local function ai(Dk,Dl,e2,Dm,Dn,Do)
local mm=H("TextButton",{Text=Dl,Position=Dn,Size=Do,BackgroundColor3=e2,BorderSizePixel=0,Font=ae.b,TextSize=Dm,TextColor3=a.ink(e2),AutoButtonColor=true},Dk)
ab(mm,8)if e2==l.panel2 or e2==l.raise or e2==l.panel then a.stroke(mm,l.line,0.4)end return mm end local function hD(Dp,Dq,Dr,Ds,Dt)
local hE=H("TextBox",{Text=Dq,PlaceholderText=Dr,Position=Ds,Size=Dt,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Dp)ab(hE,8)a.stroke(hE,l.line,0)a.pad(hE,9,0,6,0)
return hE end local hF=am.CurrentCamera local function Du()local Dv,hG=pcall(function()return hF and hF.ViewportSize end)
if Dv and hG and hG.X>50 and hG.Y>50 then return hG end end local function bQ(e3)local mn=Du()if not(mn and e3 and e3 .Parent)then return end
local Dw=pcall(function()local hH,up=e3 .AbsolutePosition,e3 .AbsoluteSize local mo=70 local uq=math.clamp(hH.X,mo-up.X,mn.X-mo)
local ur=math.clamp(hH.Y,0,mn.Y-math.min(up.Y,mo))if math.abs(uq-hH.X)>0.5 or math.abs(ur-hH.Y)>0.5 then e3 .Position=UDim2 .new(0,math.floor(uq),0,math.floor(ur))
end end)return Dw end local function hI(Dx)local Dy,mp=pcall(function()return Dx.AbsolutePosition end)if Dy and mp then return{math.floor(mp.X),math.floor(mp.Y)}end
end local df={}c.dragMoved={}local function us(e4,ut,mq)T(e4 .InputBegan:Connect(function(dg)if dg.UserInputType~=Enum.UserInputType.MouseButton1 and dg.UserInputType~=Enum.UserInputType.Touch then return end
local mr={start=dg.Position,from=ut.Position,moved=0,target=ut,input=dg,onDrop=mq}df[e4],c.dragMoved[e4]=mr,0
local ms ms=dg.Changed:Connect(function()if dg.UserInputState==Enum.UserInputState.End and df[e4]==mr then df[e4]=nil
if ms then ms:Disconnect()end if mq then mq(mr.moved)end end end)end))end T(np.InputChanged:Connect(function(hJ)
if hJ.UserInputType~=Enum.UserInputType.MouseMovement and hJ.UserInputType~=Enum.UserInputType.Touch then return end
for Dz,a8 in pairs(df)do local mt=a8 .target if mt and mt.Parent then local uu,uv=hJ.Position.X-a8 .start.X,hJ.Position.Y-a8 .start.Y
a8 .moved=math.max(a8 .moved,math.abs(uu)+math.abs(uv))c.dragMoved[Dz]=a8 .moved mt.Position=UDim2 .new(a8 .from.X.Scale,a8 .from.X.Offset+uu,a8 .from.Y.Scale,a8 .from.Y.Offset+uv)
end end end))T(np.InputEnded:Connect(function(hK)if hK.UserInputType~=Enum.UserInputType.MouseButton1 and hK.UserInputType~=Enum.UserInputType.Touch then return end
for DA,hL in pairs(df)do if hL.input==hK or hK.UserInputType==Enum.UserInputType.MouseButton1 then df[DA]=nil
if hL.onDrop then hL.onDrop(hL.moved)end end end end))local function P(DB,DC,DD,DE,DF,DG,DH)return H("TextLabel",{Text=DC,Position=DG or UDim2 .new(0,0,0,0),Size=DH or ul,BackgroundTransparency=1,
Font=DF and ae.b or ae.m,TextSize=DD,TextColor3=DE,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},DB)
end function a.row(uw,DI)return H("Frame",{Size=UDim2 .new(1,0,0,DI),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(uw)},uw)end function a.card(ux,uy,uz)local dh=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(ux)},ux)ab(dh,11)a.stroke(dh,l.line,0.25)a.list(dh,5)a.pad(dh,8,8,8,9)
if uy then local mu=a.row(dh,14)H("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},mu)P(mu,uy:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if uz then local DJ=P(mu,uz,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
DJ.TextXAlignment=Enum.TextXAlignment.Right end end return dh end function a.heading(DK,DL,mv)local mw=a.row(DK,mv and 34 or 22)
P(mw,DL,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if mv then P(mw,mv,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mw end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(mx)local aI=a.sw[mx]if not aI then return end
local di=tostring(mx.Text or""):match(":%s*(.-)%s*$")or""local bR=di~=""and not a.OFF[di]local my=not aI.chips and(di=="ON"or di=="OFF")
aI.pill.Visible,aI.chip.Visible=my,not my if my then aI.pill.BackgroundColor3=bR and l.accent or l.panel2 aI.knob.Position=bR and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aI.knob.BackgroundColor3=bR and l.white or l.dim else aI.chip.Text=di~=""and di or"-"aI.chip.BackgroundColor3=bR and l.accent or l.panel2
aI.chip.TextColor3=bR and l.ink or l.dim end mx.BackgroundColor3=bR and l.lit or l.raise if aI.edge then aI.edge.Color=bR and l.accent or l.line aI.edge.Transparency=bR and 0.55 or 0.45 end
end function a.switch(uA,DM,DN,e5)local a0=H("TextButton",{Name="Switch",Text=DM,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,e5 and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(uA)},uA)
ab(a0,9)local au={edge=a.stroke(a0,l.line,0.45)}au.title=P(a0,DN,11,l.text,true,UDim2 .new(0,10,0,e5 and 4 or 0),UDim2 .new(1,-100,0,e5 and 15 or 28))
au.title.TextWrapped,au.title.TextTruncate=false,Enum.TextTruncate.AtEnd if e5 then au.sub=P(a0,e5,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
au.sub.TextWrapped,au.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end au.pill=H("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a0)ab(au.pill,9)au.knob=H("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},au.pill)ab(au.knob,7)au.chip=H("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},a0)
ab(au.chip,9)a.pad(au.chip,10,0,10,0)H("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},au.chip)
au.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a0]=au T(a0:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a0)end))
a.skin(a0)return a0 end function a.chips(mz)if a.sw[mz]then a.sw[mz].chips=true a.skin(mz)end end function a.line(DO,DP)
local uB=a.row(DO,15)local uC=H("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=DP or l.dim,
BorderSizePixel=0},uB)ab(uC,3)local mA=P(uB,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mA.TextWrapped,mA.TextTruncate=false,Enum.TextTruncate.AtEnd
return mA,uC end function a.grow(uD,DQ,DR)local hM=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=DQ or 10,TextColor3=DR or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(uD)},uD)
T(hM:GetPropertyChangedSignal("Text"):Connect(function()hM.Visible=hM.Text~=""end))return hM end function a.note(DS,DT)
local uE=a.grow(DS,9,l.dim)uE.Text=DT return uE end function a.actions(DU,uF)local DV=a.row(DU,28)local uG,mB={},#uF
for e6,uH in ipairs(uF)do uG[e6]=ai(DV,uH[1],uH[2]or l.panel2,10,UDim2 .new((e6-1)/mB,e6>1 and 3 or 0,0,0),UDim2 .new(1/mB,(e6>1 and-3 or 0)+(e6<mB and-3 or 0),1,0))
end return table.unpack(uG)end local function M(cv,hN,DW,DX)a.put(cv,hN and DW or DX)if not a.sw[cv]and a.lit[cv]~=hN then
a.lit[cv]=hN cv.BackgroundColor3=hN and l.accent or l.panel2 cv.TextColor3=a.ink(cv.BackgroundColor3)end end a.title=H("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)H("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
H("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local mC=H("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(mC,8)a.grad(mC,l.accent,l.accent2,45)local uI=P(mC,"C",16,l.ink,true)uI.Font,uI.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local DY=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))DY.Font=ae.x P(a.title,"butter farm  "..bY,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local DZ=a.list(a.tabs,3)pcall(function()DZ.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function br(D0,D1,D2)
local hO=H("TextButton",{Text=D0,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(hO,9)local uJ=H("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hO)ab(uJ,2)a.tabsAll[#a.tabsAll+1]={b=hO,bar=uJ,name=D1,sub=D2}return hO end
a.tabFarm=br("🏠","Home","what the farm is doing")a.tabRun=br("🌾","Farm","the buy - wax - collect loop")a.tabBut=br("🧈","Butters","what gets bought and waxed")
a.tabCrt=br("📦","Crates","which crates get opened")a.tabPet=br("🐾","Pets","adopt, wish, fuse")a.tabTeam=br("👥","Teams","the right pets at the right moment")
a.tabSrv=br("🤝","Server","helping, campfire, ghost")a.tabAdm=br("⚡","Admin","admin abuse and its boosts")a.tabSet=br("⚙","Settings","configs, startup, performance")
local function bs()local mD=H("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mD,8)a.pad(mD,8,2,10,12)return mD end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs()a.farm.Visible=true
do local e7=a.farm local uK=a.row(e7,34)a.startB=ai(uK,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(uK,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local D3=a.row(e7,44)local function e8(uL,D4,uM)local hP=H("Frame",{Position=UDim2 .new((uL-1)/uM,uL>1 and 2 or 0,0,0),Size=UDim2 .new(1/uM,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},D3)ab(hP,9)a.stroke(hP,l.line,0.3)local hQ=P(hP,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hQ.Font,hQ.TextXAlignment,hQ.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local D5=P(hP,D4,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
D5 .TextXAlignment=Enum.TextXAlignment.Center return hQ end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e8(1,"BOUGHT",5),e8(2,"WAXED",5),e8(3,"SOLD",5),e8(4,"MONEY",5),e8(5,"FREE",5)
local uN=a.card(e7,"Right now")a.info=P(a.row(uN,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(uN,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local e9=a.card(e7,"Systems")
a.helpL=a.line(e9,l.info)a.campL=a.line(e9,l.accent2)a.questL=a.line(e9,l.good)a.arL=a.line(e9,l.accent)a.ixL=a.line(e9,mg.Dotonbori)
local uO=a.card(e7,"Activity")a.log=H("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(uO)},uO)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function HR(D6,D7)return a.row(D7 or a.farm,D6)end local al do local mE=a.run
a.heading(mE,"Farm","buy what rolls, wax it, collect the cash")local e_=a.card(mE,"Loop")a.colT=a.switch(e_,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(e_,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hD(al,tostring(d.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(e_,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(e_,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(e_,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local mF=a.card(mE,"By hand")
a.buyB,a.plB=a.actions(mF,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(mF,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(mF,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local hR=a.but a.heading(hR,"Butters","what gets bought and waxed")local uP=a.card(hR,"Strategy")a.ixT=a.switch(uP,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(uP,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hR)},hR)a.list(a.butList,5)end do local hS=a.crt a.heading(hS,"Crates","only ticked crates are opened")
local uQ=a.card(hS,"Opening")a.crateT=a.switch(uQ,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(uQ,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hS)},hS)a.list(a.crtList,5)end do local hT=a.pet a.heading(hT,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local fa=a.card(hT,"Automatic")a.pbT=a.switch(fa,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fa,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(fa,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(fa,10,l.dim)a.note(fa,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hT)},hT)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hU=a.srv a.heading(hU,"Server","other players, the campfire, staying hidden")
local mG=a.card(hU,"Helping")a.helpT=a.switch(mG,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(mG,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mG,l.info)
local uR=a.card(hU,"Campfire")a.campT=a.switch(uR,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(uR,l.accent2)local mH=a.card(hU,"Ghost")a.ghostT=a.switch(mH,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mH,l.dim)a.note(mH,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fb=a.adm a.heading(fb,"Admin abuse","the show, its boosts and the farm in it")local uS=a.card(fb,"When")
a.admBig=P(a.row(uS,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(uS,14),"",10,l.dim,false)local D8=a.card(fb,"Boosts now")
a.admBoost=a.grow(D8,11,l.text)local mI=a.card(fb,"What the farm does")a.shT=a.switch(mI,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mI,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(mI,l.accent)
local uT=a.card(fb,"Show feed")a.admFeed=H("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(uT)},uT)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local dj=a.set a.heading(dj,"Settings","kept on your phone, per config")
local hV=a.card(dj,"Config")al=a.row(hV,28)a.cfgName=hD(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hV,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hV,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(hV,10,l.dim)local mJ=a.card(dj,"Starting")a.startT=a.switch(mJ,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mJ,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(mJ,9,l.dim)local mK=a.card(dj,"If the game drops me")
a.rejT=a.switch(mK,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(mK,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(mK,9,l.dim)local bt=a.card(dj,"Performance")a.pfCalm=a.switch(bt,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bt,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bt,"BASES: ALL DRAWN","Bases","stop drawing other bases, or yours too")
a.pfFps=a.switch(bt,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bt,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bt,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bt,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hD(al,tostring(d.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bt,l.good)a.note(bt,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local D9=a.card(dj,"About")a.note(D9,"CHURN "..bY.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for HT,D_ in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(D_)end local uU=H("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},mk)
a.tgRoot=H("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},uU)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=H("TextButton",{Text="C",Size=ul,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=H("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=H("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()e.cycleGhost()end)function e.paintGhost()
local fc=e.ghostMode()if a.ghostT then a.put(a.ghostT,e.GHOST[fc][1])end if a.tgGhost then a.tgGhost.Text=e.GHOST[fc][2]
a.tgGhost.BackgroundColor3=fc==2 and l.accent or(fc==1 and l.warn or l.panel)a.tgGhost.TextColor3=fc>0 and l.ink or l.dim
end end local bu={built=false,boxes={},at=0}function a.check(hW,mL)hW.Text=mL and"✓"or""hW.BackgroundColor3=mL and l.accent or l.bg
hW.TextColor3=l.ink local mM=hW.Parent if mM and mM:IsA("TextButton")then mM.BackgroundColor3=mL and l.lit or l.raise end
end local function uV(uW,uX)d.Targets[uW]=uX or nil local uY=bu.boxes[uW]if uY then a.check(uY,uX)end end local function mN()
for Ea,Eb in pairs(bu.boxes)do a.check(Eb,d.Targets[Ea]==true)end end function a.tickBox(Ec)local mO=H("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Ec)ab(mO,6)
a.stroke(mO,l.line,0)return mO end local fd local function Ed()local Ee=a.card(a.butList,"Butter list")local mP=a.row(Ee,26)
a.butInfo=P(mP,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local Ef=ai(mP,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Eg=ai(mP,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))Ef.MouseButton1Click:Connect(function()
for Eh in pairs(d.Targets)do d.Targets[Eh]=nil end mN()end)Eg.MouseButton1Click:Connect(function()ad.at=0 i6()
fd(true)end)end fd=function(Ei)if not i6()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bu.built and not Ei and bu.at==ad.at then return end for HU,hX in ipairs(a.butList:GetChildren())do
if hX:IsA("Frame")or hX:IsA("TextButton")or hX:IsA("TextLabel")then hX:Destroy()end end bu.boxes,a.butEmpty={},nil
Ed()for HV,hY in ipairs(ad.rarOrder)do local mQ=mg[hY]or l.text local cw=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cw,11)a.stroke(cw,mQ,0.7)a.list(cw,4)a.pad(cw,7,7,7,8)
local mR=a.row(cw,22)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=mQ,BorderSizePixel=0},mR)
local Ej=P(mR,hY:upper(),11,mQ,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))Ej.Font=ae.x local Ek=ai(mR,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local El=hY Ek.MouseButton1Click:Connect(function()local uZ=ad.members[El]or{}local u0=false for HW,Em in ipairs(uZ)do if not d.Targets[Em]then u0=true break end end
for HY,En in ipairs(uZ)do uV(En,u0)end end)for HZ,mS in ipairs(ad.members[hY]or{})do local hZ=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cw)},cw)ab(hZ,8)local u1=P(hZ,ak(mS),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
u1 .TextWrapped,u1 .TextTruncate=false,Enum.TextTruncate.AtEnd local u2=a.tickBox(hZ)bu.boxes[mS]=u2 local u3=mS
local function u4()uV(u3,not d.Targets[u3])end hZ.MouseButton1Click:Connect(u4)u2 .MouseButton1Click:Connect(u4)
end end mN()bu.built,bu.at=true,ad.at end function L.paint()for Eo,Ep in pairs(L.boxes)do a.check(Ep,d.CrateTicks[Eo]==true)end
if a.crtInfo then local mT,mU=0,0 for H0 in pairs(L.boxes)do mT=mT+1 end for H1,Eq in pairs(d.CrateTicks)do if Eq then mU=mU+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(mT,mU))end if a.crateT then M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for H2,h0 in ipairs(a.crtList:GetChildren())do if h0:IsA("Frame")or h0:IsA("TextButton")or h0:IsA("TextLabel")then h0:Destroy()end
end L.boxes={}local mV=a.card(a.crtList,"All of them","worst first")local mW=a.row(mV,26)a.crtInfo=P(mW,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Er=ai(mW,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Es=ai(mW,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(Er.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(Es.MouseButton1Click:Connect(function()L.build()end))
for H3,bv in ipairs(L.list())do local u5=mg[bv.rar or""]or l.text local dk=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(mV)},mV)ab(dk,8)H("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=u5,BorderSizePixel=0},dk)
local u6=P(dk,(bv.title or bv.name)..(bv.guess and"  (?)"or""),11,u5,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
u6 .TextWrapped,u6 .TextTruncate=false,Enum.TextTruncate.AtEnd local Et=P(dk,bv.price and("$"..aL(bv.price))or(bv.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Et.TextXAlignment=Enum.TextXAlignment.Right local u7=a.tickBox(dk)L.boxes[bv.k]=u7 local u8=bv.k local function u9()
d.CrateTicks[u8]=(not d.CrateTicks[u8])or nil L.paint()end T(dk.MouseButton1Click:Connect(u9))T(u7 .MouseButton1Click:Connect(u9))
end L.built=L.at L.paint()end local u_="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a1(cx)u_=cx for Eu,mX in ipairs(a.tabKeys)do a[mX].Visible=(mX==cx)local h1=a.tabsAll[Eu]if h1 then
local mY=mX==cx h1 .b.BackgroundTransparency,h1 .b.TextTransparency,h1 .bar.Visible=mY and 0 or 1,mY and 0 or 0.45,mY
end end if cx=="pet"and not q.built then pcall(q.build)end if cx=="team"and not z.built then pcall(z.build)end
if cx=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cx=="but"then fd(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(mZ,va,vb,vc)if vc then mZ.Text=vc end mZ.BackgroundColor3=va and vb or l.bg mZ.TextColor3=va and a.ink(vb)or l.dim
end function q.paintRow(vd)local cy=q.rows and q.rows[vd]if not cy then return end local cz=d.Pets[vd]or{}local fe=tonumber(cz.f)or 0
a.flag(cy.b,cz.b,l.good)a.flag(cy.g,cz.g,l.accent,cz.g and"BIG"or"ANY")a.flag(cy.w,cz.w,l.warn)a.flag(cy.f,fe>0,l.good,fe>=7 and"7 BIG/HUGE"or(fe>0 and(fe.." BIG")or"FUSE"))
if cy.row then cy.row.BackgroundColor3=(cz.b or cz.w or fe>0)and l.lit or l.raise end end function q.flag(m0,h2)
local a9=d.Pets[m0]or{}if h2=="f"then local Ev={[0]=1,[1]=2,[2]=3,[3]=7}local ve=Ev[tonumber(a9 .f)or 0]or 0 a9 .f=ve>0 and ve or nil
elseif a9[h2]then a9[h2]=nil else a9[h2]=true end d.Pets[m0]=(a9 .b or a9 .g or a9 .w or a9 .f)and a9 or nil q.paintRow(m0)
end function q.paintAll()for Ew in pairs(q.rows or{})do q.paintRow(Ew)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local m1=q.wishes()local ff=q.data()for h3,m2 in pairs(q.rows)do local vf=C.status(h3,ff)m2 .desc.Text=(m1[h3]and("wishing %dm | "):format(math.ceil(m1[h3]/60))or"")..(vf and(vf.." | ")or"")..m2 .boostText
m2 .desc.TextColor3=m1[h3]and l.text or l.dim end local vg=tonumber(J:GetAttribute("PetWishCredits"))or 0 a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(ff and#(ff.pets or{})or 0,ff and tonumber(ff.maxOwned)or 60,
aL(q.money()),vg>0 and(" | free wishes "..vg)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local h4=q.info()for H4,h5 in ipairs(a.petList:GetChildren())do if h5:IsA("Frame")or h5:IsA("TextLabel")or h5:IsA("TextButton")then h5:Destroy()end
end q.rows={}if not h4 then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dl={}for H5,vh in ipairs(q.order())do local m3=h4 .Pets[vh].rarity or"?"dl[m3]=dl[m3]or{}
table.insert(dl[m3],vh)end local dm={}for H6,vi in ipairs(h4 .Rarities or{})do if dl[vi]then dm[#dm+1]=vi end end
for vj in pairs(dl)do if not table.find(dm,vj)then dm[#dm+1]=vj end end for H7,m4 in ipairs(dm)do local h6=q.RC[m4]or l.text
local cA=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cA,11)a.stroke(cA,h6,0.7)a.list(cA,4)a.pad(cA,7,7,7,8)local vk=a.row(cA,18)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=h6,BorderSizePixel=0},vk)
local Ex=P(vk,m4:upper(),11,h6,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Ex.Font=ae.x for H8,h7 in ipairs(dl[m4])do
local fg=H("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cA)},cA)
ab(fg,8)local m5=P(fg,q.nice(h7),11,h6,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))m5 .TextWrapped,m5 .TextTruncate=false,Enum.TextTruncate.AtEnd
local Ey,Ez=pcall(function()return h4 .describe(h7)end)local vl=Ey and tostring(Ez)or""local m6=P(fg,vl,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
m6 .TextYAlignment,m6 .TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function h8(EA,EB,EC)
local vm=ai(fg,EA,l.bg,8,UDim2 .new(1,EB,0,5),UDim2 .new(0,EC,0,22))vm.AutoButtonColor=true return vm end local vn,vo,vp,vq=h8("BUY",-164,30),h8("ANY",-131,30),h8("WISH",-98,34),h8("FUSE",-61,56)
local h9=h7 vn.MouseButton1Click:Connect(function()q.flag(h9,"b")end)vo.MouseButton1Click:Connect(function()q.flag(h9,"g")end)
vp.MouseButton1Click:Connect(function()q.flag(h9,"w")end)vq.MouseButton1Click:Connect(function()q.flag(h9,"f")end)
q.rows[h7]={b=vn,g=vo,w=vp,f=vq,name=m5,desc=m6,boostText=vl,row=fg}end end q.built=true q.paintAll()end function e.paint()
M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,d.HideBases,e.BASES[e.basesMode()],e.BASES[0])M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function e.applyAll()if d.Lite then e.lite(true)end
if d.Calm then e.calm(true)end if d.HideHud then e.hideHud(true)end if d.NoRender then e.render(true)end if d.HideBases then e.bases(true)end
if(d.FpsCap or 0)~=0 then e.cap(d.FpsCap)end e.paint()end T(a.pfLite.MouseButton1Click:Connect(function()e.lite(not d.Lite)e.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()e.calm(not d.Calm)e.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()e.hideHud(not d.HideHud)e.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()e.render(not d.NoRender)e.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()e.setBases((e.basesMode()+1)%3)e.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local ED=table.find(e.CAPS,d.FpsCap or 0)or 1 local vr=e.CAPS[(ED%#e.CAPS)+1]
if not e.cap(vr)and vr~=0 then A("this executor cannot cap fps")end e.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local m7=tonumber(a.pfMem.Text)if m7 and m7>=0 then d.MemLimit=math.floor(m7)end e.paint()end))function z.names()
local m8={"(none)"}for H9,EE in ipairs((z.teams()))do m8[#m8+1]=EE.name end return m8 end function z.cycle(m9,EF)
local h_=z.names()local EG=d[m9]~=""and d[m9]or"(none)"local ia=table.find(h_,EG)or 1 ia=((ia-1+EF)%#h_)+1 d[m9]=h_[ia]=="(none)"and""or h_[ia]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local m_={}for H_,EH in ipairs((z.teams()))do m_[EH.name]=true end
for EI,vs in pairs(z.pick)do local dn=d[EI]vs.Text=dn==""and"(none)"or(m_[dn]and dn or(dn.." (missing)"))vs.TextColor3=(dn~=""and not m_[dn])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local EJ,ib=q.srv(),{}for Ia,ic in ipairs(z.list or{})do ib[#ib+1]=("st %-2s %-22s %9s  helps %d"):format(ic.st.Name,ak(W(ic.name)):sub(1,22),z.clock(ic.ends-EJ),ic.helps)
end a.tmList.Text=#ib>0 and table.concat(ib,"\n")or"no waxes running"end function z.build()for Ib,ie in ipairs(a.teamList:GetChildren())do
if ie:IsA("Frame")or ie:IsA("TextLabel")or ie:IsA("TextButton")then ie:Destroy()end end z.pick={}local ig=a.card(a.teamList,"Automatic")
a.tmT=a.switch(ig,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(ig,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild z.paint()end)a.tmBuildNow=a.actions(ig,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local EK,EL=pcall(C.rebuild,"you asked")if not EK then A("BUILD ERR "..tostring(EL))end end)
end)a.tmInfo=a.grow(ig,10,l.dim)local vt=a.card(a.teamList,"Which team when")local function ih(ii,EM,EN)local fh=a.row(vt,54)
P(fh,EM,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local vu=P(fh,EN,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
vu.TextWrapped,vu.TextTruncate=false,Enum.TextTruncate.AtEnd local EO=ai(fh,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local vv=ai(fh,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local EP=ai(fh,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
EO.MouseButton1Click:Connect(function()z.cycle(ii,-1)end)EP.MouseButton1Click:Connect(function()z.cycle(ii,1)end)
vv.MouseButton1Click:Connect(function()z.cycle(ii,1)end)z.pick[ii]=vv end ih("TeamNormal","Normal","the rest of the time: money + luck")
ih("TeamFull","Full","every station busy: money + wax speed")ih("TeamGlaze","Glaze","worn just before a wax finishes")
local ij=a.row(vt,26)P(ij,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hD(ij,tostring(d.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(ij,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local EQ=ai(ij,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
EQ.MouseButton1Click:Connect(function()local ik=tonumber(a.tmLead.Text)if ik and ik>=5 and ik<=600 then d.GlazeLead=math.floor(ik)else a.tmLead.Text=tostring(d.GlazeLead)end
z.paint()end)ih("TeamWax","Wax","while a butter is placed: head starts")local vw=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(vw)},vw)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local ER=a.card(a.teamList,"How it works")a.note(ER,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function ES()a.secB.Text=tostring(d.Every)M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")e.paintGhost()o.paint()M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(e.unpin)end end)end
M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eR(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bQ(a.root)bQ(a.tgRoot)c.lastCollect=y()
mN()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(e.applyAll)end local function ET(vx)task.spawn(function()vx.TextColor3=l.bad
task.wait(0.8)if c.alive then vx.TextColor3=l.text end end)end local function vy()local vz=a.secB.Text:match("^%s*(%d+)%s*$")
local fi=vz and tonumber(vz)if not fi or fi<1 then a.secB.Text=tostring(d.Every)ET(a.secB)A("interval must be a whole number >= 1")
return end if fi==d.Every then return end d.Every,c.lastCollect=fi,y()A("collect every "..fi.."s")end local function N(EU,EW)T(EU.MouseButton1Click:Connect(EW))end
N(a.secSet,vy)T(a.secB.FocusLost:Connect(vy))N(a.colT,function()d.Collect,c.lastCollect=not d.Collect,y()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",sW)end)N(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
d.Help=not d.Help E.nextAt,E.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()d.Quests=not d.Quests F.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,e.cycleGhost)function o.paint()M(a.snapT,d.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
M(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(EX)task.spawn(function()pcall(o.tick)if EX and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local EY=o.on()d.AutoIndex=not d.AutoIndex o.discAt=-100 o.changed(EY)end)
N(a.bestT,function()local EZ=o.on()d.Best=((d.Best or 0)+1)%5 o.stackAt=-100 o.changed(EZ)end)N(a.bcT,function()
local E0=o.on()d.BestCrate=not d.BestCrate o.changed(E0)end)N(a.shT,function()d.Shower=not d.Shower o.paint()
end)N(a.snapT,function()d.SnapGlaze=d.SnapGlaze==false o.paint()end)N(a.pbT,function()d.PetBuy=not d.PetBuy q.paintAll()end)
N(a.pwT,function()d.PetWish=not d.PetWish q.paintAll()end)N(a.pfT,function()d.AutoFuse=not d.AutoFuse q.paintAll()end)
function o.admPaint()local bS=q.srv()local bT pcall(function()o.aac=o.aac or require(af:FindFirstChild("AdminAbuseClient"))
bT=o.aac:GetState()end)local dp,bU="nothing scheduled","the game has not announced one"if type(bT)=="table"then
local fj,a2,bV=tostring(bT.Phase or""),tonumber(bT.StartsAt),tonumber(bT.EndsAt)if a2 and a2<1e9 then a2=nil end
if bV and bV<1e9 then bV=nil end if fj=="Countdown"and a2 then dp,bU="starts in "..z.clock(a2-bS),os.date("%a %H:%M",math.floor(a2)).." your time"
elseif fj=="Live"and bV then dp,bU="LIVE  -  "..z.clock(bV-bS).." left","the farm is grabbing, waxing and glazing through it"
elseif fj~=""and fj~="Idle"and bV and bV>bS then dp,bU=fj:lower().."  -  "..z.clock(bV-bS).." left","after the show"
elseif a2 and a2>bS then dp,bU="next: "..os.date("%a %H:%M",math.floor(a2)),"your time"elseif a2 then dp,bU="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a2)).." your time"
end if type(bT.Kind)=="string"and bT.Kind~=""then bU=bU.."  |  "..bT.Kind end end a.put(a.admBig,dp)a.put(a.admSub,bU)
local dq,na={},af:FindFirstChild("AdminShow")if na then local E1,E2=pcall(function()return na:GetAttributes()end)
for vA,dr in pairs(E1 and E2 or{})do local il=type(vA)=="string"and vA:match("^(.-)Mult$")local nb=il and tonumber(na:GetAttribute(il.."Until"))
if il and type(dr)=="number"and dr~=1 and dr~=0 and nb and nb>bS then dq[#dq+1]=("%s  x%s   %s left"):format(il:gsub("(%l)(%u)","%1 %2"),(dr%1==0)and tostring(dr)or("%.2f"):format(dr),
z.clock(nb-bS))end end end table.sort(dq)a.put(a.admBoost,#dq>0 and table.concat(dq,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dq>0 and l.accent or l.dim local im=0 for Ic in pairs(O.drops)do im=im+1 end local vB=o.snapAt and(o.snapAt-bS)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,im>0 and(", "..im.." falling")or"",
vB and("in "..math.max(0,math.floor(vB)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",d2,true)end)N(a.padB,function()c.plot=bw()or c.plot local vC,nc=ap(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(vC and nc and nc:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=nc.CFrame:ToObjectSpace(vC.HumanoidRootPart.CFrame)
BK(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eR(not c.running)end)N(a.buyB,function()
c.plot=bw()or c.plot task.spawn(as,"buying (manual)...",o9,true)end)N(a.plB,function()c.plot=bw()or c.plot task.spawn(as,"waxing (manual)...",pc)
end)N(a.tabFarm,function()a1("farm")end)N(a.tabRun,function()a1("run")end)N(a.tabSrv,function()a1("srv")end)N(a.tabAdm,function()a1("adm")end)
N(a.tabBut,function()a1("but")end)N(a.tabSet,function()a1("set")end)N(a.tabCrt,function()a1("crt")end)N(a.tabPet,function()a1("pet")end)
N(a.tabTeam,function()a1("team")end)local function E3(nd)c.hidden=nd a.root.Visible=not nd a.tgBtn.TextColor3=nd and l.text or l.ink
end us(a.tgBtn,a.tgRoot,function()bQ(a.tgRoot)c.togPos=hI(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then E3(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aJ,aw={},0 local function bW()aJ=ow()if#aJ==0 then a.cfgPick.Text="(none saved)"
aw=0 return end if aw<1 or aw>#aJ then aw=1 end a.cfgPick.Text=aJ[aw]..("  (%d/%d)"):format(aw,#aJ)end local function vD()
local vE=c.autoload~=nil a.cfgAuto.Text=vE and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=vE and l.accent or l.panel2
end local function ne()local vF=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if vF~=""then return vF end return(aw>0 and aJ[aw])or""
end N(a.cfgSave,function()c.winPos=hI(a.root)or c.winPos c.togPos=hI(a.tgRoot)or c.togPos local vG,vH=fY(ne())
a.cfgMsg.Text=vG and("saved as "..vH)or("could not save: "..vH)a.cfgMsg.TextColor3=vG and l.good or l.bad bW()
A(a.cfgMsg.Text)end)local function E4(nf)local ng,vI=oF(nf)a.cfgMsg.Text=ng and("loaded "..vI)or("could not load: "..vI)
a.cfgMsg.TextColor3=ng and l.good or l.bad if ng then a.cfgName.Text=nf ES()task.spawn(D.apply,"config "..nf)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()E4(ne())end)N(a.cfgPick,function()bW()if aw>0 then a.cfgName.Text=aJ[aw]end
end)N(a.cfgPrev,function()if#aJ==0 then bW()return end aw=(aw-2)%#aJ+1 bW()a.cfgName.Text=aJ[aw]end)N(a.cfgNext,function()
if#aJ==0 then bW()return end aw=aw%#aJ+1 bW()a.cfgName.Text=aJ[aw]end)N(a.cfgAuto,function()if c.autoload then
oH(nil)a.cfgMsg.Text="it will not load a config on launch"else local fk=ne()local vJ=false for Ie,E5 in ipairs(ow())do if E5==fk then vJ=true end end
local E6=vJ or fY(fk)if E6 and fk~=""then oH(fk)bW()a.cfgMsg.Text=fk.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim vD()end)N(a.autoB,function()
local vK,vL=xF()a.autoMsg.Text=vK and("installed. "..vL)or("failed: "..vL)a.autoMsg.TextColor3=vK and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dL("you asked")end)
local a_=false N(a.minB,function()a_=not a_ a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not a_,not a_,not a_
if a_ then for If,E7 in ipairs(a.tabKeys)do a[E7].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a1(u_)
end a.root.Size=UDim2 .new(0,Q.w,0,a_ and(Q.head+Q.status+12)or Q.h)a.minB.Text=a_ and"+"or"-"end)local function io()
if not c.alive then return end c.alive,c.running=false,false pcall(e.restoreAll)pcall(fy)for Ig,E8 in ipairs(ix)do pcall(function()E8:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()ml:Destroy()end)
pcall(function()uU:Destroy()end)if cC.SAB_KILL==io then cC.SAB_KILL=nil end end cC.SAB_KILL=io N(a.killB,io)N(a.xB,io)
us(a.title,a.root,function()bQ(a.root)c.winPos=hI(a.root)or c.winPos end)local function vM()local fl,cB=c.reason,c.level
if c.busy then fl,cB=c.busyText,"ok"elseif not c.running then local Ih,vN,E9=tx()if c.capHit then fl,cB=vN,"bad"else fl,cB="[stopped] "..vN,(E9=="bad")and"bad"or"idle"end
c.reason,c.level=fl,cB end local ds=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=ds then
a.lit.dot=ds a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=ds,ds,ds,ds a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fl)if a.lit.bar~=cB then a.lit.bar=cB a.bar.BackgroundColor3=CW[cB]or l.dim end
if a_ then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bX=xe()if a.farm.Visible then local E_,Fa=fu()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,E_.."/"..Fa)local vO=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(y()-c.lastCollect)))or nil
local vP=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aL(ba()),c.rolls,c.gifts,c.crates,vP and ak(W(vP))or"nothing",j.on and("   ["..j.title.." window open]")or"",
vO and("in "..vO.."s")or"off"))a.put(a.tgt,(#bX==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bX<=3)and table.concat(bX,", ")or(#bX.." butters ticked"))))
if a.lit.tgt~=(#bX==0)then a.lit.tgt=(#bX==0)a.tgt.TextColor3=(#bX==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fo,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(d.Help or d.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,d.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,e.ghostMode()>0 and(e.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bX))
end if a.but.Visible and bu.at~=ad.at then fd(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(e.fps+0.5),e.mem,e.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((d.Help or d.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(d.Campfire and K.msg or"off")..(e.ghostMode()>0 and(e.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(d.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local vQ=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",vQ~=""and vQ or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cC.SAB={S=c,CFG=d,EV=V,U=a,sg=ml,CAT=ad,LEARN=aj,buildList=fd,
logAll=dt,evAll=du,AR=D,CR=L,PF=e,PX=q,TM=z,CRATE=j,FU=C,HX=E,CF=K,QX=F,IX=o,SH=O}A(bY.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a1("farm")bQ(a.root)bQ(a.tgRoot)if hF then pcall(function()T(hF:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bQ(a.root)bQ(a.tgRoot)end))end)end bW()vD()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")e.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(e.applyAll)pcall(vM)task.spawn(function()local vR=xD()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(vR and("\n(backup: "..vR..")")or"")
local vS=fS(an.exec)if vS and not vS:find("SAB autoloader v2",1,true)then dH(an.exec,an.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fS(an.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(xL)end)task.spawn(function()while c.alive do local Fb,Fc=pcall(vM)if not Fb then A("UI ERR "..tostring(Fc))end
task.wait((c.hidden or a_)and 1.5 or 0.4)end end)task.spawn(function()local Fd,Fe=pcall(xT)if not Fd then A("HOOK ERR "..tostring(Fe))end
end)task.spawn(function()pcall(wB)if j.loadSeq and not j.learned then local ip={}for vT=1,20 do if j.loadSeq[vT]then ip[#ip+1]=j.loadSeq[vT]end end
if#ip>0 then j.learned={seq=ip,mode=j.loadMode}A("remembered how to open crates directly")end end if i6()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local Ff,vU=pcall(BM)if Ff and vU and c.alive and not c.manualPad then c.manualPad=vU end end)task.spawn(function()
while c.alive do local nh,ni=pcall(q.buyTick)if not nh then A("PET ERR "..tostring(ni))task.wait(5)end nh,ni=pcall(q.wishTick)
if not nh then A("WISH ERR "..tostring(ni))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local iq,vV=0,y()
T(game:GetService("RunService").Heartbeat:Connect(function()iq=iq+1 if e.hideI<=#e.hideQ or(e.queue and#e.queue>0)then pcall(e.hideStep)end end))
T(game:GetService("RunService").Heartbeat:Connect(function()if e.hold then pcall(e.pinTick)end end))e.noteAt=y()
while c.alive do task.wait(1)local vW=y()e.fps,iq,vV=iq/math.max(vW-vV,0.001),0,vW local Fg,Fh=pcall(e.tick)if not Fg then A("PERF ERR "..tostring(Fh))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local Fi,Fj=pcall(C.tick)if not Fi then A("FUSE ERR "..tostring(Fj))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local Fk,Fl=pcall(z.tick)if not Fk then A("TEAM ERR "..tostring(Fl))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local ir=af:WaitForChild("Remotes",30)local vX=ir and ir:WaitForChild("ClanEvent",30)
if vX and c.alive then T(vX.OnClientEvent:Connect(function(Fm,Fn)if Fm=="call"then pcall(E.onCall,Fn)end end))
end local vY=ir and ir:FindFirstChild("RollConfirmAsk")if vY and c.alive then T(vY.OnClientEvent:Connect(function(Fo)F.asked=Fo or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(e.calmScan)end end end)task.spawn(function()
local nj=af:WaitForChild("Remotes",30)if not(nj and c.alive)then return end local function is(Fp,Fq)local nk=nj:FindFirstChild(Fp)
if nk and nk:IsA("RemoteEvent")then T(nk.OnClientEvent:Connect(function(...)pcall(Fq,...)end))end end is("NewSquishyDiscovered",function(nl,vZ)
if type(nl)~="string"then return end o.disc=o.disc or{}o.disc[W(nl)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(nl)),vZ and(" ("..tostring(vZ)..")")or""))
end)is("IndexRefresh",o.loadDisc)is("IndexRowComplete",function(Fr)A("INDEX: the whole "..tostring(Fr).." row is complete")end)
is("AdminShow",o.admin)local v0=nj:FindFirstChild("AdminShowSync")if v0 then local Fs,v1=pcall(function()return v0:InvokeServer()end)
if Fs and type(v1)=="table"then for Ii,Ft in pairs(v1)do pcall(O.add,Ft)end end end while c.alive do local Fu,Fv=pcall(o.tick)
if not Fu then o.msg="index error: "..tostring(Fv)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Fw,Fx=pcall(F.tick)if not Fw then A("QUEST ERR "..tostring(Fx))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(fy)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Fz=(type(newcclosure)=="function")and newcclosure or function(Fy)return Fy end local nm
local v2=(type(setnamecallmethod)=="function")and setnamecallmethod or nil nm=hookmetamethod(game,"__namecall",Fz(function(v3,...)
local fm=getnamecallmethod()if c.alive and(fm=="InvokeServer"or fm=="FireServer")then local v4,v5=pcall(function()return v3 .Name end)
if v4 and v5=="CrateAction"and not j.replaying then pcall(j.saw,fm,...)elseif v4 and v5=="AutoRollAction"and not D.replaying then pcall(D.saw,fm,...)end
if v2 then v2(fm)end end return nm(v3,...)end))j.oldNC=nm end)end if iv then T(J.Idled:Connect(function()pcall(function()iv:CaptureController()iv:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Ij=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ap()and(c.plot or bw())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local it=b3()
if it and o.on()and not aK(it.name)then it=nil end if c.alive and d.AutoRoll and c.running and not D.isOn()and not it and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Ik=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bw()if ap()and c.plot and o.any()then eR(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bw()c.lastCollect=y()while c.alive do if c.running then local FA,v6=pcall(CQ)if not FA and v6~=iw then A("LOOP ERR "..tostring(v6))end
end task.wait(0.1)end end)iu("ready - the window is at the top left")end local FC,nn=xpcall(v_,function(FB)return tostring(FB).."\n"..debug.traceback()end)
if not FC then pcall(function()warn("SAB "..bY.." ERROR: "..tostring(nn))end)iu("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bY.." ERROR: "..tostring(nn))end)pcall(function()local v7=(type(getgenv)=="function"and getgenv())or _G
if type(v7 .SAB_KILL)=="function"then v7 .SAB_KILL()end for Il,FD in ipairs({"SABFarmGui","SABToggle"})do local v8=J.PlayerGui:FindFirstChild(FD)
if v8 then v8:Destroy()end end end)pcall(function()local fn=Instance.new("ScreenGui")fn.Name="SABError"fn.ResetOnSpawn=false
fn.DisplayOrder=1000 local a3=Instance.new("TextBox")a3 .Size=UDim2 .new(0,340,0,170)a3 .Position=UDim2 .new(0,10,0,50)
a3 .BackgroundColor3=Color3 .fromRGB(90,20,20)a3 .TextColor3=Color3 .new(1,1,1)a3 .TextSize=11 a3 .TextWrapped=true
a3 .ClearTextOnFocus=false a3 .TextXAlignment=Enum.TextXAlignment.Left a3 .TextYAlignment=Enum.TextYAlignment.Top
a3 .Text="SAB "..bY.." failed to start. Send this text:\n"..tostring(nn)a3 .Parent=fn fn.Parent=J:WaitForChild("PlayerGui")
end)end
