local bA="v25"local iv=game:GetService("Players")local C=iv.LocalPlayer or iv.PlayerAdded:Wait()local function fc(nQ)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bA,Text=nQ,Duration=6})
end)end fc("script started")local function nR()local au=game:GetService("ReplicatedStorage")local aB=game:GetService("Workspace")
local nS=game:GetService("UserInputService")local bB=(type(getgenv)=="function"and getgenv())or _G if type(bB.SAB_KILL)=="function"then pcall(bB.SAB_KILL)end
local r=(type(tick)=="function")and tick or os.clock local fd=(function()local nT,nU=pcall(function()return game:GetService("VirtualUser")end)return nT and nU or nil end)()
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
local j,o,l={},{},{}local fe={}local ff,dm,b5,b6={},{},{},{}local function L(iw)ff[#ff+1]=iw return iw end local function ah(nV)
task.wait(nV)if not a.alive then error(fe,0)end end local function q(dn)dn=os.date("%H:%M:%S").." "..tostring(dn)
table.insert(dm,1,dn)if#dm>6 then table.remove(dm)end b5[#b5+1]=dn if#b5>80 then table.remove(b5,1)end end local function dp(ix)
if type(ix)~="string"then return""end return(ix:lower():gsub("[^%w]",""))end local function O(nW)local iy=dp(nW)
local fg=iy:gsub("butter$","")if fg==""then fg=iy end return fg end local function aF(fh)return type(fh)=="string"and O(fh)~=""and e.Targets[O(fh)]==true end
local function nX(b7)b7=b7:lower()return b7:find("squishy",1,true)~=nil or b7:match("butter$")~=nil or b7:match("butter[^%a]")~=nil
end local fi={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ao(b8)if type(b8)~="number"then return"?"end
local dq=1 while math.abs(b8)>=1000 and dq<#fi do b8=b8/1000 dq=dq+1 end local nY=string.format("%.2f",b8):gsub("%.?0+$","")
return nY..fi[dq]end local function nZ(iz)if type(iz)~="string"then return nil end local n0,iA=iz:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local fj=tonumber(n0)if not fj then return nil end if iA==""then return fj end for n1,n2 in ipairs(fi)do if n2:lower()==iA:lower()then return fj*1000^(n1-1)end end
return nil end local function aG()local iB=C:GetAttribute("BoardValueMoney")if type(iB)=="number"then return iB end
local iC=C:FindFirstChild("leaderstats")if iC then for t3,n3 in ipairs({"Cash","Money","Coins"})do local fk=iC:FindFirstChild(n3)
if fk and type(fk.Value)=="number"then return fk.Value end end end end local function dr(n4)local fl=n4:GetFullName()
if a.plot then local fm=a.plot:GetFullName()if fl:sub(1,#fm)==fm then return fl:sub(#fm+2)end end return fl end
local function aH()local ds=C.Character if ds and ds:FindFirstChild("HumanoidRootPart")then local iD=ds:FindFirstChildOfClass("Humanoid")
if iD and iD.Health>0 then return ds end end end local function aW()local fn=aB:FindFirstChild("Plots")if not fn then return nil end
local function iE(n5)local iF=n5:FindFirstChild("Plate")return iF~=nil and iF:FindFirstChild("EditStackAttachment",true)~=nil
end local iG=C:GetAttribute("PlotNumber")if iG~=nil then local fo=fn:FindFirstChild(tostring(iG))if fo and iE(fo)then return fo end
end for t4,iH in ipairs(fn:GetChildren())do if iE(iH)then return iH end end end local function b9(iI)local aX=iI and iI.Parent
for t5=1,6 do if not aX then return nil end if aX:IsA("BasePart")then return aX end if aX:IsA("Model")then return aX.PrimaryPart or aX:FindFirstChildWhichIsA("BasePart",true)end
aX=aX.Parent end end local function iJ(iK)local fp=iK.Parent if fp and fp:IsA("Attachment")then return fp.WorldPosition end
local iL=b9(iK)return iL and iL.Position end local function n6()local bC=a.plot and a.plot:FindFirstChild("Plate")
if not bC then return nil end if bC:IsA("BasePart")then return bC.Position end if bC:IsA("Model")then return bC:GetPivot().Position end
local iM=bC:FindFirstChildWhichIsA("BasePart",true)return iM and iM.Position end local function iN()local fq={}
local iO=a.plot and a.plot:FindFirstChild("WaxStations")if iO then for t6,n7 in ipairs(iO:GetChildren())do local iP=n7:FindFirstChild("SquishyPlaceHolder")
local fr=iP and iP:FindFirstChild("PlacePrompt")if fr and fr:IsA("ProximityPrompt")then fq[#fq+1]=fr end end end
return fq end local function dt()local iQ,fs=iN(),0 for t7,n8 in ipairs(iQ)do if n8 .Enabled then fs=fs+1 end end
local ft=#iQ local fu=C:GetAttribute("WaxStations")if type(fu)=="number"and fu>ft then ft=fu end return fs,ft
end local function n9()local iR=aH()local iS=iR and iR.HumanoidRootPart.Position local fv,iT for t8,fw in ipairs(iN())do
if fw.Enabled then local iU=iJ(fw)local iV=(iU and iS)and(iU-iS).Magnitude or 1e9 if not fv or iV<iT then fv,iT=fw,iV end
end end return fv end local function iW()local du=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not du then return nil end local iX=du:FindFirstChild("BuyPromptAttachment")local dv=(iX and iX:FindFirstChild("BuyPrompt"))or du:FindFirstChild("BuyPrompt",true)
if dv and dv:IsA("ProximityPrompt")and dv:IsDescendantOf(du)then return dv end end local iY={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local n_={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local Q={order={},price={},dirty=false}local A={seen={},at=0,boxes={},built=0}local K={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local fy="SAB_order.txt"local function dw()if not Q.dirty or type(writefile)~="function"then return end local ai={}
for oa,ob in pairs(Q.price)do ai[#ai+1]="P|"..oa.."|"..string.format("%.0f",ob)end for oc,od in pairs(Q.order)do ai[#ai+1]="O|"..oc.."|"..table.concat(od,",")end
if d.learned and d.enc then ai[#ai+1]="M|mode|"..tostring(d.learned.mode or"")for oe,dx in ipairs(d.learned.seq)do
local iZ={}for i0=1,dx.n do iZ[i0]=d.enc(dx.args[i0])end ai[#ai+1]=("A|%d|%s|%d|%s"):format(oe,dx.m,dx.n,table.concat(iZ,";"))
end end local function fz(of,og,dy)local i1={}for i2=1,dy.n do i1[i2]=d.enc(dy.args[i2])end ai[#ai+1]=("R|%d|%s|%s|%d|%s"):format(og,of,dy.m,dy.n,table.concat(i1,";"))
end if d.enc then for oh,oi in ipairs(u.rec.rules)do fz("rules",oh,oi)end if u.rec.on then fz("on",0,u.rec.on)end
if u.rec.off then fz("off",0,u.rec.off)end end for t9,b_ in pairs(A.seen)do ai[#ai+1]=("K|%s|%s|%s|%s"):format(b_.name,b_.title or"",b_.rar or"",b_.price and string.format("%.0f",b_.price)or"")
end if pcall(writefile,fy,table.concat(ai,"\n"))then Q.dirty=false end end local function oj()if type(isfile)~="function"or type(readfile)~="function"then return end
local ol,om=pcall(isfile,fy)if not(ol and om)then return end local oo,i3=pcall(readfile,fy)if not(oo and type(i3)=="string")then return end
for op in i3:gmatch("[^\n]+")do local bD,bE,aI=op:match("^(%a)|([^|]+)|(.*)$")if bD=="P"then Q.price[bE]=tonumber(aI)
elseif bD=="M"then d.loadMode=(aI~=""and aI~="nil")and aI or nil elseif bD=="A"and d.dec then local i4=tonumber(bE)
local i5,dz,oq=aI:match("^([^|]+)|(%d+)|(.*)$")if i4 and i5 then dz=tonumber(dz)local i6,dA={},0 for ot in(oq..";"):gmatch("([^;]*);")do
dA=dA+1 if dA<=dz then i6[dA]=d.dec(ot)end end d.loadSeq=d.loadSeq or{}d.loadSeq[i4]={m=i5,n=dz,args=i6}end elseif bD=="R"and d.dec then
local i7=tonumber(bE)local dB,ou,dC,ov=aI:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if i7 and dB then dC=tonumber(dC)
local i8,dD={},0 for ow in(ov..";"):gmatch("([^;]*);")do dD=dD+1 if dD<=dC then i8[dD]=d.dec(ow)end end local fA={m=ou,n=dC,args=i8}
if dB=="rules"then u.rec.rules[i7]=fA elseif dB=="on"then u.rec.on=fA elseif dB=="off"then u.rec.off=fA end end
elseif bD=="K"then local i9,i_,ox=aI:match("^([^|]*)|([^|]*)|(.*)$")A.seen[A.key(bE)]={name=bE,title=i9~=""and i9 or nil,
rar=i_~=""and i_ or nil,price=tonumber(ox)}elseif bD=="O"and aI~=""then local dE={}for oy in aI:gmatch("[^,]+")do dE[#dE+1]=oy end
if#dE>0 then Q.order[bE]=dE end end end end local function oz(dF)if type(dF)~="table"then return end local bf,ja=dF.rarity,dF.contents
if type(bf)~="string"or bf==""or type(ja)~="table"then return end local ca={}for t_,dG in ipairs(ja)do if type(dG)=="table"and type(dG.butter)=="string"then
ca[#ca+1]={n=dG.butter,ch=tonumber(dG.chance)or 0}end end if#ca==0 then return end table.sort(ca,function(oA,oB)return oA.ch>oB.ch end)
local cb,cc={},false for oC,oD in ipairs(ca)do cb[oC]=oD.n end local fB=Q.order[bf]if not fB or#fB~=#cb then cc=true end
if not cc then for jb=1,#cb do if fB[jb]~=cb[jb]then cc=true break end end end Q.order[bf]=cb local fC=tonumber(dF.price)
if fC and Q.price[bf]~=fC then Q.price[bf]=fC cc=true end if cc then Q.dirty=true K.at=0 q("learned the "..bf.." order from its crate")
end end local function bF(oE,oF)local oG=oE:FindFirstChild(oF,true)local oH,fD=pcall(function()return oG.Text end)
return(oH and type(fD)=="string"and fD~="")and fD or nil end local function T(jc)return K.pretty[jc]or jc end
A.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function A.key(oI)return dp(oI or"")end
function A.learn(aJ)if type(aJ)~="table"or type(aJ.name)~="string"then return end local fE=A.key(aJ.name)local aK=A.seen[fE]or{}
local oJ=(A.seen[fE]==nil)or(tonumber(aJ.price)and aK.price~=tonumber(aJ.price))aK.name,aK.title=aJ.name,aJ.title or aK.title
aK.rar,aK.price=aJ.rarity or aK.rar,tonumber(aJ.price)or aK.price A.seen[fE]=aK if oJ then A.at,Q.dirty=r(),true end
end function A.wanted(jd)return jd~=nil and e.CrateTicks[A.key(jd)]==true end function A.list()local bG={}for oK,dH in ipairs(A.base)do bG[A.key(dH[1])]={name=dH[1],title=dH[2],rar=dH[3],i=oK}end
for ua,cd in ipairs(K.rarOrder)do local je=false for ub,oL in pairs(bG)do if oL.rar==cd then je=true break end end
if not je and cd~="?"then local jf=cd:gsub("[^%w]","").."Crate"bG[A.key(jf)]={name=jf,title=cd.." Crate",rar=cd,i=50,guess=true}
end end for jg,dI in pairs(A.seen)do local aC=bG[jg]or{i=100}aC.name,aC.title,aC.rar=dI.name or aC.name,dI.title or aC.title,dI.rar or aC.rar
aC.price,aC.guess=dI.price or aC.price,nil bG[jg]=aC end local ce,dJ={},{}for oM,oN in ipairs(iY)do ce[oN]=oM end
for oO,jh in ipairs(K.rarOrder)do ce[jh]=ce[jh]or(20+oO)end for oP,cf in pairs(bG)do cf.k=oP cf.price=cf.price or Q.price[cf.rar or""]
dJ[#dJ+1]=cf end table.sort(dJ,function(bh,bi)if bh.price and bi.price and bh.price~=bi.price then return bh.price<bi.price end
local ji,jj=ce[bh.rar or""]or 99,ce[bi.rar or""]or 99 if ji~=jj then return ji<jj end if(bh.i or 100)~=(bi.i or 100)then return(bh.i or 100)<(bi.i or 100)end
return bh.k<bi.k end)return dJ end local function oQ()local jk=au:FindFirstChild("Assets")local jl=jk and jk:FindFirstChild("Squishies")
if not jl then return false end local fF,jm,bH={},{},{}local dK=0 for uc,dL in ipairs(jl:GetChildren())do local cg=O(dL.Name)
if cg~=""and not fF[cg]then local dM=bF(dL,"RarityText")or"?"fF[cg]=dM jm[cg]=bF(dL,"NameText")or dL.Name bH[dM]=bH[dM]or{}
table.insert(bH[dM],cg)dK=dK+1 end end if dK==0 then return false end for jn,oR in pairs(bH)do local jo=Q.order[jn]or n_[jn]
local fG={}if jo then for oS,oT in ipairs(jo)do fG[O(oT)]=oS end end table.sort(oR,function(jp,jq)local fH,fI=fG[jp],fG[jq]
if fH and fI then return fH<fI end if fH then return true end if fI then return false end return T(jp)<T(jq)end)
end local fJ={}for oU,oV in ipairs(iY)do fJ[oV]=oU end local dN={}for oW in pairs(bH)do dN[#dN+1]=oW end table.sort(dN,function(fK,fL)
local fM,fN=Q.price[fK],Q.price[fL]if fM and fN and fM~=fN then return fM<fN end local fO,fP=fJ[fK],fJ[fL]if fO and fP then return fO<fP end
if fO then return true end if fP then return false end return fK<fL end)K.rar,K.pretty,K.members,K.rarOrder,K.n,K.at=fF,jm,bH,dN,dK,r()
return true end local function fQ()if K.at==0 or(r()-K.at)>120 then pcall(oQ)end return K.n>0 end local function oX(oY)
local jr=O(oY)return K.rar[jr]or(F.name and O(F.name)==jr and F.rar)or"?"end local function oZ()local dO={}for o0,o1 in pairs(e.Targets)do if o1 then dO[#dO+1]=T(o0)end end
table.sort(dO)return dO end local af={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function js()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function dP(jt)if type(makefolder)~="function"then return end local o2,o3=pcall(isfolder,jt)if not(o2 and o3)then pcall(makefolder,jt)end
end local function fR(ju)if type(isfile)~="function"or type(readfile)~="function"then return nil end local o4,o5=pcall(isfile,ju)
if not(o4 and o5)then return nil end local o6,o7=pcall(readfile,ju)return o6 and o7 or nil end local function dQ(o8,o9)
if type(writefile)~="function"then return false end return(pcall(writefile,o8,o9))end local function jv(o_)local ci={}
if type(listfiles)~="function"then return ci end local pa,jw=pcall(listfiles,o_)if not pa or type(jw)~="table"then return ci end
for ud,pb in ipairs(jw)do ci[#ci+1]=tostring(pb)end return ci end local function jx()local dR={}for ue,pc in ipairs(jv(af.cfg))do
local jy=pc:match("([^/\\]+)%.txt$")if jy then dR[#dR+1]=jy end end table.sort(dR)return dR end local function pd()
local J={"V|1"}J[#J+1]="N|Every|"..tostring(e.Every)J[#J+1]="N|GlazeLead|"..tostring(e.GlazeLead)J[#J+1]="N|FpsCap|"..tostring(e.FpsCap)
J[#J+1]="N|MemLimit|"..tostring(e.MemLimit)for uf,jz in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do J[#J+1]="S|"..jz.."|"..e[jz]end
do local dS={}for pe,fS in pairs(e.Pets)do local jA=(fS.b and"b"or"")..(fS.g and"g"or"")..(fS.w and"w"or"")if jA~=""then dS[#dS+1]=pe.."|"..jA end
end table.sort(dS)J[#J+1]="P|-"for ug,pf in ipairs(dS)do J[#J+1]="P|"..pf end end for uh,jB in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender"})do
J[#J+1]="B|"..jB.."|"..(e[jB]and"1"or"0")end local fT=C:GetAttribute("AutoRollRules")if type(fT)=="string"and fT~=""then e.ARrules,e.ARstop=fT,tostring(C:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then J[#J+1]="S|rules|"..e.ARrules J[#J+1]="S|stop|"..e.ARstop end if a.winPos then J[#J+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then J[#J+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for ui,fU in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local dT={}for pg,ph in pairs(fU[2])do if ph then dT[#dT+1]=pg end end table.sort(dT)J[#J+1]=fU[1].."|-"for uj,pj in ipairs(dT)do J[#J+1]=fU[1].."|"..pj end
end return table.concat(J,"\n")end local function pk(fV)if type(fV)~="string"or fV==""then return false end local jC,jD,jE,jF,cj={},false,{},false,nil
for pl in fV:gmatch("[^\n]+")do local ap,P,aj=pl:match("^(%a)|([^|]*)|?(.*)$")if ap=="N"and P=="Every"then local fW=tonumber(aj)
if fW and fW>=1 then e.Every=math.floor(fW)end elseif ap=="N"and(P=="FpsCap"or P=="MemLimit")then local fX=tonumber(aj)
if fX and fX>=0 then e[P]=math.floor(fX)end elseif ap=="N"and P=="GlazeLead"then local dU=tonumber(aj)if dU and dU>=5 and dU<=600 then e.GlazeLead=math.floor(dU)end
elseif ap=="S"and(P=="TeamNormal"or P=="TeamFull"or P=="TeamGlaze"or P=="TeamWax")then e[P]=aj elseif ap=="P"and P~=""then
if not cj then cj={}end if P~="-"and aj~=""then cj[P]={b=aj:find("b",1,true)and true or nil,g=aj:find("g",1,true)and true or nil,
w=aj:find("w",1,true)and true or nil}end elseif ap=="B"then if e[P]~=nil then e[P]=(aj=="1")end elseif ap=="S"and P=="rules"then
e.ARrules=aj elseif ap=="S"and P=="stop"then e.ARstop=aj elseif ap=="W"then a.winPos={tonumber(P)or 10,tonumber(aj)or 44}
elseif ap=="G"then a.togPos={tonumber(P)or 10,tonumber(aj)or 300}elseif ap=="T"and P~=""then if P~="-"then jC[P]=true end
jD=true elseif ap=="K"and P~=""then if P~="-"then jE[P]=true end jF=true end end if jD then e.Targets=jC end if jF then e.CrateTicks=jE end
if cj then e.Pets=cj end return true end local function dV(bI)if not js()then return false,"this executor cannot write files"end
bI=(bI or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if bI==""then return false,"give the config a name"end
dP(af.dir)dP(af.cfg)if not dQ(af.cfg.."/"..bI..".txt",pd())then return false,"could not write the file"end a.config=bI
return true,bI end local function jG(dW)local jH=fR(af.cfg.."/"..dW..".txt")if not jH then return false,"no config called "..tostring(dW)end
if not pk(jH)then return false,"that config looks empty"end a.config=dW return true,dW end local function jI(fY)
if fY then dP(af.dir)dQ(af.auto,fY)elseif type(delfile)=="function"then pcall(delfile,af.auto)else dQ(af.auto,"")
end a.autoload=fY end local function fZ()if a.selfPath then return a.selfPath end local dX for uk,pm in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",af.dir})do
for ul,jJ in ipairs(jv(pm))do local f0=jJ:lower()if f0:sub(-4)==".lua"and(f0:find("sab_farm",1,true)or f0:find("sab farm",1,true))then
dX=dX or jJ end end end a.selfPath=dX return dX end af.stub=[[
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
local function pn()if not js()then return false,"this executor cannot write files"end dP("autoexec")if not dQ(af.exec,af.stub)then return false,"could not write to the autoexec folder"end
local jK=fZ()return true,jK and("it will load "..jK)or"now save this script in Delta so the loader can find it"
end local dY=(function()local po,pp=pcall(function()return game:GetService("TeleportService")end)return po and pp or nil end)()
local function f1()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local pq=queueonteleport or queue_on_teleport local jL=fZ()if not jL then return false end return(pcall(pq,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(jL)))
end local function ck(pr)if a.rejoining then return end a.rejoining=true q("REJOIN ("..pr..")")pcall(dw)if a.autoload then pcall(dV,a.autoload)end
local ps=f1()q(ps and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for um=1,30 do if not dY then break end pcall(function()dY:Teleport(game.PlaceId,C)end)task.wait(10)
end end)end local function pt()local pu,jM=pcall(function()return game:GetService("GuiService")end)if pu and jM then
pcall(function()L(jM.ErrorMessageChanged:Connect(function()if e.Rejoin then ck("roblox error message")end end))
end)end pcall(function()local jN=game:GetService("CoreGui")local jO=jN and jN:WaitForChild("RobloxPromptGui",15)
local jP=jO and jO:WaitForChild("promptOverlay",15)if jP then L(jP.ChildAdded:Connect(function(pv)if e.Rejoin and tostring(pv.Name):lower():find("errorprompt",1,true)then ck("disconnect prompt")end
end))end end)pcall(function()L(C.OnTeleport:Connect(function(pw)if tostring(pw):find("Started")then f1()end end))
end)if dY then pcall(function()L(dY.TeleportInitFailed:Connect(function()a.rejoining=false if e.Rejoin then task.delay(5,function()ck("teleport retry")end)end
end))end)end end local function jQ(px)local jR=a.plot and a.plot:FindFirstChild(px)if not jR then return nil,false end
for un,f2 in ipairs(jR:GetChildren())do if f2:IsA("Model")or f2:IsA("BasePart")then return f2,true end end return nil,true
end local function cl()local aY=jQ("RolledSquishy")if not aY then return nil end return{model=aY,name=aY.Name,pretty=bF(aY,"NameText")or T(O(aY.Name)),
rar=bF(aY,"RarityText")or oX(aY.Name),price=bF(aY,"PriceText")}end local function jS(f3)return type(f3)=="string"and(K.rar[O(f3)]~=nil or nX(f3))
end local function M()local f4=jQ("SquishyEquipped")if f4 then a.carrySrc,d.heldAt="model",r()return f4 .Name,f4 end
local jT=C.Character if jT then for uo,cm in ipairs(jT:GetDescendants())do if(cm:IsA("Model")or cm:IsA("Tool"))and jS(cm.Name)then
a.carrySrc,d.heldAt="character",r()return cm.Name,cm end end end local dZ=C:GetAttribute("SquishyEquipped")if type(dZ)=="string"and dZ~=""and jS(dZ)and r()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return dZ,nil end a.carrySrc=nil end local function up()local uq,py=M()return py end local function jU()
local jV=cl()local f5=jV and nZ(jV.price)local f6=aG()if f5 and f6 and f6<f5*0.5 then return f6,f5 end end local function bJ(pz)
b6[#b6+1]=os.date("%H:%M:%S").." "..pz if#b6>40 then table.remove(b6,1)end end local function pA(bj,d0)if type(bj)~="string"then return end
bJ(("Roll(%s,%s)"):format(bj,tostring(d0)))if bj:lower():find("crate",1,true)then d.rolled,d.rolledAt=bj,r()return
end F.seq=F.seq+1 F.name,F.at=bj,r()F.rar=type(d0)=="string"and d0 or nil a.rolls=a.rolls+1 if aF(bj)then q(("ROLL %s [%s] = TARGET"):format(bj,tostring(d0)))end
end local function pB(bk)if type(bk)~="table"then return end local d1=bk.butter or bk.itemName if type(d1)~="string"then return end
a.gifts=a.gifts+1 F.gift,F.giftAt=d1,r()if type(bk.giftId)=="string"then local jW=au:FindFirstChild("Remotes")
local jX=jW and jW:FindFirstChild("GiftThanks")if jX then pcall(function()jX:FireServer(bk.giftId)end)end end
bJ("Gift("..d1 .." from "..tostring(bk.fromName)..")")q(("GIFT from %s: %s - it will not be waxed"):format(tostring(bk.fromName),d1))
end local function pC()local jY=au:WaitForChild("Remotes",30)if not a.alive then return end if not jY then q("Remotes folder missing - no roll events")return end
L(C:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local jZ=C:GetAttribute("SquishyEquipped")
if type(jZ)=="string"and jZ~=""then d.heldAt=r()end end))local pI={SquishyRollAnimation=pA,InitSquishy=function(j0)F.init,F.initAt=tostring(j0),r()bJ("Init("..tostring(j0)..")")end,
CrateUpdate=function(bK,j1)pcall(oz,bK)pcall(A.learn,bK)if type(bK)=="table"then local pD=j1==true or(d.rolled~=nil and r()-d.rolledAt<15)or d.waiting
if not pD then return end local pE=not d.waiting local pF=d.on d.waiting,d.data,d.at=true,bK,r()d.on=(j1==true)
d.title=tostring(bK.title or bK.name or"crate")if d.on and not pF then d.openedAt,d.byYou=r(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then bJ("CrateWindow open("..d.title..")")elseif pE then bJ("Crate waiting("..d.title..")")q(d.title.." is waiting on your stand")
end else if d.waiting then bJ("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local pG=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,pG)end if d.classify then local pH=r()
task.spawn(function()pcall(d.classify,pH)end)end end end,GiftReceived=pB,}for d2,pJ in pairs(pI)do local f7=jY:FindFirstChild(d2)
if f7 and f7:IsA("RemoteEvent")then L(f7 .OnClientEvent:Connect(pJ))elseif d2~="CrateUpdate"and d2~="GiftReceived"then q("remote "..d2 .." missing")end
end end local function f8()local bl=cl()if bl then if aF(bl.name)then return{state="match",shown=bl.pretty,src="pad",info=bl}
end return{state="skip",info=bl,level="idle",text=("on pad: %s [%s] - not ticked"):format(bl.pretty,tostring(bl.rar))}
end if F.name and(r()-F.at)<4 then if aF(F.name)then return{state="match",shown=T(O(F.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(T(O(F.name)),tostring(F.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function j2(pK,pL,pM,pN)
local d3=RaycastParams.new()d3 .FilterType=Enum.RaycastFilterType.Exclude local f9={C.Character}for ur,pO in ipairs(pN or{})do f9[#f9+1]=pO end
d3 .FilterDescendantsInstances=f9 pcall(function()d3 .RespectCanCollide=true end)local j3=aB:Raycast(Vector3 .new(pK,pL+4,pM),Vector3 .new(0,-30,0),d3)
return j3 and j3 .Position or nil end local function f_(j4)local j5=j4:FindFirstChildOfClass("Humanoid")return((j5 and j5 .HipHeight)or 2)+j4 .HumanoidRootPart.Size.Y/2+0.2
end local function ga(pP,pQ)local j6=pP:FindFirstChildOfClass("Humanoid")local pR=r()while r()-pR<pQ do if j6 and j6 .FloorMaterial~=Enum.Material.Air then return true end
ah(0.05)end return false end local function cn(pS,gb,gc)local j7=pS.HumanoidRootPart j7 .AssemblyLinearVelocity=Vector3 .new(0,0,0)
j7 .CFrame=gc and CFrame.new(gb,Vector3 .new(gc.X,gb.Y,gc.Z))or CFrame.new(gb)end local function co(aL,j8)local bm=aH()
if not bm or not aL then return false end local aZ=aL.Position local d4=math.clamp(math.max(aL.Size.X,aL.Size.Z)/2+2.2,3,7)
local j9=(j8 and j8 .MaxActivationDistance)or 10 if d4>j9-2 then d4=math.max(2.5,j9-2)end local cp={}local function bn(cq)
cq=Vector3 .new(cq.X,0,cq.Z)if cq.Magnitude>0.05 then cp[#cp+1]=cq.Unit end end local j_=n6()if j_ then bn(j_-aZ)end
bn(aL.CFrame.LookVector)bn(-aL.CFrame.LookVector)bn(aL.CFrame.RightVector)bn(-aL.CFrame.RightVector)bn(bm.HumanoidRootPart.Position-aZ)
if#cp==0 then bn(Vector3 .new(0,0,1))end local pT,d5=f_(bm),false for us,pU in ipairs(cp)do local d6=aZ+pU*d4
local gd=j2(d6 .X,aZ.Y,d6 .Z,{aL})if gd and math.abs(gd.Y-aZ.Y)<14 then cn(bm,Vector3 .new(d6 .X,gd.Y+pT,d6 .Z),aZ)
if ga(bm,0.7)then d5=true break end end end if not d5 then cn(bm,aZ+cp[1]*d4+Vector3 .new(0,3,0),aZ)d5=ga(bm,1)
end ah(0.12)return d5 end local function pV(cr)if not cr.Parent or not cr.Enabled then return false end pcall(function()cr:InputHoldBegin()end)
ah(math.max(cr.HoldDuration,0)+0.08)pcall(function()cr:InputHoldEnd()end)return true end local function ad(ka,pW)
local pX=r()while r()-pX<pW do if ka()then return true end ah(0.05)end return ka()end local function d7(bL,pY,kb,pZ)
local p0=a.zapFirst and{"zap","hold"}or{"hold","zap"}for p1,ge in ipairs(p0)do if p1==2 and(pZ or not(bL.Parent and bL.Enabled and(not kb or kb())))then break end
local gf if ge=="hold"then gf=pV(bL)else gf=type(fireproximityprompt)=="function"and bL.Parent~=nil and bL.Enabled and pcall(fireproximityprompt,bL)end
if gf and ad(pY,1.2)then a.zapFirst=(ge=="zap")return true,ge end end return false end local function kc(gg)local a0=iW()
if not a0 or not a0 .Enabled then q("buy: nothing on the pad")return false end local kd=b9(a0)if not kd then q("buy: pad part missing")return false end
a.lastBuyAt=r()local p2,ke=F.seq,aG()co(kd,a0)if not a0 .Enabled then q("buy aborted: pad emptied")return false end
local bM=f8()if not gg and bM.state~="match"then q("buy aborted: "..(bM.text or"pad changed"))a.matchSince=nil
return false end local gh=bM.info and bM.info.name or(bM.state=="match"and F.name)or nil local function p3()return a0 .Enabled and M()==nil and(gg or f8().state=="match")
end local p4,p5=d7(a0,function()return M()~=nil or((not a0 .Enabled)and(gg or F.seq==p2))end,p3,jU()~=nil)if p4 then
ad(function()return M()~=nil end,0.8)local cs=M()local kf=aG()a.holding,a.bought,a.cashFails=true,a.bought+1,0
a.matchSince=nil F.name,F.rar,F.at=nil,nil,r()q(("BOUGHT %s%s via %s"):format(cs and T(O(cs))or(bM.shown or"?"),(ke and kf)and(" for $"..ao(ke-kf))or"",p5))
if cs and gh and O(cs)~=O(gh)then q(("note: picked up %s, not %s"):format(cs,gh))end return true end a.cashFails=a.cashFails+1
a.noCashUntil=r()+math.min(8*2^(a.cashFails-1),60)local kg=cl()q(("BUY REFUSED: cash short? have $%s, price %s"):format(ao(aG()),(kg and kg.price)or"?"))
return false end local function kh()local d8=M()if not d8 then a.holding=false q("place: hands are empty")return false
end if not aF(d8)then q(("REFUSED TO WAX %s - it is not ticked"):format(T(O(d8))))return false end for ut=1,e.PlaceTries do
local a1=n9()if not a1 then q("place: no free station")break end local ki=b9(a1)if ki then co(ki,a1)local kj=M()
if not kj then a.holding=false q("place: hands emptied on the way")return false end if not aF(kj)then q("place: what I carry changed, not waxing it")return false end
if a1 .Enabled then local p6,p7=d7(a1,function()return not a1 .Enabled end,function()return a1 .Enabled end)if p6 then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=r()+2.5,0 F.name,F.rar,F.at=nil,nil,r()
q(("WAXED %s #%d at %s via %s"):format(T(O(d8)),a.placed,a1 .Parent.Parent.Name,p7))return true end end end ah(0.25)
end a.placeFails=a.placeFails+1 if M()==nil then a.holding=false end q("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then
a.capHit,a.running,a.capAt=true,false,r()a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(M()))q(a.capMsg)end return false end function o.place()if e.Teams and e.TeamWax~=""then o.placing=true
local p8=r()while a.alive and o.current()~=e.TeamWax and r()-p8<5 do ah(0.1)end if o.current()==e.TeamWax then
local kk,p9=o.expectSocialWax(e.TeamWax),r()while a.alive and kk>0 and(tonumber(C:GetAttribute("PetSocialWax"))or 0)<kk-1e-6 and r()-p9<4 do ah(0.1)end
ah(0.25)else q("wax team did not come on in time - placing anyway")end end local p_,kl=pcall(kh)o.placing=false
if not p_ then error(kl,0)end return kl end local function km(kn)return type(kn)=="string"and kn:lower():find("crate",1,true)~=nil
end local qa={SABFarmGui=1,SABToggle=1,SABError=1}local function gi(qb)local a2=qb while a2 do if qa[a2 .Name]then return false end
if a2:IsA("ScreenGui")then local qc,qd=pcall(function()return a2 .Enabled end)return(not qc)or qd~=false end if a2:IsA("GuiObject")and not a2 .Visible then return false end
a2=a2 .Parent end return false end local function d9(d_)local bN=""pcall(function()if d_:IsA("TextButton")then bN=d_.Text end end)
if not bN:find("%a")then for uu,ea in ipairs(d_:GetDescendants())do if(ea:IsA("TextLabel")or ea:IsA("TextButton"))and ea.Text:find("%a")then bN=ea.Text break end
end end if not bN:find("%a")then bN=d_.Name end return(bN:lower():gsub("[^%a]",""))end local function qe()local ct,cu
local ko=C:FindFirstChildOfClass("PlayerGui")if not ko then return nil,nil end for uv,cv in ipairs(ko:GetDescendants())do
if cv:IsA("GuiButton")and gi(cv)then local gj=d9(cv)if gj:sub(1,4)=="open"and not gj:find("shop",1,true)then ct=ct or cv end
if gj:sub(1,7)=="discard"then cu=cu or cv end end end if ct and cu then return ct,cu end if d.on then return ct,cu end
return nil,nil end local gk=(function()local qf,qg=pcall(function()return game:GetService("VirtualInputManager")end)return qf and qg or nil end)()
local function kp(aM,gl)local gm={}local function kq(qh)gm[#gm+1]=qh end if a.tapWay then kq(a.tapWay)end for uw,kr in ipairs({"touch","conn","signal"})do
if kr~=a.tapWay then kq(kr)end end local function ks(qi,...)local qj,gn=pcall(getconnections,qi)if not(qj and type(gn)=="table"and#gn>0)then return false end
local kt,qk,ql=false,{...},select("#",...)for ux,qm in ipairs(gn)do if pcall(function()qm:Fire(table.unpack(qk,1,ql))end)then kt=true end
end return kt end local function ku()local kv=Vector3 .new(0,0,0)pcall(function()local kw,kx=aM.AbsolutePosition,aM.AbsoluteSize
kv=Vector3 .new(kw.X+kx.X/2,kw.Y+kx.Y/2,0)end)local go={Position=kv,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()go.UserInputType=Enum.UserInputType.Touch end)pcall(function()go.UserInputState=Enum.UserInputState.End end)
return go end for uy,aN in ipairs(gm)do local cw=false if aN=="conn"and type(getconnections)=="function"then if ks(aM.MouseButton1Click)then
cw=true if ad(gl,1.5)then a.tapWay=aN return true,aN end end cw=ks(aM.Activated,ku(),1)elseif aN=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aM.MouseButton1Click)then if ad(gl,1.5)then a.tapWay=aN return true,aN end end cw=pcall(firesignal,aM.Activated,ku(),1)
elseif aN=="touch"and gk then cw=pcall(function()local ky,kz=aM.AbsolutePosition,aM.AbsoluteSize local kA=0 local kB=aM:FindFirstAncestorWhichIsA("ScreenGui")
local qn,qo=pcall(function()return kB and kB.IgnoreGuiInset end)if not(qn and qo)then pcall(function()kA=game:GetService("GuiService"):GetGuiInset().Y end)
end local kC,kD=ky.X+kz.X/2,ky.Y+kz.Y/2+kA gk:SendMouseButtonEvent(kC,kD,0,true,game,1)task.wait(0.06)gk:SendMouseButtonEvent(kC,kD,0,false,game,1)
end)end if cw and ad(gl,1.5)then a.tapWay=aN return true,aN end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function gp(kE)local cx=kE.Parent while cx and cx~=a.plot do if d.NOT[cx.Name]then return false end cx=cx.Parent
end local gq=(kE.ActionText or""):lower()if gq:find("roll",1,true)or gq:find("place",1,true)or gq:find("sell",1,true)then return false end
return true end local function qp()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local kF=a.plot:FindFirstChild("CrateStand")local cy if kF then for uz,eb in ipairs(kF:GetDescendants())do
if eb:IsA("ProximityPrompt")and eb.Enabled and gp(eb)then cy=eb break end end end if not cy then for uA,a3 in ipairs(a.plot:GetDescendants())do
if a3:IsA("ProximityPrompt")and a3 .Enabled and gp(a3)then local kG=a3:FindFirstAncestorWhichIsA("Model")local qq=((a3 .ActionText or"").." "..(a3 .ObjectText or"").." "..a3 .Name.." "..(kG and kG.Name or"")):lower()
if qq:find("crate",1,true)then cy=a3 break end end end end d.prompt=cy return cy end local function gr()if d.on then return true end
local cz=qp()if not cz then d.summonFails=d.summonFails+1 d.lastFail=r()q("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local kH=b9(cz)if kH then co(kH,cz)end d.ours=true d7(cz,function()return d.on end)if ad(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=r()q("crate: pressed "..dr(cz).." but no window came up")
return false end do local function qr(kI)local bO=kI.Parent while bO and bO:IsA("GuiObject")do local kJ,kK=false,false
for uB,cA in ipairs(bO:GetDescendants())do if cA~=kI and cA:IsA("GuiButton")and d9(cA):sub(1,7)=="discard"then kJ=true end
if cA:IsA("TextLabel")then local gs=cA.Text:lower()if gs:find("crate",1,true)or gs:find("can contain",1,true)or gs:find("cost",1,true)then kK=true end
end if kJ and kK then return bO end end bO=bO.Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local kL=C:FindFirstChildOfClass("PlayerGui")if not kL then return nil end for uC,ec in ipairs(kL:GetDescendants())do
if ec:IsA("GuiButton")and not ec:FindFirstAncestor("SABFarmGui")and d9(ec):sub(1,4)=="open"then local gt=qr(ec)
if gt then d.win=gt return gt end end end end local function qs(qt)for uD,ed in ipairs(qt:GetDescendants())do
if ed:IsA("GuiButton")then local kM,gu=d9(ed),ed.Name:lower()if kM=="x"or kM=="close"or gu=="x"or gu:find("close",1,true)or gu:find("exit",1,true)then return ed end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(qu)task.wait(qu and 4 or 1.2)if d.on or d.waiting then return end
local ee=d.findWin()if not ee or not gi(ee)then return end local kN=qs(ee)if kN and kp(kN,function()return not gi(ee)end)then return end
q("the crate window is still open - tap its X")end end local function ef(eg)if not gr()then return false end local kO=r()-(d.openedAt or 0)
if kO<0.6 then ah(0.6-kO)end local gv=d.title local qv,qw=qe()local kP=eg and qv or qw if not kP then d.lastFail=r()
a.crateFails=a.crateFails+1 q(("crate: no %s button found in %s"):format(eg and"Open"or"Discard",gv))return false
end local qx=M()local qy,uE=kp(kP,function()return(not d.on)or(M()~=nil and M()~=qx)end)if not qy then d.lastFail=r()
a.crateFails=a.crateFails+1 q("crate: could not press "..(eg and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if eg then a.crates=a.crates+1 ad(function()return M()~=nil end,1.5)local kQ=M()
q(("OPENED %s -> %s"):format(gv,kQ and T(O(kQ))or"?"))else q("discarded "..gv.." (nothing ticked in it)")end return true
end d.calls={}function d.saw(qz,...)local qA=select("#",...)d.calls[#d.calls+1]={t=r(),m=qz,n=qA,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(ak,aO)local a4=type(ak)if(a4=="string"or a4=="number")and type(aO.data)=="table"then for kR,gw in pairs(aO.data)do
if gw==ak and type(kR)=="string"and(type(gw)=="string"or type(gw)=="number")then return{__slot="f:"..kR}end end
end if a4=="string"then if aO.crate and ak==aO.crate then return{__slot="crate"}end if aO.title and ak==aO.title then return{__slot="title"}end
if aO.rar and ak==aO.rar then return{__slot="rarity"}end return ak end if a4=="number"or a4=="boolean"or a4=="nil"then return ak end
if a4=="table"then local kS={}for qB,kT in pairs(ak)do if type(kT)=="table"then return nil,"nested table"end local qC,kU=d.slot(kT,aO)
if kU then return nil,kU end kS[qB]=qC end return kS end local qD,qE=pcall(function()return ak:IsA("Instance")end)
if qD and qE then if ak==C then return{__slot="player"}end if a.plot and ak==a.plot then return{__slot="plot"}end
local eh=a.plot and a.plot:FindFirstChild("CrateStand")if eh and ak==eh then return{__slot="stand"}end if eh and ak.Parent==eh then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..a4 ..")"end function d.resolve(ei)if type(ei)~="table"then return ei end
local av=ei.__slot if av and av:sub(1,2)=="f:"then return d.data and d.data[av:sub(3)]end if av=="crate"then return d.data and d.data.name end
if av=="title"then return(d.data and d.data.title)or d.title end if av=="rarity"then return d.data and d.data.rarity end
if av=="player"then return C end if av=="plot"then return a.plot end if av=="stand"or av=="model"then local gx=a.plot and a.plot:FindFirstChild("CrateStand")
if av=="stand"or not gx then return gx end for uF,kV in ipairs(gx:GetChildren())do if km(kV.Name)then return kV end end
return nil end local kW={}for qF,qG in pairs(ei)do kW[qF]=d.resolve(qG)end return kW end function d.classify(gy)
if d.directOff then return end local ej={}for uG,gz in ipairs(d.calls)do if gz.t<=gy+0.05 and gy-gz.t<=6 then ej[#ej+1]=gz end
end if#ej==0 then return end if not ad(function()return(d.heldAt or 0)>=gy-1 end,2.5)then return end local cB={}
for uH,cC in ipairs(ej)do local kX={}for kY=1,cC.n do local qH,kZ=d.slot(cC.args[kY],cC)if kZ then q("crate call has "..kZ.." - keeping the button method")
return end kX[kY]=qH end cB[#cB+1]={m=cC.m,n=cC.n,args=kX}end local gA=d.learned d.learned={seq=cB,mode=gA and gA.mode or nil}
Q.dirty=true if not gA then q(("learned how to open crates directly (%d call%s)"):format(#cB,#cB==1 and""or"s"))end
end function d.replay()local k0=d.learned local k1=au:FindFirstChild("Remotes")local gB=k1 and k1:FindFirstChild("CrateAction")
if not(k0 and gB)then return false end local k2=table.unpack or unpack d.replaying=true for uI,cD in ipairs(k0 .seq)do
local gC={}for k3=1,cD.n do gC[k3]=d.resolve(cD.args[k3])end task.spawn(function()pcall(function()if cD.m=="InvokeServer"then gB:InvokeServer(k2(gC,1,cD.n))
else gB:FireServer(k2(gC,1,cD.n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(qI)return(qI:gsub("[%%|;=,\n]",function(qJ)return("%%%02X"):format(qJ:byte())end))end
function d.enc(bo)local ek=type(bo)if ek=="string"then return"s"..d.esc(bo)end if ek=="number"then return"n"..tostring(bo)end
if ek=="boolean"then return bo and"b1"or"b0"end if ek=="nil"then return"z"end if bo.__slot then return"k"..bo.__slot end
local gD={}for qK,qL in pairs(bo)do gD[#gD+1]=d.enc(qK).."="..d.enc(qL)end return"t"..table.concat(gD,",")end
function d.dec(k4)local cE,cF=k4:sub(1,1),k4:sub(2)local function qM(qN)return(qN:gsub("%%(%x%x)",function(qO)return string.char(tonumber(qO,16))end))end
if cE=="s"then return qM(cF)end if cE=="n"then return tonumber(cF)end if cE=="b"then return cF=="1"end if cE=="k"then return{__slot=cF}end
if cE=="t"then local k5={}for qP in cF:gmatch("[^,]+")do local k6,qQ=qP:match("^(.-)=(.*)$")if k6 then local k7=d.dec(k6)
if k7~=nil then k5[k7]=d.dec(qQ)end end end return k5 end return nil end function d.goneOrNew(qR)return function()
if not d.waiting then return true end local k8=M()return k8~=nil and k8~=qR end end function d.near()local k9=au:FindFirstChild("Remotes")
local k_=k9 and k9:FindFirstChild("CrateAction")local gE=aH()local gF=a.plot and a.plot:FindFirstChild("CrateStand")
local gG=gF and gF:FindFirstChild("Spot")if not(k_ and gE and gG)then return false,"no crate stand or remote"end
local gH=gE.HumanoidRootPart local el=gH.CFrame local la,gI=d.title,"no answer"local qS=M()local lb=gF:FindFirstChild("Holder")
local function lc()if not lb then return d.waiting or d.on end for uJ,qT in ipairs(lb:GetChildren())do if qT:IsA("Model")then return true end end
return false end for qU=1,3 do if not(d.waiting or d.on)or not lc()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end if(gH.Position-gG.Position).Magnitude>8 then co(gG,d.prompt)end ah(0.12+0.15*qU)
local aD={}d.replaying=true task.spawn(function()aD.ok,aD.v=pcall(function()return k_:InvokeServer("open")end)
aD.done=true end)ad(function()return aD.done end,6)d.replaying=false local bp=aD.v if aD.done and aD.ok and type(bp)=="table"and bp.ok then
a.crates,d.fails,d.nearFails=a.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,r()+4 q(("OPENED %s -> %s (no window)"):format(la,bp.prize and T(O(tostring(bp.prize)))or"?"))
ad(function()local ld=M()return ld~=nil and ld~=qS end,1.5)if(gH.Position-el.Position).Magnitude>8 then pcall(function()cn(gE,el.Position,el.Position+el.LookVector)end)end
return true,"opened"end gI=(aD.done and aD.ok and type(bp)=="table")and tostring(bp.reason or"refused, no reason given")
or(aD.done and("error: "..tostring(bp))or"no answer in 6s")ah(0.3)if not lc()then d.waiting,d.on,d.quietUntil=false,false,r()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 q(("crate: the server would not open %s next to the stand (%s)"):format(la,gI))
return false,gI end function d.smart()local gJ=d.title if(d.nearFails or 0)<3 then local qV=d.near()if qV then return true end
if d.nearFails>=3 then q("opening next to the stand failed 3 times - trying the older ways")end end local bq=d.learned
if bq then local gK=M()if d.on then d.replay()if ad(d.goneOrNew(gK),3.5)then a.crates=a.crates+1 q("OPENED "..gJ.." (direct)")
return true end else if bq.mode~="window"then d.replay()if ad(d.goneOrNew(gK),3.5)then a.crates,d.fails=a.crates+1,0
if bq.mode~="direct"then bq.mode,Q.dirty="direct",true q("crates now open directly - the window never comes up")
end q("OPENED "..gJ.." (direct, no window)")return true end end if gr()then d.replay()if ad(d.goneOrNew(gK),3.5)then
a.crates,d.fails=a.crates+1,0 if bq.mode~="window"then bq.mode,Q.dirty="window",true q("crates need their window up first - it shows briefly")
end q("OPENED "..gJ.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,Q.dirty=bq,nil,true
if d.fails>=3 then d.directOff=true q("direct crate opening failed 3 times - using the button for now")else q("the learned crate call did not work - back to pressing Open")
end end return ef(true)end function u.snap()return{rules=C:GetAttribute("AutoRollRules"),stop=C:GetAttribute("AutoRollStop"),
on=C:GetAttribute("AutoRollOn"),main=C:GetAttribute("AutoRoll")}end u.cache={}function u.watchCache()u.cache=u.snap()
for qW,le in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do L(C:GetAttributeChangedSignal(le):Connect(function()u.cache[qW]=C:GetAttribute(le)end))
end end function u.isOn()return C:GetAttribute("AutoRollOn")==true end function u.saw(qX,...)local em=u.cache
local qY={m=qX,n=select("#",...),args={...},before={rules=em.rules,stop=em.stop,on=em.on,main=em.main}}task.delay(1.5,function()
if a.alive then pcall(u.learnOne,qY)end end)end function u.learnOne(cG)local ag,cH=u.snap(),cG.before local en=(ag.rules~=cH.rules)or(ag.stop~=cH.stop)
local lf=(ag.on~=cH.on)or(ag.main~=cH.main)if not en and not lf then return end local lg={}for lh=1,cG.n do local aq=cG.args[lh]
local br=type(aq)if br=="string"and aq~=""and aq==ag.rules then aq={__slot="rules"}elseif br=="string"and aq~=""and en and aq==ag.stop and ag.stop~=cH.stop then aq={__slot="stop"}
elseif br=="table"then local li={}for qZ,bP in pairs(aq)do if type(bP)=="table"or(type(bP)=="userdata")then u.msg="Auto Roll sends something I cannot repeat"return
end li[qZ]=(type(bP)=="string"and bP~=""and bP==ag.rules)and{__slot="rules"}or bP end aq=li elseif br~="string"and br~="number"and br~="boolean"and br~="nil"then
if aq==C then aq={__slot="player"}else u.msg="Auto Roll sends something I cannot repeat"return end end lg[lh]=aq
end local bQ={m=cG.m,n=cG.n,args=lg}if en then local gL=false for q0=1,bQ.n do local cI=bQ.args[q0]if type(cI)=="table"and cI.__slot=="rules"then gL=true end
if type(cI)=="table"and not cI.__slot then for uK,lj in pairs(cI)do if type(lj)=="table"and lj.__slot=="rules"then gL=true end end
end end if gL then u.rec.rules={bQ}else table.insert(u.rec.rules,bQ)if#u.rec.rules>60 then table.remove(u.rec.rules,1)end
end end if lf then if ag.on==true then u.rec.on=bQ else u.rec.off=bQ end e.AutoRoll=(ag.on==true)end if ag.rules and ag.rules~=""then e.ARrules,e.ARstop=ag.rules,ag.stop or""end
Q.dirty=true u.msg=""q(("learned an Auto Roll %s message"):format(en and"choices"or(ag.on and"on"or"off")))end
function u.resolve(bR)if type(bR)~="table"then return bR end if bR.__slot=="rules"then return e.ARrules~=""and e.ARrules or C:GetAttribute("AutoRollRules")end
if bR.__slot=="stop"then return e.ARstop~=""and e.ARstop or C:GetAttribute("AutoRollStop")end if bR.__slot=="player"then return C end
local lk={}for q1,q2 in pairs(bR)do lk[q1]=u.resolve(q2)end return lk end function u.replay(ll,q3)local lm=table.unpack or unpack
for uL,cJ in ipairs(q3)do local gM={}for ln=1,cJ.n do gM[ln]=u.resolve(cJ.args[ln])end u.replaying=true pcall(function()
if cJ.m=="InvokeServer"then task.spawn(function()pcall(function()ll:InvokeServer(lm(gM,1,cJ.n))end)end)else ll:FireServer(lm(gM,1,cJ.n))end
end)u.replaying=false task.wait(0.25)end end function u.apply(lo,q4)if u.busy or not a.alive then return end u.busy=true
pcall(function()local lp=au:FindFirstChild("Remotes")local gN=lp and lp:FindFirstChild("AutoRollAction")if not gN then u.msg="this game has no AutoRollAction"return end
local a5=e.AutoRoll if a5 and e.ARrules~=""and C:GetAttribute("AutoRollRules")~=e.ARrules then if#u.rec.rules==0 then
u.msg="pick your Auto Roll choices once in the game's menu so I can learn them"q(u.msg)else u.replay(gN,u.rec.rules)
if ad(function()return C:GetAttribute("AutoRollRules")==e.ARrules end,4)then q("Auto Roll choices put back")else
u.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"q(u.msg)end end end if a5==u.isOn()or(not a5 and not q4)then return end
local eo=a5 and u.rec.on or u.rec.off if not eo then local cK=a5 and u.rec.off or u.rec.on local lq=cK~=nil for q5=1,cK and cK.n or 0 do
if type(cK.args[q5])=="boolean"then lq=false end end if lq then eo=cK end end if not eo then u.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(a5 and"on"or"off")
q(u.msg)return end u.replay(gN,{eo})if ad(function()return u.isOn()==a5 end,4)then u.msg=""q(("Auto Roll switched %s%s"):format(a5 and"ON"or"OFF",lo and(" ("..lo..")")or""))
else u.msg="Auto Roll did not switch - do it once in the game so I can relearn it"q(u.msg)end end)u.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local q6,q7=pcall(function()return C.UserId end)return q6 and q7 or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local q8,gO=pcall(function()return require(au:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if q8 and type(gO)=="table"and type(gO.Pets)=="table"then j.I=gO end return j.I end function j.order()if j.list then return j.list end
local a6=j.info()if not a6 then return{}end local bs={}if type(a6 .Order)=="table"and#a6 .Order>0 then for uM,lr in ipairs(a6 .Order)do if a6 .Pets[lr]then bs[#bs+1]=lr end end
else for q9 in pairs(a6 .Pets)do bs[#bs+1]=q9 end table.sort(bs,function(q_,ra)return(a6 .Pets[q_].price or 0)<(a6 .Pets[ra].price or 0)end)
end j.list=bs return bs end function j.nice(ls,gP)local lt=j.info()local lu=lt and lt.Pets[ls]return((gP and gP~="")and(gP.." ")or"")..(lu and lu.displayName or tostring(ls))
end function j.data()local lv=C:GetAttribute("PetsData")if type(lv)~="string"then return nil end local rb,lw=pcall(function()return j.HS:JSONDecode(lv)end)
return(rb and type(lw)=="table")and lw or nil end function j.pen()return au:FindFirstChild("PetMeadowSpawns")end
function j.srv()return aB:GetServerTimeNow()end function j.money()local gQ=C:FindFirstChild("MoneyValue")if gQ and type(gQ.Value)=="number"then return gQ.Value end
return aG()or 0 end function j.wishes()local lx=j.pen()local ly=lx and lx:GetAttribute("Wishes")local gR,lz={},j.srv()
if type(ly)~="string"then return gR end local rc,lA=pcall(function()return j.HS:JSONDecode(ly)end)if rc and type(lA)=="table"then
for rd,gS in pairs(lA)do if type(gS)=="number"and gS>lz then gR[rd]=gS-lz end end end return gR end function j.call(...)
local lB=au:FindFirstChild("Remotes")local lC=lB and lB:FindFirstChild("PetRequest")if not lC then return nil end
local lD=table.pack(...)local bt={}task.spawn(function()bt.ok,bt.v=pcall(function()return lC:InvokeServer(table.unpack(lD,1,lD.n))end)
bt.done=true end)local re=r()while not bt.done and r()-re<6 do task.wait(0.05)end if bt.done and bt.ok then return bt.v end
return nil end function j.want(rf)return e.Pets[rf]end function j.buyTick()if not e.PetBuy then j.buyMsg="auto adopt is off"return end
local gT,lE,gU=j.info(),j.pen(),j.data()if not(gT and lE and gU)then j.buyMsg="pet data not loaded yet"return end
j.tryAt=j.tryAt or{}local cL,gV=#(gU.pets or{}),tonumber(gU.maxOwned)or 60 local rg,lF,cM=j.srv(),{},nil for uN,aw in ipairs(lE:GetChildren())do
lF[aw.Name]=true local cN,lG=aw:GetAttribute("Pet"),aw:GetAttribute("Variant")or""local gW=cN and j.want(cN)if gW and gW.b and gT.Pets[cN]and(not gW.g or lG=="Big")and not aw:GetAttribute("A_"..j.uid)
and(tonumber(aw:GetAttribute("ExpiresAt"))or 0)>rg+1 and r()>=(j.tryAt[aw.Name]or 0)then local cO,lH=j.nice(cN,lG),gT.Pets[cN].price or 0
if cL>=gV then cM=("%s is in the pen, but you have %d/%d pets"):format(cO,cL,gV)j.tryAt[aw.Name]=r()+15 elseif j.money()<lH then
cM=("%s is in the pen - need $%s"):format(cO,ao(lH))j.tryAt[aw.Name]=r()+5 else j.tryAt[aw.Name]=r()+8 local bS=j.call("adopt",aw.Name)
if type(bS)=="table"and bS.ok then cL=cL+1 j.buys=(j.buys or 0)+1 q("ADOPTED "..cO)cM="adopted "..cO else local lI=type(bS)=="table"and tostring(bS.reason or"no reason given")or"no answer"
q(("adopt %s failed: %s"):format(cO,lI))cM="adopt failed: "..lI if type(bS)=="table"and bS.bagFull then j.tryAt[aw.Name]=r()+60 end
end end end end for lJ in pairs(j.tryAt)do if not lF[lJ]then j.tryAt[lJ]=nil end end j.buyMsg=cM or("watching the pen (%d/%d pets)"):format(cL,gV)
end function j.wishTick()if not e.PetWish then j.wishMsg="auto wish is off"return end local ep=j.info()if not(ep and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local eq,gX,a7=j.wishes(),0,nil local rh=(type(ep.Wish)=="table"and ep.Wish.cashShare)or 2
for uO,al in ipairs(j.order())do local lK=j.want(al)if lK and lK.w then gX=gX+1 if not eq[al]and r()>=(j.wishTry[al]or 0)then
local gY=tonumber(C:GetAttribute("PetWishCredits"))or 0 local gZ=math.floor((ep.Pets[al].price or 0)*rh)if gY<=0 and j.money()<gZ then
j.wishTry[al]=r()+10 a7=("need $%s to wish for %s"):format(ao(gZ),j.nice(al))j.wishWhy[al]=a7 else j.wishTry[al]=r()+3
local ri=gY>0 and"wishCredit"or"wish"local er=j.call(ri,al)if type(er)=="table"and er.ok then j.wishN,j.wishWhy[al]=j.wishN+1,nil
q(("WISHED for %s (%s)"):format(j.nice(al),gY>0 and"free wish"or("$"..ao(gZ))))else local g0=type(er)=="table"and tostring(er.reason or"no reason given")or"no answer"
if g0:lower():find("already",1,true)then j.wishTry[al]=r()+2 else q(("wish %s failed: %s"):format(j.nice(al),g0))a7="wish failed: "..g0 end
end end end end end if not a7 then for uP,es in ipairs(j.order())do local lL=j.want(es)if lL and lL.w and not eq[es]and j.wishWhy[es]then a7=j.wishWhy[es]break end
end end if not a7 then local et={}for uQ,eu in ipairs(j.order())do local lM=j.want(eu)if lM and lM.w and eq[eu]then et[#et+1]=("%s %dm"):format(j.nice(eu),math.ceil(eq[eu]/60))end
end a7=gX==0 and"no pet has WISH ticked"or("running: "..(#et>0 and table.concat(et,", ")or"none yet"))end j.wishMsg=a7
end o.switches,o.glazed,o.finished=0,0,0 function o.teams()local g1=j.data()return(g1 and g1 .teams)or{},g1 end
function o.current(bT)bT=bT or j.data()if not bT then return""end local lN={}for uR,rj in ipairs(bT.equipped or{})do lN[tostring(rj)]=true end
for uS,lO in ipairs(bT.teams or{})do local lP=lO.pets or{}local g2=#lP==#(bT.equipped or{})if g2 then for uT,rk in ipairs(lP)do if not lN[tostring(rk)]then g2=false break end end end
if g2 then return lO.name end end return""end function o.equip(g3)local rl,rm=o.teams()local g4 for rn,ro in ipairs(rl)do if ro.name==g3 then g4=rn break end end
if not g4 then o.msg="no saved team called "..tostring(g3)return false end if o.current(rm)==g3 then return true end
for uU=1,4 do local lQ=j.call("teamEquip",g4)if type(lQ)=="table"and lQ.ok then o.switches=o.switches+1 return true
end task.wait(0.4)end return false end function o.waxes()local cP={}local lR=a.plot and a.plot:FindFirstChild("WaxStations")
if not lR then return cP end for uV,bu in ipairs(lR:GetChildren())do local lS=tonumber(bu:GetAttribute("PourEnd"))
local lT=bu:GetAttribute("PourOwner")if bu:GetAttribute("HasSquishy")and lS and(lT==nil or lT==j.uid)then local lU,lV=bu:FindFirstChild("SquishyPlaceHolder"),"?"
if lU then for uW,lW in ipairs(lU:GetChildren())do if lW:IsA("Model")then lV=lW.Name break end end end local rp=tostring(bu:GetAttribute("Helpers")or"")
local g5=0 for uX in rp:gmatch("%d+")do g5=g5+1 end cP[#cP+1]={st=bu,ends=lS,id=bu:GetAttribute("PourId"),name=lV,helps=g5}
end end table.sort(cP,function(rq,rr)return rq.ends<rr.ends end)return cP end function o.glazeCount()local lX=au:FindFirstChild("Remotes")
local lY=lX and lX:FindFirstChild("EditStack")if not lY then return nil end local rs,cQ=pcall(function()return lY:InvokeServer("State",nil)end)
if not(rs and type(cQ)=="table"and type(cQ.state)=="table")then return nil end local g6,g7=0,{}for uY,ev in ipairs(cQ.state.entries or{})do
if ev.glaze and ev.glaze~=""then g6=g6+1 g7[ev.glaze]=(g7[ev.glaze]or 0)+1 end end return g6,g7,#(cQ.state.entries or{}),cQ.state.capacity
end function o.finishedOne(ew,lZ)o.finished=o.finished+1 task.wait(2)local g8,rt,l0,ru=o.glazeCount()if g8 and lZ and g8>lZ then
o.glazed=o.glazed+1 local g9={}for rv,rw in pairs(rt)do g9[#g9+1]=rv.." "..rw end q(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(T(O(ew.name)),ew.st.Name,g8,table.concat(g9,", ")))
else q(("wax done on station %s: %s, no glaze%s"):format(ew.st.Name,T(O(ew.name)),l0 and(" (stack "..l0 .."/"..tostring(ru)..")")or""))
end end function o.tick()o.list=o.waxes()if not e.Teams then o.want,o.msg="","auto teams is off"return end local g_=j.srv()
local a8=o.glazeFor if a8 then local ex=a8 .st local rx=ex.Parent and ex:GetAttribute("HasSquishy")and ex:GetAttribute("PourId")==a8 .id
if not rx or g_>a8 .ends+40 then o.glazeFor,o.afterUntil=nil,r()+1.5 local ry=a8 .before task.spawn(function()pcall(o.finishedOne,a8,ry)end)
else a8 .ends=tonumber(ex:GetAttribute("PourEnd"))or a8 .ends end end if e.TeamGlaze~=""and not o.glazeFor then
for uZ,ha in ipairs(o.list)do if ha.ends-g_<=e.GlazeLead then o.glazeFor=ha task.spawn(function()ha.before=o.glazeCount()end)
break end end end local ar,ey="",""if e.TeamGlaze~=""and(o.glazeFor or r()<(o.afterUntil or 0))then ar,ey=e.TeamGlaze,o.glazeFor and(" - station "..o.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(o.placing or o.aboutToPlace())then ar,ey=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and o.allBusy()then
ar,ey=e.TeamFull," - every station is busy"else ar=e.TeamNormal end o.want=ar local cR=o.current()o.cur=cR if ar~=""and cR~=ar and r()>=(o.nextTry or 0)then
o.nextTry=r()+1.1 if o.equip(ar)then q("team: "..ar..ey)else o.nextTry=r()+3 end end local hb=o.list[1]o.msg=("on: %s%s | next wax done %s"):format(cR~=""and cR or"(not a saved team)",(ar~=""and ar~=cR)and(" -> "..ar)or"",
hb and("in "..o.clock(hb.ends-g_).." (st "..hb.st.Name..")")or"- none running")end function o.clock(a9)a9=math.max(0,math.floor(a9))
if a9>=3600 then return("%d:%02d:%02d"):format(math.floor(a9/3600),math.floor((a9%3600)/60),a9%60)end return("%d:%02d"):format(math.floor(a9/60),a9%60)
end function o.allBusy()local rz,rA=dt()return rA>0 and rz==0 end function o.aboutToPlace()if not a.running then return false end
local l1=M()if not(l1 and aF(l1))then return false end local rB=dt()return rB>0 end function o.expectSocialWax(rC)
local rD,l2=o.teams()local hc=j.info()local hd=0 if not(hc and l2)then return 0 end for u0,l3 in ipairs(rD)do
if l3 .name==rC then for u1,rE in ipairs(l3 .pets or{})do for u2,cS in ipairs(l2 .pets or{})do local ez=hc.Pets[cS.name]
if tostring(cS.id)==tostring(rE)and ez and ez.boost and ez.boost.kind=="socialWax"then local rF,rG=pcall(function()return hc.boostValue(cS.name,(cS.variant~=""and cS.variant)or nil)end)
hd=math.max(hd,(rF and tonumber(rG))or ez.boost.value or 0)end end end end end return hd end function o.glazeSoon()
return e.Teams and e.TeamGlaze~=""and(o.glazeFor~=nil or r()<(o.afterUntil or 0))end l.bb,l.fx,l.post,l.hud={},{},{},{}
l.mem,l.memPeak,l.fps=0,0,0 function l.isFx(bv)return bv:IsA("ParticleEmitter")or bv:IsA("Trail")or bv:IsA("Beam")or bv:IsA("Fire")or bv:IsA("Smoke")
or bv:IsA("Sparkles")or bv:IsA("Light")end function l.muteOne(ax)if not e.Lite or not ax.Parent then return end
if ax:IsA("BillboardGui")then if l.bb[ax]==nil and ax.Enabled then l.bb[ax]=true ax.Enabled=false end elseif l.isFx(ax)then
if l.fx[ax]==nil and ax.Enabled then l.fx[ax]=true ax.Enabled=false end end end function l.lite(l4)e.Lite=l4 if l4 then
task.spawn(function()for rH,rI in ipairs(aB:GetDescendants())do if not e.Lite then return end pcall(l.muteOne,rI)
if rH%600==0 then task.wait()end end end)if not l.addConn then l.queue={}l.addConn=L(aB.DescendantAdded:Connect(function(he)
if e.Lite and(he:IsA("BillboardGui")or l.isFx(he))then l.queue[#l.queue+1]=he end end))end local hf=game:GetService("Lighting")
for u3,cT in ipairs(hf:GetChildren())do if cT:IsA("PostEffect")and cT.Enabled and l.post[cT]==nil then l.post[cT]=true cT.Enabled=false end
end pcall(function()l.oldShadows=l.oldShadows==nil and hf.GlobalShadows or l.oldShadows hf.GlobalShadows=false end)
pcall(function()l.oldDeco=l.oldDeco==nil and aB.Terrain.Decoration or l.oldDeco aB.Terrain.Decoration=false end)
else for l5 in pairs(l.bb)do pcall(function()if l5 .Parent then l5 .Enabled=true end end)end for l6 in pairs(l.fx)do pcall(function()if l6 .Parent then l6 .Enabled=true end end)end
for l7 in pairs(l.post)do pcall(function()if l7 .Parent then l7 .Enabled=true end end)end l.bb,l.fx,l.post,l.queue={},{},{},{}
local rJ=game:GetService("Lighting")if l.oldShadows~=nil then pcall(function()rJ.GlobalShadows=l.oldShadows end)l.oldShadows=nil end
if l.oldDeco~=nil then pcall(function()aB.Terrain.Decoration=l.oldDeco end)l.oldDeco=nil end end end l.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function l.hideHud(l8)e.HideHud=l8 local hg=C:FindFirstChildOfClass("PlayerGui")if not hg then return end if l8 then
for u4,cU in ipairs(hg:GetChildren())do if cU:IsA("ScreenGui")and not l.MINE[cU.Name]and cU.Enabled then l.hud[cU]=true cU.Enabled=false end
end if not l.hudConn then l.hudConn=L(hg.ChildAdded:Connect(function(cV)if e.HideHud and cV:IsA("ScreenGui")and not l.MINE[cV.Name]then
task.defer(function()if e.HideHud and cV.Enabled then l.hud[cV]=true cV.Enabled=false end end)end end))end else
for l9 in pairs(l.hud)do pcall(function()if l9 .Parent then l9 .Enabled=true end end)end l.hud={}end end l.CAPS={0,30,15,10}
function l.cap(hh)e.FpsCap=hh local l_=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not l_ then return false end return pcall(l_,hh==0 and 60 or hh)end function l.render(ma)e.NoRender=ma pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not ma)end)
end function l.restoreAll()pcall(l.lite,false)pcall(l.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(l.cap,0)end end function l.rejoinSame(mb)if a.rejoining then return end q("REJOIN this server ("..mb..")")
pcall(dw)if a.autoload then pcall(dV,a.autoload)end f1()local rK=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,C)
end)task.delay(25,function()if a.alive then ck(mb..", same server failed")end end)return rK end function l.tick()
local hi=l.queue if e.Lite and hi and#hi>0 then l.queue={}for rL,rM in ipairs(hi)do pcall(l.muteOne,rM)if rL%300==0 then task.wait()end end
end local rN,cW=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if rN and type(cW)=="number"then
l.mem=cW l.memPeak=math.max(l.memPeak,cW)if(e.MemLimit or 0)>0 and cW>e.MemLimit then l.over=(l.over or 0)+1 if l.over>=30 and not a.busy then
l.over=-600 l.rejoinSame(("memory %d MB > %d MB"):format(cW,e.MemLimit))end elseif(l.over or 0)>0 then l.over=0
end end if r()-(l.noteAt or 0)>1800 then l.noteAt=r()q(("health: %d fps, %d MB (peak %d)"):format(math.floor(l.fps+0.5),l.mem,l.memPeak))
end end a.sellWords={"sell","trash","discard","dispose","bin"}local function hj(eA)if type(eA)~="string"then return false end
eA=eA:lower()for u5,rO in ipairs(a.sellWords)do if eA:find(rO,1,true)then return true end end return false end
local function rP()local mc=au:FindFirstChild("Remotes")local hk=mc and mc:FindFirstChild("SellSquishy")if not(hk and hk:IsA("RemoteEvent"))then return false end
if not pcall(function()hk:FireServer()end)then return false end return ad(function()return M()==nil end,1.5)end
local function rQ()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end if r()-a.sellSearchAt<20 then return nil end
a.sellSearchAt=r()local md=aH()local me=md and md.HumanoidRootPart.Position local cX,mf for u6,bU in ipairs((a.plot or aB):GetDescendants())do
if bU:IsA("ProximityPrompt")and(hj(bU.ActionText)or hj(bU.ObjectText)or hj(bU.Name))then local mg=iJ(bU)local hl=(mg and me)and(mg-me).Magnitude or 1e9
if hl<=400 and(not cX or hl<mf)then cX,mf=bU,hl end end end a.sellSpot=cX a.noSellSpot=(cX==nil)return cX end
local function mh()local hm=M()if not hm then a.holding=false return false end if aF(hm)then return false end
local hn=T(O(hm))if rP()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=r()+2.5,0
q("SOLD "..hn)return true end local bV=rQ()if bV then local mi=b9(bV)if mi then co(mi,bV)local mj=M()if mj and not aF(mj)then
local rR,rS=d7(bV,function()return M()==nil end,function()return bV.Enabled end)if rR then a.sold,a.holding,a.sellFails=a.sold+1,false,0
q(("SOLD %s at %s via %s"):format(hn,dr(bV),rS))return true end end end end a.sellFails=a.sellFails+1 q("could not sell "..hn.." ("..a.sellFails..")")
return false end local rT={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function rU(bW)local eB=dr(bW):lower()for u7,rV in ipairs(rT)do if eB:find(rV,1,true)then return 0 end end
local aE,V=bW.Name:lower(),0 local function ay(rW,rX)return rW:find(rX,1,true)~=nil end if ay(aE,"collect")then V=V+60 end
if ay(aE,"cash")or ay(aE,"money")then V=V+45 end if ay(aE,"income")or ay(aE,"claim")then V=V+35 end if ay(aE,"coin")or ay(aE,"earn")or ay(aE,"green")then V=V+20 end
if aE=="pad"or aE=="touch"then V=V+25 end if V==0 and(ay(eB,"collect")or ay(eB,"cash")or ay(eB,"money"))then V=25 end
if V==0 then return 0 end local cY=bW.Color if cY.G>0.5 and cY.G>cY.R*1.4 and cY.G>cY.B*1.4 then V=V+15 end if math.min(bW.Size.X,bW.Size.Y,bW.Size.Z)<2 then V=V+5 end
return V end local function rY()if a.padPart and a.padPart.Parent then return a.padPart end if not a.plot or r()-a.padSearchAt<20 then return nil end
a.padSearchAt=r()local eC,cZ,ho={},nil,29 for u8,eD in ipairs(a.plot:GetDescendants())do if eD:IsA("BasePart")then
local eE=rU(eD)if eE>0 then eC[#eC+1]={s=eE,p=eD}if eE>ho then cZ,ho=eD,eE end end end end table.sort(eC,function(rZ,r0)return rZ.s>r0 .s end)
a.padCands,a.padPart=eC,cZ if cZ then q("collect pad: "..dr(cZ).." (score "..ho..")")end return cZ end local hp="SAB_pad_v1.txt"
local function r1(r2)if type(writefile)=="function"then pcall(writefile,hp,table.concat({r2:GetComponents()},","))end
end local function r3()if type(isfile)~="function"or type(readfile)~="function"then return nil end local r4,mk=pcall(function()if isfile(hp)then return readfile(hp)end end)
if not r4 or type(mk)~="string"then return nil end local eF={}for r5 in mk:gmatch("[^,]+")do eF[#eF+1]=tonumber(r5)end
if#eF==12 then return CFrame.new(unpack(eF))end end local function r6(hq,eG,r7)local r8=f_(hq)local hr=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local az=(hr and hr:IsA("BasePart"))and(hr.Position-eG)or Vector3 .new(1,0,0)az=Vector3 .new(az.X,0,az.Z)if az.Magnitude<0.05 then az=Vector3 .new(1,0,0)end
az=az.Unit for r9=0,7 do local eH=r9*math.pi/4 local r_=Vector3 .new(az.X*math.cos(eH)-az.Z*math.sin(eH),0,az.X*math.sin(eH)+az.Z*math.cos(eH))
local eI=eG+r_*(r7+5)local hs=j2(eI.X,eG.Y,eI.Z)if hs and math.abs(hs.Y-eG.Y)<8 then cn(hq,Vector3 .new(eI.X,hs.Y+r8,eI.Z))
if ga(hq,0.7)then return true end end end return false end local function sa()a.lastCollect=r()local c0=aH()if not c0 then return end
local ml,sb=c0 .HumanoidRootPart,f_(c0)local c1,mm,c2,ht=nil,4,nil,"?"local hu=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if a.manualPad and hu and hu:IsA("BasePart")then c1,ht=(hu.CFrame*a.manualPad).Position,"manual pad"else local aP=rY()
if aP then c1=Vector3 .new(aP.Position.X,aP.Position.Y+aP.Size.Y/2+sb,aP.Position.Z)mm,c2,ht=math.max(aP.Size.X,aP.Size.Z)/2,aP,aP.Name
end end if not c1 then q("COLLECT: pad not found - stand on it and tap SET PAD")return end local hv=aG()cn(c0,c1)
if c2 and type(firetouchinterest)=="function"then pcall(firetouchinterest,ml,c2,0)end ah(e.PadDwell)if c2 and type(firetouchinterest)=="function"then pcall(firetouchinterest,ml,c2,1)end
ah(0.5)a.collected=a.collected+1 local hw=aG()q(("COLLECTED (%s) %s"):format(ht,(hv and hw and hw>hv)and("+$"..ao(hw-hv))or"no cash change seen"))
r6(c0,c1,mm)end local c3 local function mn()if a.capHit then if e.AutoStart and r()-(a.capAt or 0)>300 then a.capHit,a.placeFails=false,0
q("trying again after being stopped for 5 minutes")c3(true,true)else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end
if not aH()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aW(),nil,nil
if not a.plot then return nil,"own plot not found yet","wait"end end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local hx,mo=dt()local eJ=M()if eJ then local bX=T(O(eJ))if not aF(eJ)then local hy=(F.gift and O(F.gift)==O(eJ)and r()-F.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bX,hy),"bad"end if a.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bX,hy),"bad"end return"sell",("selling %s (%s)"):format(bX,hy),"warn"
end if hx<1 then return nil,("holding %s - 0 free stations"):format(bX),"wait"end if o.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(bX),"wait"end
return"place",("waxing %s (%d free)"):format(bX,hx),"ok"end a.holding=false if e.Crates and not d.waiting and r()-(d.scanAt or 0)>1 and r()>(d.quietUntil or 0)then
d.scanAt=r()local hz=a.plot:FindFirstChild("CrateStand")if hz then for u9,c4 in ipairs(hz:GetDescendants())do
if c4:IsA("ProximityPrompt")and c4 .Enabled and gp(c4)then local aQ=c4 .ObjectText if aQ==""then aQ=bF(hz,"TitleLabel")or""end
if aQ~=""and A.wanted(aQ)then local sc=dp(aQ):gsub("crate$","")local mp for mq in pairs(K.members)do if dp(mq)==sc then mp=mq end end
d.waiting,d.at,d.title,d.prompt=true,r(),aQ,c4 d.data={name=(aQ:gsub("%s","")),rarity=mp,title=aQ}q(aQ.." found waiting on your stand")
end break end end end end local mr=A.wanted(d.data and d.data.name)or A.wanted(d.title)if e.Crates and(d.on or d.waiting)and mr then
local aR=d.title if r()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aR),"bad"
end if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=r()+120,0 q("could not press the "..aR.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aR),"bad"end if r()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aR),"bad"
end if d.byYou and r()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aR,math.ceil(60-(r()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aR),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(aR),"bad"end if r()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aR),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aR,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not mr then local ms=d.title..tostring(d.rolledAt)if d.told~=ms then d.told=ms q(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and r()-d.rolledAt<6 and A.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if hx<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(mo,mo),"wait"
end local hA=iW()if not hA then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local c5=cl()
if c5 and km(c5 .name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(c5 .name),"idle"end
if r()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(c5 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(c5 .name),"ok"
end local a_=f8()if a_.state~="match"then a.matchSince=nil if a_.state=="skip"and not hA.Enabled then return nil,a_.text.." (sold out)","idle"end
return nil,a_.text,a_.level end if not hA.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local c6=r()if c6<a.noCashUntil then local mt,sd=jU()if mt then return nil,("cash short: have $%s, price ~$%s"):format(ao(mt),ao(sd)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ao(aG()),math.ceil(a.noCashUntil-c6)),"bad"end if c6-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
a.matchSince=a.matchSince or c6 local mu=c6-a.matchSince if mu<e.Confirm then return nil,("confirming %s (%.2fs)"):format(a_.shown,mu),"ok"end
return"buy",("buying %s via %s"):format(a_.shown,a_.src),"ok"end local function as(se,sf,...)if a.busy then return end
a.busy,a.busyText=true,se local sh,mv=pcall(sf,...)a.busy,a.busyText=false,""if not sh and mv~=fe then q("ERR "..tostring(mv))end
end local function si()local bw,sj,sk=mn()a.reason,a.level=sj,sk if bw=="place"then as("waxing...",o.place)elseif bw=="crate"then as("opening crate...",ef,true)
elseif bw=="cratesmart"then as("opening crate...",d.smart)elseif bw=="cratewin"then as("opening the crate window...",gr)
elseif bw=="nocrate"then as("discarding crate...",ef,false)elseif bw=="sell"then as("selling...",mh)elseif bw=="buy"then as("buying...",kc,false)
elseif e.Collect and not a.matchSince and r()-a.lastCollect>=e.Every then as("collecting money...",sa)end end
function c3(eK,sl)if eK==a.running then return end a.running=eK if not sl then e.AutoStart=eK end if eK then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=r()a.plot=aW()or a.plot
q("START")else a.reason="stopped"q("STOP")end end do local ba=fR(af.auto)if type(ba)=="string"then ba=ba:gsub("%s+$","")
if ba~=""then a.autoload=ba local sm=jG(ba)q(sm and("loaded config "..ba)or("config "..ba.." could not be loaded"))
end end end local f={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local sn={ok=f.good,wait=f.warn,warn=f.warn,bad=f.bad,idle=f.dim}local mw={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function D(so,sp,sq)local sr,hB=pcall(Instance.new,so)
if not sr then a.uiErrs=a.uiErrs+1 return nil end for ss,su in pairs(sp)do if not pcall(function()hB[ss]=su end)then a.uiErrs=a.uiErrs+1 end
end hB.Parent=sq return hB end local function aa(sv,sw)D("UICorner",{CornerRadius=UDim.new(0,sw or 6)},sv)end
local c={}local hC=C:FindFirstChildOfClass("PlayerGui")or C:WaitForChild("PlayerGui")local mx=hC:FindFirstChild("SABFarmGui")
if mx then mx:Destroy()end local hD=D("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},hC)
local W={w=320,h=330,head=30,strip=38,tabs=26}c.root=D("Frame",{Name="Root",Size=UDim2 .new(0,W.w,0,W.h),Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),
BackgroundColor3=f.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},hD)aa(c.root,10)D("UIStroke",{Color=f.line,Thickness=1},c.root)
local aS=UDim2 .new(1,0,1,0)local function y(my,mz)return UDim2 .new(my,0,0,0),UDim2 .new(mz,(my+mz>0.99)and 0 or-4,1,0)end
local function x(sx,sy,sz,sA,sB,sC)local mA=D("TextButton",{Text=sy,Position=sB,Size=sC,BackgroundColor3=sz,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=sA,TextColor3=f.text,AutoButtonColor=true},sx)aa(mA,6)return mA end local function eL(sD,sE,sF,sG,sH)
local hE=D("TextBox",{Text=sE,PlaceholderText=sF,Position=sG,Size=sH,BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=f.text,PlaceholderColor3=f.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},sD)aa(hE,6)D("UIPadding",{PaddingLeft=UDim.new(0,8)},hE)
return hE end local eM=aB.CurrentCamera local function sI()local sJ,eN=pcall(function()return eM and eM.ViewportSize end)
if sJ and eN and eN.X>50 and eN.Y>50 then return eN end end local function bc(c7)local hF=sI()if not(hF and c7 and c7 .Parent)then return end
local sK=pcall(function()local eO,mB=c7 .AbsolutePosition,c7 .AbsoluteSize local hG=70 local mC=math.clamp(eO.X,hG-mB.X,hF.X-hG)
local mD=math.clamp(eO.Y,0,hF.Y-math.min(mB.Y,hG))if math.abs(mC-eO.X)>0.5 or math.abs(mD-eO.Y)>0.5 then c7 .Position=UDim2 .new(0,math.floor(mC),0,math.floor(mD))
end end)return sK end local function eP(sL)local sM,hH=pcall(function()return sL.AbsolutePosition end)if sM and hH then return{math.floor(hH.X),math.floor(hH.Y)}end
end local eQ={}local function mE(eR,mF,mG)L(eR.InputBegan:Connect(function(c8)if c8 .UserInputType~=Enum.UserInputType.MouseButton1 and c8 .UserInputType~=Enum.UserInputType.Touch then return end
eQ[eR]={start=c8 .Position,from=mF.Position,moved=0,target=mF}local hI hI=c8 .Changed:Connect(function()if c8 .UserInputState==Enum.UserInputState.End then
local mH=eQ[eR]eQ[eR]=nil if hI then hI:Disconnect()end if mH and mG then mG(mH.moved)end end end)end))end L(nS.InputChanged:Connect(function(eS)
if eS.UserInputType~=Enum.UserInputType.MouseMovement and eS.UserInputType~=Enum.UserInputType.Touch then return end
for u_,aT in pairs(eQ)do local hJ=aT.target if hJ and hJ.Parent then local mI,mJ=eS.Position.X-aT.start.X,eS.Position.Y-aT.start.Y
aT.moved=math.max(aT.moved,math.abs(mI)+math.abs(mJ))hJ.Position=UDim2 .new(aT.from.X.Scale,aT.from.X.Offset+mI,aT.from.Y.Scale,aT.from.Y.Offset+mJ)
end end end))local function E(sN,sO,sP,sQ,sR,sS,sT)return D("TextLabel",{Text=sO,Position=sS or UDim2 .new(0,0,0,0),Size=sT or aS,BackgroundTransparency=1,
Font=sR and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=sP,TextColor3=sQ,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},sN)
end c.title=D("Frame",{Size=UDim2 .new(1,0,0,W.head),BackgroundColor3=f.panel,BorderSizePixel=0,Active=true},c.root)
c.dot=D("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=f.dim,BorderSizePixel=0},c.title)
aa(c.dot,5)E(c.title,"SAB  BUTTER FARM  "..bA,12,f.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))c.minB=x(c.title,"-",f.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
c.xB=x(c.title,"X",f.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))c.strip=D("Frame",{Position=UDim2 .new(0,0,0,W.head),Size=UDim2 .new(1,0,0,W.strip),BackgroundColor3=f.bg,BorderSizePixel=0},c.root)
c.bar=D("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=f.warn,BorderSizePixel=0},c.strip)
aa(c.bar,2)c.reason=E(c.strip,"starting",12,f.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))c.tabs=D("Frame",{Position=UDim2 .new(0,0,0,W.head+W.strip),Size=UDim2 .new(1,0,0,W.tabs),BackgroundTransparency=1},c.root)
c.tabFarm=x(c.tabs,"FARM",f.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))c.tabBut=x(c.tabs,"BUTTERS",f.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabCrt=x(c.tabs,"CRATES",f.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabPet=x(c.tabs,"PETS",f.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabTeam=x(c.tabs,"TEAMS",f.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabSet=x(c.tabs,"SETUP",f.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function bY()local hK=D("ScrollingFrame",{Position=UDim2 .new(0,0,0,W.head+W.strip+W.tabs),Size=UDim2 .new(1,0,1,-(W.head+W.strip+W.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=f.line,CanvasSize=UDim2 .new(0,0,0,100)},c.root)
D("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},hK)D("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},hK)
return hK end c.farm,c.but,c.set,c.crt=bY(),bY(),bY(),bY()c.pet,c.team=bY(),bY()c.but.Visible,c.set.Visible,c.crt.Visible,c.pet.Visible,c.team.Visible=false,false,false,false,false
local eT,c9,z=0,12,nil local function am(mK,sU)eT,c9=eT+1,c9+mK+6 return D("Frame",{Size=UDim2 .new(1,0,0,mK),BackgroundTransparency=1,LayoutOrder=eT},sU or c.farm)
end local function c_(sV)E(am(14),sV,10,f.dim,true)end z=am(34)c.startB=x(z,"START",f.good,14,y(0,0.68))c.killB=x(z,"KILL",f.bad,14,y(0.68,0.32))
local sW=am(42)local function da(mL,sX,hL)local hM=D("Frame",{Position=UDim2 .new((mL-1)/hL,0,0,0),Size=UDim2 .new(1/hL,mL<hL and-4 or 0,1,0),
BackgroundColor3=f.panel,BorderSizePixel=0},sW)aa(hM,6)local mM=E(hM,"0",15,f.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local sY=E(hM,sX,9,f.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))mM.TextXAlignment,sY.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return mM end c.sBought,c.sPlaced,c.sSold,c.sColl,c.sFree=da(1,"BOUGHT",5),da(2,"WAXED",5),da(3,"SOLD",5),da(4,"MONEY",5),da(5,"FREE",5)
c.info=E(am(40),"",10,f.dim,false)c.tgt=E(am(26),"",10,f.good,false)c_("MONEY COLLECT")z=am(28)c.secB=eL(z,tostring(e.Every),"60",y(0,0.2))
E(z,"sec",11,f.dim,false,y(0.21,0.09))c.secSet=x(z,"SET",f.accent,12,y(0.3,0.2))c.colT=x(z,"COLLECT: ON",f.accent,11,y(0.5,0.5))
z=am(26)c.padB=x(z,"SET PAD (stand on it)",f.panel2,10,y(0,0.55))c.padL=E(z,"",10,f.dim,false,y(0.56,0.44))c_("BUTTERS YOU DID NOT TICK, AND CRATES")
z=am(28)c.sellT=x(z,"SELL THEM: ON",f.accent,11,y(0,0.55))c.sellB=x(z,"SELL NOW",f.warn,11,y(0.55,0.45))z=am(28)
c.crateT=x(z,"OPEN CRATES: ON",f.accent,11,y(0,0.55))c.crateB=x(z,"OPEN NOW",f.warn,11,y(0.55,0.45))c_("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
z=am(28)c.arT=x(z,"AUTO ROLL: OFF",f.panel2,11,y(0,0.5))c.arL=E(z,"",9,f.dim,false,y(0.52,0.48))c_("TOOLS")z=am(30)
c.buyB=x(z,"BUY",f.warn,10,y(0,0.5))c.plB=x(z,"WAX",f.good,10,y(0.5,0.5))c_("LOG")c.log=D("TextLabel",{Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=f.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},am(84))aa(c.log,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},c.log)
c.farm.CanvasSize=UDim2 .new(0,0,0,c9)eT,c9=0,12 local function ab(sZ)return am(sZ,c.set)end local function db(s0)E(ab(14),s0,10,f.dim,true)end
db("SETTINGS FILE  (saved on your phone)")z=ab(28)c.cfgName=eL(z,"default","config name",y(0,0.5))c.cfgSave=x(z,"SAVE",f.good,11,y(0.5,0.25))
c.cfgLoad=x(z,"LOAD",f.accent,11,y(0.75,0.25))z=ab(26)c.cfgPrev=x(z,"<",f.panel2,11,y(0,0.13))c.cfgPick=x(z,"(none saved)",f.panel2,10,y(0.13,0.74))
c.cfgNext=x(z,">",f.panel2,11,y(0.87,0.13))z=ab(26)c.cfgAuto=x(z,"LOAD IT ON LAUNCH: OFF",f.panel2,10,y(0,1))
c.cfgMsg=E(ab(26),"",10,f.dim,false)db("START BY ITSELF")z=ab(26)c.autoB=x(z,"INSTALL F.exec",f.accent,10,y(0,1))
c.autoMsg=E(ab(30),"",10,f.dim,false)z=ab(28)c.startT=x(z,"START FARMING ON LOAD: ON",f.accent,10,y(0,1))E(ab(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,f.dim,false)
db("IF THE GAME DROPS ME")z=ab(28)c.rejT=x(z,"AUTO REJOIN: ON",f.accent,11,y(0,0.55))c.rejB=x(z,"REJOIN NOW",f.warn,11,y(0.55,0.45))
c.rejMsg=E(ab(30),"",10,f.dim,false)db("SMOOTHER RUNNING  (for long / overnight runs)")z=ab(28)c.pfLite=x(z,"LITE MODE: OFF",f.panel2,10,y(0,0.5))
c.pfHud=x(z,"HIDE GAME HUD: OFF",f.panel2,10,y(0.5,0.5))z=ab(28)c.pfFps=x(z,"FPS CAP: GAME",f.panel2,10,y(0,0.5))
c.pfRender=x(z,"STOP 3D: OFF",f.panel2,10,y(0.5,0.5))z=ab(28)c.pfMem=eL(z,tostring(e.MemLimit),"2000",y(0,0.24))
E(z,"MB: rejoin this server above it (0 = never)",9,f.dim,false,y(0.26,0.52))c.pfMemSet=x(z,"SET",f.accent,11,y(0.8,0.2))
c.pfInfo=E(ab(18),"",10,f.text,false)E(ab(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,f.dim,false)
db("THE ROUND SAB BUTTON")E(ab(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,f.dim,false)
c.set.CanvasSize=UDim2 .new(0,0,0,c9)local mN=D("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},hC)
c.tgRoot=D("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=f.accent,BorderSizePixel=0,Active=true},mN)aa(c.tgRoot,26)D("UIStroke",{Color=f.line,Thickness=1},c.tgRoot)
c.tgBtn=D("TextButton",{Text="SAB",Size=aS,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=f.text,AutoButtonColor=false},c.tgRoot)
c.tgDot=D("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=f.dim,BorderSizePixel=0},c.tgRoot)
aa(c.tgDot,4)local aU={built=false,boxes={},at=0}local function mO(mP,hN)e.Targets[mP]=hN or nil local hO=aU.boxes[mP]
if hO then hO.Text=hN and"X"or""hO.BackgroundColor3=hN and f.good or f.panel2 end end local function hP()for s1,mQ in pairs(aU.boxes)do
local mR=e.Targets[s1]==true mQ.Text=mR and"X"or""mQ.BackgroundColor3=mR and f.good or f.panel2 end end local dc
local function s2()local s3=0 local hQ=D("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},c.but)
c.butInfo=E(hQ,"",10,f.dim,false,y(0,0.5))local s4=x(hQ,"CLEAR",f.panel2,10,y(0.5,0.24))local s5=x(hQ,"REFRESH",f.panel2,10,y(0.74,0.26))
s4 .MouseButton1Click:Connect(function()for s6 in pairs(e.Targets)do e.Targets[s6]=nil end hP()end)s5 .MouseButton1Click:Connect(function()
K.at=0 fQ()dc(true)end)return s3 end dc=function(s7)if not fQ()then if not c.butEmpty then c.butEmpty=E(D("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},c.but),
"butter list not loaded yet - open this tab again in a moment",11,f.warn,false)end return end if aU.built and not s7 and aU.at==K.at then return end
for va,hR in ipairs(c.but:GetChildren())do if hR:IsA("Frame")or hR:IsA("TextButton")then hR:Destroy()end end aU.boxes,c.butEmpty={},nil
s2()local hS,hT=36,1 local function mS(mT)hT=hT+1 local s8=D("Frame",{Size=UDim2 .new(1,0,0,mT),BackgroundTransparency=1,LayoutOrder=hT},c.but)
hS=hS+mT+6 return s8 end for vb,eU in ipairs(K.rarOrder)do local s9=mS(24)local s_=mw[eU]or f.text local hU=D("Frame",{Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0},s9)
aa(hU,6)E(hU,"  "..eU:upper(),11,s_,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local ta=x(hU,"ALL",f.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local tb=eU ta.MouseButton1Click:Connect(function()local mU=K.members[tb]or{}local mV=false for vc,tc in ipairs(mU)do if not e.Targets[tc]then mV=true break end end
for vd,td in ipairs(mU)do mO(td,mV)end end)for ve,hV in ipairs(K.members[eU]or{})do local te=mS(22)local eV=D("TextButton",{Text="",Size=aS,BackgroundColor3=f.bg,BorderSizePixel=0,
AutoButtonColor=true},te)aa(eV,5)E(eV,"   "..T(hV),11,f.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local hW=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=f.text,AutoButtonColor=false},eV)aa(hW,4)aU.boxes[hV]=hW local mW=hV local function mX()mO(mW,not e.Targets[mW])end
eV.MouseButton1Click:Connect(mX)hW.MouseButton1Click:Connect(mX)end end hP()c.but.CanvasSize=UDim2 .new(0,0,0,hS+10)
aU.built,aU.at=true,K.at end function A.paint()for tf,mY in pairs(A.boxes)do local mZ=e.CrateTicks[tf]==true mY.Text=mZ and"X"or""
mY.BackgroundColor3=mZ and f.good or f.panel2 end if c.crtInfo then local hX,hY=0,0 for vf in pairs(A.boxes)do hX=hX+1 end
for vg,tg in pairs(e.CrateTicks)do if tg then hY=hY+1 end end c.crtInfo.Text=("%d crates, %d ticked"):format(hX,hY)
end if c.crtAll then c.crtAll.Text=e.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"c.crtAll.BackgroundColor3=e.Crates and f.accent or f.panel2
end end function A.build()for vh,hZ in ipairs(c.crt:GetChildren())do if hZ:IsA("Frame")or hZ:IsA("TextButton")then hZ:Destroy()end
end A.boxes={}local h0,h1=12,0 local function eW(m0)h1=h1+1 h0=h0+m0+6 return D("Frame",{Size=UDim2 .new(1,0,0,m0),BackgroundTransparency=1,LayoutOrder=h1},c.crt)
end local h2=eW(28)c.crtInfo=E(h2,"",10,f.dim,false,y(0,0.5))local th=x(h2,"CLEAR",f.panel2,10,y(0.5,0.24))local ti=x(h2,"REFRESH",f.panel2,10,y(0.74,0.26))
L(th.MouseButton1Click:Connect(function()e.CrateTicks={}A.paint()end))L(ti.MouseButton1Click:Connect(function()A.build()end))
c.crtAll=x(eW(28),"",f.accent,11,y(0,1))L(c.crtAll.MouseButton1Click:Connect(function()e.Crates=not e.Crates A.paint()end))
E(eW(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,f.dim,false)
for vi,aV in ipairs(A.list())do local tj=eW(24)local dd=D("TextButton",{Text="",Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0,AutoButtonColor=true},tj)
aa(dd,5)E(dd,"  "..(aV.title or aV.name)..(aV.guess and"  (?)"or""),11,mw[aV.rar or""]or f.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
E(dd,aV.price and("$"..ao(aV.price))or(aV.rar or""),9,f.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local h3=D("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=f.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=f.text,AutoButtonColor=false},dd)aa(h3,4)A.boxes[aV.k]=h3 local m1=aV.k local function m2()e.CrateTicks[m1]=(not e.CrateTicks[m1])or nil
A.paint()end L(dd.MouseButton1Click:Connect(m2))L(h3 .MouseButton1Click:Connect(m2))end c.crt.CanvasSize=UDim2 .new(0,0,0,h0+10)
A.built=A.at A.paint()end local m3="farm"local function bd(ac)m3=ac c.farm.Visible,c.but.Visible,c.set.Visible=(ac=="farm"),(ac=="but"),(ac=="set")
c.crt.Visible=(ac=="crt")c.pet.Visible,c.team.Visible=(ac=="pet"),(ac=="team")c.tabCrt.BackgroundColor3=(ac=="crt")and f.accent or f.panel2
c.tabPet.BackgroundColor3=(ac=="pet")and f.accent or f.panel2 c.tabTeam.BackgroundColor3=(ac=="team")and f.accent or f.panel2
if ac=="pet"and not j.built then pcall(j.build)end if ac=="team"and not o.built then pcall(o.build)end if ac=="crt"and(A.built~=A.at or not next(A.boxes))then A.build()end
c.tabFarm.BackgroundColor3=(ac=="farm")and f.accent or f.panel2 c.tabBut.BackgroundColor3=(ac=="but")and f.accent or f.panel2
c.tabSet.BackgroundColor3=(ac=="set")and f.accent or f.panel2 if ac=="but"then dc(false)end end local function N(m4,m5,tk,tl)
m4 .Text=m5 and tk or tl m4 .BackgroundColor3=m5 and f.accent or f.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(m6)
local de=j.rows and j.rows[m6]if not de then return end local eX=e.Pets[m6]or{}de.b.BackgroundColor3=eX.b and f.good or f.panel2
de.g.BackgroundColor3=eX.g and f.accent or f.panel2 de.g.Text=eX.g and"BIG"or"ANY"de.w.BackgroundColor3=eX.w and f.warn or f.panel2
end function j.flag(h4,h5)local bx=e.Pets[h4]or{}if bx[h5]then bx[h5]=nil else bx[h5]=true end e.Pets[h4]=(bx.b or bx.g or bx.w)and bx or nil
j.paintRow(h4)end function j.paintAll()for tm in pairs(j.rows or{})do j.paintRow(tm)end if c.pbT then N(c.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(c.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")end end function j.live()if not j.built then j.build()return end
if r()-(j.liveAt or 0)<1 then return end j.liveAt=r()local m7=j.wishes()for h6,tn in pairs(j.rows)do tn.name.Text=j.nice(h6)..(m7[h6]and("   * wish %dm"):format(math.ceil(m7[h6]/60))or"")
end local eY=j.data()local m8=tonumber(C:GetAttribute("PetWishCredits"))or 0 c.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eY and#(eY.pets or{})or 0,eY and tonumber(eY.maxOwned)or 60,
ao(j.money()),m8>0 and(" | free wishes "..m8)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local eZ=j.info()for vj,h7 in ipairs(c.pet:GetChildren())do if h7:IsA("Frame")or h7:IsA("TextLabel")then h7:Destroy()end
end j.rows={}local h8,e0=0,12 local function bZ(m9)h8,e0=h8+1,e0+m9+6 return D("Frame",{Size=UDim2 .new(1,0,0,m9),BackgroundTransparency=1,LayoutOrder=h8},c.pet)
end local m_=bZ(28)c.pbT=x(m_,"AUTO ADOPT: OFF",f.panel2,10,y(0,0.5))c.pwT=x(m_,"AUTO WISH: OFF",f.panel2,10,y(0.5,0.5))
c.pbT.MouseButton1Click:Connect(function()e.PetBuy=not e.PetBuy j.paintAll()end)c.pwT.MouseButton1Click:Connect(function()e.PetWish=not e.PetWish j.paintAll()end)
c.pInfo=E(bZ(44),"",10,f.dim,false)E(bZ(40),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (costs 2x its price, 20 min, one per pet per server).",9,f.dim,false)
if not eZ then E(bZ(30),"pet list not loaded yet - open this tab again in a moment",11,f.warn,false)c.pet.CanvasSize=UDim2 .new(0,0,0,e0)
j.built=false return end local b0={}for vk,na in ipairs(j.order())do local h9=eZ.Pets[na].rarity or"?"b0[h9]=b0[h9]or{}
table.insert(b0[h9],na)end local b1={}for vl,nb in ipairs(eZ.Rarities or{})do if b0[nb]then b1[#b1+1]=nb end end
for nc in pairs(b0)do if not table.find(b1,nc)then b1[#b1+1]=nc end end for vm,e1 in ipairs(b1)do local nd=D("Frame",{Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0},bZ(22))
aa(nd,6)E(nd,"  "..e1:upper(),11,j.RC[e1]or f.text,true)for vn,e2 in ipairs(b0[e1])do local b2=D("Frame",{Size=aS,BackgroundColor3=f.bg,BorderSizePixel=0},bZ(38))
aa(b2,5)local to=E(b2,j.nice(e2),11,j.RC[e1]or f.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-122,0,17))local tp,tq=pcall(function()return eZ.describe(e2)end)
E(b2,tp and tostring(tq)or"",9,f.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-122,0,17))local ne=x(b2,"BUY",f.panel2,9,UDim2 .new(1,-114,0.5,-11),UDim2 .new(0,34,0,22))
local nf=x(b2,"ANY",f.panel2,9,UDim2 .new(1,-77,0.5,-11),UDim2 .new(0,34,0,22))local ng=x(b2,"WISH",f.panel2,9,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,36,0,22))
local h_=e2 ne.MouseButton1Click:Connect(function()j.flag(h_,"b")end)nf.MouseButton1Click:Connect(function()j.flag(h_,"g")end)
ng.MouseButton1Click:Connect(function()j.flag(h_,"w")end)j.rows[e2]={b=ne,g=nf,w=ng,name=to}end end c.pet.CanvasSize=UDim2 .new(0,0,0,e0+10)
j.built=true j.paintAll()end function l.paint()N(c.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")N(c.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")
N(c.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")N(c.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not c.pfMem:IsFocused()then c.pfMem.Text=tostring(e.MemLimit)end end function l.applyAll()if e.Lite then l.lite(true)end
if e.HideHud then l.hideHud(true)end if e.NoRender then l.render(true)end if(e.FpsCap or 0)~=0 then l.cap(e.FpsCap)end
l.paint()end L(c.pfLite.MouseButton1Click:Connect(function()l.lite(not e.Lite)l.paint()end))L(c.pfHud.MouseButton1Click:Connect(function()l.hideHud(not e.HideHud)l.paint()end))
L(c.pfRender.MouseButton1Click:Connect(function()l.render(not e.NoRender)l.paint()end))L(c.pfFps.MouseButton1Click:Connect(function()
local tr=table.find(l.CAPS,e.FpsCap or 0)or 1 local nh=l.CAPS[(tr%#l.CAPS)+1]if not l.cap(nh)and nh~=0 then q("this executor cannot cap fps")end
l.paint()end))L(c.pfMemSet.MouseButton1Click:Connect(function()local ia=tonumber(c.pfMem.Text)if ia and ia>=0 then e.MemLimit=math.floor(ia)end
l.paint()end))function o.names()local ib={"(none)"}for vo,ts in ipairs((o.teams()))do ib[#ib+1]=ts.name end return ib
end function o.cycle(ic,tt)local e3=o.names()local tu=e[ic]~=""and e[ic]or"(none)"local e4=table.find(e3,tu)or 1
e4=((e4-1+tt)%#e3)+1 e[ic]=e3[e4]=="(none)"and""or e3[e4]o.paint()end function o.paint()if not o.built then return end
N(c.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")local ie={}for vp,tv in ipairs((o.teams()))do ie[tv.name]=true end
for tw,ni in pairs(o.pick)do local b3=e[tw]ni.Text=b3==""and"(none)"or(ie[b3]and b3 or(b3 .." (missing)"))ni.TextColor3=(b3~=""and not ie[b3])and f.bad or f.text
end if not c.tmLead:IsFocused()then c.tmLead.Text=tostring(e.GlazeLead)end c.tmInfo.Text=(o.msg or"")..("\nswitches %d | waxes finished %d | glazed %d"):format(o.switches,o.finished,o.glazed)
local tx,e5=j.srv(),{}for vq,e6 in ipairs(o.list or{})do e5[#e5+1]=("st %-2s %-22s %9s  helps %d"):format(e6 .st.Name,T(O(e6 .name)):sub(1,22),o.clock(e6 .ends-tx),e6 .helps)
end c.tmList.Text=#e5>0 and table.concat(e5,"\n")or"no waxes running"end function o.build()for vr,ig in ipairs(c.team:GetChildren())do
if ig:IsA("Frame")or ig:IsA("TextLabel")then ig:Destroy()end end o.pick={}local ih,ii=0,12 local function by(nj)
ih,ii=ih+1,ii+nj+6 return D("Frame",{Size=UDim2 .new(1,0,0,nj),BackgroundTransparency=1,LayoutOrder=ih},c.team)
end local function df(ty)E(by(14),ty,10,f.dim,true)end local function e7(e8)local ij=by(26)local tz=x(ij,"<",f.panel2,11,y(0,0.14))
local nk=x(ij,"(none)",f.panel,10,y(0.14,0.72))local tA=x(ij,">",f.panel2,11,y(0.86,0.14))tz.MouseButton1Click:Connect(function()o.cycle(e8,-1)end)
tA.MouseButton1Click:Connect(function()o.cycle(e8,1)end)nk.MouseButton1Click:Connect(function()o.cycle(e8,1)end)
o.pick[e8]=nk end c.tmT=x(by(28),"AUTO TEAMS: OFF",f.panel2,11,y(0,1))c.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=o.current()end o.paint()end)c.tmInfo=E(by(30),"",10,f.dim,false)
df("NORMAL TEAM  (worn the rest of the time)")e7("TeamNormal")df("FULL TEAM  (worn while every station is busy)")
e7("TeamFull")df("GLAZE TEAM  (worn just before a wax finishes)")e7("TeamGlaze")local ik=by(26)c.tmLead=eL(ik,tostring(e.GlazeLead),"45",y(0,0.2))
E(ik,"sec before it finishes",10,f.dim,false,y(0.22,0.5))local tB=x(ik,"SET",f.accent,11,y(0.75,0.25))tB.MouseButton1Click:Connect(function()
local e9=tonumber(c.tmLead.Text)if e9 and e9>=5 and e9<=600 then e.GlazeLead=math.floor(e9)else c.tmLead.Text=tostring(e.GlazeLead)end
o.paint()end)df("WAX TEAM  (worn while a butter is placed)")e7("TeamWax")df("YOUR WAXES  (time left, helps)")
c.tmList=D("TextLabel",{Size=aS,BackgroundColor3=f.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=f.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},by(150))aa(c.tmList,6)D("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},c.tmList)
E(by(92),"Teams are the loadouts you saved in the game's Teams page. A wax's time is fixed when it is placed and its glaze is rolled when it finishes, so the WAX team only needs to be on while placing and the GLAZE team only at the finish. While every station is busy only wax-stir pets (Seal, Koala) still help, so the FULL team can be money + stir. A help never leaves a wax under 60 s, so 45 s is enough. While AUTO TEAMS is on it keeps putting the right team back.",9,f.dim,false)
c.team.CanvasSize=UDim2 .new(0,0,0,ii+10)o.built=true o.paint()end local function tC()c.secB.Text=tostring(e.Every)
N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then c3(e.AutoStart,true)end if a.winPos then c.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then c.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end bc(c.root)bc(c.tgRoot)a.lastCollect=r()
hP()A.paint()pcall(j.paintAll)pcall(o.paint)pcall(l.applyAll)end local function tD(nl)task.spawn(function()nl.TextColor3=f.bad
task.wait(0.8)if a.alive then nl.TextColor3=f.text end end)end local function nm()local nn=c.secB.Text:match("^%s*(%d+)%s*$")
local dg=nn and tonumber(nn)if not dg or dg<1 then c.secB.Text=tostring(e.Every)tD(c.secB)q("interval must be a whole number >= 1")
return end if dg==e.Every then return end e.Every,a.lastCollect=dg,r()q("collect every "..dg.."s")end local function H(tE,tF)L(tE.MouseButton1Click:Connect(tF))end
H(c.secSet,nm)L(c.secB.FocusLost:Connect(nm))H(c.colT,function()e.Collect,a.lastCollect=not e.Collect,r()N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)H(c.sellT,function()e.SellJunk=not e.SellJunk N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)H(c.sellB,function()
a.sellFails=0 task.spawn(as,"selling...",mh)end)H(c.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(u.apply,"you asked",true)
end)H(c.crateT,function()e.Crates=not e.Crates N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)H(c.crateB,function()
d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(as,"opening crate...",ef,true)end)H(c.padB,function()
a.plot=aW()or a.plot local no,il=aH(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(no and il and il:IsA("BasePart"))then q("SET PAD: need character and plot")return end
a.manualPad=il.CFrame:ToObjectSpace(no.HumanoidRootPart.CFrame)r1(a.manualPad)q("collect pad saved at your position")
end)H(c.startB,function()c3(not a.running)end)H(c.buyB,function()a.plot=aW()or a.plot task.spawn(as,"buying (manual)...",kc,true)
end)H(c.plB,function()a.plot=aW()or a.plot task.spawn(as,"waxing (manual)...",kh)end)H(c.tabFarm,function()bd("farm")end)
H(c.tabBut,function()bd("but")end)H(c.tabSet,function()bd("set")end)H(c.tabCrt,function()bd("crt")end)H(c.tabPet,function()bd("pet")end)
H(c.tabTeam,function()bd("team")end)local function np(im)a.hidden=im c.root.Visible=not im c.tgBtn.Text=im and"SAB+"or"SAB"
end mE(c.tgRoot,c.tgRoot,function(tG)bc(c.tgRoot)a.togPos=eP(c.tgRoot)or a.togPos if tG<8 then np(not a.hidden)end
end)H(c.tgBtn,function()np(not a.hidden)end)local an,ae={},0 local function be()an=jx()if#an==0 then c.cfgPick.Text="(none saved)"
ae=0 return end if ae<1 or ae>#an then ae=1 end c.cfgPick.Text=an[ae]..("  (%d/%d)"):format(ae,#an)end local function nq()
local nr=a.autoload~=nil c.cfgAuto.Text=nr and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"c.cfgAuto.BackgroundColor3=nr and f.accent or f.panel2
end local function io()local ns=c.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if ns~=""then return ns end return(ae>0 and an[ae])or""
end H(c.cfgSave,function()a.winPos=eP(c.root)or a.winPos a.togPos=eP(c.tgRoot)or a.togPos local nt,nu=dV(io())
c.cfgMsg.Text=nt and("saved as "..nu)or("could not save: "..nu)c.cfgMsg.TextColor3=nt and f.good or f.bad be()
q(c.cfgMsg.Text)end)local function tH(ip)local iq,nv=jG(ip)c.cfgMsg.Text=iq and("loaded "..nv)or("could not load: "..nv)
c.cfgMsg.TextColor3=iq and f.good or f.bad if iq then c.cfgName.Text=ip tC()task.spawn(u.apply,"config "..ip)
end q(c.cfgMsg.Text)end H(c.cfgLoad,function()tH(io())end)H(c.cfgPick,function()be()if ae>0 then c.cfgName.Text=an[ae]end
end)H(c.cfgPrev,function()if#an==0 then be()return end ae=(ae-2)%#an+1 be()c.cfgName.Text=an[ae]end)H(c.cfgNext,function()
if#an==0 then be()return end ae=ae%#an+1 be()c.cfgName.Text=an[ae]end)H(c.cfgAuto,function()if a.autoload then
jI(nil)c.cfgMsg.Text="it will not load a config on launch"else local dh=io()local nw=false for vs,tI in ipairs(jx())do if tI==dh then nw=true end end
local tJ=nw or dV(dh)if tJ and dh~=""then jI(dh)be()c.cfgMsg.Text=dh.." will load every time the script starts"
else c.cfgMsg.Text="name the config and save it first"end end c.cfgMsg.TextColor3=f.dim nq()end)H(c.autoB,function()
local nx,ny=pn()c.autoMsg.Text=nx and("installed. "..ny)or("failed: "..ny)c.autoMsg.TextColor3=nx and f.good or f.bad
q(c.autoMsg.Text)end)H(c.startT,function()e.AutoStart=not e.AutoStart N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)H(c.rejT,function()e.Rejoin=not e.Rejoin N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)H(c.rejB,function()ck("you asked")end)
local bz=false H(c.minB,function()bz=not bz c.tabs.Visible=not bz if bz then c.farm.Visible,c.but.Visible,c.set.Visible,c.crt.Visible=false,false,false,false
c.pet.Visible,c.team.Visible=false,false else bd(m3)end c.root.Size=UDim2 .new(0,W.w,0,bz and(W.head+W.strip)or W.h)
c.minB.Text=bz and"+"or"-"end)local function e_()if not a.alive then return end a.alive,a.running=false,false
pcall(l.restoreAll)pcall(dw)for vt,tK in ipairs(ff)do pcall(function()tK:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()hD:Destroy()end)pcall(function()mN:Destroy()end)if bB.SAB_KILL==e_ then bB.SAB_KILL=nil end end
bB.SAB_KILL=e_ H(c.killB,e_)H(c.xB,e_)mE(c.title,c.root,function()bc(c.root)a.winPos=eP(c.root)or a.winPos end)
local function nz()local di,dj=a.reason,a.level if a.busy then di,dj=a.busyText,"ok"elseif not a.running then
local vu,nA,tL=mn()if a.capHit then di,dj=nA,"bad"else di,dj="[stopped] "..nA,(tL=="bad")and"bad"or"idle"end a.reason,a.level=di,dj
end c.reason.Text=di c.bar.BackgroundColor3=sn[dj]or f.dim c.dot.BackgroundColor3=a.running and f.good or(a.capHit and f.bad or f.dim)
c.tgDot.BackgroundColor3=c.dot.BackgroundColor3 c.tgRoot.BackgroundColor3=a.hidden and f.panel2 or f.accent c.startB.Text=a.running and"STOP"or"START"
N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")c.startB.BackgroundColor3=a.running and f.warn or f.good
local tM,tN=dt()c.sBought.Text,c.sPlaced.Text,c.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
c.sColl.Text,c.sFree.Text=tostring(a.collected),tM.."/"..tN local nB=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(r()-a.lastCollect)))or nil
local nC=M()c.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ao(aG()),a.rolls,a.gifts,a.crates,nC and T(O(nC))or"nothing",d.on and("   ["..d.title.." window open]")or"",nB and("in "..nB.."s")or"off")
local b4=oZ()c.tgt.Text=(#b4==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#b4<=3)and table.concat(b4,", ")or(#b4 .." butters ticked")))
c.tgt.TextColor3=(#b4==0)and f.bad or f.good c.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
c.log.Text=table.concat(dm,"\n")if c.butInfo then c.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(K.n,#K.rarOrder,#b4)
end if c.but.Visible and aU.at~=K.at then dc(false)end if c.crt.Visible then if A.built~=A.at then A.build()else A.paint()end
end if c.pet.Visible then j.live()end if c.set.Visible then c.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(l.fps+0.5),l.mem,l.memPeak)
end if c.team.Visible then o.paint()end N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")N(c.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local nD=(u.rec.on and"on"or"")..(u.rec.off and((u.rec.on and"/"or"").."off")or"")c.arL.Text=u.msg~=""and u.msg or("game: %s | learned: %s%s"):format(u.isOn()and"ON"or"off",
nD~=""and nD or"nothing yet",#u.rec.rules>0 and", choices"or"")c.arL.TextColor3=u.msg~=""and f.warn or f.dim end
bB.SAB={S=a,CFG=e,EV=F,U=c,sg=hD,CAT=K,LEARN=Q,buildList=dc,logAll=b5,evAll=b6,AR=u,CR=A,PF=l,PX=j,TM=o,CRATE=d}
q(bA.." loaded")if a.uiErrs>0 then q("UI: "..a.uiErrs.." properties skipped")end bd("farm")bc(c.root)bc(c.tgRoot)
if eM then pcall(function()L(eM:GetPropertyChangedSignal("ViewportSize"):Connect(function()task.wait(0.2)bc(c.root)
bc(c.tgRoot)end))end)end be()nq()if a.config and a.config~=""then c.cfgName.Text=a.config end N(c.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
N(c.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
c.secB.Text=tostring(e.Every)pcall(l.applyAll)pcall(nz)task.spawn(function()local nE=fZ()c.rejMsg.Text=nE and("after a rejoin it restarts from\n"..nE)or
"no saved copy of this script found, so after a rejoin you would start it by hand"c.autoMsg.Text=(fR(af.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(pt)end)task.spawn(function()while a.alive do local tO,tP=pcall(nz)if not tO then q("UI ERR "..tostring(tP))end
task.wait((a.hidden or bz)and 1.5 or 0.25)end end)task.spawn(function()local tQ,tR=pcall(pC)if not tQ then q("HOOK ERR "..tostring(tR))end
end)task.spawn(function()pcall(oj)if d.loadSeq and not d.learned then local fa={}for nF=1,20 do if d.loadSeq[nF]then fa[#fa+1]=d.loadSeq[nF]end end
if#fa>0 then d.learned={seq=fa,mode=d.loadMode}q("remembered how to open crates directly")end end if fQ()then q(("catalog: %d butters in %d rarities"):format(K.n,#K.rarOrder))end
local tS,nG=pcall(r3)if tS and nG and a.alive and not a.manualPad then a.manualPad=nG end end)task.spawn(function()
while a.alive do local ir,is=pcall(j.buyTick)if not ir then q("PET ERR "..tostring(is))task.wait(5)end ir,is=pcall(j.wishTick)
if not ir then q("WISH ERR "..tostring(is))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local fb,nH=0,r()
L(game:GetService("RunService").Heartbeat:Connect(function()fb=fb+1 end))l.noteAt=r()while a.alive do task.wait(1)
local nI=r()l.fps,fb,nH=fb/math.max(nI-nH,0.001),0,nI local tT,tU=pcall(l.tick)if not tT then q("PERF ERR "..tostring(tU))task.wait(5)end
end end)task.spawn(function()while a.alive do local tV,tW=pcall(o.tick)if not tV then q("TEAM ERR "..tostring(tW))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()while a.alive do task.wait(20)pcall(dw)end end)pcall(u.watchCache)
if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then pcall(function()local tY=(type(newcclosure)=="function")and newcclosure or function(tX)return tX end
local it local nJ=(type(setnamecallmethod)=="function")and setnamecallmethod or nil it=hookmetamethod(game,"__namecall",tY(function(nK,...)
local dk=getnamecallmethod()if a.alive and(dk=="InvokeServer"or dk=="FireServer")then local nL,nM=pcall(function()return nK.Name end)
if nL and nM=="CrateAction"and not d.replaying then pcall(d.saw,dk,...)elseif nL and nM=="AutoRollAction"and not u.replaying then pcall(u.saw,dk,...)end
if nJ then nJ(dk)end end return it(nK,...)end))d.oldNC=it end)end if fd then L(C.Idled:Connect(function()pcall(function()fd:CaptureController()fd:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for vv=1,90 do if not a.alive then return end if C:GetAttribute("AutoRollOn")~=nil and aH()and(a.plot or aW())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then u.apply("joined")end while a.alive do task.wait(30)if a.alive and e.AutoRoll and a.running and not u.isOn()and not cl()and not M()
and not d.waiting and not d.on and not a.busy then u.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for vw=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or aW()if aH()and a.plot and next(e.Targets)then c3(true,true)q("started by itself")
return end task.wait(1)end if a.alive and not a.running then q("gave up waiting to start - tap START")end end)
task.spawn(function()a.plot=aW()a.lastCollect=r()while a.alive do if a.running then local tZ,nN=pcall(si)if not tZ and nN~=fe then q("LOOP ERR "..tostring(nN))end
end task.wait(0.1)end end)fc("loaded - window is at the top left")end local t1,iu=xpcall(nR,function(t0)return tostring(t0).."\n"..debug.traceback()end)
if not t1 then pcall(function()warn("SAB "..bA.." ERROR: "..tostring(iu))end)fc("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bA.." ERROR: "..tostring(iu))end)pcall(function()local nO=(type(getgenv)=="function"and getgenv())or _G
if type(nO.SAB_KILL)=="function"then nO.SAB_KILL()end for vx,t2 in ipairs({"SABFarmGui","SABToggle"})do local nP=C.PlayerGui:FindFirstChild(t2)
if nP then nP:Destroy()end end end)pcall(function()local dl=Instance.new("ScreenGui")dl.Name="SABError"dl.ResetOnSpawn=false
dl.DisplayOrder=1000 local aA=Instance.new("TextBox")aA.Size=UDim2 .new(0,340,0,170)aA.Position=UDim2 .new(0,10,0,50)
aA.BackgroundColor3=Color3 .fromRGB(90,20,20)aA.TextColor3=Color3 .new(1,1,1)aA.TextSize=11 aA.TextWrapped=true
aA.ClearTextOnFocus=false aA.TextXAlignment=Enum.TextXAlignment.Left aA.TextYAlignment=Enum.TextYAlignment.Top
aA.Text="SAB "..bA.." failed to start. Send this text:\n"..tostring(iu)aA.Parent=dl dl.Parent=C:WaitForChild("PlayerGui")
end)end
