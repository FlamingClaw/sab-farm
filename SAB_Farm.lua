local bY="v27"local nz=game:GetService("Players")local J=nz.LocalPlayer or nz.PlayerAdded:Wait()local function iy(wl)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bY,Text=wl,Duration=6})
end)end iy("script started")local function wm()local af=game:GetService("ReplicatedStorage")local am=game:GetService("Workspace")
local nA=game:GetService("UserInputService")local cC=(type(getgenv)=="function"and getgenv())or _G if type(cC.SAB_KILL)=="function"then pcall(cC.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local iz=(function()local wn,wo=pcall(function()return game:GetService("VirtualUser")end)return wn and wo or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
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
local q,z,d,C,E,K,F={},{},{},{},{},{},{}local o,O={},{}local iA={}local iB,fq,du,dv={},{},{},{}local function T(nB)iB[#iB+1]=nB return nB end
local function ag(wp)task.wait(wp)if not c.alive then error(iA,0)end end local function A(fr)fr=os.date("%H:%M:%S").." "..tostring(fr)
table.insert(fq,1,fr)if#fq>6 then table.remove(fq)end c.logN=(c.logN or 0)+1 du[#du+1]=fr if#du>80 then table.remove(du,1)end
end local function fs(nC)if type(nC)~="string"then return""end return(nC:lower():gsub("[^%w]",""))end local function W(wq)
local nD=fs(wq)local iC=nD:gsub("butter$","")if iC==""then iC=nD end return iC end local function aJ(nE)if type(nE)~="string"then return false end
local iD=W(nE)if iD==""then return false end if o.want then return o.want(iD)end return e.Targets[iD]==true end
local function wr(dw)dw=dw:lower()return dw:find("squishy",1,true)~=nil or dw:match("butter$")~=nil or dw:match("butter[^%a]")~=nil
end local iE={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aK(dx)if type(dx)~="number"then return"?"end
local ft=1 while math.abs(dx)>=1000 and ft<#iE do dx=dx/1000 ft=ft+1 end local ws=string.format("%.2f",dx):gsub("%.?0+$","")
return ws..iE[ft]end local function wt(nF)if type(nF)~="string"then return nil end local wu,dy=nF:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local iF=tonumber(wu)if not iF then return nil end if dy==""then return iF end local wv={qd="qa",qn="qi"}dy=wv[dy:lower()]or dy
for ww,wx in ipairs(iE)do if wx:lower()==dy:lower()then return iF*1000^(ww-1)end end return nil end local function a_()
local nG=J:GetAttribute("BoardValueMoney")if type(nG)=="number"then return nG end local nH=J:FindFirstChild("leaderstats")
if nH then for FY,wy in ipairs({"Cash","Money","Coins"})do local iG=nH:FindFirstChild(wy)if iG and type(iG.Value)=="number"then return iG.Value end
end end end local function fu(wz)local iH=wz:GetFullName()if c.plot then local iI=c.plot:GetFullName()if iH:sub(1,#iI)==iI then return iH:sub(#iI+2)end
end return iH end local function ap()local fv=J.Character if fv and fv:FindFirstChild("HumanoidRootPart")then
local nI=fv:FindFirstChildOfClass("Humanoid")if nI and nI.Health>0 then return fv end end end local function bw()
local iJ=am:FindFirstChild("Plots")if not iJ then return nil end local function nJ(wA)local nK=wA:FindFirstChild("Plate")
return nK~=nil and nK:FindFirstChild("EditStackAttachment",true)~=nil end local nL=J:GetAttribute("PlotNumber")
if nL~=nil then local iK=iJ:FindFirstChild(tostring(nL))if iK and nJ(iK)then return iK end end for FZ,nM in ipairs(iJ:GetChildren())do
if nJ(nM)then return nM end end end local function dz(nN)local bx=nN and nN.Parent for F0=1,6 do if not bx then return nil end
if bx:IsA("BasePart")then return bx end if bx:IsA("Model")then return bx.PrimaryPart or bx:FindFirstChildWhichIsA("BasePart",true)end
bx=bx.Parent end end local function nO(nP)local iL=nP.Parent if iL and iL:IsA("Attachment")then return iL.WorldPosition end
local nQ=dz(nP)return nQ and nQ.Position end local function nR()local cD=c.plot and c.plot:FindFirstChild("Plate")
if not cD then return nil end if cD:IsA("BasePart")then return cD.Position end if cD:IsA("Model")then return cD:GetPivot().Position end
local nS=cD:FindFirstChildWhichIsA("BasePart",true)return nS and nS.Position end local function nT()local iM={}
local nU=c.plot and c.plot:FindFirstChild("WaxStations")if nU then for F1,wB in ipairs(nU:GetChildren())do local nV=wB:FindFirstChild("SquishyPlaceHolder")
local iN=nV and nV:FindFirstChild("PlacePrompt")if iN and iN:IsA("ProximityPrompt")then iM[#iM+1]=iN end end end
return iM end local function fw()local nW,iO=nT(),0 for F2,wC in ipairs(nW)do if wC.Enabled then iO=iO+1 end end
local iP=#nW local iQ=J:GetAttribute("WaxStations")if type(iQ)=="number"and iQ>iP then iP=iQ end return iO,iP
end local function wD()local nX=ap()local nY=nX and nX.HumanoidRootPart.Position local iR,nZ for F3,iS in ipairs(nT())do
if iS.Enabled then local n0=nO(iS)local n1=(n0 and nY)and(n0-nY).Magnitude or 1e9 if not iR or n1<nZ then iR,nZ=iS,n1 end
end end return iR end local function n2()local fy=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fy then return nil end local n3=fy:FindFirstChild("BuyPromptAttachment")local fz=(n3 and n3:FindFirstChild("BuyPrompt"))or fy:FindFirstChild("BuyPrompt",true)
if fz and fz:IsA("ProximityPrompt")and fz:IsDescendantOf(fy)then return fz end end local n4={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local wE={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iT="SAB_order.txt"local function fA()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for wF,wG in pairs(aj.price)do aB[#aB+1]="P|"..wF.."|"..string.format("%.0f",wG)end for wH,wI in pairs(aj.order)do aB[#aB+1]="O|"..wH.."|"..table.concat(wI,",")end
if j.learned and j.enc then aB[#aB+1]="M|mode|"..tostring(j.learned.mode or"")for wJ,fB in ipairs(j.learned.seq)do
local n5={}for n6=1,fB.n do n5[n6]=j.enc(fB.args[n6])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(wJ,fB.m,fB.n,table.concat(n5,";"))
end end local function iU(wK,wL,fC)local n7={}for n8=1,fC.n do n7[n8]=j.enc(fC.args[n8])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(wL,wK,fC.m,fC.n,table.concat(n7,";"))
end if j.enc then for wM,wN in ipairs(D.rec.rules)do iU("rules",wM,wN)end if D.rec.on then iU("on",0,D.rec.on)end
if D.rec.off then iU("off",0,D.rec.off)end end for F4,dA in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dA.name,dA.title or"",dA.rar or"",dA.price and string.format("%.0f",dA.price)or"")
end if pcall(writefile,iT,table.concat(aB,"\n"))then aj.dirty=false end end local function wO()if type(isfile)~="function"or type(readfile)~="function"then return end
local wP,wQ=pcall(isfile,iT)if not(wP and wQ)then return end local wR,n9=pcall(readfile,iT)if not(wR and type(n9)=="string")then return end
for wS in n9:gmatch("[^\n]+")do local cE,cF,ba=wS:match("^(%a)|([^|]+)|(.*)$")if cE=="P"then aj.price[cF]=tonumber(ba)
elseif cE=="M"then j.loadMode=(ba~=""and ba~="nil")and ba or nil elseif cE=="A"and j.dec then local n_=tonumber(cF)
local oa,fD,wT=ba:match("^([^|]+)|(%d+)|(.*)$")if n_ and oa then fD=tonumber(fD)local ob,fE={},0 for wU in(wT..";"):gmatch("([^;]*);")do
fE=fE+1 if fE<=fD then ob[fE]=j.dec(wU)end end j.loadSeq=j.loadSeq or{}j.loadSeq[n_]={m=oa,n=fD,args=ob}end elseif cE=="R"and j.dec then
local oc=tonumber(cF)local fF,wV,fG,wW=ba:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if oc and fF then fG=tonumber(fG)
local od,fH={},0 for wX in(wW..";"):gmatch("([^;]*);")do fH=fH+1 if fH<=fG then od[fH]=j.dec(wX)end end local iV={m=wV,n=fG,args=od}
if fF=="rules"then D.rec.rules[oc]=iV elseif fF=="on"then D.rec.on=iV elseif fF=="off"then D.rec.off=iV end end
elseif cE=="K"then local oe,of,wY=ba:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cF)]={name=cF,title=oe~=""and oe or nil,
rar=of~=""and of or nil,price=tonumber(wY)}elseif cE=="O"and ba~=""then local fI={}for wZ in ba:gmatch("[^,]+")do fI[#fI+1]=wZ end
if#fI>0 then aj.order[cF]=fI end end end end local function w0(fJ)if type(fJ)~="table"then return end local bZ,og=fJ.rarity,fJ.contents
if type(bZ)~="string"or bZ==""or type(og)~="table"then return end local dB={}for F5,fK in ipairs(og)do if type(fK)=="table"and type(fK.butter)=="string"then
dB[#dB+1]={n=fK.butter,ch=tonumber(fK.chance)or 0}end end if#dB==0 then return end table.sort(dB,function(w1,w2)return w1 .ch>w2 .ch end)
local dC,dD={},false for w3,w4 in ipairs(dB)do dC[w3]=w4 .n end local iW=aj.order[bZ]if not iW or#iW~=#dC then dD=true end
if not dD then for oh=1,#dC do if iW[oh]~=dC[oh]then dD=true break end end end aj.order[bZ]=dC local iX=tonumber(fJ.price)
if iX and aj.price[bZ]~=iX then aj.price[bZ]=iX dD=true end if dD then aj.dirty=true ad.at=0 A("learned the "..bZ.." order from its crate")
end end local function cG(w5,w6)local w7=w5:FindFirstChild(w6,true)local w8,iY=pcall(function()return w7 .Text end)
return(w8 and type(iY)=="string"and iY~="")and iY or nil end local function ak(oi)return ad.pretty[oi]or oi end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(w9)return fs(w9 or"")end
function L.learn(bc)if type(bc)~="table"or type(bc.name)~="string"then return end local iZ=L.key(bc.name)local bd=L.seen[iZ]or{}
local w_=(L.seen[iZ]==nil)or(tonumber(bc.price)and bd.price~=tonumber(bc.price))bd.name,bd.title=bc.name,bc.title or bd.title
bd.rar,bd.price=bc.rarity or bd.rar,tonumber(bc.price)or bd.price L.seen[iZ]=bd if w_ then L.at,aj.dirty=y(),true end
end function L.wanted(oj)if oj==nil then return false end local i0=L.key(oj)return e.CrateTicks[i0]==true or(e.BestCrate and o.bestCrate~=nil and(i0==o.bestCrate or i0==o.bestCrateTitle))
end function L.list()local cH={}for xa,fL in ipairs(L.base)do cH[L.key(fL[1])]={name=fL[1],title=fL[2],rar=fL[3],i=xa}end
for F6,dE in ipairs(ad.rarOrder)do local ol=false for F7,xb in pairs(cH)do if xb.rar==dE then ol=true break end end
if not ol and dE~="?"then local om=dE:gsub("[^%w]","").."Crate"cH[L.key(om)]={name=om,title=dE.." Crate",rar=dE,i=50,guess=true}
end end for oo,fM in pairs(L.seen)do local a3=cH[oo]or{i=100}a3 .name,a3 .title,a3 .rar=fM.name or a3 .name,fM.title or a3 .title,fM.rar or a3 .rar
a3 .price,a3 .guess=fM.price or a3 .price,nil cH[oo]=a3 end local dF,fN={},{}for xc,xd in ipairs(n4)do dF[xd]=xc end
for xe,op in ipairs(ad.rarOrder)do dF[op]=dF[op]or(20+xe)end for xf,dG in pairs(cH)do dG.k=xf dG.price=dG.price or aj.price[dG.rar or""]
fN[#fN+1]=dG end table.sort(fN,function(b0,b1)if b0 .price and b1 .price and b0 .price~=b1 .price then return b0 .price<b1 .price end
local oq,ot=dF[b0 .rar or""]or 99,dF[b1 .rar or""]or 99 if oq~=ot then return oq<ot end if(b0 .i or 100)~=(b1 .i or 100)then return(b0 .i or 100)<(b1 .i or 100)end
return b0 .k<b1 .k end)return fN end local function xg()local ou=af:FindFirstChild("Assets")local ov=ou and ou:FindFirstChild("Squishies")
if not ov then return false end local i1,ow,cI={},{},{}local fO=0 for F8,fP in ipairs(ov:GetChildren())do local dH=W(fP.Name)
if dH~=""and not i1[dH]then local fQ=cG(fP,"RarityText")or"?"i1[dH]=fQ ow[dH]=cG(fP,"NameText")or fP.Name cI[fQ]=cI[fQ]or{}
table.insert(cI[fQ],dH)fO=fO+1 end end if fO==0 then return false end for ox,xh in pairs(cI)do local oy=aj.order[ox]or wE[ox]
local i2={}if oy then for xi,xj in ipairs(oy)do i2[W(xj)]=xi end end table.sort(xh,function(oz,oA)local i3,i4=i2[oz],i2[oA]
if i3 and i4 then return i3<i4 end if i3 then return true end if i4 then return false end return ak(oz)<ak(oA)
end)end local i5={}for xk,xl in ipairs(n4)do i5[xl]=xk end local fR,b2={},{}for xm in pairs(cI)do fR[#fR+1]=xm end
pcall(function()for xn,xo in ipairs(require(af.Modules.SquishyRNG).Keys)do b2[xo]=xn end end)table.sort(fR,function(cJ,cK)
if b2[cJ]and b2[cK]and b2[cJ]~=b2[cK]then return b2[cJ]<b2[cK]end local i6,i7=aj.price[cJ],aj.price[cK]if i6 and i7 and i6~=i7 then return i6<i7 end
local i8,i9=i5[cJ],i5[cK]if i8 and i9 then return i8<i9 end if i8 then return true end if i9 then return false end
return cJ<cK end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=i1,ow,cI,fR,fO,y()return true end local function i_()
if ad.at==0 or(y()-ad.at)>120 then pcall(xg)end return ad.n>0 end local function xp(xq)local oB=W(xq)return ad.rar[oB]or(V.name and W(V.name)==oB and V.rar)or"?"
end local function xr()local fS={}local xs=((e.Best or 0)>0 and next(o.best or{}))and o.best or e.Targets for xt,xu in pairs(xs)do if xu then fS[#fS+1]=ak(xt)end end
table.sort(fS)return fS end local an={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function oC()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fT(oD)if type(makefolder)~="function"then return end local xv,xw=pcall(isfolder,oD)if not(xv and xw)then pcall(makefolder,oD)end
end local function fU(oE)if type(isfile)~="function"or type(readfile)~="function"then return nil end local xx,xy=pcall(isfile,oE)
if not(xx and xy)then return nil end local xz,xA=pcall(readfile,oE)return xz and xA or nil end local function dI(xC,xD)
if type(writefile)~="function"then return false end return(pcall(writefile,xC,xD))end local function oF(xE)local dJ={}
if type(listfiles)~="function"then return dJ end local xF,oG=pcall(listfiles,xE)if not xF or type(oG)~="table"then return dJ end
for F9,xG in ipairs(oG)do dJ[#dJ+1]=tostring(xG)end return dJ end local function oH()local fV={}for F_,xH in ipairs(oF(an.cfg))do
local oI=xH:match("([^/\\]+)%.txt$")if oI then fV[#fV+1]=oI end end table.sort(fV)return fV end local function xI()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(e.Every)aa[#aa+1]="N|GlazeLead|"..tostring(e.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(e.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(e.MemLimit)aa[#aa+1]="N|Best|"..tostring(e.Best or 0)for Ga,oJ in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..oJ.."|"..e[oJ]end
do local fW={}for xJ,dK in pairs(e.Pets)do local oK=(dK.b and"b"or"")..(dK.g and"g"or"")..(dK.w and"w"or"")..((tonumber(dK.f)or 0)>0 and tostring(dK.f)or"")
if oK~=""then fW[#fW+1]=xJ.."|"..oK end end table.sort(fW)aa[#aa+1]="P|-"for Gb,xK in ipairs(fW)do aa[#aa+1]="P|"..xK end
end for Gc,oL in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..oL.."|"..(e[oL]and"1"or"0")end local ja=J:GetAttribute("AutoRollRules")if type(ja)=="string"and ja~=""then e.ARrules,e.ARstop=ja,tostring(J:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then aa[#aa+1]="S|rules|"..e.ARrules aa[#aa+1]="S|stop|"..e.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Gd,jb in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local fX={}for xL,xM in pairs(jb[2])do if xM then fX[#fX+1]=xL end end table.sort(fX)aa[#aa+1]=jb[1].."|-"for Ge,xN in ipairs(fX)do aa[#aa+1]=jb[1].."|"..xN end
end return table.concat(aa,"\n")end local function xO(jc)if type(jc)~="string"or jc==""then return false end local oM,oN,oO,oP,dL={},false,{},false,nil
for xP in jc:gmatch("[^\n]+")do local aC,ah,ax=xP:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ah=="Every"then local jd=tonumber(ax)
if jd and jd>=1 then e.Every=math.floor(jd)end elseif aC=="N"and(ah=="FpsCap"or ah=="MemLimit")then local je=tonumber(ax)
if je and je>=0 then e[ah]=math.floor(je)end elseif aC=="N"and ah=="Best"then local fY=tonumber(ax)if fY and fY>=0 and fY<=4 then e.Best=math.floor(fY)end
elseif aC=="N"and ah=="GlazeLead"then local fZ=tonumber(ax)if fZ and fZ>=5 and fZ<=600 then e.GlazeLead=math.floor(fZ)end
elseif aC=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then e[ah]=ax elseif aC=="P"and ah~=""then
if not dL then dL={}end if ah~="-"and ax~=""then dL[ah]={b=ax:find("b",1,true)and true or nil,g=ax:find("g",1,true)and true or nil,
w=ax:find("w",1,true)and true or nil,f=tonumber(ax:match("%d"))}end elseif aC=="B"then if e[ah]~=nil then e[ah]=(ax=="1")end
elseif aC=="S"and ah=="rules"then e.ARrules=ax elseif aC=="S"and ah=="stop"then e.ARstop=ax elseif aC=="W"then
c.winPos={tonumber(ah)or 10,tonumber(ax)or 44}elseif aC=="G"then c.togPos={tonumber(ah)or 10,tonumber(ax)or 300}
elseif aC=="T"and ah~=""then if ah~="-"then oM[ah]=true end oN=true elseif aC=="K"and ah~=""then if ah~="-"then oO[ah]=true end
oP=true end end if oN then e.Targets=oM end if oP then e.CrateTicks=oO end if dL then e.Pets=dL end return true
end local function f0(cL)if not oC()then return false,"this executor cannot write files"end cL=(cL or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cL==""then return false,"give the config a name"end fT(an.dir)fT(an.cfg)if not dI(an.cfg.."/"..cL..".txt",xI())then return false,"could not write the file"end
c.config=cL return true,cL end local function oQ(f1)local oR=fU(an.cfg.."/"..f1 ..".txt")if not oR then return false,"no config called "..tostring(f1)end
if not xO(oR)then return false,"that config looks empty"end c.config=f1 return true,f1 end local function oS(jf)
if jf then fT(an.dir)dI(an.auto,jf)elseif type(delfile)=="function"then pcall(delfile,an.auto)else dI(an.auto,"")
end c.autoload=jf end local function xQ()if c.selfPath then return c.selfPath end local f2 for Gf,xR in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",an.dir})do
for Gg,oT in ipairs(oF(xR))do local jg=oT:lower()if jg:sub(-4)==".lua"and(jg:find("sab_farm",1,true)or jg:find("sab farm",1,true))then
f2=f2 or oT end end end c.selfPath=f2 return f2 end an.stub=[[
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
local function xS()if not oC()then return false,"this executor cannot write files"end fT("autoexec")if not dI(an.exec,an.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local f3=(function()local xT,xU=pcall(function()return game:GetService("TeleportService")end)return xT and xU or nil end)()
local function oU()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local xV=queueonteleport or queue_on_teleport return(pcall(xV,an.stub))end local function dM(xW)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..xW..")")pcall(fA)if c.autoload then pcall(f0,c.autoload)end local xX=oU()A(xX and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Gh=1,30 do if not f3 then break end pcall(function()f3:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function xY()local xZ,oV=pcall(function()return game:GetService("GuiService")end)if xZ and oV then
pcall(function()T(oV.ErrorMessageChanged:Connect(function()if e.Rejoin then dM("roblox error message")end end))
end)end pcall(function()local oW=game:GetService("CoreGui")local oX=oW and oW:WaitForChild("RobloxPromptGui",15)
local oY=oX and oX:WaitForChild("promptOverlay",15)if oY then T(oY.ChildAdded:Connect(function(x0)if e.Rejoin and tostring(x0 .Name):lower():find("errorprompt",1,true)then dM("disconnect prompt")end
end))end end)if f3 then pcall(function()T(f3 .TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()dM("teleport retry")end)end
end))end)end end local function oZ(x1)local o0=c.plot and c.plot:FindFirstChild(x1)if not o0 then return nil,false end
for Gi,jh in ipairs(o0:GetChildren())do if jh:IsA("Model")or jh:IsA("BasePart")then return jh,true end end return nil,true
end local function b3()local by=oZ("RolledSquishy")if not by then return nil end return{model=by,name=by.Name,pretty=cG(by,"NameText")or ak(W(by.Name)),
rar=cG(by,"RarityText")or xp(by.Name),price=cG(by,"PriceText")}end local function o1(ji)return type(ji)=="string"and(ad.rar[W(ji)]~=nil or wr(ji))
end local function ac()local jj=oZ("SquishyEquipped")if jj then c.carrySrc,j.heldAt="model",y()return jj.Name,jj end
local o2=J.Character if o2 then for Gj,dN in ipairs(o2:GetDescendants())do if(dN:IsA("Model")or dN:IsA("Tool"))and o1(dN.Name)then
c.carrySrc,j.heldAt="character",y()return dN.Name,dN end end end local f4=J:GetAttribute("SquishyEquipped")if type(f4)=="string"and f4~=""and o1(f4)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return f4,nil end c.carrySrc=nil end local function Gk()local Gl,x2=ac()return x2 end local function dO()
local o3=b3()local jk=o3 and wt(o3 .price)local jl=a_()if jk and jl and jl<jk*0.5 then return jl,jk end end local function b4(x3)
dv[#dv+1]=os.date("%H:%M:%S").." "..x3 if#dv>40 then table.remove(dv,1)end end local function x4(b5,f5)if type(b5)~="string"then return end
b4(("Roll(%s,%s)"):format(b5,tostring(f5)))if b5:lower():find("crate",1,true)then j.rolled,j.rolledAt=b5,y()return
end V.seq=V.seq+1 V.name,V.at=b5,y()V.rar=type(f5)=="string"and f5 or nil c.rolls=c.rolls+1 if aJ(b5)then A(("ROLL %s [%s] = TARGET"):format(b5,tostring(f5)))end
end local function x5(b6)if type(b6)~="table"then return end local f6=b6 .butter or b6 .itemName if type(f6)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=f6,y()if type(b6 .giftId)=="string"then local o4=af:FindFirstChild("Remotes")
local o5=o4 and o4:FindFirstChild("GiftThanks")if o5 then pcall(function()o5:FireServer(b6 .giftId)end)end end
b4("Gift("..f6 .." from "..tostring(b6 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b6 .fromName),f6))
end local function x6()local o6=af:WaitForChild("Remotes",30)if not c.alive then return end if not o6 then A("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local o7=J:GetAttribute("SquishyEquipped")
if type(o7)=="string"and o7~=""then j.heldAt=y()end end))local yb={SquishyRollAnimation=x4,InitSquishy=function(o8)V.init,V.initAt=tostring(o8),y()b4("Init("..tostring(o8)..")")end,
CrateUpdate=function(cM,o9)pcall(w0,cM)pcall(L.learn,cM)if type(cM)=="table"then local x7=o9==true or(j.rolled~=nil and y()-j.rolledAt<15)or j.waiting
if not x7 then return end local x8=not j.waiting local x9=j.on j.waiting,j.data,j.at=true,cM,y()j.on=(o9==true)
j.title=tostring(cM.title or cM.name or"crate")if j.on and not x9 then j.openedAt,j.byYou=y(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then b4("CrateWindow open("..j.title..")")elseif x8 then b4("Crate waiting("..j.title..")")A(j.title.." is waiting on your stand")
end else if j.waiting then b4("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local x_=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,x_)end if j.classify then local ya=y()
task.spawn(function()pcall(j.classify,ya)end)end end end,GiftReceived=x5,}for f7,yc in pairs(yb)do local jm=o6:FindFirstChild(f7)
if jm and jm:IsA("RemoteEvent")then T(jm.OnClientEvent:Connect(yc))elseif f7~="CrateUpdate"and f7~="GiftReceived"then A("remote "..f7 .." missing")end
end end local function jn()local b7=b3()if b7 then if aJ(b7 .name)then return{state="match",shown=b7 .pretty,src="pad",info=b7}
end return{state="skip",info=b7,level="idle",text=("on pad: %s [%s] - not ticked"):format(b7 .pretty,tostring(b7 .rar))}
end if V.name and(y()-V.at)<4 then if aJ(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f8(yd,ye,yf,yg)
local f9=RaycastParams.new()f9 .FilterType=Enum.RaycastFilterType.Exclude local jo={J.Character}for Gm,yh in ipairs(yg or{})do jo[#jo+1]=yh end
f9 .FilterDescendantsInstances=jo pcall(function()f9 .RespectCanCollide=true end)local o_=am:Raycast(Vector3 .new(yd,ye+4,yf),Vector3 .new(0,-30,0),f9)
return o_ and o_.Position or nil end local function cN(pa)local pb=pa:FindFirstChildOfClass("Humanoid")return((pb and pb.HipHeight)or 2)+pa.HumanoidRootPart.Size.Y/2+0.2
end local function jp(yi,yj)local jq=yi:FindFirstChildOfClass("Humanoid")local yk=y()while y()-yk<yj do if jq and(jq.FloorMaterial~=Enum.Material.Air or jq.SeatPart)then return true end
ag(0.05)end return false end local function aD(yl,jr,js)local pc=yl.HumanoidRootPart pc.AssemblyLinearVelocity=Vector3 .new(0,0,0)
pc.CFrame=js and CFrame.new(jr,Vector3 .new(js.X,jr.Y,js.Z))or CFrame.new(jr)end local function b8(be,pd)local b9=ap()
if not b9 or not be then return false end local bz=be.Position local f_=math.clamp(math.max(be.Size.X,be.Size.Z)/2+2.2,3,7)
local pe=(pd and pd.MaxActivationDistance)or 10 if f_>pe-2 then f_=math.max(2.5,pe-2)end local dP={}local function b_(dQ)
dQ=Vector3 .new(dQ.X,0,dQ.Z)if dQ.Magnitude>0.05 then dP[#dP+1]=dQ.Unit end end local pf=nR()if pf then b_(pf-bz)end
b_(be.CFrame.LookVector)b_(-be.CFrame.LookVector)b_(be.CFrame.RightVector)b_(-be.CFrame.RightVector)b_(b9 .HumanoidRootPart.Position-bz)
if#dP==0 then b_(Vector3 .new(0,0,1))end local ym,ga=cN(b9),false for Gn,yn in ipairs(dP)do local gb=bz+yn*f_
local jt=f8(gb.X,bz.Y,gb.Z,{be})if jt and math.abs(jt.Y-bz.Y)<14 then aD(b9,Vector3 .new(gb.X,jt.Y+ym,gb.Z),bz)
if jp(b9,0.7)then ga=true break end end end if not ga then aD(b9,bz+dP[1]*f_+Vector3 .new(0,3,0),bz)ga=jp(b9,1)
end ag(0.12)return ga end local function pg(dR)if not dR.Parent or not dR.Enabled then return false end pcall(function()dR:InputHoldBegin()end)
ag(math.max(dR.HoldDuration,0)+0.08)pcall(function()dR:InputHoldEnd()end)return true end local function aq(ph,yo)
local yp=y()while y()-yp<yo do if ph()then return true end ag(0.05)end return ph()end local function dS(cO,yq,pj,yr)
local ys=c.zapFirst and{"zap","hold"}or{"hold","zap"}for yt,ju in ipairs(ys)do if yt==2 and(yr or not(cO.Parent and cO.Enabled and(not pj or pj())))then break end
local jv if ju=="hold"then jv=pg(cO)else jv=type(fireproximityprompt)=="function"and cO.Parent~=nil and cO.Enabled and pcall(fireproximityprompt,cO)end
if jv and aq(yq,1.2)then c.zapFirst=(ju=="zap")return true,ju end end return false end local function pk(jw)local bA=n2()
if not bA or not bA.Enabled then A("buy: nothing on the pad")return false end local jx=dz(bA)if not jx then A("buy: pad part missing")return false end
c.lastBuyAt=y()local yu,pl=V.seq,a_()local pm=ap()local yv=pm and(pm.HumanoidRootPart.Position-jx.Position).Magnitude>12
b8(jx,bA)if yv then ag(0.4)end if not bA.Enabled then A("buy aborted: pad emptied")return false end local cP=jn()
if not jw and cP.state~="match"then A("buy aborted: "..(cP.text or"pad changed"))c.matchSince=nil return false
end local jy=cP.info and cP.info.name or(cP.state=="match"and V.name)or nil local function yw()return bA.Enabled and ac()==nil and(jw or jn().state=="match")
end local yx,yy=dS(bA,function()return ac()~=nil or((not bA.Enabled)and(jw or V.seq==yu))end,yw,dO()~=nil)if yx then
aq(function()return ac()~=nil end,0.8)local dT=ac()local pn=a_()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dT and ak(W(dT))or(cP.shown or"?"),(pl and pn)and(" for $"..aK(pl-pn))or"",yy))
if dT and jy and W(dT)~=W(jy)then A(("note: picked up %s, not %s"):format(dT,jy))end return true end local gc=b3()
if dO()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aK(a_()),(gc and gc.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(gc and gc.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function po()local dU=ac()if not dU then c.holding=false A("place: hands are empty")
return false end if not aJ(dU)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dU))))return false end
for Go=1,e.PlaceTries do local bB=wD()if not bB then A("place: no free station")break end local pp=dz(bB)if pp then
b8(pp,bB)local pq=ac()if not pq then c.holding=false A("place: hands emptied on the way")return false end if not aJ(pq)then A("place: what I carry changed, not waxing it")return false end
if bB.Enabled then local yz,yA=dS(bB,function()return not bB.Enabled end,function()return bB.Enabled end)if yz then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dU)),c.placed,bB.Parent.Parent.Name,yA))if o.placed then pcall(o.placed,dU)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))A(c.capMsg)end return false end function z.place()local yB=y()while c.alive and z.editing and y()-yB<25 do ag(0.2)end
if e.Teams and e.TeamWax~=""then z.placing=true local yC=y()while c.alive and z.current()~=e.TeamWax and y()-yC<5 do ag(0.1)end
if z.current()==e.TeamWax then ag(0.3)else A("wax team did not come on in time - placing anyway")end end local yD,ps=pcall(po)
z.placing=false if not yD then error(ps,0)end return ps end local function pt(pu)return type(pu)=="string"and pu:lower():find("crate",1,true)~=nil
end local yE={SABFarmGui=1,SABToggle=1,SABError=1}local function jz(yF)local bC=yF while bC do if yE[bC.Name]then return false end
if bC:IsA("ScreenGui")then local yG,yH=pcall(function()return bC.Enabled end)return(not yG)or yH~=false end if bC:IsA("GuiObject")and not bC.Visible then return false end
bC=bC.Parent end return false end local function gd(ge)local cQ=""pcall(function()if ge:IsA("TextButton")then cQ=ge.Text end end)
if not cQ:find("%a")then for Gp,gf in ipairs(ge:GetDescendants())do if(gf:IsA("TextLabel")or gf:IsA("TextButton"))and gf.Text:find("%a")then cQ=gf.Text break end
end end if not cQ:find("%a")then cQ=ge.Name end return(cQ:lower():gsub("[^%a]",""))end local function yI()local dV,dW
local pv=J:FindFirstChildOfClass("PlayerGui")if not pv then return nil,nil end for Gq,dX in ipairs(pv:GetDescendants())do
if dX:IsA("GuiButton")and jz(dX)then local jA=gd(dX)if jA:sub(1,4)=="open"and not jA:find("shop",1,true)then dV=dV or dX end
if jA:sub(1,7)=="discard"then dW=dW or dX end end end if dV and dW then return dV,dW end if j.on then return dV,dW end
return nil,nil end local jB=(function()local yJ,yK=pcall(function()return game:GetService("VirtualInputManager")end)return yJ and yK or nil end)()
local function pw(bf,jC)local jD={}local function px(yL)jD[#jD+1]=yL end if c.tapWay then px(c.tapWay)end for Gr,py in ipairs({"touch","conn","signal"})do
if py~=c.tapWay then px(py)end end local function pz(yM,...)local yN,jE=pcall(getconnections,yM)if not(yN and type(jE)=="table"and#jE>0)then return false end
local pA,yO,yP=false,{...},select("#",...)for Gs,yQ in ipairs(jE)do if pcall(function()yQ:Fire(table.unpack(yO,1,yP))end)then pA=true end
end return pA end local function pB()local pC=Vector3 .new(0,0,0)pcall(function()local pD,pE=bf.AbsolutePosition,bf.AbsoluteSize
pC=Vector3 .new(pD.X+pE.X/2,pD.Y+pE.Y/2,0)end)local jF={Position=pC,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jF.UserInputType=Enum.UserInputType.Touch end)pcall(function()jF.UserInputState=Enum.UserInputState.End end)
return jF end for Gt,bh in ipairs(jD)do local dY=false if bh=="conn"and type(getconnections)=="function"then if pz(bf.MouseButton1Click)then
dY=true if aq(jC,1.5)then c.tapWay=bh return true,bh end end dY=pz(bf.Activated,pB(),1)elseif bh=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bf.MouseButton1Click)then if aq(jC,1.5)then c.tapWay=bh return true,bh end end dY=pcall(firesignal,bf.Activated,pB(),1)
elseif bh=="touch"and jB then dY=pcall(function()local pF,pG=bf.AbsolutePosition,bf.AbsoluteSize local pH=0 local pI=bf:FindFirstAncestorWhichIsA("ScreenGui")
local yR,yS=pcall(function()return pI and pI.IgnoreGuiInset end)if not(yR and yS)then pcall(function()pH=game:GetService("GuiService"):GetGuiInset().Y end)
end local pJ,pK=pF.X+pG.X/2,pF.Y+pG.Y/2+pH jB:SendMouseButtonEvent(pJ,pK,0,true,game,1)task.wait(0.06)jB:SendMouseButtonEvent(pJ,pK,0,false,game,1)
end)end if dY and aq(jC,1.5)then c.tapWay=bh return true,bh end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jG(pL)local dZ=pL.Parent while dZ and dZ~=c.plot do if j.NOT[dZ.Name]then return false end dZ=dZ.Parent
end local jH=(pL.ActionText or""):lower()if jH:find("roll",1,true)or jH:find("place",1,true)or jH:find("sell",1,true)then return false end
return true end local function pM()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local pN=c.plot:FindFirstChild("CrateStand")local d0 if pN then for Gu,gg in ipairs(pN:GetDescendants())do
if gg:IsA("ProximityPrompt")and gg.Enabled and jG(gg)then d0=gg break end end end if not d0 then for Gv,bD in ipairs(c.plot:GetDescendants())do
if bD:IsA("ProximityPrompt")and bD.Enabled and jG(bD)then local pO=bD:FindFirstAncestorWhichIsA("Model")local yT=((bD.ActionText or"").." "..(bD.ObjectText or"").." "..bD.Name.." "..(pO and pO.Name or"")):lower()
if yT:find("crate",1,true)then d0=bD break end end end end j.prompt=d0 return d0 end local function jI()if j.on then return true end
local d1=pM()if not d1 then j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local pP=dz(d1)if pP then b8(pP,d1)end j.ours=true dS(d1,function()return j.on end)if aq(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=y()A("crate: pressed "..fu(d1).." but no window came up")
return false end do local function yU(pQ)local cR=pQ.Parent while cR and cR:IsA("GuiObject")do local pR,pS=false,false
for Gw,d2 in ipairs(cR:GetDescendants())do if d2~=pQ and d2:IsA("GuiButton")and gd(d2):sub(1,7)=="discard"then pR=true end
if d2:IsA("TextLabel")then local jJ=d2 .Text:lower()if jJ:find("crate",1,true)or jJ:find("can contain",1,true)or jJ:find("cost",1,true)then pS=true end
end if pR and pS then return cR end end cR=cR.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local pT=J:FindFirstChildOfClass("PlayerGui")if not pT then return nil end for Gx,gh in ipairs(pT:GetDescendants())do
if gh:IsA("GuiButton")and not gh:FindFirstAncestor("SABFarmGui")and gd(gh):sub(1,4)=="open"then local jK=yU(gh)
if jK then j.win=jK return jK end end end end local function yV(yW)for Gy,gi in ipairs(yW:GetDescendants())do
if gi:IsA("GuiButton")then local pU,jL=gd(gi),gi.Name:lower()if pU=="x"or pU=="close"or jL=="x"or jL:find("close",1,true)or jL:find("exit",1,true)then return gi end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(yX)task.wait(yX and 4 or 1.2)if j.on or j.waiting then return end
local gj=j.findWin()if not gj or not jz(gj)then return end local pV=yV(gj)if pV and pw(pV,function()return not jz(gj)end)then return end
A("the crate window is still open - tap its X")end end local function d3(gk)if not jI()then return false end local pW=y()-(j.openedAt or 0)
if pW<0.6 then ag(0.6-pW)end local jM=j.title local yY,yZ=yI()local pX=gk and yY or yZ if not pX then j.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(gk and"Open"or"Discard",jM))return false
end local y0=ac()local y1,Gz=pw(pX,function()return(not j.on)or(ac()~=nil and ac()~=y0)end)if not y1 then j.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(gk and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gk then c.crates=c.crates+1 aq(function()return ac()~=nil end,1.5)local pY=ac()
A(("OPENED %s -> %s"):format(jM,pY and ak(W(pY))or"?"))else A("discarded "..jM.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(y2,...)local y3=select("#",...)j.calls[#j.calls+1]={t=y(),m=y2,n=y3,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aE,bi)local bE=type(aE)if(bE=="string"or bE=="number")and type(bi.data)=="table"then for pZ,jN in pairs(bi.data)do
if jN==aE and type(pZ)=="string"and(type(jN)=="string"or type(jN)=="number")then return{__slot="f:"..pZ}end end
end if bE=="string"then if bi.crate and aE==bi.crate then return{__slot="crate"}end if bi.title and aE==bi.title then return{__slot="title"}end
if bi.rar and aE==bi.rar then return{__slot="rarity"}end return aE end if bE=="number"or bE=="boolean"or bE=="nil"then return aE end
if bE=="table"then local p0={}for y4,p1 in pairs(aE)do if type(p1)=="table"then return nil,"nested table"end local y5,p2=j.slot(p1,bi)
if p2 then return nil,p2 end p0[y4]=y5 end return p0 end local y6,y7=pcall(function()return aE:IsA("Instance")end)
if y6 and y7 then if aE==J then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gl=c.plot and c.plot:FindFirstChild("CrateStand")if gl and aE==gl then return{__slot="stand"}end if gl and aE.Parent==gl then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bE..")"end function j.resolve(gm)if type(gm)~="table"then return gm end
local aR=gm.__slot if aR and aR:sub(1,2)=="f:"then return j.data and j.data[aR:sub(3)]end if aR=="crate"then return j.data and j.data.name end
if aR=="title"then return(j.data and j.data.title)or j.title end if aR=="rarity"then return j.data and j.data.rarity end
if aR=="player"then return J end if aR=="plot"then return c.plot end if aR=="stand"or aR=="model"then local jO=c.plot and c.plot:FindFirstChild("CrateStand")
if aR=="stand"or not jO then return jO end for GA,p3 in ipairs(jO:GetChildren())do if pt(p3 .Name)then return p3 end end
return nil end local p4={}for y8,y9 in pairs(gm)do p4[y8]=j.resolve(y9)end return p4 end function j.classify(jP)
if j.directOff then return end local gn={}for GB,jQ in ipairs(j.calls)do if jQ.t<=jP+0.05 and jP-jQ.t<=6 then gn[#gn+1]=jQ end
end if#gn==0 then return end if not aq(function()return(j.heldAt or 0)>=jP-1 end,2.5)then return end local d4={}
for GC,d5 in ipairs(gn)do local p5={}for p6=1,d5 .n do local y_,p7=j.slot(d5 .args[p6],d5)if p7 then A("crate call has "..p7 .." - keeping the button method")
return end p5[p6]=y_ end d4[#d4+1]={m=d5 .m,n=d5 .n,args=p5}end local jR=j.learned j.learned={seq=d4,mode=jR and jR.mode or nil}
aj.dirty=true if not jR then A(("learned how to open crates directly (%d call%s)"):format(#d4,#d4==1 and""or"s"))end
end function j.replay()local p8=j.learned local p9=af:FindFirstChild("Remotes")local jS=p9 and p9:FindFirstChild("CrateAction")
if not(p8 and jS)then return false end local p_=table.unpack or unpack j.replaying=true for GD,d6 in ipairs(p8 .seq)do
local jT={}for qa=1,d6 .n do jT[qa]=j.resolve(d6 .args[qa])end task.spawn(function()pcall(function()if d6 .m=="InvokeServer"then jS:InvokeServer(p_(jT,1,d6 .n))
else jS:FireServer(p_(jT,1,d6 .n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(za)return(za:gsub("[%%|;=,\n]",function(zb)return("%%%02X"):format(zb:byte())end))end
function j.enc(ca)local go=type(ca)if go=="string"then return"s"..j.esc(ca)end if go=="number"then return"n"..tostring(ca)end
if go=="boolean"then return ca and"b1"or"b0"end if go=="nil"then return"z"end if ca.__slot then return"k"..ca.__slot end
local jU={}for zc,zd in pairs(ca)do jU[#jU+1]=j.enc(zc).."="..j.enc(zd)end return"t"..table.concat(jU,",")end
function j.dec(qb)local d7,d8=qb:sub(1,1),qb:sub(2)local function ze(zf)return(zf:gsub("%%(%x%x)",function(zg)return string.char(tonumber(zg,16))end))end
if d7=="s"then return ze(d8)end if d7=="n"then return tonumber(d8)end if d7=="b"then return d8=="1"end if d7=="k"then return{__slot=d8}end
if d7=="t"then local qc={}for zh in d8:gmatch("[^,]+")do local qe,zi=zh:match("^(.-)=(.*)$")if qe then local qf=j.dec(qe)
if qf~=nil then qc[qf]=j.dec(zi)end end end return qc end return nil end function j.goneOrNew(zj)return function()
if not j.waiting then return true end local qg=ac()return qg~=nil and qg~=zj end end function j.near()local qh=af:FindFirstChild("Remotes")
local jV=qh and qh:FindFirstChild("CrateAction")local gp=ap()local jW=c.plot and c.plot:FindFirstChild("CrateStand")
local jX=jW and jW:FindFirstChild("Spot")if not(jV and gp and jX)then A(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not jV and"no CrateAction remote"or not gp and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jY=gp.HumanoidRootPart local gq=jY.CFrame local qi,jZ=j.title,"no answer"local zk=ac()local qj=jW:FindFirstChild("Holder")
local function qk()if not qj then return j.waiting or j.on end for GE,zl in ipairs(qj:GetChildren())do if zl:IsA("Model")then return true end end
return false end for zm=1,3 do if not(j.waiting or j.on)or not qk()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end if(jY.Position-jX.Position).Magnitude>8 then b8(jX,j.prompt)end ag(0.12+0.15*zm)
local a4={}j.replaying=true task.spawn(function()a4 .ok,a4 .v=pcall(function()return jV:InvokeServer("open")end)
a4 .done=true end)aq(function()return a4 .done end,6)j.replaying=false local cb=a4 .v if a4 .done and a4 .ok and type(cb)=="table"and cb.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(qi,cb.prize and ak(W(tostring(cb.prize)))or"?"))
aq(function()local ql=ac()return ql~=nil and ql~=zk end,1.5)if(jY.Position-gq.Position).Magnitude>8 then pcall(function()aD(gp,gq.Position,gq.Position+gq.LookVector)end)end
return true,"opened"end jZ=(a4 .done and a4 .ok and type(cb)=="table")and tostring(cb.reason or"refused, no reason given")
or(a4 .done and("error: "..tostring(cb))or"no answer in 6s")ag(0.3)if not qk()then j.waiting,j.on,j.quietUntil=false,false,y()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(qi,jZ))
return false,jZ end j.GIVEUP=600 function j.drop()local qm=af:FindFirstChild("Remotes")local qo=qm and qm:FindFirstChild("CrateAction")
local qp=c.plot and c.plot:FindFirstChild("CrateStand")local j0=qp and qp:FindFirstChild("Spot")local qq=ap()
if j0 and qq and(qq.HumanoidRootPart.Position-j0 .Position).Magnitude>8 then b8(j0,j.prompt)ag(0.3)end local j1,bj=false,nil
if qo then j1,bj=pcall(function()return qo:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(j1 and type(bj)=="table"and bj.ok)and"done"or("answer: "..tostring(type(bj)=="table"and(bj.reason or bj.ok)or bj))))
j.waiting,j.on,j.quietUntil=false,false,y()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(j1 and type(bj)=="table"and bj.ok)then d3(false)end end function j.smart()local j2=j.title if(j.nearFails or 0)<3 then
local zn=j.near()if zn then return true end if j.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local cc=j.learned if cc then local j3=ac()if j.on then j.replay()if aq(j.goneOrNew(j3),3.5)then c.crates=c.crates+1
A("OPENED "..j2 .." (direct)")return true end else if cc.mode~="window"then j.replay()if aq(j.goneOrNew(j3),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="direct"then cc.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..j2 .." (direct, no window)")return true end end if jI()then j.replay()if aq(j.goneOrNew(j3),3.5)then
c.crates,j.fails=c.crates+1,0 if cc.mode~="window"then cc.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..j2 .." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,aj.dirty=cc,nil,true
if j.fails>=3 then j.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return d3(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for zo,qr in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(qr):Connect(function()D.cache[zo]=J:GetAttribute(qr)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(zp,...)local gr=D.cache
local zq={m=zp,n=select("#",...),args={...},before={rules=gr.rules,stop=gr.stop,on=gr.on,main=gr.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,zq)end end)end function D.learnOne(d9)local ay,d_=D.snap(),d9 .before local gs=(ay.rules~=d_.rules)or(ay.stop~=d_.stop)
local qs=(ay.on~=d_.on)or(ay.main~=d_.main)if not gs and not qs then return end local qt={}for qu=1,d9 .n do local aL=d9 .args[qu]
local cd=type(aL)if cd=="string"and aL~=""and aL==ay.rules then aL={__slot="rules"}elseif cd=="string"and aL~=""and gs and aL==ay.stop and ay.stop~=d_.stop then aL={__slot="stop"}
elseif cd=="table"then local qv={}for zr,cS in pairs(aL)do if type(cS)=="table"or(type(cS)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end qv[zr]=(type(cS)=="string"and cS~=""and cS==ay.rules)and{__slot="rules"}or cS end aL=qv elseif cd~="string"and cd~="number"and cd~="boolean"and cd~="nil"then
if aL==J then aL={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end qt[qu]=aL
end local cT={m=d9 .m,n=d9 .n,args=qt}if gs then local j4=false for zs=1,cT.n do local ea=cT.args[zs]if type(ea)=="table"and ea.__slot=="rules"then j4=true end
if type(ea)=="table"and not ea.__slot then for GF,qw in pairs(ea)do if type(qw)=="table"and qw.__slot=="rules"then j4=true end end
end end if j4 then D.rec.rules={cT}else table.insert(D.rec.rules,cT)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if qs then if ay.on==true then D.rec.on=cT else D.rec.off=cT end e.AutoRoll=(ay.on==true)end if ay.rules and ay.rules~=""then e.ARrules,e.ARstop=ay.rules,ay.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gs and"choices"or(ay.on and"on"or"off")))end
function D.resolve(cU)if type(cU)~="table"then return cU end if cU.__slot=="rules"then return e.ARrules~=""and e.ARrules or J:GetAttribute("AutoRollRules")end
if cU.__slot=="stop"then return e.ARstop~=""and e.ARstop or J:GetAttribute("AutoRollStop")end if cU.__slot=="player"then return J end
local qx={}for zt,zu in pairs(cU)do qx[zt]=D.resolve(zu)end return qx end function D.replay(qy,zv)local qz=table.unpack or unpack
for GG,eb in ipairs(zv)do local j5={}for qA=1,eb.n do j5[qA]=D.resolve(eb.args[qA])end D.replaying=true pcall(function()
if eb.m=="InvokeServer"then task.spawn(function()pcall(function()qy:InvokeServer(qz(j5,1,eb.n))end)end)else qy:FireServer(qz(j5,1,eb.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(qB,zw)if D.busy or not c.alive then return end D.busy=true
pcall(function()local qC=af:FindFirstChild("Remotes")local j6=qC and qC:FindFirstChild("AutoRollAction")if not j6 then D.msg="this game has no AutoRollAction"return end
local bF=e.AutoRoll if bF and e.ARrules~=""and J:GetAttribute("AutoRollRules")~=e.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(j6,D.rec.rules)
if aq(function()return J:GetAttribute("AutoRollRules")==e.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bF==D.isOn()or(not bF and not zw)then return end
local gt=bF and D.rec.on or D.rec.off if not gt then local ec=bF and D.rec.off or D.rec.on local qD=ec~=nil for zx=1,ec and ec.n or 0 do
if type(ec.args[zx])=="boolean"then qD=false end end if qD then gt=ec end end if not gt then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bF and"on"or"off")
A(D.msg)return end D.replay(j6,{gt})if aq(function()return D.isOn()==bF end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bF and"ON"or"OFF",qB and(" ("..qB..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local zy,zz=pcall(function()return J.UserId end)return zy and zz or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local zA,j7=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if zA and type(j7)=="table"and type(j7 .Pets)=="table"then q.I=j7 end return q.I end function q.order()if q.list then return q.list end
local bG=q.info()if not bG then return{}end local ce={}if type(bG.Order)=="table"and#bG.Order>0 then for GH,qE in ipairs(bG.Order)do if bG.Pets[qE]then ce[#ce+1]=qE end end
else for zB in pairs(bG.Pets)do ce[#ce+1]=zB end table.sort(ce,function(zC,zD)return(bG.Pets[zC].price or 0)<(bG.Pets[zD].price or 0)end)
end q.list=ce return ce end function q.nice(qF,j8)local qG=q.info()local qH=qG and qG.Pets[qF]return((j8 and j8~="")and(j8 .." ")or"")..(qH and qH.displayName or tostring(qF))
end function q.data()local gu=J:GetAttribute("PetsData")if type(gu)~="string"then return nil end if gu==q.rawD then return q.lastD end
local zE,ed=pcall(function()return q.HS:JSONDecode(gu)end)ed=(zE and type(ed)=="table")and ed or nil q.rawD,q.lastD=gu,ed
return ed end function q.pen()return af:FindFirstChild("PetMeadowSpawns")end function q.srv()return am:GetServerTimeNow()end
function q.money()local j9=J:FindFirstChild("MoneyValue")if j9 and type(j9 .Value)=="number"then return j9 .Value end
return a_()or 0 end function q.wishes()local qI=q.pen()local qJ=qI and qI:GetAttribute("Wishes")local j_,qK={},q.srv()
if type(qJ)~="string"then return j_ end local zF,qL=pcall(function()return q.HS:JSONDecode(qJ)end)if zF and type(qL)=="table"then
for zG,ka in pairs(qL)do if type(ka)=="number"and ka>qK then j_[zG]=ka-qK end end end return j_ end function q.call(...)
local qM=af:FindFirstChild("Remotes")local qN=qM and qM:FindFirstChild("PetRequest")if not qN then return nil end
local qO=table.pack(...)local cf={}task.spawn(function()cf.ok,cf.v=pcall(function()return qN:InvokeServer(table.unpack(qO,1,qO.n))end)
cf.done=true end)local zH=y()while not cf.done and y()-zH<6 do task.wait(0.05)end if cf.done and cf.ok then return cf.v end
return nil end function q.want(zI)return e.Pets[zI]end function q.closeNaming(kb)local qQ=pcall(function()local qP=J:FindFirstChild("PlayerScripts")
local zJ=qP and qP:FindFirstChild("Naming",true)require(zJ).close()end)ag(0.5)if kb.Visible then pcall(function()local qR=kb:FindFirstChild("NameBox",true)if qR then qR:ReleaseFocus()end end)
kb.Visible=false qQ=false end return qQ end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qS=J:FindFirstChildOfClass("PlayerGui")
local qT=qS and qS:FindFirstChild("MainGui")local gv=qT and qT:FindFirstChild("PetNameGui")if gv and gv.Visible then
ag(0.4)if gv.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gv)break end end ag(0.25)end
q.namingOn=false end)end function q.buyTick()if not e.PetBuy then q.buyMsg="auto adopt is off"return end local kc,qU,gw=q.info(),q.pen(),q.data()
if not(kc and qU and gw)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local ee,kd=#(gw.pets or{}),tonumber(gw.maxOwned)or 60
local zK,qV,ef=q.srv(),{},nil for GI,aS in ipairs(qU:GetChildren())do qV[aS.Name]=true local cg,gx=aS:GetAttribute("Pet"),aS:GetAttribute("Variant")or""
local ke=cg and q.want(cg)if ke and ke.b and kc.Pets[cg]and(not ke.g or gx=="Big")and C.wantMore(cg,gx,gw)and not aS:GetAttribute("A_"..q.uid)
and(tonumber(aS:GetAttribute("ExpiresAt"))or 0)>zK+1 and y()>=(q.tryAt[aS.Name]or 0)then local eg,qW=q.nice(cg,gx),kc.Pets[cg].price or 0
if ee>=kd then ef=("%s is in the pen, but you have %d/%d pets"):format(eg,ee,kd)q.tryAt[aS.Name]=y()+15 elseif q.money()<qW then
ef=("%s is in the pen - need $%s"):format(eg,aK(qW))q.tryAt[aS.Name]=y()+5 else q.tryAt[aS.Name]=y()+8 local bH=q.call("adopt",aS.Name)
if type(bH)=="table"and bH.ok then ee=ee+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local zL=type(bH.pet)=="table"and bH.pet or{}
table.insert(q.recent,{id=tostring(zL.id or("?"..y())),name=cg,variant=gx,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..eg)q.skipNaming()ef="adopted "..eg else local qX=type(bH)=="table"and tostring(bH.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(eg,qX))ef="adopt failed: "..qX if type(bH)=="table"and bH.bagFull then q.tryAt[aS.Name]=y()+60 end
end end end end for qY in pairs(q.tryAt)do if not qV[qY]then q.tryAt[qY]=nil end end q.buyMsg=ef or("watching the pen (%d/%d pets)"):format(ee,kd)
end function q.wishTick()if not e.PetWish then q.wishMsg="auto wish is off"return end local gy=q.info()if not(gy and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local cj,kf,bI=q.wishes(),0,nil local zM=(type(gy.Wish)=="table"and gy.Wish.cashShare)or 2
local zN=q.data()for GJ,aA in ipairs(q.order())do local qZ=q.want(aA)if qZ and qZ.w and C.wantMore(aA,"",zN)then
kf=kf+1 if not cj[aA]and y()>=(q.wishTry[aA]or 0)then local kg=tonumber(J:GetAttribute("PetWishCredits"))or 0
local kh=math.floor((gy.Pets[aA].price or 0)*zM)if kg<=0 and q.money()<kh then q.wishTry[aA]=y()+10 bI=("need $%s to wish for %s"):format(aK(kh),q.nice(aA))
q.wishWhy[aA]=bI else q.wishTry[aA]=y()+3 local zO=kg>0 and"wishCredit"or"wish"local gz=q.call(zO,aA)if type(gz)=="table"and gz.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),kg>0 and"free wish"or("$"..aK(kh))))
else local ki=type(gz)=="table"and tostring(gz.reason or"no reason given")or"no answer"if ki:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),ki))bI="wish failed: "..ki end end end end end end if not bI then
for GK,gA in ipairs(q.order())do local q0=q.want(gA)if q0 and q0 .w and not cj[gA]and q.wishWhy[gA]then bI=q.wishWhy[gA]break end
end end if not bI then local cV={}for GL,gB in ipairs(q.order())do local q1=q.want(gB)if q1 and q1 .w and cj[gB]then cV[#cV+1]=("%s %dm"):format(q.nice(gB),math.ceil(cj[gB]/60))end
end local gC for GM,gD in ipairs(q.order())do local q2=q.want(gD)if q2 and q2 .w and cj[gD]and(not gC or cj[gD]<gC)then gC=cj[gD]end
end bI=kf==0 and"no pet has WISH ticked"or(#cV==0 and"running: none yet")or(#cV<=3 and("running: "..table.concat(cV,", ")))
or("%d running, the next one ends in %dm"):format(#cV,math.ceil((gC or 0)/60))end q.wishMsg=bI end z.switches,z.glazed,z.finished=0,0,0
z.done,z.doneN,z.later={},0,{}function z.teams()local kj=q.data()return(kj and kj.teams)or{},kj end function z.current(cW)
cW=cW or q.data()if not cW then return""end local q3={}for GN,zP in ipairs(cW.equipped or{})do q3[tostring(zP)]=true end
for GO,q4 in ipairs(cW.teams or{})do local q5=q4 .pets or{}local kk=#q5==#(cW.equipped or{})if kk then for GP,zQ in ipairs(q5)do if not q3[tostring(zQ)]then kk=false break end end end
if kk then return q4 .name end end return""end function z.equip(kl)local zR,zS=z.teams()local km for zT,zU in ipairs(zR)do if zU.name==kl then km=zT break end end
if not km then z.msg="no saved team called "..tostring(kl)return false end if z.current(zS)==kl then return true end
for GQ=1,4 do local q6=q.call("teamEquip",km)if type(q6)=="table"and q6 .ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(zV)local q7=zV:FindFirstChild("SquishyPlaceHolder")local q8=q7 and q7:FindFirstChild("TimerGui")
local q9=q8 and q8:FindFirstChildWhichIsA("TextLabel",true)local kn=q9 and q9 .Text if type(kn)~="string"or kn:find("-",1,true)then return nil end
local ko,q_,ra=kn:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not ko then return nil end local rb=ra~=""and(tonumber(ko)*3600+tonumber(q_)*60+tonumber(ra))or(tonumber(ko)*60+tonumber(q_))
return rb>0 and rb or nil end function z.waxes()local eh={}local rc=c.plot and c.plot:FindFirstChild("WaxStations")
if not rc then return eh end local rd=q.srv()for GR,a5 in ipairs(rc:GetChildren())do local kp=tonumber(a5:GetAttribute("PourEnd"))
local rf=a5:GetAttribute("PourOwner")if a5:GetAttribute("HasSquishy")and a5:GetAttribute("PourId")and(rf==nil or rf==q.uid)then
local kq=z.left(a5)local rg=kq and(rd+kq)or((kp and kp>rd)and kp or nil)if rg then local rh,ri=a5:FindFirstChild("SquishyPlaceHolder"),"?"
if rh then for GS,rj in ipairs(rh:GetChildren())do if rj:IsA("Model")then ri=rj.Name break end end end local zW=tostring(a5:GetAttribute("Helpers")or"")
local kr=0 for GT in zW:gmatch("%d+")do kr=kr+1 end eh[#eh+1]={st=a5,ends=rg,sure=kq~=nil,id=a5:GetAttribute("PourId"),name=ri,helps=kr,
long=a5:GetAttribute("PourLong")==true}end end end table.sort(eh,function(zX,zY)return zX.ends<zY.ends end)return eh
end function z.glazeCount()local rk=af:FindFirstChild("Remotes")local rl=rk and rk:FindFirstChild("EditStack")
if not rl then return nil end local zZ,ei=pcall(function()return rl:InvokeServer("State",nil)end)if not(zZ and type(ei)=="table"and type(ei.state)=="table")then return nil end
local ks,kt=0,{}for GU,gE in ipairs(ei.state.entries or{})do if gE.glaze and gE.glaze~=""then ks=ks+1 kt[gE.glaze]=(kt[gE.glaze]or 0)+1 end
end return ks,kt,#(ei.state.entries or{}),ei.state.capacity end function z.finishedOne(gF,rm)z.finished=z.finished+1
task.wait(2)local ku,z0,rn,z1=z.glazeCount()if ku and rm and ku>rm then z.glazed=z.glazed+1 local kv={}for z2,z3 in pairs(z0)do kv[#kv+1]=z2 .." "..z3 end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gF.name)),gF.st.Name,ku,table.concat(kv,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gF.st.Name,ak(W(gF.name)),rn and(" (stack "..rn.."/"..tostring(z1)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not e.Teams then z.want,z.msg="","auto teams is off"return end
local ck=q.srv()local aF=z.glazeFor if aF then local ej=aF.st local ro=ej.Parent and ej:GetAttribute("HasSquishy")and ej:GetAttribute("PourId")==aF.id
local rp=ro and z.left(ej)if rp then aF.ends=ck+rp end if not ro then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local z4=aF.before
task.spawn(function()pcall(z.finishedOne,aF,z4)end)end elseif aF.ends-ck>e.GlazeLead*3+60 or ck>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(ej.Name,z.clock(aF.ends-ck)))
end end if e.TeamGlaze~=""and not z.glazeFor then local z5=z.speedRatio(e.TeamGlaze)for GV,cl in ipairs(z.list)do
if cl.sure and(cl.ends-ck)*z5[cl.long and 2 or 1]<=e.GlazeLead and y()>=(z.later[cl.id or"?"]or 0)and not z.done[cl.id or"?"]then
z.glazeFor=cl task.spawn(function()cl.before=z.glazeCount()end)break end end end local aG,ek="",""local cX=e.SnapGlaze~=false and o.snapAt and(o.snapAt-ck)
if cX and cX<-8 then o.snapAt,cX=nil,nil end if e.TeamGlaze~=""and cX and cX<=20 then aG,ek=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cX)))
elseif e.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ek=e.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ek=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and z.allBusy()then
aG,ek=e.TeamFull," - every station is busy"else aG=e.TeamNormal end z.want=aG local el=z.current()z.cur=el if aG~=""and el~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ek)else z.nextTry=y()+3 end end local kw=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(el~=""and el or"(not a saved team)",(aG~=""and aG~=el)and(" -> "..aG)or"",
kw and("in "..z.clock(kw.ends-ck).." (st "..kw.st.Name..")")or"- none running")end function z.clock(bJ)bJ=math.max(0,math.floor(bJ))
if bJ>=3600 then return("%d:%02d:%02d"):format(math.floor(bJ/3600),math.floor((bJ%3600)/60),bJ%60)end return("%d:%02d"):format(math.floor(bJ/60),bJ%60)
end function z.allBusy()local z6,z7=fw()return z7>0 and z6==0 end function z.aboutToPlace()if not c.running then return false end
local rq=ac()if not(rq and aJ(rq))then return false end local z8=fw()return z8>0 end function z.mult(rr,z9,rs)return{(1+rr)*(1+rs),(1+rr+z9)*(1+rs)}end
function z.speedNow()local function kx(z_)return tonumber(J:GetAttribute(z_))or 0 end return z.mult(kx("PetWaxSpeed"),kx("PetLongWax"),kx("PetSocialWax"))
end function z.speedOf(Aa)local Ab,rt=z.teams()if not rt then return nil end for GW,ru in ipairs(Ab)do if ru.name==Aa then
local ky={}for GX,Ac in ipairs(ru.pets or{})do for GY,rv in ipairs(rt.pets or{})do if tostring(rv.id)==tostring(Ac)then ky[#ky+1]=rv break end end
end local rw=C.caps()local rx,Ad=C.stats(ky)return z.mult(math.min(rx.waxSpeed or 0,rw.waxSpeed or 0.25),math.min(rx.longWax or 0,rw.longWax or 0.3),Ad.socialWax or 0)
end end return nil end function z.speedRatio(Ae)local ry,kz=z.speedNow(),z.speedOf(Ae)if not kz then return{1,1}end
return{ry[1]/kz[1],ry[2]/kz[2]}end function z.glazeSoon()return e.Teams and e.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local kA=q.info()return(kA and type(kA.Caps)=="table")and kA.Caps or C.CAPS
end function C.value(rz,kB)local gG=q.info()local cY=gG and gG.Pets[rz]if not(cY and type(cY.boost)=="table")then return nil end
local cm if type(gG.boostValue)=="function"then local Af,Ag=pcall(gG.boostValue,rz,(kB~=""and kB)or nil)cm=Af and tonumber(Ag)or nil
end if not cm then cm=cY.boost.value or 0 if kB=="Big"then local rA=cm*1.5 cm=C.ROUND[cY.boost.kind]and math.max(cm+1,math.floor(rA+0.5))or rA
end end return cY.boost.kind,cm,cY.boost.every end function C.stats(Ah)local cn,kC={},{}for GZ,rB in ipairs(Ah)do
local aT,gH,rC=C.value(rB.name,rB.variant or"")if aT then if aT:sub(1,6)=="social"then kC[aT]=math.max(kC[aT]or 0,gH)
elseif aT=="waxStir"or aT=="cashGift"then cn[aT]=(cn[aT]or 0)+gH*60/(rC or 60)elseif aT=="luckyPull"then cn.luckyPull=(cn.luckyPull or 0)+gH/(rC or 10)
else cn[aT]=(cn[aT]or 0)+gH end end end return cn,kC end function C.glazeGain(Ai,gI)local em,kD,G0={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local Aj=em[1]+em[2]+em[3]local Ak=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cZ={}for gJ=1,3 do cZ[gJ]=em[gJ]+Ai*em[gJ]/Aj+(gJ==1 and Ak or 0)end
local kE={cZ[1]*(1-gI),cZ[2]*(1-gI)+cZ[1]*gI,cZ[3]+cZ[2]*gI}return kE[1]*(kD[1]-1)+kE[2]*(kD[2]-1)+kE[3]*(kD[3]-1)
end function C.score(gK,Al)local kF=C.caps()local gL,gM=C.stats(Al)local function bk(rD)return math.min(gL[rD]or 0,kF[rD]or math.huge)end
local Am=(1+bk("income"))*(1+(gM.socialIncome or 0))*(1+math.min(gL.cashGift or 0,kF.cashGiftPerMinute or 9)/60)
local An=1+bk("luck")+(gL.luckyPull or 0)+(gM.socialLuck or 0)local rE=An*(1+bk("newFind"))*(1+bk("rollSpeed"))
local en=math.log(Am)local Ao=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local kG=(1+bk("waxSpeed")+bk("longWax"))*(1+(gM.socialWax or 0))
+math.min(gL.waxStir or 0,kF.waxStirPerMinute or 30)/60/Ao local Ap=1-(1-bk("headStart"))*(1-(gM.socialHeadStart or 0))
if gK=="farm"then return en+0.7*math.log(rE)+0.1*math.log(kG)end if gK=="full"then return en+0.4*math.log(kG)+0.02*math.log(rE)end
if gK=="glaze"then return C.glazeGain(bk("glaze"),bk("glazeUp"))+0.001*en end if gK=="wax"then return-math.log(1-0.5*Ap)+0.001*en+0.001*math.log(kG)end
return en end function C.best(rF,c0,Aq,kH)kH=kH or{}local az,eo={},{}local function rG(Ar)local rH={}for As,At in ipairs(Ar)do rH[As]=c0[At]end return rH end
local function kI(rI)local kJ=C.score(rF,rG(rI))for G1,Au in ipairs(rI)do if kH[c0[Au].id]then kJ=kJ+1e-7 end end
return kJ end for G2=1,math.min(Aq,#c0)do local gN,kK for kL=1,#c0 do if not eo[kL]then az[#az+1]=kL local rJ=kI(az)
az[#az]=nil if not kK or rJ>kK+1e-12 then gN,kK=kL,rJ end end end if not gN then break end eo[gN]=true az[#az+1]=gN
end for G3=1,6 do task.wait()local rK,rL=false,kI(az)for kM=1,#az do for kN=1,#c0 do if not eo[kN]then local rM=az[kM]
az[kM]=kN local rN=kI(az)if rN>rL+1e-9 then eo[rM],eo[kN],rL,rK=nil,true,rN,true else az[kM]=rM end end end end
if not rK then break end end local rO={}for Av,Aw in ipairs(az)do rO[Av]=tostring(c0[Aw].id)end return rO,C.score(rF,rG(az))
end function C.count(rP,rQ,Ax)local ep,eq={},0 local rR,rS={},{}for G4,Ay in ipairs(rQ.arriving or{})do rR[tostring(Ay)]=true end
for G5,c1 in ipairs(rQ.pets or{})do rS[tostring(c1 .id)]=true if c1 .name==rP and not rR[tostring(c1 .id)]then
if c1 .variant=="Big"then eq=eq+1 elseif(c1 .variant or"")==""then ep[#ep+1]=c1 end end end if not Ax then for G6,er in ipairs(q.recent or{})do
if er.name==rP and not rS[er.id]and y()-er.at<20 then if er.variant=="Big"then eq=eq+1 else ep[#ep+1]=er end end
end end return ep,eq end function C.goal(Az)local rT=e.Pets[Az]return rT and tonumber(rT.f)or 0 end function C.wantMore(rU,AA,rV)
local kO=C.goal(rU)if kO<=0 or not rV then return true end local AB,rW=C.count(rU,rV)if rW>=kO then return false end
if AA=="Big"then return true end return#AB<C.need()*(kO-rW)end function C.status(rX,rY)local gO=C.goal(rX)if gO<=0 or not rY then return nil end
local AC,kP=C.count(rX,rY)if kP>=gO then return("Big %d/%d done"):format(kP,gO)end return("%d/%d to fuse, Big %d/%d"):format(math.min(#AC,C.need()),C.need(),kP,gO)
end function C.wear(kQ)local kR={}for G7,AD in ipairs(kQ)do kR[tostring(AD)]=true end for G8=1,3 do local c2=q.data()
if not c2 then return false end for G9,rZ in ipairs(c2 .equipped or{})do if not kR[tostring(rZ)]then q.call("unequip",rZ)task.wait(0.3)end
end c2=q.data()local r0={}for G_,AE in ipairs(c2 .equipped or{})do r0[tostring(AE)]=true end for Ha,r1 in ipairs(kQ)do
if not r0[tostring(r1)]then q.call("equip",r1)task.wait(0.3)end end task.wait(0.4)c2=q.data()local kS,r2=0,true
for Hb,AF in ipairs(c2 .equipped or{})do kS=kS+1 if not kR[tostring(AF)]then r2=false end end if r2 and kS==#kQ then return true end
end return false end function C.saveTeam(r3,r4)if not C.wear(r4)then return false,"could not put the pets on"end
local AG=z.teams()local co for AH,AI in ipairs(AG)do if AI.name==r3 then co=AH break end end local c3 if co then
c3=q.call("teamSave",co)else c3=q.call("teamNew")if type(c3)=="table"and c3 .ok and c3 .index then co=c3 .index
task.wait(0.3)q.call("teamRename",{index=co,name=r3})end end task.wait(0.4)local kT=q.data()local r5=kT and kT.teams and co and kT.teams[co]
if not r5 then return false,"the game did not save it"end local r6={}for Hc,AJ in ipairs(r5 .pets or{})do r6[tostring(AJ)]=true end
for Hd,AK in ipairs(r4)do if not r6[tostring(AK)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local AL=q.srv()for He,AM in ipairs(z.list or{})do if AM.ends-AL<(e.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local es=q.data()if not es then return{}end local r7={}for Hf,AN in ipairs(es.arriving or{})do r7[tostring(AN)]=true end
local et={}for Hg,gP in ipairs(es.pets or{})do if not r7[tostring(gP.id)]then et[#et+1]={id=tostring(gP.id),name=gP.name,variant=gP.variant or""}end
end local r8={}for Hh,r9 in ipairs(et)do r8[r9 .id]=r9 end local r_=tonumber(es.slots)or 3 local kU,sa={},{}for Hi,gQ in ipairs(C.ROLES)do
local eu=e[gQ[1]]if eu~=""and not sa[eu]then sa[eu]=true local kV,ev,sb={},{},false for Hj,sc in ipairs(es.teams or{})do
if sc.name==eu then for Hk,AO in ipairs(sc.pets or{})do local kW=r8[tostring(AO)]if kW then kV[kW.id]=true ev[#ev+1]=kW else sb=true end
end end end local kX,sd=C.best(gQ[2],et,r_,kV)local se=C.score(gQ[2],ev)local sf=#kX==#ev for Hl,AP in ipairs(kX)do if not kV[AP]then sf=false end end
if not sf and(sb or#ev<math.min(r_,#et)or sd>se+1e-4)then kU[#kU+1]={team=eu,role=gQ[2],ids=kX,gain=sd-se}end
end end return kU end function C.rebuild(AQ)local sh=C.plan()if#sh==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gR=true local AV,AW=pcall(function()for Hm,ew in ipairs(sh)do local AS,AT=C.saveTeam(ew.team,ew.ids)local sj=q.data()
local kY={}for Hn,AU in ipairs(ew.ids)do for Ho,kZ in ipairs(sj and sj.pets or{})do if tostring(kZ.id)==AU then kY[#kY+1]=q.nice(kZ.name,kZ.variant)end
end end if AS then A(("TEAM %s rebuilt (%s): %s"):format(ew.team,AQ or"pets changed",table.concat(kY,", ")))else gR=false A(("TEAM %s: %s"):format(ew.team,tostring(AT)))end
end end)z.editing,z.nextTry=false,0 if not AV then gR=false A("TEAM BUILD ERR "..tostring(AW))end C.builds=C.builds+1
C.buildMsg=gR and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gR end
function C.fuseTick()if not e.AutoFuse or z.editing then return end local gS=q.data()if not gS then return end
local k0=C.need()local k1,gT={},{}for Hp,AX in ipairs(gS.teams or{})do for Hq,AY in ipairs(AX.pets or{})do k1[tostring(AY)]=true end end
for Hr,AZ in ipairs(gS.equipped or{})do gT[tostring(AZ)]=true end C.failUntil=C.failUntil or{}for cp,A0 in pairs(e.Pets)do
local sk=tonumber(A0 .f)or 0 local k2,A1=C.count(cp,gS,true)if sk>0 and A1<sk and#k2>=k0 and y()>=(C.failUntil[cp]or 0)then
table.sort(k2,function(gU,gV)local sl=(gT[tostring(gU.id)]and 4 or 0)+(k1[tostring(gU.id)]and 2 or 0)+(gU.named and 1 or 0)
local sm=(gT[tostring(gV.id)]and 4 or 0)+(k1[tostring(gV.id)]and 2 or 0)+(gV.named and 1 or 0)if sl~=sm then return sl<sm end
return tostring(gU.id)<tostring(gV.id)end)local gW,k3={},{}for gX=1,k0 do gW[gX]=tostring(k2[gX].id)if gT[gW[gX]]then k3[#k3+1]=gW[gX]end
end z.editing,z.editingSince=true,y()for Hs,A2 in ipairs(k3)do q.call("unequip",A2)task.wait(0.3)end local gY=q.call("fuse",{ids=gW})
z.editing,z.nextTry=false,0 if type(gY)=="table"and gY.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(k0,q.nice(cp),q.nice(cp)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(cp),os.date("%H:%M"))else C.failUntil[cp]=y()+120 A(("fuse %s failed: %s"):format(q.nice(cp),type(gY)=="table"and tostring(gY.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not e.AutoBuild or not e.Teams then return end local sn=q.data()
if not sn then return end local cq={}for Ht,A3 in ipairs(sn.pets or{})do cq[#cq+1]=tostring(A3 .id)end table.sort(cq)
cq=table.concat(cq,",")if cq~=C.sig then C.sig,C.dirtyAt=cq,y()end local A4=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if A4 and not z.editing then local A5=C.rebuild(C.dirtyAt and"pets changed"or"check")if A5 then C.dirtyAt,C.lastBuild=nil,y()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cr)return cr:IsA("ParticleEmitter")or cr:IsA("Trail")or cr:IsA("Beam")or cr:IsA("Fire")or cr:IsA("Smoke")
or cr:IsA("Sparkles")or cr:IsA("Light")end function d.muteOne(bl)if not e.Lite or not bl.Parent then return end
local gZ=(bl:IsA("BillboardGui")and d.bb)or(d.isFx(bl)and d.fx)or nil if not gZ or gZ[bl]~=nil then return end
if gZ==d.fx and d.gameLow and not bl:IsA("Beam")then return end gZ[bl]=bl.Enabled if bl.Enabled then bl.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local k4={}for Hu,A6 in ipairs({d.bb,d.fx})do for A7 in pairs(A6)do k4[#k4+1]=A7 end end local so=os.clock()for A8,ex in ipairs(k4)do
if e.Lite and ex.Parent and ex.Enabled then local A9=d.bb[ex]~=nil and d.bb or d.fx A9[ex]=true ex.Enabled=false
end if A8%200==0 and os.clock()-so>0.002 then task.wait()so=os.clock()end end end function d.lite(sp)e.Lite=sp
if sp then task.spawn(function()for A_,Ba in ipairs(am:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Ba)
if A_%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=T(am.DescendantAdded:Connect(function(k5)
if e.Lite and(k5:IsA("BillboardGui")or d.isFx(k5))then d.queue[#d.queue+1]=k5 end end))end local k6=game:GetService("Lighting")
for Hv,ey in ipairs(k6:GetChildren())do if ey:IsA("PostEffect")and ey.Enabled and d.post[ey]==nil then d.post[ey]=true ey.Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and k6 .GlobalShadows or d.oldShadows k6 .GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and am.Terrain.Decoration or d.oldDeco am.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for Hw,Bb in pairs(d.watch)do pcall(function()Bb:Disconnect()end)end
for sq,Bc in pairs(d.bb)do pcall(function()if sq.Parent then sq.Enabled=Bc end end)end for sr,Bd in pairs(d.fx)do pcall(function()if sr.Parent then sr.Enabled=Bd end end)end
for ss in pairs(d.post)do pcall(function()if ss.Parent then ss.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local Be=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()Be.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()am.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(su)
local Bf,k7=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not Bf or type(k7)~="table"then return end if su and not d.ceOld then d.ceOld={}for Hx,sv in ipairs({"Fireworks","Confetti"})do
local g0=k7[sv]if type(g0)=="table"and type(g0 .Play)=="function"then d.ceOld[sv]=g0 .Play pcall(function()g0 .Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not su and d.ceOld then for Bg,Bh in pairs(d.ceOld)do pcall(function()k7[Bg].Play=Bh end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local k8,g1 for Hy,ez in ipairs(getgc(false))do if type(ez)=="function"and(type(islclosure)~="function"or islclosure(ez))then
local Bi,sx,sy=pcall(debug.info,ez,"sn")if Bi and type(sx)=="string"and sx:find("ToppingCullHandler",1,true)then
if sy=="poll"then k8=ez elseif sy=="retarget"then g1=ez end end end end if not(k8 and g1)then return nil end local Bj,g2=pcall(debug.getupvalues,g1)
local sz=Bj and type(g2)=="table"and g2[3]if type(sz)~="function"or debug.info(sz,"n")~="targetFor"or(g2[1]~=nil and type(g2[1])~="number")then return nil end
d.tc={poll=k8,re=g1}return d.tc end function d.tops(sA)local aM=d.topsFind()if not aM then return false end if sA and not aM.old then
local Bk,Bl=pcall(hookfunction,aM.poll,function()end)if not Bk then return false end aM.old=Bl pcall(debug.setupvalue,aM.re,1,-1000)
pcall(aM.re)elseif not sA and aM.old then local Bm=type(restorefunction)=="function"and pcall(restorefunction,aM.poll)
if not Bm then pcall(hookfunction,aM.poll,aM.old)end aM.old=nil pcall(aM.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(Bn)local sB=am:FindFirstChild("Plots")local sC=os.clock()if Bn then for Hz,Bo in ipairs(sB and sB:GetChildren()or{})do
local sD=Bo:FindFirstChild("SkinProps")local sE=sD and sD:FindFirstChild("FairyLights")for HA,sF in ipairs(sE and sE:GetChildren()or{})do
for HB,eA in ipairs(sF:GetChildren())do if eA:IsA("BasePart")and(eA.Name=="Bulb"or eA.Name=="Wire")then d.lit[eA]=sF eA.Parent=nil end
end if os.clock()-sC>0.002 then task.wait()sC=os.clock()end end end for HC,Bp in ipairs({"Leaderboards","ClanBoard"})do
local k9=am:FindFirstChild(Bp)if k9 then d.boardsOff[k9]=true k9 .Parent=nil end end else for Bq,sG in pairs(d.lit)do pcall(function()if sG.Parent then Bq.Parent=sG end end)end
for sH in pairs(d.boardsOff)do pcall(function()if not sH.Parent then sH.Parent=am end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(Br)if Br then local sI=af:FindFirstChild("Remotes")local sJ=sI and sI:FindFirstChild("SquishyRollAnimation")
if not sJ or type(getconnections)~="function"then return end local Bs,Bt=pcall(getconnections,sJ.OnClientEvent)
for HD,g3 in ipairs(Bs and Bt or{})do local k_=""pcall(function()k_=debug.info(g3 .Function,"s")end)if type(k_)=="string"and k_:find("SquishyHandler",1,true)and not d.reel[g3]then
if pcall(function()g3:Disable()end)then d.reel[g3]=true end end end else for Bu in pairs(d.reel)do pcall(function()Bu:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(Bv)if not Bv then for HE,Bw in pairs(d.quiet)do pcall(function()Bw:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function la(Bx,By)local Bz,BA=pcall(getconnections,Bx)
for HF,g4 in ipairs(Bz and BA or{})do local lb=""pcall(function()lb=debug.info(g4 .Function,"s")end)local lc=g4 .Function
if lc and type(lb)=="string"and lb:find(By,1,true)and not d.quiet[lc]then if pcall(function()g4:Disable()end)then d.quiet[lc]=g4 end
end end end local sK=am:FindFirstChild("Plots")for HG,g5 in ipairs(sK and sK:GetChildren()or{})do if g5~=c.plot then
la(g5:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local sL,sM=g5:FindFirstChild("WaxStations"),g5:FindFirstChild("SquishyStack")
if sL then la(sL.DescendantAdded,"LocalToppingsHandler")end if sM then la(sM.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for sN,BB in pairs(d.lit)do if not BB:IsDescendantOf(game)then d.lit[sN]=nil pcall(function()sN:Destroy()end)end
end end function d.extras(g6)pcall(d.quietPlots,g6 and c.plot~=nil)pcall(d.fxPatch,g6)pcall(d.tops,g6)pcall(d.lights,g6)
end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(sO)e.HideHud=sO local ld=J:FindFirstChildOfClass("PlayerGui")
if not ld then return end if sO then for HH,eB in ipairs(ld:GetChildren())do if eB:IsA("ScreenGui")and not d.MINE[eB.Name]and eB.Enabled then d.hud[eB]=true eB.Enabled=false end
end if not d.hudConn then d.hudConn=T(ld.ChildAdded:Connect(function(eC)if e.HideHud and eC:IsA("ScreenGui")and not d.MINE[eC.Name]then
task.defer(function()if e.HideHud and eC.Enabled then d.hud[eC]=true eC.Enabled=false end end)end end))end else
for sP in pairs(d.hud)do pcall(function()if sP.Parent then sP.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(le)e.FpsCap=le local sQ=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not sQ then return false end return pcall(sQ,le==0 and 60 or le)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ao)if ao:IsA("BasePart")or ao:IsA("Decal")or ao:IsA("Texture")then if ao.Transparency<1 then d.unseen[ao]=ao.Transparency ao.Transparency=1 end
elseif ao:IsA("BillboardGui")or ao:IsA("SurfaceGui")or ao:IsA("ParticleEmitter")or ao:IsA("Beam")or ao:IsA("Trail")or ao:IsA("Light")or ao:IsA("Fire")or ao:IsA("Smoke")or ao:IsA("Sparkles")then
if ao.Enabled then d.unseen[ao]=true ao.Enabled=false end end end function d.notMine(BC)return e.HideMine or(c.plot and not BC:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped={},1,0 function d.dropIt(sR)local lf=sR.Parent local lg=lf and lf.Name=="SquishyStack"and lf.Parent
if lg and lg~=c.plot and c.plot and lg.Parent==c.plot.Parent then d.dropQ[#d.dropQ+1]={sR,y()+3}end end function d.dropStep(BD)
local lh=d.dropQ while d.dropI<=#lh and os.clock()-BD<0.003 do local li=lh[d.dropI]if li[2]>y()then break end
d.dropI=d.dropI+1 if e.HideBases and li[1].Parent then pcall(function()li[1]:Destroy()end)d.dropped=d.dropped+1
end end if d.dropI>#lh then d.dropQ,d.dropI={},1 end end function d.hideStep()local lj=os.clock()local eD=d.queue
if e.Lite and eD and#eD>0 then d.muteI=d.muteI or 1 while d.muteI<=#eD and os.clock()-lj<0.0015 do pcall(d.muteOne,eD[d.muteI])
d.muteI=d.muteI+1 end if d.muteI>#eD then d.queue,d.muteI={},1 end end if d.dropI<=#d.dropQ then pcall(d.dropStep,lj)end
local g7=d.hideQ if d.hideI>#g7 then return end while d.hideI<=#g7 and os.clock()-lj<0.004 do local lk=g7[d.hideI]
d.hideI=d.hideI+1 if e.HideBases and lk.Parent and d.notMine(lk)then pcall(d.hideOne,lk)end end if d.hideI>#g7 then d.hideQ,d.hideI={},1 end
end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end
function d.setBases(sS)if e.HideBases then d.bases(false)end e.HideMine=sS==2 if sS>0 then d.bases(true)end end
function d.bases(sT)e.HideBases=sT local ll=am:FindFirstChild("Plots")if not ll then return end if sT then task.spawn(function()
local lm=0 for HI,g8 in ipairs(ll:GetChildren())do local sU=g8~=c.plot and c.plot and g8:FindFirstChild("SquishyStack")
for HJ,BE in ipairs(sU and sU:GetChildren()or{})do d.dropIt(BE)end if g8~=c.plot or e.HideMine then for HK,BF in ipairs(g8:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,BF)lm=lm+1 if lm%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=T(ll.DescendantAdded:Connect(function(c4)if e.HideBases and d.notMine(c4)then
pcall(d.hideOne,c4)d.hideQ[#d.hideQ+1]=c4 if c4 .Parent and c4 .Parent.Name=="SquishyStack"then d.dropIt(c4)end
end end))end else for ln,sV in pairs(d.unseen)do pcall(function()if not ln.Parent then return end if type(sV)=="number"then ln.Transparency=sV else ln.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(sW)e.NoRender=sW pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not sW)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local BG=game:GetService("RunService")local lo=0 for HL,BH in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local BI,sX=pcall(function()return BG[BH]end)local sY,lp=false,nil if BI and sX then sY,lp=pcall(getconnections,sX)end
if sY and type(lp)=="table"then for HM,g9 in ipairs(lp)do local lq=""pcall(function()local sZ=getfenv(g9 .Function).script lq=sZ and sZ:GetFullName()or""end)
if lq~=""then for HN,BJ in ipairs(d.CALM)do if lq:find(BJ,1,true)then local lr=g9 .Function if lr and not d.calmedF[lr]and pcall(function()g9:Disable()end)then
d.calmedF[lr]=true d.calmed[#d.calmed+1]=g9 lo=lo+1 end break end end end end end end if#d.calmed>200 then local ls={}for BK=#d.calmed-49,#d.calmed do ls[#ls+1]=d.calmed[BK]end d.calmed=ls
end return lo end function d.calm(s0)e.Calm=s0 if s0 then local BL=d.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(BL))
else for HO,BM in ipairs(d.calmed)do pcall(function()BM:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(s1)if c.rejoining then return end A("REJOIN this server ("..s1 ..")")
pcall(fA)if c.autoload then pcall(f0,c.autoload)end oU()local BN=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then dM(s1 ..", same server failed")end end)return BN end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.Lite and y()-(d.extraAt or 0)>5 then d.extraAt=y()d.gameLow=J:GetAttribute("GraphicsLow")==true
pcall(d.litPrune)pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and y()-(d.topsTry or-100)>60 then d.topsTry=y()pcall(d.tops,true)end end local s2=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if s2 then for HP,BO in ipairs(s2:GetChildren())do local s3=BO:FindFirstChild("SquishyPlaceHolder")local cs=s3 and s3:FindFirstChild("TimerGui")
if cs and cs:IsA("BillboardGui")then if d.bb[cs]==nil then pcall(d.muteOne,cs)elseif cs.Enabled then d.bb[cs]=true cs.Enabled=false end
end end end local BP,eE=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if BP and type(eE)=="number"then
d.mem=eE d.memPeak=math.max(d.memPeak,eE)if(e.MemLimit or 0)>0 and eE>e.MemLimit then d.over=(d.over or 0)+1 if d.over>=30 and not c.busy then
d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(eE,e.MemLimit))end elseif(d.over or 0)>0 then d.over=0
end end if y()-(d.noteAt or 0)>1800 then d.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function lt(g_)if type(g_)~="string"then return false end
g_=g_:lower()for HQ,BQ in ipairs(c.sellWords)do if g_:find(BQ,1,true)then return true end end return false end
local function BR()local s4=af:FindFirstChild("Remotes")local lu=s4 and s4:FindFirstChild("SellSquishy")if not(lu and lu:IsA("RemoteEvent"))then return false end
if not pcall(function()lu:FireServer()end)then return false end return aq(function()return ac()==nil end,1.5)
end local function BS()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local s5=ap()local s6=s5 and s5 .HumanoidRootPart.Position local eF,s7 for HR,c5 in ipairs((c.plot or am):GetDescendants())do
if c5:IsA("ProximityPrompt")and(lt(c5 .ActionText)or lt(c5 .ObjectText)or lt(c5 .Name))then local s8=nO(c5)local lv=(s8 and s6)and(s8-s6).Magnitude or 1e9
if lv<=400 and(not eF or lv<s7)then eF,s7=c5,lv end end end c.sellSpot=eF c.noSellSpot=(eF==nil)return eF end
local function s9()local lw=ac()if not lw then c.holding=false return false end if aJ(lw)then return false end
local lx=ak(W(lw))if BR()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..lx)return true end local c6=BS()if c6 then local s_=dz(c6)if s_ then b8(s_,c6)local ta=ac()if ta and not aJ(ta)then
local BT,BU=dS(c6,function()return ac()==nil end,function()return c6 .Enabled end)if BT then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(lx,fu(c6),BU))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..lx.." ("..c.sellFails..")")
return false end local BV={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function BW(c7)local ha=fu(c7):lower()for HT,BX in ipairs(BV)do if ha:find(BX,1,true)then return 0 end end
local a6,ar=c7 .Name:lower(),0 local function aU(BY,BZ)return BY:find(BZ,1,true)~=nil end if aU(a6,"collect")then ar=ar+60 end
if aU(a6,"cash")or aU(a6,"money")then ar=ar+45 end if aU(a6,"income")or aU(a6,"claim")then ar=ar+35 end if aU(a6,"coin")or aU(a6,"earn")or aU(a6,"green")then ar=ar+20 end
if a6=="pad"or a6=="touch"then ar=ar+25 end if ar==0 and(aU(ha,"collect")or aU(ha,"cash")or aU(ha,"money"))then ar=25 end
if ar==0 then return 0 end local eG=c7 .Color if eG.G>0.5 and eG.G>eG.R*1.4 and eG.G>eG.B*1.4 then ar=ar+15 end
if math.min(c7 .Size.X,c7 .Size.Y,c7 .Size.Z)<2 then ar=ar+5 end return ar end local function B0()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local hb,eH,ly={},nil,29 for HU,hc in ipairs(c.plot:GetDescendants())do
if hc:IsA("BasePart")then local hd=BW(hc)if hd>0 then hb[#hb+1]={s=hd,p=hc}if hd>ly then eH,ly=hc,hd end end end
end table.sort(hb,function(B1,B2)return B1 .s>B2 .s end)c.padCands,c.padPart=hb,eH if eH then A("collect pad: "..fu(eH).." (score "..ly..")")end
return eH end local lz="SAB_pad_v1.txt"local function B3(B4)if type(writefile)=="function"then pcall(writefile,lz,table.concat({B4:GetComponents()},","))end
end local function B5()if type(isfile)~="function"or type(readfile)~="function"then return nil end local B6,tb=pcall(function()if isfile(lz)then return readfile(lz)end end)
if not B6 or type(tb)~="string"then return nil end local he={}for B7 in tb:gmatch("[^,]+")do he[#he+1]=tonumber(B7)end
if#he==12 then return CFrame.new(unpack(he))end end local function B8(lA,hf,B9)local B_=cN(lA)local lB=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aV=(lB and lB:IsA("BasePart"))and(lB.Position-hf)or Vector3 .new(1,0,0)aV=Vector3 .new(aV.X,0,aV.Z)if aV.Magnitude<0.05 then aV=Vector3 .new(1,0,0)end
aV=aV.Unit for Ca=0,7 do local hg=Ca*math.pi/4 local Cb=Vector3 .new(aV.X*math.cos(hg)-aV.Z*math.sin(hg),0,aV.X*math.sin(hg)+aV.Z*math.cos(hg))
local hh=hf+Cb*(B9+5)local lC=f8(hh.X,hf.Y,hh.Z)if lC and math.abs(lC.Y-hf.Y)<8 then aD(lA,Vector3 .new(hh.X,lC.Y+B_,hh.Z))
if jp(lA,0.7)then return true end end end return false end local function Cc()c.lastCollect=y()local eI=ap()if not eI then return end
local td,Cd=eI.HumanoidRootPart,cN(eI)local eJ,te,eK,lD=nil,4,nil,"?"local lE=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and lE and lE:IsA("BasePart")then eJ,lD=(lE.CFrame*c.manualPad).Position,"manual pad"else local bm=B0()
if bm then eJ=Vector3 .new(bm.Position.X,bm.Position.Y+bm.Size.Y/2+Cd,bm.Position.Z)te,eK,lD=math.max(bm.Size.X,bm.Size.Z)/2,bm,bm.Name
end end if not eJ then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local lF=a_()aD(eI,eJ)
if eK and type(firetouchinterest)=="function"then pcall(firetouchinterest,td,eK,0)end ag(e.PadDwell)if eK and type(firetouchinterest)=="function"then pcall(firetouchinterest,td,eK,1)end
ag(0.5)c.collected=c.collected+1 local lG=a_()A(("COLLECTED (%s) %s"):format(lD,(lF and lG and lG>lF)and("+$"..aK(lG-lF))or"no cash change seen"))
B8(eI,eJ,te)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local tf=af:FindFirstChild("Modules")if not tf then return false end local function lH(Ce)local th=tf:FindFirstChild(Ce)
if not th then return nil end local Cf,ti=pcall(require,th)return(Cf and type(ti)=="table")and ti or nil end o.si,o.arm,o.ci=lH("SquishyInfo"),lH("AutoRollRules"),lH("CrateInfo")
o.modAt=y()if not o.si then return false end local lI={}if o.arm and type(o.arm.tierOf)=="table"then for lJ in pairs(o.arm.tierOf)do
local hi=o.si[lJ]if type(hi)=="table"and hi.rarity~="Limited"and not hi.incomeType and not hi.hiddenAfter then lI[W(lJ)]=lJ end
end end o.roll=lI local hj={}for Cg,Ch in pairs(lI)do local eL=o.si[Ch]if type(eL)=="table"and type(eL.income)=="number"and not eL.incomeType then
hj[#hj+1]={k=Cg,inc=eL.income,pr=tonumber(eL.price)or 0}end end table.sort(hj,function(lK,lL)if lK.inc~=lL.inc then return lK.inc>lL.inc end return lK.pr>lL.pr end)
o.order=hj local hk,lM,lN local Ci=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for Cj,lO in pairs(Ci)do
local lP=type(lO)=="table"and tonumber(lO.price)if lP and(not lM or lP>lM)then hk,lM,lN=Cj,lP,lO.title end end
o.bestCrate,o.bestCrateName=hk and L.key(hk),hk o.bestCrateTitle=lN and L.key(lN)or nil return true end function o.rank(Ck)
local Cl,Cm=pcall(function()return o.arm.rankOf(Ck)end)return(Cl and tonumber(Cm))or 0 end function o.loadDisc(tj)
if type(tj)~="table"then return end local tk={}for Cn,Co in pairs(tj)do if Co then tk[W(tostring(Cn))]=true end end
o.disc,o.discAt=tk,y()end function o.fetch()o.discAt=y()local tl=af:FindFirstChild("Remotes")local tm=tl and tl:FindFirstChild("GetSquishiesDiscovered")
if not tm then return end local Cp,Cq=pcall(function()return tm:InvokeServer()end)if Cp then o.loadDisc(Cq)end
end function o.scanWax()local lQ={}local tn=c.plot and c.plot:FindFirstChild("WaxStations")if tn then for HV,to in ipairs(tn:GetChildren())do
local tp=to:FindFirstChild("SquishyPlaceHolder")if tp and to:GetAttribute("HasSquishy")then for HW,tq in ipairs(tp:GetChildren())do if tq:IsA("Model")then lQ[W(tq.Name)]=true end end
end end end for tr,Cr in pairs(o.placedAt)do if y()-Cr<20 then lQ[tr]=true else o.placedAt[tr]=nil end end o.waxing=lQ
end function o.compute()local ts,lR,lS={},0,0 if o.disc then for lT in pairs(o.roll or{})do if not o.disc[lT]then
if o.waxing[lT]then lS=lS+1 else ts[lT],lR=true,lR+1 end end end end o.need,o.nNeed,o.nWax=ts,lR,lS local tt,lU={},e.Best or 0
local lV=(lU==4)and o.stackMin or nil for Cs,tu in ipairs(o.order)do if(lV and tu.inc>lV)or(not lV and Cs<=(lU==4 and 1 or lU))then tt[tu.k]=true end
end o.best=tt end function o.readStack()o.stackAt=y()local tv=af:FindFirstChild("Remotes")local tw=tv and tv:FindFirstChild("EditStack")
if not tw then return end local Ct,c8=pcall(function()return tw:InvokeServer("State",nil)end)if not(Ct and type(c8)=="table"and type(c8 .state)=="table"and type(c8 .state.entries)=="table")then return end
local hl for HY,tx in ipairs(c8 .state.entries)do local eM=type(tx)=="table"and o.si and o.si[tostring(tx.name)]
if type(eM)=="table"and type(eM.income)=="number"and not eM.incomeType and(not hl or eM.income<hl)then hl=eM.income end
end o.stackMin=hl o.stackFull=#c8 .state.entries>=(tonumber(c8 .state.capacity)or 100)end function o.want(lW)
if(e.Best or 0)>0 and(next(o.best)or(e.Best==4 and o.stackMin))then if o.best[lW]then return true end elseif e.Targets[lW]then
return true end return e.AutoIndex==true and o.need[lW]==true end function o.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(o.best)~=nil)or(e.AutoIndex and next(o.need)~=nil)
or e.Best==4 end function o.placed(Cu)local eN=W(Cu)o.placedAt[eN],o.waxing[eN]=y(),true if o.need[eN]then o.need[eN],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eN)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eO,eP={},{}for Cv,Cw in pairs(o.roll or{})do if o.want(Cv)then eO[Cw]=true end end
for ty,lX in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(ty)or(type(lX)=="table"and type(lX.title)=="string"and L.wanted(lX.title))then eP[ty]=true end
end if not next(eO)and not next(eP)then return nil end if o.arm and type(o.arm.encode)=="function"then local Cx,tz=pcall(o.arm.encode,{rarities={},butters=eO,crates=eP,index=false})
if Cx and type(tz)=="string"then return tz end end local function tA(Cy)local hm={}for Cz in pairs(Cy)do hm[#hm+1]=Cz end table.sort(hm)return table.concat(hm,",")end
local eQ="adv:"if next(eO)then eQ=eQ..";butters:"..tA(eO)end if next(eP)then eQ=eQ..";crates:"..tA(eP)end return eQ
end function o.canon(CA)local hn={}for tB in tostring(CA or""):gmatch("[^;]+")do local lY,tC=tB:match("^(%a+):(.*)$")
if not lY then lY,tC="r",tB:gsub("^adv:","")end for CB in tC:gmatch("[^,]+")do hn[#hn+1]=lY.."="..CB end end table.sort(hn)
return table.concat(hn,"|")end function o.sync(CC)if J:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local ct=o.rulesNow()if not ct or#ct>1900 then return end if o.canon(J:GetAttribute("AutoRollRules"))==o.canon(ct)then o.fails=0 return end
if not CC and y()-o.sentAt<4 then return end local tD=af:FindFirstChild("Remotes")local tE=tD and tD:FindFirstChild("AutoRollAction")
if not tE then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()tE:FireServer("Rules",ct)end)D.replaying=false e.ARrules=ct
local ho,hp=0,0 for HZ in(ct:match("butters:([^;]*)")or""):gmatch("[^,]+")do ho=ho+1 end for H0 in(ct:match("crates:([^;]*)")or""):gmatch("[^,]+")do hp=hp+1 end
local tF=ho.."/"..hp if o.told~=tF then o.told=tF A(("auto roll now stops on %d butters and %d crates"):format(ho,hp))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if e.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aN={}if e.AutoIndex then aN[#aN+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if e.Best==4 then local eR=0 for H1 in pairs(o.best)do eR=eR+1 end
aN[#aN+1]=eR==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eR,eR==1 and""or"s")
elseif(e.Best or 0)>0 and o.order[1]then aN[#aN+1]="best: "..ak(o.order[1].k)end if e.BestCrate and o.bestCrateName then aN[#aN+1]="crate: "..o.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aN[#aN+1]="shower: "..O.got end o.msg=#aN>0 and table.concat(aN," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(CD)o.feed[#o.feed+1]=os.date("%H:%M ")..CD if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(tG,av,hq)if tG~="Effect"then o.feedAdd(tostring(tG)..(av~=nil and(": "..tostring(av):sub(1,80))or""))
return end if av~="ShowerTaken"and av~="GoalPoint"then o.feedAdd(tostring(av))end if av=="Shower"then O.add(hq)return end
if av=="ShowerTaken"then O.gone(hq)return end if av=="ShowerClear"then O.drops={}return end if av=="WaxGlow"then
local lZ=type(hq)=="table"and tonumber(hq.SnapAt)if lZ then o.snapAt=lZ A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lZ-q.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end av=tostring(av)b4("Admin "..av)if av~="GoalPoint"and y()-(o.heard[av]or-100)>30 then o.heard[av]=y()
A("ADMIN: "..av)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(l0)if type(l0)~="table"or type(l0 .Pieces)~="table"then return end
for H2,aW in pairs(l0 .Pieces)do if type(aW)=="table"and aW.Id~=nil and aW.Position~=nil then O.drops[aW.Id]={id=aW.Id,butter=tostring(aW.Butter or"?"),rar=tostring(aW.Rarity or"?"),star=aW.Star==true,
pos=aW.Position,opens=tonumber(aW.OpensAt)or 0,ends=tonumber(aW.ExpiresAt)or 0}end end end function O.gone(eS)
if type(eS)~="table"or eS.Id==nil then return end O.drops[eS.Id]=nil if tonumber(eS.UserId)==q.uid then O.mine=eS.Id end
end function O.pick()local l1=q.srv()local l2,tH for tI,cu in pairs(O.drops)do if l1>=cu.ends-0.3 then O.drops[tI]=nil
elseif l1>=cu.opens-0.2 and(O.tried[tI]or 0)<3 then local tJ=(aJ(cu.butter)and 1e6 or 0)+(cu.star and 1e5 or 0)+o.rank(cu.rar)*100-(cu.ends-l1)
if not l2 or tJ>tH then l2,tH=cu,tJ end end end return l2 end function O.due()return e.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aO,l3=O.pick(),ap()if not(aO and l3)then return end O.tried[aO.id]=(O.tried[aO.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aD(l3,aO.pos+Vector3 .new(0,cN(l3)+0.5,0))aq(function()return O.mine==aO.id or ac()~=nil or not O.drops[aO.id]end,1.5)
if O.mine==aO.id or ac()then O.got,O.drops[aO.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aO.butter)),aO.rar,aO.star and" (star)"or""))
elseif not O.drops[aO.id]then O.miss=O.miss+1 end end local eT local function tK()if c.capHit then if e.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eT(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ap()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bw(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local l4,tL=fw()
local hr=ac()if hr then local c9=ak(W(hr))if not aJ(hr)then local l5=(V.gift and W(V.gift)==W(hr)and y()-V.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c9,l5),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c9,l5),"bad"end return"sell",("selling %s (%s)"):format(c9,l5),"warn"
end if l4<1 then return nil,("holding %s - 0 free stations"):format(c9),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c9),"wait"end
return"place",("waxing %s (%d free)"):format(c9,l4),"ok"end c.holding=false if e.Crates and not j.waiting and y()-(j.scanAt or 0)>1 and y()>(j.quietUntil or 0)then
j.scanAt=y()local l6=c.plot:FindFirstChild("CrateStand")if l6 then for H3,eU in ipairs(l6:GetDescendants())do
if eU:IsA("ProximityPrompt")and eU.Enabled and jG(eU)then local bn=eU.ObjectText if bn==""then bn=cG(l6,"TitleLabel")or""end
if bn~=""and L.wanted(bn)then local CE=fs(bn):gsub("crate$","")local tM for tN in pairs(ad.members)do if fs(tN)==CE then tM=tN end end
j.waiting,j.at,j.title,j.prompt=true,y(),bn,eU j.data={name=(bn:gsub("%s","")),rarity=tM,title=bn}A(bn.." found waiting on your stand")
end break end end end end local tO=L.wanted(j.data and j.data.name)or L.wanted(j.title)if e.Crates and(j.on or j.waiting)and tO then
local aX=j.title if y()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aX),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aX.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aX),"bad"end if y()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aX),"bad"
end if j.byYou and y()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aX,math.ceil(60-(y()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aX),"ok"end if j.at and y()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aX,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if y()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aX,
math.ceil(45-(y()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil A("trying the "..aX.." again")
end if y()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aX),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aX,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not tO then local tP=j.title..tostring(j.rolledAt)if j.told~=tP then j.told=tP A(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and y()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if l4<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(tL,tL),"wait"
end local l7=n2()if not l7 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c_=b3()
if c_ and pt(c_.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(c_.name),"idle"end
if y()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c_.name),"bad"end if not pM()then return nil,("%s rolled - waiting for it to land on the stand"):format(c_.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c_.name),"ok"end local bK=jn()if bK.state~="match"then
c.matchSince=nil if bK.state=="skip"and not l7 .Enabled then return nil,bK.text.." (sold out)","idle"end return nil,bK.text,bK.level
end if not l7 .Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eV=y()
if eV<c.noCashUntil then local tQ,CG=dO()if tQ then return nil,("cash short: have $%s, price ~$%s"):format(aK(tQ),aK(CG)),"bad"end
return nil,(dO()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aK(a_()),math.ceil(c.noCashUntil-eV)),dO()and"bad"or"wait"end if eV-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eV local tR=eV-c.matchSince if tR<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bK.shown,tR),"ok"end
return"buy",("buying %s via %s"):format(bK.shown,bK.src),"ok"end d.DEPTH=11 function d.pinTick()local tS=d.hold
if not tS then return end local l8=J.Character local l9=l8 and l8:FindFirstChild("HumanoidRootPart")if not l9 then return end
l9 .CFrame=tS l9 .AssemblyLinearVelocity=Vector3 .new(0,0,0)for H4,hs in ipairs(l8:GetChildren())do if hs:IsA("BasePart")and hs.CanCollide then d.noclip[hs]=true hs.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(CH,tT)d.hold=CH if tT then d.surface=tT end end function d.unpin(CI)
if not d.hold then return end d.hold=nil for tU in pairs(d.noclip)do pcall(function()if tU.Parent then tU.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local tV=ap()if tV and d.surface and not CI then aD(tV,d.surface.Position,d.surface.Position+d.surface.LookVector)
ag(0.1)end end function d.home()local bo,tW=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ap()
if not(bo and bo:IsA("BasePart")and tW)then return nil end local tX=nR()or bo.Position local ht=Vector3 .new(tX.X-bo.Position.X,0,tX.Z-bo.Position.Z)
ht=ht.Magnitude>0.1 and ht.Unit or Vector3 .new(0,0,1)local hu=bo.Position+ht*6 local tY=f8(hu.X,bo.Position.Y,hu.Z,{bo})
return CFrame.new(hu.X,(tY and tY.Y or bo.Position.Y)+cN(tW),hu.Z)end function d.ground(CJ,tZ,CK)local l_,ma={J.Character},nil
for H5=1,12 do local mb=RaycastParams.new()mb.FilterType=Enum.RaycastFilterType.Exclude mb.FilterDescendantsInstances=l_
local hv=am:Raycast(Vector3 .new(CJ,tZ,CK),Vector3 .new(0,-2000,0),mb)if not hv then break end ma,tZ=hv,hv.Position.Y-0.05
l_[#l_+1]=hv.Instance end return ma and ma.Position.Y end function d.parkHome()local mc=d.home()if not mc then return false end
local da=mc.Position local CL=d.ground(da.X,da.Y+300,da.Z)or(da.Y-3)d.pin(CFrame.new(da.X,CL-8,da.Z),mc)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(hw)e.Ghost,e.GhostHelps=hw==2,hw==1 if hw<2 then task.spawn(function()while c.busy do ag(0.1)end
if d.ghostMode()<2 and d.hold and not E.home then pcall(d.unpin)end end)end d.paintGhost()A("ghost: "..d.GHOST[hw][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local CM=ap()if not CM or K.seat()then return end d.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local t0=J.Character local t1=t0 and t0:FindFirstChildOfClass("Humanoid")local md=t1 and t1 .SeatPart
return(md and md.Name=="LogSeat")and md or nil end function K.due()if not(e.Campfire and c.running)or y()<K.nextAt then return false end
local CN=am:FindFirstChild("NightSeats")if not CN then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or y()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(K.msg)return false end end return true end function K.sit()local t2,hx=am:FindFirstChild("NightSeats"),ap()
if not t2 or not hx then return end local t3,db=hx.HumanoidRootPart.Position,{}for H6,hy in ipairs(t2:GetChildren())do
local t4=hy:IsA("Seat")and hy.Occupant==nil and hy:FindFirstChildOfClass("ProximityPrompt")if t4 then db[#db+1]={st=hy,p=t4}end
end if#db==0 then K.nextAt,K.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(db,function(CO,CP)return(CO.st.Position-t3).Magnitude<(CP.st.Position-t3).Magnitude end)
local CQ,CS=db[1].st,db[1].p d.unpin(true)local dc=CQ.CFrame aD(hx,dc.Position+dc.LookVector*2+Vector3 .new(0,2.5,0),dc.Position)
ag(0.25)local CT=dS(CS,function()return K.seat()~=nil end)if not CT then aD(hx,dc.Position+Vector3 .new(0,2,0),dc.Position+dc.LookVector)
aq(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=y()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then A(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local me=af:FindFirstChild("Remotes")if not me then return end local eW,mf,dd=0,0,{}
local CU,t5=pcall(function()return me.ClanRequest:InvokeServer("state")end)local t6=CU and type(t5)=="table"and t5 .tasks
for H7,bL in ipairs(t6 and t6 .list or{})do if not bL.done and bL.kind=="pull"then eW=math.max(eW,(bL.goal or 0)-(bL.progress or 0))end
if not bL.done then dd[#dd+1]=("%s %d/%d"):format(tostring(bL.text),bL.progress or 0,bL.goal or 0)end end F.events={}
for H8,de in ipairs(me:GetChildren())do if de:IsA("RemoteFunction")and de.Name:match("^%u%a+Action$")and de.Name~="CrateAction"and de.Name~="AutoRollAction"then
local CV,eX=pcall(function()return de:InvokeServer("state")end)if CV and type(eX)=="table"and eX.live==true and type(eX.quests)=="table"then
F.events[#F.events+1]={r=de,st=eX}for H9,aP in ipairs(eX.quests)do if not aP.done and aP.kind=="pull"then eW=math.max(eW,(aP.goal or 0)-(aP.progress or 0))end
if not aP.done and aP.kind=="collect"then mf=math.max(mf,(aP.goal or 0)-(aP.progress or 0))end if not aP.done then dd[#dd+1]=("%s %d/%d"):format(tostring(aP.text),aP.progress or 0,aP.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eW,mf F.msg=#dd>0 and("open: "..table.concat(dd,", "))or"all quests done for today"
end function F.claim()for H_,eY in ipairs(F.events)do local t7=eY.r.Name:gsub("Action$","")for Ia,df in ipairs(eY.st.quests)do
if df.done and not df.claimed then local CW,t8=pcall(function()return eY.r:InvokeServer("claimQuest",df.id)end)
if CW and not(type(t8)=="table"and t8 .ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(t7,tostring(df.text),tostring(df.points or df.treats or"?")))
end ag(0.4)end end if eY.st.bonusReady==true then local CX=pcall(function()return eY.r:InvokeServer("claimBonus")end)
if CX then A(("CLAIMED %s daily quest bonus"):format(t7))end ag(0.4)end end end function F.tick()if not(e.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return e.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local t9=c.plot and c.plot:FindFirstChild("Lever")
local mg=t9 and t9:FindFirstChild("Wheel")return mg and mg:FindFirstChildWhichIsA("ProximityPrompt"),mg end function F.resume(CY)
F.arPaused=false if F.arWas then F.arWas=false e.AutoRoll=true task.spawn(D.apply,CY)end end function F.pull()
local hz,mh=F.lever()if not hz or not mh or not mh:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hz.Enabled then F.nextAt=y()+1 return end b8(mh,hz)F.asked=nil pg(hz)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
ag(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bM,CZ)local mi=bM:GetAttribute("PourOwner")
if type(mi)~="number"or mi==q.uid or not bM:GetAttribute("HasSquishy")then return false end if bM:GetAttribute("PourLong")~=true or bM:GetAttribute("PourFull")==true then return false end
local mj=bM:GetAttribute("PourId")if mj==nil or E.skip[mj]then return false end local t_,mk,C0=bM:GetAttribute("Helpers"),0,tostring(q.uid)
if type(t_)=="string"then for C1 in t_:gmatch("[^,%s]+")do mk=mk+1 if C1==C0 then return false end end end if mk>=6 then return false end
local hA=z.left(bM)if not hA then local ua=tonumber(bM:GetAttribute("PourEnd"))hA=ua and(ua-CZ)end if not hA or hA<=75 then return false end
local ml=game:GetService("Players"):GetPlayerByUserId(mi)if not ml or ml:GetAttribute("WaxHelpOff")==true then return false end
return true,ml,mj end function E.list()local mm,C2={},q.srv()local ub=am:FindFirstChild("Plots")for Ib,uc in ipairs(ub and ub:GetChildren()or{})do
local ud=uc~=c.plot and uc:FindFirstChild("WaxStations")for Ic,mn in ipairs(ud and ud:GetChildren()or{})do local C3,C4,C5=E.can(mn,C2)
local mo=C3 and mn:FindFirstChild("SquishyPlaceHolder")if mo and mo:IsA("BasePart")then mm[#mm+1]={st=mn,p=C4,id=C5,part=mo}end
end end return mm end function E.due()return e.Help and c.running and y()>=E.nextAt end function E.skipIt(ue,uf)
E.skip[ue],E.skipN=uf,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[ue]=uf},1,{}end end function E.goHome()
local hB,bN=ap(),E.home E.home=nil if not(hB and bN)then return end if e.Ghost and not K.seat()then d.unpin(true)
if not d.parkHome()then pcall(aD,hB,bN.Position,bN.Position+bN.LookVector)end elseif d.hold or(hB.HumanoidRootPart.Position-bN.Position).Magnitude>20 then
d.unpin(true)pcall(aD,hB,bN.Position,bN.Position+bN.LookVector)end end function E.step()local mp,eZ=E.list(),ap()
if#mp==0 or not eZ then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local ug=eZ.HumanoidRootPart local uh=ug.Position table.sort(mp,function(C6,C7)return(C6 .part.Position-uh).Magnitude<(C7 .part.Position-uh).Magnitude end)
local aY=mp[1]E.home=E.home or(d.hold and d.surface)or ug.CFrame local bO=aY.part local e0=(bO.Position+aY.st:GetPivot().Position)/2
local hC=E.tries[aY.id]or 0 if(e.Ghost or e.GhostHelps)and hC==0 and not K.seat()then d.pin(bO.CFrame,E.home)
else d.unpin(true)local mq=hC==0 and f8(e0 .X,bO.Position.Y,e0 .Z,{bO})if mq and math.abs(mq.Y-bO.Position.Y)<8 then
aD(eZ,Vector3 .new(e0 .X,mq.Y+cN(eZ),e0 .Z),bO.Position)else aD(eZ,bO.Position+Vector3 .new(0,bO.Size.Y/2+3,0),e0)
end end ag(0.3)local e1=af:FindFirstChild("Remotes")e1=e1 and e1:FindFirstChild("ClanRequest")if not e1 then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hD,bp=pcall(function()return e1:InvokeServer("help",aY.st:GetAttribute("PourOwner"),tonumber(aY.st.Name))end)
if hD and type(bp)=="table"and bp.ok then E.n,E.fails=E.n+1,0 E.skipIt(aY.id,"helped")A(("HELPED %s's wax (station %s)"):format(aY.p.DisplayName,aY.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hD and type(bp)=="table"and tostring(bp.reason or""):lower():find("walk up",1,true)and hC<2 then
E.tries[aY.id]=hC+1 E.nextAt=y()+0.3 elseif hD and type(bp)=="table"and tostring(bp.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local ui=(hD and type(bp)=="table"and tostring(bp.reason or"refused"))or("error: "..tostring(bp))
E.skipIt(aY.id,ui)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aY.p.DisplayName,ui))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bq)if not e.HelpGuild or type(bq)~="table"or bq.p~="help"or bq.mine or bq.u==q.uid or not bq.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local e2=af:FindFirstChild("Remotes")
e2=e2 and e2:FindFirstChild("ClanRequest")if not e2 then return end local uj,e3=pcall(function()return e2:InvokeServer("callHelp",bq.u)end)
local uk=tostring(bq.n or bq.un or bq.u)if uj and type(e3)=="table"and e3 .ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(uk))
else A(("guild call from %s: %s"):format(uk,(uj and type(e3)=="table"and tostring(e3 .reason or"refused"))or tostring(e3)))
end end)end local function as(C8,ul,...)if c.busy then return end c.busy,c.busyText=true,C8 if d.hold and ul~=E.step then pcall(d.unpin)end
local C9,um=pcall(ul,...)c.busy,c.busyText=false,""if not C9 and um~=iA then A("ERR "..tostring(um))end end local function C_()
local aQ,Da,Db=tK()c.reason,c.level=Da,Db if aQ=="place"then as("waxing...",z.place)elseif aQ=="crate"then as("opening crate...",d3,true)
elseif aQ=="cratesmart"then as("opening crate...",j.smart)elseif aQ=="cratewin"then as("opening the crate window...",jI)
elseif aQ=="nocrate"then as("discarding crate...",d3,false)elseif aQ=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aQ=="sell"then as("selling...",s9)elseif aQ=="buy"then as("buying...",pk,false)elseif not aQ and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aQ and not c.matchSince and K.due()then as("sitting at the campfire...",K.sit)
elseif not aQ and not c.matchSince and F.pullDue()and not ac()and not(b3()and aJ(b3().name))then as("pulling the lever for a quest...",F.pull)
elseif e.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
as("collecting money...",Cc)elseif not aQ and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not e.Help then
as("coming back...",E.goHome)elseif not c.busy then d.parkTick()end end function eT(hE,Dc)if hE==c.running then return end
c.running=hE if not Dc then e.AutoStart=hE end if hE then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bw()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bP=fU(an.auto)if type(bP)=="string"then bP=bP:gsub("%s+$","")
if bP~=""then c.autoload=bP local Dd=oQ(bP)A(Dd and("loaded config "..bP)or("config "..bP.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local De={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local mr={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local uo,up,uq,ur=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if uo and up and uq and ur then ae.x,ae.b,ae.m,ae.r=uo,up,uq,ur end end)pcall(function()local us=Enum.Font.RobotoMono if us then ae.mono=us end end)
local function H(Df,Dg,Dh)local Di,ms=pcall(Instance.new,Df)if not Di then c.uiErrs=c.uiErrs+1 return nil end
for Dj,Dk in pairs(Dg)do if not pcall(function()ms[Dj]=Dk end)then c.uiErrs=c.uiErrs+1 end end ms.Parent=Dh return ms
end local function ab(Dl,Dm)H("UICorner",{CornerRadius=UDim.new(0,Dm or 8)},Dl)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hF,mt)if hF and a.shown[hF]~=mt then a.shown[hF]=mt hF.Text=mt end
end function a.stroke(Dn,Do,Dp)return H("UIStroke",{Color=Do or l.line,Thickness=1,Transparency=Dp or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},Dn)
end function a.grad(Dq,Dr,Ds,Dt)local Du,ut=pcall(function()return ColorSequence.new(Dr,Ds)end)if Du and ut then return H("UIGradient",{Color=ut,Rotation=Dt or 0},Dq)end
end function a.pad(Dv,uu,uv,Dw,Dx)H("UIPadding",{PaddingLeft=UDim.new(0,uu or 0),PaddingTop=UDim.new(0,uv or 0),
PaddingRight=UDim.new(0,Dw or uu or 0),PaddingBottom=UDim.new(0,Dx or uv or 0)},Dv)end function a.list(Dy,Dz,DA)
return H("UIListLayout",{Padding=UDim.new(0,Dz or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=DA and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Dy)
end function a.ink(mu)local DB,DC=pcall(function()return 0.299*mu.R+0.587*mu.G+0.114*mu.B end)return(DB and DC>0.55)and l.ink or l.text
end function a.nextIn(uw)local ux=(a.ord[uw]or 0)+1 a.ord[uw]=ux return ux end local mv=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local uy=mv:FindFirstChild("SABFarmGui")if uy then uy:Destroy()end local mw=H("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},mv)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local hG=am.CurrentCamera.ViewportSize if hG.X>100 and hG.Y>100 then Q.w=math.clamp(math.floor(hG.X*0.48),320,400)
Q.h=math.clamp(math.floor(hG.Y*0.86),250,360)end end)a.root=H("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},mw)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local uz=UDim2 .new(1,0,1,0)
local function Ie(uA,uB)return UDim2 .new(uA,0,0,0),UDim2 .new(uB,(uA+uB>0.99)and 0 or-4,1,0)end local function ai(DD,DE,e4,DF,DG,DH)
local mx=H("TextButton",{Text=DE,Position=DG,Size=DH,BackgroundColor3=e4,BorderSizePixel=0,Font=ae.b,TextSize=DF,TextColor3=a.ink(e4),AutoButtonColor=true},DD)
ab(mx,8)if e4==l.panel2 or e4==l.raise or e4==l.panel then a.stroke(mx,l.line,0.4)end return mx end local function hH(DI,DJ,DK,DL,DM)
local hI=H("TextBox",{Text=DJ,PlaceholderText=DK,Position=DL,Size=DM,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},DI)ab(hI,8)a.stroke(hI,l.line,0)a.pad(hI,9,0,6,0)
return hI end local hJ=am.CurrentCamera local function DN()local DO,hK=pcall(function()return hJ and hJ.ViewportSize end)
if DO and hK and hK.X>50 and hK.Y>50 then return hK end end local function bQ(e5)local my=DN()if not(my and e5 and e5 .Parent)then return end
local DP=pcall(function()local hL,uC=e5 .AbsolutePosition,e5 .AbsoluteSize local mz=70 local uD=math.clamp(hL.X,mz-uC.X,my.X-mz)
local uE=math.clamp(hL.Y,0,my.Y-math.min(uC.Y,mz))if math.abs(uD-hL.X)>0.5 or math.abs(uE-hL.Y)>0.5 then e5 .Position=UDim2 .new(0,math.floor(uD),0,math.floor(uE))
end end)return DP end local function hM(DQ)local DR,mA=pcall(function()return DQ.AbsolutePosition end)if DR and mA then return{math.floor(mA.X),math.floor(mA.Y)}end
end local dg={}c.dragMoved={}local function uF(e6,uG,mB)T(e6 .InputBegan:Connect(function(dh)if dh.UserInputType~=Enum.UserInputType.MouseButton1 and dh.UserInputType~=Enum.UserInputType.Touch then return end
local mC={start=dh.Position,from=uG.Position,moved=0,target=uG,input=dh,onDrop=mB}dg[e6],c.dragMoved[e6]=mC,0
local mD mD=dh.Changed:Connect(function()if dh.UserInputState==Enum.UserInputState.End and dg[e6]==mC then dg[e6]=nil
if mD then mD:Disconnect()end if mB then mB(mC.moved)end end end)end))end T(nA.InputChanged:Connect(function(hN)
if hN.UserInputType~=Enum.UserInputType.MouseMovement and hN.UserInputType~=Enum.UserInputType.Touch then return end
for DS,a7 in pairs(dg)do local mE=a7 .target if mE and mE.Parent then local uH,uI=hN.Position.X-a7 .start.X,hN.Position.Y-a7 .start.Y
a7 .moved=math.max(a7 .moved,math.abs(uH)+math.abs(uI))c.dragMoved[DS]=a7 .moved mE.Position=UDim2 .new(a7 .from.X.Scale,a7 .from.X.Offset+uH,a7 .from.Y.Scale,a7 .from.Y.Offset+uI)
end end end))T(nA.InputEnded:Connect(function(hO)if hO.UserInputType~=Enum.UserInputType.MouseButton1 and hO.UserInputType~=Enum.UserInputType.Touch then return end
for DT,hP in pairs(dg)do if hP.input==hO or hO.UserInputType==Enum.UserInputType.MouseButton1 then dg[DT]=nil
if hP.onDrop then hP.onDrop(hP.moved)end end end end))local function P(DU,DV,DW,DX,DY,DZ,D0)return H("TextLabel",{Text=DV,Position=DZ or UDim2 .new(0,0,0,0),Size=D0 or uz,BackgroundTransparency=1,
Font=DY and ae.b or ae.m,TextSize=DW,TextColor3=DX,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},DU)
end function a.row(uJ,D1)return H("Frame",{Size=UDim2 .new(1,0,0,D1),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(uJ)},uJ)end function a.card(uK,uL,uM)local di=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(uK)},uK)ab(di,11)a.stroke(di,l.line,0.25)a.list(di,5)a.pad(di,8,8,8,9)
if uL then local mF=a.row(di,14)H("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},mF)P(mF,uL:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if uM then local D2=P(mF,uM,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
D2 .TextXAlignment=Enum.TextXAlignment.Right end end return di end function a.heading(D3,D4,mG)local mH=a.row(D3,mG and 34 or 22)
P(mH,D4,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if mG then P(mH,mG,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mH end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(mI)local aH=a.sw[mI]if not aH then return end
local dj=tostring(mI.Text or""):match(":%s*(.-)%s*$")or""local bR=dj~=""and not a.OFF[dj]local mJ=not aH.chips and(dj=="ON"or dj=="OFF")
aH.pill.Visible,aH.chip.Visible=mJ,not mJ if mJ then aH.pill.BackgroundColor3=bR and l.accent or l.panel2 aH.knob.Position=bR and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aH.knob.BackgroundColor3=bR and l.white or l.dim else aH.chip.Text=dj~=""and dj or"-"aH.chip.BackgroundColor3=bR and l.accent or l.panel2
aH.chip.TextColor3=bR and l.ink or l.dim end mI.BackgroundColor3=bR and l.lit or l.raise if aH.edge then aH.edge.Color=bR and l.accent or l.line aH.edge.Transparency=bR and 0.55 or 0.45 end
end function a.switch(uN,D5,D6,e7)local aZ=H("TextButton",{Name="Switch",Text=D5,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,e7 and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(uN)},uN)
ab(aZ,9)local au={edge=a.stroke(aZ,l.line,0.45)}au.title=P(aZ,D6,11,l.text,true,UDim2 .new(0,10,0,e7 and 4 or 0),UDim2 .new(1,-100,0,e7 and 15 or 28))
au.title.TextWrapped,au.title.TextTruncate=false,Enum.TextTruncate.AtEnd if e7 then au.sub=P(aZ,e7,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
au.sub.TextWrapped,au.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end au.pill=H("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},aZ)ab(au.pill,9)au.knob=H("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},au.pill)ab(au.knob,7)au.chip=H("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},aZ)
ab(au.chip,9)a.pad(au.chip,10,0,10,0)H("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},au.chip)
au.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[aZ]=au T(aZ:GetPropertyChangedSignal("Text"):Connect(function()a.skin(aZ)end))
a.skin(aZ)return aZ end function a.chips(mK)if a.sw[mK]then a.sw[mK].chips=true a.skin(mK)end end function a.line(D7,D8)
local uO=a.row(D7,15)local uP=H("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=D8 or l.dim,
BorderSizePixel=0},uO)ab(uP,3)local mL=P(uO,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mL.TextWrapped,mL.TextTruncate=false,Enum.TextTruncate.AtEnd
return mL,uP end function a.grow(uQ,D9,D_)local hQ=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=D9 or 10,TextColor3=D_ or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(uQ)},uQ)
T(hQ:GetPropertyChangedSignal("Text"):Connect(function()hQ.Visible=hQ.Text~=""end))return hQ end function a.note(Ea,Eb)
local uR=a.grow(Ea,9,l.dim)uR.Text=Eb return uR end function a.actions(Ec,uS)local Ed=a.row(Ec,28)local uT,mM={},#uS
for e8,uU in ipairs(uS)do uT[e8]=ai(Ed,uU[1],uU[2]or l.panel2,10,UDim2 .new((e8-1)/mM,e8>1 and 3 or 0,0,0),UDim2 .new(1/mM,(e8>1 and-3 or 0)+(e8<mM and-3 or 0),1,0))
end return table.unpack(uT)end local function M(cv,hR,Ee,Ef)a.put(cv,hR and Ee or Ef)if not a.sw[cv]and a.lit[cv]~=hR then
a.lit[cv]=hR cv.BackgroundColor3=hR and l.accent or l.panel2 cv.TextColor3=a.ink(cv.BackgroundColor3)end end a.title=H("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)H("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
H("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local mN=H("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(mN,8)a.grad(mN,l.accent,l.accent2,45)local uV=P(mN,"C",16,l.ink,true)uV.Font,uV.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local Eg=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))Eg.Font=ae.x P(a.title,"butter farm  "..bY,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local Eh=a.list(a.tabs,3)pcall(function()Eh.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function br(Ei,Ej,Ek)
local hS=H("TextButton",{Text=Ei,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(hS,9)local uW=H("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hS)ab(uW,2)a.tabsAll[#a.tabsAll+1]={b=hS,bar=uW,name=Ej,sub=Ek}return hS end
a.tabFarm=br("🏠","Home","what the farm is doing")a.tabRun=br("🌾","Farm","the buy - wax - collect loop")a.tabBut=br("🧈","Butters","what gets bought and waxed")
a.tabCrt=br("📦","Crates","which crates get opened")a.tabPet=br("🐾","Pets","adopt, wish, fuse")a.tabTeam=br("👥","Teams","the right pets at the right moment")
a.tabSrv=br("🤝","Server","helping, campfire, ghost")a.tabAdm=br("⚡","Admin","admin abuse and its boosts")a.tabSet=br("⚙","Settings","configs, startup, performance")
local function bs()local mO=H("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mO,8)a.pad(mO,8,2,10,12)return mO end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs(),bs()a.farm.Visible=true
do local e9=a.farm local uX=a.row(e9,34)a.startB=ai(uX,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(uX,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local El=a.row(e9,44)local function e_(uY,Em,uZ)local hT=H("Frame",{Position=UDim2 .new((uY-1)/uZ,uY>1 and 2 or 0,0,0),Size=UDim2 .new(1/uZ,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},El)ab(hT,9)a.stroke(hT,l.line,0.3)local hU=P(hT,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hU.Font,hU.TextXAlignment,hU.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local En=P(hT,Em,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
En.TextXAlignment=Enum.TextXAlignment.Center return hU end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e_(1,"BOUGHT",5),e_(2,"WAXED",5),e_(3,"SOLD",5),e_(4,"MONEY",5),e_(5,"FREE",5)
local u0=a.card(e9,"Right now")a.info=P(a.row(u0,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(u0,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fa=a.card(e9,"Systems")
a.helpL=a.line(fa,l.info)a.campL=a.line(fa,l.accent2)a.questL=a.line(fa,l.good)a.arL=a.line(fa,l.accent)a.ixL=a.line(fa,mr.Dotonbori)
local u1=a.card(e9,"Activity")a.log=H("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(u1)},u1)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function If(Eo,Ep)return a.row(Ep or a.farm,Eo)end local al do local mP=a.run
a.heading(mP,"Farm","buy what rolls, wax it, collect the cash")local fb=a.card(mP,"Loop")a.colT=a.switch(fb,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(fb,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hH(al,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fb,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fb,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fb,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local mQ=a.card(mP,"By hand")
a.buyB,a.plB=a.actions(mQ,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(mQ,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(mQ,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local hV=a.but a.heading(hV,"Butters","what gets bought and waxed")local u2=a.card(hV,"Strategy")a.ixT=a.switch(u2,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(u2,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hV)},hV)a.list(a.butList,5)end do local hW=a.crt a.heading(hW,"Crates","only ticked crates are opened")
local u3=a.card(hW,"Opening")a.crateT=a.switch(u3,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(u3,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hW)},hW)a.list(a.crtList,5)end do local hX=a.pet a.heading(hX,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local fc=a.card(hX,"Automatic")a.pbT=a.switch(fc,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fc,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(fc,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(fc,10,l.dim)a.note(fc,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hX)},hX)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hY=a.srv a.heading(hY,"Server","other players, the campfire, staying hidden")
local mR=a.card(hY,"Helping")a.helpT=a.switch(mR,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(mR,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mR,l.info)
local u4=a.card(hY,"Campfire")a.campT=a.switch(u4,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(u4,l.accent2)local mS=a.card(hY,"Ghost")a.ghostT=a.switch(mS,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mS,l.dim)a.note(mS,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fd=a.adm a.heading(fd,"Admin abuse","the show, its boosts and the farm in it")local u5=a.card(fd,"When")
a.admBig=P(a.row(u5,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(u5,14),"",10,l.dim,false)local Eq=a.card(fd,"Boosts now")
a.admBoost=a.grow(Eq,11,l.text)local mT=a.card(fd,"What the farm does")a.shT=a.switch(mT,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mT,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(mT,l.accent)
local u6=a.card(fd,"Show feed")a.admFeed=H("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(u6)},u6)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local dk=a.set a.heading(dk,"Settings","kept on your phone, per config")
local hZ=a.card(dk,"Config")al=a.row(hZ,28)a.cfgName=hH(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hZ,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hZ,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(hZ,10,l.dim)local mU=a.card(dk,"Starting")a.startT=a.switch(mU,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mU,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(mU,9,l.dim)local mV=a.card(dk,"If the game drops me")
a.rejT=a.switch(mV,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(mV,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(mV,9,l.dim)local bt=a.card(dk,"Performance")a.pfCalm=a.switch(bt,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bt,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bt,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bt,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bt,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bt,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bt,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hH(al,tostring(e.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bt,l.good)a.note(bt,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local Er=a.card(dk,"About")a.note(Er,"CHURN "..bY.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Ig,Es in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(Es)end local u7=H("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},mv)
a.tgRoot=H("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},u7)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=H("TextButton",{Text="C",Size=uz,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=H("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=H("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fe=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fe][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fe][2]
a.tgGhost.BackgroundColor3=fe==2 and l.accent or(fe==1 and l.warn or l.panel)a.tgGhost.TextColor3=fe>0 and l.ink or l.dim
end end local bu={built=false,boxes={},at=0}function a.check(h0,mW)h0 .Text=mW and"✓"or""h0 .BackgroundColor3=mW and l.accent or l.bg
h0 .TextColor3=l.ink local mX=h0 .Parent if mX and mX:IsA("TextButton")then mX.BackgroundColor3=mW and l.lit or l.raise end
end local function u8(u9,u_)e.Targets[u9]=u_ or nil local va=bu.boxes[u9]if va then a.check(va,u_)end end local function mY()
for Et,Eu in pairs(bu.boxes)do a.check(Eu,e.Targets[Et]==true)end end function a.tickBox(Ev)local mZ=H("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Ev)ab(mZ,6)
a.stroke(mZ,l.line,0)return mZ end local ff local function Ew()local Ex=a.card(a.butList,"Butter list")local m0=a.row(Ex,26)
a.butInfo=P(m0,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local Ey=ai(m0,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Ez=ai(m0,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))Ey.MouseButton1Click:Connect(function()
for EA in pairs(e.Targets)do e.Targets[EA]=nil end mY()end)Ez.MouseButton1Click:Connect(function()ad.at=0 i_()
ff(true)end)end ff=function(EB)if not i_()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bu.built and not EB and bu.at==ad.at then return end for Ih,h1 in ipairs(a.butList:GetChildren())do
if h1:IsA("Frame")or h1:IsA("TextButton")or h1:IsA("TextLabel")then h1:Destroy()end end bu.boxes,a.butEmpty={},nil
Ew()for Ii,h2 in ipairs(ad.rarOrder)do local m1=mr[h2]or l.text local cw=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cw,11)a.stroke(cw,m1,0.7)a.list(cw,4)a.pad(cw,7,7,7,8)
local m2=a.row(cw,22)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=m1,BorderSizePixel=0},m2)
local EC=P(m2,h2:upper(),11,m1,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))EC.Font=ae.x local ED=ai(m2,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local EE=h2 ED.MouseButton1Click:Connect(function()local vb=ad.members[EE]or{}local vc=false for Ij,EF in ipairs(vb)do if not e.Targets[EF]then vc=true break end end
for Ik,EG in ipairs(vb)do u8(EG,vc)end end)for Il,m3 in ipairs(ad.members[h2]or{})do local h3=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cw)},cw)ab(h3,8)local vd=P(h3,ak(m3),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
vd.TextWrapped,vd.TextTruncate=false,Enum.TextTruncate.AtEnd local ve=a.tickBox(h3)bu.boxes[m3]=ve local vf=m3
local function vg()u8(vf,not e.Targets[vf])end h3 .MouseButton1Click:Connect(vg)ve.MouseButton1Click:Connect(vg)
end end mY()bu.built,bu.at=true,ad.at end function L.paint()for EH,EI in pairs(L.boxes)do a.check(EI,e.CrateTicks[EH]==true)end
if a.crtInfo then local m4,m5=0,0 for Im in pairs(L.boxes)do m4=m4+1 end for In,EJ in pairs(e.CrateTicks)do if EJ then m5=m5+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(m4,m5))end if a.crateT then M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for Io,h4 in ipairs(a.crtList:GetChildren())do if h4:IsA("Frame")or h4:IsA("TextButton")or h4:IsA("TextLabel")then h4:Destroy()end
end L.boxes={}local m6=a.card(a.crtList,"All of them","worst first")local m7=a.row(m6,26)a.crtInfo=P(m7,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local EK=ai(m7,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local EL=ai(m7,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(EK.MouseButton1Click:Connect(function()e.CrateTicks={}L.paint()end))T(EL.MouseButton1Click:Connect(function()L.build()end))
for Ip,bv in ipairs(L.list())do local vh=mr[bv.rar or""]or l.text local dl=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(m6)},m6)ab(dl,8)H("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=vh,BorderSizePixel=0},dl)
local vi=P(dl,(bv.title or bv.name)..(bv.guess and"  (?)"or""),11,vh,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
vi.TextWrapped,vi.TextTruncate=false,Enum.TextTruncate.AtEnd local EM=P(dl,bv.price and("$"..aK(bv.price))or(bv.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
EM.TextXAlignment=Enum.TextXAlignment.Right local vj=a.tickBox(dl)L.boxes[bv.k]=vj local vk=bv.k local function vl()
e.CrateTicks[vk]=(not e.CrateTicks[vk])or nil L.paint()end T(dl.MouseButton1Click:Connect(vl))T(vj.MouseButton1Click:Connect(vl))
end L.built=L.at L.paint()end local vm="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a0(cx)vm=cx for EN,m8 in ipairs(a.tabKeys)do a[m8].Visible=(m8==cx)local h5=a.tabsAll[EN]if h5 then
local m9=m8==cx h5 .b.BackgroundTransparency,h5 .b.TextTransparency,h5 .bar.Visible=m9 and 0 or 1,m9 and 0 or 0.45,m9
end end if cx=="pet"and not q.built then pcall(q.build)end if cx=="team"and not z.built then pcall(z.build)end
if cx=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cx=="but"then ff(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(m_,vn,vo,vp)if vp then m_.Text=vp end m_.BackgroundColor3=vn and vo or l.bg m_.TextColor3=vn and a.ink(vo)or l.dim
end function q.paintRow(vq)local cy=q.rows and q.rows[vq]if not cy then return end local cz=e.Pets[vq]or{}local fg=tonumber(cz.f)or 0
a.flag(cy.b,cz.b,l.good)a.flag(cy.g,cz.g,l.accent,cz.g and"BIG"or"ANY")a.flag(cy.w,cz.w,l.warn)a.flag(cy.f,fg>0,l.good,fg>=7 and"7 BIG/HUGE"or(fg>0 and(fg.." BIG")or"FUSE"))
if cy.row then cy.row.BackgroundColor3=(cz.b or cz.w or fg>0)and l.lit or l.raise end end function q.flag(na,h6)
local a8=e.Pets[na]or{}if h6=="f"then local EO={[0]=1,[1]=2,[2]=3,[3]=7}local vr=EO[tonumber(a8 .f)or 0]or 0 a8 .f=vr>0 and vr or nil
elseif a8[h6]then a8[h6]=nil else a8[h6]=true end e.Pets[na]=(a8 .b or a8 .g or a8 .w or a8 .f)and a8 or nil q.paintRow(na)
end function q.paintAll()for EP in pairs(q.rows or{})do q.paintRow(EP)end if a.pbT then M(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local nb=q.wishes()local fh=q.data()for h7,nc in pairs(q.rows)do local vs=C.status(h7,fh)nc.desc.Text=(nb[h7]and("wishing %dm | "):format(math.ceil(nb[h7]/60))or"")..(vs and(vs.." | ")or"")..nc.boostText
nc.desc.TextColor3=nb[h7]and l.text or l.dim end local vt=tonumber(J:GetAttribute("PetWishCredits"))or 0 a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(fh and#(fh.pets or{})or 0,fh and tonumber(fh.maxOwned)or 60,
aK(q.money()),vt>0 and(" | free wishes "..vt)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local h8=q.info()for Iq,h9 in ipairs(a.petList:GetChildren())do if h9:IsA("Frame")or h9:IsA("TextLabel")or h9:IsA("TextButton")then h9:Destroy()end
end q.rows={}if not h8 then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dm={}for Ir,vu in ipairs(q.order())do local nd=h8 .Pets[vu].rarity or"?"dm[nd]=dm[nd]or{}
table.insert(dm[nd],vu)end local dn={}for Is,vv in ipairs(h8 .Rarities or{})do if dm[vv]then dn[#dn+1]=vv end end
for vw in pairs(dm)do if not table.find(dn,vw)then dn[#dn+1]=vw end end for It,ne in ipairs(dn)do local h_=q.RC[ne]or l.text
local cA=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cA,11)a.stroke(cA,h_,0.7)a.list(cA,4)a.pad(cA,7,7,7,8)local vx=a.row(cA,18)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=h_,BorderSizePixel=0},vx)
local EQ=P(vx,ne:upper(),11,h_,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))EQ.Font=ae.x for Iu,ia in ipairs(dm[ne])do
local fi=H("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cA)},cA)
ab(fi,8)local nf=P(fi,q.nice(ia),11,h_,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))nf.TextWrapped,nf.TextTruncate=false,Enum.TextTruncate.AtEnd
local ER,ES=pcall(function()return h8 .describe(ia)end)local vy=ER and tostring(ES)or""local ng=P(fi,vy,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
ng.TextYAlignment,ng.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function ib(ET,EU,EW)
local vz=ai(fi,ET,l.bg,8,UDim2 .new(1,EU,0,5),UDim2 .new(0,EW,0,22))vz.AutoButtonColor=true return vz end local vA,vB,vC,vD=ib("BUY",-164,30),ib("ANY",-131,30),ib("WISH",-98,34),ib("FUSE",-61,56)
local ic=ia vA.MouseButton1Click:Connect(function()q.flag(ic,"b")end)vB.MouseButton1Click:Connect(function()q.flag(ic,"g")end)
vC.MouseButton1Click:Connect(function()q.flag(ic,"w")end)vD.MouseButton1Click:Connect(function()q.flag(ic,"f")end)
q.rows[ia]={b=vA,g=vB,w=vC,f=vD,name=nf,desc=ng,boostText=vy,row=fi}end end q.built=true q.paintAll()end function d.paint()
M(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])M(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end T(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local EX=table.find(d.CAPS,e.FpsCap or 0)or 1 local vE=d.CAPS[(EX%#d.CAPS)+1]
if not d.cap(vE)and vE~=0 then A("this executor cannot cap fps")end d.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local nh=tonumber(a.pfMem.Text)if nh and nh>=0 then e.MemLimit=math.floor(nh)end d.paint()end))function z.names()
local ni={"(none)"}for Iv,EY in ipairs((z.teams()))do ni[#ni+1]=EY.name end return ni end function z.cycle(nj,EZ)
local ie=z.names()local E0=e[nj]~=""and e[nj]or"(none)"local ig=table.find(ie,E0)or 1 ig=((ig-1+EZ)%#ie)+1 e[nj]=ie[ig]=="(none)"and""or ie[ig]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local nk={}for Iw,E1 in ipairs((z.teams()))do nk[E1 .name]=true end
for E2,vF in pairs(z.pick)do local dp=e[E2]vF.Text=dp==""and"(none)"or(nk[dp]and dp or(dp.." (missing)"))vF.TextColor3=(dp~=""and not nk[dp])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local E3,ih=q.srv(),{}for Ix,ii in ipairs(z.list or{})do ih[#ih+1]=("st %-2s %-22s %9s  helps %d"):format(ii.st.Name,ak(W(ii.name)):sub(1,22),z.clock(ii.ends-E3),ii.helps)
end a.tmList.Text=#ih>0 and table.concat(ih,"\n")or"no waxes running"end function z.build()for Iy,ij in ipairs(a.teamList:GetChildren())do
if ij:IsA("Frame")or ij:IsA("TextLabel")or ij:IsA("TextButton")then ij:Destroy()end end z.pick={}local ik=a.card(a.teamList,"Automatic")
a.tmT=a.switch(ik,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(ik,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild z.paint()end)a.tmBuildNow=a.actions(ik,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local E4,E5=pcall(C.rebuild,"you asked")if not E4 then A("BUILD ERR "..tostring(E5))end end)
end)a.tmInfo=a.grow(ik,10,l.dim)local vG=a.card(a.teamList,"Which team when")local function il(im,E6,E7)local fj=a.row(vG,54)
P(fj,E6,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local vH=P(fj,E7,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
vH.TextWrapped,vH.TextTruncate=false,Enum.TextTruncate.AtEnd local E8=ai(fj,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local vI=ai(fj,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local E9=ai(fj,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
E8 .MouseButton1Click:Connect(function()z.cycle(im,-1)end)E9 .MouseButton1Click:Connect(function()z.cycle(im,1)end)
vI.MouseButton1Click:Connect(function()z.cycle(im,1)end)z.pick[im]=vI end il("TeamNormal","Normal","the rest of the time: money + luck")
il("TeamFull","Full","every station busy: money + wax speed")il("TeamGlaze","Glaze","worn just before a wax finishes")
local io=a.row(vG,26)P(io,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hH(io,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(io,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local E_=ai(io,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
E_.MouseButton1Click:Connect(function()local ip=tonumber(a.tmLead.Text)if ip and ip>=5 and ip<=600 then e.GlazeLead=math.floor(ip)else a.tmLead.Text=tostring(e.GlazeLead)end
z.paint()end)il("TeamWax","Wax","while a butter is placed: head starts")local vJ=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(vJ)},vJ)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local Fa=a.card(a.teamList,"How it works")a.note(Fa,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function Fb()a.secB.Text=tostring(e.Every)M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()o.paint()M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(d.unpin)end end)end
M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then eT(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bQ(a.root)bQ(a.tgRoot)c.lastCollect=y()
mY()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(d.applyAll)end local function Fc(vK)task.spawn(function()vK.TextColor3=l.bad
task.wait(0.8)if c.alive then vK.TextColor3=l.text end end)end local function vL()local vM=a.secB.Text:match("^%s*(%d+)%s*$")
local fk=vM and tonumber(vM)if not fk or fk<1 then a.secB.Text=tostring(e.Every)Fc(a.secB)A("interval must be a whole number >= 1")
return end if fk==e.Every then return end e.Every,c.lastCollect=fk,y()A("collect every "..fk.."s")end local function N(Fd,Fe)T(Fd.MouseButton1Click:Connect(Fe))end
N(a.secSet,vL)T(a.secB.FocusLost:Connect(vL))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,y()M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",s9)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help E.nextAt,E.msg=0,e.Help and"looking for waxes to help"or"off"M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests F.at=0 M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function o.paint()M(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
M(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(Ff)task.spawn(function()pcall(o.tick)if Ff and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local Fg=o.on()e.AutoIndex=not e.AutoIndex o.discAt=-100 o.changed(Fg)end)
N(a.bestT,function()local Fh=o.on()e.Best=((e.Best or 0)+1)%5 o.stackAt=-100 o.changed(Fh)end)N(a.bcT,function()
local Fi=o.on()e.BestCrate=not e.BestCrate o.changed(Fi)end)N(a.shT,function()e.Shower=not e.Shower o.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false o.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy q.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish q.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse q.paintAll()end)
function o.admPaint()local bS=q.srv()local bT pcall(function()o.aac=o.aac or require(af:FindFirstChild("AdminAbuseClient"))
bT=o.aac:GetState()end)local dq,bU="nothing scheduled","the game has not announced one"if type(bT)=="table"then
local fl,a1,bV=tostring(bT.Phase or""),tonumber(bT.StartsAt),tonumber(bT.EndsAt)if a1 and a1<1e9 then a1=nil end
if bV and bV<1e9 then bV=nil end if fl=="Countdown"and a1 then dq,bU="starts in "..z.clock(a1-bS),os.date("%a %H:%M",math.floor(a1)).." your time"
elseif fl=="Live"and bV then dq,bU="LIVE  -  "..z.clock(bV-bS).." left","the farm is grabbing, waxing and glazing through it"
elseif fl~=""and fl~="Idle"and bV and bV>bS then dq,bU=fl:lower().."  -  "..z.clock(bV-bS).." left","after the show"
elseif a1 and a1>bS then dq,bU="next: "..os.date("%a %H:%M",math.floor(a1)),"your time"elseif a1 then dq,bU="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a1)).." your time"
end if type(bT.Kind)=="string"and bT.Kind~=""then bU=bU.."  |  "..bT.Kind end end a.put(a.admBig,dq)a.put(a.admSub,bU)
local dr,nl={},af:FindFirstChild("AdminShow")if nl then local Fj,Fk=pcall(function()return nl:GetAttributes()end)
for vN,ds in pairs(Fj and Fk or{})do local iq=type(vN)=="string"and vN:match("^(.-)Mult$")local nm=iq and tonumber(nl:GetAttribute(iq.."Until"))
if iq and type(ds)=="number"and ds~=1 and ds~=0 and nm and nm>bS then dr[#dr+1]=("%s  x%s   %s left"):format(iq:gsub("(%l)(%u)","%1 %2"),(ds%1==0)and tostring(ds)or("%.2f"):format(ds),
z.clock(nm-bS))end end end table.sort(dr)a.put(a.admBoost,#dr>0 and table.concat(dr,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dr>0 and l.accent or l.dim local ir=0 for Iz in pairs(O.drops)do ir=ir+1 end local vO=o.snapAt and(o.snapAt-bS)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,ir>0 and(", "..ir.." falling")or"",
vO and("in "..math.max(0,math.floor(vO)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",d3,true)end)N(a.padB,function()c.plot=bw()or c.plot local vP,nn=ap(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(vP and nn and nn:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=nn.CFrame:ToObjectSpace(vP.HumanoidRootPart.CFrame)
B3(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eT(not c.running)end)N(a.buyB,function()
c.plot=bw()or c.plot task.spawn(as,"buying (manual)...",pk,true)end)N(a.plB,function()c.plot=bw()or c.plot task.spawn(as,"waxing (manual)...",po)
end)N(a.tabFarm,function()a0("farm")end)N(a.tabRun,function()a0("run")end)N(a.tabSrv,function()a0("srv")end)N(a.tabAdm,function()a0("adm")end)
N(a.tabBut,function()a0("but")end)N(a.tabSet,function()a0("set")end)N(a.tabCrt,function()a0("crt")end)N(a.tabPet,function()a0("pet")end)
N(a.tabTeam,function()a0("team")end)local function Fl(no)c.hidden=no a.root.Visible=not no a.tgBtn.TextColor3=no and l.text or l.ink
end uF(a.tgBtn,a.tgRoot,function()bQ(a.tgRoot)c.togPos=hM(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then Fl(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aI,aw={},0 local function bW()aI=oH()if#aI==0 then a.cfgPick.Text="(none saved)"
aw=0 return end if aw<1 or aw>#aI then aw=1 end a.cfgPick.Text=aI[aw]..("  (%d/%d)"):format(aw,#aI)end local function vQ()
local vR=c.autoload~=nil a.cfgAuto.Text=vR and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=vR and l.accent or l.panel2
end local function np()local vS=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if vS~=""then return vS end return(aw>0 and aI[aw])or""
end N(a.cfgSave,function()c.winPos=hM(a.root)or c.winPos c.togPos=hM(a.tgRoot)or c.togPos local vT,vU=f0(np())
a.cfgMsg.Text=vT and("saved as "..vU)or("could not save: "..vU)a.cfgMsg.TextColor3=vT and l.good or l.bad bW()
A(a.cfgMsg.Text)end)local function Fm(nq)local nr,vV=oQ(nq)a.cfgMsg.Text=nr and("loaded "..vV)or("could not load: "..vV)
a.cfgMsg.TextColor3=nr and l.good or l.bad if nr then a.cfgName.Text=nq Fb()task.spawn(D.apply,"config "..nq)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()Fm(np())end)N(a.cfgPick,function()bW()if aw>0 then a.cfgName.Text=aI[aw]end
end)N(a.cfgPrev,function()if#aI==0 then bW()return end aw=(aw-2)%#aI+1 bW()a.cfgName.Text=aI[aw]end)N(a.cfgNext,function()
if#aI==0 then bW()return end aw=aw%#aI+1 bW()a.cfgName.Text=aI[aw]end)N(a.cfgAuto,function()if c.autoload then
oS(nil)a.cfgMsg.Text="it will not load a config on launch"else local fm=np()local vW=false for IA,Fn in ipairs(oH())do if Fn==fm then vW=true end end
local Fo=vW or f0(fm)if Fo and fm~=""then oS(fm)bW()a.cfgMsg.Text=fm.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim vQ()end)N(a.autoB,function()
local vX,vY=xS()a.autoMsg.Text=vX and("installed. "..vY)or("failed: "..vY)a.autoMsg.TextColor3=vX and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dM("you asked")end)
local a9=false N(a.minB,function()a9=not a9 a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not a9,not a9,not a9
if a9 then for IB,Fp in ipairs(a.tabKeys)do a[Fp].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a0(vm)
end a.root.Size=UDim2 .new(0,Q.w,0,a9 and(Q.head+Q.status+12)or Q.h)a.minB.Text=a9 and"+"or"-"end)local function is()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(fA)for IC,Fq in ipairs(iB)do pcall(function()Fq:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()mw:Destroy()end)
pcall(function()u7:Destroy()end)if cC.SAB_KILL==is then cC.SAB_KILL=nil end end cC.SAB_KILL=is N(a.killB,is)N(a.xB,is)
uF(a.title,a.root,function()bQ(a.root)c.winPos=hM(a.root)or c.winPos end)local function vZ()local fn,cB=c.reason,c.level
if c.busy then fn,cB=c.busyText,"ok"elseif not c.running then local ID,v0,Fr=tK()if c.capHit then fn,cB=v0,"bad"else fn,cB="[stopped] "..v0,(Fr=="bad")and"bad"or"idle"end
c.reason,c.level=fn,cB end local dt=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dt then
a.lit.dot=dt a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dt,dt,dt,dt a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fn)if a.lit.bar~=cB then a.lit.bar=cB a.bar.BackgroundColor3=De[cB]or l.dim end
if a9 then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bX=xr()if a.farm.Visible then local Fs,Ft=fw()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Fs.."/"..Ft)local v1=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(y()-c.lastCollect)))or nil
local v2=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aK(a_()),c.rolls,c.gifts,c.crates,v2 and ak(W(v2))or"nothing",j.on and("   ["..j.title.." window open]")or"",
v1 and("in "..v1 .."s")or"off"))a.put(a.tgt,(#bX==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bX<=3)and table.concat(bX,", ")or(#bX.." butters ticked"))))
if a.lit.tgt~=(#bX==0)then a.lit.tgt=(#bX==0)a.tgt.TextColor3=(#bX==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fq,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,e.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bX))
end if a.but.Visible and bu.at~=ad.at then ff(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(e.Campfire and K.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local v3=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",v3~=""and v3 or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cC.SAB={S=c,CFG=e,EV=V,U=a,sg=mw,CAT=ad,LEARN=aj,buildList=ff,
logAll=du,evAll=dv,AR=D,CR=L,PF=d,PX=q,TM=z,CRATE=j,FU=C,HX=E,CF=K,QX=F,IX=o,SH=O}A(bY.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a0("farm")bQ(a.root)bQ(a.tgRoot)if hJ then pcall(function()T(hJ:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bQ(a.root)bQ(a.tgRoot)end))end)end bW()vQ()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(vZ)task.spawn(function()local v4=xQ()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(v4 and("\n(backup: "..v4 ..")")or"")
local v5=fU(an.exec)if v5 and not v5:find("SAB autoloader v2",1,true)then dI(an.exec,an.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fU(an.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(xY)end)task.spawn(function()while c.alive do local Fu,Fv=pcall(vZ)if not Fu then A("UI ERR "..tostring(Fv))end
task.wait((c.hidden or a9)and 1.5 or 0.4)end end)task.spawn(function()local Fw,Fx=pcall(x6)if not Fw then A("HOOK ERR "..tostring(Fx))end
end)task.spawn(function()pcall(wO)if j.loadSeq and not j.learned then local it={}for v6=1,20 do if j.loadSeq[v6]then it[#it+1]=j.loadSeq[v6]end end
if#it>0 then j.learned={seq=it,mode=j.loadMode}A("remembered how to open crates directly")end end if i_()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local Fy,v7=pcall(B5)if Fy and v7 and c.alive and not c.manualPad then c.manualPad=v7 end end)task.spawn(function()
while c.alive do local ns,nt=pcall(q.buyTick)if not ns then A("PET ERR "..tostring(nt))task.wait(5)end ns,nt=pcall(q.wishTick)
if not ns then A("WISH ERR "..tostring(nt))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local iu,v8=0,y()
T(game:GetService("RunService").Heartbeat:Connect(function()iu=iu+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
T(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=y()
while c.alive do task.wait(1)local v9=y()d.fps,iu,v8=iu/math.max(v9-v8,0.001),0,v9 local Fz,FA=pcall(d.tick)if not Fz then A("PERF ERR "..tostring(FA))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local FB,FC=pcall(C.tick)if not FB then A("FUSE ERR "..tostring(FC))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local FD,FE=pcall(z.tick)if not FD then A("TEAM ERR "..tostring(FE))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local iv=af:WaitForChild("Remotes",30)local v_=iv and iv:WaitForChild("ClanEvent",30)
if v_ and c.alive then T(v_.OnClientEvent:Connect(function(FF,FG)if FF=="call"then pcall(E.onCall,FG)end end))
end local wa=iv and iv:FindFirstChild("RollConfirmAsk")if wa and c.alive then T(wa.OnClientEvent:Connect(function(FH)F.asked=FH or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)end end end)task.spawn(function()
local nu=af:WaitForChild("Remotes",30)if not(nu and c.alive)then return end local function iw(FI,FJ)local nv=nu:FindFirstChild(FI)
if nv and nv:IsA("RemoteEvent")then T(nv.OnClientEvent:Connect(function(...)pcall(FJ,...)end))end end iw("NewSquishyDiscovered",function(nw,wb)
if type(nw)~="string"then return end o.disc=o.disc or{}o.disc[W(nw)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(nw)),wb and(" ("..tostring(wb)..")")or""))
end)iw("IndexRefresh",o.loadDisc)iw("IndexRowComplete",function(FK)A("INDEX: the whole "..tostring(FK).." row is complete")end)
iw("AdminShow",o.admin)local wc=nu:FindFirstChild("AdminShowSync")if wc then local FL,wd=pcall(function()return wc:InvokeServer()end)
if FL and type(wd)=="table"then for IE,FM in pairs(wd)do pcall(O.add,FM)end end end while c.alive do local FN,FO=pcall(o.tick)
if not FN then o.msg="index error: "..tostring(FO)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local FP,FQ=pcall(F.tick)if not FP then A("QUEST ERR "..tostring(FQ))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(fA)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local FS=(type(newcclosure)=="function")and newcclosure or function(FR)return FR end local nx
local we=(type(setnamecallmethod)=="function")and setnamecallmethod or nil nx=hookmetamethod(game,"__namecall",FS(function(wf,...)
local fo=getnamecallmethod()if c.alive and(fo=="InvokeServer"or fo=="FireServer")then local wg,wh=pcall(function()return wf.Name end)
if wg and wh=="CrateAction"and not j.replaying then pcall(j.saw,fo,...)elseif wg and wh=="AutoRollAction"and not D.replaying then pcall(D.saw,fo,...)end
if we then we(fo)end end return nx(wf,...)end))j.oldNC=nx end)end if iz then T(J.Idled:Connect(function()pcall(function()iz:CaptureController()iz:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for IF=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ap()and(c.plot or bw())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local ix=b3()
if ix and o.on()and not aJ(ix.name)then ix=nil end if c.alive and e.AutoRoll and c.running and not D.isOn()and not ix and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for IG=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bw()if ap()and c.plot and o.any()then eT(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bw()c.lastCollect=y()while c.alive do if c.running then local FT,wi=pcall(C_)if not FT and wi~=iA then A("LOOP ERR "..tostring(wi))end
end task.wait(0.1)end end)iy("ready - the window is at the top left")end local FW,ny=xpcall(wm,function(FV)return tostring(FV).."\n"..debug.traceback()end)
if not FW then pcall(function()warn("SAB "..bY.." ERROR: "..tostring(ny))end)iy("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bY.." ERROR: "..tostring(ny))end)pcall(function()local wj=(type(getgenv)=="function"and getgenv())or _G
if type(wj.SAB_KILL)=="function"then wj.SAB_KILL()end for IH,FX in ipairs({"SABFarmGui","SABToggle"})do local wk=J.PlayerGui:FindFirstChild(FX)
if wk then wk:Destroy()end end end)pcall(function()local fp=Instance.new("ScreenGui")fp.Name="SABError"fp.ResetOnSpawn=false
fp.DisplayOrder=1000 local a2=Instance.new("TextBox")a2 .Size=UDim2 .new(0,340,0,170)a2 .Position=UDim2 .new(0,10,0,50)
a2 .BackgroundColor3=Color3 .fromRGB(90,20,20)a2 .TextColor3=Color3 .new(1,1,1)a2 .TextSize=11 a2 .TextWrapped=true
a2 .ClearTextOnFocus=false a2 .TextXAlignment=Enum.TextXAlignment.Left a2 .TextYAlignment=Enum.TextYAlignment.Top
a2 .Text="SAB "..bY.." failed to start. Send this text:\n"..tostring(ny)a2 .Parent=fp fp.Parent=J:WaitForChild("PlayerGui")
end)end
