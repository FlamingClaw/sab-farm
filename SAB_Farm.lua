local ao="v16"local ew=game:GetService("Players")local v=ew.LocalPlayer or ew.PlayerAdded:Wait()
local function cy(hC)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..ao,Text=hC,Duration=6})
end)end cy("script started")local function hD()local by=game:GetService("ReplicatedStorage")
local cz=game:GetService("Workspace")local hE=game:GetService("UserInputService")local aA=(type(getgenv)=="function"and getgenv())or _G
if type(aA.SAB_KILL)=="function"then pcall(aA.SAB_KILL)end local g=(type(tick)=="function")and tick or os.clock
local hF,cA=pcall(function()return game:GetService("VirtualUser")end)local d={Targets={applepie=true},
Collect=true,Every=60,SellJunk=true,Crates=true,Rejoin=true,AutoStart=true,Confirm=0.35,
BuyGap=1.2,PlaceTries=3,PadDwell=0.7,}local a={alive=true,running=false,busy=false,busyText="",holding=false,
bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,placeFails=0,cashFails=0,sellFails=0,
capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,matchSince=nil,boot=g(),plot=nil,reason="starting",level="wait",
lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,
crates=0,crateFails=0,tapWay=nil,capAt=0,config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local j={name=nil,rar=nil,at=g(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local h={on=false,data=nil,at=0,title="crate",lastFail=0,padAt=0}
local cB={}local cC,bz,ab,ap={},{},{},{}local ac=""local function N(ex)cC[#cC+1]=ex return ex end
local function aq(hG)task.wait(hG)if not a.alive then error(cB,0)end end local function e(bA)
bA=os.date("%H:%M:%S").." "..tostring(bA)table.insert(bz,1,bA)if#bz>6 then table.remove(bz)end
ab[#ab+1]=bA if#ab>80 then table.remove(ab,1)end end local function hH(ey)if type(ey)~="string"then return""end
return(ey:lower():gsub("[^%w]",""))end local function r(hI)local ez=hH(hI)local cD=ez:gsub("butter$","")
if cD==""then cD=ez end return cD end local function P(cE)return type(cE)=="string"and r(cE)~=""and d.Targets[r(cE)]==true end
local function hJ(aR)aR=aR:lower()return aR:find("squishy",1,true)~=nil or aR:match("butter$")~=nil or aR:match("butter[^%a]")~=nil
end local cF={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function Q(aS)
if type(aS)~="number"then return"?"end local bB=1 while math.abs(aS)>=1000 and bB<#cF do aS=aS/1000 bB=bB+1 end
local hK=string.format("%.2f",aS):gsub("%.?0+$","")return hK..cF[bB]end local function hL(eA)
if type(eA)~="string"then return nil end local hM,eB=eA:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local cG=tonumber(hM)if not cG then return nil end if eB==""then return cG end for hN,hO in ipairs(cF)do if hO:lower()==eB:lower()then return cG*1000^(hN-1)end end
return nil end local function T()local eC=v:GetAttribute("BoardValueMoney")if type(eC)=="number"then return eC end
local eD=v:FindFirstChild("leaderstats")if eD then for lF,hP in ipairs({"Cash","Money","Coins"})do
local cH=eD:FindFirstChild(hP)if cH and type(cH.Value)=="number"then return cH.Value end
end end end local function aT(hQ)local cI=hQ:GetFullName()if a.plot then local cJ=a.plot:GetFullName()
if cI:sub(1,#cJ)==cJ then return cI:sub(#cJ+2)end end return cI end local function ar()
local bC=v.Character if bC and bC:FindFirstChild("HumanoidRootPart")then local eE=bC:FindFirstChildOfClass("Humanoid")
if eE and eE.Health>0 then return bC end end end local function as()local cK=cz:FindFirstChild("Plots")
if not cK then return nil end local function eF(hR)local eG=hR:FindFirstChild("Plate")return eG~=nil and eG:FindFirstChild("EditStackAttachment",true)~=nil
end local eH=v:GetAttribute("PlotNumber")if eH~=nil then local cL=cK:FindFirstChild(tostring(eH))
if cL and eF(cL)then return cL end end for lG,eI in ipairs(cK:GetChildren())do if eF(eI)then return eI end
end end local function aU(eJ)local ad=eJ and eJ.Parent for lH=1,6 do if not ad then return nil end
if ad:IsA("BasePart")then return ad end if ad:IsA("Model")then return ad.PrimaryPart or ad:FindFirstChildWhichIsA("BasePart",true)end
ad=ad.Parent end end local function eK(eL)local cM=eL.Parent if cM and cM:IsA("Attachment")then return cM.WorldPosition end
local eM=aU(eL)return eM and eM.Position end local function hS()local aB=a.plot and a.plot:FindFirstChild("Plate")
if not aB then return nil end if aB:IsA("BasePart")then return aB.Position end if aB:IsA("Model")then return aB:GetPivot().Position end
local eN=aB:FindFirstChildWhichIsA("BasePart",true)return eN and eN.Position end local function eO()
local cN={}local eP=a.plot and a.plot:FindFirstChild("WaxStations")if eP then for lI,hT in ipairs(eP:GetChildren())do
local eQ=hT:FindFirstChild("SquishyPlaceHolder")local cO=eQ and eQ:FindFirstChild("PlacePrompt")
if cO and cO:IsA("ProximityPrompt")then cN[#cN+1]=cO end end end return cN end local function cP()
local eR,cQ=eO(),0 for lJ,hU in ipairs(eR)do if hU.Enabled then cQ=cQ+1 end end local cR=#eR
local cS=v:GetAttribute("WaxStations")if type(cS)=="number"and cS>cR then cR=cS end return cQ,cR
end local function hV()local eS=ar()local eT=eS and eS.HumanoidRootPart.Position local cT,eU
for lK,cU in ipairs(eO())do if cU.Enabled then local eV=eK(cU)local eW=(eV and eT)and(eV-eT).Magnitude or 1e9
if not cT or eW<eU then cT,eU=cU,eW end end end return cT end local function bD()local bE=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not bE then return nil end local eX=bE:FindFirstChild("BuyPromptAttachment")local bF=(eX and eX:FindFirstChild("BuyPrompt"))or bE:FindFirstChild("BuyPrompt",true)
if bF and bF:IsA("ProximityPrompt")and bF:IsDescendantOf(bE)then return bF end end local hW={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local hX={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local w={order={},price={},dirty=false}local q={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local cV="SAB_order.txt"local function cW()if not w.dirty or type(writefile)~="function"then return end
local aV={}for hY,hZ in pairs(w.price)do aV[#aV+1]="P|"..hY.."|"..string.format("%.0f",hZ)end
for h0,h1 in pairs(w.order)do aV[#aV+1]="O|"..h0 .."|"..table.concat(h1,",")end if pcall(writefile,cV,table.concat(aV,"\n"))then w.dirty=false end
end local function h2()if type(isfile)~="function"or type(readfile)~="function"then return end
local h3,h4=pcall(isfile,cV)if not(h3 and h4)then return end local h5,eY=pcall(readfile,cV)
if not(h5 and type(eY)=="string")then return end for h6 in eY:gmatch("[^\n]+")do local eZ,e0,cX=h6:match("^(%a)|([^|]+)|(.*)$")
if eZ=="P"then w.price[e0]=tonumber(cX)elseif eZ=="O"and cX~=""then local bG={}for h7 in cX:gmatch("[^,]+")do bG[#bG+1]=h7 end
if#bG>0 then w.order[e0]=bG end end end end local function h8(bH)if type(bH)~="table"then return end
local au,e1=bH.rarity,bH.contents if type(au)~="string"or au==""or type(e1)~="table"then return end
local aW={}for lL,bI in ipairs(e1)do if type(bI)=="table"and type(bI.butter)=="string"then
aW[#aW+1]={n=bI.butter,ch=tonumber(bI.chance)or 0}end end if#aW==0 then return end table.sort(aW,function(h9,h_)return h9 .ch>h_.ch end)
local aX,aY={},false for ia,ib in ipairs(aW)do aX[ia]=ib.n end local cY=w.order[au]if not cY or#cY~=#aX then aY=true end
if not aY then for e2=1,#aX do if cY[e2]~=aX[e2]then aY=true break end end end w.order[au]=aX
local cZ=tonumber(bH.price)if cZ and w.price[au]~=cZ then w.price[au]=cZ aY=true end if aY then
w.dirty=true q.at=0 e("learned the "..au.." order from its crate")end end local function aZ(ic,id)
local ie=ic:FindFirstChild(id,true)local ig,c0=pcall(function()return ie.Text end)return(ig and type(c0)=="string"and c0~="")and c0 or nil
end local function y(e3)return q.pretty[e3]or e3 end local function ih()local e4=by:FindFirstChild("Assets")
local e5=e4 and e4:FindFirstChild("Squishies")if not e5 then return false end local c1,e6,aC={},{},{}
local bJ=0 for lM,bK in ipairs(e5:GetChildren())do local a0=r(bK.Name)if a0~=""and not c1[a0]then
local bL=aZ(bK,"RarityText")or"?"c1[a0]=bL e6[a0]=aZ(bK,"NameText")or bK.Name aC[bL]=aC[bL]or{}
table.insert(aC[bL],a0)bJ=bJ+1 end end if bJ==0 then return false end for e7,ii in pairs(aC)do
local e8=w.order[e7]or hX[e7]local c2={}if e8 then for ij,ik in ipairs(e8)do c2[r(ik)]=ij end end
table.sort(ii,function(e9,e_)local c3,c4=c2[e9],c2[e_]if c3 and c4 then return c3<c4 end
if c3 then return true end if c4 then return false end return y(e9)<y(e_)end)end local c5={}
for il,im in ipairs(hW)do c5[im]=il end local bM={}for io in pairs(aC)do bM[#bM+1]=io end
table.sort(bM,function(c6,c7)local c8,c9=w.price[c6],w.price[c7]if c8 and c9 and c8~=c9 then return c8<c9 end
local c_,da=c5[c6],c5[c7]if c_ and da then return c_<da end if c_ then return true end if da then return false end
return c6<c7 end)q.rar,q.pretty,q.members,q.rarOrder,q.n,q.at=c1,e6,aC,bM,bJ,g()return true
end local function db()if q.at==0 or(g()-q.at)>120 then pcall(ih)end return q.n>0 end local function ip(iq)
local fa=r(iq)return q.rar[fa]or(j.name and r(j.name)==fa and j.rar)or"?"end local function fb()
local bN={}for ir,is in pairs(d.Targets)do if is then bN[#bN+1]=y(ir)end end table.sort(bN)
return bN end local C={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function fc()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function bO(fd)if type(makefolder)~="function"then return end local it,iu=pcall(isfolder,fd)
if not(it and iu)then pcall(makefolder,fd)end end local function dc(fe)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local iv,iw=pcall(isfile,fe)if not(iv and iw)then return nil end local ix,iy=pcall(readfile,fe)
return ix and iy or nil end local function bP(iz,iA)if type(writefile)~="function"then return false end
return(pcall(writefile,iz,iA))end local function ff(iB)local a1={}if type(listfiles)~="function"then return a1 end
local iC,fg=pcall(listfiles,iB)if not iC or type(fg)~="table"then return a1 end for lN,iD in ipairs(fg)do a1[#a1+1]=tostring(iD)end
return a1 end local function dd()local bQ={}for lO,iE in ipairs(ff(C.cfg))do local fh=iE:match("([^/\\]+)%.txt$")
if fh then bQ[#bQ+1]=fh end end table.sort(bQ)return bQ end local function iF()local I={"V|1"}
I[#I+1]="N|Every|"..tostring(d.Every)for lP,fi in ipairs({"Collect","SellJunk","Crates","Rejoin","AutoStart"})do
I[#I+1]="B|"..fi.."|"..(d[fi]and"1"or"0")end if a.winPos then I[#I+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then I[#I+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end local bR={}for iG,iH in pairs(d.Targets)do if iH then bR[#bR+1]=iG end end
table.sort(bR)for lQ,iI in ipairs(bR)do I[#I+1]="T|"..iI end return table.concat(I,"\n")
end local function iJ(de)if type(de)~="string"or de==""then return false end local fj,fk={},false
for iK in de:gmatch("[^\n]+")do local a2,av,bS=iK:match("^(%a)|([^|]*)|?(.*)$")if a2=="N"and av=="Every"then
local df=tonumber(bS)if df and df>=1 then d.Every=math.floor(df)end elseif a2=="B"then if d[av]~=nil then d[av]=(bS=="1")end
elseif a2=="W"then a.winPos={tonumber(av)or 10,tonumber(bS)or 44}elseif a2=="G"then a.togPos={tonumber(av)or 10,tonumber(bS)or 300}
elseif a2=="T"and av~=""then fj[av]=true fk=true end end if fk then d.Targets=fj end return true
end local function dg(aD)if not fc()then return false,"this executor cannot write files"end
aD=(aD or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if aD==""then return false,"give the config a name"end
bO(C.dir)bO(C.cfg)if not bP(C.cfg.."/"..aD..".txt",iF())then return false,"could not write the file"end
a.config=aD return true,aD end local function fl(bT)local fm=dc(C.cfg.."/"..bT..".txt")
if not fm then return false,"no config called "..tostring(bT)end if not iJ(fm)then return false,"that config looks empty"end
a.config=bT return true,bT end local function fn(dh)if dh then bO(C.dir)bP(C.auto,dh)elseif type(delfile)=="function"then
pcall(delfile,C.auto)else bP(C.auto,"")end a.autoload=dh end local function di()if a.selfPath then return a.selfPath end
local bU for lR,iL in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",C.dir})do for lS,fo in ipairs(ff(iL))do
local dj=fo:lower()if dj:sub(-4)==".lua"and(dj:find("sab_farm",1,true)or dj:find("sab farm",1,true))then
bU=bU or fo end end end a.selfPath=bU return bU end C.stub=[[
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
local function iM()if not fc()then return false,"this executor cannot write files"end bO("autoexec")
if not bP(C.exec,C.stub)then return false,"could not write to the autoexec folder"end local fp=di()
return true,fp and("it will load "..fp)or"now save this script in Delta so the loader can find it"
end local fq,bV=pcall(function()return game:GetService("TeleportService")end)local function fr()
if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local iN=queueonteleport or queue_on_teleport local fs=di()if not fs then return false end
return(pcall(iN,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(fs)))
end local function bW(iO)if a.rejoining then return end a.rejoining=true e("REJOIN ("..iO..")")
pcall(cW)if a.autoload then pcall(dg,a.autoload)end local iP=fr()e(iP and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for lT=1,30 do if not fq or not bV then break end pcall(function()bV:Teleport(game.PlaceId,v)end)
task.wait(10)end end)end local function iQ()local iR,ft=pcall(function()return game:GetService("GuiService")end)
if iR and ft then pcall(function()N(ft.ErrorMessageChanged:Connect(function()if d.Rejoin then bW("roblox error message")end
end))end)end pcall(function()local fu=game:GetService("CoreGui")local fv=fu and fu:WaitForChild("RobloxPromptGui",15)
local fw=fv and fv:WaitForChild("promptOverlay",15)if fw then N(fw.ChildAdded:Connect(function(iS)
if d.Rejoin and tostring(iS.Name):lower():find("errorprompt",1,true)then bW("disconnect prompt")end
end))end end)pcall(function()N(v.OnTeleport:Connect(function(iT)if tostring(iT):find("Started")then fr()end
end))end)if fq and bV then pcall(function()N(bV.TeleportInitFailed:Connect(function()a.rejoining=false
if d.Rejoin then task.delay(5,function()bW("teleport retry")end)end end))end)end end local function fx(iU)
local fy=a.plot and a.plot:FindFirstChild(iU)if not fy then return nil,false end for lU,dk in ipairs(fy:GetChildren())do
if dk:IsA("Model")or dk:IsA("BasePart")then return dk,true end end return nil,true end local function aE()
local ae=fx("RolledSquishy")if not ae then return nil end return{model=ae,name=ae.Name,pretty=aZ(ae,"NameText")or y(r(ae.Name)),
rar=aZ(ae,"RarityText")or ip(ae.Name),price=aZ(ae,"PriceText")}end local function t()local dl,iV=fx("SquishyEquipped")
if dl then return dl.Name,dl end if iV then return nil end local dm=v:GetAttribute("SquishyEquipped")
if type(dm)=="string"and dm~=""then return dm,nil end for lV,fz in ipairs({v.Character,v:FindFirstChildOfClass("Backpack")})do
if fz then for lW,a3 in ipairs(fz:GetChildren())do if(a3:IsA("Tool")or a3:IsA("Model"))and hJ(a3 .Name)then return a3 .Name,a3 end
end end end end local function lX()local lY,iW=t()return iW end local function fA()local fB=aE()
local dn=fB and hL(fB.price)local dp=T()if dn and dp and dp<dn*0.5 then return dp,dn end
end local function a4(iX)ap[#ap+1]=os.date("%H:%M:%S").." "..iX if#ap>40 then table.remove(ap,1)end
end local function iY(aF,bX)if type(aF)~="string"then return end a4(("Roll(%s,%s)"):format(aF,tostring(bX)))
if aF:lower():find("crate",1,true)then return end j.seq=j.seq+1 j.name,j.at=aF,g()j.rar=type(bX)=="string"and bX or nil
a.rolls=a.rolls+1 if P(aF)then e(("ROLL %s [%s] = TARGET"):format(aF,tostring(bX)))end end
local function iZ(aw)if type(aw)~="table"then return end local bY=aw.butter or aw.itemName
if type(bY)~="string"then return end a.gifts=a.gifts+1 j.gift,j.giftAt=bY,g()if type(aw.giftId)=="string"then
local fC=by:FindFirstChild("Remotes")local fD=fC and fC:FindFirstChild("GiftThanks")if fD then pcall(function()fD:FireServer(aw.giftId)end)end
end a4("Gift("..bY.." from "..tostring(aw.fromName)..")")e(("GIFT from %s: %s - it will not be waxed"):format(tostring(aw.fromName),bY))
end local function i0()local fE=by:WaitForChild("Remotes",30)if not a.alive then return end
if not fE then e("Remotes folder missing - no roll events")return end local i2={SquishyRollAnimation=iY,
InitSquishy=function(fF)j.init,j.initAt=tostring(fF),g()a4("Init("..tostring(fF)..")")end,
CrateUpdate=function(a5,i1)pcall(h8,a5)if type(a5)=="table"and i1~=false then h.on,h.data,h.at=true,a5,g()
h.title=tostring(a5 .title or a5 .name or"crate")a4("CrateWindow("..h.title..")")else if h.on then a4("CrateWindow closed")end
h.on,h.data=false,nil end end,GiftReceived=iZ,}for bZ,i3 in pairs(i2)do local dq=fE:FindFirstChild(bZ)
if dq and dq:IsA("RemoteEvent")then N(dq.OnClientEvent:Connect(i3))elseif bZ~="CrateUpdate"and bZ~="GiftReceived"then e("remote "..bZ.." missing")end
end end local function dr()local ax=aE()if ax then if P(ax.name)then return{state="match",shown=ax.pretty,src="pad",info=ax}
end return{state="skip",info=ax,level="idle",text=("on pad: %s [%s] - not ticked"):format(ax.pretty,tostring(ax.rar))}
end if j.name and(g()-j.at)<4 then if P(j.name)then return{state="match",shown=y(r(j.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(y(r(j.name)),tostring(j.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fG(i4,i5,i6,i7)
local b0=RaycastParams.new()b0 .FilterType=Enum.RaycastFilterType.Exclude local ds={v.Character}
for lZ,i8 in ipairs(i7 or{})do ds[#ds+1]=i8 end b0 .FilterDescendantsInstances=ds pcall(function()b0 .RespectCanCollide=true end)
local fH=cz:Raycast(Vector3 .new(i4,i5+4,i6),Vector3 .new(0,-30,0),b0)return fH and fH.Position or nil
end local function dt(fI)local fJ=fI:FindFirstChildOfClass("Humanoid")return((fJ and fJ.HipHeight)or 2)+fI.HumanoidRootPart.Size.Y/2+0.2
end local function du(i9,i_)local fK=i9:FindFirstChildOfClass("Humanoid")local ja=g()while g()-ja<i_ do
if fK and fK.FloorMaterial~=Enum.Material.Air then return true end aq(0.05)end return false
end local function b1(jb,dv,dw)local fL=jb.HumanoidRootPart fL.AssemblyLinearVelocity=Vector3 .new(0,0,0)
fL.CFrame=dw and CFrame.new(dv,Vector3 .new(dw.X,dv.Y,dw.Z))or CFrame.new(dv)end local function b2(V,fM)
local ay=ar()if not ay or not V then return false end local af=V.Position local b3=math.clamp(math.max(V.Size.X,V.Size.Z)/2+2.2,3,7)
local fN=(fM and fM.MaxActivationDistance)or 10 if b3>fN-2 then b3=math.max(2.5,fN-2)end
local a6={}local function az(a7)a7=Vector3 .new(a7 .X,0,a7 .Z)if a7 .Magnitude>0.05 then a6[#a6+1]=a7 .Unit end
end local fO=hS()if fO then az(fO-af)end az(V.CFrame.LookVector)az(-V.CFrame.LookVector)
az(V.CFrame.RightVector)az(-V.CFrame.RightVector)az(ay.HumanoidRootPart.Position-af)if#a6==0 then az(Vector3 .new(0,0,1))end
local jc,b4=dt(ay),false for l0,jd in ipairs(a6)do local b5=af+jd*b3 local dx=fG(b5 .X,af.Y,b5 .Z,{V})
if dx and math.abs(dx.Y-af.Y)<14 then b1(ay,Vector3 .new(b5 .X,dx.Y+jc,b5 .Z),af)if du(ay,0.7)then b4=true break end
end end if not b4 then b1(ay,af+a6[1]*b3+Vector3 .new(0,3,0),af)b4=du(ay,1)end aq(0.12)
return b4 end local function je(a8)if not a8 .Parent or not a8 .Enabled then return false end
pcall(function()a8:InputHoldBegin()end)aq(math.max(a8 .HoldDuration,0)+0.08)pcall(function()a8:InputHoldEnd()end)
return true end local function aG(fP,jf)local jg=g()while g()-jg<jf do if fP()then return true end
aq(0.05)end return fP()end local function b6(aH,jh,fQ,ji)local jj=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for jk,dy in ipairs(jj)do if jk==2 and(ji or not(aH.Parent and aH.Enabled and(not fQ or fQ())))then break end
local dz if dy=="hold"then dz=je(aH)else dz=type(fireproximityprompt)=="function"and aH.Parent~=nil and aH.Enabled and pcall(fireproximityprompt,aH)end
if dz and aG(jh,1.2)then a.zapFirst=(dy=="zap")return true,dy end end return false end local function fR(dA)
local ag=bD()if not ag or not ag.Enabled then e("buy: nothing on the pad")return false end
local fS=aU(ag)if not fS then e("buy: pad part missing")return false end a.lastBuyAt=g()
local jl,fT=j.seq,T()b2(fS,ag)if not ag.Enabled then e("buy aborted: pad emptied")return false end
local aI=dr()if not dA and aI.state~="match"then e("buy aborted: "..(aI.text or"pad changed"))
a.matchSince=nil return false end local dB=aI.info and aI.info.name or(aI.state=="match"and j.name)or nil
local function jm()return ag.Enabled and t()==nil and(dA or dr().state=="match")end local jn,jo=b6(ag,function()
return t()~=nil or((not ag.Enabled)and(dA or j.seq==jl))end,jm,fA()~=nil)if jn then aG(function()return t()~=nil end,0.8)
local a9=t()local fU=T()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
j.name,j.rar,j.at=nil,nil,g()e(("BOUGHT %s%s via %s"):format(a9 and y(r(a9))or(aI.shown or"?"),(fT and fU)and(" for $"..Q(fT-fU))or"",jo))
if a9 and dB and r(a9)~=r(dB)then e(("note: picked up %s, not %s"):format(a9,dB))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=g()+math.min(8*2^(a.cashFails-1),60)local fV=aE()
e(("BUY REFUSED: cash short? have $%s, price %s"):format(Q(T()),(fV and fV.price)or"?"))
return false end local function fW()local b7=t()if not b7 then a.holding=false e("place: hands are empty")
return false end if not P(b7)then e(("REFUSED TO WAX %s - it is not ticked"):format(y(r(b7))))
return false end for l1=1,d.PlaceTries do local ah=hV()if not ah then e("place: no free station")break end
local fX=aU(ah)if fX then b2(fX,ah)local fY=t()if not fY then a.holding=false e("place: hands emptied on the way")return false end
if not P(fY)then e("place: what I carry changed, not waxing it")return false end if ah.Enabled then
local jp,jq=b6(ah,function()return not ah.Enabled end,function()return ah.Enabled end)if jp then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 j.name,j.rar,j.at=nil,nil,g()e(("WAXED %s #%d at %s via %s"):format(y(r(b7)),a.placed,ah.Parent.Parent.Name,jq))
return true end end end aq(0.25)end a.placeFails=a.placeFails+1 if t()==nil then a.holding=false end
e("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running,a.capAt=true,false,g()
a.capMsg="STOPPED: place failed twice with free stations (plate full at 100? not holding?)"
e(a.capMsg)end return false end local function fZ(f0)return type(f0)=="string"and f0:lower():find("crate",1,true)~=nil
end local function jr(b8)if type(b8)~="table"then return false end local dC=b8 .contents
if type(dC)=="table"and#dC>0 then for l2,dD in ipairs(dC)do if type(dD)=="table"and P(dD.butter)then return true,y(r(dD.butter))end
end return false end local f1=b8 .rarity and q.members[b8 .rarity]if f1 then for l3,f2 in ipairs(f1)do if d.Targets[f2]then return true,y(f2)end end
end return false end local js={SABFarmGui=1,SABToggle=1,SABError=1}local function jt(ju)
local ai=ju while ai do if js[ai.Name]then return false end if ai:IsA("ScreenGui")then local jv,jw=pcall(function()return ai.Enabled end)
return(not jv)or jw~=false end if ai:IsA("GuiObject")and not ai.Visible then return false end
ai=ai.Parent end return false end local function f3()local dE,dF local f4=v:FindFirstChildOfClass("PlayerGui")
if not f4 then return nil,nil end for l4,a_ in ipairs(f4:GetDescendants())do if a_:IsA("TextButton")and jt(a_)then
local f5=a_.Text:lower():gsub("[^%a]","")if f5:sub(1,4)=="open"then dE=dE or a_ end if f5:sub(1,7)=="discard"then dF=dF or a_ end
end end return dE,dF end local f6,b9=pcall(function()return game:GetService("VirtualInputManager")end)
local function jx(aj,jy)local dG={}local function f7(jz)dG[#dG+1]=jz end if a.tapWay then f7(a.tapWay)end
for l5,f8 in ipairs({"conn","signal","touch"})do if f8~=a.tapWay then f7(f8)end end for l6,ba in ipairs(dG)do
local b_=false if ba=="conn"and type(getconnections)=="function"then for l7,jA in ipairs({aj.MouseButton1Click,aj.Activated,aj.MouseButton1Down})do
local jB,f9=pcall(getconnections,jA)if jB and type(f9)=="table"then for l8,jC in ipairs(f9)do
if pcall(function()jC:Fire()end)then b_=true end end end end elseif ba=="signal"and type(firesignal)=="function"then
b_=pcall(firesignal,aj.MouseButton1Click)or pcall(firesignal,aj.Activated)elseif ba=="touch"and f6 and b9 then
b_=pcall(function()local f_,ga=aj.AbsolutePosition,aj.AbsoluteSize local gb=0 local gc=aj:FindFirstAncestorWhichIsA("ScreenGui")
local jD,jE=pcall(function()return gc and gc.IgnoreGuiInset end)if not(jD and jE)then pcall(function()gb=game:GetService("GuiService"):GetGuiInset().Y end)
end local gd,ge=f_.X+ga.X/2,f_.Y+ga.Y/2+gb b9:SendMouseButtonEvent(gd,ge,0,true,game,1)
task.wait(0.06)b9:SendMouseButtonEvent(gd,ge,0,false,game,1)end)end if b_ and aG(jy,1.5)then
a.tapWay=ba return true,ba end end return false end local function gf()if h.on then return true end
local bb,gg=bD(),aE()if bb and bb.Enabled and gg and fZ(gg.name)then local gh=aU(bb)if gh then b2(gh,bb)end
b6(bb,function()return h.on end)end if aG(function()return h.on end,2.5)then return true end
h.lastFail=g()e("crate: the window did not come up")return false end local function dH(ca)
if not gf()then return false end local dI=h.title local jF,jG=f3()local gi=ca and jF or jG
if not gi then h.lastFail=g()a.crateFails=a.crateFails+1 e(("crate: no %s button found in %s"):format(ca and"Open"or"Discard",dI))
return false end local jH=t()local jI,l9=jx(gi,function()return(not h.on)or(t()~=nil and t()~=jH)
end)if not jI then h.lastFail=g()a.crateFails=a.crateFails+1 e("crate: could not press "..(ca and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if ca then a.crates=a.crates+1 aG(function()return t()~=nil end,1.5)
local gj=t()e(("OPENED %s -> %s"):format(dI,gj and y(r(gj))or"?"))else e("discarded "..dI.." (nothing ticked in it)")
end return true end local jJ={"sell","trash","discard","dispose","bin"}local function dJ(cb)
if type(cb)~="string"then return false end cb=cb:lower()for l_,jK in ipairs(jJ)do if cb:find(jK,1,true)then return true end end
return false end local function jL()local gk=by:FindFirstChild("Remotes")local dK=gk and gk:FindFirstChild("SellSquishy")
if not(dK and dK:IsA("RemoteEvent"))then return false end if not pcall(function()dK:FireServer()end)then return false end
return aG(function()return t()==nil end,1.5)end local function jM()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if g()-a.sellSearchAt<20 then return nil end a.sellSearchAt=g()local gl=ar()local gm=gl and gl.HumanoidRootPart.Position
local bc,gn for ma,aJ in ipairs((a.plot or cz):GetDescendants())do if aJ:IsA("ProximityPrompt")and(dJ(aJ.ActionText)or dJ(aJ.ObjectText)or dJ(aJ.Name))then
local go=eK(aJ)local dL=(go and gm)and(go-gm).Magnitude or 1e9 if dL<=400 and(not bc or dL<gn)then bc,gn=aJ,dL end
end end a.sellSpot=bc a.noSellSpot=(bc==nil)return bc end local function gp()local dM=t()
if not dM then a.holding=false return false end if P(dM)then return false end local dN=y(r(dM))
if jL()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 e("SOLD "..dN)return true end
local aK=jM()if aK then local gq=aU(aK)if gq then b2(gq,aK)local gr=t()if gr and not P(gr)then
local jN,jO=b6(aK,function()return t()==nil end,function()return aK.Enabled end)if jN then
a.sold,a.holding,a.sellFails=a.sold+1,false,0 e(("SOLD %s at %s via %s"):format(dN,aT(aK),jO))
return true end end end end a.sellFails=a.sellFails+1 e("could not sell "..dN.." ("..a.sellFails..")")
return false end local jP={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function jQ(aL)local cc=aT(aL):lower()for mb,jR in ipairs(jP)do if cc:find(jR,1,true)then return 0 end end
local O,x=aL.Name:lower(),0 local function J(jS,jT)return jS:find(jT,1,true)~=nil end if J(O,"collect")then x=x+60 end
if J(O,"cash")or J(O,"money")then x=x+45 end if J(O,"income")or J(O,"claim")then x=x+35 end
if J(O,"coin")or J(O,"earn")or J(O,"green")then x=x+20 end if O=="pad"or O=="touch"then x=x+25 end
if x==0 and(J(cc,"collect")or J(cc,"cash")or J(cc,"money"))then x=25 end if x==0 then return 0 end
local bd=aL.Color if bd.G>0.5 and bd.G>bd.R*1.4 and bd.G>bd.B*1.4 then x=x+15 end if math.min(aL.Size.X,aL.Size.Y,aL.Size.Z)<2 then x=x+5 end
return x end local function jU()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or g()-a.padSearchAt<20 then return nil end a.padSearchAt=g()local cd,be,dO={},nil,29
for mc,ce in ipairs(a.plot:GetDescendants())do if ce:IsA("BasePart")then local cf=jQ(ce)
if cf>0 then cd[#cd+1]={s=cf,p=ce}if cf>dO then be,dO=ce,cf end end end end table.sort(cd,function(jV,jW)return jV.s>jW.s end)
a.padCands,a.padPart=cd,be if be then e("collect pad: "..aT(be).." (score "..dO..")")end
return be end local dP="SAB_pad_v1.txt"local function jX(jY)if type(writefile)=="function"then pcall(writefile,dP,table.concat({jY:GetComponents()},","))end
end local function jZ()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local j0,gs=pcall(function()if isfile(dP)then return readfile(dP)end end)if not j0 or type(gs)~="string"then return nil end
local cg={}for j1 in gs:gmatch("[^,]+")do cg[#cg+1]=tonumber(j1)end if#cg==12 then return CFrame.new(unpack(cg))end
end local function j2(dQ,ci,j3)local j4=dt(dQ)local dR=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local K=(dR and dR:IsA("BasePart"))and(dR.Position-ci)or Vector3 .new(1,0,0)K=Vector3 .new(K.X,0,K.Z)
if K.Magnitude<0.05 then K=Vector3 .new(1,0,0)end K=K.Unit for j5=0,7 do local cj=j5*math.pi/4
local j6=Vector3 .new(K.X*math.cos(cj)-K.Z*math.sin(cj),0,K.X*math.sin(cj)+K.Z*math.cos(cj))
local ck=ci+j6*(j3+5)local dS=fG(ck.X,ci.Y,ck.Z)if dS and math.abs(dS.Y-ci.Y)<8 then b1(dQ,Vector3 .new(ck.X,dS.Y+j4,ck.Z))
if du(dQ,0.7)then return true end end end return false end local function j7()a.lastCollect=g()
local bf=ar()if not bf then return end local gt,j8=bf.HumanoidRootPart,dt(bf)local bh,gu,bi,dT=nil,4,nil,"?"
local dU=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and dU and dU:IsA("BasePart")then
bh,dT=(dU.CFrame*a.manualPad).Position,"manual pad"else local W=jU()if W then bh=Vector3 .new(W.Position.X,W.Position.Y+W.Size.Y/2+j8,W.Position.Z)
gu,bi,dT=math.max(W.Size.X,W.Size.Z)/2,W,W.Name end end if not bh then e("COLLECT: pad not found - stand on it and tap SET PAD")return end
local dV=T()b1(bf,bh)if bi and type(firetouchinterest)=="function"then pcall(firetouchinterest,gt,bi,0)end
aq(d.PadDwell)if bi and type(firetouchinterest)=="function"then pcall(firetouchinterest,gt,bi,1)end
aq(0.5)a.collected=a.collected+1 local dW=T()e(("COLLECTED (%s) %s"):format(dT,(dV and dW and dW>dV)and("+$"..Q(dW-dV))or"no cash change seen"))
j2(bf,bh,gu)end local function gv()if a.capHit then if d.AutoStart and g()-(a.capAt or 0)>300 then
a.capHit,a.placeFails=false,0 e("trying again after being stopped for 5 minutes")setRunning(true,true)
else return nil,a.capMsg,"bad"end end if a.busy then return nil,a.busyText,"ok"end if not ar()then return nil,"waiting for character","wait"end
if not a.plot or not a.plot.Parent then a.plot,a.padPart,a.sellSpot=as(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(d.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end if h.on and d.Crates then if a.crateFails>=3 then h.on=false e("ignoring the "..h.title.." window - its buttons do not respond")
return nil,("%s window open - press Open or Discard yourself"):format(h.title),"bad"end
if g()-h.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(h.title),"bad"
end local j9,j_=jr(h.data)if j9 then return"crate",("opening %s for %s"):format(h.title,j_),"ok"end
if d.SellJunk then return"nocrate",("discarding %s - nothing ticked inside"):format(h.title),"warn"end
return nil,("%s open - nothing ticked inside it"):format(h.title),"idle"end local dX,gw=cP()
local cl=t()if cl then local bj=y(r(cl))if not P(cl)then local dY=(j.gift and r(j.gift)==r(cl)and g()-j.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bj,dY),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bj,dY),"bad"
end return"sell",("selling %s (%s)"):format(bj,dY),"warn"end if dX<1 then return nil,("holding %s - 0 free stations"):format(bj),"wait"end
return"place",("waxing %s (%d free)"):format(bj,dX),"ok"end a.holding=false if dX<1 then
a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(gw,gw),"wait"
end local dZ=bD()if not dZ then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end
local bk=aE()if bk and fZ(bk.name)then a.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(bk.name),"idle"end
if g()-h.lastFail<8 then return nil,("%s on the pad - could not open it"):format(bk.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(bk.name),"ok"end local ak=dr()
if ak.state~="match"then a.matchSince=nil if ak.state=="skip"and not dZ.Enabled then return nil,ak.text.." (sold out)","idle"end
return nil,ak.text,ak.level end if not dZ.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local bl=g()if bl<a.noCashUntil then local gx,ka=fA()if gx then return nil,("cash short: have $%s, price ~$%s"):format(Q(gx),Q(ka)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(Q(T()),math.ceil(a.noCashUntil-bl)),"bad"
end if bl-a.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or bl
local gy=bl-a.matchSince if gy<d.Confirm then return nil,("confirming %s (%.2fs)"):format(ak.shown,gy),"ok"end
return"buy",("buying %s via %s"):format(ak.shown,ak.src),"ok"end local function L(kb,kc,...)
if a.busy then return end a.busy,a.busyText=true,kb local kd,gz=pcall(kc,...)a.busy,a.busyText=false,""
if not kd and gz~=cB then e("ERR "..tostring(gz))end end local function ke()local aM,kf,kg=gv()
a.reason,a.level=kf,kg if aM=="place"then L("waxing...",fW)elseif aM=="crate"then L("opening crate...",dH,true)
elseif aM=="cratewin"then L("checking crate...",gf)elseif aM=="nocrate"then L("discarding crate...",dH,false)
elseif aM=="sell"then L("selling...",gp)elseif aM=="buy"then L("buying...",fR,false)elseif d.Collect and not a.matchSince and g()-a.lastCollect>=d.Every then
L("collecting money...",j7)end end local function d0(cm,kh)if cm==a.running then return end
a.running=cm if not kh then d.AutoStart=cm end if cm then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
h.lastFail=0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=g()a.plot=as()or a.plot e("START")
else a.reason="stopped"e("STOP")end end local function gA()local d1={}local function k(ki)d1[#d1+1]=tostring(ki)end
k("=== SAB "..ao.." DUMP "..os.date("%H:%M:%S").." ===")k(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
k("reason: "..tostring(a.reason))k("targets: "..table.concat(fb(),", "))k(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
k("cash="..Q(T()))local kj,gB=t()k("in hands: "..tostring(kj)..(gB and(" ("..gB.ClassName..")")or""))
local cn=aE()k("on pad: "..(cn and("%s [%s] %s"):format(cn.name,tostring(cn.rar),tostring(cn.price))or"nothing"))
k("sell spot: "..(a.sellSpot and aT(a.sellSpot)or"none found"))local gC,gD=f3()k(("crate window: on=%s title=%s open=%s discard=%s tapWay=%s opened=%d fails=%d"):format(
tostring(h.on),h.title,tostring(gC and gC.Text),tostring(gD and gD.Text),tostring(a.tapWay),a.crates,a.crateFails))
k("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(f6 and b9~=nil))
k("--- CATALOG ("..q.n.." butters, worst rarity first) ---")for md,co in ipairs(q.rarOrder)do
local d2={}for me,gE in ipairs(q.members[co]or{})do d2[#d2+1]=(d.Targets[gE]and"*"or"")..y(gE)
end k(("  [%s]%s %s"):format(co,w.price[co]and(" crate $"..Q(w.price[co]))or"",table.concat(d2,", ")))
end k("learned orders: ")for kk,kl in pairs(w.order)do k("  "..kk..": "..table.concat(kl,", "))end
k("--- PLOT ---")k("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for mf,d3 in ipairs(a.plot:GetChildren())do
k(("  %s %s (%d)"):format(d3 .ClassName,d3 .Name,#d3:GetChildren()))end local km,kn=cP()
k(("stations free %d / %d"):format(km,kn))local d4=bD()k("BuyPrompt: "..(d4 and("enabled="..tostring(d4 .Enabled).." hold="..d4 .HoldDuration)or"MISSING"))
end k("autostart="..tostring(d.AutoStart).." rejoin="..tostring(d.Rejoin))k(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))k("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#dd())k("--- COLLECT PAD ---")
k("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and aT(a.padPart)or"none"))
k("--- ATTRIBUTES ---")for mg,gF in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
k(("  %s = %s"):format(gF,tostring(v:GetAttribute(gF))))end k("--- EVENTS ---")for ko=math.max(1,#ap-15),#ap do k("  "..ap[ko])end
k("--- LOG ---")for kp=math.max(1,#ab-25),#ab do k("  "..ab[kp])end return table.concat(d1,"\n")
end do local al=dc(C.auto)if type(al)=="string"then al=al:gsub("%s+$","")if al~=""then a.autoload=al
local kq=fl(al)e(kq and("loaded config "..al)or("config "..al.." could not be loaded"))
end end end local c={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local kr={ok=c.good,wait=c.warn,warn=c.warn,bad=c.bad,idle=c.dim}
local ks={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function i(kt,ku,kv)
local kw,d5=pcall(Instance.new,kt)if not kw then a.uiErrs=a.uiErrs+1 return nil end for kx,ky in pairs(ku)do
if not pcall(function()d5[kx]=ky end)then a.uiErrs=a.uiErrs+1 end end d5 .Parent=kv return d5
end local function D(kz,kA)i("UICorner",{CornerRadius=UDim.new(0,kA or 6)},kz)end local b={}
local d6=v:FindFirstChildOfClass("PlayerGui")or v:WaitForChild("PlayerGui")local gG=d6:FindFirstChild("SABFarmGui")
if gG then gG:Destroy()end local d7=i("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},d6)
local gH,gI,aN,bm,d8=320,330,30,38,26 b.root=i("Frame",{Name="Root",Size=UDim2 .new(0,gH,0,gI),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=c.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},d7)
D(b.root,10)i("UIStroke",{Color=c.line,Thickness=1},b.root)local aO=UDim2 .new(1,0,1,0)
local function m(gJ,gK)return UDim2 .new(gJ,0,0,0),UDim2 .new(gK,(gJ+gK>0.99)and 0 or-4,1,0)end
local function l(kB,kC,kD,kE,kF,kG)local gL=i("TextButton",{Text=kC,Position=kF,Size=kG,BackgroundColor3=kD,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=kE,TextColor3=c.text,AutoButtonColor=true},kB)D(gL,6)
return gL end local function gM(kH,kI,kJ,kK,kL)local d9=i("TextBox",{Text=kI,PlaceholderText=kJ,Position=kK,Size=kL,BackgroundColor3=c.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=c.text,PlaceholderColor3=c.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},kH)D(d9,6)i("UIPadding",{PaddingLeft=UDim.new(0,8)},d9)
return d9 end local cp={}local function gN(cq,gO,gP)N(cq.InputBegan:Connect(function(bn)
if bn.UserInputType~=Enum.UserInputType.MouseButton1 and bn.UserInputType~=Enum.UserInputType.Touch then return end
cp[cq]={start=bn.Position,from=gO.Position,moved=0,target=gO}local d_ d_=bn.Changed:Connect(function()
if bn.UserInputState==Enum.UserInputState.End then local gQ=cp[cq]cp[cq]=nil if d_ then d_:Disconnect()end
if gQ and gP then gP(gQ.moved)end end end)end))end N(hE.InputChanged:Connect(function(cr)
if cr.UserInputType~=Enum.UserInputType.MouseMovement and cr.UserInputType~=Enum.UserInputType.Touch then return end
for mh,aa in pairs(cp)do local ea=aa.target if ea and ea.Parent then local gR,gS=cr.Position.X-aa.start.X,cr.Position.Y-aa.start.Y
aa.moved=math.max(aa.moved,math.abs(gR)+math.abs(gS))ea.Position=UDim2 .new(aa.from.X.Scale,aa.from.X.Offset+gR,aa.from.Y.Scale,aa.from.Y.Offset+gS)
end end end))local function u(kM,kN,kO,kP,kQ,kR,kS)return i("TextLabel",{Text=kN,Position=kR or UDim2 .new(0,0,0,0),Size=kS or aO,BackgroundTransparency=1,
Font=kQ and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=kO,TextColor3=kP,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},kM)
end b.title=i("Frame",{Size=UDim2 .new(1,0,0,aN),BackgroundColor3=c.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=i("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=c.dim,BorderSizePixel=0},b.title)
D(b.dot,5)u(b.title,"SAB  BUTTER FARM  "..ao,12,c.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=l(b.title,"-",c.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=l(b.title,"X",c.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=i("Frame",{Position=UDim2 .new(0,0,0,aN),Size=UDim2 .new(1,0,0,bm),BackgroundColor3=c.bg,BorderSizePixel=0},b.root)
b.bar=i("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=c.warn,BorderSizePixel=0},b.strip)
D(b.bar,2)b.reason=u(b.strip,"starting",12,c.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=i("Frame",{Position=UDim2 .new(0,0,0,aN+bm),Size=UDim2 .new(1,0,0,d8),BackgroundTransparency=1},b.root)
b.tabFarm=l(b.tabs,"FARM",c.accent,11,UDim2 .new(0,8,0,0),UDim2 .new(0.34,-10,1,-4))b.tabBut=l(b.tabs,"BUTTERS",c.panel2,11,UDim2 .new(0.34,2,0,0),UDim2 .new(0.33,-6,1,-4))
b.tabSet=l(b.tabs,"SETUP",c.panel2,11,UDim2 .new(0.67,2,0,0),UDim2 .new(0.33,-10,1,-4))
local function eb()local ec=i("ScrollingFrame",{Position=UDim2 .new(0,0,0,aN+bm+d8),Size=UDim2 .new(1,0,1,-(aN+bm+d8)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=c.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)i("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},ec)
i("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},ec)
return ec end b.farm,b.but,b.set=eb(),eb(),eb()b.but.Visible,b.set.Visible=false,false local cs,bo,f=0,12,nil
local function E(gT,kT)cs,bo=cs+1,bo+gT+6 return i("Frame",{Size=UDim2 .new(1,0,0,gT),BackgroundTransparency=1,LayoutOrder=cs},kT or b.farm)
end local function bp(kU)u(E(14),kU,10,c.dim,true)end f=E(34)b.startB=l(f,"START",c.good,14,m(0,0.68))
b.killB=l(f,"KILL",c.bad,14,m(0.68,0.32))local kV=E(42)local function bq(gU,kW,ed)local ee=i("Frame",{Position=UDim2 .new((gU-1)/ed,0,0,0),Size=UDim2 .new(1/ed,gU<ed and-4 or 0,1,0),
BackgroundColor3=c.panel,BorderSizePixel=0},kV)D(ee,6)local gV=u(ee,"0",15,c.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local kX=u(ee,kW,9,c.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))gV.TextXAlignment,kX.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return gV end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=bq(1,"BOUGHT",5),bq(2,"WAXED",5),bq(3,"SOLD",5),bq(4,"MONEY",5),bq(5,"FREE",5)
b.info=u(E(40),"",10,c.dim,false)b.tgt=u(E(26),"",10,c.good,false)bp("MONEY COLLECT")f=E(28)
b.secB=gM(f,tostring(d.Every),"60",m(0,0.2))u(f,"sec",11,c.dim,false,m(0.21,0.09))b.secSet=l(f,"SET",c.accent,12,m(0.3,0.2))
b.colT=l(f,"COLLECT: ON",c.accent,11,m(0.5,0.5))f=E(26)b.padB=l(f,"SET PAD (stand on it)",c.panel2,10,m(0,0.55))
b.padL=u(f,"",10,c.dim,false,m(0.56,0.44))bp("BUTTERS YOU DID NOT TICK, AND CRATES")f=E(28)
b.sellT=l(f,"SELL THEM: ON",c.accent,11,m(0,0.55))b.sellB=l(f,"SELL NOW",c.warn,11,m(0.55,0.45))
f=E(28)b.crateT=l(f,"OPEN CRATES: ON",c.accent,11,m(0,0.55))b.crateB=l(f,"OPEN NOW",c.warn,11,m(0.55,0.45))
bp("TOOLS")f=E(30)b.buyB=l(f,"BUY NOW",c.warn,11,m(0,0.28))b.plB=l(f,"WAX",c.good,11,m(0.28,0.24))
b.dumpB=l(f,"DUMP",c.accent,11,m(0.52,0.24))b.copyB=l(f,"COPY",c.panel2,11,m(0.76,0.24))
bp("LOG")b.log=i("TextLabel",{Size=aO,BackgroundColor3=c.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=10,TextColor3=c.text,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,Text=""},E(84))D(b.log,6)i("UIPadding",{PaddingLeft=UDim.new(0,6),PaddingTop=UDim.new(0,4),PaddingRight=UDim.new(0,6)},b.log)
bp("OUTPUT  (DUMP result)")b.out=i("TextBox",{Size=aO,BackgroundColor3=c.panel,BorderSizePixel=0,Font=Enum.Font.Code,
TextSize=9,TextColor3=Color3 .fromRGB(190,205,170),TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,MultiLine=true,ClearTextOnFocus=false,
Text="DUMP output appears here. Tap COPY to put it on the clipboard."},E(110))D(b.out,6)
b.farm.CanvasSize=UDim2 .new(0,0,0,bo)cs,bo=0,12 local function H(kY)return E(kY,b.set)end
local function ct(kZ)u(H(14),kZ,10,c.dim,true)end ct("SETTINGS FILE  (saved on your phone)")
f=H(28)b.cfgName=gM(f,"default","config name",m(0,0.5))b.cfgSave=l(f,"SAVE",c.good,11,m(0.5,0.25))
b.cfgLoad=l(f,"LOAD",c.accent,11,m(0.75,0.25))f=H(26)b.cfgPrev=l(f,"<",c.panel2,11,m(0,0.13))
b.cfgPick=l(f,"(none saved)",c.panel2,10,m(0.13,0.74))b.cfgNext=l(f,">",c.panel2,11,m(0.87,0.13))
f=H(26)b.cfgAuto=l(f,"LOAD IT ON LAUNCH: OFF",c.panel2,10,m(0,1))b.cfgMsg=u(H(26),"",10,c.dim,false)
ct("START BY ITSELF")f=H(26)b.autoB=l(f,"INSTALL F.exec",c.accent,10,m(0,1))b.autoMsg=u(H(30),"",10,c.dim,false)
f=H(28)b.startT=l(f,"START FARMING ON LOAD: ON",c.accent,10,m(0,1))u(H(26),"Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.",10,c.dim,false)
ct("IF THE GAME DROPS ME")f=H(28)b.rejT=l(f,"AUTO REJOIN: ON",c.accent,11,m(0,0.55))b.rejB=l(f,"REJOIN NOW",c.warn,11,m(0.55,0.45))
b.rejMsg=u(H(30),"",10,c.dim,false)ct("THE ROUND SAB BUTTON")u(H(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,c.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,bo)local gW=i("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},d6)
b.tgRoot=i("Frame",{Size=UDim2 .new(0,46,0,46),Position=UDim2 .new(0,a.togPos and a.togPos[1]or 10,0,a.togPos and a.togPos[2]or 380),
BackgroundColor3=c.accent,BorderSizePixel=0,Active=true},gW)D(b.tgRoot,23)i("UIStroke",{Color=c.line,Thickness=1},b.tgRoot)
b.tgBtn=i("TextButton",{Text="SAB",Size=aO,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=c.text,AutoButtonColor=false},b.tgRoot)b.tgDot=i("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=c.dim,
BorderSizePixel=0},b.tgRoot)D(b.tgDot,4)local gX,cu,ef=false,{},0 local function gY(gZ,eg)
d.Targets[gZ]=eg or nil local eh=cu[gZ]if eh then eh.Text=eg and"X"or""eh.BackgroundColor3=eg and c.good or c.panel2
end end local function ei()for k0,g0 in pairs(cu)do local g1=d.Targets[k0]==true g0 .Text=g1 and"X"or""
g0 .BackgroundColor3=g1 and c.good or c.panel2 end end local br local function k1()local k2=0
local ej=i("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=u(ej,"",10,c.dim,false,m(0,0.5))local k3=l(ej,"CLEAR",c.panel2,10,m(0.5,0.24))
local k4=l(ej,"REFRESH",c.panel2,10,m(0.74,0.26))k3 .MouseButton1Click:Connect(function()
for k5 in pairs(d.Targets)do d.Targets[k5]=nil end ei()end)k4 .MouseButton1Click:Connect(function()
q.at=0 db()br(true)end)return k2 end br=function(k6)if not db()then if not b.butEmpty then
b.butEmpty=u(i("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,c.warn,false)end return
end if gX and not k6 and ef==q.at then return end for mi,ek in ipairs(b.but:GetChildren())do
if ek:IsA("Frame")or ek:IsA("TextButton")then ek:Destroy()end end cu,b.butEmpty={},nil k1()
local el,em=36,1 local function g2(g3)em=em+1 local k7=i("Frame",{Size=UDim2 .new(1,0,0,g3),BackgroundTransparency=1,LayoutOrder=em},b.but)
el=el+g3+6 return k7 end for mj,cv in ipairs(q.rarOrder)do local k8=g2(24)local k9=ks[cv]or c.text
local en=i("Frame",{Size=aO,BackgroundColor3=c.panel,BorderSizePixel=0},k8)D(en,6)u(en,"  "..cv:upper(),11,k9,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local k_=l(en,"ALL",c.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local la=cv
k_.MouseButton1Click:Connect(function()local g4=q.members[la]or{}local g5=false for mk,lb in ipairs(g4)do if not d.Targets[lb]then g5=true break end end
for ml,lc in ipairs(g4)do gY(lc,g5)end end)for mm,eo in ipairs(q.members[cv]or{})do local ld=g2(22)
local cw=i("TextButton",{Text="",Size=aO,BackgroundColor3=c.bg,BorderSizePixel=0,AutoButtonColor=true},ld)
D(cw,5)u(cw,"   "..y(eo),11,c.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local ep=i("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=c.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=c.text,AutoButtonColor=false},cw)
D(ep,4)cu[eo]=ep local g6=eo local function g7()gY(g6,not d.Targets[g6])end cw.MouseButton1Click:Connect(g7)
ep.MouseButton1Click:Connect(g7)end end ei()b.but.CanvasSize=UDim2 .new(0,0,0,el+10)gX,ef=true,q.at
end local g8="farm"local function bs(am)g8=am b.farm.Visible,b.but.Visible,b.set.Visible=(am=="farm"),(am=="but"),(am=="set")
b.tabFarm.BackgroundColor3=(am=="farm")and c.accent or c.panel2 b.tabBut.BackgroundColor3=(am=="but")and c.accent or c.panel2
b.tabSet.BackgroundColor3=(am=="set")and c.accent or c.panel2 if am=="but"then br(false)end
end local function z(g9,g_,le,lf)g9 .Text=g_ and le or lf g9 .BackgroundColor3=g_ and c.accent or c.panel2
end local function lg()b.secB.Text=tostring(d.Every)z(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
z(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")z(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
z(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")z(b.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
if d.AutoStart~=a.running then d0(d.AutoStart,true)end if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end a.lastCollect=g()
ei()end local function lh(ha)task.spawn(function()ha.TextColor3=c.bad task.wait(0.8)if a.alive then ha.TextColor3=c.text end
end)end local function hb()local hc=b.secB.Text:match("^%s*(%d+)%s*$")local bt=hc and tonumber(hc)
if not bt or bt<1 then b.secB.Text=tostring(d.Every)lh(b.secB)e("interval must be a whole number >= 1")
return end if bt==d.Every then return end d.Every,a.lastCollect=bt,g()e("collect every "..bt.."s")
end local function hd(li)local he=setclipboard or toclipboard return type(he)=="function"and pcall(he,li)
end local function lj()local eq=ac~=""and ac or(a.reason.."\n"..table.concat(ab,"\n"))if hd(eq)then e("copied "..#eq.." chars")return end
b.out.Text=eq pcall(function()b.out:CaptureFocus()end)e("no clipboard here - select the text in OUTPUT")
end local function lk()local ll,hf=pcall(gA)ac=ll and hf or("DUMP ERROR "..tostring(hf))
local hg=hd(ac)b.out.Text=(hg and#ac>7000)and(ac:sub(1,7000).."\n... (full text is on your clipboard)")or ac
e("DUMP "..#ac.." chars"..(hg and", copied"or""))end local function o(lm,ln)N(lm.MouseButton1Click:Connect(ln))end
o(b.secSet,hb)N(b.secB.FocusLost:Connect(hb))o(b.colT,function()d.Collect,a.lastCollect=not d.Collect,g()
z(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")end)o(b.sellT,function()d.SellJunk=not d.SellJunk
z(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)o(b.sellB,function()a.sellFails=0
task.spawn(L,"selling...",gp)end)o(b.crateT,function()d.Crates=not d.Crates z(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)o(b.crateB,function()h.lastFail=0 task.spawn(L,"opening crate...",dH,true)end)o(b.padB,function()
a.plot=as()or a.plot local hh,er=ar(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(hh and er and er:IsA("BasePart"))then e("SET PAD: need character and plot")return end
a.manualPad=er.CFrame:ToObjectSpace(hh.HumanoidRootPart.CFrame)jX(a.manualPad)e("collect pad saved at your position")
end)o(b.startB,function()d0(not a.running)end)o(b.buyB,function()a.plot=as()or a.plot task.spawn(L,"buying (manual)...",fR,true)
end)o(b.plB,function()a.plot=as()or a.plot task.spawn(L,"waxing (manual)...",fW)end)o(b.dumpB,lk)
o(b.copyB,lj)o(b.tabFarm,function()bs("farm")end)o(b.tabBut,function()bs("but")end)o(b.tabSet,function()bs("set")end)
local function hi(es)a.hidden=es b.root.Visible=not es b.tgBtn.Text=es and"SAB+"or"SAB"
end gN(b.tgRoot,b.tgRoot,function(lo)a.togPos={b.tgRoot.Position.X.Offset,b.tgRoot.Position.Y.Offset}
if lo<8 then hi(not a.hidden)end end)o(b.tgBtn,function()hi(not a.hidden)end)local F,A={},0
local function an()F=dd()if#F==0 then b.cfgPick.Text="(none saved)"A=0 return end if A<1 or A>#F then A=1 end
b.cfgPick.Text=F[A]..("  (%d/%d)"):format(A,#F)end local function hj()local hk=a.autoload~=nil
b.cfgAuto.Text=hk and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"b.cfgAuto.BackgroundColor3=hk and c.accent or c.panel2
end local function et()local hl=b.cfgName.Text:gsub("^%s+",""):gsub("%s+$","")if hl~=""then return hl end
return(A>0 and F[A])or""end o(b.cfgSave,function()a.winPos={b.root.Position.X.Offset,b.root.Position.Y.Offset}
a.togPos={b.tgRoot.Position.X.Offset,b.tgRoot.Position.Y.Offset}local hm,hn=dg(et())b.cfgMsg.Text=hm and("saved as "..hn)or("could not save: "..hn)
b.cfgMsg.TextColor3=hm and c.good or c.bad an()e(b.cfgMsg.Text)end)local function lp(ho)
local eu,hp=fl(ho)b.cfgMsg.Text=eu and("loaded "..hp)or("could not load: "..hp)b.cfgMsg.TextColor3=eu and c.good or c.bad
if eu then b.cfgName.Text=ho lg()end e(b.cfgMsg.Text)end o(b.cfgLoad,function()lp(et())end)
o(b.cfgPick,function()an()if A>0 then b.cfgName.Text=F[A]end end)o(b.cfgPrev,function()
if#F==0 then an()return end A=(A-2)%#F+1 an()b.cfgName.Text=F[A]end)o(b.cfgNext,function()
if#F==0 then an()return end A=A%#F+1 an()b.cfgName.Text=F[A]end)o(b.cfgAuto,function()if a.autoload then
fn(nil)b.cfgMsg.Text="it will not load a config on launch"else local bu=et()local hq=false
for mn,lq in ipairs(dd())do if lq==bu then hq=true end end local lr=hq or dg(bu)if lr and bu~=""then
fn(bu)an()b.cfgMsg.Text=bu.." will load every time the script starts"else b.cfgMsg.Text="name the config and save it first"
end end b.cfgMsg.TextColor3=c.dim hj()end)o(b.autoB,function()local hr,hs=iM()b.autoMsg.Text=hr and("installed. "..hs)or("failed: "..hs)
b.autoMsg.TextColor3=hr and c.good or c.bad e(b.autoMsg.Text)end)o(b.startT,function()d.AutoStart=not d.AutoStart
z(b.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")end)o(b.rejT,function()
d.Rejoin=not d.Rejoin z(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")end)o(b.rejB,function()bW("you asked")end)
local aP=false o(b.minB,function()aP=not aP b.tabs.Visible=not aP if aP then b.farm.Visible,b.but.Visible,b.set.Visible=false,false,false
else bs(g8)end b.root.Size=UDim2 .new(0,gH,0,aP and(aN+bm)or gI)b.minB.Text=aP and"+"or"-"
end)local function cx()if not a.alive then return end a.alive,a.running=false,false pcall(cW)
for mo,ls in ipairs(cC)do pcall(function()ls:Disconnect()end)end pcall(function()d7:Destroy()end)
pcall(function()gW:Destroy()end)if aA.SAB_KILL==cx then aA.SAB_KILL=nil end end aA.SAB_KILL=cx
o(b.killB,cx)o(b.xB,cx)gN(b.title,b.root,function()a.winPos={b.root.Position.X.Offset,b.root.Position.Y.Offset}
end)local function ht()local bv,bw=a.reason,a.level if a.busy then bv,bw=a.busyText,"ok"
elseif not a.running then local mp,hu,lt=gv()if a.capHit then bv,bw=hu,"bad"else bv,bw="[stopped] "..hu,(lt=="bad")and"bad"or"idle"end
a.reason,a.level=bv,bw end b.reason.Text=bv b.bar.BackgroundColor3=kr[bw]or c.dim b.dot.BackgroundColor3=a.running and c.good or(a.capHit and c.bad or c.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and c.panel2 or c.accent
b.startB.Text=a.running and"STOP"or"START"z(b.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.startB.BackgroundColor3=a.running and c.warn or c.good local lu,lv=cP()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),lu.."/"..lv local hv=(a.running and d.Collect)and math.max(0,math.ceil(d.Every-(g()-a.lastCollect)))or nil
local hw=t()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
Q(T()),a.rolls,a.gifts,a.crates,hw and y(r(hw))or"nothing",h.on and("   ["..h.title.." window open]")or"",
hv and("in "..hv.."s")or"off")local aQ=fb()b.tgt.Text=(#aQ==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#aQ<=3)and table.concat(aQ,", ")or(#aQ.." butters ticked")))b.tgt.TextColor3=(#aQ==0)and c.bad or c.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(bz,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(q.n,#q.rarOrder,#aQ)
end if b.but.Visible and ef~=q.at then br(false)end end aA.SAB={S=a,CFG=d,EV=j,U=b,sg=d7,dump=gA,CAT=q,LEARN=w,buildList=br}
e(ao.." loaded")if a.uiErrs>0 then e("UI: "..a.uiErrs.." properties skipped")end bs("farm")
an()hj()if a.config and a.config~=""then b.cfgName.Text=a.config end z(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
z(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")z(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
z(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")z(b.startT,d.AutoStart,"START FARMING ON LOAD: ON","START FARMING ON LOAD: OFF")
b.secB.Text=tostring(d.Every)pcall(ht)task.spawn(function()local hx=di()b.rejMsg.Text=hx and("after a rejoin it restarts from\n"..hx)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(dc(C.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(iQ)end)task.spawn(function()while a.alive do local lw,lx=pcall(ht)if not lw then e("UI ERR "..tostring(lx))end
task.wait(0.25)end end)task.spawn(function()local ly,lz=pcall(i0)if not ly then e("HOOK ERR "..tostring(lz))end
end)task.spawn(function()pcall(h2)if db()then e(("catalog: %d butters in %d rarities"):format(q.n,#q.rarOrder))end
local lA,hy=pcall(jZ)if lA and hy and a.alive and not a.manualPad then a.manualPad=hy end
end)task.spawn(function()while a.alive do task.wait(20)pcall(cW)end end)if hF and cA then
N(v.Idled:Connect(function()pcall(function()cA:CaptureController()cA:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()if not d.AutoStart then return end a.reason,a.level="waiting for the game to load, then starting","wait"
for mq=1,120 do if not a.alive then return end if a.running then return end a.plot=a.plot or as()
if ar()and a.plot and next(d.Targets)then d0(true,true)e("started by itself")return end
task.wait(1)end if a.alive and not a.running then e("gave up waiting to start - tap START")end
end)task.spawn(function()a.plot=as()a.lastCollect=g()while a.alive do if a.running then
local lB,hz=pcall(ke)if not lB and hz~=cB then e("LOOP ERR "..tostring(hz))end end task.wait(0.1)
end end)cy("loaded - window is at the top left")end local lD,ev=xpcall(hD,function(lC)return tostring(lC).."\n"..debug.traceback()end)
if not lD then pcall(function()warn("SAB "..ao.." ERROR: "..tostring(ev))end)cy("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..ao.." ERROR: "..tostring(ev))end)pcall(function()local hA=(type(getgenv)=="function"and getgenv())or _G
if type(hA.SAB_KILL)=="function"then hA.SAB_KILL()end for mr,lE in ipairs({"SABFarmGui","SABToggle"})do
local hB=v.PlayerGui:FindFirstChild(lE)if hB then hB:Destroy()end end end)pcall(function()
local bx=Instance.new("ScreenGui")bx.Name="SABError"bx.ResetOnSpawn=false bx.DisplayOrder=1000
local M=Instance.new("TextBox")M.Size=UDim2 .new(0,340,0,170)M.Position=UDim2 .new(0,10,0,50)
M.BackgroundColor3=Color3 .fromRGB(90,20,20)M.TextColor3=Color3 .new(1,1,1)M.TextSize=11
M.TextWrapped=true M.ClearTextOnFocus=false M.TextXAlignment=Enum.TextXAlignment.Left M.TextYAlignment=Enum.TextYAlignment.Top
M.Text="SAB "..ao.." failed to start. Send this text:\n"..tostring(ev)M.Parent=bx bx.Parent=v:WaitForChild("PlayerGui")
end)end
