local az="v20"local ff=game:GetService("Players")local u=ff.LocalPlayer or ff.PlayerAdded:Wait()
local function c5(iE)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..az,Text=iE,Duration=6})
end)end c5("script started")local function iF()local bT=game:GetService("ReplicatedStorage")
local bU=game:GetService("Workspace")local iG=game:GetService("UserInputService")local aM=(type(getgenv)=="function"and getgenv())or _G
if type(aM.SAB_KILL)=="function"then pcall(aM.SAB_KILL)end local g=(type(tick)=="function")and tick or os.clock
local c6=(function()local iH,iI=pcall(function()return game:GetService("VirtualUser")end)return iH and iI or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,Rejoin=true,
AutoStart=true,Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,
capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,matchSince=nil,boot=g(),plot=nil,reason="starting",level="wait",
lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,
crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local l={name=nil,rar=nil,at=g(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local c={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil}
local c7={}local c8,bV,ai,aA={},{},{},{}local aj=""local function M(fg)c8[#c8+1]=fg return fg end
local function ak(iJ)task.wait(iJ)if not a.alive then error(c7,0)end end local function f(bW)
bW=os.date("%H:%M:%S").." "..tostring(bW)table.insert(bV,1,bW)if#bV>6 then table.remove(bV)end
ai[#ai+1]=bW if#ai>80 then table.remove(ai,1)end end local function c9(fh)if type(fh)~="string"then return""end
return(fh:lower():gsub("[^%w]",""))end local function t(iK)local fi=c9(iK)local c_=fi:gsub("butter$","")
if c_==""then c_=fi end return c_ end local function aa(da)return type(da)=="string"and t(da)~=""and e.Targets[t(da)]==true end
local function iL(a3)a3=a3:lower()return a3:find("squishy",1,true)~=nil or a3:match("butter$")~=nil or a3:match("butter[^%a]")~=nil
end local db={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ab(a4)
if type(a4)~="number"then return"?"end local bX=1 while math.abs(a4)>=1000 and bX<#db do a4=a4/1000 bX=bX+1 end
local iM=string.format("%.2f",a4):gsub("%.?0+$","")return iM..db[bX]end local function iN(fj)
if type(fj)~="string"then return nil end local iO,fk=fj:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local dc=tonumber(iO)if not dc then return nil end if fk==""then return dc end for iP,iQ in ipairs(db)do if iQ:lower()==fk:lower()then return dc*1000^(iP-1)end end
return nil end local function ac()local fl=u:GetAttribute("BoardValueMoney")if type(fl)=="number"then return fl end
local fm=u:FindFirstChild("leaderstats")if fm then for mR,iR in ipairs({"Cash","Money","Coins"})do
local dd=fm:FindFirstChild(iR)if dd and type(dd.Value)=="number"then return dd.Value end
end end end local function N(iS)local de=iS:GetFullName()if a.plot then local df=a.plot:GetFullName()
if de:sub(1,#df)==df then return de:sub(#df+2)end end return de end local function aB()
local bY=u.Character if bY and bY:FindFirstChild("HumanoidRootPart")then local fn=bY:FindFirstChildOfClass("Humanoid")
if fn and fn.Health>0 then return bY end end end local function aC()local dg=bU:FindFirstChild("Plots")
if not dg then return nil end local function fo(iT)local fp=iT:FindFirstChild("Plate")return fp~=nil and fp:FindFirstChild("EditStackAttachment",true)~=nil
end local fq=u:GetAttribute("PlotNumber")if fq~=nil then local dh=dg:FindFirstChild(tostring(fq))
if dh and fo(dh)then return dh end end for mS,fr in ipairs(dg:GetChildren())do if fo(fr)then return fr end
end end local function a5(fs)local al=fs and fs.Parent for mT=1,6 do if not al then return nil end
if al:IsA("BasePart")then return al end if al:IsA("Model")then return al.PrimaryPart or al:FindFirstChildWhichIsA("BasePart",true)end
al=al.Parent end end local function ft(fu)local di=fu.Parent if di and di:IsA("Attachment")then return di.WorldPosition end
local fv=a5(fu)return fv and fv.Position end local function iU()local aN=a.plot and a.plot:FindFirstChild("Plate")
if not aN then return nil end if aN:IsA("BasePart")then return aN.Position end if aN:IsA("Model")then return aN:GetPivot().Position end
local fw=aN:FindFirstChildWhichIsA("BasePart",true)return fw and fw.Position end local function fx()
local dj={}local fy=a.plot and a.plot:FindFirstChild("WaxStations")if fy then for mU,iV in ipairs(fy:GetChildren())do
local fz=iV:FindFirstChild("SquishyPlaceHolder")local dk=fz and fz:FindFirstChild("PlacePrompt")
if dk and dk:IsA("ProximityPrompt")then dj[#dj+1]=dk end end end return dj end local function dl()
local fA,dm=fx(),0 for mV,iW in ipairs(fA)do if iW.Enabled then dm=dm+1 end end local dn=#fA
local dp=u:GetAttribute("WaxStations")if type(dp)=="number"and dp>dn then dn=dp end return dm,dn
end local function iX()local fB=aB()local fC=fB and fB.HumanoidRootPart.Position local dq,fD
for mW,dr in ipairs(fx())do if dr.Enabled then local fE=ft(dr)local fF=(fE and fC)and(fE-fC).Magnitude or 1e9
if not dq or fF<fD then dq,fD=dr,fF end end end return dq end local function ds()local bZ=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not bZ then return nil end local fG=bZ:FindFirstChild("BuyPromptAttachment")local b0=(fG and fG:FindFirstChild("BuyPrompt"))or bZ:FindFirstChild("BuyPrompt",true)
if b0 and b0:IsA("ProximityPrompt")and b0:IsDescendantOf(bZ)then return b0 end end local iY={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local iZ={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local y={order={},price={},dirty=false}local o={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local dt="SAB_order.txt"local function du()if not y.dirty or type(writefile)~="function"then return end
local a6={}for i0,i1 in pairs(y.price)do a6[#a6+1]="P|"..i0 .."|"..string.format("%.0f",i1)end
for i2,i3 in pairs(y.order)do a6[#a6+1]="O|"..i2 .."|"..table.concat(i3,",")end if pcall(writefile,dt,table.concat(a6,"\n"))then y.dirty=false end
end local function i4()if type(isfile)~="function"or type(readfile)~="function"then return end
local i5,i6=pcall(isfile,dt)if not(i5 and i6)then return end local i7,fH=pcall(readfile,dt)
if not(i7 and type(fH)=="string")then return end for i8 in fH:gmatch("[^\n]+")do local fI,fJ,dv=i8:match("^(%a)|([^|]+)|(.*)$")
if fI=="P"then y.price[fJ]=tonumber(dv)elseif fI=="O"and dv~=""then local b1={}for i9 in dv:gmatch("[^,]+")do b1[#b1+1]=i9 end
if#b1>0 then y.order[fJ]=b1 end end end end local function i_(b2)if type(b2)~="table"then return end
local aD,fK=b2 .rarity,b2 .contents if type(aD)~="string"or aD==""or type(fK)~="table"then return end
local a7={}for mX,b3 in ipairs(fK)do if type(b3)=="table"and type(b3 .butter)=="string"then
a7[#a7+1]={n=b3 .butter,ch=tonumber(b3 .chance)or 0}end end if#a7==0 then return end table.sort(a7,function(ja,jb)return ja.ch>jb.ch end)
local a8,a9={},false for jc,jd in ipairs(a7)do a8[jc]=jd.n end local dw=y.order[aD]if not dw or#dw~=#a8 then a9=true end
if not a9 then for fL=1,#a8 do if dw[fL]~=a8[fL]then a9=true break end end end y.order[aD]=a8
local dx=tonumber(b2 .price)if dx and y.price[aD]~=dx then y.price[aD]=dx a9=true end if a9 then
y.dirty=true o.at=0 f("learned the "..aD.." order from its crate")end end local function a_(je,jf)
local jg=je:FindFirstChild(jf,true)local jh,dy=pcall(function()return jg.Text end)return(jh and type(dy)=="string"and dy~="")and dy or nil
end local function C(fM)return o.pretty[fM]or fM end local function ji()local fN=bT:FindFirstChild("Assets")
local fO=fN and fN:FindFirstChild("Squishies")if not fO then return false end local dz,fP,aO={},{},{}
local b4=0 for mY,b5 in ipairs(fO:GetChildren())do local ba=t(b5 .Name)if ba~=""and not dz[ba]then
local b6=a_(b5,"RarityText")or"?"dz[ba]=b6 fP[ba]=a_(b5,"NameText")or b5 .Name aO[b6]=aO[b6]or{}
table.insert(aO[b6],ba)b4=b4+1 end end if b4==0 then return false end for fQ,jj in pairs(aO)do
local fR=y.order[fQ]or iZ[fQ]local dA={}if fR then for jk,jl in ipairs(fR)do dA[t(jl)]=jk end end
table.sort(jj,function(fS,fT)local dB,dC=dA[fS],dA[fT]if dB and dC then return dB<dC end
if dB then return true end if dC then return false end return C(fS)<C(fT)end)end local dD={}
for jm,jn in ipairs(iY)do dD[jn]=jm end local b7={}for jo in pairs(aO)do b7[#b7+1]=jo end
table.sort(b7,function(dE,dF)local dG,dH=y.price[dE],y.price[dF]if dG and dH and dG~=dH then return dG<dH end
local dI,dJ=dD[dE],dD[dF]if dI and dJ then return dI<dJ end if dI then return true end if dJ then return false end
return dE<dF end)o.rar,o.pretty,o.members,o.rarOrder,o.n,o.at=dz,fP,aO,b7,b4,g()return true
end local function dK()if o.at==0 or(g()-o.at)>120 then pcall(ji)end return o.n>0 end local function jp(jq)
local fU=t(jq)return o.rar[fU]or(l.name and t(l.name)==fU and l.rar)or"?"end local function fV()
local b8={}for jr,js in pairs(e.Targets)do if js then b8[#b8+1]=C(jr)end end table.sort(b8)
return b8 end local F={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function fW()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function b9(fX)if type(makefolder)~="function"then return end local jt,ju=pcall(isfolder,fX)
if not(jt and ju)then pcall(makefolder,fX)end end local function dL(fY)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local jv,jw=pcall(isfile,fY)if not(jv and jw)then return nil end local jx,jy=pcall(readfile,fY)
return jx and jy or nil end local function b_(jz,jA)if type(writefile)~="function"then return false end
return(pcall(writefile,jz,jA))end local function fZ(jB)local bb={}if type(listfiles)~="function"then return bb end
local jC,f0=pcall(listfiles,jB)if not jC or type(f0)~="table"then return bb end for mZ,jD in ipairs(f0)do bb[#bb+1]=tostring(jD)end
return bb end local function dM()local ca={}for m0,jE in ipairs(fZ(F.cfg))do local f1=jE:match("([^/\\]+)%.txt$")
if f1 then ca[#ca+1]=f1 end end table.sort(ca)return ca end local function jF()local O={"V|1"}
O[#O+1]="N|Every|"..tostring(e.Every)for m1,f2 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart"})do
O[#O+1]="B|"..f2 .."|"..(e[f2]and"1"or"0")end if a.winPos then O[#O+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then O[#O+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end local cb={}for jG,jH in pairs(e.Targets)do if jH then cb[#cb+1]=jG end end
table.sort(cb)for m2,jI in ipairs(cb)do O[#O+1]="T|"..jI end return table.concat(O,"\n")
end local function jJ(dN)if type(dN)~="string"or dN==""then return false end local f3,f4={},false
for jK in dN:gmatch("[^\n]+")do local bc,aE,cc=jK:match("^(%a)|([^|]*)|?(.*)$")if bc=="N"and aE=="Every"then
local dO=tonumber(cc)if dO and dO>=1 then e.Every=math.floor(dO)end elseif bc=="B"then if e[aE]~=nil then e[aE]=(cc=="1")end
elseif bc=="W"then a.winPos={tonumber(aE)or 10,tonumber(cc)or 44}elseif bc=="G"then a.togPos={tonumber(aE)or 10,tonumber(cc)or 300}
elseif bc=="T"and aE~=""then f3[aE]=true f4=true end end if f4 then e.Targets=f3 end return true
end local function dP(aP)if not fW()then return false,"this executor cannot write files"end
aP=(aP or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if aP==""then return false,"give the config a name"end
b9(F.dir)b9(F.cfg)if not b_(F.cfg.."/"..aP..".txt",jF())then return false,"could not write the file"end
a.config=aP return true,aP end local function f5(cd)local f6=dL(F.cfg.."/"..cd..".txt")
if not f6 then return false,"no config called "..tostring(cd)end if not jJ(f6)then return false,"that config looks empty"end
a.config=cd return true,cd end local function f7(dQ)if dQ then b9(F.dir)b_(F.auto,dQ)elseif type(delfile)=="function"then
pcall(delfile,F.auto)else b_(F.auto,"")end a.autoload=dQ end local function dR()if a.selfPath then return a.selfPath end
local ce for m3,jL in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",F.dir})do for m4,f8 in ipairs(fZ(jL))do
local dS=f8:lower()if dS:sub(-4)==".lua"and(dS:find("sab_farm",1,true)or dS:find("sab farm",1,true))then
ce=ce or f8 end end end a.selfPath=ce return ce end F.stub=[[
-- SAB autoloader: finds the saved SAB farm script and runs it on join.
task.spawn(function()
    task.wait(8)
    if type(listfiles) ~= "function" or type(readfile) ~= "function" then return end
    for _, d in ipairs({ "", "scripts", "Scripts", "Delta", "Delta/Scripts", "SAB" }) do
        local ok, fs = pcall(listfiles, d)
        if ok and type(fs) == "table" then
            for _, f in ipairs(fs) do
                local s, low = tostring(f), tostring(f):lower()
                if low:sub(-4) == ".lua" and low:find("sab_farm", 1, true) and not low:find("autoload", 1, true) then
                    local okr, src = pcall(readfile, s)
                    if okr and type(src) == "string" and #src > 1000 then
                        local fn = loadstring(src)
                        if fn then pcall(fn) return end
                    end
                end
            end
        end
    end
end)
]]
local function jM()if not fW()then return false,"this executor cannot write files"end b9("autoexec")
if not b_(F.exec,F.stub)then return false,"could not write to the autoexec folder"end local f9=dR()
return true,f9 and("it will load "..f9)or"now save this script in Delta so the loader can find it"
end local cf=(function()local jN,jO=pcall(function()return game:GetService("TeleportService")end)return jN and jO or nil end)()
local function f_()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local jP=queueonteleport or queue_on_teleport local ga=dR()if not ga then return false end
return(pcall(jP,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(ga)))
end local function cg(jQ)if a.rejoining then return end a.rejoining=true f("REJOIN ("..jQ..")")
pcall(du)if a.autoload then pcall(dP,a.autoload)end local jR=f_()f(jR and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for m5=1,30 do if not cf then break end pcall(function()cf:Teleport(game.PlaceId,u)end)
task.wait(10)end end)end local function jS()local jT,gb=pcall(function()return game:GetService("GuiService")end)
if jT and gb then pcall(function()M(gb.ErrorMessageChanged:Connect(function()if e.Rejoin then cg("roblox error message")end
end))end)end pcall(function()local gc=game:GetService("CoreGui")local gd=gc and gc:WaitForChild("RobloxPromptGui",15)
local ge=gd and gd:WaitForChild("promptOverlay",15)if ge then M(ge.ChildAdded:Connect(function(jU)
if e.Rejoin and tostring(jU.Name):lower():find("errorprompt",1,true)then cg("disconnect prompt")end
end))end end)pcall(function()M(u.OnTeleport:Connect(function(jV)if tostring(jV):find("Started")then f_()end
end))end)if cf then pcall(function()M(cf.TeleportInitFailed:Connect(function()a.rejoining=false
if e.Rejoin then task.delay(5,function()cg("teleport retry")end)end end))end)end end local function gf(jW)
local gg=a.plot and a.plot:FindFirstChild(jW)if not gg then return nil,false end for m6,dT in ipairs(gg:GetChildren())do
if dT:IsA("Model")or dT:IsA("BasePart")then return dT,true end end return nil,true end local function bd()
local am=gf("RolledSquishy")if not am then return nil end return{model=am,name=am.Name,pretty=a_(am,"NameText")or C(t(am.Name)),
rar=a_(am,"RarityText")or jp(am.Name),price=a_(am,"PriceText")}end local function gh(dU)
return type(dU)=="string"and(o.rar[t(dU)]~=nil or iL(dU))end local function v()local dV=gf("SquishyEquipped")
if dV then a.carrySrc="model"return dV.Name,dV end local gi=u.Character if gi then for m7,be in ipairs(gi:GetDescendants())do
if(be:IsA("Model")or be:IsA("Tool"))and gh(be.Name)then a.carrySrc="character"return be.Name,be
end end end local ci=u:GetAttribute("SquishyEquipped")if type(ci)=="string"and ci~=""and gh(ci)and g()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return ci,nil end a.carrySrc=nil end local function m8()local m9,jX=v()return jX end
local function gj()local gk=bd()local dW=gk and iN(gk.price)local dX=ac()if dW and dX and dX<dW*0.5 then return dX,dW end
end local function aQ(jY)aA[#aA+1]=os.date("%H:%M:%S").." "..jY if#aA>40 then table.remove(aA,1)end
end local function jZ(aF,cj)if type(aF)~="string"then return end aQ(("Roll(%s,%s)"):format(aF,tostring(cj)))
if aF:lower():find("crate",1,true)then c.rolled,c.rolledAt=aF,g()return end l.seq=l.seq+1
l.name,l.at=aF,g()l.rar=type(cj)=="string"and cj or nil a.rolls=a.rolls+1 if aa(aF)then f(("ROLL %s [%s] = TARGET"):format(aF,tostring(cj)))end
end local function j0(aG)if type(aG)~="table"then return end local ck=aG.butter or aG.itemName
if type(ck)~="string"then return end a.gifts=a.gifts+1 l.gift,l.giftAt=ck,g()if type(aG.giftId)=="string"then
local gl=bT:FindFirstChild("Remotes")local gm=gl and gl:FindFirstChild("GiftThanks")if gm then pcall(function()gm:FireServer(aG.giftId)end)end
end aQ("Gift("..ck.." from "..tostring(aG.fromName)..")")f(("GIFT from %s: %s - it will not be waxed"):format(tostring(aG.fromName),ck))
end local function j1()local gn=bT:WaitForChild("Remotes",30)if not a.alive then return end
if not gn then f("Remotes folder missing - no roll events")return end local j5={SquishyRollAnimation=jZ,
InitSquishy=function(go)l.init,l.initAt=tostring(go),g()aQ("Init("..tostring(go)..")")end,
CrateUpdate=function(bf,gp)pcall(i_,bf)if type(bf)=="table"then local j2=gp==true or(c.rolled~=nil and g()-c.rolledAt<15)or c.waiting
if not j2 then return end local j3=not c.waiting local j4=c.on c.waiting,c.data,c.at=true,bf,g()
c.on=(gp==true)c.title=tostring(bf.title or bf.name or"crate")if c.on and not j4 then c.openedAt,c.byYou=g(),not c.ours
if c.onShow then task.spawn(c.onShow)end end if c.on then aQ("CrateWindow open("..c.title..")")
elseif j3 then aQ("Crate waiting("..c.title..")")f(c.title.." is waiting on your stand")
end else if c.waiting then aQ("Crate gone")end c.on,c.waiting,c.data,c.prompt=false,false,nil,nil
c.summonFails,c.ours,c.byYou=0,false,false if c.onGone then task.spawn(c.onGone)end end
end,GiftReceived=j0,}for cl,j6 in pairs(j5)do local dY=gn:FindFirstChild(cl)if dY and dY:IsA("RemoteEvent")then M(dY.OnClientEvent:Connect(j6))
elseif cl~="CrateUpdate"and cl~="GiftReceived"then f("remote "..cl.." missing")end end end
local function dZ()local aH=bd()if aH then if aa(aH.name)then return{state="match",shown=aH.pretty,src="pad",info=aH}
end return{state="skip",info=aH,level="idle",text=("on pad: %s [%s] - not ticked"):format(aH.pretty,tostring(aH.rar))}
end if l.name and(g()-l.at)<4 then if aa(l.name)then return{state="match",shown=C(t(l.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(C(t(l.name)),tostring(l.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gq(j7,j8,j9,j_)
local cm=RaycastParams.new()cm.FilterType=Enum.RaycastFilterType.Exclude local d0={u.Character}
for m_,ka in ipairs(j_ or{})do d0[#d0+1]=ka end cm.FilterDescendantsInstances=d0 pcall(function()cm.RespectCanCollide=true end)
local gr=bU:Raycast(Vector3 .new(j7,j8+4,j9),Vector3 .new(0,-30,0),cm)return gr and gr.Position or nil
end local function d1(gs)local gt=gs:FindFirstChildOfClass("Humanoid")return((gt and gt.HipHeight)or 2)+gs.HumanoidRootPart.Size.Y/2+0.2
end local function d2(kb,kc)local gu=kb:FindFirstChildOfClass("Humanoid")local kd=g()while g()-kd<kc do
if gu and gu.FloorMaterial~=Enum.Material.Air then return true end ak(0.05)end return false
end local function cn(ke,d3,d4)local gv=ke.HumanoidRootPart gv.AssemblyLinearVelocity=Vector3 .new(0,0,0)
gv.CFrame=d4 and CFrame.new(d3,Vector3 .new(d4 .X,d3 .Y,d4 .Z))or CFrame.new(d3)end local function co(ad,gw)
local aI=aB()if not aI or not ad then return false end local an=ad.Position local cp=math.clamp(math.max(ad.Size.X,ad.Size.Z)/2+2.2,3,7)
local gx=(gw and gw.MaxActivationDistance)or 10 if cp>gx-2 then cp=math.max(2.5,gx-2)end
local bh={}local function aJ(bi)bi=Vector3 .new(bi.X,0,bi.Z)if bi.Magnitude>0.05 then bh[#bh+1]=bi.Unit end
end local gy=iU()if gy then aJ(gy-an)end aJ(ad.CFrame.LookVector)aJ(-ad.CFrame.LookVector)
aJ(ad.CFrame.RightVector)aJ(-ad.CFrame.RightVector)aJ(aI.HumanoidRootPart.Position-an)if#bh==0 then aJ(Vector3 .new(0,0,1))end
local kf,cq=d1(aI),false for na,kg in ipairs(bh)do local cr=an+kg*cp local d5=gq(cr.X,an.Y,cr.Z,{ad})
if d5 and math.abs(d5 .Y-an.Y)<14 then cn(aI,Vector3 .new(cr.X,d5 .Y+kf,cr.Z),an)if d2(aI,0.7)then cq=true break end
end end if not cq then cn(aI,an+bh[1]*cp+Vector3 .new(0,3,0),an)cq=d2(aI,1)end ak(0.12)
return cq end local function kh(bj)if not bj.Parent or not bj.Enabled then return false end
pcall(function()bj:InputHoldBegin()end)ak(math.max(bj.HoldDuration,0)+0.08)pcall(function()bj:InputHoldEnd()end)
return true end local function ao(gz,ki)local kj=g()while g()-kj<ki do if gz()then return true end
ak(0.05)end return gz()end local function cs(aR,kk,gA,kl)local km=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for kn,d6 in ipairs(km)do if kn==2 and(kl or not(aR.Parent and aR.Enabled and(not gA or gA())))then break end
local d7 if d6=="hold"then d7=kh(aR)else d7=type(fireproximityprompt)=="function"and aR.Parent~=nil and aR.Enabled and pcall(fireproximityprompt,aR)end
if d7 and ao(kk,1.2)then a.zapFirst=(d6=="zap")return true,d6 end end return false end local function gB(d8)
local ap=ds()if not ap or not ap.Enabled then f("buy: nothing on the pad")return false end
local gC=a5(ap)if not gC then f("buy: pad part missing")return false end a.lastBuyAt=g()
local ko,gD=l.seq,ac()co(gC,ap)if not ap.Enabled then f("buy aborted: pad emptied")return false end
local aS=dZ()if not d8 and aS.state~="match"then f("buy aborted: "..(aS.text or"pad changed"))
a.matchSince=nil return false end local d9=aS.info and aS.info.name or(aS.state=="match"and l.name)or nil
local function kp()return ap.Enabled and v()==nil and(d8 or dZ().state=="match")end local kq,kr=cs(ap,function()
return v()~=nil or((not ap.Enabled)and(d8 or l.seq==ko))end,kp,gj()~=nil)if kq then ao(function()return v()~=nil end,0.8)
local bk=v()local gE=ac()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
l.name,l.rar,l.at=nil,nil,g()f(("BOUGHT %s%s via %s"):format(bk and C(t(bk))or(aS.shown or"?"),(gD and gE)and(" for $"..ab(gD-gE))or"",kr))
if bk and d9 and t(bk)~=t(d9)then f(("note: picked up %s, not %s"):format(bk,d9))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=g()+math.min(8*2^(a.cashFails-1),60)local gF=bd()
f(("BUY REFUSED: cash short? have $%s, price %s"):format(ab(ac()),(gF and gF.price)or"?"))
return false end local function gG()local ct=v()if not ct then a.holding=false f("place: hands are empty")
return false end if not aa(ct)then f(("REFUSED TO WAX %s - it is not ticked"):format(C(t(ct))))
return false end for nb=1,e.PlaceTries do local aq=iX()if not aq then f("place: no free station")break end
local gH=a5(aq)if gH then co(gH,aq)local gI=v()if not gI then a.holding=false f("place: hands emptied on the way")return false end
if not aa(gI)then f("place: what I carry changed, not waxing it")return false end if aq.Enabled then
local ks,kt=cs(aq,function()return not aq.Enabled end,function()return aq.Enabled end)if ks then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=g()+2.5,0 l.name,l.rar,l.at=nil,nil,g()
f(("WAXED %s #%d at %s via %s"):format(C(t(ct)),a.placed,aq.Parent.Parent.Name,kt))return true
end end end ak(0.25)end a.placeFails=a.placeFails+1 if v()==nil then a.holding=false end
f("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,g()
a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(v()))f(a.capMsg)end return false end local function gJ(gK)return type(gK)=="string"and gK:lower():find("crate",1,true)~=nil
end local function ku(cu)if type(cu)~="table"then return false end local d_=cu.contents
if type(d_)=="table"and#d_>0 then for nc,ea in ipairs(d_)do if type(ea)=="table"and aa(ea.butter)then return true,C(t(ea.butter))end
end return false end local gL=cu.rarity and o.members[cu.rarity]if gL then for nd,gM in ipairs(gL)do if e.Targets[gM]then return true,C(gM)end end
end return false end local kv={SABFarmGui=1,SABToggle=1,SABError=1}local function cv(kw)
local ar=kw while ar do if kv[ar.Name]then return false end if ar:IsA("ScreenGui")then local kx,ky=pcall(function()return ar.Enabled end)
return(not kx)or ky~=false end if ar:IsA("GuiObject")and not ar.Visible then return false end
ar=ar.Parent end return false end local function bl(cw)local aT=""pcall(function()if cw:IsA("TextButton")then aT=cw.Text end end)
if not aT:find("%a")then for ne,cx in ipairs(cw:GetDescendants())do if(cx:IsA("TextLabel")or cx:IsA("TextButton"))and cx.Text:find("%a")then aT=cx.Text break end
end end if not aT:find("%a")then aT=cw.Name end return(aT:lower():gsub("[^%a]",""))end local function kz()
local bm,bn local gN=u:FindFirstChildOfClass("PlayerGui")if not gN then return nil,nil end
for nf,bo in ipairs(gN:GetDescendants())do if bo:IsA("GuiButton")and cv(bo)then local eb=bl(bo)
if eb:sub(1,4)=="open"and not eb:find("shop",1,true)then bm=bm or bo end if eb:sub(1,7)=="discard"then bn=bn or bo end
end end if bm and bn then return bm,bn end if c.on then return bm,bn end return nil,nil
end local cy=(function()local kA,kB=pcall(function()return game:GetService("VirtualInputManager")end)return kA and kB or nil end)()
local function gO(aK,ec)local ed={}local function gP(kC)ed[#ed+1]=kC end if a.tapWay then gP(a.tapWay)end
for ng,gQ in ipairs({"conn","signal","touch"})do if gQ~=a.tapWay then gP(gQ)end end local function gR(kD)
local kE,ee=pcall(getconnections,kD)if not(kE and type(ee)=="table"and#ee>0)then return false end
local gS=false for nh,kF in ipairs(ee)do if pcall(function()kF:Fire()end)then gS=true end
end return gS end for ni,ae in ipairs(ed)do local bp=false if ae=="conn"and type(getconnections)=="function"then
if gR(aK.MouseButton1Click)then bp=true if ao(ec,1.5)then a.tapWay=ae return true,ae end
end bp=gR(aK.Activated)elseif ae=="signal"and type(firesignal)=="function"then if pcall(firesignal,aK.MouseButton1Click)then
if ao(ec,1.5)then a.tapWay=ae return true,ae end end bp=pcall(firesignal,aK.Activated)elseif ae=="touch"and cy then
bp=pcall(function()local gT,gU=aK.AbsolutePosition,aK.AbsoluteSize local gV=0 local gW=aK:FindFirstAncestorWhichIsA("ScreenGui")
local kG,kH=pcall(function()return gW and gW.IgnoreGuiInset end)if not(kG and kH)then pcall(function()gV=game:GetService("GuiService"):GetGuiInset().Y end)
end local gX,gY=gT.X+gU.X/2,gT.Y+gU.Y/2+gV cy:SendMouseButtonEvent(gX,gY,0,true,game,1)
task.wait(0.06)cy:SendMouseButtonEvent(gX,gY,0,false,game,1)end)end if bp and ao(ec,1.5)then
a.tapWay=ae return true,ae end end return false end local kI={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function ef(gZ)local bq=gZ.Parent while bq and bq~=a.plot do if kI[bq.Name]then return false end
bq=bq.Parent end local eg=(gZ.ActionText or""):lower()if eg:find("roll",1,true)or eg:find("place",1,true)or eg:find("sell",1,true)then return false end
return true end local function g0()if c.prompt and c.prompt.Parent and c.prompt.Enabled then return c.prompt end
if not a.plot then return nil end local g1=a.plot:FindFirstChild("CrateStand")local br if g1 then
for nj,cz in ipairs(g1:GetDescendants())do if cz:IsA("ProximityPrompt")and cz.Enabled and ef(cz)then br=cz break end
end end if not br then for nk,as in ipairs(a.plot:GetDescendants())do if as:IsA("ProximityPrompt")and as.Enabled and ef(as)then
local g2=as:FindFirstAncestorWhichIsA("Model")local kJ=((as.ActionText or"").." "..(as.ObjectText or"").." "..as.Name.." "..(g2 and g2 .Name or"")):lower()
if kJ:find("crate",1,true)then br=as break end end end end c.prompt=br return br end local function g3()
if c.on then return true end local bs=g0()if not bs then c.summonFails=c.summonFails+1 c.lastFail=g()
f("crate: cannot find where to open "..c.title.." - open it once by hand, then DUMP")return false
end local g4=a5(bs)if g4 then co(g4,bs)end c.ours=true cs(bs,function()return c.on end)
if ao(function()return c.on end,3)then c.summonFails=0 return true end c.ours=false c.summonFails=c.summonFails+1
c.lastFail=g()f("crate: pressed "..N(bs).." but no window came up")return false end do local function kK(g5)
local aU=g5 .Parent while aU and aU:IsA("GuiObject")do local g6,g7=false,false for nl,bt in ipairs(aU:GetDescendants())do
if bt~=g5 and bt:IsA("GuiButton")and bl(bt):sub(1,7)=="discard"then g6=true end if bt:IsA("TextLabel")then
local eh=bt.Text:lower()if eh:find("crate",1,true)or eh:find("can contain",1,true)or eh:find("cost",1,true)then g7=true end
end if g6 and g7 then return aU end end aU=aU.Parent end end function c.findWin()if c.win and c.win.Parent then return c.win end
local g8=u:FindFirstChildOfClass("PlayerGui")if not g8 then return nil end for nm,cA in ipairs(g8:GetDescendants())do
if cA:IsA("GuiButton")and not cA:FindFirstAncestor("SABFarmGui")and bl(cA):sub(1,4)=="open"then
local ei=kK(cA)if ei then c.win=ei return ei end end end end local function kL(kM)for nn,cB in ipairs(kM:GetDescendants())do
if cB:IsA("GuiButton")then local g9,ej=bl(cB),cB.Name:lower()if g9=="x"or g9=="close"or ej=="x"or ej:find("close",1,true)or ej:find("exit",1,true)then return cB end
end end end c.onShow=function()c.win=nil c.findWin()end c.onGone=function()task.wait(1.2)
if c.on or c.waiting then return end local cC=c.findWin()if not cC or not cv(cC)then return end
local g_=kL(cC)if g_ and gO(g_,function()return not cv(cC)end)then return end f("the crate window is still open - tap its X")
end end local function ek(cD)if not g3()then return false end local ha=g()-(c.openedAt or 0)
if ha<0.6 then ak(0.6-ha)end local el=c.title local kN,kO=kz()local hb=cD and kN or kO if not hb then
c.lastFail=g()a.crateFails=a.crateFails+1 f(("crate: no %s button found in %s"):format(cD and"Open"or"Discard",el))
return false end local kP=v()local kQ,no=gO(hb,function()return(not c.on)or(v()~=nil and v()~=kP)
end)if not kQ then c.lastFail=g()a.crateFails=a.crateFails+1 f("crate: could not press "..(cD and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if cD then a.crates=a.crates+1 ao(function()return v()~=nil end,1.5)
local hc=v()f(("OPENED %s -> %s"):format(el,hc and C(t(hc))or"?"))else f("discarded "..el.." (nothing ticked in it)")
end return true end local kR={"sell","trash","discard","dispose","bin"}local function em(cE)
if type(cE)~="string"then return false end cE=cE:lower()for np,kS in ipairs(kR)do if cE:find(kS,1,true)then return true end end
return false end local function kT()local hd=bT:FindFirstChild("Remotes")local en=hd and hd:FindFirstChild("SellSquishy")
if not(en and en:IsA("RemoteEvent"))then return false end if not pcall(function()en:FireServer()end)then return false end
return ao(function()return v()==nil end,1.5)end local function kU()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if g()-a.sellSearchAt<20 then return nil end a.sellSearchAt=g()local he=aB()local hf=he and he.HumanoidRootPart.Position
local bu,hg for nq,aV in ipairs((a.plot or bU):GetDescendants())do if aV:IsA("ProximityPrompt")and(em(aV.ActionText)or em(aV.ObjectText)or em(aV.Name))then
local hh=ft(aV)local eo=(hh and hf)and(hh-hf).Magnitude or 1e9 if eo<=400 and(not bu or eo<hg)then bu,hg=aV,eo end
end end a.sellSpot=bu a.noSellSpot=(bu==nil)return bu end local function hi()local ep=v()
if not ep then a.holding=false return false end if aa(ep)then return false end local eq=C(t(ep))
if kT()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=g()+2.5,0
f("SOLD "..eq)return true end local aW=kU()if aW then local hj=a5(aW)if hj then co(hj,aW)
local hk=v()if hk and not aa(hk)then local kV,kW=cs(aW,function()return v()==nil end,function()return aW.Enabled end)
if kV then a.sold,a.holding,a.sellFails=a.sold+1,false,0 f(("SOLD %s at %s via %s"):format(eq,N(aW),kW))
return true end end end end a.sellFails=a.sellFails+1 f("could not sell "..eq.." ("..a.sellFails..")")
return false end local kX={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function kY(aX)local cF=N(aX):lower()for nr,kZ in ipairs(kX)do if cF:find(kZ,1,true)then return 0 end end
local W,z=aX.Name:lower(),0 local function P(k0,k1)return k0:find(k1,1,true)~=nil end if P(W,"collect")then z=z+60 end
if P(W,"cash")or P(W,"money")then z=z+45 end if P(W,"income")or P(W,"claim")then z=z+35 end
if P(W,"coin")or P(W,"earn")or P(W,"green")then z=z+20 end if W=="pad"or W=="touch"then z=z+25 end
if z==0 and(P(cF,"collect")or P(cF,"cash")or P(cF,"money"))then z=25 end if z==0 then return 0 end
local bv=aX.Color if bv.G>0.5 and bv.G>bv.R*1.4 and bv.G>bv.B*1.4 then z=z+15 end if math.min(aX.Size.X,aX.Size.Y,aX.Size.Z)<2 then z=z+5 end
return z end local function k2()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or g()-a.padSearchAt<20 then return nil end a.padSearchAt=g()local cG,bw,er={},nil,29
for ns,cH in ipairs(a.plot:GetDescendants())do if cH:IsA("BasePart")then local cI=kY(cH)
if cI>0 then cG[#cG+1]={s=cI,p=cH}if cI>er then bw,er=cH,cI end end end end table.sort(cG,function(k3,k4)return k3 .s>k4 .s end)
a.padCands,a.padPart=cG,bw if bw then f("collect pad: "..N(bw).." (score "..er..")")end
return bw end local es="SAB_pad_v1.txt"local function k5(k6)if type(writefile)=="function"then pcall(writefile,es,table.concat({k6:GetComponents()},","))end
end local function k7()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local k8,hl=pcall(function()if isfile(es)then return readfile(es)end end)if not k8 or type(hl)~="string"then return nil end
local cJ={}for k9 in hl:gmatch("[^,]+")do cJ[#cJ+1]=tonumber(k9)end if#cJ==12 then return CFrame.new(unpack(cJ))end
end local function k_(et,cK,la)local lb=d1(et)local eu=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local Q=(eu and eu:IsA("BasePart"))and(eu.Position-cK)or Vector3 .new(1,0,0)Q=Vector3 .new(Q.X,0,Q.Z)
if Q.Magnitude<0.05 then Q=Vector3 .new(1,0,0)end Q=Q.Unit for lc=0,7 do local cL=lc*math.pi/4
local ld=Vector3 .new(Q.X*math.cos(cL)-Q.Z*math.sin(cL),0,Q.X*math.sin(cL)+Q.Z*math.cos(cL))
local cM=cK+ld*(la+5)local ev=gq(cM.X,cK.Y,cM.Z)if ev and math.abs(ev.Y-cK.Y)<8 then cn(et,Vector3 .new(cM.X,ev.Y+lb,cM.Z))
if d2(et,0.7)then return true end end end return false end local function le()a.lastCollect=g()
local bx=aB()if not bx then return end local hm,lf=bx.HumanoidRootPart,d1(bx)local by,hn,bz,ew=nil,4,nil,"?"
local ex=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and ex and ex:IsA("BasePart")then
by,ew=(ex.CFrame*a.manualPad).Position,"manual pad"else local af=k2()if af then by=Vector3 .new(af.Position.X,af.Position.Y+af.Size.Y/2+lf,af.Position.Z)
hn,bz,ew=math.max(af.Size.X,af.Size.Z)/2,af,af.Name end end if not by then f("COLLECT: pad not found - stand on it and tap SET PAD")return end
local ey=ac()cn(bx,by)if bz and type(firetouchinterest)=="function"then pcall(firetouchinterest,hm,bz,0)end
ak(e.PadDwell)if bz and type(firetouchinterest)=="function"then pcall(firetouchinterest,hm,bz,1)end
ak(0.5)a.collected=a.collected+1 local ez=ac()f(("COLLECTED (%s) %s"):format(ew,(ey and ez and ez>ey)and("+$"..ab(ez-ey))or"no cash change seen"))
k_(bx,by,hn)end local bA local function ho()if a.capHit then if e.AutoStart and g()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 f("trying again after being stopped for 5 minutes")bA(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not aB()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aC(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local eA,hp=dl()local cN=v()if cN then local bB=C(t(cN))if not aa(cN)then local eB=(l.gift and t(l.gift)==t(cN)and g()-l.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bB,eB),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bB,eB),"bad"
end return"sell",("selling %s (%s)"):format(bB,eB),"warn"end if eA<1 then return nil,("holding %s - 0 free stations"):format(bB),"wait"end
return"place",("waxing %s (%d free)"):format(bB,eA),"ok"end a.holding=false if e.Crates and not c.waiting and g()-(c.scanAt or 0)>1 then
c.scanAt=g()local hq=a.plot:FindFirstChild("CrateStand")if hq then for nt,bC in ipairs(hq:GetChildren())do
if gJ(bC.Name)then local hr=false for nu,hs in ipairs(bC:GetDescendants())do if hs:IsA("ProximityPrompt")and hs.Enabled then hr=true break end
end if hr then local lg=c9(bC.Name):gsub("crate$","")local eC for ht in pairs(o.members)do if c9(ht)==lg then eC=ht end end
c.waiting,c.at=true,g()c.title=(eC or bC.Name).." Crate"c.data={name=bC.Name,rarity=eC,title=c.title}
f(c.title.." found sitting on your stand")break end end end end end if e.Crates and(c.on or c.waiting)then
local K=c.title if g()<(c.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open or Discard yourself"):format(K),"bad"
end local eD,hu=ku(c.data)if c.on then if a.crateFails>=3 then c.ignoreUntil,a.crateFails=g()+120,0
f("could not press the "..K.." buttons 3 times - leaving it to you for 2 min")return nil,("%s window open - press Open or Discard yourself"):format(K),"bad"
end if g()-c.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(K),"bad"
end if c.byYou and g()-c.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
K,math.ceil(60-(g()-c.openedAt))),"idle"end if eD then return"crate",("opening %s for %s"):format(K,hu),"ok"end
if e.SellJunk then return"nocrate",("discarding %s - nothing ticked inside"):format(K),"warn"end
return nil,("%s open - nothing ticked inside it"):format(K),"idle"end if not eD and not e.SellJunk then
return nil,("%s waiting - nothing ticked inside, left alone"):format(K),"idle"end if c.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand then DUMP"):format(K),"bad"
end if g()-c.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(K),"wait"
end return"cratewin",("%s waiting - going to open it%s"):format(K,eD and(" for "..hu)or" to discard"),"ok"
end if c.rolled and not c.waiting and g()-c.rolledAt<6 then return nil,c.rolled.." rolled - waiting for it to land","wait"
end if eA<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(hp,hp),"wait"
end local eE=ds()if not eE then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end
local bD=bd()if bD and gJ(bD.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(bD.name),"idle"end
if g()-c.lastFail<8 then return nil,("%s on the pad - could not open it"):format(bD.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(bD.name),"ok"end local au=dZ()
if au.state~="match"then a.matchSince=nil if au.state=="skip"and not eE.Enabled then return nil,au.text.." (sold out)","idle"end
return nil,au.text,au.level end if not eE.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local bE=g()if bE<a.noCashUntil then local hv,lh=gj()if hv then return nil,("cash short: have $%s, price ~$%s"):format(ab(hv),ab(lh)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ab(ac()),math.ceil(a.noCashUntil-bE)),"bad"
end if bE-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or bE
local hw=bE-a.matchSince if hw<e.Confirm then return nil,("confirming %s (%.2fs)"):format(au.shown,hw),"ok"end
return"buy",("buying %s via %s"):format(au.shown,au.src),"ok"end local function T(li,lj,...)
if a.busy then return end a.busy,a.busyText=true,li local lk,hx=pcall(lj,...)a.busy,a.busyText=false,""
if not lk and hx~=c7 then f("ERR "..tostring(hx))end end local function ll()local aY,lm,ln=ho()
a.reason,a.level=lm,ln if aY=="place"then T("waxing...",gG)elseif aY=="crate"then T("opening crate...",ek,true)
elseif aY=="cratewin"then T("opening the crate window...",g3)elseif aY=="nocrate"then T("discarding crate...",ek,false)
elseif aY=="sell"then T("selling...",hi)elseif aY=="buy"then T("buying...",gB,false)elseif e.Collect and not a.matchSince and g()-a.lastCollect>=e.Every then
T("collecting money...",le)end end function bA(cO,lo)if cO==a.running then return end a.running=cO
if not lo then e.AutoStart=cO end if cO then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
c.lastFail,c.summonFails,c.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=g()
a.plot=aC()or a.plot f("START")else a.reason="stopped"f("STOP")end end local function hy()
local eF={}local function i(lp)eF[#eF+1]=tostring(lp)end i("=== SAB "..az.." DUMP "..os.date("%H:%M:%S").." ===")
i(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
i("reason: "..tostring(a.reason))i("targets: "..table.concat(fV(),", "))i(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
i("cash="..ab(ac()))local lq,hz=v()i("in hands: "..tostring(lq)..(hz and(" ("..hz.ClassName..")")or"")..
"  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-g())))
i("  attribute SquishyEquipped = "..tostring(u:GetAttribute("SquishyEquipped")))local hA=a.plot and a.plot:FindFirstChild("SquishyEquipped")
i("  plot.SquishyEquipped = "..(hA and(#hA:GetChildren().." children")or"missing"))local eG=u.Character
if eG then local eH={}for nv,bF in ipairs(eG:GetDescendants())do if(bF:IsA("Model")or bF:IsA("Tool"))and bF.Name~=eG.Name then eH[#eH+1]=bF.ClassName..":"..bF.Name end
end i("  on the character: "..(table.concat(eH,", "):sub(1,300)))end local cP=bd()i("on pad: "..(cP and("%s [%s] %s"):format(cP.name,tostring(cP.rar),tostring(cP.price))or"nothing"))
i("sell spot: "..(a.sellSpot and N(a.sellSpot)or"none found"))i("--- CRATES ---")i(("waiting=%s windowOpen=%s title=%s rolled=%s (%ss ago) opened=%d tapWay=%s fails=%d/%d"):format(
tostring(c.waiting),tostring(c.on),c.title,tostring(c.rolled),c.rolledAt>0 and string.format("%.0f",g()-c.rolledAt)or"-",
a.crates,tostring(a.tapWay),a.crateFails,c.summonFails))local cQ=c.findWin()i(("crate window: %s visible=%s mine=%s yours=%s"):format(cQ and N(cQ)or"not found",
tostring(cQ and cQ.Visible),tostring(c.ours),tostring(c.byYou)))local cR=g0()i("crate prompt: "..(cR and(N(cR).." ["..cR.ActionText.."|"..cR.ObjectText.."]")or"none found"))
local hB=a.plot and a.plot:FindFirstChild("CrateStand")if hB then local eI=0 for nw,aL in ipairs(hB:GetDescendants())do
eI=eI+1 if eI>30 then i("  ...")break end local hC=""if aL:IsA("ProximityPrompt")then hC=(" [%s|%s|on=%s|hold=%.2f]"):format(aL.ActionText,aL.ObjectText,tostring(aL.Enabled),aL.HoldDuration)end
i("  CrateStand/"..N(aL):gsub("^.-CrateStand%.","").." ("..aL.ClassName..")"..hC)end else
i("  no CrateStand in the plot")end i("enabled prompts in the plot:")if a.plot then for nx,aZ in ipairs(a.plot:GetDescendants())do
if aZ:IsA("ProximityPrompt")and aZ.Enabled then i(("  %s [%s|%s] safe=%s"):format(N(aZ),aZ.ActionText,aZ.ObjectText,tostring(ef(aZ))))
end end end local hD=u:FindFirstChildOfClass("PlayerGui")if hD then i("buttons on screen that say open/discard:")
for ny,bG in ipairs(hD:GetDescendants())do if bG:IsA("GuiButton")and cv(bG)then local eJ=bl(bG)
if eJ:find("open",1,true)or eJ:find("discard",1,true)then i(("  %s %s -> %q"):format(bG.ClassName,N(bG),eJ))
end end end end i("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(cy~=nil))
i("--- CATALOG ("..o.n.." butters, worst rarity first) ---")for nz,cS in ipairs(o.rarOrder)do
local eK={}for nA,hE in ipairs(o.members[cS]or{})do eK[#eK+1]=(e.Targets[hE]and"*"or"")..C(hE)
end i(("  [%s]%s %s"):format(cS,y.price[cS]and(" crate $"..ab(y.price[cS]))or"",table.concat(eK,", ")))
end i("learned orders: ")for lr,ls in pairs(y.order)do i("  "..lr..": "..table.concat(ls,", "))end
i("--- PLOT ---")i("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for nB,eL in ipairs(a.plot:GetChildren())do
i(("  %s %s (%d)"):format(eL.ClassName,eL.Name,#eL:GetChildren()))end local lt,lu=dl()i(("stations free %d / %d"):format(lt,lu))
local eM=ds()i("BuyPrompt: "..(eM and("enabled="..tostring(eM.Enabled).." hold="..eM.HoldDuration)or"MISSING"))
end i("autostart="..tostring(e.AutoStart).." rejoin="..tostring(e.Rejoin))i(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))i("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#dM())i("--- COLLECT PAD ---")
i("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and N(a.padPart)or"none"))
i("--- ATTRIBUTES ---")for nC,hF in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
i(("  %s = %s"):format(hF,tostring(u:GetAttribute(hF))))end i("--- EVENTS ---")for lv=math.max(1,#aA-15),#aA do i("  "..aA[lv])end
i("--- LOG ---")for lw=math.max(1,#ai-25),#ai do i("  "..ai[lw])end return table.concat(eF,"\n")
end do local av=dL(F.auto)if type(av)=="string"then av=av:gsub("%s+$","")if av~=""then a.autoload=av
local lx=f5(av)f(lx and("loaded config "..av)or("config "..av.." could not be loaded"))
end end end local d={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local ly={ok=d.good,wait=d.warn,warn=d.warn,bad=d.bad,idle=d.dim}
local lz={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function k(lA,lB,lC)
local lD,eN=pcall(Instance.new,lA)if not lD then a.uiErrs=a.uiErrs+1 return nil end for lE,lF in pairs(lB)do
if not pcall(function()eN[lE]=lF end)then a.uiErrs=a.uiErrs+1 end end eN.Parent=lC return eN
end local function H(lG,lH)k("UICorner",{CornerRadius=UDim.new(0,lH or 6)},lG)end local b={}
local eO=u:FindFirstChildOfClass("PlayerGui")or u:WaitForChild("PlayerGui")local hG=eO:FindFirstChild("SABFarmGui")
if hG then hG:Destroy()end local eP=k("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},eO)
local A={w=320,h=330,head=30,strip=38,tabs=26}b.root=k("Frame",{Name="Root",Size=UDim2 .new(0,A.w,0,A.h),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=d.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},eP)
H(b.root,10)k("UIStroke",{Color=d.line,Thickness=1},b.root)local a0=UDim2 .new(1,0,1,0)
local function q(hH,hI)return UDim2 .new(hH,0,0,0),UDim2 .new(hI,(hH+hI>0.99)and 0 or-4,1,0)end
local function m(lI,lJ,lK,lL,lM,lN)local hJ=k("TextButton",{Text=lJ,Position=lM,Size=lN,BackgroundColor3=lK,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=lL,TextColor3=d.text,AutoButtonColor=true},lI)H(hJ,6)
return hJ end local function hK(lO,lP,lQ,lR,lS)local eQ=k("TextBox",{Text=lP,PlaceholderText=lQ,Position=lR,Size=lS,BackgroundColor3=d.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=d.text,PlaceholderColor3=d.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},lO)H(eQ,6)k("UIPadding",{PaddingLeft=UDim.new(0,8)},eQ)
return eQ end local cT=bU.CurrentCamera local function lT()local lU,cU=pcall(function()return cT and cT.ViewportSize end)
if lU and cU and cU.X>50 and cU.Y>50 then return cU end end local function aw(bH)local eR=lT()
if not(eR and bH and bH.Parent)then return end local lV=pcall(function()local cV,hL=bH.AbsolutePosition,bH.AbsoluteSize
local eS=70 local hM=math.clamp(cV.X,eS-hL.X,eR.X-eS)local hN=math.clamp(cV.Y,0,eR.Y-math.min(hL.Y,eS))
if math.abs(hM-cV.X)>0.5 or math.abs(hN-cV.Y)>0.5 then bH.Position=UDim2 .new(0,math.floor(hM),0,math.floor(hN))
end end)return lV end local function cW(lW)local lX,eT=pcall(function()return lW.AbsolutePosition end)
if lX and eT then return{math.floor(eT.X),math.floor(eT.Y)}end end local cX={}local function hO(cY,hP,hQ)
M(cY.InputBegan:Connect(function(bI)if bI.UserInputType~=Enum.UserInputType.MouseButton1 and bI.UserInputType~=Enum.UserInputType.Touch then return end
cX[cY]={start=bI.Position,from=hP.Position,moved=0,target=hP}local eU eU=bI.Changed:Connect(function()
if bI.UserInputState==Enum.UserInputState.End then local hR=cX[cY]cX[cY]=nil if eU then eU:Disconnect()end
if hR and hQ then hQ(hR.moved)end end end)end))end M(iG.InputChanged:Connect(function(cZ)
if cZ.UserInputType~=Enum.UserInputType.MouseMovement and cZ.UserInputType~=Enum.UserInputType.Touch then return end
for nD,ag in pairs(cX)do local eV=ag.target if eV and eV.Parent then local hS,hT=cZ.Position.X-ag.start.X,cZ.Position.Y-ag.start.Y
ag.moved=math.max(ag.moved,math.abs(hS)+math.abs(hT))eV.Position=UDim2 .new(ag.from.X.Scale,ag.from.X.Offset+hS,ag.from.Y.Scale,ag.from.Y.Offset+hT)
end end end))local function x(lY,lZ,l0,l1,l2,l3,l4)return k("TextLabel",{Text=lZ,Position=l3 or UDim2 .new(0,0,0,0),Size=l4 or a0,BackgroundTransparency=1,
Font=l2 and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=l0,TextColor3=l1,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},lY)
end b.title=k("Frame",{Size=UDim2 .new(1,0,0,A.head),BackgroundColor3=d.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=k("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=d.dim,BorderSizePixel=0},b.title)
H(b.dot,5)x(b.title,"SAB  BUTTER FARM  "..az,12,d.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=m(b.title,"-",d.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=m(b.title,"X",d.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=k("Frame",{Position=UDim2 .new(0,0,0,A.head),Size=UDim2 .new(1,0,0,A.strip),BackgroundColor3=d.bg,BorderSizePixel=0},b.root)
b.bar=k("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=d.warn,BorderSizePixel=0},b.strip)
H(b.bar,2)b.reason=x(b.strip,"starting",12,d.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=k("Frame",{Position=UDim2 .new(0,0,0,A.head+A.strip),Size=UDim2 .new(1,0,0,A.tabs),BackgroundTransparency=1},b.root)
b.tabFarm=m(b.tabs,"FARM",d.accent,11,UDim2 .new(0,8,0,0),UDim2 .new(0.34,-10,1,-4))b.tabBut=m(b.tabs,"BUTTERS",d.panel2,11,UDim2 .new(0.34,2,0,0),UDim2 .new(0.33,-6,1,-4))
b.tabSet=m(b.tabs,"SETUP",d.panel2,11,UDim2 .new(0.67,2,0,0),UDim2 .new(0.33,-10,1,-4))
local function eW()local eX=k("ScrollingFrame",{Position=UDim2 .new(0,0,0,A.head+A.strip+A.tabs),Size=UDim2 .new(1,0,1,-(A.head+A.strip+A.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=d.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)k("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},eX)
k("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},eX)
return eX end b.farm,b.but,b.set=eW(),eW(),eW()b.but.Visible,b.set.Visible=false,false local c0,bJ,j=0,12,nil
local function I(hU,l5)c0,bJ=c0+1,bJ+hU+6 return k("Frame",{Size=UDim2 .new(1,0,0,hU),BackgroundTransparency=1,LayoutOrder=c0},l5 or b.farm)
end local function bK(l6)x(I(14),l6,10,d.dim,true)end j=I(34)b.startB=m(j,"START",d.good,14,q(0,0.68))
b.killB=m(j,"KILL",d.bad,14,q(0.68,0.32))local l7=I(42)local function bL(hV,l8,eY)local eZ=k("Frame",{Position=UDim2 .new((hV-1)/eY,0,0,0),Size=UDim2 .new(1/eY,hV<eY and-4 or 0,1,0),
BackgroundColor3=d.panel,BorderSizePixel=0},l7)H(eZ,6)local hW=x(eZ,"0",15,d.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local l9=x(eZ,l8,9,d.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))hW.TextXAlignment,l9 .TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return hW end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=bL(1,"BOUGHT",5),bL(2,"WAXED",5),bL(3,"SOLD",5),bL(4,"MONEY",5),bL(5,"FREE",5)
b.info=x(I(40),"",10,d.dim,false)b.tgt=x(I(26),"",10,d.good,false)bK("MONEY COLLECT")j=I(28)
b.secB=hK(j,tostring(e.Every),"60",q(0,0.2))x(j,"sec",11,d.dim,false,q(0.21,0.09))b.secSet=m(j,"SET",d.accent,12,q(0.3,0.2))
b.colT=m(j,"COLLECT: ON",d.accent,11,q(0.5,0.5))j=I(26)b.padB=m(j,"SET PAD (stand on it)",d.panel2,10,q(0,0.55))
b.padL=x(j,"",10,d.dim,false,q(0.56,0.44))bK("BUTTERS YOU DID NOT TICK, AND CRATES")j=I(28)
b.sellT=m(j,"SELL THEM: ON",d.accent,11,q(0,0.55))b.sellB=m(j,"SELL NOW",d.warn,11,q(0.55,0.45))
j=I(28)b.crateT=m(j,"OPEN CRATES: ON",d.accent,11,q(0,0.55))b.crateB=m(j,"OPEN NOW",d.warn,11,q(0.55,0.45))
bK("TOOLS")j=I(30)b.buyB=m(j,"BUY NOW",d.warn,11,q(0,0.28))b.plB=m(j,"WAX",d.good,11,q(0.28,0.24))
b.dumpB=m(j,"DUMP",d.accent,11,q(0.52,0.24))b.copyB=m(j,"COPY",d.panel2,11,q(0.76,0.24))
bK("LOG")b.log=k("TextLabel",{Size=a0,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=d.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},I(84))H(b.log,6)k("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},b.log)
bK("OUTPUT  (DUMP result)")b.out=k("TextBox",{Size=a0,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},I(110))H(b.out,6)
b.farm.CanvasSize=UDim2 .new(0,0,0,bJ)c0,bJ=0,12 local function L(l_)return I(l_,b.set)end
local function c1(ma)x(L(14),ma,10,d.dim,true)end c1("SETTINGS FILE  (saved on your phone)")
j=L(28)b.cfgName=hK(j,"default","config name",q(0,0.5))b.cfgSave=m(j,"SAVE",d.good,11,q(0.5,0.25))
b.cfgLoad=m(j,"LOAD",d.accent,11,q(0.75,0.25))j=L(26)b.cfgPrev=m(j,"<",d.panel2,11,q(0,0.13))
b.cfgPick=m(j,"(none saved)",d.panel2,10,q(0.13,0.74))b.cfgNext=m(j,">",d.panel2,11,q(0.87,0.13))
j=L(26)b.cfgAuto=m(j,"LOAD IT ON LAUNCH: OFF",d.panel2,10,q(0,1))b.cfgMsg=x(L(26),"",10,d.dim,false)
c1("START BY ITSELF")j=L(26)b.autoB=m(j,"INSTALL F.exec",d.accent,10,q(0,1))b.autoMsg=x(L(30),"",10,d.dim,false)
j=L(28)b.startT=m(j,"START FARMING ON LOAD: ON",d.accent,10,q(0,1))x(L(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,d.dim,false)
c1("IF THE GAME DROPS ME")j=L(28)b.rejT=m(j,"AUTO REJOIN: ON",d.accent,11,q(0,0.55))b.rejB=m(j,"REJOIN NOW",d.warn,11,q(0.55,0.45))
b.rejMsg=x(L(30),"",10,d.dim,false)c1("THE ROUND SAB BUTTON")x(L(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,d.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,bJ)local hX=k("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},eO)
b.tgRoot=k("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=d.accent,BorderSizePixel=0,Active=true},hX)H(b.tgRoot,26)k("UIStroke",{Color=d.line,Thickness=1},b.tgRoot)
b.tgBtn=k("TextButton",{Text="SAB",Size=a0,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=d.text,AutoButtonColor=false},b.tgRoot)b.tgDot=k("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=d.dim,
BorderSizePixel=0},b.tgRoot)H(b.tgDot,4)local ah={built=false,boxes={},at=0}local function hY(hZ,e0)
e.Targets[hZ]=e0 or nil local e1=ah.boxes[hZ]if e1 then e1 .Text=e0 and"X"or""e1 .BackgroundColor3=e0 and d.good or d.panel2
end end local function e2()for mb,h0 in pairs(ah.boxes)do local h1=e.Targets[mb]==true h0 .Text=h1 and"X"or""
h0 .BackgroundColor3=h1 and d.good or d.panel2 end end local bM local function mc()local md=0
local e3=k("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=x(e3,"",10,d.dim,false,q(0,0.5))local me=m(e3,"CLEAR",d.panel2,10,q(0.5,0.24))
local mf=m(e3,"REFRESH",d.panel2,10,q(0.74,0.26))me.MouseButton1Click:Connect(function()
for mg in pairs(e.Targets)do e.Targets[mg]=nil end e2()end)mf.MouseButton1Click:Connect(function()
o.at=0 dK()bM(true)end)return md end bM=function(mh)if not dK()then if not b.butEmpty then
b.butEmpty=x(k("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,d.warn,false)end return
end if ah.built and not mh and ah.at==o.at then return end for nE,e4 in ipairs(b.but:GetChildren())do
if e4:IsA("Frame")or e4:IsA("TextButton")then e4:Destroy()end end ah.boxes,b.butEmpty={},nil
mc()local e5,e6=36,1 local function h2(h3)e6=e6+1 local mi=k("Frame",{Size=UDim2 .new(1,0,0,h3),BackgroundTransparency=1,LayoutOrder=e6},b.but)
e5=e5+h3+6 return mi end for nF,c2 in ipairs(o.rarOrder)do local mj=h2(24)local mk=lz[c2]or d.text
local e7=k("Frame",{Size=a0,BackgroundColor3=d.panel,BorderSizePixel=0},mj)H(e7,6)x(e7,"  "..c2:upper(),11,mk,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local ml=m(e7,"ALL",d.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local mm=c2
ml.MouseButton1Click:Connect(function()local h4=o.members[mm]or{}local h5=false for nG,mn in ipairs(h4)do if not e.Targets[mn]then h5=true break end end
for nH,mo in ipairs(h4)do hY(mo,h5)end end)for nI,e8 in ipairs(o.members[c2]or{})do local mp=h2(22)
local c3=k("TextButton",{Text="",Size=a0,BackgroundColor3=d.bg,BorderSizePixel=0,AutoButtonColor=true},mp)
H(c3,5)x(c3,"   "..C(e8),11,d.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local e9=k("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},c3)
H(e9,4)ah.boxes[e8]=e9 local h6=e8 local function h7()hY(h6,not e.Targets[h6])end c3 .MouseButton1Click:Connect(h7)
e9 .MouseButton1Click:Connect(h7)end end e2()b.but.CanvasSize=UDim2 .new(0,0,0,e5+10)ah.built,ah.at=true,o.at
end local h8="farm"local function bN(ax)h8=ax b.farm.Visible,b.but.Visible,b.set.Visible=(ax=="farm"),(ax=="but"),(ax=="set")
b.tabFarm.BackgroundColor3=(ax=="farm")and d.accent or d.panel2 b.tabBut.BackgroundColor3=(ax=="but")and d.accent or d.panel2
b.tabSet.BackgroundColor3=(ax=="set")and d.accent or d.panel2 if ax=="but"then bM(false)end
end local function D(h9,h_,mq,mr)h9 .Text=h_ and mq or mr h9 .BackgroundColor3=h_ and d.accent or d.panel2
end local function ms()b.secB.Text=tostring(e.Every)D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then bA(e.AutoStart,true)end if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end aw(b.root)
aw(b.tgRoot)a.lastCollect=g()e2()end local function mt(ia)task.spawn(function()ia.TextColor3=d.bad
task.wait(0.8)if a.alive then ia.TextColor3=d.text end end)end local function ib()local ic=b.secB.Text:match("^%s*(%d+)%s*$")
local bO=ic and tonumber(ic)if not bO or bO<1 then b.secB.Text=tostring(e.Every)mt(b.secB)
f("interval must be a whole number >= 1")return end if bO==e.Every then return end e.Every,a.lastCollect=bO,g()
f("collect every "..bO.."s")end local function id(mu)local ie=setclipboard or toclipboard
return type(ie)=="function"and pcall(ie,mu)end local function mv()local e_=aj~=""and aj or(a.reason.."\n"..table.concat(ai,"\n"))
if id(e_)then f("copied "..#e_.." chars")return end b.out.Text=e_ pcall(function()b.out:CaptureFocus()end)
f("no clipboard here - select the text in OUTPUT")end local function mw()local mx,ig=pcall(hy)
aj=mx and ig or("DUMP ERROR "..tostring(ig))local ih=id(aj)b.out.Text=(ih and#aj>7000)and(aj:sub(1,7000).."\n... (full text is on your clipboard)")or aj
f("DUMP "..#aj.." chars"..(ih and", copied"or""))end local function r(my,mz)M(my.MouseButton1Click:Connect(mz))end
r(b.secSet,ib)M(b.secB.FocusLost:Connect(ib))r(b.colT,function()e.Collect,a.lastCollect=not e.Collect,g()
D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")end)r(b.sellT,function()e.SellJunk=not e.SellJunk
D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)r(b.sellB,function()a.sellFails=0
task.spawn(T,"selling...",hi)end)r(b.crateT,function()e.Crates=not e.Crates D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)r(b.crateB,function()c.lastFail,c.summonFails,c.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(T,"opening crate...",ek,true)
end)r(b.padB,function()a.plot=aC()or a.plot local ii,fa=aB(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(ii and fa and fa:IsA("BasePart"))then f("SET PAD: need character and plot")return end
a.manualPad=fa.CFrame:ToObjectSpace(ii.HumanoidRootPart.CFrame)k5(a.manualPad)f("collect pad saved at your position")
end)r(b.startB,function()bA(not a.running)end)r(b.buyB,function()a.plot=aC()or a.plot task.spawn(T,"buying (manual)...",gB,true)
end)r(b.plB,function()a.plot=aC()or a.plot task.spawn(T,"waxing (manual)...",gG)end)r(b.dumpB,mw)
r(b.copyB,mv)r(b.tabFarm,function()bN("farm")end)r(b.tabBut,function()bN("but")end)r(b.tabSet,function()bN("set")end)
local function ij(fb)a.hidden=fb b.root.Visible=not fb b.tgBtn.Text=fb and"SAB+"or"SAB"
end hO(b.tgRoot,b.tgRoot,function(mA)aw(b.tgRoot)a.togPos=cW(b.tgRoot)or a.togPos if mA<8 then ij(not a.hidden)end
end)r(b.tgBtn,function()ij(not a.hidden)end)local J,E={},0 local function ay()J=dM()if#J==0 then
b.cfgPick.Text="(none saved)"E=0 return end if E<1 or E>#J then E=1 end b.cfgPick.Text=J[E]..("  (%d/%d)"):format(E,#J)
end local function ik()local il=a.autoload~=nil b.cfgAuto.Text=il and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
b.cfgAuto.BackgroundColor3=il and d.accent or d.panel2 end local function fc()local im=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if im~=""then return im end return(E>0 and J[E])or""end r(b.cfgSave,function()a.winPos=cW(b.root)or a.winPos
a.togPos=cW(b.tgRoot)or a.togPos local io,ip=dP(fc())b.cfgMsg.Text=io and("saved as "..ip)or("could not save: "..ip)
b.cfgMsg.TextColor3=io and d.good or d.bad ay()f(b.cfgMsg.Text)end)local function mB(iq)
local fd,ir=f5(iq)b.cfgMsg.Text=fd and("loaded "..ir)or("could not load: "..ir)b.cfgMsg.TextColor3=fd and d.good or d.bad
if fd then b.cfgName.Text=iq ms()end f(b.cfgMsg.Text)end r(b.cfgLoad,function()mB(fc())end)
r(b.cfgPick,function()ay()if E>0 then b.cfgName.Text=J[E]end end)r(b.cfgPrev,function()
if#J==0 then ay()return end E=(E-2)%#J+1 ay()b.cfgName.Text=J[E]end)r(b.cfgNext,function()
if#J==0 then ay()return end E=E%#J+1 ay()b.cfgName.Text=J[E]end)r(b.cfgAuto,function()if a.autoload then
f7(nil)b.cfgMsg.Text="it will not load a config on launch"else local bP=fc()local is=false
for nJ,mC in ipairs(dM())do if mC==bP then is=true end end local mD=is or dP(bP)if mD and bP~=""then
f7(bP)ay()b.cfgMsg.Text=bP.." will load every time the script starts"else b.cfgMsg.Text="name the config and save it first"
end end b.cfgMsg.TextColor3=d.dim ik()end)r(b.autoB,function()local it,iu=jM()b.autoMsg.Text=it and("installed. "..iu)or("failed: "..iu)
b.autoMsg.TextColor3=it and d.good or d.bad f(b.autoMsg.Text)end)r(b.startT,function()e.AutoStart=not e.AutoStart
D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)r(b.rejT,function()
e.Rejoin=not e.Rejoin D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)r(b.rejB,function()cg("you asked")end)
local a1=false r(b.minB,function()a1=not a1 b.tabs.Visible=not a1 if a1 then b.farm.Visible,b.but.Visible,b.set.Visible=false,false,false
else bN(h8)end b.root.Size=UDim2 .new(0,A.w,0,a1 and(A.head+A.strip)or A.h)b.minB.Text=a1 and"+"or"-"
end)local function c4()if not a.alive then return end a.alive,a.running=false,false pcall(du)
for nK,mE in ipairs(c8)do pcall(function()mE:Disconnect()end)end pcall(function()eP:Destroy()end)
pcall(function()hX:Destroy()end)if aM.SAB_KILL==c4 then aM.SAB_KILL=nil end end aM.SAB_KILL=c4
r(b.killB,c4)r(b.xB,c4)hO(b.title,b.root,function()aw(b.root)a.winPos=cW(b.root)or a.winPos
end)local function iv()local bQ,bR=a.reason,a.level if a.busy then bQ,bR=a.busyText,"ok"
elseif not a.running then local nL,iw,mF=ho()if a.capHit then bQ,bR=iw,"bad"else bQ,bR="[stopped] "..iw,(mF=="bad")and"bad"or"idle"end
a.reason,a.level=bQ,bR end b.reason.Text=bQ b.bar.BackgroundColor3=ly[bR]or d.dim b.dot.BackgroundColor3=a.running and d.good or(a.capHit and d.bad or d.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and d.panel2 or d.accent
b.startB.Text=a.running and"STOP"or"START"D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and d.warn or d.good local mG,mH=dl()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),mG.."/"..mH local ix=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(g()-a.lastCollect)))or nil
local iy=v()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ab(ac()),a.rolls,a.gifts,a.crates,iy and C(t(iy))or"nothing",c.on and("   ["..c.title.." window open]")or"",
ix and("in "..ix.."s")or"off")local a2=fV()b.tgt.Text=(#a2==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#a2<=3)and table.concat(a2,", ")or(#a2 .." butters ticked")))b.tgt.TextColor3=(#a2==0)and d.bad or d.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(bV,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(o.n,#o.rarOrder,#a2)
end if b.but.Visible and ah.at~=o.at then bM(false)end end aM.SAB={S=a,CFG=e,EV=l,U=b,sg=eP,dump=hy,CAT=o,LEARN=y,buildList=bM}
f(az.." loaded")if a.uiErrs>0 then f("UI: "..a.uiErrs.." properties skipped")end bN("farm")
aw(b.root)aw(b.tgRoot)if cT then pcall(function()M(cT:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)aw(b.root)aw(b.tgRoot)end))end)end ay()ik()if a.config and a.config~=""then b.cfgName.Text=a.config end
D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")
D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")b.secB.Text=tostring(e.Every)
pcall(iv)task.spawn(function()local iz=dR()b.rejMsg.Text=iz and("after a rejoin it restarts from\n"..iz)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(dL(F.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(jS)end)task.spawn(function()while a.alive do local mI,mJ=pcall(iv)if not mI then f("UI ERR "..tostring(mJ))end
task.wait(0.25)end end)task.spawn(function()local mK,mL=pcall(j1)if not mK then f("HOOK ERR "..tostring(mL))end
end)task.spawn(function()pcall(i4)if dK()then f(("catalog: %d butters in %d rarities"):format(o.n,#o.rarOrder))end
local mM,iA=pcall(k7)if mM and iA and a.alive and not a.manualPad then a.manualPad=iA end
end)task.spawn(function()while a.alive do task.wait(20)pcall(du)end end)if c6 then M(u.Idled:Connect(function()pcall(function()c6:CaptureController()c6:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()if not e.AutoStart then return end a.reason,a.level="waiting for the game to load, then starting","wait"
for nM=1,120 do if not a.alive then return end if a.running then return end a.plot=a.plot or aC()
if aB()and a.plot and next(e.Targets)then bA(true,true)f("started by itself")return end
task.wait(1)end if a.alive and not a.running then f("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=aC()a.lastCollect=g()while a.alive do if a.running then
local mN,iB=pcall(ll)if not mN and iB~=c7 then f("LOOP ERR "..tostring(iB))end end task.wait(0.1)
end end)c5("loaded - window is at the top left")end local mP,fe=xpcall(iF,function(mO)return tostring(mO).."\n"..debug.traceback()end)
if not mP then pcall(function()warn("SAB "..az.." ERROR: "..tostring(fe))end)c5("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..az.." ERROR: "..tostring(fe))end)pcall(function()local iC=(type(getgenv)=="function"and getgenv())or _G
if type(iC.SAB_KILL)=="function"then iC.SAB_KILL()end for nN,mQ in ipairs({"SABFarmGui","SABToggle"})do
local iD=u.PlayerGui:FindFirstChild(mQ)if iD then iD:Destroy()end end end)pcall(function()
local bS=Instance.new("ScreenGui")bS.Name="SABError"bS.ResetOnSpawn=false bS.DisplayOrder=1000
local V=Instance.new("TextBox")V.Size=UDim2 .new(0,340,0,170)V.Position=UDim2 .new(0,10,0,50)
V.BackgroundColor3=Color3 .fromRGB(90,20,20)V.TextColor3=Color3 .new(1,1,1)V.TextSize=11
V.TextWrapped=true V.ClearTextOnFocus=false V.TextXAlignment=Enum.TextXAlignment.Left V.TextYAlignment=Enum.TextYAlignment.Top
V.Text="SAB "..az.." failed to start. Send this text:\n"..tostring(fe)V.Parent=bS bS.Parent=u:WaitForChild("PlayerGui")
end)end
