local bT="v27"local m3=game:GetService("Players")local H=m3 .LocalPlayer or m3 .PlayerAdded:Wait()local function ie(vs)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..bT,Text=vs,Duration=6})
end)end ie("script started")local function vt()local ah=game:GetService("ReplicatedStorage")local as=game:GetService("Workspace")
local m4=game:GetService("UserInputService")local cy=(type(getgenv)=="function"and getgenv())or _G if type(cy.SAB_KILL)=="function"then pcall(cy.SAB_KILL)end
local y=(type(tick)=="function")and tick or os.clock local ig=(function()local vu,vv=pcall(function()return game:GetService("VirtualUser")end)return vu and vv or nil end)()
local d={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,Calm=false,HideBases=false,HideMine=false,MemLimit=2000,Help=false,
HelpGuild=false,Campfire=true,Ghost=false,GhostHelps=false,Quests=true,AutoIndex=false,Best=0,BestCrate=false,
Shower=true,SnapGlaze=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=y(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local T={name=nil,rar=nil,at=y(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local D={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local e={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local q,z,j,C,E,J,F={},{},{},{},{},{},{}local o,P={},{}local ih={}local ii,fi,dn,dp={},{},{},{}local function Q(m5)ii[#ii+1]=m5 return m5 end
local function ae(vw)task.wait(vw)if not c.alive then error(ih,0)end end local function A(fj)fj=os.date("%H:%M:%S").." "..tostring(fj)
table.insert(fi,1,fj)if#fi>6 then table.remove(fi)end c.logN=(c.logN or 0)+1 dn[#dn+1]=fj if#dn>80 then table.remove(dn,1)end
end local function fk(m6)if type(m6)~="string"then return""end return(m6:lower():gsub("[^%w]",""))end local function V(vx)
local m7=fk(vx)local ij=m7:gsub("butter$","")if ij==""then ij=m7 end return ij end local function aK(m8)if type(m8)~="string"then return false end
local ik=V(m8)if ik==""then return false end if o.want then return o.want(ik)end return d.Targets[ik]==true end
local function vy(dq)dq=dq:lower()return dq:find("squishy",1,true)~=nil or dq:match("butter$")~=nil or dq:match("butter[^%a]")~=nil
end local il={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aL(dr)if type(dr)~="number"then return"?"end
local fl=1 while math.abs(dr)>=1000 and fl<#il do dr=dr/1000 fl=fl+1 end local vz=string.format("%.2f",dr):gsub("%.?0+$","")
return vz..il[fl]end local function vA(m9)if type(m9)~="string"then return nil end local vB,ds=m9:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local im=tonumber(vB)if not im then return nil end if ds==""then return im end local vC={qd="qa",qn="qi"}ds=vC[ds:lower()]or ds
for vD,vE in ipairs(il)do if vE:lower()==ds:lower()then return im*1000^(vD-1)end end return nil end local function a8()
local m_=H:GetAttribute("BoardValueMoney")if type(m_)=="number"then return m_ end local na=H:FindFirstChild("leaderstats")
if na then for EC,vF in ipairs({"Cash","Money","Coins"})do local io=na:FindFirstChild(vF)if io and type(io.Value)=="number"then return io.Value end
end end end local function fm(vG)local ip=vG:GetFullName()if c.plot then local iq=c.plot:GetFullName()if ip:sub(1,#iq)==iq then return ip:sub(#iq+2)end
end return ip end local function ao()local fn=H.Character if fn and fn:FindFirstChild("HumanoidRootPart")then
local nb=fn:FindFirstChildOfClass("Humanoid")if nb and nb.Health>0 then return fn end end end local function bt()
local ir=as:FindFirstChild("Plots")if not ir then return nil end local function nc(vH)local nd=vH:FindFirstChild("Plate")
return nd~=nil and nd:FindFirstChild("EditStackAttachment",true)~=nil end local ne=H:GetAttribute("PlotNumber")
if ne~=nil then local is=ir:FindFirstChild(tostring(ne))if is and nc(is)then return is end end for ED,nf in ipairs(ir:GetChildren())do
if nc(nf)then return nf end end end local function dt(ng)local bu=ng and ng.Parent for EE=1,6 do if not bu then return nil end
if bu:IsA("BasePart")then return bu end if bu:IsA("Model")then return bu.PrimaryPart or bu:FindFirstChildWhichIsA("BasePart",true)end
bu=bu.Parent end end local function nh(ni)local it=ni.Parent if it and it:IsA("Attachment")then return it.WorldPosition end
local nj=dt(ni)return nj and nj.Position end local function nk()local cz=c.plot and c.plot:FindFirstChild("Plate")
if not cz then return nil end if cz:IsA("BasePart")then return cz.Position end if cz:IsA("Model")then return cz:GetPivot().Position end
local nl=cz:FindFirstChildWhichIsA("BasePart",true)return nl and nl.Position end local function nm()local iu={}
local nn=c.plot and c.plot:FindFirstChild("WaxStations")if nn then for EF,vI in ipairs(nn:GetChildren())do local no=vI:FindFirstChild("SquishyPlaceHolder")
local iv=no and no:FindFirstChild("PlacePrompt")if iv and iv:IsA("ProximityPrompt")then iu[#iu+1]=iv end end end
return iu end local function fo()local np,iw=nm(),0 for EG,vJ in ipairs(np)do if vJ.Enabled then iw=iw+1 end end
local ix=#np local iy=H:GetAttribute("WaxStations")if type(iy)=="number"and iy>ix then ix=iy end return iw,ix
end local function vK()local nq=ao()local nr=nq and nq.HumanoidRootPart.Position local iz,ns for EH,iA in ipairs(nm())do
if iA.Enabled then local nt=nh(iA)local nu=(nt and nr)and(nt-nr).Magnitude or 1e9 if not iz or nu<ns then iz,ns=iA,nu end
end end return iz end local function nv()local fp=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not fp then return nil end local nw=fp:FindFirstChild("BuyPromptAttachment")local fq=(nw and nw:FindFirstChild("BuyPrompt"))or fp:FindFirstChild("BuyPrompt",true)
if fq and fq:IsA("ProximityPrompt")and fq:IsDescendantOf(fp)then return fq end end local nx={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local vL={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local iB="SAB_order.txt"local function fr()if not aj.dirty or type(writefile)~="function"then return end local aB={}
for vM,vN in pairs(aj.price)do aB[#aB+1]="P|"..vM.."|"..string.format("%.0f",vN)end for vO,vP in pairs(aj.order)do aB[#aB+1]="O|"..vO.."|"..table.concat(vP,",")end
if e.learned and e.enc then aB[#aB+1]="M|mode|"..tostring(e.learned.mode or"")for vQ,fs in ipairs(e.learned.seq)do
local ny={}for nz=1,fs.n do ny[nz]=e.enc(fs.args[nz])end aB[#aB+1]=("A|%d|%s|%d|%s"):format(vQ,fs.m,fs.n,table.concat(ny,";"))
end end local function iC(vR,vS,ft)local nA={}for nB=1,ft.n do nA[nB]=e.enc(ft.args[nB])end aB[#aB+1]=("R|%d|%s|%s|%d|%s"):format(vS,vR,ft.m,ft.n,table.concat(nA,";"))
end if e.enc then for vT,vU in ipairs(D.rec.rules)do iC("rules",vT,vU)end if D.rec.on then iC("on",0,D.rec.on)end
if D.rec.off then iC("off",0,D.rec.off)end end for EI,du in pairs(L.seen)do aB[#aB+1]=("K|%s|%s|%s|%s"):format(du.name,du.title or"",du.rar or"",du.price and string.format("%.0f",du.price)or"")
end if pcall(writefile,iB,table.concat(aB,"\n"))then aj.dirty=false end end local function vV()if type(isfile)~="function"or type(readfile)~="function"then return end
local vW,vX=pcall(isfile,iB)if not(vW and vX)then return end local vY,nC=pcall(readfile,iB)if not(vY and type(nC)=="string")then return end
for vZ in nC:gmatch("[^\n]+")do local cA,cB,a9=vZ:match("^(%a)|([^|]+)|(.*)$")if cA=="P"then aj.price[cB]=tonumber(a9)
elseif cA=="M"then e.loadMode=(a9~=""and a9~="nil")and a9 or nil elseif cA=="A"and e.dec then local nD=tonumber(cB)
local nE,fu,v0=a9:match("^([^|]+)|(%d+)|(.*)$")if nD and nE then fu=tonumber(fu)local nF,fv={},0 for v1 in(v0 ..";"):gmatch("([^;]*);")do
fv=fv+1 if fv<=fu then nF[fv]=e.dec(v1)end end e.loadSeq=e.loadSeq or{}e.loadSeq[nD]={m=nE,n=fu,args=nF}end elseif cA=="R"and e.dec then
local nG=tonumber(cB)local fw,v2,fy,v3=a9:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if nG and fw then fy=tonumber(fy)
local nH,fz={},0 for v4 in(v3 ..";"):gmatch("([^;]*);")do fz=fz+1 if fz<=fy then nH[fz]=e.dec(v4)end end local iD={m=v2,n=fy,args=nH}
if fw=="rules"then D.rec.rules[nG]=iD elseif fw=="on"then D.rec.on=iD elseif fw=="off"then D.rec.off=iD end end
elseif cA=="K"then local nI,nJ,v5=a9:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cB)]={name=cB,title=nI~=""and nI or nil,
rar=nJ~=""and nJ or nil,price=tonumber(v5)}elseif cA=="O"and a9~=""then local fA={}for v6 in a9:gmatch("[^,]+")do fA[#fA+1]=v6 end
if#fA>0 then aj.order[cB]=fA end end end end local function v7(fB)if type(fB)~="table"then return end local bU,nK=fB.rarity,fB.contents
if type(bU)~="string"or bU==""or type(nK)~="table"then return end local dv={}for EJ,fC in ipairs(nK)do if type(fC)=="table"and type(fC.butter)=="string"then
dv[#dv+1]={n=fC.butter,ch=tonumber(fC.chance)or 0}end end if#dv==0 then return end table.sort(dv,function(v8,v9)return v8 .ch>v9 .ch end)
local dw,dx={},false for v_,wa in ipairs(dv)do dw[v_]=wa.n end local iE=aj.order[bU]if not iE or#iE~=#dw then dx=true end
if not dx then for nL=1,#dw do if iE[nL]~=dw[nL]then dx=true break end end end aj.order[bU]=dw local iF=tonumber(fB.price)
if iF and aj.price[bU]~=iF then aj.price[bU]=iF dx=true end if dx then aj.dirty=true ad.at=0 A("learned the "..bU.." order from its crate")
end end local function cC(wb,wc)local wd=wb:FindFirstChild(wc,true)local we,iG=pcall(function()return wd.Text end)
return(we and type(iG)=="string"and iG~="")and iG or nil end local function ak(nM)return ad.pretty[nM]or nM end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(wf)return fk(wf or"")end
function L.learn(a_)if type(a_)~="table"or type(a_.name)~="string"then return end local iH=L.key(a_.name)local ba=L.seen[iH]or{}
local wg=(L.seen[iH]==nil)or(tonumber(a_.price)and ba.price~=tonumber(a_.price))ba.name,ba.title=a_.name,a_.title or ba.title
ba.rar,ba.price=a_.rarity or ba.rar,tonumber(a_.price)or ba.price L.seen[iH]=ba if wg then L.at,aj.dirty=y(),true end
end function L.wanted(nN)if nN==nil then return false end local iI=L.key(nN)return d.CrateTicks[iI]==true or(d.BestCrate and o.bestCrate~=nil and(iI==o.bestCrate or iI==o.bestCrateTitle))
end function L.list()local cD={}for wh,fD in ipairs(L.base)do cD[L.key(fD[1])]={name=fD[1],title=fD[2],rar=fD[3],i=wh}end
for EK,dy in ipairs(ad.rarOrder)do local nO=false for EL,wi in pairs(cD)do if wi.rar==dy then nO=true break end end
if not nO and dy~="?"then local nP=dy:gsub("[^%w]","").."Crate"cD[L.key(nP)]={name=nP,title=dy.." Crate",rar=dy,i=50,guess=true}
end end for nQ,fE in pairs(L.seen)do local a2=cD[nQ]or{i=100}a2 .name,a2 .title,a2 .rar=fE.name or a2 .name,fE.title or a2 .title,fE.rar or a2 .rar
a2 .price,a2 .guess=fE.price or a2 .price,nil cD[nQ]=a2 end local dz,fF={},{}for wj,wk in ipairs(nx)do dz[wk]=wj end
for wl,nR in ipairs(ad.rarOrder)do dz[nR]=dz[nR]or(20+wl)end for wm,dA in pairs(cD)do dA.k=wm dA.price=dA.price or aj.price[dA.rar or""]
fF[#fF+1]=dA end table.sort(fF,function(bV,bW)if bV.price and bW.price and bV.price~=bW.price then return bV.price<bW.price end
local nS,nT=dz[bV.rar or""]or 99,dz[bW.rar or""]or 99 if nS~=nT then return nS<nT end if(bV.i or 100)~=(bW.i or 100)then return(bV.i or 100)<(bW.i or 100)end
return bV.k<bW.k end)return fF end local function wn()local nU=ah:FindFirstChild("Assets")local nV=nU and nU:FindFirstChild("Squishies")
if not nV then return false end local iJ,nW,cE={},{},{}local fG=0 for EM,fH in ipairs(nV:GetChildren())do local dB=V(fH.Name)
if dB~=""and not iJ[dB]then local fI=cC(fH,"RarityText")or"?"iJ[dB]=fI nW[dB]=cC(fH,"NameText")or fH.Name cE[fI]=cE[fI]or{}
table.insert(cE[fI],dB)fG=fG+1 end end if fG==0 then return false end for nX,wo in pairs(cE)do local nY=aj.order[nX]or vL[nX]
local iK={}if nY then for wp,wq in ipairs(nY)do iK[V(wq)]=wp end end table.sort(wo,function(nZ,n0)local iL,iM=iK[nZ],iK[n0]
if iL and iM then return iL<iM end if iL then return true end if iM then return false end return ak(nZ)<ak(n0)
end)end local iN={}for wr,ws in ipairs(nx)do iN[ws]=wr end local fJ,bX={},{}for wt in pairs(cE)do fJ[#fJ+1]=wt end
pcall(function()for wu,wv in ipairs(require(ah.Modules.SquishyRNG).Keys)do bX[wv]=wu end end)table.sort(fJ,function(cF,cG)
if bX[cF]and bX[cG]and bX[cF]~=bX[cG]then return bX[cF]<bX[cG]end local iO,iP=aj.price[cF],aj.price[cG]if iO and iP and iO~=iP then return iO<iP end
local iQ,iR=iN[cF],iN[cG]if iQ and iR then return iQ<iR end if iQ then return true end if iR then return false end
return cF<cG end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=iJ,nW,cE,fJ,fG,y()return true end local function iS()
if ad.at==0 or(y()-ad.at)>120 then pcall(wn)end return ad.n>0 end local function ww(wx)local n1=V(wx)return ad.rar[n1]or(T.name and V(T.name)==n1 and T.rar)or"?"
end local function wy()local fK={}local wz=((d.Best or 0)>0 and next(o.best or{}))and o.best or d.Targets for wA,wB in pairs(wz)do if wB then fK[#fK+1]=ak(wA)end end
table.sort(fK)return fK end local am={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function n2()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fL(n3)if type(makefolder)~="function"then return end local wC,wD=pcall(isfolder,n3)if not(wC and wD)then pcall(makefolder,n3)end
end local function fM(n4)if type(isfile)~="function"or type(readfile)~="function"then return nil end local wE,wF=pcall(isfile,n4)
if not(wE and wF)then return nil end local wG,wH=pcall(readfile,n4)return wG and wH or nil end local function dC(wI,wJ)
if type(writefile)~="function"then return false end return(pcall(writefile,wI,wJ))end local function n5(wK)local dD={}
if type(listfiles)~="function"then return dD end local wL,n6=pcall(listfiles,wK)if not wL or type(n6)~="table"then return dD end
for EN,wM in ipairs(n6)do dD[#dD+1]=tostring(wM)end return dD end local function n7()local fN={}for EO,wN in ipairs(n5(am.cfg))do
local n8=wN:match("([^/\\]+)%.txt$")if n8 then fN[#fN+1]=n8 end end table.sort(fN)return fN end local function wO()
local W={"V|1"}W[#W+1]="N|Every|"..tostring(d.Every)W[#W+1]="N|GlazeLead|"..tostring(d.GlazeLead)W[#W+1]="N|FpsCap|"..tostring(d.FpsCap)
W[#W+1]="N|MemLimit|"..tostring(d.MemLimit)W[#W+1]="N|Best|"..tostring(d.Best or 0)for EP,n9 in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do W[#W+1]="S|"..n9 .."|"..d[n9]end
do local fO={}for wP,dE in pairs(d.Pets)do local n_=(dE.b and"b"or"")..(dE.g and"g"or"")..(dE.w and"w"or"")..((tonumber(dE.f)or 0)>0 and tostring(dE.f)or"")
if n_~=""then fO[#fO+1]=wP.."|"..n_ end end table.sort(fO)W[#W+1]="P|-"for EQ,wQ in ipairs(fO)do W[#W+1]="P|"..wQ end
end for ER,oa in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
W[#W+1]="B|"..oa.."|"..(d[oa]and"1"or"0")end local iT=H:GetAttribute("AutoRollRules")if type(iT)=="string"and iT~=""then d.ARrules,d.ARstop=iT,tostring(H:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then W[#W+1]="S|rules|"..d.ARrules W[#W+1]="S|stop|"..d.ARstop end if c.winPos then W[#W+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then W[#W+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for ES,iU in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fP={}for wR,wS in pairs(iU[2])do if wS then fP[#fP+1]=wR end end table.sort(fP)W[#W+1]=iU[1].."|-"for ET,wT in ipairs(fP)do W[#W+1]=iU[1].."|"..wT end
end return table.concat(W,"\n")end local function wU(iV)if type(iV)~="string"or iV==""then return false end local ob,oc,od,oe,dF={},false,{},false,nil
for wV in iV:gmatch("[^\n]+")do local aC,af,aw=wV:match("^(%a)|([^|]*)|?(.*)$")if aC=="N"and af=="Every"then local iW=tonumber(aw)
if iW and iW>=1 then d.Every=math.floor(iW)end elseif aC=="N"and(af=="FpsCap"or af=="MemLimit")then local iX=tonumber(aw)
if iX and iX>=0 then d[af]=math.floor(iX)end elseif aC=="N"and af=="Best"then local fQ=tonumber(aw)if fQ and fQ>=0 and fQ<=4 then d.Best=math.floor(fQ)end
elseif aC=="N"and af=="GlazeLead"then local fR=tonumber(aw)if fR and fR>=5 and fR<=600 then d.GlazeLead=math.floor(fR)end
elseif aC=="S"and(af=="TeamNormal"or af=="TeamFull"or af=="TeamGlaze"or af=="TeamWax")then d[af]=aw elseif aC=="P"and af~=""then
if not dF then dF={}end if af~="-"and aw~=""then dF[af]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aC=="B"then if d[af]~=nil then d[af]=(aw=="1")end
elseif aC=="S"and af=="rules"then d.ARrules=aw elseif aC=="S"and af=="stop"then d.ARstop=aw elseif aC=="W"then
c.winPos={tonumber(af)or 10,tonumber(aw)or 44}elseif aC=="G"then c.togPos={tonumber(af)or 10,tonumber(aw)or 300}
elseif aC=="T"and af~=""then if af~="-"then ob[af]=true end oc=true elseif aC=="K"and af~=""then if af~="-"then od[af]=true end
oe=true end end if oc then d.Targets=ob end if oe then d.CrateTicks=od end if dF then d.Pets=dF end return true
end local function fS(cH)if not n2()then return false,"this executor cannot write files"end cH=(cH or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cH==""then return false,"give the config a name"end fL(am.dir)fL(am.cfg)if not dC(am.cfg.."/"..cH..".txt",wO())then return false,"could not write the file"end
c.config=cH return true,cH end local function of(fT)local og=fM(am.cfg.."/"..fT..".txt")if not og then return false,"no config called "..tostring(fT)end
if not wU(og)then return false,"that config looks empty"end c.config=fT return true,fT end local function oh(iY)
if iY then fL(am.dir)dC(am.auto,iY)elseif type(delfile)=="function"then pcall(delfile,am.auto)else dC(am.auto,"")
end c.autoload=iY end local function wW()if c.selfPath then return c.selfPath end local fU for EU,wX in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",am.dir})do
for EW,oi in ipairs(n5(wX))do local iZ=oi:lower()if iZ:sub(-4)==".lua"and(iZ:find("sab_farm",1,true)or iZ:find("sab farm",1,true))then
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
local function wY()if not n2()then return false,"this executor cannot write files"end fL("autoexec")if not dC(am.exec,am.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fV=(function()local wZ,w0=pcall(function()return game:GetService("TeleportService")end)return wZ and w0 or nil end)()
local function oj()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local w1=queueonteleport or queue_on_teleport return(pcall(w1,am.stub))end local function dG(w2)if c.rejoining then return end
c.rejoining=true A("REJOIN ("..w2 ..")")pcall(fr)if c.autoload then pcall(fS,c.autoload)end local w3=oj()A(w3 and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for EX=1,30 do if not fV then break end pcall(function()fV:Teleport(game.PlaceId,H)end)task.wait(10)
end end)end local function w4()local w5,ol=pcall(function()return game:GetService("GuiService")end)if w5 and ol then
pcall(function()Q(ol.ErrorMessageChanged:Connect(function()if d.Rejoin then dG("roblox error message")end end))
end)end pcall(function()local om=game:GetService("CoreGui")local oo=om and om:WaitForChild("RobloxPromptGui",15)
local op=oo and oo:WaitForChild("promptOverlay",15)if op then Q(op.ChildAdded:Connect(function(w6)if d.Rejoin and tostring(w6 .Name):lower():find("errorprompt",1,true)then dG("disconnect prompt")end
end))end end)if fV then pcall(function()Q(fV.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dG("teleport retry")end)end
end))end)end end local function oq(w7)local ot=c.plot and c.plot:FindFirstChild(w7)if not ot then return nil,false end
for EY,i0 in ipairs(ot:GetChildren())do if i0:IsA("Model")or i0:IsA("BasePart")then return i0,true end end return nil,true
end local function bY()local bv=oq("RolledSquishy")if not bv then return nil end return{model=bv,name=bv.Name,pretty=cC(bv,"NameText")or ak(V(bv.Name)),
rar=cC(bv,"RarityText")or ww(bv.Name),price=cC(bv,"PriceText")}end local function ou(i1)return type(i1)=="string"and(ad.rar[V(i1)]~=nil or vy(i1))
end local function aa()local i2=oq("SquishyEquipped")if i2 then c.carrySrc,e.heldAt="model",y()return i2 .Name,i2 end
local ov=H.Character if ov then for EZ,dH in ipairs(ov:GetDescendants())do if(dH:IsA("Model")or dH:IsA("Tool"))and ou(dH.Name)then
c.carrySrc,e.heldAt="character",y()return dH.Name,dH end end end local fW=H:GetAttribute("SquishyEquipped")if type(fW)=="string"and fW~=""and ou(fW)and y()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fW,nil end c.carrySrc=nil end local function E0()local E1,w8=aa()return w8 end local function dI()
local ow=bY()local i3=ow and vA(ow.price)local i4=a8()if i3 and i4 and i4<i3*0.5 then return i4,i3 end end local function bZ(w9)
dp[#dp+1]=os.date("%H:%M:%S").." "..w9 if#dp>40 then table.remove(dp,1)end end local function w_(b0,fX)if type(b0)~="string"then return end
bZ(("Roll(%s,%s)"):format(b0,tostring(fX)))if b0:lower():find("crate",1,true)then e.rolled,e.rolledAt=b0,y()return
end T.seq=T.seq+1 T.name,T.at=b0,y()T.rar=type(fX)=="string"and fX or nil c.rolls=c.rolls+1 if aK(b0)then A(("ROLL %s [%s] = TARGET"):format(b0,tostring(fX)))end
end local function xa(b1)if type(b1)~="table"then return end local fY=b1 .butter or b1 .itemName if type(fY)~="string"then return end
c.gifts=c.gifts+1 T.gift,T.giftAt=fY,y()if type(b1 .giftId)=="string"then local ox=ah:FindFirstChild("Remotes")
local oy=ox and ox:FindFirstChild("GiftThanks")if oy then pcall(function()oy:FireServer(b1 .giftId)end)end end
bZ("Gift("..fY.." from "..tostring(b1 .fromName)..")")A(("GIFT from %s: %s - it will not be waxed"):format(tostring(b1 .fromName),fY))
end local function xb()local oz=ah:WaitForChild("Remotes",30)if not c.alive then return end if not oz then A("Remotes folder missing - no roll events")return end
Q(H:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local oA=H:GetAttribute("SquishyEquipped")
if type(oA)=="string"and oA~=""then e.heldAt=y()end end))local xh={SquishyRollAnimation=w_,InitSquishy=function(oB)T.init,T.initAt=tostring(oB),y()bZ("Init("..tostring(oB)..")")end,
CrateUpdate=function(cI,oC)pcall(v7,cI)pcall(L.learn,cI)if type(cI)=="table"then local xc=oC==true or(e.rolled~=nil and y()-e.rolledAt<15)or e.waiting
if not xc then return end local xd=not e.waiting local xe=e.on e.waiting,e.data,e.at=true,cI,y()e.on=(oC==true)
e.title=tostring(cI.title or cI.name or"crate")if e.on and not xe then e.openedAt,e.byYou=y(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then bZ("CrateWindow open("..e.title..")")elseif xd then bZ("Crate waiting("..e.title..")")A(e.title.." is waiting on your stand")
end else if e.waiting then bZ("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local xf=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,xf)end if e.classify then local xg=y()
task.spawn(function()pcall(e.classify,xg)end)end end end,GiftReceived=xa,}for fZ,xi in pairs(xh)do local i5=oz:FindFirstChild(fZ)
if i5 and i5:IsA("RemoteEvent")then Q(i5 .OnClientEvent:Connect(xi))elseif fZ~="CrateUpdate"and fZ~="GiftReceived"then A("remote "..fZ.." missing")end
end end local function i6()local b2=bY()if b2 then if aK(b2 .name)then return{state="match",shown=b2 .pretty,src="pad",info=b2}
end return{state="skip",info=b2,level="idle",text=("on pad: %s [%s] - not ticked"):format(b2 .pretty,tostring(b2 .rar))}
end if T.name and(y()-T.at)<4 then if aK(T.name)then return{state="match",shown=ak(V(T.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(V(T.name)),tostring(T.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function f0(xj,xk,xl,xm)
local f1=RaycastParams.new()f1 .FilterType=Enum.RaycastFilterType.Exclude local i7={H.Character}for E2,xn in ipairs(xm or{})do i7[#i7+1]=xn end
f1 .FilterDescendantsInstances=i7 pcall(function()f1 .RespectCanCollide=true end)local oD=as:Raycast(Vector3 .new(xj,xk+4,xl),Vector3 .new(0,-30,0),f1)
return oD and oD.Position or nil end local function cJ(oE)local oF=oE:FindFirstChildOfClass("Humanoid")return((oF and oF.HipHeight)or 2)+oE.HumanoidRootPart.Size.Y/2+0.2
end local function i8(xo,xp)local i9=xo:FindFirstChildOfClass("Humanoid")local xq=y()while y()-xq<xp do if i9 and(i9 .FloorMaterial~=Enum.Material.Air or i9 .SeatPart)then return true end
ae(0.05)end return false end local function aD(xr,i_,ja)local oG=xr.HumanoidRootPart oG.AssemblyLinearVelocity=Vector3 .new(0,0,0)
oG.CFrame=ja and CFrame.new(i_,Vector3 .new(ja.X,i_.Y,ja.Z))or CFrame.new(i_)end local function b3(bc,oH)local b4=ao()
if not b4 or not bc then return false end local bw=bc.Position local f2=math.clamp(math.max(bc.Size.X,bc.Size.Z)/2+2.2,3,7)
local oI=(oH and oH.MaxActivationDistance)or 10 if f2>oI-2 then f2=math.max(2.5,oI-2)end local dJ={}local function b5(dK)
dK=Vector3 .new(dK.X,0,dK.Z)if dK.Magnitude>0.05 then dJ[#dJ+1]=dK.Unit end end local oJ=nk()if oJ then b5(oJ-bw)end
b5(bc.CFrame.LookVector)b5(-bc.CFrame.LookVector)b5(bc.CFrame.RightVector)b5(-bc.CFrame.RightVector)b5(b4 .HumanoidRootPart.Position-bw)
if#dJ==0 then b5(Vector3 .new(0,0,1))end local xs,f3=cJ(b4),false for E3,xt in ipairs(dJ)do local f4=bw+xt*f2
local jb=f0(f4 .X,bw.Y,f4 .Z,{bc})if jb and math.abs(jb.Y-bw.Y)<14 then aD(b4,Vector3 .new(f4 .X,jb.Y+xs,f4 .Z),bw)
if i8(b4,0.7)then f3=true break end end end if not f3 then aD(b4,bw+dJ[1]*f2+Vector3 .new(0,3,0),bw)f3=i8(b4,1)
end ae(0.12)return f3 end local function oK(dL)if not dL.Parent or not dL.Enabled then return false end pcall(function()dL:InputHoldBegin()end)
ae(math.max(dL.HoldDuration,0)+0.08)pcall(function()dL:InputHoldEnd()end)return true end local function ap(oL,xu)
local xv=y()while y()-xv<xu do if oL()then return true end ae(0.05)end return oL()end local function dM(cK,xw,oM,xx)
local xy=c.zapFirst and{"zap","hold"}or{"hold","zap"}for xz,jc in ipairs(xy)do if xz==2 and(xx or not(cK.Parent and cK.Enabled and(not oM or oM())))then break end
local jd if jc=="hold"then jd=oK(cK)else jd=type(fireproximityprompt)=="function"and cK.Parent~=nil and cK.Enabled and pcall(fireproximityprompt,cK)end
if jd and ap(xw,1.2)then c.zapFirst=(jc=="zap")return true,jc end end return false end local function oN(je)local bx=nv()
if not bx or not bx.Enabled then A("buy: nothing on the pad")return false end local jf=dt(bx)if not jf then A("buy: pad part missing")return false end
c.lastBuyAt=y()local xA,oO=T.seq,a8()local oP=ao()local xC=oP and(oP.HumanoidRootPart.Position-jf.Position).Magnitude>12
b3(jf,bx)if xC then ae(0.4)end if not bx.Enabled then A("buy aborted: pad emptied")return false end local cL=i6()
if not je and cL.state~="match"then A("buy aborted: "..(cL.text or"pad changed"))c.matchSince=nil return false
end local jg=cL.info and cL.info.name or(cL.state=="match"and T.name)or nil local function xD()return bx.Enabled and aa()==nil and(je or i6().state=="match")
end local xE,xF=dM(bx,function()return aa()~=nil or((not bx.Enabled)and(je or T.seq==xA))end,xD,dI()~=nil)if xE then
ap(function()return aa()~=nil end,0.8)local dN=aa()local oQ=a8()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil T.name,T.rar,T.at=nil,nil,y()A(("BOUGHT %s%s via %s"):format(dN and ak(V(dN))or(cL.shown or"?"),(oO and oQ)and(" for $"..aL(oO-oQ))or"",xF))
if dN and jg and V(dN)~=V(jg)then A(("note: picked up %s, not %s"):format(dN,jg))end return true end local f5=bY()
if dI()then c.cashFails=c.cashFails+1 c.noCashUntil=y()+math.min(8*2^(c.cashFails-1),60)A(("BUY REFUSED: cash short - have $%s, price %s"):format(aL(a8()),(f5 and f5 .price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=y()+(c.buyMiss<=3 and 1 or 6)A(("buy did not go through (%s, try %d) - again in %ds"):format(f5 and f5 .price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function oR()local dO=aa()if not dO then c.holding=false A("place: hands are empty")
return false end if not aK(dO)then A(("REFUSED TO WAX %s - it is not ticked"):format(ak(V(dO))))return false end
for E4=1,d.PlaceTries do local by=vK()if not by then A("place: no free station")break end local oS=dt(by)if oS then
b3(oS,by)local oT=aa()if not oT then c.holding=false A("place: hands emptied on the way")return false end if not aK(oT)then A("place: what I carry changed, not waxing it")return false end
if by.Enabled then local xG,xH=dM(by,function()return not by.Enabled end,function()return by.Enabled end)if xG then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=y()+2.5,0 T.name,T.rar,T.at=nil,nil,y()
A(("WAXED %s #%d at %s via %s"):format(ak(V(dO)),c.placed,by.Parent.Parent.Name,xH))if o.placed then pcall(o.placed,dO)end
return true end end end ae(0.25)end c.placeFails=c.placeFails+1 if aa()==nil then c.holding=false end A("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,y()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(aa()))A(c.capMsg)end return false end function z.place()local xI=y()while c.alive and z.editing and y()-xI<25 do ae(0.2)end
if d.Teams and d.TeamWax~=""then z.placing=true local xJ=y()while c.alive and z.current()~=d.TeamWax and y()-xJ<5 do ae(0.1)end
if z.current()==d.TeamWax then ae(0.3)else A("wax team did not come on in time - placing anyway")end end local xK,oU=pcall(oR)
z.placing=false if not xK then error(oU,0)end return oU end local function oV(oW)return type(oW)=="string"and oW:lower():find("crate",1,true)~=nil
end local xL={SABFarmGui=1,SABToggle=1,SABError=1}local function jh(xM)local bz=xM while bz do if xL[bz.Name]then return false end
if bz:IsA("ScreenGui")then local xN,xO=pcall(function()return bz.Enabled end)return(not xN)or xO~=false end if bz:IsA("GuiObject")and not bz.Visible then return false end
bz=bz.Parent end return false end local function f6(f7)local cM=""pcall(function()if f7:IsA("TextButton")then cM=f7 .Text end end)
if not cM:find("%a")then for E5,f8 in ipairs(f7:GetDescendants())do if(f8:IsA("TextLabel")or f8:IsA("TextButton"))and f8 .Text:find("%a")then cM=f8 .Text break end
end end if not cM:find("%a")then cM=f7 .Name end return(cM:lower():gsub("[^%a]",""))end local function xP()local dP,dQ
local oX=H:FindFirstChildOfClass("PlayerGui")if not oX then return nil,nil end for E6,dR in ipairs(oX:GetDescendants())do
if dR:IsA("GuiButton")and jh(dR)then local ji=f6(dR)if ji:sub(1,4)=="open"and not ji:find("shop",1,true)then dP=dP or dR end
if ji:sub(1,7)=="discard"then dQ=dQ or dR end end end if dP and dQ then return dP,dQ end if e.on then return dP,dQ end
return nil,nil end local jj=(function()local xQ,xR=pcall(function()return game:GetService("VirtualInputManager")end)return xQ and xR or nil end)()
local function oY(bd,jk)local jl={}local function oZ(xS)jl[#jl+1]=xS end if c.tapWay then oZ(c.tapWay)end for E7,o0 in ipairs({"touch","conn","signal"})do
if o0~=c.tapWay then oZ(o0)end end local function o1(xT,...)local xU,jm=pcall(getconnections,xT)if not(xU and type(jm)=="table"and#jm>0)then return false end
local o2,xV,xW=false,{...},select("#",...)for E8,xX in ipairs(jm)do if pcall(function()xX:Fire(table.unpack(xV,1,xW))end)then o2=true end
end return o2 end local function o3()local o4=Vector3 .new(0,0,0)pcall(function()local o5,o6=bd.AbsolutePosition,bd.AbsoluteSize
o4=Vector3 .new(o5 .X+o6 .X/2,o5 .Y+o6 .Y/2,0)end)local jn={Position=o4,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()jn.UserInputType=Enum.UserInputType.Touch end)pcall(function()jn.UserInputState=Enum.UserInputState.End end)
return jn end for E9,be in ipairs(jl)do local dS=false if be=="conn"and type(getconnections)=="function"then if o1(bd.MouseButton1Click)then
dS=true if ap(jk,1.5)then c.tapWay=be return true,be end end dS=o1(bd.Activated,o3(),1)elseif be=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bd.MouseButton1Click)then if ap(jk,1.5)then c.tapWay=be return true,be end end dS=pcall(firesignal,bd.Activated,o3(),1)
elseif be=="touch"and jj then dS=pcall(function()local o7,o8=bd.AbsolutePosition,bd.AbsoluteSize local o9=0 local o_=bd:FindFirstAncestorWhichIsA("ScreenGui")
local xY,xZ=pcall(function()return o_ and o_.IgnoreGuiInset end)if not(xY and xZ)then pcall(function()o9=game:GetService("GuiService"):GetGuiInset().Y end)
end local pa,pb=o7 .X+o8 .X/2,o7 .Y+o8 .Y/2+o9 jj:SendMouseButtonEvent(pa,pb,0,true,game,1)task.wait(0.06)jj:SendMouseButtonEvent(pa,pb,0,false,game,1)
end)end if dS and ap(jk,1.5)then c.tapWay=be return true,be end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function jo(pc)local dT=pc.Parent while dT and dT~=c.plot do if e.NOT[dT.Name]then return false end dT=dT.Parent
end local jp=(pc.ActionText or""):lower()if jp:find("roll",1,true)or jp:find("place",1,true)or jp:find("sell",1,true)then return false end
return true end local function pd()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local pe=c.plot:FindFirstChild("CrateStand")local dU if pe then for E_,f9 in ipairs(pe:GetDescendants())do
if f9:IsA("ProximityPrompt")and f9 .Enabled and jo(f9)then dU=f9 break end end end if not dU then for Fa,bA in ipairs(c.plot:GetDescendants())do
if bA:IsA("ProximityPrompt")and bA.Enabled and jo(bA)then local pf=bA:FindFirstAncestorWhichIsA("Model")local x0=((bA.ActionText or"").." "..(bA.ObjectText or"").." "..bA.Name.." "..(pf and pf.Name or"")):lower()
if x0:find("crate",1,true)then dU=bA break end end end end e.prompt=dU return dU end local function jq()if e.on then return true end
local dV=pd()if not dV then e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local pg=dt(dV)if pg then b3(pg,dV)end e.ours=true dM(dV,function()return e.on end)if ap(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=y()A("crate: pressed "..fm(dV).." but no window came up")
return false end do local function x1(ph)local cN=ph.Parent while cN and cN:IsA("GuiObject")do local pj,pk=false,false
for Fb,dW in ipairs(cN:GetDescendants())do if dW~=ph and dW:IsA("GuiButton")and f6(dW):sub(1,7)=="discard"then pj=true end
if dW:IsA("TextLabel")then local jr=dW.Text:lower()if jr:find("crate",1,true)or jr:find("can contain",1,true)or jr:find("cost",1,true)then pk=true end
end if pj and pk then return cN end end cN=cN.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local pl=H:FindFirstChildOfClass("PlayerGui")if not pl then return nil end for Fc,f_ in ipairs(pl:GetDescendants())do
if f_:IsA("GuiButton")and not f_:FindFirstAncestor("SABFarmGui")and f6(f_):sub(1,4)=="open"then local js=x1(f_)
if js then e.win=js return js end end end end local function x2(x3)for Fd,ga in ipairs(x3:GetDescendants())do
if ga:IsA("GuiButton")then local pm,jt=f6(ga),ga.Name:lower()if pm=="x"or pm=="close"or jt=="x"or jt:find("close",1,true)or jt:find("exit",1,true)then return ga end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(x4)task.wait(x4 and 4 or 1.2)if e.on or e.waiting then return end
local gb=e.findWin()if not gb or not jh(gb)then return end local pn=x2(gb)if pn and oY(pn,function()return not jh(gb)end)then return end
A("the crate window is still open - tap its X")end end local function dX(gc)if not jq()then return false end local po=y()-(e.openedAt or 0)
if po<0.6 then ae(0.6-po)end local ju=e.title local x5,x6=xP()local pp=gc and x5 or x6 if not pp then e.lastFail=y()
c.crateFails=c.crateFails+1 A(("crate: no %s button found in %s"):format(gc and"Open"or"Discard",ju))return false
end local x7=aa()local x8,Fe=oY(pp,function()return(not e.on)or(aa()~=nil and aa()~=x7)end)if not x8 then e.lastFail=y()
c.crateFails=c.crateFails+1 A("crate: could not press "..(gc and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gc then c.crates=c.crates+1 ap(function()return aa()~=nil end,1.5)local pq=aa()
A(("OPENED %s -> %s"):format(ju,pq and ak(V(pq))or"?"))else A("discarded "..ju.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(x9,...)local x_=select("#",...)e.calls[#e.calls+1]={t=y(),m=x9,n=x_,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aE,bf)local bB=type(aE)if(bB=="string"or bB=="number")and type(bf.data)=="table"then for ps,jv in pairs(bf.data)do
if jv==aE and type(ps)=="string"and(type(jv)=="string"or type(jv)=="number")then return{__slot="f:"..ps}end end
end if bB=="string"then if bf.crate and aE==bf.crate then return{__slot="crate"}end if bf.title and aE==bf.title then return{__slot="title"}end
if bf.rar and aE==bf.rar then return{__slot="rarity"}end return aE end if bB=="number"or bB=="boolean"or bB=="nil"then return aE end
if bB=="table"then local pt={}for ya,pu in pairs(aE)do if type(pu)=="table"then return nil,"nested table"end local yb,pv=e.slot(pu,bf)
if pv then return nil,pv end pt[ya]=yb end return pt end local yc,yd=pcall(function()return aE:IsA("Instance")end)
if yc and yd then if aE==H then return{__slot="player"}end if c.plot and aE==c.plot then return{__slot="plot"}end
local gd=c.plot and c.plot:FindFirstChild("CrateStand")if gd and aE==gd then return{__slot="stand"}end if gd and aE.Parent==gd then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bB..")"end function e.resolve(ge)if type(ge)~="table"then return ge end
local aR=ge.__slot if aR and aR:sub(1,2)=="f:"then return e.data and e.data[aR:sub(3)]end if aR=="crate"then return e.data and e.data.name end
if aR=="title"then return(e.data and e.data.title)or e.title end if aR=="rarity"then return e.data and e.data.rarity end
if aR=="player"then return H end if aR=="plot"then return c.plot end if aR=="stand"or aR=="model"then local jw=c.plot and c.plot:FindFirstChild("CrateStand")
if aR=="stand"or not jw then return jw end for Ff,pw in ipairs(jw:GetChildren())do if oV(pw.Name)then return pw end end
return nil end local px={}for ye,yf in pairs(ge)do px[ye]=e.resolve(yf)end return px end function e.classify(jx)
if e.directOff then return end local gf={}for Fg,jy in ipairs(e.calls)do if jy.t<=jx+0.05 and jx-jy.t<=6 then gf[#gf+1]=jy end
end if#gf==0 then return end if not ap(function()return(e.heldAt or 0)>=jx-1 end,2.5)then return end local dY={}
for Fh,dZ in ipairs(gf)do local py={}for pz=1,dZ.n do local yg,pA=e.slot(dZ.args[pz],dZ)if pA then A("crate call has "..pA.." - keeping the button method")
return end py[pz]=yg end dY[#dY+1]={m=dZ.m,n=dZ.n,args=py}end local jz=e.learned e.learned={seq=dY,mode=jz and jz.mode or nil}
aj.dirty=true if not jz then A(("learned how to open crates directly (%d call%s)"):format(#dY,#dY==1 and""or"s"))end
end function e.replay()local pB=e.learned local pC=ah:FindFirstChild("Remotes")local jA=pC and pC:FindFirstChild("CrateAction")
if not(pB and jA)then return false end local pD=table.unpack or unpack e.replaying=true for Fi,d0 in ipairs(pB.seq)do
local jB={}for pE=1,d0 .n do jB[pE]=e.resolve(d0 .args[pE])end task.spawn(function()pcall(function()if d0 .m=="InvokeServer"then jA:InvokeServer(pD(jB,1,d0 .n))
else jA:FireServer(pD(jB,1,d0 .n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(yh)return(yh:gsub("[%%|;=,\n]",function(yi)return("%%%02X"):format(yi:byte())end))end
function e.enc(b6)local gg=type(b6)if gg=="string"then return"s"..e.esc(b6)end if gg=="number"then return"n"..tostring(b6)end
if gg=="boolean"then return b6 and"b1"or"b0"end if gg=="nil"then return"z"end if b6 .__slot then return"k"..b6 .__slot end
local jC={}for yj,yk in pairs(b6)do jC[#jC+1]=e.enc(yj).."="..e.enc(yk)end return"t"..table.concat(jC,",")end
function e.dec(pF)local d1,d2=pF:sub(1,1),pF:sub(2)local function yl(ym)return(ym:gsub("%%(%x%x)",function(yn)return string.char(tonumber(yn,16))end))end
if d1=="s"then return yl(d2)end if d1=="n"then return tonumber(d2)end if d1=="b"then return d2=="1"end if d1=="k"then return{__slot=d2}end
if d1=="t"then local pG={}for yo in d2:gmatch("[^,]+")do local pH,yp=yo:match("^(.-)=(.*)$")if pH then local pI=e.dec(pH)
if pI~=nil then pG[pI]=e.dec(yp)end end end return pG end return nil end function e.goneOrNew(yq)return function()
if not e.waiting then return true end local pJ=aa()return pJ~=nil and pJ~=yq end end function e.near()local pK=ah:FindFirstChild("Remotes")
local jD=pK and pK:FindFirstChild("CrateAction")local gh=ao()local jE=c.plot and c.plot:FindFirstChild("CrateStand")
local jF=jE and jE:FindFirstChild("Spot")if not(jD and gh and jF)then A(("crate: cannot open %s right now (%s)"):format(tostring(e.title),
not jD and"no CrateAction remote"or not gh and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local jG=gh.HumanoidRootPart local gi=jG.CFrame local pL,jH=e.title,"no answer"local yr=aa()local pM=jE:FindFirstChild("Holder")
local function pN()if not pM then return e.waiting or e.on end for Fj,ys in ipairs(pM:GetChildren())do if ys:IsA("Model")then return true end end
return false end for yt=1,3 do if not(e.waiting or e.on)or not pN()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end if(jG.Position-jF.Position).Magnitude>8 then b3(jF,e.prompt)end ae(0.12+0.15*yt)
local a3={}e.replaying=true task.spawn(function()a3 .ok,a3 .v=pcall(function()return jD:InvokeServer("open")end)
a3 .done=true end)ap(function()return a3 .done end,6)e.replaying=false local b7=a3 .v if a3 .done and a3 .ok and type(b7)=="table"and b7 .ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,y()+4 A(("OPENED %s -> %s (no window)"):format(pL,b7 .prize and ak(V(tostring(b7 .prize)))or"?"))
ap(function()local pO=aa()return pO~=nil and pO~=yr end,1.5)if(jG.Position-gi.Position).Magnitude>8 then pcall(function()aD(gh,gi.Position,gi.Position+gi.LookVector)end)end
return true,"opened"end jH=(a3 .done and a3 .ok and type(b7)=="table")and tostring(b7 .reason or"refused, no reason given")
or(a3 .done and("error: "..tostring(b7))or"no answer in 6s")ae(0.3)if not pN()then e.waiting,e.on,e.quietUntil=false,false,y()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 A(("crate: the server would not open %s next to the stand (%s)"):format(pL,jH))
return false,jH end e.GIVEUP=600 function e.drop()local pP=ah:FindFirstChild("Remotes")local pQ=pP and pP:FindFirstChild("CrateAction")
local pR=c.plot and c.plot:FindFirstChild("CrateStand")local jI=pR and pR:FindFirstChild("Spot")local pS=ao()
if jI and pS and(pS.HumanoidRootPart.Position-jI.Position).Magnitude>8 then b3(jI,e.prompt)ae(0.3)end local jJ,bh=false,nil
if pQ then jJ,bh=pcall(function()return pQ:InvokeServer("discard")end)end A(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(e.title),math.floor(e.GIVEUP/60),(jJ and type(bh)=="table"and bh.ok)and"done"or("answer: "..tostring(type(bh)=="table"and(bh.reason or bh.ok)or bh))))
e.waiting,e.on,e.quietUntil=false,false,y()+4 e.summonFails,e.nearFails,e.lastFail,e.at,e.prompt=0,0,0,nil,nil
if not(jJ and type(bh)=="table"and bh.ok)then dX(false)end end function e.smart()local jK=e.title if(e.nearFails or 0)<3 then
local yu=e.near()if yu then return true end if e.nearFails>=3 then A("opening next to the stand failed 3 times - trying the older ways")end
end local b8=e.learned if b8 then local jL=aa()if e.on then e.replay()if ap(e.goneOrNew(jL),3.5)then c.crates=c.crates+1
A("OPENED "..jK.." (direct)")return true end else if b8 .mode~="window"then e.replay()if ap(e.goneOrNew(jL),3.5)then
c.crates,e.fails=c.crates+1,0 if b8 .mode~="direct"then b8 .mode,aj.dirty="direct",true A("crates now open directly - the window never comes up")
end A("OPENED "..jK.." (direct, no window)")return true end end if jq()then e.replay()if ap(e.goneOrNew(jL),3.5)then
c.crates,e.fails=c.crates+1,0 if b8 .mode~="window"then b8 .mode,aj.dirty="window",true A("crates need their window up first - it shows briefly")
end A("OPENED "..jK.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,aj.dirty=b8,nil,true
if e.fails>=3 then e.directOff=true A("direct crate opening failed 3 times - using the button for now")else A("the learned crate call did not work - back to pressing Open")
end end return dX(true)end function D.snap()return{rules=H:GetAttribute("AutoRollRules"),stop=H:GetAttribute("AutoRollStop"),
on=H:GetAttribute("AutoRollOn"),main=H:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for yv,pT in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do Q(H:GetAttributeChangedSignal(pT):Connect(function()D.cache[yv]=H:GetAttribute(pT)end))
end end function D.isOn()return H:GetAttribute("AutoRollOn")==true end function D.saw(yw,...)local gj=D.cache
local yx={m=yw,n=select("#",...),args={...},before={rules=gj.rules,stop=gj.stop,on=gj.on,main=gj.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,yx)end end)end function D.learnOne(d3)local ax,d4=D.snap(),d3 .before local gk=(ax.rules~=d4 .rules)or(ax.stop~=d4 .stop)
local pU=(ax.on~=d4 .on)or(ax.main~=d4 .main)if not gk and not pU then return end local pV={}for pW=1,d3 .n do
local aM=d3 .args[pW]local b9=type(aM)if b9=="string"and aM~=""and aM==ax.rules then aM={__slot="rules"}elseif b9=="string"and aM~=""and gk and aM==ax.stop and ax.stop~=d4 .stop then aM={__slot="stop"}
elseif b9=="table"then local pX={}for yy,cO in pairs(aM)do if type(cO)=="table"or(type(cO)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end pX[yy]=(type(cO)=="string"and cO~=""and cO==ax.rules)and{__slot="rules"}or cO end aM=pX elseif b9~="string"and b9~="number"and b9~="boolean"and b9~="nil"then
if aM==H then aM={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end pV[pW]=aM
end local cP={m=d3 .m,n=d3 .n,args=pV}if gk then local jM=false for yz=1,cP.n do local d5=cP.args[yz]if type(d5)=="table"and d5 .__slot=="rules"then jM=true end
if type(d5)=="table"and not d5 .__slot then for Fk,pY in pairs(d5)do if type(pY)=="table"and pY.__slot=="rules"then jM=true end end
end end if jM then D.rec.rules={cP}else table.insert(D.rec.rules,cP)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if pU then if ax.on==true then D.rec.on=cP else D.rec.off=cP end d.AutoRoll=(ax.on==true)end if ax.rules and ax.rules~=""then d.ARrules,d.ARstop=ax.rules,ax.stop or""end
aj.dirty=true D.msg=""A(("learned an Auto Roll %s message"):format(gk and"choices"or(ax.on and"on"or"off")))end
function D.resolve(cQ)if type(cQ)~="table"then return cQ end if cQ.__slot=="rules"then return d.ARrules~=""and d.ARrules or H:GetAttribute("AutoRollRules")end
if cQ.__slot=="stop"then return d.ARstop~=""and d.ARstop or H:GetAttribute("AutoRollStop")end if cQ.__slot=="player"then return H end
local pZ={}for yA,yB in pairs(cQ)do pZ[yA]=D.resolve(yB)end return pZ end function D.replay(p0,yC)local p1=table.unpack or unpack
for Fl,d6 in ipairs(yC)do local jN={}for p2=1,d6 .n do jN[p2]=D.resolve(d6 .args[p2])end D.replaying=true pcall(function()
if d6 .m=="InvokeServer"then task.spawn(function()pcall(function()p0:InvokeServer(p1(jN,1,d6 .n))end)end)else p0:FireServer(p1(jN,1,d6 .n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(p3,yD)if D.busy or not c.alive then return end D.busy=true
pcall(function()local p4=ah:FindFirstChild("Remotes")local jO=p4 and p4:FindFirstChild("AutoRollAction")if not jO then D.msg="this game has no AutoRollAction"return end
local bC=d.AutoRoll if bC and d.ARrules~=""and H:GetAttribute("AutoRollRules")~=d.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"A(D.msg)else D.replay(jO,D.rec.rules)
if ap(function()return H:GetAttribute("AutoRollRules")==d.ARrules end,4)then A("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"A(D.msg)end end end if bC==D.isOn()or(not bC and not yD)then return end
local gl=bC and D.rec.on or D.rec.off if not gl then local d7=bC and D.rec.off or D.rec.on local p5=d7~=nil for yE=1,d7 and d7 .n or 0 do
if type(d7 .args[yE])=="boolean"then p5=false end end if p5 then gl=d7 end end if not gl then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bC and"on"or"off")
A(D.msg)return end D.replay(jO,{gl})if ap(function()return D.isOn()==bC end,4)then D.msg=""A(("Auto Roll switched %s%s"):format(bC and"ON"or"OFF",p3 and(" ("..p3 ..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"A(D.msg)end end)D.busy=false
end q.HS=game:GetService("HttpService")q.uid=(function()local yF,yG=pcall(function()return H.UserId end)return yF and yG or 0 end)()
q.buyMsg,q.wishMsg,q.wishN="","",0 function q.info()if q.I then return q.I end local yH,jP=pcall(function()return require(ah:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if yH and type(jP)=="table"and type(jP.Pets)=="table"then q.I=jP end return q.I end function q.order()if q.list then return q.list end
local bD=q.info()if not bD then return{}end local b_={}if type(bD.Order)=="table"and#bD.Order>0 then for Fm,p6 in ipairs(bD.Order)do if bD.Pets[p6]then b_[#b_+1]=p6 end end
else for yI in pairs(bD.Pets)do b_[#b_+1]=yI end table.sort(b_,function(yJ,yK)return(bD.Pets[yJ].price or 0)<(bD.Pets[yK].price or 0)end)
end q.list=b_ return b_ end function q.nice(p7,jQ)local p8=q.info()local p9=p8 and p8 .Pets[p7]return((jQ and jQ~="")and(jQ.." ")or"")..(p9 and p9 .displayName or tostring(p7))
end function q.data()local gm=H:GetAttribute("PetsData")if type(gm)~="string"then return nil end if gm==q.rawD then return q.lastD end
local yL,d8=pcall(function()return q.HS:JSONDecode(gm)end)d8=(yL and type(d8)=="table")and d8 or nil q.rawD,q.lastD=gm,d8
return d8 end function q.pen()return ah:FindFirstChild("PetMeadowSpawns")end function q.srv()return as:GetServerTimeNow()end
function q.money()local jR=H:FindFirstChild("MoneyValue")if jR and type(jR.Value)=="number"then return jR.Value end
return a8()or 0 end function q.wishes()local p_=q.pen()local qa=p_ and p_:GetAttribute("Wishes")local jS,qb={},q.srv()
if type(qa)~="string"then return jS end local yM,qc=pcall(function()return q.HS:JSONDecode(qa)end)if yM and type(qc)=="table"then
for yN,jT in pairs(qc)do if type(jT)=="number"and jT>qb then jS[yN]=jT-qb end end end return jS end function q.call(...)
local qe=ah:FindFirstChild("Remotes")local qf=qe and qe:FindFirstChild("PetRequest")if not qf then return nil end
local qg=table.pack(...)local ca={}task.spawn(function()ca.ok,ca.v=pcall(function()return qf:InvokeServer(table.unpack(qg,1,qg.n))end)
ca.done=true end)local yO=y()while not ca.done and y()-yO<6 do task.wait(0.05)end if ca.done and ca.ok then return ca.v end
return nil end function q.want(yP)return d.Pets[yP]end function q.closeNaming(jU)local qi=pcall(function()local qh=H:FindFirstChild("PlayerScripts")
local yQ=qh and qh:FindFirstChild("Naming",true)require(yQ).close()end)ae(0.5)if jU.Visible then pcall(function()local qj=jU:FindFirstChild("NameBox",true)if qj then qj:ReleaseFocus()end end)
jU.Visible=false qi=false end return qi end function q.skipNaming()q.namingUntil=y()+10 if q.namingOn then return end
q.namingOn=true task.spawn(function()while c.alive and y()<q.namingUntil do local qk=H:FindFirstChildOfClass("PlayerGui")
local ql=qk and qk:FindFirstChild("MainGui")local gn=ql and ql:FindFirstChild("PetNameGui")if gn and gn.Visible then
ae(0.4)if gn.Visible then q.namingShut=(q.namingShut or 0)+1 pcall(q.closeNaming,gn)break end end ae(0.25)end
q.namingOn=false end)end function q.buyTick()if not d.PetBuy then q.buyMsg="auto adopt is off"return end local jV,qm,go=q.info(),q.pen(),q.data()
if not(jV and qm and go)then q.buyMsg="pet data not loaded yet"return end q.tryAt=q.tryAt or{}local d9,jW=#(go.pets or{}),tonumber(go.maxOwned)or 60
local yR,qo,d_=q.srv(),{},nil for Fn,aS in ipairs(qm:GetChildren())do qo[aS.Name]=true local cb,gp=aS:GetAttribute("Pet"),aS:GetAttribute("Variant")or""
local jX=cb and q.want(cb)if jX and jX.b and jV.Pets[cb]and(not jX.g or gp=="Big")and C.wantMore(cb,gp,go)and not aS:GetAttribute("A_"..q.uid)
and(tonumber(aS:GetAttribute("ExpiresAt"))or 0)>yR+1 and y()>=(q.tryAt[aS.Name]or 0)then local ea,qp=q.nice(cb,gp),jV.Pets[cb].price or 0
if d9>=jW then d_=("%s is in the pen, but you have %d/%d pets"):format(ea,d9,jW)q.tryAt[aS.Name]=y()+15 elseif q.money()<qp then
d_=("%s is in the pen - need $%s"):format(ea,aL(qp))q.tryAt[aS.Name]=y()+5 else q.tryAt[aS.Name]=y()+8 local bE=q.call("adopt",aS.Name)
if type(bE)=="table"and bE.ok then d9=d9+1 q.buys=(q.buys or 0)+1 q.recent=q.recent or{}local yS=type(bE.pet)=="table"and bE.pet or{}
table.insert(q.recent,{id=tostring(yS.id or("?"..y())),name=cb,variant=gp,at=y()})if#q.recent>30 then table.remove(q.recent,1)end
A("ADOPTED "..ea)q.skipNaming()d_="adopted "..ea else local qq=type(bE)=="table"and tostring(bE.reason or"no reason given")or"no answer"
A(("adopt %s failed: %s"):format(ea,qq))d_="adopt failed: "..qq if type(bE)=="table"and bE.bagFull then q.tryAt[aS.Name]=y()+60 end
end end end end for qr in pairs(q.tryAt)do if not qo[qr]then q.tryAt[qr]=nil end end q.buyMsg=d_ or("watching the pen (%d/%d pets)"):format(d9,jW)
end function q.wishTick()if not d.PetWish then q.wishMsg="auto wish is off"return end local gq=q.info()if not(gq and q.pen())then q.wishMsg="pet data not loaded yet"return end
q.wishTry,q.wishWhy=q.wishTry or{},q.wishWhy or{}local gr,jY,bF=q.wishes(),0,nil local yT=(type(gq.Wish)=="table"and gq.Wish.cashShare)or 2
local yU=q.data()for Fo,aA in ipairs(q.order())do local qs=q.want(aA)if qs and qs.w and C.wantMore(aA,"",yU)then
jY=jY+1 if not gr[aA]and y()>=(q.wishTry[aA]or 0)then local jZ=tonumber(H:GetAttribute("PetWishCredits"))or 0
local j0=math.floor((gq.Pets[aA].price or 0)*yT)if jZ<=0 and q.money()<j0 then q.wishTry[aA]=y()+10 bF=("need $%s to wish for %s"):format(aL(j0),q.nice(aA))
q.wishWhy[aA]=bF else q.wishTry[aA]=y()+3 local yV=jZ>0 and"wishCredit"or"wish"local gs=q.call(yV,aA)if type(gs)=="table"and gs.ok then
q.wishN,q.wishWhy[aA]=q.wishN+1,nil A(("WISHED for %s (%s)"):format(q.nice(aA),jZ>0 and"free wish"or("$"..aL(j0))))
else local j1=type(gs)=="table"and tostring(gs.reason or"no reason given")or"no answer"if j1:lower():find("already",1,true)then q.wishTry[aA]=y()+2
else A(("wish %s failed: %s"):format(q.nice(aA),j1))bF="wish failed: "..j1 end end end end end end if not bF then
for Fp,gt in ipairs(q.order())do local qt=q.want(gt)if qt and qt.w and not gr[gt]and q.wishWhy[gt]then bF=q.wishWhy[gt]break end
end end if not bF then local gu={}for Fq,gv in ipairs(q.order())do local qu=q.want(gv)if qu and qu.w and gr[gv]then gu[#gu+1]=("%s %dm"):format(q.nice(gv),math.ceil(gr[gv]/60))end
end bF=jY==0 and"no pet has WISH ticked"or("running: "..(#gu>0 and table.concat(gu,", ")or"none yet"))end q.wishMsg=bF
end z.switches,z.glazed,z.finished=0,0,0 z.done,z.doneN,z.later={},0,{}function z.teams()local j2=q.data()return(j2 and j2 .teams)or{},j2
end function z.current(cR)cR=cR or q.data()if not cR then return""end local qv={}for Fr,yW in ipairs(cR.equipped or{})do qv[tostring(yW)]=true end
for Fs,qw in ipairs(cR.teams or{})do local qx=qw.pets or{}local j3=#qx==#(cR.equipped or{})if j3 then for Ft,yX in ipairs(qx)do if not qv[tostring(yX)]then j3=false break end end end
if j3 then return qw.name end end return""end function z.equip(j4)local yY,yZ=z.teams()local j5 for y0,y1 in ipairs(yY)do if y1 .name==j4 then j5=y0 break end end
if not j5 then z.msg="no saved team called "..tostring(j4)return false end if z.current(yZ)==j4 then return true end
for Fu=1,4 do local qy=q.call("teamEquip",j5)if type(qy)=="table"and qy.ok then z.switches=z.switches+1 return true
end task.wait(0.4)end return false end function z.left(y2)local qz=y2:FindFirstChild("SquishyPlaceHolder")local qA=qz and qz:FindFirstChild("TimerGui")
local qB=qA and qA:FindFirstChildWhichIsA("TextLabel",true)local j6=qB and qB.Text if type(j6)~="string"or j6:find("-",1,true)then return nil end
local j7,qC,qD=j6:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not j7 then return nil end local qE=qD~=""and(tonumber(j7)*3600+tonumber(qC)*60+tonumber(qD))or(tonumber(j7)*60+tonumber(qC))
return qE>0 and qE or nil end function z.waxes()local eb={}local qF=c.plot and c.plot:FindFirstChild("WaxStations")
if not qF then return eb end local qG=q.srv()for Fv,a4 in ipairs(qF:GetChildren())do local j8=tonumber(a4:GetAttribute("PourEnd"))
local qH=a4:GetAttribute("PourOwner")if a4:GetAttribute("HasSquishy")and a4:GetAttribute("PourId")and(qH==nil or qH==q.uid)then
local j9=z.left(a4)local qI=j9 and(qG+j9)or((j8 and j8>qG)and j8 or nil)if qI then local qJ,qK=a4:FindFirstChild("SquishyPlaceHolder"),"?"
if qJ then for Fw,qL in ipairs(qJ:GetChildren())do if qL:IsA("Model")then qK=qL.Name break end end end local y3=tostring(a4:GetAttribute("Helpers")or"")
local j_=0 for Fx in y3:gmatch("%d+")do j_=j_+1 end eb[#eb+1]={st=a4,ends=qI,sure=j9~=nil,id=a4:GetAttribute("PourId"),name=qK,helps=j_,
long=a4:GetAttribute("PourLong")==true}end end end table.sort(eb,function(y4,y5)return y4 .ends<y5 .ends end)
return eb end function z.glazeCount()local qM=ah:FindFirstChild("Remotes")local qN=qM and qM:FindFirstChild("EditStack")
if not qN then return nil end local y6,ec=pcall(function()return qN:InvokeServer("State",nil)end)if not(y6 and type(ec)=="table"and type(ec.state)=="table")then return nil end
local ka,kb=0,{}for Fy,gw in ipairs(ec.state.entries or{})do if gw.glaze and gw.glaze~=""then ka=ka+1 kb[gw.glaze]=(kb[gw.glaze]or 0)+1 end
end return ka,kb,#(ec.state.entries or{}),ec.state.capacity end function z.finishedOne(gx,qO)z.finished=z.finished+1
task.wait(2)local kc,y7,qP,y8=z.glazeCount()if kc and qO and kc>qO then z.glazed=z.glazed+1 local kd={}for y9,y_ in pairs(y7)do kd[#kd+1]=y9 .." "..y_ end
A(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(V(gx.name)),gx.st.Name,kc,table.concat(kd,", ")))
else A(("wax done on station %s: %s, no glaze%s"):format(gx.st.Name,ak(V(gx.name)),qP and(" (stack "..qP.."/"..tostring(y8)..")")or""))
end end function z.tick()z.list=z.waxes()if z.editing and y()-(z.editingSince or y())>120 then z.editing=false end
if z.editing then z.msg="rebuilding teams..."return end if not d.Teams then z.want,z.msg="","auto teams is off"return end
local cc=q.srv()local aF=z.glazeFor if aF then local ed=aF.st local qQ=ed.Parent and ed:GetAttribute("HasSquishy")and ed:GetAttribute("PourId")==aF.id
local qR=qQ and z.left(ed)if qR then aF.ends=cc+qR end if not qQ then z.glazeFor,z.afterUntil=nil,y()+1.5 if not z.done[aF.id or"?"]then
z.done[aF.id or"?"],z.doneN=true,z.doneN+1 if z.doneN>400 then z.done,z.doneN={[aF.id or"?"]=true},1 end local za=aF.before
task.spawn(function()pcall(z.finishedOne,aF,za)end)end elseif aF.ends-cc>d.GlazeLead*3+60 or cc>aF.ends+90 then
z.glazeFor,z.afterUntil=nil,y()+1.5 z.later[aF.id or"?"]=y()+120 A(("station %s is not finishing yet (%s left) - glaze team off again"):format(ed.Name,z.clock(aF.ends-cc)))
end end if d.TeamGlaze~=""and not z.glazeFor then local zb=z.speedRatio(d.TeamGlaze)for Fz,cd in ipairs(z.list)do
if cd.sure and(cd.ends-cc)*zb[cd.long and 2 or 1]<=d.GlazeLead and y()>=(z.later[cd.id or"?"]or 0)and not z.done[cd.id or"?"]then
z.glazeFor=cd task.spawn(function()cd.before=z.glazeCount()end)break end end end local aG,ee="",""local cS=d.SnapGlaze~=false and o.snapAt and(o.snapAt-cc)
if cS and cS<-8 then o.snapAt,cS=nil,nil end if d.TeamGlaze~=""and cS and cS<=20 then aG,ee=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cS)))
elseif d.TeamGlaze~=""and(z.glazeFor or y()<(z.afterUntil or 0))then aG,ee=d.TeamGlaze,z.glazeFor and(" - station "..z.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(z.placing or z.aboutToPlace())then aG,ee=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and z.allBusy()then
aG,ee=d.TeamFull," - every station is busy"else aG=d.TeamNormal end z.want=aG local ef=z.current()z.cur=ef if aG~=""and ef~=aG and y()>=(z.nextTry or 0)then
z.nextTry=y()+1.1 if z.equip(aG)then A("team: "..aG..ee)else z.nextTry=y()+3 end end local ke=z.list[1]z.msg=("on: %s%s | next wax done %s"):format(ef~=""and ef or"(not a saved team)",(aG~=""and aG~=ef)and(" -> "..aG)or"",
ke and("in "..z.clock(ke.ends-cc).." (st "..ke.st.Name..")")or"- none running")end function z.clock(bG)bG=math.max(0,math.floor(bG))
if bG>=3600 then return("%d:%02d:%02d"):format(math.floor(bG/3600),math.floor((bG%3600)/60),bG%60)end return("%d:%02d"):format(math.floor(bG/60),bG%60)
end function z.allBusy()local zc,zd=fo()return zd>0 and zc==0 end function z.aboutToPlace()if not c.running then return false end
local qS=aa()if not(qS and aK(qS))then return false end local ze=fo()return ze>0 end function z.mult(qT,zf,qU)return{(1+qT)*(1+qU),(1+qT+zf)*(1+qU)}end
function z.speedNow()local function kf(zg)return tonumber(H:GetAttribute(zg))or 0 end return z.mult(kf("PetWaxSpeed"),kf("PetLongWax"),kf("PetSocialWax"))
end function z.speedOf(zh)local zi,qV=z.teams()if not qV then return nil end for FA,qW in ipairs(zi)do if qW.name==zh then
local kg={}for FB,zj in ipairs(qW.pets or{})do for FC,qX in ipairs(qV.pets or{})do if tostring(qX.id)==tostring(zj)then kg[#kg+1]=qX break end end
end local qY=C.caps()local qZ,zk=C.stats(kg)return z.mult(math.min(qZ.waxSpeed or 0,qY.waxSpeed or 0.25),math.min(qZ.longWax or 0,qY.longWax or 0.3),zk.socialWax or 0)
end end return nil end function z.speedRatio(zl)local q0,kh=z.speedNow(),z.speedOf(zl)if not kh then return{1,1}end
return{q0[1]/kh[1],q0[2]/kh[2]}end function z.glazeSoon()return d.Teams and d.TeamGlaze~=""and(z.glazeFor~=nil or y()<(z.afterUntil or 0))
end C.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
C.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}C.buildMsg,C.fuseMsg,C.fused,C.builds="","",0,0
function C.need()return H:GetAttribute("FusePass")==true and 3 or 7 end function C.caps()local ki=q.info()return(ki and type(ki.Caps)=="table")and ki.Caps or C.CAPS
end function C.value(q1,kj)local gy=q.info()local cT=gy and gy.Pets[q1]if not(cT and type(cT.boost)=="table")then return nil end
local ce if type(gy.boostValue)=="function"then local zm,zn=pcall(gy.boostValue,q1,(kj~=""and kj)or nil)ce=zm and tonumber(zn)or nil
end if not ce then ce=cT.boost.value or 0 if kj=="Big"then local q2=ce*1.5 ce=C.ROUND[cT.boost.kind]and math.max(ce+1,math.floor(q2+0.5))or q2
end end return cT.boost.kind,ce,cT.boost.every end function C.stats(zo)local cf,kk={},{}for FD,q3 in ipairs(zo)do
local aT,gz,q4=C.value(q3 .name,q3 .variant or"")if aT then if aT:sub(1,6)=="social"then kk[aT]=math.max(kk[aT]or 0,gz)
elseif aT=="waxStir"or aT=="cashGift"then cf[aT]=(cf[aT]or 0)+gz*60/(q4 or 60)elseif aT=="luckyPull"then cf.luckyPull=(cf.luckyPull or 0)+gz/(q4 or 10)
else cf[aT]=(cf[aT]or 0)+gz end end end return cf,kk end function C.glazeGain(zp,gA)local eg,kl,FE={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local zq=eg[1]+eg[2]+eg[3]local zr=tonumber(H:GetAttribute("GuildUpGlaze"))or 0 local cU={}for gB=1,3 do cU[gB]=eg[gB]+zp*eg[gB]/zq+(gB==1 and zr or 0)end
local km={cU[1]*(1-gA),cU[2]*(1-gA)+cU[1]*gA,cU[3]+cU[2]*gA}return km[1]*(kl[1]-1)+km[2]*(kl[2]-1)+km[3]*(kl[3]-1)
end function C.score(gC,zs)local kn=C.caps()local gD,gE=C.stats(zs)local function bi(q5)return math.min(gD[q5]or 0,kn[q5]or math.huge)end
local zt=(1+bi("income"))*(1+(gE.socialIncome or 0))*(1+math.min(gD.cashGift or 0,kn.cashGiftPerMinute or 9)/60)
local zu=1+bi("luck")+(gD.luckyPull or 0)+(gE.socialLuck or 0)local q6=zu*(1+bi("newFind"))*(1+bi("rollSpeed"))
local eh=math.log(zt)local zv=math.max(tonumber(H:GetAttribute("WaxStations"))or 18,1)local ko=(1+bi("waxSpeed")+bi("longWax"))*(1+(gE.socialWax or 0))
+math.min(gD.waxStir or 0,kn.waxStirPerMinute or 30)/60/zv local zw=1-(1-bi("headStart"))*(1-(gE.socialHeadStart or 0))
if gC=="farm"then return eh+0.7*math.log(q6)+0.1*math.log(ko)end if gC=="full"then return eh+0.4*math.log(ko)+0.02*math.log(q6)end
if gC=="glaze"then return C.glazeGain(bi("glaze"),bi("glazeUp"))+0.001*eh end if gC=="wax"then return-math.log(1-0.5*zw)+0.001*eh+0.001*math.log(ko)end
return eh end function C.best(q7,cV,zx,kp)kp=kp or{}local ay,ei={},{}local function q8(zy)local q9={}for zz,zA in ipairs(zy)do q9[zz]=cV[zA]end return q9 end
local function kq(q_)local kr=C.score(q7,q8(q_))for FF,zB in ipairs(q_)do if kp[cV[zB].id]then kr=kr+1e-7 end end
return kr end for FG=1,math.min(zx,#cV)do local gF,ks for kt=1,#cV do if not ei[kt]then ay[#ay+1]=kt local ra=kq(ay)
ay[#ay]=nil if not ks or ra>ks+1e-12 then gF,ks=kt,ra end end end if not gF then break end ei[gF]=true ay[#ay+1]=gF
end for FH=1,6 do task.wait()local rb,rc=false,kq(ay)for ku=1,#ay do for kv=1,#cV do if not ei[kv]then local rd=ay[ku]
ay[ku]=kv local re=kq(ay)if re>rc+1e-9 then ei[rd],ei[kv],rc,rb=nil,true,re,true else ay[ku]=rd end end end end
if not rb then break end end local rf={}for zC,zD in ipairs(ay)do rf[zC]=tostring(cV[zD].id)end return rf,C.score(q7,q8(ay))
end function C.count(rg,rh,zE)local ej,ek={},0 local ri,rj={},{}for FI,zF in ipairs(rh.arriving or{})do ri[tostring(zF)]=true end
for FJ,cW in ipairs(rh.pets or{})do rj[tostring(cW.id)]=true if cW.name==rg and not ri[tostring(cW.id)]then if cW.variant=="Big"then ek=ek+1 elseif(cW.variant or"")==""then ej[#ej+1]=cW end
end end if not zE then for FK,el in ipairs(q.recent or{})do if el.name==rg and not rj[el.id]and y()-el.at<20 then
if el.variant=="Big"then ek=ek+1 else ej[#ej+1]=el end end end end return ej,ek end function C.goal(zG)local rk=d.Pets[zG]return rk and tonumber(rk.f)or 0 end
function C.wantMore(rl,zH,rm)local kw=C.goal(rl)if kw<=0 or not rm then return true end local zI,rn=C.count(rl,rm)
if rn>=kw then return false end if zH=="Big"then return true end return#zI<C.need()*(kw-rn)end function C.status(ro,rp)
local gG=C.goal(ro)if gG<=0 or not rp then return nil end local zJ,kx=C.count(ro,rp)if kx>=gG then return("Big %d/%d done"):format(kx,gG)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#zJ,C.need()),C.need(),kx,gG)end function C.wear(ky)local kz={}
for FL,zK in ipairs(ky)do kz[tostring(zK)]=true end for FM=1,3 do local cX=q.data()if not cX then return false end
for FN,rq in ipairs(cX.equipped or{})do if not kz[tostring(rq)]then q.call("unequip",rq)task.wait(0.3)end end
cX=q.data()local rr={}for FO,zL in ipairs(cX.equipped or{})do rr[tostring(zL)]=true end for FP,rs in ipairs(ky)do
if not rr[tostring(rs)]then q.call("equip",rs)task.wait(0.3)end end task.wait(0.4)cX=q.data()local kA,rt=0,true
for FQ,zM in ipairs(cX.equipped or{})do kA=kA+1 if not kz[tostring(zM)]then rt=false end end if rt and kA==#ky then return true end
end return false end function C.saveTeam(ru,rv)if not C.wear(rv)then return false,"could not put the pets on"end
local zN=z.teams()local cg for zO,zP in ipairs(zN)do if zP.name==ru then cg=zO break end end local cY if cg then
cY=q.call("teamSave",cg)else cY=q.call("teamNew")if type(cY)=="table"and cY.ok and cY.index then cg=cY.index task.wait(0.3)
q.call("teamRename",{index=cg,name=ru})end end task.wait(0.4)local kB=q.data()local rw=kB and kB.teams and cg and kB.teams[cg]
if not rw then return false,"the game did not save it"end local rx={}for FR,zQ in ipairs(rw.pets or{})do rx[tostring(zQ)]=true end
for FS,zR in ipairs(rv)do if not rx[tostring(zR)]then return false,"saved, but not with these pets"end end return true
end C.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function C.quiet()
if z.placing or z.glazeSoon()then return false end local zS=q.srv()for FT,zT in ipairs(z.list or{})do if zT.ends-zS<(d.GlazeLead or 45)+90 then return false end end
return true end function C.plan()local em=q.data()if not em then return{}end local ry={}for FV,zU in ipairs(em.arriving or{})do ry[tostring(zU)]=true end
local en={}for FW,gH in ipairs(em.pets or{})do if not ry[tostring(gH.id)]then en[#en+1]={id=tostring(gH.id),name=gH.name,variant=gH.variant or""}end
end local rz={}for FX,rA in ipairs(en)do rz[rA.id]=rA end local rB=tonumber(em.slots)or 3 local kC,rC={},{}for FY,gI in ipairs(C.ROLES)do
local eo=d[gI[1]]if eo~=""and not rC[eo]then rC[eo]=true local kD,ep,rD={},{},false for FZ,rE in ipairs(em.teams or{})do
if rE.name==eo then for F0,zV in ipairs(rE.pets or{})do local kE=rz[tostring(zV)]if kE then kD[kE.id]=true ep[#ep+1]=kE else rD=true end
end end end local kF,rF=C.best(gI[2],en,rB,kD)local rG=C.score(gI[2],ep)local rH=#kF==#ep for F1,zW in ipairs(kF)do if not kD[zW]then rH=false end end
if not rH and(rD or#ep<math.min(rB,#en)or rF>rG+1e-4)then kC[#kC+1]={team=eo,role=gI[2],ids=kF,gain=rF-rG}end
end end return kC end function C.rebuild(zX)local rI=C.plan()if#rI==0 then C.buildMsg="teams are already the best your pets allow"return true end
if not C.quiet()then C.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end z.editing,z.editingSince=true,y()
local gJ=true local z1,z2=pcall(function()for F2,eq in ipairs(rI)do local zY,zZ=C.saveTeam(eq.team,eq.ids)local rJ=q.data()
local kG={}for F3,z0 in ipairs(eq.ids)do for F4,kH in ipairs(rJ and rJ.pets or{})do if tostring(kH.id)==z0 then kG[#kG+1]=q.nice(kH.name,kH.variant)end
end end if zY then A(("TEAM %s rebuilt (%s): %s"):format(eq.team,zX or"pets changed",table.concat(kG,", ")))else gJ=false A(("TEAM %s: %s"):format(eq.team,tostring(zZ)))end
end end)z.editing,z.nextTry=false,0 if not z1 then gJ=false A("TEAM BUILD ERR "..tostring(z2))end C.builds=C.builds+1
C.buildMsg=gJ and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gJ end
function C.fuseTick()if not d.AutoFuse or z.editing then return end local gK=q.data()if not gK then return end
local kI=C.need()local kJ,gL={},{}for F5,z3 in ipairs(gK.teams or{})do for F6,z4 in ipairs(z3 .pets or{})do kJ[tostring(z4)]=true end end
for F7,z5 in ipairs(gK.equipped or{})do gL[tostring(z5)]=true end C.failUntil=C.failUntil or{}for cj,z6 in pairs(d.Pets)do
local rK=tonumber(z6 .f)or 0 local kK,z7=C.count(cj,gK,true)if rK>0 and z7<rK and#kK>=kI and y()>=(C.failUntil[cj]or 0)then
table.sort(kK,function(gM,gN)local rL=(gL[tostring(gM.id)]and 4 or 0)+(kJ[tostring(gM.id)]and 2 or 0)+(gM.named and 1 or 0)
local rM=(gL[tostring(gN.id)]and 4 or 0)+(kJ[tostring(gN.id)]and 2 or 0)+(gN.named and 1 or 0)if rL~=rM then return rL<rM end
return tostring(gM.id)<tostring(gN.id)end)local gO,kL={},{}for gP=1,kI do gO[gP]=tostring(kK[gP].id)if gL[gO[gP]]then kL[#kL+1]=gO[gP]end
end z.editing,z.editingSince=true,y()for F8,z8 in ipairs(kL)do q.call("unequip",z8)task.wait(0.3)end local gQ=q.call("fuse",{ids=gO})
z.editing,z.nextTry=false,0 if type(gQ)=="table"and gQ.ok then C.fused=C.fused+1 C.dirtyAt=y()A(("FUSED %d %s -> Big %s"):format(kI,q.nice(cj),q.nice(cj)))
C.fuseMsg=("fused a Big %s %s"):format(q.nice(cj),os.date("%H:%M"))else C.failUntil[cj]=y()+120 A(("fuse %s failed: %s"):format(q.nice(cj),type(gQ)=="table"and tostring(gQ.reason or"no reason given")or"no answer"))
end return end end end function C.tick()pcall(C.fuseTick)if not d.AutoBuild or not d.Teams then return end local rN=q.data()
if not rN then return end local ck={}for F9,z9 in ipairs(rN.pets or{})do ck[#ck+1]=tostring(z9 .id)end table.sort(ck)
ck=table.concat(ck,",")if ck~=C.sig then C.sig,C.dirtyAt=ck,y()end local z_=(C.dirtyAt and y()-C.dirtyAt>8)or y()-(C.lastBuild or 0)>900
if z_ and not z.editing then local Aa=C.rebuild(C.dirtyAt and"pets changed"or"check")if Aa then C.dirtyAt,C.lastBuild=nil,y()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(cl)return cl:IsA("ParticleEmitter")or cl:IsA("Trail")or cl:IsA("Beam")or cl:IsA("Fire")or cl:IsA("Smoke")
or cl:IsA("Sparkles")or cl:IsA("Light")end function j.muteOne(aH)if not d.Lite or not aH.Parent then return end
local gR=(aH:IsA("BillboardGui")and j.bb)or(j.isFx(aH)and j.fx)or nil if not gR or gR[aH]~=nil then return end
gR[aH]=aH.Enabled if aH.Enabled then aH.Enabled=false end j.watch[aH]=aH:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aH.Enabled then gR[aH]=true aH.Enabled=false end end)end function j.lite(rO)d.Lite=rO if rO then
task.spawn(function()for Ab,Ac in ipairs(as:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,Ac)
if Ab%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=Q(as.DescendantAdded:Connect(function(kM)
if d.Lite and(kM:IsA("BillboardGui")or j.isFx(kM))then j.queue[#j.queue+1]=kM end end))end local kN=game:GetService("Lighting")
for F_,er in ipairs(kN:GetChildren())do if er:IsA("PostEffect")and er.Enabled and j.post[er]==nil then j.post[er]=true er.Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and kN.GlobalShadows or j.oldShadows kN.GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and as.Terrain.Decoration or j.oldDeco as.Terrain.Decoration=false end)
else for Ga,Ad in pairs(j.watch)do pcall(function()Ad:Disconnect()end)end for rP,Ae in pairs(j.bb)do pcall(function()if rP.Parent then rP.Enabled=Ae end end)end
for rQ,Af in pairs(j.fx)do pcall(function()if rQ.Parent then rQ.Enabled=Af end end)end for rR in pairs(j.post)do pcall(function()if rR.Parent then rR.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local Ag=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()Ag.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()as.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(rS)d.HideHud=rS local kO=H:FindFirstChildOfClass("PlayerGui")if not kO then return end if rS then
for Gb,es in ipairs(kO:GetChildren())do if es:IsA("ScreenGui")and not j.MINE[es.Name]and es.Enabled then j.hud[es]=true es.Enabled=false end
end if not j.hudConn then j.hudConn=Q(kO.ChildAdded:Connect(function(et)if d.HideHud and et:IsA("ScreenGui")and not j.MINE[et.Name]then
task.defer(function()if d.HideHud and et.Enabled then j.hud[et]=true et.Enabled=false end end)end end))end else
for rT in pairs(j.hud)do pcall(function()if rT.Parent then rT.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(kP)d.FpsCap=kP local rU=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not rU then return false end return pcall(rU,kP==0 and 60 or kP)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(an)if an:IsA("BasePart")or an:IsA("Decal")or an:IsA("Texture")then if an.Transparency<1 then j.unseen[an]=an.Transparency an.Transparency=1 end
elseif an:IsA("BillboardGui")or an:IsA("SurfaceGui")or an:IsA("ParticleEmitter")or an:IsA("Beam")or an:IsA("Trail")or an:IsA("Light")or an:IsA("Fire")or an:IsA("Smoke")or an:IsA("Sparkles")then
if an.Enabled then j.unseen[an]=true an.Enabled=false end end end function j.notMine(Ah)return d.HideMine or(c.plot and not Ah:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(rV)if d.HideBases then j.bases(false)end d.HideMine=rV==2 if rV>0 then j.bases(true)end end
function j.bases(rW)d.HideBases=rW local kQ=as:FindFirstChild("Plots")if not kQ then return end if rW then task.spawn(function()
local kR=0 for Gc,rX in ipairs(kQ:GetChildren())do if rX~=c.plot or d.HideMine then for Gd,Ai in ipairs(rX:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,Ai)kR=kR+1 if kR%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=Q(kQ.DescendantAdded:Connect(function(rY)if d.HideBases and j.notMine(rY)then task.defer(function()pcall(j.hideOne,rY)end)end
end))end else for kS,rZ in pairs(j.unseen)do pcall(function()if not kS.Parent then return end if type(rZ)=="number"then kS.Transparency=rZ else kS.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(r0)d.NoRender=r0 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not r0)end)
end j.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
j.calmed={}function j.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local Aj=game:GetService("RunService")
local kT=0 for Ge,Ak in ipairs({"RenderStepped","Heartbeat","Stepped"})do local Al,r1=pcall(function()return Aj[Ak]end)
local r2,kU=false,nil if Al and r1 then r2,kU=pcall(getconnections,r1)end if r2 and type(kU)=="table"then for Gf,kV in ipairs(kU)do
local kW=""pcall(function()local r3=getfenv(kV.Function).script kW=r3 and r3:GetFullName()or""end)if kW~=""then
for Gg,Am in ipairs(j.CALM)do if kW:find(Am,1,true)then if pcall(function()kV:Disable()end)then j.calmed[#j.calmed+1]=kV kT=kT+1 end
break end end end end end end if#j.calmed>200 then local kX={}for An=#j.calmed-49,#j.calmed do kX[#kX+1]=j.calmed[An]end j.calmed=kX
end return kT end function j.calm(r4)d.Calm=r4 if r4 then local Ao=j.calmScan()A(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(Ao))
else for Gh,Ap in ipairs(j.calmed)do pcall(function()Ap:Enable()end)end j.calmed={}end end function j.restoreAll()
pcall(j.unpin)pcall(j.calm,false)if d.HideBases then pcall(j.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(r5)if c.rejoining then return end A("REJOIN this server ("..r5 ..")")
pcall(fr)if c.autoload then pcall(fS,c.autoload)end oj()local Aq=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,H)
end)task.delay(25,function()if c.alive then dG(r5 ..", same server failed")end end)return Aq end function j.tick()
local kY=j.queue if d.Lite and kY and#kY>0 then j.queue={}for Ar,As in ipairs(kY)do pcall(j.muteOne,As)if Ar%300==0 then task.wait()end end
end local r6=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if r6 then for Gi,At in ipairs(r6:GetChildren())do
local r7=At:FindFirstChild("SquishyPlaceHolder")local cm=r7 and r7:FindFirstChild("TimerGui")if cm and cm:IsA("BillboardGui")then
if j.bb[cm]==nil then pcall(j.muteOne,cm)elseif cm.Enabled then j.bb[cm]=true cm.Enabled=false end end end end
local Au,eu=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Au and type(eu)=="number"then
j.mem=eu j.memPeak=math.max(j.memPeak,eu)if(d.MemLimit or 0)>0 and eu>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(eu,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if y()-(j.noteAt or 0)>1800 then j.noteAt=y()A(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function kZ(gS)if type(gS)~="string"then return false end
gS=gS:lower()for Gj,Av in ipairs(c.sellWords)do if gS:find(Av,1,true)then return true end end return false end
local function Aw()local r8=ah:FindFirstChild("Remotes")local k0=r8 and r8:FindFirstChild("SellSquishy")if not(k0 and k0:IsA("RemoteEvent"))then return false end
if not pcall(function()k0:FireServer()end)then return false end return ap(function()return aa()==nil end,1.5)
end local function Ax()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if y()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=y()local r9=ao()local r_=r9 and r9 .HumanoidRootPart.Position local ev,sa for Gk,cZ in ipairs((c.plot or as):GetDescendants())do
if cZ:IsA("ProximityPrompt")and(kZ(cZ.ActionText)or kZ(cZ.ObjectText)or kZ(cZ.Name))then local sb=nh(cZ)local k1=(sb and r_)and(sb-r_).Magnitude or 1e9
if k1<=400 and(not ev or k1<sa)then ev,sa=cZ,k1 end end end c.sellSpot=ev c.noSellSpot=(ev==nil)return ev end
local function sc()local k2=aa()if not k2 then c.holding=false return false end if aK(k2)then return false end
local k3=ak(V(k2))if Aw()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=y()+2.5,0
A("SOLD "..k3)return true end local c0=Ax()if c0 then local sd=dt(c0)if sd then b3(sd,c0)local se=aa()if se and not aK(se)then
local Ay,Az=dM(c0,function()return aa()==nil end,function()return c0 .Enabled end)if Ay then c.sold,c.holding,c.sellFails=c.sold+1,false,0
A(("SOLD %s at %s via %s"):format(k3,fm(c0),Az))return true end end end end c.sellFails=c.sellFails+1 A("could not sell "..k3 .." ("..c.sellFails..")")
return false end local AA={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function AB(c1)local gT=fm(c1):lower()for Gl,AC in ipairs(AA)do if gT:find(AC,1,true)then return 0 end end
local a5,aq=c1 .Name:lower(),0 local function aU(AD,AE)return AD:find(AE,1,true)~=nil end if aU(a5,"collect")then aq=aq+60 end
if aU(a5,"cash")or aU(a5,"money")then aq=aq+45 end if aU(a5,"income")or aU(a5,"claim")then aq=aq+35 end if aU(a5,"coin")or aU(a5,"earn")or aU(a5,"green")then aq=aq+20 end
if a5=="pad"or a5=="touch"then aq=aq+25 end if aq==0 and(aU(gT,"collect")or aU(gT,"cash")or aU(gT,"money"))then aq=25 end
if aq==0 then return 0 end local ew=c1 .Color if ew.G>0.5 and ew.G>ew.R*1.4 and ew.G>ew.B*1.4 then aq=aq+15 end
if math.min(c1 .Size.X,c1 .Size.Y,c1 .Size.Z)<2 then aq=aq+5 end return aq end local function AF()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or y()-c.padSearchAt<20 then return nil end c.padSearchAt=y()local gU,ex,k4={},nil,29 for Gm,gV in ipairs(c.plot:GetDescendants())do
if gV:IsA("BasePart")then local gW=AB(gV)if gW>0 then gU[#gU+1]={s=gW,p=gV}if gW>k4 then ex,k4=gV,gW end end end
end table.sort(gU,function(AG,AH)return AG.s>AH.s end)c.padCands,c.padPart=gU,ex if ex then A("collect pad: "..fm(ex).." (score "..k4 ..")")end
return ex end local k5="SAB_pad_v1.txt"local function AI(AJ)if type(writefile)=="function"then pcall(writefile,k5,table.concat({AJ:GetComponents()},","))end
end local function AK()if type(isfile)~="function"or type(readfile)~="function"then return nil end local AL,sf=pcall(function()if isfile(k5)then return readfile(k5)end end)
if not AL or type(sf)~="string"then return nil end local gX={}for AM in sf:gmatch("[^,]+")do gX[#gX+1]=tonumber(AM)end
if#gX==12 then return CFrame.new(unpack(gX))end end local function AN(k6,gY,AO)local AP=cJ(k6)local k7=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aV=(k7 and k7:IsA("BasePart"))and(k7 .Position-gY)or Vector3 .new(1,0,0)aV=Vector3 .new(aV.X,0,aV.Z)if aV.Magnitude<0.05 then aV=Vector3 .new(1,0,0)end
aV=aV.Unit for AQ=0,7 do local gZ=AQ*math.pi/4 local AS=Vector3 .new(aV.X*math.cos(gZ)-aV.Z*math.sin(gZ),0,aV.X*math.sin(gZ)+aV.Z*math.cos(gZ))
local g0=gY+AS*(AO+5)local k8=f0(g0 .X,gY.Y,g0 .Z)if k8 and math.abs(k8 .Y-gY.Y)<8 then aD(k6,Vector3 .new(g0 .X,k8 .Y+AP,g0 .Z))
if i8(k6,0.7)then return true end end end return false end local function AT()c.lastCollect=y()local ey=ao()if not ey then return end
local sh,AU=ey.HumanoidRootPart,cJ(ey)local ez,sj,eA,k9=nil,4,nil,"?"local k_=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and k_ and k_:IsA("BasePart")then ez,k9=(k_.CFrame*c.manualPad).Position,"manual pad"else local bj=AF()
if bj then ez=Vector3 .new(bj.Position.X,bj.Position.Y+bj.Size.Y/2+AU,bj.Position.Z)sj,eA,k9=math.max(bj.Size.X,bj.Size.Z)/2,bj,bj.Name
end end if not ez then A("COLLECT: pad not found - stand on it and tap SET PAD")return end local la=a8()aD(ey,ez)
if eA and type(firetouchinterest)=="function"then pcall(firetouchinterest,sh,eA,0)end ae(d.PadDwell)if eA and type(firetouchinterest)=="function"then pcall(firetouchinterest,sh,eA,1)end
ae(0.5)c.collected=c.collected+1 local lb=a8()A(("COLLECTED (%s) %s"):format(k9,(la and lb and lb>la)and("+$"..aL(lb-la))or"no cash change seen"))
AN(ey,ez,sj)end o.disc,o.need,o.best,o.waxing,o.order,o.placedAt=nil,{},{},{},{},{}o.discAt,o.modAt,o.sentAt,o.msg,o.nNeed,o.nWax,o.fails=-100,-100,-100,"",0,0,0
function o.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function o.mods()if o.si and y()-o.modAt<120 then return true end
local sk=ah:FindFirstChild("Modules")if not sk then return false end local function lc(AV)local sl=sk:FindFirstChild(AV)
if not sl then return nil end local AW,sm=pcall(require,sl)return(AW and type(sm)=="table")and sm or nil end o.si,o.arm,o.ci=lc("SquishyInfo"),lc("AutoRollRules"),lc("CrateInfo")
o.modAt=y()if not o.si then return false end local ld={}if o.arm and type(o.arm.tierOf)=="table"then for le in pairs(o.arm.tierOf)do
local g1=o.si[le]if type(g1)=="table"and g1 .rarity~="Limited"and not g1 .incomeType and not g1 .hiddenAfter then ld[V(le)]=le end
end end o.roll=ld local g2={}for AX,AY in pairs(ld)do local eB=o.si[AY]if type(eB)=="table"and type(eB.income)=="number"and not eB.incomeType then
g2[#g2+1]={k=AX,inc=eB.income,pr=tonumber(eB.price)or 0}end end table.sort(g2,function(lf,lg)if lf.inc~=lg.inc then return lf.inc>lg.inc end return lf.pr>lg.pr end)
o.order=g2 local g3,lh,li local AZ=(o.ci and type(o.ci.crates)=="table")and o.ci.crates or{}for A0,lj in pairs(AZ)do
local lk=type(lj)=="table"and tonumber(lj.price)if lk and(not lh or lk>lh)then g3,lh,li=A0,lk,lj.title end end
o.bestCrate,o.bestCrateName=g3 and L.key(g3),g3 o.bestCrateTitle=li and L.key(li)or nil return true end function o.rank(A1)
local A2,A3=pcall(function()return o.arm.rankOf(A1)end)return(A2 and tonumber(A3))or 0 end function o.loadDisc(sn)
if type(sn)~="table"then return end local so={}for A4,A5 in pairs(sn)do if A5 then so[V(tostring(A4))]=true end end
o.disc,o.discAt=so,y()end function o.fetch()o.discAt=y()local sp=ah:FindFirstChild("Remotes")local sq=sp and sp:FindFirstChild("GetSquishiesDiscovered")
if not sq then return end local A6,A7=pcall(function()return sq:InvokeServer()end)if A6 then o.loadDisc(A7)end
end function o.scanWax()local ll={}local sr=c.plot and c.plot:FindFirstChild("WaxStations")if sr then for Gn,ss in ipairs(sr:GetChildren())do
local su=ss:FindFirstChild("SquishyPlaceHolder")if su and ss:GetAttribute("HasSquishy")then for Go,sv in ipairs(su:GetChildren())do if sv:IsA("Model")then ll[V(sv.Name)]=true end end
end end end for sx,A8 in pairs(o.placedAt)do if y()-A8<20 then ll[sx]=true else o.placedAt[sx]=nil end end o.waxing=ll
end function o.compute()local sy,lm,ln={},0,0 if o.disc then for lo in pairs(o.roll or{})do if not o.disc[lo]then
if o.waxing[lo]then ln=ln+1 else sy[lo],lm=true,lm+1 end end end end o.need,o.nNeed,o.nWax=sy,lm,ln local sz,lp={},d.Best or 0
local lq=(lp==4)and o.stackMin or nil for A9,sA in ipairs(o.order)do if(lq and sA.inc>lq)or(not lq and A9<=(lp==4 and 1 or lp))then sz[sA.k]=true end
end o.best=sz end function o.readStack()o.stackAt=y()local sB=ah:FindFirstChild("Remotes")local sC=sB and sB:FindFirstChild("EditStack")
if not sC then return end local A_,c2=pcall(function()return sC:InvokeServer("State",nil)end)if not(A_ and type(c2)=="table"and type(c2 .state)=="table"and type(c2 .state.entries)=="table")then return end
local g4 for Gp,sD in ipairs(c2 .state.entries)do local eC=type(sD)=="table"and o.si and o.si[tostring(sD.name)]
if type(eC)=="table"and type(eC.income)=="number"and not eC.incomeType and(not g4 or eC.income<g4)then g4=eC.income end
end o.stackMin=g4 o.stackFull=#c2 .state.entries>=(tonumber(c2 .state.capacity)or 100)end function o.want(lr)
if(d.Best or 0)>0 and(next(o.best)or(d.Best==4 and o.stackMin))then if o.best[lr]then return true end elseif d.Targets[lr]then
return true end return d.AutoIndex==true and o.need[lr]==true end function o.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(o.best)~=nil)or(d.AutoIndex and next(o.need)~=nil)
or d.Best==4 end function o.placed(Ba)local eD=V(Ba)o.placedAt[eD],o.waxing[eD]=y(),true if o.need[eD]then o.need[eD],o.nNeed,o.nWax=nil,math.max(0,o.nNeed-1),o.nWax+1
A(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(eD)))if o.on()then task.spawn(pcall,o.sync,true)end
end end function o.rulesNow()local eE,eF={},{}for Bb,Bc in pairs(o.roll or{})do if o.want(Bb)then eE[Bc]=true end end
for sE,ls in pairs((o.ci and type(o.ci.crates)=="table")and o.ci.crates or{})do if L.wanted(sE)or(type(ls)=="table"and type(ls.title)=="string"and L.wanted(ls.title))then eF[sE]=true end
end if not next(eE)and not next(eF)then return nil end if o.arm and type(o.arm.encode)=="function"then local Bd,sF=pcall(o.arm.encode,{rarities={},butters=eE,crates=eF,index=false})
if Bd and type(sF)=="string"then return sF end end local function sG(Be)local g5={}for Bf in pairs(Be)do g5[#g5+1]=Bf end table.sort(g5)return table.concat(g5,",")end
local eG="adv:"if next(eE)then eG=eG..";butters:"..sG(eE)end if next(eF)then eG=eG..";crates:"..sG(eF)end return eG
end function o.canon(Bg)local g6={}for sH in tostring(Bg or""):gmatch("[^;]+")do local lt,sI=sH:match("^(%a+):(.*)$")
if not lt then lt,sI="r",sH:gsub("^adv:","")end for Bh in sI:gmatch("[^,]+")do g6[#g6+1]=lt.."="..Bh end end table.sort(g6)
return table.concat(g6,"|")end function o.sync(Bi)if H:GetAttribute("AutoRoll")~=true then return end if y()<(o.pauseUntil or 0)then return end
local cn=o.rulesNow()if not cn or#cn>1900 then return end if o.canon(H:GetAttribute("AutoRollRules"))==o.canon(cn)then o.fails=0 return end
if not Bi and y()-o.sentAt<4 then return end local sJ=ah:FindFirstChild("Remotes")local sK=sJ and sJ:FindFirstChild("AutoRollAction")
if not sK then return end o.fails=o.fails+1 if o.fails>4 then o.fails,o.pauseUntil=0,y()+300 A("the game did not take the Auto Roll choices - trying again in 5 min")
return end o.sentAt=y()D.replaying=true pcall(function()sK:FireServer("Rules",cn)end)D.replaying=false d.ARrules=cn
local g7,g8=0,0 for Gq in(cn:match("butters:([^;]*)")or""):gmatch("[^,]+")do g7=g7+1 end for Gr in(cn:match("crates:([^;]*)")or""):gmatch("[^,]+")do g8=g8+1 end
local sL=g7 .."/"..g8 if o.told~=sL then o.told=sL A(("auto roll now stops on %d butters and %d crates"):format(g7,g8))end
end function o.tick()if not o.mods()then o.msg="index: the game's butter list cannot be read"return end if y()-o.discAt>30 then o.fetch()end
o.scanWax()if d.Best==4 and y()-(o.stackAt or-100)>60 then o.readStack()end o.compute()if o.on()then o.sync(false)end
local aN={}if d.AutoIndex then aN[#aN+1]=not o.disc and"index: reading..."or(o.nNeed+o.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(o.nNeed,o.nWax))end if d.Best==4 then local eH=0 for Gs in pairs(o.best)do eH=eH+1 end
aN[#aN+1]=eH==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eH,eH==1 and""or"s")
elseif(d.Best or 0)>0 and o.order[1]then aN[#aN+1]="best: "..ak(o.order[1].k)end if d.BestCrate and o.bestCrateName then aN[#aN+1]="crate: "..o.bestCrateName end
if P.got>0 then aN[#aN+1]="shower: "..P.got end o.msg=#aN>0 and table.concat(aN," | ")or"index / best: off"end
o.heard={}o.feed={}function o.feedAdd(Bj)o.feed[#o.feed+1]=os.date("%H:%M ")..Bj if#o.feed>40 then table.remove(o.feed,1)end
end function o.admin(sM,au,g9)if sM~="Effect"then o.feedAdd(tostring(sM)..(au~=nil and(": "..tostring(au):sub(1,80))or""))
return end if au~="ShowerTaken"and au~="GoalPoint"then o.feedAdd(tostring(au))end if au=="Shower"then P.add(g9)return end
if au=="ShowerTaken"then P.gone(g9)return end if au=="ShowerClear"then P.drops={}return end if au=="WaxGlow"then
local lu=type(g9)=="table"and tonumber(g9 .SnapAt)if lu then o.snapAt=lu A(("ADMIN: every wax finishes in %ds%s"):format(math.floor(lu-q.srv()),(d.SnapGlaze~=false and d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end au=tostring(au)bZ("Admin "..au)if au~="GoalPoint"and y()-(o.heard[au]or-100)>30 then o.heard[au]=y()
A("ADMIN: "..au)end end P.drops,P.tried,P.got,P.miss={},{},0,0 function P.add(lv)if type(lv)~="table"or type(lv.Pieces)~="table"then return end
for Gt,aW in pairs(lv.Pieces)do if type(aW)=="table"and aW.Id~=nil and aW.Position~=nil then P.drops[aW.Id]={id=aW.Id,butter=tostring(aW.Butter or"?"),rar=tostring(aW.Rarity or"?"),star=aW.Star==true,
pos=aW.Position,opens=tonumber(aW.OpensAt)or 0,ends=tonumber(aW.ExpiresAt)or 0}end end end function P.gone(eI)
if type(eI)~="table"or eI.Id==nil then return end P.drops[eI.Id]=nil if tonumber(eI.UserId)==q.uid then P.mine=eI.Id end
end function P.pick()local lw=q.srv()local lx,sN for sO,co in pairs(P.drops)do if lw>=co.ends-0.3 then P.drops[sO]=nil
elseif lw>=co.opens-0.2 and(P.tried[sO]or 0)<3 then local sP=(aK(co.butter)and 1e6 or 0)+(co.star and 1e5 or 0)+o.rank(co.rar)*100-(co.ends-lw)
if not lx or sP>sN then lx,sN=co,sP end end end return lx end function P.due()return d.Shower and c.running and next(P.drops)~=nil and not aa()and P.pick()~=nil
end function P.grab()local aO,ly=P.pick(),ao()if not(aO and ly)then return end P.tried[aO.id]=(P.tried[aO.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aD(ly,aO.pos+Vector3 .new(0,cJ(ly)+0.5,0))ap(function()return P.mine==aO.id or aa()~=nil or not P.drops[aO.id]end,1.5)
if P.mine==aO.id or aa()then P.got,P.drops[aO.id]=P.got+1,nil A(("GRABBED %s [%s]%s from the admin shower"):format(ak(V(aO.butter)),aO.rar,aO.star and" (star)"or""))
elseif not P.drops[aO.id]then P.miss=P.miss+1 end end local eJ local function sQ()if c.capHit then if d.AutoStart and y()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 A("trying again after being stopped for 5 minutes")eJ(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ao()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bt(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not o.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local lz,sR=fo()
local g_=aa()if g_ then local c3=ak(V(g_))if not aK(g_)then local lA=(T.gift and V(T.gift)==V(g_)and y()-T.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(c3,lA),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(c3,lA),"bad"end return"sell",("selling %s (%s)"):format(c3,lA),"warn"
end if lz<1 then return nil,("holding %s - 0 free stations"):format(c3),"wait"end if z.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(c3),"wait"end
return"place",("waxing %s (%d free)"):format(c3,lz),"ok"end c.holding=false if d.Crates and not e.waiting and y()-(e.scanAt or 0)>1 and y()>(e.quietUntil or 0)then
e.scanAt=y()local lB=c.plot:FindFirstChild("CrateStand")if lB then for Gu,eK in ipairs(lB:GetDescendants())do
if eK:IsA("ProximityPrompt")and eK.Enabled and jo(eK)then local bk=eK.ObjectText if bk==""then bk=cC(lB,"TitleLabel")or""end
if bk~=""and L.wanted(bk)then local Bk=fk(bk):gsub("crate$","")local sS for sT in pairs(ad.members)do if fk(sT)==Bk then sS=sT end end
e.waiting,e.at,e.title,e.prompt=true,y(),bk,eK e.data={name=(bk:gsub("%s","")),rarity=sS,title=bk}A(bk.." found waiting on your stand")
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
end local lC=nv()if not lC then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c4=bY()
if c4 and oV(c4 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(c4 .name),"idle"end
if y()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c4 .name),"bad"end if not pd()then return nil,("%s rolled - waiting for it to land on the stand"):format(c4 .name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(c4 .name),"ok"end local bH=i6()if bH.state~="match"then
c.matchSince=nil if bH.state=="skip"and not lC.Enabled then return nil,bH.text.." (sold out)","idle"end return nil,bH.text,bH.level
end if not lC.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local eL=y()if eL<c.noCashUntil then
local sW,Bl=dI()if sW then return nil,("cash short: have $%s, price ~$%s"):format(aL(sW),aL(Bl)),"bad"end return nil,(dI()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aL(a8()),math.ceil(c.noCashUntil-eL)),dI()and"bad"or"wait"end if eL-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eL local sX=eL-c.matchSince if sX<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bH.shown,sX),"ok"end
return"buy",("buying %s via %s"):format(bH.shown,bH.src),"ok"end j.DEPTH=11 function j.pinTick()local sY=j.hold
if not sY then return end local lD=H.Character local lE=lD and lD:FindFirstChild("HumanoidRootPart")if not lE then return end
lE.CFrame=sY lE.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Gv,ha in ipairs(lD:GetChildren())do if ha:IsA("BasePart")and ha.CanCollide then j.noclip[ha]=true ha.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(Bm,sZ)j.hold=Bm if sZ then j.surface=sZ end end function j.unpin(Bn)
if not j.hold then return end j.hold=nil for s0 in pairs(j.noclip)do pcall(function()if s0 .Parent then s0 .CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local s1=ao()if s1 and j.surface and not Bn then aD(s1,j.surface.Position,j.surface.Position+j.surface.LookVector)
ae(0.1)end end function j.home()local bl,s2=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ao()
if not(bl and bl:IsA("BasePart")and s2)then return nil end local s3=nk()or bl.Position local hb=Vector3 .new(s3 .X-bl.Position.X,0,s3 .Z-bl.Position.Z)
hb=hb.Magnitude>0.1 and hb.Unit or Vector3 .new(0,0,1)local hc=bl.Position+hb*6 local s4=f0(hc.X,bl.Position.Y,hc.Z,{bl})
return CFrame.new(hc.X,(s4 and s4 .Y or bl.Position.Y)+cJ(s2),hc.Z)end function j.ground(Bo,s5,Bp)local lF,lG={H.Character},nil
for Gw=1,12 do local lH=RaycastParams.new()lH.FilterType=Enum.RaycastFilterType.Exclude lH.FilterDescendantsInstances=lF
local hd=as:Raycast(Vector3 .new(Bo,s5,Bp),Vector3 .new(0,-2000,0),lH)if not hd then break end lG,s5=hd,hd.Position.Y-0.05
lF[#lF+1]=hd.Instance end return lG and lG.Position.Y end function j.parkHome()local lI=j.home()if not lI then return false end
local c5=lI.Position local Bq=j.ground(c5 .X,c5 .Y+300,c5 .Z)or(c5 .Y-3)j.pin(CFrame.new(c5 .X,Bq-8,c5 .Z),lI)
return true end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}
function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end function j.setGhost(he)d.Ghost,d.GhostHelps=he==2,he==1
if he<2 then task.spawn(function()while c.busy do ae(0.1)end if j.ghostMode()<2 and j.hold and not E.home then pcall(j.unpin)end
end)end j.paintGhost()A("ghost: "..j.GHOST[he][1]:sub(8):lower())end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end
function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end local Br=ao()if not Br or J.seat()then return end
j.parkHome()end J.n,J.fails,J.nextAt,J.msg,J.lost=0,0,0,"no campfire right now",0 function J.seat()local s6=H.Character
local s7=s6 and s6:FindFirstChildOfClass("Humanoid")local lJ=s7 and s7 .SeatPart return(lJ and lJ.Name=="LogSeat")and lJ or nil
end function J.due()if not(d.Campfire and c.running)or y()<J.nextAt then return false end local Bs=as:FindFirstChild("NightSeats")
if not Bs then if J.wasOn then J.wasOn,J.fails,J.lost=false,0,0 end J.msg="no campfire (comes with weather events)"
return false end J.wasOn=true if J.seat()then J.sitAt=J.sitAt or y()J.msg=("sitting at the campfire: +%s%% cash"):format(tostring(H:GetAttribute("CampfireBoost")or"?"))
return false end if J.sitAt then J.lost,J.sitAt=J.lost+1,nil if J.lost>=4 then J.nextAt,J.msg=y()+600,"kept losing the seat - leaving the campfire for 10 min"
A(J.msg)return false end end return true end function J.sit()local s8,hf=as:FindFirstChild("NightSeats"),ao()
if not s8 or not hf then return end local s9,c6=hf.HumanoidRootPart.Position,{}for Gx,hg in ipairs(s8:GetChildren())do
local s_=hg:IsA("Seat")and hg.Occupant==nil and hg:FindFirstChildOfClass("ProximityPrompt")if s_ then c6[#c6+1]={st=hg,p=s_}end
end if#c6==0 then J.nextAt,J.msg=y()+10,"the campfire is full - waiting for a seat"return end table.sort(c6,function(Bt,Bu)return(Bt.st.Position-s9).Magnitude<(Bu.st.Position-s9).Magnitude end)
local Bv,Bw=c6[1].st,c6[1].p j.unpin(true)local c7=Bv.CFrame aD(hf,c7 .Position+c7 .LookVector*2+Vector3 .new(0,2.5,0),c7 .Position)
ae(0.25)local Bx=dM(Bw,function()return J.seat()~=nil end)if not Bx then aD(hf,c7 .Position+Vector3 .new(0,2,0),c7 .Position+c7 .LookVector)
ap(function()return J.seat()~=nil end,1.5)end if J.seat()then J.n,J.fails,J.sitAt=J.n+1,0,y()A(("SAT at the campfire (+%s%% cash)"):format(tostring(H:GetAttribute("CampfireBoost")or"?")))
else J.fails=J.fails+1 J.nextAt=y()+(J.fails>=3 and 60 or 5)J.msg="could not sit at the campfire"..(J.fails>=3 and" - trying again in a minute"or"")
if J.fails<=3 then A(J.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=y()local lK=ah:FindFirstChild("Remotes")if not lK then return end local eM,lL,c8=0,0,{}
local By,ta=pcall(function()return lK.ClanRequest:InvokeServer("state")end)local tb=By and type(ta)=="table"and ta.tasks
for Gy,bI in ipairs(tb and tb.list or{})do if not bI.done and bI.kind=="pull"then eM=math.max(eM,(bI.goal or 0)-(bI.progress or 0))end
if not bI.done then c8[#c8+1]=("%s %d/%d"):format(tostring(bI.text),bI.progress or 0,bI.goal or 0)end end F.events={}
for Gz,c9 in ipairs(lK:GetChildren())do if c9:IsA("RemoteFunction")and c9 .Name:match("^%u%a+Action$")and c9 .Name~="CrateAction"and c9 .Name~="AutoRollAction"then
local Bz,eN=pcall(function()return c9:InvokeServer("state")end)if Bz and type(eN)=="table"and eN.live==true and type(eN.quests)=="table"then
F.events[#F.events+1]={r=c9,st=eN}for GA,aP in ipairs(eN.quests)do if not aP.done and aP.kind=="pull"then eM=math.max(eM,(aP.goal or 0)-(aP.progress or 0))end
if not aP.done and aP.kind=="collect"then lL=math.max(lL,(aP.goal or 0)-(aP.progress or 0))end if not aP.done then c8[#c8+1]=("%s %d/%d"):format(tostring(aP.text),aP.progress or 0,aP.goal or 0)end
end end end end F.pullLeft,F.collectLeft=eM,lL F.msg=#c8>0 and("open: "..table.concat(c8,", "))or"all quests done for today"
end function F.claim()for GB,eO in ipairs(F.events)do local tc=eO.r.Name:gsub("Action$","")for GC,c_ in ipairs(eO.st.quests)do
if c_.done and not c_.claimed then local BA,td=pcall(function()return eO.r:InvokeServer("claimQuest",c_.id)end)
if BA and not(type(td)=="table"and td.ok==false)then F.claims=F.claims+1 A(("CLAIMED %s quest: %s (+%s)"):format(tc,tostring(c_.text),tostring(c_.points or c_.treats or"?")))
end ae(0.4)end end if eO.st.bonusReady==true then local BB=pcall(function()return eO.r:InvokeServer("claimBonus")end)
if BB then A(("CLAIMED %s daily quest bonus"):format(tc))end ae(0.4)end end end function F.tick()if not(d.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if y()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return d.Quests and c.running and F.pullLeft>0 and y()>=F.nextAt and not D.busy end function F.lever()local te=c.plot and c.plot:FindFirstChild("Lever")
local lM=te and te:FindFirstChild("Wheel")return lM and lM:FindFirstChildWhichIsA("ProximityPrompt"),lM end function F.resume(BC)
F.arPaused=false if F.arWas then F.arWas=false d.AutoRoll=true task.spawn(D.apply,BC)end end function F.pull()
local hh,lN=F.lever()if not hh or not lN or not lN:IsA("BasePart")then F.nextAt,F.msg=y()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=y()+30 return end end A(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not hh.Enabled then F.nextAt=y()+1 return end b3(lN,hh)F.asked=nil oK(hh)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
ae(0.6)if F.asked then F.nextAt=y()+600 A(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=y()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bJ,BD)local lO=bJ:GetAttribute("PourOwner")
if type(lO)~="number"or lO==q.uid or not bJ:GetAttribute("HasSquishy")then return false end if bJ:GetAttribute("PourLong")~=true or bJ:GetAttribute("PourFull")==true then return false end
local lP=bJ:GetAttribute("PourId")if lP==nil or E.skip[lP]then return false end local tf,lQ,BE=bJ:GetAttribute("Helpers"),0,tostring(q.uid)
if type(tf)=="string"then for BF in tf:gmatch("[^,%s]+")do lQ=lQ+1 if BF==BE then return false end end end if lQ>=6 then return false end
local hi=z.left(bJ)if not hi then local th=tonumber(bJ:GetAttribute("PourEnd"))hi=th and(th-BD)end if not hi or hi<=75 then return false end
local lR=game:GetService("Players"):GetPlayerByUserId(lO)if not lR or lR:GetAttribute("WaxHelpOff")==true then return false end
return true,lR,lP end function E.list()local lS,BG={},q.srv()local ti=as:FindFirstChild("Plots")for GD,tj in ipairs(ti and ti:GetChildren()or{})do
local tk=tj~=c.plot and tj:FindFirstChild("WaxStations")for GE,lT in ipairs(tk and tk:GetChildren()or{})do local BH,BI,BJ=E.can(lT,BG)
local lU=BH and lT:FindFirstChild("SquishyPlaceHolder")if lU and lU:IsA("BasePart")then lS[#lS+1]={st=lT,p=BI,id=BJ,part=lU}end
end end return lS end function E.due()return d.Help and c.running and y()>=E.nextAt end function E.skipIt(tl,tm)
E.skip[tl],E.skipN=tm,E.skipN+1 if E.skipN>600 then E.skip,E.skipN,E.tries={[tl]=tm},1,{}end end function E.goHome()
local hj,bK=ao(),E.home E.home=nil if not(hj and bK)then return end if d.Ghost and not J.seat()then j.unpin(true)
if not j.parkHome()then pcall(aD,hj,bK.Position,bK.Position+bK.LookVector)end elseif j.hold or(hj.HumanoidRootPart.Position-bK.Position).Magnitude>20 then
j.unpin(true)pcall(aD,hj,bK.Position,bK.Position+bK.LookVector)end end function E.step()local lV,eP=E.list(),ao()
if#lV==0 or not eP then E.nextAt=y()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local tn=eP.HumanoidRootPart local to=tn.Position table.sort(lV,function(BK,BL)return(BK.part.Position-to).Magnitude<(BL.part.Position-to).Magnitude end)
local aY=lV[1]E.home=E.home or(j.hold and j.surface)or tn.CFrame local bL=aY.part local eQ=(bL.Position+aY.st:GetPivot().Position)/2
local hk=E.tries[aY.id]or 0 if(d.Ghost or d.GhostHelps)and hk==0 and not J.seat()then j.pin(bL.CFrame,E.home)
else j.unpin(true)local lW=hk==0 and f0(eQ.X,bL.Position.Y,eQ.Z,{bL})if lW and math.abs(lW.Y-bL.Position.Y)<8 then
aD(eP,Vector3 .new(eQ.X,lW.Y+cJ(eP),eQ.Z),bL.Position)else aD(eP,bL.Position+Vector3 .new(0,bL.Size.Y/2+3,0),eQ)
end end ae(0.3)local eR=ah:FindFirstChild("Remotes")eR=eR and eR:FindFirstChild("ClanRequest")if not eR then E.nextAt,E.msg=y()+60,"the game's help remote is missing"return end
local hl,bm=pcall(function()return eR:InvokeServer("help",aY.st:GetAttribute("PourOwner"),tonumber(aY.st.Name))end)
if hl and type(bm)=="table"and bm.ok then E.n,E.fails=E.n+1,0 E.skipIt(aY.id,"helped")A(("HELPED %s's wax (station %s)"):format(aY.p.DisplayName,aY.st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif hl and type(bm)=="table"and tostring(bm.reason or""):lower():find("walk up",1,true)and hk<2 then
E.tries[aY.id]=hk+1 E.nextAt=y()+0.3 elseif hl and type(bm)=="table"and tostring(bm.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=y()+1.6 else local tp=(hl and type(bm)=="table"and tostring(bm.reason or"refused"))or("error: "..tostring(bm))
E.skipIt(aY.id,tp)E.fails=E.fails+1 if E.fails<=3 then A(("help refused for %s's wax: %s"):format(aY.p.DisplayName,tp))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,y()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,y()+1.2)end function E.onCall(bn)if not d.HelpGuild or type(bn)~="table"or bn.p~="help"or bn.mine or bn.u==q.uid or not bn.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eS=ah:FindFirstChild("Remotes")
eS=eS and eS:FindFirstChild("ClanRequest")if not eS then return end local tq,eT=pcall(function()return eS:InvokeServer("callHelp",bn.u)end)
local tr=tostring(bn.n or bn.un or bn.u)if tq and type(eT)=="table"and eT.ok then E.calls=E.calls+1 A(("HELPED guildmate %s's wax from here (their call)"):format(tr))
else A(("guild call from %s: %s"):format(tr,(tq and type(eT)=="table"and tostring(eT.reason or"refused"))or tostring(eT)))
end end)end local function ar(BM,ts,...)if c.busy then return end c.busy,c.busyText=true,BM if j.hold and ts~=E.step then pcall(j.unpin)end
local BN,tt=pcall(ts,...)c.busy,c.busyText=false,""if not BN and tt~=ih then A("ERR "..tostring(tt))end end local function BO()
local aQ,BP,BQ=sQ()c.reason,c.level=BP,BQ if aQ=="place"then ar("waxing...",z.place)elseif aQ=="crate"then ar("opening crate...",dX,true)
elseif aQ=="cratesmart"then ar("opening crate...",e.smart)elseif aQ=="cratewin"then ar("opening the crate window...",jq)
elseif aQ=="nocrate"then ar("discarding crate...",dX,false)elseif aQ=="cratedrop"then ar("discarding a crate that would not open...",e.drop)
elseif aQ=="sell"then ar("selling...",sc)elseif aQ=="buy"then ar("buying...",oN,false)elseif not aQ and not c.matchSince and P.due()then
ar("grabbing a butter from the admin shower...",P.grab)elseif not aQ and not c.matchSince and J.due()then ar("sitting at the campfire...",J.sit)
elseif not aQ and not c.matchSince and F.pullDue()and not aa()and not(bY()and aK(bY().name))then ar("pulling the lever for a quest...",F.pull)
elseif d.Collect and not c.matchSince and y()-c.lastCollect>=(F.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ar("collecting money...",AT)elseif not aQ and not c.matchSince and E.due()then ar("helping a wax...",E.step)elseif E.home and not d.Help then
ar("coming back...",E.goHome)elseif not c.busy then j.parkTick()end end function eJ(hm,BR)if hm==c.running then return end
c.running=hm if not BR then d.AutoStart=hm end if hm then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=y()c.plot=bt()or c.plot
A("START")else c.reason="stopped"A("STOP")end end do local bM=fM(am.auto)if type(bM)=="string"then bM=bM:gsub("%s+$","")
if bM~=""then c.autoload=bM local BS=of(bM)A(BS and("loaded config "..bM)or("config "..bM.." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local BT={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local lX={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ag={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local tu,tv,tw,tx=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if tu and tv and tw and tx then ag.x,ag.b,ag.m,ag.r=tu,tv,tw,tx end end)pcall(function()local ty=Enum.Font.RobotoMono if ty then ag.mono=ty end end)
local function K(BU,BV,BW)local BX,lY=pcall(Instance.new,BU)if not BX then c.uiErrs=c.uiErrs+1 return nil end
for BY,BZ in pairs(BV)do if not pcall(function()lY[BY]=BZ end)then c.uiErrs=c.uiErrs+1 end end lY.Parent=BW return lY
end local function ac(B0,B1)K("UICorner",{CornerRadius=UDim.new(0,B1 or 8)},B0)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(hn,lZ)if hn and a.shown[hn]~=lZ then a.shown[hn]=lZ hn.Text=lZ end
end function a.stroke(B2,B3,B4)return K("UIStroke",{Color=B3 or l.line,Thickness=1,Transparency=B4 or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},B2)
end function a.grad(B5,B6,B7,B8)local B9,tz=pcall(function()return ColorSequence.new(B6,B7)end)if B9 and tz then return K("UIGradient",{Color=tz,Rotation=B8 or 0},B5)end
end function a.pad(B_,tA,tB,Ca,Cb)K("UIPadding",{PaddingLeft=UDim.new(0,tA or 0),PaddingTop=UDim.new(0,tB or 0),
PaddingRight=UDim.new(0,Ca or tA or 0),PaddingBottom=UDim.new(0,Cb or tB or 0)},B_)end function a.list(Cc,Cd,Ce)
return K("UIListLayout",{Padding=UDim.new(0,Cd or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Ce and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Cc)
end function a.ink(l0)local Cf,Cg=pcall(function()return 0.299*l0 .R+0.587*l0 .G+0.114*l0 .B end)return(Cf and Cg>0.55)and l.ink or l.text
end function a.nextIn(tC)local tD=(a.ord[tC]or 0)+1 a.ord[tC]=tD return tD end local l1=H:FindFirstChildOfClass("PlayerGui")or H:WaitForChild("PlayerGui")
local tE=l1:FindFirstChild("SABFarmGui")if tE then tE:Destroy()end local l2=K("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},l1)local ab={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local ho=as.CurrentCamera.ViewportSize if ho.X>100 and ho.Y>100 then ab.w=math.clamp(math.floor(ho.X*0.48),320,400)
ab.h=math.clamp(math.floor(ho.Y*0.86),250,360)end end)a.root=K("Frame",{Name="Root",Size=UDim2 .new(0,ab.w,0,ab.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},l2)
ac(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local tF=UDim2 .new(1,0,1,0)
local function Ch(tG,tH)return UDim2 .new(tG,0,0,0),UDim2 .new(tH,(tG+tH>0.99)and 0 or-4,1,0)end local function ai(Ci,Cj,eU,Ck,Cl,Cm)
local l3=K("TextButton",{Text=Cj,Position=Cl,Size=Cm,BackgroundColor3=eU,BorderSizePixel=0,Font=ag.b,TextSize=Ck,TextColor3=a.ink(eU),AutoButtonColor=true},Ci)
ac(l3,8)if eU==l.panel2 or eU==l.raise or eU==l.panel then a.stroke(l3,l.line,0.4)end return l3 end local function hp(Cn,Co,Cp,Cq,Cr)
local hq=K("TextBox",{Text=Co,PlaceholderText=Cp,Position=Cq,Size=Cr,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ag.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Cn)ac(hq,8)a.stroke(hq,l.line,0)a.pad(hq,9,0,6,0)
return hq end local hr=as.CurrentCamera local function Cs()local Ct,hs=pcall(function()return hr and hr.ViewportSize end)
if Ct and hs and hs.X>50 and hs.Y>50 then return hs end end local function bN(eV)local l4=Cs()if not(l4 and eV and eV.Parent)then return end
local Cu=pcall(function()local ht,tI=eV.AbsolutePosition,eV.AbsoluteSize local l5=70 local tJ=math.clamp(ht.X,l5-tI.X,l4 .X-l5)
local tK=math.clamp(ht.Y,0,l4 .Y-math.min(tI.Y,l5))if math.abs(tJ-ht.X)>0.5 or math.abs(tK-ht.Y)>0.5 then eV.Position=UDim2 .new(0,math.floor(tJ),0,math.floor(tK))
end end)return Cu end local function hu(Cv)local Cw,l6=pcall(function()return Cv.AbsolutePosition end)if Cw and l6 then return{math.floor(l6 .X),math.floor(l6 .Y)}end
end local da={}c.dragMoved={}local function tL(eW,tM,l7)Q(eW.InputBegan:Connect(function(db)if db.UserInputType~=Enum.UserInputType.MouseButton1 and db.UserInputType~=Enum.UserInputType.Touch then return end
local l8={start=db.Position,from=tM.Position,moved=0,target=tM,input=db,onDrop=l7}da[eW],c.dragMoved[eW]=l8,0
local l9 l9=db.Changed:Connect(function()if db.UserInputState==Enum.UserInputState.End and da[eW]==l8 then da[eW]=nil
if l9 then l9:Disconnect()end if l7 then l7(l8 .moved)end end end)end))end Q(m4 .InputChanged:Connect(function(hv)
if hv.UserInputType~=Enum.UserInputType.MouseMovement and hv.UserInputType~=Enum.UserInputType.Touch then return end
for Cx,a6 in pairs(da)do local l_=a6 .target if l_ and l_.Parent then local tN,tO=hv.Position.X-a6 .start.X,hv.Position.Y-a6 .start.Y
a6 .moved=math.max(a6 .moved,math.abs(tN)+math.abs(tO))c.dragMoved[Cx]=a6 .moved l_.Position=UDim2 .new(a6 .from.X.Scale,a6 .from.X.Offset+tN,a6 .from.Y.Scale,a6 .from.Y.Offset+tO)
end end end))Q(m4 .InputEnded:Connect(function(hw)if hw.UserInputType~=Enum.UserInputType.MouseButton1 and hw.UserInputType~=Enum.UserInputType.Touch then return end
for Cy,hx in pairs(da)do if hx.input==hw or hw.UserInputType==Enum.UserInputType.MouseButton1 then da[Cy]=nil
if hx.onDrop then hx.onDrop(hx.moved)end end end end))local function O(Cz,CA,CB,CC,CD,CE,CG)return K("TextLabel",{Text=CA,Position=CE or UDim2 .new(0,0,0,0),Size=CG or tF,BackgroundTransparency=1,
Font=CD and ag.b or ag.m,TextSize=CB,TextColor3=CC,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Cz)
end function a.row(tP,CH)return K("Frame",{Size=UDim2 .new(1,0,0,CH),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(tP)},tP)end function a.card(tQ,tR,tS)local dc=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(tQ)},tQ)ac(dc,11)a.stroke(dc,l.line,0.25)a.list(dc,5)a.pad(dc,8,8,8,9)
if tR then local ma=a.row(dc,14)K("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},ma)O(ma,tR:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if tS then local CI=O(ma,tS,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
CI.TextXAlignment=Enum.TextXAlignment.Right end end return dc end function a.heading(CJ,CK,mb)local mc=a.row(CJ,mb and 34 or 22)
O(mc,CK,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ag.x if mb then O(mc,mb,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return mc end function a.note(CL,CM,CN)local tT=O(a.row(CL,CN or 28),CM,9,l.dim,false)tT.TextYAlignment=Enum.TextYAlignment.Top
return tT end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(md)local aI=a.sw[md]if not aI then return end
local dd=tostring(md.Text or""):match(":%s*(.-)%s*$")or""local bO=dd~=""and not a.OFF[dd]local me=not aI.chips and(dd=="ON"or dd=="OFF")
aI.pill.Visible,aI.chip.Visible=me,not me if me then aI.pill.BackgroundColor3=bO and l.accent or l.panel2 aI.knob.Position=bO and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aI.knob.BackgroundColor3=bO and l.white or l.dim else aI.chip.Text=dd~=""and dd or"-"aI.chip.BackgroundColor3=bO and l.accent or l.panel2
aI.chip.TextColor3=bO and l.ink or l.dim end md.BackgroundColor3=bO and l.lit or l.raise if aI.edge then aI.edge.Color=bO and l.accent or l.line aI.edge.Transparency=bO and 0.55 or 0.45 end
end function a.switch(tU,CO,CP,eX)local aZ=K("TextButton",{Name="Switch",Text=CO,TextTransparency=1,TextSize=8,Font=ag.b,
Size=UDim2 .new(1,0,0,eX and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(tU)},tU)
ac(aZ,9)local az={edge=a.stroke(aZ,l.line,0.45)}az.title=O(aZ,CP,11,l.text,true,UDim2 .new(0,10,0,eX and 4 or 0),UDim2 .new(1,-100,0,eX and 15 or 28))
az.title.TextWrapped,az.title.TextTruncate=false,Enum.TextTruncate.AtEnd if eX then az.sub=O(aZ,eX,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
az.sub.TextWrapped,az.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end az.pill=K("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},aZ)ac(az.pill,9)az.knob=K("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},az.pill)ac(az.knob,7)az.chip=K("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ag.b,TextSize=9,TextColor3=l.dim,Text=""},aZ)
ac(az.chip,9)a.pad(az.chip,9,0,9,0)a.sw[aZ]=az Q(aZ:GetPropertyChangedSignal("Text"):Connect(function()a.skin(aZ)end))
a.skin(aZ)return aZ end function a.chips(mf)if a.sw[mf]then a.sw[mf].chips=true a.skin(mf)end end function a.line(CQ,CS)
local tV=a.row(CQ,15)local tW=K("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=CS or l.dim,
BorderSizePixel=0},tV)ac(tW,3)local mg=O(tV,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))mg.TextWrapped,mg.TextTruncate=false,Enum.TextTruncate.AtEnd
return mg,tW end function a.actions(CT,tX)local CU=a.row(CT,28)local tY,mh={},#tX for eY,tZ in ipairs(tX)do tY[eY]=ai(CU,tZ[1],tZ[2]or l.panel2,10,UDim2 .new((eY-1)/mh,eY>1 and 3 or 0,0,0),
UDim2 .new(1/mh,(eY>1 and-3 or 0)+(eY<mh and-3 or 0),1,0))end return table.unpack(tY)end local function M(cp,hy,CV,CW)
a.put(cp,hy and CV or CW)if not a.sw[cp]and a.lit[cp]~=hy then a.lit[cp]=hy cp.BackgroundColor3=hy and l.accent or l.panel2
cp.TextColor3=a.ink(cp.BackgroundColor3)end end a.title=K("Frame",{Size=UDim2 .new(1,0,0,ab.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
K("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0},a.title)
do local mi=K("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ac(mi,8)a.grad(mi,l.accent,l.accent2,45)local t0=O(mi,"C",16,l.ink,true)t0 .Font,t0 .TextXAlignment=ag.x,Enum.TextXAlignment.Center
local CX=O(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))CX.Font=ag.x O(a.title,"butter farm  "..bT,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
end a.pill=K("Frame",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-66,0.5,0),Size=UDim2 .new(0,78,0,22),
BackgroundColor3=l.raise,BorderSizePixel=0},a.title)ac(a.pill,11)a.pillEdge=a.stroke(a.pill,l.line,0.2)a.dot=K("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(0,9,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.pill)
ac(a.dot,4)a.runL=O(a.pill,"STOPPED",9,l.dim,true,UDim2 .new(0,22,0,0),UDim2 .new(1,-26,1,0))a.minB=ai(a.title,"-",l.raise,14,UDim2 .new(1,-60,0.5,-12),UDim2 .new(0,24,0,24))
a.xB=ai(a.title,"X",l.raise,11,UDim2 .new(1,-32,0.5,-12),UDim2 .new(0,24,0,24))a.xB.TextColor3=l.bad a.strip=K("Frame",{Position=UDim2 .new(0,ab.rail+8,0,ab.head+6),Size=UDim2 .new(1,-(ab.rail+16),0,ab.status),
BackgroundColor3=l.raise,BorderSizePixel=0},a.root)ac(a.strip,9)a.stroke(a.strip,l.line,0.3)a.bar=K("Frame",{Size=UDim2 .new(0,3,1,-12),Position=UDim2 .new(0,7,0,6),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
ac(a.bar,2)a.reason=O(a.strip,"starting",10,l.text,false,UDim2 .new(0,16,0,1),UDim2 .new(1,-22,1,-2))a.reason.TextTruncate=Enum.TextTruncate.AtEnd
a.tabs=K("Frame",{Position=UDim2 .new(0,0,0,ab.head),Size=UDim2 .new(0,ab.rail,1,-ab.head),BackgroundColor3=l.panel,
BorderSizePixel=0},a.root)K("Frame",{Size=UDim2 .new(0,1,1,0),Position=UDim2 .new(1,-1,0,0),BackgroundColor3=l.line,BorderSizePixel=0},a.tabs)
do local CY=a.list(a.tabs,3)pcall(function()CY.HorizontalAlignment=Enum.HorizontalAlignment.Center end)a.pad(a.tabs,5,6,6,6)
end a.railH=math.clamp(math.floor((ab.h-ab.head-12)/9)-3,22,34)local function bo(CZ,C0,C1)local hz=K("TextButton",{Text=CZ,Font=ag.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,
Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)
ac(hz,9)local t1=K("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},hz)ac(t1,2)a.tabsAll[#a.tabsAll+1]={b=hz,bar=t1,name=C0,sub=C1}return hz end
a.tabFarm=bo("🏠","Home","what the farm is doing")a.tabRun=bo("🌾","Farm","the buy - wax - collect loop")a.tabBut=bo("🧈","Butters","what gets bought and waxed")
a.tabCrt=bo("📦","Crates","which crates get opened")a.tabPet=bo("🐾","Pets","adopt, wish, fuse")a.tabTeam=bo("👥","Teams","the right pets at the right moment")
a.tabSrv=bo("🤝","Server","helping, campfire, ghost")a.tabAdm=bo("⚡","Admin","admin abuse and its boosts")a.tabSet=bo("⚙","Settings","configs, startup, performance")
local function bp()local mj=K("ScrollingFrame",{Position=UDim2 .new(0,ab.rail,0,ab.head+ab.status+10),Size=UDim2 .new(1,-ab.rail,1,-(ab.head+ab.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(mj,8)a.pad(mj,8,2,10,12)return mj end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bp(),bp(),bp(),bp(),bp(),bp(),bp(),bp(),bp()a.farm.Visible=true
do local eZ=a.farm local t2=a.row(eZ,34)a.startB=ai(t2,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ag.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(t2,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local C2=a.row(eZ,44)local function e0(t3,C3,t4)local hA=K("Frame",{Position=UDim2 .new((t3-1)/t4,t3>1 and 2 or 0,0,0),Size=UDim2 .new(1/t4,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},C2)ac(hA,9)a.stroke(hA,l.line,0.3)local hB=O(hA,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
hB.Font,hB.TextXAlignment,hB.TextWrapped=ag.x,Enum.TextXAlignment.Center,false local C4=O(hA,C3,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
C4 .TextXAlignment=Enum.TextXAlignment.Center return hB end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=e0(1,"BOUGHT",5),e0(2,"WAXED",5),e0(3,"SOLD",5),e0(4,"MONEY",5),e0(5,"FREE",5)
local t5=a.card(eZ,"Right now")a.info=O(a.row(t5,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=O(a.row(t5,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local e1=a.card(eZ,"Systems")
a.helpL=a.line(e1,l.info)a.campL=a.line(e1,l.accent2)a.questL=a.line(e1,l.good)a.arL=a.line(e1,l.accent)a.ixL=a.line(e1,lX.Dotonbori)
local t6=a.card(eZ,"Activity")a.log=K("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ag.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(t6)},t6)
ac(a.log,7)a.pad(a.log,7,5,7,5)end local function GF(C5,C6)return a.row(C6 or a.farm,C5)end local al do local mk=a.run
a.heading(mk,"Farm","buy what rolls, wax it, collect the cash")local e2=a.card(mk,"Loop")a.colT=a.switch(e2,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(e2,26)O(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=hp(al,tostring(d.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
O(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(e2,"SELL THEM: ON","Sell junk","anything not ticked gets sold, never waxed")a.arT=a.switch(e2,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(e2,"QUESTS: OFF","Event quests","claim them, pull / collect for the ones that ask")local ml=a.card(mk,"By hand")
a.buyB,a.plB=a.actions(ml,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(ml,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(ml,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,Ch(0,0.55))a.padL=O(al,"",10,l.dim,false,UDim2 .new(0.55,6,0,0),UDim2 .new(0.45,-6,1,0))
end do local hC=a.but a.heading(hC,"Butters","what gets bought and waxed")local t7=a.card(hC,"Strategy")a.ixT=a.switch(t7,"AUTO INDEX: OFF","Auto Index","wax every butter missing from your Index once")
a.bestT=a.switch(t7,"BEST BUTTER: OFF","Best butter","TOP 1-3: the game's best / UPGRADES: beats your stack")
a.butList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hC)},hC)
a.list(a.butList,5)end do local hD=a.crt a.heading(hD,"Crates","only ticked crates are opened")local t8=a.card(hD,"Opening")
a.crateT=a.switch(t8,"OPEN CRATES: ON","Open ticked crates","anything else is left for the game to clear")a.bcT=a.switch(t8,"BEST CRATE: OFF","Best crate too","also open the game's dearest one, new ones included")
a.crtList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hD)},hD)
a.list(a.crtList,5)end do local hE=a.pet a.heading(hE,"Pets","adopt from the pen, keep wishes going, fuse Bigs")
local e3=a.card(hE,"Automatic")a.pbT=a.switch(e3,"AUTO ADOPT: OFF","Auto adopt","adopt the pets marked BUY when the pen has them")
a.pwT=a.switch(e3,"AUTO WISH: OFF","Auto wish","keep a wish running for the pets marked WISH")a.pfT=a.switch(e3,"AUTO FUSE: OFF","Auto fuse","fuse copies into Bigs up to each pet's goal")
a.pInfo=O(a.row(e3,40),"",10,l.dim,false)a.pInfo.TextYAlignment=Enum.TextYAlignment.Top a.note(e3,"BUY adopt it  -  ANY / BIG only its Big  -  WISH 2x its price, 20 min  -  FUSE how many Bigs (7 = one Huge, you fuse that)",28)
a.petList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(hE)},hE)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local hF=a.srv a.heading(hF,"Server","other players' waxes, the campfire, staying out of sight")
local mm=a.card(hF,"Helping")a.helpT=a.switch(mm,"HELP WAXES: OFF","Help waxes","step over to other players' waxes in this server")
a.helpGT=a.switch(mm,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(mm,l.info)
local t9=a.card(hF,"Campfire")a.campT=a.switch(t9,"CAMPFIRE: OFF","Sit at the campfire","+50% cash per camper, the farm keeps working")
a.srvCamp=a.line(t9,l.accent2)local mn=a.card(hF,"Ghost")a.ghostT=a.switch(mn,"GHOST: OFF","Ghost mode","OFF / HELP: hidden helps / FULL: wait underground")
a.srvGhost=a.line(mn,l.dim)a.note(mn,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local e4=a.adm a.heading(e4,"Admin abuse","the show, its boosts and what the farm does in it")local t_=a.card(e4,"When")
a.admBig=O(a.row(t_,22),"-",15,l.text,true)a.admBig.Font=ag.x a.admSub=O(a.row(t_,14),"",10,l.dim,false)local C7=a.card(e4,"Boosts now")
a.admBoost=O(a.row(C7,44),"",10,l.text,false)a.admBoost.TextYAlignment=Enum.TextYAlignment.Top local mo=a.card(e4,"What the farm does")
a.shT=a.switch(mo,"GRAB SHOWER: ON","Grab the butter shower","stand on the falling pieces, wanted ones first")
a.snapT=a.switch(mo,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once: wear the glaze team")
a.admStat=a.line(mo,l.accent)local ua=a.card(e4,"Show feed")a.admFeed=K("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ag.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(ua)},ua)
ac(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local de=a.set a.heading(de,"Settings","kept on your phone, per config")
local hG=a.card(de,"Config")al=a.row(hG,28)a.cfgName=hp(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(hG,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(hG,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=O(a.row(hG,16),"",10,l.dim,false)local mp=a.card(de,"Starting")a.startT=a.switch(mp,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(mp,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=O(a.row(mp,26),"",9,l.dim,false)local mq=a.card(de,"If the game drops me")
a.rejT=a.switch(mq,"AUTO REJOIN: ON","Auto rejoin","come back by itself after a disconnect or a restart")a.rejB=a.actions(mq,{{"REJOIN NOW",l.warn}})
a.rejMsg=O(a.row(mq,26),"",9,l.dim,false)local bq=a.card(de,"Performance")a.pfCalm=a.switch(bq,"NO ANIMATIONS: OFF","No animations","the game's stack squish, rainbows, pets walking")
a.pfLite=a.switch(bq,"LITE MODE: OFF","Lite mode","floating labels, sparkles, lighting extras off")a.pfBases=a.switch(bq,"BASES: ALL DRAWN","Bases","stop drawing other bases (or yours too)")
a.pfFps=a.switch(bq,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler overnight")a.pfHud=a.switch(bq,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bq,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(bq,28)O(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=hp(al,tostring(d.MemLimit),"2000",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))O(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bq,l.good)a.note(bq,"Everything here is undone when switched off or on KILL. 0 MB = never rejoin for memory.",24)
local C8=a.card(de,"About")a.note(C8,"CHURN "..bT.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for GG,C9 in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(C9)end local ub=K("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},l1)
a.tgRoot=K("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},ub)ac(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=K("TextButton",{Text="C",Size=tF,BackgroundTransparency=1,Font=ag.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=K("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ac(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=K("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ag.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ac(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()
local e5=j.ghostMode()if a.ghostT then a.put(a.ghostT,j.GHOST[e5][1])end if a.tgGhost then a.tgGhost.Text=j.GHOST[e5][2]
a.tgGhost.BackgroundColor3=e5==2 and l.accent or(e5==1 and l.warn or l.panel)a.tgGhost.TextColor3=e5>0 and l.ink or l.dim
end end local br={built=false,boxes={},at=0}function a.check(hH,mr)hH.Text=mr and"✓"or""hH.BackgroundColor3=mr and l.accent or l.bg
hH.TextColor3=l.ink local ms=hH.Parent if ms and ms:IsA("TextButton")then ms.BackgroundColor3=mr and l.lit or l.raise end
end local function uc(ud,ue)d.Targets[ud]=ue or nil local uf=br.boxes[ud]if uf then a.check(uf,ue)end end local function mt()
for C_,Da in pairs(br.boxes)do a.check(Da,d.Targets[C_]==true)end end function a.tickBox(Db)local mu=K("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ag.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Db)ac(mu,6)
a.stroke(mu,l.line,0)return mu end local e6 local function Dc()local Dd=a.card(a.butList,"Butter list")local mv=a.row(Dd,26)
a.butInfo=O(mv,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local De=ai(mv,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Df=ai(mv,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))De.MouseButton1Click:Connect(function()
for Dg in pairs(d.Targets)do d.Targets[Dg]=nil end mt()end)Df.MouseButton1Click:Connect(function()ad.at=0 iS()
e6(true)end)end e6=function(Dh)if not iS()then if not a.butEmpty then a.butEmpty=O(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if br.built and not Dh and br.at==ad.at then return end for GH,hI in ipairs(a.butList:GetChildren())do
if hI:IsA("Frame")or hI:IsA("TextButton")or hI:IsA("TextLabel")then hI:Destroy()end end br.boxes,a.butEmpty={},nil
Dc()for GI,hJ in ipairs(ad.rarOrder)do local mw=lX[hJ]or l.text local cq=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ac(cq,11)a.stroke(cq,mw,0.7)a.list(cq,4)a.pad(cq,7,7,7,8)
local mx=a.row(cq,22)K("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=mw,BorderSizePixel=0},mx)
local Di=O(mx,hJ:upper(),11,mw,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))Di.Font=ag.x local Dj=ai(mx,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local Dk=hJ Dj.MouseButton1Click:Connect(function()local ug=ad.members[Dk]or{}local uh=false for GJ,Dl in ipairs(ug)do if not d.Targets[Dl]then uh=true break end end
for GK,Dm in ipairs(ug)do uc(Dm,uh)end end)for GL,my in ipairs(ad.members[hJ]or{})do local hK=K("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cq)},cq)ac(hK,8)local ui=O(hK,ak(my),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
ui.TextWrapped,ui.TextTruncate=false,Enum.TextTruncate.AtEnd local uj=a.tickBox(hK)br.boxes[my]=uj local uk=my
local function ul()uc(uk,not d.Targets[uk])end hK.MouseButton1Click:Connect(ul)uj.MouseButton1Click:Connect(ul)
end end mt()br.built,br.at=true,ad.at end function L.paint()for Dn,Do in pairs(L.boxes)do a.check(Do,d.CrateTicks[Dn]==true)end
if a.crtInfo then local mz,mA=0,0 for GM in pairs(L.boxes)do mz=mz+1 end for GN,Dp in pairs(d.CrateTicks)do if Dp then mA=mA+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(mz,mA))end if a.crateT then M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for GO,hL in ipairs(a.crtList:GetChildren())do if hL:IsA("Frame")or hL:IsA("TextButton")or hL:IsA("TextLabel")then hL:Destroy()end
end L.boxes={}local mB=a.card(a.crtList,"All of them","worst first")local mC=a.row(mB,26)a.crtInfo=O(mC,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Dq=ai(mC,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Dr=ai(mC,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
Q(Dq.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))Q(Dr.MouseButton1Click:Connect(function()L.build()end))
for GP,bs in ipairs(L.list())do local um=lX[bs.rar or""]or l.text local df=K("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(mB)},mB)ac(df,8)K("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=um,BorderSizePixel=0},df)
local uo=O(df,(bs.title or bs.name)..(bs.guess and"  (?)"or""),11,um,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
uo.TextWrapped,uo.TextTruncate=false,Enum.TextTruncate.AtEnd local Ds=O(df,bs.price and("$"..aL(bs.price))or(bs.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Ds.TextXAlignment=Enum.TextXAlignment.Right local up=a.tickBox(df)L.boxes[bs.k]=up local uq=bs.k local function ur()
d.CrateTicks[uq]=(not d.CrateTicks[uq])or nil L.paint()end Q(df.MouseButton1Click:Connect(ur))Q(up.MouseButton1Click:Connect(ur))
end L.built=L.at L.paint()end local us="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a0(cr)us=cr for Dt,mD in ipairs(a.tabKeys)do a[mD].Visible=(mD==cr)local hM=a.tabsAll[Dt]if hM then
local mE=mD==cr hM.b.BackgroundTransparency,hM.b.TextTransparency,hM.bar.Visible=mE and 0 or 1,mE and 0 or 0.45,mE
end end if cr=="pet"and not q.built then pcall(q.build)end if cr=="team"and not z.built then pcall(z.build)end
if cr=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cr=="but"then e6(false)end end q.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(mF,ut,uu,uv)if uv then mF.Text=uv end mF.BackgroundColor3=ut and uu or l.bg mF.TextColor3=ut and a.ink(uu)or l.dim
end function q.paintRow(uw)local cs=q.rows and q.rows[uw]if not cs then return end local ct=d.Pets[uw]or{}local e7=tonumber(ct.f)or 0
a.flag(cs.b,ct.b,l.good)a.flag(cs.g,ct.g,l.accent,ct.g and"BIG"or"ANY")a.flag(cs.w,ct.w,l.warn)a.flag(cs.f,e7>0,l.good,e7>=7 and"7 BIG/HUGE"or(e7>0 and(e7 .." BIG")or"FUSE"))
if cs.row then cs.row.BackgroundColor3=(ct.b or ct.w or e7>0)and l.lit or l.raise end end function q.flag(mG,hN)
local a7=d.Pets[mG]or{}if hN=="f"then local Du={[0]=1,[1]=2,[2]=3,[3]=7}local ux=Du[tonumber(a7 .f)or 0]or 0 a7 .f=ux>0 and ux or nil
elseif a7[hN]then a7[hN]=nil else a7[hN]=true end d.Pets[mG]=(a7 .b or a7 .g or a7 .w or a7 .f)and a7 or nil q.paintRow(mG)
end function q.paintAll()for Dv in pairs(q.rows or{})do q.paintRow(Dv)end if a.pbT then M(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function q.live()if not q.built then q.build()return end if y()-(q.liveAt or 0)<1 then return end q.liveAt=y()
local uy=q.wishes()local e8=q.data()for hO,hP in pairs(q.rows)do hP.name.Text=q.nice(hO)..(uy[hO]and("   * wish %dm"):format(math.ceil(uy[hO]/60))or"")
local uz=C.status(hO,e8)hP.desc.Text=uz and(uz.." | "..hP.boostText)or hP.boostText end local uA=tonumber(H:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(e8 and#(e8 .pets or{})or 0,e8 and tonumber(e8 .maxOwned)or 60,
aL(q.money()),uA>0 and(" | free wishes "..uA)or"",q.buyMsg~=""and q.buyMsg or"-",q.wishMsg~=""and q.wishMsg or"-")
end function q.build()local hQ=q.info()for GQ,hR in ipairs(a.petList:GetChildren())do if hR:IsA("Frame")or hR:IsA("TextLabel")or hR:IsA("TextButton")then hR:Destroy()end
end q.rows={}if not hQ then O(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
q.built=false return end local dg={}for GR,uB in ipairs(q.order())do local mH=hQ.Pets[uB].rarity or"?"dg[mH]=dg[mH]or{}
table.insert(dg[mH],uB)end local dh={}for GS,uC in ipairs(hQ.Rarities or{})do if dg[uC]then dh[#dh+1]=uC end end
for uD in pairs(dg)do if not table.find(dh,uD)then dh[#dh+1]=uD end end for GT,mI in ipairs(dh)do local hS=q.RC[mI]or l.text
local cu=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ac(cu,11)a.stroke(cu,hS,0.7)a.list(cu,4)a.pad(cu,7,7,7,8)local uE=a.row(cu,18)K("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=hS,BorderSizePixel=0},uE)
local Dw=O(uE,mI:upper(),11,hS,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Dw.Font=ag.x for GU,hT in ipairs(dg[mI])do
local e9=K("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cu)},cu)
ac(e9,8)local mJ=O(e9,q.nice(hT),11,hS,true,UDim2 .new(0,9,0,3),UDim2 .new(1,-172,0,17))mJ.TextWrapped,mJ.TextTruncate=false,Enum.TextTruncate.AtEnd
local Dx,Dy=pcall(function()return hQ.describe(hT)end)local uF=Dx and tostring(Dy)or""local mK=O(e9,uF,9,l.dim,false,UDim2 .new(0,9,0,20),UDim2 .new(1,-172,0,16))
mK.TextWrapped,mK.TextTruncate=false,Enum.TextTruncate.AtEnd local function hU(Dz,DA,DB)local uG=ai(e9,Dz,l.bg,8,UDim2 .new(1,DA,0.5,-11),UDim2 .new(0,DB,0,22))
uG.AutoButtonColor=true return uG end local uH,uI,uJ,uK=hU("BUY",-164,30),hU("ANY",-131,30),hU("WISH",-98,34),hU("FUSE",-61,56)
local hV=hT uH.MouseButton1Click:Connect(function()q.flag(hV,"b")end)uI.MouseButton1Click:Connect(function()q.flag(hV,"g")end)
uJ.MouseButton1Click:Connect(function()q.flag(hV,"w")end)uK.MouseButton1Click:Connect(function()q.flag(hV,"f")end)
q.rows[hT]={b=uH,g=uI,w=uJ,f=uK,name=mJ,desc=mK,boostText=uF,row=e9}end end q.built=true q.paintAll()end function j.paint()
M(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])M(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.Calm then j.calm(true)end if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end Q(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
Q(a.pfCalm.MouseButton1Click:Connect(function()j.calm(not d.Calm)j.paint()end))Q(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))
Q(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))Q(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))
Q(a.pfFps.MouseButton1Click:Connect(function()local DC=table.find(j.CAPS,d.FpsCap or 0)or 1 local uL=j.CAPS[(DC%#j.CAPS)+1]
if not j.cap(uL)and uL~=0 then A("this executor cannot cap fps")end j.paint()end))Q(a.pfMemSet.MouseButton1Click:Connect(function()
local mL=tonumber(a.pfMem.Text)if mL and mL>=0 then d.MemLimit=math.floor(mL)end j.paint()end))function z.names()
local mM={"(none)"}for GV,DD in ipairs((z.teams()))do mM[#mM+1]=DD.name end return mM end function z.cycle(mN,DE)
local hW=z.names()local DF=d[mN]~=""and d[mN]or"(none)"local hX=table.find(hW,DF)or 1 hX=((hX-1+DE)%#hW)+1 d[mN]=hW[hX]=="(none)"and""or hW[hX]
z.paint()end function z.paint()if not z.built then return end M(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local mO={}for GW,DG in ipairs((z.teams()))do mO[DG.name]=true end
for DH,uM in pairs(z.pick)do local di=d[DH]uM.Text=di==""and"(none)"or(mO[di]and di or(di.." (missing)"))uM.TextColor3=(di~=""and not mO[di])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(z.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(z.switches,z.finished,z.glazed,C.fused)
..(C.buildMsg~=""and("\n"..C.buildMsg)or"")local DI,hY=q.srv(),{}for GX,hZ in ipairs(z.list or{})do hY[#hY+1]=("st %-2s %-22s %9s  helps %d"):format(hZ.st.Name,ak(V(hZ.name)):sub(1,22),z.clock(hZ.ends-DI),hZ.helps)
end a.tmList.Text=#hY>0 and table.concat(hY,"\n")or"no waxes running"end function z.build()for GY,h0 in ipairs(a.teamList:GetChildren())do
if h0:IsA("Frame")or h0:IsA("TextLabel")or h0:IsA("TextButton")then h0:Destroy()end end z.pick={}local h1=a.card(a.teamList,"Automatic")
a.tmT=a.switch(h1,"AUTO TEAMS: OFF","Auto teams","put on the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=z.current()end z.paint()end)a.tmBuild=a.switch(h1,"AUTO BUILD TEAMS: OFF","Auto build teams","work them out again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild z.paint()end)a.tmBuildNow=a.actions(h1,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if z.editing then return end C.buildMsg="building..."task.spawn(function()local DJ,DK=pcall(C.rebuild,"you asked")if not DJ then A("BUILD ERR "..tostring(DK))end end)
end)a.tmInfo=O(a.row(h1,44),"",10,l.dim,false)a.tmInfo.TextYAlignment=Enum.TextYAlignment.Top local uN=a.card(a.teamList,"Which team when")
local function h2(h3,DL,DM)local e_=a.row(uN,54)O(e_,DL,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))
local uO=O(e_,DM,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))uO.TextWrapped,uO.TextTruncate=false,Enum.TextTruncate.AtEnd
local DN=ai(e_,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))local uP=ai(e_,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))
local DO=ai(e_,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))DN.MouseButton1Click:Connect(function()z.cycle(h3,-1)end)
DO.MouseButton1Click:Connect(function()z.cycle(h3,1)end)uP.MouseButton1Click:Connect(function()z.cycle(h3,1)end)
z.pick[h3]=uP end h2("TeamNormal","Normal","the rest of the time: money + luck")h2("TeamFull","Full","every station busy: money + wax speed")
h2("TeamGlaze","Glaze","worn just before a wax finishes")local h4=a.row(uN,26)O(h4,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))
a.tmLead=hp(h4,tostring(d.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))O(h4,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))
local DP=ai(h4,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))DP.MouseButton1Click:Connect(function()
local h5=tonumber(a.tmLead.Text)if h5 and h5>=5 and h5<=600 then d.GlazeLead=math.floor(h5)else a.tmLead.Text=tostring(d.GlazeLead)end
z.paint()end)h2("TeamWax","Wax","while a butter is placed: head starts")local uQ=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=K("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ag.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(uQ)},uQ)ac(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local DQ=a.card(a.teamList,"How it works")a.note(DQ,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
z.built=true z.paint()end local function DR()a.secB.Text=tostring(d.Every)M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ae(0.1)end if not E.home then pcall(j.unpin)end end)end
M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eJ(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bN(a.root)bN(a.tgRoot)c.lastCollect=y()
mt()L.paint()pcall(q.paintAll)pcall(z.paint)pcall(j.applyAll)end local function DS(uR)task.spawn(function()uR.TextColor3=l.bad
task.wait(0.8)if c.alive then uR.TextColor3=l.text end end)end local function uS()local uT=a.secB.Text:match("^%s*(%d+)%s*$")
local fa=uT and tonumber(uT)if not fa or fa<1 then a.secB.Text=tostring(d.Every)DS(a.secB)A("interval must be a whole number >= 1")
return end if fa==d.Every then return end d.Every,c.lastCollect=fa,y()A("collect every "..fa.."s")end local function N(DT,DU)Q(DT.MouseButton1Click:Connect(DU))end
N(a.secSet,uS)Q(a.secB.FocusLost:Connect(uS))N(a.colT,function()d.Collect,c.lastCollect=not d.Collect,y()M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
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
end function o.changed(DV)task.spawn(function()pcall(o.tick)if DV and not o.on()then o.fails,o.pauseUntil=0,0 pcall(o.sync,true)end
end)o.paint()end N(a.ixT,function()local DW=o.on()d.AutoIndex=not d.AutoIndex o.discAt=-100 o.changed(DW)end)
N(a.bestT,function()local DX=o.on()d.Best=((d.Best or 0)+1)%5 o.stackAt=-100 o.changed(DX)end)N(a.bcT,function()
local DY=o.on()d.BestCrate=not d.BestCrate o.changed(DY)end)N(a.shT,function()d.Shower=not d.Shower o.paint()
end)N(a.snapT,function()d.SnapGlaze=d.SnapGlaze==false o.paint()end)N(a.pbT,function()d.PetBuy=not d.PetBuy q.paintAll()end)
N(a.pwT,function()d.PetWish=not d.PetWish q.paintAll()end)N(a.pfT,function()d.AutoFuse=not d.AutoFuse q.paintAll()end)
function o.admPaint()local bP=q.srv()local cv pcall(function()o.aac=o.aac or require(ah:FindFirstChild("AdminAbuseClient"))
cv=o.aac:GetState()end)local fb,cw="nothing scheduled","the game has not announced one"if type(cv)=="table"then
local fc,dj,fd=tostring(cv.Phase or""),tonumber(cv.StartsAt),tonumber(cv.EndsAt)if fc=="Countdown"and dj then
fb,cw="starts in "..z.clock(dj-bP),os.date("%a %H:%M",math.floor(dj)).." your time"elseif fc=="Live"and fd then
fb,cw="LIVE  -  "..z.clock(fd-bP).." left","the farm is grabbing, waxing and glazing through it"elseif fc~=""and fc~="Idle"and fd and fd>bP then
fb,cw=fc:lower().."  -  "..z.clock(fd-bP).." left","after the show"elseif dj and dj>bP then fb,cw="next: "..os.date("%a %H:%M",math.floor(dj)),"your time"
end if cv.Kind then cw=cw.."  |  "..tostring(cv.Kind)end end a.put(a.admBig,fb)a.put(a.admSub,cw)local dk,mP={},ah:FindFirstChild("AdminShow")
if mP then local DZ,D0=pcall(function()return mP:GetAttributes()end)for uU,dl in pairs(DZ and D0 or{})do local h6=type(uU)=="string"and uU:match("^(.-)Mult$")
local mQ=h6 and tonumber(mP:GetAttribute(h6 .."Until"))if h6 and type(dl)=="number"and dl~=1 and dl~=0 and mQ and mQ>bP then
dk[#dk+1]=("%s  x%s   %s left"):format(h6,(dl%1==0)and tostring(dl)or("%.2f"):format(dl),z.clock(mQ-bP))end end
end table.sort(dk)a.put(a.admBoost,#dk>0 and table.concat(dk,"\n")or"no admin boost running right now")a.admBoost.TextColor3=#dk>0 and l.accent or l.dim
local h7=0 for GZ in pairs(P.drops)do h7=h7+1 end local uV=o.snapAt and(o.snapAt-bP)a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(P.got,P.miss,h7>0 and(", "..h7 .." falling")or"",
uV and("in "..math.max(0,math.floor(uV)).."s")or"none coming"))a.put(a.admFeed,#o.feed>0 and table.concat(o.feed,"\n",math.max(1,#o.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(ar,"opening crate...",dX,true)end)N(a.padB,function()c.plot=bt()or c.plot local uW,mR=ao(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(uW and mR and mR:IsA("BasePart"))then A("SET PAD: need character and plot")return end c.manualPad=mR.CFrame:ToObjectSpace(uW.HumanoidRootPart.CFrame)
AI(c.manualPad)A("collect pad saved at your position")end)N(a.startB,function()eJ(not c.running)end)N(a.buyB,function()
c.plot=bt()or c.plot task.spawn(ar,"buying (manual)...",oN,true)end)N(a.plB,function()c.plot=bt()or c.plot task.spawn(ar,"waxing (manual)...",oR)
end)N(a.tabFarm,function()a0("farm")end)N(a.tabRun,function()a0("run")end)N(a.tabSrv,function()a0("srv")end)N(a.tabAdm,function()a0("adm")end)
N(a.tabBut,function()a0("but")end)N(a.tabSet,function()a0("set")end)N(a.tabCrt,function()a0("crt")end)N(a.tabPet,function()a0("pet")end)
N(a.tabTeam,function()a0("team")end)local function D1(mS)c.hidden=mS a.root.Visible=not mS a.tgBtn.TextColor3=mS and l.text or l.ink
end tL(a.tgBtn,a.tgRoot,function()bN(a.tgRoot)c.togPos=hu(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then D1(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aJ,av={},0 local function bQ()aJ=n7()if#aJ==0 then a.cfgPick.Text="(none saved)"
av=0 return end if av<1 or av>#aJ then av=1 end a.cfgPick.Text=aJ[av]..("  (%d/%d)"):format(av,#aJ)end local function uX()
local uY=c.autoload~=nil a.cfgAuto.Text=uY and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=uY and l.accent or l.panel2
end local function mT()local uZ=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if uZ~=""then return uZ end return(av>0 and aJ[av])or""
end N(a.cfgSave,function()c.winPos=hu(a.root)or c.winPos c.togPos=hu(a.tgRoot)or c.togPos local u0,u1=fS(mT())
a.cfgMsg.Text=u0 and("saved as "..u1)or("could not save: "..u1)a.cfgMsg.TextColor3=u0 and l.good or l.bad bQ()
A(a.cfgMsg.Text)end)local function D2(mU)local mV,u2=of(mU)a.cfgMsg.Text=mV and("loaded "..u2)or("could not load: "..u2)
a.cfgMsg.TextColor3=mV and l.good or l.bad if mV then a.cfgName.Text=mU DR()task.spawn(D.apply,"config "..mU)
end A(a.cfgMsg.Text)end N(a.cfgLoad,function()D2(mT())end)N(a.cfgPick,function()bQ()if av>0 then a.cfgName.Text=aJ[av]end
end)N(a.cfgPrev,function()if#aJ==0 then bQ()return end av=(av-2)%#aJ+1 bQ()a.cfgName.Text=aJ[av]end)N(a.cfgNext,function()
if#aJ==0 then bQ()return end av=av%#aJ+1 bQ()a.cfgName.Text=aJ[av]end)N(a.cfgAuto,function()if c.autoload then
oh(nil)a.cfgMsg.Text="it will not load a config on launch"else local fe=mT()local u3=false for G0,D3 in ipairs(n7())do if D3==fe then u3=true end end
local D4=u3 or fS(fe)if D4 and fe~=""then oh(fe)bQ()a.cfgMsg.Text=fe.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim uX()end)N(a.autoB,function()
local u4,u5=wY()a.autoMsg.Text=u4 and("installed. "..u5)or("failed: "..u5)a.autoMsg.TextColor3=u4 and l.good or l.bad
A(a.autoMsg.Text)end)N(a.startT,function()d.AutoStart=not d.AutoStart M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()d.Rejoin=not d.Rejoin M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()dG("you asked")end)
local bR=false N(a.minB,function()bR=not bR a.tabs.Visible=not bR if bR then for G1,D5 in ipairs(a.tabKeys)do a[D5].Visible=false end
a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,ab.head+6),UDim2 .new(1,-16,0,ab.status)else a.strip.Position,a.strip.Size=UDim2 .new(0,ab.rail+8,0,ab.head+6),UDim2 .new(1,-(ab.rail+16),0,ab.status)
a0(us)end a.root.Size=UDim2 .new(0,ab.w,0,bR and(ab.head+ab.status+12)or ab.h)a.minB.Text=bR and"+"or"-"end)local function h8()
if not c.alive then return end c.alive,c.running=false,false pcall(j.restoreAll)pcall(fr)for G2,D6 in ipairs(ii)do pcall(function()D6:Disconnect()end)end
if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end pcall(function()l2:Destroy()end)
pcall(function()ub:Destroy()end)if cy.SAB_KILL==h8 then cy.SAB_KILL=nil end end cy.SAB_KILL=h8 N(a.killB,h8)N(a.xB,h8)
tL(a.title,a.root,function()bN(a.root)c.winPos=hu(a.root)or c.winPos end)local function u6()local ff,cx=c.reason,c.level
if c.busy then ff,cx=c.busyText,"ok"elseif not c.running then local G3,u7,D7=sQ()if c.capHit then ff,cx=u7,"bad"else ff,cx="[stopped] "..u7,(D7=="bad")and"bad"or"idle"end
c.reason,c.level=ff,cx end local dm=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dm then
a.lit.dot=dm a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dm,dm,dm,dm a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,ff)if a.lit.bar~=cx then a.lit.bar=cx a.bar.BackgroundColor3=BT[cx]or l.dim end
if bR then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local bS=wy()if a.farm.Visible then local D8,D9=fo()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,D8 .."/"..D9)local u8=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(y()-c.lastCollect)))or nil
local u9=aa()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aL(a8()),c.rolls,c.gifts,c.crates,u9 and ak(V(u9))or"nothing",e.on and("   ["..e.title.." window open]")or"",
u8 and("in "..u8 .."s")or"off"))a.put(a.tgt,(#bS==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#bS<=3)and table.concat(bS,", ")or(#bS.." butters ticked"))))
if a.lit.tgt~=(#bS==0)then a.lit.tgt=(#bS==0)a.tgt.TextColor3=(#bS==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fi,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(d.Help or d.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,d.Campfire and J.msg or"campfire is off")
a.put(a.srvGhost,j.ghostMode()>0 and(j.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(o.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bS))
end if a.but.Visible and br.at~=ad.at then e6(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then q.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end if a.team.Visible then z.paint()end if a.farm.Visible then a.put(a.helpL,"help  "..((d.Help or d.HelpGuild)and E.msg or"off"))
a.put(a.campL,"camp  "..(d.Campfire and J.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(d.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,o.msg)local u_=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll: game %s | learned %s%s"):format(D.isOn()and"ON"or"off",u_~=""and u_ or"nothing yet",#D.rec.rules>0 and", choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cy.SAB={S=c,CFG=d,EV=T,U=a,sg=l2,CAT=ad,LEARN=aj,buildList=e6,
logAll=dn,evAll=dp,AR=D,CR=L,PF=j,PX=q,TM=z,CRATE=e,FU=C,HX=E,CF=J,QX=F,IX=o,SH=P}A(bT.." loaded")if c.uiErrs>0 then A("UI: "..c.uiErrs.." properties skipped")end
a0("farm")bN(a.root)bN(a.tgRoot)if hr then pcall(function()Q(hr:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bN(a.root)bN(a.tgRoot)end))end)end bQ()uX()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()o.paint()pcall(q.paintAll)M(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(u6)task.spawn(function()local va=wW()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(va and("\n(backup: "..va..")")or"")
local vb=fM(am.exec)if vb and not vb:find("SAB autoloader v2",1,true)then dC(am.exec,am.stub)A("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fM(am.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(w4)end)task.spawn(function()while c.alive do local D_,Ea=pcall(u6)if not D_ then A("UI ERR "..tostring(Ea))end
task.wait((c.hidden or bR)and 1.5 or 0.4)end end)task.spawn(function()local Eb,Ec=pcall(xb)if not Eb then A("HOOK ERR "..tostring(Ec))end
end)task.spawn(function()pcall(vV)if e.loadSeq and not e.learned then local h9={}for vc=1,20 do if e.loadSeq[vc]then h9[#h9+1]=e.loadSeq[vc]end end
if#h9>0 then e.learned={seq=h9,mode=e.loadMode}A("remembered how to open crates directly")end end if iS()then A(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local Ed,vd=pcall(AK)if Ed and vd and c.alive and not c.manualPad then c.manualPad=vd end end)task.spawn(function()
while c.alive do local mW,mX=pcall(q.buyTick)if not mW then A("PET ERR "..tostring(mX))task.wait(5)end mW,mX=pcall(q.wishTick)
if not mW then A("WISH ERR "..tostring(mX))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local h_,ve=0,y()
Q(game:GetService("RunService").Heartbeat:Connect(function()h_=h_+1 end))Q(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=y()while c.alive do task.wait(1)local vf=y()j.fps,h_,ve=h_/math.max(vf-ve,0.001),0,vf local Ee,Ef=pcall(j.tick)
if not Ee then A("PERF ERR "..tostring(Ef))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local Eg,Eh=pcall(C.tick)if not Eg then A("FUSE ERR "..tostring(Eh))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local Ei,Ej=pcall(z.tick)if not Ei then A("TEAM ERR "..tostring(Ej))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local ia=ah:WaitForChild("Remotes",30)local vg=ia and ia:WaitForChild("ClanEvent",30)
if vg and c.alive then Q(vg.OnClientEvent:Connect(function(Ek,El)if Ek=="call"then pcall(E.onCall,El)end end))
end local vh=ia and ia:FindFirstChild("RollConfirmAsk")if vh and c.alive then Q(vh.OnClientEvent:Connect(function(Em)F.asked=Em or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(j.calmScan)end end end)task.spawn(function()
local mY=ah:WaitForChild("Remotes",30)if not(mY and c.alive)then return end local function ib(En,Eo)local mZ=mY:FindFirstChild(En)
if mZ and mZ:IsA("RemoteEvent")then Q(mZ.OnClientEvent:Connect(function(...)pcall(Eo,...)end))end end ib("NewSquishyDiscovered",function(m0,vi)
if type(m0)~="string"then return end o.disc=o.disc or{}o.disc[V(m0)]=true A(("INDEX: %s%s is in your Index now"):format(ak(V(m0)),vi and(" ("..tostring(vi)..")")or""))
end)ib("IndexRefresh",o.loadDisc)ib("IndexRowComplete",function(Ep)A("INDEX: the whole "..tostring(Ep).." row is complete")end)
ib("AdminShow",o.admin)local vj=mY:FindFirstChild("AdminShowSync")if vj then local Eq,vk=pcall(function()return vj:InvokeServer()end)
if Eq and type(vk)=="table"then for G4,Er in pairs(vk)do pcall(P.add,Er)end end end while c.alive do local Es,Et=pcall(o.tick)
if not Es then o.msg="index error: "..tostring(Et)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Eu,Ev=pcall(F.tick)if not Eu then A("QUEST ERR "..tostring(Ev))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(fr)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Ex=(type(newcclosure)=="function")and newcclosure or function(Ew)return Ew end local m1
local vl=(type(setnamecallmethod)=="function")and setnamecallmethod or nil m1=hookmetamethod(game,"__namecall",Ex(function(vm,...)
local fg=getnamecallmethod()if c.alive and(fg=="InvokeServer"or fg=="FireServer")then local vn,vo=pcall(function()return vm.Name end)
if vn and vo=="CrateAction"and not e.replaying then pcall(e.saw,fg,...)elseif vn and vo=="AutoRollAction"and not D.replaying then pcall(D.saw,fg,...)end
if vl then vl(fg)end end return m1(vm,...)end))e.oldNC=m1 end)end if ig then Q(H.Idled:Connect(function()pcall(function()ig:CaptureController()ig:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for G5=1,90 do if not c.alive then return end if H:GetAttribute("AutoRollOn")~=nil and ao()and(c.plot or bt())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local ic=bY()
if ic and o.on()and not aK(ic.name)then ic=nil end if c.alive and d.AutoRoll and c.running and not D.isOn()and not ic and not aa()
and not e.waiting and not e.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for G6=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bt()if ao()and c.plot and o.any()then eJ(true,true)A("started by itself")
return end task.wait(1)end if c.alive and not c.running then A("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bt()c.lastCollect=y()while c.alive do if c.running then local Ey,vp=pcall(BO)if not Ey and vp~=ih then A("LOOP ERR "..tostring(vp))end
end task.wait(0.1)end end)ie("ready - the window is at the top left")end local EA,m2=xpcall(vt,function(Ez)return tostring(Ez).."\n"..debug.traceback()end)
if not EA then pcall(function()warn("SAB "..bT.." ERROR: "..tostring(m2))end)ie("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bT.." ERROR: "..tostring(m2))end)pcall(function()local vq=(type(getgenv)=="function"and getgenv())or _G
if type(vq.SAB_KILL)=="function"then vq.SAB_KILL()end for G7,EB in ipairs({"SABFarmGui","SABToggle"})do local vr=H.PlayerGui:FindFirstChild(EB)
if vr then vr:Destroy()end end end)pcall(function()local fh=Instance.new("ScreenGui")fh.Name="SABError"fh.ResetOnSpawn=false
fh.DisplayOrder=1000 local a1=Instance.new("TextBox")a1 .Size=UDim2 .new(0,340,0,170)a1 .Position=UDim2 .new(0,10,0,50)
a1 .BackgroundColor3=Color3 .fromRGB(90,20,20)a1 .TextColor3=Color3 .new(1,1,1)a1 .TextSize=11 a1 .TextWrapped=true
a1 .ClearTextOnFocus=false a1 .TextXAlignment=Enum.TextXAlignment.Left a1 .TextYAlignment=Enum.TextYAlignment.Top
a1 .Text="SAB "..bT.." failed to start. Send this text:\n"..tostring(m2)a1 .Parent=fh fh.Parent=H:WaitForChild("PlayerGui")
end)end
