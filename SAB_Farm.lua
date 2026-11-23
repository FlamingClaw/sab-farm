local b_="v28"local oJ=game:GetService("Players")local J=oJ.LocalPlayer or oJ.PlayerAdded:Wait()local function jd(x6)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..b_,Text=x6,Duration=6})
end)end jd("script started")local function x7()local af=game:GetService("ReplicatedStorage")local ai=game:GetService("Workspace")
local oK=game:GetService("UserInputService")local cV=(type(getgenv)=="function"and getgenv())or _G if type(cV.SAB_KILL)=="function"then pcall(cV.SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local je=(function()local x8,x9=pcall(function()return game:GetService("VirtualUser")end)return x8 and x9 or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,CrateTicks={picniccrate=true},
Rejoin=true,AutoStart=true,AutoRoll=false,ARrules="",ARstop="",Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
PetBuy=false,PetWish=false,Pets={},AutoFuse=false,AutoBuild=false,Teams=false,TeamNormal="",TeamFull="",TeamGlaze="",TeamWax="",GlazeLead=45,
Lite=false,HideHud=false,NoRender=false,FpsCap=0,Calm=false,HideBases=false,HideMine=false,MemLimit=1250,Help=false,
HelpGuild=false,Campfire=true,Ghost=false,GhostHelps=false,Quests=true,AutoIndex=false,Best=0,BestCrate=false,
Shower=true,SnapGlaze=true,}local c={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=z(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,}local V={name=nil,rar=nil,at=z(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}
local D={rec={rules={}},replaying=false,busy=false,msg="",lastCheck=0}local j={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local o,A,d,y,E,F,H={},{},{},{},{},{},{}local q,O={},{}local jf={}local jg,fX,dP,dQ={},{},{},{}local function T(oL)jg[#jg+1]=oL return oL end
local function ag(x_)task.wait(x_)if not c.alive then error(jf,0)end end local function C(fY)fY=os.date("%H:%M:%S").." "..tostring(fY)
table.insert(fX,1,fY)if#fX>6 then table.remove(fX)end c.logN=(c.logN or 0)+1 dP[#dP+1]=fY if#dP>80 then table.remove(dP,1)end
end local function fZ(oM)if type(oM)~="string"then return""end return(oM:lower():gsub("[^%w]",""))end local function W(ya)
local oN=fZ(ya)local jh=oN:gsub("butter$","")if jh==""then jh=oN end return jh end local function aN(oO)if type(oO)~="string"then return false end
local ji=W(oO)if ji==""then return false end if q.want then return q.want(ji)end return e.Targets[ji]==true end
local function yb(dR)dR=dR:lower()return dR:find("squishy",1,true)~=nil or dR:match("butter$")~=nil or dR:match("butter[^%a]")~=nil
end local jj={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aE(dS)if type(dS)~="number"then return"?"end
local f0=1 while math.abs(dS)>=1000 and f0<#jj do dS=dS/1000 f0=f0+1 end local yc=string.format("%.2f",dS):gsub("%.?0+$","")
return yc..jj[f0]end local function yd(oP)if type(oP)~="string"then return nil end local ye,dT=oP:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jk=tonumber(ye)if not jk then return nil end if dT==""then return jk end local yf={qd="qa",qn="qi"}dT=yf[dT:lower()]or dT
for yg,yh in ipairs(jj)do if yh:lower()==dT:lower()then return jk*1000^(yg-1)end end return nil end local function be()
local oQ=J:GetAttribute("BoardValueMoney")if type(oQ)=="number"then return oQ end local oR=J:FindFirstChild("leaderstats")
if oR then for IE,yi in ipairs({"Cash","Money","Coins"})do local jl=oR:FindFirstChild(yi)if jl and type(jl.Value)=="number"then return jl.Value end
end end end local function f1(yj)local jm=yj:GetFullName()if c.plot then local jn=c.plot:GetFullName()if jm:sub(1,#jn)==jn then return jm:sub(#jn+2)end
end return jm end local function aq()local f2=J.Character if f2 and f2:FindFirstChild("HumanoidRootPart")then
local oS=f2:FindFirstChildOfClass("Humanoid")if oS and oS.Health>0 then return f2 end end end local function bB()
local jo=ai:FindFirstChild("Plots")if not jo then return nil end local function oT(yk)local oU=yk:FindFirstChild("Plate")
return oU~=nil and oU:FindFirstChild("EditStackAttachment",true)~=nil end local oV=J:GetAttribute("PlotNumber")
if oV~=nil then local jp=jo:FindFirstChild(tostring(oV))if jp and oT(jp)then return jp end end for IF,oW in ipairs(jo:GetChildren())do
if oT(oW)then return oW end end end local function dU(oX)local bC=oX and oX.Parent for IG=1,6 do if not bC then return nil end
if bC:IsA("BasePart")then return bC end if bC:IsA("Model")then return bC.PrimaryPart or bC:FindFirstChildWhichIsA("BasePart",true)end
bC=bC.Parent end end local function oY(oZ)local jq=oZ.Parent if jq and jq:IsA("Attachment")then return jq.WorldPosition end
local o0=dU(oZ)return o0 and o0 .Position end local function o1()local cW=c.plot and c.plot:FindFirstChild("Plate")
if not cW then return nil end if cW:IsA("BasePart")then return cW.Position end if cW:IsA("Model")then return cW:GetPivot().Position end
local o2=cW:FindFirstChildWhichIsA("BasePart",true)return o2 and o2 .Position end local function o3()local jr={}
local o4=c.plot and c.plot:FindFirstChild("WaxStations")if o4 then for IH,yl in ipairs(o4:GetChildren())do local o5=yl:FindFirstChild("SquishyPlaceHolder")
local js=o5 and o5:FindFirstChild("PlacePrompt")if js and js:IsA("ProximityPrompt")then jr[#jr+1]=js end end end
return jr end local function f3()local o6,jt=o3(),0 for II,ym in ipairs(o6)do if ym.Enabled then jt=jt+1 end end
local ju=#o6 local jv=J:GetAttribute("WaxStations")if type(jv)=="number"and jv>ju then ju=jv end return jt,ju
end local function yn()local o7=aq()local o8=o7 and o7 .HumanoidRootPart.Position local jw,o9 for IJ,jx in ipairs(o3())do
if jx.Enabled then local o_=oY(jx)local pa=(o_ and o8)and(o_-o8).Magnitude or 1e9 if not jw or pa<o9 then jw,o9=jx,pa end
end end return jw end local function pb()local f4=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not f4 then return nil end local pc=f4:FindFirstChild("BuyPromptAttachment")local f5=(pc and pc:FindFirstChild("BuyPrompt"))or f4:FindFirstChild("BuyPrompt",true)
if f5 and f5:IsA("ProximityPrompt")and f5:IsDescendantOf(f4)then return f5 end end local pd={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local yo={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ak={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jy="SAB_order.txt"local function f6()if not ak.dirty or type(writefile)~="function"then return end local aF={}
for yp,yq in pairs(ak.price)do aF[#aF+1]="P|"..yp.."|"..string.format("%.0f",yq)end for yr,ys in pairs(ak.order)do aF[#aF+1]="O|"..yr.."|"..table.concat(ys,",")end
if j.learned and j.enc then aF[#aF+1]="M|mode|"..tostring(j.learned.mode or"")for yt,f7 in ipairs(j.learned.seq)do
local pe={}for pf=1,f7 .n do pe[pf]=j.enc(f7 .args[pf])end aF[#aF+1]=("A|%d|%s|%d|%s"):format(yt,f7 .m,f7 .n,table.concat(pe,";"))
end end local function jz(yu,yv,f8)local pg={}for ph=1,f8 .n do pg[ph]=j.enc(f8 .args[ph])end aF[#aF+1]=("R|%d|%s|%s|%d|%s"):format(yv,yu,f8 .m,f8 .n,table.concat(pg,";"))
end if j.enc then for yw,yx in ipairs(D.rec.rules)do jz("rules",yw,yx)end if D.rec.on then jz("on",0,D.rec.on)end
if D.rec.off then jz("off",0,D.rec.off)end end for IK,dV in pairs(L.seen)do aF[#aF+1]=("K|%s|%s|%s|%s"):format(dV.name,dV.title or"",dV.rar or"",dV.price and string.format("%.0f",dV.price)or"")
end if pcall(writefile,jy,table.concat(aF,"\n"))then ak.dirty=false end end local function yy()if type(isfile)~="function"or type(readfile)~="function"then return end
local yz,yA=pcall(isfile,jy)if not(yz and yA)then return end local yB,pj=pcall(readfile,jy)if not(yB and type(pj)=="string")then return end
for yC in pj:gmatch("[^\n]+")do local cX,cY,bf=yC:match("^(%a)|([^|]+)|(.*)$")if cX=="P"then ak.price[cY]=tonumber(bf)
elseif cX=="M"then j.loadMode=(bf~=""and bf~="nil")and bf or nil elseif cX=="A"and j.dec then local pk=tonumber(cY)
local pl,f9,yD=bf:match("^([^|]+)|(%d+)|(.*)$")if pk and pl then f9=tonumber(f9)local pm,f_={},0 for yE in(yD..";"):gmatch("([^;]*);")do
f_=f_+1 if f_<=f9 then pm[f_]=j.dec(yE)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pk]={m=pl,n=f9,args=pm}end elseif cX=="R"and j.dec then
local pn=tonumber(cY)local ga,yF,gb,yG=bf:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pn and ga then gb=tonumber(gb)
local po,gc={},0 for yH in(yG..";"):gmatch("([^;]*);")do gc=gc+1 if gc<=gb then po[gc]=j.dec(yH)end end local jA={m=yF,n=gb,args=po}
if ga=="rules"then D.rec.rules[pn]=jA elseif ga=="on"then D.rec.on=jA elseif ga=="off"then D.rec.off=jA end end
elseif cX=="K"then local pp,pq,yI=bf:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cY)]={name=cY,title=pp~=""and pp or nil,
rar=pq~=""and pq or nil,price=tonumber(yI)}elseif cX=="O"and bf~=""then local gd={}for yJ in bf:gmatch("[^,]+")do gd[#gd+1]=yJ end
if#gd>0 then ak.order[cY]=gd end end end end local function yK(ge)if type(ge)~="table"then return end local ca,ps=ge.rarity,ge.contents
if type(ca)~="string"or ca==""or type(ps)~="table"then return end local dW={}for IL,gf in ipairs(ps)do if type(gf)=="table"and type(gf.butter)=="string"then
dW[#dW+1]={n=gf.butter,ch=tonumber(gf.chance)or 0}end end if#dW==0 then return end table.sort(dW,function(yL,yM)return yL.ch>yM.ch end)
local dX,dY={},false for yN,yO in ipairs(dW)do dX[yN]=yO.n end local jB=ak.order[ca]if not jB or#jB~=#dX then dY=true end
if not dY then for pt=1,#dX do if jB[pt]~=dX[pt]then dY=true break end end end ak.order[ca]=dX local jC=tonumber(ge.price)
if jC and ak.price[ca]~=jC then ak.price[ca]=jC dY=true end if dY then ak.dirty=true ad.at=0 C("learned the "..ca.." order from its crate")
end end local function cZ(yP,yQ)local yR=yP:FindFirstChild(yQ,true)local yS,jD=pcall(function()return yR.Text end)
return(yS and type(jD)=="string"and jD~="")and jD or nil end local function al(pu)return ad.pretty[pu]or pu end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(yT)return fZ(yT or"")end
function L.learn(bh)if type(bh)~="table"or type(bh.name)~="string"then return end local jE=L.key(bh.name)local bi=L.seen[jE]or{}
local yU=(L.seen[jE]==nil)or(tonumber(bh.price)and bi.price~=tonumber(bh.price))bi.name,bi.title=bh.name,bh.title or bi.title
bi.rar,bi.price=bh.rarity or bi.rar,tonumber(bh.price)or bi.price L.seen[jE]=bi if yU then L.at,ak.dirty=z(),true end
end function L.wanted(pv)if pv==nil then return false end local jF=L.key(pv)return e.CrateTicks[jF]==true or(e.BestCrate and q.bestCrate~=nil and(jF==q.bestCrate or jF==q.bestCrateTitle))
end function L.list()local c0={}for yV,gg in ipairs(L.base)do c0[L.key(gg[1])]={name=gg[1],title=gg[2],rar=gg[3],i=yV}end
for IM,dZ in ipairs(ad.rarOrder)do local pw=false for IN,yW in pairs(c0)do if yW.rar==dZ then pw=true break end end
if not pw and dZ~="?"then local px=dZ:gsub("[^%w]","").."Crate"c0[L.key(px)]={name=px,title=dZ.." Crate",rar=dZ,i=50,guess=true}
end end for py,gh in pairs(L.seen)do local a6=c0[py]or{i=100}a6 .name,a6 .title,a6 .rar=gh.name or a6 .name,gh.title or a6 .title,gh.rar or a6 .rar
a6 .price,a6 .guess=gh.price or a6 .price,nil c0[py]=a6 end local d0,gi={},{}for yX,yY in ipairs(pd)do d0[yY]=yX end
for yZ,pz in ipairs(ad.rarOrder)do d0[pz]=d0[pz]or(20+yZ)end for y0,d1 in pairs(c0)do d1 .k=y0 d1 .price=d1 .price or ak.price[d1 .rar or""]
gi[#gi+1]=d1 end table.sort(gi,function(cb,cc)if cb.price and cc.price and cb.price~=cc.price then return cb.price<cc.price end
local pA,pB=d0[cb.rar or""]or 99,d0[cc.rar or""]or 99 if pA~=pB then return pA<pB end if(cb.i or 100)~=(cc.i or 100)then return(cb.i or 100)<(cc.i or 100)end
return cb.k<cc.k end)return gi end local function y1()local pC=af:FindFirstChild("Assets")local pD=pC and pC:FindFirstChild("Squishies")
if not pD then return false end local jG,pE,c1={},{},{}local gj=0 for IO,gk in ipairs(pD:GetChildren())do local d2=W(gk.Name)
if d2~=""and not jG[d2]then local gl=cZ(gk,"RarityText")or"?"jG[d2]=gl pE[d2]=cZ(gk,"NameText")or gk.Name c1[gl]=c1[gl]or{}
table.insert(c1[gl],d2)gj=gj+1 end end if gj==0 then return false end for pF,y2 in pairs(c1)do local pG=ak.order[pF]or yo[pF]
local jH={}if pG then for y3,y4 in ipairs(pG)do jH[W(y4)]=y3 end end table.sort(y2,function(pH,pI)local jI,jJ=jH[pH],jH[pI]
if jI and jJ then return jI<jJ end if jI then return true end if jJ then return false end return al(pH)<al(pI)
end)end local jK={}for y5,y6 in ipairs(pd)do jK[y6]=y5 end local gm,cd={},{}for y7 in pairs(c1)do gm[#gm+1]=y7 end
pcall(function()for y8,y9 in ipairs(require(af.Modules.SquishyRNG).Keys)do cd[y9]=y8 end end)table.sort(gm,function(c2,c3)
if cd[c2]and cd[c3]and cd[c2]~=cd[c3]then return cd[c2]<cd[c3]end local jL,jM=ak.price[c2],ak.price[c3]if jL and jM and jL~=jM then return jL<jM end
local jN,jO=jK[c2],jK[c3]if jN and jO then return jN<jO end if jN then return true end if jO then return false end
return c2<c3 end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=jG,pE,c1,gm,gj,z()return true end local function jP()
if ad.at==0 or(z()-ad.at)>120 then pcall(y1)end return ad.n>0 end local function y_(za)local pJ=W(za)return ad.rar[pJ]or(V.name and W(V.name)==pJ and V.rar)or"?"
end local function zb()local gn={}local zc=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for zd,ze in pairs(zc)do if ze then gn[#gn+1]=al(zd)end end
table.sort(gn)return gn end local an={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function pK()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function go(pL)if type(makefolder)~="function"then return end local zf,zg=pcall(isfolder,pL)if not(zf and zg)then pcall(makefolder,pL)end
end local function gp(pM)if type(isfile)~="function"or type(readfile)~="function"then return nil end local zh,zi=pcall(isfile,pM)
if not(zh and zi)then return nil end local zj,zk=pcall(readfile,pM)return zj and zk or nil end local function d3(zl,zm)
if type(writefile)~="function"then return false end return(pcall(writefile,zl,zm))end local function pN(zn)local d4={}
if type(listfiles)~="function"then return d4 end local zo,pO=pcall(listfiles,zn)if not zo or type(pO)~="table"then return d4 end
for IP,zp in ipairs(pO)do d4[#d4+1]=tostring(zp)end return d4 end local function pP()local gq={}for IQ,zq in ipairs(pN(an.cfg))do
local pQ=zq:match("([^/\\]+)%.txt$")if pQ then gq[#gq+1]=pQ end end table.sort(gq)return gq end local function zr()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(e.Every)aa[#aa+1]="N|GlazeLead|"..tostring(e.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(e.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(e.MemLimit)aa[#aa+1]="N|Best|"..tostring(e.Best or 0)for IR,pR in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..pR.."|"..e[pR]end
do local gr={}for zs,gs in pairs(e.Pets)do local pS=(gs.b and"b"or"")..(gs.g and"g"or"")..(gs.w and"w"or"")..(tonumber(gs.f)==-1 and"k"or"")
if pS~=""then gr[#gr+1]=zs.."|"..pS end end table.sort(gr)aa[#aa+1]="P|-"for IS,zt in ipairs(gr)do aa[#aa+1]="P|"..zt end
end for IT,pT in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..pT.."|"..(e[pT]and"1"or"0")end local jQ=J:GetAttribute("AutoRollRules")if type(jQ)=="string"and jQ~=""then e.ARrules,e.ARstop=jQ,tostring(J:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then aa[#aa+1]="S|rules|"..e.ARrules aa[#aa+1]="S|stop|"..e.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for IU,jR in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gt={}for zu,zv in pairs(jR[2])do if zv then gt[#gt+1]=zu end end table.sort(gt)aa[#aa+1]=jR[1].."|-"for IV,zw in ipairs(gt)do aa[#aa+1]=jR[1].."|"..zw end
end return table.concat(aa,"\n")end local function zx(jS)if type(jS)~="string"or jS==""then return false end local pU,pV,pW,pX,d5={},false,{},false,nil
for zy in jS:gmatch("[^\n]+")do local aG,ah,az=zy:match("^(%a)|([^|]*)|?(.*)$")if aG=="N"and ah=="Every"then local jT=tonumber(az)
if jT and jT>=1 then e.Every=math.floor(jT)end elseif aG=="N"and(ah=="FpsCap"or ah=="MemLimit")then local jU=tonumber(az)
if jU and jU>=0 then e[ah]=math.floor(jU)end elseif aG=="N"and ah=="Best"then local gu=tonumber(az)if gu and gu>=0 and gu<=4 then e.Best=math.floor(gu)end
elseif aG=="N"and ah=="GlazeLead"then local gv=tonumber(az)if gv and gv>=5 and gv<=600 then e.GlazeLead=math.floor(gv)end
elseif aG=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then e[ah]=az elseif aG=="P"and ah~=""then
if not d5 then d5={}end if ah~="-"and az~=""then d5[ah]={b=az:find("b",1,true)and true or nil,g=az:find("g",1,true)and true or nil,
w=az:find("w",1,true)and true or nil,f=az:find("k",1,true)and-1 or nil}end elseif aG=="B"then if e[ah]~=nil then e[ah]=(az=="1")end
elseif aG=="S"and ah=="rules"then e.ARrules=az elseif aG=="S"and ah=="stop"then e.ARstop=az elseif aG=="W"then
c.winPos={tonumber(ah)or 10,tonumber(az)or 44}elseif aG=="G"then c.togPos={tonumber(ah)or 10,tonumber(az)or 300}
elseif aG=="T"and ah~=""then if ah~="-"then pU[ah]=true end pV=true elseif aG=="K"and ah~=""then if ah~="-"then pW[ah]=true end
pX=true end end if pV then e.Targets=pU end if pX then e.CrateTicks=pW end if d5 then e.Pets=d5 end return true
end local function gw(c4)if not pK()then return false,"this executor cannot write files"end c4=(c4 or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c4==""then return false,"give the config a name"end go(an.dir)go(an.cfg)if not d3(an.cfg.."/"..c4 ..".txt",zr())then return false,"could not write the file"end
c.config=c4 return true,c4 end local function pY(gx)local pZ=gp(an.cfg.."/"..gx..".txt")if not pZ then return false,"no config called "..tostring(gx)end
if not zx(pZ)then return false,"that config looks empty"end c.config=gx return true,gx end local function p0(jV)
if jV then go(an.dir)d3(an.auto,jV)elseif type(delfile)=="function"then pcall(delfile,an.auto)else d3(an.auto,"")
end c.autoload=jV end local function zz()if c.selfPath then return c.selfPath end local gy for IW,zA in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",an.dir})do
for IY,p1 in ipairs(pN(zA))do local jW=p1:lower()if jW:sub(-4)==".lua"and(jW:find("sab_farm",1,true)or jW:find("sab farm",1,true))then
gy=gy or p1 end end end c.selfPath=gy return gy end an.stub=[[
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
local function zB()if not pK()then return false,"this executor cannot write files"end go("autoexec")if not d3(an.exec,an.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gz=(function()local zC,zD=pcall(function()return game:GetService("TeleportService")end)return zC and zD or nil end)()
local function p2()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local zE=queueonteleport or queue_on_teleport return(pcall(zE,an.stub))end local function d6(zF)if c.rejoining then return end
c.rejoining=true C("REJOIN ("..zF..")")pcall(f6)if c.autoload then pcall(gw,c.autoload)end local zG=p2()C(zG and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for IZ=1,30 do if not gz then break end pcall(function()gz:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function zH()local zI,p3=pcall(function()return game:GetService("GuiService")end)if zI and p3 then
pcall(function()T(p3 .ErrorMessageChanged:Connect(function()if e.Rejoin then d6("roblox error message")end end))
end)end pcall(function()local p4=game:GetService("CoreGui")local p5=p4 and p4:WaitForChild("RobloxPromptGui",15)
local p6=p5 and p5:WaitForChild("promptOverlay",15)if p6 then T(p6 .ChildAdded:Connect(function(zJ)if e.Rejoin and tostring(zJ.Name):lower():find("errorprompt",1,true)then d6("disconnect prompt")end
end))end end)if gz then pcall(function()T(gz.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()d6("teleport retry")end)end
end))end)end end local function p7(zK)local p8=c.plot and c.plot:FindFirstChild(zK)if not p8 then return nil,false end
for I0,jX in ipairs(p8:GetChildren())do if jX:IsA("Model")or jX:IsA("BasePart")then return jX,true end end return nil,true
end local function ce()local bD=p7("RolledSquishy")if not bD then return nil end return{model=bD,name=bD.Name,pretty=cZ(bD,"NameText")or al(W(bD.Name)),
rar=cZ(bD,"RarityText")or y_(bD.Name),price=cZ(bD,"PriceText")}end local function p9(jY)return type(jY)=="string"and(ad.rar[W(jY)]~=nil or yb(jY))
end local function ac()local jZ=p7("SquishyEquipped")if jZ then c.carrySrc,j.heldAt="model",z()return jZ.Name,jZ end
local p_=J.Character if p_ then for I1,d7 in ipairs(p_:GetDescendants())do if(d7:IsA("Model")or d7:IsA("Tool"))and p9(d7 .Name)then
c.carrySrc,j.heldAt="character",z()return d7 .Name,d7 end end end local gA=J:GetAttribute("SquishyEquipped")if type(gA)=="string"and gA~=""and p9(gA)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gA,nil end c.carrySrc=nil end local function I2()local I3,zL=ac()return zL end local function d8()
local qa=ce()local j0=qa and yd(qa.price)local j1=be()if j0 and j1 and j1<j0*0.5 then return j1,j0 end end local function cf(zM)
dQ[#dQ+1]=os.date("%H:%M:%S").." "..zM if#dQ>40 then table.remove(dQ,1)end end local function zN(cg,gB)if type(cg)~="string"then return end
cf(("Roll(%s,%s)"):format(cg,tostring(gB)))if cg:lower():find("crate",1,true)then j.rolled,j.rolledAt=cg,z()return
end V.seq=V.seq+1 V.name,V.at=cg,z()V.rar=type(gB)=="string"and gB or nil c.rolls=c.rolls+1 if aN(cg)then C(("ROLL %s [%s] = TARGET"):format(cg,tostring(gB)))end
end local function zO(cj)if type(cj)~="table"then return end local gC=cj.butter or cj.itemName if type(gC)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=gC,z()if type(cj.giftId)=="string"then local qb=af:FindFirstChild("Remotes")
local qc=qb and qb:FindFirstChild("GiftThanks")if qc then pcall(function()qc:FireServer(cj.giftId)end)end end
cf("Gift("..gC.." from "..tostring(cj.fromName)..")")C(("GIFT from %s: %s - it will not be waxed"):format(tostring(cj.fromName),gC))
end local function zP()local qe=af:WaitForChild("Remotes",30)if not c.alive then return end if not qe then C("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local qf=J:GetAttribute("SquishyEquipped")
if type(qf)=="string"and qf~=""then j.heldAt=z()end end))local zV={SquishyRollAnimation=zN,InitSquishy=function(qg)V.init,V.initAt=tostring(qg),z()cf("Init("..tostring(qg)..")")end,
CrateUpdate=function(c5,qh)pcall(yK,c5)pcall(L.learn,c5)if type(c5)=="table"then local zQ=qh==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not zQ then return end local zR=not j.waiting local zS=j.on j.waiting,j.data,j.at=true,c5,z()j.on=(qh==true)
j.title=tostring(c5 .title or c5 .name or"crate")if j.on and not zS then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cf("CrateWindow open("..j.title..")")elseif zR then cf("Crate waiting("..j.title..")")C(j.title.." is waiting on your stand")
end else if j.waiting then cf("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local zT=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,zT)end if j.classify then local zU=z()
task.spawn(function()pcall(j.classify,zU)end)end end end,GiftReceived=zO,}for gD,zW in pairs(zV)do local j2=qe:FindFirstChild(gD)
if j2 and j2:IsA("RemoteEvent")then T(j2 .OnClientEvent:Connect(zW))elseif gD~="CrateUpdate"and gD~="GiftReceived"then C("remote "..gD.." missing")end
end end local function j3()local ck=ce()if ck then if aN(ck.name)then return{state="match",shown=ck.pretty,src="pad",info=ck}
end return{state="skip",info=ck,level="idle",text=("on pad: %s [%s] - not ticked"):format(ck.pretty,tostring(ck.rar))}
end if V.name and(z()-V.at)<4 then if aN(V.name)then return{state="match",shown=al(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(al(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gE(zX,zY,zZ,z0)
local gF=RaycastParams.new()gF.FilterType=Enum.RaycastFilterType.Exclude local j4={J.Character}for I4,z1 in ipairs(z0 or{})do j4[#j4+1]=z1 end
gF.FilterDescendantsInstances=j4 pcall(function()gF.RespectCanCollide=true end)local qi=ai:Raycast(Vector3 .new(zX,zY+4,zZ),Vector3 .new(0,-30,0),gF)
return qi and qi.Position or nil end local function c6(qj)local qk=qj:FindFirstChildOfClass("Humanoid")return((qk and qk.HipHeight)or 2)+qj.HumanoidRootPart.Size.Y/2+0.2
end local function j5(z2,z3)local j6=z2:FindFirstChildOfClass("Humanoid")local z4=z()while z()-z4<z3 do if j6 and(j6 .FloorMaterial~=Enum.Material.Air or j6 .SeatPart)then return true end
ag(0.05)end return false end local function aC(z5,j7,j8)local ql=z5 .HumanoidRootPart ql.AssemblyLinearVelocity=Vector3 .new(0,0,0)
ql.CFrame=j8 and CFrame.new(j7,Vector3 .new(j8 .X,j7 .Y,j8 .Z))or CFrame.new(j7)end local function cl(bj,qm)local cm=aq()
if not cm or not bj then return false end local bE=bj.Position local gG=math.clamp(math.max(bj.Size.X,bj.Size.Z)/2+2.2,3,7)
local qo=(qm and qm.MaxActivationDistance)or 10 if gG>qo-2 then gG=math.max(2.5,qo-2)end local d9={}local function cn(d_)
d_=Vector3 .new(d_.X,0,d_.Z)if d_.Magnitude>0.05 then d9[#d9+1]=d_.Unit end end local qp=o1()if qp then cn(qp-bE)end
cn(bj.CFrame.LookVector)cn(-bj.CFrame.LookVector)cn(bj.CFrame.RightVector)cn(-bj.CFrame.RightVector)cn(cm.HumanoidRootPart.Position-bE)
if#d9==0 then cn(Vector3 .new(0,0,1))end local z6,gH=c6(cm),false for I5,z7 in ipairs(d9)do local gI=bE+z7*gG
local j9=gE(gI.X,bE.Y,gI.Z,{bj})if j9 and math.abs(j9 .Y-bE.Y)<14 then aC(cm,Vector3 .new(gI.X,j9 .Y+z6,gI.Z),bE)
if j5(cm,0.7)then gH=true break end end end if not gH then aC(cm,bE+d9[1]*gG+Vector3 .new(0,3,0),bE)gH=j5(cm,1)
end ag(0.12)return gH end local function qq(ea)if not ea.Parent or not ea.Enabled then return false end pcall(function()ea:InputHoldBegin()end)
ag(math.max(ea.HoldDuration,0)+0.08)pcall(function()ea:InputHoldEnd()end)return true end local function ao(qr,z8)
local z9=z()while z()-z9<z8 do if qr()then return true end ag(0.05)end return qr()end local function eb(c7,z_,qs,Aa)
local Ab=c.zapFirst and{"zap","hold"}or{"hold","zap"}for Ac,j_ in ipairs(Ab)do if Ac==2 and(Aa or not(c7 .Parent and c7 .Enabled and(not qs or qs())))then break end
local ka if j_=="hold"then ka=qq(c7)else ka=type(fireproximityprompt)=="function"and c7 .Parent~=nil and c7 .Enabled and pcall(fireproximityprompt,c7)end
if ka and ao(z_,1.2)then c.zapFirst=(j_=="zap")return true,j_ end end return false end local function qt(kb)local bF=pb()
if not bF or not bF.Enabled then C("buy: nothing on the pad")return false end local kc=dU(bF)if not kc then C("buy: pad part missing")return false end
c.lastBuyAt=z()local Ad,qu=V.seq,be()local qv=aq()local Ae=qv and(qv.HumanoidRootPart.Position-kc.Position).Magnitude>12
cl(kc,bF)if Ae then ag(0.4)end if not bF.Enabled then C("buy aborted: pad emptied")return false end local c8=j3()
if not kb and c8 .state~="match"then C("buy aborted: "..(c8 .text or"pad changed"))c.matchSince=nil return false
end local kd=c8 .info and c8 .info.name or(c8 .state=="match"and V.name)or nil local function Af()return bF.Enabled and ac()==nil and(kb or j3().state=="match")
end local Ag,Ah=eb(bF,function()return ac()~=nil or((not bF.Enabled)and(kb or V.seq==Ad))end,Af,d8()~=nil)if Ag then
ao(function()return ac()~=nil end,0.8)local ec=ac()local qw=be()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,z()C(("BOUGHT %s%s via %s"):format(ec and al(W(ec))or(c8 .shown or"?"),(qu and qw)and(" for $"..aE(qu-qw))or"",Ah))
if ec and kd and W(ec)~=W(kd)then C(("note: picked up %s, not %s"):format(ec,kd))end return true end local gJ=ce()
if d8()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)C(("BUY REFUSED: cash short - have $%s, price %s"):format(aE(be()),(gJ and gJ.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)C(("buy did not go through (%s, try %d) - again in %ds"):format(gJ and gJ.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qx()local ed=ac()if not ed then c.holding=false C("place: hands are empty")
return false end if not aN(ed)then C(("REFUSED TO WAX %s - it is not ticked"):format(al(W(ed))))return false end
for I6=1,e.PlaceTries do local bG=yn()if not bG then C("place: no free station")break end local qy=dU(bG)if qy then
cl(qy,bG)local qz=ac()if not qz then c.holding=false C("place: hands emptied on the way")return false end if not aN(qz)then C("place: what I carry changed, not waxing it")return false end
if bG.Enabled then local Ai,Aj=eb(bG,function()return not bG.Enabled end,function()return bG.Enabled end)if Ai then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 V.name,V.rar,V.at=nil,nil,z()
C(("WAXED %s #%d at %s via %s"):format(al(W(ed)),c.placed,bG.Parent.Parent.Name,Aj))if q.placed then pcall(q.placed,ed)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end C("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))C(c.capMsg)end return false end function A.place()local Ak=z()while c.alive and A.editing and z()-Ak<25 do ag(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local Al=z()while c.alive and A.current()~=e.TeamWax and z()-Al<5 do ag(0.1)end
if A.current()==e.TeamWax then ag(0.3)else C("wax team did not come on in time - placing anyway")end end local Am,qA=pcall(qx)
A.placing=false if not Am then error(qA,0)end return qA end local function qB(qC)return type(qC)=="string"and qC:lower():find("crate",1,true)~=nil
end local An={SABFarmGui=1,SABToggle=1,SABError=1}local function ke(Ao)local bH=Ao while bH do if An[bH.Name]then return false end
if bH:IsA("ScreenGui")then local Ap,Aq=pcall(function()return bH.Enabled end)return(not Ap)or Aq~=false end if bH:IsA("GuiObject")and not bH.Visible then return false end
bH=bH.Parent end return false end local function gK(gL)local c9=""pcall(function()if gL:IsA("TextButton")then c9=gL.Text end end)
if not c9:find("%a")then for I7,gM in ipairs(gL:GetDescendants())do if(gM:IsA("TextLabel")or gM:IsA("TextButton"))and gM.Text:find("%a")then c9=gM.Text break end
end end if not c9:find("%a")then c9=gL.Name end return(c9:lower():gsub("[^%a]",""))end local function Ar()local ee,ef
local qD=J:FindFirstChildOfClass("PlayerGui")if not qD then return nil,nil end for I8,eg in ipairs(qD:GetDescendants())do
if eg:IsA("GuiButton")and ke(eg)then local kf=gK(eg)if kf:sub(1,4)=="open"and not kf:find("shop",1,true)then ee=ee or eg end
if kf:sub(1,7)=="discard"then ef=ef or eg end end end if ee and ef then return ee,ef end if j.on then return ee,ef end
return nil,nil end local kg=(function()local As,At=pcall(function()return game:GetService("VirtualInputManager")end)return As and At or nil end)()
local function qE(bk,kh)local ki={}local function qF(Au)ki[#ki+1]=Au end if c.tapWay then qF(c.tapWay)end for I9,qG in ipairs({"touch","conn","signal"})do
if qG~=c.tapWay then qF(qG)end end local function qH(Av,...)local Aw,kj=pcall(getconnections,Av)if not(Aw and type(kj)=="table"and#kj>0)then return false end
local qI,Ax,Ay=false,{...},select("#",...)for I_,Az in ipairs(kj)do if pcall(function()Az:Fire(table.unpack(Ax,1,Ay))end)then qI=true end
end return qI end local function qJ()local qK=Vector3 .new(0,0,0)pcall(function()local qL,qM=bk.AbsolutePosition,bk.AbsoluteSize
qK=Vector3 .new(qL.X+qM.X/2,qL.Y+qM.Y/2,0)end)local kk={Position=qK,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kk.UserInputType=Enum.UserInputType.Touch end)pcall(function()kk.UserInputState=Enum.UserInputState.End end)
return kk end for Ja,bl in ipairs(ki)do local eh=false if bl=="conn"and type(getconnections)=="function"then if qH(bk.MouseButton1Click)then
eh=true if ao(kh,1.5)then c.tapWay=bl return true,bl end end eh=qH(bk.Activated,qJ(),1)elseif bl=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bk.MouseButton1Click)then if ao(kh,1.5)then c.tapWay=bl return true,bl end end eh=pcall(firesignal,bk.Activated,qJ(),1)
elseif bl=="touch"and kg then eh=pcall(function()local qN,qO=bk.AbsolutePosition,bk.AbsoluteSize local qP=0 local qQ=bk:FindFirstAncestorWhichIsA("ScreenGui")
local AA,AB=pcall(function()return qQ and qQ.IgnoreGuiInset end)if not(AA and AB)then pcall(function()qP=game:GetService("GuiService"):GetGuiInset().Y end)
end local qR,qS=qN.X+qO.X/2,qN.Y+qO.Y/2+qP kg:SendMouseButtonEvent(qR,qS,0,true,game,1)task.wait(0.06)kg:SendMouseButtonEvent(qR,qS,0,false,game,1)
end)end if eh and ao(kh,1.5)then c.tapWay=bl return true,bl end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kl(qT)local ei=qT.Parent while ei and ei~=c.plot do if j.NOT[ei.Name]then return false end ei=ei.Parent
end local km=(qT.ActionText or""):lower()if km:find("roll",1,true)or km:find("place",1,true)or km:find("sell",1,true)then return false end
return true end local function qU()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local qV=c.plot:FindFirstChild("CrateStand")local ej if qV then for Jb,gN in ipairs(qV:GetDescendants())do
if gN:IsA("ProximityPrompt")and gN.Enabled and kl(gN)then ej=gN break end end end if not ej then for Jc,bI in ipairs(c.plot:GetDescendants())do
if bI:IsA("ProximityPrompt")and bI.Enabled and kl(bI)then local qW=bI:FindFirstAncestorWhichIsA("Model")local AC=((bI.ActionText or"").." "..(bI.ObjectText or"").." "..bI.Name.." "..(qW and qW.Name or"")):lower()
if AC:find("crate",1,true)then ej=bI break end end end end j.prompt=ej return ej end local function kn()if j.on then return true end
local ek=qU()if not ek then j.summonFails=j.summonFails+1 j.lastFail=z()C("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local qX=dU(ek)if qX then cl(qX,ek)end j.ours=true eb(ek,function()return j.on end)if ao(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()C("crate: pressed "..f1(ek).." but no window came up")
return false end do local function AD(qY)local c_=qY.Parent while c_ and c_:IsA("GuiObject")do local qZ,q0=false,false
for Jd,el in ipairs(c_:GetDescendants())do if el~=qY and el:IsA("GuiButton")and gK(el):sub(1,7)=="discard"then qZ=true end
if el:IsA("TextLabel")then local ko=el.Text:lower()if ko:find("crate",1,true)or ko:find("can contain",1,true)or ko:find("cost",1,true)then q0=true end
end if qZ and q0 then return c_ end end c_=c_.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local q1=J:FindFirstChildOfClass("PlayerGui")if not q1 then return nil end for Je,gO in ipairs(q1:GetDescendants())do
if gO:IsA("GuiButton")and not gO:FindFirstAncestor("SABFarmGui")and gK(gO):sub(1,4)=="open"then local kp=AD(gO)
if kp then j.win=kp return kp end end end end local function AE(AF)for Jf,gP in ipairs(AF:GetDescendants())do
if gP:IsA("GuiButton")then local q2,kq=gK(gP),gP.Name:lower()if q2=="x"or q2=="close"or kq=="x"or kq:find("close",1,true)or kq:find("exit",1,true)then return gP end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(AG)task.wait(AG and 4 or 1.2)if j.on or j.waiting then return end
local gQ=j.findWin()if not gQ or not ke(gQ)then return end local q3=AE(gQ)if q3 and qE(q3,function()return not ke(gQ)end)then return end
C("the crate window is still open - tap its X")end end local function em(gR)if not kn()then return false end local q4=z()-(j.openedAt or 0)
if q4<0.6 then ag(0.6-q4)end local kr=j.title local AH,AI=Ar()local q5=gR and AH or AI if not q5 then j.lastFail=z()
c.crateFails=c.crateFails+1 C(("crate: no %s button found in %s"):format(gR and"Open"or"Discard",kr))return false
end local AJ=ac()local AK,Jg=qE(q5,function()return(not j.on)or(ac()~=nil and ac()~=AJ)end)if not AK then j.lastFail=z()
c.crateFails=c.crateFails+1 C("crate: could not press "..(gR and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gR then c.crates=c.crates+1 ao(function()return ac()~=nil end,1.5)local q6=ac()
C(("OPENED %s -> %s"):format(kr,q6 and al(W(q6))or"?"))else C("discarded "..kr.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(AL,...)local AM=select("#",...)j.calls[#j.calls+1]={t=z(),m=AL,n=AM,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aH,bm)local bJ=type(aH)if(bJ=="string"or bJ=="number")and type(bm.data)=="table"then for q7,ks in pairs(bm.data)do
if ks==aH and type(q7)=="string"and(type(ks)=="string"or type(ks)=="number")then return{__slot="f:"..q7}end end
end if bJ=="string"then if bm.crate and aH==bm.crate then return{__slot="crate"}end if bm.title and aH==bm.title then return{__slot="title"}end
if bm.rar and aH==bm.rar then return{__slot="rarity"}end return aH end if bJ=="number"or bJ=="boolean"or bJ=="nil"then return aH end
if bJ=="table"then local q8={}for AN,q9 in pairs(aH)do if type(q9)=="table"then return nil,"nested table"end local AO,q_=j.slot(q9,bm)
if q_ then return nil,q_ end q8[AN]=AO end return q8 end local AP,AQ=pcall(function()return aH:IsA("Instance")end)
if AP and AQ then if aH==J then return{__slot="player"}end if c.plot and aH==c.plot then return{__slot="plot"}end
local gS=c.plot and c.plot:FindFirstChild("CrateStand")if gS and aH==gS then return{__slot="stand"}end if gS and aH.Parent==gS then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bJ..")"end function j.resolve(gT)if type(gT)~="table"then return gT end
local aU=gT.__slot if aU and aU:sub(1,2)=="f:"then return j.data and j.data[aU:sub(3)]end if aU=="crate"then return j.data and j.data.name end
if aU=="title"then return(j.data and j.data.title)or j.title end if aU=="rarity"then return j.data and j.data.rarity end
if aU=="player"then return J end if aU=="plot"then return c.plot end if aU=="stand"or aU=="model"then local kt=c.plot and c.plot:FindFirstChild("CrateStand")
if aU=="stand"or not kt then return kt end for Jh,ra in ipairs(kt:GetChildren())do if qB(ra.Name)then return ra end end
return nil end local rb={}for AS,AT in pairs(gT)do rb[AS]=j.resolve(AT)end return rb end function j.classify(ku)
if j.directOff then return end local gU={}for Ji,kv in ipairs(j.calls)do if kv.t<=ku+0.05 and ku-kv.t<=6 then gU[#gU+1]=kv end
end if#gU==0 then return end if not ao(function()return(j.heldAt or 0)>=ku-1 end,2.5)then return end local en={}
for Jj,eo in ipairs(gU)do local rc={}for rd=1,eo.n do local AU,rf=j.slot(eo.args[rd],eo)if rf then C("crate call has "..rf.." - keeping the button method")
return end rc[rd]=AU end en[#en+1]={m=eo.m,n=eo.n,args=rc}end local kw=j.learned j.learned={seq=en,mode=kw and kw.mode or nil}
ak.dirty=true if not kw then C(("learned how to open crates directly (%d call%s)"):format(#en,#en==1 and""or"s"))end
end function j.replay()local rg=j.learned local rh=af:FindFirstChild("Remotes")local kx=rh and rh:FindFirstChild("CrateAction")
if not(rg and kx)then return false end local ri=table.unpack or unpack j.replaying=true for Jk,ep in ipairs(rg.seq)do
local ky={}for rj=1,ep.n do ky[rj]=j.resolve(ep.args[rj])end task.spawn(function()pcall(function()if ep.m=="InvokeServer"then kx:InvokeServer(ri(ky,1,ep.n))
else kx:FireServer(ri(ky,1,ep.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(AV)return(AV:gsub("[%%|;=,\n]",function(AW)return("%%%02X"):format(AW:byte())end))end
function j.enc(co)local gV=type(co)if gV=="string"then return"s"..j.esc(co)end if gV=="number"then return"n"..tostring(co)end
if gV=="boolean"then return co and"b1"or"b0"end if gV=="nil"then return"z"end if co.__slot then return"k"..co.__slot end
local kz={}for AX,AY in pairs(co)do kz[#kz+1]=j.enc(AX).."="..j.enc(AY)end return"t"..table.concat(kz,",")end
function j.dec(rk)local eq,er=rk:sub(1,1),rk:sub(2)local function AZ(A0)return(A0:gsub("%%(%x%x)",function(A1)return string.char(tonumber(A1,16))end))end
if eq=="s"then return AZ(er)end if eq=="n"then return tonumber(er)end if eq=="b"then return er=="1"end if eq=="k"then return{__slot=er}end
if eq=="t"then local rl={}for A2 in er:gmatch("[^,]+")do local rm,A3=A2:match("^(.-)=(.*)$")if rm then local rn=j.dec(rm)
if rn~=nil then rl[rn]=j.dec(A3)end end end return rl end return nil end function j.goneOrNew(A4)return function()
if not j.waiting then return true end local ro=ac()return ro~=nil and ro~=A4 end end function j.near()local rp=af:FindFirstChild("Remotes")
local kA=rp and rp:FindFirstChild("CrateAction")local gW=aq()local kB=c.plot and c.plot:FindFirstChild("CrateStand")
local kC=kB and kB:FindFirstChild("Spot")if not(kA and gW and kC)then C(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kA and"no CrateAction remote"or not gW and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kD=gW.HumanoidRootPart local gX=kD.CFrame local rq,kE=j.title,"no answer"local A5=ac()local rr=kB:FindFirstChild("Holder")
local function rs()if not rr then return j.waiting or j.on end for Jl,A6 in ipairs(rr:GetChildren())do if A6:IsA("Model")then return true end end
return false end for A7=1,3 do if not(j.waiting or j.on)or not rs()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kD.Position-kC.Position).Magnitude>8 then cl(kC,j.prompt)end ag(0.12+0.15*A7)
local a7={}j.replaying=true task.spawn(function()a7 .ok,a7 .v=pcall(function()return kA:InvokeServer("open")end)
a7 .done=true end)ao(function()return a7 .done end,6)j.replaying=false local cp=a7 .v if a7 .done and a7 .ok and type(cp)=="table"and cp.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 C(("OPENED %s -> %s (no window)"):format(rq,cp.prize and al(W(tostring(cp.prize)))or"?"))
ao(function()local rt=ac()return rt~=nil and rt~=A5 end,1.5)if(kD.Position-gX.Position).Magnitude>8 then pcall(function()aC(gW,gX.Position,gX.Position+gX.LookVector)end)end
return true,"opened"end kE=(a7 .done and a7 .ok and type(cp)=="table")and tostring(cp.reason or"refused, no reason given")
or(a7 .done and("error: "..tostring(cp))or"no answer in 6s")ag(0.3)if not rs()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 C(("crate: the server would not open %s next to the stand (%s)"):format(rq,kE))
return false,kE end j.GIVEUP=600 function j.drop()local ru=af:FindFirstChild("Remotes")local rv=ru and ru:FindFirstChild("CrateAction")
local rw=c.plot and c.plot:FindFirstChild("CrateStand")local kF=rw and rw:FindFirstChild("Spot")local rx=aq()
if kF and rx and(rx.HumanoidRootPart.Position-kF.Position).Magnitude>8 then cl(kF,j.prompt)ag(0.3)end local kG,bn=false,nil
if rv then kG,bn=pcall(function()return rv:InvokeServer("discard")end)end C(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(kG and type(bn)=="table"and bn.ok)and"done"or("answer: "..tostring(type(bn)=="table"and(bn.reason or bn.ok)or bn))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(kG and type(bn)=="table"and bn.ok)then em(false)end end function j.smart()local kH=j.title if(j.nearFails or 0)<3 then
local A8=j.near()if A8 then return true end if j.nearFails>=3 then C("opening next to the stand failed 3 times - trying the older ways")end
end local cq=j.learned if cq then local kI=ac()if j.on then j.replay()if ao(j.goneOrNew(kI),3.5)then c.crates=c.crates+1
C("OPENED "..kH.." (direct)")return true end else if cq.mode~="window"then j.replay()if ao(j.goneOrNew(kI),3.5)then
c.crates,j.fails=c.crates+1,0 if cq.mode~="direct"then cq.mode,ak.dirty="direct",true C("crates now open directly - the window never comes up")
end C("OPENED "..kH.." (direct, no window)")return true end end if kn()then j.replay()if ao(j.goneOrNew(kI),3.5)then
c.crates,j.fails=c.crates+1,0 if cq.mode~="window"then cq.mode,ak.dirty="window",true C("crates need their window up first - it shows briefly")
end C("OPENED "..kH.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,ak.dirty=cq,nil,true
if j.fails>=3 then j.directOff=true C("direct crate opening failed 3 times - using the button for now")else C("the learned crate call did not work - back to pressing Open")
end end return em(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for A9,ry in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(ry):Connect(function()D.cache[A9]=J:GetAttribute(ry)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(A_,...)local gY=D.cache
local Ba={m=A_,n=select("#",...),args={...},before={rules=gY.rules,stop=gY.stop,on=gY.on,main=gY.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,Ba)end end)end function D.learnOne(es)local aA,et=D.snap(),es.before local gZ=(aA.rules~=et.rules)or(aA.stop~=et.stop)
local rz=(aA.on~=et.on)or(aA.main~=et.main)if not gZ and not rz then return end local rA={}for rB=1,es.n do local aO=es.args[rB]
local cr=type(aO)if cr=="string"and aO~=""and aO==aA.rules then aO={__slot="rules"}elseif cr=="string"and aO~=""and gZ and aO==aA.stop and aA.stop~=et.stop then aO={__slot="stop"}
elseif cr=="table"then local rC={}for Bb,da in pairs(aO)do if type(da)=="table"or(type(da)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end rC[Bb]=(type(da)=="string"and da~=""and da==aA.rules)and{__slot="rules"}or da end aO=rC elseif cr~="string"and cr~="number"and cr~="boolean"and cr~="nil"then
if aO==J then aO={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end rA[rB]=aO
end local db={m=es.m,n=es.n,args=rA}if gZ then local kJ=false for Bc=1,db.n do local eu=db.args[Bc]if type(eu)=="table"and eu.__slot=="rules"then kJ=true end
if type(eu)=="table"and not eu.__slot then for Jm,rD in pairs(eu)do if type(rD)=="table"and rD.__slot=="rules"then kJ=true end end
end end if kJ then D.rec.rules={db}else table.insert(D.rec.rules,db)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if rz then if aA.on==true then D.rec.on=db else D.rec.off=db end e.AutoRoll=(aA.on==true)end if aA.rules and aA.rules~=""then e.ARrules,e.ARstop=aA.rules,aA.stop or""end
ak.dirty=true D.msg=""C(("learned an Auto Roll %s message"):format(gZ and"choices"or(aA.on and"on"or"off")))end
function D.resolve(dc)if type(dc)~="table"then return dc end if dc.__slot=="rules"then return e.ARrules~=""and e.ARrules or J:GetAttribute("AutoRollRules")end
if dc.__slot=="stop"then return e.ARstop~=""and e.ARstop or J:GetAttribute("AutoRollStop")end if dc.__slot=="player"then return J end
local rE={}for Bd,Be in pairs(dc)do rE[Bd]=D.resolve(Be)end return rE end function D.replay(rF,Bf)local rG=table.unpack or unpack
for Jn,ev in ipairs(Bf)do local kK={}for rH=1,ev.n do kK[rH]=D.resolve(ev.args[rH])end D.replaying=true pcall(function()
if ev.m=="InvokeServer"then task.spawn(function()pcall(function()rF:InvokeServer(rG(kK,1,ev.n))end)end)else rF:FireServer(rG(kK,1,ev.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(rI,Bg)if D.busy or not c.alive then return end D.busy=true
pcall(function()local rJ=af:FindFirstChild("Remotes")local kL=rJ and rJ:FindFirstChild("AutoRollAction")if not kL then D.msg="this game has no AutoRollAction"return end
local bK=e.AutoRoll if bK and e.ARrules~=""and J:GetAttribute("AutoRollRules")~=e.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"C(D.msg)else D.replay(kL,D.rec.rules)
if ao(function()return J:GetAttribute("AutoRollRules")==e.ARrules end,4)then C("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"C(D.msg)end end end if bK==D.isOn()or(not bK and not Bg)then return end
local g0=bK and D.rec.on or D.rec.off if not g0 then local ew=bK and D.rec.off or D.rec.on local rK=ew~=nil for Bh=1,ew and ew.n or 0 do
if type(ew.args[Bh])=="boolean"then rK=false end end if rK then g0=ew end end if not g0 then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bK and"on"or"off")
C(D.msg)return end D.replay(kL,{g0})if ao(function()return D.isOn()==bK end,4)then D.msg=""C(("Auto Roll switched %s%s"):format(bK and"ON"or"OFF",rI and(" ("..rI..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"C(D.msg)end end)D.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local Bi,Bj=pcall(function()return J.UserId end)return Bi and Bj or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local Bk,kM=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if Bk and type(kM)=="table"and type(kM.Pets)=="table"then o.I=kM end return o.I end function o.order()if o.list then return o.list end
local bL=o.info()if not bL then return{}end local cs={}if type(bL.Order)=="table"and#bL.Order>0 then for Jo,rL in ipairs(bL.Order)do if bL.Pets[rL]then cs[#cs+1]=rL end end
else for Bl in pairs(bL.Pets)do cs[#cs+1]=Bl end table.sort(cs,function(Bm,Bn)return(bL.Pets[Bm].price or 0)<(bL.Pets[Bn].price or 0)end)
end o.list=cs return cs end function o.nice(rM,kN)local rN=o.info()local rO=rN and rN.Pets[rM]return((kN and kN~="")and(kN.." ")or"")..(rO and rO.displayName or tostring(rM))
end function o.data()local g1=J:GetAttribute("PetsData")if type(g1)~="string"then return nil end if g1==o.rawD then return o.lastD end
local Bo,ex=pcall(function()return o.HS:JSONDecode(g1)end)ex=(Bo and type(ex)=="table")and ex or nil o.rawD,o.lastD=g1,ex
return ex end function o.pen()return af:FindFirstChild("PetMeadowSpawns")end function o.srv()return ai:GetServerTimeNow()end
function o.money()local kO=J:FindFirstChild("MoneyValue")if kO and type(kO.Value)=="number"then return kO.Value end
return be()or 0 end function o.wishes()local rP=o.pen()local rQ=rP and rP:GetAttribute("Wishes")local kP,rR={},o.srv()
if type(rQ)~="string"then return kP end local Bp,rS=pcall(function()return o.HS:JSONDecode(rQ)end)if Bp and type(rS)=="table"then
for Bq,kQ in pairs(rS)do if type(kQ)=="number"and kQ>rR then kP[Bq]=kQ-rR end end end return kP end function o.call(...)
local rT=af:FindFirstChild("Remotes")local rU=rT and rT:FindFirstChild("PetRequest")if not rU then return nil end
local rV=table.pack(...)local ct={}task.spawn(function()ct.ok,ct.v=pcall(function()return rU:InvokeServer(table.unpack(rV,1,rV.n))end)
ct.done=true end)local Br=z()while not ct.done and z()-Br<6 do task.wait(0.05)end if ct.done and ct.ok then return ct.v end
return nil end function o.want(Bs)return e.Pets[Bs]end function o.closeNaming(kR)local rX=pcall(function()local rW=J:FindFirstChild("PlayerScripts")
local Bt=rW and rW:FindFirstChild("Naming",true)require(Bt).close()end)ag(0.5)if kR.Visible then pcall(function()local rY=kR:FindFirstChild("NameBox",true)if rY then rY:ReleaseFocus()end end)
kR.Visible=false rX=false end return rX end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local rZ=J:FindFirstChildOfClass("PlayerGui")
local r0=rZ and rZ:FindFirstChild("MainGui")local g2=r0 and r0:FindFirstChild("PetNameGui")if g2 and g2 .Visible then
ag(0.4)if g2 .Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,g2)break end end ag(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local kS,r1,g3=o.info(),o.pen(),o.data()
if not(kS and r1 and g3)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local ey,kT=#(g3 .pets or{}),tonumber(g3 .maxOwned)or 60
local Bu,r2,ez=o.srv(),{},nil for Jp,aV in ipairs(r1:GetChildren())do r2[aV.Name]=true local cu,g4=aV:GetAttribute("Pet"),aV:GetAttribute("Variant")or""
local kU=cu and o.want(cu)if kU and kU.b and kS.Pets[cu]and(not kU.g or g4=="Big")and y.wantMore(cu,g4,g3)and not aV:GetAttribute("A_"..o.uid)
and(tonumber(aV:GetAttribute("ExpiresAt"))or 0)>Bu+1 and z()>=(o.tryAt[aV.Name]or 0)then local eA,r3=o.nice(cu,g4),kS.Pets[cu].price or 0
if ey>=kT then ez=("%s is in the pen, but you have %d/%d pets"):format(eA,ey,kT)o.tryAt[aV.Name]=z()+15 elseif o.money()<r3 then
ez=("%s is in the pen - need $%s"):format(eA,aE(r3))o.tryAt[aV.Name]=z()+5 else o.tryAt[aV.Name]=z()+8 local bM=o.call("adopt",aV.Name)
if type(bM)=="table"and bM.ok then ey=ey+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local Bv=type(bM.pet)=="table"and bM.pet or{}
table.insert(o.recent,{id=tostring(Bv.id or("?"..z())),name=cu,variant=g4,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
C("ADOPTED "..eA)o.skipNaming()ez="adopted "..eA else local r4=type(bM)=="table"and tostring(bM.reason or"no reason given")or"no answer"
C(("adopt %s failed: %s"):format(eA,r4))ez="adopt failed: "..r4 if type(bM)=="table"and bM.bagFull then o.tryAt[aV.Name]=z()+60 end
end end end end for r5 in pairs(o.tryAt)do if not r2[r5]then o.tryAt[r5]=nil end end o.buyMsg=ez or("watching the pen (%d/%d pets)"):format(ey,kT)
end function o.stacks()local r6=o.pen()local Bw=r6 and r6:GetAttribute("WishStacks")local Bx,r7=pcall(function()return o.HS:JSONDecode(Bw)end)
return(Bx and type(r7)=="table")and r7 or{}end function o.stackTick(By,Bz)local g5=o.info()local r8=(type(g5 .Wish)=="table"and tonumber(g5 .Wish.maxStacks))or 1
if r8<=1 then return end local BA=o.stacks()o.stackTry=o.stackTry or{}for Jq,aW in ipairs(o.order())do local r9=o.want(aW)
local g6=tonumber(BA[aW])or 1 if r9 and r9 .w and By[aW]and g6<r8 and y.wantMore(aW,"",Bz)and z()>=(o.stackTry[aW]or 0)then
local BB,g7=pcall(g5 .wishPrice,aW,g6+1)g7=BB and tonumber(g7)or((g5 .Pets[aW].price or 0)*2*3^g6)o.stackTry[aW]=z()+5
if g7<=o.money()*0.01 then local r_=o.call("wish",aW)if type(r_)=="table"and r_.ok then o.wishN=o.wishN+1 C(("WISH x%d on %s ($%s)"):format(g6+1,o.nice(aW),aE(g7)))
else o.stackTry[aW]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local g8=o.info()if not(g8 and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bN,kV,bO=o.wishes(),0,nil local BC=(type(g8 .Wish)=="table"and g8 .Wish.cashShare)or 2 local sa=o.data()
for Jr,aD in ipairs(o.order())do local sb=o.want(aD)if sb and sb.w and y.wantMore(aD,"",sa)then kV=kV+1 if not bN[aD]and z()>=(o.wishTry[aD]or 0)then
local kW=tonumber(J:GetAttribute("PetWishCredits"))or 0 local kX=math.floor((g8 .Pets[aD].price or 0)*BC)if kW<=0 and o.money()<kX then
o.wishTry[aD]=z()+10 bO=("need $%s to wish for %s"):format(aE(kX),o.nice(aD))o.wishWhy[aD]=bO else o.wishTry[aD]=z()+3
local BD=kW>0 and"wishCredit"or"wish"local g9=o.call(BD,aD)if type(g9)=="table"and g9 .ok then o.wishN,o.wishWhy[aD]=o.wishN+1,nil
C(("WISHED for %s (%s)"):format(o.nice(aD),kW>0 and"free wish"or("$"..aE(kX))))else local kY=type(g9)=="table"and tostring(g9 .reason or"no reason given")or"no answer"
if kY:lower():find("already",1,true)then o.wishTry[aD]=z()+2 else C(("wish %s failed: %s"):format(o.nice(aD),kY))bO="wish failed: "..kY end
end end end end end pcall(o.stackTick,bN,sa)if not bO then for Js,g_ in ipairs(o.order())do local sc=o.want(g_)
if sc and sc.w and not bN[g_]and o.wishWhy[g_]then bO=o.wishWhy[g_]break end end end if not bO then local dd={}
for Jt,eB in ipairs(o.order())do local sd=o.want(eB)local se=tonumber(o.stacks()[eB])or 1 if sd and sd.w and bN[eB]then dd[#dd+1]=("%s%s %dm"):format(o.nice(eB),se>1 and(" x"..se)or"",math.ceil(bN[eB]/60))end
end local ha for Ju,hb in ipairs(o.order())do local sf=o.want(hb)if sf and sf.w and bN[hb]and(not ha or bN[hb]<ha)then ha=bN[hb]end
end bO=kV==0 and"no pet has WISH ticked"or(#dd==0 and"running: none yet")or(#dd<=3 and("running: "..table.concat(dd,", ")))
or("%d running, the next one ends in %dm"):format(#dd,math.ceil((ha or 0)/60))end o.wishMsg=bO end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local kZ=o.data()return(kZ and kZ.teams)or{},kZ end function A.current(de)
de=de or o.data()if not de then return""end local sh={}for Jv,BE in ipairs(de.equipped or{})do sh[tostring(BE)]=true end
for Jw,sj in ipairs(de.teams or{})do local sk=sj.pets or{}local k0=#sk==#(de.equipped or{})if k0 then for Jx,BF in ipairs(sk)do if not sh[tostring(BF)]then k0=false break end end end
if k0 then return sj.name end end return""end function A.equip(k1)local BG,BH=A.teams()local k2 for BI,BJ in ipairs(BG)do if BJ.name==k1 then k2=BI break end end
if not k2 then A.msg="no saved team called "..tostring(k1)return false end if A.current(BH)==k1 then return true end
for Jy=1,4 do local sl=o.call("teamEquip",k2)if type(sl)=="table"and sl.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(BK)local sm=BK:FindFirstChild("SquishyPlaceHolder")local sn=sm and sm:FindFirstChild("TimerGui")
local so=sn and sn:FindFirstChildWhichIsA("TextLabel",true)local k3=so and so.Text if type(k3)~="string"or k3:find("-",1,true)then return nil end
local k4,sp,sq=k3:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not k4 then return nil end local sr=sq~=""and(tonumber(k4)*3600+tonumber(sp)*60+tonumber(sq))or(tonumber(k4)*60+tonumber(sp))
return sr>0 and sr or nil end function A.waxes()local eC={}local ss=c.plot and c.plot:FindFirstChild("WaxStations")
if not ss then return eC end local su=o.srv()for Jz,a8 in ipairs(ss:GetChildren())do local k5=tonumber(a8:GetAttribute("PourEnd"))
local sv=a8:GetAttribute("PourOwner")if a8:GetAttribute("HasSquishy")and a8:GetAttribute("PourId")and(sv==nil or sv==o.uid)then
local k6=A.left(a8)local sx=k6 and(su+k6)or((k5 and k5>su)and k5 or nil)if sx then local sy,sz=a8:FindFirstChild("SquishyPlaceHolder"),"?"
if sy then for JA,sA in ipairs(sy:GetChildren())do if sA:IsA("Model")then sz=sA.Name break end end end local BL=tostring(a8:GetAttribute("Helpers")or"")
local k7=0 for JB in BL:gmatch("%d+")do k7=k7+1 end eC[#eC+1]={st=a8,ends=sx,sure=k6~=nil,id=a8:GetAttribute("PourId"),name=sz,helps=k7,
long=a8:GetAttribute("PourLong")==true}end end end table.sort(eC,function(BM,BN)return BM.ends<BN.ends end)return eC
end function A.glazeCount()local sB=af:FindFirstChild("Remotes")local sC=sB and sB:FindFirstChild("EditStack")
if not sC then return nil end local BO,eD=pcall(function()return sC:InvokeServer("State",nil)end)if not(BO and type(eD)=="table"and type(eD.state)=="table")then return nil end
local k8,k9=0,{}for JC,hc in ipairs(eD.state.entries or{})do if hc.glaze and hc.glaze~=""then k8=k8+1 k9[hc.glaze]=(k9[hc.glaze]or 0)+1 end
end return k8,k9,#(eD.state.entries or{}),eD.state.capacity end function A.finishedOne(hd,sD)A.finished=A.finished+1
task.wait(2)local k_,BP,sE,BQ=A.glazeCount()if k_ and sD and k_>sD then A.glazed=A.glazed+1 local la={}for BR,BS in pairs(BP)do la[#la+1]=BR.." "..BS end
C(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(al(W(hd.name)),hd.st.Name,k_,table.concat(la,", ")))
else C(("wax done on station %s: %s, no glaze%s"):format(hd.st.Name,al(W(hd.name)),sE and(" (stack "..sE.."/"..tostring(BQ)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cv=o.srv()local aI=A.glazeFor if aI then local eE=aI.st local sF=eE.Parent and eE:GetAttribute("HasSquishy")and eE:GetAttribute("PourId")==aI.id
local sG=sF and A.left(eE)if sG then aI.ends=cv+sG end if not sF then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aI.id or"?"]then
A.done[aI.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aI.id or"?"]=true},1 end local BT=aI.before
task.spawn(function()pcall(A.finishedOne,aI,BT)end)end elseif aI.ends-cv>e.GlazeLead*3+60 or cv>aI.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aI.id or"?"]=z()+120 C(("station %s is not finishing yet (%s left) - glaze team off again"):format(eE.Name,A.clock(aI.ends-cv)))
end end if e.TeamGlaze~=""and not A.glazeFor then local BU=A.speedRatio(e.TeamGlaze)for JD,cw in ipairs(A.list)do
if cw.sure and(cw.ends-cv)*BU[cw.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cw.id or"?"]or 0)and not A.done[cw.id or"?"]then
A.glazeFor=cw task.spawn(function()cw.before=A.glazeCount()end)break end end end local aJ,eF="",""local df=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cv)
if df and df<-8 then q.snapAt,df=nil,nil end if e.TeamGlaze~=""and df and df<=20 then aJ,eF=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(df)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aJ,eF=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aJ,eF=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aJ,eF=e.TeamFull," - every station is busy"else aJ=e.TeamNormal end A.want=aJ local eG=A.current()A.cur=eG if aJ~=""and eG~=aJ and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aJ)then C("team: "..aJ..eF)else A.nextTry=z()+3 end end local lb=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eG~=""and eG or"(not a saved team)",(aJ~=""and aJ~=eG)and(" -> "..aJ)or"",
lb and("in "..A.clock(lb.ends-cv).." (st "..lb.st.Name..")")or"- none running")end function A.clock(bP)bP=math.max(0,math.floor(bP))
if bP>=3600 then return("%d:%02d:%02d"):format(math.floor(bP/3600),math.floor((bP%3600)/60),bP%60)end return("%d:%02d"):format(math.floor(bP/60),bP%60)
end function A.allBusy()local BV,BW=f3()return BW>0 and BV==0 end function A.aboutToPlace()if not c.running then return false end
local sH=ac()if not(sH and aN(sH))then return false end local BX=f3()return BX>0 end function A.mult(sI,BY,sJ)return{(1+sI)*(1+sJ),(1+sI+BY)*(1+sJ)}end
function A.speedNow()local function lc(BZ)return tonumber(J:GetAttribute(BZ))or 0 end return A.mult(lc("PetWaxSpeed"),lc("PetLongWax"),lc("PetSocialWax"))
end function A.speedOf(B0)local B1,sK=A.teams()if not sK then return nil end for JE,sL in ipairs(B1)do if sL.name==B0 then
local ld={}for JF,B2 in ipairs(sL.pets or{})do for JG,sM in ipairs(sK.pets or{})do if tostring(sM.id)==tostring(B2)then ld[#ld+1]=sM break end end
end local sN=y.caps()local sO,B3=y.stats(ld)return A.mult(math.min(sO.waxSpeed or 0,sN.waxSpeed or 0.25),math.min(sO.longWax or 0,sN.longWax or 0.3),B3 .socialWax or 0)
end end return nil end function A.speedRatio(B4)local sP,le=A.speedNow(),A.speedOf(B4)if not le then return{1,1}end
return{sP[1]/le[1],sP[2]/le[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(B5)local lf=o.info()if lf and type(lf.fuseNeed)=="function"then local B6,lg=pcall(lf.fuseNeed,J,B5 or"")
if B6 and tonumber(lg)and tonumber(lg)>=2 then return tonumber(lg)end end if J:GetAttribute("FusePass")==true or J:GetAttribute("FusePass4")==true then return 3 end
if J:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(sQ)
if sQ=="Huge"then return y.needFor("")*y.needFor("Big")end if sQ=="Big"then return y.needFor("")end return 1 end
function y.nextOf(sR)return(sR==""and"Big")or(sR=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lh=o.info()return(lh and type(lh.HugeCaps)=="table")and lh.HugeCaps or y.HCAPS end function y.cosmic()local li=o.info()return(li and type(li.CosmicCaps)=="table")and li.CosmicCaps or{StarWhale=0.1}end
function y.slots()local sS=o.data()return tonumber(sS and sS.slots)or(3+(tonumber(J:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lj=o.info()return(lj and type(lj.Caps)=="table")and lj.Caps or y.CAPS end function y.value(sT,cx)
local he=o.info()local cy=he and he.Pets[sT]if not(cy and type(cy.boost)=="table")then return nil end local cz
if type(he.boostValue)=="function"then local B7,B8=pcall(he.boostValue,sT,(cx~=""and cx)or nil)cz=B7 and tonumber(B8)or nil
end if not cz then local eH=cy.boost.value or 0 cz=eH if cx=="Big"or cx=="Huge"then local sU=eH*(cx=="Huge"and 1.75 or 1.5)
cz=y.ROUND[cy.boost.kind]and math.max(eH+(cx=="Huge"and 2 or 1),math.floor(sU+0.5))or sU if cx=="Huge"and y.ROUND[cy.boost.kind]then cz=math.max(cz,math.max(eH+1,math.floor(eH*1.5+0.5))+1)end
end end return cy.boost.kind,cz,cy.boost.every end function y.stats(B9)local cA,lk,sV,eI={},{},{},{}local B_=y.cosmic()
for JH,dg in ipairs(B9)do local au,eJ,sW=y.value(dg.name,dg.variant or"")if au then if dg.variant=="Huge"then sV[y.CAPKEY[au]or au]=true end
if au:sub(1,6)=="social"then lk[au]=math.max(lk[au]or 0,eJ)elseif au=="waxStir"or au=="cashGift"then cA[au]=(cA[au]or 0)+eJ*60/(sW or 60)
elseif au=="luckyPull"then cA.luckyPull=(cA.luckyPull or 0)+eJ/(sW or 10)else cA[au]=(cA[au]or 0)+eJ if B_[dg.name]then eI[au]=eI[au]or{}eI[au][dg.name]=(eI[au][dg.name]or 0)+eJ end
end end end return cA,lk,sV,eI end function y.glazeGain(Ca,hf)local eK,ll,JI={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local Cb=eK[1]+eK[2]+eK[3]local Cc=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local dh={}for hg=1,3 do dh[hg]=eK[hg]+Ca*eK[hg]/Cb+(hg==1 and Cc or 0)end
local lm={dh[1]*(1-hf),dh[2]*(1-hf)+dh[1]*hf,dh[3]+dh[2]*hf}return lm[1]*(ll[1]-1)+lm[2]*(ll[2]-1)+lm[3]*(ll[3]-1)
end function y.score(hh,Cd)local Ce,Cf,Cg=y.caps(),y.hcaps(),y.cosmic()local hi,hj,Ch,sX=y.stats(Cd)local function ln(lo)return(Ch[lo]and Cf[lo])or Ce[lo]or math.huge end
local function bo(hk)local lp,lq=hi[hk]or 0,ln(hk)local lr=math.min(lp,lq)if sX[hk]and lp>lq then local ls=0 for Ci,Cj in pairs(sX[hk])do ls=ls+math.min(Cj,Cg[Ci]or 0)end
lr=lr+math.min(lp-lq,ls)end return lr end local Ck=(1+bo("income"))*(1+(hj.socialIncome or 0))*(1+math.min(hi.cashGift or 0,ln("cashGiftPerMinute"))/60)
local Cl=1+bo("luck")+(hi.luckyPull or 0)+(hj.socialLuck or 0)local sY=Cl*(1+bo("newFind"))*(1+bo("rollSpeed"))
local eL=math.log(Ck)local Cm=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local lt=(1+bo("waxSpeed")+bo("longWax"))*(1+(hj.socialWax or 0))
+math.min(hi.waxStir or 0,ln("waxStirPerMinute"))/60/Cm local Cn=1-(1-bo("headStart"))*(1-(hj.socialHeadStart or 0))
if hh=="farm"then return eL+0.7*math.log(sY)+0.1*math.log(lt)end if hh=="full"then return eL+0.4*math.log(lt)+0.02*math.log(sY)end
if hh=="glaze"then return y.glazeGain(bo("glaze"),bo("glazeUp"))+0.001*eL end if hh=="wax"then return-math.log(1-0.5*Cn)+0.001*eL+0.001*math.log(lt)end
return eL end function y.kinds(Co)local sZ,lu={},{}for JJ,eM in ipairs(Co)do local s0=eM.name.."|"..(eM.variant or"")
local bQ=sZ[s0]if not bQ then bQ={name=eM.name,variant=eM.variant or"",n=0,ids={}}sZ[s0]=bQ lu[#lu+1]=bQ end bQ.n=bQ.n+1
bQ.ids[#bQ.ids+1]=eM.id end return lu end function y.bestKinds(s1,bR,Cp,s2,s3)local aB,bS={},{}local function lv(Cq)
local s4,hl={},{}for Cr,lw in ipairs(Cq)do s4[Cr]=bR[lw]hl[lw]=(hl[lw]or 0)+1 end local eN=y.score(s1,s4)if s2 then for Cs,Ct in pairs(hl)do eN=eN+1e-7*math.min(Ct,s2[Cs]or 0)end end
if s3 then for Cu,Cv in pairs(hl)do eN=eN-1e-8*Cv*s3[bR[Cu].variant]end end return eN end for JK=1,Cp do local eO,lx
for hm=1,#bR do if(bS[hm]or 0)<bR[hm].n then aB[#aB+1]=hm local s5=lv(aB)aB[#aB]=nil if not lx or s5>lx+1e-12 then eO,lx=hm,s5 end
end end if not eO then break end bS[eO]=(bS[eO]or 0)+1 aB[#aB+1]=eO if#bR>40 then task.wait()end end for JL=1,6 do
task.wait()local s6,s7=false,lv(aB)for ly=1,#aB do for di=1,#bR do local hn=aB[ly]if di~=hn and(bS[di]or 0)<bR[di].n then
aB[ly]=di local s8=lv(aB)if s8>s7+1e-9 then bS[hn],bS[di],s7,s6=bS[hn]-1,(bS[di]or 0)+1,s8,true else aB[ly]=hn end
end end end if not s6 then break end end local s9={}for Cw,Cx in ipairs(aB)do s9[Cw]=bR[Cx]end return aB,y.score(s1,s9)
end function y.best(Cy,Cz,CA,ho)ho=ho or{}local lz=y.kinds(Cz)local lA={}for s_,CB in ipairs(lz)do for JM,CC in ipairs(CB.ids)do if ho[tostring(CC)]then lA[s_]=(lA[s_]or 0)+1 end end end
local CD,CE=y.bestKinds(Cy,lz,CA,lA)local lB,lC={},{}for JN,CG in ipairs(CD)do local ta,eP=lz[CG],nil for JO,lD in ipairs(ta.ids)do if ho[tostring(lD)]and not lB[lD]then eP=lD break end end
if not eP then for JP,tb in ipairs(ta.ids)do if not lB[tb]then eP=tb break end end end lB[eP]=true lC[#lC+1]=tostring(eP)
end return lC,CE end function y.dream()local td=o.info()if not(td and type(td.Pets)=="table")then return nil end
local lE=y.slots()local te=y.needFor("").."|"..y.needFor("Big").."|"..lE.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==te and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local CM=pcall(function()local hp={}for JQ,CH in ipairs(o.order())do for JR,CI in ipairs({"","Big","Huge"})do hp[#hp+1]={name=CH,variant=CI,n=lE,ids={}}end
end local eQ,lF={},{}for JS,hq in ipairs(y.ROLES)do if e[hq[1]]~=""then local CJ,CK=y.bestKinds(hq[2],hp,lE,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local lG,hr={},{}for JT,tf in ipairs(CJ)do lG[tf]=(lG[tf]or 0)+1 end for CL,lH in pairs(lG)do local bT=hp[CL]
eQ[bT.name]=eQ[bT.name]or{[""]=0,Big=0,Huge=0}eQ[bT.name][bT.variant]=math.max(eQ[bT.name][bT.variant],lH)hr[#hr+1]=(lH>1 and(lH.."x ")or"")..o.nice(bT.name,bT.variant)
end table.sort(hr)lF[#lF+1]={role=hq[2],team=e[hq[1]],names=hr,score=CK}end end y.dreamT,y.dreamTeams,y.dreamSig=eQ,lF,te
end)y.dreaming=false if not CM then y.dreamSig=nil end return y.dreamT end function y.owned(hs)local th,lI={},{}
for JU,CN in ipairs(hs and hs.arriving or{})do th[tostring(CN)]=true end for JV,cB in ipairs(hs and hs.pets or{})do
if not th[tostring(cB.id)]then lI[#lI+1]={id=tostring(cB.id),name=cB.name,variant=cB.variant or"",named=cB.named or(cB.nickname and cB.nickname~="")}
end end return lI end function y.have(ti,CO,CP)local a9={[""]=0,Big=0,Huge=0}local tj={}for JW,eR in ipairs(y.owned(CO))do
tj[eR.id]=true if eR.name==ti and a9[eR.variant]then a9[eR.variant]=a9[eR.variant]+1 end end if CP then for JX,dj in ipairs(o.recent or{})do
if dj.name==ti and not tj[dj.id]and z()-dj.at<20 and a9[dj.variant or""]then a9[dj.variant or""]=a9[dj.variant or""]+1 end
end end return a9,a9[""]+a9 .Big*y.unit("Big")+a9 .Huge*y.unit("Huge")end function y.goal(tk)local tl=e.Pets[tk]
if tl and tonumber(tl.f)==-1 then return nil,0 end local tm=y.dream()local eS=tm and tm[tk]if not eS then return nil,0 end
return eS,eS[""]+eS.Big*y.unit("Big")+eS.Huge*y.unit("Huge")end function y.wantMore(lJ,JY,tn)if not tn then return true end
local to=e.Pets[lJ]if to and tonumber(to.f)==-1 then return true end local CQ,CS=y.goal(lJ)if not CQ then return true end
local JZ,CT=y.have(lJ,tn,true)return CT<CS+y.need()end function y.status(eT,tp)if not tp then return nil end local tq=e.Pets[eT]
if tq and tonumber(tq.f)==-1 then return"KEEP: never fused"end local cC,tr=y.goal(eT)if not cC then return y.dream()and"in no best team: bought as ticked"or nil end
local lK,CU=y.have(eT,tp)local cD={}if cC.Huge>0 then cD[#cD+1]=("Huge %d/%d"):format(lK.Huge,cC.Huge)end if cC.Big>0 then cD[#cD+1]=("Big %d/%d"):format(lK.Big,cC.Big)end
if cC[""]>0 then cD[#cD+1]=("plain %d/%d"):format(lK[""],cC[""])end local CV=y.blocked and y.blocked[eT]and(" | "..y.blocked[eT])or""
return("%s | %d/%d copies%s"):format(table.concat(cD," "),math.min(CU,tr),tr,CV)end function y.wear(lL)local lM={}
for J0,CW in ipairs(lL)do lM[tostring(CW)]=true end for J1=1,3 do local dk=o.data()if not dk then return false end
for J2,ts in ipairs(dk.equipped or{})do if not lM[tostring(ts)]then o.call("unequip",ts)task.wait(0.3)end end
dk=o.data()local tt={}for J3,CX in ipairs(dk.equipped or{})do tt[tostring(CX)]=true end for J4,tu in ipairs(lL)do
if not tt[tostring(tu)]then o.call("equip",tu)task.wait(0.3)end end task.wait(0.4)dk=o.data()local lN,tv=0,true
for J5,CY in ipairs(dk.equipped or{})do lN=lN+1 if not lM[tostring(CY)]then tv=false end end if tv and lN==#lL then return true end
end return false end function y.saveTeam(tw,tx)if not y.wear(tx)then return false,"could not put the pets on"end
local CZ=A.teams()local cE for C0,C1 in ipairs(CZ)do if C1 .name==tw then cE=C0 break end end local dl if cE then
dl=o.call("teamSave",cE)else dl=o.call("teamNew")if type(dl)=="table"and dl.ok and dl.index then cE=dl.index task.wait(0.3)
o.call("teamRename",{index=cE,name=tw})end end task.wait(0.4)local lO=o.data()local ty=lO and lO.teams and cE and lO.teams[cE]
if not ty then return false,"the game did not save it"end local tz={}for J6,C2 in ipairs(ty.pets or{})do tz[tostring(C2)]=true end
for J7,C3 in ipairs(tx)do if not tz[tostring(C3)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local C4=o.srv()for J8,C5 in ipairs(A.list or{})do if C5 .ends-C4<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local eU=o.data()if not eU then return{}end local tA={}for J9,C6 in ipairs(eU.arriving or{})do tA[tostring(C6)]=true end
local eV={}for J_,ht in ipairs(eU.pets or{})do if not tA[tostring(ht.id)]then eV[#eV+1]={id=tostring(ht.id),name=ht.name,variant=ht.variant or""}end
end local tB={}for Ka,tC in ipairs(eV)do tB[tC.id]=tC end local tD=tonumber(eU.slots)or 3 local lP,tE={},{}for Kb,hu in ipairs(y.ROLES)do
local eW=e[hu[1]]if eW~=""and not tE[eW]then tE[eW]=true local lQ,eX,tF={},{},false for Kc,tG in ipairs(eU.teams or{})do
if tG.name==eW then for Kd,C7 in ipairs(tG.pets or{})do local lR=tB[tostring(C7)]if lR then lQ[lR.id]=true eX[#eX+1]=lR else tF=true end
end end end local lS,tH=y.best(hu[2],eV,tD,lQ)local tI=y.score(hu[2],eX)local tJ=#lS==#eX for Ke,C8 in ipairs(lS)do if not lQ[C8]then tJ=false end end
if not tJ and(tF or#eX<math.min(tD,#eV)or tH>tI+1e-4)then lP[#lP+1]={team=eW,role=hu[2],ids=lS,gain=tH-tI}end
end end return lP end function y.rebuild(C9)local tK=y.plan()if#tK==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end A.editing,A.editingSince=true,z()
local hv=true local Dc,Dd=pcall(function()for Kf,eY in ipairs(tK)do local C_,Da=y.saveTeam(eY.team,eY.ids)local tL=o.data()
local lT={}for Kg,Db in ipairs(eY.ids)do for Kh,lU in ipairs(tL and tL.pets or{})do if tostring(lU.id)==Db then lT[#lT+1]=o.nice(lU.name,lU.variant)end
end end if C_ then C(("TEAM %s rebuilt (%s): %s"):format(eY.team,C9 or"pets changed",table.concat(lT,", ")))else hv=false C(("TEAM %s: %s"):format(eY.team,tostring(Da)))end
end end)A.editing,A.nextTry=false,0 if not Dc then hv=false C("TEAM BUILD ERR "..tostring(Dd))end y.builds=y.builds+1
y.buildMsg=hv and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return hv end
function y.roleScores(tM)local bU={}for Ki,tN in ipairs(tM)do bU[#bU+1]=tN.name..tN.variant end table.sort(bU)
bU=table.concat(bU,",")y.rsCache=y.rsCache or{}if y.rsCache[bU]then return y.rsCache[bU]end local De,Df,lV=y.kinds(tM),y.slots(),{}
for Kj,lW in ipairs(y.ROLES)do if e[lW[1]]~=""then local Kk,Dg=y.bestKinds(lW[2],De,Df)lV[lW[2]]=Dg end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bU]=lV return lV end function y.noLoss(tO,Dh,Di,Dj)local tP,eZ={},{}
for Kl,Dk in ipairs(Dh)do tP[Dk]=true end for Km,tQ in ipairs(tO)do if not tP[tQ.id]then eZ[#eZ+1]=tQ end end
eZ[#eZ+1]={id="new",name=Di,variant=Dj}local Dl,tR=y.roleScores(tO),y.roleScores(eZ)local tS=false for lX,tT in pairs(Dl)do
if(tR[lX]or-math.huge)<tT-1e-6 then return false,lX end if(tR[lX]or 0)>tT+1e-6 then tS=true end end return true,tS
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local e0=o.data()if not e0 then return end local tU=y.owned(e0)local hw,e1={},{}for Kn,Dm in ipairs(e0 .teams or{})do for Ko,Dn in ipairs(Dm.pets or{})do hw[tostring(Dn)]=true end end
for Kp,Do in ipairs(e0 .equipped or{})do e1[tostring(Do)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for Kq,aK in ipairs(o.order())do
local hx=y.goal(aK)if hx then local lY=y.have(aK,e0)for Kr,bp in ipairs({"Big",""})do local dm,lZ=y.nextOf(bp),y.needFor(bp)
local Dp=(bp=="Big"and lY.Huge<hx.Huge)or(bp==""and lY.Big<hx.Big+y.needFor("Big")*math.max(0,hx.Huge-lY.Huge))
local e2={}for Ks,l0 in ipairs(tU)do if l0 .name==aK and l0 .variant==bp then e2[#e2+1]=l0 end end if Dp and#e2>=lZ and z()>=(y.failUntil[aK..bp]or 0)then
table.sort(e2,function(hy,hz)local tV=(e1[hy.id]and 4 or 0)+(hw[hy.id]and 2 or 0)+(hy.named and 1 or 0)local tW=(e1[hz.id]and 4 or 0)+(hw[hz.id]and 2 or 0)+(hz.named and 1 or 0)
if tV~=tW then return tV<tW end return hy.id<hz.id end)local cF,l1,tX={},{},false for dn=1,lZ do cF[dn]=e2[dn].id
if e1[cF[dn]]then l1[#l1+1]=cF[dn]end if e1[cF[dn]]or hw[cF[dn]]then tX=true end end local Dq,tY=y.noLoss(tU,cF,aK,dm)
if not Dq then y.blocked[aK]=("%s waits: it would weaken the %s team now"):format(dm,y.ROLENAME[tY]or tostring(tY))
elseif tX and not y.quiet()then y.blocked[aK]=dm.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dm,o.nice(aK))
return else A.editing,A.editingSince=true,z()for Kt,Dr in ipairs(l1)do o.call("unequip",Dr)task.wait(0.3)end local hA=o.call("fuse",{ids=cF})
A.editing,A.nextTry=false,0 if type(hA)=="table"and hA.ok then y.fused=y.fused+1 y.dirtyAt=z()C(("FUSED %d %s -> %s"):format(lZ,o.nice(aK,bp),o.nice(aK,dm)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aK,dm),os.date("%H:%M"))else y.failUntil[aK..bp]=z()+120 C(("fuse %s failed: %s"):format(o.nice(aK,bp),type(hA)=="table"and tostring(hA.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local tZ=o.data()if not tZ then return end local cG={}for Ku,Ds in ipairs(tZ.pets or{})do cG[#cG+1]=tostring(Ds.id)end
table.sort(cG)cG=table.concat(cG,",")if cG~=y.sig then y.sig,y.dirtyAt=cG,z()end local Dt=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if Dt and not A.editing then local Du=y.rebuild(y.dirtyAt and"pets changed"or"check")if Du then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cH)return cH:IsA("ParticleEmitter")or cH:IsA("Trail")or cH:IsA("Beam")or cH:IsA("Fire")or cH:IsA("Smoke")
or cH:IsA("Sparkles")or cH:IsA("Light")end function d.muteOne(bq)if not e.Lite or not bq.Parent then return end
local hB=(bq:IsA("BillboardGui")and d.bb)or(d.isFx(bq)and d.fx)or nil if not hB or hB[bq]~=nil then return end
if hB==d.fx and d.gameLow and not bq:IsA("Beam")then return end hB[bq]=bq.Enabled if bq.Enabled then bq.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local l2={}for Kv,Dv in ipairs({d.bb,d.fx})do for Dw in pairs(Dv)do l2[#l2+1]=Dw end end local t0=os.clock()for Dx,e3 in ipairs(l2)do
if e.Lite and e3 .Parent and e3 .Enabled then local Dy=d.bb[e3]~=nil and d.bb or d.fx Dy[e3]=true e3 .Enabled=false
end if Dx%200==0 and os.clock()-t0>0.002 then task.wait()t0=os.clock()end end end function d.lite(t1)e.Lite=t1
if t1 then task.spawn(function()for Dz,DA in ipairs(ai:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,DA)
if Dz%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=T(ai.DescendantAdded:Connect(function(l3)
if e.Lite and(l3:IsA("BillboardGui")or d.isFx(l3))then d.queue[#d.queue+1]=l3 end end))end local l4=game:GetService("Lighting")
for Kw,e4 in ipairs(l4:GetChildren())do if e4:IsA("PostEffect")and e4 .Enabled and d.post[e4]==nil then d.post[e4]=true e4 .Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and l4 .GlobalShadows or d.oldShadows l4 .GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ai.Terrain.Decoration or d.oldDeco ai.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for Kx,DB in pairs(d.watch)do pcall(function()DB:Disconnect()end)end
for t2,DC in pairs(d.bb)do pcall(function()if t2 .Parent then t2 .Enabled=DC end end)end for t3,DD in pairs(d.fx)do pcall(function()if t3 .Parent then t3 .Enabled=DD end end)end
for t4 in pairs(d.post)do pcall(function()if t4 .Parent then t4 .Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local DE=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()DE.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ai.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(t5)
local DF,l5=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not DF or type(l5)~="table"then return end if t5 and not d.ceOld then d.ceOld={}for Ky,t6 in ipairs({"Fireworks","Confetti"})do
local hC=l5[t6]if type(hC)=="table"and type(hC.Play)=="function"then d.ceOld[t6]=hC.Play pcall(function()hC.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not t5 and d.ceOld then for DG,DH in pairs(d.ceOld)do pcall(function()l5[DG].Play=DH end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local l6,hD for Kz,e5 in ipairs(getgc(false))do if type(e5)=="function"and(type(islclosure)~="function"or islclosure(e5))then
local DI,t7,t8=pcall(debug.info,e5,"sn")if DI and type(t7)=="string"and t7:find("ToppingCullHandler",1,true)then
if t8=="poll"then l6=e5 elseif t8=="retarget"then hD=e5 end end end end if not(l6 and hD)then return nil end local DJ,hE=pcall(debug.getupvalues,hD)
local t9=DJ and type(hE)=="table"and hE[3]if type(t9)~="function"or debug.info(t9,"n")~="targetFor"or(hE[1]~=nil and type(hE[1])~="number")then return nil end
d.tc={poll=l6,re=hD}return d.tc end function d.tops(t_)local aP=d.topsFind()if not aP then return false end if t_ and not aP.old then
local DK,DL=pcall(hookfunction,aP.poll,function()end)if not DK then return false end aP.old=DL pcall(debug.setupvalue,aP.re,1,-1000)
pcall(aP.re)elseif not t_ and aP.old then local DM=type(restorefunction)=="function"and pcall(restorefunction,aP.poll)
if not DM then pcall(hookfunction,aP.poll,aP.old)end aP.old=nil pcall(aP.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(DN)local ua=ai:FindFirstChild("Plots")local ub=os.clock()if DN then for KA,DO in ipairs(ua and ua:GetChildren()or{})do
local uc=DO:FindFirstChild("SkinProps")local ud=uc and uc:FindFirstChild("FairyLights")for KB,ue in ipairs(ud and ud:GetChildren()or{})do
for KC,e6 in ipairs(ue:GetChildren())do if e6:IsA("BasePart")and(e6 .Name=="Bulb"or e6 .Name=="Wire")then d.lit[e6]=ue e6 .Parent=nil end
end if os.clock()-ub>0.002 then task.wait()ub=os.clock()end end end for KD,DP in ipairs({"Leaderboards","ClanBoard"})do
local l7=ai:FindFirstChild(DP)if l7 then d.boardsOff[l7]=true l7 .Parent=nil end end else for DQ,uf in pairs(d.lit)do pcall(function()if uf.Parent then DQ.Parent=uf end end)end
for ug in pairs(d.boardsOff)do pcall(function()if not ug.Parent then ug.Parent=ai end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(DR)if DR then local uh=af:FindFirstChild("Remotes")local ui=uh and uh:FindFirstChild("SquishyRollAnimation")
if not ui or type(getconnections)~="function"then return end local DS,DT=pcall(getconnections,ui.OnClientEvent)
for KE,hF in ipairs(DS and DT or{})do local l8=""pcall(function()l8=debug.info(hF.Function,"s")end)if type(l8)=="string"and l8:find("SquishyHandler",1,true)and not d.reel[hF]then
if pcall(function()hF:Disable()end)then d.reel[hF]=true end end end else for DU in pairs(d.reel)do pcall(function()DU:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(DV)if not DV then for KF,DW in pairs(d.quiet)do pcall(function()DW:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function l9(DX,DY)local DZ,D0=pcall(getconnections,DX)
for KG,hG in ipairs(DZ and D0 or{})do local l_=""pcall(function()l_=debug.info(hG.Function,"s")end)local ma=hG.Function
if ma and type(l_)=="string"and l_:find(DY,1,true)and not d.quiet[ma]then if pcall(function()hG:Disable()end)then d.quiet[ma]=hG end
end end end local uj=ai:FindFirstChild("Plots")for KH,hH in ipairs(uj and uj:GetChildren()or{})do if hH~=c.plot then
l9(hH:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uk,ul=hH:FindFirstChild("WaxStations"),hH:FindFirstChild("SquishyStack")
if uk then l9(uk.DescendantAdded,"LocalToppingsHandler")end if ul then l9(ul.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for um,D1 in pairs(d.lit)do if not D1:IsDescendantOf(game)then d.lit[um]=nil pcall(function()um:Destroy()end)end
end end function d.passText()local av=function(D2)return J:GetAttribute(D2)end local mb={}local function bV(D3,D4)mb[#mb+1]=(D3 and"[x] "or"[  ] ")..D4 end
bV(av("VIP")==true,"VIP: money x1.5, offline +50%")bV(av("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(av("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local D5=av("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(av("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bV(av("FastWax")==true or av("SuperFastWax")==true,D5 .." (the farm times by the game's own timers)")local uo=(av("FusePass")==true and"Fuse Pass")or(av("FusePass4")==true and"Fuse Pass 4")or(av("FusePass5")==true and"Fuse Pass 5")or nil
bV(uo~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uo or"Fuse pass",y.needFor(""),y.needFor("Big")))local hI=o.data()
local D6=tonumber(hI and hI.maxOwned)or 60 bV(av("PetInventory50")==true or av("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(hI and#(hI.pets or{})or 0,D6,(av("PetInventory50")==true and av("PetInventory100")==true)and" (both bag passes)"or""))
local up=tonumber(av("PetEquipBought"))or 0 bV(up>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),up))
local uq=tonumber(av("PetWishCredits"))or 0 if uq>0 then bV(true,("%d free wishes: used before cash"):format(uq))end
local ur=tonumber(av("FinishAllCredits"))or 0 if ur>0 then bV(true,("%d finish-all credits (yours to use)"):format(ur))end
return table.concat(mb,"\n")end function d.extras(hJ)pcall(d.quietPlots,hJ and c.plot~=nil)pcall(d.fxPatch,hJ)
pcall(d.tops,hJ)pcall(d.lights,hJ)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(us)
e.HideHud=us local mc=J:FindFirstChildOfClass("PlayerGui")if not mc then return end if us then for KI,e7 in ipairs(mc:GetChildren())do
if e7:IsA("ScreenGui")and not d.MINE[e7 .Name]and e7 .Enabled then d.hud[e7]=true e7 .Enabled=false end end if not d.hudConn then
d.hudConn=T(mc.ChildAdded:Connect(function(e8)if e.HideHud and e8:IsA("ScreenGui")and not d.MINE[e8 .Name]then
task.defer(function()if e.HideHud and e8 .Enabled then d.hud[e8]=true e8 .Enabled=false end end)end end))end else
for ut in pairs(d.hud)do pcall(function()if ut.Parent then ut.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(md)e.FpsCap=md local uu=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uu then return false end return pcall(uu,md==0 and 60 or md)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ap)if ap:IsA("BasePart")or ap:IsA("Decal")or ap:IsA("Texture")then if ap.Transparency<1 then d.unseen[ap]=ap.Transparency ap.Transparency=1 end
elseif ap:IsA("BillboardGui")or ap:IsA("SurfaceGui")or ap:IsA("ParticleEmitter")or ap:IsA("Beam")or ap:IsA("Trail")or ap:IsA("Light")or ap:IsA("Fire")or ap:IsA("Smoke")or ap:IsA("Sparkles")then
if ap.Enabled then d.unseen[ap]=true ap.Enabled=false end end end function d.notMine(D7)return e.HideMine or(c.plot and not D7:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(hK)
local me=hK.Parent local mf=me and me.Name=="SquishyStack"and me.Parent if mf and mf~=c.plot and c.plot and mf.Parent==c.plot.Parent and not d.dropSeen[hK]then
d.dropSeen[hK]=true d.dropQ[#d.dropQ+1]={hK,z()+3}end end function d.dropScan()local uv=c.plot and c.plot.Parent
if not(e.HideBases and uv)then return end for KJ,uw in ipairs(uv:GetChildren())do local ux=uw~=c.plot and uw:FindFirstChild("SquishyStack")
for KK,D8 in ipairs(ux and ux:GetChildren()or{})do d.dropIt(D8)end end end function d.dropStep(D9)local mg=d.dropQ
while d.dropI<=#mg and os.clock()-D9<0.003 do local mh=mg[d.dropI]if mh[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mh[1].Parent then pcall(function()mh[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mg then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mi=os.clock()local e9=d.queue if e.Lite and e9 and#e9>0 then d.muteI=d.muteI or 1
while d.muteI<=#e9 and os.clock()-mi<0.0015 do pcall(d.muteOne,e9[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#e9 then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mi)end local hL=d.hideQ if d.hideI>#hL then return end while d.hideI<=#hL and os.clock()-mi<0.004 do
local mj=hL[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mj.Parent and d.notMine(mj)then pcall(d.hideOne,mj)end
end if d.hideI>#hL then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(uy)if e.HideBases then d.bases(false)end
e.HideMine=uy==2 if uy>0 then d.bases(true)end end function d.bases(uz)e.HideBases=uz local mk=ai:FindFirstChild("Plots")
if not mk then return end if uz then task.spawn(function()local ml=0 for KL,hM in ipairs(mk:GetChildren())do local uA=hM~=c.plot and c.plot and hM:FindFirstChild("SquishyStack")
for KM,D_ in ipairs(uA and uA:GetChildren()or{})do d.dropIt(D_)end if hM~=c.plot or e.HideMine then for KN,Ea in ipairs(hM:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,Ea)ml=ml+1 if ml%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=T(mk.DescendantAdded:Connect(function(dp)if e.HideBases and d.notMine(dp)then
pcall(d.hideOne,dp)d.hideQ[#d.hideQ+1]=dp if dp.Parent and dp.Parent.Name=="SquishyStack"then d.dropIt(dp)end
end end))end else for mm,uB in pairs(d.unseen)do pcall(function()if not mm.Parent then return end if type(uB)=="number"then mm.Transparency=uB else mm.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(uC)e.NoRender=uC pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not uC)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local Eb=game:GetService("RunService")local mn=0 for KO,Ec in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local Ed,uD=pcall(function()return Eb[Ec]end)local uE,mo=false,nil if Ed and uD then uE,mo=pcall(getconnections,uD)end
if uE and type(mo)=="table"then for KP,hN in ipairs(mo)do local mp=""pcall(function()local uF=getfenv(hN.Function).script mp=uF and uF:GetFullName()or""end)
if mp~=""then for KQ,Ee in ipairs(d.CALM)do if mp:find(Ee,1,true)then local mq=hN.Function if mq and not d.calmedF[mq]and pcall(function()hN:Disable()end)then
d.calmedF[mq]=true d.calmed[#d.calmed+1]=hN mn=mn+1 end break end end end end end end if#d.calmed>200 then local mr={}for Ef=#d.calmed-49,#d.calmed do mr[#mr+1]=d.calmed[Ef]end d.calmed=mr
end return mn end function d.calm(uG)e.Calm=uG if uG then local Eg=d.calmScan()C(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(Eg))
else for KR,Eh in ipairs(d.calmed)do pcall(function()Eh:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end if H.arPaused then pcall(H.resume,"script stopped")end
pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(uH)if c.rejoining then return end C("REJOIN this server ("..uH..")")
pcall(f6)if c.autoload then pcall(gw,c.autoload)end p2()local Ei=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then d6(uH..", same server failed")end end)return Ei end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=J:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local uI=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if uI then for KS,Ej in ipairs(uI:GetChildren())do local uJ=Ej:FindFirstChild("SquishyPlaceHolder")local cI=uJ and uJ:FindFirstChild("TimerGui")
if cI and cI:IsA("BillboardGui")then if d.bb[cI]==nil then pcall(d.muteOne,cI)elseif cI.Enabled then d.bb[cI]=true cI.Enabled=false end
end end end local Ek,dq=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Ek and type(dq)=="number"then
d.mem=dq d.memPeak=math.max(d.memPeak,dq)if(e.MemLimit or 0)>0 and dq>e.MemLimit then d.over=(d.over or 0)+((dq>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dq,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()C(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function ms(hO)if type(hO)~="string"then return false end
hO=hO:lower()for KT,El in ipairs(c.sellWords)do if hO:find(El,1,true)then return true end end return false end
local function Em()local uK=af:FindFirstChild("Remotes")local mt=uK and uK:FindFirstChild("SellSquishy")if not(mt and mt:IsA("RemoteEvent"))then return false end
if not pcall(function()mt:FireServer()end)then return false end return ao(function()return ac()==nil end,1.5)
end local function En()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local uL=aq()local uM=uL and uL.HumanoidRootPart.Position local e_,uN for KU,dr in ipairs((c.plot or ai):GetDescendants())do
if dr:IsA("ProximityPrompt")and(ms(dr.ActionText)or ms(dr.ObjectText)or ms(dr.Name))then local uO=oY(dr)local mu=(uO and uM)and(uO-uM).Magnitude or 1e9
if mu<=400 and(not e_ or mu<uN)then e_,uN=dr,mu end end end c.sellSpot=e_ c.noSellSpot=(e_==nil)return e_ end
local function uP()local mv=ac()if not mv then c.holding=false return false end if aN(mv)then return false end
local mw=al(W(mv))if Em()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=z()+2.5,0
C("SOLD "..mw)return true end local ds=En()if ds then local uQ=dU(ds)if uQ then cl(uQ,ds)local uR=ac()if uR and not aN(uR)then
local Eo,Ep=eb(ds,function()return ac()==nil end,function()return ds.Enabled end)if Eo then c.sold,c.holding,c.sellFails=c.sold+1,false,0
C(("SOLD %s at %s via %s"):format(mw,f1(ds),Ep))return true end end end end c.sellFails=c.sellFails+1 C("could not sell "..mw.." ("..c.sellFails..")")
return false end local Eq={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Er(dt)local hP=f1(dt):lower()for KV,Es in ipairs(Eq)do if hP:find(Es,1,true)then return 0 end end
local a_,ar=dt.Name:lower(),0 local function aX(Et,Eu)return Et:find(Eu,1,true)~=nil end if aX(a_,"collect")then ar=ar+60 end
if aX(a_,"cash")or aX(a_,"money")then ar=ar+45 end if aX(a_,"income")or aX(a_,"claim")then ar=ar+35 end if aX(a_,"coin")or aX(a_,"earn")or aX(a_,"green")then ar=ar+20 end
if a_=="pad"or a_=="touch"then ar=ar+25 end if ar==0 and(aX(hP,"collect")or aX(hP,"cash")or aX(hP,"money"))then ar=25 end
if ar==0 then return 0 end local fa=dt.Color if fa.G>0.5 and fa.G>fa.R*1.4 and fa.G>fa.B*1.4 then ar=ar+15 end
if math.min(dt.Size.X,dt.Size.Y,dt.Size.Z)<2 then ar=ar+5 end return ar end local function Ev()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local hQ,fb,mx={},nil,29 for KW,hR in ipairs(c.plot:GetDescendants())do
if hR:IsA("BasePart")then local hS=Er(hR)if hS>0 then hQ[#hQ+1]={s=hS,p=hR}if hS>mx then fb,mx=hR,hS end end end
end table.sort(hQ,function(Ew,Ex)return Ew.s>Ex.s end)c.padCands,c.padPart=hQ,fb if fb then C("collect pad: "..f1(fb).." (score "..mx..")")end
return fb end local my="SAB_pad_v1.txt"local function Ey(Ez)if type(writefile)=="function"then pcall(writefile,my,table.concat({Ez:GetComponents()},","))end
end local function EA()if type(isfile)~="function"or type(readfile)~="function"then return nil end local EB,uS=pcall(function()if isfile(my)then return readfile(my)end end)
if not EB or type(uS)~="string"then return nil end local hT={}for EC in uS:gmatch("[^,]+")do hT[#hT+1]=tonumber(EC)end
if#hT==12 then return CFrame.new(unpack(hT))end end local function ED(mz,hU,EE)local EF=c6(mz)local mA=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aY=(mA and mA:IsA("BasePart"))and(mA.Position-hU)or Vector3 .new(1,0,0)aY=Vector3 .new(aY.X,0,aY.Z)if aY.Magnitude<0.05 then aY=Vector3 .new(1,0,0)end
aY=aY.Unit for EG=0,7 do local hV=EG*math.pi/4 local EH=Vector3 .new(aY.X*math.cos(hV)-aY.Z*math.sin(hV),0,aY.X*math.sin(hV)+aY.Z*math.cos(hV))
local hW=hU+EH*(EE+5)local mB=gE(hW.X,hU.Y,hW.Z)if mB and math.abs(mB.Y-hU.Y)<8 then aC(mz,Vector3 .new(hW.X,mB.Y+EF,hW.Z))
if j5(mz,0.7)then return true end end end return false end local function EI()c.lastCollect=z()local fc=aq()if not fc then return end
local uT,EJ=fc.HumanoidRootPart,c6(fc)local fd,uU,fe,mC=nil,4,nil,"?"local mD=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and mD and mD:IsA("BasePart")then fd,mC=(mD.CFrame*c.manualPad).Position,"manual pad"else local br=Ev()
if br then fd=Vector3 .new(br.Position.X,br.Position.Y+br.Size.Y/2+EJ,br.Position.Z)uU,fe,mC=math.max(br.Size.X,br.Size.Z)/2,br,br.Name
end end if not fd then C("COLLECT: pad not found - stand on it and tap SET PAD")return end local mE=be()aC(fc,fd)
if fe and type(firetouchinterest)=="function"then pcall(firetouchinterest,uT,fe,0)end ag(e.PadDwell)if fe and type(firetouchinterest)=="function"then pcall(firetouchinterest,uT,fe,1)end
ag(0.5)c.collected=c.collected+1 local mF=be()C(("COLLECTED (%s) %s"):format(mC,(mE and mF and mF>mE)and("+$"..aE(mF-mE))or"no cash change seen"))
ED(fc,fd,uU)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.mods()if q.si and z()-q.modAt<120 then return true end
local uV=af:FindFirstChild("Modules")if not uV then return false end local function mG(EK)local uW=uV:FindFirstChild(EK)
if not uW then return nil end local EL,uX=pcall(require,uW)return(EL and type(uX)=="table")and uX or nil end q.si,q.arm,q.ci=mG("SquishyInfo"),mG("AutoRollRules"),mG("CrateInfo")
q.modAt=z()if not q.si then return false end local mH={}if q.arm and type(q.arm.tierOf)=="table"then for mI in pairs(q.arm.tierOf)do
local hX=q.si[mI]if type(hX)=="table"and hX.rarity~="Limited"and not hX.incomeType and not hX.hiddenAfter then mH[W(mI)]=mI end
end end q.roll=mH local hY={}for EM,EN in pairs(mH)do local ff=q.si[EN]if type(ff)=="table"and type(ff.income)=="number"and not ff.incomeType then
hY[#hY+1]={k=EM,inc=ff.income,pr=tonumber(ff.price)or 0}end end table.sort(hY,function(mJ,mK)if mJ.inc~=mK.inc then return mJ.inc>mK.inc end return mJ.pr>mK.pr end)
q.order=hY local hZ,mL,mM local EO=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for EP,mN in pairs(EO)do
local mO=type(mN)=="table"and tonumber(mN.price)if mO and(not mL or mO>mL)then hZ,mL,mM=EP,mO,mN.title end end
q.bestCrate,q.bestCrateName=hZ and L.key(hZ),hZ q.bestCrateTitle=mM and L.key(mM)or nil return true end function q.rank(EQ)
local ER,ES=pcall(function()return q.arm.rankOf(EQ)end)return(ER and tonumber(ES))or 0 end function q.loadDisc(uY)
if type(uY)~="table"then return end local uZ={}for ET,EU in pairs(uY)do if EU then uZ[W(tostring(ET))]=true end end
q.disc,q.discAt=uZ,z()end function q.fetch()q.discAt=z()local u0=af:FindFirstChild("Remotes")local u1=u0 and u0:FindFirstChild("GetSquishiesDiscovered")
if not u1 then return end local EW,EX=pcall(function()return u1:InvokeServer()end)if EW then q.loadDisc(EX)end
end function q.scanWax()local mP={}local u2=c.plot and c.plot:FindFirstChild("WaxStations")if u2 then for KX,u3 in ipairs(u2:GetChildren())do
local u4=u3:FindFirstChild("SquishyPlaceHolder")if u4 and u3:GetAttribute("HasSquishy")then for KY,u5 in ipairs(u4:GetChildren())do if u5:IsA("Model")then mP[W(u5 .Name)]=true end end
end end end for u6,EY in pairs(q.placedAt)do if z()-EY<20 then mP[u6]=true else q.placedAt[u6]=nil end end q.waxing=mP
end function q.compute()local u7,mQ,mR={},0,0 if q.disc then for mS in pairs(q.roll or{})do if not q.disc[mS]then
if q.waxing[mS]then mR=mR+1 else u7[mS],mQ=true,mQ+1 end end end end q.need,q.nNeed,q.nWax=u7,mQ,mR local u8,mT={},e.Best or 0
local mU=(mT==4)and q.stackMin or nil for EZ,u9 in ipairs(q.order)do if(mU and u9 .inc>mU)or(not mU and EZ<=(mT==4 and 1 or mT))then u8[u9 .k]=true end
end q.best=u8 end function q.readStack()q.stackAt=z()local u_=af:FindFirstChild("Remotes")local va=u_ and u_:FindFirstChild("EditStack")
if not va then return end local E0,du=pcall(function()return va:InvokeServer("State",nil)end)if not(E0 and type(du)=="table"and type(du.state)=="table"and type(du.state.entries)=="table")then return end
local h0 for KZ,vb in ipairs(du.state.entries)do local fg=type(vb)=="table"and q.si and q.si[tostring(vb.name)]
if type(fg)=="table"and type(fg.income)=="number"and not fg.incomeType and(not h0 or fg.income<h0)then h0=fg.income end
end q.stackMin=h0 q.stackFull=#du.state.entries>=(tonumber(du.state.capacity)or 100)end function q.want(mV)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[mV]then return true end elseif e.Targets[mV]then return true end return e.AutoIndex==true and q.need[mV]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(E1)local fh=W(E1)q.placedAt[fh],q.waxing[fh]=z(),true if q.need[fh]then q.need[fh],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
C(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(al(fh)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fi,fj={},{}for E2,E3 in pairs(q.roll or{})do if q.want(E2)then fi[E3]=true end end
for vc,mW in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(vc)or(type(mW)=="table"and type(mW.title)=="string"and L.wanted(mW.title))then fj[vc]=true end
end if not next(fi)and not next(fj)then return nil end if q.arm and type(q.arm.encode)=="function"then local E4,vd=pcall(q.arm.encode,{rarities={},butters=fi,crates=fj,index=false})
if E4 and type(vd)=="string"then return vd end end local function ve(E5)local h1={}for E6 in pairs(E5)do h1[#h1+1]=E6 end table.sort(h1)return table.concat(h1,",")end
local fk="adv:"if next(fi)then fk=fk..";butters:"..ve(fi)end if next(fj)then fk=fk..";crates:"..ve(fj)end return fk
end function q.canon(E7)local h2={}for vf in tostring(E7 or""):gmatch("[^;]+")do local mX,vg=vf:match("^(%a+):(.*)$")
if not mX then mX,vg="r",vf:gsub("^adv:","")end for E8 in vg:gmatch("[^,]+")do h2[#h2+1]=mX.."="..E8 end end table.sort(h2)
return table.concat(h2,"|")end function q.sync(E9)if J:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cJ=q.rulesNow()if not cJ or#cJ>1900 then return end if q.canon(J:GetAttribute("AutoRollRules"))==q.canon(cJ)then q.fails=0 return end
if not E9 and z()-q.sentAt<4 then return end local vh=af:FindFirstChild("Remotes")local vi=vh and vh:FindFirstChild("AutoRollAction")
if not vi then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 C("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()D.replaying=true pcall(function()vi:FireServer("Rules",cJ)end)D.replaying=false e.ARrules=cJ
local h3,h4=0,0 for K0 in(cJ:match("butters:([^;]*)")or""):gmatch("[^,]+")do h3=h3+1 end for K1 in(cJ:match("crates:([^;]*)")or""):gmatch("[^,]+")do h4=h4+1 end
local vj=h3 .."/"..h4 if q.told~=vj then q.told=vj C(("auto roll now stops on %d butters and %d crates"):format(h3,h4))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aQ={}if e.AutoIndex then aQ[#aQ+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fl=0 for K2 in pairs(q.best)do fl=fl+1 end
aQ[#aQ+1]=fl==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fl,fl==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aQ[#aQ+1]="best: "..al(q.order[1].k)end if e.BestCrate and q.bestCrateName then aQ[#aQ+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aQ[#aQ+1]="shower: "..O.got end q.msg=#aQ>0 and table.concat(aQ," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(E_)q.feed[#q.feed+1]=os.date("%H:%M ")..E_ if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vk,ax,h5)if vk~="Effect"then q.feedAdd(tostring(vk)..(ax~=nil and(": "..tostring(ax):sub(1,80))or""))
return end if ax~="ShowerTaken"and ax~="GoalPoint"then q.feedAdd(tostring(ax))end if ax=="Shower"then O.add(h5)return end
if ax=="ShowerTaken"then O.gone(h5)return end if ax=="ShowerClear"then O.drops={}return end if ax=="WaxGlow"then
local mY=type(h5)=="table"and tonumber(h5 .SnapAt)if mY then q.snapAt=mY C(("ADMIN: every wax finishes in %ds%s"):format(math.floor(mY-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end ax=tostring(ax)cf("Admin "..ax)if ax~="GoalPoint"and z()-(q.heard[ax]or-100)>30 then q.heard[ax]=z()
C("ADMIN: "..ax)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(mZ)if type(mZ)~="table"or type(mZ.Pieces)~="table"then return end
for K3,aZ in pairs(mZ.Pieces)do if type(aZ)=="table"and aZ.Id~=nil and aZ.Position~=nil then O.drops[aZ.Id]={id=aZ.Id,butter=tostring(aZ.Butter or"?"),rar=tostring(aZ.Rarity or"?"),star=aZ.Star==true,
pos=aZ.Position,opens=tonumber(aZ.OpensAt)or 0,ends=tonumber(aZ.ExpiresAt)or 0}end end end function O.gone(fm)
if type(fm)~="table"or fm.Id==nil then return end O.drops[fm.Id]=nil if tonumber(fm.UserId)==o.uid then O.mine=fm.Id end
end function O.pick()local m0=o.srv()local m1,vl for vm,cK in pairs(O.drops)do if m0>=cK.ends-0.3 then O.drops[vm]=nil
elseif m0>=cK.opens-0.2 and(O.tried[vm]or 0)<3 then local vn=(aN(cK.butter)and 1e6 or 0)+(cK.star and 1e5 or 0)+q.rank(cK.rar)*100-(cK.ends-m0)
if not m1 or vn>vl then m1,vl=cK,vn end end end return m1 end function O.due()return e.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aR,m2=O.pick(),aq()if not(aR and m2)then return end O.tried[aR.id]=(O.tried[aR.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aC(m2,aR.pos+Vector3 .new(0,c6(m2)+0.5,0))ao(function()return O.mine==aR.id or ac()~=nil or not O.drops[aR.id]end,1.5)
if O.mine==aR.id or ac()then O.got,O.drops[aR.id]=O.got+1,nil C(("GRABBED %s [%s]%s from the admin shower"):format(al(W(aR.butter)),aR.rar,aR.star and" (star)"or""))
elseif not O.drops[aR.id]then O.miss=O.miss+1 end end local fn local function vo()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 C("trying again after being stopped for 5 minutes")fn(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not aq()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bB(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local m3,vp=f3()
local h6=ac()if h6 then local dv=al(W(h6))if not aN(h6)then local m4=(V.gift and W(V.gift)==W(h6)and z()-V.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(dv,m4),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(dv,m4),"bad"end return"sell",("selling %s (%s)"):format(dv,m4),"warn"
end if m3<1 then return nil,("holding %s - 0 free stations"):format(dv),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(dv),"wait"end
return"place",("waxing %s (%d free)"):format(dv,m3),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local m5=c.plot:FindFirstChild("CrateStand")if m5 then for K4,fo in ipairs(m5:GetDescendants())do
if fo:IsA("ProximityPrompt")and fo.Enabled and kl(fo)then local bs=fo.ObjectText if bs==""then bs=cZ(m5,"TitleLabel")or""end
if bs~=""and L.wanted(bs)then local Fa=fZ(bs):gsub("crate$","")local vq for vr in pairs(ad.members)do if fZ(vr)==Fa then vq=vr end end
j.waiting,j.at,j.title,j.prompt=true,z(),bs,fo j.data={name=(bs:gsub("%s","")),rarity=vq,title=bs}C(bs.." found waiting on your stand")
end break end end end end local vs=L.wanted(j.data and j.data.name)or L.wanted(j.title)if e.Crates and(j.on or j.waiting)and vs then
local a0=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a0),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 C("could not press the "..a0 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a0),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a0),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a0,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a0),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a0,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a0,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil C("trying the "..a0 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a0),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a0,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not vs then local vt=j.title..tostring(j.rolledAt)if j.told~=vt then j.told=vt C(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if m3<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(vp,vp),"wait"
end local m6=pb()if not m6 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dw=ce()
if dw and qB(dw.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dw.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dw.name),"bad"end if not qU()then return nil,("%s rolled - waiting for it to land on the stand"):format(dw.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dw.name),"ok"end local bW=j3()if bW.state~="match"then
c.matchSince=nil if bW.state=="skip"and not m6 .Enabled then return nil,bW.text.." (sold out)","idle"end return nil,bW.text,bW.level
end if not m6 .Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local fp=z()
if fp<c.noCashUntil then local vu,Fb=d8()if vu then return nil,("cash short: have $%s, price ~$%s"):format(aE(vu),aE(Fb)),"bad"end
return nil,(d8()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aE(be()),math.ceil(c.noCashUntil-fp)),d8()and"bad"or"wait"end if fp-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or fp local vv=fp-c.matchSince if vv<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bW.shown,vv),"ok"end
return"buy",("buying %s via %s"):format(bW.shown,bW.src),"ok"end d.DEPTH=11 function d.pinTick()local vw=d.hold
if not vw then return end local m7=J.Character local m8=m7 and m7:FindFirstChild("HumanoidRootPart")if not m8 then return end
m8 .CFrame=vw m8 .AssemblyLinearVelocity=Vector3 .new(0,0,0)for K5,h7 in ipairs(m7:GetChildren())do if h7:IsA("BasePart")and h7 .CanCollide then d.noclip[h7]=true h7 .CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(Fc,vx)d.hold=Fc if vx then d.surface=vx end end function d.unpin(Fd)
if not d.hold then return end d.hold=nil for vy in pairs(d.noclip)do pcall(function()if vy.Parent then vy.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local vz=aq()if vz and d.surface and not Fd then aC(vz,d.surface.Position,d.surface.Position+d.surface.LookVector)
ag(0.1)end end function d.home()local bt,vA=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),aq()
if not(bt and bt:IsA("BasePart")and vA)then return nil end local vB=o1()or bt.Position local h8=Vector3 .new(vB.X-bt.Position.X,0,vB.Z-bt.Position.Z)
h8=h8 .Magnitude>0.1 and h8 .Unit or Vector3 .new(0,0,1)local h9=bt.Position+h8*6 local vC=gE(h9 .X,bt.Position.Y,h9 .Z,{bt})
return CFrame.new(h9 .X,(vC and vC.Y or bt.Position.Y)+c6(vA),h9 .Z)end function d.ground(Fe,vD,Ff)local m9,m_={J.Character},nil
for K6=1,12 do local na=RaycastParams.new()na.FilterType=Enum.RaycastFilterType.Exclude na.FilterDescendantsInstances=m9
local h_=ai:Raycast(Vector3 .new(Fe,vD,Ff),Vector3 .new(0,-2000,0),na)if not h_ then break end m_,vD=h_,h_.Position.Y-0.05
m9[#m9+1]=h_.Instance end return m_ and m_.Position.Y end function d.parkHome()local nb=d.home()if not nb then return false end
local dx=nb.Position local Fg=d.ground(dx.X,dx.Y+300,dx.Z)or(dx.Y-3)d.pin(CFrame.new(dx.X,Fg-8,dx.Z),nb)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(ia)e.Ghost,e.GhostHelps=ia==2,ia==1 if ia<2 then task.spawn(function()while c.busy do ag(0.1)end
if d.ghostMode()<2 and d.hold and not E.home then pcall(d.unpin)end end)end d.paintGhost()C("ghost: "..d.GHOST[ia][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local Fh=aq()if not Fh or F.seat()then return end d.parkHome()end F.n,F.fails,F.nextAt,F.msg,F.lost=0,0,0,"no campfire right now",0
function F.uid()local Fi,Fj=pcall(function()return J.UserId end)return Fi and Fj or 0 end function F.seat()local vE=ai:FindFirstChild("NightSeats")
if vE then for K7,nc in ipairs(vE:GetChildren())do if nc.Name=="LogSeat"and nc:GetAttribute("Occupant")==F.uid()then return nc end
end end local vF=J.Character local vG=vF and vF:FindFirstChildOfClass("Humanoid")local nd=vG and vG.SeatPart return(nd and nd.Name=="LogSeat")and nd or nil
end function F.logs()local vH=ai:FindFirstChild("NightSeats")local ne,nf={},{}for K8,cL in ipairs(vH and vH:GetChildren()or{})do
local ng=cL.Name=="LogSeat"and cL:FindFirstChildOfClass("ProximityPrompt")if ng then ne[#ne+1]=cL local nh=cL:GetAttribute("Occupant")
local Fk=(nh~=nil and nh~=0 and nh~="")or(cL:IsA("Seat")and cL.Occupant~=nil)if not Fk and ng.Enabled then nf[#nf+1]={st=cL,p=ng}end
end end return ne,nf end function F.due()if not(e.Campfire and c.running)or z()<F.nextAt then return false end
local Fl=ai:FindFirstChild("NightSeats")if not Fl then if F.wasOn then F.wasOn,F.fails,F.lost=false,0,0 end F.msg="no campfire now (weather events)"
return false end F.wasOn=true if F.seat()then F.sitAt=F.sitAt or z()F.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if F.sitAt then F.lost,F.sitAt=F.lost+1,nil if F.lost>=4 then F.nextAt,F.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
C(F.msg)return false end end return true end function F.sit()local Fm,fq=ai:FindFirstChild("NightSeats"),aq()
if not Fm or not fq then return end local ib,fr=F.logs()if#ib==0 then local Fn=ai:FindFirstChild("NightCampfire")
local Fo,ni=pcall(function()return Fn:GetPivot().Position end)if not Fo then F.nextAt,F.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()J:RequestStreamAroundAsync(ni,3)end)aC(fq,ni+Vector3 .new(0,3,9),ni)ao(function()ib,fr=F.logs()return#ib>0 end,6)
if#ib==0 then F.nextAt,F.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local vI=fq.HumanoidRootPart.Position
if#fr==0 then F.nextAt,F.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fr,function(Fp,Fq)return(Fp.st.Position-vI).Magnitude<(Fq.st.Position-vI).Magnitude end)
local nj,Fr=fr[1].st,fr[1].p d.unpin(true)local dy=nj:IsA("BasePart")and nj.CFrame or CFrame.new(nj:GetPivot().Position)
aC(fq,dy.Position+dy.LookVector*2+Vector3 .new(0,2.5,0),dy.Position)ag(0.25)local Fs=eb(Fr,function()return F.seat()~=nil end)
if not Fs then aC(fq,dy.Position+Vector3 .new(0,2,0),dy.Position+dy.LookVector)ao(function()return F.seat()~=nil end,1.5)
end if F.seat()then F.n,F.fails,F.sitAt=F.n+1,0,z()C(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else F.fails=F.fails+1 F.nextAt=z()+(F.fails>=3 and 60 or 5)F.msg="could not sit at the campfire"..(F.fails>=3 and" - trying again in a minute"or"")
if F.fails<=3 then C(F.msg)end end end H.msg,H.nextAt,H.at,H.pulls,H.claims,H.pullLeft,H.collectLeft,H.events="",0,0,0,0,0,0,{}
function H.refresh()H.at=z()local nk=af:FindFirstChild("Remotes")if not nk then return end local fs,nl,dz=0,0,{}
local Ft,vJ=pcall(function()return nk.ClanRequest:InvokeServer("state")end)local vK=Ft and type(vJ)=="table"and vJ.tasks
for K9,bX in ipairs(vK and vK.list or{})do if not bX.done and bX.kind=="pull"then fs=math.max(fs,(bX.goal or 0)-(bX.progress or 0))end
if not bX.done then dz[#dz+1]=("%s %d/%d"):format(tostring(bX.text),bX.progress or 0,bX.goal or 0)end end H.events={}
for K_,dA in ipairs(nk:GetChildren())do if dA:IsA("RemoteFunction")and dA.Name:match("^%u%a+Action$")and dA.Name~="CrateAction"and dA.Name~="AutoRollAction"then
local Fu,ft=pcall(function()return dA:InvokeServer("state")end)if Fu and type(ft)=="table"and ft.live==true and type(ft.quests)=="table"then
H.events[#H.events+1]={r=dA,st=ft}for La,aS in ipairs(ft.quests)do if not aS.done and aS.kind=="pull"then fs=math.max(fs,(aS.goal or 0)-(aS.progress or 0))end
if not aS.done and aS.kind=="collect"then nl=math.max(nl,(aS.goal or 0)-(aS.progress or 0))end if not aS.done then dz[#dz+1]=("%s %d/%d"):format(tostring(aS.text),aS.progress or 0,aS.goal or 0)end
end end end end H.pullLeft,H.collectLeft=fs,nl H.msg=#dz>0 and("open: "..table.concat(dz,", "))or"all quests done for today"
end function H.claim()for Lb,fu in ipairs(H.events)do local vL=fu.r.Name:gsub("Action$","")for Lc,dB in ipairs(fu.st.quests)do
if dB.done and not dB.claimed then local Fv,vM=pcall(function()return fu.r:InvokeServer("claimQuest",dB.id)end)
if Fv and not(type(vM)=="table"and vM.ok==false)then H.claims=H.claims+1 C(("CLAIMED %s quest: %s (+%s)"):format(vL,tostring(dB.text),tostring(dB.points or dB.treats or"?")))
end ag(0.4)end end if fu.st.bonusReady==true then local Fw=pcall(function()return fu.r:InvokeServer("claimBonus")end)
if Fw then C(("CLAIMED %s daily quest bonus"):format(vL))end ag(0.4)end end end function H.tick()if not(e.Quests and c.running)then
if H.arPaused then H.resume("quests switched off")end return end if z()-H.at<(H.pullLeft>0 and 20 or 90)then return end
H.refresh()pcall(H.claim)if H.pullLeft<=0 and H.arPaused then H.resume("lever quests done")end end function H.pullDue()
return e.Quests and c.running and H.pullLeft>0 and z()>=H.nextAt and not D.busy end function H.lever()local vN=c.plot and c.plot:FindFirstChild("Lever")
local nm=vN and vN:FindFirstChild("Wheel")return nm and nm:FindFirstChildWhichIsA("ProximityPrompt"),nm end function H.resume(Fx)
H.arPaused=false if H.arWas then H.arWas=false e.AutoRoll=true task.spawn(D.apply,Fx)end end function H.pull()
local ic,nn=H.lever()if not ic or not nn or not nn:IsA("BasePart")then H.nextAt,H.msg=z()+300,"your lever was not found"return end
if not H.arPaused then H.arPaused=true H.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then H.nextAt=z()+30 return end end C(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(H.pullLeft))
end if not ic.Enabled then H.nextAt=z()+1 return end cl(nn,ic)H.asked=nil qq(ic)H.pulls=H.pulls+1 H.pullLeft=H.pullLeft-1
ag(0.6)if H.asked then H.nextAt=z()+600 C(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(H.asked)))
H.resume("a butter the game wants kept is on the pad")return end H.nextAt=z()+2.5 if H.pullLeft<=0 then H.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bY,Fy)local no=bY:GetAttribute("PourOwner")
if type(no)~="number"or no==o.uid or not bY:GetAttribute("HasSquishy")then return false end if bY:GetAttribute("PourLong")~=true or bY:GetAttribute("PourFull")==true then return false end
local np=bY:GetAttribute("PourId")if np==nil or E.skip[np]then return false end local vO,nq,Fz=bY:GetAttribute("Helpers"),0,tostring(o.uid)
if type(vO)=="string"then for FA in vO:gmatch("[^,%s]+")do nq=nq+1 if FA==Fz then return false end end end if nq>=6 then return false end
local ie=A.left(bY)if not ie then local vP=tonumber(bY:GetAttribute("PourEnd"))ie=vP and(vP-Fy)end if not ie or ie<=75 then return false end
local nr=game:GetService("Players"):GetPlayerByUserId(no)if not nr or nr:GetAttribute("WaxHelpOff")==true then return false end
return true,nr,np end function E.list()local ns,FB={},o.srv()local vQ=ai:FindFirstChild("Plots")for Ld,vR in ipairs(vQ and vQ:GetChildren()or{})do
local vS=vR~=c.plot and vR:FindFirstChild("WaxStations")for Le,nt in ipairs(vS and vS:GetChildren()or{})do local FC,FD,FE=E.can(nt,FB)
local nu=FC and nt:FindFirstChild("SquishyPlaceHolder")if nu and nu:IsA("BasePart")then ns[#ns+1]={st=nt,p=FD,id=FE,part=nu}end
end end return ns end function E.due()if e.Help and c.running and z()>=E.nextAt and(d.mem or 0)>900 then E.nextAt,E.msg=z()+30,("paused - phone memory %d MB (helps load other bases)"):format(d.mem)
return false end return e.Help and c.running and z()>=E.nextAt end function E.skipIt(vT,vU)E.skip[vT],E.skipN=vU,E.skipN+1
if E.skipN>600 then E.skip,E.skipN,E.tries={[vT]=vU},1,{}end end function E.goHome()local ig,bZ=aq(),E.home E.home=nil
if not(ig and bZ)then return end if e.Ghost and not F.seat()then d.unpin(true)if not d.parkHome()then pcall(aC,ig,bZ.Position,bZ.Position+bZ.LookVector)end
elseif d.hold or(ig.HumanoidRootPart.Position-bZ.Position).Magnitude>20 then d.unpin(true)pcall(aC,ig,bZ.Position,bZ.Position+bZ.LookVector)
end end function E.step()local nv,fv=E.list(),aq()if#nv==0 or not fv then E.nextAt=z()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local vV=fv.HumanoidRootPart local vW=vV.Position table.sort(nv,function(FF,FG)return(FF.part.Position-vW).Magnitude<(FG.part.Position-vW).Magnitude end)
local a1=nv[1]E.home=E.home or(d.hold and d.surface)or vV.CFrame local b0=a1 .part local fw=(b0 .Position+a1 .st:GetPivot().Position)/2
local ih=E.tries[a1 .id]or 0 if(e.Ghost or e.GhostHelps)and ih==0 and not F.seat()then d.pin(b0 .CFrame,E.home)
else d.unpin(true)local nw=ih==0 and gE(fw.X,b0 .Position.Y,fw.Z,{b0})if nw and math.abs(nw.Y-b0 .Position.Y)<8 then
aC(fv,Vector3 .new(fw.X,nw.Y+c6(fv),fw.Z),b0 .Position)else aC(fv,b0 .Position+Vector3 .new(0,b0 .Size.Y/2+3,0),fw)
end end ag(0.3)local fy=af:FindFirstChild("Remotes")fy=fy and fy:FindFirstChild("ClanRequest")if not fy then E.nextAt,E.msg=z()+60,"the game's help remote is missing"return end
local ii,bu=pcall(function()return fy:InvokeServer("help",a1 .st:GetAttribute("PourOwner"),tonumber(a1 .st.Name))end)
if ii and type(bu)=="table"and bu.ok then E.n,E.fails=E.n+1,0 E.skipIt(a1 .id,"helped")C(("HELPED %s's wax (station %s)"):format(a1 .p.DisplayName,a1 .st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif ii and type(bu)=="table"and tostring(bu.reason or""):lower():find("walk up",1,true)and ih<2 then
E.tries[a1 .id]=ih+1 E.nextAt=z()+0.3 elseif ii and type(bu)=="table"and tostring(bu.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=z()+1.6 else local vX=(ii and type(bu)=="table"and tostring(bu.reason or"refused"))or("error: "..tostring(bu))
E.skipIt(a1 .id,vX)E.fails=E.fails+1 if E.fails<=3 then C(("help refused for %s's wax: %s"):format(a1 .p.DisplayName,vX))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,z()+1.2)end function E.onCall(bv)if not e.HelpGuild or type(bv)~="table"or bv.p~="help"or bv.mine or bv.u==o.uid or not bv.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fz=af:FindFirstChild("Remotes")
fz=fz and fz:FindFirstChild("ClanRequest")if not fz then return end local vY,fA=pcall(function()return fz:InvokeServer("callHelp",bv.u)end)
local vZ=tostring(bv.n or bv.un or bv.u)if vY and type(fA)=="table"and fA.ok then E.calls=E.calls+1 C(("HELPED guildmate %s's wax from here (their call)"):format(vZ))
else C(("guild call from %s: %s"):format(vZ,(vY and type(fA)=="table"and tostring(fA.reason or"refused"))or tostring(fA)))
end end)end local function as(FH,v0,...)if c.busy then return end c.busy,c.busyText=true,FH if d.hold and v0~=E.step then pcall(d.unpin)end
local FI,v1=pcall(v0,...)c.busy,c.busyText=false,""if not FI and v1~=jf then C("ERR "..tostring(v1))end end local function FJ()
if e.Campfire and F.seat()then if j.at and F.tickAt then j.at=j.at+(z()-F.tickAt)end F.tickAt=z()F.due()c.reason,c.level=F.msg,"ok"
return end F.tickAt=nil local aT,FK,FL=vo()c.reason,c.level=FK,FL if aT=="place"then as("waxing...",A.place)elseif aT=="crate"then as("opening crate...",em,true)
elseif aT=="cratesmart"then as("opening crate...",j.smart)elseif aT=="cratewin"then as("opening the crate window...",kn)
elseif aT=="nocrate"then as("discarding crate...",em,false)elseif aT=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aT=="sell"then as("selling...",uP)elseif aT=="buy"then as("buying...",qt,false)elseif not aT and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aT and not c.matchSince and F.due()then as("sitting at the campfire...",F.sit)
elseif not aT and not c.matchSince and H.pullDue()and not ac()and not(ce()and aN(ce().name))then as("pulling the lever for a quest...",H.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(H.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
as("collecting money...",EI)elseif not aT and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not e.Help then
as("coming back...",E.goHome)elseif not c.busy then d.parkTick()end end function fn(ij,FM)if ij==c.running then return end
c.running=ij if not FM then e.AutoStart=ij end if ij then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bB()or c.plot
C("START")else c.reason="stopped"C("STOP")end end do local b1=gp(an.auto)if type(b1)=="string"then b1=b1:gsub("%s+$","")
if b1~=""then c.autoload=b1 local FN=pY(b1)C(FN and("loaded config "..b1)or("config "..b1 .." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local FO={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local nx={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local v2,v3,v4,v5=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if v2 and v3 and v4 and v5 then ae.x,ae.b,ae.m,ae.r=v2,v3,v4,v5 end end)pcall(function()local v6=Enum.Font.RobotoMono if v6 then ae.mono=v6 end end)
local function K(FP,FQ,FR)local FS,ny=pcall(Instance.new,FP)if not FS then c.uiErrs=c.uiErrs+1 return nil end
for FT,FV in pairs(FQ)do if not pcall(function()ny[FT]=FV end)then c.uiErrs=c.uiErrs+1 end end ny.Parent=FR return ny
end local function ab(FW,FX)K("UICorner",{CornerRadius=UDim.new(0,FX or 8)},FW)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(ik,nz)if ik and a.shown[ik]~=nz then a.shown[ik]=nz ik.Text=nz end
end function a.stroke(FY,FZ,F0)return K("UIStroke",{Color=FZ or l.line,Thickness=1,Transparency=F0 or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},FY)
end function a.grad(F1,F2,F3,F4)local F5,v7=pcall(function()return ColorSequence.new(F2,F3)end)if F5 and v7 then return K("UIGradient",{Color=v7,Rotation=F4 or 0},F1)end
end function a.pad(F6,v8,v9,F7,F8)K("UIPadding",{PaddingLeft=UDim.new(0,v8 or 0),PaddingTop=UDim.new(0,v9 or 0),
PaddingRight=UDim.new(0,F7 or v8 or 0),PaddingBottom=UDim.new(0,F8 or v9 or 0)},F6)end function a.list(F9,F_,Ga)
return K("UIListLayout",{Padding=UDim.new(0,F_ or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Ga and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},F9)
end function a.ink(nA)local Gb,Gc=pcall(function()return 0.299*nA.R+0.587*nA.G+0.114*nA.B end)return(Gb and Gc>0.55)and l.ink or l.text
end function a.nextIn(v_)local wa=(a.ord[v_]or 0)+1 a.ord[v_]=wa return wa end local nB=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local wb=nB:FindFirstChild("SABFarmGui")if wb then wb:Destroy()end local nC=K("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},nB)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local il=ai.CurrentCamera.ViewportSize if il.X>100 and il.Y>100 then Q.w=math.clamp(math.floor(il.X*0.48),320,400)
Q.h=math.clamp(math.floor(il.Y*0.86),250,360)end end)a.root=K("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},nC)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local wc=UDim2 .new(1,0,1,0)
local function Lf(wd,we)return UDim2 .new(wd,0,0,0),UDim2 .new(we,(wd+we>0.99)and 0 or-4,1,0)end local function aj(Gd,Ge,fB,Gf,Gg,Gh)
local nD=K("TextButton",{Text=Ge,Position=Gg,Size=Gh,BackgroundColor3=fB,BorderSizePixel=0,Font=ae.b,TextSize=Gf,TextColor3=a.ink(fB),AutoButtonColor=true},Gd)
ab(nD,8)if fB==l.panel2 or fB==l.raise or fB==l.panel then a.stroke(nD,l.line,0.4)end return nD end local function im(Gi,Gj,Gk,Gl,Gm)
local io=K("TextBox",{Text=Gj,PlaceholderText=Gk,Position=Gl,Size=Gm,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},Gi)ab(io,8)a.stroke(io,l.line,0)a.pad(io,9,0,6,0)
return io end local ip=ai.CurrentCamera local function Gn()local Go,iq=pcall(function()return ip and ip.ViewportSize end)
if Go and iq and iq.X>50 and iq.Y>50 then return iq end end local function b2(fC)local nE=Gn()if not(nE and fC and fC.Parent)then return end
local Gp=pcall(function()local ir,wf=fC.AbsolutePosition,fC.AbsoluteSize local nF=70 local wg=math.clamp(ir.X,nF-wf.X,nE.X-nF)
local wh=math.clamp(ir.Y,0,nE.Y-math.min(wf.Y,nF))if math.abs(wg-ir.X)>0.5 or math.abs(wh-ir.Y)>0.5 then fC.Position=UDim2 .new(0,math.floor(wg),0,math.floor(wh))
end end)return Gp end local function is(Gq)local Gr,nG=pcall(function()return Gq.AbsolutePosition end)if Gr and nG then return{math.floor(nG.X),math.floor(nG.Y)}end
end local dC={}c.dragMoved={}local function wi(fD,wj,nH)T(fD.InputBegan:Connect(function(dD)if dD.UserInputType~=Enum.UserInputType.MouseButton1 and dD.UserInputType~=Enum.UserInputType.Touch then return end
local nI={start=dD.Position,from=wj.Position,moved=0,target=wj,input=dD,onDrop=nH}dC[fD],c.dragMoved[fD]=nI,0
local nJ nJ=dD.Changed:Connect(function()if dD.UserInputState==Enum.UserInputState.End and dC[fD]==nI then dC[fD]=nil
if nJ then nJ:Disconnect()end if nH then nH(nI.moved)end end end)end))end T(oK.InputChanged:Connect(function(it)
if it.UserInputType~=Enum.UserInputType.MouseMovement and it.UserInputType~=Enum.UserInputType.Touch then return end
for Gs,ba in pairs(dC)do local nK=ba.target if nK and nK.Parent then local wk,wl=it.Position.X-ba.start.X,it.Position.Y-ba.start.Y
ba.moved=math.max(ba.moved,math.abs(wk)+math.abs(wl))c.dragMoved[Gs]=ba.moved nK.Position=UDim2 .new(ba.from.X.Scale,ba.from.X.Offset+wk,ba.from.Y.Scale,ba.from.Y.Offset+wl)
end end end))T(oK.InputEnded:Connect(function(iu)if iu.UserInputType~=Enum.UserInputType.MouseButton1 and iu.UserInputType~=Enum.UserInputType.Touch then return end
for Gt,iv in pairs(dC)do if iv.input==iu or iu.UserInputType==Enum.UserInputType.MouseButton1 then dC[Gt]=nil
if iv.onDrop then iv.onDrop(iv.moved)end end end end))local function P(Gu,Gv,Gw,Gx,Gy,Gz,GA)return K("TextLabel",{Text=Gv,Position=Gz or UDim2 .new(0,0,0,0),Size=GA or wc,BackgroundTransparency=1,
Font=Gy and ae.b or ae.m,TextSize=Gw,TextColor3=Gx,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Gu)
end function a.row(wm,GB)return K("Frame",{Size=UDim2 .new(1,0,0,GB),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(wm)},wm)end function a.card(wn,wo,wp)local dE=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(wn)},wn)ab(dE,11)a.stroke(dE,l.line,0.25)a.list(dE,5)a.pad(dE,8,8,8,9)
if wo then local nL=a.row(dE,14)K("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},nL)P(nL,wo:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if wp then local GC=P(nL,wp,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
GC.TextXAlignment=Enum.TextXAlignment.Right end end return dE end function a.heading(GD,GE,nM)local nN=a.row(GD,nM and 34 or 22)
P(nN,GE,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if nM then P(nN,nM,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return nN end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(nO)local aL=a.sw[nO]if not aL then return end
local dF=tostring(nO.Text or""):match(":%s*(.-)%s*$")or""local b3=dF~=""and not a.OFF[dF]local nP=not aL.chips and(dF=="ON"or dF=="OFF")
aL.pill.Visible,aL.chip.Visible=nP,not nP if nP then aL.pill.BackgroundColor3=b3 and l.accent or l.panel2 aL.knob.Position=b3 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aL.knob.BackgroundColor3=b3 and l.white or l.dim else aL.chip.Text=dF~=""and dF or"-"aL.chip.BackgroundColor3=b3 and l.accent or l.panel2
aL.chip.TextColor3=b3 and l.ink or l.dim end nO.BackgroundColor3=b3 and l.lit or l.raise if aL.edge then aL.edge.Color=b3 and l.accent or l.line aL.edge.Transparency=b3 and 0.55 or 0.45 end
end function a.switch(wq,GF,GG,fE)local a2=K("TextButton",{Name="Switch",Text=GF,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,fE and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(wq)},wq)
ab(a2,9)local aw={edge=a.stroke(a2,l.line,0.45)}aw.title=P(a2,GG,11,l.text,true,UDim2 .new(0,10,0,fE and 4 or 0),UDim2 .new(1,-100,0,fE and 15 or 28))
aw.title.TextWrapped,aw.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fE then aw.sub=P(a2,fE,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
aw.sub.TextWrapped,aw.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end aw.pill=K("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a2)ab(aw.pill,9)aw.knob=K("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},aw.pill)ab(aw.knob,7)aw.chip=K("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},a2)
ab(aw.chip,9)a.pad(aw.chip,10,0,10,0)K("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},aw.chip)
aw.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a2]=aw T(a2:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a2)end))
a.skin(a2)return a2 end function a.chips(nQ)if a.sw[nQ]then a.sw[nQ].chips=true a.skin(nQ)end end function a.line(GH,GI)
local wr=a.row(GH,15)local ws=K("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=GI or l.dim,
BorderSizePixel=0},wr)ab(ws,3)local nR=P(wr,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))nR.TextWrapped,nR.TextTruncate=false,Enum.TextTruncate.AtEnd
return nR,ws end function a.grow(wt,GJ,GK)local iw=K("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=GJ or 10,TextColor3=GK or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(wt)},wt)
T(iw:GetPropertyChangedSignal("Text"):Connect(function()iw.Visible=iw.Text~=""end))return iw end function a.note(GL,GM)
local wu=a.grow(GL,9,l.dim)wu.Text=GM return wu end function a.actions(GN,wv)local GO=a.row(GN,28)local ww,nS={},#wv
for fF,wx in ipairs(wv)do ww[fF]=aj(GO,wx[1],wx[2]or l.panel2,10,UDim2 .new((fF-1)/nS,fF>1 and 3 or 0,0,0),UDim2 .new(1/nS,(fF>1 and-3 or 0)+(fF<nS and-3 or 0),1,0))
end return table.unpack(ww)end local function M(cM,ix,GP,GQ)a.put(cM,ix and GP or GQ)if not a.sw[cM]and a.lit[cM]~=ix then
a.lit[cM]=ix cM.BackgroundColor3=ix and l.accent or l.panel2 cM.TextColor3=a.ink(cM.BackgroundColor3)end end a.title=K("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)K("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
K("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local nT=K("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(nT,8)a.grad(nT,l.accent,l.accent2,45)local wy=P(nT,"C",16,l.ink,true)wy.Font,wy.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local GR=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))GR.Font=ae.x P(a.title,"butter farm  "..b_,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
end a.pill=K("Frame",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-66,0.5,0),Size=UDim2 .new(0,78,0,22),
BackgroundColor3=l.raise,BorderSizePixel=0},a.title)ab(a.pill,11)a.pillEdge=a.stroke(a.pill,l.line,0.2)a.dot=K("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(0,9,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.pill)
ab(a.dot,4)a.runL=P(a.pill,"STOPPED",9,l.dim,true,UDim2 .new(0,22,0,0),UDim2 .new(1,-26,1,0))a.minB=aj(a.title,"-",l.raise,14,UDim2 .new(1,-60,0.5,-12),UDim2 .new(0,24,0,24))
a.xB=aj(a.title,"X",l.raise,11,UDim2 .new(1,-32,0.5,-12),UDim2 .new(0,24,0,24))a.xB.TextColor3=l.bad a.strip=K("Frame",{Position=UDim2 .new(0,Q.rail+8,0,Q.head+6),Size=UDim2 .new(1,-(Q.rail+16),0,Q.status),
BackgroundColor3=l.raise,BorderSizePixel=0},a.root)ab(a.strip,9)a.stroke(a.strip,l.line,0.3)a.bar=K("Frame",{Size=UDim2 .new(0,3,1,-12),Position=UDim2 .new(0,7,0,6),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
ab(a.bar,2)a.reason=P(a.strip,"starting",10,l.text,false,UDim2 .new(0,16,0,1),UDim2 .new(1,-22,1,-2))a.reason.TextTruncate=Enum.TextTruncate.AtEnd
a.railBg=K("Frame",{Position=UDim2 .new(0,0,0,Q.head),Size=UDim2 .new(0,Q.rail,1,-Q.head),BackgroundColor3=l.panel,
BorderSizePixel=0},a.root)ab(a.railBg,14)K("Frame",{Size=UDim2 .new(1,0,0,14),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
K("Frame",{Size=UDim2 .new(0,14,1,0),Position=UDim2 .new(1,-14,0,0),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
a.tabs=K("Frame",{Position=UDim2 .new(0,0,0,Q.head),Size=UDim2 .new(0,Q.rail,1,-Q.head),BackgroundTransparency=1,
BorderSizePixel=0},a.root)a.railLine=K("Frame",{Size=UDim2 .new(0,1,1,-Q.head),Position=UDim2 .new(0,Q.rail-1,0,Q.head),BackgroundColor3=l.line,
BorderSizePixel=0},a.root)do local GS=a.list(a.tabs,3)pcall(function()GS.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function bw(GT,GU,GV)
local iy=K("TextButton",{Text=GT,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(iy,9)local wz=K("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iy)ab(wz,2)a.tabsAll[#a.tabsAll+1]={b=iy,bar=wz,name=GU,sub=GV}return iy end
a.tabFarm=bw("🏠","Home","what the farm is doing")a.tabRun=bw("🌾","Farm","the buy - wax - collect loop")a.tabBut=bw("🧈","Butters","what gets bought and waxed")
a.tabCrt=bw("📦","Crates","which crates get opened")a.tabPet=bw("🐾","Pets","adopt, wish, fuse")a.tabTeam=bw("👥","Teams","the right pets at the right moment")
a.tabSrv=bw("🤝","Server","helping, campfire, ghost")a.tabAdm=bw("⚡","Admin","admin abuse and its boosts")a.tabSet=bw("⚙","Settings","configs, startup, performance")
local function bx()local nU=K("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(nU,8)a.pad(nU,8,2,10,12)return nU end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bx(),bx(),bx(),bx(),bx(),bx(),bx(),bx(),bx()a.farm.Visible=true
do local fG=a.farm local wA=a.row(fG,34)a.startB=aj(wA,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(wA,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local GW=a.row(fG,44)local function fH(wB,GX,wC)local iz=K("Frame",{Position=UDim2 .new((wB-1)/wC,wB>1 and 2 or 0,0,0),Size=UDim2 .new(1/wC,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},GW)ab(iz,9)a.stroke(iz,l.line,0.3)local iA=P(iz,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iA.Font,iA.TextXAlignment,iA.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local GY=P(iz,GX,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
GY.TextXAlignment=Enum.TextXAlignment.Center return iA end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fH(1,"BOUGHT",5),fH(2,"WAXED",5),fH(3,"SOLD",5),fH(4,"MONEY",5),fH(5,"FREE",5)
local wD=a.card(fG,"Right now")a.info=P(a.row(wD,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(wD,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fI=a.card(fG,"Systems")
a.helpL=a.line(fI,l.info)a.campL=a.line(fI,l.accent2)a.questL=a.line(fI,l.good)a.arL=a.line(fI,l.accent)a.ixL=a.line(fI,nx.Dotonbori)
local wE=a.card(fG,"Activity")a.log=K("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(wE)},wE)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function Lg(GZ,G0)return a.row(G0 or a.farm,GZ)end local am do local nV=a.run
a.heading(nV,"Farm","buy what rolls, wax it, collect the cash")local fJ=a.card(nV,"Loop")a.colT=a.switch(fJ,"COLLECT: ON","Collect cash","step on the collector by itself")
am=a.row(fJ,26)P(am,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=im(am,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(am,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(am,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fJ,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fJ,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fJ,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local nW=a.card(nV,"By hand")
a.buyB,a.plB=a.actions(nW,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(nW,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
am=a.row(nW,28)a.padB=aj(am,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(am,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iB=a.but a.heading(iB,"Butters","what gets bought and waxed")local wF=a.card(iB,"Strategy")a.ixT=a.switch(wF,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(wF,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iB)},iB)a.list(a.butList,5)end do local iC=a.crt a.heading(iC,"Crates","only ticked crates are opened")
local wG=a.card(iC,"Opening")a.crateT=a.switch(wG,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(wG,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iC)},iC)a.list(a.crtList,5)end do local fK=a.pet a.heading(fK,"Pets","adopt, wish, fuse Bigs and Huges")
local fL=a.card(fK,"Automatic")a.pbT=a.switch(fL,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fL,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fL,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fL,10,l.dim)a.note(fL,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local wH=a.card(fK,"The plan","best teams with every pet")a.planInfo=a.grow(wH,10,l.text)a.note(wH,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fK)},fK)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iD=a.srv a.heading(iD,"Server","other players, the campfire, staying hidden")
local nX=a.card(iD,"Helping")a.helpT=a.switch(nX,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(nX,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(nX,l.info)
local wI=a.card(iD,"Campfire")a.campT=a.switch(wI,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(wI,l.accent2)local nY=a.card(iD,"Ghost")a.ghostT=a.switch(nY,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(nY,l.dim)a.note(nY,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fM=a.adm a.heading(fM,"Admin abuse","the show, its boosts and the farm in it")local wJ=a.card(fM,"When")
a.admBig=P(a.row(wJ,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(wJ,14),"",10,l.dim,false)local G1=a.card(fM,"Boosts now")
a.admBoost=a.grow(G1,11,l.text)local nZ=a.card(fM,"What the farm does")a.shT=a.switch(nZ,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(nZ,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(nZ,l.accent)
local wK=a.card(fM,"Show feed")a.admFeed=K("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(wK)},wK)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cN=a.set a.heading(cN,"Settings","kept on your phone, per config")
local iE=a.card(cN,"Config")am=a.row(iE,28)a.cfgName=im(am,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=aj(am,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=aj(am,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
am=a.row(iE,26)a.cfgPrev=aj(am,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=aj(am,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=aj(am,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iE,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iE,10,l.dim)local n0=a.card(cN,"Starting")a.startT=a.switch(n0,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(n0,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(n0,9,l.dim)local n1=a.card(cN,"If the game drops me")
a.rejT=a.switch(n1,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(n1,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(n1,9,l.dim)local by=a.card(cN,"Performance")a.pfCalm=a.switch(by,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(by,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(by,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(by,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(by,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(by,"STOP 3D: OFF","Stop 3D","blank the world behind this window")am=a.row(by,28)P(am,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=im(am,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(am,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=aj(am,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(by,l.good)a.note(by,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local G2=a.card(cN,"Your game passes","read from the game")a.passInfo=a.grow(G2,10,l.text)local G3=a.card(cN,"About")
a.note(G3,"CHURN "..b_.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for Lh,G4 in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(G4)end local wL=K("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},nB)
a.tgRoot=K("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},wL)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=K("TextButton",{Text="C",Size=wc,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=K("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=K("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fN=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fN][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fN][2]
a.tgGhost.BackgroundColor3=fN==2 and l.accent or(fN==1 and l.warn or l.panel)a.tgGhost.TextColor3=fN>0 and l.ink or l.dim
end end local bz={built=false,boxes={},at=0}function a.check(iF,n2)iF.Text=n2 and"✓"or""iF.BackgroundColor3=n2 and l.accent or l.bg
iF.TextColor3=l.ink local n3=iF.Parent if n3 and n3:IsA("TextButton")then n3 .BackgroundColor3=n2 and l.lit or l.raise end
end local function wM(wN,wO)e.Targets[wN]=wO or nil local wP=bz.boxes[wN]if wP then a.check(wP,wO)end end local function n4()
for G5,G6 in pairs(bz.boxes)do a.check(G6,e.Targets[G5]==true)end end function a.tickBox(G7)local n5=K("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},G7)ab(n5,6)
a.stroke(n5,l.line,0)return n5 end local fO local function G8()local G9=a.card(a.butList,"Butter list")local n6=a.row(G9,26)
a.butInfo=P(n6,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local G_=aj(n6,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Ha=aj(n6,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))G_.MouseButton1Click:Connect(function()
for Hb in pairs(e.Targets)do e.Targets[Hb]=nil end n4()end)Ha.MouseButton1Click:Connect(function()ad.at=0 jP()
fO(true)end)end fO=function(Hc)if not jP()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bz.built and not Hc and bz.at==ad.at then return end for Li,iG in ipairs(a.butList:GetChildren())do
if iG:IsA("Frame")or iG:IsA("TextButton")or iG:IsA("TextLabel")then iG:Destroy()end end bz.boxes,a.butEmpty={},nil
G8()for Lj,iH in ipairs(ad.rarOrder)do local n7=nx[iH]or l.text local cO=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cO,11)a.stroke(cO,n7,0.7)a.list(cO,4)a.pad(cO,7,7,7,8)
local n8=a.row(cO,22)K("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=n7,BorderSizePixel=0},n8)
local Hd=P(n8,iH:upper(),11,n7,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))Hd.Font=ae.x local He=aj(n8,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local Hf=iH He.MouseButton1Click:Connect(function()local wQ=ad.members[Hf]or{}local wR=false for Lk,Hg in ipairs(wQ)do if not e.Targets[Hg]then wR=true break end end
for Ll,Hh in ipairs(wQ)do wM(Hh,wR)end end)for Lm,n9 in ipairs(ad.members[iH]or{})do local iI=K("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cO)},cO)ab(iI,8)local wS=P(iI,al(n9),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
wS.TextWrapped,wS.TextTruncate=false,Enum.TextTruncate.AtEnd local wT=a.tickBox(iI)bz.boxes[n9]=wT local wU=n9
local function wV()wM(wU,not e.Targets[wU])end iI.MouseButton1Click:Connect(wV)wT.MouseButton1Click:Connect(wV)
end end n4()bz.built,bz.at=true,ad.at end function L.paint()for Hi,Hj in pairs(L.boxes)do a.check(Hj,e.CrateTicks[Hi]==true)end
if a.crtInfo then local n_,oa=0,0 for Ln in pairs(L.boxes)do n_=n_+1 end for Lo,Hk in pairs(e.CrateTicks)do if Hk then oa=oa+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(n_,oa))end if a.crateT then M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for Lp,iJ in ipairs(a.crtList:GetChildren())do if iJ:IsA("Frame")or iJ:IsA("TextButton")or iJ:IsA("TextLabel")then iJ:Destroy()end
end L.boxes={}local ob=a.card(a.crtList,"All of them","worst first")local oc=a.row(ob,26)a.crtInfo=P(oc,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local Hl=aj(oc,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local Hm=aj(oc,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(Hl.MouseButton1Click:Connect(function()e.CrateTicks={}L.paint()end))T(Hm.MouseButton1Click:Connect(function()L.build()end))
for Lq,bA in ipairs(L.list())do local wW=nx[bA.rar or""]or l.text local dG=K("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(ob)},ob)ab(dG,8)K("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=wW,BorderSizePixel=0},dG)
local wX=P(dG,(bA.title or bA.name)..(bA.guess and"  (?)"or""),11,wW,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
wX.TextWrapped,wX.TextTruncate=false,Enum.TextTruncate.AtEnd local Hn=P(dG,bA.price and("$"..aE(bA.price))or(bA.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Hn.TextXAlignment=Enum.TextXAlignment.Right local wY=a.tickBox(dG)L.boxes[bA.k]=wY local wZ=bA.k local function w0()
e.CrateTicks[wZ]=(not e.CrateTicks[wZ])or nil L.paint()end T(dG.MouseButton1Click:Connect(w0))T(wY.MouseButton1Click:Connect(w0))
end L.built=L.at L.paint()end local w1="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a3(cP)w1=cP for Ho,od in ipairs(a.tabKeys)do a[od].Visible=(od==cP)local iK=a.tabsAll[Ho]if iK then
local oe=od==cP iK.b.BackgroundTransparency,iK.b.TextTransparency,iK.bar.Visible=oe and 0 or 1,oe and 0 or 0.45,oe
end end if cP=="pet"and not o.built then pcall(o.build)end if cP=="team"and not A.built then pcall(A.build)end
if cP=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cP=="but"then fO(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(of,w2,w3,w4)if w4 then of.Text=w4 end of.BackgroundColor3=w2 and w3 or l.bg of.TextColor3=w2 and a.ink(w3)or l.dim
end function o.paintRow(w5)local cQ=o.rows and o.rows[w5]if not cQ then return end local cR=e.Pets[w5]or{}local w6=tonumber(cR.f)==-1
a.flag(cQ.b,cR.b,l.good)a.flag(cQ.g,cR.g,l.accent,cR.g and"BIG"or"ANY")a.flag(cQ.w,cR.w,l.warn)a.flag(cQ.f,not w6,l.good,w6 and"KEEP"or"AUTO")
if cQ.row then cQ.row.BackgroundColor3=(cR.b or cR.w)and l.lit or l.raise end end function o.flag(og,iL)local bc=e.Pets[og]or{}
if iL=="f"then bc.f=tonumber(bc.f)~=-1 and-1 or nil elseif bc[iL]then bc[iL]=nil else bc[iL]=true end e.Pets[og]=(bc.b or bc.g or bc.w or bc.f)and bc or nil
o.paintRow(og)end function o.paintAll()for Hp in pairs(o.rows or{})do o.paintRow(Hp)end if a.pbT then M(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(Hq)local w7=y.dreamT if not w7 then return"working the plan out..."end local Hr,Hs=y.needFor(""),y.needFor("Big")
local cS={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(Hr,Hs,y.slots())}for Lr,w8 in ipairs(y.dreamTeams or{})do cS[#cS+1]=w8 .team:upper()..": "..table.concat(w8 .names,", ")end
local iM,iN,iO=0,0,0 for w9,w_ in pairs(w7)do local xa,Ht=y.have(w9,Hq)local Ls,Hu=y.goal(w9)iM=iM+math.max(0,w_.Huge-xa.Huge)
iN=iN+math.max(0,w_.Big-xa.Big)iO=iO+math.max(0,Hu-Ht)end cS[#cS+1]=(iM+iN+iO==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(iM,iN,iO)if y.fuseMsg~=""then cS[#cS+1]=y.fuseMsg end
return table.concat(cS,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local oh=o.wishes()local dH=o.data()for iP,oi in pairs(o.rows)do local xb=y.status(iP,dH)oi.desc.Text=(oh[iP]and("wishing %dm | "):format(math.ceil(oh[iP]/60))or"")..(xb and(xb.." | ")or"")..oi.boostText
oi.desc.TextColor3=oh[iP]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dH))end local xc=tonumber(J:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dH and#(dH.pets or{})or 0,dH and tonumber(dH.maxOwned)or 60,
aE(o.money()),xc>0 and(" | free wishes "..xc)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local iQ=o.info()for Lt,iR in ipairs(a.petList:GetChildren())do if iR:IsA("Frame")or iR:IsA("TextLabel")or iR:IsA("TextButton")then iR:Destroy()end
end o.rows={}if not iQ then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dI={}for Lu,xd in ipairs(o.order())do local oj=iQ.Pets[xd].rarity or"?"dI[oj]=dI[oj]or{}
table.insert(dI[oj],xd)end local dJ={}for Lv,xe in ipairs(iQ.Rarities or{})do if dI[xe]then dJ[#dJ+1]=xe end end
for xf in pairs(dI)do if not table.find(dJ,xf)then dJ[#dJ+1]=xf end end for Lw,ol in ipairs(dJ)do local iS=o.RC[ol]or l.text
local cT=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cT,11)a.stroke(cT,iS,0.7)a.list(cT,4)a.pad(cT,7,7,7,8)local xg=a.row(cT,18)K("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=iS,BorderSizePixel=0},xg)
local Hv=P(xg,ol:upper(),11,iS,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Hv.Font=ae.x for Lx,iT in ipairs(dI[ol])do
local fP=K("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cT)},cT)
ab(fP,8)local om=P(fP,o.nice(iT),11,iS,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))om.TextWrapped,om.TextTruncate=false,Enum.TextTruncate.AtEnd
local Hw,Hx=pcall(function()return iQ.describe(iT)end)local xh=Hw and tostring(Hx)or""local oo=P(fP,xh,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oo.TextYAlignment,oo.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function iU(Hy,Hz,HA)
local xi=aj(fP,Hy,l.bg,8,UDim2 .new(1,Hz,0,5),UDim2 .new(0,HA,0,22))xi.AutoButtonColor=true return xi end local xj,xk,xl,xm=iU("BUY",-164,30),iU("ANY",-131,30),iU("WISH",-98,34),iU("AUTO",-61,56)
local iV=iT xj.MouseButton1Click:Connect(function()o.flag(iV,"b")end)xk.MouseButton1Click:Connect(function()o.flag(iV,"g")end)
xl.MouseButton1Click:Connect(function()o.flag(iV,"w")end)xm.MouseButton1Click:Connect(function()o.flag(iV,"f")end)
o.rows[iT]={b=xj,g=xk,w=xl,f=xm,name=om,desc=oo,boostText=xh,row=fP}end end o.built=true o.paintAll()end function d.paint()
M(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])M(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end T(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local HB=table.find(d.CAPS,e.FpsCap or 0)or 1 local xn=d.CAPS[(HB%#d.CAPS)+1]
if not d.cap(xn)and xn~=0 then C("this executor cannot cap fps")end d.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local op=tonumber(a.pfMem.Text)if op and op>=0 then e.MemLimit=math.floor(op)end d.paint()end))function A.names()
local oq={"(none)"}for Ly,HC in ipairs((A.teams()))do oq[#oq+1]=HC.name end return oq end function A.cycle(ot,HD)
local iW=A.names()local HE=e[ot]~=""and e[ot]or"(none)"local iX=table.find(iW,HE)or 1 iX=((iX-1+HD)%#iW)+1 e[ot]=iW[iX]=="(none)"and""or iW[iX]
A.paint()end function A.paint()if not A.built then return end M(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local ou={}for Lz,HF in ipairs((A.teams()))do ou[HF.name]=true end
for HG,xo in pairs(A.pick)do local dK=e[HG]xo.Text=dK==""and"(none)"or(ou[dK]and dK or(dK.." (missing)"))xo.TextColor3=(dK~=""and not ou[dK])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local HH,iY=o.srv(),{}for LA,iZ in ipairs(A.list or{})do iY[#iY+1]=("st %-2s %-22s %9s  helps %d"):format(iZ.st.Name,al(W(iZ.name)):sub(1,22),A.clock(iZ.ends-HH),iZ.helps)
end a.tmList.Text=#iY>0 and table.concat(iY,"\n")or"no waxes running"end function A.build()for LB,i0 in ipairs(a.teamList:GetChildren())do
if i0:IsA("Frame")or i0:IsA("TextLabel")or i0:IsA("TextButton")then i0:Destroy()end end A.pick={}local i1=a.card(a.teamList,"Automatic")
a.tmT=a.switch(i1,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(i1,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(i1,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local HI,HJ=pcall(y.rebuild,"you asked")if not HI then C("BUILD ERR "..tostring(HJ))end end)
end)a.tmInfo=a.grow(i1,10,l.dim)local xp=a.card(a.teamList,"Which team when")local function i2(i3,HK,HL)local fQ=a.row(xp,54)
P(fQ,HK,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local xq=P(fQ,HL,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
xq.TextWrapped,xq.TextTruncate=false,Enum.TextTruncate.AtEnd local HM=aj(fQ,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local xr=aj(fQ,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local HN=aj(fQ,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
HM.MouseButton1Click:Connect(function()A.cycle(i3,-1)end)HN.MouseButton1Click:Connect(function()A.cycle(i3,1)end)
xr.MouseButton1Click:Connect(function()A.cycle(i3,1)end)A.pick[i3]=xr end i2("TeamNormal","Normal","the rest of the time: money + luck")
i2("TeamFull","Full","every station busy: money + wax speed")i2("TeamGlaze","Glaze","worn just before a wax finishes")
local i4=a.row(xp,26)P(i4,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=im(i4,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(i4,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local HO=aj(i4,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
HO.MouseButton1Click:Connect(function()local i5=tonumber(a.tmLead.Text)if i5 and i5>=5 and i5<=600 then e.GlazeLead=math.floor(i5)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)i2("TeamWax","Wax","while a butter is placed: head starts")local xs=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=K("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(xs)},xs)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local HP=a.card(a.teamList,"How it works")a.note(HP,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function HQ()a.secB.Text=tostring(e.Every)M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(d.unpin)end end)end
M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fn(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b2(a.root)b2(a.tgRoot)c.lastCollect=z()
n4()L.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function HR(xt)task.spawn(function()xt.TextColor3=l.bad
task.wait(0.8)if c.alive then xt.TextColor3=l.text end end)end local function xu()local xv=a.secB.Text:match("^%s*(%d+)%s*$")
local fR=xv and tonumber(xv)if not fR or fR<1 then a.secB.Text=tostring(e.Every)HR(a.secB)C("interval must be a whole number >= 1")
return end if fR==e.Every then return end e.Every,c.lastCollect=fR,z()C("collect every "..fR.."s")end local function N(HT,HU)T(HT.MouseButton1Click:Connect(HU))end
N(a.secSet,xu)T(a.secB.FocusLost:Connect(xu))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",uP)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help E.nextAt,E.msg=0,e.Help and"looking for waxes to help"or"off"M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests H.at=0 M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire F.nextAt,F.fails,F.lost=0,0,0 M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()M(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
M(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(HV)task.spawn(function()pcall(q.tick)if HV and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local HW=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(HW)end)
N(a.bestT,function()local HY=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(HY)end)N(a.bcT,function()
local HZ=q.on()e.BestCrate=not e.BestCrate q.changed(HZ)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b4=o.srv()local b5 pcall(function()q.aac=q.aac or require(af:FindFirstChild("AdminAbuseClient"))
b5=q.aac:GetState()end)local dL,b6="nothing scheduled","the game has not announced one"if type(b5)=="table"then
local fS,a4,b7=tostring(b5 .Phase or""),tonumber(b5 .StartsAt),tonumber(b5 .EndsAt)if a4 and a4<1e9 then a4=nil end
if b7 and b7<1e9 then b7=nil end if fS=="Countdown"and a4 then dL,b6="starts in "..A.clock(a4-b4),os.date("%a %H:%M",math.floor(a4)).." your time"
elseif fS=="Live"and b7 then dL,b6="LIVE  -  "..A.clock(b7-b4).." left","the farm is grabbing, waxing and glazing through it"
elseif fS~=""and fS~="Idle"and b7 and b7>b4 then dL,b6=fS:lower().."  -  "..A.clock(b7-b4).." left","after the show"
elseif a4 and a4>b4 then dL,b6="next: "..os.date("%a %H:%M",math.floor(a4)),"your time"elseif a4 then dL,b6="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a4)).." your time"
end if type(b5 .Kind)=="string"and b5 .Kind~=""then b6=b6 .."  |  "..b5 .Kind end end a.put(a.admBig,dL)a.put(a.admSub,b6)
local dM,ov={},af:FindFirstChild("AdminShow")if ov then local H0,H1=pcall(function()return ov:GetAttributes()end)
for xw,dN in pairs(H0 and H1 or{})do local i6=type(xw)=="string"and xw:match("^(.-)Mult$")local ow=i6 and tonumber(ov:GetAttribute(i6 .."Until"))
if i6 and type(dN)=="number"and dN~=1 and dN~=0 and ow and ow>b4 then dM[#dM+1]=("%s  x%s   %s left"):format(i6:gsub("(%l)(%u)","%1 %2"),(dN%1==0)and tostring(dN)or("%.2f"):format(dN),
A.clock(ow-b4))end end end table.sort(dM)a.put(a.admBoost,#dM>0 and table.concat(dM,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dM>0 and l.accent or l.dim local i7=0 for LC in pairs(O.drops)do i7=i7+1 end local xx=q.snapAt and(q.snapAt-b4)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,i7>0 and(", "..i7 .." falling")or"",
xx and("in "..math.max(0,math.floor(xx)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",em,true)end)N(a.padB,function()c.plot=bB()or c.plot local xy,ox=aq(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(xy and ox and ox:IsA("BasePart"))then C("SET PAD: need character and plot")return end c.manualPad=ox.CFrame:ToObjectSpace(xy.HumanoidRootPart.CFrame)
Ey(c.manualPad)C("collect pad saved at your position")end)N(a.startB,function()fn(not c.running)end)N(a.buyB,function()
c.plot=bB()or c.plot task.spawn(as,"buying (manual)...",qt,true)end)N(a.plB,function()c.plot=bB()or c.plot task.spawn(as,"waxing (manual)...",qx)
end)N(a.tabFarm,function()a3("farm")end)N(a.tabRun,function()a3("run")end)N(a.tabSrv,function()a3("srv")end)N(a.tabAdm,function()a3("adm")end)
N(a.tabBut,function()a3("but")end)N(a.tabSet,function()a3("set")end)N(a.tabCrt,function()a3("crt")end)N(a.tabPet,function()a3("pet")end)
N(a.tabTeam,function()a3("team")end)local function H2(oy)c.hidden=oy a.root.Visible=not oy a.tgBtn.TextColor3=oy and l.text or l.ink
end wi(a.tgBtn,a.tgRoot,function()b2(a.tgRoot)c.togPos=is(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then H2(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aM,ay={},0 local function b8()aM=pP()if#aM==0 then a.cfgPick.Text="(none saved)"
ay=0 return end if ay<1 or ay>#aM then ay=1 end a.cfgPick.Text=aM[ay]..("  (%d/%d)"):format(ay,#aM)end local function xz()
local xA=c.autoload~=nil a.cfgAuto.Text=xA and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=xA and l.accent or l.panel2
end local function oz()local xC=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if xC~=""then return xC end return(ay>0 and aM[ay])or""
end N(a.cfgSave,function()c.winPos=is(a.root)or c.winPos c.togPos=is(a.tgRoot)or c.togPos local xD,xE=gw(oz())
a.cfgMsg.Text=xD and("saved as "..xE)or("could not save: "..xE)a.cfgMsg.TextColor3=xD and l.good or l.bad b8()
C(a.cfgMsg.Text)end)local function H3(oA)local oB,xF=pY(oA)a.cfgMsg.Text=oB and("loaded "..xF)or("could not load: "..xF)
a.cfgMsg.TextColor3=oB and l.good or l.bad if oB then a.cfgName.Text=oA HQ()task.spawn(D.apply,"config "..oA)
end C(a.cfgMsg.Text)end N(a.cfgLoad,function()H3(oz())end)N(a.cfgPick,function()b8()if ay>0 then a.cfgName.Text=aM[ay]end
end)N(a.cfgPrev,function()if#aM==0 then b8()return end ay=(ay-2)%#aM+1 b8()a.cfgName.Text=aM[ay]end)N(a.cfgNext,function()
if#aM==0 then b8()return end ay=ay%#aM+1 b8()a.cfgName.Text=aM[ay]end)N(a.cfgAuto,function()if c.autoload then
p0(nil)a.cfgMsg.Text="it will not load a config on launch"else local fT=oz()local xG=false for LD,H4 in ipairs(pP())do if H4==fT then xG=true end end
local H5=xG or gw(fT)if H5 and fT~=""then p0(fT)b8()a.cfgMsg.Text=fT.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim xz()end)N(a.autoB,function()
local xH,xI=zB()a.autoMsg.Text=xH and("installed. "..xI)or("failed: "..xI)a.autoMsg.TextColor3=xH and l.good or l.bad
C(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()d6("you asked")end)
local bd=false N(a.minB,function()bd=not bd a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bd,not bd,not bd
if bd then for LE,H6 in ipairs(a.tabKeys)do a[H6].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a3(w1)
end a.root.Size=UDim2 .new(0,Q.w,0,bd and(Q.head+Q.status+12)or Q.h)a.minB.Text=bd and"+"or"-"end)local function i8()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(f6)for LF,H7 in ipairs(jg)do pcall(function()H7:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()nC:Destroy()end)
pcall(function()wL:Destroy()end)if cV.SAB_KILL==i8 then cV.SAB_KILL=nil end end cV.SAB_KILL=i8 N(a.killB,i8)N(a.xB,i8)
wi(a.title,a.root,function()b2(a.root)c.winPos=is(a.root)or c.winPos end)local function xJ()local fU,cU=c.reason,c.level
if c.busy then fU,cU=c.busyText,"ok"elseif not c.running then local LG,xK,H8=vo()if c.capHit then fU,cU=xK,"bad"else fU,cU="[stopped] "..xK,(H8=="bad")and"bad"or"idle"end
c.reason,c.level=fU,cU end local dO=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dO then
a.lit.dot=dO a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dO,dO,dO,dO a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fU)if a.lit.bar~=cU then a.lit.bar=cU a.bar.BackgroundColor3=FO[cU]or l.dim end
if bd then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local b9=zb()if a.farm.Visible then local H9,H_=f3()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,H9 .."/"..H_)local xL=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local xM=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aE(be()),c.rolls,c.gifts,c.crates,xM and al(W(xM))or"nothing",j.on and("   ["..j.title.." window open]")or"",
xL and("in "..xL.."s")or"off"))a.put(a.tgt,(#b9==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#b9<=3)and table.concat(b9,", ")or(#b9 .." butters ticked"))))
if a.lit.tgt~=(#b9==0)then a.lit.tgt=(#b9==0)a.tgt.TextColor3=(#b9==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fX,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,e.Campfire and F.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#b9))
end if a.but.Visible and bz.at~=ad.at then fO(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and E.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and F.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(H.msg~=""and H.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local xN=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",xN~=""and xN or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cV.SAB={S=c,CFG=e,EV=V,U=a,sg=nC,CAT=ad,LEARN=ak,buildList=fO,
logAll=dP,evAll=dQ,AR=D,CR=L,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=E,CF=F,QX=H,IX=q,SH=O}C(b_.." loaded")if c.uiErrs>0 then C("UI: "..c.uiErrs.." properties skipped")end
a3("farm")b2(a.root)b2(a.tgRoot)if ip then pcall(function()T(ip:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)b2(a.root)b2(a.tgRoot)end))end)end b8()xz()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(xJ)task.spawn(function()local xO=zz()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(xO and("\n(backup: "..xO..")")or"")
local xP=gp(an.exec)if xP and not xP:find("SAB autoloader v2",1,true)then d3(an.exec,an.stub)C("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(gp(an.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(zH)end)task.spawn(function()while c.alive do local Ia,Ib=pcall(xJ)if not Ia then C("UI ERR "..tostring(Ib))end
task.wait((c.hidden or bd)and 1.5 or 0.4)end end)task.spawn(function()local Ic,Ie=pcall(zP)if not Ic then C("HOOK ERR "..tostring(Ie))end
end)task.spawn(function()pcall(yy)if j.loadSeq and not j.learned then local i9={}for xQ=1,20 do if j.loadSeq[xQ]then i9[#i9+1]=j.loadSeq[xQ]end end
if#i9>0 then j.learned={seq=i9,mode=j.loadMode}C("remembered how to open crates directly")end end if jP()then C(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local If,xR=pcall(EA)if If and xR and c.alive and not c.manualPad then c.manualPad=xR end end)task.spawn(function()
while c.alive do local oC,oD=pcall(o.buyTick)if not oC then C("PET ERR "..tostring(oD))task.wait(5)end oC,oD=pcall(o.wishTick)
if not oC then C("WISH ERR "..tostring(oD))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local i_,xS=0,z()
T(game:GetService("RunService").Heartbeat:Connect(function()i_=i_+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
T(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local xT=z()d.fps,i_,xS=i_/math.max(xT-xS,0.001),0,xT local Ig,Ih=pcall(d.tick)if not Ig then C("PERF ERR "..tostring(Ih))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local Ii,Ij=pcall(y.tick)if not Ii then C("FUSE ERR "..tostring(Ij))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local Ik,Il=pcall(A.tick)if not Ik then C("TEAM ERR "..tostring(Il))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local ja=af:WaitForChild("Remotes",30)local xU=ja and ja:WaitForChild("ClanEvent",30)
if xU and c.alive then T(xU.OnClientEvent:Connect(function(Im,In)if Im=="call"then pcall(E.onCall,In)end end))
end local xV=ja and ja:FindFirstChild("RollConfirmAsk")if xV and c.alive then T(xV.OnClientEvent:Connect(function(Io)H.asked=Io or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)end end end)task.spawn(function()
local oE=af:WaitForChild("Remotes",30)if not(oE and c.alive)then return end local function jb(Ip,Iq)local oF=oE:FindFirstChild(Ip)
if oF and oF:IsA("RemoteEvent")then T(oF.OnClientEvent:Connect(function(...)pcall(Iq,...)end))end end jb("NewSquishyDiscovered",function(oG,xW)
if type(oG)~="string"then return end q.disc=q.disc or{}q.disc[W(oG)]=true C(("INDEX: %s%s is in your Index now"):format(al(W(oG)),xW and(" ("..tostring(xW)..")")or""))
end)jb("IndexRefresh",q.loadDisc)jb("IndexRowComplete",function(Ir)C("INDEX: the whole "..tostring(Ir).." row is complete")end)
jb("AdminShow",q.admin)local xX=oE:FindFirstChild("AdminShowSync")if xX then local Is,xY=pcall(function()return xX:InvokeServer()end)
if Is and type(xY)=="table"then for LH,It in pairs(xY)do pcall(O.add,It)end end end while c.alive do local Iu,Iv=pcall(q.tick)
if not Iu then q.msg="index error: "..tostring(Iv)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Iw,Ix=pcall(H.tick)if not Iw then C("QUEST ERR "..tostring(Ix))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(f6)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Iz=(type(newcclosure)=="function")and newcclosure or function(Iy)return Iy end local oH
local xZ=(type(setnamecallmethod)=="function")and setnamecallmethod or nil oH=hookmetamethod(game,"__namecall",Iz(function(x0,...)
local fV=getnamecallmethod()if c.alive and(fV=="InvokeServer"or fV=="FireServer")then local x1,x2=pcall(function()return x0 .Name end)
if x1 and x2=="CrateAction"and not j.replaying then pcall(j.saw,fV,...)elseif x1 and x2=="AutoRollAction"and not D.replaying then pcall(D.saw,fV,...)end
if xZ then xZ(fV)end end return oH(x0,...)end))j.oldNC=oH end)end if je then T(J.Idled:Connect(function()pcall(function()je:CaptureController()je:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for LI=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and aq()and(c.plot or bB())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local jc=ce()
if jc and q.on()and not aN(jc.name)then jc=nil end if c.alive and e.AutoRoll and c.running and not D.isOn()and not jc and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for LJ=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bB()if aq()and c.plot and q.any()then fn(true,true)C("started by itself")
return end task.wait(1)end if c.alive and not c.running then C("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bB()c.lastCollect=z()while c.alive do if c.running then local IA,x3=pcall(FJ)if not IA and x3~=jf then C("LOOP ERR "..tostring(x3))end
end task.wait(0.1)end end)jd("ready - the window is at the top left")end local IC,oI=xpcall(x7,function(IB)return tostring(IB).."\n"..debug.traceback()end)
if not IC then pcall(function()warn("SAB "..b_.." ERROR: "..tostring(oI))end)jd("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b_.." ERROR: "..tostring(oI))end)pcall(function()local x4=(type(getgenv)=="function"and getgenv())or _G
if type(x4 .SAB_KILL)=="function"then x4 .SAB_KILL()end for LK,ID in ipairs({"SABFarmGui","SABToggle"})do local x5=J.PlayerGui:FindFirstChild(ID)
if x5 then x5:Destroy()end end end)pcall(function()local fW=Instance.new("ScreenGui")fW.Name="SABError"fW.ResetOnSpawn=false
fW.DisplayOrder=1000 local a5=Instance.new("TextBox")a5 .Size=UDim2 .new(0,340,0,170)a5 .Position=UDim2 .new(0,10,0,50)
a5 .BackgroundColor3=Color3 .fromRGB(90,20,20)a5 .TextColor3=Color3 .new(1,1,1)a5 .TextSize=11 a5 .TextWrapped=true
a5 .ClearTextOnFocus=false a5 .TextXAlignment=Enum.TextXAlignment.Left a5 .TextYAlignment=Enum.TextYAlignment.Top
a5 .Text="SAB "..b_.." failed to start. Send this text:\n"..tostring(oI)a5 .Parent=fW fW.Parent=J:WaitForChild("PlayerGui")
end)end
