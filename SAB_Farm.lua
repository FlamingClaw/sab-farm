local ax="v18"local e3=game:GetService("Players")local v=e3 .LocalPlayer or e3 .PlayerAdded:Wait()
local function cX(ij)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..ax,Text=ij,Duration=6})
end)end cX("script started")local function ik()local bP=game:GetService("ReplicatedStorage")
local bQ=game:GetService("Workspace")local il=game:GetService("UserInputService")local aK=(type(getgenv)=="function"and getgenv())or _G
if type(aK.SAB_KILL)=="function"then pcall(aK.SAB_KILL)end local g=(type(tick)=="function")and tick or os.clock
local cY=(function()local im,io=pcall(function()return game:GetService("VirtualUser")end)return im and io or nil end)()
local e={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,Rejoin=true,
AutoStart=true,Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,
capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,matchSince=nil,boot=g(),plot=nil,reason="starting",level="wait",
lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,
crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local l={name=nil,rar=nil,at=g(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local d={on=false,waiting=false,data=nil,at=0,title="crate",lastFail=0,
rolled=nil,rolledAt=0,prompt=nil,summonFails=0,ignoreUntil=0,scanAt=0}local cZ={}local c0,bR,ah,ay={},{},{},{}
local ai=""local function L(e4)c0[#c0+1]=e4 return e4 end local function az(ip)task.wait(ip)
if not a.alive then error(cZ,0)end end local function f(bS)bS=os.date("%H:%M:%S").." "..tostring(bS)
table.insert(bR,1,bS)if#bR>6 then table.remove(bR)end ah[#ah+1]=bS if#ah>80 then table.remove(ah,1)end
end local function c1(e5)if type(e5)~="string"then return""end return(e5:lower():gsub("[^%w]",""))
end local function t(iq)local e6=c1(iq)local c2=e6:gsub("butter$","")if c2==""then c2=e6 end
return c2 end local function aa(c3)return type(c3)=="string"and t(c3)~=""and e.Targets[t(c3)]==true end
local function ir(a1)a1=a1:lower()return a1:find("squishy",1,true)~=nil or a1:match("butter$")~=nil or a1:match("butter[^%a]")~=nil
end local c4={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function ab(a2)
if type(a2)~="number"then return"?"end local bT=1 while math.abs(a2)>=1000 and bT<#c4 do a2=a2/1000 bT=bT+1 end
local is=string.format("%.2f",a2):gsub("%.?0+$","")return is..c4[bT]end local function it(e7)
if type(e7)~="string"then return nil end local iu,e8=e7:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local c5=tonumber(iu)if not c5 then return nil end if e8==""then return c5 end for iv,iw in ipairs(c4)do if iw:lower()==e8:lower()then return c5*1000^(iv-1)end end
return nil end local function ac()local e9=v:GetAttribute("BoardValueMoney")if type(e9)=="number"then return e9 end
local e_=v:FindFirstChild("leaderstats")if e_ then for mv,ix in ipairs({"Cash","Money","Coins"})do
local c6=e_:FindFirstChild(ix)if c6 and type(c6 .Value)=="number"then return c6 .Value end
end end end local function V(iy)local c7=iy:GetFullName()if a.plot then local c8=a.plot:GetFullName()
if c7:sub(1,#c8)==c8 then return c7:sub(#c8+2)end end return c7 end local function aA()
local bU=v.Character if bU and bU:FindFirstChild("HumanoidRootPart")then local fa=bU:FindFirstChildOfClass("Humanoid")
if fa and fa.Health>0 then return bU end end end local function aB()local c9=bQ:FindFirstChild("Plots")
if not c9 then return nil end local function fb(iz)local fc=iz:FindFirstChild("Plate")return fc~=nil and fc:FindFirstChild("EditStackAttachment",true)~=nil
end local fd=v:GetAttribute("PlotNumber")if fd~=nil then local c_=c9:FindFirstChild(tostring(fd))
if c_ and fb(c_)then return c_ end end for mw,fe in ipairs(c9:GetChildren())do if fb(fe)then return fe end
end end local function a3(ff)local aj=ff and ff.Parent for mx=1,6 do if not aj then return nil end
if aj:IsA("BasePart")then return aj end if aj:IsA("Model")then return aj.PrimaryPart or aj:FindFirstChildWhichIsA("BasePart",true)end
aj=aj.Parent end end local function fg(fh)local da=fh.Parent if da and da:IsA("Attachment")then return da.WorldPosition end
local fi=a3(fh)return fi and fi.Position end local function iA()local aL=a.plot and a.plot:FindFirstChild("Plate")
if not aL then return nil end if aL:IsA("BasePart")then return aL.Position end if aL:IsA("Model")then return aL:GetPivot().Position end
local fj=aL:FindFirstChildWhichIsA("BasePart",true)return fj and fj.Position end local function fk()
local db={}local fl=a.plot and a.plot:FindFirstChild("WaxStations")if fl then for my,iB in ipairs(fl:GetChildren())do
local fm=iB:FindFirstChild("SquishyPlaceHolder")local dc=fm and fm:FindFirstChild("PlacePrompt")
if dc and dc:IsA("ProximityPrompt")then db[#db+1]=dc end end end return db end local function dd()
local fn,de=fk(),0 for mz,iC in ipairs(fn)do if iC.Enabled then de=de+1 end end local df=#fn
local dg=v:GetAttribute("WaxStations")if type(dg)=="number"and dg>df then df=dg end return de,df
end local function iD()local fo=aA()local fp=fo and fo.HumanoidRootPart.Position local dh,fq
for mA,di in ipairs(fk())do if di.Enabled then local fr=fg(di)local fs=(fr and fp)and(fr-fp).Magnitude or 1e9
if not dh or fs<fq then dh,fq=di,fs end end end return dh end local function dj()local bV=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not bV then return nil end local ft=bV:FindFirstChild("BuyPromptAttachment")local bW=(ft and ft:FindFirstChild("BuyPrompt"))or bV:FindFirstChild("BuyPrompt",true)
if bW and bW:IsA("ProximityPrompt")and bW:IsDescendantOf(bV)then return bW end end local iE={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local iF={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local y={order={},price={},dirty=false}local o={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local dk="SAB_order.txt"local function dl()if not y.dirty or type(writefile)~="function"then return end
local a4={}for iG,iH in pairs(y.price)do a4[#a4+1]="P|"..iG.."|"..string.format("%.0f",iH)end
for iI,iJ in pairs(y.order)do a4[#a4+1]="O|"..iI.."|"..table.concat(iJ,",")end if pcall(writefile,dk,table.concat(a4,"\n"))then y.dirty=false end
end local function iK()if type(isfile)~="function"or type(readfile)~="function"then return end
local iL,iM=pcall(isfile,dk)if not(iL and iM)then return end local iN,fu=pcall(readfile,dk)
if not(iN and type(fu)=="string")then return end for iO in fu:gmatch("[^\n]+")do local fv,fw,dm=iO:match("^(%a)|([^|]+)|(.*)$")
if fv=="P"then y.price[fw]=tonumber(dm)elseif fv=="O"and dm~=""then local bX={}for iP in dm:gmatch("[^,]+")do bX[#bX+1]=iP end
if#bX>0 then y.order[fw]=bX end end end end local function iQ(bY)if type(bY)~="table"then return end
local aC,fx=bY.rarity,bY.contents if type(aC)~="string"or aC==""or type(fx)~="table"then return end
local a5={}for mB,bZ in ipairs(fx)do if type(bZ)=="table"and type(bZ.butter)=="string"then
a5[#a5+1]={n=bZ.butter,ch=tonumber(bZ.chance)or 0}end end if#a5==0 then return end table.sort(a5,function(iR,iS)return iR.ch>iS.ch end)
local a6,a7={},false for iT,iU in ipairs(a5)do a6[iT]=iU.n end local dn=y.order[aC]if not dn or#dn~=#a6 then a7=true end
if not a7 then for fy=1,#a6 do if dn[fy]~=a6[fy]then a7=true break end end end y.order[aC]=a6
local dp=tonumber(bY.price)if dp and y.price[aC]~=dp then y.price[aC]=dp a7=true end if a7 then
y.dirty=true o.at=0 f("learned the "..aC.." order from its crate")end end local function a8(iV,iW)
local iX=iV:FindFirstChild(iW,true)local iY,dq=pcall(function()return iX.Text end)return(iY and type(dq)=="string"and dq~="")and dq or nil
end local function C(fz)return o.pretty[fz]or fz end local function iZ()local fA=bP:FindFirstChild("Assets")
local fB=fA and fA:FindFirstChild("Squishies")if not fB then return false end local dr,fC,aM={},{},{}
local b0=0 for mC,b1 in ipairs(fB:GetChildren())do local a9=t(b1 .Name)if a9~=""and not dr[a9]then
local b2=a8(b1,"RarityText")or"?"dr[a9]=b2 fC[a9]=a8(b1,"NameText")or b1 .Name aM[b2]=aM[b2]or{}
table.insert(aM[b2],a9)b0=b0+1 end end if b0==0 then return false end for fD,i0 in pairs(aM)do
local fE=y.order[fD]or iF[fD]local ds={}if fE then for i1,i2 in ipairs(fE)do ds[t(i2)]=i1 end end
table.sort(i0,function(fF,fG)local dt,du=ds[fF],ds[fG]if dt and du then return dt<du end
if dt then return true end if du then return false end return C(fF)<C(fG)end)end local dv={}
for i3,i4 in ipairs(iE)do dv[i4]=i3 end local b3={}for i5 in pairs(aM)do b3[#b3+1]=i5 end
table.sort(b3,function(dw,dx)local dy,dz=y.price[dw],y.price[dx]if dy and dz and dy~=dz then return dy<dz end
local dA,dB=dv[dw],dv[dx]if dA and dB then return dA<dB end if dA then return true end if dB then return false end
return dw<dx end)o.rar,o.pretty,o.members,o.rarOrder,o.n,o.at=dr,fC,aM,b3,b0,g()return true
end local function dC()if o.at==0 or(g()-o.at)>120 then pcall(iZ)end return o.n>0 end local function i6(i7)
local fH=t(i7)return o.rar[fH]or(l.name and t(l.name)==fH and l.rar)or"?"end local function fI()
local b4={}for i8,i9 in pairs(e.Targets)do if i9 then b4[#b4+1]=C(i8)end end table.sort(b4)
return b4 end local F={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function fJ()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function b5(fK)if type(makefolder)~="function"then return end local i_,ja=pcall(isfolder,fK)
if not(i_ and ja)then pcall(makefolder,fK)end end local function dD(fL)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local jb,jc=pcall(isfile,fL)if not(jb and jc)then return nil end local jd,je=pcall(readfile,fL)
return jd and je or nil end local function b6(jf,jg)if type(writefile)~="function"then return false end
return(pcall(writefile,jf,jg))end local function fM(jh)local a_={}if type(listfiles)~="function"then return a_ end
local ji,fN=pcall(listfiles,jh)if not ji or type(fN)~="table"then return a_ end for mD,jj in ipairs(fN)do a_[#a_+1]=tostring(jj)end
return a_ end local function dE()local b7={}for mE,jk in ipairs(fM(F.cfg))do local fO=jk:match("([^/\\]+)%.txt$")
if fO then b7[#b7+1]=fO end end table.sort(b7)return b7 end local function jl()local M={"V|1"}
M[#M+1]="N|Every|"..tostring(e.Every)for mF,fP in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart"})do
M[#M+1]="B|"..fP.."|"..(e[fP]and"1"or"0")end if a.winPos then M[#M+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then M[#M+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end local b8={}for jm,jn in pairs(e.Targets)do if jn then b8[#b8+1]=jm end end
table.sort(b8)for mG,jo in ipairs(b8)do M[#M+1]="T|"..jo end return table.concat(M,"\n")
end local function jp(dF)if type(dF)~="string"or dF==""then return false end local fQ,fR={},false
for jq in dF:gmatch("[^\n]+")do local ba,aD,b9=jq:match("^(%a)|([^|]*)|?(.*)$")if ba=="N"and aD=="Every"then
local dG=tonumber(b9)if dG and dG>=1 then e.Every=math.floor(dG)end elseif ba=="B"then if e[aD]~=nil then e[aD]=(b9=="1")end
elseif ba=="W"then a.winPos={tonumber(aD)or 10,tonumber(b9)or 44}elseif ba=="G"then a.togPos={tonumber(aD)or 10,tonumber(b9)or 300}
elseif ba=="T"and aD~=""then fQ[aD]=true fR=true end end if fR then e.Targets=fQ end return true
end local function dH(aN)if not fJ()then return false,"this executor cannot write files"end
aN=(aN or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if aN==""then return false,"give the config a name"end
b5(F.dir)b5(F.cfg)if not b6(F.cfg.."/"..aN..".txt",jl())then return false,"could not write the file"end
a.config=aN return true,aN end local function fS(b_)local fT=dD(F.cfg.."/"..b_..".txt")
if not fT then return false,"no config called "..tostring(b_)end if not jp(fT)then return false,"that config looks empty"end
a.config=b_ return true,b_ end local function fU(dI)if dI then b5(F.dir)b6(F.auto,dI)elseif type(delfile)=="function"then
pcall(delfile,F.auto)else b6(F.auto,"")end a.autoload=dI end local function dJ()if a.selfPath then return a.selfPath end
local ca for mH,jr in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",F.dir})do for mI,fV in ipairs(fM(jr))do
local dK=fV:lower()if dK:sub(-4)==".lua"and(dK:find("sab_farm",1,true)or dK:find("sab farm",1,true))then
ca=ca or fV end end end a.selfPath=ca return ca end F.stub=[[
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
local function js()if not fJ()then return false,"this executor cannot write files"end b5("autoexec")
if not b6(F.exec,F.stub)then return false,"could not write to the autoexec folder"end local fW=dJ()
return true,fW and("it will load "..fW)or"now save this script in Delta so the loader can find it"
end local cb=(function()local jt,ju=pcall(function()return game:GetService("TeleportService")end)return jt and ju or nil end)()
local function fX()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local jv=queueonteleport or queue_on_teleport local fY=dJ()if not fY then return false end
return(pcall(jv,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(fY)))
end local function cc(jw)if a.rejoining then return end a.rejoining=true f("REJOIN ("..jw..")")
pcall(dl)if a.autoload then pcall(dH,a.autoload)end local jx=fX()f(jx and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for mJ=1,30 do if not cb then break end pcall(function()cb:Teleport(game.PlaceId,v)end)
task.wait(10)end end)end local function jy()local jz,fZ=pcall(function()return game:GetService("GuiService")end)
if jz and fZ then pcall(function()L(fZ.ErrorMessageChanged:Connect(function()if e.Rejoin then cc("roblox error message")end
end))end)end pcall(function()local f0=game:GetService("CoreGui")local f1=f0 and f0:WaitForChild("RobloxPromptGui",15)
local f2=f1 and f1:WaitForChild("promptOverlay",15)if f2 then L(f2 .ChildAdded:Connect(function(jA)
if e.Rejoin and tostring(jA.Name):lower():find("errorprompt",1,true)then cc("disconnect prompt")end
end))end end)pcall(function()L(v.OnTeleport:Connect(function(jB)if tostring(jB):find("Started")then fX()end
end))end)if cb then pcall(function()L(cb.TeleportInitFailed:Connect(function()a.rejoining=false
if e.Rejoin then task.delay(5,function()cc("teleport retry")end)end end))end)end end local function f3(jC)
local f4=a.plot and a.plot:FindFirstChild(jC)if not f4 then return nil,false end for mK,dL in ipairs(f4:GetChildren())do
if dL:IsA("Model")or dL:IsA("BasePart")then return dL,true end end return nil,true end local function bb()
local ak=f3("RolledSquishy")if not ak then return nil end return{model=ak,name=ak.Name,pretty=a8(ak,"NameText")or C(t(ak.Name)),
rar=a8(ak,"RarityText")or i6(ak.Name),price=a8(ak,"PriceText")}end local function f5(dM)
return type(dM)=="string"and(o.rar[t(dM)]~=nil or ir(dM))end local function u()local dN=f3("SquishyEquipped")
if dN then a.carrySrc="model"return dN.Name,dN end local f6=v.Character if f6 then for mL,bc in ipairs(f6:GetDescendants())do
if(bc:IsA("Model")or bc:IsA("Tool"))and f5(bc.Name)then a.carrySrc="character"return bc.Name,bc
end end end local cd=v:GetAttribute("SquishyEquipped")if type(cd)=="string"and cd~=""and f5(cd)and g()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return cd,nil end a.carrySrc=nil end local function mM()local mN,jD=u()return jD end
local function f7()local f8=bb()local dO=f8 and it(f8 .price)local dP=ac()if dO and dP and dP<dO*0.5 then return dP,dO end
end local function aO(jE)ay[#ay+1]=os.date("%H:%M:%S").." "..jE if#ay>40 then table.remove(ay,1)end
end local function jF(aE,ce)if type(aE)~="string"then return end aO(("Roll(%s,%s)"):format(aE,tostring(ce)))
if aE:lower():find("crate",1,true)then d.rolled,d.rolledAt=aE,g()return end l.seq=l.seq+1
l.name,l.at=aE,g()l.rar=type(ce)=="string"and ce or nil a.rolls=a.rolls+1 if aa(aE)then f(("ROLL %s [%s] = TARGET"):format(aE,tostring(ce)))end
end local function jG(aF)if type(aF)~="table"then return end local cf=aF.butter or aF.itemName
if type(cf)~="string"then return end a.gifts=a.gifts+1 l.gift,l.giftAt=cf,g()if type(aF.giftId)=="string"then
local f9=bP:FindFirstChild("Remotes")local f_=f9 and f9:FindFirstChild("GiftThanks")if f_ then pcall(function()f_:FireServer(aF.giftId)end)end
end aO("Gift("..cf.." from "..tostring(aF.fromName)..")")f(("GIFT from %s: %s - it will not be waxed"):format(tostring(aF.fromName),cf))
end local function jH()local ga=bP:WaitForChild("Remotes",30)if not a.alive then return end
if not ga then f("Remotes folder missing - no roll events")return end local jK={SquishyRollAnimation=jF,
InitSquishy=function(gb)l.init,l.initAt=tostring(gb),g()aO("Init("..tostring(gb)..")")end,
CrateUpdate=function(bd,gc)pcall(iQ,bd)if type(bd)=="table"then local jI=gc==true or(d.rolled~=nil and g()-d.rolledAt<15)or d.waiting
if not jI then return end local jJ=not d.waiting d.waiting,d.data,d.at=true,bd,g()d.on=(gc==true)
d.title=tostring(bd.title or bd.name or"crate")if d.on then aO("CrateWindow open("..d.title..")")
elseif jJ then aO("Crate waiting("..d.title..")")f(d.title.." is waiting on your stand")
end else if d.waiting then aO("Crate gone")end d.on,d.waiting,d.data,d.prompt=false,false,nil,nil
d.summonFails=0 end end,GiftReceived=jG,}for cg,jL in pairs(jK)do local dQ=ga:FindFirstChild(cg)
if dQ and dQ:IsA("RemoteEvent")then L(dQ.OnClientEvent:Connect(jL))elseif cg~="CrateUpdate"and cg~="GiftReceived"then f("remote "..cg.." missing")end
end end local function dR()local aG=bb()if aG then if aa(aG.name)then return{state="match",shown=aG.pretty,src="pad",info=aG}
end return{state="skip",info=aG,level="idle",text=("on pad: %s [%s] - not ticked"):format(aG.pretty,tostring(aG.rar))}
end if l.name and(g()-l.at)<4 then if aa(l.name)then return{state="match",shown=C(t(l.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(C(t(l.name)),tostring(l.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function gd(jM,jN,jO,jP)
local ci=RaycastParams.new()ci.FilterType=Enum.RaycastFilterType.Exclude local dS={v.Character}
for mO,jQ in ipairs(jP or{})do dS[#dS+1]=jQ end ci.FilterDescendantsInstances=dS pcall(function()ci.RespectCanCollide=true end)
local ge=bQ:Raycast(Vector3 .new(jM,jN+4,jO),Vector3 .new(0,-30,0),ci)return ge and ge.Position or nil
end local function dT(gf)local gg=gf:FindFirstChildOfClass("Humanoid")return((gg and gg.HipHeight)or 2)+gf.HumanoidRootPart.Size.Y/2+0.2
end local function dU(jR,jS)local gh=jR:FindFirstChildOfClass("Humanoid")local jT=g()while g()-jT<jS do
if gh and gh.FloorMaterial~=Enum.Material.Air then return true end az(0.05)end return false
end local function cj(jU,dV,dW)local gi=jU.HumanoidRootPart gi.AssemblyLinearVelocity=Vector3 .new(0,0,0)
gi.CFrame=dW and CFrame.new(dV,Vector3 .new(dW.X,dV.Y,dW.Z))or CFrame.new(dV)end local function ck(ad,gj)
local aH=aA()if not aH or not ad then return false end local al=ad.Position local cl=math.clamp(math.max(ad.Size.X,ad.Size.Z)/2+2.2,3,7)
local gk=(gj and gj.MaxActivationDistance)or 10 if cl>gk-2 then cl=math.max(2.5,gk-2)end
local be={}local function aI(bf)bf=Vector3 .new(bf.X,0,bf.Z)if bf.Magnitude>0.05 then be[#be+1]=bf.Unit end
end local gl=iA()if gl then aI(gl-al)end aI(ad.CFrame.LookVector)aI(-ad.CFrame.LookVector)
aI(ad.CFrame.RightVector)aI(-ad.CFrame.RightVector)aI(aH.HumanoidRootPart.Position-al)if#be==0 then aI(Vector3 .new(0,0,1))end
local jV,cm=dT(aH),false for mP,jW in ipairs(be)do local cn=al+jW*cl local dX=gd(cn.X,al.Y,cn.Z,{ad})
if dX and math.abs(dX.Y-al.Y)<14 then cj(aH,Vector3 .new(cn.X,dX.Y+jV,cn.Z),al)if dU(aH,0.7)then cm=true break end
end end if not cm then cj(aH,al+be[1]*cl+Vector3 .new(0,3,0),al)cm=dU(aH,1)end az(0.12)
return cm end local function jX(bh)if not bh.Parent or not bh.Enabled then return false end
pcall(function()bh:InputHoldBegin()end)az(math.max(bh.HoldDuration,0)+0.08)pcall(function()bh:InputHoldEnd()end)
return true end local function aP(gm,jY)local jZ=g()while g()-jZ<jY do if gm()then return true end
az(0.05)end return gm()end local function co(aQ,j0,gn,j1)local j2=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for j3,dY in ipairs(j2)do if j3==2 and(j1 or not(aQ.Parent and aQ.Enabled and(not gn or gn())))then break end
local dZ if dY=="hold"then dZ=jX(aQ)else dZ=type(fireproximityprompt)=="function"and aQ.Parent~=nil and aQ.Enabled and pcall(fireproximityprompt,aQ)end
if dZ and aP(j0,1.2)then a.zapFirst=(dY=="zap")return true,dY end end return false end local function go(d0)
local am=dj()if not am or not am.Enabled then f("buy: nothing on the pad")return false end
local gp=a3(am)if not gp then f("buy: pad part missing")return false end a.lastBuyAt=g()
local j4,gq=l.seq,ac()ck(gp,am)if not am.Enabled then f("buy aborted: pad emptied")return false end
local aR=dR()if not d0 and aR.state~="match"then f("buy aborted: "..(aR.text or"pad changed"))
a.matchSince=nil return false end local d1=aR.info and aR.info.name or(aR.state=="match"and l.name)or nil
local function j5()return am.Enabled and u()==nil and(d0 or dR().state=="match")end local j6,j7=co(am,function()
return u()~=nil or((not am.Enabled)and(d0 or l.seq==j4))end,j5,f7()~=nil)if j6 then aP(function()return u()~=nil end,0.8)
local bi=u()local gr=ac()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
l.name,l.rar,l.at=nil,nil,g()f(("BOUGHT %s%s via %s"):format(bi and C(t(bi))or(aR.shown or"?"),(gq and gr)and(" for $"..ab(gq-gr))or"",j7))
if bi and d1 and t(bi)~=t(d1)then f(("note: picked up %s, not %s"):format(bi,d1))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=g()+math.min(8*2^(a.cashFails-1),60)local gs=bb()
f(("BUY REFUSED: cash short? have $%s, price %s"):format(ab(ac()),(gs and gs.price)or"?"))
return false end local function gt()local cp=u()if not cp then a.holding=false f("place: hands are empty")
return false end if not aa(cp)then f(("REFUSED TO WAX %s - it is not ticked"):format(C(t(cp))))
return false end for mQ=1,e.PlaceTries do local an=iD()if not an then f("place: no free station")break end
local gu=a3(an)if gu then ck(gu,an)local gv=u()if not gv then a.holding=false f("place: hands emptied on the way")return false end
if not aa(gv)then f("place: what I carry changed, not waxing it")return false end if an.Enabled then
local j8,j9=co(an,function()return not an.Enabled end,function()return an.Enabled end)if j8 then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=g()+2.5,0 l.name,l.rar,l.at=nil,nil,g()
f(("WAXED %s #%d at %s via %s"):format(C(t(cp)),a.placed,an.Parent.Parent.Name,j9))return true
end end end az(0.25)end a.placeFails=a.placeFails+1 if u()==nil then a.holding=false end
f("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,g()
a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(u()))f(a.capMsg)end return false end local function gw(gx)return type(gx)=="string"and gx:lower():find("crate",1,true)~=nil
end local function j_(cq)if type(cq)~="table"then return false end local d2=cq.contents
if type(d2)=="table"and#d2>0 then for mR,d3 in ipairs(d2)do if type(d3)=="table"and aa(d3 .butter)then return true,C(t(d3 .butter))end
end return false end local gy=cq.rarity and o.members[cq.rarity]if gy then for mS,gz in ipairs(gy)do if e.Targets[gz]then return true,C(gz)end end
end return false end local ka={SABFarmGui=1,SABToggle=1,SABError=1}local function gA(kb)
local ao=kb while ao do if ka[ao.Name]then return false end if ao:IsA("ScreenGui")then local kc,kd=pcall(function()return ao.Enabled end)
return(not kc)or kd~=false end if ao:IsA("GuiObject")and not ao.Visible then return false end
ao=ao.Parent end return false end local function gB(cr)local aS=""pcall(function()if cr:IsA("TextButton")then aS=cr.Text end end)
if not aS:find("%a")then for mT,cs in ipairs(cr:GetDescendants())do if(cs:IsA("TextLabel")or cs:IsA("TextButton"))and cs.Text:find("%a")then aS=cs.Text break end
end end if not aS:find("%a")then aS=cr.Name end return(aS:lower():gsub("[^%a]",""))end local function ke()
local bj,bk local gC=v:FindFirstChildOfClass("PlayerGui")if not gC then return nil,nil end
for mU,bl in ipairs(gC:GetDescendants())do if bl:IsA("GuiButton")and gA(bl)then local d4=gB(bl)
if d4:sub(1,4)=="open"and not d4:find("shop",1,true)then bj=bj or bl end if d4:sub(1,7)=="discard"then bk=bk or bl end
end end if bj and bk then return bj,bk end if d.on then return bj,bk end return nil,nil
end local ct=(function()local kf,kg=pcall(function()return game:GetService("VirtualInputManager")end)return kf and kg or nil end)()
local function kh(ap,ki)local d5={}local function gD(kj)d5[#d5+1]=kj end if a.tapWay then gD(a.tapWay)end
for mV,gE in ipairs({"conn","signal","touch"})do if gE~=a.tapWay then gD(gE)end end for mW,bm in ipairs(d5)do
local cu=false if bm=="conn"and type(getconnections)=="function"then for mX,kk in ipairs({ap.MouseButton1Click,ap.Activated,ap.MouseButton1Down})do
local kl,gF=pcall(getconnections,kk)if kl and type(gF)=="table"then for mY,km in ipairs(gF)do
if pcall(function()km:Fire()end)then cu=true end end end end elseif bm=="signal"and type(firesignal)=="function"then
cu=pcall(firesignal,ap.MouseButton1Click)or pcall(firesignal,ap.Activated)elseif bm=="touch"and ct then
cu=pcall(function()local gG,gH=ap.AbsolutePosition,ap.AbsoluteSize local gI=0 local gJ=ap:FindFirstAncestorWhichIsA("ScreenGui")
local kn,ko=pcall(function()return gJ and gJ.IgnoreGuiInset end)if not(kn and ko)then pcall(function()gI=game:GetService("GuiService"):GetGuiInset().Y end)
end local gK,gL=gG.X+gH.X/2,gG.Y+gH.Y/2+gI ct:SendMouseButtonEvent(gK,gL,0,true,game,1)
task.wait(0.06)ct:SendMouseButtonEvent(gK,gL,0,false,game,1)end)end if cu and aP(ki,1.5)then
a.tapWay=bm return true,bm end end return false end local kp={LimitedSquishyPlaceHolder=1,Lever=1,WaxStations=1,RolledSquishyPlaceHolder=1,SquishyStack=1}
local function d6(gM)local bn=gM.Parent while bn and bn~=a.plot do if kp[bn.Name]then return false end
bn=bn.Parent end local d7=(gM.ActionText or""):lower()if d7:find("roll",1,true)or d7:find("place",1,true)or d7:find("sell",1,true)then return false end
return true end local function gN()if d.prompt and d.prompt.Parent and d.prompt.Enabled then return d.prompt end
if not a.plot then return nil end local gO=a.plot:FindFirstChild("CrateStand")local bo if gO then
for mZ,cv in ipairs(gO:GetDescendants())do if cv:IsA("ProximityPrompt")and cv.Enabled and d6(cv)then bo=cv break end
end end if not bo then for m0,aq in ipairs(a.plot:GetDescendants())do if aq:IsA("ProximityPrompt")and aq.Enabled and d6(aq)then
local gP=aq:FindFirstAncestorWhichIsA("Model")local kq=((aq.ActionText or"").." "..(aq.ObjectText or"").." "..aq.Name.." "..(gP and gP.Name or"")):lower()
if kq:find("crate",1,true)then bo=aq break end end end end d.prompt=bo return bo end local function gQ()
if d.on then return true end local bp=gN()if not bp then d.summonFails=d.summonFails+1 d.lastFail=g()
f("crate: cannot find where to open "..d.title.." - open it once by hand, then DUMP")return false
end local gR=a3(bp)if gR then ck(gR,bp)end co(bp,function()return d.on end)if aP(function()return d.on end,3)then
d.summonFails=0 return true end d.summonFails=d.summonFails+1 d.lastFail=g()f("crate: pressed "..V(bp).." but no window came up")
return false end local function d8(cw)if not gQ()then return false end local d9=d.title
local kr,ks=ke()local gS=cw and kr or ks if not gS then d.lastFail=g()a.crateFails=a.crateFails+1
f(("crate: no %s button found in %s"):format(cw and"Open"or"Discard",d9))return false end
local kt=u()local ku,m1=kh(gS,function()return(not d.on)or(u()~=nil and u()~=kt)end)if not ku then
d.lastFail=g()a.crateFails=a.crateFails+1 f("crate: could not press "..(cw and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if cw then a.crates=a.crates+1 aP(function()return u()~=nil end,1.5)
local gT=u()f(("OPENED %s -> %s"):format(d9,gT and C(t(gT))or"?"))else f("discarded "..d9 .." (nothing ticked in it)")
end return true end local kv={"sell","trash","discard","dispose","bin"}local function d_(cx)
if type(cx)~="string"then return false end cx=cx:lower()for m2,kw in ipairs(kv)do if cx:find(kw,1,true)then return true end end
return false end local function kx()local gU=bP:FindFirstChild("Remotes")local ea=gU and gU:FindFirstChild("SellSquishy")
if not(ea and ea:IsA("RemoteEvent"))then return false end if not pcall(function()ea:FireServer()end)then return false end
return aP(function()return u()==nil end,1.5)end local function ky()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if g()-a.sellSearchAt<20 then return nil end a.sellSearchAt=g()local gV=aA()local gW=gV and gV.HumanoidRootPart.Position
local bq,gX for m3,aT in ipairs((a.plot or bQ):GetDescendants())do if aT:IsA("ProximityPrompt")and(d_(aT.ActionText)or d_(aT.ObjectText)or d_(aT.Name))then
local gY=fg(aT)local eb=(gY and gW)and(gY-gW).Magnitude or 1e9 if eb<=400 and(not bq or eb<gX)then bq,gX=aT,eb end
end end a.sellSpot=bq a.noSellSpot=(bq==nil)return bq end local function gZ()local ec=u()
if not ec then a.holding=false return false end if aa(ec)then return false end local ed=C(t(ec))
if kx()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=g()+2.5,0
f("SOLD "..ed)return true end local aU=ky()if aU then local g0=a3(aU)if g0 then ck(g0,aU)
local g1=u()if g1 and not aa(g1)then local kz,kA=co(aU,function()return u()==nil end,function()return aU.Enabled end)
if kz then a.sold,a.holding,a.sellFails=a.sold+1,false,0 f(("SOLD %s at %s via %s"):format(ed,V(aU),kA))
return true end end end end a.sellFails=a.sellFails+1 f("could not sell "..ed.." ("..a.sellFails..")")
return false end local kB={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function kC(aV)local cy=V(aV):lower()for m4,kD in ipairs(kB)do if cy:find(kD,1,true)then return 0 end end
local W,z=aV.Name:lower(),0 local function N(kE,kF)return kE:find(kF,1,true)~=nil end if N(W,"collect")then z=z+60 end
if N(W,"cash")or N(W,"money")then z=z+45 end if N(W,"income")or N(W,"claim")then z=z+35 end
if N(W,"coin")or N(W,"earn")or N(W,"green")then z=z+20 end if W=="pad"or W=="touch"then z=z+25 end
if z==0 and(N(cy,"collect")or N(cy,"cash")or N(cy,"money"))then z=25 end if z==0 then return 0 end
local br=aV.Color if br.G>0.5 and br.G>br.R*1.4 and br.G>br.B*1.4 then z=z+15 end if math.min(aV.Size.X,aV.Size.Y,aV.Size.Z)<2 then z=z+5 end
return z end local function kG()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or g()-a.padSearchAt<20 then return nil end a.padSearchAt=g()local cz,bs,ee={},nil,29
for m5,cA in ipairs(a.plot:GetDescendants())do if cA:IsA("BasePart")then local cB=kC(cA)
if cB>0 then cz[#cz+1]={s=cB,p=cA}if cB>ee then bs,ee=cA,cB end end end end table.sort(cz,function(kH,kI)return kH.s>kI.s end)
a.padCands,a.padPart=cz,bs if bs then f("collect pad: "..V(bs).." (score "..ee..")")end
return bs end local ef="SAB_pad_v1.txt"local function kJ(kK)if type(writefile)=="function"then pcall(writefile,ef,table.concat({kK:GetComponents()},","))end
end local function kL()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local kM,g2=pcall(function()if isfile(ef)then return readfile(ef)end end)if not kM or type(g2)~="string"then return nil end
local cC={}for kN in g2:gmatch("[^,]+")do cC[#cC+1]=tonumber(kN)end if#cC==12 then return CFrame.new(unpack(cC))end
end local function kO(eg,cD,kP)local kQ=dT(eg)local eh=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local O=(eh and eh:IsA("BasePart"))and(eh.Position-cD)or Vector3 .new(1,0,0)O=Vector3 .new(O.X,0,O.Z)
if O.Magnitude<0.05 then O=Vector3 .new(1,0,0)end O=O.Unit for kR=0,7 do local cE=kR*math.pi/4
local kS=Vector3 .new(O.X*math.cos(cE)-O.Z*math.sin(cE),0,O.X*math.sin(cE)+O.Z*math.cos(cE))
local cF=cD+kS*(kP+5)local ei=gd(cF.X,cD.Y,cF.Z)if ei and math.abs(ei.Y-cD.Y)<8 then cj(eg,Vector3 .new(cF.X,ei.Y+kQ,cF.Z))
if dU(eg,0.7)then return true end end end return false end local function kT()a.lastCollect=g()
local bt=aA()if not bt then return end local g3,kU=bt.HumanoidRootPart,dT(bt)local bu,g4,bv,ej=nil,4,nil,"?"
local ek=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and ek and ek:IsA("BasePart")then
bu,ej=(ek.CFrame*a.manualPad).Position,"manual pad"else local ae=kG()if ae then bu=Vector3 .new(ae.Position.X,ae.Position.Y+ae.Size.Y/2+kU,ae.Position.Z)
g4,bv,ej=math.max(ae.Size.X,ae.Size.Z)/2,ae,ae.Name end end if not bu then f("COLLECT: pad not found - stand on it and tap SET PAD")return end
local el=ac()cj(bt,bu)if bv and type(firetouchinterest)=="function"then pcall(firetouchinterest,g3,bv,0)end
az(e.PadDwell)if bv and type(firetouchinterest)=="function"then pcall(firetouchinterest,g3,bv,1)end
az(0.5)a.collected=a.collected+1 local em=ac()f(("COLLECTED (%s) %s"):format(ej,(el and em and em>el)and("+$"..ab(em-el))or"no cash change seen"))
kO(bt,bu,g4)end local bw local function g5()if a.capHit then if e.AutoStart and g()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 f("trying again after being stopped for 5 minutes")bw(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not aA()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=aB(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(e.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end local en,g6=dd()local cG=u()if cG then local bx=C(t(cG))if not aa(cG)then local eo=(l.gift and t(l.gift)==t(cG)and g()-l.giftAt<600)and"gift"or"not ticked"
if not e.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bx,eo),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bx,eo),"bad"
end return"sell",("selling %s (%s)"):format(bx,eo),"warn"end if en<1 then return nil,("holding %s - 0 free stations"):format(bx),"wait"end
return"place",("waxing %s (%d free)"):format(bx,en),"ok"end a.holding=false if e.Crates and not d.waiting and g()-(d.scanAt or 0)>1 then
d.scanAt=g()local g7=a.plot:FindFirstChild("CrateStand")if g7 then for m6,by in ipairs(g7:GetChildren())do
if gw(by.Name)then local g8=false for m7,g9 in ipairs(by:GetDescendants())do if g9:IsA("ProximityPrompt")and g9 .Enabled then g8=true break end
end if g8 then local kV=c1(by.Name):gsub("crate$","")local ep for g_ in pairs(o.members)do if c1(g_)==kV then ep=g_ end end
d.waiting,d.at=true,g()d.title=(ep or by.Name).." Crate"d.data={name=by.Name,rarity=ep,title=d.title}
f(d.title.." found sitting on your stand")break end end end end end if e.Crates and(d.on or d.waiting)then
local P=d.title if g()<(d.ignoreUntil or 0)then return nil,("%s - its buttons do not respond to me, press Open or Discard yourself"):format(P),"bad"
end local eq,ha=j_(d.data)if d.on then if a.crateFails>=3 then d.ignoreUntil,a.crateFails=g()+120,0
f("could not press the "..P.." buttons 3 times - leaving it to you for 2 min")return nil,("%s window open - press Open or Discard yourself"):format(P),"bad"
end if g()-d.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(P),"bad"
end if eq then return"crate",("opening %s for %s"):format(P,ha),"ok"end if e.SellJunk then return"nocrate",("discarding %s - nothing ticked inside"):format(P),"warn"end
return nil,("%s open - nothing ticked inside it"):format(P),"idle"end if not eq and not e.SellJunk then
return nil,("%s waiting - nothing ticked inside, left alone"):format(P),"idle"end if d.summonFails>=3 then
return nil,("%s waiting - could not open it, open it by hand then DUMP"):format(P),"bad"
end if g()-d.lastFail<8 then return nil,("%s waiting - retrying shortly"):format(P),"wait"
end return"cratewin",("%s waiting - going to open it%s"):format(P,eq and(" for "..ha)or" to discard"),"ok"
end if d.rolled and not d.waiting and g()-d.rolledAt<6 then return nil,d.rolled.." rolled - waiting for it to land","wait"
end if en<1 then a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(g6,g6),"wait"
end local er=dj()if not er then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end
local bz=bb()if bz and gw(bz.name)then a.matchSince=nil if not e.Crates then return nil,("%s on the pad - crate opening is off"):format(bz.name),"idle"end
if g()-d.lastFail<8 then return nil,("%s on the pad - could not open it"):format(bz.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(bz.name),"ok"end local ar=dR()
if ar.state~="match"then a.matchSince=nil if ar.state=="skip"and not er.Enabled then return nil,ar.text.." (sold out)","idle"end
return nil,ar.text,ar.level end if not er.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local bA=g()if bA<a.noCashUntil then local hb,kW=f7()if hb then return nil,("cash short: have $%s, price ~$%s"):format(ab(hb),ab(kW)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(ab(ac()),math.ceil(a.noCashUntil-bA)),"bad"
end if bA-a.lastBuyAt<e.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or bA
local hc=bA-a.matchSince if hc<e.Confirm then return nil,("confirming %s (%.2fs)"):format(ar.shown,hc),"ok"end
return"buy",("buying %s via %s"):format(ar.shown,ar.src),"ok"end local function Q(kX,kY,...)
if a.busy then return end a.busy,a.busyText=true,kX local kZ,hd=pcall(kY,...)a.busy,a.busyText=false,""
if not kZ and hd~=cZ then f("ERR "..tostring(hd))end end local function k0()local aW,k1,k2=g5()
a.reason,a.level=k1,k2 if aW=="place"then Q("waxing...",gt)elseif aW=="crate"then Q("opening crate...",d8,true)
elseif aW=="cratewin"then Q("opening the crate window...",gQ)elseif aW=="nocrate"then Q("discarding crate...",d8,false)
elseif aW=="sell"then Q("selling...",gZ)elseif aW=="buy"then Q("buying...",go,false)elseif e.Collect and not a.matchSince and g()-a.lastCollect>=e.Every then
Q("collecting money...",kT)end end function bw(cH,k3)if cH==a.running then return end a.running=cH
if not k3 then e.AutoStart=cH end if cH then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
d.lastFail,d.summonFails,d.ignoreUntil=0,0,0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=g()
a.plot=aB()or a.plot f("START")else a.reason="stopped"f("STOP")end end local function he()
local es={}local function i(k4)es[#es+1]=tostring(k4)end i("=== SAB "..ax.." DUMP "..os.date("%H:%M:%S").." ===")
i(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
i("reason: "..tostring(a.reason))i("targets: "..table.concat(fI(),", "))i(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
i("cash="..ab(ac()))local k5,hf=u()i("in hands: "..tostring(k5)..(hf and(" ("..hf.ClassName..")")or"")..
"  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-g())))
i("  attribute SquishyEquipped = "..tostring(v:GetAttribute("SquishyEquipped")))local hg=a.plot and a.plot:FindFirstChild("SquishyEquipped")
i("  plot.SquishyEquipped = "..(hg and(#hg:GetChildren().." children")or"missing"))local et=v.Character
if et then local eu={}for m8,bB in ipairs(et:GetDescendants())do if(bB:IsA("Model")or bB:IsA("Tool"))and bB.Name~=et.Name then eu[#eu+1]=bB.ClassName..":"..bB.Name end
end i("  on the character: "..(table.concat(eu,", "):sub(1,300)))end local cI=bb()i("on pad: "..(cI and("%s [%s] %s"):format(cI.name,tostring(cI.rar),tostring(cI.price))or"nothing"))
i("sell spot: "..(a.sellSpot and V(a.sellSpot)or"none found"))i("--- CRATES ---")i(("waiting=%s windowOpen=%s title=%s rolled=%s (%ss ago) opened=%d tapWay=%s fails=%d/%d"):format(
tostring(d.waiting),tostring(d.on),d.title,tostring(d.rolled),d.rolledAt>0 and string.format("%.0f",g()-d.rolledAt)or"-",
a.crates,tostring(a.tapWay),a.crateFails,d.summonFails))local cJ=gN()i("crate prompt: "..(cJ and(V(cJ).." ["..cJ.ActionText.."|"..cJ.ObjectText.."]")or"none found"))
local hh=a.plot and a.plot:FindFirstChild("CrateStand")if hh then local ev=0 for m9,aJ in ipairs(hh:GetDescendants())do
ev=ev+1 if ev>30 then i("  ...")break end local hi=""if aJ:IsA("ProximityPrompt")then hi=(" [%s|%s|on=%s|hold=%.2f]"):format(aJ.ActionText,aJ.ObjectText,tostring(aJ.Enabled),aJ.HoldDuration)end
i("  CrateStand/"..V(aJ):gsub("^.-CrateStand%.","").." ("..aJ.ClassName..")"..hi)end else
i("  no CrateStand in the plot")end i("enabled prompts in the plot:")if a.plot then for m_,aX in ipairs(a.plot:GetDescendants())do
if aX:IsA("ProximityPrompt")and aX.Enabled then i(("  %s [%s|%s] safe=%s"):format(V(aX),aX.ActionText,aX.ObjectText,tostring(d6(aX))))
end end end local hj=v:FindFirstChildOfClass("PlayerGui")if hj then i("buttons on screen that say open/discard:")
for na,bC in ipairs(hj:GetDescendants())do if bC:IsA("GuiButton")and gA(bC)then local ew=gB(bC)
if ew:find("open",1,true)or ew:find("discard",1,true)then i(("  %s %s -> %q"):format(bC.ClassName,V(bC),ew))
end end end end i("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(ct~=nil))
i("--- CATALOG ("..o.n.." butters, worst rarity first) ---")for nb,cK in ipairs(o.rarOrder)do
local ex={}for nc,hk in ipairs(o.members[cK]or{})do ex[#ex+1]=(e.Targets[hk]and"*"or"")..C(hk)
end i(("  [%s]%s %s"):format(cK,y.price[cK]and(" crate $"..ab(y.price[cK]))or"",table.concat(ex,", ")))
end i("learned orders: ")for k6,k7 in pairs(y.order)do i("  "..k6 ..": "..table.concat(k7,", "))end
i("--- PLOT ---")i("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for nd,ey in ipairs(a.plot:GetChildren())do
i(("  %s %s (%d)"):format(ey.ClassName,ey.Name,#ey:GetChildren()))end local k8,k9=dd()i(("stations free %d / %d"):format(k8,k9))
local ez=dj()i("BuyPrompt: "..(ez and("enabled="..tostring(ez.Enabled).." hold="..ez.HoldDuration)or"MISSING"))
end i("autostart="..tostring(e.AutoStart).." rejoin="..tostring(e.Rejoin))i(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))i("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#dE())i("--- COLLECT PAD ---")
i("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and V(a.padPart)or"none"))
i("--- ATTRIBUTES ---")for ne,hl in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
i(("  %s = %s"):format(hl,tostring(v:GetAttribute(hl))))end i("--- EVENTS ---")for k_=math.max(1,#ay-15),#ay do i("  "..ay[k_])end
i("--- LOG ---")for la=math.max(1,#ah-25),#ah do i("  "..ah[la])end return table.concat(es,"\n")
end do local as=dD(F.auto)if type(as)=="string"then as=as:gsub("%s+$","")if as~=""then a.autoload=as
local lb=fS(as)f(lb and("loaded config "..as)or("config "..as.." could not be loaded"))
end end end local c={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local lc={ok=c.good,wait=c.warn,warn=c.warn,bad=c.bad,idle=c.dim}
local ld={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function k(le,lf,lg)
local lh,eA=pcall(Instance.new,le)if not lh then a.uiErrs=a.uiErrs+1 return nil end for li,lj in pairs(lf)do
if not pcall(function()eA[li]=lj end)then a.uiErrs=a.uiErrs+1 end end eA.Parent=lg return eA
end local function H(lk,ll)k("UICorner",{CornerRadius=UDim.new(0,ll or 6)},lk)end local b={}
local eB=v:FindFirstChildOfClass("PlayerGui")or v:WaitForChild("PlayerGui")local hm=eB:FindFirstChild("SABFarmGui")
if hm then hm:Destroy()end local eC=k("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},eB)
local A={w=320,h=330,head=30,strip=38,tabs=26}b.root=k("Frame",{Name="Root",Size=UDim2 .new(0,A.w,0,A.h),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=c.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},eC)
H(b.root,10)k("UIStroke",{Color=c.line,Thickness=1},b.root)local aY=UDim2 .new(1,0,1,0)
local function q(hn,ho)return UDim2 .new(hn,0,0,0),UDim2 .new(ho,(hn+ho>0.99)and 0 or-4,1,0)end
local function m(lm,ln,lo,lp,lq,lr)local hp=k("TextButton",{Text=ln,Position=lq,Size=lr,BackgroundColor3=lo,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=lp,TextColor3=c.text,AutoButtonColor=true},lm)H(hp,6)
return hp end local function hq(ls,lt,lu,lv,lw)local eD=k("TextBox",{Text=lt,PlaceholderText=lu,Position=lv,Size=lw,BackgroundColor3=c.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=c.text,PlaceholderColor3=c.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},ls)H(eD,6)k("UIPadding",{PaddingLeft=UDim.new(0,8)},eD)
return eD end local cL=bQ.CurrentCamera local function lx()local ly,cM=pcall(function()return cL and cL.ViewportSize end)
if ly and cM and cM.X>50 and cM.Y>50 then return cM end end local function au(bD)local eE=lx()
if not(eE and bD and bD.Parent)then return end local lz=pcall(function()local cN,hr=bD.AbsolutePosition,bD.AbsoluteSize
local eF=70 local hs=math.clamp(cN.X,eF-hr.X,eE.X-eF)local ht=math.clamp(cN.Y,0,eE.Y-math.min(hr.Y,eF))
if math.abs(hs-cN.X)>0.5 or math.abs(ht-cN.Y)>0.5 then bD.Position=UDim2 .new(0,math.floor(hs),0,math.floor(ht))
end end)return lz end local function cO(lA)local lB,eG=pcall(function()return lA.AbsolutePosition end)
if lB and eG then return{math.floor(eG.X),math.floor(eG.Y)}end end local cP={}local function hu(cQ,hv,hw)
L(cQ.InputBegan:Connect(function(bE)if bE.UserInputType~=Enum.UserInputType.MouseButton1 and bE.UserInputType~=Enum.UserInputType.Touch then return end
cP[cQ]={start=bE.Position,from=hv.Position,moved=0,target=hv}local eH eH=bE.Changed:Connect(function()
if bE.UserInputState==Enum.UserInputState.End then local hx=cP[cQ]cP[cQ]=nil if eH then eH:Disconnect()end
if hx and hw then hw(hx.moved)end end end)end))end L(il.InputChanged:Connect(function(cR)
if cR.UserInputType~=Enum.UserInputType.MouseMovement and cR.UserInputType~=Enum.UserInputType.Touch then return end
for nf,af in pairs(cP)do local eI=af.target if eI and eI.Parent then local hy,hz=cR.Position.X-af.start.X,cR.Position.Y-af.start.Y
af.moved=math.max(af.moved,math.abs(hy)+math.abs(hz))eI.Position=UDim2 .new(af.from.X.Scale,af.from.X.Offset+hy,af.from.Y.Scale,af.from.Y.Offset+hz)
end end end))local function x(lC,lD,lE,lF,lG,lH,lI)return k("TextLabel",{Text=lD,Position=lH or UDim2 .new(0,0,0,0),Size=lI or aY,BackgroundTransparency=1,
Font=lG and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=lE,TextColor3=lF,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},lC)
end b.title=k("Frame",{Size=UDim2 .new(1,0,0,A.head),BackgroundColor3=c.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=k("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=c.dim,BorderSizePixel=0},b.title)
H(b.dot,5)x(b.title,"SAB  BUTTER FARM  "..ax,12,c.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=m(b.title,"-",c.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=m(b.title,"X",c.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=k("Frame",{Position=UDim2 .new(0,0,0,A.head),Size=UDim2 .new(1,0,0,A.strip),BackgroundColor3=c.bg,BorderSizePixel=0},b.root)
b.bar=k("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=c.warn,BorderSizePixel=0},b.strip)
H(b.bar,2)b.reason=x(b.strip,"starting",12,c.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=k("Frame",{Position=UDim2 .new(0,0,0,A.head+A.strip),Size=UDim2 .new(1,0,0,A.tabs),BackgroundTransparency=1},b.root)
b.tabFarm=m(b.tabs,"FARM",c.accent,11,UDim2 .new(0,8,0,0),UDim2 .new(0.34,-10,1,-4))b.tabBut=m(b.tabs,"BUTTERS",c.panel2,11,UDim2 .new(0.34,2,0,0),UDim2 .new(0.33,-6,1,-4))
b.tabSet=m(b.tabs,"SETUP",c.panel2,11,UDim2 .new(0.67,2,0,0),UDim2 .new(0.33,-10,1,-4))
local function eJ()local eK=k("ScrollingFrame",{Position=UDim2 .new(0,0,0,A.head+A.strip+A.tabs),Size=UDim2 .new(1,0,1,-(A.head+A.strip+A.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=c.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)k("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},eK)
k("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},eK)
return eK end b.farm,b.but,b.set=eJ(),eJ(),eJ()b.but.Visible,b.set.Visible=false,false local cS,bF,j=0,12,nil
local function I(hA,lJ)cS,bF=cS+1,bF+hA+6 return k("Frame",{Size=UDim2 .new(1,0,0,hA),BackgroundTransparency=1,LayoutOrder=cS},lJ or b.farm)
end local function bG(lK)x(I(14),lK,10,c.dim,true)end j=I(34)b.startB=m(j,"START",c.good,14,q(0,0.68))
b.killB=m(j,"KILL",c.bad,14,q(0.68,0.32))local lL=I(42)local function bH(hB,lM,eL)local eM=k("Frame",{Position=UDim2 .new((hB-1)/eL,0,0,0),Size=UDim2 .new(1/eL,hB<eL and-4 or 0,1,0),
BackgroundColor3=c.panel,BorderSizePixel=0},lL)H(eM,6)local hC=x(eM,"0",15,c.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local lN=x(eM,lM,9,c.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))hC.TextXAlignment,lN.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return hC end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=bH(1,"BOUGHT",5),bH(2,"WAXED",5),bH(3,"SOLD",5),bH(4,"MONEY",5),bH(5,"FREE",5)
b.info=x(I(40),"",10,c.dim,false)b.tgt=x(I(26),"",10,c.good,false)bG("MONEY COLLECT")j=I(28)
b.secB=hq(j,tostring(e.Every),"60",q(0,0.2))x(j,"sec",11,c.dim,false,q(0.21,0.09))b.secSet=m(j,"SET",c.accent,12,q(0.3,0.2))
b.colT=m(j,"COLLECT: ON",c.accent,11,q(0.5,0.5))j=I(26)b.padB=m(j,"SET PAD (stand on it)",c.panel2,10,q(0,0.55))
b.padL=x(j,"",10,c.dim,false,q(0.56,0.44))bG("BUTTERS YOU DID NOT TICK, AND CRATES")j=I(28)
b.sellT=m(j,"SELL THEM: ON",c.accent,11,q(0,0.55))b.sellB=m(j,"SELL NOW",c.warn,11,q(0.55,0.45))
j=I(28)b.crateT=m(j,"OPEN CRATES: ON",c.accent,11,q(0,0.55))b.crateB=m(j,"OPEN NOW",c.warn,11,q(0.55,0.45))
bG("TOOLS")j=I(30)b.buyB=m(j,"BUY NOW",c.warn,11,q(0,0.28))b.plB=m(j,"WAX",c.good,11,q(0.28,0.24))
b.dumpB=m(j,"DUMP",c.accent,11,q(0.52,0.24))b.copyB=m(j,"COPY",c.panel2,11,q(0.76,0.24))
bG("LOG")b.log=k("TextLabel",{Size=aY,BackgroundColor3=c.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=c.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},I(84))H(b.log,6)k("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},b.log)
bG("OUTPUT  (DUMP result)")b.out=k("TextBox",{Size=aY,BackgroundColor3=c.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},I(110))H(b.out,6)
b.farm.CanvasSize=UDim2 .new(0,0,0,bF)cS,bF=0,12 local function K(lO)return I(lO,b.set)end
local function cT(lP)x(K(14),lP,10,c.dim,true)end cT("SETTINGS FILE  (saved on your phone)")
j=K(28)b.cfgName=hq(j,"default","config name",q(0,0.5))b.cfgSave=m(j,"SAVE",c.good,11,q(0.5,0.25))
b.cfgLoad=m(j,"LOAD",c.accent,11,q(0.75,0.25))j=K(26)b.cfgPrev=m(j,"<",c.panel2,11,q(0,0.13))
b.cfgPick=m(j,"(none saved)",c.panel2,10,q(0.13,0.74))b.cfgNext=m(j,">",c.panel2,11,q(0.87,0.13))
j=K(26)b.cfgAuto=m(j,"LOAD IT ON LAUNCH: OFF",c.panel2,10,q(0,1))b.cfgMsg=x(K(26),"",10,c.dim,false)
cT("START BY ITSELF")j=K(26)b.autoB=m(j,"INSTALL F.exec",c.accent,10,q(0,1))b.autoMsg=x(K(30),"",10,c.dim,false)
j=K(28)b.startT=m(j,"START FARMING ON LOAD: ON",c.accent,10,q(0,1))x(K(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,c.dim,false)
cT("IF THE GAME DROPS ME")j=K(28)b.rejT=m(j,"AUTO REJOIN: ON",c.accent,11,q(0,0.55))b.rejB=m(j,"REJOIN NOW",c.warn,11,q(0.55,0.45))
b.rejMsg=x(K(30),"",10,c.dim,false)cT("THE ROUND SAB BUTTON")x(K(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,c.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,bF)local hD=k("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},eB)
b.tgRoot=k("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=c.accent,BorderSizePixel=0,Active=true},hD)H(b.tgRoot,26)k("UIStroke",{Color=c.line,Thickness=1},b.tgRoot)
b.tgBtn=k("TextButton",{Text="SAB",Size=aY,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=c.text,AutoButtonColor=false},b.tgRoot)b.tgDot=k("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=c.dim,
BorderSizePixel=0},b.tgRoot)H(b.tgDot,4)local ag={built=false,boxes={},at=0}local function hE(hF,eN)
e.Targets[hF]=eN or nil local eO=ag.boxes[hF]if eO then eO.Text=eN and"X"or""eO.BackgroundColor3=eN and c.good or c.panel2
end end local function eP()for lQ,hG in pairs(ag.boxes)do local hH=e.Targets[lQ]==true hG.Text=hH and"X"or""
hG.BackgroundColor3=hH and c.good or c.panel2 end end local bI local function lR()local lS=0
local eQ=k("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=x(eQ,"",10,c.dim,false,q(0,0.5))local lT=m(eQ,"CLEAR",c.panel2,10,q(0.5,0.24))
local lU=m(eQ,"REFRESH",c.panel2,10,q(0.74,0.26))lT.MouseButton1Click:Connect(function()
for lV in pairs(e.Targets)do e.Targets[lV]=nil end eP()end)lU.MouseButton1Click:Connect(function()
o.at=0 dC()bI(true)end)return lS end bI=function(lW)if not dC()then if not b.butEmpty then
b.butEmpty=x(k("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,c.warn,false)end return
end if ag.built and not lW and ag.at==o.at then return end for ng,eR in ipairs(b.but:GetChildren())do
if eR:IsA("Frame")or eR:IsA("TextButton")then eR:Destroy()end end ag.boxes,b.butEmpty={},nil
lR()local eS,eT=36,1 local function hI(hJ)eT=eT+1 local lX=k("Frame",{Size=UDim2 .new(1,0,0,hJ),BackgroundTransparency=1,LayoutOrder=eT},b.but)
eS=eS+hJ+6 return lX end for nh,cU in ipairs(o.rarOrder)do local lY=hI(24)local lZ=ld[cU]or c.text
local eU=k("Frame",{Size=aY,BackgroundColor3=c.panel,BorderSizePixel=0},lY)H(eU,6)x(eU,"  "..cU:upper(),11,lZ,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local l0=m(eU,"ALL",c.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local l1=cU
l0 .MouseButton1Click:Connect(function()local hK=o.members[l1]or{}local hL=false for ni,l2 in ipairs(hK)do if not e.Targets[l2]then hL=true break end end
for nj,l3 in ipairs(hK)do hE(l3,hL)end end)for nk,eV in ipairs(o.members[cU]or{})do local l4=hI(22)
local cV=k("TextButton",{Text="",Size=aY,BackgroundColor3=c.bg,BorderSizePixel=0,AutoButtonColor=true},l4)
H(cV,5)x(cV,"   "..C(eV),11,c.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local eW=k("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=c.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=c.text,AutoButtonColor=false},cV)
H(eW,4)ag.boxes[eV]=eW local hM=eV local function hN()hE(hM,not e.Targets[hM])end cV.MouseButton1Click:Connect(hN)
eW.MouseButton1Click:Connect(hN)end end eP()b.but.CanvasSize=UDim2 .new(0,0,0,eS+10)ag.built,ag.at=true,o.at
end local hO="farm"local function bJ(av)hO=av b.farm.Visible,b.but.Visible,b.set.Visible=(av=="farm"),(av=="but"),(av=="set")
b.tabFarm.BackgroundColor3=(av=="farm")and c.accent or c.panel2 b.tabBut.BackgroundColor3=(av=="but")and c.accent or c.panel2
b.tabSet.BackgroundColor3=(av=="set")and c.accent or c.panel2 if av=="but"then bI(false)end
end local function D(hP,hQ,l5,l6)hP.Text=hQ and l5 or l6 hP.BackgroundColor3=hQ and c.accent or c.panel2
end local function l7()b.secB.Text=tostring(e.Every)D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")
D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if e.AutoStart~=a.running then bw(e.AutoStart,true)end if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end au(b.root)
au(b.tgRoot)a.lastCollect=g()eP()end local function l8(hR)task.spawn(function()hR.TextColor3=c.bad
task.wait(0.8)if a.alive then hR.TextColor3=c.text end end)end local function hS()local hT=b.secB.Text:match("^%s*(%d+)%s*$")
local bK=hT and tonumber(hT)if not bK or bK<1 then b.secB.Text=tostring(e.Every)l8(b.secB)
f("interval must be a whole number >= 1")return end if bK==e.Every then return end e.Every,a.lastCollect=bK,g()
f("collect every "..bK.."s")end local function hU(l9)local hV=setclipboard or toclipboard
return type(hV)=="function"and pcall(hV,l9)end local function l_()local eX=ai~=""and ai or(a.reason.."\n"..table.concat(ah,"\n"))
if hU(eX)then f("copied "..#eX.." chars")return end b.out.Text=eX pcall(function()b.out:CaptureFocus()end)
f("no clipboard here - select the text in OUTPUT")end local function ma()local mb,hW=pcall(he)
ai=mb and hW or("DUMP ERROR "..tostring(hW))local hX=hU(ai)b.out.Text=(hX and#ai>7000)and(ai:sub(1,7000).."\n... (full text is on your clipboard)")or ai
f("DUMP "..#ai.." chars"..(hX and", copied"or""))end local function r(mc,md)L(mc.MouseButton1Click:Connect(md))end
r(b.secSet,hS)L(b.secB.FocusLost:Connect(hS))r(b.colT,function()e.Collect,a.lastCollect=not e.Collect,g()
D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")end)r(b.sellT,function()e.SellJunk=not e.SellJunk
D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)r(b.sellB,function()a.sellFails=0
task.spawn(Q,"selling...",gZ)end)r(b.crateT,function()e.Crates=not e.Crates D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)r(b.crateB,function()d.lastFail,d.summonFails,d.ignoreUntil,a.crateFails=0,0,0,0 task.spawn(Q,"opening crate...",d8,true)
end)r(b.padB,function()a.plot=aB()or a.plot local hY,eY=aA(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(hY and eY and eY:IsA("BasePart"))then f("SET PAD: need character and plot")return end
a.manualPad=eY.CFrame:ToObjectSpace(hY.HumanoidRootPart.CFrame)kJ(a.manualPad)f("collect pad saved at your position")
end)r(b.startB,function()bw(not a.running)end)r(b.buyB,function()a.plot=aB()or a.plot task.spawn(Q,"buying (manual)...",go,true)
end)r(b.plB,function()a.plot=aB()or a.plot task.spawn(Q,"waxing (manual)...",gt)end)r(b.dumpB,ma)
r(b.copyB,l_)r(b.tabFarm,function()bJ("farm")end)r(b.tabBut,function()bJ("but")end)r(b.tabSet,function()bJ("set")end)
local function hZ(eZ)a.hidden=eZ b.root.Visible=not eZ b.tgBtn.Text=eZ and"SAB+"or"SAB"
end hu(b.tgRoot,b.tgRoot,function(me)au(b.tgRoot)a.togPos=cO(b.tgRoot)or a.togPos if me<8 then hZ(not a.hidden)end
end)r(b.tgBtn,function()hZ(not a.hidden)end)local J,E={},0 local function aw()J=dE()if#J==0 then
b.cfgPick.Text="(none saved)"E=0 return end if E<1 or E>#J then E=1 end b.cfgPick.Text=J[E]..("  (%d/%d)"):format(E,#J)
end local function h0()local h1=a.autoload~=nil b.cfgAuto.Text=h1 and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
b.cfgAuto.BackgroundColor3=h1 and c.accent or c.panel2 end local function e0()local h2=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if h2~=""then return h2 end return(E>0 and J[E])or""end r(b.cfgSave,function()a.winPos=cO(b.root)or a.winPos
a.togPos=cO(b.tgRoot)or a.togPos local h3,h4=dH(e0())b.cfgMsg.Text=h3 and("saved as "..h4)or("could not save: "..h4)
b.cfgMsg.TextColor3=h3 and c.good or c.bad aw()f(b.cfgMsg.Text)end)local function mf(h5)
local e1,h6=fS(h5)b.cfgMsg.Text=e1 and("loaded "..h6)or("could not load: "..h6)b.cfgMsg.TextColor3=e1 and c.good or c.bad
if e1 then b.cfgName.Text=h5 l7()end f(b.cfgMsg.Text)end r(b.cfgLoad,function()mf(e0())end)
r(b.cfgPick,function()aw()if E>0 then b.cfgName.Text=J[E]end end)r(b.cfgPrev,function()
if#J==0 then aw()return end E=(E-2)%#J+1 aw()b.cfgName.Text=J[E]end)r(b.cfgNext,function()
if#J==0 then aw()return end E=E%#J+1 aw()b.cfgName.Text=J[E]end)r(b.cfgAuto,function()if a.autoload then
fU(nil)b.cfgMsg.Text="it will not load a config on launch"else local bL=e0()local h7=false
for nl,mg in ipairs(dE())do if mg==bL then h7=true end end local mh=h7 or dH(bL)if mh and bL~=""then
fU(bL)aw()b.cfgMsg.Text=bL.." will load every time the script starts"else b.cfgMsg.Text="name the config and save it first"
end end b.cfgMsg.TextColor3=c.dim h0()end)r(b.autoB,function()local h8,h9=js()b.autoMsg.Text=h8 and("installed. "..h9)or("failed: "..h9)
b.autoMsg.TextColor3=h8 and c.good or c.bad f(b.autoMsg.Text)end)r(b.startT,function()e.AutoStart=not e.AutoStart
D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)r(b.rejT,function()
e.Rejoin=not e.Rejoin D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)r(b.rejB,function()cc("you asked")end)
local aZ=false r(b.minB,function()aZ=not aZ b.tabs.Visible=not aZ if aZ then b.farm.Visible,b.but.Visible,b.set.Visible=false,false,false
else bJ(hO)end b.root.Size=UDim2 .new(0,A.w,0,aZ and(A.head+A.strip)or A.h)b.minB.Text=aZ and"+"or"-"
end)local function cW()if not a.alive then return end a.alive,a.running=false,false pcall(dl)
for nm,mi in ipairs(c0)do pcall(function()mi:Disconnect()end)end pcall(function()eC:Destroy()end)
pcall(function()hD:Destroy()end)if aK.SAB_KILL==cW then aK.SAB_KILL=nil end end aK.SAB_KILL=cW
r(b.killB,cW)r(b.xB,cW)hu(b.title,b.root,function()au(b.root)a.winPos=cO(b.root)or a.winPos
end)local function h_()local bM,bN=a.reason,a.level if a.busy then bM,bN=a.busyText,"ok"
elseif not a.running then local nn,ia,mj=g5()if a.capHit then bM,bN=ia,"bad"else bM,bN="[stopped] "..ia,(mj=="bad")and"bad"or"idle"end
a.reason,a.level=bM,bN end b.reason.Text=bM b.bar.BackgroundColor3=lc[bN]or c.dim b.dot.BackgroundColor3=a.running and c.good or(a.capHit and c.bad or c.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and c.panel2 or c.accent
b.startB.Text=a.running and"STOP"or"START"D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and c.warn or c.good local mk,ml=dd()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),mk.."/"..ml local ib=(a.running and e.Collect)and math.max(0,math.ceil(e.Every-(g()-a.lastCollect)))or nil
local ic=u()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
ab(ac()),a.rolls,a.gifts,a.crates,ic and C(t(ic))or"nothing",d.on and("   ["..d.title.." window open]")or"",
ib and("in "..ib.."s")or"off")local a0=fI()b.tgt.Text=(#a0==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#a0<=3)and table.concat(a0,", ")or(#a0 .." butters ticked")))b.tgt.TextColor3=(#a0==0)and c.bad or c.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(bR,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(o.n,#o.rarOrder,#a0)
end if b.but.Visible and ag.at~=o.at then bI(false)end end aK.SAB={S=a,CFG=e,EV=l,U=b,sg=eC,dump=he,CAT=o,LEARN=y,buildList=bI}
f(ax.." loaded")if a.uiErrs>0 then f("UI: "..a.uiErrs.." properties skipped")end bJ("farm")
au(b.root)au(b.tgRoot)if cL then pcall(function()L(cL:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)au(b.root)au(b.tgRoot)end))end)end aw()h0()if a.config and a.config~=""then b.cfgName.Text=a.config end
D(b.colT,e.Collect,"COLLECT: ON","COLLECT: OFF")D(b.sellT,e.SellJunk,"SELL THEM: ON","SELL THEM: OFF")
D(b.crateT,e.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")D(b.rejT,e.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
D(b.startT,e.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")b.secB.Text=tostring(e.Every)
pcall(h_)task.spawn(function()local id=dJ()b.rejMsg.Text=id and("after a rejoin it restarts from\n"..id)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(dD(F.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(jy)end)task.spawn(function()while a.alive do local mm,mn=pcall(h_)if not mm then f("UI ERR "..tostring(mn))end
task.wait(0.25)end end)task.spawn(function()local mo,mp=pcall(jH)if not mo then f("HOOK ERR "..tostring(mp))end
end)task.spawn(function()pcall(iK)if dC()then f(("catalog: %d butters in %d rarities"):format(o.n,#o.rarOrder))end
local mq,ie=pcall(kL)if mq and ie and a.alive and not a.manualPad then a.manualPad=ie end
end)task.spawn(function()while a.alive do task.wait(20)pcall(dl)end end)if cY then L(v.Idled:Connect(function()pcall(function()cY:CaptureController()cY:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()if not e.AutoStart then return end a.reason,a.level="waiting for the game to load, then starting","wait"
for no=1,120 do if not a.alive then return end if a.running then return end a.plot=a.plot or aB()
if aA()and a.plot and next(e.Targets)then bw(true,true)f("started by itself")return end
task.wait(1)end if a.alive and not a.running then f("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=aB()a.lastCollect=g()while a.alive do if a.running then
local mr,ig=pcall(k0)if not mr and ig~=cZ then f("LOOP ERR "..tostring(ig))end end task.wait(0.1)
end end)cX("loaded - window is at the top left")end local mt,e2=xpcall(ik,function(ms)return tostring(ms).."\n"..debug.traceback()end)
if not mt then pcall(function()warn("SAB "..ax.." ERROR: "..tostring(e2))end)cX("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..ax.." ERROR: "..tostring(e2))end)pcall(function()local ih=(type(getgenv)=="function"and getgenv())or _G
if type(ih.SAB_KILL)=="function"then ih.SAB_KILL()end for np,mu in ipairs({"SABFarmGui","SABToggle"})do
local ii=v.PlayerGui:FindFirstChild(mu)if ii then ii:Destroy()end end end)pcall(function()
local bO=Instance.new("ScreenGui")bO.Name="SABError"bO.ResetOnSpawn=false bO.DisplayOrder=1000
local T=Instance.new("TextBox")T.Size=UDim2 .new(0,340,0,170)T.Position=UDim2 .new(0,10,0,50)
T.BackgroundColor3=Color3 .fromRGB(90,20,20)T.TextColor3=Color3 .new(1,1,1)T.TextSize=11
T.TextWrapped=true T.ClearTextOnFocus=false T.TextXAlignment=Enum.TextXAlignment.Left T.TextYAlignment=Enum.TextYAlignment.Top
T.Text="SAB "..ax.." failed to start. Send this text:\n"..tostring(e2)T.Parent=bO bO.Parent=v:WaitForChild("PlayerGui")
end)end
