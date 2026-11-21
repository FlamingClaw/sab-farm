local cl="v26"local l6=game:GetService("Players")local F=l6 .LocalPlayer or l6 .PlayerAdded:Wait()local function hz(tR)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..cl,Text=tR,Duration=6})
end)end hz("script started")local function tS()local aj=game:GetService("ReplicatedStorage")local as=game:GetService("Workspace")
local l7=game:GetService("UserInputService")local cm=(type(getgenv)=="function"and getgenv())or _G if type(cm.SAB_KILL)=="function"then pcall(cm.SAB_KILL)end
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
local l,y,j,A,D,J,E={},{},{},{},{},{},{}local q,Q={},{}local hB={}local hC,eQ,c8,c9={},{},{},{}local function V(l8)hC[#hC+1]=l8 return l8 end
local function af(tV)task.wait(tV)if not c.alive then error(hB,0)end end local function z(eR)eR=os.date("%H:%M:%S").." "..tostring(eR)
table.insert(eQ,1,eR)if#eQ>6 then table.remove(eQ)end c.logN=(c.logN or 0)+1 c8[#c8+1]=eR if#c8>80 then table.remove(c8,1)end
end local function eS(l9)if type(l9)~="string"then return""end return(l9:lower():gsub("[^%w]",""))end local function aa(tW)
local l_=eS(tW)local hD=l_:gsub("butter$","")if hD==""then hD=l_ end return hD end local function aI(ma)if type(ma)~="string"then return false end
local hE=aa(ma)if hE==""then return false end if q.want then return q.want(hE)end return d.Targets[hE]==true end
local function tX(c_)c_=c_:lower()return c_:find("squishy",1,true)~=nil or c_:match("butter$")~=nil or c_:match("butter[^%a]")~=nil
end local hF={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aJ(da)if type(da)~="number"then return"?"end
local eT=1 while math.abs(da)>=1000 and eT<#hF do da=da/1000 eT=eT+1 end local tY=string.format("%.2f",da):gsub("%.?0+$","")
return tY..hF[eT]end local function tZ(mb)if type(mb)~="string"then return nil end local t0,mc=mb:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local hG=tonumber(t0)if not hG then return nil end if mc==""then return hG end for t1,t2 in ipairs(hF)do if t2:lower()==mc:lower()then return hG*1000^(t1-1)end end
return nil end local function a6()local md=F:GetAttribute("BoardValueMoney")if type(md)=="number"then return md end
local me=F:FindFirstChild("leaderstats")if me then for Cd,t3 in ipairs({"Cash","Money","Coins"})do local hH=me:FindFirstChild(t3)
if hH and type(hH.Value)=="number"then return hH.Value end end end end local function eU(t4)local hI=t4:GetFullName()
if c.plot then local hJ=c.plot:GetFullName()if hI:sub(1,#hJ)==hJ then return hI:sub(#hJ+2)end end return hI end
local function au()local eV=F.Character if eV and eV:FindFirstChild("HumanoidRootPart")then local mf=eV:FindFirstChildOfClass("Humanoid")
if mf and mf.Health>0 then return eV end end end local function bn()local hK=as:FindFirstChild("Plots")if not hK then return nil end
local function mg(t5)local mh=t5:FindFirstChild("Plate")return mh~=nil and mh:FindFirstChild("EditStackAttachment",true)~=nil
end local mi=F:GetAttribute("PlotNumber")if mi~=nil then local hL=hK:FindFirstChild(tostring(mi))if hL and mg(hL)then return hL end
end for Ce,mj in ipairs(hK:GetChildren())do if mg(mj)then return mj end end end local function db(mk)local bo=mk and mk.Parent
for Cf=1,6 do if not bo then return nil end if bo:IsA("BasePart")then return bo end if bo:IsA("Model")then return bo.PrimaryPart or bo:FindFirstChildWhichIsA("BasePart",true)end
bo=bo.Parent end end local function ml(mm)local hM=mm.Parent if hM and hM:IsA("Attachment")then return hM.WorldPosition end
local mn=db(mm)return mn and mn.Position end local function mo()local cn=c.plot and c.plot:FindFirstChild("Plate")
if not cn then return nil end if cn:IsA("BasePart")then return cn.Position end if cn:IsA("Model")then return cn:GetPivot().Position end
local mp=cn:FindFirstChildWhichIsA("BasePart",true)return mp and mp.Position end local function mq()local hN={}
local mr=c.plot and c.plot:FindFirstChild("WaxStations")if mr then for Cg,t6 in ipairs(mr:GetChildren())do local ms=t6:FindFirstChild("SquishyPlaceHolder")
local hO=ms and ms:FindFirstChild("PlacePrompt")if hO and hO:IsA("ProximityPrompt")then hN[#hN+1]=hO end end end
return hN end local function eW()local mt,hP=mq(),0 for Ch,t7 in ipairs(mt)do if t7 .Enabled then hP=hP+1 end end
local hQ=#mt local hR=F:GetAttribute("WaxStations")if type(hR)=="number"and hR>hQ then hQ=hR end return hP,hQ
end local function t8()local mu=au()local mv=mu and mu.HumanoidRootPart.Position local hS,mw for Ci,hT in ipairs(mq())do
if hT.Enabled then local mx=ml(hT)local my=(mx and mv)and(mx-mv).Magnitude or 1e9 if not hS or my<mw then hS,mw=hT,my end
end end return hS end local function mz()local eX=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not eX then return nil end local mA=eX:FindFirstChild("BuyPromptAttachment")local eY=(mA and mA:FindFirstChild("BuyPrompt"))or eX:FindFirstChild("BuyPrompt",true)
if eY and eY:IsA("ProximityPrompt")and eY:IsDescendantOf(eX)then return eY end end local mB={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local t9={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ag={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local hU="SAB_order.txt"local function eZ()if not ag.dirty or type(writefile)~="function"then return end local aA={}
for t_,ua in pairs(ag.price)do aA[#aA+1]="P|"..t_.."|"..string.format("%.0f",ua)end for ub,uc in pairs(ag.order)do aA[#aA+1]="O|"..ub.."|"..table.concat(uc,",")end
if e.learned and e.enc then aA[#aA+1]="M|mode|"..tostring(e.learned.mode or"")for ud,e0 in ipairs(e.learned.seq)do
local mC={}for mD=1,e0 .n do mC[mD]=e.enc(e0 .args[mD])end aA[#aA+1]=("A|%d|%s|%d|%s"):format(ud,e0 .m,e0 .n,table.concat(mC,";"))
end end local function hV(ue,uf,e1)local mE={}for mF=1,e1 .n do mE[mF]=e.enc(e1 .args[mF])end aA[#aA+1]=("R|%d|%s|%s|%d|%s"):format(uf,ue,e1 .m,e1 .n,table.concat(mE,";"))
end if e.enc then for ug,uh in ipairs(C.rec.rules)do hV("rules",ug,uh)end if C.rec.on then hV("on",0,C.rec.on)end
if C.rec.off then hV("off",0,C.rec.off)end end for Cj,dc in pairs(L.seen)do aA[#aA+1]=("K|%s|%s|%s|%s"):format(dc.name,dc.title or"",dc.rar or"",dc.price and string.format("%.0f",dc.price)or"")
end if pcall(writefile,hU,table.concat(aA,"\n"))then ag.dirty=false end end local function ui()if type(isfile)~="function"or type(readfile)~="function"then return end
local uj,uk=pcall(isfile,hU)if not(uj and uk)then return end local ul,mG=pcall(readfile,hU)if not(ul and type(mG)=="string")then return end
for um in mG:gmatch("[^\n]+")do local co,cp,a7=um:match("^(%a)|([^|]+)|(.*)$")if co=="P"then ag.price[cp]=tonumber(a7)
elseif co=="M"then e.loadMode=(a7~=""and a7~="nil")and a7 or nil elseif co=="A"and e.dec then local mH=tonumber(cp)
local mI,e2,uo=a7:match("^([^|]+)|(%d+)|(.*)$")if mH and mI then e2=tonumber(e2)local mJ,e3={},0 for up in(uo..";"):gmatch("([^;]*);")do
e3=e3+1 if e3<=e2 then mJ[e3]=e.dec(up)end end e.loadSeq=e.loadSeq or{}e.loadSeq[mH]={m=mI,n=e2,args=mJ}end elseif co=="R"and e.dec then
local mK=tonumber(cp)local e4,uq,e5,ur=a7:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if mK and e4 then e5=tonumber(e5)
local mL,e6={},0 for us in(ur..";"):gmatch("([^;]*);")do e6=e6+1 if e6<=e5 then mL[e6]=e.dec(us)end end local hW={m=uq,n=e5,args=mL}
if e4=="rules"then C.rec.rules[mK]=hW elseif e4=="on"then C.rec.on=hW elseif e4=="off"then C.rec.off=hW end end
elseif co=="K"then local mM,mN,ut=a7:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cp)]={name=cp,title=mM~=""and mM or nil,
rar=mN~=""and mN or nil,price=tonumber(ut)}elseif co=="O"and a7~=""then local e7={}for uu in a7:gmatch("[^,]+")do e7[#e7+1]=uu end
if#e7>0 then ag.order[cp]=e7 end end end end local function uv(e8)if type(e8)~="table"then return end local bO,mO=e8 .rarity,e8 .contents
if type(bO)~="string"or bO==""or type(mO)~="table"then return end local dd={}for Ck,e9 in ipairs(mO)do if type(e9)=="table"and type(e9 .butter)=="string"then
dd[#dd+1]={n=e9 .butter,ch=tonumber(e9 .chance)or 0}end end if#dd==0 then return end table.sort(dd,function(uw,ux)return uw.ch>ux.ch end)
local de,df={},false for uy,uz in ipairs(dd)do de[uy]=uz.n end local hX=ag.order[bO]if not hX or#hX~=#de then df=true end
if not df then for mP=1,#de do if hX[mP]~=de[mP]then df=true break end end end ag.order[bO]=de local hY=tonumber(e8 .price)
if hY and ag.price[bO]~=hY then ag.price[bO]=hY df=true end if df then ag.dirty=true ad.at=0 z("learned the "..bO.." order from its crate")
end end local function cq(uA,uB)local uC=uA:FindFirstChild(uB,true)local uD,hZ=pcall(function()return uC.Text end)
return(uD and type(hZ)=="string"and hZ~="")and hZ or nil end local function ah(mQ)return ad.pretty[mQ]or mQ end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(uE)return eS(uE or"")end
function L.learn(a8)if type(a8)~="table"or type(a8 .name)~="string"then return end local h0=L.key(a8 .name)local a9=L.seen[h0]or{}
local uF=(L.seen[h0]==nil)or(tonumber(a8 .price)and a9 .price~=tonumber(a8 .price))a9 .name,a9 .title=a8 .name,a8 .title or a9 .title
a9 .rar,a9 .price=a8 .rarity or a9 .rar,tonumber(a8 .price)or a9 .price L.seen[h0]=a9 if uF then L.at,ag.dirty=x(),true end
end function L.wanted(mR)if mR==nil then return false end local h1=L.key(mR)return d.CrateTicks[h1]==true or(d.BestCrate and q.bestCrate~=nil and(h1==q.bestCrate or h1==q.bestCrateTitle))
end function L.list()local cr={}for uG,e_ in ipairs(L.base)do cr[L.key(e_[1])]={name=e_[1],title=e_[2],rar=e_[3],i=uG}end
for Cl,dg in ipairs(ad.rarOrder)do local mS=false for Cm,uH in pairs(cr)do if uH.rar==dg then mS=true break end end
if not mS and dg~="?"then local mT=dg:gsub("[^%w]","").."Crate"cr[L.key(mT)]={name=mT,title=dg.." Crate",rar=dg,i=50,guess=true}
end end for mU,fa in pairs(L.seen)do local aY=cr[mU]or{i=100}aY.name,aY.title,aY.rar=fa.name or aY.name,fa.title or aY.title,fa.rar or aY.rar
aY.price,aY.guess=fa.price or aY.price,nil cr[mU]=aY end local dh,fb={},{}for uI,uJ in ipairs(mB)do dh[uJ]=uI end
for uK,mV in ipairs(ad.rarOrder)do dh[mV]=dh[mV]or(20+uK)end for uL,di in pairs(cr)do di.k=uL di.price=di.price or ag.price[di.rar or""]
fb[#fb+1]=di end table.sort(fb,function(bP,bQ)if bP.price and bQ.price and bP.price~=bQ.price then return bP.price<bQ.price end
local mW,mX=dh[bP.rar or""]or 99,dh[bQ.rar or""]or 99 if mW~=mX then return mW<mX end if(bP.i or 100)~=(bQ.i or 100)then return(bP.i or 100)<(bQ.i or 100)end
return bP.k<bQ.k end)return fb end local function uM()local mY=aj:FindFirstChild("Assets")local mZ=mY and mY:FindFirstChild("Squishies")
if not mZ then return false end local h2,m0,cs={},{},{}local fc=0 for Cn,fd in ipairs(mZ:GetChildren())do local dj=aa(fd.Name)
if dj~=""and not h2[dj]then local fe=cq(fd,"RarityText")or"?"h2[dj]=fe m0[dj]=cq(fd,"NameText")or fd.Name cs[fe]=cs[fe]or{}
table.insert(cs[fe],dj)fc=fc+1 end end if fc==0 then return false end for m1,uN in pairs(cs)do local m2=ag.order[m1]or t9[m1]
local h3={}if m2 then for uO,uP in ipairs(m2)do h3[aa(uP)]=uO end end table.sort(uN,function(m3,m4)local h4,h5=h3[m3],h3[m4]
if h4 and h5 then return h4<h5 end if h4 then return true end if h5 then return false end return ah(m3)<ah(m4)
end)end local h6={}for uQ,uR in ipairs(mB)do h6[uR]=uQ end local ff,bR={},{}for uS in pairs(cs)do ff[#ff+1]=uS end
pcall(function()for uT,uU in ipairs(require(aj.Modules.SquishyRNG).Keys)do bR[uU]=uT end end)table.sort(ff,function(ct,cu)
if bR[ct]and bR[cu]and bR[ct]~=bR[cu]then return bR[ct]<bR[cu]end local h7,h8=ag.price[ct],ag.price[cu]if h7 and h8 and h7~=h8 then return h7<h8 end
local h9,h_=h6[ct],h6[cu]if h9 and h_ then return h9<h_ end if h9 then return true end if h_ then return false end
return ct<cu end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=h2,m0,cs,ff,fc,x()return true end local function ia()
if ad.at==0 or(x()-ad.at)>120 then pcall(uM)end return ad.n>0 end local function uV(uW)local m5=aa(uW)return ad.rar[m5]or(W.name and aa(W.name)==m5 and W.rar)or"?"
end local function uX()local fg={}local uY=((d.Best or 0)>0 and next(q.best or{}))and q.best or d.Targets for uZ,u0 in pairs(uY)do if u0 then fg[#fg+1]=ah(uZ)end end
table.sort(fg)return fg end local al={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function m6()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function fh(m7)if type(makefolder)~="function"then return end local u1,u2=pcall(isfolder,m7)if not(u1 and u2)then pcall(makefolder,m7)end
end local function fi(m8)if type(isfile)~="function"or type(readfile)~="function"then return nil end local u3,u4=pcall(isfile,m8)
if not(u3 and u4)then return nil end local u5,u6=pcall(readfile,m8)return u5 and u6 or nil end local function dk(u7,u8)
if type(writefile)~="function"then return false end return(pcall(writefile,u7,u8))end local function m9(u9)local dl={}
if type(listfiles)~="function"then return dl end local u_,m_=pcall(listfiles,u9)if not u_ or type(m_)~="table"then return dl end
for Co,va in ipairs(m_)do dl[#dl+1]=tostring(va)end return dl end local function na()local fj={}for Cp,vb in ipairs(m9(al.cfg))do
local nb=vb:match("([^/\\]+)%.txt$")if nb then fj[#fj+1]=nb end end table.sort(fj)return fj end local function vc()
local ab={"V|1"}ab[#ab+1]="N|Every|"..tostring(d.Every)ab[#ab+1]="N|GlazeLead|"..tostring(d.GlazeLead)ab[#ab+1]="N|FpsCap|"..tostring(d.FpsCap)
ab[#ab+1]="N|MemLimit|"..tostring(d.MemLimit)ab[#ab+1]="N|Best|"..tostring(d.Best or 0)for Cq,nc in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ab[#ab+1]="S|"..nc.."|"..d[nc]end
do local fk={}for vd,dm in pairs(d.Pets)do local nd=(dm.b and"b"or"")..(dm.g and"g"or"")..(dm.w and"w"or"")..((tonumber(dm.f)or 0)>0 and tostring(dm.f)or"")
if nd~=""then fk[#fk+1]=vd.."|"..nd end end table.sort(fk)ab[#ab+1]="P|-"for Cr,ve in ipairs(fk)do ab[#ab+1]="P|"..ve end
end for Cs,ne in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower"})do
ab[#ab+1]="B|"..ne.."|"..(d[ne]and"1"or"0")end local ib=F:GetAttribute("AutoRollRules")if type(ib)=="string"and ib~=""then d.ARrules,d.ARstop=ib,tostring(F:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then ab[#ab+1]="S|rules|"..d.ARrules ab[#ab+1]="S|stop|"..d.ARstop end if c.winPos then ab[#ab+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ab[#ab+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Ct,ic in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fl={}for vf,vg in pairs(ic[2])do if vg then fl[#fl+1]=vf end end table.sort(fl)ab[#ab+1]=ic[1].."|-"for Cu,vh in ipairs(fl)do ab[#ab+1]=ic[1].."|"..vh end
end return table.concat(ab,"\n")end local function vi(ie)if type(ie)~="string"or ie==""then return false end local nf,ng,nh,ni,dn={},false,{},false,nil
for vj in ie:gmatch("[^\n]+")do local aB,ae,aw=vj:match("^(%a)|([^|]*)|?(.*)$")if aB=="N"and ae=="Every"then local ig=tonumber(aw)
if ig and ig>=1 then d.Every=math.floor(ig)end elseif aB=="N"and(ae=="FpsCap"or ae=="MemLimit")then local ih=tonumber(aw)
if ih and ih>=0 then d[ae]=math.floor(ih)end elseif aB=="N"and ae=="Best"then local fm=tonumber(aw)if fm and fm>=0 and fm<=4 then d.Best=math.floor(fm)end
elseif aB=="N"and ae=="GlazeLead"then local fn=tonumber(aw)if fn and fn>=5 and fn<=600 then d.GlazeLead=math.floor(fn)end
elseif aB=="S"and(ae=="TeamNormal"or ae=="TeamFull"or ae=="TeamGlaze"or ae=="TeamWax")then d[ae]=aw elseif aB=="P"and ae~=""then
if not dn then dn={}end if ae~="-"and aw~=""then dn[ae]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aB=="B"then if d[ae]~=nil then d[ae]=(aw=="1")end
elseif aB=="S"and ae=="rules"then d.ARrules=aw elseif aB=="S"and ae=="stop"then d.ARstop=aw elseif aB=="W"then
c.winPos={tonumber(ae)or 10,tonumber(aw)or 44}elseif aB=="G"then c.togPos={tonumber(ae)or 10,tonumber(aw)or 300}
elseif aB=="T"and ae~=""then if ae~="-"then nf[ae]=true end ng=true elseif aB=="K"and ae~=""then if ae~="-"then nh[ae]=true end
ni=true end end if ng then d.Targets=nf end if ni then d.CrateTicks=nh end if dn then d.Pets=dn end return true
end local function fo(cv)if not m6()then return false,"this executor cannot write files"end cv=(cv or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cv==""then return false,"give the config a name"end fh(al.dir)fh(al.cfg)if not dk(al.cfg.."/"..cv..".txt",vc())then return false,"could not write the file"end
c.config=cv return true,cv end local function nj(fp)local nk=fi(al.cfg.."/"..fp..".txt")if not nk then return false,"no config called "..tostring(fp)end
if not vi(nk)then return false,"that config looks empty"end c.config=fp return true,fp end local function nl(ii)
if ii then fh(al.dir)dk(al.auto,ii)elseif type(delfile)=="function"then pcall(delfile,al.auto)else dk(al.auto,"")
end c.autoload=ii end local function vk()if c.selfPath then return c.selfPath end local fq for Cv,vl in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",al.dir})do
for Cw,nm in ipairs(m9(vl))do local ij=nm:lower()if ij:sub(-4)==".lua"and(ij:find("sab_farm",1,true)or ij:find("sab farm",1,true))then
fq=fq or nm end end end c.selfPath=fq return fq end al.stub=[[
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
local function vm()if not m6()then return false,"this executor cannot write files"end fh("autoexec")if not dk(al.exec,al.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fr=(function()local vn,vo=pcall(function()return game:GetService("TeleportService")end)return vn and vo or nil end)()
local function nn()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local vp=queueonteleport or queue_on_teleport return(pcall(vp,al.stub))end local function dp(vq)if c.rejoining then return end
c.rejoining=true z("REJOIN ("..vq..")")pcall(eZ)if c.autoload then pcall(fo,c.autoload)end local vr=nn()z(vr and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Cx=1,30 do if not fr then break end pcall(function()fr:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function vs()local vt,no=pcall(function()return game:GetService("GuiService")end)if vt and no then
pcall(function()V(no.ErrorMessageChanged:Connect(function()if d.Rejoin then dp("roblox error message")end end))
end)end pcall(function()local np=game:GetService("CoreGui")local nq=np and np:WaitForChild("RobloxPromptGui",15)
local nr=nq and nq:WaitForChild("promptOverlay",15)if nr then V(nr.ChildAdded:Connect(function(vu)if d.Rejoin and tostring(vu.Name):lower():find("errorprompt",1,true)then dp("disconnect prompt")end
end))end end)if fr then pcall(function()V(fr.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dp("teleport retry")end)end
end))end)end end local function ns(vv)local nt=c.plot and c.plot:FindFirstChild(vv)if not nt then return nil,false end
for Cy,ik in ipairs(nt:GetChildren())do if ik:IsA("Model")or ik:IsA("BasePart")then return ik,true end end return nil,true
end local function bS()local bp=ns("RolledSquishy")if not bp then return nil end return{model=bp,name=bp.Name,pretty=cq(bp,"NameText")or ah(aa(bp.Name)),
rar=cq(bp,"RarityText")or uV(bp.Name),price=cq(bp,"PriceText")}end local function nu(il)return type(il)=="string"and(ad.rar[aa(il)]~=nil or tX(il))
end local function ac()local im=ns("SquishyEquipped")if im then c.carrySrc,e.heldAt="model",x()return im.Name,im end
local nv=F.Character if nv then for Cz,dq in ipairs(nv:GetDescendants())do if(dq:IsA("Model")or dq:IsA("Tool"))and nu(dq.Name)then
c.carrySrc,e.heldAt="character",x()return dq.Name,dq end end end local fs=F:GetAttribute("SquishyEquipped")if type(fs)=="string"and fs~=""and nu(fs)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fs,nil end c.carrySrc=nil end local function CA()local CB,vw=ac()return vw end local function nw()
local nx=bS()local io=nx and tZ(nx.price)local ip=a6()if io and ip and ip<io*0.5 then return ip,io end end local function bT(vx)
c9[#c9+1]=os.date("%H:%M:%S").." "..vx if#c9>40 then table.remove(c9,1)end end local function vy(bU,ft)if type(bU)~="string"then return end
bT(("Roll(%s,%s)"):format(bU,tostring(ft)))if bU:lower():find("crate",1,true)then e.rolled,e.rolledAt=bU,x()return
end W.seq=W.seq+1 W.name,W.at=bU,x()W.rar=type(ft)=="string"and ft or nil c.rolls=c.rolls+1 if aI(bU)then z(("ROLL %s [%s] = TARGET"):format(bU,tostring(ft)))end
end local function vz(bV)if type(bV)~="table"then return end local fu=bV.butter or bV.itemName if type(fu)~="string"then return end
c.gifts=c.gifts+1 W.gift,W.giftAt=fu,x()if type(bV.giftId)=="string"then local ny=aj:FindFirstChild("Remotes")
local nz=ny and ny:FindFirstChild("GiftThanks")if nz then pcall(function()nz:FireServer(bV.giftId)end)end end
bT("Gift("..fu.." from "..tostring(bV.fromName)..")")z(("GIFT from %s: %s - it will not be waxed"):format(tostring(bV.fromName),fu))
end local function vA()local nA=aj:WaitForChild("Remotes",30)if not c.alive then return end if not nA then z("Remotes folder missing - no roll events")return end
V(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local nB=F:GetAttribute("SquishyEquipped")
if type(nB)=="string"and nB~=""then e.heldAt=x()end end))local vG={SquishyRollAnimation=vy,InitSquishy=function(nC)W.init,W.initAt=tostring(nC),x()bT("Init("..tostring(nC)..")")end,
CrateUpdate=function(cw,nD)pcall(uv,cw)pcall(L.learn,cw)if type(cw)=="table"then local vB=nD==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not vB then return end local vC=not e.waiting local vD=e.on e.waiting,e.data,e.at=true,cw,x()e.on=(nD==true)
e.title=tostring(cw.title or cw.name or"crate")if e.on and not vD then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then bT("CrateWindow open("..e.title..")")elseif vC then bT("Crate waiting("..e.title..")")z(e.title.." is waiting on your stand")
end else if e.waiting then bT("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local vE=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,vE)end if e.classify then local vF=x()
task.spawn(function()pcall(e.classify,vF)end)end end end,GiftReceived=vz,}for fv,vH in pairs(vG)do local iq=nA:FindFirstChild(fv)
if iq and iq:IsA("RemoteEvent")then V(iq.OnClientEvent:Connect(vH))elseif fv~="CrateUpdate"and fv~="GiftReceived"then z("remote "..fv.." missing")end
end end local function ir()local bW=bS()if bW then if aI(bW.name)then return{state="match",shown=bW.pretty,src="pad",info=bW}
end return{state="skip",info=bW,level="idle",text=("on pad: %s [%s] - not ticked"):format(bW.pretty,tostring(bW.rar))}
end if W.name and(x()-W.at)<4 then if aI(W.name)then return{state="match",shown=ah(aa(W.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ah(aa(W.name)),tostring(W.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fw(vI,vJ,vK,vL)
local fy=RaycastParams.new()fy.FilterType=Enum.RaycastFilterType.Exclude local is={F.Character}for CC,vM in ipairs(vL or{})do is[#is+1]=vM end
fy.FilterDescendantsInstances=is pcall(function()fy.RespectCanCollide=true end)local nE=as:Raycast(Vector3 .new(vI,vJ+4,vK),Vector3 .new(0,-30,0),fy)
return nE and nE.Position or nil end local function cx(nF)local nG=nF:FindFirstChildOfClass("Humanoid")return((nG and nG.HipHeight)or 2)+nF.HumanoidRootPart.Size.Y/2+0.2
end local function it(vN,vO)local iu=vN:FindFirstChildOfClass("Humanoid")local vP=x()while x()-vP<vO do if iu and(iu.FloorMaterial~=Enum.Material.Air or iu.SeatPart)then return true end
af(0.05)end return false end local function aC(vQ,iv,iw)local nH=vQ.HumanoidRootPart nH.AssemblyLinearVelocity=Vector3 .new(0,0,0)
nH.CFrame=iw and CFrame.new(iv,Vector3 .new(iw.X,iv.Y,iw.Z))or CFrame.new(iv)end local function cy(a_,nI)local bX=au()
if not bX or not a_ then return false end local bq=a_.Position local fz=math.clamp(math.max(a_.Size.X,a_.Size.Z)/2+2.2,3,7)
local nJ=(nI and nI.MaxActivationDistance)or 10 if fz>nJ-2 then fz=math.max(2.5,nJ-2)end local dr={}local function bY(ds)
ds=Vector3 .new(ds.X,0,ds.Z)if ds.Magnitude>0.05 then dr[#dr+1]=ds.Unit end end local nK=mo()if nK then bY(nK-bq)end
bY(a_.CFrame.LookVector)bY(-a_.CFrame.LookVector)bY(a_.CFrame.RightVector)bY(-a_.CFrame.RightVector)bY(bX.HumanoidRootPart.Position-bq)
if#dr==0 then bY(Vector3 .new(0,0,1))end local vR,fA=cx(bX),false for CD,vS in ipairs(dr)do local fB=bq+vS*fz
local ix=fw(fB.X,bq.Y,fB.Z,{a_})if ix and math.abs(ix.Y-bq.Y)<14 then aC(bX,Vector3 .new(fB.X,ix.Y+vR,fB.Z),bq)
if it(bX,0.7)then fA=true break end end end if not fA then aC(bX,bq+dr[1]*fz+Vector3 .new(0,3,0),bq)fA=it(bX,1)
end af(0.12)return fA end local function nL(dt)if not dt.Parent or not dt.Enabled then return false end pcall(function()dt:InputHoldBegin()end)
af(math.max(dt.HoldDuration,0)+0.08)pcall(function()dt:InputHoldEnd()end)return true end local function ao(nM,vT)
local vU=x()while x()-vU<vT do if nM()then return true end af(0.05)end return nM()end local function du(cz,vV,nN,vW)
local vX=c.zapFirst and{"zap","hold"}or{"hold","zap"}for vY,iy in ipairs(vX)do if vY==2 and(vW or not(cz.Parent and cz.Enabled and(not nN or nN())))then break end
local iz if iy=="hold"then iz=nL(cz)else iz=type(fireproximityprompt)=="function"and cz.Parent~=nil and cz.Enabled and pcall(fireproximityprompt,cz)end
if iz and ao(vV,1.2)then c.zapFirst=(iy=="zap")return true,iy end end return false end local function nO(iA)local br=mz()
if not br or not br.Enabled then z("buy: nothing on the pad")return false end local nP=db(br)if not nP then z("buy: pad part missing")return false end
c.lastBuyAt=x()local vZ,nQ=W.seq,a6()cy(nP,br)if not br.Enabled then z("buy aborted: pad emptied")return false end
local cA=ir()if not iA and cA.state~="match"then z("buy aborted: "..(cA.text or"pad changed"))c.matchSince=nil
return false end local iB=cA.info and cA.info.name or(cA.state=="match"and W.name)or nil local function v0()return br.Enabled and ac()==nil and(iA or ir().state=="match")
end local v1,v2=du(br,function()return ac()~=nil or((not br.Enabled)and(iA or W.seq==vZ))end,v0,nw()~=nil)if v1 then
ao(function()return ac()~=nil end,0.8)local dv=ac()local nR=a6()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil W.name,W.rar,W.at=nil,nil,x()z(("BOUGHT %s%s via %s"):format(dv and ah(aa(dv))or(cA.shown or"?"),(nQ and nR)and(" for $"..aJ(nQ-nR))or"",v2))
if dv and iB and aa(dv)~=aa(iB)then z(("note: picked up %s, not %s"):format(dv,iB))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local nS=bS()z(("BUY REFUSED: cash short? have $%s, price %s"):format(aJ(a6()),(nS and nS.price)or"?"))
return false end local function nT()local dw=ac()if not dw then c.holding=false z("place: hands are empty")return false
end if not aI(dw)then z(("REFUSED TO WAX %s - it is not ticked"):format(ah(aa(dw))))return false end for CE=1,d.PlaceTries do
local bs=t8()if not bs then z("place: no free station")break end local nU=db(bs)if nU then cy(nU,bs)local nV=ac()
if not nV then c.holding=false z("place: hands emptied on the way")return false end if not aI(nV)then z("place: what I carry changed, not waxing it")return false end
if bs.Enabled then local v3,v4=du(bs,function()return not bs.Enabled end,function()return bs.Enabled end)if v3 then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 W.name,W.rar,W.at=nil,nil,x()
z(("WAXED %s #%d at %s via %s"):format(ah(aa(dw)),c.placed,bs.Parent.Parent.Name,v4))if q.placed then pcall(q.placed,dw)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end z("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))z(c.capMsg)end return false end function y.place()local v5=x()while c.alive and y.editing and x()-v5<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then y.placing=true local v6=x()while c.alive and y.current()~=d.TeamWax and x()-v6<5 do af(0.1)end
if y.current()==d.TeamWax then af(0.3)else z("wax team did not come on in time - placing anyway")end end local v7,nW=pcall(nT)
y.placing=false if not v7 then error(nW,0)end return nW end local function nX(nY)return type(nY)=="string"and nY:lower():find("crate",1,true)~=nil
end local v8={SABFarmGui=1,SABToggle=1,SABError=1}local function iC(v9)local bt=v9 while bt do if v8[bt.Name]then return false end
if bt:IsA("ScreenGui")then local v_,wa=pcall(function()return bt.Enabled end)return(not v_)or wa~=false end if bt:IsA("GuiObject")and not bt.Visible then return false end
bt=bt.Parent end return false end local function fC(fD)local cB=""pcall(function()if fD:IsA("TextButton")then cB=fD.Text end end)
if not cB:find("%a")then for CG,fE in ipairs(fD:GetDescendants())do if(fE:IsA("TextLabel")or fE:IsA("TextButton"))and fE.Text:find("%a")then cB=fE.Text break end
end end if not cB:find("%a")then cB=fD.Name end return(cB:lower():gsub("[^%a]",""))end local function wb()local dx,dy
local nZ=F:FindFirstChildOfClass("PlayerGui")if not nZ then return nil,nil end for CH,dz in ipairs(nZ:GetDescendants())do
if dz:IsA("GuiButton")and iC(dz)then local iD=fC(dz)if iD:sub(1,4)=="open"and not iD:find("shop",1,true)then dx=dx or dz end
if iD:sub(1,7)=="discard"then dy=dy or dz end end end if dx and dy then return dx,dy end if e.on then return dx,dy end
return nil,nil end local iE=(function()local wc,wd=pcall(function()return game:GetService("VirtualInputManager")end)return wc and wd or nil end)()
local function n0(ba,iF)local iG={}local function n1(we)iG[#iG+1]=we end if c.tapWay then n1(c.tapWay)end for CI,n2 in ipairs({"touch","conn","signal"})do
if n2~=c.tapWay then n1(n2)end end local function n3(wf,...)local wg,iH=pcall(getconnections,wf)if not(wg and type(iH)=="table"and#iH>0)then return false end
local n4,wh,wi=false,{...},select("#",...)for CJ,wj in ipairs(iH)do if pcall(function()wj:Fire(table.unpack(wh,1,wi))end)then n4=true end
end return n4 end local function n5()local n6=Vector3 .new(0,0,0)pcall(function()local n7,n8=ba.AbsolutePosition,ba.AbsoluteSize
n6=Vector3 .new(n7 .X+n8 .X/2,n7 .Y+n8 .Y/2,0)end)local iI={Position=n6,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()iI.UserInputType=Enum.UserInputType.Touch end)pcall(function()iI.UserInputState=Enum.UserInputState.End end)
return iI end for CK,bc in ipairs(iG)do local dA=false if bc=="conn"and type(getconnections)=="function"then if n3(ba.MouseButton1Click)then
dA=true if ao(iF,1.5)then c.tapWay=bc return true,bc end end dA=n3(ba.Activated,n5(),1)elseif bc=="signal"and type(firesignal)=="function"then
if pcall(firesignal,ba.MouseButton1Click)then if ao(iF,1.5)then c.tapWay=bc return true,bc end end dA=pcall(firesignal,ba.Activated,n5(),1)
elseif bc=="touch"and iE then dA=pcall(function()local n9,n_=ba.AbsolutePosition,ba.AbsoluteSize local oa=0 local ob=ba:FindFirstAncestorWhichIsA("ScreenGui")
local wk,wl=pcall(function()return ob and ob.IgnoreGuiInset end)if not(wk and wl)then pcall(function()oa=game:GetService("GuiService"):GetGuiInset().Y end)
end local oc,od=n9 .X+n_.X/2,n9 .Y+n_.Y/2+oa iE:SendMouseButtonEvent(oc,od,0,true,game,1)task.wait(0.06)iE:SendMouseButtonEvent(oc,od,0,false,game,1)
end)end if dA and ao(iF,1.5)then c.tapWay=bc return true,bc end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function iJ(oe)local dB=oe.Parent while dB and dB~=c.plot do if e.NOT[dB.Name]then return false end dB=dB.Parent
end local iK=(oe.ActionText or""):lower()if iK:find("roll",1,true)or iK:find("place",1,true)or iK:find("sell",1,true)then return false end
return true end local function wm()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local of=c.plot:FindFirstChild("CrateStand")local dC if of then for CL,fF in ipairs(of:GetDescendants())do
if fF:IsA("ProximityPrompt")and fF.Enabled and iJ(fF)then dC=fF break end end end if not dC then for CM,bu in ipairs(c.plot:GetDescendants())do
if bu:IsA("ProximityPrompt")and bu.Enabled and iJ(bu)then local og=bu:FindFirstAncestorWhichIsA("Model")local wn=((bu.ActionText or"").." "..(bu.ObjectText or"").." "..bu.Name.." "..(og and og.Name or"")):lower()
if wn:find("crate",1,true)then dC=bu break end end end end e.prompt=dC return dC end local function iL()if e.on then return true end
local dD=wm()if not dD then e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local oh=db(dD)if oh then cy(oh,dD)end e.ours=true du(dD,function()return e.on end)if ao(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: pressed "..eU(dD).." but no window came up")
return false end do local function wo(oi)local cC=oi.Parent while cC and cC:IsA("GuiObject")do local oj,ol=false,false
for CN,dE in ipairs(cC:GetDescendants())do if dE~=oi and dE:IsA("GuiButton")and fC(dE):sub(1,7)=="discard"then oj=true end
if dE:IsA("TextLabel")then local iM=dE.Text:lower()if iM:find("crate",1,true)or iM:find("can contain",1,true)or iM:find("cost",1,true)then ol=true end
end if oj and ol then return cC end end cC=cC.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local om=F:FindFirstChildOfClass("PlayerGui")if not om then return nil end for CO,fG in ipairs(om:GetDescendants())do
if fG:IsA("GuiButton")and not fG:FindFirstAncestor("SABFarmGui")and fC(fG):sub(1,4)=="open"then local iN=wo(fG)
if iN then e.win=iN return iN end end end end local function wp(wq)for CP,fH in ipairs(wq:GetDescendants())do
if fH:IsA("GuiButton")then local oo,iO=fC(fH),fH.Name:lower()if oo=="x"or oo=="close"or iO=="x"or iO:find("close",1,true)or iO:find("exit",1,true)then return fH end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(wr)task.wait(wr and 4 or 1.2)if e.on or e.waiting then return end
local fI=e.findWin()if not fI or not iC(fI)then return end local op=wp(fI)if op and n0(op,function()return not iC(fI)end)then return end
z("the crate window is still open - tap its X")end end local function fJ(fK)if not iL()then return false end local oq=x()-(e.openedAt or 0)
if oq<0.6 then af(0.6-oq)end local iP=e.title local ws,wt=wb()local ot=fK and ws or wt if not ot then e.lastFail=x()
c.crateFails=c.crateFails+1 z(("crate: no %s button found in %s"):format(fK and"Open"or"Discard",iP))return false
end local wu=ac()local wv,CQ=n0(ot,function()return(not e.on)or(ac()~=nil and ac()~=wu)end)if not wv then e.lastFail=x()
c.crateFails=c.crateFails+1 z("crate: could not press "..(fK and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fK then c.crates=c.crates+1 ao(function()return ac()~=nil end,1.5)local ou=ac()
z(("OPENED %s -> %s"):format(iP,ou and ah(aa(ou))or"?"))else z("discarded "..iP.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(ww,...)local wx=select("#",...)e.calls[#e.calls+1]={t=x(),m=ww,n=wx,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aD,bd)local bv=type(aD)if(bv=="string"or bv=="number")and type(bd.data)=="table"then for ov,iQ in pairs(bd.data)do
if iQ==aD and type(ov)=="string"and(type(iQ)=="string"or type(iQ)=="number")then return{__slot="f:"..ov}end end
end if bv=="string"then if bd.crate and aD==bd.crate then return{__slot="crate"}end if bd.title and aD==bd.title then return{__slot="title"}end
if bd.rar and aD==bd.rar then return{__slot="rarity"}end return aD end if bv=="number"or bv=="boolean"or bv=="nil"then return aD end
if bv=="table"then local ow={}for wy,ox in pairs(aD)do if type(ox)=="table"then return nil,"nested table"end local wz,oy=e.slot(ox,bd)
if oy then return nil,oy end ow[wy]=wz end return ow end local wA,wB=pcall(function()return aD:IsA("Instance")end)
if wA and wB then if aD==F then return{__slot="player"}end if c.plot and aD==c.plot then return{__slot="plot"}end
local fL=c.plot and c.plot:FindFirstChild("CrateStand")if fL and aD==fL then return{__slot="stand"}end if fL and aD.Parent==fL then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bv..")"end function e.resolve(fM)if type(fM)~="table"then return fM end
local aO=fM.__slot if aO and aO:sub(1,2)=="f:"then return e.data and e.data[aO:sub(3)]end if aO=="crate"then return e.data and e.data.name end
if aO=="title"then return(e.data and e.data.title)or e.title end if aO=="rarity"then return e.data and e.data.rarity end
if aO=="player"then return F end if aO=="plot"then return c.plot end if aO=="stand"or aO=="model"then local iR=c.plot and c.plot:FindFirstChild("CrateStand")
if aO=="stand"or not iR then return iR end for CS,oz in ipairs(iR:GetChildren())do if nX(oz.Name)then return oz end end
return nil end local oA={}for wC,wD in pairs(fM)do oA[wC]=e.resolve(wD)end return oA end function e.classify(iS)
if e.directOff then return end local fN={}for CT,iT in ipairs(e.calls)do if iT.t<=iS+0.05 and iS-iT.t<=6 then fN[#fN+1]=iT end
end if#fN==0 then return end if not ao(function()return(e.heldAt or 0)>=iS-1 end,2.5)then return end local dF={}
for CU,dG in ipairs(fN)do local oB={}for oC=1,dG.n do local wE,oD=e.slot(dG.args[oC],dG)if oD then z("crate call has "..oD.." - keeping the button method")
return end oB[oC]=wE end dF[#dF+1]={m=dG.m,n=dG.n,args=oB}end local iU=e.learned e.learned={seq=dF,mode=iU and iU.mode or nil}
ag.dirty=true if not iU then z(("learned how to open crates directly (%d call%s)"):format(#dF,#dF==1 and""or"s"))end
end function e.replay()local oE=e.learned local oF=aj:FindFirstChild("Remotes")local iV=oF and oF:FindFirstChild("CrateAction")
if not(oE and iV)then return false end local oG=table.unpack or unpack e.replaying=true for CV,dH in ipairs(oE.seq)do
local iW={}for oH=1,dH.n do iW[oH]=e.resolve(dH.args[oH])end task.spawn(function()pcall(function()if dH.m=="InvokeServer"then iV:InvokeServer(oG(iW,1,dH.n))
else iV:FireServer(oG(iW,1,dH.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(wF)return(wF:gsub("[%%|;=,\n]",function(wG)return("%%%02X"):format(wG:byte())end))end
function e.enc(bZ)local fO=type(bZ)if fO=="string"then return"s"..e.esc(bZ)end if fO=="number"then return"n"..tostring(bZ)end
if fO=="boolean"then return bZ and"b1"or"b0"end if fO=="nil"then return"z"end if bZ.__slot then return"k"..bZ.__slot end
local iX={}for wH,wI in pairs(bZ)do iX[#iX+1]=e.enc(wH).."="..e.enc(wI)end return"t"..table.concat(iX,",")end
function e.dec(oI)local dI,dJ=oI:sub(1,1),oI:sub(2)local function wJ(wK)return(wK:gsub("%%(%x%x)",function(wL)return string.char(tonumber(wL,16))end))end
if dI=="s"then return wJ(dJ)end if dI=="n"then return tonumber(dJ)end if dI=="b"then return dJ=="1"end if dI=="k"then return{__slot=dJ}end
if dI=="t"then local oJ={}for wM in dJ:gmatch("[^,]+")do local oK,wN=wM:match("^(.-)=(.*)$")if oK then local oL=e.dec(oK)
if oL~=nil then oJ[oL]=e.dec(wN)end end end return oJ end return nil end function e.goneOrNew(wO)return function()
if not e.waiting then return true end local oM=ac()return oM~=nil and oM~=wO end end function e.near()local oN=aj:FindFirstChild("Remotes")
local oO=oN and oN:FindFirstChild("CrateAction")local iY=au()local iZ=c.plot and c.plot:FindFirstChild("CrateStand")
local i0=iZ and iZ:FindFirstChild("Spot")if not(oO and iY and i0)then return false,"no crate stand or remote"end
local i1=iY.HumanoidRootPart local fP=i1 .CFrame local oP,i2=e.title,"no answer"local wP=ac()local oQ=iZ:FindFirstChild("Holder")
local function oR()if not oQ then return e.waiting or e.on end for CW,wQ in ipairs(oQ:GetChildren())do if wQ:IsA("Model")then return true end end
return false end for wR=1,3 do if not(e.waiting or e.on)or not oR()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(i1 .Position-i0 .Position).Magnitude>8 then cy(i0,e.prompt)end af(0.12+0.15*wR)
local aZ={}e.replaying=true task.spawn(function()aZ.ok,aZ.v=pcall(function()return oO:InvokeServer("open")end)
aZ.done=true end)ao(function()return aZ.done end,6)e.replaying=false local b0=aZ.v if aZ.done and aZ.ok and type(b0)=="table"and b0 .ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 z(("OPENED %s -> %s (no window)"):format(oP,b0 .prize and ah(aa(tostring(b0 .prize)))or"?"))
ao(function()local oS=ac()return oS~=nil and oS~=wP end,1.5)if(i1 .Position-fP.Position).Magnitude>8 then pcall(function()aC(iY,fP.Position,fP.Position+fP.LookVector)end)end
return true,"opened"end i2=(aZ.done and aZ.ok and type(b0)=="table")and tostring(b0 .reason or"refused, no reason given")
or(aZ.done and("error: "..tostring(b0))or"no answer in 6s")af(0.3)if not oR()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 z(("crate: the server would not open %s next to the stand (%s)"):format(oP,i2))
return false,i2 end function e.smart()local i3=e.title if(e.nearFails or 0)<3 then local wS=e.near()if wS then return true end
if e.nearFails>=3 then z("opening next to the stand failed 3 times - trying the older ways")end end local b1=e.learned
if b1 then local i4=ac()if e.on then e.replay()if ao(e.goneOrNew(i4),3.5)then c.crates=c.crates+1 z("OPENED "..i3 .." (direct)")
return true end else if b1 .mode~="window"then e.replay()if ao(e.goneOrNew(i4),3.5)then c.crates,e.fails=c.crates+1,0
if b1 .mode~="direct"then b1 .mode,ag.dirty="direct",true z("crates now open directly - the window never comes up")
end z("OPENED "..i3 .." (direct, no window)")return true end end if iL()then e.replay()if ao(e.goneOrNew(i4),3.5)then
c.crates,e.fails=c.crates+1,0 if b1 .mode~="window"then b1 .mode,ag.dirty="window",true z("crates need their window up first - it shows briefly")
end z("OPENED "..i3 .." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ag.dirty=b1,nil,true
if e.fails>=3 then e.directOff=true z("direct crate opening failed 3 times - using the button for now")else z("the learned crate call did not work - back to pressing Open")
end end return fJ(true)end function C.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end C.cache={}function C.watchCache()C.cache=C.snap()
for wT,oT in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(F:GetAttributeChangedSignal(oT):Connect(function()C.cache[wT]=F:GetAttribute(oT)end))
end end function C.isOn()return F:GetAttribute("AutoRollOn")==true end function C.saw(wU,...)local fQ=C.cache
local wV={m=wU,n=select("#",...),args={...},before={rules=fQ.rules,stop=fQ.stop,on=fQ.on,main=fQ.main}}task.delay(1.5,function()
if c.alive then pcall(C.learnOne,wV)end end)end function C.learnOne(dK)local ax,dL=C.snap(),dK.before local fR=(ax.rules~=dL.rules)or(ax.stop~=dL.stop)
local oU=(ax.on~=dL.on)or(ax.main~=dL.main)if not fR and not oU then return end local oV={}for oW=1,dK.n do local aK=dK.args[oW]
local b2=type(aK)if b2=="string"and aK~=""and aK==ax.rules then aK={__slot="rules"}elseif b2=="string"and aK~=""and fR and aK==ax.stop and ax.stop~=dL.stop then aK={__slot="stop"}
elseif b2=="table"then local oX={}for wW,cD in pairs(aK)do if type(cD)=="table"or(type(cD)=="userdata")then C.msg="Auto Roll sends something I cannot repeat"return
end oX[wW]=(type(cD)=="string"and cD~=""and cD==ax.rules)and{__slot="rules"}or cD end aK=oX elseif b2~="string"and b2~="number"and b2~="boolean"and b2~="nil"then
if aK==F then aK={__slot="player"}else C.msg="Auto Roll sends something I cannot repeat"return end end oV[oW]=aK
end local cE={m=dK.m,n=dK.n,args=oV}if fR then local i5=false for wX=1,cE.n do local dM=cE.args[wX]if type(dM)=="table"and dM.__slot=="rules"then i5=true end
if type(dM)=="table"and not dM.__slot then for CX,oY in pairs(dM)do if type(oY)=="table"and oY.__slot=="rules"then i5=true end end
end end if i5 then C.rec.rules={cE}else table.insert(C.rec.rules,cE)if#C.rec.rules>60 then table.remove(C.rec.rules,1)end
end end if oU then if ax.on==true then C.rec.on=cE else C.rec.off=cE end d.AutoRoll=(ax.on==true)end if ax.rules and ax.rules~=""then d.ARrules,d.ARstop=ax.rules,ax.stop or""end
ag.dirty=true C.msg=""z(("learned an Auto Roll %s message"):format(fR and"choices"or(ax.on and"on"or"off")))end
function C.resolve(cF)if type(cF)~="table"then return cF end if cF.__slot=="rules"then return d.ARrules~=""and d.ARrules or F:GetAttribute("AutoRollRules")end
if cF.__slot=="stop"then return d.ARstop~=""and d.ARstop or F:GetAttribute("AutoRollStop")end if cF.__slot=="player"then return F end
local oZ={}for wY,wZ in pairs(cF)do oZ[wY]=C.resolve(wZ)end return oZ end function C.replay(o0,w0)local o1=table.unpack or unpack
for CY,dN in ipairs(w0)do local i6={}for o2=1,dN.n do i6[o2]=C.resolve(dN.args[o2])end C.replaying=true pcall(function()
if dN.m=="InvokeServer"then task.spawn(function()pcall(function()o0:InvokeServer(o1(i6,1,dN.n))end)end)else o0:FireServer(o1(i6,1,dN.n))end
end)C.replaying=false task.wait(0.25)end end function C.apply(o3,w1)if C.busy or not c.alive then return end C.busy=true
pcall(function()local o4=aj:FindFirstChild("Remotes")local i7=o4 and o4:FindFirstChild("AutoRollAction")if not i7 then C.msg="this game has no AutoRollAction"return end
local bw=d.AutoRoll if bw and d.ARrules~=""and F:GetAttribute("AutoRollRules")~=d.ARrules then if#C.rec.rules==0 then
C.msg="pick your Auto Roll choices once in the game's menu so I can learn them"z(C.msg)else C.replay(i7,C.rec.rules)
if ao(function()return F:GetAttribute("AutoRollRules")==d.ARrules end,4)then z("Auto Roll choices put back")else
C.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"z(C.msg)end end end if bw==C.isOn()or(not bw and not w1)then return end
local fS=bw and C.rec.on or C.rec.off if not fS then local dO=bw and C.rec.off or C.rec.on local o5=dO~=nil for w2=1,dO and dO.n or 0 do
if type(dO.args[w2])=="boolean"then o5=false end end if o5 then fS=dO end end if not fS then C.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bw and"on"or"off")
z(C.msg)return end C.replay(i7,{fS})if ao(function()return C.isOn()==bw end,4)then C.msg=""z(("Auto Roll switched %s%s"):format(bw and"ON"or"OFF",o3 and(" ("..o3 ..")")or""))
else C.msg="Auto Roll did not switch - do it once in the game so I can relearn it"z(C.msg)end end)C.busy=false
end l.HS=game:GetService("HttpService")l.uid=(function()local w3,w4=pcall(function()return F.UserId end)return w3 and w4 or 0 end)()
l.buyMsg,l.wishMsg,l.wishN="","",0 function l.info()if l.I then return l.I end local w5,i8=pcall(function()return require(aj:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if w5 and type(i8)=="table"and type(i8 .Pets)=="table"then l.I=i8 end return l.I end function l.order()if l.list then return l.list end
local bx=l.info()if not bx then return{}end local b3={}if type(bx.Order)=="table"and#bx.Order>0 then for CZ,o6 in ipairs(bx.Order)do if bx.Pets[o6]then b3[#b3+1]=o6 end end
else for w6 in pairs(bx.Pets)do b3[#b3+1]=w6 end table.sort(b3,function(w7,w8)return(bx.Pets[w7].price or 0)<(bx.Pets[w8].price or 0)end)
end l.list=b3 return b3 end function l.nice(o7,i9)local o8=l.info()local o9=o8 and o8 .Pets[o7]return((i9 and i9~="")and(i9 .." ")or"")..(o9 and o9 .displayName or tostring(o7))
end function l.data()local fT=F:GetAttribute("PetsData")if type(fT)~="string"then return nil end if fT==l.rawD then return l.lastD end
local w9,dP=pcall(function()return l.HS:JSONDecode(fT)end)dP=(w9 and type(dP)=="table")and dP or nil l.rawD,l.lastD=fT,dP
return dP end function l.pen()return aj:FindFirstChild("PetMeadowSpawns")end function l.srv()return as:GetServerTimeNow()end
function l.money()local i_=F:FindFirstChild("MoneyValue")if i_ and type(i_.Value)=="number"then return i_.Value end
return a6()or 0 end function l.wishes()local o_=l.pen()local pa=o_ and o_:GetAttribute("Wishes")local ja,pb={},l.srv()
if type(pa)~="string"then return ja end local w_,pc=pcall(function()return l.HS:JSONDecode(pa)end)if w_ and type(pc)=="table"then
for xa,jb in pairs(pc)do if type(jb)=="number"and jb>pb then ja[xa]=jb-pb end end end return ja end function l.call(...)
local pd=aj:FindFirstChild("Remotes")local pe=pd and pd:FindFirstChild("PetRequest")if not pe then return nil end
local pf=table.pack(...)local b4={}task.spawn(function()b4 .ok,b4 .v=pcall(function()return pe:InvokeServer(table.unpack(pf,1,pf.n))end)
b4 .done=true end)local xb=x()while not b4 .done and x()-xb<6 do task.wait(0.05)end if b4 .done and b4 .ok then return b4 .v end
return nil end function l.want(xc)return d.Pets[xc]end function l.closeNaming(jc)local ph=pcall(function()local pg=F:FindFirstChild("PlayerScripts")
local xd=pg and pg:FindFirstChild("Naming",true)require(xd).close()end)af(0.5)if jc.Visible then pcall(function()local pj=jc:FindFirstChild("NameBox",true)if pj then pj:ReleaseFocus()end end)
jc.Visible=false ph=false end return ph end function l.skipNaming()l.namingUntil=x()+10 if l.namingOn then return end
l.namingOn=true task.spawn(function()while c.alive and x()<l.namingUntil do local pk=F:FindFirstChildOfClass("PlayerGui")
local pl=pk and pk:FindFirstChild("MainGui")local fU=pl and pl:FindFirstChild("PetNameGui")if fU and fU.Visible then
af(0.4)if fU.Visible then l.namingShut=(l.namingShut or 0)+1 pcall(l.closeNaming,fU)break end end af(0.25)end
l.namingOn=false end)end function l.buyTick()if not d.PetBuy then l.buyMsg="auto adopt is off"return end local jd,pm,fV=l.info(),l.pen(),l.data()
if not(jd and pm and fV)then l.buyMsg="pet data not loaded yet"return end l.tryAt=l.tryAt or{}local dQ,je=#(fV.pets or{}),tonumber(fV.maxOwned)or 60
local xe,pn,dR=l.srv(),{},nil for C0,aP in ipairs(pm:GetChildren())do pn[aP.Name]=true local b5,fW=aP:GetAttribute("Pet"),aP:GetAttribute("Variant")or""
local jf=b5 and l.want(b5)if jf and jf.b and jd.Pets[b5]and(not jf.g or fW=="Big")and A.wantMore(b5,fW,fV)and not aP:GetAttribute("A_"..l.uid)
and(tonumber(aP:GetAttribute("ExpiresAt"))or 0)>xe+1 and x()>=(l.tryAt[aP.Name]or 0)then local dS,po=l.nice(b5,fW),jd.Pets[b5].price or 0
if dQ>=je then dR=("%s is in the pen, but you have %d/%d pets"):format(dS,dQ,je)l.tryAt[aP.Name]=x()+15 elseif l.money()<po then
dR=("%s is in the pen - need $%s"):format(dS,aJ(po))l.tryAt[aP.Name]=x()+5 else l.tryAt[aP.Name]=x()+8 local by=l.call("adopt",aP.Name)
if type(by)=="table"and by.ok then dQ=dQ+1 l.buys=(l.buys or 0)+1 l.recent=l.recent or{}local xf=type(by.pet)=="table"and by.pet or{}
table.insert(l.recent,{id=tostring(xf.id or("?"..x())),name=b5,variant=fW,at=x()})if#l.recent>30 then table.remove(l.recent,1)end
z("ADOPTED "..dS)l.skipNaming()dR="adopted "..dS else local pp=type(by)=="table"and tostring(by.reason or"no reason given")or"no answer"
z(("adopt %s failed: %s"):format(dS,pp))dR="adopt failed: "..pp if type(by)=="table"and by.bagFull then l.tryAt[aP.Name]=x()+60 end
end end end end for pq in pairs(l.tryAt)do if not pn[pq]then l.tryAt[pq]=nil end end l.buyMsg=dR or("watching the pen (%d/%d pets)"):format(dQ,je)
end function l.wishTick()if not d.PetWish then l.wishMsg="auto wish is off"return end local fX=l.info()if not(fX and l.pen())then l.wishMsg="pet data not loaded yet"return end
l.wishTry,l.wishWhy=l.wishTry or{},l.wishWhy or{}local fY,jg,bz=l.wishes(),0,nil local xg=(type(fX.Wish)=="table"and fX.Wish.cashShare)or 2
local xh=l.data()for C1,az in ipairs(l.order())do local ps=l.want(az)if ps and ps.w and A.wantMore(az,"",xh)then
jg=jg+1 if not fY[az]and x()>=(l.wishTry[az]or 0)then local jh=tonumber(F:GetAttribute("PetWishCredits"))or 0
local ji=math.floor((fX.Pets[az].price or 0)*xg)if jh<=0 and l.money()<ji then l.wishTry[az]=x()+10 bz=("need $%s to wish for %s"):format(aJ(ji),l.nice(az))
l.wishWhy[az]=bz else l.wishTry[az]=x()+3 local xi=jh>0 and"wishCredit"or"wish"local fZ=l.call(xi,az)if type(fZ)=="table"and fZ.ok then
l.wishN,l.wishWhy[az]=l.wishN+1,nil z(("WISHED for %s (%s)"):format(l.nice(az),jh>0 and"free wish"or("$"..aJ(ji))))
else local jj=type(fZ)=="table"and tostring(fZ.reason or"no reason given")or"no answer"if jj:lower():find("already",1,true)then l.wishTry[az]=x()+2
else z(("wish %s failed: %s"):format(l.nice(az),jj))bz="wish failed: "..jj end end end end end end if not bz then
for C2,f0 in ipairs(l.order())do local pt=l.want(f0)if pt and pt.w and not fY[f0]and l.wishWhy[f0]then bz=l.wishWhy[f0]break end
end end if not bz then local f1={}for C3,f2 in ipairs(l.order())do local pu=l.want(f2)if pu and pu.w and fY[f2]then f1[#f1+1]=("%s %dm"):format(l.nice(f2),math.ceil(fY[f2]/60))end
end bz=jg==0 and"no pet has WISH ticked"or("running: "..(#f1>0 and table.concat(f1,", ")or"none yet"))end l.wishMsg=bz
end y.switches,y.glazed,y.finished=0,0,0 y.done,y.doneN,y.later={},0,{}function y.teams()local jk=l.data()return(jk and jk.teams)or{},jk
end function y.current(cG)cG=cG or l.data()if not cG then return""end local pv={}for C4,xj in ipairs(cG.equipped or{})do pv[tostring(xj)]=true end
for C5,pw in ipairs(cG.teams or{})do local px=pw.pets or{}local jl=#px==#(cG.equipped or{})if jl then for C6,xk in ipairs(px)do if not pv[tostring(xk)]then jl=false break end end end
if jl then return pw.name end end return""end function y.equip(jm)local xl,xm=y.teams()local jn for xn,xo in ipairs(xl)do if xo.name==jm then jn=xn break end end
if not jn then y.msg="no saved team called "..tostring(jm)return false end if y.current(xm)==jm then return true end
for C7=1,4 do local py=l.call("teamEquip",jn)if type(py)=="table"and py.ok then y.switches=y.switches+1 return true
end task.wait(0.4)end return false end function y.left(xp)local pz=xp:FindFirstChild("SquishyPlaceHolder")local pA=pz and pz:FindFirstChild("TimerGui")
local pB=pA and pA:FindFirstChildWhichIsA("TextLabel",true)local jo=pB and pB.Text if type(jo)~="string"or jo:find("-",1,true)then return nil end
local jp,pC,pD=jo:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not jp then return nil end local pE=pD~=""and(tonumber(jp)*3600+tonumber(pC)*60+tonumber(pD))or(tonumber(jp)*60+tonumber(pC))
return pE>0 and pE or nil end function y.waxes()local dT={}local pF=c.plot and c.plot:FindFirstChild("WaxStations")
if not pF then return dT end local pG=l.srv()for C8,a0 in ipairs(pF:GetChildren())do local jq=tonumber(a0:GetAttribute("PourEnd"))
local pH=a0:GetAttribute("PourOwner")if a0:GetAttribute("HasSquishy")and a0:GetAttribute("PourId")and(pH==nil or pH==l.uid)then
local jr=y.left(a0)local pI=jr and(pG+jr)or((jq and jq>pG)and jq or nil)if pI then local pJ,pK=a0:FindFirstChild("SquishyPlaceHolder"),"?"
if pJ then for C9,pL in ipairs(pJ:GetChildren())do if pL:IsA("Model")then pK=pL.Name break end end end local xq=tostring(a0:GetAttribute("Helpers")or"")
local js=0 for C_ in xq:gmatch("%d+")do js=js+1 end dT[#dT+1]={st=a0,ends=pI,sure=jr~=nil,id=a0:GetAttribute("PourId"),name=pK,helps=js,
long=a0:GetAttribute("PourLong")==true}end end end table.sort(dT,function(xr,xs)return xr.ends<xs.ends end)return dT
end function y.glazeCount()local pM=aj:FindFirstChild("Remotes")local pN=pM and pM:FindFirstChild("EditStack")
if not pN then return nil end local xt,dU=pcall(function()return pN:InvokeServer("State",nil)end)if not(xt and type(dU)=="table"and type(dU.state)=="table")then return nil end
local jt,ju=0,{}for Da,f3 in ipairs(dU.state.entries or{})do if f3 .glaze and f3 .glaze~=""then jt=jt+1 ju[f3 .glaze]=(ju[f3 .glaze]or 0)+1 end
end return jt,ju,#(dU.state.entries or{}),dU.state.capacity end function y.finishedOne(f4,pO)y.finished=y.finished+1
task.wait(2)local jv,xu,pP,xv=y.glazeCount()if jv and pO and jv>pO then y.glazed=y.glazed+1 local jw={}for xw,xx in pairs(xu)do jw[#jw+1]=xw.." "..xx end
z(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ah(aa(f4 .name)),f4 .st.Name,jv,table.concat(jw,", ")))
else z(("wax done on station %s: %s, no glaze%s"):format(f4 .st.Name,ah(aa(f4 .name)),pP and(" (stack "..pP.."/"..tostring(xv)..")")or""))
end end function y.tick()y.list=y.waxes()if y.editing and x()-(y.editingSince or x())>120 then y.editing=false end
if y.editing then y.msg="rebuilding teams..."return end if not d.Teams then y.want,y.msg="","auto teams is off"return end
local b6=l.srv()local aE=y.glazeFor if aE then local dV=aE.st local pQ=dV.Parent and dV:GetAttribute("HasSquishy")and dV:GetAttribute("PourId")==aE.id
local pR=pQ and y.left(dV)if pR then aE.ends=b6+pR end if not pQ then y.glazeFor,y.afterUntil=nil,x()+1.5 if not y.done[aE.id or"?"]then
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
jx and("in "..y.clock(jx.ends-b6).." (st "..jx.st.Name..")")or"- none running")end function y.clock(bA)bA=math.max(0,math.floor(bA))
if bA>=3600 then return("%d:%02d:%02d"):format(math.floor(bA/3600),math.floor((bA%3600)/60),bA%60)end return("%d:%02d"):format(math.floor(bA/60),bA%60)
end function y.allBusy()local xA,xC=eW()return xC>0 and xA==0 end function y.aboutToPlace()if not c.running then return false end
local pS=ac()if not(pS and aI(pS))then return false end local xD=eW()return xD>0 end function y.mult(pT,xE,pU)return{(1+pT)*(1+pU),(1+pT+xE)*(1+pU)}end
function y.speedNow()local function jy(xF)return tonumber(F:GetAttribute(xF))or 0 end return y.mult(jy("PetWaxSpeed"),jy("PetLongWax"),jy("PetSocialWax"))
end function y.speedOf(xG)local xH,pV=y.teams()if not pV then return nil end for Dc,pW in ipairs(xH)do if pW.name==xG then
local jz={}for Dd,xI in ipairs(pW.pets or{})do for De,pX in ipairs(pV.pets or{})do if tostring(pX.id)==tostring(xI)then jz[#jz+1]=pX break end end
end local pY=A.caps()local pZ,xJ=A.stats(jz)return y.mult(math.min(pZ.waxSpeed or 0,pY.waxSpeed or 0.25),math.min(pZ.longWax or 0,pY.longWax or 0.3),xJ.socialWax or 0)
end end return nil end function y.speedRatio(xK)local p0,jA=y.speedNow(),y.speedOf(xK)if not jA then return{1,1}end
return{p0[1]/jA[1],p0[2]/jA[2]}end function y.glazeSoon()return d.Teams and d.TeamGlaze~=""and(y.glazeFor~=nil or x()<(y.afterUntil or 0))
end A.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
A.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}A.buildMsg,A.fuseMsg,A.fused,A.builds="","",0,0
function A.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function A.caps()local jB=l.info()return(jB and type(jB.Caps)=="table")and jB.Caps or A.CAPS
end function A.value(p1,jC)local f5=l.info()local cI=f5 and f5 .Pets[p1]if not(cI and type(cI.boost)=="table")then return nil end
local b8 if type(f5 .boostValue)=="function"then local xL,xM=pcall(f5 .boostValue,p1,(jC~=""and jC)or nil)b8=xL and tonumber(xM)or nil
end if not b8 then b8=cI.boost.value or 0 if jC=="Big"then local p2=b8*1.5 b8=A.ROUND[cI.boost.kind]and math.max(b8+1,math.floor(p2+0.5))or p2
end end return cI.boost.kind,b8,cI.boost.every end function A.stats(xN)local b9,jD={},{}for Df,p3 in ipairs(xN)do
local aQ,f6,p4=A.value(p3 .name,p3 .variant or"")if aQ then if aQ:sub(1,6)=="social"then jD[aQ]=math.max(jD[aQ]or 0,f6)
elseif aQ=="waxStir"or aQ=="cashGift"then b9[aQ]=(b9[aQ]or 0)+f6*60/(p4 or 60)elseif aQ=="luckyPull"then b9 .luckyPull=(b9 .luckyPull or 0)+f6/(p4 or 10)
else b9[aQ]=(b9[aQ]or 0)+f6 end end end return b9,jD end function A.glazeGain(xO,f7)local dY,jE,Dg={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local xP=dY[1]+dY[2]+dY[3]local xQ=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local cJ={}for f8=1,3 do cJ[f8]=dY[f8]+xO*dY[f8]/xP+(f8==1 and xQ or 0)end
local jF={cJ[1]*(1-f7),cJ[2]*(1-f7)+cJ[1]*f7,cJ[3]+cJ[2]*f7}return jF[1]*(jE[1]-1)+jF[2]*(jE[2]-1)+jF[3]*(jE[3]-1)
end function A.score(f9,xR)local jG=A.caps()local f_,ga=A.stats(xR)local function bB(p5)return math.min(f_[p5]or 0,jG[p5]or math.huge)end
local xS=(1+bB("income"))*(1+(ga.socialIncome or 0))*(1+math.min(f_.cashGift or 0,jG.cashGiftPerMinute or 9)/60)
local xT=1+bB("luck")+(f_.luckyPull or 0)+(ga.socialLuck or 0)local p6=xT*(1+bB("newFind"))local dZ=math.log(xS)
local xU=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local jH=(1+bB("waxSpeed")+bB("longWax"))*(1+(ga.socialWax or 0))
+math.min(f_.waxStir or 0,jG.waxStirPerMinute or 30)/60/xU local xV=1-(1-bB("headStart"))*(1-(ga.socialHeadStart or 0))
if f9=="farm"then return dZ+0.7*math.log(p6)+0.1*math.log(jH)end if f9=="full"then return dZ+0.4*math.log(jH)+0.02*math.log(p6)end
if f9=="glaze"then return A.glazeGain(bB("glaze"),bB("glazeUp"))+0.001*dZ end if f9=="wax"then return-math.log(1-0.5*xV)+0.001*dZ+0.001*math.log(jH)end
return dZ end function A.best(p7,cK,xW,jI)jI=jI or{}local ay,d0={},{}local function p8(xX)local p9={}for xY,xZ in ipairs(xX)do p9[xY]=cK[xZ]end return p9 end
local function jJ(p_)local jK=A.score(p7,p8(p_))for Dh,x0 in ipairs(p_)do if jI[cK[x0].id]then jK=jK+1e-7 end end
return jK end for Di=1,math.min(xW,#cK)do local gb,jL for jM=1,#cK do if not d0[jM]then ay[#ay+1]=jM local qa=jJ(ay)
ay[#ay]=nil if not jL or qa>jL+1e-12 then gb,jL=jM,qa end end end if not gb then break end d0[gb]=true ay[#ay+1]=gb
end for Dj=1,6 do task.wait()local qb,qc=false,jJ(ay)for jN=1,#ay do for jO=1,#cK do if not d0[jO]then local qd=ay[jN]
ay[jN]=jO local qe=jJ(ay)if qe>qc+1e-9 then d0[qd],d0[jO],qc,qb=nil,true,qe,true else ay[jN]=qd end end end end
if not qb then break end end local qf={}for x1,x2 in ipairs(ay)do qf[x1]=tostring(cK[x2].id)end return qf,A.score(p7,p8(ay))
end function A.count(qg,qh,x3)local d1,d2={},0 local qi,qj={},{}for Dk,x4 in ipairs(qh.arriving or{})do qi[tostring(x4)]=true end
for Dl,cL in ipairs(qh.pets or{})do qj[tostring(cL.id)]=true if cL.name==qg and not qi[tostring(cL.id)]then if cL.variant=="Big"then d2=d2+1 elseif(cL.variant or"")==""then d1[#d1+1]=cL end
end end if not x3 then for Dm,d3 in ipairs(l.recent or{})do if d3 .name==qg and not qj[d3 .id]and x()-d3 .at<20 then
if d3 .variant=="Big"then d2=d2+1 else d1[#d1+1]=d3 end end end end return d1,d2 end function A.goal(x5)local qk=d.Pets[x5]return qk and tonumber(qk.f)or 0 end
function A.wantMore(ql,x6,qm)local jP=A.goal(ql)if jP<=0 or not qm then return true end local x7,qn=A.count(ql,qm)
if qn>=jP then return false end if x6=="Big"then return true end return#x7<A.need()*(jP-qn)end function A.status(qo,qp)
local gc=A.goal(qo)if gc<=0 or not qp then return nil end local x8,jQ=A.count(qo,qp)if jQ>=gc then return("Big %d/%d done"):format(jQ,gc)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#x8,A.need()),A.need(),jQ,gc)end function A.wear(jR)local jS={}
for Dn,x9 in ipairs(jR)do jS[tostring(x9)]=true end for Do=1,3 do local cM=l.data()if not cM then return false end
for Dp,qq in ipairs(cM.equipped or{})do if not jS[tostring(qq)]then l.call("unequip",qq)task.wait(0.3)end end
cM=l.data()local qr={}for Dq,x_ in ipairs(cM.equipped or{})do qr[tostring(x_)]=true end for Dr,qs in ipairs(jR)do
if not qr[tostring(qs)]then l.call("equip",qs)task.wait(0.3)end end task.wait(0.4)cM=l.data()local jT,qt=0,true
for Ds,ya in ipairs(cM.equipped or{})do jT=jT+1 if not jS[tostring(ya)]then qt=false end end if qt and jT==#jR then return true end
end return false end function A.saveTeam(qu,qv)if not A.wear(qv)then return false,"could not put the pets on"end
local yb=y.teams()local b_ for yc,yd in ipairs(yb)do if yd.name==qu then b_=yc break end end local cN if b_ then
cN=l.call("teamSave",b_)else cN=l.call("teamNew")if type(cN)=="table"and cN.ok and cN.index then b_=cN.index task.wait(0.3)
l.call("teamRename",{index=b_,name=qu})end end task.wait(0.4)local jU=l.data()local qw=jU and jU.teams and b_ and jU.teams[b_]
if not qw then return false,"the game did not save it"end local qx={}for Dt,ye in ipairs(qw.pets or{})do qx[tostring(ye)]=true end
for Du,yf in ipairs(qv)do if not qx[tostring(yf)]then return false,"saved, but not with these pets"end end return true
end A.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function A.quiet()
if y.placing or y.glazeSoon()then return false end local yg=l.srv()for Dv,yh in ipairs(y.list or{})do if yh.ends-yg<(d.GlazeLead or 45)+90 then return false end end
return true end function A.plan()local d4=l.data()if not d4 then return{}end local qy={}for Dw,yi in ipairs(d4 .arriving or{})do qy[tostring(yi)]=true end
local d5={}for Dx,gd in ipairs(d4 .pets or{})do if not qy[tostring(gd.id)]then d5[#d5+1]={id=tostring(gd.id),name=gd.name,variant=gd.variant or""}end
end local qz={}for Dy,qA in ipairs(d5)do qz[qA.id]=qA end local qB=tonumber(d4 .slots)or 3 local jV,qC={},{}for Dz,ge in ipairs(A.ROLES)do
local d6=d[ge[1]]if d6~=""and not qC[d6]then qC[d6]=true local jW,d7,qD={},{},false for DA,qE in ipairs(d4 .teams or{})do
if qE.name==d6 then for DB,yj in ipairs(qE.pets or{})do local jX=qz[tostring(yj)]if jX then jW[jX.id]=true d7[#d7+1]=jX else qD=true end
end end end local jY,qF=A.best(ge[2],d5,qB,jW)local qG=A.score(ge[2],d7)local qH=#jY==#d7 for DC,yk in ipairs(jY)do if not jW[yk]then qH=false end end
if not qH and(qD or#d7<math.min(qB,#d5)or qF>qG+1e-4)then jV[#jV+1]={team=d6,role=ge[2],ids=jY,gain=qF-qG}end
end end return jV end function A.rebuild(yl)local qI=A.plan()if#qI==0 then A.buildMsg="teams are already the best your pets allow"return true end
if not A.quiet()then A.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end y.editing,y.editingSince=true,x()
local gf=true local yp,yq=pcall(function()for DD,d8 in ipairs(qI)do local ym,yn=A.saveTeam(d8 .team,d8 .ids)local qJ=l.data()
local jZ={}for DE,yo in ipairs(d8 .ids)do for DF,j0 in ipairs(qJ and qJ.pets or{})do if tostring(j0 .id)==yo then jZ[#jZ+1]=l.nice(j0 .name,j0 .variant)end
end end if ym then z(("TEAM %s rebuilt (%s): %s"):format(d8 .team,yl or"pets changed",table.concat(jZ,", ")))
else gf=false z(("TEAM %s: %s"):format(d8 .team,tostring(yn)))end end end)y.editing,y.nextTry=false,0 if not yp then gf=false z("TEAM BUILD ERR "..tostring(yq))end
A.builds=A.builds+1 A.buildMsg=gf and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return gf end function A.fuseTick()if not d.AutoFuse or y.editing then return end local gg=l.data()if not gg then return end
local j1=A.need()local j2,gh={},{}for DG,yr in ipairs(gg.teams or{})do for DH,ys in ipairs(yr.pets or{})do j2[tostring(ys)]=true end end
for DI,yt in ipairs(gg.equipped or{})do gh[tostring(yt)]=true end A.failUntil=A.failUntil or{}for ca,yu in pairs(d.Pets)do
local qK=tonumber(yu.f)or 0 local j3,yv=A.count(ca,gg,true)if qK>0 and yv<qK and#j3>=j1 and x()>=(A.failUntil[ca]or 0)then
table.sort(j3,function(gi,gj)local qL=(gh[tostring(gi.id)]and 4 or 0)+(j2[tostring(gi.id)]and 2 or 0)+(gi.named and 1 or 0)
local qM=(gh[tostring(gj.id)]and 4 or 0)+(j2[tostring(gj.id)]and 2 or 0)+(gj.named and 1 or 0)if qL~=qM then return qL<qM end
return tostring(gi.id)<tostring(gj.id)end)local gk,j4={},{}for gl=1,j1 do gk[gl]=tostring(j3[gl].id)if gh[gk[gl]]then j4[#j4+1]=gk[gl]end
end y.editing,y.editingSince=true,x()for DJ,yw in ipairs(j4)do l.call("unequip",yw)task.wait(0.3)end local gm=l.call("fuse",{ids=gk})
y.editing,y.nextTry=false,0 if type(gm)=="table"and gm.ok then A.fused=A.fused+1 A.dirtyAt=x()z(("FUSED %d %s -> Big %s"):format(j1,l.nice(ca),l.nice(ca)))
A.fuseMsg=("fused a Big %s %s"):format(l.nice(ca),os.date("%H:%M"))else A.failUntil[ca]=x()+120 z(("fuse %s failed: %s"):format(l.nice(ca),type(gm)=="table"and tostring(gm.reason or"no reason given")or"no answer"))
end return end end end function A.tick()pcall(A.fuseTick)if not d.AutoBuild or not d.Teams then return end local qN=l.data()
if not qN then return end local cb={}for DK,yx in ipairs(qN.pets or{})do cb[#cb+1]=tostring(yx.id)end table.sort(cb)
cb=table.concat(cb,",")if cb~=A.sig then A.sig,A.dirtyAt=cb,x()end local yy=(A.dirtyAt and x()-A.dirtyAt>8)or x()-(A.lastBuild or 0)>900
if yy and not y.editing then local yz=A.rebuild(A.dirtyAt and"pets changed"or"check")if yz then A.dirtyAt,A.lastBuild=nil,x()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(cc)return cc:IsA("ParticleEmitter")or cc:IsA("Trail")or cc:IsA("Beam")or cc:IsA("Fire")or cc:IsA("Smoke")
or cc:IsA("Sparkles")or cc:IsA("Light")end function j.muteOne(aG)if not d.Lite or not aG.Parent then return end
local gn=(aG:IsA("BillboardGui")and j.bb)or(j.isFx(aG)and j.fx)or nil if not gn or gn[aG]~=nil then return end
gn[aG]=aG.Enabled if aG.Enabled then aG.Enabled=false end j.watch[aG]=aG:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aG.Enabled then gn[aG]=true aG.Enabled=false end end)end function j.lite(qO)d.Lite=qO if qO then
task.spawn(function()for yA,yB in ipairs(as:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,yB)
if yA%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=V(as.DescendantAdded:Connect(function(j5)
if d.Lite and(j5:IsA("BillboardGui")or j.isFx(j5))then j.queue[#j.queue+1]=j5 end end))end local j6=game:GetService("Lighting")
for DL,d9 in ipairs(j6:GetChildren())do if d9:IsA("PostEffect")and d9 .Enabled and j.post[d9]==nil then j.post[d9]=true d9 .Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and j6 .GlobalShadows or j.oldShadows j6 .GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and as.Terrain.Decoration or j.oldDeco as.Terrain.Decoration=false end)
else for DM,yC in pairs(j.watch)do pcall(function()yC:Disconnect()end)end for qP,yD in pairs(j.bb)do pcall(function()if qP.Parent then qP.Enabled=yD end end)end
for qQ,yE in pairs(j.fx)do pcall(function()if qQ.Parent then qQ.Enabled=yE end end)end for qR in pairs(j.post)do pcall(function()if qR.Parent then qR.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local yF=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()yF.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()as.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(qS)d.HideHud=qS local j7=F:FindFirstChildOfClass("PlayerGui")if not j7 then return end if qS then
for DN,d_ in ipairs(j7:GetChildren())do if d_:IsA("ScreenGui")and not j.MINE[d_.Name]and d_.Enabled then j.hud[d_]=true d_.Enabled=false end
end if not j.hudConn then j.hudConn=V(j7 .ChildAdded:Connect(function(ea)if d.HideHud and ea:IsA("ScreenGui")and not j.MINE[ea.Name]then
task.defer(function()if d.HideHud and ea.Enabled then j.hud[ea]=true ea.Enabled=false end end)end end))end else
for qT in pairs(j.hud)do pcall(function()if qT.Parent then qT.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(j8)d.FpsCap=j8 local qU=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not qU then return false end return pcall(qU,j8==0 and 60 or j8)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(am)if am:IsA("BasePart")or am:IsA("Decal")or am:IsA("Texture")then if am.Transparency<1 then j.unseen[am]=am.Transparency am.Transparency=1 end
elseif am:IsA("BillboardGui")or am:IsA("SurfaceGui")or am:IsA("ParticleEmitter")or am:IsA("Beam")or am:IsA("Trail")or am:IsA("Light")or am:IsA("Fire")or am:IsA("Smoke")or am:IsA("Sparkles")then
if am.Enabled then j.unseen[am]=true am.Enabled=false end end end function j.notMine(yG)return d.HideMine or(c.plot and not yG:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(qV)if d.HideBases then j.bases(false)end d.HideMine=qV==2 if qV>0 then j.bases(true)end end
function j.bases(qW)d.HideBases=qW local j9=as:FindFirstChild("Plots")if not j9 then return end if qW then task.spawn(function()
local j_=0 for DO,qX in ipairs(j9:GetChildren())do if qX~=c.plot or d.HideMine then for DP,yH in ipairs(qX:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,yH)j_=j_+1 if j_%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=V(j9 .DescendantAdded:Connect(function(qY)if d.HideBases and j.notMine(qY)then task.defer(function()pcall(j.hideOne,qY)end)end
end))end else for ka,qZ in pairs(j.unseen)do pcall(function()if not ka.Parent then return end if type(qZ)=="number"then ka.Transparency=qZ else ka.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(q0)d.NoRender=q0 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not q0)end)
end function j.restoreAll()pcall(j.unpin)if d.HideBases then pcall(j.bases,false)end if E.arPaused then pcall(E.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(q1)if c.rejoining then return end z("REJOIN this server ("..q1 ..")")
pcall(eZ)if c.autoload then pcall(fo,c.autoload)end nn()local yI=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then dp(q1 ..", same server failed")end end)return yI end function j.tick()
local kb=j.queue if d.Lite and kb and#kb>0 then j.queue={}for yJ,yK in ipairs(kb)do pcall(j.muteOne,yK)if yJ%300==0 then task.wait()end end
end local q2=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if q2 then for DQ,yL in ipairs(q2:GetChildren())do
local q3=yL:FindFirstChild("SquishyPlaceHolder")local cd=q3 and q3:FindFirstChild("TimerGui")if cd and cd:IsA("BillboardGui")then
if j.bb[cd]==nil then pcall(j.muteOne,cd)elseif cd.Enabled then j.bb[cd]=true cd.Enabled=false end end end end
local yM,eb=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if yM and type(eb)=="number"then
j.mem=eb j.memPeak=math.max(j.memPeak,eb)if(d.MemLimit or 0)>0 and eb>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(eb,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if x()-(j.noteAt or 0)>1800 then j.noteAt=x()z(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function kc(go)if type(go)~="string"then return false end
go=go:lower()for DR,yN in ipairs(c.sellWords)do if go:find(yN,1,true)then return true end end return false end
local function yO()local q4=aj:FindFirstChild("Remotes")local kd=q4 and q4:FindFirstChild("SellSquishy")if not(kd and kd:IsA("RemoteEvent"))then return false end
if not pcall(function()kd:FireServer()end)then return false end return ao(function()return ac()==nil end,1.5)
end local function yP()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local q5=au()local q6=q5 and q5 .HumanoidRootPart.Position local ec,q7 for DS,cO in ipairs((c.plot or as):GetDescendants())do
if cO:IsA("ProximityPrompt")and(kc(cO.ActionText)or kc(cO.ObjectText)or kc(cO.Name))then local q8=ml(cO)local ke=(q8 and q6)and(q8-q6).Magnitude or 1e9
if ke<=400 and(not ec or ke<q7)then ec,q7=cO,ke end end end c.sellSpot=ec c.noSellSpot=(ec==nil)return ec end
local function q9()local kf=ac()if not kf then c.holding=false return false end if aI(kf)then return false end
local kg=ah(aa(kf))if yO()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
z("SOLD "..kg)return true end local cP=yP()if cP then local q_=db(cP)if q_ then cy(q_,cP)local ra=ac()if ra and not aI(ra)then
local yQ,yR=du(cP,function()return ac()==nil end,function()return cP.Enabled end)if yQ then c.sold,c.holding,c.sellFails=c.sold+1,false,0
z(("SOLD %s at %s via %s"):format(kg,eU(cP),yR))return true end end end end c.sellFails=c.sellFails+1 z("could not sell "..kg.." ("..c.sellFails..")")
return false end local yS={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function yT(cQ)local gp=eU(cQ):lower()for DT,yU in ipairs(yS)do if gp:find(yU,1,true)then return 0 end end
local a1,ap=cQ.Name:lower(),0 local function aR(yV,yW)return yV:find(yW,1,true)~=nil end if aR(a1,"collect")then ap=ap+60 end
if aR(a1,"cash")or aR(a1,"money")then ap=ap+45 end if aR(a1,"income")or aR(a1,"claim")then ap=ap+35 end if aR(a1,"coin")or aR(a1,"earn")or aR(a1,"green")then ap=ap+20 end
if a1=="pad"or a1=="touch"then ap=ap+25 end if ap==0 and(aR(gp,"collect")or aR(gp,"cash")or aR(gp,"money"))then ap=25 end
if ap==0 then return 0 end local ed=cQ.Color if ed.G>0.5 and ed.G>ed.R*1.4 and ed.G>ed.B*1.4 then ap=ap+15 end
if math.min(cQ.Size.X,cQ.Size.Y,cQ.Size.Z)<2 then ap=ap+5 end return ap end local function yX()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local gq,ee,kh={},nil,29 for DU,gr in ipairs(c.plot:GetDescendants())do
if gr:IsA("BasePart")then local gs=yT(gr)if gs>0 then gq[#gq+1]={s=gs,p=gr}if gs>kh then ee,kh=gr,gs end end end
end table.sort(gq,function(yY,yZ)return yY.s>yZ.s end)c.padCands,c.padPart=gq,ee if ee then z("collect pad: "..eU(ee).." (score "..kh..")")end
return ee end local ki="SAB_pad_v1.txt"local function y0(y1)if type(writefile)=="function"then pcall(writefile,ki,table.concat({y1:GetComponents()},","))end
end local function y2()if type(isfile)~="function"or type(readfile)~="function"then return nil end local y3,rb=pcall(function()if isfile(ki)then return readfile(ki)end end)
if not y3 or type(rb)~="string"then return nil end local gt={}for y4 in rb:gmatch("[^,]+")do gt[#gt+1]=tonumber(y4)end
if#gt==12 then return CFrame.new(unpack(gt))end end local function y5(kj,gu,y6)local y7=cx(kj)local kk=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aS=(kk and kk:IsA("BasePart"))and(kk.Position-gu)or Vector3 .new(1,0,0)aS=Vector3 .new(aS.X,0,aS.Z)if aS.Magnitude<0.05 then aS=Vector3 .new(1,0,0)end
aS=aS.Unit for y8=0,7 do local gv=y8*math.pi/4 local y9=Vector3 .new(aS.X*math.cos(gv)-aS.Z*math.sin(gv),0,aS.X*math.sin(gv)+aS.Z*math.cos(gv))
local gw=gu+y9*(y6+5)local kl=fw(gw.X,gu.Y,gw.Z)if kl and math.abs(kl.Y-gu.Y)<8 then aC(kj,Vector3 .new(gw.X,kl.Y+y7,gw.Z))
if it(kj,0.7)then return true end end end return false end local function y_()c.lastCollect=x()local ef=au()if not ef then return end
local rc,za=ef.HumanoidRootPart,cx(ef)local eg,rd,eh,km=nil,4,nil,"?"local kn=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and kn and kn:IsA("BasePart")then eg,km=(kn.CFrame*c.manualPad).Position,"manual pad"else local be=yX()
if be then eg=Vector3 .new(be.Position.X,be.Position.Y+be.Size.Y/2+za,be.Position.Z)rd,eh,km=math.max(be.Size.X,be.Size.Z)/2,be,be.Name
end end if not eg then z("COLLECT: pad not found - stand on it and tap SET PAD")return end local ko=a6()aC(ef,eg)
if eh and type(firetouchinterest)=="function"then pcall(firetouchinterest,rc,eh,0)end af(d.PadDwell)if eh and type(firetouchinterest)=="function"then pcall(firetouchinterest,rc,eh,1)end
af(0.5)c.collected=c.collected+1 local kp=a6()z(("COLLECTED (%s) %s"):format(km,(ko and kp and kp>ko)and("+$"..aJ(kp-ko))or"no cash change seen"))
y5(ef,eg,rd)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function q.mods()if q.si and x()-q.modAt<120 then return true end
local re=aj:FindFirstChild("Modules")if not re then return false end local function kq(zb)local rf=re:FindFirstChild(zb)
if not rf then return nil end local zc,rg=pcall(require,rf)return(zc and type(rg)=="table")and rg or nil end q.si,q.arm,q.ci=kq("SquishyInfo"),kq("AutoRollRules"),kq("CrateInfo")
q.modAt=x()if not q.si then return false end local kr={}if q.arm and type(q.arm.tierOf)=="table"then for ks in pairs(q.arm.tierOf)do
local gx=q.si[ks]if type(gx)=="table"and gx.rarity~="Limited"and not gx.incomeType and not gx.hiddenAfter then kr[aa(ks)]=ks end
end end q.roll=kr local gy={}for zd,ze in pairs(kr)do local ei=q.si[ze]if type(ei)=="table"and type(ei.income)=="number"and not ei.incomeType then
gy[#gy+1]={k=zd,inc=ei.income,pr=tonumber(ei.price)or 0}end end table.sort(gy,function(kt,ku)if kt.inc~=ku.inc then return kt.inc>ku.inc end return kt.pr>ku.pr end)
q.order=gy local gz,kv,kw local zf=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for zg,kx in pairs(zf)do
local ky=type(kx)=="table"and tonumber(kx.price)if ky and(not kv or ky>kv)then gz,kv,kw=zg,ky,kx.title end end
q.bestCrate,q.bestCrateName=gz and L.key(gz),gz q.bestCrateTitle=kw and L.key(kw)or nil return true end function q.rank(zh)
local zi,zj=pcall(function()return q.arm.rankOf(zh)end)return(zi and tonumber(zj))or 0 end function q.loadDisc(rh)
if type(rh)~="table"then return end local ri={}for zk,zl in pairs(rh)do if zl then ri[aa(tostring(zk))]=true end end
q.disc,q.discAt=ri,x()end function q.fetch()q.discAt=x()local rj=aj:FindFirstChild("Remotes")local rk=rj and rj:FindFirstChild("GetSquishiesDiscovered")
if not rk then return end local zm,zn=pcall(function()return rk:InvokeServer()end)if zm then q.loadDisc(zn)end
end function q.scanWax()local kz={}local rl=c.plot and c.plot:FindFirstChild("WaxStations")if rl then for DV,rm in ipairs(rl:GetChildren())do
local rn=rm:FindFirstChild("SquishyPlaceHolder")if rn and rm:GetAttribute("HasSquishy")then for DW,ro in ipairs(rn:GetChildren())do if ro:IsA("Model")then kz[aa(ro.Name)]=true end end
end end end for rp,zo in pairs(q.placedAt)do if x()-zo<20 then kz[rp]=true else q.placedAt[rp]=nil end end q.waxing=kz
end function q.compute()local rq,kA,kB={},0,0 if q.disc then for kC in pairs(q.roll or{})do if not q.disc[kC]then
if q.waxing[kC]then kB=kB+1 else rq[kC],kA=true,kA+1 end end end end q.need,q.nNeed,q.nWax=rq,kA,kB local rr,kD={},d.Best or 0
local rs=(kD==4 and q.stackFull)and q.stackMin or nil for zp,rt in ipairs(q.order)do if zp<=(kD==4 and 1 or kD)or(rs and rt.inc>rs)then rr[rt.k]=true end
end q.best=rr end function q.readStack()q.stackAt=x()local ru=aj:FindFirstChild("Remotes")local rv=ru and ru:FindFirstChild("EditStack")
if not rv then return end local zq,cR=pcall(function()return rv:InvokeServer("State",nil)end)if not(zq and type(cR)=="table"and type(cR.state)=="table"and type(cR.state.entries)=="table")then return end
local gA for DX,rw in ipairs(cR.state.entries)do local ej=type(rw)=="table"and q.si and q.si[tostring(rw.name)]
if type(ej)=="table"and type(ej.income)=="number"and not ej.incomeType and(not gA or ej.income<gA)then gA=ej.income end
end q.stackMin=gA q.stackFull=#cR.state.entries>=(tonumber(cR.state.capacity)or 100)end function q.want(kE)if(d.Best or 0)>0 and next(q.best)then
if q.best[kE]then return true end elseif d.Targets[kE]then return true end return d.AutoIndex==true and q.need[kE]==true
end function q.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(q.best)~=nil)or(d.AutoIndex and next(q.need)~=nil)
end function q.placed(zr)local ek=aa(zr)q.placedAt[ek],q.waxing[ek]=x(),true if q.need[ek]then q.need[ek],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
z(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ah(ek)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local el,em={},{}for zs,zt in pairs(q.roll or{})do if q.want(zs)then el[zt]=true end end
for rx,kF in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(rx)or(type(kF)=="table"and type(kF.title)=="string"and L.wanted(kF.title))then em[rx]=true end
end if not next(el)and not next(em)then return nil end if q.arm and type(q.arm.encode)=="function"then local zu,ry=pcall(q.arm.encode,{rarities={},butters=el,crates=em,index=false})
if zu and type(ry)=="string"then return ry end end local function rz(zv)local gB={}for zw in pairs(zv)do gB[#gB+1]=zw end table.sort(gB)return table.concat(gB,",")end
local en="adv:"if next(el)then en=en..";butters:"..rz(el)end if next(em)then en=en..";crates:"..rz(em)end return en
end function q.canon(zx)local gC={}for rA in tostring(zx or""):gmatch("[^;]+")do local kG,rB=rA:match("^(%a+):(.*)$")
if not kG then kG,rB="r",rA:gsub("^adv:","")end for zy in rB:gmatch("[^,]+")do gC[#gC+1]=kG.."="..zy end end table.sort(gC)
return table.concat(gC,"|")end function q.sync(zz)if F:GetAttribute("AutoRoll")~=true then return end if x()<(q.pauseUntil or 0)then return end
local ce=q.rulesNow()if not ce or#ce>1900 then return end if q.canon(F:GetAttribute("AutoRollRules"))==q.canon(ce)then q.fails=0 return end
if not zz and x()-q.sentAt<4 then return end local rC=aj:FindFirstChild("Remotes")local rD=rC and rC:FindFirstChild("AutoRollAction")
if not rD then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,x()+300 z("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=x()C.replaying=true pcall(function()rD:FireServer("Rules",ce)end)C.replaying=false d.ARrules=ce
local gD,gE=0,0 for DY in(ce:match("butters:([^;]*)")or""):gmatch("[^,]+")do gD=gD+1 end for DZ in(ce:match("crates:([^;]*)")or""):gmatch("[^,]+")do gE=gE+1 end
local rE=gD.."/"..gE if q.told~=rE then q.told=rE z(("auto roll now stops on %d butters and %d crates"):format(gD,gE))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if x()-q.discAt>30 then q.fetch()end
q.scanWax()if d.Best==4 and x()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aL={}if d.AutoIndex then aL[#aL+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if d.Best==4 then local gF=0 for D0 in pairs(q.best)do gF=gF+1 end
aL[#aL+1]=("upgrades: %d butter%s"):format(gF,gF==1 and""or"s")elseif(d.Best or 0)>0 and q.order[1]then aL[#aL+1]="best: "..ah(q.order[1].k)end
if d.BestCrate and q.bestCrateName then aL[#aL+1]="crate: "..q.bestCrateName end if Q.got>0 then aL[#aL+1]="shower: "..Q.got end
q.msg=#aL>0 and table.concat(aL," | ")or"index / best: off"end q.heard={}function q.admin(zA,aT,gG)if zA~="Effect"then return end
if aT=="Shower"then Q.add(gG)return end if aT=="ShowerTaken"then Q.gone(gG)return end if aT=="ShowerClear"then Q.drops={}return end
if aT=="WaxGlow"then local kH=type(gG)=="table"and tonumber(gG.SnapAt)if kH then q.snapAt=kH z(("ADMIN: every wax finishes in %ds%s"):format(math.floor(kH-l.srv()),(d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end aT=tostring(aT)bT("Admin "..aT)if aT~="GoalPoint"and x()-(q.heard[aT]or-100)>30 then q.heard[aT]=x()
z("ADMIN: "..aT)end end Q.drops,Q.tried,Q.got,Q.miss={},{},0,0 function Q.add(kI)if type(kI)~="table"or type(kI.Pieces)~="table"then return end
for D1,aU in pairs(kI.Pieces)do if type(aU)=="table"and aU.Id~=nil and aU.Position~=nil then Q.drops[aU.Id]={id=aU.Id,butter=tostring(aU.Butter or"?"),rar=tostring(aU.Rarity or"?"),star=aU.Star==true,
pos=aU.Position,opens=tonumber(aU.OpensAt)or 0,ends=tonumber(aU.ExpiresAt)or 0}end end end function Q.gone(eo)
if type(eo)~="table"or eo.Id==nil then return end Q.drops[eo.Id]=nil if tonumber(eo.UserId)==l.uid then Q.mine=eo.Id end
end function Q.pick()local kJ=l.srv()local kK,rF for rG,cf in pairs(Q.drops)do if kJ>=cf.ends-0.3 then Q.drops[rG]=nil
elseif kJ>=cf.opens-0.2 and(Q.tried[rG]or 0)<3 then local rH=(aI(cf.butter)and 1e6 or 0)+(cf.star and 1e5 or 0)+q.rank(cf.rar)*100-(cf.ends-kJ)
if not kK or rH>rF then kK,rF=cf,rH end end end return kK end function Q.due()return d.Shower and c.running and next(Q.drops)~=nil and not ac()and Q.pick()~=nil
end function Q.grab()local aM,kL=Q.pick(),au()if not(aM and kL)then return end Q.tried[aM.id]=(Q.tried[aM.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aC(kL,aM.pos+Vector3 .new(0,cx(kL)+0.5,0))ao(function()return Q.mine==aM.id or ac()~=nil or not Q.drops[aM.id]end,1.5)
if Q.mine==aM.id or ac()then Q.got,Q.drops[aM.id]=Q.got+1,nil z(("GRABBED %s [%s]%s from the admin shower"):format(ah(aa(aM.butter)),aM.rar,aM.star and" (star)"or""))
elseif not Q.drops[aM.id]then Q.miss=Q.miss+1 end end local ep local function rI()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 z("trying again after being stopped for 5 minutes")ep(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not au()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bn(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local kM,rJ=eW()
local gH=ac()if gH then local cS=ah(aa(gH))if not aI(gH)then local kN=(W.gift and aa(W.gift)==aa(gH)and x()-W.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cS,kN),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cS,kN),"bad"end return"sell",("selling %s (%s)"):format(cS,kN),"warn"
end if kM<1 then return nil,("holding %s - 0 free stations"):format(cS),"wait"end if y.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cS),"wait"end
return"place",("waxing %s (%d free)"):format(cS,kM),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local kO=c.plot:FindFirstChild("CrateStand")if kO then for D2,eq in ipairs(kO:GetDescendants())do
if eq:IsA("ProximityPrompt")and eq.Enabled and iJ(eq)then local bf=eq.ObjectText if bf==""then bf=cq(kO,"TitleLabel")or""end
if bf~=""and L.wanted(bf)then local zB=eS(bf):gsub("crate$","")local rK for rL in pairs(ad.members)do if eS(rL)==zB then rK=rL end end
e.waiting,e.at,e.title,e.prompt=true,x(),bf,eq e.data={name=(bf:gsub("%s","")),rarity=rK,title=bf}z(bf.." found waiting on your stand")
end break end end end end local rM=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and rM then
local bh=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(bh),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 z("could not press the "..bh.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(bh),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(bh),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
bh,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(bh),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(bh),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(bh),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(bh,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not rM then local rN=e.title..tostring(e.rolledAt)if e.told~=rN then e.told=rN z(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if kM<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(rJ,rJ),"wait"
end local kP=mz()if not kP then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local er=bS()
if er and nX(er.name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(er.name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(er.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(er.name),"ok"
end local bC=ir()if bC.state~="match"then c.matchSince=nil if bC.state=="skip"and not kP.Enabled then return nil,bC.text.." (sold out)","idle"end
return nil,bC.text,bC.level end if not kP.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local es=x()if es<c.noCashUntil then local rO,zC=nw()if rO then return nil,("cash short: have $%s, price ~$%s"):format(aJ(rO),aJ(zC)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aJ(a6()),math.ceil(c.noCashUntil-es)),"bad"end if es-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or es local rP=es-c.matchSince if rP<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bC.shown,rP),"ok"end
return"buy",("buying %s via %s"):format(bC.shown,bC.src),"ok"end j.DEPTH=11 function j.pinTick()local rQ=j.hold
if not rQ then return end local kQ=F.Character local kR=kQ and kQ:FindFirstChild("HumanoidRootPart")if not kR then return end
kR.CFrame=rQ kR.AssemblyLinearVelocity=Vector3 .new(0,0,0)for D3,gI in ipairs(kQ:GetChildren())do if gI:IsA("BasePart")and gI.CanCollide then j.noclip[gI]=true gI.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(zD,rR)j.hold=zD if rR then j.surface=rR end end function j.unpin(zE)
if not j.hold then return end j.hold=nil for rS in pairs(j.noclip)do pcall(function()if rS.Parent then rS.CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local rT=au()if rT and j.surface and not zE then aC(rT,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bi,rU=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),au()
if not(bi and bi:IsA("BasePart")and rU)then return nil end local rV=mo()or bi.Position local gJ=Vector3 .new(rV.X-bi.Position.X,0,rV.Z-bi.Position.Z)
gJ=gJ.Magnitude>0.1 and gJ.Unit or Vector3 .new(0,0,1)local gK=bi.Position+gJ*6 local rW=fw(gK.X,bi.Position.Y,gK.Z,{bi})
return CFrame.new(gK.X,(rW and rW.Y or bi.Position.Y)+cx(rU),gK.Z)end function j.ground(zF,rX,zG)local kS,kT={F.Character},nil
for D4=1,12 do local kU=RaycastParams.new()kU.FilterType=Enum.RaycastFilterType.Exclude kU.FilterDescendantsInstances=kS
local gL=as:Raycast(Vector3 .new(zF,rX,zG),Vector3 .new(0,-2000,0),kU)if not gL then break end kT,rX=gL,gL.Position.Y-0.05
kS[#kS+1]=gL.Instance end return kT and kT.Position.Y end function j.parkHome()local kV=j.home()if not kV then return false end
local cT=kV.Position local zH=j.ground(cT.X,cT.Y+300,cT.Z)or(cT.Y-3)j.pin(CFrame.new(cT.X,zH-8,cT.Z),kV)return true
end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function j.setGhost(gM)d.Ghost,d.GhostHelps=gM==2,gM==1 if gM<2 then task.spawn(function()while c.busy do af(0.1)end
if j.ghostMode()<2 and j.hold and not D.home then pcall(j.unpin)end end)end j.paintGhost()z("ghost: "..j.GHOST[gM][1]:sub(8):lower())
end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end
local zI=au()if not zI or J.seat()then return end j.parkHome()end J.n,J.fails,J.nextAt,J.msg,J.lost=0,0,0,"no campfire right now",0
function J.seat()local rY=F.Character local rZ=rY and rY:FindFirstChildOfClass("Humanoid")local kW=rZ and rZ.SeatPart
return(kW and kW.Name=="LogSeat")and kW or nil end function J.due()if not(d.Campfire and c.running)or x()<J.nextAt then return false end
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
function E.refresh()E.at=x()local kX=aj:FindFirstChild("Remotes")if not kX then return end local et,kY,cW=0,0,{}
local zP,r3=pcall(function()return kX.ClanRequest:InvokeServer("state")end)local r4=zP and type(r3)=="table"and r3 .tasks
for D6,bD in ipairs(r4 and r4 .list or{})do if not bD.done and bD.kind=="pull"then et=math.max(et,(bD.goal or 0)-(bD.progress or 0))end
if not bD.done then cW[#cW+1]=("%s %d/%d"):format(tostring(bD.text),bD.progress or 0,bD.goal or 0)end end E.events={}
for D7,cX in ipairs(kX:GetChildren())do if cX:IsA("RemoteFunction")and cX.Name:match("^%u%a+Action$")and cX.Name~="CrateAction"and cX.Name~="AutoRollAction"then
local zQ,eu=pcall(function()return cX:InvokeServer("state")end)if zQ and type(eu)=="table"and eu.live==true and type(eu.quests)=="table"then
E.events[#E.events+1]={r=cX,st=eu}for D8,aN in ipairs(eu.quests)do if not aN.done and aN.kind=="pull"then et=math.max(et,(aN.goal or 0)-(aN.progress or 0))end
if not aN.done and aN.kind=="collect"then kY=math.max(kY,(aN.goal or 0)-(aN.progress or 0))end if not aN.done then cW[#cW+1]=("%s %d/%d"):format(tostring(aN.text),aN.progress or 0,aN.goal or 0)end
end end end end E.pullLeft,E.collectLeft=et,kY E.msg=#cW>0 and("open: "..table.concat(cW,", "))or"all quests done for today"
end function E.claim()for D9,ev in ipairs(E.events)do local r5=ev.r.Name:gsub("Action$","")for D_,cY in ipairs(ev.st.quests)do
if cY.done and not cY.claimed then local zR,r6=pcall(function()return ev.r:InvokeServer("claimQuest",cY.id)end)
if zR and not(type(r6)=="table"and r6 .ok==false)then E.claims=E.claims+1 z(("CLAIMED %s quest: %s (+%s)"):format(r5,tostring(cY.text),tostring(cY.points or cY.treats or"?")))
end af(0.4)end end if ev.st.bonusReady==true then local zS=pcall(function()return ev.r:InvokeServer("claimBonus")end)
if zS then z(("CLAIMED %s daily quest bonus"):format(r5))end af(0.4)end end end function E.tick()if not(d.Quests and c.running)then
if E.arPaused then E.resume("quests switched off")end return end if x()-E.at<(E.pullLeft>0 and 20 or 90)then return end
E.refresh()pcall(E.claim)if E.pullLeft<=0 and E.arPaused then E.resume("lever quests done")end end function E.pullDue()
return d.Quests and c.running and E.pullLeft>0 and x()>=E.nextAt and not C.busy end function E.lever()local r7=c.plot and c.plot:FindFirstChild("Lever")
local kZ=r7 and r7:FindFirstChild("Wheel")return kZ and kZ:FindFirstChildWhichIsA("ProximityPrompt"),kZ end function E.resume(zT)
E.arPaused=false if E.arWas then E.arWas=false d.AutoRoll=true task.spawn(C.apply,zT)end end function E.pull()
local gP,k0=E.lever()if not gP or not k0 or not k0:IsA("BasePart")then E.nextAt,E.msg=x()+300,"your lever was not found"return end
if not E.arPaused then E.arPaused=true E.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false C.apply("pulling the lever for a quest",true)
if C.isOn()then E.nextAt=x()+30 return end end z(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(E.pullLeft))
end if not gP.Enabled then E.nextAt=x()+1 return end cy(k0,gP)E.asked=nil nL(gP)E.pulls=E.pulls+1 E.pullLeft=E.pullLeft-1
af(0.6)if E.asked then E.nextAt=x()+600 z(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(E.asked)))
E.resume("a butter the game wants kept is on the pad")return end E.nextAt=x()+2.5 if E.pullLeft<=0 then E.at=0 end
end D.skip,D.skipN,D.n,D.calls,D.fails,D.nextAt,D.msg,D.tries={},0,0,0,0,0,"off",{}function D.can(bE,zU)local k1=bE:GetAttribute("PourOwner")
if type(k1)~="number"or k1==l.uid or not bE:GetAttribute("HasSquishy")then return false end if bE:GetAttribute("PourLong")~=true or bE:GetAttribute("PourFull")==true then return false end
local k2=bE:GetAttribute("PourId")if k2==nil or D.skip[k2]then return false end local r8,k3,zV=bE:GetAttribute("Helpers"),0,tostring(l.uid)
if type(r8)=="string"then for zW in r8:gmatch("[^,%s]+")do k3=k3+1 if zW==zV then return false end end end if k3>=6 then return false end
local gQ=y.left(bE)if not gQ then local r9=tonumber(bE:GetAttribute("PourEnd"))gQ=r9 and(r9-zU)end if not gQ or gQ<=75 then return false end
local k4=game:GetService("Players"):GetPlayerByUserId(k1)if not k4 or k4:GetAttribute("WaxHelpOff")==true then return false end
return true,k4,k2 end function D.list()local k5,zX={},l.srv()local r_=as:FindFirstChild("Plots")for Ea,sa in ipairs(r_ and r_:GetChildren()or{})do
local sb=sa~=c.plot and sa:FindFirstChild("WaxStations")for Eb,k6 in ipairs(sb and sb:GetChildren()or{})do local zY,zZ,z0=D.can(k6,zX)
local k7=zY and k6:FindFirstChild("SquishyPlaceHolder")if k7 and k7:IsA("BasePart")then k5[#k5+1]={st=k6,p=zZ,id=z0,part=k7}end
end end return k5 end function D.due()return d.Help and c.running and x()>=D.nextAt end function D.skipIt(sc,sd)
D.skip[sc],D.skipN=sd,D.skipN+1 if D.skipN>600 then D.skip,D.skipN,D.tries={[sc]=sd},1,{}end end function D.goHome()
local gR,bF=au(),D.home D.home=nil if not(gR and bF)then return end if d.Ghost and not J.seat()then j.unpin(true)
if not j.parkHome()then pcall(aC,gR,bF.Position,bF.Position+bF.LookVector)end elseif j.hold or(gR.HumanoidRootPart.Position-bF.Position).Magnitude>20 then
j.unpin(true)pcall(aC,gR,bF.Position,bF.Position+bF.LookVector)end end function D.step()local k8,ew=D.list(),au()
if#k8==0 or not ew then D.nextAt=x()+15 D.msg=("helped %d waxes here%s | none to help right now"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")
D.goHome()return end local se=ew.HumanoidRootPart local sf=se.Position table.sort(k8,function(z1,z2)return(z1 .part.Position-sf).Magnitude<(z2 .part.Position-sf).Magnitude end)
local aV=k8[1]D.home=D.home or(j.hold and j.surface)or se.CFrame local bG=aV.part local ex=(bG.Position+aV.st:GetPivot().Position)/2
local gS=D.tries[aV.id]or 0 if(d.Ghost or d.GhostHelps)and gS==0 and not J.seat()then j.pin(bG.CFrame,D.home)
else j.unpin(true)local k9=gS==0 and fw(ex.X,bG.Position.Y,ex.Z,{bG})if k9 and math.abs(k9 .Y-bG.Position.Y)<8 then
aC(ew,Vector3 .new(ex.X,k9 .Y+cx(ew),ex.Z),bG.Position)else aC(ew,bG.Position+Vector3 .new(0,bG.Size.Y/2+3,0),ex)
end end af(0.3)local ey=aj:FindFirstChild("Remotes")ey=ey and ey:FindFirstChild("ClanRequest")if not ey then D.nextAt,D.msg=x()+60,"the game's help remote is missing"return end
local gT,bj=pcall(function()return ey:InvokeServer("help",aV.st:GetAttribute("PourOwner"),tonumber(aV.st.Name))end)
if gT and type(bj)=="table"and bj.ok then D.n,D.fails=D.n+1,0 D.skipIt(aV.id,"helped")z(("HELPED %s's wax (station %s)"):format(aV.p.DisplayName,aV.st.Name))
D.msg=("helped %d waxes here%s"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")elseif gT and type(bj)=="table"and tostring(bj.reason or""):lower():find("walk up",1,true)and gS<2 then
D.tries[aV.id]=gS+1 D.nextAt=x()+0.3 elseif gT and type(bj)=="table"and tostring(bj.reason or""):lower():find("moment",1,true)then
D.waits=(D.waits or 0)+1 D.nextAt=x()+1.6 else local sh=(gT and type(bj)=="table"and tostring(bj.reason or"refused"))or("error: "..tostring(bj))
D.skipIt(aV.id,sh)D.fails=D.fails+1 if D.fails<=3 then z(("help refused for %s's wax: %s"):format(aV.p.DisplayName,sh))end
if D.fails>=5 then D.fails,D.nextAt,D.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
D.goHome()end end D.nextAt=math.max(D.nextAt,x()+1.2)end function D.onCall(bk)if not d.HelpGuild or type(bk)~="table"or bk.p~="help"or bk.mine or bk.u==l.uid or not bk.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local ez=aj:FindFirstChild("Remotes")
ez=ez and ez:FindFirstChild("ClanRequest")if not ez then return end local sj,eA=pcall(function()return ez:InvokeServer("callHelp",bk.u)end)
local sk=tostring(bk.n or bk.un or bk.u)if sj and type(eA)=="table"and eA.ok then D.calls=D.calls+1 z(("HELPED guildmate %s's wax from here (their call)"):format(sk))
else z(("guild call from %s: %s"):format(sk,(sj and type(eA)=="table"and tostring(eA.reason or"refused"))or tostring(eA)))
end end)end local function aq(z3,sl,...)if c.busy then return end c.busy,c.busyText=true,z3 if j.hold and sl~=D.step then pcall(j.unpin)end
local z4,sm=pcall(sl,...)c.busy,c.busyText=false,""if not z4 and sm~=hB then z("ERR "..tostring(sm))end end local function z5()
local aW,z6,z7=rI()c.reason,c.level=z6,z7 if aW=="place"then aq("waxing...",y.place)elseif aW=="crate"then aq("opening crate...",fJ,true)
elseif aW=="cratesmart"then aq("opening crate...",e.smart)elseif aW=="cratewin"then aq("opening the crate window...",iL)
elseif aW=="nocrate"then aq("discarding crate...",fJ,false)elseif aW=="sell"then aq("selling...",q9)elseif aW=="buy"then aq("buying...",nO,false)
elseif not aW and not c.matchSince and Q.due()then aq("grabbing a butter from the admin shower...",Q.grab)elseif not aW and not c.matchSince and J.due()then
aq("sitting at the campfire...",J.sit)elseif not aW and not c.matchSince and E.pullDue()and not ac()and not(bS()and aI(bS().name))then
aq("pulling the lever for a quest...",E.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(E.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
aq("collecting money...",y_)elseif not aW and not c.matchSince and D.due()then aq("helping a wax...",D.step)elseif D.home and not d.Help then
aq("coming back...",D.goHome)elseif not c.busy then j.parkTick()end end function ep(gU,z8)if gU==c.running then return end
c.running=gU if not z8 then d.AutoStart=gU end if gU then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bn()or c.plot
z("START")else c.reason="stopped"z("STOP")end end do local bH=fi(al.auto)if type(bH)=="string"then bH=bH:gsub("%s+$","")
if bH~=""then c.autoload=bH local z9=nj(bH)z(z9 and("loaded config "..bH)or("config "..bH.." could not be loaded"))
end end end local o={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local z_={ok=o.good,wait=o.warn,warn=o.warn,bad=o.bad,idle=o.dim}local sn={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function O(Aa,Ab,Ac)local Ad,k_=pcall(Instance.new,Aa)
if not Ad then c.uiErrs=c.uiErrs+1 return nil end for Ae,Af in pairs(Ab)do if not pcall(function()k_[Ae]=Af end)then c.uiErrs=c.uiErrs+1 end
end k_.Parent=Ac return k_ end local function an(Ag,Ah)O("UICorner",{CornerRadius=UDim.new(0,Ah or 6)},Ag)end
local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"})}function a.put(gV,la)if gV and a.shown[gV]~=la then a.shown[gV]=la gV.Text=la end
end local lb=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local so=lb:FindFirstChild("SABFarmGui")
if so then so:Destroy()end local lc=O("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},lb)
local ak={w=320,h=300,head=28,strip=34,tabs=24}pcall(function()local gW=as.CurrentCamera.ViewportSize if gW.X>100 and gW.Y>100 then
ak.w=math.clamp(math.floor(gW.X*0.44),300,360)ak.h=math.clamp(math.floor(gW.Y*0.84),240,340)end end)a.root=O("Frame",{Name="Root",Size=UDim2 .new(0,ak.w,0,ak.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=o.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},lc)
an(a.root,10)O("UIStroke",{Color=o.line,Thickness=1},a.root)local a2=UDim2 .new(1,0,1,0)local function K(sp,sq)return UDim2 .new(sp,0,0,0),UDim2 .new(sq,(sp+sq>0.99)and 0 or-4,1,0)end
local function H(Ai,Aj,Ak,Al,Am,An)local sr=O("TextButton",{Text=Aj,Position=Am,Size=An,BackgroundColor3=Ak,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=Al,TextColor3=o.text,AutoButtonColor=true},Ai)an(sr,6)return sr end local function gX(Ao,Ap,Aq,Ar,As)
local ld=O("TextBox",{Text=Ap,PlaceholderText=Aq,Position=Ar,Size=As,BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=o.text,PlaceholderColor3=o.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Ao)an(ld,6)O("UIPadding",{PaddingLeft=UDim.new(0,8)},ld)
return ld end local gY=as.CurrentCamera local function At()local Au,gZ=pcall(function()return gY and gY.ViewportSize end)
if Au and gZ and gZ.X>50 and gZ.Y>50 then return gZ end end local function bI(eB)local le=At()if not(le and eB and eB.Parent)then return end
local Av=pcall(function()local g0,ss=eB.AbsolutePosition,eB.AbsoluteSize local lf=70 local su=math.clamp(g0 .X,lf-ss.X,le.X-lf)
local sv=math.clamp(g0 .Y,0,le.Y-math.min(ss.Y,lf))if math.abs(su-g0 .X)>0.5 or math.abs(sv-g0 .Y)>0.5 then eB.Position=UDim2 .new(0,math.floor(su),0,math.floor(sv))
end end)return Av end local function g1(Aw)local Ax,lg=pcall(function()return Aw.AbsolutePosition end)if Ax and lg then return{math.floor(lg.X),math.floor(lg.Y)}end
end local cZ={}c.dragMoved={}local function sw(eC,sx,lh)V(eC.InputBegan:Connect(function(c0)if c0 .UserInputType~=Enum.UserInputType.MouseButton1 and c0 .UserInputType~=Enum.UserInputType.Touch then return end
local li={start=c0 .Position,from=sx.Position,moved=0,target=sx,input=c0,onDrop=lh}cZ[eC],c.dragMoved[eC]=li,0
local lj lj=c0 .Changed:Connect(function()if c0 .UserInputState==Enum.UserInputState.End and cZ[eC]==li then cZ[eC]=nil
if lj then lj:Disconnect()end if lh then lh(li.moved)end end end)end))end V(l7 .InputChanged:Connect(function(g2)
if g2 .UserInputType~=Enum.UserInputType.MouseMovement and g2 .UserInputType~=Enum.UserInputType.Touch then return end
for Ay,a3 in pairs(cZ)do local lk=a3 .target if lk and lk.Parent then local sy,sz=g2 .Position.X-a3 .start.X,g2 .Position.Y-a3 .start.Y
a3 .moved=math.max(a3 .moved,math.abs(sy)+math.abs(sz))c.dragMoved[Ay]=a3 .moved lk.Position=UDim2 .new(a3 .from.X.Scale,a3 .from.X.Offset+sy,a3 .from.Y.Scale,a3 .from.Y.Offset+sz)
end end end))V(l7 .InputEnded:Connect(function(g3)if g3 .UserInputType~=Enum.UserInputType.MouseButton1 and g3 .UserInputType~=Enum.UserInputType.Touch then return end
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
local function c1()local ll=O("ScrollingFrame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip+ak.tabs),Size=UDim2 .new(1,0,1,-(ak.head+ak.strip+ak.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=o.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
O("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},ll)O("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},ll)
return ll end a.farm,a.but,a.set,a.crt=c1(),c1(),c1(),c1()a.pet,a.team=c1(),c1()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local g5,eD,M=0,12,nil local function a4(sA,AH)g5,eD=g5+1,eD+sA+6 return O("Frame",{Size=UDim2 .new(1,0,0,sA),BackgroundTransparency=1,LayoutOrder=g5},AH or a.farm)
end local function sB(AI)T(a4(14),AI,10,o.dim,true)end M=a4(32)a.startB=H(M,"START",o.good,14,K(0,0.68))a.killB=H(M,"KILL",o.bad,14,K(0.68,0.32))
do local AJ=a4(40)local function eE(sC,AK,lm)local ln=O("Frame",{Position=UDim2 .new((sC-1)/lm,0,0,0),Size=UDim2 .new(1/lm,sC<lm and-4 or 0,1,0),
BackgroundColor3=o.panel,BorderSizePixel=0},AJ)an(ln,6)local sD=T(ln,"0",14,o.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,20))
local AL=T(ln,AK,9,o.dim,false,UDim2 .new(0,0,0,23),UDim2 .new(1,0,0,13))sD.TextXAlignment,AL.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return sD end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=eE(1,"BOUGHT",5),eE(2,"WAXED",5),eE(3,"SOLD",5),eE(4,"MONEY",5),eE(5,"FREE",5)
end a.info=T(a4(40),"",10,o.dim,false)a.tgt=T(a4(16),"",10,o.good,false)sB("SWITCHES")do local function c2(AM,AN)
local sE=a4(26)return H(sE,AM,o.panel2,10,K(0,0.5)),H(sE,AN,o.panel2,10,K(0.5,0.5))end a.colT,a.sellT=c2("COLLECT: ON","SELL THEM: ON")
a.crateT,a.arT=c2("OPEN CRATES: ON","AUTO ROLL: OFF")a.helpT,a.helpGT=c2("HELP WAXES: OFF","GUILD CALLS: OFF")
a.campT,a.ghostT=c2("CAMPFIRE: OFF","GHOST: OFF")a.ixT,a.bestT=c2("AUTO INDEX: OFF","BEST BUTTER: OFF")a.bcT,a.shT=c2("BEST CRATE: OFF","GRAB SHOWER: ON")
M=a4(26)a.questT=H(M,"QUESTS: OFF",o.panel2,10,K(0,0.5))T(M,"collect every",9,o.dim,false,K(0.52,0.2))a.secB=gX(M,tostring(d.Every),"60",K(0.72,0.13))
a.secB.TextSize=11 a.secSet=H(M,"SET",o.accent,10,K(0.85,0.15))local g6=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},a4(76))
an(g6,6)O("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},g6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,3)},g6)
local function eF(AO)local g7=T(g6,"",9,o.dim,false,nil,UDim2 .new(1,-6,0,14))g7 .LayoutOrder,g7 .TextWrapped,g7 .TextTruncate=AO,false,Enum.TextTruncate.AtEnd
return g7 end a.helpL,a.campL,a.questL,a.arL,a.ixL=eF(1),eF(2),eF(3),eF(4),eF(5)end sB("LOG")a.log=O("TextLabel",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},a4(84))an(a.log,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,eD)g5,eD=0,12 local function ai(AP)return a4(AP,a.set)end local function c3(AQ)T(ai(14),AQ,10,o.dim,true)end
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
a.set.CanvasSize=UDim2 .new(0,0,0,eD)local sF=O("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},lb)
a.tgRoot=O("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=o.accent,BorderSizePixel=0,Active=true},sF)an(a.tgRoot,20)O("UIStroke",{Color=o.line,Thickness=1},a.tgRoot)
a.tgBtn=O("TextButton",{Text="SAB",Size=a2,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=o.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=O("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=o.dim,BorderSizePixel=0},a.tgRoot)
an(a.tgDot,4)a.tgGhost=O("TextButton",{Text="G: OFF",Size=UDim2 .new(0,46,0,18),Position=UDim2 .new(0.5,-23,1,4),
BackgroundColor3=o.panel2,Font=Enum.Font.GothamBold,TextSize=9,TextColor3=o.text,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
an(a.tgGhost,6)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()local g8=j.ghostMode()
local sG=g8==2 and o.accent or(g8==1 and o.warn or o.panel2)if a.ghostT then a.ghostT.Text,a.ghostT.BackgroundColor3=j.GHOST[g8][1],sG end
if a.tgGhost then a.tgGhost.Text,a.tgGhost.BackgroundColor3=j.GHOST[g8][2],sG end end local bl={built=false,boxes={},at=0}
local function sH(sI,lo)d.Targets[sI]=lo or nil local lp=bl.boxes[sI]if lp then lp.Text=lo and"X"or""lp.BackgroundColor3=lo and o.good or o.panel2
end end local function lq()for AS,sJ in pairs(bl.boxes)do local sK=d.Targets[AS]==true sJ.Text=sK and"X"or""sJ.BackgroundColor3=sK and o.good or o.panel2
end end local eG local function AT()local AU=0 local lr=O("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=T(lr,"",10,o.dim,false,K(0,0.5))local AV=H(lr,"CLEAR",o.panel2,10,K(0.5,0.24))local AW=H(lr,"REFRESH",o.panel2,10,K(0.74,0.26))
AV.MouseButton1Click:Connect(function()for AX in pairs(d.Targets)do d.Targets[AX]=nil end lq()end)AW.MouseButton1Click:Connect(function()
ad.at=0 ia()eG(true)end)return AU end eG=function(AY)if not ia()then if not a.butEmpty then a.butEmpty=T(O("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,o.warn,false)end return end if bl.built and not AY and bl.at==ad.at then return end
for Ec,ls in ipairs(a.but:GetChildren())do if ls:IsA("Frame")or ls:IsA("TextButton")then ls:Destroy()end end bl.boxes,a.butEmpty={},nil
AT()local lt,lu=36,1 local function sL(sM)lu=lu+1 local AZ=O("Frame",{Size=UDim2 .new(1,0,0,sM),BackgroundTransparency=1,LayoutOrder=lu},a.but)
lt=lt+sM+6 return AZ end for Ed,g9 in ipairs(ad.rarOrder)do local A0=sL(24)local A1=sn[g9]or o.text local lv=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},A0)
an(lv,6)T(lv,"  "..g9:upper(),11,A1,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local A2=H(lv,"ALL",o.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local A3=g9 A2 .MouseButton1Click:Connect(function()local sN=ad.members[A3]or{}local sO=false for Ee,A4 in ipairs(sN)do if not d.Targets[A4]then sO=true break end end
for Ef,A5 in ipairs(sN)do sH(A5,sO)end end)for Eg,lw in ipairs(ad.members[g9]or{})do local A6=sL(22)local g_=O("TextButton",{Text="",Size=a2,BackgroundColor3=o.bg,BorderSizePixel=0,
AutoButtonColor=true},A6)an(g_,5)T(g_,"   "..ah(lw),11,o.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local lx=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},g_)an(lx,4)bl.boxes[lw]=lx local sP=lw local function sQ()sH(sP,not d.Targets[sP])end
g_.MouseButton1Click:Connect(sQ)lx.MouseButton1Click:Connect(sQ)end end lq()a.but.CanvasSize=UDim2 .new(0,0,0,lt+10)
bl.built,bl.at=true,ad.at end function L.paint()for A7,sR in pairs(L.boxes)do local sS=d.CrateTicks[A7]==true
sR.Text=sS and"X"or""sR.BackgroundColor3=sS and o.good or o.panel2 end if a.crtInfo then local ly,lz=0,0 for Eh in pairs(L.boxes)do ly=ly+1 end
for Ei,A8 in pairs(d.CrateTicks)do if A8 then lz=lz+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(ly,lz)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and o.accent or o.panel2
end end function L.build()for Ej,lA in ipairs(a.crt:GetChildren())do if lA:IsA("Frame")or lA:IsA("TextButton")then lA:Destroy()end
end L.boxes={}local lB,lC=12,0 local function ha(sT)lC=lC+1 lB=lB+sT+6 return O("Frame",{Size=UDim2 .new(1,0,0,sT),BackgroundTransparency=1,LayoutOrder=lC},a.crt)
end local lD=ha(28)a.crtInfo=T(lD,"",10,o.dim,false,K(0,0.5))local A9=H(lD,"CLEAR",o.panel2,10,K(0.5,0.24))local A_=H(lD,"REFRESH",o.panel2,10,K(0.74,0.26))
V(A9 .MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))V(A_.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=H(ha(28),"",o.accent,11,K(0,1))V(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
T(ha(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,o.dim,false)
for Ek,bm in ipairs(L.list())do local Ba=ha(24)local eH=O("TextButton",{Text="",Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,AutoButtonColor=true},Ba)
an(eH,5)T(eH,"  "..(bm.title or bm.name)..(bm.guess and"  (?)"or""),11,sn[bm.rar or""]or o.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
T(eH,bm.price and("$"..aJ(bm.price))or(bm.rar or""),9,o.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local lE=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},eH)an(lE,4)L.boxes[bm.k]=lE local sU=bm.k local function sV()d.CrateTicks[sU]=(not d.CrateTicks[sU])or nil
L.paint()end V(eH.MouseButton1Click:Connect(sV))V(lE.MouseButton1Click:Connect(sV))end a.crt.CanvasSize=UDim2 .new(0,0,0,lB+10)
L.built=L.at L.paint()end local sW="farm"local function bJ(ar)sW=ar a.farm.Visible,a.but.Visible,a.set.Visible=(ar=="farm"),(ar=="but"),(ar=="set")
a.crt.Visible=(ar=="crt")a.pet.Visible,a.team.Visible=(ar=="pet"),(ar=="team")a.tabCrt.BackgroundColor3=(ar=="crt")and o.accent or o.panel2
a.tabPet.BackgroundColor3=(ar=="pet")and o.accent or o.panel2 a.tabTeam.BackgroundColor3=(ar=="team")and o.accent or o.panel2
if ar=="pet"and not l.built then pcall(l.build)end if ar=="team"and not y.built then pcall(y.build)end if ar=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(ar=="farm")and o.accent or o.panel2 a.tabBut.BackgroundColor3=(ar=="but")and o.accent or o.panel2
a.tabSet.BackgroundColor3=(ar=="set")and o.accent or o.panel2 if ar=="but"then eG(false)end end local function N(hb,hc,Bb,Bc)
a.put(hb,hc and Bb or Bc)if a.lit[hb]~=hc then a.lit[hb]=hc hb.BackgroundColor3=hc and o.accent or o.panel2 end
end l.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function l.paintRow(sX)
local cg=l.rows and l.rows[sX]if not cg then return end local eI=d.Pets[sX]or{}cg.b.BackgroundColor3=eI.b and o.good or o.panel2
cg.g.BackgroundColor3=eI.g and o.accent or o.panel2 cg.g.Text=eI.g and"BIG"or"ANY"cg.w.BackgroundColor3=eI.w and o.warn or o.panel2
local lF=tonumber(eI.f)or 0 cg.f.Text=lF>0 and(lF.." BIG")or"FUSE"cg.f.BackgroundColor3=lF>0 and o.good or o.panel2
end function l.flag(lG,hd)local a5=d.Pets[lG]or{}if hd=="f"then local sY=((tonumber(a5 .f)or 0)+1)%4 a5 .f=sY>0 and sY or nil
elseif a5[hd]then a5[hd]=nil else a5[hd]=true end d.Pets[lG]=(a5 .b or a5 .g or a5 .w or a5 .f)and a5 or nil l.paintRow(lG)
end function l.paintAll()for Bd in pairs(l.rows or{})do l.paintRow(Bd)end if a.pbT then N(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function l.live()if not l.built then l.build()return end if x()-(l.liveAt or 0)<1 then return end l.liveAt=x()
local sZ=l.wishes()local eJ=l.data()for he,hf in pairs(l.rows)do hf.name.Text=l.nice(he)..(sZ[he]and("   * wish %dm"):format(math.ceil(sZ[he]/60))or"")
local s0=A.status(he,eJ)hf.desc.Text=s0 and(s0 .." | "..hf.boostText)or hf.boostText end local s1=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eJ and#(eJ.pets or{})or 0,eJ and tonumber(eJ.maxOwned)or 60,
aJ(l.money()),s1>0 and(" | free wishes "..s1)or"",l.buyMsg~=""and l.buyMsg or"-",l.wishMsg~=""and l.wishMsg or"-")
end function l.build()local hg=l.info()for El,lH in ipairs(a.pet:GetChildren())do if lH:IsA("Frame")or lH:IsA("TextLabel")then lH:Destroy()end
end l.rows={}local lI,hh=0,12 local function c4(s2)lI,hh=lI+1,hh+s2+6 return O("Frame",{Size=UDim2 .new(1,0,0,s2),BackgroundTransparency=1,LayoutOrder=lI},a.pet)
end local lJ=c4(28)a.pbT=H(lJ,"AUTO ADOPT: OFF",o.panel2,9,K(0,0.34))a.pwT=H(lJ,"AUTO WISH: OFF",o.panel2,9,K(0.34,0.33))
a.pfT=H(lJ,"AUTO FUSE: OFF",o.panel2,9,K(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy l.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish l.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse l.paintAll()end)
a.pInfo=T(c4(44),"",10,o.dim,false)T(c4(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,o.dim,false)
if not hg then T(c4(30),"pet list not loaded yet - open this tab again in a moment",11,o.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,hh)
l.built=false return end local c5={}for Em,s3 in ipairs(l.order())do local lK=hg.Pets[s3].rarity or"?"c5[lK]=c5[lK]or{}
table.insert(c5[lK],s3)end local c6={}for En,s4 in ipairs(hg.Rarities or{})do if c5[s4]then c6[#c6+1]=s4 end end
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
j.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()local lL=tonumber(a.pfMem.Text)if lL and lL>=0 then d.MemLimit=math.floor(lL)end
j.paint()end))function y.names()local lM={"(none)"}for Eq,Bj in ipairs((y.teams()))do lM[#lM+1]=Bj.name end return lM
end function y.cycle(lN,Bk)local hl=y.names()local Bl=d[lN]~=""and d[lN]or"(none)"local hm=table.find(hl,Bl)or 1
hm=((hm-1+Bk)%#hl)+1 d[lN]=hl[hm]=="(none)"and""or hl[hm]y.paint()end function y.paint()if not y.built then return end
N(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")N(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")
local lO={}for Er,Bm in ipairs((y.teams()))do lO[Bm.name]=true end for Bn,tc in pairs(y.pick)do local c7=d[Bn]
tc.Text=c7==""and"(none)"or(lO[c7]and c7 or(c7 .." (missing)"))tc.TextColor3=(c7~=""and not lO[c7])and o.bad or o.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(y.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(y.switches,y.finished,y.glazed,A.fused)
..(A.buildMsg~=""and("\n"..A.buildMsg)or"")local Bo,hn=l.srv(),{}for Es,ho in ipairs(y.list or{})do hn[#hn+1]=("st %-2s %-22s %9s  helps %d"):format(ho.st.Name,ah(aa(ho.name)):sub(1,22),y.clock(ho.ends-Bo),ho.helps)
end a.tmList.Text=#hn>0 and table.concat(hn,"\n")or"no waxes running"end function y.build()for Et,lP in ipairs(a.team:GetChildren())do
if lP:IsA("Frame")or lP:IsA("TextLabel")then lP:Destroy()end end y.pick={}local lQ,lR=0,12 local function bK(td)
lQ,lR=lQ+1,lR+td+6 return O("Frame",{Size=UDim2 .new(1,0,0,td),BackgroundTransparency=1,LayoutOrder=lQ},a.team)
end local function eK(Bp)T(bK(14),Bp,10,o.dim,true)end local function hp(hq)local lS=bK(26)local Bq=H(lS,"<",o.panel2,11,K(0,0.14))
local te=H(lS,"(none)",o.panel,10,K(0.14,0.72))local Br=H(lS,">",o.panel2,11,K(0.86,0.14))Bq.MouseButton1Click:Connect(function()y.cycle(hq,-1)end)
Br.MouseButton1Click:Connect(function()y.cycle(hq,1)end)te.MouseButton1Click:Connect(function()y.cycle(hq,1)end)
y.pick[hq]=te end a.tmT=H(bK(28),"AUTO TEAMS: OFF",o.panel2,11,K(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=y.current()end y.paint()end)a.tmInfo=T(bK(42),"",10,o.dim,false)
local tf=bK(26)a.tmBuild=H(tf,"AUTO BUILD TEAMS: OFF",o.panel2,9,K(0,0.62))a.tmBuildNow=H(tf,"BUILD NOW",o.warn,9,K(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild y.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if y.editing then return end A.buildMsg="building..."task.spawn(function()local Bs,Bt=pcall(A.rebuild,"you asked")if not Bs then z("BUILD ERR "..tostring(Bt))end end)
end)eK("NORMAL TEAM  (worn the rest of the time)")hp("TeamNormal")eK("FULL TEAM  (every station busy: money + wax speed)")
hp("TeamFull")eK("GLAZE TEAM  (worn just before a wax finishes)")hp("TeamGlaze")local lT=bK(26)a.tmLead=gX(lT,tostring(d.GlazeLead),"45",K(0,0.2))
T(lT,"sec before it finishes",10,o.dim,false,K(0.22,0.5))local Bu=H(lT,"SET",o.accent,11,K(0.75,0.25))Bu.MouseButton1Click:Connect(function()
local hr=tonumber(a.tmLead.Text)if hr and hr>=5 and hr<=600 then d.GlazeLead=math.floor(hr)else a.tmLead.Text=tostring(d.GlazeLead)end
y.paint()end)eK("WAX TEAM  (worn while a butter is placed: head starts)")hp("TeamWax")eK("YOUR WAXES  (time left, helps)")
a.tmList=O("TextLabel",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bK(150))an(a.tmList,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
T(bK(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,o.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,lR+10)y.built=true y.paint()end local function Bv()a.secB.Text=tostring(d.Every)
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not D.home then pcall(j.unpin)end end)end
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then ep(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bI(a.root)bI(a.tgRoot)c.lastCollect=x()
lq()L.paint()pcall(l.paintAll)pcall(y.paint)pcall(j.applyAll)end local function Bw(th)task.spawn(function()th.TextColor3=o.bad
task.wait(0.8)if c.alive then th.TextColor3=o.text end end)end local function ti()local tj=a.secB.Text:match("^%s*(%d+)%s*$")
local eL=tj and tonumber(tj)if not eL or eL<1 then a.secB.Text=tostring(d.Every)Bw(a.secB)z("interval must be a whole number >= 1")
return end if eL==d.Every then return end d.Every,c.lastCollect=eL,x()z("collect every "..eL.."s")end local function P(Bx,By)V(Bx.MouseButton1Click:Connect(By))end
P(a.secSet,ti)V(a.secB.FocusLost:Connect(ti))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(aq,"selling...",q9)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(C.apply,"you asked",true)
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
end)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(aq,"opening crate...",fJ,true)
end)P(a.padB,function()c.plot=bn()or c.plot local tk,lU=au(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(tk and lU and lU:IsA("BasePart"))then z("SET PAD: need character and plot")return end c.manualPad=lU.CFrame:ToObjectSpace(tk.HumanoidRootPart.CFrame)
y0(c.manualPad)z("collect pad saved at your position")end)P(a.startB,function()ep(not c.running)end)P(a.buyB,function()
c.plot=bn()or c.plot task.spawn(aq,"buying (manual)...",nO,true)end)P(a.plB,function()c.plot=bn()or c.plot task.spawn(aq,"waxing (manual)...",nT)
end)P(a.tabFarm,function()bJ("farm")end)P(a.tabBut,function()bJ("but")end)P(a.tabSet,function()bJ("set")end)P(a.tabCrt,function()bJ("crt")end)
P(a.tabPet,function()bJ("pet")end)P(a.tabTeam,function()bJ("team")end)local function BD(lV)c.hidden=lV a.root.Visible=not lV
a.tgBtn.Text=lV and"SAB+"or"SAB"end sw(a.tgBtn,a.tgRoot,function()bI(a.tgRoot)c.togPos=g1(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then BD(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aH,av={},0
local function bL()aH=na()if#aH==0 then a.cfgPick.Text="(none saved)"av=0 return end if av<1 or av>#aH then av=1 end
a.cfgPick.Text=aH[av]..("  (%d/%d)"):format(av,#aH)end local function tl()local tm=c.autoload~=nil a.cfgAuto.Text=tm and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=tm and o.accent or o.panel2 end local function lW()local tn=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if tn~=""then return tn end return(av>0 and aH[av])or""end P(a.cfgSave,function()c.winPos=g1(a.root)or c.winPos
c.togPos=g1(a.tgRoot)or c.togPos local to,tp=fo(lW())a.cfgMsg.Text=to and("saved as "..tp)or("could not save: "..tp)
a.cfgMsg.TextColor3=to and o.good or o.bad bL()z(a.cfgMsg.Text)end)local function BE(lX)local lY,tq=nj(lX)a.cfgMsg.Text=lY and("loaded "..tq)or("could not load: "..tq)
a.cfgMsg.TextColor3=lY and o.good or o.bad if lY then a.cfgName.Text=lX Bv()task.spawn(C.apply,"config "..lX)
end z(a.cfgMsg.Text)end P(a.cfgLoad,function()BE(lW())end)P(a.cfgPick,function()bL()if av>0 then a.cfgName.Text=aH[av]end
end)P(a.cfgPrev,function()if#aH==0 then bL()return end av=(av-2)%#aH+1 bL()a.cfgName.Text=aH[av]end)P(a.cfgNext,function()
if#aH==0 then bL()return end av=av%#aH+1 bL()a.cfgName.Text=aH[av]end)P(a.cfgAuto,function()if c.autoload then
nl(nil)a.cfgMsg.Text="it will not load a config on launch"else local eM=lW()local tr=false for Eu,BF in ipairs(na())do if BF==eM then tr=true end end
local BG=tr or fo(eM)if BG and eM~=""then nl(eM)bL()a.cfgMsg.Text=eM.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=o.dim tl()end)P(a.autoB,function()
local ts,tt=vm()a.autoMsg.Text=ts and("installed. "..tt)or("failed: "..tt)a.autoMsg.TextColor3=ts and o.good or o.bad
z(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()dp("you asked")end)
local bM=false P(a.minB,function()bM=not bM a.tabs.Visible=not bM if bM then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bJ(sW)end a.root.Size=UDim2 .new(0,ak.w,0,bM and(ak.head+ak.strip)or ak.h)
a.minB.Text=bM and"+"or"-"end)local function hs()if not c.alive then return end c.alive,c.running=false,false
pcall(j.restoreAll)pcall(eZ)for Ev,BH in ipairs(hC)do pcall(function()BH:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()lc:Destroy()end)pcall(function()sF:Destroy()end)if cm.SAB_KILL==hs then cm.SAB_KILL=nil end end
cm.SAB_KILL=hs P(a.killB,hs)P(a.xB,hs)sw(a.title,a.root,function()bI(a.root)c.winPos=g1(a.root)or c.winPos end)
local function tu()local eN,ck=c.reason,c.level if c.busy then eN,ck=c.busyText,"ok"elseif not c.running then
local Ew,tv,BI=rI()if c.capHit then eN,ck=tv,"bad"else eN,ck="[stopped] "..tv,(BI=="bad")and"bad"or"idle"end c.reason,c.level=eN,ck
end local ht=c.running and o.good or(c.capHit and o.bad or o.dim)if a.lit.dot~=ht then a.lit.dot=ht a.dot.BackgroundColor3,a.tgDot.BackgroundColor3=ht,ht end
if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and o.panel2 or o.accent end if c.hidden then return end
a.put(a.reason,eN)if a.lit.bar~=ck then a.lit.bar=ck a.bar.BackgroundColor3=z_[ck]or o.dim end if bM then return end
if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and o.warn or o.good
end N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")local bN=uX()if a.farm.Visible then
local BJ,BK=eW()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,BJ.."/"..BK)local tw=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local tx=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aJ(a6()),c.rolls,c.gifts,c.crates,tx and ah(aa(tx))or"nothing",e.on and("   ["..e.title.." window open]")or"",
tw and("in "..tw.."s")or"off"))a.put(a.tgt,(#bN==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bN<=3)and table.concat(bN,", ")or(#bN.." butters ticked"))))
if a.lit.tgt~=(#bN==0)then a.lit.tgt=(#bN==0)a.tgt.TextColor3=(#bN==0)and o.bad or o.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(eQ,"\n")end
end if a.set.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bN))
end if a.but.Visible and bl.at~=ad.at then eG(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then l.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak)
end if a.team.Visible then y.paint()end if a.farm.Visible then a.put(a.helpL,"help: "..((d.Help or d.HelpGuild)and D.msg or"off"))
a.put(a.campL,"camp: "..(d.Campfire and J.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests: "..(d.Quests and(E.msg~=""and E.msg or"checking...")or"off"))a.put(a.ixL,q.msg)N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local ty=(C.rec.on and"on"or"")..(C.rec.off and((C.rec.on and"/"or"").."off")or"")
a.put(a.arL,C.msg~=""and C.msg or("auto roll: game %s | learned %s%s"):format(C.isOn()and"ON"or"off",ty~=""and ty or"nothing yet",#C.rec.rules>0 and", choices"or""))
if a.lit.arL~=(C.msg~="")then a.lit.arL=(C.msg~="")a.arL.TextColor3=C.msg~=""and o.warn or o.dim end end end cm.SAB={S=c,CFG=d,EV=W,U=a,sg=lc,CAT=ad,LEARN=ag,buildList=eG,
logAll=c8,evAll=c9,AR=C,CR=L,PF=j,PX=l,TM=y,CRATE=e,FU=A,HX=D,CF=J,QX=E,IX=q,SH=Q}z(cl.." loaded")if c.uiErrs>0 then z("UI: "..c.uiErrs.." properties skipped")end
bJ("farm")bI(a.root)bI(a.tgRoot)if gY then pcall(function()V(gY:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bI(a.root)bI(a.tgRoot)end))end)end bL()tl()if c.config and c.config~=""then a.cfgName.Text=c.config end
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(tu)task.spawn(function()local tz=vk()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(tz and("\n(backup: "..tz..")")or"")
local tA=fi(al.exec)if tA and not tA:find("SAB autoloader v2",1,true)then dk(al.exec,al.stub)z("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fi(al.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(vs)end)task.spawn(function()while c.alive do local BL,BM=pcall(tu)if not BL then z("UI ERR "..tostring(BM))end
task.wait((c.hidden or bM)and 1.5 or 0.4)end end)task.spawn(function()local BN,BO=pcall(vA)if not BN then z("HOOK ERR "..tostring(BO))end
end)task.spawn(function()pcall(ui)if e.loadSeq and not e.learned then local hu={}for tB=1,20 do if e.loadSeq[tB]then hu[#hu+1]=e.loadSeq[tB]end end
if#hu>0 then e.learned={seq=hu,mode=e.loadMode}z("remembered how to open crates directly")end end if ia()then z(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local BP,tC=pcall(y2)if BP and tC and c.alive and not c.manualPad then c.manualPad=tC end end)task.spawn(function()
while c.alive do local lZ,l0=pcall(l.buyTick)if not lZ then z("PET ERR "..tostring(l0))task.wait(5)end lZ,l0=pcall(l.wishTick)
if not lZ then z("WISH ERR "..tostring(l0))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local hv,tD=0,x()
V(game:GetService("RunService").Heartbeat:Connect(function()hv=hv+1 end))V(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=x()while c.alive do task.wait(1)local tE=x()j.fps,hv,tD=hv/math.max(tE-tD,0.001),0,tE local BQ,BR=pcall(j.tick)
if not BQ then z("PERF ERR "..tostring(BR))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local BS,BT=pcall(A.tick)if not BS then z("FUSE ERR "..tostring(BT))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local BU,BV=pcall(y.tick)if not BU then z("TEAM ERR "..tostring(BV))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local hw=aj:WaitForChild("Remotes",30)local tF=hw and hw:WaitForChild("ClanEvent",30)
if tF and c.alive then V(tF.OnClientEvent:Connect(function(BW,BX)if BW=="call"then pcall(D.onCall,BX)end end))
end local tG=hw and hw:FindFirstChild("RollConfirmAsk")if tG and c.alive then V(tG.OnClientEvent:Connect(function(BY)E.asked=BY or"butter"end))end
end)task.spawn(function()local l1=aj:WaitForChild("Remotes",30)if not(l1 and c.alive)then return end local function hx(BZ,B0)
local l2=l1:FindFirstChild(BZ)if l2 and l2:IsA("RemoteEvent")then V(l2 .OnClientEvent:Connect(function(...)pcall(B0,...)end))end
end hx("NewSquishyDiscovered",function(l3,tH)if type(l3)~="string"then return end q.disc=q.disc or{}q.disc[aa(l3)]=true
z(("INDEX: %s%s is in your Index now"):format(ah(aa(l3)),tH and(" ("..tostring(tH)..")")or""))end)hx("IndexRefresh",q.loadDisc)
hx("IndexRowComplete",function(B1)z("INDEX: the whole "..tostring(B1).." row is complete")end)hx("AdminShow",q.admin)
local tI=l1:FindFirstChild("AdminShowSync")if tI then local B2,tJ=pcall(function()return tI:InvokeServer()end)
if B2 and type(tJ)=="table"then for Ex,B3 in pairs(tJ)do pcall(Q.add,B3)end end end while c.alive do local B4,B5=pcall(q.tick)
if not B4 then q.msg="index error: "..tostring(B5)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local B6,B7=pcall(E.tick)if not B6 then z("QUEST ERR "..tostring(B7))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(eZ)end end)pcall(C.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local B9=(type(newcclosure)=="function")and newcclosure or function(B8)return B8 end local l4
local tK=(type(setnamecallmethod)=="function")and setnamecallmethod or nil l4=hookmetamethod(game,"__namecall",B9(function(tL,...)
local eO=getnamecallmethod()if c.alive and(eO=="InvokeServer"or eO=="FireServer")then local tM,tN=pcall(function()return tL.Name end)
if tM and tN=="CrateAction"and not e.replaying then pcall(e.saw,eO,...)elseif tM and tN=="AutoRollAction"and not C.replaying then pcall(C.saw,eO,...)end
if tK then tK(eO)end end return l4(tL,...)end))e.oldNC=l4 end)end if hA then V(F.Idled:Connect(function()pcall(function()hA:CaptureController()hA:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Ey=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and au()and(c.plot or bn())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then C.apply("joined")end while c.alive do task.wait(30)local hy=bS()
if hy and q.on()and not aI(hy.name)then hy=nil end if c.alive and d.AutoRoll and c.running and not C.isOn()and not hy and not ac()
and not e.waiting and not e.on and not c.busy then C.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Ez=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bn()if au()and c.plot and q.any()then ep(true,true)z("started by itself")
return end task.wait(1)end if c.alive and not c.running then z("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bn()c.lastCollect=x()while c.alive do if c.running then local B_,tO=pcall(z5)if not B_ and tO~=hB then z("LOOP ERR "..tostring(tO))end
end task.wait(0.1)end end)hz("loaded - window is at the top left")end local Cb,l5=xpcall(tS,function(Ca)return tostring(Ca).."\n"..debug.traceback()end)
if not Cb then pcall(function()warn("SAB "..cl.." ERROR: "..tostring(l5))end)hz("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cl.." ERROR: "..tostring(l5))end)pcall(function()local tP=(type(getgenv)=="function"and getgenv())or _G
if type(tP.SAB_KILL)=="function"then tP.SAB_KILL()end for EA,Cc in ipairs({"SABFarmGui","SABToggle"})do local tQ=F.PlayerGui:FindFirstChild(Cc)
if tQ then tQ:Destroy()end end end)pcall(function()local eP=Instance.new("ScreenGui")eP.Name="SABError"eP.ResetOnSpawn=false
eP.DisplayOrder=1000 local aX=Instance.new("TextBox")aX.Size=UDim2 .new(0,340,0,170)aX.Position=UDim2 .new(0,10,0,50)
aX.BackgroundColor3=Color3 .fromRGB(90,20,20)aX.TextColor3=Color3 .new(1,1,1)aX.TextSize=11 aX.TextWrapped=true
aX.ClearTextOnFocus=false aX.TextXAlignment=Enum.TextXAlignment.Left aX.TextYAlignment=Enum.TextYAlignment.Top
aX.Text="SAB "..cl.." failed to start. Send this text:\n"..tostring(l5)aX.Parent=eP eP.Parent=F:WaitForChild("PlayerGui")
end)end
