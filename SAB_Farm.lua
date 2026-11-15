local ao="v15"local et=game:GetService("Players")local u=et.LocalPlayer or et.PlayerAdded:Wait()
local function cw(hy)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="SAB "..ao,Text=hy,Duration=6})
end)end cw("script started")local function hz()local bx=game:GetService("ReplicatedStorage")
local cx=game:GetService("Workspace")local hA=game:GetService("UserInputService")local ay=(type(getgenv)=="function"and getgenv())or _G
if type(ay.SAB_KILL)=="function"then pcall(ay.SAB_KILL)end local g=(type(tick)=="function")and tick or os.clock
local hB,cy=pcall(function()return game:GetService("VirtualUser")end)local d={Targets={applepie=true},
Collect=true,Every=60,SellJunk=true,Crates=true,Rejoin=true,Confirm=0.35,BuyGap=1.2,PlaceTries=3,PadDwell=0.7,
}local a={alive=true,running=false,busy=false,busyText="",holding=false,bought=0,placed=0,collected=0,sold=0,rolls=0,gifts=0,
placeFails=0,cashFails=0,sellFails=0,capHit=false,capMsg="",uiErrs=0,lastBuyAt=0,lastCollect=0,noCashUntil=0,
matchSince=nil,boot=g(),plot=nil,reason="starting",level="wait",lastCarryDesc="",padSearchAt=-100,padPart=nil,padCands={},manualPad=nil,
sellSpot=nil,sellSearchAt=-100,noSellSpot=false,catAt=0,crates=0,crateFails=0,tapWay=nil,
config="default",autoload=nil,selfPath=nil,rejoining=false,winPos=nil,togPos=nil,hidden=false,
}local j={name=nil,rar=nil,at=g(),seq=0,init=nil,initAt=0,gift=nil,giftAt=0}local h={on=false,data=nil,at=0,title="crate",lastFail=0,padAt=0}
local cz={}local cA,by,ab,ap={},{},{},{}local ac=""local function M(eu)cA[#cA+1]=eu return eu end
local function aq(hC)task.wait(hC)if not a.alive then error(cz,0)end end local function e(bz)
bz=os.date("%H:%M:%S").." "..tostring(bz)table.insert(by,1,bz)if#by>6 then table.remove(by)end
ab[#ab+1]=bz if#ab>80 then table.remove(ab,1)end end local function hD(ev)if type(ev)~="string"then return""end
return(ev:lower():gsub("[^%w]",""))end local function r(hE)local ew=hD(hE)local cB=ew:gsub("butter$","")
if cB==""then cB=ew end return cB end local function P(cC)return type(cC)=="string"and r(cC)~=""and d.Targets[r(cC)]==true end
local function hF(aR)aR=aR:lower()return aR:find("squishy",1,true)~=nil or aR:match("butter$")~=nil or aR:match("butter[^%a]")~=nil
end local cD={"","K","M","B","T","Qa","Qi","Sx","Sp","Oc","No","Dc"}local function Q(aS)
if type(aS)~="number"then return"?"end local bA=1 while math.abs(aS)>=1000 and bA<#cD do aS=aS/1000 bA=bA+1 end
local hG=string.format("%.2f",aS):gsub("%.?0+$","")return hG..cD[bA]end local function hH(ex)
if type(ex)~="string"then return nil end local hI,ey=ex:gsub(",",""):match("([%d%.]+)%s*(%a*)")
local cE=tonumber(hI)if not cE then return nil end if ey==""then return cE end for hJ,hK in ipairs(cD)do if hK:lower()==ey:lower()then return cE*1000^(hJ-1)end end
return nil end local function T()local ez=u:GetAttribute("BoardValueMoney")if type(ez)=="number"then return ez end
local eA=u:FindFirstChild("leaderstats")if eA then for lB,hL in ipairs({"Cash","Money","Coins"})do
local cF=eA:FindFirstChild(hL)if cF and type(cF.Value)=="number"then return cF.Value end
end end end local function aT(hM)local cG=hM:GetFullName()if a.plot then local cH=a.plot:GetFullName()
if cG:sub(1,#cH)==cH then return cG:sub(#cH+2)end end return cG end local function az()
local bB=u.Character if bB and bB:FindFirstChild("HumanoidRootPart")then local eB=bB:FindFirstChildOfClass("Humanoid")
if eB and eB.Health>0 then return bB end end end local function aA()local cI=cx:FindFirstChild("Plots")
if not cI then return nil end local function eC(hN)local eD=hN:FindFirstChild("Plate")return eD~=nil and eD:FindFirstChild("EditStackAttachment",true)~=nil
end local eE=u:GetAttribute("PlotNumber")if eE~=nil then local cJ=cI:FindFirstChild(tostring(eE))
if cJ and eC(cJ)then return cJ end end for lC,eF in ipairs(cI:GetChildren())do if eC(eF)then return eF end
end end local function aU(eG)local ad=eG and eG.Parent for lD=1,6 do if not ad then return nil end
if ad:IsA("BasePart")then return ad end if ad:IsA("Model")then return ad.PrimaryPart or ad:FindFirstChildWhichIsA("BasePart",true)end
ad=ad.Parent end end local function eH(eI)local cK=eI.Parent if cK and cK:IsA("Attachment")then return cK.WorldPosition end
local eJ=aU(eI)return eJ and eJ.Position end local function hO()local aB=a.plot and a.plot:FindFirstChild("Plate")
if not aB then return nil end if aB:IsA("BasePart")then return aB.Position end if aB:IsA("Model")then return aB:GetPivot().Position end
local eK=aB:FindFirstChildWhichIsA("BasePart",true)return eK and eK.Position end local function eL()
local cL={}local eM=a.plot and a.plot:FindFirstChild("WaxStations")if eM then for lE,hP in ipairs(eM:GetChildren())do
local eN=hP:FindFirstChild("SquishyPlaceHolder")local cM=eN and eN:FindFirstChild("PlacePrompt")
if cM and cM:IsA("ProximityPrompt")then cL[#cL+1]=cM end end end return cL end local function cN()
local eO,cO=eL(),0 for lF,hQ in ipairs(eO)do if hQ.Enabled then cO=cO+1 end end local cP=#eO
local cQ=u:GetAttribute("WaxStations")if type(cQ)=="number"and cQ>cP then cP=cQ end return cO,cP
end local function hR()local eP=az()local eQ=eP and eP.HumanoidRootPart.Position local cR,eR
for lG,cS in ipairs(eL())do if cS.Enabled then local eS=eH(cS)local eT=(eS and eQ)and(eS-eQ).Magnitude or 1e9
if not cR or eT<eR then cR,eR=cS,eT end end end return cR end local function bC()local bD=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not bD then return nil end local eU=bD:FindFirstChild("BuyPromptAttachment")local bE=(eU and eU:FindFirstChild("BuyPrompt"))or bD:FindFirstChild("BuyPrompt",true)
if bE and bE:IsA("ProximityPrompt")and bE:IsDescendantOf(bD)then return bE end end local hS={"Common","Rare","Epic","Legendary","Mythic","Celestial","Divine","Dream","Sugar Rush","Picnic"}
local hT={["Sugar Rush"]={"CherryButter","StrawberryCrepeButter","CreamPuffButter","CheesecakeButter","TiramisuButter"},
["Picnic"]={"CantaloupeButter","CinnamonRollButter","StrawberryShortcakeButter","BreakfastButter","ApplePieButter"},
}local v={order={},price={},dirty=false}local o={rar={},pretty={},members={},rarOrder={},n=0,at=0}
local cT="SAB_order.txt"local function cU()if not v.dirty or type(writefile)~="function"then return end
local aV={}for hU,hV in pairs(v.price)do aV[#aV+1]="P|"..hU.."|"..string.format("%.0f",hV)end
for hW,hX in pairs(v.order)do aV[#aV+1]="O|"..hW.."|"..table.concat(hX,",")end if pcall(writefile,cT,table.concat(aV,"\n"))then v.dirty=false end
end local function hY()if type(isfile)~="function"or type(readfile)~="function"then return end
local hZ,h0=pcall(isfile,cT)if not(hZ and h0)then return end local h1,eV=pcall(readfile,cT)
if not(h1 and type(eV)=="string")then return end for h2 in eV:gmatch("[^\n]+")do local eW,eX,cV=h2:match("^(%a)|([^|]+)|(.*)$")
if eW=="P"then v.price[eX]=tonumber(cV)elseif eW=="O"and cV~=""then local bF={}for h3 in cV:gmatch("[^,]+")do bF[#bF+1]=h3 end
if#bF>0 then v.order[eX]=bF end end end end local function h4(bG)if type(bG)~="table"then return end
local ar,eY=bG.rarity,bG.contents if type(ar)~="string"or ar==""or type(eY)~="table"then return end
local aW={}for lH,bH in ipairs(eY)do if type(bH)=="table"and type(bH.butter)=="string"then
aW[#aW+1]={n=bH.butter,ch=tonumber(bH.chance)or 0}end end if#aW==0 then return end table.sort(aW,function(h5,h6)return h5 .ch>h6 .ch end)
local aX,aY={},false for h7,h8 in ipairs(aW)do aX[h7]=h8 .n end local cW=v.order[ar]if not cW or#cW~=#aX then aY=true end
if not aY then for eZ=1,#aX do if cW[eZ]~=aX[eZ]then aY=true break end end end v.order[ar]=aX
local cX=tonumber(bG.price)if cX and v.price[ar]~=cX then v.price[ar]=cX aY=true end if aY then
v.dirty=true o.at=0 e("learned the "..ar.." order from its crate")end end local function aZ(h9,h_)
local ia=h9:FindFirstChild(h_,true)local ib,cY=pcall(function()return ia.Text end)return(ib and type(cY)=="string"and cY~="")and cY or nil
end local function z(e0)return o.pretty[e0]or e0 end local function ic()local e1=bx:FindFirstChild("Assets")
local e2=e1 and e1:FindFirstChild("Squishies")if not e2 then return false end local cZ,e3,aC={},{},{}
local bI=0 for lI,bJ in ipairs(e2:GetChildren())do local a0=r(bJ.Name)if a0~=""and not cZ[a0]then
local bK=aZ(bJ,"RarityText")or"?"cZ[a0]=bK e3[a0]=aZ(bJ,"NameText")or bJ.Name aC[bK]=aC[bK]or{}
table.insert(aC[bK],a0)bI=bI+1 end end if bI==0 then return false end for e4,id in pairs(aC)do
local e5=v.order[e4]or hT[e4]local c0={}if e5 then for ie,ig in ipairs(e5)do c0[r(ig)]=ie end end
table.sort(id,function(e6,e7)local c1,c2=c0[e6],c0[e7]if c1 and c2 then return c1<c2 end
if c1 then return true end if c2 then return false end return z(e6)<z(e7)end)end local c3={}
for ih,ii in ipairs(hS)do c3[ii]=ih end local bL={}for ij in pairs(aC)do bL[#bL+1]=ij end
table.sort(bL,function(c4,c5)local c6,c7=v.price[c4],v.price[c5]if c6 and c7 and c6~=c7 then return c6<c7 end
local c8,c9=c3[c4],c3[c5]if c8 and c9 then return c8<c9 end if c8 then return true end if c9 then return false end
return c4<c5 end)o.rar,o.pretty,o.members,o.rarOrder,o.n,o.at=cZ,e3,aC,bL,bI,g()return true
end local function c_()if o.at==0 or(g()-o.at)>120 then pcall(ic)end return o.n>0 end local function ik(il)
local e8=r(il)return o.rar[e8]or(j.name and r(j.name)==e8 and j.rar)or"?"end local function e9()
local bM={}for im,io in pairs(d.Targets)do if io then bM[#bM+1]=z(im)end end table.sort(bM)
return bM end local A={dir="SAB",cfg="SAB/configs",auto="SAB/autoload.txt",exec="autoexec/SAB_autoload.lua"}
local function e_()return type(writefile)=="function"and type(readfile)=="function"and type(isfile)=="function"end
local function bN(fa)if type(makefolder)~="function"then return end local ip,iq=pcall(isfolder,fa)
if not(ip and iq)then pcall(makefolder,fa)end end local function da(fb)if type(isfile)~="function"or type(readfile)~="function"then return nil end
local ir,is=pcall(isfile,fb)if not(ir and is)then return nil end local it,iu=pcall(readfile,fb)
return it and iu or nil end local function bO(iv,iw)if type(writefile)~="function"then return false end
return(pcall(writefile,iv,iw))end local function fc(ix)local a1={}if type(listfiles)~="function"then return a1 end
local iy,fd=pcall(listfiles,ix)if not iy or type(fd)~="table"then return a1 end for lJ,iz in ipairs(fd)do a1[#a1+1]=tostring(iz)end
return a1 end local function fe()local bP={}for lK,iA in ipairs(fc(A.cfg))do local ff=iA:match("([^/\\]+)%.txt$")
if ff then bP[#bP+1]=ff end end table.sort(bP)return bP end local function iB()local H={"V|1"}
H[#H+1]="N|Every|"..tostring(d.Every)for lL,fg in ipairs({"Collect","SellJunk","Crates","Rejoin"})do
H[#H+1]="B|"..fg.."|"..(d[fg]and"1"or"0")end if a.winPos then H[#H+1]=("W|%d|%d"):format(a.winPos[1],a.winPos[2])end
if a.togPos then H[#H+1]=("G|%d|%d"):format(a.togPos[1],a.togPos[2])end local bQ={}for iC,iD in pairs(d.Targets)do if iD then bQ[#bQ+1]=iC end end
table.sort(bQ)for lM,iE in ipairs(bQ)do H[#H+1]="T|"..iE end return table.concat(H,"\n")
end local function iF(db)if type(db)~="string"or db==""then return false end local fh,fi={},false
for iG in db:gmatch("[^\n]+")do local a2,as,bR=iG:match("^(%a)|([^|]*)|?(.*)$")if a2=="N"and as=="Every"then
local dc=tonumber(bR)if dc and dc>=1 then d.Every=math.floor(dc)end elseif a2=="B"then if d[as]~=nil then d[as]=(bR=="1")end
elseif a2=="W"then a.winPos={tonumber(as)or 10,tonumber(bR)or 44}elseif a2=="G"then a.togPos={tonumber(as)or 10,tonumber(bR)or 300}
elseif a2=="T"and as~=""then fh[as]=true fi=true end end if fi then d.Targets=fh end return true
end local function dd(aD)if not e_()then return false,"this executor cannot write files"end
aD=(aD or"default"):gsub("[^%w_%- ]",""):gsub("^%s+",""):gsub("%s+$","")if aD==""then return false,"give the config a name"end
bN(A.dir)bN(A.cfg)if not bO(A.cfg.."/"..aD..".txt",iB())then return false,"could not write the file"end
a.config=aD return true,aD end local function fj(bS)local fk=da(A.cfg.."/"..bS..".txt")
if not fk then return false,"no config called "..tostring(bS)end if not iF(fk)then return false,"that config looks empty"end
a.config=bS return true,bS end local function fl(de)if de then bN(A.dir)bO(A.auto,de)elseif type(delfile)=="function"then
pcall(delfile,A.auto)else bO(A.auto,"")end a.autoload=de end local function df()if a.selfPath then return a.selfPath end
local bT for lN,iH in ipairs({"","scripts","Scripts","Delta","Delta/Scripts",A.dir})do for lO,fm in ipairs(fc(iH))do
local dg=fm:lower()if dg:sub(-4)==".lua"and(dg:find("sab_farm",1,true)or dg:find("sab farm",1,true))then
bT=bT or fm end end end a.selfPath=bT return bT end A.stub=[[
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
local function iI()if not e_()then return false,"this executor cannot write files"end bN("autoexec")
if not bO(A.exec,A.stub)then return false,"could not write to the autoexec folder"end local fn=df()
return true,fn and("it will load "..fn)or"now save this script in Delta so the loader can find it"
end local fo,bU=pcall(function()return game:GetService("TeleportService")end)local function fp()
if type(queueonteleport)~="function"and type(queue_on_teleport)~="function"then return false end
local iJ=queueonteleport or queue_on_teleport local fq=df()if not fq then return false end
return(pcall(iJ,("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(fq)))
end local function bV(iK)if a.rejoining then return end a.rejoining=true e("REJOIN ("..iK..")")
pcall(cU)if a.autoload then pcall(dd,a.autoload)end local iL=fp()e(iL and"queued the script for the new server"or"no saved copy found - set up autoexec for a clean restart")
task.spawn(function()for lP=1,30 do if not fo or not bU then break end pcall(function()bU:Teleport(game.PlaceId,u)end)
task.wait(10)end end)end local function iM()local iN,fr=pcall(function()return game:GetService("GuiService")end)
if iN and fr then pcall(function()M(fr.ErrorMessageChanged:Connect(function()if d.Rejoin then bV("roblox error message")end
end))end)end pcall(function()local fs=game:GetService("CoreGui")local ft=fs and fs:WaitForChild("RobloxPromptGui",15)
local fu=ft and ft:WaitForChild("promptOverlay",15)if fu then M(fu.ChildAdded:Connect(function(iO)
if d.Rejoin and tostring(iO.Name):lower():find("errorprompt",1,true)then bV("disconnect prompt")end
end))end end)pcall(function()M(u.OnTeleport:Connect(function(iP)if tostring(iP):find("Started")then fp()end
end))end)if fo and bU then pcall(function()M(bU.TeleportInitFailed:Connect(function()a.rejoining=false
if d.Rejoin then task.delay(5,function()bV("teleport retry")end)end end))end)end end local function fv(iQ)
local fw=a.plot and a.plot:FindFirstChild(iQ)if not fw then return nil,false end for lQ,dh in ipairs(fw:GetChildren())do
if dh:IsA("Model")or dh:IsA("BasePart")then return dh,true end end return nil,true end local function aE()
local ae=fv("RolledSquishy")if not ae then return nil end return{model=ae,name=ae.Name,pretty=aZ(ae,"NameText")or z(r(ae.Name)),
rar=aZ(ae,"RarityText")or ik(ae.Name),price=aZ(ae,"PriceText")}end local function t()local di,iR=fv("SquishyEquipped")
if di then return di.Name,di end if iR then return nil end local dj=u:GetAttribute("SquishyEquipped")
if type(dj)=="string"and dj~=""then return dj,nil end for lR,fx in ipairs({u.Character,u:FindFirstChildOfClass("Backpack")})do
if fx then for lS,a3 in ipairs(fx:GetChildren())do if(a3:IsA("Tool")or a3:IsA("Model"))and hF(a3 .Name)then return a3 .Name,a3 end
end end end end local function lT()local lU,iS=t()return iS end local function fy()local fz=aE()
local dk=fz and hH(fz.price)local dl=T()if dk and dl and dl<dk*0.5 then return dl,dk end
end local function a4(iT)ap[#ap+1]=os.date("%H:%M:%S").." "..iT if#ap>40 then table.remove(ap,1)end
end local function iU(aF,bW)if type(aF)~="string"then return end a4(("Roll(%s,%s)"):format(aF,tostring(bW)))
if aF:lower():find("crate",1,true)then return end j.seq=j.seq+1 j.name,j.at=aF,g()j.rar=type(bW)=="string"and bW or nil
a.rolls=a.rolls+1 if P(aF)then e(("ROLL %s [%s] = TARGET"):format(aF,tostring(bW)))end end
local function iV(au)if type(au)~="table"then return end local bX=au.butter or au.itemName
if type(bX)~="string"then return end a.gifts=a.gifts+1 j.gift,j.giftAt=bX,g()if type(au.giftId)=="string"then
local fA=bx:FindFirstChild("Remotes")local fB=fA and fA:FindFirstChild("GiftThanks")if fB then pcall(function()fB:FireServer(au.giftId)end)end
end a4("Gift("..bX.." from "..tostring(au.fromName)..")")e(("GIFT from %s: %s - it will not be waxed"):format(tostring(au.fromName),bX))
end local function iW()local fC=bx:WaitForChild("Remotes",30)if not a.alive then return end
if not fC then e("Remotes folder missing - no roll events")return end local iY={SquishyRollAnimation=iU,
InitSquishy=function(fD)j.init,j.initAt=tostring(fD),g()a4("Init("..tostring(fD)..")")end,
CrateUpdate=function(a5,iX)pcall(h4,a5)if type(a5)=="table"and iX~=false then h.on,h.data,h.at=true,a5,g()
h.title=tostring(a5 .title or a5 .name or"crate")a4("CrateWindow("..h.title..")")else if h.on then a4("CrateWindow closed")end
h.on,h.data=false,nil end end,GiftReceived=iV,}for bY,iZ in pairs(iY)do local dm=fC:FindFirstChild(bY)
if dm and dm:IsA("RemoteEvent")then M(dm.OnClientEvent:Connect(iZ))elseif bY~="CrateUpdate"and bY~="GiftReceived"then e("remote "..bY.." missing")end
end end local function dn()local av=aE()if av then if P(av.name)then return{state="match",shown=av.pretty,src="pad",info=av}
end return{state="skip",info=av,level="idle",text=("on pad: %s [%s] - not ticked"):format(av.pretty,tostring(av.rar))}
end if j.name and(g()-j.at)<4 then if P(j.name)then return{state="match",shown=z(r(j.name)),src="roll event"}
end return{state="skip",level="idle",text=("rolled %s [%s] - not ticked"):format(z(r(j.name)),tostring(j.rar))}
end return{state="none",level="wait",text="no result on pad (auto-roll running)"}end local function fE(i0,i1,i2,i3)
local bZ=RaycastParams.new()bZ.FilterType=Enum.RaycastFilterType.Exclude local dp={u.Character}
for lV,i4 in ipairs(i3 or{})do dp[#dp+1]=i4 end bZ.FilterDescendantsInstances=dp pcall(function()bZ.RespectCanCollide=true end)
local fF=cx:Raycast(Vector3 .new(i0,i1+4,i2),Vector3 .new(0,-30,0),bZ)return fF and fF.Position or nil
end local function dq(fG)local fH=fG:FindFirstChildOfClass("Humanoid")return((fH and fH.HipHeight)or 2)+fG.HumanoidRootPart.Size.Y/2+0.2
end local function dr(i5,i6)local fI=i5:FindFirstChildOfClass("Humanoid")local i7=g()while g()-i7<i6 do
if fI and fI.FloorMaterial~=Enum.Material.Air then return true end aq(0.05)end return false
end local function b0(i8,ds,dt)local fJ=i8 .HumanoidRootPart fJ.AssemblyLinearVelocity=Vector3 .new(0,0,0)
fJ.CFrame=dt and CFrame.new(ds,Vector3 .new(dt.X,ds.Y,dt.Z))or CFrame.new(ds)end local function b1(V,fK)
local aw=az()if not aw or not V then return false end local af=V.Position local b2=math.clamp(math.max(V.Size.X,V.Size.Z)/2+2.2,3,7)
local fL=(fK and fK.MaxActivationDistance)or 10 if b2>fL-2 then b2=math.max(2.5,fL-2)end
local a6={}local function ax(a7)a7=Vector3 .new(a7 .X,0,a7 .Z)if a7 .Magnitude>0.05 then a6[#a6+1]=a7 .Unit end
end local fM=hO()if fM then ax(fM-af)end ax(V.CFrame.LookVector)ax(-V.CFrame.LookVector)
ax(V.CFrame.RightVector)ax(-V.CFrame.RightVector)ax(aw.HumanoidRootPart.Position-af)if#a6==0 then ax(Vector3 .new(0,0,1))end
local i9,b3=dq(aw),false for lW,i_ in ipairs(a6)do local b4=af+i_*b2 local du=fE(b4 .X,af.Y,b4 .Z,{V})
if du and math.abs(du.Y-af.Y)<14 then b0(aw,Vector3 .new(b4 .X,du.Y+i9,b4 .Z),af)if dr(aw,0.7)then b3=true break end
end end if not b3 then b0(aw,af+a6[1]*b2+Vector3 .new(0,3,0),af)b3=dr(aw,1)end aq(0.12)
return b3 end local function ja(a8)if not a8 .Parent or not a8 .Enabled then return false end
pcall(function()a8:InputHoldBegin()end)aq(math.max(a8 .HoldDuration,0)+0.08)pcall(function()a8:InputHoldEnd()end)
return true end local function aG(fN,jb)local jc=g()while g()-jc<jb do if fN()then return true end
aq(0.05)end return fN()end local function b5(aH,jd,fO,je)local jf=a.zapFirst and{"zap","hold"}or{"hold","zap"}
for jg,dv in ipairs(jf)do if jg==2 and(je or not(aH.Parent and aH.Enabled and(not fO or fO())))then break end
local dw if dv=="hold"then dw=ja(aH)else dw=type(fireproximityprompt)=="function"and aH.Parent~=nil and aH.Enabled and pcall(fireproximityprompt,aH)end
if dw and aG(jd,1.2)then a.zapFirst=(dv=="zap")return true,dv end end return false end local function fP(dx)
local ag=bC()if not ag or not ag.Enabled then e("buy: nothing on the pad")return false end
local fQ=aU(ag)if not fQ then e("buy: pad part missing")return false end a.lastBuyAt=g()
local jh,fR=j.seq,T()b1(fQ,ag)if not ag.Enabled then e("buy aborted: pad emptied")return false end
local aI=dn()if not dx and aI.state~="match"then e("buy aborted: "..(aI.text or"pad changed"))
a.matchSince=nil return false end local dy=aI.info and aI.info.name or(aI.state=="match"and j.name)or nil
local function ji()return ag.Enabled and t()==nil and(dx or dn().state=="match")end local jj,jk=b5(ag,function()
return t()~=nil or((not ag.Enabled)and(dx or j.seq==jh))end,ji,fy()~=nil)if jj then aG(function()return t()~=nil end,0.8)
local a9=t()local fS=T()a.holding,a.bought,a.cashFails=true,a.bought+1,0 a.matchSince=nil
j.name,j.rar,j.at=nil,nil,g()e(("BOUGHT %s%s via %s"):format(a9 and z(r(a9))or(aI.shown or"?"),(fR and fS)and(" for $"..Q(fR-fS))or"",jk))
if a9 and dy and r(a9)~=r(dy)then e(("note: picked up %s, not %s"):format(a9,dy))end return true
end a.cashFails=a.cashFails+1 a.noCashUntil=g()+math.min(8*2^(a.cashFails-1),60)local fT=aE()
e(("BUY REFUSED: cash short? have $%s, price %s"):format(Q(T()),(fT and fT.price)or"?"))
return false end local function fU()local b6=t()if not b6 then a.holding=false e("place: hands are empty")
return false end if not P(b6)then e(("REFUSED TO WAX %s - it is not ticked"):format(z(r(b6))))
return false end for lX=1,d.PlaceTries do local ah=hR()if not ah then e("place: no free station")break end
local fV=aU(ah)if fV then b1(fV,ah)local fW=t()if not fW then a.holding=false e("place: hands emptied on the way")return false end
if not P(fW)then e("place: what I carry changed, not waxing it")return false end if ah.Enabled then
local jl,jm=b5(ah,function()return not ah.Enabled end,function()return ah.Enabled end)if jl then
a.holding,a.placed,a.placeFails=false,a.placed+1,0 j.name,j.rar,j.at=nil,nil,g()e(("WAXED %s #%d at %s via %s"):format(z(r(b6)),a.placed,ah.Parent.Parent.Name,jm))
return true end end end aq(0.25)end a.placeFails=a.placeFails+1 if t()==nil then a.holding=false end
e("PLACE FAILED ("..a.placeFails..")")if a.placeFails>=2 then a.capHit,a.running=true,false
a.capMsg="STOPPED: place failed twice with free stations (plate full at 100? not holding?)"
e(a.capMsg)end return false end local function fX(fY)return type(fY)=="string"and fY:lower():find("crate",1,true)~=nil
end local function jn(b7)if type(b7)~="table"then return false end local dz=b7 .contents
if type(dz)=="table"and#dz>0 then for lY,dA in ipairs(dz)do if type(dA)=="table"and P(dA.butter)then return true,z(r(dA.butter))end
end return false end local fZ=b7 .rarity and o.members[b7 .rarity]if fZ then for lZ,f0 in ipairs(fZ)do if d.Targets[f0]then return true,z(f0)end end
end return false end local jo={SABFarmGui=1,SABToggle=1,SABError=1}local function jp(jq)
local ai=jq while ai do if jo[ai.Name]then return false end if ai:IsA("ScreenGui")then local jr,js=pcall(function()return ai.Enabled end)
return(not jr)or js~=false end if ai:IsA("GuiObject")and not ai.Visible then return false end
ai=ai.Parent end return false end local function f1()local dB,dC local f2=u:FindFirstChildOfClass("PlayerGui")
if not f2 then return nil,nil end for l0,a_ in ipairs(f2:GetDescendants())do if a_:IsA("TextButton")and jp(a_)then
local f3=a_.Text:lower():gsub("[^%a]","")if f3:sub(1,4)=="open"then dB=dB or a_ end if f3:sub(1,7)=="discard"then dC=dC or a_ end
end end return dB,dC end local f4,b8=pcall(function()return game:GetService("VirtualInputManager")end)
local function jt(aj,ju)local dD={}local function f5(jv)dD[#dD+1]=jv end if a.tapWay then f5(a.tapWay)end
for l1,f6 in ipairs({"conn","signal","touch"})do if f6~=a.tapWay then f5(f6)end end for l2,ba in ipairs(dD)do
local b9=false if ba=="conn"and type(getconnections)=="function"then for l3,jw in ipairs({aj.MouseButton1Click,aj.Activated,aj.MouseButton1Down})do
local jx,f7=pcall(getconnections,jw)if jx and type(f7)=="table"then for l4,jy in ipairs(f7)do
if pcall(function()jy:Fire()end)then b9=true end end end end elseif ba=="signal"and type(firesignal)=="function"then
b9=pcall(firesignal,aj.MouseButton1Click)or pcall(firesignal,aj.Activated)elseif ba=="touch"and f4 and b8 then
b9=pcall(function()local f8,f9=aj.AbsolutePosition,aj.AbsoluteSize local f_=0 local ga=aj:FindFirstAncestorWhichIsA("ScreenGui")
local jz,jA=pcall(function()return ga and ga.IgnoreGuiInset end)if not(jz and jA)then pcall(function()f_=game:GetService("GuiService"):GetGuiInset().Y end)
end local gb,gc=f8 .X+f9 .X/2,f8 .Y+f9 .Y/2+f_ b8:SendMouseButtonEvent(gb,gc,0,true,game,1)
task.wait(0.06)b8:SendMouseButtonEvent(gb,gc,0,false,game,1)end)end if b9 and aG(ju,1.5)then
a.tapWay=ba return true,ba end end return false end local function gd()if h.on then return true end
local bb,ge=bC(),aE()if bb and bb.Enabled and ge and fX(ge.name)then local gf=aU(bb)if gf then b1(gf,bb)end
b5(bb,function()return h.on end)end if aG(function()return h.on end,2.5)then return true end
h.lastFail=g()e("crate: the window did not come up")return false end local function dE(b_)
if not gd()then return false end local dF=h.title local jB,jC=f1()local gg=b_ and jB or jC
if not gg then h.lastFail=g()a.crateFails=a.crateFails+1 e(("crate: no %s button found in %s"):format(b_ and"Open"or"Discard",dF))
return false end local jD=t()local jE,l5=jt(gg,function()return(not h.on)or(t()~=nil and t()~=jD)
end)if not jE then h.lastFail=g()a.crateFails=a.crateFails+1 e("crate: could not press "..(b_ and"Open"or"Discard").." (no working tap method)")
return false end a.crateFails=0 if b_ then a.crates=a.crates+1 aG(function()return t()~=nil end,1.5)
local gh=t()e(("OPENED %s -> %s"):format(dF,gh and z(r(gh))or"?"))else e("discarded "..dF.." (nothing ticked in it)")
end return true end local jF={"sell","trash","discard","dispose","bin"}local function dG(ca)
if type(ca)~="string"then return false end ca=ca:lower()for l6,jG in ipairs(jF)do if ca:find(jG,1,true)then return true end end
return false end local function jH()local gi=bx:FindFirstChild("Remotes")local dH=gi and gi:FindFirstChild("SellSquishy")
if not(dH and dH:IsA("RemoteEvent"))then return false end if not pcall(function()dH:FireServer()end)then return false end
return aG(function()return t()==nil end,1.5)end local function jI()if a.sellSpot and a.sellSpot.Parent then return a.sellSpot end
if g()-a.sellSearchAt<20 then return nil end a.sellSearchAt=g()local gj=az()local gk=gj and gj.HumanoidRootPart.Position
local bc,gl for l7,aJ in ipairs((a.plot or cx):GetDescendants())do if aJ:IsA("ProximityPrompt")and(dG(aJ.ActionText)or dG(aJ.ObjectText)or dG(aJ.Name))then
local gm=eH(aJ)local dI=(gm and gk)and(gm-gk).Magnitude or 1e9 if dI<=400 and(not bc or dI<gl)then bc,gl=aJ,dI end
end end a.sellSpot=bc a.noSellSpot=(bc==nil)return bc end local function gn()local dJ=t()
if not dJ then a.holding=false return false end if P(dJ)then return false end local dK=z(r(dJ))
if jH()then a.sold,a.holding,a.sellFails=a.sold+1,false,0 e("SOLD "..dK)return true end
local aK=jI()if aK then local go=aU(aK)if go then b1(go,aK)local gp=t()if gp and not P(gp)then
local jJ,jK=b5(aK,function()return t()==nil end,function()return aK.Enabled end)if jJ then
a.sold,a.holding,a.sellFails=a.sold+1,false,0 e(("SOLD %s at %s via %s"):format(dK,aT(aK),jK))
return true end end end end a.sellFails=a.sellFails+1 e("could not sell "..dK.." ("..a.sellFails..")")
return false end local jL={"bounce","lift","lever","wheel","holder","waxstation","squishystack","shadow","crate","skin"}
local function jM(aL)local cb=aT(aL):lower()for l8,jN in ipairs(jL)do if cb:find(jN,1,true)then return 0 end end
local N,w=aL.Name:lower(),0 local function I(jO,jP)return jO:find(jP,1,true)~=nil end if I(N,"collect")then w=w+60 end
if I(N,"cash")or I(N,"money")then w=w+45 end if I(N,"income")or I(N,"claim")then w=w+35 end
if I(N,"coin")or I(N,"earn")or I(N,"green")then w=w+20 end if N=="pad"or N=="touch"then w=w+25 end
if w==0 and(I(cb,"collect")or I(cb,"cash")or I(cb,"money"))then w=25 end if w==0 then return 0 end
local bd=aL.Color if bd.G>0.5 and bd.G>bd.R*1.4 and bd.G>bd.B*1.4 then w=w+15 end if math.min(aL.Size.X,aL.Size.Y,aL.Size.Z)<2 then w=w+5 end
return w end local function jQ()if a.padPart and a.padPart.Parent then return a.padPart end
if not a.plot or g()-a.padSearchAt<20 then return nil end a.padSearchAt=g()local cc,be,dL={},nil,29
for l9,cd in ipairs(a.plot:GetDescendants())do if cd:IsA("BasePart")then local ce=jM(cd)
if ce>0 then cc[#cc+1]={s=ce,p=cd}if ce>dL then be,dL=cd,ce end end end end table.sort(cc,function(jR,jS)return jR.s>jS.s end)
a.padCands,a.padPart=cc,be if be then e("collect pad: "..aT(be).." (score "..dL..")")end
return be end local dM="SAB_pad_v1.txt"local function jT(jU)if type(writefile)=="function"then pcall(writefile,dM,table.concat({jU:GetComponents()},","))end
end local function jV()if type(isfile)~="function"or type(readfile)~="function"then return nil end
local jW,gq=pcall(function()if isfile(dM)then return readfile(dM)end end)if not jW or type(gq)~="string"then return nil end
local cf={}for jX in gq:gmatch("[^,]+")do cf[#cf+1]=tonumber(jX)end if#cf==12 then return CFrame.new(unpack(cf))end
end local function jY(dN,cg,jZ)local j0=dq(dN)local dO=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
local J=(dO and dO:IsA("BasePart"))and(dO.Position-cg)or Vector3 .new(1,0,0)J=Vector3 .new(J.X,0,J.Z)
if J.Magnitude<0.05 then J=Vector3 .new(1,0,0)end J=J.Unit for j1=0,7 do local ci=j1*math.pi/4
local j2=Vector3 .new(J.X*math.cos(ci)-J.Z*math.sin(ci),0,J.X*math.sin(ci)+J.Z*math.cos(ci))
local cj=cg+j2*(jZ+5)local dP=fE(cj.X,cg.Y,cj.Z)if dP and math.abs(dP.Y-cg.Y)<8 then b0(dN,Vector3 .new(cj.X,dP.Y+j0,cj.Z))
if dr(dN,0.7)then return true end end end return false end local function j3()a.lastCollect=g()
local bf=az()if not bf then return end local gr,j4=bf.HumanoidRootPart,dq(bf)local bh,gs,bi,dQ=nil,4,nil,"?"
local dR=a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")if a.manualPad and dR and dR:IsA("BasePart")then
bh,dQ=(dR.CFrame*a.manualPad).Position,"manual pad"else local W=jQ()if W then bh=Vector3 .new(W.Position.X,W.Position.Y+W.Size.Y/2+j4,W.Position.Z)
gs,bi,dQ=math.max(W.Size.X,W.Size.Z)/2,W,W.Name end end if not bh then e("COLLECT: pad not found - stand on it and tap SET PAD")return end
local dS=T()b0(bf,bh)if bi and type(firetouchinterest)=="function"then pcall(firetouchinterest,gr,bi,0)end
aq(d.PadDwell)if bi and type(firetouchinterest)=="function"then pcall(firetouchinterest,gr,bi,1)end
aq(0.5)a.collected=a.collected+1 local dT=T()e(("COLLECTED (%s) %s"):format(dQ,(dS and dT and dT>dS)and("+$"..Q(dT-dS))or"no cash change seen"))
jY(bf,bh,gs)end local function gt()if a.capHit then return nil,a.capMsg,"bad"end if a.busy then return nil,a.busyText,"ok"end
if not az()then return nil,"waiting for character","wait"end if not a.plot or not a.plot.Parent then
a.plot,a.padPart,a.sellSpot=aA(),nil,nil if not a.plot then return nil,"own plot not found yet","wait"end
end if not next(d.Targets)then return nil,"nothing ticked - pick a butter in the BUTTERS tab","bad"
end if h.on and d.Crates then if a.crateFails>=3 then h.on=false e("ignoring the "..h.title.." window - its buttons do not respond")
return nil,("%s window open - press Open or Discard yourself"):format(h.title),"bad"end
if g()-h.lastFail<8 then return nil,("%s window open - could not press its buttons"):format(h.title),"bad"
end local j5,j6=jn(h.data)if j5 then return"crate",("opening %s for %s"):format(h.title,j6),"ok"end
if d.SellJunk then return"nocrate",("discarding %s - nothing ticked inside"):format(h.title),"warn"end
return nil,("%s open - nothing ticked inside it"):format(h.title),"idle"end local dU,gu=cN()
local ck=t()if ck then local bj=z(r(ck))if not P(ck)then local dV=(j.gift and r(j.gift)==r(ck)and g()-j.giftAt<600)and"gift"or"not ticked"
if not d.SellJunk then return nil,("holding %s (%s) - selling is off"):format(bj,dV),"bad"end
if a.sellFails>=3 then return nil,("holding %s (%s) - selling is not working, tap SELL"):format(bj,dV),"bad"
end return"sell",("selling %s (%s)"):format(bj,dV),"warn"end if dU<1 then return nil,("holding %s - 0 free stations"):format(bj),"wait"end
return"place",("waxing %s (%d free)"):format(bj,dU),"ok"end a.holding=false if dU<1 then
a.matchSince=nil return nil,("0 free stations (%d/%d busy) - waiting for wax"):format(gu,gu),"wait"
end local dW=bC()if not dW then return nil,"BuyPrompt of RolledSquishyPlaceHolder missing","bad"end
local bk=aE()if bk and fX(bk.name)then a.matchSince=nil if not d.Crates then return nil,("%s on the pad - crate opening is off"):format(bk.name),"idle"end
if g()-h.lastFail<8 then return nil,("%s on the pad - could not open it"):format(bk.name),"bad"end
return"cratewin",("%s on the pad - opening its window"):format(bk.name),"ok"end local ak=dn()
if ak.state~="match"then a.matchSince=nil if ak.state=="skip"and not dW.Enabled then return nil,ak.text.." (sold out)","idle"end
return nil,ak.text,ak.level end if not dW.Enabled then a.matchSince=nil return nil,"target on pad but Buy is off","wait"end
local bl=g()if bl<a.noCashUntil then local gv,j7=fy()if gv then return nil,("cash short: have $%s, price ~$%s"):format(Q(gv),Q(j7)),"bad"end
return nil,("cash short? have $%s - retry in %ds"):format(Q(T()),math.ceil(a.noCashUntil-bl)),"bad"
end if bl-a.lastBuyAt<d.BuyGap then return nil,"cooldown after last buy","wait"end a.matchSince=a.matchSince or bl
local gw=bl-a.matchSince if gw<d.Confirm then return nil,("confirming %s (%.2fs)"):format(ak.shown,gw),"ok"end
return"buy",("buying %s via %s"):format(ak.shown,ak.src),"ok"end local function K(j8,j9,...)
if a.busy then return end a.busy,a.busyText=true,j8 local j_,gx=pcall(j9,...)a.busy,a.busyText=false,""
if not j_ and gx~=cz then e("ERR "..tostring(gx))end end local function ka()local aM,kb,kc=gt()
a.reason,a.level=kb,kc if aM=="place"then K("waxing...",fU)elseif aM=="crate"then K("opening crate...",dE,true)
elseif aM=="cratewin"then K("checking crate...",gd)elseif aM=="nocrate"then K("discarding crate...",dE,false)
elseif aM=="sell"then K("selling...",gn)elseif aM=="buy"then K("buying...",fP,false)elseif d.Collect and not a.matchSince and g()-a.lastCollect>=d.Every then
K("collecting money...",j3)end end local function kd(dX)if dX==a.running then return end
a.running=dX if dX then a.capHit,a.placeFails,a.cashFails,a.sellFails,a.crateFails=false,0,0,0,0
h.lastFail=0 a.noCashUntil,a.matchSince=0,nil a.lastCollect=g()a.plot=aA()or a.plot e("START")
else a.reason="stopped"e("STOP")end end local function gy()local dY={}local function k(ke)dY[#dY+1]=tostring(ke)end
k("=== SAB "..ao.." DUMP "..os.date("%H:%M:%S").." ===")k(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(a.running),
tostring(a.busy),tostring(a.holding),tostring(a.capHit),a.uiErrs,tostring(a.zapFirst)))
k("reason: "..tostring(a.reason))k("targets: "..table.concat(e9(),", "))k(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(a.bought,a.placed,a.sold,a.collected,a.rolls,a.gifts))
k("cash="..Q(T()))local kf,gz=t()k("in hands: "..tostring(kf)..(gz and(" ("..gz.ClassName..")")or""))
local cl=aE()k("on pad: "..(cl and("%s [%s] %s"):format(cl.name,tostring(cl.rar),tostring(cl.price))or"nothing"))
k("sell spot: "..(a.sellSpot and aT(a.sellSpot)or"none found"))local gA,gB=f1()k(("crate window: on=%s title=%s open=%s discard=%s tapWay=%s opened=%d fails=%d"):format(
tostring(h.on),h.title,tostring(gA and gA.Text),tostring(gB and gB.Text),tostring(a.tapWay),a.crates,a.crateFails))
k("tap tools: getconnections="..type(getconnections).." firesignal="..type(firesignal).." VIM="..tostring(f4 and b8~=nil))
k("--- CATALOG ("..o.n.." butters, worst rarity first) ---")for l_,cm in ipairs(o.rarOrder)do
local dZ={}for ma,gC in ipairs(o.members[cm]or{})do dZ[#dZ+1]=(d.Targets[gC]and"*"or"")..z(gC)
end k(("  [%s]%s %s"):format(cm,v.price[cm]and(" crate $"..Q(v.price[cm]))or"",table.concat(dZ,", ")))
end k("learned orders: ")for kg,kh in pairs(v.order)do k("  "..kg..": "..table.concat(kh,", "))end
k("--- PLOT ---")k("plot="..(a.plot and a.plot:GetFullName()or"none"))if a.plot then for mb,d0 in ipairs(a.plot:GetChildren())do
k(("  %s %s (%d)"):format(d0 .ClassName,d0 .Name,#d0:GetChildren()))end local ki,kj=cN()
k(("stations free %d / %d"):format(ki,kj))local d1=bC()k("BuyPrompt: "..(d1 and("enabled="..tostring(d1 .Enabled).." hold="..d1 .HoldDuration)or"MISSING"))
end k(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(a.config),tostring(a.autoload),
tostring(a.selfPath),tostring(a.hidden)))k("file tools: writefile="..type(writefile).." listfiles="..type(listfiles)..
" queueonteleport="..type(queueonteleport).." configs="..#fe())k("--- COLLECT PAD ---")
k("manual="..tostring(a.manualPad~=nil).." auto="..(a.padPart and aT(a.padPart)or"none"))
k("--- ATTRIBUTES ---")for mc,gD in ipairs({"SquishyEquipped","AutoRollOn","AutoRollRules","AutoRollStop","BestRarity","PlotNumber","WaxStations","IndexRows"})do
k(("  %s = %s"):format(gD,tostring(u:GetAttribute(gD))))end k("--- EVENTS ---")for kk=math.max(1,#ap-15),#ap do k("  "..ap[kk])end
k("--- LOG ---")for kl=math.max(1,#ab-25),#ab do k("  "..ab[kl])end return table.concat(dY,"\n")
end do local al=da(A.auto)if type(al)=="string"then al=al:gsub("%s+$","")if al~=""then a.autoload=al
local km=fj(al)e(km and("loaded config "..al)or("config "..al.." could not be loaded"))
end end end local c={bg=Color3 .fromRGB(16,17,22),panel=Color3 .fromRGB(26,28,36),panel2=Color3 .fromRGB(38,41,52),
line=Color3 .fromRGB(52,56,70),text=Color3 .fromRGB(236,238,244),dim=Color3 .fromRGB(140,146,162),
accent=Color3 .fromRGB(88,101,242),good=Color3 .fromRGB(46,190,115),warn=Color3 .fromRGB(240,170,60),
bad=Color3 .fromRGB(235,80,80),}local kn={ok=c.good,wait=c.warn,warn=c.warn,bad=c.bad,idle=c.dim}
local ko={Common=Color3 .fromRGB(170,175,185),Rare=Color3 .fromRGB(80,150,245),Epic=Color3 .fromRGB(175,95,240),
Legendary=Color3 .fromRGB(240,190,60),Mythic=Color3 .fromRGB(240,70,140),Celestial=Color3 .fromRGB(120,150,255),
Divine=Color3 .fromRGB(240,130,60),Dream=Color3 .fromRGB(225,200,120),["Sugar Rush"]=Color3 .fromRGB(240,110,210),
Picnic=Color3 .fromRGB(240,100,90),Limited=Color3 .fromRGB(235,80,80),}local function i(kp,kq,kr)
local ks,d2=pcall(Instance.new,kp)if not ks then a.uiErrs=a.uiErrs+1 return nil end for kt,ku in pairs(kq)do
if not pcall(function()d2[kt]=ku end)then a.uiErrs=a.uiErrs+1 end end d2 .Parent=kr return d2
end local function D(kv,kw)i("UICorner",{CornerRadius=UDim.new(0,kw or 6)},kv)end local b={}
local d3=u:FindFirstChildOfClass("PlayerGui")or u:WaitForChild("PlayerGui")local gE=d3:FindFirstChild("SABFarmGui")
if gE then gE:Destroy()end local d4=i("ScreenGui",{Name="SABFarmGui",ResetOnSpawn=false,DisplayOrder=999,IgnoreGuiInset=true},d3)
local gF,gG,aN,bm,d5=320,330,30,38,26 b.root=i("Frame",{Name="Root",Size=UDim2 .new(0,gF,0,gG),
Position=UDim2 .new(0,a.winPos and a.winPos[1]or 10,0,a.winPos and a.winPos[2]or 44),BackgroundColor3=c.bg,BorderSizePixel=0,Active=true,ClipsDescendants=true},d4)
D(b.root,10)i("UIStroke",{Color=c.line,Thickness=1},b.root)local aO=UDim2 .new(1,0,1,0)
local function m(gH,gI)return UDim2 .new(gH,0,0,0),UDim2 .new(gI,(gH+gI>0.99)and 0 or-4,1,0)end
local function l(kx,ky,kz,kA,kB,kC)local gJ=i("TextButton",{Text=ky,Position=kB,Size=kC,BackgroundColor3=kz,BorderSizePixel=0,
Font=Enum.Font.GothamBold,TextSize=kA,TextColor3=c.text,AutoButtonColor=true},kx)D(gJ,6)
return gJ end local function gK(kD,kE,kF,kG,kH)local d6=i("TextBox",{Text=kE,PlaceholderText=kF,Position=kG,Size=kH,BackgroundColor3=c.panel2,
BorderSizePixel=0,Font=Enum.Font.Gotham,TextSize=13,TextColor3=c.text,PlaceholderColor3=c.dim,
ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},kD)D(d6,6)i("UIPadding",{PaddingLeft=UDim.new(0,8)},d6)
return d6 end local cn={}local function gL(co,gM,gN)M(co.InputBegan:Connect(function(bn)
if bn.UserInputType~=Enum.UserInputType.MouseButton1 and bn.UserInputType~=Enum.UserInputType.Touch then return end
cn[co]={start=bn.Position,from=gM.Position,moved=0,target=gM}local d7 d7=bn.Changed:Connect(function()
if bn.UserInputState==Enum.UserInputState.End then local gO=cn[co]cn[co]=nil if d7 then d7:Disconnect()end
if gO and gN then gN(gO.moved)end end end)end))end M(hA.InputChanged:Connect(function(cp)
if cp.UserInputType~=Enum.UserInputType.MouseMovement and cp.UserInputType~=Enum.UserInputType.Touch then return end
for md,aa in pairs(cn)do local d8=aa.target if d8 and d8 .Parent then local gP,gQ=cp.Position.X-aa.start.X,cp.Position.Y-aa.start.Y
aa.moved=math.max(aa.moved,math.abs(gP)+math.abs(gQ))d8 .Position=UDim2 .new(aa.from.X.Scale,aa.from.X.Offset+gP,aa.from.Y.Scale,aa.from.Y.Offset+gQ)
end end end))local function x(kI,kJ,kK,kL,kM,kN,kO)return i("TextLabel",{Text=kJ,Position=kN or UDim2 .new(0,0,0,0),Size=kO or aO,BackgroundTransparency=1,
Font=kM and Enum.Font.GothamBold or Enum.Font.Gotham,TextSize=kK,TextColor3=kL,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true},kI)
end b.title=i("Frame",{Size=UDim2 .new(1,0,0,aN),BackgroundColor3=c.panel,BorderSizePixel=0,Active=true},b.root)
b.dot=i("Frame",{Size=UDim2 .new(0,9,0,9),Position=UDim2 .new(0,11,0.5,-4),BackgroundColor3=c.dim,BorderSizePixel=0},b.title)
D(b.dot,5)x(b.title,"SAB  BUTTER FARM  "..ao,12,c.text,true,UDim2 .new(0,28,0,0),UDim2 .new(1,-120,1,0))
b.minB=l(b.title,"-",c.panel2,14,UDim2 .new(1,-78,0.5,-10),UDim2 .new(0,34,0,20))b.xB=l(b.title,"X",c.bad,12,UDim2 .new(1,-40,0.5,-10),UDim2 .new(0,34,0,20))
b.strip=i("Frame",{Position=UDim2 .new(0,0,0,aN),Size=UDim2 .new(1,0,0,bm),BackgroundColor3=c.bg,BorderSizePixel=0},b.root)
b.bar=i("Frame",{Size=UDim2 .new(0,4,1,-10),Position=UDim2 .new(0,9,0,5),BackgroundColor3=c.warn,BorderSizePixel=0},b.strip)
D(b.bar,2)b.reason=x(b.strip,"starting",12,c.text,false,UDim2 .new(0,20,0,2),UDim2 .new(1,-28,1,-4))
b.tabs=i("Frame",{Position=UDim2 .new(0,0,0,aN+bm),Size=UDim2 .new(1,0,0,d5),BackgroundTransparency=1},b.root)
b.tabFarm=l(b.tabs,"FARM",c.accent,11,UDim2 .new(0,8,0,0),UDim2 .new(0.34,-10,1,-4))b.tabBut=l(b.tabs,"BUTTERS",c.panel2,11,UDim2 .new(0.34,2,0,0),UDim2 .new(0.33,-6,1,-4))
b.tabSet=l(b.tabs,"SETUP",c.panel2,11,UDim2 .new(0.67,2,0,0),UDim2 .new(0.33,-10,1,-4))
local function d9()local d_=i("ScrollingFrame",{Position=UDim2 .new(0,0,0,aN+bm+d5),Size=UDim2 .new(1,0,1,-(aN+bm+d5)),
BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=c.line,
CanvasSize=UDim2 .new(0,0,0,100)},b.root)i("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder},d_)
i("UIPadding",{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,10),PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,8)},d_)
return d_ end b.farm,b.but,b.set=d9(),d9(),d9()b.but.Visible,b.set.Visible=false,false local cq,bo,f=0,12,nil
local function E(gR,kP)cq,bo=cq+1,bo+gR+6 return i("Frame",{Size=UDim2 .new(1,0,0,gR),BackgroundTransparency=1,LayoutOrder=cq},kP or b.farm)
end local function bp(kQ)x(E(14),kQ,10,c.dim,true)end f=E(34)b.startB=l(f,"START",c.good,14,m(0,0.68))
b.killB=l(f,"KILL",c.bad,14,m(0.68,0.32))local kR=E(42)local function bq(gS,kS,ea)local eb=i("Frame",{Position=UDim2 .new((gS-1)/ea,0,0,0),Size=UDim2 .new(1/ea,gS<ea and-4 or 0,1,0),
BackgroundColor3=c.panel,BorderSizePixel=0},kR)D(eb,6)local gT=x(eb,"0",15,c.text,true,UDim2 .new(0,0,0,3),UDim2 .new(1,0,0,21))
local kT=x(eb,kS,9,c.dim,false,UDim2 .new(0,0,0,24),UDim2 .new(1,0,0,14))gT.TextXAlignment,kT.TextXAlignment=Enum.TextXAlignment.Center,Enum.TextXAlignment.Center
return gT end b.sBought,b.sPlaced,b.sSold,b.sColl,b.sFree=bq(1,"BOUGHT",5),bq(2,"WAXED",5),bq(3,"SOLD",5),bq(4,"MONEY",5),bq(5,"FREE",5)
b.info=x(E(40),"",10,c.dim,false)b.tgt=x(E(26),"",10,c.good,false)bp("MONEY COLLECT")f=E(28)
b.secB=gK(f,tostring(d.Every),"60",m(0,0.2))x(f,"sec",11,c.dim,false,m(0.21,0.09))b.secSet=l(f,"SET",c.accent,12,m(0.3,0.2))
b.colT=l(f,"COLLECT: ON",c.accent,11,m(0.5,0.5))f=E(26)b.padB=l(f,"SET PAD (stand on it)",c.panel2,10,m(0,0.55))
b.padL=x(f,"",10,c.dim,false,m(0.56,0.44))bp("BUTTERS YOU DID NOT TICK, AND CRATES")f=E(28)
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
b.farm.CanvasSize=UDim2 .new(0,0,0,bo)cq,bo=0,12 local function O(kU)return E(kU,b.set)end
local function cr(kV)x(O(14),kV,10,c.dim,true)end cr("SETTINGS FILE  (saved on your phone)")
f=O(28)b.cfgName=gK(f,"default","config name",m(0,0.5))b.cfgSave=l(f,"SAVE",c.good,11,m(0.5,0.25))
b.cfgLoad=l(f,"LOAD",c.accent,11,m(0.75,0.25))f=O(26)b.cfgPrev=l(f,"<",c.panel2,11,m(0,0.13))
b.cfgPick=l(f,"(none saved)",c.panel2,10,m(0.13,0.74))b.cfgNext=l(f,">",c.panel2,11,m(0.87,0.13))
f=O(26)b.cfgAuto=l(f,"LOAD IT ON LAUNCH: OFF",c.panel2,10,m(0,1))b.cfgMsg=x(O(26),"",10,c.dim,false)
cr("START BY ITSELF")f=O(26)b.autoB=l(f,"INSTALL F.exec",c.accent,10,m(0,1))b.autoMsg=x(O(30),"",10,c.dim,false)
cr("IF THE GAME DROPS ME")f=O(28)b.rejT=l(f,"AUTO REJOIN: ON",c.accent,11,m(0,0.55))b.rejB=l(f,"REJOIN NOW",c.warn,11,m(0.55,0.45))
b.rejMsg=x(O(30),"",10,c.dim,false)cr("THE ROUND SAB BUTTON")x(O(30),"Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.",10,c.dim,false)
b.set.CanvasSize=UDim2 .new(0,0,0,bo)local gU=i("ScreenGui",{Name="SABToggle",ResetOnSpawn=false,DisplayOrder=1000,IgnoreGuiInset=true},d3)
b.tgRoot=i("Frame",{Size=UDim2 .new(0,46,0,46),Position=UDim2 .new(0,a.togPos and a.togPos[1]or 10,0,a.togPos and a.togPos[2]or 380),
BackgroundColor3=c.accent,BorderSizePixel=0,Active=true},gU)D(b.tgRoot,23)i("UIStroke",{Color=c.line,Thickness=1},b.tgRoot)
b.tgBtn=i("TextButton",{Text="SAB",Size=aO,BackgroundTransparency=1,Font=Enum.Font.GothamBold,
TextSize=13,TextColor3=c.text,AutoButtonColor=false},b.tgRoot)b.tgDot=i("Frame",{Size=UDim2 .new(0,8,0,8),Position=UDim2 .new(1,-11,0,3),BackgroundColor3=c.dim,
BorderSizePixel=0},b.tgRoot)D(b.tgDot,4)local gV,cs,ec=false,{},0 local function gW(gX,ed)
d.Targets[gX]=ed or nil local ee=cs[gX]if ee then ee.Text=ed and"X"or""ee.BackgroundColor3=ed and c.good or c.panel2
end end local function ef()for kW,gY in pairs(cs)do local gZ=d.Targets[kW]==true gY.Text=gZ and"X"or""
gY.BackgroundColor3=gZ and c.good or c.panel2 end end local br local function kX()local kY=0
local eg=i("Frame",{Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,LayoutOrder=1},b.but)
b.butInfo=x(eg,"",10,c.dim,false,m(0,0.5))local kZ=l(eg,"CLEAR",c.panel2,10,m(0.5,0.24))
local k0=l(eg,"REFRESH",c.panel2,10,m(0.74,0.26))kZ.MouseButton1Click:Connect(function()
for k1 in pairs(d.Targets)do d.Targets[k1]=nil end ef()end)k0 .MouseButton1Click:Connect(function()
o.at=0 c_()br(true)end)return kY end br=function(k2)if not c_()then if not b.butEmpty then
b.butEmpty=x(i("Frame",{Size=UDim2 .new(1,0,0,40),BackgroundTransparency=1,LayoutOrder=2},b.but),
"butter list not loaded yet - open this tab again in a moment",11,c.warn,false)end return
end if gV and not k2 and ec==o.at then return end for me,eh in ipairs(b.but:GetChildren())do
if eh:IsA("Frame")or eh:IsA("TextButton")then eh:Destroy()end end cs,b.butEmpty={},nil kX()
local ei,ej=36,1 local function g0(g1)ej=ej+1 local k3=i("Frame",{Size=UDim2 .new(1,0,0,g1),BackgroundTransparency=1,LayoutOrder=ej},b.but)
ei=ei+g1+6 return k3 end for mf,ct in ipairs(o.rarOrder)do local k4=g0(24)local k5=ko[ct]or c.text
local ek=i("Frame",{Size=aO,BackgroundColor3=c.panel,BorderSizePixel=0},k4)D(ek,6)x(ek,"  "..ct:upper(),11,k5,true,UDim2 .new(0,4,0,0),UDim2 .new(1,-70,1,0))
local k6=l(ek,"ALL",c.panel2,9,UDim2 .new(1,-62,0.5,-9),UDim2 .new(0,56,0,18))local k7=ct
k6 .MouseButton1Click:Connect(function()local g2=o.members[k7]or{}local g3=false for mg,k8 in ipairs(g2)do if not d.Targets[k8]then g3=true break end end
for mh,k9 in ipairs(g2)do gW(k9,g3)end end)for mi,el in ipairs(o.members[ct]or{})do local k_=g0(22)
local cu=i("TextButton",{Text="",Size=aO,BackgroundColor3=c.bg,BorderSizePixel=0,AutoButtonColor=true},k_)
D(cu,5)x(cu,"   "..z(el),11,c.text,false,UDim2 .new(0,4,0,0),UDim2 .new(1,-40,1,0))local em=i("TextButton",{Text="",Size=UDim2 .new(0,22,0,16),Position=UDim2 .new(1,-28,0.5,-8),
BackgroundColor3=c.panel2,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextSize=10,TextColor3=c.text,AutoButtonColor=false},cu)
D(em,4)cs[el]=em local g4=el local function g5()gW(g4,not d.Targets[g4])end cu.MouseButton1Click:Connect(g5)
em.MouseButton1Click:Connect(g5)end end ef()b.but.CanvasSize=UDim2 .new(0,0,0,ei+10)gV,ec=true,o.at
end local g6="farm"local function bs(am)g6=am b.farm.Visible,b.but.Visible,b.set.Visible=(am=="farm"),(am=="but"),(am=="set")
b.tabFarm.BackgroundColor3=(am=="farm")and c.accent or c.panel2 b.tabBut.BackgroundColor3=(am=="but")and c.accent or c.panel2
b.tabSet.BackgroundColor3=(am=="set")and c.accent or c.panel2 if am=="but"then br(false)end
end local function F(g7,g8,la,lb)g7 .Text=g8 and la or lb g7 .BackgroundColor3=g8 and c.accent or c.panel2
end local function lc()b.secB.Text=tostring(d.Every)F(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
F(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")F(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
F(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")if a.winPos then b.root.Position=UDim2 .new(0,a.winPos[1],0,a.winPos[2])end
if a.togPos then b.tgRoot.Position=UDim2 .new(0,a.togPos[1],0,a.togPos[2])end a.lastCollect=g()
ef()end local function ld(g9)task.spawn(function()g9 .TextColor3=c.bad task.wait(0.8)if a.alive then g9 .TextColor3=c.text end
end)end local function g_()local ha=b.secB.Text:match("^%s*(%d+)%s*$")local bt=ha and tonumber(ha)
if not bt or bt<1 then b.secB.Text=tostring(d.Every)ld(b.secB)e("interval must be a whole number >= 1")
return end if bt==d.Every then return end d.Every,a.lastCollect=bt,g()e("collect every "..bt.."s")
end local function hb(le)local hc=setclipboard or toclipboard return type(hc)=="function"and pcall(hc,le)
end local function lf()local en=ac~=""and ac or(a.reason.."\n"..table.concat(ab,"\n"))if hb(en)then e("copied "..#en.." chars")return end
b.out.Text=en pcall(function()b.out:CaptureFocus()end)e("no clipboard here - select the text in OUTPUT")
end local function lg()local lh,hd=pcall(gy)ac=lh and hd or("DUMP ERROR "..tostring(hd))
local he=hb(ac)b.out.Text=(he and#ac>7000)and(ac:sub(1,7000).."\n... (full text is on your clipboard)")or ac
e("DUMP "..#ac.." chars"..(he and", copied"or""))end local function q(li,lj)M(li.MouseButton1Click:Connect(lj))end
q(b.secSet,g_)M(b.secB.FocusLost:Connect(g_))q(b.colT,function()d.Collect,a.lastCollect=not d.Collect,g()
F(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")end)q(b.sellT,function()d.SellJunk=not d.SellJunk
F(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")end)q(b.sellB,function()a.sellFails=0
task.spawn(K,"selling...",gn)end)q(b.crateT,function()d.Crates=not d.Crates F(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
end)q(b.crateB,function()h.lastFail=0 task.spawn(K,"opening crate...",dE,true)end)q(b.padB,function()
a.plot=aA()or a.plot local hf,eo=az(),a.plot and a.plot:FindFirstChild("RolledSquishyPlaceHolder")
if not(hf and eo and eo:IsA("BasePart"))then e("SET PAD: need character and plot")return end
a.manualPad=eo.CFrame:ToObjectSpace(hf.HumanoidRootPart.CFrame)jT(a.manualPad)e("collect pad saved at your position")
end)q(b.startB,function()kd(not a.running)end)q(b.buyB,function()a.plot=aA()or a.plot task.spawn(K,"buying (manual)...",fP,true)
end)q(b.plB,function()a.plot=aA()or a.plot task.spawn(K,"waxing (manual)...",fU)end)q(b.dumpB,lg)
q(b.copyB,lf)q(b.tabFarm,function()bs("farm")end)q(b.tabBut,function()bs("but")end)q(b.tabSet,function()bs("set")end)
local function hg(ep)a.hidden=ep b.root.Visible=not ep b.tgBtn.Text=ep and"SAB+"or"SAB"
end gL(b.tgRoot,b.tgRoot,function(lk)a.togPos={b.tgRoot.Position.X.Offset,b.tgRoot.Position.Y.Offset}
if lk<8 then hg(not a.hidden)end end)q(b.tgBtn,function()hg(not a.hidden)end)local C,y={},0
local function an()C=fe()if#C==0 then b.cfgPick.Text="(none saved)"y=0 return end if y<1 or y>#C then y=1 end
b.cfgPick.Text=C[y]..("  (%d/%d)"):format(y,#C)end local function hh()local hi=a.autoload~=nil
b.cfgAuto.Text=hi and("LOAD IT ON LAUNCH: "..a.autoload)or"LOAD IT ON LAUNCH: OFF"b.cfgAuto.BackgroundColor3=hi and c.accent or c.panel2
end q(b.cfgSave,function()a.winPos={b.root.Position.X.Offset,b.root.Position.Y.Offset}a.togPos={b.tgRoot.Position.X.Offset,b.tgRoot.Position.Y.Offset}
local hj,hk=dd(b.cfgName.Text)b.cfgMsg.Text=hj and("saved as "..hk)or("could not save: "..hk)
b.cfgMsg.TextColor3=hj and c.good or c.bad an()e(b.cfgMsg.Text)end)local function ll(hl)
local eq,hm=fj(hl)b.cfgMsg.Text=eq and("loaded "..hm)or("could not load: "..hm)b.cfgMsg.TextColor3=eq and c.good or c.bad
if eq then b.cfgName.Text=hl lc()end e(b.cfgMsg.Text)end q(b.cfgLoad,function()local lm=(y>0 and C[y])or b.cfgName.Text
ll(lm)end)q(b.cfgPick,function()an()if y>0 then b.cfgName.Text=C[y]end end)q(b.cfgPrev,function()
if#C==0 then an()return end y=(y-2)%#C+1 an()b.cfgName.Text=C[y]end)q(b.cfgNext,function()
if#C==0 then an()return end y=y%#C+1 an()b.cfgName.Text=C[y]end)q(b.cfgAuto,function()if a.autoload then
fl(nil)b.cfgMsg.Text="it will not load a config on launch"else local er=(y>0 and C[y])or b.cfgName.Text
local ln=dd(er)if ln then fl(er)an()b.cfgMsg.Text=er.." will load every time the script starts"
else b.cfgMsg.Text="save the config first"end end b.cfgMsg.TextColor3=c.dim hh()end)q(b.autoB,function()
local hn,ho=iI()b.autoMsg.Text=hn and("installed. "..ho)or("failed: "..ho)b.autoMsg.TextColor3=hn and c.good or c.bad
e(b.autoMsg.Text)end)q(b.rejT,function()d.Rejoin=not d.Rejoin F(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")
end)q(b.rejB,function()bV("you asked")end)local aP=false q(b.minB,function()aP=not aP b.tabs.Visible=not aP
if aP then b.farm.Visible,b.but.Visible,b.set.Visible=false,false,false else bs(g6)end b.root.Size=UDim2 .new(0,gF,0,aP and(aN+bm)or gG)
b.minB.Text=aP and"+"or"-"end)local function cv()if not a.alive then return end a.alive,a.running=false,false
pcall(cU)for mj,lo in ipairs(cA)do pcall(function()lo:Disconnect()end)end pcall(function()d4:Destroy()end)
pcall(function()gU:Destroy()end)if ay.SAB_KILL==cv then ay.SAB_KILL=nil end end ay.SAB_KILL=cv
q(b.killB,cv)q(b.xB,cv)gL(b.title,b.root,function()a.winPos={b.root.Position.X.Offset,b.root.Position.Y.Offset}
end)local function hp()local bu,bv=a.reason,a.level if a.busy then bu,bv=a.busyText,"ok"
elseif not a.running then local mk,hq,lp=gt()if a.capHit then bu,bv=hq,"bad"else bu,bv="[stopped] "..hq,(lp=="bad")and"bad"or"idle"end
a.reason,a.level=bu,bv end b.reason.Text=bu b.bar.BackgroundColor3=kn[bv]or c.dim b.dot.BackgroundColor3=a.running and c.good or(a.capHit and c.bad or c.dim)
b.tgDot.BackgroundColor3=b.dot.BackgroundColor3 b.tgRoot.BackgroundColor3=a.hidden and c.panel2 or c.accent
b.startB.Text=a.running and"STOP"or"START"b.startB.BackgroundColor3=a.running and c.warn or c.good
local lq,lr=cN()b.sBought.Text,b.sPlaced.Text,b.sSold.Text=tostring(a.bought),tostring(a.placed),tostring(a.sold)
b.sColl.Text,b.sFree.Text=tostring(a.collected),lq.."/"..lr local hr=(a.running and d.Collect)and math.max(0,math.ceil(d.Every-(g()-a.lastCollect)))or nil
local hs=t()b.info.Text=("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
Q(T()),a.rolls,a.gifts,a.crates,hs and z(r(hs))or"nothing",h.on and("   ["..h.title.." window open]")or"",
hr and("in "..hr.."s")or"off")local aQ=e9()b.tgt.Text=(#aQ==0)and"NOTHING TICKED - open the BUTTERS tab"
or("buying: "..((#aQ<=3)and table.concat(aQ,", ")or(#aQ.." butters ticked")))b.tgt.TextColor3=(#aQ==0)and c.bad or c.good
b.padL.Text=a.manualPad and"pad: saved"or(a.padPart and("auto: "..a.padPart.Name)or"pad: not found")
b.log.Text=table.concat(by,"\n")if b.butInfo then b.butInfo.Text=("%d butters, %d rarities\n%d ticked"):format(o.n,#o.rarOrder,#aQ)
end if b.but.Visible and ec~=o.at then br(false)end end ay.SAB={S=a,CFG=d,EV=j,U=b,sg=d4,dump=gy,CAT=o,LEARN=v,buildList=br}
e(ao.." loaded")if a.uiErrs>0 then e("UI: "..a.uiErrs.." properties skipped")end bs("farm")
an()hh()if a.config and a.config~=""then b.cfgName.Text=a.config end F(b.colT,d.Collect,"COLLECT: ON","COLLECT: OFF")
F(b.sellT,d.SellJunk,"SELL THEM: ON","SELL THEM: OFF")F(b.crateT,d.Crates,"OPEN CRATES: ON","OPEN CRATES: OFF")
F(b.rejT,d.Rejoin,"AUTO REJOIN: ON","AUTO REJOIN: OFF")b.secB.Text=tostring(d.Every)pcall(hp)
task.spawn(function()local ht=df()b.rejMsg.Text=ht and("after a rejoin it restarts from\n"..ht)or
"no saved copy of this script found, so after a rejoin you would start it by hand"b.autoMsg.Text=(da(A.exec)~=nil)and"autoexec loader is installed"or"not installed yet"
pcall(iM)end)task.spawn(function()while a.alive do local ls,lt=pcall(hp)if not ls then e("UI ERR "..tostring(lt))end
task.wait(0.25)end end)task.spawn(function()local lu,lv=pcall(iW)if not lu then e("HOOK ERR "..tostring(lv))end
end)task.spawn(function()pcall(hY)if c_()then e(("catalog: %d butters in %d rarities"):format(o.n,#o.rarOrder))end
local lw,hu=pcall(jV)if lw and hu and a.alive and not a.manualPad then a.manualPad=hu end
end)task.spawn(function()while a.alive do task.wait(20)pcall(cU)end end)if hB and cy then
M(u.Idled:Connect(function()pcall(function()cy:CaptureController()cy:ClickButton2(Vector2 .new())end)end))
end task.spawn(function()a.plot=aA()a.lastCollect=g()while a.alive do if a.running then
local lx,hv=pcall(ka)if not lx and hv~=cz then e("LOOP ERR "..tostring(hv))end end task.wait(0.1)
end end)cw("loaded - window is at the top left")end local lz,es=xpcall(hz,function(ly)return tostring(ly).."\n"..debug.traceback()end)
if not lz then pcall(function()warn("SAB "..ao.." ERROR: "..tostring(es))end)cw("ERROR while starting - see the red box")
pcall(function()setclipboard("SAB "..ao.." ERROR: "..tostring(es))end)pcall(function()local hw=(type(getgenv)=="function"and getgenv())or _G
if type(hw.SAB_KILL)=="function"then hw.SAB_KILL()end for ml,lA in ipairs({"SABFarmGui","SABToggle"})do
local hx=u.PlayerGui:FindFirstChild(lA)if hx then hx:Destroy()end end end)pcall(function()
local bw=Instance.new("ScreenGui")bw.Name="SABError"bw.ResetOnSpawn=false bw.DisplayOrder=1000
local L=Instance.new("TextBox")L.Size=UDim2 .new(0,340,0,170)L.Position=UDim2 .new(0,10,0,50)
L.BackgroundColor3=Color3 .fromRGB(90,20,20)L.TextColor3=Color3 .new(1,1,1)L.TextSize=11
L.TextWrapped=true L.ClearTextOnFocus=false L.TextXAlignment=Enum.TextXAlignment.Left L.TextYAlignment=Enum.TextYAlignment.Top
L.Text="SAB "..ao.." failed to start. Send this text:\n"..tostring(es)L.Parent=bw bw.Parent=u:WaitForChild("PlayerGui")
end)end
