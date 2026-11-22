local bW="v27"local m3=game:GetService("Players")local H=m3 .LocalPlayer or m3 .PlayerAdded:Wait()local function ie(vt)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bW,Text=vt,Duration=6})
end)end ie("script started")local function vu()local ah=game:GetService("ReplicatedStorage")local as=game:GetService("Workspace")
local m4=game:GetService("UserInputService")local cz=(type(getgenv)=="function"and getgenv())or _G if type(cz.SAB_KILL)=="function"then pcall(cz.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local ig=(function()local vv,vw=pcall(function()return game:GetService("VirtualUser")end)return vv and vw or nil end)()
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
local q,z,j,C,E,J,F={},{},{},{},{},{},{}local o,O={},{}local ih={}local ii,fi,dp,dq={},{},{},{}local function Q(m5)ii[#ii+1]=m5 return m5 end
local function af(vx)task.wait(vx)if not c.alive then error(ih,0)end end local function A(fj)fj=os.date("%H:%M:%S").." "..tostring(fj)
table.insert(fi,1,fj)if#fi>6 then table.remove(fi)end c.logN=(c.logN or 0)+1 dp[#dp+1]=fj if#dp>80 then table.remove(dp,1)end
end local function fk(m6)if type(m6)~="string"then return""end return(m6:lower():gsub("[^%w]",""))end local function W(vy)
local m7=fk(vy)local ij=m7:gsub("butter$","")if ij==""then ij=m7 end return ij end local function aK(m8)if type(m8)~="string"then return false end
local ik=W(m8)if ik==""then return false end if o.want then return o.want(ik)end return d.Targets[ik]==true end
local function vz(dr)dr=dr:lower()return dr:find("squishy",1,true)~=nil or dr:match("butter$")~=nil or dr:match("butter[^%a]")~=nil
end local il={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aL(ds)if type(ds)~="number"then return"?"end
local fl=1 while math.abs(ds)>=1000 and fl<#il do ds=ds/1000 fl=fl+1 end local vA=string.format("%.2f",ds):gsub("%.?0+$","")
return vA..il[fl]end local function vB(m9)if type(m9)~="string"then return nil end local vC,dt=m9:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local im=tonumber(vC)if not im then return nil end if dt==""then return im end local vD={qd="qa",qn="qi"}dt=vD[dt:lower()]or dt
for vE,vF in ipairs(il)do if vF:lower()==dt:lower()then return im*1000^(vE-1)end end return nil end local function a8()
local m_=H:GetAttribute("BoardValueMoney")if type(m_)=="number"then return m_ end local na=H:FindFirstChild("leaderstats")
if na then for EG,vG in ipairs({"Cash","Money","Coins"})do local io=na:FindFirstChild(vG)if io and type(io.Value)=="number"then return io.Value end
end end end local function fm(vH)local ip=vH:GetFullName()if c.plot then local iq=c.plot:GetFullName()if ip:sub(1,#iq)==iq then return ip:sub(#iq+2)end
end return ip end local function ao()local fn=H.Character if fn and fn:FindFirstChild("HumanoidRootPart")then
local nb=fn:FindFirstChildOfClass("Humanoid")if nb and nb.Health>0 then return fn end end end local function bu()
local ir=as:FindFirstChild("Plots")if not ir then return nil end local function nc(vI)local nd=vI:FindFirstChild("Plate")
return nd~=nil and nd:FindFirstChild("EditStackAttachment",true)~=nil end local ne=H:GetAttribute("PlotNumber")
if ne~=nil then local is=ir:FindFirstChild(tostring(ne))if is and nc(is)then return is end end for EH,nf in ipairs(ir:GetChildren())do
if nc(nf)then return nf end end end local function du(ng)local bv=ng and ng.Parent for EI=1,6 do if not bv then return nil end
if bv:IsA("BasePart")then return bv end if bv:IsA("Model")then return bv.PrimaryPart or bv:FindFirstChildWhichIsA("BasePart",true)end
bv=bv.Parent end end local function nh(ni)local it=ni.Parent if it and it:IsA("Attachment")then return it.WorldPosition end
local nj=du(ni)return nj and nj.Position end local function nk()local cA=c.plot and c.plot:FindFirstChild("Plate")
if not cA then return nil end if cA:IsA("BasePart")then return cA.Position end if cA:IsA("Model")then return cA:GetPivot().Position end
local nl=cA:FindFirstChildWhichIsA("BasePart",true)return nl and nl.Position end local function nm()local iu={}
local nn=c.plot and c.plot:FindFirstChild("WaxStations")if nn then for EJ,vJ in ipairs(nn:GetChildren())do local no=vJ:FindFirstChild("SquishyPlaceHolder")
local iv=no and no:FindFirstChild("PlacePrompt")if iv and iv:IsA("ProximityPrompt")then iu[#iu+1]=iv end end end
return iu end local function fo()local np,iw=nm(),0 for EK,vK in ipairs(np)do if vK.Enabled then iw=iw+1 end end
local ix=#np local iy=H:GetAttribute("WaxStations")if type(iy)=="number"and iy>ix then ix=iy end return iw,ix
end local function vL()local nq=ao()local nr=nq and nq.HumanoidRootPart.Position local iz,ns for EL,iA in ipairs(nm())do
if iA.Enabled then local nt=nh(iA)local nu=(nt and nr)and(nt-nr).Magnitude or 1e9 if not iz or nu<ns then iz,ns=iA,nu end
end end return iz end local function nv()local fp=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fp then return nil end local nw=fp:FindFirstChild("BuyPromptAttachment")local fq=(nw and nw:FindFirstChild("BuyPrompt"))or fp:FindFirstChild("BuyPrompt",true)
if fq and fq:IsA("ProximityPrompt")and fq:IsDescendantOf(fp)then return fq end end local nx={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local vM={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iB="SAB_order.txt"local function fr()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for vN,vO in pairs(aj.price)do aB[#aB+1]="P|"..vN.."|"..string.format("%.0f",vO)end for vP,vQ in pairs(aj.order)do aB[#aB+1]="O|"..vP.."|"..table.concat(vQ,",")end
if e.learned and e.enc then aB[#aB+1]="M|mode|"..tostring(e.learned.mode or"")for vR,fs in ipairs(e.learned.seq)do
local ny={}for nz=1,fs.n do ny[nz]=e.enc(fs.args[nz])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(vR,fs.m,fs.n,table.concat(ny,";"))
end end local function iC(vS,vT,ft)local nA={}for nB=1,ft.n do nA[nB]=e.enc(ft.args[nB])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(vT,vS,ft.m,ft.n,table.concat(nA,";"))
end if e.enc then for vU,vV in ipairs(D.rec.rules)do iC("rules",vU,vV)end if D.rec.on then iC("on",0,D.rec.on)end
if D.rec.off then iC("off",0,D.rec.off)end end for EM,dv in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(dv.name,dv.title or"",dv.rar or"",dv.price and string.format("%.0f",dv.price)or"")
end if pcall(writefile,iB,table.concat(aB,"\n"))then aj.dirty=false end end local function vW()if type(isfile)~="function"or type(readfile)~="function"then return end
local vX,vY=pcall(isfile,iB)if not(vX and vY)then return end local vZ,nC=pcall(readfile,iB)if not(vZ and type(nC)=="string")then return end
for v0 in nC:gmatch("[^\n]+")do local cB,cC,a9=v0:match("^(%a)|([^|]+)|(.*)$")if cB=="P"then aj.price[cC]=tonumber(a9)
elseif cB=="M"then e.loadMode=(a9~=""and a9~="nil")and a9 or nil elseif cB=="A"and e.dec then local nD=tonumber(cC)
local nE,fu,v1=a9:match("^([^|]+)|(%d+)|(.*)$")if nD and nE then fu=tonumber(fu)local nF,fv={},0 for v2 in(v1 ..";"):gmatch("([^;]*);")do
fv=fv+1 if fv<=fu then nF[fv]=e.dec(v2)end end e.loadSeq=e.loadSeq or{}e.loadSeq[nD]={m=nE,n=fu,args=nF}end elseif cB=="R"and e.dec then
local nG=tonumber(cC)local fw,v3,fy,v4=a9:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if nG and fw then fy=tonumber(fy)
local nH,fz={},0 for v5 in(v4 ..";"):gmatch("([^;]*);")do fz=fz+1 if fz<=fy then nH[fz]=e.dec(v5)end end local iD={m=v3,n=fy,args=nH}
if fw=="rules"then D.rec.rules[nG]=iD elseif fw=="on"then D.rec.on=iD elseif fw=="off"then D.rec.off=iD end end
elseif cB=="K"then local nI,nJ,v6=a9:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cC)]={name=cC,title=nI~=""and nI or nil,
rar=nJ~=""and nJ or nil,price=tonumber(v6)}elseif cB=="O"and a9~=""then local fA={}for v7 in a9:gmatch("[^,]+")do fA[#fA+1]=v7 end
if#fA>0 then aj.order[cC]=fA end end end end local function v8(fB)if type(fB)~="table"then return end local bX,nK=fB.rarity,fB.contents
if type(bX)~="string"or bX==""or type(nK)~="table"then return end local dw={}for EN,fC in ipairs(nK)do if type(fC)=="table"and type(fC.butter)=="string"then
dw[#dw+1]={n=fC.butter,ch=tonumber(fC.chance)or 0}end end if#dw==0 then return end table.sort(dw,function(v9,v_)return v9 .ch>v_.ch end)
local dx,dy={},false for wa,wb in ipairs(dw)do dx[wa]=wb.n end local iE=aj.order[bX]if not iE or#iE~=#dx then dy=true end
if not dy then for nL=1,#dx do if iE[nL]~=dx[nL]then dy=true break end end end aj.order[bX]=dx local iF=tonumber(fB.price)
if iF and aj.price[bX]~=iF then aj.price[bX]=iF dy=true end if dy then aj.dirty=true ad.at=0 A("learned the "..bX.." order from its crate")
end end local function cD(wc,wd)local we=wc:FindFirstChild(wd,true)local wf,iG=pcall(function()return we.Text end)
return(wf and type(iG)=="string"and iG~="")and iG or nil end local function ak(nM)return ad.pretty[nM]or nM end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(wg)return fk(wg or"")end
function L.learn(a_)if type(a_)~="table"or type(a_.name)~="string"then return end local iH=L.key(a_.name)local ba=L.seen[iH]or{}
local wh=(L.seen[iH]==nil)or(tonumber(a_.price)and ba.price~=tonumber(a_.price))ba.name,ba.title=a_.name,a_.title or ba.title
ba.rar,ba.price=a_.rarity or ba.rar,tonumber(a_.price)or ba.price L.seen[iH]=ba if wh then L.at,aj.dirty=y(),true end
end function L.wanted(nN)if nN==nil then return false end local iI=L.key(nN)return d.CrateTicks[iI]==true or(d.BestCrate and o.bestCrate~=nil and(iI==o.bestCrate or iI==o.bestCrateTitle))
end function L.list()local cE={}for wi,fD in ipairs(L.base)do cE[L.key(fD[1])]={name=fD[1],title=fD[2],rar=fD[3],i=wi}end
for EO,dz in ipairs(ad.rarOrder)do local nO=false for EP,wj in pairs(cE)do if wj.rar==dz then nO=true break end end
if not nO and dz~="?"then local nP=dz:gsub("[^%w]","").."Crate"cE[L.key(nP)]={name=nP,title=dz.." Crate",rar=dz,i=50,guess=true}
end end for nQ,fE in pairs(L.seen)do local a2=cE[nQ]or{i=100}a2 .name,a2 .title,a2 .rar=fE.name or a2 .name,fE.title or a2 .title,fE.rar or a2 .rar
a2 .price,a2 .guess=fE.price or a2 .price,nil cE[nQ]=a2 end local dA,fF={},{}for wk,wl in ipairs(nx)do dA[wl]=wk end
for wm,nR in ipairs(ad.rarOrder)do dA[nR]=dA[nR]or(20+wm)end for wn,dB in pairs(cE)do dB.k=wn dB.price=dB.price or aj.price[dB.rar or""]
fF[#fF+1]=dB end table.sort(fF,function(bY,bZ)if bY.price and bZ.price and bY.price~=bZ.price then return bY.price<bZ.price end
local nS,nT=dA[bY.rar or""]or 99,dA[bZ.rar or""]or 99 if nS~=nT then return nS<nT end if(bY.i or 100)~=(bZ.i or 100)then return(bY.i or 100)<(bZ.i or 100)end
return bY.k<bZ.k end)return fF end local function wo()local nU=ah:FindFirstChild("Assets")local nV=nU and nU:FindFirstChild("Squishies")
if not nV then return false end local iJ,nW,cF={},{},{}local fG=0 for EQ,fH in ipairs(nV:GetChildren())do local dC=W(fH.Name)
if dC~=""and not iJ[dC]then local fI=cD(fH,"RarityText")or"?"iJ[dC]=fI nW[dC]=cD(fH,"NameText")or fH.Name cF[fI]=cF[fI]or{}
table.insert(cF[fI],dC)fG=fG+1 end end if fG==0 then return false end for nX,wp in pairs(cF)do local nY=aj.order[nX]or vM[nX]
local iK={}if nY then for wq,wr in ipairs(nY)do iK[W(wr)]=wq end end table.sort(wp,function(nZ,n0)local iL,iM=iK[nZ],iK[n0]
if iL and iM then return iL<iM end if iL then return true end if iM then return false end return ak(nZ)<ak(n0)
end)end local iN={}for ws,wt in ipairs(nx)do iN[wt]=ws end local fJ,b0={},{}for wu in pairs(cF)do fJ[#fJ+1]=wu end
pcall(function()for wv,ww in ipairs(require(ah.Modules.SquishyRNG).Keys)do b0[ww]=wv end end)table.sort(fJ,function(cG,cH)
if b0[cG]and b0[cH]and b0[cG]~=b0[cH]then return b0[cG]<b0[cH]end local iO,iP=aj.price[cG],aj.price[cH]if iO and iP and iO~=iP then return iO<iP end
local iQ,iR=iN[cG],iN[cH]if iQ and iR then return iQ<iR end if iQ then return true end if iR then return false end
return cG<cH end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=iJ,nW,cF,fJ,fG,y()return true end local function iS()
if ad.at==0 or(y()-ad.at)>120 then pcall(wo)end return ad.n>0 end local function wx(wy)local n1=W(wy)return ad.rar[n1]or(V.name and W(V.name)==n1 and V.rar)or"?"
end local function wz()local fK={}local wA=((d.Best or 0)>0 and next(o.best or{}))and o.best or d.Targets for wB,wC in pairs(wA)do if wC then fK[#fK+1]=ak(wB)end end
table.sort(fK)return fK end local am={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function n2()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fL(n3)if type(makefolder)~="function"then return end local wD,wE=pcall(isfolder,n3)if not(wD and wE)then pcall(makefolder,n3)end
end local function fM(n4)if type(isfile)~="function"or type(readfile)~="function"then return nil end local wF,wG=pcall(isfile,n4)
if not(wF and wG)then return nil end local wH,wI=pcall(readfile,n4)return wH and wI or nil end local function dD(wJ,wK)
if type(writefile)~="function"then return false end return(pcall(writefile,wJ,wK))end local function n5(wL)local dE={}
if type(listfiles)~="function"then return dE end local wM,n6=pcall(listfiles,wL)if not wM or type(n6)~="table"then return dE end
for ER,wN in ipairs(n6)do dE[#dE+1]=tostring(wN)end return dE end local function n7()local fN={}for ES,wO in ipairs(n5(am.cfg))do
local n8=wO:match("([^/\\]+)%.txt$")if n8 then fN[#fN+1]=n8 end end table.sort(fN)return fN end local function wP()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(d.Every)aa[#aa+1]="N|GlazeLead|"..tostring(d.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(d.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(d.MemLimit)aa[#aa+1]="N|Best|"..tostring(d.Best or 0)for ET,n9 in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..n9 .."|"..d[n9]end
do local fO={}for wQ,dF in pairs(d.Pets)do local n_=(dF.b and"b"or"")..(dF.g and"g"or"")..(dF.w and"w"or"")..((tonumber(dF.f)or 0)>0 and tostring(dF.f)or"")
if n_~=""then fO[#fO+1]=wQ.."|"..n_ end end table.sort(fO)aa[#aa+1]="P|-"for EU,wR in ipairs(fO)do aa[#aa+1]="P|"..wR end
end for EW,oa in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..oa.."|"..(d[oa]and"1"or"0")end local iT=H:GetAttribute("AutoRollRules")if type(iT)=="string"and iT~=""then d.ARrules,d.ARstop=iT,tostring(H:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then aa[#aa+1]="S|rules|"..d.ARrules aa[#aa+1]="S|stop|"..d.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for EX,iU in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fP={}for wS,wT in pairs(iU[2])do if wT then fP[#fP+1]=wS end end table.sort(fP)aa[#aa+1]=iU[1].."|-"for EY,wU in ipairs(fP)do aa[#aa+1]=iU[1].."|"..wU end
end return table.concat(aa,"\n")end local function wV(iV)if type(iV)~="string"or iV==""then return false end local ob,oc,od,oe,dG={},false,{},false,nil
for wW in iV:gmatch("[^\n]+")do local aC,ag,aw=wW:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and ag=="Every"then local iW=tonumber(aw)
if iW and iW>=1 then d.Every=math.floor(iW)end elseif aC=="N"and(ag=="FpsCap"or ag=="MemLimit")then local iX=tonumber(aw)
if iX and iX>=0 then d[ag]=math.floor(iX)end elseif aC=="N"and ag=="Best"then local fQ=tonumber(aw)if fQ and fQ>=0 and fQ<=4 then d.Best=math.floor(fQ)end
elseif aC=="N"and ag=="GlazeLead"then local fR=tonumber(aw)if fR and fR>=5 and fR<=600 then d.GlazeLead=math.floor(fR)end
elseif aC=="S"and(ag=="TeamNormal"or ag=="TeamFull"or ag=="TeamGlaze"or ag=="TeamWax")then d[ag]=aw elseif aC=="P"and ag~=""then
if not dG then dG={}end if ag~="-"and aw~=""then dG[ag]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aC=="B"then if d[ag]~=nil then d[ag]=(aw=="1")end
elseif aC=="S"and ag=="rules"then d.ARrules=aw elseif aC=="S"and ag=="stop"then d.ARstop=aw elseif aC=="W"then
c.winPos={tonumber(ag)or 10,tonumber(aw)or 44}elseif aC=="G"then c.togPos={tonumber(ag)or 10,tonumber(aw)or 300}
elseif aC=="T"and ag~=""then if ag~="-"then ob[ag]=true end oc=true elseif aC=="K"and ag~=""then if ag~="-"then od[ag]=true end
oe=true end end if oc then d.Targets=ob end if oe then d.CrateTicks=od end if dG then d.Pets=dG end return true
end local function fS(cI)if not n2()then return false,"this executor cannot write files"end cI=(cI or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cI==""then return false,"give the config a name"end fL(am.dir)fL(am.cfg)if not dD(am.cfg.."/"..cI..".txt",wP())then return false,"could not write the file"end
c.config=cI return true,cI end local function of(fT)local og=fM(am.cfg.."/"..fT..".txt")if not og then return false,"no config called "..tostring(fT)end
if not wV(og)then return false,"that config looks empty"end c.config=fT return true,fT end local function oh(iY)
if iY then fL(am.dir)dD(am.auto,iY)elseif type(delfile)=="function"then pcall(delfile,am.auto)else dD(am.auto,"")
end c.autoload=iY end local function wX()if c.selfPath then return c.selfPath end local fU for EZ,wY in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",am.dir})do
for E0,oi in ipairs(n5(wY))do local iZ=oi:lower()if iZ:sub(-4)==".lua"and(iZ:find("sab_farm",1,true)or iZ:find("sab farm",1,true))then
fU=fU or oi end end end c.selfPath=fU return fU end am.stub=[[
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
local function wZ()if not n2()then return false,"this executor cannot write files"end fL("autoexec")if not dD(am.exec,am.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fV=(function()local w0,w1=pcall(function()return game:GetService("TeleportService")end)return w0 and w1 or nil end)()
local function oj()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local w2=queueonteleport or queue_on_teleport return(pcall(w2,am.stub))end local function dH(w3)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..w3 ..")")pcall(fr)if c.autoload then pcall(fS,c.autoload)end local w4=oj()A(w4 and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for E1=1,30 do if not fV then break end pcall(function()fV:Teleport(game.PlaceId,H)end)task.wait(10)
end end)end local function w5()local w6,ol=pcall(function()return game:GetService("GuiService")end)if w6 and ol then
pcall(function()Q(ol.ErrorMessageChanged:Connect(function()if d.Rejoin then dH("roblox error message")end end))
end)end pcall(function()local om=game:GetService("CoreGui")local oo=om and om:WaitForChild("RobloxPromptGui",15)
local op=oo and oo:WaitForChild("promptOverlay",15)if op then Q(op.ChildAdded:Connect(function(w7)if d.Rejoin and tostring(w7 .Name):lower():find("errorprompt",1,true)then dH("disconnect prompt")end
end))end end)if fV then pcall(function()Q(fV.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dH("teleport retry")end)end
end))end)end end local function oq(w8)local ot=c.plot and c.plot:FindFirstChild(w8)if not ot then return nil,false end
for E2,i0 in ipairs(ot:GetChildren())do if i0:IsA("Model")or i0:IsA("BasePart")then return i0,true end end return nil,true
end local function b1()local bw=oq("RolledSquishy")if not bw then return nil end return{model=bw,name=bw.Name,pretty=cD(bw,"NameText")or ak(W(bw.Name)),
rar=cD(bw,"RarityText")or wx(bw.Name),price=cD(bw,"PriceText")}end local function ou(i1)return type(i1)=="string"and(ad.rar[W(i1)]~=nil or vz(i1))
end local function ab()local i2=oq("SquishyEquipped")if i2 then c.carrySrc,e.heldAt="model",y()return i2 .Name,i2 end
local ov=H.Character if ov then for E3,dI in ipairs(ov:GetDescendants())do if(dI:IsA("Model")or dI:IsA("Tool"))and ou(dI.Name)then
c.carrySrc,e.heldAt="character",y()return dI.Name,dI end end end local fW=H:GetAttribute("SquishyEquipped")if type(fW)=="string"and fW~=""and ou(fW)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fW,nil end c.carrySrc=nil end local function E4()local E5,w9=ab()return w9 end local function dJ()
local ow=b1()local i3=ow and vB(ow.price)local i4=a8()if i3 and i4 and i4<i3*0.5 then return i4,i3 end end local function b2(w_)
dq[#dq+1]=os.date("%H:%M:%S").." "..w_ if#dq>40 then table.remove(dq,1)end end local function xa(b3,fX)if type(b3)~="string"then return end
b2(("Roll(%s,%s)"):format(b3,tostring(fX)))if b3:lower():find("crate",1,true)then e.rolled,e.rolledAt=b3,y()return
end V.seq=V.seq+1 V.name,V.at=b3,y()V.rar=type(fX)=="string"and fX or nil c.rolls=c.rolls+1 if aK(b3)then A(("ROLL %s [%s] = TARGET"):format(b3,tostring(fX)))end
end local function xb(b4)if type(b4)~="table"then return end local fY=b4 .butter or b4 .itemName if type(fY)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=fY,y()if type(b4 .giftId)=="string"then local ox=ah:FindFirstChild("Remotes")
local oy=ox and ox:FindFirstChild("GiftThanks")if oy then pcall(function()oy:FireServer(b4 .giftId)end)end end
b2("Gift("..fY.." from "..tostring(b4 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b4 .fromName),fY))
end local function xc()local oz=ah:WaitForChild("Remotes",30)if not c.alive then return end if not oz then A("Remotes folder missing - no roll events")return end
Q(H:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local oA=H:GetAttribute("SquishyEquipped")
if type(oA)=="string"and oA~=""then e.heldAt=y()end end))local xi={SquishyRollAnimation=xa,InitSquishy=function(oB)V.init,V.initAt=tostring(oB),y()b2("Init("..tostring(oB)..")")end,
CrateUpdate=function(cJ,oC)pcall(v8,cJ)pcall(L.learn,cJ)if type(cJ)=="table"then local xd=oC==true or(e.rolled~=nil and y()-e.rolledAt<15)or e.waiting
if not xd then return end local xe=not e.waiting local xf=e.on e.waiting,e.data,e.at=true,cJ,y()e.on=(oC==true)
e.title=tostring(cJ.title or cJ.name or"crate")if e.on and not xf then e.openedAt,e.byYou=y(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then b2("CrateWindow open("..e.title..")")elseif xe then b2("Crate waiting("..e.title..")")A(e.title.." is waiting on your stand")
end else if e.waiting then b2("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local xg=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,xg)end if e.classify then local xh=y()
task.spawn(function()pcall(e.classify,xh)end)end end end,GiftReceived=xb,}for fZ,xj in pairs(xi)do local i5=oz:FindFirstChild(fZ)
if i5 and i5:IsA("RemoteEvent")then Q(i5 .OnClientEvent:Connect(xj))elseif fZ~="CrateUpdate"and fZ~="GiftReceived"then A("remote "..fZ.." missing")end
end end local function i6()local b5=b1()if b5 then if aK(b5 .name)then return{state="match",shown=b5 .pretty,src="pad",info=b5}
end return{state="skip",info=b5,level="idle",text=("on pad: %s [%s] - not ticked"):format(b5 .pretty,tostring(b5 .rar))}
end if V.name and(y()-V.at)<4 then if aK(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f0(xk,xl,xm,xn)
local f1=RaycastParams.new()f1 .FilterType=Enum.RaycastFilterType.Exclude local i7={H.Character}for E6,xo in ipairs(xn or{})do i7[#i7+1]=xo end
f1 .FilterDescendantsInstances=i7 pcall(function()f1 .RespectCanCollide=true end)local oD=as:Raycast(Vector3 .new(xk,xl+4,xm),Vector3 .new(0,-30,0),f1)
return oD and oD.Position or nil end local function cK(oE)local oF=oE:FindFirstChildOfClass("Humanoid")return((oF and oF.HipHeight)or 2)+oE.HumanoidRootPart.Size.Y/2+0.2
end local function i8(xp,xq)local i9=xp:FindFirstChildOfClass("Humanoid")local xr=y()while y()-xr<xq do if i9 and(i9 .FloorMaterial~=Enum.Material.Air or i9 .SeatPart)then return true end
af(0.05)end return false end local function aD(xs,i_,ja)local oG=xs.HumanoidRootPart oG.AssemblyLinearVelocity=Vector3 .new(0,0,0)
oG.CFrame=ja and CFrame.new(i_,Vector3 .new(ja.X,i_.Y,ja.Z))or CFrame.new(i_)end local function b6(bc,oH)local b7=ao()
if not b7 or not bc then return false end local bx=bc.Position local f2=math.clamp(math.max(bc.Size.X,bc.Size.Z)/2+2.2,3,7)
local oI=(oH and oH.MaxActivationDistance)or 10 if f2>oI-2 then f2=math.max(2.5,oI-2)end local dK={}local function b8(dL)
dL=Vector3 .new(dL.X,0,dL.Z)if dL.Magnitude>0.05 then dK[#dK+1]=dL.Unit end end local oJ=nk()if oJ then b8(oJ-bx)end
b8(bc.CFrame.LookVector)b8(-bc.CFrame.LookVector)b8(bc.CFrame.RightVector)b8(-bc.CFrame.RightVector)b8(b7 .HumanoidRootPart.Position-bx)
if#dK==0 then b8(Vector3 .new(0,0,1))end local xt,f3=cK(b7),false for E7,xu in ipairs(dK)do local f4=bx+xu*f2
local jb=f0(f4 .X,bx.Y,f4 .Z,{bc})if jb and math.abs(jb.Y-bx.Y)<14 then aD(b7,Vector3 .new(f4 .X,jb.Y+xt,f4 .Z),bx)
if i8(b7,0.7)then f3=true break end end end if not f3 then aD(b7,bx+dK[1]*f2+Vector3 .new(0,3,0),bx)f3=i8(b7,1)
end af(0.12)return f3 end local function oK(dM)if not dM.Parent or not dM.Enabled then return false end pcall(function()dM:InputHoldBegin()end)
af(math.max(dM.HoldDuration,0)+0.08)pcall(function()dM:InputHoldEnd()end)return true end local function ap(oL,xv)
local xw=y()while y()-xw<xv do if oL()then return true end af(0.05)end return oL()end local function dN(cL,xx,oM,xy)
local xz=c.zapFirst and{"zap","hold"}or{"hold","zap"}for xA,jc in ipairs(xz)do if xA==2 and(xy or not(cL.Parent and cL.Enabled and(not oM or oM())))then break end
local jd if jc=="hold"then jd=oK(cL)else jd=type(fireproximityprompt)=="function"and cL.Parent~=nil and cL.Enabled and pcall(fireproximityprompt,cL)end
if jd and ap(xx,1.2)then c.zapFirst=(jc=="zap")return true,jc end end return false end local function oN(je)local by=nv()
if not by or not by.Enabled then A("buy: nothing on the pad")return false end local jf=du(by)if not jf then A("buy: pad part missing")return false end
c.lastBuyAt=y()local xC,oO=V.seq,a8()local oP=ao()local xD=oP and(oP.HumanoidRootPart.Position-jf.Position).Magnitude>12
b6(jf,by)if xD then af(0.4)end if not by.Enabled then A("buy aborted: pad emptied")return false end local cM=i6()
if not je and cM.state~="match"then A("buy aborted: "..(cM.text or"pad changed"))c.matchSince=nil return false
end local jg=cM.info and cM.info.name or(cM.state=="match"and V.name)or nil local function xE()return by.Enabled and ab()==nil and(je or i6().state=="match")
end local xF,xG=dN(by,function()return ab()~=nil or((not by.Enabled)and(je or V.seq==xC))end,xE,dJ()~=nil)if xF then
ap(function()return ab()~=nil end,0.8)local dO=ab()local oQ=a8()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dO and ak(W(dO))or(cM.shown or"?"),(oO and oQ)and(" for $"..aL(oO-oQ))or"",xG))
if dO and jg and W(dO)~=W(jg)then A(("note: picked up %s, not %s"):format(dO,jg))end return true end local f5=b1()
if dJ()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aL(a8()),(f5 and f5 .price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(f5 and f5 .price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function oR()local dP=ab()if not dP then c.holding=false A("place: hands are empty")
return false end if not aK(dP)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(dP))))return false end
for E8=1,d.PlaceTries do local bz=vL()if not bz then A("place: no free station")break end local oS=du(bz)if oS then
b6(oS,bz)local oT=ab()if not oT then c.holding=false A("place: hands emptied on the way")return false end if not aK(oT)then A("place: what I carry changed, not waxing it")return false end
if bz.Enabled then local xH,xI=dN(bz,function()return not bz.Enabled end,function()return bz.Enabled end)if xH then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 V.name,V.rar,V.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(W(dP)),c.placed,bz.Parent.Parent.Name,xI))if o.placed then pcall(o.placed,dP)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ab()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ab()))A(c.capMsg)end return false end function z.place()local xJ=y()while c.alive and z.editing and y()-xJ<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then z.placing=true local xK=y()while c.alive and z.current()~=d.TeamWax and y()-xK<5 do af(0.1)end
if z.current()==d.TeamWax then af(0.3)else A("wax team did not come on in time - placing anyway")end end local xL,oU=pcall(oR)
z.placing=false if not xL then error(oU,0)end return oU end local function oV(oW)return type(oW)=="string"and oW:lower():find("crate",1,true)~=nil
end local xM={SABFarmGui=1,SABToggle=1,SABError=1}local function jh(xN)local bA=xN while bA do if xM[bA.Name]then return false end
if bA:IsA("ScreenGui")then local xO,xP=pcall(function()return bA.Enabled end)return(not xO)or xP~=false end if bA:IsA("GuiObject")and not bA.Visible then return false end
bA=bA.Parent end return false end local function f6(f7)local cN=""pcall(function()if f7:IsA("TextButton")then cN=f7 .Text end end)
if not cN:find("%a")then for E9,f8 in ipairs(f7:GetDescendants())do if(f8:IsA("TextLabel")or f8:IsA("TextButton"))and f8 .Text:find("%a")then cN=f8 .Text break end
end end if not cN:find("%a")then cN=f7 .Name end return(cN:lower():gsub("[^%a]",""))end local function xQ()local dQ,dR
local oX=H:FindFirstChildOfClass("PlayerGui")if not oX then return nil,nil end for E_,dS in ipairs(oX:GetDescendants())do
if dS:IsA("GuiButton")and jh(dS)then local ji=f6(dS)if ji:sub(1,4)=="open"and not ji:find("shop",1,true)then dQ=dQ or dS end
if ji:sub(1,7)=="discard"then dR=dR or dS end end end if dQ and dR then return dQ,dR end if e.on then return dQ,dR end
return nil,nil end local jj=(function()local xR,xS=pcall(function()return game:GetService("VirtualInputManager")end)return xR and xS or nil end)()
local function oY(bd,jk)local jl={}local function oZ(xT)jl[#jl+1]=xT end if c.tapWay then oZ(c.tapWay)end for Fa,o0 in ipairs({"touch","conn","signal"})do
if o0~=c.tapWay then oZ(o0)end end local function o1(xU,...)local xV,jm=pcall(getconnections,xU)if not(xV and type(jm)=="table"and#jm>0)then return false end
local o2,xW,xX=false,{...},select("#",...)for Fb,xY in ipairs(jm)do if pcall(function()xY:Fire(table.unpack(xW,1,xX))end)then o2=true end
end return o2 end local function o3()local o4=Vector3 .new(0,0,0)pcall(function()local o5,o6=bd.AbsolutePosition,bd.AbsoluteSize
o4=Vector3 .new(o5 .X+o6 .X/2,o5 .Y+o6 .Y/2,0)end)local jn={Position=o4,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jn.UserInputType=Enum.UserInputType.Touch end)pcall(function()jn.UserInputState=Enum.UserInputState.End end)
return jn end for Fc,be in ipairs(jl)do local dT=false if be=="conn"and type(getconnections)=="function"then if o1(bd.MouseButton1Click)then
dT=true if ap(jk,1.5)then c.tapWay=be return true,be end end dT=o1(bd.Activated,o3(),1)elseif be=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bd.MouseButton1Click)then if ap(jk,1.5)then c.tapWay=be return true,be end end dT=pcall(firesignal,bd.Activated,o3(),1)
elseif be=="touch"and jj then dT=pcall(function()local o7,o8=bd.AbsolutePosition,bd.AbsoluteSize local o9=0 local o_=bd:FindFirstAncestorWhichIsA("ScreenGui")
local xZ,x0=pcall(function()return o_ and o_.IgnoreGuiInset end)if not(xZ and x0)then pcall(function()o9=game:GetService("GuiService"):GetGuiInset().Y end)
end local pa,pb=o7 .X+o8 .X/2,o7 .Y+o8 .Y/2+o9 jj:SendMouseButtonEvent(pa,pb,0,true,game,1)task.wait(0.06)jj:SendMouseButtonEvent(pa,pb,0,false,game,1)
end)end if dT and ap(jk,1.5)then c.tapWay=be return true,be end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jo(pc)local dU=pc.Parent while dU and dU~=c.plot do if e.NOT[dU.Name]then return false end dU=dU.Parent
end local jp=(pc.ActionText or""):lower()if jp:find("roll",1,true)or jp:find("place",1,true)or jp:find("sell",1,true)then return false end
return true end local function pd()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local pe=c.plot:FindFirstChild("CrateStand")local dV if pe then for Fd,f9 in ipairs(pe:GetDescendants())do
if f9:IsA("ProximityPrompt")and f9 .Enabled and jo(f9)then dV=f9 break end end end if not dV then for Fe,bB in ipairs(c.plot:GetDescendants())do
if bB:IsA("ProximityPrompt")and bB.Enabled and jo(bB)then local pf=bB:FindFirstAncestorWhichIsA("Model")local x1=((bB.ActionText or"").." "..(bB.ObjectText or"").." "..bB.Name.." "..(pf and pf.Name or"")):lower()
if x1:find("crate",1,true)then dV=bB break end end end end e.prompt=dV return dV end local function jq()if e.on then return true end
local dW=pd()if not dW then e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local pg=du(dW)if pg then b6(pg,dW)end e.ours=true dN(dW,function()return e.on end)if ap(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: pressed "..fm(dW).." but no window came up")
return false end do local function x2(ph)local cO=ph.Parent while cO and cO:IsA("GuiObject")do local pj,pk=false,false
for Ff,dX in ipairs(cO:GetDescendants())do if dX~=ph and dX:IsA("GuiButton")and f6(dX):sub(1,7)=="discard"then pj=true end
if dX:IsA("TextLabel")then local jr=dX.Text:lower()if jr:find("crate",1,true)or jr:find("can contain",1,true)or jr:find("cost",1,true)then pk=true end
end if pj and pk then return cO end end cO=cO.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local pl=H:FindFirstChildOfClass("PlayerGui")if not pl then return nil end for Fg,f_ in ipairs(pl:GetDescendants())do
if f_:IsA("GuiButton")and not f_:FindFirstAncestor("SABFarmGui")and f6(f_):sub(1,4)=="open"then local js=x2(f_)
if js then e.win=js return js end end end end local function x3(x4)for Fh,ga in ipairs(x4:GetDescendants())do
if ga:IsA("GuiButton")then local pm,jt=f6(ga),ga.Name:lower()if pm=="x"or pm=="close"or jt=="x"or jt:find("close",1,true)or jt:find("exit",1,true)then return ga end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(x5)task.wait(x5 and 4 or 1.2)if e.on or e.waiting then return end
local gb=e.findWin()if not gb or not jh(gb)then return end local pn=x3(gb)if pn and oY(pn,function()return not jh(gb)end)then return end
A("the crate window is still open - tap its X")end end local function dY(gc)if not jq()then return false end local po=y()-(e.openedAt or 0)
if po<0.6 then af(0.6-po)end local ju=e.title local x6,x7=xQ()local pp=gc and x6 or x7 if not pp then e.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(gc and"Open"or"Discard",ju))return false
end local x8=ab()local x9,Fi=oY(pp,function()return(not e.on)or(ab()~=nil and ab()~=x8)end)if not x9 then e.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(gc and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gc then c.crates=c.crates+1 ap(function()return ab()~=nil end,1.5)local pq=ab()
A(("OPENED %s -> %s"):format(ju,pq and ak(W(pq))or"?"))else A("discarded "..ju.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(x_,...)local ya=select("#",...)e.calls[#e.calls+1]={t=y(),m=x_,n=ya,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aE,bf)local bC=type(aE)if(bC=="string"or bC=="number")and type(bf.data)=="table"then for ps,jv in pairs(bf.data)do
if jv==aE and type(ps)=="string"and(type(jv)=="string"or type(jv)=="number")then return{__slot="f:"..ps}end end
end if bC=="string"then if bf.crate and aE==bf.crate then return{__slot="crate"}end if bf.title and aE==bf.title then return{__slot="title"}end
if bf.rar and aE==bf.rar then return{__slot="rarity"}end return aE end if bC=="number"or bC=="boolean"or bC=="nil"then return aE end
if bC=="table"then local pt={}for yb,pu in pairs(aE)do if type(pu)=="table"then return nil,"nested table"end local yc,pv=e.slot(pu,bf)
if pv then return nil,pv end pt[yb]=yc end return pt end local yd,ye=pcall(function()return aE:IsA("Instance")end)
if yd and ye then if aE==H then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gd=c.plot and c.plot:FindFirstChild("CrateStand")if gd and aE==gd then return{__slot="stand"}end if gd and aE.Parent==gd then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bC..")"end function e.resolve(ge)if type(ge)~="table"then return ge end
local aR=ge.__slot if aR and aR:sub(1,2)=="f:"then return e.data and e.data[aR:sub(3)]end if aR=="crate"then return e.data and e.data.name end
if aR=="title"then return(e.data and e.data.title)or e.title end if aR=="rarity"then return e.data and e.data.rarity end
if aR=="player"then return H end if aR=="plot"then return c.plot end if aR=="stand"or aR=="model"then local jw=c.plot and c.plot:FindFirstChild("CrateStand")
if aR=="stand"or not jw then return jw end for Fj,pw in ipairs(jw:GetChildren())do if oV(pw.Name)then return pw end end
return nil end local px={}for yf,yg in pairs(ge)do px[yf]=e.resolve(yg)end return px end function e.classify(jx)
if e.directOff then return end local gf={}for Fk,jy in ipairs(e.calls)do if jy.t<=jx+0.05 and jx-jy.t<=6 then gf[#gf+1]=jy end
end if#gf==0 then return end if not ap(function()return(e.heldAt or 0)>=jx-1 end,2.5)then return end local dZ={}
for Fl,d0 in ipairs(gf)do local py={}for pz=1,d0 .n do local yh,pA=e.slot(d0 .args[pz],d0)if pA then A("crate call has "..pA.." - keeping the button method")
return end py[pz]=yh end dZ[#dZ+1]={m=d0 .m,n=d0 .n,args=py}end local jz=e.learned e.learned={seq=dZ,mode=jz and jz.mode or nil}
aj.dirty=true if not jz then A(("learned how to open crates directly (%d call%s)"):format(#dZ,#dZ==1 and""or"s"))end
end function e.replay()local pB=e.learned local pC=ah:FindFirstChild("Remotes")local jA=pC and pC:FindFirstChild("CrateAction")
if not(pB and jA)then return false end local pD=table.unpack or unpack e.replaying=true for Fm,d1 in ipairs(pB.seq)do
local jB={}for pE=1,d1 .n do jB[pE]=e.resolve(d1 .args[pE])end task.spawn(function()pcall(function()if d1 .m=="InvokeServer"then jA:InvokeServer(pD(jB,1,d1 .n))
else jA:FireServer(pD(jB,1,d1 .n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(yi)return(yi:gsub("[%%|;=,\n]",function(yj)return("%%%02X"):format(yj:byte())end))end
function e.enc(b9)local gg=type(b9)if gg=="string"then return"s"..e.esc(b9)end if gg=="number"then return"n"..tostring(b9)end
if gg=="boolean"then return b9 and"b1"or"b0"end if gg=="nil"then return"z"end if b9 .__slot then return"k"..b9 .__slot end
local jC={}for yk,yl in pairs(b9)do jC[#jC+1]=e.enc(yk).."="..e.enc(yl)end return"t"..table.concat(jC,",")end
function e.dec(pF)local d2,d3=pF:sub(1,1),pF:sub(2)local function ym(yn)return(yn:gsub("%%(%x%x)",function(yo)return string.char(tonumber(yo,16))end))end
if d2=="s"then return ym(d3)end if d2=="n"then return tonumber(d3)end if d2=="b"then return d3=="1"end if d2=="k"then return{__slot=d3}end
if d2=="t"then local pG={}for yp in d3:gmatch("[^,]+")do local pH,yq=yp:match("^(.-)=(.*)$")if pH then local pI=e.dec(pH)
if pI~=nil then pG[pI]=e.dec(yq)end end end return pG end return nil end function e.goneOrNew(yr)return function()
if not e.waiting then return true end local pJ=ab()return pJ~=nil and pJ~=yr end end function e.near()local pK=ah:FindFirstChild("Remotes")
local jD=pK and pK:FindFirstChild("CrateAction")local gh=ao()local jE=c.plot and c.plot:FindFirstChild("CrateStand")
local jF=jE and jE:FindFirstChild("Spot")if not(jD and gh and jF)then A(("crate: cannot open %s right now (%s)"):format(tostring(e.title),
not jD and"no CrateAction remote"or not gh and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jG=gh.HumanoidRootPart local gi=jG.CFrame local pL,jH=e.title,"no answer"local ys=ab()local pM=jE:FindFirstChild("Holder")
local function pN()if not pM then return e.waiting or e.on end for Fn,yt in ipairs(pM:GetChildren())do if yt:IsA("Model")then return true end end
return false end for yu=1,3 do if not(e.waiting or e.on)or not pN()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end if(jG.Position-jF.Position).Magnitude>8 then b6(jF,e.prompt)end af(0.12+0.15*yu)
local a3={}e.replaying=true task.spawn(function()a3 .ok,a3 .v=pcall(function()return jD:InvokeServer("open")end)
a3 .done=true end)ap(function()return a3 .done end,6)e.replaying=false local b_=a3 .v if a3 .done and a3 .ok and type(b_)=="table"and b_.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(pL,b_.prize and ak(W(tostring(b_.prize)))or"?"))
ap(function()local pO=ab()return pO~=nil and pO~=ys end,1.5)if(jG.Position-gi.Position).Magnitude>8 then pcall(function()aD(gh,gi.Position,gi.Position+gi.LookVector)end)end
return true,"opened"end jH=(a3 .done and a3 .ok and type(b_)=="table")and tostring(b_.reason or"refused, no reason given")
or(a3 .done and("error: "..tostring(b_))or"no answer in 6s")af(0.3)if not pN()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(pL,jH))
return false,jH end e.GIVEUP=600 function e.drop()local pP=ah:FindFirstChild("Remotes")local pQ=pP and pP:FindFirstChild("CrateAction")
local pR=c.plot and c.plot:FindFirstChild("CrateStand")local jI=pR and pR:FindFirstChild("Spot")local pS=ao()
if jI and pS and(pS.HumanoidRootPart.Position-jI.Position).Magnitude>8 then b6(jI,e.prompt)af(0.3)end local jJ,bh=false,nil
if pQ then jJ,bh=pcall(function()return pQ:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(e.title),math.floor(e.GIVEUP/60),(jJ and type(bh)=="table"and bh.ok)and"done"or("answer: "..tostring(type(bh)=="table"and(bh.reason or bh.ok)or bh))))
e.waiting,e.on,e.quietUntil=false,false,y()+4 e.summonFails,e.nearFails,e.lastFail,e.at,e.prompt=0,0,0,nil,nil
if not(jJ and type(bh)=="table"and bh.ok)then dY(false)end end function e.smart()local jK=e.title if(e.nearFails or 0)<3 then
local yv=e.near()if yv then return true end if e.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local ca=e.learned if ca then local jL=ab()if e.on then e.replay()if ap(e.goneOrNew(jL),3.5)then c.crates=c.crates+1
A("OPENED "..jK.." (direct)")return true end else if ca.mode~="window"then e.replay()if ap(e.goneOrNew(jL),3.5)then
c.crates,e.fails=c.crates+1,0 if ca.mode~="direct"then ca.mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..jK.." (direct, no window)")return true end end if jq()then e.replay()if ap(e.goneOrNew(jL),3.5)then
c.crates,e.fails=c.crates+1,0 if ca.mode~="window"then ca.mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..jK.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,aj.dirty=ca,nil,true
if e.fails>=3 then e.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return dY(true)end function D.snap()return{rules=H:GetAttribute("AutoRollRules"),stop=H:GetAttribute("AutoRollStop"),
on=H:GetAttribute("AutoRollOn"),main=H:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for yw,pT in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do Q(H:GetAttributeChangedSignal(pT):Connect(function()D.cache[yw]=H:GetAttribute(pT)end))
end end function D.isOn()return H:GetAttribute("AutoRollOn")==true end function D.saw(yx,...)local gj=D.cache
local yy={m=yx,n=select("#",...),args={...},before={rules=gj.rules,stop=gj.stop,on=gj.on,main=gj.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,yy)end end)end function D.learnOne(d4)local ax,d5=D.snap(),d4 .before local gk=(ax.rules~=d5 .rules)or(ax.stop~=d5 .stop)
local pU=(ax.on~=d5 .on)or(ax.main~=d5 .main)if not gk and not pU then return end local pV={}for pW=1,d4 .n do
local aM=d4 .args[pW]local cb=type(aM)if cb=="string"and aM~=""and aM==ax.rules then aM={__slot="rules"}elseif cb=="string"and aM~=""and gk and aM==ax.stop and ax.stop~=d5 .stop then aM={__slot="stop"}
elseif cb=="table"then local pX={}for yz,cP in pairs(aM)do if type(cP)=="table"or(type(cP)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end pX[yz]=(type(cP)=="string"and cP~=""and cP==ax.rules)and{__slot="rules"}or cP end aM=pX elseif cb~="string"and cb~="number"and cb~="boolean"and cb~="nil"then
if aM==H then aM={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end pV[pW]=aM
end local cQ={m=d4 .m,n=d4 .n,args=pV}if gk then local jM=false for yA=1,cQ.n do local d6=cQ.args[yA]if type(d6)=="table"and d6 .__slot=="rules"then jM=true end
if type(d6)=="table"and not d6 .__slot then for Fo,pY in pairs(d6)do if type(pY)=="table"and pY.__slot=="rules"then jM=true end end
end end if jM then D.rec.rules={cQ}else table.insert(D.rec.rules,cQ)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if pU then if ax.on==true then D.rec.on=cQ else D.rec.off=cQ end d.AutoRoll=(ax.on==true)end if ax.rules and ax.rules~=""then d.ARrules,d.ARstop=ax.rules,ax.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gk and"choices"or(ax.on and"on"or"off")))end
function D.resolve(cR)if type(cR)~="table"then return cR end if cR.__slot=="rules"then return d.ARrules~=""and d.ARrules or H:GetAttribute("AutoRollRules")end
if cR.__slot=="stop"then return d.ARstop~=""and d.ARstop or H:GetAttribute("AutoRollStop")end if cR.__slot=="player"then return H end
local pZ={}for yB,yC in pairs(cR)do pZ[yB]=D.resolve(yC)end return pZ end function D.replay(p0,yD)local p1=table.unpack or unpack
for Fp,d7 in ipairs(yD)do local jN={}for p2=1,d7 .n do jN[p2]=D.resolve(d7 .args[p2])end D.replaying=true pcall(function()
if d7 .m=="InvokeServer"then task.spawn(function()pcall(function()p0:InvokeServer(p1(jN,1,d7 .n))end)end)else p0:FireServer(p1(jN,1,d7 .n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(p3,yE)if D.busy or not c.alive then return end D.busy=true
pcall(function()local p4=ah:FindFirstChild("Remotes")local jO=p4 and p4:FindFirstChild("AutoRollAction")if not jO then D.msg="this game has no AutoRollAction"return end
local bD=d.AutoRoll if bD and d.ARrules~=""and H:GetAttribute("AutoRollRules")~=d.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(jO,D.rec.rules)
if ap(function()return H:GetAttribute("AutoRollRules")==d.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bD==D.isOn()or(not bD and not yE)then return end
local gl=bD and D.rec.on or D.rec.off if not gl then local d8=bD and D.rec.off or D.rec.on local p5=d8~=nil for yF=1,d8 and d8 .n or 0 do
if type(d8 .args[yF])=="boolean"then p5=false end end if p5 then gl=d8 end end if not gl then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bD and"on"or"off")
A(D.msg)return end D.replay(jO,{gl})if ap(function()return D.isOn()==bD end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bD and"ON"or"OFF",p3 and(" ("..p3 ..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local yG,yH=pcall(function()return H.UserId end)return yG and yH or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local yI,jP=pcall(function()return require(ah:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if yI and type(jP)=="table"and type(jP.Pets)=="table"then q.I=jP end return q.I end function q.order()if q.list then return q.list end
local bE=q.info()if not bE then return{}end local cc={}if type(bE.Order)=="table"and#bE.Order>0 then for Fq,p6 in ipairs(bE.Order)do if bE.Pets[p6]then cc[#cc+1]=p6 end end
else for yJ in pairs(bE.Pets)do cc[#cc+1]=yJ end table.sort(cc,function(yK,yL)return(bE.Pets[yK].price or 0)<(bE.Pets[yL].price or 0)end)
end q.list=cc return cc end function q.nice(p7,jQ)local p8=q.info()local p9=p8 and p8 .Pets[p7]return((jQ and jQ~="")and(jQ.." ")or"")..(p9 and p9 .displayName or tostring(p7))
end function q.data()local gm=H:GetAttribute("PetsData")if type(gm)~="string"then return nil end if gm==q.rawD then return q.lastD end
local yM,d9=pcall(function()return q.HS:JSONDecode(gm)end)d9=(yM and type(d9)=="table")and d9 or nil q.rawD,q.lastD=gm,d9
return d9 end function q.pen()return ah:FindFirstChild("PetMeadowSpawns")end function q.srv()return as:GetServerTimeNow()end
function q.money()local jR=H:FindFirstChild("MoneyValue")if jR and type(jR.Value)=="number"then return jR.Value end
return a8()or 0 end function q.wishes()local p_=q.pen()local qa=p_ and p_:GetAttribute("Wishes")local jS,qb={},q.srv()
if type(qa)~="string"then return jS end local yN,qc=pcall(function()return q.HS:JSONDecode(qa)end)if yN and type(qc)=="table"then
for yO,jT in pairs(qc)do if type(jT)=="number"and jT>qb then jS[yO]=jT-qb end end end return jS end function q.call(...)
local qe=ah:FindFirstChild("Remotes")local qf=qe and qe:FindFirstChild("PetRequest")if not qf then return nil end
local qg=table.pack(...)local cd={}task.spawn(function()cd.ok,cd.v=pcall(function()return qf:InvokeServer(table.unpack(qg,1,qg.n))end)
cd.done=true end)local yP=y()while not cd.done and y()-yP<6 do task.wait(0.05)end if cd.done and cd.ok then return cd.v end
return nil end function q.want(yQ)return d.Pets[yQ]end function q.closeNaming(jU)local qi=pcall(function()local qh=H:FindFirstChild("PlayerScripts")
local yR=qh and qh:FindFirstChild("Naming",true)require(yR).close()end)af(0.5)if jU.Visible then pcall(function()local qj=jU:FindFirstChild("NameBox",true)if qj then qj:ReleaseFocus()end end)
jU.Visible=false qi=false end return qi end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qk=H:FindFirstChildOfClass("PlayerGui")
local ql=qk and qk:FindFirstChild("MainGui")local gn=ql and ql:FindFirstChild("PetNameGui")if gn and gn.Visible then
af(0.4)if gn.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gn)break end end af(0.25)end
q.namingOn=false end)end function q.buyTick()if not d.PetBuy then q.buyMsg="auto adopt is off"return end local jV,qm,go=q.info(),q.pen(),q.data()
if not(jV and qm and go)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local d_,jW=#(go.pets or{}),tonumber(go.maxOwned)or 60
local yS,qo,ea=q.srv(),{},nil for Fr,aS in ipairs(qm:GetChildren())do qo[aS.Name]=true local ce,gp=aS:GetAttribute("Pet"),aS:GetAttribute("Variant")or""
local jX=ce and q.want(ce)if jX and jX.b and jV.Pets[ce]and(not jX.g or gp=="Big")and C.wantMore(ce,gp,go)and not aS:GetAttribute("A_"..q.uid)
and(tonumber(aS:GetAttribute("ExpiresAt"))or 0)>yS+1 and y()>=(q.tryAt[aS.Name]or 0)then local eb,qp=q.nice(ce,gp),jV.Pets[ce].price or 0
if d_>=jW then ea=("%s is in the pen, but you have %d/%d pets"):format(eb,d_,jW)q.tryAt[aS.Name]=y()+15 elseif q.money()<qp then
ea=("%s is in the pen - need $%s"):format(eb,aL(qp))q.tryAt[aS.Name]=y()+5 else q.tryAt[aS.Name]=y()+8 local bF=q.call("adopt",aS.Name)
if type(bF)=="table"and bF.ok then d_=d_+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local yT=type(bF.pet)=="table"and bF.pet or{}
table.insert(q.recent,{id=tostring(yT.id or("?"..y())),name=ce,variant=gp,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..eb)q.skipNaming()ea="adopted "..eb else local qq=type(bF)=="table"and tostring(bF.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(eb,qq))ea="adopt failed: "..qq if type(bF)=="table"and bF.bagFull then q.tryAt[aS.Name]=y()+60 end
end end end end for qr in pairs(q.tryAt)do if not qo[qr]then q.tryAt[qr]=nil end end q.buyMsg=ea or("watching the pen (%d/%d pets)"):format(d_,jW)
end function q.wishTick()if not d.PetWish then q.wishMsg="auto wish is off"return end local gq=q.info()if not(gq and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local gr,jY,bG=q.wishes(),0,nil local yU=(type(gq.Wish)=="table"and gq.Wish.cashShare)or 2
local yV=q.data()for Fs,aA in ipairs(q.order())do local qs=q.want(aA)if qs and qs.w and C.wantMore(aA,"",yV)then
jY=jY+1 if not gr[aA]and y()>=(q.wishTry[aA]or 0)then local jZ=tonumber(H:GetAttribute("PetWishCredits"))or 0
local j0=math.floor((gq.Pets[aA].price or 0)*yU)if jZ<=0 and q.money()<j0 then q.wishTry[aA]=y()+10 bG=("need $%s to wish for %s"):format(aL(j0),q.nice(aA))
q.wishWhy[aA]=bG else q.wishTry[aA]=y()+3 local yW=jZ>0 and"wishCredit"or"wish"local gs=q.call(yW,aA)if type(gs)=="table"and gs.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),jZ>0 and"free wish"or("$"..aL(j0))))
else local j1=type(gs)=="table"and tostring(gs.reason or"no reason given")or"no answer"if j1:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),j1))bG="wish failed: "..j1 end end end end end end if not bG then
for Ft,gt in ipairs(q.order())do local qt=q.want(gt)if qt and qt.w and not gr[gt]and q.wishWhy[gt]then bG=q.wishWhy[gt]break end
end end if not bG then local gu={}for Fu,gv in ipairs(q.order())do local qu=q.want(gv)if qu and qu.w and gr[gv]then gu[#gu+1]=("%s %dm"):format(q.nice(gv),math.ceil(gr[gv]/60))end
end bG=jY==0 and"no pet has WISH ticked"or("running: "..(#gu>0 and table.concat(gu,", ")or"none yet"))end q.wishMsg=bG
end z.switches,z.glazed,z.finished=0,0,0 z.done,z.doneN,z.later={},0,{}function z.teams()local j2=q.data()return(j2 and j2 .teams)or{},j2
end function z.current(cS)cS=cS or q.data()if not cS then return""end local qv={}for Fv,yX in ipairs(cS.equipped or{})do qv[tostring(yX)]=true end
for Fw,qw in ipairs(cS.teams or{})do local qx=qw.pets or{}local j3=#qx==#(cS.equipped or{})if j3 then for Fx,yY in ipairs(qx)do if not qv[tostring(yY)]then j3=false break end end end
if j3 then return qw.name end end return""end function z.equip(j4)local yZ,y0=z.teams()local j5 for y1,y2 in ipairs(yZ)do if y2 .name==j4 then j5=y1 break end end
if not j5 then z.msg="no saved team called "..tostring(j4)return false end if z.current(y0)==j4 then return true end
for Fy=1,4 do local qy=q.call("teamEquip",j5)if type(qy)=="table"and qy.ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(y3)local qz=y3:FindFirstChild("SquishyPlaceHolder")local qA=qz and qz:FindFirstChild("TimerGui")
local qB=qA and qA:FindFirstChildWhichIsA("TextLabel",true)local j6=qB and qB.Text if type(j6)~="string"or j6:find("-",1,true)then return nil end
local j7,qC,qD=j6:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not j7 then return nil end local qE=qD~=""and(tonumber(j7)*3600+tonumber(qC)*60+tonumber(qD))or(tonumber(j7)*60+tonumber(qC))
return qE>0 and qE or nil end function z.waxes()local ec={}local qF=c.plot and c.plot:FindFirstChild("WaxStations")
if not qF then return ec end local qG=q.srv()for Fz,a4 in ipairs(qF:GetChildren())do local j8=tonumber(a4:GetAttribute("PourEnd"))
local qH=a4:GetAttribute("PourOwner")if a4:GetAttribute("HasSquishy")and a4:GetAttribute("PourId")and(qH==nil or qH==q.uid)then
local j9=z.left(a4)local qI=j9 and(qG+j9)or((j8 and j8>qG)and j8 or nil)if qI then local qJ,qK=a4:FindFirstChild("SquishyPlaceHolder"),"?"
if qJ then for FA,qL in ipairs(qJ:GetChildren())do if qL:IsA("Model")then qK=qL.Name break end end end local y4=tostring(a4:GetAttribute("Helpers")or"")
local j_=0 for FB in y4:gmatch("%d+")do j_=j_+1 end ec[#ec+1]={st=a4,ends=qI,sure=j9~=nil,id=a4:GetAttribute("PourId"),name=qK,helps=j_,
long=a4:GetAttribute("PourLong")==true}end end end table.sort(ec,function(y5,y6)return y5 .ends<y6 .ends end)
return ec end function z.glazeCount()local qM=ah:FindFirstChild("Remotes")local qN=qM and qM:FindFirstChild("EditStack")
if not qN then return nil end local y7,ed=pcall(function()return qN:InvokeServer("State",nil)end)if not(y7 and type(ed)=="table"and type(ed.state)=="table")then return nil end
local ka,kb=0,{}for FC,gw in ipairs(ed.state.entries or{})do if gw.glaze and gw.glaze~=""then ka=ka+1 kb[gw.glaze]=(kb[gw.glaze]or 0)+1 end
end return ka,kb,#(ed.state.entries or{}),ed.state.capacity end function z.finishedOne(gx,qO)z.finished=z.finished+1
task.wait(2)local kc,y8,qP,y9=z.glazeCount()if kc and qO and kc>qO then z.glazed=z.glazed+1 local kd={}for y_,za in pairs(y8)do kd[#kd+1]=y_.." "..za end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(gx.name)),gx.st.Name,kc,table.concat(kd,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gx.st.Name,ak(W(gx.name)),qP and(" (stack "..qP.."/"..tostring(y9)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not d.Teams then z.want,z.msg="","auto teams is off"return end
local cf=q.srv()local aF=z.glazeFor if aF then local ee=aF.st local qQ=ee.Parent and ee:GetAttribute("HasSquishy")and ee:GetAttribute("PourId")==aF.id
local qR=qQ and z.left(ee)if qR then aF.ends=cf+qR end if not qQ then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local zb=aF.before
task.spawn(function()pcall(z.finishedOne,aF,zb)end)end elseif aF.ends-cf>d.GlazeLead*3+60 or cf>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(ee.Name,z.clock(aF.ends-cf)))
end end if d.TeamGlaze~=""and not z.glazeFor then local zc=z.speedRatio(d.TeamGlaze)for FD,cg in ipairs(z.list)do
if cg.sure and(cg.ends-cf)*zc[cg.long and 2 or 1]<=d.GlazeLead and y()>=(z.later[cg.id or"?"]or 0)and not z.done[cg.id or"?"]then
z.glazeFor=cg task.spawn(function()cg.before=z.glazeCount()end)break end end end local aG,ef="",""local cT=d.SnapGlaze~=false and o.snapAt and(o.snapAt-cf)
if cT and cT<-8 then o.snapAt,cT=nil,nil end if d.TeamGlaze~=""and cT and cT<=20 then aG,ef=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cT)))
elseif d.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ef=d.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ef=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and z.allBusy()then
aG,ef=d.TeamFull," - every station is busy"else aG=d.TeamNormal end z.want=aG local eg=z.current()z.cur=eg if aG~=""and eg~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ef)else z.nextTry=y()+3 end end local ke=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(eg~=""and eg or"(not a saved team)",(aG~=""and aG~=eg)and(" -> "..aG)or"",
ke and("in "..z.clock(ke.ends-cf).." (st "..ke.st.Name..")")or"- none running")end function z.clock(bH)bH=math.max(0,math.floor(bH))
if bH>=3600 then return("%d:%02d:%02d"):format(math.floor(bH/3600),math.floor((bH%3600)/60),bH%60)end return("%d:%02d"):format(math.floor(bH/60),bH%60)
end function z.allBusy()local zd,ze=fo()return ze>0 and zd==0 end function z.aboutToPlace()if not c.running then return false end
local qS=ab()if not(qS and aK(qS))then return false end local zf=fo()return zf>0 end function z.mult(qT,zg,qU)return{(1+qT)*(1+qU),(1+qT+zg)*(1+qU)}end
function z.speedNow()local function kf(zh)return tonumber(H:GetAttribute(zh))or 0 end return z.mult(kf("PetWaxSpeed"),kf("PetLongWax"),kf("PetSocialWax"))
end function z.speedOf(zi)local zj,qV=z.teams()if not qV then return nil end for FE,qW in ipairs(zj)do if qW.name==zi then
local kg={}for FF,zk in ipairs(qW.pets or{})do for FG,qX in ipairs(qV.pets or{})do if tostring(qX.id)==tostring(zk)then kg[#kg+1]=qX break end end
end local qY=C.caps()local qZ,zl=C.stats(kg)return z.mult(math.min(qZ.waxSpeed or 0,qY.waxSpeed or 0.25),math.min(qZ.longWax or 0,qY.longWax or 0.3),zl.socialWax or 0)
end end return nil end function z.speedRatio(zm)local q0,kh=z.speedNow(),z.speedOf(zm)if not kh then return{1,1}end
return{q0[1]/kh[1],q0[2]/kh[2]}end function z.glazeSoon()return d.Teams and d.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return H:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local ki=q.info()return(ki and type(ki.Caps)=="table")and ki.Caps or C.CAPS
end function C.value(q1,kj)local gy=q.info()local cU=gy and gy.Pets[q1]if not(cU and type(cU.boost)=="table")then return nil end
local cj if type(gy.boostValue)=="function"then local zn,zo=pcall(gy.boostValue,q1,(kj~=""and kj)or nil)cj=zn and tonumber(zo)or nil
end if not cj then cj=cU.boost.value or 0 if kj=="Big"then local q2=cj*1.5 cj=C.ROUND[cU.boost.kind]and math.max(cj+1,math.floor(q2+0.5))or q2
end end return cU.boost.kind,cj,cU.boost.every end function C.stats(zp)local ck,kk={},{}for FH,q3 in ipairs(zp)do
local aT,gz,q4=C.value(q3 .name,q3 .variant or"")if aT then if aT:sub(1,6)=="social"then kk[aT]=math.max(kk[aT]or 0,gz)
elseif aT=="waxStir"or aT=="cashGift"then ck[aT]=(ck[aT]or 0)+gz*60/(q4 or 60)elseif aT=="luckyPull"then ck.luckyPull=(ck.luckyPull or 0)+gz/(q4 or 10)
else ck[aT]=(ck[aT]or 0)+gz end end end return ck,kk end function C.glazeGain(zq,gA)local eh,kl,FI={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local zr=eh[1]+eh[2]+eh[3]local zs=tonumber(H:GetAttribute("GuildUpGlaze"))or 0 local cV={}for gB=1,3 do cV[gB]=eh[gB]+zq*eh[gB]/zr+(gB==1 and zs or 0)end
local km={cV[1]*(1-gA),cV[2]*(1-gA)+cV[1]*gA,cV[3]+cV[2]*gA}return km[1]*(kl[1]-1)+km[2]*(kl[2]-1)+km[3]*(kl[3]-1)
end function C.score(gC,zt)local kn=C.caps()local gD,gE=C.stats(zt)local function bi(q5)return math.min(gD[q5]or 0,kn[q5]or math.huge)end
local zu=(1+bi("income"))*(1+(gE.socialIncome or 0))*(1+math.min(gD.cashGift or 0,kn.cashGiftPerMinute or 9)/60)
local zv=1+bi("luck")+(gD.luckyPull or 0)+(gE.socialLuck or 0)local q6=zv*(1+bi("newFind"))*(1+bi("rollSpeed"))
local ei=math.log(zu)local zw=math.max(tonumber(H:GetAttribute("WaxStations"))or 18,1)local ko=(1+bi("waxSpeed")+bi("longWax"))*(1+(gE.socialWax or 0))
+math.min(gD.waxStir or 0,kn.waxStirPerMinute or 30)/60/zw local zx=1-(1-bi("headStart"))*(1-(gE.socialHeadStart or 0))
if gC=="farm"then return ei+0.7*math.log(q6)+0.1*math.log(ko)end if gC=="full"then return ei+0.4*math.log(ko)+0.02*math.log(q6)end
if gC=="glaze"then return C.glazeGain(bi("glaze"),bi("glazeUp"))+0.001*ei end if gC=="wax"then return-math.log(1-0.5*zx)+0.001*ei+0.001*math.log(ko)end
return ei end function C.best(q7,cW,zy,kp)kp=kp or{}local ay,ej={},{}local function q8(zz)local q9={}for zA,zB in ipairs(zz)do q9[zA]=cW[zB]end return q9 end
local function kq(q_)local kr=C.score(q7,q8(q_))for FJ,zC in ipairs(q_)do if kp[cW[zC].id]then kr=kr+1e-7 end end
return kr end for FK=1,math.min(zy,#cW)do local gF,ks for kt=1,#cW do if not ej[kt]then ay[#ay+1]=kt local ra=kq(ay)
ay[#ay]=nil if not ks or ra>ks+1e-12 then gF,ks=kt,ra end end end if not gF then break end ej[gF]=true ay[#ay+1]=gF
end for FL=1,6 do task.wait()local rb,rc=false,kq(ay)for ku=1,#ay do for kv=1,#cW do if not ej[kv]then local rd=ay[ku]
ay[ku]=kv local re=kq(ay)if re>rc+1e-9 then ej[rd],ej[kv],rc,rb=nil,true,re,true else ay[ku]=rd end end end end
if not rb then break end end local rf={}for zD,zE in ipairs(ay)do rf[zD]=tostring(cW[zE].id)end return rf,C.score(q7,q8(ay))
end function C.count(rg,rh,zF)local ek,el={},0 local ri,rj={},{}for FM,zG in ipairs(rh.arriving or{})do ri[tostring(zG)]=true end
for FN,cX in ipairs(rh.pets or{})do rj[tostring(cX.id)]=true if cX.name==rg and not ri[tostring(cX.id)]then if cX.variant=="Big"then el=el+1 elseif(cX.variant or"")==""then ek[#ek+1]=cX end
end end if not zF then for FO,em in ipairs(q.recent or{})do if em.name==rg and not rj[em.id]and y()-em.at<20 then
if em.variant=="Big"then el=el+1 else ek[#ek+1]=em end end end end return ek,el end function C.goal(zH)local rk=d.Pets[zH]return rk and tonumber(rk.f)or 0 end
function C.wantMore(rl,zI,rm)local kw=C.goal(rl)if kw<=0 or not rm then return true end local zJ,rn=C.count(rl,rm)
if rn>=kw then return false end if zI=="Big"then return true end return#zJ<C.need()*(kw-rn)end function C.status(ro,rp)
local gG=C.goal(ro)if gG<=0 or not rp then return nil end local zK,kx=C.count(ro,rp)if kx>=gG then return("Big %d/%d done"):format(kx,gG)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#zK,C.need()),C.need(),kx,gG)end function C.wear(ky)local kz={}
for FP,zL in ipairs(ky)do kz[tostring(zL)]=true end for FQ=1,3 do local cY=q.data()if not cY then return false end
for FR,rq in ipairs(cY.equipped or{})do if not kz[tostring(rq)]then q.call("unequip",rq)task.wait(0.3)end end
cY=q.data()local rr={}for FS,zM in ipairs(cY.equipped or{})do rr[tostring(zM)]=true end for FT,rs in ipairs(ky)do
if not rr[tostring(rs)]then q.call("equip",rs)task.wait(0.3)end end task.wait(0.4)cY=q.data()local kA,rt=0,true
for FV,zN in ipairs(cY.equipped or{})do kA=kA+1 if not kz[tostring(zN)]then rt=false end end if rt and kA==#ky then return true end
end return false end function C.saveTeam(ru,rv)if not C.wear(rv)then return false,"could not put the pets on"end
local zO=z.teams()local cl for zP,zQ in ipairs(zO)do if zQ.name==ru then cl=zP break end end local cZ if cl then
cZ=q.call("teamSave",cl)else cZ=q.call("teamNew")if type(cZ)=="table"and cZ.ok and cZ.index then cl=cZ.index task.wait(0.3)
q.call("teamRename",{index=cl,name=ru})end end task.wait(0.4)local kB=q.data()local rw=kB and kB.teams and cl and kB.teams[cl]
if not rw then return false,"the game did not save it"end local rx={}for FW,zR in ipairs(rw.pets or{})do rx[tostring(zR)]=true end
for FX,zS in ipairs(rv)do if not rx[tostring(zS)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local zT=q.srv()for FY,zU in ipairs(z.list or{})do if zU.ends-zT<(d.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local en=q.data()if not en then return{}end local ry={}for FZ,zV in ipairs(en.arriving or{})do ry[tostring(zV)]=true end
local eo={}for F0,gH in ipairs(en.pets or{})do if not ry[tostring(gH.id)]then eo[#eo+1]={id=tostring(gH.id),name=gH.name,variant=gH.variant or""}end
end local rz={}for F1,rA in ipairs(eo)do rz[rA.id]=rA end local rB=tonumber(en.slots)or 3 local kC,rC={},{}for F2,gI in ipairs(C.ROLES)do
local ep=d[gI[1]]if ep~=""and not rC[ep]then rC[ep]=true local kD,eq,rD={},{},false for F3,rE in ipairs(en.teams or{})do
if rE.name==ep then for F4,zW in ipairs(rE.pets or{})do local kE=rz[tostring(zW)]if kE then kD[kE.id]=true eq[#eq+1]=kE else rD=true end
end end end local kF,rF=C.best(gI[2],eo,rB,kD)local rG=C.score(gI[2],eq)local rH=#kF==#eq for F5,zX in ipairs(kF)do if not kD[zX]then rH=false end end
if not rH and(rD or#eq<math.min(rB,#eo)or rF>rG+1e-4)then kC[#kC+1]={team=ep,role=gI[2],ids=kF,gain=rF-rG}end
end end return kC end function C.rebuild(zY)local rI=C.plan()if#rI==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gJ=true local z2,z3=pcall(function()for F6,er in ipairs(rI)do local zZ,z0=C.saveTeam(er.team,er.ids)local rJ=q.data()
local kG={}for F7,z1 in ipairs(er.ids)do for F8,kH in ipairs(rJ and rJ.pets or{})do if tostring(kH.id)==z1 then kG[#kG+1]=q.nice(kH.name,kH.variant)end
end end if zZ then A(("TEAM %s rebuilt (%s): %s"):format(er.team,zY or"pets changed",table.concat(kG,", ")))else gJ=false A(("TEAM %s: %s"):format(er.team,tostring(z0)))end
end end)z.editing,z.nextTry=false,0 if not z2 then gJ=false A("TEAM BUILD ERR "..tostring(z3))end C.builds=C.builds+1
C.buildMsg=gJ and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gJ end
function C.fuseTick()if not d.AutoFuse or z.editing then return end local gK=q.data()if not gK then return end
local kI=C.need()local kJ,gL={},{}for F9,z4 in ipairs(gK.teams or{})do for F_,z5 in ipairs(z4 .pets or{})do kJ[tostring(z5)]=true end end
for Ga,z6 in ipairs(gK.equipped or{})do gL[tostring(z6)]=true end C.failUntil=C.failUntil or{}for cm,z7 in pairs(d.Pets)do
local rK=tonumber(z7 .f)or 0 local kK,z8=C.count(cm,gK,true)if rK>0 and z8<rK and#kK>=kI and y()>=(C.failUntil[cm]or 0)then
table.sort(kK,function(gM,gN)local rL=(gL[tostring(gM.id)]and 4 or 0)+(kJ[tostring(gM.id)]and 2 or 0)+(gM.named and 1 or 0)
local rM=(gL[tostring(gN.id)]and 4 or 0)+(kJ[tostring(gN.id)]and 2 or 0)+(gN.named and 1 or 0)if rL~=rM then return rL<rM end
return tostring(gM.id)<tostring(gN.id)end)local gO,kL={},{}for gP=1,kI do gO[gP]=tostring(kK[gP].id)if gL[gO[gP]]then kL[#kL+1]=gO[gP]end
end z.editing,z.editingSince=true,y()for Gb,z9 in ipairs(kL)do q.call("unequip",z9)task.wait(0.3)end local gQ=q.call("fuse",{ids=gO})
z.editing,z.nextTry=false,0 if type(gQ)=="table"and gQ.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(kI,q.nice(cm),q.nice(cm)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(cm),os.date("%H:%M"))else C.failUntil[cm]=y()+120 A(("fuse %s failed: %s"):format(q.nice(cm),type(gQ)=="table"and tostring(gQ.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not d.AutoBuild or not d.Teams then return end local rN=q.data()
if not rN then return end local cn={}for Gc,z_ in ipairs(rN.pets or{})do cn[#cn+1]=tostring(z_.id)end table.sort(cn)
cn=table.concat(cn,",")if cn~=C.sig then C.sig,C.dirtyAt=cn,y()end local Aa=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if Aa and not z.editing then local Ab=C.rebuild(C.dirtyAt and"pets changed"or"check")if Ab then C.dirtyAt,C.lastBuild=nil,y()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(co)return co:IsA("ParticleEmitter")or co:IsA("Trail")or co:IsA("Beam")or co:IsA("Fire")or co:IsA("Smoke")
or co:IsA("Sparkles")or co:IsA("Light")end function j.muteOne(aH)if not d.Lite or not aH.Parent then return end
local gR=(aH:IsA("BillboardGui")and j.bb)or(j.isFx(aH)and j.fx)or nil if not gR or gR[aH]~=nil then return end
gR[aH]=aH.Enabled if aH.Enabled then aH.Enabled=false end j.watch[aH]=aH:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aH.Enabled then gR[aH]=true aH.Enabled=false end end)end function j.lite(rO)d.Lite=rO if rO then
task.spawn(function()for Ac,Ad in ipairs(as:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,Ad)
if Ac%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=Q(as.DescendantAdded:Connect(function(kM)
if d.Lite and(kM:IsA("BillboardGui")or j.isFx(kM))then j.queue[#j.queue+1]=kM end end))end local kN=game:GetService("Lighting")
for Gd,es in ipairs(kN:GetChildren())do if es:IsA("PostEffect")and es.Enabled and j.post[es]==nil then j.post[es]=true es.Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and kN.GlobalShadows or j.oldShadows kN.GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and as.Terrain.Decoration or j.oldDeco as.Terrain.Decoration=false end)
else for Ge,Ae in pairs(j.watch)do pcall(function()Ae:Disconnect()end)end for rP,Af in pairs(j.bb)do pcall(function()if rP.Parent then rP.Enabled=Af end end)end
for rQ,Ag in pairs(j.fx)do pcall(function()if rQ.Parent then rQ.Enabled=Ag end end)end for rR in pairs(j.post)do pcall(function()if rR.Parent then rR.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local Ah=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()Ah.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()as.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(rS)d.HideHud=rS local kO=H:FindFirstChildOfClass("PlayerGui")if not kO then return end if rS then
for Gf,et in ipairs(kO:GetChildren())do if et:IsA("ScreenGui")and not j.MINE[et.Name]and et.Enabled then j.hud[et]=true et.Enabled=false end
end if not j.hudConn then j.hudConn=Q(kO.ChildAdded:Connect(function(eu)if d.HideHud and eu:IsA("ScreenGui")and not j.MINE[eu.Name]then
task.defer(function()if d.HideHud and eu.Enabled then j.hud[eu]=true eu.Enabled=false end end)end end))end else
for rT in pairs(j.hud)do pcall(function()if rT.Parent then rT.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(kP)d.FpsCap=kP local rU=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not rU then return false end return pcall(rU,kP==0 and 60 or kP)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(an)if an:IsA("BasePart")or an:IsA("Decal")or an:IsA("Texture")then if an.Transparency<1 then j.unseen[an]=an.Transparency an.Transparency=1 end
elseif an:IsA("BillboardGui")or an:IsA("SurfaceGui")or an:IsA("ParticleEmitter")or an:IsA("Beam")or an:IsA("Trail")or an:IsA("Light")or an:IsA("Fire")or an:IsA("Smoke")or an:IsA("Sparkles")then
if an.Enabled then j.unseen[an]=true an.Enabled=false end end end function j.notMine(Ai)return d.HideMine or(c.plot and not Ai:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(rV)if d.HideBases then j.bases(false)end d.HideMine=rV==2 if rV>0 then j.bases(true)end end
function j.bases(rW)d.HideBases=rW local kQ=as:FindFirstChild("Plots")if not kQ then return end if rW then task.spawn(function()
local kR=0 for Gg,rX in ipairs(kQ:GetChildren())do if rX~=c.plot or d.HideMine then for Gh,Aj in ipairs(rX:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,Aj)kR=kR+1 if kR%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=Q(kQ.DescendantAdded:Connect(function(rY)if d.HideBases and j.notMine(rY)then task.defer(function()pcall(j.hideOne,rY)end)end
end))end else for kS,rZ in pairs(j.unseen)do pcall(function()if not kS.Parent then return end if type(rZ)=="number"then kS.Transparency=rZ else kS.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(r0)d.NoRender=r0 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not r0)end)
end j.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
j.calmed={}function j.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local Ak=game:GetService("RunService")
local kT=0 for Gi,Al in ipairs({"RenderStepped","Heartbeat","Stepped"})do local Am,r1=pcall(function()return Ak[Al]end)
local r2,kU=false,nil if Am and r1 then r2,kU=pcall(getconnections,r1)end if r2 and type(kU)=="table"then for Gj,kV in ipairs(kU)do
local kW=""pcall(function()local r3=getfenv(kV.Function).script kW=r3 and r3:GetFullName()or""end)if kW~=""then
for Gk,An in ipairs(j.CALM)do if kW:find(An,1,true)then if pcall(function()kV:Disable()end)then j.calmed[#j.calmed+1]=kV kT=kT+1 end
break end end end end end end if#j.calmed>200 then local kX={}for Ao=#j.calmed-49,#j.calmed do kX[#kX+1]=j.calmed[Ao]end j.calmed=kX
end return kT end function j.calm(r4)d.Calm=r4 if r4 then local Ap=j.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(Ap))
else for Gl,Aq in ipairs(j.calmed)do pcall(function()Aq:Enable()end)end j.calmed={}end end function j.restoreAll()
pcall(j.unpin)pcall(j.calm,false)if d.HideBases then pcall(j.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(r5)if c.rejoining then return end A("REJOIN this server ("..r5 ..")")
pcall(fr)if c.autoload then pcall(fS,c.autoload)end oj()local Ar=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,H)
end)task.delay(25,function()if c.alive then dH(r5 ..", same server failed")end end)return Ar end function j.tick()
local kY=j.queue if d.Lite and kY and#kY>0 then j.queue={}for As,At in ipairs(kY)do pcall(j.muteOne,At)if As%300==0 then task.wait()end end
end local r6=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if r6 then for Gm,Au in ipairs(r6:GetChildren())do
local r7=Au:FindFirstChild("SquishyPlaceHolder")local cp=r7 and r7:FindFirstChild("TimerGui")if cp and cp:IsA("BillboardGui")then
if j.bb[cp]==nil then pcall(j.muteOne,cp)elseif cp.Enabled then j.bb[cp]=true cp.Enabled=false end end end end
local Av,ev=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Av and type(ev)=="number"then
j.mem=ev j.memPeak=math.max(j.memPeak,ev)if(d.MemLimit or 0)>0 and ev>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(ev,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if y()-(j.noteAt or 0)>1800 then j.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function kZ(gS)if type(gS)~="string"then return false end
gS=gS:lower()for Gn,Aw in ipairs(c.sellWords)do if gS:find(Aw,1,true)then return true end end return false end
local function Ax()local r8=ah:FindFirstChild("Remotes")local k0=r8 and r8:FindFirstChild("SellSquishy")if not(k0 and k0:IsA("RemoteEvent"))then return false end
if not pcall(function()k0:FireServer()end)then return false end return ap(function()return ab()==nil end,1.5)
end local function Ay()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local r9=ao()local r_=r9 and r9 .HumanoidRootPart.Position local ew,sa for Go,c0 in ipairs((c.plot or as):GetDescendants())do
if c0:IsA("ProximityPrompt")and(kZ(c0 .ActionText)or kZ(c0 .ObjectText)or kZ(c0 .Name))then local sb=nh(c0)local k1=(sb and r_)and(sb-r_).Magnitude or 1e9
if k1<=400 and(not ew or k1<sa)then ew,sa=c0,k1 end end end c.sellSpot=ew c.noSellSpot=(ew==nil)return ew end
local function sc()local k2=ab()if not k2 then c.holding=false return false end if aK(k2)then return false end
local k3=ak(W(k2))if Ax()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..k3)return true end local c1=Ay()if c1 then local sd=du(c1)if sd then b6(sd,c1)local se=ab()if se and not aK(se)then
local Az,AA=dN(c1,function()return ab()==nil end,function()return c1 .Enabled end)if Az then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(k3,fm(c1),AA))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..k3 .." ("..c.sellFails..")")
return false end local AB={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function AC(c2)local gT=fm(c2):lower()for Gp,AD in ipairs(AB)do if gT:find(AD,1,true)then return 0 end end
local a5,aq=c2 .Name:lower(),0 local function aU(AE,AF)return AE:find(AF,1,true)~=nil end if aU(a5,"collect")then aq=aq+60 end
if aU(a5,"cash")or aU(a5,"money")then aq=aq+45 end if aU(a5,"income")or aU(a5,"claim")then aq=aq+35 end if aU(a5,"coin")or aU(a5,"earn")or aU(a5,"green")then aq=aq+20 end
if a5=="pad"or a5=="touch"then aq=aq+25 end if aq==0 and(aU(gT,"collect")or aU(gT,"cash")or aU(gT,"money"))then aq=25 end
if aq==0 then return 0 end local ex=c2 .Color if ex.G>0.5 and ex.G>ex.R*1.4 and ex.G>ex.B*1.4 then aq=aq+15 end
if math.min(c2 .Size.X,c2 .Size.Y,c2 .Size.Z)<2 then aq=aq+5 end return aq end local function AG()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local gU,ey,k4={},nil,29 for Gq,gV in ipairs(c.plot:GetDescendants())do
if gV:IsA("BasePart")then local gW=AC(gV)if gW>0 then gU[#gU+1]={s=gW,p=gV}if gW>k4 then ey,k4=gV,gW end end end
end table.sort(gU,function(AH,AI)return AH.s>AI.s end)c.padCands,c.padPart=gU,ey if ey then A("collect pad: "..fm(ey).." (score "..k4 ..")")end
return ey end local k5="SAB_pad_v1.txt"local function AJ(AK)if type(writefile)=="function"then pcall(writefile,k5,table.concat({AK:GetComponents()},","))end
end local function AL()if type(isfile)~="function"or type(readfile)~="function"then return nil end local AM,sf=pcall(function()if isfile(k5)then return readfile(k5)end end)
if not AM or type(sf)~="string"then return nil end local gX={}for AN in sf:gmatch("[^,]+")do gX[#gX+1]=tonumber(AN)end
if#gX==12 then return CFrame.new(unpack(gX))end end local function AO(k6,gY,AP)local AQ=cK(k6)local k7=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aV=(k7 and k7:IsA("BasePart"))and(k7 .Position-gY)or Vector3 .new(1,0,0)aV=Vector3 .new(aV.X,0,aV.Z)if aV.Magnitude<0.05 then aV=Vector3 .new(1,0,0)end
aV=aV.Unit for AS=0,7 do local gZ=AS*math.pi/4 local AT=Vector3 .new(aV.X*math.cos(gZ)-aV.Z*math.sin(gZ),0,aV.X*math.sin(gZ)+aV.Z*math.cos(gZ))
local g0=gY+AT*(AP+5)local k8=f0(g0 .X,gY.Y,g0 .Z)if k8 and math.abs(k8 .Y-gY.Y)<8 then aD(k6,Vector3 .new(g0 .X,k8 .Y+AQ,g0 .Z))
if i8(k6,0.7)then return true end end end return false end local function AU()c.lastCollect=y()local ez=ao()if not ez then return end
local sh,AV=ez.HumanoidRootPart,cK(ez)local eA,sj,eB,k9=nil,4,nil,"?"local k_=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and k_ and k_:IsA("BasePart")then eA,k9=(k_.CFrame*c.manualPad).Position,"manual pad"else local bj=AG()
if bj then eA=Vector3 .new(bj.Position.X,bj.Position.Y+bj.Size.Y/2+AV,bj.Position.Z)sj,eB,k9=math.max(bj.Size.X,bj.Size.Z)/2,bj,bj.Name
end end if not eA then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local la=a8()aD(ez,eA)
if eB and type(firetouchinterest)=="function"then pcall(firetouchinterest,sh,eB,0)end af(d.PadDwell)if eB and type(firetouchinterest)=="function"then pcall(firetouchinterest,sh,eB,1)end
af(0.5)c.collected=c.collected+1 local lb=a8()A(("COLLECTED (%s) %s"):format(k9,(la and lb and lb>la)and("+$"..aL(lb-la))or"no cash change seen"))
AO(ez,eA,sj)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local sk=ah:FindFirstChild("Modules")if not sk then return false end local function lc(AW)local sl=sk:FindFirstChild(AW)
if not sl then return nil end local AX,sm=pcall(require,sl)return(AX and type(sm)=="table")and sm or nil end o.si,o.arm,o.ci=lc("SquishyInfo"),lc("AutoRollRules"),lc("CrateInfo")
o.modAt=y()if not o.si then return false end local ld={}if o.arm and type(o.arm.tierOf)=="table"then for le in pairs(o.arm.tierOf)do
local g1=o.si[le]if type(g1)=="table"and g1 .rarity~="Limited"and not g1 .incomeType and not g1 .hiddenAfter then ld[W(le)]=le end
end end o.roll=ld local g2={}for AY,AZ in pairs(ld)do local eC=o.si[AZ]if type(eC)=="table"and type(eC.income)=="number"and not eC.incomeType then
g2[#g2+1]={k=AY,inc=eC.income,pr=tonumber(eC.price)or 0}end end table.sort(g2,function(lf,lg)if lf.inc~=lg.inc then return lf.inc>lg.inc end return lf.pr>lg.pr end)
o.order=g2 local g3,lh,li local A0=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for A1,lj in pairs(A0)do
local lk=type(lj)=="table"and tonumber(lj.price)if lk and(not lh or lk>lh)then g3,lh,li=A1,lk,lj.title end end
o.bestCrate,o.bestCrateName=g3 and L.key(g3),g3 o.bestCrateTitle=li and L.key(li)or nil return true end function o.rank(A2)
local A3,A4=pcall(function()return o.arm.rankOf(A2)end)return(A3 and tonumber(A4))or 0 end function o.loadDisc(sn)
if type(sn)~="table"then return end local so={}for A5,A6 in pairs(sn)do if A6 then so[W(tostring(A5))]=true end end
o.disc,o.discAt=so,y()end function o.fetch()o.discAt=y()local sp=ah:FindFirstChild("Remotes")local sq=sp and sp:FindFirstChild("GetSquishiesDiscovered")
if not sq then return end local A7,A8=pcall(function()return sq:InvokeServer()end)if A7 then o.loadDisc(A8)end
end function o.scanWax()local ll={}local sr=c.plot and c.plot:FindFirstChild("WaxStations")if sr then for Gr,ss in ipairs(sr:GetChildren())do
local su=ss:FindFirstChild("SquishyPlaceHolder")if su and ss:GetAttribute("HasSquishy")then for Gs,sv in ipairs(su:GetChildren())do if sv:IsA("Model")then ll[W(sv.Name)]=true end end
end end end for sx,A9 in pairs(o.placedAt)do if y()-A9<20 then ll[sx]=true else o.placedAt[sx]=nil end end o.waxing=ll
end function o.compute()local sy,lm,ln={},0,0 if o.disc then for lo in pairs(o.roll or{})do if not o.disc[lo]then
if o.waxing[lo]then ln=ln+1 else sy[lo],lm=true,lm+1 end end end end o.need,o.nNeed,o.nWax=sy,lm,ln local sz,lp={},d.Best or 0
local lq=(lp==4)and o.stackMin or nil for A_,sA in ipairs(o.order)do if(lq and sA.inc>lq)or(not lq and A_<=(lp==4 and 1 or lp))then sz[sA.k]=true end
end o.best=sz end function o.readStack()o.stackAt=y()local sB=ah:FindFirstChild("Remotes")local sC=sB and sB:FindFirstChild("EditStack")
if not sC then return end local Ba,c3=pcall(function()return sC:InvokeServer("State",nil)end)if not(Ba and type(c3)=="table"and type(c3 .state)=="table"and type(c3 .state.entries)=="table")then return end
local g4 for Gt,sD in ipairs(c3 .state.entries)do local eD=type(sD)=="table"and o.si and o.si[tostring(sD.name)]
if type(eD)=="table"and type(eD.income)=="number"and not eD.incomeType and(not g4 or eD.income<g4)then g4=eD.income end
end o.stackMin=g4 o.stackFull=#c3 .state.entries>=(tonumber(c3 .state.capacity)or 100)end function o.want(lr)
if(d.Best or 0)>0 and(next(o.best)or(d.Best==4 and o.stackMin))then if o.best[lr]then return true end elseif d.Targets[lr]then
return true end return d.AutoIndex==true and o.need[lr]==true end function o.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(o.best)~=nil)or(d.AutoIndex and next(o.need)~=nil)
or d.Best==4 end function o.placed(Bb)local eE=W(Bb)o.placedAt[eE],o.waxing[eE]=y(),true if o.need[eE]then o.need[eE],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eE)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eF,eG={},{}for Bc,Bd in pairs(o.roll or{})do if o.want(Bc)then eF[Bd]=true end end
for sE,ls in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(sE)or(type(ls)=="table"and type(ls.title)=="string"and L.wanted(ls.title))then eG[sE]=true end
end if not next(eF)and not next(eG)then return nil end if o.arm and type(o.arm.encode)=="function"then local Be,sF=pcall(o.arm.encode,{rarities={},butters=eF,crates=eG,index=false})
if Be and type(sF)=="string"then return sF end end local function sG(Bf)local g5={}for Bg in pairs(Bf)do g5[#g5+1]=Bg end table.sort(g5)return table.concat(g5,",")end
local eH="adv:"if next(eF)then eH=eH..";butters:"..sG(eF)end if next(eG)then eH=eH..";crates:"..sG(eG)end return eH
end function o.canon(Bh)local g6={}for sH in tostring(Bh or""):gmatch("[^;]+")do local lt,sI=sH:match("^(%a+):(.*)$")
if not lt then lt,sI="r",sH:gsub("^adv:","")end for Bi in sI:gmatch("[^,]+")do g6[#g6+1]=lt.."="..Bi end end table.sort(g6)
return table.concat(g6,"|")end function o.sync(Bj)if H:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local cq=o.rulesNow()if not cq or#cq>1900 then return end if o.canon(H:GetAttribute("AutoRollRules"))==o.canon(cq)then o.fails=0 return end
if not Bj and y()-o.sentAt<4 then return end local sJ=ah:FindFirstChild("Remotes")local sK=sJ and sJ:FindFirstChild("AutoRollAction")
if not sK then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()sK:FireServer("Rules",cq)end)D.replaying=false d.ARrules=cq
local g7,g8=0,0 for Gu in(cq:match("butters:([^;]*)")or""):gmatch("[^,]+")do g7=g7+1 end for Gv in(cq:match("crates:([^;]*)")or""):gmatch("[^,]+")do g8=g8+1 end
local sL=g7 .."/"..g8 if o.told~=sL then o.told=sL A(("auto roll now stops on %d butters and %d crates"):format(g7,g8))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if d.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aN={}if d.AutoIndex then aN[#aN+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if d.Best==4 then local eI=0 for Gw in pairs(o.best)do eI=eI+1 end
aN[#aN+1]=eI==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eI,eI==1 and""or"s")
elseif(d.Best or 0)>0 and o.order[1]then aN[#aN+1]="best: "..ak(o.order[1].k)end if d.BestCrate and o.bestCrateName then aN[#aN+1]="crate: "..o.bestCrateName end
if O.got>0 then aN[#aN+1]="shower: "..O.got end o.msg=#aN>0 and table.concat(aN," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(Bk)o.feed[#o.feed+1]=os.date("%H:%M ")..Bk if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(sM,au,g9)if sM~="Effect"then o.feedAdd(tostring(sM)..(au~=nil and(": "..tostring(au):sub(1,80))or""))
return end if au~="ShowerTaken"and au~="GoalPoint"then o.feedAdd(tostring(au))end if au=="Shower"then O.add(g9)return end
if au=="ShowerTaken"then O.gone(g9)return end if au=="ShowerClear"then O.drops={}return end if au=="WaxGlow"then
local lu=type(g9)=="table"and tonumber(g9 .SnapAt)if lu then o.snapAt=lu A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lu-q.srv()),(d.SnapGlaze~=false and d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end au=tostring(au)b2("Admin "..au)if au~="GoalPoint"and y()-(o.heard[au]or-100)>30 then o.heard[au]=y()
A("ADMIN: "..au)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(lv)if type(lv)~="table"or type(lv.Pieces)~="table"then return end
for Gx,aW in pairs(lv.Pieces)do if type(aW)=="table"and aW.Id~=nil and aW.Position~=nil then O.drops[aW.Id]={id=aW.Id,butter=tostring(aW.Butter or"?"),rar=tostring(aW.Rarity or"?"),star=aW.Star==true,
pos=aW.Position,opens=tonumber(aW.OpensAt)or 0,ends=tonumber(aW.ExpiresAt)or 0}end end end function O.gone(eJ)
if type(eJ)~="table"or eJ.Id==nil then return end O.drops[eJ.Id]=nil if tonumber(eJ.UserId)==q.uid then O.mine=eJ.Id end
end function O.pick()local lw=q.srv()local lx,sN for sO,cr in pairs(O.drops)do if lw>=cr.ends-0.3 then O.drops[sO]=nil
elseif lw>=cr.opens-0.2 and(O.tried[sO]or 0)<3 then local sP=(aK(cr.butter)and 1e6 or 0)+(cr.star and 1e5 or 0)+o.rank(cr.rar)*100-(cr.ends-lw)
if not lx or sP>sN then lx,sN=cr,sP end end end return lx end function O.due()return d.Shower and c.running and next(O.drops)~=nil and not ab()and O.pick()~=nil
end function O.grab()local aO,ly=O.pick(),ao()if not(aO and ly)then return end O.tried[aO.id]=(O.tried[aO.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aD(ly,aO.pos+Vector3 .new(0,cK(ly)+0.5,0))ap(function()return O.mine==aO.id or ab()~=nil or not O.drops[aO.id]end,1.5)
if O.mine==aO.id or ab()then O.got,O.drops[aO.id]=O.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aO.butter)),aO.rar,aO.star and" (star)"or""))
elseif not O.drops[aO.id]then O.miss=O.miss+1 end end local eK local function sQ()if c.capHit then if d.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eK(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ao()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bu(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local lz,sR=fo()
local g_=ab()if g_ then local c4=ak(W(g_))if not aK(g_)then local lA=(V.gift and W(V.gift)==W(g_)and y()-V.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c4,lA),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c4,lA),"bad"end return"sell",("selling %s (%s)"):format(c4,lA),"warn"
end if lz<1 then return nil,("holding %s - 0 free stations"):format(c4),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c4),"wait"end
return"place",("waxing %s (%d free)"):format(c4,lz),"ok"end c.holding=false if d.Crates and not e.waiting and y()-(e.scanAt or 0)>1 and y()>(e.quietUntil or 0)then
e.scanAt=y()local lB=c.plot:FindFirstChild("CrateStand")if lB then for Gy,eL in ipairs(lB:GetDescendants())do
if eL:IsA("ProximityPrompt")and eL.Enabled and jo(eL)then local bk=eL.ObjectText if bk==""then bk=cD(lB,"TitleLabel")or""end
if bk~=""and L.wanted(bk)then local Bl=fk(bk):gsub("crate$","")local sS for sT in pairs(ad.members)do if fk(sT)==Bl then sS=sT end end
e.waiting,e.at,e.title,e.prompt=true,y(),bk,eL e.data={name=(bk:gsub("%s","")),rarity=sS,title=bk}A(bk.." found waiting on your stand")
end break end end end end local sU=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and sU then
local aX=e.title if y()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aX),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=y()+120,0 A("could not press the "..aX.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aX),"bad"end if y()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aX),"bad"
end if e.byYou and y()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aX,math.ceil(60-(y()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aX),"ok"end if e.at and y()-e.at>e.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aX,math.floor(e.GIVEUP/60)),"bad"
end if e.summonFails>=3 then if y()-e.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aX,
math.ceil(45-(y()-e.lastFail))),"bad"end e.summonFails,e.nearFails,e.prompt=0,0,nil A("trying the "..aX.." again")
end if y()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aX),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aX,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not sU then local sV=e.title..tostring(e.rolledAt)if e.told~=sV then e.told=sV A(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and y()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if lz<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(sR,sR),"wait"
end local lC=nv()if not lC then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c5=b1()
if c5 and oV(c5 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(c5 .name),"idle"end
if y()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c5 .name),"bad"end if not pd()then return nil,("%s rolled - waiting for it to land on the stand"):format(c5 .name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c5 .name),"ok"end local bI=i6()if bI.state~="match"then
c.matchSince=nil if bI.state=="skip"and not lC.Enabled then return nil,bI.text.." (sold out)","idle"end return nil,bI.text,bI.level
end if not lC.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eM=y()if eM<c.noCashUntil then
local sW,Bm=dJ()if sW then return nil,("cash short: have $%s, price ~$%s"):format(aL(sW),aL(Bm)),"bad"end return nil,(dJ()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aL(a8()),math.ceil(c.noCashUntil-eM)),dJ()and"bad"or"wait"end if eM-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eM local sX=eM-c.matchSince if sX<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bI.shown,sX),"ok"end
return"buy",("buying %s via %s"):format(bI.shown,bI.src),"ok"end j.DEPTH=11 function j.pinTick()local sY=j.hold
if not sY then return end local lD=H.Character local lE=lD and lD:FindFirstChild("HumanoidRootPart")if not lE then return end
lE.CFrame=sY lE.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Gz,ha in ipairs(lD:GetChildren())do if ha:IsA("BasePart")and ha.CanCollide then j.noclip[ha]=true ha.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(Bn,sZ)j.hold=Bn if sZ then j.surface=sZ end end function j.unpin(Bo)
if not j.hold then return end j.hold=nil for s0 in pairs(j.noclip)do pcall(function()if s0 .Parent then s0 .CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local s1=ao()if s1 and j.surface and not Bo then aD(s1,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bl,s2=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ao()
if not(bl and bl:IsA("BasePart")and s2)then return nil end local s3=nk()or bl.Position local hb=Vector3 .new(s3 .X-bl.Position.X,0,s3 .Z-bl.Position.Z)
hb=hb.Magnitude>0.1 and hb.Unit or Vector3 .new(0,0,1)local hc=bl.Position+hb*6 local s4=f0(hc.X,bl.Position.Y,hc.Z,{bl})
return CFrame.new(hc.X,(s4 and s4 .Y or bl.Position.Y)+cK(s2),hc.Z)end function j.ground(Bp,s5,Bq)local lF,lG={H.Character},nil
for GA=1,12 do local lH=RaycastParams.new()lH.FilterType=Enum.RaycastFilterType.Exclude lH.FilterDescendantsInstances=lF
local hd=as:Raycast(Vector3 .new(Bp,s5,Bq),Vector3 .new(0,-2000,0),lH)if not hd then break end lG,s5=hd,hd.Position.Y-0.05
lF[#lF+1]=hd.Instance end return lG and lG.Position.Y end function j.parkHome()local lI=j.home()if not lI then return false end
local c6=lI.Position local Br=j.ground(c6 .X,c6 .Y+300,c6 .Z)or(c6 .Y-3)j.pin(CFrame.new(c6 .X,Br-8,c6 .Z),lI)
return true end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}
function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end function j.setGhost(he)d.Ghost,d.GhostHelps=he==2,he==1
if he<2 then task.spawn(function()while c.busy do af(0.1)end if j.ghostMode()<2 and j.hold and not E.home then pcall(j.unpin)end
end)end j.paintGhost()A("ghost: "..j.GHOST[he][1]:sub(8):lower())end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end
function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end local Bs=ao()if not Bs or J.seat()then return end
j.parkHome()end J.n,J.fails,J.nextAt,J.msg,J.lost=0,0,0,"no campfire right now",0 function J.seat()local s6=H.Character
local s7=s6 and s6:FindFirstChildOfClass("Humanoid")local lJ=s7 and s7 .SeatPart return(lJ and lJ.Name=="LogSeat")and lJ or nil
end function J.due()if not(d.Campfire and c.running)or y()<J.nextAt then return false end local Bt=as:FindFirstChild("NightSeats")
if not Bt then if J.wasOn then J.wasOn,J.fails,J.lost=false,0,0 end J.msg="no campfire (comes with weather events)"
return false end J.wasOn=true if J.seat()then J.sitAt=J.sitAt or y()J.msg=("sitting at the campfire: +%s%% cash"):format(tostring(H:GetAttribute("CampfireBoost")or"?"))
return false end if J.sitAt then J.lost,J.sitAt=J.lost+1,nil if J.lost>=4 then J.nextAt,J.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(J.msg)return false end end return true end function J.sit()local s8,hf=as:FindFirstChild("NightSeats"),ao()
if not s8 or not hf then return end local s9,c7=hf.HumanoidRootPart.Position,{}for GB,hg in ipairs(s8:GetChildren())do
local s_=hg:IsA("Seat")and hg.Occupant==nil and hg:FindFirstChildOfClass("ProximityPrompt")if s_ then c7[#c7+1]={st=hg,p=s_}end
end if#c7==0 then J.nextAt,J.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(c7,function(Bu,Bv)return(Bu.st.Position-s9).Magnitude<(Bv.st.Position-s9).Magnitude end)
local Bw,Bx=c7[1].st,c7[1].p j.unpin(true)local c8=Bw.CFrame aD(hf,c8 .Position+c8 .LookVector*2+Vector3 .new(0,2.5,0),c8 .Position)
af(0.25)local By=dN(Bx,function()return J.seat()~=nil end)if not By then aD(hf,c8 .Position+Vector3 .new(0,2,0),c8 .Position+c8 .LookVector)
ap(function()return J.seat()~=nil end,1.5)end if J.seat()then J.n,J.fails,J.sitAt=J.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(H:GetAttribute("CampfireBoost")or"?")))
else J.fails=J.fails+1 J.nextAt=y()+(J.fails>=3 and 60 or 5)J.msg="could not sit at the campfire"..(J.fails>=3 and" - trying again in a minute"or"")
if J.fails<=3 then A(J.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local lK=ah:FindFirstChild("Remotes")if not lK then return end local eN,lL,c9=0,0,{}
local Bz,ta=pcall(function()return lK.ClanRequest:InvokeServer("state")end)local tb=Bz and type(ta)=="table"and ta.tasks
for GC,bJ in ipairs(tb and tb.list or{})do if not bJ.done and bJ.kind=="pull"then eN=math.max(eN,(bJ.goal or 0)-(bJ.progress or 0))end
if not bJ.done then c9[#c9+1]=("%s %d/%d"):format(tostring(bJ.text),bJ.progress or 0,bJ.goal or 0)end end F.events={}
for GD,c_ in ipairs(lK:GetChildren())do if c_:IsA("RemoteFunction")and c_.Name:match("^%u%a+Action$")and c_.Name~="CrateAction"and c_.Name~="AutoRollAction"then
local BA,eO=pcall(function()return c_:InvokeServer("state")end)if BA and type(eO)=="table"and eO.live==true and type(eO.quests)=="table"then
F.events[#F.events+1]={r=c_,st=eO}for GE,aP in ipairs(eO.quests)do if not aP.done and aP.kind=="pull"then eN=math.max(eN,(aP.goal or 0)-(aP.progress or 0))end
if not aP.done and aP.kind=="collect"then lL=math.max(lL,(aP.goal or 0)-(aP.progress or 0))end if not aP.done then c9[#c9+1]=("%s %d/%d"):format(tostring(aP.text),aP.progress or 0,aP.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eN,lL F.msg=#c9>0 and("open: "..table.concat(c9,", "))or"all quests done for today"
end function F.claim()for GF,eP in ipairs(F.events)do local tc=eP.r.Name:gsub("Action$","")for GG,da in ipairs(eP.st.quests)do
if da.done and not da.claimed then local BB,td=pcall(function()return eP.r:InvokeServer("claimQuest",da.id)end)
if BB and not(type(td)=="table"and td.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(tc,tostring(da.text),tostring(da.points or da.treats or"?")))
end af(0.4)end end if eP.st.bonusReady==true then local BC=pcall(function()return eP.r:InvokeServer("claimBonus")end)
if BC then A(("CLAIMED %s daily quest bonus"):format(tc))end af(0.4)end end end function F.tick()if not(d.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return d.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local te=c.plot and c.plot:FindFirstChild("Lever")
local lM=te and te:FindFirstChild("Wheel")return lM and lM:FindFirstChildWhichIsA("ProximityPrompt"),lM end function F.resume(BD)
F.arPaused=false if F.arWas then F.arWas=false d.AutoRoll=true task.spawn(D.apply,BD)end end function F.pull()
local hh,lN=F.lever()if not hh or not lN or not lN:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hh.Enabled then F.nextAt=y()+1 return end b6(lN,hh)F.asked=nil oK(hh)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
af(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bK,BE)local lO=bK:GetAttribute("PourOwner")
if type(lO)~="number"or lO==q.uid or not bK:GetAttribute("HasSquishy")then return false end if bK:GetAttribute("PourLong")~=true or bK:GetAttribute("PourFull")==true then return false end
local lP=bK:GetAttribute("PourId")if lP==nil or E.skip[lP]then return false end local tf,lQ,BF=bK:GetAttribute("Helpers"),0,tostring(q.uid)
if type(tf)=="string"then for BG in tf:gmatch("[^,%s]+")do lQ=lQ+1 if BG==BF then return false end end end if lQ>=6 then return false end
local hi=z.left(bK)if not hi then local th=tonumber(bK:GetAttribute("PourEnd"))hi=th and(th-BE)end if not hi or hi<=75 then return false end
local lR=game:GetService("Players"):GetPlayerByUserId(lO)if not lR or lR:GetAttribute("WaxHelpOff")==true then return false end
return true,lR,lP end function E.list()local lS,BH={},q.srv()local ti=as:FindFirstChild("Plots")for GH,tj in ipairs(ti and ti:GetChildren()or{})do
local tk=tj~=c.plot and tj:FindFirstChild("WaxStations")for GI,lT in ipairs(tk and tk:GetChildren()or{})do local BI,BJ,BK=E.can(lT,BH)
local lU=BI and lT:FindFirstChild("SquishyPlaceHolder")if lU and lU:IsA("BasePart")then lS[#lS+1]={st=lT,p=BJ,id=BK,part=lU}end
end end return lS end function E.due()return d.Help and c.running and y()>=E.nextAt end function E.skipIt(tl,tm)
E.skip[tl],E.skipN=tm,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[tl]=tm},1,{}end end function E.goHome()
local hj,bL=ao(),E.home E.home=nil if not(hj and bL)then return end if d.Ghost and not J.seat()then j.unpin(true)
if not j.parkHome()then pcall(aD,hj,bL.Position,bL.Position+bL.LookVector)end elseif j.hold or(hj.HumanoidRootPart.Position-bL.Position).Magnitude>20 then
j.unpin(true)pcall(aD,hj,bL.Position,bL.Position+bL.LookVector)end end function E.step()local lV,eQ=E.list(),ao()
if#lV==0 or not eQ then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local tn=eQ.HumanoidRootPart local to=tn.Position table.sort(lV,function(BL,BM)return(BL.part.Position-to).Magnitude<(BM.part.Position-to).Magnitude end)
local aY=lV[1]E.home=E.home or(j.hold and j.surface)or tn.CFrame local bM=aY.part local eR=(bM.Position+aY.st:GetPivot().Position)/2
local hk=E.tries[aY.id]or 0 if(d.Ghost or d.GhostHelps)and hk==0 and not J.seat()then j.pin(bM.CFrame,E.home)
else j.unpin(true)local lW=hk==0 and f0(eR.X,bM.Position.Y,eR.Z,{bM})if lW and math.abs(lW.Y-bM.Position.Y)<8 then
aD(eQ,Vector3 .new(eR.X,lW.Y+cK(eQ),eR.Z),bM.Position)else aD(eQ,bM.Position+Vector3 .new(0,bM.Size.Y/2+3,0),eR)
end end af(0.3)local eS=ah:FindFirstChild("Remotes")eS=eS and eS:FindFirstChild("ClanRequest")if not eS then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hl,bm=pcall(function()return eS:InvokeServer("help",aY.st:GetAttribute("PourOwner"),tonumber(aY.st.Name))end)
if hl and type(bm)=="table"and bm.ok then E.n,E.fails=E.n+1,0 E.skipIt(aY.id,"helped")A(("HELPED %s's wax (station %s)"):format(aY.p.DisplayName,aY.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hl and type(bm)=="table"and tostring(bm.reason or""):lower():find("walk up",1,true)and hk<2 then
E.tries[aY.id]=hk+1 E.nextAt=y()+0.3 elseif hl and type(bm)=="table"and tostring(bm.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local tp=(hl and type(bm)=="table"and tostring(bm.reason or"refused"))or("error: "..tostring(bm))
E.skipIt(aY.id,tp)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aY.p.DisplayName,tp))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bn)if not d.HelpGuild or type(bn)~="table"or bn.p~="help"or bn.mine or bn.u==q.uid or not bn.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eT=ah:FindFirstChild("Remotes")
eT=eT and eT:FindFirstChild("ClanRequest")if not eT then return end local tq,eU=pcall(function()return eT:InvokeServer("callHelp",bn.u)end)
local tr=tostring(bn.n or bn.un or bn.u)if tq and type(eU)=="table"and eU.ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(tr))
else A(("guild call from %s: %s"):format(tr,(tq and type(eU)=="table"and tostring(eU.reason or"refused"))or tostring(eU)))
end end)end local function ar(BN,ts,...)if c.busy then return end c.busy,c.busyText=true,BN if j.hold and ts~=E.step then pcall(j.unpin)end
local BO,tt=pcall(ts,...)c.busy,c.busyText=false,""if not BO and tt~=ih then A("ERR "..tostring(tt))end end local function BP()
local aQ,BQ,BR=sQ()c.reason,c.level=BQ,BR if aQ=="place"then ar("waxing...",z.place)elseif aQ=="crate"then ar("opening crate...",dY,true)
elseif aQ=="cratesmart"then ar("opening crate...",e.smart)elseif aQ=="cratewin"then ar("opening the crate window...",jq)
elseif aQ=="nocrate"then ar("discarding crate...",dY,false)elseif aQ=="cratedrop"then ar("discarding a crate that would not open...",e.drop)
elseif aQ=="sell"then ar("selling...",sc)elseif aQ=="buy"then ar("buying...",oN,false)elseif not aQ and not c.matchSince and O.due()then
ar("grabbing a butter from the admin shower...",O.grab)elseif not aQ and not c.matchSince and J.due()then ar("sitting at the campfire...",J.sit)
elseif not aQ and not c.matchSince and F.pullDue()and not ab()and not(b1()and aK(b1().name))then ar("pulling the lever for a quest...",F.pull)
elseif d.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ar("collecting money...",AU)elseif not aQ and not c.matchSince and E.due()then ar("helping a wax...",E.step)elseif E.home and not d.Help then
ar("coming back...",E.goHome)elseif not c.busy then j.parkTick()end end function eK(hm,BS)if hm==c.running then return end
c.running=hm if not BS then d.AutoStart=hm end if hm then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bu()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bN=fM(am.auto)if type(bN)=="string"then bN=bN:gsub("%s+$","")
if bN~=""then c.autoload=bN local BT=of(bN)A(BT and("loaded config "..bN)or("config "..bN.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local BU={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local lX={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local tu,tv,tw,tx=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if tu and tv and tw and tx then ae.x,ae.b,ae.m,ae.r=tu,tv,tw,tx end end)pcall(function()local ty=Enum.Font.RobotoMono if ty then ae.mono=ty end end)
local function K(BV,BW,BX)local BY,lY=pcall(Instance.new,BV)if not BY then c.uiErrs=c.uiErrs+1 return nil end
for BZ,B0 in pairs(BW)do if not pcall(function()lY[BZ]=B0 end)then c.uiErrs=c.uiErrs+1 end end lY.Parent=BX return lY
end local function ac(B1,B2)K("UICorner",{CornerRadius=UDim.new(0,B2 or 8)},B1)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hn,lZ)if hn and a.shown[hn]~=lZ then a.shown[hn]=lZ hn.Text=lZ end
end function a.stroke(B3,B4,B5)return K("UIStroke",{Color=B4 or l.line,Thickness=1,Transparency=B5 or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},B3)
end function a.grad(B6,B7,B8,B9)local B_,tz=pcall(function()return ColorSequence.new(B7,B8)end)if B_ and tz then return K("UIGradient",{Color=tz,Rotation=B9 or 0},B6)end
end function a.pad(Ca,tA,tB,Cb,Cc)K("UIPadding",{PaddingLeft=UDim.new(0,tA or 0),PaddingTop=UDim.new(0,tB or 0),
PaddingRight=UDim.new(0,Cb or tA or 0),PaddingBottom=UDim.new(0,Cc or tB or 0)},Ca)end function a.list(Cd,Ce,Cf)
return K("UIListLayout",{Padding=UDim.new(0,Ce or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Cf and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Cd)
end function a.ink(l0)local Cg,Ch=pcall(function()return 0.299*l0 .R+0.587*l0 .G+0.114*l0 .B end)return(Cg and Ch>0.55)and l.ink or l.text
end function a.nextIn(tC)local tD=(a.ord[tC]or 0)+1 a.ord[tC]=tD return tD end local l1=H:FindFirstChildOfClass("PlayerGui")or H:WaitForChild("PlayerGui")
local tE=l1:FindFirstChild("SABFarmGui")if tE then tE:Destroy()end local l2=K("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},l1)local T={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local ho=as.CurrentCamera.ViewportSize if ho.X>100 and ho.Y>100 then T.w=math.clamp(math.floor(ho.X*0.48),320,400)
T.h=math.clamp(math.floor(ho.Y*0.86),250,360)end end)a.root=K("Frame",{Name="Root",Size=UDim2 .new(0,T.w,0,T.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},l2)
ac(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local tF=UDim2 .new(1,0,1,0)
local function Ci(tG,tH)return UDim2 .new(tG,0,0,0),UDim2 .new(tH,(tG+tH>0.99)and 0 or-4,1,0)end local function ai(Cj,Ck,eV,Cl,Cm,Cn)
local l3=K("TextButton",{Text=Ck,Position=Cm,Size=Cn,BackgroundColor3=eV,BorderSizePixel=0,Font=ae.b,TextSize=Cl,TextColor3=a.ink(eV),AutoButtonColor=true},Cj)
ac(l3,8)if eV==l.panel2 or eV==l.raise or eV==l.panel then a.stroke(l3,l.line,0.4)end return l3 end local function hp(Co,Cp,Cq,Cr,Cs)
local hq=K("TextBox",{Text=Cp,PlaceholderText=Cq,Position=Cr,Size=Cs,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Co)ac(hq,8)a.stroke(hq,l.line,0)a.pad(hq,9,0,6,0)
return hq end local hr=as.CurrentCamera local function Ct()local Cu,hs=pcall(function()return hr and hr.ViewportSize end)
if Cu and hs and hs.X>50 and hs.Y>50 then return hs end end local function bO(eW)local l4=Ct()if not(l4 and eW and eW.Parent)then return end
local Cv=pcall(function()local ht,tI=eW.AbsolutePosition,eW.AbsoluteSize local l5=70 local tJ=math.clamp(ht.X,l5-tI.X,l4 .X-l5)
local tK=math.clamp(ht.Y,0,l4 .Y-math.min(tI.Y,l5))if math.abs(tJ-ht.X)>0.5 or math.abs(tK-ht.Y)>0.5 then eW.Position=UDim2 .new(0,math.floor(tJ),0,math.floor(tK))
end end)return Cv end local function hu(Cw)local Cx,l6=pcall(function()return Cw.AbsolutePosition end)if Cx and l6 then return{math.floor(l6 .X),math.floor(l6 .Y)}end
end local db={}c.dragMoved={}local function tL(eX,tM,l7)Q(eX.InputBegan:Connect(function(dc)if dc.UserInputType~=Enum.UserInputType.MouseButton1 and dc.UserInputType~=Enum.UserInputType.Touch then return end
local l8={start=dc.Position,from=tM.Position,moved=0,target=tM,input=dc,onDrop=l7}db[eX],c.dragMoved[eX]=l8,0
local l9 l9=dc.Changed:Connect(function()if dc.UserInputState==Enum.UserInputState.End and db[eX]==l8 then db[eX]=nil
if l9 then l9:Disconnect()end if l7 then l7(l8 .moved)end end end)end))end Q(m4 .InputChanged:Connect(function(hv)
if hv.UserInputType~=Enum.UserInputType.MouseMovement and hv.UserInputType~=Enum.UserInputType.Touch then return end
for Cy,a6 in pairs(db)do local l_=a6 .target if l_ and l_.Parent then local tN,tO=hv.Position.X-a6 .start.X,hv.Position.Y-a6 .start.Y
a6 .moved=math.max(a6 .moved,math.abs(tN)+math.abs(tO))c.dragMoved[Cy]=a6 .moved l_.Position=UDim2 .new(a6 .from.X.Scale,a6 .from.X.Offset+tN,a6 .from.Y.Scale,a6 .from.Y.Offset+tO)
end end end))Q(m4 .InputEnded:Connect(function(hw)if hw.UserInputType~=Enum.UserInputType.MouseButton1 and hw.UserInputType~=Enum.UserInputType.Touch then return end
for Cz,hx in pairs(db)do if hx.input==hw or hw.UserInputType==Enum.UserInputType.MouseButton1 then db[Cz]=nil
if hx.onDrop then hx.onDrop(hx.moved)end end end end))local function P(CA,CB,CC,CD,CE,CG,CH)return K("TextLabel",{Text=CB,Position=CG or UDim2 .new(0,0,0,0),Size=CH or tF,BackgroundTransparency=1,
Font=CE and ae.b or ae.m,TextSize=CC,TextColor3=CD,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},CA)
end function a.row(tP,CI)return K("Frame",{Size=UDim2 .new(1,0,0,CI),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(tP)},tP)end function a.card(tQ,tR,tS)local dd=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(tQ)},tQ)ac(dd,11)a.stroke(dd,l.line,0.25)a.list(dd,5)a.pad(dd,8,8,8,9)
if tR then local ma=a.row(dd,14)K("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},ma)P(ma,tR:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if tS then local CJ=P(ma,tS,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
CJ.TextXAlignment=Enum.TextXAlignment.Right end end return dd end function a.heading(CK,CL,mb)local mc=a.row(CK,mb and 34 or 22)
P(mc,CL,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if mb then P(mc,mb,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mc end function a.note(CM,CN,CO)local tT=P(a.row(CM,CO or 28),CN,9,l.dim,false)tT.TextYAlignment=Enum.TextYAlignment.Top
return tT end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(md)local aI=a.sw[md]if not aI then return end
local de=tostring(md.Text or""):match(":%s*(.-)%s*$")or""local bP=de~=""and not a.OFF[de]local me=not aI.chips and(de=="ON"or de=="OFF")
aI.pill.Visible,aI.chip.Visible=me,not me if me then aI.pill.BackgroundColor3=bP and l.accent or l.panel2 aI.knob.Position=bP and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aI.knob.BackgroundColor3=bP and l.white or l.dim else aI.chip.Text=de~=""and de or"-"aI.chip.BackgroundColor3=bP and l.accent or l.panel2
aI.chip.TextColor3=bP and l.ink or l.dim end md.BackgroundColor3=bP and l.lit or l.raise if aI.edge then aI.edge.Color=bP and l.accent or l.line aI.edge.Transparency=bP and 0.55 or 0.45 end
end function a.switch(tU,CP,CQ,eY)local aZ=K("TextButton",{Name="Switch",Text=CP,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,eY and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(tU)},tU)
ac(aZ,9)local az={edge=a.stroke(aZ,l.line,0.45)}az.title=P(aZ,CQ,11,l.text,true,UDim2 .new(0,10,0,eY and 4 or 0),UDim2 .new(1,-100,0,eY and 15 or 28))
az.title.TextWrapped,az.title.TextTruncate=false,Enum.TextTruncate.AtEnd if eY then az.sub=P(aZ,eY,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
az.sub.TextWrapped,az.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end az.pill=K("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},aZ)ac(az.pill,9)az.knob=K("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},az.pill)ac(az.knob,7)az.chip=K("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},aZ)
ac(az.chip,9)a.pad(az.chip,10,0,10,0)a.sw[aZ]=az Q(aZ:GetPropertyChangedSignal("Text"):Connect(function()a.skin(aZ)end))
a.skin(aZ)return aZ end function a.chips(mf)if a.sw[mf]then a.sw[mf].chips=true a.skin(mf)end end function a.line(CS,CT)
local tV=a.row(CS,15)local tW=K("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=CT or l.dim,
BorderSizePixel=0},tV)ac(tW,3)local mg=P(tV,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mg.TextWrapped,mg.TextTruncate=false,Enum.TextTruncate.AtEnd
return mg,tW end function a.grow(tX,CU,CV)local CW=K("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=CU or 10,TextColor3=CV or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(tX)},tX)
return CW end function a.actions(CX,tY)local CY=a.row(CX,28)local tZ,mh={},#tY for eZ,t0 in ipairs(tY)do tZ[eZ]=ai(CY,t0[1],t0[2]or l.panel2,10,UDim2 .new((eZ-1)/mh,eZ>1 and 3 or 0,0,0),
UDim2 .new(1/mh,(eZ>1 and-3 or 0)+(eZ<mh and-3 or 0),1,0))end return table.unpack(tZ)end local function M(cs,hy,CZ,C0)
a.put(cs,hy and CZ or C0)if not a.sw[cs]and a.lit[cs]~=hy then a.lit[cs]=hy cs.BackgroundColor3=hy and l.accent or l.panel2
cs.TextColor3=a.ink(cs.BackgroundColor3)end end a.title=K("Frame",{Size=UDim2 .new(1,0,0,T.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
K("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0},a.title)
do local mi=K("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ac(mi,8)a.grad(mi,l.accent,l.accent2,45)local t1=P(mi,"C",16,l.ink,true)t1 .Font,t1 .TextXAlignment=ae.x,Enum.TextXAlignment.Center
local C1=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))C1 .Font=ae.x P(a.title,"butter farm  "..bW,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
end a.pill=K("Frame",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-66,0.5,0),Size=UDim2 .new(0,78,0,22),
BackgroundColor3=l.raise,BorderSizePixel=0},a.title)ac(a.pill,11)a.pillEdge=a.stroke(a.pill,l.line,0.2)a.dot=K("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(0,9,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.pill)
ac(a.dot,4)a.runL=P(a.pill,"STOPPED",9,l.dim,true,UDim2 .new(0,22,0,0),UDim2 .new(1,-26,1,0))a.minB=ai(a.title,"-",l.raise,14,UDim2 .new(1,-60,0.5,-12),UDim2 .new(0,24,0,24))
a.xB=ai(a.title,"X",l.raise,11,UDim2 .new(1,-32,0.5,-12),UDim2 .new(0,24,0,24))a.xB.TextColor3=l.bad a.strip=K("Frame",{Position=UDim2 .new(0,T.rail+8,0,T.head+6),Size=UDim2 .new(1,-(T.rail+16),0,T.status),
BackgroundColor3=l.raise,BorderSizePixel=0},a.root)ac(a.strip,9)a.stroke(a.strip,l.line,0.3)a.bar=K("Frame",{Size=UDim2 .new(0,3,1,-12),Position=UDim2 .new(0,7,0,6),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
ac(a.bar,2)a.reason=P(a.strip,"starting",10,l.text,false,UDim2 .new(0,16,0,1),UDim2 .new(1,-22,1,-2))a.reason.TextTruncate=Enum.TextTruncate.AtEnd
a.tabs=K("Frame",{Position=UDim2 .new(0,0,0,T.head),Size=UDim2 .new(0,T.rail,1,-T.head),BackgroundColor3=l.panel,
BorderSizePixel=0},a.root)a.railLine=K("Frame",{Size=UDim2 .new(0,1,1,-T.head),Position=UDim2 .new(0,T.rail-1,0,T.head),BackgroundColor3=l.line,
BorderSizePixel=0},a.root)do local C2=a.list(a.tabs,3)pcall(function()C2 .HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((T.h-T.head-12)/9)-3,22,34)local function bo(C3,C4,C5)
local hz=K("TextButton",{Text=C3,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ac(hz,9)local t2=K("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hz)ac(t2,2)a.tabsAll[#a.tabsAll+1]={b=hz,bar=t2,name=C4,sub=C5}return hz end
a.tabFarm=bo("🏠","Home","what the farm is doing")a.tabRun=bo("🌾","Farm","the buy - wax - collect loop")a.tabBut=bo("🧈","Butters","what gets bought and waxed")
a.tabCrt=bo("📦","Crates","which crates get opened")a.tabPet=bo("🐾","Pets","adopt, wish, fuse")a.tabTeam=bo("👥","Teams","the right pets at the right moment")
a.tabSrv=bo("🤝","Server","helping, campfire, ghost")a.tabAdm=bo("⚡","Admin","admin abuse and its boosts")a.tabSet=bo("⚙","Settings","configs, startup, performance")
local function bp()local mj=K("ScrollingFrame",{Position=UDim2 .new(0,T.rail,0,T.head+T.status+10),Size=UDim2 .new(1,-T.rail,1,-(T.head+T.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mj,8)a.pad(mj,8,2,10,12)return mj end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bp(),bp(),bp(),bp(),bp(),bp(),bp(),bp(),bp()a.farm.Visible=true
do local e0=a.farm local t3=a.row(e0,34)a.startB=ai(t3,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(t3,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local C6=a.row(e0,44)local function e1(t4,C7,t5)local hA=K("Frame",{Position=UDim2 .new((t4-1)/t5,t4>1 and 2 or 0,0,0),Size=UDim2 .new(1/t5,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},C6)ac(hA,9)a.stroke(hA,l.line,0.3)local hB=P(hA,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hB.Font,hB.TextXAlignment,hB.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local C8=P(hA,C7,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
C8 .TextXAlignment=Enum.TextXAlignment.Center return hB end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e1(1,"BOUGHT",5),e1(2,"WAXED",5),e1(3,"SOLD",5),e1(4,"MONEY",5),e1(5,"FREE",5)
local t6=a.card(e0,"Right now")a.info=P(a.row(t6,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(t6,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local e2=a.card(e0,"Systems")
a.helpL=a.line(e2,l.info)a.campL=a.line(e2,l.accent2)a.questL=a.line(e2,l.good)a.arL=a.line(e2,l.accent)a.ixL=a.line(e2,lX.Dotonbori)
local t7=a.card(e0,"Activity")a.log=K("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(t7)},t7)
ac(a.log,7)a.pad(a.log,7,5,7,5)end local function GJ(C9,C_)return a.row(C_ or a.farm,C9)end local al do local mk=a.run
a.heading(mk,"Farm","buy what rolls, wax it, collect the cash")local e3=a.card(mk,"Loop")a.colT=a.switch(e3,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(e3,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hp(al,tostring(d.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(e3,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(e3,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(e3,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local ml=a.card(mk,"By hand")
a.buyB,a.plB=a.actions(ml,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(ml,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(ml,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,Ci(0,0.55))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.55,6,0,0),UDim2 .new(0.45,-6,1,0))
end do local hC=a.but a.heading(hC,"Butters","what gets bought and waxed")local t8=a.card(hC,"Strategy")a.ixT=a.switch(t8,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(t8,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hC)},hC)a.list(a.butList,5)end do local hD=a.crt a.heading(hD,"Crates","only ticked crates are opened")
local t9=a.card(hD,"Opening")a.crateT=a.switch(t9,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(t9,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(hD)},hD)a.list(a.crtList,5)end do local hE=a.pet a.heading(hE,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local e4=a.card(hE,"Automatic")a.pbT=a.switch(e4,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(e4,"AUTO WISH: OFF","Auto wish","keep wishes going for pets marked WISH")a.pfT=a.switch(e4,"AUTO FUSE: OFF","Auto fuse","copies into Bigs, up to each goal")
a.pInfo=a.grow(e4,10,l.dim)a.note(e4,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hE)},hE)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hF=a.srv a.heading(hF,"Server","other players' waxes, the campfire, staying out of sight")
local mm=a.card(hF,"Helping")a.helpT=a.switch(mm,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(mm,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mm,l.info)
local t_=a.card(hF,"Campfire")a.campT=a.switch(t_,"CAMPFIRE: OFF","Sit at the campfire","+50% cash per camper, farm keeps going")
a.srvCamp=a.line(t_,l.accent2)local mn=a.card(hF,"Ghost")a.ghostT=a.switch(mn,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(mn,l.dim)a.note(mn,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local e5=a.adm a.heading(e5,"Admin abuse","the show, its boosts and what the farm does in it")local ua=a.card(e5,"When")
a.admBig=P(a.row(ua,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(ua,14),"",10,l.dim,false)local Da=a.card(e5,"Boosts now")
a.admBoost=a.grow(Da,11,l.text)local mo=a.card(e5,"What the farm does")a.shT=a.switch(mo,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(mo,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once: glaze team on")a.admStat=a.line(mo,l.accent)
local ub=a.card(e5,"Show feed")a.admFeed=K("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(ub)},ub)
ac(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local df=a.set a.heading(df,"Settings","kept on your phone, per config")
local hG=a.card(df,"Config")al=a.row(hG,28)a.cfgName=hp(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hG,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hG,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(hG,10,l.dim)local mp=a.card(df,"Starting")a.startT=a.switch(mp,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mp,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(mp,9,l.dim)local mq=a.card(df,"If the game drops me")
a.rejT=a.switch(mq,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(mq,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(mq,9,l.dim)local bq=a.card(df,"Performance")a.pfCalm=a.switch(bq,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bq,"LITE MODE: OFF","Lite mode","labels, sparkles, lighting extras off")a.pfBases=a.switch(bq,"BASES: ALL DRAWN","Bases","stop drawing other bases, or yours too")
a.pfFps=a.switch(bq,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bq,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bq,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bq,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hp(al,tostring(d.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bq,l.good)a.note(bq,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local Db=a.card(df,"About")a.note(Db,"CHURN "..bW.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for GK,Dc in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(Dc)end local uc=K("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},l1)
a.tgRoot=K("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},uc)ac(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=K("TextButton",{Text="C",Size=tF,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=K("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ac(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=K("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ac(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()
local e6=j.ghostMode()if a.ghostT then a.put(a.ghostT,j.GHOST[e6][1])end if a.tgGhost then a.tgGhost.Text=j.GHOST[e6][2]
a.tgGhost.BackgroundColor3=e6==2 and l.accent or(e6==1 and l.warn or l.panel)a.tgGhost.TextColor3=e6>0 and l.ink or l.dim
end end local br={built=false,boxes={},at=0}function a.check(hH,mr)hH.Text=mr and"✓"or""hH.BackgroundColor3=mr and l.accent or l.bg
hH.TextColor3=l.ink local ms=hH.Parent if ms and ms:IsA("TextButton")then ms.BackgroundColor3=mr and l.lit or l.raise end
end local function ud(ue,uf)d.Targets[ue]=uf or nil local ug=br.boxes[ue]if ug then a.check(ug,uf)end end local function mt()
for Dd,De in pairs(br.boxes)do a.check(De,d.Targets[Dd]==true)end end function a.tickBox(Df)local mu=K("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Df)ac(mu,6)
a.stroke(mu,l.line,0)return mu end local e7 local function Dg()local Dh=a.card(a.butList,"Butter list")local mv=a.row(Dh,26)
a.butInfo=P(mv,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local Di=ai(mv,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Dj=ai(mv,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))Di.MouseButton1Click:Connect(function()
for Dk in pairs(d.Targets)do d.Targets[Dk]=nil end mt()end)Dj.MouseButton1Click:Connect(function()ad.at=0 iS()
e7(true)end)end e7=function(Dl)if not iS()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if br.built and not Dl and br.at==ad.at then return end for GL,hI in ipairs(a.butList:GetChildren())do
if hI:IsA("Frame")or hI:IsA("TextButton")or hI:IsA("TextLabel")then hI:Destroy()end end br.boxes,a.butEmpty={},nil
Dg()for GM,hJ in ipairs(ad.rarOrder)do local mw=lX[hJ]or l.text local ct=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ac(ct,11)a.stroke(ct,mw,0.7)a.list(ct,4)a.pad(ct,7,7,7,8)
local mx=a.row(ct,22)K("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=mw,BorderSizePixel=0},mx)
local Dm=P(mx,hJ:upper(),11,mw,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))Dm.Font=ae.x local Dn=ai(mx,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local Do=hJ Dn.MouseButton1Click:Connect(function()local uh=ad.members[Do]or{}local ui=false for GN,Dp in ipairs(uh)do if not d.Targets[Dp]then ui=true break end end
for GO,Dq in ipairs(uh)do ud(Dq,ui)end end)for GP,my in ipairs(ad.members[hJ]or{})do local hK=K("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(ct)},ct)ac(hK,8)local uj=P(hK,ak(my),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
uj.TextWrapped,uj.TextTruncate=false,Enum.TextTruncate.AtEnd local uk=a.tickBox(hK)br.boxes[my]=uk local ul=my
local function um()ud(ul,not d.Targets[ul])end hK.MouseButton1Click:Connect(um)uk.MouseButton1Click:Connect(um)
end end mt()br.built,br.at=true,ad.at end function L.paint()for Dr,Ds in pairs(L.boxes)do a.check(Ds,d.CrateTicks[Dr]==true)end
if a.crtInfo then local mz,mA=0,0 for GQ in pairs(L.boxes)do mz=mz+1 end for GR,Dt in pairs(d.CrateTicks)do if Dt then mA=mA+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(mz,mA))end if a.crateT then M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for GS,hL in ipairs(a.crtList:GetChildren())do if hL:IsA("Frame")or hL:IsA("TextButton")or hL:IsA("TextLabel")then hL:Destroy()end
end L.boxes={}local mB=a.card(a.crtList,"All of them","worst first")local mC=a.row(mB,26)a.crtInfo=P(mC,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Du=ai(mC,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Dv=ai(mC,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
Q(Du.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))Q(Dv.MouseButton1Click:Connect(function()L.build()end))
for GT,bs in ipairs(L.list())do local uo=lX[bs.rar or""]or l.text local dg=K("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(mB)},mB)ac(dg,8)K("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=uo,BorderSizePixel=0},dg)
local up=P(dg,(bs.title or bs.name)..(bs.guess and"  (?)"or""),11,uo,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
up.TextWrapped,up.TextTruncate=false,Enum.TextTruncate.AtEnd local Dw=P(dg,bs.price and("$"..aL(bs.price))or(bs.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Dw.TextXAlignment=Enum.TextXAlignment.Right local uq=a.tickBox(dg)L.boxes[bs.k]=uq local ur=bs.k local function us()
d.CrateTicks[ur]=(not d.CrateTicks[ur])or nil L.paint()end Q(dg.MouseButton1Click:Connect(us))Q(uq.MouseButton1Click:Connect(us))
end L.built=L.at L.paint()end local ut="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a0(cu)ut=cu for Dx,mD in ipairs(a.tabKeys)do a[mD].Visible=(mD==cu)local hM=a.tabsAll[Dx]if hM then
local mE=mD==cu hM.b.BackgroundTransparency,hM.b.TextTransparency,hM.bar.Visible=mE and 0 or 1,mE and 0 or 0.45,mE
end end if cu=="pet"and not q.built then pcall(q.build)end if cu=="team"and not z.built then pcall(z.build)end
if cu=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cu=="but"then e7(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(mF,uu,uv,uw)if uw then mF.Text=uw end mF.BackgroundColor3=uu and uv or l.bg mF.TextColor3=uu and a.ink(uv)or l.dim
end function q.paintRow(ux)local cv=q.rows and q.rows[ux]if not cv then return end local cw=d.Pets[ux]or{}local e8=tonumber(cw.f)or 0
a.flag(cv.b,cw.b,l.good)a.flag(cv.g,cw.g,l.accent,cw.g and"BIG"or"ANY")a.flag(cv.w,cw.w,l.warn)a.flag(cv.f,e8>0,l.good,e8>=7 and"7 BIG/HUGE"or(e8>0 and(e8 .." BIG")or"FUSE"))
if cv.row then cv.row.BackgroundColor3=(cw.b or cw.w or e8>0)and l.lit or l.raise end end function q.flag(mG,hN)
local a7=d.Pets[mG]or{}if hN=="f"then local Dy={[0]=1,[1]=2,[2]=3,[3]=7}local uy=Dy[tonumber(a7 .f)or 0]or 0 a7 .f=uy>0 and uy or nil
elseif a7[hN]then a7[hN]=nil else a7[hN]=true end d.Pets[mG]=(a7 .b or a7 .g or a7 .w or a7 .f)and a7 or nil q.paintRow(mG)
end function q.paintAll()for Dz in pairs(q.rows or{})do q.paintRow(Dz)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local uz=q.wishes()local e9=q.data()for hO,hP in pairs(q.rows)do hP.name.Text=q.nice(hO)..(uz[hO]and("   * wish %dm"):format(math.ceil(uz[hO]/60))or"")
local uA=C.status(hO,e9)hP.desc.Text=uA and(uA.." | "..hP.boostText)or hP.boostText end local uB=tonumber(H:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(e9 and#(e9 .pets or{})or 0,e9 and tonumber(e9 .maxOwned)or 60,
aL(q.money()),uB>0 and(" | free wishes "..uB)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local hQ=q.info()for GU,hR in ipairs(a.petList:GetChildren())do if hR:IsA("Frame")or hR:IsA("TextLabel")or hR:IsA("TextButton")then hR:Destroy()end
end q.rows={}if not hQ then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dh={}for GV,uC in ipairs(q.order())do local mH=hQ.Pets[uC].rarity or"?"dh[mH]=dh[mH]or{}
table.insert(dh[mH],uC)end local di={}for GW,uD in ipairs(hQ.Rarities or{})do if dh[uD]then di[#di+1]=uD end end
for uE in pairs(dh)do if not table.find(di,uE)then di[#di+1]=uE end end for GX,mI in ipairs(di)do local hS=q.RC[mI]or l.text
local cx=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ac(cx,11)a.stroke(cx,hS,0.7)a.list(cx,4)a.pad(cx,7,7,7,8)local uF=a.row(cx,18)K("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=hS,BorderSizePixel=0},uF)
local DA=P(uF,mI:upper(),11,hS,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))DA.Font=ae.x for GY,hT in ipairs(dh[mI])do
local e_=K("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cx)},cx)
ac(e_,8)local mJ=P(e_,q.nice(hT),11,hS,true,UDim2 .new(0,9,0,3),UDim2 .new(1,-172,0,17))mJ.TextWrapped,mJ.TextTruncate=false,Enum.TextTruncate.AtEnd
local DB,DC=pcall(function()return hQ.describe(hT)end)local uG=DB and tostring(DC)or""local mK=P(e_,uG,9,l.dim,false,UDim2 .new(0,9,0,20),UDim2 .new(1,-172,0,16))
mK.TextWrapped,mK.TextTruncate=false,Enum.TextTruncate.AtEnd local function hU(DD,DE,DF)local uH=ai(e_,DD,l.bg,8,UDim2 .new(1,DE,0.5,-11),UDim2 .new(0,DF,0,22))
uH.AutoButtonColor=true return uH end local uI,uJ,uK,uL=hU("BUY",-164,30),hU("ANY",-131,30),hU("WISH",-98,34),hU("FUSE",-61,56)
local hV=hT uI.MouseButton1Click:Connect(function()q.flag(hV,"b")end)uJ.MouseButton1Click:Connect(function()q.flag(hV,"g")end)
uK.MouseButton1Click:Connect(function()q.flag(hV,"w")end)uL.MouseButton1Click:Connect(function()q.flag(hV,"f")end)
q.rows[hT]={b=uI,g=uJ,w=uK,f=uL,name=mJ,desc=mK,boostText=uG,row=e_}end end q.built=true q.paintAll()end function j.paint()
M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.Calm then j.calm(true)end if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end Q(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
Q(a.pfCalm.MouseButton1Click:Connect(function()j.calm(not d.Calm)j.paint()end))Q(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))
Q(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))Q(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))
Q(a.pfFps.MouseButton1Click:Connect(function()local DG=table.find(j.CAPS,d.FpsCap or 0)or 1 local uM=j.CAPS[(DG%#j.CAPS)+1]
if not j.cap(uM)and uM~=0 then A("this executor cannot cap fps")end j.paint()end))Q(a.pfMemSet.MouseButton1Click:Connect(function()
local mL=tonumber(a.pfMem.Text)if mL and mL>=0 then d.MemLimit=math.floor(mL)end j.paint()end))function z.names()
local mM={"(none)"}for GZ,DH in ipairs((z.teams()))do mM[#mM+1]=DH.name end return mM end function z.cycle(mN,DI)
local hW=z.names()local DJ=d[mN]~=""and d[mN]or"(none)"local hX=table.find(hW,DJ)or 1 hX=((hX-1+DI)%#hW)+1 d[mN]=hW[hX]=="(none)"and""or hW[hX]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local mO={}for G0,DK in ipairs((z.teams()))do mO[DK.name]=true end
for DL,uN in pairs(z.pick)do local dj=d[DL]uN.Text=dj==""and"(none)"or(mO[dj]and dj or(dj.." (missing)"))uN.TextColor3=(dj~=""and not mO[dj])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local DM,hY=q.srv(),{}for G1,hZ in ipairs(z.list or{})do hY[#hY+1]=("st %-2s %-22s %9s  helps %d"):format(hZ.st.Name,ak(W(hZ.name)):sub(1,22),z.clock(hZ.ends-DM),hZ.helps)
end a.tmList.Text=#hY>0 and table.concat(hY,"\n")or"no waxes running"end function z.build()for G2,h0 in ipairs(a.teamList:GetChildren())do
if h0:IsA("Frame")or h0:IsA("TextLabel")or h0:IsA("TextButton")then h0:Destroy()end end z.pick={}local h1=a.card(a.teamList,"Automatic")
a.tmT=a.switch(h1,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(h1,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild z.paint()end)a.tmBuildNow=a.actions(h1,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local DN,DO=pcall(C.rebuild,"you asked")if not DN then A("BUILD ERR "..tostring(DO))end end)
end)a.tmInfo=a.grow(h1,10,l.dim)local uO=a.card(a.teamList,"Which team when")local function h2(h3,DP,DQ)local fa=a.row(uO,54)
P(fa,DP,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local uP=P(fa,DQ,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
uP.TextWrapped,uP.TextTruncate=false,Enum.TextTruncate.AtEnd local DR=ai(fa,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local uQ=ai(fa,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local DS=ai(fa,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
DR.MouseButton1Click:Connect(function()z.cycle(h3,-1)end)DS.MouseButton1Click:Connect(function()z.cycle(h3,1)end)
uQ.MouseButton1Click:Connect(function()z.cycle(h3,1)end)z.pick[h3]=uQ end h2("TeamNormal","Normal","the rest of the time: money + luck")
h2("TeamFull","Full","every station busy: money + wax speed")h2("TeamGlaze","Glaze","worn just before a wax finishes")
local h4=a.row(uO,26)P(h4,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=hp(h4,tostring(d.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(h4,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local DT=ai(h4,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
DT.MouseButton1Click:Connect(function()local h5=tonumber(a.tmLead.Text)if h5 and h5>=5 and h5<=600 then d.GlazeLead=math.floor(h5)else a.tmLead.Text=tostring(d.GlazeLead)end
z.paint()end)h2("TeamWax","Wax","while a butter is placed: head starts")local uR=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=K("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(uR)},uR)ac(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local DU=a.card(a.teamList,"How it works")a.note(DU,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function DV()a.secB.Text=tostring(d.Every)M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not E.home then pcall(j.unpin)end end)end
M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eK(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bO(a.root)bO(a.tgRoot)c.lastCollect=y()
mt()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(j.applyAll)end local function DW(uS)task.spawn(function()uS.TextColor3=l.bad
task.wait(0.8)if c.alive then uS.TextColor3=l.text end end)end local function uT()local uU=a.secB.Text:match("^%s*(%d+)%s*$")
local fb=uU and tonumber(uU)if not fb or fb<1 then a.secB.Text=tostring(d.Every)DW(a.secB)A("interval must be a whole number >= 1")
return end if fb==d.Every then return end d.Every,c.lastCollect=fb,y()A("collect every "..fb.."s")end local function N(DX,DY)Q(DX.MouseButton1Click:Connect(DY))end
N(a.secSet,uT)Q(a.secB.FocusLost:Connect(uT))N(a.colT,function()d.Collect,c.lastCollect=not d.Collect,y()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()d.SellJunk=not d.SellJunk M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(ar,"selling...",sc)end)N(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()d.Crates=not d.Crates M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
d.Help=not d.Help E.nextAt,E.msg=0,d.Help and"looking for waxes to help"or"off"M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()d.HelpGuild=not d.HelpGuild M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()d.Quests=not d.Quests F.at=0 M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
d.Campfire=not d.Campfire J.nextAt,J.fails,J.lost=0,0,0 M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,j.cycleGhost)function o.paint()M(a.snapT,d.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
M(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function o.changed(DZ)task.spawn(function()pcall(o.tick)if DZ and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local D0=o.on()d.AutoIndex=not d.AutoIndex o.discAt=-100 o.changed(D0)end)
N(a.bestT,function()local D1=o.on()d.Best=((d.Best or 0)+1)%5 o.stackAt=-100 o.changed(D1)end)N(a.bcT,function()
local D2=o.on()d.BestCrate=not d.BestCrate o.changed(D2)end)N(a.shT,function()d.Shower=not d.Shower o.paint()
end)N(a.snapT,function()d.SnapGlaze=d.SnapGlaze==false o.paint()end)N(a.pbT,function()d.PetBuy=not d.PetBuy q.paintAll()end)
N(a.pwT,function()d.PetWish=not d.PetWish q.paintAll()end)N(a.pfT,function()d.AutoFuse=not d.AutoFuse q.paintAll()end)
function o.admPaint()local bQ=q.srv()local bR pcall(function()o.aac=o.aac or require(ah:FindFirstChild("AdminAbuseClient"))
bR=o.aac:GetState()end)local dk,bS="nothing scheduled","the game has not announced one"if type(bR)=="table"then
local fc,bT,fd=tostring(bR.Phase or""),tonumber(bR.StartsAt),tonumber(bR.EndsAt)if fc=="Countdown"and bT then
dk,bS="starts in "..z.clock(bT-bQ),os.date("%a %H:%M",math.floor(bT)).." your time"elseif fc=="Live"and fd then
dk,bS="LIVE  -  "..z.clock(fd-bQ).." left","the farm is grabbing, waxing and glazing through it"elseif fc~=""and fc~="Idle"and fd and fd>bQ then
dk,bS=fc:lower().."  -  "..z.clock(fd-bQ).." left","after the show"elseif bT and bT>bQ then dk,bS="next: "..os.date("%a %H:%M",math.floor(bT)),"your time"
elseif bT then dk,bS="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(bT)).." your time"end
if type(bR.Kind)=="string"and bR.Kind~=""then bS=bS.."  |  "..bR.Kind end end a.put(a.admBig,dk)a.put(a.admSub,bS)
local dl,mP={},ah:FindFirstChild("AdminShow")if mP then local D3,D4=pcall(function()return mP:GetAttributes()end)
for uV,dm in pairs(D3 and D4 or{})do local h6=type(uV)=="string"and uV:match("^(.-)Mult$")local mQ=h6 and tonumber(mP:GetAttribute(h6 .."Until"))
if h6 and type(dm)=="number"and dm~=1 and dm~=0 and mQ and mQ>bQ then dl[#dl+1]=("%s  x%s   %s left"):format(h6,(dm%1==0)and tostring(dm)or("%.2f"):format(dm),z.clock(mQ-bQ))
end end end table.sort(dl)a.put(a.admBoost,#dl>0 and table.concat(dl,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dl>0 and l.accent or l.dim local h7=0 for G3 in pairs(O.drops)do h7=h7+1 end local uW=o.snapAt and(o.snapAt-bQ)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,h7>0 and(", "..h7 .." falling")or"",
uW and("in "..math.max(0,math.floor(uW)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(ar,"opening crate...",dY,true)end)N(a.padB,function()c.plot=bu()or c.plot local uX,mR=ao(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(uX and mR and mR:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=mR.CFrame:ToObjectSpace(uX.HumanoidRootPart.CFrame)
AJ(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eK(not c.running)end)N(a.buyB,function()
c.plot=bu()or c.plot task.spawn(ar,"buying (manual)...",oN,true)end)N(a.plB,function()c.plot=bu()or c.plot task.spawn(ar,"waxing (manual)...",oR)
end)N(a.tabFarm,function()a0("farm")end)N(a.tabRun,function()a0("run")end)N(a.tabSrv,function()a0("srv")end)N(a.tabAdm,function()a0("adm")end)
N(a.tabBut,function()a0("but")end)N(a.tabSet,function()a0("set")end)N(a.tabCrt,function()a0("crt")end)N(a.tabPet,function()a0("pet")end)
N(a.tabTeam,function()a0("team")end)local function D5(mS)c.hidden=mS a.root.Visible=not mS a.tgBtn.TextColor3=mS and l.text or l.ink
end tL(a.tgBtn,a.tgRoot,function()bO(a.tgRoot)c.togPos=hu(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then D5(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aJ,av={},0 local function bU()aJ=n7()if#aJ==0 then a.cfgPick.Text="(none saved)"
av=0 return end if av<1 or av>#aJ then av=1 end a.cfgPick.Text=aJ[av]..("  (%d/%d)"):format(av,#aJ)end local function uY()
local uZ=c.autoload~=nil a.cfgAuto.Text=uZ and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=uZ and l.accent or l.panel2
end local function mT()local u0=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if u0~=""then return u0 end return(av>0 and aJ[av])or""
end N(a.cfgSave,function()c.winPos=hu(a.root)or c.winPos c.togPos=hu(a.tgRoot)or c.togPos local u1,u2=fS(mT())
a.cfgMsg.Text=u1 and("saved as "..u2)or("could not save: "..u2)a.cfgMsg.TextColor3=u1 and l.good or l.bad bU()
A(a.cfgMsg.Text)end)local function D6(mU)local mV,u3=of(mU)a.cfgMsg.Text=mV and("loaded "..u3)or("could not load: "..u3)
a.cfgMsg.TextColor3=mV and l.good or l.bad if mV then a.cfgName.Text=mU DV()task.spawn(D.apply,"config "..mU)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()D6(mT())end)N(a.cfgPick,function()bU()if av>0 then a.cfgName.Text=aJ[av]end
end)N(a.cfgPrev,function()if#aJ==0 then bU()return end av=(av-2)%#aJ+1 bU()a.cfgName.Text=aJ[av]end)N(a.cfgNext,function()
if#aJ==0 then bU()return end av=av%#aJ+1 bU()a.cfgName.Text=aJ[av]end)N(a.cfgAuto,function()if c.autoload then
oh(nil)a.cfgMsg.Text="it will not load a config on launch"else local fe=mT()local u4=false for G4,D7 in ipairs(n7())do if D7==fe then u4=true end end
local D8=u4 or fS(fe)if D8 and fe~=""then oh(fe)bU()a.cfgMsg.Text=fe.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim uY()end)N(a.autoB,function()
local u5,u6=wZ()a.autoMsg.Text=u5 and("installed. "..u6)or("failed: "..u6)a.autoMsg.TextColor3=u5 and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dH("you asked")end)
local bt=false N(a.minB,function()bt=not bt a.tabs.Visible,a.railLine.Visible=not bt,not bt if bt then for G5,D9 in ipairs(a.tabKeys)do a[D9].Visible=false end
a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,T.head+6),UDim2 .new(1,-16,0,T.status)else a.strip.Position,a.strip.Size=UDim2 .new(0,T.rail+8,0,T.head+6),UDim2 .new(1,-(T.rail+16),0,T.status)
a0(ut)end a.root.Size=UDim2 .new(0,T.w,0,bt and(T.head+T.status+12)or T.h)a.minB.Text=bt and"+"or"-"end)local function h8()
if not c.alive then return end c.alive,c.running=false,false pcall(j.restoreAll)pcall(fr)for G6,D_ in ipairs(ii)do pcall(function()D_:Disconnect()end)end
if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end pcall(function()l2:Destroy()end)
pcall(function()uc:Destroy()end)if cz.SAB_KILL==h8 then cz.SAB_KILL=nil end end cz.SAB_KILL=h8 N(a.killB,h8)N(a.xB,h8)
tL(a.title,a.root,function()bO(a.root)c.winPos=hu(a.root)or c.winPos end)local function u7()local ff,cy=c.reason,c.level
if c.busy then ff,cy=c.busyText,"ok"elseif not c.running then local G7,u8,Ea=sQ()if c.capHit then ff,cy=u8,"bad"else ff,cy="[stopped] "..u8,(Ea=="bad")and"bad"or"idle"end
c.reason,c.level=ff,cy end local dn=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dn then
a.lit.dot=dn a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dn,dn,dn,dn a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,ff)if a.lit.bar~=cy then a.lit.bar=cy a.bar.BackgroundColor3=BU[cy]or l.dim end
if bt then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bV=wz()if a.farm.Visible then local Eb,Ec=fo()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Eb.."/"..Ec)local u9=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(y()-c.lastCollect)))or nil
local u_=ab()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aL(a8()),c.rolls,c.gifts,c.crates,u_ and ak(W(u_))or"nothing",e.on and("   ["..e.title.." window open]")or"",
u9 and("in "..u9 .."s")or"off"))a.put(a.tgt,(#bV==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bV<=3)and table.concat(bV,", ")or(#bV.." butters ticked"))))
if a.lit.tgt~=(#bV==0)then a.lit.tgt=(#bV==0)a.tgt.TextColor3=(#bV==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fi,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(d.Help or d.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,d.Campfire and J.msg or"campfire is off")
a.put(a.srvGhost,j.ghostMode()>0 and(j.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bV))
end if a.but.Visible and br.at~=ad.at then e7(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((d.Help or d.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(d.Campfire and J.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(d.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local va=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll: game %s | learned %s%s"):format(D.isOn()and"ON"or"off",va~=""and va or"nothing yet",#D.rec.rules>0 and", choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cz.SAB={S=c,CFG=d,EV=V,U=a,sg=l2,CAT=ad,LEARN=aj,buildList=e7,
logAll=dp,evAll=dq,AR=D,CR=L,PF=j,PX=q,TM=z,CRATE=e,FU=C,HX=E,CF=J,QX=F,IX=o,SH=O}A(bW.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a0("farm")bO(a.root)bO(a.tgRoot)if hr then pcall(function()Q(hr:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bO(a.root)bO(a.tgRoot)end))end)end bU()uY()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(u7)task.spawn(function()local vb=wX()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(vb and("\n(backup: "..vb..")")or"")
local vc=fM(am.exec)if vc and not vc:find("SAB autoloader v2",1,true)then dD(am.exec,am.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fM(am.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(w5)end)task.spawn(function()while c.alive do local Ed,Ee=pcall(u7)if not Ed then A("UI ERR "..tostring(Ee))end
task.wait((c.hidden or bt)and 1.5 or 0.4)end end)task.spawn(function()local Ef,Eg=pcall(xc)if not Ef then A("HOOK ERR "..tostring(Eg))end
end)task.spawn(function()pcall(vW)if e.loadSeq and not e.learned then local h9={}for vd=1,20 do if e.loadSeq[vd]then h9[#h9+1]=e.loadSeq[vd]end end
if#h9>0 then e.learned={seq=h9,mode=e.loadMode}A("remembered how to open crates directly")end end if iS()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local Eh,ve=pcall(AL)if Eh and ve and c.alive and not c.manualPad then c.manualPad=ve end end)task.spawn(function()
while c.alive do local mW,mX=pcall(q.buyTick)if not mW then A("PET ERR "..tostring(mX))task.wait(5)end mW,mX=pcall(q.wishTick)
if not mW then A("WISH ERR "..tostring(mX))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local h_,vf=0,y()
Q(game:GetService("RunService").Heartbeat:Connect(function()h_=h_+1 end))Q(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=y()while c.alive do task.wait(1)local vg=y()j.fps,h_,vf=h_/math.max(vg-vf,0.001),0,vg local Ei,Ej=pcall(j.tick)
if not Ei then A("PERF ERR "..tostring(Ej))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local Ek,El=pcall(C.tick)if not Ek then A("FUSE ERR "..tostring(El))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local Em,En=pcall(z.tick)if not Em then A("TEAM ERR "..tostring(En))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local ia=ah:WaitForChild("Remotes",30)local vh=ia and ia:WaitForChild("ClanEvent",30)
if vh and c.alive then Q(vh.OnClientEvent:Connect(function(Eo,Ep)if Eo=="call"then pcall(E.onCall,Ep)end end))
end local vi=ia and ia:FindFirstChild("RollConfirmAsk")if vi and c.alive then Q(vi.OnClientEvent:Connect(function(Eq)F.asked=Eq or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(j.calmScan)end end end)task.spawn(function()
local mY=ah:WaitForChild("Remotes",30)if not(mY and c.alive)then return end local function ib(Er,Es)local mZ=mY:FindFirstChild(Er)
if mZ and mZ:IsA("RemoteEvent")then Q(mZ.OnClientEvent:Connect(function(...)pcall(Es,...)end))end end ib("NewSquishyDiscovered",function(m0,vj)
if type(m0)~="string"then return end o.disc=o.disc or{}o.disc[W(m0)]=true A(("INDEX: %s%s is in your Index now"):format(ak(W(m0)),vj and(" ("..tostring(vj)..")")or""))
end)ib("IndexRefresh",o.loadDisc)ib("IndexRowComplete",function(Et)A("INDEX: the whole "..tostring(Et).." row is complete")end)
ib("AdminShow",o.admin)local vk=mY:FindFirstChild("AdminShowSync")if vk then local Eu,vl=pcall(function()return vk:InvokeServer()end)
if Eu and type(vl)=="table"then for G8,Ev in pairs(vl)do pcall(O.add,Ev)end end end while c.alive do local Ew,Ex=pcall(o.tick)
if not Ew then o.msg="index error: "..tostring(Ex)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Ey,Ez=pcall(F.tick)if not Ey then A("QUEST ERR "..tostring(Ez))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(fr)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local EB=(type(newcclosure)=="function")and newcclosure or function(EA)return EA end local m1
local vm=(type(setnamecallmethod)=="function")and setnamecallmethod or nil m1=hookmetamethod(game,"__namecall",EB(function(vn,...)
local fg=getnamecallmethod()if c.alive and(fg=="InvokeServer"or fg=="FireServer")then local vo,vp=pcall(function()return vn.Name end)
if vo and vp=="CrateAction"and not e.replaying then pcall(e.saw,fg,...)elseif vo and vp=="AutoRollAction"and not D.replaying then pcall(D.saw,fg,...)end
if vm then vm(fg)end end return m1(vn,...)end))e.oldNC=m1 end)end if ig then Q(H.Idled:Connect(function()pcall(function()ig:CaptureController()ig:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for G9=1,90 do if not c.alive then return end if H:GetAttribute("AutoRollOn")~=nil and ao()and(c.plot or bu())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local ic=b1()
if ic and o.on()and not aK(ic.name)then ic=nil end if c.alive and d.AutoRoll and c.running and not D.isOn()and not ic and not ab()
and not e.waiting and not e.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for G_=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bu()if ao()and c.plot and o.any()then eK(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bu()c.lastCollect=y()while c.alive do if c.running then local EC,vq=pcall(BP)if not EC and vq~=ih then A("LOOP ERR "..tostring(vq))end
end task.wait(0.1)end end)ie("ready - the window is at the top left")end local EE,m2=xpcall(vu,function(ED)return tostring(ED).."\n"..debug.traceback()end)
if not EE then pcall(function()warn("SAB "..bW.." ERROR: "..tostring(m2))end)ie("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bW.." ERROR: "..tostring(m2))end)pcall(function()local vr=(type(getgenv)=="function"and getgenv())or _G
if type(vr.SAB_KILL)=="function"then vr.SAB_KILL()end for Ha,EF in ipairs({"SABFarmGui","SABToggle"})do local vs=H.PlayerGui:FindFirstChild(EF)
if vs then vs:Destroy()end end end)pcall(function()local fh=Instance.new("ScreenGui")fh.Name="SABError"fh.ResetOnSpawn=false
fh.DisplayOrder=1000 local a1=Instance.new("TextBox")a1 .Size=UDim2 .new(0,340,0,170)a1 .Position=UDim2 .new(0,10,0,50)
a1 .BackgroundColor3=Color3 .fromRGB(90,20,20)a1 .TextColor3=Color3 .new(1,1,1)a1 .TextSize=11 a1 .TextWrapped=true
a1 .ClearTextOnFocus=false a1 .TextXAlignment=Enum.TextXAlignment.Left a1 .TextYAlignment=Enum.TextYAlignment.Top
a1 .Text="SAB "..bW.." failed to start. Send this text:\n"..tostring(m2)a1 .Parent=fh fh.Parent=H:WaitForChild("PlayerGui")
end)end
