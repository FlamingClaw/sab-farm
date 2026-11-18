local bA="v25"local iy=game:GetService("Players")local C=iy.LocalPlayer or iy.PlayerAdded:Wait()local function ff(nQ)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bA,Text=nQ,Duration=6})
end)end ff("script started")local function nR()local au=game:GetService("ReplicatedStorage")local aB=game:GetService("Workspace")
local iz=game:GetService("UserInputService")local bB=(type(getgenv)=="function"and getgenv())or _G if type(bB.SAB_KILL)=="function"then pcall(bB.SAB_KILL)end
local r=(type(tick)=="function")and tick or os.clock local fg=(function()local nS,nT=pcall(function()return game:GetService("VirtualUser")end)return nS and nT or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,MemLimit=2000,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=r(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local F={name=nil,rar=nil,at=r(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local u={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local d={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local j,o,l={},{},{}local fh={}local fi,dq,b7,b8={},{},{},{}local function L(iA)fi[#fi+1]=iA return iA end local function ah(nU)
task.wait(nU)if not a.alive then error(fh,0)end end local function q(dr)dr=os.date("%H:%M:%S").." "..tostring(dr)
table.insert(dq,1,dr)if#dq>6 then table.remove(dq)end b7[#b7+1]=dr if#b7>80 then table.remove(b7,1)end end local function ds(iB)
if type(iB)~="string"then return""end return(iB:lower():gsub("[^%w]",""))end local function O(nV)local iC=ds(nV)
local fj=iC:gsub("butter$","")if fj==""then fj=iC end return fj end local function aG(fk)return type(fk)=="string"and O(fk)~=""and e.Targets[O(fk)]==true end
local function nW(b9)b9=b9:lower()return b9:find("squishy",1,true)~=nil or b9:match("butter$")~=nil or b9:match("butter[^%a]")~=nil
end local fl={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ao(b_)if type(b_)~="number"then return"?"end
local dt=1 while math.abs(b_)>=1000 and dt<#fl do b_=b_/1000 dt=dt+1 end local nX=string.format("%.2f",b_):gsub("%.?0+$","")
return nX..fl[dt]end local function nY(iD)if type(iD)~="string"then return nil end local nZ,iE=iD:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local fm=tonumber(nZ)if not fm then return nil end if iE==""then return fm end for n0,n1 in ipairs(fl)do if n1:lower()==iE:lower()then return fm*1000^(n0-1)end end
return nil end local function aH()local iF=C:GetAttribute("BoardValueMoney")if type(iF)=="number"then return iF end
local iG=C:FindFirstChild("leaderstats")if iG then for t5,n2 in ipairs({"Cash","Money","Coins"})do local fn=iG:FindFirstChild(n2)
if fn and type(fn.Value)=="number"then return fn.Value end end end end local function du(n3)local fo=n3:GetFullName()
if a.plot then local fp=a.plot:GetFullName()if fo:sub(1,#fp)==fp then return fo:sub(#fp+2)end end return fo end
local function aI()local dv=C.Character if dv and dv:FindFirstChild("HumanoidRootPart")then local iH=dv:FindFirstChildOfClass("Humanoid")
if iH and iH.Health>0 then return dv end end end local function aW()local fq=aB:FindFirstChild("Plots")if not fq then return nil end
local function iI(n4)local iJ=n4:FindFirstChild("Plate")return iJ~=nil and iJ:FindFirstChild("EditStackAttachment",true)~=nil
end local iK=C:GetAttribute("PlotNumber")if iK~=nil then local fr=fq:FindFirstChild(tostring(iK))if fr and iI(fr)then return fr end
end for t6,iL in ipairs(fq:GetChildren())do if iI(iL)then return iL end end end local function ca(iM)local aX=iM and iM.Parent
for t7=1,6 do if not aX then return nil end if aX:IsA("BasePart")then return aX end if aX:IsA("Model")then return aX.PrimaryPart or aX:FindFirstChildWhichIsA("BasePart",true)end
aX=aX.Parent end end local function iN(iO)local fs=iO.Parent if fs and fs:IsA("Attachment")then return fs.WorldPosition end
local iP=ca(iO)return iP and iP.Position end local function n5()local bC=a.plot and a.plot:FindFirstChild("Plate")
if not bC then return nil end if bC:IsA("BasePart")then return bC.Position end if bC:IsA("Model")then return bC:GetPivot().Position end
local iQ=bC:FindFirstChildWhichIsA("BasePart",true)return iQ and iQ.Position end local function iR()local ft={}
local iS=a.plot and a.plot:FindFirstChild("WaxStations")if iS then for t8,n6 in ipairs(iS:GetChildren())do local iT=n6:FindFirstChild("SquishyPlaceHolder")
local fu=iT and iT:FindFirstChild("PlacePrompt")if fu and fu:IsA("ProximityPrompt")then ft[#ft+1]=fu end end end
return ft end local function dw()local iU,fv=iR(),0 for t9,n7 in ipairs(iU)do if n7 .Enabled then fv=fv+1 end end
local fw=#iU local fy=C:GetAttribute("WaxStations")if type(fy)=="number"and fy>fw then fw=fy end return fv,fw
end local function n8()local iV=aI()local iW=iV and iV.HumanoidRootPart.Position local fz,iX for t_,fA in ipairs(iR())do
if fA.Enabled then local iY=iN(fA)local iZ=(iY and iW)and(iY-iW).Magnitude or 1e9 if not fz or iZ<iX then fz,iX=fA,iZ end
end end return fz end local function i0()local dx=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not dx then return nil end local i1=dx:FindFirstChild("BuyPromptAttachment")local dy=(i1 and i1:FindFirstChild("BuyPrompt"))or dx:FindFirstChild("BuyPrompt",true)
if dy and dy:IsA("ProximityPrompt")and dy:IsDescendantOf(dx)then return dy end end local i2={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local n9={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local Q={order={},price={},dirty=false}local A={seen={},at=0,boxes={},built=0}local K={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local fB="SAB_order.txt"local function dz()if not Q.dirty or type(writefile)~="function"then return end local ai={}
for n_,oa in pairs(Q.price)do ai[#ai+1]="P|"..n_.."|"..string.format("%.0f",oa)end for ob,oc in pairs(Q.order)do ai[#ai+1]="O|"..ob.."|"..table.concat(oc,",")end
if d.learned and d.enc then ai[#ai+1]="M|mode|"..tostring(d.learned.mode or"")for od,dA in ipairs(d.learned.seq)do
local i3={}for i4=1,dA.n do i3[i4]=d.enc(dA.args[i4])end ai[#ai+1]=("A|%d|%s|%d|%s"):format(od,dA.m,dA.n,table.concat(i3,";"))
end end local function fC(oe,of,dB)local i5={}for i6=1,dB.n do i5[i6]=d.enc(dB.args[i6])end ai[#ai+1]=("R|%d|%s|%s|%d|%s"):format(of,oe,dB.m,dB.n,table.concat(i5,";"))
end if d.enc then for og,oh in ipairs(u.rec.rules)do fC("rules",og,oh)end if u.rec.on then fC("on",0,u.rec.on)end
if u.rec.off then fC("off",0,u.rec.off)end end for ua,cb in pairs(A.seen)do ai[#ai+1]=("K|%s|%s|%s|%s"):format(cb.name,cb.title or"",cb.rar or"",cb.price and string.format("%.0f",cb.price)or"")
end if pcall(writefile,fB,table.concat(ai,"\n"))then Q.dirty=false end end local function oi()if type(isfile)~="function"or type(readfile)~="function"then return end
local oj,ol=pcall(isfile,fB)if not(oj and ol)then return end local om,i7=pcall(readfile,fB)if not(om and type(i7)=="string")then return end
for oo in i7:gmatch("[^\n]+")do local bD,bE,aJ=oo:match("^(%a)|([^|]+)|(.*)$")if bD=="P"then Q.price[bE]=tonumber(aJ)
elseif bD=="M"then d.loadMode=(aJ~=""and aJ~="nil")and aJ or nil elseif bD=="A"and d.dec then local i8=tonumber(bE)
local i9,dC,op=aJ:match("^([^|]+)|(%d+)|(.*)$")if i8 and i9 then dC=tonumber(dC)local i_,dD={},0 for oq in(op..";"):gmatch("([^;]*);")do
dD=dD+1 if dD<=dC then i_[dD]=d.dec(oq)end end d.loadSeq=d.loadSeq or{}d.loadSeq[i8]={m=i9,n=dC,args=i_}end elseif bD=="R"and d.dec then
local ja=tonumber(bE)local dE,ot,dF,ou=aJ:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if ja and dE then dF=tonumber(dF)
local jb,dG={},0 for ov in(ou..";"):gmatch("([^;]*);")do dG=dG+1 if dG<=dF then jb[dG]=d.dec(ov)end end local fD={m=ot,n=dF,args=jb}
if dE=="rules"then u.rec.rules[ja]=fD elseif dE=="on"then u.rec.on=fD elseif dE=="off"then u.rec.off=fD end end
elseif bD=="K"then local jc,jd,ow=aJ:match("^([^|]*)|([^|]*)|(.*)$")A.seen[A.key(bE)]={name=bE,title=jc~=""and jc or nil,
rar=jd~=""and jd or nil,price=tonumber(ow)}elseif bD=="O"and aJ~=""then local dH={}for ox in aJ:gmatch("[^,]+")do dH[#dH+1]=ox end
if#dH>0 then Q.order[bE]=dH end end end end local function oy(dI)if type(dI)~="table"then return end local bf,je=dI.rarity,dI.contents
if type(bf)~="string"or bf==""or type(je)~="table"then return end local cc={}for ub,dJ in ipairs(je)do if type(dJ)=="table"and type(dJ.butter)=="string"then
cc[#cc+1]={n=dJ.butter,ch=tonumber(dJ.chance)or 0}end end if#cc==0 then return end table.sort(cc,function(oz,oA)return oz.ch>oA.ch end)
local cd,ce={},false for oB,oC in ipairs(cc)do cd[oB]=oC.n end local fE=Q.order[bf]if not fE or#fE~=#cd then ce=true end
if not ce then for jf=1,#cd do if fE[jf]~=cd[jf]then ce=true break end end end Q.order[bf]=cd local fF=tonumber(dI.price)
if fF and Q.price[bf]~=fF then Q.price[bf]=fF ce=true end if ce then Q.dirty=true K.at=0 q("learned the "..bf.." order from its crate")
end end local function bF(oD,oE)local oF=oD:FindFirstChild(oE,true)local oG,fG=pcall(function()return oF.Text end)
return(oG and type(fG)=="string"and fG~="")and fG or nil end local function V(jg)return K.pretty[jg]or jg end
A.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function A.key(oH)return ds(oH or"")end
function A.learn(aK)if type(aK)~="table"or type(aK.name)~="string"then return end local fH=A.key(aK.name)local aL=A.seen[fH]or{}
local oI=(A.seen[fH]==nil)or(tonumber(aK.price)and aL.price~=tonumber(aK.price))aL.name,aL.title=aK.name,aK.title or aL.title
aL.rar,aL.price=aK.rarity or aL.rar,tonumber(aK.price)or aL.price A.seen[fH]=aL if oI then A.at,Q.dirty=r(),true end
end function A.wanted(jh)return jh~=nil and e.CrateTicks[A.key(jh)]==true end function A.list()local bG={}for oJ,dK in ipairs(A.base)do bG[A.key(dK[1])]={name=dK[1],title=dK[2],rar=dK[3],i=oJ}end
for uc,cf in ipairs(K.rarOrder)do local ji=false for ud,oK in pairs(bG)do if oK.rar==cf then ji=true break end end
if not ji and cf~="?"then local jj=cf:gsub("[^%w]","").."Crate"bG[A.key(jj)]={name=jj,title=cf.." Crate",rar=cf,i=50,guess=true}
end end for jk,dL in pairs(A.seen)do local aC=bG[jk]or{i=100}aC.name,aC.title,aC.rar=dL.name or aC.name,dL.title or aC.title,dL.rar or aC.rar
aC.price,aC.guess=dL.price or aC.price,nil bG[jk]=aC end local cg,dM={},{}for oL,oM in ipairs(i2)do cg[oM]=oL end
for oN,jl in ipairs(K.rarOrder)do cg[jl]=cg[jl]or(20+oN)end for oO,ci in pairs(bG)do ci.k=oO ci.price=ci.price or Q.price[ci.rar or""]
dM[#dM+1]=ci end table.sort(dM,function(bh,bi)if bh.price and bi.price and bh.price~=bi.price then return bh.price<bi.price end
local jm,jn=cg[bh.rar or""]or 99,cg[bi.rar or""]or 99 if jm~=jn then return jm<jn end if(bh.i or 100)~=(bi.i or 100)then return(bh.i or 100)<(bi.i or 100)end
return bh.k<bi.k end)return dM end local function oP()local jo=au:FindFirstChild("Assets")local jp=jo and jo:FindFirstChild("Squishies")
if not jp then return false end local fI,jq,bH={},{},{}local dN=0 for ue,dO in ipairs(jp:GetChildren())do local cj=O(dO.Name)
if cj~=""and not fI[cj]then local dP=bF(dO,"RarityText")or"?"fI[cj]=dP jq[cj]=bF(dO,"NameText")or dO.Name bH[dP]=bH[dP]or{}
table.insert(bH[dP],cj)dN=dN+1 end end if dN==0 then return false end for jr,oQ in pairs(bH)do local js=Q.order[jr]or n9[jr]
local fJ={}if js then for oR,oS in ipairs(js)do fJ[O(oS)]=oR end end table.sort(oQ,function(jt,ju)local fK,fL=fJ[jt],fJ[ju]
if fK and fL then return fK<fL end if fK then return true end if fL then return false end return V(jt)<V(ju)end)
end local fM={}for oT,oU in ipairs(i2)do fM[oU]=oT end local dQ={}for oV in pairs(bH)do dQ[#dQ+1]=oV end table.sort(dQ,function(fN,fO)
local fP,fQ=Q.price[fN],Q.price[fO]if fP and fQ and fP~=fQ then return fP<fQ end local fR,fS=fM[fN],fM[fO]if fR and fS then return fR<fS end
if fR then return true end if fS then return false end return fN<fO end)K.rar,K.pretty,K.members,K.rarOrder,K.n,K.at=fI,jq,bH,dQ,dN,r()
return true end local function fT()if K.at==0 or(r()-K.at)>120 then pcall(oP)end return K.n>0 end local function oW(oX)
local jv=O(oX)return K.rar[jv]or(F.name and O(F.name)==jv and F.rar)or"?"end local function oY()local dR={}for oZ,o0 in pairs(e.Targets)do if o0 then dR[#dR+1]=V(oZ)end end
table.sort(dR)return dR end local T={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function jw()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function dS(jx)if type(makefolder)~="function"then return end local o1,o2=pcall(isfolder,jx)if not(o1 and o2)then pcall(makefolder,jx)end
end local function dT(jy)if type(isfile)~="function"or type(readfile)~="function"then return nil end local o3,o4=pcall(isfile,jy)
if not(o3 and o4)then return nil end local o5,o6=pcall(readfile,jy)return o5 and o6 or nil end local function ck(o7,o8)
if type(writefile)~="function"then return false end return(pcall(writefile,o7,o8))end local function jz(o9)local cl={}
if type(listfiles)~="function"then return cl end local o_,jA=pcall(listfiles,o9)if not o_ or type(jA)~="table"then return cl end
for uf,pa in ipairs(jA)do cl[#cl+1]=tostring(pa)end return cl end local function jB()local dU={}for ug,pb in ipairs(jz(T.cfg))do
local jC=pb:match("([^/\\]+)%.txt$")if jC then dU[#dU+1]=jC end end table.sort(dU)return dU end local function pc()
local J={"V|1"}J[#J+1]="N|Every|"..tostring(e.Every)J[#J+1]="N|GlazeLead|"..tostring(e.GlazeLead)J[#J+1]="N|FpsCap|"..tostring(e.FpsCap)
J[#J+1]="N|MemLimit|"..tostring(e.MemLimit)for uh,jD in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do J[#J+1]="S|"..jD.."|"..e[jD]end
do local dV={}for pd,fU in pairs(e.Pets)do local jE=(fU.b and"b"or"")..(fU.g and"g"or"")..(fU.w and"w"or"")if jE~=""then dV[#dV+1]=pd.."|"..jE end
end table.sort(dV)J[#J+1]="P|-"for ui,pe in ipairs(dV)do J[#J+1]="P|"..pe end end for uj,jF in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender"})do
J[#J+1]="B|"..jF.."|"..(e[jF]and"1"or"0")end local fV=C:GetAttribute("AutoRollRules")if type(fV)=="string"and fV~=""then e.ARrules,e.ARstop=fV,tostring(C:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then J[#J+1]="S|rules|"..e.ARrules J[#J+1]="S|stop|"..e.ARstop end if a.winPos then J[#J+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then J[#J+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for uk,fW in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local dW={}for pf,pg in pairs(fW[2])do if pg then dW[#dW+1]=pf end end table.sort(dW)J[#J+1]=fW[1].."|-"for ul,ph in ipairs(dW)do J[#J+1]=fW[1].."|"..ph end
end return table.concat(J,"\n")end local function pj(fX)if type(fX)~="string"or fX==""then return false end local jG,jH,jI,jJ,cm={},false,{},false,nil
for pk in fX:gmatch("[^\n]+")do local ap,P,aj=pk:match("^(%a)|([^|]*)|?(.*)$")if ap=="N"and P=="Every"then local fY=tonumber(aj)
if fY and fY>=1 then e.Every=math.floor(fY)end elseif ap=="N"and(P=="FpsCap"or P=="MemLimit")then local fZ=tonumber(aj)
if fZ and fZ>=0 then e[P]=math.floor(fZ)end elseif ap=="N"and P=="GlazeLead"then local dX=tonumber(aj)if dX and dX>=5 and dX<=600 then e.GlazeLead=math.floor(dX)end
elseif ap=="S"and(P=="TeamNormal"or P=="TeamFull"or P=="TeamGlaze"or P=="TeamWax")then e[P]=aj elseif ap=="P"and P~=""then
if not cm then cm={}end if P~="-"and aj~=""then cm[P]={b=aj:find("b",1,true)and true or nil,g=aj:find("g",1,true)and true or nil,
w=aj:find("w",1,true)and true or nil}end elseif ap=="B"then if e[P]~=nil then e[P]=(aj=="1")end elseif ap=="S"and P=="rules"then
e.ARrules=aj elseif ap=="S"and P=="stop"then e.ARstop=aj elseif ap=="W"then a.winPos={tonumber(P)or 10,tonumber(aj)or 44}
elseif ap=="G"then a.togPos={tonumber(P)or 10,tonumber(aj)or 300}elseif ap=="T"and P~=""then if P~="-"then jG[P]=true end
jH=true elseif ap=="K"and P~=""then if P~="-"then jI[P]=true end jJ=true end end if jH then e.Targets=jG end if jJ then e.CrateTicks=jI end
if cm then e.Pets=cm end return true end local function dY(bI)if not jw()then return false,"this executor cannot write files"end
bI=(bI or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if bI==""then return false,"give the config a name"end
dS(T.dir)dS(T.cfg)if not ck(T.cfg.."/"..bI..".txt",pc())then return false,"could not write the file"end a.config=bI
return true,bI end local function jK(dZ)local jL=dT(T.cfg.."/"..dZ..".txt")if not jL then return false,"no config called "..tostring(dZ)end
if not pj(jL)then return false,"that config looks empty"end a.config=dZ return true,dZ end local function jM(f0)
if f0 then dS(T.dir)ck(T.auto,f0)elseif type(delfile)=="function"then pcall(delfile,T.auto)else ck(T.auto,"")
end a.autoload=f0 end local function pl()if a.selfPath then return a.selfPath end local d0 for um,pm in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",T.dir})do
for un,jN in ipairs(jz(pm))do local f1=jN:lower()if f1:sub(-4)==".lua"and(f1:find("sab_farm",1,true)or f1:find("sab farm",1,true))then
d0=d0 or jN end end end a.selfPath=d0 return d0 end T.stub=[[
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
local function pn()if not jw()then return false,"this executor cannot write files"end dS("autoexec")if not ck(T.exec,T.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local d1=(function()local po,pp=pcall(function()return game:GetService("TeleportService")end)return po and pp or nil end)()
local function f2()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local pq=queueonteleport or queue_on_teleport return(pcall(pq,T.stub))end local function cn(pr)if a.rejoining then return end
a.rejoining=true q("REJOIN ("..pr..")")pcall(dz)if a.autoload then pcall(dY,a.autoload)end local ps=f2()q(ps and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for uo=1,30 do if not d1 then break end pcall(function()d1:Teleport(game.PlaceId,C)end)task.wait(10)
end end)end local function pt()local pu,jO=pcall(function()return game:GetService("GuiService")end)if pu and jO then
pcall(function()L(jO.ErrorMessageChanged:Connect(function()if e.Rejoin then cn("roblox error message")end end))
end)end pcall(function()local jP=game:GetService("CoreGui")local jQ=jP and jP:WaitForChild("RobloxPromptGui",15)
local jR=jQ and jQ:WaitForChild("promptOverlay",15)if jR then L(jR.ChildAdded:Connect(function(pv)if e.Rejoin and tostring(pv.Name):lower():find("errorprompt",1,true)then cn("disconnect prompt")end
end))end end)pcall(function()L(C.OnTeleport:Connect(function(pw)if tostring(pw):find("Started")then f2()end end))
end)if d1 then pcall(function()L(d1 .TeleportInitFailed:Connect(function()a.rejoining=false if e.Rejoin then task.delay(5,function()cn("teleport retry")end)end
end))end)end end local function jS(px)local jT=a.plot and a.plot:FindFirstChild(px)if not jT then return nil,false end
for up,f3 in ipairs(jT:GetChildren())do if f3:IsA("Model")or f3:IsA("BasePart")then return f3,true end end return nil,true
end local function co()local aY=jS("RolledSquishy")if not aY then return nil end return{model=aY,name=aY.Name,pretty=bF(aY,"NameText")or V(O(aY.Name)),
rar=bF(aY,"RarityText")or oW(aY.Name),price=bF(aY,"PriceText")}end local function jU(f4)return type(f4)=="string"and(K.rar[O(f4)]~=nil or nW(f4))
end local function M()local f5=jS("SquishyEquipped")if f5 then a.carrySrc,d.heldAt="model",r()return f5 .Name,f5 end
local jV=C.Character if jV then for uq,cp in ipairs(jV:GetDescendants())do if(cp:IsA("Model")or cp:IsA("Tool"))and jU(cp.Name)then
a.carrySrc,d.heldAt="character",r()return cp.Name,cp end end end local d2=C:GetAttribute("SquishyEquipped")if type(d2)=="string"and d2~=""and jU(d2)and r()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return d2,nil end a.carrySrc=nil end local function ur()local us,py=M()return py end local function jW()
local jX=co()local f6=jX and nY(jX.price)local f7=aH()if f6 and f7 and f7<f6*0.5 then return f7,f6 end end local function bJ(pz)
b8[#b8+1]=os.date("%H:%M:%S").." "..pz if#b8>40 then table.remove(b8,1)end end local function pA(bj,d3)if type(bj)~="string"then return end
bJ(("Roll(%s,%s)"):format(bj,tostring(d3)))if bj:lower():find("crate",1,true)then d.rolled,d.rolledAt=bj,r()return
end F.seq=F.seq+1 F.name,F.at=bj,r()F.rar=type(d3)=="string"and d3 or nil a.rolls=a.rolls+1 if aG(bj)then q(("ROLL %s [%s] = TARGET"):format(bj,tostring(d3)))end
end local function pB(bk)if type(bk)~="table"then return end local d4=bk.butter or bk.itemName if type(d4)~="string"then return end
a.gifts=a.gifts+1 F.gift,F.giftAt=d4,r()if type(bk.giftId)=="string"then local jY=au:FindFirstChild("Remotes")
local jZ=jY and jY:FindFirstChild("GiftThanks")if jZ then pcall(function()jZ:FireServer(bk.giftId)end)end end
bJ("Gift("..d4 .." from "..tostring(bk.fromName)..")")q(("GIFT from %s: %s - it will not be waxed"):format(tostring(bk.fromName),d4))
end local function pC()local j0=au:WaitForChild("Remotes",30)if not a.alive then return end if not j0 then q("Remotes folder missing - no roll events")return end
L(C:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local j1=C:GetAttribute("SquishyEquipped")
if type(j1)=="string"and j1~=""then d.heldAt=r()end end))local pI={SquishyRollAnimation=pA,InitSquishy=function(j2)F.init,F.initAt=tostring(j2),r()bJ("Init("..tostring(j2)..")")end,
CrateUpdate=function(bK,j3)pcall(oy,bK)pcall(A.learn,bK)if type(bK)=="table"then local pD=j3==true or(d.rolled~=nil and r()-d.rolledAt<15)or d.waiting
if not pD then return end local pE=not d.waiting local pF=d.on d.waiting,d.data,d.at=true,bK,r()d.on=(j3==true)
d.title=tostring(bK.title or bK.name or"crate")if d.on and not pF then d.openedAt,d.byYou=r(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then bJ("CrateWindow open("..d.title..")")elseif pE then bJ("Crate waiting("..d.title..")")q(d.title.." is waiting on your stand")
end else if d.waiting then bJ("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local pG=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,pG)end if d.classify then local pH=r()
task.spawn(function()pcall(d.classify,pH)end)end end end,GiftReceived=pB,}for d5,pJ in pairs(pI)do local f8=j0:FindFirstChild(d5)
if f8 and f8:IsA("RemoteEvent")then L(f8 .OnClientEvent:Connect(pJ))elseif d5~="CrateUpdate"and d5~="GiftReceived"then q("remote "..d5 .." missing")end
end end local function f9()local bl=co()if bl then if aG(bl.name)then return{state="match",shown=bl.pretty,src="pad",info=bl}
end return{state="skip",info=bl,level="idle",text=("on pad: %s [%s] - not ticked"):format(bl.pretty,tostring(bl.rar))}
end if F.name and(r()-F.at)<4 then if aG(F.name)then return{state="match",shown=V(O(F.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(V(O(F.name)),tostring(F.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function j4(pK,pL,pM,pN)
local d6=RaycastParams.new()d6 .FilterType=Enum.RaycastFilterType.Exclude local f_={C.Character}for ut,pO in ipairs(pN or{})do f_[#f_+1]=pO end
d6 .FilterDescendantsInstances=f_ pcall(function()d6 .RespectCanCollide=true end)local j5=aB:Raycast(Vector3 .new(pK,pL+4,pM),Vector3 .new(0,-30,0),d6)
return j5 and j5 .Position or nil end local function ga(j6)local j7=j6:FindFirstChildOfClass("Humanoid")return((j7 and j7 .HipHeight)or 2)+j6 .HumanoidRootPart.Size.Y/2+0.2
end local function gb(pP,pQ)local j8=pP:FindFirstChildOfClass("Humanoid")local pR=r()while r()-pR<pQ do if j8 and j8 .FloorMaterial~=Enum.Material.Air then return true end
ah(0.05)end return false end local function cq(pS,gc,gd)local j9=pS.HumanoidRootPart j9 .AssemblyLinearVelocity=Vector3 .new(0,0,0)
j9 .CFrame=gd and CFrame.new(gc,Vector3 .new(gd.X,gc.Y,gd.Z))or CFrame.new(gc)end local function cr(aM,j_)local bm=aI()
if not bm or not aM then return false end local aZ=aM.Position local d7=math.clamp(math.max(aM.Size.X,aM.Size.Z)/2+2.2,3,7)
local ka=(j_ and j_.MaxActivationDistance)or 10 if d7>ka-2 then d7=math.max(2.5,ka-2)end local cs={}local function bn(ct)
ct=Vector3 .new(ct.X,0,ct.Z)if ct.Magnitude>0.05 then cs[#cs+1]=ct.Unit end end local kb=n5()if kb then bn(kb-aZ)end
bn(aM.CFrame.LookVector)bn(-aM.CFrame.LookVector)bn(aM.CFrame.RightVector)bn(-aM.CFrame.RightVector)bn(bm.HumanoidRootPart.Position-aZ)
if#cs==0 then bn(Vector3 .new(0,0,1))end local pT,d8=ga(bm),false for uu,pU in ipairs(cs)do local d9=aZ+pU*d7
local ge=j4(d9 .X,aZ.Y,d9 .Z,{aM})if ge and math.abs(ge.Y-aZ.Y)<14 then cq(bm,Vector3 .new(d9 .X,ge.Y+pT,d9 .Z),aZ)
if gb(bm,0.7)then d8=true break end end end if not d8 then cq(bm,aZ+cs[1]*d7+Vector3 .new(0,3,0),aZ)d8=gb(bm,1)
end ah(0.12)return d8 end local function pV(cu)if not cu.Parent or not cu.Enabled then return false end pcall(function()cu:InputHoldBegin()end)
ah(math.max(cu.HoldDuration,0)+0.08)pcall(function()cu:InputHoldEnd()end)return true end local function ae(kc,pW)
local pX=r()while r()-pX<pW do if kc()then return true end ah(0.05)end return kc()end local function d_(bL,pY,kd,pZ)
local p0=a.zapFirst and{"zap","hold"}or{"hold","zap"}for p1,gf in ipairs(p0)do if p1==2 and(pZ or not(bL.Parent and bL.Enabled and(not kd or kd())))then break end
local gg if gf=="hold"then gg=pV(bL)else gg=type(fireproximityprompt)=="function"and bL.Parent~=nil and bL.Enabled and pcall(fireproximityprompt,bL)end
if gg and ae(pY,1.2)then a.zapFirst=(gf=="zap")return true,gf end end return false end local function ke(gh)local a0=i0()
if not a0 or not a0 .Enabled then q("buy: nothing on the pad")return false end local kf=ca(a0)if not kf then q("buy: pad part missing")return false end
a.lastBuyAt=r()local p2,kg=F.seq,aH()cr(kf,a0)if not a0 .Enabled then q("buy aborted: pad emptied")return false end
local bM=f9()if not gh and bM.state~="match"then q("buy aborted: "..(bM.text or"pad changed"))a.matchSince=nil
return false end local gi=bM.info and bM.info.name or(bM.state=="match"and F.name)or nil local function p3()return a0 .Enabled and M()==nil and(gh or f9().state=="match")
end local p4,p5=d_(a0,function()return M()~=nil or((not a0 .Enabled)and(gh or F.seq==p2))end,p3,jW()~=nil)if p4 then
ae(function()return M()~=nil end,0.8)local cv=M()local kh=aH()a.holding,a.bought,a.cashFails=true,a.bought+1,0
a.matchSince=nil F.name,F.rar,F.at=nil,nil,r()q(("BOUGHT %s%s via %s"):format(cv and V(O(cv))or(bM.shown or"?"),(kg and kh)and(" for $"..ao(kg-kh))or"",p5))
if cv and gi and O(cv)~=O(gi)then q(("note: picked up %s, not %s"):format(cv,gi))end return true end a.cashFails=a.cashFails+1
a.noCashUntil=r()+math.min(8*2^(a.cashFails-1),60)local ki=co()q(("BUY REFUSED: cash short? have $%s, price %s"):format(ao(aH()),(ki and ki.price)or"?"))
return false end local function kj()local ea=M()if not ea then a.holding=false q("place: hands are empty")return false
end if not aG(ea)then q(("REFUSED TO WAX %s - it is not ticked"):format(V(O(ea))))return false end for uv=1,e.PlaceTries do
local a1=n8()if not a1 then q("place: no free station")break end local kk=ca(a1)if kk then cr(kk,a1)local kl=M()
if not kl then a.holding=false q("place: hands emptied on the way")return false end if not aG(kl)then q("place: what I carry changed, not waxing it")return false end
if a1 .Enabled then local p6,p7=d_(a1,function()return not a1 .Enabled end,function()return a1 .Enabled end)if p6 then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=r()+2.5,0 F.name,F.rar,F.at=nil,nil,r()
q(("WAXED %s #%d at %s via %s"):format(V(O(ea)),a.placed,a1 .Parent.Parent.Name,p7))return true end end end ah(0.25)
end a.placeFails=a.placeFails+1 if M()==nil then a.holding=false end q("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then
a.capHit,a.running,a.capAt=true,false,r()a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(M()))q(a.capMsg)end return false end function o.place()if e.Teams and e.TeamWax~=""then o.placing=true
local p8=r()while a.alive and o.current()~=e.TeamWax and r()-p8<5 do ah(0.1)end if o.current()==e.TeamWax then
local km,p9=o.expectSocialWax(e.TeamWax),r()while a.alive and km>0 and(tonumber(C:GetAttribute("PetSocialWax"))or 0)<km-1e-6 and r()-p9<4 do ah(0.1)end
ah(0.25)else q("wax team did not come on in time - placing anyway")end end local p_,kn=pcall(kj)o.placing=false
if not p_ then error(kn,0)end return kn end local function ko(kp)return type(kp)=="string"and kp:lower():find("crate",1,true)~=nil
end local qa={SABFarmGui=1,SABToggle=1,SABError=1}local function gj(qb)local a2=qb while a2 do if qa[a2 .Name]then return false end
if a2:IsA("ScreenGui")then local qc,qd=pcall(function()return a2 .Enabled end)return(not qc)or qd~=false end if a2:IsA("GuiObject")and not a2 .Visible then return false end
a2=a2 .Parent end return false end local function eb(ec)local bN=""pcall(function()if ec:IsA("TextButton")then bN=ec.Text end end)
if not bN:find("%a")then for uw,ed in ipairs(ec:GetDescendants())do if(ed:IsA("TextLabel")or ed:IsA("TextButton"))and ed.Text:find("%a")then bN=ed.Text break end
end end if not bN:find("%a")then bN=ec.Name end return(bN:lower():gsub("[^%a]",""))end local function qe()local cw,cx
local kq=C:FindFirstChildOfClass("PlayerGui")if not kq then return nil,nil end for ux,cy in ipairs(kq:GetDescendants())do
if cy:IsA("GuiButton")and gj(cy)then local gk=eb(cy)if gk:sub(1,4)=="open"and not gk:find("shop",1,true)then cw=cw or cy end
if gk:sub(1,7)=="discard"then cx=cx or cy end end end if cw and cx then return cw,cx end if d.on then return cw,cx end
return nil,nil end local gl=(function()local qf,qg=pcall(function()return game:GetService("VirtualInputManager")end)return qf and qg or nil end)()
local function kr(aN,gm)local gn={}local function ks(qh)gn[#gn+1]=qh end if a.tapWay then ks(a.tapWay)end for uy,kt in ipairs({"touch","conn","signal"})do
if kt~=a.tapWay then ks(kt)end end local function ku(qi,...)local qj,go=pcall(getconnections,qi)if not(qj and type(go)=="table"and#go>0)then return false end
local kv,qk,ql=false,{...},select("#",...)for uz,qm in ipairs(go)do if pcall(function()qm:Fire(table.unpack(qk,1,ql))end)then kv=true end
end return kv end local function kw()local kx=Vector3 .new(0,0,0)pcall(function()local ky,kz=aN.AbsolutePosition,aN.AbsoluteSize
kx=Vector3 .new(ky.X+kz.X/2,ky.Y+kz.Y/2,0)end)local gp={Position=kx,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()gp.UserInputType=Enum.UserInputType.Touch end)pcall(function()gp.UserInputState=Enum.UserInputState.End end)
return gp end for uA,aO in ipairs(gn)do local cz=false if aO=="conn"and type(getconnections)=="function"then if ku(aN.MouseButton1Click)then
cz=true if ae(gm,1.5)then a.tapWay=aO return true,aO end end cz=ku(aN.Activated,kw(),1)elseif aO=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aN.MouseButton1Click)then if ae(gm,1.5)then a.tapWay=aO return true,aO end end cz=pcall(firesignal,aN.Activated,kw(),1)
elseif aO=="touch"and gl then cz=pcall(function()local kA,kB=aN.AbsolutePosition,aN.AbsoluteSize local kC=0 local kD=aN:FindFirstAncestorWhichIsA("ScreenGui")
local qn,qo=pcall(function()return kD and kD.IgnoreGuiInset end)if not(qn and qo)then pcall(function()kC=game:GetService("GuiService"):GetGuiInset().Y end)
end local kE,kF=kA.X+kB.X/2,kA.Y+kB.Y/2+kC gl:SendMouseButtonEvent(kE,kF,0,true,game,1)task.wait(0.06)gl:SendMouseButtonEvent(kE,kF,0,false,game,1)
end)end if cz and ae(gm,1.5)then a.tapWay=aO return true,aO end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function gq(kG)local cA=kG.Parent while cA and cA~=a.plot do if d.NOT[cA.Name]then return false end cA=cA.Parent
end local gr=(kG.ActionText or""):lower()if gr:find("roll",1,true)or gr:find("place",1,true)or gr:find("sell",1,true)then return false end
return true end local function qp()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local kH=a.plot:FindFirstChild("CrateStand")local cB if kH then for uB,ee in ipairs(kH:GetDescendants())do
if ee:IsA("ProximityPrompt")and ee.Enabled and gq(ee)then cB=ee break end end end if not cB then for uC,a3 in ipairs(a.plot:GetDescendants())do
if a3:IsA("ProximityPrompt")and a3 .Enabled and gq(a3)then local kI=a3:FindFirstAncestorWhichIsA("Model")local qq=((a3 .ActionText or"").." "..(a3 .ObjectText or"").." "..a3 .Name.." "..(kI and kI.Name or"")):lower()
if qq:find("crate",1,true)then cB=a3 break end end end end d.prompt=cB return cB end local function gs()if d.on then return true end
local cC=qp()if not cC then d.summonFails=d.summonFails+1 d.lastFail=r()q("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local kJ=ca(cC)if kJ then cr(kJ,cC)end d.ours=true d_(cC,function()return d.on end)if ae(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=r()q("crate: pressed "..du(cC).." but no window came up")
return false end do local function qr(kK)local bO=kK.Parent while bO and bO:IsA("GuiObject")do local kL,kM=false,false
for uD,cD in ipairs(bO:GetDescendants())do if cD~=kK and cD:IsA("GuiButton")and eb(cD):sub(1,7)=="discard"then kL=true end
if cD:IsA("TextLabel")then local gt=cD.Text:lower()if gt:find("crate",1,true)or gt:find("can contain",1,true)or gt:find("cost",1,true)then kM=true end
end if kL and kM then return bO end end bO=bO.Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local kN=C:FindFirstChildOfClass("PlayerGui")if not kN then return nil end for uE,ef in ipairs(kN:GetDescendants())do
if ef:IsA("GuiButton")and not ef:FindFirstAncestor("SABFarmGui")and eb(ef):sub(1,4)=="open"then local gu=qr(ef)
if gu then d.win=gu return gu end end end end local function qs(qt)for uF,eg in ipairs(qt:GetDescendants())do
if eg:IsA("GuiButton")then local kO,gv=eb(eg),eg.Name:lower()if kO=="x"or kO=="close"or gv=="x"or gv:find("close",1,true)or gv:find("exit",1,true)then return eg end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(qu)task.wait(qu and 4 or 1.2)if d.on or d.waiting then return end
local eh=d.findWin()if not eh or not gj(eh)then return end local kP=qs(eh)if kP and kr(kP,function()return not gj(eh)end)then return end
q("the crate window is still open - tap its X")end end local function ei(ej)if not gs()then return false end local kQ=r()-(d.openedAt or 0)
if kQ<0.6 then ah(0.6-kQ)end local gw=d.title local qv,qw=qe()local kR=ej and qv or qw if not kR then d.lastFail=r()
a.crateFails=a.crateFails+1 q(("crate: no %s button found in %s"):format(ej and"Open"or"Discard",gw))return false
end local qx=M()local qy,uG=kr(kR,function()return(not d.on)or(M()~=nil and M()~=qx)end)if not qy then d.lastFail=r()
a.crateFails=a.crateFails+1 q("crate: could not press "..(ej and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if ej then a.crates=a.crates+1 ae(function()return M()~=nil end,1.5)local kS=M()
q(("OPENED %s -> %s"):format(gw,kS and V(O(kS))or"?"))else q("discarded "..gw.." (nothing ticked in it)")end return true
end d.calls={}function d.saw(qz,...)local qA=select("#",...)d.calls[#d.calls+1]={t=r(),m=qz,n=qA,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(ak,aP)local a4=type(ak)if(a4=="string"or a4=="number")and type(aP.data)=="table"then for kT,gx in pairs(aP.data)do
if gx==ak and type(kT)=="string"and(type(gx)=="string"or type(gx)=="number")then return{__slot="f:"..kT}end end
end if a4=="string"then if aP.crate and ak==aP.crate then return{__slot="crate"}end if aP.title and ak==aP.title then return{__slot="title"}end
if aP.rar and ak==aP.rar then return{__slot="rarity"}end return ak end if a4=="number"or a4=="boolean"or a4=="nil"then return ak end
if a4=="table"then local kU={}for qB,kV in pairs(ak)do if type(kV)=="table"then return nil,"nested table"end local qC,kW=d.slot(kV,aP)
if kW then return nil,kW end kU[qB]=qC end return kU end local qD,qE=pcall(function()return ak:IsA("Instance")end)
if qD and qE then if ak==C then return{__slot="player"}end if a.plot and ak==a.plot then return{__slot="plot"}end
local ek=a.plot and a.plot:FindFirstChild("CrateStand")if ek and ak==ek then return{__slot="stand"}end if ek and ak.Parent==ek then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..a4 ..")"end function d.resolve(el)if type(el)~="table"then return el end
local av=el.__slot if av and av:sub(1,2)=="f:"then return d.data and d.data[av:sub(3)]end if av=="crate"then return d.data and d.data.name end
if av=="title"then return(d.data and d.data.title)or d.title end if av=="rarity"then return d.data and d.data.rarity end
if av=="player"then return C end if av=="plot"then return a.plot end if av=="stand"or av=="model"then local gy=a.plot and a.plot:FindFirstChild("CrateStand")
if av=="stand"or not gy then return gy end for uH,kX in ipairs(gy:GetChildren())do if ko(kX.Name)then return kX end end
return nil end local kY={}for qF,qG in pairs(el)do kY[qF]=d.resolve(qG)end return kY end function d.classify(gz)
if d.directOff then return end local em={}for uI,gA in ipairs(d.calls)do if gA.t<=gz+0.05 and gz-gA.t<=6 then em[#em+1]=gA end
end if#em==0 then return end if not ae(function()return(d.heldAt or 0)>=gz-1 end,2.5)then return end local cE={}
for uJ,cF in ipairs(em)do local kZ={}for k0=1,cF.n do local qH,k1=d.slot(cF.args[k0],cF)if k1 then q("crate call has "..k1 .." - keeping the button method")
return end kZ[k0]=qH end cE[#cE+1]={m=cF.m,n=cF.n,args=kZ}end local gB=d.learned d.learned={seq=cE,mode=gB and gB.mode or nil}
Q.dirty=true if not gB then q(("learned how to open crates directly (%d call%s)"):format(#cE,#cE==1 and""or"s"))end
end function d.replay()local k2=d.learned local k3=au:FindFirstChild("Remotes")local gC=k3 and k3:FindFirstChild("CrateAction")
if not(k2 and gC)then return false end local k4=table.unpack or unpack d.replaying=true for uK,cG in ipairs(k2 .seq)do
local gD={}for k5=1,cG.n do gD[k5]=d.resolve(cG.args[k5])end task.spawn(function()pcall(function()if cG.m=="InvokeServer"then gC:InvokeServer(k4(gD,1,cG.n))
else gC:FireServer(k4(gD,1,cG.n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(qI)return(qI:gsub("[%%|;=,\n]",function(qJ)return("%%%02X"):format(qJ:byte())end))end
function d.enc(bo)local en=type(bo)if en=="string"then return"s"..d.esc(bo)end if en=="number"then return"n"..tostring(bo)end
if en=="boolean"then return bo and"b1"or"b0"end if en=="nil"then return"z"end if bo.__slot then return"k"..bo.__slot end
local gE={}for qK,qL in pairs(bo)do gE[#gE+1]=d.enc(qK).."="..d.enc(qL)end return"t"..table.concat(gE,",")end
function d.dec(k6)local cH,cI=k6:sub(1,1),k6:sub(2)local function qM(qN)return(qN:gsub("%%(%x%x)",function(qO)return string.char(tonumber(qO,16))end))end
if cH=="s"then return qM(cI)end if cH=="n"then return tonumber(cI)end if cH=="b"then return cI=="1"end if cH=="k"then return{__slot=cI}end
if cH=="t"then local k7={}for qP in cI:gmatch("[^,]+")do local k8,qQ=qP:match("^(.-)=(.*)$")if k8 then local k9=d.dec(k8)
if k9~=nil then k7[k9]=d.dec(qQ)end end end return k7 end return nil end function d.goneOrNew(qR)return function()
if not d.waiting then return true end local k_=M()return k_~=nil and k_~=qR end end function d.near()local la=au:FindFirstChild("Remotes")
local lb=la and la:FindFirstChild("CrateAction")local gF=aI()local gG=a.plot and a.plot:FindFirstChild("CrateStand")
local gH=gG and gG:FindFirstChild("Spot")if not(lb and gF and gH)then return false,"no crate stand or remote"end
local gI=gF.HumanoidRootPart local eo=gI.CFrame local lc,gJ=d.title,"no answer"local qS=M()local ld=gG:FindFirstChild("Holder")
local function le()if not ld then return d.waiting or d.on end for uL,qT in ipairs(ld:GetChildren())do if qT:IsA("Model")then return true end end
return false end for qU=1,3 do if not(d.waiting or d.on)or not le()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end if(gI.Position-gH.Position).Magnitude>8 then cr(gH,d.prompt)end ah(0.12+0.15*qU)
local aD={}d.replaying=true task.spawn(function()aD.ok,aD.v=pcall(function()return lb:InvokeServer("open")end)
aD.done=true end)ae(function()return aD.done end,6)d.replaying=false local bp=aD.v if aD.done and aD.ok and type(bp)=="table"and bp.ok then
a.crates,d.fails,d.nearFails=a.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,r()+4 q(("OPENED %s -> %s (no window)"):format(lc,bp.prize and V(O(tostring(bp.prize)))or"?"))
ae(function()local lf=M()return lf~=nil and lf~=qS end,1.5)if(gI.Position-eo.Position).Magnitude>8 then pcall(function()cq(gF,eo.Position,eo.Position+eo.LookVector)end)end
return true,"opened"end gJ=(aD.done and aD.ok and type(bp)=="table")and tostring(bp.reason or"refused, no reason given")
or(aD.done and("error: "..tostring(bp))or"no answer in 6s")ah(0.3)if not le()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 q(("crate: the server would not open %s next to the stand (%s)"):format(lc,gJ))
return false,gJ end function d.smart()local gK=d.title if(d.nearFails or 0)<3 then local qV=d.near()if qV then return true end
if d.nearFails>=3 then q("opening next to the stand failed 3 times - trying the older ways")end end local bq=d.learned
if bq then local gL=M()if d.on then d.replay()if ae(d.goneOrNew(gL),3.5)then a.crates=a.crates+1 q("OPENED "..gK.." (direct)")
return true end else if bq.mode~="window"then d.replay()if ae(d.goneOrNew(gL),3.5)then a.crates,d.fails=a.crates+1,0
if bq.mode~="direct"then bq.mode,Q.dirty="direct",true q("crates now open directly - the window never comes up")
end q("OPENED "..gK.." (direct, no window)")return true end end if gs()then d.replay()if ae(d.goneOrNew(gL),3.5)then
a.crates,d.fails=a.crates+1,0 if bq.mode~="window"then bq.mode,Q.dirty="window",true q("crates need their window up first - it shows briefly")
end q("OPENED "..gK.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,Q.dirty=bq,nil,true
if d.fails>=3 then d.directOff=true q("direct crate opening failed 3 times - using the button for now")else q("the learned crate call did not work - back to pressing Open")
end end return ei(true)end function u.snap()return{rules=C:GetAttribute("AutoRollRules"),stop=C:GetAttribute("AutoRollStop"),
on=C:GetAttribute("AutoRollOn"),main=C:GetAttribute("AutoRoll")}end u.cache={}function u.watchCache()u.cache=u.snap()
for qW,lg in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do L(C:GetAttributeChangedSignal(lg):Connect(function()u.cache[qW]=C:GetAttribute(lg)end))
end end function u.isOn()return C:GetAttribute("AutoRollOn")==true end function u.saw(qX,...)local ep=u.cache
local qY={m=qX,n=select("#",...),args={...},before={rules=ep.rules,stop=ep.stop,on=ep.on,main=ep.main}}task.delay(1.5,function()
if a.alive then pcall(u.learnOne,qY)end end)end function u.learnOne(cJ)local ag,cK=u.snap(),cJ.before local eq=(ag.rules~=cK.rules)or(ag.stop~=cK.stop)
local lh=(ag.on~=cK.on)or(ag.main~=cK.main)if not eq and not lh then return end local li={}for lj=1,cJ.n do local aq=cJ.args[lj]
local br=type(aq)if br=="string"and aq~=""and aq==ag.rules then aq={__slot="rules"}elseif br=="string"and aq~=""and eq and aq==ag.stop and ag.stop~=cK.stop then aq={__slot="stop"}
elseif br=="table"then local lk={}for qZ,bP in pairs(aq)do if type(bP)=="table"or(type(bP)=="userdata")then u.msg="Auto Roll sends something I cannot repeat"return
end lk[qZ]=(type(bP)=="string"and bP~=""and bP==ag.rules)and{__slot="rules"}or bP end aq=lk elseif br~="string"and br~="number"and br~="boolean"and br~="nil"then
if aq==C then aq={__slot="player"}else u.msg="Auto Roll sends something I cannot repeat"return end end li[lj]=aq
end local bQ={m=cJ.m,n=cJ.n,args=li}if eq then local gM=false for q0=1,bQ.n do local cL=bQ.args[q0]if type(cL)=="table"and cL.__slot=="rules"then gM=true end
if type(cL)=="table"and not cL.__slot then for uM,ll in pairs(cL)do if type(ll)=="table"and ll.__slot=="rules"then gM=true end end
end end if gM then u.rec.rules={bQ}else table.insert(u.rec.rules,bQ)if#u.rec.rules>60 then table.remove(u.rec.rules,1)end
end end if lh then if ag.on==true then u.rec.on=bQ else u.rec.off=bQ end e.AutoRoll=(ag.on==true)end if ag.rules and ag.rules~=""then e.ARrules,e.ARstop=ag.rules,ag.stop or""end
Q.dirty=true u.msg=""q(("learned an Auto Roll %s message"):format(eq and"choices"or(ag.on and"on"or"off")))end
function u.resolve(bR)if type(bR)~="table"then return bR end if bR.__slot=="rules"then return e.ARrules~=""and e.ARrules or C:GetAttribute("AutoRollRules")end
if bR.__slot=="stop"then return e.ARstop~=""and e.ARstop or C:GetAttribute("AutoRollStop")end if bR.__slot=="player"then return C end
local lm={}for q1,q2 in pairs(bR)do lm[q1]=u.resolve(q2)end return lm end function u.replay(ln,q3)local lo=table.unpack or unpack
for uN,cM in ipairs(q3)do local gN={}for lp=1,cM.n do gN[lp]=u.resolve(cM.args[lp])end u.replaying=true pcall(function()
if cM.m=="InvokeServer"then task.spawn(function()pcall(function()ln:InvokeServer(lo(gN,1,cM.n))end)end)else ln:FireServer(lo(gN,1,cM.n))end
end)u.replaying=false task.wait(0.25)end end function u.apply(lq,q4)if u.busy or not a.alive then return end u.busy=true
pcall(function()local lr=au:FindFirstChild("Remotes")local gO=lr and lr:FindFirstChild("AutoRollAction")if not gO then u.msg="this game has no AutoRollAction"return end
local a5=e.AutoRoll if a5 and e.ARrules~=""and C:GetAttribute("AutoRollRules")~=e.ARrules then if#u.rec.rules==0 then
u.msg="pick your Auto Roll choices once in the game's menu so I can learn them"q(u.msg)else u.replay(gO,u.rec.rules)
if ae(function()return C:GetAttribute("AutoRollRules")==e.ARrules end,4)then q("Auto Roll choices put back")else
u.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"q(u.msg)end end end if a5==u.isOn()or(not a5 and not q4)then return end
local er=a5 and u.rec.on or u.rec.off if not er then local cN=a5 and u.rec.off or u.rec.on local ls=cN~=nil for q5=1,cN and cN.n or 0 do
if type(cN.args[q5])=="boolean"then ls=false end end if ls then er=cN end end if not er then u.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(a5 and"on"or"off")
q(u.msg)return end u.replay(gO,{er})if ae(function()return u.isOn()==a5 end,4)then u.msg=""q(("Auto Roll switched %s%s"):format(a5 and"ON"or"OFF",lq and(" ("..lq..")")or""))
else u.msg="Auto Roll did not switch - do it once in the game so I can relearn it"q(u.msg)end end)u.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local q6,q7=pcall(function()return C.UserId end)return q6 and q7 or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local q8,gP=pcall(function()return require(au:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if q8 and type(gP)=="table"and type(gP.Pets)=="table"then j.I=gP end return j.I end function j.order()if j.list then return j.list end
local a6=j.info()if not a6 then return{}end local bs={}if type(a6 .Order)=="table"and#a6 .Order>0 then for uO,lt in ipairs(a6 .Order)do if a6 .Pets[lt]then bs[#bs+1]=lt end end
else for q9 in pairs(a6 .Pets)do bs[#bs+1]=q9 end table.sort(bs,function(q_,ra)return(a6 .Pets[q_].price or 0)<(a6 .Pets[ra].price or 0)end)
end j.list=bs return bs end function j.nice(lu,gQ)local lv=j.info()local lw=lv and lv.Pets[lu]return((gQ and gQ~="")and(gQ.." ")or"")..(lw and lw.displayName or tostring(lu))
end function j.data()local lx=C:GetAttribute("PetsData")if type(lx)~="string"then return nil end local rb,ly=pcall(function()return j.HS:JSONDecode(lx)end)
return(rb and type(ly)=="table")and ly or nil end function j.pen()return au:FindFirstChild("PetMeadowSpawns")end
function j.srv()return aB:GetServerTimeNow()end function j.money()local gR=C:FindFirstChild("MoneyValue")if gR and type(gR.Value)=="number"then return gR.Value end
return aH()or 0 end function j.wishes()local lz=j.pen()local lA=lz and lz:GetAttribute("Wishes")local gS,lB={},j.srv()
if type(lA)~="string"then return gS end local rc,lC=pcall(function()return j.HS:JSONDecode(lA)end)if rc and type(lC)=="table"then
for rd,gT in pairs(lC)do if type(gT)=="number"and gT>lB then gS[rd]=gT-lB end end end return gS end function j.call(...)
local lD=au:FindFirstChild("Remotes")local lE=lD and lD:FindFirstChild("PetRequest")if not lE then return nil end
local lF=table.pack(...)local bt={}task.spawn(function()bt.ok,bt.v=pcall(function()return lE:InvokeServer(table.unpack(lF,1,lF.n))end)
bt.done=true end)local re=r()while not bt.done and r()-re<6 do task.wait(0.05)end if bt.done and bt.ok then return bt.v end
return nil end function j.want(rf)return e.Pets[rf]end function j.buyTick()if not e.PetBuy then j.buyMsg="auto adopt is off"return end
local gU,lG,gV=j.info(),j.pen(),j.data()if not(gU and lG and gV)then j.buyMsg="pet data not loaded yet"return end
j.tryAt=j.tryAt or{}local cO,gW=#(gV.pets or{}),tonumber(gV.maxOwned)or 60 local rg,lH,cP=j.srv(),{},nil for uP,aw in ipairs(lG:GetChildren())do
lH[aw.Name]=true local cQ,lI=aw:GetAttribute("Pet"),aw:GetAttribute("Variant")or""local gX=cQ and j.want(cQ)if gX and gX.b and gU.Pets[cQ]and(not gX.g or lI=="Big")and not aw:GetAttribute("A_"..j.uid)
and(tonumber(aw:GetAttribute("ExpiresAt"))or 0)>rg+1 and r()>=(j.tryAt[aw.Name]or 0)then local cR,lJ=j.nice(cQ,lI),gU.Pets[cQ].price or 0
if cO>=gW then cP=("%s is in the pen, but you have %d/%d pets"):format(cR,cO,gW)j.tryAt[aw.Name]=r()+15 elseif j.money()<lJ then
cP=("%s is in the pen - need $%s"):format(cR,ao(lJ))j.tryAt[aw.Name]=r()+5 else j.tryAt[aw.Name]=r()+8 local bS=j.call("adopt",aw.Name)
if type(bS)=="table"and bS.ok then cO=cO+1 j.buys=(j.buys or 0)+1 q("ADOPTED "..cR)cP="adopted "..cR else local lK=type(bS)=="table"and tostring(bS.reason or"no reason given")or"no answer"
q(("adopt %s failed: %s"):format(cR,lK))cP="adopt failed: "..lK if type(bS)=="table"and bS.bagFull then j.tryAt[aw.Name]=r()+60 end
end end end end for lL in pairs(j.tryAt)do if not lH[lL]then j.tryAt[lL]=nil end end j.buyMsg=cP or("watching the pen (%d/%d pets)"):format(cO,gW)
end function j.wishTick()if not e.PetWish then j.wishMsg="auto wish is off"return end local es=j.info()if not(es and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local et,gY,a7=j.wishes(),0,nil local rh=(type(es.Wish)=="table"and es.Wish.cashShare)or 2
for uQ,al in ipairs(j.order())do local lM=j.want(al)if lM and lM.w then gY=gY+1 if not et[al]and r()>=(j.wishTry[al]or 0)then
local gZ=tonumber(C:GetAttribute("PetWishCredits"))or 0 local g0=math.floor((es.Pets[al].price or 0)*rh)if gZ<=0 and j.money()<g0 then
j.wishTry[al]=r()+10 a7=("need $%s to wish for %s"):format(ao(g0),j.nice(al))j.wishWhy[al]=a7 else j.wishTry[al]=r()+3
local ri=gZ>0 and"wishCredit"or"wish"local eu=j.call(ri,al)if type(eu)=="table"and eu.ok then j.wishN,j.wishWhy[al]=j.wishN+1,nil
q(("WISHED for %s (%s)"):format(j.nice(al),gZ>0 and"free wish"or("$"..ao(g0))))else local g1=type(eu)=="table"and tostring(eu.reason or"no reason given")or"no answer"
if g1:lower():find("already",1,true)then j.wishTry[al]=r()+2 else q(("wish %s failed: %s"):format(j.nice(al),g1))a7="wish failed: "..g1 end
end end end end end if not a7 then for uR,ev in ipairs(j.order())do local lN=j.want(ev)if lN and lN.w and not et[ev]and j.wishWhy[ev]then a7=j.wishWhy[ev]break end
end end if not a7 then local ew={}for uS,ex in ipairs(j.order())do local lO=j.want(ex)if lO and lO.w and et[ex]then ew[#ew+1]=("%s %dm"):format(j.nice(ex),math.ceil(et[ex]/60))end
end a7=gY==0 and"no pet has WISH ticked"or("running: "..(#ew>0 and table.concat(ew,", ")or"none yet"))end j.wishMsg=a7
end o.switches,o.glazed,o.finished=0,0,0 function o.teams()local g2=j.data()return(g2 and g2 .teams)or{},g2 end
function o.current(bT)bT=bT or j.data()if not bT then return""end local lP={}for uT,rj in ipairs(bT.equipped or{})do lP[tostring(rj)]=true end
for uU,lQ in ipairs(bT.teams or{})do local lR=lQ.pets or{}local g3=#lR==#(bT.equipped or{})if g3 then for uV,rk in ipairs(lR)do if not lP[tostring(rk)]then g3=false break end end end
if g3 then return lQ.name end end return""end function o.equip(g4)local rl,rm=o.teams()local g5 for rn,ro in ipairs(rl)do if ro.name==g4 then g5=rn break end end
if not g5 then o.msg="no saved team called "..tostring(g4)return false end if o.current(rm)==g4 then return true end
for uW=1,4 do local lS=j.call("teamEquip",g5)if type(lS)=="table"and lS.ok then o.switches=o.switches+1 return true
end task.wait(0.4)end return false end function o.waxes()local cS={}local lT=a.plot and a.plot:FindFirstChild("WaxStations")
if not lT then return cS end for uX,bu in ipairs(lT:GetChildren())do local lU=tonumber(bu:GetAttribute("PourEnd"))
local lV=bu:GetAttribute("PourOwner")if bu:GetAttribute("HasSquishy")and lU and(lV==nil or lV==j.uid)then local lW,lX=bu:FindFirstChild("SquishyPlaceHolder"),"?"
if lW then for uY,lY in ipairs(lW:GetChildren())do if lY:IsA("Model")then lX=lY.Name break end end end local rp=tostring(bu:GetAttribute("Helpers")or"")
local g6=0 for uZ in rp:gmatch("%d+")do g6=g6+1 end cS[#cS+1]={st=bu,ends=lU,id=bu:GetAttribute("PourId"),name=lX,helps=g6}
end end table.sort(cS,function(rq,rr)return rq.ends<rr.ends end)return cS end function o.glazeCount()local lZ=au:FindFirstChild("Remotes")
local l0=lZ and lZ:FindFirstChild("EditStack")if not l0 then return nil end local rs,cT=pcall(function()return l0:InvokeServer("State",nil)end)
if not(rs and type(cT)=="table"and type(cT.state)=="table")then return nil end local g7,g8=0,{}for u0,ey in ipairs(cT.state.entries or{})do
if ey.glaze and ey.glaze~=""then g7=g7+1 g8[ey.glaze]=(g8[ey.glaze]or 0)+1 end end return g7,g8,#(cT.state.entries or{}),cT.state.capacity
end function o.finishedOne(ez,l1)o.finished=o.finished+1 task.wait(2)local g9,rt,l2,ru=o.glazeCount()if g9 and l1 and g9>l1 then
o.glazed=o.glazed+1 local g_={}for rv,rw in pairs(rt)do g_[#g_+1]=rv.." "..rw end q(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(V(O(ez.name)),ez.st.Name,g9,table.concat(g_,", ")))
else q(("wax done on station %s: %s, no glaze%s"):format(ez.st.Name,V(O(ez.name)),l2 and(" (stack "..l2 .."/"..tostring(ru)..")")or""))
end end function o.tick()o.list=o.waxes()if not e.Teams then o.want,o.msg="","auto teams is off"return end local ha=j.srv()
local a8=o.glazeFor if a8 then local eA=a8 .st local rx=eA.Parent and eA:GetAttribute("HasSquishy")and eA:GetAttribute("PourId")==a8 .id
if not rx or ha>a8 .ends+40 then o.glazeFor,o.afterUntil=nil,r()+1.5 local ry=a8 .before task.spawn(function()pcall(o.finishedOne,a8,ry)end)
else a8 .ends=tonumber(eA:GetAttribute("PourEnd"))or a8 .ends end end if e.TeamGlaze~=""and not o.glazeFor then
for u1,hb in ipairs(o.list)do if hb.ends-ha<=e.GlazeLead then o.glazeFor=hb task.spawn(function()hb.before=o.glazeCount()end)
break end end end local ar,eB="",""if e.TeamGlaze~=""and(o.glazeFor or r()<(o.afterUntil or 0))then ar,eB=e.TeamGlaze,o.glazeFor and(" - station "..o.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(o.placing or o.aboutToPlace())then ar,eB=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and o.allBusy()then
ar,eB=e.TeamFull," - every station is busy"else ar=e.TeamNormal end o.want=ar local cU=o.current()o.cur=cU if ar~=""and cU~=ar and r()>=(o.nextTry or 0)then
o.nextTry=r()+1.1 if o.equip(ar)then q("team: "..ar..eB)else o.nextTry=r()+3 end end local hc=o.list[1]o.msg=("on: %s%s | next wax done %s"):format(cU~=""and cU or"(not a saved team)",(ar~=""and ar~=cU)and(" -> "..ar)or"",
hc and("in "..o.clock(hc.ends-ha).." (st "..hc.st.Name..")")or"- none running")end function o.clock(a9)a9=math.max(0,math.floor(a9))
if a9>=3600 then return("%d:%02d:%02d"):format(math.floor(a9/3600),math.floor((a9%3600)/60),a9%60)end return("%d:%02d"):format(math.floor(a9/60),a9%60)
end function o.allBusy()local rz,rA=dw()return rA>0 and rz==0 end function o.aboutToPlace()if not a.running then return false end
local l3=M()if not(l3 and aG(l3))then return false end local rB=dw()return rB>0 end function o.expectSocialWax(rC)
local rD,l4=o.teams()local hd=j.info()local he=0 if not(hd and l4)then return 0 end for u2,l5 in ipairs(rD)do
if l5 .name==rC then for u3,rE in ipairs(l5 .pets or{})do for u4,cV in ipairs(l4 .pets or{})do local eC=hd.Pets[cV.name]
if tostring(cV.id)==tostring(rE)and eC and eC.boost and eC.boost.kind=="socialWax"then local rF,rG=pcall(function()return hd.boostValue(cV.name,(cV.variant~=""and cV.variant)or nil)end)
he=math.max(he,(rF and tonumber(rG))or eC.boost.value or 0)end end end end end return he end function o.glazeSoon()
return e.Teams and e.TeamGlaze~=""and(o.glazeFor~=nil or r()<(o.afterUntil or 0))end l.bb,l.fx,l.post,l.hud={},{},{},{}
l.mem,l.memPeak,l.fps=0,0,0 function l.isFx(bv)return bv:IsA("ParticleEmitter")or bv:IsA("Trail")or bv:IsA("Beam")or bv:IsA("Fire")or bv:IsA("Smoke")
or bv:IsA("Sparkles")or bv:IsA("Light")end function l.muteOne(ax)if not e.Lite or not ax.Parent then return end
if ax:IsA("BillboardGui")then if l.bb[ax]==nil and ax.Enabled then l.bb[ax]=true ax.Enabled=false end elseif l.isFx(ax)then
if l.fx[ax]==nil and ax.Enabled then l.fx[ax]=true ax.Enabled=false end end end function l.lite(l6)e.Lite=l6 if l6 then
task.spawn(function()for rH,rI in ipairs(aB:GetDescendants())do if not e.Lite then return end pcall(l.muteOne,rI)
if rH%600==0 then task.wait()end end end)if not l.addConn then l.queue={}l.addConn=L(aB.DescendantAdded:Connect(function(hf)
if e.Lite and(hf:IsA("BillboardGui")or l.isFx(hf))then l.queue[#l.queue+1]=hf end end))end local hg=game:GetService("Lighting")
for u5,cW in ipairs(hg:GetChildren())do if cW:IsA("PostEffect")and cW.Enabled and l.post[cW]==nil then l.post[cW]=true cW.Enabled=false end
end pcall(function()l.oldShadows=l.oldShadows==nil and hg.GlobalShadows or l.oldShadows hg.GlobalShadows=false end)
pcall(function()l.oldDeco=l.oldDeco==nil and aB.Terrain.Decoration or l.oldDeco aB.Terrain.Decoration=false end)
else for l7 in pairs(l.bb)do pcall(function()if l7 .Parent then l7 .Enabled=true end end)end for l8 in pairs(l.fx)do pcall(function()if l8 .Parent then l8 .Enabled=true end end)end
for l9 in pairs(l.post)do pcall(function()if l9 .Parent then l9 .Enabled=true end end)end l.bb,l.fx,l.post,l.queue={},{},{},{}
local rJ=game:GetService("Lighting")if l.oldShadows~=nil then pcall(function()rJ.GlobalShadows=l.oldShadows end)l.oldShadows=nil end
if l.oldDeco~=nil then pcall(function()aB.Terrain.Decoration=l.oldDeco end)l.oldDeco=nil end end end l.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function l.hideHud(l_)e.HideHud=l_ local hh=C:FindFirstChildOfClass("PlayerGui")if not hh then return end if l_ then
for u6,cX in ipairs(hh:GetChildren())do if cX:IsA("ScreenGui")and not l.MINE[cX.Name]and cX.Enabled then l.hud[cX]=true cX.Enabled=false end
end if not l.hudConn then l.hudConn=L(hh.ChildAdded:Connect(function(cY)if e.HideHud and cY:IsA("ScreenGui")and not l.MINE[cY.Name]then
task.defer(function()if e.HideHud and cY.Enabled then l.hud[cY]=true cY.Enabled=false end end)end end))end else
for ma in pairs(l.hud)do pcall(function()if ma.Parent then ma.Enabled=true end end)end l.hud={}end end l.CAPS={0,30,15,10}
function l.cap(hi)e.FpsCap=hi local mb=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not mb then return false end return pcall(mb,hi==0 and 60 or hi)end function l.render(mc)e.NoRender=mc pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not mc)end)
end function l.restoreAll()pcall(l.lite,false)pcall(l.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(l.cap,0)end end function l.rejoinSame(md)if a.rejoining then return end q("REJOIN this server ("..md..")")
pcall(dz)if a.autoload then pcall(dY,a.autoload)end f2()local rK=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,C)
end)task.delay(25,function()if a.alive then cn(md..", same server failed")end end)return rK end function l.tick()
local hj=l.queue if e.Lite and hj and#hj>0 then l.queue={}for rL,rM in ipairs(hj)do pcall(l.muteOne,rM)if rL%300==0 then task.wait()end end
end local rN,cZ=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if rN and type(cZ)=="number"then
l.mem=cZ l.memPeak=math.max(l.memPeak,cZ)if(e.MemLimit or 0)>0 and cZ>e.MemLimit then l.over=(l.over or 0)+1 if l.over>=30 and not a.busy then
l.over=-600 l.rejoinSame(("memory %d MB > %d MB"):format(cZ,e.MemLimit))end elseif(l.over or 0)>0 then l.over=0
end end if r()-(l.noteAt or 0)>1800 then l.noteAt=r()q(("health: %d fps, %d MB (peak %d)"):format(math.floor(l.fps+0.5),l.mem,l.memPeak))
end end a.sellWords={"sell","trash","discard","dispose","bin"}local function hk(eD)if type(eD)~="string"then return false end
eD=eD:lower()for u7,rO in ipairs(a.sellWords)do if eD:find(rO,1,true)then return true end end return false end
local function rP()local me=au:FindFirstChild("Remotes")local hl=me and me:FindFirstChild("SellSquishy")if not(hl and hl:IsA("RemoteEvent"))then return false end
if not pcall(function()hl:FireServer()end)then return false end return ae(function()return M()==nil end,1.5)end
local function rQ()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end if r()-a.sellSearchAt<20 then return nil end
a.sellSearchAt=r()local mf=aI()local mg=mf and mf.HumanoidRootPart.Position local c0,mh for u8,bU in ipairs((a.plot or aB):GetDescendants())do
if bU:IsA("ProximityPrompt")and(hk(bU.ActionText)or hk(bU.ObjectText)or hk(bU.Name))then local mi=iN(bU)local hm=(mi and mg)and(mi-mg).Magnitude or 1e9
if hm<=400 and(not c0 or hm<mh)then c0,mh=bU,hm end end end a.sellSpot=c0 a.noSellSpot=(c0==nil)return c0 end
local function mj()local hn=M()if not hn then a.holding=false return false end if aG(hn)then return false end
local ho=V(O(hn))if rP()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=r()+2.5,0
q("SOLD "..ho)return true end local bV=rQ()if bV then local mk=ca(bV)if mk then cr(mk,bV)local ml=M()if ml and not aG(ml)then
local rR,rS=d_(bV,function()return M()==nil end,function()return bV.Enabled end)if rR then a.sold,a.holding,a.sellFails=a.sold+1,false,0
q(("SOLD %s at %s via %s"):format(ho,du(bV),rS))return true end end end end a.sellFails=a.sellFails+1 q("could not sell "..ho.." ("..a.sellFails..")")
return false end local rT={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function rU(bW)local eE=du(bW):lower()for u9,rV in ipairs(rT)do if eE:find(rV,1,true)then return 0 end end
local aE,W=bW.Name:lower(),0 local function ay(rW,rX)return rW:find(rX,1,true)~=nil end if ay(aE,"collect")then W=W+60 end
if ay(aE,"cash")or ay(aE,"money")then W=W+45 end if ay(aE,"income")or ay(aE,"claim")then W=W+35 end if ay(aE,"coin")or ay(aE,"earn")or ay(aE,"green")then W=W+20 end
if aE=="pad"or aE=="touch"then W=W+25 end if W==0 and(ay(eE,"collect")or ay(eE,"cash")or ay(eE,"money"))then W=25 end
if W==0 then return 0 end local c1=bW.Color if c1 .G>0.5 and c1 .G>c1 .R*1.4 and c1 .G>c1 .B*1.4 then W=W+15 end
if math.min(bW.Size.X,bW.Size.Y,bW.Size.Z)<2 then W=W+5 end return W end local function rY()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or r()-a.padSearchAt<20 then return nil end a.padSearchAt=r()local eF,c2,hp={},nil,29 for u_,eG in ipairs(a.plot:GetDescendants())do
if eG:IsA("BasePart")then local eH=rU(eG)if eH>0 then eF[#eF+1]={s=eH,p=eG}if eH>hp then c2,hp=eG,eH end end end
end table.sort(eF,function(rZ,r0)return rZ.s>r0 .s end)a.padCands,a.padPart=eF,c2 if c2 then q("collect pad: "..du(c2).." (score "..hp..")")end
return c2 end local hq="SAB_pad_v1.txt"local function r1(r2)if type(writefile)=="function"then pcall(writefile,hq,table.concat({r2:GetComponents()},","))end
end local function r3()if type(isfile)~="function"or type(readfile)~="function"then return nil end local r4,mm=pcall(function()if isfile(hq)then return readfile(hq)end end)
if not r4 or type(mm)~="string"then return nil end local eI={}for r5 in mm:gmatch("[^,]+")do eI[#eI+1]=tonumber(r5)end
if#eI==12 then return CFrame.new(unpack(eI))end end local function r6(hr,eJ,r7)local r8=ga(hr)local hs=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local az=(hs and hs:IsA("BasePart"))and(hs.Position-eJ)or Vector3 .new(1,0,0)az=Vector3 .new(az.X,0,az.Z)if az.Magnitude<0.05 then az=Vector3 .new(1,0,0)end
az=az.Unit for r9=0,7 do local eK=r9*math.pi/4 local r_=Vector3 .new(az.X*math.cos(eK)-az.Z*math.sin(eK),0,az.X*math.sin(eK)+az.Z*math.cos(eK))
local eL=eJ+r_*(r7+5)local ht=j4(eL.X,eJ.Y,eL.Z)if ht and math.abs(ht.Y-eJ.Y)<8 then cq(hr,Vector3 .new(eL.X,ht.Y+r8,eL.Z))
if gb(hr,0.7)then return true end end end return false end local function sa()a.lastCollect=r()local c3=aI()if not c3 then return end
local mn,sb=c3 .HumanoidRootPart,ga(c3)local c4,mo,c5,hu=nil,4,nil,"?"local hv=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if a.manualPad and hv and hv:IsA("BasePart")then c4,hu=(hv.CFrame*a.manualPad).Position,"manual pad"else local aQ=rY()
if aQ then c4=Vector3 .new(aQ.Position.X,aQ.Position.Y+aQ.Size.Y/2+sb,aQ.Position.Z)mo,c5,hu=math.max(aQ.Size.X,aQ.Size.Z)/2,aQ,aQ.Name
end end if not c4 then q("COLLECT: pad not found - stand on it and tap SET PAD")return end local hw=aH()cq(c3,c4)
if c5 and type(firetouchinterest)=="function"then pcall(firetouchinterest,mn,c5,0)end ah(e.PadDwell)if c5 and type(firetouchinterest)=="function"then pcall(firetouchinterest,mn,c5,1)end
ah(0.5)a.collected=a.collected+1 local hx=aH()q(("COLLECTED (%s) %s"):format(hu,(hw and hx and hx>hw)and("+$"..ao(hx-hw))or"no cash change seen"))
r6(c3,c4,mo)end local c6 local function mp()if a.capHit then if e.AutoStart and r()-(a.capAt or 0)>300 then a.capHit,a.placeFails=false,0
q("trying again after being stopped for 5 minutes")c6(true,true)else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end
if not aI()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aW(),nil,nil
if not a.plot then return nil,"own plot not found yet","wait"end end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local hy,mq=dw()local eM=M()if eM then local bX=V(O(eM))if not aG(eM)then local hz=(F.gift and O(F.gift)==O(eM)and r()-F.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bX,hz),"bad"end if a.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bX,hz),"bad"end return"sell",("selling %s (%s)"):format(bX,hz),"warn"
end if hy<1 then return nil,("holding %s - 0 free stations"):format(bX),"wait"end if o.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(bX),"wait"end
return"place",("waxing %s (%d free)"):format(bX,hy),"ok"end a.holding=false if e.Crates and not d.waiting and r()-(d.scanAt or 0)>1 and r()>(d.quietUntil or 0)then
d.scanAt=r()local hA=a.plot:FindFirstChild("CrateStand")if hA then for va,c7 in ipairs(hA:GetDescendants())do
if c7:IsA("ProximityPrompt")and c7 .Enabled and gq(c7)then local aR=c7 .ObjectText if aR==""then aR=bF(hA,"TitleLabel")or""end
if aR~=""and A.wanted(aR)then local sc=ds(aR):gsub("crate$","")local mr for ms in pairs(K.members)do if ds(ms)==sc then mr=ms end end
d.waiting,d.at,d.title,d.prompt=true,r(),aR,c7 d.data={name=(aR:gsub("%s","")),rarity=mr,title=aR}q(aR.." found waiting on your stand")
end break end end end end local mt=A.wanted(d.data and d.data.name)or A.wanted(d.title)if e.Crates and(d.on or d.waiting)and mt then
local aS=d.title if r()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aS),"bad"
end if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=r()+120,0 q("could not press the "..aS.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aS),"bad"end if r()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aS),"bad"
end if d.byYou and r()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aS,math.ceil(60-(r()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aS),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(aS),"bad"end if r()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aS),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aS,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not mt then local mu=d.title..tostring(d.rolledAt)if d.told~=mu then d.told=mu q(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and r()-d.rolledAt<6 and A.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if hy<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(mq,mq),"wait"
end local hB=i0()if not hB then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c8=co()
if c8 and ko(c8 .name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(c8 .name),"idle"end
if r()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c8 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(c8 .name),"ok"
end local a_=f9()if a_.state~="match"then a.matchSince=nil if a_.state=="skip"and not hB.Enabled then return nil,a_.text.." (sold out)","idle"end
return nil,a_.text,a_.level end if not hB.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local c9=r()if c9<a.noCashUntil then local mv,sd=jW()if mv then return nil,("cash short: have $%s, price ~$%s"):format(ao(mv),ao(sd)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ao(aH()),math.ceil(a.noCashUntil-c9)),"bad"end if c9-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
a.matchSince=a.matchSince or c9 local mw=c9-a.matchSince if mw<e.Confirm then return nil,("confirming %s (%.2fs)"):format(a_.shown,mw),"ok"end
return"buy",("buying %s via %s"):format(a_.shown,a_.src),"ok"end local function as(se,sf,...)if a.busy then return end
a.busy,a.busyText=true,se local sh,mx=pcall(sf,...)a.busy,a.busyText=false,""if not sh and mx~=fh then q("ERR "..tostring(mx))end
end local function si()local bw,sj,sk=mp()a.reason,a.level=sj,sk if bw=="place"then as("waxing...",o.place)elseif bw=="crate"then as("opening crate...",ei,true)
elseif bw=="cratesmart"then as("opening crate...",d.smart)elseif bw=="cratewin"then as("opening the crate window...",gs)
elseif bw=="nocrate"then as("discarding crate...",ei,false)elseif bw=="sell"then as("selling...",mj)elseif bw=="buy"then as("buying...",ke,false)
elseif e.Collect and not a.matchSince and r()-a.lastCollect>=e.Every then as("collecting money...",sa)end end
function c6(eN,sl)if eN==a.running then return end a.running=eN if not sl then e.AutoStart=eN end if eN then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=r()a.plot=aW()or a.plot
q("START")else a.reason="stopped"q("STOP")end end do local ba=dT(T.auto)if type(ba)=="string"then ba=ba:gsub("%s+$","")
if ba~=""then a.autoload=ba local sm=jK(ba)q(sm and("loaded config "..ba)or("config "..ba.." could not be loaded"))
end end end local f={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local sn={ok=f.good,wait=f.warn,warn=f.warn,bad=f.bad,idle=f.dim}local my={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function D(so,sp,sq)local sr,hC=pcall(Instance.new,so)
if not sr then a.uiErrs=a.uiErrs+1 return nil end for ss,su in pairs(sp)do if not pcall(function()hC[ss]=su end)then a.uiErrs=a.uiErrs+1 end
end hC.Parent=sq return hC end local function ab(sv,sw)D("UICorner",{CornerRadius=UDim.new(0,sw or 6)},sv)end
local c={}local hD=C:FindFirstChildOfClass("PlayerGui")or C:WaitForChild("PlayerGui")local mz=hD:FindFirstChild("SABFarmGui")
if mz then mz:Destroy()end local hE=D("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},hD)
local aa={w=320,h=330,head=30,strip=38,tabs=26}c.root=D("Frame",{Name="Root",Size=UDim2 .new(0,aa.w,0,aa.h),Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),
BackgroundColor3=f.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},hE)ab(c.root,10)D("UIStroke",{Color=f.line,Thickness=1},c.root)
local aT=UDim2 .new(1,0,1,0)local function y(mA,mB)return UDim2 .new(mA,0,0,0),UDim2 .new(mB,(mA+mB>0.99)and 0 or-4,1,0)end
local function x(sx,sy,sz,sA,sB,sC)local mC=D("TextButton",{Text=sy,Position=sB,Size=sC,BackgroundColor3=sz,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=sA,TextColor3=f.text,AutoButtonColor=true},sx)ab(mC,6)return mC end local function eO(sD,sE,sF,sG,sH)
local hF=D("TextBox",{Text=sE,PlaceholderText=sF,Position=sG,Size=sH,BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=f.text,PlaceholderColor3=f.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},sD)ab(hF,6)D("UIPadding",{PaddingLeft=UDim.new(0,8)},hF)
return hF end local eP=aB.CurrentCamera local function sI()local sJ,eQ=pcall(function()return eP and eP.ViewportSize end)
if sJ and eQ and eQ.X>50 and eQ.Y>50 then return eQ end end local function bc(c_)local hG=sI()if not(hG and c_ and c_.Parent)then return end
local sK=pcall(function()local eR,mD=c_.AbsolutePosition,c_.AbsoluteSize local hH=70 local mE=math.clamp(eR.X,hH-mD.X,hG.X-hH)
local mF=math.clamp(eR.Y,0,hG.Y-math.min(mD.Y,hH))if math.abs(mE-eR.X)>0.5 or math.abs(mF-eR.Y)>0.5 then c_.Position=UDim2 .new(0,math.floor(mE),0,math.floor(mF))
end end)return sK end local function eS(sL)local sM,hI=pcall(function()return sL.AbsolutePosition end)if sM and hI then return{math.floor(hI.X),math.floor(hI.Y)}end
end local bY={}a.dragMoved={}local function mG(da,mH,hJ)L(da.InputBegan:Connect(function(bZ)if bZ.UserInputType~=Enum.UserInputType.MouseButton1 and bZ.UserInputType~=Enum.UserInputType.Touch then return end
local hK={start=bZ.Position,from=mH.Position,moved=0,target=mH,input=bZ,onDrop=hJ}bY[da],a.dragMoved[da]=hK,0
local hL hL=bZ.Changed:Connect(function()if bZ.UserInputState==Enum.UserInputState.End and bY[da]==hK then bY[da]=nil
if hL then hL:Disconnect()end if hJ then hJ(hK.moved)end end end)end))end L(iz.InputChanged:Connect(function(eT)
if eT.UserInputType~=Enum.UserInputType.MouseMovement and eT.UserInputType~=Enum.UserInputType.Touch then return end
for sN,aF in pairs(bY)do local hM=aF.target if hM and hM.Parent then local mI,mJ=eT.Position.X-aF.start.X,eT.Position.Y-aF.start.Y
aF.moved=math.max(aF.moved,math.abs(mI)+math.abs(mJ))a.dragMoved[sN]=aF.moved hM.Position=UDim2 .new(aF.from.X.Scale,aF.from.X.Offset+mI,aF.from.Y.Scale,aF.from.Y.Offset+mJ)
end end end))L(iz.InputEnded:Connect(function(eU)if eU.UserInputType~=Enum.UserInputType.MouseButton1 and eU.UserInputType~=Enum.UserInputType.Touch then return end
for sO,eV in pairs(bY)do if eV.input==eU or eU.UserInputType==Enum.UserInputType.MouseButton1 then bY[sO]=nil
if eV.onDrop then eV.onDrop(eV.moved)end end end end))local function E(sP,sQ,sR,sS,sT,sU,sV)return D("TextLabel",{Text=sQ,Position=sU or UDim2 .new(0,0,0,0),Size=sV or aT,BackgroundTransparency=1,
Font=sT and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=sR,TextColor3=sS,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},sP)
end c.title=D("Frame",{Size=UDim2 .new(1,0,0,aa.head),BackgroundColor3=f.panel,BorderSizePixel=0,Active=true},c.root)
c.dot=D("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=f.dim,BorderSizePixel=0},c.title)
ab(c.dot,5)E(c.title,"SAB  BUTTER FARM  "..bA,12,f.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))c.minB=x(c.title,"-",f.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
c.xB=x(c.title,"X",f.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))c.strip=D("Frame",{Position=UDim2 .new(0,0,0,aa.head),Size=UDim2 .new(1,0,0,aa.strip),BackgroundColor3=f.bg,BorderSizePixel=0},c.root)
c.bar=D("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=f.warn,BorderSizePixel=0},c.strip)
ab(c.bar,2)c.reason=E(c.strip,"starting",12,f.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))c.tabs=D("Frame",{Position=UDim2 .new(0,0,0,aa.head+aa.strip),Size=UDim2 .new(1,0,0,aa.tabs),BackgroundTransparency=1},c.root)
c.tabFarm=x(c.tabs,"FARM",f.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))c.tabBut=x(c.tabs,"BUTTERS",f.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabCrt=x(c.tabs,"CRATES",f.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabPet=x(c.tabs,"PETS",f.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabTeam=x(c.tabs,"TEAMS",f.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabSet=x(c.tabs,"SETUP",f.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function b0()local hN=D("ScrollingFrame",{Position=UDim2 .new(0,0,0,aa.head+aa.strip+aa.tabs),Size=UDim2 .new(1,0,1,-(aa.head+aa.strip+aa.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=f.line,CanvasSize=UDim2 .new(0,0,0,100)},c.root)
D("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},hN)D("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},hN)
return hN end c.farm,c.but,c.set,c.crt=b0(),b0(),b0(),b0()c.pet,c.team=b0(),b0()c.but.Visible,c.set.Visible,c.crt.Visible,c.pet.Visible,c.team.Visible=false,false,false,false,false
local eW,db,z=0,12,nil local function am(mK,sW)eW,db=eW+1,db+mK+6 return D("Frame",{Size=UDim2 .new(1,0,0,mK),BackgroundTransparency=1,LayoutOrder=eW},sW or c.farm)
end local function dc(sX)E(am(14),sX,10,f.dim,true)end z=am(34)c.startB=x(z,"START",f.good,14,y(0,0.68))c.killB=x(z,"KILL",f.bad,14,y(0.68,0.32))
local sY=am(42)local function dd(mL,sZ,hO)local hP=D("Frame",{Position=UDim2 .new((mL-1)/hO,0,0,0),Size=UDim2 .new(1/hO,mL<hO and-4 or 0,1,0),
BackgroundColor3=f.panel,BorderSizePixel=0},sY)ab(hP,6)local mM=E(hP,"0",15,f.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local s0=E(hP,sZ,9,f.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))mM.TextXAlignment,s0 .TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return mM end c.sBought,c.sPlaced,c.sSold,c.sColl,c.sFree=dd(1,"BOUGHT",5),dd(2,"WAXED",5),dd(3,"SOLD",5),dd(4,"MONEY",5),dd(5,"FREE",5)
c.info=E(am(40),"",10,f.dim,false)c.tgt=E(am(26),"",10,f.good,false)dc("MONEY COLLECT")z=am(28)c.secB=eO(z,tostring(e.Every),"60",y(0,0.2))
E(z,"sec",11,f.dim,false,y(0.21,0.09))c.secSet=x(z,"SET",f.accent,12,y(0.3,0.2))c.colT=x(z,"COLLECT: ON",f.accent,11,y(0.5,0.5))
z=am(26)c.padB=x(z,"SET PAD (stand on it)",f.panel2,10,y(0,0.55))c.padL=E(z,"",10,f.dim,false,y(0.56,0.44))dc("BUTTERS YOU DID NOT TICK, AND CRATES")
z=am(28)c.sellT=x(z,"SELL THEM: ON",f.accent,11,y(0,0.55))c.sellB=x(z,"SELL NOW",f.warn,11,y(0.55,0.45))z=am(28)
c.crateT=x(z,"OPEN CRATES: ON",f.accent,11,y(0,0.55))c.crateB=x(z,"OPEN NOW",f.warn,11,y(0.55,0.45))dc("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
z=am(28)c.arT=x(z,"AUTO ROLL: OFF",f.panel2,11,y(0,0.5))c.arL=E(z,"",9,f.dim,false,y(0.52,0.48))dc("TOOLS")z=am(30)
c.buyB=x(z,"BUY",f.warn,10,y(0,0.5))c.plB=x(z,"WAX",f.good,10,y(0.5,0.5))dc("LOG")c.log=D("TextLabel",{Size=aT,BackgroundColor3=f.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=f.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},am(84))ab(c.log,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},c.log)
c.farm.CanvasSize=UDim2 .new(0,0,0,db)eW,db=0,12 local function ac(s1)return am(s1,c.set)end local function de(s2)E(ac(14),s2,10,f.dim,true)end
de("SETTINGS FILE  (saved on your phone)")z=ac(28)c.cfgName=eO(z,"default","config name",y(0,0.5))c.cfgSave=x(z,"SAVE",f.good,11,y(0.5,0.25))
c.cfgLoad=x(z,"LOAD",f.accent,11,y(0.75,0.25))z=ac(26)c.cfgPrev=x(z,"<",f.panel2,11,y(0,0.13))c.cfgPick=x(z,"(none saved)",f.panel2,10,y(0.13,0.74))
c.cfgNext=x(z,">",f.panel2,11,y(0.87,0.13))z=ac(26)c.cfgAuto=x(z,"LOAD IT ON LAUNCH: OFF",f.panel2,10,y(0,1))
c.cfgMsg=E(ac(26),"",10,f.dim,false)de("START BY ITSELF")z=ac(26)c.autoB=x(z,"INSTALL F.exec",f.accent,10,y(0,1))
c.autoMsg=E(ac(30),"",10,f.dim,false)z=ac(28)c.startT=x(z,"START FARMING ON LOAD: ON",f.accent,10,y(0,1))E(ac(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,f.dim,false)
de("IF THE GAME DROPS ME")z=ac(28)c.rejT=x(z,"AUTO REJOIN: ON",f.accent,11,y(0,0.55))c.rejB=x(z,"REJOIN NOW",f.warn,11,y(0.55,0.45))
c.rejMsg=E(ac(30),"",10,f.dim,false)de("SMOOTHER RUNNING  (for long / overnight runs)")z=ac(28)c.pfLite=x(z,"LITE MODE: OFF",f.panel2,10,y(0,0.5))
c.pfHud=x(z,"HIDE GAME HUD: OFF",f.panel2,10,y(0.5,0.5))z=ac(28)c.pfFps=x(z,"FPS CAP: GAME",f.panel2,10,y(0,0.5))
c.pfRender=x(z,"STOP 3D: OFF",f.panel2,10,y(0.5,0.5))z=ac(28)c.pfMem=eO(z,tostring(e.MemLimit),"2000",y(0,0.24))
E(z,"MB: rejoin this server above it (0 = never)",9,f.dim,false,y(0.26,0.52))c.pfMemSet=x(z,"SET",f.accent,11,y(0.8,0.2))
c.pfInfo=E(ac(18),"",10,f.text,false)E(ac(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,f.dim,false)
de("THE ROUND SAB BUTTON")E(ac(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,f.dim,false)
c.set.CanvasSize=UDim2 .new(0,0,0,db)local mN=D("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},hD)
c.tgRoot=D("Frame",{Size=UDim2 .new(0,40,0,40),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=f.accent,BorderSizePixel=0,Active=true},mN)ab(c.tgRoot,20)D("UIStroke",{Color=f.line,Thickness=1},c.tgRoot)
c.tgBtn=D("TextButton",{Text="SAB",Size=aT,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=f.text,AutoButtonColor=false},c.tgRoot)
c.tgDot=D("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=f.dim,BorderSizePixel=0},c.tgRoot)
ab(c.tgDot,4)local aU={built=false,boxes={},at=0}local function mO(mP,hQ)e.Targets[mP]=hQ or nil local hR=aU.boxes[mP]
if hR then hR.Text=hQ and"X"or""hR.BackgroundColor3=hQ and f.good or f.panel2 end end local function hS()for s3,mQ in pairs(aU.boxes)do
local mR=e.Targets[s3]==true mQ.Text=mR and"X"or""mQ.BackgroundColor3=mR and f.good or f.panel2 end end local df
local function s4()local s5=0 local hT=D("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},c.but)
c.butInfo=E(hT,"",10,f.dim,false,y(0,0.5))local s6=x(hT,"CLEAR",f.panel2,10,y(0.5,0.24))local s7=x(hT,"REFRESH",f.panel2,10,y(0.74,0.26))
s6 .MouseButton1Click:Connect(function()for s8 in pairs(e.Targets)do e.Targets[s8]=nil end hS()end)s7 .MouseButton1Click:Connect(function()
K.at=0 fT()df(true)end)return s5 end df=function(s9)if not fT()then if not c.butEmpty then c.butEmpty=E(D("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},c.but),
"butter list not loaded yet - open this tab again in a moment",11,f.warn,false)end return end if aU.built and not s9 and aU.at==K.at then return end
for vb,hU in ipairs(c.but:GetChildren())do if hU:IsA("Frame")or hU:IsA("TextButton")then hU:Destroy()end end aU.boxes,c.butEmpty={},nil
s4()local hV,hW=36,1 local function mS(mT)hW=hW+1 local s_=D("Frame",{Size=UDim2 .new(1,0,0,mT),BackgroundTransparency=1,LayoutOrder=hW},c.but)
hV=hV+mT+6 return s_ end for vc,eX in ipairs(K.rarOrder)do local ta=mS(24)local tb=my[eX]or f.text local hX=D("Frame",{Size=aT,BackgroundColor3=f.panel,BorderSizePixel=0},ta)
ab(hX,6)E(hX,"  "..eX:upper(),11,tb,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local tc=x(hX,"ALL",f.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local td=eX tc.MouseButton1Click:Connect(function()local mU=K.members[td]or{}local mV=false for vd,te in ipairs(mU)do if not e.Targets[te]then mV=true break end end
for ve,tf in ipairs(mU)do mO(tf,mV)end end)for vf,hY in ipairs(K.members[eX]or{})do local tg=mS(22)local eY=D("TextButton",{Text="",Size=aT,BackgroundColor3=f.bg,BorderSizePixel=0,
AutoButtonColor=true},tg)ab(eY,5)E(eY,"   "..V(hY),11,f.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local hZ=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=f.text,AutoButtonColor=false},eY)ab(hZ,4)aU.boxes[hY]=hZ local mW=hY local function mX()mO(mW,not e.Targets[mW])end
eY.MouseButton1Click:Connect(mX)hZ.MouseButton1Click:Connect(mX)end end hS()c.but.CanvasSize=UDim2 .new(0,0,0,hV+10)
aU.built,aU.at=true,K.at end function A.paint()for th,mY in pairs(A.boxes)do local mZ=e.CrateTicks[th]==true mY.Text=mZ and"X"or""
mY.BackgroundColor3=mZ and f.good or f.panel2 end if c.crtInfo then local h0,h1=0,0 for vg in pairs(A.boxes)do h0=h0+1 end
for vh,ti in pairs(e.CrateTicks)do if ti then h1=h1+1 end end c.crtInfo.Text=("%d crates, %d ticked"):format(h0,h1)
end if c.crtAll then c.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"c.crtAll.BackgroundColor3=e.Crates and f.accent or f.panel2
end end function A.build()for vi,h2 in ipairs(c.crt:GetChildren())do if h2:IsA("Frame")or h2:IsA("TextButton")then h2:Destroy()end
end A.boxes={}local h3,h4=12,0 local function eZ(m0)h4=h4+1 h3=h3+m0+6 return D("Frame",{Size=UDim2 .new(1,0,0,m0),BackgroundTransparency=1,LayoutOrder=h4},c.crt)
end local h5=eZ(28)c.crtInfo=E(h5,"",10,f.dim,false,y(0,0.5))local tj=x(h5,"CLEAR",f.panel2,10,y(0.5,0.24))local tk=x(h5,"REFRESH",f.panel2,10,y(0.74,0.26))
L(tj.MouseButton1Click:Connect(function()e.CrateTicks={}A.paint()end))L(tk.MouseButton1Click:Connect(function()A.build()end))
c.crtAll=x(eZ(28),"",f.accent,11,y(0,1))L(c.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates A.paint()end))
E(eZ(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,f.dim,false)
for vj,aV in ipairs(A.list())do local tl=eZ(24)local dg=D("TextButton",{Text="",Size=aT,BackgroundColor3=f.panel,BorderSizePixel=0,AutoButtonColor=true},tl)
ab(dg,5)E(dg,"  "..(aV.title or aV.name)..(aV.guess and"  (?)"or""),11,my[aV.rar or""]or f.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
E(dg,aV.price and("$"..ao(aV.price))or(aV.rar or""),9,f.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local h6=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=f.text,AutoButtonColor=false},dg)ab(h6,4)A.boxes[aV.k]=h6 local m1=aV.k local function m2()e.CrateTicks[m1]=(not e.CrateTicks[m1])or nil
A.paint()end L(dg.MouseButton1Click:Connect(m2))L(h6 .MouseButton1Click:Connect(m2))end c.crt.CanvasSize=UDim2 .new(0,0,0,h3+10)
A.built=A.at A.paint()end local m3="farm"local function bd(ad)m3=ad c.farm.Visible,c.but.Visible,c.set.Visible=(ad=="farm"),(ad=="but"),(ad=="set")
c.crt.Visible=(ad=="crt")c.pet.Visible,c.team.Visible=(ad=="pet"),(ad=="team")c.tabCrt.BackgroundColor3=(ad=="crt")and f.accent or f.panel2
c.tabPet.BackgroundColor3=(ad=="pet")and f.accent or f.panel2 c.tabTeam.BackgroundColor3=(ad=="team")and f.accent or f.panel2
if ad=="pet"and not j.built then pcall(j.build)end if ad=="team"and not o.built then pcall(o.build)end if ad=="crt"and(A.built~=A.at or not next(A.boxes))then A.build()end
c.tabFarm.BackgroundColor3=(ad=="farm")and f.accent or f.panel2 c.tabBut.BackgroundColor3=(ad=="but")and f.accent or f.panel2
c.tabSet.BackgroundColor3=(ad=="set")and f.accent or f.panel2 if ad=="but"then df(false)end end local function N(m4,m5,tm,tn)
m4 .Text=m5 and tm or tn m4 .BackgroundColor3=m5 and f.accent or f.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(m6)
local dh=j.rows and j.rows[m6]if not dh then return end local e0=e.Pets[m6]or{}dh.b.BackgroundColor3=e0 .b and f.good or f.panel2
dh.g.BackgroundColor3=e0 .g and f.accent or f.panel2 dh.g.Text=e0 .g and"BIG"or"ANY"dh.w.BackgroundColor3=e0 .w and f.warn or f.panel2
end function j.flag(h7,h8)local bx=e.Pets[h7]or{}if bx[h8]then bx[h8]=nil else bx[h8]=true end e.Pets[h7]=(bx.b or bx.g or bx.w)and bx or nil
j.paintRow(h7)end function j.paintAll()for to in pairs(j.rows or{})do j.paintRow(to)end if c.pbT then N(c.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(c.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")end end function j.live()if not j.built then j.build()return end
if r()-(j.liveAt or 0)<1 then return end j.liveAt=r()local m7=j.wishes()for h9,tp in pairs(j.rows)do tp.name.Text=j.nice(h9)..(m7[h9]and("   * wish %dm"):format(math.ceil(m7[h9]/60))or"")
end local e1=j.data()local m8=tonumber(C:GetAttribute("PetWishCredits"))or 0 c.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(e1 and#(e1 .pets or{})or 0,e1 and tonumber(e1 .maxOwned)or 60,
ao(j.money()),m8>0 and(" | free wishes "..m8)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local e2=j.info()for vk,h_ in ipairs(c.pet:GetChildren())do if h_:IsA("Frame")or h_:IsA("TextLabel")then h_:Destroy()end
end j.rows={}local ia,e3=0,12 local function b1(m9)ia,e3=ia+1,e3+m9+6 return D("Frame",{Size=UDim2 .new(1,0,0,m9),BackgroundTransparency=1,LayoutOrder=ia},c.pet)
end local m_=b1(28)c.pbT=x(m_,"AUTO ADOPT: OFF",f.panel2,10,y(0,0.5))c.pwT=x(m_,"AUTO WISH: OFF",f.panel2,10,y(0.5,0.5))
c.pbT.MouseButton1Click:Connect(function()e.PetBuy=not e.PetBuy j.paintAll()end)c.pwT.MouseButton1Click:Connect(function()e.PetWish=not e.PetWish j.paintAll()end)
c.pInfo=E(b1(44),"",10,f.dim,false)E(b1(40),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (costs 2x its price, 20 min, one per pet per server).",9,f.dim,false)
if not e2 then E(b1(30),"pet list not loaded yet - open this tab again in a moment",11,f.warn,false)c.pet.CanvasSize=UDim2 .new(0,0,0,e3)
j.built=false return end local b2={}for vl,na in ipairs(j.order())do local ib=e2 .Pets[na].rarity or"?"b2[ib]=b2[ib]or{}
table.insert(b2[ib],na)end local b3={}for vm,nb in ipairs(e2 .Rarities or{})do if b2[nb]then b3[#b3+1]=nb end end
for nc in pairs(b2)do if not table.find(b3,nc)then b3[#b3+1]=nc end end for vn,e4 in ipairs(b3)do local nd=D("Frame",{Size=aT,BackgroundColor3=f.panel,BorderSizePixel=0},b1(22))
ab(nd,6)E(nd,"  "..e4:upper(),11,j.RC[e4]or f.text,true)for vo,e5 in ipairs(b2[e4])do local b4=D("Frame",{Size=aT,BackgroundColor3=f.bg,BorderSizePixel=0},b1(38))
ab(b4,5)local tq=E(b4,j.nice(e5),11,j.RC[e4]or f.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-122,0,17))local tr,ts=pcall(function()return e2 .describe(e5)end)
E(b4,tr and tostring(ts)or"",9,f.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-122,0,17))local ne=x(b4,"BUY",f.panel2,9,UDim2 .new(1,-114,0.5,-11),UDim2 .new(0,34,0,22))
local nf=x(b4,"ANY",f.panel2,9,UDim2 .new(1,-77,0.5,-11),UDim2 .new(0,34,0,22))local ng=x(b4,"WISH",f.panel2,9,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,36,0,22))
local ic=e5 ne.MouseButton1Click:Connect(function()j.flag(ic,"b")end)nf.MouseButton1Click:Connect(function()j.flag(ic,"g")end)
ng.MouseButton1Click:Connect(function()j.flag(ic,"w")end)j.rows[e5]={b=ne,g=nf,w=ng,name=tq}end end c.pet.CanvasSize=UDim2 .new(0,0,0,e3+10)
j.built=true j.paintAll()end function l.paint()N(c.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")N(c.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")
N(c.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")N(c.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not c.pfMem:IsFocused()then c.pfMem.Text=tostring(e.MemLimit)end end function l.applyAll()if e.Lite then l.lite(true)end
if e.HideHud then l.hideHud(true)end if e.NoRender then l.render(true)end if(e.FpsCap or 0)~=0 then l.cap(e.FpsCap)end
l.paint()end L(c.pfLite.MouseButton1Click:Connect(function()l.lite(not e.Lite)l.paint()end))L(c.pfHud.MouseButton1Click:Connect(function()l.hideHud(not e.HideHud)l.paint()end))
L(c.pfRender.MouseButton1Click:Connect(function()l.render(not e.NoRender)l.paint()end))L(c.pfFps.MouseButton1Click:Connect(function()
local tt=table.find(l.CAPS,e.FpsCap or 0)or 1 local nh=l.CAPS[(tt%#l.CAPS)+1]if not l.cap(nh)and nh~=0 then q("this executor cannot cap fps")end
l.paint()end))L(c.pfMemSet.MouseButton1Click:Connect(function()local ie=tonumber(c.pfMem.Text)if ie and ie>=0 then e.MemLimit=math.floor(ie)end
l.paint()end))function o.names()local ig={"(none)"}for vp,tu in ipairs((o.teams()))do ig[#ig+1]=tu.name end return ig
end function o.cycle(ih,tv)local e6=o.names()local tw=e[ih]~=""and e[ih]or"(none)"local e7=table.find(e6,tw)or 1
e7=((e7-1+tv)%#e6)+1 e[ih]=e6[e7]=="(none)"and""or e6[e7]o.paint()end function o.paint()if not o.built then return end
N(c.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")local ii={}for vq,tx in ipairs((o.teams()))do ii[tx.name]=true end
for ty,ni in pairs(o.pick)do local b5=e[ty]ni.Text=b5==""and"(none)"or(ii[b5]and b5 or(b5 .." (missing)"))ni.TextColor3=(b5~=""and not ii[b5])and f.bad or f.text
end if not c.tmLead:IsFocused()then c.tmLead.Text=tostring(e.GlazeLead)end c.tmInfo.Text=(o.msg or"")..("\nswitches %d | waxes finished %d | glazed %d"):format(o.switches,o.finished,o.glazed)
local tz,e8=j.srv(),{}for vr,e9 in ipairs(o.list or{})do e8[#e8+1]=("st %-2s %-22s %9s  helps %d"):format(e9 .st.Name,V(O(e9 .name)):sub(1,22),o.clock(e9 .ends-tz),e9 .helps)
end c.tmList.Text=#e8>0 and table.concat(e8,"\n")or"no waxes running"end function o.build()for vs,ij in ipairs(c.team:GetChildren())do
if ij:IsA("Frame")or ij:IsA("TextLabel")then ij:Destroy()end end o.pick={}local ik,il=0,12 local function by(nj)
ik,il=ik+1,il+nj+6 return D("Frame",{Size=UDim2 .new(1,0,0,nj),BackgroundTransparency=1,LayoutOrder=ik},c.team)
end local function di(tA)E(by(14),tA,10,f.dim,true)end local function e_(fa)local im=by(26)local tB=x(im,"<",f.panel2,11,y(0,0.14))
local nk=x(im,"(none)",f.panel,10,y(0.14,0.72))local tC=x(im,">",f.panel2,11,y(0.86,0.14))tB.MouseButton1Click:Connect(function()o.cycle(fa,-1)end)
tC.MouseButton1Click:Connect(function()o.cycle(fa,1)end)nk.MouseButton1Click:Connect(function()o.cycle(fa,1)end)
o.pick[fa]=nk end c.tmT=x(by(28),"AUTO TEAMS: OFF",f.panel2,11,y(0,1))c.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=o.current()end o.paint()end)c.tmInfo=E(by(30),"",10,f.dim,false)
di("NORMAL TEAM  (worn the rest of the time)")e_("TeamNormal")di("FULL TEAM  (worn while every station is busy)")
e_("TeamFull")di("GLAZE TEAM  (worn just before a wax finishes)")e_("TeamGlaze")local io=by(26)c.tmLead=eO(io,tostring(e.GlazeLead),"45",y(0,0.2))
E(io,"sec before it finishes",10,f.dim,false,y(0.22,0.5))local tD=x(io,"SET",f.accent,11,y(0.75,0.25))tD.MouseButton1Click:Connect(function()
local fb=tonumber(c.tmLead.Text)if fb and fb>=5 and fb<=600 then e.GlazeLead=math.floor(fb)else c.tmLead.Text=tostring(e.GlazeLead)end
o.paint()end)di("WAX TEAM  (worn while a butter is placed)")e_("TeamWax")di("YOUR WAXES  (time left, helps)")
c.tmList=D("TextLabel",{Size=aT,BackgroundColor3=f.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=f.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},by(150))ab(c.tmList,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},c.tmList)
E(by(92),"Teams are the loadouts you saved in the game's Teams page. A wax's time is fixed when it is placed and its glaze is rolled when it finishes, so the WAX team only needs to be on while placing and the GLAZE team only at the finish. While every station is busy only wax-stir pets (Seal, Koala) still help, so the FULL team can be money + stir. A help never leaves a wax under 60 s, so 45 s is enough. While AUTO TEAMS is on it keeps putting the right team back.",9,f.dim,false)
c.team.CanvasSize=UDim2 .new(0,0,0,il+10)o.built=true o.paint()end local function tE()c.secB.Text=tostring(e.Every)
N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then c6(e.AutoStart,true)end if a.winPos then c.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then c.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end bc(c.root)bc(c.tgRoot)a.lastCollect=r()
hS()A.paint()pcall(j.paintAll)pcall(o.paint)pcall(l.applyAll)end local function tF(nl)task.spawn(function()nl.TextColor3=f.bad
task.wait(0.8)if a.alive then nl.TextColor3=f.text end end)end local function nm()local nn=c.secB.Text:match("^%s*(%d+)%s*$")
local dj=nn and tonumber(nn)if not dj or dj<1 then c.secB.Text=tostring(e.Every)tF(c.secB)q("interval must be a whole number >= 1")
return end if dj==e.Every then return end e.Every,a.lastCollect=dj,r()q("collect every "..dj.."s")end local function H(tG,tH)L(tG.MouseButton1Click:Connect(tH))end
H(c.secSet,nm)L(c.secB.FocusLost:Connect(nm))H(c.colT,function()e.Collect,a.lastCollect=not e.Collect,r()N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)H(c.sellT,function()e.SellJunk=not e.SellJunk N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)H(c.sellB,function()
a.sellFails=0 task.spawn(as,"selling...",mj)end)H(c.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(u.apply,"you asked",true)
end)H(c.crateT,function()e.Crates=not e.Crates N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)H(c.crateB,function()
d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(as,"opening crate...",ei,true)end)H(c.padB,function()
a.plot=aW()or a.plot local no,ip=aI(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(no and ip and ip:IsA("BasePart"))then q("SET PAD: need character and plot")return end
a.manualPad=ip.CFrame:ToObjectSpace(no.HumanoidRootPart.CFrame)r1(a.manualPad)q("collect pad saved at your position")
end)H(c.startB,function()c6(not a.running)end)H(c.buyB,function()a.plot=aW()or a.plot task.spawn(as,"buying (manual)...",ke,true)
end)H(c.plB,function()a.plot=aW()or a.plot task.spawn(as,"waxing (manual)...",kj)end)H(c.tabFarm,function()bd("farm")end)
H(c.tabBut,function()bd("but")end)H(c.tabSet,function()bd("set")end)H(c.tabCrt,function()bd("crt")end)H(c.tabPet,function()bd("pet")end)
H(c.tabTeam,function()bd("team")end)local function tI(iq)a.hidden=iq c.root.Visible=not iq c.tgBtn.Text=iq and"SAB+"or"SAB"
end mG(c.tgBtn,c.tgRoot,function()bc(c.tgRoot)a.togPos=eS(c.tgRoot)or a.togPos end)H(c.tgBtn,function()if(a.dragMoved[c.tgBtn]or 0)<8 then tI(not a.hidden)end
a.dragMoved[c.tgBtn]=0 end)local an,af={},0 local function be()an=jB()if#an==0 then c.cfgPick.Text="(none saved)"
af=0 return end if af<1 or af>#an then af=1 end c.cfgPick.Text=an[af]..("  (%d/%d)"):format(af,#an)end local function np()
local nq=a.autoload~=nil c.cfgAuto.Text=nq and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"c.cfgAuto.BackgroundColor3=nq and f.accent or f.panel2
end local function ir()local nr=c.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if nr~=""then return nr end return(af>0 and an[af])or""
end H(c.cfgSave,function()a.winPos=eS(c.root)or a.winPos a.togPos=eS(c.tgRoot)or a.togPos local ns,nt=dY(ir())
c.cfgMsg.Text=ns and("saved as "..nt)or("could not save: "..nt)c.cfgMsg.TextColor3=ns and f.good or f.bad be()
q(c.cfgMsg.Text)end)local function tJ(is)local it,nu=jK(is)c.cfgMsg.Text=it and("loaded "..nu)or("could not load: "..nu)
c.cfgMsg.TextColor3=it and f.good or f.bad if it then c.cfgName.Text=is tE()task.spawn(u.apply,"config "..is)
end q(c.cfgMsg.Text)end H(c.cfgLoad,function()tJ(ir())end)H(c.cfgPick,function()be()if af>0 then c.cfgName.Text=an[af]end
end)H(c.cfgPrev,function()if#an==0 then be()return end af=(af-2)%#an+1 be()c.cfgName.Text=an[af]end)H(c.cfgNext,function()
if#an==0 then be()return end af=af%#an+1 be()c.cfgName.Text=an[af]end)H(c.cfgAuto,function()if a.autoload then
jM(nil)c.cfgMsg.Text="it will not load a config on launch"else local dk=ir()local nv=false for vt,tK in ipairs(jB())do if tK==dk then nv=true end end
local tL=nv or dY(dk)if tL and dk~=""then jM(dk)be()c.cfgMsg.Text=dk.." will load every time the script starts"
else c.cfgMsg.Text="name the config and save it first"end end c.cfgMsg.TextColor3=f.dim np()end)H(c.autoB,function()
local nw,nx=pn()c.autoMsg.Text=nw and("installed. "..nx)or("failed: "..nx)c.autoMsg.TextColor3=nw and f.good or f.bad
q(c.autoMsg.Text)end)H(c.startT,function()e.AutoStart=not e.AutoStart N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)H(c.rejT,function()e.Rejoin=not e.Rejoin N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)H(c.rejB,function()cn("you asked")end)
local bz=false H(c.minB,function()bz=not bz c.tabs.Visible=not bz if bz then c.farm.Visible,c.but.Visible,c.set.Visible,c.crt.Visible=false,false,false,false
c.pet.Visible,c.team.Visible=false,false else bd(m3)end c.root.Size=UDim2 .new(0,aa.w,0,bz and(aa.head+aa.strip)or aa.h)
c.minB.Text=bz and"+"or"-"end)local function fc()if not a.alive then return end a.alive,a.running=false,false
pcall(l.restoreAll)pcall(dz)for vu,tM in ipairs(fi)do pcall(function()tM:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()hE:Destroy()end)pcall(function()mN:Destroy()end)if bB.SAB_KILL==fc then bB.SAB_KILL=nil end end
bB.SAB_KILL=fc H(c.killB,fc)H(c.xB,fc)mG(c.title,c.root,function()bc(c.root)a.winPos=eS(c.root)or a.winPos end)
local function ny()local dl,dm=a.reason,a.level if a.busy then dl,dm=a.busyText,"ok"elseif not a.running then
local vv,nz,tN=mp()if a.capHit then dl,dm=nz,"bad"else dl,dm="[stopped] "..nz,(tN=="bad")and"bad"or"idle"end a.reason,a.level=dl,dm
end c.reason.Text=dl c.bar.BackgroundColor3=sn[dm]or f.dim c.dot.BackgroundColor3=a.running and f.good or(a.capHit and f.bad or f.dim)
c.tgDot.BackgroundColor3=c.dot.BackgroundColor3 c.tgRoot.BackgroundColor3=a.hidden and f.panel2 or f.accent c.startB.Text=a.running and"STOP"or"START"
N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")c.startB.BackgroundColor3=a.running and f.warn or f.good
local tO,tP=dw()c.sBought.Text,c.sPlaced.Text,c.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
c.sColl.Text,c.sFree.Text=tostring(a.collected),tO.."/"..tP local nA=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(r()-a.lastCollect)))or nil
local nB=M()c.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ao(aH()),a.rolls,a.gifts,a.crates,nB and V(O(nB))or"nothing",d.on and("   ["..d.title.." window open]")or"",nA and("in "..nA.."s")or"off")
local b6=oY()c.tgt.Text=(#b6==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#b6<=3)and table.concat(b6,", ")or(#b6 .." butters ticked")))
c.tgt.TextColor3=(#b6==0)and f.bad or f.good c.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
c.log.Text=table.concat(dq,"\n")if c.butInfo then c.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(K.n,#K.rarOrder,#b6)
end if c.but.Visible and aU.at~=K.at then df(false)end if c.crt.Visible then if A.built~=A.at then A.build()else A.paint()end
end if c.pet.Visible then j.live()end if c.set.Visible then c.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(l.fps+0.5),l.mem,l.memPeak)
end if c.team.Visible then o.paint()end N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local nC=(u.rec.on and"on"or"")..(u.rec.off and((u.rec.on and"/"or"").."off")or"")c.arL.Text=u.msg~=""and u.msg or("game: %s | learned: %s%s"):format(u.isOn()and"ON"or"off",
nC~=""and nC or"nothing yet",#u.rec.rules>0 and", choices"or"")c.arL.TextColor3=u.msg~=""and f.warn or f.dim end
bB.SAB={S=a,CFG=e,EV=F,U=c,sg=hE,CAT=K,LEARN=Q,buildList=df,logAll=b7,evAll=b8,AR=u,CR=A,PF=l,PX=j,TM=o,CRATE=d}
q(bA.." loaded")if a.uiErrs>0 then q("UI: "..a.uiErrs.." properties skipped")end bd("farm")bc(c.root)bc(c.tgRoot)
if eP then pcall(function()L(eP:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bc(c.root)
bc(c.tgRoot)end))end)end be()np()if a.config and a.config~=""then c.cfgName.Text=a.config end N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
c.secB.Text=tostring(e.Every)pcall(l.applyAll)pcall(ny)task.spawn(function()local nD=pl()c.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(nD and("\n(backup: "..nD..")")or"")
local nE=dT(T.exec)if nE and not nE:find("SAB autoloader v2",1,true)then ck(T.exec,T.stub)q("autoexec updated: it now loads the newest version from GitHub")
end c.autoMsg.Text=(dT(T.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(pt)end)task.spawn(function()while a.alive do local tQ,tR=pcall(ny)if not tQ then q("UI ERR "..tostring(tR))end
task.wait((a.hidden or bz)and 1.5 or 0.25)end end)task.spawn(function()local tS,tT=pcall(pC)if not tS then q("HOOK ERR "..tostring(tT))end
end)task.spawn(function()pcall(oi)if d.loadSeq and not d.learned then local fd={}for nF=1,20 do if d.loadSeq[nF]then fd[#fd+1]=d.loadSeq[nF]end end
if#fd>0 then d.learned={seq=fd,mode=d.loadMode}q("remembered how to open crates directly")end end if fT()then q(("catalog: %d butters in %d rarities"):format(K.n,#K.rarOrder))end
local tU,nG=pcall(r3)if tU and nG and a.alive and not a.manualPad then a.manualPad=nG end end)task.spawn(function()
while a.alive do local iu,iv=pcall(j.buyTick)if not iu then q("PET ERR "..tostring(iv))task.wait(5)end iu,iv=pcall(j.wishTick)
if not iu then q("WISH ERR "..tostring(iv))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local fe,nH=0,r()
L(game:GetService("RunService").Heartbeat:Connect(function()fe=fe+1 end))l.noteAt=r()while a.alive do task.wait(1)
local nI=r()l.fps,fe,nH=fe/math.max(nI-nH,0.001),0,nI local tV,tW=pcall(l.tick)if not tV then q("PERF ERR "..tostring(tW))task.wait(5)end
end end)task.spawn(function()while a.alive do local tX,tY=pcall(o.tick)if not tX then q("TEAM ERR "..tostring(tY))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()while a.alive do task.wait(20)pcall(dz)end end)pcall(u.watchCache)
if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then pcall(function()local t0=(type(newcclosure)=="function")and newcclosure or function(tZ)return tZ end
local iw local nJ=(type(setnamecallmethod)=="function")and setnamecallmethod or nil iw=hookmetamethod(game,"__namecall",t0(function(nK,...)
local dn=getnamecallmethod()if a.alive and(dn=="InvokeServer"or dn=="FireServer")then local nL,nM=pcall(function()return nK.Name end)
if nL and nM=="CrateAction"and not d.replaying then pcall(d.saw,dn,...)elseif nL and nM=="AutoRollAction"and not u.replaying then pcall(u.saw,dn,...)end
if nJ then nJ(dn)end end return iw(nK,...)end))d.oldNC=iw end)end if fg then L(C.Idled:Connect(function()pcall(function()fg:CaptureController()fg:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for vw=1,90 do if not a.alive then return end if C:GetAttribute("AutoRollOn")~=nil and aI()and(a.plot or aW())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then u.apply("joined")end while a.alive do task.wait(30)if a.alive and e.AutoRoll and a.running and not u.isOn()and not co()and not M()
and not d.waiting and not d.on and not a.busy then u.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for vx=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or aW()if aI()and a.plot and next(e.Targets)then c6(true,true)q("started by itself")
return end task.wait(1)end if a.alive and not a.running then q("gave up waiting to start - tap START")end end)
task.spawn(function()a.plot=aW()a.lastCollect=r()while a.alive do if a.running then local t1,nN=pcall(si)if not t1 and nN~=fh then q("LOOP ERR "..tostring(nN))end
end task.wait(0.1)end end)ff("loaded - window is at the top left")end local t3,ix=xpcall(nR,function(t2)return tostring(t2).."\n"..debug.traceback()end)
if not t3 then pcall(function()warn("SAB "..bA.." ERROR: "..tostring(ix))end)ff("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bA.." ERROR: "..tostring(ix))end)pcall(function()local nO=(type(getgenv)=="function"and getgenv())or _G
if type(nO.SAB_KILL)=="function"then nO.SAB_KILL()end for vy,t4 in ipairs({"SABFarmGui","SABToggle"})do local nP=C.PlayerGui:FindFirstChild(t4)
if nP then nP:Destroy()end end end)pcall(function()local dp=Instance.new("ScreenGui")dp.Name="SABError"dp.ResetOnSpawn=false
dp.DisplayOrder=1000 local aA=Instance.new("TextBox")aA.Size=UDim2 .new(0,340,0,170)aA.Position=UDim2 .new(0,10,0,50)
aA.BackgroundColor3=Color3 .fromRGB(90,20,20)aA.TextColor3=Color3 .new(1,1,1)aA.TextSize=11 aA.TextWrapped=true
aA.ClearTextOnFocus=false aA.TextXAlignment=Enum.TextXAlignment.Left aA.TextYAlignment=Enum.TextYAlignment.Top
aA.Text="SAB "..bA.." failed to start. Send this text:\n"..tostring(ix)aA.Parent=dp dp.Parent=C:WaitForChild("PlayerGui")
end)end
