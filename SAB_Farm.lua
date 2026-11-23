local b9="v28"local oB=game:GetService("Players")local H=oB.LocalPlayer or oB.PlayerAdded:Wait()local function ja(xX)
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="CHURN "..b9,Text=xX,Duration=6})
end)end ja("script started")local function xY()local af=game:GetService("ReplicatedStorage")local am=game:GetService("Workspace")
local oC=game:GetService("UserInputService")local cU=(type(getgenv)=="function"and getgenv())or _G if type(cU.SAB_KILL)=="function"then pcall(cU.SAB_KILL)end
local z=(type(tick)=="function")and tick or os.clock local jb=(function()local xZ,x0=pcall(function()return game:GetService("VirtualUser")end)return xZ and x0 or nil end)()
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
local o,A,d,y,E,K,F={},{},{},{},{},{},{}local q,O={},{}local jc={}local jd,fU,dP,dQ={},{},{},{}local function T(oD)jd[#jd+1]=oD return oD end
local function ag(x1)task.wait(x1)if not c.alive then error(jc,0)end end local function C(fV)fV=os.date("%H:%M:%S").." "..tostring(fV)
table.insert(fU,1,fV)if#fU>6 then table.remove(fU)end c.logN=(c.logN or 0)+1 dP[#dP+1]=fV if#dP>80 then table.remove(dP,1)end
end local function fW(oE)if type(oE)~="string"then return""end return(oE:lower():gsub("[^%w]",""))end local function W(x2)
local oF=fW(x2)local je=oF:gsub("butter$","")if je==""then je=oF end return je end local function aN(oG)if type(oG)~="string"then return false end
local jf=W(oG)if jf==""then return false end if q.want then return q.want(jf)end return e.Targets[jf]==true end
local function x3(dR)dR=dR:lower()return dR:find("squishy",1,true)~=nil or dR:match("butter$")~=nil or dR:match("butter[^%a]")~=nil
end local jg={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function aD(dS)if type(dS)~="number"then return"?"end
local fX=1 while math.abs(dS)>=1000 and fX<#jg do dS=dS/1000 fX=fX+1 end local x4=string.format("%.2f",dS):gsub("%.?0+$","")
return x4 ..jg[fX]end local function x5(oH)if type(oH)~="string"then return nil end local x6,dT=oH:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local jh=tonumber(x6)if not jh then return nil end if dT==""then return jh end local x7={qd="qa",qn="qi"}dT=x7[dT:lower()]or dT
for x8,x9 in ipairs(jg)do if x9:lower()==dT:lower()then return jh*1000^(x8-1)end end return nil end local function be()
local oI=H:GetAttribute("BoardValueMoney")if type(oI)=="number"then return oI end local oJ=H:FindFirstChild("leaderstats")
if oJ then for Io,x_ in ipairs({"Cash","Money","Coins"})do local ji=oJ:FindFirstChild(x_)if ji and type(ji.Value)=="number"then return ji.Value end
end end end local function fY(ya)local jj=ya:GetFullName()if c.plot then local jk=c.plot:GetFullName()if jj:sub(1,#jk)==jk then return jj:sub(#jk+2)end
end return jj end local function ap()local fZ=H.Character if fZ and fZ:FindFirstChild("HumanoidRootPart")then
local oK=fZ:FindFirstChildOfClass("Humanoid")if oK and oK.Health>0 then return fZ end end end local function bB()
local jl=am:FindFirstChild("Plots")if not jl then return nil end local function oL(yb)local oM=yb:FindFirstChild("Plate")
return oM~=nil and oM:FindFirstChild("EditStackAttachment",true)~=nil end local oN=H:GetAttribute("PlotNumber")
if oN~=nil then local jm=jl:FindFirstChild(tostring(oN))if jm and oL(jm)then return jm end end for Ip,oO in ipairs(jl:GetChildren())do
if oL(oO)then return oO end end end local function dU(oP)local bC=oP and oP.Parent for Iq=1,6 do if not bC then return nil end
if bC:IsA("BasePart")then return bC end if bC:IsA("Model")then return bC.PrimaryPart or bC:FindFirstChildWhichIsA("BasePart",true)end
bC=bC.Parent end end local function oQ(oR)local jn=oR.Parent if jn and jn:IsA("Attachment")then return jn.WorldPosition end
local oS=dU(oR)return oS and oS.Position end local function oT()local cV=c.plot and c.plot:FindFirstChild("Plate")
if not cV then return nil end if cV:IsA("BasePart")then return cV.Position end if cV:IsA("Model")then return cV:GetPivot().Position end
local oU=cV:FindFirstChildWhichIsA("BasePart",true)return oU and oU.Position end local function oV()local jo={}
local oW=c.plot and c.plot:FindFirstChild("WaxStations")if oW then for Ir,yc in ipairs(oW:GetChildren())do local oX=yc:FindFirstChild("SquishyPlaceHolder")
local jp=oX and oX:FindFirstChild("PlacePrompt")if jp and jp:IsA("ProximityPrompt")then jo[#jo+1]=jp end end end
return jo end local function f0()local oY,jq=oV(),0 for Is,yd in ipairs(oY)do if yd.Enabled then jq=jq+1 end end
local jr=#oY local js=H:GetAttribute("WaxStations")if type(js)=="number"and js>jr then jr=js end return jq,jr
end local function ye()local oZ=ap()local o0=oZ and oZ.HumanoidRootPart.Position local jt,o1 for It,ju in ipairs(oV())do
if ju.Enabled then local o2=oQ(ju)local o3=(o2 and o0)and(o2-o0).Magnitude or 1e9 if not jt or o3<o1 then jt,o1=ju,o3 end
end end return jt end local function o4()local f1=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not f1 then return nil end local o5=f1:FindFirstChild("BuyPromptAttachment")local f2=(o5 and o5:FindFirstChild("BuyPrompt"))or f1:FindFirstChild("BuyPrompt",true)
if f2 and f2:IsA("ProximityPrompt")and f2:IsDescendantOf(f1)then return f2 end end local o6={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local yf={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local aj={order={},price={},dirty=false}local L={seen={},at=0,boxes={},built=0}local ad={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local jv="SAB_order.txt"local function f3()if not aj.dirty or type(writefile)~="function"then return end local aE={}
for yg,yh in pairs(aj.price)do aE[#aE+1]="P|"..yg.."|"..string.format("%.0f",yh)end for yi,yj in pairs(aj.order)do aE[#aE+1]="O|"..yi.."|"..table.concat(yj,",")end
if j.learned and j.enc then aE[#aE+1]="M|mode|"..tostring(j.learned.mode or"")for yk,f4 in ipairs(j.learned.seq)do
local o7={}for o8=1,f4 .n do o7[o8]=j.enc(f4 .args[o8])end aE[#aE+1]=("A|%d|%s|%d|%s"):format(yk,f4 .m,f4 .n,table.concat(o7,";"))
end end local function jw(yl,ym,f5)local o9={}for o_=1,f5 .n do o9[o_]=j.enc(f5 .args[o_])end aE[#aE+1]=("R|%d|%s|%s|%d|%s"):format(ym,yl,f5 .m,f5 .n,table.concat(o9,";"))
end if j.enc then for yn,yo in ipairs(D.rec.rules)do jw("rules",yn,yo)end if D.rec.on then jw("on",0,D.rec.on)end
if D.rec.off then jw("off",0,D.rec.off)end end for Iu,dV in pairs(L.seen)do aE[#aE+1]=("K|%s|%s|%s|%s"):format(dV.name,dV.title or"",dV.rar or"",dV.price and string.format("%.0f",dV.price)or"")
end if pcall(writefile,jv,table.concat(aE,"\n"))then aj.dirty=false end end local function yp()if type(isfile)~="function"or type(readfile)~="function"then return end
local yq,yr=pcall(isfile,jv)if not(yq and yr)then return end local ys,pa=pcall(readfile,jv)if not(ys and type(pa)=="string")then return end
for yt in pa:gmatch("[^\n]+")do local cW,cX,bf=yt:match("^(%a)|([^|]+)|(.*)$")if cW=="P"then aj.price[cX]=tonumber(bf)
elseif cW=="M"then j.loadMode=(bf~=""and bf~="nil")and bf or nil elseif cW=="A"and j.dec then local pb=tonumber(cX)
local pc,f6,yu=bf:match("^([^|]+)|(%d+)|(.*)$")if pb and pc then f6=tonumber(f6)local pd,f7={},0 for yv in(yu..";"):gmatch("([^;]*);")do
f7=f7+1 if f7<=f6 then pd[f7]=j.dec(yv)end end j.loadSeq=j.loadSeq or{}j.loadSeq[pb]={m=pc,n=f6,args=pd}end elseif cW=="R"and j.dec then
local pe=tonumber(cX)local f8,yw,f9,yx=bf:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")if pe and f8 then f9=tonumber(f9)
local pf,f_={},0 for yy in(yx..";"):gmatch("([^;]*);")do f_=f_+1 if f_<=f9 then pf[f_]=j.dec(yy)end end local jx={m=yw,n=f9,args=pf}
if f8=="rules"then D.rec.rules[pe]=jx elseif f8=="on"then D.rec.on=jx elseif f8=="off"then D.rec.off=jx end end
elseif cW=="K"then local pg,ph,yz=bf:match("^([^|]*)|([^|]*)|(.*)$")L.seen[L.key(cX)]={name=cX,title=pg~=""and pg or nil,
rar=ph~=""and ph or nil,price=tonumber(yz)}elseif cW=="O"and bf~=""then local ga={}for yA in bf:gmatch("[^,]+")do ga[#ga+1]=yA end
if#ga>0 then aj.order[cX]=ga end end end end local function yB(gb)if type(gb)~="table"then return end local b_,pj=gb.rarity,gb.contents
if type(b_)~="string"or b_==""or type(pj)~="table"then return end local dW={}for Iv,gc in ipairs(pj)do if type(gc)=="table"and type(gc.butter)=="string"then
dW[#dW+1]={n=gc.butter,ch=tonumber(gc.chance)or 0}end end if#dW==0 then return end table.sort(dW,function(yC,yD)return yC.ch>yD.ch end)
local dX,dY={},false for yE,yF in ipairs(dW)do dX[yE]=yF.n end local jy=aj.order[b_]if not jy or#jy~=#dX then dY=true end
if not dY then for pk=1,#dX do if jy[pk]~=dX[pk]then dY=true break end end end aj.order[b_]=dX local jz=tonumber(gb.price)
if jz and aj.price[b_]~=jz then aj.price[b_]=jz dY=true end if dY then aj.dirty=true ad.at=0 C("learned the "..b_.." order from its crate")
end end local function cY(yG,yH)local yI=yG:FindFirstChild(yH,true)local yJ,jA=pcall(function()return yI.Text end)
return(yJ and type(jA)=="string"and jA~="")and jA or nil end local function ak(pl)return ad.pretty[pl]or pl end
L.base={{"SnackCrate","Snack Crate","Common"},{"BerryCrate","Berry Crate","Rare"},{"BakeryCrate","Bakery Crate","Epic"},{"GourmetCrate","Gourmet Crate","Legendary"},
{"RoyalCrate","Royal Crate","Mythic"},{"CelestialCrate","Celestial Crate","Celestial"},{"DivineCrate","Divine Crate","Divine"},{"DreamCrate","Dream Crate","Dream"},
{"SugarRushCrate","Sugar Rush Crate","Sugar Rush"},{"PicnicCrate","Picnic Crate","Picnic"}}function L.key(yK)return fW(yK or"")end
function L.learn(bh)if type(bh)~="table"or type(bh.name)~="string"then return end local jB=L.key(bh.name)local bi=L.seen[jB]or{}
local yL=(L.seen[jB]==nil)or(tonumber(bh.price)and bi.price~=tonumber(bh.price))bi.name,bi.title=bh.name,bh.title or bi.title
bi.rar,bi.price=bh.rarity or bi.rar,tonumber(bh.price)or bi.price L.seen[jB]=bi if yL then L.at,aj.dirty=z(),true end
end function L.wanted(pm)if pm==nil then return false end local jC=L.key(pm)return e.CrateTicks[jC]==true or(e.BestCrate and q.bestCrate~=nil and(jC==q.bestCrate or jC==q.bestCrateTitle))
end function L.list()local cZ={}for yM,gd in ipairs(L.base)do cZ[L.key(gd[1])]={name=gd[1],title=gd[2],rar=gd[3],i=yM}end
for Iw,dZ in ipairs(ad.rarOrder)do local pn=false for Ix,yN in pairs(cZ)do if yN.rar==dZ then pn=true break end end
if not pn and dZ~="?"then local po=dZ:gsub("[^%w]","").."Crate"cZ[L.key(po)]={name=po,title=dZ.." Crate",rar=dZ,i=50,guess=true}
end end for pp,ge in pairs(L.seen)do local a6=cZ[pp]or{i=100}a6 .name,a6 .title,a6 .rar=ge.name or a6 .name,ge.title or a6 .title,ge.rar or a6 .rar
a6 .price,a6 .guess=ge.price or a6 .price,nil cZ[pp]=a6 end local d0,gf={},{}for yO,yP in ipairs(o6)do d0[yP]=yO end
for yQ,pq in ipairs(ad.rarOrder)do d0[pq]=d0[pq]or(20+yQ)end for yR,d1 in pairs(cZ)do d1 .k=yR d1 .price=d1 .price or aj.price[d1 .rar or""]
gf[#gf+1]=d1 end table.sort(gf,function(ca,cb)if ca.price and cb.price and ca.price~=cb.price then return ca.price<cb.price end
local ps,pt=d0[ca.rar or""]or 99,d0[cb.rar or""]or 99 if ps~=pt then return ps<pt end if(ca.i or 100)~=(cb.i or 100)then return(ca.i or 100)<(cb.i or 100)end
return ca.k<cb.k end)return gf end local function yS()local pu=af:FindFirstChild("Assets")local pv=pu and pu:FindFirstChild("Squishies")
if not pv then return false end local jD,pw,c0={},{},{}local gg=0 for Iy,gh in ipairs(pv:GetChildren())do local d2=W(gh.Name)
if d2~=""and not jD[d2]then local gi=cY(gh,"RarityText")or"?"jD[d2]=gi pw[d2]=cY(gh,"NameText")or gh.Name c0[gi]=c0[gi]or{}
table.insert(c0[gi],d2)gg=gg+1 end end if gg==0 then return false end for px,yT in pairs(c0)do local py=aj.order[px]or yf[px]
local jE={}if py then for yU,yV in ipairs(py)do jE[W(yV)]=yU end end table.sort(yT,function(pz,pA)local jF,jG=jE[pz],jE[pA]
if jF and jG then return jF<jG end if jF then return true end if jG then return false end return ak(pz)<ak(pA)
end)end local jH={}for yW,yX in ipairs(o6)do jH[yX]=yW end local gj,cc={},{}for yY in pairs(c0)do gj[#gj+1]=yY end
pcall(function()for yZ,y0 in ipairs(require(af.Modules.SquishyRNG).Keys)do cc[y0]=yZ end end)table.sort(gj,function(c1,c2)
if cc[c1]and cc[c2]and cc[c1]~=cc[c2]then return cc[c1]<cc[c2]end local jI,jJ=aj.price[c1],aj.price[c2]if jI and jJ and jI~=jJ then return jI<jJ end
local jK,jL=jH[c1],jH[c2]if jK and jL then return jK<jL end if jK then return true end if jL then return false end
return c1<c2 end)ad.rar,ad.pretty,ad.members,ad.rarOrder,ad.n,ad.at=jD,pw,c0,gj,gg,z()return true end local function jM()
if ad.at==0 or(z()-ad.at)>120 then pcall(yS)end return ad.n>0 end local function y1(y2)local pB=W(y2)return ad.rar[pB]or(V.name and W(V.name)==pB and V.rar)or"?"
end local function y3()local gk={}local y4=((e.Best or 0)>0 and next(q.best or{}))and q.best or e.Targets for y5,y6 in pairs(y4)do if y6 then gk[#gk+1]=ak(y5)end end
table.sort(gk)return gk end local an={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function pC()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function gl(pD)if type(makefolder)~="function"then return end local y7,y8=pcall(isfolder,pD)if not(y7 and y8)then pcall(makefolder,pD)end
end local function gm(pE)if type(isfile)~="function"or type(readfile)~="function"then return nil end local y9,y_=pcall(isfile,pE)
if not(y9 and y_)then return nil end local za,zb=pcall(readfile,pE)return za and zb or nil end local function d3(zc,zd)
if type(writefile)~="function"then return false end return(pcall(writefile,zc,zd))end local function pF(ze)local d4={}
if type(listfiles)~="function"then return d4 end local zf,pG=pcall(listfiles,ze)if not zf or type(pG)~="table"then return d4 end
for Iz,zg in ipairs(pG)do d4[#d4+1]=tostring(zg)end return d4 end local function pH()local gn={}for IA,zh in ipairs(pF(an.cfg))do
local pI=zh:match("([^/\\]+)%.txt$")if pI then gn[#gn+1]=pI end end table.sort(gn)return gn end local function zi()
local aa={"V|1"}aa[#aa+1]="N|Every|"..tostring(e.Every)aa[#aa+1]="N|GlazeLead|"..tostring(e.GlazeLead)aa[#aa+1]="N|FpsCap|"..tostring(e.FpsCap)
aa[#aa+1]="N|MemLimit|"..tostring(e.MemLimit)aa[#aa+1]="N|Best|"..tostring(e.Best or 0)for IB,pJ in ipairs({"TeamNormal","TeamFull","TeamGlaze","TeamWax"})do aa[#aa+1]="S|"..pJ.."|"..e[pJ]end
do local go={}for zj,gp in pairs(e.Pets)do local pK=(gp.b and"b"or"")..(gp.g and"g"or"")..(gp.w and"w"or"")..(tonumber(gp.f)==-1 and"k"or"")
if pK~=""then go[#go+1]=zj.."|"..pK end end table.sort(go)aa[#aa+1]="P|-"for IC,zk in ipairs(go)do aa[#aa+1]="P|"..zk end
end for ID,pL in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart","AutoRoll","PetBuy","PetWish","Teams","Lite","HideHud","NoRender","AutoFuse","AutoBuild","Help","HelpGuild","Campfire","Ghost","GhostHelps","Quests","HideBases","HideMine","AutoIndex","BestCrate","Shower","Calm","SnapGlaze"})do
aa[#aa+1]="B|"..pL.."|"..(e[pL]and"1"or"0")end local jN=H:GetAttribute("AutoRollRules")if type(jN)=="string"and jN~=""then e.ARrules,e.ARstop=jN,tostring(H:GetAttribute("AutoRollStop")or"")end
if e.ARrules~=""then aa[#aa+1]="S|rules|"..e.ARrules aa[#aa+1]="S|stop|"..e.ARstop end if c.winPos then aa[#aa+1]=("W|%d|%d"):format(c.winPos[1],c.winPos[2])end
if c.togPos then aa[#aa+1]=("G|%d|%d"):format(c.togPos[1],c.togPos[2])end for IE,jO in ipairs({{"T",e.Targets},{"K",e.CrateTicks}})do
local gq={}for zl,zm in pairs(jO[2])do if zm then gq[#gq+1]=zl end end table.sort(gq)aa[#aa+1]=jO[1].."|-"for IF,zn in ipairs(gq)do aa[#aa+1]=jO[1].."|"..zn end
end return table.concat(aa,"\n")end local function zo(jP)if type(jP)~="string"or jP==""then return false end local pM,pN,pO,pP,d5={},false,{},false,nil
for zp in jP:gmatch("[^\n]+")do local aF,ah,az=zp:match("^(%a)|([^|]*)|?(.*)$")if aF=="N"and ah=="Every"then local jQ=tonumber(az)
if jQ and jQ>=1 then e.Every=math.floor(jQ)end elseif aF=="N"and(ah=="FpsCap"or ah=="MemLimit")then local jR=tonumber(az)
if jR and jR>=0 then e[ah]=math.floor(jR)end elseif aF=="N"and ah=="Best"then local gr=tonumber(az)if gr and gr>=0 and gr<=4 then e.Best=math.floor(gr)end
elseif aF=="N"and ah=="GlazeLead"then local gs=tonumber(az)if gs and gs>=5 and gs<=600 then e.GlazeLead=math.floor(gs)end
elseif aF=="S"and(ah=="TeamNormal"or ah=="TeamFull"or ah=="TeamGlaze"or ah=="TeamWax")then e[ah]=az elseif aF=="P"and ah~=""then
if not d5 then d5={}end if ah~="-"and az~=""then d5[ah]={b=az:find("b",1,true)and true or nil,g=az:find("g",1,true)and true or nil,
w=az:find("w",1,true)and true or nil,f=az:find("k",1,true)and-1 or nil}end elseif aF=="B"then if e[ah]~=nil then e[ah]=(az=="1")end
elseif aF=="S"and ah=="rules"then e.ARrules=az elseif aF=="S"and ah=="stop"then e.ARstop=az elseif aF=="W"then
c.winPos={tonumber(ah)or 10,tonumber(az)or 44}elseif aF=="G"then c.togPos={tonumber(ah)or 10,tonumber(az)or 300}
elseif aF=="T"and ah~=""then if ah~="-"then pM[ah]=true end pN=true elseif aF=="K"and ah~=""then if ah~="-"then pO[ah]=true end
pP=true end end if pN then e.Targets=pM end if pP then e.CrateTicks=pO end if d5 then e.Pets=d5 end return true
end local function gt(c3)if not pC()then return false,"this executor cannot write files"end c3=(c3 or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")
if c3==""then return false,"give the config a name"end gl(an.dir)gl(an.cfg)if not d3(an.cfg.."/"..c3 ..".txt",zi())then return false,"could not write the file"end
c.config=c3 return true,c3 end local function pQ(gu)local pR=gm(an.cfg.."/"..gu..".txt")if not pR then return false,"no config called "..tostring(gu)end
if not zo(pR)then return false,"that config looks empty"end c.config=gu return true,gu end local function pS(jS)
if jS then gl(an.dir)d3(an.auto,jS)elseif type(delfile)=="function"then pcall(delfile,an.auto)else d3(an.auto,"")
end c.autoload=jS end local function zq()if c.selfPath then return c.selfPath end local gv for IG,zr in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",an.dir})do
for IH,pT in ipairs(pF(zr))do local jT=pT:lower()if jT:sub(-4)==".lua"and(jT:find("sab_farm",1,true)or jT:find("sab farm",1,true))then
gv=gv or pT end end end c.selfPath=gv return gv end an.stub=[[
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
local function zs()if not pC()then return false,"this executor cannot write files"end gl("autoexec")if not d3(an.exec,an.stub)then return false,"could not write to the autoexec folder"end
return true,"it loads the newest version from GitHub on every join"end local gw=(function()local zt,zu=pcall(function()return game:GetService("TeleportService")end)return zt and zu or nil end)()
local function pU()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local zv=queueonteleport or queue_on_teleport return(pcall(zv,an.stub))end local function d6(zw)if c.rejoining then return end
c.rejoining=true C("REJOIN ("..zw..")")pcall(f3)if c.autoload then pcall(gt,c.autoload)end local zx=pU()C(zx and"queued the script for the new server"or"this executor cannot queue scripts - set up autoexec for a clean restart")
task.spawn(function()for II=1,30 do if not gw then break end pcall(function()gw:Teleport(game.PlaceId,H)end)task.wait(10)
end end)end local function zy()local zz,pV=pcall(function()return game:GetService("GuiService")end)if zz and pV then
pcall(function()T(pV.ErrorMessageChanged:Connect(function()if e.Rejoin then d6("roblox error message")end end))
end)end pcall(function()local pW=game:GetService("CoreGui")local pX=pW and pW:WaitForChild("RobloxPromptGui",15)
local pY=pX and pX:WaitForChild("promptOverlay",15)if pY then T(pY.ChildAdded:Connect(function(zA)if e.Rejoin and tostring(zA.Name):lower():find("errorprompt",1,true)then d6("disconnect prompt")end
end))end end)if gw then pcall(function()T(gw.TeleportInitFailed:Connect(function()c.rejoining=false if e.Rejoin then task.delay(5,function()d6("teleport retry")end)end
end))end)end end local function pZ(zB)local p0=c.plot and c.plot:FindFirstChild(zB)if not p0 then return nil,false end
for IJ,jU in ipairs(p0:GetChildren())do if jU:IsA("Model")or jU:IsA("BasePart")then return jU,true end end return nil,true
end local function cd()local bD=pZ("RolledSquishy")if not bD then return nil end return{model=bD,name=bD.Name,pretty=cY(bD,"NameText")or ak(W(bD.Name)),
rar=cY(bD,"RarityText")or y1(bD.Name),price=cY(bD,"PriceText")}end local function p1(jV)return type(jV)=="string"and(ad.rar[W(jV)]~=nil or x3(jV))
end local function ac()local jW=pZ("SquishyEquipped")if jW then c.carrySrc,j.heldAt="model",z()return jW.Name,jW end
local p2=H.Character if p2 then for IK,d7 in ipairs(p2:GetDescendants())do if(d7:IsA("Model")or d7:IsA("Tool"))and p1(d7 .Name)then
c.carrySrc,j.heldAt="character",z()return d7 .Name,d7 end end end local gx=H:GetAttribute("SquishyEquipped")if type(gx)=="string"and gx~=""and p1(gx)and z()>=(c.carryBlind or 0)then
c.carrySrc="attribute"return gx,nil end c.carrySrc=nil end local function IL()local IM,zC=ac()return zC end local function d8()
local p3=cd()local jX=p3 and x5(p3 .price)local jY=be()if jX and jY and jY<jX*0.5 then return jY,jX end end local function ce(zD)
dQ[#dQ+1]=os.date("%H:%M:%S").." "..zD if#dQ>40 then table.remove(dQ,1)end end local function zE(cf,gy)if type(cf)~="string"then return end
ce(("Roll(%s,%s)"):format(cf,tostring(gy)))if cf:lower():find("crate",1,true)then j.rolled,j.rolledAt=cf,z()return
end V.seq=V.seq+1 V.name,V.at=cf,z()V.rar=type(gy)=="string"and gy or nil c.rolls=c.rolls+1 if aN(cf)then C(("ROLL %s [%s] = TARGET"):format(cf,tostring(gy)))end
end local function zF(cg)if type(cg)~="table"then return end local gz=cg.butter or cg.itemName if type(gz)~="string"then return end
c.gifts=c.gifts+1 V.gift,V.giftAt=gz,z()if type(cg.giftId)=="string"then local p4=af:FindFirstChild("Remotes")
local p5=p4 and p4:FindFirstChild("GiftThanks")if p5 then pcall(function()p5:FireServer(cg.giftId)end)end end
ce("Gift("..gz.." from "..tostring(cg.fromName)..")")C(("GIFT from %s: %s - it will not be waxed"):format(tostring(cg.fromName),gz))
end local function zG()local p6=af:WaitForChild("Remotes",30)if not c.alive then return end if not p6 then C("Remotes folder missing - no roll events")return end
T(H:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()local p7=H:GetAttribute("SquishyEquipped")
if type(p7)=="string"and p7~=""then j.heldAt=z()end end))local zM={SquishyRollAnimation=zE,InitSquishy=function(p8)V.init,V.initAt=tostring(p8),z()ce("Init("..tostring(p8)..")")end,
CrateUpdate=function(c4,p9)pcall(yB,c4)pcall(L.learn,c4)if type(c4)=="table"then local zH=p9==true or(j.rolled~=nil and z()-j.rolledAt<15)or j.waiting
if not zH then return end local zI=not j.waiting local zJ=j.on j.waiting,j.data,j.at=true,c4,z()j.on=(p9==true)
j.title=tostring(c4 .title or c4 .name or"crate")if j.on and not zJ then j.openedAt,j.byYou=z(),not j.ours if j.onShow then task.spawn(j.onShow)end
end if j.on then ce("CrateWindow open("..j.title..")")elseif zI then ce("Crate waiting("..j.title..")")C(j.title.." is waiting on your stand")
end else if j.waiting then ce("Crate gone")end j.on,j.waiting,j.data,j.prompt=false,false,nil,nil local zK=j.byYou
j.summonFails,j.ours,j.byYou=0,false,false if j.onGone then task.spawn(j.onGone,zK)end if j.classify then local zL=z()
task.spawn(function()pcall(j.classify,zL)end)end end end,GiftReceived=zF,}for gA,zN in pairs(zM)do local jZ=p6:FindFirstChild(gA)
if jZ and jZ:IsA("RemoteEvent")then T(jZ.OnClientEvent:Connect(zN))elseif gA~="CrateUpdate"and gA~="GiftReceived"then C("remote "..gA.." missing")end
end end local function j0()local cj=cd()if cj then if aN(cj.name)then return{state="match",shown=cj.pretty,src="pad",info=cj}
end return{state="skip",info=cj,level="idle",text=("on pad: %s [%s] - not ticked"):format(cj.pretty,tostring(cj.rar))}
end if V.name and(z()-V.at)<4 then if aN(V.name)then return{state="match",shown=ak(W(V.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(ak(W(V.name)),tostring(V.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gB(zO,zP,zQ,zR)
local gC=RaycastParams.new()gC.FilterType=Enum.RaycastFilterType.Exclude local j1={H.Character}for IN,zS in ipairs(zR or{})do j1[#j1+1]=zS end
gC.FilterDescendantsInstances=j1 pcall(function()gC.RespectCanCollide=true end)local p_=am:Raycast(Vector3 .new(zO,zP+4,zQ),Vector3 .new(0,-30,0),gC)
return p_ and p_.Position or nil end local function c5(qa)local qb=qa:FindFirstChildOfClass("Humanoid")return((qb and qb.HipHeight)or 2)+qa.HumanoidRootPart.Size.Y/2+0.2
end local function j2(zT,zU)local j3=zT:FindFirstChildOfClass("Humanoid")local zV=z()while z()-zV<zU do if j3 and(j3 .FloorMaterial~=Enum.Material.Air or j3 .SeatPart)then return true end
ag(0.05)end return false end local function aG(zW,j4,j5)local qc=zW.HumanoidRootPart qc.AssemblyLinearVelocity=Vector3 .new(0,0,0)
qc.CFrame=j5 and CFrame.new(j4,Vector3 .new(j5 .X,j4 .Y,j5 .Z))or CFrame.new(j4)end local function ck(bj,qe)local cl=ap()
if not cl or not bj then return false end local bE=bj.Position local gD=math.clamp(math.max(bj.Size.X,bj.Size.Z)/2+2.2,3,7)
local qf=(qe and qe.MaxActivationDistance)or 10 if gD>qf-2 then gD=math.max(2.5,qf-2)end local d9={}local function cm(d_)
d_=Vector3 .new(d_.X,0,d_.Z)if d_.Magnitude>0.05 then d9[#d9+1]=d_.Unit end end local qg=oT()if qg then cm(qg-bE)end
cm(bj.CFrame.LookVector)cm(-bj.CFrame.LookVector)cm(bj.CFrame.RightVector)cm(-bj.CFrame.RightVector)cm(cl.HumanoidRootPart.Position-bE)
if#d9==0 then cm(Vector3 .new(0,0,1))end local zX,gE=c5(cl),false for IO,zY in ipairs(d9)do local gF=bE+zY*gD
local j6=gB(gF.X,bE.Y,gF.Z,{bj})if j6 and math.abs(j6 .Y-bE.Y)<14 then aG(cl,Vector3 .new(gF.X,j6 .Y+zX,gF.Z),bE)
if j2(cl,0.7)then gE=true break end end end if not gE then aG(cl,bE+d9[1]*gD+Vector3 .new(0,3,0),bE)gE=j2(cl,1)
end ag(0.12)return gE end local function qh(ea)if not ea.Parent or not ea.Enabled then return false end pcall(function()ea:InputHoldBegin()end)
ag(math.max(ea.HoldDuration,0)+0.08)pcall(function()ea:InputHoldEnd()end)return true end local function aq(qi,zZ)
local z0=z()while z()-z0<zZ do if qi()then return true end ag(0.05)end return qi()end local function eb(c6,z1,qj,z2)
local z3=c.zapFirst and{"zap","hold"}or{"hold","zap"}for z4,j7 in ipairs(z3)do if z4==2 and(z2 or not(c6 .Parent and c6 .Enabled and(not qj or qj())))then break end
local j8 if j7=="hold"then j8=qh(c6)else j8=type(fireproximityprompt)=="function"and c6 .Parent~=nil and c6 .Enabled and pcall(fireproximityprompt,c6)end
if j8 and aq(z1,1.2)then c.zapFirst=(j7=="zap")return true,j7 end end return false end local function qk(j9)local bF=o4()
if not bF or not bF.Enabled then C("buy: nothing on the pad")return false end local j_=dU(bF)if not j_ then C("buy: pad part missing")return false end
c.lastBuyAt=z()local z5,ql=V.seq,be()local qm=ap()local z6=qm and(qm.HumanoidRootPart.Position-j_.Position).Magnitude>12
ck(j_,bF)if z6 then ag(0.4)end if not bF.Enabled then C("buy aborted: pad emptied")return false end local c7=j0()
if not j9 and c7 .state~="match"then C("buy aborted: "..(c7 .text or"pad changed"))c.matchSince=nil return false
end local ka=c7 .info and c7 .info.name or(c7 .state=="match"and V.name)or nil local function z7()return bF.Enabled and ac()==nil and(j9 or j0().state=="match")
end local z8,z9=eb(bF,function()return ac()~=nil or((not bF.Enabled)and(j9 or V.seq==z5))end,z7,d8()~=nil)if z8 then
aq(function()return ac()~=nil end,0.8)local ec=ac()local qo=be()c.holding,c.bought,c.cashFails,c.buyMiss=true,c.bought+1,0,0
c.matchSince=nil V.name,V.rar,V.at=nil,nil,z()C(("BOUGHT %s%s via %s"):format(ec and ak(W(ec))or(c7 .shown or"?"),(ql and qo)and(" for $"..aD(ql-qo))or"",z9))
if ec and ka and W(ec)~=W(ka)then C(("note: picked up %s, not %s"):format(ec,ka))end return true end local gG=cd()
if d8()then c.cashFails=c.cashFails+1 c.noCashUntil=z()+math.min(8*2^(c.cashFails-1),60)C(("BUY REFUSED: cash short - have $%s, price %s"):format(aD(be()),(gG and gG.price)or"?"))
else c.buyMiss=(c.buyMiss or 0)+1 c.noCashUntil=z()+(c.buyMiss<=3 and 1 or 6)C(("buy did not go through (%s, try %d) - again in %ds"):format(gG and gG.price or"?",c.buyMiss,c.buyMiss<=3 and 1 or 6))
end return false end local function qp()local ed=ac()if not ed then c.holding=false C("place: hands are empty")
return false end if not aN(ed)then C(("REFUSED TO WAX %s - it is not ticked"):format(ak(W(ed))))return false end
for IP=1,e.PlaceTries do local bG=ye()if not bG then C("place: no free station")break end local qq=dU(bG)if qq then
ck(qq,bG)local qr=ac()if not qr then c.holding=false C("place: hands emptied on the way")return false end if not aN(qr)then C("place: what I carry changed, not waxing it")return false end
if bG.Enabled then local z_,Aa=eb(bG,function()return not bG.Enabled end,function()return bG.Enabled end)if z_ then
c.holding,c.placed,c.placeFails=false,c.placed+1,0 c.carryBlind,c.attrStale=z()+2.5,0 V.name,V.rar,V.at=nil,nil,z()
C(("WAXED %s #%d at %s via %s"):format(ak(W(ed)),c.placed,bG.Parent.Parent.Name,Aa))if q.placed then pcall(q.placed,ed)end
return true end end end ag(0.25)end c.placeFails=c.placeFails+1 if ac()==nil then c.holding=false end C("PLACE FAILED ("..c.placeFails..")")
if c.placeFails>=2 then c.capHit,c.running,c.capAt=true,false,z()c.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(ac()))C(c.capMsg)end return false end function A.place()local Ab=z()while c.alive and A.editing and z()-Ab<25 do ag(0.2)end
if e.Teams and e.TeamWax~=""then A.placing=true local Ac=z()while c.alive and A.current()~=e.TeamWax and z()-Ac<5 do ag(0.1)end
if A.current()==e.TeamWax then ag(0.3)else C("wax team did not come on in time - placing anyway")end end local Ad,qs=pcall(qp)
A.placing=false if not Ad then error(qs,0)end return qs end local function qt(qu)return type(qu)=="string"and qu:lower():find("crate",1,true)~=nil
end local Ae={SABFarmGui=1,SABToggle=1,SABError=1}local function kb(Af)local bH=Af while bH do if Ae[bH.Name]then return false end
if bH:IsA("ScreenGui")then local Ag,Ah=pcall(function()return bH.Enabled end)return(not Ag)or Ah~=false end if bH:IsA("GuiObject")and not bH.Visible then return false end
bH=bH.Parent end return false end local function gH(gI)local c8=""pcall(function()if gI:IsA("TextButton")then c8=gI.Text end end)
if not c8:find("%a")then for IQ,gJ in ipairs(gI:GetDescendants())do if(gJ:IsA("TextLabel")or gJ:IsA("TextButton"))and gJ.Text:find("%a")then c8=gJ.Text break end
end end if not c8:find("%a")then c8=gI.Name end return(c8:lower():gsub("[^%a]",""))end local function Ai()local ee,ef
local qv=H:FindFirstChildOfClass("PlayerGui")if not qv then return nil,nil end for IR,eg in ipairs(qv:GetDescendants())do
if eg:IsA("GuiButton")and kb(eg)then local kc=gH(eg)if kc:sub(1,4)=="open"and not kc:find("shop",1,true)then ee=ee or eg end
if kc:sub(1,7)=="discard"then ef=ef or eg end end end if ee and ef then return ee,ef end if j.on then return ee,ef end
return nil,nil end local kd=(function()local Aj,Ak=pcall(function()return game:GetService("VirtualInputManager")end)return Aj and Ak or nil end)()
local function qw(bk,ke)local kf={}local function qx(Al)kf[#kf+1]=Al end if c.tapWay then qx(c.tapWay)end for IS,qy in ipairs({"touch","conn","signal"})do
if qy~=c.tapWay then qx(qy)end end local function qz(Am,...)local An,kg=pcall(getconnections,Am)if not(An and type(kg)=="table"and#kg>0)then return false end
local qA,Ao,Ap=false,{...},select("#",...)for IT,Aq in ipairs(kg)do if pcall(function()Aq:Fire(table.unpack(Ao,1,Ap))end)then qA=true end
end return qA end local function qB()local qC=Vector3 .new(0,0,0)pcall(function()local qD,qE=bk.AbsolutePosition,bk.AbsoluteSize
qC=Vector3 .new(qD.X+qE.X/2,qD.Y+qE.Y/2,0)end)local kh={Position=qC,Delta=Vector3 .new(0,0,0),KeyCode=Enum.KeyCode.Unknown}
pcall(function()kh.UserInputType=Enum.UserInputType.Touch end)pcall(function()kh.UserInputState=Enum.UserInputState.End end)
return kh end for IU,bl in ipairs(kf)do local eh=false if bl=="conn"and type(getconnections)=="function"then if qz(bk.MouseButton1Click)then
eh=true if aq(ke,1.5)then c.tapWay=bl return true,bl end end eh=qz(bk.Activated,qB(),1)elseif bl=="signal"and type(firesignal)=="function"then
if pcall(firesignal,bk.MouseButton1Click)then if aq(ke,1.5)then c.tapWay=bl return true,bl end end eh=pcall(firesignal,bk.Activated,qB(),1)
elseif bl=="touch"and kd then eh=pcall(function()local qF,qG=bk.AbsolutePosition,bk.AbsoluteSize local qH=0 local qI=bk:FindFirstAncestorWhichIsA("ScreenGui")
local Ar,As=pcall(function()return qI and qI.IgnoreGuiInset end)if not(Ar and As)then pcall(function()qH=game:GetService("GuiService"):GetGuiInset().Y end)
end local qJ,qK=qF.X+qG.X/2,qF.Y+qG.Y/2+qH kd:SendMouseButtonEvent(qJ,qK,0,true,game,1)task.wait(0.06)kd:SendMouseButtonEvent(qJ,qK,0,false,game,1)
end)end if eh and aq(ke,1.5)then c.tapWay=bl return true,bl end end return false end j.NOT={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function ki(qL)local ei=qL.Parent while ei and ei~=c.plot do if j.NOT[ei.Name]then return false end ei=ei.Parent
end local kj=(qL.ActionText or""):lower()if kj:find("roll",1,true)or kj:find("place",1,true)or kj:find("sell",1,true)then return false end
return true end local function qM()if j.prompt and j.prompt.Parent and j.prompt.Enabled then return j.prompt end
if not c.plot then return nil end local qN=c.plot:FindFirstChild("CrateStand")local ej if qN then for IV,gK in ipairs(qN:GetDescendants())do
if gK:IsA("ProximityPrompt")and gK.Enabled and ki(gK)then ej=gK break end end end if not ej then for IW,bI in ipairs(c.plot:GetDescendants())do
if bI:IsA("ProximityPrompt")and bI.Enabled and ki(bI)then local qO=bI:FindFirstAncestorWhichIsA("Model")local At=((bI.ActionText or"").." "..(bI.ObjectText or"").." "..bI.Name.." "..(qO and qO.Name or"")):lower()
if At:find("crate",1,true)then ej=bI break end end end end j.prompt=ej return ej end local function kk()if j.on then return true end
local ek=qM()if not ek then j.summonFails=j.summonFails+1 j.lastFail=z()C("crate: cannot find where to open "..j.title.." - open it once by hand")
return false end local qP=dU(ek)if qP then ck(qP,ek)end j.ours=true eb(ek,function()return j.on end)if aq(function()return j.on end,3)then
j.summonFails=0 return true end j.ours=false j.summonFails=j.summonFails+1 j.lastFail=z()C("crate: pressed "..fY(ek).." but no window came up")
return false end do local function Au(qQ)local c9=qQ.Parent while c9 and c9:IsA("GuiObject")do local qR,qS=false,false
for IY,el in ipairs(c9:GetDescendants())do if el~=qQ and el:IsA("GuiButton")and gH(el):sub(1,7)=="discard"then qR=true end
if el:IsA("TextLabel")then local kl=el.Text:lower()if kl:find("crate",1,true)or kl:find("can contain",1,true)or kl:find("cost",1,true)then qS=true end
end if qR and qS then return c9 end end c9=c9 .Parent end end function j.findWin()if j.win and j.win.Parent then return j.win end
local qT=H:FindFirstChildOfClass("PlayerGui")if not qT then return nil end for IZ,gL in ipairs(qT:GetDescendants())do
if gL:IsA("GuiButton")and not gL:FindFirstAncestor("SABFarmGui")and gH(gL):sub(1,4)=="open"then local km=Au(gL)
if km then j.win=km return km end end end end local function Av(Aw)for I0,gM in ipairs(Aw:GetDescendants())do
if gM:IsA("GuiButton")then local qU,kn=gH(gM),gM.Name:lower()if qU=="x"or qU=="close"or kn=="x"or kn:find("close",1,true)or kn:find("exit",1,true)then return gM end
end end end j.onShow=function()j.win=nil j.findWin()end j.onGone=function(Ax)task.wait(Ax and 4 or 1.2)if j.on or j.waiting then return end
local gN=j.findWin()if not gN or not kb(gN)then return end local qV=Av(gN)if qV and qw(qV,function()return not kb(gN)end)then return end
C("the crate window is still open - tap its X")end end local function em(gO)if not kk()then return false end local qW=z()-(j.openedAt or 0)
if qW<0.6 then ag(0.6-qW)end local ko=j.title local Ay,Az=Ai()local qX=gO and Ay or Az if not qX then j.lastFail=z()
c.crateFails=c.crateFails+1 C(("crate: no %s button found in %s"):format(gO and"Open"or"Discard",ko))return false
end local AA=ac()local AB,I1=qw(qX,function()return(not j.on)or(ac()~=nil and ac()~=AA)end)if not AB then j.lastFail=z()
c.crateFails=c.crateFails+1 C("crate: could not press "..(gO and"Open"or"Discard").." (no working tap method)")
return false end c.crateFails=0 if gO then c.crates=c.crates+1 aq(function()return ac()~=nil end,1.5)local qY=ac()
C(("OPENED %s -> %s"):format(ko,qY and ak(W(qY))or"?"))else C("discarded "..ko.." (nothing ticked in it)")end
return true end j.calls={}function j.saw(AC,...)local AD=select("#",...)j.calls[#j.calls+1]={t=z(),m=AC,n=AD,args={...},data=j.data,
crate=j.data and j.data.name,title=j.title,rar=j.data and j.data.rarity}if#j.calls>12 then table.remove(j.calls,1)end
end function j.slot(aH,bm)local bJ=type(aH)if(bJ=="string"or bJ=="number")and type(bm.data)=="table"then for qZ,kp in pairs(bm.data)do
if kp==aH and type(qZ)=="string"and(type(kp)=="string"or type(kp)=="number")then return{__slot="f:"..qZ}end end
end if bJ=="string"then if bm.crate and aH==bm.crate then return{__slot="crate"}end if bm.title and aH==bm.title then return{__slot="title"}end
if bm.rar and aH==bm.rar then return{__slot="rarity"}end return aH end if bJ=="number"or bJ=="boolean"or bJ=="nil"then return aH end
if bJ=="table"then local q0={}for AE,q1 in pairs(aH)do if type(q1)=="table"then return nil,"nested table"end local AF,q2=j.slot(q1,bm)
if q2 then return nil,q2 end q0[AE]=AF end return q0 end local AG,AH=pcall(function()return aH:IsA("Instance")end)
if AG and AH then if aH==H then return{__slot="player"}end if c.plot and aH==c.plot then return{__slot="plot"}end
local gP=c.plot and c.plot:FindFirstChild("CrateStand")if gP and aH==gP then return{__slot="stand"}end if gP and aH.Parent==gP then return{__slot="model"}end
end return nil,"a value it cannot rebuild ("..bJ..")"end function j.resolve(gQ)if type(gQ)~="table"then return gQ end
local aU=gQ.__slot if aU and aU:sub(1,2)=="f:"then return j.data and j.data[aU:sub(3)]end if aU=="crate"then return j.data and j.data.name end
if aU=="title"then return(j.data and j.data.title)or j.title end if aU=="rarity"then return j.data and j.data.rarity end
if aU=="player"then return H end if aU=="plot"then return c.plot end if aU=="stand"or aU=="model"then local kq=c.plot and c.plot:FindFirstChild("CrateStand")
if aU=="stand"or not kq then return kq end for I2,q3 in ipairs(kq:GetChildren())do if qt(q3 .Name)then return q3 end end
return nil end local q4={}for AI,AJ in pairs(gQ)do q4[AI]=j.resolve(AJ)end return q4 end function j.classify(kr)
if j.directOff then return end local gR={}for I3,ks in ipairs(j.calls)do if ks.t<=kr+0.05 and kr-ks.t<=6 then gR[#gR+1]=ks end
end if#gR==0 then return end if not aq(function()return(j.heldAt or 0)>=kr-1 end,2.5)then return end local en={}
for I4,eo in ipairs(gR)do local q5={}for q6=1,eo.n do local AK,q7=j.slot(eo.args[q6],eo)if q7 then C("crate call has "..q7 .." - keeping the button method")
return end q5[q6]=AK end en[#en+1]={m=eo.m,n=eo.n,args=q5}end local kt=j.learned j.learned={seq=en,mode=kt and kt.mode or nil}
aj.dirty=true if not kt then C(("learned how to open crates directly (%d call%s)"):format(#en,#en==1 and""or"s"))end
end function j.replay()local q8=j.learned local q9=af:FindFirstChild("Remotes")local ku=q9 and q9:FindFirstChild("CrateAction")
if not(q8 and ku)then return false end local q_=table.unpack or unpack j.replaying=true for I5,ep in ipairs(q8 .seq)do
local kv={}for ra=1,ep.n do kv[ra]=j.resolve(ep.args[ra])end task.spawn(function()pcall(function()if ep.m=="InvokeServer"then ku:InvokeServer(q_(kv,1,ep.n))
else ku:FireServer(q_(kv,1,ep.n))end end)end)task.wait(0.2)end j.replaying=false return true end function j.esc(AL)return(AL:gsub("[%%|;=,\n]",function(AM)return("%%%02X"):format(AM:byte())end))end
function j.enc(cn)local gS=type(cn)if gS=="string"then return"s"..j.esc(cn)end if gS=="number"then return"n"..tostring(cn)end
if gS=="boolean"then return cn and"b1"or"b0"end if gS=="nil"then return"z"end if cn.__slot then return"k"..cn.__slot end
local kw={}for AN,AO in pairs(cn)do kw[#kw+1]=j.enc(AN).."="..j.enc(AO)end return"t"..table.concat(kw,",")end
function j.dec(rb)local eq,er=rb:sub(1,1),rb:sub(2)local function AP(AQ)return(AQ:gsub("%%(%x%x)",function(AS)return string.char(tonumber(AS,16))end))end
if eq=="s"then return AP(er)end if eq=="n"then return tonumber(er)end if eq=="b"then return er=="1"end if eq=="k"then return{__slot=er}end
if eq=="t"then local rc={}for AT in er:gmatch("[^,]+")do local rd,AU=AT:match("^(.-)=(.*)$")if rd then local rf=j.dec(rd)
if rf~=nil then rc[rf]=j.dec(AU)end end end return rc end return nil end function j.goneOrNew(AV)return function()
if not j.waiting then return true end local rg=ac()return rg~=nil and rg~=AV end end function j.near()local rh=af:FindFirstChild("Remotes")
local kx=rh and rh:FindFirstChild("CrateAction")local gT=ap()local ky=c.plot and c.plot:FindFirstChild("CrateStand")
local kz=ky and ky:FindFirstChild("Spot")if not(kx and gT and kz)then C(("crate: cannot open %s right now (%s)"):format(tostring(j.title),
not kx and"no CrateAction remote"or not gT and"no character (respawning?)"or"no crate stand"))return false,"no crate stand or remote"
end local kA=gT.HumanoidRootPart local gU=kA.CFrame local ri,kB=j.title,"no answer"local AW=ac()local rj=ky:FindFirstChild("Holder")
local function rk()if not rj then return j.waiting or j.on end for I6,AX in ipairs(rj:GetChildren())do if AX:IsA("Model")then return true end end
return false end for AY=1,3 do if not(j.waiting or j.on)or not rk()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end if(kA.Position-kz.Position).Magnitude>8 then ck(kz,j.prompt)end ag(0.12+0.15*AY)
local a7={}j.replaying=true task.spawn(function()a7 .ok,a7 .v=pcall(function()return kx:InvokeServer("open")end)
a7 .done=true end)aq(function()return a7 .done end,6)j.replaying=false local co=a7 .v if a7 .done and a7 .ok and type(co)=="table"and co.ok then
c.crates,j.fails,j.nearFails=c.crates+1,0,0 j.waiting,j.on,j.quietUntil=false,false,z()+4 C(("OPENED %s -> %s (no window)"):format(ri,co.prize and ak(W(tostring(co.prize)))or"?"))
aq(function()local rl=ac()return rl~=nil and rl~=AW end,1.5)if(kA.Position-gU.Position).Magnitude>8 then pcall(function()aG(gT,gU.Position,gU.Position+gU.LookVector)end)end
return true,"opened"end kB=(a7 .done and a7 .ok and type(co)=="table")and tostring(co.reason or"refused, no reason given")
or(a7 .done and("error: "..tostring(co))or"no answer in 6s")ag(0.3)if not rk()then j.waiting,j.on,j.quietUntil=false,false,z()+4
return true,"already gone"end end j.nearFails=(j.nearFails or 0)+1 C(("crate: the server would not open %s next to the stand (%s)"):format(ri,kB))
return false,kB end j.GIVEUP=600 function j.drop()local rm=af:FindFirstChild("Remotes")local rn=rm and rm:FindFirstChild("CrateAction")
local ro=c.plot and c.plot:FindFirstChild("CrateStand")local kC=ro and ro:FindFirstChild("Spot")local rp=ap()
if kC and rp and(rp.HumanoidRootPart.Position-kC.Position).Magnitude>8 then ck(kC,j.prompt)ag(0.3)end local kD,bn=false,nil
if rn then kD,bn=pcall(function()return rn:InvokeServer("discard")end)end C(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(j.title),math.floor(j.GIVEUP/60),(kD and type(bn)=="table"and bn.ok)and"done"or("answer: "..tostring(type(bn)=="table"and(bn.reason or bn.ok)or bn))))
j.waiting,j.on,j.quietUntil=false,false,z()+4 j.summonFails,j.nearFails,j.lastFail,j.at,j.prompt=0,0,0,nil,nil
if not(kD and type(bn)=="table"and bn.ok)then em(false)end end function j.smart()local kE=j.title if(j.nearFails or 0)<3 then
local AZ=j.near()if AZ then return true end if j.nearFails>=3 then C("opening next to the stand failed 3 times - trying the older ways")end
end local cp=j.learned if cp then local kF=ac()if j.on then j.replay()if aq(j.goneOrNew(kF),3.5)then c.crates=c.crates+1
C("OPENED "..kE.." (direct)")return true end else if cp.mode~="window"then j.replay()if aq(j.goneOrNew(kF),3.5)then
c.crates,j.fails=c.crates+1,0 if cp.mode~="direct"then cp.mode,aj.dirty="direct",true C("crates now open directly - the window never comes up")
end C("OPENED "..kE.." (direct, no window)")return true end end if kk()then j.replay()if aq(j.goneOrNew(kF),3.5)then
c.crates,j.fails=c.crates+1,0 if cp.mode~="window"then cp.mode,aj.dirty="window",true C("crates need their window up first - it shows briefly")
end C("OPENED "..kE.." (direct, window up)")return true end end end j.fails=(j.fails or 0)+1 j.lastBad,j.learned,aj.dirty=cp,nil,true
if j.fails>=3 then j.directOff=true C("direct crate opening failed 3 times - using the button for now")else C("the learned crate call did not work - back to pressing Open")
end end return em(true)end function D.snap()return{rules=H:GetAttribute("AutoRollRules"),stop=H:GetAttribute("AutoRollStop"),
on=H:GetAttribute("AutoRollOn"),main=H:GetAttribute("AutoRoll")}end D.cache={}function D.watchCache()D.cache=D.snap()
for A0,rq in pairs({rules="AutoRollRules",stop="AutoRollStop",on="AutoRollOn",main="AutoRoll"})do T(H:GetAttributeChangedSignal(rq):Connect(function()D.cache[A0]=H:GetAttribute(rq)end))
end end function D.isOn()return H:GetAttribute("AutoRollOn")==true end function D.saw(A1,...)local gV=D.cache
local A2={m=A1,n=select("#",...),args={...},before={rules=gV.rules,stop=gV.stop,on=gV.on,main=gV.main}}task.delay(1.5,function()
if c.alive then pcall(D.learnOne,A2)end end)end function D.learnOne(es)local aA,et=D.snap(),es.before local gW=(aA.rules~=et.rules)or(aA.stop~=et.stop)
local rr=(aA.on~=et.on)or(aA.main~=et.main)if not gW and not rr then return end local rs={}for rt=1,es.n do local aO=es.args[rt]
local cq=type(aO)if cq=="string"and aO~=""and aO==aA.rules then aO={__slot="rules"}elseif cq=="string"and aO~=""and gW and aO==aA.stop and aA.stop~=et.stop then aO={__slot="stop"}
elseif cq=="table"then local ru={}for A3,c_ in pairs(aO)do if type(c_)=="table"or(type(c_)=="userdata")then D.msg="Auto Roll sends something I cannot repeat"return
end ru[A3]=(type(c_)=="string"and c_~=""and c_==aA.rules)and{__slot="rules"}or c_ end aO=ru elseif cq~="string"and cq~="number"and cq~="boolean"and cq~="nil"then
if aO==H then aO={__slot="player"}else D.msg="Auto Roll sends something I cannot repeat"return end end rs[rt]=aO
end local da={m=es.m,n=es.n,args=rs}if gW then local kG=false for A4=1,da.n do local eu=da.args[A4]if type(eu)=="table"and eu.__slot=="rules"then kG=true end
if type(eu)=="table"and not eu.__slot then for I7,rv in pairs(eu)do if type(rv)=="table"and rv.__slot=="rules"then kG=true end end
end end if kG then D.rec.rules={da}else table.insert(D.rec.rules,da)if#D.rec.rules>60 then table.remove(D.rec.rules,1)end
end end if rr then if aA.on==true then D.rec.on=da else D.rec.off=da end e.AutoRoll=(aA.on==true)end if aA.rules and aA.rules~=""then e.ARrules,e.ARstop=aA.rules,aA.stop or""end
aj.dirty=true D.msg=""C(("learned an Auto Roll %s message"):format(gW and"choices"or(aA.on and"on"or"off")))end
function D.resolve(db)if type(db)~="table"then return db end if db.__slot=="rules"then return e.ARrules~=""and e.ARrules or H:GetAttribute("AutoRollRules")end
if db.__slot=="stop"then return e.ARstop~=""and e.ARstop or H:GetAttribute("AutoRollStop")end if db.__slot=="player"then return H end
local rw={}for A5,A6 in pairs(db)do rw[A5]=D.resolve(A6)end return rw end function D.replay(rx,A7)local ry=table.unpack or unpack
for I8,ev in ipairs(A7)do local kH={}for rz=1,ev.n do kH[rz]=D.resolve(ev.args[rz])end D.replaying=true pcall(function()
if ev.m=="InvokeServer"then task.spawn(function()pcall(function()rx:InvokeServer(ry(kH,1,ev.n))end)end)else rx:FireServer(ry(kH,1,ev.n))end
end)D.replaying=false task.wait(0.25)end end function D.apply(rA,A8)if D.busy or not c.alive then return end D.busy=true
pcall(function()local rB=af:FindFirstChild("Remotes")local kI=rB and rB:FindFirstChild("AutoRollAction")if not kI then D.msg="this game has no AutoRollAction"return end
local bK=e.AutoRoll if bK and e.ARrules~=""and H:GetAttribute("AutoRollRules")~=e.ARrules then if#D.rec.rules==0 then
D.msg="pick your Auto Roll choices once in the game's menu so I can learn them"C(D.msg)else D.replay(kI,D.rec.rules)
if aq(function()return H:GetAttribute("AutoRollRules")==e.ARrules end,4)then C("Auto Roll choices put back")else
D.msg="Auto Roll choices did not come out the same - set them in the game, then SAVE"C(D.msg)end end end if bK==D.isOn()or(not bK and not A8)then return end
local gX=bK and D.rec.on or D.rec.off if not gX then local ew=bK and D.rec.off or D.rec.on local rC=ew~=nil for A9=1,ew and ew.n or 0 do
if type(ew.args[A9])=="boolean"then rC=false end end if rC then gX=ew end end if not gX then D.msg=("switch Auto Roll %s once in the game's menu so I can learn it"):format(bK and"on"or"off")
C(D.msg)return end D.replay(kI,{gX})if aq(function()return D.isOn()==bK end,4)then D.msg=""C(("Auto Roll switched %s%s"):format(bK and"ON"or"OFF",rA and(" ("..rA..")")or""))
else D.msg="Auto Roll did not switch - do it once in the game so I can relearn it"C(D.msg)end end)D.busy=false
end o.HS=game:GetService("HttpService")o.uid=(function()local A_,Ba=pcall(function()return H.UserId end)return A_ and Ba or 0 end)()
o.buyMsg,o.wishMsg,o.wishN="","",0 function o.info()if o.I then return o.I end local Bb,kJ=pcall(function()return require(af:WaitForChild("Modules",5):WaitForChild("PetInfo",5))end)
if Bb and type(kJ)=="table"and type(kJ.Pets)=="table"then o.I=kJ end return o.I end function o.order()if o.list then return o.list end
local bL=o.info()if not bL then return{}end local cr={}if type(bL.Order)=="table"and#bL.Order>0 then for I9,rD in ipairs(bL.Order)do if bL.Pets[rD]then cr[#cr+1]=rD end end
else for Bc in pairs(bL.Pets)do cr[#cr+1]=Bc end table.sort(cr,function(Bd,Be)return(bL.Pets[Bd].price or 0)<(bL.Pets[Be].price or 0)end)
end o.list=cr return cr end function o.nice(rE,kK)local rF=o.info()local rG=rF and rF.Pets[rE]return((kK and kK~="")and(kK.." ")or"")..(rG and rG.displayName or tostring(rE))
end function o.data()local gY=H:GetAttribute("PetsData")if type(gY)~="string"then return nil end if gY==o.rawD then return o.lastD end
local Bf,ex=pcall(function()return o.HS:JSONDecode(gY)end)ex=(Bf and type(ex)=="table")and ex or nil o.rawD,o.lastD=gY,ex
return ex end function o.pen()return af:FindFirstChild("PetMeadowSpawns")end function o.srv()return am:GetServerTimeNow()end
function o.money()local kL=H:FindFirstChild("MoneyValue")if kL and type(kL.Value)=="number"then return kL.Value end
return be()or 0 end function o.wishes()local rH=o.pen()local rI=rH and rH:GetAttribute("Wishes")local kM,rJ={},o.srv()
if type(rI)~="string"then return kM end local Bg,rK=pcall(function()return o.HS:JSONDecode(rI)end)if Bg and type(rK)=="table"then
for Bh,kN in pairs(rK)do if type(kN)=="number"and kN>rJ then kM[Bh]=kN-rJ end end end return kM end function o.call(...)
local rL=af:FindFirstChild("Remotes")local rM=rL and rL:FindFirstChild("PetRequest")if not rM then return nil end
local rN=table.pack(...)local cs={}task.spawn(function()cs.ok,cs.v=pcall(function()return rM:InvokeServer(table.unpack(rN,1,rN.n))end)
cs.done=true end)local Bi=z()while not cs.done and z()-Bi<6 do task.wait(0.05)end if cs.done and cs.ok then return cs.v end
return nil end function o.want(Bj)return e.Pets[Bj]end function o.closeNaming(kO)local rP=pcall(function()local rO=H:FindFirstChild("PlayerScripts")
local Bk=rO and rO:FindFirstChild("Naming",true)require(Bk).close()end)ag(0.5)if kO.Visible then pcall(function()local rQ=kO:FindFirstChild("NameBox",true)if rQ then rQ:ReleaseFocus()end end)
kO.Visible=false rP=false end return rP end function o.skipNaming()o.namingUntil=z()+10 if o.namingOn then return end
o.namingOn=true task.spawn(function()while c.alive and z()<o.namingUntil do local rR=H:FindFirstChildOfClass("PlayerGui")
local rS=rR and rR:FindFirstChild("MainGui")local gZ=rS and rS:FindFirstChild("PetNameGui")if gZ and gZ.Visible then
ag(0.4)if gZ.Visible then o.namingShut=(o.namingShut or 0)+1 pcall(o.closeNaming,gZ)break end end ag(0.25)end
o.namingOn=false end)end function o.buyTick()if not e.PetBuy then o.buyMsg="auto adopt is off"return end local kP,rT,g0=o.info(),o.pen(),o.data()
if not(kP and rT and g0)then o.buyMsg="pet data not loaded yet"return end o.tryAt=o.tryAt or{}local ey,kQ=#(g0 .pets or{}),tonumber(g0 .maxOwned)or 60
local Bl,rU,ez=o.srv(),{},nil for I_,aV in ipairs(rT:GetChildren())do rU[aV.Name]=true local ct,g1=aV:GetAttribute("Pet"),aV:GetAttribute("Variant")or""
local kR=ct and o.want(ct)if kR and kR.b and kP.Pets[ct]and(not kR.g or g1=="Big")and y.wantMore(ct,g1,g0)and not aV:GetAttribute("A_"..o.uid)
and(tonumber(aV:GetAttribute("ExpiresAt"))or 0)>Bl+1 and z()>=(o.tryAt[aV.Name]or 0)then local eA,rV=o.nice(ct,g1),kP.Pets[ct].price or 0
if ey>=kQ then ez=("%s is in the pen, but you have %d/%d pets"):format(eA,ey,kQ)o.tryAt[aV.Name]=z()+15 elseif o.money()<rV then
ez=("%s is in the pen - need $%s"):format(eA,aD(rV))o.tryAt[aV.Name]=z()+5 else o.tryAt[aV.Name]=z()+8 local bM=o.call("adopt",aV.Name)
if type(bM)=="table"and bM.ok then ey=ey+1 o.buys=(o.buys or 0)+1 o.recent=o.recent or{}local Bm=type(bM.pet)=="table"and bM.pet or{}
table.insert(o.recent,{id=tostring(Bm.id or("?"..z())),name=ct,variant=g1,at=z()})if#o.recent>30 then table.remove(o.recent,1)end
C("ADOPTED "..eA)o.skipNaming()ez="adopted "..eA else local rW=type(bM)=="table"and tostring(bM.reason or"no reason given")or"no answer"
C(("adopt %s failed: %s"):format(eA,rW))ez="adopt failed: "..rW if type(bM)=="table"and bM.bagFull then o.tryAt[aV.Name]=z()+60 end
end end end end for rX in pairs(o.tryAt)do if not rU[rX]then o.tryAt[rX]=nil end end o.buyMsg=ez or("watching the pen (%d/%d pets)"):format(ey,kQ)
end function o.stacks()local rY=o.pen()local Bn=rY and rY:GetAttribute("WishStacks")local Bo,rZ=pcall(function()return o.HS:JSONDecode(Bn)end)
return(Bo and type(rZ)=="table")and rZ or{}end function o.stackTick(Bp,Bq)local g2=o.info()local r0=(type(g2 .Wish)=="table"and tonumber(g2 .Wish.maxStacks))or 1
if r0<=1 then return end local Br=o.stacks()o.stackTry=o.stackTry or{}for Ja,aW in ipairs(o.order())do local r1=o.want(aW)
local g3=tonumber(Br[aW])or 1 if r1 and r1 .w and Bp[aW]and g3<r0 and y.wantMore(aW,"",Bq)and z()>=(o.stackTry[aW]or 0)then
local Bs,g4=pcall(g2 .wishPrice,aW,g3+1)g4=Bs and tonumber(g4)or((g2 .Pets[aW].price or 0)*2*3^g3)o.stackTry[aW]=z()+5
if g4<=o.money()*0.01 then local r2=o.call("wish",aW)if type(r2)=="table"and r2 .ok then o.wishN=o.wishN+1 C(("WISH x%d on %s ($%s)"):format(g3+1,o.nice(aW),aD(g4)))
else o.stackTry[aW]=z()+60 end return end end end end function o.wishTick()if not e.PetWish then o.wishMsg="auto wish is off"return end
local g5=o.info()if not(g5 and o.pen())then o.wishMsg="pet data not loaded yet"return end o.wishTry,o.wishWhy=o.wishTry or{},o.wishWhy or{}
local bN,kS,bO=o.wishes(),0,nil local Bt=(type(g5 .Wish)=="table"and g5 .Wish.cashShare)or 2 local r3=o.data()
for Jb,aC in ipairs(o.order())do local r4=o.want(aC)if r4 and r4 .w and y.wantMore(aC,"",r3)then kS=kS+1 if not bN[aC]and z()>=(o.wishTry[aC]or 0)then
local kT=tonumber(H:GetAttribute("PetWishCredits"))or 0 local kU=math.floor((g5 .Pets[aC].price or 0)*Bt)if kT<=0 and o.money()<kU then
o.wishTry[aC]=z()+10 bO=("need $%s to wish for %s"):format(aD(kU),o.nice(aC))o.wishWhy[aC]=bO else o.wishTry[aC]=z()+3
local Bu=kT>0 and"wishCredit"or"wish"local g6=o.call(Bu,aC)if type(g6)=="table"and g6 .ok then o.wishN,o.wishWhy[aC]=o.wishN+1,nil
C(("WISHED for %s (%s)"):format(o.nice(aC),kT>0 and"free wish"or("$"..aD(kU))))else local kV=type(g6)=="table"and tostring(g6 .reason or"no reason given")or"no answer"
if kV:lower():find("already",1,true)then o.wishTry[aC]=z()+2 else C(("wish %s failed: %s"):format(o.nice(aC),kV))bO="wish failed: "..kV end
end end end end end pcall(o.stackTick,bN,r3)if not bO then for Jc,g7 in ipairs(o.order())do local r5=o.want(g7)
if r5 and r5 .w and not bN[g7]and o.wishWhy[g7]then bO=o.wishWhy[g7]break end end end if not bO then local dc={}
for Jd,eB in ipairs(o.order())do local r6=o.want(eB)local r7=tonumber(o.stacks()[eB])or 1 if r6 and r6 .w and bN[eB]then dc[#dc+1]=("%s%s %dm"):format(o.nice(eB),r7>1 and(" x"..r7)or"",math.ceil(bN[eB]/60))end
end local g8 for Je,g9 in ipairs(o.order())do local r8=o.want(g9)if r8 and r8 .w and bN[g9]and(not g8 or bN[g9]<g8)then g8=bN[g9]end
end bO=kS==0 and"no pet has WISH ticked"or(#dc==0 and"running: none yet")or(#dc<=3 and("running: "..table.concat(dc,", ")))
or("%d running, the next one ends in %dm"):format(#dc,math.ceil((g8 or 0)/60))end o.wishMsg=bO end A.switches,A.glazed,A.finished=0,0,0
A.done,A.doneN,A.later={},0,{}function A.teams()local kW=o.data()return(kW and kW.teams)or{},kW end function A.current(dd)
dd=dd or o.data()if not dd then return""end local r9={}for Jf,Bv in ipairs(dd.equipped or{})do r9[tostring(Bv)]=true end
for Jg,r_ in ipairs(dd.teams or{})do local sa=r_.pets or{}local kX=#sa==#(dd.equipped or{})if kX then for Jh,Bw in ipairs(sa)do if not r9[tostring(Bw)]then kX=false break end end end
if kX then return r_.name end end return""end function A.equip(kY)local Bx,By=A.teams()local kZ for Bz,BA in ipairs(Bx)do if BA.name==kY then kZ=Bz break end end
if not kZ then A.msg="no saved team called "..tostring(kY)return false end if A.current(By)==kY then return true end
for Ji=1,4 do local sb=o.call("teamEquip",kZ)if type(sb)=="table"and sb.ok then A.switches=A.switches+1 return true
end task.wait(0.4)end return false end function A.left(BB)local sc=BB:FindFirstChild("SquishyPlaceHolder")local sd=sc and sc:FindFirstChild("TimerGui")
local se=sd and sd:FindFirstChildWhichIsA("TextLabel",true)local k0=se and se.Text if type(k0)~="string"or k0:find("-",1,true)then return nil end
local k1,sf,sh=k0:match("^%s*(%d+):(%d+):?(%d*)%s*$")if not k1 then return nil end local sj=sh~=""and(tonumber(k1)*3600+tonumber(sf)*60+tonumber(sh))or(tonumber(k1)*60+tonumber(sf))
return sj>0 and sj or nil end function A.waxes()local eC={}local sk=c.plot and c.plot:FindFirstChild("WaxStations")
if not sk then return eC end local sl=o.srv()for Jj,a8 in ipairs(sk:GetChildren())do local k2=tonumber(a8:GetAttribute("PourEnd"))
local sm=a8:GetAttribute("PourOwner")if a8:GetAttribute("HasSquishy")and a8:GetAttribute("PourId")and(sm==nil or sm==o.uid)then
local k3=A.left(a8)local sn=k3 and(sl+k3)or((k2 and k2>sl)and k2 or nil)if sn then local so,sp=a8:FindFirstChild("SquishyPlaceHolder"),"?"
if so then for Jk,sq in ipairs(so:GetChildren())do if sq:IsA("Model")then sp=sq.Name break end end end local BC=tostring(a8:GetAttribute("Helpers")or"")
local k4=0 for Jl in BC:gmatch("%d+")do k4=k4+1 end eC[#eC+1]={st=a8,ends=sn,sure=k3~=nil,id=a8:GetAttribute("PourId"),name=sp,helps=k4,
long=a8:GetAttribute("PourLong")==true}end end end table.sort(eC,function(BD,BE)return BD.ends<BE.ends end)return eC
end function A.glazeCount()local sr=af:FindFirstChild("Remotes")local ss=sr and sr:FindFirstChild("EditStack")
if not ss then return nil end local BF,eD=pcall(function()return ss:InvokeServer("State",nil)end)if not(BF and type(eD)=="table"and type(eD.state)=="table")then return nil end
local k5,k6=0,{}for Jm,g_ in ipairs(eD.state.entries or{})do if g_.glaze and g_.glaze~=""then k5=k5+1 k6[g_.glaze]=(k6[g_.glaze]or 0)+1 end
end return k5,k6,#(eD.state.entries or{}),eD.state.capacity end function A.finishedOne(ha,su)A.finished=A.finished+1
task.wait(2)local k7,BG,sv,BH=A.glazeCount()if k7 and su and k7>su then A.glazed=A.glazed+1 local k8={}for BI,BJ in pairs(BG)do k8[#k8+1]=BI.." "..BJ end
C(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(ak(W(ha.name)),ha.st.Name,k7,table.concat(k8,", ")))
else C(("wax done on station %s: %s, no glaze%s"):format(ha.st.Name,ak(W(ha.name)),sv and(" (stack "..sv.."/"..tostring(BH)..")")or""))
end end function A.tick()A.list=A.waxes()if A.editing and z()-(A.editingSince or z())>120 then A.editing=false end
if A.editing then A.msg="rebuilding teams..."return end if not e.Teams then A.want,A.msg="","auto teams is off"return end
local cu=o.srv()local aI=A.glazeFor if aI then local eE=aI.st local sx=eE.Parent and eE:GetAttribute("HasSquishy")and eE:GetAttribute("PourId")==aI.id
local sy=sx and A.left(eE)if sy then aI.ends=cu+sy end if not sx then A.glazeFor,A.afterUntil=nil,z()+1.5 if not A.done[aI.id or"?"]then
A.done[aI.id or"?"],A.doneN=true,A.doneN+1 if A.doneN>400 then A.done,A.doneN={[aI.id or"?"]=true},1 end local BK=aI.before
task.spawn(function()pcall(A.finishedOne,aI,BK)end)end elseif aI.ends-cu>e.GlazeLead*3+60 or cu>aI.ends+90 then
A.glazeFor,A.afterUntil=nil,z()+1.5 A.later[aI.id or"?"]=z()+120 C(("station %s is not finishing yet (%s left) - glaze team off again"):format(eE.Name,A.clock(aI.ends-cu)))
end end if e.TeamGlaze~=""and not A.glazeFor then local BL=A.speedRatio(e.TeamGlaze)for Jn,cv in ipairs(A.list)do
if cv.sure and(cv.ends-cu)*BL[cv.long and 2 or 1]<=e.GlazeLead and z()>=(A.later[cv.id or"?"]or 0)and not A.done[cv.id or"?"]then
A.glazeFor=cv task.spawn(function()cv.before=A.glazeCount()end)break end end end local aJ,eF="",""local de=e.SnapGlaze~=false and q.snapAt and(q.snapAt-cu)
if de and de<-8 then q.snapAt,de=nil,nil end if e.TeamGlaze~=""and de and de<=20 then aJ,eF=e.TeamGlaze,(" - the admin snap finishes every wax in %ds"):format(math.max(0,math.floor(de)))
elseif e.TeamGlaze~=""and(A.glazeFor or z()<(A.afterUntil or 0))then aJ,eF=e.TeamGlaze,A.glazeFor and(" - station "..A.glazeFor.st.Name.." finishes soon")or""
elseif e.TeamWax~=""and(A.placing or A.aboutToPlace())then aJ,eF=e.TeamWax," - placing a butter"elseif e.TeamFull~=""and A.allBusy()then
aJ,eF=e.TeamFull," - every station is busy"else aJ=e.TeamNormal end A.want=aJ local eG=A.current()A.cur=eG if aJ~=""and eG~=aJ and z()>=(A.nextTry or 0)then
A.nextTry=z()+1.1 if A.equip(aJ)then C("team: "..aJ..eF)else A.nextTry=z()+3 end end local k9=A.list[1]A.msg=("on: %s%s | next wax done %s"):format(eG~=""and eG or"(not a saved team)",(aJ~=""and aJ~=eG)and(" -> "..aJ)or"",
k9 and("in "..A.clock(k9 .ends-cu).." (st "..k9 .st.Name..")")or"- none running")end function A.clock(bP)bP=math.max(0,math.floor(bP))
if bP>=3600 then return("%d:%02d:%02d"):format(math.floor(bP/3600),math.floor((bP%3600)/60),bP%60)end return("%d:%02d"):format(math.floor(bP/60),bP%60)
end function A.allBusy()local BM,BN=f0()return BN>0 and BM==0 end function A.aboutToPlace()if not c.running then return false end
local sz=ac()if not(sz and aN(sz))then return false end local BO=f0()return BO>0 end function A.mult(sA,BP,sB)return{(1+sA)*(1+sB),(1+sA+BP)*(1+sB)}end
function A.speedNow()local function k_(BQ)return tonumber(H:GetAttribute(BQ))or 0 end return A.mult(k_("PetWaxSpeed"),k_("PetLongWax"),k_("PetSocialWax"))
end function A.speedOf(BR)local BS,sC=A.teams()if not sC then return nil end for Jo,sD in ipairs(BS)do if sD.name==BR then
local la={}for Jp,BT in ipairs(sD.pets or{})do for Jq,sE in ipairs(sC.pets or{})do if tostring(sE.id)==tostring(BT)then la[#la+1]=sE break end end
end local sF=y.caps()local sG,BU=y.stats(la)return A.mult(math.min(sG.waxSpeed or 0,sF.waxSpeed or 0.25),math.min(sG.longWax or 0,sF.longWax or 0.3),BU.socialWax or 0)
end end return nil end function A.speedRatio(BV)local sH,lb=A.speedNow(),A.speedOf(BV)if not lb then return{1,1}end
return{sH[1]/lb[1],sH[2]/lb[2]}end function A.glazeSoon()return e.Teams and e.TeamGlaze~=""and(A.glazeFor~=nil or z()<(A.afterUntil or 0))
end y.CAPS={income=0.5,price=0.25,waxSpeed=0.25,offline=1,luck=3,waxStirPerMinute=30,cratePulls=4,glaze=0.25,glazeUp=0.5,headStart=0.4,cashGiftPerMinute=9,newFind=2,longWax=0.3}
y.ROUND={luck=true,luckyPull=true,crate=true,waxStir=true,socialLuck=true,cashGift=true}y.buildMsg,y.fuseMsg,y.fused,y.builds="","",0,0
function y.needFor(BW)local lc=o.info()if lc and type(lc.fuseNeed)=="function"then local BX,ld=pcall(lc.fuseNeed,H,BW or"")
if BX and tonumber(ld)and tonumber(ld)>=2 then return tonumber(ld)end end if H:GetAttribute("FusePass")==true or H:GetAttribute("FusePass4")==true then return 3 end
if H:GetAttribute("FusePass5")==true then return 5 end return 7 end function y.need()return y.needFor("")end function y.unit(sI)
if sI=="Huge"then return y.needFor("")*y.needFor("Big")end if sI=="Big"then return y.needFor("")end return 1 end
function y.nextOf(sJ)return(sJ==""and"Big")or(sJ=="Big"and"Huge")or nil end y.HCAPS={income=0.6,price=0.3,waxSpeed=0.3,offline=1.25,luck=4,waxStirPerMinute=36,cratePulls=3,glaze=0.3,
glazeUp=0.6,headStart=0.5,cashGiftPerMinute=11,newFind=2.5,longWax=0.4,rollSpeed=0.5}y.CAPKEY={luckyPull="luck",waxStir="waxStirPerMinute",cashGift="cashGiftPerMinute",crate="cratePulls"}
function y.hcaps()local le=o.info()return(le and type(le.HugeCaps)=="table")and le.HugeCaps or y.HCAPS end function y.cosmic()local lf=o.info()return(lf and type(lf.CosmicCaps)=="table")and lf.CosmicCaps or{StarWhale=0.1}end
function y.slots()local sK=o.data()return tonumber(sK and sK.slots)or(3+(tonumber(H:GetAttribute("PetEquipBought"))or 0))
end function y.caps()local lg=o.info()return(lg and type(lg.Caps)=="table")and lg.Caps or y.CAPS end function y.value(sL,cw)
local hb=o.info()local cx=hb and hb.Pets[sL]if not(cx and type(cx.boost)=="table")then return nil end local cy
if type(hb.boostValue)=="function"then local BY,BZ=pcall(hb.boostValue,sL,(cw~=""and cw)or nil)cy=BY and tonumber(BZ)or nil
end if not cy then local eH=cx.boost.value or 0 cy=eH if cw=="Big"or cw=="Huge"then local sM=eH*(cw=="Huge"and 1.75 or 1.5)
cy=y.ROUND[cx.boost.kind]and math.max(eH+(cw=="Huge"and 2 or 1),math.floor(sM+0.5))or sM if cw=="Huge"and y.ROUND[cx.boost.kind]then cy=math.max(cy,math.max(eH+1,math.floor(eH*1.5+0.5))+1)end
end end return cx.boost.kind,cy,cx.boost.every end function y.stats(B0)local cz,lh,sN,eI={},{},{},{}local B1=y.cosmic()
for Jr,df in ipairs(B0)do local au,eJ,sO=y.value(df.name,df.variant or"")if au then if df.variant=="Huge"then sN[y.CAPKEY[au]or au]=true end
if au:sub(1,6)=="social"then lh[au]=math.max(lh[au]or 0,eJ)elseif au=="waxStir"or au=="cashGift"then cz[au]=(cz[au]or 0)+eJ*60/(sO or 60)
elseif au=="luckyPull"then cz.luckyPull=(cz.luckyPull or 0)+eJ/(sO or 10)else cz[au]=(cz[au]or 0)+eJ if B1[df.name]then eI[au]=eI[au]or{}eI[au][df.name]=(eI[au][df.name]or 0)+eJ end
end end end return cz,lh,sN,eI end function y.glazeGain(B2,hc)local eK,li,Js={0.003,0.0005,0.0002},{1.5,2,2.5},nil
local B3=eK[1]+eK[2]+eK[3]local B4=tonumber(H:GetAttribute("GuildUpGlaze"))or 0 local dg={}for hd=1,3 do dg[hd]=eK[hd]+B2*eK[hd]/B3+(hd==1 and B4 or 0)end
local lj={dg[1]*(1-hc),dg[2]*(1-hc)+dg[1]*hc,dg[3]+dg[2]*hc}return lj[1]*(li[1]-1)+lj[2]*(li[2]-1)+lj[3]*(li[3]-1)
end function y.score(he,B5)local B6,B7,B8=y.caps(),y.hcaps(),y.cosmic()local hf,hg,B9,sP=y.stats(B5)local function lk(ll)return(B9[ll]and B7[ll])or B6[ll]or math.huge end
local function bo(hh)local lm,ln=hf[hh]or 0,lk(hh)local lo=math.min(lm,ln)if sP[hh]and lm>ln then local lp=0 for B_,Ca in pairs(sP[hh])do lp=lp+math.min(Ca,B8[B_]or 0)end
lo=lo+math.min(lm-ln,lp)end return lo end local Cb=(1+bo("income"))*(1+(hg.socialIncome or 0))*(1+math.min(hf.cashGift or 0,lk("cashGiftPerMinute"))/60)
local Cc=1+bo("luck")+(hf.luckyPull or 0)+(hg.socialLuck or 0)local sQ=Cc*(1+bo("newFind"))*(1+bo("rollSpeed"))
local eL=math.log(Cb)local Cd=math.max(tonumber(H:GetAttribute("WaxStations"))or 18,1)local lq=(1+bo("waxSpeed")+bo("longWax"))*(1+(hg.socialWax or 0))
+math.min(hf.waxStir or 0,lk("waxStirPerMinute"))/60/Cd local Ce=1-(1-bo("headStart"))*(1-(hg.socialHeadStart or 0))
if he=="farm"then return eL+0.7*math.log(sQ)+0.1*math.log(lq)end if he=="full"then return eL+0.4*math.log(lq)+0.02*math.log(sQ)end
if he=="glaze"then return y.glazeGain(bo("glaze"),bo("glazeUp"))+0.001*eL end if he=="wax"then return-math.log(1-0.5*Ce)+0.001*eL+0.001*math.log(lq)end
return eL end function y.kinds(Cf)local sR,lr={},{}for Jt,eM in ipairs(Cf)do local sS=eM.name.."|"..(eM.variant or"")
local bQ=sR[sS]if not bQ then bQ={name=eM.name,variant=eM.variant or"",n=0,ids={}}sR[sS]=bQ lr[#lr+1]=bQ end bQ.n=bQ.n+1
bQ.ids[#bQ.ids+1]=eM.id end return lr end function y.bestKinds(sT,cA,Cg,sU)local aB,bR={},{}local function ls(Ch)
local sV,lt={},{}for Ci,lu in ipairs(Ch)do sV[Ci]=cA[lu]lt[lu]=(lt[lu]or 0)+1 end local lv=y.score(sT,sV)if sU then for Cj,Ck in pairs(lt)do lv=lv+1e-7*math.min(Ck,sU[Cj]or 0)end end
return lv end for Ju=1,Cg do local eN,lw for hi=1,#cA do if(bR[hi]or 0)<cA[hi].n then aB[#aB+1]=hi local sW=ls(aB)
aB[#aB]=nil if not lw or sW>lw+1e-12 then eN,lw=hi,sW end end end if not eN then break end bR[eN]=(bR[eN]or 0)+1
aB[#aB+1]=eN if#cA>40 then task.wait()end end for Jv=1,6 do task.wait()local sX,sY=false,ls(aB)for lx=1,#aB do
for dh=1,#cA do local hj=aB[lx]if dh~=hj and(bR[dh]or 0)<cA[dh].n then aB[lx]=dh local sZ=ls(aB)if sZ>sY+1e-9 then bR[hj],bR[dh],sY,sX=bR[hj]-1,(bR[dh]or 0)+1,sZ,true
else aB[lx]=hj end end end end if not sX then break end end local s0={}for Cl,Cm in ipairs(aB)do s0[Cl]=cA[Cm]end
return aB,y.score(sT,s0)end function y.best(Cn,Co,Cp,hk)hk=hk or{}local ly=y.kinds(Co)local lz={}for s1,Cq in ipairs(ly)do for Jw,Cr in ipairs(Cq.ids)do if hk[tostring(Cr)]then lz[s1]=(lz[s1]or 0)+1 end end end
local Cs,Ct=y.bestKinds(Cn,ly,Cp,lz)local lA,lB={},{}for Jx,Cu in ipairs(Cs)do local s2,eO=ly[Cu],nil for Jy,lC in ipairs(s2 .ids)do if hk[tostring(lC)]and not lA[lC]then eO=lC break end end
if not eO then for Jz,s3 in ipairs(s2 .ids)do if not lA[s3]then eO=s3 break end end end lA[eO]=true lB[#lB+1]=tostring(eO)
end return lB,Ct end function y.dream()local s4=o.info()if not(s4 and type(s4 .Pets)=="table")then return nil end
local lD=y.slots()local s5=y.needFor("").."|"..y.needFor("Big").."|"..lD.."|"..e.TeamNormal..e.TeamFull..e.TeamGlaze..e.TeamWax
if y.dreamSig==s5 and y.dreamT then return y.dreamT end if y.dreaming then return y.dreamT end y.dreaming=true
local CA=pcall(function()local hl={}for JA,Cv in ipairs(o.order())do for JB,Cw in ipairs({"","Big","Huge"})do hl[#hl+1]={name=Cv,variant=Cw,n=lD,ids={}}end
end local eP,lE={},{}for JC,hm in ipairs(y.ROLES)do if e[hm[1]]~=""then local Cx,Cy=y.bestKinds(hm[2],hl,lD)local lF,hn={},{}
for JD,s6 in ipairs(Cx)do lF[s6]=(lF[s6]or 0)+1 end for Cz,lG in pairs(lF)do local bS=hl[Cz]eP[bS.name]=eP[bS.name]or{[""]=0,Big=0,Huge=0}
eP[bS.name][bS.variant]=math.max(eP[bS.name][bS.variant],lG)hn[#hn+1]=(lG>1 and(lG.."x ")or"")..o.nice(bS.name,bS.variant)
end table.sort(hn)lE[#lE+1]={role=hm[2],team=e[hm[1]],names=hn,score=Cy}end end y.dreamT,y.dreamTeams,y.dreamSig=eP,lE,s5
end)y.dreaming=false if not CA then y.dreamSig=nil end return y.dreamT end function y.owned(ho)local s7,lH={},{}
for JE,CB in ipairs(ho and ho.arriving or{})do s7[tostring(CB)]=true end for JF,cB in ipairs(ho and ho.pets or{})do
if not s7[tostring(cB.id)]then lH[#lH+1]={id=tostring(cB.id),name=cB.name,variant=cB.variant or"",named=cB.named or(cB.nickname and cB.nickname~="")}
end end return lH end function y.have(s8,CC,CD)local a9={[""]=0,Big=0,Huge=0}local s9={}for JG,eQ in ipairs(y.owned(CC))do
s9[eQ.id]=true if eQ.name==s8 and a9[eQ.variant]then a9[eQ.variant]=a9[eQ.variant]+1 end end if CD then for JH,di in ipairs(o.recent or{})do
if di.name==s8 and not s9[di.id]and z()-di.at<20 and a9[di.variant or""]then a9[di.variant or""]=a9[di.variant or""]+1 end
end end return a9,a9[""]+a9 .Big*y.unit("Big")+a9 .Huge*y.unit("Huge")end function y.goal(s_)local ta=e.Pets[s_]
if ta and tonumber(ta.f)==-1 then return nil,0 end local tb=y.dream()local eR=tb and tb[s_]if not eR then return nil,0 end
return eR,eR[""]+eR.Big*y.unit("Big")+eR.Huge*y.unit("Huge")end function y.wantMore(lI,JI,td)if not td then return true end
local te=e.Pets[lI]if te and tonumber(te.f)==-1 then return true end local CE,CG=y.goal(lI)if not CE then return true end
local JJ,CH=y.have(lI,td,true)return CH<CG+y.need()end function y.status(eS,tf)if not tf then return nil end local th=e.Pets[eS]
if th and tonumber(th.f)==-1 then return"KEEP: never fused"end local cC,ti=y.goal(eS)if not cC then return y.dream()and"in no best team: bought as ticked"or nil end
local lJ,CI=y.have(eS,tf)local cD={}if cC.Huge>0 then cD[#cD+1]=("Huge %d/%d"):format(lJ.Huge,cC.Huge)end if cC.Big>0 then cD[#cD+1]=("Big %d/%d"):format(lJ.Big,cC.Big)end
if cC[""]>0 then cD[#cD+1]=("plain %d/%d"):format(lJ[""],cC[""])end local CJ=y.blocked and y.blocked[eS]and(" | "..y.blocked[eS])or""
return("%s | %d/%d copies%s"):format(table.concat(cD," "),math.min(CI,ti),ti,CJ)end function y.wear(lK)local lL={}
for JK,CK in ipairs(lK)do lL[tostring(CK)]=true end for JL=1,3 do local dj=o.data()if not dj then return false end
for JM,tj in ipairs(dj.equipped or{})do if not lL[tostring(tj)]then o.call("unequip",tj)task.wait(0.3)end end
dj=o.data()local tk={}for JN,CL in ipairs(dj.equipped or{})do tk[tostring(CL)]=true end for JO,tl in ipairs(lK)do
if not tk[tostring(tl)]then o.call("equip",tl)task.wait(0.3)end end task.wait(0.4)dj=o.data()local lM,tm=0,true
for JP,CM in ipairs(dj.equipped or{})do lM=lM+1 if not lL[tostring(CM)]then tm=false end end if tm and lM==#lK then return true end
end return false end function y.saveTeam(tn,to)if not y.wear(to)then return false,"could not put the pets on"end
local CN=A.teams()local cE for CO,CP in ipairs(CN)do if CP.name==tn then cE=CO break end end local dk if cE then
dk=o.call("teamSave",cE)else dk=o.call("teamNew")if type(dk)=="table"and dk.ok and dk.index then cE=dk.index task.wait(0.3)
o.call("teamRename",{index=cE,name=tn})end end task.wait(0.4)local lN=o.data()local tp=lN and lN.teams and cE and lN.teams[cE]
if not tp then return false,"the game did not save it"end local tq={}for JQ,CQ in ipairs(tp.pets or{})do tq[tostring(CQ)]=true end
for JR,CS in ipairs(to)do if not tq[tostring(CS)]then return false,"saved, but not with these pets"end end return true
end y.ROLES={{"TeamNormal","farm"},{"TeamFull","full"},{"TeamGlaze","glaze"},{"TeamWax","wax"}}function y.quiet()
if A.placing or A.glazeSoon()then return false end local CT=o.srv()for JS,CU in ipairs(A.list or{})do if CU.ends-CT<(e.GlazeLead or 45)+90 then return false end end
return true end function y.plan()local eT=o.data()if not eT then return{}end local tr={}for JT,CV in ipairs(eT.arriving or{})do tr[tostring(CV)]=true end
local eU={}for JU,hp in ipairs(eT.pets or{})do if not tr[tostring(hp.id)]then eU[#eU+1]={id=tostring(hp.id),name=hp.name,variant=hp.variant or""}end
end local ts={}for JV,tt in ipairs(eU)do ts[tt.id]=tt end local tu=tonumber(eT.slots)or 3 local lO,tv={},{}for JW,hq in ipairs(y.ROLES)do
local eV=e[hq[1]]if eV~=""and not tv[eV]then tv[eV]=true local lP,eW,tw={},{},false for JX,tx in ipairs(eT.teams or{})do
if tx.name==eV then for JY,CW in ipairs(tx.pets or{})do local lQ=ts[tostring(CW)]if lQ then lP[lQ.id]=true eW[#eW+1]=lQ else tw=true end
end end end local lR,ty=y.best(hq[2],eU,tu,lP)local tz=y.score(hq[2],eW)local tA=#lR==#eW for JZ,CX in ipairs(lR)do if not lP[CX]then tA=false end end
if not tA and(tw or#eW<math.min(tu,#eU)or ty>tz+1e-4)then lO[#lO+1]={team=eV,role=hq[2],ids=lR,gain=ty-tz}end
end end return lO end function y.rebuild(CY)local tB=y.plan()if#tB==0 then y.buildMsg="teams are already the best your pets allow"return true end
if not y.quiet()then y.buildMsg="a wax finishes soon - rebuilding the teams after it"return false end A.editing,A.editingSince=true,z()
local hr=true local C2,C3=pcall(function()for J0,eX in ipairs(tB)do local CZ,C0=y.saveTeam(eX.team,eX.ids)local tC=o.data()
local lS={}for J1,C1 in ipairs(eX.ids)do for J2,lT in ipairs(tC and tC.pets or{})do if tostring(lT.id)==C1 then lS[#lS+1]=o.nice(lT.name,lT.variant)end
end end if CZ then C(("TEAM %s rebuilt (%s): %s"):format(eX.team,CY or"pets changed",table.concat(lS,", ")))else hr=false C(("TEAM %s: %s"):format(eX.team,tostring(C0)))end
end end)A.editing,A.nextTry=false,0 if not C2 then hr=false C("TEAM BUILD ERR "..tostring(C3))end y.builds=y.builds+1
y.buildMsg=hr and("teams rebuilt "..os.date("%H:%M"))or"a team could not be saved - see the log"return hr end
function y.roleScores(tD)local bT={}for J3,tE in ipairs(tD)do bT[#bT+1]=tE.name..tE.variant end table.sort(bT)
bT=table.concat(bT,",")y.rsCache=y.rsCache or{}if y.rsCache[bT]then return y.rsCache[bT]end local C4,C5,lU=y.kinds(tD),y.slots(),{}
for J4,lV in ipairs(y.ROLES)do if e[lV[1]]~=""then local J5,C6=y.bestKinds(lV[2],C4,C5)lU[lV[2]]=C6 end end y.rsN=(y.rsN or 0)+1
if y.rsN>40 then y.rsCache,y.rsN={},0 end y.rsCache[bT]=lU return lU end function y.noLoss(tF,C7,C8,C9)local tG,eY={},{}
for J6,C_ in ipairs(C7)do tG[C_]=true end for J7,tH in ipairs(tF)do if not tG[tH.id]then eY[#eY+1]=tH end end
eY[#eY+1]={id="new",name=C8,variant=C9}local Da,tI=y.roleScores(tF),y.roleScores(eY)local tJ=false for lW,tK in pairs(Da)do
if(tI[lW]or-math.huge)<tK-1e-6 then return false,lW end if(tI[lW]or 0)>tK+1e-6 then tJ=true end end return true,tJ
end y.ROLENAME={farm="farm",full="full",glaze="glaze",wax="wax"}function y.fuseTick()if not e.AutoFuse or A.editing then return end
local eZ=o.data()if not eZ then return end local tL=y.owned(eZ)local hs,e0={},{}for J8,Db in ipairs(eZ.teams or{})do for J9,Dc in ipairs(Db.pets or{})do hs[tostring(Dc)]=true end end
for J_,Dd in ipairs(eZ.equipped or{})do e0[tostring(Dd)]=true end y.failUntil,y.blocked=y.failUntil or{},{}for Ka,aK in ipairs(o.order())do
local ht=y.goal(aK)if ht then local lX=y.have(aK,eZ)for Kb,bp in ipairs({"Big",""})do local dl,lY=y.nextOf(bp),y.needFor(bp)
local De=(bp=="Big"and lX.Huge<ht.Huge)or(bp==""and lX.Big<ht.Big+y.needFor("Big")*math.max(0,ht.Huge-lX.Huge))
local e1={}for Kc,lZ in ipairs(tL)do if lZ.name==aK and lZ.variant==bp then e1[#e1+1]=lZ end end if De and#e1>=lY and z()>=(y.failUntil[aK..bp]or 0)then
table.sort(e1,function(hu,hv)local tM=(e0[hu.id]and 4 or 0)+(hs[hu.id]and 2 or 0)+(hu.named and 1 or 0)local tN=(e0[hv.id]and 4 or 0)+(hs[hv.id]and 2 or 0)+(hv.named and 1 or 0)
if tM~=tN then return tM<tN end return hu.id<hv.id end)local cF,l0,tO={},{},false for dm=1,lY do cF[dm]=e1[dm].id
if e0[cF[dm]]then l0[#l0+1]=cF[dm]end if e0[cF[dm]]or hs[cF[dm]]then tO=true end end local Df,tP=y.noLoss(tL,cF,aK,dl)
if not Df then y.blocked[aK]=("%s waits: it would weaken the %s team now"):format(dl,y.ROLENAME[tP]or tostring(tP))
elseif tO and not y.quiet()then y.blocked[aK]=dl.." fuse waits for a quiet moment"y.fuseMsg=("%s %s waits: a wax finishes soon"):format(dl,o.nice(aK))
return else A.editing,A.editingSince=true,z()for Kd,Dg in ipairs(l0)do o.call("unequip",Dg)task.wait(0.3)end local hw=o.call("fuse",{ids=cF})
A.editing,A.nextTry=false,0 if type(hw)=="table"and hw.ok then y.fused=y.fused+1 y.dirtyAt=z()C(("FUSED %d %s -> %s"):format(lY,o.nice(aK,bp),o.nice(aK,dl)))
y.fuseMsg=("fused a %s %s"):format(o.nice(aK,dl),os.date("%H:%M"))else y.failUntil[aK..bp]=z()+120 C(("fuse %s failed: %s"):format(o.nice(aK,bp),type(hw)=="table"and tostring(hw.reason or"no reason given")or"no answer"))
end return end end end end end end function y.tick()pcall(y.fuseTick)if not e.AutoBuild or not e.Teams then return end
local tQ=o.data()if not tQ then return end local cG={}for Ke,Dh in ipairs(tQ.pets or{})do cG[#cG+1]=tostring(Dh.id)end
table.sort(cG)cG=table.concat(cG,",")if cG~=y.sig then y.sig,y.dirtyAt=cG,z()end local Di=(y.dirtyAt and z()-y.dirtyAt>8)or z()-(y.lastBuild or 0)>900
if Di and not A.editing then local Dj=y.rebuild(y.dirtyAt and"pets changed"or"check")if Dj then y.dirtyAt,y.lastBuild=nil,z()end
end end d.bb,d.fx,d.post,d.hud=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"}),{},{}d.watch=setmetatable({},{__mode="k"})
d.mem,d.memPeak,d.fps=0,0,0 function d.isFx(cH)return cH:IsA("ParticleEmitter")or cH:IsA("Trail")or cH:IsA("Beam")or cH:IsA("Fire")or cH:IsA("Smoke")
or cH:IsA("Sparkles")or cH:IsA("Light")end function d.muteOne(bq)if not e.Lite or not bq.Parent then return end
local hx=(bq:IsA("BillboardGui")and d.bb)or(d.isFx(bq)and d.fx)or nil if not hx or hx[bq]~=nil then return end
if hx==d.fx and d.gameLow and not bq:IsA("Beam")then return end hx[bq]=bq.Enabled if bq.Enabled then bq.Enabled=false end
end function d.sweep()if d.sweeping then return end d.sweeping=true pcall(d.sweepRun)d.sweeping=false end function d.sweepRun()
local l1={}for Kf,Dk in ipairs({d.bb,d.fx})do for Dl in pairs(Dk)do l1[#l1+1]=Dl end end local tR=os.clock()for Dm,e2 in ipairs(l1)do
if e.Lite and e2 .Parent and e2 .Enabled then local Dn=d.bb[e2]~=nil and d.bb or d.fx Dn[e2]=true e2 .Enabled=false
end if Dm%200==0 and os.clock()-tR>0.002 then task.wait()tR=os.clock()end end end function d.lite(tS)e.Lite=tS
if tS then task.spawn(function()for Do,Dp in ipairs(am:GetDescendants())do if not e.Lite then return end pcall(d.muteOne,Dp)
if Do%600==0 then task.wait()end end end)if not d.addConn then d.queue,d.muteI={},1 d.addConn=T(am.DescendantAdded:Connect(function(l2)
if e.Lite and(l2:IsA("BillboardGui")or d.isFx(l2))then d.queue[#d.queue+1]=l2 end end))end local l3=game:GetService("Lighting")
for Kg,e3 in ipairs(l3:GetChildren())do if e3:IsA("PostEffect")and e3 .Enabled and d.post[e3]==nil then d.post[e3]=true e3 .Enabled=false end
end pcall(function()d.oldShadows=d.oldShadows==nil and l3 .GlobalShadows or d.oldShadows l3 .GlobalShadows=false end)
pcall(function()d.oldDeco=d.oldDeco==nil and am.Terrain.Decoration or d.oldDeco am.Terrain.Decoration=false end)
task.spawn(d.extras,true)else d.extras(false)for Kh,Dq in pairs(d.watch)do pcall(function()Dq:Disconnect()end)end
for tT,Dr in pairs(d.bb)do pcall(function()if tT.Parent then tT.Enabled=Dr end end)end for tU,Ds in pairs(d.fx)do pcall(function()if tU.Parent then tU.Enabled=Ds end end)end
for tV in pairs(d.post)do pcall(function()if tV.Parent then tV.Enabled=true end end)end d.bb,d.fx=setmetatable({},{__mode="k"}),setmetatable({},{__mode="k"})
d.watch,d.post,d.queue,d.muteI=setmetatable({},{__mode="k"}),{},{},1 local Dt=game:GetService("Lighting")if d.oldShadows~=nil then pcall(function()Dt.GlobalShadows=d.oldShadows end)d.oldShadows=nil end
if d.oldDeco~=nil then pcall(function()am.Terrain.Decoration=d.oldDeco end)d.oldDeco=nil end end end function d.fxPatch(tW)
local Du,l4=pcall(function()return require(af:FindFirstChild("Packages"):FindFirstChild("ClientEffects"))end)
if not Du or type(l4)~="table"then return end if tW and not d.ceOld then d.ceOld={}for Ki,tX in ipairs({"Fireworks","Confetti"})do
local hy=l4[tX]if type(hy)=="table"and type(hy.Play)=="function"then d.ceOld[tX]=hy.Play pcall(function()hy.Play=function()return{Pieces={},Destroyed=true,Destroy=function()end}end end)
end end elseif not tW and d.ceOld then for Dv,Dw in pairs(d.ceOld)do pcall(function()l4[Dv].Play=Dw end)end d.ceOld=nil
end end function d.topsFind()if d.tc then return d.tc end if type(getgc)~="function"or type(hookfunction)~="function"then return nil end
local l5,hz for Kj,e4 in ipairs(getgc(false))do if type(e4)=="function"and(type(islclosure)~="function"or islclosure(e4))then
local Dx,tY,tZ=pcall(debug.info,e4,"sn")if Dx and type(tY)=="string"and tY:find("ToppingCullHandler",1,true)then
if tZ=="poll"then l5=e4 elseif tZ=="retarget"then hz=e4 end end end end if not(l5 and hz)then return nil end local Dy,hA=pcall(debug.getupvalues,hz)
local t0=Dy and type(hA)=="table"and hA[3]if type(t0)~="function"or debug.info(t0,"n")~="targetFor"or(hA[1]~=nil and type(hA[1])~="number")then return nil end
d.tc={poll=l5,re=hz}return d.tc end function d.tops(t1)local aP=d.topsFind()if not aP then return false end if t1 and not aP.old then
local Dz,DA=pcall(hookfunction,aP.poll,function()end)if not Dz then return false end aP.old=DA pcall(debug.setupvalue,aP.re,1,-1000)
pcall(aP.re)elseif not t1 and aP.old then local DB=type(restorefunction)=="function"and pcall(restorefunction,aP.poll)
if not DB then pcall(hookfunction,aP.poll,aP.old)end aP.old=nil pcall(aP.poll)end return true end d.lit,d.boardsOff={},{}
function d.lights(DC)local t2=am:FindFirstChild("Plots")local t3=os.clock()if DC then for Kk,DD in ipairs(t2 and t2:GetChildren()or{})do
local t4=DD:FindFirstChild("SkinProps")local t5=t4 and t4:FindFirstChild("FairyLights")for Kl,t6 in ipairs(t5 and t5:GetChildren()or{})do
for Km,e5 in ipairs(t6:GetChildren())do if e5:IsA("BasePart")and(e5 .Name=="Bulb"or e5 .Name=="Wire")then d.lit[e5]=t6 e5 .Parent=nil end
end if os.clock()-t3>0.002 then task.wait()t3=os.clock()end end end for Kn,DE in ipairs({"Leaderboards","ClanBoard"})do
local l6=am:FindFirstChild(DE)if l6 then d.boardsOff[l6]=true l6 .Parent=nil end end else for DF,t7 in pairs(d.lit)do pcall(function()if t7 .Parent then DF.Parent=t7 end end)end
for t8 in pairs(d.boardsOff)do pcall(function()if not t8 .Parent then t8 .Parent=am end end)end d.lit,d.boardsOff={},{}
end end d.reel={}function d.rollFx(DG)if DG then local t9=af:FindFirstChild("Remotes")local t_=t9 and t9:FindFirstChild("SquishyRollAnimation")
if not t_ or type(getconnections)~="function"then return end local DH,DI=pcall(getconnections,t_.OnClientEvent)
for Ko,hB in ipairs(DH and DI or{})do local l7=""pcall(function()l7=debug.info(hB.Function,"s")end)if type(l7)=="string"and l7:find("SquishyHandler",1,true)and not d.reel[hB]then
if pcall(function()hB:Disable()end)then d.reel[hB]=true end end end else for DJ in pairs(d.reel)do pcall(function()DJ:Enable()end)end
d.reel={}end end d.quiet={}function d.quietPlots(DK)if not DK then for Kp,DL in pairs(d.quiet)do pcall(function()DL:Enable()end)end
d.quiet={}return end if type(getconnections)~="function"then return end local function l8(DM,DN)local DO,DP=pcall(getconnections,DM)
for Kq,hC in ipairs(DO and DP or{})do local l9=""pcall(function()l9=debug.info(hC.Function,"s")end)local l_=hC.Function
if l_ and type(l9)=="string"and l9:find(DN,1,true)and not d.quiet[l_]then if pcall(function()hC:Disable()end)then d.quiet[l_]=hC end
end end end local ua=am:FindFirstChild("Plots")for Kr,hD in ipairs(ua and ua:GetChildren()or{})do if hD~=c.plot then
l8(hD:GetAttributeChangedSignal("StackBandScale"),"ToppingCullHandler")local ub,uc=hD:FindFirstChild("WaxStations"),hD:FindFirstChild("SquishyStack")
if ub then l8(ub.DescendantAdded,"LocalToppingsHandler")end if uc then l8(uc.ChildAdded,"LocalToppingsHandler")end
end end end function d.litPrune()for ud,DQ in pairs(d.lit)do if not DQ:IsDescendantOf(game)then d.lit[ud]=nil pcall(function()ud:Destroy()end)end
end end function d.passText()local av=function(DR)return H:GetAttribute(DR)end local ma={}local function bU(DS,DT)ma[#ma+1]=(DS and"[x] "or"[  ] ")..DT end
bU(av("VIP")==true,"VIP: money x1.5, offline +50%")bU(av("AutoRoll")==true,"Auto Roll: the farm sets what it stops on"..(av("AutoRoll")==true and""or" (without it nothing rolls: the farm never pulls)"))
local DU=av("SuperFastWax")==true and"Super Fast Wax: waxes take half the time"or(av("FastWax")==true and"Fast Wax: waxes take 2/3 of the time")or"Fast Wax / Super Fast Wax: no"
bU(av("FastWax")==true or av("SuperFastWax")==true,DU.." (the farm times by the game's own timers)")local ue=(av("FusePass")==true and"Fuse Pass")or(av("FusePass4")==true and"Fuse Pass 4")or(av("FusePass5")==true and"Fuse Pass 5")or nil
bU(ue~=nil,("%s: %d per fuse, %d Bigs -> Huge"):format(ue or"Fuse pass",y.needFor(""),y.needFor("Big")))local hE=o.data()
local DV=tonumber(hE and hE.maxOwned)or 60 bU(av("PetInventory50")==true or av("PetInventory100")==true,("Pet bag: %d / %d pets%s"):format(hE and#(hE.pets or{})or 0,DV,(av("PetInventory50")==true and av("PetInventory100")==true)and" (both bag passes)"or""))
local uf=tonumber(av("PetEquipBought"))or 0 bU(uf>0,("Pet slots: %d worn (%d of 3 extra slots bought)"):format(y.slots(),uf))
local ug=tonumber(av("PetWishCredits"))or 0 if ug>0 then bU(true,("%d free wishes: used before cash"):format(ug))end
local uh=tonumber(av("FinishAllCredits"))or 0 if uh>0 then bU(true,("%d finish-all credits (yours to use)"):format(uh))end
return table.concat(ma,"\n")end function d.extras(hF)pcall(d.quietPlots,hF and c.plot~=nil)pcall(d.fxPatch,hF)
pcall(d.tops,hF)pcall(d.lights,hF)end d.MINE={SABFarmGui=true,SABToggle=true,SABError=true,SAB_Bridge=true}function d.hideHud(ui)
e.HideHud=ui local mb=H:FindFirstChildOfClass("PlayerGui")if not mb then return end if ui then for Ks,e6 in ipairs(mb:GetChildren())do
if e6:IsA("ScreenGui")and not d.MINE[e6 .Name]and e6 .Enabled then d.hud[e6]=true e6 .Enabled=false end end if not d.hudConn then
d.hudConn=T(mb.ChildAdded:Connect(function(e7)if e.HideHud and e7:IsA("ScreenGui")and not d.MINE[e7 .Name]then
task.defer(function()if e.HideHud and e7 .Enabled then d.hud[e7]=true e7 .Enabled=false end end)end end))end else
for uj in pairs(d.hud)do pcall(function()if uj.Parent then uj.Enabled=true end end)end d.hud={}end end d.CAPS={0,30,15,10}
function d.cap(mc)e.FpsCap=mc local uk=(type(setfpscap)=="function"and setfpscap)or(type(set_fps_cap)=="function"and set_fps_cap)
if not uk then return false end return pcall(uk,mc==0 and 60 or mc)end d.unseen=setmetatable({},{__mode="k"})
function d.hideOne(ao)if ao:IsA("BasePart")or ao:IsA("Decal")or ao:IsA("Texture")then if ao.Transparency<1 then d.unseen[ao]=ao.Transparency ao.Transparency=1 end
elseif ao:IsA("BillboardGui")or ao:IsA("SurfaceGui")or ao:IsA("ParticleEmitter")or ao:IsA("Beam")or ao:IsA("Trail")or ao:IsA("Light")or ao:IsA("Fire")or ao:IsA("Smoke")or ao:IsA("Sparkles")then
if ao.Enabled then d.unseen[ao]=true ao.Enabled=false end end end function d.notMine(DW)return e.HideMine or(c.plot and not DW:IsDescendantOf(c.plot))end
d.hideQ,d.hideI={},1 d.dropQ,d.dropI,d.dropped,d.dropSeen={},1,0,setmetatable({},{__mode="k"})function d.dropIt(hG)
local md=hG.Parent local me=md and md.Name=="SquishyStack"and md.Parent if me and me~=c.plot and c.plot and me.Parent==c.plot.Parent and not d.dropSeen[hG]then
d.dropSeen[hG]=true d.dropQ[#d.dropQ+1]={hG,z()+3}end end function d.dropScan()local ul=c.plot and c.plot.Parent
if not(e.HideBases and ul)then return end for Kt,um in ipairs(ul:GetChildren())do local uo=um~=c.plot and um:FindFirstChild("SquishyStack")
for Ku,DX in ipairs(uo and uo:GetChildren()or{})do d.dropIt(DX)end end end function d.dropStep(DY)local mf=d.dropQ
while d.dropI<=#mf and os.clock()-DY<0.003 do local mg=mf[d.dropI]if mg[2]>z()then break end d.dropI=d.dropI+1
if e.HideBases and mg[1].Parent then pcall(function()mg[1]:Destroy()end)d.dropped=d.dropped+1 end end if d.dropI>#mf then d.dropQ,d.dropI={},1 end
end function d.hideStep()local mh=os.clock()local e8=d.queue if e.Lite and e8 and#e8>0 then d.muteI=d.muteI or 1
while d.muteI<=#e8 and os.clock()-mh<0.0015 do pcall(d.muteOne,e8[d.muteI])d.muteI=d.muteI+1 end if d.muteI>#e8 then d.queue,d.muteI={},1 end
end if d.dropI<=#d.dropQ then pcall(d.dropStep,mh)end local hH=d.hideQ if d.hideI>#hH then return end while d.hideI<=#hH and os.clock()-mh<0.004 do
local mi=hH[d.hideI]d.hideI=d.hideI+1 if e.HideBases and mi.Parent and d.notMine(mi)then pcall(d.hideOne,mi)end
end if d.hideI>#hH then d.hideQ,d.hideI={},1 end end d.BASES={[0]="BASES: ALL DRAWN","BASES: OTHERS HIDDEN","BASES: ALL HIDDEN"}
function d.basesMode()return e.HideBases and(e.HideMine and 2 or 1)or 0 end function d.setBases(up)if e.HideBases then d.bases(false)end
e.HideMine=up==2 if up>0 then d.bases(true)end end function d.bases(uq)e.HideBases=uq local mj=am:FindFirstChild("Plots")
if not mj then return end if uq then task.spawn(function()local mk=0 for Kv,hI in ipairs(mj:GetChildren())do local ur=hI~=c.plot and c.plot and hI:FindFirstChild("SquishyStack")
for Kw,DZ in ipairs(ur and ur:GetChildren()or{})do d.dropIt(DZ)end if hI~=c.plot or e.HideMine then for Kx,D0 in ipairs(hI:GetDescendants())do
if not e.HideBases then return end pcall(d.hideOne,D0)mk=mk+1 if mk%600==0 then task.wait()end end end end end)
if not d.basesConn then d.basesConn=T(mj.DescendantAdded:Connect(function(dn)if e.HideBases and d.notMine(dn)then
pcall(d.hideOne,dn)d.hideQ[#d.hideQ+1]=dn if dn.Parent and dn.Parent.Name=="SquishyStack"then d.dropIt(dn)end
end end))end else for ml,us in pairs(d.unseen)do pcall(function()if not ml.Parent then return end if type(us)=="number"then ml.Transparency=us else ml.Enabled=true end
end)end d.unseen=setmetatable({},{__mode="k"})end end function d.render(ut)e.NoRender=ut pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(not ut)end)
end d.CALM={"LocalScript.SquishyHandler","LocalScript.GlazeHandler","LocalScript.ConveyorHandler","LocalScript.DeckHandler",
"PetHandler.Walker","PetHandler.Meadow","FloorTeleportHandler.SignDodge","BaseSkinHandler.Cannon","BaseSkinHandler.TeleportPads"}
d.calmed,d.calmedF={},setmetatable({},{__mode="k"})function d.calmScan()if not e.Calm or type(getconnections)~="function"then return 0 end
local D1=game:GetService("RunService")local mm=0 for Ky,D2 in ipairs({"RenderStepped","Heartbeat","Stepped"})do
local D3,uu=pcall(function()return D1[D2]end)local uv,mn=false,nil if D3 and uu then uv,mn=pcall(getconnections,uu)end
if uv and type(mn)=="table"then for Kz,hJ in ipairs(mn)do local mo=""pcall(function()local uw=getfenv(hJ.Function).script mo=uw and uw:GetFullName()or""end)
if mo~=""then for KA,D4 in ipairs(d.CALM)do if mo:find(D4,1,true)then local mp=hJ.Function if mp and not d.calmedF[mp]and pcall(function()hJ:Disable()end)then
d.calmedF[mp]=true d.calmed[#d.calmed+1]=hJ mm=mm+1 end break end end end end end end if#d.calmed>200 then local mq={}for D5=#d.calmed-49,#d.calmed do mq[#mq+1]=d.calmed[D5]end d.calmed=mq
end return mm end function d.calm(ux)e.Calm=ux if ux then local D6=d.calmScan()C(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(D6))
else for KB,D7 in ipairs(d.calmed)do pcall(function()D7:Enable()end)end d.calmed,d.calmedF={},setmetatable({},{__mode="k"})
end end function d.restoreAll()pcall(d.unpin)pcall(d.calm,false)if e.HideBases then pcall(d.bases,false)end if F.arPaused then pcall(F.resume,"script stopped")end
pcall(d.lite,false)pcall(d.hideHud,false)pcall(function()game:GetService("RunService"):Set3dRenderingEnabled(true)end)
if(e.FpsCap or 0)~=0 then pcall(d.cap,0)end end function d.rejoinSame(uy)if c.rejoining then return end C("REJOIN this server ("..uy..")")
pcall(f3)if c.autoload then pcall(gt,c.autoload)end pU()local D8=pcall(function()game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,H)
end)task.delay(25,function()if c.alive then d6(uy..", same server failed")end end)return D8 end function d.tick()
if e.Lite then task.spawn(d.sweep)end if e.HideBases and z()-(d.dropAt or 0)>5 then d.dropAt=z()pcall(d.dropScan)end
if e.Lite and z()-(d.extraAt or 0)>5 then d.extraAt=z()d.gameLow=H:GetAttribute("GraphicsLow")==true pcall(d.litPrune)
pcall(d.lights,true)pcall(d.fxPatch,true)if c.plot then pcall(d.quietPlots,true)end if not next(d.reel)then pcall(d.rollFx,true)end
if not(d.tc and d.tc.old)and z()-(d.topsTry or-100)>60 then d.topsTry=z()pcall(d.tops,true)end end local uz=e.Lite and c.plot and c.plot:FindFirstChild("WaxStations")
if uz then for KC,D9 in ipairs(uz:GetChildren())do local uA=D9:FindFirstChild("SquishyPlaceHolder")local cI=uA and uA:FindFirstChild("TimerGui")
if cI and cI:IsA("BillboardGui")then if d.bb[cI]==nil then pcall(d.muteOne,cI)elseif cI.Enabled then d.bb[cI]=true cI.Enabled=false end
end end end local D_,dp=pcall(function()return game:GetService("Stats"):GetTotalMemoryUsageMb()end)if D_ and type(dp)=="number"then
d.mem=dp d.memPeak=math.max(d.memPeak,dp)if(e.MemLimit or 0)>0 and dp>e.MemLimit then d.over=(d.over or 0)+((dp>e.MemLimit+250)and 20 or 1)
if d.over>=20 and not c.busy then d.over=-600 d.rejoinSame(("memory %d MB > %d MB"):format(dp,e.MemLimit))end
elseif(d.over or 0)>0 then d.over=0 end end if z()-(d.noteAt or 0)>1800 then d.noteAt=z()C(("health: %d fps, %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
end end c.sellWords={"sell","trash","discard","dispose","bin"}local function mr(hK)if type(hK)~="string"then return false end
hK=hK:lower()for KD,Ea in ipairs(c.sellWords)do if hK:find(Ea,1,true)then return true end end return false end
local function Eb()local uB=af:FindFirstChild("Remotes")local ms=uB and uB:FindFirstChild("SellSquishy")if not(ms and ms:IsA("RemoteEvent"))then return false end
if not pcall(function()ms:FireServer()end)then return false end return aq(function()return ac()==nil end,1.5)
end local function Ec()if c.sellSpot and c.sellSpot.Parent then return c.sellSpot end if z()-c.sellSearchAt<20 then return nil end
c.sellSearchAt=z()local uC=ap()local uD=uC and uC.HumanoidRootPart.Position local e9,uE for KE,dq in ipairs((c.plot or am):GetDescendants())do
if dq:IsA("ProximityPrompt")and(mr(dq.ActionText)or mr(dq.ObjectText)or mr(dq.Name))then local uF=oQ(dq)local mt=(uF and uD)and(uF-uD).Magnitude or 1e9
if mt<=400 and(not e9 or mt<uE)then e9,uE=dq,mt end end end c.sellSpot=e9 c.noSellSpot=(e9==nil)return e9 end
local function uG()local mu=ac()if not mu then c.holding=false return false end if aN(mu)then return false end
local mv=ak(W(mu))if Eb()then c.sold,c.holding,c.sellFails=c.sold+1,false,0 c.carryBlind,c.attrStale=z()+2.5,0
C("SOLD "..mv)return true end local dr=Ec()if dr then local uH=dU(dr)if uH then ck(uH,dr)local uI=ac()if uI and not aN(uI)then
local Ed,Ee=eb(dr,function()return ac()==nil end,function()return dr.Enabled end)if Ed then c.sold,c.holding,c.sellFails=c.sold+1,false,0
C(("SOLD %s at %s via %s"):format(mv,fY(dr),Ee))return true end end end end c.sellFails=c.sellFails+1 C("could not sell "..mv.." ("..c.sellFails..")")
return false end local Ef={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function Eg(ds)local hL=fY(ds):lower()for KF,Eh in ipairs(Ef)do if hL:find(Eh,1,true)then return 0 end end
local a_,ar=ds.Name:lower(),0 local function aX(Ei,Ej)return Ei:find(Ej,1,true)~=nil end if aX(a_,"collect")then ar=ar+60 end
if aX(a_,"cash")or aX(a_,"money")then ar=ar+45 end if aX(a_,"income")or aX(a_,"claim")then ar=ar+35 end if aX(a_,"coin")or aX(a_,"earn")or aX(a_,"green")then ar=ar+20 end
if a_=="pad"or a_=="touch"then ar=ar+25 end if ar==0 and(aX(hL,"collect")or aX(hL,"cash")or aX(hL,"money"))then ar=25 end
if ar==0 then return 0 end local e_=ds.Color if e_.G>0.5 and e_.G>e_.R*1.4 and e_.G>e_.B*1.4 then ar=ar+15 end
if math.min(ds.Size.X,ds.Size.Y,ds.Size.Z)<2 then ar=ar+5 end return ar end local function Ek()if c.padPart and c.padPart.Parent then return c.padPart end
if not c.plot or z()-c.padSearchAt<20 then return nil end c.padSearchAt=z()local hM,fa,mw={},nil,29 for KG,hN in ipairs(c.plot:GetDescendants())do
if hN:IsA("BasePart")then local hO=Eg(hN)if hO>0 then hM[#hM+1]={s=hO,p=hN}if hO>mw then fa,mw=hN,hO end end end
end table.sort(hM,function(El,Em)return El.s>Em.s end)c.padCands,c.padPart=hM,fa if fa then C("collect pad: "..fY(fa).." (score "..mw..")")end
return fa end local mx="SAB_pad_v1.txt"local function En(Eo)if type(writefile)=="function"then pcall(writefile,mx,table.concat({Eo:GetComponents()},","))end
end local function Ep()if type(isfile)~="function"or type(readfile)~="function"then return nil end local Eq,uJ=pcall(function()if isfile(mx)then return readfile(mx)end end)
if not Eq or type(uJ)~="string"then return nil end local hP={}for Er in uJ:gmatch("[^,]+")do hP[#hP+1]=tonumber(Er)end
if#hP==12 then return CFrame.new(unpack(hP))end end local function Es(my,hQ,Et)local Eu=c5(my)local mz=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
local aY=(mz and mz:IsA("BasePart"))and(mz.Position-hQ)or Vector3 .new(1,0,0)aY=Vector3 .new(aY.X,0,aY.Z)if aY.Magnitude<0.05 then aY=Vector3 .new(1,0,0)end
aY=aY.Unit for Ev=0,7 do local hR=Ev*math.pi/4 local Ew=Vector3 .new(aY.X*math.cos(hR)-aY.Z*math.sin(hR),0,aY.X*math.sin(hR)+aY.Z*math.cos(hR))
local hS=hQ+Ew*(Et+5)local mA=gB(hS.X,hQ.Y,hS.Z)if mA and math.abs(mA.Y-hQ.Y)<8 then aG(my,Vector3 .new(hS.X,mA.Y+Eu,hS.Z))
if j2(my,0.7)then return true end end end return false end local function Ex()c.lastCollect=z()local fb=ap()if not fb then return end
local uK,Ey=fb.HumanoidRootPart,c5(fb)local fc,uL,fd,mB=nil,4,nil,"?"local mC=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if c.manualPad and mC and mC:IsA("BasePart")then fc,mB=(mC.CFrame*c.manualPad).Position,"manual pad"else local br=Ek()
if br then fc=Vector3 .new(br.Position.X,br.Position.Y+br.Size.Y/2+Ey,br.Position.Z)uL,fd,mB=math.max(br.Size.X,br.Size.Z)/2,br,br.Name
end end if not fc then C("COLLECT: pad not found - stand on it and tap SET PAD")return end local mD=be()aG(fb,fc)
if fd and type(firetouchinterest)=="function"then pcall(firetouchinterest,uK,fd,0)end ag(e.PadDwell)if fd and type(firetouchinterest)=="function"then pcall(firetouchinterest,uK,fd,1)end
ag(0.5)c.collected=c.collected+1 local mE=be()C(("COLLECTED (%s) %s"):format(mB,(mD and mE and mE>mD)and("+$"..aD(mE-mD))or"no cash change seen"))
Es(fb,fc,uL)end q.disc,q.need,q.best,q.waxing,q.order,q.placedAt=nil,{},{},{},{},{}q.discAt,q.modAt,q.sentAt,q.msg,q.nNeed,q.nWax,q.fails=-100,-100,-100,"",0,0,0
function q.on()return e.AutoIndex or(e.Best or 0)>0 or e.BestCrate end function q.mods()if q.si and z()-q.modAt<120 then return true end
local uM=af:FindFirstChild("Modules")if not uM then return false end local function mF(Ez)local uN=uM:FindFirstChild(Ez)
if not uN then return nil end local EA,uO=pcall(require,uN)return(EA and type(uO)=="table")and uO or nil end q.si,q.arm,q.ci=mF("SquishyInfo"),mF("AutoRollRules"),mF("CrateInfo")
q.modAt=z()if not q.si then return false end local mG={}if q.arm and type(q.arm.tierOf)=="table"then for mH in pairs(q.arm.tierOf)do
local hT=q.si[mH]if type(hT)=="table"and hT.rarity~="Limited"and not hT.incomeType and not hT.hiddenAfter then mG[W(mH)]=mH end
end end q.roll=mG local hU={}for EB,EC in pairs(mG)do local fe=q.si[EC]if type(fe)=="table"and type(fe.income)=="number"and not fe.incomeType then
hU[#hU+1]={k=EB,inc=fe.income,pr=tonumber(fe.price)or 0}end end table.sort(hU,function(mI,mJ)if mI.inc~=mJ.inc then return mI.inc>mJ.inc end return mI.pr>mJ.pr end)
q.order=hU local hV,mK,mL local ED=(q.ci and type(q.ci.crates)=="table")and q.ci.crates or{}for EE,mM in pairs(ED)do
local mN=type(mM)=="table"and tonumber(mM.price)if mN and(not mK or mN>mK)then hV,mK,mL=EE,mN,mM.title end end
q.bestCrate,q.bestCrateName=hV and L.key(hV),hV q.bestCrateTitle=mL and L.key(mL)or nil return true end function q.rank(EF)
local EG,EH=pcall(function()return q.arm.rankOf(EF)end)return(EG and tonumber(EH))or 0 end function q.loadDisc(uP)
if type(uP)~="table"then return end local uQ={}for EI,EJ in pairs(uP)do if EJ then uQ[W(tostring(EI))]=true end end
q.disc,q.discAt=uQ,z()end function q.fetch()q.discAt=z()local uR=af:FindFirstChild("Remotes")local uS=uR and uR:FindFirstChild("GetSquishiesDiscovered")
if not uS then return end local EK,EL=pcall(function()return uS:InvokeServer()end)if EK then q.loadDisc(EL)end
end function q.scanWax()local mO={}local uT=c.plot and c.plot:FindFirstChild("WaxStations")if uT then for KH,uU in ipairs(uT:GetChildren())do
local uV=uU:FindFirstChild("SquishyPlaceHolder")if uV and uU:GetAttribute("HasSquishy")then for KI,uW in ipairs(uV:GetChildren())do if uW:IsA("Model")then mO[W(uW.Name)]=true end end
end end end for uX,EM in pairs(q.placedAt)do if z()-EM<20 then mO[uX]=true else q.placedAt[uX]=nil end end q.waxing=mO
end function q.compute()local uY,mP,mQ={},0,0 if q.disc then for mR in pairs(q.roll or{})do if not q.disc[mR]then
if q.waxing[mR]then mQ=mQ+1 else uY[mR],mP=true,mP+1 end end end end q.need,q.nNeed,q.nWax=uY,mP,mQ local uZ,mS={},e.Best or 0
local mT=(mS==4)and q.stackMin or nil for EN,u0 in ipairs(q.order)do if(mT and u0 .inc>mT)or(not mT and EN<=(mS==4 and 1 or mS))then uZ[u0 .k]=true end
end q.best=uZ end function q.readStack()q.stackAt=z()local u1=af:FindFirstChild("Remotes")local u2=u1 and u1:FindFirstChild("EditStack")
if not u2 then return end local EO,dt=pcall(function()return u2:InvokeServer("State",nil)end)if not(EO and type(dt)=="table"and type(dt.state)=="table"and type(dt.state.entries)=="table")then return end
local hW for KJ,u3 in ipairs(dt.state.entries)do local ff=type(u3)=="table"and q.si and q.si[tostring(u3 .name)]
if type(ff)=="table"and type(ff.income)=="number"and not ff.incomeType and(not hW or ff.income<hW)then hW=ff.income end
end q.stackMin=hW q.stackFull=#dt.state.entries>=(tonumber(dt.state.capacity)or 100)end function q.want(mU)if(e.Best or 0)>0 and(next(q.best)or(e.Best==4 and q.stackMin))then
if q.best[mU]then return true end elseif e.Targets[mU]then return true end return e.AutoIndex==true and q.need[mU]==true
end function q.any()return next(e.Targets)~=nil or((e.Best or 0)>0 and next(q.best)~=nil)or(e.AutoIndex and next(q.need)~=nil)
or e.Best==4 end function q.placed(EP)local fg=W(EP)q.placedAt[fg],q.waxing[fg]=z(),true if q.need[fg]then q.need[fg],q.nNeed,q.nWax=nil,math.max(0,q.nNeed-1),q.nWax+1
C(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(ak(fg)))if q.on()then task.spawn(pcall,q.sync,true)end
end end function q.rulesNow()local fh,fi={},{}for EQ,ER in pairs(q.roll or{})do if q.want(EQ)then fh[ER]=true end end
for u4,mV in pairs((q.ci and type(q.ci.crates)=="table")and q.ci.crates or{})do if L.wanted(u4)or(type(mV)=="table"and type(mV.title)=="string"and L.wanted(mV.title))then fi[u4]=true end
end if not next(fh)and not next(fi)then return nil end if q.arm and type(q.arm.encode)=="function"then local ES,u5=pcall(q.arm.encode,{rarities={},butters=fh,crates=fi,index=false})
if ES and type(u5)=="string"then return u5 end end local function u6(ET)local hX={}for EU in pairs(ET)do hX[#hX+1]=EU end table.sort(hX)return table.concat(hX,",")end
local fj="adv:"if next(fh)then fj=fj..";butters:"..u6(fh)end if next(fi)then fj=fj..";crates:"..u6(fi)end return fj
end function q.canon(EW)local hY={}for u7 in tostring(EW or""):gmatch("[^;]+")do local mW,u8=u7:match("^(%a+):(.*)$")
if not mW then mW,u8="r",u7:gsub("^adv:","")end for EX in u8:gmatch("[^,]+")do hY[#hY+1]=mW.."="..EX end end table.sort(hY)
return table.concat(hY,"|")end function q.sync(EY)if H:GetAttribute("AutoRoll")~=true then return end if z()<(q.pauseUntil or 0)then return end
local cJ=q.rulesNow()if not cJ or#cJ>1900 then return end if q.canon(H:GetAttribute("AutoRollRules"))==q.canon(cJ)then q.fails=0 return end
if not EY and z()-q.sentAt<4 then return end local u9=af:FindFirstChild("Remotes")local u_=u9 and u9:FindFirstChild("AutoRollAction")
if not u_ then return end q.fails=q.fails+1 if q.fails>4 then q.fails,q.pauseUntil=0,z()+300 C("the game did not take the Auto Roll choices - trying again in 5 min")
return end q.sentAt=z()D.replaying=true pcall(function()u_:FireServer("Rules",cJ)end)D.replaying=false e.ARrules=cJ
local hZ,h0=0,0 for KK in(cJ:match("butters:([^;]*)")or""):gmatch("[^,]+")do hZ=hZ+1 end for KL in(cJ:match("crates:([^;]*)")or""):gmatch("[^,]+")do h0=h0+1 end
local va=hZ.."/"..h0 if q.told~=va then q.told=va C(("auto roll now stops on %d butters and %d crates"):format(hZ,h0))end
end function q.tick()if not q.mods()then q.msg="index: the game's butter list cannot be read"return end if z()-q.discAt>30 then q.fetch()end
q.scanWax()if e.Best==4 and z()-(q.stackAt or-100)>60 then q.readStack()end q.compute()if q.on()then q.sync(false)end
local aQ={}if e.AutoIndex then aQ[#aQ+1]=not q.disc and"index: reading..."or(q.nNeed+q.nWax==0 and"index: complete"
or("index: %d to get, %d waxing"):format(q.nNeed,q.nWax))end if e.Best==4 then local fk=0 for KM in pairs(q.best)do fk=fk+1 end
aQ[#aQ+1]=fk==0 and"upgrades: none better than your stack - stations kept free"or("upgrades: %d butter%s"):format(fk,fk==1 and""or"s")
elseif(e.Best or 0)>0 and q.order[1]then aQ[#aQ+1]="best: "..ak(q.order[1].k)end if e.BestCrate and q.bestCrateName then aQ[#aQ+1]="crate: "..q.bestCrateName:gsub("(%l)(%u)","%1 %2")end
if O.got>0 then aQ[#aQ+1]="shower: "..O.got end q.msg=#aQ>0 and table.concat(aQ," | ")or"index / best: off"end
q.heard={}q.feed={}function q.feedAdd(EZ)q.feed[#q.feed+1]=os.date("%H:%M ")..EZ if#q.feed>40 then table.remove(q.feed,1)end
end function q.admin(vb,ax,h1)if vb~="Effect"then q.feedAdd(tostring(vb)..(ax~=nil and(": "..tostring(ax):sub(1,80))or""))
return end if ax~="ShowerTaken"and ax~="GoalPoint"then q.feedAdd(tostring(ax))end if ax=="Shower"then O.add(h1)return end
if ax=="ShowerTaken"then O.gone(h1)return end if ax=="ShowerClear"then O.drops={}return end if ax=="WaxGlow"then
local mX=type(h1)=="table"and tonumber(h1 .SnapAt)if mX then q.snapAt=mX C(("ADMIN: every wax finishes in %ds%s"):format(math.floor(mX-o.srv()),(e.SnapGlaze~=false and e.Teams and e.TeamGlaze~="")and" - glaze team on for it"or""))
end return end ax=tostring(ax)ce("Admin "..ax)if ax~="GoalPoint"and z()-(q.heard[ax]or-100)>30 then q.heard[ax]=z()
C("ADMIN: "..ax)end end O.drops,O.tried,O.got,O.miss={},{},0,0 function O.add(mY)if type(mY)~="table"or type(mY.Pieces)~="table"then return end
for KN,aZ in pairs(mY.Pieces)do if type(aZ)=="table"and aZ.Id~=nil and aZ.Position~=nil then O.drops[aZ.Id]={id=aZ.Id,butter=tostring(aZ.Butter or"?"),rar=tostring(aZ.Rarity or"?"),star=aZ.Star==true,
pos=aZ.Position,opens=tonumber(aZ.OpensAt)or 0,ends=tonumber(aZ.ExpiresAt)or 0}end end end function O.gone(fl)
if type(fl)~="table"or fl.Id==nil then return end O.drops[fl.Id]=nil if tonumber(fl.UserId)==o.uid then O.mine=fl.Id end
end function O.pick()local mZ=o.srv()local m0,vc for vd,cK in pairs(O.drops)do if mZ>=cK.ends-0.3 then O.drops[vd]=nil
elseif mZ>=cK.opens-0.2 and(O.tried[vd]or 0)<3 then local ve=(aN(cK.butter)and 1e6 or 0)+(cK.star and 1e5 or 0)+q.rank(cK.rar)*100-(cK.ends-mZ)
if not m0 or ve>vc then m0,vc=cK,ve end end end return m0 end function O.due()return e.Shower and c.running and next(O.drops)~=nil and not ac()and O.pick()~=nil
end function O.grab()local aR,m1=O.pick(),ap()if not(aR and m1)then return end O.tried[aR.id]=(O.tried[aR.id]or 0)+1
if d.hold then pcall(d.unpin,true)end aG(m1,aR.pos+Vector3 .new(0,c5(m1)+0.5,0))aq(function()return O.mine==aR.id or ac()~=nil or not O.drops[aR.id]end,1.5)
if O.mine==aR.id or ac()then O.got,O.drops[aR.id]=O.got+1,nil C(("GRABBED %s [%s]%s from the admin shower"):format(ak(W(aR.butter)),aR.rar,aR.star and" (star)"or""))
elseif not O.drops[aR.id]then O.miss=O.miss+1 end end local fm local function vf()if c.capHit then if e.AutoStart and z()-(c.capAt or 0)>300 then
c.capHit,c.placeFails=false,0 C("trying again after being stopped for 5 minutes")fm(true,true)else return nil,c.capMsg,"bad"
end end if c.busy then return nil,c.busyText,"ok"end if not ap()then return nil,"waiting for character","wait"end
if not c.plot or not c.plot.Parent then c.plot,c.padPart,c.sellSpot=bB(),nil,nil if not c.plot then return nil,"own plot not found yet","wait"end
end if not q.any()then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"end local m2,vg=f0()
local h2=ac()if h2 then local du=ak(W(h2))if not aN(h2)then local m3=(V.gift and W(V.gift)==W(h2)and z()-V.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(du,m3),"bad"end if c.sellFails>=3 then
return nil,("holding %s (%s) - selling is not working, tap SELL"):format(du,m3),"bad"end return"sell",("selling %s (%s)"):format(du,m3),"warn"
end if m2<1 then return nil,("holding %s - 0 free stations"):format(du),"wait"end if A.glazeSoon()then return nil,("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(du),"wait"end
return"place",("waxing %s (%d free)"):format(du,m2),"ok"end c.holding=false if e.Crates and not j.waiting and z()-(j.scanAt or 0)>1 and z()>(j.quietUntil or 0)then
j.scanAt=z()local m4=c.plot:FindFirstChild("CrateStand")if m4 then for KO,fn in ipairs(m4:GetDescendants())do
if fn:IsA("ProximityPrompt")and fn.Enabled and ki(fn)then local bs=fn.ObjectText if bs==""then bs=cY(m4,"TitleLabel")or""end
if bs~=""and L.wanted(bs)then local E0=fW(bs):gsub("crate$","")local vh for vi in pairs(ad.members)do if fW(vi)==E0 then vh=vi end end
j.waiting,j.at,j.title,j.prompt=true,z(),bs,fn j.data={name=(bs:gsub("%s","")),rarity=vh,title=bs}C(bs.." found waiting on your stand")
end break end end end end local vj=L.wanted(j.data and j.data.name)or L.wanted(j.title)if e.Crates and(j.on or j.waiting)and vj then
local a0=j.title if z()<(j.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open yourself"):format(a0),"bad"
end if j.on then if c.crateFails>=3 then j.ignoreUntil,c.crateFails=z()+120,0 C("could not press the "..a0 .." buttons 3 times - leaving it to you for 2 min")
return nil,("%s window open - press Open yourself"):format(a0),"bad"end if z()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(a0),"bad"
end if j.byYou and z()-j.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
a0,math.ceil(60-(z()-j.openedAt))),"idle"end return"cratesmart",("opening %s"):format(a0),"ok"end if j.at and z()-j.at>j.GIVEUP then
return"cratedrop",("%s could not be opened for %d min - discarding it so rolling goes on"):format(a0,math.floor(j.GIVEUP/60)),"bad"
end if j.summonFails>=3 then if z()-j.lastFail<45 then return nil,("%s waiting - could not open it (trying again in %ds)"):format(a0,
math.ceil(45-(z()-j.lastFail))),"bad"end j.summonFails,j.nearFails,j.prompt=0,0,nil C("trying the "..a0 .." again")
end if z()-j.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(a0),"wait"end return"cratesmart",("%s waiting - opening it%s"):format(a0,(j.learned and j.learned.mode~="window")and" directly"or""),"ok"
end if(j.on or j.waiting)and not vj then local vk=j.title..tostring(j.rolledAt)if j.told~=vk then j.told=vk C(j.title.." is not ticked - leaving it to the game")
end end if j.rolled and not j.waiting and z()-j.rolledAt<6 and L.wanted(j.rolled)then return nil,j.rolled.." rolled - waiting for it to land","wait"
end if m2<1 then c.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(vg,vg),"wait"
end local m5=o4()if not m5 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end local dv=cd()
if dv and qt(dv.name)then c.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(dv.name),"idle"end
if z()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(dv.name),"bad"end if not qM()then return nil,("%s rolled - waiting for it to land on the stand"):format(dv.name),"wait"end
return"cratewin",("%s on the pad - opening its window"):format(dv.name),"ok"end local bV=j0()if bV.state~="match"then
c.matchSince=nil if bV.state=="skip"and not m5 .Enabled then return nil,bV.text.." (sold out)","idle"end return nil,bV.text,bV.level
end if not m5 .Enabled then c.matchSince=nil return nil,"target on pad but Buy is off","wait"end local fo=z()
if fo<c.noCashUntil then local vl,E1=d8()if vl then return nil,("cash short: have $%s, price ~$%s"):format(aD(vl),aD(E1)),"bad"end
return nil,(d8()and"cash short - have $%s, retry in %ds"or"buy did not go through - have $%s, again in %ds"):format(
aD(be()),math.ceil(c.noCashUntil-fo)),d8()and"bad"or"wait"end if fo-c.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end
c.matchSince=c.matchSince or fo local vm=fo-c.matchSince if vm<e.Confirm then return nil,("confirming %s (%.2fs)"):format(bV.shown,vm),"ok"end
return"buy",("buying %s via %s"):format(bV.shown,bV.src),"ok"end d.DEPTH=11 function d.pinTick()local vn=d.hold
if not vn then return end local m6=H.Character local m7=m6 and m6:FindFirstChild("HumanoidRootPart")if not m7 then return end
m7 .CFrame=vn m7 .AssemblyLinearVelocity=Vector3 .new(0,0,0)for KP,h3 in ipairs(m6:GetChildren())do if h3:IsA("BasePart")and h3 .CanCollide then d.noclip[h3]=true h3 .CanCollide=false end
end end d.noclip=setmetatable({},{__mode="k"})function d.pin(E2,vo)d.hold=E2 if vo then d.surface=vo end end function d.unpin(E3)
if not d.hold then return end d.hold=nil for vp in pairs(d.noclip)do pcall(function()if vp.Parent then vp.CanCollide=true end end)end
d.noclip=setmetatable({},{__mode="k"})local vq=ap()if vq and d.surface and not E3 then aG(vq,d.surface.Position,d.surface.Position+d.surface.LookVector)
ag(0.1)end end function d.home()local bt,vr=c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder"),ap()
if not(bt and bt:IsA("BasePart")and vr)then return nil end local vs=oT()or bt.Position local h4=Vector3 .new(vs.X-bt.Position.X,0,vs.Z-bt.Position.Z)
h4=h4 .Magnitude>0.1 and h4 .Unit or Vector3 .new(0,0,1)local h5=bt.Position+h4*6 local vt=gB(h5 .X,bt.Position.Y,h5 .Z,{bt})
return CFrame.new(h5 .X,(vt and vt.Y or bt.Position.Y)+c5(vr),h5 .Z)end function d.ground(E4,vu,E5)local m8,m9={H.Character},nil
for KQ=1,12 do local m_=RaycastParams.new()m_.FilterType=Enum.RaycastFilterType.Exclude m_.FilterDescendantsInstances=m8
local h6=am:Raycast(Vector3 .new(E4,vu,E5),Vector3 .new(0,-2000,0),m_)if not h6 then break end m9,vu=h6,h6 .Position.Y-0.05
m8[#m8+1]=h6 .Instance end return m9 and m9 .Position.Y end function d.parkHome()local na=d.home()if not na then return false end
local dw=na.Position local E6=d.ground(dw.X,dw.Y+300,dw.Z)or(dw.Y-3)d.pin(CFrame.new(dw.X,E6-8,dw.Z),na)return true
end d.GHOST={[0]={"GHOST: OFF","G: OFF"},{"GHOST: HELPS ONLY","G: HELP"},{"GHOST: FULL","G: FULL"}}function d.ghostMode()return e.Ghost and 2 or(e.GhostHelps and 1 or 0)end
function d.setGhost(h7)e.Ghost,e.GhostHelps=h7==2,h7==1 if h7<2 then task.spawn(function()while c.busy do ag(0.1)end
if d.ghostMode()<2 and d.hold and not E.home then pcall(d.unpin)end end)end d.paintGhost()C("ghost: "..d.GHOST[h7][1]:sub(8):lower())
end function d.cycleGhost()d.setGhost((d.ghostMode()+1)%3)end function d.parkTick()if not(e.Ghost and c.running)or d.hold or c.busy then return end
local E7=ap()if not E7 or K.seat()then return end d.parkHome()end K.n,K.fails,K.nextAt,K.msg,K.lost=0,0,0,"no campfire right now",0
function K.seat()local vv=H.Character local vw=vv and vv:FindFirstChildOfClass("Humanoid")local nb=vw and vw.SeatPart
return(nb and nb.Name=="LogSeat")and nb or nil end function K.due()if not(e.Campfire and c.running)or z()<K.nextAt then return false end
local E8=am:FindFirstChild("NightSeats")if not E8 then if K.wasOn then K.wasOn,K.fails,K.lost=false,0,0 end K.msg="no campfire now (weather events)"
return false end K.wasOn=true if K.seat()then K.sitAt=K.sitAt or z()K.msg=("sitting at the campfire: +%s%% cash"):format(tostring(H:GetAttribute("CampfireBoost")or"?"))
return false end if K.sitAt then K.lost,K.sitAt=K.lost+1,nil if K.lost>=4 then K.nextAt,K.msg=z()+600,"kept losing the seat - leaving the campfire for 10 min"
C(K.msg)return false end end return true end function K.sit()local vx,h8=am:FindFirstChild("NightSeats"),ap()
if not vx or not h8 then return end local vy,dx=h8 .HumanoidRootPart.Position,{}for KR,h9 in ipairs(vx:GetChildren())do
local vz=h9:IsA("Seat")and h9 .Occupant==nil and h9:FindFirstChildOfClass("ProximityPrompt")if vz then dx[#dx+1]={st=h9,p=vz}end
end if#dx==0 then K.nextAt,K.msg=z()+10,"the campfire is full - waiting for a seat"return end table.sort(dx,function(E9,E_)return(E9 .st.Position-vy).Magnitude<(E_.st.Position-vy).Magnitude end)
local Fa,Fb=dx[1].st,dx[1].p d.unpin(true)local dy=Fa.CFrame aG(h8,dy.Position+dy.LookVector*2+Vector3 .new(0,2.5,0),dy.Position)
ag(0.25)local Fc=eb(Fb,function()return K.seat()~=nil end)if not Fc then aG(h8,dy.Position+Vector3 .new(0,2,0),dy.Position+dy.LookVector)
aq(function()return K.seat()~=nil end,1.5)end if K.seat()then K.n,K.fails,K.sitAt=K.n+1,0,z()C(("SAT at the campfire (+%s%% cash)"):format(tostring(H:GetAttribute("CampfireBoost")or"?")))
else K.fails=K.fails+1 K.nextAt=z()+(K.fails>=3 and 60 or 5)K.msg="could not sit at the campfire"..(K.fails>=3 and" - trying again in a minute"or"")
if K.fails<=3 then C(K.msg)end end end F.msg,F.nextAt,F.at,F.pulls,F.claims,F.pullLeft,F.collectLeft,F.events="",0,0,0,0,0,0,{}
function F.refresh()F.at=z()local nc=af:FindFirstChild("Remotes")if not nc then return end local fp,nd,dz=0,0,{}
local Fd,vA=pcall(function()return nc.ClanRequest:InvokeServer("state")end)local vB=Fd and type(vA)=="table"and vA.tasks
for KS,bW in ipairs(vB and vB.list or{})do if not bW.done and bW.kind=="pull"then fp=math.max(fp,(bW.goal or 0)-(bW.progress or 0))end
if not bW.done then dz[#dz+1]=("%s %d/%d"):format(tostring(bW.text),bW.progress or 0,bW.goal or 0)end end F.events={}
for KT,dA in ipairs(nc:GetChildren())do if dA:IsA("RemoteFunction")and dA.Name:match("^%u%a+Action$")and dA.Name~="CrateAction"and dA.Name~="AutoRollAction"then
local Fe,fq=pcall(function()return dA:InvokeServer("state")end)if Fe and type(fq)=="table"and fq.live==true and type(fq.quests)=="table"then
F.events[#F.events+1]={r=dA,st=fq}for KU,aS in ipairs(fq.quests)do if not aS.done and aS.kind=="pull"then fp=math.max(fp,(aS.goal or 0)-(aS.progress or 0))end
if not aS.done and aS.kind=="collect"then nd=math.max(nd,(aS.goal or 0)-(aS.progress or 0))end if not aS.done then dz[#dz+1]=("%s %d/%d"):format(tostring(aS.text),aS.progress or 0,aS.goal or 0)end
end end end end F.pullLeft,F.collectLeft=fp,nd F.msg=#dz>0 and("open: "..table.concat(dz,", "))or"all quests done for today"
end function F.claim()for KV,fr in ipairs(F.events)do local vC=fr.r.Name:gsub("Action$","")for KW,dB in ipairs(fr.st.quests)do
if dB.done and not dB.claimed then local Ff,vD=pcall(function()return fr.r:InvokeServer("claimQuest",dB.id)end)
if Ff and not(type(vD)=="table"and vD.ok==false)then F.claims=F.claims+1 C(("CLAIMED %s quest: %s (+%s)"):format(vC,tostring(dB.text),tostring(dB.points or dB.treats or"?")))
end ag(0.4)end end if fr.st.bonusReady==true then local Fg=pcall(function()return fr.r:InvokeServer("claimBonus")end)
if Fg then C(("CLAIMED %s daily quest bonus"):format(vC))end ag(0.4)end end end function F.tick()if not(e.Quests and c.running)then
if F.arPaused then F.resume("quests switched off")end return end if z()-F.at<(F.pullLeft>0 and 20 or 90)then return end
F.refresh()pcall(F.claim)if F.pullLeft<=0 and F.arPaused then F.resume("lever quests done")end end function F.pullDue()
return e.Quests and c.running and F.pullLeft>0 and z()>=F.nextAt and not D.busy end function F.lever()local vE=c.plot and c.plot:FindFirstChild("Lever")
local ne=vE and vE:FindFirstChild("Wheel")return ne and ne:FindFirstChildWhichIsA("ProximityPrompt"),ne end function F.resume(Fh)
F.arPaused=false if F.arWas then F.arWas=false e.AutoRoll=true task.spawn(D.apply,Fh)end end function F.pull()
local h_,nf=F.lever()if not h_ or not nf or not nf:IsA("BasePart")then F.nextAt,F.msg=z()+300,"your lever was not found"return end
if not F.arPaused then F.arPaused=true F.arWas=e.AutoRoll if e.AutoRoll then e.AutoRoll=false D.apply("pulling the lever for a quest",true)
if D.isOn()then F.nextAt=z()+30 return end end C(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(F.pullLeft))
end if not h_.Enabled then F.nextAt=z()+1 return end ck(nf,h_)F.asked=nil qh(h_)F.pulls=F.pulls+1 F.pullLeft=F.pullLeft-1
ag(0.6)if F.asked then F.nextAt=z()+600 C(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(F.asked)))
F.resume("a butter the game wants kept is on the pad")return end F.nextAt=z()+2.5 if F.pullLeft<=0 then F.at=0 end
end E.skip,E.skipN,E.n,E.calls,E.fails,E.nextAt,E.msg,E.tries={},0,0,0,0,0,"off",{}function E.can(bX,Fi)local ng=bX:GetAttribute("PourOwner")
if type(ng)~="number"or ng==o.uid or not bX:GetAttribute("HasSquishy")then return false end if bX:GetAttribute("PourLong")~=true or bX:GetAttribute("PourFull")==true then return false end
local nh=bX:GetAttribute("PourId")if nh==nil or E.skip[nh]then return false end local vF,ni,Fj=bX:GetAttribute("Helpers"),0,tostring(o.uid)
if type(vF)=="string"then for Fk in vF:gmatch("[^,%s]+")do ni=ni+1 if Fk==Fj then return false end end end if ni>=6 then return false end
local ia=A.left(bX)if not ia then local vG=tonumber(bX:GetAttribute("PourEnd"))ia=vG and(vG-Fi)end if not ia or ia<=75 then return false end
local nj=game:GetService("Players"):GetPlayerByUserId(ng)if not nj or nj:GetAttribute("WaxHelpOff")==true then return false end
return true,nj,nh end function E.list()local nk,Fl={},o.srv()local vH=am:FindFirstChild("Plots")for KX,vI in ipairs(vH and vH:GetChildren()or{})do
local vJ=vI~=c.plot and vI:FindFirstChild("WaxStations")for KY,nl in ipairs(vJ and vJ:GetChildren()or{})do local Fm,Fn,Fo=E.can(nl,Fl)
local nm=Fm and nl:FindFirstChild("SquishyPlaceHolder")if nm and nm:IsA("BasePart")then nk[#nk+1]={st=nl,p=Fn,id=Fo,part=nm}end
end end return nk end function E.due()if e.Help and c.running and z()>=E.nextAt and(d.mem or 0)>900 then E.nextAt,E.msg=z()+30,("paused - phone memory %d MB (helps load other bases)"):format(d.mem)
return false end return e.Help and c.running and z()>=E.nextAt end function E.skipIt(vK,vL)E.skip[vK],E.skipN=vL,E.skipN+1
if E.skipN>600 then E.skip,E.skipN,E.tries={[vK]=vL},1,{}end end function E.goHome()local ib,bY=ap(),E.home E.home=nil
if not(ib and bY)then return end if e.Ghost and not K.seat()then d.unpin(true)if not d.parkHome()then pcall(aG,ib,bY.Position,bY.Position+bY.LookVector)end
elseif d.hold or(ib.HumanoidRootPart.Position-bY.Position).Magnitude>20 then d.unpin(true)pcall(aG,ib,bY.Position,bY.Position+bY.LookVector)
end end function E.step()local nn,fs=E.list(),ap()if#nn==0 or not fs then E.nextAt=z()+15 E.msg=("helped %d waxes here%s | none to help right now"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")
E.goHome()return end local vM=fs.HumanoidRootPart local vN=vM.Position table.sort(nn,function(Fp,Fq)return(Fp.part.Position-vN).Magnitude<(Fq.part.Position-vN).Magnitude end)
local a1=nn[1]E.home=E.home or(d.hold and d.surface)or vM.CFrame local bZ=a1 .part local ft=(bZ.Position+a1 .st:GetPivot().Position)/2
local ic=E.tries[a1 .id]or 0 if(e.Ghost or e.GhostHelps)and ic==0 and not K.seat()then d.pin(bZ.CFrame,E.home)
else d.unpin(true)local no=ic==0 and gB(ft.X,bZ.Position.Y,ft.Z,{bZ})if no and math.abs(no.Y-bZ.Position.Y)<8 then
aG(fs,Vector3 .new(ft.X,no.Y+c5(fs),ft.Z),bZ.Position)else aG(fs,bZ.Position+Vector3 .new(0,bZ.Size.Y/2+3,0),ft)
end end ag(0.3)local fu=af:FindFirstChild("Remotes")fu=fu and fu:FindFirstChild("ClanRequest")if not fu then E.nextAt,E.msg=z()+60,"the game's help remote is missing"return end
local ie,bu=pcall(function()return fu:InvokeServer("help",a1 .st:GetAttribute("PourOwner"),tonumber(a1 .st.Name))end)
if ie and type(bu)=="table"and bu.ok then E.n,E.fails=E.n+1,0 E.skipIt(a1 .id,"helped")C(("HELPED %s's wax (station %s)"):format(a1 .p.DisplayName,a1 .st.Name))
E.msg=("helped %d waxes here%s"):format(E.n,E.calls>0 and(", "..E.calls.." for the guild")or"")elseif ie and type(bu)=="table"and tostring(bu.reason or""):lower():find("walk up",1,true)and ic<2 then
E.tries[a1 .id]=ic+1 E.nextAt=z()+0.3 elseif ie and type(bu)=="table"and tostring(bu.reason or""):lower():find("moment",1,true)then
E.waits=(E.waits or 0)+1 E.nextAt=z()+1.6 else local vO=(ie and type(bu)=="table"and tostring(bu.reason or"refused"))or("error: "..tostring(bu))
E.skipIt(a1 .id,vO)E.fails=E.fails+1 if E.fails<=3 then C(("help refused for %s's wax: %s"):format(a1 .p.DisplayName,vO))end
if E.fails>=5 then E.fails,E.nextAt,E.msg=0,z()+60,"the server keeps refusing helps - trying again in a minute"
E.goHome()end end E.nextAt=math.max(E.nextAt,z()+1.2)end function E.onCall(bv)if not e.HelpGuild or type(bv)~="table"or bv.p~="help"or bv.mine or bv.u==o.uid or not bv.u then return end
task.delay(1+math.random()*2,function()if not(c.alive and e.HelpGuild)then return end local fv=af:FindFirstChild("Remotes")
fv=fv and fv:FindFirstChild("ClanRequest")if not fv then return end local vP,fw=pcall(function()return fv:InvokeServer("callHelp",bv.u)end)
local vQ=tostring(bv.n or bv.un or bv.u)if vP and type(fw)=="table"and fw.ok then E.calls=E.calls+1 C(("HELPED guildmate %s's wax from here (their call)"):format(vQ))
else C(("guild call from %s: %s"):format(vQ,(vP and type(fw)=="table"and tostring(fw.reason or"refused"))or tostring(fw)))
end end)end local function as(Fr,vR,...)if c.busy then return end c.busy,c.busyText=true,Fr if d.hold and vR~=E.step then pcall(d.unpin)end
local Fs,vS=pcall(vR,...)c.busy,c.busyText=false,""if not Fs and vS~=jc then C("ERR "..tostring(vS))end end local function Ft()
local aT,Fu,Fv=vf()c.reason,c.level=Fu,Fv if aT=="place"then as("waxing...",A.place)elseif aT=="crate"then as("opening crate...",em,true)
elseif aT=="cratesmart"then as("opening crate...",j.smart)elseif aT=="cratewin"then as("opening the crate window...",kk)
elseif aT=="nocrate"then as("discarding crate...",em,false)elseif aT=="cratedrop"then as("discarding a crate that would not open...",j.drop)
elseif aT=="sell"then as("selling...",uG)elseif aT=="buy"then as("buying...",qk,false)elseif not aT and not c.matchSince and O.due()then
as("grabbing a butter from the admin shower...",O.grab)elseif not aT and not c.matchSince and K.due()then as("sitting at the campfire...",K.sit)
elseif not aT and not c.matchSince and F.pullDue()and not ac()and not(cd()and aN(cd().name))then as("pulling the lever for a quest...",F.pull)
elseif e.Collect and not c.matchSince and z()-c.lastCollect>=(F.collectLeft>0 and e.Quests and math.min(e.Every,15)or e.Every)then
as("collecting money...",Ex)elseif not aT and not c.matchSince and E.due()then as("helping a wax...",E.step)elseif E.home and not e.Help then
as("coming back...",E.goHome)elseif not c.busy then d.parkTick()end end function fm(ig,Fw)if ig==c.running then return end
c.running=ig if not Fw then e.AutoStart=ig end if ig then c.capHit,c.placeFails,c.cashFails,c.sellFails,c.crateFails=false,0,0,0,0
j.lastFail,j.summonFails,j.ignoreUntil=0,0,0 c.noCashUntil,c.matchSince=0,nil c.lastCollect=z()c.plot=bB()or c.plot
C("START")else c.reason="stopped"C("STOP")end end do local b0=gm(an.auto)if type(b0)=="string"then b0=b0:gsub("%s+$","")
if b0~=""then c.autoload=b0 local Fx=pQ(b0)C(Fx and("loaded config "..b0)or("config "..b0 .." could not be loaded"))
end end end local l={bg=Color3 .fromRGB(12,13,18),panel=Color3 .fromRGB(19,21,28),panel2=Color3 .fromRGB(36,39,51),
raise=Color3 .fromRGB(26,29,38),lit=Color3 .fromRGB(42,36,24),line=Color3 .fromRGB(44,48,62),text=Color3 .fromRGB(240,242,248),dim=Color3 .fromRGB(140,147,166),faint=Color3 .fromRGB(86,92,110),
accent=Color3 .fromRGB(255,193,77),accent2=Color3 .fromRGB(255,128,60),ink=Color3 .fromRGB(30,21,6),good=Color3 .fromRGB(56,214,136),warn=Color3 .fromRGB(255,178,74),bad=Color3 .fromRGB(255,94,110),
info=Color3 .fromRGB(112,152,255),white=Color3 .fromRGB(255,255,255),}local Fy={ok=l.good,wait=l.warn,warn=l.warn,bad=l.bad,idle=l.dim}
local np={Common=Color3 .fromRGB(176,182,194),Rare=Color3 .fromRGB(86,156,255),Epic=Color3 .fromRGB(182,104,255),
Legendary=Color3 .fromRGB(255,200,64),Mythic=Color3 .fromRGB(255,84,150),Celestial=Color3 .fromRGB(128,158,255),
Divine=Color3 .fromRGB(255,140,64),Dream=Color3 .fromRGB(232,208,128),["Sugar Rush"]=Color3 .fromRGB(255,118,216),
Picnic=Color3 .fromRGB(255,108,96),Dotonbori=Color3 .fromRGB(80,226,255),Limited=Color3 .fromRGB(255,84,96),}
local ae={x=Enum.Font.GothamBlack,b=Enum.Font.GothamBold,m=Enum.Font.GothamMedium,r=Enum.Font.Gotham,mono=Enum.Font.Code}
pcall(function()local vT,vU,vV,vW=Enum.Font.BuilderSansExtraBold,Enum.Font.BuilderSansBold,Enum.Font.BuilderSansMedium,Enum.Font.BuilderSans
if vT and vU and vV and vW then ae.x,ae.b,ae.m,ae.r=vT,vU,vV,vW end end)pcall(function()local vX=Enum.Font.RobotoMono if vX then ae.mono=vX end end)
local function J(Fz,FA,FB)local FC,nq=pcall(Instance.new,Fz)if not FC then c.uiErrs=c.uiErrs+1 return nil end
for FD,FE in pairs(FA)do if not pcall(function()nq[FD]=FE end)then c.uiErrs=c.uiErrs+1 end end nq.Parent=FB return nq
end local function ab(FF,FG)J("UICorner",{CornerRadius=UDim.new(0,FG or 8)},FF)end local a={shown=setmetatable({},{__mode="k"}),lit=setmetatable({},{__mode="k"}),
sw=setmetatable({},{__mode="k"}),ord=setmetatable({},{__mode="k"}),tabsAll={}}function a.put(ih,nr)if ih and a.shown[ih]~=nr then a.shown[ih]=nr ih.Text=nr end
end function a.stroke(FH,FI,FJ)return J("UIStroke",{Color=FI or l.line,Thickness=1,Transparency=FJ or 0,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},FH)
end function a.grad(FK,FL,FM,FN)local FO,vY=pcall(function()return ColorSequence.new(FL,FM)end)if FO and vY then return J("UIGradient",{Color=vY,Rotation=FN or 0},FK)end
end function a.pad(FP,vZ,v0,FQ,FR)J("UIPadding",{PaddingLeft=UDim.new(0,vZ or 0),PaddingTop=UDim.new(0,v0 or 0),
PaddingRight=UDim.new(0,FQ or vZ or 0),PaddingBottom=UDim.new(0,FR or v0 or 0)},FP)end function a.list(FS,FT,FV)
return J("UIListLayout",{Padding=UDim.new(0,FT or 0),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=FV and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical},FS)
end function a.ink(ns)local FW,FX=pcall(function()return 0.299*ns.R+0.587*ns.G+0.114*ns.B end)return(FW and FX>0.55)and l.ink or l.text
end function a.nextIn(v1)local v2=(a.ord[v1]or 0)+1 a.ord[v1]=v2 return v2 end local nt=H:FindFirstChildOfClass("PlayerGui")or H:WaitForChild("PlayerGui")
local v3=nt:FindFirstChild("SABFarmGui")if v3 then v3:Destroy()end local nu=J("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},nt)local Q={w=340,h=300,head=38,status=30,rail=44}pcall(function()
local ii=am.CurrentCamera.ViewportSize if ii.X>100 and ii.Y>100 then Q.w=math.clamp(math.floor(ii.X*0.48),320,400)
Q.h=math.clamp(math.floor(ii.Y*0.86),250,360)end end)a.root=J("Frame",{Name="Root",Size=UDim2 .new(0,Q.w,0,Q.h),
Position=UDim2 .new(0,c.winPos and c.winPos[1]or 10,0,c.winPos and c.winPos[2]or 44),BackgroundColor3=l.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},nu)
ab(a.root,14)a.stroke(a.root,l.line,0)a.grad(a.root,l.white,Color3 .fromRGB(205,208,222),90)local v4=UDim2 .new(1,0,1,0)
local function KZ(v5,v6)return UDim2 .new(v5,0,0,0),UDim2 .new(v6,(v5+v6>0.99)and 0 or-4,1,0)end local function ai(FY,FZ,fy,F0,F1,F2)
local nv=J("TextButton",{Text=FZ,Position=F1,Size=F2,BackgroundColor3=fy,BorderSizePixel=0,Font=ae.b,TextSize=F0,TextColor3=a.ink(fy),AutoButtonColor=true},FY)
ab(nv,8)if fy==l.panel2 or fy==l.raise or fy==l.panel then a.stroke(nv,l.line,0.4)end return nv end local function ij(F3,F4,F5,F6,F7)
local ik=J("TextBox",{Text=F4,PlaceholderText=F5,Position=F6,Size=F7,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.m,TextSize=12,TextColor3=l.text,PlaceholderColor3=l.faint,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},F3)ab(ik,8)a.stroke(ik,l.line,0)a.pad(ik,9,0,6,0)
return ik end local il=am.CurrentCamera local function F8()local F9,im=pcall(function()return il and il.ViewportSize end)
if F9 and im and im.X>50 and im.Y>50 then return im end end local function b1(fz)local nw=F8()if not(nw and fz and fz.Parent)then return end
local F_=pcall(function()local io,v7=fz.AbsolutePosition,fz.AbsoluteSize local nx=70 local v8=math.clamp(io.X,nx-v7 .X,nw.X-nx)
local v9=math.clamp(io.Y,0,nw.Y-math.min(v7 .Y,nx))if math.abs(v8-io.X)>0.5 or math.abs(v9-io.Y)>0.5 then fz.Position=UDim2 .new(0,math.floor(v8),0,math.floor(v9))
end end)return F_ end local function ip(Ga)local Gb,ny=pcall(function()return Ga.AbsolutePosition end)if Gb and ny then return{math.floor(ny.X),math.floor(ny.Y)}end
end local dC={}c.dragMoved={}local function v_(fA,wa,nz)T(fA.InputBegan:Connect(function(dD)if dD.UserInputType~=Enum.UserInputType.MouseButton1 and dD.UserInputType~=Enum.UserInputType.Touch then return end
local nA={start=dD.Position,from=wa.Position,moved=0,target=wa,input=dD,onDrop=nz}dC[fA],c.dragMoved[fA]=nA,0
local nB nB=dD.Changed:Connect(function()if dD.UserInputState==Enum.UserInputState.End and dC[fA]==nA then dC[fA]=nil
if nB then nB:Disconnect()end if nz then nz(nA.moved)end end end)end))end T(oC.InputChanged:Connect(function(iq)
if iq.UserInputType~=Enum.UserInputType.MouseMovement and iq.UserInputType~=Enum.UserInputType.Touch then return end
for Gc,ba in pairs(dC)do local nC=ba.target if nC and nC.Parent then local wb,wc=iq.Position.X-ba.start.X,iq.Position.Y-ba.start.Y
ba.moved=math.max(ba.moved,math.abs(wb)+math.abs(wc))c.dragMoved[Gc]=ba.moved nC.Position=UDim2 .new(ba.from.X.Scale,ba.from.X.Offset+wb,ba.from.Y.Scale,ba.from.Y.Offset+wc)
end end end))T(oC.InputEnded:Connect(function(ir)if ir.UserInputType~=Enum.UserInputType.MouseButton1 and ir.UserInputType~=Enum.UserInputType.Touch then return end
for Gd,is in pairs(dC)do if is.input==ir or ir.UserInputType==Enum.UserInputType.MouseButton1 then dC[Gd]=nil
if is.onDrop then is.onDrop(is.moved)end end end end))local function P(Ge,Gf,Gg,Gh,Gi,Gj,Gk)return J("TextLabel",{Text=Gf,Position=Gj or UDim2 .new(0,0,0,0),Size=Gk or v4,BackgroundTransparency=1,
Font=Gi and ae.b or ae.m,TextSize=Gg,TextColor3=Gh,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},Ge)
end function a.row(wd,Gl)return J("Frame",{Size=UDim2 .new(1,0,0,Gl),BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=a.nextIn(wd)},wd)end function a.card(we,wf,wg)local dE=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(we)},we)ab(dE,11)a.stroke(dE,l.line,0.25)a.list(dE,5)a.pad(dE,8,8,8,9)
if wf then local nD=a.row(dE,14)J("Frame",{Size=UDim2 .new(0,3,0,10),Position=UDim2 .new(0,0,0.5,-5),BackgroundColor3=l.accent,
BorderSizePixel=0},nD)P(nD,wf:upper(),9,l.dim,true,UDim2 .new(0,8,0,0),UDim2 .new(1,-8,1,0))if wg then local Gm=P(nD,wg,9,l.faint,false,UDim2 .new(0.4,0,0,0),UDim2 .new(0.6,0,1,0))
Gm.TextXAlignment=Enum.TextXAlignment.Right end end return dE end function a.heading(Gn,Go,nE)local nF=a.row(Gn,nE and 34 or 22)
P(nF,Go,16,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,20)).Font=ae.x if nE then P(nF,nE,10,l.dim,false,UDim2 .new(0,2,0,19),UDim2 .new(1,-4,0,14)).TextTruncate=Enum.TextTruncate.AtEnd end
return nF end a.OFF={OFF=true,GAME=true,["ALL DRAWN"]=true}function a.skin(nG)local aL=a.sw[nG]if not aL then return end
local dF=tostring(nG.Text or""):match(":%s*(.-)%s*$")or""local b2=dF~=""and not a.OFF[dF]local nH=not aL.chips and(dF=="ON"or dF=="OFF")
aL.pill.Visible,aL.chip.Visible=nH,not nH if nH then aL.pill.BackgroundColor3=b2 and l.accent or l.panel2 aL.knob.Position=b2 and UDim2 .new(1,-16,0.5,-7)or UDim2 .new(0,2,0.5,-7)
aL.knob.BackgroundColor3=b2 and l.white or l.dim else aL.chip.Text=dF~=""and dF or"-"aL.chip.BackgroundColor3=b2 and l.accent or l.panel2
aL.chip.TextColor3=b2 and l.ink or l.dim end nG.BackgroundColor3=b2 and l.lit or l.raise if aL.edge then aL.edge.Color=b2 and l.accent or l.line aL.edge.Transparency=b2 and 0.55 or 0.45 end
end function a.switch(wh,Gp,Gq,fB)local a2=J("TextButton",{Name="Switch",Text=Gp,TextTransparency=1,TextSize=8,Font=ae.b,
Size=UDim2 .new(1,0,0,fB and 36 or 28),BackgroundColor3=l.raise,BorderSizePixel=0,AutoButtonColor=true,LayoutOrder=a.nextIn(wh)},wh)
ab(a2,9)local aw={edge=a.stroke(a2,l.line,0.45)}aw.title=P(a2,Gq,11,l.text,true,UDim2 .new(0,10,0,fB and 4 or 0),UDim2 .new(1,-100,0,fB and 15 or 28))
aw.title.TextWrapped,aw.title.TextTruncate=false,Enum.TextTruncate.AtEnd if fB then aw.sub=P(a2,fB,9,l.dim,false,UDim2 .new(0,10,0,19),UDim2 .new(1,-100,0,13))
aw.sub.TextWrapped,aw.sub.TextTruncate=false,Enum.TextTruncate.AtEnd end aw.pill=J("Frame",{Size=UDim2 .new(0,34,0,18),Position=UDim2 .new(1,-42,0.5,-9),BackgroundColor3=l.panel2,
BorderSizePixel=0},a2)ab(aw.pill,9)aw.knob=J("Frame",{Size=UDim2 .new(0,14,0,14),Position=UDim2 .new(0,2,0.5,-7),BackgroundColor3=l.dim,
BorderSizePixel=0},aw.pill)ab(aw.knob,7)aw.chip=J("TextLabel",{AnchorPoint=Vector2 .new(1,0.5),Position=UDim2 .new(1,-8,0.5,0),Size=UDim2 .new(0,0,0,18),
AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=l.panel2,BorderSizePixel=0,Font=ae.b,TextSize=9,TextColor3=l.dim,Text=""},a2)
ab(aw.chip,9)a.pad(aw.chip,10,0,10,0)J("UISizeConstraint",{MinSize=Vector2 .new(42,18),MaxSize=Vector2 .new(130,18)},aw.chip)
aw.chip.TextTruncate=Enum.TextTruncate.AtEnd a.sw[a2]=aw T(a2:GetPropertyChangedSignal("Text"):Connect(function()a.skin(a2)end))
a.skin(a2)return a2 end function a.chips(nI)if a.sw[nI]then a.sw[nI].chips=true a.skin(nI)end end function a.line(Gr,Gs)
local wi=a.row(Gr,15)local wj=J("Frame",{Size=UDim2 .new(0,6,0,6),Position=UDim2 .new(0,1,0.5,-3),BackgroundColor3=Gs or l.dim,
BorderSizePixel=0},wi)ab(wj,3)local nJ=P(wi,"",10,l.dim,false,UDim2 .new(0,12,0,0),UDim2 .new(1,-12,1,0))nJ.TextWrapped,nJ.TextTruncate=false,Enum.TextTruncate.AtEnd
return nJ,wj end function a.grow(wk,Gt,Gu)local it=J("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
Font=ae.m,TextSize=Gt or 10,TextColor3=Gu or l.dim,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",Visible=false,LayoutOrder=a.nextIn(wk)},wk)
T(it:GetPropertyChangedSignal("Text"):Connect(function()it.Visible=it.Text~=""end))return it end function a.note(Gv,Gw)
local wl=a.grow(Gv,9,l.dim)wl.Text=Gw return wl end function a.actions(Gx,wm)local Gy=a.row(Gx,28)local wn,nK={},#wm
for fC,wo in ipairs(wm)do wn[fC]=ai(Gy,wo[1],wo[2]or l.panel2,10,UDim2 .new((fC-1)/nK,fC>1 and 3 or 0,0,0),UDim2 .new(1/nK,(fC>1 and-3 or 0)+(fC<nK and-3 or 0),1,0))
end return table.unpack(wn)end local function M(cL,iu,Gz,GA)a.put(cL,iu and Gz or GA)if not a.sw[cL]and a.lit[cL]~=iu then
a.lit[cL]=iu cL.BackgroundColor3=iu and l.accent or l.panel2 cL.TextColor3=a.ink(cL.BackgroundColor3)end end a.title=J("Frame",{Size=UDim2 .new(1,0,0,Q.head),BackgroundColor3=l.panel,BorderSizePixel=0,Active=true},a.root)
ab(a.title,14)J("Frame",{Size=UDim2 .new(1,0,0,14),Position=UDim2 .new(0,0,1,-14),BackgroundColor3=l.panel,BorderSizePixel=0},a.title)
J("Frame",{Size=UDim2 .new(1,0,0,1),Position=UDim2 .new(0,0,1,-1),BackgroundColor3=l.line,BorderSizePixel=0,ZIndex=2},a.title)
do local nL=J("Frame",{Size=UDim2 .new(0,26,0,26),Position=UDim2 .new(0,9,0.5,-13),BackgroundColor3=l.white,BorderSizePixel=0},a.title)
ab(nL,8)a.grad(nL,l.accent,l.accent2,45)local wp=P(nL,"C",16,l.ink,true)wp.Font,wp.TextXAlignment=ae.x,Enum.TextXAlignment.Center
local GB=P(a.title,"CHURN",15,l.text,true,UDim2 .new(0,42,0,4),UDim2 .new(0,120,0,18))GB.Font=ae.x P(a.title,"butter farm  "..b9,9,l.dim,false,UDim2 .new(0,42,0,21),UDim2 .new(0,120,0,12))
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
BorderSizePixel=0},a.root)do local GC=a.list(a.tabs,3)pcall(function()GC.HorizontalAlignment=Enum.HorizontalAlignment.Center end)
a.pad(a.tabs,5,6,6,6)end a.railH=math.clamp(math.floor((Q.h-Q.head-12)/9)-3,22,34)local function bw(GD,GE,GF)
local iv=J("TextButton",{Text=GD,Font=ae.b,TextSize=15,TextColor3=l.text,TextTransparency=0.45,Size=UDim2 .new(1,0,0,a.railH),BackgroundColor3=l.raise,BackgroundTransparency=1,BorderSizePixel=0,
AutoButtonColor=false,LayoutOrder=#a.tabsAll+1},a.tabs)ab(iv,9)local wq=J("Frame",{Size=UDim2 .new(0,3,0.56,0),Position=UDim2 .new(0,-5,0.22,0),BackgroundColor3=l.accent,
BorderSizePixel=0,Visible=false},iv)ab(wq,2)a.tabsAll[#a.tabsAll+1]={b=iv,bar=wq,name=GE,sub=GF}return iv end
a.tabFarm=bw("🏠","Home","what the farm is doing")a.tabRun=bw("🌾","Farm","the buy - wax - collect loop")a.tabBut=bw("🧈","Butters","what gets bought and waxed")
a.tabCrt=bw("📦","Crates","which crates get opened")a.tabPet=bw("🐾","Pets","adopt, wish, fuse")a.tabTeam=bw("👥","Teams","the right pets at the right moment")
a.tabSrv=bw("🤝","Server","helping, campfire, ghost")a.tabAdm=bw("⚡","Admin","admin abuse and its boosts")a.tabSet=bw("⚙","Settings","configs, startup, performance")
local function bx()local nM=J("ScrollingFrame",{Position=UDim2 .new(0,Q.rail,0,Q.head+Q.status+10),Size=UDim2 .new(1,-Q.rail,1,-(Q.head+Q.status+10)),BackgroundTransparency=1,BorderSizePixel=0,
ScrollBarThickness=3,ScrollBarImageColor3=l.accent,ScrollBarImageTransparency=0.35,CanvasSize=UDim2 .new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,
ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false},a.root)a.list(nM,8)a.pad(nM,8,2,10,12)return nM end
a.farm,a.run,a.but,a.crt,a.pet,a.team,a.srv,a.adm,a.set=bx(),bx(),bx(),bx(),bx(),bx(),bx(),bx(),bx()a.farm.Visible=true
do local fD=a.farm local wr=a.row(fD,34)a.startB=ai(wr,"START",l.good,14,UDim2 .new(0,0,0,0),UDim2 .new(0.7,-3,1,0))
a.startB.Font=ae.x a.grad(a.startB,l.white,Color3 .fromRGB(215,215,215),90)a.killB=ai(wr,"KILL",l.raise,12,UDim2 .new(0.7,3,0,0),UDim2 .new(0.3,-3,1,0))
a.killB.TextColor3=l.bad a.stroke(a.killB,l.bad,0.5)local GG=a.row(fD,44)local function fE(ws,GH,wt)local iw=J("Frame",{Position=UDim2 .new((ws-1)/wt,ws>1 and 2 or 0,0,0),Size=UDim2 .new(1/wt,-4,1,0),
BackgroundColor3=l.panel,BorderSizePixel=0},GG)ab(iw,9)a.stroke(iw,l.line,0.3)local ix=P(iw,"0",14,l.text,true,UDim2 .new(0,0,0,5),UDim2 .new(1,0,0,18))
ix.Font,ix.TextXAlignment,ix.TextWrapped=ae.x,Enum.TextXAlignment.Center,false local GI=P(iw,GH,8,l.dim,true,UDim2 .new(0,0,0,25),UDim2 .new(1,0,0,12))
GI.TextXAlignment=Enum.TextXAlignment.Center return ix end a.sBought,a.sPlaced,a.sSold,a.sColl,a.sFree=fE(1,"BOUGHT",5),fE(2,"WAXED",5),fE(3,"SOLD",5),fE(4,"MONEY",5),fE(5,"FREE",5)
local wu=a.card(fD,"Right now")a.info=P(a.row(wu,40),"",10,l.text,false)a.info.TextYAlignment=Enum.TextYAlignment.Top
a.tgt=P(a.row(wu,14),"",10,l.good,true)a.tgt.TextWrapped,a.tgt.TextTruncate=false,Enum.TextTruncate.AtEnd local fF=a.card(fD,"Systems")
a.helpL=a.line(fF,l.info)a.campL=a.line(fF,l.accent2)a.questL=a.line(fF,l.good)a.arL=a.line(fF,l.accent)a.ixL=a.line(fF,np.Dotonbori)
local wv=a.card(fD,"Activity")a.log=J("TextLabel",{Size=UDim2 .new(1,0,0,86),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="",LayoutOrder=a.nextIn(wv)},wv)
ab(a.log,7)a.pad(a.log,7,5,7,5)end local function K0(GJ,GK)return a.row(GK or a.farm,GJ)end local al do local nN=a.run
a.heading(nN,"Farm","buy what rolls, wax it, collect the cash")local fG=a.card(nN,"Loop")a.colT=a.switch(fG,"COLLECT: ON","Collect cash","step on the collector by itself")
al=a.row(fG,26)P(al,"collect every",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.45,-10,1,0))a.secB=ij(al,tostring(e.Every),"60",UDim2 .new(0.45,0,0,0),UDim2 .new(0.25,-4,1,0))
P(al,"s",10,l.dim,false,UDim2 .new(0.7,-2,0,0),UDim2 .new(0,10,1,0))a.secSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
a.sellT=a.switch(fG,"SELL THEM: ON","Sell junk","anything not ticked is sold, never waxed")a.arT=a.switch(fG,"AUTO ROLL: OFF","Auto Roll","keep the game's Auto Roll pass running")
a.questT=a.switch(fG,"QUESTS: OFF","Event quests","claim them, pull or collect when asked")local nO=a.card(nN,"By hand")
a.buyB,a.plB=a.actions(nO,{{"BUY THE PAD",l.warn},{"WAX WHAT I HOLD",l.good}})a.sellB,a.crateB=a.actions(nO,{{"SELL WHAT I HOLD",l.panel2},{"OPEN CRATE NOW",l.panel2}})
al=a.row(nO,28)a.padB=ai(al,"SET PAD (stand on it)",l.panel2,10,UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))a.padL=P(al,"",10,l.dim,false,UDim2 .new(0.5,10,0,0),UDim2 .new(0.5,-10,1,0))
end do local iy=a.but a.heading(iy,"Butters","what gets bought and waxed")local ww=a.card(iy,"Strategy")a.ixT=a.switch(ww,"AUTO INDEX: OFF","Auto Index","wax each butter missing from your Index")
a.bestT=a.switch(ww,"BEST BUTTER: OFF","Best butter","TOP 1-3 of the game, or UPGRADES")a.butList=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iy)},iy)a.list(a.butList,5)end do local iz=a.crt a.heading(iz,"Crates","only ticked crates are opened")
local wx=a.card(iz,"Opening")a.crateT=a.switch(wx,"OPEN CRATES: ON","Open ticked crates","the rest are left for the game")
a.bcT=a.switch(wx,"BEST CRATE: OFF","Best crate too","the game's dearest one, new ones too")a.crtList=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(iz)},iz)a.list(a.crtList,5)end do local fH=a.pet a.heading(fH,"Pets","adopt, wish, fuse Bigs and Huges")
local fI=a.card(fH,"Automatic")a.pbT=a.switch(fI,"AUTO ADOPT: OFF","Auto adopt","pets marked BUY, from the pen")
a.pwT=a.switch(fI,"AUTO WISH: OFF","Auto wish","WISH pets, stacked to x5")a.pfT=a.switch(fI,"AUTO FUSE: OFF","Auto fuse","Bigs and Huges, never weakening a team")
a.pInfo=a.grow(fI,10,l.dim)a.note(fI,"BUY adopt it  -  ANY / BIG only its Big  -  WISH keep a wish going  -  AUTO fuse it as the plan says  /  KEEP never fuse it")
local wy=a.card(fH,"The plan","best teams with every pet")a.planInfo=a.grow(wy,10,l.text)a.note(wy,"Copies are bought and wished for until you have what these teams need. A fuse only happens when every team is at least as good after it, so nothing gets weaker on the way.")
a.petList=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,LayoutOrder=a.nextIn(fH)},fH)
a.list(a.petList,4)end do a.heading(a.team,"Teams","the right pets at the right moment")a.teamList=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,
LayoutOrder=a.nextIn(a.team)},a.team)a.list(a.teamList,8)end do local iA=a.srv a.heading(iA,"Server","other players, the campfire, staying hidden")
local nP=a.card(iA,"Helping")a.helpT=a.switch(nP,"HELP WAXES: OFF","Help waxes","other players' waxes in this server")
a.helpGT=a.switch(nP,"GUILD CALLS: OFF","Guild calls","answer guildmates' \"need help\" calls")a.srvHelp=a.line(nP,l.info)
local wz=a.card(iA,"Campfire")a.campT=a.switch(wz,"CAMPFIRE: OFF","Sit at the campfire","+50% cash for each camper")
a.srvCamp=a.line(wz,l.accent2)local nQ=a.card(iA,"Ghost")a.ghostT=a.switch(nQ,"GHOST: OFF","Ghost mode","HELP: hidden helps  FULL: underground")
a.srvGhost=a.line(nQ,l.dim)a.note(nQ,"The round C button's small chip switches ghost too, without opening this window.",24)
end do local fJ=a.adm a.heading(fJ,"Admin abuse","the show, its boosts and the farm in it")local wA=a.card(fJ,"When")
a.admBig=P(a.row(wA,22),"-",15,l.text,true)a.admBig.Font=ae.x a.admSub=P(a.row(wA,14),"",10,l.dim,false)local GL=a.card(fJ,"Boosts now")
a.admBoost=a.grow(GL,11,l.text)local nR=a.card(fJ,"What the farm does")a.shT=a.switch(nR,"GRAB SHOWER: ON","Grab the butter shower","wanted pieces first, then the rarest")
a.snapT=a.switch(nR,"SNAP GLAZE: ON","Glaze team for the snap","every wax finishes at once")a.admStat=a.line(nR,l.accent)
local wB=a.card(fJ,"Show feed")a.admFeed=J("TextLabel",{Size=UDim2 .new(1,0,0,70),BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,
TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Text="nothing yet",LayoutOrder=a.nextIn(wB)},wB)
ab(a.admFeed,7)a.pad(a.admFeed,7,5,7,5)end do local cM=a.set a.heading(cM,"Settings","kept on your phone, per config")
local iB=a.card(cM,"Config")al=a.row(iB,28)a.cfgName=ij(al,"default","config name",UDim2 .new(0,0,0,0),UDim2 .new(0.5,-3,1,0))
a.cfgSave=ai(al,"SAVE",l.good,11,UDim2 .new(0.5,3,0,0),UDim2 .new(0.25,-6,1,0))a.cfgLoad=ai(al,"LOAD",l.accent,11,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
al=a.row(iB,26)a.cfgPrev=ai(al,"<",l.panel2,12,UDim2 .new(0,0,0,0),UDim2 .new(0,30,1,0))a.cfgPick=ai(al,"(none saved)",l.raise,10,UDim2 .new(0,34,0,0),UDim2 .new(1,-68,1,0))
a.cfgNext=ai(al,">",l.panel2,12,UDim2 .new(1,-30,0,0),UDim2 .new(0,30,1,0))a.cfgAuto=a.switch(iB,"LOAD IT ON LAUNCH: OFF","Load on launch","this config comes back every start")
a.cfgMsg=a.grow(iB,10,l.dim)local nS=a.card(cM,"Starting")a.startT=a.switch(nS,"START FARMING ON LOAD: ON","Start farming on load","START / STOP also sets this")
a.autoB=a.actions(nS,{{"INSTALL AUTOEXEC LOADER",l.panel2}})a.autoMsg=a.grow(nS,9,l.dim)local nT=a.card(cM,"If the game drops me")
a.rejT=a.switch(nT,"AUTO REJOIN: ON","Auto rejoin","after a disconnect or a restart")a.rejB=a.actions(nT,{{"REJOIN NOW",l.panel2}})
a.rejMsg=a.grow(nT,9,l.dim)local by=a.card(cM,"Performance")a.pfCalm=a.switch(by,"NO ANIMATIONS: OFF","No animations","stack squish, rainbows, pets walking")
a.pfLite=a.switch(by,"LITE MODE: OFF","Lite mode","roll show, fireworks, toppings, labels off")a.pfBases=a.switch(by,"BASES: ALL DRAWN","Bases","hidden bases' stacks also leave memory")
a.pfFps=a.switch(by,"FPS CAP: GAME","FPS cap","lower keeps the phone cooler")a.pfHud=a.switch(by,"HIDE GAME HUD: OFF","Hide the game's menus")
a.pfRender=a.switch(by,"STOP 3D: OFF","Stop 3D","blank the world behind this window")al=a.row(by,28)P(al,"rejoin above",10,l.dim,false,UDim2 .new(0,10,0,0),UDim2 .new(0.36,-10,1,0))
a.pfMem=ij(al,tostring(e.MemLimit),"1250",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))P(al,"MB",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,22,1,0))
a.pfMemSet=ai(al,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))a.pfInfo=a.line(by,l.good)a.note(by,"Everything here is undone when switched off or on KILL. Rejoin above: this phone struggles past ~1 GB; 0 = never.",24)
local GM=a.card(cM,"Your game passes","read from the game")a.passInfo=a.grow(GM,10,l.text)local GN=a.card(cM,"About")
a.note(GN,"CHURN "..b9 .." for Stack A Butter Squishy. The round C button hides or shows this window - hold and drag it anywhere. Drag this window by its top bar. The farm keeps running either way.",40)
end for K1,GO in ipairs({a.ghostT,a.bestT,a.pfBases,a.pfFps,a.cfgAuto})do a.chips(GO)end local wC=J("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},nt)
a.tgRoot=J("Frame",{Size=UDim2 .new(0,42,0,42),Position=c.togPos and UDim2 .new(0,c.togPos[1],0,c.togPos[2])or UDim2 .new(0,10,0.45,-20),
BackgroundColor3=l.accent,BorderSizePixel=0,Active=true},wC)ab(a.tgRoot,21)a.stroke(a.tgRoot,l.white,0.75)a.grad(a.tgRoot,l.white,Color3 .fromRGB(255,170,120),45)
a.tgBtn=J("TextButton",{Text="C",Size=v4,BackgroundTransparency=1,Font=ae.x,TextSize=19,TextColor3=l.ink,AutoButtonColor=false},a.tgRoot)
a.tgDot=J("Frame",{Size=UDim2 .new(0,10,0,10),Position=UDim2 .new(1,-10,0,0),BackgroundColor3=l.dim,BorderSizePixel=0},a.tgRoot)
ab(a.tgDot,5)a.stroke(a.tgDot,l.bg,0)a.tgGhost=J("TextButton",{Text="G: OFF",Size=UDim2 .new(0,50,0,18),Position=UDim2 .new(0.5,-25,1,5),
BackgroundColor3=l.panel,Font=ae.b,TextSize=9,TextColor3=l.dim,AutoButtonColor=false,BorderSizePixel=0},a.tgRoot)
ab(a.tgGhost,9)a.stroke(a.tgGhost,l.line,0)a.tgGhost.MouseButton1Click:Connect(function()d.cycleGhost()end)function d.paintGhost()
local fK=d.ghostMode()if a.ghostT then a.put(a.ghostT,d.GHOST[fK][1])end if a.tgGhost then a.tgGhost.Text=d.GHOST[fK][2]
a.tgGhost.BackgroundColor3=fK==2 and l.accent or(fK==1 and l.warn or l.panel)a.tgGhost.TextColor3=fK>0 and l.ink or l.dim
end end local bz={built=false,boxes={},at=0}function a.check(iC,nU)iC.Text=nU and"✓"or""iC.BackgroundColor3=nU and l.accent or l.bg
iC.TextColor3=l.ink local nV=iC.Parent if nV and nV:IsA("TextButton")then nV.BackgroundColor3=nU and l.lit or l.raise end
end local function wD(wE,wF)e.Targets[wE]=wF or nil local wG=bz.boxes[wE]if wG then a.check(wG,wF)end end local function nW()
for GP,GQ in pairs(bz.boxes)do a.check(GQ,e.Targets[GP]==true)end end function a.tickBox(GR)local nX=J("TextButton",{Text="",Size=UDim2 .new(0,20,0,20),Position=UDim2 .new(1,-27,0.5,-10),
BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.x,TextSize=13,TextColor3=l.ink,AutoButtonColor=false},GR)ab(nX,6)
a.stroke(nX,l.line,0)return nX end local fL local function GS()local GT=a.card(a.butList,"Butter list")local nY=a.row(GT,26)
a.butInfo=P(nY,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))local GU=ai(nY,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))
local GV=ai(nY,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))GU.MouseButton1Click:Connect(function()
for GW in pairs(e.Targets)do e.Targets[GW]=nil end nW()end)GV.MouseButton1Click:Connect(function()ad.at=0 jM()
fL(true)end)end fL=function(GX)if not jM()then if not a.butEmpty then a.butEmpty=P(a.row(a.butList,40),"butter list not loaded yet - open this tab again in a moment",11,l.warn,false)
end return end if bz.built and not GX and bz.at==ad.at then return end for K2,iD in ipairs(a.butList:GetChildren())do
if iD:IsA("Frame")or iD:IsA("TextButton")or iD:IsA("TextLabel")then iD:Destroy()end end bz.boxes,a.butEmpty={},nil
GS()for K3,iE in ipairs(ad.rarOrder)do local nZ=np[iE]or l.text local cN=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,
BorderSizePixel=0,LayoutOrder=a.nextIn(a.butList)},a.butList)ab(cN,11)a.stroke(cN,nZ,0.7)a.list(cN,4)a.pad(cN,7,7,7,8)
local n0=a.row(cN,22)J("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=nZ,BorderSizePixel=0},n0)
local GY=P(n0,iE:upper(),11,nZ,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-74,1,0))GY.Font=ae.x local GZ=ai(n0,"ALL",l.panel2,9,UDim2 .new(1,-54,0.5,-10),UDim2 .new(0,54,0,20))
local G0=iE GZ.MouseButton1Click:Connect(function()local wH=ad.members[G0]or{}local wI=false for K4,G1 in ipairs(wH)do if not e.Targets[G1]then wI=true break end end
for K5,G2 in ipairs(wH)do wD(G2,wI)end end)for K6,n1 in ipairs(ad.members[iE]or{})do local iF=J("TextButton",{Text="",Size=UDim2 .new(1,0,0,26),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(cN)},cN)ab(iF,8)local wJ=P(iF,ak(n1),11,l.text,false,UDim2 .new(0,10,0,0),UDim2 .new(1,-44,1,0))
wJ.TextWrapped,wJ.TextTruncate=false,Enum.TextTruncate.AtEnd local wK=a.tickBox(iF)bz.boxes[n1]=wK local wL=n1
local function wM()wD(wL,not e.Targets[wL])end iF.MouseButton1Click:Connect(wM)wK.MouseButton1Click:Connect(wM)
end end nW()bz.built,bz.at=true,ad.at end function L.paint()for G3,G4 in pairs(L.boxes)do a.check(G4,e.CrateTicks[G3]==true)end
if a.crtInfo then local n2,n3=0,0 for K7 in pairs(L.boxes)do n2=n2+1 end for K8,G5 in pairs(e.CrateTicks)do if G5 then n3=n3+1 end end
a.put(a.crtInfo,("%d crates, %d ticked"):format(n2,n3))end if a.crateT then M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end
end function L.build()for K9,iG in ipairs(a.crtList:GetChildren())do if iG:IsA("Frame")or iG:IsA("TextButton")or iG:IsA("TextLabel")then iG:Destroy()end
end L.boxes={}local n4=a.card(a.crtList,"All of them","worst first")local n5=a.row(n4,26)a.crtInfo=P(n5,"",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.5,-2,1,0))
local G6=ai(n5,"CLEAR",l.panel2,10,UDim2 .new(0.5,0,0,0),UDim2 .new(0.25,-3,1,0))local G7=ai(n5,"REFRESH",l.panel2,10,UDim2 .new(0.75,3,0,0),UDim2 .new(0.25,-3,1,0))
T(G6 .MouseButton1Click:Connect(function()e.CrateTicks={}L.paint()end))T(G7 .MouseButton1Click:Connect(function()L.build()end))
for K_,bA in ipairs(L.list())do local wN=np[bA.rar or""]or l.text local dG=J("TextButton",{Text="",Size=UDim2 .new(1,0,0,28),BackgroundColor3=l.raise,BorderSizePixel=0,
AutoButtonColor=true,LayoutOrder=a.nextIn(n4)},n4)ab(dG,8)J("Frame",{Size=UDim2 .new(0,3,0,14),Position=UDim2 .new(0,6,0.5,-7),BackgroundColor3=wN,BorderSizePixel=0},dG)
local wO=P(dG,(bA.title or bA.name)..(bA.guess and"  (?)"or""),11,wN,true,UDim2 .new(0,15,0,0),UDim2 .new(0.62,-15,1,0))
wO.TextWrapped,wO.TextTruncate=false,Enum.TextTruncate.AtEnd local G8=P(dG,bA.price and("$"..aD(bA.price))or(bA.rar or""),10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0.38,-34,1,0))
G8 .TextXAlignment=Enum.TextXAlignment.Right local wP=a.tickBox(dG)L.boxes[bA.k]=wP local wQ=bA.k local function wR()
e.CrateTicks[wQ]=(not e.CrateTicks[wQ])or nil L.paint()end T(dG.MouseButton1Click:Connect(wR))T(wP.MouseButton1Click:Connect(wR))
end L.built=L.at L.paint()end local wS="farm"a.tabKeys={"farm","run","but","crt","pet","team","srv","adm","set"}
local function a3(cO)wS=cO for G9,n6 in ipairs(a.tabKeys)do a[n6].Visible=(n6==cO)local iH=a.tabsAll[G9]if iH then
local n7=n6==cO iH.b.BackgroundTransparency,iH.b.TextTransparency,iH.bar.Visible=n7 and 0 or 1,n7 and 0 or 0.45,n7
end end if cO=="pet"and not o.built then pcall(o.build)end if cO=="team"and not A.built then pcall(A.build)end
if cO=="crt"and(L.built~=L.at or not next(L.boxes))then L.build()end if cO=="but"then fL(false)end end o.RC={Common=Color3 .fromRGB(120,220,120),Rare=Color3 .fromRGB(90,170,255),Epic=Color3 .fromRGB(190,110,255),
Legendary=Color3 .fromRGB(255,210,70),Mythic=Color3 .fromRGB(255,90,150),Exotic=Color3 .fromRGB(90,235,215),Cosmic=Color3 .fromRGB(150,130,255)}
function a.flag(n8,wT,wU,wV)if wV then n8 .Text=wV end n8 .BackgroundColor3=wT and wU or l.bg n8 .TextColor3=wT and a.ink(wU)or l.dim
end function o.paintRow(wW)local cP=o.rows and o.rows[wW]if not cP then return end local cQ=e.Pets[wW]or{}local wX=tonumber(cQ.f)==-1
a.flag(cP.b,cQ.b,l.good)a.flag(cP.g,cQ.g,l.accent,cQ.g and"BIG"or"ANY")a.flag(cP.w,cQ.w,l.warn)a.flag(cP.f,not wX,l.good,wX and"KEEP"or"AUTO")
if cP.row then cP.row.BackgroundColor3=(cQ.b or cQ.w)and l.lit or l.raise end end function o.flag(n9,iI)local bc=e.Pets[n9]or{}
if iI=="f"then bc.f=tonumber(bc.f)~=-1 and-1 or nil elseif bc[iI]then bc[iI]=nil else bc[iI]=true end e.Pets[n9]=(bc.b or bc.g or bc.w or bc.f)and bc or nil
o.paintRow(n9)end function o.paintAll()for G_ in pairs(o.rows or{})do o.paintRow(G_)end if a.pbT then M(a.pbT,e.PetBuy,"AUTO ADOPT: ON","AUTO ADOPT: OFF")
M(a.pwT,e.PetWish,"AUTO WISH: ON","AUTO WISH: OFF")M(a.pfT,e.AutoFuse,"AUTO FUSE: ON","AUTO FUSE: OFF")end end
function y.planText(Ha)local wY=y.dreamT if not wY then return"working the plan out..."end local Hb,Hc=y.needFor(""),y.needFor("Big")
local cR={("%d copies make a Big, %d Bigs a Huge | %d pets worn"):format(Hb,Hc,y.slots())}for La,wZ in ipairs(y.dreamTeams or{})do cR[#cR+1]=wZ.team:upper()..": "..table.concat(wZ.names,", ")end
local iJ,iK,iL=0,0,0 for w0,w1 in pairs(wY)do local w2,Hd=y.have(w0,Ha)local Lb,He=y.goal(w0)iJ=iJ+math.max(0,w1 .Huge-w2 .Huge)
iK=iK+math.max(0,w1 .Big-w2 .Big)iL=iL+math.max(0,He-Hd)end cR[#cR+1]=(iJ+iK+iL==0)and"every planned pet is there"
or("to go: %d Huge, %d Big | %d more copies to find"):format(iJ,iK,iL)if y.fuseMsg~=""then cR[#cR+1]=y.fuseMsg end
return table.concat(cR,"\n")end function o.live()if not o.built then o.build()return end if z()-(o.liveAt or 0)<1 then return end
o.liveAt=z()local n_=o.wishes()local dH=o.data()for iM,oa in pairs(o.rows)do local w3=y.status(iM,dH)oa.desc.Text=(n_[iM]and("wishing %dm | "):format(math.ceil(n_[iM]/60))or"")..(w3 and(w3 .." | ")or"")..oa.boostText
oa.desc.TextColor3=n_[iM]and l.text or l.dim end if a.planInfo then a.put(a.planInfo,y.planText(dH))end local w4=tonumber(H:GetAttribute("PetWishCredits"))or 0
a.pInfo.Text=("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(dH and#(dH.pets or{})or 0,dH and tonumber(dH.maxOwned)or 60,
aD(o.money()),w4>0 and(" | free wishes "..w4)or"",o.buyMsg~=""and o.buyMsg or"-",o.wishMsg~=""and o.wishMsg or"-")
end function o.build()local iN=o.info()for Lc,iO in ipairs(a.petList:GetChildren())do if iO:IsA("Frame")or iO:IsA("TextLabel")or iO:IsA("TextButton")then iO:Destroy()end
end o.rows={}if not iN then P(a.row(a.petList,30),"pet list not loaded yet - open this tab again in a moment",11,l.warn,false)
o.built=false return end local dI={}for Ld,w5 in ipairs(o.order())do local ob=iN.Pets[w5].rarity or"?"dI[ob]=dI[ob]or{}
table.insert(dI[ob],w5)end local dJ={}for Le,w6 in ipairs(iN.Rarities or{})do if dI[w6]then dJ[#dJ+1]=w6 end end
for w7 in pairs(dI)do if not table.find(dJ,w7)then dJ[#dJ+1]=w7 end end for Lf,oc in ipairs(dJ)do local iP=o.RC[oc]or l.text
local cS=J("Frame",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.panel,BorderSizePixel=0,LayoutOrder=a.nextIn(a.petList)},a.petList)
ab(cS,11)a.stroke(cS,iP,0.7)a.list(cS,4)a.pad(cS,7,7,7,8)local w8=a.row(cS,18)J("Frame",{Size=UDim2 .new(0,4,0,14),Position=UDim2 .new(0,1,0.5,-7),BackgroundColor3=iP,BorderSizePixel=0},w8)
local Hf=P(w8,oc:upper(),11,iP,true,UDim2 .new(0,11,0,0),UDim2 .new(1,-11,1,0))Hf.Font=ae.x for Lg,iQ in ipairs(dI[oc])do
local fM=J("Frame",{Size=UDim2 .new(1,0,0,54),BackgroundColor3=l.raise,BorderSizePixel=0,LayoutOrder=a.nextIn(cS)},cS)
ab(fM,8)local od=P(fM,o.nice(iQ),11,iP,true,UDim2 .new(0,9,0,5),UDim2 .new(1,-172,0,22))od.TextWrapped,od.TextTruncate=false,Enum.TextTruncate.AtEnd
local Hg,Hh=pcall(function()return iN.describe(iQ)end)local w9=Hg and tostring(Hh)or""local oe=P(fM,w9,9,l.dim,false,UDim2 .new(0,9,0,31),UDim2 .new(1,-18,0,19))
oe.TextYAlignment,oe.TextTruncate=Enum.TextYAlignment.Top,Enum.TextTruncate.AtEnd local function iR(Hi,Hj,Hk)
local w_=ai(fM,Hi,l.bg,8,UDim2 .new(1,Hj,0,5),UDim2 .new(0,Hk,0,22))w_.AutoButtonColor=true return w_ end local xa,xb,xc,xd=iR("BUY",-164,30),iR("ANY",-131,30),iR("WISH",-98,34),iR("AUTO",-61,56)
local iS=iQ xa.MouseButton1Click:Connect(function()o.flag(iS,"b")end)xb.MouseButton1Click:Connect(function()o.flag(iS,"g")end)
xc.MouseButton1Click:Connect(function()o.flag(iS,"w")end)xd.MouseButton1Click:Connect(function()o.flag(iS,"f")end)
o.rows[iQ]={b=xa,g=xb,w=xc,f=xd,name=od,desc=oe,boostText=w9,row=fM}end end o.built=true o.paintAll()end function d.paint()
M(a.pfLite,e.Lite,"LITE MODE: ON","LITE MODE: OFF")M(a.pfCalm,e.Calm,"NO ANIMATIONS: ON","NO ANIMATIONS: OFF")
M(a.pfHud,e.HideHud,"HIDE GAME HUD: ON","HIDE GAME HUD: OFF")M(a.pfRender,e.NoRender,"STOP 3D: ON","STOP 3D: OFF")
M(a.pfBases,e.HideBases,d.BASES[d.basesMode()],d.BASES[0])M(a.pfFps,(e.FpsCap or 0)~=0,"FPS CAP: "..tostring(e.FpsCap),"FPS CAP: GAME")
if not a.pfMem:IsFocused()then a.pfMem.Text=tostring(e.MemLimit)end end function d.applyAll()if e.Lite then d.lite(true)end
if e.Calm then d.calm(true)end if e.HideHud then d.hideHud(true)end if e.NoRender then d.render(true)end if e.HideBases then d.bases(true)end
if(e.FpsCap or 0)~=0 then d.cap(e.FpsCap)end d.paint()end T(a.pfLite.MouseButton1Click:Connect(function()d.lite(not e.Lite)d.paint()end))
T(a.pfCalm.MouseButton1Click:Connect(function()d.calm(not e.Calm)d.paint()end))T(a.pfHud.MouseButton1Click:Connect(function()d.hideHud(not e.HideHud)d.paint()end))
T(a.pfRender.MouseButton1Click:Connect(function()d.render(not e.NoRender)d.paint()end))T(a.pfBases.MouseButton1Click:Connect(function()d.setBases((d.basesMode()+1)%3)d.paint()end))
T(a.pfFps.MouseButton1Click:Connect(function()local Hl=table.find(d.CAPS,e.FpsCap or 0)or 1 local xe=d.CAPS[(Hl%#d.CAPS)+1]
if not d.cap(xe)and xe~=0 then C("this executor cannot cap fps")end d.paint()end))T(a.pfMemSet.MouseButton1Click:Connect(function()
local of=tonumber(a.pfMem.Text)if of and of>=0 then e.MemLimit=math.floor(of)end d.paint()end))function A.names()
local og={"(none)"}for Lh,Hm in ipairs((A.teams()))do og[#og+1]=Hm.name end return og end function A.cycle(oh,Hn)
local iT=A.names()local Ho=e[oh]~=""and e[oh]or"(none)"local iU=table.find(iT,Ho)or 1 iU=((iU-1+Hn)%#iT)+1 e[oh]=iT[iU]=="(none)"and""or iT[iU]
A.paint()end function A.paint()if not A.built then return end M(a.tmT,e.Teams,"AUTO TEAMS: ON","AUTO TEAMS: OFF")
M(a.tmBuild,e.AutoBuild,"AUTO BUILD TEAMS: ON","AUTO BUILD TEAMS: OFF")local oi={}for Li,Hp in ipairs((A.teams()))do oi[Hp.name]=true end
for Hq,xf in pairs(A.pick)do local dK=e[Hq]xf.Text=dK==""and"(none)"or(oi[dK]and dK or(dK.." (missing)"))xf.TextColor3=(dK~=""and not oi[dK])and l.bad or l.text
end if not a.tmLead:IsFocused()then a.tmLead.Text=tostring(e.GlazeLead)end a.tmInfo.Text=(A.msg or"")..("\nswitches %d | finished %d | glazed %d | fused %d"):format(A.switches,A.finished,A.glazed,y.fused)
..(y.buildMsg~=""and("\n"..y.buildMsg)or"")local Hr,iV=o.srv(),{}for Lj,iW in ipairs(A.list or{})do iV[#iV+1]=("st %-2s %-22s %9s  helps %d"):format(iW.st.Name,ak(W(iW.name)):sub(1,22),A.clock(iW.ends-Hr),iW.helps)
end a.tmList.Text=#iV>0 and table.concat(iV,"\n")or"no waxes running"end function A.build()for Lk,iX in ipairs(a.teamList:GetChildren())do
if iX:IsA("Frame")or iX:IsA("TextLabel")or iX:IsA("TextButton")then iX:Destroy()end end A.pick={}local iY=a.card(a.teamList,"Automatic")
a.tmT=a.switch(iY,"AUTO TEAMS: OFF","Auto teams","the right saved team for each moment")a.tmT.MouseButton1Click:Connect(function()
e.Teams=not e.Teams if e.Teams and e.TeamNormal==""then e.TeamNormal=A.current()end A.paint()end)a.tmBuild=a.switch(iY,"AUTO BUILD TEAMS: OFF","Auto build teams","again after new pets or fuses")
a.tmBuild.MouseButton1Click:Connect(function()e.AutoBuild=not e.AutoBuild A.paint()end)a.tmBuildNow=a.actions(iY,{{"BUILD TEAMS NOW",l.warn}})
a.tmBuildNow.MouseButton1Click:Connect(function()if A.editing then return end y.buildMsg="building..."task.spawn(function()local Hs,Ht=pcall(y.rebuild,"you asked")if not Hs then C("BUILD ERR "..tostring(Ht))end end)
end)a.tmInfo=a.grow(iY,10,l.dim)local xg=a.card(a.teamList,"Which team when")local function iZ(i0,Hu,Hv)local fN=a.row(xg,54)
P(fN,Hu,11,l.text,true,UDim2 .new(0,2,0,0),UDim2 .new(1,-4,0,15))local xh=P(fN,Hv,9,l.dim,false,UDim2 .new(0,2,0,14),UDim2 .new(1,-4,0,13))
xh.TextWrapped,xh.TextTruncate=false,Enum.TextTruncate.AtEnd local Hw=ai(fN,"<",l.panel2,12,UDim2 .new(0,0,0,29),UDim2 .new(0,30,0,24))
local xi=ai(fN,"(none)",l.bg,10,UDim2 .new(0,34,0,29),UDim2 .new(1,-68,0,24))local Hx=ai(fN,">",l.panel2,12,UDim2 .new(1,-30,0,29),UDim2 .new(0,30,0,24))
Hw.MouseButton1Click:Connect(function()A.cycle(i0,-1)end)Hx.MouseButton1Click:Connect(function()A.cycle(i0,1)end)
xi.MouseButton1Click:Connect(function()A.cycle(i0,1)end)A.pick[i0]=xi end iZ("TeamNormal","Normal","the rest of the time: money + luck")
iZ("TeamFull","Full","every station busy: money + wax speed")iZ("TeamGlaze","Glaze","worn just before a wax finishes")
local i1=a.row(xg,26)P(i1,"glaze lead",10,l.dim,false,UDim2 .new(0,2,0,0),UDim2 .new(0.36,-2,1,0))a.tmLead=ij(i1,tostring(e.GlazeLead),"45",UDim2 .new(0.36,0,0,0),UDim2 .new(0.26,-4,1,0))
P(i1,"s",10,l.dim,false,UDim2 .new(0.62,0,0,0),UDim2 .new(0,12,1,0))local Hy=ai(i1,"SET",l.accent,10,UDim2 .new(0.75,4,0,0),UDim2 .new(0.25,-4,1,0))
Hy.MouseButton1Click:Connect(function()local i2=tonumber(a.tmLead.Text)if i2 and i2>=5 and i2<=600 then e.GlazeLead=math.floor(i2)else a.tmLead.Text=tostring(e.GlazeLead)end
A.paint()end)iZ("TeamWax","Wax","while a butter is placed: head starts")local xj=a.card(a.teamList,"Your waxes","time left, helps")
a.tmList=J("TextLabel",{Size=UDim2 .new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=l.bg,BorderSizePixel=0,Font=ae.mono,TextSize=9,TextColor3=l.text,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=false,Text="",LayoutOrder=a.nextIn(xj)},xj)ab(a.tmList,7)a.pad(a.tmList,7,5,7,6)
local Hz=a.card(a.teamList,"How it works")a.note(Hz,"Every running wax goes at the speed of the pets you wear right now (the times above are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team while placing, GLAZE team at a finish, FULL while every station is busy, NORMAL while stations wait. The lead counts in glaze-team time.",84)
A.built=true A.paint()end local function HA()a.secB.Text=tostring(e.Every)M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
if not e.Ghost then task.spawn(function()while c.busy do ag(0.1)end if not E.home then pcall(d.unpin)end end)end
M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=c.running then fm(e.AutoStart,true)end if c.winPos then a.root.Position=UDim2 .new(0,c.winPos[1],0,c.winPos[2])end
if c.togPos then a.tgRoot.Position=UDim2 .new(0,c.togPos[1],0,c.togPos[2])end b1(a.root)b1(a.tgRoot)c.lastCollect=z()
nW()L.paint()pcall(o.paintAll)pcall(A.paint)pcall(d.applyAll)end local function HB(xk)task.spawn(function()xk.TextColor3=l.bad
task.wait(0.8)if c.alive then xk.TextColor3=l.text end end)end local function xl()local xm=a.secB.Text:match("^%s*(%d+)%s*$")
local fO=xm and tonumber(xm)if not fO or fO<1 then a.secB.Text=tostring(e.Every)HB(a.secB)C("interval must be a whole number >= 1")
return end if fO==e.Every then return end e.Every,c.lastCollect=fO,z()C("collect every "..fO.."s")end local function N(HC,HD)T(HC.MouseButton1Click:Connect(HD))end
N(a.secSet,xl)T(a.secB.FocusLost:Connect(xl))N(a.colT,function()e.Collect,c.lastCollect=not e.Collect,z()M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
end)N(a.sellT,function()e.SellJunk=not e.SellJunk M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)N(a.sellB,function()
c.sellFails=0 task.spawn(as,"selling...",uG)end)N(a.arT,function()e.AutoRoll=not e.AutoRoll task.spawn(D.apply,"you asked",true)
end)N(a.crateT,function()e.Crates=not e.Crates M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")end)N(a.helpT,function()
e.Help=not e.Help E.nextAt,E.msg=0,e.Help and"looking for waxes to help"or"off"M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")
end)N(a.helpGT,function()e.HelpGuild=not e.HelpGuild M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
end)N(a.questT,function()e.Quests=not e.Quests F.at=0 M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")end)N(a.campT,function()
e.Campfire=not e.Campfire K.nextAt,K.fails,K.lost=0,0,0 M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")end)
N(a.ghostT,d.cycleGhost)function q.paint()M(a.snapT,e.SnapGlaze~=false,"SNAP GLAZE: ON","SNAP GLAZE: OFF")M(a.ixT,e.AutoIndex,"AUTO INDEX: ON","AUTO INDEX: OFF")
M(a.bestT,(e.Best or 0)>0,e.Best==4 and"BEST: UPGRADES"or("BEST: TOP "..tostring(e.Best)),"BEST BUTTER: OFF")
M(a.bcT,e.BestCrate,"BEST CRATE: ON","BEST CRATE: OFF")M(a.shT,e.Shower,"GRAB SHOWER: ON","GRAB SHOWER: OFF")
end function q.changed(HE)task.spawn(function()pcall(q.tick)if HE and not q.on()then q.fails,q.pauseUntil=0,0 pcall(q.sync,true)end
end)q.paint()end N(a.ixT,function()local HF=q.on()e.AutoIndex=not e.AutoIndex q.discAt=-100 q.changed(HF)end)
N(a.bestT,function()local HG=q.on()e.Best=((e.Best or 0)+1)%5 q.stackAt=-100 q.changed(HG)end)N(a.bcT,function()
local HH=q.on()e.BestCrate=not e.BestCrate q.changed(HH)end)N(a.shT,function()e.Shower=not e.Shower q.paint()
end)N(a.snapT,function()e.SnapGlaze=e.SnapGlaze==false q.paint()end)N(a.pbT,function()e.PetBuy=not e.PetBuy o.paintAll()end)
N(a.pwT,function()e.PetWish=not e.PetWish o.paintAll()end)N(a.pfT,function()e.AutoFuse=not e.AutoFuse o.paintAll()end)
function q.admPaint()local b3=o.srv()local b4 pcall(function()q.aac=q.aac or require(af:FindFirstChild("AdminAbuseClient"))
b4=q.aac:GetState()end)local dL,b5="nothing scheduled","the game has not announced one"if type(b4)=="table"then
local fP,a4,b6=tostring(b4 .Phase or""),tonumber(b4 .StartsAt),tonumber(b4 .EndsAt)if a4 and a4<1e9 then a4=nil end
if b6 and b6<1e9 then b6=nil end if fP=="Countdown"and a4 then dL,b5="starts in "..A.clock(a4-b3),os.date("%a %H:%M",math.floor(a4)).." your time"
elseif fP=="Live"and b6 then dL,b5="LIVE  -  "..A.clock(b6-b3).." left","the farm is grabbing, waxing and glazing through it"
elseif fP~=""and fP~="Idle"and b6 and b6>b3 then dL,b5=fP:lower().."  -  "..A.clock(b6-b3).." left","after the show"
elseif a4 and a4>b3 then dL,b5="next: "..os.date("%a %H:%M",math.floor(a4)),"your time"elseif a4 then dL,b5="no show coming","last one: "..os.date("%a %d %b, %H:%M",math.floor(a4)).." your time"
end if type(b4 .Kind)=="string"and b4 .Kind~=""then b5=b5 .."  |  "..b4 .Kind end end a.put(a.admBig,dL)a.put(a.admSub,b5)
local dM,oj={},af:FindFirstChild("AdminShow")if oj then local HI,HJ=pcall(function()return oj:GetAttributes()end)
for xn,dN in pairs(HI and HJ or{})do local i3=type(xn)=="string"and xn:match("^(.-)Mult$")local ol=i3 and tonumber(oj:GetAttribute(i3 .."Until"))
if i3 and type(dN)=="number"and dN~=1 and dN~=0 and ol and ol>b3 then dM[#dM+1]=("%s  x%s   %s left"):format(i3:gsub("(%l)(%u)","%1 %2"),(dN%1==0)and tostring(dN)or("%.2f"):format(dN),
A.clock(ol-b3))end end end table.sort(dM)a.put(a.admBoost,#dM>0 and table.concat(dM,"\n")or"no admin boost running right now")
a.admBoost.TextColor3=#dM>0 and l.accent or l.dim local i4=0 for Ll in pairs(O.drops)do i4=i4+1 end local xo=q.snapAt and(q.snapAt-b3)
a.put(a.admStat,("shower %d grabbed, %d missed%s  |  snap %s"):format(O.got,O.miss,i4>0 and(", "..i4 .." falling")or"",
xo and("in "..math.max(0,math.floor(xo)).."s")or"none coming"))a.put(a.admFeed,#q.feed>0 and table.concat(q.feed,"\n",math.max(1,#q.feed-6))
or"nothing yet - the show's effects appear here as they happen")end N(a.crateB,function()j.lastFail,j.summonFails,j.ignoreUntil,c.crateFails=0,0,0,0
task.spawn(as,"opening crate...",em,true)end)N(a.padB,function()c.plot=bB()or c.plot local xp,om=ap(),c.plot and c.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(xp and om and om:IsA("BasePart"))then C("SET PAD: need character and plot")return end c.manualPad=om.CFrame:ToObjectSpace(xp.HumanoidRootPart.CFrame)
En(c.manualPad)C("collect pad saved at your position")end)N(a.startB,function()fm(not c.running)end)N(a.buyB,function()
c.plot=bB()or c.plot task.spawn(as,"buying (manual)...",qk,true)end)N(a.plB,function()c.plot=bB()or c.plot task.spawn(as,"waxing (manual)...",qp)
end)N(a.tabFarm,function()a3("farm")end)N(a.tabRun,function()a3("run")end)N(a.tabSrv,function()a3("srv")end)N(a.tabAdm,function()a3("adm")end)
N(a.tabBut,function()a3("but")end)N(a.tabSet,function()a3("set")end)N(a.tabCrt,function()a3("crt")end)N(a.tabPet,function()a3("pet")end)
N(a.tabTeam,function()a3("team")end)local function HK(oo)c.hidden=oo a.root.Visible=not oo a.tgBtn.TextColor3=oo and l.text or l.ink
end v_(a.tgBtn,a.tgRoot,function()b1(a.tgRoot)c.togPos=ip(a.tgRoot)or c.togPos end)N(a.tgBtn,function()if(c.dragMoved[a.tgBtn]or 0)<8 then HK(not c.hidden)end
c.dragMoved[a.tgBtn]=0 end)local aM,ay={},0 local function b7()aM=pH()if#aM==0 then a.cfgPick.Text="(none saved)"
ay=0 return end if ay<1 or ay>#aM then ay=1 end a.cfgPick.Text=aM[ay]..("  (%d/%d)"):format(ay,#aM)end local function xq()
local xr=c.autoload~=nil a.cfgAuto.Text=xr and("LOAD IT ON LAUNCH: "..c.autoload)or"LOAD IT ON LAUNCH: OFF"a.cfgAuto.BackgroundColor3=xr and l.accent or l.panel2
end local function op()local xs=a.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if xs~=""then return xs end return(ay>0 and aM[ay])or""
end N(a.cfgSave,function()c.winPos=ip(a.root)or c.winPos c.togPos=ip(a.tgRoot)or c.togPos local xt,xu=gt(op())
a.cfgMsg.Text=xt and("saved as "..xu)or("could not save: "..xu)a.cfgMsg.TextColor3=xt and l.good or l.bad b7()
C(a.cfgMsg.Text)end)local function HL(oq)local ot,xv=pQ(oq)a.cfgMsg.Text=ot and("loaded "..xv)or("could not load: "..xv)
a.cfgMsg.TextColor3=ot and l.good or l.bad if ot then a.cfgName.Text=oq HA()task.spawn(D.apply,"config "..oq)
end C(a.cfgMsg.Text)end N(a.cfgLoad,function()HL(op())end)N(a.cfgPick,function()b7()if ay>0 then a.cfgName.Text=aM[ay]end
end)N(a.cfgPrev,function()if#aM==0 then b7()return end ay=(ay-2)%#aM+1 b7()a.cfgName.Text=aM[ay]end)N(a.cfgNext,function()
if#aM==0 then b7()return end ay=ay%#aM+1 b7()a.cfgName.Text=aM[ay]end)N(a.cfgAuto,function()if c.autoload then
pS(nil)a.cfgMsg.Text="it will not load a config on launch"else local fQ=op()local xw=false for Lm,HM in ipairs(pH())do if HM==fQ then xw=true end end
local HN=xw or gt(fQ)if HN and fQ~=""then pS(fQ)b7()a.cfgMsg.Text=fQ.." will load every time the script starts"
else a.cfgMsg.Text="name the config and save it first"end end a.cfgMsg.TextColor3=l.dim xq()end)N(a.autoB,function()
local xx,xy=zs()a.autoMsg.Text=xx and("installed. "..xy)or("failed: "..xy)a.autoMsg.TextColor3=xx and l.good or l.bad
C(a.autoMsg.Text)end)N(a.startT,function()e.AutoStart=not e.AutoStart M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
end)N(a.rejT,function()e.Rejoin=not e.Rejoin M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)N(a.rejB,function()d6("you asked")end)
local bd=false N(a.minB,function()bd=not bd a.tabs.Visible,a.railLine.Visible,a.railBg.Visible=not bd,not bd,not bd
if bd then for Ln,HO in ipairs(a.tabKeys)do a[HO].Visible=false end a.strip.Position,a.strip.Size=UDim2 .new(0,8,0,Q.head+6),UDim2 .new(1,-16,0,Q.status)
else a.strip.Position,a.strip.Size=UDim2 .new(0,Q.rail+8,0,Q.head+6),UDim2 .new(1,-(Q.rail+16),0,Q.status)a3(wS)
end a.root.Size=UDim2 .new(0,Q.w,0,bd and(Q.head+Q.status+12)or Q.h)a.minB.Text=bd and"+"or"-"end)local function i5()
if not c.alive then return end c.alive,c.running=false,false pcall(d.restoreAll)pcall(f3)for Lo,HP in ipairs(jd)do pcall(function()HP:Disconnect()end)end
if j.oldNC then pcall(function()hookmetamethod(game,"__namecall",j.oldNC)end)end pcall(function()nu:Destroy()end)
pcall(function()wC:Destroy()end)if cU.SAB_KILL==i5 then cU.SAB_KILL=nil end end cU.SAB_KILL=i5 N(a.killB,i5)N(a.xB,i5)
v_(a.title,a.root,function()b1(a.root)c.winPos=ip(a.root)or c.winPos end)local function xz()local fR,cT=c.reason,c.level
if c.busy then fR,cT=c.busyText,"ok"elseif not c.running then local Lp,xA,HQ=vf()if c.capHit then fR,cT=xA,"bad"else fR,cT="[stopped] "..xA,(HQ=="bad")and"bad"or"idle"end
c.reason,c.level=fR,cT end local dO=c.running and l.good or(c.capHit and l.bad or l.dim)if a.lit.dot~=dO then
a.lit.dot=dO a.dot.BackgroundColor3,a.tgDot.BackgroundColor3,a.runL.TextColor3,a.pillEdge.Color=dO,dO,dO,dO a.runL.Text=c.running and"RUNNING"or(c.capHit and"BLOCKED"or"STOPPED")
end if a.lit.tg~=c.hidden then a.lit.tg=c.hidden a.tgRoot.BackgroundColor3=c.hidden and l.panel2 or l.accent end
if c.hidden then return end a.put(a.reason,fR)if a.lit.bar~=cT then a.lit.bar=cT a.bar.BackgroundColor3=Fy[cT]or l.dim end
if bd then return end if a.lit.run~=c.running then a.lit.run=c.running a.startB.Text,a.startB.BackgroundColor3=c.running and"STOP"or"START",c.running and l.warn or l.good
a.startB.TextColor3=l.ink end M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")M(a.arT,e.AutoRoll,"AUTO ROLL: ON","AUTO ROLL: OFF")
local b8=y3()if a.farm.Visible then local HR,HT=f0()a.put(a.sBought,tostring(c.bought))a.put(a.sPlaced,tostring(c.placed))a.put(a.sSold,tostring(c.sold))
a.put(a.sColl,tostring(c.collected))a.put(a.sFree,HR.."/"..HT)local xC=(c.running and e.Collect)and math.max(0,math.ceil(e.Every-(z()-c.lastCollect)))or nil
local xD=ac()a.put(a.info,("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
aD(be()),c.rolls,c.gifts,c.crates,xD and ak(W(xD))or"nothing",j.on and("   ["..j.title.." window open]")or"",
xC and("in "..xC.."s")or"off"))a.put(a.tgt,(#b8==0)and"nothing ticked - pick butters in the Butters tab"or("buying: "..((#b8<=3)and table.concat(b8,", ")or(#b8 .." butters ticked"))))
if a.lit.tgt~=(#b8==0)then a.lit.tgt=(#b8==0)a.tgt.TextColor3=(#b8==0)and l.bad or l.good end if a.logN~=c.logN then a.logN=c.logN a.log.Text=table.concat(fU,"\n")end
end if a.run.Visible then a.put(a.padL,c.manualPad and"pad: saved"or(c.padPart and("auto: "..c.padPart.Name)or"pad: not found"))
end if a.srv.Visible then a.put(a.srvHelp,(e.Help or e.HelpGuild)and E.msg or"helping is off")a.put(a.srvCamp,e.Campfire and K.msg or"campfire is off")
a.put(a.srvGhost,d.ghostMode()>0 and(d.hold and"hidden right now"or"up right now")or"you are visible as normal")
end if a.adm.Visible then pcall(q.admPaint)end if a.butInfo and a.but.Visible then a.put(a.butInfo,("%d butters, %d rarities\n%d ticked"):format(ad.n,#ad.rarOrder,#b8))
end if a.but.Visible and bz.at~=ad.at then fL(false)end if a.crt.Visible then if L.built~=L.at then L.build()else L.paint()end
end if a.pet.Visible then o.live()end if a.set.Visible then a.put(a.pfInfo,("%d fps  |  memory %d MB (peak %d)"):format(math.floor(d.fps+0.5),d.mem,d.memPeak))
if a.passInfo then a.put(a.passInfo,d.passText())end end if a.team.Visible then A.paint()end if a.farm.Visible then
a.put(a.helpL,"help  "..((e.Help or e.HelpGuild)and E.msg or"off"))a.put(a.campL,"camp  "..(e.Campfire and K.msg or"off")..(d.ghostMode()>0 and(d.hold and" | ghost: hidden"or" | ghost: up")or""))
a.put(a.questL,"quests  "..(e.Quests and(F.msg~=""and F.msg or"checking...")or"off"))a.put(a.ixL,q.msg)local xE=(D.rec.on and"on"or"")..(D.rec.off and((D.rec.on and"/"or"").."off")or"")
a.put(a.arL,D.msg~=""and D.msg or("auto roll  %s | knows %s%s"):format(D.isOn()and"running"or"stopped",xE~=""and xE or"nothing yet",#D.rec.rules>0 and" + choices"or""))
if a.lit.arL~=(D.msg~="")then a.lit.arL=(D.msg~="")a.arL.TextColor3=D.msg~=""and l.warn or l.dim end end end cU.SAB={S=c,CFG=e,EV=V,U=a,sg=nu,CAT=ad,LEARN=aj,buildList=fL,
logAll=dP,evAll=dQ,AR=D,CR=L,PF=d,PX=o,TM=A,CRATE=j,FU=y,HX=E,CF=K,QX=F,IX=q,SH=O}C(b9 .." loaded")if c.uiErrs>0 then C("UI: "..c.uiErrs.." properties skipped")end
a3("farm")b1(a.root)b1(a.tgRoot)if il then pcall(function()T(il:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)b1(a.root)b1(a.tgRoot)end))end)end b7()xq()if c.config and c.config~=""then a.cfgName.Text=c.config end
M(a.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")M(a.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")M(a.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
M(a.helpT,e.Help,"HELP WAXES: ON","HELP WAXES: OFF")M(a.helpGT,e.HelpGuild,"GUILD CALLS: ON","GUILD CALLS: OFF")
M(a.campT,e.Campfire,"CAMPFIRE: ON","CAMPFIRE: OFF")d.paintGhost()q.paint()pcall(o.paintAll)M(a.questT,e.Quests,"QUESTS: ON","QUESTS: OFF")
M(a.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")M(a.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
a.secB.Text=tostring(e.Every)pcall(d.applyAll)pcall(xz)task.spawn(function()local xF=zq()a.rejMsg.Text="after a rejoin it restarts with the newest version from GitHub"..(xF and("\n(backup: "..xF..")")or"")
local xG=gm(an.exec)if xG and not xG:find("SAB autoloader v2",1,true)then d3(an.exec,an.stub)C("autoexec updated: it now loads the newest version from GitHub")
end a.autoMsg.Text=(gm(an.exec)~=nil)and"autoexec loader is installed (loads from GitHub)"or"not installed yet"
pcall(zy)end)task.spawn(function()while c.alive do local HU,HV=pcall(xz)if not HU then C("UI ERR "..tostring(HV))end
task.wait((c.hidden or bd)and 1.5 or 0.4)end end)task.spawn(function()local HW,HY=pcall(zG)if not HW then C("HOOK ERR "..tostring(HY))end
end)task.spawn(function()pcall(yp)if j.loadSeq and not j.learned then local i6={}for xH=1,20 do if j.loadSeq[xH]then i6[#i6+1]=j.loadSeq[xH]end end
if#i6>0 then j.learned={seq=i6,mode=j.loadMode}C("remembered how to open crates directly")end end if jM()then C(("catalog: %d butters in %d rarities"):format(ad.n,#ad.rarOrder))end
local HZ,xI=pcall(Ep)if HZ and xI and c.alive and not c.manualPad then c.manualPad=xI end end)task.spawn(function()
while c.alive do local ou,ov=pcall(o.buyTick)if not ou then C("PET ERR "..tostring(ov))task.wait(5)end ou,ov=pcall(o.wishTick)
if not ou then C("WISH ERR "..tostring(ov))task.wait(5)end task.wait(0.75)end end)task.spawn(function()local i7,xJ=0,z()
T(game:GetService("RunService").Heartbeat:Connect(function()i7=i7+1 if d.hideI<=#d.hideQ or d.dropI<=#d.dropQ or(d.queue and#d.queue>0)then pcall(d.hideStep)end end))
T(game:GetService("RunService").Heartbeat:Connect(function()if d.hold then pcall(d.pinTick)end end))d.noteAt=z()
while c.alive do task.wait(1)local xK=z()d.fps,i7,xJ=i7/math.max(xK-xJ,0.001),0,xK local H0,H1=pcall(d.tick)if not H0 then C("PERF ERR "..tostring(H1))task.wait(5)end
end end)task.spawn(function()task.wait(10)while c.alive do local H2,H3=pcall(y.tick)if not H2 then C("FUSE ERR "..tostring(H3))task.wait(10)end
task.wait(4)end end)task.spawn(function()while c.alive do local H4,H5=pcall(A.tick)if not H4 then C("TEAM ERR "..tostring(H5))task.wait(3)end
task.wait(0.25)end end)task.spawn(function()local i8=af:WaitForChild("Remotes",30)local xL=i8 and i8:WaitForChild("ClanEvent",30)
if xL and c.alive then T(xL.OnClientEvent:Connect(function(H6,H7)if H6=="call"then pcall(E.onCall,H7)end end))
end local xM=i8 and i8:FindFirstChild("RollConfirmAsk")if xM and c.alive then T(xM.OnClientEvent:Connect(function(H8)F.asked=H8 or"butter"end))end
end)task.spawn(function()while c.alive do task.wait(20)if e.Calm then pcall(d.calmScan)end end end)task.spawn(function()
local ow=af:WaitForChild("Remotes",30)if not(ow and c.alive)then return end local function i9(H9,H_)local ox=ow:FindFirstChild(H9)
if ox and ox:IsA("RemoteEvent")then T(ox.OnClientEvent:Connect(function(...)pcall(H_,...)end))end end i9("NewSquishyDiscovered",function(oy,xN)
if type(oy)~="string"then return end q.disc=q.disc or{}q.disc[W(oy)]=true C(("INDEX: %s%s is in your Index now"):format(ak(W(oy)),xN and(" ("..tostring(xN)..")")or""))
end)i9("IndexRefresh",q.loadDisc)i9("IndexRowComplete",function(Ia)C("INDEX: the whole "..tostring(Ia).." row is complete")end)
i9("AdminShow",q.admin)local xO=ow:FindFirstChild("AdminShowSync")if xO then local Ib,xP=pcall(function()return xO:InvokeServer()end)
if Ib and type(xP)=="table"then for Lq,Ic in pairs(xP)do pcall(O.add,Ic)end end end while c.alive do local Ie,If=pcall(q.tick)
if not Ie then q.msg="index error: "..tostring(If)task.wait(10)end task.wait(2)end end)task.spawn(function()task.wait(8)
while c.alive do local Ig,Ih=pcall(F.tick)if not Ig then C("QUEST ERR "..tostring(Ih))task.wait(30)end task.wait(3)
end end)task.spawn(function()while c.alive do task.wait(20)pcall(f3)end end)pcall(D.watchCache)if type(hookmetamethod)=="function"and type(getnamecallmethod)=="function"then
pcall(function()local Ij=(type(newcclosure)=="function")and newcclosure or function(Ii)return Ii end local oz
local xQ=(type(setnamecallmethod)=="function")and setnamecallmethod or nil oz=hookmetamethod(game,"__namecall",Ij(function(xR,...)
local fS=getnamecallmethod()if c.alive and(fS=="InvokeServer"or fS=="FireServer")then local xS,xT=pcall(function()return xR.Name end)
if xS and xT=="CrateAction"and not j.replaying then pcall(j.saw,fS,...)elseif xS and xT=="AutoRollAction"and not D.replaying then pcall(D.saw,fS,...)end
if xQ then xQ(fS)end end return oz(xR,...)end))j.oldNC=oz end)end if jb then T(H.Idled:Connect(function()pcall(function()jb:CaptureController()jb:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()for Lr=1,90 do if not c.alive then return end if H:GetAttribute("AutoRollOn")~=nil and ap()and(c.plot or bB())then break end
task.wait(1)end task.wait(2)if e.AutoRoll then D.apply("joined")end while c.alive do task.wait(30)local i_=cd()
if i_ and q.on()and not aN(i_.name)then i_=nil end if c.alive and e.AutoRoll and c.running and not D.isOn()and not i_ and not ac()
and not j.waiting and not j.on and not c.busy then D.apply("it was off")end end end)task.spawn(function()if not e.AutoStart then return end
c.reason,c.level="waiting for the game to load, then starting","wait"for Ls=1,120 do if not c.alive then return end
if c.running then return end c.plot=c.plot or bB()if ap()and c.plot and q.any()then fm(true,true)C("started by itself")
return end task.wait(1)end if c.alive and not c.running then C("gave up waiting to start - tap START")end end)
task.spawn(function()c.plot=bB()c.lastCollect=z()while c.alive do if c.running then local Ik,xU=pcall(Ft)if not Ik and xU~=jc then C("LOOP ERR "..tostring(xU))end
end task.wait(0.1)end end)ja("ready - the window is at the top left")end local Im,oA=xpcall(xY,function(Il)return tostring(Il).."\n"..debug.traceback()end)
if not Im then pcall(function()warn("SAB "..b9 .." ERROR: "..tostring(oA))end)ja("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..b9 .." ERROR: "..tostring(oA))end)pcall(function()local xV=(type(getgenv)=="function"and getgenv())or _G
if type(xV.SAB_KILL)=="function"then xV.SAB_KILL()end for Lt,In in ipairs({"SABFarmGui","SABToggle"})do local xW=H.PlayerGui:FindFirstChild(In)
if xW then xW:Destroy()end end end)pcall(function()local fT=Instance.new("ScreenGui")fT.Name="SABError"fT.ResetOnSpawn=false
fT.DisplayOrder=1000 local a5=Instance.new("TextBox")a5 .Size=UDim2 .new(0,340,0,170)a5 .Position=UDim2 .new(0,10,0,50)
a5 .BackgroundColor3=Color3 .fromRGB(90,20,20)a5 .TextColor3=Color3 .new(1,1,1)a5 .TextSize=11 a5 .TextWrapped=true
a5 .ClearTextOnFocus=false a5 .TextXAlignment=Enum.TextXAlignment.Left a5 .TextYAlignment=Enum.TextYAlignment.Top
a5 .Text="SAB "..b9 .." failed to start. Send this text:\n"..tostring(oA)a5 .Parent=fT fT.Parent=H:WaitForChild("PlayerGui")
end)end
