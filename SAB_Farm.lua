local bX="v27"local m7=game:GetService("Players")local J=m7 .LocalPlayer or m7 .PlayerAdded:Wait()local function ih(vx)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bX,Text=vx,Duration=6})
end)end ih("script started")local function vy()local ah=game:GetService("ReplicatedStorage")local au=game:GetService("Workspace")
local m8=game:GetService("UserInputService")local cB=(type(getgenv)=="function"and getgenv())or _G if type(cB.SAB_KILL)=="function"then pcall(cB.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local ii=(function()local vz,vA=pcall(function()return game:GetService("VirtualUser")end)return vz and vA or nil end)()
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
local q,z,j,C,E,K,F={},{},{},{},{},{},{}local o,O={},{}local ij={}local ik,fk,ds,dt={},{},{},{}local function T(m9)ik[#ik+1]=m9 return m9 end
local function af(vB)task.wait(vB)if not c.alive then error(ij,0)end end local function A(fl)fl=os.date("%H:%M:%S").." "..tostring(fl)
table.insert(fk,1,fl)if#fk>6 then table.remove(fk)end c.logN=(c.logN or 0)+1 ds[#ds+1]=fl if#ds>80 then table.remove(ds,1)end
end local function fm(m_)if type(m_)~="string"then return""end return(m_:lower():gsub("[^%w]",""))end local function W(vC)
local na=fm(vC)local il=na:gsub("butter$","")if il==""then il=na end return il end local function aK(nb)if type(nb)~="string"then return false end
local im=W(nb)if im==""then return false end if o.want then return o.want(im)end return d.Targets[im]==true end
local function vD(du)du=du:lower()return du:find("squishy",1,true)~=nil or du:match("butter$")~=nil or du:match("butter[^%a]")~=nil
end local io={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aL(dv)if type(dv)~="number"then return"?"end
local fn=1 while math.abs(dv)>=1000 and fn<#io do dv=dv/1000 fn=fn+1 end local vE=string.format("%.2f",dv):gsub("%.?0+$","")
return vE..io[fn]end local function vF(nc)if type(nc)~="string"then return nil end local vG,dw=nc:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local ip=tonumber(vG)if not ip then return nil end if dw==""then return ip end local vH={qd="qa",qn="qi"}dw=vH[dw:lower()]or dw
for vI,vJ in ipairs(io)do if vJ:lower()==dw:lower()then return ip*1000^(vI-1)end end return nil end local function a_()
local nd=J:GetAttribute("BoardValueMoney")if type(nd)=="number"then return nd end local ne=J:FindFirstChild("leaderstats")
if ne then for EH,vK in ipairs({"Cash","Money","Coins"})do local iq=ne:FindFirstChild(vK)if iq and type(iq.Value)=="number"then return iq.Value end
end end end local function fo(vL)local ir=vL:GetFullName()if c.plot then local is=c.plot:GetFullName()if ir:sub(1,#is)==is then return ir:sub(#is+2)end
end return ir end local function ao()local fp=J.Character if fp and fp:FindFirstChild("HumanoidRootPart")then
local nf=fp:FindFirstChildOfClass("Humanoid")if nf and nf.Health>0 then return fp end end end local function bv()
local it=au:FindFirstChild("Plots")if not it then return nil end local function ng(vM)local nh=vM:FindFirstChild("Plate")
return nh~=nil and nh:FindFirstChild("EditStackAttachment",true)~=nil end local ni=J:GetAttribute("PlotNumber")
if ni~=nil then local iu=it:FindFirstChild(tostring(ni))if iu and ng(iu)then return iu end end for EI,nj in ipairs(it:GetChildren())do
if ng(nj)then return nj end end end local function dx(nk)local bw=nk and nk.Parent for EJ=1,6 do if not bw then return nil end
if bw:IsA("BasePart")then return bw end if bw:IsA("Model")then return bw.PrimaryPart or bw:FindFirstChildWhichIsA("BasePart",true)end
bw=bw.Parent end end local function nl(nm)local iv=nm.Parent if iv and iv:IsA("Attachment")then return iv.WorldPosition end
local nn=dx(nm)return nn and nn.Position end local function no()local cC=c.plot and c.plot:FindFirstChild("Plate")
if not cC then return nil end if cC:IsA("BasePart")then return cC.Position end if cC:IsA("Model")then return cC:GetPivot().Position end
local np=cC:FindFirstChildWhichIsA("BasePart",true)return np and np.Position end local function nq()local iw={}
local nr=c.plot and c.plot:FindFirstChild("WaxStations")if nr then for EK,vN in ipairs(nr:GetChildren())do local ns=vN:FindFirstChild("SquishyPlaceHolder")
local ix=ns and ns:FindFirstChild("PlacePrompt")if ix and ix:IsA("ProximityPrompt")then iw[#iw+1]=ix end end end
return iw end local function fq()local nt,iy=nq(),0 for EL,vO in ipairs(nt)do if vO.Enabled then iy=iy+1 end end
local iz=#nt local iA=J:GetAttribute("WaxStations")if type(iA)=="number"and iA>iz then iz=iA end return iy,iz
end local function vP()local nu=ao()local nv=nu and nu.HumanoidRootPart.Position local iB,nw for EM,iC in ipairs(nq())do
if iC.Enabled then local nx=nl(iC)local ny=(nx and nv)and(nx-nv).Magnitude or 1e9 if not iB or ny<nw then iB,nw=iC,ny end
end end return iB end local function nz()local fr=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fr then return nil end local nA=fr:FindFirstChild("BuyPromptAttachment")local fs=(nA and nA:FindFirstChild("BuyPrompt"))or fr:FindFirstChild("BuyPrompt",true)
if fs and fs:IsA("ProximityPrompt")and fs:IsDescendantOf(fr)then return fs end end local nB={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local vQ={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iD="SAB_order.txt"local function ft()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for vR,vS in pairs(aj.price)do aB[#aB+1]="P|"..vR.."|"..string.format("%.0f",vS)end for vT,vU in pairs(aj.order)do aB[#aB+1]="O|"..vT.."|"..table.concat(vU,",")end
if e.learned and e.enc then aB[#aB+1]="M|mode|"..tostring(e.learned.mode or"")for vV,fu in ipairs(e.learned.seq)do
local nC={}for nD=1,fu.n do nC[nD]=e.enc(fu.args[nD])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(vV,fu.m,fu.n,table.concat(nC,";"))
end end local function iE(vW,vX,fv)local nE={}for nF=1,fv.n do nE[nF]=e.enc(fv.args[nF])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(vX,vW,fv.m,fv.n,table.concat(nE,";"))
end if e.enc then for vY,vZ in ipairs(D.rec.rules)do iE("rules",vY,vZ)end if D.rec.on then iE("on",0,D.rec.on)end
if D.rec.off then iE("off",0,D.rec.off)end end for EN,dy in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dy.name,dy.title or"",dy.rar or"",dy.price and string.format("%.0f",dy.price)or"")
end if pcall(writefile,iD,table.concat(aB,"\n"))then aj.dirty=false end end local function v0()if type(isfile)~="function"or type(readfile)~="function"then return end
local v1,v2=pcall(isfile,iD)if not(v1 and v2)then return end local v3,nG=pcall(readfile,iD)if not(v3 and type(nG)=="string")then return end
for v4 in nG:gmatch("[^\n]+")do local cD,cE,ba=v4:match("^(%a)|([^|]+)|(.*)$")if cD=="P"then aj.price[cE]=tonumber(ba)
elseif cD=="M"then e.loadMode=(ba~=""and ba~="nil")and ba or nil elseif cD=="A"and e.dec then local nH=tonumber(cE)
local nI,fw,v5=ba:match("^([^|]+)|(%d+)|(.*)$")if nH and nI then fw=tonumber(fw)local nJ,fy={},0 for v6 in(v5 ..";"):gmatch("([^;]*);")do
fy=fy+1 if fy<=fw then nJ[fy]=e.dec(v6)end end e.loadSeq=e.loadSeq or{}e.loadSeq[nH]={m=nI,n=fw,args=nJ}end elseif cD=="R"and e.dec then
local nK=tonumber(cE)local fz,v7,fA,v8=ba:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if nK and fz then fA=tonumber(fA)
local nL,fB={},0 for v9 in(v8 ..";"):gmatch("([^;]*);")do fB=fB+1 if fB<=fA then nL[fB]=e.dec(v9)end end local iF={m=v7,n=fA,args=nL}
if fz=="rules"then D.rec.rules[nK]=iF elseif fz=="on"then D.rec.on=iF elseif fz=="off"then D.rec.off=iF end end
elseif cD=="K"then local nM,nN,v_=ba:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cE)]={name=cE,title=nM~=""and nM or nil,
rar=nN~=""and nN or nil,price=tonumber(v_)}elseif cD=="O"and ba~=""then local fC={}for wa in ba:gmatch("[^,]+")do fC[#fC+1]=wa end
if#fC>0 then aj.order[cE]=fC end end end end local function wb(fD)if type(fD)~="table"then return end local bY,nO=fD.rarity,fD.contents
if type(bY)~="string"or bY==""or type(nO)~="table"then return end local dz={}for EO,fE in ipairs(nO)do if type(fE)=="table"and type(fE.butter)=="string"then
dz[#dz+1]={n=fE.butter,ch=tonumber(fE.chance)or 0}end end if#dz==0 then return end table.sort(dz,function(wc,wd)return wc.ch>wd.ch end)
local dA,dB={},false for we,wf in ipairs(dz)do dA[we]=wf.n end local iG=aj.order[bY]if not iG or#iG~=#dA then dB=true end
if not dB then for nP=1,#dA do if iG[nP]~=dA[nP]then dB=true break end end end aj.order[bY]=dA local iH=tonumber(fD.price)
if iH and aj.price[bY]~=iH then aj.price[bY]=iH dB=true end if dB then aj.dirty=true ad.at=0 A("learned the "..bY.." order from its crate")
end end local function cF(wg,wh)local wi=wg:FindFirstChild(wh,true)local wj,iI=pcall(function()return wi.Text end)
return(wj and type(iI)=="string"and iI~="")and iI or nil end local function ak(nQ)return ad.pretty[nQ]or nQ end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(wk)return fm(wk or"")end
function L.learn(bc)if type(bc)~="table"or type(bc.name)~="string"then return end local iJ=L.key(bc.name)local bd=L.seen[iJ]or{}
local wl=(L.seen[iJ]==nil)or(tonumber(bc.price)and bd.price~=tonumber(bc.price))bd.name,bd.title=bc.name,bc.title or bd.title
bd.rar,bd.price=bc.rarity or bd.rar,tonumber(bc.price)or bd.price L.seen[iJ]=bd if wl then L.at,aj.dirty=y(),true end
end function L.wanted(nR)if nR==nil then return false end local iK=L.key(nR)return d.CrateTicks[iK]==true or(d.BestCrate and o.bestCrate~=nil and(iK==o.bestCrate or iK==o.bestCrateTitle))
end function L.list()local cG={}for wm,fF in ipairs(L.base)do cG[L.key(fF[1])]={name=fF[1],title=fF[2],rar=fF[3],i=wm}end
for EP,dC in ipairs(ad.rarOrder)do local nS=false for EQ,wn in pairs(cG)do if wn.rar==dC then nS=true break end end
if not nS and dC~="?"then local nT=dC:gsub("[^%w]","").."Crate"cG[L.key(nT)]={name=nT,title=dC.." Crate",rar=dC,i=50,guess=true}
end end for nU,fG in pairs(L.seen)do local a3=cG[nU]or{i=100}a3 .name,a3 .title,a3 .rar=fG.name or a3 .name,fG.title or a3 .title,fG.rar or a3 .rar
a3 .price,a3 .guess=fG.price or a3 .price,nil cG[nU]=a3 end local dD,fH={},{}for wo,wp in ipairs(nB)do dD[wp]=wo end
for wq,nV in ipairs(ad.rarOrder)do dD[nV]=dD[nV]or(20+wq)end for wr,dE in pairs(cG)do dE.k=wr dE.price=dE.price or aj.price[dE.rar or""]
fH[#fH+1]=dE end table.sort(fH,function(bZ,b0)if bZ.price and b0 .price and bZ.price~=b0 .price then return bZ.price<b0 .price end
local nW,nX=dD[bZ.rar or""]or 99,dD[b0 .rar or""]or 99 if nW~=nX then return nW<nX end if(bZ.i or 100)~=(b0 .i or 100)then return(bZ.i or 100)<(b0 .i or 100)end
return bZ.k<b0 .k end)return fH end local function ws()local nY=ah:FindFirstChild("Assets")local nZ=nY and nY:FindFirstChild("Squishies")
if not nZ then return false end local iL,n0,cH={},{},{}local fI=0 for ER,fJ in ipairs(nZ:GetChildren())do local dF=W(fJ.Name)
if dF~=""and not iL[dF]then local fK=cF(fJ,"RarityText")or"?"iL[dF]=fK n0[dF]=cF(fJ,"NameText")or fJ.Name cH[fK]=cH[fK]or{}
table.insert(cH[fK],dF)fI=fI+1 end end if fI==0 then return false end for n1,wt in pairs(cH)do local n2=aj.order[n1]or vQ[n1]
local iM={}if n2 then for wu,wv in ipairs(n2)do iM[W(wv)]=wu end end table.sort(wt,function(n3,n4)local iN,iO=iM[n3],iM[n4]
if iN and iO then return iN<iO end if iN then return true end if iO then return false end return ak(n3)<ak(n4)
end)end local iP={}for ww,wx in ipairs(nB)do iP[wx]=ww end local fL,b1={},{}for wy in pairs(cH)do fL[#fL+1]=wy end
pcall(function()for wz,wA in ipairs(require(ah.Modules.SquishyRNG).Keys)do b1[wA]=wz end end)table.sort(fL,function(cI,cJ)
if b1[cI]and b1[cJ]and b1[cI]~=b1[cJ]then return b1[cI]<b1[cJ]end local iQ,iR=aj.price[cI],aj.price[cJ]if iQ and iR and iQ~=iR then return iQ<iR end
local iS,iT=iP[cI],iP[cJ]if iS and iT then return iS<iT end if iS then return true end if iT then return false end
return cI<cJ end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=iL,n0,cH,fL,fI,y()return true end local function iU()
if ad.at==0 or(y()-ad.at)>120 then pcall(ws)end return ad.n>0 end local function wB(wC)local n5=W(wC)return ad.rar[n5]or(V.name and W(V.name)==n5 and V.rar)or"?"
end local function wD()local fM={}local wE=((d.Best or 0)>0 and next(o.best or{}))and o.best or d.Targets for wF,wG in pairs(wE)do if wG then fM[#fM+1]=ak(wF)end end
table.sort(fM)return fM end local am={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function n6()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fN(n7)if type(makefolder)~="function"then return end local wH,wI=pcall(isfolder,n7)if not(wH and wI)then pcall(makefolder,n7)end
end local function fO(n8)if type(isfile)~="function"or type(readfile)~="function"then return nil end local wJ,wK=pcall(isfile,n8)
if not(wJ and wK)then return nil end local wL,wM=pcall(readfile,n8)return wL and wM or nil end local function dG(wN,wO)
if type(writefile)~="function"then return false end return(pcall(writefile,wN,wO))end local function n9(wP)local dH={}
if type(listfiles)~="function"then return dH end local wQ,n_=pcall(listfiles,wP)if not wQ or type(n_)~="table"then return dH end
for ES,wR in ipairs(n_)do dH[#dH+1]=tostring(wR)end return dH end local function oa()local fP={}for ET,wS in ipairs(n9(am.cfg))do
local ob=wS:match("([^/\\]+)%.txt$")if ob then fP[#fP+1]=ob end end table.sort(fP)return fP end local function wT()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(d.Every)aa[#aa+1]="N|GlazeLead|"..tostring(d.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(d.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(d.MemLimit)aa[#aa+1]="N|Best|"..tostring(d.Best or 0)for EU,oc in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..oc.."|"..d[oc]end
do local fQ={}for wU,dI in pairs(d.Pets)do local od=(dI.b and"b"or"")..(dI.g and"g"or"")..(dI.w and"w"or"")..((tonumber(dI.f)or 0)>0 and tostring(dI.f)or"")
if od~=""then fQ[#fQ+1]=wU.."|"..od end end table.sort(fQ)aa[#aa+1]="P|-"for EW,wV in ipairs(fQ)do aa[#aa+1]="P|"..wV end
end for EX,oe in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..oe.."|"..(d[oe]and"1"or"0")end local iV=J:GetAttribute("AutoRollRules")if type(iV)=="string"and iV~=""then d.ARrules,d.ARstop=iV,tostring(J:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then aa[#aa+1]="S|rules|"..d.ARrules aa[#aa+1]="S|stop|"..d.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for EY,iW in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fR={}for wW,wX in pairs(iW[2])do if wX then fR[#fR+1]=wW end end table.sort(fR)aa[#aa+1]=iW[1].."|-"for EZ,wY in ipairs(fR)do aa[#aa+1]=iW[1].."|"..wY end
end return table.concat(aa,"\n")end local function wZ(iX)if type(iX)~="string"or iX==""then return false end local of,og,oh,oi,dJ={},false,{},false,nil
for w0 in iX:gmatch("[^\n]+")do local aC,ag,ax=w0:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ag=="Every"then local iY=tonumber(ax)
if iY and iY>=1 then d.Every=math.floor(iY)end elseif aC=="N"and(ag=="FpsCap"or ag=="MemLimit")then local iZ=tonumber(ax)
if iZ and iZ>=0 then d[ag]=math.floor(iZ)end elseif aC=="N"and ag=="Best"then local fS=tonumber(ax)if fS and fS>=0 and fS<=4 then d.Best=math.floor(fS)end
elseif aC=="N"and ag=="GlazeLead"then local fT=tonumber(ax)if fT and fT>=5 and fT<=600 then d.GlazeLead=math.floor(fT)end
elseif aC=="S"and(ag=="TeamNormal"or ag=="TeamFull"or ag=="TeamGlaze"or ag=="TeamWax")then d[ag]=ax elseif aC=="P"and ag~=""then
if not dJ then dJ={}end if ag~="-"and ax~=""then dJ[ag]={b=ax:find("b",1,true)and true or nil,g=ax:find("g",1,true)and true or nil,
w=ax:find("w",1,true)and true or nil,f=tonumber(ax:match("%d"))}end elseif aC=="B"then if d[ag]~=nil then d[ag]=(ax=="1")end
elseif aC=="S"and ag=="rules"then d.ARrules=ax elseif aC=="S"and ag=="stop"then d.ARstop=ax elseif aC=="W"then
c.winPos={tonumber(ag)or 10,tonumber(ax)or 44}elseif aC=="G"then c.togPos={tonumber(ag)or 10,tonumber(ax)or 300}
elseif aC=="T"and ag~=""then if ag~="-"then of[ag]=true end og=true elseif aC=="K"and ag~=""then if ag~="-"then oh[ag]=true end
oi=true end end if og then d.Targets=of end if oi then d.CrateTicks=oh end if dJ then d.Pets=dJ end return true
end local function fU(cK)if not n6()then return false,"this executor cannot write files"end cK=(cK or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cK==""then return false,"give the config a name"end fN(am.dir)fN(am.cfg)if not dG(am.cfg.."/"..cK..".txt",wT())then return false,"could not write the file"end
c.config=cK return true,cK end local function oj(fV)local ol=fO(am.cfg.."/"..fV..".txt")if not ol then return false,"no config called "..tostring(fV)end
if not wZ(ol)then return false,"that config looks empty"end c.config=fV return true,fV end local function om(i0)
if i0 then fN(am.dir)dG(am.auto,i0)elseif type(delfile)=="function"then pcall(delfile,am.auto)else dG(am.auto,"")
end c.autoload=i0 end local function w1()if c.selfPath then return c.selfPath end local fW for E0,w2 in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",am.dir})do
for E1,oo in ipairs(n9(w2))do local i1=oo:lower()if i1:sub(-4)==".lua"and(i1:find("sab_farm",1,true)or i1:find("sab farm",1,true))then
fW=fW or oo end end end c.selfPath=fW return fW end am.stub=[[
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
local function w3()if not n6()then return false,"this executor cannot write files"end fN("autoexec")if not dG(am.exec,am.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fX=(function()local w4,w5=pcall(function()return game:GetService("TeleportService")end)return w4 and w5 or nil end)()
local function op()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local w6=queueonteleport or queue_on_teleport return(pcall(w6,am.stub))end local function dK(w7)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..w7 ..")")pcall(ft)if c.autoload then pcall(fU,c.autoload)end local w8=op()A(w8 and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for E2=1,30 do if not fX then break end pcall(function()fX:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function w9()local w_,oq=pcall(function()return game:GetService("GuiService")end)if w_ and oq then
pcall(function()T(oq.ErrorMessageChanged:Connect(function()if d.Rejoin then dK("roblox error message")end end))
end)end pcall(function()local ot=game:GetService("CoreGui")local ou=ot and ot:WaitForChild("RobloxPromptGui",15)
local ov=ou and ou:WaitForChild("promptOverlay",15)if ov then T(ov.ChildAdded:Connect(function(xa)if d.Rejoin and tostring(xa.Name):lower():find("errorprompt",1,true)then dK("disconnect prompt")end
end))end end)if fX then pcall(function()T(fX.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dK("teleport retry")end)end
end))end)end end local function ow(xb)local ox=c.plot and c.plot:FindFirstChild(xb)if not ox then return nil,false end
for E3,i2 in ipairs(ox:GetChildren())do if i2:IsA("Model")or i2:IsA("BasePart")then return i2,true end end return nil,true
end local function b2()local bx=ow("RolledSquishy")if not bx then return nil end return{model=bx,name=bx.Name,pretty=cF(bx,"NameText")or ak(W(bx.Name)),
rar=cF(bx,"RarityText")or wB(bx.Name),price=cF(bx,"PriceText")}end local function oy(i3)return type(i3)=="string"and(ad.rar[W(i3)]~=nil or vD(i3))
end local function ac()local i4=ow("SquishyEquipped")if i4 then c.carrySrc,e.heldAt="model",y()return i4 .Name,i4 end
local oz=J.Character if oz then for E4,dL in ipairs(oz:GetDescendants())do if(dL:IsA("Model")or dL:IsA("Tool"))and oy(dL.Name)then
c.carrySrc,e.heldAt="character",y()return dL.Name,dL end end end local fY=J:GetAttribute("SquishyEquipped")if type(fY)=="string"and fY~=""and oy(fY)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fY,nil end c.carrySrc=nil end local function E5()local E6,xc=ac()return xc end local function dM()
local oA=b2()local i5=oA and vF(oA.price)local i6=a_()if i5 and i6 and i6<i5*0.5 then return i6,i5 end end local function b3(xd)
dt[#dt+1]=os.date("%H:%M:%S").." "..xd if#dt>40 then table.remove(dt,1)end end local function xe(b4,fZ)if type(b4)~="string"then return end
b3(("Roll(%s,%s)"):format(b4,tostring(fZ)))if b4:lower():find("crate",1,true)then e.rolled,e.rolledAt=b4,y()return
end V.seq=V.seq+1 V.name,V.at=b4,y()V.rar=type(fZ)=="string"and fZ or nil c.rolls=c.rolls+1 if aK(b4)then A(("ROLL %s [%s] = TARGET"):format(b4,tostring(fZ)))end
end local function xf(b5)if type(b5)~="table"then return end local f0=b5 .butter or b5 .itemName if type(f0)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=f0,y()if type(b5 .giftId)=="string"then local oB=ah:FindFirstChild("Remotes")
local oC=oB and oB:FindFirstChild("GiftThanks")if oC then pcall(function()oC:FireServer(b5 .giftId)end)end end
b3("Gift("..f0 .." from "..tostring(b5 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b5 .fromName),f0))
end local function xg()local oD=ah:WaitForChild("Remotes",30)if not c.alive then return end if not oD then A("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local oE=J:GetAttribute("SquishyEquipped")
if type(oE)=="string"and oE~=""then e.heldAt=y()end end))local xm={SquishyRollAnimation=xe,InitSquishy=function(oF)V.init,V.initAt=tostring(oF),y()b3("Init("..tostring(oF)..")")end,
CrateUpdate=function(cL,oG)pcall(wb,cL)pcall(L.learn,cL)if type(cL)=="table"then local xh=oG==true or(e.rolled~=nil and y()-e.rolledAt<15)or e.waiting
if not xh then return end local xi=not e.waiting local xj=e.on e.waiting,e.data,e.at=true,cL,y()e.on=(oG==true)
e.title=tostring(cL.title or cL.name or"crate")if e.on and not xj then e.openedAt,e.byYou=y(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then b3("CrateWindow open("..e.title..")")elseif xi then b3("Crate waiting("..e.title..")")A(e.title.." is waiting on your stand")
end else if e.waiting then b3("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local xk=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,xk)end if e.classify then local xl=y()
task.spawn(function()pcall(e.classify,xl)end)end end end,GiftReceived=xf,}for f1,xn in pairs(xm)do local i7=oD:FindFirstChild(f1)
if i7 and i7:IsA("RemoteEvent")then T(i7 .OnClientEvent:Connect(xn))elseif f1~="CrateUpdate"and f1~="GiftReceived"then A("remote "..f1 .." missing")end
end end local function i8()local b6=b2()if b6 then if aK(b6 .name)then return{state="match",shown=b6 .pretty,src="pad",info=b6}
end return{state="skip",info=b6,level="idle",text=("on pad: %s [%s] - not ticked"):format(b6 .pretty,tostring(b6 .rar))}
end if V.name and(y()-V.at)<4 then if aK(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f2(xo,xp,xq,xr)
local f3=RaycastParams.new()f3 .FilterType=Enum.RaycastFilterType.Exclude local i9={J.Character}for E7,xs in ipairs(xr or{})do i9[#i9+1]=xs end
f3 .FilterDescendantsInstances=i9 pcall(function()f3 .RespectCanCollide=true end)local oH=au:Raycast(Vector3 .new(xo,xp+4,xq),Vector3 .new(0,-30,0),f3)
return oH and oH.Position or nil end local function cM(oI)local oJ=oI:FindFirstChildOfClass("Humanoid")return((oJ and oJ.HipHeight)or 2)+oI.HumanoidRootPart.Size.Y/2+0.2
end local function i_(xt,xu)local ja=xt:FindFirstChildOfClass("Humanoid")local xv=y()while y()-xv<xu do if ja and(ja.FloorMaterial~=Enum.Material.Air or ja.SeatPart)then return true end
af(0.05)end return false end local function aD(xw,jb,jc)local oK=xw.HumanoidRootPart oK.AssemblyLinearVelocity=Vector3 .new(0,0,0)
oK.CFrame=jc and CFrame.new(jb,Vector3 .new(jc.X,jb.Y,jc.Z))or CFrame.new(jb)end local function b7(be,oL)local b8=ao()
if not b8 or not be then return false end local by=be.Position local f4=math.clamp(math.max(be.Size.X,be.Size.Z)/2+2.2,3,7)
local oM=(oL and oL.MaxActivationDistance)or 10 if f4>oM-2 then f4=math.max(2.5,oM-2)end local dN={}local function b9(dO)
dO=Vector3 .new(dO.X,0,dO.Z)if dO.Magnitude>0.05 then dN[#dN+1]=dO.Unit end end local oN=no()if oN then b9(oN-by)end
b9(be.CFrame.LookVector)b9(-be.CFrame.LookVector)b9(be.CFrame.RightVector)b9(-be.CFrame.RightVector)b9(b8 .HumanoidRootPart.Position-by)
if#dN==0 then b9(Vector3 .new(0,0,1))end local xx,f5=cM(b8),false for E8,xy in ipairs(dN)do local f6=by+xy*f4
local jd=f2(f6 .X,by.Y,f6 .Z,{be})if jd and math.abs(jd.Y-by.Y)<14 then aD(b8,Vector3 .new(f6 .X,jd.Y+xx,f6 .Z),by)
if i_(b8,0.7)then f5=true break end end end if not f5 then aD(b8,by+dN[1]*f4+Vector3 .new(0,3,0),by)f5=i_(b8,1)
end af(0.12)return f5 end local function oO(dP)if not dP.Parent or not dP.Enabled then return false end pcall(function()dP:InputHoldBegin()end)
af(math.max(dP.HoldDuration,0)+0.08)pcall(function()dP:InputHoldEnd()end)return true end local function ap(oP,xz)
local xA=y()while y()-xA<xz do if oP()then return true end af(0.05)end return oP()end local function dQ(cN,xC,oQ,xD)
local xE=c.zapFirst and{"zap","hold"}or{"hold","zap"}for xF,je in ipairs(xE)do if xF==2 and(xD or not(cN.Parent and cN.Enabled and(not oQ or oQ())))then break end
local jf if je=="hold"then jf=oO(cN)else jf=type(fireproximityprompt)=="function"and cN.Parent~=nil and cN.Enabled and pcall(fireproximityprompt,cN)end
if jf and ap(xC,1.2)then c.zapFirst=(je=="zap")return true,je end end return false end local function oR(jg)local bz=nz()
if not bz or not bz.Enabled then A("buy: nothing on the pad")return false end local jh=dx(bz)if not jh then A("buy: pad part missing")return false end
c.lastBuyAt=y()local xG,oS=V.seq,a_()local oT=ao()local xH=oT and(oT.HumanoidRootPart.Position-jh.Position).Magnitude>12
b7(jh,bz)if xH then af(0.4)end if not bz.Enabled then A("buy aborted: pad emptied")return false end local cO=i8()
if not jg and cO.state~="match"then A("buy aborted: "..(cO.text or"pad changed"))c.matchSince=nil return false
end local ji=cO.info and cO.info.name or(cO.state=="match"and V.name)or nil local function xI()return bz.Enabled and ac()==nil and(jg or i8().state=="match")
end local xJ,xK=dQ(bz,function()return ac()~=nil or((not bz.Enabled)and(jg or V.seq==xG))end,xI,dM()~=nil)if xJ then
ap(function()return ac()~=nil end,0.8)local dR=ac()local oU=a_()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dR and ak(W(dR))or(cO.shown or"?"),(oS and oU)and(" for $"..aL(oS-oU))or"",xK))
if dR and ji and W(dR)~=W(ji)then A(("note: picked up %s, not %s"):format(dR,ji))end return true end local f7=b2()
if dM()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aL(a_()),(f7 and f7 .price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(f7 and f7 .price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function oV()local dS=ac()if not dS then c.holding=false A("place: hands are empty")
return false end if not aK(dS)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dS))))return false end
for E9=1,d.PlaceTries do local bA=vP()if not bA then A("place: no free station")break end local oW=dx(bA)if oW then
b7(oW,bA)local oX=ac()if not oX then c.holding=false A("place: hands emptied on the way")return false end if not aK(oX)then A("place: what I carry changed, not waxing it")return false end
if bA.Enabled then local xL,xM=dQ(bA,function()return not bA.Enabled end,function()return bA.Enabled end)if xL then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dS)),c.placed,bA.Parent.Parent.Name,xM))if o.placed then pcall(o.placed,dS)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))A(c.capMsg)end return false end function z.place()local xN=y()while c.alive and z.editing and y()-xN<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then z.placing=true local xO=y()while c.alive and z.current()~=d.TeamWax and y()-xO<5 do af(0.1)end
if z.current()==d.TeamWax then af(0.3)else A("wax team did not come on in time - placing anyway")end end local xP,oY=pcall(oV)
z.placing=false if not xP then error(oY,0)end return oY end local function oZ(o0)return type(o0)=="string"and o0:lower():find("crate",1,true)~=nil
end local xQ={SABFarmGui=1,SABToggle=1,SABError=1}local function jj(xR)local bB=xR while bB do if xQ[bB.Name]then return false end
if bB:IsA("ScreenGui")then local xS,xT=pcall(function()return bB.Enabled end)return(not xS)or xT~=false end if bB:IsA("GuiObject")and not bB.Visible then return false end
bB=bB.Parent end return false end local function f8(f9)local cP=""pcall(function()if f9:IsA("TextButton")then cP=f9 .Text end end)
if not cP:find("%a")then for E_,f_ in ipairs(f9:GetDescendants())do if(f_:IsA("TextLabel")or f_:IsA("TextButton"))and f_.Text:find("%a")then cP=f_.Text break end
end end if not cP:find("%a")then cP=f9 .Name end return(cP:lower():gsub("[^%a]",""))end local function xU()local dT,dU
local o1=J:FindFirstChildOfClass("PlayerGui")if not o1 then return nil,nil end for Fa,dV in ipairs(o1:GetDescendants())do
if dV:IsA("GuiButton")and jj(dV)then local jk=f8(dV)if jk:sub(1,4)=="open"and not jk:find("shop",1,true)then dT=dT or dV end
if jk:sub(1,7)=="discard"then dU=dU or dV end end end if dT and dU then return dT,dU end if e.on then return dT,dU end
return nil,nil end local jl=(function()local xV,xW=pcall(function()return game:GetService("VirtualInputManager")end)return xV and xW or nil end)()
local function o2(bf,jm)local jn={}local function o3(xX)jn[#jn+1]=xX end if c.tapWay then o3(c.tapWay)end for Fb,o4 in ipairs({"touch","conn","signal"})do
if o4~=c.tapWay then o3(o4)end end local function o5(xY,...)local xZ,jo=pcall(getconnections,xY)if not(xZ and type(jo)=="table"and#jo>0)then return false end
local o6,x0,x1=false,{...},select("#",...)for Fc,x2 in ipairs(jo)do if pcall(function()x2:Fire(table.unpack(x0,1,x1))end)then o6=true end
end return o6 end local function o7()local o8=Vector3 .new(0,0,0)pcall(function()local o9,o_=bf.AbsolutePosition,bf.AbsoluteSize
o8=Vector3 .new(o9 .X+o_.X/2,o9 .Y+o_.Y/2,0)end)local jp={Position=o8,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jp.UserInputType=Enum.UserInputType.Touch end)pcall(function()jp.UserInputState=Enum.UserInputState.End end)
return jp end for Fd,bh in ipairs(jn)do local dW=false if bh=="conn"and type(getconnections)=="function"then if o5(bf.MouseButton1Click)then
dW=true if ap(jm,1.5)then c.tapWay=bh return true,bh end end dW=o5(bf.Activated,o7(),1)elseif bh=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bf.MouseButton1Click)then if ap(jm,1.5)then c.tapWay=bh return true,bh end end dW=pcall(firesignal,bf.Activated,o7(),1)
elseif bh=="touch"and jl then dW=pcall(function()local pa,pb=bf.AbsolutePosition,bf.AbsoluteSize local pc=0 local pd=bf:FindFirstAncestorWhichIsA("ScreenGui")
local x3,x4=pcall(function()return pd and pd.IgnoreGuiInset end)if not(x3 and x4)then pcall(function()pc=game:GetService("GuiService"):GetGuiInset().Y end)
end local pe,pf=pa.X+pb.X/2,pa.Y+pb.Y/2+pc jl:SendMouseButtonEvent(pe,pf,0,true,game,1)task.wait(0.06)jl:SendMouseButtonEvent(pe,pf,0,false,game,1)
end)end if dW and ap(jm,1.5)then c.tapWay=bh return true,bh end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jq(pg)local dX=pg.Parent while dX and dX~=c.plot do if e.NOT[dX.Name]then return false end dX=dX.Parent
end local jr=(pg.ActionText or""):lower()if jr:find("roll",1,true)or jr:find("place",1,true)or jr:find("sell",1,true)then return false end
return true end local function ph()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local pj=c.plot:FindFirstChild("CrateStand")local dY if pj then for Fe,ga in ipairs(pj:GetDescendants())do
if ga:IsA("ProximityPrompt")and ga.Enabled and jq(ga)then dY=ga break end end end if not dY then for Ff,bC in ipairs(c.plot:GetDescendants())do
if bC:IsA("ProximityPrompt")and bC.Enabled and jq(bC)then local pk=bC:FindFirstAncestorWhichIsA("Model")local x5=((bC.ActionText or"").." "..(bC.ObjectText or"").." "..bC.Name.." "..(pk and pk.Name or"")):lower()
if x5:find("crate",1,true)then dY=bC break end end end end e.prompt=dY return dY end local function js()if e.on then return true end
local dZ=ph()if not dZ then e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local pl=dx(dZ)if pl then b7(pl,dZ)end e.ours=true dQ(dZ,function()return e.on end)if ap(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: pressed "..fo(dZ).." but no window came up")
return false end do local function x6(pm)local cQ=pm.Parent while cQ and cQ:IsA("GuiObject")do local pn,po=false,false
for Fg,d0 in ipairs(cQ:GetDescendants())do if d0~=pm and d0:IsA("GuiButton")and f8(d0):sub(1,7)=="discard"then pn=true end
if d0:IsA("TextLabel")then local jt=d0 .Text:lower()if jt:find("crate",1,true)or jt:find("can contain",1,true)or jt:find("cost",1,true)then po=true end
end if pn and po then return cQ end end cQ=cQ.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local pp=J:FindFirstChildOfClass("PlayerGui")if not pp then return nil end for Fh,gb in ipairs(pp:GetDescendants())do
if gb:IsA("GuiButton")and not gb:FindFirstAncestor("SABFarmGui")and f8(gb):sub(1,4)=="open"then local ju=x6(gb)
if ju then e.win=ju return ju end end end end local function x7(x8)for Fi,gc in ipairs(x8:GetDescendants())do
if gc:IsA("GuiButton")then local pq,jv=f8(gc),gc.Name:lower()if pq=="x"or pq=="close"or jv=="x"or jv:find("close",1,true)or jv:find("exit",1,true)then return gc end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(x9)task.wait(x9 and 4 or 1.2)if e.on or e.waiting then return end
local gd=e.findWin()if not gd or not jj(gd)then return end local ps=x7(gd)if ps and o2(ps,function()return not jj(gd)end)then return end
A("the crate window is still open - tap its X")end end local function d1(ge)if not js()then return false end local pt=y()-(e.openedAt or 0)
if pt<0.6 then af(0.6-pt)end local jw=e.title local x_,ya=xU()local pu=ge and x_ or ya if not pu then e.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(ge and"Open"or"Discard",jw))return false
end local yb=ac()local yc,Fj=o2(pu,function()return(not e.on)or(ac()~=nil and ac()~=yb)end)if not yc then e.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(ge and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if ge then c.crates=c.crates+1 ap(function()return ac()~=nil end,1.5)local pv=ac()
A(("OPENED %s -> %s"):format(jw,pv and ak(W(pv))or"?"))else A("discarded "..jw.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(yd,...)local ye=select("#",...)e.calls[#e.calls+1]={t=y(),m=yd,n=ye,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aE,bi)local bD=type(aE)if(bD=="string"or bD=="number")and type(bi.data)=="table"then for pw,jx in pairs(bi.data)do
if jx==aE and type(pw)=="string"and(type(jx)=="string"or type(jx)=="number")then return{__slot="f:"..pw}end end
end if bD=="string"then if bi.crate and aE==bi.crate then return{__slot="crate"}end if bi.title and aE==bi.title then return{__slot="title"}end
if bi.rar and aE==bi.rar then return{__slot="rarity"}end return aE end if bD=="number"or bD=="boolean"or bD=="nil"then return aE end
if bD=="table"then local px={}for yf,py in pairs(aE)do if type(py)=="table"then return nil,"nested table"end local yg,pz=e.slot(py,bi)
if pz then return nil,pz end px[yf]=yg end return px end local yh,yi=pcall(function()return aE:IsA("Instance")end)
if yh and yi then if aE==J then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gf=c.plot and c.plot:FindFirstChild("CrateStand")if gf and aE==gf then return{__slot="stand"}end if gf and aE.Parent==gf then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bD..")"end function e.resolve(gg)if type(gg)~="table"then return gg end
local aR=gg.__slot if aR and aR:sub(1,2)=="f:"then return e.data and e.data[aR:sub(3)]end if aR=="crate"then return e.data and e.data.name end
if aR=="title"then return(e.data and e.data.title)or e.title end if aR=="rarity"then return e.data and e.data.rarity end
if aR=="player"then return J end if aR=="plot"then return c.plot end if aR=="stand"or aR=="model"then local jy=c.plot and c.plot:FindFirstChild("CrateStand")
if aR=="stand"or not jy then return jy end for Fk,pA in ipairs(jy:GetChildren())do if oZ(pA.Name)then return pA end end
return nil end local pB={}for yj,yk in pairs(gg)do pB[yj]=e.resolve(yk)end return pB end function e.classify(jz)
if e.directOff then return end local gh={}for Fl,jA in ipairs(e.calls)do if jA.t<=jz+0.05 and jz-jA.t<=6 then gh[#gh+1]=jA end
end if#gh==0 then return end if not ap(function()return(e.heldAt or 0)>=jz-1 end,2.5)then return end local d2={}
for Fm,d3 in ipairs(gh)do local pC={}for pD=1,d3 .n do local yl,pE=e.slot(d3 .args[pD],d3)if pE then A("crate call has "..pE.." - keeping the button method")
return end pC[pD]=yl end d2[#d2+1]={m=d3 .m,n=d3 .n,args=pC}end local jB=e.learned e.learned={seq=d2,mode=jB and jB.mode or nil}
aj.dirty=true if not jB then A(("learned how to open crates directly (%d call%s)"):format(#d2,#d2==1 and""or"s"))end
end function e.replay()local pF=e.learned local pG=ah:FindFirstChild("Remotes")local jC=pG and pG:FindFirstChild("CrateAction")
if not(pF and jC)then return false end local pH=table.unpack or unpack e.replaying=true for Fn,d4 in ipairs(pF.seq)do
local jD={}for pI=1,d4 .n do jD[pI]=e.resolve(d4 .args[pI])end task.spawn(function()pcall(function()if d4 .m=="InvokeServer"then jC:InvokeServer(pH(jD,1,d4 .n))
else jC:FireServer(pH(jD,1,d4 .n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(ym)return(ym:gsub("[%%|;=,\n]",function(yn)return("%%%02X"):format(yn:byte())end))end
function e.enc(b_)local gi=type(b_)if gi=="string"then return"s"..e.esc(b_)end if gi=="number"then return"n"..tostring(b_)end
if gi=="boolean"then return b_ and"b1"or"b0"end if gi=="nil"then return"z"end if b_.__slot then return"k"..b_.__slot end
local jE={}for yo,yp in pairs(b_)do jE[#jE+1]=e.enc(yo).."="..e.enc(yp)end return"t"..table.concat(jE,",")end
function e.dec(pJ)local d5,d6=pJ:sub(1,1),pJ:sub(2)local function yq(yr)return(yr:gsub("%%(%x%x)",function(ys)return string.char(tonumber(ys,16))end))end
if d5=="s"then return yq(d6)end if d5=="n"then return tonumber(d6)end if d5=="b"then return d6=="1"end if d5=="k"then return{__slot=d6}end
if d5=="t"then local pK={}for yt in d6:gmatch("[^,]+")do local pL,yu=yt:match("^(.-)=(.*)$")if pL then local pM=e.dec(pL)
if pM~=nil then pK[pM]=e.dec(yu)end end end return pK end return nil end function e.goneOrNew(yv)return function()
if not e.waiting then return true end local pN=ac()return pN~=nil and pN~=yv end end function e.near()local pO=ah:FindFirstChild("Remotes")
local jF=pO and pO:FindFirstChild("CrateAction")local gj=ao()local jG=c.plot and c.plot:FindFirstChild("CrateStand")
local jH=jG and jG:FindFirstChild("Spot")if not(jF and gj and jH)then A(("crate: cannot open %s right now (%s)"):format(tostring(e.title),
not jF and"no CrateAction remote"or not gj and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jI=gj.HumanoidRootPart local gk=jI.CFrame local pP,jJ=e.title,"no answer"local yw=ac()local pQ=jG:FindFirstChild("Holder")
local function pR()if not pQ then return e.waiting or e.on end for Fo,yx in ipairs(pQ:GetChildren())do if yx:IsA("Model")then return true end end
return false end for yy=1,3 do if not(e.waiting or e.on)or not pR()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end if(jI.Position-jH.Position).Magnitude>8 then b7(jH,e.prompt)end af(0.12+0.15*yy)
local a4={}e.replaying=true task.spawn(function()a4 .ok,a4 .v=pcall(function()return jF:InvokeServer("open")end)
a4 .done=true end)ap(function()return a4 .done end,6)e.replaying=false local ca=a4 .v if a4 .done and a4 .ok and type(ca)=="table"and ca.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(pP,ca.prize and ak(W(tostring(ca.prize)))or"?"))
ap(function()local pS=ac()return pS~=nil and pS~=yw end,1.5)if(jI.Position-gk.Position).Magnitude>8 then pcall(function()aD(gj,gk.Position,gk.Position+gk.LookVector)end)end
return true,"opened"end jJ=(a4 .done and a4 .ok and type(ca)=="table")and tostring(ca.reason or"refused, no reason given")
or(a4 .done and("error: "..tostring(ca))or"no answer in 6s")af(0.3)if not pR()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(pP,jJ))
return false,jJ end e.GIVEUP=600 function e.drop()local pT=ah:FindFirstChild("Remotes")local pU=pT and pT:FindFirstChild("CrateAction")
local pV=c.plot and c.plot:FindFirstChild("CrateStand")local jK=pV and pV:FindFirstChild("Spot")local pW=ao()
if jK and pW and(pW.HumanoidRootPart.Position-jK.Position).Magnitude>8 then b7(jK,e.prompt)af(0.3)end local jL,bj=false,nil
if pU then jL,bj=pcall(function()return pU:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(e.title),math.floor(e.GIVEUP/60),(jL and type(bj)=="table"and bj.ok)and"done"or("answer: "..tostring(type(bj)=="table"and(bj.reason or bj.ok)or bj))))
e.waiting,e.on,e.quietUntil=false,false,y()+4 e.summonFails,e.nearFails,e.lastFail,e.at,e.prompt=0,0,0,nil,nil
if not(jL and type(bj)=="table"and bj.ok)then d1(false)end end function e.smart()local jM=e.title if(e.nearFails or 0)<3 then
local yz=e.near()if yz then return true end if e.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local cb=e.learned if cb then local jN=ac()if e.on then e.replay()if ap(e.goneOrNew(jN),3.5)then c.crates=c.crates+1
A("OPENED "..jM.." (direct)")return true end else if cb.mode~="window"then e.replay()if ap(e.goneOrNew(jN),3.5)then
c.crates,e.fails=c.crates+1,0 if cb.mode~="direct"then cb.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..jM.." (direct, no window)")return true end end if js()then e.replay()if ap(e.goneOrNew(jN),3.5)then
c.crates,e.fails=c.crates+1,0 if cb.mode~="window"then cb.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..jM.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,aj.dirty=cb,nil,true
if e.fails>=3 then e.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return d1(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for yA,pX in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(pX):Connect(function()D.cache[yA]=J:GetAttribute(pX)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(yB,...)local gl=D.cache
local yC={m=yB,n=select("#",...),args={...},before={rules=gl.rules,stop=gl.stop,on=gl.on,main=gl.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,yC)end end)end function D.learnOne(d7)local ay,d8=D.snap(),d7 .before local gm=(ay.rules~=d8 .rules)or(ay.stop~=d8 .stop)
local pY=(ay.on~=d8 .on)or(ay.main~=d8 .main)if not gm and not pY then return end local pZ={}for p0=1,d7 .n do
local aM=d7 .args[p0]local cc=type(aM)if cc=="string"and aM~=""and aM==ay.rules then aM={__slot="rules"}elseif cc=="string"and aM~=""and gm and aM==ay.stop and ay.stop~=d8 .stop then aM={__slot="stop"}
elseif cc=="table"then local p1={}for yD,cR in pairs(aM)do if type(cR)=="table"or(type(cR)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end p1[yD]=(type(cR)=="string"and cR~=""and cR==ay.rules)and{__slot="rules"}or cR end aM=p1 elseif cc~="string"and cc~="number"and cc~="boolean"and cc~="nil"then
if aM==J then aM={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end pZ[p0]=aM
end local cS={m=d7 .m,n=d7 .n,args=pZ}if gm then local jO=false for yE=1,cS.n do local d9=cS.args[yE]if type(d9)=="table"and d9 .__slot=="rules"then jO=true end
if type(d9)=="table"and not d9 .__slot then for Fp,p2 in pairs(d9)do if type(p2)=="table"and p2 .__slot=="rules"then jO=true end end
end end if jO then D.rec.rules={cS}else table.insert(D.rec.rules,cS)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if pY then if ay.on==true then D.rec.on=cS else D.rec.off=cS end d.AutoRoll=(ay.on==true)end if ay.rules and ay.rules~=""then d.ARrules,d.ARstop=ay.rules,ay.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gm and"choices"or(ay.on and"on"or"off")))end
function D.resolve(cT)if type(cT)~="table"then return cT end if cT.__slot=="rules"then return d.ARrules~=""and d.ARrules or J:GetAttribute("AutoRollRules")end
if cT.__slot=="stop"then return d.ARstop~=""and d.ARstop or J:GetAttribute("AutoRollStop")end if cT.__slot=="player"then return J end
local p3={}for yF,yG in pairs(cT)do p3[yF]=D.resolve(yG)end return p3 end function D.replay(p4,yH)local p5=table.unpack or unpack
for Fq,d_ in ipairs(yH)do local jP={}for p6=1,d_.n do jP[p6]=D.resolve(d_.args[p6])end D.replaying=true pcall(function()
if d_.m=="InvokeServer"then task.spawn(function()pcall(function()p4:InvokeServer(p5(jP,1,d_.n))end)end)else p4:FireServer(p5(jP,1,d_.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(p7,yI)if D.busy or not c.alive then return end D.busy=true
pcall(function()local p8=ah:FindFirstChild("Remotes")local jQ=p8 and p8:FindFirstChild("AutoRollAction")if not jQ then D.msg="this game has no AutoRollAction"return end
local bE=d.AutoRoll if bE and d.ARrules~=""and J:GetAttribute("AutoRollRules")~=d.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(jQ,D.rec.rules)
if ap(function()return J:GetAttribute("AutoRollRules")==d.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bE==D.isOn()or(not bE and not yI)then return end
local gn=bE and D.rec.on or D.rec.off if not gn then local ea=bE and D.rec.off or D.rec.on local p9=ea~=nil for yJ=1,ea and ea.n or 0 do
if type(ea.args[yJ])=="boolean"then p9=false end end if p9 then gn=ea end end if not gn then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bE and"on"or"off")
A(D.msg)return end D.replay(jQ,{gn})if ap(function()return D.isOn()==bE end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bE and"ON"or"OFF",p7 and(" ("..p7 ..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local yK,yL=pcall(function()return J.UserId end)return yK and yL or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local yM,jR=pcall(function()return require(ah:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if yM and type(jR)=="table"and type(jR.Pets)=="table"then q.I=jR end return q.I end function q.order()if q.list then return q.list end
local bF=q.info()if not bF then return{}end local cd={}if type(bF.Order)=="table"and#bF.Order>0 then for Fr,p_ in ipairs(bF.Order)do if bF.Pets[p_]then cd[#cd+1]=p_ end end
else for yN in pairs(bF.Pets)do cd[#cd+1]=yN end table.sort(cd,function(yO,yP)return(bF.Pets[yO].price or 0)<(bF.Pets[yP].price or 0)end)
end q.list=cd return cd end function q.nice(qa,jS)local qb=q.info()local qc=qb and qb.Pets[qa]return((jS and jS~="")and(jS.." ")or"")..(qc and qc.displayName or tostring(qa))
end function q.data()local go=J:GetAttribute("PetsData")if type(go)~="string"then return nil end if go==q.rawD then return q.lastD end
local yQ,eb=pcall(function()return q.HS:JSONDecode(go)end)eb=(yQ and type(eb)=="table")and eb or nil q.rawD,q.lastD=go,eb
return eb end function q.pen()return ah:FindFirstChild("PetMeadowSpawns")end function q.srv()return au:GetServerTimeNow()end
function q.money()local jT=J:FindFirstChild("MoneyValue")if jT and type(jT.Value)=="number"then return jT.Value end
return a_()or 0 end function q.wishes()local qe=q.pen()local qf=qe and qe:GetAttribute("Wishes")local jU,qg={},q.srv()
if type(qf)~="string"then return jU end local yR,qh=pcall(function()return q.HS:JSONDecode(qf)end)if yR and type(qh)=="table"then
for yS,jV in pairs(qh)do if type(jV)=="number"and jV>qg then jU[yS]=jV-qg end end end return jU end function q.call(...)
local qi=ah:FindFirstChild("Remotes")local qj=qi and qi:FindFirstChild("PetRequest")if not qj then return nil end
local qk=table.pack(...)local ce={}task.spawn(function()ce.ok,ce.v=pcall(function()return qj:InvokeServer(table.unpack(qk,1,qk.n))end)
ce.done=true end)local yT=y()while not ce.done and y()-yT<6 do task.wait(0.05)end if ce.done and ce.ok then return ce.v end
return nil end function q.want(yU)return d.Pets[yU]end function q.closeNaming(jW)local qm=pcall(function()local ql=J:FindFirstChild("PlayerScripts")
local yV=ql and ql:FindFirstChild("Naming",true)require(yV).close()end)af(0.5)if jW.Visible then pcall(function()local qo=jW:FindFirstChild("NameBox",true)if qo then qo:ReleaseFocus()end end)
jW.Visible=false qm=false end return qm end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qp=J:FindFirstChildOfClass("PlayerGui")
local qq=qp and qp:FindFirstChild("MainGui")local gp=qq and qq:FindFirstChild("PetNameGui")if gp and gp.Visible then
af(0.4)if gp.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gp)break end end af(0.25)end
q.namingOn=false end)end function q.buyTick()if not d.PetBuy then q.buyMsg="auto adopt is off"return end local jX,qr,gq=q.info(),q.pen(),q.data()
if not(jX and qr and gq)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local ec,jY=#(gq.pets or{}),tonumber(gq.maxOwned)or 60
local yW,qs,ed=q.srv(),{},nil for Fs,aS in ipairs(qr:GetChildren())do qs[aS.Name]=true local cf,gr=aS:GetAttribute("Pet"),aS:GetAttribute("Variant")or""
local jZ=cf and q.want(cf)if jZ and jZ.b and jX.Pets[cf]and(not jZ.g or gr=="Big")and C.wantMore(cf,gr,gq)and not aS:GetAttribute("A_"..q.uid)
and(tonumber(aS:GetAttribute("ExpiresAt"))or 0)>yW+1 and y()>=(q.tryAt[aS.Name]or 0)then local ee,qt=q.nice(cf,gr),jX.Pets[cf].price or 0
if ec>=jY then ed=("%s is in the pen, but you have %d/%d pets"):format(ee,ec,jY)q.tryAt[aS.Name]=y()+15 elseif q.money()<qt then
ed=("%s is in the pen - need $%s"):format(ee,aL(qt))q.tryAt[aS.Name]=y()+5 else q.tryAt[aS.Name]=y()+8 local bG=q.call("adopt",aS.Name)
if type(bG)=="table"and bG.ok then ec=ec+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local yX=type(bG.pet)=="table"and bG.pet or{}
table.insert(q.recent,{id=tostring(yX.id or("?"..y())),name=cf,variant=gr,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..ee)q.skipNaming()ed="adopted "..ee else local qu=type(bG)=="table"and tostring(bG.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(ee,qu))ed="adopt failed: "..qu if type(bG)=="table"and bG.bagFull then q.tryAt[aS.Name]=y()+60 end
end end end end for qv in pairs(q.tryAt)do if not qs[qv]then q.tryAt[qv]=nil end end q.buyMsg=ed or("watching the pen (%d/%d pets)"):format(ec,jY)
end function q.wishTick()if not d.PetWish then q.wishMsg="auto wish is off"return end local gs=q.info()if not(gs and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local cg,j0,bH=q.wishes(),0,nil local yY=(type(gs.Wish)=="table"and gs.Wish.cashShare)or 2
local yZ=q.data()for Ft,aA in ipairs(q.order())do local qw=q.want(aA)if qw and qw.w and C.wantMore(aA,"",yZ)then
j0=j0+1 if not cg[aA]and y()>=(q.wishTry[aA]or 0)then local j1=tonumber(J:GetAttribute("PetWishCredits"))or 0
local j2=math.floor((gs.Pets[aA].price or 0)*yY)if j1<=0 and q.money()<j2 then q.wishTry[aA]=y()+10 bH=("need $%s to wish for %s"):format(aL(j2),q.nice(aA))
q.wishWhy[aA]=bH else q.wishTry[aA]=y()+3 local y0=j1>0 and"wishCredit"or"wish"local gt=q.call(y0,aA)if type(gt)=="table"and gt.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),j1>0 and"free wish"or("$"..aL(j2))))
else local j3=type(gt)=="table"and tostring(gt.reason or"no reason given")or"no answer"if j3:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),j3))bH="wish failed: "..j3 end end end end end end if not bH then
for Fu,gu in ipairs(q.order())do local qx=q.want(gu)if qx and qx.w and not cg[gu]and q.wishWhy[gu]then bH=q.wishWhy[gu]break end
end end if not bH then local cU={}for Fv,gv in ipairs(q.order())do local qy=q.want(gv)if qy and qy.w and cg[gv]then cU[#cU+1]=("%s %dm"):format(q.nice(gv),math.ceil(cg[gv]/60))end
end local gw for Fw,gx in ipairs(q.order())do local qz=q.want(gx)if qz and qz.w and cg[gx]and(not gw or cg[gx]<gw)then gw=cg[gx]end
end bH=j0==0 and"no pet has WISH ticked"or(#cU==0 and"running: none yet")or(#cU<=3 and("running: "..table.concat(cU,", ")))
or("%d running, the next one ends in %dm"):format(#cU,math.ceil((gw or 0)/60))end q.wishMsg=bH end z.switches,z.glazed,z.finished=0,0,0
z.done,z.doneN,z.later={},0,{}function z.teams()local j4=q.data()return(j4 and j4 .teams)or{},j4 end function z.current(cV)
cV=cV or q.data()if not cV then return""end local qA={}for Fx,y1 in ipairs(cV.equipped or{})do qA[tostring(y1)]=true end
for Fy,qB in ipairs(cV.teams or{})do local qC=qB.pets or{}local j5=#qC==#(cV.equipped or{})if j5 then for Fz,y2 in ipairs(qC)do if not qA[tostring(y2)]then j5=false break end end end
if j5 then return qB.name end end return""end function z.equip(j6)local y3,y4=z.teams()local j7 for y5,y6 in ipairs(y3)do if y6 .name==j6 then j7=y5 break end end
if not j7 then z.msg="no saved team called "..tostring(j6)return false end if z.current(y4)==j6 then return true end
for FA=1,4 do local qD=q.call("teamEquip",j7)if type(qD)=="table"and qD.ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(y7)local qE=y7:FindFirstChild("SquishyPlaceHolder")local qF=qE and qE:FindFirstChild("TimerGui")
local qG=qF and qF:FindFirstChildWhichIsA("TextLabel",true)local j8=qG and qG.Text if type(j8)~="string"or j8:find("-",1,true)then return nil end
local j9,qH,qI=j8:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not j9 then return nil end local qJ=qI~=""and(tonumber(j9)*3600+tonumber(qH)*60+tonumber(qI))or(tonumber(j9)*60+tonumber(qH))
return qJ>0 and qJ or nil end function z.waxes()local ef={}local qK=c.plot and c.plot:FindFirstChild("WaxStations")
if not qK then return ef end local qL=q.srv()for FB,a5 in ipairs(qK:GetChildren())do local j_=tonumber(a5:GetAttribute("PourEnd"))
local qM=a5:GetAttribute("PourOwner")if a5:GetAttribute("HasSquishy")and a5:GetAttribute("PourId")and(qM==nil or qM==q.uid)then
local ka=z.left(a5)local qN=ka and(qL+ka)or((j_ and j_>qL)and j_ or nil)if qN then local qO,qP=a5:FindFirstChild("SquishyPlaceHolder"),"?"
if qO then for FC,qQ in ipairs(qO:GetChildren())do if qQ:IsA("Model")then qP=qQ.Name break end end end local y8=tostring(a5:GetAttribute("Helpers")or"")
local kb=0 for FD in y8:gmatch("%d+")do kb=kb+1 end ef[#ef+1]={st=a5,ends=qN,sure=ka~=nil,id=a5:GetAttribute("PourId"),name=qP,helps=kb,
long=a5:GetAttribute("PourLong")==true}end end end table.sort(ef,function(y9,y_)return y9 .ends<y_.ends end)return ef
end function z.glazeCount()local qR=ah:FindFirstChild("Remotes")local qS=qR and qR:FindFirstChild("EditStack")
if not qS then return nil end local za,eg=pcall(function()return qS:InvokeServer("State",nil)end)if not(za and type(eg)=="table"and type(eg.state)=="table")then return nil end
local kc,kd=0,{}for FE,gy in ipairs(eg.state.entries or{})do if gy.glaze and gy.glaze~=""then kc=kc+1 kd[gy.glaze]=(kd[gy.glaze]or 0)+1 end
end return kc,kd,#(eg.state.entries or{}),eg.state.capacity end function z.finishedOne(gz,qT)z.finished=z.finished+1
task.wait(2)local ke,zb,qU,zc=z.glazeCount()if ke and qT and ke>qT then z.glazed=z.glazed+1 local kf={}for zd,ze in pairs(zb)do kf[#kf+1]=zd.." "..ze end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gz.name)),gz.st.Name,ke,table.concat(kf,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gz.st.Name,ak(W(gz.name)),qU and(" (stack "..qU.."/"..tostring(zc)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not d.Teams then z.want,z.msg="","auto teams is off"return end
local cj=q.srv()local aF=z.glazeFor if aF then local eh=aF.st local qV=eh.Parent and eh:GetAttribute("HasSquishy")and eh:GetAttribute("PourId")==aF.id
local qW=qV and z.left(eh)if qW then aF.ends=cj+qW end if not qV then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local zf=aF.before
task.spawn(function()pcall(z.finishedOne,aF,zf)end)end elseif aF.ends-cj>d.GlazeLead*3+60 or cj>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(eh.Name,z.clock(aF.ends-cj)))
end end if d.TeamGlaze~=""and not z.glazeFor then local zg=z.speedRatio(d.TeamGlaze)for FF,ck in ipairs(z.list)do
if ck.sure and(ck.ends-cj)*zg[ck.long and 2 or 1]<=d.GlazeLead and y()>=(z.later[ck.id or"?"]or 0)and not z.done[ck.id or"?"]then
z.glazeFor=ck task.spawn(function()ck.before=z.glazeCount()end)break end end end local aG,ei="",""local cW=d.SnapGlaze~=false and o.snapAt and(o.snapAt-cj)
if cW and cW<-8 then o.snapAt,cW=nil,nil end if d.TeamGlaze~=""and cW and cW<=20 then aG,ei=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cW)))
elseif d.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ei=d.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ei=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and z.allBusy()then
aG,ei=d.TeamFull," - every station is busy"else aG=d.TeamNormal end z.want=aG local ej=z.current()z.cur=ej if aG~=""and ej~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ei)else z.nextTry=y()+3 end end local kg=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(ej~=""and ej or"(not a saved team)",(aG~=""and aG~=ej)and(" -> "..aG)or"",
kg and("in "..z.clock(kg.ends-cj).." (st "..kg.st.Name..")")or"- none running")end function z.clock(bI)bI=math.max(0,math.floor(bI))
if bI>=3600 then return("%d:%02d:%02d"):format(math.floor(bI/3600),math.floor((bI%3600)/60),bI%60)end return("%d:%02d"):format(math.floor(bI/60),bI%60)
end function z.allBusy()local zh,zi=fq()return zi>0 and zh==0 end function z.aboutToPlace()if not c.running then return false end
local qX=ac()if not(qX and aK(qX))then return false end local zj=fq()return zj>0 end function z.mult(qY,zk,qZ)return{(1+qY)*(1+qZ),(1+qY+zk)*(1+qZ)}end
function z.speedNow()local function kh(zl)return tonumber(J:GetAttribute(zl))or 0 end return z.mult(kh("PetWaxSpeed"),kh("PetLongWax"),kh("PetSocialWax"))
end function z.speedOf(zm)local zn,q0=z.teams()if not q0 then return nil end for FG,q1 in ipairs(zn)do if q1 .name==zm then
local ki={}for FH,zo in ipairs(q1 .pets or{})do for FI,q2 in ipairs(q0 .pets or{})do if tostring(q2 .id)==tostring(zo)then ki[#ki+1]=q2 break end end
end local q3=C.caps()local q4,zp=C.stats(ki)return z.mult(math.min(q4 .waxSpeed or 0,q3 .waxSpeed or 0.25),math.min(q4 .longWax or 0,q3 .longWax or 0.3),zp.socialWax or 0)
end end return nil end function z.speedRatio(zq)local q5,kj=z.speedNow(),z.speedOf(zq)if not kj then return{1,1}end
return{q5[1]/kj[1],q5[2]/kj[2]}end function z.glazeSoon()return d.Teams and d.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return J:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local kk=q.info()return(kk and type(kk.Caps)=="table")and kk.Caps or C.CAPS
end function C.value(q6,kl)local gA=q.info()local cX=gA and gA.Pets[q6]if not(cX and type(cX.boost)=="table")then return nil end
local cl if type(gA.boostValue)=="function"then local zr,zs=pcall(gA.boostValue,q6,(kl~=""and kl)or nil)cl=zr and tonumber(zs)or nil
end if not cl then cl=cX.boost.value or 0 if kl=="Big"then local q7=cl*1.5 cl=C.ROUND[cX.boost.kind]and math.max(cl+1,math.floor(q7+0.5))or q7
end end return cX.boost.kind,cl,cX.boost.every end function C.stats(zt)local cm,km={},{}for FJ,q8 in ipairs(zt)do
local aT,gB,q9=C.value(q8 .name,q8 .variant or"")if aT then if aT:sub(1,6)=="social"then km[aT]=math.max(km[aT]or 0,gB)
elseif aT=="waxStir"or aT=="cashGift"then cm[aT]=(cm[aT]or 0)+gB*60/(q9 or 60)elseif aT=="luckyPull"then cm.luckyPull=(cm.luckyPull or 0)+gB/(q9 or 10)
else cm[aT]=(cm[aT]or 0)+gB end end end return cm,km end function C.glazeGain(zu,gC)local ek,kn,FK={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local zv=ek[1]+ek[2]+ek[3]local zw=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local cY={}for gD=1,3 do cY[gD]=ek[gD]+zu*ek[gD]/zv+(gD==1 and zw or 0)end
local ko={cY[1]*(1-gC),cY[2]*(1-gC)+cY[1]*gC,cY[3]+cY[2]*gC}return ko[1]*(kn[1]-1)+ko[2]*(kn[2]-1)+ko[3]*(kn[3]-1)
end function C.score(gE,zx)local kp=C.caps()local gF,gG=C.stats(zx)local function bk(q_)return math.min(gF[q_]or 0,kp[q_]or math.huge)end
local zy=(1+bk("income"))*(1+(gG.socialIncome or 0))*(1+math.min(gF.cashGift or 0,kp.cashGiftPerMinute or 9)/60)
local zz=1+bk("luck")+(gF.luckyPull or 0)+(gG.socialLuck or 0)local ra=zz*(1+bk("newFind"))*(1+bk("rollSpeed"))
local el=math.log(zy)local zA=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local kq=(1+bk("waxSpeed")+bk("longWax"))*(1+(gG.socialWax or 0))
+math.min(gF.waxStir or 0,kp.waxStirPerMinute or 30)/60/zA local zB=1-(1-bk("headStart"))*(1-(gG.socialHeadStart or 0))
if gE=="farm"then return el+0.7*math.log(ra)+0.1*math.log(kq)end if gE=="full"then return el+0.4*math.log(kq)+0.02*math.log(ra)end
if gE=="glaze"then return C.glazeGain(bk("glaze"),bk("glazeUp"))+0.001*el end if gE=="wax"then return-math.log(1-0.5*zB)+0.001*el+0.001*math.log(kq)end
return el end function C.best(rb,cZ,zC,kr)kr=kr or{}local az,em={},{}local function rc(zD)local rd={}for zE,zF in ipairs(zD)do rd[zE]=cZ[zF]end return rd end
local function ks(re)local kt=C.score(rb,rc(re))for FL,zG in ipairs(re)do if kr[cZ[zG].id]then kt=kt+1e-7 end end
return kt end for FM=1,math.min(zC,#cZ)do local gH,ku for kv=1,#cZ do if not em[kv]then az[#az+1]=kv local rf=ks(az)
az[#az]=nil if not ku or rf>ku+1e-12 then gH,ku=kv,rf end end end if not gH then break end em[gH]=true az[#az+1]=gH
end for FN=1,6 do task.wait()local rg,rh=false,ks(az)for kw=1,#az do for kx=1,#cZ do if not em[kx]then local ri=az[kw]
az[kw]=kx local rj=ks(az)if rj>rh+1e-9 then em[ri],em[kx],rh,rg=nil,true,rj,true else az[kw]=ri end end end end
if not rg then break end end local rk={}for zH,zI in ipairs(az)do rk[zH]=tostring(cZ[zI].id)end return rk,C.score(rb,rc(az))
end function C.count(rl,rm,zJ)local en,eo={},0 local rn,ro={},{}for FO,zK in ipairs(rm.arriving or{})do rn[tostring(zK)]=true end
for FP,c0 in ipairs(rm.pets or{})do ro[tostring(c0 .id)]=true if c0 .name==rl and not rn[tostring(c0 .id)]then
if c0 .variant=="Big"then eo=eo+1 elseif(c0 .variant or"")==""then en[#en+1]=c0 end end end if not zJ then for FQ,ep in ipairs(q.recent or{})do
if ep.name==rl and not ro[ep.id]and y()-ep.at<20 then if ep.variant=="Big"then eo=eo+1 else en[#en+1]=ep end end
end end return en,eo end function C.goal(zL)local rp=d.Pets[zL]return rp and tonumber(rp.f)or 0 end function C.wantMore(rq,zM,rr)
local ky=C.goal(rq)if ky<=0 or not rr then return true end local zN,rs=C.count(rq,rr)if rs>=ky then return false end
if zM=="Big"then return true end return#zN<C.need()*(ky-rs)end function C.status(rt,ru)local gI=C.goal(rt)if gI<=0 or not ru then return nil end
local zO,kz=C.count(rt,ru)if kz>=gI then return("Big %d/%d done"):format(kz,gI)end return("%d/%d to fuse, Big %d/%d"):format(math.min(#zO,C.need()),C.need(),kz,gI)
end function C.wear(kA)local kB={}for FR,zP in ipairs(kA)do kB[tostring(zP)]=true end for FS=1,3 do local c1=q.data()
if not c1 then return false end for FT,rv in ipairs(c1 .equipped or{})do if not kB[tostring(rv)]then q.call("unequip",rv)task.wait(0.3)end
end c1=q.data()local rw={}for FV,zQ in ipairs(c1 .equipped or{})do rw[tostring(zQ)]=true end for FW,rx in ipairs(kA)do
if not rw[tostring(rx)]then q.call("equip",rx)task.wait(0.3)end end task.wait(0.4)c1=q.data()local kC,ry=0,true
for FX,zR in ipairs(c1 .equipped or{})do kC=kC+1 if not kB[tostring(zR)]then ry=false end end if ry and kC==#kA then return true end
end return false end function C.saveTeam(rz,rA)if not C.wear(rA)then return false,"could not put the pets on"end
local zS=z.teams()local cn for zT,zU in ipairs(zS)do if zU.name==rz then cn=zT break end end local c2 if cn then
c2=q.call("teamSave",cn)else c2=q.call("teamNew")if type(c2)=="table"and c2 .ok and c2 .index then cn=c2 .index
task.wait(0.3)q.call("teamRename",{index=cn,name=rz})end end task.wait(0.4)local kD=q.data()local rB=kD and kD.teams and cn and kD.teams[cn]
if not rB then return false,"the game did not save it"end local rC={}for FY,zV in ipairs(rB.pets or{})do rC[tostring(zV)]=true end
for FZ,zW in ipairs(rA)do if not rC[tostring(zW)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local zX=q.srv()for F0,zY in ipairs(z.list or{})do if zY.ends-zX<(d.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local eq=q.data()if not eq then return{}end local rD={}for F1,zZ in ipairs(eq.arriving or{})do rD[tostring(zZ)]=true end
local er={}for F2,gJ in ipairs(eq.pets or{})do if not rD[tostring(gJ.id)]then er[#er+1]={id=tostring(gJ.id),name=gJ.name,variant=gJ.variant or""}end
end local rE={}for F3,rF in ipairs(er)do rE[rF.id]=rF end local rG=tonumber(eq.slots)or 3 local kE,rH={},{}for F4,gK in ipairs(C.ROLES)do
local es=d[gK[1]]if es~=""and not rH[es]then rH[es]=true local kF,et,rI={},{},false for F5,rJ in ipairs(eq.teams or{})do
if rJ.name==es then for F6,z0 in ipairs(rJ.pets or{})do local kG=rE[tostring(z0)]if kG then kF[kG.id]=true et[#et+1]=kG else rI=true end
end end end local kH,rK=C.best(gK[2],er,rG,kF)local rL=C.score(gK[2],et)local rM=#kH==#et for F7,z1 in ipairs(kH)do if not kF[z1]then rM=false end end
if not rM and(rI or#et<math.min(rG,#er)or rK>rL+1e-4)then kE[#kE+1]={team=es,role=gK[2],ids=kH,gain=rK-rL}end
end end return kE end function C.rebuild(z2)local rN=C.plan()if#rN==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gL=true local z6,z7=pcall(function()for F8,eu in ipairs(rN)do local z3,z4=C.saveTeam(eu.team,eu.ids)local rO=q.data()
local kI={}for F9,z5 in ipairs(eu.ids)do for F_,kJ in ipairs(rO and rO.pets or{})do if tostring(kJ.id)==z5 then kI[#kI+1]=q.nice(kJ.name,kJ.variant)end
end end if z3 then A(("TEAM %s rebuilt (%s): %s"):format(eu.team,z2 or"pets changed",table.concat(kI,", ")))else gL=false A(("TEAM %s: %s"):format(eu.team,tostring(z4)))end
end end)z.editing,z.nextTry=false,0 if not z6 then gL=false A("TEAM BUILD ERR "..tostring(z7))end C.builds=C.builds+1
C.buildMsg=gL and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gL end
function C.fuseTick()if not d.AutoFuse or z.editing then return end local gM=q.data()if not gM then return end
local kK=C.need()local kL,gN={},{}for Ga,z8 in ipairs(gM.teams or{})do for Gb,z9 in ipairs(z8 .pets or{})do kL[tostring(z9)]=true end end
for Gc,z_ in ipairs(gM.equipped or{})do gN[tostring(z_)]=true end C.failUntil=C.failUntil or{}for co,Aa in pairs(d.Pets)do
local rP=tonumber(Aa.f)or 0 local kM,Ab=C.count(co,gM,true)if rP>0 and Ab<rP and#kM>=kK and y()>=(C.failUntil[co]or 0)then
table.sort(kM,function(gO,gP)local rQ=(gN[tostring(gO.id)]and 4 or 0)+(kL[tostring(gO.id)]and 2 or 0)+(gO.named and 1 or 0)
local rR=(gN[tostring(gP.id)]and 4 or 0)+(kL[tostring(gP.id)]and 2 or 0)+(gP.named and 1 or 0)if rQ~=rR then return rQ<rR end
return tostring(gO.id)<tostring(gP.id)end)local gQ,kN={},{}for gR=1,kK do gQ[gR]=tostring(kM[gR].id)if gN[gQ[gR]]then kN[#kN+1]=gQ[gR]end
end z.editing,z.editingSince=true,y()for Gd,Ac in ipairs(kN)do q.call("unequip",Ac)task.wait(0.3)end local gS=q.call("fuse",{ids=gQ})
z.editing,z.nextTry=false,0 if type(gS)=="table"and gS.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(kK,q.nice(co),q.nice(co)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(co),os.date("%H:%M"))else C.failUntil[co]=y()+120 A(("fuse %s failed: %s"):format(q.nice(co),type(gS)=="table"and tostring(gS.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not d.AutoBuild or not d.Teams then return end local rS=q.data()
if not rS then return end local cp={}for Ge,Ad in ipairs(rS.pets or{})do cp[#cp+1]=tostring(Ad.id)end table.sort(cp)
cp=table.concat(cp,",")if cp~=C.sig then C.sig,C.dirtyAt=cp,y()end local Ae=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if Ae and not z.editing then local Af=C.rebuild(C.dirtyAt and"pets changed"or"check")if Af then C.dirtyAt,C.lastBuild=nil,y()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(cq)return cq:IsA("ParticleEmitter")or cq:IsA("Trail")or cq:IsA("Beam")or cq:IsA("Fire")or cq:IsA("Smoke")
or cq:IsA("Sparkles")or cq:IsA("Light")end function j.muteOne(aH)if not d.Lite or not aH.Parent then return end
local gT=(aH:IsA("BillboardGui")and j.bb)or(j.isFx(aH)and j.fx)or nil if not gT or gT[aH]~=nil then return end
gT[aH]=aH.Enabled if aH.Enabled then aH.Enabled=false end j.watch[aH]=aH:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aH.Enabled then gT[aH]=true aH.Enabled=false end end)end function j.lite(rT)d.Lite=rT if rT then
task.spawn(function()for Ag,Ah in ipairs(au:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,Ah)
if Ag%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=T(au.DescendantAdded:Connect(function(kO)
if d.Lite and(kO:IsA("BillboardGui")or j.isFx(kO))then j.queue[#j.queue+1]=kO end end))end local kP=game:GetService("Lighting")
for Gf,ev in ipairs(kP:GetChildren())do if ev:IsA("PostEffect")and ev.Enabled and j.post[ev]==nil then j.post[ev]=true ev.Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and kP.GlobalShadows or j.oldShadows kP.GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and au.Terrain.Decoration or j.oldDeco au.Terrain.Decoration=false end)
else for Gg,Ai in pairs(j.watch)do pcall(function()Ai:Disconnect()end)end for rU,Aj in pairs(j.bb)do pcall(function()if rU.Parent then rU.Enabled=Aj end end)end
for rV,Ak in pairs(j.fx)do pcall(function()if rV.Parent then rV.Enabled=Ak end end)end for rW in pairs(j.post)do pcall(function()if rW.Parent then rW.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local Al=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()Al.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()au.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(rX)d.HideHud=rX local kQ=J:FindFirstChildOfClass("PlayerGui")if not kQ then return end if rX then
for Gh,ew in ipairs(kQ:GetChildren())do if ew:IsA("ScreenGui")and not j.MINE[ew.Name]and ew.Enabled then j.hud[ew]=true ew.Enabled=false end
end if not j.hudConn then j.hudConn=T(kQ.ChildAdded:Connect(function(ex)if d.HideHud and ex:IsA("ScreenGui")and not j.MINE[ex.Name]then
task.defer(function()if d.HideHud and ex.Enabled then j.hud[ex]=true ex.Enabled=false end end)end end))end else
for rY in pairs(j.hud)do pcall(function()if rY.Parent then rY.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(kR)d.FpsCap=kR local rZ=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not rZ then return false end return pcall(rZ,kR==0 and 60 or kR)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(an)if an:IsA("BasePart")or an:IsA("Decal")or an:IsA("Texture")then if an.Transparency<1 then j.unseen[an]=an.Transparency an.Transparency=1 end
elseif an:IsA("BillboardGui")or an:IsA("SurfaceGui")or an:IsA("ParticleEmitter")or an:IsA("Beam")or an:IsA("Trail")or an:IsA("Light")or an:IsA("Fire")or an:IsA("Smoke")or an:IsA("Sparkles")then
if an.Enabled then j.unseen[an]=true an.Enabled=false end end end function j.notMine(Am)return d.HideMine or(c.plot and not Am:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(r0)if d.HideBases then j.bases(false)end d.HideMine=r0==2 if r0>0 then j.bases(true)end end
function j.bases(r1)d.HideBases=r1 local kS=au:FindFirstChild("Plots")if not kS then return end if r1 then task.spawn(function()
local kT=0 for Gi,r2 in ipairs(kS:GetChildren())do if r2~=c.plot or d.HideMine then for Gj,An in ipairs(r2:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,An)kT=kT+1 if kT%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=T(kS.DescendantAdded:Connect(function(r3)if d.HideBases and j.notMine(r3)then task.defer(function()pcall(j.hideOne,r3)end)end
end))end else for kU,r4 in pairs(j.unseen)do pcall(function()if not kU.Parent then return end if type(r4)=="number"then kU.Transparency=r4 else kU.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(r5)d.NoRender=r5 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not r5)end)
end j.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
j.calmed={}function j.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local Ao=game:GetService("RunService")
local kV=0 for Gk,Ap in ipairs({"RenderStepped","Heartbeat","Stepped"})do local Aq,r6=pcall(function()return Ao[Ap]end)
local r7,kW=false,nil if Aq and r6 then r7,kW=pcall(getconnections,r6)end if r7 and type(kW)=="table"then for Gl,kX in ipairs(kW)do
local kY=""pcall(function()local r8=getfenv(kX.Function).script kY=r8 and r8:GetFullName()or""end)if kY~=""then
for Gm,Ar in ipairs(j.CALM)do if kY:find(Ar,1,true)then if pcall(function()kX:Disable()end)then j.calmed[#j.calmed+1]=kX kV=kV+1 end
break end end end end end end if#j.calmed>200 then local kZ={}for As=#j.calmed-49,#j.calmed do kZ[#kZ+1]=j.calmed[As]end j.calmed=kZ
end return kV end function j.calm(r9)d.Calm=r9 if r9 then local At=j.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(At))
else for Gn,Au in ipairs(j.calmed)do pcall(function()Au:Enable()end)end j.calmed={}end end function j.restoreAll()
pcall(j.unpin)pcall(j.calm,false)if d.HideBases then pcall(j.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(r_)if c.rejoining then return end A("REJOIN this server ("..r_..")")
pcall(ft)if c.autoload then pcall(fU,c.autoload)end op()local Av=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then dK(r_..", same server failed")end end)return Av end function j.tick()
local k0=j.queue if d.Lite and k0 and#k0>0 then j.queue={}for Aw,Ax in ipairs(k0)do pcall(j.muteOne,Ax)if Aw%300==0 then task.wait()end end
end local sa=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if sa then for Go,Ay in ipairs(sa:GetChildren())do
local sb=Ay:FindFirstChild("SquishyPlaceHolder")local cr=sb and sb:FindFirstChild("TimerGui")if cr and cr:IsA("BillboardGui")then
if j.bb[cr]==nil then pcall(j.muteOne,cr)elseif cr.Enabled then j.bb[cr]=true cr.Enabled=false end end end end
local Az,ey=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Az and type(ey)=="number"then
j.mem=ey j.memPeak=math.max(j.memPeak,ey)if(d.MemLimit or 0)>0 and ey>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(ey,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if y()-(j.noteAt or 0)>1800 then j.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function k1(gU)if type(gU)~="string"then return false end
gU=gU:lower()for Gp,AA in ipairs(c.sellWords)do if gU:find(AA,1,true)then return true end end return false end
local function AB()local sc=ah:FindFirstChild("Remotes")local k2=sc and sc:FindFirstChild("SellSquishy")if not(k2 and k2:IsA("RemoteEvent"))then return false end
if not pcall(function()k2:FireServer()end)then return false end return ap(function()return ac()==nil end,1.5)
end local function AC()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local sd=ao()local se=sd and sd.HumanoidRootPart.Position local ez,sf for Gq,c3 in ipairs((c.plot or au):GetDescendants())do
if c3:IsA("ProximityPrompt")and(k1(c3 .ActionText)or k1(c3 .ObjectText)or k1(c3 .Name))then local sh=nl(c3)local k3=(sh and se)and(sh-se).Magnitude or 1e9
if k3<=400 and(not ez or k3<sf)then ez,sf=c3,k3 end end end c.sellSpot=ez c.noSellSpot=(ez==nil)return ez end
local function sj()local k4=ac()if not k4 then c.holding=false return false end if aK(k4)then return false end
local k5=ak(W(k4))if AB()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..k5)return true end local c4=AC()if c4 then local sk=dx(c4)if sk then b7(sk,c4)local sl=ac()if sl and not aK(sl)then
local AD,AE=dQ(c4,function()return ac()==nil end,function()return c4 .Enabled end)if AD then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(k5,fo(c4),AE))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..k5 .." ("..c.sellFails..")")
return false end local AF={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function AG(c5)local gV=fo(c5):lower()for Gr,AH in ipairs(AF)do if gV:find(AH,1,true)then return 0 end end
local a6,aq=c5 .Name:lower(),0 local function aU(AI,AJ)return AI:find(AJ,1,true)~=nil end if aU(a6,"collect")then aq=aq+60 end
if aU(a6,"cash")or aU(a6,"money")then aq=aq+45 end if aU(a6,"income")or aU(a6,"claim")then aq=aq+35 end if aU(a6,"coin")or aU(a6,"earn")or aU(a6,"green")then aq=aq+20 end
if a6=="pad"or a6=="touch"then aq=aq+25 end if aq==0 and(aU(gV,"collect")or aU(gV,"cash")or aU(gV,"money"))then aq=25 end
if aq==0 then return 0 end local eA=c5 .Color if eA.G>0.5 and eA.G>eA.R*1.4 and eA.G>eA.B*1.4 then aq=aq+15 end
if math.min(c5 .Size.X,c5 .Size.Y,c5 .Size.Z)<2 then aq=aq+5 end return aq end local function AK()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local gW,eB,k6={},nil,29 for Gs,gX in ipairs(c.plot:GetDescendants())do
if gX:IsA("BasePart")then local gY=AG(gX)if gY>0 then gW[#gW+1]={s=gY,p=gX}if gY>k6 then eB,k6=gX,gY end end end
end table.sort(gW,function(AL,AM)return AL.s>AM.s end)c.padCands,c.padPart=gW,eB if eB then A("collect pad: "..fo(eB).." (score "..k6 ..")")end
return eB end local k7="SAB_pad_v1.txt"local function AN(AO)if type(writefile)=="function"then pcall(writefile,k7,table.concat({AO:GetComponents()},","))end
end local function AP()if type(isfile)~="function"or type(readfile)~="function"then return nil end local AQ,sm=pcall(function()if isfile(k7)then return readfile(k7)end end)
if not AQ or type(sm)~="string"then return nil end local gZ={}for AS in sm:gmatch("[^,]+")do gZ[#gZ+1]=tonumber(AS)end
if#gZ==12 then return CFrame.new(unpack(gZ))end end local function AT(k8,g0,AU)local AV=cM(k8)local k9=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aV=(k9 and k9:IsA("BasePart"))and(k9 .Position-g0)or Vector3 .new(1,0,0)aV=Vector3 .new(aV.X,0,aV.Z)if aV.Magnitude<0.05 then aV=Vector3 .new(1,0,0)end
aV=aV.Unit for AW=0,7 do local g1=AW*math.pi/4 local AX=Vector3 .new(aV.X*math.cos(g1)-aV.Z*math.sin(g1),0,aV.X*math.sin(g1)+aV.Z*math.cos(g1))
local g2=g0+AX*(AU+5)local k_=f2(g2 .X,g0 .Y,g2 .Z)if k_ and math.abs(k_.Y-g0 .Y)<8 then aD(k8,Vector3 .new(g2 .X,k_.Y+AV,g2 .Z))
if i_(k8,0.7)then return true end end end return false end local function AY()c.lastCollect=y()local eC=ao()if not eC then return end
local sn,AZ=eC.HumanoidRootPart,cM(eC)local eD,so,eE,la=nil,4,nil,"?"local lb=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and lb and lb:IsA("BasePart")then eD,la=(lb.CFrame*c.manualPad).Position,"manual pad"else local bl=AK()
if bl then eD=Vector3 .new(bl.Position.X,bl.Position.Y+bl.Size.Y/2+AZ,bl.Position.Z)so,eE,la=math.max(bl.Size.X,bl.Size.Z)/2,bl,bl.Name
end end if not eD then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local lc=a_()aD(eC,eD)
if eE and type(firetouchinterest)=="function"then pcall(firetouchinterest,sn,eE,0)end af(d.PadDwell)if eE and type(firetouchinterest)=="function"then pcall(firetouchinterest,sn,eE,1)end
af(0.5)c.collected=c.collected+1 local ld=a_()A(("COLLECTED (%s) %s"):format(la,(lc and ld and ld>lc)and("+$"..aL(ld-lc))or"no cash change seen"))
AT(eC,eD,so)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local sp=ah:FindFirstChild("Modules")if not sp then return false end local function le(A0)local sq=sp:FindFirstChild(A0)
if not sq then return nil end local A1,sr=pcall(require,sq)return(A1 and type(sr)=="table")and sr or nil end o.si,o.arm,o.ci=le("SquishyInfo"),le("AutoRollRules"),le("CrateInfo")
o.modAt=y()if not o.si then return false end local lf={}if o.arm and type(o.arm.tierOf)=="table"then for lg in pairs(o.arm.tierOf)do
local g3=o.si[lg]if type(g3)=="table"and g3 .rarity~="Limited"and not g3 .incomeType and not g3 .hiddenAfter then lf[W(lg)]=lg end
end end o.roll=lf local g4={}for A2,A3 in pairs(lf)do local eF=o.si[A3]if type(eF)=="table"and type(eF.income)=="number"and not eF.incomeType then
g4[#g4+1]={k=A2,inc=eF.income,pr=tonumber(eF.price)or 0}end end table.sort(g4,function(lh,li)if lh.inc~=li.inc then return lh.inc>li.inc end return lh.pr>li.pr end)
o.order=g4 local g5,lj,lk local A4=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for A5,ll in pairs(A4)do
local lm=type(ll)=="table"and tonumber(ll.price)if lm and(not lj or lm>lj)then g5,lj,lk=A5,lm,ll.title end end
o.bestCrate,o.bestCrateName=g5 and L.key(g5),g5 o.bestCrateTitle=lk and L.key(lk)or nil return true end function o.rank(A6)
local A7,A8=pcall(function()return o.arm.rankOf(A6)end)return(A7 and tonumber(A8))or 0 end function o.loadDisc(ss)
if type(ss)~="table"then return end local su={}for A9,A_ in pairs(ss)do if A_ then su[W(tostring(A9))]=true end end
o.disc,o.discAt=su,y()end function o.fetch()o.discAt=y()local sv=ah:FindFirstChild("Remotes")local sx=sv and sv:FindFirstChild("GetSquishiesDiscovered")
if not sx then return end local Ba,Bb=pcall(function()return sx:InvokeServer()end)if Ba then o.loadDisc(Bb)end
end function o.scanWax()local ln={}local sy=c.plot and c.plot:FindFirstChild("WaxStations")if sy then for Gt,sz in ipairs(sy:GetChildren())do
local sA=sz:FindFirstChild("SquishyPlaceHolder")if sA and sz:GetAttribute("HasSquishy")then for Gu,sB in ipairs(sA:GetChildren())do if sB:IsA("Model")then ln[W(sB.Name)]=true end end
end end end for sC,Bc in pairs(o.placedAt)do if y()-Bc<20 then ln[sC]=true else o.placedAt[sC]=nil end end o.waxing=ln
end function o.compute()local sD,lo,lp={},0,0 if o.disc then for lq in pairs(o.roll or{})do if not o.disc[lq]then
if o.waxing[lq]then lp=lp+1 else sD[lq],lo=true,lo+1 end end end end o.need,o.nNeed,o.nWax=sD,lo,lp local sE,lr={},d.Best or 0
local ls=(lr==4)and o.stackMin or nil for Bd,sF in ipairs(o.order)do if(ls and sF.inc>ls)or(not ls and Bd<=(lr==4 and 1 or lr))then sE[sF.k]=true end
end o.best=sE end function o.readStack()o.stackAt=y()local sG=ah:FindFirstChild("Remotes")local sH=sG and sG:FindFirstChild("EditStack")
if not sH then return end local Be,c6=pcall(function()return sH:InvokeServer("State",nil)end)if not(Be and type(c6)=="table"and type(c6 .state)=="table"and type(c6 .state.entries)=="table")then return end
local g6 for Gv,sI in ipairs(c6 .state.entries)do local eG=type(sI)=="table"and o.si and o.si[tostring(sI.name)]
if type(eG)=="table"and type(eG.income)=="number"and not eG.incomeType and(not g6 or eG.income<g6)then g6=eG.income end
end o.stackMin=g6 o.stackFull=#c6 .state.entries>=(tonumber(c6 .state.capacity)or 100)end function o.want(lt)
if(d.Best or 0)>0 and(next(o.best)or(d.Best==4 and o.stackMin))then if o.best[lt]then return true end elseif d.Targets[lt]then
return true end return d.AutoIndex==true and o.need[lt]==true end function o.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(o.best)~=nil)or(d.AutoIndex and next(o.need)~=nil)
or d.Best==4 end function o.placed(Bf)local eH=W(Bf)o.placedAt[eH],o.waxing[eH]=y(),true if o.need[eH]then o.need[eH],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eH)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eI,eJ={},{}for Bg,Bh in pairs(o.roll or{})do if o.want(Bg)then eI[Bh]=true end end
for sJ,lu in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(sJ)or(type(lu)=="table"and type(lu.title)=="string"and L.wanted(lu.title))then eJ[sJ]=true end
end if not next(eI)and not next(eJ)then return nil end if o.arm and type(o.arm.encode)=="function"then local Bi,sK=pcall(o.arm.encode,{rarities={},butters=eI,crates=eJ,index=false})
if Bi and type(sK)=="string"then return sK end end local function sL(Bj)local g7={}for Bk in pairs(Bj)do g7[#g7+1]=Bk end table.sort(g7)return table.concat(g7,",")end
local eK="adv:"if next(eI)then eK=eK..";butters:"..sL(eI)end if next(eJ)then eK=eK..";crates:"..sL(eJ)end return eK
end function o.canon(Bl)local g8={}for sM in tostring(Bl or""):gmatch("[^;]+")do local lv,sN=sM:match("^(%a+):(.*)$")
if not lv then lv,sN="r",sM:gsub("^adv:","")end for Bm in sN:gmatch("[^,]+")do g8[#g8+1]=lv.."="..Bm end end table.sort(g8)
return table.concat(g8,"|")end function o.sync(Bn)if J:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local cs=o.rulesNow()if not cs or#cs>1900 then return end if o.canon(J:GetAttribute("AutoRollRules"))==o.canon(cs)then o.fails=0 return end
if not Bn and y()-o.sentAt<4 then return end local sO=ah:FindFirstChild("Remotes")local sP=sO and sO:FindFirstChild("AutoRollAction")
if not sP then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()sP:FireServer("Rules",cs)end)D.replaying=false d.ARrules=cs
local g9,g_=0,0 for Gw in(cs:match("butters:([^;]*)")or""):gmatch("[^,]+")do g9=g9+1 end for Gx in(cs:match("crates:([^;]*)")or""):gmatch("[^,]+")do g_=g_+1 end
local sQ=g9 .."/"..g_ if o.told~=sQ then o.told=sQ A(("auto roll now stops on %d butters and %d crates"):format(g9,g_))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if d.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aN={}if d.AutoIndex then aN[#aN+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if d.Best==4 then local eL=0 for Gy in pairs(o.best)do eL=eL+1 end
aN[#aN+1]=eL==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eL,eL==1 and""or"s")
elseif(d.Best or 0)>0 and o.order[1]then aN[#aN+1]="best: "..ak(o.order[1].k)end if d.BestCrate and o.bestCrateName then aN[#aN+1]="crate: "..o.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aN[#aN+1]="shower: "..O.got end o.msg=#aN>0 and table.concat(aN," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(Bo)o.feed[#o.feed+1]=os.date("%H:%M ")..Bo if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(sR,av,ha)if sR~="Effect"then o.feedAdd(tostring(sR)..(av~=nil and(": "..tostring(av):sub(1,80))or""))
return end if av~="ShowerTaken"and av~="GoalPoint"then o.feedAdd(tostring(av))end if av=="Shower"then O.add(ha)return end
if av=="ShowerTaken"then O.gone(ha)return end if av=="ShowerClear"then O.drops={}return end if av=="WaxGlow"then
local lw=type(ha)=="table"and tonumber(ha.SnapAt)if lw then o.snapAt=lw A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lw-q.srv()),(d.SnapGlaze~=false and d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end av=tostring(av)b3("Admin "..av)if av~="GoalPoint"and y()-(o.heard[av]or-100)>30 then o.heard[av]=y()
A("ADMIN: "..av)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(lx)if type(lx)~="table"or type(lx.Pieces)~="table"then return end
for Gz,aW in pairs(lx.Pieces)do if type(aW)=="table"and aW.Id~=nil and aW.Position~=nil then O.drops[aW.Id]={id=aW.Id,butter=tostring(aW.Butter or"?"),rar=tostring(aW.Rarity or"?"),star=aW.Star==true,
pos=aW.Position,opens=tonumber(aW.OpensAt)or 0,ends=tonumber(aW.ExpiresAt)or 0}end end end function O.gone(eM)
if type(eM)~="table"or eM.Id==nil then return end O.drops[eM.Id]=nil if tonumber(eM.UserId)==q.uid then O.mine=eM.Id end
end function O.pick()local ly=q.srv()local lz,sS for sT,ct in pairs(O.drops)do if ly>=ct.ends-0.3 then O.drops[sT]=nil
elseif ly>=ct.opens-0.2 and(O.tried[sT]or 0)<3 then local sU=(aK(ct.butter)and 1e6 or 0)+(ct.star and 1e5 or 0)+o.rank(ct.rar)*100-(ct.ends-ly)
if not lz or sU>sS then lz,sS=ct,sU end end end return lz end function O.due()return d.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aO,lA=O.pick(),ao()if not(aO and lA)then return end O.tried[aO.id]=(O.tried[aO.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aD(lA,aO.pos+Vector3 .new(0,cM(lA)+0.5,0))ap(function()return O.mine==aO.id or ac()~=nil or not O.drops[aO.id]end,1.5)
if O.mine==aO.id or ac()then O.got,O.drops[aO.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aO.butter)),aO.rar,aO.star and" (star)"or""))
elseif not O.drops[aO.id]then O.miss=O.miss+1 end end local eN local function sV()if c.capHit then if d.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eN(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ao()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bv(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local lB,sW=fq()
local hb=ac()if hb then local c7=ak(W(hb))if not aK(hb)then local lC=(V.gift and W(V.gift)==W(hb)and y()-V.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c7,lC),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c7,lC),"bad"end return"sell",("selling %s (%s)"):format(c7,lC),"warn"
end if lB<1 then return nil,("holding %s - 0 free stations"):format(c7),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c7),"wait"end
return"place",("waxing %s (%d free)"):format(c7,lB),"ok"end c.holding=false if d.Crates and not e.waiting and y()-(e.scanAt or 0)>1 and y()>(e.quietUntil or 0)then
e.scanAt=y()local lD=c.plot:FindFirstChild("CrateStand")if lD then for GA,eO in ipairs(lD:GetDescendants())do
if eO:IsA("ProximityPrompt")and eO.Enabled and jq(eO)then local bm=eO.ObjectText if bm==""then bm=cF(lD,"TitleLabel")or""end
if bm~=""and L.wanted(bm)then local Bp=fm(bm):gsub("crate$","")local sX for sY in pairs(ad.members)do if fm(sY)==Bp then sX=sY end end
e.waiting,e.at,e.title,e.prompt=true,y(),bm,eO e.data={name=(bm:gsub("%s","")),rarity=sX,title=bm}A(bm.." found waiting on your stand")
end break end end end end local sZ=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and sZ then
local aX=e.title if y()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aX),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aX.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aX),"bad"end if y()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aX),"bad"
end if e.byYou and y()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aX,math.ceil(60-(y()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aX),"ok"end if e.at and y()-e.at>e.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aX,math.floor(e.GIVEUP/60)),"bad"
end if e.summonFails>=3 then if y()-e.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aX,
math.ceil(45-(y()-e.lastFail))),"bad"end e.summonFails,e.nearFails,e.prompt=0,0,nil A("trying the "..aX.." again")
end if y()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aX),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aX,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not sZ then local s0=e.title..tostring(e.rolledAt)if e.told~=s0 then e.told=s0 A(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and y()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if lB<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(sW,sW),"wait"
end local lE=nz()if not lE then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c8=b2()
if c8 and oZ(c8 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(c8 .name),"idle"end
if y()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c8 .name),"bad"end if not ph()then return nil,("%s rolled - waiting for it to land on the stand"):format(c8 .name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c8 .name),"ok"end local bJ=i8()if bJ.state~="match"then
c.matchSince=nil if bJ.state=="skip"and not lE.Enabled then return nil,bJ.text.." (sold out)","idle"end return nil,bJ.text,bJ.level
end if not lE.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eP=y()if eP<c.noCashUntil then
local s1,Bq=dM()if s1 then return nil,("cash short: have $%s, price ~$%s"):format(aL(s1),aL(Bq)),"bad"end return nil,(dM()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aL(a_()),math.ceil(c.noCashUntil-eP)),dM()and"bad"or"wait"end if eP-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eP local s2=eP-c.matchSince if s2<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bJ.shown,s2),"ok"end
return"buy",("buying %s via %s"):format(bJ.shown,bJ.src),"ok"end j.DEPTH=11 function j.pinTick()local s3=j.hold
if not s3 then return end local lF=J.Character local lG=lF and lF:FindFirstChild("HumanoidRootPart")if not lG then return end
lG.CFrame=s3 lG.AssemblyLinearVelocity=Vector3 .new(0,0,0)for GB,hc in ipairs(lF:GetChildren())do if hc:IsA("BasePart")and hc.CanCollide then j.noclip[hc]=true hc.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(Br,s4)j.hold=Br if s4 then j.surface=s4 end end function j.unpin(Bs)
if not j.hold then return end j.hold=nil for s5 in pairs(j.noclip)do pcall(function()if s5 .Parent then s5 .CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local s6=ao()if s6 and j.surface and not Bs then aD(s6,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bn,s7=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ao()
if not(bn and bn:IsA("BasePart")and s7)then return nil end local s8=no()or bn.Position local hd=Vector3 .new(s8 .X-bn.Position.X,0,s8 .Z-bn.Position.Z)
hd=hd.Magnitude>0.1 and hd.Unit or Vector3 .new(0,0,1)local he=bn.Position+hd*6 local s9=f2(he.X,bn.Position.Y,he.Z,{bn})
return CFrame.new(he.X,(s9 and s9 .Y or bn.Position.Y)+cM(s7),he.Z)end function j.ground(Bt,s_,Bu)local lH,lI={J.Character},nil
for GC=1,12 do local lJ=RaycastParams.new()lJ.FilterType=Enum.RaycastFilterType.Exclude lJ.FilterDescendantsInstances=lH
local hf=au:Raycast(Vector3 .new(Bt,s_,Bu),Vector3 .new(0,-2000,0),lJ)if not hf then break end lI,s_=hf,hf.Position.Y-0.05
lH[#lH+1]=hf.Instance end return lI and lI.Position.Y end function j.parkHome()local lK=j.home()if not lK then return false end
local c9=lK.Position local Bv=j.ground(c9 .X,c9 .Y+300,c9 .Z)or(c9 .Y-3)j.pin(CFrame.new(c9 .X,Bv-8,c9 .Z),lK)
return true end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}
function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end function j.setGhost(hg)d.Ghost,d.GhostHelps=hg==2,hg==1
if hg<2 then task.spawn(function()while c.busy do af(0.1)end if j.ghostMode()<2 and j.hold and not E.home then pcall(j.unpin)end
end)end j.paintGhost()A("ghost: "..j.GHOST[hg][1]:sub(8):lower())end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end
function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end local Bw=ao()if not Bw or K.seat()then return end
j.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0 function K.seat()local ta=J.Character
local tb=ta and ta:FindFirstChildOfClass("Humanoid")local lL=tb and tb.SeatPart return(lL and lL.Name=="LogSeat")and lL or nil
end function K.due()if not(d.Campfire and c.running)or y()<K.nextAt then return false end local Bx=au:FindFirstChild("NightSeats")
if not Bx then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"return false
end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or y()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(K.msg)return false end end return true end function K.sit()local tc,hh=au:FindFirstChild("NightSeats"),ao()
if not tc or not hh then return end local td,c_=hh.HumanoidRootPart.Position,{}for GD,hi in ipairs(tc:GetChildren())do
local te=hi:IsA("Seat")and hi.Occupant==nil and hi:FindFirstChildOfClass("ProximityPrompt")if te then c_[#c_+1]={st=hi,p=te}end
end if#c_==0 then K.nextAt,K.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(c_,function(By,Bz)return(By.st.Position-td).Magnitude<(Bz.st.Position-td).Magnitude end)
local BA,BB=c_[1].st,c_[1].p j.unpin(true)local da=BA.CFrame aD(hh,da.Position+da.LookVector*2+Vector3 .new(0,2.5,0),da.Position)
af(0.25)local BC=dQ(BB,function()return K.seat()~=nil end)if not BC then aD(hh,da.Position+Vector3 .new(0,2,0),da.Position+da.LookVector)
ap(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=y()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then A(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local lM=ah:FindFirstChild("Remotes")if not lM then return end local eQ,lN,db=0,0,{}
local BD,tf=pcall(function()return lM.ClanRequest:InvokeServer("state")end)local th=BD and type(tf)=="table"and tf.tasks
for GE,bK in ipairs(th and th.list or{})do if not bK.done and bK.kind=="pull"then eQ=math.max(eQ,(bK.goal or 0)-(bK.progress or 0))end
if not bK.done then db[#db+1]=("%s %d/%d"):format(tostring(bK.text),bK.progress or 0,bK.goal or 0)end end F.events={}
for GF,dc in ipairs(lM:GetChildren())do if dc:IsA("RemoteFunction")and dc.Name:match("^%u%a+Action$")and dc.Name~="CrateAction"and dc.Name~="AutoRollAction"then
local BE,eR=pcall(function()return dc:InvokeServer("state")end)if BE and type(eR)=="table"and eR.live==true and type(eR.quests)=="table"then
F.events[#F.events+1]={r=dc,st=eR}for GG,aP in ipairs(eR.quests)do if not aP.done and aP.kind=="pull"then eQ=math.max(eQ,(aP.goal or 0)-(aP.progress or 0))end
if not aP.done and aP.kind=="collect"then lN=math.max(lN,(aP.goal or 0)-(aP.progress or 0))end if not aP.done then db[#db+1]=("%s %d/%d"):format(tostring(aP.text),aP.progress or 0,aP.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eQ,lN F.msg=#db>0 and("open: "..table.concat(db,", "))or"all quests done for today"
end function F.claim()for GH,eS in ipairs(F.events)do local ti=eS.r.Name:gsub("Action$","")for GI,dd in ipairs(eS.st.quests)do
if dd.done and not dd.claimed then local BF,tj=pcall(function()return eS.r:InvokeServer("claimQuest",dd.id)end)
if BF and not(type(tj)=="table"and tj.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(ti,tostring(dd.text),tostring(dd.points or dd.treats or"?")))
end af(0.4)end end if eS.st.bonusReady==true then local BG=pcall(function()return eS.r:InvokeServer("claimBonus")end)
if BG then A(("CLAIMED %s daily quest bonus"):format(ti))end af(0.4)end end end function F.tick()if not(d.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return d.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local tk=c.plot and c.plot:FindFirstChild("Lever")
local lO=tk and tk:FindFirstChild("Wheel")return lO and lO:FindFirstChildWhichIsA("ProximityPrompt"),lO end function F.resume(BH)
F.arPaused=false if F.arWas then F.arWas=false d.AutoRoll=true task.spawn(D.apply,BH)end end function F.pull()
local hj,lP=F.lever()if not hj or not lP or not lP:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hj.Enabled then F.nextAt=y()+1 return end b7(lP,hj)F.asked=nil oO(hj)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
af(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bL,BI)local lQ=bL:GetAttribute("PourOwner")
if type(lQ)~="number"or lQ==q.uid or not bL:GetAttribute("HasSquishy")then return false end if bL:GetAttribute("PourLong")~=true or bL:GetAttribute("PourFull")==true then return false end
local lR=bL:GetAttribute("PourId")if lR==nil or E.skip[lR]then return false end local tl,lS,BJ=bL:GetAttribute("Helpers"),0,tostring(q.uid)
if type(tl)=="string"then for BK in tl:gmatch("[^,%s]+")do lS=lS+1 if BK==BJ then return false end end end if lS>=6 then return false end
local hk=z.left(bL)if not hk then local tm=tonumber(bL:GetAttribute("PourEnd"))hk=tm and(tm-BI)end if not hk or hk<=75 then return false end
local lT=game:GetService("Players"):GetPlayerByUserId(lQ)if not lT or lT:GetAttribute("WaxHelpOff")==true then return false end
return true,lT,lR end function E.list()local lU,BL={},q.srv()local tn=au:FindFirstChild("Plots")for GJ,to in ipairs(tn and tn:GetChildren()or{})do
local tp=to~=c.plot and to:FindFirstChild("WaxStations")for GK,lV in ipairs(tp and tp:GetChildren()or{})do local BM,BN,BO=E.can(lV,BL)
local lW=BM and lV:FindFirstChild("SquishyPlaceHolder")if lW and lW:IsA("BasePart")then lU[#lU+1]={st=lV,p=BN,id=BO,part=lW}end
end end return lU end function E.due()return d.Help and c.running and y()>=E.nextAt end function E.skipIt(tq,tr)
E.skip[tq],E.skipN=tr,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[tq]=tr},1,{}end end function E.goHome()
local hl,bM=ao(),E.home E.home=nil if not(hl and bM)then return end if d.Ghost and not K.seat()then j.unpin(true)
if not j.parkHome()then pcall(aD,hl,bM.Position,bM.Position+bM.LookVector)end elseif j.hold or(hl.HumanoidRootPart.Position-bM.Position).Magnitude>20 then
j.unpin(true)pcall(aD,hl,bM.Position,bM.Position+bM.LookVector)end end function E.step()local lX,eT=E.list(),ao()
if#lX==0 or not eT then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local ts=eT.HumanoidRootPart local tt=ts.Position table.sort(lX,function(BP,BQ)return(BP.part.Position-tt).Magnitude<(BQ.part.Position-tt).Magnitude end)
local aY=lX[1]E.home=E.home or(j.hold and j.surface)or ts.CFrame local bN=aY.part local eU=(bN.Position+aY.st:GetPivot().Position)/2
local hm=E.tries[aY.id]or 0 if(d.Ghost or d.GhostHelps)and hm==0 and not K.seat()then j.pin(bN.CFrame,E.home)
else j.unpin(true)local lY=hm==0 and f2(eU.X,bN.Position.Y,eU.Z,{bN})if lY and math.abs(lY.Y-bN.Position.Y)<8 then
aD(eT,Vector3 .new(eU.X,lY.Y+cM(eT),eU.Z),bN.Position)else aD(eT,bN.Position+Vector3 .new(0,bN.Size.Y/2+3,0),eU)
end end af(0.3)local eV=ah:FindFirstChild("Remotes")eV=eV and eV:FindFirstChild("ClanRequest")if not eV then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hn,bo=pcall(function()return eV:InvokeServer("help",aY.st:GetAttribute("PourOwner"),tonumber(aY.st.Name))end)
if hn and type(bo)=="table"and bo.ok then E.n,E.fails=E.n+1,0 E.skipIt(aY.id,"helped")A(("HELPED %s's wax (station %s)"):format(aY.p.DisplayName,aY.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hn and type(bo)=="table"and tostring(bo.reason or""):lower():find("walk up",1,true)and hm<2 then
E.tries[aY.id]=hm+1 E.nextAt=y()+0.3 elseif hn and type(bo)=="table"and tostring(bo.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local tu=(hn and type(bo)=="table"and tostring(bo.reason or"refused"))or("error: "..tostring(bo))
E.skipIt(aY.id,tu)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aY.p.DisplayName,tu))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bp)if not d.HelpGuild or type(bp)~="table"or bp.p~="help"or bp.mine or bp.u==q.uid or not bp.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eW=ah:FindFirstChild("Remotes")
eW=eW and eW:FindFirstChild("ClanRequest")if not eW then return end local tv,eX=pcall(function()return eW:InvokeServer("callHelp",bp.u)end)
local tw=tostring(bp.n or bp.un or bp.u)if tv and type(eX)=="table"and eX.ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(tw))
else A(("guild call from %s: %s"):format(tw,(tv and type(eX)=="table"and tostring(eX.reason or"refused"))or tostring(eX)))
end end)end local function ar(BR,tx,...)if c.busy then return end c.busy,c.busyText=true,BR if j.hold and tx~=E.step then pcall(j.unpin)end
local BS,ty=pcall(tx,...)c.busy,c.busyText=false,""if not BS and ty~=ij then A("ERR "..tostring(ty))end end local function BT()
local aQ,BU,BV=sV()c.reason,c.level=BU,BV if aQ=="place"then ar("waxing...",z.place)elseif aQ=="crate"then ar("opening crate...",d1,true)
elseif aQ=="cratesmart"then ar("opening crate...",e.smart)elseif aQ=="cratewin"then ar("opening the crate window...",js)
elseif aQ=="nocrate"then ar("discarding crate...",d1,false)elseif aQ=="cratedrop"then ar("discarding a crate that would not open...",e.drop)
elseif aQ=="sell"then ar("selling...",sj)elseif aQ=="buy"then ar("buying...",oR,false)elseif not aQ and not c.matchSince and O.due()then
ar("grabbing a butter from the admin shower...",O.grab)elseif not aQ and not c.matchSince and K.due()then ar("sitting at the campfire...",K.sit)
elseif not aQ and not c.matchSince and F.pullDue()and not ac()and not(b2()and aK(b2().name))then ar("pulling the lever for a quest...",F.pull)
elseif d.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ar("collecting money...",AY)elseif not aQ and not c.matchSince and E.due()then ar("helping a wax...",E.step)elseif E.home and not d.Help then
ar("coming back...",E.goHome)elseif not c.busy then j.parkTick()end end function eN(ho,BW)if ho==c.running then return end
c.running=ho if not BW then d.AutoStart=ho end if ho then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bv()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bO=fO(am.auto)if type(bO)=="string"then bO=bO:gsub("%s+$","")
if bO~=""then c.autoload=bO local BX=oj(bO)A(BX and("loaded config "..bO)or("config "..bO.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local BY={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local lZ={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local tz,tA,tB,tC=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if tz and tA and tB and tC then ae.x,ae.b,ae.m,ae.r=tz,tA,tB,tC end end)pcall(function()local tD=Enum.Font.RobotoMono if tD then ae.mono=tD end end)
local function H(BZ,B0,B1)local B2,l0=pcall(Instance.new,BZ)if not B2 then c.uiErrs=c.uiErrs+1 return nil end
for B3,B4 in pairs(B0)do if not pcall(function()l0[B3]=B4 end)then c.uiErrs=c.uiErrs+1 end end l0 .Parent=B1 return l0
end local function ab(B5,B6)H("UICorner",{CornerRadius=UDim.new(0,B6 or 8)},B5)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hp,l1)if hp and a.shown[hp]~=l1 then a.shown[hp]=l1 hp.Text=l1 end
end function a.stroke(B7,B8,B9)return H("UIStroke",{Color=B8 or l.line,Thickness=1,Transparency=B9 or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},B7)
end function a.grad(B_,Ca,Cb,Cc)local Cd,tE=pcall(function()return ColorSequence.new(Ca,Cb)end)if Cd and tE then return H("UIGradient",{Color=tE,Rotation=Cc or 0},B_)end
end function a.pad(Ce,tF,tG,Cf,Cg)H("UIPadding",{PaddingLeft=UDim.new(0,tF or 0),PaddingTop=UDim.new(0,tG or 0),
PaddingRight=UDim.new(0,Cf or tF or 0),PaddingBottom=UDim.new(0,Cg or tG or 0)},Ce)end function a.list(Ch,Ci,Cj)
return H("UIListLayout",{Padding=UDim.new(0,Ci or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Cj and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Ch)
end function a.ink(l2)local Ck,Cl=pcall(function()return 0.299*l2 .R+0.587*l2 .G+0.114*l2 .B end)return(Ck and Cl>0.55)and l.ink or l.text
end function a.nextIn(tH)local tI=(a.ord[tH]or 0)+1 a.ord[tH]=tI return tI end local l3=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local tJ=l3:FindFirstChild("SABFarmGui")if tJ then tJ:Destroy()end local l4=H("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},l3)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local hq=au.CurrentCamera.ViewportSize if hq.X>100 and hq.Y>100 then Q.w=math.clamp(math.floor(hq.X*0.48),320,400)
Q.h=math.clamp(math.floor(hq.Y*0.86),250,360)end end)a.root=H("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},l4)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local tK=UDim2 .new(1,0,1,0)
local function GL(tL,tM)return UDim2 .new(tL,0,0,0),UDim2 .new(tM,(tL+tM>0.99)and 0 or-4,1,0)end local function ai(Cm,Cn,eY,Co,Cp,Cq)
local l5=H("TextButton",{Text=Cn,Position=Cp,Size=Cq,BackgroundColor3=eY,BorderSizePixel=0,Font=ae.b,TextSize=Co,TextColor3=a.ink(eY),AutoButtonColor=true},Cm)
ab(l5,8)if eY==l.panel2 or eY==l.raise or eY==l.panel then a.stroke(l5,l.line,0.4)end return l5 end local function hr(Cr,Cs,Ct,Cu,Cv)
local hs=H("TextBox",{Text=Cs,PlaceholderText=Ct,Position=Cu,Size=Cv,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Cr)ab(hs,8)a.stroke(hs,l.line,0)a.pad(hs,9,0,6,0)
return hs end local ht=au.CurrentCamera local function Cw()local Cx,hu=pcall(function()return ht and ht.ViewportSize end)
if Cx and hu and hu.X>50 and hu.Y>50 then return hu end end local function bP(eZ)local l6=Cw()if not(l6 and eZ and eZ.Parent)then return end
local Cy=pcall(function()local hv,tN=eZ.AbsolutePosition,eZ.AbsoluteSize local l7=70 local tO=math.clamp(hv.X,l7-tN.X,l6 .X-l7)
local tP=math.clamp(hv.Y,0,l6 .Y-math.min(tN.Y,l7))if math.abs(tO-hv.X)>0.5 or math.abs(tP-hv.Y)>0.5 then eZ.Position=UDim2 .new(0,math.floor(tO),0,math.floor(tP))
end end)return Cy end local function hw(Cz)local CA,l8=pcall(function()return Cz.AbsolutePosition end)if CA and l8 then return{math.floor(l8 .X),math.floor(l8 .Y)}end
end local de={}c.dragMoved={}local function tQ(e0,tR,l9)T(e0 .InputBegan:Connect(function(df)if df.UserInputType~=Enum.UserInputType.MouseButton1 and df.UserInputType~=Enum.UserInputType.Touch then return end
local l_={start=df.Position,from=tR.Position,moved=0,target=tR,input=df,onDrop=l9}de[e0],c.dragMoved[e0]=l_,0
local ma ma=df.Changed:Connect(function()if df.UserInputState==Enum.UserInputState.End and de[e0]==l_ then de[e0]=nil
if ma then ma:Disconnect()end if l9 then l9(l_.moved)end end end)end))end T(m8 .InputChanged:Connect(function(hx)
if hx.UserInputType~=Enum.UserInputType.MouseMovement and hx.UserInputType~=Enum.UserInputType.Touch then return end
for CB,a7 in pairs(de)do local mb=a7 .target if mb and mb.Parent then local tS,tT=hx.Position.X-a7 .start.X,hx.Position.Y-a7 .start.Y
a7 .moved=math.max(a7 .moved,math.abs(tS)+math.abs(tT))c.dragMoved[CB]=a7 .moved mb.Position=UDim2 .new(a7 .from.X.Scale,a7 .from.X.Offset+tS,a7 .from.Y.Scale,a7 .from.Y.Offset+tT)
end end end))T(m8 .InputEnded:Connect(function(hy)if hy.UserInputType~=Enum.UserInputType.MouseButton1 and hy.UserInputType~=Enum.UserInputType.Touch then return end
for CC,hz in pairs(de)do if hz.input==hy or hy.UserInputType==Enum.UserInputType.MouseButton1 then de[CC]=nil
if hz.onDrop then hz.onDrop(hz.moved)end end end end))local function P(CD,CE,CG,CH,CI,CJ,CK)return H("TextLabel",{Text=CE,Position=CJ or UDim2 .new(0,0,0,0),Size=CK or tK,BackgroundTransparency=1,
Font=CI and ae.b or ae.m,TextSize=CG,TextColor3=CH,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},CD)
end function a.row(tU,CL)return H("Frame",{Size=UDim2 .new(1,0,0,CL),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(tU)},tU)end function a.card(tV,tW,tX)local dg=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(tV)},tV)ab(dg,11)a.stroke(dg,l.line,0.25)a.list(dg,5)a.pad(dg,8,8,8,9)
if tW then local mc=a.row(dg,14)H("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},mc)P(mc,tW:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if tX then local CM=P(mc,tX,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
CM.TextXAlignment=Enum.TextXAlignment.Right end end return dg end function a.heading(CN,CO,md)local me=a.row(CN,md and 34 or 22)
P(me,CO,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if md then P(me,md,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return me end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(mf)local aI=a.sw[mf]if not aI then return end
local dh=tostring(mf.Text or""):match(":%s*(.-)%s*$")or""local bQ=dh~=""and not a.OFF[dh]local mg=not aI.chips and(dh=="ON"or dh=="OFF")
aI.pill.Visible,aI.chip.Visible=mg,not mg if mg then aI.pill.BackgroundColor3=bQ and l.accent or l.panel2 aI.knob.Position=bQ and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aI.knob.BackgroundColor3=bQ and l.white or l.dim else aI.chip.Text=dh~=""and dh or"-"aI.chip.BackgroundColor3=bQ and l.accent or l.panel2
aI.chip.TextColor3=bQ and l.ink or l.dim end mf.BackgroundColor3=bQ and l.lit or l.raise if aI.edge then aI.edge.Color=bQ and l.accent or l.line aI.edge.Transparency=bQ and 0.55 or 0.45 end
end function a.switch(tY,CP,CQ,e1)local aZ=H("TextButton",{Name="Switch",Text=CP,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,e1 and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(tY)},tY)
ab(aZ,9)local as={edge=a.stroke(aZ,l.line,0.45)}as.title=P(aZ,CQ,11,l.text,true,UDim2 .new(0,10,0,e1 and 4 or 0),UDim2 .new(1,-100,0,e1 and 15 or 28))
as.title.TextWrapped,as.title.TextTruncate=false,Enum.TextTruncate.AtEnd if e1 then as.sub=P(aZ,e1,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
as.sub.TextWrapped,as.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end as.pill=H("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},aZ)ab(as.pill,9)as.knob=H("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},as.pill)ab(as.knob,7)as.chip=H("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},aZ)
ab(as.chip,9)a.pad(as.chip,10,0,10,0)H("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},as.chip)
as.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[aZ]=as T(aZ:GetPropertyChangedSignal("Text"):Connect(function()a.skin(aZ)end))
a.skin(aZ)return aZ end function a.chips(mh)if a.sw[mh]then a.sw[mh].chips=true a.skin(mh)end end function a.line(CS,CT)
local tZ=a.row(CS,15)local t0=H("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=CT or l.dim,
BorderSizePixel=0},tZ)ab(t0,3)local mi=P(tZ,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mi.TextWrapped,mi.TextTruncate=false,Enum.TextTruncate.AtEnd
return mi,t0 end function a.grow(t1,CU,CV)local hA=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=CU or 10,TextColor3=CV or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(t1)},t1)
T(hA:GetPropertyChangedSignal("Text"):Connect(function()hA.Visible=hA.Text~=""end))return hA end function a.note(CW,CX)
local t2=a.grow(CW,9,l.dim)t2 .Text=CX return t2 end function a.actions(CY,t3)local CZ=a.row(CY,28)local t4,mj={},#t3
for e2,t5 in ipairs(t3)do t4[e2]=ai(CZ,t5[1],t5[2]or l.panel2,10,UDim2 .new((e2-1)/mj,e2>1 and 3 or 0,0,0),UDim2 .new(1/mj,(e2>1 and-3 or 0)+(e2<mj and-3 or 0),1,0))
end return table.unpack(t4)end local function M(cu,hB,C0,C1)a.put(cu,hB and C0 or C1)if not a.sw[cu]and a.lit[cu]~=hB then
a.lit[cu]=hB cu.BackgroundColor3=hB and l.accent or l.panel2 cu.TextColor3=a.ink(cu.BackgroundColor3)end end a.title=H("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)H("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
H("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local mk=H("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(mk,8)a.grad(mk,l.accent,l.accent2,45)local t6=P(mk,"C",16,l.ink,true)t6 .Font,t6 .TextXAlignment=ae.x,Enum.TextXAlignment.Center
local C2=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))C2 .Font=ae.x P(a.title,"butter farm  "..bX,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local C3=a.list(a.tabs,3)pcall(function()C3 .HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function bq(C4,C5,C6)
local hC=H("TextButton",{Text=C4,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(hC,9)local t7=H("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hC)ab(t7,2)a.tabsAll[#a.tabsAll+1]={b=hC,bar=t7,name=C5,sub=C6}return hC end
a.tabFarm=bq("🏠","Home","what the farm is doing")a.tabRun=bq("🌾","Farm","the buy - wax - collect loop")a.tabBut=bq("🧈","Butters","what gets bought and waxed")
a.tabCrt=bq("📦","Crates","which crates get opened")a.tabPet=bq("🐾","Pets","adopt, wish, fuse")a.tabTeam=bq("👥","Teams","the right pets at the right moment")
a.tabSrv=bq("🤝","Server","helping, campfire, ghost")a.tabAdm=bq("⚡","Admin","admin abuse and its boosts")a.tabSet=bq("⚙","Settings","configs, startup, performance")
local function br()local ml=H("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(ml,8)a.pad(ml,8,2,10,12)return ml end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=br(),br(),br(),br(),br(),br(),br(),br(),br()a.farm.Visible=true
do local e3=a.farm local t8=a.row(e3,34)a.startB=ai(t8,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(t8,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local C7=a.row(e3,44)local function e4(t9,C8,t_)local hD=H("Frame",{Position=UDim2 .new((t9-1)/t_,t9>1 and 2 or 0,0,0),Size=UDim2 .new(1/t_,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},C7)ab(hD,9)a.stroke(hD,l.line,0.3)local hE=P(hD,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hE.Font,hE.TextXAlignment,hE.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local C9=P(hD,C8,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
C9 .TextXAlignment=Enum.TextXAlignment.Center return hE end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e4(1,"BOUGHT",5),e4(2,"WAXED",5),e4(3,"SOLD",5),e4(4,"MONEY",5),e4(5,"FREE",5)
local ua=a.card(e3,"Right now")a.info=P(a.row(ua,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(ua,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local e5=a.card(e3,"Systems")
a.helpL=a.line(e5,l.info)a.campL=a.line(e5,l.accent2)a.questL=a.line(e5,l.good)a.arL=a.line(e5,l.accent)a.ixL=a.line(e5,lZ.Dotonbori)
local ub=a.card(e3,"Activity")a.log=H("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(ub)},ub)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function GM(C_,Da)return a.row(Da or a.farm,C_)end local al do local mm=a.run
a.heading(mm,"Farm","buy what rolls, wax it, collect the cash")local e6=a.card(mm,"Loop")a.colT=a.switch(e6,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(e6,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hr(al,tostring(d.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(e6,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(e6,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(e6,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local mn=a.card(mm,"By hand")
a.buyB,a.plB=a.actions(mn,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(mn,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(mn,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local hF=a.but a.heading(hF,"Butters","what gets bought and waxed")local uc=a.card(hF,"Strategy")a.ixT=a.switch(uc,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(uc,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hF)},hF)a.list(a.butList,5)end do local hG=a.crt a.heading(hG,"Crates","only ticked crates are opened")
local ud=a.card(hG,"Opening")a.crateT=a.switch(ud,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(ud,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hG)},hG)a.list(a.crtList,5)end do local hH=a.pet a.heading(hH,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local e7=a.card(hH,"Automatic")a.pbT=a.switch(e7,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(e7,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(e7,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(e7,10,l.dim)a.note(e7,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hH)},hH)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hI=a.srv a.heading(hI,"Server","other players, the campfire, staying hidden")
local mo=a.card(hI,"Helping")a.helpT=a.switch(mo,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(mo,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mo,l.info)
local ue=a.card(hI,"Campfire")a.campT=a.switch(ue,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(ue,l.accent2)local mp=a.card(hI,"Ghost")a.ghostT=a.switch(mp,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mp,l.dim)a.note(mp,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local e8=a.adm a.heading(e8,"Admin abuse","the show, its boosts and the farm in it")local uf=a.card(e8,"When")
a.admBig=P(a.row(uf,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(uf,14),"",10,l.dim,false)local Db=a.card(e8,"Boosts now")
a.admBoost=a.grow(Db,11,l.text)local mq=a.card(e8,"What the farm does")a.shT=a.switch(mq,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mq,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(mq,l.accent)
local ug=a.card(e8,"Show feed")a.admFeed=H("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(ug)},ug)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local di=a.set a.heading(di,"Settings","kept on your phone, per config")
local hJ=a.card(di,"Config")al=a.row(hJ,28)a.cfgName=hr(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hJ,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hJ,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(hJ,10,l.dim)local mr=a.card(di,"Starting")a.startT=a.switch(mr,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mr,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(mr,9,l.dim)local ms=a.card(di,"If the game drops me")
a.rejT=a.switch(ms,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(ms,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(ms,9,l.dim)local bs=a.card(di,"Performance")a.pfCalm=a.switch(bs,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bs,"LITE MODE: OFF","Lite mode","labels, sparkles, lighting extras off")a.pfBases=a.switch(bs,"BASES: ALL DRAWN","Bases","stop drawing other bases, or yours too")
a.pfFps=a.switch(bs,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bs,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bs,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bs,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hr(al,tostring(d.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bs,l.good)a.note(bs,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local Dc=a.card(di,"About")a.note(Dc,"CHURN "..bX.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for GN,Dd in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(Dd)end local uh=H("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},l3)
a.tgRoot=H("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},uh)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=H("TextButton",{Text="C",Size=tK,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=H("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=H("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()
local e9=j.ghostMode()if a.ghostT then a.put(a.ghostT,j.GHOST[e9][1])end if a.tgGhost then a.tgGhost.Text=j.GHOST[e9][2]
a.tgGhost.BackgroundColor3=e9==2 and l.accent or(e9==1 and l.warn or l.panel)a.tgGhost.TextColor3=e9>0 and l.ink or l.dim
end end local bt={built=false,boxes={},at=0}function a.check(hK,mt)hK.Text=mt and"✓"or""hK.BackgroundColor3=mt and l.accent or l.bg
hK.TextColor3=l.ink local mu=hK.Parent if mu and mu:IsA("TextButton")then mu.BackgroundColor3=mt and l.lit or l.raise end
end local function ui(uj,uk)d.Targets[uj]=uk or nil local ul=bt.boxes[uj]if ul then a.check(ul,uk)end end local function mv()
for De,Df in pairs(bt.boxes)do a.check(Df,d.Targets[De]==true)end end function a.tickBox(Dg)local mw=H("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Dg)ab(mw,6)
a.stroke(mw,l.line,0)return mw end local e_ local function Dh()local Di=a.card(a.butList,"Butter list")local mx=a.row(Di,26)
a.butInfo=P(mx,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local Dj=ai(mx,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Dk=ai(mx,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))Dj.MouseButton1Click:Connect(function()
for Dl in pairs(d.Targets)do d.Targets[Dl]=nil end mv()end)Dk.MouseButton1Click:Connect(function()ad.at=0 iU()
e_(true)end)end e_=function(Dm)if not iU()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bt.built and not Dm and bt.at==ad.at then return end for GO,hL in ipairs(a.butList:GetChildren())do
if hL:IsA("Frame")or hL:IsA("TextButton")or hL:IsA("TextLabel")then hL:Destroy()end end bt.boxes,a.butEmpty={},nil
Dh()for GP,hM in ipairs(ad.rarOrder)do local my=lZ[hM]or l.text local cv=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cv,11)a.stroke(cv,my,0.7)a.list(cv,4)a.pad(cv,7,7,7,8)
local mz=a.row(cv,22)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=my,BorderSizePixel=0},mz)
local Dn=P(mz,hM:upper(),11,my,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))Dn.Font=ae.x local Do=ai(mz,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local Dp=hM Do.MouseButton1Click:Connect(function()local um=ad.members[Dp]or{}local uo=false for GQ,Dq in ipairs(um)do if not d.Targets[Dq]then uo=true break end end
for GR,Dr in ipairs(um)do ui(Dr,uo)end end)for GS,mA in ipairs(ad.members[hM]or{})do local hN=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cv)},cv)ab(hN,8)local up=P(hN,ak(mA),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
up.TextWrapped,up.TextTruncate=false,Enum.TextTruncate.AtEnd local uq=a.tickBox(hN)bt.boxes[mA]=uq local ur=mA
local function us()ui(ur,not d.Targets[ur])end hN.MouseButton1Click:Connect(us)uq.MouseButton1Click:Connect(us)
end end mv()bt.built,bt.at=true,ad.at end function L.paint()for Ds,Dt in pairs(L.boxes)do a.check(Dt,d.CrateTicks[Ds]==true)end
if a.crtInfo then local mB,mC=0,0 for GT in pairs(L.boxes)do mB=mB+1 end for GU,Du in pairs(d.CrateTicks)do if Du then mC=mC+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(mB,mC))end if a.crateT then M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for GV,hO in ipairs(a.crtList:GetChildren())do if hO:IsA("Frame")or hO:IsA("TextButton")or hO:IsA("TextLabel")then hO:Destroy()end
end L.boxes={}local mD=a.card(a.crtList,"All of them","worst first")local mE=a.row(mD,26)a.crtInfo=P(mE,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Dv=ai(mE,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Dw=ai(mE,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(Dv.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))T(Dw.MouseButton1Click:Connect(function()L.build()end))
for GW,bu in ipairs(L.list())do local ut=lZ[bu.rar or""]or l.text local dj=H("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(mD)},mD)ab(dj,8)H("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=ut,BorderSizePixel=0},dj)
local uu=P(dj,(bu.title or bu.name)..(bu.guess and"  (?)"or""),11,ut,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
uu.TextWrapped,uu.TextTruncate=false,Enum.TextTruncate.AtEnd local Dx=P(dj,bu.price and("$"..aL(bu.price))or(bu.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Dx.TextXAlignment=Enum.TextXAlignment.Right local uv=a.tickBox(dj)L.boxes[bu.k]=uv local uw=bu.k local function ux()
d.CrateTicks[uw]=(not d.CrateTicks[uw])or nil L.paint()end T(dj.MouseButton1Click:Connect(ux))T(uv.MouseButton1Click:Connect(ux))
end L.built=L.at L.paint()end local uy="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a0(cw)uy=cw for Dy,mF in ipairs(a.tabKeys)do a[mF].Visible=(mF==cw)local hP=a.tabsAll[Dy]if hP then
local mG=mF==cw hP.b.BackgroundTransparency,hP.b.TextTransparency,hP.bar.Visible=mG and 0 or 1,mG and 0 or 0.45,mG
end end if cw=="pet"and not q.built then pcall(q.build)end if cw=="team"and not z.built then pcall(z.build)end
if cw=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cw=="but"then e_(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(mH,uz,uA,uB)if uB then mH.Text=uB end mH.BackgroundColor3=uz and uA or l.bg mH.TextColor3=uz and a.ink(uA)or l.dim
end function q.paintRow(uC)local cx=q.rows and q.rows[uC]if not cx then return end local cy=d.Pets[uC]or{}local fa=tonumber(cy.f)or 0
a.flag(cx.b,cy.b,l.good)a.flag(cx.g,cy.g,l.accent,cy.g and"BIG"or"ANY")a.flag(cx.w,cy.w,l.warn)a.flag(cx.f,fa>0,l.good,fa>=7 and"7 BIG/HUGE"or(fa>0 and(fa.." BIG")or"FUSE"))
if cx.row then cx.row.BackgroundColor3=(cy.b or cy.w or fa>0)and l.lit or l.raise end end function q.flag(mI,hQ)
local a8=d.Pets[mI]or{}if hQ=="f"then local Dz={[0]=1,[1]=2,[2]=3,[3]=7}local uD=Dz[tonumber(a8 .f)or 0]or 0 a8 .f=uD>0 and uD or nil
elseif a8[hQ]then a8[hQ]=nil else a8[hQ]=true end d.Pets[mI]=(a8 .b or a8 .g or a8 .w or a8 .f)and a8 or nil q.paintRow(mI)
end function q.paintAll()for DA in pairs(q.rows or{})do q.paintRow(DA)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local mJ=q.wishes()local fb=q.data()for hR,mK in pairs(q.rows)do local uE=C.status(hR,fb)mK.desc.Text=(mJ[hR]and("wishing %dm | "):format(math.ceil(mJ[hR]/60))or"")..(uE and(uE.." | ")or"")..mK.boostText
mK.desc.TextColor3=mJ[hR]and l.text or l.dim end local uF=tonumber(J:GetAttribute("PetWishCredits"))or 0 a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(fb and#(fb.pets or{})or 0,fb and tonumber(fb.maxOwned)or 60,
aL(q.money()),uF>0 and(" | free wishes "..uF)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local hS=q.info()for GX,hT in ipairs(a.petList:GetChildren())do if hT:IsA("Frame")or hT:IsA("TextLabel")or hT:IsA("TextButton")then hT:Destroy()end
end q.rows={}if not hS then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dk={}for GY,uG in ipairs(q.order())do local mL=hS.Pets[uG].rarity or"?"dk[mL]=dk[mL]or{}
table.insert(dk[mL],uG)end local dl={}for GZ,uH in ipairs(hS.Rarities or{})do if dk[uH]then dl[#dl+1]=uH end end
for uI in pairs(dk)do if not table.find(dl,uI)then dl[#dl+1]=uI end end for G0,mM in ipairs(dl)do local hU=q.RC[mM]or l.text
local cz=H("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cz,11)a.stroke(cz,hU,0.7)a.list(cz,4)a.pad(cz,7,7,7,8)local uJ=a.row(cz,18)H("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=hU,BorderSizePixel=0},uJ)
local DB=P(uJ,mM:upper(),11,hU,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))DB.Font=ae.x for G1,hV in ipairs(dk[mM])do
local fc=H("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cz)},cz)
ab(fc,8)local mN=P(fc,q.nice(hV),11,hU,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))mN.TextWrapped,mN.TextTruncate=false,Enum.TextTruncate.AtEnd
local DC,DD=pcall(function()return hS.describe(hV)end)local uK=DC and tostring(DD)or""local mO=P(fc,uK,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
mO.TextYAlignment,mO.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function hW(DE,DF,DG)
local uL=ai(fc,DE,l.bg,8,UDim2 .new(1,DF,0,5),UDim2 .new(0,DG,0,22))uL.AutoButtonColor=true return uL end local uM,uN,uO,uP=hW("BUY",-164,30),hW("ANY",-131,30),hW("WISH",-98,34),hW("FUSE",-61,56)
local hX=hV uM.MouseButton1Click:Connect(function()q.flag(hX,"b")end)uN.MouseButton1Click:Connect(function()q.flag(hX,"g")end)
uO.MouseButton1Click:Connect(function()q.flag(hX,"w")end)uP.MouseButton1Click:Connect(function()q.flag(hX,"f")end)
q.rows[hV]={b=uM,g=uN,w=uO,f=uP,name=mN,desc=mO,boostText=uK,row=fc}end end q.built=true q.paintAll()end function j.paint()
M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.Calm then j.calm(true)end if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end T(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()j.calm(not d.Calm)j.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local DH=table.find(j.CAPS,d.FpsCap or 0)or 1 local uQ=j.CAPS[(DH%#j.CAPS)+1]
if not j.cap(uQ)and uQ~=0 then A("this executor cannot cap fps")end j.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local mP=tonumber(a.pfMem.Text)if mP and mP>=0 then d.MemLimit=math.floor(mP)end j.paint()end))function z.names()
local mQ={"(none)"}for G2,DI in ipairs((z.teams()))do mQ[#mQ+1]=DI.name end return mQ end function z.cycle(mR,DJ)
local hY=z.names()local DK=d[mR]~=""and d[mR]or"(none)"local hZ=table.find(hY,DK)or 1 hZ=((hZ-1+DJ)%#hY)+1 d[mR]=hY[hZ]=="(none)"and""or hY[hZ]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local mS={}for G3,DL in ipairs((z.teams()))do mS[DL.name]=true end
for DM,uR in pairs(z.pick)do local dm=d[DM]uR.Text=dm==""and"(none)"or(mS[dm]and dm or(dm.." (missing)"))uR.TextColor3=(dm~=""and not mS[dm])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local DN,h0=q.srv(),{}for G4,h1 in ipairs(z.list or{})do h0[#h0+1]=("st %-2s %-22s %9s  helps %d"):format(h1 .st.Name,ak(W(h1 .name)):sub(1,22),z.clock(h1 .ends-DN),h1 .helps)
end a.tmList.Text=#h0>0 and table.concat(h0,"\n")or"no waxes running"end function z.build()for G5,h2 in ipairs(a.teamList:GetChildren())do
if h2:IsA("Frame")or h2:IsA("TextLabel")or h2:IsA("TextButton")then h2:Destroy()end end z.pick={}local h3=a.card(a.teamList,"Automatic")
a.tmT=a.switch(h3,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(h3,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild z.paint()end)a.tmBuildNow=a.actions(h3,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local DO,DP=pcall(C.rebuild,"you asked")if not DO then A("BUILD ERR "..tostring(DP))end end)
end)a.tmInfo=a.grow(h3,10,l.dim)local uS=a.card(a.teamList,"Which team when")local function h4(h5,DQ,DR)local fd=a.row(uS,54)
P(fd,DQ,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local uT=P(fd,DR,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
uT.TextWrapped,uT.TextTruncate=false,Enum.TextTruncate.AtEnd local DS=ai(fd,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local uU=ai(fd,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local DT=ai(fd,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
DS.MouseButton1Click:Connect(function()z.cycle(h5,-1)end)DT.MouseButton1Click:Connect(function()z.cycle(h5,1)end)
uU.MouseButton1Click:Connect(function()z.cycle(h5,1)end)z.pick[h5]=uU end h4("TeamNormal","Normal","the rest of the time: money + luck")
h4("TeamFull","Full","every station busy: money + wax speed")h4("TeamGlaze","Glaze","worn just before a wax finishes")
local h6=a.row(uS,26)P(h6,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hr(h6,tostring(d.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(h6,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local DU=ai(h6,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
DU.MouseButton1Click:Connect(function()local h7=tonumber(a.tmLead.Text)if h7 and h7>=5 and h7<=600 then d.GlazeLead=math.floor(h7)else a.tmLead.Text=tostring(d.GlazeLead)end
z.paint()end)h4("TeamWax","Wax","while a butter is placed: head starts")local uV=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=H("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(uV)},uV)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local DV=a.card(a.teamList,"How it works")a.note(DV,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function DW()a.secB.Text=tostring(d.Every)M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not E.home then pcall(j.unpin)end end)end
M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eN(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bP(a.root)bP(a.tgRoot)c.lastCollect=y()
mv()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(j.applyAll)end local function DX(uW)task.spawn(function()uW.TextColor3=l.bad
task.wait(0.8)if c.alive then uW.TextColor3=l.text end end)end local function uX()local uY=a.secB.Text:match("^%s*(%d+)%s*$")
local fe=uY and tonumber(uY)if not fe or fe<1 then a.secB.Text=tostring(d.Every)DX(a.secB)A("interval must be a whole number >= 1")
return end if fe==d.Every then return end d.Every,c.lastCollect=fe,y()A("collect every "..fe.."s")end local function N(DY,DZ)T(DY.MouseButton1Click:Connect(DZ))end
N(a.secSet,uX)T(a.secB.FocusLost:Connect(uX))N(a.colT,function()d.Collect,c.lastCollect=not d.Collect,y()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(ar,"selling...",sj)end)N(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
d.Help=not d.Help E.nextAt,E.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()d.Quests=not d.Quests F.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
d.Campfire=not d.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,j.cycleGhost)function o.paint()M(a.snapT,d.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
M(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(D0)task.spawn(function()pcall(o.tick)if D0 and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local D1=o.on()d.AutoIndex=not d.AutoIndex o.discAt=-100 o.changed(D1)end)
N(a.bestT,function()local D2=o.on()d.Best=((d.Best or 0)+1)%5 o.stackAt=-100 o.changed(D2)end)N(a.bcT,function()
local D3=o.on()d.BestCrate=not d.BestCrate o.changed(D3)end)N(a.shT,function()d.Shower=not d.Shower o.paint()
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
local dp,mT={},ah:FindFirstChild("AdminShow")if mT then local D4,D5=pcall(function()return mT:GetAttributes()end)
for uZ,dq in pairs(D4 and D5 or{})do local h8=type(uZ)=="string"and uZ:match("^(.-)Mult$")local mU=h8 and tonumber(mT:GetAttribute(h8 .."Until"))
if h8 and type(dq)=="number"and dq~=1 and dq~=0 and mU and mU>bR then dp[#dp+1]=("%s  x%s   %s left"):format(h8:gsub("(%l)(%u)","%1 %2"),(dq%1==0)and tostring(dq)or("%.2f"):format(dq),
z.clock(mU-bR))end end end table.sort(dp)a.put(a.admBoost,#dp>0 and table.concat(dp,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dp>0 and l.accent or l.dim local h9=0 for G6 in pairs(O.drops)do h9=h9+1 end local u0=o.snapAt and(o.snapAt-bR)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,h9>0 and(", "..h9 .." falling")or"",
u0 and("in "..math.max(0,math.floor(u0)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(ar,"opening crate...",d1,true)end)N(a.padB,function()c.plot=bv()or c.plot local u1,mV=ao(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(u1 and mV and mV:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=mV.CFrame:ToObjectSpace(u1 .HumanoidRootPart.CFrame)
AN(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eN(not c.running)end)N(a.buyB,function()
c.plot=bv()or c.plot task.spawn(ar,"buying (manual)...",oR,true)end)N(a.plB,function()c.plot=bv()or c.plot task.spawn(ar,"waxing (manual)...",oV)
end)N(a.tabFarm,function()a0("farm")end)N(a.tabRun,function()a0("run")end)N(a.tabSrv,function()a0("srv")end)N(a.tabAdm,function()a0("adm")end)
N(a.tabBut,function()a0("but")end)N(a.tabSet,function()a0("set")end)N(a.tabCrt,function()a0("crt")end)N(a.tabPet,function()a0("pet")end)
N(a.tabTeam,function()a0("team")end)local function D6(mW)c.hidden=mW a.root.Visible=not mW a.tgBtn.TextColor3=mW and l.text or l.ink
end tQ(a.tgBtn,a.tgRoot,function()bP(a.tgRoot)c.togPos=hw(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then D6(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aJ,aw={},0 local function bV()aJ=oa()if#aJ==0 then a.cfgPick.Text="(none saved)"
aw=0 return end if aw<1 or aw>#aJ then aw=1 end a.cfgPick.Text=aJ[aw]..("  (%d/%d)"):format(aw,#aJ)end local function u2()
local u3=c.autoload~=nil a.cfgAuto.Text=u3 and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=u3 and l.accent or l.panel2
end local function mX()local u4=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if u4~=""then return u4 end return(aw>0 and aJ[aw])or""
end N(a.cfgSave,function()c.winPos=hw(a.root)or c.winPos c.togPos=hw(a.tgRoot)or c.togPos local u5,u6=fU(mX())
a.cfgMsg.Text=u5 and("saved as "..u6)or("could not save: "..u6)a.cfgMsg.TextColor3=u5 and l.good or l.bad bV()
A(a.cfgMsg.Text)end)local function D7(mY)local mZ,u7=oj(mY)a.cfgMsg.Text=mZ and("loaded "..u7)or("could not load: "..u7)
a.cfgMsg.TextColor3=mZ and l.good or l.bad if mZ then a.cfgName.Text=mY DW()task.spawn(D.apply,"config "..mY)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()D7(mX())end)N(a.cfgPick,function()bV()if aw>0 then a.cfgName.Text=aJ[aw]end
end)N(a.cfgPrev,function()if#aJ==0 then bV()return end aw=(aw-2)%#aJ+1 bV()a.cfgName.Text=aJ[aw]end)N(a.cfgNext,function()
if#aJ==0 then bV()return end aw=aw%#aJ+1 bV()a.cfgName.Text=aJ[aw]end)N(a.cfgAuto,function()if c.autoload then
om(nil)a.cfgMsg.Text="it will not load a config on launch"else local fg=mX()local u8=false for G7,D8 in ipairs(oa())do if D8==fg then u8=true end end
local D9=u8 or fU(fg)if D9 and fg~=""then om(fg)bV()a.cfgMsg.Text=fg.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim u2()end)N(a.autoB,function()
local u9,u_=w3()a.autoMsg.Text=u9 and("installed. "..u_)or("failed: "..u_)a.autoMsg.TextColor3=u9 and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dK("you asked")end)
local a9=false N(a.minB,function()a9=not a9 a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not a9,not a9,not a9
if a9 then for G8,D_ in ipairs(a.tabKeys)do a[D_].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a0(uy)
end a.root.Size=UDim2 .new(0,Q.w,0,a9 and(Q.head+Q.status+12)or Q.h)a.minB.Text=a9 and"+"or"-"end)local function h_()
if not c.alive then return end c.alive,c.running=false,false pcall(j.restoreAll)pcall(ft)for G9,Ea in ipairs(ik)do pcall(function()Ea:Disconnect()end)end
if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end pcall(function()l4:Destroy()end)
pcall(function()uh:Destroy()end)if cB.SAB_KILL==h_ then cB.SAB_KILL=nil end end cB.SAB_KILL=h_ N(a.killB,h_)N(a.xB,h_)
tQ(a.title,a.root,function()bP(a.root)c.winPos=hw(a.root)or c.winPos end)local function va()local fh,cA=c.reason,c.level
if c.busy then fh,cA=c.busyText,"ok"elseif not c.running then local G_,vb,Eb=sV()if c.capHit then fh,cA=vb,"bad"else fh,cA="[stopped] "..vb,(Eb=="bad")and"bad"or"idle"end
c.reason,c.level=fh,cA end local dr=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dr then
a.lit.dot=dr a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dr,dr,dr,dr a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fh)if a.lit.bar~=cA then a.lit.bar=cA a.bar.BackgroundColor3=BY[cA]or l.dim end
if a9 then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bW=wD()if a.farm.Visible then local Ec,Ed=fq()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Ec.."/"..Ed)local vc=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(y()-c.lastCollect)))or nil
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
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cB.SAB={S=c,CFG=d,EV=V,U=a,sg=l4,CAT=ad,LEARN=aj,buildList=e_,
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
pcall(w9)end)task.spawn(function()while c.alive do local Ee,Ef=pcall(va)if not Ee then A("UI ERR "..tostring(Ef))end
task.wait((c.hidden or a9)and 1.5 or 0.4)end end)task.spawn(function()local Eg,Eh=pcall(xg)if not Eg then A("HOOK ERR "..tostring(Eh))end
end)task.spawn(function()pcall(v0)if e.loadSeq and not e.learned then local ia={}for vh=1,20 do if e.loadSeq[vh]then ia[#ia+1]=e.loadSeq[vh]end end
if#ia>0 then e.learned={seq=ia,mode=e.loadMode}A("remembered how to open crates directly")end end if iU()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local Ei,vi=pcall(AP)if Ei and vi and c.alive and not c.manualPad then c.manualPad=vi end end)task.spawn(function()
while c.alive do local m0,m1=pcall(q.buyTick)if not m0 then A("PET ERR "..tostring(m1))task.wait(5)end m0,m1=pcall(q.wishTick)
if not m0 then A("WISH ERR "..tostring(m1))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local ib,vj=0,y()
T(game:GetService("RunService").Heartbeat:Connect(function()ib=ib+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=y()while c.alive do task.wait(1)local vk=y()j.fps,ib,vj=ib/math.max(vk-vj,0.001),0,vk local Ej,Ek=pcall(j.tick)
if not Ej then A("PERF ERR "..tostring(Ek))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local El,Em=pcall(C.tick)if not El then A("FUSE ERR "..tostring(Em))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local En,Eo=pcall(z.tick)if not En then A("TEAM ERR "..tostring(Eo))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local ic=ah:WaitForChild("Remotes",30)local vl=ic and ic:WaitForChild("ClanEvent",30)
if vl and c.alive then T(vl.OnClientEvent:Connect(function(Ep,Eq)if Ep=="call"then pcall(E.onCall,Eq)end end))
end local vm=ic and ic:FindFirstChild("RollConfirmAsk")if vm and c.alive then T(vm.OnClientEvent:Connect(function(Er)F.asked=Er or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(j.calmScan)end end end)task.spawn(function()
local m2=ah:WaitForChild("Remotes",30)if not(m2 and c.alive)then return end local function ie(Es,Et)local m3=m2:FindFirstChild(Es)
if m3 and m3:IsA("RemoteEvent")then T(m3 .OnClientEvent:Connect(function(...)pcall(Et,...)end))end end ie("NewSquishyDiscovered",function(m4,vn)
if type(m4)~="string"then return end o.disc=o.disc or{}o.disc[W(m4)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(m4)),vn and(" ("..tostring(vn)..")")or""))
end)ie("IndexRefresh",o.loadDisc)ie("IndexRowComplete",function(Eu)A("INDEX: the whole "..tostring(Eu).." row is complete")end)
ie("AdminShow",o.admin)local vo=m2:FindFirstChild("AdminShowSync")if vo then local Ev,vp=pcall(function()return vo:InvokeServer()end)
if Ev and type(vp)=="table"then for Ha,Ew in pairs(vp)do pcall(O.add,Ew)end end end while c.alive do local Ex,Ey=pcall(o.tick)
if not Ex then o.msg="index error: "..tostring(Ey)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Ez,EA=pcall(F.tick)if not Ez then A("QUEST ERR "..tostring(EA))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(ft)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local EC=(type(newcclosure)=="function")and newcclosure or function(EB)return EB end local m5
local vq=(type(setnamecallmethod)=="function")and setnamecallmethod or nil m5=hookmetamethod(game,"__namecall",EC(function(vr,...)
local fi=getnamecallmethod()if c.alive and(fi=="InvokeServer"or fi=="FireServer")then local vs,vt=pcall(function()return vr.Name end)
if vs and vt=="CrateAction"and not e.replaying then pcall(e.saw,fi,...)elseif vs and vt=="AutoRollAction"and not D.replaying then pcall(D.saw,fi,...)end
if vq then vq(fi)end end return m5(vr,...)end))e.oldNC=m5 end)end if ii then T(J.Idled:Connect(function()pcall(function()ii:CaptureController()ii:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Hb=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and ao()and(c.plot or bv())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local ig=b2()
if ig and o.on()and not aK(ig.name)then ig=nil end if c.alive and d.AutoRoll and c.running and not D.isOn()and not ig and not ac()
and not e.waiting and not e.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Hc=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bv()if ao()and c.plot and o.any()then eN(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bv()c.lastCollect=y()while c.alive do if c.running then local ED,vu=pcall(BT)if not ED and vu~=ij then A("LOOP ERR "..tostring(vu))end
end task.wait(0.1)end end)ih("ready - the window is at the top left")end local EF,m6=xpcall(vy,function(EE)return tostring(EE).."\n"..debug.traceback()end)
if not EF then pcall(function()warn("SAB "..bX.." ERROR: "..tostring(m6))end)ih("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bX.." ERROR: "..tostring(m6))end)pcall(function()local vv=(type(getgenv)=="function"and getgenv())or _G
if type(vv.SAB_KILL)=="function"then vv.SAB_KILL()end for Hd,EG in ipairs({"SABFarmGui","SABToggle"})do local vw=J.PlayerGui:FindFirstChild(EG)
if vw then vw:Destroy()end end end)pcall(function()local fj=Instance.new("ScreenGui")fj.Name="SABError"fj.ResetOnSpawn=false
fj.DisplayOrder=1000 local a2=Instance.new("TextBox")a2 .Size=UDim2 .new(0,340,0,170)a2 .Position=UDim2 .new(0,10,0,50)
a2 .BackgroundColor3=Color3 .fromRGB(90,20,20)a2 .TextColor3=Color3 .new(1,1,1)a2 .TextSize=11 a2 .TextWrapped=true
a2 .ClearTextOnFocus=false a2 .TextXAlignment=Enum.TextXAlignment.Left a2 .TextYAlignment=Enum.TextYAlignment.Top
a2 .Text="SAB "..bX.." failed to start. Send this text:\n"..tostring(m6)a2 .Parent=fj fj.Parent=J:WaitForChild("PlayerGui")
end)end
