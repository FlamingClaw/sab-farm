local bu="v25"local h5=game:GetService("Players")local z=h5 .LocalPlayer or h5 .PlayerAdded:Wait()local function eW(ne)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..bu,Text=ne,Duration=6})
end)end eW("script started")local function nf()local ar=game:GetService("ReplicatedStorage")local b0=game:GetService("Workspace")
local ng=game:GetService("UserInputService")local bv=(type(getgenv)=="function"and getgenv())or _G if type(bv.SAB_KILL)=="function"then pcall(bv.SAB_KILL)end
local q=(type(tick)=="function")and tick or os.clock local eX=(function()local nh,ni=pcall(function()return game:GetService("VirtualUser")end)return nh and ni or nil end)()
local f={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},Teams=false,TeamNormal="",TeamGlaze="",TeamWax="",GlazeLead=45,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=q(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local E={name=nil,rar=nil,at=q(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local r={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local d={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local j,l={},{}local eY={}local eZ,da,b1,b2={},{},{},{}local function P(h6)eZ[#eZ+1]=h6 return h6 end local function al(nj)
task.wait(nj)if not a.alive then error(eY,0)end end local function o(db)db=os.date("%H:%M:%S").." "..tostring(db)
table.insert(da,1,db)if#da>6 then table.remove(da)end b1[#b1+1]=db if#b1>80 then table.remove(b1,1)end end local function dc(h7)
if type(h7)~="string"then return""end return(h7:lower():gsub("[^%w]",""))end local function J(nk)local h8=dc(nk)
local e0=h8:gsub("butter$","")if e0==""then e0=h8 end return e0 end local function aS(e1)return type(e1)=="string"and J(e1)~=""and f.Targets[J(e1)]==true end
local function nl(b3)b3=b3:lower()return b3:find("squishy",1,true)~=nil or b3:match("butter$")~=nil or b3:match("butter[^%a]")~=nil
end local e2={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function am(b4)if type(b4)~="number"then return"?"end
local dd=1 while math.abs(b4)>=1000 and dd<#e2 do b4=b4/1000 dd=dd+1 end local nm=string.format("%.2f",b4):gsub("%.?0+$","")
return nm..e2[dd]end local function nn(h9)if type(h9)~="string"then return nil end local no,h_=h9:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local e3=tonumber(no)if not e3 then return nil end if h_==""then return e3 end for np,nq in ipairs(e2)do if nq:lower()==h_:lower()then return e3*1000^(np-1)end end
return nil end local function aC()local ia=z:GetAttribute("BoardValueMoney")if type(ia)=="number"then return ia end
local ib=z:FindFirstChild("leaderstats")if ib then for s_,nr in ipairs({"Cash","Money","Coins"})do local e4=ib:FindFirstChild(nr)
if e4 and type(e4 .Value)=="number"then return e4 .Value end end end end local function de(ns)local e5=ns:GetFullName()
if a.plot then local e6=a.plot:GetFullName()if e5:sub(1,#e6)==e6 then return e5:sub(#e6+2)end end return e5 end
local function aD()local df=z.Character if df and df:FindFirstChild("HumanoidRootPart")then local ic=df:FindFirstChildOfClass("Humanoid")
if ic and ic.Health>0 then return df end end end local function aT()local e7=b0:FindFirstChild("Plots")if not e7 then return nil end
local function ie(nt)local ig=nt:FindFirstChild("Plate")return ig~=nil and ig:FindFirstChild("EditStackAttachment",true)~=nil
end local ih=z:GetAttribute("PlotNumber")if ih~=nil then local e8=e7:FindFirstChild(tostring(ih))if e8 and ie(e8)then return e8 end
end for ta,ii in ipairs(e7:GetChildren())do if ie(ii)then return ii end end end local function b5(ij)local aU=ij and ij.Parent
for tb=1,6 do if not aU then return nil end if aU:IsA("BasePart")then return aU end if aU:IsA("Model")then return aU.PrimaryPart or aU:FindFirstChildWhichIsA("BasePart",true)end
aU=aU.Parent end end local function ik(il)local e9=il.Parent if e9 and e9:IsA("Attachment")then return e9 .WorldPosition end
local im=b5(il)return im and im.Position end local function nu()local bw=a.plot and a.plot:FindFirstChild("Plate")
if not bw then return nil end if bw:IsA("BasePart")then return bw.Position end if bw:IsA("Model")then return bw:GetPivot().Position end
local io=bw:FindFirstChildWhichIsA("BasePart",true)return io and io.Position end local function ip()local e_={}
local iq=a.plot and a.plot:FindFirstChild("WaxStations")if iq then for tc,nv in ipairs(iq:GetChildren())do local ir=nv:FindFirstChild("SquishyPlaceHolder")
local fa=ir and ir:FindFirstChild("PlacePrompt")if fa and fa:IsA("ProximityPrompt")then e_[#e_+1]=fa end end end
return e_ end local function is()local it,fb=ip(),0 for td,nw in ipairs(it)do if nw.Enabled then fb=fb+1 end end
local fc=#it local fd=z:GetAttribute("WaxStations")if type(fd)=="number"and fd>fc then fc=fd end return fb,fc
end local function nx()local iu=aD()local iv=iu and iu.HumanoidRootPart.Position local fe,iw for te,ff in ipairs(ip())do
if ff.Enabled then local ix=ik(ff)local iy=(ix and iv)and(ix-iv).Magnitude or 1e9 if not fe or iy<iw then fe,iw=ff,iy end
end end return fe end local function iz()local dg=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not dg then return nil end local iA=dg:FindFirstChild("BuyPromptAttachment")local dh=(iA and iA:FindFirstChild("BuyPrompt"))or dg:FindFirstChild("BuyPrompt",true)
if dh and dh:IsA("ProximityPrompt")and dh:IsDescendantOf(dg)then return dh end end local iB={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local ny={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local M={order={},price={},dirty=false}local u={seen={},at=0,boxes={},built=0}local H={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local fg="SAB_order.txt"local function fh()if not M.dirty or type(writefile)~="function"then return end local af={}
for nz,nA in pairs(M.price)do af[#af+1]="P|"..nz.."|"..string.format("%.0f",nA)end for nB,nC in pairs(M.order)do af[#af+1]="O|"..nB.."|"..table.concat(nC,",")end
if d.learned and d.enc then af[#af+1]="M|mode|"..tostring(d.learned.mode or"")for nD,di in ipairs(d.learned.seq)do
local iC={}for iD=1,di.n do iC[iD]=d.enc(di.args[iD])end af[#af+1]=("A|%d|%s|%d|%s"):format(nD,di.m,di.n,table.concat(iC,";"))
end end local function fi(nE,nF,dj)local iE={}for iF=1,dj.n do iE[iF]=d.enc(dj.args[iF])end af[#af+1]=("R|%d|%s|%s|%d|%s"):format(nF,nE,dj.m,dj.n,table.concat(iE,";"))
end if d.enc then for nG,nH in ipairs(r.rec.rules)do fi("rules",nG,nH)end if r.rec.on then fi("on",0,r.rec.on)end
if r.rec.off then fi("off",0,r.rec.off)end end for tf,b6 in pairs(u.seen)do af[#af+1]=("K|%s|%s|%s|%s"):format(b6 .name,b6 .title or"",b6 .rar or"",b6 .price and string.format("%.0f",b6 .price)or"")
end if pcall(writefile,fg,table.concat(af,"\n"))then M.dirty=false end end local function nI()if type(isfile)~="function"or type(readfile)~="function"then return end
local nJ,nK=pcall(isfile,fg)if not(nJ and nK)then return end local nL,iG=pcall(readfile,fg)if not(nL and type(iG)=="string")then return end
for nM in iG:gmatch("[^\n]+")do local bx,by,aE=nM:match("^(%a)|([^|]+)|(.*)$")if bx=="P"then M.price[by]=tonumber(aE)
elseif bx=="M"then d.loadMode=(aE~=""and aE~="nil")and aE or nil elseif bx=="A"and d.dec then local iH=tonumber(by)
local iI,dk,nN=aE:match("^([^|]+)|(%d+)|(.*)$")if iH and iI then dk=tonumber(dk)local iJ,dl={},0 for nO in(nN..";"):gmatch("([^;]*);")do
dl=dl+1 if dl<=dk then iJ[dl]=d.dec(nO)end end d.loadSeq=d.loadSeq or{}d.loadSeq[iH]={m=iI,n=dk,args=iJ}end elseif bx=="R"and d.dec then
local iK=tonumber(by)local dm,nP,dn,nQ=aE:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if iK and dm then dn=tonumber(dn)
local iL,dp={},0 for nR in(nQ..";"):gmatch("([^;]*);")do dp=dp+1 if dp<=dn then iL[dp]=d.dec(nR)end end local fj={m=nP,n=dn,args=iL}
if dm=="rules"then r.rec.rules[iK]=fj elseif dm=="on"then r.rec.on=fj elseif dm=="off"then r.rec.off=fj end end
elseif bx=="K"then local iM,iN,nS=aE:match("^([^|]*)|([^|]*)|(.*)$")u.seen[u.key(by)]={name=by,title=iM~=""and iM or nil,
rar=iN~=""and iN or nil,price=tonumber(nS)}elseif bx=="O"and aE~=""then local dq={}for nT in aE:gmatch("[^,]+")do dq[#dq+1]=nT end
if#dq>0 then M.order[by]=dq end end end end local function nU(dr)if type(dr)~="table"then return end local bb,iO=dr.rarity,dr.contents
if type(bb)~="string"or bb==""or type(iO)~="table"then return end local b7={}for tg,ds in ipairs(iO)do if type(ds)=="table"and type(ds.butter)=="string"then
b7[#b7+1]={n=ds.butter,ch=tonumber(ds.chance)or 0}end end if#b7==0 then return end table.sort(b7,function(nV,nW)return nV.ch>nW.ch end)
local b8,b9={},false for nX,nY in ipairs(b7)do b8[nX]=nY.n end local fk=M.order[bb]if not fk or#fk~=#b8 then b9=true end
if not b9 then for iP=1,#b8 do if fk[iP]~=b8[iP]then b9=true break end end end M.order[bb]=b8 local fl=tonumber(dr.price)
if fl and M.price[bb]~=fl then M.price[bb]=fl b9=true end if b9 then M.dirty=true H.at=0 o("learned the "..bb.." order from its crate")
end end local function bz(nZ,n0)local n1=nZ:FindFirstChild(n0,true)local n2,fm=pcall(function()return n1 .Text end)
return(n2 and type(fm)=="string"and fm~="")and fm or nil end local function Q(iQ)return H.pretty[iQ]or iQ end
u.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function u.key(n3)return dc(n3 or"")end
function u.learn(aF)if type(aF)~="table"or type(aF.name)~="string"then return end local fn=u.key(aF.name)local aG=u.seen[fn]or{}
local n4=(u.seen[fn]==nil)or(tonumber(aF.price)and aG.price~=tonumber(aF.price))aG.name,aG.title=aF.name,aF.title or aG.title
aG.rar,aG.price=aF.rarity or aG.rar,tonumber(aF.price)or aG.price u.seen[fn]=aG if n4 then u.at,M.dirty=q(),true end
end function u.wanted(iR)return iR~=nil and f.CrateTicks[u.key(iR)]==true end function u.list()local bA={}for n5,dt in ipairs(u.base)do bA[u.key(dt[1])]={name=dt[1],title=dt[2],rar=dt[3],i=n5}end
for th,b_ in ipairs(H.rarOrder)do local iS=false for ti,n6 in pairs(bA)do if n6 .rar==b_ then iS=true break end end
if not iS and b_~="?"then local iT=b_:gsub("[^%w]","").."Crate"bA[u.key(iT)]={name=iT,title=b_.." Crate",rar=b_,i=50,guess=true}
end end for iU,du in pairs(u.seen)do local az=bA[iU]or{i=100}az.name,az.title,az.rar=du.name or az.name,du.title or az.title,du.rar or az.rar
az.price,az.guess=du.price or az.price,nil bA[iU]=az end local ca,dv={},{}for n7,n8 in ipairs(iB)do ca[n8]=n7 end
for n9,iV in ipairs(H.rarOrder)do ca[iV]=ca[iV]or(20+n9)end for n_,cb in pairs(bA)do cb.k=n_ cb.price=cb.price or M.price[cb.rar or""]
dv[#dv+1]=cb end table.sort(dv,function(bc,bd)if bc.price and bd.price and bc.price~=bd.price then return bc.price<bd.price end
local iW,iX=ca[bc.rar or""]or 99,ca[bd.rar or""]or 99 if iW~=iX then return iW<iX end if(bc.i or 100)~=(bd.i or 100)then return(bc.i or 100)<(bd.i or 100)end
return bc.k<bd.k end)return dv end local function oa()local iY=ar:FindFirstChild("Assets")local iZ=iY and iY:FindFirstChild("Squishies")
if not iZ then return false end local fo,i0,bB={},{},{}local dw=0 for tj,dx in ipairs(iZ:GetChildren())do local cc=J(dx.Name)
if cc~=""and not fo[cc]then local dy=bz(dx,"RarityText")or"?"fo[cc]=dy i0[cc]=bz(dx,"NameText")or dx.Name bB[dy]=bB[dy]or{}
table.insert(bB[dy],cc)dw=dw+1 end end if dw==0 then return false end for i1,ob in pairs(bB)do local i2=M.order[i1]or ny[i1]
local fp={}if i2 then for oc,od in ipairs(i2)do fp[J(od)]=oc end end table.sort(ob,function(i3,i4)local fq,fr=fp[i3],fp[i4]
if fq and fr then return fq<fr end if fq then return true end if fr then return false end return Q(i3)<Q(i4)end)
end local fs={}for oe,of in ipairs(iB)do fs[of]=oe end local dz={}for og in pairs(bB)do dz[#dz+1]=og end table.sort(dz,function(ft,fu)
local fv,fw=M.price[ft],M.price[fu]if fv and fw and fv~=fw then return fv<fw end local fx,fy=fs[ft],fs[fu]if fx and fy then return fx<fy end
if fx then return true end if fy then return false end return ft<fu end)H.rar,H.pretty,H.members,H.rarOrder,H.n,H.at=fo,i0,bB,dz,dw,q()
return true end local function fz()if H.at==0 or(q()-H.at)>120 then pcall(oa)end return H.n>0 end local function oh(oi)
local i5=J(oi)return H.rar[i5]or(E.name and J(E.name)==i5 and E.rar)or"?"end local function oj()local dA={}for ol,om in pairs(f.Targets)do if om then dA[#dA+1]=Q(ol)end end
table.sort(dA)return dA end local ad={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function i6()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function dB(i7)if type(makefolder)~="function"then return end local oo,op=pcall(isfolder,i7)if not(oo and op)then pcall(makefolder,i7)end
end local function fA(i8)if type(isfile)~="function"or type(readfile)~="function"then return nil end local oq,ot=pcall(isfile,i8)
if not(oq and ot)then return nil end local ou,ov=pcall(readfile,i8)return ou and ov or nil end local function dC(ow,ox)
if type(writefile)~="function"then return false end return(pcall(writefile,ow,ox))end local function i9(oy)local cd={}
if type(listfiles)~="function"then return cd end local oz,i_=pcall(listfiles,oy)if not oz or type(i_)~="table"then return cd end
for tk,oA in ipairs(i_)do cd[#cd+1]=tostring(oA)end return cd end local function ja()local dD={}for tl,oB in ipairs(i9(ad.cfg))do
local jb=oB:match("([^/\\]+)%.txt$")if jb then dD[#dD+1]=jb end end table.sort(dD)return dD end local function oC()
local K={"V|1"}K[#K+1]="N|Every|"..tostring(f.Every)K[#K+1]="N|GlazeLead|"..tostring(f.GlazeLead)for tm,jc in ipairs({"TeamNormal","TeamGlaze","TeamWax"})do K[#K+1]="S|"..jc.."|"..f[jc]end
do local dE={}for oD,fB in pairs(f.Pets)do local jd=(fB.b and"b"or"")..(fB.g and"g"or"")..(fB.w and"w"or"")if jd~=""then dE[#dE+1]=oD.."|"..jd end
end table.sort(dE)K[#K+1]="P|-"for tn,oE in ipairs(dE)do K[#K+1]="P|"..oE end end for to,je in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams"})do
K[#K+1]="B|"..je.."|"..(f[je]and"1"or"0")end local fC=z:GetAttribute("AutoRollRules")if type(fC)=="string"and fC~=""then f.ARrules,f.ARstop=fC,tostring(z:GetAttribute("AutoRollStop")or"")end
if f.ARrules~=""then K[#K+1]="S|rules|"..f.ARrules K[#K+1]="S|stop|"..f.ARstop end if a.winPos then K[#K+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then K[#K+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end for tp,fD in ipairs({{"T",f.Targets},{"K",f.CrateTicks}})do
local dF={}for oF,oG in pairs(fD[2])do if oG then dF[#dF+1]=oF end end table.sort(dF)K[#K+1]=fD[1].."|-"for tq,oH in ipairs(dF)do K[#K+1]=fD[1].."|"..oH end
end return table.concat(K,"\n")end local function oI(fE)if type(fE)~="string"or fE==""then return false end local jf,jg,jh,ji,ce={},false,{},false,nil
for oJ in fE:gmatch("[^\n]+")do local as,O,an=oJ:match("^(%a)|([^|]*)|?(.*)$")if as=="N"and O=="Every"then local fF=tonumber(an)
if fF and fF>=1 then f.Every=math.floor(fF)end elseif as=="N"and O=="GlazeLead"then local dG=tonumber(an)if dG and dG>=5 and dG<=600 then f.GlazeLead=math.floor(dG)end
elseif as=="S"and(O=="TeamNormal"or O=="TeamGlaze"or O=="TeamWax")then f[O]=an elseif as=="P"and O~=""then if not ce then ce={}end
if O~="-"and an~=""then ce[O]={b=an:find("b",1,true)and true or nil,g=an:find("g",1,true)and true or nil,w=an:find("w",1,true)and true or nil}
end elseif as=="B"then if f[O]~=nil then f[O]=(an=="1")end elseif as=="S"and O=="rules"then f.ARrules=an elseif as=="S"and O=="stop"then
f.ARstop=an elseif as=="W"then a.winPos={tonumber(O)or 10,tonumber(an)or 44}elseif as=="G"then a.togPos={tonumber(O)or 10,tonumber(an)or 300}
elseif as=="T"and O~=""then if O~="-"then jf[O]=true end jg=true elseif as=="K"and O~=""then if O~="-"then jh[O]=true end
ji=true end end if jg then f.Targets=jf end if ji then f.CrateTicks=jh end if ce then f.Pets=ce end return true
end local function fG(bC)if not i6()then return false,"this executor cannot write files"end bC=(bC or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if bC==""then return false,"give the config a name"end dB(ad.dir)dB(ad.cfg)if not dC(ad.cfg.."/"..bC..".txt",oC())then return false,"could not write the file"end
a.config=bC return true,bC end local function jj(dH)local jk=fA(ad.cfg.."/"..dH..".txt")if not jk then return false,"no config called "..tostring(dH)end
if not oI(jk)then return false,"that config looks empty"end a.config=dH return true,dH end local function jl(fH)
if fH then dB(ad.dir)dC(ad.auto,fH)elseif type(delfile)=="function"then pcall(delfile,ad.auto)else dC(ad.auto,"")
end a.autoload=fH end local function fI()if a.selfPath then return a.selfPath end local dI for tr,oK in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ad.dir})do
for ts,jm in ipairs(i9(oK))do local fJ=jm:lower()if fJ:sub(-4)==".lua"and(fJ:find("sab_farm",1,true)or fJ:find("sab farm",1,true))then
dI=dI or jm end end end a.selfPath=dI return dI end ad.stub=[[
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
local function oL()if not i6()then return false,"this executor cannot write files"end dB("autoexec")if not dC(ad.exec,ad.stub)then return false,"could not write to the autoexec folder"end
local jn=fI()return true,jn and("it will load "..jn)or"now save this script in Delta so the loader can find it"
end local dJ=(function()local oM,oN=pcall(function()return game:GetService("TeleportService")end)return oM and oN or nil end)()
local function jo()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local oO=queueonteleport or queue_on_teleport local jp=fI()if not jp then return false end return(pcall(oO,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(jp)))
end local function dK(oP)if a.rejoining then return end a.rejoining=true o("REJOIN ("..oP..")")pcall(fh)if a.autoload then pcall(fG,a.autoload)end
local oQ=jo()o(oQ and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for tt=1,30 do if not dJ then break end pcall(function()dJ:Teleport(game.PlaceId,z)end)task.wait(10)
end end)end local function oR()local oS,jq=pcall(function()return game:GetService("GuiService")end)if oS and jq then
pcall(function()P(jq.ErrorMessageChanged:Connect(function()if f.Rejoin then dK("roblox error message")end end))
end)end pcall(function()local jr=game:GetService("CoreGui")local js=jr and jr:WaitForChild("RobloxPromptGui",15)
local jt=js and js:WaitForChild("promptOverlay",15)if jt then P(jt.ChildAdded:Connect(function(oT)if f.Rejoin and tostring(oT.Name):lower():find("errorprompt",1,true)then dK("disconnect prompt")end
end))end end)pcall(function()P(z.OnTeleport:Connect(function(oU)if tostring(oU):find("Started")then jo()end end))
end)if dJ then pcall(function()P(dJ.TeleportInitFailed:Connect(function()a.rejoining=false if f.Rejoin then task.delay(5,function()dK("teleport retry")end)end
end))end)end end local function ju(oV)local jv=a.plot and a.plot:FindFirstChild(oV)if not jv then return nil,false end
for tu,fK in ipairs(jv:GetChildren())do if fK:IsA("Model")or fK:IsA("BasePart")then return fK,true end end return nil,true
end local function cf()local aV=ju("RolledSquishy")if not aV then return nil end return{model=aV,name=aV.Name,pretty=bz(aV,"NameText")or Q(J(aV.Name)),
rar=bz(aV,"RarityText")or oh(aV.Name),price=bz(aV,"PriceText")}end local function jw(fL)return type(fL)=="string"and(H.rar[J(fL)]~=nil or nl(fL))
end local function L()local fM=ju("SquishyEquipped")if fM then a.carrySrc,d.heldAt="model",q()return fM.Name,fM end
local jx=z.Character if jx then for tv,cg in ipairs(jx:GetDescendants())do if(cg:IsA("Model")or cg:IsA("Tool"))and jw(cg.Name)then
a.carrySrc,d.heldAt="character",q()return cg.Name,cg end end end local dL=z:GetAttribute("SquishyEquipped")if type(dL)=="string"and dL~=""and jw(dL)and q()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return dL,nil end a.carrySrc=nil end local function tw()local tx,oW=L()return oW end local function jy()
local jz=cf()local fN=jz and nn(jz.price)local fO=aC()if fN and fO and fO<fN*0.5 then return fO,fN end end local function bD(oX)
b2[#b2+1]=os.date("%H:%M:%S").." "..oX if#b2>40 then table.remove(b2,1)end end local function oY(be,dM)if type(be)~="string"then return end
bD(("Roll(%s,%s)"):format(be,tostring(dM)))if be:lower():find("crate",1,true)then d.rolled,d.rolledAt=be,q()return
end E.seq=E.seq+1 E.name,E.at=be,q()E.rar=type(dM)=="string"and dM or nil a.rolls=a.rolls+1 if aS(be)then o(("ROLL %s [%s] = TARGET"):format(be,tostring(dM)))end
end local function oZ(bf)if type(bf)~="table"then return end local dN=bf.butter or bf.itemName if type(dN)~="string"then return end
a.gifts=a.gifts+1 E.gift,E.giftAt=dN,q()if type(bf.giftId)=="string"then local jA=ar:FindFirstChild("Remotes")
local jB=jA and jA:FindFirstChild("GiftThanks")if jB then pcall(function()jB:FireServer(bf.giftId)end)end end
bD("Gift("..dN.." from "..tostring(bf.fromName)..")")o(("GIFT from %s: %s - it will not be waxed"):format(tostring(bf.fromName),dN))
end local function o0()local jC=ar:WaitForChild("Remotes",30)if not a.alive then return end if not jC then o("Remotes folder missing - no roll events")return end
P(z:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local jD=z:GetAttribute("SquishyEquipped")
if type(jD)=="string"and jD~=""then d.heldAt=q()end end))local o6={SquishyRollAnimation=oY,InitSquishy=function(jE)E.init,E.initAt=tostring(jE),q()bD("Init("..tostring(jE)..")")end,
CrateUpdate=function(bE,jF)pcall(nU,bE)pcall(u.learn,bE)if type(bE)=="table"then local o1=jF==true or(d.rolled~=nil and q()-d.rolledAt<15)or d.waiting
if not o1 then return end local o2=not d.waiting local o3=d.on d.waiting,d.data,d.at=true,bE,q()d.on=(jF==true)
d.title=tostring(bE.title or bE.name or"crate")if d.on and not o3 then d.openedAt,d.byYou=q(),not d.ours if d.onShow then task.spawn(d.onShow)end
end if d.on then bD("CrateWindow open("..d.title..")")elseif o2 then bD("Crate waiting("..d.title..")")o(d.title.." is waiting on your stand")
end else if d.waiting then bD("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil local o4=d.byYou
d.summonFails,d.ours,d.byYou=0,false,false if d.onGone then task.spawn(d.onGone,o4)end if d.classify then local o5=q()
task.spawn(function()pcall(d.classify,o5)end)end end end,GiftReceived=oZ,}for dO,o7 in pairs(o6)do local fP=jC:FindFirstChild(dO)
if fP and fP:IsA("RemoteEvent")then P(fP.OnClientEvent:Connect(o7))elseif dO~="CrateUpdate"and dO~="GiftReceived"then o("remote "..dO.." missing")end
end end local function fQ()local bh=cf()if bh then if aS(bh.name)then return{state="match",shown=bh.pretty,src="pad",info=bh}
end return{state="skip",info=bh,level="idle",text=("on pad: %s [%s] - not ticked"):format(bh.pretty,tostring(bh.rar))}
end if E.name and(q()-E.at)<4 then if aS(E.name)then return{state="match",shown=Q(J(E.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(Q(J(E.name)),tostring(E.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function jG(o8,o9,o_,pa)
local dP=RaycastParams.new()dP.FilterType=Enum.RaycastFilterType.Exclude local fR={z.Character}for ty,pb in ipairs(pa or{})do fR[#fR+1]=pb end
dP.FilterDescendantsInstances=fR pcall(function()dP.RespectCanCollide=true end)local jH=b0:Raycast(Vector3 .new(o8,o9+4,o_),Vector3 .new(0,-30,0),dP)
return jH and jH.Position or nil end local function fS(jI)local jJ=jI:FindFirstChildOfClass("Humanoid")return((jJ and jJ.HipHeight)or 2)+jI.HumanoidRootPart.Size.Y/2+0.2
end local function fT(pc,pd)local jK=pc:FindFirstChildOfClass("Humanoid")local pe=q()while q()-pe<pd do if jK and jK.FloorMaterial~=Enum.Material.Air then return true end
al(0.05)end return false end local function ci(pf,fU,fV)local jL=pf.HumanoidRootPart jL.AssemblyLinearVelocity=Vector3 .new(0,0,0)
jL.CFrame=fV and CFrame.new(fU,Vector3 .new(fV.X,fU.Y,fV.Z))or CFrame.new(fU)end local function cj(aH,jM)local bi=aD()
if not bi or not aH then return false end local aW=aH.Position local dQ=math.clamp(math.max(aH.Size.X,aH.Size.Z)/2+2.2,3,7)
local jN=(jM and jM.MaxActivationDistance)or 10 if dQ>jN-2 then dQ=math.max(2.5,jN-2)end local ck={}local function bj(cl)
cl=Vector3 .new(cl.X,0,cl.Z)if cl.Magnitude>0.05 then ck[#ck+1]=cl.Unit end end local jO=nu()if jO then bj(jO-aW)end
bj(aH.CFrame.LookVector)bj(-aH.CFrame.LookVector)bj(aH.CFrame.RightVector)bj(-aH.CFrame.RightVector)bj(bi.HumanoidRootPart.Position-aW)
if#ck==0 then bj(Vector3 .new(0,0,1))end local pg,dR=fS(bi),false for tz,ph in ipairs(ck)do local dS=aW+ph*dQ
local fW=jG(dS.X,aW.Y,dS.Z,{aH})if fW and math.abs(fW.Y-aW.Y)<14 then ci(bi,Vector3 .new(dS.X,fW.Y+pg,dS.Z),aW)
if fT(bi,0.7)then dR=true break end end end if not dR then ci(bi,aW+ck[1]*dQ+Vector3 .new(0,3,0),aW)dR=fT(bi,1)
end al(0.12)return dR end local function pj(cm)if not cm.Parent or not cm.Enabled then return false end pcall(function()cm:InputHoldBegin()end)
al(math.max(cm.HoldDuration,0)+0.08)pcall(function()cm:InputHoldEnd()end)return true end local function ab(jP,pk)
local pl=q()while q()-pl<pk do if jP()then return true end al(0.05)end return jP()end local function dT(bF,pm,jQ,pn)
local po=a.zapFirst and{"zap","hold"}or{"hold","zap"}for pp,fX in ipairs(po)do if pp==2 and(pn or not(bF.Parent and bF.Enabled and(not jQ or jQ())))then break end
local fY if fX=="hold"then fY=pj(bF)else fY=type(fireproximityprompt)=="function"and bF.Parent~=nil and bF.Enabled and pcall(fireproximityprompt,bF)end
if fY and ab(pm,1.2)then a.zapFirst=(fX=="zap")return true,fX end end return false end local function jR(fZ)local aX=iz()
if not aX or not aX.Enabled then o("buy: nothing on the pad")return false end local jS=b5(aX)if not jS then o("buy: pad part missing")return false end
a.lastBuyAt=q()local pq,jT=E.seq,aC()cj(jS,aX)if not aX.Enabled then o("buy aborted: pad emptied")return false end
local bG=fQ()if not fZ and bG.state~="match"then o("buy aborted: "..(bG.text or"pad changed"))a.matchSince=nil
return false end local f0=bG.info and bG.info.name or(bG.state=="match"and E.name)or nil local function pr()return aX.Enabled and L()==nil and(fZ or fQ().state=="match")
end local ps,pt=dT(aX,function()return L()~=nil or((not aX.Enabled)and(fZ or E.seq==pq))end,pr,jy()~=nil)if ps then
ab(function()return L()~=nil end,0.8)local cn=L()local jU=aC()a.holding,a.bought,a.cashFails=true,a.bought+1,0
a.matchSince=nil E.name,E.rar,E.at=nil,nil,q()o(("BOUGHT %s%s via %s"):format(cn and Q(J(cn))or(bG.shown or"?"),(jT and jU)and(" for $"..am(jT-jU))or"",pt))
if cn and f0 and J(cn)~=J(f0)then o(("note: picked up %s, not %s"):format(cn,f0))end return true end a.cashFails=a.cashFails+1
a.noCashUntil=q()+math.min(8*2^(a.cashFails-1),60)local jV=cf()o(("BUY REFUSED: cash short? have $%s, price %s"):format(am(aC()),(jV and jV.price)or"?"))
return false end local function jW()local dU=L()if not dU then a.holding=false o("place: hands are empty")return false
end if not aS(dU)then o(("REFUSED TO WAX %s - it is not ticked"):format(Q(J(dU))))return false end for tA=1,f.PlaceTries do
local aY=nx()if not aY then o("place: no free station")break end local jX=b5(aY)if jX then cj(jX,aY)local jY=L()
if not jY then a.holding=false o("place: hands emptied on the way")return false end if not aS(jY)then o("place: what I carry changed, not waxing it")return false end
if aY.Enabled then local pu,pv=dT(aY,function()return not aY.Enabled end,function()return aY.Enabled end)if pu then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=q()+2.5,0 E.name,E.rar,E.at=nil,nil,q()
o(("WAXED %s #%d at %s via %s"):format(Q(J(dU)),a.placed,aY.Parent.Parent.Name,pv))return true end end end al(0.25)
end a.placeFails=a.placeFails+1 if L()==nil then a.holding=false end o("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then
a.capHit,a.running,a.capAt=true,false,q()a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(L()))o(a.capMsg)end return false end function l.place()if f.Teams and f.TeamWax~=""then l.placing=true
local pw=q()while a.alive and l.current()~=f.TeamWax and q()-pw<5 do al(0.1)end if l.current()==f.TeamWax then al(0.25)else o("wax team did not come on in time - placing anyway")end
end local px,jZ=pcall(jW)l.placing=false if not px then error(jZ,0)end return jZ end local function j0(j1)return type(j1)=="string"and j1:lower():find("crate",1,true)~=nil
end local py={SABFarmGui=1,SABToggle=1,SABError=1}local function f1(pz)local aZ=pz while aZ do if py[aZ.Name]then return false end
if aZ:IsA("ScreenGui")then local pA,pB=pcall(function()return aZ.Enabled end)return(not pA)or pB~=false end if aZ:IsA("GuiObject")and not aZ.Visible then return false end
aZ=aZ.Parent end return false end local function dV(dW)local bH=""pcall(function()if dW:IsA("TextButton")then bH=dW.Text end end)
if not bH:find("%a")then for tB,dX in ipairs(dW:GetDescendants())do if(dX:IsA("TextLabel")or dX:IsA("TextButton"))and dX.Text:find("%a")then bH=dX.Text break end
end end if not bH:find("%a")then bH=dW.Name end return(bH:lower():gsub("[^%a]",""))end local function pC()local co,cp
local j2=z:FindFirstChildOfClass("PlayerGui")if not j2 then return nil,nil end for tC,cq in ipairs(j2:GetDescendants())do
if cq:IsA("GuiButton")and f1(cq)then local f2=dV(cq)if f2:sub(1,4)=="open"and not f2:find("shop",1,true)then co=co or cq end
if f2:sub(1,7)=="discard"then cp=cp or cq end end end if co and cp then return co,cp end if d.on then return co,cp end
return nil,nil end local f3=(function()local pD,pE=pcall(function()return game:GetService("VirtualInputManager")end)return pD and pE or nil end)()
local function j3(aI,f4)local f5={}local function j4(pF)f5[#f5+1]=pF end if a.tapWay then j4(a.tapWay)end for tD,j5 in ipairs({"touch","conn","signal"})do
if j5~=a.tapWay then j4(j5)end end local function j6(pG,...)local pH,f6=pcall(getconnections,pG)if not(pH and type(f6)=="table"and#f6>0)then return false end
local j7,pI,pJ=false,{...},select("#",...)for tE,pK in ipairs(f6)do if pcall(function()pK:Fire(table.unpack(pI,1,pJ))end)then j7=true end
end return j7 end local function j8()local j9=Vector3 .new(0,0,0)pcall(function()local j_,ka=aI.AbsolutePosition,aI.AbsoluteSize
j9=Vector3 .new(j_.X+ka.X/2,j_.Y+ka.Y/2,0)end)local f7={Position=j9,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()f7 .UserInputType=Enum.UserInputType.Touch end)pcall(function()f7 .UserInputState=Enum.UserInputState.End end)
return f7 end for tF,aJ in ipairs(f5)do local cr=false if aJ=="conn"and type(getconnections)=="function"then if j6(aI.MouseButton1Click)then
cr=true if ab(f4,1.5)then a.tapWay=aJ return true,aJ end end cr=j6(aI.Activated,j8(),1)elseif aJ=="signal"and type(firesignal)=="function"then
if pcall(firesignal,aI.MouseButton1Click)then if ab(f4,1.5)then a.tapWay=aJ return true,aJ end end cr=pcall(firesignal,aI.Activated,j8(),1)
elseif aJ=="touch"and f3 then cr=pcall(function()local kb,kc=aI.AbsolutePosition,aI.AbsoluteSize local kd=0 local ke=aI:FindFirstAncestorWhichIsA("ScreenGui")
local pL,pM=pcall(function()return ke and ke.IgnoreGuiInset end)if not(pL and pM)then pcall(function()kd=game:GetService("GuiService"):GetGuiInset().Y end)
end local kf,kg=kb.X+kc.X/2,kb.Y+kc.Y/2+kd f3:SendMouseButtonEvent(kf,kg,0,true,game,1)task.wait(0.06)f3:SendMouseButtonEvent(kf,kg,0,false,game,1)
end)end if cr and ab(f4,1.5)then a.tapWay=aJ return true,aJ end end return false end d.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function f8(kh)local cs=kh.Parent while cs and cs~=a.plot do if d.NOT[cs.Name]then return false end cs=cs.Parent
end local f9=(kh.ActionText or""):lower()if f9:find("roll",1,true)or f9:find("place",1,true)or f9:find("sell",1,true)then return false end
return true end local function pN()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local ki=a.plot:FindFirstChild("CrateStand")local ct if ki then for tG,dY in ipairs(ki:GetDescendants())do
if dY:IsA("ProximityPrompt")and dY.Enabled and f8(dY)then ct=dY break end end end if not ct then for tH,a0 in ipairs(a.plot:GetDescendants())do
if a0:IsA("ProximityPrompt")and a0 .Enabled and f8(a0)then local kj=a0:FindFirstAncestorWhichIsA("Model")local pO=((a0 .ActionText or"").." "..(a0 .ObjectText or"").." "..a0 .Name.." "..(kj and kj.Name or"")):lower()
if pO:find("crate",1,true)then ct=a0 break end end end end d.prompt=ct return ct end local function f_()if d.on then return true end
local cu=pN()if not cu then d.summonFails=d.summonFails+1 d.lastFail=q()o("crate: cannot find where to open "..d.title.." - open it once by hand")
return false end local kk=b5(cu)if kk then cj(kk,cu)end d.ours=true dT(cu,function()return d.on end)if ab(function()return d.on end,3)then
d.summonFails=0 return true end d.ours=false d.summonFails=d.summonFails+1 d.lastFail=q()o("crate: pressed "..de(cu).." but no window came up")
return false end do local function pP(kl)local bI=kl.Parent while bI and bI:IsA("GuiObject")do local km,kn=false,false
for tI,cv in ipairs(bI:GetDescendants())do if cv~=kl and cv:IsA("GuiButton")and dV(cv):sub(1,7)=="discard"then km=true end
if cv:IsA("TextLabel")then local ga=cv.Text:lower()if ga:find("crate",1,true)or ga:find("can contain",1,true)or ga:find("cost",1,true)then kn=true end
end if km and kn then return bI end end bI=bI.Parent end end function d.findWin()if d.win and d.win.Parent then return d.win end
local ko=z:FindFirstChildOfClass("PlayerGui")if not ko then return nil end for tJ,dZ in ipairs(ko:GetDescendants())do
if dZ:IsA("GuiButton")and not dZ:FindFirstAncestor("SABFarmGui")and dV(dZ):sub(1,4)=="open"then local gb=pP(dZ)
if gb then d.win=gb return gb end end end end local function pQ(pR)for tK,d0 in ipairs(pR:GetDescendants())do
if d0:IsA("GuiButton")then local kp,gc=dV(d0),d0 .Name:lower()if kp=="x"or kp=="close"or gc=="x"or gc:find("close",1,true)or gc:find("exit",1,true)then return d0 end
end end end d.onShow=function()d.win=nil d.findWin()end d.onGone=function(pS)task.wait(pS and 4 or 1.2)if d.on or d.waiting then return end
local d1=d.findWin()if not d1 or not f1(d1)then return end local kq=pQ(d1)if kq and j3(kq,function()return not f1(d1)end)then return end
o("the crate window is still open - tap its X")end end local function d2(d3)if not f_()then return false end local kr=q()-(d.openedAt or 0)
if kr<0.6 then al(0.6-kr)end local gd=d.title local pT,pU=pC()local ks=d3 and pT or pU if not ks then d.lastFail=q()
a.crateFails=a.crateFails+1 o(("crate: no %s button found in %s"):format(d3 and"Open"or"Discard",gd))return false
end local pV=L()local pW,tL=j3(ks,function()return(not d.on)or(L()~=nil and L()~=pV)end)if not pW then d.lastFail=q()
a.crateFails=a.crateFails+1 o("crate: could not press "..(d3 and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if d3 then a.crates=a.crates+1 ab(function()return L()~=nil end,1.5)local kt=L()
o(("OPENED %s -> %s"):format(gd,kt and Q(J(kt))or"?"))else o("discarded "..gd.." (nothing ticked in it)")end return true
end d.calls={}function d.saw(pX,...)local pY=select("#",...)d.calls[#d.calls+1]={t=q(),m=pX,n=pY,args={...},data=d.data,
crate=d.data and d.data.name,title=d.title,rar=d.data and d.data.rarity}if#d.calls>12 then table.remove(d.calls,1)end
end function d.slot(ag,aK)local a1=type(ag)if(a1=="string"or a1=="number")and type(aK.data)=="table"then for ku,ge in pairs(aK.data)do
if ge==ag and type(ku)=="string"and(type(ge)=="string"or type(ge)=="number")then return{__slot="f:"..ku}end end
end if a1=="string"then if aK.crate and ag==aK.crate then return{__slot="crate"}end if aK.title and ag==aK.title then return{__slot="title"}end
if aK.rar and ag==aK.rar then return{__slot="rarity"}end return ag end if a1=="number"or a1=="boolean"or a1=="nil"then return ag end
if a1=="table"then local kv={}for pZ,kw in pairs(ag)do if type(kw)=="table"then return nil,"nested table"end local p0,kx=d.slot(kw,aK)
if kx then return nil,kx end kv[pZ]=p0 end return kv end local p1,p2=pcall(function()return ag:IsA("Instance")end)
if p1 and p2 then if ag==z then return{__slot="player"}end if a.plot and ag==a.plot then return{__slot="plot"}end
local d4=a.plot and a.plot:FindFirstChild("CrateStand")if d4 and ag==d4 then return{__slot="stand"}end if d4 and ag.Parent==d4 then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..a1 ..")"end function d.resolve(d5)if type(d5)~="table"then return d5 end
local au=d5 .__slot if au and au:sub(1,2)=="f:"then return d.data and d.data[au:sub(3)]end if au=="crate"then return d.data and d.data.name end
if au=="title"then return(d.data and d.data.title)or d.title end if au=="rarity"then return d.data and d.data.rarity end
if au=="player"then return z end if au=="plot"then return a.plot end if au=="stand"or au=="model"then local gf=a.plot and a.plot:FindFirstChild("CrateStand")
if au=="stand"or not gf then return gf end for tM,ky in ipairs(gf:GetChildren())do if j0(ky.Name)then return ky end end
return nil end local kz={}for p3,p4 in pairs(d5)do kz[p3]=d.resolve(p4)end return kz end function d.classify(gg)
if d.directOff then return end local d6={}for tN,gh in ipairs(d.calls)do if gh.t<=gg+0.05 and gg-gh.t<=6 then d6[#d6+1]=gh end
end if#d6==0 then return end if not ab(function()return(d.heldAt or 0)>=gg-1 end,2.5)then return end local cw={}
for tO,cx in ipairs(d6)do local kA={}for kB=1,cx.n do local p5,kC=d.slot(cx.args[kB],cx)if kC then o("crate call has "..kC.." - keeping the button method")
return end kA[kB]=p5 end cw[#cw+1]={m=cx.m,n=cx.n,args=kA}end local gi=d.learned d.learned={seq=cw,mode=gi and gi.mode or nil}
M.dirty=true if not gi then o(("learned how to open crates directly (%d call%s)"):format(#cw,#cw==1 and""or"s"))end
end function d.replay()local kD=d.learned local kE=ar:FindFirstChild("Remotes")local gj=kE and kE:FindFirstChild("CrateAction")
if not(kD and gj)then return false end local kF=table.unpack or unpack d.replaying=true for tP,cy in ipairs(kD.seq)do
local gk={}for kG=1,cy.n do gk[kG]=d.resolve(cy.args[kG])end task.spawn(function()pcall(function()if cy.m=="InvokeServer"then gj:InvokeServer(kF(gk,1,cy.n))
else gj:FireServer(kF(gk,1,cy.n))end end)end)task.wait(0.2)end d.replaying=false return true end function d.esc(p6)return(p6:gsub("[%%|;=,\n]",function(p7)return("%%%02X"):format(p7:byte())end))end
function d.enc(bk)local d7=type(bk)if d7=="string"then return"s"..d.esc(bk)end if d7=="number"then return"n"..tostring(bk)end
if d7=="boolean"then return bk and"b1"or"b0"end if d7=="nil"then return"z"end if bk.__slot then return"k"..bk.__slot end
local gl={}for p8,p9 in pairs(bk)do gl[#gl+1]=d.enc(p8).."="..d.enc(p9)end return"t"..table.concat(gl,",")end
function d.dec(kH)local cz,cA=kH:sub(1,1),kH:sub(2)local function p_(qa)return(qa:gsub("%%(%x%x)",function(qb)return string.char(tonumber(qb,16))end))end
if cz=="s"then return p_(cA)end if cz=="n"then return tonumber(cA)end if cz=="b"then return cA=="1"end if cz=="k"then return{__slot=cA}end
if cz=="t"then local kI={}for qc in cA:gmatch("[^,]+")do local kJ,qd=qc:match("^(.-)=(.*)$")if kJ then local kK=d.dec(kJ)
if kK~=nil then kI[kK]=d.dec(qd)end end end return kI end return nil end function d.goneOrNew(qe)return function()
if not d.waiting then return true end local kL=L()return kL~=nil and kL~=qe end end function d.near()local kM=ar:FindFirstChild("Remotes")
local kN=kM and kM:FindFirstChild("CrateAction")local gm=aD()local gn=a.plot and a.plot:FindFirstChild("CrateStand")
local go=gn and gn:FindFirstChild("Spot")if not(kN and gm and go)then return false,"no crate stand or remote"end
local gp=gm.HumanoidRootPart local d8=gp.CFrame local kO,gq=d.title,"no answer"local qf=L()local kP=gn:FindFirstChild("Holder")
local function kQ()if not kP then return d.waiting or d.on end for tQ,qg in ipairs(kP:GetChildren())do if qg:IsA("Model")then return true end end
return false end for qh=1,3 do if not(d.waiting or d.on)or not kQ()then d.waiting,d.on,d.quietUntil=false,false,q()+4
return true,"already gone"end if(gp.Position-go.Position).Magnitude>8 then cj(go,d.prompt)end al(0.12+0.15*qh)
local aA={}d.replaying=true task.spawn(function()aA.ok,aA.v=pcall(function()return kN:InvokeServer("open")end)
aA.done=true end)ab(function()return aA.done end,6)d.replaying=false local bl=aA.v if aA.done and aA.ok and type(bl)=="table"and bl.ok then
a.crates,d.fails,d.nearFails=a.crates+1,0,0 d.waiting,d.on,d.quietUntil=false,false,q()+4 o(("OPENED %s -> %s (no window)"):format(kO,bl.prize and Q(J(tostring(bl.prize)))or"?"))
ab(function()local kR=L()return kR~=nil and kR~=qf end,1.5)if(gp.Position-d8 .Position).Magnitude>8 then pcall(function()ci(gm,d8 .Position,d8 .Position+d8 .LookVector)end)end
return true,"opened"end gq=(aA.done and aA.ok and type(bl)=="table")and tostring(bl.reason or"refused, no reason given")
or(aA.done and("error: "..tostring(bl))or"no answer in 6s")al(0.3)if not kQ()then d.waiting,d.on,d.quietUntil=false,false,q()+4
return true,"already gone"end end d.nearFails=(d.nearFails or 0)+1 o(("crate: the server would not open %s next to the stand (%s)"):format(kO,gq))
return false,gq end function d.smart()local gr=d.title if(d.nearFails or 0)<3 then local qi=d.near()if qi then return true end
if d.nearFails>=3 then o("opening next to the stand failed 3 times - trying the older ways")end end local bm=d.learned
if bm then local gs=L()if d.on then d.replay()if ab(d.goneOrNew(gs),3.5)then a.crates=a.crates+1 o("OPENED "..gr.." (direct)")
return true end else if bm.mode~="window"then d.replay()if ab(d.goneOrNew(gs),3.5)then a.crates,d.fails=a.crates+1,0
if bm.mode~="direct"then bm.mode,M.dirty="direct",true o("crates now open directly - the window never comes up")
end o("OPENED "..gr.." (direct, no window)")return true end end if f_()then d.replay()if ab(d.goneOrNew(gs),3.5)then
a.crates,d.fails=a.crates+1,0 if bm.mode~="window"then bm.mode,M.dirty="window",true o("crates need their window up first - it shows briefly")
end o("OPENED "..gr.." (direct, window up)")return true end end end d.fails=(d.fails or 0)+1 d.lastBad,d.learned,M.dirty=bm,nil,true
if d.fails>=3 then d.directOff=true o("direct crate opening failed 3 times - using the button for now")else o("the learned crate call did not work - back to pressing Open")
end end return d2(true)end function r.snap()return{rules=z:GetAttribute("AutoRollRules"),stop=z:GetAttribute("AutoRollStop"),
on=z:GetAttribute("AutoRollOn"),main=z:GetAttribute("AutoRoll")}end r.cache={}function r.watchCache()r.cache=r.snap()
for qj,kS in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do P(z:GetAttributeChangedSignal(kS):Connect(function()r.cache[qj]=z:GetAttribute(kS)end))
end end function r.isOn()return z:GetAttribute("AutoRollOn")==true end function r.saw(qk,...)local d9=r.cache
local ql={m=qk,n=select("#",...),args={...},before={rules=d9 .rules,stop=d9 .stop,on=d9 .on,main=d9 .main}}task.delay(1.5,function()
if a.alive then pcall(r.learnOne,ql)end end)end function r.learnOne(cB)local ae,cC=r.snap(),cB.before local d_=(ae.rules~=cC.rules)or(ae.stop~=cC.stop)
local kT=(ae.on~=cC.on)or(ae.main~=cC.main)if not d_ and not kT then return end local kU={}for kV=1,cB.n do local ao=cB.args[kV]
local bn=type(ao)if bn=="string"and ao~=""and ao==ae.rules then ao={__slot="rules"}elseif bn=="string"and ao~=""and d_ and ao==ae.stop and ae.stop~=cC.stop then ao={__slot="stop"}
elseif bn=="table"then local kW={}for qm,bJ in pairs(ao)do if type(bJ)=="table"or(type(bJ)=="userdata")then r.msg="Auto Roll sends something I cannot repeat"return
end kW[qm]=(type(bJ)=="string"and bJ~=""and bJ==ae.rules)and{__slot="rules"}or bJ end ao=kW elseif bn~="string"and bn~="number"and bn~="boolean"and bn~="nil"then
if ao==z then ao={__slot="player"}else r.msg="Auto Roll sends something I cannot repeat"return end end kU[kV]=ao
end local bK={m=cB.m,n=cB.n,args=kU}if d_ then local gt=false for qn=1,bK.n do local cD=bK.args[qn]if type(cD)=="table"and cD.__slot=="rules"then gt=true end
if type(cD)=="table"and not cD.__slot then for tR,kX in pairs(cD)do if type(kX)=="table"and kX.__slot=="rules"then gt=true end end
end end if gt then r.rec.rules={bK}else table.insert(r.rec.rules,bK)if#r.rec.rules>60 then table.remove(r.rec.rules,1)end
end end if kT then if ae.on==true then r.rec.on=bK else r.rec.off=bK end f.AutoRoll=(ae.on==true)end if ae.rules and ae.rules~=""then f.ARrules,f.ARstop=ae.rules,ae.stop or""end
M.dirty=true r.msg=""o(("learned an Auto Roll %s message"):format(d_ and"choices"or(ae.on and"on"or"off")))end
function r.resolve(bL)if type(bL)~="table"then return bL end if bL.__slot=="rules"then return f.ARrules~=""and f.ARrules or z:GetAttribute("AutoRollRules")end
if bL.__slot=="stop"then return f.ARstop~=""and f.ARstop or z:GetAttribute("AutoRollStop")end if bL.__slot=="player"then return z end
local kY={}for qo,qp in pairs(bL)do kY[qo]=r.resolve(qp)end return kY end function r.replay(kZ,qq)local k0=table.unpack or unpack
for tS,cE in ipairs(qq)do local gu={}for k1=1,cE.n do gu[k1]=r.resolve(cE.args[k1])end r.replaying=true pcall(function()
if cE.m=="InvokeServer"then task.spawn(function()pcall(function()kZ:InvokeServer(k0(gu,1,cE.n))end)end)else kZ:FireServer(k0(gu,1,cE.n))end
end)r.replaying=false task.wait(0.25)end end function r.apply(k2,qr)if r.busy or not a.alive then return end r.busy=true
pcall(function()local k3=ar:FindFirstChild("Remotes")local gv=k3 and k3:FindFirstChild("AutoRollAction")if not gv then r.msg="this game has no AutoRollAction"return end
local a2=f.AutoRoll if a2 and f.ARrules~=""and z:GetAttribute("AutoRollRules")~=f.ARrules then if#r.rec.rules==0 then
r.msg="pick your Auto Roll choices once in the game's menu so I can learn them"o(r.msg)else r.replay(gv,r.rec.rules)
if ab(function()return z:GetAttribute("AutoRollRules")==f.ARrules end,4)then o("Auto Roll choices put back")else
r.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"o(r.msg)end end end if a2==r.isOn()or(not a2 and not qr)then return end
local ea=a2 and r.rec.on or r.rec.off if not ea then local cF=a2 and r.rec.off or r.rec.on local k4=cF~=nil for qs=1,cF and cF.n or 0 do
if type(cF.args[qs])=="boolean"then k4=false end end if k4 then ea=cF end end if not ea then r.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(a2 and"on"or"off")
o(r.msg)return end r.replay(gv,{ea})if ab(function()return r.isOn()==a2 end,4)then r.msg=""o(("Auto Roll switched %s%s"):format(a2 and"ON"or"OFF",k2 and(" ("..k2 ..")")or""))
else r.msg="Auto Roll did not switch - do it once in the game so I can relearn it"o(r.msg)end end)r.busy=false
end j.HS=game:GetService("HttpService")j.uid=(function()local qt,qu=pcall(function()return z.UserId end)return qt and qu or 0 end)()
j.buyMsg,j.wishMsg,j.wishN="","",0 function j.info()if j.I then return j.I end local qv,gw=pcall(function()return require(ar:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if qv and type(gw)=="table"and type(gw.Pets)=="table"then j.I=gw end return j.I end function j.order()if j.list then return j.list end
local a3=j.info()if not a3 then return{}end local bo={}if type(a3 .Order)=="table"and#a3 .Order>0 then for tT,k5 in ipairs(a3 .Order)do if a3 .Pets[k5]then bo[#bo+1]=k5 end end
else for qw in pairs(a3 .Pets)do bo[#bo+1]=qw end table.sort(bo,function(qx,qy)return(a3 .Pets[qx].price or 0)<(a3 .Pets[qy].price or 0)end)
end j.list=bo return bo end function j.nice(k6,gx)local k7=j.info()local k8=k7 and k7 .Pets[k6]return((gx and gx~="")and(gx.." ")or"")..(k8 and k8 .displayName or tostring(k6))
end function j.data()local k9=z:GetAttribute("PetsData")if type(k9)~="string"then return nil end local qz,k_=pcall(function()return j.HS:JSONDecode(k9)end)
return(qz and type(k_)=="table")and k_ or nil end function j.pen()return ar:FindFirstChild("PetMeadowSpawns")end
function j.srv()return b0:GetServerTimeNow()end function j.money()local gy=z:FindFirstChild("MoneyValue")if gy and type(gy.Value)=="number"then return gy.Value end
return aC()or 0 end function j.wishes()local la=j.pen()local lb=la and la:GetAttribute("Wishes")local gz,lc={},j.srv()
if type(lb)~="string"then return gz end local qA,ld=pcall(function()return j.HS:JSONDecode(lb)end)if qA and type(ld)=="table"then
for qB,gA in pairs(ld)do if type(gA)=="number"and gA>lc then gz[qB]=gA-lc end end end return gz end function j.call(...)
local le=ar:FindFirstChild("Remotes")local lf=le and le:FindFirstChild("PetRequest")if not lf then return nil end
local lg=table.pack(...)local bp={}task.spawn(function()bp.ok,bp.v=pcall(function()return lf:InvokeServer(table.unpack(lg,1,lg.n))end)
bp.done=true end)local qC=q()while not bp.done and q()-qC<6 do task.wait(0.05)end if bp.done and bp.ok then return bp.v end
return nil end function j.want(qD)return f.Pets[qD]end function j.buyTick()if not f.PetBuy then j.buyMsg="auto adopt is off"return end
local gB,lh,gC=j.info(),j.pen(),j.data()if not(gB and lh and gC)then j.buyMsg="pet data not loaded yet"return end
j.tryAt=j.tryAt or{}local cG,gD=#(gC.pets or{}),tonumber(gC.maxOwned)or 60 local qE,li,cH=j.srv(),{},nil for tU,av in ipairs(lh:GetChildren())do
li[av.Name]=true local cI,lj=av:GetAttribute("Pet"),av:GetAttribute("Variant")or""local gE=cI and j.want(cI)if gE and gE.b and gB.Pets[cI]and(not gE.g or lj=="Big")and not av:GetAttribute("A_"..j.uid)
and(tonumber(av:GetAttribute("ExpiresAt"))or 0)>qE+1 and q()>=(j.tryAt[av.Name]or 0)then local cJ,lk=j.nice(cI,lj),gB.Pets[cI].price or 0
if cG>=gD then cH=("%s is in the pen, but you have %d/%d pets"):format(cJ,cG,gD)j.tryAt[av.Name]=q()+15 elseif j.money()<lk then
cH=("%s is in the pen - need $%s"):format(cJ,am(lk))j.tryAt[av.Name]=q()+5 else j.tryAt[av.Name]=q()+8 local bM=j.call("adopt",av.Name)
if type(bM)=="table"and bM.ok then cG=cG+1 j.buys=(j.buys or 0)+1 o("ADOPTED "..cJ)cH="adopted "..cJ else local ll=type(bM)=="table"and tostring(bM.reason or"no reason given")or"no answer"
o(("adopt %s failed: %s"):format(cJ,ll))cH="adopt failed: "..ll if type(bM)=="table"and bM.bagFull then j.tryAt[av.Name]=q()+60 end
end end end end for lm in pairs(j.tryAt)do if not li[lm]then j.tryAt[lm]=nil end end j.buyMsg=cH or("watching the pen (%d/%d pets)"):format(cG,gD)
end function j.wishTick()if not f.PetWish then j.wishMsg="auto wish is off"return end local eb=j.info()if not(eb and j.pen())then j.wishMsg="pet data not loaded yet"return end
j.wishTry,j.wishWhy=j.wishTry or{},j.wishWhy or{}local ec,gF,a4=j.wishes(),0,nil local qF=(type(eb.Wish)=="table"and eb.Wish.cashShare)or 2
for tV,ah in ipairs(j.order())do local ln=j.want(ah)if ln and ln.w then gF=gF+1 if not ec[ah]and q()>=(j.wishTry[ah]or 0)then
local gG=tonumber(z:GetAttribute("PetWishCredits"))or 0 local gH=math.floor((eb.Pets[ah].price or 0)*qF)if gG<=0 and j.money()<gH then
j.wishTry[ah]=q()+10 a4=("need $%s to wish for %s"):format(am(gH),j.nice(ah))j.wishWhy[ah]=a4 else j.wishTry[ah]=q()+3
local qG=gG>0 and"wishCredit"or"wish"local ed=j.call(qG,ah)if type(ed)=="table"and ed.ok then j.wishN,j.wishWhy[ah]=j.wishN+1,nil
o(("WISHED for %s (%s)"):format(j.nice(ah),gG>0 and"free wish"or("$"..am(gH))))else local gI=type(ed)=="table"and tostring(ed.reason or"no reason given")or"no answer"
if gI:lower():find("already",1,true)then j.wishTry[ah]=q()+2 else o(("wish %s failed: %s"):format(j.nice(ah),gI))a4="wish failed: "..gI end
end end end end end if not a4 then for tW,ee in ipairs(j.order())do local lo=j.want(ee)if lo and lo.w and not ec[ee]and j.wishWhy[ee]then a4=j.wishWhy[ee]break end
end end if not a4 then local ef={}for tX,eg in ipairs(j.order())do local lp=j.want(eg)if lp and lp.w and ec[eg]then ef[#ef+1]=("%s %dm"):format(j.nice(eg),math.ceil(ec[eg]/60))end
end a4=gF==0 and"no pet has WISH ticked"or("running: "..(#ef>0 and table.concat(ef,", ")or"none yet"))end j.wishMsg=a4
end l.switches,l.glazed,l.finished=0,0,0 function l.teams()local gJ=j.data()return(gJ and gJ.teams)or{},gJ end
function l.current(bN)bN=bN or j.data()if not bN then return""end local lq={}for tY,qH in ipairs(bN.equipped or{})do lq[tostring(qH)]=true end
for tZ,lr in ipairs(bN.teams or{})do local ls=lr.pets or{}local gK=#ls==#(bN.equipped or{})if gK then for t0,qI in ipairs(ls)do if not lq[tostring(qI)]then gK=false break end end end
if gK then return lr.name end end return""end function l.equip(gL)local qJ,qK=l.teams()local gM for qL,qM in ipairs(qJ)do if qM.name==gL then gM=qL break end end
if not gM then l.msg="no saved team called "..tostring(gL)return false end if l.current(qK)==gL then return true end
for t1=1,4 do local lt=j.call("teamEquip",gM)if type(lt)=="table"and lt.ok then l.switches=l.switches+1 return true
end task.wait(0.4)end return false end function l.waxes()local cK={}local lu=a.plot and a.plot:FindFirstChild("WaxStations")
if not lu then return cK end for t2,bq in ipairs(lu:GetChildren())do local lv=tonumber(bq:GetAttribute("PourEnd"))
local lw=bq:GetAttribute("PourOwner")if bq:GetAttribute("HasSquishy")and lv and(lw==nil or lw==j.uid)then local lx,ly=bq:FindFirstChild("SquishyPlaceHolder"),"?"
if lx then for t3,lz in ipairs(lx:GetChildren())do if lz:IsA("Model")then ly=lz.Name break end end end local qN=tostring(bq:GetAttribute("Helpers")or"")
local gN=0 for t4 in qN:gmatch("%d+")do gN=gN+1 end cK[#cK+1]={st=bq,ends=lv,id=bq:GetAttribute("PourId"),name=ly,helps=gN}
end end table.sort(cK,function(qO,qP)return qO.ends<qP.ends end)return cK end function l.glazeCount()local lA=ar:FindFirstChild("Remotes")
local lB=lA and lA:FindFirstChild("EditStack")if not lB then return nil end local qQ,cL=pcall(function()return lB:InvokeServer("State",nil)end)
if not(qQ and type(cL)=="table"and type(cL.state)=="table")then return nil end local gO,gP=0,{}for t5,eh in ipairs(cL.state.entries or{})do
if eh.glaze and eh.glaze~=""then gO=gO+1 gP[eh.glaze]=(gP[eh.glaze]or 0)+1 end end return gO,gP,#(cL.state.entries or{}),cL.state.capacity
end function l.finishedOne(ei,lC)l.finished=l.finished+1 task.wait(2)local gQ,qR,lD,qS=l.glazeCount()if gQ and lC and gQ>lC then
l.glazed=l.glazed+1 local gR={}for qT,qU in pairs(qR)do gR[#gR+1]=qT.." "..qU end o(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(Q(J(ei.name)),ei.st.Name,gQ,table.concat(gR,", ")))
else o(("wax done on station %s: %s, no glaze%s"):format(ei.st.Name,Q(J(ei.name)),lD and(" (stack "..lD.."/"..tostring(qS)..")")or""))
end end function l.tick()l.list=l.waxes()if not f.Teams then l.want,l.msg="","auto teams is off"return end local gS=j.srv()
local a5=l.glazeFor if a5 then local ej=a5 .st local qV=ej.Parent and ej:GetAttribute("HasSquishy")and ej:GetAttribute("PourId")==a5 .id
if not qV or gS>a5 .ends+40 then l.glazeFor,l.afterUntil=nil,q()+1.5 local qW=a5 .before task.spawn(function()pcall(l.finishedOne,a5,qW)end)
else a5 .ends=tonumber(ej:GetAttribute("PourEnd"))or a5 .ends end end if f.TeamGlaze~=""and not l.glazeFor then
for t6,gT in ipairs(l.list)do if gT.ends-gS<=f.GlazeLead then l.glazeFor=gT task.spawn(function()gT.before=l.glazeCount()end)
break end end end local ai=""if f.TeamGlaze~=""and(l.glazeFor or q()<(l.afterUntil or 0))then ai=f.TeamGlaze elseif l.placing and f.TeamWax~=""then ai=f.TeamWax
else ai=f.TeamNormal end l.want=ai local cM=l.current()l.cur=cM if ai~=""and cM~=ai and q()>=(l.nextTry or 0)then
l.nextTry=q()+1.1 if l.equip(ai)then local qX=(ai==f.TeamGlaze and l.glazeFor)and(" - station "..l.glazeFor.st.Name.." finishes soon")
or((ai==f.TeamWax and l.placing)and" - placing a butter"or"")o("team: "..ai..qX)else l.nextTry=q()+3 end end local gU=l.list[1]
l.msg=("on: %s%s | next wax done %s"):format(cM~=""and cM or"(not a saved team)",(ai~=""and ai~=cM)and(" -> "..ai)or"",
gU and("in "..l.clock(gU.ends-gS).." (st "..gU.st.Name..")")or"- none running")end function l.clock(a6)a6=math.max(0,math.floor(a6))
if a6>=3600 then return("%d:%02d:%02d"):format(math.floor(a6/3600),math.floor((a6%3600)/60),a6%60)end return("%d:%02d"):format(math.floor(a6/60),a6%60)
end function l.glazeSoon()return f.Teams and f.TeamGlaze~=""and(l.glazeFor~=nil or q()<(l.afterUntil or 0))end
a.sellWords={"sell","trash","discard","dispose","bin"}local function gV(ek)if type(ek)~="string"then return false end
ek=ek:lower()for t7,qY in ipairs(a.sellWords)do if ek:find(qY,1,true)then return true end end return false end
local function qZ()local lE=ar:FindFirstChild("Remotes")local gW=lE and lE:FindFirstChild("SellSquishy")if not(gW and gW:IsA("RemoteEvent"))then return false end
if not pcall(function()gW:FireServer()end)then return false end return ab(function()return L()==nil end,1.5)end
local function q0()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end if q()-a.sellSearchAt<20 then return nil end
a.sellSearchAt=q()local lF=aD()local lG=lF and lF.HumanoidRootPart.Position local cN,lH for t8,bO in ipairs((a.plot or b0):GetDescendants())do
if bO:IsA("ProximityPrompt")and(gV(bO.ActionText)or gV(bO.ObjectText)or gV(bO.Name))then local lI=ik(bO)local gX=(lI and lG)and(lI-lG).Magnitude or 1e9
if gX<=400 and(not cN or gX<lH)then cN,lH=bO,gX end end end a.sellSpot=cN a.noSellSpot=(cN==nil)return cN end
local function lJ()local gY=L()if not gY then a.holding=false return false end if aS(gY)then return false end
local gZ=Q(J(gY))if qZ()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=q()+2.5,0
o("SOLD "..gZ)return true end local bP=q0()if bP then local lK=b5(bP)if lK then cj(lK,bP)local lL=L()if lL and not aS(lL)then
local q1,q2=dT(bP,function()return L()==nil end,function()return bP.Enabled end)if q1 then a.sold,a.holding,a.sellFails=a.sold+1,false,0
o(("SOLD %s at %s via %s"):format(gZ,de(bP),q2))return true end end end end a.sellFails=a.sellFails+1 o("could not sell "..gZ.." ("..a.sellFails..")")
return false end local q3={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function q4(bQ)local el=de(bQ):lower()for t9,q5 in ipairs(q3)do if el:find(q5,1,true)then return 0 end end
local aB,T=bQ.Name:lower(),0 local function aw(q6,q7)return q6:find(q7,1,true)~=nil end if aw(aB,"collect")then T=T+60 end
if aw(aB,"cash")or aw(aB,"money")then T=T+45 end if aw(aB,"income")or aw(aB,"claim")then T=T+35 end if aw(aB,"coin")or aw(aB,"earn")or aw(aB,"green")then T=T+20 end
if aB=="pad"or aB=="touch"then T=T+25 end if T==0 and(aw(el,"collect")or aw(el,"cash")or aw(el,"money"))then T=25 end
if T==0 then return 0 end local cO=bQ.Color if cO.G>0.5 and cO.G>cO.R*1.4 and cO.G>cO.B*1.4 then T=T+15 end if math.min(bQ.Size.X,bQ.Size.Y,bQ.Size.Z)<2 then T=T+5 end
return T end local function q8()if a.padPart and a.padPart.Parent then return a.padPart end if not a.plot or q()-a.padSearchAt<20 then return nil end
a.padSearchAt=q()local em,cP,g0={},nil,29 for t_,en in ipairs(a.plot:GetDescendants())do if en:IsA("BasePart")then
local eo=q4(en)if eo>0 then em[#em+1]={s=eo,p=en}if eo>g0 then cP,g0=en,eo end end end end table.sort(em,function(q9,q_)return q9 .s>q_.s end)
a.padCands,a.padPart=em,cP if cP then o("collect pad: "..de(cP).." (score "..g0 ..")")end return cP end local g1="SAB_pad_v1.txt"
local function ra(rb)if type(writefile)=="function"then pcall(writefile,g1,table.concat({rb:GetComponents()},","))end
end local function rc()if type(isfile)~="function"or type(readfile)~="function"then return nil end local rd,lM=pcall(function()if isfile(g1)then return readfile(g1)end end)
if not rd or type(lM)~="string"then return nil end local ep={}for re in lM:gmatch("[^,]+")do ep[#ep+1]=tonumber(re)end
if#ep==12 then return CFrame.new(unpack(ep))end end local function rf(g2,eq,rg)local rh=fS(g2)local g3=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local ax=(g3 and g3:IsA("BasePart"))and(g3 .Position-eq)or Vector3 .new(1,0,0)ax=Vector3 .new(ax.X,0,ax.Z)if ax.Magnitude<0.05 then ax=Vector3 .new(1,0,0)end
ax=ax.Unit for ri=0,7 do local er=ri*math.pi/4 local rj=Vector3 .new(ax.X*math.cos(er)-ax.Z*math.sin(er),0,ax.X*math.sin(er)+ax.Z*math.cos(er))
local es=eq+rj*(rg+5)local g4=jG(es.X,eq.Y,es.Z)if g4 and math.abs(g4 .Y-eq.Y)<8 then ci(g2,Vector3 .new(es.X,g4 .Y+rh,es.Z))
if fT(g2,0.7)then return true end end end return false end local function rk()a.lastCollect=q()local cQ=aD()if not cQ then return end
local lN,rl=cQ.HumanoidRootPart,fS(cQ)local cR,lO,cS,g5=nil,4,nil,"?"local g6=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if a.manualPad and g6 and g6:IsA("BasePart")then cR,g5=(g6 .CFrame*a.manualPad).Position,"manual pad"else local aL=q8()
if aL then cR=Vector3 .new(aL.Position.X,aL.Position.Y+aL.Size.Y/2+rl,aL.Position.Z)lO,cS,g5=math.max(aL.Size.X,aL.Size.Z)/2,aL,aL.Name
end end if not cR then o("COLLECT: pad not found - stand on it and tap SET PAD")return end local g7=aC()ci(cQ,cR)
if cS and type(firetouchinterest)=="function"then pcall(firetouchinterest,lN,cS,0)end al(f.PadDwell)if cS and type(firetouchinterest)=="function"then pcall(firetouchinterest,lN,cS,1)end
al(0.5)a.collected=a.collected+1 local g8=aC()o(("COLLECTED (%s) %s"):format(g5,(g7 and g8 and g8>g7)and("+$"..am(g8-g7))or"no cash change seen"))
rf(cQ,cR,lO)end local cT local function lP()if a.capHit then if f.AutoStart and q()-(a.capAt or 0)>300 then a.capHit,a.placeFails=false,0
o("trying again after being stopped for 5 minutes")cT(true,true)else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end
if not aD()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aT(),nil,nil
if not a.plot then return nil,"own plot not found yet","wait"end end if not next(f.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local g9,lQ=is()local et=L()if et then local bR=Q(J(et))if not aS(et)then local g_=(E.gift and J(E.gift)==J(et)and q()-E.giftAt<600)and"gift"or"not ticked"
if not f.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bR,g_),"bad"end if a.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bR,g_),"bad"end return"sell",("selling %s (%s)"):format(bR,g_),"warn"
end if g9<1 then return nil,("holding %s - 0 free stations"):format(bR),"wait"end if l.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(bR),"wait"end
return"place",("waxing %s (%d free)"):format(bR,g9),"ok"end a.holding=false if f.Crates and not d.waiting and q()-(d.scanAt or 0)>1 and q()>(d.quietUntil or 0)then
d.scanAt=q()local ha=a.plot:FindFirstChild("CrateStand")if ha then for ua,cU in ipairs(ha:GetDescendants())do
if cU:IsA("ProximityPrompt")and cU.Enabled and f8(cU)then local aM=cU.ObjectText if aM==""then aM=bz(ha,"TitleLabel")or""end
if aM~=""and u.wanted(aM)then local rm=dc(aM):gsub("crate$","")local lR for lS in pairs(H.members)do if dc(lS)==rm then lR=lS end end
d.waiting,d.at,d.title,d.prompt=true,q(),aM,cU d.data={name=(aM:gsub("%s","")),rarity=lR,title=aM}o(aM.." found waiting on your stand")
end break end end end end local lT=u.wanted(d.data and d.data.name)or u.wanted(d.title)if f.Crates and(d.on or d.waiting)and lT then
local aN=d.title if q()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aN),"bad"
end if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=q()+120,0 o("could not press the "..aN.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aN),"bad"end if q()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aN),"bad"
end if d.byYou and q()-d.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aN,math.ceil(60-(q()-d.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aN),"ok"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(aN),"bad"end if q()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aN),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(aN,(d.learned and d.learned.mode~="window")and" directly"or""),"ok"
end if(d.on or d.waiting)and not lT then local lU=d.title..tostring(d.rolledAt)if d.told~=lU then d.told=lU o(d.title.." is not ticked - leaving it to the game")
end end if d.rolled and not d.waiting and q()-d.rolledAt<6 and u.wanted(d.rolled)then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if g9<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(lQ,lQ),"wait"
end local hb=iz()if not hb then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local cV=cf()
if cV and j0(cV.name)then a.matchSince=nil if not f.Crates then return nil,("%s on the pad - crate opening is off"):format(cV.name),"idle"end
if q()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(cV.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(cV.name),"ok"
end local a7=fQ()if a7 .state~="match"then a.matchSince=nil if a7 .state=="skip"and not hb.Enabled then return nil,a7 .text.." (sold out)","idle"end
return nil,a7 .text,a7 .level end if not hb.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local cW=q()if cW<a.noCashUntil then local lV,rn=jy()if lV then return nil,("cash short: have $%s, price ~$%s"):format(am(lV),am(rn)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(am(aC()),math.ceil(a.noCashUntil-cW)),"bad"end if cW-a.lastBuyAt<f.BuyGap then return nil,"cooldown after last buy","wait"end
a.matchSince=a.matchSince or cW local lW=cW-a.matchSince if lW<f.Confirm then return nil,("confirming %s (%.2fs)"):format(a7 .shown,lW),"ok"end
return"buy",("buying %s via %s"):format(a7 .shown,a7 .src),"ok"end local function ap(ro,rp,...)if a.busy then return end
a.busy,a.busyText=true,ro local rq,lX=pcall(rp,...)a.busy,a.busyText=false,""if not rq and lX~=eY then o("ERR "..tostring(lX))end
end local function rr()local br,rs,rt=lP()a.reason,a.level=rs,rt if br=="place"then ap("waxing...",l.place)elseif br=="crate"then ap("opening crate...",d2,true)
elseif br=="cratesmart"then ap("opening crate...",d.smart)elseif br=="cratewin"then ap("opening the crate window...",f_)
elseif br=="nocrate"then ap("discarding crate...",d2,false)elseif br=="sell"then ap("selling...",lJ)elseif br=="buy"then ap("buying...",jR,false)
elseif f.Collect and not a.matchSince and q()-a.lastCollect>=f.Every then ap("collecting money...",rk)end end
function cT(eu,ru)if eu==a.running then return end a.running=eu if not ru then f.AutoStart=eu end if eu then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=q()a.plot=aT()or a.plot
o("START")else a.reason="stopped"o("STOP")end end do local a8=fA(ad.auto)if type(a8)=="string"then a8=a8:gsub("%s+$","")
if a8~=""then a.autoload=a8 local rv=jj(a8)o(rv and("loaded config "..a8)or("config "..a8 .." could not be loaded"))
end end end local e={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local rw={ok=e.good,wait=e.warn,warn=e.warn,bad=e.bad,idle=e.dim}local lY={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function A(rx,ry,rz)local rA,hc=pcall(Instance.new,rx)
if not rA then a.uiErrs=a.uiErrs+1 return nil end for rB,rC in pairs(ry)do if not pcall(function()hc[rB]=rC end)then a.uiErrs=a.uiErrs+1 end
end hc.Parent=rz return hc end local function W(rD,rE)A("UICorner",{CornerRadius=UDim.new(0,rE or 6)},rD)end local c={}
local hd=z:FindFirstChildOfClass("PlayerGui")or z:WaitForChild("PlayerGui")local lZ=hd:FindFirstChild("SABFarmGui")
if lZ then lZ:Destroy()end local he=A("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},hd)
local V={w=320,h=330,head=30,strip=38,tabs=26}c.root=A("Frame",{Name="Root",Size=UDim2 .new(0,V.w,0,V.h),Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),
BackgroundColor3=e.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},he)W(c.root,10)A("UIStroke",{Color=e.line,Thickness=1},c.root)
local aO=UDim2 .new(1,0,1,0)local function y(l0,l1)return UDim2 .new(l0,0,0,0),UDim2 .new(l1,(l0+l1>0.99)and 0 or-4,1,0)end
local function x(rF,rG,rH,rI,rJ,rK)local l2=A("TextButton",{Text=rG,Position=rJ,Size=rK,BackgroundColor3=rH,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=rI,TextColor3=e.text,AutoButtonColor=true},rF)W(l2,6)return l2 end local function hf(rL,rM,rN,rO,rP)
local hg=A("TextBox",{Text=rM,PlaceholderText=rN,Position=rO,Size=rP,BackgroundColor3=e.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=e.text,PlaceholderColor3=e.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},rL)W(hg,6)A("UIPadding",{PaddingLeft=UDim.new(0,8)},hg)
return hg end local ev=b0 .CurrentCamera local function rQ()local rR,ew=pcall(function()return ev and ev.ViewportSize end)
if rR and ew and ew.X>50 and ew.Y>50 then return ew end end local function a9(cX)local hh=rQ()if not(hh and cX and cX.Parent)then return end
local rS=pcall(function()local ex,l3=cX.AbsolutePosition,cX.AbsoluteSize local hi=70 local l4=math.clamp(ex.X,hi-l3 .X,hh.X-hi)
local l5=math.clamp(ex.Y,0,hh.Y-math.min(l3 .Y,hi))if math.abs(l4-ex.X)>0.5 or math.abs(l5-ex.Y)>0.5 then cX.Position=UDim2 .new(0,math.floor(l4),0,math.floor(l5))
end end)return rS end local function ey(rT)local rU,hj=pcall(function()return rT.AbsolutePosition end)if rU and hj then return{math.floor(hj.X),math.floor(hj.Y)}end
end local ez={}local function l6(eA,l7,l8)P(eA.InputBegan:Connect(function(cY)if cY.UserInputType~=Enum.UserInputType.MouseButton1 and cY.UserInputType~=Enum.UserInputType.Touch then return end
ez[eA]={start=cY.Position,from=l7 .Position,moved=0,target=l7}local hk hk=cY.Changed:Connect(function()if cY.UserInputState==Enum.UserInputState.End then
local l9=ez[eA]ez[eA]=nil if hk then hk:Disconnect()end if l9 and l8 then l8(l9 .moved)end end end)end))end P(ng.InputChanged:Connect(function(eB)
if eB.UserInputType~=Enum.UserInputType.MouseMovement and eB.UserInputType~=Enum.UserInputType.Touch then return end
for ub,aP in pairs(ez)do local hl=aP.target if hl and hl.Parent then local l_,ma=eB.Position.X-aP.start.X,eB.Position.Y-aP.start.Y
aP.moved=math.max(aP.moved,math.abs(l_)+math.abs(ma))hl.Position=UDim2 .new(aP.from.X.Scale,aP.from.X.Offset+l_,aP.from.Y.Scale,aP.from.Y.Offset+ma)
end end end))local function D(rV,rW,rX,rY,rZ,r0,r1)return A("TextLabel",{Text=rW,Position=r0 or UDim2 .new(0,0,0,0),Size=r1 or aO,BackgroundTransparency=1,
Font=rZ and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=rX,TextColor3=rY,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},rV)
end c.title=A("Frame",{Size=UDim2 .new(1,0,0,V.head),BackgroundColor3=e.panel,BorderSizePixel=0,Active=true},c.root)
c.dot=A("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=e.dim,BorderSizePixel=0},c.title)
W(c.dot,5)D(c.title,"SAB  BUTTER FARM  "..bu,12,e.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))c.minB=x(c.title,"-",e.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
c.xB=x(c.title,"X",e.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))c.strip=A("Frame",{Position=UDim2 .new(0,0,0,V.head),Size=UDim2 .new(1,0,0,V.strip),BackgroundColor3=e.bg,BorderSizePixel=0},c.root)
c.bar=A("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=e.warn,BorderSizePixel=0},c.strip)
W(c.bar,2)c.reason=D(c.strip,"starting",12,e.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))c.tabs=A("Frame",{Position=UDim2 .new(0,0,0,V.head+V.strip),Size=UDim2 .new(1,0,0,V.tabs),BackgroundTransparency=1},c.root)
c.tabFarm=x(c.tabs,"FARM",e.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))c.tabBut=x(c.tabs,"BUTTERS",e.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabCrt=x(c.tabs,"CRATES",e.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabPet=x(c.tabs,"PETS",e.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
c.tabTeam=x(c.tabs,"TEAMS",e.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))c.tabSet=x(c.tabs,"SETUP",e.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function bS()local hm=A("ScrollingFrame",{Position=UDim2 .new(0,0,0,V.head+V.strip+V.tabs),Size=UDim2 .new(1,0,1,-(V.head+V.strip+V.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=e.line,CanvasSize=UDim2 .new(0,0,0,100)},c.root)
A("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},hm)A("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},hm)
return hm end c.farm,c.but,c.set,c.crt=bS(),bS(),bS(),bS()c.pet,c.team=bS(),bS()c.but.Visible,c.set.Visible,c.crt.Visible,c.pet.Visible,c.team.Visible=false,false,false,false,false
local eC,cZ,C=0,12,nil local function aj(mb,r2)eC,cZ=eC+1,cZ+mb+6 return A("Frame",{Size=UDim2 .new(1,0,0,mb),BackgroundTransparency=1,LayoutOrder=eC},r2 or c.farm)
end local function c0(r3)D(aj(14),r3,10,e.dim,true)end C=aj(34)c.startB=x(C,"START",e.good,14,y(0,0.68))c.killB=x(C,"KILL",e.bad,14,y(0.68,0.32))
local r4=aj(42)local function c1(mc,r5,hn)local ho=A("Frame",{Position=UDim2 .new((mc-1)/hn,0,0,0),Size=UDim2 .new(1/hn,mc<hn and-4 or 0,1,0),
BackgroundColor3=e.panel,BorderSizePixel=0},r4)W(ho,6)local md=D(ho,"0",15,e.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local r6=D(ho,r5,9,e.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))md.TextXAlignment,r6 .TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return md end c.sBought,c.sPlaced,c.sSold,c.sColl,c.sFree=c1(1,"BOUGHT",5),c1(2,"WAXED",5),c1(3,"SOLD",5),c1(4,"MONEY",5),c1(5,"FREE",5)
c.info=D(aj(40),"",10,e.dim,false)c.tgt=D(aj(26),"",10,e.good,false)c0("MONEY COLLECT")C=aj(28)c.secB=hf(C,tostring(f.Every),"60",y(0,0.2))
D(C,"sec",11,e.dim,false,y(0.21,0.09))c.secSet=x(C,"SET",e.accent,12,y(0.3,0.2))c.colT=x(C,"COLLECT: ON",e.accent,11,y(0.5,0.5))
C=aj(26)c.padB=x(C,"SET PAD (stand on it)",e.panel2,10,y(0,0.55))c.padL=D(C,"",10,e.dim,false,y(0.56,0.44))c0("BUTTERS YOU DID NOT TICK, AND CRATES")
C=aj(28)c.sellT=x(C,"SELL THEM: ON",e.accent,11,y(0,0.55))c.sellB=x(C,"SELL NOW",e.warn,11,y(0.55,0.45))C=aj(28)
c.crateT=x(C,"OPEN CRATES: ON",e.accent,11,y(0,0.55))c.crateB=x(C,"OPEN NOW",e.warn,11,y(0.55,0.45))c0("THE GAME'S AUTO ROLL PASS  (it resets to off when you join)")
C=aj(28)c.arT=x(C,"AUTO ROLL: OFF",e.panel2,11,y(0,0.5))c.arL=D(C,"",9,e.dim,false,y(0.52,0.48))c0("TOOLS")C=aj(30)
c.buyB=x(C,"BUY",e.warn,10,y(0,0.5))c.plB=x(C,"WAX",e.good,10,y(0.5,0.5))c0("LOG")c.log=A("TextLabel",{Size=aO,BackgroundColor3=e.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=e.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},aj(84))W(c.log,6)A("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},c.log)
c.farm.CanvasSize=UDim2 .new(0,0,0,cZ)eC,cZ=0,12 local function aq(r7)return aj(r7,c.set)end local function eD(r8)D(aq(14),r8,10,e.dim,true)end
eD("SETTINGS FILE  (saved on your phone)")C=aq(28)c.cfgName=hf(C,"default","config name",y(0,0.5))c.cfgSave=x(C,"SAVE",e.good,11,y(0.5,0.25))
c.cfgLoad=x(C,"LOAD",e.accent,11,y(0.75,0.25))C=aq(26)c.cfgPrev=x(C,"<",e.panel2,11,y(0,0.13))c.cfgPick=x(C,"(none saved)",e.panel2,10,y(0.13,0.74))
c.cfgNext=x(C,">",e.panel2,11,y(0.87,0.13))C=aq(26)c.cfgAuto=x(C,"LOAD IT ON LAUNCH: OFF",e.panel2,10,y(0,1))
c.cfgMsg=D(aq(26),"",10,e.dim,false)eD("START BY ITSELF")C=aq(26)c.autoB=x(C,"INSTALL F.exec",e.accent,10,y(0,1))
c.autoMsg=D(aq(30),"",10,e.dim,false)C=aq(28)c.startT=x(C,"START FARMING ON LOAD: ON",e.accent,10,y(0,1))D(aq(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,e.dim,false)
eD("IF THE GAME DROPS ME")C=aq(28)c.rejT=x(C,"AUTO REJOIN: ON",e.accent,11,y(0,0.55))c.rejB=x(C,"REJOIN NOW",e.warn,11,y(0.55,0.45))
c.rejMsg=D(aq(30),"",10,e.dim,false)eD("THE ROUND SAB BUTTON")D(aq(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,e.dim,false)
c.set.CanvasSize=UDim2 .new(0,0,0,cZ)local me=A("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},hd)
c.tgRoot=A("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=e.accent,BorderSizePixel=0,Active=true},me)W(c.tgRoot,26)A("UIStroke",{Color=e.line,Thickness=1},c.tgRoot)
c.tgBtn=A("TextButton",{Text="SAB",Size=aO,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=e.text,AutoButtonColor=false},c.tgRoot)
c.tgDot=A("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=e.dim,BorderSizePixel=0},c.tgRoot)
W(c.tgDot,4)local aQ={built=false,boxes={},at=0}local function mf(mg,hp)f.Targets[mg]=hp or nil local hq=aQ.boxes[mg]
if hq then hq.Text=hp and"X"or""hq.BackgroundColor3=hp and e.good or e.panel2 end end local function hr()for r9,mh in pairs(aQ.boxes)do
local mi=f.Targets[r9]==true mh.Text=mi and"X"or""mh.BackgroundColor3=mi and e.good or e.panel2 end end local c2
local function r_()local sa=0 local hs=A("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},c.but)
c.butInfo=D(hs,"",10,e.dim,false,y(0,0.5))local sb=x(hs,"CLEAR",e.panel2,10,y(0.5,0.24))local sc=x(hs,"REFRESH",e.panel2,10,y(0.74,0.26))
sb.MouseButton1Click:Connect(function()for sd in pairs(f.Targets)do f.Targets[sd]=nil end hr()end)sc.MouseButton1Click:Connect(function()
H.at=0 fz()c2(true)end)return sa end c2=function(se)if not fz()then if not c.butEmpty then c.butEmpty=D(A("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},c.but),
"butter list not loaded yet - open this tab again in a moment",11,e.warn,false)end return end if aQ.built and not se and aQ.at==H.at then return end
for uc,ht in ipairs(c.but:GetChildren())do if ht:IsA("Frame")or ht:IsA("TextButton")then ht:Destroy()end end aQ.boxes,c.butEmpty={},nil
r_()local hu,hv=36,1 local function mj(mk)hv=hv+1 local sf=A("Frame",{Size=UDim2 .new(1,0,0,mk),BackgroundTransparency=1,LayoutOrder=hv},c.but)
hu=hu+mk+6 return sf end for ud,eE in ipairs(H.rarOrder)do local sh=mj(24)local si=lY[eE]or e.text local hw=A("Frame",{Size=aO,BackgroundColor3=e.panel,BorderSizePixel=0},sh)
W(hw,6)D(hw,"  "..eE:upper(),11,si,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local sj=x(hw,"ALL",e.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local sk=eE sj.MouseButton1Click:Connect(function()local ml=H.members[sk]or{}local mm=false for ue,sl in ipairs(ml)do if not f.Targets[sl]then mm=true break end end
for uf,sm in ipairs(ml)do mf(sm,mm)end end)for ug,hx in ipairs(H.members[eE]or{})do local sn=mj(22)local eF=A("TextButton",{Text="",Size=aO,BackgroundColor3=e.bg,BorderSizePixel=0,
AutoButtonColor=true},sn)W(eF,5)D(eF,"   "..Q(hx),11,e.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local hy=A("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=e.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=e.text,AutoButtonColor=false},eF)
W(hy,4)aQ.boxes[hx]=hy local mn=hx local function mo()mf(mn,not f.Targets[mn])end eF.MouseButton1Click:Connect(mo)
hy.MouseButton1Click:Connect(mo)end end hr()c.but.CanvasSize=UDim2 .new(0,0,0,hu+10)aQ.built,aQ.at=true,H.at end
function u.paint()for so,mp in pairs(u.boxes)do local mq=f.CrateTicks[so]==true mp.Text=mq and"X"or""mp.BackgroundColor3=mq and e.good or e.panel2
end if c.crtInfo then local hz,hA=0,0 for uh in pairs(u.boxes)do hz=hz+1 end for ui,sp in pairs(f.CrateTicks)do if sp then hA=hA+1 end end
c.crtInfo.Text=("%d crates, %d ticked"):format(hz,hA)end if c.crtAll then c.crtAll.Text=f.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"
c.crtAll.BackgroundColor3=f.Crates and e.accent or e.panel2 end end function u.build()for uj,hB in ipairs(c.crt:GetChildren())do
if hB:IsA("Frame")or hB:IsA("TextButton")then hB:Destroy()end end u.boxes={}local hC,hD=12,0 local function eG(mr)
hD=hD+1 hC=hC+mr+6 return A("Frame",{Size=UDim2 .new(1,0,0,mr),BackgroundTransparency=1,LayoutOrder=hD},c.crt)
end local hE=eG(28)c.crtInfo=D(hE,"",10,e.dim,false,y(0,0.5))local sq=x(hE,"CLEAR",e.panel2,10,y(0.5,0.24))local sr=x(hE,"REFRESH",e.panel2,10,y(0.74,0.26))
P(sq.MouseButton1Click:Connect(function()f.CrateTicks={}u.paint()end))P(sr.MouseButton1Click:Connect(function()u.build()end))
c.crtAll=x(eG(28),"",e.accent,11,y(0,1))P(c.crtAll.MouseButton1Click:Connect(function()f.Crates=not f.Crates u.paint()end))
D(eG(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,e.dim,false)
for uk,aR in ipairs(u.list())do local ss=eG(24)local c3=A("TextButton",{Text="",Size=aO,BackgroundColor3=e.panel,BorderSizePixel=0,AutoButtonColor=true},ss)
W(c3,5)D(c3,"  "..(aR.title or aR.name)..(aR.guess and"  (?)"or""),11,lY[aR.rar or""]or e.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
D(c3,aR.price and("$"..am(aR.price))or(aR.rar or""),9,e.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local hF=A("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=e.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=e.text,AutoButtonColor=false},c3)W(hF,4)u.boxes[aR.k]=hF local ms=aR.k local function mt()f.CrateTicks[ms]=(not f.CrateTicks[ms])or nil
u.paint()end P(c3 .MouseButton1Click:Connect(mt))P(hF.MouseButton1Click:Connect(mt))end c.crt.CanvasSize=UDim2 .new(0,0,0,hC+10)
u.built=u.at u.paint()end local mu="farm"local function a_(aa)mu=aa c.farm.Visible,c.but.Visible,c.set.Visible=(aa=="farm"),(aa=="but"),(aa=="set")
c.crt.Visible=(aa=="crt")c.pet.Visible,c.team.Visible=(aa=="pet"),(aa=="team")c.tabCrt.BackgroundColor3=(aa=="crt")and e.accent or e.panel2
c.tabPet.BackgroundColor3=(aa=="pet")and e.accent or e.panel2 c.tabTeam.BackgroundColor3=(aa=="team")and e.accent or e.panel2
if aa=="pet"and not j.built then pcall(j.build)end if aa=="team"and not l.built then pcall(l.build)end if aa=="crt"and(u.built~=u.at or not next(u.boxes))then u.build()end
c.tabFarm.BackgroundColor3=(aa=="farm")and e.accent or e.panel2 c.tabBut.BackgroundColor3=(aa=="but")and e.accent or e.panel2
c.tabSet.BackgroundColor3=(aa=="set")and e.accent or e.panel2 if aa=="but"then c2(false)end end local function N(mv,mw,su,sv)
mv.Text=mw and su or sv mv.BackgroundColor3=mw and e.accent or e.panel2 end j.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function j.paintRow(mx)
local c4=j.rows and j.rows[mx]if not c4 then return end local eH=f.Pets[mx]or{}c4 .b.BackgroundColor3=eH.b and e.good or e.panel2
c4 .g.BackgroundColor3=eH.g and e.accent or e.panel2 c4 .g.Text=eH.g and"BIG"or"ANY"c4 .w.BackgroundColor3=eH.w and e.warn or e.panel2
end function j.flag(hG,hH)local bs=f.Pets[hG]or{}if bs[hH]then bs[hH]=nil else bs[hH]=true end f.Pets[hG]=(bs.b or bs.g or bs.w)and bs or nil
j.paintRow(hG)end function j.paintAll()for sw in pairs(j.rows or{})do j.paintRow(sw)end if c.pbT then N(c.pbT,f.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(c.pwT,f.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")end end function j.live()if not j.built then j.build()return end
if q()-(j.liveAt or 0)<1 then return end j.liveAt=q()local my=j.wishes()for hI,sx in pairs(j.rows)do sx.name.Text=j.nice(hI)..(my[hI]and("   * wish %dm"):format(math.ceil(my[hI]/60))or"")
end local eI=j.data()local mz=tonumber(z:GetAttribute("PetWishCredits"))or 0 c.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eI and#(eI.pets or{})or 0,eI and tonumber(eI.maxOwned)or 60,
am(j.money()),mz>0 and(" | free wishes "..mz)or"",j.buyMsg~=""and j.buyMsg or"-",j.wishMsg~=""and j.wishMsg or"-")
end function j.build()local eJ=j.info()for ul,hJ in ipairs(c.pet:GetChildren())do if hJ:IsA("Frame")or hJ:IsA("TextLabel")then hJ:Destroy()end
end j.rows={}local hK,eK=0,12 local function bT(mA)hK,eK=hK+1,eK+mA+6 return A("Frame",{Size=UDim2 .new(1,0,0,mA),BackgroundTransparency=1,LayoutOrder=hK},c.pet)
end local mB=bT(28)c.pbT=x(mB,"AUTO ADOPT: OFF",e.panel2,10,y(0,0.5))c.pwT=x(mB,"AUTO WISH: OFF",e.panel2,10,y(0.5,0.5))
c.pbT.MouseButton1Click:Connect(function()f.PetBuy=not f.PetBuy j.paintAll()end)c.pwT.MouseButton1Click:Connect(function()f.PetWish=not f.PetWish j.paintAll()end)
c.pInfo=D(bT(44),"",10,e.dim,false)D(bT(40),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (costs 2x its price, 20 min, one per pet per server).",9,e.dim,false)
if not eJ then D(bT(30),"pet list not loaded yet - open this tab again in a moment",11,e.warn,false)c.pet.CanvasSize=UDim2 .new(0,0,0,eK)
j.built=false return end local bU={}for um,mC in ipairs(j.order())do local hL=eJ.Pets[mC].rarity or"?"bU[hL]=bU[hL]or{}
table.insert(bU[hL],mC)end local bV={}for un,mD in ipairs(eJ.Rarities or{})do if bU[mD]then bV[#bV+1]=mD end end
for mE in pairs(bU)do if not table.find(bV,mE)then bV[#bV+1]=mE end end for uo,eL in ipairs(bV)do local mF=A("Frame",{Size=aO,BackgroundColor3=e.panel,BorderSizePixel=0},bT(22))
W(mF,6)D(mF,"  "..eL:upper(),11,j.RC[eL]or e.text,true)for up,eM in ipairs(bU[eL])do local bW=A("Frame",{Size=aO,BackgroundColor3=e.bg,BorderSizePixel=0},bT(38))
W(bW,5)local sy=D(bW,j.nice(eM),11,j.RC[eL]or e.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-122,0,17))local sz,sA=pcall(function()return eJ.describe(eM)end)
D(bW,sz and tostring(sA)or"",9,e.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-122,0,17))local mG=x(bW,"BUY",e.panel2,9,UDim2 .new(1,-114,0.5,-11),UDim2 .new(0,34,0,22))
local mH=x(bW,"ANY",e.panel2,9,UDim2 .new(1,-77,0.5,-11),UDim2 .new(0,34,0,22))local mI=x(bW,"WISH",e.panel2,9,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,36,0,22))
local hM=eM mG.MouseButton1Click:Connect(function()j.flag(hM,"b")end)mH.MouseButton1Click:Connect(function()j.flag(hM,"g")end)
mI.MouseButton1Click:Connect(function()j.flag(hM,"w")end)j.rows[eM]={b=mG,g=mH,w=mI,name=sy}end end c.pet.CanvasSize=UDim2 .new(0,0,0,eK+10)
j.built=true j.paintAll()end function l.names()local hN={"(none)"}for uq,sB in ipairs((l.teams()))do hN[#hN+1]=sB.name end
return hN end function l.cycle(hO,sC)local eN=l.names()local sD=f[hO]~=""and f[hO]or"(none)"local eO=table.find(eN,sD)or 1
eO=((eO-1+sC)%#eN)+1 f[hO]=eN[eO]=="(none)"and""or eN[eO]l.paint()end function l.paint()if not l.built then return end
N(c.tmT,f.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")local hP={}for ur,sE in ipairs((l.teams()))do hP[sE.name]=true end
for sF,mJ in pairs(l.pick)do local bX=f[sF]mJ.Text=bX==""and"(none)"or(hP[bX]and bX or(bX.." (missing)"))mJ.TextColor3=(bX~=""and not hP[bX])and e.bad or e.text
end if not c.tmLead:IsFocused()then c.tmLead.Text=tostring(f.GlazeLead)end c.tmInfo.Text=(l.msg or"")..("\nswitches %d | waxes finished %d | glazed %d"):format(l.switches,l.finished,l.glazed)
local sG,eP=j.srv(),{}for us,eQ in ipairs(l.list or{})do eP[#eP+1]=("st %-2s %-22s %9s  helps %d"):format(eQ.st.Name,Q(J(eQ.name)):sub(1,22),l.clock(eQ.ends-sG),eQ.helps)
end c.tmList.Text=#eP>0 and table.concat(eP,"\n")or"no waxes running"end function l.build()for ut,hQ in ipairs(c.team:GetChildren())do
if hQ:IsA("Frame")or hQ:IsA("TextLabel")then hQ:Destroy()end end l.pick={}local hR,hS=0,12 local function bt(mK)
hR,hS=hR+1,hS+mK+6 return A("Frame",{Size=UDim2 .new(1,0,0,mK),BackgroundTransparency=1,LayoutOrder=hR},c.team)
end local function eR(sH)D(bt(14),sH,10,e.dim,true)end local function hT(eS)local hU=bt(26)local sI=x(hU,"<",e.panel2,11,y(0,0.14))
local mL=x(hU,"(none)",e.panel,10,y(0.14,0.72))local sJ=x(hU,">",e.panel2,11,y(0.86,0.14))sI.MouseButton1Click:Connect(function()l.cycle(eS,-1)end)
sJ.MouseButton1Click:Connect(function()l.cycle(eS,1)end)mL.MouseButton1Click:Connect(function()l.cycle(eS,1)end)
l.pick[eS]=mL end c.tmT=x(bt(28),"AUTO TEAMS: OFF",e.panel2,11,y(0,1))c.tmT.MouseButton1Click:Connect(function()
f.Teams=not f.Teams if f.Teams and f.TeamNormal==""then f.TeamNormal=l.current()end l.paint()end)c.tmInfo=D(bt(30),"",10,e.dim,false)
eR("NORMAL TEAM  (worn the rest of the time)")hT("TeamNormal")eR("GLAZE TEAM  (worn just before a wax finishes)")
hT("TeamGlaze")local hV=bt(26)c.tmLead=hf(hV,tostring(f.GlazeLead),"45",y(0,0.2))D(hV,"sec before it finishes",10,e.dim,false,y(0.22,0.5))
local sK=x(hV,"SET",e.accent,11,y(0.75,0.25))sK.MouseButton1Click:Connect(function()local eT=tonumber(c.tmLead.Text)
if eT and eT>=5 and eT<=600 then f.GlazeLead=math.floor(eT)else c.tmLead.Text=tostring(f.GlazeLead)end l.paint()
end)eR("WAX TEAM  (worn while a butter is placed)")hT("TeamWax")eR("YOUR WAXES  (time left, helps)")c.tmList=A("TextLabel",{Size=aO,BackgroundColor3=e.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=e.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text=""},bt(150))
W(c.tmList,6)A("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},c.tmList)D(bt(78),"Teams are the loadouts you saved in the game's Teams page. A wax's time is fixed when it is placed and its glaze is rolled when it finishes, so the WAX team only needs to be on while placing and the GLAZE team only at the finish. A help never leaves a wax under 60 s, so 45 s is enough. While AUTO TEAMS is on it keeps putting your NORMAL team back.",9,e.dim,false)
c.team.CanvasSize=UDim2 .new(0,0,0,hS+10)l.built=true l.paint()end local function sL()c.secB.Text=tostring(f.Every)
N(c.colT,f.Collect,"COLLECT: ON","COLLECT: OFF")N(c.sellT,f.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,f.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.arT,f.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(c.rejT,f.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,f.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if f.AutoStart~=a.running then cT(f.AutoStart,true)end if a.winPos then c.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then c.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end a9(c.root)a9(c.tgRoot)a.lastCollect=q()
hr()u.paint()pcall(j.paintAll)pcall(l.paint)end local function sM(mM)task.spawn(function()mM.TextColor3=e.bad
task.wait(0.8)if a.alive then mM.TextColor3=e.text end end)end local function mN()local mO=c.secB.Text:match("^%s*(%d+)%s*$")
local c5=mO and tonumber(mO)if not c5 or c5<1 then c.secB.Text=tostring(f.Every)sM(c.secB)o("interval must be a whole number >= 1")
return end if c5==f.Every then return end f.Every,a.lastCollect=c5,q()o("collect every "..c5 .."s")end local function F(sN,sO)P(sN.MouseButton1Click:Connect(sO))end
F(c.secSet,mN)P(c.secB.FocusLost:Connect(mN))F(c.colT,function()f.Collect,a.lastCollect=not f.Collect,q()N(c.colT,f.Collect,"COLLECT: ON","COLLECT: OFF")
end)F(c.sellT,function()f.SellJunk=not f.SellJunk N(c.sellT,f.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)F(c.sellB,function()
a.sellFails=0 task.spawn(ap,"selling...",lJ)end)F(c.arT,function()f.AutoRoll=not f.AutoRoll task.spawn(r.apply,"you asked",true)
end)F(c.crateT,function()f.Crates=not f.Crates N(c.crateT,f.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)F(c.crateB,function()
d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(ap,"opening crate...",d2,true)end)F(c.padB,function()
a.plot=aT()or a.plot local mP,hW=aD(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(mP and hW and hW:IsA("BasePart"))then o("SET PAD: need character and plot")return end
a.manualPad=hW.CFrame:ToObjectSpace(mP.HumanoidRootPart.CFrame)ra(a.manualPad)o("collect pad saved at your position")
end)F(c.startB,function()cT(not a.running)end)F(c.buyB,function()a.plot=aT()or a.plot task.spawn(ap,"buying (manual)...",jR,true)
end)F(c.plB,function()a.plot=aT()or a.plot task.spawn(ap,"waxing (manual)...",jW)end)F(c.tabFarm,function()a_("farm")end)
F(c.tabBut,function()a_("but")end)F(c.tabSet,function()a_("set")end)F(c.tabCrt,function()a_("crt")end)F(c.tabPet,function()a_("pet")end)
F(c.tabTeam,function()a_("team")end)local function mQ(hX)a.hidden=hX c.root.Visible=not hX c.tgBtn.Text=hX and"SAB+"or"SAB"
end l6(c.tgRoot,c.tgRoot,function(sP)a9(c.tgRoot)a.togPos=ey(c.tgRoot)or a.togPos if sP<8 then mQ(not a.hidden)end
end)F(c.tgBtn,function()mQ(not a.hidden)end)local ak,ac={},0 local function ba()ak=ja()if#ak==0 then c.cfgPick.Text="(none saved)"
ac=0 return end if ac<1 or ac>#ak then ac=1 end c.cfgPick.Text=ak[ac]..("  (%d/%d)"):format(ac,#ak)end local function mR()
local mS=a.autoload~=nil c.cfgAuto.Text=mS and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"c.cfgAuto.BackgroundColor3=mS and e.accent or e.panel2
end local function hY()local mT=c.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if mT~=""then return mT end return(ac>0 and ak[ac])or""
end F(c.cfgSave,function()a.winPos=ey(c.root)or a.winPos a.togPos=ey(c.tgRoot)or a.togPos local mU,mV=fG(hY())
c.cfgMsg.Text=mU and("saved as "..mV)or("could not save: "..mV)c.cfgMsg.TextColor3=mU and e.good or e.bad ba()
o(c.cfgMsg.Text)end)local function sQ(hZ)local h0,mW=jj(hZ)c.cfgMsg.Text=h0 and("loaded "..mW)or("could not load: "..mW)
c.cfgMsg.TextColor3=h0 and e.good or e.bad if h0 then c.cfgName.Text=hZ sL()task.spawn(r.apply,"config "..hZ)
end o(c.cfgMsg.Text)end F(c.cfgLoad,function()sQ(hY())end)F(c.cfgPick,function()ba()if ac>0 then c.cfgName.Text=ak[ac]end
end)F(c.cfgPrev,function()if#ak==0 then ba()return end ac=(ac-2)%#ak+1 ba()c.cfgName.Text=ak[ac]end)F(c.cfgNext,function()
if#ak==0 then ba()return end ac=ac%#ak+1 ba()c.cfgName.Text=ak[ac]end)F(c.cfgAuto,function()if a.autoload then
jl(nil)c.cfgMsg.Text="it will not load a config on launch"else local c6=hY()local mX=false for uu,sR in ipairs(ja())do if sR==c6 then mX=true end end
local sS=mX or fG(c6)if sS and c6~=""then jl(c6)ba()c.cfgMsg.Text=c6 .." will load every time the script starts"
else c.cfgMsg.Text="name the config and save it first"end end c.cfgMsg.TextColor3=e.dim mR()end)F(c.autoB,function()
local mY,mZ=oL()c.autoMsg.Text=mY and("installed. "..mZ)or("failed: "..mZ)c.autoMsg.TextColor3=mY and e.good or e.bad
o(c.autoMsg.Text)end)F(c.startT,function()f.AutoStart=not f.AutoStart N(c.startT,f.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)F(c.rejT,function()f.Rejoin=not f.Rejoin N(c.rejT,f.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)F(c.rejB,function()dK("you asked")end)
local bY=false F(c.minB,function()bY=not bY c.tabs.Visible=not bY if bY then c.farm.Visible,c.but.Visible,c.set.Visible,c.crt.Visible=false,false,false,false
c.pet.Visible,c.team.Visible=false,false else a_(mu)end c.root.Size=UDim2 .new(0,V.w,0,bY and(V.head+V.strip)or V.h)
c.minB.Text=bY and"+"or"-"end)local function eU()if not a.alive then return end a.alive,a.running=false,false
pcall(fh)for uv,sT in ipairs(eZ)do pcall(function()sT:Disconnect()end)end if d.oldNC then pcall(function()hookmetamethod(game,"__namecall",d.oldNC)end)end
pcall(function()he:Destroy()end)pcall(function()me:Destroy()end)if bv.SAB_KILL==eU then bv.SAB_KILL=nil end end
bv.SAB_KILL=eU F(c.killB,eU)F(c.xB,eU)l6(c.title,c.root,function()a9(c.root)a.winPos=ey(c.root)or a.winPos end)
local function m0()local c7,c8=a.reason,a.level if a.busy then c7,c8=a.busyText,"ok"elseif not a.running then
local uw,m1,sU=lP()if a.capHit then c7,c8=m1,"bad"else c7,c8="[stopped] "..m1,(sU=="bad")and"bad"or"idle"end a.reason,a.level=c7,c8
end c.reason.Text=c7 c.bar.BackgroundColor3=rw[c8]or e.dim c.dot.BackgroundColor3=a.running and e.good or(a.capHit and e.bad or e.dim)
c.tgDot.BackgroundColor3=c.dot.BackgroundColor3 c.tgRoot.BackgroundColor3=a.hidden and e.panel2 or e.accent c.startB.Text=a.running and"STOP"or"START"
N(c.startT,f.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")c.startB.BackgroundColor3=a.running and e.warn or e.good
local sV,sW=is()c.sBought.Text,c.sPlaced.Text,c.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
c.sColl.Text,c.sFree.Text=tostring(a.collected),sV.."/"..sW local m2=(a.running and f.Collect)and math.max(0,math.ceil(f.Every-(q()-a.lastCollect)))or nil
local m3=L()c.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
am(aC()),a.rolls,a.gifts,a.crates,m3 and Q(J(m3))or"nothing",d.on and("   ["..d.title.." window open]")or"",m2 and("in "..m2 .."s")or"off")
local bZ=oj()c.tgt.Text=(#bZ==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bZ<=3)and table.concat(bZ,", ")or(#bZ.." butters ticked")))
c.tgt.TextColor3=(#bZ==0)and e.bad or e.good c.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
c.log.Text=table.concat(da,"\n")if c.butInfo then c.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(H.n,#H.rarOrder,#bZ)
end if c.but.Visible and aQ.at~=H.at then c2(false)end if c.crt.Visible then if u.built~=u.at then u.build()else u.paint()end
end if c.pet.Visible then j.live()end if c.team.Visible then l.paint()end N(c.crateT,f.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.arT,f.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local m4=(r.rec.on and"on"or"")..(r.rec.off and((r.rec.on and"/"or"").."off")or"")
c.arL.Text=r.msg~=""and r.msg or("game: %s | learned: %s%s"):format(r.isOn()and"ON"or"off",m4~=""and m4 or"nothing yet",#r.rec.rules>0 and", choices"or"")
c.arL.TextColor3=r.msg~=""and e.warn or e.dim end bv.SAB={S=a,CFG=f,EV=E,U=c,sg=he,CAT=H,LEARN=M,buildList=c2,
logAll=b1,evAll=b2,AR=r,CR=u,PX=j,TM=l,CRATE=d}o(bu.." loaded")if a.uiErrs>0 then o("UI: "..a.uiErrs.." properties skipped")end
a_("farm")a9(c.root)a9(c.tgRoot)if ev then pcall(function()P(ev:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)a9(c.root)a9(c.tgRoot)end))end)end ba()mR()if a.config and a.config~=""then c.cfgName.Text=a.config end
N(c.colT,f.Collect,"COLLECT: ON","COLLECT: OFF")N(c.sellT,f.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(c.crateT,f.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(c.rejT,f.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(c.startT,f.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
c.secB.Text=tostring(f.Every)pcall(m0)task.spawn(function()local m5=fI()c.rejMsg.Text=m5 and("after a rejoin it restarts from\n"..m5)or
"no saved copy of this script found, so after a rejoin you would start it by hand"c.autoMsg.Text=(fA(ad.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(oR)end)task.spawn(function()while a.alive do local sX,sY=pcall(m0)if not sX then o("UI ERR "..tostring(sY))end
task.wait(0.25)end end)task.spawn(function()local sZ,s0=pcall(o0)if not sZ then o("HOOK ERR "..tostring(s0))end
end)task.spawn(function()pcall(nI)if d.loadSeq and not d.learned then local eV={}for m6=1,20 do if d.loadSeq[m6]then eV[#eV+1]=d.loadSeq[m6]end end
if#eV>0 then d.learned={seq=eV,mode=d.loadMode}o("remembered how to open crates directly")end end if fz()then o(("catalog: %d butters in %d rarities"):format(H.n,#H.rarOrder))end
local s1,m7=pcall(rc)if s1 and m7 and a.alive and not a.manualPad then a.manualPad=m7 end end)task.spawn(function()
while a.alive do local h1,h2=pcall(j.buyTick)if not h1 then o("PET ERR "..tostring(h2))task.wait(5)end h1,h2=pcall(j.wishTick)
if not h1 then o("WISH ERR "..tostring(h2))task.wait(5)end task.wait(0.75)end end)task.spawn(function()while a.alive do
local s2,s3=pcall(l.tick)if not s2 then o("TEAM ERR "..tostring(s3))task.wait(3)end task.wait(0.25)end end)task.spawn(function()
while a.alive do task.wait(20)pcall(fh)end end)pcall(r.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local s5=(type(newcclosure)=="function")and newcclosure or function(s4)return s4 end local h3
local m8=(type(setnamecallmethod)=="function")and setnamecallmethod or nil h3=hookmetamethod(game,"__namecall",s5(function(m9,...)
local c9=getnamecallmethod()if a.alive and(c9=="InvokeServer"or c9=="FireServer")then local m_,na=pcall(function()return m9 .Name end)
if m_ and na=="CrateAction"and not d.replaying then pcall(d.saw,c9,...)elseif m_ and na=="AutoRollAction"and not r.replaying then pcall(r.saw,c9,...)end
if m8 then m8(c9)end end return h3(m9,...)end))d.oldNC=h3 end)end if eX then P(z.Idled:Connect(function()pcall(function()eX:CaptureController()eX:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for ux=1,90 do if not a.alive then return end if z:GetAttribute("AutoRollOn")~=nil and aD()and(a.plot or aT())then break end
task.wait(1)end task.wait(2)if f.AutoRoll then r.apply("joined")end while a.alive do task.wait(30)if a.alive and f.AutoRoll and a.running and not r.isOn()and not cf()and not L()
and not d.waiting and not d.on and not a.busy then r.apply("it was off")end end end)task.spawn(function()if not f.AutoStart then return end
a.reason,a.level="waiting for the game to load, then starting","wait"for uy=1,120 do if not a.alive then return end
if a.running then return end a.plot=a.plot or aT()if aD()and a.plot and next(f.Targets)then cT(true,true)o("started by itself")
return end task.wait(1)end if a.alive and not a.running then o("gave up waiting to start - tap START")end end)
task.spawn(function()a.plot=aT()a.lastCollect=q()while a.alive do if a.running then local s6,nb=pcall(rr)if not s6 and nb~=eY then o("LOOP ERR "..tostring(nb))end
end task.wait(0.1)end end)eW("loaded - window is at the top left")end local s8,h4=xpcall(nf,function(s7)return tostring(s7).."\n"..debug.traceback()end)
if not s8 then pcall(function()warn("SAB "..bu.." ERROR: "..tostring(h4))end)eW("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..bu.." ERROR: "..tostring(h4))end)pcall(function()local nc=(type(getgenv)=="function"and getgenv())or _G
if type(nc.SAB_KILL)=="function"then nc.SAB_KILL()end for uz,s9 in ipairs({"SABFarmGui","SABToggle"})do local nd=z.PlayerGui:FindFirstChild(s9)
if nd then nd:Destroy()end end end)pcall(function()local c_=Instance.new("ScreenGui")c_.Name="SABError"c_.ResetOnSpawn=false
c_.DisplayOrder=1000 local ay=Instance.new("TextBox")ay.Size=UDim2 .new(0,340,0,170)ay.Position=UDim2 .new(0,10,0,50)
ay.BackgroundColor3=Color3 .fromRGB(90,20,20)ay.TextColor3=Color3 .new(1,1,1)ay.TextSize=11 ay.TextWrapped=true
ay.ClearTextOnFocus=false ay.TextXAlignment=Enum.TextXAlignment.Left ay.TextYAlignment=Enum.TextYAlignment.Top
ay.Text="SAB "..bu.." failed to start. Send this text:\n"..tostring(h4)ay.Parent=c_ c_.Parent=z:WaitForChild("PlayerGui")
end)end
