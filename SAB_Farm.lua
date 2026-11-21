local cl="v26"local l7=game:GetService("Players")local F=l7 .LocalPlayer or l7 .PlayerAdded:Wait()local function hz(tR)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..cl,Text=tR,Duration=6})
end)end hz("script started")local function tS()local aj=game:GetService("ReplicatedStorage")local as=game:GetService("Workspace")
local l8=game:GetService("UserInputService")local cm=(type(getgenv)=="function"and getgenv())or _G if type(cm.SAB_KILL)=="function"then pcall(cm.SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local hA=(function()local tT,tU=pcall(function()return game:GetService("VirtualUser")end)return tT and tU or nil end)()
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
local l,y,j,A,D,J,E={},{},{},{},{},{},{}local q,Q={},{}local hB={}local hC,eR,c8,c9={},{},{},{}local function V(l9)hC[#hC+1]=l9 return l9 end
local function af(tV)task.wait(tV)if not c.alive then error(hB,0)end end local function z(eS)eS=os.date("%H:%M:%S").." "..tostring(eS)
table.insert(eR,1,eS)if#eR>6 then table.remove(eR)end c.logN=(c.logN or 0)+1 c8[#c8+1]=eS if#c8>80 then table.remove(c8,1)end
end local function eT(l_)if type(l_)~="string"then return""end return(l_:lower():gsub("[^%w]",""))end local function aa(tW)
local ma=eT(tW)local hD=ma:gsub("butter$","")if hD==""then hD=ma end return hD end local function aI(mb)if type(mb)~="string"then return false end
local hE=aa(mb)if hE==""then return false end if q.want then return q.want(hE)end return d.Targets[hE]==true end
local function tX(c_)c_=c_:lower()return c_:find("squishy",1,true)~=nil or c_:match("butter$")~=nil or c_:match("butter[^%a]")~=nil
end local hF={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aJ(da)if type(da)~="number"then return"?"end
local eU=1 while math.abs(da)>=1000 and eU<#hF do da=da/1000 eU=eU+1 end local tY=string.format("%.2f",da):gsub("%.?0+$","")
return tY..hF[eU]end local function tZ(mc)if type(mc)~="string"then return nil end local t0,md=mc:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local hG=tonumber(t0)if not hG then return nil end if md==""then return hG end for t1,t2 in ipairs(hF)do if t2:lower()==md:lower()then return hG*1000^(t1-1)end end
return nil end local function a6()local me=F:GetAttribute("BoardValueMoney")if type(me)=="number"then return me end
local mf=F:FindFirstChild("leaderstats")if mf then for Cd,t3 in ipairs({"Cash","Money","Coins"})do local hH=mf:FindFirstChild(t3)
if hH and type(hH.Value)=="number"then return hH.Value end end end end local function eV(t4)local hI=t4:GetFullName()
if c.plot then local hJ=c.plot:GetFullName()if hI:sub(1,#hJ)==hJ then return hI:sub(#hJ+2)end end return hI end
local function au()local eW=F.Character if eW and eW:FindFirstChild("HumanoidRootPart")then local mg=eW:FindFirstChildOfClass("Humanoid")
if mg and mg.Health>0 then return eW end end end local function bo()local hK=as:FindFirstChild("Plots")if not hK then return nil end
local function mh(t5)local mi=t5:FindFirstChild("Plate")return mi~=nil and mi:FindFirstChild("EditStackAttachment",true)~=nil
end local mj=F:GetAttribute("PlotNumber")if mj~=nil then local hL=hK:FindFirstChild(tostring(mj))if hL and mh(hL)then return hL end
end for Ce,mk in ipairs(hK:GetChildren())do if mh(mk)then return mk end end end local function db(ml)local bp=ml and ml.Parent
for Cf=1,6 do if not bp then return nil end if bp:IsA("BasePart")then return bp end if bp:IsA("Model")then return bp.PrimaryPart or bp:FindFirstChildWhichIsA("BasePart",true)end
bp=bp.Parent end end local function mm(mn)local hM=mn.Parent if hM and hM:IsA("Attachment")then return hM.WorldPosition end
local mo=db(mn)return mo and mo.Position end local function mp()local cn=c.plot and c.plot:FindFirstChild("Plate")
if not cn then return nil end if cn:IsA("BasePart")then return cn.Position end if cn:IsA("Model")then return cn:GetPivot().Position end
local mq=cn:FindFirstChildWhichIsA("BasePart",true)return mq and mq.Position end local function mr()local hN={}
local ms=c.plot and c.plot:FindFirstChild("WaxStations")if ms then for Cg,t6 in ipairs(ms:GetChildren())do local mt=t6:FindFirstChild("SquishyPlaceHolder")
local hO=mt and mt:FindFirstChild("PlacePrompt")if hO and hO:IsA("ProximityPrompt")then hN[#hN+1]=hO end end end
return hN end local function eX()local mu,hP=mr(),0 for Ch,t7 in ipairs(mu)do if t7 .Enabled then hP=hP+1 end end
local hQ=#mu local hR=F:GetAttribute("WaxStations")if type(hR)=="number"and hR>hQ then hQ=hR end return hP,hQ
end local function t8()local mv=au()local mw=mv and mv.HumanoidRootPart.Position local hS,mx for Ci,hT in ipairs(mr())do
if hT.Enabled then local my=mm(hT)local mz=(my and mw)and(my-mw).Magnitude or 1e9 if not hS or mz<mx then hS,mx=hT,mz end
end end return hS end local function mA()local eY=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not eY then return nil end local mB=eY:FindFirstChild("BuyPromptAttachment")local eZ=(mB and mB:FindFirstChild("BuyPrompt"))or eY:FindFirstChild("BuyPrompt",true)
if eZ and eZ:IsA("ProximityPrompt")and eZ:IsDescendantOf(eY)then return eZ end end local mC={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local t9={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ag={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local hU="SAB_order.txt"local function e0()if not ag.dirty or type(writefile)~="function"then return end local aA={}
for t_,ua in pairs(ag.price)do aA[#aA+1]="P|"..t_.."|"..string.format("%.0f",ua)end for ub,uc in pairs(ag.order)do aA[#aA+1]="O|"..ub.."|"..table.concat(uc,",")end
if e.learned and e.enc then aA[#aA+1]="M|mode|"..tostring(e.learned.mode or"")for ud,e1 in ipairs(e.learned.seq)do
local mD={}for mE=1,e1 .n do mD[mE]=e.enc(e1 .args[mE])end aA[#aA+1]=("A|%d|%s|%d|%s"):format(ud,e1 .m,e1 .n,table.concat(mD,";"))
end end local function hV(ue,uf,e2)local mF={}for mG=1,e2 .n do mF[mG]=e.enc(e2 .args[mG])end aA[#aA+1]=("R|%d|%s|%s|%d|%s"):format(uf,ue,e2 .m,e2 .n,table.concat(mF,";"))
end if e.enc then for ug,uh in ipairs(C.rec.rules)do hV("rules",ug,uh)end if C.rec.on then hV("on",0,C.rec.on)end
if C.rec.off then hV("off",0,C.rec.off)end end for Cj,dc in pairs(L.seen)do aA[#aA+1]=("K|%s|%s|%s|%s"):format(dc.name,dc.title or"",dc.rar or"",dc.price and string.format("%.0f",dc.price)or"")
end if pcall(writefile,hU,table.concat(aA,"\n"))then ag.dirty=false end end local function ui()if type(isfile)~="function"or type(readfile)~="function"then return end
local uj,uk=pcall(isfile,hU)if not(uj and uk)then return end local ul,mH=pcall(readfile,hU)if not(ul and type(mH)=="string")then return end
for um in mH:gmatch("[^\n]+")do local co,cp,a7=um:match("^(%a)|([^|]+)|(.*)$")if co=="P"then ag.price[cp]=tonumber(a7)
elseif co=="M"then e.loadMode=(a7~=""and a7~="nil")and a7 or nil elseif co=="A"and e.dec then local mI=tonumber(cp)
local mJ,e3,uo=a7:match("^([^|]+)|(%d+)|(.*)$")if mI and mJ then e3=tonumber(e3)local mK,e4={},0 for up in(uo..";"):gmatch("([^;]*);")do
e4=e4+1 if e4<=e3 then mK[e4]=e.dec(up)end end e.loadSeq=e.loadSeq or{}e.loadSeq[mI]={m=mJ,n=e3,args=mK}end elseif co=="R"and e.dec then
local mL=tonumber(cp)local e5,uq,e6,ur=a7:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if mL and e5 then e6=tonumber(e6)
local mM,e7={},0 for us in(ur..";"):gmatch("([^;]*);")do e7=e7+1 if e7<=e6 then mM[e7]=e.dec(us)end end local hW={m=uq,n=e6,args=mM}
if e5=="rules"then C.rec.rules[mL]=hW elseif e5=="on"then C.rec.on=hW elseif e5=="off"then C.rec.off=hW end end
elseif co=="K"then local mN,mO,ut=a7:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cp)]={name=cp,title=mN~=""and mN or nil,
rar=mO~=""and mO or nil,price=tonumber(ut)}elseif co=="O"and a7~=""then local e8={}for uu in a7:gmatch("[^,]+")do e8[#e8+1]=uu end
if#e8>0 then ag.order[cp]=e8 end end end end local function uv(e9)if type(e9)~="table"then return end local bO,mP=e9 .rarity,e9 .contents
if type(bO)~="string"or bO==""or type(mP)~="table"then return end local dd={}for Ck,e_ in ipairs(mP)do if type(e_)=="table"and type(e_.butter)=="string"then
dd[#dd+1]={n=e_.butter,ch=tonumber(e_.chance)or 0}end end if#dd==0 then return end table.sort(dd,function(uw,ux)return uw.ch>ux.ch end)
local de,df={},false for uy,uz in ipairs(dd)do de[uy]=uz.n end local hX=ag.order[bO]if not hX or#hX~=#de then df=true end
if not df then for mQ=1,#de do if hX[mQ]~=de[mQ]then df=true break end end end ag.order[bO]=de local hY=tonumber(e9 .price)
if hY and ag.price[bO]~=hY then ag.price[bO]=hY df=true end if df then ag.dirty=true ad.at=0 z("learned the "..bO.." order from its crate")
end end local function cq(uA,uB)local uC=uA:FindFirstChild(uB,true)local uD,hZ=pcall(function()return uC.Text end)
return(uD and type(hZ)=="string"and hZ~="")and hZ or nil end local function ah(mR)return ad.pretty[mR]or mR end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(uE)return eT(uE or"")end
function L.learn(a8)if type(a8)~="table"or type(a8 .name)~="string"then return end local h0=L.key(a8 .name)local a9=L.seen[h0]or{}
local uF=(L.seen[h0]==nil)or(tonumber(a8 .price)and a9 .price~=tonumber(a8 .price))a9 .name,a9 .title=a8 .name,a8 .title or a9 .title
a9 .rar,a9 .price=a8 .rarity or a9 .rar,tonumber(a8 .price)or a9 .price L.seen[h0]=a9 if uF then L.at,ag.dirty=x(),true end
end function L.wanted(mS)if mS==nil then return false end local h1=L.key(mS)return d.CrateTicks[h1]==true or(d.BestCrate and q.bestCrate~=nil and(h1==q.bestCrate or h1==q.bestCrateTitle))
end function L.list()local cr={}for uG,fa in ipairs(L.base)do cr[L.key(fa[1])]={name=fa[1],title=fa[2],rar=fa[3],i=uG}end
for Cl,dg in ipairs(ad.rarOrder)do local mT=false for Cm,uH in pairs(cr)do if uH.rar==dg then mT=true break end end
if not mT and dg~="?"then local mU=dg:gsub("[^%w]","").."Crate"cr[L.key(mU)]={name=mU,title=dg.." Crate",rar=dg,i=50,guess=true}
end end for mV,fb in pairs(L.seen)do local aY=cr[mV]or{i=100}aY.name,aY.title,aY.rar=fb.name or aY.name,fb.title or aY.title,fb.rar or aY.rar
aY.price,aY.guess=fb.price or aY.price,nil cr[mV]=aY end local dh,fc={},{}for uI,uJ in ipairs(mC)do dh[uJ]=uI end
for uK,mW in ipairs(ad.rarOrder)do dh[mW]=dh[mW]or(20+uK)end for uL,di in pairs(cr)do di.k=uL di.price=di.price or ag.price[di.rar or""]
fc[#fc+1]=di end table.sort(fc,function(bP,bQ)if bP.price and bQ.price and bP.price~=bQ.price then return bP.price<bQ.price end
local mX,mY=dh[bP.rar or""]or 99,dh[bQ.rar or""]or 99 if mX~=mY then return mX<mY end if(bP.i or 100)~=(bQ.i or 100)then return(bP.i or 100)<(bQ.i or 100)end
return bP.k<bQ.k end)return fc end local function uM()local mZ=aj:FindFirstChild("Assets")local m0=mZ and mZ:FindFirstChild("Squishies")
if not m0 then return false end local h2,m1,cs={},{},{}local fd=0 for Cn,fe in ipairs(m0:GetChildren())do local dj=aa(fe.Name)
if dj~=""and not h2[dj]then local ff=cq(fe,"RarityText")or"?"h2[dj]=ff m1[dj]=cq(fe,"NameText")or fe.Name cs[ff]=cs[ff]or{}
table.insert(cs[ff],dj)fd=fd+1 end end if fd==0 then return false end for m2,uN in pairs(cs)do local m3=ag.order[m2]or t9[m2]
local h3={}if m3 then for uO,uP in ipairs(m3)do h3[aa(uP)]=uO end end table.sort(uN,function(m4,m5)local h4,h5=h3[m4],h3[m5]
if h4 and h5 then return h4<h5 end if h4 then return true end if h5 then return false end return ah(m4)<ah(m5)
end)end local h6={}for uQ,uR in ipairs(mC)do h6[uR]=uQ end local fg,bR={},{}for uS in pairs(cs)do fg[#fg+1]=uS end
pcall(function()for uT,uU in ipairs(require(aj.Modules.SquishyRNG).Keys)do bR[uU]=uT end end)table.sort(fg,function(ct,cu)
if bR[ct]and bR[cu]and bR[ct]~=bR[cu]then return bR[ct]<bR[cu]end local h7,h8=ag.price[ct],ag.price[cu]if h7 and h8 and h7~=h8 then return h7<h8 end
local h9,h_=h6[ct],h6[cu]if h9 and h_ then return h9<h_ end if h9 then return true end if h_ then return false end
return ct<cu end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=h2,m1,cs,fg,fd,x()return true end local function ia()
if ad.at==0 or(x()-ad.at)>120 then pcall(uM)end return ad.n>0 end local function uV(uW)local m6=aa(uW)return ad.rar[m6]or(W.name and aa(W.name)==m6 and W.rar)or"?"
end local function uX()local fh={}local uY=((d.Best or 0)>0 and next(q.best or{}))and q.best or d.Targets for uZ,u0 in pairs(uY)do if u0 then fh[#fh+1]=ah(uZ)end end
table.sort(fh)return fh end local al={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function m7()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fi(m8)if type(makefolder)~="function"then return end local u1,u2=pcall(isfolder,m8)if not(u1 and u2)then pcall(makefolder,m8)end
end local function fj(m9)if type(isfile)~="function"or type(readfile)~="function"then return nil end local u3,u4=pcall(isfile,m9)
if not(u3 and u4)then return nil end local u5,u6=pcall(readfile,m9)return u5 and u6 or nil end local function dk(u7,u8)
if type(writefile)~="function"then return false end return(pcall(writefile,u7,u8))end local function m_(u9)local dl={}
if type(listfiles)~="function"then return dl end local u_,na=pcall(listfiles,u9)if not u_ or type(na)~="table"then return dl end
for Co,va in ipairs(na)do dl[#dl+1]=tostring(va)end return dl end local function nb()local fk={}for Cp,vb in ipairs(m_(al.cfg))do
local nc=vb:match("([^/\\]+)%.txt$")if nc then fk[#fk+1]=nc end end table.sort(fk)return fk end local function vc()
local ab={"V|1"}ab[#ab+1]="N|Every|"..tostring(d.Every)ab[#ab+1]="N|GlazeLead|"..tostring(d.GlazeLead)ab[#ab+1]="N|FpsCap|"..tostring(d.FpsCap)
ab[#ab+1]="N|MemLimit|"..tostring(d.MemLimit)ab[#ab+1]="N|Best|"..tostring(d.Best or 0)for Cq,nd in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ab[#ab+1]="S|"..nd.."|"..d[nd]end
do local fl={}for vd,dm in pairs(d.Pets)do local ne=(dm.b and"b"or"")..(dm.g and"g"or"")..(dm.w and"w"or"")..((tonumber(dm.f)or 0)>0 and tostring(dm.f)or"")
if ne~=""then fl[#fl+1]=vd.."|"..ne end end table.sort(fl)ab[#ab+1]="P|-"for Cr,ve in ipairs(fl)do ab[#ab+1]="P|"..ve end
end for Cs,nf in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower"})do
ab[#ab+1]="B|"..nf.."|"..(d[nf]and"1"or"0")end local ib=F:GetAttribute("AutoRollRules")if type(ib)=="string"and ib~=""then d.ARrules,d.ARstop=ib,tostring(F:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then ab[#ab+1]="S|rules|"..d.ARrules ab[#ab+1]="S|stop|"..d.ARstop end if c.winPos then ab[#ab+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ab[#ab+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Ct,ic in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fm={}for vf,vg in pairs(ic[2])do if vg then fm[#fm+1]=vf end end table.sort(fm)ab[#ab+1]=ic[1].."|-"for Cu,vh in ipairs(fm)do ab[#ab+1]=ic[1].."|"..vh end
end return table.concat(ab,"\n")end local function vi(ie)if type(ie)~="string"or ie==""then return false end local ng,nh,ni,nj,dn={},false,{},false,nil
for vj in ie:gmatch("[^\n]+")do local aB,ae,aw=vj:match("^(%a)|([^|]*)|?(.*)$")if aB=="N"and ae=="Every"then local ig=tonumber(aw)
if ig and ig>=1 then d.Every=math.floor(ig)end elseif aB=="N"and(ae=="FpsCap"or ae=="MemLimit")then local ih=tonumber(aw)
if ih and ih>=0 then d[ae]=math.floor(ih)end elseif aB=="N"and ae=="Best"then local fn=tonumber(aw)if fn and fn>=0 and fn<=4 then d.Best=math.floor(fn)end
elseif aB=="N"and ae=="GlazeLead"then local fo=tonumber(aw)if fo and fo>=5 and fo<=600 then d.GlazeLead=math.floor(fo)end
elseif aB=="S"and(ae=="TeamNormal"or ae=="TeamFull"or ae=="TeamGlaze"or ae=="TeamWax")then d[ae]=aw elseif aB=="P"and ae~=""then
if not dn then dn={}end if ae~="-"and aw~=""then dn[ae]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aB=="B"then if d[ae]~=nil then d[ae]=(aw=="1")end
elseif aB=="S"and ae=="rules"then d.ARrules=aw elseif aB=="S"and ae=="stop"then d.ARstop=aw elseif aB=="W"then
c.winPos={tonumber(ae)or 10,tonumber(aw)or 44}elseif aB=="G"then c.togPos={tonumber(ae)or 10,tonumber(aw)or 300}
elseif aB=="T"and ae~=""then if ae~="-"then ng[ae]=true end nh=true elseif aB=="K"and ae~=""then if ae~="-"then ni[ae]=true end
nj=true end end if nh then d.Targets=ng end if nj then d.CrateTicks=ni end if dn then d.Pets=dn end return true
end local function fp(cv)if not m7()then return false,"this executor cannot write files"end cv=(cv or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cv==""then return false,"give the config a name"end fi(al.dir)fi(al.cfg)if not dk(al.cfg.."/"..cv..".txt",vc())then return false,"could not write the file"end
c.config=cv return true,cv end local function nk(fq)local nl=fj(al.cfg.."/"..fq..".txt")if not nl then return false,"no config called "..tostring(fq)end
if not vi(nl)then return false,"that config looks empty"end c.config=fq return true,fq end local function nm(ii)
if ii then fi(al.dir)dk(al.auto,ii)elseif type(delfile)=="function"then pcall(delfile,al.auto)else dk(al.auto,"")
end c.autoload=ii end local function vk()if c.selfPath then return c.selfPath end local fr for Cv,vl in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",al.dir})do
for Cw,nn in ipairs(m_(vl))do local ij=nn:lower()if ij:sub(-4)==".lua"and(ij:find("sab_farm",1,true)or ij:find("sab farm",1,true))then
fr=fr or nn end end end c.selfPath=fr return fr end al.stub=[[
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
local function vm()if not m7()then return false,"this executor cannot write files"end fi("autoexec")if not dk(al.exec,al.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fs=(function()local vn,vo=pcall(function()return game:GetService("TeleportService")end)return vn and vo or nil end)()
local function no()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local vp=queueonteleport or queue_on_teleport return(pcall(vp,al.stub))end local function dp(vq)if c.rejoining then return end
c.rejoining=true z("REJOIN ("..vq..")")pcall(e0)if c.autoload then pcall(fp,c.autoload)end local vr=no()z(vr and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Cx=1,30 do if not fs then break end pcall(function()fs:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function vs()local vt,np=pcall(function()return game:GetService("GuiService")end)if vt and np then
pcall(function()V(np.ErrorMessageChanged:Connect(function()if d.Rejoin then dp("roblox error message")end end))
end)end pcall(function()local nq=game:GetService("CoreGui")local nr=nq and nq:WaitForChild("RobloxPromptGui",15)
local ns=nr and nr:WaitForChild("promptOverlay",15)if ns then V(ns.ChildAdded:Connect(function(vu)if d.Rejoin and tostring(vu.Name):lower():find("errorprompt",1,true)then dp("disconnect prompt")end
end))end end)if fs then pcall(function()V(fs.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dp("teleport retry")end)end
end))end)end end local function nt(vv)local nu=c.plot and c.plot:FindFirstChild(vv)if not nu then return nil,false end
for Cy,ik in ipairs(nu:GetChildren())do if ik:IsA("Model")or ik:IsA("BasePart")then return ik,true end end return nil,true
end local function bS()local bq=nt("RolledSquishy")if not bq then return nil end return{model=bq,name=bq.Name,pretty=cq(bq,"NameText")or ah(aa(bq.Name)),
rar=cq(bq,"RarityText")or uV(bq.Name),price=cq(bq,"PriceText")}end local function nv(il)return type(il)=="string"and(ad.rar[aa(il)]~=nil or tX(il))
end local function ac()local im=nt("SquishyEquipped")if im then c.carrySrc,e.heldAt="model",x()return im.Name,im end
local nw=F.Character if nw then for Cz,dq in ipairs(nw:GetDescendants())do if(dq:IsA("Model")or dq:IsA("Tool"))and nv(dq.Name)then
c.carrySrc,e.heldAt="character",x()return dq.Name,dq end end end local ft=F:GetAttribute("SquishyEquipped")if type(ft)=="string"and ft~=""and nv(ft)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return ft,nil end c.carrySrc=nil end local function CA()local CB,vw=ac()return vw end local function nx()
local ny=bS()local io=ny and tZ(ny.price)local ip=a6()if io and ip and ip<io*0.5 then return ip,io end end local function bT(vx)
c9[#c9+1]=os.date("%H:%M:%S").." "..vx if#c9>40 then table.remove(c9,1)end end local function vy(bU,fu)if type(bU)~="string"then return end
bT(("Roll(%s,%s)"):format(bU,tostring(fu)))if bU:lower():find("crate",1,true)then e.rolled,e.rolledAt=bU,x()return
end W.seq=W.seq+1 W.name,W.at=bU,x()W.rar=type(fu)=="string"and fu or nil c.rolls=c.rolls+1 if aI(bU)then z(("ROLL %s [%s] = TARGET"):format(bU,tostring(fu)))end
end local function vz(bV)if type(bV)~="table"then return end local fv=bV.butter or bV.itemName if type(fv)~="string"then return end
c.gifts=c.gifts+1 W.gift,W.giftAt=fv,x()if type(bV.giftId)=="string"then local nz=aj:FindFirstChild("Remotes")
local nA=nz and nz:FindFirstChild("GiftThanks")if nA then pcall(function()nA:FireServer(bV.giftId)end)end end
bT("Gift("..fv.." from "..tostring(bV.fromName)..")")z(("GIFT from %s: %s - it will not be waxed"):format(tostring(bV.fromName),fv))
end local function vA()local nB=aj:WaitForChild("Remotes",30)if not c.alive then return end if not nB then z("Remotes folder missing - no roll events")return end
V(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local nC=F:GetAttribute("SquishyEquipped")
if type(nC)=="string"and nC~=""then e.heldAt=x()end end))local vG={SquishyRollAnimation=vy,InitSquishy=function(nD)W.init,W.initAt=tostring(nD),x()bT("Init("..tostring(nD)..")")end,
CrateUpdate=function(cw,nE)pcall(uv,cw)pcall(L.learn,cw)if type(cw)=="table"then local vB=nE==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not vB then return end local vC=not e.waiting local vD=e.on e.waiting,e.data,e.at=true,cw,x()e.on=(nE==true)
e.title=tostring(cw.title or cw.name or"crate")if e.on and not vD then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then bT("CrateWindow open("..e.title..")")elseif vC then bT("Crate waiting("..e.title..")")z(e.title.." is waiting on your stand")
end else if e.waiting then bT("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local vE=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,vE)end if e.classify then local vF=x()
task.spawn(function()pcall(e.classify,vF)end)end end end,GiftReceived=vz,}for fw,vH in pairs(vG)do local iq=nB:FindFirstChild(fw)
if iq and iq:IsA("RemoteEvent")then V(iq.OnClientEvent:Connect(vH))elseif fw~="CrateUpdate"and fw~="GiftReceived"then z("remote "..fw.." missing")end
end end local function ir()local bW=bS()if bW then if aI(bW.name)then return{state="match",shown=bW.pretty,src="pad",info=bW}
end return{state="skip",info=bW,level="idle",text=("on pad: %s [%s] - not ticked"):format(bW.pretty,tostring(bW.rar))}
end if W.name and(x()-W.at)<4 then if aI(W.name)then return{state="match",shown=ah(aa(W.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ah(aa(W.name)),tostring(W.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fy(vI,vJ,vK,vL)
local fz=RaycastParams.new()fz.FilterType=Enum.RaycastFilterType.Exclude local is={F.Character}for CC,vM in ipairs(vL or{})do is[#is+1]=vM end
fz.FilterDescendantsInstances=is pcall(function()fz.RespectCanCollide=true end)local nF=as:Raycast(Vector3 .new(vI,vJ+4,vK),Vector3 .new(0,-30,0),fz)
return nF and nF.Position or nil end local function cx(nG)local nH=nG:FindFirstChildOfClass("Humanoid")return((nH and nH.HipHeight)or 2)+nG.HumanoidRootPart.Size.Y/2+0.2
end local function it(vN,vO)local iu=vN:FindFirstChildOfClass("Humanoid")local vP=x()while x()-vP<vO do if iu and(iu.FloorMaterial~=Enum.Material.Air or iu.SeatPart)then return true end
af(0.05)end return false end local function aC(vQ,iv,iw)local nI=vQ.HumanoidRootPart nI.AssemblyLinearVelocity=Vector3 .new(0,0,0)
nI.CFrame=iw and CFrame.new(iv,Vector3 .new(iw.X,iv.Y,iw.Z))or CFrame.new(iv)end local function cy(a_,nJ)local bX=au()
if not bX or not a_ then return false end local br=a_.Position local fA=math.clamp(math.max(a_.Size.X,a_.Size.Z)/2+2.2,3,7)
local nK=(nJ and nJ.MaxActivationDistance)or 10 if fA>nK-2 then fA=math.max(2.5,nK-2)end local dr={}local function bY(ds)
ds=Vector3 .new(ds.X,0,ds.Z)if ds.Magnitude>0.05 then dr[#dr+1]=ds.Unit end end local nL=mp()if nL then bY(nL-br)end
bY(a_.CFrame.LookVector)bY(-a_.CFrame.LookVector)bY(a_.CFrame.RightVector)bY(-a_.CFrame.RightVector)bY(bX.HumanoidRootPart.Position-br)
if#dr==0 then bY(Vector3 .new(0,0,1))end local vR,fB=cx(bX),false for CD,vS in ipairs(dr)do local fC=br+vS*fA
local ix=fy(fC.X,br.Y,fC.Z,{a_})if ix and math.abs(ix.Y-br.Y)<14 then aC(bX,Vector3 .new(fC.X,ix.Y+vR,fC.Z),br)
if it(bX,0.7)then fB=true break end end end if not fB then aC(bX,br+dr[1]*fA+Vector3 .new(0,3,0),br)fB=it(bX,1)
end af(0.12)return fB end local function nM(dt)if not dt.Parent or not dt.Enabled then return false end pcall(function()dt:InputHoldBegin()end)
af(math.max(dt.HoldDuration,0)+0.08)pcall(function()dt:InputHoldEnd()end)return true end local function ao(nN,vT)
local vU=x()while x()-vU<vT do if nN()then return true end af(0.05)end return nN()end local function du(cz,vV,nO,vW)
local vX=c.zapFirst and{"zap","hold"}or{"hold","zap"}for vY,iy in ipairs(vX)do if vY==2 and(vW or not(cz.Parent and cz.Enabled and(not nO or nO())))then break end
local iz if iy=="hold"then iz=nM(cz)else iz=type(fireproximityprompt)=="function"and cz.Parent~=nil and cz.Enabled and pcall(fireproximityprompt,cz)end
if iz and ao(vV,1.2)then c.zapFirst=(iy=="zap")return true,iy end end return false end local function nP(iA)local bs=mA()
if not bs or not bs.Enabled then z("buy: nothing on the pad")return false end local nQ=db(bs)if not nQ then z("buy: pad part missing")return false end
c.lastBuyAt=x()local vZ,nR=W.seq,a6()cy(nQ,bs)if not bs.Enabled then z("buy aborted: pad emptied")return false end
local cA=ir()if not iA and cA.state~="match"then z("buy aborted: "..(cA.text or"pad changed"))c.matchSince=nil
return false end local iB=cA.info and cA.info.name or(cA.state=="match"and W.name)or nil local function v0()return bs.Enabled and ac()==nil and(iA or ir().state=="match")
end local v1,v2=du(bs,function()return ac()~=nil or((not bs.Enabled)and(iA or W.seq==vZ))end,v0,nx()~=nil)if v1 then
ao(function()return ac()~=nil end,0.8)local dv=ac()local nS=a6()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil W.name,W.rar,W.at=nil,nil,x()z(("BOUGHT %s%s via %s"):format(dv and ah(aa(dv))or(cA.shown or"?"),(nR and nS)and(" for $"..aJ(nR-nS))or"",v2))
if dv and iB and aa(dv)~=aa(iB)then z(("note: picked up %s, not %s"):format(dv,iB))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local nT=bS()z(("BUY REFUSED: cash short? have $%s, price %s"):format(aJ(a6()),(nT and nT.price)or"?"))
return false end local function nU()local dw=ac()if not dw then c.holding=false z("place: hands are empty")return false
end if not aI(dw)then z(("REFUSED TO WAX %s - it is not ticked"):format(ah(aa(dw))))return false end for CE=1,d.PlaceTries do
local bt=t8()if not bt then z("place: no free station")break end local nV=db(bt)if nV then cy(nV,bt)local nW=ac()
if not nW then c.holding=false z("place: hands emptied on the way")return false end if not aI(nW)then z("place: what I carry changed, not waxing it")return false end
if bt.Enabled then local v3,v4=du(bt,function()return not bt.Enabled end,function()return bt.Enabled end)if v3 then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 W.name,W.rar,W.at=nil,nil,x()
z(("WAXED %s #%d at %s via %s"):format(ah(aa(dw)),c.placed,bt.Parent.Parent.Name,v4))if q.placed then pcall(q.placed,dw)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end z("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))z(c.capMsg)end return false end function y.place()local v5=x()while c.alive and y.editing and x()-v5<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then y.placing=true local v6=x()while c.alive and y.current()~=d.TeamWax and x()-v6<5 do af(0.1)end
if y.current()==d.TeamWax then af(0.3)else z("wax team did not come on in time - placing anyway")end end local v7,nX=pcall(nU)
y.placing=false if not v7 then error(nX,0)end return nX end local function nY(nZ)return type(nZ)=="string"and nZ:lower():find("crate",1,true)~=nil
end local v8={SABFarmGui=1,SABToggle=1,SABError=1}local function iC(v9)local bu=v9 while bu do if v8[bu.Name]then return false end
if bu:IsA("ScreenGui")then local v_,wa=pcall(function()return bu.Enabled end)return(not v_)or wa~=false end if bu:IsA("GuiObject")and not bu.Visible then return false end
bu=bu.Parent end return false end local function fD(fE)local cB=""pcall(function()if fE:IsA("TextButton")then cB=fE.Text end end)
if not cB:find("%a")then for CG,fF in ipairs(fE:GetDescendants())do if(fF:IsA("TextLabel")or fF:IsA("TextButton"))and fF.Text:find("%a")then cB=fF.Text break end
end end if not cB:find("%a")then cB=fE.Name end return(cB:lower():gsub("[^%a]",""))end local function wb()local dx,dy
local n0=F:FindFirstChildOfClass("PlayerGui")if not n0 then return nil,nil end for CH,dz in ipairs(n0:GetDescendants())do
if dz:IsA("GuiButton")and iC(dz)then local iD=fD(dz)if iD:sub(1,4)=="open"and not iD:find("shop",1,true)then dx=dx or dz end
if iD:sub(1,7)=="discard"then dy=dy or dz end end end if dx and dy then return dx,dy end if e.on then return dx,dy end
return nil,nil end local iE=(function()local wc,wd=pcall(function()return game:GetService("VirtualInputManager")end)return wc and wd or nil end)()
local function n1(ba,iF)local iG={}local function n2(we)iG[#iG+1]=we end if c.tapWay then n2(c.tapWay)end for CI,n3 in ipairs({"touch","conn","signal"})do
if n3~=c.tapWay then n2(n3)end end local function n4(wf,...)local wg,iH=pcall(getconnections,wf)if not(wg and type(iH)=="table"and#iH>0)then return false end
local n5,wh,wi=false,{...},select("#",...)for CJ,wj in ipairs(iH)do if pcall(function()wj:Fire(table.unpack(wh,1,wi))end)then n5=true end
end return n5 end local function n6()local n7=Vector3 .new(0,0,0)pcall(function()local n8,n9=ba.AbsolutePosition,ba.AbsoluteSize
n7=Vector3 .new(n8 .X+n9 .X/2,n8 .Y+n9 .Y/2,0)end)local iI={Position=n7,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()iI.UserInputType=Enum.UserInputType.Touch end)pcall(function()iI.UserInputState=Enum.UserInputState.End end)
return iI end for CK,bc in ipairs(iG)do local dA=false if bc=="conn"and type(getconnections)=="function"then if n4(ba.MouseButton1Click)then
dA=true if ao(iF,1.5)then c.tapWay=bc return true,bc end end dA=n4(ba.Activated,n6(),1)elseif bc=="signal"and type(firesignal)=="function"then
if pcall(firesignal,ba.MouseButton1Click)then if ao(iF,1.5)then c.tapWay=bc return true,bc end end dA=pcall(firesignal,ba.Activated,n6(),1)
elseif bc=="touch"and iE then dA=pcall(function()local n_,oa=ba.AbsolutePosition,ba.AbsoluteSize local ob=0 local oc=ba:FindFirstAncestorWhichIsA("ScreenGui")
local wk,wl=pcall(function()return oc and oc.IgnoreGuiInset end)if not(wk and wl)then pcall(function()ob=game:GetService("GuiService"):GetGuiInset().Y end)
end local od,oe=n_.X+oa.X/2,n_.Y+oa.Y/2+ob iE:SendMouseButtonEvent(od,oe,0,true,game,1)task.wait(0.06)iE:SendMouseButtonEvent(od,oe,0,false,game,1)
end)end if dA and ao(iF,1.5)then c.tapWay=bc return true,bc end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function iJ(of)local dB=of.Parent while dB and dB~=c.plot do if e.NOT[dB.Name]then return false end dB=dB.Parent
end local iK=(of.ActionText or""):lower()if iK:find("roll",1,true)or iK:find("place",1,true)or iK:find("sell",1,true)then return false end
return true end local function wm()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local og=c.plot:FindFirstChild("CrateStand")local dC if og then for CL,fG in ipairs(og:GetDescendants())do
if fG:IsA("ProximityPrompt")and fG.Enabled and iJ(fG)then dC=fG break end end end if not dC then for CM,bv in ipairs(c.plot:GetDescendants())do
if bv:IsA("ProximityPrompt")and bv.Enabled and iJ(bv)then local oh=bv:FindFirstAncestorWhichIsA("Model")local wn=((bv.ActionText or"").." "..(bv.ObjectText or"").." "..bv.Name.." "..(oh and oh.Name or"")):lower()
if wn:find("crate",1,true)then dC=bv break end end end end e.prompt=dC return dC end local function iL()if e.on then return true end
local dD=wm()if not dD then e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local oi=db(dD)if oi then cy(oi,dD)end e.ours=true du(dD,function()return e.on end)if ao(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: pressed "..eV(dD).." but no window came up")
return false end do local function wo(oj)local cC=oj.Parent while cC and cC:IsA("GuiObject")do local ol,om=false,false
for CN,dE in ipairs(cC:GetDescendants())do if dE~=oj and dE:IsA("GuiButton")and fD(dE):sub(1,7)=="discard"then ol=true end
if dE:IsA("TextLabel")then local iM=dE.Text:lower()if iM:find("crate",1,true)or iM:find("can contain",1,true)or iM:find("cost",1,true)then om=true end
end if ol and om then return cC end end cC=cC.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local oo=F:FindFirstChildOfClass("PlayerGui")if not oo then return nil end for CO,fH in ipairs(oo:GetDescendants())do
if fH:IsA("GuiButton")and not fH:FindFirstAncestor("SABFarmGui")and fD(fH):sub(1,4)=="open"then local iN=wo(fH)
if iN then e.win=iN return iN end end end end local function wp(wq)for CP,fI in ipairs(wq:GetDescendants())do
if fI:IsA("GuiButton")then local op,iO=fD(fI),fI.Name:lower()if op=="x"or op=="close"or iO=="x"or iO:find("close",1,true)or iO:find("exit",1,true)then return fI end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(wr)task.wait(wr and 4 or 1.2)if e.on or e.waiting then return end
local fJ=e.findWin()if not fJ or not iC(fJ)then return end local oq=wp(fJ)if oq and n1(oq,function()return not iC(fJ)end)then return end
z("the crate window is still open - tap its X")end end local function fK(fL)if not iL()then return false end local ot=x()-(e.openedAt or 0)
if ot<0.6 then af(0.6-ot)end local iP=e.title local ws,wt=wb()local ou=fL and ws or wt if not ou then e.lastFail=x()
c.crateFails=c.crateFails+1 z(("crate: no %s button found in %s"):format(fL and"Open"or"Discard",iP))return false
end local wu=ac()local wv,CQ=n1(ou,function()return(not e.on)or(ac()~=nil and ac()~=wu)end)if not wv then e.lastFail=x()
c.crateFails=c.crateFails+1 z("crate: could not press "..(fL and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fL then c.crates=c.crates+1 ao(function()return ac()~=nil end,1.5)local ov=ac()
z(("OPENED %s -> %s"):format(iP,ov and ah(aa(ov))or"?"))else z("discarded "..iP.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(ww,...)local wx=select("#",...)e.calls[#e.calls+1]={t=x(),m=ww,n=wx,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aD,bd)local bw=type(aD)if(bw=="string"or bw=="number")and type(bd.data)=="table"then for ow,iQ in pairs(bd.data)do
if iQ==aD and type(ow)=="string"and(type(iQ)=="string"or type(iQ)=="number")then return{__slot="f:"..ow}end end
end if bw=="string"then if bd.crate and aD==bd.crate then return{__slot="crate"}end if bd.title and aD==bd.title then return{__slot="title"}end
if bd.rar and aD==bd.rar then return{__slot="rarity"}end return aD end if bw=="number"or bw=="boolean"or bw=="nil"then return aD end
if bw=="table"then local ox={}for wy,oy in pairs(aD)do if type(oy)=="table"then return nil,"nested table"end local wz,oz=e.slot(oy,bd)
if oz then return nil,oz end ox[wy]=wz end return ox end local wA,wB=pcall(function()return aD:IsA("Instance")end)
if wA and wB then if aD==F then return{__slot="player"}end if c.plot and aD==c.plot then return{__slot="plot"}end
local fM=c.plot and c.plot:FindFirstChild("CrateStand")if fM and aD==fM then return{__slot="stand"}end if fM and aD.Parent==fM then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bw..")"end function e.resolve(fN)if type(fN)~="table"then return fN end
local aO=fN.__slot if aO and aO:sub(1,2)=="f:"then return e.data and e.data[aO:sub(3)]end if aO=="crate"then return e.data and e.data.name end
if aO=="title"then return(e.data and e.data.title)or e.title end if aO=="rarity"then return e.data and e.data.rarity end
if aO=="player"then return F end if aO=="plot"then return c.plot end if aO=="stand"or aO=="model"then local iR=c.plot and c.plot:FindFirstChild("CrateStand")
if aO=="stand"or not iR then return iR end for CS,oA in ipairs(iR:GetChildren())do if nY(oA.Name)then return oA end end
return nil end local oB={}for wC,wD in pairs(fN)do oB[wC]=e.resolve(wD)end return oB end function e.classify(iS)
if e.directOff then return end local fO={}for CT,iT in ipairs(e.calls)do if iT.t<=iS+0.05 and iS-iT.t<=6 then fO[#fO+1]=iT end
end if#fO==0 then return end if not ao(function()return(e.heldAt or 0)>=iS-1 end,2.5)then return end local dF={}
for CU,dG in ipairs(fO)do local oC={}for oD=1,dG.n do local wE,oE=e.slot(dG.args[oD],dG)if oE then z("crate call has "..oE.." - keeping the button method")
return end oC[oD]=wE end dF[#dF+1]={m=dG.m,n=dG.n,args=oC}end local iU=e.learned e.learned={seq=dF,mode=iU and iU.mode or nil}
ag.dirty=true if not iU then z(("learned how to open crates directly (%d call%s)"):format(#dF,#dF==1 and""or"s"))end
end function e.replay()local oF=e.learned local oG=aj:FindFirstChild("Remotes")local iV=oG and oG:FindFirstChild("CrateAction")
if not(oF and iV)then return false end local oH=table.unpack or unpack e.replaying=true for CV,dH in ipairs(oF.seq)do
local iW={}for oI=1,dH.n do iW[oI]=e.resolve(dH.args[oI])end task.spawn(function()pcall(function()if dH.m=="InvokeServer"then iV:InvokeServer(oH(iW,1,dH.n))
else iV:FireServer(oH(iW,1,dH.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(wF)return(wF:gsub("[%%|;=,\n]",function(wG)return("%%%02X"):format(wG:byte())end))end
function e.enc(bZ)local fP=type(bZ)if fP=="string"then return"s"..e.esc(bZ)end if fP=="number"then return"n"..tostring(bZ)end
if fP=="boolean"then return bZ and"b1"or"b0"end if fP=="nil"then return"z"end if bZ.__slot then return"k"..bZ.__slot end
local iX={}for wH,wI in pairs(bZ)do iX[#iX+1]=e.enc(wH).."="..e.enc(wI)end return"t"..table.concat(iX,",")end
function e.dec(oJ)local dI,dJ=oJ:sub(1,1),oJ:sub(2)local function wJ(wK)return(wK:gsub("%%(%x%x)",function(wL)return string.char(tonumber(wL,16))end))end
if dI=="s"then return wJ(dJ)end if dI=="n"then return tonumber(dJ)end if dI=="b"then return dJ=="1"end if dI=="k"then return{__slot=dJ}end
if dI=="t"then local oK={}for wM in dJ:gmatch("[^,]+")do local oL,wN=wM:match("^(.-)=(.*)$")if oL then local oM=e.dec(oL)
if oM~=nil then oK[oM]=e.dec(wN)end end end return oK end return nil end function e.goneOrNew(wO)return function()
if not e.waiting then return true end local oN=ac()return oN~=nil and oN~=wO end end function e.near()local oO=aj:FindFirstChild("Remotes")
local oP=oO and oO:FindFirstChild("CrateAction")local iY=au()local iZ=c.plot and c.plot:FindFirstChild("CrateStand")
local i0=iZ and iZ:FindFirstChild("Spot")if not(oP and iY and i0)then return false,"no crate stand or remote"end
local i1=iY.HumanoidRootPart local fQ=i1 .CFrame local oQ,i2=e.title,"no answer"local wP=ac()local oR=iZ:FindFirstChild("Holder")
local function oS()if not oR then return e.waiting or e.on end for CW,wQ in ipairs(oR:GetChildren())do if wQ:IsA("Model")then return true end end
return false end for wR=1,3 do if not(e.waiting or e.on)or not oS()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(i1 .Position-i0 .Position).Magnitude>8 then cy(i0,e.prompt)end af(0.12+0.15*wR)
local aZ={}e.replaying=true task.spawn(function()aZ.ok,aZ.v=pcall(function()return oP:InvokeServer("open")end)
aZ.done=true end)ao(function()return aZ.done end,6)e.replaying=false local b0=aZ.v if aZ.done and aZ.ok and type(b0)=="table"and b0 .ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 z(("OPENED %s -> %s (no window)"):format(oQ,b0 .prize and ah(aa(tostring(b0 .prize)))or"?"))
ao(function()local oT=ac()return oT~=nil and oT~=wP end,1.5)if(i1 .Position-fQ.Position).Magnitude>8 then pcall(function()aC(iY,fQ.Position,fQ.Position+fQ.LookVector)end)end
return true,"opened"end i2=(aZ.done and aZ.ok and type(b0)=="table")and tostring(b0 .reason or"refused, no reason given")
or(aZ.done and("error: "..tostring(b0))or"no answer in 6s")af(0.3)if not oS()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 z(("crate: the server would not open %s next to the stand (%s)"):format(oQ,i2))
return false,i2 end function e.smart()local i3=e.title if(e.nearFails or 0)<3 then local wS=e.near()if wS then return true end
if e.nearFails>=3 then z("opening next to the stand failed 3 times - trying the older ways")end end local b1=e.learned
if b1 then local i4=ac()if e.on then e.replay()if ao(e.goneOrNew(i4),3.5)then c.crates=c.crates+1 z("OPENED "..i3 .." (direct)")
return true end else if b1 .mode~="window"then e.replay()if ao(e.goneOrNew(i4),3.5)then c.crates,e.fails=c.crates+1,0
if b1 .mode~="direct"then b1 .mode,ag.dirty="direct",true z("crates now open directly - the window never comes up")
end z("OPENED "..i3 .." (direct, no window)")return true end end if iL()then e.replay()if ao(e.goneOrNew(i4),3.5)then
c.crates,e.fails=c.crates+1,0 if b1 .mode~="window"then b1 .mode,ag.dirty="window",true z("crates need their window up first - it shows briefly")
end z("OPENED "..i3 .." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ag.dirty=b1,nil,true
if e.fails>=3 then e.directOff=true z("direct crate opening failed 3 times - using the button for now")else z("the learned crate call did not work - back to pressing Open")
end end return fK(true)end function C.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end C.cache={}function C.watchCache()C.cache=C.snap()
for wT,oU in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(F:GetAttributeChangedSignal(oU):Connect(function()C.cache[wT]=F:GetAttribute(oU)end))
end end function C.isOn()return F:GetAttribute("AutoRollOn")==true end function C.saw(wU,...)local fR=C.cache
local wV={m=wU,n=select("#",...),args={...},before={rules=fR.rules,stop=fR.stop,on=fR.on,main=fR.main}}task.delay(1.5,function()
if c.alive then pcall(C.learnOne,wV)end end)end function C.learnOne(dK)local ax,dL=C.snap(),dK.before local fS=(ax.rules~=dL.rules)or(ax.stop~=dL.stop)
local oV=(ax.on~=dL.on)or(ax.main~=dL.main)if not fS and not oV then return end local oW={}for oX=1,dK.n do local aK=dK.args[oX]
local b2=type(aK)if b2=="string"and aK~=""and aK==ax.rules then aK={__slot="rules"}elseif b2=="string"and aK~=""and fS and aK==ax.stop and ax.stop~=dL.stop then aK={__slot="stop"}
elseif b2=="table"then local oY={}for wW,cD in pairs(aK)do if type(cD)=="table"or(type(cD)=="userdata")then C.msg="Auto Roll sends something I cannot repeat"return
end oY[wW]=(type(cD)=="string"and cD~=""and cD==ax.rules)and{__slot="rules"}or cD end aK=oY elseif b2~="string"and b2~="number"and b2~="boolean"and b2~="nil"then
if aK==F then aK={__slot="player"}else C.msg="Auto Roll sends something I cannot repeat"return end end oW[oX]=aK
end local cE={m=dK.m,n=dK.n,args=oW}if fS then local i5=false for wX=1,cE.n do local dM=cE.args[wX]if type(dM)=="table"and dM.__slot=="rules"then i5=true end
if type(dM)=="table"and not dM.__slot then for CX,oZ in pairs(dM)do if type(oZ)=="table"and oZ.__slot=="rules"then i5=true end end
end end if i5 then C.rec.rules={cE}else table.insert(C.rec.rules,cE)if#C.rec.rules>60 then table.remove(C.rec.rules,1)end
end end if oV then if ax.on==true then C.rec.on=cE else C.rec.off=cE end d.AutoRoll=(ax.on==true)end if ax.rules and ax.rules~=""then d.ARrules,d.ARstop=ax.rules,ax.stop or""end
ag.dirty=true C.msg=""z(("learned an Auto Roll %s message"):format(fS and"choices"or(ax.on and"on"or"off")))end
function C.resolve(cF)if type(cF)~="table"then return cF end if cF.__slot=="rules"then return d.ARrules~=""and d.ARrules or F:GetAttribute("AutoRollRules")end
if cF.__slot=="stop"then return d.ARstop~=""and d.ARstop or F:GetAttribute("AutoRollStop")end if cF.__slot=="player"then return F end
local o0={}for wY,wZ in pairs(cF)do o0[wY]=C.resolve(wZ)end return o0 end function C.replay(o1,w0)local o2=table.unpack or unpack
for CY,dN in ipairs(w0)do local i6={}for o3=1,dN.n do i6[o3]=C.resolve(dN.args[o3])end C.replaying=true pcall(function()
if dN.m=="InvokeServer"then task.spawn(function()pcall(function()o1:InvokeServer(o2(i6,1,dN.n))end)end)else o1:FireServer(o2(i6,1,dN.n))end
end)C.replaying=false task.wait(0.25)end end function C.apply(o4,w1)if C.busy or not c.alive then return end C.busy=true
pcall(function()local o5=aj:FindFirstChild("Remotes")local i7=o5 and o5:FindFirstChild("AutoRollAction")if not i7 then C.msg="this game has no AutoRollAction"return end
local bx=d.AutoRoll if bx and d.ARrules~=""and F:GetAttribute("AutoRollRules")~=d.ARrules then if#C.rec.rules==0 then
C.msg="pick your Auto Roll choices once in the game's menu so I can learn them"z(C.msg)else C.replay(i7,C.rec.rules)
if ao(function()return F:GetAttribute("AutoRollRules")==d.ARrules end,4)then z("Auto Roll choices put back")else
C.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"z(C.msg)end end end if bx==C.isOn()or(not bx and not w1)then return end
local fT=bx and C.rec.on or C.rec.off if not fT then local dO=bx and C.rec.off or C.rec.on local o6=dO~=nil for w2=1,dO and dO.n or 0 do
if type(dO.args[w2])=="boolean"then o6=false end end if o6 then fT=dO end end if not fT then C.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bx and"on"or"off")
z(C.msg)return end C.replay(i7,{fT})if ao(function()return C.isOn()==bx end,4)then C.msg=""z(("Auto Roll switched %s%s"):format(bx and"ON"or"OFF",o4 and(" ("..o4 ..")")or""))
else C.msg="Auto Roll did not switch - do it once in the game so I can relearn it"z(C.msg)end end)C.busy=false
end l.HS=game:GetService("HttpService")l.uid=(function()local w3,w4=pcall(function()return F.UserId end)return w3 and w4 or 0 end)()
l.buyMsg,l.wishMsg,l.wishN="","",0 function l.info()if l.I then return l.I end local w5,i8=pcall(function()return require(aj:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if w5 and type(i8)=="table"and type(i8 .Pets)=="table"then l.I=i8 end return l.I end function l.order()if l.list then return l.list end
local by=l.info()if not by then return{}end local b3={}if type(by.Order)=="table"and#by.Order>0 then for CZ,o7 in ipairs(by.Order)do if by.Pets[o7]then b3[#b3+1]=o7 end end
else for w6 in pairs(by.Pets)do b3[#b3+1]=w6 end table.sort(b3,function(w7,w8)return(by.Pets[w7].price or 0)<(by.Pets[w8].price or 0)end)
end l.list=b3 return b3 end function l.nice(o8,i9)local o9=l.info()local o_=o9 and o9 .Pets[o8]return((i9 and i9~="")and(i9 .." ")or"")..(o_ and o_.displayName or tostring(o8))
end function l.data()local fU=F:GetAttribute("PetsData")if type(fU)~="string"then return nil end if fU==l.rawD then return l.lastD end
local w9,dP=pcall(function()return l.HS:JSONDecode(fU)end)dP=(w9 and type(dP)=="table")and dP or nil l.rawD,l.lastD=fU,dP
return dP end function l.pen()return aj:FindFirstChild("PetMeadowSpawns")end function l.srv()return as:GetServerTimeNow()end
function l.money()local i_=F:FindFirstChild("MoneyValue")if i_ and type(i_.Value)=="number"then return i_.Value end
return a6()or 0 end function l.wishes()local pa=l.pen()local pb=pa and pa:GetAttribute("Wishes")local ja,pc={},l.srv()
if type(pb)~="string"then return ja end local w_,pd=pcall(function()return l.HS:JSONDecode(pb)end)if w_ and type(pd)=="table"then
for xa,jb in pairs(pd)do if type(jb)=="number"and jb>pc then ja[xa]=jb-pc end end end return ja end function l.call(...)
local pe=aj:FindFirstChild("Remotes")local pf=pe and pe:FindFirstChild("PetRequest")if not pf then return nil end
local pg=table.pack(...)local b4={}task.spawn(function()b4 .ok,b4 .v=pcall(function()return pf:InvokeServer(table.unpack(pg,1,pg.n))end)
b4 .done=true end)local xb=x()while not b4 .done and x()-xb<6 do task.wait(0.05)end if b4 .done and b4 .ok then return b4 .v end
return nil end function l.want(xc)return d.Pets[xc]end function l.closeNaming(jc)local pj=pcall(function()local ph=F:FindFirstChild("PlayerScripts")
local xd=ph and ph:FindFirstChild("Naming",true)require(xd).close()end)af(0.5)if jc.Visible then pcall(function()local pk=jc:FindFirstChild("NameBox",true)if pk then pk:ReleaseFocus()end end)
jc.Visible=false pj=false end return pj end function l.skipNaming()l.namingUntil=x()+10 if l.namingOn then return end
l.namingOn=true task.spawn(function()while c.alive and x()<l.namingUntil do local pl=F:FindFirstChildOfClass("PlayerGui")
local pm=pl and pl:FindFirstChild("MainGui")local fV=pm and pm:FindFirstChild("PetNameGui")if fV and fV.Visible then
af(0.4)if fV.Visible then l.namingShut=(l.namingShut or 0)+1 pcall(l.closeNaming,fV)break end end af(0.25)end
l.namingOn=false end)end function l.buyTick()if not d.PetBuy then l.buyMsg="auto adopt is off"return end local jd,pn,fW=l.info(),l.pen(),l.data()
if not(jd and pn and fW)then l.buyMsg="pet data not loaded yet"return end l.tryAt=l.tryAt or{}local dQ,je=#(fW.pets or{}),tonumber(fW.maxOwned)or 60
local xe,po,dR=l.srv(),{},nil for C0,aP in ipairs(pn:GetChildren())do po[aP.Name]=true local b5,fX=aP:GetAttribute("Pet"),aP:GetAttribute("Variant")or""
local jf=b5 and l.want(b5)if jf and jf.b and jd.Pets[b5]and(not jf.g or fX=="Big")and A.wantMore(b5,fX,fW)and not aP:GetAttribute("A_"..l.uid)
and(tonumber(aP:GetAttribute("ExpiresAt"))or 0)>xe+1 and x()>=(l.tryAt[aP.Name]or 0)then local dS,pp=l.nice(b5,fX),jd.Pets[b5].price or 0
if dQ>=je then dR=("%s is in the pen, but you have %d/%d pets"):format(dS,dQ,je)l.tryAt[aP.Name]=x()+15 elseif l.money()<pp then
dR=("%s is in the pen - need $%s"):format(dS,aJ(pp))l.tryAt[aP.Name]=x()+5 else l.tryAt[aP.Name]=x()+8 local bz=l.call("adopt",aP.Name)
if type(bz)=="table"and bz.ok then dQ=dQ+1 l.buys=(l.buys or 0)+1 l.recent=l.recent or{}local xf=type(bz.pet)=="table"and bz.pet or{}
table.insert(l.recent,{id=tostring(xf.id or("?"..x())),name=b5,variant=fX,at=x()})if#l.recent>30 then table.remove(l.recent,1)end
z("ADOPTED "..dS)l.skipNaming()dR="adopted "..dS else local pq=type(bz)=="table"and tostring(bz.reason or"no reason given")or"no answer"
z(("adopt %s failed: %s"):format(dS,pq))dR="adopt failed: "..pq if type(bz)=="table"and bz.bagFull then l.tryAt[aP.Name]=x()+60 end
end end end end for ps in pairs(l.tryAt)do if not po[ps]then l.tryAt[ps]=nil end end l.buyMsg=dR or("watching the pen (%d/%d pets)"):format(dQ,je)
end function l.wishTick()if not d.PetWish then l.wishMsg="auto wish is off"return end local fY=l.info()if not(fY and l.pen())then l.wishMsg="pet data not loaded yet"return end
l.wishTry,l.wishWhy=l.wishTry or{},l.wishWhy or{}local fZ,jg,bA=l.wishes(),0,nil local xg=(type(fY.Wish)=="table"and fY.Wish.cashShare)or 2
local xh=l.data()for C1,az in ipairs(l.order())do local pt=l.want(az)if pt and pt.w and A.wantMore(az,"",xh)then
jg=jg+1 if not fZ[az]and x()>=(l.wishTry[az]or 0)then local jh=tonumber(F:GetAttribute("PetWishCredits"))or 0
local ji=math.floor((fY.Pets[az].price or 0)*xg)if jh<=0 and l.money()<ji then l.wishTry[az]=x()+10 bA=("need $%s to wish for %s"):format(aJ(ji),l.nice(az))
l.wishWhy[az]=bA else l.wishTry[az]=x()+3 local xi=jh>0 and"wishCredit"or"wish"local f0=l.call(xi,az)if type(f0)=="table"and f0 .ok then
l.wishN,l.wishWhy[az]=l.wishN+1,nil z(("WISHED for %s (%s)"):format(l.nice(az),jh>0 and"free wish"or("$"..aJ(ji))))
else local jj=type(f0)=="table"and tostring(f0 .reason or"no reason given")or"no answer"if jj:lower():find("already",1,true)then l.wishTry[az]=x()+2
else z(("wish %s failed: %s"):format(l.nice(az),jj))bA="wish failed: "..jj end end end end end end if not bA then
for C2,f1 in ipairs(l.order())do local pu=l.want(f1)if pu and pu.w and not fZ[f1]and l.wishWhy[f1]then bA=l.wishWhy[f1]break end
end end if not bA then local f2={}for C3,f3 in ipairs(l.order())do local pv=l.want(f3)if pv and pv.w and fZ[f3]then f2[#f2+1]=("%s %dm"):format(l.nice(f3),math.ceil(fZ[f3]/60))end
end bA=jg==0 and"no pet has WISH ticked"or("running: "..(#f2>0 and table.concat(f2,", ")or"none yet"))end l.wishMsg=bA
end y.switches,y.glazed,y.finished=0,0,0 y.done,y.doneN,y.later={},0,{}function y.teams()local jk=l.data()return(jk and jk.teams)or{},jk
end function y.current(cG)cG=cG or l.data()if not cG then return""end local pw={}for C4,xj in ipairs(cG.equipped or{})do pw[tostring(xj)]=true end
for C5,px in ipairs(cG.teams or{})do local py=px.pets or{}local jl=#py==#(cG.equipped or{})if jl then for C6,xk in ipairs(py)do if not pw[tostring(xk)]then jl=false break end end end
if jl then return px.name end end return""end function y.equip(jm)local xl,xm=y.teams()local jn for xn,xo in ipairs(xl)do if xo.name==jm then jn=xn break end end
if not jn then y.msg="no saved team called "..tostring(jm)return false end if y.current(xm)==jm then return true end
for C7=1,4 do local pz=l.call("teamEquip",jn)if type(pz)=="table"and pz.ok then y.switches=y.switches+1 return true
end task.wait(0.4)end return false end function y.left(xp)local pA=xp:FindFirstChild("SquishyPlaceHolder")local pB=pA and pA:FindFirstChild("TimerGui")
local pC=pB and pB:FindFirstChildWhichIsA("TextLabel",true)local jo=pC and pC.Text if type(jo)~="string"or jo:find("-",1,true)then return nil end
local jp,pD,pE=jo:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not jp then return nil end local pF=pE~=""and(tonumber(jp)*3600+tonumber(pD)*60+tonumber(pE))or(tonumber(jp)*60+tonumber(pD))
return pF>0 and pF or nil end function y.waxes()local dT={}local pG=c.plot and c.plot:FindFirstChild("WaxStations")
if not pG then return dT end local pH=l.srv()for C8,a0 in ipairs(pG:GetChildren())do local jq=tonumber(a0:GetAttribute("PourEnd"))
local pI=a0:GetAttribute("PourOwner")if a0:GetAttribute("HasSquishy")and a0:GetAttribute("PourId")and(pI==nil or pI==l.uid)then
local jr=y.left(a0)local pJ=jr and(pH+jr)or((jq and jq>pH)and jq or nil)if pJ then local pK,pL=a0:FindFirstChild("SquishyPlaceHolder"),"?"
if pK then for C9,pM in ipairs(pK:GetChildren())do if pM:IsA("Model")then pL=pM.Name break end end end local xq=tostring(a0:GetAttribute("Helpers")or"")
local js=0 for C_ in xq:gmatch("%d+")do js=js+1 end dT[#dT+1]={st=a0,ends=pJ,sure=jr~=nil,id=a0:GetAttribute("PourId"),name=pL,helps=js,
long=a0:GetAttribute("PourLong")==true}end end end table.sort(dT,function(xr,xs)return xr.ends<xs.ends end)return dT
end function y.glazeCount()local pN=aj:FindFirstChild("Remotes")local pO=pN and pN:FindFirstChild("EditStack")
if not pO then return nil end local xt,dU=pcall(function()return pO:InvokeServer("State",nil)end)if not(xt and type(dU)=="table"and type(dU.state)=="table")then return nil end
local jt,ju=0,{}for Da,f4 in ipairs(dU.state.entries or{})do if f4 .glaze and f4 .glaze~=""then jt=jt+1 ju[f4 .glaze]=(ju[f4 .glaze]or 0)+1 end
end return jt,ju,#(dU.state.entries or{}),dU.state.capacity end function y.finishedOne(f5,pP)y.finished=y.finished+1
task.wait(2)local jv,xu,pQ,xv=y.glazeCount()if jv and pP and jv>pP then y.glazed=y.glazed+1 local jw={}for xw,xx in pairs(xu)do jw[#jw+1]=xw.." "..xx end
z(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ah(aa(f5 .name)),f5 .st.Name,jv,table.concat(jw,", ")))
else z(("wax done on station %s: %s, no glaze%s"):format(f5 .st.Name,ah(aa(f5 .name)),pQ and(" (stack "..pQ.."/"..tostring(xv)..")")or""))
end end function y.tick()y.list=y.waxes()if y.editing and x()-(y.editingSince or x())>120 then y.editing=false end
if y.editing then y.msg="rebuilding teams..."return end if not d.Teams then y.want,y.msg="","auto teams is off"return end
local b6=l.srv()local aE=y.glazeFor if aE then local dV=aE.st local pR=dV.Parent and dV:GetAttribute("HasSquishy")and dV:GetAttribute("PourId")==aE.id
local pS=pR and y.left(dV)if pS then aE.ends=b6+pS end if not pR then y.glazeFor,y.afterUntil=nil,x()+1.5 if not y.done[aE.id or"?"]then
y.done[aE.id or"?"],y.doneN=true,y.doneN+1 if y.doneN>400 then y.done,y.doneN={[aE.id or"?"]=true},1 end local xy=aE.before
task.spawn(function()pcall(y.finishedOne,aE,xy)end)end elseif aE.ends-b6>d.GlazeLead*3+60 or b6>aE.ends+90 then
y.glazeFor,y.afterUntil=nil,x()+1.5 y.later[aE.id or"?"]=x()+120 z(("station %s is not finishing yet (%s left) - glaze team off again"):format(dV.Name,y.clock(aE.ends-b6)))
end end if d.TeamGlaze~=""and not y.glazeFor then local xz=y.speedRatio(d.TeamGlaze)for Db,b7 in ipairs(y.list)do
if b7 .sure and(b7 .ends-b6)*xz[b7 .long and 2 or 1]<=d.GlazeLead and x()>=(y.later[b7 .id or"?"]or 0)and not y.done[b7 .id or"?"]then
y.glazeFor=b7 task.spawn(function()b7 .before=y.glazeCount()end)break end end end local aF,dW="",""local cH=q.snapAt and(q.snapAt-b6)
if cH and cH<-8 then q.snapAt,cH=nil,nil end if d.TeamGlaze~=""and cH and cH<=20 then aF,dW=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cH)))
elseif d.TeamGlaze~=""and(y.glazeFor or x()<(y.afterUntil or 0))then aF,dW=d.TeamGlaze,y.glazeFor and(" - station "..y.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(y.placing or y.aboutToPlace())then aF,dW=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and y.allBusy()then
aF,dW=d.TeamFull," - every station is busy"else aF=d.TeamNormal end y.want=aF local dX=y.current()y.cur=dX if aF~=""and dX~=aF and x()>=(y.nextTry or 0)then
y.nextTry=x()+1.1 if y.equip(aF)then z("team: "..aF..dW)else y.nextTry=x()+3 end end local jx=y.list[1]y.msg=("on: %s%s | next wax done %s"):format(dX~=""and dX or"(not a saved team)",(aF~=""and aF~=dX)and(" -> "..aF)or"",
jx and("in "..y.clock(jx.ends-b6).." (st "..jx.st.Name..")")or"- none running")end function y.clock(bB)bB=math.max(0,math.floor(bB))
if bB>=3600 then return("%d:%02d:%02d"):format(math.floor(bB/3600),math.floor((bB%3600)/60),bB%60)end return("%d:%02d"):format(math.floor(bB/60),bB%60)
end function y.allBusy()local xA,xC=eX()return xC>0 and xA==0 end function y.aboutToPlace()if not c.running then return false end
local pT=ac()if not(pT and aI(pT))then return false end local xD=eX()return xD>0 end function y.mult(pU,xE,pV)return{(1+pU)*(1+pV),(1+pU+xE)*(1+pV)}end
function y.speedNow()local function jy(xF)return tonumber(F:GetAttribute(xF))or 0 end return y.mult(jy("PetWaxSpeed"),jy("PetLongWax"),jy("PetSocialWax"))
end function y.speedOf(xG)local xH,pW=y.teams()if not pW then return nil end for Dc,pX in ipairs(xH)do if pX.name==xG then
local jz={}for Dd,xI in ipairs(pX.pets or{})do for De,pY in ipairs(pW.pets or{})do if tostring(pY.id)==tostring(xI)then jz[#jz+1]=pY break end end
end local pZ=A.caps()local p0,xJ=A.stats(jz)return y.mult(math.min(p0 .waxSpeed or 0,pZ.waxSpeed or 0.25),math.min(p0 .longWax or 0,pZ.longWax or 0.3),xJ.socialWax or 0)
end end return nil end function y.speedRatio(xK)local p1,jA=y.speedNow(),y.speedOf(xK)if not jA then return{1,1}end
return{p1[1]/jA[1],p1[2]/jA[2]}end function y.glazeSoon()return d.Teams and d.TeamGlaze~=""and(y.glazeFor~=nil or x()<(y.afterUntil or 0))
end A.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
A.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}A.buildMsg,A.fuseMsg,A.fused,A.builds="","",0,0
function A.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function A.caps()local jB=l.info()return(jB and type(jB.Caps)=="table")and jB.Caps or A.CAPS
end function A.value(p2,jC)local f6=l.info()local cI=f6 and f6 .Pets[p2]if not(cI and type(cI.boost)=="table")then return nil end
local b8 if type(f6 .boostValue)=="function"then local xL,xM=pcall(f6 .boostValue,p2,(jC~=""and jC)or nil)b8=xL and tonumber(xM)or nil
end if not b8 then b8=cI.boost.value or 0 if jC=="Big"then local p3=b8*1.5 b8=A.ROUND[cI.boost.kind]and math.max(b8+1,math.floor(p3+0.5))or p3
end end return cI.boost.kind,b8,cI.boost.every end function A.stats(xN)local b9,jD={},{}for Df,p4 in ipairs(xN)do
local aQ,f7,p5=A.value(p4 .name,p4 .variant or"")if aQ then if aQ:sub(1,6)=="social"then jD[aQ]=math.max(jD[aQ]or 0,f7)
elseif aQ=="waxStir"or aQ=="cashGift"then b9[aQ]=(b9[aQ]or 0)+f7*60/(p5 or 60)elseif aQ=="luckyPull"then b9 .luckyPull=(b9 .luckyPull or 0)+f7/(p5 or 10)
else b9[aQ]=(b9[aQ]or 0)+f7 end end end return b9,jD end function A.glazeGain(xO,f8)local dY,jE,Dg={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local xP=dY[1]+dY[2]+dY[3]local xQ=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local cJ={}for f9=1,3 do cJ[f9]=dY[f9]+xO*dY[f9]/xP+(f9==1 and xQ or 0)end
local jF={cJ[1]*(1-f8),cJ[2]*(1-f8)+cJ[1]*f8,cJ[3]+cJ[2]*f8}return jF[1]*(jE[1]-1)+jF[2]*(jE[2]-1)+jF[3]*(jE[3]-1)
end function A.score(f_,xR)local jG=A.caps()local ga,gb=A.stats(xR)local function be(p6)return math.min(ga[p6]or 0,jG[p6]or math.huge)end
local xS=(1+be("income"))*(1+(gb.socialIncome or 0))*(1+math.min(ga.cashGift or 0,jG.cashGiftPerMinute or 9)/60)
local xT=1+be("luck")+(ga.luckyPull or 0)+(gb.socialLuck or 0)local p7=xT*(1+be("newFind"))*(1+be("rollSpeed"))
local dZ=math.log(xS)local xU=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local jH=(1+be("waxSpeed")+be("longWax"))*(1+(gb.socialWax or 0))
+math.min(ga.waxStir or 0,jG.waxStirPerMinute or 30)/60/xU local xV=1-(1-be("headStart"))*(1-(gb.socialHeadStart or 0))
if f_=="farm"then return dZ+0.7*math.log(p7)+0.1*math.log(jH)end if f_=="full"then return dZ+0.4*math.log(jH)+0.02*math.log(p7)end
if f_=="glaze"then return A.glazeGain(be("glaze"),be("glazeUp"))+0.001*dZ end if f_=="wax"then return-math.log(1-0.5*xV)+0.001*dZ+0.001*math.log(jH)end
return dZ end function A.best(p8,cK,xW,jI)jI=jI or{}local ay,d0={},{}local function p9(xX)local p_={}for xY,xZ in ipairs(xX)do p_[xY]=cK[xZ]end return p_ end
local function jJ(qa)local jK=A.score(p8,p9(qa))for Dh,x0 in ipairs(qa)do if jI[cK[x0].id]then jK=jK+1e-7 end end
return jK end for Di=1,math.min(xW,#cK)do local gc,jL for jM=1,#cK do if not d0[jM]then ay[#ay+1]=jM local qb=jJ(ay)
ay[#ay]=nil if not jL or qb>jL+1e-12 then gc,jL=jM,qb end end end if not gc then break end d0[gc]=true ay[#ay+1]=gc
end for Dj=1,6 do task.wait()local qc,qd=false,jJ(ay)for jN=1,#ay do for jO=1,#cK do if not d0[jO]then local qe=ay[jN]
ay[jN]=jO local qf=jJ(ay)if qf>qd+1e-9 then d0[qe],d0[jO],qd,qc=nil,true,qf,true else ay[jN]=qe end end end end
if not qc then break end end local qg={}for x1,x2 in ipairs(ay)do qg[x1]=tostring(cK[x2].id)end return qg,A.score(p8,p9(ay))
end function A.count(qh,qi,x3)local d1,d2={},0 local qj,qk={},{}for Dk,x4 in ipairs(qi.arriving or{})do qj[tostring(x4)]=true end
for Dl,cL in ipairs(qi.pets or{})do qk[tostring(cL.id)]=true if cL.name==qh and not qj[tostring(cL.id)]then if cL.variant=="Big"then d2=d2+1 elseif(cL.variant or"")==""then d1[#d1+1]=cL end
end end if not x3 then for Dm,d3 in ipairs(l.recent or{})do if d3 .name==qh and not qk[d3 .id]and x()-d3 .at<20 then
if d3 .variant=="Big"then d2=d2+1 else d1[#d1+1]=d3 end end end end return d1,d2 end function A.goal(x5)local ql=d.Pets[x5]return ql and tonumber(ql.f)or 0 end
function A.wantMore(qm,x6,qn)local jP=A.goal(qm)if jP<=0 or not qn then return true end local x7,qo=A.count(qm,qn)
if qo>=jP then return false end if x6=="Big"then return true end return#x7<A.need()*(jP-qo)end function A.status(qp,qq)
local gd=A.goal(qp)if gd<=0 or not qq then return nil end local x8,jQ=A.count(qp,qq)if jQ>=gd then return("Big %d/%d done"):format(jQ,gd)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#x8,A.need()),A.need(),jQ,gd)end function A.wear(jR)local jS={}
for Dn,x9 in ipairs(jR)do jS[tostring(x9)]=true end for Do=1,3 do local cM=l.data()if not cM then return false end
for Dp,qr in ipairs(cM.equipped or{})do if not jS[tostring(qr)]then l.call("unequip",qr)task.wait(0.3)end end
cM=l.data()local qs={}for Dq,x_ in ipairs(cM.equipped or{})do qs[tostring(x_)]=true end for Dr,qt in ipairs(jR)do
if not qs[tostring(qt)]then l.call("equip",qt)task.wait(0.3)end end task.wait(0.4)cM=l.data()local jT,qu=0,true
for Ds,ya in ipairs(cM.equipped or{})do jT=jT+1 if not jS[tostring(ya)]then qu=false end end if qu and jT==#jR then return true end
end return false end function A.saveTeam(qv,qw)if not A.wear(qw)then return false,"could not put the pets on"end
local yb=y.teams()local b_ for yc,yd in ipairs(yb)do if yd.name==qv then b_=yc break end end local cN if b_ then
cN=l.call("teamSave",b_)else cN=l.call("teamNew")if type(cN)=="table"and cN.ok and cN.index then b_=cN.index task.wait(0.3)
l.call("teamRename",{index=b_,name=qv})end end task.wait(0.4)local jU=l.data()local qx=jU and jU.teams and b_ and jU.teams[b_]
if not qx then return false,"the game did not save it"end local qy={}for Dt,ye in ipairs(qx.pets or{})do qy[tostring(ye)]=true end
for Du,yf in ipairs(qw)do if not qy[tostring(yf)]then return false,"saved, but not with these pets"end end return true
end A.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function A.quiet()
if y.placing or y.glazeSoon()then return false end local yg=l.srv()for Dv,yh in ipairs(y.list or{})do if yh.ends-yg<(d.GlazeLead or 45)+90 then return false end end
return true end function A.plan()local d4=l.data()if not d4 then return{}end local qz={}for Dw,yi in ipairs(d4 .arriving or{})do qz[tostring(yi)]=true end
local d5={}for Dx,ge in ipairs(d4 .pets or{})do if not qz[tostring(ge.id)]then d5[#d5+1]={id=tostring(ge.id),name=ge.name,variant=ge.variant or""}end
end local qA={}for Dy,qB in ipairs(d5)do qA[qB.id]=qB end local qC=tonumber(d4 .slots)or 3 local jV,qD={},{}for Dz,gf in ipairs(A.ROLES)do
local d6=d[gf[1]]if d6~=""and not qD[d6]then qD[d6]=true local jW,d7,qE={},{},false for DA,qF in ipairs(d4 .teams or{})do
if qF.name==d6 then for DB,yj in ipairs(qF.pets or{})do local jX=qA[tostring(yj)]if jX then jW[jX.id]=true d7[#d7+1]=jX else qE=true end
end end end local jY,qG=A.best(gf[2],d5,qC,jW)local qH=A.score(gf[2],d7)local qI=#jY==#d7 for DC,yk in ipairs(jY)do if not jW[yk]then qI=false end end
if not qI and(qE or#d7<math.min(qC,#d5)or qG>qH+1e-4)then jV[#jV+1]={team=d6,role=gf[2],ids=jY,gain=qG-qH}end
end end return jV end function A.rebuild(yl)local qJ=A.plan()if#qJ==0 then A.buildMsg="teams are already the best your pets allow"return true end
if not A.quiet()then A.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end y.editing,y.editingSince=true,x()
local gg=true local yp,yq=pcall(function()for DD,d8 in ipairs(qJ)do local ym,yn=A.saveTeam(d8 .team,d8 .ids)local qK=l.data()
local jZ={}for DE,yo in ipairs(d8 .ids)do for DF,j0 in ipairs(qK and qK.pets or{})do if tostring(j0 .id)==yo then jZ[#jZ+1]=l.nice(j0 .name,j0 .variant)end
end end if ym then z(("TEAM %s rebuilt (%s): %s"):format(d8 .team,yl or"pets changed",table.concat(jZ,", ")))
else gg=false z(("TEAM %s: %s"):format(d8 .team,tostring(yn)))end end end)y.editing,y.nextTry=false,0 if not yp then gg=false z("TEAM BUILD ERR "..tostring(yq))end
A.builds=A.builds+1 A.buildMsg=gg and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return gg end function A.fuseTick()if not d.AutoFuse or y.editing then return end local gh=l.data()if not gh then return end
local j1=A.need()local j2,gi={},{}for DG,yr in ipairs(gh.teams or{})do for DH,ys in ipairs(yr.pets or{})do j2[tostring(ys)]=true end end
for DI,yt in ipairs(gh.equipped or{})do gi[tostring(yt)]=true end A.failUntil=A.failUntil or{}for ca,yu in pairs(d.Pets)do
local qL=tonumber(yu.f)or 0 local j3,yv=A.count(ca,gh,true)if qL>0 and yv<qL and#j3>=j1 and x()>=(A.failUntil[ca]or 0)then
table.sort(j3,function(gj,gk)local qM=(gi[tostring(gj.id)]and 4 or 0)+(j2[tostring(gj.id)]and 2 or 0)+(gj.named and 1 or 0)
local qN=(gi[tostring(gk.id)]and 4 or 0)+(j2[tostring(gk.id)]and 2 or 0)+(gk.named and 1 or 0)if qM~=qN then return qM<qN end
return tostring(gj.id)<tostring(gk.id)end)local gl,j4={},{}for gm=1,j1 do gl[gm]=tostring(j3[gm].id)if gi[gl[gm]]then j4[#j4+1]=gl[gm]end
end y.editing,y.editingSince=true,x()for DJ,yw in ipairs(j4)do l.call("unequip",yw)task.wait(0.3)end local gn=l.call("fuse",{ids=gl})
y.editing,y.nextTry=false,0 if type(gn)=="table"and gn.ok then A.fused=A.fused+1 A.dirtyAt=x()z(("FUSED %d %s -> Big %s"):format(j1,l.nice(ca),l.nice(ca)))
A.fuseMsg=("fused a Big %s %s"):format(l.nice(ca),os.date("%H:%M"))else A.failUntil[ca]=x()+120 z(("fuse %s failed: %s"):format(l.nice(ca),type(gn)=="table"and tostring(gn.reason or"no reason given")or"no answer"))
end return end end end function A.tick()pcall(A.fuseTick)if not d.AutoBuild or not d.Teams then return end local qO=l.data()
if not qO then return end local cb={}for DK,yx in ipairs(qO.pets or{})do cb[#cb+1]=tostring(yx.id)end table.sort(cb)
cb=table.concat(cb,",")if cb~=A.sig then A.sig,A.dirtyAt=cb,x()end local yy=(A.dirtyAt and x()-A.dirtyAt>8)or x()-(A.lastBuild or 0)>900
if yy and not y.editing then local yz=A.rebuild(A.dirtyAt and"pets changed"or"check")if yz then A.dirtyAt,A.lastBuild=nil,x()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(cc)return cc:IsA("ParticleEmitter")or cc:IsA("Trail")or cc:IsA("Beam")or cc:IsA("Fire")or cc:IsA("Smoke")
or cc:IsA("Sparkles")or cc:IsA("Light")end function j.muteOne(aG)if not d.Lite or not aG.Parent then return end
local go=(aG:IsA("BillboardGui")and j.bb)or(j.isFx(aG)and j.fx)or nil if not go or go[aG]~=nil then return end
go[aG]=aG.Enabled if aG.Enabled then aG.Enabled=false end j.watch[aG]=aG:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aG.Enabled then go[aG]=true aG.Enabled=false end end)end function j.lite(qP)d.Lite=qP if qP then
task.spawn(function()for yA,yB in ipairs(as:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,yB)
if yA%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=V(as.DescendantAdded:Connect(function(j5)
if d.Lite and(j5:IsA("BillboardGui")or j.isFx(j5))then j.queue[#j.queue+1]=j5 end end))end local j6=game:GetService("Lighting")
for DL,d9 in ipairs(j6:GetChildren())do if d9:IsA("PostEffect")and d9 .Enabled and j.post[d9]==nil then j.post[d9]=true d9 .Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and j6 .GlobalShadows or j.oldShadows j6 .GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and as.Terrain.Decoration or j.oldDeco as.Terrain.Decoration=false end)
else for DM,yC in pairs(j.watch)do pcall(function()yC:Disconnect()end)end for qQ,yD in pairs(j.bb)do pcall(function()if qQ.Parent then qQ.Enabled=yD end end)end
for qR,yE in pairs(j.fx)do pcall(function()if qR.Parent then qR.Enabled=yE end end)end for qS in pairs(j.post)do pcall(function()if qS.Parent then qS.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local yF=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()yF.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()as.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(qT)d.HideHud=qT local j7=F:FindFirstChildOfClass("PlayerGui")if not j7 then return end if qT then
for DN,d_ in ipairs(j7:GetChildren())do if d_:IsA("ScreenGui")and not j.MINE[d_.Name]and d_.Enabled then j.hud[d_]=true d_.Enabled=false end
end if not j.hudConn then j.hudConn=V(j7 .ChildAdded:Connect(function(ea)if d.HideHud and ea:IsA("ScreenGui")and not j.MINE[ea.Name]then
task.defer(function()if d.HideHud and ea.Enabled then j.hud[ea]=true ea.Enabled=false end end)end end))end else
for qU in pairs(j.hud)do pcall(function()if qU.Parent then qU.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(j8)d.FpsCap=j8 local qV=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not qV then return false end return pcall(qV,j8==0 and 60 or j8)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(am)if am:IsA("BasePart")or am:IsA("Decal")or am:IsA("Texture")then if am.Transparency<1 then j.unseen[am]=am.Transparency am.Transparency=1 end
elseif am:IsA("BillboardGui")or am:IsA("SurfaceGui")or am:IsA("ParticleEmitter")or am:IsA("Beam")or am:IsA("Trail")or am:IsA("Light")or am:IsA("Fire")or am:IsA("Smoke")or am:IsA("Sparkles")then
if am.Enabled then j.unseen[am]=true am.Enabled=false end end end function j.notMine(yG)return d.HideMine or(c.plot and not yG:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(qW)if d.HideBases then j.bases(false)end d.HideMine=qW==2 if qW>0 then j.bases(true)end end
function j.bases(qX)d.HideBases=qX local j9=as:FindFirstChild("Plots")if not j9 then return end if qX then task.spawn(function()
local j_=0 for DO,qY in ipairs(j9:GetChildren())do if qY~=c.plot or d.HideMine then for DP,yH in ipairs(qY:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,yH)j_=j_+1 if j_%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=V(j9 .DescendantAdded:Connect(function(qZ)if d.HideBases and j.notMine(qZ)then task.defer(function()pcall(j.hideOne,qZ)end)end
end))end else for ka,q0 in pairs(j.unseen)do pcall(function()if not ka.Parent then return end if type(q0)=="number"then ka.Transparency=q0 else ka.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(q1)d.NoRender=q1 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not q1)end)
end function j.restoreAll()pcall(j.unpin)if d.HideBases then pcall(j.bases,false)end if E.arPaused then pcall(E.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(q2)if c.rejoining then return end z("REJOIN this server ("..q2 ..")")
pcall(e0)if c.autoload then pcall(fp,c.autoload)end no()local yI=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then dp(q2 ..", same server failed")end end)return yI end function j.tick()
local kb=j.queue if d.Lite and kb and#kb>0 then j.queue={}for yJ,yK in ipairs(kb)do pcall(j.muteOne,yK)if yJ%300==0 then task.wait()end end
end local q3=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if q3 then for DQ,yL in ipairs(q3:GetChildren())do
local q4=yL:FindFirstChild("SquishyPlaceHolder")local cd=q4 and q4:FindFirstChild("TimerGui")if cd and cd:IsA("BillboardGui")then
if j.bb[cd]==nil then pcall(j.muteOne,cd)elseif cd.Enabled then j.bb[cd]=true cd.Enabled=false end end end end
local yM,eb=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if yM and type(eb)=="number"then
j.mem=eb j.memPeak=math.max(j.memPeak,eb)if(d.MemLimit or 0)>0 and eb>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(eb,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if x()-(j.noteAt or 0)>1800 then j.noteAt=x()z(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function kc(gp)if type(gp)~="string"then return false end
gp=gp:lower()for DR,yN in ipairs(c.sellWords)do if gp:find(yN,1,true)then return true end end return false end
local function yO()local q5=aj:FindFirstChild("Remotes")local kd=q5 and q5:FindFirstChild("SellSquishy")if not(kd and kd:IsA("RemoteEvent"))then return false end
if not pcall(function()kd:FireServer()end)then return false end return ao(function()return ac()==nil end,1.5)
end local function yP()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local q6=au()local q7=q6 and q6 .HumanoidRootPart.Position local ec,q8 for DS,cO in ipairs((c.plot or as):GetDescendants())do
if cO:IsA("ProximityPrompt")and(kc(cO.ActionText)or kc(cO.ObjectText)or kc(cO.Name))then local q9=mm(cO)local ke=(q9 and q7)and(q9-q7).Magnitude or 1e9
if ke<=400 and(not ec or ke<q8)then ec,q8=cO,ke end end end c.sellSpot=ec c.noSellSpot=(ec==nil)return ec end
local function q_()local kf=ac()if not kf then c.holding=false return false end if aI(kf)then return false end
local kg=ah(aa(kf))if yO()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
z("SOLD "..kg)return true end local cP=yP()if cP then local ra=db(cP)if ra then cy(ra,cP)local rb=ac()if rb and not aI(rb)then
local yQ,yR=du(cP,function()return ac()==nil end,function()return cP.Enabled end)if yQ then c.sold,c.holding,c.sellFails=c.sold+1,false,0
z(("SOLD %s at %s via %s"):format(kg,eV(cP),yR))return true end end end end c.sellFails=c.sellFails+1 z("could not sell "..kg.." ("..c.sellFails..")")
return false end local yS={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function yT(cQ)local gq=eV(cQ):lower()for DT,yU in ipairs(yS)do if gq:find(yU,1,true)then return 0 end end
local a1,ap=cQ.Name:lower(),0 local function aR(yV,yW)return yV:find(yW,1,true)~=nil end if aR(a1,"collect")then ap=ap+60 end
if aR(a1,"cash")or aR(a1,"money")then ap=ap+45 end if aR(a1,"income")or aR(a1,"claim")then ap=ap+35 end if aR(a1,"coin")or aR(a1,"earn")or aR(a1,"green")then ap=ap+20 end
if a1=="pad"or a1=="touch"then ap=ap+25 end if ap==0 and(aR(gq,"collect")or aR(gq,"cash")or aR(gq,"money"))then ap=25 end
if ap==0 then return 0 end local ed=cQ.Color if ed.G>0.5 and ed.G>ed.R*1.4 and ed.G>ed.B*1.4 then ap=ap+15 end
if math.min(cQ.Size.X,cQ.Size.Y,cQ.Size.Z)<2 then ap=ap+5 end return ap end local function yX()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local gr,ee,kh={},nil,29 for DU,gs in ipairs(c.plot:GetDescendants())do
if gs:IsA("BasePart")then local gt=yT(gs)if gt>0 then gr[#gr+1]={s=gt,p=gs}if gt>kh then ee,kh=gs,gt end end end
end table.sort(gr,function(yY,yZ)return yY.s>yZ.s end)c.padCands,c.padPart=gr,ee if ee then z("collect pad: "..eV(ee).." (score "..kh..")")end
return ee end local ki="SAB_pad_v1.txt"local function y0(y1)if type(writefile)=="function"then pcall(writefile,ki,table.concat({y1:GetComponents()},","))end
end local function y2()if type(isfile)~="function"or type(readfile)~="function"then return nil end local y3,rc=pcall(function()if isfile(ki)then return readfile(ki)end end)
if not y3 or type(rc)~="string"then return nil end local gu={}for y4 in rc:gmatch("[^,]+")do gu[#gu+1]=tonumber(y4)end
if#gu==12 then return CFrame.new(unpack(gu))end end local function y5(kj,gv,y6)local y7=cx(kj)local kk=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aS=(kk and kk:IsA("BasePart"))and(kk.Position-gv)or Vector3 .new(1,0,0)aS=Vector3 .new(aS.X,0,aS.Z)if aS.Magnitude<0.05 then aS=Vector3 .new(1,0,0)end
aS=aS.Unit for y8=0,7 do local gw=y8*math.pi/4 local y9=Vector3 .new(aS.X*math.cos(gw)-aS.Z*math.sin(gw),0,aS.X*math.sin(gw)+aS.Z*math.cos(gw))
local gx=gv+y9*(y6+5)local kl=fy(gx.X,gv.Y,gx.Z)if kl and math.abs(kl.Y-gv.Y)<8 then aC(kj,Vector3 .new(gx.X,kl.Y+y7,gx.Z))
if it(kj,0.7)then return true end end end return false end local function y_()c.lastCollect=x()local ef=au()if not ef then return end
local rd,za=ef.HumanoidRootPart,cx(ef)local eg,re,eh,km=nil,4,nil,"?"local kn=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and kn and kn:IsA("BasePart")then eg,km=(kn.CFrame*c.manualPad).Position,"manual pad"else local bf=yX()
if bf then eg=Vector3 .new(bf.Position.X,bf.Position.Y+bf.Size.Y/2+za,bf.Position.Z)re,eh,km=math.max(bf.Size.X,bf.Size.Z)/2,bf,bf.Name
end end if not eg then z("COLLECT: pad not found - stand on it and tap SET PAD")return end local ko=a6()aC(ef,eg)
if eh and type(firetouchinterest)=="function"then pcall(firetouchinterest,rd,eh,0)end af(d.PadDwell)if eh and type(firetouchinterest)=="function"then pcall(firetouchinterest,rd,eh,1)end
af(0.5)c.collected=c.collected+1 local kp=a6()z(("COLLECTED (%s) %s"):format(km,(ko and kp and kp>ko)and("+$"..aJ(kp-ko))or"no cash change seen"))
y5(ef,eg,re)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function q.mods()if q.si and x()-q.modAt<120 then return true end
local rf=aj:FindFirstChild("Modules")if not rf then return false end local function kq(zb)local rg=rf:FindFirstChild(zb)
if not rg then return nil end local zc,rh=pcall(require,rg)return(zc and type(rh)=="table")and rh or nil end q.si,q.arm,q.ci=kq("SquishyInfo"),kq("AutoRollRules"),kq("CrateInfo")
q.modAt=x()if not q.si then return false end local kr={}if q.arm and type(q.arm.tierOf)=="table"then for ks in pairs(q.arm.tierOf)do
local gy=q.si[ks]if type(gy)=="table"and gy.rarity~="Limited"and not gy.incomeType and not gy.hiddenAfter then kr[aa(ks)]=ks end
end end q.roll=kr local gz={}for zd,ze in pairs(kr)do local ei=q.si[ze]if type(ei)=="table"and type(ei.income)=="number"and not ei.incomeType then
gz[#gz+1]={k=zd,inc=ei.income,pr=tonumber(ei.price)or 0}end end table.sort(gz,function(kt,ku)if kt.inc~=ku.inc then return kt.inc>ku.inc end return kt.pr>ku.pr end)
q.order=gz local gA,kv,kw local zf=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for zg,kx in pairs(zf)do
local ky=type(kx)=="table"and tonumber(kx.price)if ky and(not kv or ky>kv)then gA,kv,kw=zg,ky,kx.title end end
q.bestCrate,q.bestCrateName=gA and L.key(gA),gA q.bestCrateTitle=kw and L.key(kw)or nil return true end function q.rank(zh)
local zi,zj=pcall(function()return q.arm.rankOf(zh)end)return(zi and tonumber(zj))or 0 end function q.loadDisc(ri)
if type(ri)~="table"then return end local rj={}for zk,zl in pairs(ri)do if zl then rj[aa(tostring(zk))]=true end end
q.disc,q.discAt=rj,x()end function q.fetch()q.discAt=x()local rk=aj:FindFirstChild("Remotes")local rl=rk and rk:FindFirstChild("GetSquishiesDiscovered")
if not rl then return end local zm,zn=pcall(function()return rl:InvokeServer()end)if zm then q.loadDisc(zn)end
end function q.scanWax()local kz={}local rm=c.plot and c.plot:FindFirstChild("WaxStations")if rm then for DV,rn in ipairs(rm:GetChildren())do
local ro=rn:FindFirstChild("SquishyPlaceHolder")if ro and rn:GetAttribute("HasSquishy")then for DW,rp in ipairs(ro:GetChildren())do if rp:IsA("Model")then kz[aa(rp.Name)]=true end end
end end end for rq,zo in pairs(q.placedAt)do if x()-zo<20 then kz[rq]=true else q.placedAt[rq]=nil end end q.waxing=kz
end function q.compute()local rr,kA,kB={},0,0 if q.disc then for kC in pairs(q.roll or{})do if not q.disc[kC]then
if q.waxing[kC]then kB=kB+1 else rr[kC],kA=true,kA+1 end end end end q.need,q.nNeed,q.nWax=rr,kA,kB local rs,kD={},d.Best or 0
local kE=(kD==4)and q.stackMin or nil for zp,rt in ipairs(q.order)do if(kE and rt.inc>kE)or(not kE and zp<=(kD==4 and 1 or kD))then rs[rt.k]=true end
end q.best=rs end function q.readStack()q.stackAt=x()local ru=aj:FindFirstChild("Remotes")local rv=ru and ru:FindFirstChild("EditStack")
if not rv then return end local zq,cR=pcall(function()return rv:InvokeServer("State",nil)end)if not(zq and type(cR)=="table"and type(cR.state)=="table"and type(cR.state.entries)=="table")then return end
local gB for DX,rw in ipairs(cR.state.entries)do local ej=type(rw)=="table"and q.si and q.si[tostring(rw.name)]
if type(ej)=="table"and type(ej.income)=="number"and not ej.incomeType and(not gB or ej.income<gB)then gB=ej.income end
end q.stackMin=gB q.stackFull=#cR.state.entries>=(tonumber(cR.state.capacity)or 100)end function q.want(kF)if(d.Best or 0)>0 and(next(q.best)or(d.Best==4 and q.stackMin))then
if q.best[kF]then return true end elseif d.Targets[kF]then return true end return d.AutoIndex==true and q.need[kF]==true
end function q.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(q.best)~=nil)or(d.AutoIndex and next(q.need)~=nil)
or d.Best==4 end function q.placed(zr)local ek=aa(zr)q.placedAt[ek],q.waxing[ek]=x(),true if q.need[ek]then q.need[ek],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
z(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ah(ek)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local el,em={},{}for zs,zt in pairs(q.roll or{})do if q.want(zs)then el[zt]=true end end
for rx,kG in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(rx)or(type(kG)=="table"and type(kG.title)=="string"and L.wanted(kG.title))then em[rx]=true end
end if not next(el)and not next(em)then return nil end if q.arm and type(q.arm.encode)=="function"then local zu,ry=pcall(q.arm.encode,{rarities={},butters=el,crates=em,index=false})
if zu and type(ry)=="string"then return ry end end local function rz(zv)local gC={}for zw in pairs(zv)do gC[#gC+1]=zw end table.sort(gC)return table.concat(gC,",")end
local en="adv:"if next(el)then en=en..";butters:"..rz(el)end if next(em)then en=en..";crates:"..rz(em)end return en
end function q.canon(zx)local gD={}for rA in tostring(zx or""):gmatch("[^;]+")do local kH,rB=rA:match("^(%a+):(.*)$")
if not kH then kH,rB="r",rA:gsub("^adv:","")end for zy in rB:gmatch("[^,]+")do gD[#gD+1]=kH.."="..zy end end table.sort(gD)
return table.concat(gD,"|")end function q.sync(zz)if F:GetAttribute("AutoRoll")~=true then return end if x()<(q.pauseUntil or 0)then return end
local ce=q.rulesNow()if not ce or#ce>1900 then return end if q.canon(F:GetAttribute("AutoRollRules"))==q.canon(ce)then q.fails=0 return end
if not zz and x()-q.sentAt<4 then return end local rC=aj:FindFirstChild("Remotes")local rD=rC and rC:FindFirstChild("AutoRollAction")
if not rD then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,x()+300 z("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=x()C.replaying=true pcall(function()rD:FireServer("Rules",ce)end)C.replaying=false d.ARrules=ce
local gE,gF=0,0 for DY in(ce:match("butters:([^;]*)")or""):gmatch("[^,]+")do gE=gE+1 end for DZ in(ce:match("crates:([^;]*)")or""):gmatch("[^,]+")do gF=gF+1 end
local rE=gE.."/"..gF if q.told~=rE then q.told=rE z(("auto roll now stops on %d butters and %d crates"):format(gE,gF))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if x()-q.discAt>30 then q.fetch()end
q.scanWax()if d.Best==4 and x()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aL={}if d.AutoIndex then aL[#aL+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if d.Best==4 then local eo=0 for D0 in pairs(q.best)do eo=eo+1 end
aL[#aL+1]=eo==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(eo,eo==1 and""or"s")
elseif(d.Best or 0)>0 and q.order[1]then aL[#aL+1]="best: "..ah(q.order[1].k)end if d.BestCrate and q.bestCrateName then aL[#aL+1]="crate: "..q.bestCrateName end
if Q.got>0 then aL[#aL+1]="shower: "..Q.got end q.msg=#aL>0 and table.concat(aL," | ")or"index / best: off"end
q.heard={}function q.admin(zA,aT,gG)if zA~="Effect"then return end if aT=="Shower"then Q.add(gG)return end if aT=="ShowerTaken"then Q.gone(gG)return end
if aT=="ShowerClear"then Q.drops={}return end if aT=="WaxGlow"then local kI=type(gG)=="table"and tonumber(gG.SnapAt)
if kI then q.snapAt=kI z(("ADMIN: every wax finishes in %ds%s"):format(math.floor(kI-l.srv()),(d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end aT=tostring(aT)bT("Admin "..aT)if aT~="GoalPoint"and x()-(q.heard[aT]or-100)>30 then q.heard[aT]=x()
z("ADMIN: "..aT)end end Q.drops,Q.tried,Q.got,Q.miss={},{},0,0 function Q.add(kJ)if type(kJ)~="table"or type(kJ.Pieces)~="table"then return end
for D1,aU in pairs(kJ.Pieces)do if type(aU)=="table"and aU.Id~=nil and aU.Position~=nil then Q.drops[aU.Id]={id=aU.Id,butter=tostring(aU.Butter or"?"),rar=tostring(aU.Rarity or"?"),star=aU.Star==true,
pos=aU.Position,opens=tonumber(aU.OpensAt)or 0,ends=tonumber(aU.ExpiresAt)or 0}end end end function Q.gone(ep)
if type(ep)~="table"or ep.Id==nil then return end Q.drops[ep.Id]=nil if tonumber(ep.UserId)==l.uid then Q.mine=ep.Id end
end function Q.pick()local kK=l.srv()local kL,rF for rG,cf in pairs(Q.drops)do if kK>=cf.ends-0.3 then Q.drops[rG]=nil
elseif kK>=cf.opens-0.2 and(Q.tried[rG]or 0)<3 then local rH=(aI(cf.butter)and 1e6 or 0)+(cf.star and 1e5 or 0)+q.rank(cf.rar)*100-(cf.ends-kK)
if not kL or rH>rF then kL,rF=cf,rH end end end return kL end function Q.due()return d.Shower and c.running and next(Q.drops)~=nil and not ac()and Q.pick()~=nil
end function Q.grab()local aM,kM=Q.pick(),au()if not(aM and kM)then return end Q.tried[aM.id]=(Q.tried[aM.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aC(kM,aM.pos+Vector3 .new(0,cx(kM)+0.5,0))ao(function()return Q.mine==aM.id or ac()~=nil or not Q.drops[aM.id]end,1.5)
if Q.mine==aM.id or ac()then Q.got,Q.drops[aM.id]=Q.got+1,nil z(("GRABBED %s [%s]%s from the admin shower"):format(ah(aa(aM.butter)),aM.rar,aM.star and" (star)"or""))
elseif not Q.drops[aM.id]then Q.miss=Q.miss+1 end end local eq local function rI()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 z("trying again after being stopped for 5 minutes")eq(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not au()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bo(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local kN,rJ=eX()
local gH=ac()if gH then local cS=ah(aa(gH))if not aI(gH)then local kO=(W.gift and aa(W.gift)==aa(gH)and x()-W.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cS,kO),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cS,kO),"bad"end return"sell",("selling %s (%s)"):format(cS,kO),"warn"
end if kN<1 then return nil,("holding %s - 0 free stations"):format(cS),"wait"end if y.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cS),"wait"end
return"place",("waxing %s (%d free)"):format(cS,kN),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local kP=c.plot:FindFirstChild("CrateStand")if kP then for D2,er in ipairs(kP:GetDescendants())do
if er:IsA("ProximityPrompt")and er.Enabled and iJ(er)then local bh=er.ObjectText if bh==""then bh=cq(kP,"TitleLabel")or""end
if bh~=""and L.wanted(bh)then local zB=eT(bh):gsub("crate$","")local rK for rL in pairs(ad.members)do if eT(rL)==zB then rK=rL end end
e.waiting,e.at,e.title,e.prompt=true,x(),bh,er e.data={name=(bh:gsub("%s","")),rarity=rK,title=bh}z(bh.." found waiting on your stand")
end break end end end end local rM=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and rM then
local bi=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(bi),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 z("could not press the "..bi.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(bi),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(bi),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
bi,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(bi),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(bi),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(bi),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(bi,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not rM then local rN=e.title..tostring(e.rolledAt)if e.told~=rN then e.told=rN z(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if kN<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(rJ,rJ),"wait"
end local kQ=mA()if not kQ then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local es=bS()
if es and nY(es.name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(es.name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(es.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(es.name),"ok"
end local bC=ir()if bC.state~="match"then c.matchSince=nil if bC.state=="skip"and not kQ.Enabled then return nil,bC.text.." (sold out)","idle"end
return nil,bC.text,bC.level end if not kQ.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local et=x()if et<c.noCashUntil then local rO,zC=nx()if rO then return nil,("cash short: have $%s, price ~$%s"):format(aJ(rO),aJ(zC)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aJ(a6()),math.ceil(c.noCashUntil-et)),"bad"end if et-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or et local rP=et-c.matchSince if rP<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bC.shown,rP),"ok"end
return"buy",("buying %s via %s"):format(bC.shown,bC.src),"ok"end j.DEPTH=11 function j.pinTick()local rQ=j.hold
if not rQ then return end local kR=F.Character local kS=kR and kR:FindFirstChild("HumanoidRootPart")if not kS then return end
kS.CFrame=rQ kS.AssemblyLinearVelocity=Vector3 .new(0,0,0)for D3,gI in ipairs(kR:GetChildren())do if gI:IsA("BasePart")and gI.CanCollide then j.noclip[gI]=true gI.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(zD,rR)j.hold=zD if rR then j.surface=rR end end function j.unpin(zE)
if not j.hold then return end j.hold=nil for rS in pairs(j.noclip)do pcall(function()if rS.Parent then rS.CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local rT=au()if rT and j.surface and not zE then aC(rT,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bj,rU=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),au()
if not(bj and bj:IsA("BasePart")and rU)then return nil end local rV=mp()or bj.Position local gJ=Vector3 .new(rV.X-bj.Position.X,0,rV.Z-bj.Position.Z)
gJ=gJ.Magnitude>0.1 and gJ.Unit or Vector3 .new(0,0,1)local gK=bj.Position+gJ*6 local rW=fy(gK.X,bj.Position.Y,gK.Z,{bj})
return CFrame.new(gK.X,(rW and rW.Y or bj.Position.Y)+cx(rU),gK.Z)end function j.ground(zF,rX,zG)local kT,kU={F.Character},nil
for D4=1,12 do local kV=RaycastParams.new()kV.FilterType=Enum.RaycastFilterType.Exclude kV.FilterDescendantsInstances=kT
local gL=as:Raycast(Vector3 .new(zF,rX,zG),Vector3 .new(0,-2000,0),kV)if not gL then break end kU,rX=gL,gL.Position.Y-0.05
kT[#kT+1]=gL.Instance end return kU and kU.Position.Y end function j.parkHome()local kW=j.home()if not kW then return false end
local cT=kW.Position local zH=j.ground(cT.X,cT.Y+300,cT.Z)or(cT.Y-3)j.pin(CFrame.new(cT.X,zH-8,cT.Z),kW)return true
end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function j.setGhost(gM)d.Ghost,d.GhostHelps=gM==2,gM==1 if gM<2 then task.spawn(function()while c.busy do af(0.1)end
if j.ghostMode()<2 and j.hold and not D.home then pcall(j.unpin)end end)end j.paintGhost()z("ghost: "..j.GHOST[gM][1]:sub(8):lower())
end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end
local zI=au()if not zI or J.seat()then return end j.parkHome()end J.n,J.fails,J.nextAt,J.msg,J.lost=0,0,0,"no campfire right now",0
function J.seat()local rY=F.Character local rZ=rY and rY:FindFirstChildOfClass("Humanoid")local kX=rZ and rZ.SeatPart
return(kX and kX.Name=="LogSeat")and kX or nil end function J.due()if not(d.Campfire and c.running)or x()<J.nextAt then return false end
local zJ=as:FindFirstChild("NightSeats")if not zJ then if J.wasOn then J.wasOn,J.fails,J.lost=false,0,0 end J.msg="no campfire (comes with weather events)"
return false end J.wasOn=true if J.seat()then J.sitAt=J.sitAt or x()J.msg=("sitting at the campfire: +%s%% cash"):format(tostring(F:GetAttribute("CampfireBoost")or"?"))
return false end if J.sitAt then J.lost,J.sitAt=J.lost+1,nil if J.lost>=4 then J.nextAt,J.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
z(J.msg)return false end end return true end function J.sit()local r0,gN=as:FindFirstChild("NightSeats"),au()
if not r0 or not gN then return end local r1,cU=gN.HumanoidRootPart.Position,{}for D5,gO in ipairs(r0:GetChildren())do
local r2=gO:IsA("Seat")and gO.Occupant==nil and gO:FindFirstChildOfClass("ProximityPrompt")if r2 then cU[#cU+1]={st=gO,p=r2}end
end if#cU==0 then J.nextAt,J.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cU,function(zK,zL)return(zK.st.Position-r1).Magnitude<(zL.st.Position-r1).Magnitude end)
local zM,zN=cU[1].st,cU[1].p j.unpin(true)local cV=zM.CFrame aC(gN,cV.Position+cV.LookVector*2+Vector3 .new(0,2.5,0),cV.Position)
af(0.25)local zO=du(zN,function()return J.seat()~=nil end)if not zO then aC(gN,cV.Position+Vector3 .new(0,2,0),cV.Position+cV.LookVector)
ao(function()return J.seat()~=nil end,1.5)end if J.seat()then J.n,J.fails,J.sitAt=J.n+1,0,x()z(("SAT at the campfire (+%s%% cash)"):format(tostring(F:GetAttribute("CampfireBoost")or"?")))
else J.fails=J.fails+1 J.nextAt=x()+(J.fails>=3 and 60 or 5)J.msg="could not sit at the campfire"..(J.fails>=3 and" - trying again in a minute"or"")
if J.fails<=3 then z(J.msg)end end end E.msg,E.nextAt,E.at,E.pulls,E.claims,E.pullLeft,E.collectLeft,E.events="",0,0,0,0,0,0,{}
function E.refresh()E.at=x()local kY=aj:FindFirstChild("Remotes")if not kY then return end local eu,kZ,cW=0,0,{}
local zP,r3=pcall(function()return kY.ClanRequest:InvokeServer("state")end)local r4=zP and type(r3)=="table"and r3 .tasks
for D6,bD in ipairs(r4 and r4 .list or{})do if not bD.done and bD.kind=="pull"then eu=math.max(eu,(bD.goal or 0)-(bD.progress or 0))end
if not bD.done then cW[#cW+1]=("%s %d/%d"):format(tostring(bD.text),bD.progress or 0,bD.goal or 0)end end E.events={}
for D7,cX in ipairs(kY:GetChildren())do if cX:IsA("RemoteFunction")and cX.Name:match("^%u%a+Action$")and cX.Name~="CrateAction"and cX.Name~="AutoRollAction"then
local zQ,ev=pcall(function()return cX:InvokeServer("state")end)if zQ and type(ev)=="table"and ev.live==true and type(ev.quests)=="table"then
E.events[#E.events+1]={r=cX,st=ev}for D8,aN in ipairs(ev.quests)do if not aN.done and aN.kind=="pull"then eu=math.max(eu,(aN.goal or 0)-(aN.progress or 0))end
if not aN.done and aN.kind=="collect"then kZ=math.max(kZ,(aN.goal or 0)-(aN.progress or 0))end if not aN.done then cW[#cW+1]=("%s %d/%d"):format(tostring(aN.text),aN.progress or 0,aN.goal or 0)end
end end end end E.pullLeft,E.collectLeft=eu,kZ E.msg=#cW>0 and("open: "..table.concat(cW,", "))or"all quests done for today"
end function E.claim()for D9,ew in ipairs(E.events)do local r5=ew.r.Name:gsub("Action$","")for D_,cY in ipairs(ew.st.quests)do
if cY.done and not cY.claimed then local zR,r6=pcall(function()return ew.r:InvokeServer("claimQuest",cY.id)end)
if zR and not(type(r6)=="table"and r6 .ok==false)then E.claims=E.claims+1 z(("CLAIMED %s quest: %s (+%s)"):format(r5,tostring(cY.text),tostring(cY.points or cY.treats or"?")))
end af(0.4)end end if ew.st.bonusReady==true then local zS=pcall(function()return ew.r:InvokeServer("claimBonus")end)
if zS then z(("CLAIMED %s daily quest bonus"):format(r5))end af(0.4)end end end function E.tick()if not(d.Quests and c.running)then
if E.arPaused then E.resume("quests switched off")end return end if x()-E.at<(E.pullLeft>0 and 20 or 90)then return end
E.refresh()pcall(E.claim)if E.pullLeft<=0 and E.arPaused then E.resume("lever quests done")end end function E.pullDue()
return d.Quests and c.running and E.pullLeft>0 and x()>=E.nextAt and not C.busy end function E.lever()local r7=c.plot and c.plot:FindFirstChild("Lever")
local k0=r7 and r7:FindFirstChild("Wheel")return k0 and k0:FindFirstChildWhichIsA("ProximityPrompt"),k0 end function E.resume(zT)
E.arPaused=false if E.arWas then E.arWas=false d.AutoRoll=true task.spawn(C.apply,zT)end end function E.pull()
local gP,k1=E.lever()if not gP or not k1 or not k1:IsA("BasePart")then E.nextAt,E.msg=x()+300,"your lever was not found"return end
if not E.arPaused then E.arPaused=true E.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false C.apply("pulling the lever for a quest",true)
if C.isOn()then E.nextAt=x()+30 return end end z(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(E.pullLeft))
end if not gP.Enabled then E.nextAt=x()+1 return end cy(k1,gP)E.asked=nil nM(gP)E.pulls=E.pulls+1 E.pullLeft=E.pullLeft-1
af(0.6)if E.asked then E.nextAt=x()+600 z(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(E.asked)))
E.resume("a butter the game wants kept is on the pad")return end E.nextAt=x()+2.5 if E.pullLeft<=0 then E.at=0 end
end D.skip,D.skipN,D.n,D.calls,D.fails,D.nextAt,D.msg,D.tries={},0,0,0,0,0,"off",{}function D.can(bE,zU)local k2=bE:GetAttribute("PourOwner")
if type(k2)~="number"or k2==l.uid or not bE:GetAttribute("HasSquishy")then return false end if bE:GetAttribute("PourLong")~=true or bE:GetAttribute("PourFull")==true then return false end
local k3=bE:GetAttribute("PourId")if k3==nil or D.skip[k3]then return false end local r8,k4,zV=bE:GetAttribute("Helpers"),0,tostring(l.uid)
if type(r8)=="string"then for zW in r8:gmatch("[^,%s]+")do k4=k4+1 if zW==zV then return false end end end if k4>=6 then return false end
local gQ=y.left(bE)if not gQ then local r9=tonumber(bE:GetAttribute("PourEnd"))gQ=r9 and(r9-zU)end if not gQ or gQ<=75 then return false end
local k5=game:GetService("Players"):GetPlayerByUserId(k2)if not k5 or k5:GetAttribute("WaxHelpOff")==true then return false end
return true,k5,k3 end function D.list()local k6,zX={},l.srv()local r_=as:FindFirstChild("Plots")for Ea,sa in ipairs(r_ and r_:GetChildren()or{})do
local sb=sa~=c.plot and sa:FindFirstChild("WaxStations")for Eb,k7 in ipairs(sb and sb:GetChildren()or{})do local zY,zZ,z0=D.can(k7,zX)
local k8=zY and k7:FindFirstChild("SquishyPlaceHolder")if k8 and k8:IsA("BasePart")then k6[#k6+1]={st=k7,p=zZ,id=z0,part=k8}end
end end return k6 end function D.due()return d.Help and c.running and x()>=D.nextAt end function D.skipIt(sc,sd)
D.skip[sc],D.skipN=sd,D.skipN+1 if D.skipN>600 then D.skip,D.skipN,D.tries={[sc]=sd},1,{}end end function D.goHome()
local gR,bF=au(),D.home D.home=nil if not(gR and bF)then return end if d.Ghost and not J.seat()then j.unpin(true)
if not j.parkHome()then pcall(aC,gR,bF.Position,bF.Position+bF.LookVector)end elseif j.hold or(gR.HumanoidRootPart.Position-bF.Position).Magnitude>20 then
j.unpin(true)pcall(aC,gR,bF.Position,bF.Position+bF.LookVector)end end function D.step()local k9,ex=D.list(),au()
if#k9==0 or not ex then D.nextAt=x()+15 D.msg=("helped %d waxes here%s | none to help right now"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")
D.goHome()return end local se=ex.HumanoidRootPart local sf=se.Position table.sort(k9,function(z1,z2)return(z1 .part.Position-sf).Magnitude<(z2 .part.Position-sf).Magnitude end)
local aV=k9[1]D.home=D.home or(j.hold and j.surface)or se.CFrame local bG=aV.part local ey=(bG.Position+aV.st:GetPivot().Position)/2
local gS=D.tries[aV.id]or 0 if(d.Ghost or d.GhostHelps)and gS==0 and not J.seat()then j.pin(bG.CFrame,D.home)
else j.unpin(true)local k_=gS==0 and fy(ey.X,bG.Position.Y,ey.Z,{bG})if k_ and math.abs(k_.Y-bG.Position.Y)<8 then
aC(ex,Vector3 .new(ey.X,k_.Y+cx(ex),ey.Z),bG.Position)else aC(ex,bG.Position+Vector3 .new(0,bG.Size.Y/2+3,0),ey)
end end af(0.3)local ez=aj:FindFirstChild("Remotes")ez=ez and ez:FindFirstChild("ClanRequest")if not ez then D.nextAt,D.msg=x()+60,"the game's help remote is missing"return end
local gT,bk=pcall(function()return ez:InvokeServer("help",aV.st:GetAttribute("PourOwner"),tonumber(aV.st.Name))end)
if gT and type(bk)=="table"and bk.ok then D.n,D.fails=D.n+1,0 D.skipIt(aV.id,"helped")z(("HELPED %s's wax (station %s)"):format(aV.p.DisplayName,aV.st.Name))
D.msg=("helped %d waxes here%s"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")elseif gT and type(bk)=="table"and tostring(bk.reason or""):lower():find("walk up",1,true)and gS<2 then
D.tries[aV.id]=gS+1 D.nextAt=x()+0.3 elseif gT and type(bk)=="table"and tostring(bk.reason or""):lower():find("moment",1,true)then
D.waits=(D.waits or 0)+1 D.nextAt=x()+1.6 else local sh=(gT and type(bk)=="table"and tostring(bk.reason or"refused"))or("error: "..tostring(bk))
D.skipIt(aV.id,sh)D.fails=D.fails+1 if D.fails<=3 then z(("help refused for %s's wax: %s"):format(aV.p.DisplayName,sh))end
if D.fails>=5 then D.fails,D.nextAt,D.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
D.goHome()end end D.nextAt=math.max(D.nextAt,x()+1.2)end function D.onCall(bl)if not d.HelpGuild or type(bl)~="table"or bl.p~="help"or bl.mine or bl.u==l.uid or not bl.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eA=aj:FindFirstChild("Remotes")
eA=eA and eA:FindFirstChild("ClanRequest")if not eA then return end local sj,eB=pcall(function()return eA:InvokeServer("callHelp",bl.u)end)
local sk=tostring(bl.n or bl.un or bl.u)if sj and type(eB)=="table"and eB.ok then D.calls=D.calls+1 z(("HELPED guildmate %s's wax from here (their call)"):format(sk))
else z(("guild call from %s: %s"):format(sk,(sj and type(eB)=="table"and tostring(eB.reason or"refused"))or tostring(eB)))
end end)end local function aq(z3,sl,...)if c.busy then return end c.busy,c.busyText=true,z3 if j.hold and sl~=D.step then pcall(j.unpin)end
local z4,sm=pcall(sl,...)c.busy,c.busyText=false,""if not z4 and sm~=hB then z("ERR "..tostring(sm))end end local function z5()
local aW,z6,z7=rI()c.reason,c.level=z6,z7 if aW=="place"then aq("waxing...",y.place)elseif aW=="crate"then aq("opening crate...",fK,true)
elseif aW=="cratesmart"then aq("opening crate...",e.smart)elseif aW=="cratewin"then aq("opening the crate window...",iL)
elseif aW=="nocrate"then aq("discarding crate...",fK,false)elseif aW=="sell"then aq("selling...",q_)elseif aW=="buy"then aq("buying...",nP,false)
elseif not aW and not c.matchSince and Q.due()then aq("grabbing a butter from the admin shower...",Q.grab)elseif not aW and not c.matchSince and J.due()then
aq("sitting at the campfire...",J.sit)elseif not aW and not c.matchSince and E.pullDue()and not ac()and not(bS()and aI(bS().name))then
aq("pulling the lever for a quest...",E.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(E.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
aq("collecting money...",y_)elseif not aW and not c.matchSince and D.due()then aq("helping a wax...",D.step)elseif D.home and not d.Help then
aq("coming back...",D.goHome)elseif not c.busy then j.parkTick()end end function eq(gU,z8)if gU==c.running then return end
c.running=gU if not z8 then d.AutoStart=gU end if gU then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bo()or c.plot
z("START")else c.reason="stopped"z("STOP")end end do local bH=fj(al.auto)if type(bH)=="string"then bH=bH:gsub("%s+$","")
if bH~=""then c.autoload=bH local z9=nk(bH)z(z9 and("loaded config "..bH)or("config "..bH.." could not be loaded"))
end end end local o={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local z_={ok=o.good,wait=o.warn,warn=o.warn,bad=o.bad,idle=o.dim}local sn={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function O(Aa,Ab,Ac)local Ad,la=pcall(Instance.new,Aa)
if not Ad then c.uiErrs=c.uiErrs+1 return nil end for Ae,Af in pairs(Ab)do if not pcall(function()la[Ae]=Af end)then c.uiErrs=c.uiErrs+1 end
end la.Parent=Ac return la end local function an(Ag,Ah)O("UICorner",{CornerRadius=UDim.new(0,Ah or 6)},Ag)end
local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"})}function a.put(gV,lb)if gV and a.shown[gV]~=lb then a.shown[gV]=lb gV.Text=lb end
end local lc=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local so=lc:FindFirstChild("SABFarmGui")
if so then so:Destroy()end local ld=O("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},lc)
local ak={w=320,h=300,head=28,strip=34,tabs=24}pcall(function()local gW=as.CurrentCamera.ViewportSize if gW.X>100 and gW.Y>100 then
ak.w=math.clamp(math.floor(gW.X*0.44),300,360)ak.h=math.clamp(math.floor(gW.Y*0.84),240,340)end end)a.root=O("Frame",{Name="Root",Size=UDim2 .new(0,ak.w,0,ak.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=o.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},ld)
an(a.root,10)O("UIStroke",{Color=o.line,Thickness=1},a.root)local a2=UDim2 .new(1,0,1,0)local function K(sp,sq)return UDim2 .new(sp,0,0,0),UDim2 .new(sq,(sp+sq>0.99)and 0 or-4,1,0)end
local function H(Ai,Aj,Ak,Al,Am,An)local sr=O("TextButton",{Text=Aj,Position=Am,Size=An,BackgroundColor3=Ak,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=Al,TextColor3=o.text,AutoButtonColor=true},Ai)an(sr,6)return sr end local function gX(Ao,Ap,Aq,Ar,As)
local le=O("TextBox",{Text=Ap,PlaceholderText=Aq,Position=Ar,Size=As,BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=o.text,PlaceholderColor3=o.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Ao)an(le,6)O("UIPadding",{PaddingLeft=UDim.new(0,8)},le)
return le end local gY=as.CurrentCamera local function At()local Au,gZ=pcall(function()return gY and gY.ViewportSize end)
if Au and gZ and gZ.X>50 and gZ.Y>50 then return gZ end end local function bI(eC)local lf=At()if not(lf and eC and eC.Parent)then return end
local Av=pcall(function()local g0,ss=eC.AbsolutePosition,eC.AbsoluteSize local lg=70 local su=math.clamp(g0 .X,lg-ss.X,lf.X-lg)
local sv=math.clamp(g0 .Y,0,lf.Y-math.min(ss.Y,lg))if math.abs(su-g0 .X)>0.5 or math.abs(sv-g0 .Y)>0.5 then eC.Position=UDim2 .new(0,math.floor(su),0,math.floor(sv))
end end)return Av end local function g1(Aw)local Ax,lh=pcall(function()return Aw.AbsolutePosition end)if Ax and lh then return{math.floor(lh.X),math.floor(lh.Y)}end
end local cZ={}c.dragMoved={}local function sw(eD,sx,li)V(eD.InputBegan:Connect(function(c0)if c0 .UserInputType~=Enum.UserInputType.MouseButton1 and c0 .UserInputType~=Enum.UserInputType.Touch then return end
local lj={start=c0 .Position,from=sx.Position,moved=0,target=sx,input=c0,onDrop=li}cZ[eD],c.dragMoved[eD]=lj,0
local lk lk=c0 .Changed:Connect(function()if c0 .UserInputState==Enum.UserInputState.End and cZ[eD]==lj then cZ[eD]=nil
if lk then lk:Disconnect()end if li then li(lj.moved)end end end)end))end V(l8 .InputChanged:Connect(function(g2)
if g2 .UserInputType~=Enum.UserInputType.MouseMovement and g2 .UserInputType~=Enum.UserInputType.Touch then return end
for Ay,a3 in pairs(cZ)do local ll=a3 .target if ll and ll.Parent then local sy,sz=g2 .Position.X-a3 .start.X,g2 .Position.Y-a3 .start.Y
a3 .moved=math.max(a3 .moved,math.abs(sy)+math.abs(sz))c.dragMoved[Ay]=a3 .moved ll.Position=UDim2 .new(a3 .from.X.Scale,a3 .from.X.Offset+sy,a3 .from.Y.Scale,a3 .from.Y.Offset+sz)
end end end))V(l8 .InputEnded:Connect(function(g3)if g3 .UserInputType~=Enum.UserInputType.MouseButton1 and g3 .UserInputType~=Enum.UserInputType.Touch then return end
for Az,g4 in pairs(cZ)do if g4 .input==g3 or g3 .UserInputType==Enum.UserInputType.MouseButton1 then cZ[Az]=nil
if g4 .onDrop then g4 .onDrop(g4 .moved)end end end end))local function T(AA,AB,AC,AD,AE,AF,AG)return O("TextLabel",{Text=AB,Position=AF or UDim2 .new(0,0,0,0),Size=AG or a2,BackgroundTransparency=1,
Font=AE and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=AC,TextColor3=AD,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},AA)
end a.title=O("Frame",{Size=UDim2 .new(1,0,0,ak.head),BackgroundColor3=o.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=O("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=o.dim,BorderSizePixel=0},a.title)
an(a.dot,5)T(a.title,"SAB  BUTTER FARM  "..cl,12,o.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=H(a.title,"-",o.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=H(a.title,"X",o.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=O("Frame",{Position=UDim2 .new(0,0,0,ak.head),Size=UDim2 .new(1,0,0,ak.strip),BackgroundColor3=o.bg,BorderSizePixel=0},a.root)
a.bar=O("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=o.warn,BorderSizePixel=0},a.strip)
an(a.bar,2)a.reason=T(a.strip,"starting",12,o.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=O("Frame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip),Size=UDim2 .new(1,0,0,ak.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=H(a.tabs,"FARM",o.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=H(a.tabs,"BUTTERS",o.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=H(a.tabs,"CRATES",o.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=H(a.tabs,"PETS",o.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=H(a.tabs,"TEAMS",o.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=H(a.tabs,"SETUP",o.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function c1()local lm=O("ScrollingFrame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip+ak.tabs),Size=UDim2 .new(1,0,1,-(ak.head+ak.strip+ak.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=o.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
O("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},lm)O("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},lm)
return lm end a.farm,a.but,a.set,a.crt=c1(),c1(),c1(),c1()a.pet,a.team=c1(),c1()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local g5,eE,M=0,12,nil local function a4(sA,AH)g5,eE=g5+1,eE+sA+6 return O("Frame",{Size=UDim2 .new(1,0,0,sA),BackgroundTransparency=1,LayoutOrder=g5},AH or a.farm)
end local function sB(AI)T(a4(14),AI,10,o.dim,true)end M=a4(32)a.startB=H(M,"START",o.good,14,K(0,0.68))a.killB=H(M,"KILL",o.bad,14,K(0.68,0.32))
do local AJ=a4(40)local function eF(sC,AK,ln)local lo=O("Frame",{Position=UDim2 .new((sC-1)/ln,0,0,0),Size=UDim2 .new(1/ln,sC<ln and-4 or 0,1,0),
BackgroundColor3=o.panel,BorderSizePixel=0},AJ)an(lo,6)local sD=T(lo,"0",14,o.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,20))
local AL=T(lo,AK,9,o.dim,false,UDim2 .new(0,0,0,23),UDim2 .new(1,0,0,13))sD.TextXAlignment,AL.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return sD end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=eF(1,"BOUGHT",5),eF(2,"WAXED",5),eF(3,"SOLD",5),eF(4,"MONEY",5),eF(5,"FREE",5)
end a.info=T(a4(40),"",10,o.dim,false)a.tgt=T(a4(16),"",10,o.good,false)sB("SWITCHES")do local function c2(AM,AN)
local sE=a4(26)return H(sE,AM,o.panel2,10,K(0,0.5)),H(sE,AN,o.panel2,10,K(0.5,0.5))end a.colT,a.sellT=c2("COLLECT: ON","SELL THEM: ON")
a.crateT,a.arT=c2("OPEN CRATES: ON","AUTO ROLL: OFF")a.helpT,a.helpGT=c2("HELP WAXES: OFF","GUILD CALLS: OFF")
a.campT,a.ghostT=c2("CAMPFIRE: OFF","GHOST: OFF")a.ixT,a.bestT=c2("AUTO INDEX: OFF","BEST BUTTER: OFF")a.bcT,a.shT=c2("BEST CRATE: OFF","GRAB SHOWER: ON")
M=a4(26)a.questT=H(M,"QUESTS: OFF",o.panel2,10,K(0,0.5))T(M,"collect every",9,o.dim,false,K(0.52,0.2))a.secB=gX(M,tostring(d.Every),"60",K(0.72,0.13))
a.secB.TextSize=11 a.secSet=H(M,"SET",o.accent,10,K(0.85,0.15))local g6=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},a4(76))
an(g6,6)O("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},g6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,3)},g6)
local function eG(AO)local g7=T(g6,"",9,o.dim,false,nil,UDim2 .new(1,-6,0,14))g7 .LayoutOrder,g7 .TextWrapped,g7 .TextTruncate=AO,false,Enum.TextTruncate.AtEnd
return g7 end a.helpL,a.campL,a.questL,a.arL,a.ixL=eG(1),eG(2),eG(3),eG(4),eG(5)end sB("LOG")a.log=O("TextLabel",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},a4(84))an(a.log,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,eE)g5,eE=0,12 local function ai(AP)return a4(AP,a.set)end local function c3(AQ)T(ai(14),AQ,10,o.dim,true)end
c3("ONE-OFF ACTIONS")M=ai(26)a.buyB=H(M,"BUY THE PAD",o.warn,10,K(0,0.5))a.plB=H(M,"WAX WHAT I HOLD",o.good,10,K(0.5,0.5))
M=ai(26)a.sellB=H(M,"SELL WHAT I HOLD",o.warn,10,K(0,0.5))a.crateB=H(M,"OPEN CRATE NOW",o.warn,10,K(0.5,0.5))
M=ai(26)a.padB=H(M,"SET PAD (stand on it)",o.panel2,10,K(0,0.55))a.padL=T(M,"",10,o.dim,false,K(0.56,0.44))c3("SETTINGS FILE  (saved on your phone)")
M=ai(28)a.cfgName=gX(M,"default","config name",K(0,0.5))a.cfgSave=H(M,"SAVE",o.good,11,K(0.5,0.25))a.cfgLoad=H(M,"LOAD",o.accent,11,K(0.75,0.25))
M=ai(26)a.cfgPrev=H(M,"<",o.panel2,11,K(0,0.13))a.cfgPick=H(M,"(none saved)",o.panel2,10,K(0.13,0.74))a.cfgNext=H(M,">",o.panel2,11,K(0.87,0.13))
M=ai(26)a.cfgAuto=H(M,"LOAD IT ON LAUNCH: OFF",o.panel2,10,K(0,1))a.cfgMsg=T(ai(26),"",10,o.dim,false)c3("START BY ITSELF")
M=ai(26)a.autoB=H(M,"INSTALL F.exec",o.accent,10,K(0,1))a.autoMsg=T(ai(30),"",10,o.dim,false)M=ai(28)a.startT=H(M,"START FARMING ON LOAD: ON",o.accent,10,K(0,1))
T(ai(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,o.dim,false)
c3("IF THE GAME DROPS ME")M=ai(28)a.rejT=H(M,"AUTO REJOIN: ON",o.accent,11,K(0,0.55))a.rejB=H(M,"REJOIN NOW",o.warn,11,K(0.55,0.45))
a.rejMsg=T(ai(30),"",10,o.dim,false)c3("SMOOTHER RUNNING  (for long / overnight runs)")M=ai(28)a.pfLite=H(M,"LITE MODE: OFF",o.panel2,10,K(0,0.5))
a.pfHud=H(M,"HIDE GAME HUD: OFF",o.panel2,10,K(0.5,0.5))M=ai(28)a.pfFps=H(M,"FPS CAP: GAME",o.panel2,10,K(0,0.5))
a.pfRender=H(M,"STOP 3D: OFF",o.panel2,10,K(0.5,0.5))M=ai(28)a.pfBases=H(ai(28),"BASES: ALL DRAWN",o.panel2,10,K(0,1))
M=ai(28)a.pfMem=gX(M,tostring(d.MemLimit),"2000",K(0,0.24))T(M,"MB: rejoin this server above it (0 = never)",9,o.dim,false,K(0.26,0.52))
a.pfMemSet=H(M,"SET",o.accent,11,K(0.8,0.2))a.pfInfo=T(ai(18),"",10,o.text,false)T(ai(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. BASES: OTHERS HIDDEN stops drawing other players' bases and stacks, ALL HIDDEN yours too (nothing is removed, so helping and farming work). HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,o.dim,false)
c3("THE ROUND SAB BUTTON")T(ai(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,o.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,eE)local sF=O("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},lc)
a.tgRoot=O("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=o.accent,BorderSizePixel=0,Active=true},sF)an(a.tgRoot,20)O("UIStroke",{Color=o.line,Thickness=1},a.tgRoot)
a.tgBtn=O("TextButton",{Text="SAB",Size=a2,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=o.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=O("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=o.dim,BorderSizePixel=0},a.tgRoot)
an(a.tgDot,4)a.tgGhost=O("TextButton",{Text="G: OFF",Size=UDim2 .new(0,46,0,18),Position=UDim2 .new(0.5,-23,1,4),
BackgroundColor3=o.panel2,Font=Enum.Font.GothamBold,TextSize=9,TextColor3=o.text,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
an(a.tgGhost,6)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()local g8=j.ghostMode()
local sG=g8==2 and o.accent or(g8==1 and o.warn or o.panel2)if a.ghostT then a.ghostT.Text,a.ghostT.BackgroundColor3=j.GHOST[g8][1],sG end
if a.tgGhost then a.tgGhost.Text,a.tgGhost.BackgroundColor3=j.GHOST[g8][2],sG end end local bm={built=false,boxes={},at=0}
local function sH(sI,lp)d.Targets[sI]=lp or nil local lq=bm.boxes[sI]if lq then lq.Text=lp and"X"or""lq.BackgroundColor3=lp and o.good or o.panel2
end end local function lr()for AS,sJ in pairs(bm.boxes)do local sK=d.Targets[AS]==true sJ.Text=sK and"X"or""sJ.BackgroundColor3=sK and o.good or o.panel2
end end local eH local function AT()local AU=0 local ls=O("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=T(ls,"",10,o.dim,false,K(0,0.5))local AV=H(ls,"CLEAR",o.panel2,10,K(0.5,0.24))local AW=H(ls,"REFRESH",o.panel2,10,K(0.74,0.26))
AV.MouseButton1Click:Connect(function()for AX in pairs(d.Targets)do d.Targets[AX]=nil end lr()end)AW.MouseButton1Click:Connect(function()
ad.at=0 ia()eH(true)end)return AU end eH=function(AY)if not ia()then if not a.butEmpty then a.butEmpty=T(O("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,o.warn,false)end return end if bm.built and not AY and bm.at==ad.at then return end
for Ec,lt in ipairs(a.but:GetChildren())do if lt:IsA("Frame")or lt:IsA("TextButton")then lt:Destroy()end end bm.boxes,a.butEmpty={},nil
AT()local lu,lv=36,1 local function sL(sM)lv=lv+1 local AZ=O("Frame",{Size=UDim2 .new(1,0,0,sM),BackgroundTransparency=1,LayoutOrder=lv},a.but)
lu=lu+sM+6 return AZ end for Ed,g9 in ipairs(ad.rarOrder)do local A0=sL(24)local A1=sn[g9]or o.text local lw=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},A0)
an(lw,6)T(lw,"  "..g9:upper(),11,A1,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local A2=H(lw,"ALL",o.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local A3=g9 A2 .MouseButton1Click:Connect(function()local sN=ad.members[A3]or{}local sO=false for Ee,A4 in ipairs(sN)do if not d.Targets[A4]then sO=true break end end
for Ef,A5 in ipairs(sN)do sH(A5,sO)end end)for Eg,lx in ipairs(ad.members[g9]or{})do local A6=sL(22)local g_=O("TextButton",{Text="",Size=a2,BackgroundColor3=o.bg,BorderSizePixel=0,
AutoButtonColor=true},A6)an(g_,5)T(g_,"   "..ah(lx),11,o.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local ly=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},g_)an(ly,4)bm.boxes[lx]=ly local sP=lx local function sQ()sH(sP,not d.Targets[sP])end
g_.MouseButton1Click:Connect(sQ)ly.MouseButton1Click:Connect(sQ)end end lr()a.but.CanvasSize=UDim2 .new(0,0,0,lu+10)
bm.built,bm.at=true,ad.at end function L.paint()for A7,sR in pairs(L.boxes)do local sS=d.CrateTicks[A7]==true
sR.Text=sS and"X"or""sR.BackgroundColor3=sS and o.good or o.panel2 end if a.crtInfo then local lz,lA=0,0 for Eh in pairs(L.boxes)do lz=lz+1 end
for Ei,A8 in pairs(d.CrateTicks)do if A8 then lA=lA+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(lz,lA)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and o.accent or o.panel2
end end function L.build()for Ej,lB in ipairs(a.crt:GetChildren())do if lB:IsA("Frame")or lB:IsA("TextButton")then lB:Destroy()end
end L.boxes={}local lC,lD=12,0 local function ha(sT)lD=lD+1 lC=lC+sT+6 return O("Frame",{Size=UDim2 .new(1,0,0,sT),BackgroundTransparency=1,LayoutOrder=lD},a.crt)
end local lE=ha(28)a.crtInfo=T(lE,"",10,o.dim,false,K(0,0.5))local A9=H(lE,"CLEAR",o.panel2,10,K(0.5,0.24))local A_=H(lE,"REFRESH",o.panel2,10,K(0.74,0.26))
V(A9 .MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))V(A_.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=H(ha(28),"",o.accent,11,K(0,1))V(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
T(ha(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,o.dim,false)
for Ek,bn in ipairs(L.list())do local Ba=ha(24)local eI=O("TextButton",{Text="",Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,AutoButtonColor=true},Ba)
an(eI,5)T(eI,"  "..(bn.title or bn.name)..(bn.guess and"  (?)"or""),11,sn[bn.rar or""]or o.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
T(eI,bn.price and("$"..aJ(bn.price))or(bn.rar or""),9,o.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local lF=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},eI)an(lF,4)L.boxes[bn.k]=lF local sU=bn.k local function sV()d.CrateTicks[sU]=(not d.CrateTicks[sU])or nil
L.paint()end V(eI.MouseButton1Click:Connect(sV))V(lF.MouseButton1Click:Connect(sV))end a.crt.CanvasSize=UDim2 .new(0,0,0,lC+10)
L.built=L.at L.paint()end local sW="farm"local function bJ(ar)sW=ar a.farm.Visible,a.but.Visible,a.set.Visible=(ar=="farm"),(ar=="but"),(ar=="set")
a.crt.Visible=(ar=="crt")a.pet.Visible,a.team.Visible=(ar=="pet"),(ar=="team")a.tabCrt.BackgroundColor3=(ar=="crt")and o.accent or o.panel2
a.tabPet.BackgroundColor3=(ar=="pet")and o.accent or o.panel2 a.tabTeam.BackgroundColor3=(ar=="team")and o.accent or o.panel2
if ar=="pet"and not l.built then pcall(l.build)end if ar=="team"and not y.built then pcall(y.build)end if ar=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(ar=="farm")and o.accent or o.panel2 a.tabBut.BackgroundColor3=(ar=="but")and o.accent or o.panel2
a.tabSet.BackgroundColor3=(ar=="set")and o.accent or o.panel2 if ar=="but"then eH(false)end end local function N(hb,hc,Bb,Bc)
a.put(hb,hc and Bb or Bc)if a.lit[hb]~=hc then a.lit[hb]=hc hb.BackgroundColor3=hc and o.accent or o.panel2 end
end l.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function l.paintRow(sX)
local cg=l.rows and l.rows[sX]if not cg then return end local eJ=d.Pets[sX]or{}cg.b.BackgroundColor3=eJ.b and o.good or o.panel2
cg.g.BackgroundColor3=eJ.g and o.accent or o.panel2 cg.g.Text=eJ.g and"BIG"or"ANY"cg.w.BackgroundColor3=eJ.w and o.warn or o.panel2
local lG=tonumber(eJ.f)or 0 cg.f.Text=lG>0 and(lG.." BIG")or"FUSE"cg.f.BackgroundColor3=lG>0 and o.good or o.panel2
end function l.flag(lH,hd)local a5=d.Pets[lH]or{}if hd=="f"then local sY=((tonumber(a5 .f)or 0)+1)%4 a5 .f=sY>0 and sY or nil
elseif a5[hd]then a5[hd]=nil else a5[hd]=true end d.Pets[lH]=(a5 .b or a5 .g or a5 .w or a5 .f)and a5 or nil l.paintRow(lH)
end function l.paintAll()for Bd in pairs(l.rows or{})do l.paintRow(Bd)end if a.pbT then N(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function l.live()if not l.built then l.build()return end if x()-(l.liveAt or 0)<1 then return end l.liveAt=x()
local sZ=l.wishes()local eK=l.data()for he,hf in pairs(l.rows)do hf.name.Text=l.nice(he)..(sZ[he]and("   * wish %dm"):format(math.ceil(sZ[he]/60))or"")
local s0=A.status(he,eK)hf.desc.Text=s0 and(s0 .." | "..hf.boostText)or hf.boostText end local s1=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eK and#(eK.pets or{})or 0,eK and tonumber(eK.maxOwned)or 60,
aJ(l.money()),s1>0 and(" | free wishes "..s1)or"",l.buyMsg~=""and l.buyMsg or"-",l.wishMsg~=""and l.wishMsg or"-")
end function l.build()local hg=l.info()for El,lI in ipairs(a.pet:GetChildren())do if lI:IsA("Frame")or lI:IsA("TextLabel")then lI:Destroy()end
end l.rows={}local lJ,hh=0,12 local function c4(s2)lJ,hh=lJ+1,hh+s2+6 return O("Frame",{Size=UDim2 .new(1,0,0,s2),BackgroundTransparency=1,LayoutOrder=lJ},a.pet)
end local lK=c4(28)a.pbT=H(lK,"AUTO ADOPT: OFF",o.panel2,9,K(0,0.34))a.pwT=H(lK,"AUTO WISH: OFF",o.panel2,9,K(0.34,0.33))
a.pfT=H(lK,"AUTO FUSE: OFF",o.panel2,9,K(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy l.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish l.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse l.paintAll()end)
a.pInfo=T(c4(44),"",10,o.dim,false)T(c4(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,o.dim,false)
if not hg then T(c4(30),"pet list not loaded yet - open this tab again in a moment",11,o.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,hh)
l.built=false return end local c5={}for Em,s3 in ipairs(l.order())do local lL=hg.Pets[s3].rarity or"?"c5[lL]=c5[lL]or{}
table.insert(c5[lL],s3)end local c6={}for En,s4 in ipairs(hg.Rarities or{})do if c5[s4]then c6[#c6+1]=s4 end end
for s5 in pairs(c5)do if not table.find(c6,s5)then c6[#c6+1]=s5 end end for Eo,hi in ipairs(c6)do local s6=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},c4(22))
an(s6,6)T(s6,"  "..hi:upper(),11,l.RC[hi]or o.text,true)for Ep,hj in ipairs(c5[hi])do local cj=O("Frame",{Size=a2,BackgroundColor3=o.bg,BorderSizePixel=0},c4(38))
an(cj,5)local Be=T(cj,l.nice(hj),11,l.RC[hi]or o.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local Bf,Bg=pcall(function()return hg.describe(hj)end)
local s7=Bf and tostring(Bg)or""local Bh=T(cj,s7,9,o.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local s8=H(cj,"BUY",o.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local s9=H(cj,"ANY",o.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local s_=H(cj,"WISH",o.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local ta=H(cj,"FUSE",o.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local hk=hj s8 .MouseButton1Click:Connect(function()l.flag(hk,"b")end)
s9 .MouseButton1Click:Connect(function()l.flag(hk,"g")end)s_.MouseButton1Click:Connect(function()l.flag(hk,"w")end)
ta.MouseButton1Click:Connect(function()l.flag(hk,"f")end)l.rows[hj]={b=s8,g=s9,w=s_,f=ta,name=Be,desc=Bh,boostText=s7}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,hh+10)l.built=true l.paintAll()end function j.paint()N(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")N(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
N(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])N(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end V(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
V(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))V(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))
V(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))V(a.pfFps.MouseButton1Click:Connect(function()
local Bi=table.find(j.CAPS,d.FpsCap or 0)or 1 local tb=j.CAPS[(Bi%#j.CAPS)+1]if not j.cap(tb)and tb~=0 then z("this executor cannot cap fps")end
j.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()local lM=tonumber(a.pfMem.Text)if lM and lM>=0 then d.MemLimit=math.floor(lM)end
j.paint()end))function y.names()local lN={"(none)"}for Eq,Bj in ipairs((y.teams()))do lN[#lN+1]=Bj.name end return lN
end function y.cycle(lO,Bk)local hl=y.names()local Bl=d[lO]~=""and d[lO]or"(none)"local hm=table.find(hl,Bl)or 1
hm=((hm-1+Bk)%#hl)+1 d[lO]=hl[hm]=="(none)"and""or hl[hm]y.paint()end function y.paint()if not y.built then return end
N(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")N(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")
local lP={}for Er,Bm in ipairs((y.teams()))do lP[Bm.name]=true end for Bn,tc in pairs(y.pick)do local c7=d[Bn]
tc.Text=c7==""and"(none)"or(lP[c7]and c7 or(c7 .." (missing)"))tc.TextColor3=(c7~=""and not lP[c7])and o.bad or o.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(y.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(y.switches,y.finished,y.glazed,A.fused)
..(A.buildMsg~=""and("\n"..A.buildMsg)or"")local Bo,hn=l.srv(),{}for Es,ho in ipairs(y.list or{})do hn[#hn+1]=("st %-2s %-22s %9s  helps %d"):format(ho.st.Name,ah(aa(ho.name)):sub(1,22),y.clock(ho.ends-Bo),ho.helps)
end a.tmList.Text=#hn>0 and table.concat(hn,"\n")or"no waxes running"end function y.build()for Et,lQ in ipairs(a.team:GetChildren())do
if lQ:IsA("Frame")or lQ:IsA("TextLabel")then lQ:Destroy()end end y.pick={}local lR,lS=0,12 local function bK(td)
lR,lS=lR+1,lS+td+6 return O("Frame",{Size=UDim2 .new(1,0,0,td),BackgroundTransparency=1,LayoutOrder=lR},a.team)
end local function eL(Bp)T(bK(14),Bp,10,o.dim,true)end local function hp(hq)local lT=bK(26)local Bq=H(lT,"<",o.panel2,11,K(0,0.14))
local te=H(lT,"(none)",o.panel,10,K(0.14,0.72))local Br=H(lT,">",o.panel2,11,K(0.86,0.14))Bq.MouseButton1Click:Connect(function()y.cycle(hq,-1)end)
Br.MouseButton1Click:Connect(function()y.cycle(hq,1)end)te.MouseButton1Click:Connect(function()y.cycle(hq,1)end)
y.pick[hq]=te end a.tmT=H(bK(28),"AUTO TEAMS: OFF",o.panel2,11,K(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=y.current()end y.paint()end)a.tmInfo=T(bK(42),"",10,o.dim,false)
local tf=bK(26)a.tmBuild=H(tf,"AUTO BUILD TEAMS: OFF",o.panel2,9,K(0,0.62))a.tmBuildNow=H(tf,"BUILD NOW",o.warn,9,K(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild y.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if y.editing then return end A.buildMsg="building..."task.spawn(function()local Bs,Bt=pcall(A.rebuild,"you asked")if not Bs then z("BUILD ERR "..tostring(Bt))end end)
end)eL("NORMAL TEAM  (worn the rest of the time)")hp("TeamNormal")eL("FULL TEAM  (every station busy: money + wax speed)")
hp("TeamFull")eL("GLAZE TEAM  (worn just before a wax finishes)")hp("TeamGlaze")local lU=bK(26)a.tmLead=gX(lU,tostring(d.GlazeLead),"45",K(0,0.2))
T(lU,"sec before it finishes",10,o.dim,false,K(0.22,0.5))local Bu=H(lU,"SET",o.accent,11,K(0.75,0.25))Bu.MouseButton1Click:Connect(function()
local hr=tonumber(a.tmLead.Text)if hr and hr>=5 and hr<=600 then d.GlazeLead=math.floor(hr)else a.tmLead.Text=tostring(d.GlazeLead)end
y.paint()end)eL("WAX TEAM  (worn while a butter is placed: head starts)")hp("TeamWax")eL("YOUR WAXES  (time left, helps)")
a.tmList=O("TextLabel",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bK(150))an(a.tmList,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
T(bK(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,o.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,lS+10)y.built=true y.paint()end local function Bv()a.secB.Text=tostring(d.Every)
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not D.home then pcall(j.unpin)end end)end
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then eq(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bI(a.root)bI(a.tgRoot)c.lastCollect=x()
lr()L.paint()pcall(l.paintAll)pcall(y.paint)pcall(j.applyAll)end local function Bw(th)task.spawn(function()th.TextColor3=o.bad
task.wait(0.8)if c.alive then th.TextColor3=o.text end end)end local function ti()local tj=a.secB.Text:match("^%s*(%d+)%s*$")
local eM=tj and tonumber(tj)if not eM or eM<1 then a.secB.Text=tostring(d.Every)Bw(a.secB)z("interval must be a whole number >= 1")
return end if eM==d.Every then return end d.Every,c.lastCollect=eM,x()z("collect every "..eM.."s")end local function P(Bx,By)V(Bx.MouseButton1Click:Connect(By))end
P(a.secSet,ti)V(a.secB.FocusLost:Connect(ti))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(aq,"selling...",q_)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(C.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help D.nextAt,D.msg=0,d.Help and"looking for waxes to help"or"off"N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests E.at=0 N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire J.nextAt,J.fails,J.lost=0,0,0 N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,j.cycleGhost)function q.paint()N(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")N(a.bestT,(d.Best or 0)>0,d.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(d.Best)),"BEST BUTTER: OFF")
N(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")N(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(Bz)task.spawn(function()pcall(q.tick)if Bz and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end P(a.ixT,function()local BA=q.on()d.AutoIndex=not d.AutoIndex q.discAt=-100 q.changed(BA)end)
P(a.bestT,function()local BB=q.on()d.Best=((d.Best or 0)+1)%5 q.stackAt=-100 q.changed(BB)end)P(a.bcT,function()
local BC=q.on()d.BestCrate=not d.BestCrate q.changed(BC)end)P(a.shT,function()d.Shower=not d.Shower q.paint()
end)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(aq,"opening crate...",fK,true)
end)P(a.padB,function()c.plot=bo()or c.plot local tk,lV=au(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(tk and lV and lV:IsA("BasePart"))then z("SET PAD: need character and plot")return end c.manualPad=lV.CFrame:ToObjectSpace(tk.HumanoidRootPart.CFrame)
y0(c.manualPad)z("collect pad saved at your position")end)P(a.startB,function()eq(not c.running)end)P(a.buyB,function()
c.plot=bo()or c.plot task.spawn(aq,"buying (manual)...",nP,true)end)P(a.plB,function()c.plot=bo()or c.plot task.spawn(aq,"waxing (manual)...",nU)
end)P(a.tabFarm,function()bJ("farm")end)P(a.tabBut,function()bJ("but")end)P(a.tabSet,function()bJ("set")end)P(a.tabCrt,function()bJ("crt")end)
P(a.tabPet,function()bJ("pet")end)P(a.tabTeam,function()bJ("team")end)local function BD(lW)c.hidden=lW a.root.Visible=not lW
a.tgBtn.Text=lW and"SAB+"or"SAB"end sw(a.tgBtn,a.tgRoot,function()bI(a.tgRoot)c.togPos=g1(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then BD(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aH,av={},0
local function bL()aH=nb()if#aH==0 then a.cfgPick.Text="(none saved)"av=0 return end if av<1 or av>#aH then av=1 end
a.cfgPick.Text=aH[av]..("  (%d/%d)"):format(av,#aH)end local function tl()local tm=c.autoload~=nil a.cfgAuto.Text=tm and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=tm and o.accent or o.panel2 end local function lX()local tn=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if tn~=""then return tn end return(av>0 and aH[av])or""end P(a.cfgSave,function()c.winPos=g1(a.root)or c.winPos
c.togPos=g1(a.tgRoot)or c.togPos local to,tp=fp(lX())a.cfgMsg.Text=to and("saved as "..tp)or("could not save: "..tp)
a.cfgMsg.TextColor3=to and o.good or o.bad bL()z(a.cfgMsg.Text)end)local function BE(lY)local lZ,tq=nk(lY)a.cfgMsg.Text=lZ and("loaded "..tq)or("could not load: "..tq)
a.cfgMsg.TextColor3=lZ and o.good or o.bad if lZ then a.cfgName.Text=lY Bv()task.spawn(C.apply,"config "..lY)
end z(a.cfgMsg.Text)end P(a.cfgLoad,function()BE(lX())end)P(a.cfgPick,function()bL()if av>0 then a.cfgName.Text=aH[av]end
end)P(a.cfgPrev,function()if#aH==0 then bL()return end av=(av-2)%#aH+1 bL()a.cfgName.Text=aH[av]end)P(a.cfgNext,function()
if#aH==0 then bL()return end av=av%#aH+1 bL()a.cfgName.Text=aH[av]end)P(a.cfgAuto,function()if c.autoload then
nm(nil)a.cfgMsg.Text="it will not load a config on launch"else local eN=lX()local tr=false for Eu,BF in ipairs(nb())do if BF==eN then tr=true end end
local BG=tr or fp(eN)if BG and eN~=""then nm(eN)bL()a.cfgMsg.Text=eN.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=o.dim tl()end)P(a.autoB,function()
local ts,tt=vm()a.autoMsg.Text=ts and("installed. "..tt)or("failed: "..tt)a.autoMsg.TextColor3=ts and o.good or o.bad
z(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()dp("you asked")end)
local bM=false P(a.minB,function()bM=not bM a.tabs.Visible=not bM if bM then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bJ(sW)end a.root.Size=UDim2 .new(0,ak.w,0,bM and(ak.head+ak.strip)or ak.h)
a.minB.Text=bM and"+"or"-"end)local function hs()if not c.alive then return end c.alive,c.running=false,false
pcall(j.restoreAll)pcall(e0)for Ev,BH in ipairs(hC)do pcall(function()BH:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()ld:Destroy()end)pcall(function()sF:Destroy()end)if cm.SAB_KILL==hs then cm.SAB_KILL=nil end end
cm.SAB_KILL=hs P(a.killB,hs)P(a.xB,hs)sw(a.title,a.root,function()bI(a.root)c.winPos=g1(a.root)or c.winPos end)
local function tu()local eO,ck=c.reason,c.level if c.busy then eO,ck=c.busyText,"ok"elseif not c.running then
local Ew,tv,BI=rI()if c.capHit then eO,ck=tv,"bad"else eO,ck="[stopped] "..tv,(BI=="bad")and"bad"or"idle"end c.reason,c.level=eO,ck
end local ht=c.running and o.good or(c.capHit and o.bad or o.dim)if a.lit.dot~=ht then a.lit.dot=ht a.dot.BackgroundColor3,a.tgDot.BackgroundColor3=ht,ht end
if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and o.panel2 or o.accent end if c.hidden then return end
a.put(a.reason,eO)if a.lit.bar~=ck then a.lit.bar=ck a.bar.BackgroundColor3=z_[ck]or o.dim end if bM then return end
if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and o.warn or o.good
end N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")local bN=uX()if a.farm.Visible then
local BJ,BK=eX()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,BJ.."/"..BK)local tw=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local tx=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aJ(a6()),c.rolls,c.gifts,c.crates,tx and ah(aa(tx))or"nothing",e.on and("   ["..e.title.." window open]")or"",
tw and("in "..tw.."s")or"off"))a.put(a.tgt,(#bN==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bN<=3)and table.concat(bN,", ")or(#bN.." butters ticked"))))
if a.lit.tgt~=(#bN==0)then a.lit.tgt=(#bN==0)a.tgt.TextColor3=(#bN==0)and o.bad or o.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(eR,"\n")end
end if a.set.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bN))
end if a.but.Visible and bm.at~=ad.at then eH(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then l.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak)
end if a.team.Visible then y.paint()end if a.farm.Visible then a.put(a.helpL,"help: "..((d.Help or d.HelpGuild)and D.msg or"off"))
a.put(a.campL,"camp: "..(d.Campfire and J.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests: "..(d.Quests and(E.msg~=""and E.msg or"checking...")or"off"))a.put(a.ixL,q.msg)N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local ty=(C.rec.on and"on"or"")..(C.rec.off and((C.rec.on and"/"or"").."off")or"")
a.put(a.arL,C.msg~=""and C.msg or("auto roll: game %s | learned %s%s"):format(C.isOn()and"ON"or"off",ty~=""and ty or"nothing yet",#C.rec.rules>0 and", choices"or""))
if a.lit.arL~=(C.msg~="")then a.lit.arL=(C.msg~="")a.arL.TextColor3=C.msg~=""and o.warn or o.dim end end end cm.SAB={S=c,CFG=d,EV=W,U=a,sg=ld,CAT=ad,LEARN=ag,buildList=eH,
logAll=c8,evAll=c9,AR=C,CR=L,PF=j,PX=l,TM=y,CRATE=e,FU=A,HX=D,CF=J,QX=E,IX=q,SH=Q}z(cl.." loaded")if c.uiErrs>0 then z("UI: "..c.uiErrs.." properties skipped")end
bJ("farm")bI(a.root)bI(a.tgRoot)if gY then pcall(function()V(gY:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bI(a.root)bI(a.tgRoot)end))end)end bL()tl()if c.config and c.config~=""then a.cfgName.Text=c.config end
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(tu)task.spawn(function()local tz=vk()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(tz and("\n(backup: "..tz..")")or"")
local tA=fj(al.exec)if tA and not tA:find("SAB autoloader v2",1,true)then dk(al.exec,al.stub)z("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fj(al.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(vs)end)task.spawn(function()while c.alive do local BL,BM=pcall(tu)if not BL then z("UI ERR "..tostring(BM))end
task.wait((c.hidden or bM)and 1.5 or 0.4)end end)task.spawn(function()local BN,BO=pcall(vA)if not BN then z("HOOK ERR "..tostring(BO))end
end)task.spawn(function()pcall(ui)if e.loadSeq and not e.learned then local hu={}for tB=1,20 do if e.loadSeq[tB]then hu[#hu+1]=e.loadSeq[tB]end end
if#hu>0 then e.learned={seq=hu,mode=e.loadMode}z("remembered how to open crates directly")end end if ia()then z(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local BP,tC=pcall(y2)if BP and tC and c.alive and not c.manualPad then c.manualPad=tC end end)task.spawn(function()
while c.alive do local l0,l1=pcall(l.buyTick)if not l0 then z("PET ERR "..tostring(l1))task.wait(5)end l0,l1=pcall(l.wishTick)
if not l0 then z("WISH ERR "..tostring(l1))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local hv,tD=0,x()
V(game:GetService("RunService").Heartbeat:Connect(function()hv=hv+1 end))V(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=x()while c.alive do task.wait(1)local tE=x()j.fps,hv,tD=hv/math.max(tE-tD,0.001),0,tE local BQ,BR=pcall(j.tick)
if not BQ then z("PERF ERR "..tostring(BR))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local BS,BT=pcall(A.tick)if not BS then z("FUSE ERR "..tostring(BT))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local BU,BV=pcall(y.tick)if not BU then z("TEAM ERR "..tostring(BV))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local hw=aj:WaitForChild("Remotes",30)local tF=hw and hw:WaitForChild("ClanEvent",30)
if tF and c.alive then V(tF.OnClientEvent:Connect(function(BW,BX)if BW=="call"then pcall(D.onCall,BX)end end))
end local tG=hw and hw:FindFirstChild("RollConfirmAsk")if tG and c.alive then V(tG.OnClientEvent:Connect(function(BY)E.asked=BY or"butter"end))end
end)task.spawn(function()local l2=aj:WaitForChild("Remotes",30)if not(l2 and c.alive)then return end local function hx(BZ,B0)
local l3=l2:FindFirstChild(BZ)if l3 and l3:IsA("RemoteEvent")then V(l3 .OnClientEvent:Connect(function(...)pcall(B0,...)end))end
end hx("NewSquishyDiscovered",function(l4,tH)if type(l4)~="string"then return end q.disc=q.disc or{}q.disc[aa(l4)]=true
z(("INDEX: %s%s is in your Index now"):format(ah(aa(l4)),tH and(" ("..tostring(tH)..")")or""))end)hx("IndexRefresh",q.loadDisc)
hx("IndexRowComplete",function(B1)z("INDEX: the whole "..tostring(B1).." row is complete")end)hx("AdminShow",q.admin)
local tI=l2:FindFirstChild("AdminShowSync")if tI then local B2,tJ=pcall(function()return tI:InvokeServer()end)
if B2 and type(tJ)=="table"then for Ex,B3 in pairs(tJ)do pcall(Q.add,B3)end end end while c.alive do local B4,B5=pcall(q.tick)
if not B4 then q.msg="index error: "..tostring(B5)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local B6,B7=pcall(E.tick)if not B6 then z("QUEST ERR "..tostring(B7))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(e0)end end)pcall(C.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local B9=(type(newcclosure)=="function")and newcclosure or function(B8)return B8 end local l5
local tK=(type(setnamecallmethod)=="function")and setnamecallmethod or nil l5=hookmetamethod(game,"__namecall",B9(function(tL,...)
local eP=getnamecallmethod()if c.alive and(eP=="InvokeServer"or eP=="FireServer")then local tM,tN=pcall(function()return tL.Name end)
if tM and tN=="CrateAction"and not e.replaying then pcall(e.saw,eP,...)elseif tM and tN=="AutoRollAction"and not C.replaying then pcall(C.saw,eP,...)end
if tK then tK(eP)end end return l5(tL,...)end))e.oldNC=l5 end)end if hA then V(F.Idled:Connect(function()pcall(function()hA:CaptureController()hA:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Ey=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and au()and(c.plot or bo())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then C.apply("joined")end while c.alive do task.wait(30)local hy=bS()
if hy and q.on()and not aI(hy.name)then hy=nil end if c.alive and d.AutoRoll and c.running and not C.isOn()and not hy and not ac()
and not e.waiting and not e.on and not c.busy then C.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Ez=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bo()if au()and c.plot and q.any()then eq(true,true)z("started by itself")
return end task.wait(1)end if c.alive and not c.running then z("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bo()c.lastCollect=x()while c.alive do if c.running then local B_,tO=pcall(z5)if not B_ and tO~=hB then z("LOOP ERR "..tostring(tO))end
end task.wait(0.1)end end)hz("loaded - window is at the top left")end local Cb,l6=xpcall(tS,function(Ca)return tostring(Ca).."\n"..debug.traceback()end)
if not Cb then pcall(function()warn("SAB "..cl.." ERROR: "..tostring(l6))end)hz("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cl.." ERROR: "..tostring(l6))end)pcall(function()local tP=(type(getgenv)=="function"and getgenv())or _G
if type(tP.SAB_KILL)=="function"then tP.SAB_KILL()end for EA,Cc in ipairs({"SABFarmGui","SABToggle"})do local tQ=F.PlayerGui:FindFirstChild(Cc)
if tQ then tQ:Destroy()end end end)pcall(function()local eQ=Instance.new("ScreenGui")eQ.Name="SABError"eQ.ResetOnSpawn=false
eQ.DisplayOrder=1000 local aX=Instance.new("TextBox")aX.Size=UDim2 .new(0,340,0,170)aX.Position=UDim2 .new(0,10,0,50)
aX.BackgroundColor3=Color3 .fromRGB(90,20,20)aX.TextColor3=Color3 .new(1,1,1)aX.TextSize=11 aX.TextWrapped=true
aX.ClearTextOnFocus=false aX.TextXAlignment=Enum.TextXAlignment.Left aX.TextYAlignment=Enum.TextYAlignment.Top
aX.Text="SAB "..cl.." failed to start. Send this text:\n"..tostring(l6)aX.Parent=eQ eQ.Parent=F:WaitForChild("PlayerGui")
end)end
