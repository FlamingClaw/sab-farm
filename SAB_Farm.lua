local b9="v25"local la=game:GetService("Players")local F=la.LocalPlayer or la.PlayerAdded:Wait()local function g2(sj)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..b9,Text=sj,Duration=6})
end)end g2("script started")local function sk()local ar=game:GetService("ReplicatedStorage")local ao=game:GetService("Workspace")
local lb=game:GetService("UserInputService")local b_=(type(getgenv)=="function"and getgenv())or _G if type(b_.SAB_KILL)=="function"then pcall(b_.SAB_KILL)end
local x=(type(tick)=="function")and tick or os.clock local g3=(function()local sl,sm=pcall(function()return game:GetService("VirtualUser")end)return sl and sm or nil end)()
local d={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,HideBases=false,MemLimit=2000,Help=false,HelpGuild=false,Campfire=true,
Ghost=false,GhostHelps=false,Quests=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=x(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local Q={name=nil,rar=nil,at=x(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local A={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local e={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local l,q,j,z,C,H,D={},{},{},{},{},{},{}local g4={}local g5,er,cS,cT={},{},{},{}local function T(lc)g5[#g5+1]=lc return lc end
local function ad(sn)task.wait(sn)if not c.alive then error(g4,0)end end local function y(es)es=os.date("%H:%M:%S").." "..tostring(es)
table.insert(er,1,es)if#er>6 then table.remove(er)end c.logN=(c.logN or 0)+1 cS[#cS+1]=es if#cS>80 then table.remove(cS,1)end
end local function et(ld)if type(ld)~="string"then return""end return(ld:lower():gsub("[^%w]",""))end local function ab(so)
local le=et(so)local g6=le:gsub("butter$","")if g6==""then g6=le end return g6 end local function aQ(g7)return type(g7)=="string"and ab(g7)~=""and d.Targets[ab(g7)]==true end
local function sp(cU)cU=cU:lower()return cU:find("squishy",1,true)~=nil or cU:match("butter$")~=nil or cU:match("butter[^%a]")~=nil
end local g8={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aD(cV)if type(cV)~="number"then return"?"end
local eu=1 while math.abs(cV)>=1000 and eu<#g8 do cV=cV/1000 eu=eu+1 end local sq=string.format("%.2f",cV):gsub("%.?0+$","")
return sq..g8[eu]end local function sr(lf)if type(lf)~="string"then return nil end local ss,lg=lf:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local g9=tonumber(ss)if not g9 then return nil end if lg==""then return g9 end for su,sv in ipairs(g8)do if sv:lower()==lg:lower()then return g9*1000^(su-1)end end
return nil end local function a0()local lh=F:GetAttribute("BoardValueMoney")if type(lh)=="number"then return lh end
local li=F:FindFirstChild("leaderstats")if li then for z4,sw in ipairs({"Cash","Money","Coins"})do local g_=li:FindFirstChild(sw)
if g_ and type(g_.Value)=="number"then return g_.Value end end end end local function ev(sx)local ha=sx:GetFullName()
if c.plot then local hb=c.plot:GetFullName()if ha:sub(1,#hb)==hb then return ha:sub(#hb+2)end end return ha end
local function as()local ew=F.Character if ew and ew:FindFirstChild("HumanoidRootPart")then local lj=ew:FindFirstChildOfClass("Humanoid")
if lj and lj.Health>0 then return ew end end end local function bh()local hc=ao:FindFirstChild("Plots")if not hc then return nil end
local function lk(sy)local ll=sy:FindFirstChild("Plate")return ll~=nil and ll:FindFirstChild("EditStackAttachment",true)~=nil
end local lm=F:GetAttribute("PlotNumber")if lm~=nil then local hd=hc:FindFirstChild(tostring(lm))if hd and lk(hd)then return hd end
end for z5,ln in ipairs(hc:GetChildren())do if lk(ln)then return ln end end end local function cW(lo)local bi=lo and lo.Parent
for z6=1,6 do if not bi then return nil end if bi:IsA("BasePart")then return bi end if bi:IsA("Model")then return bi.PrimaryPart or bi:FindFirstChildWhichIsA("BasePart",true)end
bi=bi.Parent end end local function lp(lq)local he=lq.Parent if he and he:IsA("Attachment")then return he.WorldPosition end
local lr=cW(lq)return lr and lr.Position end local function ls()local ca=c.plot and c.plot:FindFirstChild("Plate")
if not ca then return nil end if ca:IsA("BasePart")then return ca.Position end if ca:IsA("Model")then return ca:GetPivot().Position end
local lt=ca:FindFirstChildWhichIsA("BasePart",true)return lt and lt.Position end local function lu()local hf={}
local lv=c.plot and c.plot:FindFirstChild("WaxStations")if lv then for z7,sz in ipairs(lv:GetChildren())do local lw=sz:FindFirstChild("SquishyPlaceHolder")
local hg=lw and lw:FindFirstChild("PlacePrompt")if hg and hg:IsA("ProximityPrompt")then hf[#hf+1]=hg end end end
return hf end local function ex()local lx,hh=lu(),0 for z8,sA in ipairs(lx)do if sA.Enabled then hh=hh+1 end end
local hi=#lx local hj=F:GetAttribute("WaxStations")if type(hj)=="number"and hj>hi then hi=hj end return hh,hi
end local function sB()local ly=as()local lz=ly and ly.HumanoidRootPart.Position local hk,lA for z9,hl in ipairs(lu())do
if hl.Enabled then local lB=lp(hl)local lC=(lB and lz)and(lB-lz).Magnitude or 1e9 if not hk or lC<lA then hk,lA=hl,lC end
end end return hk end local function lD()local ey=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not ey then return nil end local lE=ey:FindFirstChild("BuyPromptAttachment")local ez=(lE and lE:FindFirstChild("BuyPrompt"))or ey:FindFirstChild("BuyPrompt",true)
if ez and ez:IsA("ProximityPrompt")and ez:IsDescendantOf(ey)then return ez end end local lF={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local sC={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ae={order={},price={},dirty=false}local K={seen={},at=0,boxes={},built=0}local W={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local hm="SAB_order.txt"local function eA()if not ae.dirty or type(writefile)~="function"then return end local ay={}
for sD,sE in pairs(ae.price)do ay[#ay+1]="P|"..sD.."|"..string.format("%.0f",sE)end for sF,sG in pairs(ae.order)do ay[#ay+1]="O|"..sF.."|"..table.concat(sG,",")end
if e.learned and e.enc then ay[#ay+1]="M|mode|"..tostring(e.learned.mode or"")for sH,eB in ipairs(e.learned.seq)do
local lG={}for lH=1,eB.n do lG[lH]=e.enc(eB.args[lH])end ay[#ay+1]=("A|%d|%s|%d|%s"):format(sH,eB.m,eB.n,table.concat(lG,";"))
end end local function hn(sI,sJ,eC)local lI={}for lJ=1,eC.n do lI[lJ]=e.enc(eC.args[lJ])end ay[#ay+1]=("R|%d|%s|%s|%d|%s"):format(sJ,sI,eC.m,eC.n,table.concat(lI,";"))
end if e.enc then for sK,sL in ipairs(A.rec.rules)do hn("rules",sK,sL)end if A.rec.on then hn("on",0,A.rec.on)end
if A.rec.off then hn("off",0,A.rec.off)end end for z_,cX in pairs(K.seen)do ay[#ay+1]=("K|%s|%s|%s|%s"):format(cX.name,cX.title or"",cX.rar or"",cX.price and string.format("%.0f",cX.price)or"")
end if pcall(writefile,hm,table.concat(ay,"\n"))then ae.dirty=false end end local function sM()if type(isfile)~="function"or type(readfile)~="function"then return end
local sN,sO=pcall(isfile,hm)if not(sN and sO)then return end local sP,lK=pcall(readfile,hm)if not(sP and type(lK)=="string")then return end
for sQ in lK:gmatch("[^\n]+")do local cb,cc,a1=sQ:match("^(%a)|([^|]+)|(.*)$")if cb=="P"then ae.price[cc]=tonumber(a1)
elseif cb=="M"then e.loadMode=(a1~=""and a1~="nil")and a1 or nil elseif cb=="A"and e.dec then local lL=tonumber(cc)
local lM,eD,sR=a1:match("^([^|]+)|(%d+)|(.*)$")if lL and lM then eD=tonumber(eD)local lN,eE={},0 for sS in(sR..";"):gmatch("([^;]*);")do
eE=eE+1 if eE<=eD then lN[eE]=e.dec(sS)end end e.loadSeq=e.loadSeq or{}e.loadSeq[lL]={m=lM,n=eD,args=lN}end elseif cb=="R"and e.dec then
local lO=tonumber(cc)local eF,sT,eG,sU=a1:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if lO and eF then eG=tonumber(eG)
local lP,eH={},0 for sV in(sU..";"):gmatch("([^;]*);")do eH=eH+1 if eH<=eG then lP[eH]=e.dec(sV)end end local ho={m=sT,n=eG,args=lP}
if eF=="rules"then A.rec.rules[lO]=ho elseif eF=="on"then A.rec.on=ho elseif eF=="off"then A.rec.off=ho end end
elseif cb=="K"then local lQ,lR,sW=a1:match("^([^|]*)|([^|]*)|(.*)$")K.seen[K.key(cc)]={name=cc,title=lQ~=""and lQ or nil,
rar=lR~=""and lR or nil,price=tonumber(sW)}elseif cb=="O"and a1~=""then local eI={}for sX in a1:gmatch("[^,]+")do eI[#eI+1]=sX end
if#eI>0 then ae.order[cc]=eI end end end end local function sY(eJ)if type(eJ)~="table"then return end local bI,lS=eJ.rarity,eJ.contents
if type(bI)~="string"or bI==""or type(lS)~="table"then return end local cY={}for Aa,eK in ipairs(lS)do if type(eK)=="table"and type(eK.butter)=="string"then
cY[#cY+1]={n=eK.butter,ch=tonumber(eK.chance)or 0}end end if#cY==0 then return end table.sort(cY,function(sZ,s0)return sZ.ch>s0 .ch end)
local cZ,c0={},false for s1,s2 in ipairs(cY)do cZ[s1]=s2 .n end local hp=ae.order[bI]if not hp or#hp~=#cZ then c0=true end
if not c0 then for lT=1,#cZ do if hp[lT]~=cZ[lT]then c0=true break end end end ae.order[bI]=cZ local hq=tonumber(eJ.price)
if hq and ae.price[bI]~=hq then ae.price[bI]=hq c0=true end if c0 then ae.dirty=true W.at=0 y("learned the "..bI.." order from its crate")
end end local function cd(s3,s4)local s5=s3:FindFirstChild(s4,true)local s6,hr=pcall(function()return s5 .Text end)
return(s6 and type(hr)=="string"and hr~="")and hr or nil end local function ak(lU)return W.pretty[lU]or lU end
K.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function K.key(s7)return et(s7 or"")end
function K.learn(a2)if type(a2)~="table"or type(a2 .name)~="string"then return end local hs=K.key(a2 .name)local a3=K.seen[hs]or{}
local s8=(K.seen[hs]==nil)or(tonumber(a2 .price)and a3 .price~=tonumber(a2 .price))a3 .name,a3 .title=a2 .name,a2 .title or a3 .title
a3 .rar,a3 .price=a2 .rarity or a3 .rar,tonumber(a2 .price)or a3 .price K.seen[hs]=a3 if s8 then K.at,ae.dirty=x(),true end
end function K.wanted(lV)return lV~=nil and d.CrateTicks[K.key(lV)]==true end function K.list()local ce={}for s9,eL in ipairs(K.base)do ce[K.key(eL[1])]={name=eL[1],title=eL[2],rar=eL[3],i=s9}end
for Ab,c1 in ipairs(W.rarOrder)do local lW=false for Ac,s_ in pairs(ce)do if s_.rar==c1 then lW=true break end end
if not lW and c1~="?"then local lX=c1:gsub("[^%w]","").."Crate"ce[K.key(lX)]={name=lX,title=c1 .." Crate",rar=c1,i=50,guess=true}
end end for lY,eM in pairs(K.seen)do local aR=ce[lY]or{i=100}aR.name,aR.title,aR.rar=eM.name or aR.name,eM.title or aR.title,eM.rar or aR.rar
aR.price,aR.guess=eM.price or aR.price,nil ce[lY]=aR end local c2,eN={},{}for ta,tb in ipairs(lF)do c2[tb]=ta end
for tc,lZ in ipairs(W.rarOrder)do c2[lZ]=c2[lZ]or(20+tc)end for td,c3 in pairs(ce)do c3 .k=td c3 .price=c3 .price or ae.price[c3 .rar or""]
eN[#eN+1]=c3 end table.sort(eN,function(bJ,bK)if bJ.price and bK.price and bJ.price~=bK.price then return bJ.price<bK.price end
local l0,l1=c2[bJ.rar or""]or 99,c2[bK.rar or""]or 99 if l0~=l1 then return l0<l1 end if(bJ.i or 100)~=(bK.i or 100)then return(bJ.i or 100)<(bK.i or 100)end
return bJ.k<bK.k end)return eN end local function te()local l2=ar:FindFirstChild("Assets")local l3=l2 and l2:FindFirstChild("Squishies")
if not l3 then return false end local ht,l4,cf={},{},{}local eO=0 for Ad,eP in ipairs(l3:GetChildren())do local c4=ab(eP.Name)
if c4~=""and not ht[c4]then local eQ=cd(eP,"RarityText")or"?"ht[c4]=eQ l4[c4]=cd(eP,"NameText")or eP.Name cf[eQ]=cf[eQ]or{}
table.insert(cf[eQ],c4)eO=eO+1 end end if eO==0 then return false end for l5,tf in pairs(cf)do local l6=ae.order[l5]or sC[l5]
local hu={}if l6 then for th,ti in ipairs(l6)do hu[ab(ti)]=th end end table.sort(tf,function(l7,l8)local hv,hw=hu[l7],hu[l8]
if hv and hw then return hv<hw end if hv then return true end if hw then return false end return ak(l7)<ak(l8)
end)end local hx={}for tj,tk in ipairs(lF)do hx[tk]=tj end local eR={}for tl in pairs(cf)do eR[#eR+1]=tl end table.sort(eR,function(hy,hz)
local hA,hB=ae.price[hy],ae.price[hz]if hA and hB and hA~=hB then return hA<hB end local hC,hD=hx[hy],hx[hz]if hC and hD then return hC<hD end
if hC then return true end if hD then return false end return hy<hz end)W.rar,W.pretty,W.members,W.rarOrder,W.n,W.at=ht,l4,cf,eR,eO,x()
return true end local function hE()if W.at==0 or(x()-W.at)>120 then pcall(te)end return W.n>0 end local function tm(tn)
local l9=ab(tn)return W.rar[l9]or(Q.name and ab(Q.name)==l9 and Q.rar)or"?"end local function to()local eS={}
for tp,tq in pairs(d.Targets)do if tq then eS[#eS+1]=ak(tp)end end table.sort(eS)return eS end local ah={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function l_()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function eT(ma)if type(makefolder)~="function"then return end local tr,ts=pcall(isfolder,ma)if not(tr and ts)then pcall(makefolder,ma)end
end local function eU(mb)if type(isfile)~="function"or type(readfile)~="function"then return nil end local tt,tu=pcall(isfile,mb)
if not(tt and tu)then return nil end local tv,tw=pcall(readfile,mb)return tv and tw or nil end local function c5(tx,ty)
if type(writefile)~="function"then return false end return(pcall(writefile,tx,ty))end local function mc(tz)local c6={}
if type(listfiles)~="function"then return c6 end local tA,md=pcall(listfiles,tz)if not tA or type(md)~="table"then return c6 end
for Ae,tB in ipairs(md)do c6[#c6+1]=tostring(tB)end return c6 end local function me()local eV={}for Af,tC in ipairs(mc(ah.cfg))do
local mf=tC:match("([^/\\]+)%.txt$")if mf then eV[#eV+1]=mf end end table.sort(eV)return eV end local function tD()
local V={"V|1"}V[#V+1]="N|Every|"..tostring(d.Every)V[#V+1]="N|GlazeLead|"..tostring(d.GlazeLead)V[#V+1]="N|FpsCap|"..tostring(d.FpsCap)
V[#V+1]="N|MemLimit|"..tostring(d.MemLimit)for Ag,mg in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do V[#V+1]="S|"..mg.."|"..d[mg]end
do local eW={}for tE,c7 in pairs(d.Pets)do local mh=(c7 .b and"b"or"")..(c7 .g and"g"or"")..(c7 .w and"w"or"")..((tonumber(c7 .f)or 0)>0 and tostring(c7 .f)or"")
if mh~=""then eW[#eW+1]=tE.."|"..mh end end table.sort(eW)V[#V+1]="P|-"for Ah,tF in ipairs(eW)do V[#V+1]="P|"..tF end
end for Ai,mi in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases"})do
V[#V+1]="B|"..mi.."|"..(d[mi]and"1"or"0")end local hF=F:GetAttribute("AutoRollRules")if type(hF)=="string"and hF~=""then d.ARrules,d.ARstop=hF,tostring(F:GetAttribute("AutoRollStop")or"")end
if d.ARrules~=""then V[#V+1]="S|rules|"..d.ARrules V[#V+1]="S|stop|"..d.ARstop end if c.winPos then V[#V+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then V[#V+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Aj,hG in ipairs({{"T",d.Targets},{"K",d.CrateTicks}})do
local eX={}for tG,tH in pairs(hG[2])do if tH then eX[#eX+1]=tG end end table.sort(eX)V[#V+1]=hG[1].."|-"for Ak,tI in ipairs(eX)do V[#V+1]=hG[1].."|"..tI end
end return table.concat(V,"\n")end local function tJ(hH)if type(hH)~="string"or hH==""then return false end local mj,mk,ml,mm,c8={},false,{},false,nil
for tK in hH:gmatch("[^\n]+")do local aE,ac,aw=tK:match("^(%a)|([^|]*)|?(.*)$")if aE=="N"and ac=="Every"then local hI=tonumber(aw)
if hI and hI>=1 then d.Every=math.floor(hI)end elseif aE=="N"and(ac=="FpsCap"or ac=="MemLimit")then local hJ=tonumber(aw)
if hJ and hJ>=0 then d[ac]=math.floor(hJ)end elseif aE=="N"and ac=="GlazeLead"then local eY=tonumber(aw)if eY and eY>=5 and eY<=600 then d.GlazeLead=math.floor(eY)end
elseif aE=="S"and(ac=="TeamNormal"or ac=="TeamFull"or ac=="TeamGlaze"or ac=="TeamWax")then d[ac]=aw elseif aE=="P"and ac~=""then
if not c8 then c8={}end if ac~="-"and aw~=""then c8[ac]={b=aw:find("b",1,true)and true or nil,g=aw:find("g",1,true)and true or nil,
w=aw:find("w",1,true)and true or nil,f=tonumber(aw:match("%d"))}end elseif aE=="B"then if d[ac]~=nil then d[ac]=(aw=="1")end
elseif aE=="S"and ac=="rules"then d.ARrules=aw elseif aE=="S"and ac=="stop"then d.ARstop=aw elseif aE=="W"then
c.winPos={tonumber(ac)or 10,tonumber(aw)or 44}elseif aE=="G"then c.togPos={tonumber(ac)or 10,tonumber(aw)or 300}
elseif aE=="T"and ac~=""then if ac~="-"then mj[ac]=true end mk=true elseif aE=="K"and ac~=""then if ac~="-"then ml[ac]=true end
mm=true end end if mk then d.Targets=mj end if mm then d.CrateTicks=ml end if c8 then d.Pets=c8 end return true
end local function eZ(cg)if not l_()then return false,"this executor cannot write files"end cg=(cg or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if cg==""then return false,"give the config a name"end eT(ah.dir)eT(ah.cfg)if not c5(ah.cfg.."/"..cg..".txt",tD())then return false,"could not write the file"end
c.config=cg return true,cg end local function mn(e0)local mo=eU(ah.cfg.."/"..e0 ..".txt")if not mo then return false,"no config called "..tostring(e0)end
if not tJ(mo)then return false,"that config looks empty"end c.config=e0 return true,e0 end local function mp(hK)
if hK then eT(ah.dir)c5(ah.auto,hK)elseif type(delfile)=="function"then pcall(delfile,ah.auto)else c5(ah.auto,"")
end c.autoload=hK end local function tL()if c.selfPath then return c.selfPath end local e1 for Al,tM in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",ah.dir})do
for Am,mq in ipairs(mc(tM))do local hL=mq:lower()if hL:sub(-4)==".lua"and(hL:find("sab_farm",1,true)or hL:find("sab farm",1,true))then
e1=e1 or mq end end end c.selfPath=e1 return e1 end ah.stub=[[
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
local function tN()if not l_()then return false,"this executor cannot write files"end eT("autoexec")if not c5(ah.exec,ah.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local e2=(function()local tO,tP=pcall(function()return game:GetService("TeleportService")end)return tO and tP or nil end)()
local function mr()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local tQ=queueonteleport or queue_on_teleport return(pcall(tQ,ah.stub))end local function c9(tR)if c.rejoining then return end
c.rejoining=true y("REJOIN ("..tR..")")pcall(eA)if c.autoload then pcall(eZ,c.autoload)end local tS=mr()y(tS and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for An=1,30 do if not e2 then break end pcall(function()e2:Teleport(game.PlaceId,F)end)task.wait(10)
end end)end local function tT()local tU,ms=pcall(function()return game:GetService("GuiService")end)if tU and ms then
pcall(function()T(ms.ErrorMessageChanged:Connect(function()if d.Rejoin then c9("roblox error message")end end))
end)end pcall(function()local mt=game:GetService("CoreGui")local mu=mt and mt:WaitForChild("RobloxPromptGui",15)
local mv=mu and mu:WaitForChild("promptOverlay",15)if mv then T(mv.ChildAdded:Connect(function(tV)if d.Rejoin and tostring(tV.Name):lower():find("errorprompt",1,true)then c9("disconnect prompt")end
end))end end)if e2 then pcall(function()T(e2 .TeleportInitFailed:Connect(function()c.rejoining=false if d.Rejoin then task.delay(5,function()c9("teleport retry")end)end
end))end)end end local function mw(tW)local mx=c.plot and c.plot:FindFirstChild(tW)if not mx then return nil,false end
for Ao,hM in ipairs(mx:GetChildren())do if hM:IsA("Model")or hM:IsA("BasePart")then return hM,true end end return nil,true
end local function bL()local bj=mw("RolledSquishy")if not bj then return nil end return{model=bj,name=bj.Name,pretty=cd(bj,"NameText")or ak(ab(bj.Name)),
rar=cd(bj,"RarityText")or tm(bj.Name),price=cd(bj,"PriceText")}end local function my(hN)return type(hN)=="string"and(W.rar[ab(hN)]~=nil or sp(hN))
end local function aa()local hO=mw("SquishyEquipped")if hO then c.carrySrc,e.heldAt="model",x()return hO.Name,hO end
local mz=F.Character if mz then for Ap,c_ in ipairs(mz:GetDescendants())do if(c_:IsA("Model")or c_:IsA("Tool"))and my(c_.Name)then
c.carrySrc,e.heldAt="character",x()return c_.Name,c_ end end end local e3=F:GetAttribute("SquishyEquipped")if type(e3)=="string"and e3~=""and my(e3)and x()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return e3,nil end c.carrySrc=nil end local function Aq()local Ar,tX=aa()return tX end local function mA()
local mB=bL()local hP=mB and sr(mB.price)local hQ=a0()if hP and hQ and hQ<hP*0.5 then return hQ,hP end end local function ci(tY)
cT[#cT+1]=os.date("%H:%M:%S").." "..tY if#cT>40 then table.remove(cT,1)end end local function tZ(bM,e4)if type(bM)~="string"then return end
ci(("Roll(%s,%s)"):format(bM,tostring(e4)))if bM:lower():find("crate",1,true)then e.rolled,e.rolledAt=bM,x()return
end Q.seq=Q.seq+1 Q.name,Q.at=bM,x()Q.rar=type(e4)=="string"and e4 or nil c.rolls=c.rolls+1 if aQ(bM)then y(("ROLL %s [%s] = TARGET"):format(bM,tostring(e4)))end
end local function t0(bN)if type(bN)~="table"then return end local e5=bN.butter or bN.itemName if type(e5)~="string"then return end
c.gifts=c.gifts+1 Q.gift,Q.giftAt=e5,x()if type(bN.giftId)=="string"then local mC=ar:FindFirstChild("Remotes")
local mD=mC and mC:FindFirstChild("GiftThanks")if mD then pcall(function()mD:FireServer(bN.giftId)end)end end
ci("Gift("..e5 .." from "..tostring(bN.fromName)..")")y(("GIFT from %s: %s - it will not be waxed"):format(tostring(bN.fromName),e5))
end local function t1()local mE=ar:WaitForChild("Remotes",30)if not c.alive then return end if not mE then y("Remotes folder missing - no roll events")return end
T(F:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local mF=F:GetAttribute("SquishyEquipped")
if type(mF)=="string"and mF~=""then e.heldAt=x()end end))local t7={SquishyRollAnimation=tZ,InitSquishy=function(mG)Q.init,Q.initAt=tostring(mG),x()ci("Init("..tostring(mG)..")")end,
CrateUpdate=function(cj,mH)pcall(sY,cj)pcall(K.learn,cj)if type(cj)=="table"then local t2=mH==true or(e.rolled~=nil and x()-e.rolledAt<15)or e.waiting
if not t2 then return end local t3=not e.waiting local t4=e.on e.waiting,e.data,e.at=true,cj,x()e.on=(mH==true)
e.title=tostring(cj.title or cj.name or"crate")if e.on and not t4 then e.openedAt,e.byYou=x(),not e.ours if e.onShow then task.spawn(e.onShow)end
end if e.on then ci("CrateWindow open("..e.title..")")elseif t3 then ci("Crate waiting("..e.title..")")y(e.title.." is waiting on your stand")
end else if e.waiting then ci("Crate gone")end e.on,e.waiting,e.data,e.prompt=false,false,nil,nil local t5=e.byYou
e.summonFails,e.ours,e.byYou=0,false,false if e.onGone then task.spawn(e.onGone,t5)end if e.classify then local t6=x()
task.spawn(function()pcall(e.classify,t6)end)end end end,GiftReceived=t0,}for e6,t8 in pairs(t7)do local hR=mE:FindFirstChild(e6)
if hR and hR:IsA("RemoteEvent")then T(hR.OnClientEvent:Connect(t8))elseif e6~="CrateUpdate"and e6~="GiftReceived"then y("remote "..e6 .." missing")end
end end local function hS()local bO=bL()if bO then if aQ(bO.name)then return{state="match",shown=bO.pretty,src="pad",info=bO}
end return{state="skip",info=bO,level="idle",text=("on pad: %s [%s] - not ticked"):format(bO.pretty,tostring(bO.rar))}
end if Q.name and(x()-Q.at)<4 then if aQ(Q.name)then return{state="match",shown=ak(ab(Q.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(ab(Q.name)),tostring(Q.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function e7(t9,t_,ua,ub)
local e8=RaycastParams.new()e8 .FilterType=Enum.RaycastFilterType.Exclude local hT={F.Character}for As,uc in ipairs(ub or{})do hT[#hT+1]=uc end
e8 .FilterDescendantsInstances=hT pcall(function()e8 .RespectCanCollide=true end)local mI=ao:Raycast(Vector3 .new(t9,t_+4,ua),Vector3 .new(0,-30,0),e8)
return mI and mI.Position or nil end local function da(mJ)local mK=mJ:FindFirstChildOfClass("Humanoid")return((mK and mK.HipHeight)or 2)+mJ.HumanoidRootPart.Size.Y/2+0.2
end local function hU(ud,ue)local hV=ud:FindFirstChildOfClass("Humanoid")local uf=x()while x()-uf<ue do if hV and(hV.FloorMaterial~=Enum.Material.Air or hV.SeatPart)then return true end
ad(0.05)end return false end local function aF(ug,hW,hX)local mL=ug.HumanoidRootPart mL.AssemblyLinearVelocity=Vector3 .new(0,0,0)
mL.CFrame=hX and CFrame.new(hW,Vector3 .new(hX.X,hW.Y,hX.Z))or CFrame.new(hW)end local function ck(a4,mM)local bP=as()
if not bP or not a4 then return false end local bk=a4 .Position local e9=math.clamp(math.max(a4 .Size.X,a4 .Size.Z)/2+2.2,3,7)
local mN=(mM and mM.MaxActivationDistance)or 10 if e9>mN-2 then e9=math.max(2.5,mN-2)end local db={}local function bQ(dc)
dc=Vector3 .new(dc.X,0,dc.Z)if dc.Magnitude>0.05 then db[#db+1]=dc.Unit end end local mO=ls()if mO then bQ(mO-bk)end
bQ(a4 .CFrame.LookVector)bQ(-a4 .CFrame.LookVector)bQ(a4 .CFrame.RightVector)bQ(-a4 .CFrame.RightVector)bQ(bP.HumanoidRootPart.Position-bk)
if#db==0 then bQ(Vector3 .new(0,0,1))end local uh,e_=da(bP),false for At,ui in ipairs(db)do local fa=bk+ui*e9
local hY=e7(fa.X,bk.Y,fa.Z,{a4})if hY and math.abs(hY.Y-bk.Y)<14 then aF(bP,Vector3 .new(fa.X,hY.Y+uh,fa.Z),bk)
if hU(bP,0.7)then e_=true break end end end if not e_ then aF(bP,bk+db[1]*e9+Vector3 .new(0,3,0),bk)e_=hU(bP,1)
end ad(0.12)return e_ end local function mP(dd)if not dd.Parent or not dd.Enabled then return false end pcall(function()dd:InputHoldBegin()end)
ad(math.max(dd.HoldDuration,0)+0.08)pcall(function()dd:InputHoldEnd()end)return true end local function am(mQ,uj)
local uk=x()while x()-uk<uj do if mQ()then return true end ad(0.05)end return mQ()end local function de(cl,ul,mR,um)
local uo=c.zapFirst and{"zap","hold"}or{"hold","zap"}for up,hZ in ipairs(uo)do if up==2 and(um or not(cl.Parent and cl.Enabled and(not mR or mR())))then break end
local h0 if hZ=="hold"then h0=mP(cl)else h0=type(fireproximityprompt)=="function"and cl.Parent~=nil and cl.Enabled and pcall(fireproximityprompt,cl)end
if h0 and am(ul,1.2)then c.zapFirst=(hZ=="zap")return true,hZ end end return false end local function mS(h1)local bl=lD()
if not bl or not bl.Enabled then y("buy: nothing on the pad")return false end local mT=cW(bl)if not mT then y("buy: pad part missing")return false end
c.lastBuyAt=x()local uq,mU=Q.seq,a0()ck(mT,bl)if not bl.Enabled then y("buy aborted: pad emptied")return false end
local cm=hS()if not h1 and cm.state~="match"then y("buy aborted: "..(cm.text or"pad changed"))c.matchSince=nil
return false end local h2=cm.info and cm.info.name or(cm.state=="match"and Q.name)or nil local function ur()return bl.Enabled and aa()==nil and(h1 or hS().state=="match")
end local us,ut=de(bl,function()return aa()~=nil or((not bl.Enabled)and(h1 or Q.seq==uq))end,ur,mA()~=nil)if us then
am(function()return aa()~=nil end,0.8)local df=aa()local mV=a0()c.holding,c.bought,c.cashFails=true,c.bought+1,0
c.matchSince=nil Q.name,Q.rar,Q.at=nil,nil,x()y(("BOUGHT %s%s via %s"):format(df and ak(ab(df))or(cm.shown or"?"),(mU and mV)and(" for $"..aD(mU-mV))or"",ut))
if df and h2 and ab(df)~=ab(h2)then y(("note: picked up %s, not %s"):format(df,h2))end return true end c.cashFails=c.cashFails+1
c.noCashUntil=x()+math.min(8*2^(c.cashFails-1),60)local mW=bL()y(("BUY REFUSED: cash short? have $%s, price %s"):format(aD(a0()),(mW and mW.price)or"?"))
return false end local function mX()local fb=aa()if not fb then c.holding=false y("place: hands are empty")return false
end if not aQ(fb)then y(("REFUSED TO WAX %s - it is not ticked"):format(ak(ab(fb))))return false end for Au=1,d.PlaceTries do
local bm=sB()if not bm then y("place: no free station")break end local mY=cW(bm)if mY then ck(mY,bm)local mZ=aa()
if not mZ then c.holding=false y("place: hands emptied on the way")return false end if not aQ(mZ)then y("place: what I carry changed, not waxing it")return false end
if bm.Enabled then local uu,uv=de(bm,function()return not bm.Enabled end,function()return bm.Enabled end)if uu then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=x()+2.5,0 Q.name,Q.rar,Q.at=nil,nil,x()
y(("WAXED %s #%d at %s via %s"):format(ak(ab(fb)),c.placed,bm.Parent.Parent.Name,uv))return true end end end ad(0.25)
end c.placeFails=c.placeFails+1 if aa()==nil then c.holding=false end y("PLACE FAILED ("..c.placeFails..")")if c.placeFails>=2 then
c.capHit,c.running,c.capAt=true,false,x()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(aa()))y(c.capMsg)end return false end function q.place()local uw=x()while c.alive and q.editing and x()-uw<25 do ad(0.2)end
if d.Teams and d.TeamWax~=""then q.placing=true local ux=x()while c.alive and q.current()~=d.TeamWax and x()-ux<5 do ad(0.1)end
if q.current()==d.TeamWax then ad(0.3)else y("wax team did not come on in time - placing anyway")end end local uy,m0=pcall(mX)
q.placing=false if not uy then error(m0,0)end return m0 end local function m1(m2)return type(m2)=="string"and m2:lower():find("crate",1,true)~=nil
end local uz={SABFarmGui=1,SABToggle=1,SABError=1}local function h3(uA)local bn=uA while bn do if uz[bn.Name]then return false end
if bn:IsA("ScreenGui")then local uB,uC=pcall(function()return bn.Enabled end)return(not uB)or uC~=false end if bn:IsA("GuiObject")and not bn.Visible then return false end
bn=bn.Parent end return false end local function fc(fd)local cn=""pcall(function()if fd:IsA("TextButton")then cn=fd.Text end end)
if not cn:find("%a")then for Av,fe in ipairs(fd:GetDescendants())do if(fe:IsA("TextLabel")or fe:IsA("TextButton"))and fe.Text:find("%a")then cn=fe.Text break end
end end if not cn:find("%a")then cn=fd.Name end return(cn:lower():gsub("[^%a]",""))end local function uD()local dg,dh
local m3=F:FindFirstChildOfClass("PlayerGui")if not m3 then return nil,nil end for Aw,di in ipairs(m3:GetDescendants())do
if di:IsA("GuiButton")and h3(di)then local h4=fc(di)if h4:sub(1,4)=="open"and not h4:find("shop",1,true)then dg=dg or di end
if h4:sub(1,7)=="discard"then dh=dh or di end end end if dg and dh then return dg,dh end if e.on then return dg,dh end
return nil,nil end local h5=(function()local uE,uF=pcall(function()return game:GetService("VirtualInputManager")end)return uE and uF or nil end)()
local function m4(a5,h6)local h7={}local function m5(uG)h7[#h7+1]=uG end if c.tapWay then m5(c.tapWay)end for Ax,m6 in ipairs({"touch","conn","signal"})do
if m6~=c.tapWay then m5(m6)end end local function m7(uH,...)local uI,h8=pcall(getconnections,uH)if not(uI and type(h8)=="table"and#h8>0)then return false end
local m8,uJ,uK=false,{...},select("#",...)for Ay,uL in ipairs(h8)do if pcall(function()uL:Fire(table.unpack(uJ,1,uK))end)then m8=true end
end return m8 end local function m9()local m_=Vector3 .new(0,0,0)pcall(function()local na,nb=a5 .AbsolutePosition,a5 .AbsoluteSize
m_=Vector3 .new(na.X+nb.X/2,na.Y+nb.Y/2,0)end)local h9={Position=m_,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()h9 .UserInputType=Enum.UserInputType.Touch end)pcall(function()h9 .UserInputState=Enum.UserInputState.End end)
return h9 end for Az,a6 in ipairs(h7)do local dj=false if a6=="conn"and type(getconnections)=="function"then if m7(a5 .MouseButton1Click)then
dj=true if am(h6,1.5)then c.tapWay=a6 return true,a6 end end dj=m7(a5 .Activated,m9(),1)elseif a6=="signal"and type(firesignal)=="function"then
if pcall(firesignal,a5 .MouseButton1Click)then if am(h6,1.5)then c.tapWay=a6 return true,a6 end end dj=pcall(firesignal,a5 .Activated,m9(),1)
elseif a6=="touch"and h5 then dj=pcall(function()local nc,nd=a5 .AbsolutePosition,a5 .AbsoluteSize local ne=0
local nf=a5:FindFirstAncestorWhichIsA("ScreenGui")local uM,uN=pcall(function()return nf and nf.IgnoreGuiInset end)
if not(uM and uN)then pcall(function()ne=game:GetService("GuiService"):GetGuiInset().Y end)end local ng,nh=nc.X+nd.X/2,nc.Y+nd.Y/2+ne
h5:SendMouseButtonEvent(ng,nh,0,true,game,1)task.wait(0.06)h5:SendMouseButtonEvent(ng,nh,0,false,game,1)end)end
if dj and am(h6,1.5)then c.tapWay=a6 return true,a6 end end return false end e.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function h_(ni)local dk=ni.Parent while dk and dk~=c.plot do if e.NOT[dk.Name]then return false end dk=dk.Parent
end local ia=(ni.ActionText or""):lower()if ia:find("roll",1,true)or ia:find("place",1,true)or ia:find("sell",1,true)then return false end
return true end local function uO()if e.prompt and e.prompt.Parent and e.prompt.Enabled then return e.prompt end
if not c.plot then return nil end local nj=c.plot:FindFirstChild("CrateStand")local dl if nj then for AA,ff in ipairs(nj:GetDescendants())do
if ff:IsA("ProximityPrompt")and ff.Enabled and h_(ff)then dl=ff break end end end if not dl then for AB,bo in ipairs(c.plot:GetDescendants())do
if bo:IsA("ProximityPrompt")and bo.Enabled and h_(bo)then local nk=bo:FindFirstAncestorWhichIsA("Model")local uP=((bo.ActionText or"").." "..(bo.ObjectText or"").." "..bo.Name.." "..(nk and nk.Name or"")):lower()
if uP:find("crate",1,true)then dl=bo break end end end end e.prompt=dl return dl end local function ib()if e.on then return true end
local dm=uO()if not dm then e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: cannot find where to open "..e.title.." - open it once by hand")
return false end local nl=cW(dm)if nl then ck(nl,dm)end e.ours=true de(dm,function()return e.on end)if am(function()return e.on end,3)then
e.summonFails=0 return true end e.ours=false e.summonFails=e.summonFails+1 e.lastFail=x()y("crate: pressed "..ev(dm).." but no window came up")
return false end do local function uQ(nm)local co=nm.Parent while co and co:IsA("GuiObject")do local nn,no=false,false
for AC,dn in ipairs(co:GetDescendants())do if dn~=nm and dn:IsA("GuiButton")and fc(dn):sub(1,7)=="discard"then nn=true end
if dn:IsA("TextLabel")then local ic=dn.Text:lower()if ic:find("crate",1,true)or ic:find("can contain",1,true)or ic:find("cost",1,true)then no=true end
end if nn and no then return co end end co=co.Parent end end function e.findWin()if e.win and e.win.Parent then return e.win end
local np=F:FindFirstChildOfClass("PlayerGui")if not np then return nil end for AD,fg in ipairs(np:GetDescendants())do
if fg:IsA("GuiButton")and not fg:FindFirstAncestor("SABFarmGui")and fc(fg):sub(1,4)=="open"then local ie=uQ(fg)
if ie then e.win=ie return ie end end end end local function uR(uS)for AE,fh in ipairs(uS:GetDescendants())do
if fh:IsA("GuiButton")then local nq,ig=fc(fh),fh.Name:lower()if nq=="x"or nq=="close"or ig=="x"or ig:find("close",1,true)or ig:find("exit",1,true)then return fh end
end end end e.onShow=function()e.win=nil e.findWin()end e.onGone=function(uT)task.wait(uT and 4 or 1.2)if e.on or e.waiting then return end
local fi=e.findWin()if not fi or not h3(fi)then return end local nr=uR(fi)if nr and m4(nr,function()return not h3(fi)end)then return end
y("the crate window is still open - tap its X")end end local function fj(fk)if not ib()then return false end local ns=x()-(e.openedAt or 0)
if ns<0.6 then ad(0.6-ns)end local ih=e.title local uU,uV=uD()local nt=fk and uU or uV if not nt then e.lastFail=x()
c.crateFails=c.crateFails+1 y(("crate: no %s button found in %s"):format(fk and"Open"or"Discard",ih))return false
end local uW=aa()local uX,AF=m4(nt,function()return(not e.on)or(aa()~=nil and aa()~=uW)end)if not uX then e.lastFail=x()
c.crateFails=c.crateFails+1 y("crate: could not press "..(fk and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if fk then c.crates=c.crates+1 am(function()return aa()~=nil end,1.5)local nu=aa()
y(("OPENED %s -> %s"):format(ih,nu and ak(ab(nu))or"?"))else y("discarded "..ih.." (nothing ticked in it)")end
return true end e.calls={}function e.saw(uY,...)local uZ=select("#",...)e.calls[#e.calls+1]={t=x(),m=uY,n=uZ,args={...},data=e.data,
crate=e.data and e.data.name,title=e.title,rar=e.data and e.data.rarity}if#e.calls>12 then table.remove(e.calls,1)end
end function e.slot(az,a7)local bp=type(az)if(bp=="string"or bp=="number")and type(a7 .data)=="table"then for nv,ii in pairs(a7 .data)do
if ii==az and type(nv)=="string"and(type(ii)=="string"or type(ii)=="number")then return{__slot="f:"..nv}end end
end if bp=="string"then if a7 .crate and az==a7 .crate then return{__slot="crate"}end if a7 .title and az==a7 .title then return{__slot="title"}end
if a7 .rar and az==a7 .rar then return{__slot="rarity"}end return az end if bp=="number"or bp=="boolean"or bp=="nil"then return az end
if bp=="table"then local nw={}for u0,nx in pairs(az)do if type(nx)=="table"then return nil,"nested table"end local u1,ny=e.slot(nx,a7)
if ny then return nil,ny end nw[u0]=u1 end return nw end local u2,u3=pcall(function()return az:IsA("Instance")end)
if u2 and u3 then if az==F then return{__slot="player"}end if c.plot and az==c.plot then return{__slot="plot"}end
local fl=c.plot and c.plot:FindFirstChild("CrateStand")if fl and az==fl then return{__slot="stand"}end if fl and az.Parent==fl then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bp..")"end function e.resolve(fm)if type(fm)~="table"then return fm end
local aJ=fm.__slot if aJ and aJ:sub(1,2)=="f:"then return e.data and e.data[aJ:sub(3)]end if aJ=="crate"then return e.data and e.data.name end
if aJ=="title"then return(e.data and e.data.title)or e.title end if aJ=="rarity"then return e.data and e.data.rarity end
if aJ=="player"then return F end if aJ=="plot"then return c.plot end if aJ=="stand"or aJ=="model"then local ij=c.plot and c.plot:FindFirstChild("CrateStand")
if aJ=="stand"or not ij then return ij end for AG,nz in ipairs(ij:GetChildren())do if m1(nz.Name)then return nz end end
return nil end local nA={}for u4,u5 in pairs(fm)do nA[u4]=e.resolve(u5)end return nA end function e.classify(ik)
if e.directOff then return end local fn={}for AH,il in ipairs(e.calls)do if il.t<=ik+0.05 and ik-il.t<=6 then fn[#fn+1]=il end
end if#fn==0 then return end if not am(function()return(e.heldAt or 0)>=ik-1 end,2.5)then return end local dp={}
for AI,dq in ipairs(fn)do local nB={}for nC=1,dq.n do local u6,nD=e.slot(dq.args[nC],dq)if nD then y("crate call has "..nD.." - keeping the button method")
return end nB[nC]=u6 end dp[#dp+1]={m=dq.m,n=dq.n,args=nB}end local im=e.learned e.learned={seq=dp,mode=im and im.mode or nil}
ae.dirty=true if not im then y(("learned how to open crates directly (%d call%s)"):format(#dp,#dp==1 and""or"s"))end
end function e.replay()local nE=e.learned local nF=ar:FindFirstChild("Remotes")local io=nF and nF:FindFirstChild("CrateAction")
if not(nE and io)then return false end local nG=table.unpack or unpack e.replaying=true for AJ,dr in ipairs(nE.seq)do
local ip={}for nH=1,dr.n do ip[nH]=e.resolve(dr.args[nH])end task.spawn(function()pcall(function()if dr.m=="InvokeServer"then io:InvokeServer(nG(ip,1,dr.n))
else io:FireServer(nG(ip,1,dr.n))end end)end)task.wait(0.2)end e.replaying=false return true end function e.esc(u7)return(u7:gsub("[%%|;=,\n]",function(u8)return("%%%02X"):format(u8:byte())end))end
function e.enc(bR)local fo=type(bR)if fo=="string"then return"s"..e.esc(bR)end if fo=="number"then return"n"..tostring(bR)end
if fo=="boolean"then return bR and"b1"or"b0"end if fo=="nil"then return"z"end if bR.__slot then return"k"..bR.__slot end
local iq={}for u9,u_ in pairs(bR)do iq[#iq+1]=e.enc(u9).."="..e.enc(u_)end return"t"..table.concat(iq,",")end
function e.dec(nI)local ds,dt=nI:sub(1,1),nI:sub(2)local function va(vb)return(vb:gsub("%%(%x%x)",function(vc)return string.char(tonumber(vc,16))end))end
if ds=="s"then return va(dt)end if ds=="n"then return tonumber(dt)end if ds=="b"then return dt=="1"end if ds=="k"then return{__slot=dt}end
if ds=="t"then local nJ={}for vd in dt:gmatch("[^,]+")do local nK,ve=vd:match("^(.-)=(.*)$")if nK then local nL=e.dec(nK)
if nL~=nil then nJ[nL]=e.dec(ve)end end end return nJ end return nil end function e.goneOrNew(vf)return function()
if not e.waiting then return true end local nM=aa()return nM~=nil and nM~=vf end end function e.near()local nN=ar:FindFirstChild("Remotes")
local nO=nN and nN:FindFirstChild("CrateAction")local ir=as()local is=c.plot and c.plot:FindFirstChild("CrateStand")
local it=is and is:FindFirstChild("Spot")if not(nO and ir and it)then return false,"no crate stand or remote"end
local iu=ir.HumanoidRootPart local fp=iu.CFrame local nP,iv=e.title,"no answer"local vg=aa()local nQ=is:FindFirstChild("Holder")
local function nR()if not nQ then return e.waiting or e.on end for AK,vh in ipairs(nQ:GetChildren())do if vh:IsA("Model")then return true end end
return false end for vi=1,3 do if not(e.waiting or e.on)or not nR()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end if(iu.Position-it.Position).Magnitude>8 then ck(it,e.prompt)end ad(0.12+0.15*vi)
local aS={}e.replaying=true task.spawn(function()aS.ok,aS.v=pcall(function()return nO:InvokeServer("open")end)
aS.done=true end)am(function()return aS.done end,6)e.replaying=false local bS=aS.v if aS.done and aS.ok and type(bS)=="table"and bS.ok then
c.crates,e.fails,e.nearFails=c.crates+1,0,0 e.waiting,e.on,e.quietUntil=false,false,x()+4 y(("OPENED %s -> %s (no window)"):format(nP,bS.prize and ak(ab(tostring(bS.prize)))or"?"))
am(function()local nS=aa()return nS~=nil and nS~=vg end,1.5)if(iu.Position-fp.Position).Magnitude>8 then pcall(function()aF(ir,fp.Position,fp.Position+fp.LookVector)end)end
return true,"opened"end iv=(aS.done and aS.ok and type(bS)=="table")and tostring(bS.reason or"refused, no reason given")
or(aS.done and("error: "..tostring(bS))or"no answer in 6s")ad(0.3)if not nR()then e.waiting,e.on,e.quietUntil=false,false,x()+4
return true,"already gone"end end e.nearFails=(e.nearFails or 0)+1 y(("crate: the server would not open %s next to the stand (%s)"):format(nP,iv))
return false,iv end function e.smart()local iw=e.title if(e.nearFails or 0)<3 then local vj=e.near()if vj then return true end
if e.nearFails>=3 then y("opening next to the stand failed 3 times - trying the older ways")end end local bT=e.learned
if bT then local ix=aa()if e.on then e.replay()if am(e.goneOrNew(ix),3.5)then c.crates=c.crates+1 y("OPENED "..iw.." (direct)")
return true end else if bT.mode~="window"then e.replay()if am(e.goneOrNew(ix),3.5)then c.crates,e.fails=c.crates+1,0
if bT.mode~="direct"then bT.mode,ae.dirty="direct",true y("crates now open directly - the window never comes up")
end y("OPENED "..iw.." (direct, no window)")return true end end if ib()then e.replay()if am(e.goneOrNew(ix),3.5)then
c.crates,e.fails=c.crates+1,0 if bT.mode~="window"then bT.mode,ae.dirty="window",true y("crates need their window up first - it shows briefly")
end y("OPENED "..iw.." (direct, window up)")return true end end end e.fails=(e.fails or 0)+1 e.lastBad,e.learned,ae.dirty=bT,nil,true
if e.fails>=3 then e.directOff=true y("direct crate opening failed 3 times - using the button for now")else y("the learned crate call did not work - back to pressing Open")
end end return fj(true)end function A.snap()return{rules=F:GetAttribute("AutoRollRules"),stop=F:GetAttribute("AutoRollStop"),
on=F:GetAttribute("AutoRollOn"),main=F:GetAttribute("AutoRoll")}end A.cache={}function A.watchCache()A.cache=A.snap()
for vk,nT in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(F:GetAttributeChangedSignal(nT):Connect(function()A.cache[vk]=F:GetAttribute(nT)end))
end end function A.isOn()return F:GetAttribute("AutoRollOn")==true end function A.saw(vl,...)local fq=A.cache
local vm={m=vl,n=select("#",...),args={...},before={rules=fq.rules,stop=fq.stop,on=fq.on,main=fq.main}}task.delay(1.5,function()
if c.alive then pcall(A.learnOne,vm)end end)end function A.learnOne(du)local au,dv=A.snap(),du.before local fr=(au.rules~=dv.rules)or(au.stop~=dv.stop)
local nU=(au.on~=dv.on)or(au.main~=dv.main)if not fr and not nU then return end local nV={}for nW=1,du.n do local aG=du.args[nW]
local bU=type(aG)if bU=="string"and aG~=""and aG==au.rules then aG={__slot="rules"}elseif bU=="string"and aG~=""and fr and aG==au.stop and au.stop~=dv.stop then aG={__slot="stop"}
elseif bU=="table"then local nX={}for vn,cp in pairs(aG)do if type(cp)=="table"or(type(cp)=="userdata")then A.msg="Auto Roll sends something I cannot repeat"return
end nX[vn]=(type(cp)=="string"and cp~=""and cp==au.rules)and{__slot="rules"}or cp end aG=nX elseif bU~="string"and bU~="number"and bU~="boolean"and bU~="nil"then
if aG==F then aG={__slot="player"}else A.msg="Auto Roll sends something I cannot repeat"return end end nV[nW]=aG
end local cq={m=du.m,n=du.n,args=nV}if fr then local iy=false for vo=1,cq.n do local dw=cq.args[vo]if type(dw)=="table"and dw.__slot=="rules"then iy=true end
if type(dw)=="table"and not dw.__slot then for AL,nY in pairs(dw)do if type(nY)=="table"and nY.__slot=="rules"then iy=true end end
end end if iy then A.rec.rules={cq}else table.insert(A.rec.rules,cq)if#A.rec.rules>60 then table.remove(A.rec.rules,1)end
end end if nU then if au.on==true then A.rec.on=cq else A.rec.off=cq end d.AutoRoll=(au.on==true)end if au.rules and au.rules~=""then d.ARrules,d.ARstop=au.rules,au.stop or""end
ae.dirty=true A.msg=""y(("learned an Auto Roll %s message"):format(fr and"choices"or(au.on and"on"or"off")))end
function A.resolve(cr)if type(cr)~="table"then return cr end if cr.__slot=="rules"then return d.ARrules~=""and d.ARrules or F:GetAttribute("AutoRollRules")end
if cr.__slot=="stop"then return d.ARstop~=""and d.ARstop or F:GetAttribute("AutoRollStop")end if cr.__slot=="player"then return F end
local nZ={}for vp,vq in pairs(cr)do nZ[vp]=A.resolve(vq)end return nZ end function A.replay(n0,vr)local n1=table.unpack or unpack
for AM,dx in ipairs(vr)do local iz={}for n2=1,dx.n do iz[n2]=A.resolve(dx.args[n2])end A.replaying=true pcall(function()
if dx.m=="InvokeServer"then task.spawn(function()pcall(function()n0:InvokeServer(n1(iz,1,dx.n))end)end)else n0:FireServer(n1(iz,1,dx.n))end
end)A.replaying=false task.wait(0.25)end end function A.apply(n3,vs)if A.busy or not c.alive then return end A.busy=true
pcall(function()local n4=ar:FindFirstChild("Remotes")local iA=n4 and n4:FindFirstChild("AutoRollAction")if not iA then A.msg="this game has no AutoRollAction"return end
local bq=d.AutoRoll if bq and d.ARrules~=""and F:GetAttribute("AutoRollRules")~=d.ARrules then if#A.rec.rules==0 then
A.msg="pick your Auto Roll choices once in the game's menu so I can learn them"y(A.msg)else A.replay(iA,A.rec.rules)
if am(function()return F:GetAttribute("AutoRollRules")==d.ARrules end,4)then y("Auto Roll choices put back")else
A.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"y(A.msg)end end end if bq==A.isOn()or(not bq and not vs)then return end
local fs=bq and A.rec.on or A.rec.off if not fs then local dy=bq and A.rec.off or A.rec.on local n5=dy~=nil for vt=1,dy and dy.n or 0 do
if type(dy.args[vt])=="boolean"then n5=false end end if n5 then fs=dy end end if not fs then A.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bq and"on"or"off")
y(A.msg)return end A.replay(iA,{fs})if am(function()return A.isOn()==bq end,4)then A.msg=""y(("Auto Roll switched %s%s"):format(bq and"ON"or"OFF",n3 and(" ("..n3 ..")")or""))
else A.msg="Auto Roll did not switch - do it once in the game so I can relearn it"y(A.msg)end end)A.busy=false
end l.HS=game:GetService("HttpService")l.uid=(function()local vu,vv=pcall(function()return F.UserId end)return vu and vv or 0 end)()
l.buyMsg,l.wishMsg,l.wishN="","",0 function l.info()if l.I then return l.I end local vw,iB=pcall(function()return require(ar:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if vw and type(iB)=="table"and type(iB.Pets)=="table"then l.I=iB end return l.I end function l.order()if l.list then return l.list end
local br=l.info()if not br then return{}end local bV={}if type(br.Order)=="table"and#br.Order>0 then for AN,n6 in ipairs(br.Order)do if br.Pets[n6]then bV[#bV+1]=n6 end end
else for vx in pairs(br.Pets)do bV[#bV+1]=vx end table.sort(bV,function(vy,vz)return(br.Pets[vy].price or 0)<(br.Pets[vz].price or 0)end)
end l.list=bV return bV end function l.nice(n7,iC)local n8=l.info()local n9=n8 and n8 .Pets[n7]return((iC and iC~="")and(iC.." ")or"")..(n9 and n9 .displayName or tostring(n7))
end function l.data()local ft=F:GetAttribute("PetsData")if type(ft)~="string"then return nil end if ft==l.rawD then return l.lastD end
local vA,dz=pcall(function()return l.HS:JSONDecode(ft)end)dz=(vA and type(dz)=="table")and dz or nil l.rawD,l.lastD=ft,dz
return dz end function l.pen()return ar:FindFirstChild("PetMeadowSpawns")end function l.srv()return ao:GetServerTimeNow()end
function l.money()local iD=F:FindFirstChild("MoneyValue")if iD and type(iD.Value)=="number"then return iD.Value end
return a0()or 0 end function l.wishes()local n_=l.pen()local oa=n_ and n_:GetAttribute("Wishes")local iE,ob={},l.srv()
if type(oa)~="string"then return iE end local vB,oc=pcall(function()return l.HS:JSONDecode(oa)end)if vB and type(oc)=="table"then
for vC,iF in pairs(oc)do if type(iF)=="number"and iF>ob then iE[vC]=iF-ob end end end return iE end function l.call(...)
local od=ar:FindFirstChild("Remotes")local oe=od and od:FindFirstChild("PetRequest")if not oe then return nil end
local of=table.pack(...)local bW={}task.spawn(function()bW.ok,bW.v=pcall(function()return oe:InvokeServer(table.unpack(of,1,of.n))end)
bW.done=true end)local vD=x()while not bW.done and x()-vD<6 do task.wait(0.05)end if bW.done and bW.ok then return bW.v end
return nil end function l.want(vE)return d.Pets[vE]end function l.closeNaming(iG)local oh=pcall(function()local og=F:FindFirstChild("PlayerScripts")
local vF=og and og:FindFirstChild("Naming",true)require(vF).close()end)ad(0.5)if iG.Visible then pcall(function()local oi=iG:FindFirstChild("NameBox",true)if oi then oi:ReleaseFocus()end end)
iG.Visible=false oh=false end return oh end function l.skipNaming()l.namingUntil=x()+10 if l.namingOn then return end
l.namingOn=true task.spawn(function()while c.alive and x()<l.namingUntil do local oj=F:FindFirstChildOfClass("PlayerGui")
local ol=oj and oj:FindFirstChild("MainGui")local fu=ol and ol:FindFirstChild("PetNameGui")if fu and fu.Visible then
ad(0.4)if fu.Visible then l.namingShut=(l.namingShut or 0)+1 pcall(l.closeNaming,fu)break end end ad(0.25)end
l.namingOn=false end)end function l.buyTick()if not d.PetBuy then l.buyMsg="auto adopt is off"return end local iH,om,fv=l.info(),l.pen(),l.data()
if not(iH and om and fv)then l.buyMsg="pet data not loaded yet"return end l.tryAt=l.tryAt or{}local dA,iI=#(fv.pets or{}),tonumber(fv.maxOwned)or 60
local vG,oo,dB=l.srv(),{},nil for AO,aK in ipairs(om:GetChildren())do oo[aK.Name]=true local bX,fw=aK:GetAttribute("Pet"),aK:GetAttribute("Variant")or""
local iJ=bX and l.want(bX)if iJ and iJ.b and iH.Pets[bX]and(not iJ.g or fw=="Big")and z.wantMore(bX,fw,fv)and not aK:GetAttribute("A_"..l.uid)
and(tonumber(aK:GetAttribute("ExpiresAt"))or 0)>vG+1 and x()>=(l.tryAt[aK.Name]or 0)then local dC,op=l.nice(bX,fw),iH.Pets[bX].price or 0
if dA>=iI then dB=("%s is in the pen, but you have %d/%d pets"):format(dC,dA,iI)l.tryAt[aK.Name]=x()+15 elseif l.money()<op then
dB=("%s is in the pen - need $%s"):format(dC,aD(op))l.tryAt[aK.Name]=x()+5 else l.tryAt[aK.Name]=x()+8 local bs=l.call("adopt",aK.Name)
if type(bs)=="table"and bs.ok then dA=dA+1 l.buys=(l.buys or 0)+1 l.recent=l.recent or{}local vH=type(bs.pet)=="table"and bs.pet or{}
table.insert(l.recent,{id=tostring(vH.id or("?"..x())),name=bX,variant=fw,at=x()})if#l.recent>30 then table.remove(l.recent,1)end
y("ADOPTED "..dC)l.skipNaming()dB="adopted "..dC else local oq=type(bs)=="table"and tostring(bs.reason or"no reason given")or"no answer"
y(("adopt %s failed: %s"):format(dC,oq))dB="adopt failed: "..oq if type(bs)=="table"and bs.bagFull then l.tryAt[aK.Name]=x()+60 end
end end end end for ot in pairs(l.tryAt)do if not oo[ot]then l.tryAt[ot]=nil end end l.buyMsg=dB or("watching the pen (%d/%d pets)"):format(dA,iI)
end function l.wishTick()if not d.PetWish then l.wishMsg="auto wish is off"return end local fy=l.info()if not(fy and l.pen())then l.wishMsg="pet data not loaded yet"return end
l.wishTry,l.wishWhy=l.wishTry or{},l.wishWhy or{}local fz,iK,bt=l.wishes(),0,nil local vI=(type(fy.Wish)=="table"and fy.Wish.cashShare)or 2
local vJ=l.data()for AP,ax in ipairs(l.order())do local ou=l.want(ax)if ou and ou.w and z.wantMore(ax,"",vJ)then
iK=iK+1 if not fz[ax]and x()>=(l.wishTry[ax]or 0)then local iL=tonumber(F:GetAttribute("PetWishCredits"))or 0
local iM=math.floor((fy.Pets[ax].price or 0)*vI)if iL<=0 and l.money()<iM then l.wishTry[ax]=x()+10 bt=("need $%s to wish for %s"):format(aD(iM),l.nice(ax))
l.wishWhy[ax]=bt else l.wishTry[ax]=x()+3 local vK=iL>0 and"wishCredit"or"wish"local fA=l.call(vK,ax)if type(fA)=="table"and fA.ok then
l.wishN,l.wishWhy[ax]=l.wishN+1,nil y(("WISHED for %s (%s)"):format(l.nice(ax),iL>0 and"free wish"or("$"..aD(iM))))
else local iN=type(fA)=="table"and tostring(fA.reason or"no reason given")or"no answer"if iN:lower():find("already",1,true)then l.wishTry[ax]=x()+2
else y(("wish %s failed: %s"):format(l.nice(ax),iN))bt="wish failed: "..iN end end end end end end if not bt then
for AQ,fB in ipairs(l.order())do local ov=l.want(fB)if ov and ov.w and not fz[fB]and l.wishWhy[fB]then bt=l.wishWhy[fB]break end
end end if not bt then local fC={}for AS,fD in ipairs(l.order())do local ow=l.want(fD)if ow and ow.w and fz[fD]then fC[#fC+1]=("%s %dm"):format(l.nice(fD),math.ceil(fz[fD]/60))end
end bt=iK==0 and"no pet has WISH ticked"or("running: "..(#fC>0 and table.concat(fC,", ")or"none yet"))end l.wishMsg=bt
end q.switches,q.glazed,q.finished=0,0,0 q.done,q.doneN,q.later={},0,{}function q.teams()local iO=l.data()return(iO and iO.teams)or{},iO
end function q.current(cs)cs=cs or l.data()if not cs then return""end local ox={}for AT,vL in ipairs(cs.equipped or{})do ox[tostring(vL)]=true end
for AU,oy in ipairs(cs.teams or{})do local oz=oy.pets or{}local iP=#oz==#(cs.equipped or{})if iP then for AV,vM in ipairs(oz)do if not ox[tostring(vM)]then iP=false break end end end
if iP then return oy.name end end return""end function q.equip(iQ)local vN,vO=q.teams()local iR for vP,vQ in ipairs(vN)do if vQ.name==iQ then iR=vP break end end
if not iR then q.msg="no saved team called "..tostring(iQ)return false end if q.current(vO)==iQ then return true end
for AW=1,4 do local oA=l.call("teamEquip",iR)if type(oA)=="table"and oA.ok then q.switches=q.switches+1 return true
end task.wait(0.4)end return false end function q.left(vR)local oB=vR:FindFirstChild("SquishyPlaceHolder")local oC=oB and oB:FindFirstChild("TimerGui")
local oD=oC and oC:FindFirstChildWhichIsA("TextLabel",true)local iS=oD and oD.Text if type(iS)~="string"or iS:find("-",1,true)then return nil end
local iT,oE,oF=iS:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not iT then return nil end local oG=oF~=""and(tonumber(iT)*3600+tonumber(oE)*60+tonumber(oF))or(tonumber(iT)*60+tonumber(oE))
return oG>0 and oG or nil end function q.waxes()local dD={}local oH=c.plot and c.plot:FindFirstChild("WaxStations")
if not oH then return dD end local oI=l.srv()for AX,aT in ipairs(oH:GetChildren())do local iU=tonumber(aT:GetAttribute("PourEnd"))
local oJ=aT:GetAttribute("PourOwner")if aT:GetAttribute("HasSquishy")and aT:GetAttribute("PourId")and(oJ==nil or oJ==l.uid)then
local iV=q.left(aT)local oK=iV and(oI+iV)or((iU and iU>oI)and iU or nil)if oK then local oL,oM=aT:FindFirstChild("SquishyPlaceHolder"),"?"
if oL then for AY,oN in ipairs(oL:GetChildren())do if oN:IsA("Model")then oM=oN.Name break end end end local vS=tostring(aT:GetAttribute("Helpers")or"")
local iW=0 for AZ in vS:gmatch("%d+")do iW=iW+1 end dD[#dD+1]={st=aT,ends=oK,sure=iV~=nil,id=aT:GetAttribute("PourId"),name=oM,helps=iW,
long=aT:GetAttribute("PourLong")==true}end end end table.sort(dD,function(vT,vU)return vT.ends<vU.ends end)return dD
end function q.glazeCount()local oO=ar:FindFirstChild("Remotes")local oP=oO and oO:FindFirstChild("EditStack")
if not oP then return nil end local vV,dE=pcall(function()return oP:InvokeServer("State",nil)end)if not(vV and type(dE)=="table"and type(dE.state)=="table")then return nil end
local iX,iY=0,{}for A0,fE in ipairs(dE.state.entries or{})do if fE.glaze and fE.glaze~=""then iX=iX+1 iY[fE.glaze]=(iY[fE.glaze]or 0)+1 end
end return iX,iY,#(dE.state.entries or{}),dE.state.capacity end function q.finishedOne(fF,oQ)q.finished=q.finished+1
task.wait(2)local iZ,vW,oR,vX=q.glazeCount()if iZ and oQ and iZ>oQ then q.glazed=q.glazed+1 local i0={}for vY,vZ in pairs(vW)do i0[#i0+1]=vY.." "..vZ end
y(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(ab(fF.name)),fF.st.Name,iZ,table.concat(i0,", ")))
else y(("wax done on station %s: %s, no glaze%s"):format(fF.st.Name,ak(ab(fF.name)),oR and(" (stack "..oR.."/"..tostring(vX)..")")or""))
end end function q.tick()q.list=q.waxes()if q.editing and x()-(q.editingSince or x())>120 then q.editing=false end
if q.editing then q.msg="rebuilding teams..."return end if not d.Teams then q.want,q.msg="","auto teams is off"return end
local ct=l.srv()local aA=q.glazeFor if aA then local dF=aA.st local oS=dF.Parent and dF:GetAttribute("HasSquishy")and dF:GetAttribute("PourId")==aA.id
local oT=oS and q.left(dF)if oT then aA.ends=ct+oT end if not oS then q.glazeFor,q.afterUntil=nil,x()+1.5 if not q.done[aA.id or"?"]then
q.done[aA.id or"?"],q.doneN=true,q.doneN+1 if q.doneN>400 then q.done,q.doneN={[aA.id or"?"]=true},1 end local v0=aA.before
task.spawn(function()pcall(q.finishedOne,aA,v0)end)end elseif aA.ends-ct>d.GlazeLead*3+60 or ct>aA.ends+90 then
q.glazeFor,q.afterUntil=nil,x()+1.5 q.later[aA.id or"?"]=x()+120 y(("station %s is not finishing yet (%s left) - glaze team off again"):format(dF.Name,q.clock(aA.ends-ct)))
end end if d.TeamGlaze~=""and not q.glazeFor then local v1=q.speedRatio(d.TeamGlaze)for A1,bY in ipairs(q.list)do
if bY.sure and(bY.ends-ct)*v1[bY.long and 2 or 1]<=d.GlazeLead and x()>=(q.later[bY.id or"?"]or 0)and not q.done[bY.id or"?"]then
q.glazeFor=bY task.spawn(function()bY.before=q.glazeCount()end)break end end end local aH,fG="",""if d.TeamGlaze~=""and(q.glazeFor or x()<(q.afterUntil or 0))then
aH,fG=d.TeamGlaze,q.glazeFor and(" - station "..q.glazeFor.st.Name.." finishes soon")or""elseif d.TeamWax~=""and(q.placing or q.aboutToPlace())then
aH,fG=d.TeamWax," - placing a butter"elseif d.TeamFull~=""and q.allBusy()then aH,fG=d.TeamFull," - every station is busy"
else aH=d.TeamNormal end q.want=aH local dG=q.current()q.cur=dG if aH~=""and dG~=aH and x()>=(q.nextTry or 0)then
q.nextTry=x()+1.1 if q.equip(aH)then y("team: "..aH..fG)else q.nextTry=x()+3 end end local i1=q.list[1]q.msg=("on: %s%s | next wax done %s"):format(dG~=""and dG or"(not a saved team)",(aH~=""and aH~=dG)and(" -> "..aH)or"",
i1 and("in "..q.clock(i1 .ends-ct).." (st "..i1 .st.Name..")")or"- none running")end function q.clock(bu)bu=math.max(0,math.floor(bu))
if bu>=3600 then return("%d:%02d:%02d"):format(math.floor(bu/3600),math.floor((bu%3600)/60),bu%60)end return("%d:%02d"):format(math.floor(bu/60),bu%60)
end function q.allBusy()local v2,v3=ex()return v3>0 and v2==0 end function q.aboutToPlace()if not c.running then return false end
local oU=aa()if not(oU and aQ(oU))then return false end local v4=ex()return v4>0 end function q.mult(oV,v5,oW)return{(1+oV)*(1+oW),(1+oV+v5)*(1+oW)}end
function q.speedNow()local function i2(v6)return tonumber(F:GetAttribute(v6))or 0 end return q.mult(i2("PetWaxSpeed"),i2("PetLongWax"),i2("PetSocialWax"))
end function q.speedOf(v7)local v8,oX=q.teams()if not oX then return nil end for A2,oY in ipairs(v8)do if oY.name==v7 then
local i3={}for A3,v9 in ipairs(oY.pets or{})do for A4,oZ in ipairs(oX.pets or{})do if tostring(oZ.id)==tostring(v9)then i3[#i3+1]=oZ break end end
end local o0=z.caps()local o1,v_=z.stats(i3)return q.mult(math.min(o1 .waxSpeed or 0,o0 .waxSpeed or 0.25),math.min(o1 .longWax or 0,o0 .longWax or 0.3),v_.socialWax or 0)
end end return nil end function q.speedRatio(wa)local o2,i4=q.speedNow(),q.speedOf(wa)if not i4 then return{1,1}end
return{o2[1]/i4[1],o2[2]/i4[2]}end function q.glazeSoon()return d.Teams and d.TeamGlaze~=""and(q.glazeFor~=nil or x()<(q.afterUntil or 0))
end z.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
z.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}z.buildMsg,z.fuseMsg,z.fused,z.builds="","",0,0
function z.need()return F:GetAttribute("FusePass")==true and 3 or 7 end function z.caps()local i5=l.info()return(i5 and type(i5 .Caps)=="table")and i5 .Caps or z.CAPS
end function z.value(o3,i6)local fH=l.info()local cu=fH and fH.Pets[o3]if not(cu and type(cu.boost)=="table")then return nil end
local bZ if type(fH.boostValue)=="function"then local wb,wc=pcall(fH.boostValue,o3,(i6~=""and i6)or nil)bZ=wb and tonumber(wc)or nil
end if not bZ then bZ=cu.boost.value or 0 if i6=="Big"then local o4=bZ*1.5 bZ=z.ROUND[cu.boost.kind]and math.max(bZ+1,math.floor(o4+0.5))or o4
end end return cu.boost.kind,bZ,cu.boost.every end function z.stats(wd)local b0,i7={},{}for A5,o5 in ipairs(wd)do
local aL,fI,o6=z.value(o5 .name,o5 .variant or"")if aL then if aL:sub(1,6)=="social"then i7[aL]=math.max(i7[aL]or 0,fI)
elseif aL=="waxStir"or aL=="cashGift"then b0[aL]=(b0[aL]or 0)+fI*60/(o6 or 60)elseif aL=="luckyPull"then b0 .luckyPull=(b0 .luckyPull or 0)+fI/(o6 or 10)
else b0[aL]=(b0[aL]or 0)+fI end end end return b0,i7 end function z.glazeGain(we,fJ)local dH,i8,A6={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local wf=dH[1]+dH[2]+dH[3]local wg=tonumber(F:GetAttribute("GuildUpGlaze"))or 0 local cv={}for fK=1,3 do cv[fK]=dH[fK]+we*dH[fK]/wf+(fK==1 and wg or 0)end
local i9={cv[1]*(1-fJ),cv[2]*(1-fJ)+cv[1]*fJ,cv[3]+cv[2]*fJ}return i9[1]*(i8[1]-1)+i9[2]*(i8[2]-1)+i9[3]*(i8[3]-1)
end function z.score(fL,wh)local i_=z.caps()local fM,fN=z.stats(wh)local function bv(o7)return math.min(fM[o7]or 0,i_[o7]or math.huge)end
local wi=(1+bv("income"))*(1+(fN.socialIncome or 0))*(1+math.min(fM.cashGift or 0,i_.cashGiftPerMinute or 9)/60)
local wj=1+bv("luck")+(fM.luckyPull or 0)+(fN.socialLuck or 0)local o8=wj*(1+bv("newFind"))local dI=math.log(wi)
local wk=math.max(tonumber(F:GetAttribute("WaxStations"))or 18,1)local ja=(1+bv("waxSpeed")+bv("longWax"))*(1+(fN.socialWax or 0))
+math.min(fM.waxStir or 0,i_.waxStirPerMinute or 30)/60/wk local wl=1-(1-bv("headStart"))*(1-(fN.socialHeadStart or 0))
if fL=="farm"then return dI+0.7*math.log(o8)+0.1*math.log(ja)end if fL=="full"then return dI+0.4*math.log(ja)+0.02*math.log(o8)end
if fL=="glaze"then return z.glazeGain(bv("glaze"),bv("glazeUp"))+0.001*dI end if fL=="wax"then return-math.log(1-0.5*wl)+0.001*dI+0.001*math.log(ja)end
return dI end function z.best(o9,cw,wm,jb)jb=jb or{}local av,dJ={},{}local function o_(wn)local pa={}for wo,wp in ipairs(wn)do pa[wo]=cw[wp]end return pa end
local function jc(pb)local jd=z.score(o9,o_(pb))for A7,wq in ipairs(pb)do if jb[cw[wq].id]then jd=jd+1e-7 end end
return jd end for A8=1,math.min(wm,#cw)do local fO,je for jf=1,#cw do if not dJ[jf]then av[#av+1]=jf local pc=jc(av)
av[#av]=nil if not je or pc>je+1e-12 then fO,je=jf,pc end end end if not fO then break end dJ[fO]=true av[#av+1]=fO
end for A9=1,6 do task.wait()local pd,pe=false,jc(av)for jg=1,#av do for jh=1,#cw do if not dJ[jh]then local pf=av[jg]
av[jg]=jh local pg=jc(av)if pg>pe+1e-9 then dJ[pf],dJ[jh],pe,pd=nil,true,pg,true else av[jg]=pf end end end end
if not pd then break end end local ph={}for wr,ws in ipairs(av)do ph[wr]=tostring(cw[ws].id)end return ph,z.score(o9,o_(av))
end function z.count(pj,pk,wt)local dK,dL={},0 local pl,pm={},{}for A_,wu in ipairs(pk.arriving or{})do pl[tostring(wu)]=true end
for Ba,cx in ipairs(pk.pets or{})do pm[tostring(cx.id)]=true if cx.name==pj and not pl[tostring(cx.id)]then if cx.variant=="Big"then dL=dL+1 elseif(cx.variant or"")==""then dK[#dK+1]=cx end
end end if not wt then for Bb,dM in ipairs(l.recent or{})do if dM.name==pj and not pm[dM.id]and x()-dM.at<20 then
if dM.variant=="Big"then dL=dL+1 else dK[#dK+1]=dM end end end end return dK,dL end function z.goal(wv)local pn=d.Pets[wv]return pn and tonumber(pn.f)or 0 end
function z.wantMore(po,ww,pp)local ji=z.goal(po)if ji<=0 or not pp then return true end local wx,pq=z.count(po,pp)
if pq>=ji then return false end if ww=="Big"then return true end return#wx<z.need()*(ji-pq)end function z.status(pr,ps)
local fP=z.goal(pr)if fP<=0 or not ps then return nil end local wy,jj=z.count(pr,ps)if jj>=fP then return("Big %d/%d done"):format(jj,fP)end
return("%d/%d to fuse, Big %d/%d"):format(math.min(#wy,z.need()),z.need(),jj,fP)end function z.wear(jk)local jl={}
for Bc,wz in ipairs(jk)do jl[tostring(wz)]=true end for Bd=1,3 do local cy=l.data()if not cy then return false end
for Be,pt in ipairs(cy.equipped or{})do if not jl[tostring(pt)]then l.call("unequip",pt)task.wait(0.3)end end
cy=l.data()local pu={}for Bf,wA in ipairs(cy.equipped or{})do pu[tostring(wA)]=true end for Bg,pv in ipairs(jk)do
if not pu[tostring(pv)]then l.call("equip",pv)task.wait(0.3)end end task.wait(0.4)cy=l.data()local jm,pw=0,true
for Bh,wB in ipairs(cy.equipped or{})do jm=jm+1 if not jl[tostring(wB)]then pw=false end end if pw and jm==#jk then return true end
end return false end function z.saveTeam(px,py)if not z.wear(py)then return false,"could not put the pets on"end
local wC=q.teams()local b1 for wD,wE in ipairs(wC)do if wE.name==px then b1=wD break end end local cz if b1 then
cz=l.call("teamSave",b1)else cz=l.call("teamNew")if type(cz)=="table"and cz.ok and cz.index then b1=cz.index task.wait(0.3)
l.call("teamRename",{index=b1,name=px})end end task.wait(0.4)local jn=l.data()local pz=jn and jn.teams and b1 and jn.teams[b1]
if not pz then return false,"the game did not save it"end local pA={}for Bi,wF in ipairs(pz.pets or{})do pA[tostring(wF)]=true end
for Bj,wG in ipairs(py)do if not pA[tostring(wG)]then return false,"saved, but not with these pets"end end return true
end z.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function z.quiet()
if q.placing or q.glazeSoon()then return false end local wH=l.srv()for Bk,wI in ipairs(q.list or{})do if wI.ends-wH<(d.GlazeLead or 45)+90 then return false end end
return true end function z.plan()local dN=l.data()if not dN then return{}end local pB={}for Bl,wJ in ipairs(dN.arriving or{})do pB[tostring(wJ)]=true end
local dO={}for Bm,fQ in ipairs(dN.pets or{})do if not pB[tostring(fQ.id)]then dO[#dO+1]={id=tostring(fQ.id),name=fQ.name,variant=fQ.variant or""}end
end local pC={}for Bn,pD in ipairs(dO)do pC[pD.id]=pD end local pE=tonumber(dN.slots)or 3 local jo,pF={},{}for Bo,fR in ipairs(z.ROLES)do
local dP=d[fR[1]]if dP~=""and not pF[dP]then pF[dP]=true local jp,dQ,pG={},{},false for Bp,pH in ipairs(dN.teams or{})do
if pH.name==dP then for Bq,wK in ipairs(pH.pets or{})do local jq=pC[tostring(wK)]if jq then jp[jq.id]=true dQ[#dQ+1]=jq else pG=true end
end end end local jr,pI=z.best(fR[2],dO,pE,jp)local pJ=z.score(fR[2],dQ)local pK=#jr==#dQ for Br,wL in ipairs(jr)do if not jp[wL]then pK=false end end
if not pK and(pG or#dQ<math.min(pE,#dO)or pI>pJ+1e-4)then jo[#jo+1]={team=dP,role=fR[2],ids=jr,gain=pI-pJ}end
end end return jo end function z.rebuild(wM)local pL=z.plan()if#pL==0 then z.buildMsg="teams are already the best your pets allow"return true end
if not z.quiet()then z.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end q.editing,q.editingSince=true,x()
local fS=true local wQ,wR=pcall(function()for Bs,dR in ipairs(pL)do local wN,wO=z.saveTeam(dR.team,dR.ids)local pM=l.data()
local js={}for Bt,wP in ipairs(dR.ids)do for Bu,jt in ipairs(pM and pM.pets or{})do if tostring(jt.id)==wP then js[#js+1]=l.nice(jt.name,jt.variant)end
end end if wN then y(("TEAM %s rebuilt (%s): %s"):format(dR.team,wM or"pets changed",table.concat(js,", ")))else fS=false y(("TEAM %s: %s"):format(dR.team,tostring(wO)))end
end end)q.editing,q.nextTry=false,0 if not wQ then fS=false y("TEAM BUILD ERR "..tostring(wR))end z.builds=z.builds+1
z.buildMsg=fS and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return fS end
function z.fuseTick()if not d.AutoFuse or q.editing then return end local fT=l.data()if not fT then return end
local ju=z.need()local jv,fU={},{}for Bv,wS in ipairs(fT.teams or{})do for Bw,wT in ipairs(wS.pets or{})do jv[tostring(wT)]=true end end
for Bx,wU in ipairs(fT.equipped or{})do fU[tostring(wU)]=true end z.failUntil=z.failUntil or{}for b2,wV in pairs(d.Pets)do
local pN=tonumber(wV.f)or 0 local jw,wW=z.count(b2,fT,true)if pN>0 and wW<pN and#jw>=ju and x()>=(z.failUntil[b2]or 0)then
table.sort(jw,function(fV,fW)local pO=(fU[tostring(fV.id)]and 4 or 0)+(jv[tostring(fV.id)]and 2 or 0)+(fV.named and 1 or 0)
local pP=(fU[tostring(fW.id)]and 4 or 0)+(jv[tostring(fW.id)]and 2 or 0)+(fW.named and 1 or 0)if pO~=pP then return pO<pP end
return tostring(fV.id)<tostring(fW.id)end)local fX,jx={},{}for fY=1,ju do fX[fY]=tostring(jw[fY].id)if fU[fX[fY]]then jx[#jx+1]=fX[fY]end
end q.editing,q.editingSince=true,x()for By,wX in ipairs(jx)do l.call("unequip",wX)task.wait(0.3)end local fZ=l.call("fuse",{ids=fX})
q.editing,q.nextTry=false,0 if type(fZ)=="table"and fZ.ok then z.fused=z.fused+1 z.dirtyAt=x()y(("FUSED %d %s -> Big %s"):format(ju,l.nice(b2),l.nice(b2)))
z.fuseMsg=("fused a Big %s %s"):format(l.nice(b2),os.date("%H:%M"))else z.failUntil[b2]=x()+120 y(("fuse %s failed: %s"):format(l.nice(b2),type(fZ)=="table"and tostring(fZ.reason or"no reason given")or"no answer"))
end return end end end function z.tick()pcall(z.fuseTick)if not d.AutoBuild or not d.Teams then return end local pQ=l.data()
if not pQ then return end local b3={}for Bz,wY in ipairs(pQ.pets or{})do b3[#b3+1]=tostring(wY.id)end table.sort(b3)
b3=table.concat(b3,",")if b3~=z.sig then z.sig,z.dirtyAt=b3,x()end local wZ=(z.dirtyAt and x()-z.dirtyAt>8)or x()-(z.lastBuild or 0)>900
if wZ and not q.editing then local w0=z.rebuild(z.dirtyAt and"pets changed"or"check")if w0 then z.dirtyAt,z.lastBuild=nil,x()end
end end j.bb,j.fx,j.post,j.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}j.watch=setmetatable({},{__mode="k"})
j.mem,j.memPeak,j.fps=0,0,0 function j.isFx(b4)return b4:IsA("ParticleEmitter")or b4:IsA("Trail")or b4:IsA("Beam")or b4:IsA("Fire")or b4:IsA("Smoke")
or b4:IsA("Sparkles")or b4:IsA("Light")end function j.muteOne(aB)if not d.Lite or not aB.Parent then return end
local f0=(aB:IsA("BillboardGui")and j.bb)or(j.isFx(aB)and j.fx)or nil if not f0 or f0[aB]~=nil then return end
f0[aB]=aB.Enabled if aB.Enabled then aB.Enabled=false end j.watch[aB]=aB:GetPropertyChangedSignal("Enabled"):Connect(function()
if d.Lite and aB.Enabled then f0[aB]=true aB.Enabled=false end end)end function j.lite(pR)d.Lite=pR if pR then
task.spawn(function()for w1,w2 in ipairs(ao:GetDescendants())do if not d.Lite then return end pcall(j.muteOne,w2)
if w1%600==0 then task.wait()end end end)if not j.addConn then j.queue={}j.addConn=T(ao.DescendantAdded:Connect(function(jy)
if d.Lite and(jy:IsA("BillboardGui")or j.isFx(jy))then j.queue[#j.queue+1]=jy end end))end local jz=game:GetService("Lighting")
for BA,dS in ipairs(jz:GetChildren())do if dS:IsA("PostEffect")and dS.Enabled and j.post[dS]==nil then j.post[dS]=true dS.Enabled=false end
end pcall(function()j.oldShadows=j.oldShadows==nil and jz.GlobalShadows or j.oldShadows jz.GlobalShadows=false end)
pcall(function()j.oldDeco=j.oldDeco==nil and ao.Terrain.Decoration or j.oldDeco ao.Terrain.Decoration=false end)
else for BB,w3 in pairs(j.watch)do pcall(function()w3:Disconnect()end)end for pS,w4 in pairs(j.bb)do pcall(function()if pS.Parent then pS.Enabled=w4 end end)end
for pT,w5 in pairs(j.fx)do pcall(function()if pT.Parent then pT.Enabled=w5 end end)end for pU in pairs(j.post)do pcall(function()if pU.Parent then pU.Enabled=true end end)end
j.bb,j.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})j.watch,j.post,j.queue=setmetatable({},{__mode="k"}),{},{}
local w6=game:GetService("Lighting")if j.oldShadows~=nil then pcall(function()w6 .GlobalShadows=j.oldShadows end)j.oldShadows=nil end
if j.oldDeco~=nil then pcall(function()ao.Terrain.Decoration=j.oldDeco end)j.oldDeco=nil end end end j.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}
function j.hideHud(pV)d.HideHud=pV local jA=F:FindFirstChildOfClass("PlayerGui")if not jA then return end if pV then
for BC,dT in ipairs(jA:GetChildren())do if dT:IsA("ScreenGui")and not j.MINE[dT.Name]and dT.Enabled then j.hud[dT]=true dT.Enabled=false end
end if not j.hudConn then j.hudConn=T(jA.ChildAdded:Connect(function(dU)if d.HideHud and dU:IsA("ScreenGui")and not j.MINE[dU.Name]then
task.defer(function()if d.HideHud and dU.Enabled then j.hud[dU]=true dU.Enabled=false end end)end end))end else
for pW in pairs(j.hud)do pcall(function()if pW.Parent then pW.Enabled=true end end)end j.hud={}end end j.CAPS={0,30,15,10}
function j.cap(jB)d.FpsCap=jB local pX=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not pX then return false end return pcall(pX,jB==0 and 60 or jB)end j.unseen=setmetatable({},{__mode="k"})
function j.hideOne(ai)if ai:IsA("BasePart")or ai:IsA("Decal")or ai:IsA("Texture")then if ai.Transparency<1 then j.unseen[ai]=ai.Transparency ai.Transparency=1 end
elseif ai:IsA("BillboardGui")or ai:IsA("SurfaceGui")or ai:IsA("ParticleEmitter")or ai:IsA("Beam")or ai:IsA("Trail")or ai:IsA("Light")or ai:IsA("Fire")or ai:IsA("Smoke")or ai:IsA("Sparkles")then
if ai.Enabled then j.unseen[ai]=true ai.Enabled=false end end end function j.notMine(w7)return c.plot and not w7:IsDescendantOf(c.plot)end
function j.bases(pY)d.HideBases=pY local jC=ao:FindFirstChild("Plots")if not jC then return end if pY then task.spawn(function()
local jD=0 for BD,pZ in ipairs(jC:GetChildren())do if pZ~=c.plot then for BE,w8 in ipairs(pZ:GetDescendants())do
if not d.HideBases then return end pcall(j.hideOne,w8)jD=jD+1 if jD%600==0 then task.wait()end end end end end)
if not j.basesConn then j.basesConn=T(jC.DescendantAdded:Connect(function(p0)if d.HideBases and j.notMine(p0)then task.defer(function()pcall(j.hideOne,p0)end)end
end))end else for jE,p1 in pairs(j.unseen)do pcall(function()if not jE.Parent then return end if type(p1)=="number"then jE.Transparency=p1 else jE.Enabled=true end
end)end j.unseen=setmetatable({},{__mode="k"})end end function j.render(p2)d.NoRender=p2 pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not p2)end)
end function j.restoreAll()pcall(j.unpin)if d.HideBases then pcall(j.bases,false)end if D.arPaused then pcall(D.resume,"script stopped")end
pcall(j.lite,false)pcall(j.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(d.FpsCap or 0)~=0 then pcall(j.cap,0)end end function j.rejoinSame(p3)if c.rejoining then return end y("REJOIN this server ("..p3 ..")")
pcall(eA)if c.autoload then pcall(eZ,c.autoload)end mr()local w9=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,F)
end)task.delay(25,function()if c.alive then c9(p3 ..", same server failed")end end)return w9 end function j.tick()
local jF=j.queue if d.Lite and jF and#jF>0 then j.queue={}for w_,xa in ipairs(jF)do pcall(j.muteOne,xa)if w_%300==0 then task.wait()end end
end local p4=d.Lite and c.plot and c.plot:FindFirstChild("WaxStations")if p4 then for BF,xb in ipairs(p4:GetChildren())do
local p5=xb:FindFirstChild("SquishyPlaceHolder")local b5=p5 and p5:FindFirstChild("TimerGui")if b5 and b5:IsA("BillboardGui")then
if j.bb[b5]==nil then pcall(j.muteOne,b5)elseif b5 .Enabled then j.bb[b5]=true b5 .Enabled=false end end end end
local xc,dV=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if xc and type(dV)=="number"then
j.mem=dV j.memPeak=math.max(j.memPeak,dV)if(d.MemLimit or 0)>0 and dV>d.MemLimit then j.over=(j.over or 0)+1 if j.over>=30 and not c.busy then
j.over=-600 j.rejoinSame(("memory %d MB > %d MB"):format(dV,d.MemLimit))end elseif(j.over or 0)>0 then j.over=0
end end if x()-(j.noteAt or 0)>1800 then j.noteAt=x()y(("health: %d fps, %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function jG(f1)if type(f1)~="string"then return false end
f1=f1:lower()for BG,xd in ipairs(c.sellWords)do if f1:find(xd,1,true)then return true end end return false end
local function xe()local p6=ar:FindFirstChild("Remotes")local jH=p6 and p6:FindFirstChild("SellSquishy")if not(jH and jH:IsA("RemoteEvent"))then return false end
if not pcall(function()jH:FireServer()end)then return false end return am(function()return aa()==nil end,1.5)
end local function xf()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if x()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=x()local p7=as()local p8=p7 and p7 .HumanoidRootPart.Position local dW,p9 for BH,cA in ipairs((c.plot or ao):GetDescendants())do
if cA:IsA("ProximityPrompt")and(jG(cA.ActionText)or jG(cA.ObjectText)or jG(cA.Name))then local p_=lp(cA)local jI=(p_ and p8)and(p_-p8).Magnitude or 1e9
if jI<=400 and(not dW or jI<p9)then dW,p9=cA,jI end end end c.sellSpot=dW c.noSellSpot=(dW==nil)return dW end
local function qa()local jJ=aa()if not jJ then c.holding=false return false end if aQ(jJ)then return false end
local jK=ak(ab(jJ))if xe()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=x()+2.5,0
y("SOLD "..jK)return true end local cB=xf()if cB then local qb=cW(cB)if qb then ck(qb,cB)local qc=aa()if qc and not aQ(qc)then
local xg,xh=de(cB,function()return aa()==nil end,function()return cB.Enabled end)if xg then c.sold,c.holding,c.sellFails=c.sold+1,false,0
y(("SOLD %s at %s via %s"):format(jK,ev(cB),xh))return true end end end end c.sellFails=c.sellFails+1 y("could not sell "..jK.." ("..c.sellFails..")")
return false end local xi={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function xj(cC)local f2=ev(cC):lower()for BI,xk in ipairs(xi)do if f2:find(xk,1,true)then return 0 end end
local aU,al=cC.Name:lower(),0 local function aM(xl,xm)return xl:find(xm,1,true)~=nil end if aM(aU,"collect")then al=al+60 end
if aM(aU,"cash")or aM(aU,"money")then al=al+45 end if aM(aU,"income")or aM(aU,"claim")then al=al+35 end if aM(aU,"coin")or aM(aU,"earn")or aM(aU,"green")then al=al+20 end
if aU=="pad"or aU=="touch"then al=al+25 end if al==0 and(aM(f2,"collect")or aM(f2,"cash")or aM(f2,"money"))then al=25 end
if al==0 then return 0 end local dX=cC.Color if dX.G>0.5 and dX.G>dX.R*1.4 and dX.G>dX.B*1.4 then al=al+15 end
if math.min(cC.Size.X,cC.Size.Y,cC.Size.Z)<2 then al=al+5 end return al end local function xn()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or x()-c.padSearchAt<20 then return nil end c.padSearchAt=x()local f3,dY,jL={},nil,29 for BJ,f4 in ipairs(c.plot:GetDescendants())do
if f4:IsA("BasePart")then local f5=xj(f4)if f5>0 then f3[#f3+1]={s=f5,p=f4}if f5>jL then dY,jL=f4,f5 end end end
end table.sort(f3,function(xo,xp)return xo.s>xp.s end)c.padCands,c.padPart=f3,dY if dY then y("collect pad: "..ev(dY).." (score "..jL..")")end
return dY end local jM="SAB_pad_v1.txt"local function xq(xr)if type(writefile)=="function"then pcall(writefile,jM,table.concat({xr:GetComponents()},","))end
end local function xs()if type(isfile)~="function"or type(readfile)~="function"then return nil end local xt,qd=pcall(function()if isfile(jM)then return readfile(jM)end end)
if not xt or type(qd)~="string"then return nil end local f6={}for xu in qd:gmatch("[^,]+")do f6[#f6+1]=tonumber(xu)end
if#f6==12 then return CFrame.new(unpack(f6))end end local function xv(jN,f7,xw)local xx=da(jN)local jO=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aN=(jO and jO:IsA("BasePart"))and(jO.Position-f7)or Vector3 .new(1,0,0)aN=Vector3 .new(aN.X,0,aN.Z)if aN.Magnitude<0.05 then aN=Vector3 .new(1,0,0)end
aN=aN.Unit for xy=0,7 do local f8=xy*math.pi/4 local xz=Vector3 .new(aN.X*math.cos(f8)-aN.Z*math.sin(f8),0,aN.X*math.sin(f8)+aN.Z*math.cos(f8))
local f9=f7+xz*(xw+5)local jP=e7(f9 .X,f7 .Y,f9 .Z)if jP and math.abs(jP.Y-f7 .Y)<8 then aF(jN,Vector3 .new(f9 .X,jP.Y+xx,f9 .Z))
if hU(jN,0.7)then return true end end end return false end local function xA()c.lastCollect=x()local dZ=as()if not dZ then return end
local qe,xC=dZ.HumanoidRootPart,da(dZ)local d0,qf,d1,jQ=nil,4,nil,"?"local jR=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and jR and jR:IsA("BasePart")then d0,jQ=(jR.CFrame*c.manualPad).Position,"manual pad"else local a8=xn()
if a8 then d0=Vector3 .new(a8 .Position.X,a8 .Position.Y+a8 .Size.Y/2+xC,a8 .Position.Z)qf,d1,jQ=math.max(a8 .Size.X,a8 .Size.Z)/2,a8,a8 .Name
end end if not d0 then y("COLLECT: pad not found - stand on it and tap SET PAD")return end local jS=a0()aF(dZ,d0)
if d1 and type(firetouchinterest)=="function"then pcall(firetouchinterest,qe,d1,0)end ad(d.PadDwell)if d1 and type(firetouchinterest)=="function"then pcall(firetouchinterest,qe,d1,1)end
ad(0.5)c.collected=c.collected+1 local jT=a0()y(("COLLECTED (%s) %s"):format(jQ,(jS and jT and jT>jS)and("+$"..aD(jT-jS))or"no cash change seen"))
xv(dZ,d0,qf)end local d2 local function qg()if c.capHit then if d.AutoStart and x()-(c.capAt or 0)>300 then c.capHit,c.placeFails=false,0
y("trying again after being stopped for 5 minutes")d2(true,true)else return nil,c.capMsg,"bad"end end if c.busy then return nil,c.busyText,"ok"end
if not as()then return nil,"waiting for character","wait"end if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bh(),nil,nil
if not c.plot then return nil,"own plot not found yet","wait"end end if not next(d.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local jU,qh=ex()local f_=aa()if f_ then local cD=ak(ab(f_))if not aQ(f_)then local jV=(Q.gift and ab(Q.gift)==ab(f_)and x()-Q.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(cD,jV),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(cD,jV),"bad"end return"sell",("selling %s (%s)"):format(cD,jV),"warn"
end if jU<1 then return nil,("holding %s - 0 free stations"):format(cD),"wait"end if q.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(cD),"wait"end
return"place",("waxing %s (%d free)"):format(cD,jU),"ok"end c.holding=false if d.Crates and not e.waiting and x()-(e.scanAt or 0)>1 and x()>(e.quietUntil or 0)then
e.scanAt=x()local jW=c.plot:FindFirstChild("CrateStand")if jW then for BK,d3 in ipairs(jW:GetDescendants())do
if d3:IsA("ProximityPrompt")and d3 .Enabled and h_(d3)then local a9=d3 .ObjectText if a9==""then a9=cd(jW,"TitleLabel")or""end
if a9~=""and K.wanted(a9)then local xD=et(a9):gsub("crate$","")local qi for qj in pairs(W.members)do if et(qj)==xD then qi=qj end end
e.waiting,e.at,e.title,e.prompt=true,x(),a9,d3 e.data={name=(a9:gsub("%s","")),rarity=qi,title=a9}y(a9 .." found waiting on your stand")
end break end end end end local qk=K.wanted(e.data and e.data.name)or K.wanted(e.title)if d.Crates and(e.on or e.waiting)and qk then
local a_=e.title if x()<(e.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a_),"bad"
end if e.on then if c.crateFails>=3 then e.ignoreUntil,c.crateFails=x()+120,0 y("could not press the "..a_.." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a_),"bad"end if x()-e.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a_),"bad"
end if e.byYou and x()-e.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a_,math.ceil(60-(x()-e.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a_),"ok"end if e.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand"):format(a_),"bad"end if x()-e.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a_),"wait"
end return"cratesmart",("%s waiting - opening it%s"):format(a_,(e.learned and e.learned.mode~="window")and" directly"or""),"ok"
end if(e.on or e.waiting)and not qk then local ql=e.title..tostring(e.rolledAt)if e.told~=ql then e.told=ql y(e.title.." is not ticked - leaving it to the game")
end end if e.rolled and not e.waiting and x()-e.rolledAt<6 and K.wanted(e.rolled)then return nil,e.rolled.." rolled - waiting for it to land","wait"
end if jU<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(qh,qh),"wait"
end local jX=lD()if not jX then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local d4=bL()
if d4 and m1(d4 .name)then c.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(d4 .name),"idle"end
if x()-e.lastFail<8 then return nil,("%s on the pad - could not open it"):format(d4 .name),"bad"end return"cratewin",("%s on the pad - opening its window"):format(d4 .name),"ok"
end local bw=hS()if bw.state~="match"then c.matchSince=nil if bw.state=="skip"and not jX.Enabled then return nil,bw.text.." (sold out)","idle"end
return nil,bw.text,bw.level end if not jX.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local d5=x()if d5<c.noCashUntil then local qm,xE=mA()if qm then return nil,("cash short: have $%s, price ~$%s"):format(aD(qm),aD(xE)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(aD(a0()),math.ceil(c.noCashUntil-d5)),"bad"end if d5-c.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or d5 local qn=d5-c.matchSince if qn<d.Confirm then return nil,("confirming %s (%.2fs)"):format(bw.shown,qn),"ok"end
return"buy",("buying %s via %s"):format(bw.shown,bw.src),"ok"end j.DEPTH=11 function j.pinTick()local qo=j.hold
if not qo then return end local jY=F.Character local jZ=jY and jY:FindFirstChild("HumanoidRootPart")if not jZ then return end
jZ.CFrame=qo jZ.AssemblyLinearVelocity=Vector3 .new(0,0,0)for BL,ga in ipairs(jY:GetChildren())do if ga:IsA("BasePart")and ga.CanCollide then j.noclip[ga]=true ga.CanCollide=false end
end end j.noclip=setmetatable({},{__mode="k"})function j.pin(xF,qp)j.hold=xF if qp then j.surface=qp end end function j.unpin(xG)
if not j.hold then return end j.hold=nil for qq in pairs(j.noclip)do pcall(function()if qq.Parent then qq.CanCollide=true end end)end
j.noclip=setmetatable({},{__mode="k"})local qr=as()if qr and j.surface and not xG then aF(qr,j.surface.Position,j.surface.Position+j.surface.LookVector)
ad(0.1)end end function j.home()local ba,qs=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),as()
if not(ba and ba:IsA("BasePart")and qs)then return nil end local qt=ls()or ba.Position local gb=Vector3 .new(qt.X-ba.Position.X,0,qt.Z-ba.Position.Z)
gb=gb.Magnitude>0.1 and gb.Unit or Vector3 .new(0,0,1)local gc=ba.Position+gb*6 local qu=e7(gc.X,ba.Position.Y,gc.Z,{ba})
return CFrame.new(gc.X,(qu and qu.Y or ba.Position.Y)+da(qs),gc.Z)end function j.ground(xH,qv,xI)local j0,j1={F.Character},nil
for BM=1,12 do local j2=RaycastParams.new()j2 .FilterType=Enum.RaycastFilterType.Exclude j2 .FilterDescendantsInstances=j0
local gd=ao:Raycast(Vector3 .new(xH,qv,xI),Vector3 .new(0,-2000,0),j2)if not gd then break end j1,qv=gd,gd.Position.Y-0.05
j0[#j0+1]=gd.Instance end return j1 and j1 .Position.Y end function j.parkHome()local j3=j.home()if not j3 then return false end
local cE=j3 .Position local xJ=j.ground(cE.X,cE.Y+300,cE.Z)or(cE.Y-3)j.pin(CFrame.new(cE.X,xJ-8,cE.Z),j3)return true
end j.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function j.ghostMode()return d.Ghost and 2 or(d.GhostHelps and 1 or 0)end
function j.setGhost(ge)d.Ghost,d.GhostHelps=ge==2,ge==1 if ge<2 then task.spawn(function()while c.busy do ad(0.1)end
if j.ghostMode()<2 and j.hold and not C.home then pcall(j.unpin)end end)end j.paintGhost()y("ghost: "..j.GHOST[ge][1]:sub(8):lower())
end function j.cycleGhost()j.setGhost((j.ghostMode()+1)%3)end function j.parkTick()if not(d.Ghost and c.running)or j.hold or c.busy then return end
local xK=as()if not xK or H.seat()then return end j.parkHome()end H.n,H.fails,H.nextAt,H.msg,H.lost=0,0,0,"no campfire right now",0
function H.seat()local qw=F.Character local qx=qw and qw:FindFirstChildOfClass("Humanoid")local j4=qx and qx.SeatPart
return(j4 and j4 .Name=="LogSeat")and j4 or nil end function H.due()if not(d.Campfire and c.running)or x()<H.nextAt then return false end
local xL=ao:FindFirstChild("NightSeats")if not xL then if H.wasOn then H.wasOn,H.fails,H.lost=false,0,0 end H.msg="no campfire (comes with weather events)"
return false end H.wasOn=true if H.seat()then H.sitAt=H.sitAt or x()H.msg=("sitting at the campfire: +%s%% cash"):format(tostring(F:GetAttribute("CampfireBoost")or"?"))
return false end if H.sitAt then H.lost,H.sitAt=H.lost+1,nil if H.lost>=4 then H.nextAt,H.msg=x()+600,"kept losing the seat - leaving the campfire for 10 min"
y(H.msg)return false end end return true end function H.sit()local qy,gf=ao:FindFirstChild("NightSeats"),as()
if not qy or not gf then return end local qz,cF=gf.HumanoidRootPart.Position,{}for BN,gg in ipairs(qy:GetChildren())do
local qA=gg:IsA("Seat")and gg.Occupant==nil and gg:FindFirstChildOfClass("ProximityPrompt")if qA then cF[#cF+1]={st=gg,p=qA}end
end if#cF==0 then H.nextAt,H.msg=x()+10,"the campfire is full - waiting for a seat"return end table.sort(cF,function(xM,xN)return(xM.st.Position-qz).Magnitude<(xN.st.Position-qz).Magnitude end)
local xO,xP=cF[1].st,cF[1].p j.unpin(true)local cG=xO.CFrame aF(gf,cG.Position+cG.LookVector*2+Vector3 .new(0,2.5,0),cG.Position)
ad(0.25)local xQ=de(xP,function()return H.seat()~=nil end)if not xQ then aF(gf,cG.Position+Vector3 .new(0,2,0),cG.Position+cG.LookVector)
am(function()return H.seat()~=nil end,1.5)end if H.seat()then H.n,H.fails,H.sitAt=H.n+1,0,x()y(("SAT at the campfire (+%s%% cash)"):format(tostring(F:GetAttribute("CampfireBoost")or"?")))
else H.fails=H.fails+1 H.nextAt=x()+(H.fails>=3 and 60 or 5)H.msg="could not sit at the campfire"..(H.fails>=3 and" - trying again in a minute"or"")
if H.fails<=3 then y(H.msg)end end end D.msg,D.nextAt,D.at,D.pulls,D.claims,D.pullLeft,D.collectLeft,D.events="",0,0,0,0,0,0,{}
function D.refresh()D.at=x()local j5=ar:FindFirstChild("Remotes")if not j5 then return end local d6,j6,cH=0,0,{}
local xR,qB=pcall(function()return j5 .ClanRequest:InvokeServer("state")end)local qC=xR and type(qB)=="table"and qB.tasks
for BO,bx in ipairs(qC and qC.list or{})do if not bx.done and bx.kind=="pull"then d6=math.max(d6,(bx.goal or 0)-(bx.progress or 0))end
if not bx.done then cH[#cH+1]=("%s %d/%d"):format(tostring(bx.text),bx.progress or 0,bx.goal or 0)end end D.events={}
for BP,cI in ipairs(j5:GetChildren())do if cI:IsA("RemoteFunction")and cI.Name:match("^%u%a+Action$")and cI.Name~="CrateAction"and cI.Name~="AutoRollAction"then
local xS,d7=pcall(function()return cI:InvokeServer("state")end)if xS and type(d7)=="table"and d7 .live==true and type(d7 .quests)=="table"then
D.events[#D.events+1]={r=cI,st=d7}for BQ,aI in ipairs(d7 .quests)do if not aI.done and aI.kind=="pull"then d6=math.max(d6,(aI.goal or 0)-(aI.progress or 0))end
if not aI.done and aI.kind=="collect"then j6=math.max(j6,(aI.goal or 0)-(aI.progress or 0))end if not aI.done then cH[#cH+1]=("%s %d/%d"):format(tostring(aI.text),aI.progress or 0,aI.goal or 0)end
end end end end D.pullLeft,D.collectLeft=d6,j6 D.msg=#cH>0 and("open: "..table.concat(cH,", "))or"all quests done for today"
end function D.claim()for BR,d8 in ipairs(D.events)do local qD=d8 .r.Name:gsub("Action$","")for BS,cJ in ipairs(d8 .st.quests)do
if cJ.done and not cJ.claimed then local xT,qE=pcall(function()return d8 .r:InvokeServer("claimQuest",cJ.id)end)
if xT and not(type(qE)=="table"and qE.ok==false)then D.claims=D.claims+1 y(("CLAIMED %s quest: %s (+%s)"):format(qD,tostring(cJ.text),tostring(cJ.points or cJ.treats or"?")))
end ad(0.4)end end if d8 .st.bonusReady==true then local xU=pcall(function()return d8 .r:InvokeServer("claimBonus")end)
if xU then y(("CLAIMED %s daily quest bonus"):format(qD))end ad(0.4)end end end function D.tick()if not(d.Quests and c.running)then
if D.arPaused then D.resume("quests switched off")end return end if x()-D.at<(D.pullLeft>0 and 20 or 90)then return end
D.refresh()pcall(D.claim)if D.pullLeft<=0 and D.arPaused then D.resume("lever quests done")end end function D.pullDue()
return d.Quests and c.running and D.pullLeft>0 and x()>=D.nextAt and not A.busy end function D.lever()local qF=c.plot and c.plot:FindFirstChild("Lever")
local j7=qF and qF:FindFirstChild("Wheel")return j7 and j7:FindFirstChildWhichIsA("ProximityPrompt"),j7 end function D.resume(xV)
D.arPaused=false if D.arWas then D.arWas=false d.AutoRoll=true task.spawn(A.apply,xV)end end function D.pull()
local gh,j8=D.lever()if not gh or not j8 or not j8:IsA("BasePart")then D.nextAt,D.msg=x()+300,"your lever was not found"return end
if not D.arPaused then D.arPaused=true D.arWas=d.AutoRoll if d.AutoRoll then d.AutoRoll=false A.apply("pulling the lever for a quest",true)
if A.isOn()then D.nextAt=x()+30 return end end y(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(D.pullLeft))
end if not gh.Enabled then D.nextAt=x()+1 return end ck(j8,gh)D.asked=nil mP(gh)D.pulls=D.pulls+1 D.pullLeft=D.pullLeft-1
ad(0.6)if D.asked then D.nextAt=x()+600 y(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(D.asked)))
D.resume("a butter the game wants kept is on the pad")return end D.nextAt=x()+2.5 if D.pullLeft<=0 then D.at=0 end
end C.skip,C.skipN,C.n,C.calls,C.fails,C.nextAt,C.msg,C.tries={},0,0,0,0,0,"off",{}function C.can(by,xW)local j9=by:GetAttribute("PourOwner")
if type(j9)~="number"or j9==l.uid or not by:GetAttribute("HasSquishy")then return false end if by:GetAttribute("PourLong")~=true or by:GetAttribute("PourFull")==true then return false end
local j_=by:GetAttribute("PourId")if j_==nil or C.skip[j_]then return false end local qG,ka,xX=by:GetAttribute("Helpers"),0,tostring(l.uid)
if type(qG)=="string"then for xY in qG:gmatch("[^,%s]+")do ka=ka+1 if xY==xX then return false end end end if ka>=6 then return false end
local gi=q.left(by)if not gi then local qH=tonumber(by:GetAttribute("PourEnd"))gi=qH and(qH-xW)end if not gi or gi<=75 then return false end
local kb=game:GetService("Players"):GetPlayerByUserId(j9)if not kb or kb:GetAttribute("WaxHelpOff")==true then return false end
return true,kb,j_ end function C.list()local kc,xZ={},l.srv()local qI=ao:FindFirstChild("Plots")for BT,qJ in ipairs(qI and qI:GetChildren()or{})do
local qK=qJ~=c.plot and qJ:FindFirstChild("WaxStations")for BU,kd in ipairs(qK and qK:GetChildren()or{})do local x0,x1,x2=C.can(kd,xZ)
local ke=x0 and kd:FindFirstChild("SquishyPlaceHolder")if ke and ke:IsA("BasePart")then kc[#kc+1]={st=kd,p=x1,id=x2,part=ke}end
end end return kc end function C.due()return d.Help and c.running and x()>=C.nextAt end function C.skipIt(qL,qM)
C.skip[qL],C.skipN=qM,C.skipN+1 if C.skipN>600 then C.skip,C.skipN,C.tries={[qL]=qM},1,{}end end function C.goHome()
local gj,bz=as(),C.home C.home=nil if not(gj and bz)then return end if d.Ghost and not H.seat()then j.unpin(true)
if not j.parkHome()then pcall(aF,gj,bz.Position,bz.Position+bz.LookVector)end elseif j.hold or(gj.HumanoidRootPart.Position-bz.Position).Magnitude>20 then
j.unpin(true)pcall(aF,gj,bz.Position,bz.Position+bz.LookVector)end end function C.step()local kf,d9=C.list(),as()
if#kf==0 or not d9 then C.nextAt=x()+15 C.msg=("helped %d waxes here%s | none to help right now"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")
C.goHome()return end local qN=d9 .HumanoidRootPart local qO=qN.Position table.sort(kf,function(x3,x4)return(x3 .part.Position-qO).Magnitude<(x4 .part.Position-qO).Magnitude end)
local aO=kf[1]C.home=C.home or(j.hold and j.surface)or qN.CFrame local bA=aO.part local d_=(bA.Position+aO.st:GetPivot().Position)/2
local gk=C.tries[aO.id]or 0 if(d.Ghost or d.GhostHelps)and gk==0 and not H.seat()then j.pin(bA.CFrame,C.home)
else j.unpin(true)local kg=gk==0 and e7(d_.X,bA.Position.Y,d_.Z,{bA})if kg and math.abs(kg.Y-bA.Position.Y)<8 then
aF(d9,Vector3 .new(d_.X,kg.Y+da(d9),d_.Z),bA.Position)else aF(d9,bA.Position+Vector3 .new(0,bA.Size.Y/2+3,0),d_)
end end ad(0.3)local ea=ar:FindFirstChild("Remotes")ea=ea and ea:FindFirstChild("ClanRequest")if not ea then C.nextAt,C.msg=x()+60,"the game's help remote is missing"return end
local gl,bc=pcall(function()return ea:InvokeServer("help",aO.st:GetAttribute("PourOwner"),tonumber(aO.st.Name))end)
if gl and type(bc)=="table"and bc.ok then C.n,C.fails=C.n+1,0 C.skipIt(aO.id,"helped")y(("HELPED %s's wax (station %s)"):format(aO.p.DisplayName,aO.st.Name))
C.msg=("helped %d waxes here%s"):format(C.n,C.calls>0 and(", "..C.calls.." for the guild")or"")elseif gl and type(bc)=="table"and tostring(bc.reason or""):lower():find("walk up",1,true)and gk<2 then
C.tries[aO.id]=gk+1 C.nextAt=x()+0.3 elseif gl and type(bc)=="table"and tostring(bc.reason or""):lower():find("moment",1,true)then
C.waits=(C.waits or 0)+1 C.nextAt=x()+1.6 else local qP=(gl and type(bc)=="table"and tostring(bc.reason or"refused"))or("error: "..tostring(bc))
C.skipIt(aO.id,qP)C.fails=C.fails+1 if C.fails<=3 then y(("help refused for %s's wax: %s"):format(aO.p.DisplayName,qP))end
if C.fails>=5 then C.fails,C.nextAt,C.msg=0,x()+60,"the server keeps refusing helps - trying again in a minute"
C.goHome()end end C.nextAt=math.max(C.nextAt,x()+1.2)end function C.onCall(bd)if not d.HelpGuild or type(bd)~="table"or bd.p~="help"or bd.mine or bd.u==l.uid or not bd.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and d.HelpGuild)then return end local eb=ar:FindFirstChild("Remotes")
eb=eb and eb:FindFirstChild("ClanRequest")if not eb then return end local qQ,ec=pcall(function()return eb:InvokeServer("callHelp",bd.u)end)
local qR=tostring(bd.n or bd.un or bd.u)if qQ and type(ec)=="table"and ec.ok then C.calls=C.calls+1 y(("HELPED guildmate %s's wax from here (their call)"):format(qR))
else y(("guild call from %s: %s"):format(qR,(qQ and type(ec)=="table"and tostring(ec.reason or"refused"))or tostring(ec)))
end end)end local function ap(x5,qS,...)if c.busy then return end c.busy,c.busyText=true,x5 if j.hold and qS~=C.step then pcall(j.unpin)end
local x6,qT=pcall(qS,...)c.busy,c.busyText=false,""if not x6 and qT~=g4 then y("ERR "..tostring(qT))end end local function x7()
local aV,x8,x9=qg()c.reason,c.level=x8,x9 if aV=="place"then ap("waxing...",q.place)elseif aV=="crate"then ap("opening crate...",fj,true)
elseif aV=="cratesmart"then ap("opening crate...",e.smart)elseif aV=="cratewin"then ap("opening the crate window...",ib)
elseif aV=="nocrate"then ap("discarding crate...",fj,false)elseif aV=="sell"then ap("selling...",qa)elseif aV=="buy"then ap("buying...",mS,false)
elseif not aV and not c.matchSince and H.due()then ap("sitting at the campfire...",H.sit)elseif not aV and not c.matchSince and D.pullDue()and not aa()and not(bL()and aQ(bL().name))then
ap("pulling the lever for a quest...",D.pull)elseif d.Collect and not c.matchSince and x()-c.lastCollect>=(D.collectLeft>0 and d.Quests and math.min(d.Every,15)or d.Every)then
ap("collecting money...",xA)elseif not aV and not c.matchSince and C.due()then ap("helping a wax...",C.step)elseif C.home and not d.Help then
ap("coming back...",C.goHome)elseif not c.busy then j.parkTick()end end function d2(gm,x_)if gm==c.running then return end
c.running=gm if not x_ then d.AutoStart=gm end if gm then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
e.lastFail,e.summonFails,e.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=x()c.plot=bh()or c.plot
y("START")else c.reason="stopped"y("STOP")end end do local bB=eU(ah.auto)if type(bB)=="string"then bB=bB:gsub("%s+$","")
if bB~=""then c.autoload=bB local ya=mn(bB)y(ya and("loaded config "..bB)or("config "..bB.." could not be loaded"))
end end end local o={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local yb={ok=o.good,wait=o.warn,warn=o.warn,bad=o.bad,idle=o.dim}local qU={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function M(yc,yd,ye)local yf,kh=pcall(Instance.new,yc)
if not yf then c.uiErrs=c.uiErrs+1 return nil end for yg,yh in pairs(yd)do if not pcall(function()kh[yg]=yh end)then c.uiErrs=c.uiErrs+1 end
end kh.Parent=ye return kh end local function aj(yi,yj)M("UICorner",{CornerRadius=UDim.new(0,yj or 6)},yi)end
local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"})}function a.put(gn,ki)if gn and a.shown[gn]~=ki then a.shown[gn]=ki gn.Text=ki end
end local kj=F:FindFirstChildOfClass("PlayerGui")or F:WaitForChild("PlayerGui")local qV=kj:FindFirstChild("SABFarmGui")
if qV then qV:Destroy()end local kk=M("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},kj)
local ag={w=320,h=300,head=28,strip=34,tabs=24}pcall(function()local go=ao.CurrentCamera.ViewportSize if go.X>100 and go.Y>100 then
ag.w=math.clamp(math.floor(go.X*0.44),300,360)ag.h=math.clamp(math.floor(go.Y*0.84),240,340)end end)a.root=M("Frame",{Name="Root",Size=UDim2 .new(0,ag.w,0,ag.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=o.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},kk)
aj(a.root,10)M("UIStroke",{Color=o.line,Thickness=1},a.root)local aW=UDim2 .new(1,0,1,0)local function J(qW,qX)return UDim2 .new(qW,0,0,0),UDim2 .new(qX,(qW+qX>0.99)and 0 or-4,1,0)end
local function E(yk,yl,ym,yn,yo,yp)local qY=M("TextButton",{Text=yl,Position=yo,Size=yp,BackgroundColor3=ym,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=yn,TextColor3=o.text,AutoButtonColor=true},yk)aj(qY,6)return qY end local function gp(yq,yr,ys,yt,yu)
local kl=M("TextBox",{Text=yr,PlaceholderText=ys,Position=yt,Size=yu,BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=o.text,PlaceholderColor3=o.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},yq)aj(kl,6)M("UIPadding",{PaddingLeft=UDim.new(0,8)},kl)
return kl end local gq=ao.CurrentCamera local function yv()local yw,gr=pcall(function()return gq and gq.ViewportSize end)
if yw and gr and gr.X>50 and gr.Y>50 then return gr end end local function bC(ed)local km=yv()if not(km and ed and ed.Parent)then return end
local yx=pcall(function()local gs,qZ=ed.AbsolutePosition,ed.AbsoluteSize local kn=70 local q0=math.clamp(gs.X,kn-qZ.X,km.X-kn)
local q1=math.clamp(gs.Y,0,km.Y-math.min(qZ.Y,kn))if math.abs(q0-gs.X)>0.5 or math.abs(q1-gs.Y)>0.5 then ed.Position=UDim2 .new(0,math.floor(q0),0,math.floor(q1))
end end)return yx end local function gt(yy)local yz,ko=pcall(function()return yy.AbsolutePosition end)if yz and ko then return{math.floor(ko.X),math.floor(ko.Y)}end
end local cK={}c.dragMoved={}local function q2(ee,q3,kp)T(ee.InputBegan:Connect(function(cL)if cL.UserInputType~=Enum.UserInputType.MouseButton1 and cL.UserInputType~=Enum.UserInputType.Touch then return end
local kq={start=cL.Position,from=q3 .Position,moved=0,target=q3,input=cL,onDrop=kp}cK[ee],c.dragMoved[ee]=kq,0
local kr kr=cL.Changed:Connect(function()if cL.UserInputState==Enum.UserInputState.End and cK[ee]==kq then cK[ee]=nil
if kr then kr:Disconnect()end if kp then kp(kq.moved)end end end)end))end T(lb.InputChanged:Connect(function(gu)
if gu.UserInputType~=Enum.UserInputType.MouseMovement and gu.UserInputType~=Enum.UserInputType.Touch then return end
for yA,aX in pairs(cK)do local ks=aX.target if ks and ks.Parent then local q4,q5=gu.Position.X-aX.start.X,gu.Position.Y-aX.start.Y
aX.moved=math.max(aX.moved,math.abs(q4)+math.abs(q5))c.dragMoved[yA]=aX.moved ks.Position=UDim2 .new(aX.from.X.Scale,aX.from.X.Offset+q4,aX.from.Y.Scale,aX.from.Y.Offset+q5)
end end end))T(lb.InputEnded:Connect(function(gv)if gv.UserInputType~=Enum.UserInputType.MouseButton1 and gv.UserInputType~=Enum.UserInputType.Touch then return end
for yB,gw in pairs(cK)do if gw.input==gv or gv.UserInputType==Enum.UserInputType.MouseButton1 then cK[yB]=nil
if gw.onDrop then gw.onDrop(gw.moved)end end end end))local function O(yC,yD,yE,yF,yG,yH,yI)return M("TextLabel",{Text=yD,Position=yH or UDim2 .new(0,0,0,0),Size=yI or aW,BackgroundTransparency=1,
Font=yG and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=yE,TextColor3=yF,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},yC)
end a.title=M("Frame",{Size=UDim2 .new(1,0,0,ag.head),BackgroundColor3=o.panel,BorderSizePixel=0,Active=true},a.root)
a.dot=M("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=o.dim,BorderSizePixel=0},a.title)
aj(a.dot,5)O(a.title,"SAB  BUTTER FARM  "..b9,12,o.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))a.minB=E(a.title,"-",o.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))
a.xB=E(a.title,"X",o.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))a.strip=M("Frame",{Position=UDim2 .new(0,0,0,ag.head),Size=UDim2 .new(1,0,0,ag.strip),BackgroundColor3=o.bg,BorderSizePixel=0},a.root)
a.bar=M("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=o.warn,BorderSizePixel=0},a.strip)
aj(a.bar,2)a.reason=O(a.strip,"starting",12,o.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))a.tabs=M("Frame",{Position=UDim2 .new(0,0,0,ag.head+ag.strip),Size=UDim2 .new(1,0,0,ag.tabs),BackgroundTransparency=1},a.root)
a.tabFarm=E(a.tabs,"FARM",o.accent,9,UDim2 .new(0,6,0,0),UDim2 .new(1/6,-7,1,-4))a.tabBut=E(a.tabs,"BUTTERS",o.panel2,9,UDim2 .new(1/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabCrt=E(a.tabs,"CRATES",o.panel2,9,UDim2 .new(2/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabPet=E(a.tabs,"PETS",o.panel2,9,UDim2 .new(3/6,1,0,0),UDim2 .new(1/6,-2,1,-4))
a.tabTeam=E(a.tabs,"TEAMS",o.panel2,9,UDim2 .new(4/6,1,0,0),UDim2 .new(1/6,-2,1,-4))a.tabSet=E(a.tabs,"SETUP",o.panel2,9,UDim2 .new(5/6,1,0,0),UDim2 .new(1/6,-7,1,-4))
local function cM()local kt=M("ScrollingFrame",{Position=UDim2 .new(0,0,0,ag.head+ag.strip+ag.tabs),Size=UDim2 .new(1,0,1,-(ag.head+ag.strip+ag.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=o.line,CanvasSize=UDim2 .new(0,0,0,100)},a.root)
M("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},kt)M("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},kt)
return kt end a.farm,a.but,a.set,a.crt=cM(),cM(),cM(),cM()a.pet,a.team=cM(),cM()a.but.Visible,a.set.Visible,a.crt.Visible,a.pet.Visible,a.team.Visible=false,false,false,false,false
local gx,ef,L=0,12,nil local function aY(q6,yJ)gx,ef=gx+1,ef+q6+6 return M("Frame",{Size=UDim2 .new(1,0,0,q6),BackgroundTransparency=1,LayoutOrder=gx},yJ or a.farm)
end local function q7(yK)O(aY(14),yK,10,o.dim,true)end L=aY(32)a.startB=E(L,"START",o.good,14,J(0,0.68))a.killB=E(L,"KILL",o.bad,14,J(0.68,0.32))
local yL=aY(40)local function eg(q8,yM,ku)local kv=M("Frame",{Position=UDim2 .new((q8-1)/ku,0,0,0),Size=UDim2 .new(1/ku,q8<ku and-4 or 0,1,0),
BackgroundColor3=o.panel,BorderSizePixel=0},yL)aj(kv,6)local q9=O(kv,"0",14,o.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,20))
local yN=O(kv,yM,9,o.dim,false,UDim2 .new(0,0,0,23),UDim2 .new(1,0,0,13))q9 .TextXAlignment,yN.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return q9 end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=eg(1,"BOUGHT",5),eg(2,"WAXED",5),eg(3,"SOLD",5),eg(4,"MONEY",5),eg(5,"FREE",5)
a.info=O(aY(40),"",10,o.dim,false)a.tgt=O(aY(16),"",10,o.good,false)q7("SWITCHES")do local function gy(yO,yP)
local q_=aY(26)return E(q_,yO,o.panel2,10,J(0,0.5)),E(q_,yP,o.panel2,10,J(0.5,0.5))end a.colT,a.sellT=gy("COLLECT: ON","SELL THEM: ON")
a.crateT,a.arT=gy("OPEN CRATES: ON","AUTO ROLL: OFF")a.helpT,a.helpGT=gy("HELP WAXES: OFF","GUILD CALLS: OFF")
a.campT,a.ghostT=gy("CAMPFIRE: OFF","GHOST: OFF")L=aY(26)a.questT=E(L,"QUESTS: OFF",o.panel2,10,J(0,0.5))O(L,"collect every",9,o.dim,false,J(0.52,0.2))
a.secB=gp(L,tostring(d.Every),"60",J(0.72,0.13))a.secB.TextSize=11 a.secSet=E(L,"SET",o.accent,10,J(0.85,0.15))
local gz=M("Frame",{Size=aW,BackgroundColor3=o.panel,BorderSizePixel=0},aY(62))aj(gz,6)M("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},gz)
M("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,3)},gz)local function gA(yQ)local gB=O(gz,"",9,o.dim,false,nil,UDim2 .new(1,-6,0,14))
gB.LayoutOrder,gB.TextWrapped,gB.TextTruncate=yQ,false,Enum.TextTruncate.AtEnd return gB end a.helpL,a.campL,a.questL,a.arL=gA(1),gA(2),gA(3),gA(4)
end q7("LOG")a.log=M("TextLabel",{Size=aW,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=10,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},aY(84))aj(a.log,6)M("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},a.log)
a.farm.CanvasSize=UDim2 .new(0,0,0,ef)gx,ef=0,12 local function af(yR)return aY(yR,a.set)end local function cN(yS)O(af(14),yS,10,o.dim,true)end
cN("ONE-OFF ACTIONS")L=af(26)a.buyB=E(L,"BUY THE PAD",o.warn,10,J(0,0.5))a.plB=E(L,"WAX WHAT I HOLD",o.good,10,J(0.5,0.5))
L=af(26)a.sellB=E(L,"SELL WHAT I HOLD",o.warn,10,J(0,0.5))a.crateB=E(L,"OPEN CRATE NOW",o.warn,10,J(0.5,0.5))
L=af(26)a.padB=E(L,"SET PAD (stand on it)",o.panel2,10,J(0,0.55))a.padL=O(L,"",10,o.dim,false,J(0.56,0.44))cN("SETTINGS FILE  (saved on your phone)")
L=af(28)a.cfgName=gp(L,"default","config name",J(0,0.5))a.cfgSave=E(L,"SAVE",o.good,11,J(0.5,0.25))a.cfgLoad=E(L,"LOAD",o.accent,11,J(0.75,0.25))
L=af(26)a.cfgPrev=E(L,"<",o.panel2,11,J(0,0.13))a.cfgPick=E(L,"(none saved)",o.panel2,10,J(0.13,0.74))a.cfgNext=E(L,">",o.panel2,11,J(0.87,0.13))
L=af(26)a.cfgAuto=E(L,"LOAD IT ON LAUNCH: OFF",o.panel2,10,J(0,1))a.cfgMsg=O(af(26),"",10,o.dim,false)cN("START BY ITSELF")
L=af(26)a.autoB=E(L,"INSTALL F.exec",o.accent,10,J(0,1))a.autoMsg=O(af(30),"",10,o.dim,false)L=af(28)a.startT=E(L,"START FARMING ON LOAD: ON",o.accent,10,J(0,1))
O(af(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,o.dim,false)
cN("IF THE GAME DROPS ME")L=af(28)a.rejT=E(L,"AUTO REJOIN: ON",o.accent,11,J(0,0.55))a.rejB=E(L,"REJOIN NOW",o.warn,11,J(0.55,0.45))
a.rejMsg=O(af(30),"",10,o.dim,false)cN("SMOOTHER RUNNING  (for long / overnight runs)")L=af(28)a.pfLite=E(L,"LITE MODE: OFF",o.panel2,10,J(0,0.5))
a.pfHud=E(L,"HIDE GAME HUD: OFF",o.panel2,10,J(0.5,0.5))L=af(28)a.pfFps=E(L,"FPS CAP: GAME",o.panel2,10,J(0,0.5))
a.pfRender=E(L,"STOP 3D: OFF",o.panel2,10,J(0.5,0.5))L=af(28)a.pfBases=E(af(28),"HIDE OTHER BASES: OFF",o.panel2,10,J(0,1))
L=af(28)a.pfMem=gp(L,tostring(d.MemLimit),"2000",J(0,0.24))O(L,"MB: rejoin this server above it (0 = never)",9,o.dim,false,J(0.26,0.52))
a.pfMemSet=E(L,"SET",o.accent,11,J(0.8,0.2))a.pfInfo=O(af(18),"",10,o.text,false)O(af(66),"LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. HIDE OTHER BASES stops drawing other players' bases and stacks (they are still there, so helping works). HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.",9,o.dim,false)
cN("THE ROUND SAB BUTTON")O(af(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,o.dim,false)
a.set.CanvasSize=UDim2 .new(0,0,0,ef)local ra=M("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},kj)
a.tgRoot=M("Frame",{Size=UDim2 .new(0,40,0,40),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=o.accent,BorderSizePixel=0,Active=true},ra)aj(a.tgRoot,20)M("UIStroke",{Color=o.line,Thickness=1},a.tgRoot)
a.tgBtn=M("TextButton",{Text="SAB",Size=aW,BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=o.text,AutoButtonColor=false},a.tgRoot)
a.tgDot=M("Frame",{Size=UDim2 .new(0,7,0,7),Position=UDim2 .new(1,-9,0,2),BackgroundColor3=o.dim,BorderSizePixel=0},a.tgRoot)
aj(a.tgDot,4)a.tgGhost=M("TextButton",{Text="G: OFF",Size=UDim2 .new(0,46,0,18),Position=UDim2 .new(0.5,-23,1,4),
BackgroundColor3=o.panel2,Font=Enum.Font.GothamBold,TextSize=9,TextColor3=o.text,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
aj(a.tgGhost,6)a.tgGhost.MouseButton1Click:Connect(function()j.cycleGhost()end)function j.paintGhost()local gC=j.ghostMode()
local rb=gC==2 and o.accent or(gC==1 and o.warn or o.panel2)if a.ghostT then a.ghostT.Text,a.ghostT.BackgroundColor3=j.GHOST[gC][1],rb end
if a.tgGhost then a.tgGhost.Text,a.tgGhost.BackgroundColor3=j.GHOST[gC][2],rb end end local be={built=false,boxes={},at=0}
local function rc(rd,kw)d.Targets[rd]=kw or nil local kx=be.boxes[rd]if kx then kx.Text=kw and"X"or""kx.BackgroundColor3=kw and o.good or o.panel2
end end local function ky()for yT,re in pairs(be.boxes)do local rf=d.Targets[yT]==true re.Text=rf and"X"or""re.BackgroundColor3=rf and o.good or o.panel2
end end local eh local function yU()local yV=0 local kz=M("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},a.but)
a.butInfo=O(kz,"",10,o.dim,false,J(0,0.5))local yW=E(kz,"CLEAR",o.panel2,10,J(0.5,0.24))local yX=E(kz,"REFRESH",o.panel2,10,J(0.74,0.26))
yW.MouseButton1Click:Connect(function()for yY in pairs(d.Targets)do d.Targets[yY]=nil end ky()end)yX.MouseButton1Click:Connect(function()
W.at=0 hE()eh(true)end)return yV end eh=function(yZ)if not hE()then if not a.butEmpty then a.butEmpty=O(M("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},a.but),
"butter list not loaded yet - open this tab again in a moment",11,o.warn,false)end return end if be.built and not yZ and be.at==W.at then return end
for BV,kA in ipairs(a.but:GetChildren())do if kA:IsA("Frame")or kA:IsA("TextButton")then kA:Destroy()end end be.boxes,a.butEmpty={},nil
yU()local kB,kC=36,1 local function rg(rh)kC=kC+1 local y0=M("Frame",{Size=UDim2 .new(1,0,0,rh),BackgroundTransparency=1,LayoutOrder=kC},a.but)
kB=kB+rh+6 return y0 end for BW,gD in ipairs(W.rarOrder)do local y1=rg(24)local y2=qU[gD]or o.text local kD=M("Frame",{Size=aW,BackgroundColor3=o.panel,BorderSizePixel=0},y1)
aj(kD,6)O(kD,"  "..gD:upper(),11,y2,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))local y3=E(kD,"ALL",o.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))
local y4=gD y3 .MouseButton1Click:Connect(function()local ri=W.members[y4]or{}local rj=false for BX,y5 in ipairs(ri)do if not d.Targets[y5]then rj=true break end end
for BY,y6 in ipairs(ri)do rc(y6,rj)end end)for BZ,kE in ipairs(W.members[gD]or{})do local y7=rg(22)local gE=M("TextButton",{Text="",Size=aW,BackgroundColor3=o.bg,BorderSizePixel=0,
AutoButtonColor=true},y7)aj(gE,5)O(gE,"   "..ak(kE),11,o.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))
local kF=M("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},gE)aj(kF,4)be.boxes[kE]=kF local rk=kE local function rl()rc(rk,not d.Targets[rk])end
gE.MouseButton1Click:Connect(rl)kF.MouseButton1Click:Connect(rl)end end ky()a.but.CanvasSize=UDim2 .new(0,0,0,kB+10)
be.built,be.at=true,W.at end function K.paint()for y8,rm in pairs(K.boxes)do local rn=d.CrateTicks[y8]==true rm.Text=rn and"X"or""
rm.BackgroundColor3=rn and o.good or o.panel2 end if a.crtInfo then local kG,kH=0,0 for B0 in pairs(K.boxes)do kG=kG+1 end
for B1,y9 in pairs(d.CrateTicks)do if y9 then kH=kH+1 end end a.crtInfo.Text=("%d crates, %d ticked"):format(kG,kH)
end if a.crtAll then a.crtAll.Text=d.Crates and"OPEN TICKED CRATES: ON"or"OPEN TICKED CRATES: OFF"a.crtAll.BackgroundColor3=d.Crates and o.accent or o.panel2
end end function K.build()for B2,kI in ipairs(a.crt:GetChildren())do if kI:IsA("Frame")or kI:IsA("TextButton")then kI:Destroy()end
end K.boxes={}local kJ,kK=12,0 local function gF(ro)kK=kK+1 kJ=kJ+ro+6 return M("Frame",{Size=UDim2 .new(1,0,0,ro),BackgroundTransparency=1,LayoutOrder=kK},a.crt)
end local kL=gF(28)a.crtInfo=O(kL,"",10,o.dim,false,J(0,0.5))local y_=E(kL,"CLEAR",o.panel2,10,J(0.5,0.24))local za=E(kL,"REFRESH",o.panel2,10,J(0.74,0.26))
T(y_.MouseButton1Click:Connect(function()d.CrateTicks={}K.paint()end))T(za.MouseButton1Click:Connect(function()K.build()end))
a.crtAll=E(gF(28),"",o.accent,11,J(0,1))T(a.crtAll.MouseButton1Click:Connect(function()d.Crates=not d.Crates K.paint()end))
O(gF(30),"Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.",10,o.dim,false)
for B3,bf in ipairs(K.list())do local zb=gF(24)local ei=M("TextButton",{Text="",Size=aW,BackgroundColor3=o.panel,BorderSizePixel=0,AutoButtonColor=true},zb)
aj(ei,5)O(ei,"  "..(bf.title or bf.name)..(bf.guess and"  (?)"or""),11,qU[bf.rar or""]or o.text,true,UDim2 .new(0,4,0,0),UDim2 .new(0.62,0,1,0))
O(ei,bf.price and("$"..aD(bf.price))or(bf.rar or""),9,o.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.25,0,1,0))
local kM=M("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),BackgroundColor3=o.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,
TextColor3=o.text,AutoButtonColor=false},ei)aj(kM,4)K.boxes[bf.k]=kM local rp=bf.k local function rq()d.CrateTicks[rp]=(not d.CrateTicks[rp])or nil
K.paint()end T(ei.MouseButton1Click:Connect(rq))T(kM.MouseButton1Click:Connect(rq))end a.crt.CanvasSize=UDim2 .new(0,0,0,kJ+10)
K.built=K.at K.paint()end local rr="farm"local function bD(an)rr=an a.farm.Visible,a.but.Visible,a.set.Visible=(an=="farm"),(an=="but"),(an=="set")
a.crt.Visible=(an=="crt")a.pet.Visible,a.team.Visible=(an=="pet"),(an=="team")a.tabCrt.BackgroundColor3=(an=="crt")and o.accent or o.panel2
a.tabPet.BackgroundColor3=(an=="pet")and o.accent or o.panel2 a.tabTeam.BackgroundColor3=(an=="team")and o.accent or o.panel2
if an=="pet"and not l.built then pcall(l.build)end if an=="team"and not q.built then pcall(q.build)end if an=="crt"and(K.built~=K.at or not next(K.boxes))then K.build()end
a.tabFarm.BackgroundColor3=(an=="farm")and o.accent or o.panel2 a.tabBut.BackgroundColor3=(an=="but")and o.accent or o.panel2
a.tabSet.BackgroundColor3=(an=="set")and o.accent or o.panel2 if an=="but"then eh(false)end end local function N(gG,gH,zc,zd)
a.put(gG,gH and zc or zd)if a.lit[gG]~=gH then a.lit[gG]=gH gG.BackgroundColor3=gH and o.accent or o.panel2 end
end l.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,215,60),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215)}function l.paintRow(rs)
local b6=l.rows and l.rows[rs]if not b6 then return end local ej=d.Pets[rs]or{}b6 .b.BackgroundColor3=ej.b and o.good or o.panel2
b6 .g.BackgroundColor3=ej.g and o.accent or o.panel2 b6 .g.Text=ej.g and"BIG"or"ANY"b6 .w.BackgroundColor3=ej.w and o.warn or o.panel2
local kN=tonumber(ej.f)or 0 b6 .f.Text=kN>0 and(kN.." BIG")or"FUSE"b6 .f.BackgroundColor3=kN>0 and o.good or o.panel2
end function l.flag(kO,gI)local aZ=d.Pets[kO]or{}if gI=="f"then local rt=((tonumber(aZ.f)or 0)+1)%4 aZ.f=rt>0 and rt or nil
elseif aZ[gI]then aZ[gI]=nil else aZ[gI]=true end d.Pets[kO]=(aZ.b or aZ.g or aZ.w or aZ.f)and aZ or nil l.paintRow(kO)
end function l.paintAll()for ze in pairs(l.rows or{})do l.paintRow(ze)end if a.pbT then N(a.pbT,d.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
N(a.pwT,d.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")N(a.pfT,d.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function l.live()if not l.built then l.build()return end if x()-(l.liveAt or 0)<1 then return end l.liveAt=x()
local ru=l.wishes()local ek=l.data()for gJ,gK in pairs(l.rows)do gK.name.Text=l.nice(gJ)..(ru[gJ]and("   * wish %dm"):format(math.ceil(ru[gJ]/60))or"")
local rv=z.status(gJ,ek)gK.desc.Text=rv and(rv.." | "..gK.boostText)or gK.boostText end local rw=tonumber(F:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(ek and#(ek.pets or{})or 0,ek and tonumber(ek.maxOwned)or 60,
aD(l.money()),rw>0 and(" | free wishes "..rw)or"",l.buyMsg~=""and l.buyMsg or"-",l.wishMsg~=""and l.wishMsg or"-")
end function l.build()local gL=l.info()for B4,kP in ipairs(a.pet:GetChildren())do if kP:IsA("Frame")or kP:IsA("TextLabel")then kP:Destroy()end
end l.rows={}local kQ,gM=0,12 local function cO(rx)kQ,gM=kQ+1,gM+rx+6 return M("Frame",{Size=UDim2 .new(1,0,0,rx),BackgroundTransparency=1,LayoutOrder=kQ},a.pet)
end local kR=cO(28)a.pbT=E(kR,"AUTO ADOPT: OFF",o.panel2,9,J(0,0.34))a.pwT=E(kR,"AUTO WISH: OFF",o.panel2,9,J(0.34,0.33))
a.pfT=E(kR,"AUTO FUSE: OFF",o.panel2,9,J(0.67,0.33))a.pbT.MouseButton1Click:Connect(function()d.PetBuy=not d.PetBuy l.paintAll()end)
a.pwT.MouseButton1Click:Connect(function()d.PetWish=not d.PetWish l.paintAll()end)a.pfT.MouseButton1Click:Connect(function()d.AutoFuse=not d.AutoFuse l.paintAll()end)
a.pInfo=O(cO(44),"",10,o.dim,false)O(cO(52),"BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.",9,o.dim,false)
if not gL then O(cO(30),"pet list not loaded yet - open this tab again in a moment",11,o.warn,false)a.pet.CanvasSize=UDim2 .new(0,0,0,gM)
l.built=false return end local cP={}for B5,ry in ipairs(l.order())do local kS=gL.Pets[ry].rarity or"?"cP[kS]=cP[kS]or{}
table.insert(cP[kS],ry)end local cQ={}for B6,rz in ipairs(gL.Rarities or{})do if cP[rz]then cQ[#cQ+1]=rz end end
for rA in pairs(cP)do if not table.find(cQ,rA)then cQ[#cQ+1]=rA end end for B7,gN in ipairs(cQ)do local rB=M("Frame",{Size=aW,BackgroundColor3=o.panel,BorderSizePixel=0},cO(22))
aj(rB,6)O(rB,"  "..gN:upper(),11,l.RC[gN]or o.text,true)for B8,gO in ipairs(cP[gN])do local b7=M("Frame",{Size=aW,BackgroundColor3=o.bg,BorderSizePixel=0},cO(38))
aj(b7,5)local zf=O(b7,l.nice(gO),11,l.RC[gN]or o.text,true,UDim2 .new(0,6,0,2),UDim2 .new(1,-150,0,17))local zg,zh=pcall(function()return gL.describe(gO)end)
local rC=zg and tostring(zh)or""local zi=O(b7,rC,9,o.dim,false,UDim2 .new(0,6,0,19),UDim2 .new(1,-150,0,17))local rD=E(b7,"BUY",o.panel2,8,UDim2 .new(1,-144,0.5,-11),UDim2 .new(0,32,0,22))
local rE=E(b7,"ANY",o.panel2,8,UDim2 .new(1,-110,0.5,-11),UDim2 .new(0,32,0,22))local rF=E(b7,"WISH",o.panel2,8,UDim2 .new(1,-76,0.5,-11),UDim2 .new(0,34,0,22))
local rG=E(b7,"FUSE",o.panel2,8,UDim2 .new(1,-40,0.5,-11),UDim2 .new(0,38,0,22))local gP=gO rD.MouseButton1Click:Connect(function()l.flag(gP,"b")end)
rE.MouseButton1Click:Connect(function()l.flag(gP,"g")end)rF.MouseButton1Click:Connect(function()l.flag(gP,"w")end)
rG.MouseButton1Click:Connect(function()l.flag(gP,"f")end)l.rows[gO]={b=rD,g=rE,w=rF,f=rG,name=zf,desc=zi,boostText=rC}
end end a.pet.CanvasSize=UDim2 .new(0,0,0,gM+10)l.built=true l.paintAll()end function j.paint()N(a.pfLite,d.Lite,"LITE MODE: ON","LITE MODE: OFF")
N(a.pfHud,d.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")N(a.pfRender,d.NoRender,"STOP 3D: ON","STOP 3D: OFF")
N(a.pfBases,d.HideBases,"HIDE OTHER BASES: ON","HIDE OTHER BASES: OFF")N(a.pfFps,(d.FpsCap or 0)~=0,"FPS CAP: "..tostring(d.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(d.MemLimit)end end function j.applyAll()if d.Lite then j.lite(true)end
if d.HideHud then j.hideHud(true)end if d.NoRender then j.render(true)end if d.HideBases then j.bases(true)end
if(d.FpsCap or 0)~=0 then j.cap(d.FpsCap)end j.paint()end T(a.pfLite.MouseButton1Click:Connect(function()j.lite(not d.Lite)j.paint()end))
T(a.pfHud.MouseButton1Click:Connect(function()j.hideHud(not d.HideHud)j.paint()end))T(a.pfRender.MouseButton1Click:Connect(function()j.render(not d.NoRender)j.paint()end))
T(a.pfBases.MouseButton1Click:Connect(function()j.bases(not d.HideBases)j.paint()end))T(a.pfFps.MouseButton1Click:Connect(function()
local zj=table.find(j.CAPS,d.FpsCap or 0)or 1 local rH=j.CAPS[(zj%#j.CAPS)+1]if not j.cap(rH)and rH~=0 then y("this executor cannot cap fps")end
j.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()local kT=tonumber(a.pfMem.Text)if kT and kT>=0 then d.MemLimit=math.floor(kT)end
j.paint()end))function q.names()local kU={"(none)"}for B9,zk in ipairs((q.teams()))do kU[#kU+1]=zk.name end return kU
end function q.cycle(kV,zl)local gQ=q.names()local zm=d[kV]~=""and d[kV]or"(none)"local gR=table.find(gQ,zm)or 1
gR=((gR-1+zl)%#gQ)+1 d[kV]=gQ[gR]=="(none)"and""or gQ[gR]q.paint()end function q.paint()if not q.built then return end
N(a.tmT,d.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")N(a.tmBuild,d.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")
local kW={}for B_,zn in ipairs((q.teams()))do kW[zn.name]=true end for zo,rI in pairs(q.pick)do local cR=d[zo]
rI.Text=cR==""and"(none)"or(kW[cR]and cR or(cR.." (missing)"))rI.TextColor3=(cR~=""and not kW[cR])and o.bad or o.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(d.GlazeLead)end a.tmInfo.Text=(q.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(q.switches,q.finished,q.glazed,z.fused)
..(z.buildMsg~=""and("\n"..z.buildMsg)or"")local zp,gS=l.srv(),{}for Ca,gT in ipairs(q.list or{})do gS[#gS+1]=("st %-2s %-22s %9s  helps %d"):format(gT.st.Name,ak(ab(gT.name)):sub(1,22),q.clock(gT.ends-zp),gT.helps)
end a.tmList.Text=#gS>0 and table.concat(gS,"\n")or"no waxes running"end function q.build()for Cb,kX in ipairs(a.team:GetChildren())do
if kX:IsA("Frame")or kX:IsA("TextLabel")then kX:Destroy()end end q.pick={}local kY,kZ=0,12 local function bE(rJ)
kY,kZ=kY+1,kZ+rJ+6 return M("Frame",{Size=UDim2 .new(1,0,0,rJ),BackgroundTransparency=1,LayoutOrder=kY},a.team)
end local function el(zq)O(bE(14),zq,10,o.dim,true)end local function gU(gV)local k0=bE(26)local zr=E(k0,"<",o.panel2,11,J(0,0.14))
local rK=E(k0,"(none)",o.panel,10,J(0.14,0.72))local zs=E(k0,">",o.panel2,11,J(0.86,0.14))zr.MouseButton1Click:Connect(function()q.cycle(gV,-1)end)
zs.MouseButton1Click:Connect(function()q.cycle(gV,1)end)rK.MouseButton1Click:Connect(function()q.cycle(gV,1)end)
q.pick[gV]=rK end a.tmT=E(bE(28),"AUTO TEAMS: OFF",o.panel2,11,J(0,1))a.tmT.MouseButton1Click:Connect(function()
d.Teams=not d.Teams if d.Teams and d.TeamNormal==""then d.TeamNormal=q.current()end q.paint()end)a.tmInfo=O(bE(42),"",10,o.dim,false)
local rL=bE(26)a.tmBuild=E(rL,"AUTO BUILD TEAMS: OFF",o.panel2,9,J(0,0.62))a.tmBuildNow=E(rL,"BUILD NOW",o.warn,9,J(0.62,0.38))
a.tmBuild.MouseButton1Click:Connect(function()d.AutoBuild=not d.AutoBuild q.paint()end)a.tmBuildNow.MouseButton1Click:Connect(function()
if q.editing then return end z.buildMsg="building..."task.spawn(function()local zt,zu=pcall(z.rebuild,"you asked")if not zt then y("BUILD ERR "..tostring(zu))end end)
end)el("NORMAL TEAM  (worn the rest of the time)")gU("TeamNormal")el("FULL TEAM  (every station busy: money + wax speed)")
gU("TeamFull")el("GLAZE TEAM  (worn just before a wax finishes)")gU("TeamGlaze")local k1=bE(26)a.tmLead=gp(k1,tostring(d.GlazeLead),"45",J(0,0.2))
O(k1,"sec before it finishes",10,o.dim,false,J(0.22,0.5))local zv=E(k1,"SET",o.accent,11,J(0.75,0.25))zv.MouseButton1Click:Connect(function()
local gW=tonumber(a.tmLead.Text)if gW and gW>=5 and gW<=600 then d.GlazeLead=math.floor(gW)else a.tmLead.Text=tostring(d.GlazeLead)end
q.paint()end)el("WAX TEAM  (worn while a butter is placed: head starts)")gU("TeamWax")el("YOUR WAXES  (time left, helps)")
a.tmList=M("TextLabel",{Size=aW,BackgroundColor3=o.panel,BorderSizePixel=0,Font=Enum.Font.Code,TextSize=9,TextColor3=o.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=false,Text=""},bE(150))aj(a.tmList,6)M("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4)},a.tmList)
O(bE(92),"Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.",9,o.dim,false)
a.team.CanvasSize=UDim2 .new(0,0,0,kZ+10)q.built=true q.paint()end local function zw()a.secB.Text=tostring(d.Every)
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
if not d.Ghost then task.spawn(function()while c.busy do ad(0.1)end if not C.home then pcall(j.unpin)end end)end
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=c.running then d2(d.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end bC(a.root)bC(a.tgRoot)c.lastCollect=x()
ky()K.paint()pcall(l.paintAll)pcall(q.paint)pcall(j.applyAll)end local function zx(rM)task.spawn(function()rM.TextColor3=o.bad
task.wait(0.8)if c.alive then rM.TextColor3=o.text end end)end local function rN()local rO=a.secB.Text:match("^%s*(%d+)%s*$")
local em=rO and tonumber(rO)if not em or em<1 then a.secB.Text=tostring(d.Every)zx(a.secB)y("interval must be a whole number >= 1")
return end if em==d.Every then return end d.Every,c.lastCollect=em,x()y("collect every "..em.."s")end local function P(zy,zz)T(zy.MouseButton1Click:Connect(zz))end
P(a.secSet,rN)T(a.secB.FocusLost:Connect(rN))P(a.colT,function()d.Collect,c.lastCollect=not d.Collect,x()N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
end)P(a.sellT,function()d.SellJunk=not d.SellJunk N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)P(a.sellB,function()
c.sellFails=0 task.spawn(ap,"selling...",qa)end)P(a.arT,function()d.AutoRoll=not d.AutoRoll task.spawn(A.apply,"you asked",true)
end)P(a.crateT,function()d.Crates=not d.Crates N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)P(a.helpT,function()
d.Help=not d.Help C.nextAt,C.msg=0,d.Help and"looking for waxes to help"or"off"N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)P(a.helpGT,function()d.HelpGuild=not d.HelpGuild N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)P(a.questT,function()d.Quests=not d.Quests D.at=0 N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")end)P(a.campT,function()
d.Campfire=not d.Campfire H.nextAt,H.fails,H.lost=0,0,0 N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
P(a.ghostT,j.cycleGhost)P(a.crateB,function()e.lastFail,e.summonFails,e.ignoreUntil,c.crateFails=0,0,0,0 task.spawn(ap,"opening crate...",fj,true)
end)P(a.padB,function()c.plot=bh()or c.plot local rP,k2=as(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(rP and k2 and k2:IsA("BasePart"))then y("SET PAD: need character and plot")return end c.manualPad=k2 .CFrame:ToObjectSpace(rP.HumanoidRootPart.CFrame)
xq(c.manualPad)y("collect pad saved at your position")end)P(a.startB,function()d2(not c.running)end)P(a.buyB,function()
c.plot=bh()or c.plot task.spawn(ap,"buying (manual)...",mS,true)end)P(a.plB,function()c.plot=bh()or c.plot task.spawn(ap,"waxing (manual)...",mX)
end)P(a.tabFarm,function()bD("farm")end)P(a.tabBut,function()bD("but")end)P(a.tabSet,function()bD("set")end)P(a.tabCrt,function()bD("crt")end)
P(a.tabPet,function()bD("pet")end)P(a.tabTeam,function()bD("team")end)local function zA(k3)c.hidden=k3 a.root.Visible=not k3
a.tgBtn.Text=k3 and"SAB+"or"SAB"end q2(a.tgBtn,a.tgRoot,function()bC(a.tgRoot)c.togPos=gt(a.tgRoot)or c.togPos
end)P(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then zA(not c.hidden)end c.dragMoved[a.tgBtn]=0 end)local aC,aq={},0
local function bF()aC=me()if#aC==0 then a.cfgPick.Text="(none saved)"aq=0 return end if aq<1 or aq>#aC then aq=1 end
a.cfgPick.Text=aC[aq]..("  (%d/%d)"):format(aq,#aC)end local function rQ()local rR=c.autoload~=nil a.cfgAuto.Text=rR and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"
a.cfgAuto.BackgroundColor3=rR and o.accent or o.panel2 end local function k4()local rS=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if rS~=""then return rS end return(aq>0 and aC[aq])or""end P(a.cfgSave,function()c.winPos=gt(a.root)or c.winPos
c.togPos=gt(a.tgRoot)or c.togPos local rT,rU=eZ(k4())a.cfgMsg.Text=rT and("saved as "..rU)or("could not save: "..rU)
a.cfgMsg.TextColor3=rT and o.good or o.bad bF()y(a.cfgMsg.Text)end)local function zB(k5)local k6,rV=mn(k5)a.cfgMsg.Text=k6 and("loaded "..rV)or("could not load: "..rV)
a.cfgMsg.TextColor3=k6 and o.good or o.bad if k6 then a.cfgName.Text=k5 zw()task.spawn(A.apply,"config "..k5)
end y(a.cfgMsg.Text)end P(a.cfgLoad,function()zB(k4())end)P(a.cfgPick,function()bF()if aq>0 then a.cfgName.Text=aC[aq]end
end)P(a.cfgPrev,function()if#aC==0 then bF()return end aq=(aq-2)%#aC+1 bF()a.cfgName.Text=aC[aq]end)P(a.cfgNext,function()
if#aC==0 then bF()return end aq=aq%#aC+1 bF()a.cfgName.Text=aC[aq]end)P(a.cfgAuto,function()if c.autoload then
mp(nil)a.cfgMsg.Text="it will not load a config on launch"else local en=k4()local rW=false for Cc,zC in ipairs(me())do if zC==en then rW=true end end
local zD=rW or eZ(en)if zD and en~=""then mp(en)bF()a.cfgMsg.Text=en.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=o.dim rQ()end)P(a.autoB,function()
local rX,rY=tN()a.autoMsg.Text=rX and("installed. "..rY)or("failed: "..rY)a.autoMsg.TextColor3=rX and o.good or o.bad
y(a.autoMsg.Text)end)P(a.startT,function()d.AutoStart=not d.AutoStart N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)P(a.rejT,function()d.Rejoin=not d.Rejoin N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)P(a.rejB,function()c9("you asked")end)
local bG=false P(a.minB,function()bG=not bG a.tabs.Visible=not bG if bG then a.farm.Visible,a.but.Visible,a.set.Visible,a.crt.Visible=false,false,false,false
a.pet.Visible,a.team.Visible=false,false else bD(rr)end a.root.Size=UDim2 .new(0,ag.w,0,bG and(ag.head+ag.strip)or ag.h)
a.minB.Text=bG and"+"or"-"end)local function gX()if not c.alive then return end c.alive,c.running=false,false
pcall(j.restoreAll)pcall(eA)for Cd,zE in ipairs(g5)do pcall(function()zE:Disconnect()end)end if e.oldNC then pcall(function()hookmetamethod(game,"__namecall",e.oldNC)end)end
pcall(function()kk:Destroy()end)pcall(function()ra:Destroy()end)if b_.SAB_KILL==gX then b_.SAB_KILL=nil end end
b_.SAB_KILL=gX P(a.killB,gX)P(a.xB,gX)q2(a.title,a.root,function()bC(a.root)c.winPos=gt(a.root)or c.winPos end)
local function rZ()local eo,b8=c.reason,c.level if c.busy then eo,b8=c.busyText,"ok"elseif not c.running then
local Ce,r0,zF=qg()if c.capHit then eo,b8=r0,"bad"else eo,b8="[stopped] "..r0,(zF=="bad")and"bad"or"idle"end c.reason,c.level=eo,b8
end local gY=c.running and o.good or(c.capHit and o.bad or o.dim)if a.lit.dot~=gY then a.lit.dot=gY a.dot.BackgroundColor3,a.tgDot.BackgroundColor3=gY,gY end
if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and o.panel2 or o.accent end if c.hidden then return end
a.put(a.reason,eo)if a.lit.bar~=b8 then a.lit.bar=b8 a.bar.BackgroundColor3=yb[b8]or o.dim end if bG then return end
if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and o.warn or o.good
end N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")local bH=to()if a.farm.Visible then
local zG,zH=ex()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,zG.."/"..zH)local r1=(c.running and d.Collect)and math.max(0,math.ceil(d.Every-(x()-c.lastCollect)))or nil
local r2=aa()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aD(a0()),c.rolls,c.gifts,c.crates,r2 and ak(ab(r2))or"nothing",e.on and("   ["..e.title.." window open]")or"",
r1 and("in "..r1 .."s")or"off"))a.put(a.tgt,(#bH==0)and"NOTHING TICKED - open the BUTTERS tab"or("buying: "..((#bH<=3)and table.concat(bH,", ")or(#bH.." butters ticked"))))
if a.lit.tgt~=(#bH==0)then a.lit.tgt=(#bH==0)a.tgt.TextColor3=(#bH==0)and o.bad or o.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(er,"\n")end
end if a.set.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(W.n,#W.rarOrder,#bH))
end if a.but.Visible and be.at~=W.at then eh(false)end if a.crt.Visible then if K.built~=K.at then K.build()else K.paint()end
end if a.pet.Visible then l.live()end if a.set.Visible then a.pfInfo.Text=("%d fps | memory %d MB (peak %d)"):format(math.floor(j.fps+0.5),j.mem,j.memPeak)
end if a.team.Visible then q.paint()end if a.farm.Visible then a.put(a.helpL,"help: "..((d.Help or d.HelpGuild)and C.msg or"off"))
a.put(a.campL,"camp: "..(d.Campfire and H.msg or"off")..(j.ghostMode()>0 and(j.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests: "..(d.Quests and(D.msg~=""and D.msg or"checking...")or"off"))N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.arT,d.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")local r3=(A.rec.on and"on"or"")..(A.rec.off and((A.rec.on and"/"or"").."off")or"")
a.put(a.arL,A.msg~=""and A.msg or("auto roll: game %s | learned %s%s"):format(A.isOn()and"ON"or"off",r3~=""and r3 or"nothing yet",#A.rec.rules>0 and", choices"or""))
if a.lit.arL~=(A.msg~="")then a.lit.arL=(A.msg~="")a.arL.TextColor3=A.msg~=""and o.warn or o.dim end end end b_.SAB={S=c,CFG=d,EV=Q,U=a,sg=kk,CAT=W,LEARN=ae,buildList=eh,
logAll=cS,evAll=cT,AR=A,CR=K,PF=j,PX=l,TM=q,CRATE=e,FU=z,HX=C,CF=H,QX=D}y(b9 .." loaded")if c.uiErrs>0 then y("UI: "..c.uiErrs.." properties skipped")end
bD("farm")bC(a.root)bC(a.tgRoot)if gq then pcall(function()T(gq:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)bC(a.root)bC(a.tgRoot)end))end)end bF()rQ()if c.config and c.config~=""then a.cfgName.Text=c.config end
N(a.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")N(a.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")N(a.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
N(a.helpT,d.Help,"HELP WAXES: ON","HELP WAXES: OFF")N(a.helpGT,d.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
N(a.campT,d.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")j.paintGhost()N(a.questT,d.Quests,"QUESTS: ON","QUESTS: OFF")
N(a.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")N(a.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(d.Every)pcall(j.applyAll)pcall(rZ)task.spawn(function()local r4=tL()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(r4 and("\n(backup: "..r4 ..")")or"")
local r5=eU(ah.exec)if r5 and not r5:find("SAB autoloader v2",1,true)then c5(ah.exec,ah.stub)y("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(eU(ah.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(tT)end)task.spawn(function()while c.alive do local zI,zJ=pcall(rZ)if not zI then y("UI ERR "..tostring(zJ))end
task.wait((c.hidden or bG)and 1.5 or 0.4)end end)task.spawn(function()local zK,zL=pcall(t1)if not zK then y("HOOK ERR "..tostring(zL))end
end)task.spawn(function()pcall(sM)if e.loadSeq and not e.learned then local gZ={}for r6=1,20 do if e.loadSeq[r6]then gZ[#gZ+1]=e.loadSeq[r6]end end
if#gZ>0 then e.learned={seq=gZ,mode=e.loadMode}y("remembered how to open crates directly")end end if hE()then y(("catalog: %d butters in %d rarities"):format(W.n,#W.rarOrder))end
local zM,r7=pcall(xs)if zM and r7 and c.alive and not c.manualPad then c.manualPad=r7 end end)task.spawn(function()
while c.alive do local k7,k8=pcall(l.buyTick)if not k7 then y("PET ERR "..tostring(k8))task.wait(5)end k7,k8=pcall(l.wishTick)
if not k7 then y("WISH ERR "..tostring(k8))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local g0,r8=0,x()
T(game:GetService("RunService").Heartbeat:Connect(function()g0=g0+1 end))T(game:GetService("RunService").Heartbeat:Connect(function()if j.hold then pcall(j.pinTick)end end))
j.noteAt=x()while c.alive do task.wait(1)local r9=x()j.fps,g0,r8=g0/math.max(r9-r8,0.001),0,r9 local zN,zO=pcall(j.tick)
if not zN then y("PERF ERR "..tostring(zO))task.wait(5)end end end)task.spawn(function()task.wait(10)while c.alive do
local zP,zQ=pcall(z.tick)if not zP then y("FUSE ERR "..tostring(zQ))task.wait(10)end task.wait(4)end end)task.spawn(function()
while c.alive do local zR,zS=pcall(q.tick)if not zR then y("TEAM ERR "..tostring(zS))task.wait(3)end task.wait(0.25)
end end)task.spawn(function()local g1=ar:WaitForChild("Remotes",30)local r_=g1 and g1:WaitForChild("ClanEvent",30)
if r_ and c.alive then T(r_.OnClientEvent:Connect(function(zT,zU)if zT=="call"then pcall(C.onCall,zU)end end))
end local sa=g1 and g1:FindFirstChild("RollConfirmAsk")if sa and c.alive then T(sa.OnClientEvent:Connect(function(zV)D.asked=zV or"butter"end))end
end)task.spawn(function()task.wait(8)while c.alive do local zW,zX=pcall(D.tick)if not zW then y("QUEST ERR "..tostring(zX))task.wait(30)end
task.wait(3)end end)task.spawn(function()while c.alive do task.wait(20)pcall(eA)end end)pcall(A.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local zZ=(type(newcclosure)=="function")and newcclosure or function(zY)return zY end local k9
local sb=(type(setnamecallmethod)=="function")and setnamecallmethod or nil k9=hookmetamethod(game,"__namecall",zZ(function(sc,...)
local ep=getnamecallmethod()if c.alive and(ep=="InvokeServer"or ep=="FireServer")then local sd,se=pcall(function()return sc.Name end)
if sd and se=="CrateAction"and not e.replaying then pcall(e.saw,ep,...)elseif sd and se=="AutoRollAction"and not A.replaying then pcall(A.saw,ep,...)end
if sb then sb(ep)end end return k9(sc,...)end))e.oldNC=k9 end)end if g3 then T(F.Idled:Connect(function()pcall(function()g3:CaptureController()g3:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Cf=1,90 do if not c.alive then return end if F:GetAttribute("AutoRollOn")~=nil and as()and(c.plot or bh())then break end
task.wait(1)end task.wait(2)if d.AutoRoll then A.apply("joined")end while c.alive do task.wait(30)if c.alive and d.AutoRoll and c.running and not A.isOn()and not bL()and not aa()
and not e.waiting and not e.on and not c.busy then A.apply("it was off")end end end)task.spawn(function()if not d.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Cg=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bh()if as()and c.plot and next(d.Targets)then d2(true,true)y("started by itself")
return end task.wait(1)end if c.alive and not c.running then y("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bh()c.lastCollect=x()while c.alive do if c.running then local z0,sf=pcall(x7)if not z0 and sf~=g4 then y("LOOP ERR "..tostring(sf))end
end task.wait(0.1)end end)g2("loaded - window is at the top left")end local z2,k_=xpcall(sk,function(z1)return tostring(z1).."\n"..debug.traceback()end)
if not z2 then pcall(function()warn("SAB "..b9 .." ERROR: "..tostring(k_))end)g2("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b9 .." ERROR: "..tostring(k_))end)pcall(function()local sh=(type(getgenv)=="function"and getgenv())or _G
if type(sh.SAB_KILL)=="function"then sh.SAB_KILL()end for Ch,z3 in ipairs({"SABFarmGui","SABToggle"})do local si=F.PlayerGui:FindFirstChild(z3)
if si then si:Destroy()end end end)pcall(function()local eq=Instance.new("ScreenGui")eq.Name="SABError"eq.ResetOnSpawn=false
eq.DisplayOrder=1000 local aP=Instance.new("TextBox")aP.Size=UDim2 .new(0,340,0,170)aP.Position=UDim2 .new(0,10,0,50)
aP.BackgroundColor3=Color3 .fromRGB(90,20,20)aP.TextColor3=Color3 .new(1,1,1)aP.TextSize=11 aP.TextWrapped=true
aP.ClearTextOnFocus=false aP.TextXAlignment=Enum.TextXAlignment.Left aP.TextYAlignment=Enum.TextYAlignment.Top
aP.Text="SAB "..b9 .." failed to start. Send this text:\n"..tostring(k_)aP.Parent=eq eq.Parent=F:WaitForChild("PlayerGui")
end)end
