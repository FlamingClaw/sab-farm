local cn="v26"local mj=game:GetService("Players")local F=mj.LocalPlayer or mj.PlayerAdded:Wait()local function hF(ua)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..cn,Text=ua,Duration=6})
end)end hF("script started")local function ub()local ag=game:GetService("ReplicatedStorage")local au=game:GetService("Workspace")
local mk=game:GetService("UserInputService")local co=(type(getgenv)=="function"and getgenv())or _G if type(co.SAB_KILL)=="function"then pcall(co.SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local hG=(function()local uc,ud=pcall(function()return game:GetService("VirtualUser")end)return uc and ud or nil end)()
local d={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,Calm=false,HideBases=false,HideMine=false,MemLimit=2000,Help=false,
HelpGuild=false,Campfire=true,Ghost=false,GhostHelps=false,Quests=true,AutoIndex=false,Best=0,BestCrate=false,
Shower=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=x(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local W={name=nil,rar=nil,at=x(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local C={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local e={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local l,y,j,A,D,J,E={},{},{},{},{},{},{}local q,Q={},{}local hH={}local hI,eV,c_,da={},{},{},{}local function V(ml)hI[#hI+1]=ml return ml end
local function ae(ue)task.wait(ue)if not c.alive then error(hH,0)end end local function z(eW)eW=os.date("%H:%M:%S").." "..tostring(eW)
table.insert(eV,1,eW)if#eV>6 then table.remove(eV)end c.logN=(c.logN or 0)+1 c_[#c_+1]=eW if#c_>80 then table.remove(c_,1)end
end local function eX(mm)if type(mm)~="string"then return""end return(mm:lower():gsub("[^%w]",""))end local function aa(uf)
local mn=eX(uf)local hJ=mn:gsub("butter$","")if hJ==""then hJ=mn end return hJ end local function aI(mo)if type(mo)~="string"then return false end
local hK=aa(mo)if hK==""then return false end if q.want then return q.want(hK)end return d.Targets[hK]==true end
local function ug(db)db=db:lower()return db:find("squishy",1,true)~=nil or db:match("butter$")~=nil or db:match("butter[^%a]")~=nil
end local hL={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aJ(dc)if type(dc)~="number"then return"?"end
local eY=1 while math.abs(dc)>=1000 and eY<#hL do dc=dc/1000 eY=eY+1 end local uh=string.format("%.2f",dc):gsub("%.?0+$","")
return uh..hL[eY]end local function ui(mp)if type(mp)~="string"then return nil end local uj,dd=mp:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local hM=tonumber(uj)if not hM then return nil end if dd==""then return hM end local uk={qd="qa",qn="qi"}dd=uk[dd:lower()]or dd
for ul,um in ipairs(hL)do if um:lower()==dd:lower()then return hM*1000^(ul-1)end end return nil end local function a7()
local mq=F:GetAttribute("BoardValueMoney")if type(mq)=="number"then return mq end local mr=F:FindFirstChild("leaderstats")
if mr then for CH,uo in ipairs({"Cash","Money","Coins"})do local hN=mr:FindFirstChild(uo)if hN and type(hN.Value)=="number"then return hN.Value end
end end end local function eZ(up)local hO=up:GetFullName()if c.plot then local hP=c.plot:GetFullName()if hO:sub(1,#hP)==hP then return hO:sub(#hP+2)end
end return hO end local function ao()local e0=F.Character if e0 and e0:FindFirstChild("HumanoidRootPart")then
local ms=e0:FindFirstChildOfClass("Humanoid")if ms and ms.Health>0 then return e0 end end end local function bp()
local hQ=au:FindFirstChild("Plots")if not hQ then return nil end local function mt(uq)local mu=uq:FindFirstChild("Plate")
return mu~=nil and mu:FindFirstChild("EditStackAttachment",true)~=nil end local mv=F:GetAttribute("PlotNumber")
if mv~=nil then local hR=hQ:FindFirstChild(tostring(mv))if hR and mt(hR)then return hR end end for CI,mw in ipairs(hQ:GetChildren())do
if mt(mw)then return mw end end end local function de(mx)local bq=mx and mx.Parent for CJ=1,6 do if not bq then return nil end
if bq:IsA("BasePart")then return bq end if bq:IsA("Model")then return bq.PrimaryPart or bq:FindFirstChildWhichIsA("BasePart",true)end
bq=bq.Parent end end local function my(mz)local hS=mz.Parent if hS and hS:IsA("Attachment")then return hS.WorldPosition end
local mA=de(mz)return mA and mA.Position end local function mB()local cp=c.plot and c.plot:FindFirstChild("Plate")
if not cp then return nil end if cp:IsA("BasePart")then return cp.Position end if cp:IsA("Model")then return cp:GetPivot().Position end
local mC=cp:FindFirstChildWhichIsA("BasePart",true)return mC and mC.Position end local function mD()local hT={}
local mE=c.plot and c.plot:FindFirstChild("WaxStations")if mE then for CK,ur in ipairs(mE:GetChildren())do local mF=ur:FindFirstChild("SquishyPlaceHolder")
local hU=mF and mF:FindFirstChild("PlacePrompt")if hU and hU:IsA("ProximityPrompt")then hT[#hT+1]=hU end end end
return hT end local function e1()local mG,hV=mD(),0 for CL,us in ipairs(mG)do if us.Enabled then hV=hV+1 end end
local hW=#mG local hX=F:GetAttribute("WaxStations")if type(hX)=="number"and hX>hW then hW=hX end return hV,hW
end local function ut()local mH=ao()local mI=mH and mH.HumanoidRootPart.Position local hY,mJ for CM,hZ in ipairs(mD())do
if hZ.Enabled then local mK=my(hZ)local mL=(mK and mI)and(mK-mI).Magnitude or 1e9 if not hY or mL<mJ then hY,mJ=hZ,mL end
end end return hY end local function mM()local e2=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not e2 then return nil end local mN=e2:FindFirstChild("BuyPromptAttachment")local e3=(mN and mN:FindFirstChild("BuyPrompt"))or e2:FindFirstChild("BuyPrompt",true)
if e3 and e3:IsA("ProximityPrompt")and e3:IsDescendantOf(e2)then return e3 end end local mO={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local uu={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ah={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local h0="SAB_order.txt"local function e4()if not ah.dirty or type(writefile)~="function"then return end local aA={}
for uv,uw in pairs(ah.price)do aA[#aA+1]="P|"..uv.."|"..string.format("%.0f",uw)end for ux,uy in pairs(ah.order)do aA[#aA+1]="O|"..ux.."|"..table.concat(uy,",")end
if e.learned and e.enc then aA[#aA+1]="M|mode|"..tostring(e.learned.mode or"")for uz,e5 in ipairs(e.learned.seq)do
local mP={}for mQ=1,e5 .n do mP[mQ]=e.enc(e5 .args[mQ])end aA[#aA+1]=("A|%d|%s|%d|%s"):format(uz,e5 .m,e5 .n,table.concat(mP,";"))
end end local function h1(uA,uB,e6)local mR={}for mS=1,e6 .n do mR[mS]=e.enc(e6 .args[mS])end aA[#aA+1]=("R|%d|%s|%s|%d|%s"):format(uB,uA,e6 .m,e6 .n,table.concat(mR,";"))
end if e.enc then for uC,uD in ipairs(C.rec.rules)do h1("rules",uC,uD)end if C.rec.on then h1("on",0,C.rec.on)end
if C.rec.off then h1("off",0,C.rec.off)end end for CN,df in pairs(L.seen)do aA[#aA+1]=("K|%s|%s|%s|%s"):format(df.name,df.title or"",df.rar or"",df.price and string.format("%.0f",df.price)or"")
end if pcall(writefile,h0,table.concat(aA,"\n"))then ah.dirty=false end end local function uE()if type(isfile)~="function"or type(readfile)~="function"then return end
local uF,uG=pcall(isfile,h0)if not(uF and uG)then return end local uH,mT=pcall(readfile,h0)if not(uH and type(mT)=="string")then return end
for uI in mT:gmatch("[^\n]+")do local cq,cr,a8=uI:match("^(%a)|([^|]+)|(.*)$")if cq=="P"then ah.price[cr]=tonumber(a8)
elseif cq=="M"then e.loadMode=(a8~=""and a8~="nil")and a8 or nil elseif cq=="A"and e.dec then local mU=tonumber(cr)
local mV,e7,uJ=a8:match("^([^|]+)|(%d+)|(.*)$")if mU and mV then e7=tonumber(e7)local mW,e8={},0 for uK in(uJ..";"):gmatch("([^;]*);")do
e8=e8+1 if e8<=e7 then mW[e8]=e.dec(uK)end end e.loadSeq=e.loadSeq or{}e.loadSeq[mU]={m=mV,n=e7,args=mW}end elseif cq=="R"and e.dec then
local mX=tonumber(cr)local e9,uL,e_,uM=a8:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if mX and e9 then e_=tonumber(e_)
local mY,fa={},0 for uN in(uM..";"):gmatch("([^;]*);")do fa=fa+1 if fa<=e_ then mY[fa]=e.dec(uN)end end local h2={m=uL,n=e_,args=mY}
if e9=="rules"then C.rec.rules[mX]=h2 elseif e9=="on"then C.rec.on=h2 elseif e9=="off"then C.rec.off=h2 end end
elseif cq=="K"then local mZ,m0,uO=a8:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cr)]={name=cr,title=mZ~=""and mZ or nil,
rar=m0~=""and m0 or nil,price=tonumber(uO)}elseif cq=="O"and a8~=""then local fb={}for uP in a8:gmatch("[^,]+")do fb[#fb+1]=uP end
if#fb>0 then ah.order[cr]=fb end end end end local function uQ(fc)if type(fc)~="table"then return end local bP,m1=fc.rarity,fc.contents
if type(bP)~="string"or bP==""or type(m1)~="table"then return end local dg={}for CO,fd in ipairs(m1)do if type(fd)=="table"and type(fd.butter)=="string"then
dg[#dg+1]={n=fd.butter,ch=tonumber(fd.chance)or 0}end end if#dg==0 then return end table.sort(dg,function(uR,uS)return uR.ch>uS.ch end)
local dh,di={},false for uT,uU in ipairs(dg)do dh[uT]=uU.n end local h3=ah.order[bP]if not h3 or#h3~=#dh then di=true end
if not di then for m2=1,#dh do if h3[m2]~=dh[m2]then di=true break end end end ah.order[bP]=dh local h4=tonumber(fc.price)
if h4 and ah.price[bP]~=h4 then ah.price[bP]=h4 di=true end if di then ah.dirty=true ad.at=0 z("learned the "..bP.." order from its crate")
end end local function cs(uV,uW)local uX=uV:FindFirstChild(uW,true)local uY,h5=pcall(function()return uX.Text end)
return(uY and type(h5)=="string"and h5~="")and h5 or nil end local function ai(m3)return ad.pretty[m3]or m3 end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(uZ)return eX(uZ or"")end
function L.learn(a9)if type(a9)~="table"or type(a9 .name)~="string"then return end local h6=L.key(a9 .name)local a_=L.seen[h6]or{}
local u0=(L.seen[h6]==nil)or(tonumber(a9 .price)and a_.price~=tonumber(a9 .price))a_.name,a_.title=a9 .name,a9 .title or a_.title
a_.rar,a_.price=a9 .rarity or a_.rar,tonumber(a9 .price)or a_.price L.seen[h6]=a_ if u0 then L.at,ah.dirty=x(),true end
end function L.wanted(m4)if m4==nil then return false end local h7=L.key(m4)return d.CrateTicks[h7]==true or(d.BestCrate and q.bestCrate~=nil and(h7==q.bestCrate or h7==q.bestCrateTitle))
end function L.list()local ct={}for u1,fe in ipairs(L.base)do ct[L.key(fe[1])]={name=fe[1],title=fe[2],rar=fe[3],i=u1}end
for CP,dj in ipairs(ad.rarOrder)do local m5=false for CQ,u2 in pairs(ct)do if u2 .rar==dj then m5=true break end end
if not m5 and dj~="?"then local m6=dj:gsub("[^%w]","").."Crate"ct[L.key(m6)]={name=m6,title=dj.." Crate",rar=dj,i=50,guess=true}
end end for m7,ff in pairs(L.seen)do local aZ=ct[m7]or{i=100}aZ.name,aZ.title,aZ.rar=ff.name or aZ.name,ff.title or aZ.title,ff.rar or aZ.rar
aZ.price,aZ.guess=ff.price or aZ.price,nil ct[m7]=aZ end local dk,fg={},{}for u3,u4 in ipairs(mO)do dk[u4]=u3 end
for u5,m8 in ipairs(ad.rarOrder)do dk[m8]=dk[m8]or(20+u5)end for u6,dl in pairs(ct)do dl.k=u6 dl.price=dl.price or ah.price[dl.rar or""]
fg[#fg+1]=dl end table.sort(fg,function(bQ,bR)if bQ.price and bR.price and bQ.price~=bR.price then return bQ.price<bR.price end
local m9,m_=dk[bQ.rar or""]or 99,dk[bR.rar or""]or 99 if m9~=m_ then return m9<m_ end if(bQ.i or 100)~=(bR.i or 100)then return(bQ.i or 100)<(bR.i or 100)end
return bQ.k<bR.k end)return fg end local function u7()local na=ag:FindFirstChild("Assets")local nb=na and na:FindFirstChild("Squishies")
if not nb then return false end local h8,nc,cu={},{},{}local fh=0 for CS,fi in ipairs(nb:GetChildren())do local dm=aa(fi.Name)
if dm~=""and not h8[dm]then local fj=cs(fi,"RarityText")or"?"h8[dm]=fj nc[dm]=cs(fi,"NameText")or fi.Name cu[fj]=cu[fj]or{}
table.insert(cu[fj],dm)fh=fh+1 end end if fh==0 then return false end for nd,u8 in pairs(cu)do local ne=ah.order[nd]or uu[nd]
local h9={}if ne then for u9,u_ in ipairs(ne)do h9[aa(u_)]=u9 end end table.sort(u8,function(nf,ng)local h_,ia=h9[nf],h9[ng]
if h_ and ia then return h_<ia end if h_ then return true end if ia then return false end return ai(nf)<ai(ng)
end)end local ib={}for va,vb in ipairs(mO)do ib[vb]=va end local fk,bS={},{}for vc in pairs(cu)do fk[#fk+1]=vc end
pcall(function()for vd,ve in ipairs(require(ag.Modules.SquishyRNG).Keys)do bS[ve]=vd end end)table.sort(fk,function(cv,cw)
if bS[cv]and bS[cw]and bS[cv]~=bS[cw]then return bS[cv]<bS[cw]end local ic,ie=ah.price[cv],ah.price[cw]if ic and ie and ic~=ie then return ic<ie end
local ig,ih=ib[cv],ib[cw]if ig and ih then return ig<ih end if ig then return true end if ih then return false end
return cv<cw end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=h8,nc,cu,fk,fh,x()return true end local function ii()
if ad.at==0 or(x()-ad.at)>120 then pcall(u7)end return ad.n>0 end local function vf(vg)local nh=aa(vg)return ad.rar[nh]or(W.name and aa(W.name)==nh and W.rar)or"?"
end local function vh()local fl={}local vi=((d.Best or 0)>0 and next(q.best or{}))and q.best or d.Targets for vj,vk in pairs(vi)do if vk then fl[#fl+1]=ai(vj)end end
table.sort(fl)return fl end local al={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function ni()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fm(nj)if type(makefolder)~="function"then return end local vl,vm=pcall(isfolder,nj)if not(vl and vm)then pcall(makefolder,nj)end
end local function fn(nk)if type(isfile)~="function"or type(readfile)~="function"then return nil end local vn,vo=pcall(isfile,nk)
if not(vn and vo)then return nil end local vp,vq=pcall(readfile,nk)return vp and vq or nil end local function dn(vr,vs)
if type(writefile)~="function"then return false end return(pcall(writefile,vr,vs))end local function nl(vt)local dp={}
if type(listfiles)~="function"then return dp end local vu,nm=pcall(listfiles,vt)if not vu or type(nm)~="table"then return dp end
for CT,vv in ipairs(nm)do dp[#dp+1]=tostring(vv)end return dp end local function nn()local fo={}for CU,vw in ipairs(nl(al.cfg))do
local no=vw:match("([^/\\]+)%.txt$")if no then fo[#fo+1]=no end end table.sort(fo)return fo end local function vx()
local ab={"V|1"}ab[#ab+1]="N|Every|"..tostring(d.Every)ab[#ab+1]="N|GlazeLead|"..tostring(d.GlazeLead)ab[#ab+1]="N|FpsCap|"..tostring(d.FpsCap)
ab[#ab+1]="N|MemLimit|"..tostring(d.MemLimit)ab[#ab+1]="N|Best|"..tostring(d.Best or 0)for CV,np in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ab[#ab+1]="S|"..np.."|"..d[np]end
do local fp={}for vy,dq in pairs(d.Pets)do local nq=(dq.b and"b"or"")..(dq.g and"g"or"")..(dq.w and"w"or"")..((tonumber(dq.f)or 0)>0 and tostring(dq.f)or"")
if nq~=""then fp[#fp+1]=vy.."|"..nq end end table.sort(fp)ab[#ab+1]="P|-"for CW,vz in ipairs(fp)do ab[#ab+1]="P|"..vz end
end for CX,nr in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm"})do
ab[#ab+1]="B|"..nr.."|"..(d[nr]and"1"or"0")end local ij=F:GetAttribute("AutoRollRules")if type(ij)=="string"and ij~=""then d.ARrules,d.ARstop=ij,tostring(F:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then ab[#ab+1]="S|rules|"..d.ARrules ab[#ab+1]="S|stop|"..d.ARstop end if c.winPos then ab[#ab+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ab[#ab+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for CY,ik in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fq={}for vA,vB in pairs(ik[2])do if vB then fq[#fq+1]=vA end end table.sort(fq)ab[#ab+1]=ik[1].."|-"for CZ,vC in ipairs(fq)do ab[#ab+1]=ik[1].."|"..vC end
end return table.concat(ab,"\n")end local function vD(il)if type(il)~="string"or il==""then return false end local ns,nt,nu,nv,dr={},false,{},false,nil
for vE in il:gmatch("[^\n]+")do local aB,af,aw=vE:match("^(%a)|([^|]*)|?(.*)$")if aB=="N"and af=="Every"then local im=tonumber(aw)
if im and im>=1 then d.Every=math.floor(im)end elseif aB=="N"and(af=="FpsCap"or af=="MemLimit")then local io=tonumber(aw)
if io and io>=0 then d[af]=math.floor(io)end elseif aB=="N"and af=="Best"then local fr=tonumber(aw)if fr and fr>=0 and fr<=4 then d.Best=math.floor(fr)end
elseif aB=="N"and af=="GlazeLead"then local fs=tonumber(aw)if fs and fs>=5 and fs<=600 then d.GlazeLead=math.floor(fs)end
elseif aB=="S"and(af=="TeamNormal"or af=="TeamFull"or af=="TeamGlaze"or af=="TeamWax")then d[af]=aw elseif aB=="P"and af~=""then
if not dr then dr={}end if af~="-"and aw~=""then dr[af]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aB=="B"then if d[af]~=nil then d[af]=(aw=="1")end
elseif aB=="S"and af=="rules"then d.ARrules=aw elseif aB=="S"and af=="stop"then d.ARstop=aw elseif aB=="W"then
c.winPos={tonumber(af)or 10,tonumber(aw)or 44}elseif aB=="G"then c.togPos={tonumber(af)or 10,tonumber(aw)or 300}
elseif aB=="T"and af~=""then if af~="-"then ns[af]=true end nt=true elseif aB=="K"and af~=""then if af~="-"then nu[af]=true end
nv=true end end if nt then d.Targets=ns end if nv then d.CrateTicks=nu end if dr then d.Pets=dr end return true
end local function ft(cx)if not ni()then return false,"this executor cannot write files"end cx=(cx or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cx==""then return false,"give the config a name"end fm(al.dir)fm(al.cfg)if not dn(al.cfg.."/"..cx..".txt",vx())then return false,"could not write the file"end
c.config=cx return true,cx end local function nw(fu)local nx=fn(al.cfg.."/"..fu..".txt")if not nx then return false,"no config called "..tostring(fu)end
if not vD(nx)then return false,"that config looks empty"end c.config=fu return true,fu end local function ny(ip)
if ip then fm(al.dir)dn(al.auto,ip)elseif type(delfile)=="function"then pcall(delfile,al.auto)else dn(al.auto,"")
end c.autoload=ip end local function vF()if c.selfPath then return c.selfPath end local fv for C0,vG in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",al.dir})do
for C1,nz in ipairs(nl(vG))do local iq=nz:lower()if iq:sub(-4)==".lua"and(iq:find("sab_farm",1,true)or iq:find("sab farm",1,true))then
fv=fv or nz end end end c.selfPath=fv return fv end al.stub=[[
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
local function vH()if not ni()then return false,"this executor cannot write files"end fm("autoexec")if not dn(al.exec,al.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fw=(function()local vI,vJ=pcall(function()return game:GetService("TeleportService")end)return vI and vJ or nil end)()
local function nA()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local vK=queueonteleport or queue_on_teleport return(pcall(vK,al.stub))end local function ds(vL)if c.rejoining then return end
c.rejoining=true z("REJOIN ("..vL..")")pcall(e4)if c.autoload then pcall(ft,c.autoload)end local vM=nA()z(vM and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for C2=1,30 do if not fw then break end pcall(function()fw:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function vN()local vO,nB=pcall(function()return game:GetService("GuiService")end)if vO and nB then
pcall(function()V(nB.ErrorMessageChanged:Connect(function()if d.Rejoin then ds("roblox error message")end end))
end)end pcall(function()local nC=game:GetService("CoreGui")local nD=nC and nC:WaitForChild("RobloxPromptGui",15)
local nE=nD and nD:WaitForChild("promptOverlay",15)if nE then V(nE.ChildAdded:Connect(function(vP)if d.Rejoin and tostring(vP.Name):lower():find("errorprompt",1,true)then ds("disconnect prompt")end
end))end end)if fw then pcall(function()V(fw.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()ds("teleport retry")end)end
end))end)end end local function nF(vQ)local nG=c.plot and c.plot:FindFirstChild(vQ)if not nG then return nil,false end
for C3,ir in ipairs(nG:GetChildren())do if ir:IsA("Model")or ir:IsA("BasePart")then return ir,true end end return nil,true
end local function bT()local br=nF("RolledSquishy")if not br then return nil end return{model=br,name=br.Name,pretty=cs(br,"NameText")or ai(aa(br.Name)),
rar=cs(br,"RarityText")or vf(br.Name),price=cs(br,"PriceText")}end local function nH(is)return type(is)=="string"and(ad.rar[aa(is)]~=nil or ug(is))
end local function ac()local it=nF("SquishyEquipped")if it then c.carrySrc,e.heldAt="model",x()return it.Name,it end
local nI=F.Character if nI then for C4,dt in ipairs(nI:GetDescendants())do if(dt:IsA("Model")or dt:IsA("Tool"))and nH(dt.Name)then
c.carrySrc,e.heldAt="character",x()return dt.Name,dt end end end local fy=F:GetAttribute("SquishyEquipped")if type(fy)=="string"and fy~=""and nH(fy)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fy,nil end c.carrySrc=nil end local function C5()local C6,vR=ac()return vR end local function du()
local nJ=bT()local iu=nJ and ui(nJ.price)local iv=a7()if iu and iv and iv<iu*0.5 then return iv,iu end end local function bU(vS)
da[#da+1]=os.date("%H:%M:%S").." "..vS if#da>40 then table.remove(da,1)end end local function vT(bV,fz)if type(bV)~="string"then return end
bU(("Roll(%s,%s)"):format(bV,tostring(fz)))if bV:lower():find("crate",1,true)then e.rolled,e.rolledAt=bV,x()return
end W.seq=W.seq+1 W.name,W.at=bV,x()W.rar=type(fz)=="string"and fz or nil c.rolls=c.rolls+1 if aI(bV)then z(("ROLL %s [%s] = TARGET"):format(bV,tostring(fz)))end
end local function vU(bW)if type(bW)~="table"then return end local fA=bW.butter or bW.itemName if type(fA)~="string"then return end
c.gifts=c.gifts+1 W.gift,W.giftAt=fA,x()if type(bW.giftId)=="string"then local nK=ag:FindFirstChild("Remotes")
local nL=nK and nK:FindFirstChild("GiftThanks")if nL then pcall(function()nL:FireServer(bW.giftId)end)end end
bU("Gift("..fA.." from "..tostring(bW.fromName)..")")z(("GIFT from %s: %s - it will not be waxed"):format(tostring(bW.fromName),fA))
end local function vV()local nM=ag:WaitForChild("Remotes",30)if not c.alive then return end if not nM then z("Remotes folder missing - no roll events")return end
V(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local nN=F:GetAttribute("SquishyEquipped")
if type(nN)=="string"and nN~=""then e.heldAt=x()end end))local v1={SquishyRollAnimation=vT,InitSquishy=function(nO)W.init,W.initAt=tostring(nO),x()bU("Init("..tostring(nO)..")")end,
CrateUpdate=function(cy,nP)pcall(uQ,cy)pcall(L.learn,cy)if type(cy)=="table"then local vW=nP==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not vW then return end local vX=not e.waiting local vY=e.on e.waiting,e.data,e.at=true,cy,x()e.on=(nP==true)
e.title=tostring(cy.title or cy.name or"crate")if e.on and not vY then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then bU("CrateWindow open("..e.title..")")elseif vX then bU("Crate waiting("..e.title..")")z(e.title.." is waiting on your stand")
end else if e.waiting then bU("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local vZ=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,vZ)end if e.classify then local v0=x()
task.spawn(function()pcall(e.classify,v0)end)end end end,GiftReceived=vU,}for fB,v2 in pairs(v1)do local iw=nM:FindFirstChild(fB)
if iw and iw:IsA("RemoteEvent")then V(iw.OnClientEvent:Connect(v2))elseif fB~="CrateUpdate"and fB~="GiftReceived"then z("remote "..fB.." missing")end
end end local function ix()local bX=bT()if bX then if aI(bX.name)then return{state="match",shown=bX.pretty,src="pad",info=bX}
end return{state="skip",info=bX,level="idle",text=("on pad: %s [%s] - not ticked"):format(bX.pretty,tostring(bX.rar))}
end if W.name and(x()-W.at)<4 then if aI(W.name)then return{state="match",shown=ai(aa(W.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ai(aa(W.name)),tostring(W.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fC(v3,v4,v5,v6)
local fD=RaycastParams.new()fD.FilterType=Enum.RaycastFilterType.Exclude local iy={F.Character}for C7,v7 in ipairs(v6 or{})do iy[#iy+1]=v7 end
fD.FilterDescendantsInstances=iy pcall(function()fD.RespectCanCollide=true end)local nQ=au:Raycast(Vector3 .new(v3,v4+4,v5),Vector3 .new(0,-30,0),fD)
return nQ and nQ.Position or nil end local function cz(nR)local nS=nR:FindFirstChildOfClass("Humanoid")return((nS and nS.HipHeight)or 2)+nR.HumanoidRootPart.Size.Y/2+0.2
end local function iz(v8,v9)local iA=v8:FindFirstChildOfClass("Humanoid")local v_=x()while x()-v_<v9 do if iA and(iA.FloorMaterial~=Enum.Material.Air or iA.SeatPart)then return true end
ae(0.05)end return false end local function aC(wa,iB,iC)local nT=wa.HumanoidRootPart nT.AssemblyLinearVelocity=Vector3 .new(0,0,0)
nT.CFrame=iC and CFrame.new(iB,Vector3 .new(iC.X,iB.Y,iC.Z))or CFrame.new(iB)end local function bY(ba,nU)local bZ=ao()
if not bZ or not ba then return false end local bs=ba.Position local fE=math.clamp(math.max(ba.Size.X,ba.Size.Z)/2+2.2,3,7)
local nV=(nU and nU.MaxActivationDistance)or 10 if fE>nV-2 then fE=math.max(2.5,nV-2)end local dv={}local function b0(dw)
dw=Vector3 .new(dw.X,0,dw.Z)if dw.Magnitude>0.05 then dv[#dv+1]=dw.Unit end end local nW=mB()if nW then b0(nW-bs)end
b0(ba.CFrame.LookVector)b0(-ba.CFrame.LookVector)b0(ba.CFrame.RightVector)b0(-ba.CFrame.RightVector)b0(bZ.HumanoidRootPart.Position-bs)
if#dv==0 then b0(Vector3 .new(0,0,1))end local wb,fF=cz(bZ),false for C8,wc in ipairs(dv)do local fG=bs+wc*fE
local iD=fC(fG.X,bs.Y,fG.Z,{ba})if iD and math.abs(iD.Y-bs.Y)<14 then aC(bZ,Vector3 .new(fG.X,iD.Y+wb,fG.Z),bs)
if iz(bZ,0.7)then fF=true break end end end if not fF then aC(bZ,bs+dv[1]*fE+Vector3 .new(0,3,0),bs)fF=iz(bZ,1)
end ae(0.12)return fF end local function nX(dx)if not dx.Parent or not dx.Enabled then return false end pcall(function()dx:InputHoldBegin()end)
ae(math.max(dx.HoldDuration,0)+0.08)pcall(function()dx:InputHoldEnd()end)return true end local function ap(nY,wd)
local we=x()while x()-we<wd do if nY()then return true end ae(0.05)end return nY()end local function dy(cA,wf,nZ,wg)
local wh=c.zapFirst and{"zap","hold"}or{"hold","zap"}for wi,iE in ipairs(wh)do if wi==2 and(wg or not(cA.Parent and cA.Enabled and(not nZ or nZ())))then break end
local iF if iE=="hold"then iF=nX(cA)else iF=type(fireproximityprompt)=="function"and cA.Parent~=nil and cA.Enabled and pcall(fireproximityprompt,cA)end
if iF and ap(wf,1.2)then c.zapFirst=(iE=="zap")return true,iE end end return false end local function n0(iG)local bt=mM()
if not bt or not bt.Enabled then z("buy: nothing on the pad")return false end local iH=de(bt)if not iH then z("buy: pad part missing")return false end
c.lastBuyAt=x()local wj,n1=W.seq,a7()local n2=ao()local wk=n2 and(n2 .HumanoidRootPart.Position-iH.Position).Magnitude>12
bY(iH,bt)if wk then ae(0.4)end if not bt.Enabled then z("buy aborted: pad emptied")return false end local cB=ix()
if not iG and cB.state~="match"then z("buy aborted: "..(cB.text or"pad changed"))c.matchSince=nil return false
end local iI=cB.info and cB.info.name or(cB.state=="match"and W.name)or nil local function wl()return bt.Enabled and ac()==nil and(iG or ix().state=="match")
end local wm,wn=dy(bt,function()return ac()~=nil or((not bt.Enabled)and(iG or W.seq==wj))end,wl,du()~=nil)if wm then
ap(function()return ac()~=nil end,0.8)local dz=ac()local n3=a7()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil W.name,W.rar,W.at=nil,nil,x()z(("BOUGHT %s%s via %s"):format(dz and ai(aa(dz))or(cB.shown or"?"),(n1 and n3)and(" for $"..aJ(n1-n3))or"",wn))
if dz and iI and aa(dz)~=aa(iI)then z(("note: picked up %s, not %s"):format(dz,iI))end return true end local fH=bT()
if du()then c.cashFails=c.cashFails+1 c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)z(("BUY REFUSED: cash short - have $%s, price %s"):format(aJ(a7()),(fH and fH.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=x()+(c.buyMiss<=3 and 1 or 6)z(("buy did not go through (%s, try %d) - again in %ds"):format(fH and fH.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function n4()local dA=ac()if not dA then c.holding=false z("place: hands are empty")
return false end if not aI(dA)then z(("REFUSED TO WAX %s - it is not ticked"):format(ai(aa(dA))))return false
end for C9=1,d.PlaceTries do local bu=ut()if not bu then z("place: no free station")break end local n5=de(bu)
if n5 then bY(n5,bu)local n6=ac()if not n6 then c.holding=false z("place: hands emptied on the way")return false end
if not aI(n6)then z("place: what I carry changed, not waxing it")return false end if bu.Enabled then local wo,wp=dy(bu,function()return not bu.Enabled end,function()return bu.Enabled end)
if wo then c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 W.name,W.rar,W.at=nil,nil,x()
z(("WAXED %s #%d at %s via %s"):format(ai(aa(dA)),c.placed,bu.Parent.Parent.Name,wp))if q.placed then pcall(q.placed,dA)end
return true end end end ae(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end z("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))z(c.capMsg)end return false end function y.place()local wq=x()while c.alive and y.editing and x()-wq<25 do ae(0.2)end
if d.Teams and d.TeamWax~=""then y.placing=true local wr=x()while c.alive and y.current()~=d.TeamWax and x()-wr<5 do ae(0.1)end
if y.current()==d.TeamWax then ae(0.3)else z("wax team did not come on in time - placing anyway")end end local ws,n7=pcall(n4)
y.placing=false if not ws then error(n7,0)end return n7 end local function n8(n9)return type(n9)=="string"and n9:lower():find("crate",1,true)~=nil
end local wt={SABFarmGui=1,SABToggle=1,SABError=1}local function iJ(wu)local bv=wu while bv do if wt[bv.Name]then return false end
if bv:IsA("ScreenGui")then local wv,ww=pcall(function()return bv.Enabled end)return(not wv)or ww~=false end if bv:IsA("GuiObject")and not bv.Visible then return false end
bv=bv.Parent end return false end local function fI(fJ)local cC=""pcall(function()if fJ:IsA("TextButton")then cC=fJ.Text end end)
if not cC:find("%a")then for C_,fK in ipairs(fJ:GetDescendants())do if(fK:IsA("TextLabel")or fK:IsA("TextButton"))and fK.Text:find("%a")then cC=fK.Text break end
end end if not cC:find("%a")then cC=fJ.Name end return(cC:lower():gsub("[^%a]",""))end local function wx()local dB,dC
local n_=F:FindFirstChildOfClass("PlayerGui")if not n_ then return nil,nil end for Da,dD in ipairs(n_:GetDescendants())do
if dD:IsA("GuiButton")and iJ(dD)then local iK=fI(dD)if iK:sub(1,4)=="open"and not iK:find("shop",1,true)then dB=dB or dD end
if iK:sub(1,7)=="discard"then dC=dC or dD end end end if dB and dC then return dB,dC end if e.on then return dB,dC end
return nil,nil end local iL=(function()local wy,wz=pcall(function()return game:GetService("VirtualInputManager")end)return wy and wz or nil end)()
local function oa(bc,iM)local iN={}local function ob(wA)iN[#iN+1]=wA end if c.tapWay then ob(c.tapWay)end for Db,oc in ipairs({"touch","conn","signal"})do
if oc~=c.tapWay then ob(oc)end end local function od(wB,...)local wC,iO=pcall(getconnections,wB)if not(wC and type(iO)=="table"and#iO>0)then return false end
local oe,wD,wE=false,{...},select("#",...)for Dc,wF in ipairs(iO)do if pcall(function()wF:Fire(table.unpack(wD,1,wE))end)then oe=true end
end return oe end local function of()local og=Vector3 .new(0,0,0)pcall(function()local oh,oi=bc.AbsolutePosition,bc.AbsoluteSize
og=Vector3 .new(oh.X+oi.X/2,oh.Y+oi.Y/2,0)end)local iP={Position=og,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()iP.UserInputType=Enum.UserInputType.Touch end)pcall(function()iP.UserInputState=Enum.UserInputState.End end)
return iP end for Dd,bd in ipairs(iN)do local dE=false if bd=="conn"and type(getconnections)=="function"then if od(bc.MouseButton1Click)then
dE=true if ap(iM,1.5)then c.tapWay=bd return true,bd end end dE=od(bc.Activated,of(),1)elseif bd=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bc.MouseButton1Click)then if ap(iM,1.5)then c.tapWay=bd return true,bd end end dE=pcall(firesignal,bc.Activated,of(),1)
elseif bd=="touch"and iL then dE=pcall(function()local oj,ol=bc.AbsolutePosition,bc.AbsoluteSize local om=0 local oo=bc:FindFirstAncestorWhichIsA("ScreenGui")
local wG,wH=pcall(function()return oo and oo.IgnoreGuiInset end)if not(wG and wH)then pcall(function()om=game:GetService("GuiService"):GetGuiInset().Y end)
end local op,oq=oj.X+ol.X/2,oj.Y+ol.Y/2+om iL:SendMouseButtonEvent(op,oq,0,true,game,1)task.wait(0.06)iL:SendMouseButtonEvent(op,oq,0,false,game,1)
end)end if dE and ap(iM,1.5)then c.tapWay=bd return true,bd end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function iQ(ot)local dF=ot.Parent while dF and dF~=c.plot do if e.NOT[dF.Name]then return false end dF=dF.Parent
end local iR=(ot.ActionText or""):lower()if iR:find("roll",1,true)or iR:find("place",1,true)or iR:find("sell",1,true)then return false end
return true end local function ou()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local ov=c.plot:FindFirstChild("CrateStand")local dG if ov then for De,fL in ipairs(ov:GetDescendants())do
if fL:IsA("ProximityPrompt")and fL.Enabled and iQ(fL)then dG=fL break end end end if not dG then for Df,bw in ipairs(c.plot:GetDescendants())do
if bw:IsA("ProximityPrompt")and bw.Enabled and iQ(bw)then local ow=bw:FindFirstAncestorWhichIsA("Model")local wI=((bw.ActionText or"").." "..(bw.ObjectText or"").." "..bw.Name.." "..(ow and ow.Name or"")):lower()
if wI:find("crate",1,true)then dG=bw break end end end end e.prompt=dG return dG end local function iS()if e.on then return true end
local dH=ou()if not dH then e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local ox=de(dH)if ox then bY(ox,dH)end e.ours=true dy(dH,function()return e.on end)if ap(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: pressed "..eZ(dH).." but no window came up")
return false end do local function wJ(oy)local cD=oy.Parent while cD and cD:IsA("GuiObject")do local oz,oA=false,false
for Dg,dI in ipairs(cD:GetDescendants())do if dI~=oy and dI:IsA("GuiButton")and fI(dI):sub(1,7)=="discard"then oz=true end
if dI:IsA("TextLabel")then local iT=dI.Text:lower()if iT:find("crate",1,true)or iT:find("can contain",1,true)or iT:find("cost",1,true)then oA=true end
end if oz and oA then return cD end end cD=cD.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local oB=F:FindFirstChildOfClass("PlayerGui")if not oB then return nil end for Dh,fM in ipairs(oB:GetDescendants())do
if fM:IsA("GuiButton")and not fM:FindFirstAncestor("SABFarmGui")and fI(fM):sub(1,4)=="open"then local iU=wJ(fM)
if iU then e.win=iU return iU end end end end local function wK(wL)for Di,fN in ipairs(wL:GetDescendants())do
if fN:IsA("GuiButton")then local oC,iV=fI(fN),fN.Name:lower()if oC=="x"or oC=="close"or iV=="x"or iV:find("close",1,true)or iV:find("exit",1,true)then return fN end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(wM)task.wait(wM and 4 or 1.2)if e.on or e.waiting then return end
local fO=e.findWin()if not fO or not iJ(fO)then return end local oD=wK(fO)if oD and oa(oD,function()return not iJ(fO)end)then return end
z("the crate window is still open - tap its X")end end local function dJ(fP)if not iS()then return false end local oE=x()-(e.openedAt or 0)
if oE<0.6 then ae(0.6-oE)end local iW=e.title local wN,wO=wx()local oF=fP and wN or wO if not oF then e.lastFail=x()
c.crateFails=c.crateFails+1 z(("crate: no %s button found in %s"):format(fP and"Open"or"Discard",iW))return false
end local wP=ac()local wQ,Dj=oa(oF,function()return(not e.on)or(ac()~=nil and ac()~=wP)end)if not wQ then e.lastFail=x()
c.crateFails=c.crateFails+1 z("crate: could not press "..(fP and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fP then c.crates=c.crates+1 ap(function()return ac()~=nil end,1.5)local oG=ac()
z(("OPENED %s -> %s"):format(iW,oG and ai(aa(oG))or"?"))else z("discarded "..iW.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(wR,...)local wS=select("#",...)e.calls[#e.calls+1]={t=x(),m=wR,n=wS,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aD,be)local bx=type(aD)if(bx=="string"or bx=="number")and type(be.data)=="table"then for oH,iX in pairs(be.data)do
if iX==aD and type(oH)=="string"and(type(iX)=="string"or type(iX)=="number")then return{__slot="f:"..oH}end end
end if bx=="string"then if be.crate and aD==be.crate then return{__slot="crate"}end if be.title and aD==be.title then return{__slot="title"}end
if be.rar and aD==be.rar then return{__slot="rarity"}end return aD end if bx=="number"or bx=="boolean"or bx=="nil"then return aD end
if bx=="table"then local oI={}for wT,oJ in pairs(aD)do if type(oJ)=="table"then return nil,"nested table"end local wU,oK=e.slot(oJ,be)
if oK then return nil,oK end oI[wT]=wU end return oI end local wV,wW=pcall(function()return aD:IsA("Instance")end)
if wV and wW then if aD==F then return{__slot="player"}end if c.plot and aD==c.plot then return{__slot="plot"}end
local fQ=c.plot and c.plot:FindFirstChild("CrateStand")if fQ and aD==fQ then return{__slot="stand"}end if fQ and aD.Parent==fQ then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bx..")"end function e.resolve(fR)if type(fR)~="table"then return fR end
local aP=fR.__slot if aP and aP:sub(1,2)=="f:"then return e.data and e.data[aP:sub(3)]end if aP=="crate"then return e.data and e.data.name end
if aP=="title"then return(e.data and e.data.title)or e.title end if aP=="rarity"then return e.data and e.data.rarity end
if aP=="player"then return F end if aP=="plot"then return c.plot end if aP=="stand"or aP=="model"then local iY=c.plot and c.plot:FindFirstChild("CrateStand")
if aP=="stand"or not iY then return iY end for Dk,oL in ipairs(iY:GetChildren())do if n8(oL.Name)then return oL end end
return nil end local oM={}for wX,wY in pairs(fR)do oM[wX]=e.resolve(wY)end return oM end function e.classify(iZ)
if e.directOff then return end local fS={}for Dl,i0 in ipairs(e.calls)do if i0 .t<=iZ+0.05 and iZ-i0 .t<=6 then fS[#fS+1]=i0 end
end if#fS==0 then return end if not ap(function()return(e.heldAt or 0)>=iZ-1 end,2.5)then return end local dK={}
for Dm,dL in ipairs(fS)do local oN={}for oO=1,dL.n do local wZ,oP=e.slot(dL.args[oO],dL)if oP then z("crate call has "..oP.." - keeping the button method")
return end oN[oO]=wZ end dK[#dK+1]={m=dL.m,n=dL.n,args=oN}end local i1=e.learned e.learned={seq=dK,mode=i1 and i1 .mode or nil}
ah.dirty=true if not i1 then z(("learned how to open crates directly (%d call%s)"):format(#dK,#dK==1 and""or"s"))end
end function e.replay()local oQ=e.learned local oR=ag:FindFirstChild("Remotes")local i2=oR and oR:FindFirstChild("CrateAction")
if not(oQ and i2)then return false end local oS=table.unpack or unpack e.replaying=true for Dn,dM in ipairs(oQ.seq)do
local i3={}for oT=1,dM.n do i3[oT]=e.resolve(dM.args[oT])end task.spawn(function()pcall(function()if dM.m=="InvokeServer"then i2:InvokeServer(oS(i3,1,dM.n))
else i2:FireServer(oS(i3,1,dM.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(w0)return(w0:gsub("[%%|;=,\n]",function(w1)return("%%%02X"):format(w1:byte())end))end
function e.enc(b1)local fT=type(b1)if fT=="string"then return"s"..e.esc(b1)end if fT=="number"then return"n"..tostring(b1)end
if fT=="boolean"then return b1 and"b1"or"b0"end if fT=="nil"then return"z"end if b1 .__slot then return"k"..b1 .__slot end
local i4={}for w2,w3 in pairs(b1)do i4[#i4+1]=e.enc(w2).."="..e.enc(w3)end return"t"..table.concat(i4,",")end
function e.dec(oU)local dN,dO=oU:sub(1,1),oU:sub(2)local function w4(w5)return(w5:gsub("%%(%x%x)",function(w6)return string.char(tonumber(w6,16))end))end
if dN=="s"then return w4(dO)end if dN=="n"then return tonumber(dO)end if dN=="b"then return dO=="1"end if dN=="k"then return{__slot=dO}end
if dN=="t"then local oV={}for w7 in dO:gmatch("[^,]+")do local oW,w8=w7:match("^(.-)=(.*)$")if oW then local oX=e.dec(oW)
if oX~=nil then oV[oX]=e.dec(w8)end end end return oV end return nil end function e.goneOrNew(w9)return function()
if not e.waiting then return true end local oY=ac()return oY~=nil and oY~=w9 end end function e.near()local oZ=ag:FindFirstChild("Remotes")
local i5=oZ and oZ:FindFirstChild("CrateAction")local fU=ao()local i6=c.plot and c.plot:FindFirstChild("CrateStand")
local i7=i6 and i6:FindFirstChild("Spot")if not(i5 and fU and i7)then z(("crate: cannot open %s right now (%s)"):format(tostring(e.title),
not i5 and"no CrateAction remote"or not fU and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local i8=fU.HumanoidRootPart local fV=i8 .CFrame local o0,i9=e.title,"no answer"local w_=ac()local o1=i6:FindFirstChild("Holder")
local function o2()if not o1 then return e.waiting or e.on end for Do,xa in ipairs(o1:GetChildren())do if xa:IsA("Model")then return true end end
return false end for xb=1,3 do if not(e.waiting or e.on)or not o2()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(i8 .Position-i7 .Position).Magnitude>8 then bY(i7,e.prompt)end ae(0.12+0.15*xb)
local a0={}e.replaying=true task.spawn(function()a0 .ok,a0 .v=pcall(function()return i5:InvokeServer("open")end)
a0 .done=true end)ap(function()return a0 .done end,6)e.replaying=false local b2=a0 .v if a0 .done and a0 .ok and type(b2)=="table"and b2 .ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 z(("OPENED %s -> %s (no window)"):format(o0,b2 .prize and ai(aa(tostring(b2 .prize)))or"?"))
ap(function()local o3=ac()return o3~=nil and o3~=w_ end,1.5)if(i8 .Position-fV.Position).Magnitude>8 then pcall(function()aC(fU,fV.Position,fV.Position+fV.LookVector)end)end
return true,"opened"end i9=(a0 .done and a0 .ok and type(b2)=="table")and tostring(b2 .reason or"refused, no reason given")
or(a0 .done and("error: "..tostring(b2))or"no answer in 6s")ae(0.3)if not o2()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 z(("crate: the server would not open %s next to the stand (%s)"):format(o0,i9))
return false,i9 end e.GIVEUP=600 function e.drop()local o4=ag:FindFirstChild("Remotes")local o5=o4 and o4:FindFirstChild("CrateAction")
local o6=c.plot and c.plot:FindFirstChild("CrateStand")local i_=o6 and o6:FindFirstChild("Spot")local o7=ao()
if i_ and o7 and(o7 .HumanoidRootPart.Position-i_.Position).Magnitude>8 then bY(i_,e.prompt)ae(0.3)end local ja,bf=false,nil
if o5 then ja,bf=pcall(function()return o5:InvokeServer("discard")end)end z(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(e.title),math.floor(e.GIVEUP/60),(ja and type(bf)=="table"and bf.ok)and"done"or("answer: "..tostring(type(bf)=="table"and(bf.reason or bf.ok)or bf))))
e.waiting,e.on,e.quietUntil=false,false,x()+4 e.summonFails,e.nearFails,e.lastFail,e.at,e.prompt=0,0,0,nil,nil
if not(ja and type(bf)=="table"and bf.ok)then dJ(false)end end function e.smart()local jb=e.title if(e.nearFails or 0)<3 then
local xc=e.near()if xc then return true end if e.nearFails>=3 then z("opening next to the stand failed 3 times - trying the older ways")end
end local b3=e.learned if b3 then local jc=ac()if e.on then e.replay()if ap(e.goneOrNew(jc),3.5)then c.crates=c.crates+1
z("OPENED "..jb.." (direct)")return true end else if b3 .mode~="window"then e.replay()if ap(e.goneOrNew(jc),3.5)then
c.crates,e.fails=c.crates+1,0 if b3 .mode~="direct"then b3 .mode,ah.dirty="direct",true z("crates now open directly - the window never comes up")
end z("OPENED "..jb.." (direct, no window)")return true end end if iS()then e.replay()if ap(e.goneOrNew(jc),3.5)then
c.crates,e.fails=c.crates+1,0 if b3 .mode~="window"then b3 .mode,ah.dirty="window",true z("crates need their window up first - it shows briefly")
end z("OPENED "..jb.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ah.dirty=b3,nil,true
if e.fails>=3 then e.directOff=true z("direct crate opening failed 3 times - using the button for now")else z("the learned crate call did not work - back to pressing Open")
end end return dJ(true)end function C.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end C.cache={}function C.watchCache()C.cache=C.snap()
for xd,o8 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(F:GetAttributeChangedSignal(o8):Connect(function()C.cache[xd]=F:GetAttribute(o8)end))
end end function C.isOn()return F:GetAttribute("AutoRollOn")==true end function C.saw(xe,...)local fW=C.cache
local xf={m=xe,n=select("#",...),args={...},before={rules=fW.rules,stop=fW.stop,on=fW.on,main=fW.main}}task.delay(1.5,function()
if c.alive then pcall(C.learnOne,xf)end end)end function C.learnOne(dP)local ax,dQ=C.snap(),dP.before local fX=(ax.rules~=dQ.rules)or(ax.stop~=dQ.stop)
local o9=(ax.on~=dQ.on)or(ax.main~=dQ.main)if not fX and not o9 then return end local o_={}for pa=1,dP.n do local aK=dP.args[pa]
local b4=type(aK)if b4=="string"and aK~=""and aK==ax.rules then aK={__slot="rules"}elseif b4=="string"and aK~=""and fX and aK==ax.stop and ax.stop~=dQ.stop then aK={__slot="stop"}
elseif b4=="table"then local pb={}for xg,cE in pairs(aK)do if type(cE)=="table"or(type(cE)=="userdata")then C.msg="Auto Roll sends something I cannot repeat"return
end pb[xg]=(type(cE)=="string"and cE~=""and cE==ax.rules)and{__slot="rules"}or cE end aK=pb elseif b4~="string"and b4~="number"and b4~="boolean"and b4~="nil"then
if aK==F then aK={__slot="player"}else C.msg="Auto Roll sends something I cannot repeat"return end end o_[pa]=aK
end local cF={m=dP.m,n=dP.n,args=o_}if fX then local jd=false for xh=1,cF.n do local dR=cF.args[xh]if type(dR)=="table"and dR.__slot=="rules"then jd=true end
if type(dR)=="table"and not dR.__slot then for Dp,pc in pairs(dR)do if type(pc)=="table"and pc.__slot=="rules"then jd=true end end
end end if jd then C.rec.rules={cF}else table.insert(C.rec.rules,cF)if#C.rec.rules>60 then table.remove(C.rec.rules,1)end
end end if o9 then if ax.on==true then C.rec.on=cF else C.rec.off=cF end d.AutoRoll=(ax.on==true)end if ax.rules and ax.rules~=""then d.ARrules,d.ARstop=ax.rules,ax.stop or""end
ah.dirty=true C.msg=""z(("learned an Auto Roll %s message"):format(fX and"choices"or(ax.on and"on"or"off")))end
function C.resolve(cG)if type(cG)~="table"then return cG end if cG.__slot=="rules"then return d.ARrules~=""and d.ARrules or F:GetAttribute("AutoRollRules")end
if cG.__slot=="stop"then return d.ARstop~=""and d.ARstop or F:GetAttribute("AutoRollStop")end if cG.__slot=="player"then return F end
local pd={}for xi,xj in pairs(cG)do pd[xi]=C.resolve(xj)end return pd end function C.replay(pe,xk)local pf=table.unpack or unpack
for Dq,dS in ipairs(xk)do local je={}for pg=1,dS.n do je[pg]=C.resolve(dS.args[pg])end C.replaying=true pcall(function()
if dS.m=="InvokeServer"then task.spawn(function()pcall(function()pe:InvokeServer(pf(je,1,dS.n))end)end)else pe:FireServer(pf(je,1,dS.n))end
end)C.replaying=false task.wait(0.25)end end function C.apply(ph,xl)if C.busy or not c.alive then return end C.busy=true
pcall(function()local pj=ag:FindFirstChild("Remotes")local jf=pj and pj:FindFirstChild("AutoRollAction")if not jf then C.msg="this game has no AutoRollAction"return end
local by=d.AutoRoll if by and d.ARrules~=""and F:GetAttribute("AutoRollRules")~=d.ARrules then if#C.rec.rules==0 then
C.msg="pick your Auto Roll choices once in the game's menu so I can learn them"z(C.msg)else C.replay(jf,C.rec.rules)
if ap(function()return F:GetAttribute("AutoRollRules")==d.ARrules end,4)then z("Auto Roll choices put back")else
C.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"z(C.msg)end end end if by==C.isOn()or(not by and not xl)then return end
local fY=by and C.rec.on or C.rec.off if not fY then local dT=by and C.rec.off or C.rec.on local pk=dT~=nil for xm=1,dT and dT.n or 0 do
if type(dT.args[xm])=="boolean"then pk=false end end if pk then fY=dT end end if not fY then C.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(by and"on"or"off")
z(C.msg)return end C.replay(jf,{fY})if ap(function()return C.isOn()==by end,4)then C.msg=""z(("Auto Roll switched %s%s"):format(by and"ON"or"OFF",ph and(" ("..ph..")")or""))
else C.msg="Auto Roll did not switch - do it once in the game so I can relearn it"z(C.msg)end end)C.busy=false
end l.HS=game:GetService("HttpService")l.uid=(function()local xn,xo=pcall(function()return F.UserId end)return xn and xo or 0 end)()
l.buyMsg,l.wishMsg,l.wishN="","",0 function l.info()if l.I then return l.I end local xp,jg=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if xp and type(jg)=="table"and type(jg.Pets)=="table"then l.I=jg end return l.I end function l.order()if l.list then return l.list end
local bz=l.info()if not bz then return{}end local b5={}if type(bz.Order)=="table"and#bz.Order>0 then for Dr,pl in ipairs(bz.Order)do if bz.Pets[pl]then b5[#b5+1]=pl end end
else for xq in pairs(bz.Pets)do b5[#b5+1]=xq end table.sort(b5,function(xr,xs)return(bz.Pets[xr].price or 0)<(bz.Pets[xs].price or 0)end)
end l.list=b5 return b5 end function l.nice(pm,jh)local pn=l.info()local po=pn and pn.Pets[pm]return((jh and jh~="")and(jh.." ")or"")..(po and po.displayName or tostring(pm))
end function l.data()local fZ=F:GetAttribute("PetsData")if type(fZ)~="string"then return nil end if fZ==l.rawD then return l.lastD end
local xt,dU=pcall(function()return l.HS:JSONDecode(fZ)end)dU=(xt and type(dU)=="table")and dU or nil l.rawD,l.lastD=fZ,dU
return dU end function l.pen()return ag:FindFirstChild("PetMeadowSpawns")end function l.srv()return au:GetServerTimeNow()end
function l.money()local ji=F:FindFirstChild("MoneyValue")if ji and type(ji.Value)=="number"then return ji.Value end
return a7()or 0 end function l.wishes()local pp=l.pen()local pq=pp and pp:GetAttribute("Wishes")local jj,ps={},l.srv()
if type(pq)~="string"then return jj end local xu,pt=pcall(function()return l.HS:JSONDecode(pq)end)if xu and type(pt)=="table"then
for xv,jk in pairs(pt)do if type(jk)=="number"and jk>ps then jj[xv]=jk-ps end end end return jj end function l.call(...)
local pu=ag:FindFirstChild("Remotes")local pv=pu and pu:FindFirstChild("PetRequest")if not pv then return nil end
local pw=table.pack(...)local b6={}task.spawn(function()b6 .ok,b6 .v=pcall(function()return pv:InvokeServer(table.unpack(pw,1,pw.n))end)
b6 .done=true end)local xw=x()while not b6 .done and x()-xw<6 do task.wait(0.05)end if b6 .done and b6 .ok then return b6 .v end
return nil end function l.want(xx)return d.Pets[xx]end function l.closeNaming(jl)local py=pcall(function()local px=F:FindFirstChild("PlayerScripts")
local xy=px and px:FindFirstChild("Naming",true)require(xy).close()end)ae(0.5)if jl.Visible then pcall(function()local pz=jl:FindFirstChild("NameBox",true)if pz then pz:ReleaseFocus()end end)
jl.Visible=false py=false end return py end function l.skipNaming()l.namingUntil=x()+10 if l.namingOn then return end
l.namingOn=true task.spawn(function()while c.alive and x()<l.namingUntil do local pA=F:FindFirstChildOfClass("PlayerGui")
local pB=pA and pA:FindFirstChild("MainGui")local f0=pB and pB:FindFirstChild("PetNameGui")if f0 and f0 .Visible then
ae(0.4)if f0 .Visible then l.namingShut=(l.namingShut or 0)+1 pcall(l.closeNaming,f0)break end end ae(0.25)end
l.namingOn=false end)end function l.buyTick()if not d.PetBuy then l.buyMsg="auto adopt is off"return end local jm,pC,f1=l.info(),l.pen(),l.data()
if not(jm and pC and f1)then l.buyMsg="pet data not loaded yet"return end l.tryAt=l.tryAt or{}local dV,jn=#(f1 .pets or{}),tonumber(f1 .maxOwned)or 60
local xz,pD,dW=l.srv(),{},nil for Ds,aQ in ipairs(pC:GetChildren())do pD[aQ.Name]=true local b7,f2=aQ:GetAttribute("Pet"),aQ:GetAttribute("Variant")or""
local jo=b7 and l.want(b7)if jo and jo.b and jm.Pets[b7]and(not jo.g or f2=="Big")and A.wantMore(b7,f2,f1)and not aQ:GetAttribute("A_"..l.uid)
and(tonumber(aQ:GetAttribute("ExpiresAt"))or 0)>xz+1 and x()>=(l.tryAt[aQ.Name]or 0)then local dX,pE=l.nice(b7,f2),jm.Pets[b7].price or 0
if dV>=jn then dW=("%s is in the pen, but you have %d/%d pets"):format(dX,dV,jn)l.tryAt[aQ.Name]=x()+15 elseif l.money()<pE then
dW=("%s is in the pen - need $%s"):format(dX,aJ(pE))l.tryAt[aQ.Name]=x()+5 else l.tryAt[aQ.Name]=x()+8 local bA=l.call("adopt",aQ.Name)
if type(bA)=="table"and bA.ok then dV=dV+1 l.buys=(l.buys or 0)+1 l.recent=l.recent or{}local xA=type(bA.pet)=="table"and bA.pet or{}
table.insert(l.recent,{id=tostring(xA.id or("?"..x())),name=b7,variant=f2,at=x()})if#l.recent>30 then table.remove(l.recent,1)end
z("ADOPTED "..dX)l.skipNaming()dW="adopted "..dX else local pF=type(bA)=="table"and tostring(bA.reason or"no reason given")or"no answer"
z(("adopt %s failed: %s"):format(dX,pF))dW="adopt failed: "..pF if type(bA)=="table"and bA.bagFull then l.tryAt[aQ.Name]=x()+60 end
end end end end for pG in pairs(l.tryAt)do if not pD[pG]then l.tryAt[pG]=nil end end l.buyMsg=dW or("watching the pen (%d/%d pets)"):format(dV,jn)
end function l.wishTick()if not d.PetWish then l.wishMsg="auto wish is off"return end local f3=l.info()if not(f3 and l.pen())then l.wishMsg="pet data not loaded yet"return end
l.wishTry,l.wishWhy=l.wishTry or{},l.wishWhy or{}local f4,jp,bB=l.wishes(),0,nil local xC=(type(f3 .Wish)=="table"and f3 .Wish.cashShare)or 2
local xD=l.data()for Dt,az in ipairs(l.order())do local pH=l.want(az)if pH and pH.w and A.wantMore(az,"",xD)then
jp=jp+1 if not f4[az]and x()>=(l.wishTry[az]or 0)then local jq=tonumber(F:GetAttribute("PetWishCredits"))or 0
local jr=math.floor((f3 .Pets[az].price or 0)*xC)if jq<=0 and l.money()<jr then l.wishTry[az]=x()+10 bB=("need $%s to wish for %s"):format(aJ(jr),l.nice(az))
l.wishWhy[az]=bB else l.wishTry[az]=x()+3 local xE=jq>0 and"wishCredit"or"wish"local f5=l.call(xE,az)if type(f5)=="table"and f5 .ok then
l.wishN,l.wishWhy[az]=l.wishN+1,nil z(("WISHED for %s (%s)"):format(l.nice(az),jq>0 and"free wish"or("$"..aJ(jr))))
else local js=type(f5)=="table"and tostring(f5 .reason or"no reason given")or"no answer"if js:lower():find("already",1,true)then l.wishTry[az]=x()+2
else z(("wish %s failed: %s"):format(l.nice(az),js))bB="wish failed: "..js end end end end end end if not bB then
for Du,f6 in ipairs(l.order())do local pI=l.want(f6)if pI and pI.w and not f4[f6]and l.wishWhy[f6]then bB=l.wishWhy[f6]break end
end end if not bB then local f7={}for Dv,f8 in ipairs(l.order())do local pJ=l.want(f8)if pJ and pJ.w and f4[f8]then f7[#f7+1]=("%s %dm"):format(l.nice(f8),math.ceil(f4[f8]/60))end
end bB=jp==0 and"no pet has WISH ticked"or("running: "..(#f7>0 and table.concat(f7,", ")or"none yet"))end l.wishMsg=bB
end y.switches,y.glazed,y.finished=0,0,0 y.done,y.doneN,y.later={},0,{}function y.teams()local jt=l.data()return(jt and jt.teams)or{},jt
end function y.current(cH)cH=cH or l.data()if not cH then return""end local pK={}for Dw,xF in ipairs(cH.equipped or{})do pK[tostring(xF)]=true end
for Dx,pL in ipairs(cH.teams or{})do local pM=pL.pets or{}local ju=#pM==#(cH.equipped or{})if ju then for Dy,xG in ipairs(pM)do if not pK[tostring(xG)]then ju=false break end end end
if ju then return pL.name end end return""end function y.equip(jv)local xH,xI=y.teams()local jw for xJ,xK in ipairs(xH)do if xK.name==jv then jw=xJ break end end
if not jw then y.msg="no saved team called "..tostring(jv)return false end if y.current(xI)==jv then return true end
for Dz=1,4 do local pN=l.call("teamEquip",jw)if type(pN)=="table"and pN.ok then y.switches=y.switches+1 return true
end task.wait(0.4)end return false end function y.left(xL)local pO=xL:FindFirstChild("SquishyPlaceHolder")local pP=pO and pO:FindFirstChild("TimerGui")
local pQ=pP and pP:FindFirstChildWhichIsA("TextLabel",true)local jx=pQ and pQ.Text if type(jx)~="string"or jx:find("-",1,true)then return nil end
local jy,pR,pS=jx:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not jy then return nil end local pT=pS~=""and(tonumber(jy)*3600+tonumber(pR)*60+tonumber(pS))or(tonumber(jy)*60+tonumber(pR))
return pT>0 and pT or nil end function y.waxes()local dY={}local pU=c.plot and c.plot:FindFirstChild("WaxStations")
if not pU then return dY end local pV=l.srv()for DA,a1 in ipairs(pU:GetChildren())do local jz=tonumber(a1:GetAttribute("PourEnd"))
local pW=a1:GetAttribute("PourOwner")if a1:GetAttribute("HasSquishy")and a1:GetAttribute("PourId")and(pW==nil or pW==l.uid)then
local jA=y.left(a1)local pX=jA and(pV+jA)or((jz and jz>pV)and jz or nil)if pX then local pY,pZ=a1:FindFirstChild("SquishyPlaceHolder"),"?"
if pY then for DB,p0 in ipairs(pY:GetChildren())do if p0:IsA("Model")then pZ=p0 .Name break end end end local xM=tostring(a1:GetAttribute("Helpers")or"")
local jB=0 for DC in xM:gmatch("%d+")do jB=jB+1 end dY[#dY+1]={st=a1,ends=pX,sure=jA~=nil,id=a1:GetAttribute("PourId"),name=pZ,helps=jB,
long=a1:GetAttribute("PourLong")==true}end end end table.sort(dY,function(xN,xO)return xN.ends<xO.ends end)return dY
end function y.glazeCount()local p1=ag:FindFirstChild("Remotes")local p2=p1 and p1:FindFirstChild("EditStack")
if not p2 then return nil end local xP,dZ=pcall(function()return p2:InvokeServer("State",nil)end)if not(xP and type(dZ)=="table"and type(dZ.state)=="table")then return nil end
local jC,jD=0,{}for DD,f9 in ipairs(dZ.state.entries or{})do if f9 .glaze and f9 .glaze~=""then jC=jC+1 jD[f9 .glaze]=(jD[f9 .glaze]or 0)+1 end
end return jC,jD,#(dZ.state.entries or{}),dZ.state.capacity end function y.finishedOne(f_,p3)y.finished=y.finished+1
task.wait(2)local jE,xQ,p4,xR=y.glazeCount()if jE and p3 and jE>p3 then y.glazed=y.glazed+1 local jF={}for xS,xT in pairs(xQ)do jF[#jF+1]=xS.." "..xT end
z(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ai(aa(f_.name)),f_.st.Name,jE,table.concat(jF,", ")))
else z(("wax done on station %s: %s, no glaze%s"):format(f_.st.Name,ai(aa(f_.name)),p4 and(" (stack "..p4 .."/"..tostring(xR)..")")or""))
end end function y.tick()y.list=y.waxes()if y.editing and x()-(y.editingSince or x())>120 then y.editing=false end
if y.editing then y.msg="rebuilding teams..."return end if not d.Teams then y.want,y.msg="","auto teams is off"return end
local b8=l.srv()local aE=y.glazeFor if aE then local d0=aE.st local p5=d0 .Parent and d0:GetAttribute("HasSquishy")and d0:GetAttribute("PourId")==aE.id
local p6=p5 and y.left(d0)if p6 then aE.ends=b8+p6 end if not p5 then y.glazeFor,y.afterUntil=nil,x()+1.5 if not y.done[aE.id or"?"]then
y.done[aE.id or"?"],y.doneN=true,y.doneN+1 if y.doneN>400 then y.done,y.doneN={[aE.id or"?"]=true},1 end local xU=aE.before
task.spawn(function()pcall(y.finishedOne,aE,xU)end)end elseif aE.ends-b8>d.GlazeLead*3+60 or b8>aE.ends+90 then
y.glazeFor,y.afterUntil=nil,x()+1.5 y.later[aE.id or"?"]=x()+120 z(("station %s is not finishing yet (%s left) - glaze team off again"):format(d0 .Name,y.clock(aE.ends-b8)))
end end if d.TeamGlaze~=""and not y.glazeFor then local xV=y.speedRatio(d.TeamGlaze)for DE,b9 in ipairs(y.list)do
if b9 .sure and(b9 .ends-b8)*xV[b9 .long and 2 or 1]<=d.GlazeLead and x()>=(y.later[b9 .id or"?"]or 0)and not y.done[b9 .id or"?"]then
y.glazeFor=b9 task.spawn(function()b9 .before=y.glazeCount()end)break end end end local aF,d1="",""local cI=q.snapAt and(q.snapAt-b8)
if cI and cI<-8 then q.snapAt,cI=nil,nil end if d.TeamGlaze~=""and cI and cI<=20 then aF,d1=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cI)))
elseif d.TeamGlaze~=""and(y.glazeFor or x()<(y.afterUntil or 0))then aF,d1=d.TeamGlaze,y.glazeFor and(" - station "..y.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(y.placing or y.aboutToPlace())then aF,d1=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and y.allBusy()then
aF,d1=d.TeamFull," - every station is busy"else aF=d.TeamNormal end y.want=aF local d2=y.current()y.cur=d2 if aF~=""and d2~=aF and x()>=(y.nextTry or 0)then
y.nextTry=x()+1.1 if y.equip(aF)then z("team: "..aF..d1)else y.nextTry=x()+3 end end local jG=y.list[1]y.msg=("on: %s%s | next wax done %s"):format(d2~=""and d2 or"(not a saved team)",(aF~=""and aF~=d2)and(" -> "..aF)or"",
jG and("in "..y.clock(jG.ends-b8).." (st "..jG.st.Name..")")or"- none running")end function y.clock(bC)bC=math.max(0,math.floor(bC))
if bC>=3600 then return("%d:%02d:%02d"):format(math.floor(bC/3600),math.floor((bC%3600)/60),bC%60)end return("%d:%02d"):format(math.floor(bC/60),bC%60)
end function y.allBusy()local xW,xX=e1()return xX>0 and xW==0 end function y.aboutToPlace()if not c.running then return false end
local p7=ac()if not(p7 and aI(p7))then return false end local xY=e1()return xY>0 end function y.mult(p8,xZ,p9)return{(1+p8)*(1+p9),(1+p8+xZ)*(1+p9)}end
function y.speedNow()local function jH(x0)return tonumber(F:GetAttribute(x0))or 0 end return y.mult(jH("PetWaxSpeed"),jH("PetLongWax"),jH("PetSocialWax"))
end function y.speedOf(x1)local x2,p_=y.teams()if not p_ then return nil end for DF,qa in ipairs(x2)do if qa.name==x1 then
local jI={}for DG,x3 in ipairs(qa.pets or{})do for DH,qb in ipairs(p_.pets or{})do if tostring(qb.id)==tostring(x3)then jI[#jI+1]=qb break end end
end local qc=A.caps()local qe,x4=A.stats(jI)return y.mult(math.min(qe.waxSpeed or 0,qc.waxSpeed or 0.25),math.min(qe.longWax or 0,qc.longWax or 0.3),x4 .socialWax or 0)
end end return nil end function y.speedRatio(x5)local qf,jJ=y.speedNow(),y.speedOf(x5)if not jJ then return{1,1}end
return{qf[1]/jJ[1],qf[2]/jJ[2]}end function y.glazeSoon()return d.Teams and d.TeamGlaze~=""and(y.glazeFor~=nil or x()<(y.afterUntil or 0))
end A.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
A.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}A.buildMsg,A.fuseMsg,A.fused,A.builds="","",0,0
function A.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function A.caps()local jK=l.info()return(jK and type(jK.Caps)=="table")and jK.Caps or A.CAPS
end function A.value(qg,jL)local ga=l.info()local cJ=ga and ga.Pets[qg]if not(cJ and type(cJ.boost)=="table")then return nil end
local b_ if type(ga.boostValue)=="function"then local x6,x7=pcall(ga.boostValue,qg,(jL~=""and jL)or nil)b_=x6 and tonumber(x7)or nil
end if not b_ then b_=cJ.boost.value or 0 if jL=="Big"then local qh=b_*1.5 b_=A.ROUND[cJ.boost.kind]and math.max(b_+1,math.floor(qh+0.5))or qh
end end return cJ.boost.kind,b_,cJ.boost.every end function A.stats(x8)local ca,jM={},{}for DI,qi in ipairs(x8)do
local aR,gb,qj=A.value(qi.name,qi.variant or"")if aR then if aR:sub(1,6)=="social"then jM[aR]=math.max(jM[aR]or 0,gb)
elseif aR=="waxStir"or aR=="cashGift"then ca[aR]=(ca[aR]or 0)+gb*60/(qj or 60)elseif aR=="luckyPull"then ca.luckyPull=(ca.luckyPull or 0)+gb/(qj or 10)
else ca[aR]=(ca[aR]or 0)+gb end end end return ca,jM end function A.glazeGain(x9,gc)local d3,jN,DJ={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local x_=d3[1]+d3[2]+d3[3]local ya=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local cK={}for gd=1,3 do cK[gd]=d3[gd]+x9*d3[gd]/x_+(gd==1 and ya or 0)end
local jO={cK[1]*(1-gc),cK[2]*(1-gc)+cK[1]*gc,cK[3]+cK[2]*gc}return jO[1]*(jN[1]-1)+jO[2]*(jN[2]-1)+jO[3]*(jN[3]-1)
end function A.score(ge,yb)local jP=A.caps()local gf,gg=A.stats(yb)local function bh(qk)return math.min(gf[qk]or 0,jP[qk]or math.huge)end
local yc=(1+bh("income"))*(1+(gg.socialIncome or 0))*(1+math.min(gf.cashGift or 0,jP.cashGiftPerMinute or 9)/60)
local yd=1+bh("luck")+(gf.luckyPull or 0)+(gg.socialLuck or 0)local ql=yd*(1+bh("newFind"))*(1+bh("rollSpeed"))
local d4=math.log(yc)local ye=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local jQ=(1+bh("waxSpeed")+bh("longWax"))*(1+(gg.socialWax or 0))
+math.min(gf.waxStir or 0,jP.waxStirPerMinute or 30)/60/ye local yf=1-(1-bh("headStart"))*(1-(gg.socialHeadStart or 0))
if ge=="farm"then return d4+0.7*math.log(ql)+0.1*math.log(jQ)end if ge=="full"then return d4+0.4*math.log(jQ)+0.02*math.log(ql)end
if ge=="glaze"then return A.glazeGain(bh("glaze"),bh("glazeUp"))+0.001*d4 end if ge=="wax"then return-math.log(1-0.5*yf)+0.001*d4+0.001*math.log(jQ)end
return d4 end function A.best(qm,cL,yg,jR)jR=jR or{}local ay,d5={},{}local function qo(yh)local qp={}for yi,yj in ipairs(yh)do qp[yi]=cL[yj]end return qp end
local function jS(qq)local jT=A.score(qm,qo(qq))for DK,yk in ipairs(qq)do if jR[cL[yk].id]then jT=jT+1e-7 end end
return jT end for DL=1,math.min(yg,#cL)do local gh,jU for jV=1,#cL do if not d5[jV]then ay[#ay+1]=jV local qr=jS(ay)
ay[#ay]=nil if not jU or qr>jU+1e-12 then gh,jU=jV,qr end end end if not gh then break end d5[gh]=true ay[#ay+1]=gh
end for DM=1,6 do task.wait()local qs,qt=false,jS(ay)for jW=1,#ay do for jX=1,#cL do if not d5[jX]then local qu=ay[jW]
ay[jW]=jX local qv=jS(ay)if qv>qt+1e-9 then d5[qu],d5[jX],qt,qs=nil,true,qv,true else ay[jW]=qu end end end end
if not qs then break end end local qw={}for yl,ym in ipairs(ay)do qw[yl]=tostring(cL[ym].id)end return qw,A.score(qm,qo(ay))
end function A.count(qx,qy,yn)local d6,d7={},0 local qz,qA={},{}for DN,yo in ipairs(qy.arriving or{})do qz[tostring(yo)]=true end
for DO,cM in ipairs(qy.pets or{})do qA[tostring(cM.id)]=true if cM.name==qx and not qz[tostring(cM.id)]then if cM.variant=="Big"then d7=d7+1 elseif(cM.variant or"")==""then d6[#d6+1]=cM end
end end if not yn then for DP,d8 in ipairs(l.recent or{})do if d8 .name==qx and not qA[d8 .id]and x()-d8 .at<20 then
if d8 .variant=="Big"then d7=d7+1 else d6[#d6+1]=d8 end end end end return d6,d7 end function A.goal(yp)local qB=d.Pets[yp]return qB and tonumber(qB.f)or 0 end
function A.wantMore(qC,yq,qD)local jY=A.goal(qC)if jY<=0 or not qD then return true end local yr,qE=A.count(qC,qD)
if qE>=jY then return false end if yq=="Big"then return true end return#yr<A.need()*(jY-qE)end function A.status(qF,qG)
local gi=A.goal(qF)if gi<=0 or not qG then return nil end local ys,jZ=A.count(qF,qG)if jZ>=gi then return("Big %d/%d done"):format(jZ,gi)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#ys,A.need()),A.need(),jZ,gi)end function A.wear(j0)local j1={}
for DQ,yt in ipairs(j0)do j1[tostring(yt)]=true end for DR=1,3 do local cN=l.data()if not cN then return false end
for DS,qH in ipairs(cN.equipped or{})do if not j1[tostring(qH)]then l.call("unequip",qH)task.wait(0.3)end end
cN=l.data()local qI={}for DT,yu in ipairs(cN.equipped or{})do qI[tostring(yu)]=true end for DU,qJ in ipairs(j0)do
if not qI[tostring(qJ)]then l.call("equip",qJ)task.wait(0.3)end end task.wait(0.4)cN=l.data()local j2,qK=0,true
for DV,yv in ipairs(cN.equipped or{})do j2=j2+1 if not j1[tostring(yv)]then qK=false end end if qK and j2==#j0 then return true end
end return false end function A.saveTeam(qL,qM)if not A.wear(qM)then return false,"could not put the pets on"end
local yw=y.teams()local cb for yx,yy in ipairs(yw)do if yy.name==qL then cb=yx break end end local cO if cb then
cO=l.call("teamSave",cb)else cO=l.call("teamNew")if type(cO)=="table"and cO.ok and cO.index then cb=cO.index task.wait(0.3)
l.call("teamRename",{index=cb,name=qL})end end task.wait(0.4)local j3=l.data()local qN=j3 and j3 .teams and cb and j3 .teams[cb]
if not qN then return false,"the game did not save it"end local qO={}for DW,yz in ipairs(qN.pets or{})do qO[tostring(yz)]=true end
for DX,yA in ipairs(qM)do if not qO[tostring(yA)]then return false,"saved, but not with these pets"end end return true
end A.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function A.quiet()
if y.placing or y.glazeSoon()then return false end local yB=l.srv()for DY,yC in ipairs(y.list or{})do if yC.ends-yB<(d.GlazeLead or 45)+90 then return false end end
return true end function A.plan()local d9=l.data()if not d9 then return{}end local qP={}for DZ,yD in ipairs(d9 .arriving or{})do qP[tostring(yD)]=true end
local d_={}for D0,gj in ipairs(d9 .pets or{})do if not qP[tostring(gj.id)]then d_[#d_+1]={id=tostring(gj.id),name=gj.name,variant=gj.variant or""}end
end local qQ={}for D1,qR in ipairs(d_)do qQ[qR.id]=qR end local qS=tonumber(d9 .slots)or 3 local j4,qT={},{}for D2,gk in ipairs(A.ROLES)do
local ea=d[gk[1]]if ea~=""and not qT[ea]then qT[ea]=true local j5,eb,qU={},{},false for D3,qV in ipairs(d9 .teams or{})do
if qV.name==ea then for D4,yE in ipairs(qV.pets or{})do local j6=qQ[tostring(yE)]if j6 then j5[j6 .id]=true eb[#eb+1]=j6 else qU=true end
end end end local j7,qW=A.best(gk[2],d_,qS,j5)local qX=A.score(gk[2],eb)local qY=#j7==#eb for D5,yF in ipairs(j7)do if not j5[yF]then qY=false end end
if not qY and(qU or#eb<math.min(qS,#d_)or qW>qX+1e-4)then j4[#j4+1]={team=ea,role=gk[2],ids=j7,gain=qW-qX}end
end end return j4 end function A.rebuild(yG)local qZ=A.plan()if#qZ==0 then A.buildMsg="teams are already the best your pets allow"return true end
if not A.quiet()then A.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end y.editing,y.editingSince=true,x()
local gl=true local yK,yL=pcall(function()for D6,ec in ipairs(qZ)do local yH,yI=A.saveTeam(ec.team,ec.ids)local q0=l.data()
local j8={}for D7,yJ in ipairs(ec.ids)do for D8,j9 in ipairs(q0 and q0 .pets or{})do if tostring(j9 .id)==yJ then j8[#j8+1]=l.nice(j9 .name,j9 .variant)end
end end if yH then z(("TEAM %s rebuilt (%s): %s"):format(ec.team,yG or"pets changed",table.concat(j8,", ")))else gl=false z(("TEAM %s: %s"):format(ec.team,tostring(yI)))end
end end)y.editing,y.nextTry=false,0 if not yK then gl=false z("TEAM BUILD ERR "..tostring(yL))end A.builds=A.builds+1
A.buildMsg=gl and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gl end
function A.fuseTick()if not d.AutoFuse or y.editing then return end local gm=l.data()if not gm then return end
local j_=A.need()local ka,gn={},{}for D9,yM in ipairs(gm.teams or{})do for D_,yN in ipairs(yM.pets or{})do ka[tostring(yN)]=true end end
for Ea,yO in ipairs(gm.equipped or{})do gn[tostring(yO)]=true end A.failUntil=A.failUntil or{}for cc,yP in pairs(d.Pets)do
local q1=tonumber(yP.f)or 0 local kb,yQ=A.count(cc,gm,true)if q1>0 and yQ<q1 and#kb>=j_ and x()>=(A.failUntil[cc]or 0)then
table.sort(kb,function(go,gp)local q2=(gn[tostring(go.id)]and 4 or 0)+(ka[tostring(go.id)]and 2 or 0)+(go.named and 1 or 0)
local q3=(gn[tostring(gp.id)]and 4 or 0)+(ka[tostring(gp.id)]and 2 or 0)+(gp.named and 1 or 0)if q2~=q3 then return q2<q3 end
return tostring(go.id)<tostring(gp.id)end)local gq,kc={},{}for gr=1,j_ do gq[gr]=tostring(kb[gr].id)if gn[gq[gr]]then kc[#kc+1]=gq[gr]end
end y.editing,y.editingSince=true,x()for Eb,yR in ipairs(kc)do l.call("unequip",yR)task.wait(0.3)end local gs=l.call("fuse",{ids=gq})
y.editing,y.nextTry=false,0 if type(gs)=="table"and gs.ok then A.fused=A.fused+1 A.dirtyAt=x()z(("FUSED %d %s -> Big %s"):format(j_,l.nice(cc),l.nice(cc)))
A.fuseMsg=("fused a Big %s %s"):format(l.nice(cc),os.date("%H:%M"))else A.failUntil[cc]=x()+120 z(("fuse %s failed: %s"):format(l.nice(cc),type(gs)=="table"and tostring(gs.reason or"no reason given")or"no answer"))
end return end end end function A.tick()pcall(A.fuseTick)if not d.AutoBuild or not d.Teams then return end local q4=l.data()
if not q4 then return end local cd={}for Ec,yS in ipairs(q4 .pets or{})do cd[#cd+1]=tostring(yS.id)end table.sort(cd)
cd=table.concat(cd,",")if cd~=A.sig then A.sig,A.dirtyAt=cd,x()end local yT=(A.dirtyAt and x()-A.dirtyAt>8)or x()-(A.lastBuild or 0)>900
if yT and not y.editing then local yU=A.rebuild(A.dirtyAt and"pets changed"or"check")if yU then A.dirtyAt,A.lastBuild=nil,x()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(ce)return ce:IsA("ParticleEmitter")or ce:IsA("Trail")or ce:IsA("Beam")or ce:IsA("Fire")or ce:IsA("Smoke")
or ce:IsA("Sparkles")or ce:IsA("Light")end function j.muteOne(aG)if not d.Lite or not aG.Parent then return end
local gt=(aG:IsA("BillboardGui")and j.bb)or(j.isFx(aG)and j.fx)or nil if not gt or gt[aG]~=nil then return end
gt[aG]=aG.Enabled if aG.Enabled then aG.Enabled=false end j.watch[aG]=aG:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aG.Enabled then gt[aG]=true aG.Enabled=false end end)end function j.lite(q5)d.Lite=q5 if q5 then
task.spawn(function()for yV,yW in ipairs(au:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,yW)
if yV%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=V(au.DescendantAdded:Connect(function(kd)
if d.Lite and(kd:IsA("BillboardGui")or j.isFx(kd))then j.queue[#j.queue+1]=kd end end))end local ke=game:GetService("Lighting")
for Ed,ed in ipairs(ke:GetChildren())do if ed:IsA("PostEffect")and ed.Enabled and j.post[ed]==nil then j.post[ed]=true ed.Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and ke.GlobalShadows or j.oldShadows ke.GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and au.Terrain.Decoration or j.oldDeco au.Terrain.Decoration=false end)
else for Ee,yX in pairs(j.watch)do pcall(function()yX:Disconnect()end)end for q6,yY in pairs(j.bb)do pcall(function()if q6 .Parent then q6 .Enabled=yY end end)end
for q7,yZ in pairs(j.fx)do pcall(function()if q7 .Parent then q7 .Enabled=yZ end end)end for q8 in pairs(j.post)do pcall(function()if q8 .Parent then q8 .Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local y0=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()y0 .GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()au.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(q9)d.HideHud=q9 local kf=F:FindFirstChildOfClass("PlayerGui")if not kf then return end if q9 then
for Ef,ee in ipairs(kf:GetChildren())do if ee:IsA("ScreenGui")and not j.MINE[ee.Name]and ee.Enabled then j.hud[ee]=true ee.Enabled=false end
end if not j.hudConn then j.hudConn=V(kf.ChildAdded:Connect(function(ef)if d.HideHud and ef:IsA("ScreenGui")and not j.MINE[ef.Name]then
task.defer(function()if d.HideHud and ef.Enabled then j.hud[ef]=true ef.Enabled=false end end)end end))end else
for q_ in pairs(j.hud)do pcall(function()if q_.Parent then q_.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(kg)d.FpsCap=kg local ra=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not ra then return false end return pcall(ra,kg==0 and 60 or kg)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(am)if am:IsA("BasePart")or am:IsA("Decal")or am:IsA("Texture")then if am.Transparency<1 then j.unseen[am]=am.Transparency am.Transparency=1 end
elseif am:IsA("BillboardGui")or am:IsA("SurfaceGui")or am:IsA("ParticleEmitter")or am:IsA("Beam")or am:IsA("Trail")or am:IsA("Light")or am:IsA("Fire")or am:IsA("Smoke")or am:IsA("Sparkles")then
if am.Enabled then j.unseen[am]=true am.Enabled=false end end end function j.notMine(y1)return d.HideMine or(c.plot and not y1:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(rb)if d.HideBases then j.bases(false)end d.HideMine=rb==2 if rb>0 then j.bases(true)end end
function j.bases(rc)d.HideBases=rc local kh=au:FindFirstChild("Plots")if not kh then return end if rc then task.spawn(function()
local ki=0 for Eg,rd in ipairs(kh:GetChildren())do if rd~=c.plot or d.HideMine then for Eh,y2 in ipairs(rd:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,y2)ki=ki+1 if ki%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=V(kh.DescendantAdded:Connect(function(re)if d.HideBases and j.notMine(re)then task.defer(function()pcall(j.hideOne,re)end)end
end))end else for kj,rf in pairs(j.unseen)do pcall(function()if not kj.Parent then return end if type(rf)=="number"then kj.Transparency=rf else kj.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(rg)d.NoRender=rg pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not rg)end)
end j.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
j.calmed={}function j.calmScan()if not d.Calm or type(getconnections)~="function"then return 0 end local y3=game:GetService("RunService")
local kk=0 for Ei,y4 in ipairs({"RenderStepped","Heartbeat","Stepped"})do local y5,rh=pcall(function()return y3[y4]end)
local ri,kl=false,nil if y5 and rh then ri,kl=pcall(getconnections,rh)end if ri and type(kl)=="table"then for Ej,km in ipairs(kl)do
local kn=""pcall(function()local rj=getfenv(km.Function).script kn=rj and rj:GetFullName()or""end)if kn~=""then
for Ek,y6 in ipairs(j.CALM)do if kn:find(y6,1,true)then if pcall(function()km:Disable()end)then j.calmed[#j.calmed+1]=km kk=kk+1 end
break end end end end end end if#j.calmed>200 then local ko={}for y7=#j.calmed-49,#j.calmed do ko[#ko+1]=j.calmed[y7]end j.calmed=ko
end return kk end function j.calm(rk)d.Calm=rk if rk then local y8=j.calmScan()z(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(y8))
else for El,y9 in ipairs(j.calmed)do pcall(function()y9:Enable()end)end j.calmed={}end end function j.restoreAll()
pcall(j.unpin)pcall(j.calm,false)if d.HideBases then pcall(j.bases,false)end if E.arPaused then pcall(E.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(rl)if c.rejoining then return end z("REJOIN this server ("..rl..")")
pcall(e4)if c.autoload then pcall(ft,c.autoload)end nA()local y_=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then ds(rl..", same server failed")end end)return y_ end function j.tick()
local kp=j.queue if d.Lite and kp and#kp>0 then j.queue={}for za,zb in ipairs(kp)do pcall(j.muteOne,zb)if za%300==0 then task.wait()end end
end local rm=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if rm then for Em,zc in ipairs(rm:GetChildren())do
local rn=zc:FindFirstChild("SquishyPlaceHolder")local cf=rn and rn:FindFirstChild("TimerGui")if cf and cf:IsA("BillboardGui")then
if j.bb[cf]==nil then pcall(j.muteOne,cf)elseif cf.Enabled then j.bb[cf]=true cf.Enabled=false end end end end
local zd,eg=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if zd and type(eg)=="number"then
j.mem=eg j.memPeak=math.max(j.memPeak,eg)if(d.MemLimit or 0)>0 and eg>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(eg,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if x()-(j.noteAt or 0)>1800 then j.noteAt=x()z(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function kq(gu)if type(gu)~="string"then return false end
gu=gu:lower()for En,ze in ipairs(c.sellWords)do if gu:find(ze,1,true)then return true end end return false end
local function zf()local ro=ag:FindFirstChild("Remotes")local kr=ro and ro:FindFirstChild("SellSquishy")if not(kr and kr:IsA("RemoteEvent"))then return false end
if not pcall(function()kr:FireServer()end)then return false end return ap(function()return ac()==nil end,1.5)
end local function zg()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local rp=ao()local rq=rp and rp.HumanoidRootPart.Position local eh,rr for Eo,cP in ipairs((c.plot or au):GetDescendants())do
if cP:IsA("ProximityPrompt")and(kq(cP.ActionText)or kq(cP.ObjectText)or kq(cP.Name))then local rs=my(cP)local ks=(rs and rq)and(rs-rq).Magnitude or 1e9
if ks<=400 and(not eh or ks<rr)then eh,rr=cP,ks end end end c.sellSpot=eh c.noSellSpot=(eh==nil)return eh end
local function rt()local kt=ac()if not kt then c.holding=false return false end if aI(kt)then return false end
local ku=ai(aa(kt))if zf()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
z("SOLD "..ku)return true end local cQ=zg()if cQ then local ru=de(cQ)if ru then bY(ru,cQ)local rv=ac()if rv and not aI(rv)then
local zh,zi=dy(cQ,function()return ac()==nil end,function()return cQ.Enabled end)if zh then c.sold,c.holding,c.sellFails=c.sold+1,false,0
z(("SOLD %s at %s via %s"):format(ku,eZ(cQ),zi))return true end end end end c.sellFails=c.sellFails+1 z("could not sell "..ku.." ("..c.sellFails..")")
return false end local zj={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function zk(cR)local gv=eZ(cR):lower()for Ep,zl in ipairs(zj)do if gv:find(zl,1,true)then return 0 end end
local a2,aq=cR.Name:lower(),0 local function aS(zm,zn)return zm:find(zn,1,true)~=nil end if aS(a2,"collect")then aq=aq+60 end
if aS(a2,"cash")or aS(a2,"money")then aq=aq+45 end if aS(a2,"income")or aS(a2,"claim")then aq=aq+35 end if aS(a2,"coin")or aS(a2,"earn")or aS(a2,"green")then aq=aq+20 end
if a2=="pad"or a2=="touch"then aq=aq+25 end if aq==0 and(aS(gv,"collect")or aS(gv,"cash")or aS(gv,"money"))then aq=25 end
if aq==0 then return 0 end local ei=cR.Color if ei.G>0.5 and ei.G>ei.R*1.4 and ei.G>ei.B*1.4 then aq=aq+15 end
if math.min(cR.Size.X,cR.Size.Y,cR.Size.Z)<2 then aq=aq+5 end return aq end local function zo()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local gw,ej,kv={},nil,29 for Eq,gx in ipairs(c.plot:GetDescendants())do
if gx:IsA("BasePart")then local gy=zk(gx)if gy>0 then gw[#gw+1]={s=gy,p=gx}if gy>kv then ej,kv=gx,gy end end end
end table.sort(gw,function(zp,zq)return zp.s>zq.s end)c.padCands,c.padPart=gw,ej if ej then z("collect pad: "..eZ(ej).." (score "..kv..")")end
return ej end local kw="SAB_pad_v1.txt"local function zr(zs)if type(writefile)=="function"then pcall(writefile,kw,table.concat({zs:GetComponents()},","))end
end local function zt()if type(isfile)~="function"or type(readfile)~="function"then return nil end local zu,rw=pcall(function()if isfile(kw)then return readfile(kw)end end)
if not zu or type(rw)~="string"then return nil end local gz={}for zv in rw:gmatch("[^,]+")do gz[#gz+1]=tonumber(zv)end
if#gz==12 then return CFrame.new(unpack(gz))end end local function zw(kx,gA,zx)local zy=cz(kx)local ky=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aT=(ky and ky:IsA("BasePart"))and(ky.Position-gA)or Vector3 .new(1,0,0)aT=Vector3 .new(aT.X,0,aT.Z)if aT.Magnitude<0.05 then aT=Vector3 .new(1,0,0)end
aT=aT.Unit for zz=0,7 do local gB=zz*math.pi/4 local zA=Vector3 .new(aT.X*math.cos(gB)-aT.Z*math.sin(gB),0,aT.X*math.sin(gB)+aT.Z*math.cos(gB))
local gC=gA+zA*(zx+5)local kz=fC(gC.X,gA.Y,gC.Z)if kz and math.abs(kz.Y-gA.Y)<8 then aC(kx,Vector3 .new(gC.X,kz.Y+zy,gC.Z))
if iz(kx,0.7)then return true end end end return false end local function zB()c.lastCollect=x()local ek=ao()if not ek then return end
local rx,zC=ek.HumanoidRootPart,cz(ek)local el,ry,em,kA=nil,4,nil,"?"local kB=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and kB and kB:IsA("BasePart")then el,kA=(kB.CFrame*c.manualPad).Position,"manual pad"else local bi=zo()
if bi then el=Vector3 .new(bi.Position.X,bi.Position.Y+bi.Size.Y/2+zC,bi.Position.Z)ry,em,kA=math.max(bi.Size.X,bi.Size.Z)/2,bi,bi.Name
end end if not el then z("COLLECT: pad not found - stand on it and tap SET PAD")return end local kC=a7()aC(ek,el)
if em and type(firetouchinterest)=="function"then pcall(firetouchinterest,rx,em,0)end ae(d.PadDwell)if em and type(firetouchinterest)=="function"then pcall(firetouchinterest,rx,em,1)end
ae(0.5)c.collected=c.collected+1 local kD=a7()z(("COLLECTED (%s) %s"):format(kA,(kC and kD and kD>kC)and("+$"..aJ(kD-kC))or"no cash change seen"))
zw(ek,el,ry)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function q.mods()if q.si and x()-q.modAt<120 then return true end
local rz=ag:FindFirstChild("Modules")if not rz then return false end local function kE(zD)local rA=rz:FindFirstChild(zD)
if not rA then return nil end local zE,rB=pcall(require,rA)return(zE and type(rB)=="table")and rB or nil end q.si,q.arm,q.ci=kE("SquishyInfo"),kE("AutoRollRules"),kE("CrateInfo")
q.modAt=x()if not q.si then return false end local kF={}if q.arm and type(q.arm.tierOf)=="table"then for kG in pairs(q.arm.tierOf)do
local gD=q.si[kG]if type(gD)=="table"and gD.rarity~="Limited"and not gD.incomeType and not gD.hiddenAfter then kF[aa(kG)]=kG end
end end q.roll=kF local gE={}for zF,zG in pairs(kF)do local en=q.si[zG]if type(en)=="table"and type(en.income)=="number"and not en.incomeType then
gE[#gE+1]={k=zF,inc=en.income,pr=tonumber(en.price)or 0}end end table.sort(gE,function(kH,kI)if kH.inc~=kI.inc then return kH.inc>kI.inc end return kH.pr>kI.pr end)
q.order=gE local gF,kJ,kK local zH=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for zI,kL in pairs(zH)do
local kM=type(kL)=="table"and tonumber(kL.price)if kM and(not kJ or kM>kJ)then gF,kJ,kK=zI,kM,kL.title end end
q.bestCrate,q.bestCrateName=gF and L.key(gF),gF q.bestCrateTitle=kK and L.key(kK)or nil return true end function q.rank(zJ)
local zK,zL=pcall(function()return q.arm.rankOf(zJ)end)return(zK and tonumber(zL))or 0 end function q.loadDisc(rC)
if type(rC)~="table"then return end local rD={}for zM,zN in pairs(rC)do if zN then rD[aa(tostring(zM))]=true end end
q.disc,q.discAt=rD,x()end function q.fetch()q.discAt=x()local rE=ag:FindFirstChild("Remotes")local rF=rE and rE:FindFirstChild("GetSquishiesDiscovered")
if not rF then return end local zO,zP=pcall(function()return rF:InvokeServer()end)if zO then q.loadDisc(zP)end
end function q.scanWax()local kN={}local rG=c.plot and c.plot:FindFirstChild("WaxStations")if rG then for Er,rH in ipairs(rG:GetChildren())do
local rI=rH:FindFirstChild("SquishyPlaceHolder")if rI and rH:GetAttribute("HasSquishy")then for Es,rJ in ipairs(rI:GetChildren())do if rJ:IsA("Model")then kN[aa(rJ.Name)]=true end end
end end end for rK,zQ in pairs(q.placedAt)do if x()-zQ<20 then kN[rK]=true else q.placedAt[rK]=nil end end q.waxing=kN
end function q.compute()local rL,kO,kP={},0,0 if q.disc then for kQ in pairs(q.roll or{})do if not q.disc[kQ]then
if q.waxing[kQ]then kP=kP+1 else rL[kQ],kO=true,kO+1 end end end end q.need,q.nNeed,q.nWax=rL,kO,kP local rM,kR={},d.Best or 0
local kS=(kR==4)and q.stackMin or nil for zR,rN in ipairs(q.order)do if(kS and rN.inc>kS)or(not kS and zR<=(kR==4 and 1 or kR))then rM[rN.k]=true end
end q.best=rM end function q.readStack()q.stackAt=x()local rO=ag:FindFirstChild("Remotes")local rP=rO and rO:FindFirstChild("EditStack")
if not rP then return end local zS,cS=pcall(function()return rP:InvokeServer("State",nil)end)if not(zS and type(cS)=="table"and type(cS.state)=="table"and type(cS.state.entries)=="table")then return end
local gG for Et,rQ in ipairs(cS.state.entries)do local eo=type(rQ)=="table"and q.si and q.si[tostring(rQ.name)]
if type(eo)=="table"and type(eo.income)=="number"and not eo.incomeType and(not gG or eo.income<gG)then gG=eo.income end
end q.stackMin=gG q.stackFull=#cS.state.entries>=(tonumber(cS.state.capacity)or 100)end function q.want(kT)if(d.Best or 0)>0 and(next(q.best)or(d.Best==4 and q.stackMin))then
if q.best[kT]then return true end elseif d.Targets[kT]then return true end return d.AutoIndex==true and q.need[kT]==true
end function q.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(q.best)~=nil)or(d.AutoIndex and next(q.need)~=nil)
or d.Best==4 end function q.placed(zT)local ep=aa(zT)q.placedAt[ep],q.waxing[ep]=x(),true if q.need[ep]then q.need[ep],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
z(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ai(ep)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local eq,er={},{}for zU,zV in pairs(q.roll or{})do if q.want(zU)then eq[zV]=true end end
for rR,kU in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(rR)or(type(kU)=="table"and type(kU.title)=="string"and L.wanted(kU.title))then er[rR]=true end
end if not next(eq)and not next(er)then return nil end if q.arm and type(q.arm.encode)=="function"then local zW,rS=pcall(q.arm.encode,{rarities={},butters=eq,crates=er,index=false})
if zW and type(rS)=="string"then return rS end end local function rT(zX)local gH={}for zY in pairs(zX)do gH[#gH+1]=zY end table.sort(gH)return table.concat(gH,",")end
local es="adv:"if next(eq)then es=es..";butters:"..rT(eq)end if next(er)then es=es..";crates:"..rT(er)end return es
end function q.canon(zZ)local gI={}for rU in tostring(zZ or""):gmatch("[^;]+")do local kV,rV=rU:match("^(%a+):(.*)$")
if not kV then kV,rV="r",rU:gsub("^adv:","")end for z0 in rV:gmatch("[^,]+")do gI[#gI+1]=kV.."="..z0 end end table.sort(gI)
return table.concat(gI,"|")end function q.sync(z1)if F:GetAttribute("AutoRoll")~=true then return end if x()<(q.pauseUntil or 0)then return end
local cg=q.rulesNow()if not cg or#cg>1900 then return end if q.canon(F:GetAttribute("AutoRollRules"))==q.canon(cg)then q.fails=0 return end
if not z1 and x()-q.sentAt<4 then return end local rW=ag:FindFirstChild("Remotes")local rX=rW and rW:FindFirstChild("AutoRollAction")
if not rX then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,x()+300 z("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=x()C.replaying=true pcall(function()rX:FireServer("Rules",cg)end)C.replaying=false d.ARrules=cg
local gJ,gK=0,0 for Eu in(cg:match("butters:([^;]*)")or""):gmatch("[^,]+")do gJ=gJ+1 end for Ev in(cg:match("crates:([^;]*)")or""):gmatch("[^,]+")do gK=gK+1 end
local rY=gJ.."/"..gK if q.told~=rY then q.told=rY z(("auto roll now stops on %d butters and %d crates"):format(gJ,gK))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if x()-q.discAt>30 then q.fetch()end
q.scanWax()if d.Best==4 and x()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aL={}if d.AutoIndex then aL[#aL+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if d.Best==4 then local et=0 for Ew in pairs(q.best)do et=et+1 end
aL[#aL+1]=et==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(et,et==1 and""or"s")
elseif(d.Best or 0)>0 and q.order[1]then aL[#aL+1]="best: "..ai(q.order[1].k)end if d.BestCrate and q.bestCrateName then aL[#aL+1]="crate: "..q.bestCrateName end
if Q.got>0 then aL[#aL+1]="shower: "..Q.got end q.msg=#aL>0 and table.concat(aL," | ")or"index / best: off"end
q.heard={}function q.admin(z2,aU,gL)if z2~="Effect"then return end if aU=="Shower"then Q.add(gL)return end if aU=="ShowerTaken"then Q.gone(gL)return end
if aU=="ShowerClear"then Q.drops={}return end if aU=="WaxGlow"then local kW=type(gL)=="table"and tonumber(gL.SnapAt)
if kW then q.snapAt=kW z(("ADMIN: every wax finishes in %ds%s"):format(math.floor(kW-l.srv()),(d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end aU=tostring(aU)bU("Admin "..aU)if aU~="GoalPoint"and x()-(q.heard[aU]or-100)>30 then q.heard[aU]=x()
z("ADMIN: "..aU)end end Q.drops,Q.tried,Q.got,Q.miss={},{},0,0 function Q.add(kX)if type(kX)~="table"or type(kX.Pieces)~="table"then return end
for Ex,aV in pairs(kX.Pieces)do if type(aV)=="table"and aV.Id~=nil and aV.Position~=nil then Q.drops[aV.Id]={id=aV.Id,butter=tostring(aV.Butter or"?"),rar=tostring(aV.Rarity or"?"),star=aV.Star==true,
pos=aV.Position,opens=tonumber(aV.OpensAt)or 0,ends=tonumber(aV.ExpiresAt)or 0}end end end function Q.gone(eu)
if type(eu)~="table"or eu.Id==nil then return end Q.drops[eu.Id]=nil if tonumber(eu.UserId)==l.uid then Q.mine=eu.Id end
end function Q.pick()local kY=l.srv()local kZ,rZ for r0,cj in pairs(Q.drops)do if kY>=cj.ends-0.3 then Q.drops[r0]=nil
elseif kY>=cj.opens-0.2 and(Q.tried[r0]or 0)<3 then local r1=(aI(cj.butter)and 1e6 or 0)+(cj.star and 1e5 or 0)+q.rank(cj.rar)*100-(cj.ends-kY)
if not kZ or r1>rZ then kZ,rZ=cj,r1 end end end return kZ end function Q.due()return d.Shower and c.running and next(Q.drops)~=nil and not ac()and Q.pick()~=nil
end function Q.grab()local aM,k0=Q.pick(),ao()if not(aM and k0)then return end Q.tried[aM.id]=(Q.tried[aM.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aC(k0,aM.pos+Vector3 .new(0,cz(k0)+0.5,0))ap(function()return Q.mine==aM.id or ac()~=nil or not Q.drops[aM.id]end,1.5)
if Q.mine==aM.id or ac()then Q.got,Q.drops[aM.id]=Q.got+1,nil z(("GRABBED %s [%s]%s from the admin shower"):format(ai(aa(aM.butter)),aM.rar,aM.star and" (star)"or""))
elseif not Q.drops[aM.id]then Q.miss=Q.miss+1 end end local ev local function r2()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 z("trying again after being stopped for 5 minutes")ev(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ao()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bp(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local k1,r3=e1()
local gM=ac()if gM then local cT=ai(aa(gM))if not aI(gM)then local k2=(W.gift and aa(W.gift)==aa(gM)and x()-W.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cT,k2),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cT,k2),"bad"end return"sell",("selling %s (%s)"):format(cT,k2),"warn"
end if k1<1 then return nil,("holding %s - 0 free stations"):format(cT),"wait"end if y.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cT),"wait"end
return"place",("waxing %s (%d free)"):format(cT,k1),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local k3=c.plot:FindFirstChild("CrateStand")if k3 then for Ey,ew in ipairs(k3:GetDescendants())do
if ew:IsA("ProximityPrompt")and ew.Enabled and iQ(ew)then local bj=ew.ObjectText if bj==""then bj=cs(k3,"TitleLabel")or""end
if bj~=""and L.wanted(bj)then local z3=eX(bj):gsub("crate$","")local r4 for r5 in pairs(ad.members)do if eX(r5)==z3 then r4=r5 end end
e.waiting,e.at,e.title,e.prompt=true,x(),bj,ew e.data={name=(bj:gsub("%s","")),rarity=r4,title=bj}z(bj.." found waiting on your stand")
end break end end end end local r6=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and r6 then
local aW=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aW),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 z("could not press the "..aW.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aW),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aW),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aW,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aW),"ok"end if e.at and x()-e.at>e.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aW,math.floor(e.GIVEUP/60)),"bad"
end if e.summonFails>=3 then if x()-e.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aW,
math.ceil(45-(x()-e.lastFail))),"bad"end e.summonFails,e.nearFails,e.prompt=0,0,nil z("trying the "..aW.." again")
end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aW),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aW,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not r6 then local r7=e.title..tostring(e.rolledAt)if e.told~=r7 then e.told=r7 z(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if k1<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(r3,r3),"wait"
end local k4=mM()if not k4 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local cU=bT()
if cU and n8(cU.name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(cU.name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(cU.name),"bad"end if not ou()then return nil,("%s rolled - waiting for it to land on the stand"):format(cU.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(cU.name),"ok"end local bD=ix()if bD.state~="match"then
c.matchSince=nil if bD.state=="skip"and not k4 .Enabled then return nil,bD.text.." (sold out)","idle"end return nil,bD.text,bD.level
end if not k4 .Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local ex=x()
if ex<c.noCashUntil then local r8,z4=du()if r8 then return nil,("cash short: have $%s, price ~$%s"):format(aJ(r8),aJ(z4)),"bad"end
return nil,(du()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aJ(a7()),math.ceil(c.noCashUntil-ex)),du()and"bad"or"wait"end if ex-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or ex local r9=ex-c.matchSince if r9<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bD.shown,r9),"ok"end
return"buy",("buying %s via %s"):format(bD.shown,bD.src),"ok"end j.DEPTH=11 function j.pinTick()local r_=j.hold
if not r_ then return end local k5=F.Character local k6=k5 and k5:FindFirstChild("HumanoidRootPart")if not k6 then return end
k6 .CFrame=r_ k6 .AssemblyLinearVelocity=Vector3 .new(0,0,0)for Ez,gN in ipairs(k5:GetChildren())do if gN:IsA("BasePart")and gN.CanCollide then j.noclip[gN]=true gN.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(z5,sa)j.hold=z5 if sa then j.surface=sa end end function j.unpin(z6)
if not j.hold then return end j.hold=nil for sb in pairs(j.noclip)do pcall(function()if sb.Parent then sb.CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local sc=ao()if sc and j.surface and not z6 then aC(sc,j.surface.Position,j.surface.Position+j.surface.LookVector)
ae(0.1)end end function j.home()local bk,sd=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ao()
if not(bk and bk:IsA("BasePart")and sd)then return nil end local se=mB()or bk.Position local gO=Vector3 .new(se.X-bk.Position.X,0,se.Z-bk.Position.Z)
gO=gO.Magnitude>0.1 and gO.Unit or Vector3 .new(0,0,1)local gP=bk.Position+gO*6 local sf=fC(gP.X,bk.Position.Y,gP.Z,{bk})
return CFrame.new(gP.X,(sf and sf.Y or bk.Position.Y)+cz(sd),gP.Z)end function j.ground(z7,sh,z8)local k7,k8={F.Character},nil
for EA=1,12 do local k9=RaycastParams.new()k9 .FilterType=Enum.RaycastFilterType.Exclude k9 .FilterDescendantsInstances=k7
local gQ=au:Raycast(Vector3 .new(z7,sh,z8),Vector3 .new(0,-2000,0),k9)if not gQ then break end k8,sh=gQ,gQ.Position.Y-0.05
k7[#k7+1]=gQ.Instance end return k8 and k8 .Position.Y end function j.parkHome()local k_=j.home()if not k_ then return false end
local cV=k_.Position local z9=j.ground(cV.X,cV.Y+300,cV.Z)or(cV.Y-3)j.pin(CFrame.new(cV.X,z9-8,cV.Z),k_)return true
end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function j.setGhost(gR)d.Ghost,d.GhostHelps=gR==2,gR==1 if gR<2 then task.spawn(function()while c.busy do ae(0.1)end
if j.ghostMode()<2 and j.hold and not D.home then pcall(j.unpin)end end)end j.paintGhost()z("ghost: "..j.GHOST[gR][1]:sub(8):lower())
end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end
local z_=ao()if not z_ or J.seat()then return end j.parkHome()end J.n,J.fails,J.nextAt,J.msg,J.lost=0,0,0,"no campfire right now",0
function J.seat()local sj=F.Character local sk=sj and sj:FindFirstChildOfClass("Humanoid")local la=sk and sk.SeatPart
return(la and la.Name=="LogSeat")and la or nil end function J.due()if not(d.Campfire and c.running)or x()<J.nextAt then return false end
local Aa=au:FindFirstChild("NightSeats")if not Aa then if J.wasOn then J.wasOn,J.fails,J.lost=false,0,0 end J.msg="no campfire (comes with weather events)"
return false end J.wasOn=true if J.seat()then J.sitAt=J.sitAt or x()J.msg=("sitting at the campfire: +%s%% cash"):format(tostring(F:GetAttribute("CampfireBoost")or"?"))
return false end if J.sitAt then J.lost,J.sitAt=J.lost+1,nil if J.lost>=4 then J.nextAt,J.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
z(J.msg)return false end end return true end function J.sit()local sl,gS=au:FindFirstChild("NightSeats"),ao()
if not sl or not gS then return end local sm,cW=gS.HumanoidRootPart.Position,{}for EB,gT in ipairs(sl:GetChildren())do
local sn=gT:IsA("Seat")and gT.Occupant==nil and gT:FindFirstChildOfClass("ProximityPrompt")if sn then cW[#cW+1]={st=gT,p=sn}end
end if#cW==0 then J.nextAt,J.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cW,function(Ab,Ac)return(Ab.st.Position-sm).Magnitude<(Ac.st.Position-sm).Magnitude end)
local Ad,Ae=cW[1].st,cW[1].p j.unpin(true)local cX=Ad.CFrame aC(gS,cX.Position+cX.LookVector*2+Vector3 .new(0,2.5,0),cX.Position)
ae(0.25)local Af=dy(Ae,function()return J.seat()~=nil end)if not Af then aC(gS,cX.Position+Vector3 .new(0,2,0),cX.Position+cX.LookVector)
ap(function()return J.seat()~=nil end,1.5)end if J.seat()then J.n,J.fails,J.sitAt=J.n+1,0,x()z(("SAT at the campfire (+%s%% cash)"):format(tostring(F:GetAttribute("CampfireBoost")or"?")))
else J.fails=J.fails+1 J.nextAt=x()+(J.fails>=3 and 60 or 5)J.msg="could not sit at the campfire"..(J.fails>=3 and" - trying again in a minute"or"")
if J.fails<=3 then z(J.msg)end end end E.msg,E.nextAt,E.at,E.pulls,E.claims,E.pullLeft,E.collectLeft,E.events="",0,0,0,0,0,0,{}
function E.refresh()E.at=x()local lb=ag:FindFirstChild("Remotes")if not lb then return end local ey,lc,cY=0,0,{}
local Ag,so=pcall(function()return lb.ClanRequest:InvokeServer("state")end)local sp=Ag and type(so)=="table"and so.tasks
for EC,bE in ipairs(sp and sp.list or{})do if not bE.done and bE.kind=="pull"then ey=math.max(ey,(bE.goal or 0)-(bE.progress or 0))end
if not bE.done then cY[#cY+1]=("%s %d/%d"):format(tostring(bE.text),bE.progress or 0,bE.goal or 0)end end E.events={}
for ED,cZ in ipairs(lb:GetChildren())do if cZ:IsA("RemoteFunction")and cZ.Name:match("^%u%a+Action$")and cZ.Name~="CrateAction"and cZ.Name~="AutoRollAction"then
local Ah,ez=pcall(function()return cZ:InvokeServer("state")end)if Ah and type(ez)=="table"and ez.live==true and type(ez.quests)=="table"then
E.events[#E.events+1]={r=cZ,st=ez}for EE,aN in ipairs(ez.quests)do if not aN.done and aN.kind=="pull"then ey=math.max(ey,(aN.goal or 0)-(aN.progress or 0))end
if not aN.done and aN.kind=="collect"then lc=math.max(lc,(aN.goal or 0)-(aN.progress or 0))end if not aN.done then cY[#cY+1]=("%s %d/%d"):format(tostring(aN.text),aN.progress or 0,aN.goal or 0)end
end end end end E.pullLeft,E.collectLeft=ey,lc E.msg=#cY>0 and("open: "..table.concat(cY,", "))or"all quests done for today"
end function E.claim()for EF,eA in ipairs(E.events)do local sq=eA.r.Name:gsub("Action$","")for EG,c0 in ipairs(eA.st.quests)do
if c0 .done and not c0 .claimed then local Ai,sr=pcall(function()return eA.r:InvokeServer("claimQuest",c0 .id)end)
if Ai and not(type(sr)=="table"and sr.ok==false)then E.claims=E.claims+1 z(("CLAIMED %s quest: %s (+%s)"):format(sq,tostring(c0 .text),tostring(c0 .points or c0 .treats or"?")))
end ae(0.4)end end if eA.st.bonusReady==true then local Aj=pcall(function()return eA.r:InvokeServer("claimBonus")end)
if Aj then z(("CLAIMED %s daily quest bonus"):format(sq))end ae(0.4)end end end function E.tick()if not(d.Quests and c.running)then
if E.arPaused then E.resume("quests switched off")end return end if x()-E.at<(E.pullLeft>0 and 20 or 90)then return end
E.refresh()pcall(E.claim)if E.pullLeft<=0 and E.arPaused then E.resume("lever quests done")end end function E.pullDue()
return d.Quests and c.running and E.pullLeft>0 and x()>=E.nextAt and not C.busy end function E.lever()local ss=c.plot and c.plot:FindFirstChild("Lever")
local ld=ss and ss:FindFirstChild("Wheel")return ld and ld:FindFirstChildWhichIsA("ProximityPrompt"),ld end function E.resume(Ak)
E.arPaused=false if E.arWas then E.arWas=false d.AutoRoll=true task.spawn(C.apply,Ak)end end function E.pull()
local gU,le=E.lever()if not gU or not le or not le:IsA("BasePart")then E.nextAt,E.msg=x()+300,"your lever was not found"return end
if not E.arPaused then E.arPaused=true E.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false C.apply("pulling the lever for a quest",true)
if C.isOn()then E.nextAt=x()+30 return end end z(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(E.pullLeft))
end if not gU.Enabled then E.nextAt=x()+1 return end bY(le,gU)E.asked=nil nX(gU)E.pulls=E.pulls+1 E.pullLeft=E.pullLeft-1
ae(0.6)if E.asked then E.nextAt=x()+600 z(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(E.asked)))
E.resume("a butter the game wants kept is on the pad")return end E.nextAt=x()+2.5 if E.pullLeft<=0 then E.at=0 end
end D.skip,D.skipN,D.n,D.calls,D.fails,D.nextAt,D.msg,D.tries={},0,0,0,0,0,"off",{}function D.can(bF,Al)local lf=bF:GetAttribute("PourOwner")
if type(lf)~="number"or lf==l.uid or not bF:GetAttribute("HasSquishy")then return false end if bF:GetAttribute("PourLong")~=true or bF:GetAttribute("PourFull")==true then return false end
local lg=bF:GetAttribute("PourId")if lg==nil or D.skip[lg]then return false end local su,lh,Am=bF:GetAttribute("Helpers"),0,tostring(l.uid)
if type(su)=="string"then for An in su:gmatch("[^,%s]+")do lh=lh+1 if An==Am then return false end end end if lh>=6 then return false end
local gV=y.left(bF)if not gV then local sv=tonumber(bF:GetAttribute("PourEnd"))gV=sv and(sv-Al)end if not gV or gV<=75 then return false end
local li=game:GetService("Players"):GetPlayerByUserId(lf)if not li or li:GetAttribute("WaxHelpOff")==true then return false end
return true,li,lg end function D.list()local lj,Ao={},l.srv()local sw=au:FindFirstChild("Plots")for EH,sx in ipairs(sw and sw:GetChildren()or{})do
local sy=sx~=c.plot and sx:FindFirstChild("WaxStations")for EI,lk in ipairs(sy and sy:GetChildren()or{})do local Ap,Aq,Ar=D.can(lk,Ao)
local ll=Ap and lk:FindFirstChild("SquishyPlaceHolder")if ll and ll:IsA("BasePart")then lj[#lj+1]={st=lk,p=Aq,id=Ar,part=ll}end
end end return lj end function D.due()return d.Help and c.running and x()>=D.nextAt end function D.skipIt(sz,sA)
D.skip[sz],D.skipN=sA,D.skipN+1 if D.skipN>600 then D.skip,D.skipN,D.tries={[sz]=sA},1,{}end end function D.goHome()
local gW,bG=ao(),D.home D.home=nil if not(gW and bG)then return end if d.Ghost and not J.seat()then j.unpin(true)
if not j.parkHome()then pcall(aC,gW,bG.Position,bG.Position+bG.LookVector)end elseif j.hold or(gW.HumanoidRootPart.Position-bG.Position).Magnitude>20 then
j.unpin(true)pcall(aC,gW,bG.Position,bG.Position+bG.LookVector)end end function D.step()local lm,eB=D.list(),ao()
if#lm==0 or not eB then D.nextAt=x()+15 D.msg=("helped %d waxes here%s | none to help right now"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")
D.goHome()return end local sB=eB.HumanoidRootPart local sC=sB.Position table.sort(lm,function(As,At)return(As.part.Position-sC).Magnitude<(At.part.Position-sC).Magnitude end)
local aX=lm[1]D.home=D.home or(j.hold and j.surface)or sB.CFrame local bH=aX.part local eC=(bH.Position+aX.st:GetPivot().Position)/2
local gX=D.tries[aX.id]or 0 if(d.Ghost or d.GhostHelps)and gX==0 and not J.seat()then j.pin(bH.CFrame,D.home)
else j.unpin(true)local ln=gX==0 and fC(eC.X,bH.Position.Y,eC.Z,{bH})if ln and math.abs(ln.Y-bH.Position.Y)<8 then
aC(eB,Vector3 .new(eC.X,ln.Y+cz(eB),eC.Z),bH.Position)else aC(eB,bH.Position+Vector3 .new(0,bH.Size.Y/2+3,0),eC)
end end ae(0.3)local eD=ag:FindFirstChild("Remotes")eD=eD and eD:FindFirstChild("ClanRequest")if not eD then D.nextAt,D.msg=x()+60,"the game's help remote is missing"return end
local gY,bl=pcall(function()return eD:InvokeServer("help",aX.st:GetAttribute("PourOwner"),tonumber(aX.st.Name))end)
if gY and type(bl)=="table"and bl.ok then D.n,D.fails=D.n+1,0 D.skipIt(aX.id,"helped")z(("HELPED %s's wax (station %s)"):format(aX.p.DisplayName,aX.st.Name))
D.msg=("helped %d waxes here%s"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")elseif gY and type(bl)=="table"and tostring(bl.reason or""):lower():find("walk up",1,true)and gX<2 then
D.tries[aX.id]=gX+1 D.nextAt=x()+0.3 elseif gY and type(bl)=="table"and tostring(bl.reason or""):lower():find("moment",1,true)then
D.waits=(D.waits or 0)+1 D.nextAt=x()+1.6 else local sD=(gY and type(bl)=="table"and tostring(bl.reason or"refused"))or("error: "..tostring(bl))
D.skipIt(aX.id,sD)D.fails=D.fails+1 if D.fails<=3 then z(("help refused for %s's wax: %s"):format(aX.p.DisplayName,sD))end
if D.fails>=5 then D.fails,D.nextAt,D.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
D.goHome()end end D.nextAt=math.max(D.nextAt,x()+1.2)end function D.onCall(bm)if not d.HelpGuild or type(bm)~="table"or bm.p~="help"or bm.mine or bm.u==l.uid or not bm.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eE=ag:FindFirstChild("Remotes")
eE=eE and eE:FindFirstChild("ClanRequest")if not eE then return end local sE,eF=pcall(function()return eE:InvokeServer("callHelp",bm.u)end)
local sF=tostring(bm.n or bm.un or bm.u)if sE and type(eF)=="table"and eF.ok then D.calls=D.calls+1 z(("HELPED guildmate %s's wax from here (their call)"):format(sF))
else z(("guild call from %s: %s"):format(sF,(sE and type(eF)=="table"and tostring(eF.reason or"refused"))or tostring(eF)))
end end)end local function ar(Au,sG,...)if c.busy then return end c.busy,c.busyText=true,Au if j.hold and sG~=D.step then pcall(j.unpin)end
local Av,sH=pcall(sG,...)c.busy,c.busyText=false,""if not Av and sH~=hH then z("ERR "..tostring(sH))end end local function Aw()
local aO,Ax,Ay=r2()c.reason,c.level=Ax,Ay if aO=="place"then ar("waxing...",y.place)elseif aO=="crate"then ar("opening crate...",dJ,true)
elseif aO=="cratesmart"then ar("opening crate...",e.smart)elseif aO=="cratewin"then ar("opening the crate window...",iS)
elseif aO=="nocrate"then ar("discarding crate...",dJ,false)elseif aO=="cratedrop"then ar("discarding a crate that would not open...",e.drop)
elseif aO=="sell"then ar("selling...",rt)elseif aO=="buy"then ar("buying...",n0,false)elseif not aO and not c.matchSince and Q.due()then
ar("grabbing a butter from the admin shower...",Q.grab)elseif not aO and not c.matchSince and J.due()then ar("sitting at the campfire...",J.sit)
elseif not aO and not c.matchSince and E.pullDue()and not ac()and not(bT()and aI(bT().name))then ar("pulling the lever for a quest...",E.pull)
elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(E.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ar("collecting money...",zB)elseif not aO and not c.matchSince and D.due()then ar("helping a wax...",D.step)elseif D.home and not d.Help then
ar("coming back...",D.goHome)elseif not c.busy then j.parkTick()end end function ev(gZ,Az)if gZ==c.running then return end
c.running=gZ if not Az then d.AutoStart=gZ end if gZ then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bp()or c.plot
z("START")else c.reason="stopped"z("STOP")end end do local bI=fn(al.auto)if type(bI)=="string"then bI=bI:gsub("%s+$","")
if bI~=""then c.autoload=bI local AA=nw(bI)z(AA and("loaded config "..bI)or("config "..bI.." could not be loaded"))
end end end local o={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local AB={ok=o.good,wait=o.warn,warn=o.warn,bad=o.bad,idle=o.dim}local sI={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function O(AC,AD,AE)local AF,lo=pcall(Instance.new,AC)
if not AF then c.uiErrs=c.uiErrs+1 return nil end for AG,AH in pairs(AD)do if not pcall(function()lo[AG]=AH end)then c.uiErrs=c.uiErrs+1 end
end lo.Parent=AE return lo end local function an(AI,AJ)O("UICorner",{CornerRadius=UDim.new(0,AJ or 6)},AI)end
local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"})}function a.put(g0,lp)if g0 and a.shown[g0]~=lp then a.shown[g0]=lp g0 .Text=lp end
end local lq=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local sJ=lq:FindFirstChild("SABFarmGui")
if sJ then sJ:Destroy()end local lr=O("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},lq)
local ak={w=320,h=300,head=28,strip=34,tabs=24}pcall(function()local g1=au.CurrentCamera.ViewportSize if g1 .X>100 and g1 .Y>100 then
ak.w=math.clamp(math.floor(g1 .X*0.44),300,360)ak.h=math.clamp(math.floor(g1 .Y*0.84),240,340)end end)a.root=O("Frame",{Name="Root",Size=UDim2 .new(0,ak.w,0,ak.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=o.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},lr)
an(a.root,10)O("UIStroke",{Color=o.line,Thickness=1},a.root)local a3=UDim2 .new(1,0,1,0)local function K(sK,sL)return UDim2 .new(sK,0,0,0),UDim2 .new(sL,(sK+sL>0.99)and 0 or-4,1,0)end
local function H(AK,AL,AM,AN,AO,AP)local sM=O("TextButton",{Text=AL,Position=AO,Size=AP,BackgroundColor3=AM,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=AN,TextColor3=o.text,AutoButtonColor=true},AK)an(sM,6)return sM end local function g2(AQ,AS,AT,AU,AV)
local ls=O("TextBox",{Text=AS,PlaceholderText=AT,Position=AU,Size=AV,BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=o.text,PlaceholderColor3=o.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},AQ)an(ls,6)O("UIPadding",{PaddingLeft=UDim.new(0,8)},ls)
return ls end local g3=au.CurrentCamera local function AW()local AX,g4=pcall(function()return g3 and g3 .ViewportSize end)
if AX and g4 and g4 .X>50 and g4 .Y>50 then return g4 end end local function bJ(eG)local lt=AW()if not(lt and eG and eG.Parent)then return end
local AY=pcall(function()local g5,sN=eG.AbsolutePosition,eG.AbsoluteSize local lu=70 local sO=math.clamp(g5 .X,lu-sN.X,lt.X-lu)
local sP=math.clamp(g5 .Y,0,lt.Y-math.min(sN.Y,lu))if math.abs(sO-g5 .X)>0.5 or math.abs(sP-g5 .Y)>0.5 then eG.Position=UDim2 .new(0,math.floor(sO),0,math.floor(sP))
end end)return AY end local function g6(AZ)local A0,lv=pcall(function()return AZ.AbsolutePosition end)if A0 and lv then return{math.floor(lv.X),math.floor(lv.Y)}end
end local c1={}c.dragMoved={}local function sQ(eH,sR,lw)V(eH.InputBegan:Connect(function(c2)if c2 .UserInputType~=Enum.UserInputType.MouseButton1 and c2 .UserInputType~=Enum.UserInputType.Touch then return end
local lx={start=c2 .Position,from=sR.Position,moved=0,target=sR,input=c2,onDrop=lw}c1[eH],c.dragMoved[eH]=lx,0
local ly ly=c2 .Changed:Connect(function()if c2 .UserInputState==Enum.UserInputState.End and c1[eH]==lx then c1[eH]=nil
if ly then ly:Disconnect()end if lw then lw(lx.moved)end end end)end))end V(mk.InputChanged:Connect(function(g7)
if g7 .UserInputType~=Enum.UserInputType.MouseMovement and g7 .UserInputType~=Enum.UserInputType.Touch then return end
for A1,a4 in pairs(c1)do local lz=a4 .target if lz and lz.Parent then local sS,sT=g7 .Position.X-a4 .start.X,g7 .Position.Y-a4 .start.Y
a4 .moved=math.max(a4 .moved,math.abs(sS)+math.abs(sT))c.dragMoved[A1]=a4 .moved lz.Position=UDim2 .new(a4 .from.X.Scale,a4 .from.X.Offset+sS,a4 .from.Y.Scale,a4 .from.Y.Offset+sT)
end end end))V(mk.InputEnded:Connect(function(g8)if g8 .UserInputType~=Enum.UserInputType.MouseButton1 and g8 .UserInputType~=Enum.UserInputType.Touch then return end
for A2,g9 in pairs(c1)do if g9 .input==g8 or g8 .UserInputType==Enum.UserInputType.MouseButton1 then c1[A2]=nil
if g9 .onDrop then g9 .onDrop(g9 .moved)end end end end))local function T(A3,A4,A5,A6,A7,A8,A9)return O("TextLabel",{Text=A4,Position=A8 or UDim2 .new(0,0,0,0),Size=A9 or a3,BackgroundTransparency=1,
Font=A7 and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=A5,TextColor3=A6,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},A3)
end a.title=O("Frame",{Size=UDim2 .new(1,0,0,ak.head),BackgroundColor3=o.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=O("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=o.dim,BorderSizePixel=0},a.title)
an(a.dot,5)T(a.title,"SAB  BUTTER FARM  "..cn,12,o.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=H(a.title,"-",o.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=H(a.title,"X",o.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=O("Frame",{Position=UDim2 .new(0,0,0,ak.head),Size=UDim2 .new(1,0,0,ak.strip),BackgroundColor3=o.bg,BorderSizePixel=0},a.root)
a.bar=O("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=o.warn,BorderSizePixel=0},a.strip)
an(a.bar,2)a.reason=T(a.strip,"starting",12,o.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=O("Frame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip),Size=UDim2 .new(1,0,0,ak.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=H(a.tabs,"FARM",o.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=H(a.tabs,"BUTTERS",o.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=H(a.tabs,"CRATES",o.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=H(a.tabs,"PETS",o.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=H(a.tabs,"TEAMS",o.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=H(a.tabs,"SETUP",o.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function c3()local lA=O("ScrollingFrame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip+ak.tabs),Size=UDim2 .new(1,0,1,-(ak.head+ak.strip+ak.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=o.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
O("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},lA)O("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},lA)
return lA end a.farm,a.but,a.set,a.crt=c3(),c3(),c3(),c3()a.pet,a.team=c3(),c3()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local g_,eI,M=0,12,nil local function a5(sU,A_)g_,eI=g_+1,eI+sU+6 return O("Frame",{Size=UDim2 .new(1,0,0,sU),BackgroundTransparency=1,LayoutOrder=g_},A_ or a.farm)
end local function sV(Ba)T(a5(14),Ba,10,o.dim,true)end M=a5(32)a.startB=H(M,"START",o.good,14,K(0,0.68))a.killB=H(M,"KILL",o.bad,14,K(0.68,0.32))
do local Bb=a5(40)local function eJ(sW,Bc,lB)local lC=O("Frame",{Position=UDim2 .new((sW-1)/lB,0,0,0),Size=UDim2 .new(1/lB,sW<lB and-4 or 0,1,0),
BackgroundColor3=o.panel,BorderSizePixel=0},Bb)an(lC,6)local sX=T(lC,"0",14,o.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,20))
local Bd=T(lC,Bc,9,o.dim,false,UDim2 .new(0,0,0,23),UDim2 .new(1,0,0,13))sX.TextXAlignment,Bd.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return sX end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=eJ(1,"BOUGHT",5),eJ(2,"WAXED",5),eJ(3,"SOLD",5),eJ(4,"MONEY",5),eJ(5,"FREE",5)
end a.info=T(a5(40),"",10,o.dim,false)a.tgt=T(a5(16),"",10,o.good,false)sV("SWITCHES")do local function c4(Be,Bf)
local sY=a5(26)return H(sY,Be,o.panel2,10,K(0,0.5)),H(sY,Bf,o.panel2,10,K(0.5,0.5))end a.colT,a.sellT=c4("COLLECT: ON","SELL THEM: ON")
a.crateT,a.arT=c4("OPEN CRATES: ON","AUTO ROLL: OFF")a.helpT,a.helpGT=c4("HELP WAXES: OFF","GUILD CALLS: OFF")
a.campT,a.ghostT=c4("CAMPFIRE: OFF","GHOST: OFF")a.ixT,a.bestT=c4("AUTO INDEX: OFF","BEST BUTTER: OFF")a.bcT,a.shT=c4("BEST CRATE: OFF","GRAB SHOWER: ON")
M=a5(26)a.questT=H(M,"QUESTS: OFF",o.panel2,10,K(0,0.5))T(M,"collect every",9,o.dim,false,K(0.52,0.2))a.secB=g2(M,tostring(d.Every),"60",K(0.72,0.13))
a.secB.TextSize=11 a.secSet=H(M,"SET",o.accent,10,K(0.85,0.15))local ha=O("Frame",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0},a5(76))
an(ha,6)O("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},ha)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,3)},ha)
local function eK(Bg)local hb=T(ha,"",9,o.dim,false,nil,UDim2 .new(1,-6,0,14))hb.LayoutOrder,hb.TextWrapped,hb.TextTruncate=Bg,false,Enum.TextTruncate.AtEnd
return hb end a.helpL,a.campL,a.questL,a.arL,a.ixL=eK(1),eK(2),eK(3),eK(4),eK(5)end sV("LOG")a.log=O("TextLabel",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},a5(84))an(a.log,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,eI)g_,eI=0,12 local function aj(Bh)return a5(Bh,a.set)end local function c5(Bi)T(aj(14),Bi,10,o.dim,true)end
c5("ONE-OFF ACTIONS")M=aj(26)a.buyB=H(M,"BUY THE PAD",o.warn,10,K(0,0.5))a.plB=H(M,"WAX WHAT I HOLD",o.good,10,K(0.5,0.5))
M=aj(26)a.sellB=H(M,"SELL WHAT I HOLD",o.warn,10,K(0,0.5))a.crateB=H(M,"OPEN CRATE NOW",o.warn,10,K(0.5,0.5))
M=aj(26)a.padB=H(M,"SET PAD (stand on it)",o.panel2,10,K(0,0.55))a.padL=T(M,"",10,o.dim,false,K(0.56,0.44))c5("SETTINGS FILE  (saved on your phone)")
M=aj(28)a.cfgName=g2(M,"default","config name",K(0,0.5))a.cfgSave=H(M,"SAVE",o.good,11,K(0.5,0.25))a.cfgLoad=H(M,"LOAD",o.accent,11,K(0.75,0.25))
M=aj(26)a.cfgPrev=H(M,"<",o.panel2,11,K(0,0.13))a.cfgPick=H(M,"(none saved)",o.panel2,10,K(0.13,0.74))a.cfgNext=H(M,">",o.panel2,11,K(0.87,0.13))
M=aj(26)a.cfgAuto=H(M,"LOAD IT ON LAUNCH: OFF",o.panel2,10,K(0,1))a.cfgMsg=T(aj(26),"",10,o.dim,false)c5("START BY ITSELF")
M=aj(26)a.autoB=H(M,"INSTALL F.exec",o.accent,10,K(0,1))a.autoMsg=T(aj(30),"",10,o.dim,false)M=aj(28)a.startT=H(M,"START FARMING ON LOAD: ON",o.accent,10,K(0,1))
T(aj(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,o.dim,false)
c5("IF THE GAME DROPS ME")M=aj(28)a.rejT=H(M,"AUTO REJOIN: ON",o.accent,11,K(0,0.55))a.rejB=H(M,"REJOIN NOW",o.warn,11,K(0.55,0.45))
a.rejMsg=T(aj(30),"",10,o.dim,false)c5("SMOOTHER RUNNING  (for long / overnight runs)")M=aj(28)a.pfLite=H(M,"LITE MODE: OFF",o.panel2,10,K(0,0.5))
a.pfHud=H(M,"HIDE GAME HUD: OFF",o.panel2,10,K(0.5,0.5))M=aj(28)a.pfFps=H(M,"FPS CAP: GAME",o.panel2,10,K(0,0.5))
a.pfRender=H(M,"STOP 3D: OFF",o.panel2,10,K(0.5,0.5))M=aj(28)a.pfCalm=H(M,"NO ANIMATIONS: OFF",o.panel2,10,K(0,1))
a.pfBases=H(aj(28),"BASES: ALL DRAWN",o.panel2,10,K(0,1))M=aj(28)a.pfMem=g2(M,tostring(d.MemLimit),"2000",K(0,0.24))
T(M,"MB: rejoin this server above it (0 = never)",9,o.dim,false,K(0.26,0.52))a.pfMemSet=H(M,"SET",o.accent,11,K(0.8,0.2))
a.pfInfo=T(aj(18),"",10,o.text,false)T(aj(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. BASES: OTHERS HIDDEN stops drawing other players' bases and stacks, ALL HIDDEN yours too (nothing is removed, so helping and farming work). HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,o.dim,false)
c5("THE ROUND SAB BUTTON")T(aj(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,o.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,eI)local sZ=O("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},lq)
a.tgRoot=O("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=o.accent,BorderSizePixel=0,Active=true},sZ)an(a.tgRoot,20)O("UIStroke",{Color=o.line,Thickness=1},a.tgRoot)
a.tgBtn=O("TextButton",{Text="SAB",Size=a3,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=o.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=O("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=o.dim,BorderSizePixel=0},a.tgRoot)
an(a.tgDot,4)a.tgGhost=O("TextButton",{Text="G: OFF",Size=UDim2 .new(0,46,0,18),Position=UDim2 .new(0.5,-23,1,4),
BackgroundColor3=o.panel2,Font=Enum.Font.GothamBold,TextSize=9,TextColor3=o.text,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
an(a.tgGhost,6)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()local hc=j.ghostMode()
local s0=hc==2 and o.accent or(hc==1 and o.warn or o.panel2)if a.ghostT then a.ghostT.Text,a.ghostT.BackgroundColor3=j.GHOST[hc][1],s0 end
if a.tgGhost then a.tgGhost.Text,a.tgGhost.BackgroundColor3=j.GHOST[hc][2],s0 end end local bn={built=false,boxes={},at=0}
local function s1(s2,lD)d.Targets[s2]=lD or nil local lE=bn.boxes[s2]if lE then lE.Text=lD and"X"or""lE.BackgroundColor3=lD and o.good or o.panel2
end end local function lF()for Bj,s3 in pairs(bn.boxes)do local s4=d.Targets[Bj]==true s3 .Text=s4 and"X"or""
s3 .BackgroundColor3=s4 and o.good or o.panel2 end end local eL local function Bk()local Bl=0 local lG=O("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=T(lG,"",10,o.dim,false,K(0,0.5))local Bm=H(lG,"CLEAR",o.panel2,10,K(0.5,0.24))local Bn=H(lG,"REFRESH",o.panel2,10,K(0.74,0.26))
Bm.MouseButton1Click:Connect(function()for Bo in pairs(d.Targets)do d.Targets[Bo]=nil end lF()end)Bn.MouseButton1Click:Connect(function()
ad.at=0 ii()eL(true)end)return Bl end eL=function(Bp)if not ii()then if not a.butEmpty then a.butEmpty=T(O("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,o.warn,false)end return end if bn.built and not Bp and bn.at==ad.at then return end
for EJ,lH in ipairs(a.but:GetChildren())do if lH:IsA("Frame")or lH:IsA("TextButton")then lH:Destroy()end end bn.boxes,a.butEmpty={},nil
Bk()local lI,lJ=36,1 local function s5(s6)lJ=lJ+1 local Bq=O("Frame",{Size=UDim2 .new(1,0,0,s6),BackgroundTransparency=1,LayoutOrder=lJ},a.but)
lI=lI+s6+6 return Bq end for EK,hd in ipairs(ad.rarOrder)do local Br=s5(24)local Bs=sI[hd]or o.text local lK=O("Frame",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0},Br)
an(lK,6)T(lK,"  "..hd:upper(),11,Bs,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local Bt=H(lK,"ALL",o.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local Bu=hd Bt.MouseButton1Click:Connect(function()local s7=ad.members[Bu]or{}local s8=false for EL,Bv in ipairs(s7)do if not d.Targets[Bv]then s8=true break end end
for EM,Bw in ipairs(s7)do s1(Bw,s8)end end)for EN,lL in ipairs(ad.members[hd]or{})do local Bx=s5(22)local he=O("TextButton",{Text="",Size=a3,BackgroundColor3=o.bg,BorderSizePixel=0,
AutoButtonColor=true},Bx)an(he,5)T(he,"   "..ai(lL),11,o.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local lM=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},he)an(lM,4)bn.boxes[lL]=lM local s9=lL local function s_()s1(s9,not d.Targets[s9])end
he.MouseButton1Click:Connect(s_)lM.MouseButton1Click:Connect(s_)end end lF()a.but.CanvasSize=UDim2 .new(0,0,0,lI+10)
bn.built,bn.at=true,ad.at end function L.paint()for By,ta in pairs(L.boxes)do local tb=d.CrateTicks[By]==true
ta.Text=tb and"X"or""ta.BackgroundColor3=tb and o.good or o.panel2 end if a.crtInfo then local lN,lO=0,0 for EO in pairs(L.boxes)do lN=lN+1 end
for EP,Bz in pairs(d.CrateTicks)do if Bz then lO=lO+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(lN,lO)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and o.accent or o.panel2
end end function L.build()for EQ,lP in ipairs(a.crt:GetChildren())do if lP:IsA("Frame")or lP:IsA("TextButton")then lP:Destroy()end
end L.boxes={}local lQ,lR=12,0 local function hf(tc)lR=lR+1 lQ=lQ+tc+6 return O("Frame",{Size=UDim2 .new(1,0,0,tc),BackgroundTransparency=1,LayoutOrder=lR},a.crt)
end local lS=hf(28)a.crtInfo=T(lS,"",10,o.dim,false,K(0,0.5))local BA=H(lS,"CLEAR",o.panel2,10,K(0.5,0.24))local BB=H(lS,"REFRESH",o.panel2,10,K(0.74,0.26))
V(BA.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))V(BB.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=H(hf(28),"",o.accent,11,K(0,1))V(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
T(hf(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,o.dim,false)
for ER,bo in ipairs(L.list())do local BC=hf(24)local eM=O("TextButton",{Text="",Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0,AutoButtonColor=true},BC)
an(eM,5)T(eM,"  "..(bo.title or bo.name)..(bo.guess and"  (?)"or""),11,sI[bo.rar or""]or o.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
T(eM,bo.price and("$"..aJ(bo.price))or(bo.rar or""),9,o.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local lT=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},eM)an(lT,4)L.boxes[bo.k]=lT local td=bo.k local function te()d.CrateTicks[td]=(not d.CrateTicks[td])or nil
L.paint()end V(eM.MouseButton1Click:Connect(te))V(lT.MouseButton1Click:Connect(te))end a.crt.CanvasSize=UDim2 .new(0,0,0,lQ+10)
L.built=L.at L.paint()end local tf="farm"local function bK(as)tf=as a.farm.Visible,a.but.Visible,a.set.Visible=(as=="farm"),(as=="but"),(as=="set")
a.crt.Visible=(as=="crt")a.pet.Visible,a.team.Visible=(as=="pet"),(as=="team")a.tabCrt.BackgroundColor3=(as=="crt")and o.accent or o.panel2
a.tabPet.BackgroundColor3=(as=="pet")and o.accent or o.panel2 a.tabTeam.BackgroundColor3=(as=="team")and o.accent or o.panel2
if as=="pet"and not l.built then pcall(l.build)end if as=="team"and not y.built then pcall(y.build)end if as=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(as=="farm")and o.accent or o.panel2 a.tabBut.BackgroundColor3=(as=="but")and o.accent or o.panel2
a.tabSet.BackgroundColor3=(as=="set")and o.accent or o.panel2 if as=="but"then eL(false)end end local function N(hg,hh,BD,BE)
a.put(hg,hh and BD or BE)if a.lit[hg]~=hh then a.lit[hg]=hh hg.BackgroundColor3=hh and o.accent or o.panel2 end
end l.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function l.paintRow(th)
local ck=l.rows and l.rows[th]if not ck then return end local eN=d.Pets[th]or{}ck.b.BackgroundColor3=eN.b and o.good or o.panel2
ck.g.BackgroundColor3=eN.g and o.accent or o.panel2 ck.g.Text=eN.g and"BIG"or"ANY"ck.w.BackgroundColor3=eN.w and o.warn or o.panel2
local hi=tonumber(eN.f)or 0 ck.f.Text=hi>=7 and"7 BIG/HUGE"or(hi>0 and(hi.." BIG")or"FUSE")ck.f.BackgroundColor3=hi>0 and o.good or o.panel2
end function l.flag(lU,hj)local a6=d.Pets[lU]or{}if hj=="f"then local BF={[0]=1,[1]=2,[2]=3,[3]=7}local ti=BF[tonumber(a6 .f)or 0]or 0
a6 .f=ti>0 and ti or nil elseif a6[hj]then a6[hj]=nil else a6[hj]=true end d.Pets[lU]=(a6 .b or a6 .g or a6 .w or a6 .f)and a6 or nil
l.paintRow(lU)end function l.paintAll()for BG in pairs(l.rows or{})do l.paintRow(BG)end if a.pbT then N(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function l.live()if not l.built then l.build()return end if x()-(l.liveAt or 0)<1 then return end l.liveAt=x()
local tj=l.wishes()local eO=l.data()for hk,hl in pairs(l.rows)do hl.name.Text=l.nice(hk)..(tj[hk]and("   * wish %dm"):format(math.ceil(tj[hk]/60))or"")
local tk=A.status(hk,eO)hl.desc.Text=tk and(tk.." | "..hl.boostText)or hl.boostText end local tl=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eO and#(eO.pets or{})or 0,eO and tonumber(eO.maxOwned)or 60,
aJ(l.money()),tl>0 and(" | free wishes "..tl)or"",l.buyMsg~=""and l.buyMsg or"-",l.wishMsg~=""and l.wishMsg or"-")
end function l.build()local hm=l.info()for ES,lV in ipairs(a.pet:GetChildren())do if lV:IsA("Frame")or lV:IsA("TextLabel")then lV:Destroy()end
end l.rows={}local lW,hn=0,12 local function c6(tm)lW,hn=lW+1,hn+tm+6 return O("Frame",{Size=UDim2 .new(1,0,0,tm),BackgroundTransparency=1,LayoutOrder=lW},a.pet)
end local lX=c6(28)a.pbT=H(lX,"AUTO ADOPT: OFF",o.panel2,9,K(0,0.34))a.pwT=H(lX,"AUTO WISH: OFF",o.panel2,9,K(0.34,0.33))
a.pfT=H(lX,"AUTO FUSE: OFF",o.panel2,9,K(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy l.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish l.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse l.paintAll()end)
a.pInfo=T(c6(44),"",10,o.dim,false)T(c6(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,o.dim,false)
if not hm then T(c6(30),"pet list not loaded yet - open this tab again in a moment",11,o.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,hn)
l.built=false return end local c7={}for ET,tn in ipairs(l.order())do local lY=hm.Pets[tn].rarity or"?"c7[lY]=c7[lY]or{}
table.insert(c7[lY],tn)end local c8={}for EU,to in ipairs(hm.Rarities or{})do if c7[to]then c8[#c8+1]=to end end
for tp in pairs(c7)do if not table.find(c8,tp)then c8[#c8+1]=tp end end for EW,ho in ipairs(c8)do local tq=O("Frame",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0},c6(22))
an(tq,6)T(tq,"  "..ho:upper(),11,l.RC[ho]or o.text,true)for EX,hp in ipairs(c7[ho])do local cl=O("Frame",{Size=a3,BackgroundColor3=o.bg,BorderSizePixel=0},c6(38))
an(cl,5)local BH=T(cl,l.nice(hp),11,l.RC[ho]or o.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local BI,BJ=pcall(function()return hm.describe(hp)end)
local tr=BI and tostring(BJ)or""local BK=T(cl,tr,9,o.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local ts=H(cl,"BUY",o.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local tt=H(cl,"ANY",o.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local tu=H(cl,"WISH",o.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local tv=H(cl,"FUSE",o.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local hq=hp ts.MouseButton1Click:Connect(function()l.flag(hq,"b")end)
tt.MouseButton1Click:Connect(function()l.flag(hq,"g")end)tu.MouseButton1Click:Connect(function()l.flag(hq,"w")end)
tv.MouseButton1Click:Connect(function()l.flag(hq,"f")end)l.rows[hp]={b=ts,g=tt,w=tu,f=tv,name=BH,desc=BK,boostText=tr}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,hn+10)l.built=true l.paintAll()end function j.paint()N(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(a.pfCalm,d.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")N(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")
N(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")N(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])
N(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end
end function j.applyAll()if d.Lite then j.lite(true)end if d.Calm then j.calm(true)end if d.HideHud then j.hideHud(true)end
if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end
j.paint()end V(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))V(a.pfCalm.MouseButton1Click:Connect(function()j.calm(not d.Calm)j.paint()end))
V(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))V(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))
V(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))V(a.pfFps.MouseButton1Click:Connect(function()
local BL=table.find(j.CAPS,d.FpsCap or 0)or 1 local tw=j.CAPS[(BL%#j.CAPS)+1]if not j.cap(tw)and tw~=0 then z("this executor cannot cap fps")end
j.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()local lZ=tonumber(a.pfMem.Text)if lZ and lZ>=0 then d.MemLimit=math.floor(lZ)end
j.paint()end))function y.names()local l0={"(none)"}for EY,BM in ipairs((y.teams()))do l0[#l0+1]=BM.name end return l0
end function y.cycle(l1,BN)local hr=y.names()local BO=d[l1]~=""and d[l1]or"(none)"local hs=table.find(hr,BO)or 1
hs=((hs-1+BN)%#hr)+1 d[l1]=hr[hs]=="(none)"and""or hr[hs]y.paint()end function y.paint()if not y.built then return end
N(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")N(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")
local l2={}for EZ,BP in ipairs((y.teams()))do l2[BP.name]=true end for BQ,tx in pairs(y.pick)do local c9=d[BQ]
tx.Text=c9==""and"(none)"or(l2[c9]and c9 or(c9 .." (missing)"))tx.TextColor3=(c9~=""and not l2[c9])and o.bad or o.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(y.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(y.switches,y.finished,y.glazed,A.fused)
..(A.buildMsg~=""and("\n"..A.buildMsg)or"")local BR,ht=l.srv(),{}for E0,hu in ipairs(y.list or{})do ht[#ht+1]=("st %-2s %-22s %9s  helps %d"):format(hu.st.Name,ai(aa(hu.name)):sub(1,22),y.clock(hu.ends-BR),hu.helps)
end a.tmList.Text=#ht>0 and table.concat(ht,"\n")or"no waxes running"end function y.build()for E1,l3 in ipairs(a.team:GetChildren())do
if l3:IsA("Frame")or l3:IsA("TextLabel")then l3:Destroy()end end y.pick={}local l4,l5=0,12 local function bL(ty)
l4,l5=l4+1,l5+ty+6 return O("Frame",{Size=UDim2 .new(1,0,0,ty),BackgroundTransparency=1,LayoutOrder=l4},a.team)
end local function eP(BS)T(bL(14),BS,10,o.dim,true)end local function hv(hw)local l6=bL(26)local BT=H(l6,"<",o.panel2,11,K(0,0.14))
local tz=H(l6,"(none)",o.panel,10,K(0.14,0.72))local BU=H(l6,">",o.panel2,11,K(0.86,0.14))BT.MouseButton1Click:Connect(function()y.cycle(hw,-1)end)
BU.MouseButton1Click:Connect(function()y.cycle(hw,1)end)tz.MouseButton1Click:Connect(function()y.cycle(hw,1)end)
y.pick[hw]=tz end a.tmT=H(bL(28),"AUTO TEAMS: OFF",o.panel2,11,K(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=y.current()end y.paint()end)a.tmInfo=T(bL(42),"",10,o.dim,false)
local tA=bL(26)a.tmBuild=H(tA,"AUTO BUILD TEAMS: OFF",o.panel2,9,K(0,0.62))a.tmBuildNow=H(tA,"BUILD NOW",o.warn,9,K(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild y.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if y.editing then return end A.buildMsg="building..."task.spawn(function()local BV,BW=pcall(A.rebuild,"you asked")if not BV then z("BUILD ERR "..tostring(BW))end end)
end)eP("NORMAL TEAM  (worn the rest of the time)")hv("TeamNormal")eP("FULL TEAM  (every station busy: money + wax speed)")
hv("TeamFull")eP("GLAZE TEAM  (worn just before a wax finishes)")hv("TeamGlaze")local l7=bL(26)a.tmLead=g2(l7,tostring(d.GlazeLead),"45",K(0,0.2))
T(l7,"sec before it finishes",10,o.dim,false,K(0.22,0.5))local BX=H(l7,"SET",o.accent,11,K(0.75,0.25))BX.MouseButton1Click:Connect(function()
local hx=tonumber(a.tmLead.Text)if hx and hx>=5 and hx<=600 then d.GlazeLead=math.floor(hx)else a.tmLead.Text=tostring(d.GlazeLead)end
y.paint()end)eP("WAX TEAM  (worn while a butter is placed: head starts)")hv("TeamWax")eP("YOUR WAXES  (time left, helps)")
a.tmList=O("TextLabel",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bL(150))an(a.tmList,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
T(bL(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,o.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,l5+10)y.built=true y.paint()end local function BY()a.secB.Text=tostring(d.Every)
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ae(0.1)end if not D.home then pcall(j.unpin)end end)end
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then ev(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bJ(a.root)bJ(a.tgRoot)c.lastCollect=x()
lF()L.paint()pcall(l.paintAll)pcall(y.paint)pcall(j.applyAll)end local function BZ(tB)task.spawn(function()tB.TextColor3=o.bad
task.wait(0.8)if c.alive then tB.TextColor3=o.text end end)end local function tC()local tD=a.secB.Text:match("^%s*(%d+)%s*$")
local eQ=tD and tonumber(tD)if not eQ or eQ<1 then a.secB.Text=tostring(d.Every)BZ(a.secB)z("interval must be a whole number >= 1")
return end if eQ==d.Every then return end d.Every,c.lastCollect=eQ,x()z("collect every "..eQ.."s")end local function P(B0,B1)V(B0 .MouseButton1Click:Connect(B1))end
P(a.secSet,tC)V(a.secB.FocusLost:Connect(tC))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(ar,"selling...",rt)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(C.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help D.nextAt,D.msg=0,d.Help and"looking for waxes to help"or"off"N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests E.at=0 N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire J.nextAt,J.fails,J.lost=0,0,0 N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,j.cycleGhost)function q.paint()N(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")N(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
N(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")N(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(B2)task.spawn(function()pcall(q.tick)if B2 and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end P(a.ixT,function()local B3=q.on()d.AutoIndex=not d.AutoIndex q.discAt=-100 q.changed(B3)end)
P(a.bestT,function()local B4=q.on()d.Best=((d.Best or 0)+1)%5 q.stackAt=-100 q.changed(B4)end)P(a.bcT,function()
local B5=q.on()d.BestCrate=not d.BestCrate q.changed(B5)end)P(a.shT,function()d.Shower=not d.Shower q.paint()
end)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(ar,"opening crate...",dJ,true)
end)P(a.padB,function()c.plot=bp()or c.plot local tE,l8=ao(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(tE and l8 and l8:IsA("BasePart"))then z("SET PAD: need character and plot")return end c.manualPad=l8 .CFrame:ToObjectSpace(tE.HumanoidRootPart.CFrame)
zr(c.manualPad)z("collect pad saved at your position")end)P(a.startB,function()ev(not c.running)end)P(a.buyB,function()
c.plot=bp()or c.plot task.spawn(ar,"buying (manual)...",n0,true)end)P(a.plB,function()c.plot=bp()or c.plot task.spawn(ar,"waxing (manual)...",n4)
end)P(a.tabFarm,function()bK("farm")end)P(a.tabBut,function()bK("but")end)P(a.tabSet,function()bK("set")end)P(a.tabCrt,function()bK("crt")end)
P(a.tabPet,function()bK("pet")end)P(a.tabTeam,function()bK("team")end)local function B6(l9)c.hidden=l9 a.root.Visible=not l9
a.tgBtn.Text=l9 and"SAB+"or"SAB"end sQ(a.tgBtn,a.tgRoot,function()bJ(a.tgRoot)c.togPos=g6(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then B6(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aH,av={},0
local function bM()aH=nn()if#aH==0 then a.cfgPick.Text="(none saved)"av=0 return end if av<1 or av>#aH then av=1 end
a.cfgPick.Text=aH[av]..("  (%d/%d)"):format(av,#aH)end local function tF()local tG=c.autoload~=nil a.cfgAuto.Text=tG and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=tG and o.accent or o.panel2 end local function l_()local tH=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if tH~=""then return tH end return(av>0 and aH[av])or""end P(a.cfgSave,function()c.winPos=g6(a.root)or c.winPos
c.togPos=g6(a.tgRoot)or c.togPos local tI,tJ=ft(l_())a.cfgMsg.Text=tI and("saved as "..tJ)or("could not save: "..tJ)
a.cfgMsg.TextColor3=tI and o.good or o.bad bM()z(a.cfgMsg.Text)end)local function B7(ma)local mb,tK=nw(ma)a.cfgMsg.Text=mb and("loaded "..tK)or("could not load: "..tK)
a.cfgMsg.TextColor3=mb and o.good or o.bad if mb then a.cfgName.Text=ma BY()task.spawn(C.apply,"config "..ma)
end z(a.cfgMsg.Text)end P(a.cfgLoad,function()B7(l_())end)P(a.cfgPick,function()bM()if av>0 then a.cfgName.Text=aH[av]end
end)P(a.cfgPrev,function()if#aH==0 then bM()return end av=(av-2)%#aH+1 bM()a.cfgName.Text=aH[av]end)P(a.cfgNext,function()
if#aH==0 then bM()return end av=av%#aH+1 bM()a.cfgName.Text=aH[av]end)P(a.cfgAuto,function()if c.autoload then
ny(nil)a.cfgMsg.Text="it will not load a config on launch"else local eR=l_()local tL=false for E2,B8 in ipairs(nn())do if B8==eR then tL=true end end
local B9=tL or ft(eR)if B9 and eR~=""then ny(eR)bM()a.cfgMsg.Text=eR.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=o.dim tF()end)P(a.autoB,function()
local tM,tN=vH()a.autoMsg.Text=tM and("installed. "..tN)or("failed: "..tN)a.autoMsg.TextColor3=tM and o.good or o.bad
z(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()ds("you asked")end)
local bN=false P(a.minB,function()bN=not bN a.tabs.Visible=not bN if bN then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bK(tf)end a.root.Size=UDim2 .new(0,ak.w,0,bN and(ak.head+ak.strip)or ak.h)
a.minB.Text=bN and"+"or"-"end)local function hy()if not c.alive then return end c.alive,c.running=false,false
pcall(j.restoreAll)pcall(e4)for E3,B_ in ipairs(hI)do pcall(function()B_:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()lr:Destroy()end)pcall(function()sZ:Destroy()end)if co.SAB_KILL==hy then co.SAB_KILL=nil end end
co.SAB_KILL=hy P(a.killB,hy)P(a.xB,hy)sQ(a.title,a.root,function()bJ(a.root)c.winPos=g6(a.root)or c.winPos end)
local function tO()local eS,cm=c.reason,c.level if c.busy then eS,cm=c.busyText,"ok"elseif not c.running then
local E4,tP,Ca=r2()if c.capHit then eS,cm=tP,"bad"else eS,cm="[stopped] "..tP,(Ca=="bad")and"bad"or"idle"end c.reason,c.level=eS,cm
end local hz=c.running and o.good or(c.capHit and o.bad or o.dim)if a.lit.dot~=hz then a.lit.dot=hz a.dot.BackgroundColor3,a.tgDot.BackgroundColor3=hz,hz end
if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and o.panel2 or o.accent end if c.hidden then return end
a.put(a.reason,eS)if a.lit.bar~=cm then a.lit.bar=cm a.bar.BackgroundColor3=AB[cm]or o.dim end if bN then return end
if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and o.warn or o.good
end N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")local bO=vh()if a.farm.Visible then
local Cb,Cc=e1()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Cb.."/"..Cc)local tQ=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local tR=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aJ(a7()),c.rolls,c.gifts,c.crates,tR and ai(aa(tR))or"nothing",e.on and("   ["..e.title.." window open]")or"",
tQ and("in "..tQ.."s")or"off"))a.put(a.tgt,(#bO==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bO<=3)and table.concat(bO,", ")or(#bO.." butters ticked"))))
if a.lit.tgt~=(#bO==0)then a.lit.tgt=(#bO==0)a.tgt.TextColor3=(#bO==0)and o.bad or o.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(eV,"\n")end
end if a.set.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bO))
end if a.but.Visible and bn.at~=ad.at then eL(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then l.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak)
end if a.team.Visible then y.paint()end if a.farm.Visible then a.put(a.helpL,"help: "..((d.Help or d.HelpGuild)and D.msg or"off"))
a.put(a.campL,"camp: "..(d.Campfire and J.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests: "..(d.Quests and(E.msg~=""and E.msg or"checking...")or"off"))a.put(a.ixL,q.msg)N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local tS=(C.rec.on and"on"or"")..(C.rec.off and((C.rec.on and"/"or"").."off")or"")
a.put(a.arL,C.msg~=""and C.msg or("auto roll: game %s | learned %s%s"):format(C.isOn()and"ON"or"off",tS~=""and tS or"nothing yet",#C.rec.rules>0 and", choices"or""))
if a.lit.arL~=(C.msg~="")then a.lit.arL=(C.msg~="")a.arL.TextColor3=C.msg~=""and o.warn or o.dim end end end co.SAB={S=c,CFG=d,EV=W,U=a,sg=lr,CAT=ad,LEARN=ah,buildList=eL,
logAll=c_,evAll=da,AR=C,CR=L,PF=j,PX=l,TM=y,CRATE=e,FU=A,HX=D,CF=J,QX=E,IX=q,SH=Q}z(cn.." loaded")if c.uiErrs>0 then z("UI: "..c.uiErrs.." properties skipped")end
bK("farm")bJ(a.root)bJ(a.tgRoot)if g3 then pcall(function()V(g3:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bJ(a.root)bJ(a.tgRoot)end))end)end bM()tF()if c.config and c.config~=""then a.cfgName.Text=c.config end
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(tO)task.spawn(function()local tT=vF()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(tT and("\n(backup: "..tT..")")or"")
local tU=fn(al.exec)if tU and not tU:find("SAB autoloader v2",1,true)then dn(al.exec,al.stub)z("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fn(al.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(vN)end)task.spawn(function()while c.alive do local Cd,Ce=pcall(tO)if not Cd then z("UI ERR "..tostring(Ce))end
task.wait((c.hidden or bN)and 1.5 or 0.4)end end)task.spawn(function()local Cf,Cg=pcall(vV)if not Cf then z("HOOK ERR "..tostring(Cg))end
end)task.spawn(function()pcall(uE)if e.loadSeq and not e.learned then local hA={}for tV=1,20 do if e.loadSeq[tV]then hA[#hA+1]=e.loadSeq[tV]end end
if#hA>0 then e.learned={seq=hA,mode=e.loadMode}z("remembered how to open crates directly")end end if ii()then z(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local Ch,tW=pcall(zt)if Ch and tW and c.alive and not c.manualPad then c.manualPad=tW end end)task.spawn(function()
while c.alive do local mc,md=pcall(l.buyTick)if not mc then z("PET ERR "..tostring(md))task.wait(5)end mc,md=pcall(l.wishTick)
if not mc then z("WISH ERR "..tostring(md))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local hB,tX=0,x()
V(game:GetService("RunService").Heartbeat:Connect(function()hB=hB+1 end))V(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=x()while c.alive do task.wait(1)local tY=x()j.fps,hB,tX=hB/math.max(tY-tX,0.001),0,tY local Ci,Cj=pcall(j.tick)
if not Ci then z("PERF ERR "..tostring(Cj))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local Ck,Cl=pcall(A.tick)if not Ck then z("FUSE ERR "..tostring(Cl))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local Cm,Cn=pcall(y.tick)if not Cm then z("TEAM ERR "..tostring(Cn))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local hC=ag:WaitForChild("Remotes",30)local tZ=hC and hC:WaitForChild("ClanEvent",30)
if tZ and c.alive then V(tZ.OnClientEvent:Connect(function(Co,Cp)if Co=="call"then pcall(D.onCall,Cp)end end))
end local t0=hC and hC:FindFirstChild("RollConfirmAsk")if t0 and c.alive then V(t0 .OnClientEvent:Connect(function(Cq)E.asked=Cq or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if d.Calm then pcall(j.calmScan)end end end)task.spawn(function()
local me=ag:WaitForChild("Remotes",30)if not(me and c.alive)then return end local function hD(Cr,Cs)local mf=me:FindFirstChild(Cr)
if mf and mf:IsA("RemoteEvent")then V(mf.OnClientEvent:Connect(function(...)pcall(Cs,...)end))end end hD("NewSquishyDiscovered",function(mg,t1)
if type(mg)~="string"then return end q.disc=q.disc or{}q.disc[aa(mg)]=true z(("INDEX: %s%s is in your Index now"):format(ai(aa(mg)),t1 and(" ("..tostring(t1)..")")or""))
end)hD("IndexRefresh",q.loadDisc)hD("IndexRowComplete",function(Ct)z("INDEX: the whole "..tostring(Ct).." row is complete")end)
hD("AdminShow",q.admin)local t2=me:FindFirstChild("AdminShowSync")if t2 then local Cu,t3=pcall(function()return t2:InvokeServer()end)
if Cu and type(t3)=="table"then for E5,Cv in pairs(t3)do pcall(Q.add,Cv)end end end while c.alive do local Cw,Cx=pcall(q.tick)
if not Cw then q.msg="index error: "..tostring(Cx)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Cy,Cz=pcall(E.tick)if not Cy then z("QUEST ERR "..tostring(Cz))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(e4)end end)pcall(C.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local CB=(type(newcclosure)=="function")and newcclosure or function(CA)return CA end local mh
local t4=(type(setnamecallmethod)=="function")and setnamecallmethod or nil mh=hookmetamethod(game,"__namecall",CB(function(t5,...)
local eT=getnamecallmethod()if c.alive and(eT=="InvokeServer"or eT=="FireServer")then local t6,t7=pcall(function()return t5 .Name end)
if t6 and t7=="CrateAction"and not e.replaying then pcall(e.saw,eT,...)elseif t6 and t7=="AutoRollAction"and not C.replaying then pcall(C.saw,eT,...)end
if t4 then t4(eT)end end return mh(t5,...)end))e.oldNC=mh end)end if hG then V(F.Idled:Connect(function()pcall(function()hG:CaptureController()hG:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for E6=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and ao()and(c.plot or bp())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then C.apply("joined")end while c.alive do task.wait(30)local hE=bT()
if hE and q.on()and not aI(hE.name)then hE=nil end if c.alive and d.AutoRoll and c.running and not C.isOn()and not hE and not ac()
and not e.waiting and not e.on and not c.busy then C.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for E7=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bp()if ao()and c.plot and q.any()then ev(true,true)z("started by itself")
return end task.wait(1)end if c.alive and not c.running then z("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bp()c.lastCollect=x()while c.alive do if c.running then local CC,t8=pcall(Aw)if not CC and t8~=hH then z("LOOP ERR "..tostring(t8))end
end task.wait(0.1)end end)hF("loaded - window is at the top left")end local CE,mi=xpcall(ub,function(CD)return tostring(CD).."\n"..debug.traceback()end)
if not CE then pcall(function()warn("SAB "..cn.." ERROR: "..tostring(mi))end)hF("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cn.." ERROR: "..tostring(mi))end)pcall(function()local t9=(type(getgenv)=="function"and getgenv())or _G
if type(t9 .SAB_KILL)=="function"then t9 .SAB_KILL()end for E8,CG in ipairs({"SABFarmGui","SABToggle"})do local t_=F.PlayerGui:FindFirstChild(CG)
if t_ then t_:Destroy()end end end)pcall(function()local eU=Instance.new("ScreenGui")eU.Name="SABError"eU.ResetOnSpawn=false
eU.DisplayOrder=1000 local aY=Instance.new("TextBox")aY.Size=UDim2 .new(0,340,0,170)aY.Position=UDim2 .new(0,10,0,50)
aY.BackgroundColor3=Color3 .fromRGB(90,20,20)aY.TextColor3=Color3 .new(1,1,1)aY.TextSize=11 aY.TextWrapped=true
aY.ClearTextOnFocus=false aY.TextXAlignment=Enum.TextXAlignment.Left aY.TextYAlignment=Enum.TextYAlignment.Top
aY.Text="SAB "..cn.." failed to start. Send this text:\n"..tostring(mi)aY.Parent=eU eU.Parent=F:WaitForChild("PlayerGui")
end)end
