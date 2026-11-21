local cl="v26"local l1=game:GetService("Players")local F=l1 .LocalPlayer or l1 .PlayerAdded:Wait()local function hv(tH)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..cl,Text=tH,Duration=6})
end)end hv("script started")local function tI()local aj=game:GetService("ReplicatedStorage")local as=game:GetService("Workspace")
local l2=game:GetService("UserInputService")local cm=(type(getgenv)=="function"and getgenv())or _G if type(cm.SAB_KILL)=="function"then pcall(cm.SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local hw=(function()local tJ,tK=pcall(function()return game:GetService("VirtualUser")end)return tJ and tK or nil end)()
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
local l,y,j,A,D,J,E={},{},{},{},{},{},{}local q,Q={},{}local hx={}local hy,eO,c7,c8={},{},{},{}local function V(l3)hy[#hy+1]=l3 return l3 end
local function af(tL)task.wait(tL)if not c.alive then error(hx,0)end end local function z(eP)eP=os.date("%H:%M:%S").." "..tostring(eP)
table.insert(eO,1,eP)if#eO>6 then table.remove(eO)end c.logN=(c.logN or 0)+1 c7[#c7+1]=eP if#c7>80 then table.remove(c7,1)end
end local function eQ(l4)if type(l4)~="string"then return""end return(l4:lower():gsub("[^%w]",""))end local function aa(tM)
local l5=eQ(tM)local hz=l5:gsub("butter$","")if hz==""then hz=l5 end return hz end local function aI(l6)if type(l6)~="string"then return false end
local hA=aa(l6)if hA==""then return false end if q.want then return q.want(hA)end return d.Targets[hA]==true end
local function tN(c9)c9=c9:lower()return c9:find("squishy",1,true)~=nil or c9:match("butter$")~=nil or c9:match("butter[^%a]")~=nil
end local hB={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aJ(c_)if type(c_)~="number"then return"?"end
local eR=1 while math.abs(c_)>=1000 and eR<#hB do c_=c_/1000 eR=eR+1 end local tO=string.format("%.2f",c_):gsub("%.?0+$","")
return tO..hB[eR]end local function tP(l7)if type(l7)~="string"then return nil end local tQ,l8=l7:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local hC=tonumber(tQ)if not hC then return nil end if l8==""then return hC end for tR,tS in ipairs(hB)do if tS:lower()==l8:lower()then return hC*1000^(tR-1)end end
return nil end local function a6()local l9=F:GetAttribute("BoardValueMoney")if type(l9)=="number"then return l9 end
local l_=F:FindFirstChild("leaderstats")if l_ then for B3,tT in ipairs({"Cash","Money","Coins"})do local hD=l_:FindFirstChild(tT)
if hD and type(hD.Value)=="number"then return hD.Value end end end end local function eS(tU)local hE=tU:GetFullName()
if c.plot then local hF=c.plot:GetFullName()if hE:sub(1,#hF)==hF then return hE:sub(#hF+2)end end return hE end
local function au()local eT=F.Character if eT and eT:FindFirstChild("HumanoidRootPart")then local ma=eT:FindFirstChildOfClass("Humanoid")
if ma and ma.Health>0 then return eT end end end local function bn()local hG=as:FindFirstChild("Plots")if not hG then return nil end
local function mb(tV)local mc=tV:FindFirstChild("Plate")return mc~=nil and mc:FindFirstChild("EditStackAttachment",true)~=nil
end local md=F:GetAttribute("PlotNumber")if md~=nil then local hH=hG:FindFirstChild(tostring(md))if hH and mb(hH)then return hH end
end for B4,me in ipairs(hG:GetChildren())do if mb(me)then return me end end end local function da(mf)local bo=mf and mf.Parent
for B5=1,6 do if not bo then return nil end if bo:IsA("BasePart")then return bo end if bo:IsA("Model")then return bo.PrimaryPart or bo:FindFirstChildWhichIsA("BasePart",true)end
bo=bo.Parent end end local function mg(mh)local hI=mh.Parent if hI and hI:IsA("Attachment")then return hI.WorldPosition end
local mi=da(mh)return mi and mi.Position end local function mj()local cn=c.plot and c.plot:FindFirstChild("Plate")
if not cn then return nil end if cn:IsA("BasePart")then return cn.Position end if cn:IsA("Model")then return cn:GetPivot().Position end
local mk=cn:FindFirstChildWhichIsA("BasePart",true)return mk and mk.Position end local function ml()local hJ={}
local mm=c.plot and c.plot:FindFirstChild("WaxStations")if mm then for B6,tW in ipairs(mm:GetChildren())do local mn=tW:FindFirstChild("SquishyPlaceHolder")
local hK=mn and mn:FindFirstChild("PlacePrompt")if hK and hK:IsA("ProximityPrompt")then hJ[#hJ+1]=hK end end end
return hJ end local function eU()local mo,hL=ml(),0 for B7,tX in ipairs(mo)do if tX.Enabled then hL=hL+1 end end
local hM=#mo local hN=F:GetAttribute("WaxStations")if type(hN)=="number"and hN>hM then hM=hN end return hL,hM
end local function tY()local mp=au()local mq=mp and mp.HumanoidRootPart.Position local hO,mr for B8,hP in ipairs(ml())do
if hP.Enabled then local ms=mg(hP)local mt=(ms and mq)and(ms-mq).Magnitude or 1e9 if not hO or mt<mr then hO,mr=hP,mt end
end end return hO end local function mu()local eV=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not eV then return nil end local mv=eV:FindFirstChild("BuyPromptAttachment")local eW=(mv and mv:FindFirstChild("BuyPrompt"))or eV:FindFirstChild("BuyPrompt",true)
if eW and eW:IsA("ProximityPrompt")and eW:IsDescendantOf(eV)then return eW end end local mw={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local tZ={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ag={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local hQ="SAB_order.txt"local function eX()if not ag.dirty or type(writefile)~="function"then return end local aA={}
for t0,t1 in pairs(ag.price)do aA[#aA+1]="P|"..t0 .."|"..string.format("%.0f",t1)end for t2,t3 in pairs(ag.order)do aA[#aA+1]="O|"..t2 .."|"..table.concat(t3,",")end
if e.learned and e.enc then aA[#aA+1]="M|mode|"..tostring(e.learned.mode or"")for t4,eY in ipairs(e.learned.seq)do
local mx={}for my=1,eY.n do mx[my]=e.enc(eY.args[my])end aA[#aA+1]=("A|%d|%s|%d|%s"):format(t4,eY.m,eY.n,table.concat(mx,";"))
end end local function hR(t5,t6,eZ)local mz={}for mA=1,eZ.n do mz[mA]=e.enc(eZ.args[mA])end aA[#aA+1]=("R|%d|%s|%s|%d|%s"):format(t6,t5,eZ.m,eZ.n,table.concat(mz,";"))
end if e.enc then for t7,t8 in ipairs(C.rec.rules)do hR("rules",t7,t8)end if C.rec.on then hR("on",0,C.rec.on)end
if C.rec.off then hR("off",0,C.rec.off)end end for B9,db in pairs(L.seen)do aA[#aA+1]=("K|%s|%s|%s|%s"):format(db.name,db.title or"",db.rar or"",db.price and string.format("%.0f",db.price)or"")
end if pcall(writefile,hQ,table.concat(aA,"\n"))then ag.dirty=false end end local function t9()if type(isfile)~="function"or type(readfile)~="function"then return end
local t_,ua=pcall(isfile,hQ)if not(t_ and ua)then return end local ub,mB=pcall(readfile,hQ)if not(ub and type(mB)=="string")then return end
for uc in mB:gmatch("[^\n]+")do local co,cp,a7=uc:match("^(%a)|([^|]+)|(.*)$")if co=="P"then ag.price[cp]=tonumber(a7)
elseif co=="M"then e.loadMode=(a7~=""and a7~="nil")and a7 or nil elseif co=="A"and e.dec then local mC=tonumber(cp)
local mD,e0,ud=a7:match("^([^|]+)|(%d+)|(.*)$")if mC and mD then e0=tonumber(e0)local mE,e1={},0 for ue in(ud..";"):gmatch("([^;]*);")do
e1=e1+1 if e1<=e0 then mE[e1]=e.dec(ue)end end e.loadSeq=e.loadSeq or{}e.loadSeq[mC]={m=mD,n=e0,args=mE}end elseif co=="R"and e.dec then
local mF=tonumber(cp)local e2,uf,e3,ug=a7:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if mF and e2 then e3=tonumber(e3)
local mG,e4={},0 for uh in(ug..";"):gmatch("([^;]*);")do e4=e4+1 if e4<=e3 then mG[e4]=e.dec(uh)end end local hS={m=uf,n=e3,args=mG}
if e2=="rules"then C.rec.rules[mF]=hS elseif e2=="on"then C.rec.on=hS elseif e2=="off"then C.rec.off=hS end end
elseif co=="K"then local mH,mI,ui=a7:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cp)]={name=cp,title=mH~=""and mH or nil,
rar=mI~=""and mI or nil,price=tonumber(ui)}elseif co=="O"and a7~=""then local e5={}for uj in a7:gmatch("[^,]+")do e5[#e5+1]=uj end
if#e5>0 then ag.order[cp]=e5 end end end end local function uk(e6)if type(e6)~="table"then return end local bO,mJ=e6 .rarity,e6 .contents
if type(bO)~="string"or bO==""or type(mJ)~="table"then return end local dc={}for B_,e7 in ipairs(mJ)do if type(e7)=="table"and type(e7 .butter)=="string"then
dc[#dc+1]={n=e7 .butter,ch=tonumber(e7 .chance)or 0}end end if#dc==0 then return end table.sort(dc,function(ul,um)return ul.ch>um.ch end)
local dd,de={},false for uo,up in ipairs(dc)do dd[uo]=up.n end local hT=ag.order[bO]if not hT or#hT~=#dd then de=true end
if not de then for mK=1,#dd do if hT[mK]~=dd[mK]then de=true break end end end ag.order[bO]=dd local hU=tonumber(e6 .price)
if hU and ag.price[bO]~=hU then ag.price[bO]=hU de=true end if de then ag.dirty=true ad.at=0 z("learned the "..bO.." order from its crate")
end end local function cq(uq,ur)local us=uq:FindFirstChild(ur,true)local ut,hV=pcall(function()return us.Text end)
return(ut and type(hV)=="string"and hV~="")and hV or nil end local function ah(mL)return ad.pretty[mL]or mL end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(uu)return eQ(uu or"")end
function L.learn(a8)if type(a8)~="table"or type(a8 .name)~="string"then return end local hW=L.key(a8 .name)local a9=L.seen[hW]or{}
local uv=(L.seen[hW]==nil)or(tonumber(a8 .price)and a9 .price~=tonumber(a8 .price))a9 .name,a9 .title=a8 .name,a8 .title or a9 .title
a9 .rar,a9 .price=a8 .rarity or a9 .rar,tonumber(a8 .price)or a9 .price L.seen[hW]=a9 if uv then L.at,ag.dirty=x(),true end
end function L.wanted(mM)if mM==nil then return false end local hX=L.key(mM)return d.CrateTicks[hX]==true or(d.BestCrate and q.bestCrate~=nil and(hX==q.bestCrate or hX==q.bestCrateTitle))
end function L.list()local cr={}for uw,e8 in ipairs(L.base)do cr[L.key(e8[1])]={name=e8[1],title=e8[2],rar=e8[3],i=uw}end
for Ca,df in ipairs(ad.rarOrder)do local mN=false for Cb,ux in pairs(cr)do if ux.rar==df then mN=true break end end
if not mN and df~="?"then local mO=df:gsub("[^%w]","").."Crate"cr[L.key(mO)]={name=mO,title=df.." Crate",rar=df,i=50,guess=true}
end end for mP,e9 in pairs(L.seen)do local aX=cr[mP]or{i=100}aX.name,aX.title,aX.rar=e9 .name or aX.name,e9 .title or aX.title,e9 .rar or aX.rar
aX.price,aX.guess=e9 .price or aX.price,nil cr[mP]=aX end local dg,e_={},{}for uy,uz in ipairs(mw)do dg[uz]=uy end
for uA,mQ in ipairs(ad.rarOrder)do dg[mQ]=dg[mQ]or(20+uA)end for uB,dh in pairs(cr)do dh.k=uB dh.price=dh.price or ag.price[dh.rar or""]
e_[#e_+1]=dh end table.sort(e_,function(bP,bQ)if bP.price and bQ.price and bP.price~=bQ.price then return bP.price<bQ.price end
local mR,mS=dg[bP.rar or""]or 99,dg[bQ.rar or""]or 99 if mR~=mS then return mR<mS end if(bP.i or 100)~=(bQ.i or 100)then return(bP.i or 100)<(bQ.i or 100)end
return bP.k<bQ.k end)return e_ end local function uC()local mT=aj:FindFirstChild("Assets")local mU=mT and mT:FindFirstChild("Squishies")
if not mU then return false end local hY,mV,cs={},{},{}local fa=0 for Cc,fb in ipairs(mU:GetChildren())do local di=aa(fb.Name)
if di~=""and not hY[di]then local fc=cq(fb,"RarityText")or"?"hY[di]=fc mV[di]=cq(fb,"NameText")or fb.Name cs[fc]=cs[fc]or{}
table.insert(cs[fc],di)fa=fa+1 end end if fa==0 then return false end for mW,uD in pairs(cs)do local mX=ag.order[mW]or tZ[mW]
local hZ={}if mX then for uE,uF in ipairs(mX)do hZ[aa(uF)]=uE end end table.sort(uD,function(mY,mZ)local h0,h1=hZ[mY],hZ[mZ]
if h0 and h1 then return h0<h1 end if h0 then return true end if h1 then return false end return ah(mY)<ah(mZ)
end)end local h2={}for uG,uH in ipairs(mw)do h2[uH]=uG end local fd,bR={},{}for uI in pairs(cs)do fd[#fd+1]=uI end
pcall(function()for uJ,uK in ipairs(require(aj.Modules.SquishyRNG).Keys)do bR[uK]=uJ end end)table.sort(fd,function(ct,cu)
if bR[ct]and bR[cu]and bR[ct]~=bR[cu]then return bR[ct]<bR[cu]end local h3,h4=ag.price[ct],ag.price[cu]if h3 and h4 and h3~=h4 then return h3<h4 end
local h5,h6=h2[ct],h2[cu]if h5 and h6 then return h5<h6 end if h5 then return true end if h6 then return false end
return ct<cu end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=hY,mV,cs,fd,fa,x()return true end local function h7()
if ad.at==0 or(x()-ad.at)>120 then pcall(uC)end return ad.n>0 end local function uL(uM)local m0=aa(uM)return ad.rar[m0]or(W.name and aa(W.name)==m0 and W.rar)or"?"
end local function uN()local fe={}local uO=((d.Best or 0)>0 and next(q.best or{}))and q.best or d.Targets for uP,uQ in pairs(uO)do if uQ then fe[#fe+1]=ah(uP)end end
table.sort(fe)return fe end local al={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function m1()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function ff(m2)if type(makefolder)~="function"then return end local uR,uS=pcall(isfolder,m2)if not(uR and uS)then pcall(makefolder,m2)end
end local function fg(m3)if type(isfile)~="function"or type(readfile)~="function"then return nil end local uT,uU=pcall(isfile,m3)
if not(uT and uU)then return nil end local uV,uW=pcall(readfile,m3)return uV and uW or nil end local function dj(uX,uY)
if type(writefile)~="function"then return false end return(pcall(writefile,uX,uY))end local function m4(uZ)local dk={}
if type(listfiles)~="function"then return dk end local u0,m5=pcall(listfiles,uZ)if not u0 or type(m5)~="table"then return dk end
for Cd,u1 in ipairs(m5)do dk[#dk+1]=tostring(u1)end return dk end local function m6()local fh={}for Ce,u2 in ipairs(m4(al.cfg))do
local m7=u2:match("([^/\\]+)%.txt$")if m7 then fh[#fh+1]=m7 end end table.sort(fh)return fh end local function u3()
local ab={"V|1"}ab[#ab+1]="N|Every|"..tostring(d.Every)ab[#ab+1]="N|GlazeLead|"..tostring(d.GlazeLead)ab[#ab+1]="N|FpsCap|"..tostring(d.FpsCap)
ab[#ab+1]="N|MemLimit|"..tostring(d.MemLimit)ab[#ab+1]="N|Best|"..tostring(d.Best or 0)for Cf,m8 in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ab[#ab+1]="S|"..m8 .."|"..d[m8]end
do local fi={}for u4,dl in pairs(d.Pets)do local m9=(dl.b and"b"or"")..(dl.g and"g"or"")..(dl.w and"w"or"")..((tonumber(dl.f)or 0)>0 and tostring(dl.f)or"")
if m9~=""then fi[#fi+1]=u4 .."|"..m9 end end table.sort(fi)ab[#ab+1]="P|-"for Cg,u5 in ipairs(fi)do ab[#ab+1]="P|"..u5 end
end for Ch,m_ in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower"})do
ab[#ab+1]="B|"..m_.."|"..(d[m_]and"1"or"0")end local h8=F:GetAttribute("AutoRollRules")if type(h8)=="string"and h8~=""then d.ARrules,d.ARstop=h8,tostring(F:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then ab[#ab+1]="S|rules|"..d.ARrules ab[#ab+1]="S|stop|"..d.ARstop end if c.winPos then ab[#ab+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ab[#ab+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Ci,h9 in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fj={}for u6,u7 in pairs(h9[2])do if u7 then fj[#fj+1]=u6 end end table.sort(fj)ab[#ab+1]=h9[1].."|-"for Cj,u8 in ipairs(fj)do ab[#ab+1]=h9[1].."|"..u8 end
end return table.concat(ab,"\n")end local function u9(h_)if type(h_)~="string"or h_==""then return false end local na,nb,nc,nd,dm={},false,{},false,nil
for u_ in h_:gmatch("[^\n]+")do local aB,ae,aw=u_:match("^(%a)|([^|]*)|?(.*)$")if aB=="N"and ae=="Every"then local ia=tonumber(aw)
if ia and ia>=1 then d.Every=math.floor(ia)end elseif aB=="N"and(ae=="FpsCap"or ae=="MemLimit")then local ib=tonumber(aw)
if ib and ib>=0 then d[ae]=math.floor(ib)end elseif aB=="N"and ae=="Best"then local fk=tonumber(aw)if fk and fk>=0 and fk<=3 then d.Best=math.floor(fk)end
elseif aB=="N"and ae=="GlazeLead"then local fl=tonumber(aw)if fl and fl>=5 and fl<=600 then d.GlazeLead=math.floor(fl)end
elseif aB=="S"and(ae=="TeamNormal"or ae=="TeamFull"or ae=="TeamGlaze"or ae=="TeamWax")then d[ae]=aw elseif aB=="P"and ae~=""then
if not dm then dm={}end if ae~="-"and aw~=""then dm[ae]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aB=="B"then if d[ae]~=nil then d[ae]=(aw=="1")end
elseif aB=="S"and ae=="rules"then d.ARrules=aw elseif aB=="S"and ae=="stop"then d.ARstop=aw elseif aB=="W"then
c.winPos={tonumber(ae)or 10,tonumber(aw)or 44}elseif aB=="G"then c.togPos={tonumber(ae)or 10,tonumber(aw)or 300}
elseif aB=="T"and ae~=""then if ae~="-"then na[ae]=true end nb=true elseif aB=="K"and ae~=""then if ae~="-"then nc[ae]=true end
nd=true end end if nb then d.Targets=na end if nd then d.CrateTicks=nc end if dm then d.Pets=dm end return true
end local function fm(cv)if not m1()then return false,"this executor cannot write files"end cv=(cv or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cv==""then return false,"give the config a name"end ff(al.dir)ff(al.cfg)if not dj(al.cfg.."/"..cv..".txt",u3())then return false,"could not write the file"end
c.config=cv return true,cv end local function ne(fn)local nf=fg(al.cfg.."/"..fn..".txt")if not nf then return false,"no config called "..tostring(fn)end
if not u9(nf)then return false,"that config looks empty"end c.config=fn return true,fn end local function ng(ic)
if ic then ff(al.dir)dj(al.auto,ic)elseif type(delfile)=="function"then pcall(delfile,al.auto)else dj(al.auto,"")
end c.autoload=ic end local function va()if c.selfPath then return c.selfPath end local fo for Ck,vb in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",al.dir})do
for Cl,nh in ipairs(m4(vb))do local ie=nh:lower()if ie:sub(-4)==".lua"and(ie:find("sab_farm",1,true)or ie:find("sab farm",1,true))then
fo=fo or nh end end end c.selfPath=fo return fo end al.stub=[[
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
local function vc()if not m1()then return false,"this executor cannot write files"end ff("autoexec")if not dj(al.exec,al.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fp=(function()local vd,ve=pcall(function()return game:GetService("TeleportService")end)return vd and ve or nil end)()
local function ni()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local vf=queueonteleport or queue_on_teleport return(pcall(vf,al.stub))end local function dn(vg)if c.rejoining then return end
c.rejoining=true z("REJOIN ("..vg..")")pcall(eX)if c.autoload then pcall(fm,c.autoload)end local vh=ni()z(vh and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Cm=1,30 do if not fp then break end pcall(function()fp:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function vi()local vj,nj=pcall(function()return game:GetService("GuiService")end)if vj and nj then
pcall(function()V(nj.ErrorMessageChanged:Connect(function()if d.Rejoin then dn("roblox error message")end end))
end)end pcall(function()local nk=game:GetService("CoreGui")local nl=nk and nk:WaitForChild("RobloxPromptGui",15)
local nm=nl and nl:WaitForChild("promptOverlay",15)if nm then V(nm.ChildAdded:Connect(function(vk)if d.Rejoin and tostring(vk.Name):lower():find("errorprompt",1,true)then dn("disconnect prompt")end
end))end end)if fp then pcall(function()V(fp.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dn("teleport retry")end)end
end))end)end end local function nn(vl)local no=c.plot and c.plot:FindFirstChild(vl)if not no then return nil,false end
for Cn,ig in ipairs(no:GetChildren())do if ig:IsA("Model")or ig:IsA("BasePart")then return ig,true end end return nil,true
end local function bS()local bp=nn("RolledSquishy")if not bp then return nil end return{model=bp,name=bp.Name,pretty=cq(bp,"NameText")or ah(aa(bp.Name)),
rar=cq(bp,"RarityText")or uL(bp.Name),price=cq(bp,"PriceText")}end local function np(ih)return type(ih)=="string"and(ad.rar[aa(ih)]~=nil or tN(ih))
end local function ac()local ii=nn("SquishyEquipped")if ii then c.carrySrc,e.heldAt="model",x()return ii.Name,ii end
local nq=F.Character if nq then for Co,dp in ipairs(nq:GetDescendants())do if(dp:IsA("Model")or dp:IsA("Tool"))and np(dp.Name)then
c.carrySrc,e.heldAt="character",x()return dp.Name,dp end end end local fq=F:GetAttribute("SquishyEquipped")if type(fq)=="string"and fq~=""and np(fq)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fq,nil end c.carrySrc=nil end local function Cp()local Cq,vm=ac()return vm end local function nr()
local ns=bS()local ij=ns and tP(ns.price)local ik=a6()if ij and ik and ik<ij*0.5 then return ik,ij end end local function bT(vn)
c8[#c8+1]=os.date("%H:%M:%S").." "..vn if#c8>40 then table.remove(c8,1)end end local function vo(bU,fr)if type(bU)~="string"then return end
bT(("Roll(%s,%s)"):format(bU,tostring(fr)))if bU:lower():find("crate",1,true)then e.rolled,e.rolledAt=bU,x()return
end W.seq=W.seq+1 W.name,W.at=bU,x()W.rar=type(fr)=="string"and fr or nil c.rolls=c.rolls+1 if aI(bU)then z(("ROLL %s [%s] = TARGET"):format(bU,tostring(fr)))end
end local function vp(bV)if type(bV)~="table"then return end local fs=bV.butter or bV.itemName if type(fs)~="string"then return end
c.gifts=c.gifts+1 W.gift,W.giftAt=fs,x()if type(bV.giftId)=="string"then local nt=aj:FindFirstChild("Remotes")
local nu=nt and nt:FindFirstChild("GiftThanks")if nu then pcall(function()nu:FireServer(bV.giftId)end)end end
bT("Gift("..fs.." from "..tostring(bV.fromName)..")")z(("GIFT from %s: %s - it will not be waxed"):format(tostring(bV.fromName),fs))
end local function vq()local nv=aj:WaitForChild("Remotes",30)if not c.alive then return end if not nv then z("Remotes folder missing - no roll events")return end
V(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local nw=F:GetAttribute("SquishyEquipped")
if type(nw)=="string"and nw~=""then e.heldAt=x()end end))local vw={SquishyRollAnimation=vo,InitSquishy=function(nx)W.init,W.initAt=tostring(nx),x()bT("Init("..tostring(nx)..")")end,
CrateUpdate=function(cw,ny)pcall(uk,cw)pcall(L.learn,cw)if type(cw)=="table"then local vr=ny==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not vr then return end local vs=not e.waiting local vt=e.on e.waiting,e.data,e.at=true,cw,x()e.on=(ny==true)
e.title=tostring(cw.title or cw.name or"crate")if e.on and not vt then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then bT("CrateWindow open("..e.title..")")elseif vs then bT("Crate waiting("..e.title..")")z(e.title.." is waiting on your stand")
end else if e.waiting then bT("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local vu=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,vu)end if e.classify then local vv=x()
task.spawn(function()pcall(e.classify,vv)end)end end end,GiftReceived=vp,}for ft,vx in pairs(vw)do local il=nv:FindFirstChild(ft)
if il and il:IsA("RemoteEvent")then V(il.OnClientEvent:Connect(vx))elseif ft~="CrateUpdate"and ft~="GiftReceived"then z("remote "..ft.." missing")end
end end local function im()local bW=bS()if bW then if aI(bW.name)then return{state="match",shown=bW.pretty,src="pad",info=bW}
end return{state="skip",info=bW,level="idle",text=("on pad: %s [%s] - not ticked"):format(bW.pretty,tostring(bW.rar))}
end if W.name and(x()-W.at)<4 then if aI(W.name)then return{state="match",shown=ah(aa(W.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ah(aa(W.name)),tostring(W.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fu(vy,vz,vA,vB)
local fv=RaycastParams.new()fv.FilterType=Enum.RaycastFilterType.Exclude local io={F.Character}for Cr,vC in ipairs(vB or{})do io[#io+1]=vC end
fv.FilterDescendantsInstances=io pcall(function()fv.RespectCanCollide=true end)local nz=as:Raycast(Vector3 .new(vy,vz+4,vA),Vector3 .new(0,-30,0),fv)
return nz and nz.Position or nil end local function cx(nA)local nB=nA:FindFirstChildOfClass("Humanoid")return((nB and nB.HipHeight)or 2)+nA.HumanoidRootPart.Size.Y/2+0.2
end local function ip(vD,vE)local iq=vD:FindFirstChildOfClass("Humanoid")local vF=x()while x()-vF<vE do if iq and(iq.FloorMaterial~=Enum.Material.Air or iq.SeatPart)then return true end
af(0.05)end return false end local function aC(vG,ir,is)local nC=vG.HumanoidRootPart nC.AssemblyLinearVelocity=Vector3 .new(0,0,0)
nC.CFrame=is and CFrame.new(ir,Vector3 .new(is.X,ir.Y,is.Z))or CFrame.new(ir)end local function cy(a_,nD)local bX=au()
if not bX or not a_ then return false end local bq=a_.Position local fw=math.clamp(math.max(a_.Size.X,a_.Size.Z)/2+2.2,3,7)
local nE=(nD and nD.MaxActivationDistance)or 10 if fw>nE-2 then fw=math.max(2.5,nE-2)end local dq={}local function bY(dr)
dr=Vector3 .new(dr.X,0,dr.Z)if dr.Magnitude>0.05 then dq[#dq+1]=dr.Unit end end local nF=mj()if nF then bY(nF-bq)end
bY(a_.CFrame.LookVector)bY(-a_.CFrame.LookVector)bY(a_.CFrame.RightVector)bY(-a_.CFrame.RightVector)bY(bX.HumanoidRootPart.Position-bq)
if#dq==0 then bY(Vector3 .new(0,0,1))end local vH,fy=cx(bX),false for Cs,vI in ipairs(dq)do local fz=bq+vI*fw
local it=fu(fz.X,bq.Y,fz.Z,{a_})if it and math.abs(it.Y-bq.Y)<14 then aC(bX,Vector3 .new(fz.X,it.Y+vH,fz.Z),bq)
if ip(bX,0.7)then fy=true break end end end if not fy then aC(bX,bq+dq[1]*fw+Vector3 .new(0,3,0),bq)fy=ip(bX,1)
end af(0.12)return fy end local function nG(ds)if not ds.Parent or not ds.Enabled then return false end pcall(function()ds:InputHoldBegin()end)
af(math.max(ds.HoldDuration,0)+0.08)pcall(function()ds:InputHoldEnd()end)return true end local function ao(nH,vJ)
local vK=x()while x()-vK<vJ do if nH()then return true end af(0.05)end return nH()end local function dt(cz,vL,nI,vM)
local vN=c.zapFirst and{"zap","hold"}or{"hold","zap"}for vO,iu in ipairs(vN)do if vO==2 and(vM or not(cz.Parent and cz.Enabled and(not nI or nI())))then break end
local iv if iu=="hold"then iv=nG(cz)else iv=type(fireproximityprompt)=="function"and cz.Parent~=nil and cz.Enabled and pcall(fireproximityprompt,cz)end
if iv and ao(vL,1.2)then c.zapFirst=(iu=="zap")return true,iu end end return false end local function nJ(iw)local br=mu()
if not br or not br.Enabled then z("buy: nothing on the pad")return false end local nK=da(br)if not nK then z("buy: pad part missing")return false end
c.lastBuyAt=x()local vP,nL=W.seq,a6()cy(nK,br)if not br.Enabled then z("buy aborted: pad emptied")return false end
local cA=im()if not iw and cA.state~="match"then z("buy aborted: "..(cA.text or"pad changed"))c.matchSince=nil
return false end local ix=cA.info and cA.info.name or(cA.state=="match"and W.name)or nil local function vQ()return br.Enabled and ac()==nil and(iw or im().state=="match")
end local vR,vS=dt(br,function()return ac()~=nil or((not br.Enabled)and(iw or W.seq==vP))end,vQ,nr()~=nil)if vR then
ao(function()return ac()~=nil end,0.8)local du=ac()local nM=a6()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil W.name,W.rar,W.at=nil,nil,x()z(("BOUGHT %s%s via %s"):format(du and ah(aa(du))or(cA.shown or"?"),(nL and nM)and(" for $"..aJ(nL-nM))or"",vS))
if du and ix and aa(du)~=aa(ix)then z(("note: picked up %s, not %s"):format(du,ix))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local nN=bS()z(("BUY REFUSED: cash short? have $%s, price %s"):format(aJ(a6()),(nN and nN.price)or"?"))
return false end local function nO()local dv=ac()if not dv then c.holding=false z("place: hands are empty")return false
end if not aI(dv)then z(("REFUSED TO WAX %s - it is not ticked"):format(ah(aa(dv))))return false end for Ct=1,d.PlaceTries do
local bs=tY()if not bs then z("place: no free station")break end local nP=da(bs)if nP then cy(nP,bs)local nQ=ac()
if not nQ then c.holding=false z("place: hands emptied on the way")return false end if not aI(nQ)then z("place: what I carry changed, not waxing it")return false end
if bs.Enabled then local vT,vU=dt(bs,function()return not bs.Enabled end,function()return bs.Enabled end)if vT then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 W.name,W.rar,W.at=nil,nil,x()
z(("WAXED %s #%d at %s via %s"):format(ah(aa(dv)),c.placed,bs.Parent.Parent.Name,vU))if q.placed then pcall(q.placed,dv)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end z("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))z(c.capMsg)end return false end function y.place()local vV=x()while c.alive and y.editing and x()-vV<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then y.placing=true local vW=x()while c.alive and y.current()~=d.TeamWax and x()-vW<5 do af(0.1)end
if y.current()==d.TeamWax then af(0.3)else z("wax team did not come on in time - placing anyway")end end local vX,nR=pcall(nO)
y.placing=false if not vX then error(nR,0)end return nR end local function nS(nT)return type(nT)=="string"and nT:lower():find("crate",1,true)~=nil
end local vY={SABFarmGui=1,SABToggle=1,SABError=1}local function iy(vZ)local bt=vZ while bt do if vY[bt.Name]then return false end
if bt:IsA("ScreenGui")then local v0,v1=pcall(function()return bt.Enabled end)return(not v0)or v1~=false end if bt:IsA("GuiObject")and not bt.Visible then return false end
bt=bt.Parent end return false end local function fA(fB)local cB=""pcall(function()if fB:IsA("TextButton")then cB=fB.Text end end)
if not cB:find("%a")then for Cu,fC in ipairs(fB:GetDescendants())do if(fC:IsA("TextLabel")or fC:IsA("TextButton"))and fC.Text:find("%a")then cB=fC.Text break end
end end if not cB:find("%a")then cB=fB.Name end return(cB:lower():gsub("[^%a]",""))end local function v2()local dw,dx
local nU=F:FindFirstChildOfClass("PlayerGui")if not nU then return nil,nil end for Cv,dy in ipairs(nU:GetDescendants())do
if dy:IsA("GuiButton")and iy(dy)then local iz=fA(dy)if iz:sub(1,4)=="open"and not iz:find("shop",1,true)then dw=dw or dy end
if iz:sub(1,7)=="discard"then dx=dx or dy end end end if dw and dx then return dw,dx end if e.on then return dw,dx end
return nil,nil end local iA=(function()local v3,v4=pcall(function()return game:GetService("VirtualInputManager")end)return v3 and v4 or nil end)()
local function nV(ba,iB)local iC={}local function nW(v5)iC[#iC+1]=v5 end if c.tapWay then nW(c.tapWay)end for Cw,nX in ipairs({"touch","conn","signal"})do
if nX~=c.tapWay then nW(nX)end end local function nY(v6,...)local v7,iD=pcall(getconnections,v6)if not(v7 and type(iD)=="table"and#iD>0)then return false end
local nZ,v8,v9=false,{...},select("#",...)for Cx,v_ in ipairs(iD)do if pcall(function()v_:Fire(table.unpack(v8,1,v9))end)then nZ=true end
end return nZ end local function n0()local n1=Vector3 .new(0,0,0)pcall(function()local n2,n3=ba.AbsolutePosition,ba.AbsoluteSize
n1=Vector3 .new(n2 .X+n3 .X/2,n2 .Y+n3 .Y/2,0)end)local iE={Position=n1,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()iE.UserInputType=Enum.UserInputType.Touch end)pcall(function()iE.UserInputState=Enum.UserInputState.End end)
return iE end for Cy,bc in ipairs(iC)do local dz=false if bc=="conn"and type(getconnections)=="function"then if nY(ba.MouseButton1Click)then
dz=true if ao(iB,1.5)then c.tapWay=bc return true,bc end end dz=nY(ba.Activated,n0(),1)elseif bc=="signal"and type(firesignal)=="function"then
if pcall(firesignal,ba.MouseButton1Click)then if ao(iB,1.5)then c.tapWay=bc return true,bc end end dz=pcall(firesignal,ba.Activated,n0(),1)
elseif bc=="touch"and iA then dz=pcall(function()local n4,n5=ba.AbsolutePosition,ba.AbsoluteSize local n6=0 local n7=ba:FindFirstAncestorWhichIsA("ScreenGui")
local wa,wb=pcall(function()return n7 and n7 .IgnoreGuiInset end)if not(wa and wb)then pcall(function()n6=game:GetService("GuiService"):GetGuiInset().Y end)
end local n8,n9=n4 .X+n5 .X/2,n4 .Y+n5 .Y/2+n6 iA:SendMouseButtonEvent(n8,n9,0,true,game,1)task.wait(0.06)iA:SendMouseButtonEvent(n8,n9,0,false,game,1)
end)end if dz and ao(iB,1.5)then c.tapWay=bc return true,bc end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function iF(n_)local dA=n_.Parent while dA and dA~=c.plot do if e.NOT[dA.Name]then return false end dA=dA.Parent
end local iG=(n_.ActionText or""):lower()if iG:find("roll",1,true)or iG:find("place",1,true)or iG:find("sell",1,true)then return false end
return true end local function wc()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local oa=c.plot:FindFirstChild("CrateStand")local dB if oa then for Cz,fD in ipairs(oa:GetDescendants())do
if fD:IsA("ProximityPrompt")and fD.Enabled and iF(fD)then dB=fD break end end end if not dB then for CA,bu in ipairs(c.plot:GetDescendants())do
if bu:IsA("ProximityPrompt")and bu.Enabled and iF(bu)then local ob=bu:FindFirstAncestorWhichIsA("Model")local wd=((bu.ActionText or"").." "..(bu.ObjectText or"").." "..bu.Name.." "..(ob and ob.Name or"")):lower()
if wd:find("crate",1,true)then dB=bu break end end end end e.prompt=dB return dB end local function iH()if e.on then return true end
local dC=wc()if not dC then e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local oc=da(dC)if oc then cy(oc,dC)end e.ours=true dt(dC,function()return e.on end)if ao(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: pressed "..eS(dC).." but no window came up")
return false end do local function we(od)local cC=od.Parent while cC and cC:IsA("GuiObject")do local oe,of=false,false
for CB,dD in ipairs(cC:GetDescendants())do if dD~=od and dD:IsA("GuiButton")and fA(dD):sub(1,7)=="discard"then oe=true end
if dD:IsA("TextLabel")then local iI=dD.Text:lower()if iI:find("crate",1,true)or iI:find("can contain",1,true)or iI:find("cost",1,true)then of=true end
end if oe and of then return cC end end cC=cC.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local og=F:FindFirstChildOfClass("PlayerGui")if not og then return nil end for CC,fE in ipairs(og:GetDescendants())do
if fE:IsA("GuiButton")and not fE:FindFirstAncestor("SABFarmGui")and fA(fE):sub(1,4)=="open"then local iJ=we(fE)
if iJ then e.win=iJ return iJ end end end end local function wf(wg)for CD,fF in ipairs(wg:GetDescendants())do
if fF:IsA("GuiButton")then local oh,iK=fA(fF),fF.Name:lower()if oh=="x"or oh=="close"or iK=="x"or iK:find("close",1,true)or iK:find("exit",1,true)then return fF end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(wh)task.wait(wh and 4 or 1.2)if e.on or e.waiting then return end
local fG=e.findWin()if not fG or not iy(fG)then return end local oi=wf(fG)if oi and nV(oi,function()return not iy(fG)end)then return end
z("the crate window is still open - tap its X")end end local function fH(fI)if not iH()then return false end local oj=x()-(e.openedAt or 0)
if oj<0.6 then af(0.6-oj)end local iL=e.title local wi,wj=v2()local ol=fI and wi or wj if not ol then e.lastFail=x()
c.crateFails=c.crateFails+1 z(("crate: no %s button found in %s"):format(fI and"Open"or"Discard",iL))return false
end local wk=ac()local wl,CE=nV(ol,function()return(not e.on)or(ac()~=nil and ac()~=wk)end)if not wl then e.lastFail=x()
c.crateFails=c.crateFails+1 z("crate: could not press "..(fI and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fI then c.crates=c.crates+1 ao(function()return ac()~=nil end,1.5)local om=ac()
z(("OPENED %s -> %s"):format(iL,om and ah(aa(om))or"?"))else z("discarded "..iL.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(wm,...)local wn=select("#",...)e.calls[#e.calls+1]={t=x(),m=wm,n=wn,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aD,bd)local bv=type(aD)if(bv=="string"or bv=="number")and type(bd.data)=="table"then for oo,iM in pairs(bd.data)do
if iM==aD and type(oo)=="string"and(type(iM)=="string"or type(iM)=="number")then return{__slot="f:"..oo}end end
end if bv=="string"then if bd.crate and aD==bd.crate then return{__slot="crate"}end if bd.title and aD==bd.title then return{__slot="title"}end
if bd.rar and aD==bd.rar then return{__slot="rarity"}end return aD end if bv=="number"or bv=="boolean"or bv=="nil"then return aD end
if bv=="table"then local op={}for wo,oq in pairs(aD)do if type(oq)=="table"then return nil,"nested table"end local wp,ot=e.slot(oq,bd)
if ot then return nil,ot end op[wo]=wp end return op end local wq,wr=pcall(function()return aD:IsA("Instance")end)
if wq and wr then if aD==F then return{__slot="player"}end if c.plot and aD==c.plot then return{__slot="plot"}end
local fJ=c.plot and c.plot:FindFirstChild("CrateStand")if fJ and aD==fJ then return{__slot="stand"}end if fJ and aD.Parent==fJ then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bv..")"end function e.resolve(fK)if type(fK)~="table"then return fK end
local aN=fK.__slot if aN and aN:sub(1,2)=="f:"then return e.data and e.data[aN:sub(3)]end if aN=="crate"then return e.data and e.data.name end
if aN=="title"then return(e.data and e.data.title)or e.title end if aN=="rarity"then return e.data and e.data.rarity end
if aN=="player"then return F end if aN=="plot"then return c.plot end if aN=="stand"or aN=="model"then local iN=c.plot and c.plot:FindFirstChild("CrateStand")
if aN=="stand"or not iN then return iN end for CG,ou in ipairs(iN:GetChildren())do if nS(ou.Name)then return ou end end
return nil end local ov={}for ws,wt in pairs(fK)do ov[ws]=e.resolve(wt)end return ov end function e.classify(iO)
if e.directOff then return end local fL={}for CH,iP in ipairs(e.calls)do if iP.t<=iO+0.05 and iO-iP.t<=6 then fL[#fL+1]=iP end
end if#fL==0 then return end if not ao(function()return(e.heldAt or 0)>=iO-1 end,2.5)then return end local dE={}
for CI,dF in ipairs(fL)do local ow={}for ox=1,dF.n do local wu,oy=e.slot(dF.args[ox],dF)if oy then z("crate call has "..oy.." - keeping the button method")
return end ow[ox]=wu end dE[#dE+1]={m=dF.m,n=dF.n,args=ow}end local iQ=e.learned e.learned={seq=dE,mode=iQ and iQ.mode or nil}
ag.dirty=true if not iQ then z(("learned how to open crates directly (%d call%s)"):format(#dE,#dE==1 and""or"s"))end
end function e.replay()local oz=e.learned local oA=aj:FindFirstChild("Remotes")local iR=oA and oA:FindFirstChild("CrateAction")
if not(oz and iR)then return false end local oB=table.unpack or unpack e.replaying=true for CJ,dG in ipairs(oz.seq)do
local iS={}for oC=1,dG.n do iS[oC]=e.resolve(dG.args[oC])end task.spawn(function()pcall(function()if dG.m=="InvokeServer"then iR:InvokeServer(oB(iS,1,dG.n))
else iR:FireServer(oB(iS,1,dG.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(wv)return(wv:gsub("[%%|;=,\n]",function(ww)return("%%%02X"):format(ww:byte())end))end
function e.enc(bZ)local fM=type(bZ)if fM=="string"then return"s"..e.esc(bZ)end if fM=="number"then return"n"..tostring(bZ)end
if fM=="boolean"then return bZ and"b1"or"b0"end if fM=="nil"then return"z"end if bZ.__slot then return"k"..bZ.__slot end
local iT={}for wx,wy in pairs(bZ)do iT[#iT+1]=e.enc(wx).."="..e.enc(wy)end return"t"..table.concat(iT,",")end
function e.dec(oD)local dH,dI=oD:sub(1,1),oD:sub(2)local function wz(wA)return(wA:gsub("%%(%x%x)",function(wB)return string.char(tonumber(wB,16))end))end
if dH=="s"then return wz(dI)end if dH=="n"then return tonumber(dI)end if dH=="b"then return dI=="1"end if dH=="k"then return{__slot=dI}end
if dH=="t"then local oE={}for wC in dI:gmatch("[^,]+")do local oF,wD=wC:match("^(.-)=(.*)$")if oF then local oG=e.dec(oF)
if oG~=nil then oE[oG]=e.dec(wD)end end end return oE end return nil end function e.goneOrNew(wE)return function()
if not e.waiting then return true end local oH=ac()return oH~=nil and oH~=wE end end function e.near()local oI=aj:FindFirstChild("Remotes")
local oJ=oI and oI:FindFirstChild("CrateAction")local iU=au()local iV=c.plot and c.plot:FindFirstChild("CrateStand")
local iW=iV and iV:FindFirstChild("Spot")if not(oJ and iU and iW)then return false,"no crate stand or remote"end
local iX=iU.HumanoidRootPart local fN=iX.CFrame local oK,iY=e.title,"no answer"local wF=ac()local oL=iV:FindFirstChild("Holder")
local function oM()if not oL then return e.waiting or e.on end for CK,wG in ipairs(oL:GetChildren())do if wG:IsA("Model")then return true end end
return false end for wH=1,3 do if not(e.waiting or e.on)or not oM()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(iX.Position-iW.Position).Magnitude>8 then cy(iW,e.prompt)end af(0.12+0.15*wH)
local aY={}e.replaying=true task.spawn(function()aY.ok,aY.v=pcall(function()return oJ:InvokeServer("open")end)
aY.done=true end)ao(function()return aY.done end,6)e.replaying=false local b0=aY.v if aY.done and aY.ok and type(b0)=="table"and b0 .ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 z(("OPENED %s -> %s (no window)"):format(oK,b0 .prize and ah(aa(tostring(b0 .prize)))or"?"))
ao(function()local oN=ac()return oN~=nil and oN~=wF end,1.5)if(iX.Position-fN.Position).Magnitude>8 then pcall(function()aC(iU,fN.Position,fN.Position+fN.LookVector)end)end
return true,"opened"end iY=(aY.done and aY.ok and type(b0)=="table")and tostring(b0 .reason or"refused, no reason given")
or(aY.done and("error: "..tostring(b0))or"no answer in 6s")af(0.3)if not oM()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 z(("crate: the server would not open %s next to the stand (%s)"):format(oK,iY))
return false,iY end function e.smart()local iZ=e.title if(e.nearFails or 0)<3 then local wI=e.near()if wI then return true end
if e.nearFails>=3 then z("opening next to the stand failed 3 times - trying the older ways")end end local b1=e.learned
if b1 then local i0=ac()if e.on then e.replay()if ao(e.goneOrNew(i0),3.5)then c.crates=c.crates+1 z("OPENED "..iZ.." (direct)")
return true end else if b1 .mode~="window"then e.replay()if ao(e.goneOrNew(i0),3.5)then c.crates,e.fails=c.crates+1,0
if b1 .mode~="direct"then b1 .mode,ag.dirty="direct",true z("crates now open directly - the window never comes up")
end z("OPENED "..iZ.." (direct, no window)")return true end end if iH()then e.replay()if ao(e.goneOrNew(i0),3.5)then
c.crates,e.fails=c.crates+1,0 if b1 .mode~="window"then b1 .mode,ag.dirty="window",true z("crates need their window up first - it shows briefly")
end z("OPENED "..iZ.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ag.dirty=b1,nil,true
if e.fails>=3 then e.directOff=true z("direct crate opening failed 3 times - using the button for now")else z("the learned crate call did not work - back to pressing Open")
end end return fH(true)end function C.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end C.cache={}function C.watchCache()C.cache=C.snap()
for wJ,oO in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(F:GetAttributeChangedSignal(oO):Connect(function()C.cache[wJ]=F:GetAttribute(oO)end))
end end function C.isOn()return F:GetAttribute("AutoRollOn")==true end function C.saw(wK,...)local fO=C.cache
local wL={m=wK,n=select("#",...),args={...},before={rules=fO.rules,stop=fO.stop,on=fO.on,main=fO.main}}task.delay(1.5,function()
if c.alive then pcall(C.learnOne,wL)end end)end function C.learnOne(dJ)local ax,dK=C.snap(),dJ.before local fP=(ax.rules~=dK.rules)or(ax.stop~=dK.stop)
local oP=(ax.on~=dK.on)or(ax.main~=dK.main)if not fP and not oP then return end local oQ={}for oR=1,dJ.n do local aK=dJ.args[oR]
local b2=type(aK)if b2=="string"and aK~=""and aK==ax.rules then aK={__slot="rules"}elseif b2=="string"and aK~=""and fP and aK==ax.stop and ax.stop~=dK.stop then aK={__slot="stop"}
elseif b2=="table"then local oS={}for wM,cD in pairs(aK)do if type(cD)=="table"or(type(cD)=="userdata")then C.msg="Auto Roll sends something I cannot repeat"return
end oS[wM]=(type(cD)=="string"and cD~=""and cD==ax.rules)and{__slot="rules"}or cD end aK=oS elseif b2~="string"and b2~="number"and b2~="boolean"and b2~="nil"then
if aK==F then aK={__slot="player"}else C.msg="Auto Roll sends something I cannot repeat"return end end oQ[oR]=aK
end local cE={m=dJ.m,n=dJ.n,args=oQ}if fP then local i1=false for wN=1,cE.n do local dL=cE.args[wN]if type(dL)=="table"and dL.__slot=="rules"then i1=true end
if type(dL)=="table"and not dL.__slot then for CL,oT in pairs(dL)do if type(oT)=="table"and oT.__slot=="rules"then i1=true end end
end end if i1 then C.rec.rules={cE}else table.insert(C.rec.rules,cE)if#C.rec.rules>60 then table.remove(C.rec.rules,1)end
end end if oP then if ax.on==true then C.rec.on=cE else C.rec.off=cE end d.AutoRoll=(ax.on==true)end if ax.rules and ax.rules~=""then d.ARrules,d.ARstop=ax.rules,ax.stop or""end
ag.dirty=true C.msg=""z(("learned an Auto Roll %s message"):format(fP and"choices"or(ax.on and"on"or"off")))end
function C.resolve(cF)if type(cF)~="table"then return cF end if cF.__slot=="rules"then return d.ARrules~=""and d.ARrules or F:GetAttribute("AutoRollRules")end
if cF.__slot=="stop"then return d.ARstop~=""and d.ARstop or F:GetAttribute("AutoRollStop")end if cF.__slot=="player"then return F end
local oU={}for wO,wP in pairs(cF)do oU[wO]=C.resolve(wP)end return oU end function C.replay(oV,wQ)local oW=table.unpack or unpack
for CM,dM in ipairs(wQ)do local i2={}for oX=1,dM.n do i2[oX]=C.resolve(dM.args[oX])end C.replaying=true pcall(function()
if dM.m=="InvokeServer"then task.spawn(function()pcall(function()oV:InvokeServer(oW(i2,1,dM.n))end)end)else oV:FireServer(oW(i2,1,dM.n))end
end)C.replaying=false task.wait(0.25)end end function C.apply(oY,wR)if C.busy or not c.alive then return end C.busy=true
pcall(function()local oZ=aj:FindFirstChild("Remotes")local i3=oZ and oZ:FindFirstChild("AutoRollAction")if not i3 then C.msg="this game has no AutoRollAction"return end
local bw=d.AutoRoll if bw and d.ARrules~=""and F:GetAttribute("AutoRollRules")~=d.ARrules then if#C.rec.rules==0 then
C.msg="pick your Auto Roll choices once in the game's menu so I can learn them"z(C.msg)else C.replay(i3,C.rec.rules)
if ao(function()return F:GetAttribute("AutoRollRules")==d.ARrules end,4)then z("Auto Roll choices put back")else
C.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"z(C.msg)end end end if bw==C.isOn()or(not bw and not wR)then return end
local fQ=bw and C.rec.on or C.rec.off if not fQ then local dN=bw and C.rec.off or C.rec.on local o0=dN~=nil for wS=1,dN and dN.n or 0 do
if type(dN.args[wS])=="boolean"then o0=false end end if o0 then fQ=dN end end if not fQ then C.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bw and"on"or"off")
z(C.msg)return end C.replay(i3,{fQ})if ao(function()return C.isOn()==bw end,4)then C.msg=""z(("Auto Roll switched %s%s"):format(bw and"ON"or"OFF",oY and(" ("..oY..")")or""))
else C.msg="Auto Roll did not switch - do it once in the game so I can relearn it"z(C.msg)end end)C.busy=false
end l.HS=game:GetService("HttpService")l.uid=(function()local wT,wU=pcall(function()return F.UserId end)return wT and wU or 0 end)()
l.buyMsg,l.wishMsg,l.wishN="","",0 function l.info()if l.I then return l.I end local wV,i4=pcall(function()return require(aj:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if wV and type(i4)=="table"and type(i4 .Pets)=="table"then l.I=i4 end return l.I end function l.order()if l.list then return l.list end
local bx=l.info()if not bx then return{}end local b3={}if type(bx.Order)=="table"and#bx.Order>0 then for CN,o1 in ipairs(bx.Order)do if bx.Pets[o1]then b3[#b3+1]=o1 end end
else for wW in pairs(bx.Pets)do b3[#b3+1]=wW end table.sort(b3,function(wX,wY)return(bx.Pets[wX].price or 0)<(bx.Pets[wY].price or 0)end)
end l.list=b3 return b3 end function l.nice(o2,i5)local o3=l.info()local o4=o3 and o3 .Pets[o2]return((i5 and i5~="")and(i5 .." ")or"")..(o4 and o4 .displayName or tostring(o2))
end function l.data()local fR=F:GetAttribute("PetsData")if type(fR)~="string"then return nil end if fR==l.rawD then return l.lastD end
local wZ,dO=pcall(function()return l.HS:JSONDecode(fR)end)dO=(wZ and type(dO)=="table")and dO or nil l.rawD,l.lastD=fR,dO
return dO end function l.pen()return aj:FindFirstChild("PetMeadowSpawns")end function l.srv()return as:GetServerTimeNow()end
function l.money()local i6=F:FindFirstChild("MoneyValue")if i6 and type(i6 .Value)=="number"then return i6 .Value end
return a6()or 0 end function l.wishes()local o5=l.pen()local o6=o5 and o5:GetAttribute("Wishes")local i7,o7={},l.srv()
if type(o6)~="string"then return i7 end local w0,o8=pcall(function()return l.HS:JSONDecode(o6)end)if w0 and type(o8)=="table"then
for w1,i8 in pairs(o8)do if type(i8)=="number"and i8>o7 then i7[w1]=i8-o7 end end end return i7 end function l.call(...)
local o9=aj:FindFirstChild("Remotes")local o_=o9 and o9:FindFirstChild("PetRequest")if not o_ then return nil end
local pa=table.pack(...)local b4={}task.spawn(function()b4 .ok,b4 .v=pcall(function()return o_:InvokeServer(table.unpack(pa,1,pa.n))end)
b4 .done=true end)local w2=x()while not b4 .done and x()-w2<6 do task.wait(0.05)end if b4 .done and b4 .ok then return b4 .v end
return nil end function l.want(w3)return d.Pets[w3]end function l.closeNaming(i9)local pc=pcall(function()local pb=F:FindFirstChild("PlayerScripts")
local w4=pb and pb:FindFirstChild("Naming",true)require(w4).close()end)af(0.5)if i9 .Visible then pcall(function()local pd=i9:FindFirstChild("NameBox",true)if pd then pd:ReleaseFocus()end end)
i9 .Visible=false pc=false end return pc end function l.skipNaming()l.namingUntil=x()+10 if l.namingOn then return end
l.namingOn=true task.spawn(function()while c.alive and x()<l.namingUntil do local pe=F:FindFirstChildOfClass("PlayerGui")
local pf=pe and pe:FindFirstChild("MainGui")local fS=pf and pf:FindFirstChild("PetNameGui")if fS and fS.Visible then
af(0.4)if fS.Visible then l.namingShut=(l.namingShut or 0)+1 pcall(l.closeNaming,fS)break end end af(0.25)end
l.namingOn=false end)end function l.buyTick()if not d.PetBuy then l.buyMsg="auto adopt is off"return end local i_,pg,fT=l.info(),l.pen(),l.data()
if not(i_ and pg and fT)then l.buyMsg="pet data not loaded yet"return end l.tryAt=l.tryAt or{}local dP,ja=#(fT.pets or{}),tonumber(fT.maxOwned)or 60
local w5,ph,dQ=l.srv(),{},nil for CO,aO in ipairs(pg:GetChildren())do ph[aO.Name]=true local b5,fU=aO:GetAttribute("Pet"),aO:GetAttribute("Variant")or""
local jb=b5 and l.want(b5)if jb and jb.b and i_.Pets[b5]and(not jb.g or fU=="Big")and A.wantMore(b5,fU,fT)and not aO:GetAttribute("A_"..l.uid)
and(tonumber(aO:GetAttribute("ExpiresAt"))or 0)>w5+1 and x()>=(l.tryAt[aO.Name]or 0)then local dR,pj=l.nice(b5,fU),i_.Pets[b5].price or 0
if dP>=ja then dQ=("%s is in the pen, but you have %d/%d pets"):format(dR,dP,ja)l.tryAt[aO.Name]=x()+15 elseif l.money()<pj then
dQ=("%s is in the pen - need $%s"):format(dR,aJ(pj))l.tryAt[aO.Name]=x()+5 else l.tryAt[aO.Name]=x()+8 local by=l.call("adopt",aO.Name)
if type(by)=="table"and by.ok then dP=dP+1 l.buys=(l.buys or 0)+1 l.recent=l.recent or{}local w6=type(by.pet)=="table"and by.pet or{}
table.insert(l.recent,{id=tostring(w6 .id or("?"..x())),name=b5,variant=fU,at=x()})if#l.recent>30 then table.remove(l.recent,1)end
z("ADOPTED "..dR)l.skipNaming()dQ="adopted "..dR else local pk=type(by)=="table"and tostring(by.reason or"no reason given")or"no answer"
z(("adopt %s failed: %s"):format(dR,pk))dQ="adopt failed: "..pk if type(by)=="table"and by.bagFull then l.tryAt[aO.Name]=x()+60 end
end end end end for pl in pairs(l.tryAt)do if not ph[pl]then l.tryAt[pl]=nil end end l.buyMsg=dQ or("watching the pen (%d/%d pets)"):format(dP,ja)
end function l.wishTick()if not d.PetWish then l.wishMsg="auto wish is off"return end local fV=l.info()if not(fV and l.pen())then l.wishMsg="pet data not loaded yet"return end
l.wishTry,l.wishWhy=l.wishTry or{},l.wishWhy or{}local fW,jc,bz=l.wishes(),0,nil local w7=(type(fV.Wish)=="table"and fV.Wish.cashShare)or 2
local w8=l.data()for CP,az in ipairs(l.order())do local pm=l.want(az)if pm and pm.w and A.wantMore(az,"",w8)then
jc=jc+1 if not fW[az]and x()>=(l.wishTry[az]or 0)then local jd=tonumber(F:GetAttribute("PetWishCredits"))or 0
local je=math.floor((fV.Pets[az].price or 0)*w7)if jd<=0 and l.money()<je then l.wishTry[az]=x()+10 bz=("need $%s to wish for %s"):format(aJ(je),l.nice(az))
l.wishWhy[az]=bz else l.wishTry[az]=x()+3 local w9=jd>0 and"wishCredit"or"wish"local fX=l.call(w9,az)if type(fX)=="table"and fX.ok then
l.wishN,l.wishWhy[az]=l.wishN+1,nil z(("WISHED for %s (%s)"):format(l.nice(az),jd>0 and"free wish"or("$"..aJ(je))))
else local jf=type(fX)=="table"and tostring(fX.reason or"no reason given")or"no answer"if jf:lower():find("already",1,true)then l.wishTry[az]=x()+2
else z(("wish %s failed: %s"):format(l.nice(az),jf))bz="wish failed: "..jf end end end end end end if not bz then
for CQ,fY in ipairs(l.order())do local pn=l.want(fY)if pn and pn.w and not fW[fY]and l.wishWhy[fY]then bz=l.wishWhy[fY]break end
end end if not bz then local fZ={}for CS,f0 in ipairs(l.order())do local po=l.want(f0)if po and po.w and fW[f0]then fZ[#fZ+1]=("%s %dm"):format(l.nice(f0),math.ceil(fW[f0]/60))end
end bz=jc==0 and"no pet has WISH ticked"or("running: "..(#fZ>0 and table.concat(fZ,", ")or"none yet"))end l.wishMsg=bz
end y.switches,y.glazed,y.finished=0,0,0 y.done,y.doneN,y.later={},0,{}function y.teams()local jg=l.data()return(jg and jg.teams)or{},jg
end function y.current(cG)cG=cG or l.data()if not cG then return""end local pp={}for CT,w_ in ipairs(cG.equipped or{})do pp[tostring(w_)]=true end
for CU,pq in ipairs(cG.teams or{})do local ps=pq.pets or{}local jh=#ps==#(cG.equipped or{})if jh then for CV,xa in ipairs(ps)do if not pp[tostring(xa)]then jh=false break end end end
if jh then return pq.name end end return""end function y.equip(ji)local xb,xc=y.teams()local jj for xd,xe in ipairs(xb)do if xe.name==ji then jj=xd break end end
if not jj then y.msg="no saved team called "..tostring(ji)return false end if y.current(xc)==ji then return true end
for CW=1,4 do local pt=l.call("teamEquip",jj)if type(pt)=="table"and pt.ok then y.switches=y.switches+1 return true
end task.wait(0.4)end return false end function y.left(xf)local pu=xf:FindFirstChild("SquishyPlaceHolder")local pv=pu and pu:FindFirstChild("TimerGui")
local pw=pv and pv:FindFirstChildWhichIsA("TextLabel",true)local jk=pw and pw.Text if type(jk)~="string"or jk:find("-",1,true)then return nil end
local jl,px,py=jk:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not jl then return nil end local pz=py~=""and(tonumber(jl)*3600+tonumber(px)*60+tonumber(py))or(tonumber(jl)*60+tonumber(px))
return pz>0 and pz or nil end function y.waxes()local dS={}local pA=c.plot and c.plot:FindFirstChild("WaxStations")
if not pA then return dS end local pB=l.srv()for CX,aZ in ipairs(pA:GetChildren())do local jm=tonumber(aZ:GetAttribute("PourEnd"))
local pC=aZ:GetAttribute("PourOwner")if aZ:GetAttribute("HasSquishy")and aZ:GetAttribute("PourId")and(pC==nil or pC==l.uid)then
local jn=y.left(aZ)local pD=jn and(pB+jn)or((jm and jm>pB)and jm or nil)if pD then local pE,pF=aZ:FindFirstChild("SquishyPlaceHolder"),"?"
if pE then for CY,pG in ipairs(pE:GetChildren())do if pG:IsA("Model")then pF=pG.Name break end end end local xg=tostring(aZ:GetAttribute("Helpers")or"")
local jo=0 for CZ in xg:gmatch("%d+")do jo=jo+1 end dS[#dS+1]={st=aZ,ends=pD,sure=jn~=nil,id=aZ:GetAttribute("PourId"),name=pF,helps=jo,
long=aZ:GetAttribute("PourLong")==true}end end end table.sort(dS,function(xh,xi)return xh.ends<xi.ends end)return dS
end function y.glazeCount()local pH=aj:FindFirstChild("Remotes")local pI=pH and pH:FindFirstChild("EditStack")
if not pI then return nil end local xj,dT=pcall(function()return pI:InvokeServer("State",nil)end)if not(xj and type(dT)=="table"and type(dT.state)=="table")then return nil end
local jp,jq=0,{}for C0,f1 in ipairs(dT.state.entries or{})do if f1 .glaze and f1 .glaze~=""then jp=jp+1 jq[f1 .glaze]=(jq[f1 .glaze]or 0)+1 end
end return jp,jq,#(dT.state.entries or{}),dT.state.capacity end function y.finishedOne(f2,pJ)y.finished=y.finished+1
task.wait(2)local jr,xk,pK,xl=y.glazeCount()if jr and pJ and jr>pJ then y.glazed=y.glazed+1 local js={}for xm,xn in pairs(xk)do js[#js+1]=xm.." "..xn end
z(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ah(aa(f2 .name)),f2 .st.Name,jr,table.concat(js,", ")))
else z(("wax done on station %s: %s, no glaze%s"):format(f2 .st.Name,ah(aa(f2 .name)),pK and(" (stack "..pK.."/"..tostring(xl)..")")or""))
end end function y.tick()y.list=y.waxes()if y.editing and x()-(y.editingSince or x())>120 then y.editing=false end
if y.editing then y.msg="rebuilding teams..."return end if not d.Teams then y.want,y.msg="","auto teams is off"return end
local b6=l.srv()local aE=y.glazeFor if aE then local dU=aE.st local pL=dU.Parent and dU:GetAttribute("HasSquishy")and dU:GetAttribute("PourId")==aE.id
local pM=pL and y.left(dU)if pM then aE.ends=b6+pM end if not pL then y.glazeFor,y.afterUntil=nil,x()+1.5 if not y.done[aE.id or"?"]then
y.done[aE.id or"?"],y.doneN=true,y.doneN+1 if y.doneN>400 then y.done,y.doneN={[aE.id or"?"]=true},1 end local xo=aE.before
task.spawn(function()pcall(y.finishedOne,aE,xo)end)end elseif aE.ends-b6>d.GlazeLead*3+60 or b6>aE.ends+90 then
y.glazeFor,y.afterUntil=nil,x()+1.5 y.later[aE.id or"?"]=x()+120 z(("station %s is not finishing yet (%s left) - glaze team off again"):format(dU.Name,y.clock(aE.ends-b6)))
end end if d.TeamGlaze~=""and not y.glazeFor then local xp=y.speedRatio(d.TeamGlaze)for C1,b7 in ipairs(y.list)do
if b7 .sure and(b7 .ends-b6)*xp[b7 .long and 2 or 1]<=d.GlazeLead and x()>=(y.later[b7 .id or"?"]or 0)and not y.done[b7 .id or"?"]then
y.glazeFor=b7 task.spawn(function()b7 .before=y.glazeCount()end)break end end end local aF,dV="",""local cH=q.snapAt and(q.snapAt-b6)
if cH and cH<-8 then q.snapAt,cH=nil,nil end if d.TeamGlaze~=""and cH and cH<=20 then aF,dV=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cH)))
elseif d.TeamGlaze~=""and(y.glazeFor or x()<(y.afterUntil or 0))then aF,dV=d.TeamGlaze,y.glazeFor and(" - station "..y.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(y.placing or y.aboutToPlace())then aF,dV=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and y.allBusy()then
aF,dV=d.TeamFull," - every station is busy"else aF=d.TeamNormal end y.want=aF local dW=y.current()y.cur=dW if aF~=""and dW~=aF and x()>=(y.nextTry or 0)then
y.nextTry=x()+1.1 if y.equip(aF)then z("team: "..aF..dV)else y.nextTry=x()+3 end end local jt=y.list[1]y.msg=("on: %s%s | next wax done %s"):format(dW~=""and dW or"(not a saved team)",(aF~=""and aF~=dW)and(" -> "..aF)or"",
jt and("in "..y.clock(jt.ends-b6).." (st "..jt.st.Name..")")or"- none running")end function y.clock(bA)bA=math.max(0,math.floor(bA))
if bA>=3600 then return("%d:%02d:%02d"):format(math.floor(bA/3600),math.floor((bA%3600)/60),bA%60)end return("%d:%02d"):format(math.floor(bA/60),bA%60)
end function y.allBusy()local xq,xr=eU()return xr>0 and xq==0 end function y.aboutToPlace()if not c.running then return false end
local pN=ac()if not(pN and aI(pN))then return false end local xs=eU()return xs>0 end function y.mult(pO,xt,pP)return{(1+pO)*(1+pP),(1+pO+xt)*(1+pP)}end
function y.speedNow()local function ju(xu)return tonumber(F:GetAttribute(xu))or 0 end return y.mult(ju("PetWaxSpeed"),ju("PetLongWax"),ju("PetSocialWax"))
end function y.speedOf(xv)local xw,pQ=y.teams()if not pQ then return nil end for C2,pR in ipairs(xw)do if pR.name==xv then
local jv={}for C3,xx in ipairs(pR.pets or{})do for C4,pS in ipairs(pQ.pets or{})do if tostring(pS.id)==tostring(xx)then jv[#jv+1]=pS break end end
end local pT=A.caps()local pU,xy=A.stats(jv)return y.mult(math.min(pU.waxSpeed or 0,pT.waxSpeed or 0.25),math.min(pU.longWax or 0,pT.longWax or 0.3),xy.socialWax or 0)
end end return nil end function y.speedRatio(xz)local pV,jw=y.speedNow(),y.speedOf(xz)if not jw then return{1,1}end
return{pV[1]/jw[1],pV[2]/jw[2]}end function y.glazeSoon()return d.Teams and d.TeamGlaze~=""and(y.glazeFor~=nil or x()<(y.afterUntil or 0))
end A.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
A.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}A.buildMsg,A.fuseMsg,A.fused,A.builds="","",0,0
function A.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function A.caps()local jx=l.info()return(jx and type(jx.Caps)=="table")and jx.Caps or A.CAPS
end function A.value(pW,jy)local f3=l.info()local cI=f3 and f3 .Pets[pW]if not(cI and type(cI.boost)=="table")then return nil end
local b8 if type(f3 .boostValue)=="function"then local xA,xC=pcall(f3 .boostValue,pW,(jy~=""and jy)or nil)b8=xA and tonumber(xC)or nil
end if not b8 then b8=cI.boost.value or 0 if jy=="Big"then local pX=b8*1.5 b8=A.ROUND[cI.boost.kind]and math.max(b8+1,math.floor(pX+0.5))or pX
end end return cI.boost.kind,b8,cI.boost.every end function A.stats(xD)local b9,jz={},{}for C5,pY in ipairs(xD)do
local aP,f4,pZ=A.value(pY.name,pY.variant or"")if aP then if aP:sub(1,6)=="social"then jz[aP]=math.max(jz[aP]or 0,f4)
elseif aP=="waxStir"or aP=="cashGift"then b9[aP]=(b9[aP]or 0)+f4*60/(pZ or 60)elseif aP=="luckyPull"then b9 .luckyPull=(b9 .luckyPull or 0)+f4/(pZ or 10)
else b9[aP]=(b9[aP]or 0)+f4 end end end return b9,jz end function A.glazeGain(xE,f5)local dX,jA,C6={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local xF=dX[1]+dX[2]+dX[3]local xG=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local cJ={}for f6=1,3 do cJ[f6]=dX[f6]+xE*dX[f6]/xF+(f6==1 and xG or 0)end
local jB={cJ[1]*(1-f5),cJ[2]*(1-f5)+cJ[1]*f5,cJ[3]+cJ[2]*f5}return jB[1]*(jA[1]-1)+jB[2]*(jA[2]-1)+jB[3]*(jA[3]-1)
end function A.score(f7,xH)local jC=A.caps()local f8,f9=A.stats(xH)local function bB(p0)return math.min(f8[p0]or 0,jC[p0]or math.huge)end
local xI=(1+bB("income"))*(1+(f9 .socialIncome or 0))*(1+math.min(f8 .cashGift or 0,jC.cashGiftPerMinute or 9)/60)
local xJ=1+bB("luck")+(f8 .luckyPull or 0)+(f9 .socialLuck or 0)local p1=xJ*(1+bB("newFind"))local dY=math.log(xI)
local xK=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local jD=(1+bB("waxSpeed")+bB("longWax"))*(1+(f9 .socialWax or 0))
+math.min(f8 .waxStir or 0,jC.waxStirPerMinute or 30)/60/xK local xL=1-(1-bB("headStart"))*(1-(f9 .socialHeadStart or 0))
if f7=="farm"then return dY+0.7*math.log(p1)+0.1*math.log(jD)end if f7=="full"then return dY+0.4*math.log(jD)+0.02*math.log(p1)end
if f7=="glaze"then return A.glazeGain(bB("glaze"),bB("glazeUp"))+0.001*dY end if f7=="wax"then return-math.log(1-0.5*xL)+0.001*dY+0.001*math.log(jD)end
return dY end function A.best(p2,cK,xM,jE)jE=jE or{}local ay,dZ={},{}local function p3(xN)local p4={}for xO,xP in ipairs(xN)do p4[xO]=cK[xP]end return p4 end
local function jF(p5)local jG=A.score(p2,p3(p5))for C7,xQ in ipairs(p5)do if jE[cK[xQ].id]then jG=jG+1e-7 end end
return jG end for C8=1,math.min(xM,#cK)do local f_,jH for jI=1,#cK do if not dZ[jI]then ay[#ay+1]=jI local p6=jF(ay)
ay[#ay]=nil if not jH or p6>jH+1e-12 then f_,jH=jI,p6 end end end if not f_ then break end dZ[f_]=true ay[#ay+1]=f_
end for C9=1,6 do task.wait()local p7,p8=false,jF(ay)for jJ=1,#ay do for jK=1,#cK do if not dZ[jK]then local p9=ay[jJ]
ay[jJ]=jK local p_=jF(ay)if p_>p8+1e-9 then dZ[p9],dZ[jK],p8,p7=nil,true,p_,true else ay[jJ]=p9 end end end end
if not p7 then break end end local qa={}for xR,xS in ipairs(ay)do qa[xR]=tostring(cK[xS].id)end return qa,A.score(p2,p3(ay))
end function A.count(qb,qc,xT)local d0,d1={},0 local qd,qe={},{}for C_,xU in ipairs(qc.arriving or{})do qd[tostring(xU)]=true end
for Da,cL in ipairs(qc.pets or{})do qe[tostring(cL.id)]=true if cL.name==qb and not qd[tostring(cL.id)]then if cL.variant=="Big"then d1=d1+1 elseif(cL.variant or"")==""then d0[#d0+1]=cL end
end end if not xT then for Db,d2 in ipairs(l.recent or{})do if d2 .name==qb and not qe[d2 .id]and x()-d2 .at<20 then
if d2 .variant=="Big"then d1=d1+1 else d0[#d0+1]=d2 end end end end return d0,d1 end function A.goal(xV)local qf=d.Pets[xV]return qf and tonumber(qf.f)or 0 end
function A.wantMore(qg,xW,qh)local jL=A.goal(qg)if jL<=0 or not qh then return true end local xX,qi=A.count(qg,qh)
if qi>=jL then return false end if xW=="Big"then return true end return#xX<A.need()*(jL-qi)end function A.status(qj,qk)
local ga=A.goal(qj)if ga<=0 or not qk then return nil end local xY,jM=A.count(qj,qk)if jM>=ga then return("Big %d/%d done"):format(jM,ga)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#xY,A.need()),A.need(),jM,ga)end function A.wear(jN)local jO={}
for Dc,xZ in ipairs(jN)do jO[tostring(xZ)]=true end for Dd=1,3 do local cM=l.data()if not cM then return false end
for De,ql in ipairs(cM.equipped or{})do if not jO[tostring(ql)]then l.call("unequip",ql)task.wait(0.3)end end
cM=l.data()local qm={}for Df,x0 in ipairs(cM.equipped or{})do qm[tostring(x0)]=true end for Dg,qn in ipairs(jN)do
if not qm[tostring(qn)]then l.call("equip",qn)task.wait(0.3)end end task.wait(0.4)cM=l.data()local jP,qo=0,true
for Dh,x1 in ipairs(cM.equipped or{})do jP=jP+1 if not jO[tostring(x1)]then qo=false end end if qo and jP==#jN then return true end
end return false end function A.saveTeam(qp,qq)if not A.wear(qq)then return false,"could not put the pets on"end
local x2=y.teams()local b_ for x3,x4 in ipairs(x2)do if x4 .name==qp then b_=x3 break end end local cN if b_ then
cN=l.call("teamSave",b_)else cN=l.call("teamNew")if type(cN)=="table"and cN.ok and cN.index then b_=cN.index task.wait(0.3)
l.call("teamRename",{index=b_,name=qp})end end task.wait(0.4)local jQ=l.data()local qr=jQ and jQ.teams and b_ and jQ.teams[b_]
if not qr then return false,"the game did not save it"end local qs={}for Di,x5 in ipairs(qr.pets or{})do qs[tostring(x5)]=true end
for Dj,x6 in ipairs(qq)do if not qs[tostring(x6)]then return false,"saved, but not with these pets"end end return true
end A.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function A.quiet()
if y.placing or y.glazeSoon()then return false end local x7=l.srv()for Dk,x8 in ipairs(y.list or{})do if x8 .ends-x7<(d.GlazeLead or 45)+90 then return false end end
return true end function A.plan()local d3=l.data()if not d3 then return{}end local qt={}for Dl,x9 in ipairs(d3 .arriving or{})do qt[tostring(x9)]=true end
local d4={}for Dm,gb in ipairs(d3 .pets or{})do if not qt[tostring(gb.id)]then d4[#d4+1]={id=tostring(gb.id),name=gb.name,variant=gb.variant or""}end
end local qu={}for Dn,qv in ipairs(d4)do qu[qv.id]=qv end local qw=tonumber(d3 .slots)or 3 local jR,qx={},{}for Do,gc in ipairs(A.ROLES)do
local d5=d[gc[1]]if d5~=""and not qx[d5]then qx[d5]=true local jS,d6,qy={},{},false for Dp,qz in ipairs(d3 .teams or{})do
if qz.name==d5 then for Dq,x_ in ipairs(qz.pets or{})do local jT=qu[tostring(x_)]if jT then jS[jT.id]=true d6[#d6+1]=jT else qy=true end
end end end local jU,qA=A.best(gc[2],d4,qw,jS)local qB=A.score(gc[2],d6)local qC=#jU==#d6 for Dr,ya in ipairs(jU)do if not jS[ya]then qC=false end end
if not qC and(qy or#d6<math.min(qw,#d4)or qA>qB+1e-4)then jR[#jR+1]={team=d5,role=gc[2],ids=jU,gain=qA-qB}end
end end return jR end function A.rebuild(yb)local qD=A.plan()if#qD==0 then A.buildMsg="teams are already the best your pets allow"return true end
if not A.quiet()then A.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end y.editing,y.editingSince=true,x()
local gd=true local yf,yg=pcall(function()for Ds,d7 in ipairs(qD)do local yc,yd=A.saveTeam(d7 .team,d7 .ids)local qE=l.data()
local jV={}for Dt,ye in ipairs(d7 .ids)do for Du,jW in ipairs(qE and qE.pets or{})do if tostring(jW.id)==ye then jV[#jV+1]=l.nice(jW.name,jW.variant)end
end end if yc then z(("TEAM %s rebuilt (%s): %s"):format(d7 .team,yb or"pets changed",table.concat(jV,", ")))
else gd=false z(("TEAM %s: %s"):format(d7 .team,tostring(yd)))end end end)y.editing,y.nextTry=false,0 if not yf then gd=false z("TEAM BUILD ERR "..tostring(yg))end
A.builds=A.builds+1 A.buildMsg=gd and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return gd end function A.fuseTick()if not d.AutoFuse or y.editing then return end local ge=l.data()if not ge then return end
local jX=A.need()local jY,gf={},{}for Dv,yh in ipairs(ge.teams or{})do for Dw,yi in ipairs(yh.pets or{})do jY[tostring(yi)]=true end end
for Dx,yj in ipairs(ge.equipped or{})do gf[tostring(yj)]=true end A.failUntil=A.failUntil or{}for ca,yk in pairs(d.Pets)do
local qF=tonumber(yk.f)or 0 local jZ,yl=A.count(ca,ge,true)if qF>0 and yl<qF and#jZ>=jX and x()>=(A.failUntil[ca]or 0)then
table.sort(jZ,function(gg,gh)local qG=(gf[tostring(gg.id)]and 4 or 0)+(jY[tostring(gg.id)]and 2 or 0)+(gg.named and 1 or 0)
local qH=(gf[tostring(gh.id)]and 4 or 0)+(jY[tostring(gh.id)]and 2 or 0)+(gh.named and 1 or 0)if qG~=qH then return qG<qH end
return tostring(gg.id)<tostring(gh.id)end)local gi,j0={},{}for gj=1,jX do gi[gj]=tostring(jZ[gj].id)if gf[gi[gj]]then j0[#j0+1]=gi[gj]end
end y.editing,y.editingSince=true,x()for Dy,ym in ipairs(j0)do l.call("unequip",ym)task.wait(0.3)end local gk=l.call("fuse",{ids=gi})
y.editing,y.nextTry=false,0 if type(gk)=="table"and gk.ok then A.fused=A.fused+1 A.dirtyAt=x()z(("FUSED %d %s -> Big %s"):format(jX,l.nice(ca),l.nice(ca)))
A.fuseMsg=("fused a Big %s %s"):format(l.nice(ca),os.date("%H:%M"))else A.failUntil[ca]=x()+120 z(("fuse %s failed: %s"):format(l.nice(ca),type(gk)=="table"and tostring(gk.reason or"no reason given")or"no answer"))
end return end end end function A.tick()pcall(A.fuseTick)if not d.AutoBuild or not d.Teams then return end local qI=l.data()
if not qI then return end local cb={}for Dz,yn in ipairs(qI.pets or{})do cb[#cb+1]=tostring(yn.id)end table.sort(cb)
cb=table.concat(cb,",")if cb~=A.sig then A.sig,A.dirtyAt=cb,x()end local yo=(A.dirtyAt and x()-A.dirtyAt>8)or x()-(A.lastBuild or 0)>900
if yo and not y.editing then local yp=A.rebuild(A.dirtyAt and"pets changed"or"check")if yp then A.dirtyAt,A.lastBuild=nil,x()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(cc)return cc:IsA("ParticleEmitter")or cc:IsA("Trail")or cc:IsA("Beam")or cc:IsA("Fire")or cc:IsA("Smoke")
or cc:IsA("Sparkles")or cc:IsA("Light")end function j.muteOne(aG)if not d.Lite or not aG.Parent then return end
local gl=(aG:IsA("BillboardGui")and j.bb)or(j.isFx(aG)and j.fx)or nil if not gl or gl[aG]~=nil then return end
gl[aG]=aG.Enabled if aG.Enabled then aG.Enabled=false end j.watch[aG]=aG:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aG.Enabled then gl[aG]=true aG.Enabled=false end end)end function j.lite(qJ)d.Lite=qJ if qJ then
task.spawn(function()for yq,yr in ipairs(as:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,yr)
if yq%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=V(as.DescendantAdded:Connect(function(j1)
if d.Lite and(j1:IsA("BillboardGui")or j.isFx(j1))then j.queue[#j.queue+1]=j1 end end))end local j2=game:GetService("Lighting")
for DA,d8 in ipairs(j2:GetChildren())do if d8:IsA("PostEffect")and d8 .Enabled and j.post[d8]==nil then j.post[d8]=true d8 .Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and j2 .GlobalShadows or j.oldShadows j2 .GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and as.Terrain.Decoration or j.oldDeco as.Terrain.Decoration=false end)
else for DB,ys in pairs(j.watch)do pcall(function()ys:Disconnect()end)end for qK,yt in pairs(j.bb)do pcall(function()if qK.Parent then qK.Enabled=yt end end)end
for qL,yu in pairs(j.fx)do pcall(function()if qL.Parent then qL.Enabled=yu end end)end for qM in pairs(j.post)do pcall(function()if qM.Parent then qM.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local yv=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()yv.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()as.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(qN)d.HideHud=qN local j3=F:FindFirstChildOfClass("PlayerGui")if not j3 then return end if qN then
for DC,d9 in ipairs(j3:GetChildren())do if d9:IsA("ScreenGui")and not j.MINE[d9 .Name]and d9 .Enabled then j.hud[d9]=true d9 .Enabled=false end
end if not j.hudConn then j.hudConn=V(j3 .ChildAdded:Connect(function(d_)if d.HideHud and d_:IsA("ScreenGui")and not j.MINE[d_.Name]then
task.defer(function()if d.HideHud and d_.Enabled then j.hud[d_]=true d_.Enabled=false end end)end end))end else
for qO in pairs(j.hud)do pcall(function()if qO.Parent then qO.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(j4)d.FpsCap=j4 local qP=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not qP then return false end return pcall(qP,j4==0 and 60 or j4)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(am)if am:IsA("BasePart")or am:IsA("Decal")or am:IsA("Texture")then if am.Transparency<1 then j.unseen[am]=am.Transparency am.Transparency=1 end
elseif am:IsA("BillboardGui")or am:IsA("SurfaceGui")or am:IsA("ParticleEmitter")or am:IsA("Beam")or am:IsA("Trail")or am:IsA("Light")or am:IsA("Fire")or am:IsA("Smoke")or am:IsA("Sparkles")then
if am.Enabled then j.unseen[am]=true am.Enabled=false end end end function j.notMine(yw)return d.HideMine or(c.plot and not yw:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(qQ)if d.HideBases then j.bases(false)end d.HideMine=qQ==2 if qQ>0 then j.bases(true)end end
function j.bases(qR)d.HideBases=qR local j5=as:FindFirstChild("Plots")if not j5 then return end if qR then task.spawn(function()
local j6=0 for DD,qS in ipairs(j5:GetChildren())do if qS~=c.plot or d.HideMine then for DE,yx in ipairs(qS:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,yx)j6=j6+1 if j6%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=V(j5 .DescendantAdded:Connect(function(qT)if d.HideBases and j.notMine(qT)then task.defer(function()pcall(j.hideOne,qT)end)end
end))end else for j7,qU in pairs(j.unseen)do pcall(function()if not j7 .Parent then return end if type(qU)=="number"then j7 .Transparency=qU else j7 .Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(qV)d.NoRender=qV pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not qV)end)
end function j.restoreAll()pcall(j.unpin)if d.HideBases then pcall(j.bases,false)end if E.arPaused then pcall(E.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(qW)if c.rejoining then return end z("REJOIN this server ("..qW..")")
pcall(eX)if c.autoload then pcall(fm,c.autoload)end ni()local yy=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then dn(qW..", same server failed")end end)return yy end function j.tick()
local j8=j.queue if d.Lite and j8 and#j8>0 then j.queue={}for yz,yA in ipairs(j8)do pcall(j.muteOne,yA)if yz%300==0 then task.wait()end end
end local qX=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if qX then for DF,yB in ipairs(qX:GetChildren())do
local qY=yB:FindFirstChild("SquishyPlaceHolder")local cd=qY and qY:FindFirstChild("TimerGui")if cd and cd:IsA("BillboardGui")then
if j.bb[cd]==nil then pcall(j.muteOne,cd)elseif cd.Enabled then j.bb[cd]=true cd.Enabled=false end end end end
local yC,ea=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if yC and type(ea)=="number"then
j.mem=ea j.memPeak=math.max(j.memPeak,ea)if(d.MemLimit or 0)>0 and ea>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(ea,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if x()-(j.noteAt or 0)>1800 then j.noteAt=x()z(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function j9(gm)if type(gm)~="string"then return false end
gm=gm:lower()for DG,yD in ipairs(c.sellWords)do if gm:find(yD,1,true)then return true end end return false end
local function yE()local qZ=aj:FindFirstChild("Remotes")local j_=qZ and qZ:FindFirstChild("SellSquishy")if not(j_ and j_:IsA("RemoteEvent"))then return false end
if not pcall(function()j_:FireServer()end)then return false end return ao(function()return ac()==nil end,1.5)
end local function yF()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local q0=au()local q1=q0 and q0 .HumanoidRootPart.Position local eb,q2 for DH,cO in ipairs((c.plot or as):GetDescendants())do
if cO:IsA("ProximityPrompt")and(j9(cO.ActionText)or j9(cO.ObjectText)or j9(cO.Name))then local q3=mg(cO)local ka=(q3 and q1)and(q3-q1).Magnitude or 1e9
if ka<=400 and(not eb or ka<q2)then eb,q2=cO,ka end end end c.sellSpot=eb c.noSellSpot=(eb==nil)return eb end
local function q4()local kb=ac()if not kb then c.holding=false return false end if aI(kb)then return false end
local kc=ah(aa(kb))if yE()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
z("SOLD "..kc)return true end local cP=yF()if cP then local q5=da(cP)if q5 then cy(q5,cP)local q6=ac()if q6 and not aI(q6)then
local yG,yH=dt(cP,function()return ac()==nil end,function()return cP.Enabled end)if yG then c.sold,c.holding,c.sellFails=c.sold+1,false,0
z(("SOLD %s at %s via %s"):format(kc,eS(cP),yH))return true end end end end c.sellFails=c.sellFails+1 z("could not sell "..kc.." ("..c.sellFails..")")
return false end local yI={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function yJ(cQ)local gn=eS(cQ):lower()for DI,yK in ipairs(yI)do if gn:find(yK,1,true)then return 0 end end
local a0,ap=cQ.Name:lower(),0 local function aQ(yL,yM)return yL:find(yM,1,true)~=nil end if aQ(a0,"collect")then ap=ap+60 end
if aQ(a0,"cash")or aQ(a0,"money")then ap=ap+45 end if aQ(a0,"income")or aQ(a0,"claim")then ap=ap+35 end if aQ(a0,"coin")or aQ(a0,"earn")or aQ(a0,"green")then ap=ap+20 end
if a0=="pad"or a0=="touch"then ap=ap+25 end if ap==0 and(aQ(gn,"collect")or aQ(gn,"cash")or aQ(gn,"money"))then ap=25 end
if ap==0 then return 0 end local ec=cQ.Color if ec.G>0.5 and ec.G>ec.R*1.4 and ec.G>ec.B*1.4 then ap=ap+15 end
if math.min(cQ.Size.X,cQ.Size.Y,cQ.Size.Z)<2 then ap=ap+5 end return ap end local function yN()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local go,ed,kd={},nil,29 for DJ,gp in ipairs(c.plot:GetDescendants())do
if gp:IsA("BasePart")then local gq=yJ(gp)if gq>0 then go[#go+1]={s=gq,p=gp}if gq>kd then ed,kd=gp,gq end end end
end table.sort(go,function(yO,yP)return yO.s>yP.s end)c.padCands,c.padPart=go,ed if ed then z("collect pad: "..eS(ed).." (score "..kd..")")end
return ed end local ke="SAB_pad_v1.txt"local function yQ(yR)if type(writefile)=="function"then pcall(writefile,ke,table.concat({yR:GetComponents()},","))end
end local function yS()if type(isfile)~="function"or type(readfile)~="function"then return nil end local yT,q7=pcall(function()if isfile(ke)then return readfile(ke)end end)
if not yT or type(q7)~="string"then return nil end local gr={}for yU in q7:gmatch("[^,]+")do gr[#gr+1]=tonumber(yU)end
if#gr==12 then return CFrame.new(unpack(gr))end end local function yV(kf,gs,yW)local yX=cx(kf)local kg=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aR=(kg and kg:IsA("BasePart"))and(kg.Position-gs)or Vector3 .new(1,0,0)aR=Vector3 .new(aR.X,0,aR.Z)if aR.Magnitude<0.05 then aR=Vector3 .new(1,0,0)end
aR=aR.Unit for yY=0,7 do local gt=yY*math.pi/4 local yZ=Vector3 .new(aR.X*math.cos(gt)-aR.Z*math.sin(gt),0,aR.X*math.sin(gt)+aR.Z*math.cos(gt))
local gu=gs+yZ*(yW+5)local kh=fu(gu.X,gs.Y,gu.Z)if kh and math.abs(kh.Y-gs.Y)<8 then aC(kf,Vector3 .new(gu.X,kh.Y+yX,gu.Z))
if ip(kf,0.7)then return true end end end return false end local function y0()c.lastCollect=x()local ee=au()if not ee then return end
local q8,y1=ee.HumanoidRootPart,cx(ee)local ef,q9,eg,ki=nil,4,nil,"?"local kj=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and kj and kj:IsA("BasePart")then ef,ki=(kj.CFrame*c.manualPad).Position,"manual pad"else local be=yN()
if be then ef=Vector3 .new(be.Position.X,be.Position.Y+be.Size.Y/2+y1,be.Position.Z)q9,eg,ki=math.max(be.Size.X,be.Size.Z)/2,be,be.Name
end end if not ef then z("COLLECT: pad not found - stand on it and tap SET PAD")return end local kk=a6()aC(ee,ef)
if eg and type(firetouchinterest)=="function"then pcall(firetouchinterest,q8,eg,0)end af(d.PadDwell)if eg and type(firetouchinterest)=="function"then pcall(firetouchinterest,q8,eg,1)end
af(0.5)c.collected=c.collected+1 local kl=a6()z(("COLLECTED (%s) %s"):format(ki,(kk and kl and kl>kk)and("+$"..aJ(kl-kk))or"no cash change seen"))
yV(ee,ef,q9)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function q.mods()if q.si and x()-q.modAt<120 then return true end
local q_=aj:FindFirstChild("Modules")if not q_ then return false end local function km(y2)local ra=q_:FindFirstChild(y2)
if not ra then return nil end local y3,rb=pcall(require,ra)return(y3 and type(rb)=="table")and rb or nil end q.si,q.arm,q.ci=km("SquishyInfo"),km("AutoRollRules"),km("CrateInfo")
q.modAt=x()if not q.si then return false end local kn={}if q.arm and type(q.arm.tierOf)=="table"then for ko in pairs(q.arm.tierOf)do
local gv=q.si[ko]if type(gv)=="table"and gv.rarity~="Limited"and not gv.incomeType and not gv.hiddenAfter then kn[aa(ko)]=ko end
end end q.roll=kn local gw={}for y4,y5 in pairs(kn)do local eh=q.si[y5]if type(eh)=="table"and type(eh.income)=="number"and not eh.incomeType then
gw[#gw+1]={k=y4,inc=eh.income,pr=tonumber(eh.price)or 0}end end table.sort(gw,function(kp,kq)if kp.inc~=kq.inc then return kp.inc>kq.inc end return kp.pr>kq.pr end)
q.order=gw local gx,kr,ks local y6=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for y7,kt in pairs(y6)do
local ku=type(kt)=="table"and tonumber(kt.price)if ku and(not kr or ku>kr)then gx,kr,ks=y7,ku,kt.title end end
q.bestCrate,q.bestCrateName=gx and L.key(gx),gx q.bestCrateTitle=ks and L.key(ks)or nil return true end function q.rank(y8)
local y9,y_=pcall(function()return q.arm.rankOf(y8)end)return(y9 and tonumber(y_))or 0 end function q.loadDisc(rc)
if type(rc)~="table"then return end local rd={}for za,zb in pairs(rc)do if zb then rd[aa(tostring(za))]=true end end
q.disc,q.discAt=rd,x()end function q.fetch()q.discAt=x()local re=aj:FindFirstChild("Remotes")local rf=re and re:FindFirstChild("GetSquishiesDiscovered")
if not rf then return end local zc,zd=pcall(function()return rf:InvokeServer()end)if zc then q.loadDisc(zd)end
end function q.scanWax()local kv={}local rg=c.plot and c.plot:FindFirstChild("WaxStations")if rg then for DK,rh in ipairs(rg:GetChildren())do
local ri=rh:FindFirstChild("SquishyPlaceHolder")if ri and rh:GetAttribute("HasSquishy")then for DL,rj in ipairs(ri:GetChildren())do if rj:IsA("Model")then kv[aa(rj.Name)]=true end end
end end end for rk,ze in pairs(q.placedAt)do if x()-ze<20 then kv[rk]=true else q.placedAt[rk]=nil end end q.waxing=kv
end function q.compute()local rl,kw,kx={},0,0 if q.disc then for ky in pairs(q.roll or{})do if not q.disc[ky]then
if q.waxing[ky]then kx=kx+1 else rl[ky],kw=true,kw+1 end end end end q.need,q.nNeed,q.nWax=rl,kw,kx local rm={}
for zf=1,math.min(d.Best or 0,#q.order)do rm[q.order[zf].k]=true end q.best=rm end function q.want(kz)if(d.Best or 0)>0 and next(q.best)then
if q.best[kz]then return true end elseif d.Targets[kz]then return true end return d.AutoIndex==true and q.need[kz]==true
end function q.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(q.best)~=nil)or(d.AutoIndex and next(q.need)~=nil)
end function q.placed(zg)local ei=aa(zg)q.placedAt[ei],q.waxing[ei]=x(),true if q.need[ei]then q.need[ei],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
z(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ah(ei)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local ej,ek={},{}for zh,zi in pairs(q.roll or{})do if q.want(zh)then ej[zi]=true end end
for rn,kA in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(rn)or(type(kA)=="table"and type(kA.title)=="string"and L.wanted(kA.title))then ek[rn]=true end
end if not next(ej)and not next(ek)then return nil end if q.arm and type(q.arm.encode)=="function"then local zj,ro=pcall(q.arm.encode,{rarities={},butters=ej,crates=ek,index=false})
if zj and type(ro)=="string"then return ro end end local function rp(zk)local gy={}for zl in pairs(zk)do gy[#gy+1]=zl end table.sort(gy)return table.concat(gy,",")end
local el="adv:"if next(ej)then el=el..";butters:"..rp(ej)end if next(ek)then el=el..";crates:"..rp(ek)end return el
end function q.canon(zm)local gz={}for rq in tostring(zm or""):gmatch("[^;]+")do local kB,rr=rq:match("^(%a+):(.*)$")
if not kB then kB,rr="r",rq:gsub("^adv:","")end for zn in rr:gmatch("[^,]+")do gz[#gz+1]=kB.."="..zn end end table.sort(gz)
return table.concat(gz,"|")end function q.sync(zo)if F:GetAttribute("AutoRoll")~=true then return end if x()<(q.pauseUntil or 0)then return end
local ce=q.rulesNow()if not ce or#ce>1900 then return end if q.canon(F:GetAttribute("AutoRollRules"))==q.canon(ce)then q.fails=0 return end
if not zo and x()-q.sentAt<4 then return end local rs=aj:FindFirstChild("Remotes")local rt=rs and rs:FindFirstChild("AutoRollAction")
if not rt then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,x()+300 z("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=x()C.replaying=true pcall(function()rt:FireServer("Rules",ce)end)C.replaying=false d.ARrules=ce
local gA,gB=0,0 for DM in(ce:match("butters:([^;]*)")or""):gmatch("[^,]+")do gA=gA+1 end for DN in(ce:match("crates:([^;]*)")or""):gmatch("[^,]+")do gB=gB+1 end
local ru=gA.."/"..gB if q.told~=ru then q.told=ru z(("auto roll now stops on %d butters and %d crates"):format(gA,gB))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if x()-q.discAt>30 then q.fetch()end
q.scanWax()q.compute()if q.on()then q.sync(false)end local a1={}if d.AutoIndex then a1[#a1+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if(d.Best or 0)>0 and q.order[1]then a1[#a1+1]="best: "..ah(q.order[1].k)end
if d.BestCrate and q.bestCrateName then a1[#a1+1]="crate: "..q.bestCrateName end if Q.got>0 then a1[#a1+1]="shower: "..Q.got end
q.msg=#a1>0 and table.concat(a1," | ")or"index / best: off"end q.heard={}function q.admin(zp,aS,gC)if zp~="Effect"then return end
if aS=="Shower"then Q.add(gC)return end if aS=="ShowerTaken"then Q.gone(gC)return end if aS=="ShowerClear"then Q.drops={}return end
if aS=="WaxGlow"then local kC=type(gC)=="table"and tonumber(gC.SnapAt)if kC then q.snapAt=kC z(("ADMIN: every wax finishes in %ds%s"):format(math.floor(kC-l.srv()),(d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end aS=tostring(aS)bT("Admin "..aS)if aS~="GoalPoint"and x()-(q.heard[aS]or-100)>30 then q.heard[aS]=x()
z("ADMIN: "..aS)end end Q.drops,Q.tried,Q.got,Q.miss={},{},0,0 function Q.add(kD)if type(kD)~="table"or type(kD.Pieces)~="table"then return end
for DO,aT in pairs(kD.Pieces)do if type(aT)=="table"and aT.Id~=nil and aT.Position~=nil then Q.drops[aT.Id]={id=aT.Id,butter=tostring(aT.Butter or"?"),rar=tostring(aT.Rarity or"?"),star=aT.Star==true,
pos=aT.Position,opens=tonumber(aT.OpensAt)or 0,ends=tonumber(aT.ExpiresAt)or 0}end end end function Q.gone(em)
if type(em)~="table"or em.Id==nil then return end Q.drops[em.Id]=nil if tonumber(em.UserId)==l.uid then Q.mine=em.Id end
end function Q.pick()local kE=l.srv()local kF,rv for rw,cf in pairs(Q.drops)do if kE>=cf.ends-0.3 then Q.drops[rw]=nil
elseif kE>=cf.opens-0.2 and(Q.tried[rw]or 0)<3 then local rx=(aI(cf.butter)and 1e6 or 0)+(cf.star and 1e5 or 0)+q.rank(cf.rar)*100-(cf.ends-kE)
if not kF or rx>rv then kF,rv=cf,rx end end end return kF end function Q.due()return d.Shower and c.running and next(Q.drops)~=nil and not ac()and Q.pick()~=nil
end function Q.grab()local aL,kG=Q.pick(),au()if not(aL and kG)then return end Q.tried[aL.id]=(Q.tried[aL.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aC(kG,aL.pos+Vector3 .new(0,cx(kG)+0.5,0))ao(function()return Q.mine==aL.id or ac()~=nil or not Q.drops[aL.id]end,1.5)
if Q.mine==aL.id or ac()then Q.got,Q.drops[aL.id]=Q.got+1,nil z(("GRABBED %s [%s]%s from the admin shower"):format(ah(aa(aL.butter)),aL.rar,aL.star and" (star)"or""))
elseif not Q.drops[aL.id]then Q.miss=Q.miss+1 end end local en local function ry()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 z("trying again after being stopped for 5 minutes")en(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not au()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bn(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local kH,rz=eU()
local gD=ac()if gD then local cR=ah(aa(gD))if not aI(gD)then local kI=(W.gift and aa(W.gift)==aa(gD)and x()-W.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cR,kI),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cR,kI),"bad"end return"sell",("selling %s (%s)"):format(cR,kI),"warn"
end if kH<1 then return nil,("holding %s - 0 free stations"):format(cR),"wait"end if y.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cR),"wait"end
return"place",("waxing %s (%d free)"):format(cR,kH),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local kJ=c.plot:FindFirstChild("CrateStand")if kJ then for DP,eo in ipairs(kJ:GetDescendants())do
if eo:IsA("ProximityPrompt")and eo.Enabled and iF(eo)then local bf=eo.ObjectText if bf==""then bf=cq(kJ,"TitleLabel")or""end
if bf~=""and L.wanted(bf)then local zq=eQ(bf):gsub("crate$","")local rA for rB in pairs(ad.members)do if eQ(rB)==zq then rA=rB end end
e.waiting,e.at,e.title,e.prompt=true,x(),bf,eo e.data={name=(bf:gsub("%s","")),rarity=rA,title=bf}z(bf.." found waiting on your stand")
end break end end end end local rC=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and rC then
local bh=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(bh),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 z("could not press the "..bh.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(bh),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(bh),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
bh,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(bh),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(bh),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(bh),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(bh,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not rC then local rD=e.title..tostring(e.rolledAt)if e.told~=rD then e.told=rD z(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if kH<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(rz,rz),"wait"
end local kK=mu()if not kK then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local ep=bS()
if ep and nS(ep.name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(ep.name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(ep.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(ep.name),"ok"
end local bC=im()if bC.state~="match"then c.matchSince=nil if bC.state=="skip"and not kK.Enabled then return nil,bC.text.." (sold out)","idle"end
return nil,bC.text,bC.level end if not kK.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local eq=x()if eq<c.noCashUntil then local rE,zr=nr()if rE then return nil,("cash short: have $%s, price ~$%s"):format(aJ(rE),aJ(zr)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aJ(a6()),math.ceil(c.noCashUntil-eq)),"bad"end if eq-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eq local rF=eq-c.matchSince if rF<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bC.shown,rF),"ok"end
return"buy",("buying %s via %s"):format(bC.shown,bC.src),"ok"end j.DEPTH=11 function j.pinTick()local rG=j.hold
if not rG then return end local kL=F.Character local kM=kL and kL:FindFirstChild("HumanoidRootPart")if not kM then return end
kM.CFrame=rG kM.AssemblyLinearVelocity=Vector3 .new(0,0,0)for DQ,gE in ipairs(kL:GetChildren())do if gE:IsA("BasePart")and gE.CanCollide then j.noclip[gE]=true gE.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(zs,rH)j.hold=zs if rH then j.surface=rH end end function j.unpin(zt)
if not j.hold then return end j.hold=nil for rI in pairs(j.noclip)do pcall(function()if rI.Parent then rI.CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local rJ=au()if rJ and j.surface and not zt then aC(rJ,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bi,rK=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),au()
if not(bi and bi:IsA("BasePart")and rK)then return nil end local rL=mj()or bi.Position local gF=Vector3 .new(rL.X-bi.Position.X,0,rL.Z-bi.Position.Z)
gF=gF.Magnitude>0.1 and gF.Unit or Vector3 .new(0,0,1)local gG=bi.Position+gF*6 local rM=fu(gG.X,bi.Position.Y,gG.Z,{bi})
return CFrame.new(gG.X,(rM and rM.Y or bi.Position.Y)+cx(rK),gG.Z)end function j.ground(zu,rN,zv)local kN,kO={F.Character},nil
for DR=1,12 do local kP=RaycastParams.new()kP.FilterType=Enum.RaycastFilterType.Exclude kP.FilterDescendantsInstances=kN
local gH=as:Raycast(Vector3 .new(zu,rN,zv),Vector3 .new(0,-2000,0),kP)if not gH then break end kO,rN=gH,gH.Position.Y-0.05
kN[#kN+1]=gH.Instance end return kO and kO.Position.Y end function j.parkHome()local kQ=j.home()if not kQ then return false end
local cS=kQ.Position local zw=j.ground(cS.X,cS.Y+300,cS.Z)or(cS.Y-3)j.pin(CFrame.new(cS.X,zw-8,cS.Z),kQ)return true
end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function j.setGhost(gI)d.Ghost,d.GhostHelps=gI==2,gI==1 if gI<2 then task.spawn(function()while c.busy do af(0.1)end
if j.ghostMode()<2 and j.hold and not D.home then pcall(j.unpin)end end)end j.paintGhost()z("ghost: "..j.GHOST[gI][1]:sub(8):lower())
end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end
local zx=au()if not zx or J.seat()then return end j.parkHome()end J.n,J.fails,J.nextAt,J.msg,J.lost=0,0,0,"no campfire right now",0
function J.seat()local rO=F.Character local rP=rO and rO:FindFirstChildOfClass("Humanoid")local kR=rP and rP.SeatPart
return(kR and kR.Name=="LogSeat")and kR or nil end function J.due()if not(d.Campfire and c.running)or x()<J.nextAt then return false end
local zy=as:FindFirstChild("NightSeats")if not zy then if J.wasOn then J.wasOn,J.fails,J.lost=false,0,0 end J.msg="no campfire (comes with weather events)"
return false end J.wasOn=true if J.seat()then J.sitAt=J.sitAt or x()J.msg=("sitting at the campfire: +%s%% cash"):format(tostring(F:GetAttribute("CampfireBoost")or"?"))
return false end if J.sitAt then J.lost,J.sitAt=J.lost+1,nil if J.lost>=4 then J.nextAt,J.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
z(J.msg)return false end end return true end function J.sit()local rQ,gJ=as:FindFirstChild("NightSeats"),au()
if not rQ or not gJ then return end local rR,cT=gJ.HumanoidRootPart.Position,{}for DS,gK in ipairs(rQ:GetChildren())do
local rS=gK:IsA("Seat")and gK.Occupant==nil and gK:FindFirstChildOfClass("ProximityPrompt")if rS then cT[#cT+1]={st=gK,p=rS}end
end if#cT==0 then J.nextAt,J.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cT,function(zz,zA)return(zz.st.Position-rR).Magnitude<(zA.st.Position-rR).Magnitude end)
local zB,zC=cT[1].st,cT[1].p j.unpin(true)local cU=zB.CFrame aC(gJ,cU.Position+cU.LookVector*2+Vector3 .new(0,2.5,0),cU.Position)
af(0.25)local zD=dt(zC,function()return J.seat()~=nil end)if not zD then aC(gJ,cU.Position+Vector3 .new(0,2,0),cU.Position+cU.LookVector)
ao(function()return J.seat()~=nil end,1.5)end if J.seat()then J.n,J.fails,J.sitAt=J.n+1,0,x()z(("SAT at the campfire (+%s%% cash)"):format(tostring(F:GetAttribute("CampfireBoost")or"?")))
else J.fails=J.fails+1 J.nextAt=x()+(J.fails>=3 and 60 or 5)J.msg="could not sit at the campfire"..(J.fails>=3 and" - trying again in a minute"or"")
if J.fails<=3 then z(J.msg)end end end E.msg,E.nextAt,E.at,E.pulls,E.claims,E.pullLeft,E.collectLeft,E.events="",0,0,0,0,0,0,{}
function E.refresh()E.at=x()local kS=aj:FindFirstChild("Remotes")if not kS then return end local er,kT,cV=0,0,{}
local zE,rT=pcall(function()return kS.ClanRequest:InvokeServer("state")end)local rU=zE and type(rT)=="table"and rT.tasks
for DT,bD in ipairs(rU and rU.list or{})do if not bD.done and bD.kind=="pull"then er=math.max(er,(bD.goal or 0)-(bD.progress or 0))end
if not bD.done then cV[#cV+1]=("%s %d/%d"):format(tostring(bD.text),bD.progress or 0,bD.goal or 0)end end E.events={}
for DU,cW in ipairs(kS:GetChildren())do if cW:IsA("RemoteFunction")and cW.Name:match("^%u%a+Action$")and cW.Name~="CrateAction"and cW.Name~="AutoRollAction"then
local zF,es=pcall(function()return cW:InvokeServer("state")end)if zF and type(es)=="table"and es.live==true and type(es.quests)=="table"then
E.events[#E.events+1]={r=cW,st=es}for DV,aM in ipairs(es.quests)do if not aM.done and aM.kind=="pull"then er=math.max(er,(aM.goal or 0)-(aM.progress or 0))end
if not aM.done and aM.kind=="collect"then kT=math.max(kT,(aM.goal or 0)-(aM.progress or 0))end if not aM.done then cV[#cV+1]=("%s %d/%d"):format(tostring(aM.text),aM.progress or 0,aM.goal or 0)end
end end end end E.pullLeft,E.collectLeft=er,kT E.msg=#cV>0 and("open: "..table.concat(cV,", "))or"all quests done for today"
end function E.claim()for DW,et in ipairs(E.events)do local rV=et.r.Name:gsub("Action$","")for DX,cX in ipairs(et.st.quests)do
if cX.done and not cX.claimed then local zG,rW=pcall(function()return et.r:InvokeServer("claimQuest",cX.id)end)
if zG and not(type(rW)=="table"and rW.ok==false)then E.claims=E.claims+1 z(("CLAIMED %s quest: %s (+%s)"):format(rV,tostring(cX.text),tostring(cX.points or cX.treats or"?")))
end af(0.4)end end if et.st.bonusReady==true then local zH=pcall(function()return et.r:InvokeServer("claimBonus")end)
if zH then z(("CLAIMED %s daily quest bonus"):format(rV))end af(0.4)end end end function E.tick()if not(d.Quests and c.running)then
if E.arPaused then E.resume("quests switched off")end return end if x()-E.at<(E.pullLeft>0 and 20 or 90)then return end
E.refresh()pcall(E.claim)if E.pullLeft<=0 and E.arPaused then E.resume("lever quests done")end end function E.pullDue()
return d.Quests and c.running and E.pullLeft>0 and x()>=E.nextAt and not C.busy end function E.lever()local rX=c.plot and c.plot:FindFirstChild("Lever")
local kU=rX and rX:FindFirstChild("Wheel")return kU and kU:FindFirstChildWhichIsA("ProximityPrompt"),kU end function E.resume(zI)
E.arPaused=false if E.arWas then E.arWas=false d.AutoRoll=true task.spawn(C.apply,zI)end end function E.pull()
local gL,kV=E.lever()if not gL or not kV or not kV:IsA("BasePart")then E.nextAt,E.msg=x()+300,"your lever was not found"return end
if not E.arPaused then E.arPaused=true E.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false C.apply("pulling the lever for a quest",true)
if C.isOn()then E.nextAt=x()+30 return end end z(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(E.pullLeft))
end if not gL.Enabled then E.nextAt=x()+1 return end cy(kV,gL)E.asked=nil nG(gL)E.pulls=E.pulls+1 E.pullLeft=E.pullLeft-1
af(0.6)if E.asked then E.nextAt=x()+600 z(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(E.asked)))
E.resume("a butter the game wants kept is on the pad")return end E.nextAt=x()+2.5 if E.pullLeft<=0 then E.at=0 end
end D.skip,D.skipN,D.n,D.calls,D.fails,D.nextAt,D.msg,D.tries={},0,0,0,0,0,"off",{}function D.can(bE,zJ)local kW=bE:GetAttribute("PourOwner")
if type(kW)~="number"or kW==l.uid or not bE:GetAttribute("HasSquishy")then return false end if bE:GetAttribute("PourLong")~=true or bE:GetAttribute("PourFull")==true then return false end
local kX=bE:GetAttribute("PourId")if kX==nil or D.skip[kX]then return false end local rY,kY,zK=bE:GetAttribute("Helpers"),0,tostring(l.uid)
if type(rY)=="string"then for zL in rY:gmatch("[^,%s]+")do kY=kY+1 if zL==zK then return false end end end if kY>=6 then return false end
local gM=y.left(bE)if not gM then local rZ=tonumber(bE:GetAttribute("PourEnd"))gM=rZ and(rZ-zJ)end if not gM or gM<=75 then return false end
local kZ=game:GetService("Players"):GetPlayerByUserId(kW)if not kZ or kZ:GetAttribute("WaxHelpOff")==true then return false end
return true,kZ,kX end function D.list()local k0,zM={},l.srv()local r0=as:FindFirstChild("Plots")for DY,r1 in ipairs(r0 and r0:GetChildren()or{})do
local r2=r1~=c.plot and r1:FindFirstChild("WaxStations")for DZ,k1 in ipairs(r2 and r2:GetChildren()or{})do local zN,zO,zP=D.can(k1,zM)
local k2=zN and k1:FindFirstChild("SquishyPlaceHolder")if k2 and k2:IsA("BasePart")then k0[#k0+1]={st=k1,p=zO,id=zP,part=k2}end
end end return k0 end function D.due()return d.Help and c.running and x()>=D.nextAt end function D.skipIt(r3,r4)
D.skip[r3],D.skipN=r4,D.skipN+1 if D.skipN>600 then D.skip,D.skipN,D.tries={[r3]=r4},1,{}end end function D.goHome()
local gN,bF=au(),D.home D.home=nil if not(gN and bF)then return end if d.Ghost and not J.seat()then j.unpin(true)
if not j.parkHome()then pcall(aC,gN,bF.Position,bF.Position+bF.LookVector)end elseif j.hold or(gN.HumanoidRootPart.Position-bF.Position).Magnitude>20 then
j.unpin(true)pcall(aC,gN,bF.Position,bF.Position+bF.LookVector)end end function D.step()local k3,eu=D.list(),au()
if#k3==0 or not eu then D.nextAt=x()+15 D.msg=("helped %d waxes here%s | none to help right now"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")
D.goHome()return end local r5=eu.HumanoidRootPart local r6=r5 .Position table.sort(k3,function(zQ,zR)return(zQ.part.Position-r6).Magnitude<(zR.part.Position-r6).Magnitude end)
local aU=k3[1]D.home=D.home or(j.hold and j.surface)or r5 .CFrame local bG=aU.part local ev=(bG.Position+aU.st:GetPivot().Position)/2
local gO=D.tries[aU.id]or 0 if(d.Ghost or d.GhostHelps)and gO==0 and not J.seat()then j.pin(bG.CFrame,D.home)
else j.unpin(true)local k4=gO==0 and fu(ev.X,bG.Position.Y,ev.Z,{bG})if k4 and math.abs(k4 .Y-bG.Position.Y)<8 then
aC(eu,Vector3 .new(ev.X,k4 .Y+cx(eu),ev.Z),bG.Position)else aC(eu,bG.Position+Vector3 .new(0,bG.Size.Y/2+3,0),ev)
end end af(0.3)local ew=aj:FindFirstChild("Remotes")ew=ew and ew:FindFirstChild("ClanRequest")if not ew then D.nextAt,D.msg=x()+60,"the game's help remote is missing"return end
local gP,bj=pcall(function()return ew:InvokeServer("help",aU.st:GetAttribute("PourOwner"),tonumber(aU.st.Name))end)
if gP and type(bj)=="table"and bj.ok then D.n,D.fails=D.n+1,0 D.skipIt(aU.id,"helped")z(("HELPED %s's wax (station %s)"):format(aU.p.DisplayName,aU.st.Name))
D.msg=("helped %d waxes here%s"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")elseif gP and type(bj)=="table"and tostring(bj.reason or""):lower():find("walk up",1,true)and gO<2 then
D.tries[aU.id]=gO+1 D.nextAt=x()+0.3 elseif gP and type(bj)=="table"and tostring(bj.reason or""):lower():find("moment",1,true)then
D.waits=(D.waits or 0)+1 D.nextAt=x()+1.6 else local r7=(gP and type(bj)=="table"and tostring(bj.reason or"refused"))or("error: "..tostring(bj))
D.skipIt(aU.id,r7)D.fails=D.fails+1 if D.fails<=3 then z(("help refused for %s's wax: %s"):format(aU.p.DisplayName,r7))end
if D.fails>=5 then D.fails,D.nextAt,D.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
D.goHome()end end D.nextAt=math.max(D.nextAt,x()+1.2)end function D.onCall(bk)if not d.HelpGuild or type(bk)~="table"or bk.p~="help"or bk.mine or bk.u==l.uid or not bk.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local ex=aj:FindFirstChild("Remotes")
ex=ex and ex:FindFirstChild("ClanRequest")if not ex then return end local r8,ey=pcall(function()return ex:InvokeServer("callHelp",bk.u)end)
local r9=tostring(bk.n or bk.un or bk.u)if r8 and type(ey)=="table"and ey.ok then D.calls=D.calls+1 z(("HELPED guildmate %s's wax from here (their call)"):format(r9))
else z(("guild call from %s: %s"):format(r9,(r8 and type(ey)=="table"and tostring(ey.reason or"refused"))or tostring(ey)))
end end)end local function aq(zS,r_,...)if c.busy then return end c.busy,c.busyText=true,zS if j.hold and r_~=D.step then pcall(j.unpin)end
local zT,sa=pcall(r_,...)c.busy,c.busyText=false,""if not zT and sa~=hx then z("ERR "..tostring(sa))end end local function zU()
local aV,zV,zW=ry()c.reason,c.level=zV,zW if aV=="place"then aq("waxing...",y.place)elseif aV=="crate"then aq("opening crate...",fH,true)
elseif aV=="cratesmart"then aq("opening crate...",e.smart)elseif aV=="cratewin"then aq("opening the crate window...",iH)
elseif aV=="nocrate"then aq("discarding crate...",fH,false)elseif aV=="sell"then aq("selling...",q4)elseif aV=="buy"then aq("buying...",nJ,false)
elseif not aV and not c.matchSince and Q.due()then aq("grabbing a butter from the admin shower...",Q.grab)elseif not aV and not c.matchSince and J.due()then
aq("sitting at the campfire...",J.sit)elseif not aV and not c.matchSince and E.pullDue()and not ac()and not(bS()and aI(bS().name))then
aq("pulling the lever for a quest...",E.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(E.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
aq("collecting money...",y0)elseif not aV and not c.matchSince and D.due()then aq("helping a wax...",D.step)elseif D.home and not d.Help then
aq("coming back...",D.goHome)elseif not c.busy then j.parkTick()end end function en(gQ,zX)if gQ==c.running then return end
c.running=gQ if not zX then d.AutoStart=gQ end if gQ then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bn()or c.plot
z("START")else c.reason="stopped"z("STOP")end end do local bH=fg(al.auto)if type(bH)=="string"then bH=bH:gsub("%s+$","")
if bH~=""then c.autoload=bH local zY=ne(bH)z(zY and("loaded config "..bH)or("config "..bH.." could not be loaded"))
end end end local o={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local zZ={ok=o.good,wait=o.warn,warn=o.warn,bad=o.bad,idle=o.dim}local sb={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function O(z0,z1,z2)local z3,k5=pcall(Instance.new,z0)
if not z3 then c.uiErrs=c.uiErrs+1 return nil end for z4,z5 in pairs(z1)do if not pcall(function()k5[z4]=z5 end)then c.uiErrs=c.uiErrs+1 end
end k5 .Parent=z2 return k5 end local function an(z6,z7)O("UICorner",{CornerRadius=UDim.new(0,z7 or 6)},z6)end
local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"})}function a.put(gR,k6)if gR and a.shown[gR]~=k6 then a.shown[gR]=k6 gR.Text=k6 end
end local k7=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local sc=k7:FindFirstChild("SABFarmGui")
if sc then sc:Destroy()end local k8=O("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},k7)
local ak={w=320,h=300,head=28,strip=34,tabs=24}pcall(function()local gS=as.CurrentCamera.ViewportSize if gS.X>100 and gS.Y>100 then
ak.w=math.clamp(math.floor(gS.X*0.44),300,360)ak.h=math.clamp(math.floor(gS.Y*0.84),240,340)end end)a.root=O("Frame",{Name="Root",Size=UDim2 .new(0,ak.w,0,ak.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=o.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},k8)
an(a.root,10)O("UIStroke",{Color=o.line,Thickness=1},a.root)local a2=UDim2 .new(1,0,1,0)local function K(sd,se)return UDim2 .new(sd,0,0,0),UDim2 .new(se,(sd+se>0.99)and 0 or-4,1,0)end
local function H(z8,z9,z_,Aa,Ab,Ac)local sf=O("TextButton",{Text=z9,Position=Ab,Size=Ac,BackgroundColor3=z_,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=Aa,TextColor3=o.text,AutoButtonColor=true},z8)an(sf,6)return sf end local function gT(Ad,Ae,Af,Ag,Ah)
local k9=O("TextBox",{Text=Ae,PlaceholderText=Af,Position=Ag,Size=Ah,BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=o.text,PlaceholderColor3=o.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Ad)an(k9,6)O("UIPadding",{PaddingLeft=UDim.new(0,8)},k9)
return k9 end local gU=as.CurrentCamera local function Ai()local Aj,gV=pcall(function()return gU and gU.ViewportSize end)
if Aj and gV and gV.X>50 and gV.Y>50 then return gV end end local function bI(ez)local k_=Ai()if not(k_ and ez and ez.Parent)then return end
local Ak=pcall(function()local gW,sh=ez.AbsolutePosition,ez.AbsoluteSize local la=70 local sj=math.clamp(gW.X,la-sh.X,k_.X-la)
local sk=math.clamp(gW.Y,0,k_.Y-math.min(sh.Y,la))if math.abs(sj-gW.X)>0.5 or math.abs(sk-gW.Y)>0.5 then ez.Position=UDim2 .new(0,math.floor(sj),0,math.floor(sk))
end end)return Ak end local function gX(Al)local Am,lb=pcall(function()return Al.AbsolutePosition end)if Am and lb then return{math.floor(lb.X),math.floor(lb.Y)}end
end local cY={}c.dragMoved={}local function sl(eA,sm,lc)V(eA.InputBegan:Connect(function(cZ)if cZ.UserInputType~=Enum.UserInputType.MouseButton1 and cZ.UserInputType~=Enum.UserInputType.Touch then return end
local ld={start=cZ.Position,from=sm.Position,moved=0,target=sm,input=cZ,onDrop=lc}cY[eA],c.dragMoved[eA]=ld,0
local le le=cZ.Changed:Connect(function()if cZ.UserInputState==Enum.UserInputState.End and cY[eA]==ld then cY[eA]=nil
if le then le:Disconnect()end if lc then lc(ld.moved)end end end)end))end V(l2 .InputChanged:Connect(function(gY)
if gY.UserInputType~=Enum.UserInputType.MouseMovement and gY.UserInputType~=Enum.UserInputType.Touch then return end
for An,a3 in pairs(cY)do local lf=a3 .target if lf and lf.Parent then local sn,so=gY.Position.X-a3 .start.X,gY.Position.Y-a3 .start.Y
a3 .moved=math.max(a3 .moved,math.abs(sn)+math.abs(so))c.dragMoved[An]=a3 .moved lf.Position=UDim2 .new(a3 .from.X.Scale,a3 .from.X.Offset+sn,a3 .from.Y.Scale,a3 .from.Y.Offset+so)
end end end))V(l2 .InputEnded:Connect(function(gZ)if gZ.UserInputType~=Enum.UserInputType.MouseButton1 and gZ.UserInputType~=Enum.UserInputType.Touch then return end
for Ao,g0 in pairs(cY)do if g0 .input==gZ or gZ.UserInputType==Enum.UserInputType.MouseButton1 then cY[Ao]=nil
if g0 .onDrop then g0 .onDrop(g0 .moved)end end end end))local function T(Ap,Aq,Ar,As,At,Au,Av)return O("TextLabel",{Text=Aq,Position=Au or UDim2 .new(0,0,0,0),Size=Av or a2,BackgroundTransparency=1,
Font=At and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=Ar,TextColor3=As,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Ap)
end a.title=O("Frame",{Size=UDim2 .new(1,0,0,ak.head),BackgroundColor3=o.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=O("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=o.dim,BorderSizePixel=0},a.title)
an(a.dot,5)T(a.title,"SAB  BUTTER FARM  "..cl,12,o.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=H(a.title,"-",o.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=H(a.title,"X",o.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=O("Frame",{Position=UDim2 .new(0,0,0,ak.head),Size=UDim2 .new(1,0,0,ak.strip),BackgroundColor3=o.bg,BorderSizePixel=0},a.root)
a.bar=O("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=o.warn,BorderSizePixel=0},a.strip)
an(a.bar,2)a.reason=T(a.strip,"starting",12,o.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=O("Frame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip),Size=UDim2 .new(1,0,0,ak.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=H(a.tabs,"FARM",o.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=H(a.tabs,"BUTTERS",o.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=H(a.tabs,"CRATES",o.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=H(a.tabs,"PETS",o.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=H(a.tabs,"TEAMS",o.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=H(a.tabs,"SETUP",o.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function c0()local lg=O("ScrollingFrame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip+ak.tabs),Size=UDim2 .new(1,0,1,-(ak.head+ak.strip+ak.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=o.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
O("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},lg)O("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},lg)
return lg end a.farm,a.but,a.set,a.crt=c0(),c0(),c0(),c0()a.pet,a.team=c0(),c0()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local g1,eB,M=0,12,nil local function a4(sp,Aw)g1,eB=g1+1,eB+sp+6 return O("Frame",{Size=UDim2 .new(1,0,0,sp),BackgroundTransparency=1,LayoutOrder=g1},Aw or a.farm)
end local function sq(Ax)T(a4(14),Ax,10,o.dim,true)end M=a4(32)a.startB=H(M,"START",o.good,14,K(0,0.68))a.killB=H(M,"KILL",o.bad,14,K(0.68,0.32))
do local Ay=a4(40)local function eC(sr,Az,lh)local li=O("Frame",{Position=UDim2 .new((sr-1)/lh,0,0,0),Size=UDim2 .new(1/lh,sr<lh and-4 or 0,1,0),
BackgroundColor3=o.panel,BorderSizePixel=0},Ay)an(li,6)local ss=T(li,"0",14,o.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,20))
local AA=T(li,Az,9,o.dim,false,UDim2 .new(0,0,0,23),UDim2 .new(1,0,0,13))ss.TextXAlignment,AA.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return ss end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=eC(1,"BOUGHT",5),eC(2,"WAXED",5),eC(3,"SOLD",5),eC(4,"MONEY",5),eC(5,"FREE",5)
end a.info=T(a4(40),"",10,o.dim,false)a.tgt=T(a4(16),"",10,o.good,false)sq("SWITCHES")do local function c1(AB,AC)
local su=a4(26)return H(su,AB,o.panel2,10,K(0,0.5)),H(su,AC,o.panel2,10,K(0.5,0.5))end a.colT,a.sellT=c1("COLLECT: ON","SELL THEM: ON")
a.crateT,a.arT=c1("OPEN CRATES: ON","AUTO ROLL: OFF")a.helpT,a.helpGT=c1("HELP WAXES: OFF","GUILD CALLS: OFF")
a.campT,a.ghostT=c1("CAMPFIRE: OFF","GHOST: OFF")a.ixT,a.bestT=c1("AUTO INDEX: OFF","BEST BUTTER: OFF")a.bcT,a.shT=c1("BEST CRATE: OFF","GRAB SHOWER: ON")
M=a4(26)a.questT=H(M,"QUESTS: OFF",o.panel2,10,K(0,0.5))T(M,"collect every",9,o.dim,false,K(0.52,0.2))a.secB=gT(M,tostring(d.Every),"60",K(0.72,0.13))
a.secB.TextSize=11 a.secSet=H(M,"SET",o.accent,10,K(0.85,0.15))local g2=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},a4(76))
an(g2,6)O("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},g2)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,3)},g2)
local function eD(AD)local g3=T(g2,"",9,o.dim,false,nil,UDim2 .new(1,-6,0,14))g3 .LayoutOrder,g3 .TextWrapped,g3 .TextTruncate=AD,false,Enum.TextTruncate.AtEnd
return g3 end a.helpL,a.campL,a.questL,a.arL,a.ixL=eD(1),eD(2),eD(3),eD(4),eD(5)end sq("LOG")a.log=O("TextLabel",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},a4(84))an(a.log,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,eB)g1,eB=0,12 local function ai(AE)return a4(AE,a.set)end local function c2(AF)T(ai(14),AF,10,o.dim,true)end
c2("ONE-OFF ACTIONS")M=ai(26)a.buyB=H(M,"BUY THE PAD",o.warn,10,K(0,0.5))a.plB=H(M,"WAX WHAT I HOLD",o.good,10,K(0.5,0.5))
M=ai(26)a.sellB=H(M,"SELL WHAT I HOLD",o.warn,10,K(0,0.5))a.crateB=H(M,"OPEN CRATE NOW",o.warn,10,K(0.5,0.5))
M=ai(26)a.padB=H(M,"SET PAD (stand on it)",o.panel2,10,K(0,0.55))a.padL=T(M,"",10,o.dim,false,K(0.56,0.44))c2("SETTINGS FILE  (saved on your phone)")
M=ai(28)a.cfgName=gT(M,"default","config name",K(0,0.5))a.cfgSave=H(M,"SAVE",o.good,11,K(0.5,0.25))a.cfgLoad=H(M,"LOAD",o.accent,11,K(0.75,0.25))
M=ai(26)a.cfgPrev=H(M,"<",o.panel2,11,K(0,0.13))a.cfgPick=H(M,"(none saved)",o.panel2,10,K(0.13,0.74))a.cfgNext=H(M,">",o.panel2,11,K(0.87,0.13))
M=ai(26)a.cfgAuto=H(M,"LOAD IT ON LAUNCH: OFF",o.panel2,10,K(0,1))a.cfgMsg=T(ai(26),"",10,o.dim,false)c2("START BY ITSELF")
M=ai(26)a.autoB=H(M,"INSTALL F.exec",o.accent,10,K(0,1))a.autoMsg=T(ai(30),"",10,o.dim,false)M=ai(28)a.startT=H(M,"START FARMING ON LOAD: ON",o.accent,10,K(0,1))
T(ai(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,o.dim,false)
c2("IF THE GAME DROPS ME")M=ai(28)a.rejT=H(M,"AUTO REJOIN: ON",o.accent,11,K(0,0.55))a.rejB=H(M,"REJOIN NOW",o.warn,11,K(0.55,0.45))
a.rejMsg=T(ai(30),"",10,o.dim,false)c2("SMOOTHER RUNNING  (for long / overnight runs)")M=ai(28)a.pfLite=H(M,"LITE MODE: OFF",o.panel2,10,K(0,0.5))
a.pfHud=H(M,"HIDE GAME HUD: OFF",o.panel2,10,K(0.5,0.5))M=ai(28)a.pfFps=H(M,"FPS CAP: GAME",o.panel2,10,K(0,0.5))
a.pfRender=H(M,"STOP 3D: OFF",o.panel2,10,K(0.5,0.5))M=ai(28)a.pfBases=H(ai(28),"BASES: ALL DRAWN",o.panel2,10,K(0,1))
M=ai(28)a.pfMem=gT(M,tostring(d.MemLimit),"2000",K(0,0.24))T(M,"MB: rejoin this server above it (0 = never)",9,o.dim,false,K(0.26,0.52))
a.pfMemSet=H(M,"SET",o.accent,11,K(0.8,0.2))a.pfInfo=T(ai(18),"",10,o.text,false)T(ai(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. BASES: OTHERS HIDDEN stops drawing other players' bases and stacks, ALL HIDDEN yours too (nothing is removed, so helping and farming work). HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,o.dim,false)
c2("THE ROUND SAB BUTTON")T(ai(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,o.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,eB)local sv=O("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},k7)
a.tgRoot=O("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=o.accent,BorderSizePixel=0,Active=true},sv)an(a.tgRoot,20)O("UIStroke",{Color=o.line,Thickness=1},a.tgRoot)
a.tgBtn=O("TextButton",{Text="SAB",Size=a2,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=o.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=O("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=o.dim,BorderSizePixel=0},a.tgRoot)
an(a.tgDot,4)a.tgGhost=O("TextButton",{Text="G: OFF",Size=UDim2 .new(0,46,0,18),Position=UDim2 .new(0.5,-23,1,4),
BackgroundColor3=o.panel2,Font=Enum.Font.GothamBold,TextSize=9,TextColor3=o.text,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
an(a.tgGhost,6)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()local g4=j.ghostMode()
local sw=g4==2 and o.accent or(g4==1 and o.warn or o.panel2)if a.ghostT then a.ghostT.Text,a.ghostT.BackgroundColor3=j.GHOST[g4][1],sw end
if a.tgGhost then a.tgGhost.Text,a.tgGhost.BackgroundColor3=j.GHOST[g4][2],sw end end local bl={built=false,boxes={},at=0}
local function sx(sy,lj)d.Targets[sy]=lj or nil local lk=bl.boxes[sy]if lk then lk.Text=lj and"X"or""lk.BackgroundColor3=lj and o.good or o.panel2
end end local function ll()for AG,sz in pairs(bl.boxes)do local sA=d.Targets[AG]==true sz.Text=sA and"X"or""sz.BackgroundColor3=sA and o.good or o.panel2
end end local eE local function AH()local AI=0 local lm=O("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=T(lm,"",10,o.dim,false,K(0,0.5))local AJ=H(lm,"CLEAR",o.panel2,10,K(0.5,0.24))local AK=H(lm,"REFRESH",o.panel2,10,K(0.74,0.26))
AJ.MouseButton1Click:Connect(function()for AL in pairs(d.Targets)do d.Targets[AL]=nil end ll()end)AK.MouseButton1Click:Connect(function()
ad.at=0 h7()eE(true)end)return AI end eE=function(AM)if not h7()then if not a.butEmpty then a.butEmpty=T(O("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,o.warn,false)end return end if bl.built and not AM and bl.at==ad.at then return end
for D0,ln in ipairs(a.but:GetChildren())do if ln:IsA("Frame")or ln:IsA("TextButton")then ln:Destroy()end end bl.boxes,a.butEmpty={},nil
AH()local lo,lp=36,1 local function sB(sC)lp=lp+1 local AN=O("Frame",{Size=UDim2 .new(1,0,0,sC),BackgroundTransparency=1,LayoutOrder=lp},a.but)
lo=lo+sC+6 return AN end for D1,g5 in ipairs(ad.rarOrder)do local AO=sB(24)local AP=sb[g5]or o.text local lq=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},AO)
an(lq,6)T(lq,"  "..g5:upper(),11,AP,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local AQ=H(lq,"ALL",o.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local AS=g5 AQ.MouseButton1Click:Connect(function()local sD=ad.members[AS]or{}local sE=false for D2,AT in ipairs(sD)do if not d.Targets[AT]then sE=true break end end
for D3,AU in ipairs(sD)do sx(AU,sE)end end)for D4,lr in ipairs(ad.members[g5]or{})do local AV=sB(22)local g6=O("TextButton",{Text="",Size=a2,BackgroundColor3=o.bg,BorderSizePixel=0,
AutoButtonColor=true},AV)an(g6,5)T(g6,"   "..ah(lr),11,o.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local ls=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},g6)an(ls,4)bl.boxes[lr]=ls local sF=lr local function sG()sx(sF,not d.Targets[sF])end
g6 .MouseButton1Click:Connect(sG)ls.MouseButton1Click:Connect(sG)end end ll()a.but.CanvasSize=UDim2 .new(0,0,0,lo+10)
bl.built,bl.at=true,ad.at end function L.paint()for AW,sH in pairs(L.boxes)do local sI=d.CrateTicks[AW]==true
sH.Text=sI and"X"or""sH.BackgroundColor3=sI and o.good or o.panel2 end if a.crtInfo then local lt,lu=0,0 for D5 in pairs(L.boxes)do lt=lt+1 end
for D6,AX in pairs(d.CrateTicks)do if AX then lu=lu+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(lt,lu)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and o.accent or o.panel2
end end function L.build()for D7,lv in ipairs(a.crt:GetChildren())do if lv:IsA("Frame")or lv:IsA("TextButton")then lv:Destroy()end
end L.boxes={}local lw,lx=12,0 local function g7(sJ)lx=lx+1 lw=lw+sJ+6 return O("Frame",{Size=UDim2 .new(1,0,0,sJ),BackgroundTransparency=1,LayoutOrder=lx},a.crt)
end local ly=g7(28)a.crtInfo=T(ly,"",10,o.dim,false,K(0,0.5))local AY=H(ly,"CLEAR",o.panel2,10,K(0.5,0.24))local AZ=H(ly,"REFRESH",o.panel2,10,K(0.74,0.26))
V(AY.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))V(AZ.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=H(g7(28),"",o.accent,11,K(0,1))V(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
T(g7(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,o.dim,false)
for D8,bm in ipairs(L.list())do local A0=g7(24)local eF=O("TextButton",{Text="",Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,AutoButtonColor=true},A0)
an(eF,5)T(eF,"  "..(bm.title or bm.name)..(bm.guess and"  (?)"or""),11,sb[bm.rar or""]or o.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
T(eF,bm.price and("$"..aJ(bm.price))or(bm.rar or""),9,o.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local lz=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},eF)an(lz,4)L.boxes[bm.k]=lz local sK=bm.k local function sL()d.CrateTicks[sK]=(not d.CrateTicks[sK])or nil
L.paint()end V(eF.MouseButton1Click:Connect(sL))V(lz.MouseButton1Click:Connect(sL))end a.crt.CanvasSize=UDim2 .new(0,0,0,lw+10)
L.built=L.at L.paint()end local sM="farm"local function bJ(ar)sM=ar a.farm.Visible,a.but.Visible,a.set.Visible=(ar=="farm"),(ar=="but"),(ar=="set")
a.crt.Visible=(ar=="crt")a.pet.Visible,a.team.Visible=(ar=="pet"),(ar=="team")a.tabCrt.BackgroundColor3=(ar=="crt")and o.accent or o.panel2
a.tabPet.BackgroundColor3=(ar=="pet")and o.accent or o.panel2 a.tabTeam.BackgroundColor3=(ar=="team")and o.accent or o.panel2
if ar=="pet"and not l.built then pcall(l.build)end if ar=="team"and not y.built then pcall(y.build)end if ar=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(ar=="farm")and o.accent or o.panel2 a.tabBut.BackgroundColor3=(ar=="but")and o.accent or o.panel2
a.tabSet.BackgroundColor3=(ar=="set")and o.accent or o.panel2 if ar=="but"then eE(false)end end local function N(g8,g9,A1,A2)
a.put(g8,g9 and A1 or A2)if a.lit[g8]~=g9 then a.lit[g8]=g9 g8 .BackgroundColor3=g9 and o.accent or o.panel2 end
end l.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function l.paintRow(sN)
local cg=l.rows and l.rows[sN]if not cg then return end local eG=d.Pets[sN]or{}cg.b.BackgroundColor3=eG.b and o.good or o.panel2
cg.g.BackgroundColor3=eG.g and o.accent or o.panel2 cg.g.Text=eG.g and"BIG"or"ANY"cg.w.BackgroundColor3=eG.w and o.warn or o.panel2
local lA=tonumber(eG.f)or 0 cg.f.Text=lA>0 and(lA.." BIG")or"FUSE"cg.f.BackgroundColor3=lA>0 and o.good or o.panel2
end function l.flag(lB,g_)local a5=d.Pets[lB]or{}if g_=="f"then local sO=((tonumber(a5 .f)or 0)+1)%4 a5 .f=sO>0 and sO or nil
elseif a5[g_]then a5[g_]=nil else a5[g_]=true end d.Pets[lB]=(a5 .b or a5 .g or a5 .w or a5 .f)and a5 or nil l.paintRow(lB)
end function l.paintAll()for A3 in pairs(l.rows or{})do l.paintRow(A3)end if a.pbT then N(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function l.live()if not l.built then l.build()return end if x()-(l.liveAt or 0)<1 then return end l.liveAt=x()
local sP=l.wishes()local eH=l.data()for ha,hb in pairs(l.rows)do hb.name.Text=l.nice(ha)..(sP[ha]and("   * wish %dm"):format(math.ceil(sP[ha]/60))or"")
local sQ=A.status(ha,eH)hb.desc.Text=sQ and(sQ.." | "..hb.boostText)or hb.boostText end local sR=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eH and#(eH.pets or{})or 0,eH and tonumber(eH.maxOwned)or 60,
aJ(l.money()),sR>0 and(" | free wishes "..sR)or"",l.buyMsg~=""and l.buyMsg or"-",l.wishMsg~=""and l.wishMsg or"-")
end function l.build()local hc=l.info()for D9,lC in ipairs(a.pet:GetChildren())do if lC:IsA("Frame")or lC:IsA("TextLabel")then lC:Destroy()end
end l.rows={}local lD,hd=0,12 local function c3(sS)lD,hd=lD+1,hd+sS+6 return O("Frame",{Size=UDim2 .new(1,0,0,sS),BackgroundTransparency=1,LayoutOrder=lD},a.pet)
end local lE=c3(28)a.pbT=H(lE,"AUTO ADOPT: OFF",o.panel2,9,K(0,0.34))a.pwT=H(lE,"AUTO WISH: OFF",o.panel2,9,K(0.34,0.33))
a.pfT=H(lE,"AUTO FUSE: OFF",o.panel2,9,K(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy l.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish l.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse l.paintAll()end)
a.pInfo=T(c3(44),"",10,o.dim,false)T(c3(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,o.dim,false)
if not hc then T(c3(30),"pet list not loaded yet - open this tab again in a moment",11,o.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,hd)
l.built=false return end local c4={}for D_,sT in ipairs(l.order())do local lF=hc.Pets[sT].rarity or"?"c4[lF]=c4[lF]or{}
table.insert(c4[lF],sT)end local c5={}for Ea,sU in ipairs(hc.Rarities or{})do if c4[sU]then c5[#c5+1]=sU end end
for sV in pairs(c4)do if not table.find(c5,sV)then c5[#c5+1]=sV end end for Eb,he in ipairs(c5)do local sW=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},c3(22))
an(sW,6)T(sW,"  "..he:upper(),11,l.RC[he]or o.text,true)for Ec,hf in ipairs(c4[he])do local cj=O("Frame",{Size=a2,BackgroundColor3=o.bg,BorderSizePixel=0},c3(38))
an(cj,5)local A4=T(cj,l.nice(hf),11,l.RC[he]or o.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local A5,A6=pcall(function()return hc.describe(hf)end)
local sX=A5 and tostring(A6)or""local A7=T(cj,sX,9,o.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local sY=H(cj,"BUY",o.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local sZ=H(cj,"ANY",o.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local s0=H(cj,"WISH",o.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local s1=H(cj,"FUSE",o.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local hg=hf sY.MouseButton1Click:Connect(function()l.flag(hg,"b")end)
sZ.MouseButton1Click:Connect(function()l.flag(hg,"g")end)s0 .MouseButton1Click:Connect(function()l.flag(hg,"w")end)
s1 .MouseButton1Click:Connect(function()l.flag(hg,"f")end)l.rows[hf]={b=sY,g=sZ,w=s0,f=s1,name=A4,desc=A7,boostText=sX}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,hd+10)l.built=true l.paintAll()end function j.paint()N(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")N(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
N(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])N(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end V(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
V(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))V(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))
V(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))V(a.pfFps.MouseButton1Click:Connect(function()
local A8=table.find(j.CAPS,d.FpsCap or 0)or 1 local s2=j.CAPS[(A8%#j.CAPS)+1]if not j.cap(s2)and s2~=0 then z("this executor cannot cap fps")end
j.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()local lG=tonumber(a.pfMem.Text)if lG and lG>=0 then d.MemLimit=math.floor(lG)end
j.paint()end))function y.names()local lH={"(none)"}for Ed,A9 in ipairs((y.teams()))do lH[#lH+1]=A9 .name end return lH
end function y.cycle(lI,A_)local hh=y.names()local Ba=d[lI]~=""and d[lI]or"(none)"local hi=table.find(hh,Ba)or 1
hi=((hi-1+A_)%#hh)+1 d[lI]=hh[hi]=="(none)"and""or hh[hi]y.paint()end function y.paint()if not y.built then return end
N(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")N(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")
local lJ={}for Ee,Bb in ipairs((y.teams()))do lJ[Bb.name]=true end for Bc,s3 in pairs(y.pick)do local c6=d[Bc]
s3 .Text=c6==""and"(none)"or(lJ[c6]and c6 or(c6 .." (missing)"))s3 .TextColor3=(c6~=""and not lJ[c6])and o.bad or o.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(y.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(y.switches,y.finished,y.glazed,A.fused)
..(A.buildMsg~=""and("\n"..A.buildMsg)or"")local Bd,hj=l.srv(),{}for Ef,hk in ipairs(y.list or{})do hj[#hj+1]=("st %-2s %-22s %9s  helps %d"):format(hk.st.Name,ah(aa(hk.name)):sub(1,22),y.clock(hk.ends-Bd),hk.helps)
end a.tmList.Text=#hj>0 and table.concat(hj,"\n")or"no waxes running"end function y.build()for Eg,lK in ipairs(a.team:GetChildren())do
if lK:IsA("Frame")or lK:IsA("TextLabel")then lK:Destroy()end end y.pick={}local lL,lM=0,12 local function bK(s4)
lL,lM=lL+1,lM+s4+6 return O("Frame",{Size=UDim2 .new(1,0,0,s4),BackgroundTransparency=1,LayoutOrder=lL},a.team)
end local function eI(Be)T(bK(14),Be,10,o.dim,true)end local function hl(hm)local lN=bK(26)local Bf=H(lN,"<",o.panel2,11,K(0,0.14))
local s5=H(lN,"(none)",o.panel,10,K(0.14,0.72))local Bg=H(lN,">",o.panel2,11,K(0.86,0.14))Bf.MouseButton1Click:Connect(function()y.cycle(hm,-1)end)
Bg.MouseButton1Click:Connect(function()y.cycle(hm,1)end)s5 .MouseButton1Click:Connect(function()y.cycle(hm,1)end)
y.pick[hm]=s5 end a.tmT=H(bK(28),"AUTO TEAMS: OFF",o.panel2,11,K(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=y.current()end y.paint()end)a.tmInfo=T(bK(42),"",10,o.dim,false)
local s6=bK(26)a.tmBuild=H(s6,"AUTO BUILD TEAMS: OFF",o.panel2,9,K(0,0.62))a.tmBuildNow=H(s6,"BUILD NOW",o.warn,9,K(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild y.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if y.editing then return end A.buildMsg="building..."task.spawn(function()local Bh,Bi=pcall(A.rebuild,"you asked")if not Bh then z("BUILD ERR "..tostring(Bi))end end)
end)eI("NORMAL TEAM  (worn the rest of the time)")hl("TeamNormal")eI("FULL TEAM  (every station busy: money + wax speed)")
hl("TeamFull")eI("GLAZE TEAM  (worn just before a wax finishes)")hl("TeamGlaze")local lO=bK(26)a.tmLead=gT(lO,tostring(d.GlazeLead),"45",K(0,0.2))
T(lO,"sec before it finishes",10,o.dim,false,K(0.22,0.5))local Bj=H(lO,"SET",o.accent,11,K(0.75,0.25))Bj.MouseButton1Click:Connect(function()
local hn=tonumber(a.tmLead.Text)if hn and hn>=5 and hn<=600 then d.GlazeLead=math.floor(hn)else a.tmLead.Text=tostring(d.GlazeLead)end
y.paint()end)eI("WAX TEAM  (worn while a butter is placed: head starts)")hl("TeamWax")eI("YOUR WAXES  (time left, helps)")
a.tmList=O("TextLabel",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bK(150))an(a.tmList,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
T(bK(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,o.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,lM+10)y.built=true y.paint()end local function Bk()a.secB.Text=tostring(d.Every)
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not D.home then pcall(j.unpin)end end)end
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then en(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bI(a.root)bI(a.tgRoot)c.lastCollect=x()
ll()L.paint()pcall(l.paintAll)pcall(y.paint)pcall(j.applyAll)end local function Bl(s7)task.spawn(function()s7 .TextColor3=o.bad
task.wait(0.8)if c.alive then s7 .TextColor3=o.text end end)end local function s8()local s9=a.secB.Text:match("^%s*(%d+)%s*$")
local eJ=s9 and tonumber(s9)if not eJ or eJ<1 then a.secB.Text=tostring(d.Every)Bl(a.secB)z("interval must be a whole number >= 1")
return end if eJ==d.Every then return end d.Every,c.lastCollect=eJ,x()z("collect every "..eJ.."s")end local function P(Bm,Bn)V(Bm.MouseButton1Click:Connect(Bn))end
P(a.secSet,s8)V(a.secB.FocusLost:Connect(s8))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(aq,"selling...",q4)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(C.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help D.nextAt,D.msg=0,d.Help and"looking for waxes to help"or"off"N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests E.at=0 N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire J.nextAt,J.fails,J.lost=0,0,0 N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,j.cycleGhost)function q.paint()N(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")N(a.bestT,(d.Best or 0)>0,"BEST: TOP "..tostring(d.Best),"BEST BUTTER: OFF")
N(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")N(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(Bo)task.spawn(function()pcall(q.tick)if Bo and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end P(a.ixT,function()local Bp=q.on()d.AutoIndex=not d.AutoIndex q.discAt=-100 q.changed(Bp)end)
P(a.bestT,function()local Bq=q.on()d.Best=((d.Best or 0)+1)%4 q.changed(Bq)end)P(a.bcT,function()local Br=q.on()
d.BestCrate=not d.BestCrate q.changed(Br)end)P(a.shT,function()d.Shower=not d.Shower q.paint()end)P(a.crateB,function()
e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(aq,"opening crate...",fH,true)end)P(a.padB,function()
c.plot=bn()or c.plot local s_,lP=au(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(s_ and lP and lP:IsA("BasePart"))then z("SET PAD: need character and plot")return end
c.manualPad=lP.CFrame:ToObjectSpace(s_.HumanoidRootPart.CFrame)yQ(c.manualPad)z("collect pad saved at your position")
end)P(a.startB,function()en(not c.running)end)P(a.buyB,function()c.plot=bn()or c.plot task.spawn(aq,"buying (manual)...",nJ,true)
end)P(a.plB,function()c.plot=bn()or c.plot task.spawn(aq,"waxing (manual)...",nO)end)P(a.tabFarm,function()bJ("farm")end)
P(a.tabBut,function()bJ("but")end)P(a.tabSet,function()bJ("set")end)P(a.tabCrt,function()bJ("crt")end)P(a.tabPet,function()bJ("pet")end)
P(a.tabTeam,function()bJ("team")end)local function Bs(lQ)c.hidden=lQ a.root.Visible=not lQ a.tgBtn.Text=lQ and"SAB+"or"SAB"
end sl(a.tgBtn,a.tgRoot,function()bI(a.tgRoot)c.togPos=gX(a.tgRoot)or c.togPos end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then Bs(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aH,av={},0 local function bL()aH=m6()if#aH==0 then a.cfgPick.Text="(none saved)"
av=0 return end if av<1 or av>#aH then av=1 end a.cfgPick.Text=aH[av]..("  (%d/%d)"):format(av,#aH)end local function ta()
local tb=c.autoload~=nil a.cfgAuto.Text=tb and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=tb and o.accent or o.panel2
end local function lR()local tc=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if tc~=""then return tc end return(av>0 and aH[av])or""
end P(a.cfgSave,function()c.winPos=gX(a.root)or c.winPos c.togPos=gX(a.tgRoot)or c.togPos local td,te=fm(lR())
a.cfgMsg.Text=td and("saved as "..te)or("could not save: "..te)a.cfgMsg.TextColor3=td and o.good or o.bad bL()
z(a.cfgMsg.Text)end)local function Bt(lS)local lT,tf=ne(lS)a.cfgMsg.Text=lT and("loaded "..tf)or("could not load: "..tf)
a.cfgMsg.TextColor3=lT and o.good or o.bad if lT then a.cfgName.Text=lS Bk()task.spawn(C.apply,"config "..lS)
end z(a.cfgMsg.Text)end P(a.cfgLoad,function()Bt(lR())end)P(a.cfgPick,function()bL()if av>0 then a.cfgName.Text=aH[av]end
end)P(a.cfgPrev,function()if#aH==0 then bL()return end av=(av-2)%#aH+1 bL()a.cfgName.Text=aH[av]end)P(a.cfgNext,function()
if#aH==0 then bL()return end av=av%#aH+1 bL()a.cfgName.Text=aH[av]end)P(a.cfgAuto,function()if c.autoload then
ng(nil)a.cfgMsg.Text="it will not load a config on launch"else local eK=lR()local th=false for Eh,Bu in ipairs(m6())do if Bu==eK then th=true end end
local Bv=th or fm(eK)if Bv and eK~=""then ng(eK)bL()a.cfgMsg.Text=eK.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=o.dim ta()end)P(a.autoB,function()
local ti,tj=vc()a.autoMsg.Text=ti and("installed. "..tj)or("failed: "..tj)a.autoMsg.TextColor3=ti and o.good or o.bad
z(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()dn("you asked")end)
local bM=false P(a.minB,function()bM=not bM a.tabs.Visible=not bM if bM then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bJ(sM)end a.root.Size=UDim2 .new(0,ak.w,0,bM and(ak.head+ak.strip)or ak.h)
a.minB.Text=bM and"+"or"-"end)local function ho()if not c.alive then return end c.alive,c.running=false,false
pcall(j.restoreAll)pcall(eX)for Ei,Bw in ipairs(hy)do pcall(function()Bw:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()k8:Destroy()end)pcall(function()sv:Destroy()end)if cm.SAB_KILL==ho then cm.SAB_KILL=nil end end
cm.SAB_KILL=ho P(a.killB,ho)P(a.xB,ho)sl(a.title,a.root,function()bI(a.root)c.winPos=gX(a.root)or c.winPos end)
local function tk()local eL,ck=c.reason,c.level if c.busy then eL,ck=c.busyText,"ok"elseif not c.running then
local Ej,tl,Bx=ry()if c.capHit then eL,ck=tl,"bad"else eL,ck="[stopped] "..tl,(Bx=="bad")and"bad"or"idle"end c.reason,c.level=eL,ck
end local hp=c.running and o.good or(c.capHit and o.bad or o.dim)if a.lit.dot~=hp then a.lit.dot=hp a.dot.BackgroundColor3,a.tgDot.BackgroundColor3=hp,hp end
if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and o.panel2 or o.accent end if c.hidden then return end
a.put(a.reason,eL)if a.lit.bar~=ck then a.lit.bar=ck a.bar.BackgroundColor3=zZ[ck]or o.dim end if bM then return end
if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and o.warn or o.good
end N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")local bN=uN()if a.farm.Visible then
local By,Bz=eU()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,By.."/"..Bz)local tm=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local tn=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aJ(a6()),c.rolls,c.gifts,c.crates,tn and ah(aa(tn))or"nothing",e.on and("   ["..e.title.." window open]")or"",
tm and("in "..tm.."s")or"off"))a.put(a.tgt,(#bN==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bN<=3)and table.concat(bN,", ")or(#bN.." butters ticked"))))
if a.lit.tgt~=(#bN==0)then a.lit.tgt=(#bN==0)a.tgt.TextColor3=(#bN==0)and o.bad or o.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(eO,"\n")end
end if a.set.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bN))
end if a.but.Visible and bl.at~=ad.at then eE(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then l.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak)
end if a.team.Visible then y.paint()end if a.farm.Visible then a.put(a.helpL,"help: "..((d.Help or d.HelpGuild)and D.msg or"off"))
a.put(a.campL,"camp: "..(d.Campfire and J.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests: "..(d.Quests and(E.msg~=""and E.msg or"checking...")or"off"))a.put(a.ixL,q.msg)N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local to=(C.rec.on and"on"or"")..(C.rec.off and((C.rec.on and"/"or"").."off")or"")
a.put(a.arL,C.msg~=""and C.msg or("auto roll: game %s | learned %s%s"):format(C.isOn()and"ON"or"off",to~=""and to or"nothing yet",#C.rec.rules>0 and", choices"or""))
if a.lit.arL~=(C.msg~="")then a.lit.arL=(C.msg~="")a.arL.TextColor3=C.msg~=""and o.warn or o.dim end end end cm.SAB={S=c,CFG=d,EV=W,U=a,sg=k8,CAT=ad,LEARN=ag,buildList=eE,
logAll=c7,evAll=c8,AR=C,CR=L,PF=j,PX=l,TM=y,CRATE=e,FU=A,HX=D,CF=J,QX=E,IX=q,SH=Q}z(cl.." loaded")if c.uiErrs>0 then z("UI: "..c.uiErrs.." properties skipped")end
bJ("farm")bI(a.root)bI(a.tgRoot)if gU then pcall(function()V(gU:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bI(a.root)bI(a.tgRoot)end))end)end bL()ta()if c.config and c.config~=""then a.cfgName.Text=c.config end
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(tk)task.spawn(function()local tp=va()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(tp and("\n(backup: "..tp..")")or"")
local tq=fg(al.exec)if tq and not tq:find("SAB autoloader v2",1,true)then dj(al.exec,al.stub)z("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fg(al.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(vi)end)task.spawn(function()while c.alive do local BA,BB=pcall(tk)if not BA then z("UI ERR "..tostring(BB))end
task.wait((c.hidden or bM)and 1.5 or 0.4)end end)task.spawn(function()local BC,BD=pcall(vq)if not BC then z("HOOK ERR "..tostring(BD))end
end)task.spawn(function()pcall(t9)if e.loadSeq and not e.learned then local hq={}for tr=1,20 do if e.loadSeq[tr]then hq[#hq+1]=e.loadSeq[tr]end end
if#hq>0 then e.learned={seq=hq,mode=e.loadMode}z("remembered how to open crates directly")end end if h7()then z(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local BE,ts=pcall(yS)if BE and ts and c.alive and not c.manualPad then c.manualPad=ts end end)task.spawn(function()
while c.alive do local lU,lV=pcall(l.buyTick)if not lU then z("PET ERR "..tostring(lV))task.wait(5)end lU,lV=pcall(l.wishTick)
if not lU then z("WISH ERR "..tostring(lV))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local hr,tt=0,x()
V(game:GetService("RunService").Heartbeat:Connect(function()hr=hr+1 end))V(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=x()while c.alive do task.wait(1)local tu=x()j.fps,hr,tt=hr/math.max(tu-tt,0.001),0,tu local BF,BG=pcall(j.tick)
if not BF then z("PERF ERR "..tostring(BG))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local BH,BI=pcall(A.tick)if not BH then z("FUSE ERR "..tostring(BI))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local BJ,BK=pcall(y.tick)if not BJ then z("TEAM ERR "..tostring(BK))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local hs=aj:WaitForChild("Remotes",30)local tv=hs and hs:WaitForChild("ClanEvent",30)
if tv and c.alive then V(tv.OnClientEvent:Connect(function(BL,BM)if BL=="call"then pcall(D.onCall,BM)end end))
end local tw=hs and hs:FindFirstChild("RollConfirmAsk")if tw and c.alive then V(tw.OnClientEvent:Connect(function(BN)E.asked=BN or"butter"end))end
end)task.spawn(function()local lW=aj:WaitForChild("Remotes",30)if not(lW and c.alive)then return end local function ht(BO,BP)
local lX=lW:FindFirstChild(BO)if lX and lX:IsA("RemoteEvent")then V(lX.OnClientEvent:Connect(function(...)pcall(BP,...)end))end
end ht("NewSquishyDiscovered",function(lY,tx)if type(lY)~="string"then return end q.disc=q.disc or{}q.disc[aa(lY)]=true
z(("INDEX: %s%s is in your Index now"):format(ah(aa(lY)),tx and(" ("..tostring(tx)..")")or""))end)ht("IndexRefresh",q.loadDisc)
ht("IndexRowComplete",function(BQ)z("INDEX: the whole "..tostring(BQ).." row is complete")end)ht("AdminShow",q.admin)
local ty=lW:FindFirstChild("AdminShowSync")if ty then local BR,tz=pcall(function()return ty:InvokeServer()end)
if BR and type(tz)=="table"then for Ek,BS in pairs(tz)do pcall(Q.add,BS)end end end while c.alive do local BT,BU=pcall(q.tick)
if not BT then q.msg="index error: "..tostring(BU)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local BV,BW=pcall(E.tick)if not BV then z("QUEST ERR "..tostring(BW))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(eX)end end)pcall(C.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local BY=(type(newcclosure)=="function")and newcclosure or function(BX)return BX end local lZ
local tA=(type(setnamecallmethod)=="function")and setnamecallmethod or nil lZ=hookmetamethod(game,"__namecall",BY(function(tB,...)
local eM=getnamecallmethod()if c.alive and(eM=="InvokeServer"or eM=="FireServer")then local tC,tD=pcall(function()return tB.Name end)
if tC and tD=="CrateAction"and not e.replaying then pcall(e.saw,eM,...)elseif tC and tD=="AutoRollAction"and not C.replaying then pcall(C.saw,eM,...)end
if tA then tA(eM)end end return lZ(tB,...)end))e.oldNC=lZ end)end if hw then V(F.Idled:Connect(function()pcall(function()hw:CaptureController()hw:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for El=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and au()and(c.plot or bn())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then C.apply("joined")end while c.alive do task.wait(30)local hu=bS()
if hu and q.on()and not aI(hu.name)then hu=nil end if c.alive and d.AutoRoll and c.running and not C.isOn()and not hu and not ac()
and not e.waiting and not e.on and not c.busy then C.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Em=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bn()if au()and c.plot and q.any()then en(true,true)z("started by itself")
return end task.wait(1)end if c.alive and not c.running then z("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bn()c.lastCollect=x()while c.alive do if c.running then local BZ,tE=pcall(zU)if not BZ and tE~=hx then z("LOOP ERR "..tostring(tE))end
end task.wait(0.1)end end)hv("loaded - window is at the top left")end local B1,l0=xpcall(tI,function(B0)return tostring(B0).."\n"..debug.traceback()end)
if not B1 then pcall(function()warn("SAB "..cl.." ERROR: "..tostring(l0))end)hv("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cl.." ERROR: "..tostring(l0))end)pcall(function()local tF=(type(getgenv)=="function"and getgenv())or _G
if type(tF.SAB_KILL)=="function"then tF.SAB_KILL()end for En,B2 in ipairs({"SABFarmGui","SABToggle"})do local tG=F.PlayerGui:FindFirstChild(B2)
if tG then tG:Destroy()end end end)pcall(function()local eN=Instance.new("ScreenGui")eN.Name="SABError"eN.ResetOnSpawn=false
eN.DisplayOrder=1000 local aW=Instance.new("TextBox")aW.Size=UDim2 .new(0,340,0,170)aW.Position=UDim2 .new(0,10,0,50)
aW.BackgroundColor3=Color3 .fromRGB(90,20,20)aW.TextColor3=Color3 .new(1,1,1)aW.TextSize=11 aW.TextWrapped=true
aW.ClearTextOnFocus=false aW.TextXAlignment=Enum.TextXAlignment.Left aW.TextYAlignment=Enum.TextYAlignment.Top
aW.Text="SAB "..cl.." failed to start. Send this text:\n"..tostring(l0)aW.Parent=eN eN.Parent=F:WaitForChild("PlayerGui")
end)end
