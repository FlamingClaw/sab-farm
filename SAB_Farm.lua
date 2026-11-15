local au="v17"local eI=game:GetService("Players")local v=eI.LocalPlayer or eI.PlayerAdded:Wait()
local function cI(hO)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..au,Text=hO,Duration=6})
end)end cI("script started")local function hP()local bD=game:GetService("ReplicatedStorage")
local bE=game:GetService("Workspace")local hQ=game:GetService("UserInputService")local aF=(type(getgenv)=="function"and getgenv())or _G
if type(aF.SAB_KILL)=="function"then pcall(aF.SAB_KILL)end local f=(type(tick)=="function")and tick or os.clock
local cJ=(function()local hR,hS=pcall(function()return game:GetService("VirtualUser")end)return hR and hS or nil end)()
local d={Targets={applepie=true},Collect=true,Every=60,SellJunk=true,Crates=true,Rejoin=true,
AutoStart=true,Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,
capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,matchSince=nil,boot=f(),plot=nil,reason="starting",level="wait",
lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,
crates=0,crateFails=0,tapWay=nil,capAt=0,carrySrc=nil,carryBlind=0,attrStale=0,config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local l={name=nil,rar=nil,at=f(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local j={on=false,data=nil,at=0,title="crate",lastFail=0,padAt=0}
local cK={}local cL,bF,af,av={},{},{},{}local ag=""local function L(eJ)cL[#cL+1]=eJ return eJ end
local function aw(hT)task.wait(hT)if not a.alive then error(cK,0)end end local function e(bG)
bG=os.date("%H:%M:%S").." "..tostring(bG)table.insert(bF,1,bG)if#bF>6 then table.remove(bF)end
af[#af+1]=bG if#af>80 then table.remove(af,1)end end local function hU(eK)if type(eK)~="string"then return""end
return(eK:lower():gsub("[^%w]",""))end local function t(hV)local eL=hU(hV)local cM=eL:gsub("butter$","")
if cM==""then cM=eL end return cM end local function V(cN)return type(cN)=="string"and t(cN)~=""and d.Targets[t(cN)]==true end
local function hW(aV)aV=aV:lower()return aV:find("squishy",1,true)~=nil or aV:match("butter$")~=nil or aV:match("butter[^%a]")~=nil
end local cO={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function W(aW)
if type(aW)~="number"then return"?"end local bH=1 while math.abs(aW)>=1000 and bH<#cO do aW=aW/1000 bH=bH+1 end
local hX=string.format("%.2f",aW):gsub("%.?0+$","")return hX..cO[bH]end local function hY(eM)
if type(eM)~="string"then return nil end local hZ,eN=eM:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local cP=tonumber(hZ)if not cP then return nil end if eN==""then return cP end for h0,h1 in ipairs(cO)do if h1:lower()==eN:lower()then return cP*1000^(h0-1)end end
return nil end local function aa()local eO=v:GetAttribute("BoardValueMoney")if type(eO)=="number"then return eO end
local eP=v:FindFirstChild("leaderstats")if eP then for l0,h2 in ipairs({"Cash","Money","Coins"})do
local cQ=eP:FindFirstChild(h2)if cQ and type(cQ.Value)=="number"then return cQ.Value end
end end end local function aX(h3)local cR=h3:GetFullName()if a.plot then local cS=a.plot:GetFullName()
if cR:sub(1,#cS)==cS then return cR:sub(#cS+2)end end return cR end local function ax()
local bI=v.Character if bI and bI:FindFirstChild("HumanoidRootPart")then local eQ=bI:FindFirstChildOfClass("Humanoid")
if eQ and eQ.Health>0 then return bI end end end local function ay()local cT=bE:FindFirstChild("Plots")
if not cT then return nil end local function eR(h4)local eS=h4:FindFirstChild("Plate")return eS~=nil and eS:FindFirstChild("EditStackAttachment",true)~=nil
end local eT=v:GetAttribute("PlotNumber")if eT~=nil then local cU=cT:FindFirstChild(tostring(eT))
if cU and eR(cU)then return cU end end for l1,eU in ipairs(cT:GetChildren())do if eR(eU)then return eU end
end end local function aY(eV)local ah=eV and eV.Parent for l2=1,6 do if not ah then return nil end
if ah:IsA("BasePart")then return ah end if ah:IsA("Model")then return ah.PrimaryPart or ah:FindFirstChildWhichIsA("BasePart",true)end
ah=ah.Parent end end local function eW(eX)local cV=eX.Parent if cV and cV:IsA("Attachment")then return cV.WorldPosition end
local eY=aY(eX)return eY and eY.Position end local function h5()local aG=a.plot and a.plot:FindFirstChild("Plate")
if not aG then return nil end if aG:IsA("BasePart")then return aG.Position end if aG:IsA("Model")then return aG:GetPivot().Position end
local eZ=aG:FindFirstChildWhichIsA("BasePart",true)return eZ and eZ.Position end local function e0()
local cW={}local e1=a.plot and a.plot:FindFirstChild("WaxStations")if e1 then for l3,h6 in ipairs(e1:GetChildren())do
local e2=h6:FindFirstChild("SquishyPlaceHolder")local cX=e2 and e2:FindFirstChild("PlacePrompt")
if cX and cX:IsA("ProximityPrompt")then cW[#cW+1]=cX end end end return cW end local function cY()
local e3,cZ=e0(),0 for l4,h7 in ipairs(e3)do if h7 .Enabled then cZ=cZ+1 end end local c0=#e3
local c1=v:GetAttribute("WaxStations")if type(c1)=="number"and c1>c0 then c0=c1 end return cZ,c0
end local function h8()local e4=ax()local e5=e4 and e4 .HumanoidRootPart.Position local c2,e6
for l5,c3 in ipairs(e0())do if c3 .Enabled then local e7=eW(c3)local e8=(e7 and e5)and(e7-e5).Magnitude or 1e9
if not c2 or e8<e6 then c2,e6=c3,e8 end end end return c2 end local function bJ()local bK=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not bK then return nil end local e9=bK:FindFirstChild("BuyPromptAttachment")local bL=(e9 and e9:FindFirstChild("BuyPrompt"))or bK:FindFirstChild("BuyPrompt",true)
if bL and bL:IsA("ProximityPrompt")and bL:IsDescendantOf(bK)then return bL end end local h9={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local h_={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local y={order={},price={},dirty=false}local q={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local c4="SAB_order.txt"local function c5()if not y.dirty or type(writefile)~="function"then return end
local aZ={}for ia,ib in pairs(y.price)do aZ[#aZ+1]="P|"..ia.."|"..string.format("%.0f",ib)end
for ic,id in pairs(y.order)do aZ[#aZ+1]="O|"..ic.."|"..table.concat(id,",")end if pcall(writefile,c4,table.concat(aZ,"\n"))then y.dirty=false end
end local function ie()if type(isfile)~="function"or type(readfile)~="function"then return end
local ig,ih=pcall(isfile,c4)if not(ig and ih)then return end local ii,e_=pcall(readfile,c4)
if not(ii and type(e_)=="string")then return end for ij in e_:gmatch("[^\n]+")do local fa,fb,c6=ij:match("^(%a)|([^|]+)|(.*)$")
if fa=="P"then y.price[fb]=tonumber(c6)elseif fa=="O"and c6~=""then local bM={}for ik in c6:gmatch("[^,]+")do bM[#bM+1]=ik end
if#bM>0 then y.order[fb]=bM end end end end local function il(bN)if type(bN)~="table"then return end
local az,fc=bN.rarity,bN.contents if type(az)~="string"or az==""or type(fc)~="table"then return end
local a0={}for l6,bO in ipairs(fc)do if type(bO)=="table"and type(bO.butter)=="string"then
a0[#a0+1]={n=bO.butter,ch=tonumber(bO.chance)or 0}end end if#a0==0 then return end table.sort(a0,function(im,io)return im.ch>io.ch end)
local a1,a2={},false for ip,iq in ipairs(a0)do a1[ip]=iq.n end local c7=y.order[az]if not c7 or#c7~=#a1 then a2=true end
if not a2 then for fd=1,#a1 do if c7[fd]~=a1[fd]then a2=true break end end end y.order[az]=a1
local c8=tonumber(bN.price)if c8 and y.price[az]~=c8 then y.price[az]=c8 a2=true end if a2 then
y.dirty=true q.at=0 e("learned the "..az.." order from its crate")end end local function a3(ir,is)
local it=ir:FindFirstChild(is,true)local iu,c9=pcall(function()return it.Text end)return(iu and type(c9)=="string"and c9~="")and c9 or nil
end local function C(fe)return q.pretty[fe]or fe end local function iv()local ff=bD:FindFirstChild("Assets")
local fg=ff and ff:FindFirstChild("Squishies")if not fg then return false end local c_,fh,aH={},{},{}
local bP=0 for l7,bQ in ipairs(fg:GetChildren())do local a4=t(bQ.Name)if a4~=""and not c_[a4]then
local bR=a3(bQ,"RarityText")or"?"c_[a4]=bR fh[a4]=a3(bQ,"NameText")or bQ.Name aH[bR]=aH[bR]or{}
table.insert(aH[bR],a4)bP=bP+1 end end if bP==0 then return false end for fi,iw in pairs(aH)do
local fj=y.order[fi]or h_[fi]local da={}if fj then for ix,iy in ipairs(fj)do da[t(iy)]=ix end end
table.sort(iw,function(fk,fl)local db,dc=da[fk],da[fl]if db and dc then return db<dc end
if db then return true end if dc then return false end return C(fk)<C(fl)end)end local dd={}
for iz,iA in ipairs(h9)do dd[iA]=iz end local bS={}for iB in pairs(aH)do bS[#bS+1]=iB end
table.sort(bS,function(de,df)local dg,dh=y.price[de],y.price[df]if dg and dh and dg~=dh then return dg<dh end
local di,dj=dd[de],dd[df]if di and dj then return di<dj end if di then return true end if dj then return false end
return de<df end)q.rar,q.pretty,q.members,q.rarOrder,q.n,q.at=c_,fh,aH,bS,bP,f()return true
end local function dk()if q.at==0 or(f()-q.at)>120 then pcall(iv)end return q.n>0 end local function iC(iD)
local fm=t(iD)return q.rar[fm]or(l.name and t(l.name)==fm and l.rar)or"?"end local function fn()
local bT={}for iE,iF in pairs(d.Targets)do if iF then bT[#bT+1]=C(iE)end end table.sort(bT)
return bT end local F={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function fo()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function bU(fp)if type(makefolder)~="function"then return end local iG,iH=pcall(isfolder,fp)
if not(iG and iH)then pcall(makefolder,fp)end end local function dl(fq)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local iI,iJ=pcall(isfile,fq)if not(iI and iJ)then return nil end local iK,iL=pcall(readfile,fq)
return iK and iL or nil end local function bV(iM,iN)if type(writefile)~="function"then return false end
return(pcall(writefile,iM,iN))end local function fr(iO)local a5={}if type(listfiles)~="function"then return a5 end
local iP,fs=pcall(listfiles,iO)if not iP or type(fs)~="table"then return a5 end for l8,iQ in ipairs(fs)do a5[#a5+1]=tostring(iQ)end
return a5 end local function dm()local bW={}for l9,iR in ipairs(fr(F.cfg))do local ft=iR:match("([^/\\]+)%.txt$")
if ft then bW[#bW+1]=ft end end table.sort(bW)return bW end local function iS()local M={"V|1"}
M[#M+1]="N|Every|"..tostring(d.Every)for l_,fu in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart"})do
M[#M+1]="B|"..fu.."|"..(d[fu]and"1"or"0")end if a.winPos then M[#M+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then M[#M+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end local bX={}for iT,iU in pairs(d.Targets)do if iU then bX[#bX+1]=iT end end
table.sort(bX)for ma,iV in ipairs(bX)do M[#M+1]="T|"..iV end return table.concat(M,"\n")
end local function iW(dn)if type(dn)~="string"or dn==""then return false end local fv,fw={},false
for iX in dn:gmatch("[^\n]+")do local a6,aA,bY=iX:match("^(%a)|([^|]*)|?(.*)$")if a6=="N"and aA=="Every"then
local dp=tonumber(bY)if dp and dp>=1 then d.Every=math.floor(dp)end elseif a6=="B"then if d[aA]~=nil then d[aA]=(bY=="1")end
elseif a6=="W"then a.winPos={tonumber(aA)or 10,tonumber(bY)or 44}elseif a6=="G"then a.togPos={tonumber(aA)or 10,tonumber(bY)or 300}
elseif a6=="T"and aA~=""then fv[aA]=true fw=true end end if fw then d.Targets=fv end return true
end local function dq(aI)if not fo()then return false,"this executor cannot write files"end
aI=(aI or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if aI==""then return false,"give the config a name"end
bU(F.dir)bU(F.cfg)if not bV(F.cfg.."/"..aI..".txt",iS())then return false,"could not write the file"end
a.config=aI return true,aI end local function fx(bZ)local fy=dl(F.cfg.."/"..bZ..".txt")
if not fy then return false,"no config called "..tostring(bZ)end if not iW(fy)then return false,"that config looks empty"end
a.config=bZ return true,bZ end local function fz(dr)if dr then bU(F.dir)bV(F.auto,dr)elseif type(delfile)=="function"then
pcall(delfile,F.auto)else bV(F.auto,"")end a.autoload=dr end local function ds()if a.selfPath then return a.selfPath end
local b0 for mb,iY in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",F.dir})do for mc,fA in ipairs(fr(iY))do
local dt=fA:lower()if dt:sub(-4)==".lua"and(dt:find("sab_farm",1,true)or dt:find("sab farm",1,true))then
b0=b0 or fA end end end a.selfPath=b0 return b0 end F.stub=[[
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
local function iZ()if not fo()then return false,"this executor cannot write files"end bU("autoexec")
if not bV(F.exec,F.stub)then return false,"could not write to the autoexec folder"end local fB=ds()
return true,fB and("it will load "..fB)or"now save this script in Delta so the loader can find it"
end local b1=(function()local i0,i1=pcall(function()return game:GetService("TeleportService")end)return i0 and i1 or nil end)()
local function fC()if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local i2=queueonteleport or queue_on_teleport local fD=ds()if not fD then return false end
return(pcall(i2,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(fD)))
end local function b2(i3)if a.rejoining then return end a.rejoining=true e("REJOIN ("..i3 ..")")
pcall(c5)if a.autoload then pcall(dq,a.autoload)end local i4=fC()e(i4 and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for md=1,30 do if not b1 then break end pcall(function()b1:Teleport(game.PlaceId,v)end)
task.wait(10)end end)end local function i5()local i6,fE=pcall(function()return game:GetService("GuiService")end)
if i6 and fE then pcall(function()L(fE.ErrorMessageChanged:Connect(function()if d.Rejoin then b2("roblox error message")end
end))end)end pcall(function()local fF=game:GetService("CoreGui")local fG=fF and fF:WaitForChild("RobloxPromptGui",15)
local fH=fG and fG:WaitForChild("promptOverlay",15)if fH then L(fH.ChildAdded:Connect(function(i7)
if d.Rejoin and tostring(i7 .Name):lower():find("errorprompt",1,true)then b2("disconnect prompt")end
end))end end)pcall(function()L(v.OnTeleport:Connect(function(i8)if tostring(i8):find("Started")then fC()end
end))end)if b1 then pcall(function()L(b1 .TeleportInitFailed:Connect(function()a.rejoining=false
if d.Rejoin then task.delay(5,function()b2("teleport retry")end)end end))end)end end local function fI(i9)
local fJ=a.plot and a.plot:FindFirstChild(i9)if not fJ then return nil,false end for me,du in ipairs(fJ:GetChildren())do
if du:IsA("Model")or du:IsA("BasePart")then return du,true end end return nil,true end local function aJ()
local ai=fI("RolledSquishy")if not ai then return nil end return{model=ai,name=ai.Name,pretty=a3(ai,"NameText")or C(t(ai.Name)),
rar=a3(ai,"RarityText")or iC(ai.Name),price=a3(ai,"PriceText")}end local function fK(dv)
return type(dv)=="string"and(q.rar[t(dv)]~=nil or hW(dv))end local function u()local dw=fI("SquishyEquipped")
if dw then a.carrySrc="model"return dw.Name,dw end local fL=v.Character if fL then for mf,a7 in ipairs(fL:GetDescendants())do
if(a7:IsA("Model")or a7:IsA("Tool"))and fK(a7 .Name)then a.carrySrc="character"return a7 .Name,a7
end end end local b3=v:GetAttribute("SquishyEquipped")if type(b3)=="string"and b3~=""and fK(b3)and f()>=(a.carryBlind or 0)then
a.carrySrc="attribute"return b3,nil end a.carrySrc=nil end local function mg()local mh,i_=u()return i_ end
local function fM()local fN=aJ()local dx=fN and hY(fN.price)local dy=aa()if dx and dy and dy<dx*0.5 then return dy,dx end
end local function a8(ja)av[#av+1]=os.date("%H:%M:%S").." "..ja if#av>40 then table.remove(av,1)end
end local function jb(aK,b4)if type(aK)~="string"then return end a8(("Roll(%s,%s)"):format(aK,tostring(b4)))
if aK:lower():find("crate",1,true)then return end l.seq=l.seq+1 l.name,l.at=aK,f()l.rar=type(b4)=="string"and b4 or nil
a.rolls=a.rolls+1 if V(aK)then e(("ROLL %s [%s] = TARGET"):format(aK,tostring(b4)))end end
local function jc(aB)if type(aB)~="table"then return end local b5=aB.butter or aB.itemName
if type(b5)~="string"then return end a.gifts=a.gifts+1 l.gift,l.giftAt=b5,f()if type(aB.giftId)=="string"then
local fO=bD:FindFirstChild("Remotes")local fP=fO and fO:FindFirstChild("GiftThanks")if fP then pcall(function()fP:FireServer(aB.giftId)end)end
end a8("Gift("..b5 .." from "..tostring(aB.fromName)..")")e(("GIFT from %s: %s - it will not be waxed"):format(tostring(aB.fromName),b5))
end local function jd()local fQ=bD:WaitForChild("Remotes",30)if not a.alive then return end
if not fQ then e("Remotes folder missing - no roll events")return end local jf={SquishyRollAnimation=jb,
InitSquishy=function(fR)l.init,l.initAt=tostring(fR),f()a8("Init("..tostring(fR)..")")end,
CrateUpdate=function(a9,je)pcall(il,a9)if type(a9)=="table"and je~=false then j.on,j.data,j.at=true,a9,f()
j.title=tostring(a9 .title or a9 .name or"crate")a8("CrateWindow("..j.title..")")else if j.on then a8("CrateWindow closed")end
j.on,j.data=false,nil end end,GiftReceived=jc,}for b6,jg in pairs(jf)do local dz=fQ:FindFirstChild(b6)
if dz and dz:IsA("RemoteEvent")then L(dz.OnClientEvent:Connect(jg))elseif b6~="CrateUpdate"and b6~="GiftReceived"then e("remote "..b6 .." missing")end
end end local function dA()local aC=aJ()if aC then if V(aC.name)then return{state="match",shown=aC.pretty,src="pad",info=aC}
end return{state="skip",info=aC,level="idle",text=("on pad: %s [%s] - not ticked"):format(aC.pretty,tostring(aC.rar))}
end if l.name and(f()-l.at)<4 then if V(l.name)then return{state="match",shown=C(t(l.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(C(t(l.name)),tostring(l.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fS(jh,ji,jj,jk)
local b7=RaycastParams.new()b7 .FilterType=Enum.RaycastFilterType.Exclude local dB={v.Character}
for mi,jl in ipairs(jk or{})do dB[#dB+1]=jl end b7 .FilterDescendantsInstances=dB pcall(function()b7 .RespectCanCollide=true end)
local fT=bE:Raycast(Vector3 .new(jh,ji+4,jj),Vector3 .new(0,-30,0),b7)return fT and fT.Position or nil
end local function dC(fU)local fV=fU:FindFirstChildOfClass("Humanoid")return((fV and fV.HipHeight)or 2)+fU.HumanoidRootPart.Size.Y/2+0.2
end local function dD(jm,jn)local fW=jm:FindFirstChildOfClass("Humanoid")local jo=f()while f()-jo<jn do
if fW and fW.FloorMaterial~=Enum.Material.Air then return true end aw(0.05)end return false
end local function b8(jp,dE,dF)local fX=jp.HumanoidRootPart fX.AssemblyLinearVelocity=Vector3 .new(0,0,0)
fX.CFrame=dF and CFrame.new(dE,Vector3 .new(dF.X,dE.Y,dF.Z))or CFrame.new(dE)end local function b9(ab,fY)
local aD=ax()if not aD or not ab then return false end local aj=ab.Position local b_=math.clamp(math.max(ab.Size.X,ab.Size.Z)/2+2.2,3,7)
local fZ=(fY and fY.MaxActivationDistance)or 10 if b_>fZ-2 then b_=math.max(2.5,fZ-2)end
local a_={}local function aE(ba)ba=Vector3 .new(ba.X,0,ba.Z)if ba.Magnitude>0.05 then a_[#a_+1]=ba.Unit end
end local f0=h5()if f0 then aE(f0-aj)end aE(ab.CFrame.LookVector)aE(-ab.CFrame.LookVector)
aE(ab.CFrame.RightVector)aE(-ab.CFrame.RightVector)aE(aD.HumanoidRootPart.Position-aj)if#a_==0 then aE(Vector3 .new(0,0,1))end
local jq,ca=dC(aD),false for mj,jr in ipairs(a_)do local cb=aj+jr*b_ local dG=fS(cb.X,aj.Y,cb.Z,{ab})
if dG and math.abs(dG.Y-aj.Y)<14 then b8(aD,Vector3 .new(cb.X,dG.Y+jq,cb.Z),aj)if dD(aD,0.7)then ca=true break end
end end if not ca then b8(aD,aj+a_[1]*b_+Vector3 .new(0,3,0),aj)ca=dD(aD,1)end aw(0.12)
return ca end local function js(bb)if not bb.Parent or not bb.Enabled then return false end
pcall(function()bb:InputHoldBegin()end)aw(math.max(bb.HoldDuration,0)+0.08)pcall(function()bb:InputHoldEnd()end)
return true end local function aL(f1,jt)local ju=f()while f()-ju<jt do if f1()then return true end
aw(0.05)end return f1()end local function cc(aM,jv,f2,jw)local jx=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for jy,dH in ipairs(jx)do if jy==2 and(jw or not(aM.Parent and aM.Enabled and(not f2 or f2())))then break end
local dI if dH=="hold"then dI=js(aM)else dI=type(fireproximityprompt)=="function"and aM.Parent~=nil and aM.Enabled and pcall(fireproximityprompt,aM)end
if dI and aL(jv,1.2)then a.zapFirst=(dH=="zap")return true,dH end end return false end local function f3(dJ)
local ak=bJ()if not ak or not ak.Enabled then e("buy: nothing on the pad")return false end
local f4=aY(ak)if not f4 then e("buy: pad part missing")return false end a.lastBuyAt=f()
local jz,f5=l.seq,aa()b9(f4,ak)if not ak.Enabled then e("buy aborted: pad emptied")return false end
local aN=dA()if not dJ and aN.state~="match"then e("buy aborted: "..(aN.text or"pad changed"))
a.matchSince=nil return false end local dK=aN.info and aN.info.name or(aN.state=="match"and l.name)or nil
local function jA()return ak.Enabled and u()==nil and(dJ or dA().state=="match")end local jB,jC=cc(ak,function()
return u()~=nil or((not ak.Enabled)and(dJ or l.seq==jz))end,jA,fM()~=nil)if jB then aL(function()return u()~=nil end,0.8)
local bc=u()local f6=aa()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
l.name,l.rar,l.at=nil,nil,f()e(("BOUGHT %s%s via %s"):format(bc and C(t(bc))or(aN.shown or"?"),(f5 and f6)and(" for $"..W(f5-f6))or"",jC))
if bc and dK and t(bc)~=t(dK)then e(("note: picked up %s, not %s"):format(bc,dK))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=f()+math.min(8*2^(a.cashFails-1),60)local f7=aJ()
e(("BUY REFUSED: cash short? have $%s, price %s"):format(W(aa()),(f7 and f7 .price)or"?"))
return false end local function f8()local cd=u()if not cd then a.holding=false e("place: hands are empty")
return false end if not V(cd)then e(("REFUSED TO WAX %s - it is not ticked"):format(C(t(cd))))
return false end for mk=1,d.PlaceTries do local al=h8()if not al then e("place: no free station")break end
local f9=aY(al)if f9 then b9(f9,al)local f_=u()if not f_ then a.holding=false e("place: hands emptied on the way")return false end
if not V(f_)then e("place: what I carry changed, not waxing it")return false end if al.Enabled then
local jD,jE=cc(al,function()return not al.Enabled end,function()return al.Enabled end)if jD then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 a.carryBlind,a.attrStale=f()+2.5,0 l.name,l.rar,l.at=nil,nil,f()
e(("WAXED %s #%d at %s via %s"):format(C(t(cd)),a.placed,al.Parent.Parent.Name,jE))return true
end end end aw(0.25)end a.placeFails=a.placeFails+1 if u()==nil then a.holding=false end
e("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,f()
a.capMsg=("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
tostring(u()))e(a.capMsg)end return false end local function ga(gb)return type(gb)=="string"and gb:lower():find("crate",1,true)~=nil
end local function jF(ce)if type(ce)~="table"then return false end local dL=ce.contents
if type(dL)=="table"and#dL>0 then for ml,dM in ipairs(dL)do if type(dM)=="table"and V(dM.butter)then return true,C(t(dM.butter))end
end return false end local gc=ce.rarity and q.members[ce.rarity]if gc then for mm,gd in ipairs(gc)do if d.Targets[gd]then return true,C(gd)end end
end return false end local jG={SABFarmGui=1,SABToggle=1,SABError=1}local function jH(jI)
local am=jI while am do if jG[am.Name]then return false end if am:IsA("ScreenGui")then local jJ,jK=pcall(function()return am.Enabled end)
return(not jJ)or jK~=false end if am:IsA("GuiObject")and not am.Visible then return false end
am=am.Parent end return false end local function ge()local dN,dO local gf=v:FindFirstChildOfClass("PlayerGui")
if not gf then return nil,nil end for mn,bd in ipairs(gf:GetDescendants())do if bd:IsA("TextButton")and jH(bd)then
local gg=bd.Text:lower():gsub("[^%a]","")if gg:sub(1,4)=="open"then dN=dN or bd end if gg:sub(1,7)=="discard"then dO=dO or bd end
end end return dN,dO end local cf=(function()local jL,jM=pcall(function()return game:GetService("VirtualInputManager")end)return jL and jM or nil end)()
local function jN(an,jO)local dP={}local function gh(jP)dP[#dP+1]=jP end if a.tapWay then gh(a.tapWay)end
for mo,gi in ipairs({"conn","signal","touch"})do if gi~=a.tapWay then gh(gi)end end for mp,be in ipairs(dP)do
local cg=false if be=="conn"and type(getconnections)=="function"then for mq,jQ in ipairs({an.MouseButton1Click,an.Activated,an.MouseButton1Down})do
local jR,gj=pcall(getconnections,jQ)if jR and type(gj)=="table"then for mr,jS in ipairs(gj)do
if pcall(function()jS:Fire()end)then cg=true end end end end elseif be=="signal"and type(firesignal)=="function"then
cg=pcall(firesignal,an.MouseButton1Click)or pcall(firesignal,an.Activated)elseif be=="touch"and cf then
cg=pcall(function()local gk,gl=an.AbsolutePosition,an.AbsoluteSize local gm=0 local gn=an:FindFirstAncestorWhichIsA("ScreenGui")
local jT,jU=pcall(function()return gn and gn.IgnoreGuiInset end)if not(jT and jU)then pcall(function()gm=game:GetService("GuiService"):GetGuiInset().Y end)
end local go,gp=gk.X+gl.X/2,gk.Y+gl.Y/2+gm cf:SendMouseButtonEvent(go,gp,0,true,game,1)
task.wait(0.06)cf:SendMouseButtonEvent(go,gp,0,false,game,1)end)end if cg and aL(jO,1.5)then
a.tapWay=be return true,be end end return false end local function gq()if j.on then return true end
local bf,gr=bJ(),aJ()if bf and bf.Enabled and gr and ga(gr.name)then local gs=aY(bf)if gs then b9(gs,bf)end
cc(bf,function()return j.on end)end if aL(function()return j.on end,2.5)then return true end
j.lastFail=f()e("crate: the window did not come up")return false end local function dQ(ci)
if not gq()then return false end local dR=j.title local jV,jW=ge()local gt=ci and jV or jW
if not gt then j.lastFail=f()a.crateFails=a.crateFails+1 e(("crate: no %s button found in %s"):format(ci and"Open"or"Discard",dR))
return false end local jX=u()local jY,ms=jN(gt,function()return(not j.on)or(u()~=nil and u()~=jX)
end)if not jY then j.lastFail=f()a.crateFails=a.crateFails+1 e("crate: could not press "..(ci and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if ci then a.crates=a.crates+1 aL(function()return u()~=nil end,1.5)
local gu=u()e(("OPENED %s -> %s"):format(dR,gu and C(t(gu))or"?"))else e("discarded "..dR.." (nothing ticked in it)")
end return true end local jZ={"sell","trash","discard","dispose","bin"}local function dS(cj)
if type(cj)~="string"then return false end cj=cj:lower()for mt,j0 in ipairs(jZ)do if cj:find(j0,1,true)then return true end end
return false end local function j1()local gv=bD:FindFirstChild("Remotes")local dT=gv and gv:FindFirstChild("SellSquishy")
if not(dT and dT:IsA("RemoteEvent"))then return false end if not pcall(function()dT:FireServer()end)then return false end
return aL(function()return u()==nil end,1.5)end local function j2()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if f()-a.sellSearchAt<20 then return nil end a.sellSearchAt=f()local gw=ax()local gx=gw and gw.HumanoidRootPart.Position
local bh,gy for mu,aO in ipairs((a.plot or bE):GetDescendants())do if aO:IsA("ProximityPrompt")and(dS(aO.ActionText)or dS(aO.ObjectText)or dS(aO.Name))then
local gz=eW(aO)local dU=(gz and gx)and(gz-gx).Magnitude or 1e9 if dU<=400 and(not bh or dU<gy)then bh,gy=aO,dU end
end end a.sellSpot=bh a.noSellSpot=(bh==nil)return bh end local function gA()local dV=u()
if not dV then a.holding=false return false end if V(dV)then return false end local dW=C(t(dV))
if j1()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 a.carryBlind,a.attrStale=f()+2.5,0
e("SOLD "..dW)return true end local aP=j2()if aP then local gB=aY(aP)if gB then b9(gB,aP)
local gC=u()if gC and not V(gC)then local j3,j4=cc(aP,function()return u()==nil end,function()return aP.Enabled end)
if j3 then a.sold,a.holding,a.sellFails=a.sold+1,false,0 e(("SOLD %s at %s via %s"):format(dW,aX(aP),j4))
return true end end end end a.sellFails=a.sellFails+1 e("could not sell "..dW.." ("..a.sellFails..")")
return false end local j5={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function j6(aQ)local ck=aX(aQ):lower()for mv,j7 in ipairs(j5)do if ck:find(j7,1,true)then return 0 end end
local T,z=aQ.Name:lower(),0 local function N(j8,j9)return j8:find(j9,1,true)~=nil end if N(T,"collect")then z=z+60 end
if N(T,"cash")or N(T,"money")then z=z+45 end if N(T,"income")or N(T,"claim")then z=z+35 end
if N(T,"coin")or N(T,"earn")or N(T,"green")then z=z+20 end if T=="pad"or T=="touch"then z=z+25 end
if z==0 and(N(ck,"collect")or N(ck,"cash")or N(ck,"money"))then z=25 end if z==0 then return 0 end
local bi=aQ.Color if bi.G>0.5 and bi.G>bi.R*1.4 and bi.G>bi.B*1.4 then z=z+15 end if math.min(aQ.Size.X,aQ.Size.Y,aQ.Size.Z)<2 then z=z+5 end
return z end local function j_()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or f()-a.padSearchAt<20 then return nil end a.padSearchAt=f()local cl,bj,dX={},nil,29
for mw,cm in ipairs(a.plot:GetDescendants())do if cm:IsA("BasePart")then local cn=j6(cm)
if cn>0 then cl[#cl+1]={s=cn,p=cm}if cn>dX then bj,dX=cm,cn end end end end table.sort(cl,function(ka,kb)return ka.s>kb.s end)
a.padCands,a.padPart=cl,bj if bj then e("collect pad: "..aX(bj).." (score "..dX..")")end
return bj end local dY="SAB_pad_v1.txt"local function kc(kd)if type(writefile)=="function"then pcall(writefile,dY,table.concat({kd:GetComponents()},","))end
end local function ke()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local kf,gD=pcall(function()if isfile(dY)then return readfile(dY)end end)if not kf or type(gD)~="string"then return nil end
local co={}for kg in gD:gmatch("[^,]+")do co[#co+1]=tonumber(kg)end if#co==12 then return CFrame.new(unpack(co))end
end local function kh(dZ,cp,ki)local kj=dC(dZ)local d0=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local O=(d0 and d0:IsA("BasePart"))and(d0 .Position-cp)or Vector3 .new(1,0,0)O=Vector3 .new(O.X,0,O.Z)
if O.Magnitude<0.05 then O=Vector3 .new(1,0,0)end O=O.Unit for kk=0,7 do local cq=kk*math.pi/4
local kl=Vector3 .new(O.X*math.cos(cq)-O.Z*math.sin(cq),0,O.X*math.sin(cq)+O.Z*math.cos(cq))
local cr=cp+kl*(ki+5)local d1=fS(cr.X,cp.Y,cr.Z)if d1 and math.abs(d1 .Y-cp.Y)<8 then b8(dZ,Vector3 .new(cr.X,d1 .Y+kj,cr.Z))
if dD(dZ,0.7)then return true end end end return false end local function km()a.lastCollect=f()
local bk=ax()if not bk then return end local gE,kn=bk.HumanoidRootPart,dC(bk)local bl,gF,bm,d2=nil,4,nil,"?"
local d3=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and d3 and d3:IsA("BasePart")then
bl,d2=(d3 .CFrame*a.manualPad).Position,"manual pad"else local ac=j_()if ac then bl=Vector3 .new(ac.Position.X,ac.Position.Y+ac.Size.Y/2+kn,ac.Position.Z)
gF,bm,d2=math.max(ac.Size.X,ac.Size.Z)/2,ac,ac.Name end end if not bl then e("COLLECT: pad not found - stand on it and tap SET PAD")return end
local d4=aa()b8(bk,bl)if bm and type(firetouchinterest)=="function"then pcall(firetouchinterest,gE,bm,0)end
aw(d.PadDwell)if bm and type(firetouchinterest)=="function"then pcall(firetouchinterest,gE,bm,1)end
aw(0.5)a.collected=a.collected+1 local d5=aa()e(("COLLECTED (%s) %s"):format(d2,(d4 and d5 and d5>d4)and("+$"..W(d5-d4))or"no cash change seen"))
kh(bk,bl,gF)end local function gG()if a.capHit then if d.AutoStart and f()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 e("trying again after being stopped for 5 minutes")setRunning(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not ax()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=ay(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(d.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end if j.on and d.Crates then if a.crateFails>=3 then j.on=false e("ignoring the "..j.title.." window - its buttons do not respond")
return nil,("%s window open - press Open or Discard yourself"):format(j.title),"bad"end
if f()-j.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(j.title),"bad"
end local ko,kp=jF(j.data)if ko then return"crate",("opening %s for %s"):format(j.title,kp),"ok"end
if d.SellJunk then return"nocrate",("discarding %s - nothing ticked inside"):format(j.title),"warn"end
return nil,("%s open - nothing ticked inside it"):format(j.title),"idle"end local d6,gH=cY()
local cs=u()if cs then local bn=C(t(cs))if not V(cs)then local d7=(l.gift and t(l.gift)==t(cs)and f()-l.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bn,d7),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bn,d7),"bad"
end return"sell",("selling %s (%s)"):format(bn,d7),"warn"end if d6<1 then return nil,("holding %s - 0 free stations"):format(bn),"wait"end
return"place",("waxing %s (%d free)"):format(bn,d6),"ok"end a.holding=false if d6<1 then
a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(gH,gH),"wait"
end local d8=bJ()if not d8 then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end
local bo=aJ()if bo and ga(bo.name)then a.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(bo.name),"idle"end
if f()-j.lastFail<8 then return nil,("%s on the pad - could not open it"):format(bo.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(bo.name),"ok"end local ao=dA()
if ao.state~="match"then a.matchSince=nil if ao.state=="skip"and not d8 .Enabled then return nil,ao.text.." (sold out)","idle"end
return nil,ao.text,ao.level end if not d8 .Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local bp=f()if bp<a.noCashUntil then local gI,kq=fM()if gI then return nil,("cash short: have $%s, price ~$%s"):format(W(gI),W(kq)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(W(aa()),math.ceil(a.noCashUntil-bp)),"bad"
end if bp-a.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or bp
local gJ=bp-a.matchSince if gJ<d.Confirm then return nil,("confirming %s (%.2fs)"):format(ao.shown,gJ),"ok"end
return"buy",("buying %s via %s"):format(ao.shown,ao.src),"ok"end local function P(kr,ks,...)
if a.busy then return end a.busy,a.busyText=true,kr local kt,gK=pcall(ks,...)a.busy,a.busyText=false,""
if not kt and gK~=cK then e("ERR "..tostring(gK))end end local function ku()local aR,kv,kw=gG()
a.reason,a.level=kv,kw if aR=="place"then P("waxing...",f8)elseif aR=="crate"then P("opening crate...",dQ,true)
elseif aR=="cratewin"then P("checking crate...",gq)elseif aR=="nocrate"then P("discarding crate...",dQ,false)
elseif aR=="sell"then P("selling...",gA)elseif aR=="buy"then P("buying...",f3,false)elseif d.Collect and not a.matchSince and f()-a.lastCollect>=d.Every then
P("collecting money...",km)end end local function d9(ct,kx)if ct==a.running then return end
a.running=ct if not kx then d.AutoStart=ct end if ct then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
j.lastFail=0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=f()a.plot=ay()or a.plot e("START")
else a.reason="stopped"e("STOP")end end local function gL()local d_={}local function i(ky)d_[#d_+1]=tostring(ky)end
i("=== SAB "..au.." DUMP "..os.date("%H:%M:%S").." ===")i(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
i("reason: "..tostring(a.reason))i("targets: "..table.concat(fn(),", "))i(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
i("cash="..W(aa()))local kz,gM=u()i("in hands: "..tostring(kz)..(gM and(" ("..gM.ClassName..")")or"")..
"  via "..tostring(a.carrySrc).."  blind="..string.format("%.1f",math.max(0,(a.carryBlind or 0)-f())))
i("  attribute SquishyEquipped = "..tostring(v:GetAttribute("SquishyEquipped")))local gN=a.plot and a.plot:FindFirstChild("SquishyEquipped")
i("  plot.SquishyEquipped = "..(gN and(#gN:GetChildren().." children")or"missing"))local ea=v.Character
if ea then local eb={}for mx,bq in ipairs(ea:GetDescendants())do if(bq:IsA("Model")or bq:IsA("Tool"))and bq.Name~=ea.Name then eb[#eb+1]=bq.ClassName..":"..bq.Name end
end i("  on the character: "..(table.concat(eb,", "):sub(1,300)))end local cu=aJ()i("on pad: "..(cu and("%s [%s] %s"):format(cu.name,tostring(cu.rar),tostring(cu.price))or"nothing"))
i("sell spot: "..(a.sellSpot and aX(a.sellSpot)or"none found"))local gO,gP=ge()i(("crate window: on=%s title=%s open=%s discard=%s tapWay=%s opened=%d fails=%d"):format(
tostring(j.on),j.title,tostring(gO and gO.Text),tostring(gP and gP.Text),tostring(a.tapWay),a.crates,a.crateFails))
i("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(cf~=nil))
i("--- CATALOG ("..q.n.." butters, worst rarity first) ---")for my,cv in ipairs(q.rarOrder)do
local ec={}for mz,gQ in ipairs(q.members[cv]or{})do ec[#ec+1]=(d.Targets[gQ]and"*"or"")..C(gQ)
end i(("  [%s]%s %s"):format(cv,y.price[cv]and(" crate $"..W(y.price[cv]))or"",table.concat(ec,", ")))
end i("learned orders: ")for kA,kB in pairs(y.order)do i("  "..kA..": "..table.concat(kB,", "))end
i("--- PLOT ---")i("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for mA,ed in ipairs(a.plot:GetChildren())do
i(("  %s %s (%d)"):format(ed.ClassName,ed.Name,#ed:GetChildren()))end local kC,kD=cY()i(("stations free %d / %d"):format(kC,kD))
local ee=bJ()i("BuyPrompt: "..(ee and("enabled="..tostring(ee.Enabled).." hold="..ee.HoldDuration)or"MISSING"))
end i("autostart="..tostring(d.AutoStart).." rejoin="..tostring(d.Rejoin))i(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))i("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#dm())i("--- COLLECT PAD ---")
i("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and aX(a.padPart)or"none"))
i("--- ATTRIBUTES ---")for mB,gR in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
i(("  %s = %s"):format(gR,tostring(v:GetAttribute(gR))))end i("--- EVENTS ---")for kE=math.max(1,#av-15),#av do i("  "..av[kE])end
i("--- LOG ---")for kF=math.max(1,#af-25),#af do i("  "..af[kF])end return table.concat(d_,"\n")
end do local ap=dl(F.auto)if type(ap)=="string"then ap=ap:gsub("%s+$","")if ap~=""then a.autoload=ap
local kG=fx(ap)e(kG and("loaded config "..ap)or("config "..ap.." could not be loaded"))
end end end local c={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local kH={ok=c.good,wait=c.warn,warn=c.warn,bad=c.bad,idle=c.dim}
local kI={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function k(kJ,kK,kL)
local kM,ef=pcall(Instance.new,kJ)if not kM then a.uiErrs=a.uiErrs+1 return nil end for kN,kO in pairs(kK)do
if not pcall(function()ef[kN]=kO end)then a.uiErrs=a.uiErrs+1 end end ef.Parent=kL return ef
end local function H(kP,kQ)k("UICorner",{CornerRadius=UDim.new(0,kQ or 6)},kP)end local b={}
local eg=v:FindFirstChildOfClass("PlayerGui")or v:WaitForChild("PlayerGui")local gS=eg:FindFirstChild("SABFarmGui")
if gS then gS:Destroy()end local eh=k("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},eg)
local A={w=320,h=330,head=30,strip=38,tabs=26}b.root=k("Frame",{Name="Root",Size=UDim2 .new(0,A.w,0,A.h),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=c.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},eh)
H(b.root,10)k("UIStroke",{Color=c.line,Thickness=1},b.root)local aS=UDim2 .new(1,0,1,0)
local function o(gT,gU)return UDim2 .new(gT,0,0,0),UDim2 .new(gU,(gT+gU>0.99)and 0 or-4,1,0)end
local function m(kR,kS,kT,kU,kV,kW)local gV=k("TextButton",{Text=kS,Position=kV,Size=kW,BackgroundColor3=kT,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=kU,TextColor3=c.text,AutoButtonColor=true},kR)H(gV,6)
return gV end local function gW(kX,kY,kZ,k0,k1)local ei=k("TextBox",{Text=kY,PlaceholderText=kZ,Position=k0,Size=k1,BackgroundColor3=c.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=c.text,PlaceholderColor3=c.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},kX)H(ei,6)k("UIPadding",{PaddingLeft=UDim.new(0,8)},ei)
return ei end local cw=bE.CurrentCamera local function k2()local k3,cx=pcall(function()return cw and cw.ViewportSize end)
if k3 and cx and cx.X>50 and cx.Y>50 then return cx end end local function aq(br)local ej=k2()
if not(ej and br and br.Parent)then return end local k4=pcall(function()local cy,gX=br.AbsolutePosition,br.AbsoluteSize
local ek=70 local gY=math.clamp(cy.X,ek-gX.X,ej.X-ek)local gZ=math.clamp(cy.Y,0,ej.Y-math.min(gX.Y,ek))
if math.abs(gY-cy.X)>0.5 or math.abs(gZ-cy.Y)>0.5 then br.Position=UDim2 .new(0,math.floor(gY),0,math.floor(gZ))
end end)return k4 end local function cz(k5)local k6,el=pcall(function()return k5 .AbsolutePosition end)
if k6 and el then return{math.floor(el.X),math.floor(el.Y)}end end local cA={}local function g0(cB,g1,g2)
L(cB.InputBegan:Connect(function(bs)if bs.UserInputType~=Enum.UserInputType.MouseButton1 and bs.UserInputType~=Enum.UserInputType.Touch then return end
cA[cB]={start=bs.Position,from=g1 .Position,moved=0,target=g1}local em em=bs.Changed:Connect(function()
if bs.UserInputState==Enum.UserInputState.End then local g3=cA[cB]cA[cB]=nil if em then em:Disconnect()end
if g3 and g2 then g2(g3 .moved)end end end)end))end L(hQ.InputChanged:Connect(function(cC)
if cC.UserInputType~=Enum.UserInputType.MouseMovement and cC.UserInputType~=Enum.UserInputType.Touch then return end
for mC,ad in pairs(cA)do local en=ad.target if en and en.Parent then local g4,g5=cC.Position.X-ad.start.X,cC.Position.Y-ad.start.Y
ad.moved=math.max(ad.moved,math.abs(g4)+math.abs(g5))en.Position=UDim2 .new(ad.from.X.Scale,ad.from.X.Offset+g4,ad.from.Y.Scale,ad.from.Y.Offset+g5)
end end end))local function x(k7,k8,k9,k_,la,lb,lc)return k("TextLabel",{Text=k8,Position=lb or UDim2 .new(0,0,0,0),Size=lc or aS,BackgroundTransparency=1,
Font=la and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=k9,TextColor3=k_,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},k7)
end b.title=k("Frame",{Size=UDim2 .new(1,0,0,A.head),BackgroundColor3=c.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=k("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=c.dim,BorderSizePixel=0},b.title)
H(b.dot,5)x(b.title,"SAB  BUTTER FARM  "..au,12,c.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=m(b.title,"-",c.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=m(b.title,"X",c.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=k("Frame",{Position=UDim2 .new(0,0,0,A.head),Size=UDim2 .new(1,0,0,A.strip),BackgroundColor3=c.bg,BorderSizePixel=0},b.root)
b.bar=k("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=c.warn,BorderSizePixel=0},b.strip)
H(b.bar,2)b.reason=x(b.strip,"starting",12,c.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=k("Frame",{Position=UDim2 .new(0,0,0,A.head+A.strip),Size=UDim2 .new(1,0,0,A.tabs),BackgroundTransparency=1},b.root)
b.tabFarm=m(b.tabs,"FARM",c.accent,11,UDim2 .new(0,8,0,0),UDim2 .new(0.34,-10,1,-4))b.tabBut=m(b.tabs,"BUTTERS",c.panel2,11,UDim2 .new(0.34,2,0,0),UDim2 .new(0.33,-6,1,-4))
b.tabSet=m(b.tabs,"SETUP",c.panel2,11,UDim2 .new(0.67,2,0,0),UDim2 .new(0.33,-10,1,-4))
local function eo()local ep=k("ScrollingFrame",{Position=UDim2 .new(0,0,0,A.head+A.strip+A.tabs),Size=UDim2 .new(1,0,1,-(A.head+A.strip+A.tabs)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=c.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)k("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},ep)
k("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},ep)
return ep end b.farm,b.but,b.set=eo(),eo(),eo()b.but.Visible,b.set.Visible=false,false local cD,bt,g=0,12,nil
local function I(g6,ld)cD,bt=cD+1,bt+g6+6 return k("Frame",{Size=UDim2 .new(1,0,0,g6),BackgroundTransparency=1,LayoutOrder=cD},ld or b.farm)
end local function bu(le)x(I(14),le,10,c.dim,true)end g=I(34)b.startB=m(g,"START",c.good,14,o(0,0.68))
b.killB=m(g,"KILL",c.bad,14,o(0.68,0.32))local lf=I(42)local function bv(g7,lg,eq)local er=k("Frame",{Position=UDim2 .new((g7-1)/eq,0,0,0),Size=UDim2 .new(1/eq,g7<eq and-4 or 0,1,0),
BackgroundColor3=c.panel,BorderSizePixel=0},lf)H(er,6)local g8=x(er,"0",15,c.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local lh=x(er,lg,9,c.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))g8 .TextXAlignment,lh.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return g8 end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=bv(1,"BOUGHT",5),bv(2,"WAXED",5),bv(3,"SOLD",5),bv(4,"MONEY",5),bv(5,"FREE",5)
b.info=x(I(40),"",10,c.dim,false)b.tgt=x(I(26),"",10,c.good,false)bu("MONEY COLLECT")g=I(28)
b.secB=gW(g,tostring(d.Every),"60",o(0,0.2))x(g,"sec",11,c.dim,false,o(0.21,0.09))b.secSet=m(g,"SET",c.accent,12,o(0.3,0.2))
b.colT=m(g,"COLLECT: ON",c.accent,11,o(0.5,0.5))g=I(26)b.padB=m(g,"SET PAD (stand on it)",c.panel2,10,o(0,0.55))
b.padL=x(g,"",10,c.dim,false,o(0.56,0.44))bu("BUTTERS YOU DID NOT TICK, AND CRATES")g=I(28)
b.sellT=m(g,"SELL THEM: ON",c.accent,11,o(0,0.55))b.sellB=m(g,"SELL NOW",c.warn,11,o(0.55,0.45))
g=I(28)b.crateT=m(g,"OPEN CRATES: ON",c.accent,11,o(0,0.55))b.crateB=m(g,"OPEN NOW",c.warn,11,o(0.55,0.45))
bu("TOOLS")g=I(30)b.buyB=m(g,"BUY NOW",c.warn,11,o(0,0.28))b.plB=m(g,"WAX",c.good,11,o(0.28,0.24))
b.dumpB=m(g,"DUMP",c.accent,11,o(0.52,0.24))b.copyB=m(g,"COPY",c.panel2,11,o(0.76,0.24))
bu("LOG")b.log=k("TextLabel",{Size=aS,BackgroundColor3=c.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=c.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},I(84))H(b.log,6)k("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},b.log)
bu("OUTPUT  (DUMP result)")b.out=k("TextBox",{Size=aS,BackgroundColor3=c.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},I(110))H(b.out,6)
b.farm.CanvasSize=UDim2 .new(0,0,0,bt)cD,bt=0,12 local function K(li)return I(li,b.set)end
local function cE(lj)x(K(14),lj,10,c.dim,true)end cE("SETTINGS FILE  (saved on your phone)")
g=K(28)b.cfgName=gW(g,"default","config name",o(0,0.5))b.cfgSave=m(g,"SAVE",c.good,11,o(0.5,0.25))
b.cfgLoad=m(g,"LOAD",c.accent,11,o(0.75,0.25))g=K(26)b.cfgPrev=m(g,"<",c.panel2,11,o(0,0.13))
b.cfgPick=m(g,"(none saved)",c.panel2,10,o(0.13,0.74))b.cfgNext=m(g,">",c.panel2,11,o(0.87,0.13))
g=K(26)b.cfgAuto=m(g,"LOAD IT ON LAUNCH: OFF",c.panel2,10,o(0,1))b.cfgMsg=x(K(26),"",10,c.dim,false)
cE("START BY ITSELF")g=K(26)b.autoB=m(g,"INSTALL F.exec",c.accent,10,o(0,1))b.autoMsg=x(K(30),"",10,c.dim,false)
g=K(28)b.startT=m(g,"START FARMING ON LOAD: ON",c.accent,10,o(0,1))x(K(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,c.dim,false)
cE("IF THE GAME DROPS ME")g=K(28)b.rejT=m(g,"AUTO REJOIN: ON",c.accent,11,o(0,0.55))b.rejB=m(g,"REJOIN NOW",c.warn,11,o(0.55,0.45))
b.rejMsg=x(K(30),"",10,c.dim,false)cE("THE ROUND SAB BUTTON")x(K(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,c.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,bt)local g9=k("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},eg)
b.tgRoot=k("Frame",{Size=UDim2 .new(0,52,0,52),Position=a.togPos and UDim2 .new(0,a.togPos[1],0,a.togPos[2])or UDim2 .new(0,10,0.45,-26),
BackgroundColor3=c.accent,BorderSizePixel=0,Active=true},g9)H(b.tgRoot,26)k("UIStroke",{Color=c.line,Thickness=1},b.tgRoot)
b.tgBtn=k("TextButton",{Text="SAB",Size=aS,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=c.text,AutoButtonColor=false},b.tgRoot)b.tgDot=k("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=c.dim,
BorderSizePixel=0},b.tgRoot)H(b.tgDot,4)local ae={built=false,boxes={},at=0}local function g_(ha,es)
d.Targets[ha]=es or nil local et=ae.boxes[ha]if et then et.Text=es and"X"or""et.BackgroundColor3=es and c.good or c.panel2
end end local function eu()for lk,hb in pairs(ae.boxes)do local hc=d.Targets[lk]==true hb.Text=hc and"X"or""
hb.BackgroundColor3=hc and c.good or c.panel2 end end local bw local function ll()local lm=0
local ev=k("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=x(ev,"",10,c.dim,false,o(0,0.5))local ln=m(ev,"CLEAR",c.panel2,10,o(0.5,0.24))
local lo=m(ev,"REFRESH",c.panel2,10,o(0.74,0.26))ln.MouseButton1Click:Connect(function()
for lp in pairs(d.Targets)do d.Targets[lp]=nil end eu()end)lo.MouseButton1Click:Connect(function()
q.at=0 dk()bw(true)end)return lm end bw=function(lq)if not dk()then if not b.butEmpty then
b.butEmpty=x(k("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,c.warn,false)end return
end if ae.built and not lq and ae.at==q.at then return end for mD,ew in ipairs(b.but:GetChildren())do
if ew:IsA("Frame")or ew:IsA("TextButton")then ew:Destroy()end end ae.boxes,b.butEmpty={},nil
ll()local ex,ey=36,1 local function hd(he)ey=ey+1 local lr=k("Frame",{Size=UDim2 .new(1,0,0,he),BackgroundTransparency=1,LayoutOrder=ey},b.but)
ex=ex+he+6 return lr end for mE,cF in ipairs(q.rarOrder)do local ls=hd(24)local lt=kI[cF]or c.text
local ez=k("Frame",{Size=aS,BackgroundColor3=c.panel,BorderSizePixel=0},ls)H(ez,6)x(ez,"  "..cF:upper(),11,lt,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local lu=m(ez,"ALL",c.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local lv=cF
lu.MouseButton1Click:Connect(function()local hf=q.members[lv]or{}local hg=false for mF,lw in ipairs(hf)do if not d.Targets[lw]then hg=true break end end
for mG,lx in ipairs(hf)do g_(lx,hg)end end)for mH,eA in ipairs(q.members[cF]or{})do local ly=hd(22)
local cG=k("TextButton",{Text="",Size=aS,BackgroundColor3=c.bg,BorderSizePixel=0,AutoButtonColor=true},ly)
H(cG,5)x(cG,"   "..C(eA),11,c.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local eB=k("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=c.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=c.text,AutoButtonColor=false},cG)
H(eB,4)ae.boxes[eA]=eB local hh=eA local function hi()g_(hh,not d.Targets[hh])end cG.MouseButton1Click:Connect(hi)
eB.MouseButton1Click:Connect(hi)end end eu()b.but.CanvasSize=UDim2 .new(0,0,0,ex+10)ae.built,ae.at=true,q.at
end local hj="farm"local function bx(ar)hj=ar b.farm.Visible,b.but.Visible,b.set.Visible=(ar=="farm"),(ar=="but"),(ar=="set")
b.tabFarm.BackgroundColor3=(ar=="farm")and c.accent or c.panel2 b.tabBut.BackgroundColor3=(ar=="but")and c.accent or c.panel2
b.tabSet.BackgroundColor3=(ar=="set")and c.accent or c.panel2 if ar=="but"then bw(false)end
end local function D(hk,hl,lz,lA)hk.Text=hl and lz or lA hk.BackgroundColor3=hl and c.accent or c.panel2
end local function lB()b.secB.Text=tostring(d.Every)D(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
D(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")D(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
D(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")D(b.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=a.running then d9(d.AutoStart,true)end if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end aq(b.root)
aq(b.tgRoot)a.lastCollect=f()eu()end local function lC(hm)task.spawn(function()hm.TextColor3=c.bad
task.wait(0.8)if a.alive then hm.TextColor3=c.text end end)end local function hn()local ho=b.secB.Text:match("^%s*(%d+)%s*$")
local by=ho and tonumber(ho)if not by or by<1 then b.secB.Text=tostring(d.Every)lC(b.secB)
e("interval must be a whole number >= 1")return end if by==d.Every then return end d.Every,a.lastCollect=by,f()
e("collect every "..by.."s")end local function hp(lD)local hq=setclipboard or toclipboard
return type(hq)=="function"and pcall(hq,lD)end local function lE()local eC=ag~=""and ag or(a.reason.."\n"..table.concat(af,"\n"))
if hp(eC)then e("copied "..#eC.." chars")return end b.out.Text=eC pcall(function()b.out:CaptureFocus()end)
e("no clipboard here - select the text in OUTPUT")end local function lF()local lG,hr=pcall(gL)
ag=lG and hr or("DUMP ERROR "..tostring(hr))local hs=hp(ag)b.out.Text=(hs and#ag>7000)and(ag:sub(1,7000).."\n... (full text is on your clipboard)")or ag
e("DUMP "..#ag.." chars"..(hs and", copied"or""))end local function r(lH,lI)L(lH.MouseButton1Click:Connect(lI))end
r(b.secSet,hn)L(b.secB.FocusLost:Connect(hn))r(b.colT,function()d.Collect,a.lastCollect=not d.Collect,f()
D(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")end)r(b.sellT,function()d.SellJunk=not d.SellJunk
D(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)r(b.sellB,function()a.sellFails=0
task.spawn(P,"selling...",gA)end)r(b.crateT,function()d.Crates=not d.Crates D(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)r(b.crateB,function()j.lastFail=0 task.spawn(P,"opening crate...",dQ,true)end)r(b.padB,function()
a.plot=ay()or a.plot local ht,eD=ax(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(ht and eD and eD:IsA("BasePart"))then e("SET PAD: need character and plot")return end
a.manualPad=eD.CFrame:ToObjectSpace(ht.HumanoidRootPart.CFrame)kc(a.manualPad)e("collect pad saved at your position")
end)r(b.startB,function()d9(not a.running)end)r(b.buyB,function()a.plot=ay()or a.plot task.spawn(P,"buying (manual)...",f3,true)
end)r(b.plB,function()a.plot=ay()or a.plot task.spawn(P,"waxing (manual)...",f8)end)r(b.dumpB,lF)
r(b.copyB,lE)r(b.tabFarm,function()bx("farm")end)r(b.tabBut,function()bx("but")end)r(b.tabSet,function()bx("set")end)
local function hu(eE)a.hidden=eE b.root.Visible=not eE b.tgBtn.Text=eE and"SAB+"or"SAB"
end g0(b.tgRoot,b.tgRoot,function(lJ)aq(b.tgRoot)a.togPos=cz(b.tgRoot)or a.togPos if lJ<8 then hu(not a.hidden)end
end)r(b.tgBtn,function()hu(not a.hidden)end)local J,E={},0 local function as()J=dm()if#J==0 then
b.cfgPick.Text="(none saved)"E=0 return end if E<1 or E>#J then E=1 end b.cfgPick.Text=J[E]..("  (%d/%d)"):format(E,#J)
end local function hv()local hw=a.autoload~=nil b.cfgAuto.Text=hw and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"
b.cfgAuto.BackgroundColor3=hw and c.accent or c.panel2 end local function eF()local hx=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")
if hx~=""then return hx end return(E>0 and J[E])or""end r(b.cfgSave,function()a.winPos=cz(b.root)or a.winPos
a.togPos=cz(b.tgRoot)or a.togPos local hy,hz=dq(eF())b.cfgMsg.Text=hy and("saved as "..hz)or("could not save: "..hz)
b.cfgMsg.TextColor3=hy and c.good or c.bad as()e(b.cfgMsg.Text)end)local function lK(hA)
local eG,hB=fx(hA)b.cfgMsg.Text=eG and("loaded "..hB)or("could not load: "..hB)b.cfgMsg.TextColor3=eG and c.good or c.bad
if eG then b.cfgName.Text=hA lB()end e(b.cfgMsg.Text)end r(b.cfgLoad,function()lK(eF())end)
r(b.cfgPick,function()as()if E>0 then b.cfgName.Text=J[E]end end)r(b.cfgPrev,function()
if#J==0 then as()return end E=(E-2)%#J+1 as()b.cfgName.Text=J[E]end)r(b.cfgNext,function()
if#J==0 then as()return end E=E%#J+1 as()b.cfgName.Text=J[E]end)r(b.cfgAuto,function()if a.autoload then
fz(nil)b.cfgMsg.Text="it will not load a config on launch"else local bz=eF()local hC=false
for mI,lL in ipairs(dm())do if lL==bz then hC=true end end local lM=hC or dq(bz)if lM and bz~=""then
fz(bz)as()b.cfgMsg.Text=bz.." will load every time the script starts"else b.cfgMsg.Text="name the config and save it first"
end end b.cfgMsg.TextColor3=c.dim hv()end)r(b.autoB,function()local hD,hE=iZ()b.autoMsg.Text=hD and("installed. "..hE)or("failed: "..hE)
b.autoMsg.TextColor3=hD and c.good or c.bad e(b.autoMsg.Text)end)r(b.startT,function()d.AutoStart=not d.AutoStart
D(b.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)r(b.rejT,function()
d.Rejoin=not d.Rejoin D(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)r(b.rejB,function()b2("you asked")end)
local aT=false r(b.minB,function()aT=not aT b.tabs.Visible=not aT if aT then b.farm.Visible,b.but.Visible,b.set.Visible=false,false,false
else bx(hj)end b.root.Size=UDim2 .new(0,A.w,0,aT and(A.head+A.strip)or A.h)b.minB.Text=aT and"+"or"-"
end)local function cH()if not a.alive then return end a.alive,a.running=false,false pcall(c5)
for mJ,lN in ipairs(cL)do pcall(function()lN:Disconnect()end)end pcall(function()eh:Destroy()end)
pcall(function()g9:Destroy()end)if aF.SAB_KILL==cH then aF.SAB_KILL=nil end end aF.SAB_KILL=cH
r(b.killB,cH)r(b.xB,cH)g0(b.title,b.root,function()aq(b.root)a.winPos=cz(b.root)or a.winPos
end)local function hF()local bA,bB=a.reason,a.level if a.busy then bA,bB=a.busyText,"ok"
elseif not a.running then local mK,hG,lO=gG()if a.capHit then bA,bB=hG,"bad"else bA,bB="[stopped] "..hG,(lO=="bad")and"bad"or"idle"end
a.reason,a.level=bA,bB end b.reason.Text=bA b.bar.BackgroundColor3=kH[bB]or c.dim b.dot.BackgroundColor3=a.running and c.good or(a.capHit and c.bad or c.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and c.panel2 or c.accent
b.startB.Text=a.running and"STOP"or"START"D(b.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and c.warn or c.good local lP,lQ=cY()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),lP.."/"..lQ local hH=(a.running and d.Collect)and math.max(0,math.ceil(d.Every-(f()-a.lastCollect)))or nil
local hI=u()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
W(aa()),a.rolls,a.gifts,a.crates,hI and C(t(hI))or"nothing",j.on and("   ["..j.title.." window open]")or"",
hH and("in "..hH.."s")or"off")local aU=fn()b.tgt.Text=(#aU==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#aU<=3)and table.concat(aU,", ")or(#aU.." butters ticked")))b.tgt.TextColor3=(#aU==0)and c.bad or c.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(bF,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(q.n,#q.rarOrder,#aU)
end if b.but.Visible and ae.at~=q.at then bw(false)end end aF.SAB={S=a,CFG=d,EV=l,U=b,sg=eh,dump=gL,CAT=q,LEARN=y,buildList=bw}
e(au.." loaded")if a.uiErrs>0 then e("UI: "..a.uiErrs.." properties skipped")end bx("farm")
aq(b.root)aq(b.tgRoot)if cw then pcall(function()L(cw:GetPropertyChangedSignal("ViewportSize"):Connect(function()
task.wait(0.2)aq(b.root)aq(b.tgRoot)end))end)end as()hv()if a.config and a.config~=""then b.cfgName.Text=a.config end
D(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")D(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")
D(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")D(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
D(b.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")b.secB.Text=tostring(d.Every)
pcall(hF)task.spawn(function()local hJ=ds()b.rejMsg.Text=hJ and("after a rejoin it restarts from\n"..hJ)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(dl(F.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(i5)end)task.spawn(function()while a.alive do local lR,lS=pcall(hF)if not lR then e("UI ERR "..tostring(lS))end
task.wait(0.25)end end)task.spawn(function()local lT,lU=pcall(jd)if not lT then e("HOOK ERR "..tostring(lU))end
end)task.spawn(function()pcall(ie)if dk()then e(("catalog: %d butters in %d rarities"):format(q.n,#q.rarOrder))end
local lV,hK=pcall(ke)if lV and hK and a.alive and not a.manualPad then a.manualPad=hK end
end)task.spawn(function()while a.alive do task.wait(20)pcall(c5)end end)if cJ then L(v.Idled:Connect(function()pcall(function()cJ:CaptureController()cJ:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()if not d.AutoStart then return end a.reason,a.level="waiting for the game to load, then starting","wait"
for mL=1,120 do if not a.alive then return end if a.running then return end a.plot=a.plot or ay()
if ax()and a.plot and next(d.Targets)then d9(true,true)e("started by itself")return end
task.wait(1)end if a.alive and not a.running then e("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=ay()a.lastCollect=f()while a.alive do if a.running then
local lW,hL=pcall(ku)if not lW and hL~=cK then e("LOOP ERR "..tostring(hL))end end task.wait(0.1)
end end)cI("loaded - window is at the top left")end local lY,eH=xpcall(hP,function(lX)return tostring(lX).."\n"..debug.traceback()end)
if not lY then pcall(function()warn("SAB "..au.." ERROR: "..tostring(eH))end)cI("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..au.." ERROR: "..tostring(eH))end)pcall(function()local hM=(type(getgenv)=="function"and getgenv())or _G
if type(hM.SAB_KILL)=="function"then hM.SAB_KILL()end for mM,lZ in ipairs({"SABFarmGui","SABToggle"})do
local hN=v.PlayerGui:FindFirstChild(lZ)if hN then hN:Destroy()end end end)pcall(function()
local bC=Instance.new("ScreenGui")bC.Name="SABError"bC.ResetOnSpawn=false bC.DisplayOrder=1000
local Q=Instance.new("TextBox")Q.Size=UDim2 .new(0,340,0,170)Q.Position=UDim2 .new(0,10,0,50)
Q.BackgroundColor3=Color3 .fromRGB(90,20,20)Q.TextColor3=Color3 .new(1,1,1)Q.TextSize=11
Q.TextWrapped=true Q.ClearTextOnFocus=false Q.TextXAlignment=Enum.TextXAlignment.Left Q.TextYAlignment=Enum.TextYAlignment.Top
Q.Text="SAB "..au.." failed to start. Send this text:\n"..tostring(eH)Q.Parent=bC bC.Parent=v:WaitForChild("PlayerGui")
end)end
