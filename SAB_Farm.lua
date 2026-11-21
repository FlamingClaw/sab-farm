local cl="v26"local l0=game:GetService("Players")local F=l0 .LocalPlayer or l0 .PlayerAdded:Wait()local function hu(tG)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..cl,Text=tG,Duration=6})
end)end hu("script started")local function tH()local aj=game:GetService("ReplicatedStorage")local as=game:GetService("Workspace")
local l1=game:GetService("UserInputService")local cm=(type(getgenv)=="function"and getgenv())or _G if type(cm.SAB_KILL)=="function"then pcall(cm.SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local hv=(function()local tI,tJ=pcall(function()return game:GetService("VirtualUser")end)return tI and tJ or nil end)()
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
local l,y,j,A,D,J,E={},{},{},{},{},{},{}local q,Q={},{}local hw={}local hx,eO,c7,c8={},{},{},{}local function V(l2)hx[#hx+1]=l2 return l2 end
local function af(tK)task.wait(tK)if not c.alive then error(hw,0)end end local function z(eP)eP=os.date("%H:%M:%S").." "..tostring(eP)
table.insert(eO,1,eP)if#eO>6 then table.remove(eO)end c.logN=(c.logN or 0)+1 c7[#c7+1]=eP if#c7>80 then table.remove(c7,1)end
end local function eQ(l3)if type(l3)~="string"then return""end return(l3:lower():gsub("[^%w]",""))end local function aa(tL)
local l4=eQ(tL)local hy=l4:gsub("butter$","")if hy==""then hy=l4 end return hy end local function aI(l5)if type(l5)~="string"then return false end
local hz=aa(l5)if hz==""then return false end if q.want then return q.want(hz)end return d.Targets[hz]==true end
local function tM(c9)c9=c9:lower()return c9:find("squishy",1,true)~=nil or c9:match("butter$")~=nil or c9:match("butter[^%a]")~=nil
end local hA={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aJ(c_)if type(c_)~="number"then return"?"end
local eR=1 while math.abs(c_)>=1000 and eR<#hA do c_=c_/1000 eR=eR+1 end local tN=string.format("%.2f",c_):gsub("%.?0+$","")
return tN..hA[eR]end local function tO(l6)if type(l6)~="string"then return nil end local tP,l7=l6:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local hB=tonumber(tP)if not hB then return nil end if l7==""then return hB end for tQ,tR in ipairs(hA)do if tR:lower()==l7:lower()then return hB*1000^(tQ-1)end end
return nil end local function a6()local l8=F:GetAttribute("BoardValueMoney")if type(l8)=="number"then return l8 end
local l9=F:FindFirstChild("leaderstats")if l9 then for B2,tS in ipairs({"Cash","Money","Coins"})do local hC=l9:FindFirstChild(tS)
if hC and type(hC.Value)=="number"then return hC.Value end end end end local function eS(tT)local hD=tT:GetFullName()
if c.plot then local hE=c.plot:GetFullName()if hD:sub(1,#hE)==hE then return hD:sub(#hE+2)end end return hD end
local function au()local eT=F.Character if eT and eT:FindFirstChild("HumanoidRootPart")then local l_=eT:FindFirstChildOfClass("Humanoid")
if l_ and l_.Health>0 then return eT end end end local function bn()local hF=as:FindFirstChild("Plots")if not hF then return nil end
local function ma(tU)local mb=tU:FindFirstChild("Plate")return mb~=nil and mb:FindFirstChild("EditStackAttachment",true)~=nil
end local mc=F:GetAttribute("PlotNumber")if mc~=nil then local hG=hF:FindFirstChild(tostring(mc))if hG and ma(hG)then return hG end
end for B3,md in ipairs(hF:GetChildren())do if ma(md)then return md end end end local function da(me)local bo=me and me.Parent
for B4=1,6 do if not bo then return nil end if bo:IsA("BasePart")then return bo end if bo:IsA("Model")then return bo.PrimaryPart or bo:FindFirstChildWhichIsA("BasePart",true)end
bo=bo.Parent end end local function mf(mg)local hH=mg.Parent if hH and hH:IsA("Attachment")then return hH.WorldPosition end
local mh=da(mg)return mh and mh.Position end local function mi()local cn=c.plot and c.plot:FindFirstChild("Plate")
if not cn then return nil end if cn:IsA("BasePart")then return cn.Position end if cn:IsA("Model")then return cn:GetPivot().Position end
local mj=cn:FindFirstChildWhichIsA("BasePart",true)return mj and mj.Position end local function mk()local hI={}
local ml=c.plot and c.plot:FindFirstChild("WaxStations")if ml then for B5,tV in ipairs(ml:GetChildren())do local mm=tV:FindFirstChild("SquishyPlaceHolder")
local hJ=mm and mm:FindFirstChild("PlacePrompt")if hJ and hJ:IsA("ProximityPrompt")then hI[#hI+1]=hJ end end end
return hI end local function eU()local mn,hK=mk(),0 for B6,tW in ipairs(mn)do if tW.Enabled then hK=hK+1 end end
local hL=#mn local hM=F:GetAttribute("WaxStations")if type(hM)=="number"and hM>hL then hL=hM end return hK,hL
end local function tX()local mo=au()local mp=mo and mo.HumanoidRootPart.Position local hN,mq for B7,hO in ipairs(mk())do
if hO.Enabled then local mr=mf(hO)local ms=(mr and mp)and(mr-mp).Magnitude or 1e9 if not hN or ms<mq then hN,mq=hO,ms end
end end return hN end local function mt()local eV=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not eV then return nil end local mu=eV:FindFirstChild("BuyPromptAttachment")local eW=(mu and mu:FindFirstChild("BuyPrompt"))or eV:FindFirstChild("BuyPrompt",true)
if eW and eW:IsA("ProximityPrompt")and eW:IsDescendantOf(eV)then return eW end end local mv={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local tY={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ag={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local hP="SAB_order.txt"local function eX()if not ag.dirty or type(writefile)~="function"then return end local aA={}
for tZ,t0 in pairs(ag.price)do aA[#aA+1]="P|"..tZ.."|"..string.format("%.0f",t0)end for t1,t2 in pairs(ag.order)do aA[#aA+1]="O|"..t1 .."|"..table.concat(t2,",")end
if e.learned and e.enc then aA[#aA+1]="M|mode|"..tostring(e.learned.mode or"")for t3,eY in ipairs(e.learned.seq)do
local mw={}for mx=1,eY.n do mw[mx]=e.enc(eY.args[mx])end aA[#aA+1]=("A|%d|%s|%d|%s"):format(t3,eY.m,eY.n,table.concat(mw,";"))
end end local function hQ(t4,t5,eZ)local my={}for mz=1,eZ.n do my[mz]=e.enc(eZ.args[mz])end aA[#aA+1]=("R|%d|%s|%s|%d|%s"):format(t5,t4,eZ.m,eZ.n,table.concat(my,";"))
end if e.enc then for t6,t7 in ipairs(C.rec.rules)do hQ("rules",t6,t7)end if C.rec.on then hQ("on",0,C.rec.on)end
if C.rec.off then hQ("off",0,C.rec.off)end end for B8,db in pairs(L.seen)do aA[#aA+1]=("K|%s|%s|%s|%s"):format(db.name,db.title or"",db.rar or"",db.price and string.format("%.0f",db.price)or"")
end if pcall(writefile,hP,table.concat(aA,"\n"))then ag.dirty=false end end local function t8()if type(isfile)~="function"or type(readfile)~="function"then return end
local t9,t_=pcall(isfile,hP)if not(t9 and t_)then return end local ua,mA=pcall(readfile,hP)if not(ua and type(mA)=="string")then return end
for ub in mA:gmatch("[^\n]+")do local co,cp,a7=ub:match("^(%a)|([^|]+)|(.*)$")if co=="P"then ag.price[cp]=tonumber(a7)
elseif co=="M"then e.loadMode=(a7~=""and a7~="nil")and a7 or nil elseif co=="A"and e.dec then local mB=tonumber(cp)
local mC,e0,uc=a7:match("^([^|]+)|(%d+)|(.*)$")if mB and mC then e0=tonumber(e0)local mD,e1={},0 for ud in(uc..";"):gmatch("([^;]*);")do
e1=e1+1 if e1<=e0 then mD[e1]=e.dec(ud)end end e.loadSeq=e.loadSeq or{}e.loadSeq[mB]={m=mC,n=e0,args=mD}end elseif co=="R"and e.dec then
local mE=tonumber(cp)local e2,ue,e3,uf=a7:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if mE and e2 then e3=tonumber(e3)
local mF,e4={},0 for ug in(uf..";"):gmatch("([^;]*);")do e4=e4+1 if e4<=e3 then mF[e4]=e.dec(ug)end end local hR={m=ue,n=e3,args=mF}
if e2=="rules"then C.rec.rules[mE]=hR elseif e2=="on"then C.rec.on=hR elseif e2=="off"then C.rec.off=hR end end
elseif co=="K"then local mG,mH,uh=a7:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cp)]={name=cp,title=mG~=""and mG or nil,
rar=mH~=""and mH or nil,price=tonumber(uh)}elseif co=="O"and a7~=""then local e5={}for ui in a7:gmatch("[^,]+")do e5[#e5+1]=ui end
if#e5>0 then ag.order[cp]=e5 end end end end local function uj(e6)if type(e6)~="table"then return end local bO,mI=e6 .rarity,e6 .contents
if type(bO)~="string"or bO==""or type(mI)~="table"then return end local dc={}for B9,e7 in ipairs(mI)do if type(e7)=="table"and type(e7 .butter)=="string"then
dc[#dc+1]={n=e7 .butter,ch=tonumber(e7 .chance)or 0}end end if#dc==0 then return end table.sort(dc,function(uk,ul)return uk.ch>ul.ch end)
local dd,de={},false for um,uo in ipairs(dc)do dd[um]=uo.n end local hS=ag.order[bO]if not hS or#hS~=#dd then de=true end
if not de then for mJ=1,#dd do if hS[mJ]~=dd[mJ]then de=true break end end end ag.order[bO]=dd local hT=tonumber(e6 .price)
if hT and ag.price[bO]~=hT then ag.price[bO]=hT de=true end if de then ag.dirty=true ad.at=0 z("learned the "..bO.." order from its crate")
end end local function cq(up,uq)local ur=up:FindFirstChild(uq,true)local us,hU=pcall(function()return ur.Text end)
return(us and type(hU)=="string"and hU~="")and hU or nil end local function ah(mK)return ad.pretty[mK]or mK end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(ut)return eQ(ut or"")end
function L.learn(a8)if type(a8)~="table"or type(a8 .name)~="string"then return end local hV=L.key(a8 .name)local a9=L.seen[hV]or{}
local uu=(L.seen[hV]==nil)or(tonumber(a8 .price)and a9 .price~=tonumber(a8 .price))a9 .name,a9 .title=a8 .name,a8 .title or a9 .title
a9 .rar,a9 .price=a8 .rarity or a9 .rar,tonumber(a8 .price)or a9 .price L.seen[hV]=a9 if uu then L.at,ag.dirty=x(),true end
end function L.wanted(mL)if mL==nil then return false end local hW=L.key(mL)return d.CrateTicks[hW]==true or(d.BestCrate and q.bestCrate~=nil and(hW==q.bestCrate or hW==q.bestCrateTitle))
end function L.list()local cr={}for uv,e8 in ipairs(L.base)do cr[L.key(e8[1])]={name=e8[1],title=e8[2],rar=e8[3],i=uv}end
for B_,df in ipairs(ad.rarOrder)do local mM=false for Ca,uw in pairs(cr)do if uw.rar==df then mM=true break end end
if not mM and df~="?"then local mN=df:gsub("[^%w]","").."Crate"cr[L.key(mN)]={name=mN,title=df.." Crate",rar=df,i=50,guess=true}
end end for mO,e9 in pairs(L.seen)do local aX=cr[mO]or{i=100}aX.name,aX.title,aX.rar=e9 .name or aX.name,e9 .title or aX.title,e9 .rar or aX.rar
aX.price,aX.guess=e9 .price or aX.price,nil cr[mO]=aX end local dg,e_={},{}for ux,uy in ipairs(mv)do dg[uy]=ux end
for uz,mP in ipairs(ad.rarOrder)do dg[mP]=dg[mP]or(20+uz)end for uA,dh in pairs(cr)do dh.k=uA dh.price=dh.price or ag.price[dh.rar or""]
e_[#e_+1]=dh end table.sort(e_,function(bP,bQ)if bP.price and bQ.price and bP.price~=bQ.price then return bP.price<bQ.price end
local mQ,mR=dg[bP.rar or""]or 99,dg[bQ.rar or""]or 99 if mQ~=mR then return mQ<mR end if(bP.i or 100)~=(bQ.i or 100)then return(bP.i or 100)<(bQ.i or 100)end
return bP.k<bQ.k end)return e_ end local function uB()local mS=aj:FindFirstChild("Assets")local mT=mS and mS:FindFirstChild("Squishies")
if not mT then return false end local hX,mU,cs={},{},{}local fa=0 for Cb,fb in ipairs(mT:GetChildren())do local di=aa(fb.Name)
if di~=""and not hX[di]then local fc=cq(fb,"RarityText")or"?"hX[di]=fc mU[di]=cq(fb,"NameText")or fb.Name cs[fc]=cs[fc]or{}
table.insert(cs[fc],di)fa=fa+1 end end if fa==0 then return false end for mV,uC in pairs(cs)do local mW=ag.order[mV]or tY[mV]
local hY={}if mW then for uD,uE in ipairs(mW)do hY[aa(uE)]=uD end end table.sort(uC,function(mX,mY)local hZ,h0=hY[mX],hY[mY]
if hZ and h0 then return hZ<h0 end if hZ then return true end if h0 then return false end return ah(mX)<ah(mY)
end)end local h1={}for uF,uG in ipairs(mv)do h1[uG]=uF end local fd,bR={},{}for uH in pairs(cs)do fd[#fd+1]=uH end
pcall(function()for uI,uJ in ipairs(require(aj.Modules.SquishyRNG).Keys)do bR[uJ]=uI end end)table.sort(fd,function(ct,cu)
if bR[ct]and bR[cu]and bR[ct]~=bR[cu]then return bR[ct]<bR[cu]end local h2,h3=ag.price[ct],ag.price[cu]if h2 and h3 and h2~=h3 then return h2<h3 end
local h4,h5=h1[ct],h1[cu]if h4 and h5 then return h4<h5 end if h4 then return true end if h5 then return false end
return ct<cu end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=hX,mU,cs,fd,fa,x()return true end local function h6()
if ad.at==0 or(x()-ad.at)>120 then pcall(uB)end return ad.n>0 end local function uK(uL)local mZ=aa(uL)return ad.rar[mZ]or(W.name and aa(W.name)==mZ and W.rar)or"?"
end local function uM()local fe={}local uN=((d.Best or 0)>0 and next(q.best or{}))and q.best or d.Targets for uO,uP in pairs(uN)do if uP then fe[#fe+1]=ah(uO)end end
table.sort(fe)return fe end local al={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function m0()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function ff(m1)if type(makefolder)~="function"then return end local uQ,uR=pcall(isfolder,m1)if not(uQ and uR)then pcall(makefolder,m1)end
end local function fg(m2)if type(isfile)~="function"or type(readfile)~="function"then return nil end local uS,uT=pcall(isfile,m2)
if not(uS and uT)then return nil end local uU,uV=pcall(readfile,m2)return uU and uV or nil end local function dj(uW,uX)
if type(writefile)~="function"then return false end return(pcall(writefile,uW,uX))end local function m3(uY)local dk={}
if type(listfiles)~="function"then return dk end local uZ,m4=pcall(listfiles,uY)if not uZ or type(m4)~="table"then return dk end
for Cc,u0 in ipairs(m4)do dk[#dk+1]=tostring(u0)end return dk end local function m5()local fh={}for Cd,u1 in ipairs(m3(al.cfg))do
local m6=u1:match("([^/\\]+)%.txt$")if m6 then fh[#fh+1]=m6 end end table.sort(fh)return fh end local function u2()
local ab={"V|1"}ab[#ab+1]="N|Every|"..tostring(d.Every)ab[#ab+1]="N|GlazeLead|"..tostring(d.GlazeLead)ab[#ab+1]="N|FpsCap|"..tostring(d.FpsCap)
ab[#ab+1]="N|MemLimit|"..tostring(d.MemLimit)ab[#ab+1]="N|Best|"..tostring(d.Best or 0)for Ce,m7 in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do ab[#ab+1]="S|"..m7 .."|"..d[m7]end
do local fi={}for u3,dl in pairs(d.Pets)do local m8=(dl.b and"b"or"")..(dl.g and"g"or"")..(dl.w and"w"or"")..((tonumber(dl.f)or 0)>0 and tostring(dl.f)or"")
if m8~=""then fi[#fi+1]=u3 .."|"..m8 end end table.sort(fi)ab[#ab+1]="P|-"for Cf,u4 in ipairs(fi)do ab[#ab+1]="P|"..u4 end
end for Cg,m9 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower"})do
ab[#ab+1]="B|"..m9 .."|"..(d[m9]and"1"or"0")end local h7=F:GetAttribute("AutoRollRules")if type(h7)=="string"and h7~=""then d.ARrules,d.ARstop=h7,tostring(F:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then ab[#ab+1]="S|rules|"..d.ARrules ab[#ab+1]="S|stop|"..d.ARstop end if c.winPos then ab[#ab+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then ab[#ab+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Ch,h8 in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local fj={}for u5,u6 in pairs(h8[2])do if u6 then fj[#fj+1]=u5 end end table.sort(fj)ab[#ab+1]=h8[1].."|-"for Ci,u7 in ipairs(fj)do ab[#ab+1]=h8[1].."|"..u7 end
end return table.concat(ab,"\n")end local function u8(h9)if type(h9)~="string"or h9==""then return false end local m_,na,nb,nc,dm={},false,{},false,nil
for u9 in h9:gmatch("[^\n]+")do local aB,ae,aw=u9:match("^(%a)|([^|]*)|?(.*)$")if aB=="N"and ae=="Every"then local h_=tonumber(aw)
if h_ and h_>=1 then d.Every=math.floor(h_)end elseif aB=="N"and(ae=="FpsCap"or ae=="MemLimit")then local ia=tonumber(aw)
if ia and ia>=0 then d[ae]=math.floor(ia)end elseif aB=="N"and ae=="Best"then local fk=tonumber(aw)if fk and fk>=0 and fk<=3 then d.Best=math.floor(fk)end
elseif aB=="N"and ae=="GlazeLead"then local fl=tonumber(aw)if fl and fl>=5 and fl<=600 then d.GlazeLead=math.floor(fl)end
elseif aB=="S"and(ae=="TeamNormal"or ae=="TeamFull"or ae=="TeamGlaze"or ae=="TeamWax")then d[ae]=aw elseif aB=="P"and ae~=""then
if not dm then dm={}end if ae~="-"and aw~=""then dm[ae]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aB=="B"then if d[ae]~=nil then d[ae]=(aw=="1")end
elseif aB=="S"and ae=="rules"then d.ARrules=aw elseif aB=="S"and ae=="stop"then d.ARstop=aw elseif aB=="W"then
c.winPos={tonumber(ae)or 10,tonumber(aw)or 44}elseif aB=="G"then c.togPos={tonumber(ae)or 10,tonumber(aw)or 300}
elseif aB=="T"and ae~=""then if ae~="-"then m_[ae]=true end na=true elseif aB=="K"and ae~=""then if ae~="-"then nb[ae]=true end
nc=true end end if na then d.Targets=m_ end if nc then d.CrateTicks=nb end if dm then d.Pets=dm end return true
end local function fm(cv)if not m0()then return false,"this executor cannot write files"end cv=(cv or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cv==""then return false,"give the config a name"end ff(al.dir)ff(al.cfg)if not dj(al.cfg.."/"..cv..".txt",u2())then return false,"could not write the file"end
c.config=cv return true,cv end local function nd(fn)local ne=fg(al.cfg.."/"..fn..".txt")if not ne then return false,"no config called "..tostring(fn)end
if not u8(ne)then return false,"that config looks empty"end c.config=fn return true,fn end local function nf(ib)
if ib then ff(al.dir)dj(al.auto,ib)elseif type(delfile)=="function"then pcall(delfile,al.auto)else dj(al.auto,"")
end c.autoload=ib end local function u_()if c.selfPath then return c.selfPath end local fo for Cj,va in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",al.dir})do
for Ck,ng in ipairs(m3(va))do local ic=ng:lower()if ic:sub(-4)==".lua"and(ic:find("sab_farm",1,true)or ic:find("sab farm",1,true))then
fo=fo or ng end end end c.selfPath=fo return fo end al.stub=[[
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
local function vb()if not m0()then return false,"this executor cannot write files"end ff("autoexec")if not dj(al.exec,al.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local fp=(function()local vc,vd=pcall(function()return game:GetService("TeleportService")end)return vc and vd or nil end)()
local function nh()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local ve=queueonteleport or queue_on_teleport return(pcall(ve,al.stub))end local function dn(vf)if c.rejoining then return end
c.rejoining=true z("REJOIN ("..vf..")")pcall(eX)if c.autoload then pcall(fm,c.autoload)end local vg=nh()z(vg and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Cl=1,30 do if not fp then break end pcall(function()fp:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function vh()local vi,ni=pcall(function()return game:GetService("GuiService")end)if vi and ni then
pcall(function()V(ni.ErrorMessageChanged:Connect(function()if d.Rejoin then dn("roblox error message")end end))
end)end pcall(function()local nj=game:GetService("CoreGui")local nk=nj and nj:WaitForChild("RobloxPromptGui",15)
local nl=nk and nk:WaitForChild("promptOverlay",15)if nl then V(nl.ChildAdded:Connect(function(vj)if d.Rejoin and tostring(vj.Name):lower():find("errorprompt",1,true)then dn("disconnect prompt")end
end))end end)if fp then pcall(function()V(fp.TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()dn("teleport retry")end)end
end))end)end end local function nm(vk)local nn=c.plot and c.plot:FindFirstChild(vk)if not nn then return nil,false end
for Cm,ie in ipairs(nn:GetChildren())do if ie:IsA("Model")or ie:IsA("BasePart")then return ie,true end end return nil,true
end local function bS()local bp=nm("RolledSquishy")if not bp then return nil end return{model=bp,name=bp.Name,pretty=cq(bp,"NameText")or ah(aa(bp.Name)),
rar=cq(bp,"RarityText")or uK(bp.Name),price=cq(bp,"PriceText")}end local function no(ig)return type(ig)=="string"and(ad.rar[aa(ig)]~=nil or tM(ig))
end local function ac()local ih=nm("SquishyEquipped")if ih then c.carrySrc,e.heldAt="model",x()return ih.Name,ih end
local np=F.Character if np then for Cn,dp in ipairs(np:GetDescendants())do if(dp:IsA("Model")or dp:IsA("Tool"))and no(dp.Name)then
c.carrySrc,e.heldAt="character",x()return dp.Name,dp end end end local fq=F:GetAttribute("SquishyEquipped")if type(fq)=="string"and fq~=""and no(fq)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return fq,nil end c.carrySrc=nil end local function Co()local Cp,vl=ac()return vl end local function nq()
local nr=bS()local ii=nr and tO(nr.price)local ij=a6()if ii and ij and ij<ii*0.5 then return ij,ii end end local function bT(vm)
c8[#c8+1]=os.date("%H:%M:%S").." "..vm if#c8>40 then table.remove(c8,1)end end local function vn(bU,fr)if type(bU)~="string"then return end
bT(("Roll(%s,%s)"):format(bU,tostring(fr)))if bU:lower():find("crate",1,true)then e.rolled,e.rolledAt=bU,x()return
end W.seq=W.seq+1 W.name,W.at=bU,x()W.rar=type(fr)=="string"and fr or nil c.rolls=c.rolls+1 if aI(bU)then z(("ROLL %s [%s] = TARGET"):format(bU,tostring(fr)))end
end local function vo(bV)if type(bV)~="table"then return end local fs=bV.butter or bV.itemName if type(fs)~="string"then return end
c.gifts=c.gifts+1 W.gift,W.giftAt=fs,x()if type(bV.giftId)=="string"then local ns=aj:FindFirstChild("Remotes")
local nt=ns and ns:FindFirstChild("GiftThanks")if nt then pcall(function()nt:FireServer(bV.giftId)end)end end
bT("Gift("..fs.." from "..tostring(bV.fromName)..")")z(("GIFT from %s: %s - it will not be waxed"):format(tostring(bV.fromName),fs))
end local function vp()local nu=aj:WaitForChild("Remotes",30)if not c.alive then return end if not nu then z("Remotes folder missing - no roll events")return end
V(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local nv=F:GetAttribute("SquishyEquipped")
if type(nv)=="string"and nv~=""then e.heldAt=x()end end))local vv={SquishyRollAnimation=vn,InitSquishy=function(nw)W.init,W.initAt=tostring(nw),x()bT("Init("..tostring(nw)..")")end,
CrateUpdate=function(cw,nx)pcall(uj,cw)pcall(L.learn,cw)if type(cw)=="table"then local vq=nx==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not vq then return end local vr=not e.waiting local vs=e.on e.waiting,e.data,e.at=true,cw,x()e.on=(nx==true)
e.title=tostring(cw.title or cw.name or"crate")if e.on and not vs then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then bT("CrateWindow open("..e.title..")")elseif vr then bT("Crate waiting("..e.title..")")z(e.title.." is waiting on your stand")
end else if e.waiting then bT("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local vt=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,vt)end if e.classify then local vu=x()
task.spawn(function()pcall(e.classify,vu)end)end end end,GiftReceived=vo,}for ft,vw in pairs(vv)do local ik=nu:FindFirstChild(ft)
if ik and ik:IsA("RemoteEvent")then V(ik.OnClientEvent:Connect(vw))elseif ft~="CrateUpdate"and ft~="GiftReceived"then z("remote "..ft.." missing")end
end end local function il()local bW=bS()if bW then if aI(bW.name)then return{state="match",shown=bW.pretty,src="pad",info=bW}
end return{state="skip",info=bW,level="idle",text=("on pad: %s [%s] - not ticked"):format(bW.pretty,tostring(bW.rar))}
end if W.name and(x()-W.at)<4 then if aI(W.name)then return{state="match",shown=ah(aa(W.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ah(aa(W.name)),tostring(W.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fu(vx,vy,vz,vA)
local fv=RaycastParams.new()fv.FilterType=Enum.RaycastFilterType.Exclude local im={F.Character}for Cq,vB in ipairs(vA or{})do im[#im+1]=vB end
fv.FilterDescendantsInstances=im pcall(function()fv.RespectCanCollide=true end)local ny=as:Raycast(Vector3 .new(vx,vy+4,vz),Vector3 .new(0,-30,0),fv)
return ny and ny.Position or nil end local function cx(nz)local nA=nz:FindFirstChildOfClass("Humanoid")return((nA and nA.HipHeight)or 2)+nz.HumanoidRootPart.Size.Y/2+0.2
end local function io(vC,vD)local ip=vC:FindFirstChildOfClass("Humanoid")local vE=x()while x()-vE<vD do if ip and(ip.FloorMaterial~=Enum.Material.Air or ip.SeatPart)then return true end
af(0.05)end return false end local function aC(vF,iq,ir)local nB=vF.HumanoidRootPart nB.AssemblyLinearVelocity=Vector3 .new(0,0,0)
nB.CFrame=ir and CFrame.new(iq,Vector3 .new(ir.X,iq.Y,ir.Z))or CFrame.new(iq)end local function cy(a_,nC)local bX=au()
if not bX or not a_ then return false end local bq=a_.Position local fw=math.clamp(math.max(a_.Size.X,a_.Size.Z)/2+2.2,3,7)
local nD=(nC and nC.MaxActivationDistance)or 10 if fw>nD-2 then fw=math.max(2.5,nD-2)end local dq={}local function bY(dr)
dr=Vector3 .new(dr.X,0,dr.Z)if dr.Magnitude>0.05 then dq[#dq+1]=dr.Unit end end local nE=mi()if nE then bY(nE-bq)end
bY(a_.CFrame.LookVector)bY(-a_.CFrame.LookVector)bY(a_.CFrame.RightVector)bY(-a_.CFrame.RightVector)bY(bX.HumanoidRootPart.Position-bq)
if#dq==0 then bY(Vector3 .new(0,0,1))end local vG,fy=cx(bX),false for Cr,vH in ipairs(dq)do local fz=bq+vH*fw
local is=fu(fz.X,bq.Y,fz.Z,{a_})if is and math.abs(is.Y-bq.Y)<14 then aC(bX,Vector3 .new(fz.X,is.Y+vG,fz.Z),bq)
if io(bX,0.7)then fy=true break end end end if not fy then aC(bX,bq+dq[1]*fw+Vector3 .new(0,3,0),bq)fy=io(bX,1)
end af(0.12)return fy end local function nF(ds)if not ds.Parent or not ds.Enabled then return false end pcall(function()ds:InputHoldBegin()end)
af(math.max(ds.HoldDuration,0)+0.08)pcall(function()ds:InputHoldEnd()end)return true end local function ao(nG,vI)
local vJ=x()while x()-vJ<vI do if nG()then return true end af(0.05)end return nG()end local function dt(cz,vK,nH,vL)
local vM=c.zapFirst and{"zap","hold"}or{"hold","zap"}for vN,it in ipairs(vM)do if vN==2 and(vL or not(cz.Parent and cz.Enabled and(not nH or nH())))then break end
local iu if it=="hold"then iu=nF(cz)else iu=type(fireproximityprompt)=="function"and cz.Parent~=nil and cz.Enabled and pcall(fireproximityprompt,cz)end
if iu and ao(vK,1.2)then c.zapFirst=(it=="zap")return true,it end end return false end local function nI(iv)local br=mt()
if not br or not br.Enabled then z("buy: nothing on the pad")return false end local nJ=da(br)if not nJ then z("buy: pad part missing")return false end
c.lastBuyAt=x()local vO,nK=W.seq,a6()cy(nJ,br)if not br.Enabled then z("buy aborted: pad emptied")return false end
local cA=il()if not iv and cA.state~="match"then z("buy aborted: "..(cA.text or"pad changed"))c.matchSince=nil
return false end local iw=cA.info and cA.info.name or(cA.state=="match"and W.name)or nil local function vP()return br.Enabled and ac()==nil and(iv or il().state=="match")
end local vQ,vR=dt(br,function()return ac()~=nil or((not br.Enabled)and(iv or W.seq==vO))end,vP,nq()~=nil)if vQ then
ao(function()return ac()~=nil end,0.8)local du=ac()local nL=a6()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil W.name,W.rar,W.at=nil,nil,x()z(("BOUGHT %s%s via %s"):format(du and ah(aa(du))or(cA.shown or"?"),(nK and nL)and(" for $"..aJ(nK-nL))or"",vR))
if du and iw and aa(du)~=aa(iw)then z(("note: picked up %s, not %s"):format(du,iw))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local nM=bS()z(("BUY REFUSED: cash short? have $%s, price %s"):format(aJ(a6()),(nM and nM.price)or"?"))
return false end local function nN()local dv=ac()if not dv then c.holding=false z("place: hands are empty")return false
end if not aI(dv)then z(("REFUSED TO WAX %s - it is not ticked"):format(ah(aa(dv))))return false end for Cs=1,d.PlaceTries do
local bs=tX()if not bs then z("place: no free station")break end local nO=da(bs)if nO then cy(nO,bs)local nP=ac()
if not nP then c.holding=false z("place: hands emptied on the way")return false end if not aI(nP)then z("place: what I carry changed, not waxing it")return false end
if bs.Enabled then local vS,vT=dt(bs,function()return not bs.Enabled end,function()return bs.Enabled end)if vS then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 W.name,W.rar,W.at=nil,nil,x()
z(("WAXED %s #%d at %s via %s"):format(ah(aa(dv)),c.placed,bs.Parent.Parent.Name,vT))if q.placed then pcall(q.placed,dv)end
return true end end end af(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end z("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))z(c.capMsg)end return false end function y.place()local vU=x()while c.alive and y.editing and x()-vU<25 do af(0.2)end
if d.Teams and d.TeamWax~=""then y.placing=true local vV=x()while c.alive and y.current()~=d.TeamWax and x()-vV<5 do af(0.1)end
if y.current()==d.TeamWax then af(0.3)else z("wax team did not come on in time - placing anyway")end end local vW,nQ=pcall(nN)
y.placing=false if not vW then error(nQ,0)end return nQ end local function nR(nS)return type(nS)=="string"and nS:lower():find("crate",1,true)~=nil
end local vX={SABFarmGui=1,SABToggle=1,SABError=1}local function ix(vY)local bt=vY while bt do if vX[bt.Name]then return false end
if bt:IsA("ScreenGui")then local vZ,v0=pcall(function()return bt.Enabled end)return(not vZ)or v0~=false end if bt:IsA("GuiObject")and not bt.Visible then return false end
bt=bt.Parent end return false end local function fA(fB)local cB=""pcall(function()if fB:IsA("TextButton")then cB=fB.Text end end)
if not cB:find("%a")then for Ct,fC in ipairs(fB:GetDescendants())do if(fC:IsA("TextLabel")or fC:IsA("TextButton"))and fC.Text:find("%a")then cB=fC.Text break end
end end if not cB:find("%a")then cB=fB.Name end return(cB:lower():gsub("[^%a]",""))end local function v1()local dw,dx
local nT=F:FindFirstChildOfClass("PlayerGui")if not nT then return nil,nil end for Cu,dy in ipairs(nT:GetDescendants())do
if dy:IsA("GuiButton")and ix(dy)then local iy=fA(dy)if iy:sub(1,4)=="open"and not iy:find("shop",1,true)then dw=dw or dy end
if iy:sub(1,7)=="discard"then dx=dx or dy end end end if dw and dx then return dw,dx end if e.on then return dw,dx end
return nil,nil end local iz=(function()local v2,v3=pcall(function()return game:GetService("VirtualInputManager")end)return v2 and v3 or nil end)()
local function nU(ba,iA)local iB={}local function nV(v4)iB[#iB+1]=v4 end if c.tapWay then nV(c.tapWay)end for Cv,nW in ipairs({"touch","conn","signal"})do
if nW~=c.tapWay then nV(nW)end end local function nX(v5,...)local v6,iC=pcall(getconnections,v5)if not(v6 and type(iC)=="table"and#iC>0)then return false end
local nY,v7,v8=false,{...},select("#",...)for Cw,v9 in ipairs(iC)do if pcall(function()v9:Fire(table.unpack(v7,1,v8))end)then nY=true end
end return nY end local function nZ()local n0=Vector3 .new(0,0,0)pcall(function()local n1,n2=ba.AbsolutePosition,ba.AbsoluteSize
n0=Vector3 .new(n1 .X+n2 .X/2,n1 .Y+n2 .Y/2,0)end)local iD={Position=n0,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()iD.UserInputType=Enum.UserInputType.Touch end)pcall(function()iD.UserInputState=Enum.UserInputState.End end)
return iD end for Cx,bc in ipairs(iB)do local dz=false if bc=="conn"and type(getconnections)=="function"then if nX(ba.MouseButton1Click)then
dz=true if ao(iA,1.5)then c.tapWay=bc return true,bc end end dz=nX(ba.Activated,nZ(),1)elseif bc=="signal"and type(firesignal)=="function"then
if pcall(firesignal,ba.MouseButton1Click)then if ao(iA,1.5)then c.tapWay=bc return true,bc end end dz=pcall(firesignal,ba.Activated,nZ(),1)
elseif bc=="touch"and iz then dz=pcall(function()local n3,n4=ba.AbsolutePosition,ba.AbsoluteSize local n5=0 local n6=ba:FindFirstAncestorWhichIsA("ScreenGui")
local v_,wa=pcall(function()return n6 and n6 .IgnoreGuiInset end)if not(v_ and wa)then pcall(function()n5=game:GetService("GuiService"):GetGuiInset().Y end)
end local n7,n8=n3 .X+n4 .X/2,n3 .Y+n4 .Y/2+n5 iz:SendMouseButtonEvent(n7,n8,0,true,game,1)task.wait(0.06)iz:SendMouseButtonEvent(n7,n8,0,false,game,1)
end)end if dz and ao(iA,1.5)then c.tapWay=bc return true,bc end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function iE(n9)local dA=n9 .Parent while dA and dA~=c.plot do if e.NOT[dA.Name]then return false end dA=dA.Parent
end local iF=(n9 .ActionText or""):lower()if iF:find("roll",1,true)or iF:find("place",1,true)or iF:find("sell",1,true)then return false end
return true end local function wb()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local n_=c.plot:FindFirstChild("CrateStand")local dB if n_ then for Cy,fD in ipairs(n_:GetDescendants())do
if fD:IsA("ProximityPrompt")and fD.Enabled and iE(fD)then dB=fD break end end end if not dB then for Cz,bu in ipairs(c.plot:GetDescendants())do
if bu:IsA("ProximityPrompt")and bu.Enabled and iE(bu)then local oa=bu:FindFirstAncestorWhichIsA("Model")local wc=((bu.ActionText or"").." "..(bu.ObjectText or"").." "..bu.Name.." "..(oa and oa.Name or"")):lower()
if wc:find("crate",1,true)then dB=bu break end end end end e.prompt=dB return dB end local function iG()if e.on then return true end
local dC=wb()if not dC then e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local ob=da(dC)if ob then cy(ob,dC)end e.ours=true dt(dC,function()return e.on end)if ao(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()z("crate: pressed "..eS(dC).." but no window came up")
return false end do local function wd(oc)local cC=oc.Parent while cC and cC:IsA("GuiObject")do local od,oe=false,false
for CA,dD in ipairs(cC:GetDescendants())do if dD~=oc and dD:IsA("GuiButton")and fA(dD):sub(1,7)=="discard"then od=true end
if dD:IsA("TextLabel")then local iH=dD.Text:lower()if iH:find("crate",1,true)or iH:find("can contain",1,true)or iH:find("cost",1,true)then oe=true end
end if od and oe then return cC end end cC=cC.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local of=F:FindFirstChildOfClass("PlayerGui")if not of then return nil end for CB,fE in ipairs(of:GetDescendants())do
if fE:IsA("GuiButton")and not fE:FindFirstAncestor("SABFarmGui")and fA(fE):sub(1,4)=="open"then local iI=wd(fE)
if iI then e.win=iI return iI end end end end local function we(wf)for CC,fF in ipairs(wf:GetDescendants())do
if fF:IsA("GuiButton")then local og,iJ=fA(fF),fF.Name:lower()if og=="x"or og=="close"or iJ=="x"or iJ:find("close",1,true)or iJ:find("exit",1,true)then return fF end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(wg)task.wait(wg and 4 or 1.2)if e.on or e.waiting then return end
local fG=e.findWin()if not fG or not ix(fG)then return end local oh=we(fG)if oh and nU(oh,function()return not ix(fG)end)then return end
z("the crate window is still open - tap its X")end end local function fH(fI)if not iG()then return false end local oi=x()-(e.openedAt or 0)
if oi<0.6 then af(0.6-oi)end local iK=e.title local wh,wi=v1()local oj=fI and wh or wi if not oj then e.lastFail=x()
c.crateFails=c.crateFails+1 z(("crate: no %s button found in %s"):format(fI and"Open"or"Discard",iK))return false
end local wj=ac()local wk,CD=nU(oj,function()return(not e.on)or(ac()~=nil and ac()~=wj)end)if not wk then e.lastFail=x()
c.crateFails=c.crateFails+1 z("crate: could not press "..(fI and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fI then c.crates=c.crates+1 ao(function()return ac()~=nil end,1.5)local ol=ac()
z(("OPENED %s -> %s"):format(iK,ol and ah(aa(ol))or"?"))else z("discarded "..iK.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(wl,...)local wm=select("#",...)e.calls[#e.calls+1]={t=x(),m=wl,n=wm,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(aD,bd)local bv=type(aD)if(bv=="string"or bv=="number")and type(bd.data)=="table"then for om,iL in pairs(bd.data)do
if iL==aD and type(om)=="string"and(type(iL)=="string"or type(iL)=="number")then return{__slot="f:"..om}end end
end if bv=="string"then if bd.crate and aD==bd.crate then return{__slot="crate"}end if bd.title and aD==bd.title then return{__slot="title"}end
if bd.rar and aD==bd.rar then return{__slot="rarity"}end return aD end if bv=="number"or bv=="boolean"or bv=="nil"then return aD end
if bv=="table"then local oo={}for wn,op in pairs(aD)do if type(op)=="table"then return nil,"nested table"end local wo,oq=e.slot(op,bd)
if oq then return nil,oq end oo[wn]=wo end return oo end local wp,wq=pcall(function()return aD:IsA("Instance")end)
if wp and wq then if aD==F then return{__slot="player"}end if c.plot and aD==c.plot then return{__slot="plot"}end
local fJ=c.plot and c.plot:FindFirstChild("CrateStand")if fJ and aD==fJ then return{__slot="stand"}end if fJ and aD.Parent==fJ then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bv..")"end function e.resolve(fK)if type(fK)~="table"then return fK end
local aN=fK.__slot if aN and aN:sub(1,2)=="f:"then return e.data and e.data[aN:sub(3)]end if aN=="crate"then return e.data and e.data.name end
if aN=="title"then return(e.data and e.data.title)or e.title end if aN=="rarity"then return e.data and e.data.rarity end
if aN=="player"then return F end if aN=="plot"then return c.plot end if aN=="stand"or aN=="model"then local iM=c.plot and c.plot:FindFirstChild("CrateStand")
if aN=="stand"or not iM then return iM end for CE,ot in ipairs(iM:GetChildren())do if nR(ot.Name)then return ot end end
return nil end local ou={}for wr,ws in pairs(fK)do ou[wr]=e.resolve(ws)end return ou end function e.classify(iN)
if e.directOff then return end local fL={}for CG,iO in ipairs(e.calls)do if iO.t<=iN+0.05 and iN-iO.t<=6 then fL[#fL+1]=iO end
end if#fL==0 then return end if not ao(function()return(e.heldAt or 0)>=iN-1 end,2.5)then return end local dE={}
for CH,dF in ipairs(fL)do local ov={}for ow=1,dF.n do local wt,ox=e.slot(dF.args[ow],dF)if ox then z("crate call has "..ox.." - keeping the button method")
return end ov[ow]=wt end dE[#dE+1]={m=dF.m,n=dF.n,args=ov}end local iP=e.learned e.learned={seq=dE,mode=iP and iP.mode or nil}
ag.dirty=true if not iP then z(("learned how to open crates directly (%d call%s)"):format(#dE,#dE==1 and""or"s"))end
end function e.replay()local oy=e.learned local oz=aj:FindFirstChild("Remotes")local iQ=oz and oz:FindFirstChild("CrateAction")
if not(oy and iQ)then return false end local oA=table.unpack or unpack e.replaying=true for CI,dG in ipairs(oy.seq)do
local iR={}for oB=1,dG.n do iR[oB]=e.resolve(dG.args[oB])end task.spawn(function()pcall(function()if dG.m=="InvokeServer"then iQ:InvokeServer(oA(iR,1,dG.n))
else iQ:FireServer(oA(iR,1,dG.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(wu)return(wu:gsub("[%%|;=,\n]",function(wv)return("%%%02X"):format(wv:byte())end))end
function e.enc(bZ)local fM=type(bZ)if fM=="string"then return"s"..e.esc(bZ)end if fM=="number"then return"n"..tostring(bZ)end
if fM=="boolean"then return bZ and"b1"or"b0"end if fM=="nil"then return"z"end if bZ.__slot then return"k"..bZ.__slot end
local iS={}for ww,wx in pairs(bZ)do iS[#iS+1]=e.enc(ww).."="..e.enc(wx)end return"t"..table.concat(iS,",")end
function e.dec(oC)local dH,dI=oC:sub(1,1),oC:sub(2)local function wy(wz)return(wz:gsub("%%(%x%x)",function(wA)return string.char(tonumber(wA,16))end))end
if dH=="s"then return wy(dI)end if dH=="n"then return tonumber(dI)end if dH=="b"then return dI=="1"end if dH=="k"then return{__slot=dI}end
if dH=="t"then local oD={}for wB in dI:gmatch("[^,]+")do local oE,wC=wB:match("^(.-)=(.*)$")if oE then local oF=e.dec(oE)
if oF~=nil then oD[oF]=e.dec(wC)end end end return oD end return nil end function e.goneOrNew(wD)return function()
if not e.waiting then return true end local oG=ac()return oG~=nil and oG~=wD end end function e.near()local oH=aj:FindFirstChild("Remotes")
local oI=oH and oH:FindFirstChild("CrateAction")local iT=au()local iU=c.plot and c.plot:FindFirstChild("CrateStand")
local iV=iU and iU:FindFirstChild("Spot")if not(oI and iT and iV)then return false,"no crate stand or remote"end
local iW=iT.HumanoidRootPart local fN=iW.CFrame local oJ,iX=e.title,"no answer"local wE=ac()local oK=iU:FindFirstChild("Holder")
local function oL()if not oK then return e.waiting or e.on end for CJ,wF in ipairs(oK:GetChildren())do if wF:IsA("Model")then return true end end
return false end for wG=1,3 do if not(e.waiting or e.on)or not oL()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(iW.Position-iV.Position).Magnitude>8 then cy(iV,e.prompt)end af(0.12+0.15*wG)
local aY={}e.replaying=true task.spawn(function()aY.ok,aY.v=pcall(function()return oI:InvokeServer("open")end)
aY.done=true end)ao(function()return aY.done end,6)e.replaying=false local b0=aY.v if aY.done and aY.ok and type(b0)=="table"and b0 .ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 z(("OPENED %s -> %s (no window)"):format(oJ,b0 .prize and ah(aa(tostring(b0 .prize)))or"?"))
ao(function()local oM=ac()return oM~=nil and oM~=wE end,1.5)if(iW.Position-fN.Position).Magnitude>8 then pcall(function()aC(iT,fN.Position,fN.Position+fN.LookVector)end)end
return true,"opened"end iX=(aY.done and aY.ok and type(b0)=="table")and tostring(b0 .reason or"refused, no reason given")
or(aY.done and("error: "..tostring(b0))or"no answer in 6s")af(0.3)if not oL()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 z(("crate: the server would not open %s next to the stand (%s)"):format(oJ,iX))
return false,iX end function e.smart()local iY=e.title if(e.nearFails or 0)<3 then local wH=e.near()if wH then return true end
if e.nearFails>=3 then z("opening next to the stand failed 3 times - trying the older ways")end end local b1=e.learned
if b1 then local iZ=ac()if e.on then e.replay()if ao(e.goneOrNew(iZ),3.5)then c.crates=c.crates+1 z("OPENED "..iY.." (direct)")
return true end else if b1 .mode~="window"then e.replay()if ao(e.goneOrNew(iZ),3.5)then c.crates,e.fails=c.crates+1,0
if b1 .mode~="direct"then b1 .mode,ag.dirty="direct",true z("crates now open directly - the window never comes up")
end z("OPENED "..iY.." (direct, no window)")return true end end if iG()then e.replay()if ao(e.goneOrNew(iZ),3.5)then
c.crates,e.fails=c.crates+1,0 if b1 .mode~="window"then b1 .mode,ag.dirty="window",true z("crates need their window up first - it shows briefly")
end z("OPENED "..iY.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ag.dirty=b1,nil,true
if e.fails>=3 then e.directOff=true z("direct crate opening failed 3 times - using the button for now")else z("the learned crate call did not work - back to pressing Open")
end end return fH(true)end function C.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end C.cache={}function C.watchCache()C.cache=C.snap()
for wI,oN in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do V(F:GetAttributeChangedSignal(oN):Connect(function()C.cache[wI]=F:GetAttribute(oN)end))
end end function C.isOn()return F:GetAttribute("AutoRollOn")==true end function C.saw(wJ,...)local fO=C.cache
local wK={m=wJ,n=select("#",...),args={...},before={rules=fO.rules,stop=fO.stop,on=fO.on,main=fO.main}}task.delay(1.5,function()
if c.alive then pcall(C.learnOne,wK)end end)end function C.learnOne(dJ)local ax,dK=C.snap(),dJ.before local fP=(ax.rules~=dK.rules)or(ax.stop~=dK.stop)
local oO=(ax.on~=dK.on)or(ax.main~=dK.main)if not fP and not oO then return end local oP={}for oQ=1,dJ.n do local aK=dJ.args[oQ]
local b2=type(aK)if b2=="string"and aK~=""and aK==ax.rules then aK={__slot="rules"}elseif b2=="string"and aK~=""and fP and aK==ax.stop and ax.stop~=dK.stop then aK={__slot="stop"}
elseif b2=="table"then local oR={}for wL,cD in pairs(aK)do if type(cD)=="table"or(type(cD)=="userdata")then C.msg="Auto Roll sends something I cannot repeat"return
end oR[wL]=(type(cD)=="string"and cD~=""and cD==ax.rules)and{__slot="rules"}or cD end aK=oR elseif b2~="string"and b2~="number"and b2~="boolean"and b2~="nil"then
if aK==F then aK={__slot="player"}else C.msg="Auto Roll sends something I cannot repeat"return end end oP[oQ]=aK
end local cE={m=dJ.m,n=dJ.n,args=oP}if fP then local i0=false for wM=1,cE.n do local dL=cE.args[wM]if type(dL)=="table"and dL.__slot=="rules"then i0=true end
if type(dL)=="table"and not dL.__slot then for CK,oS in pairs(dL)do if type(oS)=="table"and oS.__slot=="rules"then i0=true end end
end end if i0 then C.rec.rules={cE}else table.insert(C.rec.rules,cE)if#C.rec.rules>60 then table.remove(C.rec.rules,1)end
end end if oO then if ax.on==true then C.rec.on=cE else C.rec.off=cE end d.AutoRoll=(ax.on==true)end if ax.rules and ax.rules~=""then d.ARrules,d.ARstop=ax.rules,ax.stop or""end
ag.dirty=true C.msg=""z(("learned an Auto Roll %s message"):format(fP and"choices"or(ax.on and"on"or"off")))end
function C.resolve(cF)if type(cF)~="table"then return cF end if cF.__slot=="rules"then return d.ARrules~=""and d.ARrules or F:GetAttribute("AutoRollRules")end
if cF.__slot=="stop"then return d.ARstop~=""and d.ARstop or F:GetAttribute("AutoRollStop")end if cF.__slot=="player"then return F end
local oT={}for wN,wO in pairs(cF)do oT[wN]=C.resolve(wO)end return oT end function C.replay(oU,wP)local oV=table.unpack or unpack
for CL,dM in ipairs(wP)do local i1={}for oW=1,dM.n do i1[oW]=C.resolve(dM.args[oW])end C.replaying=true pcall(function()
if dM.m=="InvokeServer"then task.spawn(function()pcall(function()oU:InvokeServer(oV(i1,1,dM.n))end)end)else oU:FireServer(oV(i1,1,dM.n))end
end)C.replaying=false task.wait(0.25)end end function C.apply(oX,wQ)if C.busy or not c.alive then return end C.busy=true
pcall(function()local oY=aj:FindFirstChild("Remotes")local i2=oY and oY:FindFirstChild("AutoRollAction")if not i2 then C.msg="this game has no AutoRollAction"return end
local bw=d.AutoRoll if bw and d.ARrules~=""and F:GetAttribute("AutoRollRules")~=d.ARrules then if#C.rec.rules==0 then
C.msg="pick your Auto Roll choices once in the game's menu so I can learn them"z(C.msg)else C.replay(i2,C.rec.rules)
if ao(function()return F:GetAttribute("AutoRollRules")==d.ARrules end,4)then z("Auto Roll choices put back")else
C.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"z(C.msg)end end end if bw==C.isOn()or(not bw and not wQ)then return end
local fQ=bw and C.rec.on or C.rec.off if not fQ then local dN=bw and C.rec.off or C.rec.on local oZ=dN~=nil for wR=1,dN and dN.n or 0 do
if type(dN.args[wR])=="boolean"then oZ=false end end if oZ then fQ=dN end end if not fQ then C.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bw and"on"or"off")
z(C.msg)return end C.replay(i2,{fQ})if ao(function()return C.isOn()==bw end,4)then C.msg=""z(("Auto Roll switched %s%s"):format(bw and"ON"or"OFF",oX and(" ("..oX..")")or""))
else C.msg="Auto Roll did not switch - do it once in the game so I can relearn it"z(C.msg)end end)C.busy=false
end l.HS=game:GetService("HttpService")l.uid=(function()local wS,wT=pcall(function()return F.UserId end)return wS and wT or 0 end)()
l.buyMsg,l.wishMsg,l.wishN="","",0 function l.info()if l.I then return l.I end local wU,i3=pcall(function()return require(aj:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if wU and type(i3)=="table"and type(i3 .Pets)=="table"then l.I=i3 end return l.I end function l.order()if l.list then return l.list end
local bx=l.info()if not bx then return{}end local b3={}if type(bx.Order)=="table"and#bx.Order>0 then for CM,o0 in ipairs(bx.Order)do if bx.Pets[o0]then b3[#b3+1]=o0 end end
else for wV in pairs(bx.Pets)do b3[#b3+1]=wV end table.sort(b3,function(wW,wX)return(bx.Pets[wW].price or 0)<(bx.Pets[wX].price or 0)end)
end l.list=b3 return b3 end function l.nice(o1,i4)local o2=l.info()local o3=o2 and o2 .Pets[o1]return((i4 and i4~="")and(i4 .." ")or"")..(o3 and o3 .displayName or tostring(o1))
end function l.data()local fR=F:GetAttribute("PetsData")if type(fR)~="string"then return nil end if fR==l.rawD then return l.lastD end
local wY,dO=pcall(function()return l.HS:JSONDecode(fR)end)dO=(wY and type(dO)=="table")and dO or nil l.rawD,l.lastD=fR,dO
return dO end function l.pen()return aj:FindFirstChild("PetMeadowSpawns")end function l.srv()return as:GetServerTimeNow()end
function l.money()local i5=F:FindFirstChild("MoneyValue")if i5 and type(i5 .Value)=="number"then return i5 .Value end
return a6()or 0 end function l.wishes()local o4=l.pen()local o5=o4 and o4:GetAttribute("Wishes")local i6,o6={},l.srv()
if type(o5)~="string"then return i6 end local wZ,o7=pcall(function()return l.HS:JSONDecode(o5)end)if wZ and type(o7)=="table"then
for w0,i7 in pairs(o7)do if type(i7)=="number"and i7>o6 then i6[w0]=i7-o6 end end end return i6 end function l.call(...)
local o8=aj:FindFirstChild("Remotes")local o9=o8 and o8:FindFirstChild("PetRequest")if not o9 then return nil end
local o_=table.pack(...)local b4={}task.spawn(function()b4 .ok,b4 .v=pcall(function()return o9:InvokeServer(table.unpack(o_,1,o_.n))end)
b4 .done=true end)local w1=x()while not b4 .done and x()-w1<6 do task.wait(0.05)end if b4 .done and b4 .ok then return b4 .v end
return nil end function l.want(w2)return d.Pets[w2]end function l.closeNaming(i8)local pb=pcall(function()local pa=F:FindFirstChild("PlayerScripts")
local w3=pa and pa:FindFirstChild("Naming",true)require(w3).close()end)af(0.5)if i8 .Visible then pcall(function()local pc=i8:FindFirstChild("NameBox",true)if pc then pc:ReleaseFocus()end end)
i8 .Visible=false pb=false end return pb end function l.skipNaming()l.namingUntil=x()+10 if l.namingOn then return end
l.namingOn=true task.spawn(function()while c.alive and x()<l.namingUntil do local pd=F:FindFirstChildOfClass("PlayerGui")
local pe=pd and pd:FindFirstChild("MainGui")local fS=pe and pe:FindFirstChild("PetNameGui")if fS and fS.Visible then
af(0.4)if fS.Visible then l.namingShut=(l.namingShut or 0)+1 pcall(l.closeNaming,fS)break end end af(0.25)end
l.namingOn=false end)end function l.buyTick()if not d.PetBuy then l.buyMsg="auto adopt is off"return end local i9,pf,fT=l.info(),l.pen(),l.data()
if not(i9 and pf and fT)then l.buyMsg="pet data not loaded yet"return end l.tryAt=l.tryAt or{}local dP,i_=#(fT.pets or{}),tonumber(fT.maxOwned)or 60
local w4,pg,dQ=l.srv(),{},nil for CN,aO in ipairs(pf:GetChildren())do pg[aO.Name]=true local b5,fU=aO:GetAttribute("Pet"),aO:GetAttribute("Variant")or""
local ja=b5 and l.want(b5)if ja and ja.b and i9 .Pets[b5]and(not ja.g or fU=="Big")and A.wantMore(b5,fU,fT)and not aO:GetAttribute("A_"..l.uid)
and(tonumber(aO:GetAttribute("ExpiresAt"))or 0)>w4+1 and x()>=(l.tryAt[aO.Name]or 0)then local dR,ph=l.nice(b5,fU),i9 .Pets[b5].price or 0
if dP>=i_ then dQ=("%s is in the pen, but you have %d/%d pets"):format(dR,dP,i_)l.tryAt[aO.Name]=x()+15 elseif l.money()<ph then
dQ=("%s is in the pen - need $%s"):format(dR,aJ(ph))l.tryAt[aO.Name]=x()+5 else l.tryAt[aO.Name]=x()+8 local by=l.call("adopt",aO.Name)
if type(by)=="table"and by.ok then dP=dP+1 l.buys=(l.buys or 0)+1 l.recent=l.recent or{}local w5=type(by.pet)=="table"and by.pet or{}
table.insert(l.recent,{id=tostring(w5 .id or("?"..x())),name=b5,variant=fU,at=x()})if#l.recent>30 then table.remove(l.recent,1)end
z("ADOPTED "..dR)l.skipNaming()dQ="adopted "..dR else local pj=type(by)=="table"and tostring(by.reason or"no reason given")or"no answer"
z(("adopt %s failed: %s"):format(dR,pj))dQ="adopt failed: "..pj if type(by)=="table"and by.bagFull then l.tryAt[aO.Name]=x()+60 end
end end end end for pk in pairs(l.tryAt)do if not pg[pk]then l.tryAt[pk]=nil end end l.buyMsg=dQ or("watching the pen (%d/%d pets)"):format(dP,i_)
end function l.wishTick()if not d.PetWish then l.wishMsg="auto wish is off"return end local fV=l.info()if not(fV and l.pen())then l.wishMsg="pet data not loaded yet"return end
l.wishTry,l.wishWhy=l.wishTry or{},l.wishWhy or{}local fW,jb,bz=l.wishes(),0,nil local w6=(type(fV.Wish)=="table"and fV.Wish.cashShare)or 2
local w7=l.data()for CO,az in ipairs(l.order())do local pl=l.want(az)if pl and pl.w and A.wantMore(az,"",w7)then
jb=jb+1 if not fW[az]and x()>=(l.wishTry[az]or 0)then local jc=tonumber(F:GetAttribute("PetWishCredits"))or 0
local jd=math.floor((fV.Pets[az].price or 0)*w6)if jc<=0 and l.money()<jd then l.wishTry[az]=x()+10 bz=("need $%s to wish for %s"):format(aJ(jd),l.nice(az))
l.wishWhy[az]=bz else l.wishTry[az]=x()+3 local w8=jc>0 and"wishCredit"or"wish"local fX=l.call(w8,az)if type(fX)=="table"and fX.ok then
l.wishN,l.wishWhy[az]=l.wishN+1,nil z(("WISHED for %s (%s)"):format(l.nice(az),jc>0 and"free wish"or("$"..aJ(jd))))
else local je=type(fX)=="table"and tostring(fX.reason or"no reason given")or"no answer"if je:lower():find("already",1,true)then l.wishTry[az]=x()+2
else z(("wish %s failed: %s"):format(l.nice(az),je))bz="wish failed: "..je end end end end end end if not bz then
for CP,fY in ipairs(l.order())do local pm=l.want(fY)if pm and pm.w and not fW[fY]and l.wishWhy[fY]then bz=l.wishWhy[fY]break end
end end if not bz then local fZ={}for CQ,f0 in ipairs(l.order())do local pn=l.want(f0)if pn and pn.w and fW[f0]then fZ[#fZ+1]=("%s %dm"):format(l.nice(f0),math.ceil(fW[f0]/60))end
end bz=jb==0 and"no pet has WISH ticked"or("running: "..(#fZ>0 and table.concat(fZ,", ")or"none yet"))end l.wishMsg=bz
end y.switches,y.glazed,y.finished=0,0,0 y.done,y.doneN,y.later={},0,{}function y.teams()local jf=l.data()return(jf and jf.teams)or{},jf
end function y.current(cG)cG=cG or l.data()if not cG then return""end local po={}for CS,w9 in ipairs(cG.equipped or{})do po[tostring(w9)]=true end
for CT,pp in ipairs(cG.teams or{})do local pq=pp.pets or{}local jg=#pq==#(cG.equipped or{})if jg then for CU,w_ in ipairs(pq)do if not po[tostring(w_)]then jg=false break end end end
if jg then return pp.name end end return""end function y.equip(jh)local xa,xb=y.teams()local ji for xc,xd in ipairs(xa)do if xd.name==jh then ji=xc break end end
if not ji then y.msg="no saved team called "..tostring(jh)return false end if y.current(xb)==jh then return true end
for CV=1,4 do local ps=l.call("teamEquip",ji)if type(ps)=="table"and ps.ok then y.switches=y.switches+1 return true
end task.wait(0.4)end return false end function y.left(xe)local pt=xe:FindFirstChild("SquishyPlaceHolder")local pu=pt and pt:FindFirstChild("TimerGui")
local pv=pu and pu:FindFirstChildWhichIsA("TextLabel",true)local jj=pv and pv.Text if type(jj)~="string"or jj:find("-",1,true)then return nil end
local jk,pw,px=jj:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not jk then return nil end local py=px~=""and(tonumber(jk)*3600+tonumber(pw)*60+tonumber(px))or(tonumber(jk)*60+tonumber(pw))
return py>0 and py or nil end function y.waxes()local dS={}local pz=c.plot and c.plot:FindFirstChild("WaxStations")
if not pz then return dS end local pA=l.srv()for CW,aZ in ipairs(pz:GetChildren())do local jl=tonumber(aZ:GetAttribute("PourEnd"))
local pB=aZ:GetAttribute("PourOwner")if aZ:GetAttribute("HasSquishy")and aZ:GetAttribute("PourId")and(pB==nil or pB==l.uid)then
local jm=y.left(aZ)local pC=jm and(pA+jm)or((jl and jl>pA)and jl or nil)if pC then local pD,pE=aZ:FindFirstChild("SquishyPlaceHolder"),"?"
if pD then for CX,pF in ipairs(pD:GetChildren())do if pF:IsA("Model")then pE=pF.Name break end end end local xf=tostring(aZ:GetAttribute("Helpers")or"")
local jn=0 for CY in xf:gmatch("%d+")do jn=jn+1 end dS[#dS+1]={st=aZ,ends=pC,sure=jm~=nil,id=aZ:GetAttribute("PourId"),name=pE,helps=jn,
long=aZ:GetAttribute("PourLong")==true}end end end table.sort(dS,function(xg,xh)return xg.ends<xh.ends end)return dS
end function y.glazeCount()local pG=aj:FindFirstChild("Remotes")local pH=pG and pG:FindFirstChild("EditStack")
if not pH then return nil end local xi,dT=pcall(function()return pH:InvokeServer("State",nil)end)if not(xi and type(dT)=="table"and type(dT.state)=="table")then return nil end
local jo,jp=0,{}for CZ,f1 in ipairs(dT.state.entries or{})do if f1 .glaze and f1 .glaze~=""then jo=jo+1 jp[f1 .glaze]=(jp[f1 .glaze]or 0)+1 end
end return jo,jp,#(dT.state.entries or{}),dT.state.capacity end function y.finishedOne(f2,pI)y.finished=y.finished+1
task.wait(2)local jq,xj,pJ,xk=y.glazeCount()if jq and pI and jq>pI then y.glazed=y.glazed+1 local jr={}for xl,xm in pairs(xj)do jr[#jr+1]=xl.." "..xm end
z(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ah(aa(f2 .name)),f2 .st.Name,jq,table.concat(jr,", ")))
else z(("wax done on station %s: %s, no glaze%s"):format(f2 .st.Name,ah(aa(f2 .name)),pJ and(" (stack "..pJ.."/"..tostring(xk)..")")or""))
end end function y.tick()y.list=y.waxes()if y.editing and x()-(y.editingSince or x())>120 then y.editing=false end
if y.editing then y.msg="rebuilding teams..."return end if not d.Teams then y.want,y.msg="","auto teams is off"return end
local b6=l.srv()local aE=y.glazeFor if aE then local dU=aE.st local pK=dU.Parent and dU:GetAttribute("HasSquishy")and dU:GetAttribute("PourId")==aE.id
local pL=pK and y.left(dU)if pL then aE.ends=b6+pL end if not pK then y.glazeFor,y.afterUntil=nil,x()+1.5 if not y.done[aE.id or"?"]then
y.done[aE.id or"?"],y.doneN=true,y.doneN+1 if y.doneN>400 then y.done,y.doneN={[aE.id or"?"]=true},1 end local xn=aE.before
task.spawn(function()pcall(y.finishedOne,aE,xn)end)end elseif aE.ends-b6>d.GlazeLead*3+60 or b6>aE.ends+90 then
y.glazeFor,y.afterUntil=nil,x()+1.5 y.later[aE.id or"?"]=x()+120 z(("station %s is not finishing yet (%s left) - glaze team off again"):format(dU.Name,y.clock(aE.ends-b6)))
end end if d.TeamGlaze~=""and not y.glazeFor then local xo=y.speedRatio(d.TeamGlaze)for C0,b7 in ipairs(y.list)do
if b7 .sure and(b7 .ends-b6)*xo[b7 .long and 2 or 1]<=d.GlazeLead and x()>=(y.later[b7 .id or"?"]or 0)and not y.done[b7 .id or"?"]then
y.glazeFor=b7 task.spawn(function()b7 .before=y.glazeCount()end)break end end end local aF,dV="",""local cH=q.snapAt and(q.snapAt-b6)
if cH and cH<-8 then q.snapAt,cH=nil,nil end if d.TeamGlaze~=""and cH and cH<=20 then aF,dV=d.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(cH)))
elseif d.TeamGlaze~=""and(y.glazeFor or x()<(y.afterUntil or 0))then aF,dV=d.TeamGlaze,y.glazeFor and(" - station "..y.glazeFor.st.Name.." finishes soon")or""
elseif d.TeamWax~=""and(y.placing or y.aboutToPlace())then aF,dV=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and y.allBusy()then
aF,dV=d.TeamFull," - every station is busy"else aF=d.TeamNormal end y.want=aF local dW=y.current()y.cur=dW if aF~=""and dW~=aF and x()>=(y.nextTry or 0)then
y.nextTry=x()+1.1 if y.equip(aF)then z("team: "..aF..dV)else y.nextTry=x()+3 end end local js=y.list[1]y.msg=("on: %s%s | next wax done %s"):format(dW~=""and dW or"(not a saved team)",(aF~=""and aF~=dW)and(" -> "..aF)or"",
js and("in "..y.clock(js.ends-b6).." (st "..js.st.Name..")")or"- none running")end function y.clock(bA)bA=math.max(0,math.floor(bA))
if bA>=3600 then return("%d:%02d:%02d"):format(math.floor(bA/3600),math.floor((bA%3600)/60),bA%60)end return("%d:%02d"):format(math.floor(bA/60),bA%60)
end function y.allBusy()local xp,xq=eU()return xq>0 and xp==0 end function y.aboutToPlace()if not c.running then return false end
local pM=ac()if not(pM and aI(pM))then return false end local xr=eU()return xr>0 end function y.mult(pN,xs,pO)return{(1+pN)*(1+pO),(1+pN+xs)*(1+pO)}end
function y.speedNow()local function jt(xt)return tonumber(F:GetAttribute(xt))or 0 end return y.mult(jt("PetWaxSpeed"),jt("PetLongWax"),jt("PetSocialWax"))
end function y.speedOf(xu)local xv,pP=y.teams()if not pP then return nil end for C1,pQ in ipairs(xv)do if pQ.name==xu then
local ju={}for C2,xw in ipairs(pQ.pets or{})do for C3,pR in ipairs(pP.pets or{})do if tostring(pR.id)==tostring(xw)then ju[#ju+1]=pR break end end
end local pS=A.caps()local pT,xx=A.stats(ju)return y.mult(math.min(pT.waxSpeed or 0,pS.waxSpeed or 0.25),math.min(pT.longWax or 0,pS.longWax or 0.3),xx.socialWax or 0)
end end return nil end function y.speedRatio(xy)local pU,jv=y.speedNow(),y.speedOf(xy)if not jv then return{1,1}end
return{pU[1]/jv[1],pU[2]/jv[2]}end function y.glazeSoon()return d.Teams and d.TeamGlaze~=""and(y.glazeFor~=nil or x()<(y.afterUntil or 0))
end A.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
A.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}A.buildMsg,A.fuseMsg,A.fused,A.builds="","",0,0
function A.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function A.caps()local jw=l.info()return(jw and type(jw.Caps)=="table")and jw.Caps or A.CAPS
end function A.value(pV,jx)local f3=l.info()local cI=f3 and f3 .Pets[pV]if not(cI and type(cI.boost)=="table")then return nil end
local b8 if type(f3 .boostValue)=="function"then local xz,xA=pcall(f3 .boostValue,pV,(jx~=""and jx)or nil)b8=xz and tonumber(xA)or nil
end if not b8 then b8=cI.boost.value or 0 if jx=="Big"then local pW=b8*1.5 b8=A.ROUND[cI.boost.kind]and math.max(b8+1,math.floor(pW+0.5))or pW
end end return cI.boost.kind,b8,cI.boost.every end function A.stats(xC)local b9,jy={},{}for C4,pX in ipairs(xC)do
local aP,f4,pY=A.value(pX.name,pX.variant or"")if aP then if aP:sub(1,6)=="social"then jy[aP]=math.max(jy[aP]or 0,f4)
elseif aP=="waxStir"or aP=="cashGift"then b9[aP]=(b9[aP]or 0)+f4*60/(pY or 60)elseif aP=="luckyPull"then b9 .luckyPull=(b9 .luckyPull or 0)+f4/(pY or 10)
else b9[aP]=(b9[aP]or 0)+f4 end end end return b9,jy end function A.glazeGain(xD,f5)local dX,jz,C5={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local xE=dX[1]+dX[2]+dX[3]local xF=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local cJ={}for f6=1,3 do cJ[f6]=dX[f6]+xD*dX[f6]/xE+(f6==1 and xF or 0)end
local jA={cJ[1]*(1-f5),cJ[2]*(1-f5)+cJ[1]*f5,cJ[3]+cJ[2]*f5}return jA[1]*(jz[1]-1)+jA[2]*(jz[2]-1)+jA[3]*(jz[3]-1)
end function A.score(f7,xG)local jB=A.caps()local f8,f9=A.stats(xG)local function bB(pZ)return math.min(f8[pZ]or 0,jB[pZ]or math.huge)end
local xH=(1+bB("income"))*(1+(f9 .socialIncome or 0))*(1+math.min(f8 .cashGift or 0,jB.cashGiftPerMinute or 9)/60)
local xI=1+bB("luck")+(f8 .luckyPull or 0)+(f9 .socialLuck or 0)local p0=xI*(1+bB("newFind"))local dY=math.log(xH)
local xJ=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local jC=(1+bB("waxSpeed")+bB("longWax"))*(1+(f9 .socialWax or 0))
+math.min(f8 .waxStir or 0,jB.waxStirPerMinute or 30)/60/xJ local xK=1-(1-bB("headStart"))*(1-(f9 .socialHeadStart or 0))
if f7=="farm"then return dY+0.7*math.log(p0)+0.1*math.log(jC)end if f7=="full"then return dY+0.4*math.log(jC)+0.02*math.log(p0)end
if f7=="glaze"then return A.glazeGain(bB("glaze"),bB("glazeUp"))+0.001*dY end if f7=="wax"then return-math.log(1-0.5*xK)+0.001*dY+0.001*math.log(jC)end
return dY end function A.best(p1,cK,xL,jD)jD=jD or{}local ay,dZ={},{}local function p2(xM)local p3={}for xN,xO in ipairs(xM)do p3[xN]=cK[xO]end return p3 end
local function jE(p4)local jF=A.score(p1,p2(p4))for C6,xP in ipairs(p4)do if jD[cK[xP].id]then jF=jF+1e-7 end end
return jF end for C7=1,math.min(xL,#cK)do local f_,jG for jH=1,#cK do if not dZ[jH]then ay[#ay+1]=jH local p5=jE(ay)
ay[#ay]=nil if not jG or p5>jG+1e-12 then f_,jG=jH,p5 end end end if not f_ then break end dZ[f_]=true ay[#ay+1]=f_
end for C8=1,6 do task.wait()local p6,p7=false,jE(ay)for jI=1,#ay do for jJ=1,#cK do if not dZ[jJ]then local p8=ay[jI]
ay[jI]=jJ local p9=jE(ay)if p9>p7+1e-9 then dZ[p8],dZ[jJ],p7,p6=nil,true,p9,true else ay[jI]=p8 end end end end
if not p6 then break end end local p_={}for xQ,xR in ipairs(ay)do p_[xQ]=tostring(cK[xR].id)end return p_,A.score(p1,p2(ay))
end function A.count(qa,qb,xS)local d0,d1={},0 local qc,qd={},{}for C9,xT in ipairs(qb.arriving or{})do qc[tostring(xT)]=true end
for C_,cL in ipairs(qb.pets or{})do qd[tostring(cL.id)]=true if cL.name==qa and not qc[tostring(cL.id)]then if cL.variant=="Big"then d1=d1+1 elseif(cL.variant or"")==""then d0[#d0+1]=cL end
end end if not xS then for Da,d2 in ipairs(l.recent or{})do if d2 .name==qa and not qd[d2 .id]and x()-d2 .at<20 then
if d2 .variant=="Big"then d1=d1+1 else d0[#d0+1]=d2 end end end end return d0,d1 end function A.goal(xU)local qe=d.Pets[xU]return qe and tonumber(qe.f)or 0 end
function A.wantMore(qf,xV,qg)local jK=A.goal(qf)if jK<=0 or not qg then return true end local xW,qh=A.count(qf,qg)
if qh>=jK then return false end if xV=="Big"then return true end return#xW<A.need()*(jK-qh)end function A.status(qi,qj)
local ga=A.goal(qi)if ga<=0 or not qj then return nil end local xX,jL=A.count(qi,qj)if jL>=ga then return("Big %d/%d done"):format(jL,ga)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#xX,A.need()),A.need(),jL,ga)end function A.wear(jM)local jN={}
for Db,xY in ipairs(jM)do jN[tostring(xY)]=true end for Dc=1,3 do local cM=l.data()if not cM then return false end
for Dd,qk in ipairs(cM.equipped or{})do if not jN[tostring(qk)]then l.call("unequip",qk)task.wait(0.3)end end
cM=l.data()local ql={}for De,xZ in ipairs(cM.equipped or{})do ql[tostring(xZ)]=true end for Df,qm in ipairs(jM)do
if not ql[tostring(qm)]then l.call("equip",qm)task.wait(0.3)end end task.wait(0.4)cM=l.data()local jO,qn=0,true
for Dg,x0 in ipairs(cM.equipped or{})do jO=jO+1 if not jN[tostring(x0)]then qn=false end end if qn and jO==#jM then return true end
end return false end function A.saveTeam(qo,qp)if not A.wear(qp)then return false,"could not put the pets on"end
local x1=y.teams()local b_ for x2,x3 in ipairs(x1)do if x3 .name==qo then b_=x2 break end end local cN if b_ then
cN=l.call("teamSave",b_)else cN=l.call("teamNew")if type(cN)=="table"and cN.ok and cN.index then b_=cN.index task.wait(0.3)
l.call("teamRename",{index=b_,name=qo})end end task.wait(0.4)local jP=l.data()local qq=jP and jP.teams and b_ and jP.teams[b_]
if not qq then return false,"the game did not save it"end local qr={}for Dh,x4 in ipairs(qq.pets or{})do qr[tostring(x4)]=true end
for Di,x5 in ipairs(qp)do if not qr[tostring(x5)]then return false,"saved, but not with these pets"end end return true
end A.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function A.quiet()
if y.placing or y.glazeSoon()then return false end local x6=l.srv()for Dj,x7 in ipairs(y.list or{})do if x7 .ends-x6<(d.GlazeLead or 45)+90 then return false end end
return true end function A.plan()local d3=l.data()if not d3 then return{}end local qs={}for Dk,x8 in ipairs(d3 .arriving or{})do qs[tostring(x8)]=true end
local d4={}for Dl,gb in ipairs(d3 .pets or{})do if not qs[tostring(gb.id)]then d4[#d4+1]={id=tostring(gb.id),name=gb.name,variant=gb.variant or""}end
end local qt={}for Dm,qu in ipairs(d4)do qt[qu.id]=qu end local qv=tonumber(d3 .slots)or 3 local jQ,qw={},{}for Dn,gc in ipairs(A.ROLES)do
local d5=d[gc[1]]if d5~=""and not qw[d5]then qw[d5]=true local jR,d6,qx={},{},false for Do,qy in ipairs(d3 .teams or{})do
if qy.name==d5 then for Dp,x9 in ipairs(qy.pets or{})do local jS=qt[tostring(x9)]if jS then jR[jS.id]=true d6[#d6+1]=jS else qx=true end
end end end local jT,qz=A.best(gc[2],d4,qv,jR)local qA=A.score(gc[2],d6)local qB=#jT==#d6 for Dq,x_ in ipairs(jT)do if not jR[x_]then qB=false end end
if not qB and(qx or#d6<math.min(qv,#d4)or qz>qA+1e-4)then jQ[#jQ+1]={team=d5,role=gc[2],ids=jT,gain=qz-qA}end
end end return jQ end function A.rebuild(ya)local qC=A.plan()if#qC==0 then A.buildMsg="teams are already the best your pets allow"return true end
if not A.quiet()then A.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end y.editing,y.editingSince=true,x()
local gd=true local ye,yf=pcall(function()for Dr,d7 in ipairs(qC)do local yb,yc=A.saveTeam(d7 .team,d7 .ids)local qD=l.data()
local jU={}for Ds,yd in ipairs(d7 .ids)do for Dt,jV in ipairs(qD and qD.pets or{})do if tostring(jV.id)==yd then jU[#jU+1]=l.nice(jV.name,jV.variant)end
end end if yb then z(("TEAM %s rebuilt (%s): %s"):format(d7 .team,ya or"pets changed",table.concat(jU,", ")))
else gd=false z(("TEAM %s: %s"):format(d7 .team,tostring(yc)))end end end)y.editing,y.nextTry=false,0 if not ye then gd=false z("TEAM BUILD ERR "..tostring(yf))end
A.builds=A.builds+1 A.buildMsg=gd and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"
return gd end function A.fuseTick()if not d.AutoFuse or y.editing then return end local ge=l.data()if not ge then return end
local jW=A.need()local jX,gf={},{}for Du,yg in ipairs(ge.teams or{})do for Dv,yh in ipairs(yg.pets or{})do jX[tostring(yh)]=true end end
for Dw,yi in ipairs(ge.equipped or{})do gf[tostring(yi)]=true end A.failUntil=A.failUntil or{}for ca,yj in pairs(d.Pets)do
local qE=tonumber(yj.f)or 0 local jY,yk=A.count(ca,ge,true)if qE>0 and yk<qE and#jY>=jW and x()>=(A.failUntil[ca]or 0)then
table.sort(jY,function(gg,gh)local qF=(gf[tostring(gg.id)]and 4 or 0)+(jX[tostring(gg.id)]and 2 or 0)+(gg.named and 1 or 0)
local qG=(gf[tostring(gh.id)]and 4 or 0)+(jX[tostring(gh.id)]and 2 or 0)+(gh.named and 1 or 0)if qF~=qG then return qF<qG end
return tostring(gg.id)<tostring(gh.id)end)local gi,jZ={},{}for gj=1,jW do gi[gj]=tostring(jY[gj].id)if gf[gi[gj]]then jZ[#jZ+1]=gi[gj]end
end y.editing,y.editingSince=true,x()for Dx,yl in ipairs(jZ)do l.call("unequip",yl)task.wait(0.3)end local gk=l.call("fuse",{ids=gi})
y.editing,y.nextTry=false,0 if type(gk)=="table"and gk.ok then A.fused=A.fused+1 A.dirtyAt=x()z(("FUSED %d %s -> Big %s"):format(jW,l.nice(ca),l.nice(ca)))
A.fuseMsg=("fused a Big %s %s"):format(l.nice(ca),os.date("%H:%M"))else A.failUntil[ca]=x()+120 z(("fuse %s failed: %s"):format(l.nice(ca),type(gk)=="table"and tostring(gk.reason or"no reason given")or"no answer"))
end return end end end function A.tick()pcall(A.fuseTick)if not d.AutoBuild or not d.Teams then return end local qH=l.data()
if not qH then return end local cb={}for Dy,ym in ipairs(qH.pets or{})do cb[#cb+1]=tostring(ym.id)end table.sort(cb)
cb=table.concat(cb,",")if cb~=A.sig then A.sig,A.dirtyAt=cb,x()end local yn=(A.dirtyAt and x()-A.dirtyAt>8)or x()-(A.lastBuild or 0)>900
if yn and not y.editing then local yo=A.rebuild(A.dirtyAt and"pets changed"or"check")if yo then A.dirtyAt,A.lastBuild=nil,x()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(cc)return cc:IsA("ParticleEmitter")or cc:IsA("Trail")or cc:IsA("Beam")or cc:IsA("Fire")or cc:IsA("Smoke")
or cc:IsA("Sparkles")or cc:IsA("Light")end function j.muteOne(aG)if not d.Lite or not aG.Parent then return end
local gl=(aG:IsA("BillboardGui")and j.bb)or(j.isFx(aG)and j.fx)or nil if not gl or gl[aG]~=nil then return end
gl[aG]=aG.Enabled if aG.Enabled then aG.Enabled=false end j.watch[aG]=aG:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aG.Enabled then gl[aG]=true aG.Enabled=false end end)end function j.lite(qI)d.Lite=qI if qI then
task.spawn(function()for yp,yq in ipairs(as:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,yq)
if yp%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=V(as.DescendantAdded:Connect(function(j0)
if d.Lite and(j0:IsA("BillboardGui")or j.isFx(j0))then j.queue[#j.queue+1]=j0 end end))end local j1=game:GetService("Lighting")
for Dz,d8 in ipairs(j1:GetChildren())do if d8:IsA("PostEffect")and d8 .Enabled and j.post[d8]==nil then j.post[d8]=true d8 .Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and j1 .GlobalShadows or j.oldShadows j1 .GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and as.Terrain.Decoration or j.oldDeco as.Terrain.Decoration=false end)
else for DA,yr in pairs(j.watch)do pcall(function()yr:Disconnect()end)end for qJ,ys in pairs(j.bb)do pcall(function()if qJ.Parent then qJ.Enabled=ys end end)end
for qK,yt in pairs(j.fx)do pcall(function()if qK.Parent then qK.Enabled=yt end end)end for qL in pairs(j.post)do pcall(function()if qL.Parent then qL.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local yu=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()yu.GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()as.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(qM)d.HideHud=qM local j2=F:FindFirstChildOfClass("PlayerGui")if not j2 then return end if qM then
for DB,d9 in ipairs(j2:GetChildren())do if d9:IsA("ScreenGui")and not j.MINE[d9 .Name]and d9 .Enabled then j.hud[d9]=true d9 .Enabled=false end
end if not j.hudConn then j.hudConn=V(j2 .ChildAdded:Connect(function(d_)if d.HideHud and d_:IsA("ScreenGui")and not j.MINE[d_.Name]then
task.defer(function()if d.HideHud and d_.Enabled then j.hud[d_]=true d_.Enabled=false end end)end end))end else
for qN in pairs(j.hud)do pcall(function()if qN.Parent then qN.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(j3)d.FpsCap=j3 local qO=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not qO then return false end return pcall(qO,j3==0 and 60 or j3)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(am)if am:IsA("BasePart")or am:IsA("Decal")or am:IsA("Texture")then if am.Transparency<1 then j.unseen[am]=am.Transparency am.Transparency=1 end
elseif am:IsA("BillboardGui")or am:IsA("SurfaceGui")or am:IsA("ParticleEmitter")or am:IsA("Beam")or am:IsA("Trail")or am:IsA("Light")or am:IsA("Fire")or am:IsA("Smoke")or am:IsA("Sparkles")then
if am.Enabled then j.unseen[am]=true am.Enabled=false end end end function j.notMine(yv)return d.HideMine or(c.plot and not yv:IsDescendantOf(c.plot))end
j.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}function j.basesMode()return d.HideBases and(d.HideMine and 2 or 1)or 0 end
function j.setBases(qP)if d.HideBases then j.bases(false)end d.HideMine=qP==2 if qP>0 then j.bases(true)end end
function j.bases(qQ)d.HideBases=qQ local j4=as:FindFirstChild("Plots")if not j4 then return end if qQ then task.spawn(function()
local j5=0 for DC,qR in ipairs(j4:GetChildren())do if qR~=c.plot or d.HideMine then for DD,yw in ipairs(qR:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,yw)j5=j5+1 if j5%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=V(j4 .DescendantAdded:Connect(function(qS)if d.HideBases and j.notMine(qS)then task.defer(function()pcall(j.hideOne,qS)end)end
end))end else for j6,qT in pairs(j.unseen)do pcall(function()if not j6 .Parent then return end if type(qT)=="number"then j6 .Transparency=qT else j6 .Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(qU)d.NoRender=qU pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not qU)end)
end function j.restoreAll()pcall(j.unpin)if d.HideBases then pcall(j.bases,false)end if E.arPaused then pcall(E.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(qV)if c.rejoining then return end z("REJOIN this server ("..qV..")")
pcall(eX)if c.autoload then pcall(fm,c.autoload)end nh()local yx=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then dn(qV..", same server failed")end end)return yx end function j.tick()
local j7=j.queue if d.Lite and j7 and#j7>0 then j.queue={}for yy,yz in ipairs(j7)do pcall(j.muteOne,yz)if yy%300==0 then task.wait()end end
end local qW=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if qW then for DE,yA in ipairs(qW:GetChildren())do
local qX=yA:FindFirstChild("SquishyPlaceHolder")local cd=qX and qX:FindFirstChild("TimerGui")if cd and cd:IsA("BillboardGui")then
if j.bb[cd]==nil then pcall(j.muteOne,cd)elseif cd.Enabled then j.bb[cd]=true cd.Enabled=false end end end end
local yB,ea=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if yB and type(ea)=="number"then
j.mem=ea j.memPeak=math.max(j.memPeak,ea)if(d.MemLimit or 0)>0 and ea>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(ea,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if x()-(j.noteAt or 0)>1800 then j.noteAt=x()z(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function j8(gm)if type(gm)~="string"then return false end
gm=gm:lower()for DF,yC in ipairs(c.sellWords)do if gm:find(yC,1,true)then return true end end return false end
local function yD()local qY=aj:FindFirstChild("Remotes")local j9=qY and qY:FindFirstChild("SellSquishy")if not(j9 and j9:IsA("RemoteEvent"))then return false end
if not pcall(function()j9:FireServer()end)then return false end return ao(function()return ac()==nil end,1.5)
end local function yE()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local qZ=au()local q0=qZ and qZ.HumanoidRootPart.Position local eb,q1 for DG,cO in ipairs((c.plot or as):GetDescendants())do
if cO:IsA("ProximityPrompt")and(j8(cO.ActionText)or j8(cO.ObjectText)or j8(cO.Name))then local q2=mf(cO)local j_=(q2 and q0)and(q2-q0).Magnitude or 1e9
if j_<=400 and(not eb or j_<q1)then eb,q1=cO,j_ end end end c.sellSpot=eb c.noSellSpot=(eb==nil)return eb end
local function q3()local ka=ac()if not ka then c.holding=false return false end if aI(ka)then return false end
local kb=ah(aa(ka))if yD()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
z("SOLD "..kb)return true end local cP=yE()if cP then local q4=da(cP)if q4 then cy(q4,cP)local q5=ac()if q5 and not aI(q5)then
local yF,yG=dt(cP,function()return ac()==nil end,function()return cP.Enabled end)if yF then c.sold,c.holding,c.sellFails=c.sold+1,false,0
z(("SOLD %s at %s via %s"):format(kb,eS(cP),yG))return true end end end end c.sellFails=c.sellFails+1 z("could not sell "..kb.." ("..c.sellFails..")")
return false end local yH={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function yI(cQ)local gn=eS(cQ):lower()for DH,yJ in ipairs(yH)do if gn:find(yJ,1,true)then return 0 end end
local a0,ap=cQ.Name:lower(),0 local function aQ(yK,yL)return yK:find(yL,1,true)~=nil end if aQ(a0,"collect")then ap=ap+60 end
if aQ(a0,"cash")or aQ(a0,"money")then ap=ap+45 end if aQ(a0,"income")or aQ(a0,"claim")then ap=ap+35 end if aQ(a0,"coin")or aQ(a0,"earn")or aQ(a0,"green")then ap=ap+20 end
if a0=="pad"or a0=="touch"then ap=ap+25 end if ap==0 and(aQ(gn,"collect")or aQ(gn,"cash")or aQ(gn,"money"))then ap=25 end
if ap==0 then return 0 end local ec=cQ.Color if ec.G>0.5 and ec.G>ec.R*1.4 and ec.G>ec.B*1.4 then ap=ap+15 end
if math.min(cQ.Size.X,cQ.Size.Y,cQ.Size.Z)<2 then ap=ap+5 end return ap end local function yM()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local go,ed,kc={},nil,29 for DI,gp in ipairs(c.plot:GetDescendants())do
if gp:IsA("BasePart")then local gq=yI(gp)if gq>0 then go[#go+1]={s=gq,p=gp}if gq>kc then ed,kc=gp,gq end end end
end table.sort(go,function(yN,yO)return yN.s>yO.s end)c.padCands,c.padPart=go,ed if ed then z("collect pad: "..eS(ed).." (score "..kc..")")end
return ed end local kd="SAB_pad_v1.txt"local function yP(yQ)if type(writefile)=="function"then pcall(writefile,kd,table.concat({yQ:GetComponents()},","))end
end local function yR()if type(isfile)~="function"or type(readfile)~="function"then return nil end local yS,q6=pcall(function()if isfile(kd)then return readfile(kd)end end)
if not yS or type(q6)~="string"then return nil end local gr={}for yT in q6:gmatch("[^,]+")do gr[#gr+1]=tonumber(yT)end
if#gr==12 then return CFrame.new(unpack(gr))end end local function yU(ke,gs,yV)local yW=cx(ke)local kf=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aR=(kf and kf:IsA("BasePart"))and(kf.Position-gs)or Vector3 .new(1,0,0)aR=Vector3 .new(aR.X,0,aR.Z)if aR.Magnitude<0.05 then aR=Vector3 .new(1,0,0)end
aR=aR.Unit for yX=0,7 do local gt=yX*math.pi/4 local yY=Vector3 .new(aR.X*math.cos(gt)-aR.Z*math.sin(gt),0,aR.X*math.sin(gt)+aR.Z*math.cos(gt))
local gu=gs+yY*(yV+5)local kg=fu(gu.X,gs.Y,gu.Z)if kg and math.abs(kg.Y-gs.Y)<8 then aC(ke,Vector3 .new(gu.X,kg.Y+yW,gu.Z))
if io(ke,0.7)then return true end end end return false end local function yZ()c.lastCollect=x()local ee=au()if not ee then return end
local q7,y0=ee.HumanoidRootPart,cx(ee)local ef,q8,eg,kh=nil,4,nil,"?"local ki=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and ki and ki:IsA("BasePart")then ef,kh=(ki.CFrame*c.manualPad).Position,"manual pad"else local be=yM()
if be then ef=Vector3 .new(be.Position.X,be.Position.Y+be.Size.Y/2+y0,be.Position.Z)q8,eg,kh=math.max(be.Size.X,be.Size.Z)/2,be,be.Name
end end if not ef then z("COLLECT: pad not found - stand on it and tap SET PAD")return end local kj=a6()aC(ee,ef)
if eg and type(firetouchinterest)=="function"then pcall(firetouchinterest,q7,eg,0)end af(d.PadDwell)if eg and type(firetouchinterest)=="function"then pcall(firetouchinterest,q7,eg,1)end
af(0.5)c.collected=c.collected+1 local kk=a6()z(("COLLECTED (%s) %s"):format(kh,(kj and kk and kk>kj)and("+$"..aJ(kk-kj))or"no cash change seen"))
yU(ee,ef,q8)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return d.AutoIndex or(d.Best or 0)>0 or d.BestCrate end function q.mods()if q.si and x()-q.modAt<120 then return true end
local q9=aj:FindFirstChild("Modules")if not q9 then return false end local function kl(y1)local q_=q9:FindFirstChild(y1)
if not q_ then return nil end local y2,ra=pcall(require,q_)return(y2 and type(ra)=="table")and ra or nil end q.si,q.arm,q.ci=kl("SquishyInfo"),kl("AutoRollRules"),kl("CrateInfo")
q.modAt=x()if not q.si then return false end local km={}if q.arm and type(q.arm.tierOf)=="table"then for kn in pairs(q.arm.tierOf)do if q.si[kn]then km[aa(kn)]=kn end end
end q.roll=km local gv={}for y3,y4 in pairs(km)do local eh=q.si[y4]if type(eh)=="table"and type(eh.income)=="number"and not eh.incomeType then
gv[#gv+1]={k=y3,inc=eh.income,pr=tonumber(eh.price)or 0}end end table.sort(gv,function(ko,kp)if ko.inc~=kp.inc then return ko.inc>kp.inc end return ko.pr>kp.pr end)
q.order=gv local gw,kq,kr local y5=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for y6,ks in pairs(y5)do
local kt=type(ks)=="table"and tonumber(ks.price)if kt and(not kq or kt>kq)then gw,kq,kr=y6,kt,ks.title end end
q.bestCrate,q.bestCrateName=gw and L.key(gw),gw q.bestCrateTitle=kr and L.key(kr)or nil return true end function q.rank(y7)
local y8,y9=pcall(function()return q.arm.rankOf(y7)end)return(y8 and tonumber(y9))or 0 end function q.loadDisc(rb)
if type(rb)~="table"then return end local rc={}for y_,za in pairs(rb)do if za then rc[aa(tostring(y_))]=true end end
q.disc,q.discAt=rc,x()end function q.fetch()q.discAt=x()local rd=aj:FindFirstChild("Remotes")local re=rd and rd:FindFirstChild("GetSquishiesDiscovered")
if not re then return end local zb,zc=pcall(function()return re:InvokeServer()end)if zb then q.loadDisc(zc)end
end function q.scanWax()local ku={}local rf=c.plot and c.plot:FindFirstChild("WaxStations")if rf then for DJ,rg in ipairs(rf:GetChildren())do
local rh=rg:FindFirstChild("SquishyPlaceHolder")if rh and rg:GetAttribute("HasSquishy")then for DK,ri in ipairs(rh:GetChildren())do if ri:IsA("Model")then ku[aa(ri.Name)]=true end end
end end end for rj,zd in pairs(q.placedAt)do if x()-zd<20 then ku[rj]=true else q.placedAt[rj]=nil end end q.waxing=ku
end function q.compute()local rk,kv,kw={},0,0 if q.disc then for kx in pairs(q.roll or{})do if not q.disc[kx]then
if q.waxing[kx]then kw=kw+1 else rk[kx],kv=true,kv+1 end end end end q.need,q.nNeed,q.nWax=rk,kv,kw local rl={}
for ze=1,math.min(d.Best or 0,#q.order)do rl[q.order[ze].k]=true end q.best=rl end function q.want(ky)if(d.Best or 0)>0 and next(q.best)then
if q.best[ky]then return true end elseif d.Targets[ky]then return true end return d.AutoIndex==true and q.need[ky]==true
end function q.any()return next(d.Targets)~=nil or((d.Best or 0)>0 and next(q.best)~=nil)or(d.AutoIndex and next(q.need)~=nil)
end function q.placed(zf)local ei=aa(zf)q.placedAt[ei],q.waxing[ei]=x(),true if q.need[ei]then q.need[ei],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
z(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ah(ei)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local ej,ek={},{}for zg,zh in pairs(q.roll or{})do if q.want(zg)then ej[zh]=true end end
for rm,kz in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(rm)or(type(kz)=="table"and type(kz.title)=="string"and L.wanted(kz.title))then ek[rm]=true end
end if not next(ej)and not next(ek)then return nil end if q.arm and type(q.arm.encode)=="function"then local zi,rn=pcall(q.arm.encode,{rarities={},butters=ej,crates=ek,index=false})
if zi and type(rn)=="string"then return rn end end local function ro(zj)local gx={}for zk in pairs(zj)do gx[#gx+1]=zk end table.sort(gx)return table.concat(gx,",")end
local el="adv:"if next(ej)then el=el..";butters:"..ro(ej)end if next(ek)then el=el..";crates:"..ro(ek)end return el
end function q.canon(zl)local gy={}for rp in tostring(zl or""):gmatch("[^;]+")do local kA,rq=rp:match("^(%a+):(.*)$")
if not kA then kA,rq="r",rp:gsub("^adv:","")end for zm in rq:gmatch("[^,]+")do gy[#gy+1]=kA.."="..zm end end table.sort(gy)
return table.concat(gy,"|")end function q.sync(zn)if F:GetAttribute("AutoRoll")~=true then return end if x()<(q.pauseUntil or 0)then return end
local ce=q.rulesNow()if not ce or#ce>1900 then return end if q.canon(F:GetAttribute("AutoRollRules"))==q.canon(ce)then q.fails=0 return end
if not zn and x()-q.sentAt<4 then return end local rr=aj:FindFirstChild("Remotes")local rs=rr and rr:FindFirstChild("AutoRollAction")
if not rs then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,x()+300 z("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=x()C.replaying=true pcall(function()rs:FireServer("Rules",ce)end)C.replaying=false d.ARrules=ce
local gz,gA=0,0 for DL in(ce:match("butters:([^;]*)")or""):gmatch("[^,]+")do gz=gz+1 end for DM in(ce:match("crates:([^;]*)")or""):gmatch("[^,]+")do gA=gA+1 end
local rt=gz.."/"..gA if q.told~=rt then q.told=rt z(("auto roll now stops on %d butters and %d crates"):format(gz,gA))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if x()-q.discAt>30 then q.fetch()end
q.scanWax()q.compute()if q.on()then q.sync(false)end local a1={}if d.AutoIndex then a1[#a1+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if(d.Best or 0)>0 and q.order[1]then a1[#a1+1]="best: "..ah(q.order[1].k)end
if d.BestCrate and q.bestCrateName then a1[#a1+1]="crate: "..q.bestCrateName end if Q.got>0 then a1[#a1+1]="shower: "..Q.got end
q.msg=#a1>0 and table.concat(a1," | ")or"index / best: off"end q.heard={}function q.admin(zo,aS,gB)if zo~="Effect"then return end
if aS=="Shower"then Q.add(gB)return end if aS=="ShowerTaken"then Q.gone(gB)return end if aS=="ShowerClear"then Q.drops={}return end
if aS=="WaxGlow"then local kB=type(gB)=="table"and tonumber(gB.SnapAt)if kB then q.snapAt=kB z(("ADMIN: every wax finishes in %ds%s"):format(math.floor(kB-l.srv()),(d.Teams and d.TeamGlaze~="")and" - glaze team on for it"or""))
end return end aS=tostring(aS)bT("Admin "..aS)if aS~="GoalPoint"and x()-(q.heard[aS]or-100)>30 then q.heard[aS]=x()
z("ADMIN: "..aS)end end Q.drops,Q.tried,Q.got,Q.miss={},{},0,0 function Q.add(kC)if type(kC)~="table"or type(kC.Pieces)~="table"then return end
for DN,aT in pairs(kC.Pieces)do if type(aT)=="table"and aT.Id~=nil and aT.Position~=nil then Q.drops[aT.Id]={id=aT.Id,butter=tostring(aT.Butter or"?"),rar=tostring(aT.Rarity or"?"),star=aT.Star==true,
pos=aT.Position,opens=tonumber(aT.OpensAt)or 0,ends=tonumber(aT.ExpiresAt)or 0}end end end function Q.gone(em)
if type(em)~="table"or em.Id==nil then return end Q.drops[em.Id]=nil if tonumber(em.UserId)==l.uid then Q.mine=em.Id end
end function Q.pick()local kD=l.srv()local kE,ru for rv,cf in pairs(Q.drops)do if kD>=cf.ends-0.3 then Q.drops[rv]=nil
elseif kD>=cf.opens-0.2 and(Q.tried[rv]or 0)<3 then local rw=(aI(cf.butter)and 1e6 or 0)+(cf.star and 1e5 or 0)+q.rank(cf.rar)*100-(cf.ends-kD)
if not kE or rw>ru then kE,ru=cf,rw end end end return kE end function Q.due()return d.Shower and c.running and next(Q.drops)~=nil and not ac()and Q.pick()~=nil
end function Q.grab()local aL,kF=Q.pick(),au()if not(aL and kF)then return end Q.tried[aL.id]=(Q.tried[aL.id]or 0)+1
if j.hold then pcall(j.unpin,true)end aC(kF,aL.pos+Vector3 .new(0,cx(kF)+0.5,0))ao(function()return Q.mine==aL.id or ac()~=nil or not Q.drops[aL.id]end,1.5)
if Q.mine==aL.id or ac()then Q.got,Q.drops[aL.id]=Q.got+1,nil z(("GRABBED %s [%s]%s from the admin shower"):format(ah(aa(aL.butter)),aL.rar,aL.star and" (star)"or""))
elseif not Q.drops[aL.id]then Q.miss=Q.miss+1 end end local en local function rx()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 z("trying again after being stopped for 5 minutes")en(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not au()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bn(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local kG,ry=eU()
local gC=ac()if gC then local cR=ah(aa(gC))if not aI(gC)then local kH=(W.gift and aa(W.gift)==aa(gC)and x()-W.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cR,kH),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cR,kH),"bad"end return"sell",("selling %s (%s)"):format(cR,kH),"warn"
end if kG<1 then return nil,("holding %s - 0 free stations"):format(cR),"wait"end if y.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cR),"wait"end
return"place",("waxing %s (%d free)"):format(cR,kG),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local kI=c.plot:FindFirstChild("CrateStand")if kI then for DO,eo in ipairs(kI:GetDescendants())do
if eo:IsA("ProximityPrompt")and eo.Enabled and iE(eo)then local bf=eo.ObjectText if bf==""then bf=cq(kI,"TitleLabel")or""end
if bf~=""and L.wanted(bf)then local zp=eQ(bf):gsub("crate$","")local rz for rA in pairs(ad.members)do if eQ(rA)==zp then rz=rA end end
e.waiting,e.at,e.title,e.prompt=true,x(),bf,eo e.data={name=(bf:gsub("%s","")),rarity=rz,title=bf}z(bf.." found waiting on your stand")
end break end end end end local rB=L.wanted(e.data and e.data.name)or L.wanted(e.title)if d.Crates and(e.on or e.waiting)and rB then
local bh=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(bh),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 z("could not press the "..bh.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(bh),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(bh),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
bh,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(bh),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(bh),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(bh),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(bh,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not rB then local rC=e.title..tostring(e.rolledAt)if e.told~=rC then e.told=rC z(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and L.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if kG<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(ry,ry),"wait"
end local kJ=mt()if not kJ then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local ep=bS()
if ep and nR(ep.name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(ep.name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(ep.name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(ep.name),"ok"
end local bC=il()if bC.state~="match"then c.matchSince=nil if bC.state=="skip"and not kJ.Enabled then return nil,bC.text.." (sold out)","idle"end
return nil,bC.text,bC.level end if not kJ.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local eq=x()if eq<c.noCashUntil then local rD,zq=nq()if rD then return nil,("cash short: have $%s, price ~$%s"):format(aJ(rD),aJ(zq)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aJ(a6()),math.ceil(c.noCashUntil-eq)),"bad"end if eq-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or eq local rE=eq-c.matchSince if rE<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bC.shown,rE),"ok"end
return"buy",("buying %s via %s"):format(bC.shown,bC.src),"ok"end j.DEPTH=11 function j.pinTick()local rF=j.hold
if not rF then return end local kK=F.Character local kL=kK and kK:FindFirstChild("HumanoidRootPart")if not kL then return end
kL.CFrame=rF kL.AssemblyLinearVelocity=Vector3 .new(0,0,0)for DP,gD in ipairs(kK:GetChildren())do if gD:IsA("BasePart")and gD.CanCollide then j.noclip[gD]=true gD.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(zr,rG)j.hold=zr if rG then j.surface=rG end end function j.unpin(zs)
if not j.hold then return end j.hold=nil for rH in pairs(j.noclip)do pcall(function()if rH.Parent then rH.CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local rI=au()if rI and j.surface and not zs then aC(rI,j.surface.Position,j.surface.Position+j.surface.LookVector)
af(0.1)end end function j.home()local bi,rJ=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),au()
if not(bi and bi:IsA("BasePart")and rJ)then return nil end local rK=mi()or bi.Position local gE=Vector3 .new(rK.X-bi.Position.X,0,rK.Z-bi.Position.Z)
gE=gE.Magnitude>0.1 and gE.Unit or Vector3 .new(0,0,1)local gF=bi.Position+gE*6 local rL=fu(gF.X,bi.Position.Y,gF.Z,{bi})
return CFrame.new(gF.X,(rL and rL.Y or bi.Position.Y)+cx(rJ),gF.Z)end function j.ground(zt,rM,zu)local kM,kN={F.Character},nil
for DQ=1,12 do local kO=RaycastParams.new()kO.FilterType=Enum.RaycastFilterType.Exclude kO.FilterDescendantsInstances=kM
local gG=as:Raycast(Vector3 .new(zt,rM,zu),Vector3 .new(0,-2000,0),kO)if not gG then break end kN,rM=gG,gG.Position.Y-0.05
kM[#kM+1]=gG.Instance end return kN and kN.Position.Y end function j.parkHome()local kP=j.home()if not kP then return false end
local cS=kP.Position local zv=j.ground(cS.X,cS.Y+300,cS.Z)or(cS.Y-3)j.pin(CFrame.new(cS.X,zv-8,cS.Z),kP)return true
end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function j.setGhost(gH)d.Ghost,d.GhostHelps=gH==2,gH==1 if gH<2 then task.spawn(function()while c.busy do af(0.1)end
if j.ghostMode()<2 and j.hold and not D.home then pcall(j.unpin)end end)end j.paintGhost()z("ghost: "..j.GHOST[gH][1]:sub(8):lower())
end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end
local zw=au()if not zw or J.seat()then return end j.parkHome()end J.n,J.fails,J.nextAt,J.msg,J.lost=0,0,0,"no campfire right now",0
function J.seat()local rN=F.Character local rO=rN and rN:FindFirstChildOfClass("Humanoid")local kQ=rO and rO.SeatPart
return(kQ and kQ.Name=="LogSeat")and kQ or nil end function J.due()if not(d.Campfire and c.running)or x()<J.nextAt then return false end
local zx=as:FindFirstChild("NightSeats")if not zx then if J.wasOn then J.wasOn,J.fails,J.lost=false,0,0 end J.msg="no campfire (comes with weather events)"
return false end J.wasOn=true if J.seat()then J.sitAt=J.sitAt or x()J.msg=("sitting at the campfire: +%s%% cash"):format(tostring(F:GetAttribute("CampfireBoost")or"?"))
return false end if J.sitAt then J.lost,J.sitAt=J.lost+1,nil if J.lost>=4 then J.nextAt,J.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
z(J.msg)return false end end return true end function J.sit()local rP,gI=as:FindFirstChild("NightSeats"),au()
if not rP or not gI then return end local rQ,cT=gI.HumanoidRootPart.Position,{}for DR,gJ in ipairs(rP:GetChildren())do
local rR=gJ:IsA("Seat")and gJ.Occupant==nil and gJ:FindFirstChildOfClass("ProximityPrompt")if rR then cT[#cT+1]={st=gJ,p=rR}end
end if#cT==0 then J.nextAt,J.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cT,function(zy,zz)return(zy.st.Position-rQ).Magnitude<(zz.st.Position-rQ).Magnitude end)
local zA,zB=cT[1].st,cT[1].p j.unpin(true)local cU=zA.CFrame aC(gI,cU.Position+cU.LookVector*2+Vector3 .new(0,2.5,0),cU.Position)
af(0.25)local zC=dt(zB,function()return J.seat()~=nil end)if not zC then aC(gI,cU.Position+Vector3 .new(0,2,0),cU.Position+cU.LookVector)
ao(function()return J.seat()~=nil end,1.5)end if J.seat()then J.n,J.fails,J.sitAt=J.n+1,0,x()z(("SAT at the campfire (+%s%% cash)"):format(tostring(F:GetAttribute("CampfireBoost")or"?")))
else J.fails=J.fails+1 J.nextAt=x()+(J.fails>=3 and 60 or 5)J.msg="could not sit at the campfire"..(J.fails>=3 and" - trying again in a minute"or"")
if J.fails<=3 then z(J.msg)end end end E.msg,E.nextAt,E.at,E.pulls,E.claims,E.pullLeft,E.collectLeft,E.events="",0,0,0,0,0,0,{}
function E.refresh()E.at=x()local kR=aj:FindFirstChild("Remotes")if not kR then return end local er,kS,cV=0,0,{}
local zD,rS=pcall(function()return kR.ClanRequest:InvokeServer("state")end)local rT=zD and type(rS)=="table"and rS.tasks
for DS,bD in ipairs(rT and rT.list or{})do if not bD.done and bD.kind=="pull"then er=math.max(er,(bD.goal or 0)-(bD.progress or 0))end
if not bD.done then cV[#cV+1]=("%s %d/%d"):format(tostring(bD.text),bD.progress or 0,bD.goal or 0)end end E.events={}
for DT,cW in ipairs(kR:GetChildren())do if cW:IsA("RemoteFunction")and cW.Name:match("^%u%a+Action$")and cW.Name~="CrateAction"and cW.Name~="AutoRollAction"then
local zE,es=pcall(function()return cW:InvokeServer("state")end)if zE and type(es)=="table"and es.live==true and type(es.quests)=="table"then
E.events[#E.events+1]={r=cW,st=es}for DU,aM in ipairs(es.quests)do if not aM.done and aM.kind=="pull"then er=math.max(er,(aM.goal or 0)-(aM.progress or 0))end
if not aM.done and aM.kind=="collect"then kS=math.max(kS,(aM.goal or 0)-(aM.progress or 0))end if not aM.done then cV[#cV+1]=("%s %d/%d"):format(tostring(aM.text),aM.progress or 0,aM.goal or 0)end
end end end end E.pullLeft,E.collectLeft=er,kS E.msg=#cV>0 and("open: "..table.concat(cV,", "))or"all quests done for today"
end function E.claim()for DV,et in ipairs(E.events)do local rU=et.r.Name:gsub("Action$","")for DW,cX in ipairs(et.st.quests)do
if cX.done and not cX.claimed then local zF,rV=pcall(function()return et.r:InvokeServer("claimQuest",cX.id)end)
if zF and not(type(rV)=="table"and rV.ok==false)then E.claims=E.claims+1 z(("CLAIMED %s quest: %s (+%s)"):format(rU,tostring(cX.text),tostring(cX.points or cX.treats or"?")))
end af(0.4)end end if et.st.bonusReady==true then local zG=pcall(function()return et.r:InvokeServer("claimBonus")end)
if zG then z(("CLAIMED %s daily quest bonus"):format(rU))end af(0.4)end end end function E.tick()if not(d.Quests and c.running)then
if E.arPaused then E.resume("quests switched off")end return end if x()-E.at<(E.pullLeft>0 and 20 or 90)then return end
E.refresh()pcall(E.claim)if E.pullLeft<=0 and E.arPaused then E.resume("lever quests done")end end function E.pullDue()
return d.Quests and c.running and E.pullLeft>0 and x()>=E.nextAt and not C.busy end function E.lever()local rW=c.plot and c.plot:FindFirstChild("Lever")
local kT=rW and rW:FindFirstChild("Wheel")return kT and kT:FindFirstChildWhichIsA("ProximityPrompt"),kT end function E.resume(zH)
E.arPaused=false if E.arWas then E.arWas=false d.AutoRoll=true task.spawn(C.apply,zH)end end function E.pull()
local gK,kU=E.lever()if not gK or not kU or not kU:IsA("BasePart")then E.nextAt,E.msg=x()+300,"your lever was not found"return end
if not E.arPaused then E.arPaused=true E.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false C.apply("pulling the lever for a quest",true)
if C.isOn()then E.nextAt=x()+30 return end end z(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(E.pullLeft))
end if not gK.Enabled then E.nextAt=x()+1 return end cy(kU,gK)E.asked=nil nF(gK)E.pulls=E.pulls+1 E.pullLeft=E.pullLeft-1
af(0.6)if E.asked then E.nextAt=x()+600 z(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(E.asked)))
E.resume("a butter the game wants kept is on the pad")return end E.nextAt=x()+2.5 if E.pullLeft<=0 then E.at=0 end
end D.skip,D.skipN,D.n,D.calls,D.fails,D.nextAt,D.msg,D.tries={},0,0,0,0,0,"off",{}function D.can(bE,zI)local kV=bE:GetAttribute("PourOwner")
if type(kV)~="number"or kV==l.uid or not bE:GetAttribute("HasSquishy")then return false end if bE:GetAttribute("PourLong")~=true or bE:GetAttribute("PourFull")==true then return false end
local kW=bE:GetAttribute("PourId")if kW==nil or D.skip[kW]then return false end local rX,kX,zJ=bE:GetAttribute("Helpers"),0,tostring(l.uid)
if type(rX)=="string"then for zK in rX:gmatch("[^,%s]+")do kX=kX+1 if zK==zJ then return false end end end if kX>=6 then return false end
local gL=y.left(bE)if not gL then local rY=tonumber(bE:GetAttribute("PourEnd"))gL=rY and(rY-zI)end if not gL or gL<=75 then return false end
local kY=game:GetService("Players"):GetPlayerByUserId(kV)if not kY or kY:GetAttribute("WaxHelpOff")==true then return false end
return true,kY,kW end function D.list()local kZ,zL={},l.srv()local rZ=as:FindFirstChild("Plots")for DX,r0 in ipairs(rZ and rZ:GetChildren()or{})do
local r1=r0~=c.plot and r0:FindFirstChild("WaxStations")for DY,k0 in ipairs(r1 and r1:GetChildren()or{})do local zM,zN,zO=D.can(k0,zL)
local k1=zM and k0:FindFirstChild("SquishyPlaceHolder")if k1 and k1:IsA("BasePart")then kZ[#kZ+1]={st=k0,p=zN,id=zO,part=k1}end
end end return kZ end function D.due()return d.Help and c.running and x()>=D.nextAt end function D.skipIt(r2,r3)
D.skip[r2],D.skipN=r3,D.skipN+1 if D.skipN>600 then D.skip,D.skipN,D.tries={[r2]=r3},1,{}end end function D.goHome()
local gM,bF=au(),D.home D.home=nil if not(gM and bF)then return end if d.Ghost and not J.seat()then j.unpin(true)
if not j.parkHome()then pcall(aC,gM,bF.Position,bF.Position+bF.LookVector)end elseif j.hold or(gM.HumanoidRootPart.Position-bF.Position).Magnitude>20 then
j.unpin(true)pcall(aC,gM,bF.Position,bF.Position+bF.LookVector)end end function D.step()local k2,eu=D.list(),au()
if#k2==0 or not eu then D.nextAt=x()+15 D.msg=("helped %d waxes here%s | none to help right now"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")
D.goHome()return end local r4=eu.HumanoidRootPart local r5=r4 .Position table.sort(k2,function(zP,zQ)return(zP.part.Position-r5).Magnitude<(zQ.part.Position-r5).Magnitude end)
local aU=k2[1]D.home=D.home or(j.hold and j.surface)or r4 .CFrame local bG=aU.part local ev=(bG.Position+aU.st:GetPivot().Position)/2
local gN=D.tries[aU.id]or 0 if(d.Ghost or d.GhostHelps)and gN==0 and not J.seat()then j.pin(bG.CFrame,D.home)
else j.unpin(true)local k3=gN==0 and fu(ev.X,bG.Position.Y,ev.Z,{bG})if k3 and math.abs(k3 .Y-bG.Position.Y)<8 then
aC(eu,Vector3 .new(ev.X,k3 .Y+cx(eu),ev.Z),bG.Position)else aC(eu,bG.Position+Vector3 .new(0,bG.Size.Y/2+3,0),ev)
end end af(0.3)local ew=aj:FindFirstChild("Remotes")ew=ew and ew:FindFirstChild("ClanRequest")if not ew then D.nextAt,D.msg=x()+60,"the game's help remote is missing"return end
local gO,bj=pcall(function()return ew:InvokeServer("help",aU.st:GetAttribute("PourOwner"),tonumber(aU.st.Name))end)
if gO and type(bj)=="table"and bj.ok then D.n,D.fails=D.n+1,0 D.skipIt(aU.id,"helped")z(("HELPED %s's wax (station %s)"):format(aU.p.DisplayName,aU.st.Name))
D.msg=("helped %d waxes here%s"):format(D.n,D.calls>0 and(", "..D.calls.." for the guild")or"")elseif gO and type(bj)=="table"and tostring(bj.reason or""):lower():find("walk up",1,true)and gN<2 then
D.tries[aU.id]=gN+1 D.nextAt=x()+0.3 elseif gO and type(bj)=="table"and tostring(bj.reason or""):lower():find("moment",1,true)then
D.waits=(D.waits or 0)+1 D.nextAt=x()+1.6 else local r6=(gO and type(bj)=="table"and tostring(bj.reason or"refused"))or("error: "..tostring(bj))
D.skipIt(aU.id,r6)D.fails=D.fails+1 if D.fails<=3 then z(("help refused for %s's wax: %s"):format(aU.p.DisplayName,r6))end
if D.fails>=5 then D.fails,D.nextAt,D.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
D.goHome()end end D.nextAt=math.max(D.nextAt,x()+1.2)end function D.onCall(bk)if not d.HelpGuild or type(bk)~="table"or bk.p~="help"or bk.mine or bk.u==l.uid or not bk.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local ex=aj:FindFirstChild("Remotes")
ex=ex and ex:FindFirstChild("ClanRequest")if not ex then return end local r7,ey=pcall(function()return ex:InvokeServer("callHelp",bk.u)end)
local r8=tostring(bk.n or bk.un or bk.u)if r7 and type(ey)=="table"and ey.ok then D.calls=D.calls+1 z(("HELPED guildmate %s's wax from here (their call)"):format(r8))
else z(("guild call from %s: %s"):format(r8,(r7 and type(ey)=="table"and tostring(ey.reason or"refused"))or tostring(ey)))
end end)end local function aq(zR,r9,...)if c.busy then return end c.busy,c.busyText=true,zR if j.hold and r9~=D.step then pcall(j.unpin)end
local zS,r_=pcall(r9,...)c.busy,c.busyText=false,""if not zS and r_~=hw then z("ERR "..tostring(r_))end end local function zT()
local aV,zU,zV=rx()c.reason,c.level=zU,zV if aV=="place"then aq("waxing...",y.place)elseif aV=="crate"then aq("opening crate...",fH,true)
elseif aV=="cratesmart"then aq("opening crate...",e.smart)elseif aV=="cratewin"then aq("opening the crate window...",iG)
elseif aV=="nocrate"then aq("discarding crate...",fH,false)elseif aV=="sell"then aq("selling...",q3)elseif aV=="buy"then aq("buying...",nI,false)
elseif not aV and not c.matchSince and Q.due()then aq("grabbing a butter from the admin shower...",Q.grab)elseif not aV and not c.matchSince and J.due()then
aq("sitting at the campfire...",J.sit)elseif not aV and not c.matchSince and E.pullDue()and not ac()and not(bS()and aI(bS().name))then
aq("pulling the lever for a quest...",E.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(E.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
aq("collecting money...",yZ)elseif not aV and not c.matchSince and D.due()then aq("helping a wax...",D.step)elseif D.home and not d.Help then
aq("coming back...",D.goHome)elseif not c.busy then j.parkTick()end end function en(gP,zW)if gP==c.running then return end
c.running=gP if not zW then d.AutoStart=gP end if gP then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bn()or c.plot
z("START")else c.reason="stopped"z("STOP")end end do local bH=fg(al.auto)if type(bH)=="string"then bH=bH:gsub("%s+$","")
if bH~=""then c.autoload=bH local zX=nd(bH)z(zX and("loaded config "..bH)or("config "..bH.." could not be loaded"))
end end end local o={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local zY={ok=o.good,wait=o.warn,warn=o.warn,bad=o.bad,idle=o.dim}local sa={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function O(zZ,z0,z1)local z2,k4=pcall(Instance.new,zZ)
if not z2 then c.uiErrs=c.uiErrs+1 return nil end for z3,z4 in pairs(z0)do if not pcall(function()k4[z3]=z4 end)then c.uiErrs=c.uiErrs+1 end
end k4 .Parent=z1 return k4 end local function an(z5,z6)O("UICorner",{CornerRadius=UDim.new(0,z6 or 6)},z5)end
local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"})}function a.put(gQ,k5)if gQ and a.shown[gQ]~=k5 then a.shown[gQ]=k5 gQ.Text=k5 end
end local k6=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local sb=k6:FindFirstChild("SABFarmGui")
if sb then sb:Destroy()end local k7=O("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},k6)
local ak={w=320,h=300,head=28,strip=34,tabs=24}pcall(function()local gR=as.CurrentCamera.ViewportSize if gR.X>100 and gR.Y>100 then
ak.w=math.clamp(math.floor(gR.X*0.44),300,360)ak.h=math.clamp(math.floor(gR.Y*0.84),240,340)end end)a.root=O("Frame",{Name="Root",Size=UDim2 .new(0,ak.w,0,ak.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=o.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},k7)
an(a.root,10)O("UIStroke",{Color=o.line,Thickness=1},a.root)local a2=UDim2 .new(1,0,1,0)local function K(sc,sd)return UDim2 .new(sc,0,0,0),UDim2 .new(sd,(sc+sd>0.99)and 0 or-4,1,0)end
local function H(z7,z8,z9,z_,Aa,Ab)local se=O("TextButton",{Text=z8,Position=Aa,Size=Ab,BackgroundColor3=z9,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=z_,TextColor3=o.text,AutoButtonColor=true},z7)an(se,6)return se end local function gS(Ac,Ad,Ae,Af,Ag)
local k8=O("TextBox",{Text=Ad,PlaceholderText=Ae,Position=Af,Size=Ag,BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=o.text,PlaceholderColor3=o.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Ac)an(k8,6)O("UIPadding",{PaddingLeft=UDim.new(0,8)},k8)
return k8 end local gT=as.CurrentCamera local function Ah()local Ai,gU=pcall(function()return gT and gT.ViewportSize end)
if Ai and gU and gU.X>50 and gU.Y>50 then return gU end end local function bI(ez)local k9=Ah()if not(k9 and ez and ez.Parent)then return end
local Aj=pcall(function()local gV,sf=ez.AbsolutePosition,ez.AbsoluteSize local k_=70 local sh=math.clamp(gV.X,k_-sf.X,k9 .X-k_)
local sj=math.clamp(gV.Y,0,k9 .Y-math.min(sf.Y,k_))if math.abs(sh-gV.X)>0.5 or math.abs(sj-gV.Y)>0.5 then ez.Position=UDim2 .new(0,math.floor(sh),0,math.floor(sj))
end end)return Aj end local function gW(Ak)local Al,la=pcall(function()return Ak.AbsolutePosition end)if Al and la then return{math.floor(la.X),math.floor(la.Y)}end
end local cY={}c.dragMoved={}local function sk(eA,sl,lb)V(eA.InputBegan:Connect(function(cZ)if cZ.UserInputType~=Enum.UserInputType.MouseButton1 and cZ.UserInputType~=Enum.UserInputType.Touch then return end
local lc={start=cZ.Position,from=sl.Position,moved=0,target=sl,input=cZ,onDrop=lb}cY[eA],c.dragMoved[eA]=lc,0
local ld ld=cZ.Changed:Connect(function()if cZ.UserInputState==Enum.UserInputState.End and cY[eA]==lc then cY[eA]=nil
if ld then ld:Disconnect()end if lb then lb(lc.moved)end end end)end))end V(l1 .InputChanged:Connect(function(gX)
if gX.UserInputType~=Enum.UserInputType.MouseMovement and gX.UserInputType~=Enum.UserInputType.Touch then return end
for Am,a3 in pairs(cY)do local le=a3 .target if le and le.Parent then local sm,sn=gX.Position.X-a3 .start.X,gX.Position.Y-a3 .start.Y
a3 .moved=math.max(a3 .moved,math.abs(sm)+math.abs(sn))c.dragMoved[Am]=a3 .moved le.Position=UDim2 .new(a3 .from.X.Scale,a3 .from.X.Offset+sm,a3 .from.Y.Scale,a3 .from.Y.Offset+sn)
end end end))V(l1 .InputEnded:Connect(function(gY)if gY.UserInputType~=Enum.UserInputType.MouseButton1 and gY.UserInputType~=Enum.UserInputType.Touch then return end
for An,gZ in pairs(cY)do if gZ.input==gY or gY.UserInputType==Enum.UserInputType.MouseButton1 then cY[An]=nil
if gZ.onDrop then gZ.onDrop(gZ.moved)end end end end))local function T(Ao,Ap,Aq,Ar,As,At,Au)return O("TextLabel",{Text=Ap,Position=At or UDim2 .new(0,0,0,0),Size=Au or a2,BackgroundTransparency=1,
Font=As and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=Aq,TextColor3=Ar,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Ao)
end a.title=O("Frame",{Size=UDim2 .new(1,0,0,ak.head),BackgroundColor3=o.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=O("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=o.dim,BorderSizePixel=0},a.title)
an(a.dot,5)T(a.title,"SAB  BUTTER FARM  "..cl,12,o.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=H(a.title,"-",o.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=H(a.title,"X",o.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=O("Frame",{Position=UDim2 .new(0,0,0,ak.head),Size=UDim2 .new(1,0,0,ak.strip),BackgroundColor3=o.bg,BorderSizePixel=0},a.root)
a.bar=O("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=o.warn,BorderSizePixel=0},a.strip)
an(a.bar,2)a.reason=T(a.strip,"starting",12,o.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=O("Frame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip),Size=UDim2 .new(1,0,0,ak.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=H(a.tabs,"FARM",o.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=H(a.tabs,"BUTTERS",o.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=H(a.tabs,"CRATES",o.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=H(a.tabs,"PETS",o.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=H(a.tabs,"TEAMS",o.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=H(a.tabs,"SETUP",o.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function c0()local lf=O("ScrollingFrame",{Position=UDim2 .new(0,0,0,ak.head+ak.strip+ak.tabs),Size=UDim2 .new(1,0,1,-(ak.head+ak.strip+ak.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=o.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
O("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},lf)O("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},lf)
return lf end a.farm,a.but,a.set,a.crt=c0(),c0(),c0(),c0()a.pet,a.team=c0(),c0()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local g0,eB,M=0,12,nil local function a4(so,Av)g0,eB=g0+1,eB+so+6 return O("Frame",{Size=UDim2 .new(1,0,0,so),BackgroundTransparency=1,LayoutOrder=g0},Av or a.farm)
end local function sp(Aw)T(a4(14),Aw,10,o.dim,true)end M=a4(32)a.startB=H(M,"START",o.good,14,K(0,0.68))a.killB=H(M,"KILL",o.bad,14,K(0.68,0.32))
do local Ax=a4(40)local function eC(sq,Ay,lg)local lh=O("Frame",{Position=UDim2 .new((sq-1)/lg,0,0,0),Size=UDim2 .new(1/lg,sq<lg and-4 or 0,1,0),
BackgroundColor3=o.panel,BorderSizePixel=0},Ax)an(lh,6)local sr=T(lh,"0",14,o.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,20))
local Az=T(lh,Ay,9,o.dim,false,UDim2 .new(0,0,0,23),UDim2 .new(1,0,0,13))sr.TextXAlignment,Az.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return sr end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=eC(1,"BOUGHT",5),eC(2,"WAXED",5),eC(3,"SOLD",5),eC(4,"MONEY",5),eC(5,"FREE",5)
end a.info=T(a4(40),"",10,o.dim,false)a.tgt=T(a4(16),"",10,o.good,false)sp("SWITCHES")do local function c1(AA,AB)
local ss=a4(26)return H(ss,AA,o.panel2,10,K(0,0.5)),H(ss,AB,o.panel2,10,K(0.5,0.5))end a.colT,a.sellT=c1("COLLECT: ON","SELL THEM: ON")
a.crateT,a.arT=c1("OPEN CRATES: ON","AUTO ROLL: OFF")a.helpT,a.helpGT=c1("HELP WAXES: OFF","GUILD CALLS: OFF")
a.campT,a.ghostT=c1("CAMPFIRE: OFF","GHOST: OFF")a.ixT,a.bestT=c1("AUTO INDEX: OFF","BEST BUTTER: OFF")a.bcT,a.shT=c1("BEST CRATE: OFF","GRAB SHOWER: ON")
M=a4(26)a.questT=H(M,"QUESTS: OFF",o.panel2,10,K(0,0.5))T(M,"collect every",9,o.dim,false,K(0.52,0.2))a.secB=gS(M,tostring(d.Every),"60",K(0.72,0.13))
a.secB.TextSize=11 a.secSet=H(M,"SET",o.accent,10,K(0.85,0.15))local g1=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},a4(76))
an(g1,6)O("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},g1)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,3)},g1)
local function eD(AC)local g2=T(g1,"",9,o.dim,false,nil,UDim2 .new(1,-6,0,14))g2 .LayoutOrder,g2 .TextWrapped,g2 .TextTruncate=AC,false,Enum.TextTruncate.AtEnd
return g2 end a.helpL,a.campL,a.questL,a.arL,a.ixL=eD(1),eD(2),eD(3),eD(4),eD(5)end sp("LOG")a.log=O("TextLabel",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},a4(84))an(a.log,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,eB)g0,eB=0,12 local function ai(AD)return a4(AD,a.set)end local function c2(AE)T(ai(14),AE,10,o.dim,true)end
c2("ONE-OFF ACTIONS")M=ai(26)a.buyB=H(M,"BUY THE PAD",o.warn,10,K(0,0.5))a.plB=H(M,"WAX WHAT I HOLD",o.good,10,K(0.5,0.5))
M=ai(26)a.sellB=H(M,"SELL WHAT I HOLD",o.warn,10,K(0,0.5))a.crateB=H(M,"OPEN CRATE NOW",o.warn,10,K(0.5,0.5))
M=ai(26)a.padB=H(M,"SET PAD (stand on it)",o.panel2,10,K(0,0.55))a.padL=T(M,"",10,o.dim,false,K(0.56,0.44))c2("SETTINGS FILE  (saved on your phone)")
M=ai(28)a.cfgName=gS(M,"default","config name",K(0,0.5))a.cfgSave=H(M,"SAVE",o.good,11,K(0.5,0.25))a.cfgLoad=H(M,"LOAD",o.accent,11,K(0.75,0.25))
M=ai(26)a.cfgPrev=H(M,"<",o.panel2,11,K(0,0.13))a.cfgPick=H(M,"(none saved)",o.panel2,10,K(0.13,0.74))a.cfgNext=H(M,">",o.panel2,11,K(0.87,0.13))
M=ai(26)a.cfgAuto=H(M,"LOAD IT ON LAUNCH: OFF",o.panel2,10,K(0,1))a.cfgMsg=T(ai(26),"",10,o.dim,false)c2("START BY ITSELF")
M=ai(26)a.autoB=H(M,"INSTALL F.exec",o.accent,10,K(0,1))a.autoMsg=T(ai(30),"",10,o.dim,false)M=ai(28)a.startT=H(M,"START FARMING ON LOAD: ON",o.accent,10,K(0,1))
T(ai(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,o.dim,false)
c2("IF THE GAME DROPS ME")M=ai(28)a.rejT=H(M,"AUTO REJOIN: ON",o.accent,11,K(0,0.55))a.rejB=H(M,"REJOIN NOW",o.warn,11,K(0.55,0.45))
a.rejMsg=T(ai(30),"",10,o.dim,false)c2("SMOOTHER RUNNING  (for long / overnight runs)")M=ai(28)a.pfLite=H(M,"LITE MODE: OFF",o.panel2,10,K(0,0.5))
a.pfHud=H(M,"HIDE GAME HUD: OFF",o.panel2,10,K(0.5,0.5))M=ai(28)a.pfFps=H(M,"FPS CAP: GAME",o.panel2,10,K(0,0.5))
a.pfRender=H(M,"STOP 3D: OFF",o.panel2,10,K(0.5,0.5))M=ai(28)a.pfBases=H(ai(28),"BASES: ALL DRAWN",o.panel2,10,K(0,1))
M=ai(28)a.pfMem=gS(M,tostring(d.MemLimit),"2000",K(0,0.24))T(M,"MB: rejoin this server above it (0 = never)",9,o.dim,false,K(0.26,0.52))
a.pfMemSet=H(M,"SET",o.accent,11,K(0.8,0.2))a.pfInfo=T(ai(18),"",10,o.text,false)T(ai(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. BASES: OTHERS HIDDEN stops drawing other players' bases and stacks, ALL HIDDEN yours too (nothing is removed, so helping and farming work). HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,o.dim,false)
c2("THE ROUND SAB BUTTON")T(ai(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,o.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,eB)local su=O("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},k6)
a.tgRoot=O("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=o.accent,BorderSizePixel=0,Active=true},su)an(a.tgRoot,20)O("UIStroke",{Color=o.line,Thickness=1},a.tgRoot)
a.tgBtn=O("TextButton",{Text="SAB",Size=a2,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=o.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=O("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=o.dim,BorderSizePixel=0},a.tgRoot)
an(a.tgDot,4)a.tgGhost=O("TextButton",{Text="G: OFF",Size=UDim2 .new(0,46,0,18),Position=UDim2 .new(0.5,-23,1,4),
BackgroundColor3=o.panel2,Font=Enum.Font.GothamBold,TextSize=9,TextColor3=o.text,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
an(a.tgGhost,6)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()local g3=j.ghostMode()
local sv=g3==2 and o.accent or(g3==1 and o.warn or o.panel2)if a.ghostT then a.ghostT.Text,a.ghostT.BackgroundColor3=j.GHOST[g3][1],sv end
if a.tgGhost then a.tgGhost.Text,a.tgGhost.BackgroundColor3=j.GHOST[g3][2],sv end end local bl={built=false,boxes={},at=0}
local function sw(sx,li)d.Targets[sx]=li or nil local lj=bl.boxes[sx]if lj then lj.Text=li and"X"or""lj.BackgroundColor3=li and o.good or o.panel2
end end local function lk()for AF,sy in pairs(bl.boxes)do local sz=d.Targets[AF]==true sy.Text=sz and"X"or""sy.BackgroundColor3=sz and o.good or o.panel2
end end local eE local function AG()local AH=0 local ll=O("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=T(ll,"",10,o.dim,false,K(0,0.5))local AI=H(ll,"CLEAR",o.panel2,10,K(0.5,0.24))local AJ=H(ll,"REFRESH",o.panel2,10,K(0.74,0.26))
AI.MouseButton1Click:Connect(function()for AK in pairs(d.Targets)do d.Targets[AK]=nil end lk()end)AJ.MouseButton1Click:Connect(function()
ad.at=0 h6()eE(true)end)return AH end eE=function(AL)if not h6()then if not a.butEmpty then a.butEmpty=T(O("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,o.warn,false)end return end if bl.built and not AL and bl.at==ad.at then return end
for DZ,lm in ipairs(a.but:GetChildren())do if lm:IsA("Frame")or lm:IsA("TextButton")then lm:Destroy()end end bl.boxes,a.butEmpty={},nil
AG()local ln,lo=36,1 local function sA(sB)lo=lo+1 local AM=O("Frame",{Size=UDim2 .new(1,0,0,sB),BackgroundTransparency=1,LayoutOrder=lo},a.but)
ln=ln+sB+6 return AM end for D0,g4 in ipairs(ad.rarOrder)do local AN=sA(24)local AO=sa[g4]or o.text local lp=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},AN)
an(lp,6)T(lp,"  "..g4:upper(),11,AO,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local AP=H(lp,"ALL",o.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local AQ=g4 AP.MouseButton1Click:Connect(function()local sC=ad.members[AQ]or{}local sD=false for D1,AS in ipairs(sC)do if not d.Targets[AS]then sD=true break end end
for D2,AT in ipairs(sC)do sw(AT,sD)end end)for D3,lq in ipairs(ad.members[g4]or{})do local AU=sA(22)local g5=O("TextButton",{Text="",Size=a2,BackgroundColor3=o.bg,BorderSizePixel=0,
AutoButtonColor=true},AU)an(g5,5)T(g5,"   "..ah(lq),11,o.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local lr=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},g5)an(lr,4)bl.boxes[lq]=lr local sE=lq local function sF()sw(sE,not d.Targets[sE])end
g5 .MouseButton1Click:Connect(sF)lr.MouseButton1Click:Connect(sF)end end lk()a.but.CanvasSize=UDim2 .new(0,0,0,ln+10)
bl.built,bl.at=true,ad.at end function L.paint()for AV,sG in pairs(L.boxes)do local sH=d.CrateTicks[AV]==true
sG.Text=sH and"X"or""sG.BackgroundColor3=sH and o.good or o.panel2 end if a.crtInfo then local ls,lt=0,0 for D4 in pairs(L.boxes)do ls=ls+1 end
for D5,AW in pairs(d.CrateTicks)do if AW then lt=lt+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(ls,lt)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and o.accent or o.panel2
end end function L.build()for D6,lu in ipairs(a.crt:GetChildren())do if lu:IsA("Frame")or lu:IsA("TextButton")then lu:Destroy()end
end L.boxes={}local lv,lw=12,0 local function g6(sI)lw=lw+1 lv=lv+sI+6 return O("Frame",{Size=UDim2 .new(1,0,0,sI),BackgroundTransparency=1,LayoutOrder=lw},a.crt)
end local lx=g6(28)a.crtInfo=T(lx,"",10,o.dim,false,K(0,0.5))local AX=H(lx,"CLEAR",o.panel2,10,K(0.5,0.24))local AY=H(lx,"REFRESH",o.panel2,10,K(0.74,0.26))
V(AX.MouseButton1Click:Connect(function()d.CrateTicks={}L.paint()end))V(AY.MouseButton1Click:Connect(function()L.build()end))
a.crtAll=H(g6(28),"",o.accent,11,K(0,1))V(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates L.paint()end))
T(g6(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,o.dim,false)
for D7,bm in ipairs(L.list())do local AZ=g6(24)local eF=O("TextButton",{Text="",Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,AutoButtonColor=true},AZ)
an(eF,5)T(eF,"  "..(bm.title or bm.name)..(bm.guess and"  (?)"or""),11,sa[bm.rar or""]or o.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
T(eF,bm.price and("$"..aJ(bm.price))or(bm.rar or""),9,o.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local ly=O("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},eF)an(ly,4)L.boxes[bm.k]=ly local sJ=bm.k local function sK()d.CrateTicks[sJ]=(not d.CrateTicks[sJ])or nil
L.paint()end V(eF.MouseButton1Click:Connect(sK))V(ly.MouseButton1Click:Connect(sK))end a.crt.CanvasSize=UDim2 .new(0,0,0,lv+10)
L.built=L.at L.paint()end local sL="farm"local function bJ(ar)sL=ar a.farm.Visible,a.but.Visible,a.set.Visible=(ar=="farm"),(ar=="but"),(ar=="set")
a.crt.Visible=(ar=="crt")a.pet.Visible,a.team.Visible=(ar=="pet"),(ar=="team")a.tabCrt.BackgroundColor3=(ar=="crt")and o.accent or o.panel2
a.tabPet.BackgroundColor3=(ar=="pet")and o.accent or o.panel2 a.tabTeam.BackgroundColor3=(ar=="team")and o.accent or o.panel2
if ar=="pet"and not l.built then pcall(l.build)end if ar=="team"and not y.built then pcall(y.build)end if ar=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end
a.tabFarm.BackgroundColor3=(ar=="farm")and o.accent or o.panel2 a.tabBut.BackgroundColor3=(ar=="but")and o.accent or o.panel2
a.tabSet.BackgroundColor3=(ar=="set")and o.accent or o.panel2 if ar=="but"then eE(false)end end local function N(g7,g8,A0,A1)
a.put(g7,g8 and A0 or A1)if a.lit[g7]~=g8 then a.lit[g7]=g8 g7 .BackgroundColor3=g8 and o.accent or o.panel2 end
end l.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function l.paintRow(sM)
local cg=l.rows and l.rows[sM]if not cg then return end local eG=d.Pets[sM]or{}cg.b.BackgroundColor3=eG.b and o.good or o.panel2
cg.g.BackgroundColor3=eG.g and o.accent or o.panel2 cg.g.Text=eG.g and"BIG"or"ANY"cg.w.BackgroundColor3=eG.w and o.warn or o.panel2
local lz=tonumber(eG.f)or 0 cg.f.Text=lz>0 and(lz.." BIG")or"FUSE"cg.f.BackgroundColor3=lz>0 and o.good or o.panel2
end function l.flag(lA,g9)local a5=d.Pets[lA]or{}if g9=="f"then local sN=((tonumber(a5 .f)or 0)+1)%4 a5 .f=sN>0 and sN or nil
elseif a5[g9]then a5[g9]=nil else a5[g9]=true end d.Pets[lA]=(a5 .b or a5 .g or a5 .w or a5 .f)and a5 or nil l.paintRow(lA)
end function l.paintAll()for A2 in pairs(l.rows or{})do l.paintRow(A2)end if a.pbT then N(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function l.live()if not l.built then l.build()return end if x()-(l.liveAt or 0)<1 then return end l.liveAt=x()
local sO=l.wishes()local eH=l.data()for g_,ha in pairs(l.rows)do ha.name.Text=l.nice(g_)..(sO[g_]and("   * wish %dm"):format(math.ceil(sO[g_]/60))or"")
local sP=A.status(g_,eH)ha.desc.Text=sP and(sP.." | "..ha.boostText)or ha.boostText end local sQ=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(eH and#(eH.pets or{})or 0,eH and tonumber(eH.maxOwned)or 60,
aJ(l.money()),sQ>0 and(" | free wishes "..sQ)or"",l.buyMsg~=""and l.buyMsg or"-",l.wishMsg~=""and l.wishMsg or"-")
end function l.build()local hb=l.info()for D8,lB in ipairs(a.pet:GetChildren())do if lB:IsA("Frame")or lB:IsA("TextLabel")then lB:Destroy()end
end l.rows={}local lC,hc=0,12 local function c3(sR)lC,hc=lC+1,hc+sR+6 return O("Frame",{Size=UDim2 .new(1,0,0,sR),BackgroundTransparency=1,LayoutOrder=lC},a.pet)
end local lD=c3(28)a.pbT=H(lD,"AUTO ADOPT: OFF",o.panel2,9,K(0,0.34))a.pwT=H(lD,"AUTO WISH: OFF",o.panel2,9,K(0.34,0.33))
a.pfT=H(lD,"AUTO FUSE: OFF",o.panel2,9,K(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy l.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish l.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse l.paintAll()end)
a.pInfo=T(c3(44),"",10,o.dim,false)T(c3(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,o.dim,false)
if not hb then T(c3(30),"pet list not loaded yet - open this tab again in a moment",11,o.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,hc)
l.built=false return end local c4={}for D9,sS in ipairs(l.order())do local lE=hb.Pets[sS].rarity or"?"c4[lE]=c4[lE]or{}
table.insert(c4[lE],sS)end local c5={}for D_,sT in ipairs(hb.Rarities or{})do if c4[sT]then c5[#c5+1]=sT end end
for sU in pairs(c4)do if not table.find(c5,sU)then c5[#c5+1]=sU end end for Ea,hd in ipairs(c5)do local sV=O("Frame",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0},c3(22))
an(sV,6)T(sV,"  "..hd:upper(),11,l.RC[hd]or o.text,true)for Eb,he in ipairs(c4[hd])do local cj=O("Frame",{Size=a2,BackgroundColor3=o.bg,BorderSizePixel=0},c3(38))
an(cj,5)local A3=T(cj,l.nice(he),11,l.RC[hd]or o.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local A4,A5=pcall(function()return hb.describe(he)end)
local sW=A4 and tostring(A5)or""local A6=T(cj,sW,9,o.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local sX=H(cj,"BUY",o.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local sY=H(cj,"ANY",o.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local sZ=H(cj,"WISH",o.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local s0=H(cj,"FUSE",o.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local hf=he sX.MouseButton1Click:Connect(function()l.flag(hf,"b")end)
sY.MouseButton1Click:Connect(function()l.flag(hf,"g")end)sZ.MouseButton1Click:Connect(function()l.flag(hf,"w")end)
s0 .MouseButton1Click:Connect(function()l.flag(hf,"f")end)l.rows[he]={b=sX,g=sY,w=sZ,f=s0,name=A3,desc=A6,boostText=sW}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,hc+10)l.built=true l.paintAll()end function j.paint()N(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")N(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
N(a.pfBases,d.HideBases,j.BASES[j.basesMode()],j.BASES[0])N(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end V(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
V(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))V(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))
V(a.pfBases.MouseButton1Click:Connect(function()j.setBases((j.basesMode()+1)%3)j.paint()end))V(a.pfFps.MouseButton1Click:Connect(function()
local A7=table.find(j.CAPS,d.FpsCap or 0)or 1 local s1=j.CAPS[(A7%#j.CAPS)+1]if not j.cap(s1)and s1~=0 then z("this executor cannot cap fps")end
j.paint()end))V(a.pfMemSet.MouseButton1Click:Connect(function()local lF=tonumber(a.pfMem.Text)if lF and lF>=0 then d.MemLimit=math.floor(lF)end
j.paint()end))function y.names()local lG={"(none)"}for Ec,A8 in ipairs((y.teams()))do lG[#lG+1]=A8 .name end return lG
end function y.cycle(lH,A9)local hg=y.names()local A_=d[lH]~=""and d[lH]or"(none)"local hh=table.find(hg,A_)or 1
hh=((hh-1+A9)%#hg)+1 d[lH]=hg[hh]=="(none)"and""or hg[hh]y.paint()end function y.paint()if not y.built then return end
N(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")N(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")
local lI={}for Ed,Ba in ipairs((y.teams()))do lI[Ba.name]=true end for Bb,s2 in pairs(y.pick)do local c6=d[Bb]
s2 .Text=c6==""and"(none)"or(lI[c6]and c6 or(c6 .." (missing)"))s2 .TextColor3=(c6~=""and not lI[c6])and o.bad or o.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(y.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(y.switches,y.finished,y.glazed,A.fused)
..(A.buildMsg~=""and("\n"..A.buildMsg)or"")local Bc,hi=l.srv(),{}for Ee,hj in ipairs(y.list or{})do hi[#hi+1]=("st %-2s %-22s %9s  helps %d"):format(hj.st.Name,ah(aa(hj.name)):sub(1,22),y.clock(hj.ends-Bc),hj.helps)
end a.tmList.Text=#hi>0 and table.concat(hi,"\n")or"no waxes running"end function y.build()for Ef,lJ in ipairs(a.team:GetChildren())do
if lJ:IsA("Frame")or lJ:IsA("TextLabel")then lJ:Destroy()end end y.pick={}local lK,lL=0,12 local function bK(s3)
lK,lL=lK+1,lL+s3+6 return O("Frame",{Size=UDim2 .new(1,0,0,s3),BackgroundTransparency=1,LayoutOrder=lK},a.team)
end local function eI(Bd)T(bK(14),Bd,10,o.dim,true)end local function hk(hl)local lM=bK(26)local Be=H(lM,"<",o.panel2,11,K(0,0.14))
local s4=H(lM,"(none)",o.panel,10,K(0.14,0.72))local Bf=H(lM,">",o.panel2,11,K(0.86,0.14))Be.MouseButton1Click:Connect(function()y.cycle(hl,-1)end)
Bf.MouseButton1Click:Connect(function()y.cycle(hl,1)end)s4 .MouseButton1Click:Connect(function()y.cycle(hl,1)end)
y.pick[hl]=s4 end a.tmT=H(bK(28),"AUTO TEAMS: OFF",o.panel2,11,K(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=y.current()end y.paint()end)a.tmInfo=T(bK(42),"",10,o.dim,false)
local s5=bK(26)a.tmBuild=H(s5,"AUTO BUILD TEAMS: OFF",o.panel2,9,K(0,0.62))a.tmBuildNow=H(s5,"BUILD NOW",o.warn,9,K(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild y.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if y.editing then return end A.buildMsg="building..."task.spawn(function()local Bg,Bh=pcall(A.rebuild,"you asked")if not Bg then z("BUILD ERR "..tostring(Bh))end end)
end)eI("NORMAL TEAM  (worn the rest of the time)")hk("TeamNormal")eI("FULL TEAM  (every station busy: money + wax speed)")
hk("TeamFull")eI("GLAZE TEAM  (worn just before a wax finishes)")hk("TeamGlaze")local lN=bK(26)a.tmLead=gS(lN,tostring(d.GlazeLead),"45",K(0,0.2))
T(lN,"sec before it finishes",10,o.dim,false,K(0.22,0.5))local Bi=H(lN,"SET",o.accent,11,K(0.75,0.25))Bi.MouseButton1Click:Connect(function()
local hm=tonumber(a.tmLead.Text)if hm and hm>=5 and hm<=600 then d.GlazeLead=math.floor(hm)else a.tmLead.Text=tostring(d.GlazeLead)end
y.paint()end)eI("WAX TEAM  (worn while a butter is placed: head starts)")hk("TeamWax")eI("YOUR WAXES  (time left, helps)")
a.tmList=O("TextLabel",{Size=a2,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bK(150))an(a.tmList,6)O("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
T(bK(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,o.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,lL+10)y.built=true y.paint()end local function Bj()a.secB.Text=tostring(d.Every)
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do af(0.1)end if not D.home then pcall(j.unpin)end end)end
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then en(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bI(a.root)bI(a.tgRoot)c.lastCollect=x()
lk()L.paint()pcall(l.paintAll)pcall(y.paint)pcall(j.applyAll)end local function Bk(s6)task.spawn(function()s6 .TextColor3=o.bad
task.wait(0.8)if c.alive then s6 .TextColor3=o.text end end)end local function s7()local s8=a.secB.Text:match("^%s*(%d+)%s*$")
local eJ=s8 and tonumber(s8)if not eJ or eJ<1 then a.secB.Text=tostring(d.Every)Bk(a.secB)z("interval must be a whole number >= 1")
return end if eJ==d.Every then return end d.Every,c.lastCollect=eJ,x()z("collect every "..eJ.."s")end local function P(Bl,Bm)V(Bl.MouseButton1Click:Connect(Bm))end
P(a.secSet,s7)V(a.secB.FocusLost:Connect(s7))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(aq,"selling...",q3)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(C.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help D.nextAt,D.msg=0,d.Help and"looking for waxes to help"or"off"N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests E.at=0 N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire J.nextAt,J.fails,J.lost=0,0,0 N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,j.cycleGhost)function q.paint()N(a.ixT,d.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")N(a.bestT,(d.Best or 0)>0,"BEST: TOP "..tostring(d.Best),"BEST BUTTER: OFF")
N(a.bcT,d.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")N(a.shT,d.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(Bn)task.spawn(function()pcall(q.tick)if Bn and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end P(a.ixT,function()local Bo=q.on()d.AutoIndex=not d.AutoIndex q.discAt=-100 q.changed(Bo)end)
P(a.bestT,function()local Bp=q.on()d.Best=((d.Best or 0)+1)%4 q.changed(Bp)end)P(a.bcT,function()local Bq=q.on()
d.BestCrate=not d.BestCrate q.changed(Bq)end)P(a.shT,function()d.Shower=not d.Shower q.paint()end)P(a.crateB,function()
e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(aq,"opening crate...",fH,true)end)P(a.padB,function()
c.plot=bn()or c.plot local s9,lO=au(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")if not(s9 and lO and lO:IsA("BasePart"))then z("SET PAD: need character and plot")return end
c.manualPad=lO.CFrame:ToObjectSpace(s9 .HumanoidRootPart.CFrame)yP(c.manualPad)z("collect pad saved at your position")
end)P(a.startB,function()en(not c.running)end)P(a.buyB,function()c.plot=bn()or c.plot task.spawn(aq,"buying (manual)...",nI,true)
end)P(a.plB,function()c.plot=bn()or c.plot task.spawn(aq,"waxing (manual)...",nN)end)P(a.tabFarm,function()bJ("farm")end)
P(a.tabBut,function()bJ("but")end)P(a.tabSet,function()bJ("set")end)P(a.tabCrt,function()bJ("crt")end)P(a.tabPet,function()bJ("pet")end)
P(a.tabTeam,function()bJ("team")end)local function Br(lP)c.hidden=lP a.root.Visible=not lP a.tgBtn.Text=lP and"SAB+"or"SAB"
end sk(a.tgBtn,a.tgRoot,function()bI(a.tgRoot)c.togPos=gW(a.tgRoot)or c.togPos end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then Br(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aH,av={},0 local function bL()aH=m5()if#aH==0 then a.cfgPick.Text="(none saved)"
av=0 return end if av<1 or av>#aH then av=1 end a.cfgPick.Text=aH[av]..("  (%d/%d)"):format(av,#aH)end local function s_()
local ta=c.autoload~=nil a.cfgAuto.Text=ta and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=ta and o.accent or o.panel2
end local function lQ()local tb=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if tb~=""then return tb end return(av>0 and aH[av])or""
end P(a.cfgSave,function()c.winPos=gW(a.root)or c.winPos c.togPos=gW(a.tgRoot)or c.togPos local tc,td=fm(lQ())
a.cfgMsg.Text=tc and("saved as "..td)or("could not save: "..td)a.cfgMsg.TextColor3=tc and o.good or o.bad bL()
z(a.cfgMsg.Text)end)local function Bs(lR)local lS,te=nd(lR)a.cfgMsg.Text=lS and("loaded "..te)or("could not load: "..te)
a.cfgMsg.TextColor3=lS and o.good or o.bad if lS then a.cfgName.Text=lR Bj()task.spawn(C.apply,"config "..lR)
end z(a.cfgMsg.Text)end P(a.cfgLoad,function()Bs(lQ())end)P(a.cfgPick,function()bL()if av>0 then a.cfgName.Text=aH[av]end
end)P(a.cfgPrev,function()if#aH==0 then bL()return end av=(av-2)%#aH+1 bL()a.cfgName.Text=aH[av]end)P(a.cfgNext,function()
if#aH==0 then bL()return end av=av%#aH+1 bL()a.cfgName.Text=aH[av]end)P(a.cfgAuto,function()if c.autoload then
nf(nil)a.cfgMsg.Text="it will not load a config on launch"else local eK=lQ()local tf=false for Eg,Bt in ipairs(m5())do if Bt==eK then tf=true end end
local Bu=tf or fm(eK)if Bu and eK~=""then nf(eK)bL()a.cfgMsg.Text=eK.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=o.dim s_()end)P(a.autoB,function()
local th,ti=vb()a.autoMsg.Text=th and("installed. "..ti)or("failed: "..ti)a.autoMsg.TextColor3=th and o.good or o.bad
z(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()dn("you asked")end)
local bM=false P(a.minB,function()bM=not bM a.tabs.Visible=not bM if bM then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bJ(sL)end a.root.Size=UDim2 .new(0,ak.w,0,bM and(ak.head+ak.strip)or ak.h)
a.minB.Text=bM and"+"or"-"end)local function hn()if not c.alive then return end c.alive,c.running=false,false
pcall(j.restoreAll)pcall(eX)for Eh,Bv in ipairs(hx)do pcall(function()Bv:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()k7:Destroy()end)pcall(function()su:Destroy()end)if cm.SAB_KILL==hn then cm.SAB_KILL=nil end end
cm.SAB_KILL=hn P(a.killB,hn)P(a.xB,hn)sk(a.title,a.root,function()bI(a.root)c.winPos=gW(a.root)or c.winPos end)
local function tj()local eL,ck=c.reason,c.level if c.busy then eL,ck=c.busyText,"ok"elseif not c.running then
local Ei,tk,Bw=rx()if c.capHit then eL,ck=tk,"bad"else eL,ck="[stopped] "..tk,(Bw=="bad")and"bad"or"idle"end c.reason,c.level=eL,ck
end local ho=c.running and o.good or(c.capHit and o.bad or o.dim)if a.lit.dot~=ho then a.lit.dot=ho a.dot.BackgroundColor3,a.tgDot.BackgroundColor3=ho,ho end
if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and o.panel2 or o.accent end if c.hidden then return end
a.put(a.reason,eL)if a.lit.bar~=ck then a.lit.bar=ck a.bar.BackgroundColor3=zY[ck]or o.dim end if bM then return end
if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and o.warn or o.good
end N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")local bN=uM()if a.farm.Visible then
local Bx,By=eU()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Bx.."/"..By)local tl=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local tm=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aJ(a6()),c.rolls,c.gifts,c.crates,tm and ah(aa(tm))or"nothing",e.on and("   ["..e.title.." window open]")or"",
tl and("in "..tl.."s")or"off"))a.put(a.tgt,(#bN==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bN<=3)and table.concat(bN,", ")or(#bN.." butters ticked"))))
if a.lit.tgt~=(#bN==0)then a.lit.tgt=(#bN==0)a.tgt.TextColor3=(#bN==0)and o.bad or o.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(eO,"\n")end
end if a.set.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#bN))
end if a.but.Visible and bl.at~=ad.at then eE(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then l.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak)
end if a.team.Visible then y.paint()end if a.farm.Visible then a.put(a.helpL,"help: "..((d.Help or d.HelpGuild)and D.msg or"off"))
a.put(a.campL,"camp: "..(d.Campfire and J.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests: "..(d.Quests and(E.msg~=""and E.msg or"checking...")or"off"))a.put(a.ixL,q.msg)N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local tn=(C.rec.on and"on"or"")..(C.rec.off and((C.rec.on and"/"or"").."off")or"")
a.put(a.arL,C.msg~=""and C.msg or("auto roll: game %s | learned %s%s"):format(C.isOn()and"ON"or"off",tn~=""and tn or"nothing yet",#C.rec.rules>0 and", choices"or""))
if a.lit.arL~=(C.msg~="")then a.lit.arL=(C.msg~="")a.arL.TextColor3=C.msg~=""and o.warn or o.dim end end end cm.SAB={S=c,CFG=d,EV=W,U=a,sg=k7,CAT=ad,LEARN=ag,buildList=eE,
logAll=c7,evAll=c8,AR=C,CR=L,PF=j,PX=l,TM=y,CRATE=e,FU=A,HX=D,CF=J,QX=E,IX=q,SH=Q}z(cl.." loaded")if c.uiErrs>0 then z("UI: "..c.uiErrs.." properties skipped")end
bJ("farm")bI(a.root)bI(a.tgRoot)if gT then pcall(function()V(gT:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bI(a.root)bI(a.tgRoot)end))end)end bL()s_()if c.config and c.config~=""then a.cfgName.Text=c.config end
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()q.paint()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(tj)task.spawn(function()local to=u_()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(to and("\n(backup: "..to..")")or"")
local tp=fg(al.exec)if tp and not tp:find("SAB autoloader v2",1,true)then dj(al.exec,al.stub)z("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(fg(al.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(vh)end)task.spawn(function()while c.alive do local Bz,BA=pcall(tj)if not Bz then z("UI ERR "..tostring(BA))end
task.wait((c.hidden or bM)and 1.5 or 0.4)end end)task.spawn(function()local BB,BC=pcall(vp)if not BB then z("HOOK ERR "..tostring(BC))end
end)task.spawn(function()pcall(t8)if e.loadSeq and not e.learned then local hp={}for tq=1,20 do if e.loadSeq[tq]then hp[#hp+1]=e.loadSeq[tq]end end
if#hp>0 then e.learned={seq=hp,mode=e.loadMode}z("remembered how to open crates directly")end end if h6()then z(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local BD,tr=pcall(yR)if BD and tr and c.alive and not c.manualPad then c.manualPad=tr end end)task.spawn(function()
while c.alive do local lT,lU=pcall(l.buyTick)if not lT then z("PET ERR "..tostring(lU))task.wait(5)end lT,lU=pcall(l.wishTick)
if not lT then z("WISH ERR "..tostring(lU))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local hq,ts=0,x()
V(game:GetService("RunService").Heartbeat:Connect(function()hq=hq+1 end))V(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=x()while c.alive do task.wait(1)local tt=x()j.fps,hq,ts=hq/math.max(tt-ts,0.001),0,tt local BE,BF=pcall(j.tick)
if not BE then z("PERF ERR "..tostring(BF))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local BG,BH=pcall(A.tick)if not BG then z("FUSE ERR "..tostring(BH))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local BI,BJ=pcall(y.tick)if not BI then z("TEAM ERR "..tostring(BJ))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local hr=aj:WaitForChild("Remotes",30)local tu=hr and hr:WaitForChild("ClanEvent",30)
if tu and c.alive then V(tu.OnClientEvent:Connect(function(BK,BL)if BK=="call"then pcall(D.onCall,BL)end end))
end local tv=hr and hr:FindFirstChild("RollConfirmAsk")if tv and c.alive then V(tv.OnClientEvent:Connect(function(BM)E.asked=BM or"butter"end))end
end)task.spawn(function()local lV=aj:WaitForChild("Remotes",30)if not(lV and c.alive)then return end local function hs(BN,BO)
local lW=lV:FindFirstChild(BN)if lW and lW:IsA("RemoteEvent")then V(lW.OnClientEvent:Connect(function(...)pcall(BO,...)end))end
end hs("NewSquishyDiscovered",function(lX,tw)if type(lX)~="string"then return end q.disc=q.disc or{}q.disc[aa(lX)]=true
z(("INDEX: %s%s is in your Index now"):format(ah(aa(lX)),tw and(" ("..tostring(tw)..")")or""))end)hs("IndexRefresh",q.loadDisc)
hs("IndexRowComplete",function(BP)z("INDEX: the whole "..tostring(BP).." row is complete")end)hs("AdminShow",q.admin)
local tx=lV:FindFirstChild("AdminShowSync")if tx then local BQ,ty=pcall(function()return tx:InvokeServer()end)
if BQ and type(ty)=="table"then for Ej,BR in pairs(ty)do pcall(Q.add,BR)end end end while c.alive do local BS,BT=pcall(q.tick)
if not BS then q.msg="index error: "..tostring(BT)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local BU,BV=pcall(E.tick)if not BU then z("QUEST ERR "..tostring(BV))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(eX)end end)pcall(C.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local BX=(type(newcclosure)=="function")and newcclosure or function(BW)return BW end local lY
local tz=(type(setnamecallmethod)=="function")and setnamecallmethod or nil lY=hookmetamethod(game,"__namecall",BX(function(tA,...)
local eM=getnamecallmethod()if c.alive and(eM=="InvokeServer"or eM=="FireServer")then local tB,tC=pcall(function()return tA.Name end)
if tB and tC=="CrateAction"and not e.replaying then pcall(e.saw,eM,...)elseif tB and tC=="AutoRollAction"and not C.replaying then pcall(C.saw,eM,...)end
if tz then tz(eM)end end return lY(tA,...)end))e.oldNC=lY end)end if hv then V(F.Idled:Connect(function()pcall(function()hv:CaptureController()hv:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Ek=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and au()and(c.plot or bn())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then C.apply("joined")end while c.alive do task.wait(30)local ht=bS()
if ht and q.on()and not aI(ht.name)then ht=nil end if c.alive and d.AutoRoll and c.running and not C.isOn()and not ht and not ac()
and not e.waiting and not e.on and not c.busy then C.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for El=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bn()if au()and c.plot and q.any()then en(true,true)z("started by itself")
return end task.wait(1)end if c.alive and not c.running then z("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bn()c.lastCollect=x()while c.alive do if c.running then local BY,tD=pcall(zT)if not BY and tD~=hw then z("LOOP ERR "..tostring(tD))end
end task.wait(0.1)end end)hu("loaded - window is at the top left")end local B0,lZ=xpcall(tH,function(BZ)return tostring(BZ).."\n"..debug.traceback()end)
if not B0 then pcall(function()warn("SAB "..cl.." ERROR: "..tostring(lZ))end)hu("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..cl.." ERROR: "..tostring(lZ))end)pcall(function()local tE=(type(getgenv)=="function"and getgenv())or _G
if type(tE.SAB_KILL)=="function"then tE.SAB_KILL()end for Em,B1 in ipairs({"SABFarmGui","SABToggle"})do local tF=F.PlayerGui:FindFirstChild(B1)
if tF then tF:Destroy()end end end)pcall(function()local eN=Instance.new("ScreenGui")eN.Name="SABError"eN.ResetOnSpawn=false
eN.DisplayOrder=1000 local aW=Instance.new("TextBox")aW.Size=UDim2 .new(0,340,0,170)aW.Position=UDim2 .new(0,10,0,50)
aW.BackgroundColor3=Color3 .fromRGB(90,20,20)aW.TextColor3=Color3 .new(1,1,1)aW.TextSize=11 aW.TextWrapped=true
aW.ClearTextOnFocus=false aW.TextXAlignment=Enum.TextXAlignment.Left aW.TextYAlignment=Enum.TextYAlignment.Top
aW.Text="SAB "..cl.." failed to start. Send this text:\n"..tostring(lZ)aW.Parent=eN eN.Parent=F:WaitForChild("PlayerGui")
end)end
