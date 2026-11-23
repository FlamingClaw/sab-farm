local ca="v28"local oS=game:GetService("Players")local J=oS.LocalPlayer or oS.PlayerAdded:Wait()local function ji(yl)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..ca,Text=yl,Duration=6})
end)end ji("script started")local function ym()local af=game:GetService("ReplicatedStorage")local ai=game:GetService("Workspace")
local oT=game:GetService("UserInputService")local cW=(type(getgenv)=="function"and getgenv())or _G if type(cW.SAB_KILL)=="function"then pcall(cW.SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jj=(function()local yn,yo=pcall(function()return game:GetService("VirtualUser")end)return yn and yo or nil end)()
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
local o,A,d,y,E,F,H={},{},{},{},{},{},{}local q,O={},{}local jk={}local jl,f1,dQ,dR={},{},{},{}local function T(oU)jl[#jl+1]=oU return oU end
local function ag(yp)task.wait(yp)if not c.alive then error(jk,0)end end local function C(f2)f2=os.date("%H:%M:%S").." "..tostring(f2)
table.insert(f1,1,f2)if#f1>6 then table.remove(f1)end c.logN=(c.logN or 0)+1 dQ[#dQ+1]=f2 if#dQ>80 then table.remove(dQ,1)end
end local function f3(oV)if type(oV)~="string"then return""end return(oV:lower():gsub("[^%w]",""))end local function W(yq)
local oW=f3(yq)local jm=oW:gsub("butter$","")if jm==""then jm=oW end return jm end local function aO(oX)if type(oX)~="string"then return false end
local jn=W(oX)if jn==""then return false end if q.want then return q.want(jn)end return e.Targets[jn]==true end
local function yr(dS)dS=dS:lower()return dS:find("squishy",1,true)~=nil or dS:match("butter$")~=nil or dS:match("butter[^%a]")~=nil
end local jo={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aE(dT)if type(dT)~="number"then return"?"end
local f4=1 while math.abs(dT)>=1000 and f4<#jo do dT=dT/1000 f4=f4+1 end local ys=string.format("%.2f",dT):gsub("%.?0+$","")
return ys..jo[f4]end local function yt(oY)if type(oY)~="string"then return nil end local yu,dU=oY:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jp=tonumber(yu)if not jp then return nil end if dU==""then return jp end local yv={qd="qa",qn="qi"}dU=yv[dU:lower()]or dU
for yw,yx in ipairs(jo)do if yx:lower()==dU:lower()then return jp*1000^(yw-1)end end return nil end local function bf()
local oZ=J:GetAttribute("BoardValueMoney")if type(oZ)=="number"then return oZ end local o0=J:FindFirstChild("leaderstats")
if o0 then for I2,yy in ipairs({"Cash","Money","Coins"})do local jq=o0:FindFirstChild(yy)if jq and type(jq.Value)=="number"then return jq.Value end
end end end local function f5(yz)local jr=yz:GetFullName()if c.plot then local js=c.plot:GetFullName()if jr:sub(1,#js)==js then return jr:sub(#js+2)end
end return jr end local function aq()local f6=J.Character if f6 and f6:FindFirstChild("HumanoidRootPart")then
local o1=f6:FindFirstChildOfClass("Humanoid")if o1 and o1 .Health>0 then return f6 end end end local function bC()
local jt=ai:FindFirstChild("Plots")if not jt then return nil end local function o2(yA)local o3=yA:FindFirstChild("Plate")
return o3~=nil and o3:FindFirstChild("EditStackAttachment",true)~=nil end local o4=J:GetAttribute("PlotNumber")
if o4~=nil then local ju=jt:FindFirstChild(tostring(o4))if ju and o2(ju)then return ju end end for I3,o5 in ipairs(jt:GetChildren())do
if o2(o5)then return o5 end end end local function dV(o6)local bD=o6 and o6 .Parent for I4=1,6 do if not bD then return nil end
if bD:IsA("BasePart")then return bD end if bD:IsA("Model")then return bD.PrimaryPart or bD:FindFirstChildWhichIsA("BasePart",true)end
bD=bD.Parent end end local function o7(o8)local jv=o8 .Parent if jv and jv:IsA("Attachment")then return jv.WorldPosition end
local o9=dV(o8)return o9 and o9 .Position end local function o_()local cX=c.plot and c.plot:FindFirstChild("Plate")
if not cX then return nil end if cX:IsA("BasePart")then return cX.Position end if cX:IsA("Model")then return cX:GetPivot().Position end
local pa=cX:FindFirstChildWhichIsA("BasePart",true)return pa and pa.Position end local function pb()local jw={}
local pc=c.plot and c.plot:FindFirstChild("WaxStations")if pc then for I5,yB in ipairs(pc:GetChildren())do local pd=yB:FindFirstChild("SquishyPlaceHolder")
local jx=pd and pd:FindFirstChild("PlacePrompt")if jx and jx:IsA("ProximityPrompt")then jw[#jw+1]=jx end end end
return jw end local function f7()local pe,jy=pb(),0 for I6,yC in ipairs(pe)do if yC.Enabled then jy=jy+1 end end
local jz=#pe local jA=J:GetAttribute("WaxStations")if type(jA)=="number"and jA>jz then jz=jA end return jy,jz
end local function yD()local pf=aq()local pg=pf and pf.HumanoidRootPart.Position local jB,ph for I7,jC in ipairs(pb())do
if jC.Enabled then local pj=o7(jC)local pk=(pj and pg)and(pj-pg).Magnitude or 1e9 if not jB or pk<ph then jB,ph=jC,pk end
end end return jB end local function pl()local f8=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not f8 then return nil end local pm=f8:FindFirstChild("BuyPromptAttachment")local f9=(pm and pm:FindFirstChild("BuyPrompt"))or f8:FindFirstChild("BuyPrompt",true)
if f9 and f9:IsA("ProximityPrompt")and f9:IsDescendantOf(f8)then return f9 end end local pn={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local yE={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local ak={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jD="SAB_order.txt"local function f_()if not ak.dirty or type(writefile)~="function"then return end local aF={}
for yF,yG in pairs(ak.price)do aF[#aF+1]="P|"..yF.."|"..string.format("%.0f",yG)end for yH,yI in pairs(ak.order)do aF[#aF+1]="O|"..yH.."|"..table.concat(yI,",")end
if j.learned and j.enc then aF[#aF+1]="M|mode|"..tostring(j.learned.mode or"")for yJ,ga in ipairs(j.learned.seq)do
local po={}for pp=1,ga.n do po[pp]=j.enc(ga.args[pp])end aF[#aF+1]=("A|%d|%s|%d|%s"):format(yJ,ga.m,ga.n,table.concat(po,";"))
end end local function jE(yK,yL,gb)local pq={}for ps=1,gb.n do pq[ps]=j.enc(gb.args[ps])end aF[#aF+1]=("R|%d|%s|%s|%d|%s"):format(yL,yK,gb.m,gb.n,table.concat(pq,";"))
end if j.enc then for yM,yN in ipairs(D.rec.rules)do jE("rules",yM,yN)end if D.rec.on then jE("on",0,D.rec.on)end
if D.rec.off then jE("off",0,D.rec.off)end end for I8,dW in pairs(L.seen)do aF[#aF+1]=("K|%s|%s|%s|%s"):format(dW.name,dW.title or"",dW.rar or"",dW.price and string.format("%.0f",dW.price)or"")
end if pcall(writefile,jD,table.concat(aF,"\n"))then ak.dirty=false end end local function yO()if type(isfile)~="function"or type(readfile)~="function"then return end
local yP,yQ=pcall(isfile,jD)if not(yP and yQ)then return end local yR,pt=pcall(readfile,jD)if not(yR and type(pt)=="string")then return end
for yS in pt:gmatch("[^\n]+")do local cY,cZ,bh=yS:match("^(%a)|([^|]+)|(.*)$")if cY=="P"then ak.price[cZ]=tonumber(bh)
elseif cY=="M"then j.loadMode=(bh~=""and bh~="nil")and bh or nil elseif cY=="A"and j.dec then local pu=tonumber(cZ)
local pv,gc,yT=bh:match("^([^|]+)|(%d+)|(.*)$")if pu and pv then gc=tonumber(gc)local pw,gd={},0 for yU in(yT..";"):gmatch("([^;]*);")do
gd=gd+1 if gd<=gc then pw[gd]=j.dec(yU)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pu]={m=pv,n=gc,args=pw}end elseif cY=="R"and j.dec then
local px=tonumber(cZ)local ge,yV,gf,yW=bh:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if px and ge then gf=tonumber(gf)
local py,gg={},0 for yX in(yW..";"):gmatch("([^;]*);")do gg=gg+1 if gg<=gf then py[gg]=j.dec(yX)end end local jF={m=yV,n=gf,args=py}
if ge=="rules"then D.rec.rules[px]=jF elseif ge=="on"then D.rec.on=jF elseif ge=="off"then D.rec.off=jF end end
elseif cY=="K"then local pz,pA,yY=bh:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cZ)]={name=cZ,title=pz~=""and pz or nil,
rar=pA~=""and pA or nil,price=tonumber(yY)}elseif cY=="O"and bh~=""then local gh={}for yZ in bh:gmatch("[^,]+")do gh[#gh+1]=yZ end
if#gh>0 then ak.order[cZ]=gh end end end end local function y0(gi)if type(gi)~="table"then return end local cb,pB=gi.rarity,gi.contents
if type(cb)~="string"or cb==""or type(pB)~="table"then return end local dX={}for I9,gj in ipairs(pB)do if type(gj)=="table"and type(gj.butter)=="string"then
dX[#dX+1]={n=gj.butter,ch=tonumber(gj.chance)or 0}end end if#dX==0 then return end table.sort(dX,function(y1,y2)return y1 .ch>y2 .ch end)
local dY,dZ={},false for y3,y4 in ipairs(dX)do dY[y3]=y4 .n end local jG=ak.order[cb]if not jG or#jG~=#dY then dZ=true end
if not dZ then for pC=1,#dY do if jG[pC]~=dY[pC]then dZ=true break end end end ak.order[cb]=dY local jH=tonumber(gi.price)
if jH and ak.price[cb]~=jH then ak.price[cb]=jH dZ=true end if dZ then ak.dirty=true ad.at=0 C("learned the "..cb.." order from its crate")
end end local function c0(y5,y6)local y7=y5:FindFirstChild(y6,true)local y8,jI=pcall(function()return y7 .Text end)
return(y8 and type(jI)=="string"and jI~="")and jI or nil end local function al(pD)return ad.pretty[pD]or pD end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(y9)return f3(y9 or"")end
function L.learn(bi)if type(bi)~="table"or type(bi.name)~="string"then return end local jJ=L.key(bi.name)local bj=L.seen[jJ]or{}
local y_=(L.seen[jJ]==nil)or(tonumber(bi.price)and bj.price~=tonumber(bi.price))bj.name,bj.title=bi.name,bi.title or bj.title
bj.rar,bj.price=bi.rarity or bj.rar,tonumber(bi.price)or bj.price L.seen[jJ]=bj if y_ then L.at,ak.dirty=z(),true end
end function L.wanted(pE)if pE==nil then return false end local jK=L.key(pE)return e.CrateTicks[jK]==true or(e.BestCrate and q.bestCrate~=nil and(jK==q.bestCrate or jK==q.bestCrateTitle))
end function L.list()local c1={}for za,gk in ipairs(L.base)do c1[L.key(gk[1])]={name=gk[1],title=gk[2],rar=gk[3],i=za}end
for I_,d0 in ipairs(ad.rarOrder)do local pF=false for Ja,zb in pairs(c1)do if zb.rar==d0 then pF=true break end end
if not pF and d0~="?"then local pG=d0:gsub("[^%w]","").."Crate"c1[L.key(pG)]={name=pG,title=d0 .." Crate",rar=d0,i=50,guess=true}
end end for pH,gl in pairs(L.seen)do local a7=c1[pH]or{i=100}a7 .name,a7 .title,a7 .rar=gl.name or a7 .name,gl.title or a7 .title,gl.rar or a7 .rar
a7 .price,a7 .guess=gl.price or a7 .price,nil c1[pH]=a7 end local d1,gm={},{}for zc,zd in ipairs(pn)do d1[zd]=zc end
for ze,pI in ipairs(ad.rarOrder)do d1[pI]=d1[pI]or(20+ze)end for zf,d2 in pairs(c1)do d2 .k=zf d2 .price=d2 .price or ak.price[d2 .rar or""]
gm[#gm+1]=d2 end table.sort(gm,function(cc,cd)if cc.price and cd.price and cc.price~=cd.price then return cc.price<cd.price end
local pJ,pK=d1[cc.rar or""]or 99,d1[cd.rar or""]or 99 if pJ~=pK then return pJ<pK end if(cc.i or 100)~=(cd.i or 100)then return(cc.i or 100)<(cd.i or 100)end
return cc.k<cd.k end)return gm end local function zg()local pL=af:FindFirstChild("Assets")local pM=pL and pL:FindFirstChild("Squishies")
if not pM then return false end local jL,pN,c2={},{},{}local gn=0 for Jb,go in ipairs(pM:GetChildren())do local d3=W(go.Name)
if d3~=""and not jL[d3]then local gp=c0(go,"RarityText")or"?"jL[d3]=gp pN[d3]=c0(go,"NameText")or go.Name c2[gp]=c2[gp]or{}
table.insert(c2[gp],d3)gn=gn+1 end end if gn==0 then return false end for pO,zh in pairs(c2)do local pP=ak.order[pO]or yE[pO]
local jM={}if pP then for zi,zj in ipairs(pP)do jM[W(zj)]=zi end end table.sort(zh,function(pQ,pR)local jN,jO=jM[pQ],jM[pR]
if jN and jO then return jN<jO end if jN then return true end if jO then return false end return al(pQ)<al(pR)
end)end local jP={}for zk,zl in ipairs(pn)do jP[zl]=zk end local gq,ce={},{}for zm in pairs(c2)do gq[#gq+1]=zm end
pcall(function()for zn,zo in ipairs(require(af.Modules.SquishyRNG).Keys)do ce[zo]=zn end end)table.sort(gq,function(c3,c4)
if ce[c3]and ce[c4]and ce[c3]~=ce[c4]then return ce[c3]<ce[c4]end local jQ,jR=ak.price[c3],ak.price[c4]if jQ and jR and jQ~=jR then return jQ<jR end
local jS,jT=jP[c3],jP[c4]if jS and jT then return jS<jT end if jS then return true end if jT then return false end
return c3<c4 end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=jL,pN,c2,gq,gn,z()return true end local function jU()
if ad.at==0 or(z()-ad.at)>120 then pcall(zg)end return ad.n>0 end local function zp(zq)local pS=W(zq)return ad.rar[pS]or(V.name and W(V.name)==pS and V.rar)or"?"
end local function zr()local gr={}local zs=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for zt,zu in pairs(zs)do if zu then gr[#gr+1]=al(zt)end end
table.sort(gr)return gr end local an={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function pT()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gs(pU)if type(makefolder)~="function"then return end local zv,zw=pcall(isfolder,pU)if not(zv and zw)then pcall(makefolder,pU)end
end local function gt(pV)if type(isfile)~="function"or type(readfile)~="function"then return nil end local zx,zy=pcall(isfile,pV)
if not(zx and zy)then return nil end local zz,zA=pcall(readfile,pV)return zz and zA or nil end local function d4(zB,zC)
if type(writefile)~="function"then return false end return(pcall(writefile,zB,zC))end local function pW(zD)local d5={}
if type(listfiles)~="function"then return d5 end local zE,pX=pcall(listfiles,zD)if not zE or type(pX)~="table"then return d5 end
for Jc,zF in ipairs(pX)do d5[#d5+1]=tostring(zF)end return d5 end local function pY()local gu={}for Jd,zG in ipairs(pW(an.cfg))do
local pZ=zG:match("([^/\\]+)%.txt$")if pZ then gu[#gu+1]=pZ end end table.sort(gu)return gu end local function zH()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(e.Every)aa[#aa+1]="N|GlazeLead|"..tostring(e.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(e.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(e.MemLimit)aa[#aa+1]="N|Best|"..tostring(e.Best or 0)for Je,p0 in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..p0 .."|"..e[p0]end
do local gv={}for zI,gw in pairs(e.Pets)do local p1=(gw.b and"b"or"")..(gw.g and"g"or"")..(gw.w and"w"or"")..(tonumber(gw.f)==-1 and"k"or"")
if p1~=""then gv[#gv+1]=zI.."|"..p1 end end table.sort(gv)aa[#aa+1]="P|-"for Jf,zJ in ipairs(gv)do aa[#aa+1]="P|"..zJ end
end for Jg,p2 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..p2 .."|"..(e[p2]and"1"or"0")end local jV=J:GetAttribute("AutoRollRules")if type(jV)=="string"and jV~=""then e.ARrules,e.ARstop=jV,tostring(J:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then aa[#aa+1]="S|rules|"..e.ARrules aa[#aa+1]="S|stop|"..e.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for Jh,jW in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gx={}for zK,zL in pairs(jW[2])do if zL then gx[#gx+1]=zK end end table.sort(gx)aa[#aa+1]=jW[1].."|-"for Ji,zM in ipairs(gx)do aa[#aa+1]=jW[1].."|"..zM end
end return table.concat(aa,"\n")end local function zN(jX)if type(jX)~="string"or jX==""then return false end local p3,p4,p5,p6,d6={},false,{},false,nil
for zO in jX:gmatch("[^\n]+")do local aG,ah,az=zO:match("^(%a)|([^|]*)|?(.*)$")if aG=="N"and ah=="Every"then local jY=tonumber(az)
if jY and jY>=1 then e.Every=math.floor(jY)end elseif aG=="N"and(ah=="FpsCap"or ah=="MemLimit")then local jZ=tonumber(az)
if jZ and jZ>=0 then e[ah]=math.floor(jZ)end elseif aG=="N"and ah=="Best"then local gy=tonumber(az)if gy and gy>=0 and gy<=4 then e.Best=math.floor(gy)end
elseif aG=="N"and ah=="GlazeLead"then local gz=tonumber(az)if gz and gz>=5 and gz<=600 then e.GlazeLead=math.floor(gz)end
elseif aG=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then e[ah]=az elseif aG=="P"and ah~=""then
if not d6 then d6={}end if ah~="-"and az~=""then d6[ah]={b=az:find("b",1,true)and true or nil,g=az:find("g",1,true)and true or nil,
w=az:find("w",1,true)and true or nil,f=az:find("k",1,true)and-1 or nil}end elseif aG=="B"then if e[ah]~=nil then e[ah]=(az=="1")end
elseif aG=="S"and ah=="rules"then e.ARrules=az elseif aG=="S"and ah=="stop"then e.ARstop=az elseif aG=="W"then
c.winPos={tonumber(ah)or 10,tonumber(az)or 44}elseif aG=="G"then c.togPos={tonumber(ah)or 10,tonumber(az)or 300}
elseif aG=="T"and ah~=""then if ah~="-"then p3[ah]=true end p4=true elseif aG=="K"and ah~=""then if ah~="-"then p5[ah]=true end
p6=true end end if p4 then e.Targets=p3 end if p6 then e.CrateTicks=p5 end if d6 then e.Pets=d6 end return true
end local function gA(c5)if not pT()then return false,"this executor cannot write files"end c5=(c5 or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c5==""then return false,"give the config a name"end gs(an.dir)gs(an.cfg)if not d4(an.cfg.."/"..c5 ..".txt",zH())then return false,"could not write the file"end
c.config=c5 return true,c5 end local function p7(gB)local p8=gt(an.cfg.."/"..gB..".txt")if not p8 then return false,"no config called "..tostring(gB)end
if not zN(p8)then return false,"that config looks empty"end c.config=gB return true,gB end local function p9(j0)
if j0 then gs(an.dir)d4(an.auto,j0)elseif type(delfile)=="function"then pcall(delfile,an.auto)else d4(an.auto,"")
end c.autoload=j0 end local function zP()if c.selfPath then return c.selfPath end local gC for Jj,zQ in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",an.dir})do
for Jk,p_ in ipairs(pW(zQ))do local j1=p_:lower()if j1:sub(-4)==".lua"and(j1:find("sab_farm",1,true)or j1:find("sab farm",1,true))then
gC=gC or p_ end end end c.selfPath=gC return gC end an.stub=[[
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
local function zR()if not pT()then return false,"this executor cannot write files"end gs("autoexec")if not d4(an.exec,an.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gD=(function()local zS,zT=pcall(function()return game:GetService("TeleportService")end)return zS and zT or nil end)()
local function qa()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local zU=queueonteleport or queue_on_teleport return(pcall(zU,an.stub))end local function d7(zV)if c.rejoining then return end
c.rejoining=true C("REJOIN ("..zV..")")pcall(f_)if c.autoload then pcall(gA,c.autoload)end local zW=qa()C(zW and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for Jl=1,30 do if not gD then break end pcall(function()gD:Teleport(game.PlaceId,J)end)task.wait(10)
end end)end local function zX()local zY,qb=pcall(function()return game:GetService("GuiService")end)if zY and qb then
pcall(function()T(qb.ErrorMessageChanged:Connect(function()if e.Rejoin then d7("roblox error message")end end))
end)end pcall(function()local qc=game:GetService("CoreGui")local qe=qc and qc:WaitForChild("RobloxPromptGui",15)
local qf=qe and qe:WaitForChild("promptOverlay",15)if qf then T(qf.ChildAdded:Connect(function(zZ)if e.Rejoin and tostring(zZ.Name):lower():find("errorprompt",1,true)then d7("disconnect prompt")end
end))end end)if gD then pcall(function()T(gD.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()d7("teleport retry")end)end
end))end)end end local function qg(z0)local qh=c.plot and c.plot:FindFirstChild(z0)if not qh then return nil,false end
for Jm,j2 in ipairs(qh:GetChildren())do if j2:IsA("Model")or j2:IsA("BasePart")then return j2,true end end return nil,true
end local function cf()local bE=qg("RolledSquishy")if not bE then return nil end return{model=bE,name=bE.Name,pretty=c0(bE,"NameText")or al(W(bE.Name)),
rar=c0(bE,"RarityText")or zp(bE.Name),price=c0(bE,"PriceText")}end local function qi(j3)return type(j3)=="string"and(ad.rar[W(j3)]~=nil or yr(j3))
end local function ac()local j4=qg("SquishyEquipped")if j4 then c.carrySrc,j.heldAt="model",z()return j4 .Name,j4 end
local qj=J.Character if qj then for Jn,d8 in ipairs(qj:GetDescendants())do if(d8:IsA("Model")or d8:IsA("Tool"))and qi(d8 .Name)then
c.carrySrc,j.heldAt="character",z()return d8 .Name,d8 end end end local gE=J:GetAttribute("SquishyEquipped")if type(gE)=="string"and gE~=""and qi(gE)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gE,nil end c.carrySrc=nil end local function Jo()local Jp,z1=ac()return z1 end local function d9()
local qk=cf()local j5=qk and yt(qk.price)local j6=bf()if j5 and j6 and j6<j5*0.5 then return j6,j5 end end local function cg(z2)
dR[#dR+1]=os.date("%H:%M:%S").." "..z2 if#dR>40 then table.remove(dR,1)end end local function z3(cj,gF)if type(cj)~="string"then return end
cg(("Roll(%s,%s)"):format(cj,tostring(gF)))if cj:lower():find("crate",1,true)then j.rolled,j.rolledAt=cj,z()return
end V.seq=V.seq+1 V.name,V.at=cj,z()V.rar=type(gF)=="string"and gF or nil c.rolls=c.rolls+1 if aO(cj)then C(("ROLL %s [%s] = TARGET"):format(cj,tostring(gF)))end
end local function z4(ck)if type(ck)~="table"then return end local gG=ck.butter or ck.itemName if type(gG)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=gG,z()if type(ck.giftId)=="string"then local ql=af:FindFirstChild("Remotes")
local qm=ql and ql:FindFirstChild("GiftThanks")if qm then pcall(function()qm:FireServer(ck.giftId)end)end end
cg("Gift("..gG.." from "..tostring(ck.fromName)..")")C(("GIFT from %s: %s - it will not be waxed"):format(tostring(ck.fromName),gG))
end local function z5()local qo=af:WaitForChild("Remotes",30)if not c.alive then return end if not qo then C("Remotes folder missing - no roll events")return end
T(J:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local qp=J:GetAttribute("SquishyEquipped")
if type(qp)=="string"and qp~=""then j.heldAt=z()end end))local Aa={SquishyRollAnimation=z3,InitSquishy=function(qq)V.init,V.initAt=tostring(qq),z()cg("Init("..tostring(qq)..")")end,
CrateUpdate=function(c6,qr)pcall(y0,c6)pcall(L.learn,c6)if type(c6)=="table"then local z6=qr==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not z6 then return end local z7=not j.waiting local z8=j.on j.waiting,j.data,j.at=true,c6,z()j.on=(qr==true)
j.title=tostring(c6 .title or c6 .name or"crate")if j.on and not z8 then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cg("CrateWindow open("..j.title..")")elseif z7 then cg("Crate waiting("..j.title..")")C(j.title.." is waiting on your stand")
end else if j.waiting then cg("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local z9=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,z9)end if j.classify then local z_=z()
task.spawn(function()pcall(j.classify,z_)end)end end end,GiftReceived=z4,}for gH,Ab in pairs(Aa)do local j7=qo:FindFirstChild(gH)
if j7 and j7:IsA("RemoteEvent")then T(j7 .OnClientEvent:Connect(Ab))elseif gH~="CrateUpdate"and gH~="GiftReceived"then C("remote "..gH.." missing")end
end end local function j8()local cl=cf()if cl then if aO(cl.name)then return{state="match",shown=cl.pretty,src="pad",info=cl}
end return{state="skip",info=cl,level="idle",text=("on pad: %s [%s] - not ticked"):format(cl.pretty,tostring(cl.rar))}
end if V.name and(z()-V.at)<4 then if aO(V.name)then return{state="match",shown=al(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(al(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gI(Ac,Ad,Ae,Af)
local gJ=RaycastParams.new()gJ.FilterType=Enum.RaycastFilterType.Exclude local j9={J.Character}for Jq,Ag in ipairs(Af or{})do j9[#j9+1]=Ag end
gJ.FilterDescendantsInstances=j9 pcall(function()gJ.RespectCanCollide=true end)local qs=ai:Raycast(Vector3 .new(Ac,Ad+4,Ae),Vector3 .new(0,-30,0),gJ)
return qs and qs.Position or nil end local function c7(qt)local qu=qt:FindFirstChildOfClass("Humanoid")return((qu and qu.HipHeight)or 2)+qt.HumanoidRootPart.Size.Y/2+0.2
end local function j_(Ah,Ai)local ka=Ah:FindFirstChildOfClass("Humanoid")local Aj=z()while z()-Aj<Ai do if ka and(ka.FloorMaterial~=Enum.Material.Air or ka.SeatPart)then return true end
ag(0.05)end return false end local function aC(Ak,kb,kc)local qv=Ak.HumanoidRootPart qv.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qv.CFrame=kc and CFrame.new(kb,Vector3 .new(kc.X,kb.Y,kc.Z))or CFrame.new(kb)end local function cm(bk,qw)local cn=aq()
if not cn or not bk then return false end local bF=bk.Position local gK=math.clamp(math.max(bk.Size.X,bk.Size.Z)/2+2.2,3,7)
local qx=(qw and qw.MaxActivationDistance)or 10 if gK>qx-2 then gK=math.max(2.5,qx-2)end local d_={}local function co(ea)
ea=Vector3 .new(ea.X,0,ea.Z)if ea.Magnitude>0.05 then d_[#d_+1]=ea.Unit end end local qy=o_()if qy then co(qy-bF)end
co(bk.CFrame.LookVector)co(-bk.CFrame.LookVector)co(bk.CFrame.RightVector)co(-bk.CFrame.RightVector)co(cn.HumanoidRootPart.Position-bF)
if#d_==0 then co(Vector3 .new(0,0,1))end local Al,gL=c7(cn),false for Jr,Am in ipairs(d_)do local gM=bF+Am*gK
local kd=gI(gM.X,bF.Y,gM.Z,{bk})if kd and math.abs(kd.Y-bF.Y)<14 then aC(cn,Vector3 .new(gM.X,kd.Y+Al,gM.Z),bF)
if j_(cn,0.7)then gL=true break end end end if not gL then aC(cn,bF+d_[1]*gK+Vector3 .new(0,3,0),bF)gL=j_(cn,1)
end ag(0.12)return gL end local function qz(eb)if not eb.Parent or not eb.Enabled then return false end pcall(function()eb:InputHoldBegin()end)
ag(math.max(eb.HoldDuration,0)+0.08)pcall(function()eb:InputHoldEnd()end)return true end local function ao(qA,An)
local Ao=z()while z()-Ao<An do if qA()then return true end ag(0.05)end return qA()end local function ec(c8,Ap,qB,Aq)
local Ar=c.zapFirst and{"zap","hold"}or{"hold","zap"}for As,ke in ipairs(Ar)do if As==2 and(Aq or not(c8 .Parent and c8 .Enabled and(not qB or qB())))then break end
local kf if ke=="hold"then kf=qz(c8)else kf=type(fireproximityprompt)=="function"and c8 .Parent~=nil and c8 .Enabled and pcall(fireproximityprompt,c8)end
if kf and ao(Ap,1.2)then c.zapFirst=(ke=="zap")return true,ke end end return false end local function qC(kg)local bG=pl()
if not bG or not bG.Enabled then C("buy: nothing on the pad")return false end local kh=dV(bG)if not kh then C("buy: pad part missing")return false end
c.lastBuyAt=z()local At,qD=V.seq,bf()local qE=aq()local Au=qE and(qE.HumanoidRootPart.Position-kh.Position).Magnitude>12
cm(kh,bG)if Au then ag(0.4)end if not bG.Enabled then C("buy aborted: pad emptied")return false end local c9=j8()
if not kg and c9 .state~="match"then C("buy aborted: "..(c9 .text or"pad changed"))c.matchSince=nil return false
end local ki=c9 .info and c9 .info.name or(c9 .state=="match"and V.name)or nil local function Av()return bG.Enabled and ac()==nil and(kg or j8().state=="match")
end local Aw,Ax=ec(bG,function()return ac()~=nil or((not bG.Enabled)and(kg or V.seq==At))end,Av,d9()~=nil)if Aw then
ao(function()return ac()~=nil end,0.8)local ed=ac()local qF=bf()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,z()C(("BOUGHT %s%s via %s"):format(ed and al(W(ed))or(c9 .shown or"?"),(qD and qF)and(" for $"..aE(qD-qF))or"",Ax))
if ed and ki and W(ed)~=W(ki)then C(("note: picked up %s, not %s"):format(ed,ki))end return true end local gN=cf()
if d9()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)C(("BUY REFUSED: cash short - have $%s, price %s"):format(aE(bf()),(gN and gN.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)C(("buy did not go through (%s, try %d) - again in %ds"):format(gN and gN.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qG()local ee=ac()if not ee then c.holding=false C("place: hands are empty")
return false end if not aO(ee)then C(("REFUSED TO WAX %s - it is not ticked"):format(al(W(ee))))return false end
for Js=1,e.PlaceTries do local bH=yD()if not bH then C("place: no free station")break end local qH=dV(bH)if qH then
cm(qH,bH)local qI=ac()if not qI then c.holding=false C("place: hands emptied on the way")return false end if not aO(qI)then C("place: what I carry changed, not waxing it")return false end
if bH.Enabled then local Ay,Az=ec(bH,function()return not bH.Enabled end,function()return bH.Enabled end)if Ay then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 V.name,V.rar,V.at=nil,nil,z()
C(("WAXED %s #%d at %s via %s"):format(al(W(ee)),c.placed,bH.Parent.Parent.Name,Az))if q.placed then pcall(q.placed,ee)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end C("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))C(c.capMsg)end return false end function A.place()local AA=z()while c.alive and A.editing and z()-AA<25 do ag(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local AB=z()while c.alive and A.current()~=e.TeamWax and z()-AB<5 do ag(0.1)end
if A.current()==e.TeamWax then ag(0.3)else C("wax team did not come on in time - placing anyway")end end local AC,qJ=pcall(qG)
A.placing=false if not AC then error(qJ,0)end return qJ end local function qK(qL)return type(qL)=="string"and qL:lower():find("crate",1,true)~=nil
end local AD={SABFarmGui=1,SABToggle=1,SABError=1}local function kj(AE)local bI=AE while bI do if AD[bI.Name]then return false end
if bI:IsA("ScreenGui")then local AF,AG=pcall(function()return bI.Enabled end)return(not AF)or AG~=false end if bI:IsA("GuiObject")and not bI.Visible then return false end
bI=bI.Parent end return false end local function gO(gP)local c_=""pcall(function()if gP:IsA("TextButton")then c_=gP.Text end end)
if not c_:find("%a")then for Jt,gQ in ipairs(gP:GetDescendants())do if(gQ:IsA("TextLabel")or gQ:IsA("TextButton"))and gQ.Text:find("%a")then c_=gQ.Text break end
end end if not c_:find("%a")then c_=gP.Name end return(c_:lower():gsub("[^%a]",""))end local function AH()local ef,eg
local qM=J:FindFirstChildOfClass("PlayerGui")if not qM then return nil,nil end for Ju,eh in ipairs(qM:GetDescendants())do
if eh:IsA("GuiButton")and kj(eh)then local kk=gO(eh)if kk:sub(1,4)=="open"and not kk:find("shop",1,true)then ef=ef or eh end
if kk:sub(1,7)=="discard"then eg=eg or eh end end end if ef and eg then return ef,eg end if j.on then return ef,eg end
return nil,nil end local kl=(function()local AI,AJ=pcall(function()return game:GetService("VirtualInputManager")end)return AI and AJ or nil end)()
local function qN(bl,km)local kn={}local function qO(AK)kn[#kn+1]=AK end if c.tapWay then qO(c.tapWay)end for Jv,qP in ipairs({"touch","conn","signal"})do
if qP~=c.tapWay then qO(qP)end end local function qQ(AL,...)local AM,ko=pcall(getconnections,AL)if not(AM and type(ko)=="table"and#ko>0)then return false end
local qR,AN,AO=false,{...},select("#",...)for Jw,AP in ipairs(ko)do if pcall(function()AP:Fire(table.unpack(AN,1,AO))end)then qR=true end
end return qR end local function qS()local qT=Vector3 .new(0,0,0)pcall(function()local qU,qV=bl.AbsolutePosition,bl.AbsoluteSize
qT=Vector3 .new(qU.X+qV.X/2,qU.Y+qV.Y/2,0)end)local kp={Position=qT,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kp.UserInputType=Enum.UserInputType.Touch end)pcall(function()kp.UserInputState=Enum.UserInputState.End end)
return kp end for Jx,bm in ipairs(kn)do local ei=false if bm=="conn"and type(getconnections)=="function"then if qQ(bl.MouseButton1Click)then
ei=true if ao(km,1.5)then c.tapWay=bm return true,bm end end ei=qQ(bl.Activated,qS(),1)elseif bm=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bl.MouseButton1Click)then if ao(km,1.5)then c.tapWay=bm return true,bm end end ei=pcall(firesignal,bl.Activated,qS(),1)
elseif bm=="touch"and kl then ei=pcall(function()local qW,qX=bl.AbsolutePosition,bl.AbsoluteSize local qY=0 local qZ=bl:FindFirstAncestorWhichIsA("ScreenGui")
local AQ,AS=pcall(function()return qZ and qZ.IgnoreGuiInset end)if not(AQ and AS)then pcall(function()qY=game:GetService("GuiService"):GetGuiInset().Y end)
end local q0,q1=qW.X+qX.X/2,qW.Y+qX.Y/2+qY kl:SendMouseButtonEvent(q0,q1,0,true,game,1)task.wait(0.06)kl:SendMouseButtonEvent(q0,q1,0,false,game,1)
end)end if ei and ao(km,1.5)then c.tapWay=bm return true,bm end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kq(q2)local ej=q2 .Parent while ej and ej~=c.plot do if j.NOT[ej.Name]then return false end ej=ej.Parent
end local kr=(q2 .ActionText or""):lower()if kr:find("roll",1,true)or kr:find("place",1,true)or kr:find("sell",1,true)then return false end
return true end local function q3()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local q4=c.plot:FindFirstChild("CrateStand")local ek if q4 then for Jy,gR in ipairs(q4:GetDescendants())do
if gR:IsA("ProximityPrompt")and gR.Enabled and kq(gR)then ek=gR break end end end if not ek then for Jz,bJ in ipairs(c.plot:GetDescendants())do
if bJ:IsA("ProximityPrompt")and bJ.Enabled and kq(bJ)then local q5=bJ:FindFirstAncestorWhichIsA("Model")local AT=((bJ.ActionText or"").." "..(bJ.ObjectText or"").." "..bJ.Name.." "..(q5 and q5 .Name or"")):lower()
if AT:find("crate",1,true)then ek=bJ break end end end end j.prompt=ek return ek end local function ks()if j.on then return true end
local el=q3()if not el then j.summonFails=j.summonFails+1 j.lastFail=z()C("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local q6=dV(el)if q6 then cm(q6,el)end j.ours=true ec(el,function()return j.on end)if ao(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()C("crate: pressed "..f5(el).." but no window came up")
return false end do local function AU(q7)local da=q7 .Parent while da and da:IsA("GuiObject")do local q8,q9=false,false
for JA,em in ipairs(da:GetDescendants())do if em~=q7 and em:IsA("GuiButton")and gO(em):sub(1,7)=="discard"then q8=true end
if em:IsA("TextLabel")then local kt=em.Text:lower()if kt:find("crate",1,true)or kt:find("can contain",1,true)or kt:find("cost",1,true)then q9=true end
end if q8 and q9 then return da end end da=da.Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local q_=J:FindFirstChildOfClass("PlayerGui")if not q_ then return nil end for JB,gS in ipairs(q_:GetDescendants())do
if gS:IsA("GuiButton")and not gS:FindFirstAncestor("SABFarmGui")and gO(gS):sub(1,4)=="open"then local ku=AU(gS)
if ku then j.win=ku return ku end end end end local function AV(AW)for JC,gT in ipairs(AW:GetDescendants())do
if gT:IsA("GuiButton")then local ra,kv=gO(gT),gT.Name:lower()if ra=="x"or ra=="close"or kv=="x"or kv:find("close",1,true)or kv:find("exit",1,true)then return gT end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(AX)task.wait(AX and 4 or 1.2)if j.on or j.waiting then return end
local gU=j.findWin()if not gU or not kj(gU)then return end local rb=AV(gU)if rb and qN(rb,function()return not kj(gU)end)then return end
C("the crate window is still open - tap its X")end end local function en(gV)if not ks()then return false end local rc=z()-(j.openedAt or 0)
if rc<0.6 then ag(0.6-rc)end local kw=j.title local AY,AZ=AH()local rd=gV and AY or AZ if not rd then j.lastFail=z()
c.crateFails=c.crateFails+1 C(("crate: no %s button found in %s"):format(gV and"Open"or"Discard",kw))return false
end local A0=ac()local A1,JD=qN(rd,function()return(not j.on)or(ac()~=nil and ac()~=A0)end)if not A1 then j.lastFail=z()
c.crateFails=c.crateFails+1 C("crate: could not press "..(gV and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gV then c.crates=c.crates+1 ao(function()return ac()~=nil end,1.5)local rf=ac()
C(("OPENED %s -> %s"):format(kw,rf and al(W(rf))or"?"))else C("discarded "..kw.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(A2,...)local A3=select("#",...)j.calls[#j.calls+1]={t=z(),m=A2,n=A3,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aH,bn)local bK=type(aH)if(bK=="string"or bK=="number")and type(bn.data)=="table"then for rg,kx in pairs(bn.data)do
if kx==aH and type(rg)=="string"and(type(kx)=="string"or type(kx)=="number")then return{__slot="f:"..rg}end end
end if bK=="string"then if bn.crate and aH==bn.crate then return{__slot="crate"}end if bn.title and aH==bn.title then return{__slot="title"}end
if bn.rar and aH==bn.rar then return{__slot="rarity"}end return aH end if bK=="number"or bK=="boolean"or bK=="nil"then return aH end
if bK=="table"then local rh={}for A4,ri in pairs(aH)do if type(ri)=="table"then return nil,"nested table"end local A5,rj=j.slot(ri,bn)
if rj then return nil,rj end rh[A4]=A5 end return rh end local A6,A7=pcall(function()return aH:IsA("Instance")end)
if A6 and A7 then if aH==J then return{__slot="player"}end if c.plot and aH==c.plot then return{__slot="plot"}end
local gW=c.plot and c.plot:FindFirstChild("CrateStand")if gW and aH==gW then return{__slot="stand"}end if gW and aH.Parent==gW then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bK..")"end function j.resolve(gX)if type(gX)~="table"then return gX end
local aV=gX.__slot if aV and aV:sub(1,2)=="f:"then return j.data and j.data[aV:sub(3)]end if aV=="crate"then return j.data and j.data.name end
if aV=="title"then return(j.data and j.data.title)or j.title end if aV=="rarity"then return j.data and j.data.rarity end
if aV=="player"then return J end if aV=="plot"then return c.plot end if aV=="stand"or aV=="model"then local ky=c.plot and c.plot:FindFirstChild("CrateStand")
if aV=="stand"or not ky then return ky end for JE,rk in ipairs(ky:GetChildren())do if qK(rk.Name)then return rk end end
return nil end local rl={}for A8,A9 in pairs(gX)do rl[A8]=j.resolve(A9)end return rl end function j.classify(kz)
if j.directOff then return end local gY={}for JF,kA in ipairs(j.calls)do if kA.t<=kz+0.05 and kz-kA.t<=6 then gY[#gY+1]=kA end
end if#gY==0 then return end if not ao(function()return(j.heldAt or 0)>=kz-1 end,2.5)then return end local eo={}
for JG,ep in ipairs(gY)do local rm={}for rn=1,ep.n do local A_,ro=j.slot(ep.args[rn],ep)if ro then C("crate call has "..ro.." - keeping the button method")
return end rm[rn]=A_ end eo[#eo+1]={m=ep.m,n=ep.n,args=rm}end local kB=j.learned j.learned={seq=eo,mode=kB and kB.mode or nil}
ak.dirty=true if not kB then C(("learned how to open crates directly (%d call%s)"):format(#eo,#eo==1 and""or"s"))end
end function j.replay()local rp=j.learned local rq=af:FindFirstChild("Remotes")local kC=rq and rq:FindFirstChild("CrateAction")
if not(rp and kC)then return false end local rr=table.unpack or unpack j.replaying=true for JH,eq in ipairs(rp.seq)do
local kD={}for rs=1,eq.n do kD[rs]=j.resolve(eq.args[rs])end task.spawn(function()pcall(function()if eq.m=="InvokeServer"then kC:InvokeServer(rr(kD,1,eq.n))
else kC:FireServer(rr(kD,1,eq.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(Ba)return(Ba:gsub("[%%|;=,\n]",function(Bb)return("%%%02X"):format(Bb:byte())end))end
function j.enc(cp)local gZ=type(cp)if gZ=="string"then return"s"..j.esc(cp)end if gZ=="number"then return"n"..tostring(cp)end
if gZ=="boolean"then return cp and"b1"or"b0"end if gZ=="nil"then return"z"end if cp.__slot then return"k"..cp.__slot end
local kE={}for Bc,Bd in pairs(cp)do kE[#kE+1]=j.enc(Bc).."="..j.enc(Bd)end return"t"..table.concat(kE,",")end
function j.dec(rt)local er,es=rt:sub(1,1),rt:sub(2)local function Be(Bf)return(Bf:gsub("%%(%x%x)",function(Bg)return string.char(tonumber(Bg,16))end))end
if er=="s"then return Be(es)end if er=="n"then return tonumber(es)end if er=="b"then return es=="1"end if er=="k"then return{__slot=es}end
if er=="t"then local ru={}for Bh in es:gmatch("[^,]+")do local rv,Bi=Bh:match("^(.-)=(.*)$")if rv then local rw=j.dec(rv)
if rw~=nil then ru[rw]=j.dec(Bi)end end end return ru end return nil end function j.goneOrNew(Bj)return function()
if not j.waiting then return true end local rx=ac()return rx~=nil and rx~=Bj end end function j.near()local ry=af:FindFirstChild("Remotes")
local kF=ry and ry:FindFirstChild("CrateAction")local g0=aq()local kG=c.plot and c.plot:FindFirstChild("CrateStand")
local kH=kG and kG:FindFirstChild("Spot")if not(kF and g0 and kH)then C(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kF and"no CrateAction remote"or not g0 and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kI=g0 .HumanoidRootPart local g1=kI.CFrame local rz,kJ=j.title,"no answer"local Bk=ac()local rA=kG:FindFirstChild("Holder")
local function rB()if not rA then return j.waiting or j.on end for JI,Bl in ipairs(rA:GetChildren())do if Bl:IsA("Model")then return true end end
return false end for Bm=1,3 do if not(j.waiting or j.on)or not rB()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kI.Position-kH.Position).Magnitude>8 then cm(kH,j.prompt)end ag(0.12+0.15*Bm)
local a8={}j.replaying=true task.spawn(function()a8 .ok,a8 .v=pcall(function()return kF:InvokeServer("open")end)
a8 .done=true end)ao(function()return a8 .done end,6)j.replaying=false local cq=a8 .v if a8 .done and a8 .ok and type(cq)=="table"and cq.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 C(("OPENED %s -> %s (no window)"):format(rz,cq.prize and al(W(tostring(cq.prize)))or"?"))
ao(function()local rC=ac()return rC~=nil and rC~=Bk end,1.5)if(kI.Position-g1 .Position).Magnitude>8 then pcall(function()aC(g0,g1 .Position,g1 .Position+g1 .LookVector)end)end
return true,"opened"end kJ=(a8 .done and a8 .ok and type(cq)=="table")and tostring(cq.reason or"refused, no reason given")
or(a8 .done and("error: "..tostring(cq))or"no answer in 6s")ag(0.3)if not rB()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 C(("crate: the server would not open %s next to the stand (%s)"):format(rz,kJ))
return false,kJ end j.GIVEUP=600 function j.drop()local rD=af:FindFirstChild("Remotes")local rE=rD and rD:FindFirstChild("CrateAction")
local rF=c.plot and c.plot:FindFirstChild("CrateStand")local kK=rF and rF:FindFirstChild("Spot")local rG=aq()
if kK and rG and(rG.HumanoidRootPart.Position-kK.Position).Magnitude>8 then cm(kK,j.prompt)ag(0.3)end local kL,bo=false,nil
if rE then kL,bo=pcall(function()return rE:InvokeServer("discard")end)end C(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(kL and type(bo)=="table"and bo.ok)and"done"or("answer: "..tostring(type(bo)=="table"and(bo.reason or bo.ok)or bo))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(kL and type(bo)=="table"and bo.ok)then en(false)end end function j.smart()local kM=j.title if(j.nearFails or 0)<3 then
local Bn=j.near()if Bn then return true end if j.nearFails>=3 then C("opening next to the stand failed 3 times - trying the older ways")end
end local cr=j.learned if cr then local kN=ac()if j.on then j.replay()if ao(j.goneOrNew(kN),3.5)then c.crates=c.crates+1
C("OPENED "..kM.." (direct)")return true end else if cr.mode~="window"then j.replay()if ao(j.goneOrNew(kN),3.5)then
c.crates,j.fails=c.crates+1,0 if cr.mode~="direct"then cr.mode,ak.dirty="direct",true C("crates now open directly - the window never comes up")
end C("OPENED "..kM.." (direct, no window)")return true end end if ks()then j.replay()if ao(j.goneOrNew(kN),3.5)then
c.crates,j.fails=c.crates+1,0 if cr.mode~="window"then cr.mode,ak.dirty="window",true C("crates need their window up first - it shows briefly")
end C("OPENED "..kM.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,ak.dirty=cr,nil,true
if j.fails>=3 then j.directOff=true C("direct crate opening failed 3 times - using the button for now")else C("the learned crate call did not work - back to pressing Open")
end end return en(true)end function D.snap()return{rules=J:GetAttribute("AutoRollRules"),stop=J:GetAttribute("AutoRollStop"),
on=J:GetAttribute("AutoRollOn"),main=J:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for Bo,rH in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(J:GetAttributeChangedSignal(rH):Connect(function()D.cache[Bo]=J:GetAttribute(rH)end))
end end function D.isOn()return J:GetAttribute("AutoRollOn")==true end function D.saw(Bp,...)local g2=D.cache
local Bq={m=Bp,n=select("#",...),args={...},before={rules=g2 .rules,stop=g2 .stop,on=g2 .on,main=g2 .main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,Bq)end end)end function D.learnOne(et)local aA,eu=D.snap(),et.before local g3=(aA.rules~=eu.rules)or(aA.stop~=eu.stop)
local rI=(aA.on~=eu.on)or(aA.main~=eu.main)if not g3 and not rI then return end local rJ={}for rK=1,et.n do local aP=et.args[rK]
local cs=type(aP)if cs=="string"and aP~=""and aP==aA.rules then aP={__slot="rules"}elseif cs=="string"and aP~=""and g3 and aP==aA.stop and aA.stop~=eu.stop then aP={__slot="stop"}
elseif cs=="table"then local rL={}for Br,db in pairs(aP)do if type(db)=="table"or(type(db)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end rL[Br]=(type(db)=="string"and db~=""and db==aA.rules)and{__slot="rules"}or db end aP=rL elseif cs~="string"and cs~="number"and cs~="boolean"and cs~="nil"then
if aP==J then aP={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end rJ[rK]=aP
end local dc={m=et.m,n=et.n,args=rJ}if g3 then local kO=false for Bs=1,dc.n do local ev=dc.args[Bs]if type(ev)=="table"and ev.__slot=="rules"then kO=true end
if type(ev)=="table"and not ev.__slot then for JJ,rM in pairs(ev)do if type(rM)=="table"and rM.__slot=="rules"then kO=true end end
end end if kO then D.rec.rules={dc}else table.insert(D.rec.rules,dc)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if rI then if aA.on==true then D.rec.on=dc else D.rec.off=dc end e.AutoRoll=(aA.on==true)end if aA.rules and aA.rules~=""then e.ARrules,e.ARstop=aA.rules,aA.stop or""end
ak.dirty=true D.msg=""C(("learned an Auto Roll %s message"):format(g3 and"choices"or(aA.on and"on"or"off")))end
function D.resolve(dd)if type(dd)~="table"then return dd end if dd.__slot=="rules"then return e.ARrules~=""and e.ARrules or J:GetAttribute("AutoRollRules")end
if dd.__slot=="stop"then return e.ARstop~=""and e.ARstop or J:GetAttribute("AutoRollStop")end if dd.__slot=="player"then return J end
local rN={}for Bt,Bu in pairs(dd)do rN[Bt]=D.resolve(Bu)end return rN end function D.replay(rO,Bv)local rP=table.unpack or unpack
for JK,ew in ipairs(Bv)do local kP={}for rQ=1,ew.n do kP[rQ]=D.resolve(ew.args[rQ])end D.replaying=true pcall(function()
if ew.m=="InvokeServer"then task.spawn(function()pcall(function()rO:InvokeServer(rP(kP,1,ew.n))end)end)else rO:FireServer(rP(kP,1,ew.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(rR,Bw)if D.busy or not c.alive then return end D.busy=true
pcall(function()local rS=af:FindFirstChild("Remotes")local kQ=rS and rS:FindFirstChild("AutoRollAction")if not kQ then D.msg="this game has no AutoRollAction"return end
local bL=e.AutoRoll if bL and e.ARrules~=""and J:GetAttribute("AutoRollRules")~=e.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"C(D.msg)else D.replay(kQ,D.rec.rules)
if ao(function()return J:GetAttribute("AutoRollRules")==e.ARrules end,4)then C("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"C(D.msg)end end end if bL==D.isOn()or(not bL and not Bw)then return end
local g4=bL and D.rec.on or D.rec.off if not g4 then local ex=bL and D.rec.off or D.rec.on local rT=ex~=nil for Bx=1,ex and ex.n or 0 do
if type(ex.args[Bx])=="boolean"then rT=false end end if rT then g4=ex end end if not g4 then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bL and"on"or"off")
C(D.msg)return end D.replay(kQ,{g4})if ao(function()return D.isOn()==bL end,4)then D.msg=""C(("Auto Roll switched %s%s"):format(bL and"ON"or"OFF",rR and(" ("..rR..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"C(D.msg)end end)D.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local By,Bz=pcall(function()return J.UserId end)return By and Bz or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local BA,kR=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if BA and type(kR)=="table"and type(kR.Pets)=="table"then o.I=kR end return o.I end function o.order()if o.list then return o.list end
local bM=o.info()if not bM then return{}end local ct={}if type(bM.Order)=="table"and#bM.Order>0 then for JL,rU in ipairs(bM.Order)do if bM.Pets[rU]then ct[#ct+1]=rU end end
else for BB in pairs(bM.Pets)do ct[#ct+1]=BB end table.sort(ct,function(BC,BD)return(bM.Pets[BC].price or 0)<(bM.Pets[BD].price or 0)end)
end o.list=ct return ct end function o.nice(rV,kS)local rW=o.info()local rX=rW and rW.Pets[rV]return((kS and kS~="")and(kS.." ")or"")..(rX and rX.displayName or tostring(rV))
end function o.data()local g5=J:GetAttribute("PetsData")if type(g5)~="string"then return nil end if g5==o.rawD then return o.lastD end
local BE,ey=pcall(function()return o.HS:JSONDecode(g5)end)ey=(BE and type(ey)=="table")and ey or nil o.rawD,o.lastD=g5,ey
return ey end function o.pen()return af:FindFirstChild("PetMeadowSpawns")end function o.srv()return ai:GetServerTimeNow()end
function o.money()local kT=J:FindFirstChild("MoneyValue")if kT and type(kT.Value)=="number"then return kT.Value end
return bf()or 0 end function o.wishes()local rY=o.pen()local rZ=rY and rY:GetAttribute("Wishes")local kU,r0={},o.srv()
if type(rZ)~="string"then return kU end local BF,r1=pcall(function()return o.HS:JSONDecode(rZ)end)if BF and type(r1)=="table"then
for BG,kV in pairs(r1)do if type(kV)=="number"and kV>r0 then kU[BG]=kV-r0 end end end return kU end function o.call(...)
local r2=af:FindFirstChild("Remotes")local r3=r2 and r2:FindFirstChild("PetRequest")if not r3 then return nil end
local r4=table.pack(...)local cu={}task.spawn(function()cu.ok,cu.v=pcall(function()return r3:InvokeServer(table.unpack(r4,1,r4 .n))end)
cu.done=true end)local BH=z()while not cu.done and z()-BH<6 do task.wait(0.05)end if cu.done and cu.ok then return cu.v end
return nil end function o.want(BI)return e.Pets[BI]end function o.closeNaming(kW)local r6=pcall(function()local r5=J:FindFirstChild("PlayerScripts")
local BJ=r5 and r5:FindFirstChild("Naming",true)require(BJ).close()end)ag(0.5)if kW.Visible then pcall(function()local r7=kW:FindFirstChild("NameBox",true)if r7 then r7:ReleaseFocus()end end)
kW.Visible=false r6=false end return r6 end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local r8=J:FindFirstChildOfClass("PlayerGui")
local r9=r8 and r8:FindFirstChild("MainGui")local g6=r9 and r9:FindFirstChild("PetNameGui")if g6 and g6 .Visible then
ag(0.4)if g6 .Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,g6)break end end ag(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local kX,r_,g7=o.info(),o.pen(),o.data()
if not(kX and r_ and g7)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local ez,kY=#(g7 .pets or{}),tonumber(g7 .maxOwned)or 60
local BK,sa,eA=o.srv(),{},nil for JM,aW in ipairs(r_:GetChildren())do sa[aW.Name]=true local cv,g8=aW:GetAttribute("Pet"),aW:GetAttribute("Variant")or""
local kZ=cv and o.want(cv)if kZ and kZ.b and kX.Pets[cv]and(not kZ.g or g8=="Big")and y.wantMore(cv,g8,g7)and not aW:GetAttribute("A_"..o.uid)
and(tonumber(aW:GetAttribute("ExpiresAt"))or 0)>BK+1 and z()>=(o.tryAt[aW.Name]or 0)then local eB,sb=o.nice(cv,g8),kX.Pets[cv].price or 0
if ez>=kY then eA=("%s is in the pen, but you have %d/%d pets"):format(eB,ez,kY)o.tryAt[aW.Name]=z()+15 elseif o.money()<sb then
eA=("%s is in the pen - need $%s"):format(eB,aE(sb))o.tryAt[aW.Name]=z()+5 else o.tryAt[aW.Name]=z()+8 local bN=o.call("adopt",aW.Name)
if type(bN)=="table"and bN.ok then ez=ez+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local BL=type(bN.pet)=="table"and bN.pet or{}
table.insert(o.recent,{id=tostring(BL.id or("?"..z())),name=cv,variant=g8,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
C("ADOPTED "..eB)o.skipNaming()eA="adopted "..eB else local sc=type(bN)=="table"and tostring(bN.reason or"no reason given")or"no answer"
C(("adopt %s failed: %s"):format(eB,sc))eA="adopt failed: "..sc if type(bN)=="table"and bN.bagFull then o.tryAt[aW.Name]=z()+60 end
end end end end for sd in pairs(o.tryAt)do if not sa[sd]then o.tryAt[sd]=nil end end o.buyMsg=eA or("watching the pen (%d/%d pets)"):format(ez,kY)
end function o.stacks()local se=o.pen()local BM=se and se:GetAttribute("WishStacks")local BN,sf=pcall(function()return o.HS:JSONDecode(BM)end)
return(BN and type(sf)=="table")and sf or{}end function o.stackTick(BO,BP)local g9=o.info()local sh=(type(g9 .Wish)=="table"and tonumber(g9 .Wish.maxStacks))or 1
if sh<=1 then return end local BQ=o.stacks()o.stackTry=o.stackTry or{}for JN,aX in ipairs(o.order())do local sj=o.want(aX)
local g_=tonumber(BQ[aX])or 1 if sj and sj.w and BO[aX]and g_<sh and y.wantMore(aX,"",BP)and z()>=(o.stackTry[aX]or 0)then
local BR,ha=pcall(g9 .wishPrice,aX,g_+1)ha=BR and tonumber(ha)or((g9 .Pets[aX].price or 0)*2*3^g_)o.stackTry[aX]=z()+5
if ha<=o.money()*0.01 then local sk=o.call("wish",aX)if type(sk)=="table"and sk.ok then o.wishN=o.wishN+1 C(("WISH x%d on %s ($%s)"):format(g_+1,o.nice(aX),aE(ha)))
else o.stackTry[aX]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local hb=o.info()if not(hb and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bO,k0,bP=o.wishes(),0,nil local BS=(type(hb.Wish)=="table"and hb.Wish.cashShare)or 2 local sl=o.data()for JO,aD in ipairs(o.order())do
local sm=o.want(aD)if sm and sm.w and y.wantMore(aD,"",sl)then k0=k0+1 if not bO[aD]and z()>=(o.wishTry[aD]or 0)then
local k1=tonumber(J:GetAttribute("PetWishCredits"))or 0 local k2=math.floor((hb.Pets[aD].price or 0)*BS)if k1<=0 and o.money()<k2 then
o.wishTry[aD]=z()+10 bP=("need $%s to wish for %s"):format(aE(k2),o.nice(aD))o.wishWhy[aD]=bP else o.wishTry[aD]=z()+3
local BT=k1>0 and"wishCredit"or"wish"local hc=o.call(BT,aD)if type(hc)=="table"and hc.ok then o.wishN,o.wishWhy[aD]=o.wishN+1,nil
C(("WISHED for %s (%s)"):format(o.nice(aD),k1>0 and"free wish"or("$"..aE(k2))))else local k3=type(hc)=="table"and tostring(hc.reason or"no reason given")or"no answer"
if k3:lower():find("already",1,true)then o.wishTry[aD]=z()+2 else C(("wish %s failed: %s"):format(o.nice(aD),k3))bP="wish failed: "..k3 end
end end end end end pcall(o.stackTick,bO,sl)if not bP then for JP,hd in ipairs(o.order())do local sn=o.want(hd)
if sn and sn.w and not bO[hd]and o.wishWhy[hd]then bP=o.wishWhy[hd]break end end end if not bP then local de={}
for JQ,eC in ipairs(o.order())do local so=o.want(eC)local sp=tonumber(o.stacks()[eC])or 1 if so and so.w and bO[eC]then de[#de+1]=("%s%s %dm"):format(o.nice(eC),sp>1 and(" x"..sp)or"",math.ceil(bO[eC]/60))end
end local he for JR,hf in ipairs(o.order())do local sq=o.want(hf)if sq and sq.w and bO[hf]and(not he or bO[hf]<he)then he=bO[hf]end
end bP=k0==0 and"no pet has WISH ticked"or(#de==0 and"running: none yet")or(#de<=3 and("running: "..table.concat(de,", ")))
or("%d running, the next one ends in %dm"):format(#de,math.ceil((he or 0)/60))end o.wishMsg=bP end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local k4=o.data()return(k4 and k4 .teams)or{},k4 end function A.current(df)
df=df or o.data()if not df then return""end local sr={}for JS,BU in ipairs(df.equipped or{})do sr[tostring(BU)]=true end
for JT,ss in ipairs(df.teams or{})do local su=ss.pets or{}local k5=#su==#(df.equipped or{})if k5 then for JU,BV in ipairs(su)do if not sr[tostring(BV)]then k5=false break end end end
if k5 then return ss.name end end return""end function A.equip(k6)local BW,BX=A.teams()local k7 for BY,BZ in ipairs(BW)do if BZ.name==k6 then k7=BY break end end
if not k7 then A.msg="no saved team called "..tostring(k6)return false end if A.current(BX)==k6 then return true end
for JV=1,4 do local sv=o.call("teamEquip",k7)if type(sv)=="table"and sv.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(B0)local sx=B0:FindFirstChild("SquishyPlaceHolder")local sy=sx and sx:FindFirstChild("TimerGui")
local sz=sy and sy:FindFirstChildWhichIsA("TextLabel",true)local k8=sz and sz.Text if type(k8)~="string"or k8:find("-",1,true)then return nil end
local k9,sA,sB=k8:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not k9 then return nil end local sC=sB~=""and(tonumber(k9)*3600+tonumber(sA)*60+tonumber(sB))or(tonumber(k9)*60+tonumber(sA))
return sC>0 and sC or nil end function A.waxes()local eD={}local sD=c.plot and c.plot:FindFirstChild("WaxStations")
if not sD then return eD end local sE=o.srv()for JW,a9 in ipairs(sD:GetChildren())do local k_=tonumber(a9:GetAttribute("PourEnd"))
local sF=a9:GetAttribute("PourOwner")if a9:GetAttribute("HasSquishy")and a9:GetAttribute("PourId")and(sF==nil or sF==o.uid)then
local la=A.left(a9)local sG=la and(sE+la)or((k_ and k_>sE)and k_ or nil)if sG then local sH,sI=a9:FindFirstChild("SquishyPlaceHolder"),"?"
if sH then for JX,sJ in ipairs(sH:GetChildren())do if sJ:IsA("Model")then sI=sJ.Name break end end end local B1=tostring(a9:GetAttribute("Helpers")or"")
local lb=0 for JY in B1:gmatch("%d+")do lb=lb+1 end eD[#eD+1]={st=a9,ends=sG,sure=la~=nil,id=a9:GetAttribute("PourId"),name=sI,helps=lb,
long=a9:GetAttribute("PourLong")==true}end end end table.sort(eD,function(B2,B3)return B2 .ends<B3 .ends end)
return eD end function A.glazeCount()local sK=af:FindFirstChild("Remotes")local sL=sK and sK:FindFirstChild("EditStack")
if not sL then return nil end local B4,eE=pcall(function()return sL:InvokeServer("State",nil)end)if not(B4 and type(eE)=="table"and type(eE.state)=="table")then return nil end
local lc,ld=0,{}for JZ,hg in ipairs(eE.state.entries or{})do if hg.glaze and hg.glaze~=""then lc=lc+1 ld[hg.glaze]=(ld[hg.glaze]or 0)+1 end
end return lc,ld,#(eE.state.entries or{}),eE.state.capacity end function A.finishedOne(hh,sM)A.finished=A.finished+1
task.wait(2)local le,B5,sN,B6=A.glazeCount()if le and sM and le>sM then A.glazed=A.glazed+1 local lf={}for B7,B8 in pairs(B5)do lf[#lf+1]=B7 .." "..B8 end
C(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(al(W(hh.name)),hh.st.Name,le,table.concat(lf,", ")))
else C(("wax done on station %s: %s, no glaze%s"):format(hh.st.Name,al(W(hh.name)),sN and(" (stack "..sN.."/"..tostring(B6)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cw=o.srv()local aI=A.glazeFor if aI then local eF=aI.st local sO=eF.Parent and eF:GetAttribute("HasSquishy")and eF:GetAttribute("PourId")==aI.id
local sP=sO and A.left(eF)if sP then aI.ends=cw+sP end if not sO then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aI.id or"?"]then
A.done[aI.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aI.id or"?"]=true},1 end local B9=aI.before
task.spawn(function()pcall(A.finishedOne,aI,B9)end)end elseif aI.ends-cw>e.GlazeLead*3+60 or cw>aI.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aI.id or"?"]=z()+120 C(("station %s is not finishing yet (%s left) - glaze team off again"):format(eF.Name,A.clock(aI.ends-cw)))
end end if e.TeamGlaze~=""and not A.glazeFor then local B_=A.speedRatio(e.TeamGlaze)for J0,cx in ipairs(A.list)do
if cx.sure and(cx.ends-cw)*B_[cx.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cx.id or"?"]or 0)and not A.done[cx.id or"?"]then
A.glazeFor=cx task.spawn(function()cx.before=A.glazeCount()end)break end end end local aJ,eG="",""local dg=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cw)
if dg and dg<-8 then q.snapAt,dg=nil,nil end if e.TeamGlaze~=""and dg and dg<=20 then aJ,eG=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(dg)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aJ,eG=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aJ,eG=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aJ,eG=e.TeamFull," - every station is busy"else aJ=e.TeamNormal end A.want=aJ local eH=A.current()A.cur=eH if aJ~=""and eH~=aJ and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aJ)then C("team: "..aJ..eG)else A.nextTry=z()+3 end end local lg=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eH~=""and eH or"(not a saved team)",(aJ~=""and aJ~=eH)and(" -> "..aJ)or"",
lg and("in "..A.clock(lg.ends-cw).." (st "..lg.st.Name..")")or"- none running")end function A.clock(bQ)bQ=math.max(0,math.floor(bQ))
if bQ>=3600 then return("%d:%02d:%02d"):format(math.floor(bQ/3600),math.floor((bQ%3600)/60),bQ%60)end return("%d:%02d"):format(math.floor(bQ/60),bQ%60)
end function A.allBusy()local Ca,Cb=f7()return Cb>0 and Ca==0 end function A.aboutToPlace()if not c.running then return false end
local sQ=ac()if not(sQ and aO(sQ))then return false end local Cc=f7()return Cc>0 end function A.mult(sR,Cd,sS)return{(1+sR)*(1+sS),(1+sR+Cd)*(1+sS)}end
function A.speedNow()local function lh(Ce)return tonumber(J:GetAttribute(Ce))or 0 end return A.mult(lh("PetWaxSpeed"),lh("PetLongWax"),lh("PetSocialWax"))
end function A.speedOf(Cf)local Cg,sT=A.teams()if not sT then return nil end for J1,sU in ipairs(Cg)do if sU.name==Cf then
local li={}for J2,Ch in ipairs(sU.pets or{})do for J3,sV in ipairs(sT.pets or{})do if tostring(sV.id)==tostring(Ch)then li[#li+1]=sV break end end
end local sW=y.caps()local sX,Ci=y.stats(li)return A.mult(math.min(sX.waxSpeed or 0,sW.waxSpeed or 0.25),math.min(sX.longWax or 0,sW.longWax or 0.3),Ci.socialWax or 0)
end end return nil end function A.speedRatio(Cj)local sY,lj=A.speedNow(),A.speedOf(Cj)if not lj then return{1,1}end
return{sY[1]/lj[1],sY[2]/lj[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(Ck)local lk=o.info()if lk and type(lk.fuseNeed)=="function"then local Cl,ll=pcall(lk.fuseNeed,J,Ck or"")
if Cl and tonumber(ll)and tonumber(ll)>=2 then return tonumber(ll)end end if J:GetAttribute("FusePass")==true or J:GetAttribute("FusePass4")==true then return 3 end
if J:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(sZ)
if sZ=="Huge"then return y.needFor("")*y.needFor("Big")end if sZ=="Big"then return y.needFor("")end return 1 end
function y.nextOf(s0)return(s0==""and"Big")or(s0=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lm=o.info()return(lm and type(lm.HugeCaps)=="table")and lm.HugeCaps or y.HCAPS end function y.cosmic()local ln=o.info()return(ln and type(ln.CosmicCaps)=="table")and ln.CosmicCaps or{StarWhale=0.1}end
function y.slots()local s1=o.data()return tonumber(s1 and s1 .slots)or(3+(tonumber(J:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lo=o.info()return(lo and type(lo.Caps)=="table")and lo.Caps or y.CAPS end function y.value(s2,cy)
local hi=o.info()local cz=hi and hi.Pets[s2]if not(cz and type(cz.boost)=="table")then return nil end local cA
if type(hi.boostValue)=="function"then local Cm,Cn=pcall(hi.boostValue,s2,(cy~=""and cy)or nil)cA=Cm and tonumber(Cn)or nil
end if not cA then local eI=cz.boost.value or 0 cA=eI if cy=="Big"or cy=="Huge"then local s3=eI*(cy=="Huge"and 1.75 or 1.5)
cA=y.ROUND[cz.boost.kind]and math.max(eI+(cy=="Huge"and 2 or 1),math.floor(s3+0.5))or s3 if cy=="Huge"and y.ROUND[cz.boost.kind]then cA=math.max(cA,math.max(eI+1,math.floor(eI*1.5+0.5))+1)end
end end return cz.boost.kind,cA,cz.boost.every end function y.stats(Co)local cB,lp,s4,eJ={},{},{},{}local Cp=y.cosmic()
for J4,dh in ipairs(Co)do local au,eK,s5=y.value(dh.name,dh.variant or"")if au then if dh.variant=="Huge"then s4[y.CAPKEY[au]or au]=true end
if au:sub(1,6)=="social"then lp[au]=math.max(lp[au]or 0,eK)elseif au=="waxStir"or au=="cashGift"then cB[au]=(cB[au]or 0)+eK*60/(s5 or 60)
elseif au=="luckyPull"then cB.luckyPull=(cB.luckyPull or 0)+eK/(s5 or 10)else cB[au]=(cB[au]or 0)+eK if Cp[dh.name]then eJ[au]=eJ[au]or{}eJ[au][dh.name]=(eJ[au][dh.name]or 0)+eK end
end end end return cB,lp,s4,eJ end function y.glazeGain(Cq,hj)local eL,lq,J5={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local Cr=eL[1]+eL[2]+eL[3]local Cs=tonumber(J:GetAttribute("GuildUpGlaze"))or 0 local di={}for hk=1,3 do di[hk]=eL[hk]+Cq*eL[hk]/Cr+(hk==1 and Cs or 0)end
local lr={di[1]*(1-hj),di[2]*(1-hj)+di[1]*hj,di[3]+di[2]*hj}return lr[1]*(lq[1]-1)+lr[2]*(lq[2]-1)+lr[3]*(lq[3]-1)
end function y.score(hl,Ct)local Cu,Cv,Cw=y.caps(),y.hcaps(),y.cosmic()local hm,hn,Cx,s6=y.stats(Ct)local function ls(lt)return(Cx[lt]and Cv[lt])or Cu[lt]or math.huge end
local function bp(ho)local lu,lv=hm[ho]or 0,ls(ho)local lw=math.min(lu,lv)if s6[ho]and lu>lv then local lx=0 for Cy,Cz in pairs(s6[ho])do lx=lx+math.min(Cz,Cw[Cy]or 0)end
lw=lw+math.min(lu-lv,lx)end return lw end local CA=(1+bp("income"))*(1+(hn.socialIncome or 0))*(1+math.min(hm.cashGift or 0,ls("cashGiftPerMinute"))/60)
local CB=1+bp("luck")+(hm.luckyPull or 0)+(hn.socialLuck or 0)local s7=CB*(1+bp("newFind"))*(1+bp("rollSpeed"))
local eM=math.log(CA)local CC=math.max(tonumber(J:GetAttribute("WaxStations"))or 18,1)local ly=(1+bp("waxSpeed")+bp("longWax"))*(1+(hn.socialWax or 0))
+math.min(hm.waxStir or 0,ls("waxStirPerMinute"))/60/CC local CD=1-(1-bp("headStart"))*(1-(hn.socialHeadStart or 0))
if hl=="farm"then return eM+0.7*math.log(s7)+0.1*math.log(ly)end if hl=="full"then return eM+0.4*math.log(ly)+0.02*math.log(s7)end
if hl=="glaze"then return y.glazeGain(bp("glaze"),bp("glazeUp"))+0.001*eM end if hl=="wax"then return-math.log(1-0.5*CD)+0.001*eM+0.001*math.log(ly)end
return eM end function y.kinds(CE)local s8,lz={},{}for J6,eN in ipairs(CE)do local s9=eN.name.."|"..(eN.variant or"")
local bR=s8[s9]if not bR then bR={name=eN.name,variant=eN.variant or"",n=0,ids={}}s8[s9]=bR lz[#lz+1]=bR end bR.n=bR.n+1
bR.ids[#bR.ids+1]=eN.id end return lz end function y.bestKinds(s_,bS,CG,ta,tb)local aB,bT={},{}local function lA(CH)
local td,hp={},{}for CI,lB in ipairs(CH)do td[CI]=bS[lB]hp[lB]=(hp[lB]or 0)+1 end local eO=y.score(s_,td)if ta then for CJ,CK in pairs(hp)do eO=eO+1e-7*math.min(CK,ta[CJ]or 0)end end
if tb then for CL,CM in pairs(hp)do eO=eO-1e-8*CM*tb[bS[CL].variant]end end return eO end for J7=1,CG do local eP,lC
for hq=1,#bS do if(bT[hq]or 0)<bS[hq].n then aB[#aB+1]=hq local te=lA(aB)aB[#aB]=nil if not lC or te>lC+1e-12 then eP,lC=hq,te end
end end if not eP then break end bT[eP]=(bT[eP]or 0)+1 aB[#aB+1]=eP if#bS>40 then task.wait()end end for J8=1,6 do
task.wait()local tf,th=false,lA(aB)for lD=1,#aB do for dj=1,#bS do local hr=aB[lD]if dj~=hr and(bT[dj]or 0)<bS[dj].n then
aB[lD]=dj local ti=lA(aB)if ti>th+1e-9 then bT[hr],bT[dj],th,tf=bT[hr]-1,(bT[dj]or 0)+1,ti,true else aB[lD]=hr end
end end end if not tf then break end end local tj={}for CN,CO in ipairs(aB)do tj[CN]=bS[CO]end return aB,y.score(s_,tj)
end function y.best(CP,CQ,CS,hs)hs=hs or{}local lE=y.kinds(CQ)local lF={}for tk,CT in ipairs(lE)do for J9,CU in ipairs(CT.ids)do if hs[tostring(CU)]then lF[tk]=(lF[tk]or 0)+1 end end end
local CV,CW=y.bestKinds(CP,lE,CS,lF)local lG,lH={},{}for J_,CX in ipairs(CV)do local tl,eQ=lE[CX],nil for Ka,lI in ipairs(tl.ids)do if hs[tostring(lI)]and not lG[lI]then eQ=lI break end end
if not eQ then for Kb,tm in ipairs(tl.ids)do if not lG[tm]then eQ=tm break end end end lG[eQ]=true lH[#lH+1]=tostring(eQ)
end return lH,CW end function y.dream()local tn=o.info()if not(tn and type(tn.Pets)=="table")then return nil end
local lJ=y.slots()local to=y.needFor("").."|"..y.needFor("Big").."|"..lJ.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==to and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local C3=pcall(function()local ht={}for Kc,CY in ipairs(o.order())do for Kd,CZ in ipairs({"","Big","Huge"})do ht[#ht+1]={name=CY,variant=CZ,n=lJ,ids={}}end
end local eR,lK={},{}for Ke,hu in ipairs(y.ROLES)do if e[hu[1]]~=""then local C0,C1=y.bestKinds(hu[2],ht,lJ,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local lL,hv={},{}for Kf,tp in ipairs(C0)do lL[tp]=(lL[tp]or 0)+1 end for C2,lM in pairs(lL)do local bU=ht[C2]
eR[bU.name]=eR[bU.name]or{[""]=0,Big=0,Huge=0}eR[bU.name][bU.variant]=math.max(eR[bU.name][bU.variant],lM)hv[#hv+1]=(lM>1 and(lM.."x ")or"")..o.nice(bU.name,bU.variant)
end table.sort(hv)lK[#lK+1]={role=hu[2],team=e[hu[1]],names=hv,score=C1}end end y.dreamT,y.dreamTeams,y.dreamSig=eR,lK,to
end)y.dreaming=false if not C3 then y.dreamSig=nil end return y.dreamT end function y.owned(hw)local tq,lN={},{}
for Kg,C4 in ipairs(hw and hw.arriving or{})do tq[tostring(C4)]=true end for Kh,cC in ipairs(hw and hw.pets or{})do
if not tq[tostring(cC.id)]then lN[#lN+1]={id=tostring(cC.id),name=cC.name,variant=cC.variant or"",named=cC.named or(cC.nickname and cC.nickname~="")}
end end return lN end function y.have(tr,C5,C6)local a_={[""]=0,Big=0,Huge=0}local ts={}for Ki,eS in ipairs(y.owned(C5))do
ts[eS.id]=true if eS.name==tr and a_[eS.variant]then a_[eS.variant]=a_[eS.variant]+1 end end if C6 then for Kj,dk in ipairs(o.recent or{})do
if dk.name==tr and not ts[dk.id]and z()-dk.at<20 and a_[dk.variant or""]then a_[dk.variant or""]=a_[dk.variant or""]+1 end
end end return a_,a_[""]+a_.Big*y.unit("Big")+a_.Huge*y.unit("Huge")end function y.goal(tt)local tu=e.Pets[tt]
if tu and tonumber(tu.f)==-1 then return nil,0 end local tv=y.dream()local eT=tv and tv[tt]if not eT then return nil,0 end
return eT,eT[""]+eT.Big*y.unit("Big")+eT.Huge*y.unit("Huge")end function y.wantMore(lO,Kk,tw)if not tw then return true end
local tx=e.Pets[lO]if tx and tonumber(tx.f)==-1 then return true end local C7,C8=y.goal(lO)if not C7 then return true end
local Kl,C9=y.have(lO,tw,true)return C9<C8+y.need()end function y.status(eU,ty)if not ty then return nil end local tz=e.Pets[eU]
if tz and tonumber(tz.f)==-1 then return"KEEP: never fused"end local cD,tA=y.goal(eU)if not cD then return y.dream()and"in no best team: bought as ticked"or nil end
local lP,C_=y.have(eU,ty)local cE={}if cD.Huge>0 then cE[#cE+1]=("Huge %d/%d"):format(lP.Huge,cD.Huge)end if cD.Big>0 then cE[#cE+1]=("Big %d/%d"):format(lP.Big,cD.Big)end
if cD[""]>0 then cE[#cE+1]=("plain %d/%d"):format(lP[""],cD[""])end local Da=y.blocked and y.blocked[eU]and(" | "..y.blocked[eU])or""
return("%s | %d/%d copies%s"):format(table.concat(cE," "),math.min(C_,tA),tA,Da)end function y.wear(lQ)local lR={}
for Km,Db in ipairs(lQ)do lR[tostring(Db)]=true end for Kn=1,3 do local dl=o.data()if not dl then return false end
for Ko,tB in ipairs(dl.equipped or{})do if not lR[tostring(tB)]then o.call("unequip",tB)task.wait(0.3)end end
dl=o.data()local tC={}for Kp,Dc in ipairs(dl.equipped or{})do tC[tostring(Dc)]=true end for Kq,tD in ipairs(lQ)do
if not tC[tostring(tD)]then o.call("equip",tD)task.wait(0.3)end end task.wait(0.4)dl=o.data()local lS,tE=0,true
for Kr,Dd in ipairs(dl.equipped or{})do lS=lS+1 if not lR[tostring(Dd)]then tE=false end end if tE and lS==#lQ then return true end
end return false end function y.saveTeam(tF,tG)if not y.wear(tG)then return false,"could not put the pets on"end
local De=A.teams()local cF for Df,Dg in ipairs(De)do if Dg.name==tF then cF=Df break end end local dm if cF then
dm=o.call("teamSave",cF)else dm=o.call("teamNew")if type(dm)=="table"and dm.ok and dm.index then cF=dm.index task.wait(0.3)
o.call("teamRename",{index=cF,name=tF})end end task.wait(0.4)local lT=o.data()local tH=lT and lT.teams and cF and lT.teams[cF]
if not tH then return false,"the game did not save it"end local tI={}for Ks,Dh in ipairs(tH.pets or{})do tI[tostring(Dh)]=true end
for Kt,Di in ipairs(tG)do if not tI[tostring(Di)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local Dj=o.srv()for Ku,Dk in ipairs(A.list or{})do if Dk.ends-Dj<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local eV=o.data()if not eV then return{}end local tJ={}for Kv,Dl in ipairs(eV.arriving or{})do tJ[tostring(Dl)]=true end
local eW={}for Kw,hx in ipairs(eV.pets or{})do if not tJ[tostring(hx.id)]then eW[#eW+1]={id=tostring(hx.id),name=hx.name,variant=hx.variant or""}end
end local tK={}for Kx,tL in ipairs(eW)do tK[tL.id]=tL end local tM=tonumber(eV.slots)or 3 local lU,tN={},{}for Ky,hy in ipairs(y.ROLES)do
local eX=e[hy[1]]if eX~=""and not tN[eX]then tN[eX]=true local lV,eY,tO={},{},false for Kz,tP in ipairs(eV.teams or{})do
if tP.name==eX then for KA,Dm in ipairs(tP.pets or{})do local lW=tK[tostring(Dm)]if lW then lV[lW.id]=true eY[#eY+1]=lW else tO=true end
end end end local lX,tQ=y.best(hy[2],eW,tM,lV)local tR=y.score(hy[2],eY)local tS=#lX==#eY for KB,Dn in ipairs(lX)do if not lV[Dn]then tS=false end end
if not tS and(tO or#eY<math.min(tM,#eW)or tQ>tR+1e-4)then lU[#lU+1]={team=eX,role=hy[2],ids=lX,gain=tQ-tR}end
end end return lU end function y.rebuild(Do)local tT=y.plan()if#tT==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end A.editing,A.editingSince=true,z()
local hz=true local Ds,Dt=pcall(function()for KC,eZ in ipairs(tT)do local Dp,Dq=y.saveTeam(eZ.team,eZ.ids)local tU=o.data()
local lY={}for KD,Dr in ipairs(eZ.ids)do for KE,lZ in ipairs(tU and tU.pets or{})do if tostring(lZ.id)==Dr then lY[#lY+1]=o.nice(lZ.name,lZ.variant)end
end end if Dp then C(("TEAM %s rebuilt (%s): %s"):format(eZ.team,Do or"pets changed",table.concat(lY,", ")))else hz=false C(("TEAM %s: %s"):format(eZ.team,tostring(Dq)))end
end end)A.editing,A.nextTry=false,0 if not Ds then hz=false C("TEAM BUILD ERR "..tostring(Dt))end y.builds=y.builds+1
y.buildMsg=hz and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return hz end
function y.roleScores(tV)local bV={}for KF,tW in ipairs(tV)do bV[#bV+1]=tW.name..tW.variant end table.sort(bV)
bV=table.concat(bV,",")y.rsCache=y.rsCache or{}if y.rsCache[bV]then return y.rsCache[bV]end local Du,Dv,l0=y.kinds(tV),y.slots(),{}
for KG,l1 in ipairs(y.ROLES)do if e[l1[1]]~=""then local KH,Dw=y.bestKinds(l1[2],Du,Dv)l0[l1[2]]=Dw end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bV]=l0 return l0 end function y.noLoss(tX,Dx,Dy,Dz)local tY,e0={},{}
for KI,DA in ipairs(Dx)do tY[DA]=true end for KJ,tZ in ipairs(tX)do if not tY[tZ.id]then e0[#e0+1]=tZ end end
e0[#e0+1]={id="new",name=Dy,variant=Dz}local DB,t0=y.roleScores(tX),y.roleScores(e0)local t1=false for l2,t2 in pairs(DB)do
if(t0[l2]or-math.huge)<t2-1e-6 then return false,l2 end if(t0[l2]or 0)>t2+1e-6 then t1=true end end return true,t1
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local e1=o.data()if not e1 then return end local t3=y.owned(e1)local hA,e2={},{}for KK,DC in ipairs(e1 .teams or{})do for KL,DD in ipairs(DC.pets or{})do hA[tostring(DD)]=true end end
for KM,DE in ipairs(e1 .equipped or{})do e2[tostring(DE)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for KN,aK in ipairs(o.order())do
local hB=y.goal(aK)if hB then local l3=y.have(aK,e1)for KO,bq in ipairs({"Big",""})do local dn,l4=y.nextOf(bq),y.needFor(bq)
local DF=(bq=="Big"and l3 .Huge<hB.Huge)or(bq==""and l3 .Big<hB.Big+y.needFor("Big")*math.max(0,hB.Huge-l3 .Huge))
local e3={}for KP,l5 in ipairs(t3)do if l5 .name==aK and l5 .variant==bq then e3[#e3+1]=l5 end end if DF and#e3>=l4 and z()>=(y.failUntil[aK..bq]or 0)then
table.sort(e3,function(hC,hD)local t4=(e2[hC.id]and 4 or 0)+(hA[hC.id]and 2 or 0)+(hC.named and 1 or 0)local t5=(e2[hD.id]and 4 or 0)+(hA[hD.id]and 2 or 0)+(hD.named and 1 or 0)
if t4~=t5 then return t4<t5 end return hC.id<hD.id end)local cG,l6,t6={},{},false for dp=1,l4 do cG[dp]=e3[dp].id
if e2[cG[dp]]then l6[#l6+1]=cG[dp]end if e2[cG[dp]]or hA[cG[dp]]then t6=true end end local DG,t7=y.noLoss(t3,cG,aK,dn)
if not DG then y.blocked[aK]=("%s waits: it would weaken the %s team now"):format(dn,y.ROLENAME[t7]or tostring(t7))
elseif t6 and not y.quiet()then y.blocked[aK]=dn.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dn,o.nice(aK))
return else A.editing,A.editingSince=true,z()for KQ,DH in ipairs(l6)do o.call("unequip",DH)task.wait(0.3)end local hE=o.call("fuse",{ids=cG})
A.editing,A.nextTry=false,0 if type(hE)=="table"and hE.ok then y.fused=y.fused+1 y.dirtyAt=z()C(("FUSED %d %s -> %s"):format(l4,o.nice(aK,bq),o.nice(aK,dn)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aK,dn),os.date("%H:%M"))else y.failUntil[aK..bq]=z()+120 C(("fuse %s failed: %s"):format(o.nice(aK,bq),type(hE)=="table"and tostring(hE.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local t8=o.data()if not t8 then return end local cH={}for KR,DI in ipairs(t8 .pets or{})do cH[#cH+1]=tostring(DI.id)end
table.sort(cH)cH=table.concat(cH,",")if cH~=y.sig then y.sig,y.dirtyAt=cH,z()end local DJ=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if DJ and not A.editing then local DK=y.rebuild(y.dirtyAt and"pets changed"or"check")if DK then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cI)return cI:IsA("ParticleEmitter")or cI:IsA("Trail")or cI:IsA("Beam")or cI:IsA("Fire")or cI:IsA("Smoke")
or cI:IsA("Sparkles")or cI:IsA("Light")end function d.muteOne(br)if not e.Lite or not br.Parent then return end
local hF=(br:IsA("BillboardGui")and d.bb)or(d.isFx(br)and d.fx)or nil if not hF or hF[br]~=nil then return end
if hF==d.fx and d.gameLow and not br:IsA("Beam")then return end hF[br]=br.Enabled if br.Enabled then br.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local l7={}for KS,DL in ipairs({d.bb,d.fx})do for DM in pairs(DL)do l7[#l7+1]=DM end end local t9=os.clock()for DN,e4 in ipairs(l7)do
if e.Lite and e4 .Parent and e4 .Enabled then local DO=d.bb[e4]~=nil and d.bb or d.fx DO[e4]=true e4 .Enabled=false
end if DN%200==0 and os.clock()-t9>0.002 then task.wait()t9=os.clock()end end end function d.lite(t_)e.Lite=t_
if t_ then task.spawn(function()for DP,DQ in ipairs(ai:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,DQ)
if DP%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=T(ai.DescendantAdded:Connect(function(l8)
if e.Lite and(l8:IsA("BillboardGui")or d.isFx(l8))then d.queue[#d.queue+1]=l8 end end))end local l9=game:GetService("Lighting")
for KT,e5 in ipairs(l9:GetChildren())do if e5:IsA("PostEffect")and e5 .Enabled and d.post[e5]==nil then d.post[e5]=true e5 .Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and l9 .GlobalShadows or d.oldShadows l9 .GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and ai.Terrain.Decoration or d.oldDeco ai.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for KU,DR in pairs(d.watch)do pcall(function()DR:Disconnect()end)end
for ua,DS in pairs(d.bb)do pcall(function()if ua.Parent then ua.Enabled=DS end end)end for ub,DT in pairs(d.fx)do pcall(function()if ub.Parent then ub.Enabled=DT end end)end
for uc in pairs(d.post)do pcall(function()if uc.Parent then uc.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local DU=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()DU.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()ai.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(ud)
local DV,l_=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not DV or type(l_)~="table"then return end if ud and not d.ceOld then d.ceOld={}for KV,ue in ipairs({"Fireworks","Confetti"})do
local hG=l_[ue]if type(hG)=="table"and type(hG.Play)=="function"then d.ceOld[ue]=hG.Play pcall(function()hG.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not ud and d.ceOld then for DW,DX in pairs(d.ceOld)do pcall(function()l_[DW].Play=DX end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local ma,hH for KW,e6 in ipairs(getgc(false))do if type(e6)=="function"and(type(islclosure)~="function"or islclosure(e6))then
local DY,uf,ug=pcall(debug.info,e6,"sn")if DY and type(uf)=="string"and uf:find("ToppingCullHandler",1,true)then
if ug=="poll"then ma=e6 elseif ug=="retarget"then hH=e6 end end end end if not(ma and hH)then return nil end local DZ,hI=pcall(debug.getupvalues,hH)
local uh=DZ and type(hI)=="table"and hI[3]if type(uh)~="function"or debug.info(uh,"n")~="targetFor"or(hI[1]~=nil and type(hI[1])~="number")then return nil end
d.tc={poll=ma,re=hH}return d.tc end function d.tops(ui)local aQ=d.topsFind()if not aQ then return false end if ui and not aQ.old then
local D0,D1=pcall(hookfunction,aQ.poll,function()end)if not D0 then return false end aQ.old=D1 pcall(debug.setupvalue,aQ.re,1,-1000)
pcall(aQ.re)elseif not ui and aQ.old then local D2=type(restorefunction)=="function"and pcall(restorefunction,aQ.poll)
if not D2 then pcall(hookfunction,aQ.poll,aQ.old)end aQ.old=nil pcall(aQ.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(D3)local uj=ai:FindFirstChild("Plots")local uk=os.clock()if D3 then for KX,D4 in ipairs(uj and uj:GetChildren()or{})do
local ul=D4:FindFirstChild("SkinProps")local um=ul and ul:FindFirstChild("FairyLights")for KY,uo in ipairs(um and um:GetChildren()or{})do
for KZ,e7 in ipairs(uo:GetChildren())do if e7:IsA("BasePart")and(e7 .Name=="Bulb"or e7 .Name=="Wire")then d.lit[e7]=uo e7 .Parent=nil end
end if os.clock()-uk>0.002 then task.wait()uk=os.clock()end end end for K0,D5 in ipairs({"Leaderboards","ClanBoard"})do
local mb=ai:FindFirstChild(D5)if mb then d.boardsOff[mb]=true mb.Parent=nil end end else for D6,up in pairs(d.lit)do pcall(function()if up.Parent then D6 .Parent=up end end)end
for uq in pairs(d.boardsOff)do pcall(function()if not uq.Parent then uq.Parent=ai end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(D7)if D7 then local ur=af:FindFirstChild("Remotes")local us=ur and ur:FindFirstChild("SquishyRollAnimation")
if not us or type(getconnections)~="function"then return end local D8,D9=pcall(getconnections,us.OnClientEvent)
for K1,hJ in ipairs(D8 and D9 or{})do local mc=""pcall(function()mc=debug.info(hJ.Function,"s")end)if type(mc)=="string"and mc:find("SquishyHandler",1,true)and not d.reel[hJ]then
if pcall(function()hJ:Disable()end)then d.reel[hJ]=true end end end else for D_ in pairs(d.reel)do pcall(function()D_:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(Ea)if not Ea then for K2,Eb in pairs(d.quiet)do pcall(function()Eb:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function md(Ec,Ed)local Ee,Ef=pcall(getconnections,Ec)
for K3,hK in ipairs(Ee and Ef or{})do local me=""pcall(function()me=debug.info(hK.Function,"s")end)local mf=hK.Function
if mf and type(me)=="string"and me:find(Ed,1,true)and not d.quiet[mf]then if pcall(function()hK:Disable()end)then d.quiet[mf]=hK end
end end end local ut=ai:FindFirstChild("Plots")for K4,hL in ipairs(ut and ut:GetChildren()or{})do if hL~=c.plot then
md(hL:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uu,uv=hL:FindFirstChild("WaxStations"),hL:FindFirstChild("SquishyStack")
if uu then md(uu.DescendantAdded,"LocalToppingsHandler")end if uv then md(uv.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for uw,Eg in pairs(d.lit)do if not Eg:IsDescendantOf(game)then d.lit[uw]=nil pcall(function()uw:Destroy()end)end
end end function d.passText()local av=function(Eh)return J:GetAttribute(Eh)end local mg={}local function bW(Ei,Ej)mg[#mg+1]=(Ei and"[x] "or"[  ] ")..Ej end
bW(av("VIP")==true,"VIP: money x1.5, offline +50%")bW(av("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(av("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local Ek=av("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(av("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bW(av("FastWax")==true or av("SuperFastWax")==true,Ek.." (the farm times by the game's own timers)")local ux=(av("FusePass")==true and"Fuse Pass")or(av("FusePass4")==true and"Fuse Pass 4")or(av("FusePass5")==true and"Fuse Pass 5")or nil
bW(ux~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(ux or"Fuse pass",y.needFor(""),y.needFor("Big")))local hM=o.data()
local El=tonumber(hM and hM.maxOwned)or 60 bW(av("PetInventory50")==true or av("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(hM and#(hM.pets or{})or 0,El,(av("PetInventory50")==true and av("PetInventory100")==true)and" (both bag passes)"or""))
local uy=tonumber(av("PetEquipBought"))or 0 bW(uy>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uy))
local uz=tonumber(av("PetWishCredits"))or 0 if uz>0 then bW(true,("%d free wishes: used before cash"):format(uz))end
local uA=tonumber(av("FinishAllCredits"))or 0 if uA>0 then bW(true,("%d finish-all credits (yours to use)"):format(uA))end
return table.concat(mg,"\n")end function d.extras(hN)pcall(d.quietPlots,hN and c.plot~=nil)pcall(d.fxPatch,hN)
pcall(d.tops,hN)pcall(d.lights,hN)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uB)
e.HideHud=uB local mh=J:FindFirstChildOfClass("PlayerGui")if not mh then return end if uB then for K5,e8 in ipairs(mh:GetChildren())do
if e8:IsA("ScreenGui")and not d.MINE[e8 .Name]and e8 .Enabled then d.hud[e8]=true e8 .Enabled=false end end if not d.hudConn then
d.hudConn=T(mh.ChildAdded:Connect(function(e9)if e.HideHud and e9:IsA("ScreenGui")and not d.MINE[e9 .Name]then
task.defer(function()if e.HideHud and e9 .Enabled then d.hud[e9]=true e9 .Enabled=false end end)end end))end else
for uC in pairs(d.hud)do pcall(function()if uC.Parent then uC.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mi)e.FpsCap=mi local uD=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uD then return false end return pcall(uD,mi==0 and 60 or mi)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ap)if ap:IsA("BasePart")or ap:IsA("Decal")or ap:IsA("Texture")then if ap.Transparency<1 then d.unseen[ap]=ap.Transparency ap.Transparency=1 end
elseif ap:IsA("BillboardGui")or ap:IsA("SurfaceGui")or ap:IsA("ParticleEmitter")or ap:IsA("Beam")or ap:IsA("Trail")or ap:IsA("Light")or ap:IsA("Fire")or ap:IsA("Smoke")or ap:IsA("Sparkles")then
if ap.Enabled then d.unseen[ap]=true ap.Enabled=false end end end function d.notMine(Em)return e.HideMine or(c.plot and not Em:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(hO)
local mj=hO.Parent local mk=mj and mj.Name=="SquishyStack"and mj.Parent if mk and mk~=c.plot and c.plot and mk.Parent==c.plot.Parent and not d.dropSeen[hO]then
d.dropSeen[hO]=true d.dropQ[#d.dropQ+1]={hO,z()+3}end end function d.dropScan()local uE=c.plot and c.plot.Parent
if not(e.HideBases and uE)then return end for K6,uF in ipairs(uE:GetChildren())do local uG=uF~=c.plot and uF:FindFirstChild("SquishyStack")
for K7,En in ipairs(uG and uG:GetChildren()or{})do d.dropIt(En)end end end function d.dropStep(Eo)local ml=d.dropQ
while d.dropI<=#ml and os.clock()-Eo<0.003 do local mm=ml[d.dropI]if mm[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mm[1].Parent then pcall(function()mm[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#ml then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mn=os.clock()local e_=d.queue if e.Lite and e_ and#e_>0 then d.muteI=d.muteI or 1
while d.muteI<=#e_ and os.clock()-mn<0.0015 do pcall(d.muteOne,e_[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#e_ then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mn)end local hP=d.hideQ if d.hideI>#hP then return end while d.hideI<=#hP and os.clock()-mn<0.004 do
local mo=hP[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mo.Parent and d.notMine(mo)then pcall(d.hideOne,mo)end
end if d.hideI>#hP then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(uH)if e.HideBases then d.bases(false)end
e.HideMine=uH==2 if uH>0 then d.bases(true)end end function d.bases(uI)e.HideBases=uI local mp=ai:FindFirstChild("Plots")
if not mp then return end if uI then task.spawn(function()local mq=0 for K8,hQ in ipairs(mp:GetChildren())do local uJ=hQ~=c.plot and c.plot and hQ:FindFirstChild("SquishyStack")
for K9,Ep in ipairs(uJ and uJ:GetChildren()or{})do d.dropIt(Ep)end if hQ~=c.plot or e.HideMine then for K_,Eq in ipairs(hQ:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,Eq)mq=mq+1 if mq%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=T(mp.DescendantAdded:Connect(function(dq)if e.HideBases and d.notMine(dq)then
pcall(d.hideOne,dq)d.hideQ[#d.hideQ+1]=dq if dq.Parent and dq.Parent.Name=="SquishyStack"then d.dropIt(dq)end
end end))end else for mr,uK in pairs(d.unseen)do pcall(function()if not mr.Parent then return end if type(uK)=="number"then mr.Transparency=uK else mr.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(uL)e.NoRender=uL pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not uL)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local Er=game:GetService("RunService")local ms=0 for La,Es in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local Et,uM=pcall(function()return Er[Es]end)local uN,mt=false,nil if Et and uM then uN,mt=pcall(getconnections,uM)end
if uN and type(mt)=="table"then for Lb,hR in ipairs(mt)do local mu=""pcall(function()local uO=getfenv(hR.Function).script mu=uO and uO:GetFullName()or""end)
if mu~=""then for Lc,Eu in ipairs(d.CALM)do if mu:find(Eu,1,true)then local mv=hR.Function if mv and not d.calmedF[mv]and pcall(function()hR:Disable()end)then
d.calmedF[mv]=true d.calmed[#d.calmed+1]=hR ms=ms+1 end break end end end end end end if#d.calmed>200 then local mw={}for Ev=#d.calmed-49,#d.calmed do mw[#mw+1]=d.calmed[Ev]end d.calmed=mw
end return ms end function d.walker()local Ew,mx=pcall(function()return require(J.PlayerScripts.LocalScript.PetHandler.Walker)end)
return(Ew and type(mx)=="table"and type(mx.walkTo)=="function")and mx or nil end function d.walkers(Ex)local uP={}
local Ey,Ez=pcall(debug.getupvalues,Ex.destroy)for Ld,uQ in ipairs(Ey and Ez or{})do if type(uQ)=="table"then
for hS in pairs(uQ)do if type(hS)=="table"and rawget(hS,"model")~=nil and rawget(hS,"position")~=nil then uP[hS]=true end end
end end return uP end function d.walkPatch(uR)local fa=d.walker()if not fa then return 0 end if uR and not d.wkOld then
local uS=fa.walkTo d.wkOld=uS fa.walkTo=function(fb,fc,EA,my)local EB=fc~=nil and pcall(function()return fc.X+fc.Z end)
if not e.Calm or not EB then return uS(fb,fc,EA,my)end fb.target,fb.onArrive=nil,nil pcall(function()fb:teleport(fc)fb:render(0)end)
if my then task.spawn(my)end end elseif not uR then if d.wkOld then fa.walkTo,d.wkOld=d.wkOld,nil end return 0
end local mz=0 for aL in pairs(d.walkers(fa))do if aL.target and not aL.destroyed then local uT=aL.model and aL.model:FindFirstChild("Body")and aL.model.Body:FindFirstChild("PetBillboard")
local uU=uT and uT:FindFirstChild("TimerLabel",true)if uU and tostring(uU.Text):find("'s plot!",1,true)then pcall(function()aL:destroy()end)
pcall(function()aL.model:Destroy()end)else local EC,uV=aL.target,aL.onArrive aL.target,aL.onArrive=nil,nil pcall(function()aL:teleport(EC)aL:render(0)end)
if uV then task.spawn(uV)end end mz=mz+1 end end return mz end function d.calm(uW)e.Calm=uW if uW then local ED=d.calmScan()
local mA=0 pcall(function()mA=d.walkPatch(true)end)C(("NO ANIMATIONS: %d of the game's animation loops switched off%s"):format(ED,mA>0 and(", "..mA.." stuck pet walks cleared")or""))
else for Le,EE in ipairs(d.calmed)do pcall(function()EE:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
pcall(d.walkPatch,false)end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end
if H.arPaused then pcall(H.resume,"script stopped")end pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(uX)if c.rejoining then return end C("REJOIN this server ("..uX..")")
pcall(f_)if c.autoload then pcall(gA,c.autoload)end qa()local EF=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,J)
end)task.delay(25,function()if c.alive then d7(uX..", same server failed")end end)return EF end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=J:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local uY=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if uY then for Lf,EG in ipairs(uY:GetChildren())do local uZ=EG:FindFirstChild("SquishyPlaceHolder")local cJ=uZ and uZ:FindFirstChild("TimerGui")
if cJ and cJ:IsA("BillboardGui")then if d.bb[cJ]==nil then pcall(d.muteOne,cJ)elseif cJ.Enabled then d.bb[cJ]=true cJ.Enabled=false end
end end end local EH,dr=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if EH and type(dr)=="number"then
d.mem=dr d.memPeak=math.max(d.memPeak,dr)if(e.MemLimit or 0)>0 and dr>e.MemLimit then d.over=(d.over or 0)+((dr>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dr,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()C(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mB(hT)if type(hT)~="string"then return false end
hT=hT:lower()for Lg,EI in ipairs(c.sellWords)do if hT:find(EI,1,true)then return true end end return false end
local function EJ()local u0=af:FindFirstChild("Remotes")local mC=u0 and u0:FindFirstChild("SellSquishy")if not(mC and mC:IsA("RemoteEvent"))then return false end
if not pcall(function()mC:FireServer()end)then return false end return ao(function()return ac()==nil end,1.5)
end local function EK()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local u1=aq()local u2=u1 and u1 .HumanoidRootPart.Position local fd,u3 for Lh,ds in ipairs((c.plot or ai):GetDescendants())do
if ds:IsA("ProximityPrompt")and(mB(ds.ActionText)or mB(ds.ObjectText)or mB(ds.Name))then local u4=o7(ds)local mD=(u4 and u2)and(u4-u2).Magnitude or 1e9
if mD<=400 and(not fd or mD<u3)then fd,u3=ds,mD end end end c.sellSpot=fd c.noSellSpot=(fd==nil)return fd end
local function u5()local mE=ac()if not mE then c.holding=false return false end if aO(mE)then return false end
local mF=al(W(mE))if EJ()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=z()+2.5,0
C("SOLD "..mF)return true end local dt=EK()if dt then local u6=dV(dt)if u6 then cm(u6,dt)local u7=ac()if u7 and not aO(u7)then
local EL,EM=ec(dt,function()return ac()==nil end,function()return dt.Enabled end)if EL then c.sold,c.holding,c.sellFails=c.sold+1,false,0
C(("SOLD %s at %s via %s"):format(mF,f5(dt),EM))return true end end end end c.sellFails=c.sellFails+1 C("could not sell "..mF.." ("..c.sellFails..")")
return false end local EN={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function EO(du)local hU=f5(du):lower()for Li,EP in ipairs(EN)do if hU:find(EP,1,true)then return 0 end end
local ba,ar=du.Name:lower(),0 local function aY(EQ,ER)return EQ:find(ER,1,true)~=nil end if aY(ba,"collect")then ar=ar+60 end
if aY(ba,"cash")or aY(ba,"money")then ar=ar+45 end if aY(ba,"income")or aY(ba,"claim")then ar=ar+35 end if aY(ba,"coin")or aY(ba,"earn")or aY(ba,"green")then ar=ar+20 end
if ba=="pad"or ba=="touch"then ar=ar+25 end if ar==0 and(aY(hU,"collect")or aY(hU,"cash")or aY(hU,"money"))then ar=25 end
if ar==0 then return 0 end local fe=du.Color if fe.G>0.5 and fe.G>fe.R*1.4 and fe.G>fe.B*1.4 then ar=ar+15 end
if math.min(du.Size.X,du.Size.Y,du.Size.Z)<2 then ar=ar+5 end return ar end local function ES()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local hV,ff,mG={},nil,29 for Lj,hW in ipairs(c.plot:GetDescendants())do
if hW:IsA("BasePart")then local hX=EO(hW)if hX>0 then hV[#hV+1]={s=hX,p=hW}if hX>mG then ff,mG=hW,hX end end end
end table.sort(hV,function(ET,EU)return ET.s>EU.s end)c.padCands,c.padPart=hV,ff if ff then C("collect pad: "..f5(ff).." (score "..mG..")")end
return ff end local mH="SAB_pad_v1.txt"local function EW(EX)if type(writefile)=="function"then pcall(writefile,mH,table.concat({EX:GetComponents()},","))end
end local function EY()if type(isfile)~="function"or type(readfile)~="function"then return nil end local EZ,u8=pcall(function()if isfile(mH)then return readfile(mH)end end)
if not EZ or type(u8)~="string"then return nil end local hY={}for E0 in u8:gmatch("[^,]+")do hY[#hY+1]=tonumber(E0)end
if#hY==12 then return CFrame.new(unpack(hY))end end local function E1(mI,hZ,E2)local E3=c7(mI)local mJ=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aZ=(mJ and mJ:IsA("BasePart"))and(mJ.Position-hZ)or Vector3 .new(1,0,0)aZ=Vector3 .new(aZ.X,0,aZ.Z)if aZ.Magnitude<0.05 then aZ=Vector3 .new(1,0,0)end
aZ=aZ.Unit for E4=0,7 do local h0=E4*math.pi/4 local E5=Vector3 .new(aZ.X*math.cos(h0)-aZ.Z*math.sin(h0),0,aZ.X*math.sin(h0)+aZ.Z*math.cos(h0))
local h1=hZ+E5*(E2+5)local mK=gI(h1 .X,hZ.Y,h1 .Z)if mK and math.abs(mK.Y-hZ.Y)<8 then aC(mI,Vector3 .new(h1 .X,mK.Y+E3,h1 .Z))
if j_(mI,0.7)then return true end end end return false end local function E6()c.lastCollect=z()local fg=aq()if not fg then return end
local u9,E7=fg.HumanoidRootPart,c7(fg)local fh,u_,fi,mL=nil,4,nil,"?"local mM=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and mM and mM:IsA("BasePart")then fh,mL=(mM.CFrame*c.manualPad).Position,"manual pad"else local bs=ES()
if bs then fh=Vector3 .new(bs.Position.X,bs.Position.Y+bs.Size.Y/2+E7,bs.Position.Z)u_,fi,mL=math.max(bs.Size.X,bs.Size.Z)/2,bs,bs.Name
end end if not fh then C("COLLECT: pad not found - stand on it and tap SET PAD")return end local mN=bf()aC(fg,fh)
if fi and type(firetouchinterest)=="function"then pcall(firetouchinterest,u9,fi,0)end ag(e.PadDwell)if fi and type(firetouchinterest)=="function"then pcall(firetouchinterest,u9,fi,1)end
ag(0.5)c.collected=c.collected+1 local mO=bf()C(("COLLECTED (%s) %s"):format(mL,(mN and mO and mO>mN)and("+$"..aE(mO-mN))or"no cash change seen"))
E1(fg,fh,u_)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.mods()if q.si and z()-q.modAt<120 then return true end
local va=af:FindFirstChild("Modules")if not va then return false end local function mP(E8)local vb=va:FindFirstChild(E8)
if not vb then return nil end local E9,vc=pcall(require,vb)return(E9 and type(vc)=="table")and vc or nil end q.si,q.arm,q.ci=mP("SquishyInfo"),mP("AutoRollRules"),mP("CrateInfo")
q.modAt=z()if not q.si then return false end local mQ={}if q.arm and type(q.arm.tierOf)=="table"then for mR in pairs(q.arm.tierOf)do
local h2=q.si[mR]if type(h2)=="table"and h2 .rarity~="Limited"and not h2 .incomeType and not h2 .hiddenAfter then mQ[W(mR)]=mR end
end end q.roll=mQ local h3={}for E_,Fa in pairs(mQ)do local fj=q.si[Fa]if type(fj)=="table"and type(fj.income)=="number"and not fj.incomeType then
h3[#h3+1]={k=E_,inc=fj.income,pr=tonumber(fj.price)or 0}end end table.sort(h3,function(mS,mT)if mS.inc~=mT.inc then return mS.inc>mT.inc end return mS.pr>mT.pr end)
q.order=h3 local h4,mU,mV local Fb=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for Fc,mW in pairs(Fb)do
local mX=type(mW)=="table"and tonumber(mW.price)if mX and(not mU or mX>mU)then h4,mU,mV=Fc,mX,mW.title end end
q.bestCrate,q.bestCrateName=h4 and L.key(h4),h4 q.bestCrateTitle=mV and L.key(mV)or nil return true end function q.rank(Fd)
local Fe,Ff=pcall(function()return q.arm.rankOf(Fd)end)return(Fe and tonumber(Ff))or 0 end function q.loadDisc(vd)
if type(vd)~="table"then return end local ve={}for Fg,Fh in pairs(vd)do if Fh then ve[W(tostring(Fg))]=true end end
q.disc,q.discAt=ve,z()end function q.fetch()q.discAt=z()local vf=af:FindFirstChild("Remotes")local vg=vf and vf:FindFirstChild("GetSquishiesDiscovered")
if not vg then return end local Fi,Fj=pcall(function()return vg:InvokeServer()end)if Fi then q.loadDisc(Fj)end
end function q.scanWax()local mY={}local vh=c.plot and c.plot:FindFirstChild("WaxStations")if vh then for Lk,vi in ipairs(vh:GetChildren())do
local vj=vi:FindFirstChild("SquishyPlaceHolder")if vj and vi:GetAttribute("HasSquishy")then for Ll,vk in ipairs(vj:GetChildren())do if vk:IsA("Model")then mY[W(vk.Name)]=true end end
end end end for vl,Fk in pairs(q.placedAt)do if z()-Fk<20 then mY[vl]=true else q.placedAt[vl]=nil end end q.waxing=mY
end function q.compute()local vm,mZ,m0={},0,0 if q.disc then for m1 in pairs(q.roll or{})do if not q.disc[m1]then
if q.waxing[m1]then m0=m0+1 else vm[m1],mZ=true,mZ+1 end end end end q.need,q.nNeed,q.nWax=vm,mZ,m0 local vn,m2={},e.Best or 0
local m3=(m2==4)and q.stackMin or nil for Fl,vo in ipairs(q.order)do if(m3 and vo.inc>m3)or(not m3 and Fl<=(m2==4 and 1 or m2))then vn[vo.k]=true end
end q.best=vn end function q.readStack()q.stackAt=z()local vp=af:FindFirstChild("Remotes")local vq=vp and vp:FindFirstChild("EditStack")
if not vq then return end local Fm,dv=pcall(function()return vq:InvokeServer("State",nil)end)if not(Fm and type(dv)=="table"and type(dv.state)=="table"and type(dv.state.entries)=="table")then return end
local h5 for Lm,vr in ipairs(dv.state.entries)do local fk=type(vr)=="table"and q.si and q.si[tostring(vr.name)]
if type(fk)=="table"and type(fk.income)=="number"and not fk.incomeType and(not h5 or fk.income<h5)then h5=fk.income end
end q.stackMin=h5 q.stackFull=#dv.state.entries>=(tonumber(dv.state.capacity)or 100)end function q.want(m4)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[m4]then return true end elseif e.Targets[m4]then return true end return e.AutoIndex==true and q.need[m4]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(Fn)local fl=W(Fn)q.placedAt[fl],q.waxing[fl]=z(),true if q.need[fl]then q.need[fl],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
C(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(al(fl)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fm,fn={},{}for Fo,Fp in pairs(q.roll or{})do if q.want(Fo)then fm[Fp]=true end end
for vs,m5 in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(vs)or(type(m5)=="table"and type(m5 .title)=="string"and L.wanted(m5 .title))then fn[vs]=true end
end if not next(fm)and not next(fn)then return nil end if q.arm and type(q.arm.encode)=="function"then local Fq,vt=pcall(q.arm.encode,{rarities={},butters=fm,crates=fn,index=false})
if Fq and type(vt)=="string"then return vt end end local function vu(Fr)local h6={}for Fs in pairs(Fr)do h6[#h6+1]=Fs end table.sort(h6)return table.concat(h6,",")end
local fo="adv:"if next(fm)then fo=fo..";butters:"..vu(fm)end if next(fn)then fo=fo..";crates:"..vu(fn)end return fo
end function q.canon(Ft)local h7={}for vv in tostring(Ft or""):gmatch("[^;]+")do local m6,vw=vv:match("^(%a+):(.*)$")
if not m6 then m6,vw="r",vv:gsub("^adv:","")end for Fu in vw:gmatch("[^,]+")do h7[#h7+1]=m6 .."="..Fu end end
table.sort(h7)return table.concat(h7,"|")end function q.sync(Fv)if J:GetAttribute("AutoRoll")~=true then return end
if z()<(q.pauseUntil or 0)then return end local cK=q.rulesNow()if not cK or#cK>1900 then return end if q.canon(J:GetAttribute("AutoRollRules"))==q.canon(cK)then q.fails=0 return end
if not Fv and z()-q.sentAt<4 then return end local vx=af:FindFirstChild("Remotes")local vy=vx and vx:FindFirstChild("AutoRollAction")
if not vy then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 C("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()D.replaying=true pcall(function()vy:FireServer("Rules",cK)end)D.replaying=false e.ARrules=cK
local h8,h9=0,0 for Ln in(cK:match("butters:([^;]*)")or""):gmatch("[^,]+")do h8=h8+1 end for Lo in(cK:match("crates:([^;]*)")or""):gmatch("[^,]+")do h9=h9+1 end
local vz=h8 .."/"..h9 if q.told~=vz then q.told=vz C(("auto roll now stops on %d butters and %d crates"):format(h8,h9))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aR={}if e.AutoIndex then aR[#aR+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fp=0 for Lp in pairs(q.best)do fp=fp+1 end
aR[#aR+1]=fp==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fp,fp==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aR[#aR+1]="best: "..al(q.order[1].k)end if e.BestCrate and q.bestCrateName then aR[#aR+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aR[#aR+1]="shower: "..O.got end q.msg=#aR>0 and table.concat(aR," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(Fw)q.feed[#q.feed+1]=os.date("%H:%M ")..Fw if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vA,ax,h_)if vA~="Effect"then q.feedAdd(tostring(vA)..(ax~=nil and(": "..tostring(ax):sub(1,80))or""))
return end if ax~="ShowerTaken"and ax~="GoalPoint"then q.feedAdd(tostring(ax))end if ax=="Shower"then O.add(h_)return end
if ax=="ShowerTaken"then O.gone(h_)return end if ax=="ShowerClear"then O.drops={}return end if ax=="WaxGlow"then
local m7=type(h_)=="table"and tonumber(h_.SnapAt)if m7 then q.snapAt=m7 C(("ADMIN: every wax finishes in %ds%s"):format(math.floor(m7-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end ax=tostring(ax)cg("Admin "..ax)if ax~="GoalPoint"and z()-(q.heard[ax]or-100)>30 then q.heard[ax]=z()
C("ADMIN: "..ax)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(m8)if type(m8)~="table"or type(m8 .Pieces)~="table"then return end
for Lq,a0 in pairs(m8 .Pieces)do if type(a0)=="table"and a0 .Id~=nil and a0 .Position~=nil then O.drops[a0 .Id]={id=a0 .Id,butter=tostring(a0 .Butter or"?"),rar=tostring(a0 .Rarity or"?"),star=a0 .Star==true,
pos=a0 .Position,opens=tonumber(a0 .OpensAt)or 0,ends=tonumber(a0 .ExpiresAt)or 0}end end end function O.gone(fq)
if type(fq)~="table"or fq.Id==nil then return end O.drops[fq.Id]=nil if tonumber(fq.UserId)==o.uid then O.mine=fq.Id end
end function O.pick()local m9=o.srv()local m_,vB for vC,cL in pairs(O.drops)do if m9>=cL.ends-0.3 then O.drops[vC]=nil
elseif m9>=cL.opens-0.2 and(O.tried[vC]or 0)<3 then local vD=(aO(cL.butter)and 1e6 or 0)+(cL.star and 1e5 or 0)+q.rank(cL.rar)*100-(cL.ends-m9)
if not m_ or vD>vB then m_,vB=cL,vD end end end return m_ end function O.due()return e.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aS,na=O.pick(),aq()if not(aS and na)then return end O.tried[aS.id]=(O.tried[aS.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aC(na,aS.pos+Vector3 .new(0,c7(na)+0.5,0))ao(function()return O.mine==aS.id or ac()~=nil or not O.drops[aS.id]end,1.5)
if O.mine==aS.id or ac()then O.got,O.drops[aS.id]=O.got+1,nil C(("GRABBED %s [%s]%s from the admin shower"):format(al(W(aS.butter)),aS.rar,aS.star and" (star)"or""))
elseif not O.drops[aS.id]then O.miss=O.miss+1 end end local fr local function vE()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 C("trying again after being stopped for 5 minutes")fr(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not aq()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bC(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local nb,vF=f7()
local ia=ac()if ia then local dw=al(W(ia))if not aO(ia)then local nc=(V.gift and W(V.gift)==W(ia)and z()-V.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(dw,nc),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(dw,nc),"bad"end return"sell",("selling %s (%s)"):format(dw,nc),"warn"
end if nb<1 then return nil,("holding %s - 0 free stations"):format(dw),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(dw),"wait"end
return"place",("waxing %s (%d free)"):format(dw,nb),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local nd=c.plot:FindFirstChild("CrateStand")if nd then for Lr,fs in ipairs(nd:GetDescendants())do
if fs:IsA("ProximityPrompt")and fs.Enabled and kq(fs)then local bt=fs.ObjectText if bt==""then bt=c0(nd,"TitleLabel")or""end
if bt~=""and L.wanted(bt)then local Fx=f3(bt):gsub("crate$","")local vG for vH in pairs(ad.members)do if f3(vH)==Fx then vG=vH end end
j.waiting,j.at,j.title,j.prompt=true,z(),bt,fs j.data={name=(bt:gsub("%s","")),rarity=vG,title=bt}C(bt.." found waiting on your stand")
end break end end end end local vI=L.wanted(j.data and j.data.name)or L.wanted(j.title)if e.Crates and(j.on or j.waiting)and vI then
local a1=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a1),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 C("could not press the "..a1 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a1),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a1),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a1,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a1),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a1,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a1,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil C("trying the "..a1 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a1),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a1,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not vI then local vJ=j.title..tostring(j.rolledAt)if j.told~=vJ then j.told=vJ C(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if nb<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(vF,vF),"wait"
end local ne=pl()if not ne then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dx=cf()
if dx and qK(dx.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dx.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dx.name),"bad"end if not q3()then return nil,("%s rolled - waiting for it to land on the stand"):format(dx.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dx.name),"ok"end local bX=j8()if bX.state~="match"then
c.matchSince=nil if bX.state=="skip"and not ne.Enabled then return nil,bX.text.." (sold out)","idle"end return nil,bX.text,bX.level
end if not ne.Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local ft=z()if ft<c.noCashUntil then
local vK,Fy=d9()if vK then return nil,("cash short: have $%s, price ~$%s"):format(aE(vK),aE(Fy)),"bad"end return nil,(d9()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aE(bf()),math.ceil(c.noCashUntil-ft)),d9()and"bad"or"wait"end if ft-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or ft local vL=ft-c.matchSince if vL<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bX.shown,vL),"ok"end
return"buy",("buying %s via %s"):format(bX.shown,bX.src),"ok"end d.DEPTH=11 function d.pinTick()local vM=d.hold
if not vM then return end local nf=J.Character local ng=nf and nf:FindFirstChild("HumanoidRootPart")if not ng then return end
ng.CFrame=vM ng.AssemblyLinearVelocity=Vector3 .new(0,0,0)for Ls,ib in ipairs(nf:GetChildren())do if ib:IsA("BasePart")and ib.CanCollide then d.noclip[ib]=true ib.CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(Fz,vN)d.hold=Fz if vN then d.surface=vN end end function d.unpin(FA)
if not d.hold then return end d.hold=nil for vO in pairs(d.noclip)do pcall(function()if vO.Parent then vO.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local vP=aq()if vP and d.surface and not FA then aC(vP,d.surface.Position,d.surface.Position+d.surface.LookVector)
ag(0.1)end end function d.home()local bu,vQ=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),aq()
if not(bu and bu:IsA("BasePart")and vQ)then return nil end local vR=o_()or bu.Position local ic=Vector3 .new(vR.X-bu.Position.X,0,vR.Z-bu.Position.Z)
ic=ic.Magnitude>0.1 and ic.Unit or Vector3 .new(0,0,1)local ie=bu.Position+ic*6 local vS=gI(ie.X,bu.Position.Y,ie.Z,{bu})
return CFrame.new(ie.X,(vS and vS.Y or bu.Position.Y)+c7(vQ),ie.Z)end function d.ground(FB,vT,FC)local nh,ni={J.Character},nil
for Lt=1,12 do local nj=RaycastParams.new()nj.FilterType=Enum.RaycastFilterType.Exclude nj.FilterDescendantsInstances=nh
local ig=ai:Raycast(Vector3 .new(FB,vT,FC),Vector3 .new(0,-2000,0),nj)if not ig then break end ni,vT=ig,ig.Position.Y-0.05
nh[#nh+1]=ig.Instance end return ni and ni.Position.Y end function d.parkHome()local nk=d.home()if not nk then return false end
local dy=nk.Position local FD=d.ground(dy.X,dy.Y+300,dy.Z)or(dy.Y-3)d.pin(CFrame.new(dy.X,FD-8,dy.Z),nk)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(ih)e.Ghost,e.GhostHelps=ih==2,ih==1 if ih<2 then task.spawn(function()while c.busy do ag(0.1)end
if d.ghostMode()<2 and d.hold and not E.home then pcall(d.unpin)end end)end d.paintGhost()C("ghost: "..d.GHOST[ih][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local FE=aq()if not FE or F.seat()then return end d.parkHome()end F.n,F.fails,F.nextAt,F.msg,F.lost=0,0,0,"no campfire right now",0
function F.uid()local FF,FG=pcall(function()return J.UserId end)return FF and FG or 0 end function F.seat()local vU=ai:FindFirstChild("NightSeats")
if vU then for Lu,nl in ipairs(vU:GetChildren())do if nl.Name=="LogSeat"and nl:GetAttribute("Occupant")==F.uid()then return nl end
end end local vV=J.Character local vW=vV and vV:FindFirstChildOfClass("Humanoid")local nm=vW and vW.SeatPart return(nm and nm.Name=="LogSeat")and nm or nil
end function F.logs()local vX=ai:FindFirstChild("NightSeats")local nn,no={},{}for Lv,cM in ipairs(vX and vX:GetChildren()or{})do
local np=cM.Name=="LogSeat"and cM:FindFirstChildOfClass("ProximityPrompt")if np then nn[#nn+1]=cM local nq=cM:GetAttribute("Occupant")
local FH=(nq~=nil and nq~=0 and nq~="")or(cM:IsA("Seat")and cM.Occupant~=nil)if not FH and np.Enabled then no[#no+1]={st=cM,p=np}end
end end return nn,no end function F.due()if not(e.Campfire and c.running)or z()<F.nextAt then return false end
local FI=ai:FindFirstChild("NightSeats")if not FI then if F.wasOn then F.wasOn,F.fails,F.lost=false,0,0 end F.msg="no campfire now (weather events)"
return false end F.wasOn=true if F.seat()then F.sitAt=F.sitAt or z()F.msg=("at the campfire: +%s%% cash (jobs that walk wait)"):format(tostring(J:GetAttribute("CampfireBoost")or"?"))
return false end if F.sitAt then F.lost,F.sitAt=F.lost+1,nil if F.lost>=4 then F.nextAt,F.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
C(F.msg)return false end end return true end function F.sit()local FJ,fu=ai:FindFirstChild("NightSeats"),aq()
if not FJ or not fu then return end local ii,fv=F.logs()if#ii==0 then local FK=ai:FindFirstChild("NightCampfire")
local FL,nr=pcall(function()return FK:GetPivot().Position end)if not FL then F.nextAt,F.msg=z()+10,"the campfire is not loaded yet"return end
d.unpin(true)pcall(function()J:RequestStreamAroundAsync(nr,3)end)aC(fu,nr+Vector3 .new(0,3,9),nr)ao(function()ii,fv=F.logs()return#ii>0 end,6)
if#ii==0 then F.nextAt,F.msg=z()+15,"the campfire's logs did not load - trying again soon"return end end local vY=fu.HumanoidRootPart.Position
if#fv==0 then F.nextAt,F.msg=z()+10,"the campfire is full - waiting for a log"return end table.sort(fv,function(FM,FN)return(FM.st.Position-vY).Magnitude<(FN.st.Position-vY).Magnitude end)
local ns,FO=fv[1].st,fv[1].p d.unpin(true)local dz=ns:IsA("BasePart")and ns.CFrame or CFrame.new(ns:GetPivot().Position)
aC(fu,dz.Position+dz.LookVector*2+Vector3 .new(0,2.5,0),dz.Position)ag(0.25)local FP=ec(FO,function()return F.seat()~=nil end)
if not FP then aC(fu,dz.Position+Vector3 .new(0,2,0),dz.Position+dz.LookVector)ao(function()return F.seat()~=nil end,1.5)
end if F.seat()then F.n,F.fails,F.sitAt=F.n+1,0,z()C(("SAT at the campfire (+%s%% cash)"):format(tostring(J:GetAttribute("CampfireBoost")or"?")))
else F.fails=F.fails+1 F.nextAt=z()+(F.fails>=3 and 60 or 5)F.msg="could not sit at the campfire"..(F.fails>=3 and" - trying again in a minute"or"")
if F.fails<=3 then C(F.msg)end end end H.msg,H.nextAt,H.at,H.pulls,H.claims,H.pullLeft,H.collectLeft,H.events="",0,0,0,0,0,0,{}
function H.refresh()H.at=z()local nt=af:FindFirstChild("Remotes")if not nt then return end local fw,nu,dA=0,0,{}
local FQ,vZ=pcall(function()return nt.ClanRequest:InvokeServer("state")end)local v0=FQ and type(vZ)=="table"and vZ.tasks
for Lw,bY in ipairs(v0 and v0 .list or{})do if not bY.done and bY.kind=="pull"then fw=math.max(fw,(bY.goal or 0)-(bY.progress or 0))end
if not bY.done then dA[#dA+1]=("%s %d/%d"):format(tostring(bY.text),bY.progress or 0,bY.goal or 0)end end H.events={}
for Lx,dB in ipairs(nt:GetChildren())do if dB:IsA("RemoteFunction")and dB.Name:match("^%u%a+Action$")and dB.Name~="CrateAction"and dB.Name~="AutoRollAction"then
local FR,fy=pcall(function()return dB:InvokeServer("state")end)if FR and type(fy)=="table"and fy.live==true and type(fy.quests)=="table"then
H.events[#H.events+1]={r=dB,st=fy}for Ly,aT in ipairs(fy.quests)do if not aT.done and aT.kind=="pull"then fw=math.max(fw,(aT.goal or 0)-(aT.progress or 0))end
if not aT.done and aT.kind=="collect"then nu=math.max(nu,(aT.goal or 0)-(aT.progress or 0))end if not aT.done then dA[#dA+1]=("%s %d/%d"):format(tostring(aT.text),aT.progress or 0,aT.goal or 0)end
end end end end H.pullLeft,H.collectLeft=fw,nu H.msg=#dA>0 and("open: "..table.concat(dA,", "))or"all quests done for today"
end function H.claim()for Lz,fz in ipairs(H.events)do local v1=fz.r.Name:gsub("Action$","")for LA,dC in ipairs(fz.st.quests)do
if dC.done and not dC.claimed then local FS,v2=pcall(function()return fz.r:InvokeServer("claimQuest",dC.id)end)
if FS and not(type(v2)=="table"and v2 .ok==false)then H.claims=H.claims+1 C(("CLAIMED %s quest: %s (+%s)"):format(v1,tostring(dC.text),tostring(dC.points or dC.treats or"?")))
end ag(0.4)end end if fz.st.bonusReady==true then local FT=pcall(function()return fz.r:InvokeServer("claimBonus")end)
if FT then C(("CLAIMED %s daily quest bonus"):format(v1))end ag(0.4)end end end function H.tick()if not(e.Quests and c.running)then
if H.arPaused then H.resume("quests switched off")end return end if z()-H.at<(H.pullLeft>0 and 20 or 90)then return end
H.refresh()pcall(H.claim)if H.pullLeft<=0 and H.arPaused then H.resume("lever quests done")end end function H.pullDue()
return e.Quests and c.running and H.pullLeft>0 and z()>=H.nextAt and not D.busy end function H.lever()local v3=c.plot and c.plot:FindFirstChild("Lever")
local nv=v3 and v3:FindFirstChild("Wheel")return nv and nv:FindFirstChildWhichIsA("ProximityPrompt"),nv end function H.resume(FV)
H.arPaused=false if H.arWas then H.arWas=false e.AutoRoll=true task.spawn(D.apply,FV)end end function H.pull()
local ij,nw=H.lever()if not ij or not nw or not nw:IsA("BasePart")then H.nextAt,H.msg=z()+300,"your lever was not found"return end
if not H.arPaused then H.arPaused=true H.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then H.nextAt=z()+30 return end end C(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(H.pullLeft))
end if not ij.Enabled then H.nextAt=z()+1 return end cm(nw,ij)H.asked=nil qz(ij)H.pulls=H.pulls+1 H.pullLeft=H.pullLeft-1
ag(0.6)if H.asked then H.nextAt=z()+600 C(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(H.asked)))
H.resume("a butter the game wants kept is on the pad")return end H.nextAt=z()+2.5 if H.pullLeft<=0 then H.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bZ,FW)local nx=bZ:GetAttribute("PourOwner")
if type(nx)~="number"or nx==o.uid or not bZ:GetAttribute("HasSquishy")then return false end if bZ:GetAttribute("PourLong")~=true or bZ:GetAttribute("PourFull")==true then return false end
local ny=bZ:GetAttribute("PourId")if ny==nil or E.skip[ny]then return false end local v4,nz,FX=bZ:GetAttribute("Helpers"),0,tostring(o.uid)
if type(v4)=="string"then for FY in v4:gmatch("[^,%s]+")do nz=nz+1 if FY==FX then return false end end end if nz>=6 then return false end
local ik=A.left(bZ)if not ik then local v5=tonumber(bZ:GetAttribute("PourEnd"))ik=v5 and(v5-FW)end if not ik or ik<=75 then return false end
local nA=game:GetService("Players"):GetPlayerByUserId(nx)if not nA or nA:GetAttribute("WaxHelpOff")==true then return false end
return true,nA,ny end function E.list()local nB,FZ={},o.srv()local v6=ai:FindFirstChild("Plots")for LB,v7 in ipairs(v6 and v6:GetChildren()or{})do
local v8=v7~=c.plot and v7:FindFirstChild("WaxStations")for LC,nC in ipairs(v8 and v8:GetChildren()or{})do local F0,F1,F2=E.can(nC,FZ)
local nD=F0 and nC:FindFirstChild("SquishyPlaceHolder")if nD and nD:IsA("BasePart")then nB[#nB+1]={st=nC,p=F1,id=F2,part=nD}end
end end return nB end function E.due()if e.Help and c.running and z()>=E.nextAt and(d.mem or 0)>900 then E.nextAt,E.msg=z()+30,("paused - phone memory %d MB (helps load other bases)"):format(d.mem)
return false end return e.Help and c.running and z()>=E.nextAt end function E.skipIt(v9,v_)E.skip[v9],E.skipN=v_,E.skipN+1
if E.skipN>600 then E.skip,E.skipN,E.tries={[v9]=v_},1,{}end end function E.goHome()local il,b0=aq(),E.home E.home=nil
if not(il and b0)then return end if e.Ghost and not F.seat()then d.unpin(true)if not d.parkHome()then pcall(aC,il,b0 .Position,b0 .Position+b0 .LookVector)end
elseif d.hold or(il.HumanoidRootPart.Position-b0 .Position).Magnitude>20 then d.unpin(true)pcall(aC,il,b0 .Position,b0 .Position+b0 .LookVector)
end end function E.step()local nE,fA=E.list(),aq()if#nE==0 or not fA then E.nextAt=z()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local wa=fA.HumanoidRootPart local wb=wa.Position table.sort(nE,function(F3,F4)return(F3 .part.Position-wb).Magnitude<(F4 .part.Position-wb).Magnitude end)
local a2=nE[1]E.home=E.home or(d.hold and d.surface)or wa.CFrame local b1=a2 .part local fB=(b1 .Position+a2 .st:GetPivot().Position)/2
local im=E.tries[a2 .id]or 0 if(e.Ghost or e.GhostHelps)and im==0 and not F.seat()then d.pin(b1 .CFrame,E.home)
else d.unpin(true)local nF=im==0 and gI(fB.X,b1 .Position.Y,fB.Z,{b1})if nF and math.abs(nF.Y-b1 .Position.Y)<8 then
aC(fA,Vector3 .new(fB.X,nF.Y+c7(fA),fB.Z),b1 .Position)else aC(fA,b1 .Position+Vector3 .new(0,b1 .Size.Y/2+3,0),fB)
end end ag(0.3)local fC=af:FindFirstChild("Remotes")fC=fC and fC:FindFirstChild("ClanRequest")if not fC then E.nextAt,E.msg=z()+60,"the game's help remote is missing"return end
local io,bv=pcall(function()return fC:InvokeServer("help",a2 .st:GetAttribute("PourOwner"),tonumber(a2 .st.Name))end)
if io and type(bv)=="table"and bv.ok then E.n,E.fails=E.n+1,0 E.skipIt(a2 .id,"helped")C(("HELPED %s's wax (station %s)"):format(a2 .p.DisplayName,a2 .st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif io and type(bv)=="table"and tostring(bv.reason or""):lower():find("walk up",1,true)and im<2 then
E.tries[a2 .id]=im+1 E.nextAt=z()+0.3 elseif io and type(bv)=="table"and tostring(bv.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=z()+1.6 else local wc=(io and type(bv)=="table"and tostring(bv.reason or"refused"))or("error: "..tostring(bv))
E.skipIt(a2 .id,wc)E.fails=E.fails+1 if E.fails<=3 then C(("help refused for %s's wax: %s"):format(a2 .p.DisplayName,wc))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,z()+1.2)end function E.onCall(bw)if not e.HelpGuild or type(bw)~="table"or bw.p~="help"or bw.mine or bw.u==o.uid or not bw.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fD=af:FindFirstChild("Remotes")
fD=fD and fD:FindFirstChild("ClanRequest")if not fD then return end local wd,fE=pcall(function()return fD:InvokeServer("callHelp",bw.u)end)
local we=tostring(bw.n or bw.un or bw.u)if wd and type(fE)=="table"and fE.ok then E.calls=E.calls+1 C(("HELPED guildmate %s's wax from here (their call)"):format(we))
else C(("guild call from %s: %s"):format(we,(wd and type(fE)=="table"and tostring(fE.reason or"refused"))or tostring(fE)))
end end)end local function as(F5,wf,...)if c.busy then return end c.busy,c.busyText=true,F5 if d.hold and wf~=E.step then pcall(d.unpin)end
local F6,wg=pcall(wf,...)c.busy,c.busyText=false,""if not F6 and wg~=jk then C("ERR "..tostring(wg))end end local function F7()
if e.Campfire and F.seat()then if j.at and F.tickAt then j.at=j.at+(z()-F.tickAt)end F.tickAt=z()F.due()c.reason,c.level=F.msg,"ok"
return end F.tickAt=nil local aU,F8,F9=vE()c.reason,c.level=F8,F9 if aU=="place"then as("waxing...",A.place)elseif aU=="crate"then as("opening crate...",en,true)
elseif aU=="cratesmart"then as("opening crate...",j.smart)elseif aU=="cratewin"then as("opening the crate window...",ks)
elseif aU=="nocrate"then as("discarding crate...",en,false)elseif aU=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aU=="sell"then as("selling...",u5)elseif aU=="buy"then as("buying...",qC,false)elseif not aU and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aU and not c.matchSince and F.due()then as("sitting at the campfire...",F.sit)
elseif not aU and not c.matchSince and H.pullDue()and not ac()and not(cf()and aO(cf().name))then as("pulling the lever for a quest...",H.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(H.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
as("collecting money...",E6)elseif not aU and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not e.Help then
as("coming back...",E.goHome)elseif not c.busy then d.parkTick()end end function fr(ip,F_)if ip==c.running then return end
c.running=ip if not F_ then e.AutoStart=ip end if ip then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bC()or c.plot
C("START")else c.reason="stopped"C("STOP")end end do local b2=gt(an.auto)if type(b2)=="string"then b2=b2:gsub("%s+$","")
if b2~=""then c.autoload=b2 local Ga=p7(b2)C(Ga and("loaded config "..b2)or("config "..b2 .." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local Gb={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local nG={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local wh,wi,wj,wk=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if wh and wi and wj and wk then ae.x,ae.b,ae.m,ae.r=wh,wi,wj,wk end end)pcall(function()local wl=Enum.Font.RobotoMono if wl then ae.mono=wl end end)
local function K(Gc,Gd,Ge)local Gf,nH=pcall(Instance.new,Gc)if not Gf then c.uiErrs=c.uiErrs+1 return nil end
for Gg,Gh in pairs(Gd)do if not pcall(function()nH[Gg]=Gh end)then c.uiErrs=c.uiErrs+1 end end nH.Parent=Ge return nH
end local function ab(Gi,Gj)K("UICorner",{CornerRadius=UDim.new(0,Gj or 8)},Gi)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(iq,nI)if iq and a.shown[iq]~=nI then a.shown[iq]=nI iq.Text=nI end
end function a.stroke(Gk,Gl,Gm)return K("UIStroke",{Color=Gl or l.line,Thickness=1,Transparency=Gm or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},Gk)
end function a.grad(Gn,Go,Gp,Gq)local Gr,wm=pcall(function()return ColorSequence.new(Go,Gp)end)if Gr and wm then return K("UIGradient",{Color=wm,Rotation=Gq or 0},Gn)end
end function a.pad(Gs,wn,wo,Gt,Gu)K("UIPadding",{PaddingLeft=UDim.new(0,wn or 0),PaddingTop=UDim.new(0,wo or 0),
PaddingRight=UDim.new(0,Gt or wn or 0),PaddingBottom=UDim.new(0,Gu or wo or 0)},Gs)end function a.list(Gv,Gw,Gx)
return K("UIListLayout",{Padding=UDim.new(0,Gw or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Gx and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},Gv)
end function a.ink(nJ)local Gy,Gz=pcall(function()return 0.299*nJ.R+0.587*nJ.G+0.114*nJ.B end)return(Gy and Gz>0.55)and l.ink or l.text
end function a.nextIn(wp)local wq=(a.ord[wp]or 0)+1 a.ord[wp]=wq return wq end local nK=J:FindFirstChildOfClass("PlayerGui")or J:WaitForChild("PlayerGui")
local wr=nK:FindFirstChild("SABFarmGui")if wr then wr:Destroy()end local nL=K("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},nK)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local ir=ai.CurrentCamera.ViewportSize if ir.X>100 and ir.Y>100 then Q.w=math.clamp(math.floor(ir.X*0.48),320,400)
Q.h=math.clamp(math.floor(ir.Y*0.86),250,360)end end)a.root=K("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},nL)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local ws=UDim2 .new(1,0,1,0)
local function LD(wt,wu)return UDim2 .new(wt,0,0,0),UDim2 .new(wu,(wt+wu>0.99)and 0 or-4,1,0)end local function aj(GA,GB,fF,GC,GD,GE)
local nM=K("TextButton",{Text=GB,Position=GD,Size=GE,BackgroundColor3=fF,BorderSizePixel=0,Font=ae.b,TextSize=GC,TextColor3=a.ink(fF),AutoButtonColor=true},GA)
ab(nM,8)if fF==l.panel2 or fF==l.raise or fF==l.panel then a.stroke(nM,l.line,0.4)end return nM end local function is(GF,GG,GH,GI,GJ)
local it=K("TextBox",{Text=GG,PlaceholderText=GH,Position=GI,Size=GJ,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},GF)ab(it,8)a.stroke(it,l.line,0)a.pad(it,9,0,6,0)
return it end local iu=ai.CurrentCamera local function GK()local GL,iv=pcall(function()return iu and iu.ViewportSize end)
if GL and iv and iv.X>50 and iv.Y>50 then return iv end end local function b3(fG)local nN=GK()if not(nN and fG and fG.Parent)then return end
local GM=pcall(function()local iw,wv=fG.AbsolutePosition,fG.AbsoluteSize local nO=70 local ww=math.clamp(iw.X,nO-wv.X,nN.X-nO)
local wx=math.clamp(iw.Y,0,nN.Y-math.min(wv.Y,nO))if math.abs(ww-iw.X)>0.5 or math.abs(wx-iw.Y)>0.5 then fG.Position=UDim2 .new(0,math.floor(ww),0,math.floor(wx))
end end)return GM end local function ix(GN)local GO,nP=pcall(function()return GN.AbsolutePosition end)if GO and nP then return{math.floor(nP.X),math.floor(nP.Y)}end
end local dD={}c.dragMoved={}local function wy(fH,wz,nQ)T(fH.InputBegan:Connect(function(dE)if dE.UserInputType~=Enum.UserInputType.MouseButton1 and dE.UserInputType~=Enum.UserInputType.Touch then return end
local nR={start=dE.Position,from=wz.Position,moved=0,target=wz,input=dE,onDrop=nQ}dD[fH],c.dragMoved[fH]=nR,0
local nS nS=dE.Changed:Connect(function()if dE.UserInputState==Enum.UserInputState.End and dD[fH]==nR then dD[fH]=nil
if nS then nS:Disconnect()end if nQ then nQ(nR.moved)end end end)end))end T(oT.InputChanged:Connect(function(iy)
if iy.UserInputType~=Enum.UserInputType.MouseMovement and iy.UserInputType~=Enum.UserInputType.Touch then return end
for GP,bc in pairs(dD)do local nT=bc.target if nT and nT.Parent then local wA,wB=iy.Position.X-bc.start.X,iy.Position.Y-bc.start.Y
bc.moved=math.max(bc.moved,math.abs(wA)+math.abs(wB))c.dragMoved[GP]=bc.moved nT.Position=UDim2 .new(bc.from.X.Scale,bc.from.X.Offset+wA,bc.from.Y.Scale,bc.from.Y.Offset+wB)
end end end))T(oT.InputEnded:Connect(function(iz)if iz.UserInputType~=Enum.UserInputType.MouseButton1 and iz.UserInputType~=Enum.UserInputType.Touch then return end
for GQ,iA in pairs(dD)do if iA.input==iz or iz.UserInputType==Enum.UserInputType.MouseButton1 then dD[GQ]=nil
if iA.onDrop then iA.onDrop(iA.moved)end end end end))local function P(GR,GS,GT,GU,GV,GW,GX)return K("TextLabel",{Text=GS,Position=GW or UDim2 .new(0,0,0,0),Size=GX or ws,BackgroundTransparency=1,
Font=GV and ae.b or ae.m,TextSize=GT,TextColor3=GU,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},GR)
end function a.row(wC,GY)return K("Frame",{Size=UDim2 .new(1,0,0,GY),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(wC)},wC)end function a.card(wD,wE,wF)local dF=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(wD)},wD)ab(dF,11)a.stroke(dF,l.line,0.25)a.list(dF,5)a.pad(dF,8,8,8,9)
if wE then local nU=a.row(dF,14)K("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},nU)P(nU,wE:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if wF then local GZ=P(nU,wF,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
GZ.TextXAlignment=Enum.TextXAlignment.Right end end return dF end function a.heading(G0,G1,nV)local nW=a.row(G0,nV and 34 or 22)
P(nW,G1,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if nV then P(nW,nV,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return nW end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(nX)local aM=a.sw[nX]if not aM then return end
local dG=tostring(nX.Text or""):match(":%s*(.-)%s*$")or""local b4=dG~=""and not a.OFF[dG]local nY=not aM.chips and(dG=="ON"or dG=="OFF")
aM.pill.Visible,aM.chip.Visible=nY,not nY if nY then aM.pill.BackgroundColor3=b4 and l.accent or l.panel2 aM.knob.Position=b4 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aM.knob.BackgroundColor3=b4 and l.white or l.dim else aM.chip.Text=dG~=""and dG or"-"aM.chip.BackgroundColor3=b4 and l.accent or l.panel2
aM.chip.TextColor3=b4 and l.ink or l.dim end nX.BackgroundColor3=b4 and l.lit or l.raise if aM.edge then aM.edge.Color=b4 and l.accent or l.line aM.edge.Transparency=b4 and 0.55 or 0.45 end
end function a.switch(wG,G2,G3,fI)local a3=K("TextButton",{Name="Switch",Text=G2,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,fI and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(wG)},wG)
ab(a3,9)local aw={edge=a.stroke(a3,l.line,0.45)}aw.title=P(a3,G3,11,l.text,true,UDim2 .new(0,10,0,fI and 4 or 0),UDim2 .new(1,-100,0,fI and 15 or 28))
aw.title.TextWrapped,aw.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fI then aw.sub=P(a3,fI,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
aw.sub.TextWrapped,aw.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end aw.pill=K("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a3)ab(aw.pill,9)aw.knob=K("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},aw.pill)ab(aw.knob,7)aw.chip=K("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},a3)
ab(aw.chip,9)a.pad(aw.chip,10,0,10,0)K("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},aw.chip)
aw.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a3]=aw T(a3:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a3)end))
a.skin(a3)return a3 end function a.chips(nZ)if a.sw[nZ]then a.sw[nZ].chips=true a.skin(nZ)end end function a.line(G4,G5)
local wH=a.row(G4,15)local wI=K("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=G5 or l.dim,
BorderSizePixel=0},wH)ab(wI,3)local n0=P(wH,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))n0 .TextWrapped,n0 .TextTruncate=false,Enum.TextTruncate.AtEnd
return n0,wI end function a.grow(wJ,G6,G7)local iB=K("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=G6 or 10,TextColor3=G7 or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(wJ)},wJ)
T(iB:GetPropertyChangedSignal("Text"):Connect(function()iB.Visible=iB.Text~=""end))return iB end function a.note(G8,G9)
local wK=a.grow(G8,9,l.dim)wK.Text=G9 return wK end function a.actions(G_,wL)local Ha=a.row(G_,28)local wM,n1={},#wL
for fJ,wN in ipairs(wL)do wM[fJ]=aj(Ha,wN[1],wN[2]or l.panel2,10,UDim2 .new((fJ-1)/n1,fJ>1 and 3 or 0,0,0),UDim2 .new(1/n1,(fJ>1 and-3 or 0)+(fJ<n1 and-3 or 0),1,0))
end return table.unpack(wM)end local function M(cN,iC,Hb,Hc)a.put(cN,iC and Hb or Hc)if not a.sw[cN]and a.lit[cN]~=iC then
a.lit[cN]=iC cN.BackgroundColor3=iC and l.accent or l.panel2 cN.TextColor3=a.ink(cN.BackgroundColor3)end end a.title=K("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)K("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
K("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local n2=K("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(n2,8)a.grad(n2,l.accent,l.accent2,45)local wO=P(n2,"C",16,l.ink,true)wO.Font,wO.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local Hd=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))Hd.Font=ae.x P(a.title,"butter farm  "..ca,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local He=a.list(a.tabs,3)pcall(function()He.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function bx(Hf,Hg,Hh)
local iD=K("TextButton",{Text=Hf,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(iD,9)local wP=K("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iD)ab(wP,2)a.tabsAll[#a.tabsAll+1]={b=iD,bar=wP,name=Hg,sub=Hh}return iD end
a.tabFarm=bx("🏠","Home","what the farm is doing")a.tabRun=bx("🌾","Farm","the buy - wax - collect loop")a.tabBut=bx("🧈","Butters","what gets bought and waxed")
a.tabCrt=bx("📦","Crates","which crates get opened")a.tabPet=bx("🐾","Pets","adopt, wish, fuse")a.tabTeam=bx("👥","Teams","the right pets at the right moment")
a.tabSrv=bx("🤝","Server","helping, campfire, ghost")a.tabAdm=bx("⚡","Admin","admin abuse and its boosts")a.tabSet=bx("⚙","Settings","configs, startup, performance")
local function by()local n3=K("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(n3,8)a.pad(n3,8,2,10,12)return n3 end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=by(),by(),by(),by(),by(),by(),by(),by(),by()a.farm.Visible=true
do local fK=a.farm local wQ=a.row(fK,34)a.startB=aj(wQ,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=aj(wQ,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local Hi=a.row(fK,44)local function fL(wR,Hj,wS)local iE=K("Frame",{Position=UDim2 .new((wR-1)/wS,wR>1 and 2 or 0,0,0),Size=UDim2 .new(1/wS,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},Hi)ab(iE,9)a.stroke(iE,l.line,0.3)local iF=P(iE,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iF.Font,iF.TextXAlignment,iF.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local Hk=P(iE,Hj,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
Hk.TextXAlignment=Enum.TextXAlignment.Center return iF end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fL(1,"BOUGHT",5),fL(2,"WAXED",5),fL(3,"SOLD",5),fL(4,"MONEY",5),fL(5,"FREE",5)
local wT=a.card(fK,"Right now")a.info=P(a.row(wT,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(wT,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fM=a.card(fK,"Systems")
a.helpL=a.line(fM,l.info)a.campL=a.line(fM,l.accent2)a.questL=a.line(fM,l.good)a.arL=a.line(fM,l.accent)a.ixL=a.line(fM,nG.Dotonbori)
local wU=a.card(fK,"Activity")a.log=K("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(wU)},wU)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function LE(Hl,Hm)return a.row(Hm or a.farm,Hl)end local am do local n4=a.run
a.heading(n4,"Farm","buy what rolls, wax it, collect the cash")local fN=a.card(n4,"Loop")a.colT=a.switch(fN,"COLLECT: ON","Collect cash","step on the collector by itself")
am=a.row(fN,26)P(am,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=is(am,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(am,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=aj(am,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fN,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fN,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fN,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local n5=a.card(n4,"By hand")
a.buyB,a.plB=a.actions(n5,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(n5,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
am=a.row(n5,28)a.padB=aj(am,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(am,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iG=a.but a.heading(iG,"Butters","what gets bought and waxed")local wV=a.card(iG,"Strategy")a.ixT=a.switch(wV,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(wV,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iG)},iG)a.list(a.butList,5)end do local iH=a.crt a.heading(iH,"Crates","only ticked crates are opened")
local wW=a.card(iH,"Opening")a.crateT=a.switch(wW,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(wW,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iH)},iH)a.list(a.crtList,5)end do local fO=a.pet a.heading(fO,"Pets","adopt, wish, fuse Bigs and Huges")
local fP=a.card(fO,"Automatic")a.pbT=a.switch(fP,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fP,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fP,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fP,10,l.dim)a.note(fP,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local wX=a.card(fO,"The plan","best teams with every pet")a.planInfo=a.grow(wX,10,l.text)a.note(wX,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fO)},fO)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iI=a.srv a.heading(iI,"Server","other players, the campfire, staying hidden")
local n6=a.card(iI,"Helping")a.helpT=a.switch(n6,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(n6,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(n6,l.info)
local wY=a.card(iI,"Campfire")a.campT=a.switch(wY,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(wY,l.accent2)local n7=a.card(iI,"Ghost")a.ghostT=a.switch(n7,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(n7,l.dim)a.note(n7,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fQ=a.adm a.heading(fQ,"Admin abuse","the show, its boosts and the farm in it")local wZ=a.card(fQ,"When")
a.admBig=P(a.row(wZ,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(wZ,14),"",10,l.dim,false)local Hn=a.card(fQ,"Boosts now")
a.admBoost=a.grow(Hn,11,l.text)local n8=a.card(fQ,"What the farm does")a.shT=a.switch(n8,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(n8,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(n8,l.accent)
local w0=a.card(fQ,"Show feed")a.admFeed=K("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(w0)},w0)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cO=a.set a.heading(cO,"Settings","kept on your phone, per config")
local iJ=a.card(cO,"Config")am=a.row(iJ,28)a.cfgName=is(am,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=aj(am,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=aj(am,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
am=a.row(iJ,26)a.cfgPrev=aj(am,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=aj(am,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=aj(am,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iJ,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iJ,10,l.dim)local n9=a.card(cO,"Starting")a.startT=a.switch(n9,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(n9,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(n9,9,l.dim)local n_=a.card(cO,"If the game drops me")
a.rejT=a.switch(n_,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(n_,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(n_,9,l.dim)local bz=a.card(cO,"Performance")a.pfCalm=a.switch(bz,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(bz,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(bz,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(bz,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(bz,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(bz,"STOP 3D: OFF","Stop 3D","blank the world behind this window")am=a.row(bz,28)P(am,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=is(am,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(am,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=aj(am,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(bz,l.good)a.note(bz,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local Ho=a.card(cO,"Your game passes","read from the game")a.passInfo=a.grow(Ho,10,l.text)local Hp=a.card(cO,"About")
a.note(Hp,"CHURN "..ca.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for LF,Hq in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(Hq)end local w1=K("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},nK)
a.tgRoot=K("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},w1)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=K("TextButton",{Text="C",Size=ws,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=K("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=K("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fR=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fR][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fR][2]
a.tgGhost.BackgroundColor3=fR==2 and l.accent or(fR==1 and l.warn or l.panel)a.tgGhost.TextColor3=fR>0 and l.ink or l.dim
end end local bA={built=false,boxes={},at=0}function a.check(iK,oa)iK.Text=oa and"✓"or""iK.BackgroundColor3=oa and l.accent or l.bg
iK.TextColor3=l.ink local ob=iK.Parent if ob and ob:IsA("TextButton")then ob.BackgroundColor3=oa and l.lit or l.raise end
end local function w2(w3,w4)e.Targets[w3]=w4 or nil local w5=bA.boxes[w3]if w5 then a.check(w5,w4)end end local function oc()
for Hr,Hs in pairs(bA.boxes)do a.check(Hs,e.Targets[Hr]==true)end end function a.tickBox(Ht)local od=K("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},Ht)ab(od,6)
a.stroke(od,l.line,0)return od end local fS local function Hu()local Hv=a.card(a.butList,"Butter list")local oe=a.row(Hv,26)
a.butInfo=P(oe,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local Hw=aj(oe,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local Hx=aj(oe,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))Hw.MouseButton1Click:Connect(function()
for Hy in pairs(e.Targets)do e.Targets[Hy]=nil end oc()end)Hx.MouseButton1Click:Connect(function()ad.at=0 jU()
fS(true)end)end fS=function(Hz)if not jU()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bA.built and not Hz and bA.at==ad.at then return end for LG,iL in ipairs(a.butList:GetChildren())do
if iL:IsA("Frame")or iL:IsA("TextButton")or iL:IsA("TextLabel")then iL:Destroy()end end bA.boxes,a.butEmpty={},nil
Hu()for LH,iM in ipairs(ad.rarOrder)do local of=nG[iM]or l.text local cP=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cP,11)a.stroke(cP,of,0.7)a.list(cP,4)a.pad(cP,7,7,7,8)
local og=a.row(cP,22)K("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=of,BorderSizePixel=0},og)
local HA=P(og,iM:upper(),11,of,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))HA.Font=ae.x local HB=aj(og,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local HC=iM HB.MouseButton1Click:Connect(function()local w6=ad.members[HC]or{}local w7=false for LI,HD in ipairs(w6)do if not e.Targets[HD]then w7=true break end end
for LJ,HE in ipairs(w6)do w2(HE,w7)end end)for LK,oh in ipairs(ad.members[iM]or{})do local iN=K("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cP)},cP)ab(iN,8)local w8=P(iN,al(oh),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
w8 .TextWrapped,w8 .TextTruncate=false,Enum.TextTruncate.AtEnd local w9=a.tickBox(iN)bA.boxes[oh]=w9 local w_=oh
local function xa()w2(w_,not e.Targets[w_])end iN.MouseButton1Click:Connect(xa)w9 .MouseButton1Click:Connect(xa)
end end oc()bA.built,bA.at=true,ad.at end function L.paint()for HF,HG in pairs(L.boxes)do a.check(HG,e.CrateTicks[HF]==true)end
if a.crtInfo then local oi,oj=0,0 for LL in pairs(L.boxes)do oi=oi+1 end for LM,HH in pairs(e.CrateTicks)do if HH then oj=oj+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(oi,oj))end if a.crateT then M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for LN,iO in ipairs(a.crtList:GetChildren())do if iO:IsA("Frame")or iO:IsA("TextButton")or iO:IsA("TextLabel")then iO:Destroy()end
end L.boxes={}local ol=a.card(a.crtList,"All of them","worst first")local om=a.row(ol,26)a.crtInfo=P(om,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local HI=aj(om,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local HJ=aj(om,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(HI.MouseButton1Click:Connect(function()e.CrateTicks={}L.paint()end))T(HJ.MouseButton1Click:Connect(function()L.build()end))
for LO,bB in ipairs(L.list())do local xb=nG[bB.rar or""]or l.text local dH=K("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(ol)},ol)ab(dH,8)K("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=xb,BorderSizePixel=0},dH)
local xc=P(dH,(bB.title or bB.name)..(bB.guess and"  (?)"or""),11,xb,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
xc.TextWrapped,xc.TextTruncate=false,Enum.TextTruncate.AtEnd local HK=P(dH,bB.price and("$"..aE(bB.price))or(bB.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
HK.TextXAlignment=Enum.TextXAlignment.Right local xd=a.tickBox(dH)L.boxes[bB.k]=xd local xe=bB.k local function xf()
e.CrateTicks[xe]=(not e.CrateTicks[xe])or nil L.paint()end T(dH.MouseButton1Click:Connect(xf))T(xd.MouseButton1Click:Connect(xf))
end L.built=L.at L.paint()end local xg="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a4(cQ)xg=cQ for HL,oo in ipairs(a.tabKeys)do a[oo].Visible=(oo==cQ)local iP=a.tabsAll[HL]if iP then
local op=oo==cQ iP.b.BackgroundTransparency,iP.b.TextTransparency,iP.bar.Visible=op and 0 or 1,op and 0 or 0.45,op
end end if cQ=="pet"and not o.built then pcall(o.build)end if cQ=="team"and not A.built then pcall(A.build)end
if cQ=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cQ=="but"then fS(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(oq,xh,xi,xj)if xj then oq.Text=xj end oq.BackgroundColor3=xh and xi or l.bg oq.TextColor3=xh and a.ink(xi)or l.dim
end function o.paintRow(xk)local cR=o.rows and o.rows[xk]if not cR then return end local cS=e.Pets[xk]or{}local xl=tonumber(cS.f)==-1
a.flag(cR.b,cS.b,l.good)a.flag(cR.g,cS.g,l.accent,cS.g and"BIG"or"ANY")a.flag(cR.w,cS.w,l.warn)a.flag(cR.f,not xl,l.good,xl and"KEEP"or"AUTO")
if cR.row then cR.row.BackgroundColor3=(cS.b or cS.w)and l.lit or l.raise end end function o.flag(ot,iQ)local bd=e.Pets[ot]or{}
if iQ=="f"then bd.f=tonumber(bd.f)~=-1 and-1 or nil elseif bd[iQ]then bd[iQ]=nil else bd[iQ]=true end e.Pets[ot]=(bd.b or bd.g or bd.w or bd.f)and bd or nil
o.paintRow(ot)end function o.paintAll()for HM in pairs(o.rows or{})do o.paintRow(HM)end if a.pbT then M(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(HN)local xm=y.dreamT if not xm then return"working the plan out..."end local HO,HP=y.needFor(""),y.needFor("Big")
local cT={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(HO,HP,y.slots())}for LP,xn in ipairs(y.dreamTeams or{})do cT[#cT+1]=xn.team:upper()..": "..table.concat(xn.names,", ")end
local iR,iS,iT=0,0,0 for xo,xp in pairs(xm)do local xq,HQ=y.have(xo,HN)local LQ,HR=y.goal(xo)iR=iR+math.max(0,xp.Huge-xq.Huge)
iS=iS+math.max(0,xp.Big-xq.Big)iT=iT+math.max(0,HR-HQ)end cT[#cT+1]=(iR+iS+iT==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(iR,iS,iT)if y.fuseMsg~=""then cT[#cT+1]=y.fuseMsg end
return table.concat(cT,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local ou=o.wishes()local dI=o.data()for iU,ov in pairs(o.rows)do local xr=y.status(iU,dI)ov.desc.Text=(ou[iU]and("wishing %dm | "):format(math.ceil(ou[iU]/60))or"")..(xr and(xr.." | ")or"")..ov.boostText
ov.desc.TextColor3=ou[iU]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dI))end local xs=tonumber(J:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dI and#(dI.pets or{})or 0,dI and tonumber(dI.maxOwned)or 60,
aE(o.money()),xs>0 and(" | free wishes "..xs)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local iV=o.info()for LR,iW in ipairs(a.petList:GetChildren())do if iW:IsA("Frame")or iW:IsA("TextLabel")or iW:IsA("TextButton")then iW:Destroy()end
end o.rows={}if not iV then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dJ={}for LS,xt in ipairs(o.order())do local ow=iV.Pets[xt].rarity or"?"dJ[ow]=dJ[ow]or{}
table.insert(dJ[ow],xt)end local dK={}for LT,xu in ipairs(iV.Rarities or{})do if dJ[xu]then dK[#dK+1]=xu end end
for xv in pairs(dJ)do if not table.find(dK,xv)then dK[#dK+1]=xv end end for LU,ox in ipairs(dK)do local iX=o.RC[ox]or l.text
local cU=K("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cU,11)a.stroke(cU,iX,0.7)a.list(cU,4)a.pad(cU,7,7,7,8)local xw=a.row(cU,18)K("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=iX,BorderSizePixel=0},xw)
local HT=P(xw,ox:upper(),11,iX,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))HT.Font=ae.x for LV,iY in ipairs(dJ[ox])do
local fT=K("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cU)},cU)
ab(fT,8)local oy=P(fT,o.nice(iY),11,iX,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))oy.TextWrapped,oy.TextTruncate=false,Enum.TextTruncate.AtEnd
local HU,HV=pcall(function()return iV.describe(iY)end)local xx=HU and tostring(HV)or""local oz=P(fT,xx,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oz.TextYAlignment,oz.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function iZ(HW,HY,HZ)
local xy=aj(fT,HW,l.bg,8,UDim2 .new(1,HY,0,5),UDim2 .new(0,HZ,0,22))xy.AutoButtonColor=true return xy end local xz,xA,xC,xD=iZ("BUY",-164,30),iZ("ANY",-131,30),iZ("WISH",-98,34),iZ("AUTO",-61,56)
local i0=iY xz.MouseButton1Click:Connect(function()o.flag(i0,"b")end)xA.MouseButton1Click:Connect(function()o.flag(i0,"g")end)
xC.MouseButton1Click:Connect(function()o.flag(i0,"w")end)xD.MouseButton1Click:Connect(function()o.flag(i0,"f")end)
o.rows[iY]={b=xz,g=xA,w=xC,f=xD,name=oy,desc=oz,boostText=xx,row=fT}end end o.built=true o.paintAll()end function d.paint()
M(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])M(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end T(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local H0=table.find(d.CAPS,e.FpsCap or 0)or 1 local xE=d.CAPS[(H0%#d.CAPS)+1]
if not d.cap(xE)and xE~=0 then C("this executor cannot cap fps")end d.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local oA=tonumber(a.pfMem.Text)if oA and oA>=0 then e.MemLimit=math.floor(oA)end d.paint()end))function A.names()
local oB={"(none)"}for LW,H1 in ipairs((A.teams()))do oB[#oB+1]=H1 .name end return oB end function A.cycle(oC,H2)
local i1=A.names()local H3=e[oC]~=""and e[oC]or"(none)"local i2=table.find(i1,H3)or 1 i2=((i2-1+H2)%#i1)+1 e[oC]=i1[i2]=="(none)"and""or i1[i2]
A.paint()end function A.paint()if not A.built then return end M(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oD={}for LX,H4 in ipairs((A.teams()))do oD[H4 .name]=true end
for H5,xF in pairs(A.pick)do local dL=e[H5]xF.Text=dL==""and"(none)"or(oD[dL]and dL or(dL.." (missing)"))xF.TextColor3=(dL~=""and not oD[dL])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local H6,i3=o.srv(),{}for LY,i4 in ipairs(A.list or{})do i3[#i3+1]=("st %-2s %-22s %9s  helps %d"):format(i4 .st.Name,al(W(i4 .name)):sub(1,22),A.clock(i4 .ends-H6),i4 .helps)
end a.tmList.Text=#i3>0 and table.concat(i3,"\n")or"no waxes running"end function A.build()for LZ,i5 in ipairs(a.teamList:GetChildren())do
if i5:IsA("Frame")or i5:IsA("TextLabel")or i5:IsA("TextButton")then i5:Destroy()end end A.pick={}local i6=a.card(a.teamList,"Automatic")
a.tmT=a.switch(i6,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(i6,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(i6,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local H7,H8=pcall(y.rebuild,"you asked")if not H7 then C("BUILD ERR "..tostring(H8))end end)
end)a.tmInfo=a.grow(i6,10,l.dim)local xG=a.card(a.teamList,"Which team when")local function i7(i8,H9,H_)local fU=a.row(xG,54)
P(fU,H9,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local xH=P(fU,H_,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
xH.TextWrapped,xH.TextTruncate=false,Enum.TextTruncate.AtEnd local Ia=aj(fU,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local xI=aj(fU,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local Ib=aj(fU,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
Ia.MouseButton1Click:Connect(function()A.cycle(i8,-1)end)Ib.MouseButton1Click:Connect(function()A.cycle(i8,1)end)
xI.MouseButton1Click:Connect(function()A.cycle(i8,1)end)A.pick[i8]=xI end i7("TeamNormal","Normal","the rest of the time: money + luck")
i7("TeamFull","Full","every station busy: money + wax speed")i7("TeamGlaze","Glaze","worn just before a wax finishes")
local i9=a.row(xG,26)P(i9,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=is(i9,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(i9,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local Ic=aj(i9,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
Ic.MouseButton1Click:Connect(function()local i_=tonumber(a.tmLead.Text)if i_ and i_>=5 and i_<=600 then e.GlazeLead=math.floor(i_)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)i7("TeamWax","Wax","while a butter is placed: head starts")local xJ=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=K("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(xJ)},xJ)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local Ie=a.card(a.teamList,"How it works")a.note(Ie,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function If()a.secB.Text=tostring(e.Every)M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(d.unpin)end end)end
M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fr(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b3(a.root)b3(a.tgRoot)c.lastCollect=z()
oc()L.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function Ig(xK)task.spawn(function()xK.TextColor3=l.bad
task.wait(0.8)if c.alive then xK.TextColor3=l.text end end)end local function xL()local xM=a.secB.Text:match("^%s*(%d+)%s*$")
local fV=xM and tonumber(xM)if not fV or fV<1 then a.secB.Text=tostring(e.Every)Ig(a.secB)C("interval must be a whole number >= 1")
return end if fV==e.Every then return end e.Every,c.lastCollect=fV,z()C("collect every "..fV.."s")end local function N(Ih,Ii)T(Ih.MouseButton1Click:Connect(Ii))end
N(a.secSet,xL)T(a.secB.FocusLost:Connect(xL))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",u5)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help E.nextAt,E.msg=0,e.Help and"looking for waxes to help"or"off"M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests H.at=0 M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire F.nextAt,F.fails,F.lost=0,0,0 M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()M(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
M(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(Ij)task.spawn(function()pcall(q.tick)if Ij and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local Ik=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(Ik)end)
N(a.bestT,function()local Il=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(Il)end)N(a.bcT,function()
local Im=q.on()e.BestCrate=not e.BestCrate q.changed(Im)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b5=o.srv()local b6 pcall(function()q.aac=q.aac or require(af:FindFirstChild("AdminAbuseClient"))
b6=q.aac:GetState()end)local dM,b7="nothing scheduled","the game has not announced one"if type(b6)=="table"then
local fW,a5,b8=tostring(b6 .Phase or""),tonumber(b6 .StartsAt),tonumber(b6 .EndsAt)if a5 and a5<1e9 then a5=nil end
if b8 and b8<1e9 then b8=nil end if fW=="Countdown"and a5 then dM,b7="starts in "..A.clock(a5-b5),os.date("%a %H:%M",math.floor(a5)).." your time"
elseif fW=="Live"and b8 then dM,b7="LIVE  -  "..A.clock(b8-b5).." left","the farm is grabbing, waxing and glazing through it"
elseif fW~=""and fW~="Idle"and b8 and b8>b5 then dM,b7=fW:lower().."  -  "..A.clock(b8-b5).." left","after the show"
elseif a5 and a5>b5 then dM,b7="next: "..os.date("%a %H:%M",math.floor(a5)),"your time"elseif a5 then dM,b7="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a5)).." your time"
end if type(b6 .Kind)=="string"and b6 .Kind~=""then b7=b7 .."  |  "..b6 .Kind end end a.put(a.admBig,dM)a.put(a.admSub,b7)
local dN,oE={},af:FindFirstChild("AdminShow")if oE then local In,Io=pcall(function()return oE:GetAttributes()end)
for xN,dO in pairs(In and Io or{})do local ja=type(xN)=="string"and xN:match("^(.-)Mult$")local oF=ja and tonumber(oE:GetAttribute(ja.."Until"))
if ja and type(dO)=="number"and dO~=1 and dO~=0 and oF and oF>b5 then dN[#dN+1]=("%s  x%s   %s left"):format(ja:gsub("(%l)(%u)","%1 %2"),(dO%1==0)and tostring(dO)or("%.2f"):format(dO),
A.clock(oF-b5))end end end table.sort(dN)a.put(a.admBoost,#dN>0 and table.concat(dN,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dN>0 and l.accent or l.dim local jb=0 for L0 in pairs(O.drops)do jb=jb+1 end local xO=q.snapAt and(q.snapAt-b5)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,jb>0 and(", "..jb.." falling")or"",
xO and("in "..math.max(0,math.floor(xO)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",en,true)end)N(a.padB,function()c.plot=bC()or c.plot local xP,oG=aq(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(xP and oG and oG:IsA("BasePart"))then C("SET PAD: need character and plot")return end c.manualPad=oG.CFrame:ToObjectSpace(xP.HumanoidRootPart.CFrame)
EW(c.manualPad)C("collect pad saved at your position")end)N(a.startB,function()fr(not c.running)end)N(a.buyB,function()
c.plot=bC()or c.plot task.spawn(as,"buying (manual)...",qC,true)end)N(a.plB,function()c.plot=bC()or c.plot task.spawn(as,"waxing (manual)...",qG)
end)N(a.tabFarm,function()a4("farm")end)N(a.tabRun,function()a4("run")end)N(a.tabSrv,function()a4("srv")end)N(a.tabAdm,function()a4("adm")end)
N(a.tabBut,function()a4("but")end)N(a.tabSet,function()a4("set")end)N(a.tabCrt,function()a4("crt")end)N(a.tabPet,function()a4("pet")end)
N(a.tabTeam,function()a4("team")end)local function Ip(oH)c.hidden=oH a.root.Visible=not oH a.tgBtn.TextColor3=oH and l.text or l.ink
end wy(a.tgBtn,a.tgRoot,function()b3(a.tgRoot)c.togPos=ix(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then Ip(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aN,ay={},0 local function b9()aN=pY()if#aN==0 then a.cfgPick.Text="(none saved)"
ay=0 return end if ay<1 or ay>#aN then ay=1 end a.cfgPick.Text=aN[ay]..("  (%d/%d)"):format(ay,#aN)end local function xQ()
local xR=c.autoload~=nil a.cfgAuto.Text=xR and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=xR and l.accent or l.panel2
end local function oI()local xS=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if xS~=""then return xS end return(ay>0 and aN[ay])or""
end N(a.cfgSave,function()c.winPos=ix(a.root)or c.winPos c.togPos=ix(a.tgRoot)or c.togPos local xT,xU=gA(oI())
a.cfgMsg.Text=xT and("saved as "..xU)or("could not save: "..xU)a.cfgMsg.TextColor3=xT and l.good or l.bad b9()
C(a.cfgMsg.Text)end)local function Iq(oJ)local oK,xV=p7(oJ)a.cfgMsg.Text=oK and("loaded "..xV)or("could not load: "..xV)
a.cfgMsg.TextColor3=oK and l.good or l.bad if oK then a.cfgName.Text=oJ If()task.spawn(D.apply,"config "..oJ)
end C(a.cfgMsg.Text)end N(a.cfgLoad,function()Iq(oI())end)N(a.cfgPick,function()b9()if ay>0 then a.cfgName.Text=aN[ay]end
end)N(a.cfgPrev,function()if#aN==0 then b9()return end ay=(ay-2)%#aN+1 b9()a.cfgName.Text=aN[ay]end)N(a.cfgNext,function()
if#aN==0 then b9()return end ay=ay%#aN+1 b9()a.cfgName.Text=aN[ay]end)N(a.cfgAuto,function()if c.autoload then
p9(nil)a.cfgMsg.Text="it will not load a config on launch"else local fX=oI()local xW=false for L1,Ir in ipairs(pY())do if Ir==fX then xW=true end end
local Is=xW or gA(fX)if Is and fX~=""then p9(fX)b9()a.cfgMsg.Text=fX.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim xQ()end)N(a.autoB,function()
local xX,xY=zR()a.autoMsg.Text=xX and("installed. "..xY)or("failed: "..xY)a.autoMsg.TextColor3=xX and l.good or l.bad
C(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()d7("you asked")end)
local be=false N(a.minB,function()be=not be a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not be,not be,not be
if be then for L2,It in ipairs(a.tabKeys)do a[It].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a4(xg)
end a.root.Size=UDim2 .new(0,Q.w,0,be and(Q.head+Q.status+12)or Q.h)a.minB.Text=be and"+"or"-"end)local function jc()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(f_)for L3,Iu in ipairs(jl)do pcall(function()Iu:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()nL:Destroy()end)
pcall(function()w1:Destroy()end)if cW.SAB_KILL==jc then cW.SAB_KILL=nil end end cW.SAB_KILL=jc N(a.killB,jc)N(a.xB,jc)
wy(a.title,a.root,function()b3(a.root)c.winPos=ix(a.root)or c.winPos end)local function xZ()local fY,cV=c.reason,c.level
if c.busy then fY,cV=c.busyText,"ok"elseif not c.running then local L4,x0,Iv=vE()if c.capHit then fY,cV=x0,"bad"else fY,cV="[stopped] "..x0,(Iv=="bad")and"bad"or"idle"end
c.reason,c.level=fY,cV end local dP=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dP then
a.lit.dot=dP a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dP,dP,dP,dP a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fY)if a.lit.bar~=cV then a.lit.bar=cV a.bar.BackgroundColor3=Gb[cV]or l.dim end
if be then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local b_=zr()if a.farm.Visible then local Iw,Ix=f7()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,Iw.."/"..Ix)local x1=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local x2=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aE(bf()),c.rolls,c.gifts,c.crates,x2 and al(W(x2))or"nothing",j.on and("   ["..j.title.." window open]")or"",
x1 and("in "..x1 .."s")or"off"))a.put(a.tgt,(#b_==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#b_<=3)and table.concat(b_,", ")or(#b_.." butters ticked"))))
if a.lit.tgt~=(#b_==0)then a.lit.tgt=(#b_==0)a.tgt.TextColor3=(#b_==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(f1,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,e.Campfire and F.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#b_))
end if a.but.Visible and bA.at~=ad.at then fS(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and E.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and F.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(H.msg~=""and H.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local x3=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",x3~=""and x3 or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cW.SAB={S=c,CFG=e,EV=V,U=a,sg=nL,CAT=ad,LEARN=ak,buildList=fS,
logAll=dQ,evAll=dR,AR=D,CR=L,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=E,CF=F,QX=H,IX=q,SH=O}C(ca.." loaded")if c.uiErrs>0 then C("UI: "..c.uiErrs.." properties skipped")end
a4("farm")b3(a.root)b3(a.tgRoot)if iu then pcall(function()T(iu:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)b3(a.root)b3(a.tgRoot)end))end)end b9()xQ()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(xZ)task.spawn(function()local x4=zP()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(x4 and("\n(backup: "..x4 ..")")or"")
local x5=gt(an.exec)if x5 and not x5:find("SAB autoloader v2",1,true)then d4(an.exec,an.stub)C("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(gt(an.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(zX)end)task.spawn(function()while c.alive do local Iy,Iz=pcall(xZ)if not Iy then C("UI ERR "..tostring(Iz))end
task.wait((c.hidden or be)and 1.5 or 0.4)end end)task.spawn(function()local IA,IB=pcall(z5)if not IA then C("HOOK ERR "..tostring(IB))end
end)task.spawn(function()pcall(yO)if j.loadSeq and not j.learned then local jd={}for x6=1,20 do if j.loadSeq[x6]then jd[#jd+1]=j.loadSeq[x6]end end
if#jd>0 then j.learned={seq=jd,mode=j.loadMode}C("remembered how to open crates directly")end end if jU()then C(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local IC,x7=pcall(EY)if IC and x7 and c.alive and not c.manualPad then c.manualPad=x7 end end)task.spawn(function()
while c.alive do local oL,oM=pcall(o.buyTick)if not oL then C("PET ERR "..tostring(oM))task.wait(5)end oL,oM=pcall(o.wishTick)
if not oL then C("WISH ERR "..tostring(oM))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local je,x8=0,z()
T(game:GetService("RunService").Heartbeat:Connect(function()je=je+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
T(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local x9=z()d.fps,je,x8=je/math.max(x9-x8,0.001),0,x9 local ID,IE=pcall(d.tick)if not ID then C("PERF ERR "..tostring(IE))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local IF,IG=pcall(y.tick)if not IF then C("FUSE ERR "..tostring(IG))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local IH,II=pcall(A.tick)if not IH then C("TEAM ERR "..tostring(II))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local jf=af:WaitForChild("Remotes",30)local x_=jf and jf:WaitForChild("ClanEvent",30)
if x_ and c.alive then T(x_.OnClientEvent:Connect(function(IJ,IK)if IJ=="call"then pcall(E.onCall,IK)end end))
end local ya=jf and jf:FindFirstChild("RollConfirmAsk")if ya and c.alive then T(ya.OnClientEvent:Connect(function(IL)H.asked=IL or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)pcall(d.walkPatch,true)end
end end)task.spawn(function()local oN=af:WaitForChild("Remotes",30)if not(oN and c.alive)then return end local function jg(IM,IN)
local oO=oN:FindFirstChild(IM)if oO and oO:IsA("RemoteEvent")then T(oO.OnClientEvent:Connect(function(...)pcall(IN,...)end))end
end jg("NewSquishyDiscovered",function(oP,yb)if type(oP)~="string"then return end q.disc=q.disc or{}q.disc[W(oP)]=true
C(("INDEX: %s%s is in your Index now"):format(al(W(oP)),yb and(" ("..tostring(yb)..")")or""))end)jg("IndexRefresh",q.loadDisc)
jg("IndexRowComplete",function(IO)C("INDEX: the whole "..tostring(IO).." row is complete")end)jg("AdminShow",q.admin)
local yc=oN:FindFirstChild("AdminShowSync")if yc then local IP,yd=pcall(function()return yc:InvokeServer()end)
if IP and type(yd)=="table"then for L5,IQ in pairs(yd)do pcall(O.add,IQ)end end end while c.alive do local IR,IS=pcall(q.tick)
if not IR then q.msg="index error: "..tostring(IS)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local IT,IU=pcall(H.tick)if not IT then C("QUEST ERR "..tostring(IU))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(f_)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local IW=(type(newcclosure)=="function")and newcclosure or function(IV)return IV end local oQ
local ye=(type(setnamecallmethod)=="function")and setnamecallmethod or nil oQ=hookmetamethod(game,"__namecall",IW(function(yf,...)
local fZ=getnamecallmethod()if c.alive and(fZ=="InvokeServer"or fZ=="FireServer")then local yg,yh=pcall(function()return yf.Name end)
if yg and yh=="CrateAction"and not j.replaying then pcall(j.saw,fZ,...)elseif yg and yh=="AutoRollAction"and not D.replaying then pcall(D.saw,fZ,...)end
if ye then ye(fZ)end end return oQ(yf,...)end))j.oldNC=oQ end)end if jj then T(J.Idled:Connect(function()pcall(function()jj:CaptureController()jj:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for L6=1,90 do if not c.alive then return end if J:GetAttribute("AutoRollOn")~=nil and aq()and(c.plot or bC())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local jh=cf()
if jh and q.on()and not aO(jh.name)then jh=nil end if c.alive and e.AutoRoll and c.running and not D.isOn()and not jh and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for L7=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bC()if aq()and c.plot and q.any()then fr(true,true)C("started by itself")
return end task.wait(1)end if c.alive and not c.running then C("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bC()c.lastCollect=z()while c.alive do if c.running then local IY,yi=pcall(F7)if not IY and yi~=jk then C("LOOP ERR "..tostring(yi))end
end task.wait(0.1)end end)ji("ready - the window is at the top left")end local I0,oR=xpcall(ym,function(IZ)return tostring(IZ).."\n"..debug.traceback()end)
if not I0 then pcall(function()warn("SAB "..ca.." ERROR: "..tostring(oR))end)ji("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..ca.." ERROR: "..tostring(oR))end)pcall(function()local yj=(type(getgenv)=="function"and getgenv())or _G
if type(yj.SAB_KILL)=="function"then yj.SAB_KILL()end for L8,I1 in ipairs({"SABFarmGui","SABToggle"})do local yk=J.PlayerGui:FindFirstChild(I1)
if yk then yk:Destroy()end end end)pcall(function()local f0=Instance.new("ScreenGui")f0 .Name="SABError"f0 .ResetOnSpawn=false
f0 .DisplayOrder=1000 local a6=Instance.new("TextBox")a6 .Size=UDim2 .new(0,340,0,170)a6 .Position=UDim2 .new(0,10,0,50)
a6 .BackgroundColor3=Color3 .fromRGB(90,20,20)a6 .TextColor3=Color3 .new(1,1,1)a6 .TextSize=11 a6 .TextWrapped=true
a6 .ClearTextOnFocus=false a6 .TextXAlignment=Enum.TextXAlignment.Left a6 .TextYAlignment=Enum.TextYAlignment.Top
a6 .Text="SAB "..ca.." failed to start. Send this text:\n"..tostring(oR)a6 .Parent=f0 f0 .Parent=J:WaitForChild("PlayerGui")
end)end
