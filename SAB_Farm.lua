local bA="v25"local ip=game:GetService("Players")local C=ip.LocalPlayer or ip.PlayerAdded:Wait()local function e8(nH)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bA,Text=nH,Duration=6})
end)end e8("script started")local function nI()local au=game:GetService("ReplicatedStorage")local aB=game:GetService("Workspace")
local nJ=game:GetService("UserInputService")local bB=(type(getgenv)=="function"and getgenv())or _G if type(bB.SAB_KILL)=="function"then pcall(bB.SAB_KILL)end
local q=(type(tick)=="function")and tick or os.clock local e9=(function()local nK,nL=pcall(function()return game:GetService("VirtualUser")end)return nK and nL or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},Teams=false,TeamNormal="",TeamGlaze="",TeamWax="",GlazeLead=45,Lite=false,HideHud=false,NoRender=false,FpsCap=0,
MemLimit=2000,}local a={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=q(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local F={name=nil,rar=nil,at=q(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local u={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local d={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local j,r,l={},{},{}local e_={}local fa,dk,b5,b6={},{},{},{}local function L(iq)fa[#fa+1]=iq return iq end local function ao(nM)
task.wait(nM)if not a.alive then error(e_,0)end end local function o(dl)dl=os.date("%H:%M:%S").." "..tostring(dl)
table.insert(dk,1,dl)if#dk>6 then table.remove(dk)end b5[#b5+1]=dl if#b5>80 then table.remove(b5,1)end end local function dm(ir)
if type(ir)~="string"then return""end return(ir:lower():gsub("[^%w]",""))end local function N(nN)local is=dm(nN)
local fb=is:gsub("butter$","")if fb==""then fb=is end return fb end local function aV(fc)return type(fc)=="string"and N(fc)~=""and e.Targets[N(fc)]==true end
local function nO(b7)b7=b7:lower()return b7:find("squishy",1,true)~=nil or b7:match("butter$")~=nil or b7:match("butter[^%a]")~=nil
end local fd={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ap(b8)if type(b8)~="number"then return"?"end
local dn=1 while math.abs(b8)>=1000 and dn<#fd do b8=b8/1000 dn=dn+1 end local nP=string.format("%.2f",b8):gsub("%.?0+$","")
return nP..fd[dn]end local function nQ(it)if type(it)~="string"then return nil end local nR,iu=it:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local fe=tonumber(nR)if not fe then return nil end if iu==""then return fe end for nS,nT in ipairs(fd)do if nT:lower()==iu:lower()then return fe*1000^(nS-1)end end
return nil end local function aF()local iv=C:GetAttribute("BoardValueMoney")if type(iv)=="number"then return iv end
local iw=C:FindFirstChild("leaderstats")if iw then for tM,nU in ipairs({"Cash","Money","Coins"})do local ff=iw:FindFirstChild(nU)
if ff and type(ff.Value)=="number"then return ff.Value end end end end local function dp(nV)local fg=nV:GetFullName()
if a.plot then local fh=a.plot:GetFullName()if fg:sub(1,#fh)==fh then return fg:sub(#fh+2)end end return fg end
local function aG()local dq=C.Character if dq and dq:FindFirstChild("HumanoidRootPart")then local ix=dq:FindFirstChildOfClass("Humanoid")
if ix and ix.Health>0 then return dq end end end local function aW()local fi=aB:FindFirstChild("Plots")if not fi then return nil end
local function iy(nW)local iz=nW:FindFirstChild("Plate")return iz~=nil and iz:FindFirstChild("EditStackAttachment",true)~=nil
end local iA=C:GetAttribute("PlotNumber")if iA~=nil then local fj=fi:FindFirstChild(tostring(iA))if fj and iy(fj)then return fj end
end for tN,iB in ipairs(fi:GetChildren())do if iy(iB)then return iB end end end local function b9(iC)local aX=iC and iC.Parent
for tO=1,6 do if not aX then return nil end if aX:IsA("BasePart")then return aX end if aX:IsA("Model")then return aX.PrimaryPart or aX:FindFirstChildWhichIsA("BasePart",true)end
aX=aX.Parent end end local function iD(iE)local fk=iE.Parent if fk and fk:IsA("Attachment")then return fk.WorldPosition end
local iF=b9(iE)return iF and iF.Position end local function nX()local bC=a.plot and a.plot:FindFirstChild("Plate")
if not bC then return nil end if bC:IsA("BasePart")then return bC.Position end if bC:IsA("Model")then return bC:GetPivot().Position end
local iG=bC:FindFirstChildWhichIsA("BasePart",true)return iG and iG.Position end local function iH()local fl={}
local iI=a.plot and a.plot:FindFirstChild("WaxStations")if iI then for tP,nY in ipairs(iI:GetChildren())do local iJ=nY:FindFirstChild("SquishyPlaceHolder")
local fm=iJ and iJ:FindFirstChild("PlacePrompt")if fm and fm:IsA("ProximityPrompt")then fl[#fl+1]=fm end end end
return fl end local function iK()local iL,fn=iH(),0 for tQ,nZ in ipairs(iL)do if nZ.Enabled then fn=fn+1 end end
local fo=#iL local fp=C:GetAttribute("WaxStations")if type(fp)=="number"and fp>fo then fo=fp end return fn,fo
end local function n0()local iM=aG()local iN=iM and iM.HumanoidRootPart.Position local fq,iO for tR,fr in ipairs(iH())do
if fr.Enabled then local iP=iD(fr)local iQ=(iP and iN)and(iP-iN).Magnitude or 1e9 if not fq or iQ<iO then fq,iO=fr,iQ end
end end return fq end local function iR()local dr=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not dr then return nil end local iS=dr:FindFirstChild("BuyPromptAttachment")local ds=(iS and iS:FindFirstChild("BuyPrompt"))or dr:FindFirstChild("BuyPrompt",true)
if ds and ds:IsA("ProximityPrompt")and ds:IsDescendantOf(dr)then return ds end end local iT={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local n1={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local Q={order={},price={},dirty=false}local A={seen={},at=0,boxes={},built=0}local K={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local fs="SAB_order.txt"local function dt()if not Q.dirty or type(writefile)~="function"then return end local ah={}
for n2,n3 in pairs(Q.price)do ah[#ah+1]="P|"..n2 .."|"..string.format("%.0f",n3)end for n4,n5 in pairs(Q.order)do ah[#ah+1]="O|"..n4 .."|"..table.concat(n5,",")end
if d.learned and d.enc then ah[#ah+1]="M|mode|"..tostring(d.learned.mode or"")for n6,du in ipairs(d.learned.seq)do
local iU={}for iV=1,du.n do iU[iV]=d.enc(du.args[iV])end ah[#ah+1]=("A|%d|%s|%d|%s"):format(n6,du.m,du.n,table.concat(iU,";"))
end end local function ft(n7,n8,dv)local iW={}for iX=1,dv.n do iW[iX]=d.enc(dv.args[iX])end ah[#ah+1]=("R|%d|%s|%s|%d|%s"):format(n8,n7,dv.m,dv.n,table.concat(iW,";"))
end if d.enc then for n9,n_ in ipairs(u.rec.rules)do ft("rules",n9,n_)end if u.rec.on then ft("on",0,u.rec.on)end
if u.rec.off then ft("off",0,u.rec.off)end end for tS,b_ in pairs(A.seen)do ah[#ah+1]=("K|%s|%s|%s|%s"):format(b_.name,b_.title or"",b_.rar or"",b_.price and string.format("%.0f",b_.price)or"")
end if pcall(writefile,fs,table.concat(ah,"\n"))then Q.dirty=false end end local function oa()if type(isfile)~="function"or type(readfile)~="function"then return end
local ob,oc=pcall(isfile,fs)if not(ob and oc)then return end local od,iY=pcall(readfile,fs)if not(od and type(iY)=="string")then return end
for oe in iY:gmatch("[^\n]+")do local bD,bE,aH=oe:match("^(%a)|([^|]+)|(.*)$")if bD=="P"then Q.price[bE]=tonumber(aH)
elseif bD=="M"then d.loadMode=(aH~=""and aH~="nil")and aH or nil elseif bD=="A"and d.dec then local iZ=tonumber(bE)
local i0,dw,of=aH:match("^([^|]+)|(%d+)|(.*)$")if iZ and i0 then dw=tonumber(dw)local i1,dx={},0 for og in(of..";"):gmatch("([^;]*);")do
dx=dx+1 if dx<=dw then i1[dx]=d.dec(og)end end d.loadSeq=d.loadSeq or{}d.loadSeq[iZ]={m=i0,n=dw,args=i1}end elseif bD=="R"and d.dec then
local i2=tonumber(bE)local dy,oh,dz,oi=aH:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if i2 and dy then dz=tonumber(dz)
local i3,dA={},0 for oj in(oi..";"):gmatch("([^;]*);")do dA=dA+1 if dA<=dz then i3[dA]=d.dec(oj)end end local fu={m=oh,n=dz,args=i3}
if dy=="rules"then u.rec.rules[i2]=fu elseif dy=="on"then u.rec.on=fu elseif dy=="off"then u.rec.off=fu end end
elseif bD=="K"then local i4,i5,ol=aH:match("^([^|]*)|([^|]*)|(.*)$")A.seen[A.key(bE)]={name=bE,title=i4~=""and i4 or nil,
rar=i5~=""and i5 or nil,price=tonumber(ol)}elseif bD=="O"and aH~=""then local dB={}for om in aH:gmatch("[^,]+")do dB[#dB+1]=om end
if#dB>0 then Q.order[bE]=dB end end end end local function oo(dC)if type(dC)~="table"then return end local bf,i6=dC.rarity,dC.contents
if type(bf)~="string"or bf==""or type(i6)~="table"then return end local ca={}for tT,dD in ipairs(i6)do if type(dD)=="table"and type(dD.butter)=="string"then
ca[#ca+1]={n=dD.butter,ch=tonumber(dD.chance)or 0}end end if#ca==0 then return end table.sort(ca,function(op,oq)return op.ch>oq.ch end)
local cb,cc={},false for ot,ou in ipairs(ca)do cb[ot]=ou.n end local fv=Q.order[bf]if not fv or#fv~=#cb then cc=true end
if not cc then for i7=1,#cb do if fv[i7]~=cb[i7]then cc=true break end end end Q.order[bf]=cb local fw=tonumber(dC.price)
if fw and Q.price[bf]~=fw then Q.price[bf]=fw cc=true end if cc then Q.dirty=true K.at=0 o("learned the "..bf.." order from its crate")
end end local function bF(ov,ow)local ox=ov:FindFirstChild(ow,true)local oy,fy=pcall(function()return ox.Text end)
return(oy and type(fy)=="string"and fy~="")and fy or nil end local function T(i8)return K.pretty[i8]or i8 end
A.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function A.key(oz)return dm(oz or"")end
function A.learn(aI)if type(aI)~="table"or type(aI.name)~="string"then return end local fz=A.key(aI.name)local aJ=A.seen[fz]or{}
local oA=(A.seen[fz]==nil)or(tonumber(aI.price)and aJ.price~=tonumber(aI.price))aJ.name,aJ.title=aI.name,aI.title or aJ.title
aJ.rar,aJ.price=aI.rarity or aJ.rar,tonumber(aI.price)or aJ.price A.seen[fz]=aJ if oA then A.at,Q.dirty=q(),true end
end function A.wanted(i9)return i9~=nil and e.CrateTicks[A.key(i9)]==true end function A.list()local bG={}for oB,dE in ipairs(A.base)do bG[A.key(dE[1])]={name=dE[1],title=dE[2],rar=dE[3],i=oB}end
for tU,cd in ipairs(K.rarOrder)do local i_=false for tV,oC in pairs(bG)do if oC.rar==cd then i_=true break end end
if not i_ and cd~="?"then local ja=cd:gsub("[^%w]","").."Crate"bG[A.key(ja)]={name=ja,title=cd.." Crate",rar=cd,i=50,guess=true}
end end for jb,dF in pairs(A.seen)do local aC=bG[jb]or{i=100}aC.name,aC.title,aC.rar=dF.name or aC.name,dF.title or aC.title,dF.rar or aC.rar
aC.price,aC.guess=dF.price or aC.price,nil bG[jb]=aC end local ce,dG={},{}for oD,oE in ipairs(iT)do ce[oE]=oD end
for oF,jc in ipairs(K.rarOrder)do ce[jc]=ce[jc]or(20+oF)end for oG,cf in pairs(bG)do cf.k=oG cf.price=cf.price or Q.price[cf.rar or""]
dG[#dG+1]=cf end table.sort(dG,function(bh,bi)if bh.price and bi.price and bh.price~=bi.price then return bh.price<bi.price end
local jd,je=ce[bh.rar or""]or 99,ce[bi.rar or""]or 99 if jd~=je then return jd<je end if(bh.i or 100)~=(bi.i or 100)then return(bh.i or 100)<(bi.i or 100)end
return bh.k<bi.k end)return dG end local function oH()local jf=au:FindFirstChild("Assets")local jg=jf and jf:FindFirstChild("Squishies")
if not jg then return false end local fA,jh,bH={},{},{}local dH=0 for tW,dI in ipairs(jg:GetChildren())do local cg=N(dI.Name)
if cg~=""and not fA[cg]then local dJ=bF(dI,"RarityText")or"?"fA[cg]=dJ jh[cg]=bF(dI,"NameText")or dI.Name bH[dJ]=bH[dJ]or{}
table.insert(bH[dJ],cg)dH=dH+1 end end if dH==0 then return false end for ji,oI in pairs(bH)do local jj=Q.order[ji]or n1[ji]
local fB={}if jj then for oJ,oK in ipairs(jj)do fB[N(oK)]=oJ end end table.sort(oI,function(jk,jl)local fC,fD=fB[jk],fB[jl]
if fC and fD then return fC<fD end if fC then return true end if fD then return false end return T(jk)<T(jl)end)
end local fE={}for oL,oM in ipairs(iT)do fE[oM]=oL end local dK={}for oN in pairs(bH)do dK[#dK+1]=oN end table.sort(dK,function(fF,fG)
local fH,fI=Q.price[fF],Q.price[fG]if fH and fI and fH~=fI then return fH<fI end local fJ,fK=fE[fF],fE[fG]if fJ and fK then return fJ<fK end
if fJ then return true end if fK then return false end return fF<fG end)K.rar,K.pretty,K.members,K.rarOrder,K.n,K.at=fA,jh,bH,dK,dH,q()
return true end local function fL()if K.at==0 or(q()-K.at)>120 then pcall(oH)end return K.n>0 end local function oO(oP)
local jm=N(oP)return K.rar[jm]or(F.name and N(F.name)==jm and F.rar)or"?"end local function oQ()local dL={}for oR,oS in pairs(e.Targets)do if oS then dL[#dL+1]=T(oR)end end
table.sort(dL)return dL end local af={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function jn()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function dM(jo)if type(makefolder)~="function"then return end local oT,oU=pcall(isfolder,jo)if not(oT and oU)then pcall(makefolder,jo)end
end local function fM(jp)if type(isfile)~="function"or type(readfile)~="function"then return nil end local oV,oW=pcall(isfile,jp)
if not(oV and oW)then return nil end local oX,oY=pcall(readfile,jp)return oX and oY or nil end local function dN(oZ,o0)
if type(writefile)~="function"then return false end return(pcall(writefile,oZ,o0))end local function jq(o1)local ci={}
if type(listfiles)~="function"then return ci end local o2,jr=pcall(listfiles,o1)if not o2 or type(jr)~="table"then return ci end
for tX,o3 in ipairs(jr)do ci[#ci+1]=tostring(o3)end return ci end local function js()local dO={}for tY,o4 in ipairs(jq(af.cfg))do
local jt=o4:match("([^/\\]+)%.txt$")if jt then dO[#dO+1]=jt end end table.sort(dO)return dO end local function o5()
local J={"V|1"}J[#J+1]="N|Every|"..tostring(e.Every)J[#J+1]="N|GlazeLead|"..tostring(e.GlazeLead)J[#J+1]="N|FpsCap|"..tostring(e.FpsCap)
J[#J+1]="N|MemLimit|"..tostring(e.MemLimit)for tZ,ju in ipairs({"TeamNormal","TeamGlaze","TeamWax"})do J[#J+1]="S|"..ju.."|"..e[ju]end
do local dP={}for o6,fN in pairs(e.Pets)do local jv=(fN.b and"b"or"")..(fN.g and"g"or"")..(fN.w and"w"or"")if jv~=""then dP[#dP+1]=o6 .."|"..jv end
end table.sort(dP)J[#J+1]="P|-"for t0,o7 in ipairs(dP)do J[#J+1]="P|"..o7 end end for t1,jw in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender"})do
J[#J+1]="B|"..jw.."|"..(e[jw]and"1"or"0")end local fO=C:GetAttribute("AutoRollRules")if type(fO)=="string"and fO~=""then e.ARrules,e.ARstop=fO,tostring(C:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then J[#J+1]="S|rules|"..e.ARrules J[#J+1]="S|stop|"..e.ARstop end if a.winPos then J[#J+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then J[#J+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for t2,fP in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local dQ={}for o8,o9 in pairs(fP[2])do if o9 then dQ[#dQ+1]=o8 end end table.sort(dQ)J[#J+1]=fP[1].."|-"for t3,o_ in ipairs(dQ)do J[#J+1]=fP[1].."|"..o_ end
end return table.concat(J,"\n")end local function pa(fQ)if type(fQ)~="string"or fQ==""then return false end local jx,jy,jz,jA,cj={},false,{},false,nil
for pb in fQ:gmatch("[^\n]+")do local aq,P,ai=pb:match("^(%a)|([^|]*)|?(.*)$")if aq=="N"and P=="Every"then local fR=tonumber(ai)
if fR and fR>=1 then e.Every=math.floor(fR)end elseif aq=="N"and(P=="FpsCap"or P=="MemLimit")then local fS=tonumber(ai)
if fS and fS>=0 then e[P]=math.floor(fS)end elseif aq=="N"and P=="GlazeLead"then local dR=tonumber(ai)if dR and dR>=5 and dR<=600 then e.GlazeLead=math.floor(dR)end
elseif aq=="S"and(P=="TeamNormal"or P=="TeamGlaze"or P=="TeamWax")then e[P]=ai elseif aq=="P"and P~=""then if not cj then cj={}end
if P~="-"and ai~=""then cj[P]={b=ai:find("b",1,true)and true or nil,g=ai:find("g",1,true)and true or nil,w=ai:find("w",1,true)and true or nil}
end elseif aq=="B"then if e[P]~=nil then e[P]=(ai=="1")end elseif aq=="S"and P=="rules"then e.ARrules=ai elseif aq=="S"and P=="stop"then
e.ARstop=ai elseif aq=="W"then a.winPos={tonumber(P)or 10,tonumber(ai)or 44}elseif aq=="G"then a.togPos={tonumber(P)or 10,tonumber(ai)or 300}
elseif aq=="T"and P~=""then if P~="-"then jx[P]=true end jy=true elseif aq=="K"and P~=""then if P~="-"then jz[P]=true end
jA=true end end if jy then e.Targets=jx end if jA then e.CrateTicks=jz end if cj then e.Pets=cj end return true
end local function dS(bI)if not jn()then return false,"this executor cannot write files"end bI=(bI or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if bI==""then return false,"give the config a name"end dM(af.dir)dM(af.cfg)if not dN(af.cfg.."/"..bI..".txt",o5())then return false,"could not write the file"end
a.config=bI return true,bI end local function jB(dT)local jC=fM(af.cfg.."/"..dT..".txt")if not jC then return false,"no config called "..tostring(dT)end
if not pa(jC)then return false,"that config looks empty"end a.config=dT return true,dT end local function jD(fT)
if fT then dM(af.dir)dN(af.auto,fT)elseif type(delfile)=="function"then pcall(delfile,af.auto)else dN(af.auto,"")
end a.autoload=fT end local function fU()if a.selfPath then return a.selfPath end local dU for t4,pc in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",af.dir})do
for t5,jE in ipairs(jq(pc))do local fV=jE:lower()if fV:sub(-4)==".lua"and(fV:find("sab_farm",1,true)or fV:find("sab farm",1,true))then
dU=dU or jE end end end a.selfPath=dU return dU end af.stub=[[
-- SAB autoloader: finds the saved SAB farm script and runs it on join.
task.spawn(function()
    task.wait(8)
    if type(listfiles) ~= "function" or type(readfile) ~= "function" then return end
    for _, d in ipairs({ "", "scripts", "Scripts", "Delta", "Delta/Scripts", "SAB" }) do
        local ok, fs = pcall(listfiles, d)
        if ok and type(fs) == "table" then
            for _, f in ipairs(fs) do
                local s, low = tostring(f), tostring(f):lower()
                if low:sub(-4) == ".lua" and low:find("sab_farm", 1, true) and not low:find("autoload", 1, true) then
                    local okr, src = pcall(readfile, s)
                    if okr and type(src) == "string" and #src > 1000 then
                        local fn = loadstring(src)
                        if fn then pcall(fn) return end
                    end
                end
            end
        end
    end
end)
]]
local function pd()if not jn()then return false,"this executor cannot write files"end dM("autoexec")if not dN(af.exec,af.stub)then return false,"could not write to the autoexec folder"end
local jF=fU()return true,jF and("it will load "..jF)or"now save this script in Delta so the loader can find it"
end local dV=(function()local pe,pf=pcall(function()return game:GetService("TeleportService")end)return pe and pf or nil end)()
local function fW()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local pg=queueonteleport or queue_on_teleport local jG=fU()if not jG then return false end return(pcall(pg,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(jG)))
end local function ck(ph)if a.rejoining then return end a.rejoining=true o("REJOIN ("..ph..")")pcall(dt)if a.autoload then pcall(dS,a.autoload)end
local pj=fW()o(pj and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for t6=1,30 do if not dV then break end pcall(function()dV:Teleport(game.PlaceId,C)end)task.wait(10)
end end)end local function pk()local pl,jH=pcall(function()return game:GetService("GuiService")end)if pl and jH then
pcall(function()L(jH.ErrorMessageChanged:Connect(function()if e.Rejoin then ck("roblox error message")end end))
end)end pcall(function()local jI=game:GetService("CoreGui")local jJ=jI and jI:WaitForChild("RobloxPromptGui",15)
local jK=jJ and jJ:WaitForChild("promptOverlay",15)if jK then L(jK.ChildAdded:Connect(function(pm)if e.Rejoin and tostring(pm.Name):lower():find("errorprompt",1,true)then ck("disconnect prompt")end
end))end end)pcall(function()L(C.OnTeleport:Connect(function(pn)if tostring(pn):find("Started")then fW()end end))
end)if dV then pcall(function()L(dV.TeleportInitFailed:Connect(function()a.rejoining=false if e.Rejoin then task.delay(5,function()ck("teleport retry")end)end
end))end)end end local function jL(po)local jM=a.plot and a.plot:FindFirstChild(po)if not jM then return nil,false end
for t7,fX in ipairs(jM:GetChildren())do if fX:IsA("Model")or fX:IsA("BasePart")then return fX,true end end return nil,true
end local function cl()local aY=jL("RolledSquishy")if not aY then return nil end return{model=aY,name=aY.Name,pretty=bF(aY,"NameText")or T(N(aY.Name)),
rar=bF(aY,"RarityText")or oO(aY.Name),price=bF(aY,"PriceText")}end local function jN(fY)return type(fY)=="string"and(K.rar[N(fY)]~=nil or nO(fY))
end local function O()local fZ=jL("SquishyEquipped")if fZ then a.carrySrc,d.heldAt="model",q()return fZ.Name,fZ end
local jO=C.Character if jO then for t8,cm in ipairs(jO:GetDescendants())do if(cm:IsA("Model")or cm:IsA("Tool"))and jN(cm.Name)then
a.carrySrc,d.heldAt="character",q()return cm.Name,cm end end end local dW=C:GetAttribute("SquishyEquipped")if type(dW)=="string"and dW~=""and jN(dW)and q()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return dW,nil end a.carrySrc=nil end local function t9()local t_,pp=O()return pp end local function jP()
local jQ=cl()local f0=jQ and nQ(jQ.price)local f1=aF()if f0 and f1 and f1<f0*0.5 then return f1,f0 end end local function bJ(pq)
b6[#b6+1]=os.date("%H:%M:%S").." "..pq if#b6>40 then table.remove(b6,1)end end local function pr(bj,dX)if type(bj)~="string"then return end
bJ(("Roll(%s,%s)"):format(bj,tostring(dX)))if bj:lower():find("crate",1,true)then d.rolled,d.rolledAt=bj,q()return
end F.seq=F.seq+1 F.name,F.at=bj,q()F.rar=type(dX)=="string"and dX or nil a.rolls=a.rolls+1 if aV(bj)then o(("ROLL %s [%s] = TARGET"):format(bj,tostring(dX)))end
end local function ps(bk)if type(bk)~="table"then return end local dY=bk.butter or bk.itemName if type(dY)~="string"then return end
a.gifts=a.gifts+1 F.gift,F.giftAt=dY,q()if type(bk.giftId)=="string"then local jR=au:FindFirstChild("Remotes")
local jS=jR and jR:FindFirstChild("GiftThanks")if jS then pcall(function()jS:FireServer(bk.giftId)end)end end
bJ("Gift("..dY.." from "..tostring(bk.fromName)..")")o(("GIFT from %s: %s - it will not be waxed"):format(tostring(bk.fromName),dY))
end local function pt()local jT=au:WaitForChild("Remotes",30)if not a.alive then return end if not jT then o("Remotes folder missing - no roll events")return end
L(C:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local jU=C:GetAttribute("SquishyEquipped")
if type(jU)=="string"and jU~=""then d.heldAt=q()end end))local pz={SquishyRollAnimation=pr,InitSquishy=function(jV)F.init,F.initAt=tostring(jV),q()bJ("Init("..tostring(jV)..")")end,
CrateUpdate=function(bK,jW)pcall(oo,bK)pcall(A.learn,bK)if type(bK)=="table"then local pu=jW==true or(d.rolled~=nil and q()-d.rolledAt<15)or d.waiting
if not pu then return end local pv=not d.waiting local pw=d.on d.waiting,d.data,d.at=true,bK,q()d.on=(jW==true)
d.title=tostring(bK.title or bK.name or"crate")if d.on and not pw then d.openedAt,d.byYou=q(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then bJ("CrateWindow open("..d.title..")")elseif pv then bJ("Crate waiting("..d.title..")")o(d.title.." is waiting on your stand")
end else if d.waiting then bJ("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local px=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,px)end if d.classify then local py=q()
task.spawn(function()pcall(d.classify,py)end)end end end,GiftReceived=ps,}for dZ,pA in pairs(pz)do local f2=jT:FindFirstChild(dZ)
if f2 and f2:IsA("RemoteEvent")then L(f2 .OnClientEvent:Connect(pA))elseif dZ~="CrateUpdate"and dZ~="GiftReceived"then o("remote "..dZ.." missing")end
end end local function f3()local bl=cl()if bl then if aV(bl.name)then return{state="match",shown=bl.pretty,src="pad",info=bl}
end return{state="skip",info=bl,level="idle",text=("on pad: %s [%s] - not ticked"):format(bl.pretty,tostring(bl.rar))}
end if F.name and(q()-F.at)<4 then if aV(F.name)then return{state="match",shown=T(N(F.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(T(N(F.name)),tostring(F.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function jX(pB,pC,pD,pE)
local d0=RaycastParams.new()d0 .FilterType=Enum.RaycastFilterType.Exclude local f4={C.Character}for ua,pF in ipairs(pE or{})do f4[#f4+1]=pF end
d0 .FilterDescendantsInstances=f4 pcall(function()d0 .RespectCanCollide=true end)local jY=aB:Raycast(Vector3 .new(pB,pC+4,pD),Vector3 .new(0,-30,0),d0)
return jY and jY.Position or nil end local function f5(jZ)local j0=jZ:FindFirstChildOfClass("Humanoid")return((j0 and j0 .HipHeight)or 2)+jZ.HumanoidRootPart.Size.Y/2+0.2
end local function f6(pG,pH)local j1=pG:FindFirstChildOfClass("Humanoid")local pI=q()while q()-pI<pH do if j1 and j1 .FloorMaterial~=Enum.Material.Air then return true end
ao(0.05)end return false end local function cn(pJ,f7,f8)local j2=pJ.HumanoidRootPart j2 .AssemblyLinearVelocity=Vector3 .new(0,0,0)
j2 .CFrame=f8 and CFrame.new(f7,Vector3 .new(f8 .X,f7 .Y,f8 .Z))or CFrame.new(f7)end local function co(aK,j3)
local bm=aG()if not bm or not aK then return false end local aZ=aK.Position local d1=math.clamp(math.max(aK.Size.X,aK.Size.Z)/2+2.2,3,7)
local j4=(j3 and j3 .MaxActivationDistance)or 10 if d1>j4-2 then d1=math.max(2.5,j4-2)end local cp={}local function bn(cq)
cq=Vector3 .new(cq.X,0,cq.Z)if cq.Magnitude>0.05 then cp[#cp+1]=cq.Unit end end local j5=nX()if j5 then bn(j5-aZ)end
bn(aK.CFrame.LookVector)bn(-aK.CFrame.LookVector)bn(aK.CFrame.RightVector)bn(-aK.CFrame.RightVector)bn(bm.HumanoidRootPart.Position-aZ)
if#cp==0 then bn(Vector3 .new(0,0,1))end local pK,d2=f5(bm),false for ub,pL in ipairs(cp)do local d3=aZ+pL*d1
local f9=jX(d3 .X,aZ.Y,d3 .Z,{aK})if f9 and math.abs(f9 .Y-aZ.Y)<14 then cn(bm,Vector3 .new(d3 .X,f9 .Y+pK,d3 .Z),aZ)
if f6(bm,0.7)then d2=true break end end end if not d2 then cn(bm,aZ+cp[1]*d1+Vector3 .new(0,3,0),aZ)d2=f6(bm,1)
end ao(0.12)return d2 end local function pM(cr)if not cr.Parent or not cr.Enabled then return false end pcall(function()cr:InputHoldBegin()end)
ao(math.max(cr.HoldDuration,0)+0.08)pcall(function()cr:InputHoldEnd()end)return true end local function ad(j6,pN)
local pO=q()while q()-pO<pN do if j6()then return true end ao(0.05)end return j6()end local function d4(bL,pP,j7,pQ)
local pR=a.zapFirst and{"zap","hold"}or{"hold","zap"}for pS,f_ in ipairs(pR)do if pS==2 and(pQ or not(bL.Parent and bL.Enabled and(not j7 or j7())))then break end
local ga if f_=="hold"then ga=pM(bL)else ga=type(fireproximityprompt)=="function"and bL.Parent~=nil and bL.Enabled and pcall(fireproximityprompt,bL)end
if ga and ad(pP,1.2)then a.zapFirst=(f_=="zap")return true,f_ end end return false end local function j8(gb)local a0=iR()
if not a0 or not a0 .Enabled then o("buy: nothing on the pad")return false end local j9=b9(a0)if not j9 then o("buy: pad part missing")return false end
a.lastBuyAt=q()local pT,j_=F.seq,aF()co(j9,a0)if not a0 .Enabled then o("buy aborted: pad emptied")return false end
local bM=f3()if not gb and bM.state~="match"then o("buy aborted: "..(bM.text or"pad changed"))a.matchSince=nil
return false end local gc=bM.info and bM.info.name or(bM.state=="match"and F.name)or nil local function pU()return a0 .Enabled and O()==nil and(gb or f3().state=="match")
end local pV,pW=d4(a0,function()return O()~=nil or((not a0 .Enabled)and(gb or F.seq==pT))end,pU,jP()~=nil)if pV then
ad(function()return O()~=nil end,0.8)local cs=O()local ka=aF()a.holding,a.bought,a.cashFails=true,a.bought+1,0
a.matchSince=nil F.name,F.rar,F.at=nil,nil,q()o(("BOUGHT %s%s via %s"):format(cs and T(N(cs))or(bM.shown or"?"),(j_ and ka)and(" for $"..ap(j_-ka))or"",pW))
if cs and gc and N(cs)~=N(gc)then o(("note: picked up %s, not %s"):format(cs,gc))end return true end a.cashFails=a.cashFails+1
a.noCashUntil=q()+math.min(8*2^(a.cashFails-1),60)local kb=cl()o(("BUY REFUSED: cash short? have $%s, price %s"):format(ap(aF()),(kb and kb.price)or"?"))
return false end local function kc()local d5=O()if not d5 then a.holding=false o("place: hands are empty")return false
end if not aV(d5)then o(("REFUSED TO WAX %s - it is not ticked"):format(T(N(d5))))return false end for uc=1,e.PlaceTries do
local a1=n0()if not a1 then o("place: no free station")break end local kd=b9(a1)if kd then co(kd,a1)local ke=O()
if not ke then a.holding=false o("place: hands emptied on the way")return false end if not aV(ke)then o("place: what I carry changed, not waxing it")return false end
if a1 .Enabled then local pX,pY=d4(a1,function()return not a1 .Enabled end,function()return a1 .Enabled end)if pX then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=q()+2.5,0 F.name,F.rar,F.at=nil,nil,q()
o(("WAXED %s #%d at %s via %s"):format(T(N(d5)),a.placed,a1 .Parent.Parent.Name,pY))return true end end end ao(0.25)
end a.placeFails=a.placeFails+1 if O()==nil then a.holding=false end o("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then
a.capHit,a.running,a.capAt=true,false,q()a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(O()))o(a.capMsg)end return false end function r.place()if e.Teams and e.TeamWax~=""then r.placing=true
local pZ=q()while a.alive and r.current()~=e.TeamWax and q()-pZ<5 do ao(0.1)end if r.current()==e.TeamWax then ao(0.25)else o("wax team did not come on in time - placing anyway")end
end local p0,kf=pcall(kc)r.placing=false if not p0 then error(kf,0)end return kf end local function kg(kh)return type(kh)=="string"and kh:lower():find("crate",1,true)~=nil
end local p1={SABFarmGui=1,SABToggle=1,SABError=1}local function gd(p2)local a2=p2 while a2 do if p1[a2 .Name]then return false end
if a2:IsA("ScreenGui")then local p3,p4=pcall(function()return a2 .Enabled end)return(not p3)or p4~=false end if a2:IsA("GuiObject")and not a2 .Visible then return false end
a2=a2 .Parent end return false end local function d6(d7)local bN=""pcall(function()if d7:IsA("TextButton")then bN=d7 .Text end end)
if not bN:find("%a")then for ud,d8 in ipairs(d7:GetDescendants())do if(d8:IsA("TextLabel")or d8:IsA("TextButton"))and d8 .Text:find("%a")then bN=d8 .Text break end
end end if not bN:find("%a")then bN=d7 .Name end return(bN:lower():gsub("[^%a]",""))end local function p5()local ct,cu
local ki=C:FindFirstChildOfClass("PlayerGui")if not ki then return nil,nil end for ue,cv in ipairs(ki:GetDescendants())do
if cv:IsA("GuiButton")and gd(cv)then local ge=d6(cv)if ge:sub(1,4)=="open"and not ge:find("shop",1,true)then ct=ct or cv end
if ge:sub(1,7)=="discard"then cu=cu or cv end end end if ct and cu then return ct,cu end if d.on then return ct,cu end
return nil,nil end local gf=(function()local p6,p7=pcall(function()return game:GetService("VirtualInputManager")end)return p6 and p7 or nil end)()
local function kj(aL,gg)local gh={}local function kk(p8)gh[#gh+1]=p8 end if a.tapWay then kk(a.tapWay)end for uf,kl in ipairs({"touch","conn","signal"})do
if kl~=a.tapWay then kk(kl)end end local function km(p9,...)local p_,gi=pcall(getconnections,p9)if not(p_ and type(gi)=="table"and#gi>0)then return false end
local kn,qa,qb=false,{...},select("#",...)for ug,qc in ipairs(gi)do if pcall(function()qc:Fire(table.unpack(qa,1,qb))end)then kn=true end
end return kn end local function ko()local kp=Vector3 .new(0,0,0)pcall(function()local kq,kr=aL.AbsolutePosition,aL.AbsoluteSize
kp=Vector3 .new(kq.X+kr.X/2,kq.Y+kr.Y/2,0)end)local gj={Position=kp,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()gj.UserInputType=Enum.UserInputType.Touch end)pcall(function()gj.UserInputState=Enum.UserInputState.End end)
return gj end for uh,aM in ipairs(gh)do local cw=false if aM=="conn"and type(getconnections)=="function"then if km(aL.MouseButton1Click)then
cw=true if ad(gg,1.5)then a.tapWay=aM return true,aM end end cw=km(aL.Activated,ko(),1)elseif aM=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aL.MouseButton1Click)then if ad(gg,1.5)then a.tapWay=aM return true,aM end end cw=pcall(firesignal,aL.Activated,ko(),1)
elseif aM=="touch"and gf then cw=pcall(function()local ks,kt=aL.AbsolutePosition,aL.AbsoluteSize local ku=0 local kv=aL:FindFirstAncestorWhichIsA("ScreenGui")
local qd,qe=pcall(function()return kv and kv.IgnoreGuiInset end)if not(qd and qe)then pcall(function()ku=game:GetService("GuiService"):GetGuiInset().Y end)
end local kw,kx=ks.X+kt.X/2,ks.Y+kt.Y/2+ku gf:SendMouseButtonEvent(kw,kx,0,true,game,1)task.wait(0.06)gf:SendMouseButtonEvent(kw,kx,0,false,game,1)
end)end if cw and ad(gg,1.5)then a.tapWay=aM return true,aM end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function gk(ky)local cx=ky.Parent while cx and cx~=a.plot do if d.NOT[cx.Name]then return false end cx=cx.Parent
end local gl=(ky.ActionText or""):lower()if gl:find("roll",1,true)or gl:find("place",1,true)or gl:find("sell",1,true)then return false end
return true end local function qf()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local kz=a.plot:FindFirstChild("CrateStand")local cy if kz then for ui,d9 in ipairs(kz:GetDescendants())do
if d9:IsA("ProximityPrompt")and d9 .Enabled and gk(d9)then cy=d9 break end end end if not cy then for uj,a3 in ipairs(a.plot:GetDescendants())do
if a3:IsA("ProximityPrompt")and a3 .Enabled and gk(a3)then local kA=a3:FindFirstAncestorWhichIsA("Model")local qg=((a3 .ActionText or"").." "..(a3 .ObjectText or"").." "..a3 .Name.." "..(kA and kA.Name or"")):lower()
if qg:find("crate",1,true)then cy=a3 break end end end end d.prompt=cy return cy end local function gm()if d.on then return true end
local cz=qf()if not cz then d.summonFails=d.summonFails+1 d.lastFail=q()o("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local kB=b9(cz)if kB then co(kB,cz)end d.ours=true d4(cz,function()return d.on end)if ad(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=q()o("crate: pressed "..dp(cz).." but no window came up")
return false end do local function qh(kC)local bO=kC.Parent while bO and bO:IsA("GuiObject")do local kD,kE=false,false
for uk,cA in ipairs(bO:GetDescendants())do if cA~=kC and cA:IsA("GuiButton")and d6(cA):sub(1,7)=="discard"then kD=true end
if cA:IsA("TextLabel")then local gn=cA.Text:lower()if gn:find("crate",1,true)or gn:find("can contain",1,true)or gn:find("cost",1,true)then kE=true end
end if kD and kE then return bO end end bO=bO.Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local kF=C:FindFirstChildOfClass("PlayerGui")if not kF then return nil end for ul,d_ in ipairs(kF:GetDescendants())do
if d_:IsA("GuiButton")and not d_:FindFirstAncestor("SABFarmGui")and d6(d_):sub(1,4)=="open"then local go=qh(d_)
if go then d.win=go return go end end end end local function qi(qj)for um,ea in ipairs(qj:GetDescendants())do
if ea:IsA("GuiButton")then local kG,gp=d6(ea),ea.Name:lower()if kG=="x"or kG=="close"or gp=="x"or gp:find("close",1,true)or gp:find("exit",1,true)then return ea end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(qk)task.wait(qk and 4 or 1.2)if d.on or d.waiting then return end
local eb=d.findWin()if not eb or not gd(eb)then return end local kH=qi(eb)if kH and kj(kH,function()return not gd(eb)end)then return end
o("the crate window is still open - tap its X")end end local function ec(ed)if not gm()then return false end local kI=q()-(d.openedAt or 0)
if kI<0.6 then ao(0.6-kI)end local gq=d.title local ql,qm=p5()local kJ=ed and ql or qm if not kJ then d.lastFail=q()
a.crateFails=a.crateFails+1 o(("crate: no %s button found in %s"):format(ed and"Open"or"Discard",gq))return false
end local qn=O()local qo,un=kj(kJ,function()return(not d.on)or(O()~=nil and O()~=qn)end)if not qo then d.lastFail=q()
a.crateFails=a.crateFails+1 o("crate: could not press "..(ed and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if ed then a.crates=a.crates+1 ad(function()return O()~=nil end,1.5)local kK=O()
o(("OPENED %s -> %s"):format(gq,kK and T(N(kK))or"?"))else o("discarded "..gq.." (nothing ticked in it)")end return true
end d.calls={}function d.saw(qp,...)local qq=select("#",...)d.calls[#d.calls+1]={t=q(),m=qp,n=qq,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(aj,aN)local a4=type(aj)if(a4=="string"or a4=="number")and type(aN.data)=="table"then for kL,gr in pairs(aN.data)do
if gr==aj and type(kL)=="string"and(type(gr)=="string"or type(gr)=="number")then return{__slot="f:"..kL}end end
end if a4=="string"then if aN.crate and aj==aN.crate then return{__slot="crate"}end if aN.title and aj==aN.title then return{__slot="title"}end
if aN.rar and aj==aN.rar then return{__slot="rarity"}end return aj end if a4=="number"or a4=="boolean"or a4=="nil"then return aj end
if a4=="table"then local kM={}for qr,kN in pairs(aj)do if type(kN)=="table"then return nil,"nested table"end local qs,kO=d.slot(kN,aN)
if kO then return nil,kO end kM[qr]=qs end return kM end local qt,qu=pcall(function()return aj:IsA("Instance")end)
if qt and qu then if aj==C then return{__slot="player"}end if a.plot and aj==a.plot then return{__slot="plot"}end
local ee=a.plot and a.plot:FindFirstChild("CrateStand")if ee and aj==ee then return{__slot="stand"}end if ee and aj.Parent==ee then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..a4 ..")"end function d.resolve(ef)if type(ef)~="table"then return ef end
local av=ef.__slot if av and av:sub(1,2)=="f:"then return d.data and d.data[av:sub(3)]end if av=="crate"then return d.data and d.data.name end
if av=="title"then return(d.data and d.data.title)or d.title end if av=="rarity"then return d.data and d.data.rarity end
if av=="player"then return C end if av=="plot"then return a.plot end if av=="stand"or av=="model"then local gs=a.plot and a.plot:FindFirstChild("CrateStand")
if av=="stand"or not gs then return gs end for uo,kP in ipairs(gs:GetChildren())do if kg(kP.Name)then return kP end end
return nil end local kQ={}for qv,qw in pairs(ef)do kQ[qv]=d.resolve(qw)end return kQ end function d.classify(gt)
if d.directOff then return end local eg={}for up,gu in ipairs(d.calls)do if gu.t<=gt+0.05 and gt-gu.t<=6 then eg[#eg+1]=gu end
end if#eg==0 then return end if not ad(function()return(d.heldAt or 0)>=gt-1 end,2.5)then return end local cB={}
for uq,cC in ipairs(eg)do local kR={}for kS=1,cC.n do local qx,kT=d.slot(cC.args[kS],cC)if kT then o("crate call has "..kT.." - keeping the button method")
return end kR[kS]=qx end cB[#cB+1]={m=cC.m,n=cC.n,args=kR}end local gv=d.learned d.learned={seq=cB,mode=gv and gv.mode or nil}
Q.dirty=true if not gv then o(("learned how to open crates directly (%d call%s)"):format(#cB,#cB==1 and""or"s"))end
end function d.replay()local kU=d.learned local kV=au:FindFirstChild("Remotes")local gw=kV and kV:FindFirstChild("CrateAction")
if not(kU and gw)then return false end local kW=table.unpack or unpack d.replaying=true for ur,cD in ipairs(kU.seq)do
local gx={}for kX=1,cD.n do gx[kX]=d.resolve(cD.args[kX])end task.spawn(function()pcall(function()if cD.m=="InvokeServer"then gw:InvokeServer(kW(gx,1,cD.n))
else gw:FireServer(kW(gx,1,cD.n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(qy)return(qy:gsub("[%%|;=,\n]",function(qz)return("%%%02X"):format(qz:byte())end))end
function d.enc(bo)local eh=type(bo)if eh=="string"then return"s"..d.esc(bo)end if eh=="number"then return"n"..tostring(bo)end
if eh=="boolean"then return bo and"b1"or"b0"end if eh=="nil"then return"z"end if bo.__slot then return"k"..bo.__slot end
local gy={}for qA,qB in pairs(bo)do gy[#gy+1]=d.enc(qA).."="..d.enc(qB)end return"t"..table.concat(gy,",")end
function d.dec(kY)local cE,cF=kY:sub(1,1),kY:sub(2)local function qC(qD)return(qD:gsub("%%(%x%x)",function(qE)return string.char(tonumber(qE,16))end))end
if cE=="s"then return qC(cF)end if cE=="n"then return tonumber(cF)end if cE=="b"then return cF=="1"end if cE=="k"then return{__slot=cF}end
if cE=="t"then local kZ={}for qF in cF:gmatch("[^,]+")do local k0,qG=qF:match("^(.-)=(.*)$")if k0 then local k1=d.dec(k0)
if k1~=nil then kZ[k1]=d.dec(qG)end end end return kZ end return nil end function d.goneOrNew(qH)return function()
if not d.waiting then return true end local k2=O()return k2~=nil and k2~=qH end end function d.near()local k3=au:FindFirstChild("Remotes")
local k4=k3 and k3:FindFirstChild("CrateAction")local gz=aG()local gA=a.plot and a.plot:FindFirstChild("CrateStand")
local gB=gA and gA:FindFirstChild("Spot")if not(k4 and gz and gB)then return false,"no crate stand or remote"end
local gC=gz.HumanoidRootPart local ei=gC.CFrame local k5,gD=d.title,"no answer"local qI=O()local k6=gA:FindFirstChild("Holder")
local function k7()if not k6 then return d.waiting or d.on end for us,qJ in ipairs(k6:GetChildren())do if qJ:IsA("Model")then return true end end
return false end for qK=1,3 do if not(d.waiting or d.on)or not k7()then d.waiting,d.on,d.quietUntil=false,false,q()+4
return true,"already gone"end if(gC.Position-gB.Position).Magnitude>8 then co(gB,d.prompt)end ao(0.12+0.15*qK)
local aD={}d.replaying=true task.spawn(function()aD.ok,aD.v=pcall(function()return k4:InvokeServer("open")end)
aD.done=true end)ad(function()return aD.done end,6)d.replaying=false local bp=aD.v if aD.done and aD.ok and type(bp)=="table"and bp.ok then
a.crates,d.fails,d.nearFails=a.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,q()+4 o(("OPENED %s -> %s (no window)"):format(k5,bp.prize and T(N(tostring(bp.prize)))or"?"))
ad(function()local k8=O()return k8~=nil and k8~=qI end,1.5)if(gC.Position-ei.Position).Magnitude>8 then pcall(function()cn(gz,ei.Position,ei.Position+ei.LookVector)end)end
return true,"opened"end gD=(aD.done and aD.ok and type(bp)=="table")and tostring(bp.reason or"refused, no reason given")
or(aD.done and("error: "..tostring(bp))or"no answer in 6s")ao(0.3)if not k7()then d.waiting,d.on,d.quietUntil=false,false,q()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 o(("crate: the server would not open %s next to the stand (%s)"):format(k5,gD))
return false,gD end function d.smart()local gE=d.title if(d.nearFails or 0)<3 then local qL=d.near()if qL then return true end
if d.nearFails>=3 then o("opening next to the stand failed 3 times - trying the older ways")end end local bq=d.learned
if bq then local gF=O()if d.on then d.replay()if ad(d.goneOrNew(gF),3.5)then a.crates=a.crates+1 o("OPENED "..gE.." (direct)")
return true end else if bq.mode~="window"then d.replay()if ad(d.goneOrNew(gF),3.5)then a.crates,d.fails=a.crates+1,0
if bq.mode~="direct"then bq.mode,Q.dirty="direct",true o("crates now open directly - the window never comes up")
end o("OPENED "..gE.." (direct, no window)")return true end end if gm()then d.replay()if ad(d.goneOrNew(gF),3.5)then
a.crates,d.fails=a.crates+1,0 if bq.mode~="window"then bq.mode,Q.dirty="window",true o("crates need their window up first - it shows briefly")
end o("OPENED "..gE.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,Q.dirty=bq,nil,true
if d.fails>=3 then d.directOff=true o("direct crate opening failed 3 times - using the button for now")else o("the learned crate call did not work - back to pressing Open")
end end return ec(true)end function u.snap()return{rules=C:GetAttribute("AutoRollRules"),stop=C:GetAttribute("AutoRollStop"),
on=C:GetAttribute("AutoRollOn"),main=C:GetAttribute("AutoRoll")}end u.cache={}function u.watchCache()u.cache=u.snap()
for qM,k9 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do L(C:GetAttributeChangedSignal(k9):Connect(function()u.cache[qM]=C:GetAttribute(k9)end))
end end function u.isOn()return C:GetAttribute("AutoRollOn")==true end function u.saw(qN,...)local ej=u.cache
local qO={m=qN,n=select("#",...),args={...},before={rules=ej.rules,stop=ej.stop,on=ej.on,main=ej.main}}task.delay(1.5,function()
if a.alive then pcall(u.learnOne,qO)end end)end function u.learnOne(cG)local ag,cH=u.snap(),cG.before local ek=(ag.rules~=cH.rules)or(ag.stop~=cH.stop)
local k_=(ag.on~=cH.on)or(ag.main~=cH.main)if not ek and not k_ then return end local la={}for lb=1,cG.n do local ar=cG.args[lb]
local br=type(ar)if br=="string"and ar~=""and ar==ag.rules then ar={__slot="rules"}elseif br=="string"and ar~=""and ek and ar==ag.stop and ag.stop~=cH.stop then ar={__slot="stop"}
elseif br=="table"then local lc={}for qP,bP in pairs(ar)do if type(bP)=="table"or(type(bP)=="userdata")then u.msg="Auto Roll sends something I cannot repeat"return
end lc[qP]=(type(bP)=="string"and bP~=""and bP==ag.rules)and{__slot="rules"}or bP end ar=lc elseif br~="string"and br~="number"and br~="boolean"and br~="nil"then
if ar==C then ar={__slot="player"}else u.msg="Auto Roll sends something I cannot repeat"return end end la[lb]=ar
end local bQ={m=cG.m,n=cG.n,args=la}if ek then local gG=false for qQ=1,bQ.n do local cI=bQ.args[qQ]if type(cI)=="table"and cI.__slot=="rules"then gG=true end
if type(cI)=="table"and not cI.__slot then for ut,ld in pairs(cI)do if type(ld)=="table"and ld.__slot=="rules"then gG=true end end
end end if gG then u.rec.rules={bQ}else table.insert(u.rec.rules,bQ)if#u.rec.rules>60 then table.remove(u.rec.rules,1)end
end end if k_ then if ag.on==true then u.rec.on=bQ else u.rec.off=bQ end e.AutoRoll=(ag.on==true)end if ag.rules and ag.rules~=""then e.ARrules,e.ARstop=ag.rules,ag.stop or""end
Q.dirty=true u.msg=""o(("learned an Auto Roll %s message"):format(ek and"choices"or(ag.on and"on"or"off")))end
function u.resolve(bR)if type(bR)~="table"then return bR end if bR.__slot=="rules"then return e.ARrules~=""and e.ARrules or C:GetAttribute("AutoRollRules")end
if bR.__slot=="stop"then return e.ARstop~=""and e.ARstop or C:GetAttribute("AutoRollStop")end if bR.__slot=="player"then return C end
local le={}for qR,qS in pairs(bR)do le[qR]=u.resolve(qS)end return le end function u.replay(lf,qT)local lg=table.unpack or unpack
for uu,cJ in ipairs(qT)do local gH={}for lh=1,cJ.n do gH[lh]=u.resolve(cJ.args[lh])end u.replaying=true pcall(function()
if cJ.m=="InvokeServer"then task.spawn(function()pcall(function()lf:InvokeServer(lg(gH,1,cJ.n))end)end)else lf:FireServer(lg(gH,1,cJ.n))end
end)u.replaying=false task.wait(0.25)end end function u.apply(li,qU)if u.busy or not a.alive then return end u.busy=true
pcall(function()local lj=au:FindFirstChild("Remotes")local gI=lj and lj:FindFirstChild("AutoRollAction")if not gI then u.msg="this game has no AutoRollAction"return end
local a5=e.AutoRoll if a5 and e.ARrules~=""and C:GetAttribute("AutoRollRules")~=e.ARrules then if#u.rec.rules==0 then
u.msg="pick your Auto Roll choices once in the game's menu so I can learn them"o(u.msg)else u.replay(gI,u.rec.rules)
if ad(function()return C:GetAttribute("AutoRollRules")==e.ARrules end,4)then o("Auto Roll choices put back")else
u.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"o(u.msg)end end end if a5==u.isOn()or(not a5 and not qU)then return end
local el=a5 and u.rec.on or u.rec.off if not el then local cK=a5 and u.rec.off or u.rec.on local lk=cK~=nil for qV=1,cK and cK.n or 0 do
if type(cK.args[qV])=="boolean"then lk=false end end if lk then el=cK end end if not el then u.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(a5 and"on"or"off")
o(u.msg)return end u.replay(gI,{el})if ad(function()return u.isOn()==a5 end,4)then u.msg=""o(("Auto Roll switched %s%s"):format(a5 and"ON"or"OFF",li and(" ("..li..")")or""))
else u.msg="Auto Roll did not switch - do it once in the game so I can relearn it"o(u.msg)end end)u.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local qW,qX=pcall(function()return C.UserId end)return qW and qX or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local qY,gJ=pcall(function()return require(au:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if qY and type(gJ)=="table"and type(gJ.Pets)=="table"then j.I=gJ end return j.I end function j.order()if j.list then return j.list end
local a6=j.info()if not a6 then return{}end local bs={}if type(a6 .Order)=="table"and#a6 .Order>0 then for uv,ll in ipairs(a6 .Order)do if a6 .Pets[ll]then bs[#bs+1]=ll end end
else for qZ in pairs(a6 .Pets)do bs[#bs+1]=qZ end table.sort(bs,function(q0,q1)return(a6 .Pets[q0].price or 0)<(a6 .Pets[q1].price or 0)end)
end j.list=bs return bs end function j.nice(lm,gK)local ln=j.info()local lo=ln and ln.Pets[lm]return((gK and gK~="")and(gK.." ")or"")..(lo and lo.displayName or tostring(lm))
end function j.data()local lp=C:GetAttribute("PetsData")if type(lp)~="string"then return nil end local q2,lq=pcall(function()return j.HS:JSONDecode(lp)end)
return(q2 and type(lq)=="table")and lq or nil end function j.pen()return au:FindFirstChild("PetMeadowSpawns")end
function j.srv()return aB:GetServerTimeNow()end function j.money()local gL=C:FindFirstChild("MoneyValue")if gL and type(gL.Value)=="number"then return gL.Value end
return aF()or 0 end function j.wishes()local lr=j.pen()local ls=lr and lr:GetAttribute("Wishes")local gM,lt={},j.srv()
if type(ls)~="string"then return gM end local q3,lu=pcall(function()return j.HS:JSONDecode(ls)end)if q3 and type(lu)=="table"then
for q4,gN in pairs(lu)do if type(gN)=="number"and gN>lt then gM[q4]=gN-lt end end end return gM end function j.call(...)
local lv=au:FindFirstChild("Remotes")local lw=lv and lv:FindFirstChild("PetRequest")if not lw then return nil end
local lx=table.pack(...)local bt={}task.spawn(function()bt.ok,bt.v=pcall(function()return lw:InvokeServer(table.unpack(lx,1,lx.n))end)
bt.done=true end)local q5=q()while not bt.done and q()-q5<6 do task.wait(0.05)end if bt.done and bt.ok then return bt.v end
return nil end function j.want(q6)return e.Pets[q6]end function j.buyTick()if not e.PetBuy then j.buyMsg="auto adopt is off"return end
local gO,ly,gP=j.info(),j.pen(),j.data()if not(gO and ly and gP)then j.buyMsg="pet data not loaded yet"return end
j.tryAt=j.tryAt or{}local cL,gQ=#(gP.pets or{}),tonumber(gP.maxOwned)or 60 local q7,lz,cM=j.srv(),{},nil for uw,aw in ipairs(ly:GetChildren())do
lz[aw.Name]=true local cN,lA=aw:GetAttribute("Pet"),aw:GetAttribute("Variant")or""local gR=cN and j.want(cN)if gR and gR.b and gO.Pets[cN]and(not gR.g or lA=="Big")and not aw:GetAttribute("A_"..j.uid)
and(tonumber(aw:GetAttribute("ExpiresAt"))or 0)>q7+1 and q()>=(j.tryAt[aw.Name]or 0)then local cO,lB=j.nice(cN,lA),gO.Pets[cN].price or 0
if cL>=gQ then cM=("%s is in the pen, but you have %d/%d pets"):format(cO,cL,gQ)j.tryAt[aw.Name]=q()+15 elseif j.money()<lB then
cM=("%s is in the pen - need $%s"):format(cO,ap(lB))j.tryAt[aw.Name]=q()+5 else j.tryAt[aw.Name]=q()+8 local bS=j.call("adopt",aw.Name)
if type(bS)=="table"and bS.ok then cL=cL+1 j.buys=(j.buys or 0)+1 o("ADOPTED "..cO)cM="adopted "..cO else local lC=type(bS)=="table"and tostring(bS.reason or"no reason given")or"no answer"
o(("adopt %s failed: %s"):format(cO,lC))cM="adopt failed: "..lC if type(bS)=="table"and bS.bagFull then j.tryAt[aw.Name]=q()+60 end
end end end end for lD in pairs(j.tryAt)do if not lz[lD]then j.tryAt[lD]=nil end end j.buyMsg=cM or("watching the pen (%d/%d pets)"):format(cL,gQ)
end function j.wishTick()if not e.PetWish then j.wishMsg="auto wish is off"return end local em=j.info()if not(em and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local en,gS,a7=j.wishes(),0,nil local q8=(type(em.Wish)=="table"and em.Wish.cashShare)or 2
for ux,ak in ipairs(j.order())do local lE=j.want(ak)if lE and lE.w then gS=gS+1 if not en[ak]and q()>=(j.wishTry[ak]or 0)then
local gT=tonumber(C:GetAttribute("PetWishCredits"))or 0 local gU=math.floor((em.Pets[ak].price or 0)*q8)if gT<=0 and j.money()<gU then
j.wishTry[ak]=q()+10 a7=("need $%s to wish for %s"):format(ap(gU),j.nice(ak))j.wishWhy[ak]=a7 else j.wishTry[ak]=q()+3
local q9=gT>0 and"wishCredit"or"wish"local eo=j.call(q9,ak)if type(eo)=="table"and eo.ok then j.wishN,j.wishWhy[ak]=j.wishN+1,nil
o(("WISHED for %s (%s)"):format(j.nice(ak),gT>0 and"free wish"or("$"..ap(gU))))else local gV=type(eo)=="table"and tostring(eo.reason or"no reason given")or"no answer"
if gV:lower():find("already",1,true)then j.wishTry[ak]=q()+2 else o(("wish %s failed: %s"):format(j.nice(ak),gV))a7="wish failed: "..gV end
end end end end end if not a7 then for uy,ep in ipairs(j.order())do local lF=j.want(ep)if lF and lF.w and not en[ep]and j.wishWhy[ep]then a7=j.wishWhy[ep]break end
end end if not a7 then local eq={}for uz,er in ipairs(j.order())do local lG=j.want(er)if lG and lG.w and en[er]then eq[#eq+1]=("%s %dm"):format(j.nice(er),math.ceil(en[er]/60))end
end a7=gS==0 and"no pet has WISH ticked"or("running: "..(#eq>0 and table.concat(eq,", ")or"none yet"))end j.wishMsg=a7
end r.switches,r.glazed,r.finished=0,0,0 function r.teams()local gW=j.data()return(gW and gW.teams)or{},gW end
function r.current(bT)bT=bT or j.data()if not bT then return""end local lH={}for uA,q_ in ipairs(bT.equipped or{})do lH[tostring(q_)]=true end
for uB,lI in ipairs(bT.teams or{})do local lJ=lI.pets or{}local gX=#lJ==#(bT.equipped or{})if gX then for uC,ra in ipairs(lJ)do if not lH[tostring(ra)]then gX=false break end end end
if gX then return lI.name end end return""end function r.equip(gY)local rb,rc=r.teams()local gZ for rd,re in ipairs(rb)do if re.name==gY then gZ=rd break end end
if not gZ then r.msg="no saved team called "..tostring(gY)return false end if r.current(rc)==gY then return true end
for uD=1,4 do local lK=j.call("teamEquip",gZ)if type(lK)=="table"and lK.ok then r.switches=r.switches+1 return true
end task.wait(0.4)end return false end function r.waxes()local cP={}local lL=a.plot and a.plot:FindFirstChild("WaxStations")
if not lL then return cP end for uE,bu in ipairs(lL:GetChildren())do local lM=tonumber(bu:GetAttribute("PourEnd"))
local lN=bu:GetAttribute("PourOwner")if bu:GetAttribute("HasSquishy")and lM and(lN==nil or lN==j.uid)then local lO,lP=bu:FindFirstChild("SquishyPlaceHolder"),"?"
if lO then for uF,lQ in ipairs(lO:GetChildren())do if lQ:IsA("Model")then lP=lQ.Name break end end end local rf=tostring(bu:GetAttribute("Helpers")or"")
local g0=0 for uG in rf:gmatch("%d+")do g0=g0+1 end cP[#cP+1]={st=bu,ends=lM,id=bu:GetAttribute("PourId"),name=lP,helps=g0}
end end table.sort(cP,function(rg,rh)return rg.ends<rh.ends end)return cP end function r.glazeCount()local lR=au:FindFirstChild("Remotes")
local lS=lR and lR:FindFirstChild("EditStack")if not lS then return nil end local ri,cQ=pcall(function()return lS:InvokeServer("State",nil)end)
if not(ri and type(cQ)=="table"and type(cQ.state)=="table")then return nil end local g1,g2=0,{}for uH,es in ipairs(cQ.state.entries or{})do
if es.glaze and es.glaze~=""then g1=g1+1 g2[es.glaze]=(g2[es.glaze]or 0)+1 end end return g1,g2,#(cQ.state.entries or{}),cQ.state.capacity
end function r.finishedOne(et,lT)r.finished=r.finished+1 task.wait(2)local g3,rj,lU,rk=r.glazeCount()if g3 and lT and g3>lT then
r.glazed=r.glazed+1 local g4={}for rl,rm in pairs(rj)do g4[#g4+1]=rl.." "..rm end o(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(T(N(et.name)),et.st.Name,g3,table.concat(g4,", ")))
else o(("wax done on station %s: %s, no glaze%s"):format(et.st.Name,T(N(et.name)),lU and(" (stack "..lU.."/"..tostring(rk)..")")or""))
end end function r.tick()r.list=r.waxes()if not e.Teams then r.want,r.msg="","auto teams is off"return end local g5=j.srv()
local a8=r.glazeFor if a8 then local eu=a8 .st local rn=eu.Parent and eu:GetAttribute("HasSquishy")and eu:GetAttribute("PourId")==a8 .id
if not rn or g5>a8 .ends+40 then r.glazeFor,r.afterUntil=nil,q()+1.5 local ro=a8 .before task.spawn(function()pcall(r.finishedOne,a8,ro)end)
else a8 .ends=tonumber(eu:GetAttribute("PourEnd"))or a8 .ends end end if e.TeamGlaze~=""and not r.glazeFor then
for uI,g6 in ipairs(r.list)do if g6 .ends-g5<=e.GlazeLead then r.glazeFor=g6 task.spawn(function()g6 .before=r.glazeCount()end)
break end end end local al=""if e.TeamGlaze~=""and(r.glazeFor or q()<(r.afterUntil or 0))then al=e.TeamGlaze elseif r.placing and e.TeamWax~=""then al=e.TeamWax
else al=e.TeamNormal end r.want=al local cR=r.current()r.cur=cR if al~=""and cR~=al and q()>=(r.nextTry or 0)then
r.nextTry=q()+1.1 if r.equip(al)then local rp=(al==e.TeamGlaze and r.glazeFor)and(" - station "..r.glazeFor.st.Name.." finishes soon")
or((al==e.TeamWax and r.placing)and" - placing a butter"or"")o("team: "..al..rp)else r.nextTry=q()+3 end end local g7=r.list[1]
r.msg=("on: %s%s | next wax done %s"):format(cR~=""and cR or"(not a saved team)",(al~=""and al~=cR)and(" -> "..al)or"",
g7 and("in "..r.clock(g7 .ends-g5).." (st "..g7 .st.Name..")")or"- none running")end function r.clock(a9)a9=math.max(0,math.floor(a9))
if a9>=3600 then return("%d:%02d:%02d"):format(math.floor(a9/3600),math.floor((a9%3600)/60),a9%60)end return("%d:%02d"):format(math.floor(a9/60),a9%60)
end function r.glazeSoon()return e.Teams and e.TeamGlaze~=""and(r.glazeFor~=nil or q()<(r.afterUntil or 0))end
l.bb,l.fx,l.post,l.hud={},{},{},{}l.mem,l.memPeak,l.fps=0,0,0 function l.isFx(bv)return bv:IsA("ParticleEmitter")or bv:IsA("Trail")or bv:IsA("Beam")or bv:IsA("Fire")or bv:IsA("Smoke")
or bv:IsA("Sparkles")or bv:IsA("Light")end function l.muteOne(ax)if not e.Lite or not ax.Parent then return end
if ax:IsA("BillboardGui")then if l.bb[ax]==nil and ax.Enabled then l.bb[ax]=true ax.Enabled=false end elseif l.isFx(ax)then
if l.fx[ax]==nil and ax.Enabled then l.fx[ax]=true ax.Enabled=false end end end function l.lite(lV)e.Lite=lV if lV then
task.spawn(function()for rq,rr in ipairs(aB:GetDescendants())do if not e.Lite then return end pcall(l.muteOne,rr)
if rq%600==0 then task.wait()end end end)if not l.addConn then l.queue={}l.addConn=L(aB.DescendantAdded:Connect(function(g8)
if e.Lite and(g8:IsA("BillboardGui")or l.isFx(g8))then l.queue[#l.queue+1]=g8 end end))end local g9=game:GetService("Lighting")
for uJ,cS in ipairs(g9:GetChildren())do if cS:IsA("PostEffect")and cS.Enabled and l.post[cS]==nil then l.post[cS]=true cS.Enabled=false end
end pcall(function()l.oldShadows=l.oldShadows==nil and g9 .GlobalShadows or l.oldShadows g9 .GlobalShadows=false end)
pcall(function()l.oldDeco=l.oldDeco==nil and aB.Terrain.Decoration or l.oldDeco aB.Terrain.Decoration=false end)
else for lW in pairs(l.bb)do pcall(function()if lW.Parent then lW.Enabled=true end end)end for lX in pairs(l.fx)do pcall(function()if lX.Parent then lX.Enabled=true end end)end
for lY in pairs(l.post)do pcall(function()if lY.Parent then lY.Enabled=true end end)end l.bb,l.fx,l.post,l.queue={},{},{},{}
local rs=game:GetService("Lighting")if l.oldShadows~=nil then pcall(function()rs.GlobalShadows=l.oldShadows end)l.oldShadows=nil end
if l.oldDeco~=nil then pcall(function()aB.Terrain.Decoration=l.oldDeco end)l.oldDeco=nil end end end l.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function l.hideHud(lZ)e.HideHud=lZ local g_=C:FindFirstChildOfClass("PlayerGui")if not g_ then return end if lZ then
for uK,cT in ipairs(g_:GetChildren())do if cT:IsA("ScreenGui")and not l.MINE[cT.Name]and cT.Enabled then l.hud[cT]=true cT.Enabled=false end
end if not l.hudConn then l.hudConn=L(g_.ChildAdded:Connect(function(cU)if e.HideHud and cU:IsA("ScreenGui")and not l.MINE[cU.Name]then
task.defer(function()if e.HideHud and cU.Enabled then l.hud[cU]=true cU.Enabled=false end end)end end))end else
for l0 in pairs(l.hud)do pcall(function()if l0 .Parent then l0 .Enabled=true end end)end l.hud={}end end l.CAPS={0,30,15,10}
function l.cap(ha)e.FpsCap=ha local l1=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not l1 then return false end return pcall(l1,ha==0 and 60 or ha)end function l.render(l2)e.NoRender=l2 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not l2)end)
end function l.restoreAll()pcall(l.lite,false)pcall(l.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(l.cap,0)end end function l.rejoinSame(l3)if a.rejoining then return end o("REJOIN this server ("..l3 ..")")
pcall(dt)if a.autoload then pcall(dS,a.autoload)end fW()local rt=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,C)
end)task.delay(25,function()if a.alive then ck(l3 ..", same server failed")end end)return rt end function l.tick()
local hb=l.queue if e.Lite and hb and#hb>0 then l.queue={}for ru,rv in ipairs(hb)do pcall(l.muteOne,rv)if ru%300==0 then task.wait()end end
end local rw,cV=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if rw and type(cV)=="number"then
l.mem=cV l.memPeak=math.max(l.memPeak,cV)if(e.MemLimit or 0)>0 and cV>e.MemLimit then l.over=(l.over or 0)+1 if l.over>=30 and not a.busy then
l.over=-600 l.rejoinSame(("memory %d MB > %d MB"):format(cV,e.MemLimit))end elseif(l.over or 0)>0 then l.over=0
end end if q()-(l.noteAt or 0)>1800 then l.noteAt=q()o(("health: %d fps, %d MB (peak %d)"):format(math.floor(l.fps+0.5),l.mem,l.memPeak))
end end a.sellWords={"sell","trash","discard","dispose","bin"}local function hc(ev)if type(ev)~="string"then return false end
ev=ev:lower()for uL,rx in ipairs(a.sellWords)do if ev:find(rx,1,true)then return true end end return false end
local function ry()local l4=au:FindFirstChild("Remotes")local hd=l4 and l4:FindFirstChild("SellSquishy")if not(hd and hd:IsA("RemoteEvent"))then return false end
if not pcall(function()hd:FireServer()end)then return false end return ad(function()return O()==nil end,1.5)end
local function rz()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end if q()-a.sellSearchAt<20 then return nil end
a.sellSearchAt=q()local l5=aG()local l6=l5 and l5 .HumanoidRootPart.Position local cW,l7 for uM,bU in ipairs((a.plot or aB):GetDescendants())do
if bU:IsA("ProximityPrompt")and(hc(bU.ActionText)or hc(bU.ObjectText)or hc(bU.Name))then local l8=iD(bU)local he=(l8 and l6)and(l8-l6).Magnitude or 1e9
if he<=400 and(not cW or he<l7)then cW,l7=bU,he end end end a.sellSpot=cW a.noSellSpot=(cW==nil)return cW end
local function l9()local hf=O()if not hf then a.holding=false return false end if aV(hf)then return false end
local hg=T(N(hf))if ry()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=q()+2.5,0
o("SOLD "..hg)return true end local bV=rz()if bV then local l_=b9(bV)if l_ then co(l_,bV)local ma=O()if ma and not aV(ma)then
local rA,rB=d4(bV,function()return O()==nil end,function()return bV.Enabled end)if rA then a.sold,a.holding,a.sellFails=a.sold+1,false,0
o(("SOLD %s at %s via %s"):format(hg,dp(bV),rB))return true end end end end a.sellFails=a.sellFails+1 o("could not sell "..hg.." ("..a.sellFails..")")
return false end local rC={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function rD(bW)local ew=dp(bW):lower()for uN,rE in ipairs(rC)do if ew:find(rE,1,true)then return 0 end end
local aE,V=bW.Name:lower(),0 local function ay(rF,rG)return rF:find(rG,1,true)~=nil end if ay(aE,"collect")then V=V+60 end
if ay(aE,"cash")or ay(aE,"money")then V=V+45 end if ay(aE,"income")or ay(aE,"claim")then V=V+35 end if ay(aE,"coin")or ay(aE,"earn")or ay(aE,"green")then V=V+20 end
if aE=="pad"or aE=="touch"then V=V+25 end if V==0 and(ay(ew,"collect")or ay(ew,"cash")or ay(ew,"money"))then V=25 end
if V==0 then return 0 end local cX=bW.Color if cX.G>0.5 and cX.G>cX.R*1.4 and cX.G>cX.B*1.4 then V=V+15 end if math.min(bW.Size.X,bW.Size.Y,bW.Size.Z)<2 then V=V+5 end
return V end local function rH()if a.padPart and a.padPart.Parent then return a.padPart end if not a.plot or q()-a.padSearchAt<20 then return nil end
a.padSearchAt=q()local ex,cY,hh={},nil,29 for uO,ey in ipairs(a.plot:GetDescendants())do if ey:IsA("BasePart")then
local ez=rD(ey)if ez>0 then ex[#ex+1]={s=ez,p=ey}if ez>hh then cY,hh=ey,ez end end end end table.sort(ex,function(rI,rJ)return rI.s>rJ.s end)
a.padCands,a.padPart=ex,cY if cY then o("collect pad: "..dp(cY).." (score "..hh..")")end return cY end local hi="SAB_pad_v1.txt"
local function rK(rL)if type(writefile)=="function"then pcall(writefile,hi,table.concat({rL:GetComponents()},","))end
end local function rM()if type(isfile)~="function"or type(readfile)~="function"then return nil end local rN,mb=pcall(function()if isfile(hi)then return readfile(hi)end end)
if not rN or type(mb)~="string"then return nil end local eA={}for rO in mb:gmatch("[^,]+")do eA[#eA+1]=tonumber(rO)end
if#eA==12 then return CFrame.new(unpack(eA))end end local function rP(hj,eB,rQ)local rR=f5(hj)local hk=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local az=(hk and hk:IsA("BasePart"))and(hk.Position-eB)or Vector3 .new(1,0,0)az=Vector3 .new(az.X,0,az.Z)if az.Magnitude<0.05 then az=Vector3 .new(1,0,0)end
az=az.Unit for rS=0,7 do local eC=rS*math.pi/4 local rT=Vector3 .new(az.X*math.cos(eC)-az.Z*math.sin(eC),0,az.X*math.sin(eC)+az.Z*math.cos(eC))
local eD=eB+rT*(rQ+5)local hl=jX(eD.X,eB.Y,eD.Z)if hl and math.abs(hl.Y-eB.Y)<8 then cn(hj,Vector3 .new(eD.X,hl.Y+rR,eD.Z))
if f6(hj,0.7)then return true end end end return false end local function rU()a.lastCollect=q()local cZ=aG()if not cZ then return end
local mc,rV=cZ.HumanoidRootPart,f5(cZ)local c0,md,c1,hm=nil,4,nil,"?"local hn=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if a.manualPad and hn and hn:IsA("BasePart")then c0,hm=(hn.CFrame*a.manualPad).Position,"manual pad"else local aO=rH()
if aO then c0=Vector3 .new(aO.Position.X,aO.Position.Y+aO.Size.Y/2+rV,aO.Position.Z)md,c1,hm=math.max(aO.Size.X,aO.Size.Z)/2,aO,aO.Name
end end if not c0 then o("COLLECT: pad not found - stand on it and tap SET PAD")return end local ho=aF()cn(cZ,c0)
if c1 and type(firetouchinterest)=="function"then pcall(firetouchinterest,mc,c1,0)end ao(e.PadDwell)if c1 and type(firetouchinterest)=="function"then pcall(firetouchinterest,mc,c1,1)end
ao(0.5)a.collected=a.collected+1 local hp=aF()o(("COLLECTED (%s) %s"):format(hm,(ho and hp and hp>ho)and("+$"..ap(hp-ho))or"no cash change seen"))
rP(cZ,c0,md)end local c2 local function me()if a.capHit then if e.AutoStart and q()-(a.capAt or 0)>300 then a.capHit,a.placeFails=false,0
o("trying again after being stopped for 5 minutes")c2(true,true)else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end
if not aG()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aW(),nil,nil
if not a.plot then return nil,"own plot not found yet","wait"end end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local hq,mf=iK()local eE=O()if eE then local bX=T(N(eE))if not aV(eE)then local hr=(F.gift and N(F.gift)==N(eE)and q()-F.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bX,hr),"bad"end if a.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bX,hr),"bad"end return"sell",("selling %s (%s)"):format(bX,hr),"warn"
end if hq<1 then return nil,("holding %s - 0 free stations"):format(bX),"wait"end if r.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(bX),"wait"end
return"place",("waxing %s (%d free)"):format(bX,hq),"ok"end a.holding=false if e.Crates and not d.waiting and q()-(d.scanAt or 0)>1 and q()>(d.quietUntil or 0)then
d.scanAt=q()local hs=a.plot:FindFirstChild("CrateStand")if hs then for uP,c3 in ipairs(hs:GetDescendants())do
if c3:IsA("ProximityPrompt")and c3 .Enabled and gk(c3)then local aP=c3 .ObjectText if aP==""then aP=bF(hs,"TitleLabel")or""end
if aP~=""and A.wanted(aP)then local rW=dm(aP):gsub("crate$","")local mg for mh in pairs(K.members)do if dm(mh)==rW then mg=mh end end
d.waiting,d.at,d.title,d.prompt=true,q(),aP,c3 d.data={name=(aP:gsub("%s","")),rarity=mg,title=aP}o(aP.." found waiting on your stand")
end break end end end end local mi=A.wanted(d.data and d.data.name)or A.wanted(d.title)if e.Crates and(d.on or d.waiting)and mi then
local aQ=d.title if q()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aQ),"bad"
end if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=q()+120,0 o("could not press the "..aQ.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aQ),"bad"end if q()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aQ),"bad"
end if d.byYou and q()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aQ,math.ceil(60-(q()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aQ),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(aQ),"bad"end if q()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aQ),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aQ,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not mi then local mj=d.title..tostring(d.rolledAt)if d.told~=mj then d.told=mj o(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and q()-d.rolledAt<6 and A.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if hq<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(mf,mf),"wait"
end local ht=iR()if not ht then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c4=cl()
if c4 and kg(c4 .name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(c4 .name),"idle"end
if q()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c4 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(c4 .name),"ok"
end local a_=f3()if a_.state~="match"then a.matchSince=nil if a_.state=="skip"and not ht.Enabled then return nil,a_.text.." (sold out)","idle"end
return nil,a_.text,a_.level end if not ht.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local c5=q()if c5<a.noCashUntil then local mk,rX=jP()if mk then return nil,("cash short: have $%s, price ~$%s"):format(ap(mk),ap(rX)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ap(aF()),math.ceil(a.noCashUntil-c5)),"bad"end if c5-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
a.matchSince=a.matchSince or c5 local ml=c5-a.matchSince if ml<e.Confirm then return nil,("confirming %s (%.2fs)"):format(a_.shown,ml),"ok"end
return"buy",("buying %s via %s"):format(a_.shown,a_.src),"ok"end local function as(rY,rZ,...)if a.busy then return end
a.busy,a.busyText=true,rY local r0,mm=pcall(rZ,...)a.busy,a.busyText=false,""if not r0 and mm~=e_ then o("ERR "..tostring(mm))end
end local function r1()local bw,r2,r3=me()a.reason,a.level=r2,r3 if bw=="place"then as("waxing...",r.place)elseif bw=="crate"then as("opening crate...",ec,true)
elseif bw=="cratesmart"then as("opening crate...",d.smart)elseif bw=="cratewin"then as("opening the crate window...",gm)
elseif bw=="nocrate"then as("discarding crate...",ec,false)elseif bw=="sell"then as("selling...",l9)elseif bw=="buy"then as("buying...",j8,false)
elseif e.Collect and not a.matchSince and q()-a.lastCollect>=e.Every then as("collecting money...",rU)end end
function c2(eF,r4)if eF==a.running then return end a.running=eF if not r4 then e.AutoStart=eF end if eF then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=q()a.plot=aW()or a.plot
o("START")else a.reason="stopped"o("STOP")end end do local ba=fM(af.auto)if type(ba)=="string"then ba=ba:gsub("%s+$","")
if ba~=""then a.autoload=ba local r5=jB(ba)o(r5 and("loaded config "..ba)or("config "..ba.." could not be loaded"))
end end end local f={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local r6={ok=f.good,wait=f.warn,warn=f.warn,bad=f.bad,idle=f.dim}local mn={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function D(r7,r8,r9)local r_,hu=pcall(Instance.new,r7)
if not r_ then a.uiErrs=a.uiErrs+1 return nil end for sa,sb in pairs(r8)do if not pcall(function()hu[sa]=sb end)then a.uiErrs=a.uiErrs+1 end
end hu.Parent=r9 return hu end local function aa(sc,sd)D("UICorner",{CornerRadius=UDim.new(0,sd or 6)},sc)end
local c={}local hv=C:FindFirstChildOfClass("PlayerGui")or C:WaitForChild("PlayerGui")local mo=hv:FindFirstChild("SABFarmGui")
if mo then mo:Destroy()end local hw=D("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},hv)
local W={w=320,h=330,head=30,strip=38,tabs=26}c.root=D("Frame",{Name="Root",Size=UDim2 .new(0,W.w,0,W.h),Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),
BackgroundColor3=f.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},hw)aa(c.root,10)D("UIStroke",{Color=f.line,Thickness=1},c.root)
local aR=UDim2 .new(1,0,1,0)local function y(mp,mq)return UDim2 .new(mp,0,0,0),UDim2 .new(mq,(mp+mq>0.99)and 0 or-4,1,0)end
local function x(se,sf,sh,si,sj,sk)local mr=D("TextButton",{Text=sf,Position=sj,Size=sk,BackgroundColor3=sh,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=si,TextColor3=f.text,AutoButtonColor=true},se)aa(mr,6)return mr end local function eG(sl,sm,sn,so,sp)
local hx=D("TextBox",{Text=sm,PlaceholderText=sn,Position=so,Size=sp,BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=f.text,PlaceholderColor3=f.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},sl)aa(hx,6)D("UIPadding",{PaddingLeft=UDim.new(0,8)},hx)
return hx end local eH=aB.CurrentCamera local function sq()local sr,eI=pcall(function()return eH and eH.ViewportSize end)
if sr and eI and eI.X>50 and eI.Y>50 then return eI end end local function bc(c6)local hy=sq()if not(hy and c6 and c6 .Parent)then return end
local ss=pcall(function()local eJ,ms=c6 .AbsolutePosition,c6 .AbsoluteSize local hz=70 local mt=math.clamp(eJ.X,hz-ms.X,hy.X-hz)
local mu=math.clamp(eJ.Y,0,hy.Y-math.min(ms.Y,hz))if math.abs(mt-eJ.X)>0.5 or math.abs(mu-eJ.Y)>0.5 then c6 .Position=UDim2 .new(0,math.floor(mt),0,math.floor(mu))
end end)return ss end local function eK(su)local sv,hA=pcall(function()return su.AbsolutePosition end)if sv and hA then return{math.floor(hA.X),math.floor(hA.Y)}end
end local eL={}local function mv(eM,mw,mx)L(eM.InputBegan:Connect(function(c7)if c7 .UserInputType~=Enum.UserInputType.MouseButton1 and c7 .UserInputType~=Enum.UserInputType.Touch then return end
eL[eM]={start=c7 .Position,from=mw.Position,moved=0,target=mw}local hB hB=c7 .Changed:Connect(function()if c7 .UserInputState==Enum.UserInputState.End then
local my=eL[eM]eL[eM]=nil if hB then hB:Disconnect()end if my and mx then mx(my.moved)end end end)end))end L(nJ.InputChanged:Connect(function(eN)
if eN.UserInputType~=Enum.UserInputType.MouseMovement and eN.UserInputType~=Enum.UserInputType.Touch then return end
for uQ,aS in pairs(eL)do local hC=aS.target if hC and hC.Parent then local mz,mA=eN.Position.X-aS.start.X,eN.Position.Y-aS.start.Y
aS.moved=math.max(aS.moved,math.abs(mz)+math.abs(mA))hC.Position=UDim2 .new(aS.from.X.Scale,aS.from.X.Offset+mz,aS.from.Y.Scale,aS.from.Y.Offset+mA)
end end end))local function E(sw,sx,sy,sz,sA,sB,sC)return D("TextLabel",{Text=sx,Position=sB or UDim2 .new(0,0,0,0),Size=sC or aR,BackgroundTransparency=1,
Font=sA and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=sy,TextColor3=sz,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},sw)
end c.title=D("Frame",{Size=UDim2 .new(1,0,0,W.head),BackgroundColor3=f.panel,BorderSizePixel=0,Active=true},c.root)
c.dot=D("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=f.dim,BorderSizePixel=0},c.title)
aa(c.dot,5)E(c.title,"SAB  BUTTER FARM  "..bA,12,f.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))c.minB=x(c.title,"-",f.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
c.xB=x(c.title,"X",f.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))c.strip=D("Frame",{Position=UDim2 .new(0,0,0,W.head),Size=UDim2 .new(1,0,0,W.strip),BackgroundColor3=f.bg,BorderSizePixel=0},c.root)
c.bar=D("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=f.warn,BorderSizePixel=0},c.strip)
aa(c.bar,2)c.reason=E(c.strip,"starting",12,f.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))c.tabs=D("Frame",{Position=UDim2 .new(0,0,0,W.head+W.strip),Size=UDim2 .new(1,0,0,W.tabs),BackgroundTransparency=1},c.root)
c.tabFarm=x(c.tabs,"FARM",f.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))c.tabBut=x(c.tabs,"BUTTERS",f.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabCrt=x(c.tabs,"CRATES",f.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabPet=x(c.tabs,"PETS",f.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabTeam=x(c.tabs,"TEAMS",f.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabSet=x(c.tabs,"SETUP",f.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function bY()local hD=D("ScrollingFrame",{Position=UDim2 .new(0,0,0,W.head+W.strip+W.tabs),Size=UDim2 .new(1,0,1,-(W.head+W.strip+W.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=f.line,CanvasSize=UDim2 .new(0,0,0,100)},c.root)
D("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},hD)D("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},hD)
return hD end c.farm,c.but,c.set,c.crt=bY(),bY(),bY(),bY()c.pet,c.team=bY(),bY()c.but.Visible,c.set.Visible,c.crt.Visible,c.pet.Visible,c.team.Visible=false,false,false,false,false
local eO,c8,z=0,12,nil local function am(mB,sD)eO,c8=eO+1,c8+mB+6 return D("Frame",{Size=UDim2 .new(1,0,0,mB),BackgroundTransparency=1,LayoutOrder=eO},sD or c.farm)
end local function c9(sE)E(am(14),sE,10,f.dim,true)end z=am(34)c.startB=x(z,"START",f.good,14,y(0,0.68))c.killB=x(z,"KILL",f.bad,14,y(0.68,0.32))
local sF=am(42)local function c_(mC,sG,hE)local hF=D("Frame",{Position=UDim2 .new((mC-1)/hE,0,0,0),Size=UDim2 .new(1/hE,mC<hE and-4 or 0,1,0),
BackgroundColor3=f.panel,BorderSizePixel=0},sF)aa(hF,6)local mD=E(hF,"0",15,f.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local sH=E(hF,sG,9,f.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))mD.TextXAlignment,sH.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return mD end c.sBought,c.sPlaced,c.sSold,c.sColl,c.sFree=c_(1,"BOUGHT",5),c_(2,"WAXED",5),c_(3,"SOLD",5),c_(4,"MONEY",5),c_(5,"FREE",5)
c.info=E(am(40),"",10,f.dim,false)c.tgt=E(am(26),"",10,f.good,false)c9("MONEY COLLECT")z=am(28)c.secB=eG(z,tostring(e.Every),"60",y(0,0.2))
E(z,"sec",11,f.dim,false,y(0.21,0.09))c.secSet=x(z,"SET",f.accent,12,y(0.3,0.2))c.colT=x(z,"COLLECT: ON",f.accent,11,y(0.5,0.5))
z=am(26)c.padB=x(z,"SET PAD (stand on it)",f.panel2,10,y(0,0.55))c.padL=E(z,"",10,f.dim,false,y(0.56,0.44))c9("BUTTERS YOU DID NOT TICK, AND CRATES")
z=am(28)c.sellT=x(z,"SELL THEM: ON",f.accent,11,y(0,0.55))c.sellB=x(z,"SELL NOW",f.warn,11,y(0.55,0.45))z=am(28)
c.crateT=x(z,"OPEN CRATES: ON",f.accent,11,y(0,0.55))c.crateB=x(z,"OPEN NOW",f.warn,11,y(0.55,0.45))c9("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
z=am(28)c.arT=x(z,"AUTO ROLL: OFF",f.panel2,11,y(0,0.5))c.arL=E(z,"",9,f.dim,false,y(0.52,0.48))c9("TOOLS")z=am(30)
c.buyB=x(z,"BUY",f.warn,10,y(0,0.5))c.plB=x(z,"WAX",f.good,10,y(0.5,0.5))c9("LOG")c.log=D("TextLabel",{Size=aR,BackgroundColor3=f.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=f.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},am(84))aa(c.log,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},c.log)
c.farm.CanvasSize=UDim2 .new(0,0,0,c8)eO,c8=0,12 local function ab(sI)return am(sI,c.set)end local function da(sJ)E(ab(14),sJ,10,f.dim,true)end
da("SETTINGS FILE  (saved on your phone)")z=ab(28)c.cfgName=eG(z,"default","config name",y(0,0.5))c.cfgSave=x(z,"SAVE",f.good,11,y(0.5,0.25))
c.cfgLoad=x(z,"LOAD",f.accent,11,y(0.75,0.25))z=ab(26)c.cfgPrev=x(z,"<",f.panel2,11,y(0,0.13))c.cfgPick=x(z,"(none saved)",f.panel2,10,y(0.13,0.74))
c.cfgNext=x(z,">",f.panel2,11,y(0.87,0.13))z=ab(26)c.cfgAuto=x(z,"LOAD IT ON LAUNCH: OFF",f.panel2,10,y(0,1))
c.cfgMsg=E(ab(26),"",10,f.dim,false)da("START BY ITSELF")z=ab(26)c.autoB=x(z,"INSTALL F.exec",f.accent,10,y(0,1))
c.autoMsg=E(ab(30),"",10,f.dim,false)z=ab(28)c.startT=x(z,"START FARMING ON LOAD: ON",f.accent,10,y(0,1))E(ab(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,f.dim,false)
da("IF THE GAME DROPS ME")z=ab(28)c.rejT=x(z,"AUTO REJOIN: ON",f.accent,11,y(0,0.55))c.rejB=x(z,"REJOIN NOW",f.warn,11,y(0.55,0.45))
c.rejMsg=E(ab(30),"",10,f.dim,false)da("SMOOTHER RUNNING  (for long / overnight runs)")z=ab(28)c.pfLite=x(z,"LITE MODE: OFF",f.panel2,10,y(0,0.5))
c.pfHud=x(z,"HIDE GAME HUD: OFF",f.panel2,10,y(0.5,0.5))z=ab(28)c.pfFps=x(z,"FPS CAP: GAME",f.panel2,10,y(0,0.5))
c.pfRender=x(z,"STOP 3D: OFF",f.panel2,10,y(0.5,0.5))z=ab(28)c.pfMem=eG(z,tostring(e.MemLimit),"2000",y(0,0.24))
E(z,"MB: rejoin this server above it (0 = never)",9,f.dim,false,y(0.26,0.52))c.pfMemSet=x(z,"SET",f.accent,11,y(0.8,0.2))
c.pfInfo=E(ab(18),"",10,f.text,false)E(ab(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,f.dim,false)
da("THE ROUND SAB BUTTON")E(ab(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,f.dim,false)
c.set.CanvasSize=UDim2 .new(0,0,0,c8)local mE=D("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},hv)
c.tgRoot=D("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=f.accent,BorderSizePixel=0,Active=true},mE)aa(c.tgRoot,26)D("UIStroke",{Color=f.line,Thickness=1},c.tgRoot)
c.tgBtn=D("TextButton",{Text="SAB",Size=aR,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=f.text,AutoButtonColor=false},c.tgRoot)
c.tgDot=D("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=f.dim,BorderSizePixel=0},c.tgRoot)
aa(c.tgDot,4)local aT={built=false,boxes={},at=0}local function mF(mG,hG)e.Targets[mG]=hG or nil local hH=aT.boxes[mG]
if hH then hH.Text=hG and"X"or""hH.BackgroundColor3=hG and f.good or f.panel2 end end local function hI()for sK,mH in pairs(aT.boxes)do
local mI=e.Targets[sK]==true mH.Text=mI and"X"or""mH.BackgroundColor3=mI and f.good or f.panel2 end end local db
local function sL()local sM=0 local hJ=D("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},c.but)
c.butInfo=E(hJ,"",10,f.dim,false,y(0,0.5))local sN=x(hJ,"CLEAR",f.panel2,10,y(0.5,0.24))local sO=x(hJ,"REFRESH",f.panel2,10,y(0.74,0.26))
sN.MouseButton1Click:Connect(function()for sP in pairs(e.Targets)do e.Targets[sP]=nil end hI()end)sO.MouseButton1Click:Connect(function()
K.at=0 fL()db(true)end)return sM end db=function(sQ)if not fL()then if not c.butEmpty then c.butEmpty=E(D("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},c.but),
"butter list not loaded yet - open this tab again in a moment",11,f.warn,false)end return end if aT.built and not sQ and aT.at==K.at then return end
for uR,hK in ipairs(c.but:GetChildren())do if hK:IsA("Frame")or hK:IsA("TextButton")then hK:Destroy()end end aT.boxes,c.butEmpty={},nil
sL()local hL,hM=36,1 local function mJ(mK)hM=hM+1 local sR=D("Frame",{Size=UDim2 .new(1,0,0,mK),BackgroundTransparency=1,LayoutOrder=hM},c.but)
hL=hL+mK+6 return sR end for uS,eP in ipairs(K.rarOrder)do local sS=mJ(24)local sT=mn[eP]or f.text local hN=D("Frame",{Size=aR,BackgroundColor3=f.panel,BorderSizePixel=0},sS)
aa(hN,6)E(hN,"  "..eP:upper(),11,sT,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local sU=x(hN,"ALL",f.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local sV=eP sU.MouseButton1Click:Connect(function()local mL=K.members[sV]or{}local mM=false for uT,sW in ipairs(mL)do if not e.Targets[sW]then mM=true break end end
for uU,sX in ipairs(mL)do mF(sX,mM)end end)for uV,hO in ipairs(K.members[eP]or{})do local sY=mJ(22)local eQ=D("TextButton",{Text="",Size=aR,BackgroundColor3=f.bg,BorderSizePixel=0,
AutoButtonColor=true},sY)aa(eQ,5)E(eQ,"   "..T(hO),11,f.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local hP=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=f.text,AutoButtonColor=false},eQ)aa(hP,4)aT.boxes[hO]=hP local mN=hO local function mO()mF(mN,not e.Targets[mN])end
eQ.MouseButton1Click:Connect(mO)hP.MouseButton1Click:Connect(mO)end end hI()c.but.CanvasSize=UDim2 .new(0,0,0,hL+10)
aT.built,aT.at=true,K.at end function A.paint()for sZ,mP in pairs(A.boxes)do local mQ=e.CrateTicks[sZ]==true mP.Text=mQ and"X"or""
mP.BackgroundColor3=mQ and f.good or f.panel2 end if c.crtInfo then local hQ,hR=0,0 for uW in pairs(A.boxes)do hQ=hQ+1 end
for uX,s0 in pairs(e.CrateTicks)do if s0 then hR=hR+1 end end c.crtInfo.Text=("%d crates, %d ticked"):format(hQ,hR)
end if c.crtAll then c.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"c.crtAll.BackgroundColor3=e.Crates and f.accent or f.panel2
end end function A.build()for uY,hS in ipairs(c.crt:GetChildren())do if hS:IsA("Frame")or hS:IsA("TextButton")then hS:Destroy()end
end A.boxes={}local hT,hU=12,0 local function eR(mR)hU=hU+1 hT=hT+mR+6 return D("Frame",{Size=UDim2 .new(1,0,0,mR),BackgroundTransparency=1,LayoutOrder=hU},c.crt)
end local hV=eR(28)c.crtInfo=E(hV,"",10,f.dim,false,y(0,0.5))local s1=x(hV,"CLEAR",f.panel2,10,y(0.5,0.24))local s2=x(hV,"REFRESH",f.panel2,10,y(0.74,0.26))
L(s1 .MouseButton1Click:Connect(function()e.CrateTicks={}A.paint()end))L(s2 .MouseButton1Click:Connect(function()A.build()end))
c.crtAll=x(eR(28),"",f.accent,11,y(0,1))L(c.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates A.paint()end))
E(eR(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,f.dim,false)
for uZ,aU in ipairs(A.list())do local s3=eR(24)local dc=D("TextButton",{Text="",Size=aR,BackgroundColor3=f.panel,BorderSizePixel=0,AutoButtonColor=true},s3)
aa(dc,5)E(dc,"  "..(aU.title or aU.name)..(aU.guess and"  (?)"or""),11,mn[aU.rar or""]or f.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
E(dc,aU.price and("$"..ap(aU.price))or(aU.rar or""),9,f.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local hW=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=f.text,AutoButtonColor=false},dc)aa(hW,4)A.boxes[aU.k]=hW local mS=aU.k local function mT()e.CrateTicks[mS]=(not e.CrateTicks[mS])or nil
A.paint()end L(dc.MouseButton1Click:Connect(mT))L(hW.MouseButton1Click:Connect(mT))end c.crt.CanvasSize=UDim2 .new(0,0,0,hT+10)
A.built=A.at A.paint()end local mU="farm"local function bd(ac)mU=ac c.farm.Visible,c.but.Visible,c.set.Visible=(ac=="farm"),(ac=="but"),(ac=="set")
c.crt.Visible=(ac=="crt")c.pet.Visible,c.team.Visible=(ac=="pet"),(ac=="team")c.tabCrt.BackgroundColor3=(ac=="crt")and f.accent or f.panel2
c.tabPet.BackgroundColor3=(ac=="pet")and f.accent or f.panel2 c.tabTeam.BackgroundColor3=(ac=="team")and f.accent or f.panel2
if ac=="pet"and not j.built then pcall(j.build)end if ac=="team"and not r.built then pcall(r.build)end if ac=="crt"and(A.built~=A.at or not next(A.boxes))then A.build()end
c.tabFarm.BackgroundColor3=(ac=="farm")and f.accent or f.panel2 c.tabBut.BackgroundColor3=(ac=="but")and f.accent or f.panel2
c.tabSet.BackgroundColor3=(ac=="set")and f.accent or f.panel2 if ac=="but"then db(false)end end local function M(mV,mW,s4,s5)
mV.Text=mW and s4 or s5 mV.BackgroundColor3=mW and f.accent or f.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(mX)
local dd=j.rows and j.rows[mX]if not dd then return end local eS=e.Pets[mX]or{}dd.b.BackgroundColor3=eS.b and f.good or f.panel2
dd.g.BackgroundColor3=eS.g and f.accent or f.panel2 dd.g.Text=eS.g and"BIG"or"ANY"dd.w.BackgroundColor3=eS.w and f.warn or f.panel2
end function j.flag(hX,hY)local bx=e.Pets[hX]or{}if bx[hY]then bx[hY]=nil else bx[hY]=true end e.Pets[hX]=(bx.b or bx.g or bx.w)and bx or nil
j.paintRow(hX)end function j.paintAll()for s6 in pairs(j.rows or{})do j.paintRow(s6)end if c.pbT then M(c.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(c.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")end end function j.live()if not j.built then j.build()return end
if q()-(j.liveAt or 0)<1 then return end j.liveAt=q()local mY=j.wishes()for hZ,s7 in pairs(j.rows)do s7 .name.Text=j.nice(hZ)..(mY[hZ]and("   * wish %dm"):format(math.ceil(mY[hZ]/60))or"")
end local eT=j.data()local mZ=tonumber(C:GetAttribute("PetWishCredits"))or 0 c.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eT and#(eT.pets or{})or 0,eT and tonumber(eT.maxOwned)or 60,
ap(j.money()),mZ>0 and(" | free wishes "..mZ)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local eU=j.info()for u0,h0 in ipairs(c.pet:GetChildren())do if h0:IsA("Frame")or h0:IsA("TextLabel")then h0:Destroy()end
end j.rows={}local h1,eV=0,12 local function bZ(m0)h1,eV=h1+1,eV+m0+6 return D("Frame",{Size=UDim2 .new(1,0,0,m0),BackgroundTransparency=1,LayoutOrder=h1},c.pet)
end local m1=bZ(28)c.pbT=x(m1,"AUTO ADOPT: OFF",f.panel2,10,y(0,0.5))c.pwT=x(m1,"AUTO WISH: OFF",f.panel2,10,y(0.5,0.5))
c.pbT.MouseButton1Click:Connect(function()e.PetBuy=not e.PetBuy j.paintAll()end)c.pwT.MouseButton1Click:Connect(function()e.PetWish=not e.PetWish j.paintAll()end)
c.pInfo=E(bZ(44),"",10,f.dim,false)E(bZ(40),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (costs 2x its price, 20 min, one per pet per server).",9,f.dim,false)
if not eU then E(bZ(30),"pet list not loaded yet - open this tab again in a moment",11,f.warn,false)c.pet.CanvasSize=UDim2 .new(0,0,0,eV)
j.built=false return end local b0={}for u1,m2 in ipairs(j.order())do local h2=eU.Pets[m2].rarity or"?"b0[h2]=b0[h2]or{}
table.insert(b0[h2],m2)end local b1={}for u2,m3 in ipairs(eU.Rarities or{})do if b0[m3]then b1[#b1+1]=m3 end end
for m4 in pairs(b0)do if not table.find(b1,m4)then b1[#b1+1]=m4 end end for u3,eW in ipairs(b1)do local m5=D("Frame",{Size=aR,BackgroundColor3=f.panel,BorderSizePixel=0},bZ(22))
aa(m5,6)E(m5,"  "..eW:upper(),11,j.RC[eW]or f.text,true)for u4,eX in ipairs(b0[eW])do local b2=D("Frame",{Size=aR,BackgroundColor3=f.bg,BorderSizePixel=0},bZ(38))
aa(b2,5)local s8=E(b2,j.nice(eX),11,j.RC[eW]or f.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-122,0,17))local s9,s_=pcall(function()return eU.describe(eX)end)
E(b2,s9 and tostring(s_)or"",9,f.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-122,0,17))local m6=x(b2,"BUY",f.panel2,9,UDim2 .new(1,-114,0.5,-11),UDim2 .new(0,34,0,22))
local m7=x(b2,"ANY",f.panel2,9,UDim2 .new(1,-77,0.5,-11),UDim2 .new(0,34,0,22))local m8=x(b2,"WISH",f.panel2,9,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,36,0,22))
local h3=eX m6 .MouseButton1Click:Connect(function()j.flag(h3,"b")end)m7 .MouseButton1Click:Connect(function()j.flag(h3,"g")end)
m8 .MouseButton1Click:Connect(function()j.flag(h3,"w")end)j.rows[eX]={b=m6,g=m7,w=m8,name=s8}end end c.pet.CanvasSize=UDim2 .new(0,0,0,eV+10)
j.built=true j.paintAll()end function l.paint()M(c.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")M(c.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")
M(c.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")M(c.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not c.pfMem:IsFocused()then c.pfMem.Text=tostring(e.MemLimit)end end function l.applyAll()if e.Lite then l.lite(true)end
if e.HideHud then l.hideHud(true)end if e.NoRender then l.render(true)end if(e.FpsCap or 0)~=0 then l.cap(e.FpsCap)end
l.paint()end L(c.pfLite.MouseButton1Click:Connect(function()l.lite(not e.Lite)l.paint()end))L(c.pfHud.MouseButton1Click:Connect(function()l.hideHud(not e.HideHud)l.paint()end))
L(c.pfRender.MouseButton1Click:Connect(function()l.render(not e.NoRender)l.paint()end))L(c.pfFps.MouseButton1Click:Connect(function()
local ta=table.find(l.CAPS,e.FpsCap or 0)or 1 local m9=l.CAPS[(ta%#l.CAPS)+1]if not l.cap(m9)and m9~=0 then o("this executor cannot cap fps")end
l.paint()end))L(c.pfMemSet.MouseButton1Click:Connect(function()local h4=tonumber(c.pfMem.Text)if h4 and h4>=0 then e.MemLimit=math.floor(h4)end
l.paint()end))function r.names()local h5={"(none)"}for u5,tb in ipairs((r.teams()))do h5[#h5+1]=tb.name end return h5
end function r.cycle(h6,tc)local eY=r.names()local td=e[h6]~=""and e[h6]or"(none)"local eZ=table.find(eY,td)or 1
eZ=((eZ-1+tc)%#eY)+1 e[h6]=eY[eZ]=="(none)"and""or eY[eZ]r.paint()end function r.paint()if not r.built then return end
M(c.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")local h7={}for u6,te in ipairs((r.teams()))do h7[te.name]=true end
for tf,m_ in pairs(r.pick)do local b3=e[tf]m_.Text=b3==""and"(none)"or(h7[b3]and b3 or(b3 .." (missing)"))m_.TextColor3=(b3~=""and not h7[b3])and f.bad or f.text
end if not c.tmLead:IsFocused()then c.tmLead.Text=tostring(e.GlazeLead)end c.tmInfo.Text=(r.msg or"")..("\nswitches %d | waxes finished %d | glazed %d"):format(r.switches,r.finished,r.glazed)
local tg,e0=j.srv(),{}for u7,e1 in ipairs(r.list or{})do e0[#e0+1]=("st %-2s %-22s %9s  helps %d"):format(e1 .st.Name,T(N(e1 .name)):sub(1,22),r.clock(e1 .ends-tg),e1 .helps)
end c.tmList.Text=#e0>0 and table.concat(e0,"\n")or"no waxes running"end function r.build()for u8,h8 in ipairs(c.team:GetChildren())do
if h8:IsA("Frame")or h8:IsA("TextLabel")then h8:Destroy()end end r.pick={}local h9,h_=0,12 local function by(na)
h9,h_=h9+1,h_+na+6 return D("Frame",{Size=UDim2 .new(1,0,0,na),BackgroundTransparency=1,LayoutOrder=h9},c.team)
end local function e2(th)E(by(14),th,10,f.dim,true)end local function ia(e3)local ib=by(26)local ti=x(ib,"<",f.panel2,11,y(0,0.14))
local nb=x(ib,"(none)",f.panel,10,y(0.14,0.72))local tj=x(ib,">",f.panel2,11,y(0.86,0.14))ti.MouseButton1Click:Connect(function()r.cycle(e3,-1)end)
tj.MouseButton1Click:Connect(function()r.cycle(e3,1)end)nb.MouseButton1Click:Connect(function()r.cycle(e3,1)end)
r.pick[e3]=nb end c.tmT=x(by(28),"AUTO TEAMS: OFF",f.panel2,11,y(0,1))c.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=r.current()end r.paint()end)c.tmInfo=E(by(30),"",10,f.dim,false)
e2("NORMAL TEAM  (worn the rest of the time)")ia("TeamNormal")e2("GLAZE TEAM  (worn just before a wax finishes)")
ia("TeamGlaze")local ic=by(26)c.tmLead=eG(ic,tostring(e.GlazeLead),"45",y(0,0.2))E(ic,"sec before it finishes",10,f.dim,false,y(0.22,0.5))
local tk=x(ic,"SET",f.accent,11,y(0.75,0.25))tk.MouseButton1Click:Connect(function()local e4=tonumber(c.tmLead.Text)
if e4 and e4>=5 and e4<=600 then e.GlazeLead=math.floor(e4)else c.tmLead.Text=tostring(e.GlazeLead)end r.paint()
end)e2("WAX TEAM  (worn while a butter is placed)")ia("TeamWax")e2("YOUR WAXES  (time left, helps)")c.tmList=D("TextLabel",{Size=aR,BackgroundColor3=f.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=f.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text=""},by(150))
aa(c.tmList,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},c.tmList)E(by(78),"Teams are the loadouts you saved in the game's Teams page. A wax's time is fixed when it is placed and its glaze is rolled when it finishes, so the WAX team only needs to be on while placing and the GLAZE team only at the finish. A help never leaves a wax under 60 s, so 45 s is enough. While AUTO TEAMS is on it keeps putting your NORMAL team back.",9,f.dim,false)
c.team.CanvasSize=UDim2 .new(0,0,0,h_+10)r.built=true r.paint()end local function tl()c.secB.Text=tostring(e.Every)
M(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")M(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then c2(e.AutoStart,true)end if a.winPos then c.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then c.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end bc(c.root)bc(c.tgRoot)a.lastCollect=q()
hI()A.paint()pcall(j.paintAll)pcall(r.paint)pcall(l.applyAll)end local function tm(nc)task.spawn(function()nc.TextColor3=f.bad
task.wait(0.8)if a.alive then nc.TextColor3=f.text end end)end local function nd()local ne=c.secB.Text:match("^%s*(%d+)%s*$")
local de=ne and tonumber(ne)if not de or de<1 then c.secB.Text=tostring(e.Every)tm(c.secB)o("interval must be a whole number >= 1")
return end if de==e.Every then return end e.Every,a.lastCollect=de,q()o("collect every "..de.."s")end local function H(tn,to)L(tn.MouseButton1Click:Connect(to))end
H(c.secSet,nd)L(c.secB.FocusLost:Connect(nd))H(c.colT,function()e.Collect,a.lastCollect=not e.Collect,q()M(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)H(c.sellT,function()e.SellJunk=not e.SellJunk M(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)H(c.sellB,function()
a.sellFails=0 task.spawn(as,"selling...",l9)end)H(c.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(u.apply,"you asked",true)
end)H(c.crateT,function()e.Crates=not e.Crates M(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)H(c.crateB,function()
d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(as,"opening crate...",ec,true)end)H(c.padB,function()
a.plot=aW()or a.plot local nf,ie=aG(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(nf and ie and ie:IsA("BasePart"))then o("SET PAD: need character and plot")return end
a.manualPad=ie.CFrame:ToObjectSpace(nf.HumanoidRootPart.CFrame)rK(a.manualPad)o("collect pad saved at your position")
end)H(c.startB,function()c2(not a.running)end)H(c.buyB,function()a.plot=aW()or a.plot task.spawn(as,"buying (manual)...",j8,true)
end)H(c.plB,function()a.plot=aW()or a.plot task.spawn(as,"waxing (manual)...",kc)end)H(c.tabFarm,function()bd("farm")end)
H(c.tabBut,function()bd("but")end)H(c.tabSet,function()bd("set")end)H(c.tabCrt,function()bd("crt")end)H(c.tabPet,function()bd("pet")end)
H(c.tabTeam,function()bd("team")end)local function ng(ig)a.hidden=ig c.root.Visible=not ig c.tgBtn.Text=ig and"SAB+"or"SAB"
end mv(c.tgRoot,c.tgRoot,function(tp)bc(c.tgRoot)a.togPos=eK(c.tgRoot)or a.togPos if tp<8 then ng(not a.hidden)end
end)H(c.tgBtn,function()ng(not a.hidden)end)local an,ae={},0 local function be()an=js()if#an==0 then c.cfgPick.Text="(none saved)"
ae=0 return end if ae<1 or ae>#an then ae=1 end c.cfgPick.Text=an[ae]..("  (%d/%d)"):format(ae,#an)end local function nh()
local ni=a.autoload~=nil c.cfgAuto.Text=ni and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"c.cfgAuto.BackgroundColor3=ni and f.accent or f.panel2
end local function ih()local nj=c.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if nj~=""then return nj end return(ae>0 and an[ae])or""
end H(c.cfgSave,function()a.winPos=eK(c.root)or a.winPos a.togPos=eK(c.tgRoot)or a.togPos local nk,nl=dS(ih())
c.cfgMsg.Text=nk and("saved as "..nl)or("could not save: "..nl)c.cfgMsg.TextColor3=nk and f.good or f.bad be()
o(c.cfgMsg.Text)end)local function tq(ii)local ij,nm=jB(ii)c.cfgMsg.Text=ij and("loaded "..nm)or("could not load: "..nm)
c.cfgMsg.TextColor3=ij and f.good or f.bad if ij then c.cfgName.Text=ii tl()task.spawn(u.apply,"config "..ii)
end o(c.cfgMsg.Text)end H(c.cfgLoad,function()tq(ih())end)H(c.cfgPick,function()be()if ae>0 then c.cfgName.Text=an[ae]end
end)H(c.cfgPrev,function()if#an==0 then be()return end ae=(ae-2)%#an+1 be()c.cfgName.Text=an[ae]end)H(c.cfgNext,function()
if#an==0 then be()return end ae=ae%#an+1 be()c.cfgName.Text=an[ae]end)H(c.cfgAuto,function()if a.autoload then
jD(nil)c.cfgMsg.Text="it will not load a config on launch"else local df=ih()local nn=false for u9,tr in ipairs(js())do if tr==df then nn=true end end
local ts=nn or dS(df)if ts and df~=""then jD(df)be()c.cfgMsg.Text=df.." will load every time the script starts"
else c.cfgMsg.Text="name the config and save it first"end end c.cfgMsg.TextColor3=f.dim nh()end)H(c.autoB,function()
local no,np=pd()c.autoMsg.Text=no and("installed. "..np)or("failed: "..np)c.autoMsg.TextColor3=no and f.good or f.bad
o(c.autoMsg.Text)end)H(c.startT,function()e.AutoStart=not e.AutoStart M(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)H(c.rejT,function()e.Rejoin=not e.Rejoin M(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)H(c.rejB,function()ck("you asked")end)
local bz=false H(c.minB,function()bz=not bz c.tabs.Visible=not bz if bz then c.farm.Visible,c.but.Visible,c.set.Visible,c.crt.Visible=false,false,false,false
c.pet.Visible,c.team.Visible=false,false else bd(mU)end c.root.Size=UDim2 .new(0,W.w,0,bz and(W.head+W.strip)or W.h)
c.minB.Text=bz and"+"or"-"end)local function e5()if not a.alive then return end a.alive,a.running=false,false
pcall(l.restoreAll)pcall(dt)for u_,tt in ipairs(fa)do pcall(function()tt:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()hw:Destroy()end)pcall(function()mE:Destroy()end)if bB.SAB_KILL==e5 then bB.SAB_KILL=nil end end
bB.SAB_KILL=e5 H(c.killB,e5)H(c.xB,e5)mv(c.title,c.root,function()bc(c.root)a.winPos=eK(c.root)or a.winPos end)
local function nq()local dg,dh=a.reason,a.level if a.busy then dg,dh=a.busyText,"ok"elseif not a.running then
local va,nr,tu=me()if a.capHit then dg,dh=nr,"bad"else dg,dh="[stopped] "..nr,(tu=="bad")and"bad"or"idle"end a.reason,a.level=dg,dh
end c.reason.Text=dg c.bar.BackgroundColor3=r6[dh]or f.dim c.dot.BackgroundColor3=a.running and f.good or(a.capHit and f.bad or f.dim)
c.tgDot.BackgroundColor3=c.dot.BackgroundColor3 c.tgRoot.BackgroundColor3=a.hidden and f.panel2 or f.accent c.startB.Text=a.running and"STOP"or"START"
M(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")c.startB.BackgroundColor3=a.running and f.warn or f.good
local tv,tw=iK()c.sBought.Text,c.sPlaced.Text,c.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
c.sColl.Text,c.sFree.Text=tostring(a.collected),tv.."/"..tw local ns=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(q()-a.lastCollect)))or nil
local nt=O()c.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ap(aF()),a.rolls,a.gifts,a.crates,nt and T(N(nt))or"nothing",d.on and("   ["..d.title.." window open]")or"",ns and("in "..ns.."s")or"off")
local b4=oQ()c.tgt.Text=(#b4==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#b4<=3)and table.concat(b4,", ")or(#b4 .." butters ticked")))
c.tgt.TextColor3=(#b4==0)and f.bad or f.good c.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
c.log.Text=table.concat(dk,"\n")if c.butInfo then c.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(K.n,#K.rarOrder,#b4)
end if c.but.Visible and aT.at~=K.at then db(false)end if c.crt.Visible then if A.built~=A.at then A.build()else A.paint()end
end if c.pet.Visible then j.live()end if c.set.Visible then c.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(l.fps+0.5),l.mem,l.memPeak)
end if c.team.Visible then r.paint()end M(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local nu=(u.rec.on and"on"or"")..(u.rec.off and((u.rec.on and"/"or"").."off")or"")c.arL.Text=u.msg~=""and u.msg or("game: %s | learned: %s%s"):format(u.isOn()and"ON"or"off",
nu~=""and nu or"nothing yet",#u.rec.rules>0 and", choices"or"")c.arL.TextColor3=u.msg~=""and f.warn or f.dim end
bB.SAB={S=a,CFG=e,EV=F,U=c,sg=hw,CAT=K,LEARN=Q,buildList=db,logAll=b5,evAll=b6,AR=u,CR=A,PF=l,PX=j,TM=r,CRATE=d}
o(bA.." loaded")if a.uiErrs>0 then o("UI: "..a.uiErrs.." properties skipped")end bd("farm")bc(c.root)bc(c.tgRoot)
if eH then pcall(function()L(eH:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bc(c.root)
bc(c.tgRoot)end))end)end be()nh()if a.config and a.config~=""then c.cfgName.Text=a.config end M(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
M(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
c.secB.Text=tostring(e.Every)pcall(l.applyAll)pcall(nq)task.spawn(function()local nv=fU()c.rejMsg.Text=nv and("after a rejoin it restarts from\n"..nv)or
"no saved copy of this script found, so after a rejoin you would start it by hand"c.autoMsg.Text=(fM(af.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(pk)end)task.spawn(function()while a.alive do local tx,ty=pcall(nq)if not tx then o("UI ERR "..tostring(ty))end
task.wait((a.hidden or bz)and 1.5 or 0.25)end end)task.spawn(function()local tz,tA=pcall(pt)if not tz then o("HOOK ERR "..tostring(tA))end
end)task.spawn(function()pcall(oa)if d.loadSeq and not d.learned then local e6={}for nw=1,20 do if d.loadSeq[nw]then e6[#e6+1]=d.loadSeq[nw]end end
if#e6>0 then d.learned={seq=e6,mode=d.loadMode}o("remembered how to open crates directly")end end if fL()then o(("catalog: %d butters in %d rarities"):format(K.n,#K.rarOrder))end
local tB,nx=pcall(rM)if tB and nx and a.alive and not a.manualPad then a.manualPad=nx end end)task.spawn(function()
while a.alive do local ik,il=pcall(j.buyTick)if not ik then o("PET ERR "..tostring(il))task.wait(5)end ik,il=pcall(j.wishTick)
if not ik then o("WISH ERR "..tostring(il))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local e7,ny=0,q()
L(game:GetService("RunService").Heartbeat:Connect(function()e7=e7+1 end))l.noteAt=q()while a.alive do task.wait(1)
local nz=q()l.fps,e7,ny=e7/math.max(nz-ny,0.001),0,nz local tC,tD=pcall(l.tick)if not tC then o("PERF ERR "..tostring(tD))task.wait(5)end
end end)task.spawn(function()while a.alive do local tE,tF=pcall(r.tick)if not tE then o("TEAM ERR "..tostring(tF))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()while a.alive do task.wait(20)pcall(dt)end end)pcall(u.watchCache)
if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then pcall(function()local tH=(type(newcclosure)=="function")and newcclosure or function(tG)return tG end
local im local nA=(type(setnamecallmethod)=="function")and setnamecallmethod or nil im=hookmetamethod(game,"__namecall",tH(function(nB,...)
local di=getnamecallmethod()if a.alive and(di=="InvokeServer"or di=="FireServer")then local nC,nD=pcall(function()return nB.Name end)
if nC and nD=="CrateAction"and not d.replaying then pcall(d.saw,di,...)elseif nC and nD=="AutoRollAction"and not u.replaying then pcall(u.saw,di,...)end
if nA then nA(di)end end return im(nB,...)end))d.oldNC=im end)end if e9 then L(C.Idled:Connect(function()pcall(function()e9:CaptureController()e9:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for vb=1,90 do if not a.alive then return end if C:GetAttribute("AutoRollOn")~=nil and aG()and(a.plot or aW())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then u.apply("joined")end while a.alive do task.wait(30)if a.alive and e.AutoRoll and a.running and not u.isOn()and not cl()and not O()
and not d.waiting and not d.on and not a.busy then u.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for vc=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or aW()if aG()and a.plot and next(e.Targets)then c2(true,true)o("started by itself")
return end task.wait(1)end if a.alive and not a.running then o("gave up waiting to start - tap START")end end)
task.spawn(function()a.plot=aW()a.lastCollect=q()while a.alive do if a.running then local tI,nE=pcall(r1)if not tI and nE~=e_ then o("LOOP ERR "..tostring(nE))end
end task.wait(0.1)end end)e8("loaded - window is at the top left")end local tK,io=xpcall(nI,function(tJ)return tostring(tJ).."\n"..debug.traceback()end)
if not tK then pcall(function()warn("SAB "..bA.." ERROR: "..tostring(io))end)e8("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bA.." ERROR: "..tostring(io))end)pcall(function()local nF=(type(getgenv)=="function"and getgenv())or _G
if type(nF.SAB_KILL)=="function"then nF.SAB_KILL()end for vd,tL in ipairs({"SABFarmGui","SABToggle"})do local nG=C.PlayerGui:FindFirstChild(tL)
if nG then nG:Destroy()end end end)pcall(function()local dj=Instance.new("ScreenGui")dj.Name="SABError"dj.ResetOnSpawn=false
dj.DisplayOrder=1000 local aA=Instance.new("TextBox")aA.Size=UDim2 .new(0,340,0,170)aA.Position=UDim2 .new(0,10,0,50)
aA.BackgroundColor3=Color3 .fromRGB(90,20,20)aA.TextColor3=Color3 .new(1,1,1)aA.TextSize=11 aA.TextWrapped=true
aA.ClearTextOnFocus=false aA.TextXAlignment=Enum.TextXAlignment.Left aA.TextYAlignment=Enum.TextYAlignment.Top
aA.Text="SAB "..bA.." failed to start. Send this text:\n"..tostring(io)aA.Parent=dj dj.Parent=C:WaitForChild("PlayerGui")
end)end
