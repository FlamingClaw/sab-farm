local bY="v27"local nA=game:GetService("Players")local J=nA.LocalPlayer or nA.PlayerAdded:Wait()local function iz(wo)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bY,Text=wo,Duration=6})
end)end iz("script started")local function wp()local af=game:GetService("ReplicatedStorage")local am=game:GetService("Workspace")
local nB=game:GetService("UserInputService")local cC=(type(getgenv)=="function"and getgenv())or _G if type(cC.SAB_KILL)=="function"then pcall(cC.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local iA=(function()local wq,wr=pcall(function()return game:GetService("VirtualUser")end)return wq and wr or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,Calm=false,HideBases=false,HideMine=false,MemLimit=1250,Help=false,
HelpGuild=false,Campfire=true,Ghost=false,GhostHelps=false,Quests=true,AutoIndex=false,Best=0,BestCrate=false,
Shower=true,SnapGlaze=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=y(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local V={name=nil,rar=nil,at=y(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local D={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local j={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local q,z,d,C,E,K,F={},{},{},{},{},{},{}local o,O={},{}local iB={}local iC,fq,dv,dw={},{},{},{}local function T(nC)iC[#iC+1]=nC return nC end
local function ag(ws)task.wait(ws)if not c.alive then error(iB,0)end end local function A(fr)fr=os.date("%H:%M:%S").." "..tostring(fr)
table.insert(fq,1,fr)if#fq>6 then table.remove(fq)end c.logN=(c.logN or 0)+1 dv[#dv+1]=fr if#dv>80 then table.remove(dv,1)end
end local function fs(nD)if type(nD)~="string"then return""end return(nD:lower():gsub("[^%w]",""))end local function W(wt)
local nE=fs(wt)local iD=nE:gsub("butter$","")if iD==""then iD=nE end return iD end local function aJ(nF)if type(nF)~="string"then return false end
local iE=W(nF)if iE==""then return false end if o.want then return o.want(iE)end return e.Targets[iE]==true end
local function wu(dx)dx=dx:lower()return dx:find("squishy",1,true)~=nil or dx:match("butter$")~=nil or dx:match("butter[^%a]")~=nil
end local iF={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aK(dy)if type(dy)~="number"then return"?"end
local ft=1 while math.abs(dy)>=1000 and ft<#iF do dy=dy/1000 ft=ft+1 end local wv=string.format("%.2f",dy):gsub("%.?0+$","")
return wv..iF[ft]end local function ww(nG)if type(nG)~="string"then return nil end local wx,dz=nG:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local iG=tonumber(wx)if not iG then return nil end if dz==""then return iG end local wy={qd="qa",qn="qi"}dz=wy[dz:lower()]or dz
for wz,wA in ipairs(iF)do if wA:lower()==dz:lower()then return iG*1000^(wz-1)end end return nil end local function a_()
local nH=J:GetAttribute("BoardValueMoney")if type(nH)=="number"then return nH end local nI=J:FindFirstChild("leaderstats")
if nI then for F2,wB in ipairs({"Cash","Money","Coins"})do local iH=nI:FindFirstChild(wB)if iH and type(iH.Value)=="number"then return iH.Value end
end end end local function fu(wC)local iI=wC:GetFullName()if c.plot then local iJ=c.plot:GetFullName()if iI:sub(1,#iJ)==iJ then return iI:sub(#iJ+2)end
end return iI end local function ap()local fv=J.Character if fv and fv:FindFirstChild("HumanoidRootPart")then
local nJ=fv:FindFirstChildOfClass("Humanoid")if nJ and nJ.Health>0 then return fv end end end local function bw()
local iK=am:FindFirstChild("Plots")if not iK then return nil end local function nK(wD)local nL=wD:FindFirstChild("Plate")
return nL~=nil and nL:FindFirstChild("EditStackAttachment",true)~=nil end local nM=J:GetAttribute("PlotNumber")
if nM~=nil then local iL=iK:FindFirstChild(tostring(nM))if iL and nK(iL)then return iL end end for F3,nN in ipairs(iK:GetChildren())do
if nK(nN)then return nN end end end local function dA(nO)local bx=nO and nO.Parent for F4=1,6 do if not bx then return nil end
if bx:IsA("BasePart")then return bx end if bx:IsA("Model")then return bx.PrimaryPart or bx:FindFirstChildWhichIsA("BasePart",true)end
bx=bx.Parent end end local function nP(nQ)local iM=nQ.Parent if iM and iM:IsA("Attachment")then return iM.WorldPosition end
local nR=dA(nQ)return nR and nR.Position end local function nS()local cD=c.plot and c.plot:FindFirstChild("Plate")
if not cD then return nil end if cD:IsA("BasePart")then return cD.Position end if cD:IsA("Model")then return cD:GetPivot().Position end
local nT=cD:FindFirstChildWhichIsA("BasePart",true)return nT and nT.Position end local function nU()local iN={}
local nV=c.plot and c.plot:FindFirstChild("WaxStations")if nV then for F5,wE in ipairs(nV:GetChildren())do local nW=wE:FindFirstChild("SquishyPlaceHolder")
local iO=nW and nW:FindFirstChild("PlacePrompt")if iO and iO:IsA("ProximityPrompt")then iN[#iN+1]=iO end end end
return iN end local function fw()local nX,iP=nU(),0 for F6,wF in ipairs(nX)do if wF.Enabled then iP=iP+1 end end
local iQ=#nX local iR=J:GetAttribute("WaxStations")if type(iR)=="number"and iR>iQ then iQ=iR end return iP,iQ
end local function wG()local nY=ap()local nZ=nY and nY.HumanoidRootPart.Position local iS,n0 for F7,iT in ipairs(nU())do
if iT.Enabled then local n1=nP(iT)local n2=(n1 and nZ)and(n1-nZ).Magnitude or 1e9 if not iS or n2<n0 then iS,n0=iT,n2 end
end end return iS end local function n3()local fy=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fy then return nil end local n4=fy:FindFirstChild("BuyPromptAttachment")local fz=(n4 and n4:FindFirstChild("BuyPrompt"))or fy:FindFirstChild("BuyPrompt",true)
if fz and fz:IsA("ProximityPrompt")and fz:IsDescendantOf(fy)then return fz end end local n5={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local wH={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iU="SAB_order.txt"local function fA()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for wI,wJ in pairs(aj.price)do aB[#aB+1]="P|"..wI.."|"..string.format("%.0f",wJ)end for wK,wL in pairs(aj.order)do aB[#aB+1]="O|"..wK.."|"..table.concat(wL,",")end
if j.learned and j.enc then aB[#aB+1]="M|mode|"..tostring(j.learned.mode or"")for wM,fB in ipairs(j.learned.seq)do
local n6={}for n7=1,fB.n do n6[n7]=j.enc(fB.args[n7])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(wM,fB.m,fB.n,table.concat(n6,";"))
end end local function iV(wN,wO,fC)local n8={}for n9=1,fC.n do n8[n9]=j.enc(fC.args[n9])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(wO,wN,fC.m,fC.n,table.concat(n8,";"))
end if j.enc then for wP,wQ in ipairs(D.rec.rules)do iV("rules",wP,wQ)end if D.rec.on then iV("on",0,D.rec.on)end
if D.rec.off then iV("off",0,D.rec.off)end end for F8,dB in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dB.name,dB.title or"",dB.rar or"",dB.price and string.format("%.0f",dB.price)or"")
end if pcall(writefile,iU,table.concat(aB,"\n"))then aj.dirty=false end end local function wR()if type(isfile)~="function"or type(readfile)~="function"then return end
local wS,wT=pcall(isfile,iU)if not(wS and wT)then return end local wU,n_=pcall(readfile,iU)if not(wU and type(n_)=="string")then return end
for wV in n_:gmatch("[^\n]+")do local cE,cF,ba=wV:match("^(%a)|([^|]+)|(.*)$")if cE=="P"then aj.price[cF]=tonumber(ba)
elseif cE=="M"then j.loadMode=(ba~=""and ba~="nil")and ba or nil elseif cE=="A"and j.dec then local oa=tonumber(cF)
local ob,fD,wW=ba:match("^([^|]+)|(%d+)|(.*)$")if oa and ob then fD=tonumber(fD)local oc,fE={},0 for wX in(wW..";"):gmatch("([^;]*);")do
fE=fE+1 if fE<=fD then oc[fE]=j.dec(wX)end end j.loadSeq=j.loadSeq or{}j.loadSeq[oa]={m=ob,n=fD,args=oc}end elseif cE=="R"and j.dec then
local od=tonumber(cF)local fF,wY,fG,wZ=ba:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if od and fF then fG=tonumber(fG)
local oe,fH={},0 for w0 in(wZ..";"):gmatch("([^;]*);")do fH=fH+1 if fH<=fG then oe[fH]=j.dec(w0)end end local iW={m=wY,n=fG,args=oe}
if fF=="rules"then D.rec.rules[od]=iW elseif fF=="on"then D.rec.on=iW elseif fF=="off"then D.rec.off=iW end end
elseif cE=="K"then local of,og,w1=ba:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cF)]={name=cF,title=of~=""and of or nil,
rar=og~=""and og or nil,price=tonumber(w1)}elseif cE=="O"and ba~=""then local fI={}for w2 in ba:gmatch("[^,]+")do fI[#fI+1]=w2 end
if#fI>0 then aj.order[cF]=fI end end end end local function w3(fJ)if type(fJ)~="table"then return end local bZ,oh=fJ.rarity,fJ.contents
if type(bZ)~="string"or bZ==""or type(oh)~="table"then return end local dC={}for F9,fK in ipairs(oh)do if type(fK)=="table"and type(fK.butter)=="string"then
dC[#dC+1]={n=fK.butter,ch=tonumber(fK.chance)or 0}end end if#dC==0 then return end table.sort(dC,function(w4,w5)return w4 .ch>w5 .ch end)
local dD,dE={},false for w6,w7 in ipairs(dC)do dD[w6]=w7 .n end local iX=aj.order[bZ]if not iX or#iX~=#dD then dE=true end
if not dE then for oi=1,#dD do if iX[oi]~=dD[oi]then dE=true break end end end aj.order[bZ]=dD local iY=tonumber(fJ.price)
if iY and aj.price[bZ]~=iY then aj.price[bZ]=iY dE=true end if dE then aj.dirty=true ad.at=0 A("learned the "..bZ.." order from its crate")
end end local function cG(w8,w9)local w_=w8:FindFirstChild(w9,true)local xa,iZ=pcall(function()return w_.Text end)
return(xa and type(iZ)=="string"and iZ~="")and iZ or nil end local function ak(oj)return ad.pretty[oj]or oj end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(xb)return fs(xb or"")end
function L.learn(bc)if type(bc)~="table"or type(bc.name)~="string"then return end local i0=L.key(bc.name)local bd=L.seen[i0]or{}
local xc=(L.seen[i0]==nil)or(tonumber(bc.price)and bd.price~=tonumber(bc.price))bd.name,bd.title=bc.name,bc.title or bd.title
bd.rar,bd.price=bc.rarity or bd.rar,tonumber(bc.price)or bd.price L.seen[i0]=bd if xc then L.at,aj.dirty=y(),true end
end function L.wanted(ol)if ol==nil then return false end local i1=L.key(ol)return e.CrateTicks[i1]==true or(e.BestCrate and o.bestCrate~=nil and(i1==o.bestCrate or i1==o.bestCrateTitle))
end function L.list()local cH={}for xd,fL in ipairs(L.base)do cH[L.key(fL[1])]={name=fL[1],title=fL[2],rar=fL[3],i=xd}end
for F_,dF in ipairs(ad.rarOrder)do local om=false for Ga,xe in pairs(cH)do if xe.rar==dF then om=true break end end
if not om and dF~="?"then local oo=dF:gsub("[^%w]","").."Crate"cH[L.key(oo)]={name=oo,title=dF.." Crate",rar=dF,i=50,guess=true}
end end for op,fM in pairs(L.seen)do local a3=cH[op]or{i=100}a3 .name,a3 .title,a3 .rar=fM.name or a3 .name,fM.title or a3 .title,fM.rar or a3 .rar
a3 .price,a3 .guess=fM.price or a3 .price,nil cH[op]=a3 end local dG,fN={},{}for xf,xg in ipairs(n5)do dG[xg]=xf end
for xh,oq in ipairs(ad.rarOrder)do dG[oq]=dG[oq]or(20+xh)end for xi,dH in pairs(cH)do dH.k=xi dH.price=dH.price or aj.price[dH.rar or""]
fN[#fN+1]=dH end table.sort(fN,function(b0,b1)if b0 .price and b1 .price and b0 .price~=b1 .price then return b0 .price<b1 .price end
local ot,ou=dG[b0 .rar or""]or 99,dG[b1 .rar or""]or 99 if ot~=ou then return ot<ou end if(b0 .i or 100)~=(b1 .i or 100)then return(b0 .i or 100)<(b1 .i or 100)end
return b0 .k<b1 .k end)return fN end local function xj()local ov=af:FindFirstChild("Assets")local ow=ov and ov:FindFirstChild("Squishies")
if not ow then return false end local i2,ox,cI={},{},{}local fO=0 for Gb,fP in ipairs(ow:GetChildren())do local dI=W(fP.Name)
if dI~=""and not i2[dI]then local fQ=cG(fP,"RarityText")or"?"i2[dI]=fQ ox[dI]=cG(fP,"NameText")or fP.Name cI[fQ]=cI[fQ]or{}
table.insert(cI[fQ],dI)fO=fO+1 end end if fO==0 then return false end for oy,xk in pairs(cI)do local oz=aj.order[oy]or wH[oy]
local i3={}if oz then for xl,xm in ipairs(oz)do i3[W(xm)]=xl end end table.sort(xk,function(oA,oB)local i4,i5=i3[oA],i3[oB]
if i4 and i5 then return i4<i5 end if i4 then return true end if i5 then return false end return ak(oA)<ak(oB)
end)end local i6={}for xn,xo in ipairs(n5)do i6[xo]=xn end local fR,b2={},{}for xp in pairs(cI)do fR[#fR+1]=xp end
pcall(function()for xq,xr in ipairs(require(af.Modules.SquishyRNG).Keys)do b2[xr]=xq end end)table.sort(fR,function(cJ,cK)
if b2[cJ]and b2[cK]and b2[cJ]~=b2[cK]then return b2[cJ]<b2[cK]end local i7,i8=aj.price[cJ],aj.price[cK]if i7 and i8 and i7~=i8 then return i7<i8 end
local i9,i_=i6[cJ],i6[cK]if i9 and i_ then return i9<i_ end if i9 then return true end if i_ then return false end
return cJ<cK end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=i2,ox,cI,fR,fO,y()return true end local function ja()
if ad.at==0 or(y()-ad.at)>120 then pcall(xj)end return ad.n>0 end local function xs(xt)local oC=W(xt)return ad.rar[oC]or(V.name and W(V.name)==oC and V.rar)or"?"
end local function xu()local fS={}local xv=((e.Best or 0)>0 and next(o.best or{}))and o.best or e.Targets for xw,xx in pairs(xv)do if xx then fS[#fS+1]=ak(xw)end end
table.sort(fS)return fS end local an={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function oD()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fT(oE)if type(makefolder)~="function"then return end local xy,xz=pcall(isfolder,oE)if not(xy and xz)then pcall(makefolder,oE)end
end local function fU(oF)if type(isfile)~="function"or type(readfile)~="function"then return nil end local xA,xC=pcall(isfile,oF)
if not(xA and xC)then return nil end local xD,xE=pcall(readfile,oF)return xD and xE or nil end local function dJ(xF,xG)
if type(writefile)~="function"then return false end return(pcall(writefile,xF,xG))end local function oG(xH)local dK={}
if type(listfiles)~="function"then return dK end local xI,oH=pcall(listfiles,xH)if not xI or type(oH)~="table"then return dK end
for Gc,xJ in ipairs(oH)do dK[#dK+1]=tostring(xJ)end return dK end local function oI()local fV={}for Gd,xK in ipairs(oG(an.cfg))do
local oJ=xK:match("([^/\\]+)%.txt$")if oJ then fV[#fV+1]=oJ end end table.sort(fV)return fV end local function xL()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(e.Every)aa[#aa+1]="N|GlazeLead|"..tostring(e.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(e.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(e.MemLimit)aa[#aa+1]="N|Best|"..tostring(e.Best or 0)for Ge,oK in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..oK.."|"..e[oK]end
do local fW={}for xM,dL in pairs(e.Pets)do local oL=(dL.b and"b"or"")..(dL.g and"g"or"")..(dL.w and"w"or"")..((tonumber(dL.f)or 0)>0 and tostring(dL.f)or"")
if oL~=""then fW[#fW+1]=xM.."|"..oL end end table.sort(fW)aa[#aa+1]="P|-"for Gf,xN in ipairs(fW)do aa[#aa+1]="P|"..xN end
end for Gg,oM in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..oM.."|"..(e[oM]and"1"or"0")end local jb=J:GetAttribute("AutoRollRules")if type(jb)=="string"and jb~=""then e.ARrules,e.ARstop=jb,tostring(J:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then aa[#aa+1]="S|rules|"..e.ARrules aa[#aa+1]="S|stop|"..e.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Gh,jc in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local fX={}for xO,xP in pairs(jc[2])do if xP then fX[#fX+1]=xO end end table.sort(fX)aa[#aa+1]=jc[1].."|-"for Gi,xQ in ipairs(fX)do aa[#aa+1]=jc[1].."|"..xQ end
end return table.concat(aa,"\n")end local function xR(jd)if type(jd)~="string"or jd==""then return false end local oN,oO,oP,oQ,dM={},false,{},false,nil
for xS in jd:gmatch("[^\n]+")do local aC,ah,ax=xS:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ah=="Every"then local je=tonumber(ax)
if je and je>=1 then e.Every=math.floor(je)end elseif aC=="N"and(ah=="FpsCap"or ah=="MemLimit")then local jf=tonumber(ax)
if jf and jf>=0 then e[ah]=math.floor(jf)end elseif aC=="N"and ah=="Best"then local fY=tonumber(ax)if fY and fY>=0 and fY<=4 then e.Best=math.floor(fY)end
elseif aC=="N"and ah=="GlazeLead"then local fZ=tonumber(ax)if fZ and fZ>=5 and fZ<=600 then e.GlazeLead=math.floor(fZ)end
elseif aC=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then e[ah]=ax elseif aC=="P"and ah~=""then
if not dM then dM={}end if ah~="-"and ax~=""then dM[ah]={b=ax:find("b",1,true)and true or nil,g=ax:find("g",1,true)and true or nil,
w=ax:find("w",1,true)and true or nil,f=tonumber(ax:match("%d"))}end elseif aC=="B"then if e[ah]~=nil then e[ah]=(ax=="1")end
elseif aC=="S"and ah=="rules"then e.ARrules=ax elseif aC=="S"and ah=="stop"then e.ARstop=ax elseif aC=="W"then
c.winPos={tonumber(ah)or 10,tonumber(ax)or 44}elseif aC=="G"then c.togPos={tonumber(ah)or 10,tonumber(ax)or 300}
elseif aC=="T"and ah~=""then if ah~="-"then oN[ah]=true end oO=true elseif aC=="K"and ah~=""then if ah~="-"then oP[ah]=true end
oQ=true end end if oO then e.Targets=oN end if oQ then e.CrateTicks=oP end if dM then e.Pets=dM end return true
end local function f0(cL)if not oD()then return false,"this executor cannot write files"end cL=(cL or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cL==""then return false,"give the config a name"end fT(an.dir)fT(an.cfg)if not dJ(an.cfg.."/"..cL..".txt",xL())then return false,"could not write the file"end
c.config=cL return true,cL end local function oR(f1)local oS=fU(an.cfg.."/"..f1 ..".txt")if not oS then return false,"no config called "..tostring(f1)end
if not xR(oS)then return false,"that config looks empty"end c.config=f1 return true,f1 end local function oT(jg)
if jg then fT(an.dir)dJ(an.auto,jg)elseif type(delfile)=="function"then pcall(delfile,an.auto)else dJ(an.auto,"")
end c.autoload=jg end local function xT()if c.selfPath then return c.selfPath end local f2 for Gj,xU in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",an.dir})do
for Gk,oU in ipairs(oG(xU))do local jh=oU:lower()if jh:sub(-4)==".lua"and(jh:find("sab_farm",1,true)or jh:find("sab farm",1,true))then
f2=f2 or oU end end end c.selfPath=f2 return f2 end an.stub=[[
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
local function xV()if not oD()then return false,"this executor cannot write files"end fT("autoexec")if not dJ(an.exec,an.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local f3=(function()local xW,xX=pcall(function()return game:GetService("TeleportService")end)return xW and xX or nil end)()
local function oV()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local xY=queueonteleport or queue_on_teleport return(pcall(xY,an.stub))end local function dN(xZ)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..xZ..")")pcall(fA)if c.autoload then pcall(f0,c.autoload)end local x0=oV()A(x0 and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Gl=1,30 do if not f3 then break end pcall(function()f3:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function x1()local x2,oW=pcall(function()return game:GetService("GuiService")end)if x2 and oW then
pcall(function()T(oW.ErrorMessageChanged:Connect(function()if e.Rejoin then dN("roblox error message")end end))
end)end pcall(function()local oX=game:GetService("CoreGui")local oY=oX and oX:WaitForChild("RobloxPromptGui",15)
local oZ=oY and oY:WaitForChild("promptOverlay",15)if oZ then T(oZ.ChildAdded:Connect(function(x3)if e.Rejoin and tostring(x3 .Name):lower():find("errorprompt",1,true)then dN("disconnect prompt")end
end))end end)if f3 then pcall(function()T(f3 .TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()dN("teleport retry")end)end
end))end)end end local function o0(x4)local o1=c.plot and c.plot:FindFirstChild(x4)if not o1 then return nil,false end
for Gm,ji in ipairs(o1:GetChildren())do if ji:IsA("Model")or ji:IsA("BasePart")then return ji,true end end return nil,true
end local function b3()local by=o0("RolledSquishy")if not by then return nil end return{model=by,name=by.Name,pretty=cG(by,"NameText")or ak(W(by.Name)),
rar=cG(by,"RarityText")or xs(by.Name),price=cG(by,"PriceText")}end local function o2(jj)return type(jj)=="string"and(ad.rar[W(jj)]~=nil or wu(jj))
end local function ac()local jk=o0("SquishyEquipped")if jk then c.carrySrc,j.heldAt="model",y()return jk.Name,jk end
local o3=J.Character if o3 then for Gn,dO in ipairs(o3:GetDescendants())do if(dO:IsA("Model")or dO:IsA("Tool"))and o2(dO.Name)then
c.carrySrc,j.heldAt="character",y()return dO.Name,dO end end end local f4=J:GetAttribute("SquishyEquipped")if type(f4)=="string"and f4~=""and o2(f4)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return f4,nil end c.carrySrc=nil end local function Go()local Gp,x5=ac()return x5 end local function dP()
local o4=b3()local jl=o4 and ww(o4 .price)local jm=a_()if jl and jm and jm<jl*0.5 then return jm,jl end end local function b4(x6)
dw[#dw+1]=os.date("%H:%M:%S").." "..x6 if#dw>40 then table.remove(dw,1)end end local function x7(b5,f5)if type(b5)~="string"then return end
b4(("Roll(%s,%s)"):format(b5,tostring(f5)))if b5:lower():find("crate",1,true)then j.rolled,j.rolledAt=b5,y()return
end V.seq=V.seq+1 V.name,V.at=b5,y()V.rar=type(f5)=="string"and f5 or nil c.rolls=c.rolls+1 if aJ(b5)then A(("ROLL %s [%s] = TARGET"):format(b5,tostring(f5)))end
end local function x8(b6)if type(b6)~="table"then return end local f6=b6 .butter or b6 .itemName if type(f6)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=f6,y()if type(b6 .giftId)=="string"then local o5=af:FindFirstChild("Remotes")
local o6=o5 and o5:FindFirstChild("GiftThanks")if o6 then pcall(function()o6:FireServer(b6 .giftId)end)end end
b4("Gift("..f6 .." from "..tostring(b6 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b6 .fromName),f6))
end local function x9()local o7=af:WaitForChild("Remotes",30)if not c.alive then return end if not o7 then A("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local o8=J:GetAttribute("SquishyEquipped")
if type(o8)=="string"and o8~=""then j.heldAt=y()end end))local ye={SquishyRollAnimation=x7,InitSquishy=function(o9)V.init,V.initAt=tostring(o9),y()b4("Init("..tostring(o9)..")")end,
CrateUpdate=function(cM,o_)pcall(w3,cM)pcall(L.learn,cM)if type(cM)=="table"then local x_=o_==true or(j.rolled~=nil and y()-j.rolledAt<15)or j.waiting
if not x_ then return end local ya=not j.waiting local yb=j.on j.waiting,j.data,j.at=true,cM,y()j.on=(o_==true)
j.title=tostring(cM.title or cM.name or"crate")if j.on and not yb then j.openedAt,j.byYou=y(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then b4("CrateWindow open("..j.title..")")elseif ya then b4("Crate waiting("..j.title..")")A(j.title.." is waiting on your stand")
end else if j.waiting then b4("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local yc=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,yc)end if j.classify then local yd=y()
task.spawn(function()pcall(j.classify,yd)end)end end end,GiftReceived=x8,}for f7,yf in pairs(ye)do local jn=o7:FindFirstChild(f7)
if jn and jn:IsA("RemoteEvent")then T(jn.OnClientEvent:Connect(yf))elseif f7~="CrateUpdate"and f7~="GiftReceived"then A("remote "..f7 .." missing")end
end end local function jo()local b7=b3()if b7 then if aJ(b7 .name)then return{state="match",shown=b7 .pretty,src="pad",info=b7}
end return{state="skip",info=b7,level="idle",text=("on pad: %s [%s] - not ticked"):format(b7 .pretty,tostring(b7 .rar))}
end if V.name and(y()-V.at)<4 then if aJ(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f8(yg,yh,yi,yj)
local f9=RaycastParams.new()f9 .FilterType=Enum.RaycastFilterType.Exclude local jp={J.Character}for Gq,yk in ipairs(yj or{})do jp[#jp+1]=yk end
f9 .FilterDescendantsInstances=jp pcall(function()f9 .RespectCanCollide=true end)local pa=am:Raycast(Vector3 .new(yg,yh+4,yi),Vector3 .new(0,-30,0),f9)
return pa and pa.Position or nil end local function cN(pb)local pc=pb:FindFirstChildOfClass("Humanoid")return((pc and pc.HipHeight)or 2)+pb.HumanoidRootPart.Size.Y/2+0.2
end local function jq(yl,ym)local jr=yl:FindFirstChildOfClass("Humanoid")local yn=y()while y()-yn<ym do if jr and(jr.FloorMaterial~=Enum.Material.Air or jr.SeatPart)then return true end
ag(0.05)end return false end local function aD(yo,js,jt)local pd=yo.HumanoidRootPart pd.AssemblyLinearVelocity=Vector3 .new(0,0,0)
pd.CFrame=jt and CFrame.new(js,Vector3 .new(jt.X,js.Y,jt.Z))or CFrame.new(js)end local function b8(be,pe)local b9=ap()
if not b9 or not be then return false end local bz=be.Position local f_=math.clamp(math.max(be.Size.X,be.Size.Z)/2+2.2,3,7)
local pf=(pe and pe.MaxActivationDistance)or 10 if f_>pf-2 then f_=math.max(2.5,pf-2)end local dQ={}local function b_(dR)
dR=Vector3 .new(dR.X,0,dR.Z)if dR.Magnitude>0.05 then dQ[#dQ+1]=dR.Unit end end local pg=nS()if pg then b_(pg-bz)end
b_(be.CFrame.LookVector)b_(-be.CFrame.LookVector)b_(be.CFrame.RightVector)b_(-be.CFrame.RightVector)b_(b9 .HumanoidRootPart.Position-bz)
if#dQ==0 then b_(Vector3 .new(0,0,1))end local yp,ga=cN(b9),false for Gr,yq in ipairs(dQ)do local gb=bz+yq*f_
local ju=f8(gb.X,bz.Y,gb.Z,{be})if ju and math.abs(ju.Y-bz.Y)<14 then aD(b9,Vector3 .new(gb.X,ju.Y+yp,gb.Z),bz)
if jq(b9,0.7)then ga=true break end end end if not ga then aD(b9,bz+dQ[1]*f_+Vector3 .new(0,3,0),bz)ga=jq(b9,1)
end ag(0.12)return ga end local function ph(dS)if not dS.Parent or not dS.Enabled then return false end pcall(function()dS:InputHoldBegin()end)
ag(math.max(dS.HoldDuration,0)+0.08)pcall(function()dS:InputHoldEnd()end)return true end local function aq(pj,yr)
local ys=y()while y()-ys<yr do if pj()then return true end ag(0.05)end return pj()end local function dT(cO,yt,pk,yu)
local yv=c.zapFirst and{"zap","hold"}or{"hold","zap"}for yw,jv in ipairs(yv)do if yw==2 and(yu or not(cO.Parent and cO.Enabled and(not pk or pk())))then break end
local jw if jv=="hold"then jw=ph(cO)else jw=type(fireproximityprompt)=="function"and cO.Parent~=nil and cO.Enabled and pcall(fireproximityprompt,cO)end
if jw and aq(yt,1.2)then c.zapFirst=(jv=="zap")return true,jv end end return false end local function pl(jx)local bA=n3()
if not bA or not bA.Enabled then A("buy: nothing on the pad")return false end local jy=dA(bA)if not jy then A("buy: pad part missing")return false end
c.lastBuyAt=y()local yx,pm=V.seq,a_()local pn=ap()local yy=pn and(pn.HumanoidRootPart.Position-jy.Position).Magnitude>12
b8(jy,bA)if yy then ag(0.4)end if not bA.Enabled then A("buy aborted: pad emptied")return false end local cP=jo()
if not jx and cP.state~="match"then A("buy aborted: "..(cP.text or"pad changed"))c.matchSince=nil return false
end local jz=cP.info and cP.info.name or(cP.state=="match"and V.name)or nil local function yz()return bA.Enabled and ac()==nil and(jx or jo().state=="match")
end local yA,yB=dT(bA,function()return ac()~=nil or((not bA.Enabled)and(jx or V.seq==yx))end,yz,dP()~=nil)if yA then
aq(function()return ac()~=nil end,0.8)local dU=ac()local po=a_()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dU and ak(W(dU))or(cP.shown or"?"),(pm and po)and(" for $"..aK(pm-po))or"",yB))
if dU and jz and W(dU)~=W(jz)then A(("note: picked up %s, not %s"):format(dU,jz))end return true end local gc=b3()
if dP()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aK(a_()),(gc and gc.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(gc and gc.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function pp()local dV=ac()if not dV then c.holding=false A("place: hands are empty")
return false end if not aJ(dV)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dV))))return false end
for Gs=1,e.PlaceTries do local bB=wG()if not bB then A("place: no free station")break end local pq=dA(bB)if pq then
b8(pq,bB)local ps=ac()if not ps then c.holding=false A("place: hands emptied on the way")return false end if not aJ(ps)then A("place: what I carry changed, not waxing it")return false end
if bB.Enabled then local yC,yD=dT(bB,function()return not bB.Enabled end,function()return bB.Enabled end)if yC then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dV)),c.placed,bB.Parent.Parent.Name,yD))if o.placed then pcall(o.placed,dV)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))A(c.capMsg)end return false end function z.place()local yE=y()while c.alive and z.editing and y()-yE<25 do ag(0.2)end
if e.Teams and e.TeamWax~=""then z.placing=true local yF=y()while c.alive and z.current()~=e.TeamWax and y()-yF<5 do ag(0.1)end
if z.current()==e.TeamWax then ag(0.3)else A("wax team did not come on in time - placing anyway")end end local yG,pt=pcall(pp)
z.placing=false if not yG then error(pt,0)end return pt end local function pu(pv)return type(pv)=="string"and pv:lower():find("crate",1,true)~=nil
end local yH={SABFarmGui=1,SABToggle=1,SABError=1}local function jA(yI)local bC=yI while bC do if yH[bC.Name]then return false end
if bC:IsA("ScreenGui")then local yJ,yK=pcall(function()return bC.Enabled end)return(not yJ)or yK~=false end if bC:IsA("GuiObject")and not bC.Visible then return false end
bC=bC.Parent end return false end local function gd(ge)local cQ=""pcall(function()if ge:IsA("TextButton")then cQ=ge.Text end end)
if not cQ:find("%a")then for Gt,gf in ipairs(ge:GetDescendants())do if(gf:IsA("TextLabel")or gf:IsA("TextButton"))and gf.Text:find("%a")then cQ=gf.Text break end
end end if not cQ:find("%a")then cQ=ge.Name end return(cQ:lower():gsub("[^%a]",""))end local function yL()local dW,dX
local pw=J:FindFirstChildOfClass("PlayerGui")if not pw then return nil,nil end for Gu,dY in ipairs(pw:GetDescendants())do
if dY:IsA("GuiButton")and jA(dY)then local jB=gd(dY)if jB:sub(1,4)=="open"and not jB:find("shop",1,true)then dW=dW or dY end
if jB:sub(1,7)=="discard"then dX=dX or dY end end end if dW and dX then return dW,dX end if j.on then return dW,dX end
return nil,nil end local jC=(function()local yM,yN=pcall(function()return game:GetService("VirtualInputManager")end)return yM and yN or nil end)()
local function px(bf,jD)local jE={}local function py(yO)jE[#jE+1]=yO end if c.tapWay then py(c.tapWay)end for Gv,pz in ipairs({"touch","conn","signal"})do
if pz~=c.tapWay then py(pz)end end local function pA(yP,...)local yQ,jF=pcall(getconnections,yP)if not(yQ and type(jF)=="table"and#jF>0)then return false end
local pB,yR,yS=false,{...},select("#",...)for Gw,yT in ipairs(jF)do if pcall(function()yT:Fire(table.unpack(yR,1,yS))end)then pB=true end
end return pB end local function pC()local pD=Vector3 .new(0,0,0)pcall(function()local pE,pF=bf.AbsolutePosition,bf.AbsoluteSize
pD=Vector3 .new(pE.X+pF.X/2,pE.Y+pF.Y/2,0)end)local jG={Position=pD,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jG.UserInputType=Enum.UserInputType.Touch end)pcall(function()jG.UserInputState=Enum.UserInputState.End end)
return jG end for Gx,bh in ipairs(jE)do local dZ=false if bh=="conn"and type(getconnections)=="function"then if pA(bf.MouseButton1Click)then
dZ=true if aq(jD,1.5)then c.tapWay=bh return true,bh end end dZ=pA(bf.Activated,pC(),1)elseif bh=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bf.MouseButton1Click)then if aq(jD,1.5)then c.tapWay=bh return true,bh end end dZ=pcall(firesignal,bf.Activated,pC(),1)
elseif bh=="touch"and jC then dZ=pcall(function()local pG,pH=bf.AbsolutePosition,bf.AbsoluteSize local pI=0 local pJ=bf:FindFirstAncestorWhichIsA("ScreenGui")
local yU,yV=pcall(function()return pJ and pJ.IgnoreGuiInset end)if not(yU and yV)then pcall(function()pI=game:GetService("GuiService"):GetGuiInset().Y end)
end local pK,pL=pG.X+pH.X/2,pG.Y+pH.Y/2+pI jC:SendMouseButtonEvent(pK,pL,0,true,game,1)task.wait(0.06)jC:SendMouseButtonEvent(pK,pL,0,false,game,1)
end)end if dZ and aq(jD,1.5)then c.tapWay=bh return true,bh end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jH(pM)local d0=pM.Parent while d0 and d0~=c.plot do if j.NOT[d0 .Name]then return false end d0=d0 .Parent
end local jI=(pM.ActionText or""):lower()if jI:find("roll",1,true)or jI:find("place",1,true)or jI:find("sell",1,true)then return false end
return true end local function pN()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local pO=c.plot:FindFirstChild("CrateStand")local d1 if pO then for Gy,gg in ipairs(pO:GetDescendants())do
if gg:IsA("ProximityPrompt")and gg.Enabled and jH(gg)then d1=gg break end end end if not d1 then for Gz,bD in ipairs(c.plot:GetDescendants())do
if bD:IsA("ProximityPrompt")and bD.Enabled and jH(bD)then local pP=bD:FindFirstAncestorWhichIsA("Model")local yW=((bD.ActionText or"").." "..(bD.ObjectText or"").." "..bD.Name.." "..(pP and pP.Name or"")):lower()
if yW:find("crate",1,true)then d1=bD break end end end end j.prompt=d1 return d1 end local function jJ()if j.on then return true end
local d2=pN()if not d2 then j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local pQ=dA(d2)if pQ then b8(pQ,d2)end j.ours=true dT(d2,function()return j.on end)if aq(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: pressed "..fu(d2).." but no window came up")
return false end do local function yX(pR)local cR=pR.Parent while cR and cR:IsA("GuiObject")do local pS,pT=false,false
for GA,d3 in ipairs(cR:GetDescendants())do if d3~=pR and d3:IsA("GuiButton")and gd(d3):sub(1,7)=="discard"then pS=true end
if d3:IsA("TextLabel")then local jK=d3 .Text:lower()if jK:find("crate",1,true)or jK:find("can contain",1,true)or jK:find("cost",1,true)then pT=true end
end if pS and pT then return cR end end cR=cR.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local pU=J:FindFirstChildOfClass("PlayerGui")if not pU then return nil end for GB,gh in ipairs(pU:GetDescendants())do
if gh:IsA("GuiButton")and not gh:FindFirstAncestor("SABFarmGui")and gd(gh):sub(1,4)=="open"then local jL=yX(gh)
if jL then j.win=jL return jL end end end end local function yY(yZ)for GC,gi in ipairs(yZ:GetDescendants())do
if gi:IsA("GuiButton")then local pV,jM=gd(gi),gi.Name:lower()if pV=="x"or pV=="close"or jM=="x"or jM:find("close",1,true)or jM:find("exit",1,true)then return gi end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(y0)task.wait(y0 and 4 or 1.2)if j.on or j.waiting then return end
local gj=j.findWin()if not gj or not jA(gj)then return end local pW=yY(gj)if pW and px(pW,function()return not jA(gj)end)then return end
A("the crate window is still open - tap its X")end end local function d4(gk)if not jJ()then return false end local pX=y()-(j.openedAt or 0)
if pX<0.6 then ag(0.6-pX)end local jN=j.title local y1,y2=yL()local pY=gk and y1 or y2 if not pY then j.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(gk and"Open"or"Discard",jN))return false
end local y3=ac()local y4,GD=px(pY,function()return(not j.on)or(ac()~=nil and ac()~=y3)end)if not y4 then j.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(gk and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gk then c.crates=c.crates+1 aq(function()return ac()~=nil end,1.5)local pZ=ac()
A(("OPENED %s -> %s"):format(jN,pZ and ak(W(pZ))or"?"))else A("discarded "..jN.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(y5,...)local y6=select("#",...)j.calls[#j.calls+1]={t=y(),m=y5,n=y6,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aE,bi)local bE=type(aE)if(bE=="string"or bE=="number")and type(bi.data)=="table"then for p0,jO in pairs(bi.data)do
if jO==aE and type(p0)=="string"and(type(jO)=="string"or type(jO)=="number")then return{__slot="f:"..p0}end end
end if bE=="string"then if bi.crate and aE==bi.crate then return{__slot="crate"}end if bi.title and aE==bi.title then return{__slot="title"}end
if bi.rar and aE==bi.rar then return{__slot="rarity"}end return aE end if bE=="number"or bE=="boolean"or bE=="nil"then return aE end
if bE=="table"then local p1={}for y7,p2 in pairs(aE)do if type(p2)=="table"then return nil,"nested table"end local y8,p3=j.slot(p2,bi)
if p3 then return nil,p3 end p1[y7]=y8 end return p1 end local y9,y_=pcall(function()return aE:IsA("Instance")end)
if y9 and y_ then if aE==J then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gl=c.plot and c.plot:FindFirstChild("CrateStand")if gl and aE==gl then return{__slot="stand"}end if gl and aE.Parent==gl then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bE..")"end function j.resolve(gm)if type(gm)~="table"then return gm end
local aR=gm.__slot if aR and aR:sub(1,2)=="f:"then return j.data and j.data[aR:sub(3)]end if aR=="crate"then return j.data and j.data.name end
if aR=="title"then return(j.data and j.data.title)or j.title end if aR=="rarity"then return j.data and j.data.rarity end
if aR=="player"then return J end if aR=="plot"then return c.plot end if aR=="stand"or aR=="model"then local jP=c.plot and c.plot:FindFirstChild("CrateStand")
if aR=="stand"or not jP then return jP end for GE,p4 in ipairs(jP:GetChildren())do if pu(p4 .Name)then return p4 end end
return nil end local p5={}for za,zb in pairs(gm)do p5[za]=j.resolve(zb)end return p5 end function j.classify(jQ)
if j.directOff then return end local gn={}for GF,jR in ipairs(j.calls)do if jR.t<=jQ+0.05 and jQ-jR.t<=6 then gn[#gn+1]=jR end
end if#gn==0 then return end if not aq(function()return(j.heldAt or 0)>=jQ-1 end,2.5)then return end local d5={}
for GG,d6 in ipairs(gn)do local p6={}for p7=1,d6 .n do local zc,p8=j.slot(d6 .args[p7],d6)if p8 then A("crate call has "..p8 .." - keeping the button method")
return end p6[p7]=zc end d5[#d5+1]={m=d6 .m,n=d6 .n,args=p6}end local jS=j.learned j.learned={seq=d5,mode=jS and jS.mode or nil}
aj.dirty=true if not jS then A(("learned how to open crates directly (%d call%s)"):format(#d5,#d5==1 and""or"s"))end
end function j.replay()local p9=j.learned local p_=af:FindFirstChild("Remotes")local jT=p_ and p_:FindFirstChild("CrateAction")
if not(p9 and jT)then return false end local qa=table.unpack or unpack j.replaying=true for GH,d7 in ipairs(p9 .seq)do
local jU={}for qb=1,d7 .n do jU[qb]=j.resolve(d7 .args[qb])end task.spawn(function()pcall(function()if d7 .m=="InvokeServer"then jT:InvokeServer(qa(jU,1,d7 .n))
else jT:FireServer(qa(jU,1,d7 .n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(zd)return(zd:gsub("[%%|;=,\n]",function(ze)return("%%%02X"):format(ze:byte())end))end
function j.enc(ca)local go=type(ca)if go=="string"then return"s"..j.esc(ca)end if go=="number"then return"n"..tostring(ca)end
if go=="boolean"then return ca and"b1"or"b0"end if go=="nil"then return"z"end if ca.__slot then return"k"..ca.__slot end
local jV={}for zf,zg in pairs(ca)do jV[#jV+1]=j.enc(zf).."="..j.enc(zg)end return"t"..table.concat(jV,",")end
function j.dec(qc)local d8,d9=qc:sub(1,1),qc:sub(2)local function zh(zi)return(zi:gsub("%%(%x%x)",function(zj)return string.char(tonumber(zj,16))end))end
if d8=="s"then return zh(d9)end if d8=="n"then return tonumber(d9)end if d8=="b"then return d9=="1"end if d8=="k"then return{__slot=d9}end
if d8=="t"then local qe={}for zk in d9:gmatch("[^,]+")do local qf,zl=zk:match("^(.-)=(.*)$")if qf then local qg=j.dec(qf)
if qg~=nil then qe[qg]=j.dec(zl)end end end return qe end return nil end function j.goneOrNew(zm)return function()
if not j.waiting then return true end local qh=ac()return qh~=nil and qh~=zm end end function j.near()local qi=af:FindFirstChild("Remotes")
local jW=qi and qi:FindFirstChild("CrateAction")local gp=ap()local jX=c.plot and c.plot:FindFirstChild("CrateStand")
local jY=jX and jX:FindFirstChild("Spot")if not(jW and gp and jY)then A(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not jW and"no CrateAction remote"or not gp and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jZ=gp.HumanoidRootPart local gq=jZ.CFrame local qj,j0=j.title,"no answer"local zn=ac()local qk=jX:FindFirstChild("Holder")
local function ql()if not qk then return j.waiting or j.on end for GI,zo in ipairs(qk:GetChildren())do if zo:IsA("Model")then return true end end
return false end for zp=1,3 do if not(j.waiting or j.on)or not ql()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end if(jZ.Position-jY.Position).Magnitude>8 then b8(jY,j.prompt)end ag(0.12+0.15*zp)
local a4={}j.replaying=true task.spawn(function()a4 .ok,a4 .v=pcall(function()return jW:InvokeServer("open")end)
a4 .done=true end)aq(function()return a4 .done end,6)j.replaying=false local cb=a4 .v if a4 .done and a4 .ok and type(cb)=="table"and cb.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(qj,cb.prize and ak(W(tostring(cb.prize)))or"?"))
aq(function()local qm=ac()return qm~=nil and qm~=zn end,1.5)if(jZ.Position-gq.Position).Magnitude>8 then pcall(function()aD(gp,gq.Position,gq.Position+gq.LookVector)end)end
return true,"opened"end j0=(a4 .done and a4 .ok and type(cb)=="table")and tostring(cb.reason or"refused, no reason given")
or(a4 .done and("error: "..tostring(cb))or"no answer in 6s")ag(0.3)if not ql()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(qj,j0))
return false,j0 end j.GIVEUP=600 function j.drop()local qo=af:FindFirstChild("Remotes")local qp=qo and qo:FindFirstChild("CrateAction")
local qq=c.plot and c.plot:FindFirstChild("CrateStand")local j1=qq and qq:FindFirstChild("Spot")local qr=ap()
if j1 and qr and(qr.HumanoidRootPart.Position-j1 .Position).Magnitude>8 then b8(j1,j.prompt)ag(0.3)end local j2,bj=false,nil
if qp then j2,bj=pcall(function()return qp:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(j2 and type(bj)=="table"and bj.ok)and"done"or("answer: "..tostring(type(bj)=="table"and(bj.reason or bj.ok)or bj))))
j.waiting,j.on,j.quietUntil=false,false,y()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(j2 and type(bj)=="table"and bj.ok)then d4(false)end end function j.smart()local j3=j.title if(j.nearFails or 0)<3 then
local zq=j.near()if zq then return true end if j.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local cc=j.learned if cc then local j4=ac()if j.on then j.replay()if aq(j.goneOrNew(j4),3.5)then c.crates=c.crates+1
A("OPENED "..j3 .." (direct)")return true end else if cc.mode~="window"then j.replay()if aq(j.goneOrNew(j4),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="direct"then cc.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..j3 .." (direct, no window)")return true end end if jJ()then j.replay()if aq(j.goneOrNew(j4),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="window"then cc.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..j3 .." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,aj.dirty=cc,nil,true
if j.fails>=3 then j.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return d4(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for zr,qs in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(qs):Connect(function()D.cache[zr]=J:GetAttribute(qs)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(zs,...)local gr=D.cache
local zt={m=zs,n=select("#",...),args={...},before={rules=gr.rules,stop=gr.stop,on=gr.on,main=gr.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,zt)end end)end function D.learnOne(d_)local ay,ea=D.snap(),d_.before local gs=(ay.rules~=ea.rules)or(ay.stop~=ea.stop)
local qt=(ay.on~=ea.on)or(ay.main~=ea.main)if not gs and not qt then return end local qu={}for qv=1,d_.n do local aL=d_.args[qv]
local cd=type(aL)if cd=="string"and aL~=""and aL==ay.rules then aL={__slot="rules"}elseif cd=="string"and aL~=""and gs and aL==ay.stop and ay.stop~=ea.stop then aL={__slot="stop"}
elseif cd=="table"then local qw={}for zu,cS in pairs(aL)do if type(cS)=="table"or(type(cS)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end qw[zu]=(type(cS)=="string"and cS~=""and cS==ay.rules)and{__slot="rules"}or cS end aL=qw elseif cd~="string"and cd~="number"and cd~="boolean"and cd~="nil"then
if aL==J then aL={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end qu[qv]=aL
end local cT={m=d_.m,n=d_.n,args=qu}if gs then local j5=false for zv=1,cT.n do local eb=cT.args[zv]if type(eb)=="table"and eb.__slot=="rules"then j5=true end
if type(eb)=="table"and not eb.__slot then for GJ,qx in pairs(eb)do if type(qx)=="table"and qx.__slot=="rules"then j5=true end end
end end if j5 then D.rec.rules={cT}else table.insert(D.rec.rules,cT)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if qt then if ay.on==true then D.rec.on=cT else D.rec.off=cT end e.AutoRoll=(ay.on==true)end if ay.rules and ay.rules~=""then e.ARrules,e.ARstop=ay.rules,ay.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gs and"choices"or(ay.on and"on"or"off")))end
function D.resolve(cU)if type(cU)~="table"then return cU end if cU.__slot=="rules"then return e.ARrules~=""and e.ARrules or J:GetAttribute("AutoRollRules")end
if cU.__slot=="stop"then return e.ARstop~=""and e.ARstop or J:GetAttribute("AutoRollStop")end if cU.__slot=="player"then return J end
local qy={}for zw,zx in pairs(cU)do qy[zw]=D.resolve(zx)end return qy end function D.replay(qz,zy)local qA=table.unpack or unpack
for GK,ec in ipairs(zy)do local j6={}for qB=1,ec.n do j6[qB]=D.resolve(ec.args[qB])end D.replaying=true pcall(function()
if ec.m=="InvokeServer"then task.spawn(function()pcall(function()qz:InvokeServer(qA(j6,1,ec.n))end)end)else qz:FireServer(qA(j6,1,ec.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(qC,zz)if D.busy or not c.alive then return end D.busy=true
pcall(function()local qD=af:FindFirstChild("Remotes")local j7=qD and qD:FindFirstChild("AutoRollAction")if not j7 then D.msg="this game has no AutoRollAction"return end
local bF=e.AutoRoll if bF and e.ARrules~=""and J:GetAttribute("AutoRollRules")~=e.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(j7,D.rec.rules)
if aq(function()return J:GetAttribute("AutoRollRules")==e.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bF==D.isOn()or(not bF and not zz)then return end
local gt=bF and D.rec.on or D.rec.off if not gt then local ed=bF and D.rec.off or D.rec.on local qE=ed~=nil for zA=1,ed and ed.n or 0 do
if type(ed.args[zA])=="boolean"then qE=false end end if qE then gt=ed end end if not gt then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bF and"on"or"off")
A(D.msg)return end D.replay(j7,{gt})if aq(function()return D.isOn()==bF end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bF and"ON"or"OFF",qC and(" ("..qC..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local zB,zC=pcall(function()return J.UserId end)return zB and zC or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local zD,j8=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if zD and type(j8)=="table"and type(j8 .Pets)=="table"then q.I=j8 end return q.I end function q.order()if q.list then return q.list end
local bG=q.info()if not bG then return{}end local ce={}if type(bG.Order)=="table"and#bG.Order>0 then for GL,qF in ipairs(bG.Order)do if bG.Pets[qF]then ce[#ce+1]=qF end end
else for zE in pairs(bG.Pets)do ce[#ce+1]=zE end table.sort(ce,function(zF,zG)return(bG.Pets[zF].price or 0)<(bG.Pets[zG].price or 0)end)
end q.list=ce return ce end function q.nice(qG,j9)local qH=q.info()local qI=qH and qH.Pets[qG]return((j9 and j9~="")and(j9 .." ")or"")..(qI and qI.displayName or tostring(qG))
end function q.data()local gu=J:GetAttribute("PetsData")if type(gu)~="string"then return nil end if gu==q.rawD then return q.lastD end
local zH,ee=pcall(function()return q.HS:JSONDecode(gu)end)ee=(zH and type(ee)=="table")and ee or nil q.rawD,q.lastD=gu,ee
return ee end function q.pen()return af:FindFirstChild("PetMeadowSpawns")end function q.srv()return am:GetServerTimeNow()end
function q.money()local j_=J:FindFirstChild("MoneyValue")if j_ and type(j_.Value)=="number"then return j_.Value end
return a_()or 0 end function q.wishes()local qJ=q.pen()local qK=qJ and qJ:GetAttribute("Wishes")local ka,qL={},q.srv()
if type(qK)~="string"then return ka end local zI,qM=pcall(function()return q.HS:JSONDecode(qK)end)if zI and type(qM)=="table"then
for zJ,kb in pairs(qM)do if type(kb)=="number"and kb>qL then ka[zJ]=kb-qL end end end return ka end function q.call(...)
local qN=af:FindFirstChild("Remotes")local qO=qN and qN:FindFirstChild("PetRequest")if not qO then return nil end
local qP=table.pack(...)local cf={}task.spawn(function()cf.ok,cf.v=pcall(function()return qO:InvokeServer(table.unpack(qP,1,qP.n))end)
cf.done=true end)local zK=y()while not cf.done and y()-zK<6 do task.wait(0.05)end if cf.done and cf.ok then return cf.v end
return nil end function q.want(zL)return e.Pets[zL]end function q.closeNaming(kc)local qR=pcall(function()local qQ=J:FindFirstChild("PlayerScripts")
local zM=qQ and qQ:FindFirstChild("Naming",true)require(zM).close()end)ag(0.5)if kc.Visible then pcall(function()local qS=kc:FindFirstChild("NameBox",true)if qS then qS:ReleaseFocus()end end)
kc.Visible=false qR=false end return qR end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qT=J:FindFirstChildOfClass("PlayerGui")
local qU=qT and qT:FindFirstChild("MainGui")local gv=qU and qU:FindFirstChild("PetNameGui")if gv and gv.Visible then
ag(0.4)if gv.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gv)break end end ag(0.25)end
q.namingOn=false end)end function q.buyTick()if not e.PetBuy then q.buyMsg="auto adopt is off"return end local kd,qV,gw=q.info(),q.pen(),q.data()
if not(kd and qV and gw)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local ef,ke=#(gw.pets or{}),tonumber(gw.maxOwned)or 60
local zN,qW,eg=q.srv(),{},nil for GM,aS in ipairs(qV:GetChildren())do qW[aS.Name]=true local cg,gx=aS:GetAttribute("Pet"),aS:GetAttribute("Variant")or""
local kf=cg and q.want(cg)if kf and kf.b and kd.Pets[cg]and(not kf.g or gx=="Big")and C.wantMore(cg,gx,gw)and not aS:GetAttribute("A_"..q.uid)
and(tonumber(aS:GetAttribute("ExpiresAt"))or 0)>zN+1 and y()>=(q.tryAt[aS.Name]or 0)then local eh,qX=q.nice(cg,gx),kd.Pets[cg].price or 0
if ef>=ke then eg=("%s is in the pen, but you have %d/%d pets"):format(eh,ef,ke)q.tryAt[aS.Name]=y()+15 elseif q.money()<qX then
eg=("%s is in the pen - need $%s"):format(eh,aK(qX))q.tryAt[aS.Name]=y()+5 else q.tryAt[aS.Name]=y()+8 local bH=q.call("adopt",aS.Name)
if type(bH)=="table"and bH.ok then ef=ef+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local zO=type(bH.pet)=="table"and bH.pet or{}
table.insert(q.recent,{id=tostring(zO.id or("?"..y())),name=cg,variant=gx,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..eh)q.skipNaming()eg="adopted "..eh else local qY=type(bH)=="table"and tostring(bH.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(eh,qY))eg="adopt failed: "..qY if type(bH)=="table"and bH.bagFull then q.tryAt[aS.Name]=y()+60 end
end end end end for qZ in pairs(q.tryAt)do if not qW[qZ]then q.tryAt[qZ]=nil end end q.buyMsg=eg or("watching the pen (%d/%d pets)"):format(ef,ke)
end function q.wishTick()if not e.PetWish then q.wishMsg="auto wish is off"return end local gy=q.info()if not(gy and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local cj,kg,bI=q.wishes(),0,nil local zP=(type(gy.Wish)=="table"and gy.Wish.cashShare)or 2
local zQ=q.data()for GN,aA in ipairs(q.order())do local q0=q.want(aA)if q0 and q0 .w and C.wantMore(aA,"",zQ)then
kg=kg+1 if not cj[aA]and y()>=(q.wishTry[aA]or 0)then local kh=tonumber(J:GetAttribute("PetWishCredits"))or 0
local ki=math.floor((gy.Pets[aA].price or 0)*zP)if kh<=0 and q.money()<ki then q.wishTry[aA]=y()+10 bI=("need $%s to wish for %s"):format(aK(ki),q.nice(aA))
q.wishWhy[aA]=bI else q.wishTry[aA]=y()+3 local zR=kh>0 and"wishCredit"or"wish"local gz=q.call(zR,aA)if type(gz)=="table"and gz.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),kh>0 and"free wish"or("$"..aK(ki))))
else local kj=type(gz)=="table"and tostring(gz.reason or"no reason given")or"no answer"if kj:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),kj))bI="wish failed: "..kj end end end end end end if not bI then
for GO,gA in ipairs(q.order())do local q1=q.want(gA)if q1 and q1 .w and not cj[gA]and q.wishWhy[gA]then bI=q.wishWhy[gA]break end
end end if not bI then local cV={}for GP,gB in ipairs(q.order())do local q2=q.want(gB)if q2 and q2 .w and cj[gB]then cV[#cV+1]=("%s %dm"):format(q.nice(gB),math.ceil(cj[gB]/60))end
end local gC for GQ,gD in ipairs(q.order())do local q3=q.want(gD)if q3 and q3 .w and cj[gD]and(not gC or cj[gD]<gC)then gC=cj[gD]end
end bI=kg==0 and"no pet has WISH ticked"or(#cV==0 and"running: none yet")or(#cV<=3 and("running: "..table.concat(cV,", ")))
or("%d running, the next one ends in %dm"):format(#cV,math.ceil((gC or 0)/60))end q.wishMsg=bI end z.switches,z.glazed,z.finished=0,0,0
z.done,z.doneN,z.later={},0,{}function z.teams()local kk=q.data()return(kk and kk.teams)or{},kk end function z.current(cW)
cW=cW or q.data()if not cW then return""end local q4={}for GR,zS in ipairs(cW.equipped or{})do q4[tostring(zS)]=true end
for GS,q5 in ipairs(cW.teams or{})do local q6=q5 .pets or{}local kl=#q6==#(cW.equipped or{})if kl then for GT,zT in ipairs(q6)do if not q4[tostring(zT)]then kl=false break end end end
if kl then return q5 .name end end return""end function z.equip(km)local zU,zV=z.teams()local kn for zW,zX in ipairs(zU)do if zX.name==km then kn=zW break end end
if not kn then z.msg="no saved team called "..tostring(km)return false end if z.current(zV)==km then return true end
for GU=1,4 do local q7=q.call("teamEquip",kn)if type(q7)=="table"and q7 .ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(zY)local q8=zY:FindFirstChild("SquishyPlaceHolder")local q9=q8 and q8:FindFirstChild("TimerGui")
local q_=q9 and q9:FindFirstChildWhichIsA("TextLabel",true)local ko=q_ and q_.Text if type(ko)~="string"or ko:find("-",1,true)then return nil end
local kp,ra,rb=ko:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not kp then return nil end local rc=rb~=""and(tonumber(kp)*3600+tonumber(ra)*60+tonumber(rb))or(tonumber(kp)*60+tonumber(ra))
return rc>0 and rc or nil end function z.waxes()local ei={}local rd=c.plot and c.plot:FindFirstChild("WaxStations")
if not rd then return ei end local rf=q.srv()for GV,a5 in ipairs(rd:GetChildren())do local kq=tonumber(a5:GetAttribute("PourEnd"))
local rg=a5:GetAttribute("PourOwner")if a5:GetAttribute("HasSquishy")and a5:GetAttribute("PourId")and(rg==nil or rg==q.uid)then
local kr=z.left(a5)local rh=kr and(rf+kr)or((kq and kq>rf)and kq or nil)if rh then local ri,rj=a5:FindFirstChild("SquishyPlaceHolder"),"?"
if ri then for GW,rk in ipairs(ri:GetChildren())do if rk:IsA("Model")then rj=rk.Name break end end end local zZ=tostring(a5:GetAttribute("Helpers")or"")
local ks=0 for GX in zZ:gmatch("%d+")do ks=ks+1 end ei[#ei+1]={st=a5,ends=rh,sure=kr~=nil,id=a5:GetAttribute("PourId"),name=rj,helps=ks,
long=a5:GetAttribute("PourLong")==true}end end end table.sort(ei,function(z0,z1)return z0 .ends<z1 .ends end)
return ei end function z.glazeCount()local rl=af:FindFirstChild("Remotes")local rm=rl and rl:FindFirstChild("EditStack")
if not rm then return nil end local z2,ej=pcall(function()return rm:InvokeServer("State",nil)end)if not(z2 and type(ej)=="table"and type(ej.state)=="table")then return nil end
local kt,ku=0,{}for GY,gE in ipairs(ej.state.entries or{})do if gE.glaze and gE.glaze~=""then kt=kt+1 ku[gE.glaze]=(ku[gE.glaze]or 0)+1 end
end return kt,ku,#(ej.state.entries or{}),ej.state.capacity end function z.finishedOne(gF,rn)z.finished=z.finished+1
task.wait(2)local kv,z3,ro,z4=z.glazeCount()if kv and rn and kv>rn then z.glazed=z.glazed+1 local kw={}for z5,z6 in pairs(z3)do kw[#kw+1]=z5 .." "..z6 end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gF.name)),gF.st.Name,kv,table.concat(kw,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gF.st.Name,ak(W(gF.name)),ro and(" (stack "..ro.."/"..tostring(z4)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not e.Teams then z.want,z.msg="","auto teams is off"return end
local ck=q.srv()local aF=z.glazeFor if aF then local ek=aF.st local rp=ek.Parent and ek:GetAttribute("HasSquishy")and ek:GetAttribute("PourId")==aF.id
local rq=rp and z.left(ek)if rq then aF.ends=ck+rq end if not rp then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local z7=aF.before
task.spawn(function()pcall(z.finishedOne,aF,z7)end)end elseif aF.ends-ck>e.GlazeLead*3+60 or ck>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(ek.Name,z.clock(aF.ends-ck)))
end end if e.TeamGlaze~=""and not z.glazeFor then local z8=z.speedRatio(e.TeamGlaze)for GZ,cl in ipairs(z.list)do
if cl.sure and(cl.ends-ck)*z8[cl.long and 2 or 1]<=e.GlazeLead and y()>=(z.later[cl.id or"?"]or 0)and not z.done[cl.id or"?"]then
z.glazeFor=cl task.spawn(function()cl.before=z.glazeCount()end)break end end end local aG,el="",""local cX=e.SnapGlaze~=false and o.snapAt and(o.snapAt-ck)
if cX and cX<-8 then o.snapAt,cX=nil,nil end if e.TeamGlaze~=""and cX and cX<=20 then aG,el=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cX)))
elseif e.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,el=e.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,el=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and z.allBusy()then
aG,el=e.TeamFull," - every station is busy"else aG=e.TeamNormal end z.want=aG local em=z.current()z.cur=em if aG~=""and em~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..el)else z.nextTry=y()+3 end end local kx=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(em~=""and em or"(not a saved team)",(aG~=""and aG~=em)and(" -> "..aG)or"",
kx and("in "..z.clock(kx.ends-ck).." (st "..kx.st.Name..")")or"- none running")end function z.clock(bJ)bJ=math.max(0,math.floor(bJ))
if bJ>=3600 then return("%d:%02d:%02d"):format(math.floor(bJ/3600),math.floor((bJ%3600)/60),bJ%60)end return("%d:%02d"):format(math.floor(bJ/60),bJ%60)
end function z.allBusy()local z9,z_=fw()return z_>0 and z9==0 end function z.aboutToPlace()if not c.running then return false end
local rr=ac()if not(rr and aJ(rr))then return false end local Aa=fw()return Aa>0 end function z.mult(rs,Ab,rt)return{(1+rs)*(1+rt),(1+rs+Ab)*(1+rt)}end
function z.speedNow()local function ky(Ac)return tonumber(J:GetAttribute(Ac))or 0 end return z.mult(ky("PetWaxSpeed"),ky("PetLongWax"),ky("PetSocialWax"))
end function z.speedOf(Ad)local Ae,ru=z.teams()if not ru then return nil end for G0,rv in ipairs(Ae)do if rv.name==Ad then
local kz={}for G1,Af in ipairs(rv.pets or{})do for G2,rw in ipairs(ru.pets or{})do if tostring(rw.id)==tostring(Af)then kz[#kz+1]=rw break end end
end local rx=C.caps()local ry,Ag=C.stats(kz)return z.mult(math.min(ry.waxSpeed or 0,rx.waxSpeed or 0.25),math.min(ry.longWax or 0,rx.longWax or 0.3),Ag.socialWax or 0)
end end return nil end function z.speedRatio(Ah)local rz,kA=z.speedNow(),z.speedOf(Ah)if not kA then return{1,1}end
return{rz[1]/kA[1],rz[2]/kA[2]}end function z.glazeSoon()return e.Teams and e.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local kB=q.info()return(kB and type(kB.Caps)=="table")and kB.Caps or C.CAPS
end function C.value(rA,kC)local gG=q.info()local cY=gG and gG.Pets[rA]if not(cY and type(cY.boost)=="table")then return nil end
local cm if type(gG.boostValue)=="function"then local Ai,Aj=pcall(gG.boostValue,rA,(kC~=""and kC)or nil)cm=Ai and tonumber(Aj)or nil
end if not cm then cm=cY.boost.value or 0 if kC=="Big"then local rB=cm*1.5 cm=C.ROUND[cY.boost.kind]and math.max(cm+1,math.floor(rB+0.5))or rB
end end return cY.boost.kind,cm,cY.boost.every end function C.stats(Ak)local cn,kD={},{}for G3,rC in ipairs(Ak)do
local aT,gH,rD=C.value(rC.name,rC.variant or"")if aT then if aT:sub(1,6)=="social"then kD[aT]=math.max(kD[aT]or 0,gH)
elseif aT=="waxStir"or aT=="cashGift"then cn[aT]=(cn[aT]or 0)+gH*60/(rD or 60)elseif aT=="luckyPull"then cn.luckyPull=(cn.luckyPull or 0)+gH/(rD or 10)
else cn[aT]=(cn[aT]or 0)+gH end end end return cn,kD end function C.glazeGain(Al,gI)local en,kE,G4={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local Am=en[1]+en[2]+en[3]local An=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cZ={}for gJ=1,3 do cZ[gJ]=en[gJ]+Al*en[gJ]/Am+(gJ==1 and An or 0)end
local kF={cZ[1]*(1-gI),cZ[2]*(1-gI)+cZ[1]*gI,cZ[3]+cZ[2]*gI}return kF[1]*(kE[1]-1)+kF[2]*(kE[2]-1)+kF[3]*(kE[3]-1)
end function C.score(gK,Ao)local kG=C.caps()local gL,gM=C.stats(Ao)local function bk(rE)return math.min(gL[rE]or 0,kG[rE]or math.huge)end
local Ap=(1+bk("income"))*(1+(gM.socialIncome or 0))*(1+math.min(gL.cashGift or 0,kG.cashGiftPerMinute or 9)/60)
local Aq=1+bk("luck")+(gL.luckyPull or 0)+(gM.socialLuck or 0)local rF=Aq*(1+bk("newFind"))*(1+bk("rollSpeed"))
local eo=math.log(Ap)local Ar=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local kH=(1+bk("waxSpeed")+bk("longWax"))*(1+(gM.socialWax or 0))
+math.min(gL.waxStir or 0,kG.waxStirPerMinute or 30)/60/Ar local As=1-(1-bk("headStart"))*(1-(gM.socialHeadStart or 0))
if gK=="farm"then return eo+0.7*math.log(rF)+0.1*math.log(kH)end if gK=="full"then return eo+0.4*math.log(kH)+0.02*math.log(rF)end
if gK=="glaze"then return C.glazeGain(bk("glaze"),bk("glazeUp"))+0.001*eo end if gK=="wax"then return-math.log(1-0.5*As)+0.001*eo+0.001*math.log(kH)end
return eo end function C.best(rG,c0,At,kI)kI=kI or{}local az,ep={},{}local function rH(Au)local rI={}for Av,Aw in ipairs(Au)do rI[Av]=c0[Aw]end return rI end
local function kJ(rJ)local kK=C.score(rG,rH(rJ))for G5,Ax in ipairs(rJ)do if kI[c0[Ax].id]then kK=kK+1e-7 end end
return kK end for G6=1,math.min(At,#c0)do local gN,kL for kM=1,#c0 do if not ep[kM]then az[#az+1]=kM local rK=kJ(az)
az[#az]=nil if not kL or rK>kL+1e-12 then gN,kL=kM,rK end end end if not gN then break end ep[gN]=true az[#az+1]=gN
end for G7=1,6 do task.wait()local rL,rM=false,kJ(az)for kN=1,#az do for kO=1,#c0 do if not ep[kO]then local rN=az[kN]
az[kN]=kO local rO=kJ(az)if rO>rM+1e-9 then ep[rN],ep[kO],rM,rL=nil,true,rO,true else az[kN]=rN end end end end
if not rL then break end end local rP={}for Ay,Az in ipairs(az)do rP[Ay]=tostring(c0[Az].id)end return rP,C.score(rG,rH(az))
end function C.count(rQ,rR,AA)local eq,er={},0 local rS,rT={},{}for G8,AB in ipairs(rR.arriving or{})do rS[tostring(AB)]=true end
for G9,c1 in ipairs(rR.pets or{})do rT[tostring(c1 .id)]=true if c1 .name==rQ and not rS[tostring(c1 .id)]then
if c1 .variant=="Big"then er=er+1 elseif(c1 .variant or"")==""then eq[#eq+1]=c1 end end end if not AA then for G_,es in ipairs(q.recent or{})do
if es.name==rQ and not rT[es.id]and y()-es.at<20 then if es.variant=="Big"then er=er+1 else eq[#eq+1]=es end end
end end return eq,er end function C.goal(AC)local rU=e.Pets[AC]return rU and tonumber(rU.f)or 0 end function C.wantMore(rV,AD,rW)
local kP=C.goal(rV)if kP<=0 or not rW then return true end local AE,rX=C.count(rV,rW)if rX>=kP then return false end
if AD=="Big"then return true end return#AE<C.need()*(kP-rX)end function C.status(rY,rZ)local gO=C.goal(rY)if gO<=0 or not rZ then return nil end
local AF,kQ=C.count(rY,rZ)if kQ>=gO then return("Big %d/%d done"):format(kQ,gO)end return("%d/%d to fuse, Big %d/%d"):format(math.min(#AF,C.need()),C.need(),kQ,gO)
end function C.wear(kR)local kS={}for Ha,AG in ipairs(kR)do kS[tostring(AG)]=true end for Hb=1,3 do local c2=q.data()
if not c2 then return false end for Hc,r0 in ipairs(c2 .equipped or{})do if not kS[tostring(r0)]then q.call("unequip",r0)task.wait(0.3)end
end c2=q.data()local r1={}for Hd,AH in ipairs(c2 .equipped or{})do r1[tostring(AH)]=true end for He,r2 in ipairs(kR)do
if not r1[tostring(r2)]then q.call("equip",r2)task.wait(0.3)end end task.wait(0.4)c2=q.data()local kT,r3=0,true
for Hf,AI in ipairs(c2 .equipped or{})do kT=kT+1 if not kS[tostring(AI)]then r3=false end end if r3 and kT==#kR then return true end
end return false end function C.saveTeam(r4,r5)if not C.wear(r5)then return false,"could not put the pets on"end
local AJ=z.teams()local co for AK,AL in ipairs(AJ)do if AL.name==r4 then co=AK break end end local c3 if co then
c3=q.call("teamSave",co)else c3=q.call("teamNew")if type(c3)=="table"and c3 .ok and c3 .index then co=c3 .index
task.wait(0.3)q.call("teamRename",{index=co,name=r4})end end task.wait(0.4)local kU=q.data()local r6=kU and kU.teams and co and kU.teams[co]
if not r6 then return false,"the game did not save it"end local r7={}for Hg,AM in ipairs(r6 .pets or{})do r7[tostring(AM)]=true end
for Hh,AN in ipairs(r5)do if not r7[tostring(AN)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local AO=q.srv()for Hi,AP in ipairs(z.list or{})do if AP.ends-AO<(e.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local et=q.data()if not et then return{}end local r8={}for Hj,AQ in ipairs(et.arriving or{})do r8[tostring(AQ)]=true end
local eu={}for Hk,gP in ipairs(et.pets or{})do if not r8[tostring(gP.id)]then eu[#eu+1]={id=tostring(gP.id),name=gP.name,variant=gP.variant or""}end
end local r9={}for Hl,r_ in ipairs(eu)do r9[r_.id]=r_ end local sa=tonumber(et.slots)or 3 local kV,sb={},{}for Hm,gQ in ipairs(C.ROLES)do
local ev=e[gQ[1]]if ev~=""and not sb[ev]then sb[ev]=true local kW,ew,sc={},{},false for Hn,sd in ipairs(et.teams or{})do
if sd.name==ev then for Ho,AS in ipairs(sd.pets or{})do local kX=r9[tostring(AS)]if kX then kW[kX.id]=true ew[#ew+1]=kX else sc=true end
end end end local kY,se=C.best(gQ[2],eu,sa,kW)local sf=C.score(gQ[2],ew)local sh=#kY==#ew for Hp,AT in ipairs(kY)do if not kW[AT]then sh=false end end
if not sh and(sc or#ew<math.min(sa,#eu)or se>sf+1e-4)then kV[#kV+1]={team=ev,role=gQ[2],ids=kY,gain=se-sf}end
end end return kV end function C.rebuild(AU)local sj=C.plan()if#sj==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gR=true local AY,AZ=pcall(function()for Hq,ex in ipairs(sj)do local AV,AW=C.saveTeam(ex.team,ex.ids)local sk=q.data()
local kZ={}for Hr,AX in ipairs(ex.ids)do for Hs,k0 in ipairs(sk and sk.pets or{})do if tostring(k0 .id)==AX then kZ[#kZ+1]=q.nice(k0 .name,k0 .variant)end
end end if AV then A(("TEAM %s rebuilt (%s): %s"):format(ex.team,AU or"pets changed",table.concat(kZ,", ")))else gR=false A(("TEAM %s: %s"):format(ex.team,tostring(AW)))end
end end)z.editing,z.nextTry=false,0 if not AY then gR=false A("TEAM BUILD ERR "..tostring(AZ))end C.builds=C.builds+1
C.buildMsg=gR and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gR end
function C.fuseTick()if not e.AutoFuse or z.editing then return end local gS=q.data()if not gS then return end
local k1=C.need()local k2,gT={},{}for Ht,A0 in ipairs(gS.teams or{})do for Hu,A1 in ipairs(A0 .pets or{})do k2[tostring(A1)]=true end end
for Hv,A2 in ipairs(gS.equipped or{})do gT[tostring(A2)]=true end C.failUntil=C.failUntil or{}for cp,A3 in pairs(e.Pets)do
local sl=tonumber(A3 .f)or 0 local k3,A4=C.count(cp,gS,true)if sl>0 and A4<sl and#k3>=k1 and y()>=(C.failUntil[cp]or 0)then
table.sort(k3,function(gU,gV)local sm=(gT[tostring(gU.id)]and 4 or 0)+(k2[tostring(gU.id)]and 2 or 0)+(gU.named and 1 or 0)
local sn=(gT[tostring(gV.id)]and 4 or 0)+(k2[tostring(gV.id)]and 2 or 0)+(gV.named and 1 or 0)if sm~=sn then return sm<sn end
return tostring(gU.id)<tostring(gV.id)end)local gW,k4={},{}for gX=1,k1 do gW[gX]=tostring(k3[gX].id)if gT[gW[gX]]then k4[#k4+1]=gW[gX]end
end z.editing,z.editingSince=true,y()for Hw,A5 in ipairs(k4)do q.call("unequip",A5)task.wait(0.3)end local gY=q.call("fuse",{ids=gW})
z.editing,z.nextTry=false,0 if type(gY)=="table"and gY.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(k1,q.nice(cp),q.nice(cp)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(cp),os.date("%H:%M"))else C.failUntil[cp]=y()+120 A(("fuse %s failed: %s"):format(q.nice(cp),type(gY)=="table"and tostring(gY.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not e.AutoBuild or not e.Teams then return end local so=q.data()
if not so then return end local cq={}for Hx,A6 in ipairs(so.pets or{})do cq[#cq+1]=tostring(A6 .id)end table.sort(cq)
cq=table.concat(cq,",")if cq~=C.sig then C.sig,C.dirtyAt=cq,y()end local A7=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if A7 and not z.editing then local A8=C.rebuild(C.dirtyAt and"pets changed"or"check")if A8 then C.dirtyAt,C.lastBuild=nil,y()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cr)return cr:IsA("ParticleEmitter")or cr:IsA("Trail")or cr:IsA("Beam")or cr:IsA("Fire")or cr:IsA("Smoke")
or cr:IsA("Sparkles")or cr:IsA("Light")end function d.muteOne(bl)if not e.Lite or not bl.Parent then return end
local gZ=(bl:IsA("BillboardGui")and d.bb)or(d.isFx(bl)and d.fx)or nil if not gZ or gZ[bl]~=nil then return end
if gZ==d.fx and d.gameLow and not bl:IsA("Beam")then return end gZ[bl]=bl.Enabled if bl.Enabled then bl.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local k5={}for Hy,A9 in ipairs({d.bb,d.fx})do for A_ in pairs(A9)do k5[#k5+1]=A_ end end local sp=os.clock()for Ba,ey in ipairs(k5)do
if e.Lite and ey.Parent and ey.Enabled then local Bb=d.bb[ey]~=nil and d.bb or d.fx Bb[ey]=true ey.Enabled=false
end if Ba%200==0 and os.clock()-sp>0.002 then task.wait()sp=os.clock()end end end function d.lite(sq)e.Lite=sq
if sq then task.spawn(function()for Bc,Bd in ipairs(am:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Bd)
if Bc%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=T(am.DescendantAdded:Connect(function(k6)
if e.Lite and(k6:IsA("BillboardGui")or d.isFx(k6))then d.queue[#d.queue+1]=k6 end end))end local k7=game:GetService("Lighting")
for Hz,ez in ipairs(k7:GetChildren())do if ez:IsA("PostEffect")and ez.Enabled and d.post[ez]==nil then d.post[ez]=true ez.Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and k7 .GlobalShadows or d.oldShadows k7 .GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and am.Terrain.Decoration or d.oldDeco am.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for HA,Be in pairs(d.watch)do pcall(function()Be:Disconnect()end)end
for sr,Bf in pairs(d.bb)do pcall(function()if sr.Parent then sr.Enabled=Bf end end)end for ss,Bg in pairs(d.fx)do pcall(function()if ss.Parent then ss.Enabled=Bg end end)end
for su in pairs(d.post)do pcall(function()if su.Parent then su.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local Bh=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()Bh.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()am.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(sv)
local Bi,k8=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not Bi or type(k8)~="table"then return end if sv and not d.ceOld then d.ceOld={}for HB,sx in ipairs({"Fireworks","Confetti"})do
local g0=k8[sx]if type(g0)=="table"and type(g0 .Play)=="function"then d.ceOld[sx]=g0 .Play pcall(function()g0 .Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not sv and d.ceOld then for Bj,Bk in pairs(d.ceOld)do pcall(function()k8[Bj].Play=Bk end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local k9,g1 for HC,eA in ipairs(getgc(false))do if type(eA)=="function"and(type(islclosure)~="function"or islclosure(eA))then
local Bl,sy,sz=pcall(debug.info,eA,"sn")if Bl and type(sy)=="string"and sy:find("ToppingCullHandler",1,true)then
if sz=="poll"then k9=eA elseif sz=="retarget"then g1=eA end end end end if not(k9 and g1)then return nil end local Bm,g2=pcall(debug.getupvalues,g1)
local sA=Bm and type(g2)=="table"and g2[3]if type(sA)~="function"or debug.info(sA,"n")~="targetFor"or(g2[1]~=nil and type(g2[1])~="number")then return nil end
d.tc={poll=k9,re=g1}return d.tc end function d.tops(sB)local aM=d.topsFind()if not aM then return false end if sB and not aM.old then
local Bn,Bo=pcall(hookfunction,aM.poll,function()end)if not Bn then return false end aM.old=Bo pcall(debug.setupvalue,aM.re,1,-1000)
pcall(aM.re)elseif not sB and aM.old then local Bp=type(restorefunction)=="function"and pcall(restorefunction,aM.poll)
if not Bp then pcall(hookfunction,aM.poll,aM.old)end aM.old=nil pcall(aM.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(Bq)local sC=am:FindFirstChild("Plots")local sD=os.clock()if Bq then for HD,Br in ipairs(sC and sC:GetChildren()or{})do
local sE=Br:FindFirstChild("SkinProps")local sF=sE and sE:FindFirstChild("FairyLights")for HE,sG in ipairs(sF and sF:GetChildren()or{})do
for HF,eB in ipairs(sG:GetChildren())do if eB:IsA("BasePart")and(eB.Name=="Bulb"or eB.Name=="Wire")then d.lit[eB]=sG eB.Parent=nil end
end if os.clock()-sD>0.002 then task.wait()sD=os.clock()end end end for HG,Bs in ipairs({"Leaderboards","ClanBoard"})do
local k_=am:FindFirstChild(Bs)if k_ then d.boardsOff[k_]=true k_.Parent=nil end end else for Bt,sH in pairs(d.lit)do pcall(function()if sH.Parent then Bt.Parent=sH end end)end
for sI in pairs(d.boardsOff)do pcall(function()if not sI.Parent then sI.Parent=am end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(Bu)if Bu then local sJ=af:FindFirstChild("Remotes")local sK=sJ and sJ:FindFirstChild("SquishyRollAnimation")
if not sK or type(getconnections)~="function"then return end local Bv,Bw=pcall(getconnections,sK.OnClientEvent)
for HH,g3 in ipairs(Bv and Bw or{})do local la=""pcall(function()la=debug.info(g3 .Function,"s")end)if type(la)=="string"and la:find("SquishyHandler",1,true)and not d.reel[g3]then
if pcall(function()g3:Disable()end)then d.reel[g3]=true end end end else for Bx in pairs(d.reel)do pcall(function()Bx:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(By)if not By then for HI,Bz in pairs(d.quiet)do pcall(function()Bz:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function lb(BA,BB)local BC,BD=pcall(getconnections,BA)
for HJ,g4 in ipairs(BC and BD or{})do local lc=""pcall(function()lc=debug.info(g4 .Function,"s")end)local ld=g4 .Function
if ld and type(lc)=="string"and lc:find(BB,1,true)and not d.quiet[ld]then if pcall(function()g4:Disable()end)then d.quiet[ld]=g4 end
end end end local sL=am:FindFirstChild("Plots")for HK,g5 in ipairs(sL and sL:GetChildren()or{})do if g5~=c.plot then
lb(g5:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local sM,sN=g5:FindFirstChild("WaxStations"),g5:FindFirstChild("SquishyStack")
if sM then lb(sM.DescendantAdded,"LocalToppingsHandler")end if sN then lb(sN.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for sO,BE in pairs(d.lit)do if not BE:IsDescendantOf(game)then d.lit[sO]=nil pcall(function()sO:Destroy()end)end
end end function d.extras(g6)pcall(d.quietPlots,g6 and c.plot~=nil)pcall(d.fxPatch,g6)pcall(d.tops,g6)pcall(d.lights,g6)
end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(sP)e.HideHud=sP local le=J:FindFirstChildOfClass("PlayerGui")
if not le then return end if sP then for HL,eC in ipairs(le:GetChildren())do if eC:IsA("ScreenGui")and not d.MINE[eC.Name]and eC.Enabled then d.hud[eC]=true eC.Enabled=false end
end if not d.hudConn then d.hudConn=T(le.ChildAdded:Connect(function(eD)if e.HideHud and eD:IsA("ScreenGui")and not d.MINE[eD.Name]then
task.defer(function()if e.HideHud and eD.Enabled then d.hud[eD]=true eD.Enabled=false end end)end end))end else
for sQ in pairs(d.hud)do pcall(function()if sQ.Parent then sQ.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(lf)e.FpsCap=lf local sR=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not sR then return false end return pcall(sR,lf==0 and 60 or lf)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ao)if ao:IsA("BasePart")or ao:IsA("Decal")or ao:IsA("Texture")then if ao.Transparency<1 then d.unseen[ao]=ao.Transparency ao.Transparency=1 end
elseif ao:IsA("BillboardGui")or ao:IsA("SurfaceGui")or ao:IsA("ParticleEmitter")or ao:IsA("Beam")or ao:IsA("Trail")or ao:IsA("Light")or ao:IsA("Fire")or ao:IsA("Smoke")or ao:IsA("Sparkles")then
if ao.Enabled then d.unseen[ao]=true ao.Enabled=false end end end function d.notMine(BF)return e.HideMine or(c.plot and not BF:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(g7)
local lg=g7 .Parent local lh=lg and lg.Name=="SquishyStack"and lg.Parent if lh and lh~=c.plot and c.plot and lh.Parent==c.plot.Parent and not d.dropSeen[g7]then
d.dropSeen[g7]=true d.dropQ[#d.dropQ+1]={g7,y()+3}end end function d.dropScan()local sS=c.plot and c.plot.Parent
if not(e.HideBases and sS)then return end for HM,sT in ipairs(sS:GetChildren())do local sU=sT~=c.plot and sT:FindFirstChild("SquishyStack")
for HN,BG in ipairs(sU and sU:GetChildren()or{})do d.dropIt(BG)end end end function d.dropStep(BH)local li=d.dropQ
while d.dropI<=#li and os.clock()-BH<0.003 do local lj=li[d.dropI]if lj[2]>y()then break end d.dropI=d.dropI+1
if e.HideBases and lj[1].Parent then pcall(function()lj[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#li then d.dropQ,d.dropI={},1 end
end function d.hideStep()local lk=os.clock()local eE=d.queue if e.Lite and eE and#eE>0 then d.muteI=d.muteI or 1
while d.muteI<=#eE and os.clock()-lk<0.0015 do pcall(d.muteOne,eE[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#eE then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,lk)end local g8=d.hideQ if d.hideI>#g8 then return end while d.hideI<=#g8 and os.clock()-lk<0.004 do
local ll=g8[d.hideI]d.hideI=d.hideI+1 if e.HideBases and ll.Parent and d.notMine(ll)then pcall(d.hideOne,ll)end
end if d.hideI>#g8 then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(sV)if e.HideBases then d.bases(false)end
e.HideMine=sV==2 if sV>0 then d.bases(true)end end function d.bases(sW)e.HideBases=sW local lm=am:FindFirstChild("Plots")
if not lm then return end if sW then task.spawn(function()local ln=0 for HO,g9 in ipairs(lm:GetChildren())do local sX=g9~=c.plot and c.plot and g9:FindFirstChild("SquishyStack")
for HP,BI in ipairs(sX and sX:GetChildren()or{})do d.dropIt(BI)end if g9~=c.plot or e.HideMine then for HQ,BJ in ipairs(g9:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,BJ)ln=ln+1 if ln%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=T(lm.DescendantAdded:Connect(function(c4)if e.HideBases and d.notMine(c4)then
pcall(d.hideOne,c4)d.hideQ[#d.hideQ+1]=c4 if c4 .Parent and c4 .Parent.Name=="SquishyStack"then d.dropIt(c4)end
end end))end else for lo,sY in pairs(d.unseen)do pcall(function()if not lo.Parent then return end if type(sY)=="number"then lo.Transparency=sY else lo.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(sZ)e.NoRender=sZ pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not sZ)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local BK=game:GetService("RunService")local lp=0 for HR,BL in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local BM,s0=pcall(function()return BK[BL]end)local s1,lq=false,nil if BM and s0 then s1,lq=pcall(getconnections,s0)end
if s1 and type(lq)=="table"then for HT,g_ in ipairs(lq)do local lr=""pcall(function()local s2=getfenv(g_.Function).script lr=s2 and s2:GetFullName()or""end)
if lr~=""then for HU,BN in ipairs(d.CALM)do if lr:find(BN,1,true)then local ls=g_.Function if ls and not d.calmedF[ls]and pcall(function()g_:Disable()end)then
d.calmedF[ls]=true d.calmed[#d.calmed+1]=g_ lp=lp+1 end break end end end end end end if#d.calmed>200 then local lt={}for BO=#d.calmed-49,#d.calmed do lt[#lt+1]=d.calmed[BO]end d.calmed=lt
end return lp end function d.calm(s3)e.Calm=s3 if s3 then local BP=d.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(BP))
else for HV,BQ in ipairs(d.calmed)do pcall(function()BQ:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(s4)if c.rejoining then return end A("REJOIN this server ("..s4 ..")")
pcall(fA)if c.autoload then pcall(f0,c.autoload)end oV()local BR=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then dN(s4 ..", same server failed")end end)return BR end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and y()-(d.dropAt or 0)>5 then d.dropAt=y()pcall(d.dropScan)end
if e.Lite and y()-(d.extraAt or 0)>5 then d.extraAt=y()d.gameLow=J:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and y()-(d.topsTry or-100)>60 then d.topsTry=y()pcall(d.tops,true)end end local s5=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if s5 then for HW,BS in ipairs(s5:GetChildren())do local s6=BS:FindFirstChild("SquishyPlaceHolder")local cs=s6 and s6:FindFirstChild("TimerGui")
if cs and cs:IsA("BillboardGui")then if d.bb[cs]==nil then pcall(d.muteOne,cs)elseif cs.Enabled then d.bb[cs]=true cs.Enabled=false end
end end end local BT,c5=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if BT and type(c5)=="number"then
d.mem=c5 d.memPeak=math.max(d.memPeak,c5)if(e.MemLimit or 0)>0 and c5>e.MemLimit then d.over=(d.over or 0)+((c5>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(c5,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if y()-(d.noteAt or 0)>1800 then d.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function lu(ha)if type(ha)~="string"then return false end
ha=ha:lower()for HY,BU in ipairs(c.sellWords)do if ha:find(BU,1,true)then return true end end return false end
local function BV()local s7=af:FindFirstChild("Remotes")local lv=s7 and s7:FindFirstChild("SellSquishy")if not(lv and lv:IsA("RemoteEvent"))then return false end
if not pcall(function()lv:FireServer()end)then return false end return aq(function()return ac()==nil end,1.5)
end local function BW()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local s8=ap()local s9=s8 and s8 .HumanoidRootPart.Position local eF,s_ for HZ,c6 in ipairs((c.plot or am):GetDescendants())do
if c6:IsA("ProximityPrompt")and(lu(c6 .ActionText)or lu(c6 .ObjectText)or lu(c6 .Name))then local ta=nP(c6)local lw=(ta and s9)and(ta-s9).Magnitude or 1e9
if lw<=400 and(not eF or lw<s_)then eF,s_=c6,lw end end end c.sellSpot=eF c.noSellSpot=(eF==nil)return eF end
local function tb()local lx=ac()if not lx then c.holding=false return false end if aJ(lx)then return false end
local ly=ak(W(lx))if BV()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..ly)return true end local c7=BW()if c7 then local td=dA(c7)if td then b8(td,c7)local te=ac()if te and not aJ(te)then
local BX,BY=dT(c7,function()return ac()==nil end,function()return c7 .Enabled end)if BX then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(ly,fu(c7),BY))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..ly.." ("..c.sellFails..")")
return false end local BZ={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function B0(c8)local hb=fu(c8):lower()for H0,B1 in ipairs(BZ)do if hb:find(B1,1,true)then return 0 end end
local a6,ar=c8 .Name:lower(),0 local function aU(B2,B3)return B2:find(B3,1,true)~=nil end if aU(a6,"collect")then ar=ar+60 end
if aU(a6,"cash")or aU(a6,"money")then ar=ar+45 end if aU(a6,"income")or aU(a6,"claim")then ar=ar+35 end if aU(a6,"coin")or aU(a6,"earn")or aU(a6,"green")then ar=ar+20 end
if a6=="pad"or a6=="touch"then ar=ar+25 end if ar==0 and(aU(hb,"collect")or aU(hb,"cash")or aU(hb,"money"))then ar=25 end
if ar==0 then return 0 end local eG=c8 .Color if eG.G>0.5 and eG.G>eG.R*1.4 and eG.G>eG.B*1.4 then ar=ar+15 end
if math.min(c8 .Size.X,c8 .Size.Y,c8 .Size.Z)<2 then ar=ar+5 end return ar end local function B4()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local hc,eH,lz={},nil,29 for H1,hd in ipairs(c.plot:GetDescendants())do
if hd:IsA("BasePart")then local he=B0(hd)if he>0 then hc[#hc+1]={s=he,p=hd}if he>lz then eH,lz=hd,he end end end
end table.sort(hc,function(B5,B6)return B5 .s>B6 .s end)c.padCands,c.padPart=hc,eH if eH then A("collect pad: "..fu(eH).." (score "..lz..")")end
return eH end local lA="SAB_pad_v1.txt"local function B7(B8)if type(writefile)=="function"then pcall(writefile,lA,table.concat({B8:GetComponents()},","))end
end local function B9()if type(isfile)~="function"or type(readfile)~="function"then return nil end local B_,tf=pcall(function()if isfile(lA)then return readfile(lA)end end)
if not B_ or type(tf)~="string"then return nil end local hf={}for Ca in tf:gmatch("[^,]+")do hf[#hf+1]=tonumber(Ca)end
if#hf==12 then return CFrame.new(unpack(hf))end end local function Cb(lB,hg,Cc)local Cd=cN(lB)local lC=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aV=(lC and lC:IsA("BasePart"))and(lC.Position-hg)or Vector3 .new(1,0,0)aV=Vector3 .new(aV.X,0,aV.Z)if aV.Magnitude<0.05 then aV=Vector3 .new(1,0,0)end
aV=aV.Unit for Ce=0,7 do local hh=Ce*math.pi/4 local Cf=Vector3 .new(aV.X*math.cos(hh)-aV.Z*math.sin(hh),0,aV.X*math.sin(hh)+aV.Z*math.cos(hh))
local hi=hg+Cf*(Cc+5)local lD=f8(hi.X,hg.Y,hi.Z)if lD and math.abs(lD.Y-hg.Y)<8 then aD(lB,Vector3 .new(hi.X,lD.Y+Cd,hi.Z))
if jq(lB,0.7)then return true end end end return false end local function Cg()c.lastCollect=y()local eI=ap()if not eI then return end
local th,Ch=eI.HumanoidRootPart,cN(eI)local eJ,ti,eK,lE=nil,4,nil,"?"local lF=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and lF and lF:IsA("BasePart")then eJ,lE=(lF.CFrame*c.manualPad).Position,"manual pad"else local bm=B4()
if bm then eJ=Vector3 .new(bm.Position.X,bm.Position.Y+bm.Size.Y/2+Ch,bm.Position.Z)ti,eK,lE=math.max(bm.Size.X,bm.Size.Z)/2,bm,bm.Name
end end if not eJ then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local lG=a_()aD(eI,eJ)
if eK and type(firetouchinterest)=="function"then pcall(firetouchinterest,th,eK,0)end ag(e.PadDwell)if eK and type(firetouchinterest)=="function"then pcall(firetouchinterest,th,eK,1)end
ag(0.5)c.collected=c.collected+1 local lH=a_()A(("COLLECTED (%s) %s"):format(lE,(lG and lH and lH>lG)and("+$"..aK(lH-lG))or"no cash change seen"))
Cb(eI,eJ,ti)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local tj=af:FindFirstChild("Modules")if not tj then return false end local function lI(Ci)local tk=tj:FindFirstChild(Ci)
if not tk then return nil end local Cj,tl=pcall(require,tk)return(Cj and type(tl)=="table")and tl or nil end o.si,o.arm,o.ci=lI("SquishyInfo"),lI("AutoRollRules"),lI("CrateInfo")
o.modAt=y()if not o.si then return false end local lJ={}if o.arm and type(o.arm.tierOf)=="table"then for lK in pairs(o.arm.tierOf)do
local hj=o.si[lK]if type(hj)=="table"and hj.rarity~="Limited"and not hj.incomeType and not hj.hiddenAfter then lJ[W(lK)]=lK end
end end o.roll=lJ local hk={}for Ck,Cl in pairs(lJ)do local eL=o.si[Cl]if type(eL)=="table"and type(eL.income)=="number"and not eL.incomeType then
hk[#hk+1]={k=Ck,inc=eL.income,pr=tonumber(eL.price)or 0}end end table.sort(hk,function(lL,lM)if lL.inc~=lM.inc then return lL.inc>lM.inc end return lL.pr>lM.pr end)
o.order=hk local hl,lN,lO local Cm=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for Cn,lP in pairs(Cm)do
local lQ=type(lP)=="table"and tonumber(lP.price)if lQ and(not lN or lQ>lN)then hl,lN,lO=Cn,lQ,lP.title end end
o.bestCrate,o.bestCrateName=hl and L.key(hl),hl o.bestCrateTitle=lO and L.key(lO)or nil return true end function o.rank(Co)
local Cp,Cq=pcall(function()return o.arm.rankOf(Co)end)return(Cp and tonumber(Cq))or 0 end function o.loadDisc(tm)
if type(tm)~="table"then return end local tn={}for Cr,Cs in pairs(tm)do if Cs then tn[W(tostring(Cr))]=true end end
o.disc,o.discAt=tn,y()end function o.fetch()o.discAt=y()local to=af:FindFirstChild("Remotes")local tp=to and to:FindFirstChild("GetSquishiesDiscovered")
if not tp then return end local Ct,Cu=pcall(function()return tp:InvokeServer()end)if Ct then o.loadDisc(Cu)end
end function o.scanWax()local lR={}local tq=c.plot and c.plot:FindFirstChild("WaxStations")if tq then for H2,tr in ipairs(tq:GetChildren())do
local ts=tr:FindFirstChild("SquishyPlaceHolder")if ts and tr:GetAttribute("HasSquishy")then for H3,tt in ipairs(ts:GetChildren())do if tt:IsA("Model")then lR[W(tt.Name)]=true end end
end end end for tu,Cv in pairs(o.placedAt)do if y()-Cv<20 then lR[tu]=true else o.placedAt[tu]=nil end end o.waxing=lR
end function o.compute()local tv,lS,lT={},0,0 if o.disc then for lU in pairs(o.roll or{})do if not o.disc[lU]then
if o.waxing[lU]then lT=lT+1 else tv[lU],lS=true,lS+1 end end end end o.need,o.nNeed,o.nWax=tv,lS,lT local tw,lV={},e.Best or 0
local lW=(lV==4)and o.stackMin or nil for Cw,tx in ipairs(o.order)do if(lW and tx.inc>lW)or(not lW and Cw<=(lV==4 and 1 or lV))then tw[tx.k]=true end
end o.best=tw end function o.readStack()o.stackAt=y()local ty=af:FindFirstChild("Remotes")local tz=ty and ty:FindFirstChild("EditStack")
if not tz then return end local Cx,c9=pcall(function()return tz:InvokeServer("State",nil)end)if not(Cx and type(c9)=="table"and type(c9 .state)=="table"and type(c9 .state.entries)=="table")then return end
local hm for H4,tA in ipairs(c9 .state.entries)do local eM=type(tA)=="table"and o.si and o.si[tostring(tA.name)]
if type(eM)=="table"and type(eM.income)=="number"and not eM.incomeType and(not hm or eM.income<hm)then hm=eM.income end
end o.stackMin=hm o.stackFull=#c9 .state.entries>=(tonumber(c9 .state.capacity)or 100)end function o.want(lX)
if(e.Best or 0)>0 and(next(o.best)or(e.Best==4 and o.stackMin))then if o.best[lX]then return true end elseif e.Targets[lX]then
return true end return e.AutoIndex==true and o.need[lX]==true end function o.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(o.best)~=nil)or(e.AutoIndex and next(o.need)~=nil)
or e.Best==4 end function o.placed(Cy)local eN=W(Cy)o.placedAt[eN],o.waxing[eN]=y(),true if o.need[eN]then o.need[eN],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eN)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eO,eP={},{}for Cz,CA in pairs(o.roll or{})do if o.want(Cz)then eO[CA]=true end end
for tB,lY in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(tB)or(type(lY)=="table"and type(lY.title)=="string"and L.wanted(lY.title))then eP[tB]=true end
end if not next(eO)and not next(eP)then return nil end if o.arm and type(o.arm.encode)=="function"then local CB,tC=pcall(o.arm.encode,{rarities={},butters=eO,crates=eP,index=false})
if CB and type(tC)=="string"then return tC end end local function tD(CC)local hn={}for CD in pairs(CC)do hn[#hn+1]=CD end table.sort(hn)return table.concat(hn,",")end
local eQ="adv:"if next(eO)then eQ=eQ..";butters:"..tD(eO)end if next(eP)then eQ=eQ..";crates:"..tD(eP)end return eQ
end function o.canon(CE)local ho={}for tE in tostring(CE or""):gmatch("[^;]+")do local lZ,tF=tE:match("^(%a+):(.*)$")
if not lZ then lZ,tF="r",tE:gsub("^adv:","")end for CG in tF:gmatch("[^,]+")do ho[#ho+1]=lZ.."="..CG end end table.sort(ho)
return table.concat(ho,"|")end function o.sync(CH)if J:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local ct=o.rulesNow()if not ct or#ct>1900 then return end if o.canon(J:GetAttribute("AutoRollRules"))==o.canon(ct)then o.fails=0 return end
if not CH and y()-o.sentAt<4 then return end local tG=af:FindFirstChild("Remotes")local tH=tG and tG:FindFirstChild("AutoRollAction")
if not tH then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()tH:FireServer("Rules",ct)end)D.replaying=false e.ARrules=ct
local hp,hq=0,0 for H5 in(ct:match("butters:([^;]*)")or""):gmatch("[^,]+")do hp=hp+1 end for H6 in(ct:match("crates:([^;]*)")or""):gmatch("[^,]+")do hq=hq+1 end
local tI=hp.."/"..hq if o.told~=tI then o.told=tI A(("auto roll now stops on %d butters and %d crates"):format(hp,hq))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if e.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aN={}if e.AutoIndex then aN[#aN+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if e.Best==4 then local eR=0 for H7 in pairs(o.best)do eR=eR+1 end
aN[#aN+1]=eR==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eR,eR==1 and""or"s")
elseif(e.Best or 0)>0 and o.order[1]then aN[#aN+1]="best: "..ak(o.order[1].k)end if e.BestCrate and o.bestCrateName then aN[#aN+1]="crate: "..o.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aN[#aN+1]="shower: "..O.got end o.msg=#aN>0 and table.concat(aN," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(CI)o.feed[#o.feed+1]=os.date("%H:%M ")..CI if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(tJ,av,hr)if tJ~="Effect"then o.feedAdd(tostring(tJ)..(av~=nil and(": "..tostring(av):sub(1,80))or""))
return end if av~="ShowerTaken"and av~="GoalPoint"then o.feedAdd(tostring(av))end if av=="Shower"then O.add(hr)return end
if av=="ShowerTaken"then O.gone(hr)return end if av=="ShowerClear"then O.drops={}return end if av=="WaxGlow"then
local l0=type(hr)=="table"and tonumber(hr.SnapAt)if l0 then o.snapAt=l0 A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(l0-q.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end av=tostring(av)b4("Admin "..av)if av~="GoalPoint"and y()-(o.heard[av]or-100)>30 then o.heard[av]=y()
A("ADMIN: "..av)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(l1)if type(l1)~="table"or type(l1 .Pieces)~="table"then return end
for H8,aW in pairs(l1 .Pieces)do if type(aW)=="table"and aW.Id~=nil and aW.Position~=nil then O.drops[aW.Id]={id=aW.Id,butter=tostring(aW.Butter or"?"),rar=tostring(aW.Rarity or"?"),star=aW.Star==true,
pos=aW.Position,opens=tonumber(aW.OpensAt)or 0,ends=tonumber(aW.ExpiresAt)or 0}end end end function O.gone(eS)
if type(eS)~="table"or eS.Id==nil then return end O.drops[eS.Id]=nil if tonumber(eS.UserId)==q.uid then O.mine=eS.Id end
end function O.pick()local l2=q.srv()local l3,tK for tL,cu in pairs(O.drops)do if l2>=cu.ends-0.3 then O.drops[tL]=nil
elseif l2>=cu.opens-0.2 and(O.tried[tL]or 0)<3 then local tM=(aJ(cu.butter)and 1e6 or 0)+(cu.star and 1e5 or 0)+o.rank(cu.rar)*100-(cu.ends-l2)
if not l3 or tM>tK then l3,tK=cu,tM end end end return l3 end function O.due()return e.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aO,l4=O.pick(),ap()if not(aO and l4)then return end O.tried[aO.id]=(O.tried[aO.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aD(l4,aO.pos+Vector3 .new(0,cN(l4)+0.5,0))aq(function()return O.mine==aO.id or ac()~=nil or not O.drops[aO.id]end,1.5)
if O.mine==aO.id or ac()then O.got,O.drops[aO.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aO.butter)),aO.rar,aO.star and" (star)"or""))
elseif not O.drops[aO.id]then O.miss=O.miss+1 end end local eT local function tN()if c.capHit then if e.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eT(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ap()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bw(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local l5,tO=fw()
local hs=ac()if hs then local c_=ak(W(hs))if not aJ(hs)then local l6=(V.gift and W(V.gift)==W(hs)and y()-V.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c_,l6),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c_,l6),"bad"end return"sell",("selling %s (%s)"):format(c_,l6),"warn"
end if l5<1 then return nil,("holding %s - 0 free stations"):format(c_),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c_),"wait"end
return"place",("waxing %s (%d free)"):format(c_,l5),"ok"end c.holding=false if e.Crates and not j.waiting and y()-(j.scanAt or 0)>1 and y()>(j.quietUntil or 0)then
j.scanAt=y()local l7=c.plot:FindFirstChild("CrateStand")if l7 then for H9,eU in ipairs(l7:GetDescendants())do
if eU:IsA("ProximityPrompt")and eU.Enabled and jH(eU)then local bn=eU.ObjectText if bn==""then bn=cG(l7,"TitleLabel")or""end
if bn~=""and L.wanted(bn)then local CJ=fs(bn):gsub("crate$","")local tP for tQ in pairs(ad.members)do if fs(tQ)==CJ then tP=tQ end end
j.waiting,j.at,j.title,j.prompt=true,y(),bn,eU j.data={name=(bn:gsub("%s","")),rarity=tP,title=bn}A(bn.." found waiting on your stand")
end break end end end end local tR=L.wanted(j.data and j.data.name)or L.wanted(j.title)if e.Crates and(j.on or j.waiting)and tR then
local aX=j.title if y()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aX),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aX.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aX),"bad"end if y()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aX),"bad"
end if j.byYou and y()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aX,math.ceil(60-(y()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aX),"ok"end if j.at and y()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aX,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if y()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aX,
math.ceil(45-(y()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil A("trying the "..aX.." again")
end if y()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aX),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aX,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not tR then local tS=j.title..tostring(j.rolledAt)if j.told~=tS then j.told=tS A(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and y()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if l5<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(tO,tO),"wait"
end local l8=n3()if not l8 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local da=b3()
if da and pu(da.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(da.name),"idle"end
if y()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(da.name),"bad"end if not pN()then return nil,("%s rolled - waiting for it to land on the stand"):format(da.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(da.name),"ok"end local bK=jo()if bK.state~="match"then
c.matchSince=nil if bK.state=="skip"and not l8 .Enabled then return nil,bK.text.." (sold out)","idle"end return nil,bK.text,bK.level
end if not l8 .Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eV=y()
if eV<c.noCashUntil then local tT,CK=dP()if tT then return nil,("cash short: have $%s, price ~$%s"):format(aK(tT),aK(CK)),"bad"end
return nil,(dP()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aK(a_()),math.ceil(c.noCashUntil-eV)),dP()and"bad"or"wait"end if eV-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eV local tU=eV-c.matchSince if tU<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bK.shown,tU),"ok"end
return"buy",("buying %s via %s"):format(bK.shown,bK.src),"ok"end d.DEPTH=11 function d.pinTick()local tV=d.hold
if not tV then return end local l9=J.Character local l_=l9 and l9:FindFirstChild("HumanoidRootPart")if not l_ then return end
l_.CFrame=tV l_.AssemblyLinearVelocity=Vector3 .new(0,0,0)for H_,ht in ipairs(l9:GetChildren())do if ht:IsA("BasePart")and ht.CanCollide then d.noclip[ht]=true ht.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(CL,tW)d.hold=CL if tW then d.surface=tW end end function d.unpin(CM)
if not d.hold then return end d.hold=nil for tX in pairs(d.noclip)do pcall(function()if tX.Parent then tX.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local tY=ap()if tY and d.surface and not CM then aD(tY,d.surface.Position,d.surface.Position+d.surface.LookVector)
ag(0.1)end end function d.home()local bo,tZ=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ap()
if not(bo and bo:IsA("BasePart")and tZ)then return nil end local t0=nS()or bo.Position local hu=Vector3 .new(t0 .X-bo.Position.X,0,t0 .Z-bo.Position.Z)
hu=hu.Magnitude>0.1 and hu.Unit or Vector3 .new(0,0,1)local hv=bo.Position+hu*6 local t1=f8(hv.X,bo.Position.Y,hv.Z,{bo})
return CFrame.new(hv.X,(t1 and t1 .Y or bo.Position.Y)+cN(tZ),hv.Z)end function d.ground(CN,t2,CO)local ma,mb={J.Character},nil
for Ia=1,12 do local mc=RaycastParams.new()mc.FilterType=Enum.RaycastFilterType.Exclude mc.FilterDescendantsInstances=ma
local hw=am:Raycast(Vector3 .new(CN,t2,CO),Vector3 .new(0,-2000,0),mc)if not hw then break end mb,t2=hw,hw.Position.Y-0.05
ma[#ma+1]=hw.Instance end return mb and mb.Position.Y end function d.parkHome()local md=d.home()if not md then return false end
local db=md.Position local CP=d.ground(db.X,db.Y+300,db.Z)or(db.Y-3)d.pin(CFrame.new(db.X,CP-8,db.Z),md)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(hx)e.Ghost,e.GhostHelps=hx==2,hx==1 if hx<2 then task.spawn(function()while c.busy do ag(0.1)end
if d.ghostMode()<2 and d.hold and not E.home then pcall(d.unpin)end end)end d.paintGhost()A("ghost: "..d.GHOST[hx][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local CQ=ap()if not CQ or K.seat()then return end d.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local t3=J.Character local t4=t3 and t3:FindFirstChildOfClass("Humanoid")local me=t4 and t4 .SeatPart
return(me and me.Name=="LogSeat")and me or nil end function K.due()if not(e.Campfire and c.running)or y()<K.nextAt then return false end
local CS=am:FindFirstChild("NightSeats")if not CS then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or y()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(K.msg)return false end end return true end function K.sit()local t5,hy=am:FindFirstChild("NightSeats"),ap()
if not t5 or not hy then return end local t6,dc=hy.HumanoidRootPart.Position,{}for Ib,hz in ipairs(t5:GetChildren())do
local t7=hz:IsA("Seat")and hz.Occupant==nil and hz:FindFirstChildOfClass("ProximityPrompt")if t7 then dc[#dc+1]={st=hz,p=t7}end
end if#dc==0 then K.nextAt,K.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(dc,function(CT,CU)return(CT.st.Position-t6).Magnitude<(CU.st.Position-t6).Magnitude end)
local CV,CW=dc[1].st,dc[1].p d.unpin(true)local dd=CV.CFrame aD(hy,dd.Position+dd.LookVector*2+Vector3 .new(0,2.5,0),dd.Position)
ag(0.25)local CX=dT(CW,function()return K.seat()~=nil end)if not CX then aD(hy,dd.Position+Vector3 .new(0,2,0),dd.Position+dd.LookVector)
aq(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=y()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then A(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local mf=af:FindFirstChild("Remotes")if not mf then return end local eW,mg,de=0,0,{}
local CY,t8=pcall(function()return mf.ClanRequest:InvokeServer("state")end)local t9=CY and type(t8)=="table"and t8 .tasks
for Ic,bL in ipairs(t9 and t9 .list or{})do if not bL.done and bL.kind=="pull"then eW=math.max(eW,(bL.goal or 0)-(bL.progress or 0))end
if not bL.done then de[#de+1]=("%s %d/%d"):format(tostring(bL.text),bL.progress or 0,bL.goal or 0)end end F.events={}
for Ie,df in ipairs(mf:GetChildren())do if df:IsA("RemoteFunction")and df.Name:match("^%u%a+Action$")and df.Name~="CrateAction"and df.Name~="AutoRollAction"then
local CZ,eX=pcall(function()return df:InvokeServer("state")end)if CZ and type(eX)=="table"and eX.live==true and type(eX.quests)=="table"then
F.events[#F.events+1]={r=df,st=eX}for If,aP in ipairs(eX.quests)do if not aP.done and aP.kind=="pull"then eW=math.max(eW,(aP.goal or 0)-(aP.progress or 0))end
if not aP.done and aP.kind=="collect"then mg=math.max(mg,(aP.goal or 0)-(aP.progress or 0))end if not aP.done then de[#de+1]=("%s %d/%d"):format(tostring(aP.text),aP.progress or 0,aP.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eW,mg F.msg=#de>0 and("open: "..table.concat(de,", "))or"all quests done for today"
end function F.claim()for Ig,eY in ipairs(F.events)do local t_=eY.r.Name:gsub("Action$","")for Ih,dg in ipairs(eY.st.quests)do
if dg.done and not dg.claimed then local C0,ua=pcall(function()return eY.r:InvokeServer("claimQuest",dg.id)end)
if C0 and not(type(ua)=="table"and ua.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(t_,tostring(dg.text),tostring(dg.points or dg.treats or"?")))
end ag(0.4)end end if eY.st.bonusReady==true then local C1=pcall(function()return eY.r:InvokeServer("claimBonus")end)
if C1 then A(("CLAIMED %s daily quest bonus"):format(t_))end ag(0.4)end end end function F.tick()if not(e.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return e.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local ub=c.plot and c.plot:FindFirstChild("Lever")
local mh=ub and ub:FindFirstChild("Wheel")return mh and mh:FindFirstChildWhichIsA("ProximityPrompt"),mh end function F.resume(C2)
F.arPaused=false if F.arWas then F.arWas=false e.AutoRoll=true task.spawn(D.apply,C2)end end function F.pull()
local hA,mi=F.lever()if not hA or not mi or not mi:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hA.Enabled then F.nextAt=y()+1 return end b8(mi,hA)F.asked=nil ph(hA)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
ag(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bM,C3)local mj=bM:GetAttribute("PourOwner")
if type(mj)~="number"or mj==q.uid or not bM:GetAttribute("HasSquishy")then return false end if bM:GetAttribute("PourLong")~=true or bM:GetAttribute("PourFull")==true then return false end
local mk=bM:GetAttribute("PourId")if mk==nil or E.skip[mk]then return false end local uc,ml,C4=bM:GetAttribute("Helpers"),0,tostring(q.uid)
if type(uc)=="string"then for C5 in uc:gmatch("[^,%s]+")do ml=ml+1 if C5==C4 then return false end end end if ml>=6 then return false end
local hB=z.left(bM)if not hB then local ud=tonumber(bM:GetAttribute("PourEnd"))hB=ud and(ud-C3)end if not hB or hB<=75 then return false end
local mm=game:GetService("Players"):GetPlayerByUserId(mj)if not mm or mm:GetAttribute("WaxHelpOff")==true then return false end
return true,mm,mk end function E.list()local mn,C6={},q.srv()local ue=am:FindFirstChild("Plots")for Ii,uf in ipairs(ue and ue:GetChildren()or{})do
local ug=uf~=c.plot and uf:FindFirstChild("WaxStations")for Ij,mo in ipairs(ug and ug:GetChildren()or{})do local C7,C8,C9=E.can(mo,C6)
local mp=C7 and mo:FindFirstChild("SquishyPlaceHolder")if mp and mp:IsA("BasePart")then mn[#mn+1]={st=mo,p=C8,id=C9,part=mp}end
end end return mn end function E.due()if e.Help and c.running and y()>=E.nextAt and(d.mem or 0)>900 then E.nextAt,E.msg=y()+30,("paused - phone memory %d MB (helps load other bases)"):format(d.mem)
return false end return e.Help and c.running and y()>=E.nextAt end function E.skipIt(uh,ui)E.skip[uh],E.skipN=ui,E.skipN+1
if E.skipN>600 then E.skip,E.skipN,E.tries={[uh]=ui},1,{}end end function E.goHome()local hC,bN=ap(),E.home E.home=nil
if not(hC and bN)then return end if e.Ghost and not K.seat()then d.unpin(true)if not d.parkHome()then pcall(aD,hC,bN.Position,bN.Position+bN.LookVector)end
elseif d.hold or(hC.HumanoidRootPart.Position-bN.Position).Magnitude>20 then d.unpin(true)pcall(aD,hC,bN.Position,bN.Position+bN.LookVector)
end end function E.step()local mq,eZ=E.list(),ap()if#mq==0 or not eZ then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local uj=eZ.HumanoidRootPart local uk=uj.Position table.sort(mq,function(C_,Da)return(C_.part.Position-uk).Magnitude<(Da.part.Position-uk).Magnitude end)
local aY=mq[1]E.home=E.home or(d.hold and d.surface)or uj.CFrame local bO=aY.part local e0=(bO.Position+aY.st:GetPivot().Position)/2
local hD=E.tries[aY.id]or 0 if(e.Ghost or e.GhostHelps)and hD==0 and not K.seat()then d.pin(bO.CFrame,E.home)
else d.unpin(true)local mr=hD==0 and f8(e0 .X,bO.Position.Y,e0 .Z,{bO})if mr and math.abs(mr.Y-bO.Position.Y)<8 then
aD(eZ,Vector3 .new(e0 .X,mr.Y+cN(eZ),e0 .Z),bO.Position)else aD(eZ,bO.Position+Vector3 .new(0,bO.Size.Y/2+3,0),e0)
end end ag(0.3)local e1=af:FindFirstChild("Remotes")e1=e1 and e1:FindFirstChild("ClanRequest")if not e1 then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hE,bp=pcall(function()return e1:InvokeServer("help",aY.st:GetAttribute("PourOwner"),tonumber(aY.st.Name))end)
if hE and type(bp)=="table"and bp.ok then E.n,E.fails=E.n+1,0 E.skipIt(aY.id,"helped")A(("HELPED %s's wax (station %s)"):format(aY.p.DisplayName,aY.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hE and type(bp)=="table"and tostring(bp.reason or""):lower():find("walk up",1,true)and hD<2 then
E.tries[aY.id]=hD+1 E.nextAt=y()+0.3 elseif hE and type(bp)=="table"and tostring(bp.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local ul=(hE and type(bp)=="table"and tostring(bp.reason or"refused"))or("error: "..tostring(bp))
E.skipIt(aY.id,ul)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aY.p.DisplayName,ul))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bq)if not e.HelpGuild or type(bq)~="table"or bq.p~="help"or bq.mine or bq.u==q.uid or not bq.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local e2=af:FindFirstChild("Remotes")
e2=e2 and e2:FindFirstChild("ClanRequest")if not e2 then return end local um,e3=pcall(function()return e2:InvokeServer("callHelp",bq.u)end)
local uo=tostring(bq.n or bq.un or bq.u)if um and type(e3)=="table"and e3 .ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(uo))
else A(("guild call from %s: %s"):format(uo,(um and type(e3)=="table"and tostring(e3 .reason or"refused"))or tostring(e3)))
end end)end local function as(Db,up,...)if c.busy then return end c.busy,c.busyText=true,Db if d.hold and up~=E.step then pcall(d.unpin)end
local Dc,uq=pcall(up,...)c.busy,c.busyText=false,""if not Dc and uq~=iB then A("ERR "..tostring(uq))end end local function Dd()
local aQ,De,Df=tN()c.reason,c.level=De,Df if aQ=="place"then as("waxing...",z.place)elseif aQ=="crate"then as("opening crate...",d4,true)
elseif aQ=="cratesmart"then as("opening crate...",j.smart)elseif aQ=="cratewin"then as("opening the crate window...",jJ)
elseif aQ=="nocrate"then as("discarding crate...",d4,false)elseif aQ=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aQ=="sell"then as("selling...",tb)elseif aQ=="buy"then as("buying...",pl,false)elseif not aQ and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aQ and not c.matchSince and K.due()then as("sitting at the campfire...",K.sit)
elseif not aQ and not c.matchSince and F.pullDue()and not ac()and not(b3()and aJ(b3().name))then as("pulling the lever for a quest...",F.pull)
elseif e.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
as("collecting money...",Cg)elseif not aQ and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not e.Help then
as("coming back...",E.goHome)elseif not c.busy then d.parkTick()end end function eT(hF,Dg)if hF==c.running then return end
c.running=hF if not Dg then e.AutoStart=hF end if hF then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bw()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bP=fU(an.auto)if type(bP)=="string"then bP=bP:gsub("%s+$","")
if bP~=""then c.autoload=bP local Dh=oR(bP)A(Dh and("loaded config "..bP)or("config "..bP.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local Di={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local ms={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local ur,us,ut,uu=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if ur and us and ut and uu then ae.x,ae.b,ae.m,ae.r=ur,us,ut,uu end end)pcall(function()local uv=Enum.Font.RobotoMono if uv then ae.mono=uv end end)
local function H(Dj,Dk,Dl)local Dm,mt=pcall(Instance.new,Dj)if not Dm then c.uiErrs=c.uiErrs+1 return nil end
for Dn,Do in pairs(Dk)do if not pcall(function()mt[Dn]=Do end)then c.uiErrs=c.uiErrs+1 end end mt.Parent=Dl return mt
end local function ab(Dp,Dq)H("UICorner",{CornerRadius=UDim.new(0,Dq or 8)},Dp)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hG,mu)if hG and a.shown[hG]~=mu then a.shown[hG]=mu hG.Text=mu end
end function a.stroke(Dr,Ds,Dt)return H("UIStroke",{Color=Ds or l.line,Thickness=1,Transparency=Dt or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},Dr)
end function a.grad(Du,Dv,Dw,Dx)local Dy,uw=pcall(function()return ColorSequence.new(Dv,Dw)end)if Dy and uw then return H("UIGradient",{Color=uw,Rotation=Dx or 0},Du)end
end function a.pad(Dz,ux,uy,DA,DB)H("UIPadding",{PaddingLeft=UDim.new(0,ux or 0),PaddingTop=UDim.new(0,uy or 0),
PaddingRight=UDim.new(0,DA or ux or 0),PaddingBottom=UDim.new(0,DB or uy or 0)},Dz)end function a.list(DC,DD,DE)
return H("UIListLayout",{Padding=UDim.new(0,DD or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=DE and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},DC)
end function a.ink(mv)local DF,DG=pcall(function()return 0.299*mv.R+0.587*mv.G+0.114*mv.B end)return(DF and DG>0.55)and l.ink or l.text
end function a.nextIn(uz)local uA=(a.ord[uz]or 0)+1 a.ord[uz]=uA return uA end local mw=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local uB=mw:FindFirstChild("SABFarmGui")if uB then uB:Destroy()end local mx=H("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},mw)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local hH=am.CurrentCamera.ViewportSize if hH.X>100 and hH.Y>100 then Q.w=math.clamp(math.floor(hH.X*0.48),320,400)
Q.h=math.clamp(math.floor(hH.Y*0.86),250,360)end end)a.root=H("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},mx)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local uC=UDim2 .new(1,0,1,0)
local function Ik(uD,uE)return UDim2 .new(uD,0,0,0),UDim2 .new(uE,(uD+uE>0.99)and 0 or-4,1,0)end local function ai(DH,DI,e4,DJ,DK,DL)
local my=H("TextButton",{Text=DI,Position=DK,Size=DL,BackgroundColor3=e4,BorderSizePixel=0,Font=ae.b,TextSize=DJ,TextColor3=a.ink(e4),AutoButtonColor=true},DH)
ab(my,8)if e4==l.panel2 or e4==l.raise or e4==l.panel then a.stroke(my,l.line,0.4)end return my end local function hI(DM,DN,DO,DP,DQ)
local hJ=H("TextBox",{Text=DN,PlaceholderText=DO,Position=DP,Size=DQ,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},DM)ab(hJ,8)a.stroke(hJ,l.line,0)a.pad(hJ,9,0,6,0)
return hJ end local hK=am.CurrentCamera local function DR()local DS,hL=pcall(function()return hK and hK.ViewportSize end)
if DS and hL and hL.X>50 and hL.Y>50 then return hL end end local function bQ(e5)local mz=DR()if not(mz and e5 and e5 .Parent)then return end
local DT=pcall(function()local hM,uF=e5 .AbsolutePosition,e5 .AbsoluteSize local mA=70 local uG=math.clamp(hM.X,mA-uF.X,mz.X-mA)
local uH=math.clamp(hM.Y,0,mz.Y-math.min(uF.Y,mA))if math.abs(uG-hM.X)>0.5 or math.abs(uH-hM.Y)>0.5 then e5 .Position=UDim2 .new(0,math.floor(uG),0,math.floor(uH))
end end)return DT end local function hN(DU)local DV,mB=pcall(function()return DU.AbsolutePosition end)if DV and mB then return{math.floor(mB.X),math.floor(mB.Y)}end
end local dh={}c.dragMoved={}local function uI(e6,uJ,mC)T(e6 .InputBegan:Connect(function(di)if di.UserInputType~=Enum.UserInputType.MouseButton1 and di.UserInputType~=Enum.UserInputType.Touch then return end
local mD={start=di.Position,from=uJ.Position,moved=0,target=uJ,input=di,onDrop=mC}dh[e6],c.dragMoved[e6]=mD,0
local mE mE=di.Changed:Connect(function()if di.UserInputState==Enum.UserInputState.End and dh[e6]==mD then dh[e6]=nil
if mE then mE:Disconnect()end if mC then mC(mD.moved)end end end)end))end T(nB.InputChanged:Connect(function(hO)
if hO.UserInputType~=Enum.UserInputType.MouseMovement and hO.UserInputType~=Enum.UserInputType.Touch then return end
for DW,a7 in pairs(dh)do local mF=a7 .target if mF and mF.Parent then local uK,uL=hO.Position.X-a7 .start.X,hO.Position.Y-a7 .start.Y
a7 .moved=math.max(a7 .moved,math.abs(uK)+math.abs(uL))c.dragMoved[DW]=a7 .moved mF.Position=UDim2 .new(a7 .from.X.Scale,a7 .from.X.Offset+uK,a7 .from.Y.Scale,a7 .from.Y.Offset+uL)
end end end))T(nB.InputEnded:Connect(function(hP)if hP.UserInputType~=Enum.UserInputType.MouseButton1 and hP.UserInputType~=Enum.UserInputType.Touch then return end
for DX,hQ in pairs(dh)do if hQ.input==hP or hP.UserInputType==Enum.UserInputType.MouseButton1 then dh[DX]=nil
if hQ.onDrop then hQ.onDrop(hQ.moved)end end end end))local function P(DY,DZ,D0,D1,D2,D3,D4)return H("TextLabel",{Text=DZ,Position=D3 or UDim2 .new(0,0,0,0),Size=D4 or uC,BackgroundTransparency=1,
Font=D2 and ae.b or ae.m,TextSize=D0,TextColor3=D1,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},DY)
end function a.row(uM,D5)return H("Frame",{Size=UDim2 .new(1,0,0,D5),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(uM)},uM)end function a.card(uN,uO,uP)local dj=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(uN)},uN)ab(dj,11)a.stroke(dj,l.line,0.25)a.list(dj,5)a.pad(dj,8,8,8,9)
if uO then local mG=a.row(dj,14)H("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},mG)P(mG,uO:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if uP then local D6=P(mG,uP,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
D6 .TextXAlignment=Enum.TextXAlignment.Right end end return dj end function a.heading(D7,D8,mH)local mI=a.row(D7,mH and 34 or 22)
P(mI,D8,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if mH then P(mI,mH,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mI end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(mJ)local aH=a.sw[mJ]if not aH then return end
local dk=tostring(mJ.Text or""):match(":%s*(.-)%s*$")or""local bR=dk~=""and not a.OFF[dk]local mK=not aH.chips and(dk=="ON"or dk=="OFF")
aH.pill.Visible,aH.chip.Visible=mK,not mK if mK then aH.pill.BackgroundColor3=bR and l.accent or l.panel2 aH.knob.Position=bR and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aH.knob.BackgroundColor3=bR and l.white or l.dim else aH.chip.Text=dk~=""and dk or"-"aH.chip.BackgroundColor3=bR and l.accent or l.panel2
aH.chip.TextColor3=bR and l.ink or l.dim end mJ.BackgroundColor3=bR and l.lit or l.raise if aH.edge then aH.edge.Color=bR and l.accent or l.line aH.edge.Transparency=bR and 0.55 or 0.45 end
end function a.switch(uQ,D9,D_,e7)local aZ=H("TextButton",{Name="Switch",Text=D9,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,e7 and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(uQ)},uQ)
ab(aZ,9)local au={edge=a.stroke(aZ,l.line,0.45)}au.title=P(aZ,D_,11,l.text,true,UDim2 .new(0,10,0,e7 and 4 or 0),UDim2 .new(1,-100,0,e7 and 15 or 28))
au.title.TextWrapped,au.title.TextTruncate=false,Enum.TextTruncate.AtEnd if e7 then au.sub=P(aZ,e7,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
au.sub.TextWrapped,au.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end au.pill=H("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},aZ)ab(au.pill,9)au.knob=H("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},au.pill)ab(au.knob,7)au.chip=H("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},aZ)
ab(au.chip,9)a.pad(au.chip,10,0,10,0)H("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},au.chip)
au.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[aZ]=au T(aZ:GetPropertyChangedSignal("Text"):Connect(function()a.skin(aZ)end))
a.skin(aZ)return aZ end function a.chips(mL)if a.sw[mL]then a.sw[mL].chips=true a.skin(mL)end end function a.line(Ea,Eb)
local uR=a.row(Ea,15)local uS=H("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Eb or l.dim,
BorderSizePixel=0},uR)ab(uS,3)local mM=P(uR,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mM.TextWrapped,mM.TextTruncate=false,Enum.TextTruncate.AtEnd
return mM,uS end function a.grow(uT,Ec,Ed)local hR=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=Ec or 10,TextColor3=Ed or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(uT)},uT)
T(hR:GetPropertyChangedSignal("Text"):Connect(function()hR.Visible=hR.Text~=""end))return hR end function a.note(Ee,Ef)
local uU=a.grow(Ee,9,l.dim)uU.Text=Ef return uU end function a.actions(Eg,uV)local Eh=a.row(Eg,28)local uW,mN={},#uV
for e8,uX in ipairs(uV)do uW[e8]=ai(Eh,uX[1],uX[2]or l.panel2,10,UDim2 .new((e8-1)/mN,e8>1 and 3 or 0,0,0),UDim2 .new(1/mN,(e8>1 and-3 or 0)+(e8<mN and-3 or 0),1,0))
end return table.unpack(uW)end local function M(cv,hS,Ei,Ej)a.put(cv,hS and Ei or Ej)if not a.sw[cv]and a.lit[cv]~=hS then
a.lit[cv]=hS cv.BackgroundColor3=hS and l.accent or l.panel2 cv.TextColor3=a.ink(cv.BackgroundColor3)end end a.title=H("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)H("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
H("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local mO=H("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(mO,8)a.grad(mO,l.accent,l.accent2,45)local uY=P(mO,"C",16,l.ink,true)uY.Font,uY.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local Ek=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))Ek.Font=ae.x P(a.title,"butter farm  "..bY,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local El=a.list(a.tabs,3)pcall(function()El.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function br(Em,En,Eo)
local hT=H("TextButton",{Text=Em,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(hT,9)local uZ=H("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hT)ab(uZ,2)a.tabsAll[#a.tabsAll+1]={b=hT,bar=uZ,name=En,sub=Eo}return hT end
a.tabFarm=br("🏠","Home","what the farm is doing")a.tabRun=br("🌾","Farm","the buy - wax - collect loop")a.tabBut=br("🧈","Butters","what gets bought and waxed")
a.tabCrt=br("📦","Crates","which crates get opened")a.tabPet=br("🐾","Pets","adopt, wish, fuse")a.tabTeam=br("👥","Teams","the right pets at the right moment")
a.tabSrv=br("🤝","Server","helping, campfire, ghost")a.tabAdm=br("⚡","Admin","admin abuse and its boosts")a.tabSet=br("⚙","Settings","configs, startup, performance")
local function bs()local mP=H("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mP,8)a.pad(mP,8,2,10,12)return mP end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs()a.farm.Visible=true
do local e9=a.farm local u0=a.row(e9,34)a.startB=ai(u0,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(u0,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local Ep=a.row(e9,44)local function e_(u1,Eq,u2)local hU=H("Frame",{Position=UDim2 .new((u1-1)/u2,u1>1 and 2 or 0,0,0),Size=UDim2 .new(1/u2,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},Ep)ab(hU,9)a.stroke(hU,l.line,0.3)local hV=P(hU,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hV.Font,hV.TextXAlignment,hV.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local Er=P(hU,Eq,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
Er.TextXAlignment=Enum.TextXAlignment.Center return hV end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e_(1,"BOUGHT",5),e_(2,"WAXED",5),e_(3,"SOLD",5),e_(4,"MONEY",5),e_(5,"FREE",5)
local u3=a.card(e9,"Right now")a.info=P(a.row(u3,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(u3,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fa=a.card(e9,"Systems")
a.helpL=a.line(fa,l.info)a.campL=a.line(fa,l.accent2)a.questL=a.line(fa,l.good)a.arL=a.line(fa,l.accent)a.ixL=a.line(fa,ms.Dotonbori)
local u4=a.card(e9,"Activity")a.log=H("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(u4)},u4)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function Il(Es,Et)return a.row(Et or a.farm,Es)end local al do local mQ=a.run
a.heading(mQ,"Farm","buy what rolls, wax it, collect the cash")local fb=a.card(mQ,"Loop")a.colT=a.switch(fb,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(fb,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hI(al,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fb,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fb,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fb,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local mR=a.card(mQ,"By hand")
a.buyB,a.plB=a.actions(mR,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(mR,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(mR,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local hW=a.but a.heading(hW,"Butters","what gets bought and waxed")local u5=a.card(hW,"Strategy")a.ixT=a.switch(u5,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(u5,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hW)},hW)a.list(a.butList,5)end do local hX=a.crt a.heading(hX,"Crates","only ticked crates are opened")
local u6=a.card(hX,"Opening")a.crateT=a.switch(u6,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(u6,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hX)},hX)a.list(a.crtList,5)end do local hY=a.pet a.heading(hY,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local fc=a.card(hY,"Automatic")a.pbT=a.switch(fc,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fc,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(fc,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(fc,10,l.dim)a.note(fc,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hY)},hY)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hZ=a.srv a.heading(hZ,"Server","other players, the campfire, staying hidden")
local mS=a.card(hZ,"Helping")a.helpT=a.switch(mS,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(mS,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mS,l.info)
local u7=a.card(hZ,"Campfire")a.campT=a.switch(u7,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(u7,l.accent2)local mT=a.card(hZ,"Ghost")a.ghostT=a.switch(mT,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mT,l.dim)a.note(mT,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fd=a.adm a.heading(fd,"Admin abuse","the show, its boosts and the farm in it")local u8=a.card(fd,"When")
a.admBig=P(a.row(u8,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(u8,14),"",10,l.dim,false)local Eu=a.card(fd,"Boosts now")
a.admBoost=a.grow(Eu,11,l.text)local mU=a.card(fd,"What the farm does")a.shT=a.switch(mU,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mU,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(mU,l.accent)
local u9=a.card(fd,"Show feed")a.admFeed=H("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(u9)},u9)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local dl=a.set a.heading(dl,"Settings","kept on your phone, per config")
local h0=a.card(dl,"Config")al=a.row(h0,28)a.cfgName=hI(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(h0,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(h0,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(h0,10,l.dim)local mV=a.card(dl,"Starting")a.startT=a.switch(mV,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mV,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(mV,9,l.dim)local mW=a.card(dl,"If the game drops me")
a.rejT=a.switch(mW,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(mW,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(mW,9,l.dim)local bt=a.card(dl,"Performance")a.pfCalm=a.switch(bt,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bt,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bt,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bt,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bt,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bt,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bt,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hI(al,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bt,l.good)a.note(bt,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local Ev=a.card(dl,"About")a.note(Ev,"CHURN "..bY.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Im,Ew in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(Ew)end local u_=H("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},mw)
a.tgRoot=H("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},u_)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=H("TextButton",{Text="C",Size=uC,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=H("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=H("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fe=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fe][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fe][2]
a.tgGhost.BackgroundColor3=fe==2 and l.accent or(fe==1 and l.warn or l.panel)a.tgGhost.TextColor3=fe>0 and l.ink or l.dim
end end local bu={built=false,boxes={},at=0}function a.check(h1,mX)h1 .Text=mX and"✓"or""h1 .BackgroundColor3=mX and l.accent or l.bg
h1 .TextColor3=l.ink local mY=h1 .Parent if mY and mY:IsA("TextButton")then mY.BackgroundColor3=mX and l.lit or l.raise end
end local function va(vb,vc)e.Targets[vb]=vc or nil local vd=bu.boxes[vb]if vd then a.check(vd,vc)end end local function mZ()
for Ex,Ey in pairs(bu.boxes)do a.check(Ey,e.Targets[Ex]==true)end end function a.tickBox(Ez)local m0=H("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Ez)ab(m0,6)
a.stroke(m0,l.line,0)return m0 end local ff local function EA()local EB=a.card(a.butList,"Butter list")local m1=a.row(EB,26)
a.butInfo=P(m1,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local EC=ai(m1,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local ED=ai(m1,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))EC.MouseButton1Click:Connect(function()
for EE in pairs(e.Targets)do e.Targets[EE]=nil end mZ()end)ED.MouseButton1Click:Connect(function()ad.at=0 ja()
ff(true)end)end ff=function(EF)if not ja()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bu.built and not EF and bu.at==ad.at then return end for In,h2 in ipairs(a.butList:GetChildren())do
if h2:IsA("Frame")or h2:IsA("TextButton")or h2:IsA("TextLabel")then h2:Destroy()end end bu.boxes,a.butEmpty={},nil
EA()for Io,h3 in ipairs(ad.rarOrder)do local m2=ms[h3]or l.text local cw=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cw,11)a.stroke(cw,m2,0.7)a.list(cw,4)a.pad(cw,7,7,7,8)
local m3=a.row(cw,22)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=m2,BorderSizePixel=0},m3)
local EG=P(m3,h3:upper(),11,m2,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))EG.Font=ae.x local EH=ai(m3,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local EI=h3 EH.MouseButton1Click:Connect(function()local ve=ad.members[EI]or{}local vf=false for Ip,EJ in ipairs(ve)do if not e.Targets[EJ]then vf=true break end end
for Iq,EK in ipairs(ve)do va(EK,vf)end end)for Ir,m4 in ipairs(ad.members[h3]or{})do local h4=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cw)},cw)ab(h4,8)local vg=P(h4,ak(m4),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
vg.TextWrapped,vg.TextTruncate=false,Enum.TextTruncate.AtEnd local vh=a.tickBox(h4)bu.boxes[m4]=vh local vi=m4
local function vj()va(vi,not e.Targets[vi])end h4 .MouseButton1Click:Connect(vj)vh.MouseButton1Click:Connect(vj)
end end mZ()bu.built,bu.at=true,ad.at end function L.paint()for EL,EM in pairs(L.boxes)do a.check(EM,e.CrateTicks[EL]==true)end
if a.crtInfo then local m5,m6=0,0 for Is in pairs(L.boxes)do m5=m5+1 end for It,EN in pairs(e.CrateTicks)do if EN then m6=m6+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(m5,m6))end if a.crateT then M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for Iu,h5 in ipairs(a.crtList:GetChildren())do if h5:IsA("Frame")or h5:IsA("TextButton")or h5:IsA("TextLabel")then h5:Destroy()end
end L.boxes={}local m7=a.card(a.crtList,"All of them","worst first")local m8=a.row(m7,26)a.crtInfo=P(m8,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local EO=ai(m8,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local EP=ai(m8,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(EO.MouseButton1Click:Connect(function()e.CrateTicks={}L.paint()end))T(EP.MouseButton1Click:Connect(function()L.build()end))
for Iv,bv in ipairs(L.list())do local vk=ms[bv.rar or""]or l.text local dm=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(m7)},m7)ab(dm,8)H("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=vk,BorderSizePixel=0},dm)
local vl=P(dm,(bv.title or bv.name)..(bv.guess and"  (?)"or""),11,vk,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
vl.TextWrapped,vl.TextTruncate=false,Enum.TextTruncate.AtEnd local EQ=P(dm,bv.price and("$"..aK(bv.price))or(bv.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
EQ.TextXAlignment=Enum.TextXAlignment.Right local vm=a.tickBox(dm)L.boxes[bv.k]=vm local vn=bv.k local function vo()
e.CrateTicks[vn]=(not e.CrateTicks[vn])or nil L.paint()end T(dm.MouseButton1Click:Connect(vo))T(vm.MouseButton1Click:Connect(vo))
end L.built=L.at L.paint()end local vp="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a0(cx)vp=cx for ER,m9 in ipairs(a.tabKeys)do a[m9].Visible=(m9==cx)local h6=a.tabsAll[ER]if h6 then
local m_=m9==cx h6 .b.BackgroundTransparency,h6 .b.TextTransparency,h6 .bar.Visible=m_ and 0 or 1,m_ and 0 or 0.45,m_
end end if cx=="pet"and not q.built then pcall(q.build)end if cx=="team"and not z.built then pcall(z.build)end
if cx=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cx=="but"then ff(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(na,vq,vr,vs)if vs then na.Text=vs end na.BackgroundColor3=vq and vr or l.bg na.TextColor3=vq and a.ink(vr)or l.dim
end function q.paintRow(vt)local cy=q.rows and q.rows[vt]if not cy then return end local cz=e.Pets[vt]or{}local fg=tonumber(cz.f)or 0
a.flag(cy.b,cz.b,l.good)a.flag(cy.g,cz.g,l.accent,cz.g and"BIG"or"ANY")a.flag(cy.w,cz.w,l.warn)a.flag(cy.f,fg>0,l.good,fg>=7 and"7 BIG/HUGE"or(fg>0 and(fg.." BIG")or"FUSE"))
if cy.row then cy.row.BackgroundColor3=(cz.b or cz.w or fg>0)and l.lit or l.raise end end function q.flag(nb,h7)
local a8=e.Pets[nb]or{}if h7=="f"then local ES={[0]=1,[1]=2,[2]=3,[3]=7}local vu=ES[tonumber(a8 .f)or 0]or 0 a8 .f=vu>0 and vu or nil
elseif a8[h7]then a8[h7]=nil else a8[h7]=true end e.Pets[nb]=(a8 .b or a8 .g or a8 .w or a8 .f)and a8 or nil q.paintRow(nb)
end function q.paintAll()for ET in pairs(q.rows or{})do q.paintRow(ET)end if a.pbT then M(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local nc=q.wishes()local fh=q.data()for h8,nd in pairs(q.rows)do local vv=C.status(h8,fh)nd.desc.Text=(nc[h8]and("wishing %dm | "):format(math.ceil(nc[h8]/60))or"")..(vv and(vv.." | ")or"")..nd.boostText
nd.desc.TextColor3=nc[h8]and l.text or l.dim end local vw=tonumber(J:GetAttribute("PetWishCredits"))or 0 a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(fh and#(fh.pets or{})or 0,fh and tonumber(fh.maxOwned)or 60,
aK(q.money()),vw>0 and(" | free wishes "..vw)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local h9=q.info()for Iw,h_ in ipairs(a.petList:GetChildren())do if h_:IsA("Frame")or h_:IsA("TextLabel")or h_:IsA("TextButton")then h_:Destroy()end
end q.rows={}if not h9 then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dn={}for Ix,vx in ipairs(q.order())do local ne=h9 .Pets[vx].rarity or"?"dn[ne]=dn[ne]or{}
table.insert(dn[ne],vx)end local dp={}for Iy,vy in ipairs(h9 .Rarities or{})do if dn[vy]then dp[#dp+1]=vy end end
for vz in pairs(dn)do if not table.find(dp,vz)then dp[#dp+1]=vz end end for Iz,nf in ipairs(dp)do local ia=q.RC[nf]or l.text
local cA=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cA,11)a.stroke(cA,ia,0.7)a.list(cA,4)a.pad(cA,7,7,7,8)local vA=a.row(cA,18)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=ia,BorderSizePixel=0},vA)
local EU=P(vA,nf:upper(),11,ia,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))EU.Font=ae.x for IA,ib in ipairs(dn[nf])do
local fi=H("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cA)},cA)
ab(fi,8)local ng=P(fi,q.nice(ib),11,ia,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))ng.TextWrapped,ng.TextTruncate=false,Enum.TextTruncate.AtEnd
local EW,EX=pcall(function()return h9 .describe(ib)end)local vB=EW and tostring(EX)or""local nh=P(fi,vB,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
nh.TextYAlignment,nh.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function ic(EY,EZ,E0)
local vC=ai(fi,EY,l.bg,8,UDim2 .new(1,EZ,0,5),UDim2 .new(0,E0,0,22))vC.AutoButtonColor=true return vC end local vD,vE,vF,vG=ic("BUY",-164,30),ic("ANY",-131,30),ic("WISH",-98,34),ic("FUSE",-61,56)
local ie=ib vD.MouseButton1Click:Connect(function()q.flag(ie,"b")end)vE.MouseButton1Click:Connect(function()q.flag(ie,"g")end)
vF.MouseButton1Click:Connect(function()q.flag(ie,"w")end)vG.MouseButton1Click:Connect(function()q.flag(ie,"f")end)
q.rows[ib]={b=vD,g=vE,w=vF,f=vG,name=ng,desc=nh,boostText=vB,row=fi}end end q.built=true q.paintAll()end function d.paint()
M(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])M(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end T(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local E1=table.find(d.CAPS,e.FpsCap or 0)or 1 local vH=d.CAPS[(E1%#d.CAPS)+1]
if not d.cap(vH)and vH~=0 then A("this executor cannot cap fps")end d.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local ni=tonumber(a.pfMem.Text)if ni and ni>=0 then e.MemLimit=math.floor(ni)end d.paint()end))function z.names()
local nj={"(none)"}for IB,E2 in ipairs((z.teams()))do nj[#nj+1]=E2 .name end return nj end function z.cycle(nk,E3)
local ig=z.names()local E4=e[nk]~=""and e[nk]or"(none)"local ih=table.find(ig,E4)or 1 ih=((ih-1+E3)%#ig)+1 e[nk]=ig[ih]=="(none)"and""or ig[ih]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local nl={}for IC,E5 in ipairs((z.teams()))do nl[E5 .name]=true end
for E6,vI in pairs(z.pick)do local dq=e[E6]vI.Text=dq==""and"(none)"or(nl[dq]and dq or(dq.." (missing)"))vI.TextColor3=(dq~=""and not nl[dq])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local E7,ii=q.srv(),{}for ID,ij in ipairs(z.list or{})do ii[#ii+1]=("st %-2s %-22s %9s  helps %d"):format(ij.st.Name,ak(W(ij.name)):sub(1,22),z.clock(ij.ends-E7),ij.helps)
end a.tmList.Text=#ii>0 and table.concat(ii,"\n")or"no waxes running"end function z.build()for IE,ik in ipairs(a.teamList:GetChildren())do
if ik:IsA("Frame")or ik:IsA("TextLabel")or ik:IsA("TextButton")then ik:Destroy()end end z.pick={}local il=a.card(a.teamList,"Automatic")
a.tmT=a.switch(il,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(il,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild z.paint()end)a.tmBuildNow=a.actions(il,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local E8,E9=pcall(C.rebuild,"you asked")if not E8 then A("BUILD ERR "..tostring(E9))end end)
end)a.tmInfo=a.grow(il,10,l.dim)local vJ=a.card(a.teamList,"Which team when")local function im(io,E_,Fa)local fj=a.row(vJ,54)
P(fj,E_,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local vK=P(fj,Fa,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
vK.TextWrapped,vK.TextTruncate=false,Enum.TextTruncate.AtEnd local Fb=ai(fj,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local vL=ai(fj,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local Fc=ai(fj,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
Fb.MouseButton1Click:Connect(function()z.cycle(io,-1)end)Fc.MouseButton1Click:Connect(function()z.cycle(io,1)end)
vL.MouseButton1Click:Connect(function()z.cycle(io,1)end)z.pick[io]=vL end im("TeamNormal","Normal","the rest of the time: money + luck")
im("TeamFull","Full","every station busy: money + wax speed")im("TeamGlaze","Glaze","worn just before a wax finishes")
local ip=a.row(vJ,26)P(ip,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hI(ip,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(ip,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local Fd=ai(ip,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
Fd.MouseButton1Click:Connect(function()local iq=tonumber(a.tmLead.Text)if iq and iq>=5 and iq<=600 then e.GlazeLead=math.floor(iq)else a.tmLead.Text=tostring(e.GlazeLead)end
z.paint()end)im("TeamWax","Wax","while a butter is placed: head starts")local vM=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(vM)},vM)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local Fe=a.card(a.teamList,"How it works")a.note(Fe,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function Ff()a.secB.Text=tostring(e.Every)M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()o.paint()M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(d.unpin)end end)end
M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then eT(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bQ(a.root)bQ(a.tgRoot)c.lastCollect=y()
mZ()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(d.applyAll)end local function Fg(vN)task.spawn(function()vN.TextColor3=l.bad
task.wait(0.8)if c.alive then vN.TextColor3=l.text end end)end local function vO()local vP=a.secB.Text:match("^%s*(%d+)%s*$")
local fk=vP and tonumber(vP)if not fk or fk<1 then a.secB.Text=tostring(e.Every)Fg(a.secB)A("interval must be a whole number >= 1")
return end if fk==e.Every then return end e.Every,c.lastCollect=fk,y()A("collect every "..fk.."s")end local function N(Fh,Fi)T(Fh.MouseButton1Click:Connect(Fi))end
N(a.secSet,vO)T(a.secB.FocusLost:Connect(vO))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,y()M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",tb)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help E.nextAt,E.msg=0,e.Help and"looking for waxes to help"or"off"M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests F.at=0 M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function o.paint()M(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
M(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(Fj)task.spawn(function()pcall(o.tick)if Fj and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local Fk=o.on()e.AutoIndex=not e.AutoIndex o.discAt=-100 o.changed(Fk)end)
N(a.bestT,function()local Fl=o.on()e.Best=((e.Best or 0)+1)%5 o.stackAt=-100 o.changed(Fl)end)N(a.bcT,function()
local Fm=o.on()e.BestCrate=not e.BestCrate o.changed(Fm)end)N(a.shT,function()e.Shower=not e.Shower o.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false o.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy q.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish q.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse q.paintAll()end)
function o.admPaint()local bS=q.srv()local bT pcall(function()o.aac=o.aac or require(af:FindFirstChild("AdminAbuseClient"))
bT=o.aac:GetState()end)local dr,bU="nothing scheduled","the game has not announced one"if type(bT)=="table"then
local fl,a1,bV=tostring(bT.Phase or""),tonumber(bT.StartsAt),tonumber(bT.EndsAt)if a1 and a1<1e9 then a1=nil end
if bV and bV<1e9 then bV=nil end if fl=="Countdown"and a1 then dr,bU="starts in "..z.clock(a1-bS),os.date("%a %H:%M",math.floor(a1)).." your time"
elseif fl=="Live"and bV then dr,bU="LIVE  -  "..z.clock(bV-bS).." left","the farm is grabbing, waxing and glazing through it"
elseif fl~=""and fl~="Idle"and bV and bV>bS then dr,bU=fl:lower().."  -  "..z.clock(bV-bS).." left","after the show"
elseif a1 and a1>bS then dr,bU="next: "..os.date("%a %H:%M",math.floor(a1)),"your time"elseif a1 then dr,bU="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a1)).." your time"
end if type(bT.Kind)=="string"and bT.Kind~=""then bU=bU.."  |  "..bT.Kind end end a.put(a.admBig,dr)a.put(a.admSub,bU)
local ds,nm={},af:FindFirstChild("AdminShow")if nm then local Fn,Fo=pcall(function()return nm:GetAttributes()end)
for vQ,dt in pairs(Fn and Fo or{})do local ir=type(vQ)=="string"and vQ:match("^(.-)Mult$")local nn=ir and tonumber(nm:GetAttribute(ir.."Until"))
if ir and type(dt)=="number"and dt~=1 and dt~=0 and nn and nn>bS then ds[#ds+1]=("%s  x%s   %s left"):format(ir:gsub("(%l)(%u)","%1 %2"),(dt%1==0)and tostring(dt)or("%.2f"):format(dt),
z.clock(nn-bS))end end end table.sort(ds)a.put(a.admBoost,#ds>0 and table.concat(ds,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#ds>0 and l.accent or l.dim local is=0 for IF in pairs(O.drops)do is=is+1 end local vR=o.snapAt and(o.snapAt-bS)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,is>0 and(", "..is.." falling")or"",
vR and("in "..math.max(0,math.floor(vR)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",d4,true)end)N(a.padB,function()c.plot=bw()or c.plot local vS,no=ap(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(vS and no and no:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=no.CFrame:ToObjectSpace(vS.HumanoidRootPart.CFrame)
B7(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eT(not c.running)end)N(a.buyB,function()
c.plot=bw()or c.plot task.spawn(as,"buying (manual)...",pl,true)end)N(a.plB,function()c.plot=bw()or c.plot task.spawn(as,"waxing (manual)...",pp)
end)N(a.tabFarm,function()a0("farm")end)N(a.tabRun,function()a0("run")end)N(a.tabSrv,function()a0("srv")end)N(a.tabAdm,function()a0("adm")end)
N(a.tabBut,function()a0("but")end)N(a.tabSet,function()a0("set")end)N(a.tabCrt,function()a0("crt")end)N(a.tabPet,function()a0("pet")end)
N(a.tabTeam,function()a0("team")end)local function Fp(np)c.hidden=np a.root.Visible=not np a.tgBtn.TextColor3=np and l.text or l.ink
end uI(a.tgBtn,a.tgRoot,function()bQ(a.tgRoot)c.togPos=hN(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then Fp(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aI,aw={},0 local function bW()aI=oI()if#aI==0 then a.cfgPick.Text="(none saved)"
aw=0 return end if aw<1 or aw>#aI then aw=1 end a.cfgPick.Text=aI[aw]..("  (%d/%d)"):format(aw,#aI)end local function vT()
local vU=c.autoload~=nil a.cfgAuto.Text=vU and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=vU and l.accent or l.panel2
end local function nq()local vV=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if vV~=""then return vV end return(aw>0 and aI[aw])or""
end N(a.cfgSave,function()c.winPos=hN(a.root)or c.winPos c.togPos=hN(a.tgRoot)or c.togPos local vW,vX=f0(nq())
a.cfgMsg.Text=vW and("saved as "..vX)or("could not save: "..vX)a.cfgMsg.TextColor3=vW and l.good or l.bad bW()
A(a.cfgMsg.Text)end)local function Fq(nr)local ns,vY=oR(nr)a.cfgMsg.Text=ns and("loaded "..vY)or("could not load: "..vY)
a.cfgMsg.TextColor3=ns and l.good or l.bad if ns then a.cfgName.Text=nr Ff()task.spawn(D.apply,"config "..nr)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()Fq(nq())end)N(a.cfgPick,function()bW()if aw>0 then a.cfgName.Text=aI[aw]end
end)N(a.cfgPrev,function()if#aI==0 then bW()return end aw=(aw-2)%#aI+1 bW()a.cfgName.Text=aI[aw]end)N(a.cfgNext,function()
if#aI==0 then bW()return end aw=aw%#aI+1 bW()a.cfgName.Text=aI[aw]end)N(a.cfgAuto,function()if c.autoload then
oT(nil)a.cfgMsg.Text="it will not load a config on launch"else local fm=nq()local vZ=false for IG,Fr in ipairs(oI())do if Fr==fm then vZ=true end end
local Fs=vZ or f0(fm)if Fs and fm~=""then oT(fm)bW()a.cfgMsg.Text=fm.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim vT()end)N(a.autoB,function()
local v0,v1=xV()a.autoMsg.Text=v0 and("installed. "..v1)or("failed: "..v1)a.autoMsg.TextColor3=v0 and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dN("you asked")end)
local a9=false N(a.minB,function()a9=not a9 a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not a9,not a9,not a9
if a9 then for IH,Ft in ipairs(a.tabKeys)do a[Ft].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a0(vp)
end a.root.Size=UDim2 .new(0,Q.w,0,a9 and(Q.head+Q.status+12)or Q.h)a.minB.Text=a9 and"+"or"-"end)local function it()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(fA)for II,Fu in ipairs(iC)do pcall(function()Fu:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()mx:Destroy()end)
pcall(function()u_:Destroy()end)if cC.SAB_KILL==it then cC.SAB_KILL=nil end end cC.SAB_KILL=it N(a.killB,it)N(a.xB,it)
uI(a.title,a.root,function()bQ(a.root)c.winPos=hN(a.root)or c.winPos end)local function v2()local fn,cB=c.reason,c.level
if c.busy then fn,cB=c.busyText,"ok"elseif not c.running then local IJ,v3,Fv=tN()if c.capHit then fn,cB=v3,"bad"else fn,cB="[stopped] "..v3,(Fv=="bad")and"bad"or"idle"end
c.reason,c.level=fn,cB end local du=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=du then
a.lit.dot=du a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=du,du,du,du a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fn)if a.lit.bar~=cB then a.lit.bar=cB a.bar.BackgroundColor3=Di[cB]or l.dim end
if a9 then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bX=xu()if a.farm.Visible then local Fw,Fx=fw()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Fw.."/"..Fx)local v4=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(y()-c.lastCollect)))or nil
local v5=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aK(a_()),c.rolls,c.gifts,c.crates,v5 and ak(W(v5))or"nothing",j.on and("   ["..j.title.." window open]")or"",
v4 and("in "..v4 .."s")or"off"))a.put(a.tgt,(#bX==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bX<=3)and table.concat(bX,", ")or(#bX.." butters ticked"))))
if a.lit.tgt~=(#bX==0)then a.lit.tgt=(#bX==0)a.tgt.TextColor3=(#bX==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fq,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,e.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bX))
end if a.but.Visible and bu.at~=ad.at then ff(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(e.Campfire and K.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local v6=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",v6~=""and v6 or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cC.SAB={S=c,CFG=e,EV=V,U=a,sg=mx,CAT=ad,LEARN=aj,buildList=ff,
logAll=dv,evAll=dw,AR=D,CR=L,PF=d,PX=q,TM=z,CRATE=j,FU=C,HX=E,CF=K,QX=F,IX=o,SH=O}A(bY.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a0("farm")bQ(a.root)bQ(a.tgRoot)if hK then pcall(function()T(hK:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bQ(a.root)bQ(a.tgRoot)end))end)end bW()vT()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(v2)task.spawn(function()local v7=xT()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(v7 and("\n(backup: "..v7 ..")")or"")
local v8=fU(an.exec)if v8 and not v8:find("SAB autoloader v2",1,true)then dJ(an.exec,an.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fU(an.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(x1)end)task.spawn(function()while c.alive do local Fy,Fz=pcall(v2)if not Fy then A("UI ERR "..tostring(Fz))end
task.wait((c.hidden or a9)and 1.5 or 0.4)end end)task.spawn(function()local FA,FB=pcall(x9)if not FA then A("HOOK ERR "..tostring(FB))end
end)task.spawn(function()pcall(wR)if j.loadSeq and not j.learned then local iu={}for v9=1,20 do if j.loadSeq[v9]then iu[#iu+1]=j.loadSeq[v9]end end
if#iu>0 then j.learned={seq=iu,mode=j.loadMode}A("remembered how to open crates directly")end end if ja()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local FC,v_=pcall(B9)if FC and v_ and c.alive and not c.manualPad then c.manualPad=v_ end end)task.spawn(function()
while c.alive do local nt,nu=pcall(q.buyTick)if not nt then A("PET ERR "..tostring(nu))task.wait(5)end nt,nu=pcall(q.wishTick)
if not nt then A("WISH ERR "..tostring(nu))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local iv,wa=0,y()
T(game:GetService("RunService").Heartbeat:Connect(function()iv=iv+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
T(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=y()
while c.alive do task.wait(1)local wb=y()d.fps,iv,wa=iv/math.max(wb-wa,0.001),0,wb local FD,FE=pcall(d.tick)if not FD then A("PERF ERR "..tostring(FE))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local FF,FG=pcall(C.tick)if not FF then A("FUSE ERR "..tostring(FG))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local FH,FI=pcall(z.tick)if not FH then A("TEAM ERR "..tostring(FI))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local iw=af:WaitForChild("Remotes",30)local wc=iw and iw:WaitForChild("ClanEvent",30)
if wc and c.alive then T(wc.OnClientEvent:Connect(function(FJ,FK)if FJ=="call"then pcall(E.onCall,FK)end end))
end local wd=iw and iw:FindFirstChild("RollConfirmAsk")if wd and c.alive then T(wd.OnClientEvent:Connect(function(FL)F.asked=FL or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)end end end)task.spawn(function()
local nv=af:WaitForChild("Remotes",30)if not(nv and c.alive)then return end local function ix(FM,FN)local nw=nv:FindFirstChild(FM)
if nw and nw:IsA("RemoteEvent")then T(nw.OnClientEvent:Connect(function(...)pcall(FN,...)end))end end ix("NewSquishyDiscovered",function(nx,we)
if type(nx)~="string"then return end o.disc=o.disc or{}o.disc[W(nx)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(nx)),we and(" ("..tostring(we)..")")or""))
end)ix("IndexRefresh",o.loadDisc)ix("IndexRowComplete",function(FO)A("INDEX: the whole "..tostring(FO).." row is complete")end)
ix("AdminShow",o.admin)local wf=nv:FindFirstChild("AdminShowSync")if wf then local FP,wg=pcall(function()return wf:InvokeServer()end)
if FP and type(wg)=="table"then for IK,FQ in pairs(wg)do pcall(O.add,FQ)end end end while c.alive do local FR,FS=pcall(o.tick)
if not FR then o.msg="index error: "..tostring(FS)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local FT,FV=pcall(F.tick)if not FT then A("QUEST ERR "..tostring(FV))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(fA)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local FX=(type(newcclosure)=="function")and newcclosure or function(FW)return FW end local ny
local wh=(type(setnamecallmethod)=="function")and setnamecallmethod or nil ny=hookmetamethod(game,"__namecall",FX(function(wi,...)
local fo=getnamecallmethod()if c.alive and(fo=="InvokeServer"or fo=="FireServer")then local wj,wk=pcall(function()return wi.Name end)
if wj and wk=="CrateAction"and not j.replaying then pcall(j.saw,fo,...)elseif wj and wk=="AutoRollAction"and not D.replaying then pcall(D.saw,fo,...)end
if wh then wh(fo)end end return ny(wi,...)end))j.oldNC=ny end)end if iA then T(J.Idled:Connect(function()pcall(function()iA:CaptureController()iA:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for IL=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ap()and(c.plot or bw())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local iy=b3()
if iy and o.on()and not aJ(iy.name)then iy=nil end if c.alive and e.AutoRoll and c.running and not D.isOn()and not iy and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for IM=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bw()if ap()and c.plot and o.any()then eT(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bw()c.lastCollect=y()while c.alive do if c.running then local FY,wl=pcall(Dd)if not FY and wl~=iB then A("LOOP ERR "..tostring(wl))end
end task.wait(0.1)end end)iz("ready - the window is at the top left")end local F0,nz=xpcall(wp,function(FZ)return tostring(FZ).."\n"..debug.traceback()end)
if not F0 then pcall(function()warn("SAB "..bY.." ERROR: "..tostring(nz))end)iz("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bY.." ERROR: "..tostring(nz))end)pcall(function()local wm=(type(getgenv)=="function"and getgenv())or _G
if type(wm.SAB_KILL)=="function"then wm.SAB_KILL()end for IN,F1 in ipairs({"SABFarmGui","SABToggle"})do local wn=J.PlayerGui:FindFirstChild(F1)
if wn then wn:Destroy()end end end)pcall(function()local fp=Instance.new("ScreenGui")fp.Name="SABError"fp.ResetOnSpawn=false
fp.DisplayOrder=1000 local a2=Instance.new("TextBox")a2 .Size=UDim2 .new(0,340,0,170)a2 .Position=UDim2 .new(0,10,0,50)
a2 .BackgroundColor3=Color3 .fromRGB(90,20,20)a2 .TextColor3=Color3 .new(1,1,1)a2 .TextSize=11 a2 .TextWrapped=true
a2 .ClearTextOnFocus=false a2 .TextXAlignment=Enum.TextXAlignment.Left a2 .TextYAlignment=Enum.TextYAlignment.Top
a2 .Text="SAB "..bY.." failed to start. Send this text:\n"..tostring(nz)a2 .Parent=fp fp.Parent=J:WaitForChild("PlayerGui")
end)end
