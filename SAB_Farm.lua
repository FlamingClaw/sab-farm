local cn="v26"local ma=game:GetService("Players")local F=ma.LocalPlayer or ma.PlayerAdded:Wait()local function hB(tZ)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..cn,Text=tZ,Duration=6})
end)end hB("script started")local function t0()local ag=game:GetService("ReplicatedStorage")local au=game:GetService("Workspace")
local mb=game:GetService("UserInputService")local co=(type(getgenv)=="function"and getgenv())or _G if type(co.SAB_KILL)=="function"then pcall(co.SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local hC=(function()local t1,t2=pcall(function()return game:GetService("VirtualUser")end)return t1 and t2 or nil end)()
local d={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,HideBases=false,HideMine=false,MemLimit=2000,Help=false,HelpGuild=false,
Campfire=true,Ghost=false,GhostHelps=false,Quests=true,AutoIndex=false,Best=0,BestCrate=false,Shower=true,}local c={
alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=x(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local W={name=nil,rar=nil,at=x(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local C={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local e={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local l,y,j,A,D,J,E={},{},{},{},{},{},{}local q,Q={},{}local hD={}local hE,eT,c_,da={},{},{},{}local function V(mc)hE[#hE+1]=mc return mc end
local function af(t3)task.wait(t3)if not c.alive then error(hD,0)end end local function z(eU)eU=os.date("%H:%M:%S").." "..tostring(eU)
table.insert(eT,1,eU)if#eT>6 then table.remove(eT)end c.logN=(c.logN or 0)+1 c_[#c_+1]=eU if#c_>80 then table.remove(c_,1)end
end local function eV(md)if type(md)~="string"then return""end return(md:lower():gsub("[^%w]",""))end local function aa(t4)
local me=eV(t4)local hF=me:gsub("butter$","")if hF==""then hF=me end return hF end local function aI(mf)if type(mf)~="string"then return false end
local hG=aa(mf)if hG==""then return false end if q.want then return q.want(hG)end return d.Targets[hG]==true end
local function t5(db)db=db:lower()return db:find("squishy",1,true)~=nil or db:match("butter$")~=nil or db:match("butter[^%a]")~=nil
end local hH={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aJ(dc)if type(dc)~="number"then return"?"end
local eW=1 while math.abs(dc)>=1000 and eW<#hH do dc=dc/1000 eW=eW+1 end local t6=string.format("%.2f",dc):gsub("%.?0+$","")
return t6 ..hH[eW]end local function t7(mg)if type(mg)~="string"then return nil end local t8,mh=mg:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local hI=tonumber(t8)if not hI then return nil end if mh==""then return hI end for t9,t_ in ipairs(hH)do if t_:lower()==mh:lower()then return hI*1000^(t9-1)end end
return nil end local function a7()local mi=F:GetAttribute("BoardValueMoney")if type(mi)=="number"then return mi end
local mj=F:FindFirstChild("leaderstats")if mj then for Ck,ua in ipairs({"Cash","Money","Coins"})do local hJ=mj:FindFirstChild(ua)
if hJ and type(hJ.Value)=="number"then return hJ.Value end end end end local function eX(ub)local hK=ub:GetFullName()
if c.plot then local hL=c.plot:GetFullName()if hK:sub(1,#hL)==hL then return hK:sub(#hL+2)end end return hK end
local function ar()local eY=F.Character if eY and eY:FindFirstChild("HumanoidRootPart")then local mk=eY:FindFirstChildOfClass("Humanoid")
if mk and mk.Health>0 then return eY end end end local function bp()local hM=au:FindFirstChild("Plots")if not hM then return nil end
local function ml(uc)local mm=uc:FindFirstChild("Plate")return mm~=nil and mm:FindFirstChild("EditStackAttachment",true)~=nil
end local mn=F:GetAttribute("PlotNumber")if mn~=nil then local hN=hM:FindFirstChild(tostring(mn))if hN and ml(hN)then return hN end
end for Cl,mo in ipairs(hM:GetChildren())do if ml(mo)then return mo end end end local function dd(mp)local bq=mp and mp.Parent
for Cm=1,6 do if not bq then return nil end if bq:IsA("BasePart")then return bq end if bq:IsA("Model")then return bq.PrimaryPart or bq:FindFirstChildWhichIsA("BasePart",true)end
bq=bq.Parent end end local function mq(mr)local hO=mr.Parent if hO and hO:IsA("Attachment")then return hO.WorldPosition end
local ms=dd(mr)return ms and ms.Position end local function mt()local cp=c.plot and c.plot:FindFirstChild("Plate")
if not cp then return nil end if cp:IsA("BasePart")then return cp.Position end if cp:IsA("Model")then return cp:GetPivot().Position end
local mu=cp:FindFirstChildWhichIsA("BasePart",true)return mu and mu.Position end local function mv()local hP={}
local mw=c.plot and c.plot:FindFirstChild("WaxStations")if mw then for Cn,ud in ipairs(mw:GetChildren())do local mx=ud:FindFirstChild("SquishyPlaceHolder")
local hQ=mx and mx:FindFirstChild("PlacePrompt")if hQ and hQ:IsA("ProximityPrompt")then hP[#hP+1]=hQ end end end
return hP end local function eZ()local my,hR=mv(),0 for Co,ue in ipairs(my)do if ue.Enabled then hR=hR+1 end end
local hS=#my local hT=F:GetAttribute("WaxStations")if type(hT)=="number"and hT>hS then hS=hT end return hR,hS
end local function uf()local mz=ar()local mA=mz and mz.HumanoidRootPart.Position local hU,mB for Cp,hV in ipairs(mv())do
if hV.Enabled then local mC=mq(hV)local mD=(mC and mA)and(mC-mA).Magnitude or 1e9 if not hU or mD<mB then hU,mB=hV,mD end
end end return hU end local function mE()local e0=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not e0 then return nil end local mF=e0:FindFirstChild("BuyPromptAttachment")local e1=(mF and mF:FindFirstChild("BuyPrompt"))or e0:FindFirstChild("BuyPrompt",true)
if e1 and e1:IsA("ProximityPrompt")and e1:IsDescendantOf(e0)then return e1 end end local mG={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local ug={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ah={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local hW="SAB_order.txt"local function e2()if not ah.dirty or type(writefile)~="function"then return end local aA={}
for uh,ui in pairs(ah.price)do aA[#aA+1]="P|"..uh.."|"..string.format("%.0f",ui)end for uj,uk in pairs(ah.order)do aA[#aA+1]="O|"..uj.."|"..table.concat(uk,",")end
if e.learned and e.enc then aA[#aA+1]="M|mode|"..tostring(e.learned.mode or"")for ul,e3 in ipairs(e.learned.seq)do
local mH={}for mI=1,e3 .n do mH[mI]=e.enc(e3 .args[mI])end aA[#aA+1]=("A|%d|%s|%d|%s"):format(ul,e3 .m,e3 .n,table.concat(mH,";"))
end end local function hX(um,uo,e4)local mJ={}for mK=1,e4 .n do mJ[mK]=e.enc(e4 .args[mK])end aA[#aA+1]=("R|%d|%s|%s|%d|%s"):format(uo,um,e4 .m,e4 .n,table.concat(mJ,";"))
end if e.enc then for up,uq in ipairs(C.rec.rules)do hX("rules",up,uq)end if C.rec.on then hX("on",0,C.rec.on)end
if C.rec.off then hX("off",0,C.rec.off)end end for Cq,de in pairs(L.seen)do aA[#aA+1]=("K|%s|%s|%s|%s"):format(de.name,de.title or"",de.rar or"",de.price and string.format("%.0f",de.price)or"")
end if pcall(writefile,hW,table.concat(aA,"\n"))then ah.dirty=false end end local function ur()if type(isfile)~="function"or type(readfile)~="function"then return end
local us,ut=pcall(isfile,hW)if not(us and ut)then return end local uu,mL=pcall(readfile,hW)if not(uu and type(mL)=="string")then return end
for uv in mL:gmatch("[^\n]+")do local cq,cr,a8=uv:match("^(%a)|([^|]+)|(.*)$")if cq=="P"then ah.price[cr]=tonumber(a8)
elseif cq=="M"then e.loadMode=(a8~=""and a8~="nil")and a8 or nil elseif cq=="A"and e.dec then local mM=tonumber(cr)
local mN,e5,uw=a8:match("^([^|]+)|(%d+)|(.*)$")if mM and mN then e5=tonumber(e5)local mO,e6={},0 for ux in(uw..";"):gmatch("([^;]*);")do
e6=e6+1 if e6<=e5 then mO[e6]=e.dec(ux)end end e.loadSeq=e.loadSeq or{}e.loadSeq[mM]={m=mN,n=e5,args=mO}end elseif cq=="R"and e.dec then
local mP=tonumber(cr)local e7,uy,e8,uz=a8:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if mP and e7 then e8=tonumber(e8)
local mQ,e9={},0 for uA in(uz..";"):gmatch("([^;]*);")do e9=e9+1 if e9<=e8 then mQ[e9]=e.dec(uA)end end local hY={m=uy,n=e8,args=mQ}
if e7=="rules"then C.rec.rules[mP]=hY elseif e7=="on"then C.rec.on=hY elseif e7=="off"then C.rec.off=hY end end
elseif cq=="K"then local mR,mS,uB=a8:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cr)]={name=cr,title=mR~=""and mR or nil,
rar=mS~=""and mS or nil,price=tonumber(uB)}elseif cq=="O"and a8~=""then local e_={}for uC in a8:gmatch("[^,]+")do e_[#e_+1]=uC end
if#e_>0 then ah.order[cr]=e_ end end end end local function uD(fa)if type(fa)~="table"then return end local bP,mT=fa.rarity,fa.contents
if type(bP)~="string"or bP==""or type(mT)~="table"then return end local df={}for Cr,fb in ipairs(mT)do if type(fb)=="table"and type(fb.butter)=="string"then
df[#df+1]={n=fb.butter,ch=tonumber(fb.chance)or 0}end end if#df==0 then return end table.sort(df,function(uE,uF)return uE.ch>uF.ch end)
local dg,dh={},false for uG,uH in ipairs(df)do dg[uG]=uH.n end local hZ=ah.order[bP]if not hZ or#hZ~=#dg then dh=true end
if not dh then for mU=1,#dg do if hZ[mU]~=dg[mU]then dh=true break end end end ah.order[bP]=dg local h0=tonumber(fa.price)
if h0 and ah.price[bP]~=h0 then ah.price[bP]=h0 dh=true end if dh then ah.dirty=true ad.at=0 z("learned the "..bP.." order from its crate")
end end local function cs(uI,uJ)local uK=uI:FindFirstChild(uJ,true)local uL,h1=pcall(function()return uK.Text end)
return(uL and type(h1)=="string"and h1~="")and h1 or nil end local function ai(mV)return ad.pretty[mV]or mV end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(uM)return eV(uM or"")end
function L.learn(a9)if type(a9)~="table"or type(a9 .name)~="string"then return end local h2=L.key(a9 .name)local a_=L.seen[h2]or{}
local uN=(L.seen[h2]==nil)or(tonumber(a9 .price)and a_.price~=tonumber(a9 .price))a_.name,a_.title=a9 .name,a9 .title or a_.title
a_.rar,a_.price=a9 .rarity or a_.rar,tonumber(a9 .price)or a_.price L.seen[h2]=a_ if uN then L.at,ah.dirty=x(),true end
end function L.wanted(mW)if mW==nil then return false end local h3=L.key(mW)return d.CrateTicks[h3]==true or(d.BestCrate and q.bestCrate~=nil and(h3==q.bestCrate or h3==q.bestCrateTitle))
end function L.list()local ct={}for uO,fc in ipairs(L.base)do ct[L.key(fc[1])]={name=fc[1],title=fc[2],rar=fc[3],i=uO}end
for Cs,di in ipairs(ad.rarOrder)do local mX=false for Ct,uP in pairs(ct)do if uP.rar==di then mX=true break end end
if not mX and di~="?"then local mY=di:gsub("[^%w]","").."Crate"ct[L.key(mY)]={name=mY,title=di.." Crate",rar=di,i=50,guess=true}
end end for mZ,fd in pairs(L.seen)do local aZ=ct[mZ]or{i=100}aZ.name,aZ.title,aZ.rar=fd.name or aZ.name,fd.title or aZ.title,fd.rar or aZ.rar
aZ.price,aZ.guess=fd.price or aZ.price,nil ct[mZ]=aZ end local dj,fe={},{}for uQ,uR in ipairs(mG)do dj[uR]=uQ end
for uS,m0 in ipairs(ad.rarOrder)do dj[m0]=dj[m0]or(20+uS)end for uT,dk in pairs(ct)do dk.k=uT dk.price=dk.price or ah.price[dk.rar or""]
fe[#fe+1]=dk end table.sort(fe,function(bQ,bR)if bQ.price and bR.price and bQ.price~=bR.price then return bQ.price<bR.price end
local m1,m2=dj[bQ.rar or""]or 99,dj[bR.rar or""]or 99 if m1~=m2 then return m1<m2 end if(bQ.i or 100)~=(bR.i or 100)then return(bQ.i or 100)<(bR.i or 100)end
return bQ.k<bR.k end)return fe end local function uU()local m3=ag:FindFirstChild("Assets")local m4=m3 and m3:FindFirstChild("Squishies")
if not m4 then return false end local h4,m5,cu={},{},{}local ff=0 for Cu,fg in ipairs(m4:GetChildren())do local dl=aa(fg.Name)
if dl~=""and not h4[dl]then local fh=cs(fg,"RarityText")or"?"h4[dl]=fh m5[dl]=cs(fg,"NameText")or fg.Name cu[fh]=cu[fh]or{}
table.insert(cu[fh],dl)ff=ff+1 end end if ff==0 then return false end for m6,uV in pairs(cu)do local m7=ah.order[m6]or ug[m6]
local h5={}if m7 then for uW,uX in ipairs(m7)do h5[aa(uX)]=uW end end table.sort(uV,function(m8,m9)local h6,h7=h5[m8],h5[m9]
if h6 and h7 then return h6<h7 end if h6 then return true end if h7 then return false end return ai(m8)<ai(m9)
end)end local h8={}for uY,uZ in ipairs(mG)do h8[uZ]=uY end local fi,bS={},{}for u0 in pairs(cu)do fi[#fi+1]=u0 end
pcall(function()for u1,u2 in ipairs(require(ag.Modules.SquishyRNG).Keys)do bS[u2]=u1 end end)table.sort(fi,function(cv,cw)
if bS[cv]and bS[cw]and bS[cv]~=bS[cw]then return bS[cv]<bS[cw]end local h9,h_=ah.price[cv],ah.price[cw]if h9 and h_ and h9~=h_ then return h9<h_ end
local ia,ib=h8[cv],h8[cw]if ia and ib then return ia<ib end if ia then return true end if ib then return false end
return cv<cw end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=h4,m5,cu,fi,ff,x()return true end local function ic()
if ad.at==0 or(x()-ad.at)>120 then pcall(uU)end return ad.n>0 end local function u3(u4)local m_=aa(u4)return ad.rar[m_]or(W.name and aa(W.name)==m_ and W.rar)or"?"
end local function u5()local fj={}local u6=((d.Best or 0)>0 and next(q.best or{}))and q.best or d.Targets for u7,u8 in pairs(u6)do if u8 then fj[#fj+1]=ai(u7)end end
table.sort(fj)return fj end local al={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function na()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fk(nb)if type(makefolder)~="function"then return end local u9,u_=pcall(isfolder,nb)if not(u9 and u_)then pcall(makefolder,nb)end
end local function fl(nc)if type(isfile)~="function"or type(readfile)~="function"then return nil end local va,vb=pcall(isfile,nc)
if not(va and vb)then return nil end local vc,vd=pcall(readfile,nc)return vc and vd or nil end local function dm(ve,vf)
if type(writefile)~="function"then return false end return(pcall(writefile,ve,vf))end local function nd(vg)local dn={}
if type(listfiles)~="function"then return dn end local vh,ne=pcall(listfiles,vg)if not vh or type(ne)~="table"then return dn end
for Cv,vi in ipairs(ne)do dn[#dn+1]=tostring(vi)end return dn end local function nf()local fm={}for Cw,vj in ipairs(nd(al.cfg))do
local ng=vj:match("([^/\\]+)%.txt$")if ng then fm[#fm+1]=ng end end table.sort(fm)return fm end local function vk()
local ab={"V|1"}ab[#ab+1]="N|Every|"..tostring(d.Every)ab[#ab+1]="N|GlazeLead|"..tostring(d.GlazeLead)ab[#ab+1]="N|FpsCap|"..tostring(d.FpsCap)
ab[#ab+1]="N|MemLimit|"..tostring(d.MemLimit)ab[#ab+1]="N|Best|"..tostring(d.Best or 0)for Cx,nh in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ab[#ab+1]="S|"..nh.."|"..d[nh]end
do local fn={}for vl,dp in pairs(d.Pets)do local ni=(dp.b and"b"or"")..(dp.g and"g"or"")..(dp.w and"w"or"")..((tonumber(dp.f)or 0)>0 and tostring(dp.f)or"")
if ni~=""then fn[#fn+1]=vl.."|"..ni end end table.sort(fn)ab[#ab+1]="P|-"for Cy,vm in ipairs(fn)do ab[#ab+1]="P|"..vm end
end for Cz,nj in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower"})do
ab[#ab+1]="B|"..nj.."|"..(d[nj]and"1"or"0")end local ie=F:GetAttribute("AutoRollRules")if type(ie)=="string"and ie~=""then d.ARrules,d.ARstop=ie,tostring(F:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then ab[#ab+1]="S|rules|"..d.ARrules ab[#ab+1]="S|stop|"..d.ARstop end if c.winPos then ab[#ab+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ab[#ab+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for CA,ig in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fo={}for vn,vo in pairs(ig[2])do if vo then fo[#fo+1]=vn end end table.sort(fo)ab[#ab+1]=ig[1].."|-"for CB,vp in ipairs(fo)do ab[#ab+1]=ig[1].."|"..vp end
end return table.concat(ab,"\n")end local function vq(ih)if type(ih)~="string"or ih==""then return false end local nk,nl,nm,nn,dq={},false,{},false,nil
for vr in ih:gmatch("[^\n]+")do local aB,ae,aw=vr:match("^(%a)|([^|]*)|?(.*)$")if aB=="N"and ae=="Every"then local ii=tonumber(aw)
if ii and ii>=1 then d.Every=math.floor(ii)end elseif aB=="N"and(ae=="FpsCap"or ae=="MemLimit")then local ij=tonumber(aw)
if ij and ij>=0 then d[ae]=math.floor(ij)end elseif aB=="N"and ae=="Best"then local fp=tonumber(aw)if fp and fp>=0 and fp<=4 then d.Best=math.floor(fp)end
elseif aB=="N"and ae=="GlazeLead"then local fq=tonumber(aw)if fq and fq>=5 and fq<=600 then d.GlazeLead=math.floor(fq)end
elseif aB=="S"and(ae=="TeamNormal"or ae=="TeamFull"or ae=="TeamGlaze"or ae=="TeamWax")then d[ae]=aw elseif aB=="P"and ae~=""then
if not dq then dq={}end if ae~="-"and aw~=""then dq[ae]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aB=="B"then if d[ae]~=nil then d[ae]=(aw=="1")end
elseif aB=="S"and ae=="rules"then d.ARrules=aw elseif aB=="S"and ae=="stop"then d.ARstop=aw elseif aB=="W"then
c.winPos={tonumber(ae)or 10,tonumber(aw)or 44}elseif aB=="G"then c.togPos={tonumber(ae)or 10,tonumber(aw)or 300}
elseif aB=="T"and ae~=""then if ae~="-"then nk[ae]=true end nl=true elseif aB=="K"and ae~=""then if ae~="-"then nm[ae]=true end
nn=true end end if nl then d.Targets=nk end if nn then d.CrateTicks=nm end if dq then d.Pets=dq end return true
end local function fr(cx)if not na()then return false,"this executor cannot write files"end cx=(cx or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cx==""then return false,"give the config a name"end fk(al.dir)fk(al.cfg)if not dm(al.cfg.."/"..cx..".txt",vk())then return false,"could not write the file"end
c.config=cx return true,cx end local function no(fs)local np=fl(al.cfg.."/"..fs..".txt")if not np then return false,"no config called "..tostring(fs)end
if not vq(np)then return false,"that config looks empty"end c.config=fs return true,fs end local function nq(ik)
if ik then fk(al.dir)dm(al.auto,ik)elseif type(delfile)=="function"then pcall(delfile,al.auto)else dm(al.auto,"")
end c.autoload=ik end local function vs()if c.selfPath then return c.selfPath end local ft for CC,vt in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",al.dir})do
for CD,nr in ipairs(nd(vt))do local il=nr:lower()if il:sub(-4)==".lua"and(il:find("sab_farm",1,true)or il:find("sab farm",1,true))then
ft=ft or nr end end end c.selfPath=ft return ft end al.stub=[[
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
local function vu()if not na()then return false,"this executor cannot write files"end fk("autoexec")if not dm(al.exec,al.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fu=(function()local vv,vw=pcall(function()return game:GetService("TeleportService")end)return vv and vw or nil end)()
local function ns()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local vx=queueonteleport or queue_on_teleport return(pcall(vx,al.stub))end local function dr(vy)if c.rejoining then return end
c.rejoining=true z("REJOIN ("..vy..")")pcall(e2)if c.autoload then pcall(fr,c.autoload)end local vz=ns()z(vz and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for CE=1,30 do if not fu then break end pcall(function()fu:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function vA()local vB,nt=pcall(function()return game:GetService("GuiService")end)if vB and nt then
pcall(function()V(nt.ErrorMessageChanged:Connect(function()if d.Rejoin then dr("roblox error message")end end))
end)end pcall(function()local nu=game:GetService("CoreGui")local nv=nu and nu:WaitForChild("RobloxPromptGui",15)
local nw=nv and nv:WaitForChild("promptOverlay",15)if nw then V(nw.ChildAdded:Connect(function(vC)if d.Rejoin and tostring(vC.Name):lower():find("errorprompt",1,true)then dr("disconnect prompt")end
end))end end)if fu then pcall(function()V(fu.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dr("teleport retry")end)end
end))end)end end local function nx(vD)local ny=c.plot and c.plot:FindFirstChild(vD)if not ny then return nil,false end
for CG,im in ipairs(ny:GetChildren())do if im:IsA("Model")or im:IsA("BasePart")then return im,true end end return nil,true
end local function bT()local br=nx("RolledSquishy")if not br then return nil end return{model=br,name=br.Name,pretty=cs(br,"NameText")or ai(aa(br.Name)),
rar=cs(br,"RarityText")or u3(br.Name),price=cs(br,"PriceText")}end local function nz(io)return type(io)=="string"and(ad.rar[aa(io)]~=nil or t5(io))
end local function ac()local ip=nx("SquishyEquipped")if ip then c.carrySrc,e.heldAt="model",x()return ip.Name,ip end
local nA=F.Character if nA then for CH,ds in ipairs(nA:GetDescendants())do if(ds:IsA("Model")or ds:IsA("Tool"))and nz(ds.Name)then
c.carrySrc,e.heldAt="character",x()return ds.Name,ds end end end local fv=F:GetAttribute("SquishyEquipped")if type(fv)=="string"and fv~=""and nz(fv)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fv,nil end c.carrySrc=nil end local function CI()local CJ,vE=ac()return vE end local function nB()
local nC=bT()local iq=nC and t7(nC.price)local ir=a7()if iq and ir and ir<iq*0.5 then return ir,iq end end local function bU(vF)
da[#da+1]=os.date("%H:%M:%S").." "..vF if#da>40 then table.remove(da,1)end end local function vG(bV,fw)if type(bV)~="string"then return end
bU(("Roll(%s,%s)"):format(bV,tostring(fw)))if bV:lower():find("crate",1,true)then e.rolled,e.rolledAt=bV,x()return
end W.seq=W.seq+1 W.name,W.at=bV,x()W.rar=type(fw)=="string"and fw or nil c.rolls=c.rolls+1 if aI(bV)then z(("ROLL %s [%s] = TARGET"):format(bV,tostring(fw)))end
end local function vH(bW)if type(bW)~="table"then return end local fy=bW.butter or bW.itemName if type(fy)~="string"then return end
c.gifts=c.gifts+1 W.gift,W.giftAt=fy,x()if type(bW.giftId)=="string"then local nD=ag:FindFirstChild("Remotes")
local nE=nD and nD:FindFirstChild("GiftThanks")if nE then pcall(function()nE:FireServer(bW.giftId)end)end end
bU("Gift("..fy.." from "..tostring(bW.fromName)..")")z(("GIFT from %s: %s - it will not be waxed"):format(tostring(bW.fromName),fy))
end local function vI()local nF=ag:WaitForChild("Remotes",30)if not c.alive then return end if not nF then z("Remotes folder missing - no roll events")return end
V(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local nG=F:GetAttribute("SquishyEquipped")
if type(nG)=="string"and nG~=""then e.heldAt=x()end end))local vO={SquishyRollAnimation=vG,InitSquishy=function(nH)W.init,W.initAt=tostring(nH),x()bU("Init("..tostring(nH)..")")end,
CrateUpdate=function(cy,nI)pcall(uD,cy)pcall(L.learn,cy)if type(cy)=="table"then local vJ=nI==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not vJ then return end local vK=not e.waiting local vL=e.on e.waiting,e.data,e.at=true,cy,x()e.on=(nI==true)
e.title=tostring(cy.title or cy.name or"crate")if e.on and not vL then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then bU("CrateWindow open("..e.title..")")elseif vK then bU("Crate waiting("..e.title..")")z(e.title.." is waiting on your stand")
end else if e.waiting then bU("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local vM=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,vM)end if e.classify then local vN=x()
task.spawn(function()pcall(e.classify,vN)end)end end end,GiftReceived=vH,}for fz,vP in pairs(vO)do local is=nF:FindFirstChild(fz)
if is and is:IsA("RemoteEvent")then V(is.OnClientEvent:Connect(vP))elseif fz~="CrateUpdate"and fz~="GiftReceived"then z("remote "..fz.." missing")end
end end local function it()local bX=bT()if bX then if aI(bX.name)then return{state="match",shown=bX.pretty,src="pad",info=bX}
end return{state="skip",info=bX,level="idle",text=("on pad: %s [%s] - not ticked"):format(bX.pretty,tostring(bX.rar))}
end if W.name and(x()-W.at)<4 then if aI(W.name)then return{state="match",shown=ai(aa(W.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ai(aa(W.name)),tostring(W.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fA(vQ,vR,vS,vT)
local fB=RaycastParams.new()fB.FilterType=Enum.RaycastFilterType.Exclude local iu={F.Character}for CK,vU in ipairs(vT or{})do iu[#iu+1]=vU end
fB.FilterDescendantsInstances=iu pcall(function()fB.RespectCanCollide=true end)local nJ=au:Raycast(Vector3 .new(vQ,vR+4,vS),Vector3 .new(0,-30,0),fB)
return nJ and nJ.Position or nil end local function cz(nK)local nL=nK:FindFirstChildOfClass("Humanoid")return((nL and nL.HipHeight)or 2)+nK.HumanoidRootPart.Size.Y/2+0.2
end local function iv(vV,vW)local iw=vV:FindFirstChildOfClass("Humanoid")local vX=x()while x()-vX<vW do if iw and(iw.FloorMaterial~=Enum.Material.Air or iw.SeatPart)then return true end
af(0.05)end return false end local function aC(vY,ix,iy)local nM=vY.HumanoidRootPart nM.AssemblyLinearVelocity=Vector3 .new(0,0,0)
nM.CFrame=iy and CFrame.new(ix,Vector3 .new(iy.X,ix.Y,iy.Z))or CFrame.new(ix)end local function bY(ba,nN)local bZ=ar()
if not bZ or not ba then return false end local bs=ba.Position local fC=math.clamp(math.max(ba.Size.X,ba.Size.Z)/2+2.2,3,7)
local nO=(nN and nN.MaxActivationDistance)or 10 if fC>nO-2 then fC=math.max(2.5,nO-2)end local dt={}local function b0(du)
du=Vector3 .new(du.X,0,du.Z)if du.Magnitude>0.05 then dt[#dt+1]=du.Unit end end local nP=mt()if nP then b0(nP-bs)end
b0(ba.CFrame.LookVector)b0(-ba.CFrame.LookVector)b0(ba.CFrame.RightVector)b0(-ba.CFrame.RightVector)b0(bZ.HumanoidRootPart.Position-bs)
if#dt==0 then b0(Vector3 .new(0,0,1))end local vZ,fD=cz(bZ),false for CL,v0 in ipairs(dt)do local fE=bs+v0*fC
local iz=fA(fE.X,bs.Y,fE.Z,{ba})if iz and math.abs(iz.Y-bs.Y)<14 then aC(bZ,Vector3 .new(fE.X,iz.Y+vZ,fE.Z),bs)
if iv(bZ,0.7)then fD=true break end end end if not fD then aC(bZ,bs+dt[1]*fC+Vector3 .new(0,3,0),bs)fD=iv(bZ,1)
end af(0.12)return fD end local function nQ(dv)if not dv.Parent or not dv.Enabled then return false end pcall(function()dv:InputHoldBegin()end)
af(math.max(dv.HoldDuration,0)+0.08)pcall(function()dv:InputHoldEnd()end)return true end local function ao(nR,v1)
local v2=x()while x()-v2<v1 do if nR()then return true end af(0.05)end return nR()end local function dw(cA,v3,nS,v4)
local v5=c.zapFirst and{"zap","hold"}or{"hold","zap"}for v6,iA in ipairs(v5)do if v6==2 and(v4 or not(cA.Parent and cA.Enabled and(not nS or nS())))then break end
local iB if iA=="hold"then iB=nQ(cA)else iB=type(fireproximityprompt)=="function"and cA.Parent~=nil and cA.Enabled and pcall(fireproximityprompt,cA)end
if iB and ao(v3,1.2)then c.zapFirst=(iA=="zap")return true,iA end end return false end local function nT(iC)local bt=mE()
if not bt or not bt.Enabled then z("buy: nothing on the pad")return false end local nU=dd(bt)if not nU then z("buy: pad part missing")return false end
c.lastBuyAt=x()local v7,nV=W.seq,a7()bY(nU,bt)if not bt.Enabled then z("buy aborted: pad emptied")return false end
local cB=it()if not iC and cB.state~="match"then z("buy aborted: "..(cB.text or"pad changed"))c.matchSince=nil
return false end local iD=cB.info and cB.info.name or(cB.state=="match"and W.name)or nil local function v8()return bt.Enabled and ac()==nil and(iC or it().state=="match")
end local v9,v_=dw(bt,function()return ac()~=nil or((not bt.Enabled)and(iC or W.seq==v7))end,v8,nB()~=nil)if v9 then
ao(function()return ac()~=nil end,0.8)local dx=ac()local nW=a7()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil W.name,W.rar,W.at=nil,nil,x()z(("BOUGHT %s%s via %s"):format(dx and ai(aa(dx))or(cB.shown or"?"),(nV and nW)and(" for $"..aJ(nV-nW))or"",v_))
if dx and iD and aa(dx)~=aa(iD)then z(("note: picked up %s, not %s"):format(dx,iD))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local nX=bT()z(("BUY REFUSED: cash short? have $%s, price %s"):format(aJ(a7()),(nX and nX.price)or"?"))
return false end local function nY()local dy=ac()if not dy then c.holding=false z("place: hands are empty")return false
end if not aI(dy)then z(("REFUSED TO WAX %s - it is not ticked"):format(ai(aa(dy))))return false end for CM=1,d.PlaceTries do
local bu=uf()if not bu then z("place: no free station")break end local nZ=dd(bu)if nZ then bY(nZ,bu)local n0=ac()
if not n0 then c.holding=false z("place: hands emptied on the way")return false end if not aI(n0)then z("place: what I carry changed, not waxing it")return false end
if bu.Enabled then local wa,wb=dw(bu,function()return not bu.Enabled end,function()return bu.Enabled end)if wa then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 W.name,W.rar,W.at=nil,nil,x()
z(("WAXED %s #%d at %s via %s"):format(ai(aa(dy)),c.placed,bu.Parent.Parent.Name,wb))if q.placed then pcall(q.placed,dy)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end z("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))z(c.capMsg)end return false end function y.place()local wc=x()while c.alive and y.editing and x()-wc<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then y.placing=true local wd=x()while c.alive and y.current()~=d.TeamWax and x()-wd<5 do af(0.1)end
if y.current()==d.TeamWax then af(0.3)else z("wax team did not come on in time - placing anyway")end end local we,n1=pcall(nY)
y.placing=false if not we then error(n1,0)end return n1 end local function n2(n3)return type(n3)=="string"and n3:lower():find("crate",1,true)~=nil
end local wf={SABFarmGui=1,SABToggle=1,SABError=1}local function iE(wg)local bv=wg while bv do if wf[bv.Name]then return false end
if bv:IsA("ScreenGui")then local wh,wi=pcall(function()return bv.Enabled end)return(not wh)or wi~=false end if bv:IsA("GuiObject")and not bv.Visible then return false end
bv=bv.Parent end return false end local function fF(fG)local cC=""pcall(function()if fG:IsA("TextButton")then cC=fG.Text end end)
if not cC:find("%a")then for CN,fH in ipairs(fG:GetDescendants())do if(fH:IsA("TextLabel")or fH:IsA("TextButton"))and fH.Text:find("%a")then cC=fH.Text break end
end end if not cC:find("%a")then cC=fG.Name end return(cC:lower():gsub("[^%a]",""))end local function wj()local dz,dA
local n4=F:FindFirstChildOfClass("PlayerGui")if not n4 then return nil,nil end for CO,dB in ipairs(n4:GetDescendants())do
if dB:IsA("GuiButton")and iE(dB)then local iF=fF(dB)if iF:sub(1,4)=="open"and not iF:find("shop",1,true)then dz=dz or dB end
if iF:sub(1,7)=="discard"then dA=dA or dB end end end if dz and dA then return dz,dA end if e.on then return dz,dA end
return nil,nil end local iG=(function()local wk,wl=pcall(function()return game:GetService("VirtualInputManager")end)return wk and wl or nil end)()
local function n5(bc,iH)local iI={}local function n6(wm)iI[#iI+1]=wm end if c.tapWay then n6(c.tapWay)end for CP,n7 in ipairs({"touch","conn","signal"})do
if n7~=c.tapWay then n6(n7)end end local function n8(wn,...)local wo,iJ=pcall(getconnections,wn)if not(wo and type(iJ)=="table"and#iJ>0)then return false end
local n9,wp,wq=false,{...},select("#",...)for CQ,wr in ipairs(iJ)do if pcall(function()wr:Fire(table.unpack(wp,1,wq))end)then n9=true end
end return n9 end local function n_()local oa=Vector3 .new(0,0,0)pcall(function()local ob,oc=bc.AbsolutePosition,bc.AbsoluteSize
oa=Vector3 .new(ob.X+oc.X/2,ob.Y+oc.Y/2,0)end)local iK={Position=oa,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()iK.UserInputType=Enum.UserInputType.Touch end)pcall(function()iK.UserInputState=Enum.UserInputState.End end)
return iK end for CS,bd in ipairs(iI)do local dC=false if bd=="conn"and type(getconnections)=="function"then if n8(bc.MouseButton1Click)then
dC=true if ao(iH,1.5)then c.tapWay=bd return true,bd end end dC=n8(bc.Activated,n_(),1)elseif bd=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bc.MouseButton1Click)then if ao(iH,1.5)then c.tapWay=bd return true,bd end end dC=pcall(firesignal,bc.Activated,n_(),1)
elseif bd=="touch"and iG then dC=pcall(function()local od,oe=bc.AbsolutePosition,bc.AbsoluteSize local of=0 local og=bc:FindFirstAncestorWhichIsA("ScreenGui")
local ws,wt=pcall(function()return og and og.IgnoreGuiInset end)if not(ws and wt)then pcall(function()of=game:GetService("GuiService"):GetGuiInset().Y end)
end local oh,oi=od.X+oe.X/2,od.Y+oe.Y/2+of iG:SendMouseButtonEvent(oh,oi,0,true,game,1)task.wait(0.06)iG:SendMouseButtonEvent(oh,oi,0,false,game,1)
end)end if dC and ao(iH,1.5)then c.tapWay=bd return true,bd end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function iL(oj)local dD=oj.Parent while dD and dD~=c.plot do if e.NOT[dD.Name]then return false end dD=dD.Parent
end local iM=(oj.ActionText or""):lower()if iM:find("roll",1,true)or iM:find("place",1,true)or iM:find("sell",1,true)then return false end
return true end local function ol()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local om=c.plot:FindFirstChild("CrateStand")local dE if om then for CT,fI in ipairs(om:GetDescendants())do
if fI:IsA("ProximityPrompt")and fI.Enabled and iL(fI)then dE=fI break end end end if not dE then for CU,bw in ipairs(c.plot:GetDescendants())do
if bw:IsA("ProximityPrompt")and bw.Enabled and iL(bw)then local oo=bw:FindFirstAncestorWhichIsA("Model")local wu=((bw.ActionText or"").." "..(bw.ObjectText or"").." "..bw.Name.." "..(oo and oo.Name or"")):lower()
if wu:find("crate",1,true)then dE=bw break end end end end e.prompt=dE return dE end local function iN()if e.on then return true end
local dF=ol()if not dF then e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local op=dd(dF)if op then bY(op,dF)end e.ours=true dw(dF,function()return e.on end)if ao(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: pressed "..eX(dF).." but no window came up")
return false end do local function wv(oq)local cD=oq.Parent while cD and cD:IsA("GuiObject")do local ot,ou=false,false
for CV,dG in ipairs(cD:GetDescendants())do if dG~=oq and dG:IsA("GuiButton")and fF(dG):sub(1,7)=="discard"then ot=true end
if dG:IsA("TextLabel")then local iO=dG.Text:lower()if iO:find("crate",1,true)or iO:find("can contain",1,true)or iO:find("cost",1,true)then ou=true end
end if ot and ou then return cD end end cD=cD.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local ov=F:FindFirstChildOfClass("PlayerGui")if not ov then return nil end for CW,fJ in ipairs(ov:GetDescendants())do
if fJ:IsA("GuiButton")and not fJ:FindFirstAncestor("SABFarmGui")and fF(fJ):sub(1,4)=="open"then local iP=wv(fJ)
if iP then e.win=iP return iP end end end end local function ww(wx)for CX,fK in ipairs(wx:GetDescendants())do
if fK:IsA("GuiButton")then local ow,iQ=fF(fK),fK.Name:lower()if ow=="x"or ow=="close"or iQ=="x"or iQ:find("close",1,true)or iQ:find("exit",1,true)then return fK end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(wy)task.wait(wy and 4 or 1.2)if e.on or e.waiting then return end
local fL=e.findWin()if not fL or not iE(fL)then return end local ox=ww(fL)if ox and n5(ox,function()return not iE(fL)end)then return end
z("the crate window is still open - tap its X")end end local function dH(fM)if not iN()then return false end local oy=x()-(e.openedAt or 0)
if oy<0.6 then af(0.6-oy)end local iR=e.title local wz,wA=wj()local oz=fM and wz or wA if not oz then e.lastFail=x()
c.crateFails=c.crateFails+1 z(("crate: no %s button found in %s"):format(fM and"Open"or"Discard",iR))return false
end local wB=ac()local wC,CY=n5(oz,function()return(not e.on)or(ac()~=nil and ac()~=wB)end)if not wC then e.lastFail=x()
c.crateFails=c.crateFails+1 z("crate: could not press "..(fM and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fM then c.crates=c.crates+1 ao(function()return ac()~=nil end,1.5)local oA=ac()
z(("OPENED %s -> %s"):format(iR,oA and ai(aa(oA))or"?"))else z("discarded "..iR.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(wD,...)local wE=select("#",...)e.calls[#e.calls+1]={t=x(),m=wD,n=wE,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aD,be)local bx=type(aD)if(bx=="string"or bx=="number")and type(be.data)=="table"then for oB,iS in pairs(be.data)do
if iS==aD and type(oB)=="string"and(type(iS)=="string"or type(iS)=="number")then return{__slot="f:"..oB}end end
end if bx=="string"then if be.crate and aD==be.crate then return{__slot="crate"}end if be.title and aD==be.title then return{__slot="title"}end
if be.rar and aD==be.rar then return{__slot="rarity"}end return aD end if bx=="number"or bx=="boolean"or bx=="nil"then return aD end
if bx=="table"then local oC={}for wF,oD in pairs(aD)do if type(oD)=="table"then return nil,"nested table"end local wG,oE=e.slot(oD,be)
if oE then return nil,oE end oC[wF]=wG end return oC end local wH,wI=pcall(function()return aD:IsA("Instance")end)
if wH and wI then if aD==F then return{__slot="player"}end if c.plot and aD==c.plot then return{__slot="plot"}end
local fN=c.plot and c.plot:FindFirstChild("CrateStand")if fN and aD==fN then return{__slot="stand"}end if fN and aD.Parent==fN then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bx..")"end function e.resolve(fO)if type(fO)~="table"then return fO end
local aP=fO.__slot if aP and aP:sub(1,2)=="f:"then return e.data and e.data[aP:sub(3)]end if aP=="crate"then return e.data and e.data.name end
if aP=="title"then return(e.data and e.data.title)or e.title end if aP=="rarity"then return e.data and e.data.rarity end
if aP=="player"then return F end if aP=="plot"then return c.plot end if aP=="stand"or aP=="model"then local iT=c.plot and c.plot:FindFirstChild("CrateStand")
if aP=="stand"or not iT then return iT end for CZ,oF in ipairs(iT:GetChildren())do if n2(oF.Name)then return oF end end
return nil end local oG={}for wJ,wK in pairs(fO)do oG[wJ]=e.resolve(wK)end return oG end function e.classify(iU)
if e.directOff then return end local fP={}for C0,iV in ipairs(e.calls)do if iV.t<=iU+0.05 and iU-iV.t<=6 then fP[#fP+1]=iV end
end if#fP==0 then return end if not ao(function()return(e.heldAt or 0)>=iU-1 end,2.5)then return end local dI={}
for C1,dJ in ipairs(fP)do local oH={}for oI=1,dJ.n do local wL,oJ=e.slot(dJ.args[oI],dJ)if oJ then z("crate call has "..oJ.." - keeping the button method")
return end oH[oI]=wL end dI[#dI+1]={m=dJ.m,n=dJ.n,args=oH}end local iW=e.learned e.learned={seq=dI,mode=iW and iW.mode or nil}
ah.dirty=true if not iW then z(("learned how to open crates directly (%d call%s)"):format(#dI,#dI==1 and""or"s"))end
end function e.replay()local oK=e.learned local oL=ag:FindFirstChild("Remotes")local iX=oL and oL:FindFirstChild("CrateAction")
if not(oK and iX)then return false end local oM=table.unpack or unpack e.replaying=true for C2,dK in ipairs(oK.seq)do
local iY={}for oN=1,dK.n do iY[oN]=e.resolve(dK.args[oN])end task.spawn(function()pcall(function()if dK.m=="InvokeServer"then iX:InvokeServer(oM(iY,1,dK.n))
else iX:FireServer(oM(iY,1,dK.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(wM)return(wM:gsub("[%%|;=,\n]",function(wN)return("%%%02X"):format(wN:byte())end))end
function e.enc(b1)local fQ=type(b1)if fQ=="string"then return"s"..e.esc(b1)end if fQ=="number"then return"n"..tostring(b1)end
if fQ=="boolean"then return b1 and"b1"or"b0"end if fQ=="nil"then return"z"end if b1 .__slot then return"k"..b1 .__slot end
local iZ={}for wO,wP in pairs(b1)do iZ[#iZ+1]=e.enc(wO).."="..e.enc(wP)end return"t"..table.concat(iZ,",")end
function e.dec(oO)local dL,dM=oO:sub(1,1),oO:sub(2)local function wQ(wR)return(wR:gsub("%%(%x%x)",function(wS)return string.char(tonumber(wS,16))end))end
if dL=="s"then return wQ(dM)end if dL=="n"then return tonumber(dM)end if dL=="b"then return dM=="1"end if dL=="k"then return{__slot=dM}end
if dL=="t"then local oP={}for wT in dM:gmatch("[^,]+")do local oQ,wU=wT:match("^(.-)=(.*)$")if oQ then local oR=e.dec(oQ)
if oR~=nil then oP[oR]=e.dec(wU)end end end return oP end return nil end function e.goneOrNew(wV)return function()
if not e.waiting then return true end local oS=ac()return oS~=nil and oS~=wV end end function e.near()local oT=ag:FindFirstChild("Remotes")
local i0=oT and oT:FindFirstChild("CrateAction")local fR=ar()local i1=c.plot and c.plot:FindFirstChild("CrateStand")
local i2=i1 and i1:FindFirstChild("Spot")if not(i0 and fR and i2)then z(("crate: cannot open %s right now (%s)"):format(tostring(e.title),
not i0 and"no CrateAction remote"or not fR and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local i3=fR.HumanoidRootPart local fS=i3 .CFrame local oU,i4=e.title,"no answer"local wW=ac()local oV=i1:FindFirstChild("Holder")
local function oW()if not oV then return e.waiting or e.on end for C3,wX in ipairs(oV:GetChildren())do if wX:IsA("Model")then return true end end
return false end for wY=1,3 do if not(e.waiting or e.on)or not oW()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(i3 .Position-i2 .Position).Magnitude>8 then bY(i2,e.prompt)end af(0.12+0.15*wY)
local a0={}e.replaying=true task.spawn(function()a0 .ok,a0 .v=pcall(function()return i0:InvokeServer("open")end)
a0 .done=true end)ao(function()return a0 .done end,6)e.replaying=false local b2=a0 .v if a0 .done and a0 .ok and type(b2)=="table"and b2 .ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 z(("OPENED %s -> %s (no window)"):format(oU,b2 .prize and ai(aa(tostring(b2 .prize)))or"?"))
ao(function()local oX=ac()return oX~=nil and oX~=wW end,1.5)if(i3 .Position-fS.Position).Magnitude>8 then pcall(function()aC(fR,fS.Position,fS.Position+fS.LookVector)end)end
return true,"opened"end i4=(a0 .done and a0 .ok and type(b2)=="table")and tostring(b2 .reason or"refused, no reason given")
or(a0 .done and("error: "..tostring(b2))or"no answer in 6s")af(0.3)if not oW()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 z(("crate: the server would not open %s next to the stand (%s)"):format(oU,i4))
return false,i4 end e.GIVEUP=600 function e.drop()local oY=ag:FindFirstChild("Remotes")local oZ=oY and oY:FindFirstChild("CrateAction")
local o0=c.plot and c.plot:FindFirstChild("CrateStand")local i5=o0 and o0:FindFirstChild("Spot")local o1=ar()
if i5 and o1 and(o1 .HumanoidRootPart.Position-i5 .Position).Magnitude>8 then bY(i5,e.prompt)af(0.3)end local i6,bf=false,nil
if oZ then i6,bf=pcall(function()return oZ:InvokeServer("discard")end)end z(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(e.title),math.floor(e.GIVEUP/60),(i6 and type(bf)=="table"and bf.ok)and"done"or("answer: "..tostring(type(bf)=="table"and(bf.reason or bf.ok)or bf))))
e.waiting,e.on,e.quietUntil=false,false,x()+4 e.summonFails,e.nearFails,e.lastFail,e.at,e.prompt=0,0,0,nil,nil
if not(i6 and type(bf)=="table"and bf.ok)then dH(false)end end function e.smart()local i7=e.title if(e.nearFails or 0)<3 then
local wZ=e.near()if wZ then return true end if e.nearFails>=3 then z("opening next to the stand failed 3 times - trying the older ways")end
end local b3=e.learned if b3 then local i8=ac()if e.on then e.replay()if ao(e.goneOrNew(i8),3.5)then c.crates=c.crates+1
z("OPENED "..i7 .." (direct)")return true end else if b3 .mode~="window"then e.replay()if ao(e.goneOrNew(i8),3.5)then
c.crates,e.fails=c.crates+1,0 if b3 .mode~="direct"then b3 .mode,ah.dirty="direct",true z("crates now open directly - the window never comes up")
end z("OPENED "..i7 .." (direct, no window)")return true end end if iN()then e.replay()if ao(e.goneOrNew(i8),3.5)then
c.crates,e.fails=c.crates+1,0 if b3 .mode~="window"then b3 .mode,ah.dirty="window",true z("crates need their window up first - it shows briefly")
end z("OPENED "..i7 .." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ah.dirty=b3,nil,true
if e.fails>=3 then e.directOff=true z("direct crate opening failed 3 times - using the button for now")else z("the learned crate call did not work - back to pressing Open")
end end return dH(true)end function C.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end C.cache={}function C.watchCache()C.cache=C.snap()
for w0,o2 in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(F:GetAttributeChangedSignal(o2):Connect(function()C.cache[w0]=F:GetAttribute(o2)end))
end end function C.isOn()return F:GetAttribute("AutoRollOn")==true end function C.saw(w1,...)local fT=C.cache
local w2={m=w1,n=select("#",...),args={...},before={rules=fT.rules,stop=fT.stop,on=fT.on,main=fT.main}}task.delay(1.5,function()
if c.alive then pcall(C.learnOne,w2)end end)end function C.learnOne(dN)local ax,dO=C.snap(),dN.before local fU=(ax.rules~=dO.rules)or(ax.stop~=dO.stop)
local o3=(ax.on~=dO.on)or(ax.main~=dO.main)if not fU and not o3 then return end local o4={}for o5=1,dN.n do local aK=dN.args[o5]
local b4=type(aK)if b4=="string"and aK~=""and aK==ax.rules then aK={__slot="rules"}elseif b4=="string"and aK~=""and fU and aK==ax.stop and ax.stop~=dO.stop then aK={__slot="stop"}
elseif b4=="table"then local o6={}for w3,cE in pairs(aK)do if type(cE)=="table"or(type(cE)=="userdata")then C.msg="Auto Roll sends something I cannot repeat"return
end o6[w3]=(type(cE)=="string"and cE~=""and cE==ax.rules)and{__slot="rules"}or cE end aK=o6 elseif b4~="string"and b4~="number"and b4~="boolean"and b4~="nil"then
if aK==F then aK={__slot="player"}else C.msg="Auto Roll sends something I cannot repeat"return end end o4[o5]=aK
end local cF={m=dN.m,n=dN.n,args=o4}if fU then local i9=false for w4=1,cF.n do local dP=cF.args[w4]if type(dP)=="table"and dP.__slot=="rules"then i9=true end
if type(dP)=="table"and not dP.__slot then for C4,o7 in pairs(dP)do if type(o7)=="table"and o7 .__slot=="rules"then i9=true end end
end end if i9 then C.rec.rules={cF}else table.insert(C.rec.rules,cF)if#C.rec.rules>60 then table.remove(C.rec.rules,1)end
end end if o3 then if ax.on==true then C.rec.on=cF else C.rec.off=cF end d.AutoRoll=(ax.on==true)end if ax.rules and ax.rules~=""then d.ARrules,d.ARstop=ax.rules,ax.stop or""end
ah.dirty=true C.msg=""z(("learned an Auto Roll %s message"):format(fU and"choices"or(ax.on and"on"or"off")))end
function C.resolve(cG)if type(cG)~="table"then return cG end if cG.__slot=="rules"then return d.ARrules~=""and d.ARrules or F:GetAttribute("AutoRollRules")end
if cG.__slot=="stop"then return d.ARstop~=""and d.ARstop or F:GetAttribute("AutoRollStop")end if cG.__slot=="player"then return F end
local o8={}for w5,w6 in pairs(cG)do o8[w5]=C.resolve(w6)end return o8 end function C.replay(o9,w7)local o_=table.unpack or unpack
for C5,dQ in ipairs(w7)do local i_={}for pa=1,dQ.n do i_[pa]=C.resolve(dQ.args[pa])end C.replaying=true pcall(function()
if dQ.m=="InvokeServer"then task.spawn(function()pcall(function()o9:InvokeServer(o_(i_,1,dQ.n))end)end)else o9:FireServer(o_(i_,1,dQ.n))end
end)C.replaying=false task.wait(0.25)end end function C.apply(pb,w8)if C.busy or not c.alive then return end C.busy=true
pcall(function()local pc=ag:FindFirstChild("Remotes")local ja=pc and pc:FindFirstChild("AutoRollAction")if not ja then C.msg="this game has no AutoRollAction"return end
local by=d.AutoRoll if by and d.ARrules~=""and F:GetAttribute("AutoRollRules")~=d.ARrules then if#C.rec.rules==0 then
C.msg="pick your Auto Roll choices once in the game's menu so I can learn them"z(C.msg)else C.replay(ja,C.rec.rules)
if ao(function()return F:GetAttribute("AutoRollRules")==d.ARrules end,4)then z("Auto Roll choices put back")else
C.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"z(C.msg)end end end if by==C.isOn()or(not by and not w8)then return end
local fV=by and C.rec.on or C.rec.off if not fV then local dR=by and C.rec.off or C.rec.on local pd=dR~=nil for w9=1,dR and dR.n or 0 do
if type(dR.args[w9])=="boolean"then pd=false end end if pd then fV=dR end end if not fV then C.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(by and"on"or"off")
z(C.msg)return end C.replay(ja,{fV})if ao(function()return C.isOn()==by end,4)then C.msg=""z(("Auto Roll switched %s%s"):format(by and"ON"or"OFF",pb and(" ("..pb..")")or""))
else C.msg="Auto Roll did not switch - do it once in the game so I can relearn it"z(C.msg)end end)C.busy=false
end l.HS=game:GetService("HttpService")l.uid=(function()local w_,xa=pcall(function()return F.UserId end)return w_ and xa or 0 end)()
l.buyMsg,l.wishMsg,l.wishN="","",0 function l.info()if l.I then return l.I end local xb,jb=pcall(function()return require(ag:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if xb and type(jb)=="table"and type(jb.Pets)=="table"then l.I=jb end return l.I end function l.order()if l.list then return l.list end
local bz=l.info()if not bz then return{}end local b5={}if type(bz.Order)=="table"and#bz.Order>0 then for C6,pe in ipairs(bz.Order)do if bz.Pets[pe]then b5[#b5+1]=pe end end
else for xc in pairs(bz.Pets)do b5[#b5+1]=xc end table.sort(b5,function(xd,xe)return(bz.Pets[xd].price or 0)<(bz.Pets[xe].price or 0)end)
end l.list=b5 return b5 end function l.nice(pf,jc)local pg=l.info()local ph=pg and pg.Pets[pf]return((jc and jc~="")and(jc.." ")or"")..(ph and ph.displayName or tostring(pf))
end function l.data()local fW=F:GetAttribute("PetsData")if type(fW)~="string"then return nil end if fW==l.rawD then return l.lastD end
local xf,dS=pcall(function()return l.HS:JSONDecode(fW)end)dS=(xf and type(dS)=="table")and dS or nil l.rawD,l.lastD=fW,dS
return dS end function l.pen()return ag:FindFirstChild("PetMeadowSpawns")end function l.srv()return au:GetServerTimeNow()end
function l.money()local jd=F:FindFirstChild("MoneyValue")if jd and type(jd.Value)=="number"then return jd.Value end
return a7()or 0 end function l.wishes()local pj=l.pen()local pk=pj and pj:GetAttribute("Wishes")local je,pl={},l.srv()
if type(pk)~="string"then return je end local xg,pm=pcall(function()return l.HS:JSONDecode(pk)end)if xg and type(pm)=="table"then
for xh,jf in pairs(pm)do if type(jf)=="number"and jf>pl then je[xh]=jf-pl end end end return je end function l.call(...)
local pn=ag:FindFirstChild("Remotes")local po=pn and pn:FindFirstChild("PetRequest")if not po then return nil end
local pp=table.pack(...)local b6={}task.spawn(function()b6 .ok,b6 .v=pcall(function()return po:InvokeServer(table.unpack(pp,1,pp.n))end)
b6 .done=true end)local xi=x()while not b6 .done and x()-xi<6 do task.wait(0.05)end if b6 .done and b6 .ok then return b6 .v end
return nil end function l.want(xj)return d.Pets[xj]end function l.closeNaming(jg)local ps=pcall(function()local pq=F:FindFirstChild("PlayerScripts")
local xk=pq and pq:FindFirstChild("Naming",true)require(xk).close()end)af(0.5)if jg.Visible then pcall(function()local pt=jg:FindFirstChild("NameBox",true)if pt then pt:ReleaseFocus()end end)
jg.Visible=false ps=false end return ps end function l.skipNaming()l.namingUntil=x()+10 if l.namingOn then return end
l.namingOn=true task.spawn(function()while c.alive and x()<l.namingUntil do local pu=F:FindFirstChildOfClass("PlayerGui")
local pv=pu and pu:FindFirstChild("MainGui")local fX=pv and pv:FindFirstChild("PetNameGui")if fX and fX.Visible then
af(0.4)if fX.Visible then l.namingShut=(l.namingShut or 0)+1 pcall(l.closeNaming,fX)break end end af(0.25)end
l.namingOn=false end)end function l.buyTick()if not d.PetBuy then l.buyMsg="auto adopt is off"return end local jh,pw,fY=l.info(),l.pen(),l.data()
if not(jh and pw and fY)then l.buyMsg="pet data not loaded yet"return end l.tryAt=l.tryAt or{}local dT,ji=#(fY.pets or{}),tonumber(fY.maxOwned)or 60
local xl,px,dU=l.srv(),{},nil for C7,aQ in ipairs(pw:GetChildren())do px[aQ.Name]=true local b7,fZ=aQ:GetAttribute("Pet"),aQ:GetAttribute("Variant")or""
local jj=b7 and l.want(b7)if jj and jj.b and jh.Pets[b7]and(not jj.g or fZ=="Big")and A.wantMore(b7,fZ,fY)and not aQ:GetAttribute("A_"..l.uid)
and(tonumber(aQ:GetAttribute("ExpiresAt"))or 0)>xl+1 and x()>=(l.tryAt[aQ.Name]or 0)then local dV,py=l.nice(b7,fZ),jh.Pets[b7].price or 0
if dT>=ji then dU=("%s is in the pen, but you have %d/%d pets"):format(dV,dT,ji)l.tryAt[aQ.Name]=x()+15 elseif l.money()<py then
dU=("%s is in the pen - need $%s"):format(dV,aJ(py))l.tryAt[aQ.Name]=x()+5 else l.tryAt[aQ.Name]=x()+8 local bA=l.call("adopt",aQ.Name)
if type(bA)=="table"and bA.ok then dT=dT+1 l.buys=(l.buys or 0)+1 l.recent=l.recent or{}local xm=type(bA.pet)=="table"and bA.pet or{}
table.insert(l.recent,{id=tostring(xm.id or("?"..x())),name=b7,variant=fZ,at=x()})if#l.recent>30 then table.remove(l.recent,1)end
z("ADOPTED "..dV)l.skipNaming()dU="adopted "..dV else local pz=type(bA)=="table"and tostring(bA.reason or"no reason given")or"no answer"
z(("adopt %s failed: %s"):format(dV,pz))dU="adopt failed: "..pz if type(bA)=="table"and bA.bagFull then l.tryAt[aQ.Name]=x()+60 end
end end end end for pA in pairs(l.tryAt)do if not px[pA]then l.tryAt[pA]=nil end end l.buyMsg=dU or("watching the pen (%d/%d pets)"):format(dT,ji)
end function l.wishTick()if not d.PetWish then l.wishMsg="auto wish is off"return end local f0=l.info()if not(f0 and l.pen())then l.wishMsg="pet data not loaded yet"return end
l.wishTry,l.wishWhy=l.wishTry or{},l.wishWhy or{}local f1,jk,bB=l.wishes(),0,nil local xn=(type(f0 .Wish)=="table"and f0 .Wish.cashShare)or 2
local xo=l.data()for C8,az in ipairs(l.order())do local pB=l.want(az)if pB and pB.w and A.wantMore(az,"",xo)then
jk=jk+1 if not f1[az]and x()>=(l.wishTry[az]or 0)then local jl=tonumber(F:GetAttribute("PetWishCredits"))or 0
local jm=math.floor((f0 .Pets[az].price or 0)*xn)if jl<=0 and l.money()<jm then l.wishTry[az]=x()+10 bB=("need $%s to wish for %s"):format(aJ(jm),l.nice(az))
l.wishWhy[az]=bB else l.wishTry[az]=x()+3 local xp=jl>0 and"wishCredit"or"wish"local f2=l.call(xp,az)if type(f2)=="table"and f2 .ok then
l.wishN,l.wishWhy[az]=l.wishN+1,nil z(("WISHED for %s (%s)"):format(l.nice(az),jl>0 and"free wish"or("$"..aJ(jm))))
else local jn=type(f2)=="table"and tostring(f2 .reason or"no reason given")or"no answer"if jn:lower():find("already",1,true)then l.wishTry[az]=x()+2
else z(("wish %s failed: %s"):format(l.nice(az),jn))bB="wish failed: "..jn end end end end end end if not bB then
for C9,f3 in ipairs(l.order())do local pC=l.want(f3)if pC and pC.w and not f1[f3]and l.wishWhy[f3]then bB=l.wishWhy[f3]break end
end end if not bB then local f4={}for C_,f5 in ipairs(l.order())do local pD=l.want(f5)if pD and pD.w and f1[f5]then f4[#f4+1]=("%s %dm"):format(l.nice(f5),math.ceil(f1[f5]/60))end
end bB=jk==0 and"no pet has WISH ticked"or("running: "..(#f4>0 and table.concat(f4,", ")or"none yet"))end l.wishMsg=bB
end y.switches,y.glazed,y.finished=0,0,0 y.done,y.doneN,y.later={},0,{}function y.teams()local jo=l.data()return(jo and jo.teams)or{},jo
end function y.current(cH)cH=cH or l.data()if not cH then return""end local pE={}for Da,xq in ipairs(cH.equipped or{})do pE[tostring(xq)]=true end
for Db,pF in ipairs(cH.teams or{})do local pG=pF.pets or{}local jp=#pG==#(cH.equipped or{})if jp then for Dc,xr in ipairs(pG)do if not pE[tostring(xr)]then jp=false break end end end
if jp then return pF.name end end return""end function y.equip(jq)local xs,xt=y.teams()local jr for xu,xv in ipairs(xs)do if xv.name==jq then jr=xu break end end
if not jr then y.msg="no saved team called "..tostring(jq)return false end if y.current(xt)==jq then return true end
for Dd=1,4 do local pH=l.call("teamEquip",jr)if type(pH)=="table"and pH.ok then y.switches=y.switches+1 return true
end task.wait(0.4)end return false end function y.left(xw)local pI=xw:FindFirstChild("SquishyPlaceHolder")local pJ=pI and pI:FindFirstChild("TimerGui")
local pK=pJ and pJ:FindFirstChildWhichIsA("TextLabel",true)local js=pK and pK.Text if type(js)~="string"or js:find("-",1,true)then return nil end
local jt,pL,pM=js:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not jt then return nil end local pN=pM~=""and(tonumber(jt)*3600+tonumber(pL)*60+tonumber(pM))or(tonumber(jt)*60+tonumber(pL))
return pN>0 and pN or nil end function y.waxes()local dW={}local pO=c.plot and c.plot:FindFirstChild("WaxStations")
if not pO then return dW end local pP=l.srv()for De,a1 in ipairs(pO:GetChildren())do local ju=tonumber(a1:GetAttribute("PourEnd"))
local pQ=a1:GetAttribute("PourOwner")if a1:GetAttribute("HasSquishy")and a1:GetAttribute("PourId")and(pQ==nil or pQ==l.uid)then
local jv=y.left(a1)local pR=jv and(pP+jv)or((ju and ju>pP)and ju or nil)if pR then local pS,pT=a1:FindFirstChild("SquishyPlaceHolder"),"?"
if pS then for Df,pU in ipairs(pS:GetChildren())do if pU:IsA("Model")then pT=pU.Name break end end end local xx=tostring(a1:GetAttribute("Helpers")or"")
local jw=0 for Dg in xx:gmatch("%d+")do jw=jw+1 end dW[#dW+1]={st=a1,ends=pR,sure=jv~=nil,id=a1:GetAttribute("PourId"),name=pT,helps=jw,
long=a1:GetAttribute("PourLong")==true}end end end table.sort(dW,function(xy,xz)return xy.ends<xz.ends end)return dW
end function y.glazeCount()local pV=ag:FindFirstChild("Remotes")local pW=pV and pV:FindFirstChild("EditStack")
if not pW then return nil end local xA,dX=pcall(function()return pW:InvokeServer("State",nil)end)if not(xA and type(dX)=="table"and type(dX.state)=="table")then return nil end
local jx,jy=0,{}for Dh,f6 in ipairs(dX.state.entries or{})do if f6 .glaze and f6 .glaze~=""then jx=jx+1 jy[f6 .glaze]=(jy[f6 .glaze]or 0)+1 end
end return jx,jy,#(dX.state.entries or{}),dX.state.capacity end function y.finishedOne(f7,pX)y.finished=y.finished+1
task.wait(2)local jz,xC,pY,xD=y.glazeCount()if jz and pX and jz>pX then y.glazed=y.glazed+1 local jA={}for xE,xF in pairs(xC)do jA[#jA+1]=xE.." "..xF end
z(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ai(aa(f7 .name)),f7 .st.Name,jz,table.concat(jA,", ")))
else z(("wax done on station %s: %s, no glaze%s"):format(f7 .st.Name,ai(aa(f7 .name)),pY and(" (stack "..pY.."/"..tostring(xD)..")")or""))
end end function y.tick()y.list=y.waxes()if y.editing and x()-(y.editingSince or x())>120 then y.editing=false end
if y.editing then y.msg="rebuilding teams..."return end if not d.Teams then y.want,y.msg="","auto teams is off"return end
local b8=l.srv()local aE=y.glazeFor if aE then local dY=aE.st local pZ=dY.Parent and dY:GetAttribute("HasSquishy")and dY:GetAttribute("PourId")==aE.id
local p0=pZ and y.left(dY)if p0 then aE.ends=b8+p0 end if not pZ then y.glazeFor,y.afterUntil=nil,x()+1.5 if not y.done[aE.id or"?"]then
y.done[aE.id or"?"],y.doneN=true,y.doneN+1 if y.doneN>400 then y.done,y.doneN={[aE.id or"?"]=true},1 end local xG=aE.before
task.spawn(function()pcall(y.finishedOne,aE,xG)end)end elseif aE.ends-b8>d.GlazeLead*3+60 or b8>aE.ends+90 then
y.glazeFor,y.afterUntil=nil,x()+1.5 y.later[aE.id or"?"]=x()+120 z(("station %s is not finishing yet (%s left) - glaze team off again"):format(dY.Name,y.clock(aE.ends-b8)))
end end if d.TeamGlaze~=""and not y.glazeFor then local xH=y.speedRatio(d.TeamGlaze)for Di,b9 in ipairs(y.list)do
if b9 .sure and(b9 .ends-b8)*xH[b9 .long and 2 or 1]<=d.GlazeLead and x()>=(y.later[b9 .id or"?"]or 0)and not y.done[b9 .id or"?"]then
y.glazeFor=b9 task.spawn(function()b9 .before=y.glazeCount()end)break end end end local aF,dZ="",""local cI=q.snapAt and(q.snapAt-b8)
if cI and cI<-8 then q.snapAt,cI=nil,nil end if d.TeamGlaze~=""and cI and cI<=20 then aF,dZ=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cI)))
elseif d.TeamGlaze~=""and(y.glazeFor or x()<(y.afterUntil or 0))then aF,dZ=d.TeamGlaze,y.glazeFor and(" - station "..y.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(y.placing or y.aboutToPlace())then aF,dZ=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and y.allBusy()then
aF,dZ=d.TeamFull," - every station is busy"else aF=d.TeamNormal end y.want=aF local d0=y.current()y.cur=d0 if aF~=""and d0~=aF and x()>=(y.nextTry or 0)then
y.nextTry=x()+1.1 if y.equip(aF)then z("team: "..aF..dZ)else y.nextTry=x()+3 end end local jB=y.list[1]y.msg=("on: %s%s | next wax done %s"):format(d0~=""and d0 or"(not a saved team)",(aF~=""and aF~=d0)and(" -> "..aF)or"",
jB and("in "..y.clock(jB.ends-b8).." (st "..jB.st.Name..")")or"- none running")end function y.clock(bC)bC=math.max(0,math.floor(bC))
if bC>=3600 then return("%d:%02d:%02d"):format(math.floor(bC/3600),math.floor((bC%3600)/60),bC%60)end return("%d:%02d"):format(math.floor(bC/60),bC%60)
end function y.allBusy()local xI,xJ=eZ()return xJ>0 and xI==0 end function y.aboutToPlace()if not c.running then return false end
local p1=ac()if not(p1 and aI(p1))then return false end local xK=eZ()return xK>0 end function y.mult(p2,xL,p3)return{(1+p2)*(1+p3),(1+p2+xL)*(1+p3)}end
function y.speedNow()local function jC(xM)return tonumber(F:GetAttribute(xM))or 0 end return y.mult(jC("PetWaxSpeed"),jC("PetLongWax"),jC("PetSocialWax"))
end function y.speedOf(xN)local xO,p4=y.teams()if not p4 then return nil end for Dj,p5 in ipairs(xO)do if p5 .name==xN then
local jD={}for Dk,xP in ipairs(p5 .pets or{})do for Dl,p6 in ipairs(p4 .pets or{})do if tostring(p6 .id)==tostring(xP)then jD[#jD+1]=p6 break end end
end local p7=A.caps()local p8,xQ=A.stats(jD)return y.mult(math.min(p8 .waxSpeed or 0,p7 .waxSpeed or 0.25),math.min(p8 .longWax or 0,p7 .longWax or 0.3),xQ.socialWax or 0)
end end return nil end function y.speedRatio(xR)local p9,jE=y.speedNow(),y.speedOf(xR)if not jE then return{1,1}end
return{p9[1]/jE[1],p9[2]/jE[2]}end function y.glazeSoon()return d.Teams and d.TeamGlaze~=""and(y.glazeFor~=nil or x()<(y.afterUntil or 0))
end A.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
A.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}A.buildMsg,A.fuseMsg,A.fused,A.builds="","",0,0
function A.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function A.caps()local jF=l.info()return(jF and type(jF.Caps)=="table")and jF.Caps or A.CAPS
end function A.value(p_,jG)local f8=l.info()local cJ=f8 and f8 .Pets[p_]if not(cJ and type(cJ.boost)=="table")then return nil end
local b_ if type(f8 .boostValue)=="function"then local xS,xT=pcall(f8 .boostValue,p_,(jG~=""and jG)or nil)b_=xS and tonumber(xT)or nil
end if not b_ then b_=cJ.boost.value or 0 if jG=="Big"then local qa=b_*1.5 b_=A.ROUND[cJ.boost.kind]and math.max(b_+1,math.floor(qa+0.5))or qa
end end return cJ.boost.kind,b_,cJ.boost.every end function A.stats(xU)local ca,jH={},{}for Dm,qb in ipairs(xU)do
local aR,f9,qc=A.value(qb.name,qb.variant or"")if aR then if aR:sub(1,6)=="social"then jH[aR]=math.max(jH[aR]or 0,f9)
elseif aR=="waxStir"or aR=="cashGift"then ca[aR]=(ca[aR]or 0)+f9*60/(qc or 60)elseif aR=="luckyPull"then ca.luckyPull=(ca.luckyPull or 0)+f9/(qc or 10)
else ca[aR]=(ca[aR]or 0)+f9 end end end return ca,jH end function A.glazeGain(xV,f_)local d1,jI,Dn={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local xW=d1[1]+d1[2]+d1[3]local xX=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local cK={}for ga=1,3 do cK[ga]=d1[ga]+xV*d1[ga]/xW+(ga==1 and xX or 0)end
local jJ={cK[1]*(1-f_),cK[2]*(1-f_)+cK[1]*f_,cK[3]+cK[2]*f_}return jJ[1]*(jI[1]-1)+jJ[2]*(jI[2]-1)+jJ[3]*(jI[3]-1)
end function A.score(gb,xY)local jK=A.caps()local gc,gd=A.stats(xY)local function bh(qd)return math.min(gc[qd]or 0,jK[qd]or math.huge)end
local xZ=(1+bh("income"))*(1+(gd.socialIncome or 0))*(1+math.min(gc.cashGift or 0,jK.cashGiftPerMinute or 9)/60)
local x0=1+bh("luck")+(gc.luckyPull or 0)+(gd.socialLuck or 0)local qe=x0*(1+bh("newFind"))*(1+bh("rollSpeed"))
local d2=math.log(xZ)local x1=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local jL=(1+bh("waxSpeed")+bh("longWax"))*(1+(gd.socialWax or 0))
+math.min(gc.waxStir or 0,jK.waxStirPerMinute or 30)/60/x1 local x2=1-(1-bh("headStart"))*(1-(gd.socialHeadStart or 0))
if gb=="farm"then return d2+0.7*math.log(qe)+0.1*math.log(jL)end if gb=="full"then return d2+0.4*math.log(jL)+0.02*math.log(qe)end
if gb=="glaze"then return A.glazeGain(bh("glaze"),bh("glazeUp"))+0.001*d2 end if gb=="wax"then return-math.log(1-0.5*x2)+0.001*d2+0.001*math.log(jL)end
return d2 end function A.best(qf,cL,x3,jM)jM=jM or{}local ay,d3={},{}local function qg(x4)local qh={}for x5,x6 in ipairs(x4)do qh[x5]=cL[x6]end return qh end
local function jN(qi)local jO=A.score(qf,qg(qi))for Do,x7 in ipairs(qi)do if jM[cL[x7].id]then jO=jO+1e-7 end end
return jO end for Dp=1,math.min(x3,#cL)do local ge,jP for jQ=1,#cL do if not d3[jQ]then ay[#ay+1]=jQ local qj=jN(ay)
ay[#ay]=nil if not jP or qj>jP+1e-12 then ge,jP=jQ,qj end end end if not ge then break end d3[ge]=true ay[#ay+1]=ge
end for Dq=1,6 do task.wait()local qk,ql=false,jN(ay)for jR=1,#ay do for jS=1,#cL do if not d3[jS]then local qm=ay[jR]
ay[jR]=jS local qn=jN(ay)if qn>ql+1e-9 then d3[qm],d3[jS],ql,qk=nil,true,qn,true else ay[jR]=qm end end end end
if not qk then break end end local qo={}for x8,x9 in ipairs(ay)do qo[x8]=tostring(cL[x9].id)end return qo,A.score(qf,qg(ay))
end function A.count(qp,qq,x_)local d4,d5={},0 local qr,qs={},{}for Dr,ya in ipairs(qq.arriving or{})do qr[tostring(ya)]=true end
for Ds,cM in ipairs(qq.pets or{})do qs[tostring(cM.id)]=true if cM.name==qp and not qr[tostring(cM.id)]then if cM.variant=="Big"then d5=d5+1 elseif(cM.variant or"")==""then d4[#d4+1]=cM end
end end if not x_ then for Dt,d6 in ipairs(l.recent or{})do if d6 .name==qp and not qs[d6 .id]and x()-d6 .at<20 then
if d6 .variant=="Big"then d5=d5+1 else d4[#d4+1]=d6 end end end end return d4,d5 end function A.goal(yb)local qt=d.Pets[yb]return qt and tonumber(qt.f)or 0 end
function A.wantMore(qu,yc,qv)local jT=A.goal(qu)if jT<=0 or not qv then return true end local yd,qw=A.count(qu,qv)
if qw>=jT then return false end if yc=="Big"then return true end return#yd<A.need()*(jT-qw)end function A.status(qx,qy)
local gf=A.goal(qx)if gf<=0 or not qy then return nil end local ye,jU=A.count(qx,qy)if jU>=gf then return("Big %d/%d done"):format(jU,gf)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#ye,A.need()),A.need(),jU,gf)end function A.wear(jV)local jW={}
for Du,yf in ipairs(jV)do jW[tostring(yf)]=true end for Dv=1,3 do local cN=l.data()if not cN then return false end
for Dw,qz in ipairs(cN.equipped or{})do if not jW[tostring(qz)]then l.call("unequip",qz)task.wait(0.3)end end
cN=l.data()local qA={}for Dx,yg in ipairs(cN.equipped or{})do qA[tostring(yg)]=true end for Dy,qB in ipairs(jV)do
if not qA[tostring(qB)]then l.call("equip",qB)task.wait(0.3)end end task.wait(0.4)cN=l.data()local jX,qC=0,true
for Dz,yh in ipairs(cN.equipped or{})do jX=jX+1 if not jW[tostring(yh)]then qC=false end end if qC and jX==#jV then return true end
end return false end function A.saveTeam(qD,qE)if not A.wear(qE)then return false,"could not put the pets on"end
local yi=y.teams()local cb for yj,yk in ipairs(yi)do if yk.name==qD then cb=yj break end end local cO if cb then
cO=l.call("teamSave",cb)else cO=l.call("teamNew")if type(cO)=="table"and cO.ok and cO.index then cb=cO.index task.wait(0.3)
l.call("teamRename",{index=cb,name=qD})end end task.wait(0.4)local jY=l.data()local qF=jY and jY.teams and cb and jY.teams[cb]
if not qF then return false,"the game did not save it"end local qG={}for DA,yl in ipairs(qF.pets or{})do qG[tostring(yl)]=true end
for DB,ym in ipairs(qE)do if not qG[tostring(ym)]then return false,"saved, but not with these pets"end end return true
end A.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function A.quiet()
if y.placing or y.glazeSoon()then return false end local yn=l.srv()for DC,yo in ipairs(y.list or{})do if yo.ends-yn<(d.GlazeLead or 45)+90 then return false end end
return true end function A.plan()local d7=l.data()if not d7 then return{}end local qH={}for DD,yp in ipairs(d7 .arriving or{})do qH[tostring(yp)]=true end
local d8={}for DE,gg in ipairs(d7 .pets or{})do if not qH[tostring(gg.id)]then d8[#d8+1]={id=tostring(gg.id),name=gg.name,variant=gg.variant or""}end
end local qI={}for DF,qJ in ipairs(d8)do qI[qJ.id]=qJ end local qK=tonumber(d7 .slots)or 3 local jZ,qL={},{}for DG,gh in ipairs(A.ROLES)do
local d9=d[gh[1]]if d9~=""and not qL[d9]then qL[d9]=true local j0,d_,qM={},{},false for DH,qN in ipairs(d7 .teams or{})do
if qN.name==d9 then for DI,yq in ipairs(qN.pets or{})do local j1=qI[tostring(yq)]if j1 then j0[j1 .id]=true d_[#d_+1]=j1 else qM=true end
end end end local j2,qO=A.best(gh[2],d8,qK,j0)local qP=A.score(gh[2],d_)local qQ=#j2==#d_ for DJ,yr in ipairs(j2)do if not j0[yr]then qQ=false end end
if not qQ and(qM or#d_<math.min(qK,#d8)or qO>qP+1e-4)then jZ[#jZ+1]={team=d9,role=gh[2],ids=j2,gain=qO-qP}end
end end return jZ end function A.rebuild(ys)local qR=A.plan()if#qR==0 then A.buildMsg="teams are already the best your pets allow"return true end
if not A.quiet()then A.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end y.editing,y.editingSince=true,x()
local gi=true local yw,yx=pcall(function()for DK,ea in ipairs(qR)do local yt,yu=A.saveTeam(ea.team,ea.ids)local qS=l.data()
local j3={}for DL,yv in ipairs(ea.ids)do for DM,j4 in ipairs(qS and qS.pets or{})do if tostring(j4 .id)==yv then j3[#j3+1]=l.nice(j4 .name,j4 .variant)end
end end if yt then z(("TEAM %s rebuilt (%s): %s"):format(ea.team,ys or"pets changed",table.concat(j3,", ")))else gi=false z(("TEAM %s: %s"):format(ea.team,tostring(yu)))end
end end)y.editing,y.nextTry=false,0 if not yw then gi=false z("TEAM BUILD ERR "..tostring(yx))end A.builds=A.builds+1
A.buildMsg=gi and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return gi end
function A.fuseTick()if not d.AutoFuse or y.editing then return end local gj=l.data()if not gj then return end
local j5=A.need()local j6,gk={},{}for DN,yy in ipairs(gj.teams or{})do for DO,yz in ipairs(yy.pets or{})do j6[tostring(yz)]=true end end
for DP,yA in ipairs(gj.equipped or{})do gk[tostring(yA)]=true end A.failUntil=A.failUntil or{}for cc,yB in pairs(d.Pets)do
local qT=tonumber(yB.f)or 0 local j7,yC=A.count(cc,gj,true)if qT>0 and yC<qT and#j7>=j5 and x()>=(A.failUntil[cc]or 0)then
table.sort(j7,function(gl,gm)local qU=(gk[tostring(gl.id)]and 4 or 0)+(j6[tostring(gl.id)]and 2 or 0)+(gl.named and 1 or 0)
local qV=(gk[tostring(gm.id)]and 4 or 0)+(j6[tostring(gm.id)]and 2 or 0)+(gm.named and 1 or 0)if qU~=qV then return qU<qV end
return tostring(gl.id)<tostring(gm.id)end)local gn,j8={},{}for go=1,j5 do gn[go]=tostring(j7[go].id)if gk[gn[go]]then j8[#j8+1]=gn[go]end
end y.editing,y.editingSince=true,x()for DQ,yD in ipairs(j8)do l.call("unequip",yD)task.wait(0.3)end local gp=l.call("fuse",{ids=gn})
y.editing,y.nextTry=false,0 if type(gp)=="table"and gp.ok then A.fused=A.fused+1 A.dirtyAt=x()z(("FUSED %d %s -> Big %s"):format(j5,l.nice(cc),l.nice(cc)))
A.fuseMsg=("fused a Big %s %s"):format(l.nice(cc),os.date("%H:%M"))else A.failUntil[cc]=x()+120 z(("fuse %s failed: %s"):format(l.nice(cc),type(gp)=="table"and tostring(gp.reason or"no reason given")or"no answer"))
end return end end end function A.tick()pcall(A.fuseTick)if not d.AutoBuild or not d.Teams then return end local qW=l.data()
if not qW then return end local cd={}for DR,yE in ipairs(qW.pets or{})do cd[#cd+1]=tostring(yE.id)end table.sort(cd)
cd=table.concat(cd,",")if cd~=A.sig then A.sig,A.dirtyAt=cd,x()end local yF=(A.dirtyAt and x()-A.dirtyAt>8)or x()-(A.lastBuild or 0)>900
if yF and not y.editing then local yG=A.rebuild(A.dirtyAt and"pets changed"or"check")if yG then A.dirtyAt,A.lastBuild=nil,x()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(ce)return ce:IsA("ParticleEmitter")or ce:IsA("Trail")or ce:IsA("Beam")or ce:IsA("Fire")or ce:IsA("Smoke")
or ce:IsA("Sparkles")or ce:IsA("Light")end function j.muteOne(aG)if not d.Lite or not aG.Parent then return end
local gq=(aG:IsA("BillboardGui")and j.bb)or(j.isFx(aG)and j.fx)or nil if not gq or gq[aG]~=nil then return end
gq[aG]=aG.Enabled if aG.Enabled then aG.Enabled=false end j.watch[aG]=aG:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aG.Enabled then gq[aG]=true aG.Enabled=false end end)end function j.lite(qX)d.Lite=qX if qX then
task.spawn(function()for yH,yI in ipairs(au:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,yI)
if yH%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=V(au.DescendantAdded:Connect(function(j9)
if d.Lite and(j9:IsA("BillboardGui")or j.isFx(j9))then j.queue[#j.queue+1]=j9 end end))end local j_=game:GetService("Lighting")
for DS,eb in ipairs(j_:GetChildren())do if eb:IsA("PostEffect")and eb.Enabled and j.post[eb]==nil then j.post[eb]=true eb.Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and j_.GlobalShadows or j.oldShadows j_.GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and au.Terrain.Decoration or j.oldDeco au.Terrain.Decoration=false end)
else for DT,yJ in pairs(j.watch)do pcall(function()yJ:Disconnect()end)end for qY,yK in pairs(j.bb)do pcall(function()if qY.Parent then qY.Enabled=yK end end)end
for qZ,yL in pairs(j.fx)do pcall(function()if qZ.Parent then qZ.Enabled=yL end end)end for q0 in pairs(j.post)do pcall(function()if q0 .Parent then q0 .Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local yM=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()yM.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()au.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(q1)d.HideHud=q1 local ka=F:FindFirstChildOfClass("PlayerGui")if not ka then return end if q1 then
for DU,ec in ipairs(ka:GetChildren())do if ec:IsA("ScreenGui")and not j.MINE[ec.Name]and ec.Enabled then j.hud[ec]=true ec.Enabled=false end
end if not j.hudConn then j.hudConn=V(ka.ChildAdded:Connect(function(ed)if d.HideHud and ed:IsA("ScreenGui")and not j.MINE[ed.Name]then
task.defer(function()if d.HideHud and ed.Enabled then j.hud[ed]=true ed.Enabled=false end end)end end))end else
for q2 in pairs(j.hud)do pcall(function()if q2 .Parent then q2 .Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(kb)d.FpsCap=kb local q3=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not q3 then return false end return pcall(q3,kb==0 and 60 or kb)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(am)if am:IsA("BasePart")or am:IsA("Decal")or am:IsA("Texture")then if am.Transparency<1 then j.unseen[am]=am.Transparency am.Transparency=1 end
elseif am:IsA("BillboardGui")or am:IsA("SurfaceGui")or am:IsA("ParticleEmitter")or am:IsA("Beam")or am:IsA("Trail")or am:IsA("Light")or am:IsA("Fire")or am:IsA("Smoke")or am:IsA("Sparkles")then
if am.Enabled then j.unseen[am]=true am.Enabled=false end end end function j.notMine(yN)return d.HideMine or(c.plot and not yN:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(q4)if d.HideBases then j.bases(false)end d.HideMine=q4==2 if q4>0 then j.bases(true)end end
function j.bases(q5)d.HideBases=q5 local kc=au:FindFirstChild("Plots")if not kc then return end if q5 then task.spawn(function()
local kd=0 for DV,q6 in ipairs(kc:GetChildren())do if q6~=c.plot or d.HideMine then for DW,yO in ipairs(q6:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,yO)kd=kd+1 if kd%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=V(kc.DescendantAdded:Connect(function(q7)if d.HideBases and j.notMine(q7)then task.defer(function()pcall(j.hideOne,q7)end)end
end))end else for ke,q8 in pairs(j.unseen)do pcall(function()if not ke.Parent then return end if type(q8)=="number"then ke.Transparency=q8 else ke.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(q9)d.NoRender=q9 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not q9)end)
end function j.restoreAll()pcall(j.unpin)if d.HideBases then pcall(j.bases,false)end if E.arPaused then pcall(E.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(q_)if c.rejoining then return end z("REJOIN this server ("..q_..")")
pcall(e2)if c.autoload then pcall(fr,c.autoload)end ns()local yP=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then dr(q_..", same server failed")end end)return yP end function j.tick()
local kf=j.queue if d.Lite and kf and#kf>0 then j.queue={}for yQ,yR in ipairs(kf)do pcall(j.muteOne,yR)if yQ%300==0 then task.wait()end end
end local ra=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if ra then for DX,yS in ipairs(ra:GetChildren())do
local rb=yS:FindFirstChild("SquishyPlaceHolder")local cf=rb and rb:FindFirstChild("TimerGui")if cf and cf:IsA("BillboardGui")then
if j.bb[cf]==nil then pcall(j.muteOne,cf)elseif cf.Enabled then j.bb[cf]=true cf.Enabled=false end end end end
local yT,ee=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if yT and type(ee)=="number"then
j.mem=ee j.memPeak=math.max(j.memPeak,ee)if(d.MemLimit or 0)>0 and ee>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(ee,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if x()-(j.noteAt or 0)>1800 then j.noteAt=x()z(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function kg(gr)if type(gr)~="string"then return false end
gr=gr:lower()for DY,yU in ipairs(c.sellWords)do if gr:find(yU,1,true)then return true end end return false end
local function yV()local rc=ag:FindFirstChild("Remotes")local kh=rc and rc:FindFirstChild("SellSquishy")if not(kh and kh:IsA("RemoteEvent"))then return false end
if not pcall(function()kh:FireServer()end)then return false end return ao(function()return ac()==nil end,1.5)
end local function yW()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local rd=ar()local re=rd and rd.HumanoidRootPart.Position local ef,rf for DZ,cP in ipairs((c.plot or au):GetDescendants())do
if cP:IsA("ProximityPrompt")and(kg(cP.ActionText)or kg(cP.ObjectText)or kg(cP.Name))then local rg=mq(cP)local ki=(rg and re)and(rg-re).Magnitude or 1e9
if ki<=400 and(not ef or ki<rf)then ef,rf=cP,ki end end end c.sellSpot=ef c.noSellSpot=(ef==nil)return ef end
local function rh()local kj=ac()if not kj then c.holding=false return false end if aI(kj)then return false end
local kk=ai(aa(kj))if yV()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
z("SOLD "..kk)return true end local cQ=yW()if cQ then local ri=dd(cQ)if ri then bY(ri,cQ)local rj=ac()if rj and not aI(rj)then
local yX,yY=dw(cQ,function()return ac()==nil end,function()return cQ.Enabled end)if yX then c.sold,c.holding,c.sellFails=c.sold+1,false,0
z(("SOLD %s at %s via %s"):format(kk,eX(cQ),yY))return true end end end end c.sellFails=c.sellFails+1 z("could not sell "..kk.." ("..c.sellFails..")")
return false end local yZ={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function y0(cR)local gs=eX(cR):lower()for D0,y1 in ipairs(yZ)do if gs:find(y1,1,true)then return 0 end end
local a2,ap=cR.Name:lower(),0 local function aS(y2,y3)return y2:find(y3,1,true)~=nil end if aS(a2,"collect")then ap=ap+60 end
if aS(a2,"cash")or aS(a2,"money")then ap=ap+45 end if aS(a2,"income")or aS(a2,"claim")then ap=ap+35 end if aS(a2,"coin")or aS(a2,"earn")or aS(a2,"green")then ap=ap+20 end
if a2=="pad"or a2=="touch"then ap=ap+25 end if ap==0 and(aS(gs,"collect")or aS(gs,"cash")or aS(gs,"money"))then ap=25 end
if ap==0 then return 0 end local eg=cR.Color if eg.G>0.5 and eg.G>eg.R*1.4 and eg.G>eg.B*1.4 then ap=ap+15 end
if math.min(cR.Size.X,cR.Size.Y,cR.Size.Z)<2 then ap=ap+5 end return ap end local function y4()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local gt,eh,kl={},nil,29 for D1,gu in ipairs(c.plot:GetDescendants())do
if gu:IsA("BasePart")then local gv=y0(gu)if gv>0 then gt[#gt+1]={s=gv,p=gu}if gv>kl then eh,kl=gu,gv end end end
end table.sort(gt,function(y5,y6)return y5 .s>y6 .s end)c.padCands,c.padPart=gt,eh if eh then z("collect pad: "..eX(eh).." (score "..kl..")")end
return eh end local km="SAB_pad_v1.txt"local function y7(y8)if type(writefile)=="function"then pcall(writefile,km,table.concat({y8:GetComponents()},","))end
end local function y9()if type(isfile)~="function"or type(readfile)~="function"then return nil end local y_,rk=pcall(function()if isfile(km)then return readfile(km)end end)
if not y_ or type(rk)~="string"then return nil end local gw={}for za in rk:gmatch("[^,]+")do gw[#gw+1]=tonumber(za)end
if#gw==12 then return CFrame.new(unpack(gw))end end local function zb(kn,gx,zc)local zd=cz(kn)local ko=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aT=(ko and ko:IsA("BasePart"))and(ko.Position-gx)or Vector3 .new(1,0,0)aT=Vector3 .new(aT.X,0,aT.Z)if aT.Magnitude<0.05 then aT=Vector3 .new(1,0,0)end
aT=aT.Unit for ze=0,7 do local gy=ze*math.pi/4 local zf=Vector3 .new(aT.X*math.cos(gy)-aT.Z*math.sin(gy),0,aT.X*math.sin(gy)+aT.Z*math.cos(gy))
local gz=gx+zf*(zc+5)local kp=fA(gz.X,gx.Y,gz.Z)if kp and math.abs(kp.Y-gx.Y)<8 then aC(kn,Vector3 .new(gz.X,kp.Y+zd,gz.Z))
if iv(kn,0.7)then return true end end end return false end local function zg()c.lastCollect=x()local ei=ar()if not ei then return end
local rl,zh=ei.HumanoidRootPart,cz(ei)local ej,rm,ek,kq=nil,4,nil,"?"local kr=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and kr and kr:IsA("BasePart")then ej,kq=(kr.CFrame*c.manualPad).Position,"manual pad"else local bi=y4()
if bi then ej=Vector3 .new(bi.Position.X,bi.Position.Y+bi.Size.Y/2+zh,bi.Position.Z)rm,ek,kq=math.max(bi.Size.X,bi.Size.Z)/2,bi,bi.Name
end end if not ej then z("COLLECT: pad not found - stand on it and tap SET PAD")return end local ks=a7()aC(ei,ej)
if ek and type(firetouchinterest)=="function"then pcall(firetouchinterest,rl,ek,0)end af(d.PadDwell)if ek and type(firetouchinterest)=="function"then pcall(firetouchinterest,rl,ek,1)end
af(0.5)c.collected=c.collected+1 local kt=a7()z(("COLLECTED (%s) %s"):format(kq,(ks and kt and kt>ks)and("+$"..aJ(kt-ks))or"no cash change seen"))
zb(ei,ej,rm)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function q.mods()if q.si and x()-q.modAt<120 then return true end
local rn=ag:FindFirstChild("Modules")if not rn then return false end local function ku(zi)local ro=rn:FindFirstChild(zi)
if not ro then return nil end local zj,rp=pcall(require,ro)return(zj and type(rp)=="table")and rp or nil end q.si,q.arm,q.ci=ku("SquishyInfo"),ku("AutoRollRules"),ku("CrateInfo")
q.modAt=x()if not q.si then return false end local kv={}if q.arm and type(q.arm.tierOf)=="table"then for kw in pairs(q.arm.tierOf)do
local gA=q.si[kw]if type(gA)=="table"and gA.rarity~="Limited"and not gA.incomeType and not gA.hiddenAfter then kv[aa(kw)]=kw end
end end q.roll=kv local gB={}for zk,zl in pairs(kv)do local el=q.si[zl]if type(el)=="table"and type(el.income)=="number"and not el.incomeType then
gB[#gB+1]={k=zk,inc=el.income,pr=tonumber(el.price)or 0}end end table.sort(gB,function(kx,ky)if kx.inc~=ky.inc then return kx.inc>ky.inc end return kx.pr>ky.pr end)
q.order=gB local gC,kz,kA local zm=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for zn,kB in pairs(zm)do
local kC=type(kB)=="table"and tonumber(kB.price)if kC and(not kz or kC>kz)then gC,kz,kA=zn,kC,kB.title end end
q.bestCrate,q.bestCrateName=gC and L.key(gC),gC q.bestCrateTitle=kA and L.key(kA)or nil return true end function q.rank(zo)
local zp,zq=pcall(function()return q.arm.rankOf(zo)end)return(zp and tonumber(zq))or 0 end function q.loadDisc(rq)
if type(rq)~="table"then return end local rr={}for zr,zs in pairs(rq)do if zs then rr[aa(tostring(zr))]=true end end
q.disc,q.discAt=rr,x()end function q.fetch()q.discAt=x()local rs=ag:FindFirstChild("Remotes")local rt=rs and rs:FindFirstChild("GetSquishiesDiscovered")
if not rt then return end local zt,zu=pcall(function()return rt:InvokeServer()end)if zt then q.loadDisc(zu)end
end function q.scanWax()local kD={}local ru=c.plot and c.plot:FindFirstChild("WaxStations")if ru then for D2,rv in ipairs(ru:GetChildren())do
local rw=rv:FindFirstChild("SquishyPlaceHolder")if rw and rv:GetAttribute("HasSquishy")then for D3,rx in ipairs(rw:GetChildren())do if rx:IsA("Model")then kD[aa(rx.Name)]=true end end
end end end for ry,zv in pairs(q.placedAt)do if x()-zv<20 then kD[ry]=true else q.placedAt[ry]=nil end end q.waxing=kD
end function q.compute()local rz,kE,kF={},0,0 if q.disc then for kG in pairs(q.roll or{})do if not q.disc[kG]then
if q.waxing[kG]then kF=kF+1 else rz[kG],kE=true,kE+1 end end end end q.need,q.nNeed,q.nWax=rz,kE,kF local rA,kH={},d.Best or 0
local kI=(kH==4)and q.stackMin or nil for zw,rB in ipairs(q.order)do if(kI and rB.inc>kI)or(not kI and zw<=(kH==4 and 1 or kH))then rA[rB.k]=true end
end q.best=rA end function q.readStack()q.stackAt=x()local rC=ag:FindFirstChild("Remotes")local rD=rC and rC:FindFirstChild("EditStack")
if not rD then return end local zx,cS=pcall(function()return rD:InvokeServer("State",nil)end)if not(zx and type(cS)=="table"and type(cS.state)=="table"and type(cS.state.entries)=="table")then return end
local gD for D4,rE in ipairs(cS.state.entries)do local em=type(rE)=="table"and q.si and q.si[tostring(rE.name)]
if type(em)=="table"and type(em.income)=="number"and not em.incomeType and(not gD or em.income<gD)then gD=em.income end
end q.stackMin=gD q.stackFull=#cS.state.entries>=(tonumber(cS.state.capacity)or 100)end function q.want(kJ)if(d.Best or 0)>0 and(next(q.best)or(d.Best==4 and q.stackMin))then
if q.best[kJ]then return true end elseif d.Targets[kJ]then return true end return d.AutoIndex==true and q.need[kJ]==true
end function q.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(q.best)~=nil)or(d.AutoIndex and next(q.need)~=nil)
or d.Best==4 end function q.placed(zy)local en=aa(zy)q.placedAt[en],q.waxing[en]=x(),true if q.need[en]then q.need[en],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
z(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ai(en)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local eo,ep={},{}for zz,zA in pairs(q.roll or{})do if q.want(zz)then eo[zA]=true end end
for rF,kK in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(rF)or(type(kK)=="table"and type(kK.title)=="string"and L.wanted(kK.title))then ep[rF]=true end
end if not next(eo)and not next(ep)then return nil end if q.arm and type(q.arm.encode)=="function"then local zB,rG=pcall(q.arm.encode,{rarities={},butters=eo,crates=ep,index=false})
if zB and type(rG)=="string"then return rG end end local function rH(zC)local gE={}for zD in pairs(zC)do gE[#gE+1]=zD end table.sort(gE)return table.concat(gE,",")end
local eq="adv:"if next(eo)then eq=eq..";butters:"..rH(eo)end if next(ep)then eq=eq..";crates:"..rH(ep)end return eq
end function q.canon(zE)local gF={}for rI in tostring(zE or""):gmatch("[^;]+")do local kL,rJ=rI:match("^(%a+):(.*)$")
if not kL then kL,rJ="r",rI:gsub("^adv:","")end for zF in rJ:gmatch("[^,]+")do gF[#gF+1]=kL.."="..zF end end table.sort(gF)
return table.concat(gF,"|")end function q.sync(zG)if F:GetAttribute("AutoRoll")~=true then return end if x()<(q.pauseUntil or 0)then return end
local cg=q.rulesNow()if not cg or#cg>1900 then return end if q.canon(F:GetAttribute("AutoRollRules"))==q.canon(cg)then q.fails=0 return end
if not zG and x()-q.sentAt<4 then return end local rK=ag:FindFirstChild("Remotes")local rL=rK and rK:FindFirstChild("AutoRollAction")
if not rL then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,x()+300 z("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=x()C.replaying=true pcall(function()rL:FireServer("Rules",cg)end)C.replaying=false d.ARrules=cg
local gG,gH=0,0 for D5 in(cg:match("butters:([^;]*)")or""):gmatch("[^,]+")do gG=gG+1 end for D6 in(cg:match("crates:([^;]*)")or""):gmatch("[^,]+")do gH=gH+1 end
local rM=gG.."/"..gH if q.told~=rM then q.told=rM z(("auto roll now stops on %d butters and %d crates"):format(gG,gH))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if x()-q.discAt>30 then q.fetch()end
q.scanWax()if d.Best==4 and x()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aL={}if d.AutoIndex then aL[#aL+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if d.Best==4 then local er=0 for D7 in pairs(q.best)do er=er+1 end
aL[#aL+1]=er==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(er,er==1 and""or"s")
elseif(d.Best or 0)>0 and q.order[1]then aL[#aL+1]="best: "..ai(q.order[1].k)end if d.BestCrate and q.bestCrateName then aL[#aL+1]="crate: "..q.bestCrateName end
if Q.got>0 then aL[#aL+1]="shower: "..Q.got end q.msg=#aL>0 and table.concat(aL," | ")or"index / best: off"end
q.heard={}function q.admin(zH,aU,gI)if zH~="Effect"then return end if aU=="Shower"then Q.add(gI)return end if aU=="ShowerTaken"then Q.gone(gI)return end
if aU=="ShowerClear"then Q.drops={}return end if aU=="WaxGlow"then local kM=type(gI)=="table"and tonumber(gI.SnapAt)
if kM then q.snapAt=kM z(("ADMIN: every wax finishes in %ds%s"):format(math.floor(kM-l.srv()),(d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end aU=tostring(aU)bU("Admin "..aU)if aU~="GoalPoint"and x()-(q.heard[aU]or-100)>30 then q.heard[aU]=x()
z("ADMIN: "..aU)end end Q.drops,Q.tried,Q.got,Q.miss={},{},0,0 function Q.add(kN)if type(kN)~="table"or type(kN.Pieces)~="table"then return end
for D8,aV in pairs(kN.Pieces)do if type(aV)=="table"and aV.Id~=nil and aV.Position~=nil then Q.drops[aV.Id]={id=aV.Id,butter=tostring(aV.Butter or"?"),rar=tostring(aV.Rarity or"?"),star=aV.Star==true,
pos=aV.Position,opens=tonumber(aV.OpensAt)or 0,ends=tonumber(aV.ExpiresAt)or 0}end end end function Q.gone(es)
if type(es)~="table"or es.Id==nil then return end Q.drops[es.Id]=nil if tonumber(es.UserId)==l.uid then Q.mine=es.Id end
end function Q.pick()local kO=l.srv()local kP,rN for rO,cj in pairs(Q.drops)do if kO>=cj.ends-0.3 then Q.drops[rO]=nil
elseif kO>=cj.opens-0.2 and(Q.tried[rO]or 0)<3 then local rP=(aI(cj.butter)and 1e6 or 0)+(cj.star and 1e5 or 0)+q.rank(cj.rar)*100-(cj.ends-kO)
if not kP or rP>rN then kP,rN=cj,rP end end end return kP end function Q.due()return d.Shower and c.running and next(Q.drops)~=nil and not ac()and Q.pick()~=nil
end function Q.grab()local aM,kQ=Q.pick(),ar()if not(aM and kQ)then return end Q.tried[aM.id]=(Q.tried[aM.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aC(kQ,aM.pos+Vector3 .new(0,cz(kQ)+0.5,0))ao(function()return Q.mine==aM.id or ac()~=nil or not Q.drops[aM.id]end,1.5)
if Q.mine==aM.id or ac()then Q.got,Q.drops[aM.id]=Q.got+1,nil z(("GRABBED %s [%s]%s from the admin shower"):format(ai(aa(aM.butter)),aM.rar,aM.star and" (star)"or""))
elseif not Q.drops[aM.id]then Q.miss=Q.miss+1 end end local et local function rQ()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 z("trying again after being stopped for 5 minutes")et(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ar()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bp(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local kR,rR=eZ()
local gJ=ac()if gJ then local cT=ai(aa(gJ))if not aI(gJ)then local kS=(W.gift and aa(W.gift)==aa(gJ)and x()-W.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cT,kS),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cT,kS),"bad"end return"sell",("selling %s (%s)"):format(cT,kS),"warn"
end if kR<1 then return nil,("holding %s - 0 free stations"):format(cT),"wait"end if y.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cT),"wait"end
return"place",("waxing %s (%d free)"):format(cT,kR),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local kT=c.plot:FindFirstChild("CrateStand")if kT then for D9,eu in ipairs(kT:GetDescendants())do
if eu:IsA("ProximityPrompt")and eu.Enabled and iL(eu)then local bj=eu.ObjectText if bj==""then bj=cs(kT,"TitleLabel")or""end
if bj~=""and L.wanted(bj)then local zI=eV(bj):gsub("crate$","")local rS for rT in pairs(ad.members)do if eV(rT)==zI then rS=rT end end
e.waiting,e.at,e.title,e.prompt=true,x(),bj,eu e.data={name=(bj:gsub("%s","")),rarity=rS,title=bj}z(bj.." found waiting on your stand")
end break end end end end local rU=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and rU then
local aW=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(aW),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 z("could not press the "..aW.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(aW),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(aW),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
aW,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(aW),"ok"end if e.at and x()-e.at>e.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(aW,math.floor(e.GIVEUP/60)),"bad"
end if e.summonFails>=3 then if x()-e.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(aW,
math.ceil(45-(x()-e.lastFail))),"bad"end e.summonFails,e.nearFails,e.prompt=0,0,nil z("trying the "..aW.." again")
end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(aW),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(aW,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not rU then local rV=e.title..tostring(e.rolledAt)if e.told~=rV then e.told=rV z(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if kR<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(rR,rR),"wait"
end local kU=mE()if not kU then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local cU=bT()
if cU and n2(cU.name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(cU.name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(cU.name),"bad"end if not ol()then return nil,("%s rolled - waiting for it to land on the stand"):format(cU.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(cU.name),"ok"end local bD=it()if bD.state~="match"then
c.matchSince=nil if bD.state=="skip"and not kU.Enabled then return nil,bD.text.." (sold out)","idle"end return nil,bD.text,bD.level
end if not kU.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local ev=x()if ev<c.noCashUntil then
local rW,zJ=nB()if rW then return nil,("cash short: have $%s, price ~$%s"):format(aJ(rW),aJ(zJ)),"bad"end return nil,("cash short? have $%s - retry in %ds"):format(aJ(a7()),math.ceil(c.noCashUntil-ev)),"bad"
end if ev-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end c.matchSince=c.matchSince or ev
local rX=ev-c.matchSince if rX<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bD.shown,rX),"ok"end
return"buy",("buying %s via %s"):format(bD.shown,bD.src),"ok"end j.DEPTH=11 function j.pinTick()local rY=j.hold
if not rY then return end local kV=F.Character local kW=kV and kV:FindFirstChild("HumanoidRootPart")if not kW then return end
kW.CFrame=rY kW.AssemblyLinearVelocity=Vector3 .new(0,0,0)for D_,gK in ipairs(kV:GetChildren())do if gK:IsA("BasePart")and gK.CanCollide then j.noclip[gK]=true gK.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(zK,rZ)j.hold=zK if rZ then j.surface=rZ end end function j.unpin(zL)
if not j.hold then return end j.hold=nil for r0 in pairs(j.noclip)do pcall(function()if r0 .Parent then r0 .CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local r1=ar()if r1 and j.surface and not zL then aC(r1,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bk,r2=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ar()
if not(bk and bk:IsA("BasePart")and r2)then return nil end local r3=mt()or bk.Position local gL=Vector3 .new(r3 .X-bk.Position.X,0,r3 .Z-bk.Position.Z)
gL=gL.Magnitude>0.1 and gL.Unit or Vector3 .new(0,0,1)local gM=bk.Position+gL*6 local r4=fA(gM.X,bk.Position.Y,gM.Z,{bk})
return CFrame.new(gM.X,(r4 and r4 .Y or bk.Position.Y)+cz(r2),gM.Z)end function j.ground(zM,r5,zN)local kX,kY={F.Character},nil
for Ea=1,12 do local kZ=RaycastParams.new()kZ.FilterType=Enum.RaycastFilterType.Exclude kZ.FilterDescendantsInstances=kX
local gN=au:Raycast(Vector3 .new(zM,r5,zN),Vector3 .new(0,-2000,0),kZ)if not gN then break end kY,r5=gN,gN.Position.Y-0.05
kX[#kX+1]=gN.Instance end return kY and kY.Position.Y end function j.parkHome()local k0=j.home()if not k0 then return false end
local cV=k0 .Position local zO=j.ground(cV.X,cV.Y+300,cV.Z)or(cV.Y-3)j.pin(CFrame.new(cV.X,zO-8,cV.Z),k0)return true
end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function j.setGhost(gO)d.Ghost,d.GhostHelps=gO==2,gO==1 if gO<2 then task.spawn(function()while c.busy do af(0.1)end
if j.ghostMode()<2 and j.hold and not D.home then pcall(j.unpin)end end)end j.paintGhost()z("ghost: "..j.GHOST[gO][1]:sub(8):lower())
end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end
local zP=ar()if not zP or J.seat()then return end j.parkHome()end J.n,J.fails,J.nextAt,J.msg,J.lost=0,0,0,"no campfire right now",0
function J.seat()local r6=F.Character local r7=r6 and r6:FindFirstChildOfClass("Humanoid")local k1=r7 and r7 .SeatPart
return(k1 and k1 .Name=="LogSeat")and k1 or nil end function J.due()if not(d.Campfire and c.running)or x()<J.nextAt then return false end
local zQ=au:FindFirstChild("NightSeats")if not zQ then if J.wasOn then J.wasOn,J.fails,J.lost=false,0,0 end J.msg="no campfire (comes with weather events)"
return false end J.wasOn=true if J.seat()then J.sitAt=J.sitAt or x()J.msg=("sitting at the campfire: +%s%% cash"):format(tostring(F:GetAttribute("CampfireBoost")or"?"))
return false end if J.sitAt then J.lost,J.sitAt=J.lost+1,nil if J.lost>=4 then J.nextAt,J.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
z(J.msg)return false end end return true end function J.sit()local r8,gP=au:FindFirstChild("NightSeats"),ar()
if not r8 or not gP then return end local r9,cW=gP.HumanoidRootPart.Position,{}for Eb,gQ in ipairs(r8:GetChildren())do
local r_=gQ:IsA("Seat")and gQ.Occupant==nil and gQ:FindFirstChildOfClass("ProximityPrompt")if r_ then cW[#cW+1]={st=gQ,p=r_}end
end if#cW==0 then J.nextAt,J.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cW,function(zR,zS)return(zR.st.Position-r9).Magnitude<(zS.st.Position-r9).Magnitude end)
local zT,zU=cW[1].st,cW[1].p j.unpin(true)local cX=zT.CFrame aC(gP,cX.Position+cX.LookVector*2+Vector3 .new(0,2.5,0),cX.Position)
af(0.25)local zV=dw(zU,function()return J.seat()~=nil end)if not zV then aC(gP,cX.Position+Vector3 .new(0,2,0),cX.Position+cX.LookVector)
ao(function()return J.seat()~=nil end,1.5)end if J.seat()then J.n,J.fails,J.sitAt=J.n+1,0,x()z(("SAT at the campfire (+%s%% cash)"):format(tostring(F:GetAttribute("CampfireBoost")or"?")))
else J.fails=J.fails+1 J.nextAt=x()+(J.fails>=3 and 60 or 5)J.msg="could not sit at the campfire"..(J.fails>=3 and" - trying again in a minute"or"")
if J.fails<=3 then z(J.msg)end end end E.msg,E.nextAt,E.at,E.pulls,E.claims,E.pullLeft,E.collectLeft,E.events="",0,0,0,0,0,0,{}
function E.refresh()E.at=x()local k2=ag:FindFirstChild("Remotes")if not k2 then return end local ew,k3,cY=0,0,{}
local zW,sa=pcall(function()return k2 .ClanRequest:InvokeServer("state")end)local sb=zW and type(sa)=="table"and sa.tasks
for Ec,bE in ipairs(sb and sb.list or{})do if not bE.done and bE.kind=="pull"then ew=math.max(ew,(bE.goal or 0)-(bE.progress or 0))end
if not bE.done then cY[#cY+1]=("%s %d/%d"):format(tostring(bE.text),bE.progress or 0,bE.goal or 0)end end E.events={}
for Ed,cZ in ipairs(k2:GetChildren())do if cZ:IsA("RemoteFunction")and cZ.Name:match("^%u%a+Action$")and cZ.Name~="CrateAction"and cZ.Name~="AutoRollAction"then
local zX,ex=pcall(function()return cZ:InvokeServer("state")end)if zX and type(ex)=="table"and ex.live==true and type(ex.quests)=="table"then
E.events[#E.events+1]={r=cZ,st=ex}for Ee,aN in ipairs(ex.quests)do if not aN.done and aN.kind=="pull"then ew=math.max(ew,(aN.goal or 0)-(aN.progress or 0))end
if not aN.done and aN.kind=="collect"then k3=math.max(k3,(aN.goal or 0)-(aN.progress or 0))end if not aN.done then cY[#cY+1]=("%s %d/%d"):format(tostring(aN.text),aN.progress or 0,aN.goal or 0)end
end end end end E.pullLeft,E.collectLeft=ew,k3 E.msg=#cY>0 and("open: "..table.concat(cY,", "))or"all quests done for today"
end function E.claim()for Ef,ey in ipairs(E.events)do local sc=ey.r.Name:gsub("Action$","")for Eg,c0 in ipairs(ey.st.quests)do
if c0 .done and not c0 .claimed then local zY,sd=pcall(function()return ey.r:InvokeServer("claimQuest",c0 .id)end)
if zY and not(type(sd)=="table"and sd.ok==false)then E.claims=E.claims+1 z(("CLAIMED %s quest: %s (+%s)"):format(sc,tostring(c0 .text),tostring(c0 .points or c0 .treats or"?")))
end af(0.4)end end if ey.st.bonusReady==true then local zZ=pcall(function()return ey.r:InvokeServer("claimBonus")end)
if zZ then z(("CLAIMED %s daily quest bonus"):format(sc))end af(0.4)end end end function E.tick()if not(d.Quests and c.running)then
if E.arPaused then E.resume("quests switched off")end return end if x()-E.at<(E.pullLeft>0 and 20 or 90)then return end
E.refresh()pcall(E.claim)if E.pullLeft<=0 and E.arPaused then E.resume("lever quests done")end end function E.pullDue()
return d.Quests and c.running and E.pullLeft>0 and x()>=E.nextAt and not C.busy end function E.lever()local se=c.plot and c.plot:FindFirstChild("Lever")
local k4=se and se:FindFirstChild("Wheel")return k4 and k4:FindFirstChildWhichIsA("ProximityPrompt"),k4 end function E.resume(z0)
E.arPaused=false if E.arWas then E.arWas=false d.AutoRoll=true task.spawn(C.apply,z0)end end function E.pull()
local gR,k5=E.lever()if not gR or not k5 or not k5:IsA("BasePart")then E.nextAt,E.msg=x()+300,"your lever was not found"return end
if not E.arPaused then E.arPaused=true E.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false C.apply("pulling the lever for a quest",true)
if C.isOn()then E.nextAt=x()+30 return end end z(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(E.pullLeft))
end if not gR.Enabled then E.nextAt=x()+1 return end bY(k5,gR)E.asked=nil nQ(gR)E.pulls=E.pulls+1 E.pullLeft=E.pullLeft-1
af(0.6)if E.asked then E.nextAt=x()+600 z(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(E.asked)))
E.resume("a butter the game wants kept is on the pad")return end E.nextAt=x()+2.5 if E.pullLeft<=0 then E.at=0 end
end D.skip,D.skipN,D.n,D.calls,D.fails,D.nextAt,D.msg,D.tries={},0,0,0,0,0,"off",{}function D.can(bF,z1)local k6=bF:GetAttribute("PourOwner")
if type(k6)~="number"or k6==l.uid or not bF:GetAttribute("HasSquishy")then return false end if bF:GetAttribute("PourLong")~=true or bF:GetAttribute("PourFull")==true then return false end
local k7=bF:GetAttribute("PourId")if k7==nil or D.skip[k7]then return false end local sf,k8,z2=bF:GetAttribute("Helpers"),0,tostring(l.uid)
if type(sf)=="string"then for z3 in sf:gmatch("[^,%s]+")do k8=k8+1 if z3==z2 then return false end end end if k8>=6 then return false end
local gS=y.left(bF)if not gS then local sh=tonumber(bF:GetAttribute("PourEnd"))gS=sh and(sh-z1)end if not gS or gS<=75 then return false end
local k9=game:GetService("Players"):GetPlayerByUserId(k6)if not k9 or k9:GetAttribute("WaxHelpOff")==true then return false end
return true,k9,k7 end function D.list()local k_,z4={},l.srv()local sj=au:FindFirstChild("Plots")for Eh,sk in ipairs(sj and sj:GetChildren()or{})do
local sl=sk~=c.plot and sk:FindFirstChild("WaxStations")for Ei,la in ipairs(sl and sl:GetChildren()or{})do local z5,z6,z7=D.can(la,z4)
local lb=z5 and la:FindFirstChild("SquishyPlaceHolder")if lb and lb:IsA("BasePart")then k_[#k_+1]={st=la,p=z6,id=z7,part=lb}end
end end return k_ end function D.due()return d.Help and c.running and x()>=D.nextAt end function D.skipIt(sm,sn)
D.skip[sm],D.skipN=sn,D.skipN+1 if D.skipN>600 then D.skip,D.skipN,D.tries={[sm]=sn},1,{}end end function D.goHome()
local gT,bG=ar(),D.home D.home=nil if not(gT and bG)then return end if d.Ghost and not J.seat()then j.unpin(true)
if not j.parkHome()then pcall(aC,gT,bG.Position,bG.Position+bG.LookVector)end elseif j.hold or(gT.HumanoidRootPart.Position-bG.Position).Magnitude>20 then
j.unpin(true)pcall(aC,gT,bG.Position,bG.Position+bG.LookVector)end end function D.step()local lc,ez=D.list(),ar()
if#lc==0 or not ez then D.nextAt=x()+15 D.msg=("helped %d waxes here%s | none to help right now"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")
D.goHome()return end local so=ez.HumanoidRootPart local sp=so.Position table.sort(lc,function(z8,z9)return(z8 .part.Position-sp).Magnitude<(z9 .part.Position-sp).Magnitude end)
local aX=lc[1]D.home=D.home or(j.hold and j.surface)or so.CFrame local bH=aX.part local eA=(bH.Position+aX.st:GetPivot().Position)/2
local gU=D.tries[aX.id]or 0 if(d.Ghost or d.GhostHelps)and gU==0 and not J.seat()then j.pin(bH.CFrame,D.home)
else j.unpin(true)local ld=gU==0 and fA(eA.X,bH.Position.Y,eA.Z,{bH})if ld and math.abs(ld.Y-bH.Position.Y)<8 then
aC(ez,Vector3 .new(eA.X,ld.Y+cz(ez),eA.Z),bH.Position)else aC(ez,bH.Position+Vector3 .new(0,bH.Size.Y/2+3,0),eA)
end end af(0.3)local eB=ag:FindFirstChild("Remotes")eB=eB and eB:FindFirstChild("ClanRequest")if not eB then D.nextAt,D.msg=x()+60,"the game's help remote is missing"return end
local gV,bl=pcall(function()return eB:InvokeServer("help",aX.st:GetAttribute("PourOwner"),tonumber(aX.st.Name))end)
if gV and type(bl)=="table"and bl.ok then D.n,D.fails=D.n+1,0 D.skipIt(aX.id,"helped")z(("HELPED %s's wax (station %s)"):format(aX.p.DisplayName,aX.st.Name))
D.msg=("helped %d waxes here%s"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")elseif gV and type(bl)=="table"and tostring(bl.reason or""):lower():find("walk up",1,true)and gU<2 then
D.tries[aX.id]=gU+1 D.nextAt=x()+0.3 elseif gV and type(bl)=="table"and tostring(bl.reason or""):lower():find("moment",1,true)then
D.waits=(D.waits or 0)+1 D.nextAt=x()+1.6 else local sq=(gV and type(bl)=="table"and tostring(bl.reason or"refused"))or("error: "..tostring(bl))
D.skipIt(aX.id,sq)D.fails=D.fails+1 if D.fails<=3 then z(("help refused for %s's wax: %s"):format(aX.p.DisplayName,sq))end
if D.fails>=5 then D.fails,D.nextAt,D.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
D.goHome()end end D.nextAt=math.max(D.nextAt,x()+1.2)end function D.onCall(bm)if not d.HelpGuild or type(bm)~="table"or bm.p~="help"or bm.mine or bm.u==l.uid or not bm.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eC=ag:FindFirstChild("Remotes")
eC=eC and eC:FindFirstChild("ClanRequest")if not eC then return end local sr,eD=pcall(function()return eC:InvokeServer("callHelp",bm.u)end)
local ss=tostring(bm.n or bm.un or bm.u)if sr and type(eD)=="table"and eD.ok then D.calls=D.calls+1 z(("HELPED guildmate %s's wax from here (their call)"):format(ss))
else z(("guild call from %s: %s"):format(ss,(sr and type(eD)=="table"and tostring(eD.reason or"refused"))or tostring(eD)))
end end)end local function aq(z_,su,...)if c.busy then return end c.busy,c.busyText=true,z_ if j.hold and su~=D.step then pcall(j.unpin)end
local Aa,sv=pcall(su,...)c.busy,c.busyText=false,""if not Aa and sv~=hD then z("ERR "..tostring(sv))end end local function Ab()
local aO,Ac,Ad=rQ()c.reason,c.level=Ac,Ad if aO=="place"then aq("waxing...",y.place)elseif aO=="crate"then aq("opening crate...",dH,true)
elseif aO=="cratesmart"then aq("opening crate...",e.smart)elseif aO=="cratewin"then aq("opening the crate window...",iN)
elseif aO=="nocrate"then aq("discarding crate...",dH,false)elseif aO=="cratedrop"then aq("discarding a crate that would not open...",e.drop)
elseif aO=="sell"then aq("selling...",rh)elseif aO=="buy"then aq("buying...",nT,false)elseif not aO and not c.matchSince and Q.due()then
aq("grabbing a butter from the admin shower...",Q.grab)elseif not aO and not c.matchSince and J.due()then aq("sitting at the campfire...",J.sit)
elseif not aO and not c.matchSince and E.pullDue()and not ac()and not(bT()and aI(bT().name))then aq("pulling the lever for a quest...",E.pull)
elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(E.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
aq("collecting money...",zg)elseif not aO and not c.matchSince and D.due()then aq("helping a wax...",D.step)elseif D.home and not d.Help then
aq("coming back...",D.goHome)elseif not c.busy then j.parkTick()end end function et(gW,Ae)if gW==c.running then return end
c.running=gW if not Ae then d.AutoStart=gW end if gW then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bp()or c.plot
z("START")else c.reason="stopped"z("STOP")end end do local bI=fl(al.auto)if type(bI)=="string"then bI=bI:gsub("%s+$","")
if bI~=""then c.autoload=bI local Af=no(bI)z(Af and("loaded config "..bI)or("config "..bI.." could not be loaded"))
end end end local o={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local Ag={ok=o.good,wait=o.warn,warn=o.warn,bad=o.bad,idle=o.dim}local sw={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function O(Ah,Ai,Aj)local Ak,le=pcall(Instance.new,Ah)
if not Ak then c.uiErrs=c.uiErrs+1 return nil end for Al,Am in pairs(Ai)do if not pcall(function()le[Al]=Am end)then c.uiErrs=c.uiErrs+1 end
end le.Parent=Aj return le end local function an(An,Ao)O("UICorner",{CornerRadius=UDim.new(0,Ao or 6)},An)end
local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"})}function a.put(gX,lf)if gX and a.shown[gX]~=lf then a.shown[gX]=lf gX.Text=lf end
end local lg=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local sx=lg:FindFirstChild("SABFarmGui")
if sx then sx:Destroy()end local lh=O("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},lg)
local ak={w=320,h=300,head=28,strip=34,tabs=24}pcall(function()local gY=au.CurrentCamera.ViewportSize if gY.X>100 and gY.Y>100 then
ak.w=math.clamp(math.floor(gY.X*0.44),300,360)ak.h=math.clamp(math.floor(gY.Y*0.84),240,340)end end)a.root=O("Frame",{Name="Root",Size=UDim2 .new(0,ak.w,0,ak.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=o.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},lh)
an(a.root,10)O("UIStroke",{Color=o.line,Thickness=1},a.root)local a3=UDim2 .new(1,0,1,0)local function K(sy,sz)return UDim2 .new(sy,0,0,0),UDim2 .new(sz,(sy+sz>0.99)and 0 or-4,1,0)end
local function H(Ap,Aq,Ar,As,At,Au)local sA=O("TextButton",{Text=Aq,Position=At,Size=Au,BackgroundColor3=Ar,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=As,TextColor3=o.text,AutoButtonColor=true},Ap)an(sA,6)return sA end local function gZ(Av,Aw,Ax,Ay,Az)
local li=O("TextBox",{Text=Aw,PlaceholderText=Ax,Position=Ay,Size=Az,BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=o.text,PlaceholderColor3=o.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Av)an(li,6)O("UIPadding",{PaddingLeft=UDim.new(0,8)},li)
return li end local g0=au.CurrentCamera local function AA()local AB,g1=pcall(function()return g0 and g0 .ViewportSize end)
if AB and g1 and g1 .X>50 and g1 .Y>50 then return g1 end end local function bJ(eE)local lj=AA()if not(lj and eE and eE.Parent)then return end
local AC=pcall(function()local g2,sB=eE.AbsolutePosition,eE.AbsoluteSize local lk=70 local sC=math.clamp(g2 .X,lk-sB.X,lj.X-lk)
local sD=math.clamp(g2 .Y,0,lj.Y-math.min(sB.Y,lk))if math.abs(sC-g2 .X)>0.5 or math.abs(sD-g2 .Y)>0.5 then eE.Position=UDim2 .new(0,math.floor(sC),0,math.floor(sD))
end end)return AC end local function g3(AD)local AE,ll=pcall(function()return AD.AbsolutePosition end)if AE and ll then return{math.floor(ll.X),math.floor(ll.Y)}end
end local c1={}c.dragMoved={}local function sE(eF,sF,lm)V(eF.InputBegan:Connect(function(c2)if c2 .UserInputType~=Enum.UserInputType.MouseButton1 and c2 .UserInputType~=Enum.UserInputType.Touch then return end
local ln={start=c2 .Position,from=sF.Position,moved=0,target=sF,input=c2,onDrop=lm}c1[eF],c.dragMoved[eF]=ln,0
local lo lo=c2 .Changed:Connect(function()if c2 .UserInputState==Enum.UserInputState.End and c1[eF]==ln then c1[eF]=nil
if lo then lo:Disconnect()end if lm then lm(ln.moved)end end end)end))end V(mb.InputChanged:Connect(function(g4)
if g4 .UserInputType~=Enum.UserInputType.MouseMovement and g4 .UserInputType~=Enum.UserInputType.Touch then return end
for AF,a4 in pairs(c1)do local lp=a4 .target if lp and lp.Parent then local sG,sH=g4 .Position.X-a4 .start.X,g4 .Position.Y-a4 .start.Y
a4 .moved=math.max(a4 .moved,math.abs(sG)+math.abs(sH))c.dragMoved[AF]=a4 .moved lp.Position=UDim2 .new(a4 .from.X.Scale,a4 .from.X.Offset+sG,a4 .from.Y.Scale,a4 .from.Y.Offset+sH)
end end end))V(mb.InputEnded:Connect(function(g5)if g5 .UserInputType~=Enum.UserInputType.MouseButton1 and g5 .UserInputType~=Enum.UserInputType.Touch then return end
for AG,g6 in pairs(c1)do if g6 .input==g5 or g5 .UserInputType==Enum.UserInputType.MouseButton1 then c1[AG]=nil
if g6 .onDrop then g6 .onDrop(g6 .moved)end end end end))local function T(AH,AI,AJ,AK,AL,AM,AN)return O("TextLabel",{Text=AI,Position=AM or UDim2 .new(0,0,0,0),Size=AN or a3,BackgroundTransparency=1,
Font=AL and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=AJ,TextColor3=AK,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},AH)
end a.title=O("Frame",{Size=UDim2 .new(1,0,0,ak.head),BackgroundColor3=o.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=O("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=o.dim,BorderSizePixel=0},a.title)
an(a.dot,5)T(a.title,"SAB  BUTTER FARM  "..cn,12,o.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=H(a.title,"-",o.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=H(a.title,"X",o.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=O("Frame",{Position=UDim2 .new(0,0,0,ak.head),Size=UDim2 .new(1,0,0,ak.strip),BackgroundColor3=o.bg,BorderSizePixel=0},a.root)
a.bar=O("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=o.warn,BorderSizePixel=0},a.strip)
an(a.bar,2)a.reason=T(a.strip,"starting",12,o.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=O("Frame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip),Size=UDim2 .new(1,0,0,ak.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=H(a.tabs,"FARM",o.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=H(a.tabs,"BUTTERS",o.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=H(a.tabs,"CRATES",o.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=H(a.tabs,"PETS",o.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=H(a.tabs,"TEAMS",o.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=H(a.tabs,"SETUP",o.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function c3()local lq=O("ScrollingFrame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip+ak.tabs),Size=UDim2 .new(1,0,1,-(ak.head+ak.strip+ak.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=o.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
O("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},lq)O("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},lq)
return lq end a.farm,a.but,a.set,a.crt=c3(),c3(),c3(),c3()a.pet,a.team=c3(),c3()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local g7,eG,M=0,12,nil local function a5(sI,AO)g7,eG=g7+1,eG+sI+6 return O("Frame",{Size=UDim2 .new(1,0,0,sI),BackgroundTransparency=1,LayoutOrder=g7},AO or a.farm)
end local function sJ(AP)T(a5(14),AP,10,o.dim,true)end M=a5(32)a.startB=H(M,"START",o.good,14,K(0,0.68))a.killB=H(M,"KILL",o.bad,14,K(0.68,0.32))
do local AQ=a5(40)local function eH(sK,AS,lr)local ls=O("Frame",{Position=UDim2 .new((sK-1)/lr,0,0,0),Size=UDim2 .new(1/lr,sK<lr and-4 or 0,1,0),
BackgroundColor3=o.panel,BorderSizePixel=0},AQ)an(ls,6)local sL=T(ls,"0",14,o.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,20))
local AT=T(ls,AS,9,o.dim,false,UDim2 .new(0,0,0,23),UDim2 .new(1,0,0,13))sL.TextXAlignment,AT.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return sL end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=eH(1,"BOUGHT",5),eH(2,"WAXED",5),eH(3,"SOLD",5),eH(4,"MONEY",5),eH(5,"FREE",5)
end a.info=T(a5(40),"",10,o.dim,false)a.tgt=T(a5(16),"",10,o.good,false)sJ("SWITCHES")do local function c4(AU,AV)
local sM=a5(26)return H(sM,AU,o.panel2,10,K(0,0.5)),H(sM,AV,o.panel2,10,K(0.5,0.5))end a.colT,a.sellT=c4("COLLECT: ON","SELL THEM: ON")
a.crateT,a.arT=c4("OPEN CRATES: ON","AUTO ROLL: OFF")a.helpT,a.helpGT=c4("HELP WAXES: OFF","GUILD CALLS: OFF")
a.campT,a.ghostT=c4("CAMPFIRE: OFF","GHOST: OFF")a.ixT,a.bestT=c4("AUTO INDEX: OFF","BEST BUTTER: OFF")a.bcT,a.shT=c4("BEST CRATE: OFF","GRAB SHOWER: ON")
M=a5(26)a.questT=H(M,"QUESTS: OFF",o.panel2,10,K(0,0.5))T(M,"collect every",9,o.dim,false,K(0.52,0.2))a.secB=gZ(M,tostring(d.Every),"60",K(0.72,0.13))
a.secB.TextSize=11 a.secSet=H(M,"SET",o.accent,10,K(0.85,0.15))local g8=O("Frame",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0},a5(76))
an(g8,6)O("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},g8)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,3)},g8)
local function eI(AW)local g9=T(g8,"",9,o.dim,false,nil,UDim2 .new(1,-6,0,14))g9 .LayoutOrder,g9 .TextWrapped,g9 .TextTruncate=AW,false,Enum.TextTruncate.AtEnd
return g9 end a.helpL,a.campL,a.questL,a.arL,a.ixL=eI(1),eI(2),eI(3),eI(4),eI(5)end sJ("LOG")a.log=O("TextLabel",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},a5(84))an(a.log,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,eG)g7,eG=0,12 local function aj(AX)return a5(AX,a.set)end local function c5(AY)T(aj(14),AY,10,o.dim,true)end
c5("ONE-OFF ACTIONS")M=aj(26)a.buyB=H(M,"BUY THE PAD",o.warn,10,K(0,0.5))a.plB=H(M,"WAX WHAT I HOLD",o.good,10,K(0.5,0.5))
M=aj(26)a.sellB=H(M,"SELL WHAT I HOLD",o.warn,10,K(0,0.5))a.crateB=H(M,"OPEN CRATE NOW",o.warn,10,K(0.5,0.5))
M=aj(26)a.padB=H(M,"SET PAD (stand on it)",o.panel2,10,K(0,0.55))a.padL=T(M,"",10,o.dim,false,K(0.56,0.44))c5("SETTINGS FILE  (saved on your phone)")
M=aj(28)a.cfgName=gZ(M,"default","config name",K(0,0.5))a.cfgSave=H(M,"SAVE",o.good,11,K(0.5,0.25))a.cfgLoad=H(M,"LOAD",o.accent,11,K(0.75,0.25))
M=aj(26)a.cfgPrev=H(M,"<",o.panel2,11,K(0,0.13))a.cfgPick=H(M,"(none saved)",o.panel2,10,K(0.13,0.74))a.cfgNext=H(M,">",o.panel2,11,K(0.87,0.13))
M=aj(26)a.cfgAuto=H(M,"LOAD IT ON LAUNCH: OFF",o.panel2,10,K(0,1))a.cfgMsg=T(aj(26),"",10,o.dim,false)c5("START BY ITSELF")
M=aj(26)a.autoB=H(M,"INSTALL F.exec",o.accent,10,K(0,1))a.autoMsg=T(aj(30),"",10,o.dim,false)M=aj(28)a.startT=H(M,"START FARMING ON LOAD: ON",o.accent,10,K(0,1))
T(aj(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,o.dim,false)
c5("IF THE GAME DROPS ME")M=aj(28)a.rejT=H(M,"AUTO REJOIN: ON",o.accent,11,K(0,0.55))a.rejB=H(M,"REJOIN NOW",o.warn,11,K(0.55,0.45))
a.rejMsg=T(aj(30),"",10,o.dim,false)c5("SMOOTHER RUNNING  (for long / overnight runs)")M=aj(28)a.pfLite=H(M,"LITE MODE: OFF",o.panel2,10,K(0,0.5))
a.pfHud=H(M,"HIDE GAME HUD: OFF",o.panel2,10,K(0.5,0.5))M=aj(28)a.pfFps=H(M,"FPS CAP: GAME",o.panel2,10,K(0,0.5))
a.pfRender=H(M,"STOP 3D: OFF",o.panel2,10,K(0.5,0.5))M=aj(28)a.pfBases=H(aj(28),"BASES: ALL DRAWN",o.panel2,10,K(0,1))
M=aj(28)a.pfMem=gZ(M,tostring(d.MemLimit),"2000",K(0,0.24))T(M,"MB: rejoin this server above it (0 = never)",9,o.dim,false,K(0.26,0.52))
a.pfMemSet=H(M,"SET",o.accent,11,K(0.8,0.2))a.pfInfo=T(aj(18),"",10,o.text,false)T(aj(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. BASES: OTHERS HIDDEN stops drawing other players' bases and stacks, ALL HIDDEN yours too (nothing is removed, so helping and farming work). HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,o.dim,false)
c5("THE ROUND SAB BUTTON")T(aj(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,o.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,eG)local sN=O("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},lg)
a.tgRoot=O("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=o.accent,BorderSizePixel=0,Active=true},sN)an(a.tgRoot,20)O("UIStroke",{Color=o.line,Thickness=1},a.tgRoot)
a.tgBtn=O("TextButton",{Text="SAB",Size=a3,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=o.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=O("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=o.dim,BorderSizePixel=0},a.tgRoot)
an(a.tgDot,4)a.tgGhost=O("TextButton",{Text="G: OFF",Size=UDim2 .new(0,46,0,18),Position=UDim2 .new(0.5,-23,1,4),
BackgroundColor3=o.panel2,Font=Enum.Font.GothamBold,TextSize=9,TextColor3=o.text,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
an(a.tgGhost,6)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()local g_=j.ghostMode()
local sO=g_==2 and o.accent or(g_==1 and o.warn or o.panel2)if a.ghostT then a.ghostT.Text,a.ghostT.BackgroundColor3=j.GHOST[g_][1],sO end
if a.tgGhost then a.tgGhost.Text,a.tgGhost.BackgroundColor3=j.GHOST[g_][2],sO end end local bn={built=false,boxes={},at=0}
local function sP(sQ,lt)d.Targets[sQ]=lt or nil local lu=bn.boxes[sQ]if lu then lu.Text=lt and"X"or""lu.BackgroundColor3=lt and o.good or o.panel2
end end local function lv()for AZ,sR in pairs(bn.boxes)do local sS=d.Targets[AZ]==true sR.Text=sS and"X"or""sR.BackgroundColor3=sS and o.good or o.panel2
end end local eJ local function A0()local A1=0 local lw=O("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=T(lw,"",10,o.dim,false,K(0,0.5))local A2=H(lw,"CLEAR",o.panel2,10,K(0.5,0.24))local A3=H(lw,"REFRESH",o.panel2,10,K(0.74,0.26))
A2 .MouseButton1Click:Connect(function()for A4 in pairs(d.Targets)do d.Targets[A4]=nil end lv()end)A3 .MouseButton1Click:Connect(function()
ad.at=0 ic()eJ(true)end)return A1 end eJ=function(A5)if not ic()then if not a.butEmpty then a.butEmpty=T(O("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,o.warn,false)end return end if bn.built and not A5 and bn.at==ad.at then return end
for Ej,lx in ipairs(a.but:GetChildren())do if lx:IsA("Frame")or lx:IsA("TextButton")then lx:Destroy()end end bn.boxes,a.butEmpty={},nil
A0()local ly,lz=36,1 local function sT(sU)lz=lz+1 local A6=O("Frame",{Size=UDim2 .new(1,0,0,sU),BackgroundTransparency=1,LayoutOrder=lz},a.but)
ly=ly+sU+6 return A6 end for Ek,ha in ipairs(ad.rarOrder)do local A7=sT(24)local A8=sw[ha]or o.text local lA=O("Frame",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0},A7)
an(lA,6)T(lA,"  "..ha:upper(),11,A8,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local A9=H(lA,"ALL",o.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local A_=ha A9 .MouseButton1Click:Connect(function()local sV=ad.members[A_]or{}local sW=false for El,Ba in ipairs(sV)do if not d.Targets[Ba]then sW=true break end end
for Em,Bb in ipairs(sV)do sP(Bb,sW)end end)for En,lB in ipairs(ad.members[ha]or{})do local Bc=sT(22)local hb=O("TextButton",{Text="",Size=a3,BackgroundColor3=o.bg,BorderSizePixel=0,
AutoButtonColor=true},Bc)an(hb,5)T(hb,"   "..ai(lB),11,o.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local lC=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},hb)an(lC,4)bn.boxes[lB]=lC local sX=lB local function sY()sP(sX,not d.Targets[sX])end
hb.MouseButton1Click:Connect(sY)lC.MouseButton1Click:Connect(sY)end end lv()a.but.CanvasSize=UDim2 .new(0,0,0,ly+10)
bn.built,bn.at=true,ad.at end function L.paint()for Bd,sZ in pairs(L.boxes)do local s0=d.CrateTicks[Bd]==true
sZ.Text=s0 and"X"or""sZ.BackgroundColor3=s0 and o.good or o.panel2 end if a.crtInfo then local lD,lE=0,0 for Eo in pairs(L.boxes)do lD=lD+1 end
for Ep,Be in pairs(d.CrateTicks)do if Be then lE=lE+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(lD,lE)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and o.accent or o.panel2
end end function L.build()for Eq,lF in ipairs(a.crt:GetChildren())do if lF:IsA("Frame")or lF:IsA("TextButton")then lF:Destroy()end
end L.boxes={}local lG,lH=12,0 local function hc(s1)lH=lH+1 lG=lG+s1+6 return O("Frame",{Size=UDim2 .new(1,0,0,s1),BackgroundTransparency=1,LayoutOrder=lH},a.crt)
end local lI=hc(28)a.crtInfo=T(lI,"",10,o.dim,false,K(0,0.5))local Bf=H(lI,"CLEAR",o.panel2,10,K(0.5,0.24))local Bg=H(lI,"REFRESH",o.panel2,10,K(0.74,0.26))
V(Bf.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))V(Bg.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=H(hc(28),"",o.accent,11,K(0,1))V(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
T(hc(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,o.dim,false)
for Er,bo in ipairs(L.list())do local Bh=hc(24)local eK=O("TextButton",{Text="",Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0,AutoButtonColor=true},Bh)
an(eK,5)T(eK,"  "..(bo.title or bo.name)..(bo.guess and"  (?)"or""),11,sw[bo.rar or""]or o.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
T(eK,bo.price and("$"..aJ(bo.price))or(bo.rar or""),9,o.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local lJ=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},eK)an(lJ,4)L.boxes[bo.k]=lJ local s2=bo.k local function s3()d.CrateTicks[s2]=(not d.CrateTicks[s2])or nil
L.paint()end V(eK.MouseButton1Click:Connect(s3))V(lJ.MouseButton1Click:Connect(s3))end a.crt.CanvasSize=UDim2 .new(0,0,0,lG+10)
L.built=L.at L.paint()end local s4="farm"local function bK(as)s4=as a.farm.Visible,a.but.Visible,a.set.Visible=(as=="farm"),(as=="but"),(as=="set")
a.crt.Visible=(as=="crt")a.pet.Visible,a.team.Visible=(as=="pet"),(as=="team")a.tabCrt.BackgroundColor3=(as=="crt")and o.accent or o.panel2
a.tabPet.BackgroundColor3=(as=="pet")and o.accent or o.panel2 a.tabTeam.BackgroundColor3=(as=="team")and o.accent or o.panel2
if as=="pet"and not l.built then pcall(l.build)end if as=="team"and not y.built then pcall(y.build)end if as=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(as=="farm")and o.accent or o.panel2 a.tabBut.BackgroundColor3=(as=="but")and o.accent or o.panel2
a.tabSet.BackgroundColor3=(as=="set")and o.accent or o.panel2 if as=="but"then eJ(false)end end local function N(hd,he,Bi,Bj)
a.put(hd,he and Bi or Bj)if a.lit[hd]~=he then a.lit[hd]=he hd.BackgroundColor3=he and o.accent or o.panel2 end
end l.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function l.paintRow(s5)
local ck=l.rows and l.rows[s5]if not ck then return end local eL=d.Pets[s5]or{}ck.b.BackgroundColor3=eL.b and o.good or o.panel2
ck.g.BackgroundColor3=eL.g and o.accent or o.panel2 ck.g.Text=eL.g and"BIG"or"ANY"ck.w.BackgroundColor3=eL.w and o.warn or o.panel2
local lK=tonumber(eL.f)or 0 ck.f.Text=lK>0 and(lK.." BIG")or"FUSE"ck.f.BackgroundColor3=lK>0 and o.good or o.panel2
end function l.flag(lL,hf)local a6=d.Pets[lL]or{}if hf=="f"then local s6=((tonumber(a6 .f)or 0)+1)%4 a6 .f=s6>0 and s6 or nil
elseif a6[hf]then a6[hf]=nil else a6[hf]=true end d.Pets[lL]=(a6 .b or a6 .g or a6 .w or a6 .f)and a6 or nil l.paintRow(lL)
end function l.paintAll()for Bk in pairs(l.rows or{})do l.paintRow(Bk)end if a.pbT then N(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function l.live()if not l.built then l.build()return end if x()-(l.liveAt or 0)<1 then return end l.liveAt=x()
local s7=l.wishes()local eM=l.data()for hg,hh in pairs(l.rows)do hh.name.Text=l.nice(hg)..(s7[hg]and("   * wish %dm"):format(math.ceil(s7[hg]/60))or"")
local s8=A.status(hg,eM)hh.desc.Text=s8 and(s8 .." | "..hh.boostText)or hh.boostText end local s9=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eM and#(eM.pets or{})or 0,eM and tonumber(eM.maxOwned)or 60,
aJ(l.money()),s9>0 and(" | free wishes "..s9)or"",l.buyMsg~=""and l.buyMsg or"-",l.wishMsg~=""and l.wishMsg or"-")
end function l.build()local hi=l.info()for Es,lM in ipairs(a.pet:GetChildren())do if lM:IsA("Frame")or lM:IsA("TextLabel")then lM:Destroy()end
end l.rows={}local lN,hj=0,12 local function c6(s_)lN,hj=lN+1,hj+s_+6 return O("Frame",{Size=UDim2 .new(1,0,0,s_),BackgroundTransparency=1,LayoutOrder=lN},a.pet)
end local lO=c6(28)a.pbT=H(lO,"AUTO ADOPT: OFF",o.panel2,9,K(0,0.34))a.pwT=H(lO,"AUTO WISH: OFF",o.panel2,9,K(0.34,0.33))
a.pfT=H(lO,"AUTO FUSE: OFF",o.panel2,9,K(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy l.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish l.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse l.paintAll()end)
a.pInfo=T(c6(44),"",10,o.dim,false)T(c6(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,o.dim,false)
if not hi then T(c6(30),"pet list not loaded yet - open this tab again in a moment",11,o.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,hj)
l.built=false return end local c7={}for Et,ta in ipairs(l.order())do local lP=hi.Pets[ta].rarity or"?"c7[lP]=c7[lP]or{}
table.insert(c7[lP],ta)end local c8={}for Eu,tb in ipairs(hi.Rarities or{})do if c7[tb]then c8[#c8+1]=tb end end
for tc in pairs(c7)do if not table.find(c8,tc)then c8[#c8+1]=tc end end for Ev,hk in ipairs(c8)do local td=O("Frame",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0},c6(22))
an(td,6)T(td,"  "..hk:upper(),11,l.RC[hk]or o.text,true)for Ew,hl in ipairs(c7[hk])do local cl=O("Frame",{Size=a3,BackgroundColor3=o.bg,BorderSizePixel=0},c6(38))
an(cl,5)local Bl=T(cl,l.nice(hl),11,l.RC[hk]or o.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local Bm,Bn=pcall(function()return hi.describe(hl)end)
local te=Bm and tostring(Bn)or""local Bo=T(cl,te,9,o.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local tf=H(cl,"BUY",o.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local th=H(cl,"ANY",o.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local ti=H(cl,"WISH",o.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local tj=H(cl,"FUSE",o.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local hm=hl tf.MouseButton1Click:Connect(function()l.flag(hm,"b")end)
th.MouseButton1Click:Connect(function()l.flag(hm,"g")end)ti.MouseButton1Click:Connect(function()l.flag(hm,"w")end)
tj.MouseButton1Click:Connect(function()l.flag(hm,"f")end)l.rows[hl]={b=tf,g=th,w=ti,f=tj,name=Bl,desc=Bo,boostText=te}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,hj+10)l.built=true l.paintAll()end function j.paint()N(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")N(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
N(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])N(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end V(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
V(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))V(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))
V(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))V(a.pfFps.MouseButton1Click:Connect(function()
local Bp=table.find(j.CAPS,d.FpsCap or 0)or 1 local tk=j.CAPS[(Bp%#j.CAPS)+1]if not j.cap(tk)and tk~=0 then z("this executor cannot cap fps")end
j.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()local lQ=tonumber(a.pfMem.Text)if lQ and lQ>=0 then d.MemLimit=math.floor(lQ)end
j.paint()end))function y.names()local lR={"(none)"}for Ex,Bq in ipairs((y.teams()))do lR[#lR+1]=Bq.name end return lR
end function y.cycle(lS,Br)local hn=y.names()local Bs=d[lS]~=""and d[lS]or"(none)"local ho=table.find(hn,Bs)or 1
ho=((ho-1+Br)%#hn)+1 d[lS]=hn[ho]=="(none)"and""or hn[ho]y.paint()end function y.paint()if not y.built then return end
N(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")N(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")
local lT={}for Ey,Bt in ipairs((y.teams()))do lT[Bt.name]=true end for Bu,tl in pairs(y.pick)do local c9=d[Bu]
tl.Text=c9==""and"(none)"or(lT[c9]and c9 or(c9 .." (missing)"))tl.TextColor3=(c9~=""and not lT[c9])and o.bad or o.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(y.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(y.switches,y.finished,y.glazed,A.fused)
..(A.buildMsg~=""and("\n"..A.buildMsg)or"")local Bv,hp=l.srv(),{}for Ez,hq in ipairs(y.list or{})do hp[#hp+1]=("st %-2s %-22s %9s  helps %d"):format(hq.st.Name,ai(aa(hq.name)):sub(1,22),y.clock(hq.ends-Bv),hq.helps)
end a.tmList.Text=#hp>0 and table.concat(hp,"\n")or"no waxes running"end function y.build()for EA,lU in ipairs(a.team:GetChildren())do
if lU:IsA("Frame")or lU:IsA("TextLabel")then lU:Destroy()end end y.pick={}local lV,lW=0,12 local function bL(tm)
lV,lW=lV+1,lW+tm+6 return O("Frame",{Size=UDim2 .new(1,0,0,tm),BackgroundTransparency=1,LayoutOrder=lV},a.team)
end local function eN(Bw)T(bL(14),Bw,10,o.dim,true)end local function hr(hs)local lX=bL(26)local Bx=H(lX,"<",o.panel2,11,K(0,0.14))
local tn=H(lX,"(none)",o.panel,10,K(0.14,0.72))local By=H(lX,">",o.panel2,11,K(0.86,0.14))Bx.MouseButton1Click:Connect(function()y.cycle(hs,-1)end)
By.MouseButton1Click:Connect(function()y.cycle(hs,1)end)tn.MouseButton1Click:Connect(function()y.cycle(hs,1)end)
y.pick[hs]=tn end a.tmT=H(bL(28),"AUTO TEAMS: OFF",o.panel2,11,K(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=y.current()end y.paint()end)a.tmInfo=T(bL(42),"",10,o.dim,false)
local to=bL(26)a.tmBuild=H(to,"AUTO BUILD TEAMS: OFF",o.panel2,9,K(0,0.62))a.tmBuildNow=H(to,"BUILD NOW",o.warn,9,K(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild y.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if y.editing then return end A.buildMsg="building..."task.spawn(function()local Bz,BA=pcall(A.rebuild,"you asked")if not Bz then z("BUILD ERR "..tostring(BA))end end)
end)eN("NORMAL TEAM  (worn the rest of the time)")hr("TeamNormal")eN("FULL TEAM  (every station busy: money + wax speed)")
hr("TeamFull")eN("GLAZE TEAM  (worn just before a wax finishes)")hr("TeamGlaze")local lY=bL(26)a.tmLead=gZ(lY,tostring(d.GlazeLead),"45",K(0,0.2))
T(lY,"sec before it finishes",10,o.dim,false,K(0.22,0.5))local BB=H(lY,"SET",o.accent,11,K(0.75,0.25))BB.MouseButton1Click:Connect(function()
local ht=tonumber(a.tmLead.Text)if ht and ht>=5 and ht<=600 then d.GlazeLead=math.floor(ht)else a.tmLead.Text=tostring(d.GlazeLead)end
y.paint()end)eN("WAX TEAM  (worn while a butter is placed: head starts)")hr("TeamWax")eN("YOUR WAXES  (time left, helps)")
a.tmList=O("TextLabel",{Size=a3,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bL(150))an(a.tmList,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
T(bL(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,o.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,lW+10)y.built=true y.paint()end local function BC()a.secB.Text=tostring(d.Every)
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not D.home then pcall(j.unpin)end end)end
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then et(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bJ(a.root)bJ(a.tgRoot)c.lastCollect=x()
lv()L.paint()pcall(l.paintAll)pcall(y.paint)pcall(j.applyAll)end local function BD(tp)task.spawn(function()tp.TextColor3=o.bad
task.wait(0.8)if c.alive then tp.TextColor3=o.text end end)end local function tq()local tr=a.secB.Text:match("^%s*(%d+)%s*$")
local eO=tr and tonumber(tr)if not eO or eO<1 then a.secB.Text=tostring(d.Every)BD(a.secB)z("interval must be a whole number >= 1")
return end if eO==d.Every then return end d.Every,c.lastCollect=eO,x()z("collect every "..eO.."s")end local function P(BE,BF)V(BE.MouseButton1Click:Connect(BF))end
P(a.secSet,tq)V(a.secB.FocusLost:Connect(tq))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(aq,"selling...",rh)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(C.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help D.nextAt,D.msg=0,d.Help and"looking for waxes to help"or"off"N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests E.at=0 N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire J.nextAt,J.fails,J.lost=0,0,0 N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,j.cycleGhost)function q.paint()N(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")N(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
N(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")N(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(BG)task.spawn(function()pcall(q.tick)if BG and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end P(a.ixT,function()local BH=q.on()d.AutoIndex=not d.AutoIndex q.discAt=-100 q.changed(BH)end)
P(a.bestT,function()local BI=q.on()d.Best=((d.Best or 0)+1)%5 q.stackAt=-100 q.changed(BI)end)P(a.bcT,function()
local BJ=q.on()d.BestCrate=not d.BestCrate q.changed(BJ)end)P(a.shT,function()d.Shower=not d.Shower q.paint()
end)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(aq,"opening crate...",dH,true)
end)P(a.padB,function()c.plot=bp()or c.plot local ts,lZ=ar(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(ts and lZ and lZ:IsA("BasePart"))then z("SET PAD: need character and plot")return end c.manualPad=lZ.CFrame:ToObjectSpace(ts.HumanoidRootPart.CFrame)
y7(c.manualPad)z("collect pad saved at your position")end)P(a.startB,function()et(not c.running)end)P(a.buyB,function()
c.plot=bp()or c.plot task.spawn(aq,"buying (manual)...",nT,true)end)P(a.plB,function()c.plot=bp()or c.plot task.spawn(aq,"waxing (manual)...",nY)
end)P(a.tabFarm,function()bK("farm")end)P(a.tabBut,function()bK("but")end)P(a.tabSet,function()bK("set")end)P(a.tabCrt,function()bK("crt")end)
P(a.tabPet,function()bK("pet")end)P(a.tabTeam,function()bK("team")end)local function BK(l0)c.hidden=l0 a.root.Visible=not l0
a.tgBtn.Text=l0 and"SAB+"or"SAB"end sE(a.tgBtn,a.tgRoot,function()bJ(a.tgRoot)c.togPos=g3(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then BK(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aH,av={},0
local function bM()aH=nf()if#aH==0 then a.cfgPick.Text="(none saved)"av=0 return end if av<1 or av>#aH then av=1 end
a.cfgPick.Text=aH[av]..("  (%d/%d)"):format(av,#aH)end local function tt()local tu=c.autoload~=nil a.cfgAuto.Text=tu and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=tu and o.accent or o.panel2 end local function l1()local tv=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if tv~=""then return tv end return(av>0 and aH[av])or""end P(a.cfgSave,function()c.winPos=g3(a.root)or c.winPos
c.togPos=g3(a.tgRoot)or c.togPos local tw,tx=fr(l1())a.cfgMsg.Text=tw and("saved as "..tx)or("could not save: "..tx)
a.cfgMsg.TextColor3=tw and o.good or o.bad bM()z(a.cfgMsg.Text)end)local function BL(l2)local l3,ty=no(l2)a.cfgMsg.Text=l3 and("loaded "..ty)or("could not load: "..ty)
a.cfgMsg.TextColor3=l3 and o.good or o.bad if l3 then a.cfgName.Text=l2 BC()task.spawn(C.apply,"config "..l2)
end z(a.cfgMsg.Text)end P(a.cfgLoad,function()BL(l1())end)P(a.cfgPick,function()bM()if av>0 then a.cfgName.Text=aH[av]end
end)P(a.cfgPrev,function()if#aH==0 then bM()return end av=(av-2)%#aH+1 bM()a.cfgName.Text=aH[av]end)P(a.cfgNext,function()
if#aH==0 then bM()return end av=av%#aH+1 bM()a.cfgName.Text=aH[av]end)P(a.cfgAuto,function()if c.autoload then
nq(nil)a.cfgMsg.Text="it will not load a config on launch"else local eP=l1()local tz=false for EB,BM in ipairs(nf())do if BM==eP then tz=true end end
local BN=tz or fr(eP)if BN and eP~=""then nq(eP)bM()a.cfgMsg.Text=eP.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=o.dim tt()end)P(a.autoB,function()
local tA,tB=vu()a.autoMsg.Text=tA and("installed. "..tB)or("failed: "..tB)a.autoMsg.TextColor3=tA and o.good or o.bad
z(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()dr("you asked")end)
local bN=false P(a.minB,function()bN=not bN a.tabs.Visible=not bN if bN then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bK(s4)end a.root.Size=UDim2 .new(0,ak.w,0,bN and(ak.head+ak.strip)or ak.h)
a.minB.Text=bN and"+"or"-"end)local function hu()if not c.alive then return end c.alive,c.running=false,false
pcall(j.restoreAll)pcall(e2)for EC,BO in ipairs(hE)do pcall(function()BO:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()lh:Destroy()end)pcall(function()sN:Destroy()end)if co.SAB_KILL==hu then co.SAB_KILL=nil end end
co.SAB_KILL=hu P(a.killB,hu)P(a.xB,hu)sE(a.title,a.root,function()bJ(a.root)c.winPos=g3(a.root)or c.winPos end)
local function tC()local eQ,cm=c.reason,c.level if c.busy then eQ,cm=c.busyText,"ok"elseif not c.running then
local ED,tD,BP=rQ()if c.capHit then eQ,cm=tD,"bad"else eQ,cm="[stopped] "..tD,(BP=="bad")and"bad"or"idle"end c.reason,c.level=eQ,cm
end local hv=c.running and o.good or(c.capHit and o.bad or o.dim)if a.lit.dot~=hv then a.lit.dot=hv a.dot.BackgroundColor3,a.tgDot.BackgroundColor3=hv,hv end
if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and o.panel2 or o.accent end if c.hidden then return end
a.put(a.reason,eQ)if a.lit.bar~=cm then a.lit.bar=cm a.bar.BackgroundColor3=Ag[cm]or o.dim end if bN then return end
if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and o.warn or o.good
end N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")local bO=u5()if a.farm.Visible then
local BQ,BR=eZ()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,BQ.."/"..BR)local tE=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local tF=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aJ(a7()),c.rolls,c.gifts,c.crates,tF and ai(aa(tF))or"nothing",e.on and("   ["..e.title.." window open]")or"",
tE and("in "..tE.."s")or"off"))a.put(a.tgt,(#bO==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bO<=3)and table.concat(bO,", ")or(#bO.." butters ticked"))))
if a.lit.tgt~=(#bO==0)then a.lit.tgt=(#bO==0)a.tgt.TextColor3=(#bO==0)and o.bad or o.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(eT,"\n")end
end if a.set.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bO))
end if a.but.Visible and bn.at~=ad.at then eJ(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then l.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak)
end if a.team.Visible then y.paint()end if a.farm.Visible then a.put(a.helpL,"help: "..((d.Help or d.HelpGuild)and D.msg or"off"))
a.put(a.campL,"camp: "..(d.Campfire and J.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests: "..(d.Quests and(E.msg~=""and E.msg or"checking...")or"off"))a.put(a.ixL,q.msg)N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local tG=(C.rec.on and"on"or"")..(C.rec.off and((C.rec.on and"/"or"").."off")or"")
a.put(a.arL,C.msg~=""and C.msg or("auto roll: game %s | learned %s%s"):format(C.isOn()and"ON"or"off",tG~=""and tG or"nothing yet",#C.rec.rules>0 and", choices"or""))
if a.lit.arL~=(C.msg~="")then a.lit.arL=(C.msg~="")a.arL.TextColor3=C.msg~=""and o.warn or o.dim end end end co.SAB={S=c,CFG=d,EV=W,U=a,sg=lh,CAT=ad,LEARN=ah,buildList=eJ,
logAll=c_,evAll=da,AR=C,CR=L,PF=j,PX=l,TM=y,CRATE=e,FU=A,HX=D,CF=J,QX=E,IX=q,SH=Q}z(cn.." loaded")if c.uiErrs>0 then z("UI: "..c.uiErrs.." properties skipped")end
bK("farm")bJ(a.root)bJ(a.tgRoot)if g0 then pcall(function()V(g0:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bJ(a.root)bJ(a.tgRoot)end))end)end bM()tt()if c.config and c.config~=""then a.cfgName.Text=c.config end
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(tC)task.spawn(function()local tH=vs()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(tH and("\n(backup: "..tH..")")or"")
local tI=fl(al.exec)if tI and not tI:find("SAB autoloader v2",1,true)then dm(al.exec,al.stub)z("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fl(al.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(vA)end)task.spawn(function()while c.alive do local BS,BT=pcall(tC)if not BS then z("UI ERR "..tostring(BT))end
task.wait((c.hidden or bN)and 1.5 or 0.4)end end)task.spawn(function()local BU,BV=pcall(vI)if not BU then z("HOOK ERR "..tostring(BV))end
end)task.spawn(function()pcall(ur)if e.loadSeq and not e.learned then local hw={}for tJ=1,20 do if e.loadSeq[tJ]then hw[#hw+1]=e.loadSeq[tJ]end end
if#hw>0 then e.learned={seq=hw,mode=e.loadMode}z("remembered how to open crates directly")end end if ic()then z(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local BW,tK=pcall(y9)if BW and tK and c.alive and not c.manualPad then c.manualPad=tK end end)task.spawn(function()
while c.alive do local l4,l5=pcall(l.buyTick)if not l4 then z("PET ERR "..tostring(l5))task.wait(5)end l4,l5=pcall(l.wishTick)
if not l4 then z("WISH ERR "..tostring(l5))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local hx,tL=0,x()
V(game:GetService("RunService").Heartbeat:Connect(function()hx=hx+1 end))V(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=x()while c.alive do task.wait(1)local tM=x()j.fps,hx,tL=hx/math.max(tM-tL,0.001),0,tM local BX,BY=pcall(j.tick)
if not BX then z("PERF ERR "..tostring(BY))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local BZ,B0=pcall(A.tick)if not BZ then z("FUSE ERR "..tostring(B0))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local B1,B2=pcall(y.tick)if not B1 then z("TEAM ERR "..tostring(B2))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local hy=ag:WaitForChild("Remotes",30)local tN=hy and hy:WaitForChild("ClanEvent",30)
if tN and c.alive then V(tN.OnClientEvent:Connect(function(B3,B4)if B3=="call"then pcall(D.onCall,B4)end end))
end local tO=hy and hy:FindFirstChild("RollConfirmAsk")if tO and c.alive then V(tO.OnClientEvent:Connect(function(B5)E.asked=B5 or"butter"end))end
end)task.spawn(function()local l6=ag:WaitForChild("Remotes",30)if not(l6 and c.alive)then return end local function hz(B6,B7)
local l7=l6:FindFirstChild(B6)if l7 and l7:IsA("RemoteEvent")then V(l7 .OnClientEvent:Connect(function(...)pcall(B7,...)end))end
end hz("NewSquishyDiscovered",function(l8,tP)if type(l8)~="string"then return end q.disc=q.disc or{}q.disc[aa(l8)]=true
z(("INDEX: %s%s is in your Index now"):format(ai(aa(l8)),tP and(" ("..tostring(tP)..")")or""))end)hz("IndexRefresh",q.loadDisc)
hz("IndexRowComplete",function(B8)z("INDEX: the whole "..tostring(B8).." row is complete")end)hz("AdminShow",q.admin)
local tQ=l6:FindFirstChild("AdminShowSync")if tQ then local B9,tR=pcall(function()return tQ:InvokeServer()end)
if B9 and type(tR)=="table"then for EE,B_ in pairs(tR)do pcall(Q.add,B_)end end end while c.alive do local Ca,Cb=pcall(q.tick)
if not Ca then q.msg="index error: "..tostring(Cb)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Cc,Cd=pcall(E.tick)if not Cc then z("QUEST ERR "..tostring(Cd))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(e2)end end)pcall(C.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Cf=(type(newcclosure)=="function")and newcclosure or function(Ce)return Ce end local l9
local tS=(type(setnamecallmethod)=="function")and setnamecallmethod or nil l9=hookmetamethod(game,"__namecall",Cf(function(tT,...)
local eR=getnamecallmethod()if c.alive and(eR=="InvokeServer"or eR=="FireServer")then local tU,tV=pcall(function()return tT.Name end)
if tU and tV=="CrateAction"and not e.replaying then pcall(e.saw,eR,...)elseif tU and tV=="AutoRollAction"and not C.replaying then pcall(C.saw,eR,...)end
if tS then tS(eR)end end return l9(tT,...)end))e.oldNC=l9 end)end if hC then V(F.Idled:Connect(function()pcall(function()hC:CaptureController()hC:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for EF=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and ar()and(c.plot or bp())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then C.apply("joined")end while c.alive do task.wait(30)local hA=bT()
if hA and q.on()and not aI(hA.name)then hA=nil end if c.alive and d.AutoRoll and c.running and not C.isOn()and not hA and not ac()
and not e.waiting and not e.on and not c.busy then C.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for EG=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bp()if ar()and c.plot and q.any()then et(true,true)z("started by itself")
return end task.wait(1)end if c.alive and not c.running then z("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bp()c.lastCollect=x()while c.alive do if c.running then local Cg,tW=pcall(Ab)if not Cg and tW~=hD then z("LOOP ERR "..tostring(tW))end
end task.wait(0.1)end end)hB("loaded - window is at the top left")end local Ci,l_=xpcall(t0,function(Ch)return tostring(Ch).."\n"..debug.traceback()end)
if not Ci then pcall(function()warn("SAB "..cn.." ERROR: "..tostring(l_))end)hB("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cn.." ERROR: "..tostring(l_))end)pcall(function()local tX=(type(getgenv)=="function"and getgenv())or _G
if type(tX.SAB_KILL)=="function"then tX.SAB_KILL()end for EH,Cj in ipairs({"SABFarmGui","SABToggle"})do local tY=F.PlayerGui:FindFirstChild(Cj)
if tY then tY:Destroy()end end end)pcall(function()local eS=Instance.new("ScreenGui")eS.Name="SABError"eS.ResetOnSpawn=false
eS.DisplayOrder=1000 local aY=Instance.new("TextBox")aY.Size=UDim2 .new(0,340,0,170)aY.Position=UDim2 .new(0,10,0,50)
aY.BackgroundColor3=Color3 .fromRGB(90,20,20)aY.TextColor3=Color3 .new(1,1,1)aY.TextSize=11 aY.TextWrapped=true
aY.ClearTextOnFocus=false aY.TextXAlignment=Enum.TextXAlignment.Left aY.TextYAlignment=Enum.TextYAlignment.Top
aY.Text="SAB "..cn.." failed to start. Send this text:\n"..tostring(l_)aY.Parent=eS eS.Parent=F:WaitForChild("PlayerGui")
end)end
