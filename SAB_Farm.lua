local b_="v28"local oB=game:GetService("Players")local H=oB.LocalPlayer or oB.PlayerAdded:Wait()local function jc(xY)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..b_,Text=xY,Duration=6})
end)end jc("script started")local function xZ()local af=game:GetService("ReplicatedStorage")local am=game:GetService("Workspace")
local oC=game:GetService("UserInputService")local cU=(type(getgenv)=="function"and getgenv())or _G if type(cU.SAB_KILL)=="function"then pcall(cU.SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jd=(function()local x0,x1=pcall(function()return game:GetService("VirtualUser")end)return x0 and x1 or nil end)()
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
local o,A,d,y,E,K,F={},{},{},{},{},{},{}local q,O={},{}local je={}local jf,fV,dP,dQ={},{},{},{}local function T(oD)jf[#jf+1]=oD return oD end
local function ag(x2)task.wait(x2)if not c.alive then error(je,0)end end local function C(fW)fW=os.date("%H:%M:%S").." "..tostring(fW)
table.insert(fV,1,fW)if#fV>6 then table.remove(fV)end c.logN=(c.logN or 0)+1 dP[#dP+1]=fW if#dP>80 then table.remove(dP,1)end
end local function fX(oE)if type(oE)~="string"then return""end return(oE:lower():gsub("[^%w]",""))end local function W(x3)
local oF=fX(x3)local jg=oF:gsub("butter$","")if jg==""then jg=oF end return jg end local function aN(oG)if type(oG)~="string"then return false end
local jh=W(oG)if jh==""then return false end if q.want then return q.want(jh)end return e.Targets[jh]==true end
local function x4(dR)dR=dR:lower()return dR:find("squishy",1,true)~=nil or dR:match("butter$")~=nil or dR:match("butter[^%a]")~=nil
end local ji={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aD(dS)if type(dS)~="number"then return"?"end
local fY=1 while math.abs(dS)>=1000 and fY<#ji do dS=dS/1000 fY=fY+1 end local x5=string.format("%.2f",dS):gsub("%.?0+$","")
return x5 ..ji[fY]end local function x6(oH)if type(oH)~="string"then return nil end local x7,dT=oH:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jj=tonumber(x7)if not jj then return nil end if dT==""then return jj end local x8={qd="qa",qn="qi"}dT=x8[dT:lower()]or dT
for x9,x_ in ipairs(ji)do if x_:lower()==dT:lower()then return jj*1000^(x9-1)end end return nil end local function be()
local oI=H:GetAttribute("BoardValueMoney")if type(oI)=="number"then return oI end local oJ=H:FindFirstChild("leaderstats")
if oJ then for Ir,ya in ipairs({"Cash","Money","Coins"})do local jk=oJ:FindFirstChild(ya)if jk and type(jk.Value)=="number"then return jk.Value end
end end end local function fZ(yb)local jl=yb:GetFullName()if c.plot then local jm=c.plot:GetFullName()if jl:sub(1,#jm)==jm then return jl:sub(#jm+2)end
end return jl end local function ap()local f0=H.Character if f0 and f0:FindFirstChild("HumanoidRootPart")then
local oK=f0:FindFirstChildOfClass("Humanoid")if oK and oK.Health>0 then return f0 end end end local function bB()
local jn=am:FindFirstChild("Plots")if not jn then return nil end local function oL(yc)local oM=yc:FindFirstChild("Plate")
return oM~=nil and oM:FindFirstChild("EditStackAttachment",true)~=nil end local oN=H:GetAttribute("PlotNumber")
if oN~=nil then local jo=jn:FindFirstChild(tostring(oN))if jo and oL(jo)then return jo end end for Is,oO in ipairs(jn:GetChildren())do
if oL(oO)then return oO end end end local function dU(oP)local bC=oP and oP.Parent for It=1,6 do if not bC then return nil end
if bC:IsA("BasePart")then return bC end if bC:IsA("Model")then return bC.PrimaryPart or bC:FindFirstChildWhichIsA("BasePart",true)end
bC=bC.Parent end end local function oQ(oR)local jp=oR.Parent if jp and jp:IsA("Attachment")then return jp.WorldPosition end
local oS=dU(oR)return oS and oS.Position end local function oT()local cV=c.plot and c.plot:FindFirstChild("Plate")
if not cV then return nil end if cV:IsA("BasePart")then return cV.Position end if cV:IsA("Model")then return cV:GetPivot().Position end
local oU=cV:FindFirstChildWhichIsA("BasePart",true)return oU and oU.Position end local function oV()local jq={}
local oW=c.plot and c.plot:FindFirstChild("WaxStations")if oW then for Iu,yd in ipairs(oW:GetChildren())do local oX=yd:FindFirstChild("SquishyPlaceHolder")
local jr=oX and oX:FindFirstChild("PlacePrompt")if jr and jr:IsA("ProximityPrompt")then jq[#jq+1]=jr end end end
return jq end local function f1()local oY,js=oV(),0 for Iv,ye in ipairs(oY)do if ye.Enabled then js=js+1 end end
local jt=#oY local ju=H:GetAttribute("WaxStations")if type(ju)=="number"and ju>jt then jt=ju end return js,jt
end local function yf()local oZ=ap()local o0=oZ and oZ.HumanoidRootPart.Position local jv,o1 for Iw,jw in ipairs(oV())do
if jw.Enabled then local o2=oQ(jw)local o3=(o2 and o0)and(o2-o0).Magnitude or 1e9 if not jv or o3<o1 then jv,o1=jw,o3 end
end end return jv end local function o4()local f2=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not f2 then return nil end local o5=f2:FindFirstChild("BuyPromptAttachment")local f3=(o5 and o5:FindFirstChild("BuyPrompt"))or f2:FindFirstChild("BuyPrompt",true)
if f3 and f3:IsA("ProximityPrompt")and f3:IsDescendantOf(f2)then return f3 end end local o6={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local yg={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jx="SAB_order.txt"local function f4()if not aj.dirty or type(writefile)~="function"then return end local aE={}
for yh,yi in pairs(aj.price)do aE[#aE+1]="P|"..yh.."|"..string.format("%.0f",yi)end for yj,yk in pairs(aj.order)do aE[#aE+1]="O|"..yj.."|"..table.concat(yk,",")end
if j.learned and j.enc then aE[#aE+1]="M|mode|"..tostring(j.learned.mode or"")for yl,f5 in ipairs(j.learned.seq)do
local o7={}for o8=1,f5 .n do o7[o8]=j.enc(f5 .args[o8])end aE[#aE+1]=("A|%d|%s|%d|%s"):format(yl,f5 .m,f5 .n,table.concat(o7,";"))
end end local function jy(ym,yn,f6)local o9={}for o_=1,f6 .n do o9[o_]=j.enc(f6 .args[o_])end aE[#aE+1]=("R|%d|%s|%s|%d|%s"):format(yn,ym,f6 .m,f6 .n,table.concat(o9,";"))
end if j.enc then for yo,yp in ipairs(D.rec.rules)do jy("rules",yo,yp)end if D.rec.on then jy("on",0,D.rec.on)end
if D.rec.off then jy("off",0,D.rec.off)end end for Ix,dV in pairs(L.seen)do aE[#aE+1]=("K|%s|%s|%s|%s"):format(dV.name,dV.title or"",dV.rar or"",dV.price and string.format("%.0f",dV.price)or"")
end if pcall(writefile,jx,table.concat(aE,"\n"))then aj.dirty=false end end local function yq()if type(isfile)~="function"or type(readfile)~="function"then return end
local yr,ys=pcall(isfile,jx)if not(yr and ys)then return end local yt,pa=pcall(readfile,jx)if not(yt and type(pa)=="string")then return end
for yu in pa:gmatch("[^\n]+")do local cW,cX,bf=yu:match("^(%a)|([^|]+)|(.*)$")if cW=="P"then aj.price[cX]=tonumber(bf)
elseif cW=="M"then j.loadMode=(bf~=""and bf~="nil")and bf or nil elseif cW=="A"and j.dec then local pb=tonumber(cX)
local pc,f7,yv=bf:match("^([^|]+)|(%d+)|(.*)$")if pb and pc then f7=tonumber(f7)local pd,f8={},0 for yw in(yv..";"):gmatch("([^;]*);")do
f8=f8+1 if f8<=f7 then pd[f8]=j.dec(yw)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pb]={m=pc,n=f7,args=pd}end elseif cW=="R"and j.dec then
local pe=tonumber(cX)local f9,yx,f_,yy=bf:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pe and f9 then f_=tonumber(f_)
local pf,ga={},0 for yz in(yy..";"):gmatch("([^;]*);")do ga=ga+1 if ga<=f_ then pf[ga]=j.dec(yz)end end local jz={m=yx,n=f_,args=pf}
if f9=="rules"then D.rec.rules[pe]=jz elseif f9=="on"then D.rec.on=jz elseif f9=="off"then D.rec.off=jz end end
elseif cW=="K"then local pg,ph,yA=bf:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cX)]={name=cX,title=pg~=""and pg or nil,
rar=ph~=""and ph or nil,price=tonumber(yA)}elseif cW=="O"and bf~=""then local gb={}for yB in bf:gmatch("[^,]+")do gb[#gb+1]=yB end
if#gb>0 then aj.order[cX]=gb end end end end local function yC(gc)if type(gc)~="table"then return end local ca,pj=gc.rarity,gc.contents
if type(ca)~="string"or ca==""or type(pj)~="table"then return end local dW={}for Iy,gd in ipairs(pj)do if type(gd)=="table"and type(gd.butter)=="string"then
dW[#dW+1]={n=gd.butter,ch=tonumber(gd.chance)or 0}end end if#dW==0 then return end table.sort(dW,function(yD,yE)return yD.ch>yE.ch end)
local dX,dY={},false for yF,yG in ipairs(dW)do dX[yF]=yG.n end local jA=aj.order[ca]if not jA or#jA~=#dX then dY=true end
if not dY then for pk=1,#dX do if jA[pk]~=dX[pk]then dY=true break end end end aj.order[ca]=dX local jB=tonumber(gc.price)
if jB and aj.price[ca]~=jB then aj.price[ca]=jB dY=true end if dY then aj.dirty=true ad.at=0 C("learned the "..ca.." order from its crate")
end end local function cY(yH,yI)local yJ=yH:FindFirstChild(yI,true)local yK,jC=pcall(function()return yJ.Text end)
return(yK and type(jC)=="string"and jC~="")and jC or nil end local function ak(pl)return ad.pretty[pl]or pl end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(yL)return fX(yL or"")end
function L.learn(bh)if type(bh)~="table"or type(bh.name)~="string"then return end local jD=L.key(bh.name)local bi=L.seen[jD]or{}
local yM=(L.seen[jD]==nil)or(tonumber(bh.price)and bi.price~=tonumber(bh.price))bi.name,bi.title=bh.name,bh.title or bi.title
bi.rar,bi.price=bh.rarity or bi.rar,tonumber(bh.price)or bi.price L.seen[jD]=bi if yM then L.at,aj.dirty=z(),true end
end function L.wanted(pm)if pm==nil then return false end local jE=L.key(pm)return e.CrateTicks[jE]==true or(e.BestCrate and q.bestCrate~=nil and(jE==q.bestCrate or jE==q.bestCrateTitle))
end function L.list()local cZ={}for yN,ge in ipairs(L.base)do cZ[L.key(ge[1])]={name=ge[1],title=ge[2],rar=ge[3],i=yN}end
for Iz,dZ in ipairs(ad.rarOrder)do local pn=false for IA,yO in pairs(cZ)do if yO.rar==dZ then pn=true break end end
if not pn and dZ~="?"then local po=dZ:gsub("[^%w]","").."Crate"cZ[L.key(po)]={name=po,title=dZ.." Crate",rar=dZ,i=50,guess=true}
end end for pp,gf in pairs(L.seen)do local a6=cZ[pp]or{i=100}a6 .name,a6 .title,a6 .rar=gf.name or a6 .name,gf.title or a6 .title,gf.rar or a6 .rar
a6 .price,a6 .guess=gf.price or a6 .price,nil cZ[pp]=a6 end local d0,gg={},{}for yP,yQ in ipairs(o6)do d0[yQ]=yP end
for yR,pq in ipairs(ad.rarOrder)do d0[pq]=d0[pq]or(20+yR)end for yS,d1 in pairs(cZ)do d1 .k=yS d1 .price=d1 .price or aj.price[d1 .rar or""]
gg[#gg+1]=d1 end table.sort(gg,function(cb,cc)if cb.price and cc.price and cb.price~=cc.price then return cb.price<cc.price end
local ps,pt=d0[cb.rar or""]or 99,d0[cc.rar or""]or 99 if ps~=pt then return ps<pt end if(cb.i or 100)~=(cc.i or 100)then return(cb.i or 100)<(cc.i or 100)end
return cb.k<cc.k end)return gg end local function yT()local pu=af:FindFirstChild("Assets")local pv=pu and pu:FindFirstChild("Squishies")
if not pv then return false end local jF,pw,c0={},{},{}local gh=0 for IB,gi in ipairs(pv:GetChildren())do local d2=W(gi.Name)
if d2~=""and not jF[d2]then local gj=cY(gi,"RarityText")or"?"jF[d2]=gj pw[d2]=cY(gi,"NameText")or gi.Name c0[gj]=c0[gj]or{}
table.insert(c0[gj],d2)gh=gh+1 end end if gh==0 then return false end for px,yU in pairs(c0)do local py=aj.order[px]or yg[px]
local jG={}if py then for yV,yW in ipairs(py)do jG[W(yW)]=yV end end table.sort(yU,function(pz,pA)local jH,jI=jG[pz],jG[pA]
if jH and jI then return jH<jI end if jH then return true end if jI then return false end return ak(pz)<ak(pA)
end)end local jJ={}for yX,yY in ipairs(o6)do jJ[yY]=yX end local gk,cd={},{}for yZ in pairs(c0)do gk[#gk+1]=yZ end
pcall(function()for y0,y1 in ipairs(require(af.Modules.SquishyRNG).Keys)do cd[y1]=y0 end end)table.sort(gk,function(c1,c2)
if cd[c1]and cd[c2]and cd[c1]~=cd[c2]then return cd[c1]<cd[c2]end local jK,jL=aj.price[c1],aj.price[c2]if jK and jL and jK~=jL then return jK<jL end
local jM,jN=jJ[c1],jJ[c2]if jM and jN then return jM<jN end if jM then return true end if jN then return false end
return c1<c2 end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=jF,pw,c0,gk,gh,z()return true end local function jO()
if ad.at==0 or(z()-ad.at)>120 then pcall(yT)end return ad.n>0 end local function y2(y3)local pB=W(y3)return ad.rar[pB]or(V.name and W(V.name)==pB and V.rar)or"?"
end local function y4()local gl={}local y5=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for y6,y7 in pairs(y5)do if y7 then gl[#gl+1]=ak(y6)end end
table.sort(gl)return gl end local an={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function pC()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gm(pD)if type(makefolder)~="function"then return end local y8,y9=pcall(isfolder,pD)if not(y8 and y9)then pcall(makefolder,pD)end
end local function gn(pE)if type(isfile)~="function"or type(readfile)~="function"then return nil end local y_,za=pcall(isfile,pE)
if not(y_ and za)then return nil end local zb,zc=pcall(readfile,pE)return zb and zc or nil end local function d3(zd,ze)
if type(writefile)~="function"then return false end return(pcall(writefile,zd,ze))end local function pF(zf)local d4={}
if type(listfiles)~="function"then return d4 end local zg,pG=pcall(listfiles,zf)if not zg or type(pG)~="table"then return d4 end
for IC,zh in ipairs(pG)do d4[#d4+1]=tostring(zh)end return d4 end local function pH()local go={}for ID,zi in ipairs(pF(an.cfg))do
local pI=zi:match("([^/\\]+)%.txt$")if pI then go[#go+1]=pI end end table.sort(go)return go end local function zj()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(e.Every)aa[#aa+1]="N|GlazeLead|"..tostring(e.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(e.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(e.MemLimit)aa[#aa+1]="N|Best|"..tostring(e.Best or 0)for IE,pJ in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..pJ.."|"..e[pJ]end
do local gp={}for zk,gq in pairs(e.Pets)do local pK=(gq.b and"b"or"")..(gq.g and"g"or"")..(gq.w and"w"or"")..(tonumber(gq.f)==-1 and"k"or"")
if pK~=""then gp[#gp+1]=zk.."|"..pK end end table.sort(gp)aa[#aa+1]="P|-"for IF,zl in ipairs(gp)do aa[#aa+1]="P|"..zl end
end for IG,pL in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..pL.."|"..(e[pL]and"1"or"0")end local jP=H:GetAttribute("AutoRollRules")if type(jP)=="string"and jP~=""then e.ARrules,e.ARstop=jP,tostring(H:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then aa[#aa+1]="S|rules|"..e.ARrules aa[#aa+1]="S|stop|"..e.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for IH,jQ in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gr={}for zm,zn in pairs(jQ[2])do if zn then gr[#gr+1]=zm end end table.sort(gr)aa[#aa+1]=jQ[1].."|-"for II,zo in ipairs(gr)do aa[#aa+1]=jQ[1].."|"..zo end
end return table.concat(aa,"\n")end local function zp(jR)if type(jR)~="string"or jR==""then return false end local pM,pN,pO,pP,d5={},false,{},false,nil
for zq in jR:gmatch("[^\n]+")do local aF,ah,az=zq:match("^(%a)|([^|]*)|?(.*)$")if aF=="N"and ah=="Every"then local jS=tonumber(az)
if jS and jS>=1 then e.Every=math.floor(jS)end elseif aF=="N"and(ah=="FpsCap"or ah=="MemLimit")then local jT=tonumber(az)
if jT and jT>=0 then e[ah]=math.floor(jT)end elseif aF=="N"and ah=="Best"then local gs=tonumber(az)if gs and gs>=0 and gs<=4 then e.Best=math.floor(gs)end
elseif aF=="N"and ah=="GlazeLead"then local gt=tonumber(az)if gt and gt>=5 and gt<=600 then e.GlazeLead=math.floor(gt)end
elseif aF=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then e[ah]=az elseif aF=="P"and ah~=""then
if not d5 then d5={}end if ah~="-"and az~=""then d5[ah]={b=az:find("b",1,true)and true or nil,g=az:find("g",1,true)and true or nil,
w=az:find("w",1,true)and true or nil,f=az:find("k",1,true)and-1 or nil}end elseif aF=="B"then if e[ah]~=nil then e[ah]=(az=="1")end
elseif aF=="S"and ah=="rules"then e.ARrules=az elseif aF=="S"and ah=="stop"then e.ARstop=az elseif aF=="W"then
c.winPos={tonumber(ah)or 10,tonumber(az)or 44}elseif aF=="G"then c.togPos={tonumber(ah)or 10,tonumber(az)or 300}
elseif aF=="T"and ah~=""then if ah~="-"then pM[ah]=true end pN=true elseif aF=="K"and ah~=""then if ah~="-"then pO[ah]=true end
pP=true end end if pN then e.Targets=pM end if pP then e.CrateTicks=pO end if d5 then e.Pets=d5 end return true
end local function gu(c3)if not pC()then return false,"this executor cannot write files"end c3=(c3 or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c3==""then return false,"give the config a name"end gm(an.dir)gm(an.cfg)if not d3(an.cfg.."/"..c3 ..".txt",zj())then return false,"could not write the file"end
c.config=c3 return true,c3 end local function pQ(gv)local pR=gn(an.cfg.."/"..gv..".txt")if not pR then return false,"no config called "..tostring(gv)end
if not zp(pR)then return false,"that config looks empty"end c.config=gv return true,gv end local function pS(jU)
if jU then gm(an.dir)d3(an.auto,jU)elseif type(delfile)=="function"then pcall(delfile,an.auto)else d3(an.auto,"")
end c.autoload=jU end local function zr()if c.selfPath then return c.selfPath end local gw for IJ,zs in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",an.dir})do
for IK,pT in ipairs(pF(zs))do local jV=pT:lower()if jV:sub(-4)==".lua"and(jV:find("sab_farm",1,true)or jV:find("sab farm",1,true))then
gw=gw or pT end end end c.selfPath=gw return gw end an.stub=[[
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
local function zt()if not pC()then return false,"this executor cannot write files"end gm("autoexec")if not d3(an.exec,an.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gx=(function()local zu,zv=pcall(function()return game:GetService("TeleportService")end)return zu and zv or nil end)()
local function pU()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local zw=queueonteleport or queue_on_teleport return(pcall(zw,an.stub))end local function d6(zx)if c.rejoining then return end
c.rejoining=true C("REJOIN ("..zx..")")pcall(f4)if c.autoload then pcall(gu,c.autoload)end local zy=pU()C(zy and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for IL=1,30 do if not gx then break end pcall(function()gx:Teleport(game.PlaceId,H)end)task.wait(10)
end end)end local function zz()local zA,pV=pcall(function()return game:GetService("GuiService")end)if zA and pV then
pcall(function()T(pV.ErrorMessageChanged:Connect(function()if e.Rejoin then d6("roblox error message")end end))
end)end pcall(function()local pW=game:GetService("CoreGui")local pX=pW and pW:WaitForChild("RobloxPromptGui",15)
local pY=pX and pX:WaitForChild("promptOverlay",15)if pY then T(pY.ChildAdded:Connect(function(zB)if e.Rejoin and tostring(zB.Name):lower():find("errorprompt",1,true)then d6("disconnect prompt")end
end))end end)if gx then pcall(function()T(gx.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()d6("teleport retry")end)end
end))end)end end local function pZ(zC)local p0=c.plot and c.plot:FindFirstChild(zC)if not p0 then return nil,false end
for IM,jW in ipairs(p0:GetChildren())do if jW:IsA("Model")or jW:IsA("BasePart")then return jW,true end end return nil,true
end local function ce()local bD=pZ("RolledSquishy")if not bD then return nil end return{model=bD,name=bD.Name,pretty=cY(bD,"NameText")or ak(W(bD.Name)),
rar=cY(bD,"RarityText")or y2(bD.Name),price=cY(bD,"PriceText")}end local function p1(jX)return type(jX)=="string"and(ad.rar[W(jX)]~=nil or x4(jX))
end local function ac()local jY=pZ("SquishyEquipped")if jY then c.carrySrc,j.heldAt="model",z()return jY.Name,jY end
local p2=H.Character if p2 then for IN,d7 in ipairs(p2:GetDescendants())do if(d7:IsA("Model")or d7:IsA("Tool"))and p1(d7 .Name)then
c.carrySrc,j.heldAt="character",z()return d7 .Name,d7 end end end local gy=H:GetAttribute("SquishyEquipped")if type(gy)=="string"and gy~=""and p1(gy)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gy,nil end c.carrySrc=nil end local function IO()local IP,zD=ac()return zD end local function d8()
local p3=ce()local jZ=p3 and x6(p3 .price)local j0=be()if jZ and j0 and j0<jZ*0.5 then return j0,jZ end end local function cf(zE)
dQ[#dQ+1]=os.date("%H:%M:%S").." "..zE if#dQ>40 then table.remove(dQ,1)end end local function zF(cg,gz)if type(cg)~="string"then return end
cf(("Roll(%s,%s)"):format(cg,tostring(gz)))if cg:lower():find("crate",1,true)then j.rolled,j.rolledAt=cg,z()return
end V.seq=V.seq+1 V.name,V.at=cg,z()V.rar=type(gz)=="string"and gz or nil c.rolls=c.rolls+1 if aN(cg)then C(("ROLL %s [%s] = TARGET"):format(cg,tostring(gz)))end
end local function zG(cj)if type(cj)~="table"then return end local gA=cj.butter or cj.itemName if type(gA)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=gA,z()if type(cj.giftId)=="string"then local p4=af:FindFirstChild("Remotes")
local p5=p4 and p4:FindFirstChild("GiftThanks")if p5 then pcall(function()p5:FireServer(cj.giftId)end)end end
cf("Gift("..gA.." from "..tostring(cj.fromName)..")")C(("GIFT from %s: %s - it will not be waxed"):format(tostring(cj.fromName),gA))
end local function zH()local p6=af:WaitForChild("Remotes",30)if not c.alive then return end if not p6 then C("Remotes folder missing - no roll events")return end
T(H:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local p7=H:GetAttribute("SquishyEquipped")
if type(p7)=="string"and p7~=""then j.heldAt=z()end end))local zN={SquishyRollAnimation=zF,InitSquishy=function(p8)V.init,V.initAt=tostring(p8),z()cf("Init("..tostring(p8)..")")end,
CrateUpdate=function(c4,p9)pcall(yC,c4)pcall(L.learn,c4)if type(c4)=="table"then local zI=p9==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not zI then return end local zJ=not j.waiting local zK=j.on j.waiting,j.data,j.at=true,c4,z()j.on=(p9==true)
j.title=tostring(c4 .title or c4 .name or"crate")if j.on and not zK then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then cf("CrateWindow open("..j.title..")")elseif zJ then cf("Crate waiting("..j.title..")")C(j.title.." is waiting on your stand")
end else if j.waiting then cf("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local zL=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,zL)end if j.classify then local zM=z()
task.spawn(function()pcall(j.classify,zM)end)end end end,GiftReceived=zG,}for gB,zO in pairs(zN)do local j1=p6:FindFirstChild(gB)
if j1 and j1:IsA("RemoteEvent")then T(j1 .OnClientEvent:Connect(zO))elseif gB~="CrateUpdate"and gB~="GiftReceived"then C("remote "..gB.." missing")end
end end local function j2()local ck=ce()if ck then if aN(ck.name)then return{state="match",shown=ck.pretty,src="pad",info=ck}
end return{state="skip",info=ck,level="idle",text=("on pad: %s [%s] - not ticked"):format(ck.pretty,tostring(ck.rar))}
end if V.name and(z()-V.at)<4 then if aN(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gC(zP,zQ,zR,zS)
local gD=RaycastParams.new()gD.FilterType=Enum.RaycastFilterType.Exclude local j3={H.Character}for IQ,zT in ipairs(zS or{})do j3[#j3+1]=zT end
gD.FilterDescendantsInstances=j3 pcall(function()gD.RespectCanCollide=true end)local p_=am:Raycast(Vector3 .new(zP,zQ+4,zR),Vector3 .new(0,-30,0),gD)
return p_ and p_.Position or nil end local function c5(qa)local qb=qa:FindFirstChildOfClass("Humanoid")return((qb and qb.HipHeight)or 2)+qa.HumanoidRootPart.Size.Y/2+0.2
end local function j4(zU,zV)local j5=zU:FindFirstChildOfClass("Humanoid")local zW=z()while z()-zW<zV do if j5 and(j5 .FloorMaterial~=Enum.Material.Air or j5 .SeatPart)then return true end
ag(0.05)end return false end local function aG(zX,j6,j7)local qc=zX.HumanoidRootPart qc.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qc.CFrame=j7 and CFrame.new(j6,Vector3 .new(j7 .X,j6 .Y,j7 .Z))or CFrame.new(j6)end local function cl(bj,qe)local cm=ap()
if not cm or not bj then return false end local bE=bj.Position local gE=math.clamp(math.max(bj.Size.X,bj.Size.Z)/2+2.2,3,7)
local qf=(qe and qe.MaxActivationDistance)or 10 if gE>qf-2 then gE=math.max(2.5,qf-2)end local d9={}local function cn(d_)
d_=Vector3 .new(d_.X,0,d_.Z)if d_.Magnitude>0.05 then d9[#d9+1]=d_.Unit end end local qg=oT()if qg then cn(qg-bE)end
cn(bj.CFrame.LookVector)cn(-bj.CFrame.LookVector)cn(bj.CFrame.RightVector)cn(-bj.CFrame.RightVector)cn(cm.HumanoidRootPart.Position-bE)
if#d9==0 then cn(Vector3 .new(0,0,1))end local zY,gF=c5(cm),false for IR,zZ in ipairs(d9)do local gG=bE+zZ*gE
local j8=gC(gG.X,bE.Y,gG.Z,{bj})if j8 and math.abs(j8 .Y-bE.Y)<14 then aG(cm,Vector3 .new(gG.X,j8 .Y+zY,gG.Z),bE)
if j4(cm,0.7)then gF=true break end end end if not gF then aG(cm,bE+d9[1]*gE+Vector3 .new(0,3,0),bE)gF=j4(cm,1)
end ag(0.12)return gF end local function qh(ea)if not ea.Parent or not ea.Enabled then return false end pcall(function()ea:InputHoldBegin()end)
ag(math.max(ea.HoldDuration,0)+0.08)pcall(function()ea:InputHoldEnd()end)return true end local function aq(qi,z0)
local z1=z()while z()-z1<z0 do if qi()then return true end ag(0.05)end return qi()end local function eb(c6,z2,qj,z3)
local z4=c.zapFirst and{"zap","hold"}or{"hold","zap"}for z5,j9 in ipairs(z4)do if z5==2 and(z3 or not(c6 .Parent and c6 .Enabled and(not qj or qj())))then break end
local j_ if j9=="hold"then j_=qh(c6)else j_=type(fireproximityprompt)=="function"and c6 .Parent~=nil and c6 .Enabled and pcall(fireproximityprompt,c6)end
if j_ and aq(z2,1.2)then c.zapFirst=(j9=="zap")return true,j9 end end return false end local function qk(ka)local bF=o4()
if not bF or not bF.Enabled then C("buy: nothing on the pad")return false end local kb=dU(bF)if not kb then C("buy: pad part missing")return false end
c.lastBuyAt=z()local z6,ql=V.seq,be()local qm=ap()local z7=qm and(qm.HumanoidRootPart.Position-kb.Position).Magnitude>12
cl(kb,bF)if z7 then ag(0.4)end if not bF.Enabled then C("buy aborted: pad emptied")return false end local c7=j2()
if not ka and c7 .state~="match"then C("buy aborted: "..(c7 .text or"pad changed"))c.matchSince=nil return false
end local kc=c7 .info and c7 .info.name or(c7 .state=="match"and V.name)or nil local function z8()return bF.Enabled and ac()==nil and(ka or j2().state=="match")
end local z9,z_=eb(bF,function()return ac()~=nil or((not bF.Enabled)and(ka or V.seq==z6))end,z8,d8()~=nil)if z9 then
aq(function()return ac()~=nil end,0.8)local ec=ac()local qo=be()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,z()C(("BOUGHT %s%s via %s"):format(ec and ak(W(ec))or(c7 .shown or"?"),(ql and qo)and(" for $"..aD(ql-qo))or"",z_))
if ec and kc and W(ec)~=W(kc)then C(("note: picked up %s, not %s"):format(ec,kc))end return true end local gH=ce()
if d8()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)C(("BUY REFUSED: cash short - have $%s, price %s"):format(aD(be()),(gH and gH.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)C(("buy did not go through (%s, try %d) - again in %ds"):format(gH and gH.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qp()local ed=ac()if not ed then c.holding=false C("place: hands are empty")
return false end if not aN(ed)then C(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(ed))))return false end
for IS=1,e.PlaceTries do local bG=yf()if not bG then C("place: no free station")break end local qq=dU(bG)if qq then
cl(qq,bG)local qr=ac()if not qr then c.holding=false C("place: hands emptied on the way")return false end if not aN(qr)then C("place: what I carry changed, not waxing it")return false end
if bG.Enabled then local Aa,Ab=eb(bG,function()return not bG.Enabled end,function()return bG.Enabled end)if Aa then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 V.name,V.rar,V.at=nil,nil,z()
C(("WAXED %s #%d at %s via %s"):format(ak(W(ed)),c.placed,bG.Parent.Parent.Name,Ab))if q.placed then pcall(q.placed,ed)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end C("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))C(c.capMsg)end return false end function A.place()local Ac=z()while c.alive and A.editing and z()-Ac<25 do ag(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local Ad=z()while c.alive and A.current()~=e.TeamWax and z()-Ad<5 do ag(0.1)end
if A.current()==e.TeamWax then ag(0.3)else C("wax team did not come on in time - placing anyway")end end local Ae,qs=pcall(qp)
A.placing=false if not Ae then error(qs,0)end return qs end local function qt(qu)return type(qu)=="string"and qu:lower():find("crate",1,true)~=nil
end local Af={SABFarmGui=1,SABToggle=1,SABError=1}local function kd(Ag)local bH=Ag while bH do if Af[bH.Name]then return false end
if bH:IsA("ScreenGui")then local Ah,Ai=pcall(function()return bH.Enabled end)return(not Ah)or Ai~=false end if bH:IsA("GuiObject")and not bH.Visible then return false end
bH=bH.Parent end return false end local function gI(gJ)local c8=""pcall(function()if gJ:IsA("TextButton")then c8=gJ.Text end end)
if not c8:find("%a")then for IT,gK in ipairs(gJ:GetDescendants())do if(gK:IsA("TextLabel")or gK:IsA("TextButton"))and gK.Text:find("%a")then c8=gK.Text break end
end end if not c8:find("%a")then c8=gJ.Name end return(c8:lower():gsub("[^%a]",""))end local function Aj()local ee,ef
local qv=H:FindFirstChildOfClass("PlayerGui")if not qv then return nil,nil end for IU,eg in ipairs(qv:GetDescendants())do
if eg:IsA("GuiButton")and kd(eg)then local ke=gI(eg)if ke:sub(1,4)=="open"and not ke:find("shop",1,true)then ee=ee or eg end
if ke:sub(1,7)=="discard"then ef=ef or eg end end end if ee and ef then return ee,ef end if j.on then return ee,ef end
return nil,nil end local kf=(function()local Ak,Al=pcall(function()return game:GetService("VirtualInputManager")end)return Ak and Al or nil end)()
local function qw(bk,kg)local kh={}local function qx(Am)kh[#kh+1]=Am end if c.tapWay then qx(c.tapWay)end for IV,qy in ipairs({"touch","conn","signal"})do
if qy~=c.tapWay then qx(qy)end end local function qz(An,...)local Ao,ki=pcall(getconnections,An)if not(Ao and type(ki)=="table"and#ki>0)then return false end
local qA,Ap,Aq=false,{...},select("#",...)for IW,Ar in ipairs(ki)do if pcall(function()Ar:Fire(table.unpack(Ap,1,Aq))end)then qA=true end
end return qA end local function qB()local qC=Vector3 .new(0,0,0)pcall(function()local qD,qE=bk.AbsolutePosition,bk.AbsoluteSize
qC=Vector3 .new(qD.X+qE.X/2,qD.Y+qE.Y/2,0)end)local kj={Position=qC,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kj.UserInputType=Enum.UserInputType.Touch end)pcall(function()kj.UserInputState=Enum.UserInputState.End end)
return kj end for IY,bl in ipairs(kh)do local eh=false if bl=="conn"and type(getconnections)=="function"then if qz(bk.MouseButton1Click)then
eh=true if aq(kg,1.5)then c.tapWay=bl return true,bl end end eh=qz(bk.Activated,qB(),1)elseif bl=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bk.MouseButton1Click)then if aq(kg,1.5)then c.tapWay=bl return true,bl end end eh=pcall(firesignal,bk.Activated,qB(),1)
elseif bl=="touch"and kf then eh=pcall(function()local qF,qG=bk.AbsolutePosition,bk.AbsoluteSize local qH=0 local qI=bk:FindFirstAncestorWhichIsA("ScreenGui")
local As,At=pcall(function()return qI and qI.IgnoreGuiInset end)if not(As and At)then pcall(function()qH=game:GetService("GuiService"):GetGuiInset().Y end)
end local qJ,qK=qF.X+qG.X/2,qF.Y+qG.Y/2+qH kf:SendMouseButtonEvent(qJ,qK,0,true,game,1)task.wait(0.06)kf:SendMouseButtonEvent(qJ,qK,0,false,game,1)
end)end if eh and aq(kg,1.5)then c.tapWay=bl return true,bl end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function kk(qL)local ei=qL.Parent while ei and ei~=c.plot do if j.NOT[ei.Name]then return false end ei=ei.Parent
end local kl=(qL.ActionText or""):lower()if kl:find("roll",1,true)or kl:find("place",1,true)or kl:find("sell",1,true)then return false end
return true end local function qM()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local qN=c.plot:FindFirstChild("CrateStand")local ej if qN then for IZ,gL in ipairs(qN:GetDescendants())do
if gL:IsA("ProximityPrompt")and gL.Enabled and kk(gL)then ej=gL break end end end if not ej then for I0,bI in ipairs(c.plot:GetDescendants())do
if bI:IsA("ProximityPrompt")and bI.Enabled and kk(bI)then local qO=bI:FindFirstAncestorWhichIsA("Model")local Au=((bI.ActionText or"").." "..(bI.ObjectText or"").." "..bI.Name.." "..(qO and qO.Name or"")):lower()
if Au:find("crate",1,true)then ej=bI break end end end end j.prompt=ej return ej end local function km()if j.on then return true end
local ek=qM()if not ek then j.summonFails=j.summonFails+1 j.lastFail=z()C("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local qP=dU(ek)if qP then cl(qP,ek)end j.ours=true eb(ek,function()return j.on end)if aq(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()C("crate: pressed "..fZ(ek).." but no window came up")
return false end do local function Av(qQ)local c9=qQ.Parent while c9 and c9:IsA("GuiObject")do local qR,qS=false,false
for I1,el in ipairs(c9:GetDescendants())do if el~=qQ and el:IsA("GuiButton")and gI(el):sub(1,7)=="discard"then qR=true end
if el:IsA("TextLabel")then local kn=el.Text:lower()if kn:find("crate",1,true)or kn:find("can contain",1,true)or kn:find("cost",1,true)then qS=true end
end if qR and qS then return c9 end end c9=c9 .Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local qT=H:FindFirstChildOfClass("PlayerGui")if not qT then return nil end for I2,gM in ipairs(qT:GetDescendants())do
if gM:IsA("GuiButton")and not gM:FindFirstAncestor("SABFarmGui")and gI(gM):sub(1,4)=="open"then local ko=Av(gM)
if ko then j.win=ko return ko end end end end local function Aw(Ax)for I3,gN in ipairs(Ax:GetDescendants())do
if gN:IsA("GuiButton")then local qU,kp=gI(gN),gN.Name:lower()if qU=="x"or qU=="close"or kp=="x"or kp:find("close",1,true)or kp:find("exit",1,true)then return gN end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(Ay)task.wait(Ay and 4 or 1.2)if j.on or j.waiting then return end
local gO=j.findWin()if not gO or not kd(gO)then return end local qV=Aw(gO)if qV and qw(qV,function()return not kd(gO)end)then return end
C("the crate window is still open - tap its X")end end local function em(gP)if not km()then return false end local qW=z()-(j.openedAt or 0)
if qW<0.6 then ag(0.6-qW)end local kq=j.title local Az,AA=Aj()local qX=gP and Az or AA if not qX then j.lastFail=z()
c.crateFails=c.crateFails+1 C(("crate: no %s button found in %s"):format(gP and"Open"or"Discard",kq))return false
end local AB=ac()local AC,I4=qw(qX,function()return(not j.on)or(ac()~=nil and ac()~=AB)end)if not AC then j.lastFail=z()
c.crateFails=c.crateFails+1 C("crate: could not press "..(gP and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gP then c.crates=c.crates+1 aq(function()return ac()~=nil end,1.5)local qY=ac()
C(("OPENED %s -> %s"):format(kq,qY and ak(W(qY))or"?"))else C("discarded "..kq.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(AD,...)local AE=select("#",...)j.calls[#j.calls+1]={t=z(),m=AD,n=AE,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aH,bm)local bJ=type(aH)if(bJ=="string"or bJ=="number")and type(bm.data)=="table"then for qZ,kr in pairs(bm.data)do
if kr==aH and type(qZ)=="string"and(type(kr)=="string"or type(kr)=="number")then return{__slot="f:"..qZ}end end
end if bJ=="string"then if bm.crate and aH==bm.crate then return{__slot="crate"}end if bm.title and aH==bm.title then return{__slot="title"}end
if bm.rar and aH==bm.rar then return{__slot="rarity"}end return aH end if bJ=="number"or bJ=="boolean"or bJ=="nil"then return aH end
if bJ=="table"then local q0={}for AF,q1 in pairs(aH)do if type(q1)=="table"then return nil,"nested table"end local AG,q2=j.slot(q1,bm)
if q2 then return nil,q2 end q0[AF]=AG end return q0 end local AH,AI=pcall(function()return aH:IsA("Instance")end)
if AH and AI then if aH==H then return{__slot="player"}end if c.plot and aH==c.plot then return{__slot="plot"}end
local gQ=c.plot and c.plot:FindFirstChild("CrateStand")if gQ and aH==gQ then return{__slot="stand"}end if gQ and aH.Parent==gQ then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bJ..")"end function j.resolve(gR)if type(gR)~="table"then return gR end
local aU=gR.__slot if aU and aU:sub(1,2)=="f:"then return j.data and j.data[aU:sub(3)]end if aU=="crate"then return j.data and j.data.name end
if aU=="title"then return(j.data and j.data.title)or j.title end if aU=="rarity"then return j.data and j.data.rarity end
if aU=="player"then return H end if aU=="plot"then return c.plot end if aU=="stand"or aU=="model"then local ks=c.plot and c.plot:FindFirstChild("CrateStand")
if aU=="stand"or not ks then return ks end for I5,q3 in ipairs(ks:GetChildren())do if qt(q3 .Name)then return q3 end end
return nil end local q4={}for AJ,AK in pairs(gR)do q4[AJ]=j.resolve(AK)end return q4 end function j.classify(kt)
if j.directOff then return end local gS={}for I6,ku in ipairs(j.calls)do if ku.t<=kt+0.05 and kt-ku.t<=6 then gS[#gS+1]=ku end
end if#gS==0 then return end if not aq(function()return(j.heldAt or 0)>=kt-1 end,2.5)then return end local en={}
for I7,eo in ipairs(gS)do local q5={}for q6=1,eo.n do local AL,q7=j.slot(eo.args[q6],eo)if q7 then C("crate call has "..q7 .." - keeping the button method")
return end q5[q6]=AL end en[#en+1]={m=eo.m,n=eo.n,args=q5}end local kv=j.learned j.learned={seq=en,mode=kv and kv.mode or nil}
aj.dirty=true if not kv then C(("learned how to open crates directly (%d call%s)"):format(#en,#en==1 and""or"s"))end
end function j.replay()local q8=j.learned local q9=af:FindFirstChild("Remotes")local kw=q9 and q9:FindFirstChild("CrateAction")
if not(q8 and kw)then return false end local q_=table.unpack or unpack j.replaying=true for I8,ep in ipairs(q8 .seq)do
local kx={}for ra=1,ep.n do kx[ra]=j.resolve(ep.args[ra])end task.spawn(function()pcall(function()if ep.m=="InvokeServer"then kw:InvokeServer(q_(kx,1,ep.n))
else kw:FireServer(q_(kx,1,ep.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(AM)return(AM:gsub("[%%|;=,\n]",function(AN)return("%%%02X"):format(AN:byte())end))end
function j.enc(co)local gT=type(co)if gT=="string"then return"s"..j.esc(co)end if gT=="number"then return"n"..tostring(co)end
if gT=="boolean"then return co and"b1"or"b0"end if gT=="nil"then return"z"end if co.__slot then return"k"..co.__slot end
local ky={}for AO,AP in pairs(co)do ky[#ky+1]=j.enc(AO).."="..j.enc(AP)end return"t"..table.concat(ky,",")end
function j.dec(rb)local eq,er=rb:sub(1,1),rb:sub(2)local function AQ(AS)return(AS:gsub("%%(%x%x)",function(AT)return string.char(tonumber(AT,16))end))end
if eq=="s"then return AQ(er)end if eq=="n"then return tonumber(er)end if eq=="b"then return er=="1"end if eq=="k"then return{__slot=er}end
if eq=="t"then local rc={}for AU in er:gmatch("[^,]+")do local rd,AV=AU:match("^(.-)=(.*)$")if rd then local rf=j.dec(rd)
if rf~=nil then rc[rf]=j.dec(AV)end end end return rc end return nil end function j.goneOrNew(AW)return function()
if not j.waiting then return true end local rg=ac()return rg~=nil and rg~=AW end end function j.near()local rh=af:FindFirstChild("Remotes")
local kz=rh and rh:FindFirstChild("CrateAction")local gU=ap()local kA=c.plot and c.plot:FindFirstChild("CrateStand")
local kB=kA and kA:FindFirstChild("Spot")if not(kz and gU and kB)then C(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kz and"no CrateAction remote"or not gU and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kC=gU.HumanoidRootPart local gV=kC.CFrame local ri,kD=j.title,"no answer"local AX=ac()local rj=kA:FindFirstChild("Holder")
local function rk()if not rj then return j.waiting or j.on end for I9,AY in ipairs(rj:GetChildren())do if AY:IsA("Model")then return true end end
return false end for AZ=1,3 do if not(j.waiting or j.on)or not rk()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kC.Position-kB.Position).Magnitude>8 then cl(kB,j.prompt)end ag(0.12+0.15*AZ)
local a7={}j.replaying=true task.spawn(function()a7 .ok,a7 .v=pcall(function()return kz:InvokeServer("open")end)
a7 .done=true end)aq(function()return a7 .done end,6)j.replaying=false local cp=a7 .v if a7 .done and a7 .ok and type(cp)=="table"and cp.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 C(("OPENED %s -> %s (no window)"):format(ri,cp.prize and ak(W(tostring(cp.prize)))or"?"))
aq(function()local rl=ac()return rl~=nil and rl~=AX end,1.5)if(kC.Position-gV.Position).Magnitude>8 then pcall(function()aG(gU,gV.Position,gV.Position+gV.LookVector)end)end
return true,"opened"end kD=(a7 .done and a7 .ok and type(cp)=="table")and tostring(cp.reason or"refused, no reason given")
or(a7 .done and("error: "..tostring(cp))or"no answer in 6s")ag(0.3)if not rk()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 C(("crate: the server would not open %s next to the stand (%s)"):format(ri,kD))
return false,kD end j.GIVEUP=600 function j.drop()local rm=af:FindFirstChild("Remotes")local rn=rm and rm:FindFirstChild("CrateAction")
local ro=c.plot and c.plot:FindFirstChild("CrateStand")local kE=ro and ro:FindFirstChild("Spot")local rp=ap()
if kE and rp and(rp.HumanoidRootPart.Position-kE.Position).Magnitude>8 then cl(kE,j.prompt)ag(0.3)end local kF,bn=false,nil
if rn then kF,bn=pcall(function()return rn:InvokeServer("discard")end)end C(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(kF and type(bn)=="table"and bn.ok)and"done"or("answer: "..tostring(type(bn)=="table"and(bn.reason or bn.ok)or bn))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(kF and type(bn)=="table"and bn.ok)then em(false)end end function j.smart()local kG=j.title if(j.nearFails or 0)<3 then
local A0=j.near()if A0 then return true end if j.nearFails>=3 then C("opening next to the stand failed 3 times - trying the older ways")end
end local cq=j.learned if cq then local kH=ac()if j.on then j.replay()if aq(j.goneOrNew(kH),3.5)then c.crates=c.crates+1
C("OPENED "..kG.." (direct)")return true end else if cq.mode~="window"then j.replay()if aq(j.goneOrNew(kH),3.5)then
c.crates,j.fails=c.crates+1,0 if cq.mode~="direct"then cq.mode,aj.dirty="direct",true C("crates now open directly - the window never comes up")
end C("OPENED "..kG.." (direct, no window)")return true end end if km()then j.replay()if aq(j.goneOrNew(kH),3.5)then
c.crates,j.fails=c.crates+1,0 if cq.mode~="window"then cq.mode,aj.dirty="window",true C("crates need their window up first - it shows briefly")
end C("OPENED "..kG.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,aj.dirty=cq,nil,true
if j.fails>=3 then j.directOff=true C("direct crate opening failed 3 times - using the button for now")else C("the learned crate call did not work - back to pressing Open")
end end return em(true)end function D.snap()return{rules=H:GetAttribute("AutoRollRules"),stop=H:GetAttribute("AutoRollStop"),
on=H:GetAttribute("AutoRollOn"),main=H:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for A1,rq in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(H:GetAttributeChangedSignal(rq):Connect(function()D.cache[A1]=H:GetAttribute(rq)end))
end end function D.isOn()return H:GetAttribute("AutoRollOn")==true end function D.saw(A2,...)local gW=D.cache
local A3={m=A2,n=select("#",...),args={...},before={rules=gW.rules,stop=gW.stop,on=gW.on,main=gW.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,A3)end end)end function D.learnOne(es)local aA,et=D.snap(),es.before local gX=(aA.rules~=et.rules)or(aA.stop~=et.stop)
local rr=(aA.on~=et.on)or(aA.main~=et.main)if not gX and not rr then return end local rs={}for rt=1,es.n do local aO=es.args[rt]
local cr=type(aO)if cr=="string"and aO~=""and aO==aA.rules then aO={__slot="rules"}elseif cr=="string"and aO~=""and gX and aO==aA.stop and aA.stop~=et.stop then aO={__slot="stop"}
elseif cr=="table"then local ru={}for A4,c_ in pairs(aO)do if type(c_)=="table"or(type(c_)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end ru[A4]=(type(c_)=="string"and c_~=""and c_==aA.rules)and{__slot="rules"}or c_ end aO=ru elseif cr~="string"and cr~="number"and cr~="boolean"and cr~="nil"then
if aO==H then aO={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end rs[rt]=aO
end local da={m=es.m,n=es.n,args=rs}if gX then local kI=false for A5=1,da.n do local eu=da.args[A5]if type(eu)=="table"and eu.__slot=="rules"then kI=true end
if type(eu)=="table"and not eu.__slot then for I_,rv in pairs(eu)do if type(rv)=="table"and rv.__slot=="rules"then kI=true end end
end end if kI then D.rec.rules={da}else table.insert(D.rec.rules,da)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if rr then if aA.on==true then D.rec.on=da else D.rec.off=da end e.AutoRoll=(aA.on==true)end if aA.rules and aA.rules~=""then e.ARrules,e.ARstop=aA.rules,aA.stop or""end
aj.dirty=true D.msg=""C(("learned an Auto Roll %s message"):format(gX and"choices"or(aA.on and"on"or"off")))end
function D.resolve(db)if type(db)~="table"then return db end if db.__slot=="rules"then return e.ARrules~=""and e.ARrules or H:GetAttribute("AutoRollRules")end
if db.__slot=="stop"then return e.ARstop~=""and e.ARstop or H:GetAttribute("AutoRollStop")end if db.__slot=="player"then return H end
local rw={}for A6,A7 in pairs(db)do rw[A6]=D.resolve(A7)end return rw end function D.replay(rx,A8)local ry=table.unpack or unpack
for Ja,ev in ipairs(A8)do local kJ={}for rz=1,ev.n do kJ[rz]=D.resolve(ev.args[rz])end D.replaying=true pcall(function()
if ev.m=="InvokeServer"then task.spawn(function()pcall(function()rx:InvokeServer(ry(kJ,1,ev.n))end)end)else rx:FireServer(ry(kJ,1,ev.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(rA,A9)if D.busy or not c.alive then return end D.busy=true
pcall(function()local rB=af:FindFirstChild("Remotes")local kK=rB and rB:FindFirstChild("AutoRollAction")if not kK then D.msg="this game has no AutoRollAction"return end
local bK=e.AutoRoll if bK and e.ARrules~=""and H:GetAttribute("AutoRollRules")~=e.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"C(D.msg)else D.replay(kK,D.rec.rules)
if aq(function()return H:GetAttribute("AutoRollRules")==e.ARrules end,4)then C("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"C(D.msg)end end end if bK==D.isOn()or(not bK and not A9)then return end
local gY=bK and D.rec.on or D.rec.off if not gY then local ew=bK and D.rec.off or D.rec.on local rC=ew~=nil for A_=1,ew and ew.n or 0 do
if type(ew.args[A_])=="boolean"then rC=false end end if rC then gY=ew end end if not gY then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bK and"on"or"off")
C(D.msg)return end D.replay(kK,{gY})if aq(function()return D.isOn()==bK end,4)then D.msg=""C(("Auto Roll switched %s%s"):format(bK and"ON"or"OFF",rA and(" ("..rA..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"C(D.msg)end end)D.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local Ba,Bb=pcall(function()return H.UserId end)return Ba and Bb or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local Bc,kL=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if Bc and type(kL)=="table"and type(kL.Pets)=="table"then o.I=kL end return o.I end function o.order()if o.list then return o.list end
local bL=o.info()if not bL then return{}end local cs={}if type(bL.Order)=="table"and#bL.Order>0 then for Jb,rD in ipairs(bL.Order)do if bL.Pets[rD]then cs[#cs+1]=rD end end
else for Bd in pairs(bL.Pets)do cs[#cs+1]=Bd end table.sort(cs,function(Be,Bf)return(bL.Pets[Be].price or 0)<(bL.Pets[Bf].price or 0)end)
end o.list=cs return cs end function o.nice(rE,kM)local rF=o.info()local rG=rF and rF.Pets[rE]return((kM and kM~="")and(kM.." ")or"")..(rG and rG.displayName or tostring(rE))
end function o.data()local gZ=H:GetAttribute("PetsData")if type(gZ)~="string"then return nil end if gZ==o.rawD then return o.lastD end
local Bg,ex=pcall(function()return o.HS:JSONDecode(gZ)end)ex=(Bg and type(ex)=="table")and ex or nil o.rawD,o.lastD=gZ,ex
return ex end function o.pen()return af:FindFirstChild("PetMeadowSpawns")end function o.srv()return am:GetServerTimeNow()end
function o.money()local kN=H:FindFirstChild("MoneyValue")if kN and type(kN.Value)=="number"then return kN.Value end
return be()or 0 end function o.wishes()local rH=o.pen()local rI=rH and rH:GetAttribute("Wishes")local kO,rJ={},o.srv()
if type(rI)~="string"then return kO end local Bh,rK=pcall(function()return o.HS:JSONDecode(rI)end)if Bh and type(rK)=="table"then
for Bi,kP in pairs(rK)do if type(kP)=="number"and kP>rJ then kO[Bi]=kP-rJ end end end return kO end function o.call(...)
local rL=af:FindFirstChild("Remotes")local rM=rL and rL:FindFirstChild("PetRequest")if not rM then return nil end
local rN=table.pack(...)local ct={}task.spawn(function()ct.ok,ct.v=pcall(function()return rM:InvokeServer(table.unpack(rN,1,rN.n))end)
ct.done=true end)local Bj=z()while not ct.done and z()-Bj<6 do task.wait(0.05)end if ct.done and ct.ok then return ct.v end
return nil end function o.want(Bk)return e.Pets[Bk]end function o.closeNaming(kQ)local rP=pcall(function()local rO=H:FindFirstChild("PlayerScripts")
local Bl=rO and rO:FindFirstChild("Naming",true)require(Bl).close()end)ag(0.5)if kQ.Visible then pcall(function()local rQ=kQ:FindFirstChild("NameBox",true)if rQ then rQ:ReleaseFocus()end end)
kQ.Visible=false rP=false end return rP end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local rR=H:FindFirstChildOfClass("PlayerGui")
local rS=rR and rR:FindFirstChild("MainGui")local g0=rS and rS:FindFirstChild("PetNameGui")if g0 and g0 .Visible then
ag(0.4)if g0 .Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,g0)break end end ag(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local kR,rT,g1=o.info(),o.pen(),o.data()
if not(kR and rT and g1)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local ey,kS=#(g1 .pets or{}),tonumber(g1 .maxOwned)or 60
local Bm,rU,ez=o.srv(),{},nil for Jc,aV in ipairs(rT:GetChildren())do rU[aV.Name]=true local cu,g2=aV:GetAttribute("Pet"),aV:GetAttribute("Variant")or""
local kT=cu and o.want(cu)if kT and kT.b and kR.Pets[cu]and(not kT.g or g2=="Big")and y.wantMore(cu,g2,g1)and not aV:GetAttribute("A_"..o.uid)
and(tonumber(aV:GetAttribute("ExpiresAt"))or 0)>Bm+1 and z()>=(o.tryAt[aV.Name]or 0)then local eA,rV=o.nice(cu,g2),kR.Pets[cu].price or 0
if ey>=kS then ez=("%s is in the pen, but you have %d/%d pets"):format(eA,ey,kS)o.tryAt[aV.Name]=z()+15 elseif o.money()<rV then
ez=("%s is in the pen - need $%s"):format(eA,aD(rV))o.tryAt[aV.Name]=z()+5 else o.tryAt[aV.Name]=z()+8 local bM=o.call("adopt",aV.Name)
if type(bM)=="table"and bM.ok then ey=ey+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local Bn=type(bM.pet)=="table"and bM.pet or{}
table.insert(o.recent,{id=tostring(Bn.id or("?"..z())),name=cu,variant=g2,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
C("ADOPTED "..eA)o.skipNaming()ez="adopted "..eA else local rW=type(bM)=="table"and tostring(bM.reason or"no reason given")or"no answer"
C(("adopt %s failed: %s"):format(eA,rW))ez="adopt failed: "..rW if type(bM)=="table"and bM.bagFull then o.tryAt[aV.Name]=z()+60 end
end end end end for rX in pairs(o.tryAt)do if not rU[rX]then o.tryAt[rX]=nil end end o.buyMsg=ez or("watching the pen (%d/%d pets)"):format(ey,kS)
end function o.stacks()local rY=o.pen()local Bo=rY and rY:GetAttribute("WishStacks")local Bp,rZ=pcall(function()return o.HS:JSONDecode(Bo)end)
return(Bp and type(rZ)=="table")and rZ or{}end function o.stackTick(Bq,Br)local g3=o.info()local r0=(type(g3 .Wish)=="table"and tonumber(g3 .Wish.maxStacks))or 1
if r0<=1 then return end local Bs=o.stacks()o.stackTry=o.stackTry or{}for Jd,aW in ipairs(o.order())do local r1=o.want(aW)
local g4=tonumber(Bs[aW])or 1 if r1 and r1 .w and Bq[aW]and g4<r0 and y.wantMore(aW,"",Br)and z()>=(o.stackTry[aW]or 0)then
local Bt,g5=pcall(g3 .wishPrice,aW,g4+1)g5=Bt and tonumber(g5)or((g3 .Pets[aW].price or 0)*2*3^g4)o.stackTry[aW]=z()+5
if g5<=o.money()*0.01 then local r2=o.call("wish",aW)if type(r2)=="table"and r2 .ok then o.wishN=o.wishN+1 C(("WISH x%d on %s ($%s)"):format(g4+1,o.nice(aW),aD(g5)))
else o.stackTry[aW]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local g6=o.info()if not(g6 and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bN,kU,bO=o.wishes(),0,nil local Bu=(type(g6 .Wish)=="table"and g6 .Wish.cashShare)or 2 local r3=o.data()
for Je,aC in ipairs(o.order())do local r4=o.want(aC)if r4 and r4 .w and y.wantMore(aC,"",r3)then kU=kU+1 if not bN[aC]and z()>=(o.wishTry[aC]or 0)then
local kV=tonumber(H:GetAttribute("PetWishCredits"))or 0 local kW=math.floor((g6 .Pets[aC].price or 0)*Bu)if kV<=0 and o.money()<kW then
o.wishTry[aC]=z()+10 bO=("need $%s to wish for %s"):format(aD(kW),o.nice(aC))o.wishWhy[aC]=bO else o.wishTry[aC]=z()+3
local Bv=kV>0 and"wishCredit"or"wish"local g7=o.call(Bv,aC)if type(g7)=="table"and g7 .ok then o.wishN,o.wishWhy[aC]=o.wishN+1,nil
C(("WISHED for %s (%s)"):format(o.nice(aC),kV>0 and"free wish"or("$"..aD(kW))))else local kX=type(g7)=="table"and tostring(g7 .reason or"no reason given")or"no answer"
if kX:lower():find("already",1,true)then o.wishTry[aC]=z()+2 else C(("wish %s failed: %s"):format(o.nice(aC),kX))bO="wish failed: "..kX end
end end end end end pcall(o.stackTick,bN,r3)if not bO then for Jf,g8 in ipairs(o.order())do local r5=o.want(g8)
if r5 and r5 .w and not bN[g8]and o.wishWhy[g8]then bO=o.wishWhy[g8]break end end end if not bO then local dc={}
for Jg,eB in ipairs(o.order())do local r6=o.want(eB)local r7=tonumber(o.stacks()[eB])or 1 if r6 and r6 .w and bN[eB]then dc[#dc+1]=("%s%s %dm"):format(o.nice(eB),r7>1 and(" x"..r7)or"",math.ceil(bN[eB]/60))end
end local g9 for Jh,g_ in ipairs(o.order())do local r8=o.want(g_)if r8 and r8 .w and bN[g_]and(not g9 or bN[g_]<g9)then g9=bN[g_]end
end bO=kU==0 and"no pet has WISH ticked"or(#dc==0 and"running: none yet")or(#dc<=3 and("running: "..table.concat(dc,", ")))
or("%d running, the next one ends in %dm"):format(#dc,math.ceil((g9 or 0)/60))end o.wishMsg=bO end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local kY=o.data()return(kY and kY.teams)or{},kY end function A.current(dd)
dd=dd or o.data()if not dd then return""end local r9={}for Ji,Bw in ipairs(dd.equipped or{})do r9[tostring(Bw)]=true end
for Jj,r_ in ipairs(dd.teams or{})do local sa=r_.pets or{}local kZ=#sa==#(dd.equipped or{})if kZ then for Jk,Bx in ipairs(sa)do if not r9[tostring(Bx)]then kZ=false break end end end
if kZ then return r_.name end end return""end function A.equip(k0)local By,Bz=A.teams()local k1 for BA,BB in ipairs(By)do if BB.name==k0 then k1=BA break end end
if not k1 then A.msg="no saved team called "..tostring(k0)return false end if A.current(Bz)==k0 then return true end
for Jl=1,4 do local sb=o.call("teamEquip",k1)if type(sb)=="table"and sb.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(BC)local sc=BC:FindFirstChild("SquishyPlaceHolder")local sd=sc and sc:FindFirstChild("TimerGui")
local se=sd and sd:FindFirstChildWhichIsA("TextLabel",true)local k2=se and se.Text if type(k2)~="string"or k2:find("-",1,true)then return nil end
local k3,sf,sh=k2:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not k3 then return nil end local sj=sh~=""and(tonumber(k3)*3600+tonumber(sf)*60+tonumber(sh))or(tonumber(k3)*60+tonumber(sf))
return sj>0 and sj or nil end function A.waxes()local eC={}local sk=c.plot and c.plot:FindFirstChild("WaxStations")
if not sk then return eC end local sl=o.srv()for Jm,a8 in ipairs(sk:GetChildren())do local k4=tonumber(a8:GetAttribute("PourEnd"))
local sm=a8:GetAttribute("PourOwner")if a8:GetAttribute("HasSquishy")and a8:GetAttribute("PourId")and(sm==nil or sm==o.uid)then
local k5=A.left(a8)local sn=k5 and(sl+k5)or((k4 and k4>sl)and k4 or nil)if sn then local so,sp=a8:FindFirstChild("SquishyPlaceHolder"),"?"
if so then for Jn,sq in ipairs(so:GetChildren())do if sq:IsA("Model")then sp=sq.Name break end end end local BD=tostring(a8:GetAttribute("Helpers")or"")
local k6=0 for Jo in BD:gmatch("%d+")do k6=k6+1 end eC[#eC+1]={st=a8,ends=sn,sure=k5~=nil,id=a8:GetAttribute("PourId"),name=sp,helps=k6,
long=a8:GetAttribute("PourLong")==true}end end end table.sort(eC,function(BE,BF)return BE.ends<BF.ends end)return eC
end function A.glazeCount()local sr=af:FindFirstChild("Remotes")local ss=sr and sr:FindFirstChild("EditStack")
if not ss then return nil end local BG,eD=pcall(function()return ss:InvokeServer("State",nil)end)if not(BG and type(eD)=="table"and type(eD.state)=="table")then return nil end
local k7,k8=0,{}for Jp,ha in ipairs(eD.state.entries or{})do if ha.glaze and ha.glaze~=""then k7=k7+1 k8[ha.glaze]=(k8[ha.glaze]or 0)+1 end
end return k7,k8,#(eD.state.entries or{}),eD.state.capacity end function A.finishedOne(hb,su)A.finished=A.finished+1
task.wait(2)local k9,BH,sv,BI=A.glazeCount()if k9 and su and k9>su then A.glazed=A.glazed+1 local k_={}for BJ,BK in pairs(BH)do k_[#k_+1]=BJ.." "..BK end
C(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(hb.name)),hb.st.Name,k9,table.concat(k_,", ")))
else C(("wax done on station %s: %s, no glaze%s"):format(hb.st.Name,ak(W(hb.name)),sv and(" (stack "..sv.."/"..tostring(BI)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cv=o.srv()local aI=A.glazeFor if aI then local eE=aI.st local sx=eE.Parent and eE:GetAttribute("HasSquishy")and eE:GetAttribute("PourId")==aI.id
local sy=sx and A.left(eE)if sy then aI.ends=cv+sy end if not sx then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aI.id or"?"]then
A.done[aI.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aI.id or"?"]=true},1 end local BL=aI.before
task.spawn(function()pcall(A.finishedOne,aI,BL)end)end elseif aI.ends-cv>e.GlazeLead*3+60 or cv>aI.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aI.id or"?"]=z()+120 C(("station %s is not finishing yet (%s left) - glaze team off again"):format(eE.Name,A.clock(aI.ends-cv)))
end end if e.TeamGlaze~=""and not A.glazeFor then local BM=A.speedRatio(e.TeamGlaze)for Jq,cw in ipairs(A.list)do
if cw.sure and(cw.ends-cv)*BM[cw.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cw.id or"?"]or 0)and not A.done[cw.id or"?"]then
A.glazeFor=cw task.spawn(function()cw.before=A.glazeCount()end)break end end end local aJ,eF="",""local de=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cv)
if de and de<-8 then q.snapAt,de=nil,nil end if e.TeamGlaze~=""and de and de<=20 then aJ,eF=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(de)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aJ,eF=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aJ,eF=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aJ,eF=e.TeamFull," - every station is busy"else aJ=e.TeamNormal end A.want=aJ local eG=A.current()A.cur=eG if aJ~=""and eG~=aJ and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aJ)then C("team: "..aJ..eF)else A.nextTry=z()+3 end end local la=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eG~=""and eG or"(not a saved team)",(aJ~=""and aJ~=eG)and(" -> "..aJ)or"",
la and("in "..A.clock(la.ends-cv).." (st "..la.st.Name..")")or"- none running")end function A.clock(bP)bP=math.max(0,math.floor(bP))
if bP>=3600 then return("%d:%02d:%02d"):format(math.floor(bP/3600),math.floor((bP%3600)/60),bP%60)end return("%d:%02d"):format(math.floor(bP/60),bP%60)
end function A.allBusy()local BN,BO=f1()return BO>0 and BN==0 end function A.aboutToPlace()if not c.running then return false end
local sz=ac()if not(sz and aN(sz))then return false end local BP=f1()return BP>0 end function A.mult(sA,BQ,sB)return{(1+sA)*(1+sB),(1+sA+BQ)*(1+sB)}end
function A.speedNow()local function lb(BR)return tonumber(H:GetAttribute(BR))or 0 end return A.mult(lb("PetWaxSpeed"),lb("PetLongWax"),lb("PetSocialWax"))
end function A.speedOf(BS)local BT,sC=A.teams()if not sC then return nil end for Jr,sD in ipairs(BT)do if sD.name==BS then
local lc={}for Js,BU in ipairs(sD.pets or{})do for Jt,sE in ipairs(sC.pets or{})do if tostring(sE.id)==tostring(BU)then lc[#lc+1]=sE break end end
end local sF=y.caps()local sG,BV=y.stats(lc)return A.mult(math.min(sG.waxSpeed or 0,sF.waxSpeed or 0.25),math.min(sG.longWax or 0,sF.longWax or 0.3),BV.socialWax or 0)
end end return nil end function A.speedRatio(BW)local sH,ld=A.speedNow(),A.speedOf(BW)if not ld then return{1,1}end
return{sH[1]/ld[1],sH[2]/ld[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(BX)local le=o.info()if le and type(le.fuseNeed)=="function"then local BY,lf=pcall(le.fuseNeed,H,BX or"")
if BY and tonumber(lf)and tonumber(lf)>=2 then return tonumber(lf)end end if H:GetAttribute("FusePass")==true or H:GetAttribute("FusePass4")==true then return 3 end
if H:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(sI)
if sI=="Huge"then return y.needFor("")*y.needFor("Big")end if sI=="Big"then return y.needFor("")end return 1 end
function y.nextOf(sJ)return(sJ==""and"Big")or(sJ=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local lg=o.info()return(lg and type(lg.HugeCaps)=="table")and lg.HugeCaps or y.HCAPS end function y.cosmic()local lh=o.info()return(lh and type(lh.CosmicCaps)=="table")and lh.CosmicCaps or{StarWhale=0.1}end
function y.slots()local sK=o.data()return tonumber(sK and sK.slots)or(3+(tonumber(H:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local li=o.info()return(li and type(li.Caps)=="table")and li.Caps or y.CAPS end function y.value(sL,cx)
local hc=o.info()local cy=hc and hc.Pets[sL]if not(cy and type(cy.boost)=="table")then return nil end local cz
if type(hc.boostValue)=="function"then local BZ,B0=pcall(hc.boostValue,sL,(cx~=""and cx)or nil)cz=BZ and tonumber(B0)or nil
end if not cz then local eH=cy.boost.value or 0 cz=eH if cx=="Big"or cx=="Huge"then local sM=eH*(cx=="Huge"and 1.75 or 1.5)
cz=y.ROUND[cy.boost.kind]and math.max(eH+(cx=="Huge"and 2 or 1),math.floor(sM+0.5))or sM if cx=="Huge"and y.ROUND[cy.boost.kind]then cz=math.max(cz,math.max(eH+1,math.floor(eH*1.5+0.5))+1)end
end end return cy.boost.kind,cz,cy.boost.every end function y.stats(B1)local cA,lj,sN,eI={},{},{},{}local B2=y.cosmic()
for Ju,df in ipairs(B1)do local au,eJ,sO=y.value(df.name,df.variant or"")if au then if df.variant=="Huge"then sN[y.CAPKEY[au]or au]=true end
if au:sub(1,6)=="social"then lj[au]=math.max(lj[au]or 0,eJ)elseif au=="waxStir"or au=="cashGift"then cA[au]=(cA[au]or 0)+eJ*60/(sO or 60)
elseif au=="luckyPull"then cA.luckyPull=(cA.luckyPull or 0)+eJ/(sO or 10)else cA[au]=(cA[au]or 0)+eJ if B2[df.name]then eI[au]=eI[au]or{}eI[au][df.name]=(eI[au][df.name]or 0)+eJ end
end end end return cA,lj,sN,eI end function y.glazeGain(B3,hd)local eK,lk,Jv={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local B4=eK[1]+eK[2]+eK[3]local B5=tonumber(H:GetAttribute("GuildUpGlaze"))or 0 local dg={}for he=1,3 do dg[he]=eK[he]+B3*eK[he]/B4+(he==1 and B5 or 0)end
local ll={dg[1]*(1-hd),dg[2]*(1-hd)+dg[1]*hd,dg[3]+dg[2]*hd}return ll[1]*(lk[1]-1)+ll[2]*(lk[2]-1)+ll[3]*(lk[3]-1)
end function y.score(hf,B6)local B7,B8,B9=y.caps(),y.hcaps(),y.cosmic()local hg,hh,B_,sP=y.stats(B6)local function lm(ln)return(B_[ln]and B8[ln])or B7[ln]or math.huge end
local function bo(hi)local lo,lp=hg[hi]or 0,lm(hi)local lq=math.min(lo,lp)if sP[hi]and lo>lp then local lr=0 for Ca,Cb in pairs(sP[hi])do lr=lr+math.min(Cb,B9[Ca]or 0)end
lq=lq+math.min(lo-lp,lr)end return lq end local Cc=(1+bo("income"))*(1+(hh.socialIncome or 0))*(1+math.min(hg.cashGift or 0,lm("cashGiftPerMinute"))/60)
local Cd=1+bo("luck")+(hg.luckyPull or 0)+(hh.socialLuck or 0)local sQ=Cd*(1+bo("newFind"))*(1+bo("rollSpeed"))
local eL=math.log(Cc)local Ce=math.max(tonumber(H:GetAttribute("WaxStations"))or 18,1)local ls=(1+bo("waxSpeed")+bo("longWax"))*(1+(hh.socialWax or 0))
+math.min(hg.waxStir or 0,lm("waxStirPerMinute"))/60/Ce local Cf=1-(1-bo("headStart"))*(1-(hh.socialHeadStart or 0))
if hf=="farm"then return eL+0.7*math.log(sQ)+0.1*math.log(ls)end if hf=="full"then return eL+0.4*math.log(ls)+0.02*math.log(sQ)end
if hf=="glaze"then return y.glazeGain(bo("glaze"),bo("glazeUp"))+0.001*eL end if hf=="wax"then return-math.log(1-0.5*Cf)+0.001*eL+0.001*math.log(ls)end
return eL end function y.kinds(Cg)local sR,lt={},{}for Jw,eM in ipairs(Cg)do local sS=eM.name.."|"..(eM.variant or"")
local bQ=sR[sS]if not bQ then bQ={name=eM.name,variant=eM.variant or"",n=0,ids={}}sR[sS]=bQ lt[#lt+1]=bQ end bQ.n=bQ.n+1
bQ.ids[#bQ.ids+1]=eM.id end return lt end function y.bestKinds(sT,bR,Ch,sU,sV)local aB,bS={},{}local function lu(Ci)
local sW,hj={},{}for Cj,lv in ipairs(Ci)do sW[Cj]=bR[lv]hj[lv]=(hj[lv]or 0)+1 end local eN=y.score(sT,sW)if sU then for Ck,Cl in pairs(hj)do eN=eN+1e-7*math.min(Cl,sU[Ck]or 0)end end
if sV then for Cm,Cn in pairs(hj)do eN=eN-1e-8*Cn*sV[bR[Cm].variant]end end return eN end for Jx=1,Ch do local eO,lw
for hk=1,#bR do if(bS[hk]or 0)<bR[hk].n then aB[#aB+1]=hk local sX=lu(aB)aB[#aB]=nil if not lw or sX>lw+1e-12 then eO,lw=hk,sX end
end end if not eO then break end bS[eO]=(bS[eO]or 0)+1 aB[#aB+1]=eO if#bR>40 then task.wait()end end for Jy=1,6 do
task.wait()local sY,sZ=false,lu(aB)for lx=1,#aB do for dh=1,#bR do local hl=aB[lx]if dh~=hl and(bS[dh]or 0)<bR[dh].n then
aB[lx]=dh local s0=lu(aB)if s0>sZ+1e-9 then bS[hl],bS[dh],sZ,sY=bS[hl]-1,(bS[dh]or 0)+1,s0,true else aB[lx]=hl end
end end end if not sY then break end end local s1={}for Co,Cp in ipairs(aB)do s1[Co]=bR[Cp]end return aB,y.score(sT,s1)
end function y.best(Cq,Cr,Cs,hm)hm=hm or{}local ly=y.kinds(Cr)local lz={}for s2,Ct in ipairs(ly)do for Jz,Cu in ipairs(Ct.ids)do if hm[tostring(Cu)]then lz[s2]=(lz[s2]or 0)+1 end end end
local Cv,Cw=y.bestKinds(Cq,ly,Cs,lz)local lA,lB={},{}for JA,Cx in ipairs(Cv)do local s3,eP=ly[Cx],nil for JB,lC in ipairs(s3 .ids)do if hm[tostring(lC)]and not lA[lC]then eP=lC break end end
if not eP then for JC,s4 in ipairs(s3 .ids)do if not lA[s4]then eP=s4 break end end end lA[eP]=true lB[#lB+1]=tostring(eP)
end return lB,Cw end function y.dream()local s5=o.info()if not(s5 and type(s5 .Pets)=="table")then return nil end
local lD=y.slots()local s6=y.needFor("").."|"..y.needFor("Big").."|"..lD.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==s6 and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local CD=pcall(function()local hn={}for JD,Cy in ipairs(o.order())do for JE,Cz in ipairs({"","Big","Huge"})do hn[#hn+1]={name=Cy,variant=Cz,n=lD,ids={}}end
end local eQ,lE={},{}for JF,ho in ipairs(y.ROLES)do if e[ho[1]]~=""then local CA,CB=y.bestKinds(ho[2],hn,lD,nil,{[""]=1,Big=y.unit("Big"),Huge=y.unit("Huge")})
local lF,hp={},{}for JG,s7 in ipairs(CA)do lF[s7]=(lF[s7]or 0)+1 end for CC,lG in pairs(lF)do local bT=hn[CC]
eQ[bT.name]=eQ[bT.name]or{[""]=0,Big=0,Huge=0}eQ[bT.name][bT.variant]=math.max(eQ[bT.name][bT.variant],lG)hp[#hp+1]=(lG>1 and(lG.."x ")or"")..o.nice(bT.name,bT.variant)
end table.sort(hp)lE[#lE+1]={role=ho[2],team=e[ho[1]],names=hp,score=CB}end end y.dreamT,y.dreamTeams,y.dreamSig=eQ,lE,s6
end)y.dreaming=false if not CD then y.dreamSig=nil end return y.dreamT end function y.owned(hq)local s8,lH={},{}
for JH,CE in ipairs(hq and hq.arriving or{})do s8[tostring(CE)]=true end for JI,cB in ipairs(hq and hq.pets or{})do
if not s8[tostring(cB.id)]then lH[#lH+1]={id=tostring(cB.id),name=cB.name,variant=cB.variant or"",named=cB.named or(cB.nickname and cB.nickname~="")}
end end return lH end function y.have(s9,CG,CH)local a9={[""]=0,Big=0,Huge=0}local s_={}for JJ,eR in ipairs(y.owned(CG))do
s_[eR.id]=true if eR.name==s9 and a9[eR.variant]then a9[eR.variant]=a9[eR.variant]+1 end end if CH then for JK,di in ipairs(o.recent or{})do
if di.name==s9 and not s_[di.id]and z()-di.at<20 and a9[di.variant or""]then a9[di.variant or""]=a9[di.variant or""]+1 end
end end return a9,a9[""]+a9 .Big*y.unit("Big")+a9 .Huge*y.unit("Huge")end function y.goal(ta)local tb=e.Pets[ta]
if tb and tonumber(tb.f)==-1 then return nil,0 end local td=y.dream()local eS=td and td[ta]if not eS then return nil,0 end
return eS,eS[""]+eS.Big*y.unit("Big")+eS.Huge*y.unit("Huge")end function y.wantMore(lI,JL,te)if not te then return true end
local tf=e.Pets[lI]if tf and tonumber(tf.f)==-1 then return true end local CI,CJ=y.goal(lI)if not CI then return true end
local JM,CK=y.have(lI,te,true)return CK<CJ+y.need()end function y.status(eT,th)if not th then return nil end local ti=e.Pets[eT]
if ti and tonumber(ti.f)==-1 then return"KEEP: never fused"end local cC,tj=y.goal(eT)if not cC then return y.dream()and"in no best team: bought as ticked"or nil end
local lJ,CL=y.have(eT,th)local cD={}if cC.Huge>0 then cD[#cD+1]=("Huge %d/%d"):format(lJ.Huge,cC.Huge)end if cC.Big>0 then cD[#cD+1]=("Big %d/%d"):format(lJ.Big,cC.Big)end
if cC[""]>0 then cD[#cD+1]=("plain %d/%d"):format(lJ[""],cC[""])end local CM=y.blocked and y.blocked[eT]and(" | "..y.blocked[eT])or""
return("%s | %d/%d copies%s"):format(table.concat(cD," "),math.min(CL,tj),tj,CM)end function y.wear(lK)local lL={}
for JN,CN in ipairs(lK)do lL[tostring(CN)]=true end for JO=1,3 do local dj=o.data()if not dj then return false end
for JP,tk in ipairs(dj.equipped or{})do if not lL[tostring(tk)]then o.call("unequip",tk)task.wait(0.3)end end
dj=o.data()local tl={}for JQ,CO in ipairs(dj.equipped or{})do tl[tostring(CO)]=true end for JR,tm in ipairs(lK)do
if not tl[tostring(tm)]then o.call("equip",tm)task.wait(0.3)end end task.wait(0.4)dj=o.data()local lM,tn=0,true
for JS,CP in ipairs(dj.equipped or{})do lM=lM+1 if not lL[tostring(CP)]then tn=false end end if tn and lM==#lK then return true end
end return false end function y.saveTeam(to,tp)if not y.wear(tp)then return false,"could not put the pets on"end
local CQ=A.teams()local cE for CS,CT in ipairs(CQ)do if CT.name==to then cE=CS break end end local dk if cE then
dk=o.call("teamSave",cE)else dk=o.call("teamNew")if type(dk)=="table"and dk.ok and dk.index then cE=dk.index task.wait(0.3)
o.call("teamRename",{index=cE,name=to})end end task.wait(0.4)local lN=o.data()local tq=lN and lN.teams and cE and lN.teams[cE]
if not tq then return false,"the game did not save it"end local tr={}for JT,CU in ipairs(tq.pets or{})do tr[tostring(CU)]=true end
for JU,CV in ipairs(tp)do if not tr[tostring(CV)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local CW=o.srv()for JV,CX in ipairs(A.list or{})do if CX.ends-CW<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local eU=o.data()if not eU then return{}end local ts={}for JW,CY in ipairs(eU.arriving or{})do ts[tostring(CY)]=true end
local eV={}for JX,hr in ipairs(eU.pets or{})do if not ts[tostring(hr.id)]then eV[#eV+1]={id=tostring(hr.id),name=hr.name,variant=hr.variant or""}end
end local tt={}for JY,tu in ipairs(eV)do tt[tu.id]=tu end local tv=tonumber(eU.slots)or 3 local lO,tw={},{}for JZ,hs in ipairs(y.ROLES)do
local eW=e[hs[1]]if eW~=""and not tw[eW]then tw[eW]=true local lP,eX,tx={},{},false for J0,ty in ipairs(eU.teams or{})do
if ty.name==eW then for J1,CZ in ipairs(ty.pets or{})do local lQ=tt[tostring(CZ)]if lQ then lP[lQ.id]=true eX[#eX+1]=lQ else tx=true end
end end end local lR,tz=y.best(hs[2],eV,tv,lP)local tA=y.score(hs[2],eX)local tB=#lR==#eX for J2,C0 in ipairs(lR)do if not lP[C0]then tB=false end end
if not tB and(tx or#eX<math.min(tv,#eV)or tz>tA+1e-4)then lO[#lO+1]={team=eW,role=hs[2],ids=lR,gain=tz-tA}end
end end return lO end function y.rebuild(C1)local tC=y.plan()if#tC==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end A.editing,A.editingSince=true,z()
local ht=true local C5,C6=pcall(function()for J3,eY in ipairs(tC)do local C2,C3=y.saveTeam(eY.team,eY.ids)local tD=o.data()
local lS={}for J4,C4 in ipairs(eY.ids)do for J5,lT in ipairs(tD and tD.pets or{})do if tostring(lT.id)==C4 then lS[#lS+1]=o.nice(lT.name,lT.variant)end
end end if C2 then C(("TEAM %s rebuilt (%s): %s"):format(eY.team,C1 or"pets changed",table.concat(lS,", ")))else ht=false C(("TEAM %s: %s"):format(eY.team,tostring(C3)))end
end end)A.editing,A.nextTry=false,0 if not C5 then ht=false C("TEAM BUILD ERR "..tostring(C6))end y.builds=y.builds+1
y.buildMsg=ht and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return ht end
function y.roleScores(tE)local bU={}for J6,tF in ipairs(tE)do bU[#bU+1]=tF.name..tF.variant end table.sort(bU)
bU=table.concat(bU,",")y.rsCache=y.rsCache or{}if y.rsCache[bU]then return y.rsCache[bU]end local C7,C8,lU=y.kinds(tE),y.slots(),{}
for J7,lV in ipairs(y.ROLES)do if e[lV[1]]~=""then local J8,C9=y.bestKinds(lV[2],C7,C8)lU[lV[2]]=C9 end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bU]=lU return lU end function y.noLoss(tG,C_,Da,Db)local tH,eZ={},{}
for J9,Dc in ipairs(C_)do tH[Dc]=true end for J_,tI in ipairs(tG)do if not tH[tI.id]then eZ[#eZ+1]=tI end end
eZ[#eZ+1]={id="new",name=Da,variant=Db}local Dd,tJ=y.roleScores(tG),y.roleScores(eZ)local tK=false for lW,tL in pairs(Dd)do
if(tJ[lW]or-math.huge)<tL-1e-6 then return false,lW end if(tJ[lW]or 0)>tL+1e-6 then tK=true end end return true,tK
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local e0=o.data()if not e0 then return end local tM=y.owned(e0)local hu,e1={},{}for Ka,De in ipairs(e0 .teams or{})do for Kb,Df in ipairs(De.pets or{})do hu[tostring(Df)]=true end end
for Kc,Dg in ipairs(e0 .equipped or{})do e1[tostring(Dg)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for Kd,aK in ipairs(o.order())do
local hv=y.goal(aK)if hv then local lX=y.have(aK,e0)for Ke,bp in ipairs({"Big",""})do local dl,lY=y.nextOf(bp),y.needFor(bp)
local Dh=(bp=="Big"and lX.Huge<hv.Huge)or(bp==""and lX.Big<hv.Big+y.needFor("Big")*math.max(0,hv.Huge-lX.Huge))
local e2={}for Kf,lZ in ipairs(tM)do if lZ.name==aK and lZ.variant==bp then e2[#e2+1]=lZ end end if Dh and#e2>=lY and z()>=(y.failUntil[aK..bp]or 0)then
table.sort(e2,function(hw,hx)local tN=(e1[hw.id]and 4 or 0)+(hu[hw.id]and 2 or 0)+(hw.named and 1 or 0)local tO=(e1[hx.id]and 4 or 0)+(hu[hx.id]and 2 or 0)+(hx.named and 1 or 0)
if tN~=tO then return tN<tO end return hw.id<hx.id end)local cF,l0,tP={},{},false for dm=1,lY do cF[dm]=e2[dm].id
if e1[cF[dm]]then l0[#l0+1]=cF[dm]end if e1[cF[dm]]or hu[cF[dm]]then tP=true end end local Di,tQ=y.noLoss(tM,cF,aK,dl)
if not Di then y.blocked[aK]=("%s waits: it would weaken the %s team now"):format(dl,y.ROLENAME[tQ]or tostring(tQ))
elseif tP and not y.quiet()then y.blocked[aK]=dl.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dl,o.nice(aK))
return else A.editing,A.editingSince=true,z()for Kg,Dj in ipairs(l0)do o.call("unequip",Dj)task.wait(0.3)end local hy=o.call("fuse",{ids=cF})
A.editing,A.nextTry=false,0 if type(hy)=="table"and hy.ok then y.fused=y.fused+1 y.dirtyAt=z()C(("FUSED %d %s -> %s"):format(lY,o.nice(aK,bp),o.nice(aK,dl)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aK,dl),os.date("%H:%M"))else y.failUntil[aK..bp]=z()+120 C(("fuse %s failed: %s"):format(o.nice(aK,bp),type(hy)=="table"and tostring(hy.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local tR=o.data()if not tR then return end local cG={}for Kh,Dk in ipairs(tR.pets or{})do cG[#cG+1]=tostring(Dk.id)end
table.sort(cG)cG=table.concat(cG,",")if cG~=y.sig then y.sig,y.dirtyAt=cG,z()end local Dl=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if Dl and not A.editing then local Dm=y.rebuild(y.dirtyAt and"pets changed"or"check")if Dm then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cH)return cH:IsA("ParticleEmitter")or cH:IsA("Trail")or cH:IsA("Beam")or cH:IsA("Fire")or cH:IsA("Smoke")
or cH:IsA("Sparkles")or cH:IsA("Light")end function d.muteOne(bq)if not e.Lite or not bq.Parent then return end
local hz=(bq:IsA("BillboardGui")and d.bb)or(d.isFx(bq)and d.fx)or nil if not hz or hz[bq]~=nil then return end
if hz==d.fx and d.gameLow and not bq:IsA("Beam")then return end hz[bq]=bq.Enabled if bq.Enabled then bq.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local l1={}for Ki,Dn in ipairs({d.bb,d.fx})do for Do in pairs(Dn)do l1[#l1+1]=Do end end local tS=os.clock()for Dp,e3 in ipairs(l1)do
if e.Lite and e3 .Parent and e3 .Enabled then local Dq=d.bb[e3]~=nil and d.bb or d.fx Dq[e3]=true e3 .Enabled=false
end if Dp%200==0 and os.clock()-tS>0.002 then task.wait()tS=os.clock()end end end function d.lite(tT)e.Lite=tT
if tT then task.spawn(function()for Dr,Ds in ipairs(am:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Ds)
if Dr%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=T(am.DescendantAdded:Connect(function(l2)
if e.Lite and(l2:IsA("BillboardGui")or d.isFx(l2))then d.queue[#d.queue+1]=l2 end end))end local l3=game:GetService("Lighting")
for Kj,e4 in ipairs(l3:GetChildren())do if e4:IsA("PostEffect")and e4 .Enabled and d.post[e4]==nil then d.post[e4]=true e4 .Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and l3 .GlobalShadows or d.oldShadows l3 .GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and am.Terrain.Decoration or d.oldDeco am.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for Kk,Dt in pairs(d.watch)do pcall(function()Dt:Disconnect()end)end
for tU,Du in pairs(d.bb)do pcall(function()if tU.Parent then tU.Enabled=Du end end)end for tV,Dv in pairs(d.fx)do pcall(function()if tV.Parent then tV.Enabled=Dv end end)end
for tW in pairs(d.post)do pcall(function()if tW.Parent then tW.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local Dw=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()Dw.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()am.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(tX)
local Dx,l4=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not Dx or type(l4)~="table"then return end if tX and not d.ceOld then d.ceOld={}for Kl,tY in ipairs({"Fireworks","Confetti"})do
local hA=l4[tY]if type(hA)=="table"and type(hA.Play)=="function"then d.ceOld[tY]=hA.Play pcall(function()hA.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not tX and d.ceOld then for Dy,Dz in pairs(d.ceOld)do pcall(function()l4[Dy].Play=Dz end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local l5,hB for Km,e5 in ipairs(getgc(false))do if type(e5)=="function"and(type(islclosure)~="function"or islclosure(e5))then
local DA,tZ,t0=pcall(debug.info,e5,"sn")if DA and type(tZ)=="string"and tZ:find("ToppingCullHandler",1,true)then
if t0=="poll"then l5=e5 elseif t0=="retarget"then hB=e5 end end end end if not(l5 and hB)then return nil end local DB,hC=pcall(debug.getupvalues,hB)
local t1=DB and type(hC)=="table"and hC[3]if type(t1)~="function"or debug.info(t1,"n")~="targetFor"or(hC[1]~=nil and type(hC[1])~="number")then return nil end
d.tc={poll=l5,re=hB}return d.tc end function d.tops(t2)local aP=d.topsFind()if not aP then return false end if t2 and not aP.old then
local DC,DD=pcall(hookfunction,aP.poll,function()end)if not DC then return false end aP.old=DD pcall(debug.setupvalue,aP.re,1,-1000)
pcall(aP.re)elseif not t2 and aP.old then local DE=type(restorefunction)=="function"and pcall(restorefunction,aP.poll)
if not DE then pcall(hookfunction,aP.poll,aP.old)end aP.old=nil pcall(aP.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(DF)local t3=am:FindFirstChild("Plots")local t4=os.clock()if DF then for Kn,DG in ipairs(t3 and t3:GetChildren()or{})do
local t5=DG:FindFirstChild("SkinProps")local t6=t5 and t5:FindFirstChild("FairyLights")for Ko,t7 in ipairs(t6 and t6:GetChildren()or{})do
for Kp,e6 in ipairs(t7:GetChildren())do if e6:IsA("BasePart")and(e6 .Name=="Bulb"or e6 .Name=="Wire")then d.lit[e6]=t7 e6 .Parent=nil end
end if os.clock()-t4>0.002 then task.wait()t4=os.clock()end end end for Kq,DH in ipairs({"Leaderboards","ClanBoard"})do
local l6=am:FindFirstChild(DH)if l6 then d.boardsOff[l6]=true l6 .Parent=nil end end else for DI,t8 in pairs(d.lit)do pcall(function()if t8 .Parent then DI.Parent=t8 end end)end
for t9 in pairs(d.boardsOff)do pcall(function()if not t9 .Parent then t9 .Parent=am end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(DJ)if DJ then local t_=af:FindFirstChild("Remotes")local ua=t_ and t_:FindFirstChild("SquishyRollAnimation")
if not ua or type(getconnections)~="function"then return end local DK,DL=pcall(getconnections,ua.OnClientEvent)
for Kr,hD in ipairs(DK and DL or{})do local l7=""pcall(function()l7=debug.info(hD.Function,"s")end)if type(l7)=="string"and l7:find("SquishyHandler",1,true)and not d.reel[hD]then
if pcall(function()hD:Disable()end)then d.reel[hD]=true end end end else for DM in pairs(d.reel)do pcall(function()DM:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(DN)if not DN then for Ks,DO in pairs(d.quiet)do pcall(function()DO:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function l8(DP,DQ)local DR,DS=pcall(getconnections,DP)
for Kt,hE in ipairs(DR and DS or{})do local l9=""pcall(function()l9=debug.info(hE.Function,"s")end)local l_=hE.Function
if l_ and type(l9)=="string"and l9:find(DQ,1,true)and not d.quiet[l_]then if pcall(function()hE:Disable()end)then d.quiet[l_]=hE end
end end end local ub=am:FindFirstChild("Plots")for Ku,hF in ipairs(ub and ub:GetChildren()or{})do if hF~=c.plot then
l8(hF:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local uc,ud=hF:FindFirstChild("WaxStations"),hF:FindFirstChild("SquishyStack")
if uc then l8(uc.DescendantAdded,"LocalToppingsHandler")end if ud then l8(ud.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for ue,DT in pairs(d.lit)do if not DT:IsDescendantOf(game)then d.lit[ue]=nil pcall(function()ue:Destroy()end)end
end end function d.passText()local av=function(DU)return H:GetAttribute(DU)end local ma={}local function bV(DV,DW)ma[#ma+1]=(DV and"[x] "or"[  ] ")..DW end
bV(av("VIP")==true,"VIP: money x1.5, offline +50%")bV(av("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(av("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local DX=av("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(av("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bV(av("FastWax")==true or av("SuperFastWax")==true,DX.." (the farm times by the game's own timers)")local uf=(av("FusePass")==true and"Fuse Pass")or(av("FusePass4")==true and"Fuse Pass 4")or(av("FusePass5")==true and"Fuse Pass 5")or nil
bV(uf~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(uf or"Fuse pass",y.needFor(""),y.needFor("Big")))local hG=o.data()
local DY=tonumber(hG and hG.maxOwned)or 60 bV(av("PetInventory50")==true or av("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(hG and#(hG.pets or{})or 0,DY,(av("PetInventory50")==true and av("PetInventory100")==true)and" (both bag passes)"or""))
local ug=tonumber(av("PetEquipBought"))or 0 bV(ug>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),ug))
local uh=tonumber(av("PetWishCredits"))or 0 if uh>0 then bV(true,("%d free wishes: used before cash"):format(uh))end
local ui=tonumber(av("FinishAllCredits"))or 0 if ui>0 then bV(true,("%d finish-all credits (yours to use)"):format(ui))end
return table.concat(ma,"\n")end function d.extras(hH)pcall(d.quietPlots,hH and c.plot~=nil)pcall(d.fxPatch,hH)
pcall(d.tops,hH)pcall(d.lights,hH)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(uj)
e.HideHud=uj local mb=H:FindFirstChildOfClass("PlayerGui")if not mb then return end if uj then for Kv,e7 in ipairs(mb:GetChildren())do
if e7:IsA("ScreenGui")and not d.MINE[e7 .Name]and e7 .Enabled then d.hud[e7]=true e7 .Enabled=false end end if not d.hudConn then
d.hudConn=T(mb.ChildAdded:Connect(function(e8)if e.HideHud and e8:IsA("ScreenGui")and not d.MINE[e8 .Name]then
task.defer(function()if e.HideHud and e8 .Enabled then d.hud[e8]=true e8 .Enabled=false end end)end end))end else
for uk in pairs(d.hud)do pcall(function()if uk.Parent then uk.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mc)e.FpsCap=mc local ul=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not ul then return false end return pcall(ul,mc==0 and 60 or mc)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ao)if ao:IsA("BasePart")or ao:IsA("Decal")or ao:IsA("Texture")then if ao.Transparency<1 then d.unseen[ao]=ao.Transparency ao.Transparency=1 end
elseif ao:IsA("BillboardGui")or ao:IsA("SurfaceGui")or ao:IsA("ParticleEmitter")or ao:IsA("Beam")or ao:IsA("Trail")or ao:IsA("Light")or ao:IsA("Fire")or ao:IsA("Smoke")or ao:IsA("Sparkles")then
if ao.Enabled then d.unseen[ao]=true ao.Enabled=false end end end function d.notMine(DZ)return e.HideMine or(c.plot and not DZ:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(hI)
local md=hI.Parent local me=md and md.Name=="SquishyStack"and md.Parent if me and me~=c.plot and c.plot and me.Parent==c.plot.Parent and not d.dropSeen[hI]then
d.dropSeen[hI]=true d.dropQ[#d.dropQ+1]={hI,z()+3}end end function d.dropScan()local um=c.plot and c.plot.Parent
if not(e.HideBases and um)then return end for Kw,uo in ipairs(um:GetChildren())do local up=uo~=c.plot and uo:FindFirstChild("SquishyStack")
for Kx,D0 in ipairs(up and up:GetChildren()or{})do d.dropIt(D0)end end end function d.dropStep(D1)local mf=d.dropQ
while d.dropI<=#mf and os.clock()-D1<0.003 do local mg=mf[d.dropI]if mg[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mg[1].Parent then pcall(function()mg[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mf then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mh=os.clock()local e9=d.queue if e.Lite and e9 and#e9>0 then d.muteI=d.muteI or 1
while d.muteI<=#e9 and os.clock()-mh<0.0015 do pcall(d.muteOne,e9[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#e9 then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mh)end local hJ=d.hideQ if d.hideI>#hJ then return end while d.hideI<=#hJ and os.clock()-mh<0.004 do
local mi=hJ[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mi.Parent and d.notMine(mi)then pcall(d.hideOne,mi)end
end if d.hideI>#hJ then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(uq)if e.HideBases then d.bases(false)end
e.HideMine=uq==2 if uq>0 then d.bases(true)end end function d.bases(ur)e.HideBases=ur local mj=am:FindFirstChild("Plots")
if not mj then return end if ur then task.spawn(function()local mk=0 for Ky,hK in ipairs(mj:GetChildren())do local us=hK~=c.plot and c.plot and hK:FindFirstChild("SquishyStack")
for Kz,D2 in ipairs(us and us:GetChildren()or{})do d.dropIt(D2)end if hK~=c.plot or e.HideMine then for KA,D3 in ipairs(hK:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,D3)mk=mk+1 if mk%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=T(mj.DescendantAdded:Connect(function(dn)if e.HideBases and d.notMine(dn)then
pcall(d.hideOne,dn)d.hideQ[#d.hideQ+1]=dn if dn.Parent and dn.Parent.Name=="SquishyStack"then d.dropIt(dn)end
end end))end else for ml,ut in pairs(d.unseen)do pcall(function()if not ml.Parent then return end if type(ut)=="number"then ml.Transparency=ut else ml.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(uu)e.NoRender=uu pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not uu)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local D4=game:GetService("RunService")local mm=0 for KB,D5 in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local D6,uv=pcall(function()return D4[D5]end)local uw,mn=false,nil if D6 and uv then uw,mn=pcall(getconnections,uv)end
if uw and type(mn)=="table"then for KC,hL in ipairs(mn)do local mo=""pcall(function()local ux=getfenv(hL.Function).script mo=ux and ux:GetFullName()or""end)
if mo~=""then for KD,D7 in ipairs(d.CALM)do if mo:find(D7,1,true)then local mp=hL.Function if mp and not d.calmedF[mp]and pcall(function()hL:Disable()end)then
d.calmedF[mp]=true d.calmed[#d.calmed+1]=hL mm=mm+1 end break end end end end end end if#d.calmed>200 then local mq={}for D8=#d.calmed-49,#d.calmed do mq[#mq+1]=d.calmed[D8]end d.calmed=mq
end return mm end function d.calm(uy)e.Calm=uy if uy then local D9=d.calmScan()C(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(D9))
else for KE,D_ in ipairs(d.calmed)do pcall(function()D_:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(uz)if c.rejoining then return end C("REJOIN this server ("..uz..")")
pcall(f4)if c.autoload then pcall(gu,c.autoload)end pU()local Ea=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,H)
end)task.delay(25,function()if c.alive then d6(uz..", same server failed")end end)return Ea end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=H:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local uA=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if uA then for KF,Eb in ipairs(uA:GetChildren())do local uB=Eb:FindFirstChild("SquishyPlaceHolder")local cI=uB and uB:FindFirstChild("TimerGui")
if cI and cI:IsA("BillboardGui")then if d.bb[cI]==nil then pcall(d.muteOne,cI)elseif cI.Enabled then d.bb[cI]=true cI.Enabled=false end
end end end local Ec,dp=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if Ec and type(dp)=="number"then
d.mem=dp d.memPeak=math.max(d.memPeak,dp)if(e.MemLimit or 0)>0 and dp>e.MemLimit then d.over=(d.over or 0)+((dp>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dp,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()C(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mr(hM)if type(hM)~="string"then return false end
hM=hM:lower()for KG,Ed in ipairs(c.sellWords)do if hM:find(Ed,1,true)then return true end end return false end
local function Ee()local uC=af:FindFirstChild("Remotes")local ms=uC and uC:FindFirstChild("SellSquishy")if not(ms and ms:IsA("RemoteEvent"))then return false end
if not pcall(function()ms:FireServer()end)then return false end return aq(function()return ac()==nil end,1.5)
end local function Ef()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local uD=ap()local uE=uD and uD.HumanoidRootPart.Position local e_,uF for KH,dq in ipairs((c.plot or am):GetDescendants())do
if dq:IsA("ProximityPrompt")and(mr(dq.ActionText)or mr(dq.ObjectText)or mr(dq.Name))then local uG=oQ(dq)local mt=(uG and uE)and(uG-uE).Magnitude or 1e9
if mt<=400 and(not e_ or mt<uF)then e_,uF=dq,mt end end end c.sellSpot=e_ c.noSellSpot=(e_==nil)return e_ end
local function uH()local mu=ac()if not mu then c.holding=false return false end if aN(mu)then return false end
local mv=ak(W(mu))if Ee()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=z()+2.5,0
C("SOLD "..mv)return true end local dr=Ef()if dr then local uI=dU(dr)if uI then cl(uI,dr)local uJ=ac()if uJ and not aN(uJ)then
local Eg,Eh=eb(dr,function()return ac()==nil end,function()return dr.Enabled end)if Eg then c.sold,c.holding,c.sellFails=c.sold+1,false,0
C(("SOLD %s at %s via %s"):format(mv,fZ(dr),Eh))return true end end end end c.sellFails=c.sellFails+1 C("could not sell "..mv.." ("..c.sellFails..")")
return false end local Ei={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Ej(ds)local hN=fZ(ds):lower()for KI,Ek in ipairs(Ei)do if hN:find(Ek,1,true)then return 0 end end
local a_,ar=ds.Name:lower(),0 local function aX(El,Em)return El:find(Em,1,true)~=nil end if aX(a_,"collect")then ar=ar+60 end
if aX(a_,"cash")or aX(a_,"money")then ar=ar+45 end if aX(a_,"income")or aX(a_,"claim")then ar=ar+35 end if aX(a_,"coin")or aX(a_,"earn")or aX(a_,"green")then ar=ar+20 end
if a_=="pad"or a_=="touch"then ar=ar+25 end if ar==0 and(aX(hN,"collect")or aX(hN,"cash")or aX(hN,"money"))then ar=25 end
if ar==0 then return 0 end local fa=ds.Color if fa.G>0.5 and fa.G>fa.R*1.4 and fa.G>fa.B*1.4 then ar=ar+15 end
if math.min(ds.Size.X,ds.Size.Y,ds.Size.Z)<2 then ar=ar+5 end return ar end local function En()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local hO,fb,mw={},nil,29 for KJ,hP in ipairs(c.plot:GetDescendants())do
if hP:IsA("BasePart")then local hQ=Ej(hP)if hQ>0 then hO[#hO+1]={s=hQ,p=hP}if hQ>mw then fb,mw=hP,hQ end end end
end table.sort(hO,function(Eo,Ep)return Eo.s>Ep.s end)c.padCands,c.padPart=hO,fb if fb then C("collect pad: "..fZ(fb).." (score "..mw..")")end
return fb end local mx="SAB_pad_v1.txt"local function Eq(Er)if type(writefile)=="function"then pcall(writefile,mx,table.concat({Er:GetComponents()},","))end
end local function Es()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Et,uK=pcall(function()if isfile(mx)then return readfile(mx)end end)
if not Et or type(uK)~="string"then return nil end local hR={}for Eu in uK:gmatch("[^,]+")do hR[#hR+1]=tonumber(Eu)end
if#hR==12 then return CFrame.new(unpack(hR))end end local function Ev(my,hS,Ew)local Ex=c5(my)local mz=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aY=(mz and mz:IsA("BasePart"))and(mz.Position-hS)or Vector3 .new(1,0,0)aY=Vector3 .new(aY.X,0,aY.Z)if aY.Magnitude<0.05 then aY=Vector3 .new(1,0,0)end
aY=aY.Unit for Ey=0,7 do local hT=Ey*math.pi/4 local Ez=Vector3 .new(aY.X*math.cos(hT)-aY.Z*math.sin(hT),0,aY.X*math.sin(hT)+aY.Z*math.cos(hT))
local hU=hS+Ez*(Ew+5)local mA=gC(hU.X,hS.Y,hU.Z)if mA and math.abs(mA.Y-hS.Y)<8 then aG(my,Vector3 .new(hU.X,mA.Y+Ex,hU.Z))
if j4(my,0.7)then return true end end end return false end local function EA()c.lastCollect=z()local fc=ap()if not fc then return end
local uL,EB=fc.HumanoidRootPart,c5(fc)local fd,uM,fe,mB=nil,4,nil,"?"local mC=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and mC and mC:IsA("BasePart")then fd,mB=(mC.CFrame*c.manualPad).Position,"manual pad"else local br=En()
if br then fd=Vector3 .new(br.Position.X,br.Position.Y+br.Size.Y/2+EB,br.Position.Z)uM,fe,mB=math.max(br.Size.X,br.Size.Z)/2,br,br.Name
end end if not fd then C("COLLECT: pad not found - stand on it and tap SET PAD")return end local mD=be()aG(fc,fd)
if fe and type(firetouchinterest)=="function"then pcall(firetouchinterest,uL,fe,0)end ag(e.PadDwell)if fe and type(firetouchinterest)=="function"then pcall(firetouchinterest,uL,fe,1)end
ag(0.5)c.collected=c.collected+1 local mE=be()C(("COLLECTED (%s) %s"):format(mB,(mD and mE and mE>mD)and("+$"..aD(mE-mD))or"no cash change seen"))
Ev(fc,fd,uM)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.mods()if q.si and z()-q.modAt<120 then return true end
local uN=af:FindFirstChild("Modules")if not uN then return false end local function mF(EC)local uO=uN:FindFirstChild(EC)
if not uO then return nil end local ED,uP=pcall(require,uO)return(ED and type(uP)=="table")and uP or nil end q.si,q.arm,q.ci=mF("SquishyInfo"),mF("AutoRollRules"),mF("CrateInfo")
q.modAt=z()if not q.si then return false end local mG={}if q.arm and type(q.arm.tierOf)=="table"then for mH in pairs(q.arm.tierOf)do
local hV=q.si[mH]if type(hV)=="table"and hV.rarity~="Limited"and not hV.incomeType and not hV.hiddenAfter then mG[W(mH)]=mH end
end end q.roll=mG local hW={}for EE,EF in pairs(mG)do local ff=q.si[EF]if type(ff)=="table"and type(ff.income)=="number"and not ff.incomeType then
hW[#hW+1]={k=EE,inc=ff.income,pr=tonumber(ff.price)or 0}end end table.sort(hW,function(mI,mJ)if mI.inc~=mJ.inc then return mI.inc>mJ.inc end return mI.pr>mJ.pr end)
q.order=hW local hX,mK,mL local EG=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for EH,mM in pairs(EG)do
local mN=type(mM)=="table"and tonumber(mM.price)if mN and(not mK or mN>mK)then hX,mK,mL=EH,mN,mM.title end end
q.bestCrate,q.bestCrateName=hX and L.key(hX),hX q.bestCrateTitle=mL and L.key(mL)or nil return true end function q.rank(EI)
local EJ,EK=pcall(function()return q.arm.rankOf(EI)end)return(EJ and tonumber(EK))or 0 end function q.loadDisc(uQ)
if type(uQ)~="table"then return end local uR={}for EL,EM in pairs(uQ)do if EM then uR[W(tostring(EL))]=true end end
q.disc,q.discAt=uR,z()end function q.fetch()q.discAt=z()local uS=af:FindFirstChild("Remotes")local uT=uS and uS:FindFirstChild("GetSquishiesDiscovered")
if not uT then return end local EN,EO=pcall(function()return uT:InvokeServer()end)if EN then q.loadDisc(EO)end
end function q.scanWax()local mO={}local uU=c.plot and c.plot:FindFirstChild("WaxStations")if uU then for KK,uV in ipairs(uU:GetChildren())do
local uW=uV:FindFirstChild("SquishyPlaceHolder")if uW and uV:GetAttribute("HasSquishy")then for KL,uX in ipairs(uW:GetChildren())do if uX:IsA("Model")then mO[W(uX.Name)]=true end end
end end end for uY,EP in pairs(q.placedAt)do if z()-EP<20 then mO[uY]=true else q.placedAt[uY]=nil end end q.waxing=mO
end function q.compute()local uZ,mP,mQ={},0,0 if q.disc then for mR in pairs(q.roll or{})do if not q.disc[mR]then
if q.waxing[mR]then mQ=mQ+1 else uZ[mR],mP=true,mP+1 end end end end q.need,q.nNeed,q.nWax=uZ,mP,mQ local u0,mS={},e.Best or 0
local mT=(mS==4)and q.stackMin or nil for EQ,u1 in ipairs(q.order)do if(mT and u1 .inc>mT)or(not mT and EQ<=(mS==4 and 1 or mS))then u0[u1 .k]=true end
end q.best=u0 end function q.readStack()q.stackAt=z()local u2=af:FindFirstChild("Remotes")local u3=u2 and u2:FindFirstChild("EditStack")
if not u3 then return end local ER,dt=pcall(function()return u3:InvokeServer("State",nil)end)if not(ER and type(dt)=="table"and type(dt.state)=="table"and type(dt.state.entries)=="table")then return end
local hY for KM,u4 in ipairs(dt.state.entries)do local fg=type(u4)=="table"and q.si and q.si[tostring(u4 .name)]
if type(fg)=="table"and type(fg.income)=="number"and not fg.incomeType and(not hY or fg.income<hY)then hY=fg.income end
end q.stackMin=hY q.stackFull=#dt.state.entries>=(tonumber(dt.state.capacity)or 100)end function q.want(mU)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[mU]then return true end elseif e.Targets[mU]then return true end return e.AutoIndex==true and q.need[mU]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(ES)local fh=W(ES)q.placedAt[fh],q.waxing[fh]=z(),true if q.need[fh]then q.need[fh],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
C(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(fh)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fi,fj={},{}for ET,EU in pairs(q.roll or{})do if q.want(ET)then fi[EU]=true end end
for u5,mV in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(u5)or(type(mV)=="table"and type(mV.title)=="string"and L.wanted(mV.title))then fj[u5]=true end
end if not next(fi)and not next(fj)then return nil end if q.arm and type(q.arm.encode)=="function"then local EW,u6=pcall(q.arm.encode,{rarities={},butters=fi,crates=fj,index=false})
if EW and type(u6)=="string"then return u6 end end local function u7(EX)local hZ={}for EY in pairs(EX)do hZ[#hZ+1]=EY end table.sort(hZ)return table.concat(hZ,",")end
local fk="adv:"if next(fi)then fk=fk..";butters:"..u7(fi)end if next(fj)then fk=fk..";crates:"..u7(fj)end return fk
end function q.canon(EZ)local h0={}for u8 in tostring(EZ or""):gmatch("[^;]+")do local mW,u9=u8:match("^(%a+):(.*)$")
if not mW then mW,u9="r",u8:gsub("^adv:","")end for E0 in u9:gmatch("[^,]+")do h0[#h0+1]=mW.."="..E0 end end table.sort(h0)
return table.concat(h0,"|")end function q.sync(E1)if H:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cJ=q.rulesNow()if not cJ or#cJ>1900 then return end if q.canon(H:GetAttribute("AutoRollRules"))==q.canon(cJ)then q.fails=0 return end
if not E1 and z()-q.sentAt<4 then return end local u_=af:FindFirstChild("Remotes")local va=u_ and u_:FindFirstChild("AutoRollAction")
if not va then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 C("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()D.replaying=true pcall(function()va:FireServer("Rules",cJ)end)D.replaying=false e.ARrules=cJ
local h1,h2=0,0 for KN in(cJ:match("butters:([^;]*)")or""):gmatch("[^,]+")do h1=h1+1 end for KO in(cJ:match("crates:([^;]*)")or""):gmatch("[^,]+")do h2=h2+1 end
local vb=h1 .."/"..h2 if q.told~=vb then q.told=vb C(("auto roll now stops on %d butters and %d crates"):format(h1,h2))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aQ={}if e.AutoIndex then aQ[#aQ+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fl=0 for KP in pairs(q.best)do fl=fl+1 end
aQ[#aQ+1]=fl==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fl,fl==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aQ[#aQ+1]="best: "..ak(q.order[1].k)end if e.BestCrate and q.bestCrateName then aQ[#aQ+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aQ[#aQ+1]="shower: "..O.got end q.msg=#aQ>0 and table.concat(aQ," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(E2)q.feed[#q.feed+1]=os.date("%H:%M ")..E2 if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vc,ax,h3)if vc~="Effect"then q.feedAdd(tostring(vc)..(ax~=nil and(": "..tostring(ax):sub(1,80))or""))
return end if ax~="ShowerTaken"and ax~="GoalPoint"then q.feedAdd(tostring(ax))end if ax=="Shower"then O.add(h3)return end
if ax=="ShowerTaken"then O.gone(h3)return end if ax=="ShowerClear"then O.drops={}return end if ax=="WaxGlow"then
local mX=type(h3)=="table"and tonumber(h3 .SnapAt)if mX then q.snapAt=mX C(("ADMIN: every wax finishes in %ds%s"):format(math.floor(mX-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end ax=tostring(ax)cf("Admin "..ax)if ax~="GoalPoint"and z()-(q.heard[ax]or-100)>30 then q.heard[ax]=z()
C("ADMIN: "..ax)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(mY)if type(mY)~="table"or type(mY.Pieces)~="table"then return end
for KQ,aZ in pairs(mY.Pieces)do if type(aZ)=="table"and aZ.Id~=nil and aZ.Position~=nil then O.drops[aZ.Id]={id=aZ.Id,butter=tostring(aZ.Butter or"?"),rar=tostring(aZ.Rarity or"?"),star=aZ.Star==true,
pos=aZ.Position,opens=tonumber(aZ.OpensAt)or 0,ends=tonumber(aZ.ExpiresAt)or 0}end end end function O.gone(fm)
if type(fm)~="table"or fm.Id==nil then return end O.drops[fm.Id]=nil if tonumber(fm.UserId)==o.uid then O.mine=fm.Id end
end function O.pick()local mZ=o.srv()local m0,vd for ve,cK in pairs(O.drops)do if mZ>=cK.ends-0.3 then O.drops[ve]=nil
elseif mZ>=cK.opens-0.2 and(O.tried[ve]or 0)<3 then local vf=(aN(cK.butter)and 1e6 or 0)+(cK.star and 1e5 or 0)+q.rank(cK.rar)*100-(cK.ends-mZ)
if not m0 or vf>vd then m0,vd=cK,vf end end end return m0 end function O.due()return e.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aR,m1=O.pick(),ap()if not(aR and m1)then return end O.tried[aR.id]=(O.tried[aR.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aG(m1,aR.pos+Vector3 .new(0,c5(m1)+0.5,0))aq(function()return O.mine==aR.id or ac()~=nil or not O.drops[aR.id]end,1.5)
if O.mine==aR.id or ac()then O.got,O.drops[aR.id]=O.got+1,nil C(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aR.butter)),aR.rar,aR.star and" (star)"or""))
elseif not O.drops[aR.id]then O.miss=O.miss+1 end end local fn local function vg()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 C("trying again after being stopped for 5 minutes")fn(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ap()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bB(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local m2,vh=f1()
local h4=ac()if h4 then local du=ak(W(h4))if not aN(h4)then local m3=(V.gift and W(V.gift)==W(h4)and z()-V.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(du,m3),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(du,m3),"bad"end return"sell",("selling %s (%s)"):format(du,m3),"warn"
end if m2<1 then return nil,("holding %s - 0 free stations"):format(du),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(du),"wait"end
return"place",("waxing %s (%d free)"):format(du,m2),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local m4=c.plot:FindFirstChild("CrateStand")if m4 then for KR,fo in ipairs(m4:GetDescendants())do
if fo:IsA("ProximityPrompt")and fo.Enabled and kk(fo)then local bs=fo.ObjectText if bs==""then bs=cY(m4,"TitleLabel")or""end
if bs~=""and L.wanted(bs)then local E3=fX(bs):gsub("crate$","")local vi for vj in pairs(ad.members)do if fX(vj)==E3 then vi=vj end end
j.waiting,j.at,j.title,j.prompt=true,z(),bs,fo j.data={name=(bs:gsub("%s","")),rarity=vi,title=bs}C(bs.." found waiting on your stand")
end break end end end end local vk=L.wanted(j.data and j.data.name)or L.wanted(j.title)if e.Crates and(j.on or j.waiting)and vk then
local a0=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a0),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 C("could not press the "..a0 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a0),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a0),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a0,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a0),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a0,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a0,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil C("trying the "..a0 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a0),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a0,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not vk then local vl=j.title..tostring(j.rolledAt)if j.told~=vl then j.told=vl C(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if m2<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(vh,vh),"wait"
end local m5=o4()if not m5 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dv=ce()
if dv and qt(dv.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dv.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dv.name),"bad"end if not qM()then return nil,("%s rolled - waiting for it to land on the stand"):format(dv.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dv.name),"ok"end local bW=j2()if bW.state~="match"then
c.matchSince=nil if bW.state=="skip"and not m5 .Enabled then return nil,bW.text.." (sold out)","idle"end return nil,bW.text,bW.level
end if not m5 .Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local fp=z()
if fp<c.noCashUntil then local vm,E4=d8()if vm then return nil,("cash short: have $%s, price ~$%s"):format(aD(vm),aD(E4)),"bad"end
return nil,(d8()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aD(be()),math.ceil(c.noCashUntil-fp)),d8()and"bad"or"wait"end if fp-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or fp local vn=fp-c.matchSince if vn<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bW.shown,vn),"ok"end
return"buy",("buying %s via %s"):format(bW.shown,bW.src),"ok"end d.DEPTH=11 function d.pinTick()local vo=d.hold
if not vo then return end local m6=H.Character local m7=m6 and m6:FindFirstChild("HumanoidRootPart")if not m7 then return end
m7 .CFrame=vo m7 .AssemblyLinearVelocity=Vector3 .new(0,0,0)for KS,h5 in ipairs(m6:GetChildren())do if h5:IsA("BasePart")and h5 .CanCollide then d.noclip[h5]=true h5 .CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(E5,vp)d.hold=E5 if vp then d.surface=vp end end function d.unpin(E6)
if not d.hold then return end d.hold=nil for vq in pairs(d.noclip)do pcall(function()if vq.Parent then vq.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local vr=ap()if vr and d.surface and not E6 then aG(vr,d.surface.Position,d.surface.Position+d.surface.LookVector)
ag(0.1)end end function d.home()local bt,vs=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ap()
if not(bt and bt:IsA("BasePart")and vs)then return nil end local vt=oT()or bt.Position local h6=Vector3 .new(vt.X-bt.Position.X,0,vt.Z-bt.Position.Z)
h6=h6 .Magnitude>0.1 and h6 .Unit or Vector3 .new(0,0,1)local h7=bt.Position+h6*6 local vu=gC(h7 .X,bt.Position.Y,h7 .Z,{bt})
return CFrame.new(h7 .X,(vu and vu.Y or bt.Position.Y)+c5(vs),h7 .Z)end function d.ground(E7,vv,E8)local m8,m9={H.Character},nil
for KT=1,12 do local m_=RaycastParams.new()m_.FilterType=Enum.RaycastFilterType.Exclude m_.FilterDescendantsInstances=m8
local h8=am:Raycast(Vector3 .new(E7,vv,E8),Vector3 .new(0,-2000,0),m_)if not h8 then break end m9,vv=h8,h8 .Position.Y-0.05
m8[#m8+1]=h8 .Instance end return m9 and m9 .Position.Y end function d.parkHome()local na=d.home()if not na then return false end
local dw=na.Position local E9=d.ground(dw.X,dw.Y+300,dw.Z)or(dw.Y-3)d.pin(CFrame.new(dw.X,E9-8,dw.Z),na)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(h9)e.Ghost,e.GhostHelps=h9==2,h9==1 if h9<2 then task.spawn(function()while c.busy do ag(0.1)end
if d.ghostMode()<2 and d.hold and not E.home then pcall(d.unpin)end end)end d.paintGhost()C("ghost: "..d.GHOST[h9][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local E_=ap()if not E_ or K.seat()then return end d.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local vw=H.Character local vx=vw and vw:FindFirstChildOfClass("Humanoid")local nb=vx and vx.SeatPart
return(nb and nb.Name=="LogSeat")and nb or nil end function K.due()if not(e.Campfire and c.running)or z()<K.nextAt then return false end
local Fa=am:FindFirstChild("NightSeats")if not Fa then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or z()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(H:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
C(K.msg)return false end end return true end function K.sit()local vy,h_=am:FindFirstChild("NightSeats"),ap()
if not vy or not h_ then return end local vz,dx=h_.HumanoidRootPart.Position,{}for KU,ia in ipairs(vy:GetChildren())do
local vA=ia:IsA("Seat")and ia.Occupant==nil and ia:FindFirstChildOfClass("ProximityPrompt")if vA then dx[#dx+1]={st=ia,p=vA}end
end if#dx==0 then K.nextAt,K.msg=z()+10,"the campfire is full - waiting for a seat"return end table.sort(dx,function(Fb,Fc)return(Fb.st.Position-vz).Magnitude<(Fc.st.Position-vz).Magnitude end)
local Fd,Fe=dx[1].st,dx[1].p d.unpin(true)local dy=Fd.CFrame aG(h_,dy.Position+dy.LookVector*2+Vector3 .new(0,2.5,0),dy.Position)
ag(0.25)local Ff=eb(Fe,function()return K.seat()~=nil end)if not Ff then aG(h_,dy.Position+Vector3 .new(0,2,0),dy.Position+dy.LookVector)
aq(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,z()C(("SAT at the campfire (+%s%% cash)"):format(tostring(H:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=z()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then C(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=z()local nc=af:FindFirstChild("Remotes")if not nc then return end local fq,nd,dz=0,0,{}
local Fg,vB=pcall(function()return nc.ClanRequest:InvokeServer("state")end)local vC=Fg and type(vB)=="table"and vB.tasks
for KV,bX in ipairs(vC and vC.list or{})do if not bX.done and bX.kind=="pull"then fq=math.max(fq,(bX.goal or 0)-(bX.progress or 0))end
if not bX.done then dz[#dz+1]=("%s %d/%d"):format(tostring(bX.text),bX.progress or 0,bX.goal or 0)end end F.events={}
for KW,dA in ipairs(nc:GetChildren())do if dA:IsA("RemoteFunction")and dA.Name:match("^%u%a+Action$")and dA.Name~="CrateAction"and dA.Name~="AutoRollAction"then
local Fh,fr=pcall(function()return dA:InvokeServer("state")end)if Fh and type(fr)=="table"and fr.live==true and type(fr.quests)=="table"then
F.events[#F.events+1]={r=dA,st=fr}for KX,aS in ipairs(fr.quests)do if not aS.done and aS.kind=="pull"then fq=math.max(fq,(aS.goal or 0)-(aS.progress or 0))end
if not aS.done and aS.kind=="collect"then nd=math.max(nd,(aS.goal or 0)-(aS.progress or 0))end if not aS.done then dz[#dz+1]=("%s %d/%d"):format(tostring(aS.text),aS.progress or 0,aS.goal or 0)end
end end end end F.pullLeft,F.collectLeft=fq,nd F.msg=#dz>0 and("open: "..table.concat(dz,", "))or"all quests done for today"
end function F.claim()for KY,fs in ipairs(F.events)do local vD=fs.r.Name:gsub("Action$","")for KZ,dB in ipairs(fs.st.quests)do
if dB.done and not dB.claimed then local Fi,vE=pcall(function()return fs.r:InvokeServer("claimQuest",dB.id)end)
if Fi and not(type(vE)=="table"and vE.ok==false)then F.claims=F.claims+1 C(("CLAIMED %s quest: %s (+%s)"):format(vD,tostring(dB.text),tostring(dB.points or dB.treats or"?")))
end ag(0.4)end end if fs.st.bonusReady==true then local Fj=pcall(function()return fs.r:InvokeServer("claimBonus")end)
if Fj then C(("CLAIMED %s daily quest bonus"):format(vD))end ag(0.4)end end end function F.tick()if not(e.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if z()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return e.Quests and c.running and F.pullLeft>0 and z()>=F.nextAt and not D.busy end function F.lever()local vF=c.plot and c.plot:FindFirstChild("Lever")
local ne=vF and vF:FindFirstChild("Wheel")return ne and ne:FindFirstChildWhichIsA("ProximityPrompt"),ne end function F.resume(Fk)
F.arPaused=false if F.arWas then F.arWas=false e.AutoRoll=true task.spawn(D.apply,Fk)end end function F.pull()
local ib,nf=F.lever()if not ib or not nf or not nf:IsA("BasePart")then F.nextAt,F.msg=z()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=z()+30 return end end C(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not ib.Enabled then F.nextAt=z()+1 return end cl(nf,ib)F.asked=nil qh(ib)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
ag(0.6)if F.asked then F.nextAt=z()+600 C(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=z()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bY,Fl)local ng=bY:GetAttribute("PourOwner")
if type(ng)~="number"or ng==o.uid or not bY:GetAttribute("HasSquishy")then return false end if bY:GetAttribute("PourLong")~=true or bY:GetAttribute("PourFull")==true then return false end
local nh=bY:GetAttribute("PourId")if nh==nil or E.skip[nh]then return false end local vG,ni,Fm=bY:GetAttribute("Helpers"),0,tostring(o.uid)
if type(vG)=="string"then for Fn in vG:gmatch("[^,%s]+")do ni=ni+1 if Fn==Fm then return false end end end if ni>=6 then return false end
local ic=A.left(bY)if not ic then local vH=tonumber(bY:GetAttribute("PourEnd"))ic=vH and(vH-Fl)end if not ic or ic<=75 then return false end
local nj=game:GetService("Players"):GetPlayerByUserId(ng)if not nj or nj:GetAttribute("WaxHelpOff")==true then return false end
return true,nj,nh end function E.list()local nk,Fo={},o.srv()local vI=am:FindFirstChild("Plots")for K0,vJ in ipairs(vI and vI:GetChildren()or{})do
local vK=vJ~=c.plot and vJ:FindFirstChild("WaxStations")for K1,nl in ipairs(vK and vK:GetChildren()or{})do local Fp,Fq,Fr=E.can(nl,Fo)
local nm=Fp and nl:FindFirstChild("SquishyPlaceHolder")if nm and nm:IsA("BasePart")then nk[#nk+1]={st=nl,p=Fq,id=Fr,part=nm}end
end end return nk end function E.due()if e.Help and c.running and z()>=E.nextAt and(d.mem or 0)>900 then E.nextAt,E.msg=z()+30,("paused - phone memory %d MB (helps load other bases)"):format(d.mem)
return false end return e.Help and c.running and z()>=E.nextAt end function E.skipIt(vL,vM)E.skip[vL],E.skipN=vM,E.skipN+1
if E.skipN>600 then E.skip,E.skipN,E.tries={[vL]=vM},1,{}end end function E.goHome()local ie,bZ=ap(),E.home E.home=nil
if not(ie and bZ)then return end if e.Ghost and not K.seat()then d.unpin(true)if not d.parkHome()then pcall(aG,ie,bZ.Position,bZ.Position+bZ.LookVector)end
elseif d.hold or(ie.HumanoidRootPart.Position-bZ.Position).Magnitude>20 then d.unpin(true)pcall(aG,ie,bZ.Position,bZ.Position+bZ.LookVector)
end end function E.step()local nn,ft=E.list(),ap()if#nn==0 or not ft then E.nextAt=z()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local vN=ft.HumanoidRootPart local vO=vN.Position table.sort(nn,function(Fs,Ft)return(Fs.part.Position-vO).Magnitude<(Ft.part.Position-vO).Magnitude end)
local a1=nn[1]E.home=E.home or(d.hold and d.surface)or vN.CFrame local b0=a1 .part local fu=(b0 .Position+a1 .st:GetPivot().Position)/2
local ig=E.tries[a1 .id]or 0 if(e.Ghost or e.GhostHelps)and ig==0 and not K.seat()then d.pin(b0 .CFrame,E.home)
else d.unpin(true)local no=ig==0 and gC(fu.X,b0 .Position.Y,fu.Z,{b0})if no and math.abs(no.Y-b0 .Position.Y)<8 then
aG(ft,Vector3 .new(fu.X,no.Y+c5(ft),fu.Z),b0 .Position)else aG(ft,b0 .Position+Vector3 .new(0,b0 .Size.Y/2+3,0),fu)
end end ag(0.3)local fv=af:FindFirstChild("Remotes")fv=fv and fv:FindFirstChild("ClanRequest")if not fv then E.nextAt,E.msg=z()+60,"the game's help remote is missing"return end
local ih,bu=pcall(function()return fv:InvokeServer("help",a1 .st:GetAttribute("PourOwner"),tonumber(a1 .st.Name))end)
if ih and type(bu)=="table"and bu.ok then E.n,E.fails=E.n+1,0 E.skipIt(a1 .id,"helped")C(("HELPED %s's wax (station %s)"):format(a1 .p.DisplayName,a1 .st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif ih and type(bu)=="table"and tostring(bu.reason or""):lower():find("walk up",1,true)and ig<2 then
E.tries[a1 .id]=ig+1 E.nextAt=z()+0.3 elseif ih and type(bu)=="table"and tostring(bu.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=z()+1.6 else local vP=(ih and type(bu)=="table"and tostring(bu.reason or"refused"))or("error: "..tostring(bu))
E.skipIt(a1 .id,vP)E.fails=E.fails+1 if E.fails<=3 then C(("help refused for %s's wax: %s"):format(a1 .p.DisplayName,vP))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,z()+1.2)end function E.onCall(bv)if not e.HelpGuild or type(bv)~="table"or bv.p~="help"or bv.mine or bv.u==o.uid or not bv.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fw=af:FindFirstChild("Remotes")
fw=fw and fw:FindFirstChild("ClanRequest")if not fw then return end local vQ,fy=pcall(function()return fw:InvokeServer("callHelp",bv.u)end)
local vR=tostring(bv.n or bv.un or bv.u)if vQ and type(fy)=="table"and fy.ok then E.calls=E.calls+1 C(("HELPED guildmate %s's wax from here (their call)"):format(vR))
else C(("guild call from %s: %s"):format(vR,(vQ and type(fy)=="table"and tostring(fy.reason or"refused"))or tostring(fy)))
end end)end local function as(Fu,vS,...)if c.busy then return end c.busy,c.busyText=true,Fu if d.hold and vS~=E.step then pcall(d.unpin)end
local Fv,vT=pcall(vS,...)c.busy,c.busyText=false,""if not Fv and vT~=je then C("ERR "..tostring(vT))end end local function Fw()
local aT,Fx,Fy=vg()c.reason,c.level=Fx,Fy if aT=="place"then as("waxing...",A.place)elseif aT=="crate"then as("opening crate...",em,true)
elseif aT=="cratesmart"then as("opening crate...",j.smart)elseif aT=="cratewin"then as("opening the crate window...",km)
elseif aT=="nocrate"then as("discarding crate...",em,false)elseif aT=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aT=="sell"then as("selling...",uH)elseif aT=="buy"then as("buying...",qk,false)elseif not aT and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aT and not c.matchSince and K.due()then as("sitting at the campfire...",K.sit)
elseif not aT and not c.matchSince and F.pullDue()and not ac()and not(ce()and aN(ce().name))then as("pulling the lever for a quest...",F.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(F.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
as("collecting money...",EA)elseif not aT and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not e.Help then
as("coming back...",E.goHome)elseif not c.busy then d.parkTick()end end function fn(ii,Fz)if ii==c.running then return end
c.running=ii if not Fz then e.AutoStart=ii end if ii then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bB()or c.plot
C("START")else c.reason="stopped"C("STOP")end end do local b1=gn(an.auto)if type(b1)=="string"then b1=b1:gsub("%s+$","")
if b1~=""then c.autoload=b1 local FA=pQ(b1)C(FA and("loaded config "..b1)or("config "..b1 .." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local FB={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local np={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local vU,vV,vW,vX=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if vU and vV and vW and vX then ae.x,ae.b,ae.m,ae.r=vU,vV,vW,vX end end)pcall(function()local vY=Enum.Font.RobotoMono if vY then ae.mono=vY end end)
local function J(FC,FD,FE)local FF,nq=pcall(Instance.new,FC)if not FF then c.uiErrs=c.uiErrs+1 return nil end
for FG,FH in pairs(FD)do if not pcall(function()nq[FG]=FH end)then c.uiErrs=c.uiErrs+1 end end nq.Parent=FE return nq
end local function ab(FI,FJ)J("UICorner",{CornerRadius=UDim.new(0,FJ or 8)},FI)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(ij,nr)if ij and a.shown[ij]~=nr then a.shown[ij]=nr ij.Text=nr end
end function a.stroke(FK,FL,FM)return J("UIStroke",{Color=FL or l.line,Thickness=1,Transparency=FM or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},FK)
end function a.grad(FN,FO,FP,FQ)local FR,vZ=pcall(function()return ColorSequence.new(FO,FP)end)if FR and vZ then return J("UIGradient",{Color=vZ,Rotation=FQ or 0},FN)end
end function a.pad(FS,v0,v1,FT,FV)J("UIPadding",{PaddingLeft=UDim.new(0,v0 or 0),PaddingTop=UDim.new(0,v1 or 0),
PaddingRight=UDim.new(0,FT or v0 or 0),PaddingBottom=UDim.new(0,FV or v1 or 0)},FS)end function a.list(FW,FX,FY)
return J("UIListLayout",{Padding=UDim.new(0,FX or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=FY and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},FW)
end function a.ink(ns)local FZ,F0=pcall(function()return 0.299*ns.R+0.587*ns.G+0.114*ns.B end)return(FZ and F0>0.55)and l.ink or l.text
end function a.nextIn(v2)local v3=(a.ord[v2]or 0)+1 a.ord[v2]=v3 return v3 end local nt=H:FindFirstChildOfClass("PlayerGui")or H:WaitForChild("PlayerGui")
local v4=nt:FindFirstChild("SABFarmGui")if v4 then v4:Destroy()end local nu=J("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},nt)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local ik=am.CurrentCamera.ViewportSize if ik.X>100 and ik.Y>100 then Q.w=math.clamp(math.floor(ik.X*0.48),320,400)
Q.h=math.clamp(math.floor(ik.Y*0.86),250,360)end end)a.root=J("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},nu)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local v5=UDim2 .new(1,0,1,0)
local function K2(v6,v7)return UDim2 .new(v6,0,0,0),UDim2 .new(v7,(v6+v7>0.99)and 0 or-4,1,0)end local function ai(F1,F2,fz,F3,F4,F5)
local nv=J("TextButton",{Text=F2,Position=F4,Size=F5,BackgroundColor3=fz,BorderSizePixel=0,Font=ae.b,TextSize=F3,TextColor3=a.ink(fz),AutoButtonColor=true},F1)
ab(nv,8)if fz==l.panel2 or fz==l.raise or fz==l.panel then a.stroke(nv,l.line,0.4)end return nv end local function il(F6,F7,F8,F9,F_)
local im=J("TextBox",{Text=F7,PlaceholderText=F8,Position=F9,Size=F_,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},F6)ab(im,8)a.stroke(im,l.line,0)a.pad(im,9,0,6,0)
return im end local io=am.CurrentCamera local function Ga()local Gb,ip=pcall(function()return io and io.ViewportSize end)
if Gb and ip and ip.X>50 and ip.Y>50 then return ip end end local function b2(fA)local nw=Ga()if not(nw and fA and fA.Parent)then return end
local Gc=pcall(function()local iq,v8=fA.AbsolutePosition,fA.AbsoluteSize local nx=70 local v9=math.clamp(iq.X,nx-v8 .X,nw.X-nx)
local v_=math.clamp(iq.Y,0,nw.Y-math.min(v8 .Y,nx))if math.abs(v9-iq.X)>0.5 or math.abs(v_-iq.Y)>0.5 then fA.Position=UDim2 .new(0,math.floor(v9),0,math.floor(v_))
end end)return Gc end local function ir(Gd)local Ge,ny=pcall(function()return Gd.AbsolutePosition end)if Ge and ny then return{math.floor(ny.X),math.floor(ny.Y)}end
end local dC={}c.dragMoved={}local function wa(fB,wb,nz)T(fB.InputBegan:Connect(function(dD)if dD.UserInputType~=Enum.UserInputType.MouseButton1 and dD.UserInputType~=Enum.UserInputType.Touch then return end
local nA={start=dD.Position,from=wb.Position,moved=0,target=wb,input=dD,onDrop=nz}dC[fB],c.dragMoved[fB]=nA,0
local nB nB=dD.Changed:Connect(function()if dD.UserInputState==Enum.UserInputState.End and dC[fB]==nA then dC[fB]=nil
if nB then nB:Disconnect()end if nz then nz(nA.moved)end end end)end))end T(oC.InputChanged:Connect(function(is)
if is.UserInputType~=Enum.UserInputType.MouseMovement and is.UserInputType~=Enum.UserInputType.Touch then return end
for Gf,ba in pairs(dC)do local nC=ba.target if nC and nC.Parent then local wc,wd=is.Position.X-ba.start.X,is.Position.Y-ba.start.Y
ba.moved=math.max(ba.moved,math.abs(wc)+math.abs(wd))c.dragMoved[Gf]=ba.moved nC.Position=UDim2 .new(ba.from.X.Scale,ba.from.X.Offset+wc,ba.from.Y.Scale,ba.from.Y.Offset+wd)
end end end))T(oC.InputEnded:Connect(function(it)if it.UserInputType~=Enum.UserInputType.MouseButton1 and it.UserInputType~=Enum.UserInputType.Touch then return end
for Gg,iu in pairs(dC)do if iu.input==it or it.UserInputType==Enum.UserInputType.MouseButton1 then dC[Gg]=nil
if iu.onDrop then iu.onDrop(iu.moved)end end end end))local function P(Gh,Gi,Gj,Gk,Gl,Gm,Gn)return J("TextLabel",{Text=Gi,Position=Gm or UDim2 .new(0,0,0,0),Size=Gn or v5,BackgroundTransparency=1,
Font=Gl and ae.b or ae.m,TextSize=Gj,TextColor3=Gk,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Gh)
end function a.row(we,Go)return J("Frame",{Size=UDim2 .new(1,0,0,Go),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(we)},we)end function a.card(wf,wg,wh)local dE=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(wf)},wf)ab(dE,11)a.stroke(dE,l.line,0.25)a.list(dE,5)a.pad(dE,8,8,8,9)
if wg then local nD=a.row(dE,14)J("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},nD)P(nD,wg:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if wh then local Gp=P(nD,wh,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Gp.TextXAlignment=Enum.TextXAlignment.Right end end return dE end function a.heading(Gq,Gr,nE)local nF=a.row(Gq,nE and 34 or 22)
P(nF,Gr,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if nE then P(nF,nE,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return nF end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(nG)local aL=a.sw[nG]if not aL then return end
local dF=tostring(nG.Text or""):match(":%s*(.-)%s*$")or""local b3=dF~=""and not a.OFF[dF]local nH=not aL.chips and(dF=="ON"or dF=="OFF")
aL.pill.Visible,aL.chip.Visible=nH,not nH if nH then aL.pill.BackgroundColor3=b3 and l.accent or l.panel2 aL.knob.Position=b3 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aL.knob.BackgroundColor3=b3 and l.white or l.dim else aL.chip.Text=dF~=""and dF or"-"aL.chip.BackgroundColor3=b3 and l.accent or l.panel2
aL.chip.TextColor3=b3 and l.ink or l.dim end nG.BackgroundColor3=b3 and l.lit or l.raise if aL.edge then aL.edge.Color=b3 and l.accent or l.line aL.edge.Transparency=b3 and 0.55 or 0.45 end
end function a.switch(wi,Gs,Gt,fC)local a2=J("TextButton",{Name="Switch",Text=Gs,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,fC and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(wi)},wi)
ab(a2,9)local aw={edge=a.stroke(a2,l.line,0.45)}aw.title=P(a2,Gt,11,l.text,true,UDim2 .new(0,10,0,fC and 4 or 0),UDim2 .new(1,-100,0,fC and 15 or 28))
aw.title.TextWrapped,aw.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fC then aw.sub=P(a2,fC,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
aw.sub.TextWrapped,aw.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end aw.pill=J("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a2)ab(aw.pill,9)aw.knob=J("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},aw.pill)ab(aw.knob,7)aw.chip=J("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},a2)
ab(aw.chip,9)a.pad(aw.chip,10,0,10,0)J("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},aw.chip)
aw.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a2]=aw T(a2:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a2)end))
a.skin(a2)return a2 end function a.chips(nI)if a.sw[nI]then a.sw[nI].chips=true a.skin(nI)end end function a.line(Gu,Gv)
local wj=a.row(Gu,15)local wk=J("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Gv or l.dim,
BorderSizePixel=0},wj)ab(wk,3)local nJ=P(wj,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))nJ.TextWrapped,nJ.TextTruncate=false,Enum.TextTruncate.AtEnd
return nJ,wk end function a.grow(wl,Gw,Gx)local iv=J("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=Gw or 10,TextColor3=Gx or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(wl)},wl)
T(iv:GetPropertyChangedSignal("Text"):Connect(function()iv.Visible=iv.Text~=""end))return iv end function a.note(Gy,Gz)
local wm=a.grow(Gy,9,l.dim)wm.Text=Gz return wm end function a.actions(GA,wn)local GB=a.row(GA,28)local wo,nK={},#wn
for fD,wp in ipairs(wn)do wo[fD]=ai(GB,wp[1],wp[2]or l.panel2,10,UDim2 .new((fD-1)/nK,fD>1 and 3 or 0,0,0),UDim2 .new(1/nK,(fD>1 and-3 or 0)+(fD<nK and-3 or 0),1,0))
end return table.unpack(wo)end local function M(cL,iw,GC,GD)a.put(cL,iw and GC or GD)if not a.sw[cL]and a.lit[cL]~=iw then
a.lit[cL]=iw cL.BackgroundColor3=iw and l.accent or l.panel2 cL.TextColor3=a.ink(cL.BackgroundColor3)end end a.title=J("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)J("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
J("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local nL=J("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(nL,8)a.grad(nL,l.accent,l.accent2,45)local wq=P(nL,"C",16,l.ink,true)wq.Font,wq.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local GE=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))GE.Font=ae.x P(a.title,"butter farm  "..b_,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
end a.pill=J("Frame",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-66,0.5,0),Size=UDim2 .new(0,78,0,22),
BackgroundColor3=l.raise,BorderSizePixel=0},a.title)ab(a.pill,11)a.pillEdge=a.stroke(a.pill,l.line,0.2)a.dot=J("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(0,9,0.5,-4),BackgroundColor3=l.dim,BorderSizePixel=0},a.pill)
ab(a.dot,4)a.runL=P(a.pill,"STOPPED",9,l.dim,true,UDim2 .new(0,22,0,0),UDim2 .new(1,-26,1,0))a.minB=ai(a.title,"-",l.raise,14,UDim2 .new(1,-60,0.5,-12),UDim2 .new(0,24,0,24))
a.xB=ai(a.title,"X",l.raise,11,UDim2 .new(1,-32,0.5,-12),UDim2 .new(0,24,0,24))a.xB.TextColor3=l.bad a.strip=J("Frame",{Position=UDim2 .new(0,Q.rail+8,0,Q.head+6),Size=UDim2 .new(1,-(Q.rail+16),0,Q.status),
BackgroundColor3=l.raise,BorderSizePixel=0},a.root)ab(a.strip,9)a.stroke(a.strip,l.line,0.3)a.bar=J("Frame",{Size=UDim2 .new(0,3,1,-12),Position=UDim2 .new(0,7,0,6),BackgroundColor3=l.warn,BorderSizePixel=0},a.strip)
ab(a.bar,2)a.reason=P(a.strip,"starting",10,l.text,false,UDim2 .new(0,16,0,1),UDim2 .new(1,-22,1,-2))a.reason.TextTruncate=Enum.TextTruncate.AtEnd
a.railBg=J("Frame",{Position=UDim2 .new(0,0,0,Q.head),Size=UDim2 .new(0,Q.rail,1,-Q.head),BackgroundColor3=l.panel,
BorderSizePixel=0},a.root)ab(a.railBg,14)J("Frame",{Size=UDim2 .new(1,0,0,14),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
J("Frame",{Size=UDim2 .new(0,14,1,0),Position=UDim2 .new(1,-14,0,0),BackgroundColor3=l.panel,BorderSizePixel=0},a.railBg)
a.tabs=J("Frame",{Position=UDim2 .new(0,0,0,Q.head),Size=UDim2 .new(0,Q.rail,1,-Q.head),BackgroundTransparency=1,
BorderSizePixel=0},a.root)a.railLine=J("Frame",{Size=UDim2 .new(0,1,1,-Q.head),Position=UDim2 .new(0,Q.rail-1,0,Q.head),BackgroundColor3=l.line,
BorderSizePixel=0},a.root)do local GF=a.list(a.tabs,3)pcall(function()GF.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function bw(GG,GH,GI)
local ix=J("TextButton",{Text=GG,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(ix,9)local wr=J("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},ix)ab(wr,2)a.tabsAll[#a.tabsAll+1]={b=ix,bar=wr,name=GH,sub=GI}return ix end
a.tabFarm=bw("🏠","Home","what the farm is doing")a.tabRun=bw("🌾","Farm","the buy - wax - collect loop")a.tabBut=bw("🧈","Butters","what gets bought and waxed")
a.tabCrt=bw("📦","Crates","which crates get opened")a.tabPet=bw("🐾","Pets","adopt, wish, fuse")a.tabTeam=bw("👥","Teams","the right pets at the right moment")
a.tabSrv=bw("🤝","Server","helping, campfire, ghost")a.tabAdm=bw("⚡","Admin","admin abuse and its boosts")a.tabSet=bw("⚙","Settings","configs, startup, performance")
local function bx()local nM=J("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(nM,8)a.pad(nM,8,2,10,12)return nM end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bx(),bx(),bx(),bx(),bx(),bx(),bx(),bx(),bx()a.farm.Visible=true
do local fE=a.farm local ws=a.row(fE,34)a.startB=ai(ws,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(ws,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local GJ=a.row(fE,44)local function fF(wt,GK,wu)local iy=J("Frame",{Position=UDim2 .new((wt-1)/wu,wt>1 and 2 or 0,0,0),Size=UDim2 .new(1/wu,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},GJ)ab(iy,9)a.stroke(iy,l.line,0.3)local iz=P(iy,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
iz.Font,iz.TextXAlignment,iz.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local GL=P(iy,GK,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
GL.TextXAlignment=Enum.TextXAlignment.Center return iz end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fF(1,"BOUGHT",5),fF(2,"WAXED",5),fF(3,"SOLD",5),fF(4,"MONEY",5),fF(5,"FREE",5)
local wv=a.card(fE,"Right now")a.info=P(a.row(wv,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(wv,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fG=a.card(fE,"Systems")
a.helpL=a.line(fG,l.info)a.campL=a.line(fG,l.accent2)a.questL=a.line(fG,l.good)a.arL=a.line(fG,l.accent)a.ixL=a.line(fG,np.Dotonbori)
local ww=a.card(fE,"Activity")a.log=J("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(ww)},ww)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function K3(GM,GN)return a.row(GN or a.farm,GM)end local al do local nN=a.run
a.heading(nN,"Farm","buy what rolls, wax it, collect the cash")local fH=a.card(nN,"Loop")a.colT=a.switch(fH,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(fH,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=il(al,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fH,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fH,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fH,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local nO=a.card(nN,"By hand")
a.buyB,a.plB=a.actions(nO,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(nO,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(nO,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iA=a.but a.heading(iA,"Butters","what gets bought and waxed")local wx=a.card(iA,"Strategy")a.ixT=a.switch(wx,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(wx,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iA)},iA)a.list(a.butList,5)end do local iB=a.crt a.heading(iB,"Crates","only ticked crates are opened")
local wy=a.card(iB,"Opening")a.crateT=a.switch(wy,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(wy,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iB)},iB)a.list(a.crtList,5)end do local fI=a.pet a.heading(fI,"Pets","adopt, wish, fuse Bigs and Huges")
local fJ=a.card(fI,"Automatic")a.pbT=a.switch(fJ,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fJ,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fJ,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fJ,10,l.dim)a.note(fJ,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local wz=a.card(fI,"The plan","best teams with every pet")a.planInfo=a.grow(wz,10,l.text)a.note(wz,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fI)},fI)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iC=a.srv a.heading(iC,"Server","other players, the campfire, staying hidden")
local nP=a.card(iC,"Helping")a.helpT=a.switch(nP,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(nP,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(nP,l.info)
local wA=a.card(iC,"Campfire")a.campT=a.switch(wA,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(wA,l.accent2)local nQ=a.card(iC,"Ghost")a.ghostT=a.switch(nQ,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(nQ,l.dim)a.note(nQ,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fK=a.adm a.heading(fK,"Admin abuse","the show, its boosts and the farm in it")local wB=a.card(fK,"When")
a.admBig=P(a.row(wB,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(wB,14),"",10,l.dim,false)local GO=a.card(fK,"Boosts now")
a.admBoost=a.grow(GO,11,l.text)local nR=a.card(fK,"What the farm does")a.shT=a.switch(nR,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(nR,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(nR,l.accent)
local wC=a.card(fK,"Show feed")a.admFeed=J("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(wC)},wC)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cM=a.set a.heading(cM,"Settings","kept on your phone, per config")
local iD=a.card(cM,"Config")al=a.row(iD,28)a.cfgName=il(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(iD,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iD,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iD,10,l.dim)local nS=a.card(cM,"Starting")a.startT=a.switch(nS,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(nS,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(nS,9,l.dim)local nT=a.card(cM,"If the game drops me")
a.rejT=a.switch(nT,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(nT,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(nT,9,l.dim)local by=a.card(cM,"Performance")a.pfCalm=a.switch(by,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(by,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(by,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(by,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(by,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(by,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(by,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=il(al,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(by,l.good)a.note(by,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local GP=a.card(cM,"Your game passes","read from the game")a.passInfo=a.grow(GP,10,l.text)local GQ=a.card(cM,"About")
a.note(GQ,"CHURN "..b_.." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for K4,GR in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(GR)end local wD=J("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},nt)
a.tgRoot=J("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},wD)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=J("TextButton",{Text="C",Size=v5,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=J("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=J("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fL=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fL][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fL][2]
a.tgGhost.BackgroundColor3=fL==2 and l.accent or(fL==1 and l.warn or l.panel)a.tgGhost.TextColor3=fL>0 and l.ink or l.dim
end end local bz={built=false,boxes={},at=0}function a.check(iE,nU)iE.Text=nU and"✓"or""iE.BackgroundColor3=nU and l.accent or l.bg
iE.TextColor3=l.ink local nV=iE.Parent if nV and nV:IsA("TextButton")then nV.BackgroundColor3=nU and l.lit or l.raise end
end local function wE(wF,wG)e.Targets[wF]=wG or nil local wH=bz.boxes[wF]if wH then a.check(wH,wG)end end local function nW()
for GS,GT in pairs(bz.boxes)do a.check(GT,e.Targets[GS]==true)end end function a.tickBox(GU)local nX=J("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},GU)ab(nX,6)
a.stroke(nX,l.line,0)return nX end local fM local function GV()local GW=a.card(a.butList,"Butter list")local nY=a.row(GW,26)
a.butInfo=P(nY,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local GX=ai(nY,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local GY=ai(nY,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))GX.MouseButton1Click:Connect(function()
for GZ in pairs(e.Targets)do e.Targets[GZ]=nil end nW()end)GY.MouseButton1Click:Connect(function()ad.at=0 jO()
fM(true)end)end fM=function(G0)if not jO()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bz.built and not G0 and bz.at==ad.at then return end for K5,iF in ipairs(a.butList:GetChildren())do
if iF:IsA("Frame")or iF:IsA("TextButton")or iF:IsA("TextLabel")then iF:Destroy()end end bz.boxes,a.butEmpty={},nil
GV()for K6,iG in ipairs(ad.rarOrder)do local nZ=np[iG]or l.text local cN=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cN,11)a.stroke(cN,nZ,0.7)a.list(cN,4)a.pad(cN,7,7,7,8)
local n0=a.row(cN,22)J("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=nZ,BorderSizePixel=0},n0)
local G1=P(n0,iG:upper(),11,nZ,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))G1 .Font=ae.x local G2=ai(n0,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local G3=iG G2 .MouseButton1Click:Connect(function()local wI=ad.members[G3]or{}local wJ=false for K7,G4 in ipairs(wI)do if not e.Targets[G4]then wJ=true break end end
for K8,G5 in ipairs(wI)do wE(G5,wJ)end end)for K9,n1 in ipairs(ad.members[iG]or{})do local iH=J("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cN)},cN)ab(iH,8)local wK=P(iH,ak(n1),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
wK.TextWrapped,wK.TextTruncate=false,Enum.TextTruncate.AtEnd local wL=a.tickBox(iH)bz.boxes[n1]=wL local wM=n1
local function wN()wE(wM,not e.Targets[wM])end iH.MouseButton1Click:Connect(wN)wL.MouseButton1Click:Connect(wN)
end end nW()bz.built,bz.at=true,ad.at end function L.paint()for G6,G7 in pairs(L.boxes)do a.check(G7,e.CrateTicks[G6]==true)end
if a.crtInfo then local n2,n3=0,0 for K_ in pairs(L.boxes)do n2=n2+1 end for La,G8 in pairs(e.CrateTicks)do if G8 then n3=n3+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(n2,n3))end if a.crateT then M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for Lb,iI in ipairs(a.crtList:GetChildren())do if iI:IsA("Frame")or iI:IsA("TextButton")or iI:IsA("TextLabel")then iI:Destroy()end
end L.boxes={}local n4=a.card(a.crtList,"All of them","worst first")local n5=a.row(n4,26)a.crtInfo=P(n5,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local G9=ai(n5,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local G_=ai(n5,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(G9 .MouseButton1Click:Connect(function()e.CrateTicks={}L.paint()end))T(G_.MouseButton1Click:Connect(function()L.build()end))
for Lc,bA in ipairs(L.list())do local wO=np[bA.rar or""]or l.text local dG=J("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(n4)},n4)ab(dG,8)J("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=wO,BorderSizePixel=0},dG)
local wP=P(dG,(bA.title or bA.name)..(bA.guess and"  (?)"or""),11,wO,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
wP.TextWrapped,wP.TextTruncate=false,Enum.TextTruncate.AtEnd local Ha=P(dG,bA.price and("$"..aD(bA.price))or(bA.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
Ha.TextXAlignment=Enum.TextXAlignment.Right local wQ=a.tickBox(dG)L.boxes[bA.k]=wQ local wR=bA.k local function wS()
e.CrateTicks[wR]=(not e.CrateTicks[wR])or nil L.paint()end T(dG.MouseButton1Click:Connect(wS))T(wQ.MouseButton1Click:Connect(wS))
end L.built=L.at L.paint()end local wT="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a3(cO)wT=cO for Hb,n6 in ipairs(a.tabKeys)do a[n6].Visible=(n6==cO)local iJ=a.tabsAll[Hb]if iJ then
local n7=n6==cO iJ.b.BackgroundTransparency,iJ.b.TextTransparency,iJ.bar.Visible=n7 and 0 or 1,n7 and 0 or 0.45,n7
end end if cO=="pet"and not o.built then pcall(o.build)end if cO=="team"and not A.built then pcall(A.build)end
if cO=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cO=="but"then fM(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(n8,wU,wV,wW)if wW then n8 .Text=wW end n8 .BackgroundColor3=wU and wV or l.bg n8 .TextColor3=wU and a.ink(wV)or l.dim
end function o.paintRow(wX)local cP=o.rows and o.rows[wX]if not cP then return end local cQ=e.Pets[wX]or{}local wY=tonumber(cQ.f)==-1
a.flag(cP.b,cQ.b,l.good)a.flag(cP.g,cQ.g,l.accent,cQ.g and"BIG"or"ANY")a.flag(cP.w,cQ.w,l.warn)a.flag(cP.f,not wY,l.good,wY and"KEEP"or"AUTO")
if cP.row then cP.row.BackgroundColor3=(cQ.b or cQ.w)and l.lit or l.raise end end function o.flag(n9,iK)local bc=e.Pets[n9]or{}
if iK=="f"then bc.f=tonumber(bc.f)~=-1 and-1 or nil elseif bc[iK]then bc[iK]=nil else bc[iK]=true end e.Pets[n9]=(bc.b or bc.g or bc.w or bc.f)and bc or nil
o.paintRow(n9)end function o.paintAll()for Hc in pairs(o.rows or{})do o.paintRow(Hc)end if a.pbT then M(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(Hd)local wZ=y.dreamT if not wZ then return"working the plan out..."end local He,Hf=y.needFor(""),y.needFor("Big")
local cR={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(He,Hf,y.slots())}for Ld,w0 in ipairs(y.dreamTeams or{})do cR[#cR+1]=w0 .team:upper()..": "..table.concat(w0 .names,", ")end
local iL,iM,iN=0,0,0 for w1,w2 in pairs(wZ)do local w3,Hg=y.have(w1,Hd)local Le,Hh=y.goal(w1)iL=iL+math.max(0,w2 .Huge-w3 .Huge)
iM=iM+math.max(0,w2 .Big-w3 .Big)iN=iN+math.max(0,Hh-Hg)end cR[#cR+1]=(iL+iM+iN==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(iL,iM,iN)if y.fuseMsg~=""then cR[#cR+1]=y.fuseMsg end
return table.concat(cR,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local n_=o.wishes()local dH=o.data()for iO,oa in pairs(o.rows)do local w4=y.status(iO,dH)oa.desc.Text=(n_[iO]and("wishing %dm | "):format(math.ceil(n_[iO]/60))or"")..(w4 and(w4 .." | ")or"")..oa.boostText
oa.desc.TextColor3=n_[iO]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dH))end local w5=tonumber(H:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dH and#(dH.pets or{})or 0,dH and tonumber(dH.maxOwned)or 60,
aD(o.money()),w5>0 and(" | free wishes "..w5)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local iP=o.info()for Lf,iQ in ipairs(a.petList:GetChildren())do if iQ:IsA("Frame")or iQ:IsA("TextLabel")or iQ:IsA("TextButton")then iQ:Destroy()end
end o.rows={}if not iP then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dI={}for Lg,w6 in ipairs(o.order())do local ob=iP.Pets[w6].rarity or"?"dI[ob]=dI[ob]or{}
table.insert(dI[ob],w6)end local dJ={}for Lh,w7 in ipairs(iP.Rarities or{})do if dI[w7]then dJ[#dJ+1]=w7 end end
for w8 in pairs(dI)do if not table.find(dJ,w8)then dJ[#dJ+1]=w8 end end for Li,oc in ipairs(dJ)do local iR=o.RC[oc]or l.text
local cS=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cS,11)a.stroke(cS,iR,0.7)a.list(cS,4)a.pad(cS,7,7,7,8)local w9=a.row(cS,18)J("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=iR,BorderSizePixel=0},w9)
local Hi=P(w9,oc:upper(),11,iR,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Hi.Font=ae.x for Lj,iS in ipairs(dI[oc])do
local fN=J("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cS)},cS)
ab(fN,8)local od=P(fN,o.nice(iS),11,iR,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))od.TextWrapped,od.TextTruncate=false,Enum.TextTruncate.AtEnd
local Hj,Hk=pcall(function()return iP.describe(iS)end)local w_=Hj and tostring(Hk)or""local oe=P(fN,w_,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oe.TextYAlignment,oe.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function iT(Hl,Hm,Hn)
local xa=ai(fN,Hl,l.bg,8,UDim2 .new(1,Hm,0,5),UDim2 .new(0,Hn,0,22))xa.AutoButtonColor=true return xa end local xb,xc,xd,xe=iT("BUY",-164,30),iT("ANY",-131,30),iT("WISH",-98,34),iT("AUTO",-61,56)
local iU=iS xb.MouseButton1Click:Connect(function()o.flag(iU,"b")end)xc.MouseButton1Click:Connect(function()o.flag(iU,"g")end)
xd.MouseButton1Click:Connect(function()o.flag(iU,"w")end)xe.MouseButton1Click:Connect(function()o.flag(iU,"f")end)
o.rows[iS]={b=xb,g=xc,w=xd,f=xe,name=od,desc=oe,boostText=w_,row=fN}end end o.built=true o.paintAll()end function d.paint()
M(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])M(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end T(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local Ho=table.find(d.CAPS,e.FpsCap or 0)or 1 local xf=d.CAPS[(Ho%#d.CAPS)+1]
if not d.cap(xf)and xf~=0 then C("this executor cannot cap fps")end d.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local of=tonumber(a.pfMem.Text)if of and of>=0 then e.MemLimit=math.floor(of)end d.paint()end))function A.names()
local og={"(none)"}for Lk,Hp in ipairs((A.teams()))do og[#og+1]=Hp.name end return og end function A.cycle(oh,Hq)
local iV=A.names()local Hr=e[oh]~=""and e[oh]or"(none)"local iW=table.find(iV,Hr)or 1 iW=((iW-1+Hq)%#iV)+1 e[oh]=iV[iW]=="(none)"and""or iV[iW]
A.paint()end function A.paint()if not A.built then return end M(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oi={}for Ll,Hs in ipairs((A.teams()))do oi[Hs.name]=true end
for Ht,xg in pairs(A.pick)do local dK=e[Ht]xg.Text=dK==""and"(none)"or(oi[dK]and dK or(dK.." (missing)"))xg.TextColor3=(dK~=""and not oi[dK])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local Hu,iX=o.srv(),{}for Lm,iY in ipairs(A.list or{})do iX[#iX+1]=("st %-2s %-22s %9s  helps %d"):format(iY.st.Name,ak(W(iY.name)):sub(1,22),A.clock(iY.ends-Hu),iY.helps)
end a.tmList.Text=#iX>0 and table.concat(iX,"\n")or"no waxes running"end function A.build()for Ln,iZ in ipairs(a.teamList:GetChildren())do
if iZ:IsA("Frame")or iZ:IsA("TextLabel")or iZ:IsA("TextButton")then iZ:Destroy()end end A.pick={}local i0=a.card(a.teamList,"Automatic")
a.tmT=a.switch(i0,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(i0,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(i0,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local Hv,Hw=pcall(y.rebuild,"you asked")if not Hv then C("BUILD ERR "..tostring(Hw))end end)
end)a.tmInfo=a.grow(i0,10,l.dim)local xh=a.card(a.teamList,"Which team when")local function i1(i2,Hx,Hy)local fO=a.row(xh,54)
P(fO,Hx,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local xi=P(fO,Hy,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
xi.TextWrapped,xi.TextTruncate=false,Enum.TextTruncate.AtEnd local Hz=ai(fO,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local xj=ai(fO,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local HA=ai(fO,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
Hz.MouseButton1Click:Connect(function()A.cycle(i2,-1)end)HA.MouseButton1Click:Connect(function()A.cycle(i2,1)end)
xj.MouseButton1Click:Connect(function()A.cycle(i2,1)end)A.pick[i2]=xj end i1("TeamNormal","Normal","the rest of the time: money + luck")
i1("TeamFull","Full","every station busy: money + wax speed")i1("TeamGlaze","Glaze","worn just before a wax finishes")
local i3=a.row(xh,26)P(i3,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=il(i3,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(i3,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local HB=ai(i3,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
HB.MouseButton1Click:Connect(function()local i4=tonumber(a.tmLead.Text)if i4 and i4>=5 and i4<=600 then e.GlazeLead=math.floor(i4)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)i1("TeamWax","Wax","while a butter is placed: head starts")local xk=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=J("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(xk)},xk)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local HC=a.card(a.teamList,"How it works")a.note(HC,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function HD()a.secB.Text=tostring(e.Every)M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(d.unpin)end end)end
M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fn(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b2(a.root)b2(a.tgRoot)c.lastCollect=z()
nW()L.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function HE(xl)task.spawn(function()xl.TextColor3=l.bad
task.wait(0.8)if c.alive then xl.TextColor3=l.text end end)end local function xm()local xn=a.secB.Text:match("^%s*(%d+)%s*$")
local fP=xn and tonumber(xn)if not fP or fP<1 then a.secB.Text=tostring(e.Every)HE(a.secB)C("interval must be a whole number >= 1")
return end if fP==e.Every then return end e.Every,c.lastCollect=fP,z()C("collect every "..fP.."s")end local function N(HF,HG)T(HF.MouseButton1Click:Connect(HG))end
N(a.secSet,xm)T(a.secB.FocusLost:Connect(xm))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",uH)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help E.nextAt,E.msg=0,e.Help and"looking for waxes to help"or"off"M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests F.at=0 M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()M(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
M(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(HH)task.spawn(function()pcall(q.tick)if HH and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local HI=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(HI)end)
N(a.bestT,function()local HJ=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(HJ)end)N(a.bcT,function()
local HK=q.on()e.BestCrate=not e.BestCrate q.changed(HK)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b4=o.srv()local b5 pcall(function()q.aac=q.aac or require(af:FindFirstChild("AdminAbuseClient"))
b5=q.aac:GetState()end)local dL,b6="nothing scheduled","the game has not announced one"if type(b5)=="table"then
local fQ,a4,b7=tostring(b5 .Phase or""),tonumber(b5 .StartsAt),tonumber(b5 .EndsAt)if a4 and a4<1e9 then a4=nil end
if b7 and b7<1e9 then b7=nil end if fQ=="Countdown"and a4 then dL,b6="starts in "..A.clock(a4-b4),os.date("%a %H:%M",math.floor(a4)).." your time"
elseif fQ=="Live"and b7 then dL,b6="LIVE  -  "..A.clock(b7-b4).." left","the farm is grabbing, waxing and glazing through it"
elseif fQ~=""and fQ~="Idle"and b7 and b7>b4 then dL,b6=fQ:lower().."  -  "..A.clock(b7-b4).." left","after the show"
elseif a4 and a4>b4 then dL,b6="next: "..os.date("%a %H:%M",math.floor(a4)),"your time"elseif a4 then dL,b6="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a4)).." your time"
end if type(b5 .Kind)=="string"and b5 .Kind~=""then b6=b6 .."  |  "..b5 .Kind end end a.put(a.admBig,dL)a.put(a.admSub,b6)
local dM,oj={},af:FindFirstChild("AdminShow")if oj then local HL,HM=pcall(function()return oj:GetAttributes()end)
for xo,dN in pairs(HL and HM or{})do local i5=type(xo)=="string"and xo:match("^(.-)Mult$")local ol=i5 and tonumber(oj:GetAttribute(i5 .."Until"))
if i5 and type(dN)=="number"and dN~=1 and dN~=0 and ol and ol>b4 then dM[#dM+1]=("%s  x%s   %s left"):format(i5:gsub("(%l)(%u)","%1 %2"),(dN%1==0)and tostring(dN)or("%.2f"):format(dN),
A.clock(ol-b4))end end end table.sort(dM)a.put(a.admBoost,#dM>0 and table.concat(dM,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dM>0 and l.accent or l.dim local i6=0 for Lo in pairs(O.drops)do i6=i6+1 end local xp=q.snapAt and(q.snapAt-b4)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,i6>0 and(", "..i6 .." falling")or"",
xp and("in "..math.max(0,math.floor(xp)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",em,true)end)N(a.padB,function()c.plot=bB()or c.plot local xq,om=ap(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(xq and om and om:IsA("BasePart"))then C("SET PAD: need character and plot")return end c.manualPad=om.CFrame:ToObjectSpace(xq.HumanoidRootPart.CFrame)
Eq(c.manualPad)C("collect pad saved at your position")end)N(a.startB,function()fn(not c.running)end)N(a.buyB,function()
c.plot=bB()or c.plot task.spawn(as,"buying (manual)...",qk,true)end)N(a.plB,function()c.plot=bB()or c.plot task.spawn(as,"waxing (manual)...",qp)
end)N(a.tabFarm,function()a3("farm")end)N(a.tabRun,function()a3("run")end)N(a.tabSrv,function()a3("srv")end)N(a.tabAdm,function()a3("adm")end)
N(a.tabBut,function()a3("but")end)N(a.tabSet,function()a3("set")end)N(a.tabCrt,function()a3("crt")end)N(a.tabPet,function()a3("pet")end)
N(a.tabTeam,function()a3("team")end)local function HN(oo)c.hidden=oo a.root.Visible=not oo a.tgBtn.TextColor3=oo and l.text or l.ink
end wa(a.tgBtn,a.tgRoot,function()b2(a.tgRoot)c.togPos=ir(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then HN(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aM,ay={},0 local function b8()aM=pH()if#aM==0 then a.cfgPick.Text="(none saved)"
ay=0 return end if ay<1 or ay>#aM then ay=1 end a.cfgPick.Text=aM[ay]..("  (%d/%d)"):format(ay,#aM)end local function xr()
local xs=c.autoload~=nil a.cfgAuto.Text=xs and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=xs and l.accent or l.panel2
end local function op()local xt=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if xt~=""then return xt end return(ay>0 and aM[ay])or""
end N(a.cfgSave,function()c.winPos=ir(a.root)or c.winPos c.togPos=ir(a.tgRoot)or c.togPos local xu,xv=gu(op())
a.cfgMsg.Text=xu and("saved as "..xv)or("could not save: "..xv)a.cfgMsg.TextColor3=xu and l.good or l.bad b8()
C(a.cfgMsg.Text)end)local function HO(oq)local ot,xw=pQ(oq)a.cfgMsg.Text=ot and("loaded "..xw)or("could not load: "..xw)
a.cfgMsg.TextColor3=ot and l.good or l.bad if ot then a.cfgName.Text=oq HD()task.spawn(D.apply,"config "..oq)
end C(a.cfgMsg.Text)end N(a.cfgLoad,function()HO(op())end)N(a.cfgPick,function()b8()if ay>0 then a.cfgName.Text=aM[ay]end
end)N(a.cfgPrev,function()if#aM==0 then b8()return end ay=(ay-2)%#aM+1 b8()a.cfgName.Text=aM[ay]end)N(a.cfgNext,function()
if#aM==0 then b8()return end ay=ay%#aM+1 b8()a.cfgName.Text=aM[ay]end)N(a.cfgAuto,function()if c.autoload then
pS(nil)a.cfgMsg.Text="it will not load a config on launch"else local fR=op()local xx=false for Lp,HP in ipairs(pH())do if HP==fR then xx=true end end
local HQ=xx or gu(fR)if HQ and fR~=""then pS(fR)b8()a.cfgMsg.Text=fR.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim xr()end)N(a.autoB,function()
local xy,xz=zt()a.autoMsg.Text=xy and("installed. "..xz)or("failed: "..xz)a.autoMsg.TextColor3=xy and l.good or l.bad
C(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()d6("you asked")end)
local bd=false N(a.minB,function()bd=not bd a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bd,not bd,not bd
if bd then for Lq,HR in ipairs(a.tabKeys)do a[HR].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a3(wT)
end a.root.Size=UDim2 .new(0,Q.w,0,bd and(Q.head+Q.status+12)or Q.h)a.minB.Text=bd and"+"or"-"end)local function i7()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(f4)for Lr,HT in ipairs(jf)do pcall(function()HT:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()nu:Destroy()end)
pcall(function()wD:Destroy()end)if cU.SAB_KILL==i7 then cU.SAB_KILL=nil end end cU.SAB_KILL=i7 N(a.killB,i7)N(a.xB,i7)
wa(a.title,a.root,function()b2(a.root)c.winPos=ir(a.root)or c.winPos end)local function xA()local fS,cT=c.reason,c.level
if c.busy then fS,cT=c.busyText,"ok"elseif not c.running then local Ls,xC,HU=vg()if c.capHit then fS,cT=xC,"bad"else fS,cT="[stopped] "..xC,(HU=="bad")and"bad"or"idle"end
c.reason,c.level=fS,cT end local dO=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dO then
a.lit.dot=dO a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dO,dO,dO,dO a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fS)if a.lit.bar~=cT then a.lit.bar=cT a.bar.BackgroundColor3=FB[cT]or l.dim end
if bd then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local b9=y4()if a.farm.Visible then local HV,HW=f1()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,HV.."/"..HW)local xD=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local xE=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aD(be()),c.rolls,c.gifts,c.crates,xE and ak(W(xE))or"nothing",j.on and("   ["..j.title.." window open]")or"",
xD and("in "..xD.."s")or"off"))a.put(a.tgt,(#b9==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#b9<=3)and table.concat(b9,", ")or(#b9 .." butters ticked"))))
if a.lit.tgt~=(#b9==0)then a.lit.tgt=(#b9==0)a.tgt.TextColor3=(#b9==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fV,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,e.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#b9))
end if a.but.Visible and bz.at~=ad.at then fM(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and E.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and K.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local xF=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",xF~=""and xF or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cU.SAB={S=c,CFG=e,EV=V,U=a,sg=nu,CAT=ad,LEARN=aj,buildList=fM,
logAll=dP,evAll=dQ,AR=D,CR=L,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=E,CF=K,QX=F,IX=q,SH=O}C(b_.." loaded")if c.uiErrs>0 then C("UI: "..c.uiErrs.." properties skipped")end
a3("farm")b2(a.root)b2(a.tgRoot)if io then pcall(function()T(io:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)b2(a.root)b2(a.tgRoot)end))end)end b8()xr()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(xA)task.spawn(function()local xG=zr()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(xG and("\n(backup: "..xG..")")or"")
local xH=gn(an.exec)if xH and not xH:find("SAB autoloader v2",1,true)then d3(an.exec,an.stub)C("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(gn(an.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(zz)end)task.spawn(function()while c.alive do local HY,HZ=pcall(xA)if not HY then C("UI ERR "..tostring(HZ))end
task.wait((c.hidden or bd)and 1.5 or 0.4)end end)task.spawn(function()local H0,H1=pcall(zH)if not H0 then C("HOOK ERR "..tostring(H1))end
end)task.spawn(function()pcall(yq)if j.loadSeq and not j.learned then local i8={}for xI=1,20 do if j.loadSeq[xI]then i8[#i8+1]=j.loadSeq[xI]end end
if#i8>0 then j.learned={seq=i8,mode=j.loadMode}C("remembered how to open crates directly")end end if jO()then C(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local H2,xJ=pcall(Es)if H2 and xJ and c.alive and not c.manualPad then c.manualPad=xJ end end)task.spawn(function()
while c.alive do local ou,ov=pcall(o.buyTick)if not ou then C("PET ERR "..tostring(ov))task.wait(5)end ou,ov=pcall(o.wishTick)
if not ou then C("WISH ERR "..tostring(ov))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local i9,xK=0,z()
T(game:GetService("RunService").Heartbeat:Connect(function()i9=i9+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
T(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local xL=z()d.fps,i9,xK=i9/math.max(xL-xK,0.001),0,xL local H3,H4=pcall(d.tick)if not H3 then C("PERF ERR "..tostring(H4))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local H5,H6=pcall(y.tick)if not H5 then C("FUSE ERR "..tostring(H6))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local H7,H8=pcall(A.tick)if not H7 then C("TEAM ERR "..tostring(H8))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local i_=af:WaitForChild("Remotes",30)local xM=i_ and i_:WaitForChild("ClanEvent",30)
if xM and c.alive then T(xM.OnClientEvent:Connect(function(H9,H_)if H9=="call"then pcall(E.onCall,H_)end end))
end local xN=i_ and i_:FindFirstChild("RollConfirmAsk")if xN and c.alive then T(xN.OnClientEvent:Connect(function(Ia)F.asked=Ia or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)end end end)task.spawn(function()
local ow=af:WaitForChild("Remotes",30)if not(ow and c.alive)then return end local function ja(Ib,Ic)local ox=ow:FindFirstChild(Ib)
if ox and ox:IsA("RemoteEvent")then T(ox.OnClientEvent:Connect(function(...)pcall(Ic,...)end))end end ja("NewSquishyDiscovered",function(oy,xO)
if type(oy)~="string"then return end q.disc=q.disc or{}q.disc[W(oy)]=true C(("INDEX: %s%s is in your Index now"):format(ak(W(oy)),xO and(" ("..tostring(xO)..")")or""))
end)ja("IndexRefresh",q.loadDisc)ja("IndexRowComplete",function(Ie)C("INDEX: the whole "..tostring(Ie).." row is complete")end)
ja("AdminShow",q.admin)local xP=ow:FindFirstChild("AdminShowSync")if xP then local If,xQ=pcall(function()return xP:InvokeServer()end)
if If and type(xQ)=="table"then for Lt,Ig in pairs(xQ)do pcall(O.add,Ig)end end end while c.alive do local Ih,Ii=pcall(q.tick)
if not Ih then q.msg="index error: "..tostring(Ii)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Ij,Ik=pcall(F.tick)if not Ij then C("QUEST ERR "..tostring(Ik))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(f4)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Im=(type(newcclosure)=="function")and newcclosure or function(Il)return Il end local oz
local xR=(type(setnamecallmethod)=="function")and setnamecallmethod or nil oz=hookmetamethod(game,"__namecall",Im(function(xS,...)
local fT=getnamecallmethod()if c.alive and(fT=="InvokeServer"or fT=="FireServer")then local xT,xU=pcall(function()return xS.Name end)
if xT and xU=="CrateAction"and not j.replaying then pcall(j.saw,fT,...)elseif xT and xU=="AutoRollAction"and not D.replaying then pcall(D.saw,fT,...)end
if xR then xR(fT)end end return oz(xS,...)end))j.oldNC=oz end)end if jd then T(H.Idled:Connect(function()pcall(function()jd:CaptureController()jd:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Lu=1,90 do if not c.alive then return end if H:GetAttribute("AutoRollOn")~=nil and ap()and(c.plot or bB())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local jb=ce()
if jb and q.on()and not aN(jb.name)then jb=nil end if c.alive and e.AutoRoll and c.running and not D.isOn()and not jb and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Lv=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bB()if ap()and c.plot and q.any()then fn(true,true)C("started by itself")
return end task.wait(1)end if c.alive and not c.running then C("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bB()c.lastCollect=z()while c.alive do if c.running then local In,xV=pcall(Fw)if not In and xV~=je then C("LOOP ERR "..tostring(xV))end
end task.wait(0.1)end end)jc("ready - the window is at the top left")end local Ip,oA=xpcall(xZ,function(Io)return tostring(Io).."\n"..debug.traceback()end)
if not Ip then pcall(function()warn("SAB "..b_.." ERROR: "..tostring(oA))end)jc("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b_.." ERROR: "..tostring(oA))end)pcall(function()local xW=(type(getgenv)=="function"and getgenv())or _G
if type(xW.SAB_KILL)=="function"then xW.SAB_KILL()end for Lw,Iq in ipairs({"SABFarmGui","SABToggle"})do local xX=H.PlayerGui:FindFirstChild(Iq)
if xX then xX:Destroy()end end end)pcall(function()local fU=Instance.new("ScreenGui")fU.Name="SABError"fU.ResetOnSpawn=false
fU.DisplayOrder=1000 local a5=Instance.new("TextBox")a5 .Size=UDim2 .new(0,340,0,170)a5 .Position=UDim2 .new(0,10,0,50)
a5 .BackgroundColor3=Color3 .fromRGB(90,20,20)a5 .TextColor3=Color3 .new(1,1,1)a5 .TextSize=11 a5 .TextWrapped=true
a5 .ClearTextOnFocus=false a5 .TextXAlignment=Enum.TextXAlignment.Left a5 .TextYAlignment=Enum.TextYAlignment.Top
a5 .Text="SAB "..b_.." failed to start. Send this text:\n"..tostring(oA)a5 .Parent=fU fU.Parent=H:WaitForChild("PlayerGui")
end)end
