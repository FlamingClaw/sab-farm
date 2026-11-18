local bA="v25"local iu=game:GetService("Players")local C=iu.LocalPlayer or iu.PlayerAdded:Wait()local function fd(nO)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bA,Text=nO,Duration=6})
end)end fd("script started")local function nP()local au=game:GetService("ReplicatedStorage")local aB=game:GetService("Workspace")
local nQ=game:GetService("UserInputService")local bB=(type(getgenv)=="function"and getgenv())or _G if type(bB.SAB_KILL)=="function"then pcall(bB.SAB_KILL)end
local r=(type(tick)=="function")and tick or os.clock local fe=(function()local nR,nS=pcall(function()return game:GetService("VirtualUser")end)return nR and nS or nil end)()
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
local j,o,l={},{},{}local ff={}local fg,dn,b5,b6={},{},{},{}local function L(iv)fg[#fg+1]=iv return iv end local function ah(nT)
task.wait(nT)if not a.alive then error(ff,0)end end local function q(dp)dp=os.date("%H:%M:%S").." "..tostring(dp)
table.insert(dn,1,dp)if#dn>6 then table.remove(dn)end b5[#b5+1]=dp if#b5>80 then table.remove(b5,1)end end local function dq(iw)
if type(iw)~="string"then return""end return(iw:lower():gsub("[^%w]",""))end local function O(nU)local ix=dq(nU)
local fh=ix:gsub("butter$","")if fh==""then fh=ix end return fh end local function aF(fi)return type(fi)=="string"and O(fi)~=""and e.Targets[O(fi)]==true end
local function nV(b7)b7=b7:lower()return b7:find("squishy",1,true)~=nil or b7:match("butter$")~=nil or b7:match("butter[^%a]")~=nil
end local fj={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ao(b8)if type(b8)~="number"then return"?"end
local dr=1 while math.abs(b8)>=1000 and dr<#fj do b8=b8/1000 dr=dr+1 end local nW=string.format("%.2f",b8):gsub("%.?0+$","")
return nW..fj[dr]end local function nX(iy)if type(iy)~="string"then return nil end local nY,iz=iy:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local fk=tonumber(nY)if not fk then return nil end if iz==""then return fk end for nZ,n0 in ipairs(fj)do if n0:lower()==iz:lower()then return fk*1000^(nZ-1)end end
return nil end local function aG()local iA=C:GetAttribute("BoardValueMoney")if type(iA)=="number"then return iA end
local iB=C:FindFirstChild("leaderstats")if iB then for t2,n1 in ipairs({"Cash","Money","Coins"})do local fl=iB:FindFirstChild(n1)
if fl and type(fl.Value)=="number"then return fl.Value end end end end local function ds(n2)local fm=n2:GetFullName()
if a.plot then local fn=a.plot:GetFullName()if fm:sub(1,#fn)==fn then return fm:sub(#fn+2)end end return fm end
local function aH()local dt=C.Character if dt and dt:FindFirstChild("HumanoidRootPart")then local iC=dt:FindFirstChildOfClass("Humanoid")
if iC and iC.Health>0 then return dt end end end local function aW()local fo=aB:FindFirstChild("Plots")if not fo then return nil end
local function iD(n3)local iE=n3:FindFirstChild("Plate")return iE~=nil and iE:FindFirstChild("EditStackAttachment",true)~=nil
end local iF=C:GetAttribute("PlotNumber")if iF~=nil then local fp=fo:FindFirstChild(tostring(iF))if fp and iD(fp)then return fp end
end for t3,iG in ipairs(fo:GetChildren())do if iD(iG)then return iG end end end local function b9(iH)local aX=iH and iH.Parent
for t4=1,6 do if not aX then return nil end if aX:IsA("BasePart")then return aX end if aX:IsA("Model")then return aX.PrimaryPart or aX:FindFirstChildWhichIsA("BasePart",true)end
aX=aX.Parent end end local function iI(iJ)local fq=iJ.Parent if fq and fq:IsA("Attachment")then return fq.WorldPosition end
local iK=b9(iJ)return iK and iK.Position end local function n4()local bC=a.plot and a.plot:FindFirstChild("Plate")
if not bC then return nil end if bC:IsA("BasePart")then return bC.Position end if bC:IsA("Model")then return bC:GetPivot().Position end
local iL=bC:FindFirstChildWhichIsA("BasePart",true)return iL and iL.Position end local function iM()local fr={}
local iN=a.plot and a.plot:FindFirstChild("WaxStations")if iN then for t5,n5 in ipairs(iN:GetChildren())do local iO=n5:FindFirstChild("SquishyPlaceHolder")
local fs=iO and iO:FindFirstChild("PlacePrompt")if fs and fs:IsA("ProximityPrompt")then fr[#fr+1]=fs end end end
return fr end local function du()local iP,ft=iM(),0 for t6,n6 in ipairs(iP)do if n6 .Enabled then ft=ft+1 end end
local fu=#iP local fv=C:GetAttribute("WaxStations")if type(fv)=="number"and fv>fu then fu=fv end return ft,fu
end local function n7()local iQ=aH()local iR=iQ and iQ.HumanoidRootPart.Position local fw,iS for t7,fy in ipairs(iM())do
if fy.Enabled then local iT=iI(fy)local iU=(iT and iR)and(iT-iR).Magnitude or 1e9 if not fw or iU<iS then fw,iS=fy,iU end
end end return fw end local function iV()local dv=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not dv then return nil end local iW=dv:FindFirstChild("BuyPromptAttachment")local dw=(iW and iW:FindFirstChild("BuyPrompt"))or dv:FindFirstChild("BuyPrompt",true)
if dw and dw:IsA("ProximityPrompt")and dw:IsDescendantOf(dv)then return dw end end local iX={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local n8={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local Q={order={},price={},dirty=false}local A={seen={},at=0,boxes={},built=0}local K={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local fz="SAB_order.txt"local function dx()if not Q.dirty or type(writefile)~="function"then return end local ai={}
for n9,n_ in pairs(Q.price)do ai[#ai+1]="P|"..n9 .."|"..string.format("%.0f",n_)end for oa,ob in pairs(Q.order)do ai[#ai+1]="O|"..oa.."|"..table.concat(ob,",")end
if d.learned and d.enc then ai[#ai+1]="M|mode|"..tostring(d.learned.mode or"")for oc,dy in ipairs(d.learned.seq)do
local iY={}for iZ=1,dy.n do iY[iZ]=d.enc(dy.args[iZ])end ai[#ai+1]=("A|%d|%s|%d|%s"):format(oc,dy.m,dy.n,table.concat(iY,";"))
end end local function fA(od,oe,dz)local i0={}for i1=1,dz.n do i0[i1]=d.enc(dz.args[i1])end ai[#ai+1]=("R|%d|%s|%s|%d|%s"):format(oe,od,dz.m,dz.n,table.concat(i0,";"))
end if d.enc then for of,og in ipairs(u.rec.rules)do fA("rules",of,og)end if u.rec.on then fA("on",0,u.rec.on)end
if u.rec.off then fA("off",0,u.rec.off)end end for t8,b_ in pairs(A.seen)do ai[#ai+1]=("K|%s|%s|%s|%s"):format(b_.name,b_.title or"",b_.rar or"",b_.price and string.format("%.0f",b_.price)or"")
end if pcall(writefile,fz,table.concat(ai,"\n"))then Q.dirty=false end end local function oh()if type(isfile)~="function"or type(readfile)~="function"then return end
local oi,oj=pcall(isfile,fz)if not(oi and oj)then return end local ol,i2=pcall(readfile,fz)if not(ol and type(i2)=="string")then return end
for om in i2:gmatch("[^\n]+")do local bD,bE,aI=om:match("^(%a)|([^|]+)|(.*)$")if bD=="P"then Q.price[bE]=tonumber(aI)
elseif bD=="M"then d.loadMode=(aI~=""and aI~="nil")and aI or nil elseif bD=="A"and d.dec then local i3=tonumber(bE)
local i4,dA,oo=aI:match("^([^|]+)|(%d+)|(.*)$")if i3 and i4 then dA=tonumber(dA)local i5,dB={},0 for op in(oo..";"):gmatch("([^;]*);")do
dB=dB+1 if dB<=dA then i5[dB]=d.dec(op)end end d.loadSeq=d.loadSeq or{}d.loadSeq[i3]={m=i4,n=dA,args=i5}end elseif bD=="R"and d.dec then
local i6=tonumber(bE)local dC,oq,dD,ot=aI:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if i6 and dC then dD=tonumber(dD)
local i7,dE={},0 for ou in(ot..";"):gmatch("([^;]*);")do dE=dE+1 if dE<=dD then i7[dE]=d.dec(ou)end end local fB={m=oq,n=dD,args=i7}
if dC=="rules"then u.rec.rules[i6]=fB elseif dC=="on"then u.rec.on=fB elseif dC=="off"then u.rec.off=fB end end
elseif bD=="K"then local i8,i9,ov=aI:match("^([^|]*)|([^|]*)|(.*)$")A.seen[A.key(bE)]={name=bE,title=i8~=""and i8 or nil,
rar=i9~=""and i9 or nil,price=tonumber(ov)}elseif bD=="O"and aI~=""then local dF={}for ow in aI:gmatch("[^,]+")do dF[#dF+1]=ow end
if#dF>0 then Q.order[bE]=dF end end end end local function ox(dG)if type(dG)~="table"then return end local bf,i_=dG.rarity,dG.contents
if type(bf)~="string"or bf==""or type(i_)~="table"then return end local ca={}for t9,dH in ipairs(i_)do if type(dH)=="table"and type(dH.butter)=="string"then
ca[#ca+1]={n=dH.butter,ch=tonumber(dH.chance)or 0}end end if#ca==0 then return end table.sort(ca,function(oy,oz)return oy.ch>oz.ch end)
local cb,cc={},false for oA,oB in ipairs(ca)do cb[oA]=oB.n end local fC=Q.order[bf]if not fC or#fC~=#cb then cc=true end
if not cc then for ja=1,#cb do if fC[ja]~=cb[ja]then cc=true break end end end Q.order[bf]=cb local fD=tonumber(dG.price)
if fD and Q.price[bf]~=fD then Q.price[bf]=fD cc=true end if cc then Q.dirty=true K.at=0 q("learned the "..bf.." order from its crate")
end end local function bF(oC,oD)local oE=oC:FindFirstChild(oD,true)local oF,fE=pcall(function()return oE.Text end)
return(oF and type(fE)=="string"and fE~="")and fE or nil end local function V(jb)return K.pretty[jb]or jb end
A.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function A.key(oG)return dq(oG or"")end
function A.learn(aJ)if type(aJ)~="table"or type(aJ.name)~="string"then return end local fF=A.key(aJ.name)local aK=A.seen[fF]or{}
local oH=(A.seen[fF]==nil)or(tonumber(aJ.price)and aK.price~=tonumber(aJ.price))aK.name,aK.title=aJ.name,aJ.title or aK.title
aK.rar,aK.price=aJ.rarity or aK.rar,tonumber(aJ.price)or aK.price A.seen[fF]=aK if oH then A.at,Q.dirty=r(),true end
end function A.wanted(jc)return jc~=nil and e.CrateTicks[A.key(jc)]==true end function A.list()local bG={}for oI,dI in ipairs(A.base)do bG[A.key(dI[1])]={name=dI[1],title=dI[2],rar=dI[3],i=oI}end
for t_,cd in ipairs(K.rarOrder)do local jd=false for ua,oJ in pairs(bG)do if oJ.rar==cd then jd=true break end end
if not jd and cd~="?"then local je=cd:gsub("[^%w]","").."Crate"bG[A.key(je)]={name=je,title=cd.." Crate",rar=cd,i=50,guess=true}
end end for jf,dJ in pairs(A.seen)do local aC=bG[jf]or{i=100}aC.name,aC.title,aC.rar=dJ.name or aC.name,dJ.title or aC.title,dJ.rar or aC.rar
aC.price,aC.guess=dJ.price or aC.price,nil bG[jf]=aC end local ce,dK={},{}for oK,oL in ipairs(iX)do ce[oL]=oK end
for oM,jg in ipairs(K.rarOrder)do ce[jg]=ce[jg]or(20+oM)end for oN,cf in pairs(bG)do cf.k=oN cf.price=cf.price or Q.price[cf.rar or""]
dK[#dK+1]=cf end table.sort(dK,function(bh,bi)if bh.price and bi.price and bh.price~=bi.price then return bh.price<bi.price end
local jh,ji=ce[bh.rar or""]or 99,ce[bi.rar or""]or 99 if jh~=ji then return jh<ji end if(bh.i or 100)~=(bi.i or 100)then return(bh.i or 100)<(bi.i or 100)end
return bh.k<bi.k end)return dK end local function oO()local jj=au:FindFirstChild("Assets")local jk=jj and jj:FindFirstChild("Squishies")
if not jk then return false end local fG,jl,bH={},{},{}local dL=0 for ub,dM in ipairs(jk:GetChildren())do local cg=O(dM.Name)
if cg~=""and not fG[cg]then local dN=bF(dM,"RarityText")or"?"fG[cg]=dN jl[cg]=bF(dM,"NameText")or dM.Name bH[dN]=bH[dN]or{}
table.insert(bH[dN],cg)dL=dL+1 end end if dL==0 then return false end for jm,oP in pairs(bH)do local jn=Q.order[jm]or n8[jm]
local fH={}if jn then for oQ,oR in ipairs(jn)do fH[O(oR)]=oQ end end table.sort(oP,function(jo,jp)local fI,fJ=fH[jo],fH[jp]
if fI and fJ then return fI<fJ end if fI then return true end if fJ then return false end return V(jo)<V(jp)end)
end local fK={}for oS,oT in ipairs(iX)do fK[oT]=oS end local dO={}for oU in pairs(bH)do dO[#dO+1]=oU end table.sort(dO,function(fL,fM)
local fN,fO=Q.price[fL],Q.price[fM]if fN and fO and fN~=fO then return fN<fO end local fP,fQ=fK[fL],fK[fM]if fP and fQ then return fP<fQ end
if fP then return true end if fQ then return false end return fL<fM end)K.rar,K.pretty,K.members,K.rarOrder,K.n,K.at=fG,jl,bH,dO,dL,r()
return true end local function fR()if K.at==0 or(r()-K.at)>120 then pcall(oO)end return K.n>0 end local function oV(oW)
local jq=O(oW)return K.rar[jq]or(F.name and O(F.name)==jq and F.rar)or"?"end local function oX()local dP={}for oY,oZ in pairs(e.Targets)do if oZ then dP[#dP+1]=V(oY)end end
table.sort(dP)return dP end local T={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function jr()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function dQ(js)if type(makefolder)~="function"then return end local o0,o1=pcall(isfolder,js)if not(o0 and o1)then pcall(makefolder,js)end
end local function dR(jt)if type(isfile)~="function"or type(readfile)~="function"then return nil end local o2,o3=pcall(isfile,jt)
if not(o2 and o3)then return nil end local o4,o5=pcall(readfile,jt)return o4 and o5 or nil end local function ci(o6,o7)
if type(writefile)~="function"then return false end return(pcall(writefile,o6,o7))end local function ju(o8)local cj={}
if type(listfiles)~="function"then return cj end local o9,jv=pcall(listfiles,o8)if not o9 or type(jv)~="table"then return cj end
for uc,o_ in ipairs(jv)do cj[#cj+1]=tostring(o_)end return cj end local function jw()local dS={}for ud,pa in ipairs(ju(T.cfg))do
local jx=pa:match("([^/\\]+)%.txt$")if jx then dS[#dS+1]=jx end end table.sort(dS)return dS end local function pb()
local J={"V|1"}J[#J+1]="N|Every|"..tostring(e.Every)J[#J+1]="N|GlazeLead|"..tostring(e.GlazeLead)J[#J+1]="N|FpsCap|"..tostring(e.FpsCap)
J[#J+1]="N|MemLimit|"..tostring(e.MemLimit)for ue,jy in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do J[#J+1]="S|"..jy.."|"..e[jy]end
do local dT={}for pc,fS in pairs(e.Pets)do local jz=(fS.b and"b"or"")..(fS.g and"g"or"")..(fS.w and"w"or"")if jz~=""then dT[#dT+1]=pc.."|"..jz end
end table.sort(dT)J[#J+1]="P|-"for uf,pd in ipairs(dT)do J[#J+1]="P|"..pd end end for ug,jA in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender"})do
J[#J+1]="B|"..jA.."|"..(e[jA]and"1"or"0")end local fT=C:GetAttribute("AutoRollRules")if type(fT)=="string"and fT~=""then e.ARrules,e.ARstop=fT,tostring(C:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then J[#J+1]="S|rules|"..e.ARrules J[#J+1]="S|stop|"..e.ARstop end if a.winPos then J[#J+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then J[#J+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for uh,fU in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local dU={}for pe,pf in pairs(fU[2])do if pf then dU[#dU+1]=pe end end table.sort(dU)J[#J+1]=fU[1].."|-"for ui,pg in ipairs(dU)do J[#J+1]=fU[1].."|"..pg end
end return table.concat(J,"\n")end local function ph(fV)if type(fV)~="string"or fV==""then return false end local jB,jC,jD,jE,ck={},false,{},false,nil
for pj in fV:gmatch("[^\n]+")do local ap,P,aj=pj:match("^(%a)|([^|]*)|?(.*)$")if ap=="N"and P=="Every"then local fW=tonumber(aj)
if fW and fW>=1 then e.Every=math.floor(fW)end elseif ap=="N"and(P=="FpsCap"or P=="MemLimit")then local fX=tonumber(aj)
if fX and fX>=0 then e[P]=math.floor(fX)end elseif ap=="N"and P=="GlazeLead"then local dV=tonumber(aj)if dV and dV>=5 and dV<=600 then e.GlazeLead=math.floor(dV)end
elseif ap=="S"and(P=="TeamNormal"or P=="TeamFull"or P=="TeamGlaze"or P=="TeamWax")then e[P]=aj elseif ap=="P"and P~=""then
if not ck then ck={}end if P~="-"and aj~=""then ck[P]={b=aj:find("b",1,true)and true or nil,g=aj:find("g",1,true)and true or nil,
w=aj:find("w",1,true)and true or nil}end elseif ap=="B"then if e[P]~=nil then e[P]=(aj=="1")end elseif ap=="S"and P=="rules"then
e.ARrules=aj elseif ap=="S"and P=="stop"then e.ARstop=aj elseif ap=="W"then a.winPos={tonumber(P)or 10,tonumber(aj)or 44}
elseif ap=="G"then a.togPos={tonumber(P)or 10,tonumber(aj)or 300}elseif ap=="T"and P~=""then if P~="-"then jB[P]=true end
jC=true elseif ap=="K"and P~=""then if P~="-"then jD[P]=true end jE=true end end if jC then e.Targets=jB end if jE then e.CrateTicks=jD end
if ck then e.Pets=ck end return true end local function dW(bI)if not jr()then return false,"this executor cannot write files"end
bI=(bI or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if bI==""then return false,"give the config a name"end
dQ(T.dir)dQ(T.cfg)if not ci(T.cfg.."/"..bI..".txt",pb())then return false,"could not write the file"end a.config=bI
return true,bI end local function jF(dX)local jG=dR(T.cfg.."/"..dX..".txt")if not jG then return false,"no config called "..tostring(dX)end
if not ph(jG)then return false,"that config looks empty"end a.config=dX return true,dX end local function jH(fY)
if fY then dQ(T.dir)ci(T.auto,fY)elseif type(delfile)=="function"then pcall(delfile,T.auto)else ci(T.auto,"")
end a.autoload=fY end local function pk()if a.selfPath then return a.selfPath end local dY for uj,pl in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",T.dir})do
for uk,jI in ipairs(ju(pl))do local fZ=jI:lower()if fZ:sub(-4)==".lua"and(fZ:find("sab_farm",1,true)or fZ:find("sab farm",1,true))then
dY=dY or jI end end end a.selfPath=dY return dY end T.stub=[[
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
local function pm()if not jr()then return false,"this executor cannot write files"end dQ("autoexec")if not ci(T.exec,T.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local dZ=(function()local pn,po=pcall(function()return game:GetService("TeleportService")end)return pn and po or nil end)()
local function f0()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local pp=queueonteleport or queue_on_teleport return(pcall(pp,T.stub))end local function cl(pq)if a.rejoining then return end
a.rejoining=true q("REJOIN ("..pq..")")pcall(dx)if a.autoload then pcall(dW,a.autoload)end local pr=f0()q(pr and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for ul=1,30 do if not dZ then break end pcall(function()dZ:Teleport(game.PlaceId,C)end)task.wait(10)
end end)end local function ps()local pt,jJ=pcall(function()return game:GetService("GuiService")end)if pt and jJ then
pcall(function()L(jJ.ErrorMessageChanged:Connect(function()if e.Rejoin then cl("roblox error message")end end))
end)end pcall(function()local jK=game:GetService("CoreGui")local jL=jK and jK:WaitForChild("RobloxPromptGui",15)
local jM=jL and jL:WaitForChild("promptOverlay",15)if jM then L(jM.ChildAdded:Connect(function(pu)if e.Rejoin and tostring(pu.Name):lower():find("errorprompt",1,true)then cl("disconnect prompt")end
end))end end)pcall(function()L(C.OnTeleport:Connect(function(pv)if tostring(pv):find("Started")then f0()end end))
end)if dZ then pcall(function()L(dZ.TeleportInitFailed:Connect(function()a.rejoining=false if e.Rejoin then task.delay(5,function()cl("teleport retry")end)end
end))end)end end local function jN(pw)local jO=a.plot and a.plot:FindFirstChild(pw)if not jO then return nil,false end
for um,f1 in ipairs(jO:GetChildren())do if f1:IsA("Model")or f1:IsA("BasePart")then return f1,true end end return nil,true
end local function cm()local aY=jN("RolledSquishy")if not aY then return nil end return{model=aY,name=aY.Name,pretty=bF(aY,"NameText")or V(O(aY.Name)),
rar=bF(aY,"RarityText")or oV(aY.Name),price=bF(aY,"PriceText")}end local function jP(f2)return type(f2)=="string"and(K.rar[O(f2)]~=nil or nV(f2))
end local function M()local f3=jN("SquishyEquipped")if f3 then a.carrySrc,d.heldAt="model",r()return f3 .Name,f3 end
local jQ=C.Character if jQ then for un,cn in ipairs(jQ:GetDescendants())do if(cn:IsA("Model")or cn:IsA("Tool"))and jP(cn.Name)then
a.carrySrc,d.heldAt="character",r()return cn.Name,cn end end end local d0=C:GetAttribute("SquishyEquipped")if type(d0)=="string"and d0~=""and jP(d0)and r()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return d0,nil end a.carrySrc=nil end local function uo()local up,px=M()return px end local function jR()
local jS=cm()local f4=jS and nX(jS.price)local f5=aG()if f4 and f5 and f5<f4*0.5 then return f5,f4 end end local function bJ(py)
b6[#b6+1]=os.date("%H:%M:%S").." "..py if#b6>40 then table.remove(b6,1)end end local function pz(bj,d1)if type(bj)~="string"then return end
bJ(("Roll(%s,%s)"):format(bj,tostring(d1)))if bj:lower():find("crate",1,true)then d.rolled,d.rolledAt=bj,r()return
end F.seq=F.seq+1 F.name,F.at=bj,r()F.rar=type(d1)=="string"and d1 or nil a.rolls=a.rolls+1 if aF(bj)then q(("ROLL %s [%s] = TARGET"):format(bj,tostring(d1)))end
end local function pA(bk)if type(bk)~="table"then return end local d2=bk.butter or bk.itemName if type(d2)~="string"then return end
a.gifts=a.gifts+1 F.gift,F.giftAt=d2,r()if type(bk.giftId)=="string"then local jT=au:FindFirstChild("Remotes")
local jU=jT and jT:FindFirstChild("GiftThanks")if jU then pcall(function()jU:FireServer(bk.giftId)end)end end
bJ("Gift("..d2 .." from "..tostring(bk.fromName)..")")q(("GIFT from %s: %s - it will not be waxed"):format(tostring(bk.fromName),d2))
end local function pB()local jV=au:WaitForChild("Remotes",30)if not a.alive then return end if not jV then q("Remotes folder missing - no roll events")return end
L(C:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local jW=C:GetAttribute("SquishyEquipped")
if type(jW)=="string"and jW~=""then d.heldAt=r()end end))local pH={SquishyRollAnimation=pz,InitSquishy=function(jX)F.init,F.initAt=tostring(jX),r()bJ("Init("..tostring(jX)..")")end,
CrateUpdate=function(bK,jY)pcall(ox,bK)pcall(A.learn,bK)if type(bK)=="table"then local pC=jY==true or(d.rolled~=nil and r()-d.rolledAt<15)or d.waiting
if not pC then return end local pD=not d.waiting local pE=d.on d.waiting,d.data,d.at=true,bK,r()d.on=(jY==true)
d.title=tostring(bK.title or bK.name or"crate")if d.on and not pE then d.openedAt,d.byYou=r(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then bJ("CrateWindow open("..d.title..")")elseif pD then bJ("Crate waiting("..d.title..")")q(d.title.." is waiting on your stand")
end else if d.waiting then bJ("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local pF=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,pF)end if d.classify then local pG=r()
task.spawn(function()pcall(d.classify,pG)end)end end end,GiftReceived=pA,}for d3,pI in pairs(pH)do local f6=jV:FindFirstChild(d3)
if f6 and f6:IsA("RemoteEvent")then L(f6 .OnClientEvent:Connect(pI))elseif d3~="CrateUpdate"and d3~="GiftReceived"then q("remote "..d3 .." missing")end
end end local function f7()local bl=cm()if bl then if aF(bl.name)then return{state="match",shown=bl.pretty,src="pad",info=bl}
end return{state="skip",info=bl,level="idle",text=("on pad: %s [%s] - not ticked"):format(bl.pretty,tostring(bl.rar))}
end if F.name and(r()-F.at)<4 then if aF(F.name)then return{state="match",shown=V(O(F.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(V(O(F.name)),tostring(F.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function jZ(pJ,pK,pL,pM)
local d4=RaycastParams.new()d4 .FilterType=Enum.RaycastFilterType.Exclude local f8={C.Character}for uq,pN in ipairs(pM or{})do f8[#f8+1]=pN end
d4 .FilterDescendantsInstances=f8 pcall(function()d4 .RespectCanCollide=true end)local j0=aB:Raycast(Vector3 .new(pJ,pK+4,pL),Vector3 .new(0,-30,0),d4)
return j0 and j0 .Position or nil end local function f9(j1)local j2=j1:FindFirstChildOfClass("Humanoid")return((j2 and j2 .HipHeight)or 2)+j1 .HumanoidRootPart.Size.Y/2+0.2
end local function f_(pO,pP)local j3=pO:FindFirstChildOfClass("Humanoid")local pQ=r()while r()-pQ<pP do if j3 and j3 .FloorMaterial~=Enum.Material.Air then return true end
ah(0.05)end return false end local function co(pR,ga,gb)local j4=pR.HumanoidRootPart j4 .AssemblyLinearVelocity=Vector3 .new(0,0,0)
j4 .CFrame=gb and CFrame.new(ga,Vector3 .new(gb.X,ga.Y,gb.Z))or CFrame.new(ga)end local function cp(aL,j5)local bm=aH()
if not bm or not aL then return false end local aZ=aL.Position local d5=math.clamp(math.max(aL.Size.X,aL.Size.Z)/2+2.2,3,7)
local j6=(j5 and j5 .MaxActivationDistance)or 10 if d5>j6-2 then d5=math.max(2.5,j6-2)end local cq={}local function bn(cr)
cr=Vector3 .new(cr.X,0,cr.Z)if cr.Magnitude>0.05 then cq[#cq+1]=cr.Unit end end local j7=n4()if j7 then bn(j7-aZ)end
bn(aL.CFrame.LookVector)bn(-aL.CFrame.LookVector)bn(aL.CFrame.RightVector)bn(-aL.CFrame.RightVector)bn(bm.HumanoidRootPart.Position-aZ)
if#cq==0 then bn(Vector3 .new(0,0,1))end local pS,d6=f9(bm),false for ur,pT in ipairs(cq)do local d7=aZ+pT*d5
local gc=jZ(d7 .X,aZ.Y,d7 .Z,{aL})if gc and math.abs(gc.Y-aZ.Y)<14 then co(bm,Vector3 .new(d7 .X,gc.Y+pS,d7 .Z),aZ)
if f_(bm,0.7)then d6=true break end end end if not d6 then co(bm,aZ+cq[1]*d5+Vector3 .new(0,3,0),aZ)d6=f_(bm,1)
end ah(0.12)return d6 end local function pU(cs)if not cs.Parent or not cs.Enabled then return false end pcall(function()cs:InputHoldBegin()end)
ah(math.max(cs.HoldDuration,0)+0.08)pcall(function()cs:InputHoldEnd()end)return true end local function ae(j8,pV)
local pW=r()while r()-pW<pV do if j8()then return true end ah(0.05)end return j8()end local function d8(bL,pX,j9,pY)
local pZ=a.zapFirst and{"zap","hold"}or{"hold","zap"}for p0,gd in ipairs(pZ)do if p0==2 and(pY or not(bL.Parent and bL.Enabled and(not j9 or j9())))then break end
local ge if gd=="hold"then ge=pU(bL)else ge=type(fireproximityprompt)=="function"and bL.Parent~=nil and bL.Enabled and pcall(fireproximityprompt,bL)end
if ge and ae(pX,1.2)then a.zapFirst=(gd=="zap")return true,gd end end return false end local function j_(gf)local a0=iV()
if not a0 or not a0 .Enabled then q("buy: nothing on the pad")return false end local ka=b9(a0)if not ka then q("buy: pad part missing")return false end
a.lastBuyAt=r()local p1,kb=F.seq,aG()cp(ka,a0)if not a0 .Enabled then q("buy aborted: pad emptied")return false end
local bM=f7()if not gf and bM.state~="match"then q("buy aborted: "..(bM.text or"pad changed"))a.matchSince=nil
return false end local gg=bM.info and bM.info.name or(bM.state=="match"and F.name)or nil local function p2()return a0 .Enabled and M()==nil and(gf or f7().state=="match")
end local p3,p4=d8(a0,function()return M()~=nil or((not a0 .Enabled)and(gf or F.seq==p1))end,p2,jR()~=nil)if p3 then
ae(function()return M()~=nil end,0.8)local ct=M()local kc=aG()a.holding,a.bought,a.cashFails=true,a.bought+1,0
a.matchSince=nil F.name,F.rar,F.at=nil,nil,r()q(("BOUGHT %s%s via %s"):format(ct and V(O(ct))or(bM.shown or"?"),(kb and kc)and(" for $"..ao(kb-kc))or"",p4))
if ct and gg and O(ct)~=O(gg)then q(("note: picked up %s, not %s"):format(ct,gg))end return true end a.cashFails=a.cashFails+1
a.noCashUntil=r()+math.min(8*2^(a.cashFails-1),60)local kd=cm()q(("BUY REFUSED: cash short? have $%s, price %s"):format(ao(aG()),(kd and kd.price)or"?"))
return false end local function ke()local d9=M()if not d9 then a.holding=false q("place: hands are empty")return false
end if not aF(d9)then q(("REFUSED TO WAX %s - it is not ticked"):format(V(O(d9))))return false end for us=1,e.PlaceTries do
local a1=n7()if not a1 then q("place: no free station")break end local kf=b9(a1)if kf then cp(kf,a1)local kg=M()
if not kg then a.holding=false q("place: hands emptied on the way")return false end if not aF(kg)then q("place: what I carry changed, not waxing it")return false end
if a1 .Enabled then local p5,p6=d8(a1,function()return not a1 .Enabled end,function()return a1 .Enabled end)if p5 then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=r()+2.5,0 F.name,F.rar,F.at=nil,nil,r()
q(("WAXED %s #%d at %s via %s"):format(V(O(d9)),a.placed,a1 .Parent.Parent.Name,p6))return true end end end ah(0.25)
end a.placeFails=a.placeFails+1 if M()==nil then a.holding=false end q("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then
a.capHit,a.running,a.capAt=true,false,r()a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(M()))q(a.capMsg)end return false end function o.place()if e.Teams and e.TeamWax~=""then o.placing=true
local p7=r()while a.alive and o.current()~=e.TeamWax and r()-p7<5 do ah(0.1)end if o.current()==e.TeamWax then
local kh,p8=o.expectSocialWax(e.TeamWax),r()while a.alive and kh>0 and(tonumber(C:GetAttribute("PetSocialWax"))or 0)<kh-1e-6 and r()-p8<4 do ah(0.1)end
ah(0.25)else q("wax team did not come on in time - placing anyway")end end local p9,ki=pcall(ke)o.placing=false
if not p9 then error(ki,0)end return ki end local function kj(kk)return type(kk)=="string"and kk:lower():find("crate",1,true)~=nil
end local p_={SABFarmGui=1,SABToggle=1,SABError=1}local function gh(qa)local a2=qa while a2 do if p_[a2 .Name]then return false end
if a2:IsA("ScreenGui")then local qb,qc=pcall(function()return a2 .Enabled end)return(not qb)or qc~=false end if a2:IsA("GuiObject")and not a2 .Visible then return false end
a2=a2 .Parent end return false end local function d_(ea)local bN=""pcall(function()if ea:IsA("TextButton")then bN=ea.Text end end)
if not bN:find("%a")then for ut,eb in ipairs(ea:GetDescendants())do if(eb:IsA("TextLabel")or eb:IsA("TextButton"))and eb.Text:find("%a")then bN=eb.Text break end
end end if not bN:find("%a")then bN=ea.Name end return(bN:lower():gsub("[^%a]",""))end local function qd()local cu,cv
local kl=C:FindFirstChildOfClass("PlayerGui")if not kl then return nil,nil end for uu,cw in ipairs(kl:GetDescendants())do
if cw:IsA("GuiButton")and gh(cw)then local gi=d_(cw)if gi:sub(1,4)=="open"and not gi:find("shop",1,true)then cu=cu or cw end
if gi:sub(1,7)=="discard"then cv=cv or cw end end end if cu and cv then return cu,cv end if d.on then return cu,cv end
return nil,nil end local gj=(function()local qe,qf=pcall(function()return game:GetService("VirtualInputManager")end)return qe and qf or nil end)()
local function km(aM,gk)local gl={}local function kn(qg)gl[#gl+1]=qg end if a.tapWay then kn(a.tapWay)end for uv,ko in ipairs({"touch","conn","signal"})do
if ko~=a.tapWay then kn(ko)end end local function kp(qh,...)local qi,gm=pcall(getconnections,qh)if not(qi and type(gm)=="table"and#gm>0)then return false end
local kq,qj,qk=false,{...},select("#",...)for uw,ql in ipairs(gm)do if pcall(function()ql:Fire(table.unpack(qj,1,qk))end)then kq=true end
end return kq end local function kr()local ks=Vector3 .new(0,0,0)pcall(function()local kt,ku=aM.AbsolutePosition,aM.AbsoluteSize
ks=Vector3 .new(kt.X+ku.X/2,kt.Y+ku.Y/2,0)end)local gn={Position=ks,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()gn.UserInputType=Enum.UserInputType.Touch end)pcall(function()gn.UserInputState=Enum.UserInputState.End end)
return gn end for ux,aN in ipairs(gl)do local cx=false if aN=="conn"and type(getconnections)=="function"then if kp(aM.MouseButton1Click)then
cx=true if ae(gk,1.5)then a.tapWay=aN return true,aN end end cx=kp(aM.Activated,kr(),1)elseif aN=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aM.MouseButton1Click)then if ae(gk,1.5)then a.tapWay=aN return true,aN end end cx=pcall(firesignal,aM.Activated,kr(),1)
elseif aN=="touch"and gj then cx=pcall(function()local kv,kw=aM.AbsolutePosition,aM.AbsoluteSize local kx=0 local ky=aM:FindFirstAncestorWhichIsA("ScreenGui")
local qm,qn=pcall(function()return ky and ky.IgnoreGuiInset end)if not(qm and qn)then pcall(function()kx=game:GetService("GuiService"):GetGuiInset().Y end)
end local kz,kA=kv.X+kw.X/2,kv.Y+kw.Y/2+kx gj:SendMouseButtonEvent(kz,kA,0,true,game,1)task.wait(0.06)gj:SendMouseButtonEvent(kz,kA,0,false,game,1)
end)end if cx and ae(gk,1.5)then a.tapWay=aN return true,aN end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function go(kB)local cy=kB.Parent while cy and cy~=a.plot do if d.NOT[cy.Name]then return false end cy=cy.Parent
end local gp=(kB.ActionText or""):lower()if gp:find("roll",1,true)or gp:find("place",1,true)or gp:find("sell",1,true)then return false end
return true end local function qo()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local kC=a.plot:FindFirstChild("CrateStand")local cz if kC then for uy,ec in ipairs(kC:GetDescendants())do
if ec:IsA("ProximityPrompt")and ec.Enabled and go(ec)then cz=ec break end end end if not cz then for uz,a3 in ipairs(a.plot:GetDescendants())do
if a3:IsA("ProximityPrompt")and a3 .Enabled and go(a3)then local kD=a3:FindFirstAncestorWhichIsA("Model")local qp=((a3 .ActionText or"").." "..(a3 .ObjectText or"").." "..a3 .Name.." "..(kD and kD.Name or"")):lower()
if qp:find("crate",1,true)then cz=a3 break end end end end d.prompt=cz return cz end local function gq()if d.on then return true end
local cA=qo()if not cA then d.summonFails=d.summonFails+1 d.lastFail=r()q("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local kE=b9(cA)if kE then cp(kE,cA)end d.ours=true d8(cA,function()return d.on end)if ae(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=r()q("crate: pressed "..ds(cA).." but no window came up")
return false end do local function qq(kF)local bO=kF.Parent while bO and bO:IsA("GuiObject")do local kG,kH=false,false
for uA,cB in ipairs(bO:GetDescendants())do if cB~=kF and cB:IsA("GuiButton")and d_(cB):sub(1,7)=="discard"then kG=true end
if cB:IsA("TextLabel")then local gr=cB.Text:lower()if gr:find("crate",1,true)or gr:find("can contain",1,true)or gr:find("cost",1,true)then kH=true end
end if kG and kH then return bO end end bO=bO.Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local kI=C:FindFirstChildOfClass("PlayerGui")if not kI then return nil end for uB,ed in ipairs(kI:GetDescendants())do
if ed:IsA("GuiButton")and not ed:FindFirstAncestor("SABFarmGui")and d_(ed):sub(1,4)=="open"then local gs=qq(ed)
if gs then d.win=gs return gs end end end end local function qr(qs)for uC,ee in ipairs(qs:GetDescendants())do
if ee:IsA("GuiButton")then local kJ,gt=d_(ee),ee.Name:lower()if kJ=="x"or kJ=="close"or gt=="x"or gt:find("close",1,true)or gt:find("exit",1,true)then return ee end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(qt)task.wait(qt and 4 or 1.2)if d.on or d.waiting then return end
local ef=d.findWin()if not ef or not gh(ef)then return end local kK=qr(ef)if kK and km(kK,function()return not gh(ef)end)then return end
q("the crate window is still open - tap its X")end end local function eg(eh)if not gq()then return false end local kL=r()-(d.openedAt or 0)
if kL<0.6 then ah(0.6-kL)end local gu=d.title local qu,qv=qd()local kM=eh and qu or qv if not kM then d.lastFail=r()
a.crateFails=a.crateFails+1 q(("crate: no %s button found in %s"):format(eh and"Open"or"Discard",gu))return false
end local qw=M()local qx,uD=km(kM,function()return(not d.on)or(M()~=nil and M()~=qw)end)if not qx then d.lastFail=r()
a.crateFails=a.crateFails+1 q("crate: could not press "..(eh and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if eh then a.crates=a.crates+1 ae(function()return M()~=nil end,1.5)local kN=M()
q(("OPENED %s -> %s"):format(gu,kN and V(O(kN))or"?"))else q("discarded "..gu.." (nothing ticked in it)")end return true
end d.calls={}function d.saw(qy,...)local qz=select("#",...)d.calls[#d.calls+1]={t=r(),m=qy,n=qz,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(ak,aO)local a4=type(ak)if(a4=="string"or a4=="number")and type(aO.data)=="table"then for kO,gv in pairs(aO.data)do
if gv==ak and type(kO)=="string"and(type(gv)=="string"or type(gv)=="number")then return{__slot="f:"..kO}end end
end if a4=="string"then if aO.crate and ak==aO.crate then return{__slot="crate"}end if aO.title and ak==aO.title then return{__slot="title"}end
if aO.rar and ak==aO.rar then return{__slot="rarity"}end return ak end if a4=="number"or a4=="boolean"or a4=="nil"then return ak end
if a4=="table"then local kP={}for qA,kQ in pairs(ak)do if type(kQ)=="table"then return nil,"nested table"end local qB,kR=d.slot(kQ,aO)
if kR then return nil,kR end kP[qA]=qB end return kP end local qC,qD=pcall(function()return ak:IsA("Instance")end)
if qC and qD then if ak==C then return{__slot="player"}end if a.plot and ak==a.plot then return{__slot="plot"}end
local ei=a.plot and a.plot:FindFirstChild("CrateStand")if ei and ak==ei then return{__slot="stand"}end if ei and ak.Parent==ei then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..a4 ..")"end function d.resolve(ej)if type(ej)~="table"then return ej end
local av=ej.__slot if av and av:sub(1,2)=="f:"then return d.data and d.data[av:sub(3)]end if av=="crate"then return d.data and d.data.name end
if av=="title"then return(d.data and d.data.title)or d.title end if av=="rarity"then return d.data and d.data.rarity end
if av=="player"then return C end if av=="plot"then return a.plot end if av=="stand"or av=="model"then local gw=a.plot and a.plot:FindFirstChild("CrateStand")
if av=="stand"or not gw then return gw end for uE,kS in ipairs(gw:GetChildren())do if kj(kS.Name)then return kS end end
return nil end local kT={}for qE,qF in pairs(ej)do kT[qE]=d.resolve(qF)end return kT end function d.classify(gx)
if d.directOff then return end local ek={}for uF,gy in ipairs(d.calls)do if gy.t<=gx+0.05 and gx-gy.t<=6 then ek[#ek+1]=gy end
end if#ek==0 then return end if not ae(function()return(d.heldAt or 0)>=gx-1 end,2.5)then return end local cC={}
for uG,cD in ipairs(ek)do local kU={}for kV=1,cD.n do local qG,kW=d.slot(cD.args[kV],cD)if kW then q("crate call has "..kW.." - keeping the button method")
return end kU[kV]=qG end cC[#cC+1]={m=cD.m,n=cD.n,args=kU}end local gz=d.learned d.learned={seq=cC,mode=gz and gz.mode or nil}
Q.dirty=true if not gz then q(("learned how to open crates directly (%d call%s)"):format(#cC,#cC==1 and""or"s"))end
end function d.replay()local kX=d.learned local kY=au:FindFirstChild("Remotes")local gA=kY and kY:FindFirstChild("CrateAction")
if not(kX and gA)then return false end local kZ=table.unpack or unpack d.replaying=true for uH,cE in ipairs(kX.seq)do
local gB={}for k0=1,cE.n do gB[k0]=d.resolve(cE.args[k0])end task.spawn(function()pcall(function()if cE.m=="InvokeServer"then gA:InvokeServer(kZ(gB,1,cE.n))
else gA:FireServer(kZ(gB,1,cE.n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(qH)return(qH:gsub("[%%|;=,\n]",function(qI)return("%%%02X"):format(qI:byte())end))end
function d.enc(bo)local el=type(bo)if el=="string"then return"s"..d.esc(bo)end if el=="number"then return"n"..tostring(bo)end
if el=="boolean"then return bo and"b1"or"b0"end if el=="nil"then return"z"end if bo.__slot then return"k"..bo.__slot end
local gC={}for qJ,qK in pairs(bo)do gC[#gC+1]=d.enc(qJ).."="..d.enc(qK)end return"t"..table.concat(gC,",")end
function d.dec(k1)local cF,cG=k1:sub(1,1),k1:sub(2)local function qL(qM)return(qM:gsub("%%(%x%x)",function(qN)return string.char(tonumber(qN,16))end))end
if cF=="s"then return qL(cG)end if cF=="n"then return tonumber(cG)end if cF=="b"then return cG=="1"end if cF=="k"then return{__slot=cG}end
if cF=="t"then local k2={}for qO in cG:gmatch("[^,]+")do local k3,qP=qO:match("^(.-)=(.*)$")if k3 then local k4=d.dec(k3)
if k4~=nil then k2[k4]=d.dec(qP)end end end return k2 end return nil end function d.goneOrNew(qQ)return function()
if not d.waiting then return true end local k5=M()return k5~=nil and k5~=qQ end end function d.near()local k6=au:FindFirstChild("Remotes")
local k7=k6 and k6:FindFirstChild("CrateAction")local gD=aH()local gE=a.plot and a.plot:FindFirstChild("CrateStand")
local gF=gE and gE:FindFirstChild("Spot")if not(k7 and gD and gF)then return false,"no crate stand or remote"end
local gG=gD.HumanoidRootPart local em=gG.CFrame local k8,gH=d.title,"no answer"local qR=M()local k9=gE:FindFirstChild("Holder")
local function k_()if not k9 then return d.waiting or d.on end for uI,qS in ipairs(k9:GetChildren())do if qS:IsA("Model")then return true end end
return false end for qT=1,3 do if not(d.waiting or d.on)or not k_()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end if(gG.Position-gF.Position).Magnitude>8 then cp(gF,d.prompt)end ah(0.12+0.15*qT)
local aD={}d.replaying=true task.spawn(function()aD.ok,aD.v=pcall(function()return k7:InvokeServer("open")end)
aD.done=true end)ae(function()return aD.done end,6)d.replaying=false local bp=aD.v if aD.done and aD.ok and type(bp)=="table"and bp.ok then
a.crates,d.fails,d.nearFails=a.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,r()+4 q(("OPENED %s -> %s (no window)"):format(k8,bp.prize and V(O(tostring(bp.prize)))or"?"))
ae(function()local la=M()return la~=nil and la~=qR end,1.5)if(gG.Position-em.Position).Magnitude>8 then pcall(function()co(gD,em.Position,em.Position+em.LookVector)end)end
return true,"opened"end gH=(aD.done and aD.ok and type(bp)=="table")and tostring(bp.reason or"refused, no reason given")
or(aD.done and("error: "..tostring(bp))or"no answer in 6s")ah(0.3)if not k_()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 q(("crate: the server would not open %s next to the stand (%s)"):format(k8,gH))
return false,gH end function d.smart()local gI=d.title if(d.nearFails or 0)<3 then local qU=d.near()if qU then return true end
if d.nearFails>=3 then q("opening next to the stand failed 3 times - trying the older ways")end end local bq=d.learned
if bq then local gJ=M()if d.on then d.replay()if ae(d.goneOrNew(gJ),3.5)then a.crates=a.crates+1 q("OPENED "..gI.." (direct)")
return true end else if bq.mode~="window"then d.replay()if ae(d.goneOrNew(gJ),3.5)then a.crates,d.fails=a.crates+1,0
if bq.mode~="direct"then bq.mode,Q.dirty="direct",true q("crates now open directly - the window never comes up")
end q("OPENED "..gI.." (direct, no window)")return true end end if gq()then d.replay()if ae(d.goneOrNew(gJ),3.5)then
a.crates,d.fails=a.crates+1,0 if bq.mode~="window"then bq.mode,Q.dirty="window",true q("crates need their window up first - it shows briefly")
end q("OPENED "..gI.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,Q.dirty=bq,nil,true
if d.fails>=3 then d.directOff=true q("direct crate opening failed 3 times - using the button for now")else q("the learned crate call did not work - back to pressing Open")
end end return eg(true)end function u.snap()return{rules=C:GetAttribute("AutoRollRules"),stop=C:GetAttribute("AutoRollStop"),
on=C:GetAttribute("AutoRollOn"),main=C:GetAttribute("AutoRoll")}end u.cache={}function u.watchCache()u.cache=u.snap()
for qV,lb in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do L(C:GetAttributeChangedSignal(lb):Connect(function()u.cache[qV]=C:GetAttribute(lb)end))
end end function u.isOn()return C:GetAttribute("AutoRollOn")==true end function u.saw(qW,...)local en=u.cache
local qX={m=qW,n=select("#",...),args={...},before={rules=en.rules,stop=en.stop,on=en.on,main=en.main}}task.delay(1.5,function()
if a.alive then pcall(u.learnOne,qX)end end)end function u.learnOne(cH)local ag,cI=u.snap(),cH.before local eo=(ag.rules~=cI.rules)or(ag.stop~=cI.stop)
local lc=(ag.on~=cI.on)or(ag.main~=cI.main)if not eo and not lc then return end local ld={}for le=1,cH.n do local aq=cH.args[le]
local br=type(aq)if br=="string"and aq~=""and aq==ag.rules then aq={__slot="rules"}elseif br=="string"and aq~=""and eo and aq==ag.stop and ag.stop~=cI.stop then aq={__slot="stop"}
elseif br=="table"then local lf={}for qY,bP in pairs(aq)do if type(bP)=="table"or(type(bP)=="userdata")then u.msg="Auto Roll sends something I cannot repeat"return
end lf[qY]=(type(bP)=="string"and bP~=""and bP==ag.rules)and{__slot="rules"}or bP end aq=lf elseif br~="string"and br~="number"and br~="boolean"and br~="nil"then
if aq==C then aq={__slot="player"}else u.msg="Auto Roll sends something I cannot repeat"return end end ld[le]=aq
end local bQ={m=cH.m,n=cH.n,args=ld}if eo then local gK=false for qZ=1,bQ.n do local cJ=bQ.args[qZ]if type(cJ)=="table"and cJ.__slot=="rules"then gK=true end
if type(cJ)=="table"and not cJ.__slot then for uJ,lg in pairs(cJ)do if type(lg)=="table"and lg.__slot=="rules"then gK=true end end
end end if gK then u.rec.rules={bQ}else table.insert(u.rec.rules,bQ)if#u.rec.rules>60 then table.remove(u.rec.rules,1)end
end end if lc then if ag.on==true then u.rec.on=bQ else u.rec.off=bQ end e.AutoRoll=(ag.on==true)end if ag.rules and ag.rules~=""then e.ARrules,e.ARstop=ag.rules,ag.stop or""end
Q.dirty=true u.msg=""q(("learned an Auto Roll %s message"):format(eo and"choices"or(ag.on and"on"or"off")))end
function u.resolve(bR)if type(bR)~="table"then return bR end if bR.__slot=="rules"then return e.ARrules~=""and e.ARrules or C:GetAttribute("AutoRollRules")end
if bR.__slot=="stop"then return e.ARstop~=""and e.ARstop or C:GetAttribute("AutoRollStop")end if bR.__slot=="player"then return C end
local lh={}for q0,q1 in pairs(bR)do lh[q0]=u.resolve(q1)end return lh end function u.replay(li,q2)local lj=table.unpack or unpack
for uK,cK in ipairs(q2)do local gL={}for lk=1,cK.n do gL[lk]=u.resolve(cK.args[lk])end u.replaying=true pcall(function()
if cK.m=="InvokeServer"then task.spawn(function()pcall(function()li:InvokeServer(lj(gL,1,cK.n))end)end)else li:FireServer(lj(gL,1,cK.n))end
end)u.replaying=false task.wait(0.25)end end function u.apply(ll,q3)if u.busy or not a.alive then return end u.busy=true
pcall(function()local lm=au:FindFirstChild("Remotes")local gM=lm and lm:FindFirstChild("AutoRollAction")if not gM then u.msg="this game has no AutoRollAction"return end
local a5=e.AutoRoll if a5 and e.ARrules~=""and C:GetAttribute("AutoRollRules")~=e.ARrules then if#u.rec.rules==0 then
u.msg="pick your Auto Roll choices once in the game's menu so I can learn them"q(u.msg)else u.replay(gM,u.rec.rules)
if ae(function()return C:GetAttribute("AutoRollRules")==e.ARrules end,4)then q("Auto Roll choices put back")else
u.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"q(u.msg)end end end if a5==u.isOn()or(not a5 and not q3)then return end
local ep=a5 and u.rec.on or u.rec.off if not ep then local cL=a5 and u.rec.off or u.rec.on local ln=cL~=nil for q4=1,cL and cL.n or 0 do
if type(cL.args[q4])=="boolean"then ln=false end end if ln then ep=cL end end if not ep then u.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(a5 and"on"or"off")
q(u.msg)return end u.replay(gM,{ep})if ae(function()return u.isOn()==a5 end,4)then u.msg=""q(("Auto Roll switched %s%s"):format(a5 and"ON"or"OFF",ll and(" ("..ll..")")or""))
else u.msg="Auto Roll did not switch - do it once in the game so I can relearn it"q(u.msg)end end)u.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local q5,q6=pcall(function()return C.UserId end)return q5 and q6 or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local q7,gN=pcall(function()return require(au:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if q7 and type(gN)=="table"and type(gN.Pets)=="table"then j.I=gN end return j.I end function j.order()if j.list then return j.list end
local a6=j.info()if not a6 then return{}end local bs={}if type(a6 .Order)=="table"and#a6 .Order>0 then for uL,lo in ipairs(a6 .Order)do if a6 .Pets[lo]then bs[#bs+1]=lo end end
else for q8 in pairs(a6 .Pets)do bs[#bs+1]=q8 end table.sort(bs,function(q9,q_)return(a6 .Pets[q9].price or 0)<(a6 .Pets[q_].price or 0)end)
end j.list=bs return bs end function j.nice(lp,gO)local lq=j.info()local lr=lq and lq.Pets[lp]return((gO and gO~="")and(gO.." ")or"")..(lr and lr.displayName or tostring(lp))
end function j.data()local ls=C:GetAttribute("PetsData")if type(ls)~="string"then return nil end local ra,lt=pcall(function()return j.HS:JSONDecode(ls)end)
return(ra and type(lt)=="table")and lt or nil end function j.pen()return au:FindFirstChild("PetMeadowSpawns")end
function j.srv()return aB:GetServerTimeNow()end function j.money()local gP=C:FindFirstChild("MoneyValue")if gP and type(gP.Value)=="number"then return gP.Value end
return aG()or 0 end function j.wishes()local lu=j.pen()local lv=lu and lu:GetAttribute("Wishes")local gQ,lw={},j.srv()
if type(lv)~="string"then return gQ end local rb,lx=pcall(function()return j.HS:JSONDecode(lv)end)if rb and type(lx)=="table"then
for rc,gR in pairs(lx)do if type(gR)=="number"and gR>lw then gQ[rc]=gR-lw end end end return gQ end function j.call(...)
local ly=au:FindFirstChild("Remotes")local lz=ly and ly:FindFirstChild("PetRequest")if not lz then return nil end
local lA=table.pack(...)local bt={}task.spawn(function()bt.ok,bt.v=pcall(function()return lz:InvokeServer(table.unpack(lA,1,lA.n))end)
bt.done=true end)local rd=r()while not bt.done and r()-rd<6 do task.wait(0.05)end if bt.done and bt.ok then return bt.v end
return nil end function j.want(re)return e.Pets[re]end function j.buyTick()if not e.PetBuy then j.buyMsg="auto adopt is off"return end
local gS,lB,gT=j.info(),j.pen(),j.data()if not(gS and lB and gT)then j.buyMsg="pet data not loaded yet"return end
j.tryAt=j.tryAt or{}local cM,gU=#(gT.pets or{}),tonumber(gT.maxOwned)or 60 local rf,lC,cN=j.srv(),{},nil for uM,aw in ipairs(lB:GetChildren())do
lC[aw.Name]=true local cO,lD=aw:GetAttribute("Pet"),aw:GetAttribute("Variant")or""local gV=cO and j.want(cO)if gV and gV.b and gS.Pets[cO]and(not gV.g or lD=="Big")and not aw:GetAttribute("A_"..j.uid)
and(tonumber(aw:GetAttribute("ExpiresAt"))or 0)>rf+1 and r()>=(j.tryAt[aw.Name]or 0)then local cP,lE=j.nice(cO,lD),gS.Pets[cO].price or 0
if cM>=gU then cN=("%s is in the pen, but you have %d/%d pets"):format(cP,cM,gU)j.tryAt[aw.Name]=r()+15 elseif j.money()<lE then
cN=("%s is in the pen - need $%s"):format(cP,ao(lE))j.tryAt[aw.Name]=r()+5 else j.tryAt[aw.Name]=r()+8 local bS=j.call("adopt",aw.Name)
if type(bS)=="table"and bS.ok then cM=cM+1 j.buys=(j.buys or 0)+1 q("ADOPTED "..cP)cN="adopted "..cP else local lF=type(bS)=="table"and tostring(bS.reason or"no reason given")or"no answer"
q(("adopt %s failed: %s"):format(cP,lF))cN="adopt failed: "..lF if type(bS)=="table"and bS.bagFull then j.tryAt[aw.Name]=r()+60 end
end end end end for lG in pairs(j.tryAt)do if not lC[lG]then j.tryAt[lG]=nil end end j.buyMsg=cN or("watching the pen (%d/%d pets)"):format(cM,gU)
end function j.wishTick()if not e.PetWish then j.wishMsg="auto wish is off"return end local eq=j.info()if not(eq and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local er,gW,a7=j.wishes(),0,nil local rg=(type(eq.Wish)=="table"and eq.Wish.cashShare)or 2
for uN,al in ipairs(j.order())do local lH=j.want(al)if lH and lH.w then gW=gW+1 if not er[al]and r()>=(j.wishTry[al]or 0)then
local gX=tonumber(C:GetAttribute("PetWishCredits"))or 0 local gY=math.floor((eq.Pets[al].price or 0)*rg)if gX<=0 and j.money()<gY then
j.wishTry[al]=r()+10 a7=("need $%s to wish for %s"):format(ao(gY),j.nice(al))j.wishWhy[al]=a7 else j.wishTry[al]=r()+3
local rh=gX>0 and"wishCredit"or"wish"local es=j.call(rh,al)if type(es)=="table"and es.ok then j.wishN,j.wishWhy[al]=j.wishN+1,nil
q(("WISHED for %s (%s)"):format(j.nice(al),gX>0 and"free wish"or("$"..ao(gY))))else local gZ=type(es)=="table"and tostring(es.reason or"no reason given")or"no answer"
if gZ:lower():find("already",1,true)then j.wishTry[al]=r()+2 else q(("wish %s failed: %s"):format(j.nice(al),gZ))a7="wish failed: "..gZ end
end end end end end if not a7 then for uO,et in ipairs(j.order())do local lI=j.want(et)if lI and lI.w and not er[et]and j.wishWhy[et]then a7=j.wishWhy[et]break end
end end if not a7 then local eu={}for uP,ev in ipairs(j.order())do local lJ=j.want(ev)if lJ and lJ.w and er[ev]then eu[#eu+1]=("%s %dm"):format(j.nice(ev),math.ceil(er[ev]/60))end
end a7=gW==0 and"no pet has WISH ticked"or("running: "..(#eu>0 and table.concat(eu,", ")or"none yet"))end j.wishMsg=a7
end o.switches,o.glazed,o.finished=0,0,0 function o.teams()local g0=j.data()return(g0 and g0 .teams)or{},g0 end
function o.current(bT)bT=bT or j.data()if not bT then return""end local lK={}for uQ,ri in ipairs(bT.equipped or{})do lK[tostring(ri)]=true end
for uR,lL in ipairs(bT.teams or{})do local lM=lL.pets or{}local g1=#lM==#(bT.equipped or{})if g1 then for uS,rj in ipairs(lM)do if not lK[tostring(rj)]then g1=false break end end end
if g1 then return lL.name end end return""end function o.equip(g2)local rk,rl=o.teams()local g3 for rm,rn in ipairs(rk)do if rn.name==g2 then g3=rm break end end
if not g3 then o.msg="no saved team called "..tostring(g2)return false end if o.current(rl)==g2 then return true end
for uT=1,4 do local lN=j.call("teamEquip",g3)if type(lN)=="table"and lN.ok then o.switches=o.switches+1 return true
end task.wait(0.4)end return false end function o.waxes()local cQ={}local lO=a.plot and a.plot:FindFirstChild("WaxStations")
if not lO then return cQ end for uU,bu in ipairs(lO:GetChildren())do local lP=tonumber(bu:GetAttribute("PourEnd"))
local lQ=bu:GetAttribute("PourOwner")if bu:GetAttribute("HasSquishy")and lP and(lQ==nil or lQ==j.uid)then local lR,lS=bu:FindFirstChild("SquishyPlaceHolder"),"?"
if lR then for uV,lT in ipairs(lR:GetChildren())do if lT:IsA("Model")then lS=lT.Name break end end end local ro=tostring(bu:GetAttribute("Helpers")or"")
local g4=0 for uW in ro:gmatch("%d+")do g4=g4+1 end cQ[#cQ+1]={st=bu,ends=lP,id=bu:GetAttribute("PourId"),name=lS,helps=g4}
end end table.sort(cQ,function(rp,rq)return rp.ends<rq.ends end)return cQ end function o.glazeCount()local lU=au:FindFirstChild("Remotes")
local lV=lU and lU:FindFirstChild("EditStack")if not lV then return nil end local rr,cR=pcall(function()return lV:InvokeServer("State",nil)end)
if not(rr and type(cR)=="table"and type(cR.state)=="table")then return nil end local g5,g6=0,{}for uX,ew in ipairs(cR.state.entries or{})do
if ew.glaze and ew.glaze~=""then g5=g5+1 g6[ew.glaze]=(g6[ew.glaze]or 0)+1 end end return g5,g6,#(cR.state.entries or{}),cR.state.capacity
end function o.finishedOne(ex,lW)o.finished=o.finished+1 task.wait(2)local g7,rs,lX,rt=o.glazeCount()if g7 and lW and g7>lW then
o.glazed=o.glazed+1 local g8={}for ru,rv in pairs(rs)do g8[#g8+1]=ru.." "..rv end q(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(V(O(ex.name)),ex.st.Name,g7,table.concat(g8,", ")))
else q(("wax done on station %s: %s, no glaze%s"):format(ex.st.Name,V(O(ex.name)),lX and(" (stack "..lX.."/"..tostring(rt)..")")or""))
end end function o.tick()o.list=o.waxes()if not e.Teams then o.want,o.msg="","auto teams is off"return end local g9=j.srv()
local a8=o.glazeFor if a8 then local ey=a8 .st local rw=ey.Parent and ey:GetAttribute("HasSquishy")and ey:GetAttribute("PourId")==a8 .id
if not rw or g9>a8 .ends+40 then o.glazeFor,o.afterUntil=nil,r()+1.5 local rx=a8 .before task.spawn(function()pcall(o.finishedOne,a8,rx)end)
else a8 .ends=tonumber(ey:GetAttribute("PourEnd"))or a8 .ends end end if e.TeamGlaze~=""and not o.glazeFor then
for uY,g_ in ipairs(o.list)do if g_.ends-g9<=e.GlazeLead then o.glazeFor=g_ task.spawn(function()g_.before=o.glazeCount()end)
break end end end local ar,ez="",""if e.TeamGlaze~=""and(o.glazeFor or r()<(o.afterUntil or 0))then ar,ez=e.TeamGlaze,o.glazeFor and(" - station "..o.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(o.placing or o.aboutToPlace())then ar,ez=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and o.allBusy()then
ar,ez=e.TeamFull," - every station is busy"else ar=e.TeamNormal end o.want=ar local cS=o.current()o.cur=cS if ar~=""and cS~=ar and r()>=(o.nextTry or 0)then
o.nextTry=r()+1.1 if o.equip(ar)then q("team: "..ar..ez)else o.nextTry=r()+3 end end local ha=o.list[1]o.msg=("on: %s%s | next wax done %s"):format(cS~=""and cS or"(not a saved team)",(ar~=""and ar~=cS)and(" -> "..ar)or"",
ha and("in "..o.clock(ha.ends-g9).." (st "..ha.st.Name..")")or"- none running")end function o.clock(a9)a9=math.max(0,math.floor(a9))
if a9>=3600 then return("%d:%02d:%02d"):format(math.floor(a9/3600),math.floor((a9%3600)/60),a9%60)end return("%d:%02d"):format(math.floor(a9/60),a9%60)
end function o.allBusy()local ry,rz=du()return rz>0 and ry==0 end function o.aboutToPlace()if not a.running then return false end
local lY=M()if not(lY and aF(lY))then return false end local rA=du()return rA>0 end function o.expectSocialWax(rB)
local rC,lZ=o.teams()local hb=j.info()local hc=0 if not(hb and lZ)then return 0 end for uZ,l0 in ipairs(rC)do
if l0 .name==rB then for u0,rD in ipairs(l0 .pets or{})do for u1,cT in ipairs(lZ.pets or{})do local eA=hb.Pets[cT.name]
if tostring(cT.id)==tostring(rD)and eA and eA.boost and eA.boost.kind=="socialWax"then local rE,rF=pcall(function()return hb.boostValue(cT.name,(cT.variant~=""and cT.variant)or nil)end)
hc=math.max(hc,(rE and tonumber(rF))or eA.boost.value or 0)end end end end end return hc end function o.glazeSoon()
return e.Teams and e.TeamGlaze~=""and(o.glazeFor~=nil or r()<(o.afterUntil or 0))end l.bb,l.fx,l.post,l.hud={},{},{},{}
l.mem,l.memPeak,l.fps=0,0,0 function l.isFx(bv)return bv:IsA("ParticleEmitter")or bv:IsA("Trail")or bv:IsA("Beam")or bv:IsA("Fire")or bv:IsA("Smoke")
or bv:IsA("Sparkles")or bv:IsA("Light")end function l.muteOne(ax)if not e.Lite or not ax.Parent then return end
if ax:IsA("BillboardGui")then if l.bb[ax]==nil and ax.Enabled then l.bb[ax]=true ax.Enabled=false end elseif l.isFx(ax)then
if l.fx[ax]==nil and ax.Enabled then l.fx[ax]=true ax.Enabled=false end end end function l.lite(l1)e.Lite=l1 if l1 then
task.spawn(function()for rG,rH in ipairs(aB:GetDescendants())do if not e.Lite then return end pcall(l.muteOne,rH)
if rG%600==0 then task.wait()end end end)if not l.addConn then l.queue={}l.addConn=L(aB.DescendantAdded:Connect(function(hd)
if e.Lite and(hd:IsA("BillboardGui")or l.isFx(hd))then l.queue[#l.queue+1]=hd end end))end local he=game:GetService("Lighting")
for u2,cU in ipairs(he:GetChildren())do if cU:IsA("PostEffect")and cU.Enabled and l.post[cU]==nil then l.post[cU]=true cU.Enabled=false end
end pcall(function()l.oldShadows=l.oldShadows==nil and he.GlobalShadows or l.oldShadows he.GlobalShadows=false end)
pcall(function()l.oldDeco=l.oldDeco==nil and aB.Terrain.Decoration or l.oldDeco aB.Terrain.Decoration=false end)
else for l2 in pairs(l.bb)do pcall(function()if l2 .Parent then l2 .Enabled=true end end)end for l3 in pairs(l.fx)do pcall(function()if l3 .Parent then l3 .Enabled=true end end)end
for l4 in pairs(l.post)do pcall(function()if l4 .Parent then l4 .Enabled=true end end)end l.bb,l.fx,l.post,l.queue={},{},{},{}
local rI=game:GetService("Lighting")if l.oldShadows~=nil then pcall(function()rI.GlobalShadows=l.oldShadows end)l.oldShadows=nil end
if l.oldDeco~=nil then pcall(function()aB.Terrain.Decoration=l.oldDeco end)l.oldDeco=nil end end end l.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function l.hideHud(l5)e.HideHud=l5 local hf=C:FindFirstChildOfClass("PlayerGui")if not hf then return end if l5 then
for u3,cV in ipairs(hf:GetChildren())do if cV:IsA("ScreenGui")and not l.MINE[cV.Name]and cV.Enabled then l.hud[cV]=true cV.Enabled=false end
end if not l.hudConn then l.hudConn=L(hf.ChildAdded:Connect(function(cW)if e.HideHud and cW:IsA("ScreenGui")and not l.MINE[cW.Name]then
task.defer(function()if e.HideHud and cW.Enabled then l.hud[cW]=true cW.Enabled=false end end)end end))end else
for l6 in pairs(l.hud)do pcall(function()if l6 .Parent then l6 .Enabled=true end end)end l.hud={}end end l.CAPS={0,30,15,10}
function l.cap(hg)e.FpsCap=hg local l7=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not l7 then return false end return pcall(l7,hg==0 and 60 or hg)end function l.render(l8)e.NoRender=l8 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not l8)end)
end function l.restoreAll()pcall(l.lite,false)pcall(l.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(l.cap,0)end end function l.rejoinSame(l9)if a.rejoining then return end q("REJOIN this server ("..l9 ..")")
pcall(dx)if a.autoload then pcall(dW,a.autoload)end f0()local rJ=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,C)
end)task.delay(25,function()if a.alive then cl(l9 ..", same server failed")end end)return rJ end function l.tick()
local hh=l.queue if e.Lite and hh and#hh>0 then l.queue={}for rK,rL in ipairs(hh)do pcall(l.muteOne,rL)if rK%300==0 then task.wait()end end
end local rM,cX=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if rM and type(cX)=="number"then
l.mem=cX l.memPeak=math.max(l.memPeak,cX)if(e.MemLimit or 0)>0 and cX>e.MemLimit then l.over=(l.over or 0)+1 if l.over>=30 and not a.busy then
l.over=-600 l.rejoinSame(("memory %d MB > %d MB"):format(cX,e.MemLimit))end elseif(l.over or 0)>0 then l.over=0
end end if r()-(l.noteAt or 0)>1800 then l.noteAt=r()q(("health: %d fps, %d MB (peak %d)"):format(math.floor(l.fps+0.5),l.mem,l.memPeak))
end end a.sellWords={"sell","trash","discard","dispose","bin"}local function hi(eB)if type(eB)~="string"then return false end
eB=eB:lower()for u4,rN in ipairs(a.sellWords)do if eB:find(rN,1,true)then return true end end return false end
local function rO()local l_=au:FindFirstChild("Remotes")local hj=l_ and l_:FindFirstChild("SellSquishy")if not(hj and hj:IsA("RemoteEvent"))then return false end
if not pcall(function()hj:FireServer()end)then return false end return ae(function()return M()==nil end,1.5)end
local function rP()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end if r()-a.sellSearchAt<20 then return nil end
a.sellSearchAt=r()local ma=aH()local mb=ma and ma.HumanoidRootPart.Position local cY,mc for u5,bU in ipairs((a.plot or aB):GetDescendants())do
if bU:IsA("ProximityPrompt")and(hi(bU.ActionText)or hi(bU.ObjectText)or hi(bU.Name))then local md=iI(bU)local hk=(md and mb)and(md-mb).Magnitude or 1e9
if hk<=400 and(not cY or hk<mc)then cY,mc=bU,hk end end end a.sellSpot=cY a.noSellSpot=(cY==nil)return cY end
local function me()local hl=M()if not hl then a.holding=false return false end if aF(hl)then return false end
local hm=V(O(hl))if rO()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=r()+2.5,0
q("SOLD "..hm)return true end local bV=rP()if bV then local mf=b9(bV)if mf then cp(mf,bV)local mg=M()if mg and not aF(mg)then
local rQ,rR=d8(bV,function()return M()==nil end,function()return bV.Enabled end)if rQ then a.sold,a.holding,a.sellFails=a.sold+1,false,0
q(("SOLD %s at %s via %s"):format(hm,ds(bV),rR))return true end end end end a.sellFails=a.sellFails+1 q("could not sell "..hm.." ("..a.sellFails..")")
return false end local rS={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function rT(bW)local eC=ds(bW):lower()for u6,rU in ipairs(rS)do if eC:find(rU,1,true)then return 0 end end
local aE,W=bW.Name:lower(),0 local function ay(rV,rW)return rV:find(rW,1,true)~=nil end if ay(aE,"collect")then W=W+60 end
if ay(aE,"cash")or ay(aE,"money")then W=W+45 end if ay(aE,"income")or ay(aE,"claim")then W=W+35 end if ay(aE,"coin")or ay(aE,"earn")or ay(aE,"green")then W=W+20 end
if aE=="pad"or aE=="touch"then W=W+25 end if W==0 and(ay(eC,"collect")or ay(eC,"cash")or ay(eC,"money"))then W=25 end
if W==0 then return 0 end local cZ=bW.Color if cZ.G>0.5 and cZ.G>cZ.R*1.4 and cZ.G>cZ.B*1.4 then W=W+15 end if math.min(bW.Size.X,bW.Size.Y,bW.Size.Z)<2 then W=W+5 end
return W end local function rX()if a.padPart and a.padPart.Parent then return a.padPart end if not a.plot or r()-a.padSearchAt<20 then return nil end
a.padSearchAt=r()local eD,c0,hn={},nil,29 for u7,eE in ipairs(a.plot:GetDescendants())do if eE:IsA("BasePart")then
local eF=rT(eE)if eF>0 then eD[#eD+1]={s=eF,p=eE}if eF>hn then c0,hn=eE,eF end end end end table.sort(eD,function(rY,rZ)return rY.s>rZ.s end)
a.padCands,a.padPart=eD,c0 if c0 then q("collect pad: "..ds(c0).." (score "..hn..")")end return c0 end local ho="SAB_pad_v1.txt"
local function r0(r1)if type(writefile)=="function"then pcall(writefile,ho,table.concat({r1:GetComponents()},","))end
end local function r2()if type(isfile)~="function"or type(readfile)~="function"then return nil end local r3,mh=pcall(function()if isfile(ho)then return readfile(ho)end end)
if not r3 or type(mh)~="string"then return nil end local eG={}for r4 in mh:gmatch("[^,]+")do eG[#eG+1]=tonumber(r4)end
if#eG==12 then return CFrame.new(unpack(eG))end end local function r5(hp,eH,r6)local r7=f9(hp)local hq=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local az=(hq and hq:IsA("BasePart"))and(hq.Position-eH)or Vector3 .new(1,0,0)az=Vector3 .new(az.X,0,az.Z)if az.Magnitude<0.05 then az=Vector3 .new(1,0,0)end
az=az.Unit for r8=0,7 do local eI=r8*math.pi/4 local r9=Vector3 .new(az.X*math.cos(eI)-az.Z*math.sin(eI),0,az.X*math.sin(eI)+az.Z*math.cos(eI))
local eJ=eH+r9*(r6+5)local hr=jZ(eJ.X,eH.Y,eJ.Z)if hr and math.abs(hr.Y-eH.Y)<8 then co(hp,Vector3 .new(eJ.X,hr.Y+r7,eJ.Z))
if f_(hp,0.7)then return true end end end return false end local function r_()a.lastCollect=r()local c1=aH()if not c1 then return end
local mi,sa=c1 .HumanoidRootPart,f9(c1)local c2,mj,c3,hs=nil,4,nil,"?"local ht=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if a.manualPad and ht and ht:IsA("BasePart")then c2,hs=(ht.CFrame*a.manualPad).Position,"manual pad"else local aP=rX()
if aP then c2=Vector3 .new(aP.Position.X,aP.Position.Y+aP.Size.Y/2+sa,aP.Position.Z)mj,c3,hs=math.max(aP.Size.X,aP.Size.Z)/2,aP,aP.Name
end end if not c2 then q("COLLECT: pad not found - stand on it and tap SET PAD")return end local hu=aG()co(c1,c2)
if c3 and type(firetouchinterest)=="function"then pcall(firetouchinterest,mi,c3,0)end ah(e.PadDwell)if c3 and type(firetouchinterest)=="function"then pcall(firetouchinterest,mi,c3,1)end
ah(0.5)a.collected=a.collected+1 local hv=aG()q(("COLLECTED (%s) %s"):format(hs,(hu and hv and hv>hu)and("+$"..ao(hv-hu))or"no cash change seen"))
r5(c1,c2,mj)end local c4 local function mk()if a.capHit then if e.AutoStart and r()-(a.capAt or 0)>300 then a.capHit,a.placeFails=false,0
q("trying again after being stopped for 5 minutes")c4(true,true)else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end
if not aH()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aW(),nil,nil
if not a.plot then return nil,"own plot not found yet","wait"end end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local hw,ml=du()local eK=M()if eK then local bX=V(O(eK))if not aF(eK)then local hx=(F.gift and O(F.gift)==O(eK)and r()-F.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bX,hx),"bad"end if a.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bX,hx),"bad"end return"sell",("selling %s (%s)"):format(bX,hx),"warn"
end if hw<1 then return nil,("holding %s - 0 free stations"):format(bX),"wait"end if o.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(bX),"wait"end
return"place",("waxing %s (%d free)"):format(bX,hw),"ok"end a.holding=false if e.Crates and not d.waiting and r()-(d.scanAt or 0)>1 and r()>(d.quietUntil or 0)then
d.scanAt=r()local hy=a.plot:FindFirstChild("CrateStand")if hy then for u8,c5 in ipairs(hy:GetDescendants())do
if c5:IsA("ProximityPrompt")and c5 .Enabled and go(c5)then local aQ=c5 .ObjectText if aQ==""then aQ=bF(hy,"TitleLabel")or""end
if aQ~=""and A.wanted(aQ)then local sb=dq(aQ):gsub("crate$","")local mm for mn in pairs(K.members)do if dq(mn)==sb then mm=mn end end
d.waiting,d.at,d.title,d.prompt=true,r(),aQ,c5 d.data={name=(aQ:gsub("%s","")),rarity=mm,title=aQ}q(aQ.." found waiting on your stand")
end break end end end end local mo=A.wanted(d.data and d.data.name)or A.wanted(d.title)if e.Crates and(d.on or d.waiting)and mo then
local aR=d.title if r()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aR),"bad"
end if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=r()+120,0 q("could not press the "..aR.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aR),"bad"end if r()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aR),"bad"
end if d.byYou and r()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aR,math.ceil(60-(r()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aR),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(aR),"bad"end if r()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aR),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aR,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not mo then local mp=d.title..tostring(d.rolledAt)if d.told~=mp then d.told=mp q(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and r()-d.rolledAt<6 and A.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if hw<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(ml,ml),"wait"
end local hz=iV()if not hz then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c6=cm()
if c6 and kj(c6 .name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(c6 .name),"idle"end
if r()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c6 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(c6 .name),"ok"
end local a_=f7()if a_.state~="match"then a.matchSince=nil if a_.state=="skip"and not hz.Enabled then return nil,a_.text.." (sold out)","idle"end
return nil,a_.text,a_.level end if not hz.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local c7=r()if c7<a.noCashUntil then local mq,sc=jR()if mq then return nil,("cash short: have $%s, price ~$%s"):format(ao(mq),ao(sc)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ao(aG()),math.ceil(a.noCashUntil-c7)),"bad"end if c7-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
a.matchSince=a.matchSince or c7 local mr=c7-a.matchSince if mr<e.Confirm then return nil,("confirming %s (%.2fs)"):format(a_.shown,mr),"ok"end
return"buy",("buying %s via %s"):format(a_.shown,a_.src),"ok"end local function as(sd,se,...)if a.busy then return end
a.busy,a.busyText=true,sd local sf,ms=pcall(se,...)a.busy,a.busyText=false,""if not sf and ms~=ff then q("ERR "..tostring(ms))end
end local function sh()local bw,si,sj=mk()a.reason,a.level=si,sj if bw=="place"then as("waxing...",o.place)elseif bw=="crate"then as("opening crate...",eg,true)
elseif bw=="cratesmart"then as("opening crate...",d.smart)elseif bw=="cratewin"then as("opening the crate window...",gq)
elseif bw=="nocrate"then as("discarding crate...",eg,false)elseif bw=="sell"then as("selling...",me)elseif bw=="buy"then as("buying...",j_,false)
elseif e.Collect and not a.matchSince and r()-a.lastCollect>=e.Every then as("collecting money...",r_)end end
function c4(eL,sk)if eL==a.running then return end a.running=eL if not sk then e.AutoStart=eL end if eL then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=r()a.plot=aW()or a.plot
q("START")else a.reason="stopped"q("STOP")end end do local ba=dR(T.auto)if type(ba)=="string"then ba=ba:gsub("%s+$","")
if ba~=""then a.autoload=ba local sl=jF(ba)q(sl and("loaded config "..ba)or("config "..ba.." could not be loaded"))
end end end local f={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local sm={ok=f.good,wait=f.warn,warn=f.warn,bad=f.bad,idle=f.dim}local mt={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function D(sn,so,sp)local sq,hA=pcall(Instance.new,sn)
if not sq then a.uiErrs=a.uiErrs+1 return nil end for sr,ss in pairs(so)do if not pcall(function()hA[sr]=ss end)then a.uiErrs=a.uiErrs+1 end
end hA.Parent=sp return hA end local function ab(su,sv)D("UICorner",{CornerRadius=UDim.new(0,sv or 6)},su)end
local c={}local hB=C:FindFirstChildOfClass("PlayerGui")or C:WaitForChild("PlayerGui")local mu=hB:FindFirstChild("SABFarmGui")
if mu then mu:Destroy()end local hC=D("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},hB)
local aa={w=320,h=330,head=30,strip=38,tabs=26}c.root=D("Frame",{Name="Root",Size=UDim2 .new(0,aa.w,0,aa.h),Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),
BackgroundColor3=f.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},hC)ab(c.root,10)D("UIStroke",{Color=f.line,Thickness=1},c.root)
local aS=UDim2 .new(1,0,1,0)local function y(mv,mw)return UDim2 .new(mv,0,0,0),UDim2 .new(mw,(mv+mw>0.99)and 0 or-4,1,0)end
local function x(sw,sx,sy,sz,sA,sB)local mx=D("TextButton",{Text=sx,Position=sA,Size=sB,BackgroundColor3=sy,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=sz,TextColor3=f.text,AutoButtonColor=true},sw)ab(mx,6)return mx end local function eM(sC,sD,sE,sF,sG)
local hD=D("TextBox",{Text=sD,PlaceholderText=sE,Position=sF,Size=sG,BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=f.text,PlaceholderColor3=f.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},sC)ab(hD,6)D("UIPadding",{PaddingLeft=UDim.new(0,8)},hD)
return hD end local eN=aB.CurrentCamera local function sH()local sI,eO=pcall(function()return eN and eN.ViewportSize end)
if sI and eO and eO.X>50 and eO.Y>50 then return eO end end local function bc(c8)local hE=sH()if not(hE and c8 and c8 .Parent)then return end
local sJ=pcall(function()local eP,my=c8 .AbsolutePosition,c8 .AbsoluteSize local hF=70 local mz=math.clamp(eP.X,hF-my.X,hE.X-hF)
local mA=math.clamp(eP.Y,0,hE.Y-math.min(my.Y,hF))if math.abs(mz-eP.X)>0.5 or math.abs(mA-eP.Y)>0.5 then c8 .Position=UDim2 .new(0,math.floor(mz),0,math.floor(mA))
end end)return sJ end local function eQ(sK)local sL,hG=pcall(function()return sK.AbsolutePosition end)if sL and hG then return{math.floor(hG.X),math.floor(hG.Y)}end
end local eR={}local function mB(eS,mC,mD)L(eS.InputBegan:Connect(function(c9)if c9 .UserInputType~=Enum.UserInputType.MouseButton1 and c9 .UserInputType~=Enum.UserInputType.Touch then return end
eR[eS]={start=c9 .Position,from=mC.Position,moved=0,target=mC}local hH hH=c9 .Changed:Connect(function()if c9 .UserInputState==Enum.UserInputState.End then
local mE=eR[eS]eR[eS]=nil if hH then hH:Disconnect()end if mE and mD then mD(mE.moved)end end end)end))end L(nQ.InputChanged:Connect(function(eT)
if eT.UserInputType~=Enum.UserInputType.MouseMovement and eT.UserInputType~=Enum.UserInputType.Touch then return end
for u9,aT in pairs(eR)do local hI=aT.target if hI and hI.Parent then local mF,mG=eT.Position.X-aT.start.X,eT.Position.Y-aT.start.Y
aT.moved=math.max(aT.moved,math.abs(mF)+math.abs(mG))hI.Position=UDim2 .new(aT.from.X.Scale,aT.from.X.Offset+mF,aT.from.Y.Scale,aT.from.Y.Offset+mG)
end end end))local function E(sM,sN,sO,sP,sQ,sR,sS)return D("TextLabel",{Text=sN,Position=sR or UDim2 .new(0,0,0,0),Size=sS or aS,BackgroundTransparency=1,
Font=sQ and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=sO,TextColor3=sP,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},sM)
end c.title=D("Frame",{Size=UDim2 .new(1,0,0,aa.head),BackgroundColor3=f.panel,BorderSizePixel=0,Active=true},c.root)
c.dot=D("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=f.dim,BorderSizePixel=0},c.title)
ab(c.dot,5)E(c.title,"SAB  BUTTER FARM  "..bA,12,f.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))c.minB=x(c.title,"-",f.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
c.xB=x(c.title,"X",f.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))c.strip=D("Frame",{Position=UDim2 .new(0,0,0,aa.head),Size=UDim2 .new(1,0,0,aa.strip),BackgroundColor3=f.bg,BorderSizePixel=0},c.root)
c.bar=D("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=f.warn,BorderSizePixel=0},c.strip)
ab(c.bar,2)c.reason=E(c.strip,"starting",12,f.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))c.tabs=D("Frame",{Position=UDim2 .new(0,0,0,aa.head+aa.strip),Size=UDim2 .new(1,0,0,aa.tabs),BackgroundTransparency=1},c.root)
c.tabFarm=x(c.tabs,"FARM",f.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))c.tabBut=x(c.tabs,"BUTTERS",f.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabCrt=x(c.tabs,"CRATES",f.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabPet=x(c.tabs,"PETS",f.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabTeam=x(c.tabs,"TEAMS",f.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabSet=x(c.tabs,"SETUP",f.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function bY()local hJ=D("ScrollingFrame",{Position=UDim2 .new(0,0,0,aa.head+aa.strip+aa.tabs),Size=UDim2 .new(1,0,1,-(aa.head+aa.strip+aa.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=f.line,CanvasSize=UDim2 .new(0,0,0,100)},c.root)
D("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},hJ)D("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},hJ)
return hJ end c.farm,c.but,c.set,c.crt=bY(),bY(),bY(),bY()c.pet,c.team=bY(),bY()c.but.Visible,c.set.Visible,c.crt.Visible,c.pet.Visible,c.team.Visible=false,false,false,false,false
local eU,c_,z=0,12,nil local function am(mH,sT)eU,c_=eU+1,c_+mH+6 return D("Frame",{Size=UDim2 .new(1,0,0,mH),BackgroundTransparency=1,LayoutOrder=eU},sT or c.farm)
end local function da(sU)E(am(14),sU,10,f.dim,true)end z=am(34)c.startB=x(z,"START",f.good,14,y(0,0.68))c.killB=x(z,"KILL",f.bad,14,y(0.68,0.32))
local sV=am(42)local function db(mI,sW,hK)local hL=D("Frame",{Position=UDim2 .new((mI-1)/hK,0,0,0),Size=UDim2 .new(1/hK,mI<hK and-4 or 0,1,0),
BackgroundColor3=f.panel,BorderSizePixel=0},sV)ab(hL,6)local mJ=E(hL,"0",15,f.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local sX=E(hL,sW,9,f.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))mJ.TextXAlignment,sX.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return mJ end c.sBought,c.sPlaced,c.sSold,c.sColl,c.sFree=db(1,"BOUGHT",5),db(2,"WAXED",5),db(3,"SOLD",5),db(4,"MONEY",5),db(5,"FREE",5)
c.info=E(am(40),"",10,f.dim,false)c.tgt=E(am(26),"",10,f.good,false)da("MONEY COLLECT")z=am(28)c.secB=eM(z,tostring(e.Every),"60",y(0,0.2))
E(z,"sec",11,f.dim,false,y(0.21,0.09))c.secSet=x(z,"SET",f.accent,12,y(0.3,0.2))c.colT=x(z,"COLLECT: ON",f.accent,11,y(0.5,0.5))
z=am(26)c.padB=x(z,"SET PAD (stand on it)",f.panel2,10,y(0,0.55))c.padL=E(z,"",10,f.dim,false,y(0.56,0.44))da("BUTTERS YOU DID NOT TICK, AND CRATES")
z=am(28)c.sellT=x(z,"SELL THEM: ON",f.accent,11,y(0,0.55))c.sellB=x(z,"SELL NOW",f.warn,11,y(0.55,0.45))z=am(28)
c.crateT=x(z,"OPEN CRATES: ON",f.accent,11,y(0,0.55))c.crateB=x(z,"OPEN NOW",f.warn,11,y(0.55,0.45))da("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
z=am(28)c.arT=x(z,"AUTO ROLL: OFF",f.panel2,11,y(0,0.5))c.arL=E(z,"",9,f.dim,false,y(0.52,0.48))da("TOOLS")z=am(30)
c.buyB=x(z,"BUY",f.warn,10,y(0,0.5))c.plB=x(z,"WAX",f.good,10,y(0.5,0.5))da("LOG")c.log=D("TextLabel",{Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=f.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},am(84))ab(c.log,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},c.log)
c.farm.CanvasSize=UDim2 .new(0,0,0,c_)eU,c_=0,12 local function ac(sY)return am(sY,c.set)end local function dc(sZ)E(ac(14),sZ,10,f.dim,true)end
dc("SETTINGS FILE  (saved on your phone)")z=ac(28)c.cfgName=eM(z,"default","config name",y(0,0.5))c.cfgSave=x(z,"SAVE",f.good,11,y(0.5,0.25))
c.cfgLoad=x(z,"LOAD",f.accent,11,y(0.75,0.25))z=ac(26)c.cfgPrev=x(z,"<",f.panel2,11,y(0,0.13))c.cfgPick=x(z,"(none saved)",f.panel2,10,y(0.13,0.74))
c.cfgNext=x(z,">",f.panel2,11,y(0.87,0.13))z=ac(26)c.cfgAuto=x(z,"LOAD IT ON LAUNCH: OFF",f.panel2,10,y(0,1))
c.cfgMsg=E(ac(26),"",10,f.dim,false)dc("START BY ITSELF")z=ac(26)c.autoB=x(z,"INSTALL F.exec",f.accent,10,y(0,1))
c.autoMsg=E(ac(30),"",10,f.dim,false)z=ac(28)c.startT=x(z,"START FARMING ON LOAD: ON",f.accent,10,y(0,1))E(ac(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,f.dim,false)
dc("IF THE GAME DROPS ME")z=ac(28)c.rejT=x(z,"AUTO REJOIN: ON",f.accent,11,y(0,0.55))c.rejB=x(z,"REJOIN NOW",f.warn,11,y(0.55,0.45))
c.rejMsg=E(ac(30),"",10,f.dim,false)dc("SMOOTHER RUNNING  (for long / overnight runs)")z=ac(28)c.pfLite=x(z,"LITE MODE: OFF",f.panel2,10,y(0,0.5))
c.pfHud=x(z,"HIDE GAME HUD: OFF",f.panel2,10,y(0.5,0.5))z=ac(28)c.pfFps=x(z,"FPS CAP: GAME",f.panel2,10,y(0,0.5))
c.pfRender=x(z,"STOP 3D: OFF",f.panel2,10,y(0.5,0.5))z=ac(28)c.pfMem=eM(z,tostring(e.MemLimit),"2000",y(0,0.24))
E(z,"MB: rejoin this server above it (0 = never)",9,f.dim,false,y(0.26,0.52))c.pfMemSet=x(z,"SET",f.accent,11,y(0.8,0.2))
c.pfInfo=E(ac(18),"",10,f.text,false)E(ac(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,f.dim,false)
dc("THE ROUND SAB BUTTON")E(ac(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,f.dim,false)
c.set.CanvasSize=UDim2 .new(0,0,0,c_)local mK=D("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},hB)
c.tgRoot=D("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=f.accent,BorderSizePixel=0,Active=true},mK)ab(c.tgRoot,26)D("UIStroke",{Color=f.line,Thickness=1},c.tgRoot)
c.tgBtn=D("TextButton",{Text="SAB",Size=aS,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=f.text,AutoButtonColor=false},c.tgRoot)
c.tgDot=D("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=f.dim,BorderSizePixel=0},c.tgRoot)
ab(c.tgDot,4)local aU={built=false,boxes={},at=0}local function mL(mM,hM)e.Targets[mM]=hM or nil local hN=aU.boxes[mM]
if hN then hN.Text=hM and"X"or""hN.BackgroundColor3=hM and f.good or f.panel2 end end local function hO()for s0,mN in pairs(aU.boxes)do
local mO=e.Targets[s0]==true mN.Text=mO and"X"or""mN.BackgroundColor3=mO and f.good or f.panel2 end end local dd
local function s1()local s2=0 local hP=D("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},c.but)
c.butInfo=E(hP,"",10,f.dim,false,y(0,0.5))local s3=x(hP,"CLEAR",f.panel2,10,y(0.5,0.24))local s4=x(hP,"REFRESH",f.panel2,10,y(0.74,0.26))
s3 .MouseButton1Click:Connect(function()for s5 in pairs(e.Targets)do e.Targets[s5]=nil end hO()end)s4 .MouseButton1Click:Connect(function()
K.at=0 fR()dd(true)end)return s2 end dd=function(s6)if not fR()then if not c.butEmpty then c.butEmpty=E(D("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},c.but),
"butter list not loaded yet - open this tab again in a moment",11,f.warn,false)end return end if aU.built and not s6 and aU.at==K.at then return end
for u_,hQ in ipairs(c.but:GetChildren())do if hQ:IsA("Frame")or hQ:IsA("TextButton")then hQ:Destroy()end end aU.boxes,c.butEmpty={},nil
s1()local hR,hS=36,1 local function mP(mQ)hS=hS+1 local s7=D("Frame",{Size=UDim2 .new(1,0,0,mQ),BackgroundTransparency=1,LayoutOrder=hS},c.but)
hR=hR+mQ+6 return s7 end for va,eV in ipairs(K.rarOrder)do local s8=mP(24)local s9=mt[eV]or f.text local hT=D("Frame",{Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0},s8)
ab(hT,6)E(hT,"  "..eV:upper(),11,s9,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local s_=x(hT,"ALL",f.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local ta=eV s_.MouseButton1Click:Connect(function()local mR=K.members[ta]or{}local mS=false for vb,tb in ipairs(mR)do if not e.Targets[tb]then mS=true break end end
for vc,tc in ipairs(mR)do mL(tc,mS)end end)for vd,hU in ipairs(K.members[eV]or{})do local td=mP(22)local eW=D("TextButton",{Text="",Size=aS,BackgroundColor3=f.bg,BorderSizePixel=0,
AutoButtonColor=true},td)ab(eW,5)E(eW,"   "..V(hU),11,f.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local hV=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=f.text,AutoButtonColor=false},eW)ab(hV,4)aU.boxes[hU]=hV local mT=hU local function mU()mL(mT,not e.Targets[mT])end
eW.MouseButton1Click:Connect(mU)hV.MouseButton1Click:Connect(mU)end end hO()c.but.CanvasSize=UDim2 .new(0,0,0,hR+10)
aU.built,aU.at=true,K.at end function A.paint()for te,mV in pairs(A.boxes)do local mW=e.CrateTicks[te]==true mV.Text=mW and"X"or""
mV.BackgroundColor3=mW and f.good or f.panel2 end if c.crtInfo then local hW,hX=0,0 for ve in pairs(A.boxes)do hW=hW+1 end
for vf,tf in pairs(e.CrateTicks)do if tf then hX=hX+1 end end c.crtInfo.Text=("%d crates, %d ticked"):format(hW,hX)
end if c.crtAll then c.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"c.crtAll.BackgroundColor3=e.Crates and f.accent or f.panel2
end end function A.build()for vg,hY in ipairs(c.crt:GetChildren())do if hY:IsA("Frame")or hY:IsA("TextButton")then hY:Destroy()end
end A.boxes={}local hZ,h0=12,0 local function eX(mX)h0=h0+1 hZ=hZ+mX+6 return D("Frame",{Size=UDim2 .new(1,0,0,mX),BackgroundTransparency=1,LayoutOrder=h0},c.crt)
end local h1=eX(28)c.crtInfo=E(h1,"",10,f.dim,false,y(0,0.5))local tg=x(h1,"CLEAR",f.panel2,10,y(0.5,0.24))local th=x(h1,"REFRESH",f.panel2,10,y(0.74,0.26))
L(tg.MouseButton1Click:Connect(function()e.CrateTicks={}A.paint()end))L(th.MouseButton1Click:Connect(function()A.build()end))
c.crtAll=x(eX(28),"",f.accent,11,y(0,1))L(c.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates A.paint()end))
E(eX(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,f.dim,false)
for vh,aV in ipairs(A.list())do local ti=eX(24)local de=D("TextButton",{Text="",Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0,AutoButtonColor=true},ti)
ab(de,5)E(de,"  "..(aV.title or aV.name)..(aV.guess and"  (?)"or""),11,mt[aV.rar or""]or f.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
E(de,aV.price and("$"..ao(aV.price))or(aV.rar or""),9,f.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local h2=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=f.text,AutoButtonColor=false},de)ab(h2,4)A.boxes[aV.k]=h2 local mY=aV.k local function mZ()e.CrateTicks[mY]=(not e.CrateTicks[mY])or nil
A.paint()end L(de.MouseButton1Click:Connect(mZ))L(h2 .MouseButton1Click:Connect(mZ))end c.crt.CanvasSize=UDim2 .new(0,0,0,hZ+10)
A.built=A.at A.paint()end local m0="farm"local function bd(ad)m0=ad c.farm.Visible,c.but.Visible,c.set.Visible=(ad=="farm"),(ad=="but"),(ad=="set")
c.crt.Visible=(ad=="crt")c.pet.Visible,c.team.Visible=(ad=="pet"),(ad=="team")c.tabCrt.BackgroundColor3=(ad=="crt")and f.accent or f.panel2
c.tabPet.BackgroundColor3=(ad=="pet")and f.accent or f.panel2 c.tabTeam.BackgroundColor3=(ad=="team")and f.accent or f.panel2
if ad=="pet"and not j.built then pcall(j.build)end if ad=="team"and not o.built then pcall(o.build)end if ad=="crt"and(A.built~=A.at or not next(A.boxes))then A.build()end
c.tabFarm.BackgroundColor3=(ad=="farm")and f.accent or f.panel2 c.tabBut.BackgroundColor3=(ad=="but")and f.accent or f.panel2
c.tabSet.BackgroundColor3=(ad=="set")and f.accent or f.panel2 if ad=="but"then dd(false)end end local function N(m1,m2,tj,tk)
m1 .Text=m2 and tj or tk m1 .BackgroundColor3=m2 and f.accent or f.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(m3)
local df=j.rows and j.rows[m3]if not df then return end local eY=e.Pets[m3]or{}df.b.BackgroundColor3=eY.b and f.good or f.panel2
df.g.BackgroundColor3=eY.g and f.accent or f.panel2 df.g.Text=eY.g and"BIG"or"ANY"df.w.BackgroundColor3=eY.w and f.warn or f.panel2
end function j.flag(h3,h4)local bx=e.Pets[h3]or{}if bx[h4]then bx[h4]=nil else bx[h4]=true end e.Pets[h3]=(bx.b or bx.g or bx.w)and bx or nil
j.paintRow(h3)end function j.paintAll()for tl in pairs(j.rows or{})do j.paintRow(tl)end if c.pbT then N(c.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(c.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")end end function j.live()if not j.built then j.build()return end
if r()-(j.liveAt or 0)<1 then return end j.liveAt=r()local m4=j.wishes()for h5,tm in pairs(j.rows)do tm.name.Text=j.nice(h5)..(m4[h5]and("   * wish %dm"):format(math.ceil(m4[h5]/60))or"")
end local eZ=j.data()local m5=tonumber(C:GetAttribute("PetWishCredits"))or 0 c.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eZ and#(eZ.pets or{})or 0,eZ and tonumber(eZ.maxOwned)or 60,
ao(j.money()),m5>0 and(" | free wishes "..m5)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local e0=j.info()for vi,h6 in ipairs(c.pet:GetChildren())do if h6:IsA("Frame")or h6:IsA("TextLabel")then h6:Destroy()end
end j.rows={}local h7,e1=0,12 local function bZ(m6)h7,e1=h7+1,e1+m6+6 return D("Frame",{Size=UDim2 .new(1,0,0,m6),BackgroundTransparency=1,LayoutOrder=h7},c.pet)
end local m7=bZ(28)c.pbT=x(m7,"AUTO ADOPT: OFF",f.panel2,10,y(0,0.5))c.pwT=x(m7,"AUTO WISH: OFF",f.panel2,10,y(0.5,0.5))
c.pbT.MouseButton1Click:Connect(function()e.PetBuy=not e.PetBuy j.paintAll()end)c.pwT.MouseButton1Click:Connect(function()e.PetWish=not e.PetWish j.paintAll()end)
c.pInfo=E(bZ(44),"",10,f.dim,false)E(bZ(40),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (costs 2x its price, 20 min, one per pet per server).",9,f.dim,false)
if not e0 then E(bZ(30),"pet list not loaded yet - open this tab again in a moment",11,f.warn,false)c.pet.CanvasSize=UDim2 .new(0,0,0,e1)
j.built=false return end local b0={}for vj,m8 in ipairs(j.order())do local h8=e0 .Pets[m8].rarity or"?"b0[h8]=b0[h8]or{}
table.insert(b0[h8],m8)end local b1={}for vk,m9 in ipairs(e0 .Rarities or{})do if b0[m9]then b1[#b1+1]=m9 end end
for m_ in pairs(b0)do if not table.find(b1,m_)then b1[#b1+1]=m_ end end for vl,e2 in ipairs(b1)do local na=D("Frame",{Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0},bZ(22))
ab(na,6)E(na,"  "..e2:upper(),11,j.RC[e2]or f.text,true)for vm,e3 in ipairs(b0[e2])do local b2=D("Frame",{Size=aS,BackgroundColor3=f.bg,BorderSizePixel=0},bZ(38))
ab(b2,5)local tn=E(b2,j.nice(e3),11,j.RC[e2]or f.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-122,0,17))local to,tp=pcall(function()return e0 .describe(e3)end)
E(b2,to and tostring(tp)or"",9,f.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-122,0,17))local nb=x(b2,"BUY",f.panel2,9,UDim2 .new(1,-114,0.5,-11),UDim2 .new(0,34,0,22))
local nc=x(b2,"ANY",f.panel2,9,UDim2 .new(1,-77,0.5,-11),UDim2 .new(0,34,0,22))local nd=x(b2,"WISH",f.panel2,9,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,36,0,22))
local h9=e3 nb.MouseButton1Click:Connect(function()j.flag(h9,"b")end)nc.MouseButton1Click:Connect(function()j.flag(h9,"g")end)
nd.MouseButton1Click:Connect(function()j.flag(h9,"w")end)j.rows[e3]={b=nb,g=nc,w=nd,name=tn}end end c.pet.CanvasSize=UDim2 .new(0,0,0,e1+10)
j.built=true j.paintAll()end function l.paint()N(c.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")N(c.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")
N(c.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")N(c.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not c.pfMem:IsFocused()then c.pfMem.Text=tostring(e.MemLimit)end end function l.applyAll()if e.Lite then l.lite(true)end
if e.HideHud then l.hideHud(true)end if e.NoRender then l.render(true)end if(e.FpsCap or 0)~=0 then l.cap(e.FpsCap)end
l.paint()end L(c.pfLite.MouseButton1Click:Connect(function()l.lite(not e.Lite)l.paint()end))L(c.pfHud.MouseButton1Click:Connect(function()l.hideHud(not e.HideHud)l.paint()end))
L(c.pfRender.MouseButton1Click:Connect(function()l.render(not e.NoRender)l.paint()end))L(c.pfFps.MouseButton1Click:Connect(function()
local tq=table.find(l.CAPS,e.FpsCap or 0)or 1 local ne=l.CAPS[(tq%#l.CAPS)+1]if not l.cap(ne)and ne~=0 then q("this executor cannot cap fps")end
l.paint()end))L(c.pfMemSet.MouseButton1Click:Connect(function()local h_=tonumber(c.pfMem.Text)if h_ and h_>=0 then e.MemLimit=math.floor(h_)end
l.paint()end))function o.names()local ia={"(none)"}for vn,tr in ipairs((o.teams()))do ia[#ia+1]=tr.name end return ia
end function o.cycle(ib,ts)local e4=o.names()local tt=e[ib]~=""and e[ib]or"(none)"local e5=table.find(e4,tt)or 1
e5=((e5-1+ts)%#e4)+1 e[ib]=e4[e5]=="(none)"and""or e4[e5]o.paint()end function o.paint()if not o.built then return end
N(c.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")local ic={}for vo,tu in ipairs((o.teams()))do ic[tu.name]=true end
for tv,nf in pairs(o.pick)do local b3=e[tv]nf.Text=b3==""and"(none)"or(ic[b3]and b3 or(b3 .." (missing)"))nf.TextColor3=(b3~=""and not ic[b3])and f.bad or f.text
end if not c.tmLead:IsFocused()then c.tmLead.Text=tostring(e.GlazeLead)end c.tmInfo.Text=(o.msg or"")..("\nswitches %d | waxes finished %d | glazed %d"):format(o.switches,o.finished,o.glazed)
local tw,e6=j.srv(),{}for vp,e7 in ipairs(o.list or{})do e6[#e6+1]=("st %-2s %-22s %9s  helps %d"):format(e7 .st.Name,V(O(e7 .name)):sub(1,22),o.clock(e7 .ends-tw),e7 .helps)
end c.tmList.Text=#e6>0 and table.concat(e6,"\n")or"no waxes running"end function o.build()for vq,ie in ipairs(c.team:GetChildren())do
if ie:IsA("Frame")or ie:IsA("TextLabel")then ie:Destroy()end end o.pick={}local ig,ih=0,12 local function by(ng)
ig,ih=ig+1,ih+ng+6 return D("Frame",{Size=UDim2 .new(1,0,0,ng),BackgroundTransparency=1,LayoutOrder=ig},c.team)
end local function dg(tx)E(by(14),tx,10,f.dim,true)end local function e8(e9)local ii=by(26)local ty=x(ii,"<",f.panel2,11,y(0,0.14))
local nh=x(ii,"(none)",f.panel,10,y(0.14,0.72))local tz=x(ii,">",f.panel2,11,y(0.86,0.14))ty.MouseButton1Click:Connect(function()o.cycle(e9,-1)end)
tz.MouseButton1Click:Connect(function()o.cycle(e9,1)end)nh.MouseButton1Click:Connect(function()o.cycle(e9,1)end)
o.pick[e9]=nh end c.tmT=x(by(28),"AUTO TEAMS: OFF",f.panel2,11,y(0,1))c.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=o.current()end o.paint()end)c.tmInfo=E(by(30),"",10,f.dim,false)
dg("NORMAL TEAM  (worn the rest of the time)")e8("TeamNormal")dg("FULL TEAM  (worn while every station is busy)")
e8("TeamFull")dg("GLAZE TEAM  (worn just before a wax finishes)")e8("TeamGlaze")local ij=by(26)c.tmLead=eM(ij,tostring(e.GlazeLead),"45",y(0,0.2))
E(ij,"sec before it finishes",10,f.dim,false,y(0.22,0.5))local tA=x(ij,"SET",f.accent,11,y(0.75,0.25))tA.MouseButton1Click:Connect(function()
local e_=tonumber(c.tmLead.Text)if e_ and e_>=5 and e_<=600 then e.GlazeLead=math.floor(e_)else c.tmLead.Text=tostring(e.GlazeLead)end
o.paint()end)dg("WAX TEAM  (worn while a butter is placed)")e8("TeamWax")dg("YOUR WAXES  (time left, helps)")
c.tmList=D("TextLabel",{Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=f.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},by(150))ab(c.tmList,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},c.tmList)
E(by(92),"Teams are the loadouts you saved in the game's Teams page. A wax's time is fixed when it is placed and its glaze is rolled when it finishes, so the WAX team only needs to be on while placing and the GLAZE team only at the finish. While every station is busy only wax-stir pets (Seal, Koala) still help, so the FULL team can be money + stir. A help never leaves a wax under 60 s, so 45 s is enough. While AUTO TEAMS is on it keeps putting the right team back.",9,f.dim,false)
c.team.CanvasSize=UDim2 .new(0,0,0,ih+10)o.built=true o.paint()end local function tB()c.secB.Text=tostring(e.Every)
N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then c4(e.AutoStart,true)end if a.winPos then c.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then c.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end bc(c.root)bc(c.tgRoot)a.lastCollect=r()
hO()A.paint()pcall(j.paintAll)pcall(o.paint)pcall(l.applyAll)end local function tC(ni)task.spawn(function()ni.TextColor3=f.bad
task.wait(0.8)if a.alive then ni.TextColor3=f.text end end)end local function nj()local nk=c.secB.Text:match("^%s*(%d+)%s*$")
local dh=nk and tonumber(nk)if not dh or dh<1 then c.secB.Text=tostring(e.Every)tC(c.secB)q("interval must be a whole number >= 1")
return end if dh==e.Every then return end e.Every,a.lastCollect=dh,r()q("collect every "..dh.."s")end local function H(tD,tE)L(tD.MouseButton1Click:Connect(tE))end
H(c.secSet,nj)L(c.secB.FocusLost:Connect(nj))H(c.colT,function()e.Collect,a.lastCollect=not e.Collect,r()N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)H(c.sellT,function()e.SellJunk=not e.SellJunk N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)H(c.sellB,function()
a.sellFails=0 task.spawn(as,"selling...",me)end)H(c.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(u.apply,"you asked",true)
end)H(c.crateT,function()e.Crates=not e.Crates N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)H(c.crateB,function()
d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(as,"opening crate...",eg,true)end)H(c.padB,function()
a.plot=aW()or a.plot local nl,ik=aH(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(nl and ik and ik:IsA("BasePart"))then q("SET PAD: need character and plot")return end
a.manualPad=ik.CFrame:ToObjectSpace(nl.HumanoidRootPart.CFrame)r0(a.manualPad)q("collect pad saved at your position")
end)H(c.startB,function()c4(not a.running)end)H(c.buyB,function()a.plot=aW()or a.plot task.spawn(as,"buying (manual)...",j_,true)
end)H(c.plB,function()a.plot=aW()or a.plot task.spawn(as,"waxing (manual)...",ke)end)H(c.tabFarm,function()bd("farm")end)
H(c.tabBut,function()bd("but")end)H(c.tabSet,function()bd("set")end)H(c.tabCrt,function()bd("crt")end)H(c.tabPet,function()bd("pet")end)
H(c.tabTeam,function()bd("team")end)local function nm(il)a.hidden=il c.root.Visible=not il c.tgBtn.Text=il and"SAB+"or"SAB"
end mB(c.tgRoot,c.tgRoot,function(tF)bc(c.tgRoot)a.togPos=eQ(c.tgRoot)or a.togPos if tF<8 then nm(not a.hidden)end
end)H(c.tgBtn,function()nm(not a.hidden)end)local an,af={},0 local function be()an=jw()if#an==0 then c.cfgPick.Text="(none saved)"
af=0 return end if af<1 or af>#an then af=1 end c.cfgPick.Text=an[af]..("  (%d/%d)"):format(af,#an)end local function nn()
local no=a.autoload~=nil c.cfgAuto.Text=no and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"c.cfgAuto.BackgroundColor3=no and f.accent or f.panel2
end local function im()local np=c.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if np~=""then return np end return(af>0 and an[af])or""
end H(c.cfgSave,function()a.winPos=eQ(c.root)or a.winPos a.togPos=eQ(c.tgRoot)or a.togPos local nq,nr=dW(im())
c.cfgMsg.Text=nq and("saved as "..nr)or("could not save: "..nr)c.cfgMsg.TextColor3=nq and f.good or f.bad be()
q(c.cfgMsg.Text)end)local function tG(io)local ip,ns=jF(io)c.cfgMsg.Text=ip and("loaded "..ns)or("could not load: "..ns)
c.cfgMsg.TextColor3=ip and f.good or f.bad if ip then c.cfgName.Text=io tB()task.spawn(u.apply,"config "..io)
end q(c.cfgMsg.Text)end H(c.cfgLoad,function()tG(im())end)H(c.cfgPick,function()be()if af>0 then c.cfgName.Text=an[af]end
end)H(c.cfgPrev,function()if#an==0 then be()return end af=(af-2)%#an+1 be()c.cfgName.Text=an[af]end)H(c.cfgNext,function()
if#an==0 then be()return end af=af%#an+1 be()c.cfgName.Text=an[af]end)H(c.cfgAuto,function()if a.autoload then
jH(nil)c.cfgMsg.Text="it will not load a config on launch"else local di=im()local nt=false for vr,tH in ipairs(jw())do if tH==di then nt=true end end
local tI=nt or dW(di)if tI and di~=""then jH(di)be()c.cfgMsg.Text=di.." will load every time the script starts"
else c.cfgMsg.Text="name the config and save it first"end end c.cfgMsg.TextColor3=f.dim nn()end)H(c.autoB,function()
local nu,nv=pm()c.autoMsg.Text=nu and("installed. "..nv)or("failed: "..nv)c.autoMsg.TextColor3=nu and f.good or f.bad
q(c.autoMsg.Text)end)H(c.startT,function()e.AutoStart=not e.AutoStart N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)H(c.rejT,function()e.Rejoin=not e.Rejoin N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)H(c.rejB,function()cl("you asked")end)
local bz=false H(c.minB,function()bz=not bz c.tabs.Visible=not bz if bz then c.farm.Visible,c.but.Visible,c.set.Visible,c.crt.Visible=false,false,false,false
c.pet.Visible,c.team.Visible=false,false else bd(m0)end c.root.Size=UDim2 .new(0,aa.w,0,bz and(aa.head+aa.strip)or aa.h)
c.minB.Text=bz and"+"or"-"end)local function fa()if not a.alive then return end a.alive,a.running=false,false
pcall(l.restoreAll)pcall(dx)for vs,tJ in ipairs(fg)do pcall(function()tJ:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()hC:Destroy()end)pcall(function()mK:Destroy()end)if bB.SAB_KILL==fa then bB.SAB_KILL=nil end end
bB.SAB_KILL=fa H(c.killB,fa)H(c.xB,fa)mB(c.title,c.root,function()bc(c.root)a.winPos=eQ(c.root)or a.winPos end)
local function nw()local dj,dk=a.reason,a.level if a.busy then dj,dk=a.busyText,"ok"elseif not a.running then
local vt,nx,tK=mk()if a.capHit then dj,dk=nx,"bad"else dj,dk="[stopped] "..nx,(tK=="bad")and"bad"or"idle"end a.reason,a.level=dj,dk
end c.reason.Text=dj c.bar.BackgroundColor3=sm[dk]or f.dim c.dot.BackgroundColor3=a.running and f.good or(a.capHit and f.bad or f.dim)
c.tgDot.BackgroundColor3=c.dot.BackgroundColor3 c.tgRoot.BackgroundColor3=a.hidden and f.panel2 or f.accent c.startB.Text=a.running and"STOP"or"START"
N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")c.startB.BackgroundColor3=a.running and f.warn or f.good
local tL,tM=du()c.sBought.Text,c.sPlaced.Text,c.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
c.sColl.Text,c.sFree.Text=tostring(a.collected),tL.."/"..tM local ny=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(r()-a.lastCollect)))or nil
local nz=M()c.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ao(aG()),a.rolls,a.gifts,a.crates,nz and V(O(nz))or"nothing",d.on and("   ["..d.title.." window open]")or"",ny and("in "..ny.."s")or"off")
local b4=oX()c.tgt.Text=(#b4==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#b4<=3)and table.concat(b4,", ")or(#b4 .." butters ticked")))
c.tgt.TextColor3=(#b4==0)and f.bad or f.good c.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
c.log.Text=table.concat(dn,"\n")if c.butInfo then c.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(K.n,#K.rarOrder,#b4)
end if c.but.Visible and aU.at~=K.at then dd(false)end if c.crt.Visible then if A.built~=A.at then A.build()else A.paint()end
end if c.pet.Visible then j.live()end if c.set.Visible then c.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(l.fps+0.5),l.mem,l.memPeak)
end if c.team.Visible then o.paint()end N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local nA=(u.rec.on and"on"or"")..(u.rec.off and((u.rec.on and"/"or"").."off")or"")c.arL.Text=u.msg~=""and u.msg or("game: %s | learned: %s%s"):format(u.isOn()and"ON"or"off",
nA~=""and nA or"nothing yet",#u.rec.rules>0 and", choices"or"")c.arL.TextColor3=u.msg~=""and f.warn or f.dim end
bB.SAB={S=a,CFG=e,EV=F,U=c,sg=hC,CAT=K,LEARN=Q,buildList=dd,logAll=b5,evAll=b6,AR=u,CR=A,PF=l,PX=j,TM=o,CRATE=d}
q(bA.." loaded")if a.uiErrs>0 then q("UI: "..a.uiErrs.." properties skipped")end bd("farm")bc(c.root)bc(c.tgRoot)
if eN then pcall(function()L(eN:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bc(c.root)
bc(c.tgRoot)end))end)end be()nn()if a.config and a.config~=""then c.cfgName.Text=a.config end N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
c.secB.Text=tostring(e.Every)pcall(l.applyAll)pcall(nw)task.spawn(function()local nB=pk()c.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(nB and("\n(backup: "..nB..")")or"")
local nC=dR(T.exec)if nC and not nC:find("SAB autoloader v2",1,true)then ci(T.exec,T.stub)q("autoexec updated: it now loads the newest version from GitHub")
end c.autoMsg.Text=(dR(T.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(ps)end)task.spawn(function()while a.alive do local tN,tO=pcall(nw)if not tN then q("UI ERR "..tostring(tO))end
task.wait((a.hidden or bz)and 1.5 or 0.25)end end)task.spawn(function()local tP,tQ=pcall(pB)if not tP then q("HOOK ERR "..tostring(tQ))end
end)task.spawn(function()pcall(oh)if d.loadSeq and not d.learned then local fb={}for nD=1,20 do if d.loadSeq[nD]then fb[#fb+1]=d.loadSeq[nD]end end
if#fb>0 then d.learned={seq=fb,mode=d.loadMode}q("remembered how to open crates directly")end end if fR()then q(("catalog: %d butters in %d rarities"):format(K.n,#K.rarOrder))end
local tR,nE=pcall(r2)if tR and nE and a.alive and not a.manualPad then a.manualPad=nE end end)task.spawn(function()
while a.alive do local iq,ir=pcall(j.buyTick)if not iq then q("PET ERR "..tostring(ir))task.wait(5)end iq,ir=pcall(j.wishTick)
if not iq then q("WISH ERR "..tostring(ir))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local fc,nF=0,r()
L(game:GetService("RunService").Heartbeat:Connect(function()fc=fc+1 end))l.noteAt=r()while a.alive do task.wait(1)
local nG=r()l.fps,fc,nF=fc/math.max(nG-nF,0.001),0,nG local tS,tT=pcall(l.tick)if not tS then q("PERF ERR "..tostring(tT))task.wait(5)end
end end)task.spawn(function()while a.alive do local tU,tV=pcall(o.tick)if not tU then q("TEAM ERR "..tostring(tV))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()while a.alive do task.wait(20)pcall(dx)end end)pcall(u.watchCache)
if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then pcall(function()local tX=(type(newcclosure)=="function")and newcclosure or function(tW)return tW end
local is local nH=(type(setnamecallmethod)=="function")and setnamecallmethod or nil is=hookmetamethod(game,"__namecall",tX(function(nI,...)
local dl=getnamecallmethod()if a.alive and(dl=="InvokeServer"or dl=="FireServer")then local nJ,nK=pcall(function()return nI.Name end)
if nJ and nK=="CrateAction"and not d.replaying then pcall(d.saw,dl,...)elseif nJ and nK=="AutoRollAction"and not u.replaying then pcall(u.saw,dl,...)end
if nH then nH(dl)end end return is(nI,...)end))d.oldNC=is end)end if fe then L(C.Idled:Connect(function()pcall(function()fe:CaptureController()fe:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for vu=1,90 do if not a.alive then return end if C:GetAttribute("AutoRollOn")~=nil and aH()and(a.plot or aW())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then u.apply("joined")end while a.alive do task.wait(30)if a.alive and e.AutoRoll and a.running and not u.isOn()and not cm()and not M()
and not d.waiting and not d.on and not a.busy then u.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for vv=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or aW()if aH()and a.plot and next(e.Targets)then c4(true,true)q("started by itself")
return end task.wait(1)end if a.alive and not a.running then q("gave up waiting to start - tap START")end end)
task.spawn(function()a.plot=aW()a.lastCollect=r()while a.alive do if a.running then local tY,nL=pcall(sh)if not tY and nL~=ff then q("LOOP ERR "..tostring(nL))end
end task.wait(0.1)end end)fd("loaded - window is at the top left")end local t0,it=xpcall(nP,function(tZ)return tostring(tZ).."\n"..debug.traceback()end)
if not t0 then pcall(function()warn("SAB "..bA.." ERROR: "..tostring(it))end)fd("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bA.." ERROR: "..tostring(it))end)pcall(function()local nM=(type(getgenv)=="function"and getgenv())or _G
if type(nM.SAB_KILL)=="function"then nM.SAB_KILL()end for vw,t1 in ipairs({"SABFarmGui","SABToggle"})do local nN=C.PlayerGui:FindFirstChild(t1)
if nN then nN:Destroy()end end end)pcall(function()local dm=Instance.new("ScreenGui")dm.Name="SABError"dm.ResetOnSpawn=false
dm.DisplayOrder=1000 local aA=Instance.new("TextBox")aA.Size=UDim2 .new(0,340,0,170)aA.Position=UDim2 .new(0,10,0,50)
aA.BackgroundColor3=Color3 .fromRGB(90,20,20)aA.TextColor3=Color3 .new(1,1,1)aA.TextSize=11 aA.TextWrapped=true
aA.ClearTextOnFocus=false aA.TextXAlignment=Enum.TextXAlignment.Left aA.TextYAlignment=Enum.TextYAlignment.Top
aA.Text="SAB "..bA.." failed to start. Send this text:\n"..tostring(it)aA.Parent=dm dm.Parent=C:WaitForChild("PlayerGui")
end)end
