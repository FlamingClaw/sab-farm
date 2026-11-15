local az="v19"local fg=game:GetService("Players")local u=fg.LocalPlayer or fg.PlayerAdded:Wait()
local function c5(iF)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..az,Text=iF,Duration=6})
end)end c5("script started")local function iG()local bV=game:GetService("ReplicatedStorage")
local bW=game:GetService("Workspace")local iH=game:GetService("UserInputService")local aM=(type(getgenv)=="function"and getgenv())or _G
if type(aM.SAB_KILL)=="function"then pcall(aM.SAB_KILL)end local g=(type(tick)=="function")and tick or os.clock
local c6=(function()local iI,iJ=pcall(function()return game:GetService("VirtualUser")end)return iI and iJ or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,Rejoin=true,
AutoStart=true,Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,
capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,matchSince=nil,boot=g(),plot=nil,reason="starting",level="wait",
lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,
crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local l={name=nil,rar=nil,at=g(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local c={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0,ours=false,byYou=false,openedAt=0,win=nil,hidByUs=false}
local c7={}local c8,bX,aj,aA={},{},{},{}local ak=""local function M(fh)c8[#c8+1]=fh return fh end
local function aB(iK)task.wait(iK)if not a.alive then error(c7,0)end end local function f(bY)
bY=os.date("%H:%M:%S").." "..tostring(bY)table.insert(bX,1,bY)if#bX>6 then table.remove(bX)end
aj[#aj+1]=bY if#aj>80 then table.remove(aj,1)end end local function c9(fi)if type(fi)~="string"then return""end
return(fi:lower():gsub("[^%w]",""))end local function t(iL)local fj=c9(iL)local c_=fj:gsub("butter$","")
if c_==""then c_=fj end return c_ end local function aa(da)return type(da)=="string"and t(da)~=""and e.Targets[t(da)]==true end
local function iM(a4)a4=a4:lower()return a4:find("squishy",1,true)~=nil or a4:match("butter$")~=nil or a4:match("butter[^%a]")~=nil
end local db={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ab(a5)
if type(a5)~="number"then return"?"end local bZ=1 while math.abs(a5)>=1000 and bZ<#db do a5=a5/1000 bZ=bZ+1 end
local iN=string.format("%.2f",a5):gsub("%.?0+$","")return iN..db[bZ]end local function iO(fk)
if type(fk)~="string"then return nil end local iP,fl=fk:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local dc=tonumber(iP)if not dc then return nil end if fl==""then return dc end for iQ,iR in ipairs(db)do if iR:lower()==fl:lower()then return dc*1000^(iQ-1)end end
return nil end local function ac()local fm=u:GetAttribute("BoardValueMoney")if type(fm)=="number"then return fm end
local fn=u:FindFirstChild("leaderstats")if fn then for mW,iS in ipairs({"Cash","Money","Coins"})do
local dd=fn:FindFirstChild(iS)if dd and type(dd.Value)=="number"then return dd.Value end
end end end local function N(iT)local de=iT:GetFullName()if a.plot then local df=a.plot:GetFullName()
if de:sub(1,#df)==df then return de:sub(#df+2)end end return de end local function aC()
local b0=u.Character if b0 and b0:FindFirstChild("HumanoidRootPart")then local fo=b0:FindFirstChildOfClass("Humanoid")
if fo and fo.Health>0 then return b0 end end end local function aD()local dg=bW:FindFirstChild("Plots")
if not dg then return nil end local function fp(iU)local fq=iU:FindFirstChild("Plate")return fq~=nil and fq:FindFirstChild("EditStackAttachment",true)~=nil
end local fr=u:GetAttribute("PlotNumber")if fr~=nil then local dh=dg:FindFirstChild(tostring(fr))
if dh and fp(dh)then return dh end end for mX,fs in ipairs(dg:GetChildren())do if fp(fs)then return fs end
end end local function a6(ft)local al=ft and ft.Parent for mY=1,6 do if not al then return nil end
if al:IsA("BasePart")then return al end if al:IsA("Model")then return al.PrimaryPart or al:FindFirstChildWhichIsA("BasePart",true)end
al=al.Parent end end local function fu(fv)local di=fv.Parent if di and di:IsA("Attachment")then return di.WorldPosition end
local fw=a6(fv)return fw and fw.Position end local function iV()local aN=a.plot and a.plot:FindFirstChild("Plate")
if not aN then return nil end if aN:IsA("BasePart")then return aN.Position end if aN:IsA("Model")then return aN:GetPivot().Position end
local fx=aN:FindFirstChildWhichIsA("BasePart",true)return fx and fx.Position end local function fy()
local dj={}local fz=a.plot and a.plot:FindFirstChild("WaxStations")if fz then for mZ,iW in ipairs(fz:GetChildren())do
local fA=iW:FindFirstChild("SquishyPlaceHolder")local dk=fA and fA:FindFirstChild("PlacePrompt")
if dk and dk:IsA("ProximityPrompt")then dj[#dj+1]=dk end end end return dj end local function dl()
local fB,dm=fy(),0 for m0,iX in ipairs(fB)do if iX.Enabled then dm=dm+1 end end local dn=#fB
local dp=u:GetAttribute("WaxStations")if type(dp)=="number"and dp>dn then dn=dp end return dm,dn
end local function iY()local fC=aC()local fD=fC and fC.HumanoidRootPart.Position local dq,fE
for m1,dr in ipairs(fy())do if dr.Enabled then local fF=fu(dr)local fG=(fF and fD)and(fF-fD).Magnitude or 1e9
if not dq or fG<fE then dq,fE=dr,fG end end end return dq end local function ds()local b1=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not b1 then return nil end local fH=b1:FindFirstChild("BuyPromptAttachment")local b2=(fH and fH:FindFirstChild("BuyPrompt"))or b1:FindFirstChild("BuyPrompt",true)
if b2 and b2:IsA("ProximityPrompt")and b2:IsDescendantOf(b1)then return b2 end end local iZ={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local i0={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local y={order={},price={},dirty=false}local o={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local dt="SAB_order.txt"local function du()if not y.dirty or type(writefile)~="function"then return end
local a7={}for i1,i2 in pairs(y.price)do a7[#a7+1]="P|"..i1 .."|"..string.format("%.0f",i2)end
for i3,i4 in pairs(y.order)do a7[#a7+1]="O|"..i3 .."|"..table.concat(i4,",")end if pcall(writefile,dt,table.concat(a7,"\n"))then y.dirty=false end
end local function i5()if type(isfile)~="function"or type(readfile)~="function"then return end
local i6,i7=pcall(isfile,dt)if not(i6 and i7)then return end local i8,fI=pcall(readfile,dt)
if not(i8 and type(fI)=="string")then return end for i9 in fI:gmatch("[^\n]+")do local fJ,fK,dv=i9:match("^(%a)|([^|]+)|(.*)$")
if fJ=="P"then y.price[fK]=tonumber(dv)elseif fJ=="O"and dv~=""then local b3={}for i_ in dv:gmatch("[^,]+")do b3[#b3+1]=i_ end
if#b3>0 then y.order[fK]=b3 end end end end local function ja(b4)if type(b4)~="table"then return end
local aE,fL=b4 .rarity,b4 .contents if type(aE)~="string"or aE==""or type(fL)~="table"then return end
local a8={}for m2,b5 in ipairs(fL)do if type(b5)=="table"and type(b5 .butter)=="string"then
a8[#a8+1]={n=b5 .butter,ch=tonumber(b5 .chance)or 0}end end if#a8==0 then return end table.sort(a8,function(jb,jc)return jb.ch>jc.ch end)
local a9,a_={},false for jd,je in ipairs(a8)do a9[jd]=je.n end local dw=y.order[aE]if not dw or#dw~=#a9 then a_=true end
if not a_ then for fM=1,#a9 do if dw[fM]~=a9[fM]then a_=true break end end end y.order[aE]=a9
local dx=tonumber(b4 .price)if dx and y.price[aE]~=dx then y.price[aE]=dx a_=true end if a_ then
y.dirty=true o.at=0 f("learned the "..aE.." order from its crate")end end local function ba(jf,jg)
local jh=jf:FindFirstChild(jg,true)local ji,dy=pcall(function()return jh.Text end)return(ji and type(dy)=="string"and dy~="")and dy or nil
end local function C(fN)return o.pretty[fN]or fN end local function jj()local fO=bV:FindFirstChild("Assets")
local fP=fO and fO:FindFirstChild("Squishies")if not fP then return false end local dz,fQ,aO={},{},{}
local b6=0 for m3,b7 in ipairs(fP:GetChildren())do local bb=t(b7 .Name)if bb~=""and not dz[bb]then
local b8=ba(b7,"RarityText")or"?"dz[bb]=b8 fQ[bb]=ba(b7,"NameText")or b7 .Name aO[b8]=aO[b8]or{}
table.insert(aO[b8],bb)b6=b6+1 end end if b6==0 then return false end for fR,jk in pairs(aO)do
local fS=y.order[fR]or i0[fR]local dA={}if fS then for jl,jm in ipairs(fS)do dA[t(jm)]=jl end end
table.sort(jk,function(fT,fU)local dB,dC=dA[fT],dA[fU]if dB and dC then return dB<dC end
if dB then return true end if dC then return false end return C(fT)<C(fU)end)end local dD={}
for jn,jo in ipairs(iZ)do dD[jo]=jn end local b9={}for jp in pairs(aO)do b9[#b9+1]=jp end
table.sort(b9,function(dE,dF)local dG,dH=y.price[dE],y.price[dF]if dG and dH and dG~=dH then return dG<dH end
local dI,dJ=dD[dE],dD[dF]if dI and dJ then return dI<dJ end if dI then return true end if dJ then return false end
return dE<dF end)o.rar,o.pretty,o.members,o.rarOrder,o.n,o.at=dz,fQ,aO,b9,b6,g()return true
end local function dK()if o.at==0 or(g()-o.at)>120 then pcall(jj)end return o.n>0 end local function jq(jr)
local fV=t(jr)return o.rar[fV]or(l.name and t(l.name)==fV and l.rar)or"?"end local function fW()
local b_={}for js,jt in pairs(e.Targets)do if jt then b_[#b_+1]=C(js)end end table.sort(b_)
return b_ end local F={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function fX()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function ca(fY)if type(makefolder)~="function"then return end local ju,jv=pcall(isfolder,fY)
if not(ju and jv)then pcall(makefolder,fY)end end local function dL(fZ)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local jw,jx=pcall(isfile,fZ)if not(jw and jx)then return nil end local jy,jz=pcall(readfile,fZ)
return jy and jz or nil end local function cb(jA,jB)if type(writefile)~="function"then return false end
return(pcall(writefile,jA,jB))end local function f0(jC)local bc={}if type(listfiles)~="function"then return bc end
local jD,f1=pcall(listfiles,jC)if not jD or type(f1)~="table"then return bc end for m4,jE in ipairs(f1)do bc[#bc+1]=tostring(jE)end
return bc end local function dM()local cc={}for m5,jF in ipairs(f0(F.cfg))do local f2=jF:match("([^/\\]+)%.txt$")
if f2 then cc[#cc+1]=f2 end end table.sort(cc)return cc end local function jG()local O={"V|1"}
O[#O+1]="N|Every|"..tostring(e.Every)for m6,f3 in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart"})do
O[#O+1]="B|"..f3 .."|"..(e[f3]and"1"or"0")end if a.winPos then O[#O+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then O[#O+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end local cd={}for jH,jI in pairs(e.Targets)do if jI then cd[#cd+1]=jH end end
table.sort(cd)for m7,jJ in ipairs(cd)do O[#O+1]="T|"..jJ end return table.concat(O,"\n")
end local function jK(dN)if type(dN)~="string"or dN==""then return false end local f4,f5={},false
for jL in dN:gmatch("[^\n]+")do local bd,aF,ce=jL:match("^(%a)|([^|]*)|?(.*)$")if bd=="N"and aF=="Every"then
local dO=tonumber(ce)if dO and dO>=1 then e.Every=math.floor(dO)end elseif bd=="B"then if e[aF]~=nil then e[aF]=(ce=="1")end
elseif bd=="W"then a.winPos={tonumber(aF)or 10,tonumber(ce)or 44}elseif bd=="G"then a.togPos={tonumber(aF)or 10,tonumber(ce)or 300}
elseif bd=="T"and aF~=""then f4[aF]=true f5=true end end if f5 then e.Targets=f4 end return true
end local function dP(aP)if not fX()then return false,"this executor cannot write files"end
aP=(aP or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if aP==""then return false,"give the config a name"end
ca(F.dir)ca(F.cfg)if not cb(F.cfg.."/"..aP..".txt",jG())then return false,"could not write the file"end
a.config=aP return true,aP end local function f6(cf)local f7=dL(F.cfg.."/"..cf..".txt")
if not f7 then return false,"no config called "..tostring(cf)end if not jK(f7)then return false,"that config looks empty"end
a.config=cf return true,cf end local function f8(dQ)if dQ then ca(F.dir)cb(F.auto,dQ)elseif type(delfile)=="function"then
pcall(delfile,F.auto)else cb(F.auto,"")end a.autoload=dQ end local function dR()if a.selfPath then return a.selfPath end
local cg for m8,jM in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",F.dir})do for m9,f9 in ipairs(f0(jM))do
local dS=f9:lower()if dS:sub(-4)==".lua"and(dS:find("sab_farm",1,true)or dS:find("sab farm",1,true))then
cg=cg or f9 end end end a.selfPath=cg return cg end F.stub=[[
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
local function jN()if not fX()then return false,"this executor cannot write files"end ca("autoexec")
if not cb(F.exec,F.stub)then return false,"could not write to the autoexec folder"end local f_=dR()
return true,f_ and("it will load "..f_)or"now save this script in Delta so the loader can find it"
end local ci=(function()local jO,jP=pcall(function()return game:GetService("TeleportService")end)return jO and jP or nil end)()
local function ga()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local jQ=queueonteleport or queue_on_teleport local gb=dR()if not gb then return false end
return(pcall(jQ,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(gb)))
end local function cj(jR)if a.rejoining then return end a.rejoining=true f("REJOIN ("..jR..")")
pcall(du)if a.autoload then pcall(dP,a.autoload)end local jS=ga()f(jS and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for m_=1,30 do if not ci then break end pcall(function()ci:Teleport(game.PlaceId,u)end)
task.wait(10)end end)end local function jT()local jU,gc=pcall(function()return game:GetService("GuiService")end)
if jU and gc then pcall(function()M(gc.ErrorMessageChanged:Connect(function()if e.Rejoin then cj("roblox error message")end
end))end)end pcall(function()local gd=game:GetService("CoreGui")local ge=gd and gd:WaitForChild("RobloxPromptGui",15)
local gf=ge and ge:WaitForChild("promptOverlay",15)if gf then M(gf.ChildAdded:Connect(function(jV)
if e.Rejoin and tostring(jV.Name):lower():find("errorprompt",1,true)then cj("disconnect prompt")end
end))end end)pcall(function()M(u.OnTeleport:Connect(function(jW)if tostring(jW):find("Started")then ga()end
end))end)if ci then pcall(function()M(ci.TeleportInitFailed:Connect(function()a.rejoining=false
if e.Rejoin then task.delay(5,function()cj("teleport retry")end)end end))end)end end local function gg(jX)
local gh=a.plot and a.plot:FindFirstChild(jX)if not gh then return nil,false end for na,dT in ipairs(gh:GetChildren())do
if dT:IsA("Model")or dT:IsA("BasePart")then return dT,true end end return nil,true end local function be()
local am=gg("RolledSquishy")if not am then return nil end return{model=am,name=am.Name,pretty=ba(am,"NameText")or C(t(am.Name)),
rar=ba(am,"RarityText")or jq(am.Name),price=ba(am,"PriceText")}end local function gi(dU)
return type(dU)=="string"and(o.rar[t(dU)]~=nil or iM(dU))end local function v()local dV=gg("SquishyEquipped")
if dV then a.carrySrc="model"return dV.Name,dV end local gj=u.Character if gj then for nb,bf in ipairs(gj:GetDescendants())do
if(bf:IsA("Model")or bf:IsA("Tool"))and gi(bf.Name)then a.carrySrc="character"return bf.Name,bf
end end end local ck=u:GetAttribute("SquishyEquipped")if type(ck)=="string"and ck~=""and gi(ck)and g()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return ck,nil end a.carrySrc=nil end local function nc()local nd,jY=v()return jY end
local function gk()local gl=be()local dW=gl and iO(gl.price)local dX=ac()if dW and dX and dX<dW*0.5 then return dX,dW end
end local function aQ(jZ)aA[#aA+1]=os.date("%H:%M:%S").." "..jZ if#aA>40 then table.remove(aA,1)end
end local function j0(aG,cl)if type(aG)~="string"then return end aQ(("Roll(%s,%s)"):format(aG,tostring(cl)))
if aG:lower():find("crate",1,true)then c.rolled,c.rolledAt=aG,g()return end l.seq=l.seq+1
l.name,l.at=aG,g()l.rar=type(cl)=="string"and cl or nil a.rolls=a.rolls+1 if aa(aG)then f(("ROLL %s [%s] = TARGET"):format(aG,tostring(cl)))end
end local function j1(aH)if type(aH)~="table"then return end local cm=aH.butter or aH.itemName
if type(cm)~="string"then return end a.gifts=a.gifts+1 l.gift,l.giftAt=cm,g()if type(aH.giftId)=="string"then
local gm=bV:FindFirstChild("Remotes")local gn=gm and gm:FindFirstChild("GiftThanks")if gn then pcall(function()gn:FireServer(aH.giftId)end)end
end aQ("Gift("..cm.." from "..tostring(aH.fromName)..")")f(("GIFT from %s: %s - it will not be waxed"):format(tostring(aH.fromName),cm))
end local function j2()local go=bV:WaitForChild("Remotes",30)if not a.alive then return end
if not go then f("Remotes folder missing - no roll events")return end local j6={SquishyRollAnimation=j0,
InitSquishy=function(gp)l.init,l.initAt=tostring(gp),g()aQ("Init("..tostring(gp)..")")end,
CrateUpdate=function(bh,gq)pcall(ja,bh)if type(bh)=="table"then local j3=gq==true or(c.rolled~=nil and g()-c.rolledAt<15)or c.waiting
if not j3 then return end local j4=not c.waiting local j5=c.on c.waiting,c.data,c.at=true,bh,g()
c.on=(gq==true)c.title=tostring(bh.title or bh.name or"crate")if c.on and not j5 then c.openedAt,c.byYou=g(),not c.ours
if c.onShow then task.spawn(c.onShow)end end if c.on then aQ("CrateWindow open("..c.title..")")
elseif j4 then aQ("Crate waiting("..c.title..")")f(c.title.." is waiting on your stand")
end else if c.waiting then aQ("Crate gone")end c.on,c.waiting,c.data,c.prompt=false,false,nil,nil
c.summonFails,c.ours,c.byYou=0,false,false if c.onGone then task.spawn(c.onGone)end end
end,GiftReceived=j1,}for cn,j7 in pairs(j6)do local dY=go:FindFirstChild(cn)if dY and dY:IsA("RemoteEvent")then M(dY.OnClientEvent:Connect(j7))
elseif cn~="CrateUpdate"and cn~="GiftReceived"then f("remote "..cn.." missing")end end end
local function dZ()local aI=be()if aI then if aa(aI.name)then return{state="match",shown=aI.pretty,src="pad",info=aI}
end return{state="skip",info=aI,level="idle",text=("on pad: %s [%s] - not ticked"):format(aI.pretty,tostring(aI.rar))}
end if l.name and(g()-l.at)<4 then if aa(l.name)then return{state="match",shown=C(t(l.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(C(t(l.name)),tostring(l.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gr(j8,j9,j_,ka)
local co=RaycastParams.new()co.FilterType=Enum.RaycastFilterType.Exclude local d0={u.Character}
for ne,kb in ipairs(ka or{})do d0[#d0+1]=kb end co.FilterDescendantsInstances=d0 pcall(function()co.RespectCanCollide=true end)
local gs=bW:Raycast(Vector3 .new(j8,j9+4,j_),Vector3 .new(0,-30,0),co)return gs and gs.Position or nil
end local function d1(gt)local gu=gt:FindFirstChildOfClass("Humanoid")return((gu and gu.HipHeight)or 2)+gt.HumanoidRootPart.Size.Y/2+0.2
end local function d2(kc,kd)local gv=kc:FindFirstChildOfClass("Humanoid")local ke=g()while g()-ke<kd do
if gv and gv.FloorMaterial~=Enum.Material.Air then return true end aB(0.05)end return false
end local function cp(kf,d3,d4)local gw=kf.HumanoidRootPart gw.AssemblyLinearVelocity=Vector3 .new(0,0,0)
gw.CFrame=d4 and CFrame.new(d3,Vector3 .new(d4 .X,d3 .Y,d4 .Z))or CFrame.new(d3)end local function cq(ad,gx)
local aJ=aC()if not aJ or not ad then return false end local an=ad.Position local cr=math.clamp(math.max(ad.Size.X,ad.Size.Z)/2+2.2,3,7)
local gy=(gx and gx.MaxActivationDistance)or 10 if cr>gy-2 then cr=math.max(2.5,gy-2)end
local bi={}local function aK(bj)bj=Vector3 .new(bj.X,0,bj.Z)if bj.Magnitude>0.05 then bi[#bi+1]=bj.Unit end
end local gz=iV()if gz then aK(gz-an)end aK(ad.CFrame.LookVector)aK(-ad.CFrame.LookVector)
aK(ad.CFrame.RightVector)aK(-ad.CFrame.RightVector)aK(aJ.HumanoidRootPart.Position-an)if#bi==0 then aK(Vector3 .new(0,0,1))end
local kg,cs=d1(aJ),false for nf,kh in ipairs(bi)do local ct=an+kh*cr local d5=gr(ct.X,an.Y,ct.Z,{ad})
if d5 and math.abs(d5 .Y-an.Y)<14 then cp(aJ,Vector3 .new(ct.X,d5 .Y+kg,ct.Z),an)if d2(aJ,0.7)then cs=true break end
end end if not cs then cp(aJ,an+bi[1]*cr+Vector3 .new(0,3,0),an)cs=d2(aJ,1)end aB(0.12)
return cs end local function ki(bk)if not bk.Parent or not bk.Enabled then return false end
pcall(function()bk:InputHoldBegin()end)aB(math.max(bk.HoldDuration,0)+0.08)pcall(function()bk:InputHoldEnd()end)
return true end local function ao(gA,kj)local kk=g()while g()-kk<kj do if gA()then return true end
aB(0.05)end return gA()end local function cu(aR,kl,gB,km)local kn=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for ko,d6 in ipairs(kn)do if ko==2 and(km or not(aR.Parent and aR.Enabled and(not gB or gB())))then break end
local d7 if d6=="hold"then d7=ki(aR)else d7=type(fireproximityprompt)=="function"and aR.Parent~=nil and aR.Enabled and pcall(fireproximityprompt,aR)end
if d7 and ao(kl,1.2)then a.zapFirst=(d6=="zap")return true,d6 end end return false end local function gC(d8)
local ap=ds()if not ap or not ap.Enabled then f("buy: nothing on the pad")return false end
local gD=a6(ap)if not gD then f("buy: pad part missing")return false end a.lastBuyAt=g()
local kp,gE=l.seq,ac()cq(gD,ap)if not ap.Enabled then f("buy aborted: pad emptied")return false end
local aS=dZ()if not d8 and aS.state~="match"then f("buy aborted: "..(aS.text or"pad changed"))
a.matchSince=nil return false end local d9=aS.info and aS.info.name or(aS.state=="match"and l.name)or nil
local function kq()return ap.Enabled and v()==nil and(d8 or dZ().state=="match")end local kr,ks=cu(ap,function()
return v()~=nil or((not ap.Enabled)and(d8 or l.seq==kp))end,kq,gk()~=nil)if kr then ao(function()return v()~=nil end,0.8)
local bl=v()local gF=ac()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
l.name,l.rar,l.at=nil,nil,g()f(("BOUGHT %s%s via %s"):format(bl and C(t(bl))or(aS.shown or"?"),(gE and gF)and(" for $"..ab(gE-gF))or"",ks))
if bl and d9 and t(bl)~=t(d9)then f(("note: picked up %s, not %s"):format(bl,d9))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=g()+math.min(8*2^(a.cashFails-1),60)local gG=be()
f(("BUY REFUSED: cash short? have $%s, price %s"):format(ab(ac()),(gG and gG.price)or"?"))
return false end local function gH()local cv=v()if not cv then a.holding=false f("place: hands are empty")
return false end if not aa(cv)then f(("REFUSED TO WAX %s - it is not ticked"):format(C(t(cv))))
return false end for ng=1,e.PlaceTries do local aq=iY()if not aq then f("place: no free station")break end
local gI=a6(aq)if gI then cq(gI,aq)local gJ=v()if not gJ then a.holding=false f("place: hands emptied on the way")return false end
if not aa(gJ)then f("place: what I carry changed, not waxing it")return false end if aq.Enabled then
local kt,ku=cu(aq,function()return not aq.Enabled end,function()return aq.Enabled end)if kt then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=g()+2.5,0 l.name,l.rar,l.at=nil,nil,g()
f(("WAXED %s #%d at %s via %s"):format(C(t(cv)),a.placed,aq.Parent.Parent.Name,ku))return true
end end end aB(0.25)end a.placeFails=a.placeFails+1 if v()==nil then a.holding=false end
f("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,g()
a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(v()))f(a.capMsg)end return false end local function gK(gL)return type(gL)=="string"and gL:lower():find("crate",1,true)~=nil
end local function kv(cw)if type(cw)~="table"then return false end local d_=cw.contents
if type(d_)=="table"and#d_>0 then for nh,ea in ipairs(d_)do if type(ea)=="table"and aa(ea.butter)then return true,C(t(ea.butter))end
end return false end local gM=cw.rarity and o.members[cw.rarity]if gM then for ni,gN in ipairs(gM)do if e.Targets[gN]then return true,C(gN)end end
end return false end local kw={SABFarmGui=1,SABToggle=1,SABError=1}local function bm(kx,ky)
local ae=kx while ae do if kw[ae.Name]then return false end if ae:IsA("ScreenGui")then local kz,kA=pcall(function()return ae.Enabled end)
return(not kz)or kA~=false end local kB=(not ky)and ae==c.win and c.hidByUs if ae:IsA("GuiObject")and not ae.Visible and not kB then return false end
ae=ae.Parent end return false end local function bn(cx)local aT=""pcall(function()if cx:IsA("TextButton")then aT=cx.Text end end)
if not aT:find("%a")then for nj,cy in ipairs(cx:GetDescendants())do if(cy:IsA("TextLabel")or cy:IsA("TextButton"))and cy.Text:find("%a")then aT=cy.Text break end
end end if not aT:find("%a")then aT=cx.Name end return(aT:lower():gsub("[^%a]",""))end local function kC()
local bo,bp local gO=u:FindFirstChildOfClass("PlayerGui")if not gO then return nil,nil end
for nk,bq in ipairs(gO:GetDescendants())do if bq:IsA("GuiButton")and bm(bq)then local eb=bn(bq)
if eb:sub(1,4)=="open"and not eb:find("shop",1,true)then bo=bo or bq end if eb:sub(1,7)=="discard"then bp=bp or bq end
end end if bo and bp then return bo,bp end if c.on then return bo,bp end return nil,nil
end local cz=(function()local kD,kE=pcall(function()return game:GetService("VirtualInputManager")end)return kD and kE or nil end)()
local function gP(ar,ec)local ed={}local function gQ(kF)ed[#ed+1]=kF end if a.tapWay then gQ(a.tapWay)end
for nl,gR in ipairs({"conn","signal","touch"})do if gR~=a.tapWay then gQ(gR)end end local function gS(kG)
local kH,ee=pcall(getconnections,kG)if not(kH and type(ee)=="table"and#ee>0)then return false end
local gT=false for nm,kI in ipairs(ee)do if pcall(function()kI:Fire()end)then gT=true end
end return gT end for nn,af in ipairs(ed)do local br=false if af=="conn"and type(getconnections)=="function"then
if gS(ar.MouseButton1Click)then br=true if ao(ec,1.5)then a.tapWay=af return true,af end
end br=gS(ar.Activated)elseif af=="signal"and type(firesignal)=="function"then if pcall(firesignal,ar.MouseButton1Click)then
if ao(ec,1.5)then a.tapWay=af return true,af end end br=pcall(firesignal,ar.Activated)elseif af=="touch"and cz then
if c.win and c.hidByUs and ar:IsDescendantOf(c.win)then c.win.Visible,c.hidByUs=true,false
task.wait(0.1)end br=pcall(function()local gU,gV=ar.AbsolutePosition,ar.AbsoluteSize local gW=0
local gX=ar:FindFirstAncestorWhichIsA("ScreenGui")local kJ,kK=pcall(function()return gX and gX.IgnoreGuiInset end)
if not(kJ and kK)then pcall(function()gW=game:GetService("GuiService"):GetGuiInset().Y end)
end local gY,gZ=gU.X+gV.X/2,gU.Y+gV.Y/2+gW cz:SendMouseButtonEvent(gY,gZ,0,true,game,1)
task.wait(0.06)cz:SendMouseButtonEvent(gY,gZ,0,false,game,1)end)end if br and ao(ec,1.5)then
a.tapWay=af return true,af end end return false end local kL={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function ef(g0)local bs=g0 .Parent while bs and bs~=a.plot do if kL[bs.Name]then return false end
bs=bs.Parent end local eg=(g0 .ActionText or""):lower()if eg:find("roll",1,true)or eg:find("place",1,true)or eg:find("sell",1,true)then return false end
return true end local function g1()if c.prompt and c.prompt.Parent and c.prompt.Enabled then return c.prompt end
if not a.plot then return nil end local g2=a.plot:FindFirstChild("CrateStand")local bt if g2 then
for no,cA in ipairs(g2:GetDescendants())do if cA:IsA("ProximityPrompt")and cA.Enabled and ef(cA)then bt=cA break end
end end if not bt then for np,as in ipairs(a.plot:GetDescendants())do if as:IsA("ProximityPrompt")and as.Enabled and ef(as)then
local g3=as:FindFirstAncestorWhichIsA("Model")local kM=((as.ActionText or"").." "..(as.ObjectText or"").." "..as.Name.." "..(g3 and g3 .Name or"")):lower()
if kM:find("crate",1,true)then bt=as break end end end end c.prompt=bt return bt end local function g4()
if c.on then return true end local bu=g1()if not bu then c.summonFails=c.summonFails+1 c.lastFail=g()
f("crate: cannot find where to open "..c.title.." - open it once by hand, then DUMP")return false
end local g5=a6(bu)if g5 then cq(g5,bu)end c.ours=true cu(bu,function()return c.on end)
if ao(function()return c.on end,3)then c.summonFails=0 return true end c.ours=false c.summonFails=c.summonFails+1
c.lastFail=g()f("crate: pressed "..N(bu).." but no window came up")return false end do local function kN(g6)
local aU=g6 .Parent while aU and aU:IsA("GuiObject")do local g7,g8=false,false for nq,bv in ipairs(aU:GetDescendants())do
if bv~=g6 and bv:IsA("GuiButton")and bn(bv):sub(1,7)=="discard"then g7=true end if bv:IsA("TextLabel")then
local eh=bv.Text:lower()if eh:find("crate",1,true)or eh:find("can contain",1,true)or eh:find("cost",1,true)then g8=true end
end if g7 and g8 then return aU end end aU=aU.Parent end end function c.findWin()if c.win and c.win.Parent then return c.win end
local g9=u:FindFirstChildOfClass("PlayerGui")if not g9 then return nil end for nr,cB in ipairs(g9:GetDescendants())do
if cB:IsA("GuiButton")and not cB:FindFirstAncestor("SABFarmGui")and bn(cB):sub(1,4)=="open"then
local ei=kN(cB)if ei then c.win=ei return ei end end end end local function kO(kP)for ns,cC in ipairs(kP:GetDescendants())do
if cC:IsA("GuiButton")then local g_,ej=bn(cC),cC.Name:lower()if g_=="x"or g_=="close"or ej=="x"or ej:find("close",1,true)or ej:find("exit",1,true)then return cC end
end end end local function kQ()return a.tapWay~="touch"and(type(getconnections)=="function"or type(firesignal)=="function")
end c.onShow=function()if c.ours then if not kQ()then return end local kR=g()while a.alive and c.on and c.ours and g()-kR<6 do
local ek=c.findWin()if ek and ek.Visible then ek.Visible=false c.hidByUs=true end task.wait(0.03)
end else local ha=c.findWin()if ha and c.hidByUs then ha.Visible=true c.hidByUs=false end
end end c.onGone=function()task.wait(1)if c.on or c.waiting then return end local aV=c.findWin()
if not aV or not bm(aV,true)then return end local hb=kO(aV)if hb then gP(hb,function()return not bm(aV,true)end)end
if bm(aV,true)and not(c.on or c.waiting)then aV.Visible,c.hidByUs=false,true f("closed a crate window that was left on screen")
end end end local function el(cD)if not g4()then return false end local em=c.title local kS,kT=kC()
local hc=cD and kS or kT if not hc then c.lastFail=g()a.crateFails=a.crateFails+1 f(("crate: no %s button found in %s"):format(cD and"Open"or"Discard",em))
return false end local kU=v()local kV,nt=gP(hc,function()return(not c.on)or(v()~=nil and v()~=kU)
end)if not kV then c.lastFail=g()a.crateFails=a.crateFails+1 f("crate: could not press "..(cD and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if cD then a.crates=a.crates+1 ao(function()return v()~=nil end,1.5)
local hd=v()f(("OPENED %s -> %s"):format(em,hd and C(t(hd))or"?"))else f("discarded "..em.." (nothing ticked in it)")
end return true end local kW={"sell","trash","discard","dispose","bin"}local function en(cE)
if type(cE)~="string"then return false end cE=cE:lower()for nu,kX in ipairs(kW)do if cE:find(kX,1,true)then return true end end
return false end local function kY()local he=bV:FindFirstChild("Remotes")local eo=he and he:FindFirstChild("SellSquishy")
if not(eo and eo:IsA("RemoteEvent"))then return false end if not pcall(function()eo:FireServer()end)then return false end
return ao(function()return v()==nil end,1.5)end local function kZ()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if g()-a.sellSearchAt<20 then return nil end a.sellSearchAt=g()local hf=aC()local hg=hf and hf.HumanoidRootPart.Position
local bw,hh for nv,aW in ipairs((a.plot or bW):GetDescendants())do if aW:IsA("ProximityPrompt")and(en(aW.ActionText)or en(aW.ObjectText)or en(aW.Name))then
local hi=fu(aW)local ep=(hi and hg)and(hi-hg).Magnitude or 1e9 if ep<=400 and(not bw or ep<hh)then bw,hh=aW,ep end
end end a.sellSpot=bw a.noSellSpot=(bw==nil)return bw end local function hj()local eq=v()
if not eq then a.holding=false return false end if aa(eq)then return false end local er=C(t(eq))
if kY()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=g()+2.5,0
f("SOLD "..er)return true end local aX=kZ()if aX then local hk=a6(aX)if hk then cq(hk,aX)
local hl=v()if hl and not aa(hl)then local k0,k1=cu(aX,function()return v()==nil end,function()return aX.Enabled end)
if k0 then a.sold,a.holding,a.sellFails=a.sold+1,false,0 f(("SOLD %s at %s via %s"):format(er,N(aX),k1))
return true end end end end a.sellFails=a.sellFails+1 f("could not sell "..er.." ("..a.sellFails..")")
return false end local k2={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function k3(aY)local cF=N(aY):lower()for nw,k4 in ipairs(k2)do if cF:find(k4,1,true)then return 0 end end
local W,z=aY.Name:lower(),0 local function P(k5,k6)return k5:find(k6,1,true)~=nil end if P(W,"collect")then z=z+60 end
if P(W,"cash")or P(W,"money")then z=z+45 end if P(W,"income")or P(W,"claim")then z=z+35 end
if P(W,"coin")or P(W,"earn")or P(W,"green")then z=z+20 end if W=="pad"or W=="touch"then z=z+25 end
if z==0 and(P(cF,"collect")or P(cF,"cash")or P(cF,"money"))then z=25 end if z==0 then return 0 end
local bx=aY.Color if bx.G>0.5 and bx.G>bx.R*1.4 and bx.G>bx.B*1.4 then z=z+15 end if math.min(aY.Size.X,aY.Size.Y,aY.Size.Z)<2 then z=z+5 end
return z end local function k7()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or g()-a.padSearchAt<20 then return nil end a.padSearchAt=g()local cG,by,es={},nil,29
for nx,cH in ipairs(a.plot:GetDescendants())do if cH:IsA("BasePart")then local cI=k3(cH)
if cI>0 then cG[#cG+1]={s=cI,p=cH}if cI>es then by,es=cH,cI end end end end table.sort(cG,function(k8,k9)return k8 .s>k9 .s end)
a.padCands,a.padPart=cG,by if by then f("collect pad: "..N(by).." (score "..es..")")end
return by end local et="SAB_pad_v1.txt"local function k_(la)if type(writefile)=="function"then pcall(writefile,et,table.concat({la:GetComponents()},","))end
end local function lb()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local lc,hm=pcall(function()if isfile(et)then return readfile(et)end end)if not lc or type(hm)~="string"then return nil end
local cJ={}for ld in hm:gmatch("[^,]+")do cJ[#cJ+1]=tonumber(ld)end if#cJ==12 then return CFrame.new(unpack(cJ))end
end local function le(eu,cK,lf)local lg=d1(eu)local ev=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local Q=(ev and ev:IsA("BasePart"))and(ev.Position-cK)or Vector3 .new(1,0,0)Q=Vector3 .new(Q.X,0,Q.Z)
if Q.Magnitude<0.05 then Q=Vector3 .new(1,0,0)end Q=Q.Unit for lh=0,7 do local cL=lh*math.pi/4
local li=Vector3 .new(Q.X*math.cos(cL)-Q.Z*math.sin(cL),0,Q.X*math.sin(cL)+Q.Z*math.cos(cL))
local cM=cK+li*(lf+5)local ew=gr(cM.X,cK.Y,cM.Z)if ew and math.abs(ew.Y-cK.Y)<8 then cp(eu,Vector3 .new(cM.X,ew.Y+lg,cM.Z))
if d2(eu,0.7)then return true end end end return false end local function lj()a.lastCollect=g()
local bz=aC()if not bz then return end local hn,lk=bz.HumanoidRootPart,d1(bz)local bA,ho,bB,ex=nil,4,nil,"?"
local ey=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and ey and ey:IsA("BasePart")then
bA,ex=(ey.CFrame*a.manualPad).Position,"manual pad"else local ag=k7()if ag then bA=Vector3 .new(ag.Position.X,ag.Position.Y+ag.Size.Y/2+lk,ag.Position.Z)
ho,bB,ex=math.max(ag.Size.X,ag.Size.Z)/2,ag,ag.Name end end if not bA then f("COLLECT: pad not found - stand on it and tap SET PAD")return end
local ez=ac()cp(bz,bA)if bB and type(firetouchinterest)=="function"then pcall(firetouchinterest,hn,bB,0)end
aB(e.PadDwell)if bB and type(firetouchinterest)=="function"then pcall(firetouchinterest,hn,bB,1)end
aB(0.5)a.collected=a.collected+1 local eA=ac()f(("COLLECTED (%s) %s"):format(ex,(ez and eA and eA>ez)and("+$"..ab(eA-ez))or"no cash change seen"))
le(bz,bA,ho)end local bC local function hp()if a.capHit then if e.AutoStart and g()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 f("trying again after being stopped for 5 minutes")bC(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not aC()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aD(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local eB,hq=dl()local cN=v()if cN then local bD=C(t(cN))if not aa(cN)then local eC=(l.gift and t(l.gift)==t(cN)and g()-l.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bD,eC),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bD,eC),"bad"
end return"sell",("selling %s (%s)"):format(bD,eC),"warn"end if eB<1 then return nil,("holding %s - 0 free stations"):format(bD),"wait"end
return"place",("waxing %s (%d free)"):format(bD,eB),"ok"end a.holding=false if e.Crates and not c.waiting and g()-(c.scanAt or 0)>1 then
c.scanAt=g()local hr=a.plot:FindFirstChild("CrateStand")if hr then for ny,bE in ipairs(hr:GetChildren())do
if gK(bE.Name)then local hs=false for nz,ht in ipairs(bE:GetDescendants())do if ht:IsA("ProximityPrompt")and ht.Enabled then hs=true break end
end if hs then local ll=c9(bE.Name):gsub("crate$","")local eD for hu in pairs(o.members)do if c9(hu)==ll then eD=hu end end
c.waiting,c.at=true,g()c.title=(eD or bE.Name).." Crate"c.data={name=bE.Name,rarity=eD,title=c.title}
f(c.title.." found sitting on your stand")break end end end end end if e.Crates and(c.on or c.waiting)then
local K=c.title if g()<(c.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open or Discard yourself"):format(K),"bad"
end local eE,hv=kv(c.data)if c.on then if a.crateFails>=3 then c.ignoreUntil,a.crateFails=g()+120,0
f("could not press the "..K.." buttons 3 times - leaving it to you for 2 min")return nil,("%s window open - press Open or Discard yourself"):format(K),"bad"
end if g()-c.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(K),"bad"
end if c.byYou and g()-c.openedAt<60 then return nil,("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
K,math.ceil(60-(g()-c.openedAt))),"idle"end if eE then return"crate",("opening %s for %s"):format(K,hv),"ok"end
if e.SellJunk then return"nocrate",("discarding %s - nothing ticked inside"):format(K),"warn"end
return nil,("%s open - nothing ticked inside it"):format(K),"idle"end if not eE and not e.SellJunk then
return nil,("%s waiting - nothing ticked inside, left alone"):format(K),"idle"end if c.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand then DUMP"):format(K),"bad"
end if g()-c.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(K),"wait"
end return"cratewin",("%s waiting - going to open it%s"):format(K,eE and(" for "..hv)or" to discard"),"ok"
end if c.rolled and not c.waiting and g()-c.rolledAt<6 then return nil,c.rolled.." rolled - waiting for it to land","wait"
end if eB<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(hq,hq),"wait"
end local eF=ds()if not eF then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end
local bF=be()if bF and gK(bF.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(bF.name),"idle"end
if g()-c.lastFail<8 then return nil,("%s on the pad - could not open it"):format(bF.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(bF.name),"ok"end local au=dZ()
if au.state~="match"then a.matchSince=nil if au.state=="skip"and not eF.Enabled then return nil,au.text.." (sold out)","idle"end
return nil,au.text,au.level end if not eF.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local bG=g()if bG<a.noCashUntil then local hw,lm=gk()if hw then return nil,("cash short: have $%s, price ~$%s"):format(ab(hw),ab(lm)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ab(ac()),math.ceil(a.noCashUntil-bG)),"bad"
end if bG-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or bG
local hx=bG-a.matchSince if hx<e.Confirm then return nil,("confirming %s (%.2fs)"):format(au.shown,hx),"ok"end
return"buy",("buying %s via %s"):format(au.shown,au.src),"ok"end local function T(ln,lo,...)
if a.busy then return end a.busy,a.busyText=true,ln local lp,hy=pcall(lo,...)a.busy,a.busyText=false,""
if not lp and hy~=c7 then f("ERR "..tostring(hy))end end local function lq()local aZ,lr,ls=hp()
a.reason,a.level=lr,ls if aZ=="place"then T("waxing...",gH)elseif aZ=="crate"then T("opening crate...",el,true)
elseif aZ=="cratewin"then T("opening the crate window...",g4)elseif aZ=="nocrate"then T("discarding crate...",el,false)
elseif aZ=="sell"then T("selling...",hj)elseif aZ=="buy"then T("buying...",gC,false)elseif e.Collect and not a.matchSince and g()-a.lastCollect>=e.Every then
T("collecting money...",lj)end end function bC(cO,lt)if cO==a.running then return end a.running=cO
if not lt then e.AutoStart=cO end if cO then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
c.lastFail,c.summonFails,c.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=g()
a.plot=aD()or a.plot f("START")else a.reason="stopped"f("STOP")end end local function hz()
local eG={}local function i(lu)eG[#eG+1]=tostring(lu)end i("=== SAB "..az.." DUMP "..os.date("%H:%M:%S").." ===")
i(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
i("reason: "..tostring(a.reason))i("targets: "..table.concat(fW(),", "))i(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
i("cash="..ab(ac()))local lv,hA=v()i("in hands: "..tostring(lv)..(hA and(" ("..hA.ClassName..")")or"")..
"  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-g())))
i("  attribute SquishyEquipped = "..tostring(u:GetAttribute("SquishyEquipped")))local hB=a.plot and a.plot:FindFirstChild("SquishyEquipped")
i("  plot.SquishyEquipped = "..(hB and(#hB:GetChildren().." children")or"missing"))local eH=u.Character
if eH then local eI={}for nA,bH in ipairs(eH:GetDescendants())do if(bH:IsA("Model")or bH:IsA("Tool"))and bH.Name~=eH.Name then eI[#eI+1]=bH.ClassName..":"..bH.Name end
end i("  on the character: "..(table.concat(eI,", "):sub(1,300)))end local cP=be()i("on pad: "..(cP and("%s [%s] %s"):format(cP.name,tostring(cP.rar),tostring(cP.price))or"nothing"))
i("sell spot: "..(a.sellSpot and N(a.sellSpot)or"none found"))i("--- CRATES ---")i(("waiting=%s windowOpen=%s title=%s rolled=%s (%ss ago) opened=%d tapWay=%s fails=%d/%d"):format(
tostring(c.waiting),tostring(c.on),c.title,tostring(c.rolled),c.rolledAt>0 and string.format("%.0f",g()-c.rolledAt)or"-",
a.crates,tostring(a.tapWay),a.crateFails,c.summonFails))local cQ=c.findWin()i(("crate window: %s visible=%s hiddenByMe=%s mine=%s yours=%s"):format(cQ and N(cQ)or"not found",
tostring(cQ and cQ.Visible),tostring(c.hidByUs),tostring(c.ours),tostring(c.byYou)))local cR=g1()
i("crate prompt: "..(cR and(N(cR).." ["..cR.ActionText.."|"..cR.ObjectText.."]")or"none found"))
local hC=a.plot and a.plot:FindFirstChild("CrateStand")if hC then local eJ=0 for nB,aL in ipairs(hC:GetDescendants())do
eJ=eJ+1 if eJ>30 then i("  ...")break end local hD=""if aL:IsA("ProximityPrompt")then hD=(" [%s|%s|on=%s|hold=%.2f]"):format(aL.ActionText,aL.ObjectText,tostring(aL.Enabled),aL.HoldDuration)end
i("  CrateStand/"..N(aL):gsub("^.-CrateStand%.","").." ("..aL.ClassName..")"..hD)end else
i("  no CrateStand in the plot")end i("enabled prompts in the plot:")if a.plot then for nC,a0 in ipairs(a.plot:GetDescendants())do
if a0:IsA("ProximityPrompt")and a0 .Enabled then i(("  %s [%s|%s] safe=%s"):format(N(a0),a0 .ActionText,a0 .ObjectText,tostring(ef(a0))))
end end end local hE=u:FindFirstChildOfClass("PlayerGui")if hE then i("buttons on screen that say open/discard:")
for nD,bI in ipairs(hE:GetDescendants())do if bI:IsA("GuiButton")and bm(bI)then local eK=bn(bI)
if eK:find("open",1,true)or eK:find("discard",1,true)then i(("  %s %s -> %q"):format(bI.ClassName,N(bI),eK))
end end end end i("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(cz~=nil))
i("--- CATALOG ("..o.n.." butters, worst rarity first) ---")for nE,cS in ipairs(o.rarOrder)do
local eL={}for nF,hF in ipairs(o.members[cS]or{})do eL[#eL+1]=(e.Targets[hF]and"*"or"")..C(hF)
end i(("  [%s]%s %s"):format(cS,y.price[cS]and(" crate $"..ab(y.price[cS]))or"",table.concat(eL,", ")))
end i("learned orders: ")for lw,lx in pairs(y.order)do i("  "..lw..": "..table.concat(lx,", "))end
i("--- PLOT ---")i("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for nG,eM in ipairs(a.plot:GetChildren())do
i(("  %s %s (%d)"):format(eM.ClassName,eM.Name,#eM:GetChildren()))end local ly,lz=dl()i(("stations free %d / %d"):format(ly,lz))
local eN=ds()i("BuyPrompt: "..(eN and("enabled="..tostring(eN.Enabled).." hold="..eN.HoldDuration)or"MISSING"))
end i("autostart="..tostring(e.AutoStart).." rejoin="..tostring(e.Rejoin))i(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))i("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#dM())i("--- COLLECT PAD ---")
i("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and N(a.padPart)or"none"))
i("--- ATTRIBUTES ---")for nH,hG in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
i(("  %s = %s"):format(hG,tostring(u:GetAttribute(hG))))end i("--- EVENTS ---")for lA=math.max(1,#aA-15),#aA do i("  "..aA[lA])end
i("--- LOG ---")for lB=math.max(1,#aj-25),#aj do i("  "..aj[lB])end return table.concat(eG,"\n")
end do local av=dL(F.auto)if type(av)=="string"then av=av:gsub("%s+$","")if av~=""then a.autoload=av
local lC=f6(av)f(lC and("loaded config "..av)or("config "..av.." could not be loaded"))
end end end local d={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local lD={ok=d.good,wait=d.warn,warn=d.warn,bad=d.bad,idle=d.dim}
local lE={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function k(lF,lG,lH)
local lI,eO=pcall(Instance.new,lF)if not lI then a.uiErrs=a.uiErrs+1 return nil end for lJ,lK in pairs(lG)do
if not pcall(function()eO[lJ]=lK end)then a.uiErrs=a.uiErrs+1 end end eO.Parent=lH return eO
end local function H(lL,lM)k("UICorner",{CornerRadius=UDim.new(0,lM or 6)},lL)end local b={}
local eP=u:FindFirstChildOfClass("PlayerGui")or u:WaitForChild("PlayerGui")local hH=eP:FindFirstChild("SABFarmGui")
if hH then hH:Destroy()end local eQ=k("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},eP)
local A={w=320,h=330,head=30,strip=38,tabs=26}b.root=k("Frame",{Name="Root",Size=UDim2 .new(0,A.w,0,A.h),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=d.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},eQ)
H(b.root,10)k("UIStroke",{Color=d.line,Thickness=1},b.root)local a1=UDim2 .new(1,0,1,0)
local function q(hI,hJ)return UDim2 .new(hI,0,0,0),UDim2 .new(hJ,(hI+hJ>0.99)and 0 or-4,1,0)end
local function m(lN,lO,lP,lQ,lR,lS)local hK=k("TextButton",{Text=lO,Position=lR,Size=lS,BackgroundColor3=lP,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=lQ,TextColor3=d.text,AutoButtonColor=true},lN)H(hK,6)
return hK end local function hL(lT,lU,lV,lW,lX)local eR=k("TextBox",{Text=lU,PlaceholderText=lV,Position=lW,Size=lX,BackgroundColor3=d.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=d.text,PlaceholderColor3=d.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},lT)H(eR,6)k("UIPadding",{PaddingLeft=UDim.new(0,8)},eR)
return eR end local cT=bW.CurrentCamera local function lY()local lZ,cU=pcall(function()return cT and cT.ViewportSize end)
if lZ and cU and cU.X>50 and cU.Y>50 then return cU end end local function aw(bJ)local eS=lY()
if not(eS and bJ and bJ.Parent)then return end local l0=pcall(function()local cV,hM=bJ.AbsolutePosition,bJ.AbsoluteSize
local eT=70 local hN=math.clamp(cV.X,eT-hM.X,eS.X-eT)local hO=math.clamp(cV.Y,0,eS.Y-math.min(hM.Y,eT))
if math.abs(hN-cV.X)>0.5 or math.abs(hO-cV.Y)>0.5 then bJ.Position=UDim2 .new(0,math.floor(hN),0,math.floor(hO))
end end)return l0 end local function cW(l1)local l2,eU=pcall(function()return l1 .AbsolutePosition end)
if l2 and eU then return{math.floor(eU.X),math.floor(eU.Y)}end end local cX={}local function hP(cY,hQ,hR)
M(cY.InputBegan:Connect(function(bK)if bK.UserInputType~=Enum.UserInputType.MouseButton1 and bK.UserInputType~=Enum.UserInputType.Touch then return end
cX[cY]={start=bK.Position,from=hQ.Position,moved=0,target=hQ}local eV eV=bK.Changed:Connect(function()
if bK.UserInputState==Enum.UserInputState.End then local hS=cX[cY]cX[cY]=nil if eV then eV:Disconnect()end
if hS and hR then hR(hS.moved)end end end)end))end M(iH.InputChanged:Connect(function(cZ)
if cZ.UserInputType~=Enum.UserInputType.MouseMovement and cZ.UserInputType~=Enum.UserInputType.Touch then return end
for nI,ah in pairs(cX)do local eW=ah.target if eW and eW.Parent then local hT,hU=cZ.Position.X-ah.start.X,cZ.Position.Y-ah.start.Y
ah.moved=math.max(ah.moved,math.abs(hT)+math.abs(hU))eW.Position=UDim2 .new(ah.from.X.Scale,ah.from.X.Offset+hT,ah.from.Y.Scale,ah.from.Y.Offset+hU)
end end end))local function x(l3,l4,l5,l6,l7,l8,l9)return k("TextLabel",{Text=l4,Position=l8 or UDim2 .new(0,0,0,0),Size=l9 or a1,BackgroundTransparency=1,
Font=l7 and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=l5,TextColor3=l6,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},l3)
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
local function eX()local eY=k("ScrollingFrame",{Position=UDim2 .new(0,0,0,A.head+A.strip+A.tabs),Size=UDim2 .new(1,0,1,-(A.head+A.strip+A.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=d.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)k("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},eY)
k("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},eY)
return eY end b.farm,b.but,b.set=eX(),eX(),eX()b.but.Visible,b.set.Visible=false,false local c0,bL,j=0,12,nil
local function I(hV,l_)c0,bL=c0+1,bL+hV+6 return k("Frame",{Size=UDim2 .new(1,0,0,hV),BackgroundTransparency=1,LayoutOrder=c0},l_ or b.farm)
end local function bM(ma)x(I(14),ma,10,d.dim,true)end j=I(34)b.startB=m(j,"START",d.good,14,q(0,0.68))
b.killB=m(j,"KILL",d.bad,14,q(0.68,0.32))local mb=I(42)local function bN(hW,mc,eZ)local e0=k("Frame",{Position=UDim2 .new((hW-1)/eZ,0,0,0),Size=UDim2 .new(1/eZ,hW<eZ and-4 or 0,1,0),
BackgroundColor3=d.panel,BorderSizePixel=0},mb)H(e0,6)local hX=x(e0,"0",15,d.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local md=x(e0,mc,9,d.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))hX.TextXAlignment,md.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return hX end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=bN(1,"BOUGHT",5),bN(2,"WAXED",5),bN(3,"SOLD",5),bN(4,"MONEY",5),bN(5,"FREE",5)
b.info=x(I(40),"",10,d.dim,false)b.tgt=x(I(26),"",10,d.good,false)bM("MONEY COLLECT")j=I(28)
b.secB=hL(j,tostring(e.Every),"60",q(0,0.2))x(j,"sec",11,d.dim,false,q(0.21,0.09))b.secSet=m(j,"SET",d.accent,12,q(0.3,0.2))
b.colT=m(j,"COLLECT: ON",d.accent,11,q(0.5,0.5))j=I(26)b.padB=m(j,"SET PAD (stand on it)",d.panel2,10,q(0,0.55))
b.padL=x(j,"",10,d.dim,false,q(0.56,0.44))bM("BUTTERS YOU DID NOT TICK, AND CRATES")j=I(28)
b.sellT=m(j,"SELL THEM: ON",d.accent,11,q(0,0.55))b.sellB=m(j,"SELL NOW",d.warn,11,q(0.55,0.45))
j=I(28)b.crateT=m(j,"OPEN CRATES: ON",d.accent,11,q(0,0.55))b.crateB=m(j,"OPEN NOW",d.warn,11,q(0.55,0.45))
bM("TOOLS")j=I(30)b.buyB=m(j,"BUY NOW",d.warn,11,q(0,0.28))b.plB=m(j,"WAX",d.good,11,q(0.28,0.24))
b.dumpB=m(j,"DUMP",d.accent,11,q(0.52,0.24))b.copyB=m(j,"COPY",d.panel2,11,q(0.76,0.24))
bM("LOG")b.log=k("TextLabel",{Size=a1,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=d.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},I(84))H(b.log,6)k("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},b.log)
bM("OUTPUT  (DUMP result)")b.out=k("TextBox",{Size=a1,BackgroundColor3=d.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},I(110))H(b.out,6)
b.farm.CanvasSize=UDim2 .new(0,0,0,bL)c0,bL=0,12 local function L(me)return I(me,b.set)end
local function c1(mf)x(L(14),mf,10,d.dim,true)end c1("SETTINGS FILE  (saved on your phone)")
j=L(28)b.cfgName=hL(j,"default","config name",q(0,0.5))b.cfgSave=m(j,"SAVE",d.good,11,q(0.5,0.25))
b.cfgLoad=m(j,"LOAD",d.accent,11,q(0.75,0.25))j=L(26)b.cfgPrev=m(j,"<",d.panel2,11,q(0,0.13))
b.cfgPick=m(j,"(none saved)",d.panel2,10,q(0.13,0.74))b.cfgNext=m(j,">",d.panel2,11,q(0.87,0.13))
j=L(26)b.cfgAuto=m(j,"LOAD IT ON LAUNCH: OFF",d.panel2,10,q(0,1))b.cfgMsg=x(L(26),"",10,d.dim,false)
c1("START BY ITSELF")j=L(26)b.autoB=m(j,"INSTALL F.exec",d.accent,10,q(0,1))b.autoMsg=x(L(30),"",10,d.dim,false)
j=L(28)b.startT=m(j,"START FARMING ON LOAD: ON",d.accent,10,q(0,1))x(L(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,d.dim,false)
c1("IF THE GAME DROPS ME")j=L(28)b.rejT=m(j,"AUTO REJOIN: ON",d.accent,11,q(0,0.55))b.rejB=m(j,"REJOIN NOW",d.warn,11,q(0.55,0.45))
b.rejMsg=x(L(30),"",10,d.dim,false)c1("THE ROUND SAB BUTTON")x(L(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,d.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,bL)local hY=k("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},eP)
b.tgRoot=k("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=d.accent,BorderSizePixel=0,Active=true},hY)H(b.tgRoot,26)k("UIStroke",{Color=d.line,Thickness=1},b.tgRoot)
b.tgBtn=k("TextButton",{Text="SAB",Size=a1,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=d.text,AutoButtonColor=false},b.tgRoot)b.tgDot=k("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=d.dim,
BorderSizePixel=0},b.tgRoot)H(b.tgDot,4)local ai={built=false,boxes={},at=0}local function hZ(h0,e1)
e.Targets[h0]=e1 or nil local e2=ai.boxes[h0]if e2 then e2 .Text=e1 and"X"or""e2 .BackgroundColor3=e1 and d.good or d.panel2
end end local function e3()for mg,h1 in pairs(ai.boxes)do local h2=e.Targets[mg]==true h1 .Text=h2 and"X"or""
h1 .BackgroundColor3=h2 and d.good or d.panel2 end end local bO local function mh()local mi=0
local e4=k("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=x(e4,"",10,d.dim,false,q(0,0.5))local mj=m(e4,"CLEAR",d.panel2,10,q(0.5,0.24))
local mk=m(e4,"REFRESH",d.panel2,10,q(0.74,0.26))mj.MouseButton1Click:Connect(function()
for ml in pairs(e.Targets)do e.Targets[ml]=nil end e3()end)mk.MouseButton1Click:Connect(function()
o.at=0 dK()bO(true)end)return mi end bO=function(mm)if not dK()then if not b.butEmpty then
b.butEmpty=x(k("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,d.warn,false)end return
end if ai.built and not mm and ai.at==o.at then return end for nJ,e5 in ipairs(b.but:GetChildren())do
if e5:IsA("Frame")or e5:IsA("TextButton")then e5:Destroy()end end ai.boxes,b.butEmpty={},nil
mh()local e6,e7=36,1 local function h3(h4)e7=e7+1 local mn=k("Frame",{Size=UDim2 .new(1,0,0,h4),BackgroundTransparency=1,LayoutOrder=e7},b.but)
e6=e6+h4+6 return mn end for nK,c2 in ipairs(o.rarOrder)do local mo=h3(24)local mp=lE[c2]or d.text
local e8=k("Frame",{Size=a1,BackgroundColor3=d.panel,BorderSizePixel=0},mo)H(e8,6)x(e8,"  "..c2:upper(),11,mp,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local mq=m(e8,"ALL",d.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local mr=c2
mq.MouseButton1Click:Connect(function()local h5=o.members[mr]or{}local h6=false for nL,ms in ipairs(h5)do if not e.Targets[ms]then h6=true break end end
for nM,mt in ipairs(h5)do hZ(mt,h6)end end)for nN,e9 in ipairs(o.members[c2]or{})do local mu=h3(22)
local c3=k("TextButton",{Text="",Size=a1,BackgroundColor3=d.bg,BorderSizePixel=0,AutoButtonColor=true},mu)
H(c3,5)x(c3,"   "..C(e9),11,d.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local e_=k("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=d.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=d.text,AutoButtonColor=false},c3)
H(e_,4)ai.boxes[e9]=e_ local h7=e9 local function h8()hZ(h7,not e.Targets[h7])end c3 .MouseButton1Click:Connect(h8)
e_.MouseButton1Click:Connect(h8)end end e3()b.but.CanvasSize=UDim2 .new(0,0,0,e6+10)ai.built,ai.at=true,o.at
end local h9="farm"local function bP(ax)h9=ax b.farm.Visible,b.but.Visible,b.set.Visible=(ax=="farm"),(ax=="but"),(ax=="set")
b.tabFarm.BackgroundColor3=(ax=="farm")and d.accent or d.panel2 b.tabBut.BackgroundColor3=(ax=="but")and d.accent or d.panel2
b.tabSet.BackgroundColor3=(ax=="set")and d.accent or d.panel2 if ax=="but"then bO(false)end
end local function D(h_,ia,mv,mw)h_.Text=ia and mv or mw h_.BackgroundColor3=ia and d.accent or d.panel2
end local function mx()b.secB.Text=tostring(e.Every)D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then bC(e.AutoStart,true)end if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end aw(b.root)
aw(b.tgRoot)a.lastCollect=g()e3()end local function my(ib)task.spawn(function()ib.TextColor3=d.bad
task.wait(0.8)if a.alive then ib.TextColor3=d.text end end)end local function ic()local id=b.secB.Text:match("^%s*(%d+)%s*$")
local bQ=id and tonumber(id)if not bQ or bQ<1 then b.secB.Text=tostring(e.Every)my(b.secB)
f("interval must be a whole number >= 1")return end if bQ==e.Every then return end e.Every,a.lastCollect=bQ,g()
f("collect every "..bQ.."s")end local function ie(mz)local ig=setclipboard or toclipboard
return type(ig)=="function"and pcall(ig,mz)end local function mA()local fa=ak~=""and ak or(a.reason.."\n"..table.concat(aj,"\n"))
if ie(fa)then f("copied "..#fa.." chars")return end b.out.Text=fa pcall(function()b.out:CaptureFocus()end)
f("no clipboard here - select the text in OUTPUT")end local function mB()local mC,ih=pcall(hz)
ak=mC and ih or("DUMP ERROR "..tostring(ih))local ii=ie(ak)b.out.Text=(ii and#ak>7000)and(ak:sub(1,7000).."\n... (full text is on your clipboard)")or ak
f("DUMP "..#ak.." chars"..(ii and", copied"or""))end local function r(mD,mE)M(mD.MouseButton1Click:Connect(mE))end
r(b.secSet,ic)M(b.secB.FocusLost:Connect(ic))r(b.colT,function()e.Collect,a.lastCollect=not e.Collect,g()
D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")end)r(b.sellT,function()e.SellJunk=not e.SellJunk
D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)r(b.sellB,function()a.sellFails=0
task.spawn(T,"selling...",hj)end)r(b.crateT,function()e.Crates=not e.Crates D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)r(b.crateB,function()c.lastFail,c.summonFails,c.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(T,"opening crate...",el,true)
end)r(b.padB,function()a.plot=aD()or a.plot local ij,fb=aC(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(ij and fb and fb:IsA("BasePart"))then f("SET PAD: need character and plot")return end
a.manualPad=fb.CFrame:ToObjectSpace(ij.HumanoidRootPart.CFrame)k_(a.manualPad)f("collect pad saved at your position")
end)r(b.startB,function()bC(not a.running)end)r(b.buyB,function()a.plot=aD()or a.plot task.spawn(T,"buying (manual)...",gC,true)
end)r(b.plB,function()a.plot=aD()or a.plot task.spawn(T,"waxing (manual)...",gH)end)r(b.dumpB,mB)
r(b.copyB,mA)r(b.tabFarm,function()bP("farm")end)r(b.tabBut,function()bP("but")end)r(b.tabSet,function()bP("set")end)
local function ik(fc)a.hidden=fc b.root.Visible=not fc b.tgBtn.Text=fc and"SAB+"or"SAB"
end hP(b.tgRoot,b.tgRoot,function(mF)aw(b.tgRoot)a.togPos=cW(b.tgRoot)or a.togPos if mF<8 then ik(not a.hidden)end
end)r(b.tgBtn,function()ik(not a.hidden)end)local J,E={},0 local function ay()J=dM()if#J==0 then
b.cfgPick.Text="(none saved)"E=0 return end if E<1 or E>#J then E=1 end b.cfgPick.Text=J[E]..("  (%d/%d)"):format(E,#J)
end local function il()local im=a.autoload~=nil b.cfgAuto.Text=im and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
b.cfgAuto.BackgroundColor3=im and d.accent or d.panel2 end local function fd()local io=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if io~=""then return io end return(E>0 and J[E])or""end r(b.cfgSave,function()a.winPos=cW(b.root)or a.winPos
a.togPos=cW(b.tgRoot)or a.togPos local ip,iq=dP(fd())b.cfgMsg.Text=ip and("saved as "..iq)or("could not save: "..iq)
b.cfgMsg.TextColor3=ip and d.good or d.bad ay()f(b.cfgMsg.Text)end)local function mG(ir)
local fe,is=f6(ir)b.cfgMsg.Text=fe and("loaded "..is)or("could not load: "..is)b.cfgMsg.TextColor3=fe and d.good or d.bad
if fe then b.cfgName.Text=ir mx()end f(b.cfgMsg.Text)end r(b.cfgLoad,function()mG(fd())end)
r(b.cfgPick,function()ay()if E>0 then b.cfgName.Text=J[E]end end)r(b.cfgPrev,function()
if#J==0 then ay()return end E=(E-2)%#J+1 ay()b.cfgName.Text=J[E]end)r(b.cfgNext,function()
if#J==0 then ay()return end E=E%#J+1 ay()b.cfgName.Text=J[E]end)r(b.cfgAuto,function()if a.autoload then
f8(nil)b.cfgMsg.Text="it will not load a config on launch"else local bR=fd()local it=false
for nO,mH in ipairs(dM())do if mH==bR then it=true end end local mI=it or dP(bR)if mI and bR~=""then
f8(bR)ay()b.cfgMsg.Text=bR.." will load every time the script starts"else b.cfgMsg.Text="name the config and save it first"
end end b.cfgMsg.TextColor3=d.dim il()end)r(b.autoB,function()local iu,iv=jN()b.autoMsg.Text=iu and("installed. "..iv)or("failed: "..iv)
b.autoMsg.TextColor3=iu and d.good or d.bad f(b.autoMsg.Text)end)r(b.startT,function()e.AutoStart=not e.AutoStart
D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)r(b.rejT,function()
e.Rejoin=not e.Rejoin D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)r(b.rejB,function()cj("you asked")end)
local a2=false r(b.minB,function()a2=not a2 b.tabs.Visible=not a2 if a2 then b.farm.Visible,b.but.Visible,b.set.Visible=false,false,false
else bP(h9)end b.root.Size=UDim2 .new(0,A.w,0,a2 and(A.head+A.strip)or A.h)b.minB.Text=a2 and"+"or"-"
end)local function c4()if not a.alive then return end a.alive,a.running=false,false pcall(du)
for nP,mJ in ipairs(c8)do pcall(function()mJ:Disconnect()end)end pcall(function()eQ:Destroy()end)
pcall(function()hY:Destroy()end)if aM.SAB_KILL==c4 then aM.SAB_KILL=nil end end aM.SAB_KILL=c4
r(b.killB,c4)r(b.xB,c4)hP(b.title,b.root,function()aw(b.root)a.winPos=cW(b.root)or a.winPos
end)local function iw()local bS,bT=a.reason,a.level if a.busy then bS,bT=a.busyText,"ok"
elseif not a.running then local nQ,ix,mK=hp()if a.capHit then bS,bT=ix,"bad"else bS,bT="[stopped] "..ix,(mK=="bad")and"bad"or"idle"end
a.reason,a.level=bS,bT end b.reason.Text=bS b.bar.BackgroundColor3=lD[bT]or d.dim b.dot.BackgroundColor3=a.running and d.good or(a.capHit and d.bad or d.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and d.panel2 or d.accent
b.startB.Text=a.running and"STOP"or"START"D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and d.warn or d.good local mL,mM=dl()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),mL.."/"..mM local iy=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(g()-a.lastCollect)))or nil
local iz=v()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ab(ac()),a.rolls,a.gifts,a.crates,iz and C(t(iz))or"nothing",c.on and("   ["..c.title.." window open]")or"",
iy and("in "..iy.."s")or"off")local a3=fW()b.tgt.Text=(#a3==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#a3<=3)and table.concat(a3,", ")or(#a3 .." butters ticked")))b.tgt.TextColor3=(#a3==0)and d.bad or d.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(bX,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(o.n,#o.rarOrder,#a3)
end if b.but.Visible and ai.at~=o.at then bO(false)end end aM.SAB={S=a,CFG=e,EV=l,U=b,sg=eQ,dump=hz,CAT=o,LEARN=y,buildList=bO}
f(az.." loaded")if a.uiErrs>0 then f("UI: "..a.uiErrs.." properties skipped")end bP("farm")
aw(b.root)aw(b.tgRoot)if cT then pcall(function()M(cT:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)aw(b.root)aw(b.tgRoot)end))end)end ay()il()if a.config and a.config~=""then b.cfgName.Text=a.config end
D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")
D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")b.secB.Text=tostring(e.Every)
pcall(iw)task.spawn(function()local iA=dR()b.rejMsg.Text=iA and("after a rejoin it restarts from\n"..iA)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(dL(F.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(jT)end)task.spawn(function()while a.alive do local mN,mO=pcall(iw)if not mN then f("UI ERR "..tostring(mO))end
task.wait(0.25)end end)task.spawn(function()local mP,mQ=pcall(j2)if not mP then f("HOOK ERR "..tostring(mQ))end
end)task.spawn(function()pcall(i5)if dK()then f(("catalog: %d butters in %d rarities"):format(o.n,#o.rarOrder))end
local mR,iB=pcall(lb)if mR and iB and a.alive and not a.manualPad then a.manualPad=iB end
end)task.spawn(function()while a.alive do task.wait(20)pcall(du)end end)if c6 then M(u.Idled:Connect(function()pcall(function()c6:CaptureController()c6:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()if not e.AutoStart then return end a.reason,a.level="waiting for the game to load, then starting","wait"
for nR=1,120 do if not a.alive then return end if a.running then return end a.plot=a.plot or aD()
if aC()and a.plot and next(e.Targets)then bC(true,true)f("started by itself")return end
task.wait(1)end if a.alive and not a.running then f("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=aD()a.lastCollect=g()while a.alive do if a.running then
local mS,iC=pcall(lq)if not mS and iC~=c7 then f("LOOP ERR "..tostring(iC))end end task.wait(0.1)
end end)c5("loaded - window is at the top left")end local mU,ff=xpcall(iG,function(mT)return tostring(mT).."\n"..debug.traceback()end)
if not mU then pcall(function()warn("SAB "..az.." ERROR: "..tostring(ff))end)c5("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..az.." ERROR: "..tostring(ff))end)pcall(function()local iD=(type(getgenv)=="function"and getgenv())or _G
if type(iD.SAB_KILL)=="function"then iD.SAB_KILL()end for nS,mV in ipairs({"SABFarmGui","SABToggle"})do
local iE=u.PlayerGui:FindFirstChild(mV)if iE then iE:Destroy()end end end)pcall(function()
local bU=Instance.new("ScreenGui")bU.Name="SABError"bU.ResetOnSpawn=false bU.DisplayOrder=1000
local V=Instance.new("TextBox")V.Size=UDim2 .new(0,340,0,170)V.Position=UDim2 .new(0,10,0,50)
V.BackgroundColor3=Color3 .fromRGB(90,20,20)V.TextColor3=Color3 .new(1,1,1)V.TextSize=11
V.TextWrapped=true V.ClearTextOnFocus=false V.TextXAlignment=Enum.TextXAlignment.Left V.TextYAlignment=Enum.TextYAlignment.Top
V.Text="SAB "..az.." failed to start. Send this text:\n"..tostring(ff)V.Parent=bU bU.Parent=u:WaitForChild("PlayerGui")
end)end
